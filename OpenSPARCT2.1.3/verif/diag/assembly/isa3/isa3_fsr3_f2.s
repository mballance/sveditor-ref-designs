/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: isa3_fsr3_f2.s
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
.ident "Using Instruction Hash for Focus :$Id: isa3_fsr3_f2.s,v 1.1 2007/05/11 17:22:27 drp Exp $"
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
	setx	0x70FE2433004B1F0C,	%l0,	%l6
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
	set	0x7,	%g3
	set	0x7,	%g4
	set	0x0,	%g5
	set	0x4,	%g6
	set	0xC,	%g7
	!# Input registers
	set	-0xB,	%i0
	set	-0xE,	%i1
	set	-0x5,	%i2
	set	-0x2,	%i3
	set	-0xF,	%i4
	set	-0xB,	%i5
	set	-0xE,	%i6
	set	-0x2,	%i7
	!# Local registers
	set	0x351AFD78,	%l0
	set	0x373318D3,	%l1
	set	0x3FD07F23,	%l2
	set	0x1219CAD4,	%l3
	set	0x377276B5,	%l4
	set	0x4D89CC9F,	%l5
	set	0x00E51010,	%l6
	!# Output registers
	set	-0x05BA,	%o0
	set	0x018F,	%o1
	set	-0x0071,	%o2
	set	0x0D6B,	%o3
	set	-0x06AA,	%o4
	set	0x178B,	%o5
	set	-0x0B1A,	%o6
	set	0x1165,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x3E62C88BBC3DAC34)
	INIT_TH_FP_REG(%l7,%f2,0xA1C747804F025942)
	INIT_TH_FP_REG(%l7,%f4,0xAB3505B0593C5DA6)
	INIT_TH_FP_REG(%l7,%f6,0x12BD5921DF47FE4D)
	INIT_TH_FP_REG(%l7,%f8,0xE7C288BFEA6A5488)
	INIT_TH_FP_REG(%l7,%f10,0x81087582CC3F2763)
	INIT_TH_FP_REG(%l7,%f12,0xF0A1199A2D70D21F)
	INIT_TH_FP_REG(%l7,%f14,0x9E25A219C329526F)
	INIT_TH_FP_REG(%l7,%f16,0x397EEC35C2B463EC)
	INIT_TH_FP_REG(%l7,%f18,0xAB62440BCD364230)
	INIT_TH_FP_REG(%l7,%f20,0x84D471A4E747EED2)
	INIT_TH_FP_REG(%l7,%f22,0x13BB2A754191E2D7)
	INIT_TH_FP_REG(%l7,%f24,0x06985DB5031C58CB)
	INIT_TH_FP_REG(%l7,%f26,0xD52070E9E3057797)
	INIT_TH_FP_REG(%l7,%f28,0xD546E51E2E1083EC)
	INIT_TH_FP_REG(%l7,%f30,0x57249F6C01E5ADD7)
	!# Other state
	
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x72F, 	%hsys_tick_cmpr


	!# Execute Main Diag ..

	popc	0x1A53,	%g3
	udiv	%i0,	0x10F6,	%l1
	popc	0x015E,	%o0
	array16	%o6,	%l5,	%g4
	movge	%xcc,	%i6,	%i3
	movne	%xcc,	%i4,	%o3
	fands	%f3,	%f24,	%f29
	udivx	%l6,	0x12FB,	%g5
	ldstub	[%l7 + 0x1B],	%i5
	edge32l	%l3,	%l2,	%g2
	mulx	%o7,	0x1705,	%i7
	fsrc1	%f12,	%f10
	movgu	%xcc,	%l0,	%o4
	mulx	%g6,	%o5,	%o2
	tcc	%xcc,	0x5
	lduh	[%l7 + 0x38],	%i1
	flush	%l7 + 0x2C
	subc	%o1,	0x018A,	%g1
	fmovrdgez	%g7,	%f16,	%f18
	brgz,a	%l4,	loop_1
	fmovdneg	%xcc,	%f24,	%f0
	alignaddr	%i2,	%g3,	%i0
	edge16l	%l1,	%o6,	%l5
loop_1:
	array16	%g4,	%o0,	%i6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tl	%xcc,	0x4
	ldd	[%l7 + 0x40],	%i4
	bcc,pn	%icc,	loop_2
	fandnot1	%f14,	%f26,	%f10
	movrgez	%i3,	0x302,	%o3
	andcc	%g5,	0x065F,	%i5
loop_2:
	edge16	%l6,	%l2,	%l3
	alignaddr	%o7,	%g2,	%l0
	sethi	0x03B4,	%o4
	subccc	%i7,	%o5,	%o2
	nop
	fitos	%f4,	%f3
	set	0x40, %l3
	stda	%f16,	[%l7 + %l3] 0x16
	membar	#Sync
	movne	%xcc,	%i1,	%g6
	bg,pn	%icc,	loop_3
	movcs	%xcc,	%o1,	%g7
	fmovde	%xcc,	%f3,	%f9
	fbul	%fcc3,	loop_4
loop_3:
	srax	%g1,	%l4,	%g3
	addc	%i2,	%i0,	%o6
	fmovdl	%xcc,	%f21,	%f28
loop_4:
	srlx	%l1,	%g4,	%o0
	movle	%icc,	%i6,	%i4
	mova	%xcc,	%i3,	%l5
	edge8l	%g5,	%o3,	%i5
	umul	%l6,	%l2,	%l3
	set	0x12, %o4
	ldstuba	[%l7 + %o4] 0x0c,	%o7
	sdiv	%l0,	0x17E4,	%o4
	move	%icc,	%i7,	%g2
	edge16	%o5,	%i1,	%g6
	wr	%g0,	0x04,	%asi
	stha	%o2,	[%l7 + 0x76] %asi
	fnot1	%f6,	%f28
	xnorcc	%o1,	%g1,	%l4
	udiv	%g3,	0x0827,	%i2
	brlz	%g7,	loop_5
	fbge,a	%fcc2,	loop_6
	fmovdvc	%icc,	%f1,	%f16
	brgz	%i0,	loop_7
loop_5:
	tcc	%xcc,	0x2
loop_6:
	brgz,a	%l1,	loop_8
	call	loop_9
loop_7:
	udivx	%o6,	0x0761,	%o0
	bg,pn	%xcc,	loop_10
loop_8:
	addccc	%i6,	%g4,	%i4
loop_9:
	ldub	[%l7 + 0x30],	%i3
	bne,a,pn	%icc,	loop_11
loop_10:
	array32	%g5,	%o3,	%i5
	sllx	%l6,	%l2,	%l5
	fand	%f26,	%f28,	%f0
loop_11:
	edge16l	%o7,	%l0,	%o4
	pdist	%f28,	%f2,	%f4
	brgz	%i7,	loop_12
	nop
	fitos	%f12,	%f18
	fstod	%f18,	%f30
	edge32	%l3,	%o5,	%g2
	movrgez	%g6,	0x11A,	%o2
loop_12:
	fmovsne	%xcc,	%f2,	%f7
	edge8n	%o1,	%i1,	%g1
	tl	%xcc,	0x6
	subcc	%g3,	0x1D42,	%l4
	wr	%g0,	0x11,	%asi
	ldsba	[%l7 + 0x7A] %asi,	%g7
	taddcctv	%i2,	%i0,	%l1
	array16	%o6,	%o0,	%g4
	st	%f7,	[%l7 + 0x2C]
	fornot1s	%f3,	%f1,	%f4
	te	%icc,	0x3
	edge16l	%i6,	%i3,	%i4
	movpos	%xcc,	%g5,	%o3
	movn	%icc,	%l6,	%l2
	bgu,pn	%xcc,	loop_13
	bpos,a,pt	%xcc,	loop_14
	umulcc	%l5,	%o7,	%i5
	bg,a,pt	%xcc,	loop_15
loop_13:
	ta	%xcc,	0x6
loop_14:
	fmovdvs	%xcc,	%f23,	%f30
	edge32l	%o4,	%l0,	%i7
loop_15:
	smul	%o5,	0x0830,	%g2
	tge	%icc,	0x2
	fbg,a	%fcc1,	loop_16
	xorcc	%g6,	%o2,	%o1
	movg	%xcc,	%l3,	%g1
	movpos	%xcc,	%i1,	%g3
loop_16:
	mova	%icc,	%l4,	%i2
	bn,pn	%icc,	loop_17
	nop
	fitod	%f12,	%f0
	fdtoi	%f0,	%f20
	tvs	%icc,	0x6
	edge8ln	%i0,	%l1,	%g7
loop_17:
	tneg	%xcc,	0x2
	bg	%icc,	loop_18
	edge32ln	%o6,	%o0,	%i6
	nop
	fitos	%f11,	%f18
	edge8l	%i3,	%i4,	%g5
loop_18:
	ta	%xcc,	0x2
	movcc	%icc,	%g4,	%o3
	addcc	%l6,	0x0B39,	%l5
	xor	%l2,	%i5,	%o4
	set	0x0E, %g2
	ldstuba	[%l7 + %g2] 0x80,	%l0
	movge	%icc,	%i7,	%o7
	fbg,a	%fcc2,	loop_19
	edge16	%g2,	%o5,	%g6
	fblg,a	%fcc2,	loop_20
	edge32l	%o2,	%l3,	%o1
loop_19:
	sdivcc	%i1,	0x15E6,	%g1
	movre	%g3,	%i2,	%l4
loop_20:
	fbule	%fcc0,	loop_21
	orcc	%i0,	%l1,	%g7
	edge32	%o6,	%o0,	%i6
	te	%xcc,	0x3
loop_21:
	nop
	set	0x20, %l1
	ldda	[%l7 + %l1] 0x2f,	%i4
	fornot1	%f24,	%f8,	%f20
	fcmple16	%f8,	%f8,	%g5
	udivcc	%i3,	0x07EA,	%o3
	andncc	%g4,	%l6,	%l5
	movleu	%xcc,	%l2,	%o4
	edge32	%l0,	%i7,	%o7
	fbn,a	%fcc2,	loop_22
	stb	%i5,	[%l7 + 0x32]
	andncc	%g2,	%o5,	%g6
	andncc	%o2,	%o1,	%l3
loop_22:
	movvs	%xcc,	%g1,	%i1
	set	0x20, %o6
	ldda	[%l7 + %o6] 0x26,	%g2
	edge32ln	%l4,	%i0,	%i2
	set	0x30, %i0
	ldsha	[%l7 + %i0] 0x15,	%l1
	fors	%f11,	%f28,	%f7
	tgu	%icc,	0x5
	bne,a	%icc,	loop_23
	be	%xcc,	loop_24
	srl	%o6,	%g7,	%o0
	fbne,a	%fcc1,	loop_25
loop_23:
	edge8ln	%i4,	%i6,	%g5
loop_24:
	movrgz	%o3,	0x16B,	%i3
	movvc	%icc,	%g4,	%l6
loop_25:
	movrgez	%l5,	%l2,	%o4
	fpadd32	%f10,	%f16,	%f16
	andcc	%i7,	%o7,	%i5
	srax	%l0,	0x18,	%g2
	bcc,a,pn	%xcc,	loop_26
	mulscc	%o5,	%g6,	%o1
	bcs,a,pn	%icc,	loop_27
	fmovrsgz	%o2,	%f5,	%f25
loop_26:
	ldx	[%l7 + 0x08],	%g1
	fcmple32	%f0,	%f16,	%l3
loop_27:
	fandnot2s	%f4,	%f19,	%f7
	movg	%xcc,	%i1,	%g3
	edge16ln	%l4,	%i0,	%l1
	mulscc	%i2,	%g7,	%o0
	movgu	%xcc,	%o6,	%i6
	fpsub16s	%f1,	%f22,	%f16
	movre	%i4,	0x3E6,	%g5
	fpsub16s	%f17,	%f6,	%f29
	set	0x60, %o2
	lda	[%l7 + %o2] 0x88,	%f6
	sir	0x0A12
	tl	%xcc,	0x6
	taddcctv	%i3,	0x1073,	%g4
	nop
	setx	0xE4982494ADE8C880,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0x55123062AA487A20,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	fmuld	%f26,	%f4,	%f4
	fbge,a	%fcc1,	loop_28
	tcc	%xcc,	0x0
	alignaddrl	%l6,	%o3,	%l5
	fnot2	%f28,	%f12
loop_28:
	movrgez	%o4,	%i7,	%o7
	movpos	%xcc,	%l2,	%i5
	stx	%l0,	[%l7 + 0x50]
	bl,a	loop_29
	xor	%g2,	0x168E,	%o5
	set	0x42, %g4
	ldsha	[%l7 + %g4] 0x18,	%g6
loop_29:
	prefetch	[%l7 + 0x28],	 0x1
	tcs	%xcc,	0x5
	edge16ln	%o2,	%g1,	%l3
	array8	%o1,	%i1,	%l4
	subcc	%i0,	%g3,	%l1
	tne	%xcc,	0x4
	fsrc2s	%f19,	%f23
	add	%i2,	%g7,	%o0
	nop
	set	0x48, %i1
	std	%f4,	[%l7 + %i1]
	tpos	%icc,	0x2
	movrlz	%o6,	%i6,	%i4
	wr	%g0,	0x18,	%asi
	sta	%f9,	[%l7 + 0x3C] %asi
	brlz	%g5,	loop_30
	fmovdne	%icc,	%f18,	%f8
	fbuge,a	%fcc2,	loop_31
	edge32	%i3,	%l6,	%g4
loop_30:
	taddcc	%l5,	0x0905,	%o4
	edge32ln	%i7,	%o7,	%l2
loop_31:
	ldx	[%l7 + 0x58],	%i5
	stbar
	fmovscc	%icc,	%f19,	%f25
	nop
	setx	0x2DAAEB6D40A204F0,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0xD84FA1FD2904481E,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	fmuld	%f28,	%f4,	%f26
	tpos	%xcc,	0x3
	sdivx	%l0,	0x01AA,	%g2
	fmul8ulx16	%f22,	%f14,	%f8
	lduw	[%l7 + 0x3C],	%o5
	sdivx	%g6,	0x1003,	%o2
	tvs	%icc,	0x1
	edge8n	%g1,	%o3,	%l3
	xnor	%i1,	0x162D,	%o1
	movg	%icc,	%i0,	%g3
	flush	%l7 + 0x0C
	edge8	%l1,	%l4,	%g7
	sdivx	%i2,	0x123B,	%o6
	smul	%o0,	0x1BC2,	%i6
	bleu,a	loop_32
	mova	%xcc,	%i4,	%g5
	fmovrslz	%i3,	%f15,	%f9
	fbule,a	%fcc0,	loop_33
loop_32:
	lduw	[%l7 + 0x1C],	%g4
	add	%l7,	0x40,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%l5
	casxa	[%l6] %asi,	%l5,	%o4
loop_33:
	andn	%l6,	%i7,	%o7
	bcs,a,pn	%xcc,	loop_34
	edge8ln	%l2,	%l0,	%i5
	tn	%xcc,	0x7
	stbar
loop_34:
	edge16n	%o5,	%g6,	%g2
	bpos	loop_35
	stw	%o2,	[%l7 + 0x2C]
	wr	%g0,	0x04,	%asi
	sta	%f27,	[%l7 + 0x20] %asi
loop_35:
	edge16l	%g1,	%o3,	%i1
	edge32	%o1,	%i0,	%g3
	movrne	%l3,	%l4,	%g7
	edge16	%i2,	%l1,	%o6
	movcc	%xcc,	%o0,	%i6
	edge8l	%g5,	%i4,	%i3
	nop
	setx	0xAE26FCB53E11470A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0x41D324658B917504,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	fdivd	%f24,	%f24,	%f12
	movvs	%xcc,	%l5,	%o4
	nop
	setx	0x65F19848,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f18
	setx	0x28BC2DC0,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f20
	fdivs	%f20,	%f18,	%f19
	smulcc	%g4,	%i7,	%o7
	fmovdcc	%icc,	%f17,	%f2
	addcc	%l2,	0x1FF7,	%l0
	fcmple16	%f2,	%f16,	%i5
	tg	%xcc,	0x0
	te	%xcc,	0x1
	tl	%icc,	0x4
	mulx	%o5,	0x051D,	%g6
	edge32	%l6,	%o2,	%g1
	lduw	[%l7 + 0x1C],	%g2
	tsubcc	%o3,	0x1D52,	%o1
	andncc	%i1,	%i0,	%g3
	fbn	%fcc2,	loop_36
	fmuld8ulx16	%f29,	%f22,	%f20
	fpsub32s	%f18,	%f23,	%f21
	mulscc	%l3,	%l4,	%g7
loop_36:
	tcs	%xcc,	0x0
	sdiv	%i2,	0x1EBE,	%o6
	udivcc	%o0,	0x0B62,	%l1
	fnegs	%f4,	%f30
	fbue,a	%fcc0,	loop_37
	movge	%icc,	%g5,	%i6
	mova	%icc,	%i3,	%l5
	mulscc	%i4,	%g4,	%i7
loop_37:
	mova	%xcc,	%o7,	%o4
	fmovdpos	%icc,	%f29,	%f3
	set	0x70, %l4
	lduba	[%l7 + %l4] 0x04,	%l2
	udivx	%i5,	0x1FCE,	%l0
	fxor	%f30,	%f16,	%f2
	sethi	0x1EA5,	%g6
	tne	%xcc,	0x5
	bn,a,pn	%xcc,	loop_38
	flush	%l7 + 0x5C
	sdivcc	%o5,	0x157C,	%l6
	taddcc	%g1,	0x07AC,	%g2
loop_38:
	nop
	wr	%g0,	0x0c,	%asi
	ldstuba	[%l7 + 0x0B] %asi,	%o3
	brz	%o2,	loop_39
	fnegs	%f4,	%f6
	fbu,a	%fcc1,	loop_40
	fcmpgt16	%f6,	%f8,	%o1
loop_39:
	fors	%f4,	%f1,	%f4
	sll	%i1,	%i0,	%l3
loop_40:
	taddcc	%l4,	0x036E,	%g3
	fmovsl	%xcc,	%f21,	%f31
	addcc	%i2,	0x0A3B,	%o6
	tvs	%xcc,	0x0
	tg	%icc,	0x3
	sub	%g7,	%o0,	%l1
	mulscc	%i6,	%g5,	%l5
	set	0x70, %g3
	lduha	[%l7 + %g3] 0x15,	%i4
	tvc	%xcc,	0x6
	addccc	%g4,	0x1389,	%i3
	orncc	%i7,	%o4,	%o7
	movrlez	%i5,	0x193,	%l2
	fmovsvs	%xcc,	%f23,	%f10
	wr	%g0,	0x80,	%asi
	swapa	[%l7 + 0x28] %asi,	%g6
	wr	%g0,	0x11,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	brnz	%l0,	loop_41
	tne	%icc,	0x5
	edge16n	%l6,	%o5,	%g1
	be,a	loop_42
loop_41:
	movneg	%xcc,	%o3,	%g2
	smulcc	%o1,	%i1,	%i0
	fmovde	%icc,	%f18,	%f31
loop_42:
	nop
	add	%l7,	0x10,	%l6
	wr	%g0,	0x19,	%asi
	ldxa	[%l6] %asi,	%l3
	casxa	[%l6] %asi,	%l3,	%l4
	add	%o2,	0x0160,	%g3
	srlx	%o6,	0x0B,	%g7
	sdivx	%i2,	0x1000,	%l1
	tle	%icc,	0x7
	movl	%xcc,	%i6,	%g5
	movn	%xcc,	%o0,	%i4
	edge8l	%g4,	%l5,	%i3
	tcc	%icc,	0x3
	movneg	%xcc,	%i7,	%o7
	tg	%xcc,	0x1
	tne	%icc,	0x3
	umul	%o4,	%i5,	%g6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tvs	%icc,	0x7
	ldd	[%l7 + 0x50],	%f14
	nop
	setx	loop_43,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	umul	%l2,	0x06DD,	%l0
	wr	%g0,	0x2b,	%asi
	stha	%o5,	[%l7 + 0x36] %asi
	membar	#Sync
loop_43:
	nop
	setx	0xE05CB2D6,	%l0,	%l6
	st	%l6,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%fsr
	mova	%xcc,	%g1,	%o3
	fbl	%fcc2,	loop_44
	movvc	%xcc,	%l6,	%o1
	addccc	%g2,	0x08D0,	%i1
	fmovscc	%icc,	%f25,	%f11
loop_44:
	ble,a,pt	%icc,	loop_45
	movl	%xcc,	%l3,	%i0
	bne,a,pn	%icc,	loop_46
	fcmple32	%f30,	%f30,	%l4
loop_45:
	fbo	%fcc1,	loop_47
	movrlez	%o2,	0x2E2,	%o6
loop_46:
	andncc	%g7,	%g3,	%i2
	udivcc	%i6,	0x0D9D,	%g5
loop_47:
	array8	%o0,	%i4,	%g4
	umul	%l5,	%l1,	%i7
	fpadd16	%f0,	%f24,	%f8
	sdivcc	%i3,	0x1F7F,	%o7
	fpack32	%f26,	%f2,	%f26
	movrgz	%o4,	%g6,	%i5
	movrne	%l0,	%o5,	%l2
	orcc	%o3,	%l6,	%g1
	ble,pn	%xcc,	loop_48
	mulscc	%g2,	%i1,	%l3
	stb	%o1,	[%l7 + 0x56]
	movrgz	%i0,	0x364,	%o2
loop_48:
	fbule,a	%fcc0,	loop_49
	movrgez	%l4,	0x060,	%o6
	tne	%icc,	0x5
	udivx	%g7,	0x0D8F,	%g3
loop_49:
	swap	[%l7 + 0x70],	%i2
	movrgz	%g5,	0x0B0,	%o0
	fbu,a	%fcc0,	loop_50
	nop
	fitos	%f5,	%f15
	fstox	%f15,	%f8
	fxtos	%f8,	%f31
	bpos,a,pt	%xcc,	loop_51
	movne	%icc,	%i6,	%i4
loop_50:
	fbu	%fcc2,	loop_52
	fbge	%fcc3,	loop_53
loop_51:
	movrlez	%l5,	0x15E,	%g4
	mova	%xcc,	%i7,	%i3
loop_52:
	or	%l1,	%o4,	%o7
loop_53:
	sllx	%i5,	%l0,	%o5
	fbn	%fcc3,	loop_54
	addccc	%g6,	%o3,	%l6
	tvs	%icc,	0x6
	set	0x08, %o1
	stba	%l2,	[%l7 + %o1] 0x18
loop_54:
	tsubcc	%g1,	%i1,	%g2
	tsubcc	%o1,	%l3,	%o2
	tcs	%xcc,	0x0
	sll	%i0,	0x1B,	%o6
	move	%xcc,	%g7,	%l4
	set	0x40, %g7
	stxa	%i2,	[%l7 + %g7] 0x15
	movne	%xcc,	%g3,	%o0
	andcc	%i6,	%g5,	%i4
	movge	%icc,	%l5,	%g4
	sdiv	%i7,	0x0533,	%l1
	mulx	%o4,	0x0A4E,	%i3
	nop
	fitos	%f31,	%f10
	te	%xcc,	0x2
	movleu	%xcc,	%i5,	%o7
	movl	%icc,	%l0,	%o5
	udiv	%o3,	0x0B6F,	%l6
	popc	%l2,	%g6
	tpos	%icc,	0x7
	tsubcctv	%g1,	%g2,	%i1
	nop
	setx	0x0CEDC33C0040FF97,	%l0,	%l6
	stx	%l6,	[%l7 + 0x40]
	ldx	[%l7 + 0x40],	%fsr
	bge	loop_55
	edge8n	%o1,	%o2,	%l3
	fmul8ulx16	%f6,	%f26,	%f6
	edge16ln	%i0,	%o6,	%l4
loop_55:
	movrlz	%g7,	%i2,	%g3
	smulcc	%o0,	%i6,	%g5
	mulscc	%i4,	0x09A9,	%l5
	ld	[%l7 + 0x38],	%f25
	fbul,a	%fcc3,	loop_56
	srl	%g4,	0x06,	%i7
	fandnot2	%f12,	%f8,	%f2
	tle	%xcc,	0x7
loop_56:
	nop
	fitod	%f12,	%f0
	fdtoi	%f0,	%f18
	set	0x6C, %o0
	ldswa	[%l7 + %o0] 0x88,	%l1
	movcs	%icc,	%i3,	%i5
	mulscc	%o7,	%l0,	%o4
	add	%o5,	0x07BA,	%o3
	edge32ln	%l2,	%l6,	%g6
	wr	%g0,	0x50,	%asi
	ldxa	[%g0 + 0x30] %asi,	%g2
	udivx	%i1,	0x0145,	%o1
	movrgez	%g1,	%l3,	%i0
	edge8ln	%o6,	%l4,	%g7
	movrne	%o2,	0x3C9,	%i2
	mulscc	%g3,	%i6,	%o0
	te	%icc,	0x2
	fornot2s	%f18,	%f8,	%f31
	add	%l7,	0x78,	%l6
	wr	%g0,	0x19,	%asi
	casa	[%l6] %asi,	%g5,	%l5
	tgu	%xcc,	0x4
	fcmpeq16	%f28,	%f14,	%i4
	array32	%i7,	%l1,	%i3
	srax	%i5,	0x0B,	%o7
	tsubcc	%l0,	0x1545,	%g4
	edge8	%o5,	%o4,	%o3
	fbue	%fcc3,	loop_57
	tneg	%icc,	0x5
	fbuge	%fcc2,	loop_58
	movvs	%icc,	%l2,	%l6
loop_57:
	prefetch	[%l7 + 0x10],	 0x3
	sub	%g2,	0x0190,	%i1
loop_58:
	ldx	[%l7 + 0x58],	%o1
	fpsub32	%f20,	%f10,	%f6
	movleu	%xcc,	%g1,	%l3
	fmovdneg	%xcc,	%f21,	%f18
	tl	%icc,	0x4
	movrlz	%g6,	%i0,	%o6
	srl	%g7,	0x05,	%l4
	tle	%xcc,	0x5
	addc	%i2,	%o2,	%g3
	srax	%i6,	0x0D,	%o0
	edge8n	%l5,	%i4,	%g5
	fmovdcc	%icc,	%f27,	%f1
	movvs	%icc,	%l1,	%i3
	fpsub32s	%f6,	%f13,	%f27
	udivcc	%i7,	0x0345,	%o7
	fexpand	%f3,	%f14
	alignaddr	%i5,	%g4,	%o5
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
	sllx	%l0,	0x10,	%o3
	nop
	setx loop_60, %l0, %l1
	jmpl %l1, %l2
	movl	%xcc,	%o4,	%l6
loop_59:
	fbul	%fcc1,	loop_61
	array8	%i1,	%g2,	%g1
loop_60:
	movl	%icc,	%l3,	%o1
	mova	%xcc,	%i0,	%g6
loop_61:
	movvc	%icc,	%o6,	%l4
	edge8ln	%g7,	%o2,	%i2
	fmovsl	%xcc,	%f10,	%f24
	udivx	%g3,	0x035E,	%o0
	movrne	%l5,	%i6,	%i4
	fmovrdgez	%g5,	%f18,	%f4
	orcc	%l1,	0x133E,	%i3
	fba,a	%fcc2,	loop_62
	sdivx	%o7,	0x182E,	%i7
	tgu	%icc,	0x0
	orn	%g4,	%o5,	%i5
loop_62:
	movrne	%o3,	%l2,	%o4
	tgu	%icc,	0x7
	andcc	%l6,	%i1,	%l0
	fbge,a	%fcc0,	loop_63
	tg	%xcc,	0x2
	subc	%g1,	%l3,	%o1
	popc	0x02CC,	%g2
loop_63:
	udiv	%i0,	0x1F5F,	%g6
	fornot2	%f18,	%f6,	%f20
	set	0x45, %l6
	lduba	[%l7 + %l6] 0x19,	%l4
	add	%l7,	0x08,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%g7
	casxa	[%l6] %asi,	%g7,	%o6
	set	0x5B, %i7
	ldstuba	[%l7 + %i7] 0x81,	%i2
	nop
	fitos	%f11,	%f23
	fstox	%f23,	%f16
	fxtos	%f16,	%f30
	fmovdleu	%xcc,	%f1,	%f1
	st	%f3,	[%l7 + 0x58]
	tn	%icc,	0x1
	add	%o2,	0x01CA,	%g3
	fmovdcc	%icc,	%f27,	%f3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udivx	%o0,	0x134C,	%l5
	smul	%i6,	%i4,	%l1
	array32	%i3,	%o7,	%i7
	edge16	%g4,	%o5,	%i5
	and	%g5,	%l2,	%o3
	alignaddrl	%o4,	%i1,	%l6
	add	%g1,	%l0,	%o1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orn	%l3,	%i0,	%g2
	ldsw	[%l7 + 0x64],	%l4
	andn	%g7,	%o6,	%i2
	pdist	%f22,	%f2,	%f12
	movcs	%xcc,	%o2,	%g3
	fandnot2s	%f5,	%f28,	%f3
	nop
	setx	loop_64,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	edge8ln	%o0,	%l5,	%g6
	tne	%xcc,	0x0
	ldd	[%l7 + 0x30],	%i4
loop_64:
	bleu	loop_65
	tsubcctv	%l1,	0x0B80,	%i3
	tl	%icc,	0x6
	tpos	%icc,	0x1
loop_65:
	subc	%i6,	%o7,	%g4
	udivcc	%o5,	0x1A13,	%i7
	bgu	loop_66
	edge16	%g5,	%l2,	%i5
	xnorcc	%o3,	%i1,	%o4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_66:
	fmovdvs	%xcc,	%f30,	%f22
	alignaddrl	%g1,	%l6,	%l0
	fcmple32	%f8,	%f30,	%o1
	fxors	%f16,	%f26,	%f26
	movrgz	%l3,	%g2,	%i0
	subc	%l4,	%o6,	%i2
	mulscc	%o2,	%g3,	%g7
	edge32l	%l5,	%g6,	%o0
	movleu	%icc,	%l1,	%i3
	te	%icc,	0x2
	brlz,a	%i6,	loop_67
	fmovsge	%icc,	%f10,	%f13
	popc	0x035F,	%o7
	fmovrdne	%g4,	%f18,	%f22
loop_67:
	movn	%icc,	%i4,	%o5
	nop
	setx	0xF055CA2C,	%l0,	%l6
	st	%l6,	[%l7 + 0x5C]
	ld	[%l7 + 0x5C],	%fsr
	movne	%xcc,	%g5,	%i7
	ta	%xcc,	0x3
	fnot2	%f20,	%f16
	wr	%g0,	0x2b,	%asi
	stha	%l2,	[%l7 + 0x44] %asi
	membar	#Sync
	edge8	%i5,	%i1,	%o4
	addccc	%g1,	0x15A1,	%o3
	fmovdne	%icc,	%f5,	%f23
	and	%l0,	%l6,	%l3
	srl	%o1,	%i0,	%l4
	stbar
	sdivcc	%g2,	0x16D2,	%o6
	bpos	%xcc,	loop_68
	tle	%xcc,	0x6
	membar	#Sync
	wr	%g0,	0xf8,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
loop_68:
	bg,pt	%icc,	loop_69
	add	%i2,	%g3,	%o2
	tcc	%xcc,	0x2
	orn	%g7,	0x1D4B,	%l5
loop_69:
	fbule	%fcc0,	loop_70
	ta	%xcc,	0x2
	nop
	set	0x2C, %o7
	ldsw	[%l7 + %o7],	%g6
	nop
	setx	0xAEE542EB,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f22
	setx	0x513E7DF4,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f29
	fdivs	%f29,	%f22,	%f21
loop_70:
	udiv	%o0,	0x17ED,	%i3
	alignaddr	%i6,	%l1,	%g4
	brgz,a	%o7,	loop_71
	fmovrdne	%o5,	%f30,	%f0
	udiv	%i4,	0x1768,	%g5
	nop
	set	0x5C, %l5
	stw	%i7,	[%l7 + %l5]
loop_71:
	edge32l	%i5,	%i1,	%o4
	taddcc	%g1,	0x0B65,	%o3
	prefetch	[%l7 + 0x28],	 0x1
	popc	0x1F2B,	%l0
	move	%icc,	%l6,	%l3
	fbu	%fcc1,	loop_72
	fxor	%f22,	%f10,	%f0
	subccc	%o1,	0x1E4A,	%l2
	tleu	%xcc,	0x6
loop_72:
	tpos	%xcc,	0x0
	set	0x48, %i4
	ldswa	[%l7 + %i4] 0x15,	%l4
	movpos	%xcc,	%g2,	%o6
	tcs	%icc,	0x2
	movcs	%xcc,	%i0,	%i2
	fmovrdgz	%g3,	%f26,	%f4
	fone	%f6
	nop
	setx loop_73, %l0, %l1
	jmpl %l1, %o2
	fmovsgu	%xcc,	%f24,	%f19
	mulscc	%g7,	%g6,	%o0
	tge	%xcc,	0x6
loop_73:
	tcc	%xcc,	0x4
	and	%i3,	0x1072,	%l5
	fors	%f9,	%f10,	%f6
	smulcc	%l1,	%i6,	%o7
	movneg	%xcc,	%g4,	%i4
	bcc,a	loop_74
	nop
	setx	0x7D575EA3576FD63D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0x8A270A5A85AC86EA,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	fdivd	%f4,	%f8,	%f22
	fmovsl	%xcc,	%f1,	%f16
	edge16l	%o5,	%g5,	%i5
loop_74:
	tne	%xcc,	0x2
	mulscc	%i1,	0x0863,	%o4
	sdivcc	%g1,	0x0534,	%o3
	lduw	[%l7 + 0x50],	%l0
	membar	0x57
	nop
	fitos	%f13,	%f7
	fstox	%f7,	%f6
	wr	%g0,	0x2f,	%asi
	stwa	%i7,	[%l7 + 0x48] %asi
	membar	#Sync
	edge16	%l6,	%l3,	%o1
	tle	%xcc,	0x1
	movvc	%icc,	%l2,	%l4
	add	%l7,	0x4C,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] %asi,	%g2,	%o6
	bgu,a,pn	%icc,	loop_75
	and	%i0,	0x067E,	%i2
	fmovdpos	%xcc,	%f30,	%f25
	set	0x44, %o5
	swapa	[%l7 + %o5] 0x0c,	%o2
loop_75:
	fmovrdne	%g7,	%f18,	%f8
	tpos	%icc,	0x1
	fmovdcc	%xcc,	%f1,	%f30
	alignaddrl	%g6,	%g3,	%o0
	fmovdle	%icc,	%f31,	%f29
	wr	%g0,	0x89,	%asi
	lduwa	[%l7 + 0x20] %asi,	%l5
	bgu,a	%xcc,	loop_76
	movne	%icc,	%i3,	%l1
	addcc	%o7,	0x1D0D,	%g4
	edge16	%i4,	%o5,	%i6
loop_76:
	edge16l	%i5,	%g5,	%o4
	movne	%xcc,	%g1,	%i1
	fmul8ulx16	%f2,	%f10,	%f18
	movl	%icc,	%l0,	%i7
	mova	%xcc,	%o3,	%l3
	movl	%icc,	%o1,	%l6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x40, %o3
	lda	[%l7 + %o3] 0x18,	%f10
	alignaddr	%l4,	%l2,	%g2
	tpos	%xcc,	0x5
	edge8n	%i0,	%o6,	%o2
	andncc	%i2,	%g6,	%g7
	movge	%icc,	%g3,	%l5
	fmul8ulx16	%f24,	%f8,	%f0
	fors	%f17,	%f30,	%f10
	edge32	%o0,	%l1,	%i3
	movcs	%icc,	%g4,	%i4
	sub	%o7,	%o5,	%i6
	set	0x44, %l2
	sta	%f4,	[%l7 + %l2] 0x11
	tg	%xcc,	0x0
	movrgz	%g5,	0x045,	%o4
	tcs	%xcc,	0x6
	movrgz	%g1,	0x262,	%i5
	wr	%g0,	0x89,	%asi
	ldsha	[%l7 + 0x28] %asi,	%i1
	xnor	%i7,	0x0B4C,	%l0
	edge32n	%l3,	%o1,	%l6
	movvs	%icc,	%o3,	%l2
	movrne	%g2,	%i0,	%o6
	tgu	%icc,	0x4
	movne	%xcc,	%l4,	%o2
	and	%g6,	0x0CA5,	%i2
	fmovdneg	%icc,	%f6,	%f2
	fmul8x16al	%f21,	%f31,	%f10
	nop
	fitos	%f5,	%f2
	edge8n	%g7,	%g3,	%o0
	srlx	%l1,	%i3,	%g4
	movrgz	%l5,	0x277,	%o7
	sir	0x1193
	edge8n	%o5,	%i6,	%i4
	edge32l	%o4,	%g1,	%g5
	tle	%xcc,	0x5
	fmovsgu	%icc,	%f27,	%f6
	movrgez	%i5,	%i1,	%i7
	xor	%l3,	0x1CFE,	%o1
	bne	%xcc,	loop_77
	and	%l6,	%o3,	%l2
	brgz	%l0,	loop_78
	edge16l	%g2,	%i0,	%l4
loop_77:
	tsubcctv	%o6,	%g6,	%i2
	udiv	%g7,	0x015C,	%o2
loop_78:
	srl	%g3,	%l1,	%i3
	nop
	setx	0x2F3646EC4FD5AE38,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	fsqrtd	%f2,	%f16
	fsrc2s	%f14,	%f6
	brnz	%g4,	loop_79
	nop
	setx	0x1BA9BF51204F318C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x68]
	ldx	[%l7 + 0x68],	%fsr
	ldsb	[%l7 + 0x1F],	%o0
	array8	%l5,	%o7,	%i6
loop_79:
	edge32	%i4,	%o4,	%o5
	ldx	[%l7 + 0x18],	%g1
	sub	%i5,	0x1574,	%g5
	tcs	%icc,	0x6
	sdivcc	%i1,	0x07A5,	%i7
	alignaddrl	%o1,	%l3,	%o3
	stbar
	fbe,a	%fcc1,	loop_80
	nop
	setx loop_81, %l0, %l1
	jmpl %l1, %l2
	alignaddr	%l6,	%g2,	%l0
	sra	%i0,	0x00,	%l4
loop_80:
	fmovsle	%icc,	%f21,	%f18
loop_81:
	fbul,a	%fcc2,	loop_82
	movrlez	%g6,	0x02A,	%i2
	popc	%o6,	%o2
	tge	%icc,	0x6
loop_82:
	fbne,a	%fcc0,	loop_83
	movge	%icc,	%g3,	%g7
	tl	%xcc,	0x3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_83:
	stw	%i3,	[%l7 + 0x1C]
	brgz	%g4,	loop_84
	fcmpeq32	%f2,	%f2,	%l1
	movne	%icc,	%o0,	%l5
	tge	%icc,	0x1
loop_84:
	fbule,a	%fcc3,	loop_85
	srl	%i6,	0x12,	%o7
	fbn,a	%fcc0,	loop_86
	bn,a	%icc,	loop_87
loop_85:
	fpsub32	%f22,	%f2,	%f20
	fors	%f11,	%f14,	%f5
loop_86:
	nop
	set	0x40, %i3
	stda	%f16,	[%l7 + %i3] 0xf8
	membar	#Sync
loop_87:
	alignaddrl	%i4,	%o5,	%g1
	fpadd32	%f10,	%f18,	%f2
	move	%xcc,	%o4,	%i5
	tvs	%icc,	0x3
	fmovrse	%g5,	%f10,	%f4
	sdiv	%i1,	0x0D86,	%o1
	fsrc2	%f24,	%f2
	subcc	%l3,	%i7,	%l2
	ldd	[%l7 + 0x18],	%i6
	smulcc	%o3,	0x00CB,	%l0
	bn,a,pn	%icc,	loop_88
	bl,pt	%xcc,	loop_89
	tn	%icc,	0x5
	fmovrsgez	%g2,	%f16,	%f29
loop_88:
	brnz	%i0,	loop_90
loop_89:
	alignaddrl	%g6,	%i2,	%l4
	edge16	%o6,	%g3,	%o2
	nop
	fitos	%f10,	%f16
	fstoi	%f16,	%f9
loop_90:
	xor	%i3,	%g4,	%l1
	set	0x68, %g5
	stwa	%o0,	[%l7 + %g5] 0xeb
	membar	#Sync
	movleu	%icc,	%l5,	%g7
	wr	%g0,	0x89,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	alignaddrl	%o7,	%i4,	%o5
	be,a,pn	%icc,	loop_91
	lduh	[%l7 + 0x2A],	%g1
	subccc	%o4,	%i5,	%g5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_91:
	taddcctv	%i1,	%o1,	%l3
	subccc	%i7,	%l2,	%l6
	tvc	%xcc,	0x3
	taddcc	%o3,	%i6,	%g2
	movrgz	%l0,	%g6,	%i0
	stx	%l4,	[%l7 + 0x30]
	sdivcc	%i2,	0x0044,	%o6
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
	tcs	%xcc,	0x5
	umul	%o2,	%i3,	%g3
	bne	loop_93
loop_92:
	udivx	%g4,	0x1AFF,	%o0
	movge	%icc,	%l5,	%g7
	taddcctv	%l1,	%o7,	%i4
loop_93:
	movcc	%icc,	%g1,	%o4
	ld	[%l7 + 0x3C],	%f15
	taddcc	%i5,	0x1B27,	%g5
	tgu	%icc,	0x2
	addc	%o5,	0x1498,	%o1
	movrne	%i1,	%l3,	%l2
	movn	%xcc,	%i7,	%o3
	xorcc	%l6,	0x0150,	%i6
	nop
	setx	0xBBE44B71,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f2
	setx	0x7C400594,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f10
	fdivs	%f10,	%f2,	%f27
	tge	%icc,	0x3
	wr	%g0,	0x89,	%asi
	ldsha	[%l7 + 0x76] %asi,	%g2
	fmovsvc	%xcc,	%f29,	%f16
	ta	%xcc,	0x7
	fmuld8ulx16	%f17,	%f20,	%f24
	sdiv	%g6,	0x0472,	%i0
	edge32n	%l4,	%i2,	%o6
	edge32n	%l0,	%i3,	%g3
	fandnot2	%f10,	%f2,	%f26
	bneg	loop_94
	fmovdcc	%icc,	%f3,	%f20
	sir	0x18ED
	set	0x54, %g6
	ldstuba	[%l7 + %g6] 0x04,	%o2
loop_94:
	udiv	%g4,	0x0670,	%l5
	srl	%g7,	0x02,	%o0
	fbuge	%fcc1,	loop_95
	tl	%icc,	0x1
	sra	%l1,	%i4,	%g1
	movcc	%icc,	%o7,	%o4
loop_95:
	movrne	%g5,	%o5,	%i5
	swap	[%l7 + 0x18],	%i1
	movrlz	%o1,	0x174,	%l2
	movcs	%xcc,	%l3,	%i7
	andncc	%l6,	%o3,	%g2
	mova	%icc,	%i6,	%i0
	srax	%l4,	%g6,	%o6
	fmovrdlz	%i2,	%f8,	%f16
	fpadd32s	%f21,	%f27,	%f11
	bvc,a,pn	%xcc,	loop_96
	brgez	%l0,	loop_97
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdpos	%xcc,	%f1,	%f26
loop_96:
	fbue,a	%fcc3,	loop_98
loop_97:
	mulx	%i3,	0x1FDF,	%g3
	smul	%g4,	%o2,	%g7
	fcmple32	%f6,	%f14,	%l5
loop_98:
	fmovrse	%l1,	%f8,	%f17
	movcs	%xcc,	%i4,	%o0
	nop
	setx	0xC382798460674269,	%l0,	%l6
	stx	%l6,	[%l7 + 0x50]
	ldx	[%l7 + 0x50],	%fsr
	fcmple16	%f16,	%f24,	%g1
	movg	%xcc,	%o7,	%g5
	edge32ln	%o4,	%i5,	%i1
	fble,a	%fcc2,	loop_99
	ld	[%l7 + 0x08],	%f11
	movrlz	%o5,	%l2,	%o1
	movvs	%icc,	%l3,	%i7
loop_99:
	movpos	%icc,	%l6,	%o3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tleu	%icc,	0x6
	fcmple16	%f24,	%f28,	%i6
	wr	%g0,	0x80,	%asi
	prefetcha	[%l7 + 0x50] %asi,	 0x3
	fbn	%fcc2,	loop_100
	fmovse	%xcc,	%f19,	%f15
	fzeros	%f15
	nop
	setx	0x04619009307F456B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0x0583A48B85A115CE,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	fdivd	%f16,	%f22,	%f18
loop_100:
	nop
	add	%l7,	0x18,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%l4
	casa	[%l6] 0x81,	%l4,	%g6
	andn	%g2,	%o6,	%i2
	movle	%icc,	%l0,	%i3
	fbue	%fcc1,	loop_101
	sir	0x0CB3
	fpadd16	%f2,	%f8,	%f24
	fmovrdlz	%g4,	%f16,	%f20
loop_101:
	smulcc	%o2,	%g7,	%l5
	taddcc	%g3,	0x057D,	%i4
	udivcc	%o0,	0x1A34,	%g1
	mulx	%o7,	0x0B08,	%g5
	move	%xcc,	%o4,	%i5
	sll	%l1,	0x0D,	%i1
	movcs	%xcc,	%l2,	%o1
	ldsw	[%l7 + 0x48],	%o5
	set	0x22, %i6
	ldsha	[%l7 + %i6] 0x10,	%l3
	udiv	%i7,	0x1617,	%l6
	sllx	%i6,	%i0,	%o3
	addccc	%l4,	%g6,	%o6
	tgu	%icc,	0x0
	alignaddr	%g2,	%l0,	%i2
	alignaddrl	%g4,	%o2,	%i3
	stb	%l5,	[%l7 + 0x15]
	movleu	%icc,	%g7,	%i4
	movg	%icc,	%o0,	%g1
	fnot1s	%f22,	%f28
	fmovdcs	%xcc,	%f29,	%f25
	fand	%f16,	%f16,	%f0
	tgu	%xcc,	0x2
	movge	%xcc,	%o7,	%g3
	movrgz	%g5,	0x31F,	%o4
	udivx	%l1,	0x1339,	%i1
	fxnor	%f30,	%f22,	%f0
	mulscc	%i5,	0x06E2,	%l2
	movcs	%xcc,	%o1,	%l3
	movne	%icc,	%i7,	%l6
	fmovrsgz	%o5,	%f2,	%f9
	edge16n	%i6,	%o3,	%l4
	edge32ln	%g6,	%o6,	%g2
	tsubcc	%l0,	%i2,	%i0
	wr	%g0,	0x2c,	%asi
	ldda	[%l7 + 0x60] %asi,	%g4
	fmovrslez	%i3,	%f16,	%f30
	add	%o2,	0x100E,	%l5
	umul	%g7,	0x18BF,	%i4
	tle	%icc,	0x6
	xorcc	%g1,	%o7,	%o0
	tvc	%xcc,	0x3
	fbg,a	%fcc0,	loop_102
	movleu	%xcc,	%g5,	%o4
	mova	%xcc,	%l1,	%i1
	fmovsgu	%xcc,	%f25,	%f30
loop_102:
	udivcc	%i5,	0x0241,	%g3
	sdivx	%l2,	0x1CA4,	%l3
	subc	%i7,	0x1DF3,	%o1
	edge32n	%l6,	%i6,	%o3
	nop
	setx	0x2E717DDAC2963263,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	fsqrtd	%f8,	%f28
	fmovsle	%icc,	%f11,	%f20
	fbne	%fcc1,	loop_103
	bgu	loop_104
	bgu,a,pt	%icc,	loop_105
	movl	%xcc,	%l4,	%o5
loop_103:
	st	%f9,	[%l7 + 0x3C]
loop_104:
	andn	%o6,	0x1A68,	%g2
loop_105:
	fmovsge	%icc,	%f29,	%f3
	xnorcc	%l0,	%i2,	%i0
	movvc	%icc,	%g4,	%g6
	lduw	[%l7 + 0x4C],	%o2
	move	%icc,	%l5,	%i3
	taddcctv	%g7,	%i4,	%g1
	fbg,a	%fcc1,	loop_106
	nop
	setx	loop_107,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	alignaddr	%o0,	%o7,	%o4
	srlx	%l1,	%i1,	%i5
loop_106:
	fpadd16	%f6,	%f24,	%f26
loop_107:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udivx	%g5,	0x099E,	%g3
	srlx	%l2,	0x00,	%l3
	fmovdneg	%icc,	%f27,	%f7
	movne	%xcc,	%o1,	%i7
	alignaddrl	%i6,	%l6,	%l4
	wr	%g0,	0x81,	%asi
	lduba	[%l7 + 0x74] %asi,	%o5
	movge	%xcc,	%o6,	%g2
	orn	%o3,	%i2,	%l0
	set	0x40, %i5
	ldda	[%l7 + %i5] 0x0c,	%f0
	bleu,pt	%xcc,	loop_108
	edge32	%i0,	%g4,	%g6
	sethi	0x0259,	%o2
	nop
	setx	loop_109,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_108:
	fpsub16	%f24,	%f8,	%f10
	fmovrde	%l5,	%f10,	%f10
	edge8l	%g7,	%i4,	%g1
loop_109:
	call	loop_110
	andcc	%o0,	%o7,	%o4
	wr	%g0,	0x81,	%asi
	ldsba	[%l7 + 0x26] %asi,	%i3
loop_110:
	tleu	%icc,	0x0
	nop
	set	0x45, %g1
	stb	%i1,	[%l7 + %g1]
	fmul8ulx16	%f2,	%f0,	%f18
	set	0x14, %i2
	stha	%l1,	[%l7 + %i2] 0x27
	membar	#Sync
	fnors	%f20,	%f2,	%f1
	fmovrsgz	%i5,	%f5,	%f13
	alignaddrl	%g5,	%g3,	%l3
	fmovsneg	%xcc,	%f23,	%f2
	tg	%icc,	0x3
	tsubcctv	%o1,	0x15A9,	%i7
	fmovspos	%icc,	%f21,	%f17
	taddcctv	%l2,	0x0251,	%i6
	wr	%g0,	0x80,	%asi
	swapa	[%l7 + 0x5C] %asi,	%l4
	xorcc	%o5,	0x1011,	%l6
	taddcctv	%o6,	%g2,	%i2
	fcmple16	%f12,	%f28,	%o3
	movre	%l0,	0x201,	%g4
	nop
	fitod	%f0,	%f10
	fdtox	%f10,	%f8
	edge16l	%g6,	%o2,	%i0
	andncc	%g7,	%i4,	%g1
	stbar
	xnorcc	%l5,	0x1F4D,	%o7
	subc	%o0,	0x1894,	%o4
	movrgez	%i3,	%l1,	%i5
	alignaddrl	%g5,	%g3,	%l3
	movvs	%icc,	%i1,	%i7
	movrlez	%o1,	%i6,	%l2
	bcc	%xcc,	loop_111
	alignaddr	%o5,	%l6,	%l4
	edge16n	%o6,	%i2,	%g2
	mulscc	%o3,	0x12FB,	%g4
loop_111:
	mulscc	%l0,	0x1CAB,	%g6
	xor	%o2,	%g7,	%i0
	fmovrde	%g1,	%f14,	%f26
	fbul	%fcc2,	loop_112
	tsubcc	%l5,	0x0A79,	%o7
	srl	%i4,	0x0B,	%o4
	nop
	setx	0x67A007CA48731160,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0x67EE8BB332C65BEB,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	fdivd	%f4,	%f12,	%f20
loop_112:
	tgu	%xcc,	0x3
	movge	%xcc,	%i3,	%l1
	fmovdne	%xcc,	%f8,	%f24
	addcc	%i5,	0x0A24,	%o0
	udivx	%g5,	0x0E69,	%g3
	array32	%l3,	%i1,	%i7
	subc	%i6,	%o1,	%l2
	sethi	0x0EE9,	%l6
	stb	%l4,	[%l7 + 0x32]
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32n	%o6,	%o5,	%g2
	set	0x1C, %l0
	stwa	%o3,	[%l7 + %l0] 0xeb
	membar	#Sync
	or	%i2,	0x0080,	%g4
	edge8n	%l0,	%o2,	%g6
	edge32	%i0,	%g7,	%g1
	nop
	set	0x58, %o4
	ldd	[%l7 + %o4],	%l4
	sra	%i4,	0x15,	%o4
	fpadd16	%f18,	%f18,	%f4
	addccc	%i3,	%o7,	%l1
	fcmpeq16	%f0,	%f28,	%o0
	udivx	%i5,	0x1294,	%g3
	sll	%l3,	%g5,	%i1
	wr	%g0,	0x04,	%asi
	sta	%f6,	[%l7 + 0x28] %asi
	brlez	%i7,	loop_113
	tvc	%icc,	0x6
	add	%l7,	0x40,	%l6
	wr	%g0,	0x11,	%asi
	ldxa	[%l6] %asi,	%i6
	casxa	[%l6] 0x11,	%i6,	%o1
loop_113:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrne	%l2,	%l4,	%l6
	fpack16	%f16,	%f24
	fand	%f16,	%f30,	%f12
	addcc	%o6,	%o5,	%g2
	nop
	fitos	%f8,	%f16
	fstoi	%f16,	%f23
	movne	%xcc,	%o3,	%g4
	fmovdn	%icc,	%f26,	%f19
	udivcc	%i2,	0x1CCD,	%l0
	movne	%icc,	%o2,	%g6
	movge	%icc,	%i0,	%g7
	movcs	%icc,	%g1,	%i4
	taddcc	%o4,	%l5,	%o7
	srlx	%i3,	%o0,	%i5
	addccc	%l1,	0x08AC,	%l3
	te	%icc,	0x7
	edge32	%g3,	%g5,	%i7
	brgz	%i1,	loop_114
	fmovrslz	%i6,	%f2,	%f19
	edge8ln	%l2,	%o1,	%l4
	or	%l6,	0x1F9E,	%o6
loop_114:
	tsubcc	%o5,	%o3,	%g4
	xorcc	%g2,	%i2,	%l0
	tne	%xcc,	0x6
	orn	%g6,	0x01E7,	%i0
	bg,a	%xcc,	loop_115
	fmovdcs	%icc,	%f8,	%f24
	movne	%xcc,	%g7,	%o2
	xorcc	%i4,	%g1,	%l5
loop_115:
	nop
	wr	%g0,	0xf9,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
	movpos	%icc,	%o4,	%i3
	fmovrdgez	%o7,	%f0,	%f8
	movcs	%icc,	%o0,	%l1
	bne,a,pn	%icc,	loop_116
	fbne,a	%fcc0,	loop_117
	movcs	%xcc,	%i5,	%g3
	smul	%g5,	0x1AAD,	%l3
loop_116:
	xor	%i1,	0x0602,	%i6
loop_117:
	srl	%i7,	0x04,	%o1
	fba,a	%fcc2,	loop_118
	xnorcc	%l4,	0x1E2C,	%l6
	array32	%o6,	%o5,	%l2
	sethi	0x19F3,	%g4
loop_118:
	array32	%o3,	%g2,	%l0
	srax	%g6,	0x1D,	%i0
	fexpand	%f24,	%f6
	wr	%g0,	0x81,	%asi
	lda	[%l7 + 0x1C] %asi,	%f15
	wr	%g0,	0x19,	%asi
	prefetcha	[%l7 + 0x10] %asi,	 0x1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sll	%o2,	0x0A,	%g7
	fzero	%f26
	fmovdn	%xcc,	%f11,	%f27
	movvs	%icc,	%i4,	%l5
	umul	%o4,	%g1,	%o7
	fcmpgt32	%f22,	%f10,	%o0
	fzero	%f2
	subcc	%l1,	%i5,	%i3
	fmul8sux16	%f4,	%f22,	%f6
	fmovdvc	%xcc,	%f6,	%f22
	nop
	setx	0xC04CCAE9,	%l0,	%l6
	st	%l6,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%fsr
	ble,a,pn	%xcc,	loop_119
	ldsh	[%l7 + 0x52],	%g3
	alignaddr	%g5,	%i1,	%l3
	nop
	fitos	%f16,	%f31
loop_119:
	edge8l	%i7,	%i6,	%o1
	fabsd	%f28,	%f14
	bg,a,pn	%icc,	loop_120
	edge8	%l6,	%o6,	%o5
	addc	%l4,	%l2,	%g4
	mulscc	%g2,	%l0,	%g6
loop_120:
	taddcctv	%o3,	%i2,	%o2
	addc	%i0,	%i4,	%l5
	xorcc	%o4,	0x1B57,	%g1
	andn	%g7,	0x10C9,	%o7
	wr	%g0,	0x80,	%asi
	stxa	%l1,	[%l7 + 0x78] %asi
	movg	%icc,	%o0,	%i3
	array16	%i5,	%g5,	%i1
	lduh	[%l7 + 0x70],	%g3
	ldstub	[%l7 + 0x33],	%l3
	wr	%g0,	0x2f,	%asi
	ldda	[%l7 + 0x20] %asi,	%i6
	te	%xcc,	0x5
	fsrc2	%f2,	%f22
	set	0x50, %g2
	stxa	%o1,	[%l7 + %g2] 0x18
	brnz	%i7,	loop_121
	tn	%xcc,	0x0
	sra	%l6,	0x0C,	%o6
	array8	%o5,	%l4,	%g4
loop_121:
	movne	%xcc,	%l2,	%g2
	tvc	%xcc,	0x1
	udivcc	%l0,	0x0E04,	%g6
	wr	%g0,	0x89,	%asi
	ldsha	[%l7 + 0x32] %asi,	%i2
	add	%o2,	%i0,	%i4
	edge16ln	%o3,	%o4,	%g1
	move	%icc,	%g7,	%o7
	addccc	%l1,	%l5,	%i3
	fnor	%f12,	%f0,	%f20
	movvs	%icc,	%o0,	%g5
	movrgz	%i1,	%g3,	%l3
	xnorcc	%i5,	0x0011,	%i6
	brz	%o1,	loop_122
	fzeros	%f29
	fbul,a	%fcc1,	loop_123
	edge8l	%l6,	%i7,	%o6
loop_122:
	call	loop_124
	movcs	%xcc,	%o5,	%l4
loop_123:
	movleu	%xcc,	%g4,	%l2
	xor	%g2,	%l0,	%i2
loop_124:
	nop
	setx	0x51430F2D713450FE,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0x68C7F7F3425BAD4B,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	faddd	%f24,	%f8,	%f22
	movrne	%o2,	0x0ED,	%i0
	set	0x54, %l3
	stwa	%i4,	[%l7 + %l3] 0x27
	membar	#Sync
	for	%f2,	%f16,	%f10
	fblg	%fcc2,	loop_125
	taddcc	%o3,	%g6,	%o4
	movneg	%xcc,	%g1,	%g7
	fbne,a	%fcc2,	loop_126
loop_125:
	tl	%xcc,	0x1
	fbl	%fcc0,	loop_127
	fornot2	%f8,	%f26,	%f18
loop_126:
	movneg	%xcc,	%l1,	%o7
	edge16ln	%i3,	%o0,	%l5
loop_127:
	te	%xcc,	0x0
	fmovsl	%icc,	%f24,	%f17
	fble	%fcc1,	loop_128
	mulx	%i1,	%g3,	%l3
	xnorcc	%i5,	0x1B2A,	%i6
	taddcctv	%g5,	%l6,	%o1
loop_128:
	subcc	%i7,	%o6,	%o5
	movrgz	%l4,	0x2F0,	%g4
	movrgz	%g2,	%l2,	%i2
	nop
	fitos	%f1,	%f20
	fstod	%f20,	%f12
	movcc	%icc,	%l0,	%i0
	sllx	%o2,	%i4,	%o3
	addccc	%o4,	0x13CF,	%g1
	movrlz	%g6,	%l1,	%g7
	nop
	fitos	%f14,	%f0
	fstoi	%f0,	%f21
	fmovrdgez	%i3,	%f12,	%f20
	std	%f30,	[%l7 + 0x78]
	movgu	%xcc,	%o0,	%l5
	movne	%xcc,	%o7,	%i1
	fmovrdne	%l3,	%f30,	%f20
	andncc	%g3,	%i5,	%g5
	movn	%icc,	%l6,	%i6
	fcmpne32	%f16,	%f24,	%o1
	tcs	%xcc,	0x3
	brz	%o6,	loop_129
	fmovsvs	%icc,	%f13,	%f25
	edge32n	%i7,	%o5,	%g4
	nop
	setx	loop_130,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_129:
	fbul,a	%fcc3,	loop_131
	taddcc	%l4,	%g2,	%l2
	andn	%l0,	%i2,	%o2
loop_130:
	ldsb	[%l7 + 0x08],	%i0
loop_131:
	edge8ln	%i4,	%o4,	%g1
	sub	%g6,	0x1DE8,	%l1
	alignaddrl	%g7,	%o3,	%i3
	movrlz	%l5,	%o7,	%i1
	tge	%xcc,	0x4
	fbl	%fcc2,	loop_132
	move	%xcc,	%l3,	%g3
	stbar
	mulscc	%o0,	%g5,	%l6
loop_132:
	movvs	%icc,	%i5,	%i6
	ble,a,pn	%icc,	loop_133
	andncc	%o1,	%i7,	%o6
	srax	%g4,	%o5,	%g2
	umul	%l2,	%l4,	%i2
loop_133:
	xnor	%o2,	0x07AE,	%i0
	edge32ln	%l0,	%o4,	%g1
	addcc	%g6,	%l1,	%g7
	ba,a	%xcc,	loop_134
	taddcc	%o3,	0x14EF,	%i3
	set	0x78, %l1
	prefetcha	[%l7 + %l1] 0x80,	 0x1
loop_134:
	nop
	setx	0x588E7FCEB3F92021,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0xCD0DE99DF6B127B8,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	fdivd	%f24,	%f0,	%f18
	bgu,a	loop_135
	movrlez	%l5,	%i1,	%o7
	membar	0x11
	taddcc	%g3,	%l3,	%g5
loop_135:
	nop
	set	0x4C, %o6
	lduha	[%l7 + %o6] 0x81,	%l6
	sdivx	%i5,	0x1C88,	%o0
	membar	0x5E
	set	0x50, %o2
	stxa	%i6,	[%l7 + %o2] 0x23
	membar	#Sync
	and	%i7,	0x0650,	%o6
	fxnors	%f12,	%f4,	%f19
	fxor	%f18,	%f0,	%f2
	edge8n	%g4,	%o1,	%o5
	movvc	%icc,	%g2,	%l2
	nop 	! 	nop 	! 	wr	%g0,	0x40,	%asi ripped by fixASI40.pl ripped by fixASI40.pl
	nop 	! 	nop 	! 	ldxa	[%g0 + 0x3e0] %asi,	%i2 ripped by fixASI40.pl ripped by fixASI40.pl
	bne	loop_136
	fmovrdne	%l4,	%f14,	%f16
	edge8ln	%i0,	%o2,	%l0
	andn	%o4,	%g6,	%g1
loop_136:
	edge32ln	%g7,	%l1,	%i3
	sdivx	%o3,	0x0B02,	%i4
	movrgz	%i1,	%l5,	%o7
	subcc	%l3,	0x1581,	%g5
	wr	%g0,	0x80,	%asi
	sta	%f6,	[%l7 + 0x14] %asi
	fble,a	%fcc1,	loop_137
	movleu	%icc,	%l6,	%g3
	fbe	%fcc3,	loop_138
	bge,a,pt	%icc,	loop_139
loop_137:
	fbl,a	%fcc1,	loop_140
	add	%o0,	%i6,	%i7
loop_138:
	array32	%i5,	%o6,	%g4
loop_139:
	xnor	%o1,	0x1825,	%o5
loop_140:
	brgez	%l2,	loop_141
	array16	%g2,	%l4,	%i2
	movgu	%xcc,	%i0,	%o2
	movcc	%icc,	%l0,	%o4
loop_141:
	umul	%g1,	%g6,	%g7
	taddcc	%l1,	0x09A2,	%i3
	alignaddrl	%o3,	%i1,	%i4
	fmovsvs	%xcc,	%f6,	%f7
	movpos	%icc,	%o7,	%l5
	movg	%xcc,	%g5,	%l3
	bcc,pt	%icc,	loop_142
	tneg	%xcc,	0x2
	fpsub32	%f14,	%f4,	%f22
	tl	%icc,	0x3
loop_142:
	xorcc	%l6,	%g3,	%i6
	bneg,pt	%xcc,	loop_143
	edge32ln	%o0,	%i5,	%o6
	fblg	%fcc3,	loop_144
	movrgz	%g4,	0x387,	%i7
loop_143:
	edge32l	%o1,	%o5,	%l2
	fcmpne16	%f10,	%f20,	%g2
loop_144:
	fmovsvs	%icc,	%f4,	%f21
	wr	%g0,	0x18,	%asi
	stha	%l4,	[%l7 + 0x10] %asi
	fmovrdne	%i2,	%f10,	%f30
	ldd	[%l7 + 0x20],	%f2
	fnot2	%f6,	%f30
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnors	%f26,	%f11,	%f20
	lduw	[%l7 + 0x10],	%i0
	taddcctv	%o2,	%l0,	%g1
	popc	%g6,	%g7
	fcmpgt32	%f8,	%f0,	%l1
	fmovsgu	%icc,	%f6,	%f26
	fmovsge	%icc,	%f21,	%f13
	swap	[%l7 + 0x44],	%o4
	fpadd16	%f28,	%f18,	%f30
	tcs	%icc,	0x4
	brlz	%i3,	loop_145
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnorcc	%o3,	0x13E5,	%i1
	movcs	%xcc,	%i4,	%o7
loop_145:
	fpadd32s	%f7,	%f30,	%f28
	tvs	%icc,	0x4
	tsubcctv	%g5,	0x1A0E,	%l3
	srl	%l6,	0x17,	%l5
	fmovsleu	%xcc,	%f8,	%f23
	fmovs	%f8,	%f27
	lduh	[%l7 + 0x44],	%g3
	movre	%i6,	%o0,	%i5
	st	%f0,	[%l7 + 0x14]
	xor	%g4,	0x0B74,	%i7
	stb	%o6,	[%l7 + 0x15]
	brlz,a	%o1,	loop_146
	fmovdvs	%icc,	%f17,	%f25
	fbu	%fcc0,	loop_147
	srlx	%l2,	0x03,	%g2
loop_146:
	fsrc2s	%f4,	%f21
	movn	%xcc,	%l4,	%i2
loop_147:
	edge32ln	%o5,	%i0,	%l0
	movvc	%icc,	%g1,	%o2
	edge32	%g7,	%g6,	%o4
	fors	%f2,	%f10,	%f15
	nop
	setx	0x8A9590510043ABF3,	%l0,	%l6
	stx	%l6,	[%l7 + 0x60]
	ldx	[%l7 + 0x60],	%fsr
	movl	%icc,	%i3,	%l1
	movrgz	%o3,	%i4,	%o7
	tleu	%xcc,	0x7
	edge16n	%i1,	%l3,	%l6
	movne	%icc,	%g5,	%g3
	bvs,a	loop_148
	fbg,a	%fcc3,	loop_149
	brgez	%i6,	loop_150
	movge	%xcc,	%l5,	%o0
loop_148:
	fmovsg	%icc,	%f24,	%f15
loop_149:
	fcmple32	%f24,	%f6,	%g4
loop_150:
	nop
	setx	loop_151,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	sdiv	%i7,	0x1A79,	%i5
	array32	%o1,	%l2,	%g2
	fbo,a	%fcc1,	loop_152
loop_151:
	bgu,pn	%icc,	loop_153
	movneg	%icc,	%o6,	%i2
	fpackfix	%f18,	%f24
loop_152:
	alignaddr	%o5,	%i0,	%l4
loop_153:
	xor	%g1,	0x109F,	%l0
	sra	%o2,	0x04,	%g6
	array8	%g7,	%i3,	%l1
	ble,pn	%xcc,	loop_154
	movg	%xcc,	%o4,	%o3
	add	%l7,	0x10,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%i4,	%o7
loop_154:
	nop
	setx loop_155, %l0, %l1
	jmpl %l1, %l3
	edge16	%i1,	%l6,	%g5
	addc	%i6,	0x1A4C,	%g3
	tcc	%icc,	0x4
loop_155:
	nop
	wr	%g0,	0x19,	%asi
	lduwa	[%l7 + 0x60] %asi,	%o0
	bgu,a,pn	%icc,	loop_156
	fmovscs	%xcc,	%f23,	%f8
	movl	%icc,	%g4,	%i7
	array8	%l5,	%i5,	%o1
loop_156:
	fpsub32s	%f18,	%f17,	%f6
	call	loop_157
	andncc	%g2,	%l2,	%i2
	fbue	%fcc2,	loop_158
	bl,a,pt	%xcc,	loop_159
loop_157:
	sethi	0x02F7,	%o6
	andn	%o5,	0x1044,	%i0
loop_158:
	movne	%icc,	%l4,	%l0
loop_159:
	subcc	%o2,	0x10A0,	%g6
	fmovdcc	%xcc,	%f21,	%f31
	fnot2s	%f17,	%f29
	add	%l7,	0x2C,	%l6
	wr	%g0,	0x0c,	%asi
	casa	[%l6] %asi,	%g1,	%g7
	fble,a	%fcc3,	loop_160
	fmovdvs	%xcc,	%f15,	%f29
	fmovrslez	%i3,	%f24,	%f20
	udivcc	%l1,	0x0CEC,	%o4
loop_160:
	tgu	%icc,	0x0
	tge	%icc,	0x7
	nop
	set	0x35, %g4
	ldstub	[%l7 + %g4],	%o3
	nop
	fitos	%f12,	%f14
	fstox	%f14,	%f18
	tneg	%xcc,	0x6
	sllx	%o7,	%i4,	%l3
	fmovrdlez	%l6,	%f14,	%f28
	add	%l7,	0x0C,	%l6
	wr	%g0,	0x04,	%asi
	lda	[%l6] %asi,	%g5
	casa	[%l6] 0x04,	%g5,	%i6
	srlx	%i1,	%o0,	%g3
	fpadd32	%f4,	%f20,	%f10
	fbule	%fcc0,	loop_161
	fmovd	%f26,	%f8
	ldd	[%l7 + 0x38],	%f4
	membar	0x2D
loop_161:
	nop
	membar	#Sync
	wr	%g0,	0x1e,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	bshuffle	%f4,	%f14,	%f28
	edge32n	%i7,	%g4,	%l5
	andn	%i5,	%g2,	%l2
	xorcc	%o1,	%o6,	%o5
	tgu	%xcc,	0x6
	xnorcc	%i2,	0x072B,	%l4
	tcs	%icc,	0x1
	st	%f31,	[%l7 + 0x30]
	nop
	setx	0xB4952CF6C04E722D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x38]
	ldx	[%l7 + 0x38],	%fsr
	ldub	[%l7 + 0x73],	%i0
	membar	0x4A
	udiv	%l0,	0x0787,	%o2
	fmovdg	%xcc,	%f28,	%f27
	orn	%g1,	0x0A8B,	%g6
	ba,a	loop_162
	bpos,a,pt	%icc,	loop_163
	fxnors	%f30,	%f29,	%f29
	bgu,a	%xcc,	loop_164
loop_162:
	fcmpne16	%f30,	%f8,	%i3
loop_163:
	brgez,a	%g7,	loop_165
	fxors	%f17,	%f3,	%f29
loop_164:
	movrlz	%o4,	0x0C2,	%o3
	fmovrdlez	%l1,	%f14,	%f0
loop_165:
	bg	%icc,	loop_166
	bne,a	%icc,	loop_167
	umul	%i4,	0x0AE3,	%o7
	tneg	%xcc,	0x7
loop_166:
	fornot2s	%f18,	%f30,	%f26
loop_167:
	fpackfix	%f12,	%f5
	xorcc	%l6,	%l3,	%g5
	ba,a,pt	%xcc,	loop_168
	bvc,a	loop_169
	tcc	%xcc,	0x2
	udivx	%i1,	0x0C00,	%o0
loop_168:
	fbg	%fcc0,	loop_170
loop_169:
	orncc	%i6,	0x0431,	%i7
	umul	%g4,	0x17DC,	%l5
	movl	%icc,	%i5,	%g3
loop_170:
	fmovrse	%g2,	%f22,	%f3
	taddcc	%o1,	0x0900,	%o6
	brlez	%l2,	loop_171
	fornot2	%f8,	%f24,	%f6
	movrlez	%i2,	0x293,	%l4
	sdivx	%i0,	0x0735,	%o5
loop_171:
	movge	%icc,	%l0,	%g1
	and	%g6,	%i3,	%g7
	fornot2s	%f10,	%f12,	%f24
	ta	%xcc,	0x6
	fnor	%f4,	%f24,	%f30
	movne	%xcc,	%o4,	%o3
	movvc	%xcc,	%l1,	%i4
	udivx	%o2,	0x0B4C,	%l6
	movl	%icc,	%o7,	%l3
	brnz,a	%i1,	loop_172
	mulx	%o0,	0x0174,	%g5
	set	0x3C, %i1
	ldswa	[%l7 + %i1] 0x04,	%i7
loop_172:
	fbg	%fcc3,	loop_173
	bvs	loop_174
	movre	%i6,	0x333,	%l5
	udivx	%i5,	0x0A9C,	%g4
loop_173:
	ldstub	[%l7 + 0x65],	%g2
loop_174:
	nop
	set	0x78, %l4
	stxa	%o1,	[%l7 + %l4] 0x80
	movleu	%icc,	%o6,	%l2
	wr	%g0,	0x11,	%asi
	ldstuba	[%l7 + 0x2F] %asi,	%g3
	edge32l	%l4,	%i0,	%i2
	orn	%l0,	%g1,	%o5
	fbe	%fcc0,	loop_175
	taddcctv	%g6,	%i3,	%o4
	fmovse	%xcc,	%f12,	%f10
	xnor	%o3,	%g7,	%l1
loop_175:
	udivcc	%i4,	0x0C29,	%o2
	fandnot2	%f12,	%f24,	%f16
	fabsd	%f14,	%f8
	tpos	%xcc,	0x7
	set	0x10, %i0
	stwa	%o7,	[%l7 + %i0] 0x2f
	membar	#Sync
	tle	%icc,	0x0
	tge	%icc,	0x1
	nop
	setx	0x708B70D0,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f20
	setx	0x40A69938,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f18
	fadds	%f18,	%f20,	%f5
	andcc	%l6,	0x0F69,	%i1
	fmovrsgz	%l3,	%f26,	%f7
	movgu	%icc,	%g5,	%o0
	nop
	fitod	%f4,	%f22
	fdtox	%f22,	%f12
	movneg	%icc,	%i7,	%l5
	sdivcc	%i6,	0x07E1,	%i5
	udiv	%g2,	0x1893,	%o1
	fmovrdgz	%g4,	%f0,	%f6
	tleu	%icc,	0x1
	be	loop_176
	sub	%o6,	%g3,	%l4
	movvs	%icc,	%i0,	%l2
	set	0x10, %g3
	stxa	%l0,	[%l7 + %g3] 0x04
loop_176:
	brlz,a	%i2,	loop_177
	movn	%xcc,	%g1,	%o5
	edge8	%g6,	%o4,	%i3
	or	%o3,	0x0F8F,	%g7
loop_177:
	nop
	fitod	%f6,	%f14
	fdtox	%f14,	%f24
	fxtod	%f24,	%f4
	array16	%l1,	%i4,	%o2
	call	loop_178
	and	%o7,	0x0E81,	%l6
	tneg	%icc,	0x6
	add	%i1,	0x0FEA,	%g5
loop_178:
	sub	%l3,	0x10D2,	%i7
	fmovdneg	%icc,	%f26,	%f28
	fpackfix	%f22,	%f1
	fbu	%fcc2,	loop_179
	stbar
	movvs	%xcc,	%l5,	%i6
	tne	%xcc,	0x4
loop_179:
	tg	%icc,	0x1
	set	0x14, %g7
	ldswa	[%l7 + %g7] 0x19,	%o0
	set	0x68, %o1
	ldswa	[%l7 + %o1] 0x89,	%i5
	sir	0x0D41
	umulcc	%o1,	%g2,	%o6
	fmovdgu	%icc,	%f19,	%f0
	move	%xcc,	%g3,	%l4
	udiv	%i0,	0x1102,	%l2
	taddcc	%l0,	%i2,	%g4
	udivcc	%o5,	0x107F,	%g1
	st	%f1,	[%l7 + 0x28]
	tl	%xcc,	0x2
	andncc	%o4,	%i3,	%g6
	bg,pt	%xcc,	loop_180
	sub	%g7,	%o3,	%i4
	xorcc	%o2,	0x18E1,	%o7
	tl	%icc,	0x6
loop_180:
	brgz	%l1,	loop_181
	movvs	%icc,	%i1,	%g5
	bpos,a	loop_182
	fmovsneg	%icc,	%f10,	%f22
loop_181:
	fbo	%fcc3,	loop_183
	sllx	%l6,	%i7,	%l5
loop_182:
	tleu	%icc,	0x0
	movge	%xcc,	%l3,	%i6
loop_183:
	sdiv	%i5,	0x099A,	%o1
	fbug,a	%fcc0,	loop_184
	tgu	%icc,	0x6
	tneg	%icc,	0x2
	udivx	%o0,	0x0C5D,	%o6
loop_184:
	taddcc	%g2,	%g3,	%i0
	smulcc	%l2,	0x1DE5,	%l4
	bvc,a,pt	%xcc,	loop_185
	sethi	0x0296,	%i2
	edge8	%g4,	%o5,	%g1
	movrne	%l0,	%i3,	%g6
loop_185:
	fpsub16s	%f7,	%f13,	%f3
	andcc	%o4,	0x1B41,	%g7
	edge32n	%i4,	%o3,	%o7
	edge8l	%o2,	%i1,	%g5
	set	0x50, %o0
	stxa	%l1,	[%l7 + %o0] 0x89
	orncc	%l6,	%i7,	%l3
	movg	%xcc,	%i6,	%l5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	setx	loop_186,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fandnot2s	%f8,	%f2,	%f25
	movcc	%xcc,	%i5,	%o1
	fmovrdne	%o0,	%f10,	%f16
loop_186:
	sir	0x0D4B
	movne	%xcc,	%g2,	%o6
	addcc	%i0,	%l2,	%l4
	fpack16	%f4,	%f3
	set	0x40, %l6
	stda	%f16,	[%l7 + %l6] 0xf8
	membar	#Sync
	sra	%i2,	%g3,	%o5
	movn	%icc,	%g4,	%g1
	fmovrdgz	%i3,	%f2,	%f6
	array16	%l0,	%g6,	%o4
	taddcctv	%i4,	%o3,	%o7
	fmovsle	%xcc,	%f25,	%f0
	srl	%g7,	%o2,	%g5
	movrgz	%l1,	%l6,	%i1
	fpsub16s	%f24,	%f10,	%f5
	wr	%g0,	0x19,	%asi
	sta	%f25,	[%l7 + 0x44] %asi
	udivcc	%i7,	0x000E,	%i6
	bvc	%icc,	loop_187
	sllx	%l5,	%i5,	%l3
	ldstub	[%l7 + 0x0E],	%o1
	set	0x68, %i7
	prefetcha	[%l7 + %i7] 0x89,	 0x2
loop_187:
	fornot1s	%f16,	%f23,	%f27
	sllx	%o6,	0x1B,	%i0
	set	0x08, %o7
	ldsha	[%l7 + %o7] 0x15,	%l2
	for	%f10,	%f20,	%f16
	edge8ln	%o0,	%i2,	%g3
	add	%l4,	0x1FA2,	%g4
	nop 	! 	nop 	! 	wr	%g0,	0x40,	%asi ripped by fixASI40.pl ripped by fixASI40.pl
	nop 	! 	nop 	! 	ldxa	[%g0 + 0x390] %asi,	%g1 ripped by fixASI40.pl ripped by fixASI40.pl
	movcc	%xcc,	%o5,	%i3
	set	0x60, %l5
	ldda	[%l7 + %l5] 0xeb,	%g6
	movrne	%o4,	%l0,	%o3
	xorcc	%o7,	%i4,	%g7
	movle	%xcc,	%g5,	%l1
	xnor	%o2,	0x063D,	%i1
	sll	%i7,	%i6,	%l5
	fmovdcc	%xcc,	%f9,	%f27
	fpadd32s	%f6,	%f31,	%f2
	fbu	%fcc3,	loop_188
	smulcc	%i5,	%l3,	%l6
	movrgez	%g2,	0x23C,	%o6
	movne	%xcc,	%o1,	%l2
loop_188:
	nop
	set	0x20, %o5
	ldd	[%l7 + %o5],	%o0
	xnor	%i0,	0x0410,	%g3
	set	0x31, %o3
	lduba	[%l7 + %o3] 0x10,	%l4
	bcs	%icc,	loop_189
	add	%i2,	0x00B3,	%g4
	smulcc	%o5,	%i3,	%g1
	fcmple32	%f16,	%f4,	%o4
loop_189:
	tleu	%xcc,	0x4
	sll	%g6,	0x05,	%o3
	fbne	%fcc3,	loop_190
	nop
	set	0x5E, %l2
	lduh	[%l7 + %l2],	%l0
	nop
	setx	loop_191,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	edge8n	%i4,	%o7,	%g7
loop_190:
	fmovdn	%xcc,	%f29,	%f31
	nop
	setx	0x01DCA584,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f2
	setx	0x412A204A,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f6
	fsubs	%f6,	%f2,	%f15
loop_191:
	fmovse	%xcc,	%f8,	%f27
	fandnot1s	%f23,	%f13,	%f12
	lduh	[%l7 + 0x46],	%g5
	fbn	%fcc0,	loop_192
	fmovdg	%icc,	%f12,	%f2
	nop
	setx	0xC9F12F72C07D3BA6,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldx	[%l7 + 0x28],	%fsr
	fblg	%fcc3,	loop_193
loop_192:
	fmovdle	%icc,	%f29,	%f31
	tneg	%icc,	0x3
	movle	%icc,	%o2,	%l1
loop_193:
	nop
	set	0x20, %i3
	lda	[%l7 + %i3] 0x14,	%f10
	udivcc	%i1,	0x1348,	%i6
	subcc	%i7,	%l5,	%l3
	movvc	%xcc,	%l6,	%g2
	fmovs	%f0,	%f9
	andcc	%i5,	0x0A84,	%o6
	tleu	%xcc,	0x7
	stbar
	movle	%xcc,	%o1,	%o0
	brnz,a	%l2,	loop_194
	tn	%icc,	0x2
	fmovsge	%xcc,	%f21,	%f7
	fblg,a	%fcc1,	loop_195
loop_194:
	alignaddr	%g3,	%i0,	%l4
	fbul,a	%fcc2,	loop_196
	andn	%g4,	0x148E,	%i2
loop_195:
	edge16n	%o5,	%g1,	%o4
	udivx	%g6,	0x1383,	%o3
loop_196:
	orncc	%l0,	0x0E1B,	%i4
	subccc	%i3,	%g7,	%o7
	movl	%xcc,	%o2,	%g5
	fbuge,a	%fcc2,	loop_197
	xnorcc	%i1,	%i6,	%l1
	bn	%xcc,	loop_198
	fmovrdgz	%i7,	%f4,	%f20
loop_197:
	sub	%l5,	%l3,	%g2
	tge	%xcc,	0x3
loop_198:
	tn	%icc,	0x3
	movvs	%icc,	%l6,	%o6
	bgu	loop_199
	bl,pn	%xcc,	loop_200
	fmovdl	%icc,	%f24,	%f23
	udiv	%o1,	0x0B22,	%o0
loop_199:
	srax	%l2,	0x1E,	%i5
loop_200:
	movne	%xcc,	%g3,	%l4
	movrne	%i0,	%g4,	%o5
	fsrc2	%f4,	%f8
	mova	%icc,	%i2,	%o4
	tn	%icc,	0x7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32	%g6,	%g1,	%o3
	brlez,a	%l0,	loop_201
	taddcctv	%i3,	%g7,	%o7
	bn,a	loop_202
	movrlez	%i4,	%o2,	%g5
loop_201:
	fmul8sux16	%f24,	%f20,	%f14
	and	%i1,	0x0C34,	%l1
loop_202:
	andcc	%i7,	%l5,	%i6
	fnor	%f8,	%f26,	%f20
	sdiv	%l3,	0x0519,	%l6
	fmovdcs	%xcc,	%f8,	%f21
	wr	%g0,	0x80,	%asi
	lduba	[%l7 + 0x23] %asi,	%g2
	movgu	%xcc,	%o6,	%o1
	movrne	%l2,	0x392,	%i5
	movrgez	%o0,	%g3,	%l4
	subcc	%i0,	%g4,	%o5
	brlez,a	%o4,	loop_203
	fpsub32	%f8,	%f8,	%f30
	fbug	%fcc3,	loop_204
	array8	%i2,	%g6,	%o3
loop_203:
	brz	%g1,	loop_205
	srl	%i3,	%l0,	%o7
loop_204:
	sll	%g7,	%o2,	%i4
	smul	%i1,	0x0494,	%g5
loop_205:
	tg	%icc,	0x7
	fmovrslz	%i7,	%f26,	%f13
	membar	0x02
	and	%l5,	0x0FFC,	%i6
	movle	%xcc,	%l3,	%l6
	array32	%g2,	%l1,	%o6
	srl	%l2,	0x05,	%o1
	xnorcc	%i5,	%o0,	%l4
	brlz	%g3,	loop_206
	membar	0x7C
	tpos	%xcc,	0x6
	smul	%i0,	0x1105,	%g4
loop_206:
	movrgez	%o4,	%i2,	%o5
	subc	%g6,	0x110D,	%o3
	edge16l	%i3,	%g1,	%o7
	xorcc	%g7,	0x1EC9,	%o2
	tgu	%icc,	0x1
	udiv	%i4,	0x0DAE,	%i1
	ldx	[%l7 + 0x30],	%l0
	sllx	%g5,	%i7,	%i6
	movne	%icc,	%l5,	%l6
	smulcc	%g2,	0x0EAB,	%l3
	fpack16	%f4,	%f6
	fexpand	%f20,	%f20
	nop
	setx	0x92A4F95B983EA1E7,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0xFCC3FA86A9CEB5E4,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	fsubd	%f26,	%f6,	%f24
	bvc,a,pt	%icc,	loop_207
	add	%o6,	%l2,	%l1
	bpos	%icc,	loop_208
	fbne	%fcc3,	loop_209
loop_207:
	fmuld8ulx16	%f13,	%f8,	%f26
	movleu	%xcc,	%o1,	%o0
loop_208:
	fpsub32	%f28,	%f22,	%f2
loop_209:
	movn	%xcc,	%i5,	%l4
	fpadd32	%f12,	%f6,	%f20
	xor	%g3,	0x1A03,	%i0
	fandnot1s	%f16,	%f16,	%f8
	andcc	%g4,	%o4,	%i2
	fcmpgt16	%f16,	%f6,	%o5
	tcs	%icc,	0x4
	fcmpne32	%f30,	%f26,	%o3
	udivx	%i3,	0x1F6F,	%g1
	set	0x2D, %g5
	ldsba	[%l7 + %g5] 0x18,	%g6
	edge8	%g7,	%o7,	%i4
	movn	%xcc,	%o2,	%l0
	array32	%i1,	%i7,	%i6
	array32	%g5,	%l6,	%l5
	tsubcc	%g2,	0x07B2,	%l3
	srl	%o6,	0x03,	%l1
	set	0x6E, %i4
	stha	%l2,	[%l7 + %i4] 0x04
	set	0x36, %i6
	stha	%o1,	[%l7 + %i6] 0xe2
	membar	#Sync
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andn	%i5,	%o0,	%l4
	sra	%g3,	0x09,	%i0
	wr	%g0,	0x0c,	%asi
	lduba	[%l7 + 0x21] %asi,	%o4
	edge8l	%g4,	%o5,	%i2
	orn	%o3,	0x19BC,	%g1
	tge	%icc,	0x5
	fsrc1	%f22,	%f10
	ba	%xcc,	loop_210
	nop
	setx	0xA7D332CF,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f20
	fsqrts	%f20,	%f3
	fmovdle	%xcc,	%f4,	%f16
	fcmpgt16	%f6,	%f14,	%g6
loop_210:
	add	%g7,	0x1E1E,	%o7
	movrlz	%i3,	0x35F,	%i4
	lduw	[%l7 + 0x08],	%o2
	movrgez	%l0,	%i7,	%i6
	sub	%g5,	%l6,	%i1
	tsubcctv	%l5,	0x0ED6,	%g2
	movne	%icc,	%l3,	%l1
	alignaddrl	%l2,	%o6,	%o1
	movvs	%icc,	%i5,	%o0
	movrgez	%g3,	0x2F3,	%i0
	bge,a	loop_211
	fbe	%fcc2,	loop_212
	taddcctv	%o4,	%g4,	%o5
	fmovrdlez	%i2,	%f10,	%f10
loop_211:
	fbe,a	%fcc2,	loop_213
loop_212:
	ldstub	[%l7 + 0x47],	%l4
	fmovrslez	%g1,	%f21,	%f5
	fmovsl	%icc,	%f6,	%f7
loop_213:
	sub	%g6,	0x1B6F,	%o3
	tpos	%xcc,	0x0
	tcc	%icc,	0x1
	bcc,a	loop_214
	movcc	%xcc,	%g7,	%i3
	fbu	%fcc2,	loop_215
	movg	%xcc,	%i4,	%o7
loop_214:
	srax	%o2,	%i7,	%i6
	umul	%g5,	%l6,	%i1
loop_215:
	umul	%l0,	%l5,	%g2
	fmovsn	%icc,	%f26,	%f1
	udivx	%l1,	0x1F84,	%l2
	sub	%o6,	%l3,	%i5
	edge32l	%o0,	%g3,	%o1
	edge8l	%i0,	%g4,	%o4
	edge16ln	%i2,	%l4,	%g1
	ldd	[%l7 + 0x40],	%g6
	movge	%icc,	%o3,	%o5
	fbug,a	%fcc3,	loop_216
	tvc	%icc,	0x2
	tn	%icc,	0x0
	nop
	setx	0x7C54567E1C5CEA01,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0x42187FC8C81773D2,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	faddd	%f0,	%f28,	%f26
loop_216:
	brgz	%i3,	loop_217
	smulcc	%g7,	0x1661,	%o7
	movg	%xcc,	%o2,	%i7
	orcc	%i6,	0x177A,	%i4
loop_217:
	edge32	%g5,	%l6,	%i1
	fpmerge	%f28,	%f11,	%f0
	movrgz	%l5,	0x301,	%g2
	movcs	%xcc,	%l0,	%l2
	movgu	%icc,	%o6,	%l3
	pdist	%f2,	%f26,	%f4
	tge	%icc,	0x7
	fpack32	%f22,	%f20,	%f16
	fbule	%fcc2,	loop_218
	movre	%i5,	%l1,	%o0
	movgu	%xcc,	%g3,	%o1
	edge16ln	%i0,	%g4,	%i2
loop_218:
	membar	0x2C
	te	%xcc,	0x3
	xorcc	%l4,	%g1,	%o4
	srl	%g6,	%o3,	%o5
	edge32	%i3,	%o7,	%g7
	fmul8ulx16	%f14,	%f28,	%f14
	fnands	%f0,	%f9,	%f3
	smulcc	%i7,	%o2,	%i4
	tcs	%icc,	0x3
	fcmple32	%f0,	%f12,	%i6
	movg	%xcc,	%g5,	%l6
	brlz,a	%i1,	loop_219
	move	%xcc,	%l5,	%l0
	nop
	setx	0x74BBEACCE061C257,	%l0,	%l6
	stx	%l6,	[%l7 + 0x68]
	ldx	[%l7 + 0x68],	%fsr
	sdiv	%g2,	0x042C,	%l2
loop_219:
	movpos	%xcc,	%o6,	%i5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tge	%xcc,	0x3
	popc	%l1,	%l3
	bne,pt	%xcc,	loop_220
	bcc,a	%xcc,	loop_221
	xnor	%g3,	%o0,	%i0
	taddcctv	%g4,	0x1DC9,	%o1
loop_220:
	tpos	%icc,	0x3
loop_221:
	bn	loop_222
	edge8n	%i2,	%l4,	%g1
	popc	%g6,	%o3
	set	0x66, %g6
	stha	%o5,	[%l7 + %g6] 0x0c
loop_222:
	edge32n	%i3,	%o7,	%g7
	fmul8x16al	%f2,	%f30,	%f6
	subcc	%i7,	%o2,	%o4
	movge	%icc,	%i4,	%i6
	fmul8x16	%f28,	%f24,	%f12
	tsubcc	%g5,	0x0BA0,	%l6
	fnegs	%f15,	%f5
	movrlez	%i1,	%l0,	%g2
	nop
	setx	0x179D87BA,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f30
	setx	0x54530124,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f1
	fsubs	%f1,	%f30,	%f15
	popc	0x1657,	%l2
	udiv	%o6,	0x00E0,	%l5
	xor	%i5,	0x05F6,	%l3
	edge16n	%l1,	%g3,	%i0
	nop
	setx	0xF4EFE59B6A9E3A90,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0xB5E734280EFC38B9,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	fdivd	%f26,	%f30,	%f8
	sra	%g4,	%o0,	%o1
	membar	0x44
	tleu	%icc,	0x3
	edge16n	%i2,	%g1,	%l4
	fmovrdlz	%g6,	%f26,	%f6
	set	0x40, %g1
	ldda	[%l7 + %g1] 0x0c,	%f0
	orncc	%o3,	%o5,	%o7
	movneg	%xcc,	%g7,	%i7
	movcc	%icc,	%o2,	%o4
	tvs	%xcc,	0x6
	wr	%g0,	0x04,	%asi
	ldswa	[%l7 + 0x5C] %asi,	%i4
	fmovda	%xcc,	%f16,	%f22
	fmovse	%xcc,	%f28,	%f13
	alignaddr	%i3,	%g5,	%l6
	edge32n	%i6,	%i1,	%l0
	ta	%icc,	0x6
	tleu	%icc,	0x2
	tcs	%icc,	0x2
	membar	0x07
	brgz	%l2,	loop_223
	tsubcctv	%g2,	%l5,	%o6
	tvc	%xcc,	0x6
	bvs	loop_224
loop_223:
	movcc	%icc,	%i5,	%l1
	movg	%icc,	%g3,	%l3
	edge16ln	%i0,	%o0,	%o1
loop_224:
	movgu	%icc,	%g4,	%g1
	set	0x5C, %i5
	lduba	[%l7 + %i5] 0x11,	%l4
	edge32l	%i2,	%g6,	%o5
	flush	%l7 + 0x34
	alignaddrl	%o3,	%o7,	%g7
	tsubcc	%i7,	%o2,	%o4
	array32	%i4,	%i3,	%g5
	and	%i6,	0x015F,	%i1
	sth	%l0,	[%l7 + 0x72]
	stw	%l2,	[%l7 + 0x60]
	fxors	%f4,	%f17,	%f0
	te	%xcc,	0x4
	fmovsa	%icc,	%f20,	%f8
	fone	%f28
	ba,pn	%icc,	loop_225
	bvs	loop_226
	sub	%l6,	%g2,	%o6
	udivx	%l5,	0x04E6,	%l1
loop_225:
	tge	%xcc,	0x4
loop_226:
	ldx	[%l7 + 0x60],	%i5
	orn	%g3,	0x0710,	%i0
	wr	%g0,	0x10,	%asi
	sta	%f13,	[%l7 + 0x40] %asi
	fmovdgu	%xcc,	%f19,	%f27
	ldstub	[%l7 + 0x10],	%l3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movn	%icc,	%o1,	%o0
	fmovse	%icc,	%f4,	%f16
	edge16	%g4,	%g1,	%l4
	movrlz	%g6,	0x049,	%i2
	mulscc	%o3,	0x1A17,	%o5
	ba	loop_227
	sethi	0x0790,	%o7
	movrne	%i7,	%o2,	%g7
	fmul8sux16	%f26,	%f8,	%f6
loop_227:
	fmovdg	%xcc,	%f6,	%f24
	fmovdcs	%xcc,	%f14,	%f21
	membar	0x65
	srax	%o4,	0x00,	%i4
	fbg,a	%fcc3,	loop_228
	andncc	%i3,	%i6,	%i1
	sra	%l0,	0x16,	%l2
	bg,a,pn	%xcc,	loop_229
loop_228:
	movpos	%xcc,	%g5,	%g2
	fmovdvs	%icc,	%f27,	%f1
	movcs	%xcc,	%o6,	%l6
loop_229:
	nop
	fitos	%f9,	%f1
	fstox	%f1,	%f8
	fxtos	%f8,	%f29
	sll	%l1,	%i5,	%g3
	brnz,a	%l5,	loop_230
	bneg,a,pn	%xcc,	loop_231
	movrgez	%i0,	%o1,	%l3
	fnegs	%f0,	%f12
loop_230:
	nop
	setx	loop_232,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_231:
	movgu	%icc,	%o0,	%g4
	tneg	%xcc,	0x0
	edge16	%l4,	%g6,	%g1
loop_232:
	bshuffle	%f14,	%f18,	%f10
	addccc	%i2,	%o3,	%o5
	tg	%icc,	0x3
	edge16l	%i7,	%o7,	%g7
	taddcctv	%o4,	%i4,	%i3
	xnorcc	%i6,	%o2,	%i1
	ldx	[%l7 + 0x28],	%l2
	tvs	%icc,	0x5
	set	0x43, %l0
	stba	%g5,	[%l7 + %l0] 0x2f
	membar	#Sync
	wr	%g0,	0x1e,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
	bge	%icc,	loop_233
	movn	%icc,	%l0,	%o6
	taddcc	%l6,	0x0755,	%l1
	udivcc	%i5,	0x01BA,	%g2
loop_233:
	tcc	%icc,	0x3
	popc	0x157B,	%g3
	subc	%i0,	%o1,	%l3
	subccc	%o0,	0x1C2C,	%l5
	edge32ln	%g4,	%l4,	%g1
	wr	%g0,	0x11,	%asi
	sta	%f0,	[%l7 + 0x74] %asi
	movvc	%icc,	%i2,	%o3
	smul	%o5,	%g6,	%o7
	addcc	%i7,	0x0CAF,	%g7
	tl	%icc,	0x0
	bvc,pn	%icc,	loop_234
	fmovdpos	%icc,	%f2,	%f23
	tpos	%xcc,	0x0
	andn	%i4,	%i3,	%i6
loop_234:
	tleu	%icc,	0x1
	ba,pn	%icc,	loop_235
	smul	%o2,	0x0172,	%i1
	bl,a	%icc,	loop_236
	fbe,a	%fcc3,	loop_237
loop_235:
	movrne	%o4,	%l2,	%g5
	edge32ln	%l0,	%l6,	%l1
loop_236:
	swap	[%l7 + 0x50],	%o6
loop_237:
	tn	%xcc,	0x0
	orn	%g2,	0x0FE5,	%i5
	movrgez	%i0,	%g3,	%l3
	wr	%g0,	0x10,	%asi
	lduha	[%l7 + 0x2C] %asi,	%o1
	array32	%o0,	%g4,	%l5
	edge8	%l4,	%g1,	%o3
	tne	%icc,	0x1
	movcc	%xcc,	%i2,	%o5
	sdivcc	%g6,	0x0626,	%i7
	sethi	0x00D9,	%g7
	edge16	%o7,	%i3,	%i4
	membar	0x72
	fmovsvc	%icc,	%f0,	%f19
	fandnot2	%f10,	%f30,	%f24
	wr	%g0,	0x04,	%asi
	ldswa	[%l7 + 0x7C] %asi,	%o2
	set	0x40, %o4
	ldda	[%l7 + %o4] 0x18,	%f16
	umulcc	%i6,	%o4,	%i1
	fmovrsgz	%l2,	%f1,	%f20
	movleu	%xcc,	%l0,	%g5
	tvc	%icc,	0x7
	fxor	%f26,	%f18,	%f28
	movleu	%xcc,	%l6,	%o6
	set	0x70, %i2
	ldda	[%l7 + %i2] 0x15,	%g2
	movne	%icc,	%i5,	%i0
	xor	%g3,	0x169C,	%l3
	sra	%l1,	0x16,	%o0
	array32	%o1,	%g4,	%l5
	sll	%g1,	%o3,	%i2
	fcmple16	%f26,	%f8,	%o5
	edge32	%g6,	%i7,	%g7
	ta	%xcc,	0x6
	fmovrslz	%o7,	%f18,	%f25
	udiv	%i3,	0x0B6C,	%i4
	bgu,pt	%xcc,	loop_238
	movvs	%xcc,	%l4,	%o2
	sdivcc	%o4,	0x028B,	%i1
	wr	%g0,	0x80,	%asi
	ldxa	[%l7 + 0x40] %asi,	%i6
loop_238:
	taddcctv	%l0,	0x0BA3,	%l2
	ldd	[%l7 + 0x58],	%g4
	bneg,pn	%xcc,	loop_239
	nop
	fitos	%f4,	%f7
	fstox	%f7,	%f0
	fxtos	%f0,	%f8
	fbn,a	%fcc2,	loop_240
	fba,a	%fcc0,	loop_241
loop_239:
	bshuffle	%f22,	%f8,	%f12
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_240:
	tne	%xcc,	0x5
loop_241:
	stw	%o6,	[%l7 + 0x28]
	brgez,a	%l6,	loop_242
	fbue,a	%fcc1,	loop_243
	stbar
	fmovrdlz	%i5,	%f30,	%f4
loop_242:
	nop
	setx	0x992CEA8B,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f8
	fsqrts	%f8,	%f3
loop_243:
	mulscc	%g2,	%g3,	%l3
	addcc	%i0,	0x0934,	%o0
	edge16	%l1,	%g4,	%o1
	movrgz	%l5,	0x00B,	%o3
	edge8	%i2,	%g1,	%g6
	sra	%i7,	%o5,	%o7
	fbug	%fcc3,	loop_244
	edge16n	%g7,	%i4,	%l4
	movg	%xcc,	%o2,	%i3
	fmul8x16au	%f14,	%f12,	%f20
loop_244:
	xor	%o4,	0x0E65,	%i6
	tl	%icc,	0x7
	mulscc	%i1,	0x0C42,	%l2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpackfix	%f10,	%f29
	sth	%l0,	[%l7 + 0x78]
	fmul8x16	%f0,	%f30,	%f26
	fmul8sux16	%f10,	%f20,	%f30
	nop
	set	0x62, %g2
	ldub	[%l7 + %g2],	%o6
	fmuld8sux16	%f11,	%f13,	%f22
	fbne,a	%fcc3,	loop_245
	fbl	%fcc3,	loop_246
	fmovdneg	%icc,	%f27,	%f24
	popc	0x132A,	%l6
loop_245:
	nop
	setx	0x93AAA582DEBB51A0,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	fsqrtd	%f2,	%f2
loop_246:
	movvc	%xcc,	%g5,	%i5
	tcs	%icc,	0x2
	bneg,a	%xcc,	loop_247
	fmovdl	%xcc,	%f17,	%f25
	ta	%icc,	0x6
	fsrc1s	%f14,	%f10
loop_247:
	ta	%icc,	0x4
	xnorcc	%g2,	0x1951,	%g3
	fsrc2	%f14,	%f14
	andcc	%l3,	0x092C,	%i0
	tle	%icc,	0x0
	fnot1	%f22,	%f30
	taddcctv	%l1,	%o0,	%g4
	fmovsl	%xcc,	%f2,	%f15
	fmovrse	%o1,	%f6,	%f26
	fmovdneg	%icc,	%f17,	%f29
	nop
	setx	0x62492DB7,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f20
	setx	0xBF82E924,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f21
	fsubs	%f21,	%f20,	%f20
	fnot2	%f20,	%f30
	movn	%xcc,	%l5,	%o3
	nop
	setx	loop_248,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fnor	%f30,	%f20,	%f16
	set	0x57, %l3
	stba	%i2,	[%l7 + %l3] 0x10
loop_248:
	movcc	%xcc,	%g6,	%g1
	movn	%xcc,	%i7,	%o5
	movn	%xcc,	%o7,	%i4
	edge8l	%g7,	%l4,	%o2
	fba,a	%fcc2,	loop_249
	sir	0x0256
	fbu,a	%fcc3,	loop_250
	fnegd	%f4,	%f0
loop_249:
	brz	%i3,	loop_251
	bge,a	%xcc,	loop_252
loop_250:
	bgu,a	loop_253
	addccc	%i6,	0x02EF,	%i1
loop_251:
	addcc	%l2,	0x0A52,	%l0
loop_252:
	mova	%xcc,	%o6,	%o4
loop_253:
	nop
	wr	%g0,	0x11,	%asi
	ldstuba	[%l7 + 0x5C] %asi,	%l6
	ldsw	[%l7 + 0x5C],	%i5
	fmovspos	%icc,	%f29,	%f24
	addcc	%g2,	0x0F90,	%g5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsw	[%l7 + 0x64],	%l3
	movre	%i0,	0x11D,	%l1
	sdiv	%o0,	0x020F,	%g3
	movg	%icc,	%o1,	%g4
	flush	%l7 + 0x68
	ldd	[%l7 + 0x40],	%o2
	fmovdl	%xcc,	%f22,	%f16
	ba,pn	%icc,	loop_254
	stx	%l5,	[%l7 + 0x10]
	movg	%xcc,	%i2,	%g1
	brz	%g6,	loop_255
loop_254:
	fandnot2s	%f23,	%f10,	%f15
	fcmple32	%f28,	%f28,	%o5
	sethi	0x0133,	%o7
loop_255:
	fbn,a	%fcc2,	loop_256
	tgu	%icc,	0x0
	fnot1	%f26,	%f4
	ldsw	[%l7 + 0x10],	%i7
loop_256:
	nop
	add	%l7,	0x38,	%l6
	wr	%g0,	0x10,	%asi
	casa	[%l6] %asi,	%g7,	%l4
	fmovsne	%xcc,	%f31,	%f19
	fnegs	%f15,	%f14
	ldd	[%l7 + 0x08],	%o2
	movrlez	%i3,	0x09D,	%i6
	tvc	%icc,	0x6
	nop
	setx	0x1CD287932CDDAF55,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0x697E4B91D7226D59,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	fdivd	%f30,	%f4,	%f6
	orncc	%i4,	0x02F4,	%i1
	edge32ln	%l0,	%o6,	%o4
	bcs	%xcc,	loop_257
	stw	%l6,	[%l7 + 0x58]
	movneg	%xcc,	%i5,	%g2
	fbn	%fcc2,	loop_258
loop_257:
	srax	%g5,	0x1A,	%l3
	sdivcc	%l2,	0x0757,	%i0
	fzeros	%f27
loop_258:
	movrlz	%o0,	%l1,	%o1
	fmovdne	%icc,	%f26,	%f10
	stbar
	movge	%icc,	%g3,	%g4
	ldub	[%l7 + 0x30],	%l5
	nop
	setx	0xC83192CE207CC52B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x40]
	ldx	[%l7 + 0x40],	%fsr
	bl	loop_259
	addcc	%i2,	%g1,	%g6
	fmuld8sux16	%f29,	%f26,	%f20
	bshuffle	%f16,	%f10,	%f10
loop_259:
	nop
	set	0x4C, %l1
	sta	%f8,	[%l7 + %l1] 0x81
	mulscc	%o3,	%o7,	%i7
	udivx	%o5,	0x18C9,	%l4
	nop
	set	0x0E, %o2
	ldstub	[%l7 + %o2],	%o2
	movcc	%xcc,	%g7,	%i3
	xnor	%i6,	0x0827,	%i1
	bge,pt	%icc,	loop_260
	array8	%l0,	%o6,	%o4
	call	loop_261
	andncc	%l6,	%i4,	%i5
loop_260:
	fcmple32	%f22,	%f12,	%g2
	and	%l3,	%l2,	%i0
loop_261:
	nop
	setx	0x0EED1915E06306B3,	%l0,	%l6
	stx	%l6,	[%l7 + 0x18]
	ldx	[%l7 + 0x18],	%fsr
	tneg	%icc,	0x2
	taddcc	%o0,	0x172E,	%g5
	movle	%icc,	%l1,	%o1
	set	0x22, %o6
	stha	%g3,	[%l7 + %o6] 0xea
	membar	#Sync
	for	%f8,	%f28,	%f4
	wr	%g0,	0xe2,	%asi
	stba	%l5,	[%l7 + 0x0C] %asi
	membar	#Sync
	sethi	0x1031,	%i2
	movpos	%xcc,	%g1,	%g4
	addc	%o3,	%g6,	%i7
	wr	%g0,	0x04,	%asi
	stba	%o7,	[%l7 + 0x25] %asi
	tsubcc	%l4,	0x0CAB,	%o2
	movg	%icc,	%g7,	%i3
	fsrc2	%f12,	%f18
	movre	%o5,	0x009,	%i1
	bleu	%xcc,	loop_262
	udiv	%l0,	0x0182,	%o6
	fmovdvc	%icc,	%f24,	%f6
	bleu,a	loop_263
loop_262:
	sra	%o4,	0x19,	%i6
	sra	%l6,	0x17,	%i5
	ble,pn	%xcc,	loop_264
loop_263:
	std	%f14,	[%l7 + 0x18]
	nop
	fitos	%f7,	%f12
	fstoi	%f12,	%f22
	bge	%xcc,	loop_265
loop_264:
	ta	%xcc,	0x1
	movne	%icc,	%i4,	%g2
	fmovde	%icc,	%f9,	%f29
loop_265:
	nop
	wr	%g0,	0x80,	%asi
	ldxa	[%l7 + 0x50] %asi,	%l2
	movrgz	%l3,	0x396,	%o0
	xnor	%i0,	%l1,	%g5
	taddcctv	%g3,	%l5,	%i2
	edge16l	%g1,	%o1,	%o3
	movrne	%g4,	0x3B5,	%i7
	fnegd	%f14,	%f20
	sir	0x000D
	tgu	%xcc,	0x0
	or	%o7,	0x128A,	%g6
	or	%l4,	%o2,	%i3
	movleu	%xcc,	%g7,	%i1
	edge32n	%o5,	%l0,	%o4
	movgu	%xcc,	%o6,	%l6
	brlz	%i5,	loop_266
	edge16n	%i6,	%i4,	%g2
	wr	%g0,	0x2f,	%asi
	ldda	[%l7 + 0x30] %asi,	%l2
loop_266:
	edge16	%l3,	%o0,	%i0
	movgu	%icc,	%g5,	%g3
	xnor	%l1,	0x18BC,	%l5
	movrlz	%i2,	%o1,	%g1
	sdivcc	%o3,	0x11B0,	%i7
	tsubcc	%o7,	%g6,	%l4
	edge16	%g4,	%i3,	%o2
	fmovd	%f30,	%f22
	membar	0x3B
	movg	%xcc,	%g7,	%o5
	addc	%i1,	%o4,	%o6
	sub	%l0,	0x0C6F,	%l6
	fxnors	%f15,	%f15,	%f14
	nop
	setx loop_267, %l0, %l1
	jmpl %l1, %i6
	fbge	%fcc2,	loop_268
	movvc	%icc,	%i5,	%i4
	xnor	%g2,	0x1833,	%l2
loop_267:
	edge32n	%l3,	%o0,	%g5
loop_268:
	call	loop_269
	edge32l	%g3,	%l1,	%i0
	nop
	setx	0x0922D92B,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f26
	fsqrts	%f26,	%f23
	ld	[%l7 + 0x30],	%f30
loop_269:
	nop
	set	0x14, %i1
	sta	%f4,	[%l7 + %i1] 0x88
	tvc	%icc,	0x0
	xnorcc	%l5,	%i2,	%o1
	tvc	%icc,	0x3
	movne	%icc,	%g1,	%o3
	tvs	%icc,	0x7
	nop
	fitos	%f6,	%f21
	fstox	%f21,	%f26
	fxtos	%f26,	%f30
	movrne	%i7,	%o7,	%l4
	tleu	%icc,	0x4
	sdiv	%g6,	0x02E1,	%g4
	mova	%icc,	%i3,	%g7
	bvc,pt	%icc,	loop_270
	tne	%icc,	0x5
	stx	%o2,	[%l7 + 0x28]
	taddcc	%i1,	%o5,	%o4
loop_270:
	fxnors	%f22,	%f18,	%f14
	edge16ln	%o6,	%l0,	%i6
	fble	%fcc3,	loop_271
	tle	%xcc,	0x3
	movvs	%icc,	%i5,	%i4
	tn	%xcc,	0x7
loop_271:
	movrlz	%g2,	%l2,	%l6
	fmovsg	%xcc,	%f31,	%f12
	movrlez	%l3,	%o0,	%g3
	fmovda	%xcc,	%f6,	%f30
	sir	0x1CA2
	array16	%l1,	%i0,	%l5
	udivcc	%g5,	0x080E,	%o1
	fmovdvc	%xcc,	%f21,	%f6
	sir	0x06B3
	nop
	set	0x50, %l4
	lduh	[%l7 + %l4],	%g1
	fbu	%fcc0,	loop_272
	ta	%icc,	0x3
	fsrc1s	%f21,	%f25
	sll	%o3,	%i7,	%o7
loop_272:
	move	%icc,	%i2,	%l4
	xorcc	%g4,	%g6,	%i3
	add	%o2,	0x1CD6,	%i1
	fone	%f28
	array8	%g7,	%o5,	%o6
	fbne,a	%fcc3,	loop_273
	bshuffle	%f6,	%f8,	%f18
	fbuge	%fcc1,	loop_274
	edge8n	%l0,	%o4,	%i6
loop_273:
	fbge	%fcc2,	loop_275
	movleu	%icc,	%i5,	%i4
loop_274:
	brz	%l2,	loop_276
	nop
	setx	0xDC44F854DE29F68A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	fsqrtd	%f26,	%f10
loop_275:
	taddcc	%g2,	0x0C23,	%l3
	edge32n	%o0,	%g3,	%l1
loop_276:
	array8	%i0,	%l6,	%l5
	tge	%icc,	0x4
	srax	%o1,	%g1,	%o3
	srax	%i7,	%g5,	%o7
	fbn	%fcc1,	loop_277
	fmovrsgez	%l4,	%f30,	%f15
	fbul,a	%fcc1,	loop_278
	alignaddrl	%i2,	%g6,	%g4
loop_277:
	movne	%icc,	%i3,	%i1
	faligndata	%f28,	%f2,	%f20
loop_278:
	tgu	%xcc,	0x0
	fmovrse	%g7,	%f3,	%f29
	fmovdgu	%xcc,	%f5,	%f26
	bn,a	%icc,	loop_279
	fmovde	%xcc,	%f17,	%f0
	udiv	%o2,	0x1EF2,	%o5
	sethi	0x1557,	%o6
loop_279:
	xorcc	%l0,	0x095D,	%o4
	andncc	%i6,	%i5,	%i4
	xnor	%l2,	0x1E76,	%l3
	srlx	%g2,	%g3,	%l1
	fandnot1s	%f3,	%f12,	%f6
	nop
	set	0x60, %g4
	ldsh	[%l7 + %g4],	%i0
	te	%xcc,	0x7
	tvs	%icc,	0x2
	wr	%g0,	0x04,	%asi
	sta	%f11,	[%l7 + 0x2C] %asi
	st	%f16,	[%l7 + 0x5C]
	bn	loop_280
	edge16ln	%l6,	%l5,	%o0
	subccc	%g1,	0x0038,	%o3
	flush	%l7 + 0x24
loop_280:
	nop
	fitos	%f0,	%f12
	fstox	%f12,	%f18
	fsrc2	%f2,	%f22
	and	%o1,	%g5,	%o7
	movcs	%icc,	%l4,	%i2
	movcs	%icc,	%g6,	%i7
	nop
	setx	0xF6FC137280674744,	%l0,	%l6
	stx	%l6,	[%l7 + 0x78]
	ldx	[%l7 + 0x78],	%fsr
	movge	%icc,	%g4,	%i3
	tn	%xcc,	0x1
	edge16n	%g7,	%i1,	%o5
	movre	%o6,	%o2,	%o4
	subccc	%i6,	0x02BD,	%i5
	edge8n	%l0,	%i4,	%l2
	nop
	setx	0x3BEA0F5730935250,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0x202C8579B36BB0FB,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	fdivd	%f6,	%f20,	%f4
	orcc	%l3,	0x1737,	%g3
	bvc	loop_281
	movle	%xcc,	%g2,	%i0
	mulscc	%l1,	%l6,	%l5
	add	%l7,	0x70,	%l6
	wr	%g0,	0x11,	%asi
	lda	[%l6] %asi,	%g1
	casa	[%l6] 0x11,	%g1,	%o0
loop_281:
	brnz	%o3,	loop_282
	ble,a,pn	%icc,	loop_283
	tsubcctv	%g5,	%o1,	%o7
	bshuffle	%f20,	%f26,	%f22
loop_282:
	edge16n	%l4,	%g6,	%i7
loop_283:
	tle	%icc,	0x7
	tcs	%icc,	0x3
	fbg	%fcc0,	loop_284
	movre	%i2,	0x035,	%i3
	fones	%f10
	edge8	%g7,	%g4,	%o5
loop_284:
	nop
	setx	loop_285,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	srlx	%o6,	0x04,	%i1
	nop
	fitos	%f9,	%f30
	fstox	%f30,	%f10
	fpsub32s	%f24,	%f0,	%f5
loop_285:
	nop
	set	0x6E, %i0
	lduha	[%l7 + %i0] 0x18,	%o2
	for	%f0,	%f26,	%f26
	sdivx	%o4,	0x1A24,	%i6
	wr	%g0,	0x04,	%asi
	ldsha	[%l7 + 0x40] %asi,	%l0
	fabsd	%f20,	%f18
	swap	[%l7 + 0x54],	%i4
	edge8l	%i5,	%l2,	%l3
	tneg	%icc,	0x2
	edge8	%g3,	%g2,	%l1
	fmovspos	%icc,	%f25,	%f10
	movre	%l6,	%l5,	%i0
	fmovsneg	%icc,	%f2,	%f23
	set	0x7E, %g3
	stba	%g1,	[%l7 + %g3] 0x18
	fnot2	%f6,	%f24
	sdivcc	%o0,	0x0801,	%g5
	te	%icc,	0x2
	fmovspos	%xcc,	%f25,	%f16
	edge32	%o1,	%o3,	%l4
	fmovsg	%icc,	%f24,	%f3
	te	%xcc,	0x7
	be,a	loop_286
	stbar
	smulcc	%o7,	0x1F68,	%g6
	fmovsne	%icc,	%f11,	%f28
loop_286:
	nop
	wr	%g0,	0x18,	%asi
	ldstuba	[%l7 + 0x56] %asi,	%i7
	fnot2s	%f24,	%f30
	popc	%i2,	%i3
	fnot2	%f10,	%f28
	movpos	%icc,	%g7,	%o5
	membar	0x0D
	edge16ln	%o6,	%g4,	%o2
	fbuge,a	%fcc2,	loop_287
	nop
	setx	0x753EC651504AD643,	%l0,	%l6
	stx	%l6,	[%l7 + 0x48]
	ldx	[%l7 + 0x48],	%fsr
	edge16ln	%o4,	%i1,	%i6
	edge16l	%i4,	%i5,	%l2
loop_287:
	nop
	set	0x58, %g7
	ldsha	[%l7 + %g7] 0x19,	%l3
	xor	%g3,	%g2,	%l1
	fbuge,a	%fcc0,	loop_288
	fmovrdne	%l0,	%f12,	%f26
	tsubcc	%l5,	%i0,	%l6
	te	%icc,	0x3
loop_288:
	brz,a	%o0,	loop_289
	fmovsvc	%xcc,	%f16,	%f8
	bvc	%xcc,	loop_290
	movcc	%xcc,	%g1,	%o1
loop_289:
	tge	%icc,	0x4
	edge8ln	%o3,	%g5,	%l4
loop_290:
	movrlz	%o7,	0x28F,	%i7
	movrgez	%g6,	%i2,	%i3
	brgez,a	%g7,	loop_291
	ta	%xcc,	0x5
	tsubcctv	%o6,	%o5,	%o2
	movl	%xcc,	%o4,	%i1
loop_291:
	fmovrdne	%i6,	%f6,	%f14
	fpsub32s	%f9,	%f20,	%f12
	udivcc	%i4,	0x1A2B,	%g4
	swap	[%l7 + 0x34],	%l2
	movvs	%xcc,	%i5,	%l3
	fpack32	%f0,	%f30,	%f16
	fbn	%fcc2,	loop_292
	tvs	%xcc,	0x3
	tvc	%xcc,	0x5
	sra	%g3,	%l1,	%g2
loop_292:
	subcc	%l0,	0x01F3,	%l5
	te	%icc,	0x4
	srl	%l6,	0x06,	%o0
	bgu,a,pt	%icc,	loop_293
	tgu	%icc,	0x6
	popc	%i0,	%o1
	sth	%o3,	[%l7 + 0x32]
loop_293:
	alignaddr	%g5,	%l4,	%g1
	fpmerge	%f25,	%f23,	%f22
	tcc	%icc,	0x1
	umulcc	%o7,	0x1328,	%i7
	mulscc	%g6,	0x17A3,	%i3
	udivcc	%g7,	0x09E2,	%o6
	fpsub16s	%f20,	%f7,	%f15
	fpack32	%f8,	%f24,	%f4
	brnz,a	%i2,	loop_294
	nop
	setx	0x040D92C891071C6A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0x62F1387D27B3F9F3,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	fmuld	%f10,	%f14,	%f26
	tleu	%icc,	0x6
	orn	%o2,	0x1D75,	%o5
loop_294:
	sth	%o4,	[%l7 + 0x3E]
	edge8l	%i1,	%i4,	%g4
	fpsub16s	%f14,	%f27,	%f10
	fbul	%fcc1,	loop_295
	edge8l	%i6,	%l2,	%i5
	edge8n	%l3,	%l1,	%g3
	srlx	%l0,	%g2,	%l6
loop_295:
	sub	%l5,	0x16B0,	%o0
	ldstub	[%l7 + 0x5B],	%i0
	fcmpeq16	%f2,	%f22,	%o1
	fbo	%fcc3,	loop_296
	movcs	%xcc,	%o3,	%g5
	wr	%g0,	0x18,	%asi
	ldsba	[%l7 + 0x60] %asi,	%g1
loop_296:
	prefetch	[%l7 + 0x1C],	 0x1
	fsrc1	%f26,	%f24
	xnor	%l4,	%i7,	%g6
	st	%f0,	[%l7 + 0x20]
	subc	%i3,	%o7,	%o6
	movcc	%icc,	%g7,	%o2
	fmovrdlz	%i2,	%f26,	%f26
	tcs	%icc,	0x6
	subccc	%o5,	0x1B92,	%i1
	edge8n	%o4,	%i4,	%i6
	add	%l7,	0x38,	%l6
	wr	%g0,	0x11,	%asi
	ldxa	[%l6] %asi,	%g4
	casxa	[%l6] 0x11,	%g4,	%i5
	array32	%l3,	%l1,	%g3
	edge32n	%l0,	%g2,	%l2
	nop
	fitod	%f12,	%f6
	fdtox	%f6,	%f14
	fxtod	%f14,	%f0
	sdivx	%l6,	0x0D48,	%l5
	set	0x14, %o1
	stba	%o0,	[%l7 + %o1] 0x14
	movneg	%xcc,	%i0,	%o3
	nop
	set	0x0C, %o0
	ldsw	[%l7 + %o0],	%o1
	fbuge,a	%fcc0,	loop_297
	xnor	%g5,	%l4,	%i7
	movneg	%xcc,	%g6,	%g1
	fone	%f0
loop_297:
	fmovsa	%xcc,	%f29,	%f10
	mulx	%o7,	%i3,	%o6
	edge16ln	%g7,	%i2,	%o5
	ldsh	[%l7 + 0x1A],	%i1
	xnor	%o4,	0x1888,	%i4
	fmovsgu	%icc,	%f21,	%f13
	fmovsvs	%icc,	%f6,	%f9
	stb	%i6,	[%l7 + 0x62]
	nop
	fitod	%f20,	%f20
	nop
	setx	0x606EE766,	%l0,	%l6
	st	%l6,	[%l7 + 0x1C]
	ld	[%l7 + 0x1C],	%fsr
	tne	%xcc,	0x6
	ldsh	[%l7 + 0x70],	%g4
	bcs,a	%icc,	loop_298
	sdivx	%i5,	0x1D46,	%o2
	movne	%xcc,	%l1,	%l3
	fmovrdgz	%l0,	%f14,	%f22
loop_298:
	nop
	set	0x68, %i7
	prefetcha	[%l7 + %i7] 0x10,	 0x2
	fbge,a	%fcc0,	loop_299
	fsrc2	%f0,	%f28
	ba,a	loop_300
	tleu	%icc,	0x4
loop_299:
	fmovrdgez	%l2,	%f12,	%f14
	fpmerge	%f12,	%f1,	%f2
loop_300:
	subccc	%l6,	%g2,	%l5
	array8	%o0,	%o3,	%i0
	nop
	set	0x40, %l6
	ldsw	[%l7 + %l6],	%g5
	fblg	%fcc0,	loop_301
	brgez	%l4,	loop_302
	edge32n	%i7,	%o1,	%g6
	sllx	%g1,	0x01,	%i3
loop_301:
	fsrc2	%f6,	%f30
loop_302:
	ldstub	[%l7 + 0x73],	%o6
	ta	%xcc,	0x0
	movrgez	%o7,	0x35B,	%g7
	udivcc	%i2,	0x19B1,	%o5
	srax	%o4,	%i4,	%i1
	ld	[%l7 + 0x60],	%f10
	fxnors	%f22,	%f31,	%f22
	movpos	%xcc,	%i6,	%i5
	tl	%icc,	0x6
	st	%f4,	[%l7 + 0x0C]
	tle	%icc,	0x6
	bvs,pn	%icc,	loop_303
	nop
	setx	0xD049D4A0,	%l0,	%l6
	st	%l6,	[%l7 + 0x60]
	ld	[%l7 + 0x60],	%fsr
	movrne	%g4,	%o2,	%l3
	fsrc2s	%f16,	%f16
loop_303:
	bvs,pt	%xcc,	loop_304
	udivx	%l0,	0x1495,	%g3
	mulx	%l1,	%l6,	%g2
	subc	%l5,	%l2,	%o3
loop_304:
	andncc	%o0,	%g5,	%i0
	srl	%l4,	%i7,	%g6
	fandnot1	%f22,	%f30,	%f24
	subc	%o1,	0x0673,	%i3
	nop
	setx	0xB04673EE,	%l0,	%l6
	st	%l6,	[%l7 + 0x74]
	ld	[%l7 + 0x74],	%fsr
	wr	%g0,	0x81,	%asi
	lduwa	[%l7 + 0x20] %asi,	%g1
	add	%o6,	0x14BD,	%g7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tge	%xcc,	0x2
	subccc	%i2,	%o7,	%o4
	taddcctv	%o5,	%i4,	%i6
	tvs	%xcc,	0x0
	wr	%g0,	0x81,	%asi
	stwa	%i1,	[%l7 + 0x44] %asi
	fbule,a	%fcc1,	loop_305
	prefetch	[%l7 + 0x24],	 0x3
	or	%i5,	0x0ED4,	%g4
	edge8n	%o2,	%l0,	%g3
loop_305:
	sllx	%l3,	%l1,	%l6
	addc	%l5,	0x0C83,	%g2
	fmovsne	%icc,	%f5,	%f22
	orcc	%l2,	%o3,	%o0
	bpos,a,pn	%icc,	loop_306
	tvc	%icc,	0x2
	membar	0x1E
	sllx	%i0,	%l4,	%g5
loop_306:
	flush	%l7 + 0x44
	orncc	%i7,	%g6,	%i3
	set	0x50, %o7
	stha	%o1,	[%l7 + %o7] 0xeb
	membar	#Sync
	andncc	%o6,	%g7,	%g1
	tcs	%xcc,	0x2
	fmovsn	%xcc,	%f31,	%f15
	fbe	%fcc2,	loop_307
	sll	%o7,	0x08,	%i2
	ble,a,pt	%xcc,	loop_308
	popc	%o5,	%i4
loop_307:
	fmovsn	%icc,	%f17,	%f21
	movn	%icc,	%o4,	%i6
loop_308:
	fmovdl	%icc,	%f15,	%f0
	xorcc	%i1,	0x1EBD,	%i5
	fblg,a	%fcc3,	loop_309
	bshuffle	%f20,	%f14,	%f28
	edge32n	%o2,	%g4,	%l0
	udiv	%g3,	0x04A7,	%l3
loop_309:
	nop
	setx	0x187BF872,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f1
	setx	0x29C38BDF,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f15
	fsubs	%f15,	%f1,	%f4
	ta	%icc,	0x7
	andn	%l6,	0x1C4E,	%l5
	bleu	loop_310
	fmovrsgz	%g2,	%f31,	%f19
	fsrc2s	%f15,	%f22
	bcs,a	loop_311
loop_310:
	te	%icc,	0x0
	ble,pt	%icc,	loop_312
	move	%icc,	%l2,	%l1
loop_311:
	tg	%xcc,	0x6
	xorcc	%o0,	%i0,	%l4
loop_312:
	fmovsvc	%xcc,	%f23,	%f23
	tge	%xcc,	0x2
	tsubcc	%o3,	0x1D9B,	%g5
	fzero	%f24
	andn	%i7,	%g6,	%o1
	xorcc	%o6,	0x0C2A,	%g7
	andn	%i3,	%g1,	%i2
	orncc	%o7,	0x02B6,	%i4
	srlx	%o4,	0x0B,	%i6
	fbul,a	%fcc2,	loop_313
	mulx	%i1,	%o5,	%i5
	wr	%g0,	0x11,	%asi
	stwa	%o2,	[%l7 + 0x74] %asi
loop_313:
	sdivx	%l0,	0x1B0A,	%g4
	smul	%l3,	0x1826,	%l6
	bn,a	%xcc,	loop_314
	edge32	%g3,	%g2,	%l2
	movle	%xcc,	%l5,	%o0
	movrgz	%i0,	0x027,	%l4
loop_314:
	sdiv	%o3,	0x15D9,	%l1
	movn	%icc,	%i7,	%g5
	mulscc	%g6,	%o1,	%o6
	fba,a	%fcc2,	loop_315
	stbar
	udiv	%g7,	0x0C6B,	%i3
	fnot2s	%f20,	%f1
loop_315:
	fsrc1s	%f19,	%f20
	movne	%xcc,	%i2,	%g1
	sdiv	%o7,	0x16CB,	%o4
	andn	%i4,	%i1,	%i6
	swap	[%l7 + 0x3C],	%o5
	stb	%o2,	[%l7 + 0x5D]
	fbl,a	%fcc1,	loop_316
	fabsd	%f2,	%f26
	movl	%icc,	%l0,	%g4
	tpos	%xcc,	0x2
loop_316:
	nop
	setx	0xA953A715C0679D94,	%l0,	%l6
	stx	%l6,	[%l7 + 0x60]
	ldx	[%l7 + 0x60],	%fsr
	add	%i5,	%l3,	%g3
	stb	%g2,	[%l7 + 0x49]
	sllx	%l2,	%l5,	%o0
	movl	%xcc,	%l6,	%i0
	addcc	%o3,	0x0243,	%l1
	array16	%l4,	%g5,	%i7
	fmovdg	%icc,	%f19,	%f13
	movl	%icc,	%o1,	%g6
	xor	%o6,	%i3,	%g7
	array32	%i2,	%o7,	%o4
	fbul,a	%fcc3,	loop_317
	tn	%icc,	0x4
	tneg	%xcc,	0x2
	set	0x08, %o5
	ldxa	[%l7 + %o5] 0x10,	%i4
loop_317:
	movrlz	%i1,	%i6,	%g1
	udivcc	%o2,	0x02F4,	%l0
	movvs	%icc,	%o5,	%g4
	xnorcc	%l3,	%g3,	%i5
	sllx	%l2,	%g2,	%o0
	prefetch	[%l7 + 0x58],	 0x1
	sllx	%l5,	%l6,	%o3
	fxnors	%f21,	%f2,	%f9
	umulcc	%l1,	%l4,	%g5
	bg,a	loop_318
	move	%xcc,	%i7,	%o1
	sub	%g6,	%i0,	%i3
	fornot2	%f0,	%f12,	%f22
loop_318:
	fmovsvs	%icc,	%f21,	%f10
	tne	%xcc,	0x3
	srax	%g7,	%i2,	%o6
	tleu	%icc,	0x4
	fnot1s	%f12,	%f13
	andncc	%o4,	%o7,	%i1
	set	0x29, %o3
	ldsba	[%l7 + %o3] 0x0c,	%i4
	orn	%i6,	%o2,	%g1
	xnor	%l0,	%g4,	%l3
	mulscc	%g3,	%i5,	%o5
	alignaddrl	%g2,	%o0,	%l5
	set	0x40, %l2
	stda	%f16,	[%l7 + %l2] 0x89
	fmovrsne	%l6,	%f0,	%f2
	orcc	%l2,	%l1,	%l4
	fmovspos	%xcc,	%f31,	%f14
	fblg	%fcc2,	loop_319
	andncc	%o3,	%i7,	%g5
	fmovscs	%icc,	%f0,	%f31
	wr	%g0,	0x18,	%asi
	sta	%f12,	[%l7 + 0x28] %asi
loop_319:
	tcc	%xcc,	0x1
	mulx	%g6,	0x0C30,	%o1
	tn	%xcc,	0x2
	tvc	%icc,	0x3
	fone	%f8
	edge16l	%i0,	%g7,	%i2
	xorcc	%i3,	0x02AC,	%o4
	subccc	%o7,	0x09EE,	%i1
	movvs	%icc,	%o6,	%i4
	taddcctv	%i6,	0x1003,	%g1
	sdiv	%o2,	0x0EC6,	%l0
	fxor	%f2,	%f4,	%f8
	edge32n	%l3,	%g4,	%g3
	stw	%o5,	[%l7 + 0x28]
	ldsw	[%l7 + 0x28],	%g2
	srl	%i5,	%o0,	%l6
	fors	%f22,	%f20,	%f12
	umul	%l2,	0x0A33,	%l1
	edge16n	%l5,	%o3,	%i7
	membar	0x33
	fmovrslez	%g5,	%f3,	%f24
	tvs	%xcc,	0x4
	sra	%l4,	0x17,	%g6
	fpackfix	%f4,	%f2
	fmovrse	%o1,	%f3,	%f0
	fnot2s	%f0,	%f1
	wr	%g0,	0x88,	%asi
	stxa	%g7,	[%l7 + 0x38] %asi
	tl	%xcc,	0x4
	udiv	%i2,	0x120C,	%i0
	fornot2s	%f27,	%f16,	%f23
	fmovde	%icc,	%f27,	%f9
	addcc	%o4,	%i3,	%o7
	orncc	%i1,	%i4,	%i6
	fmovda	%icc,	%f1,	%f14
	tcc	%icc,	0x0
	add	%o6,	0x00CB,	%g1
	nop 	! 	nop 	! 	wr	%g0,	0x40,	%asi ripped by fixASI40.pl ripped by fixASI40.pl
	nop 	! 	nop 	! 	stxa	%o2,	[%g0 + 0x178] %asi ripped by fixASI40.pl ripped by fixASI40.pl
	fnot1s	%f12,	%f18
	fmovdcc	%xcc,	%f7,	%f14
	tsubcc	%l3,	0x1834,	%l0
	tcc	%xcc,	0x6
	fxor	%f4,	%f14,	%f2
	fnegs	%f17,	%f11
	set	0x60, %i3
	ldda	[%l7 + %i3] 0x24,	%g4
	movpos	%icc,	%g3,	%g2
	set	0x14, %l5
	stha	%o5,	[%l7 + %l5] 0x11
	fpadd16	%f26,	%f24,	%f0
	array32	%i5,	%l6,	%o0
	call	loop_320
	srax	%l2,	0x03,	%l5
	edge16l	%o3,	%l1,	%i7
	fors	%f5,	%f26,	%f27
loop_320:
	bne	loop_321
	brlz,a	%l4,	loop_322
	movge	%xcc,	%g5,	%o1
	taddcc	%g6,	0x0A1C,	%g7
loop_321:
	xorcc	%i2,	%i0,	%o4
loop_322:
	edge8ln	%i3,	%i1,	%o7
	tne	%icc,	0x0
	fmovsneg	%icc,	%f11,	%f13
	sub	%i4,	%o6,	%g1
	tg	%xcc,	0x4
	movn	%xcc,	%i6,	%o2
	addcc	%l0,	%l3,	%g3
	ta	%xcc,	0x3
	mova	%icc,	%g4,	%o5
	brz,a	%g2,	loop_323
	srlx	%l6,	%o0,	%i5
	andn	%l2,	%l5,	%o3
	xor	%l1,	%i7,	%g5
loop_323:
	mova	%icc,	%l4,	%o1
	fbule	%fcc3,	loop_324
	te	%icc,	0x7
	addccc	%g6,	0x13CE,	%g7
	bneg,a,pt	%icc,	loop_325
loop_324:
	nop
	fitos	%f26,	%f9
	movn	%icc,	%i2,	%i0
	tcs	%xcc,	0x1
loop_325:
	nop
	setx	0x15D8C566A047AF74,	%l0,	%l6
	stx	%l6,	[%l7 + 0x10]
	ldx	[%l7 + 0x10],	%fsr
	tne	%icc,	0x1
	fmovrdlez	%i3,	%f12,	%f20
	sethi	0x11A6,	%i1
	umulcc	%o4,	0x0684,	%o7
	fmuld8sux16	%f27,	%f9,	%f6
	tsubcctv	%i4,	%o6,	%i6
	tpos	%xcc,	0x4
	sub	%g1,	0x0E6B,	%o2
	sth	%l0,	[%l7 + 0x64]
	brgez,a	%g3,	loop_326
	tsubcc	%g4,	0x0665,	%l3
	fmovda	%xcc,	%f17,	%f13
	edge32l	%o5,	%g2,	%l6
loop_326:
	edge8n	%i5,	%o0,	%l2
	xnor	%o3,	0x0DE9,	%l1
	tl	%icc,	0x0
	xorcc	%l5,	0x1F72,	%g5
	flush	%l7 + 0x18
	fbu,a	%fcc1,	loop_327
	fpsub16	%f16,	%f8,	%f10
	umulcc	%i7,	0x172E,	%o1
	fbo,a	%fcc0,	loop_328
loop_327:
	addcc	%g6,	%l4,	%i2
	movgu	%xcc,	%g7,	%i0
	orncc	%i3,	%i1,	%o7
loop_328:
	tge	%icc,	0x7
	addccc	%o4,	0x0D47,	%o6
	fbule	%fcc3,	loop_329
	xor	%i4,	%i6,	%g1
	nop
	setx	0x81A1F399,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f15
	setx	0xF24A9A81,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f8
	fadds	%f8,	%f15,	%f11
	taddcctv	%l0,	0x15F5,	%g3
loop_329:
	umul	%g4,	0x1819,	%o2
	smulcc	%o5,	0x0AA8,	%g2
	swap	[%l7 + 0x14],	%l6
	addc	%l3,	0x14CB,	%i5
	fmovrsgz	%o0,	%f9,	%f29
	movpos	%icc,	%l2,	%l1
	tg	%xcc,	0x4
	fbuge	%fcc1,	loop_330
	movle	%icc,	%o3,	%l5
	edge16	%g5,	%o1,	%g6
	movcc	%xcc,	%l4,	%i2
loop_330:
	umul	%i7,	0x02C5,	%g7
	fmovdcc	%icc,	%f19,	%f9
	wr	%g0,	0x89,	%asi
	ldstuba	[%l7 + 0x7C] %asi,	%i0
	movne	%xcc,	%i1,	%i3
	andncc	%o7,	%o6,	%o4
	tsubcctv	%i4,	%g1,	%i6
	fbo,a	%fcc0,	loop_331
	orcc	%g3,	%g4,	%l0
	fpadd16	%f22,	%f2,	%f16
	fbl,a	%fcc3,	loop_332
loop_331:
	udivx	%o5,	0x1E9C,	%g2
	umulcc	%o2,	%l6,	%i5
	movcs	%xcc,	%o0,	%l2
loop_332:
	edge32l	%l3,	%l1,	%l5
	nop
	setx	0x5832ED5BA370752E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	fsqrtd	%f10,	%f20
	bneg,a,pt	%icc,	loop_333
	orncc	%o3,	%g5,	%g6
	movrlez	%l4,	0x2B0,	%i2
	fnors	%f13,	%f15,	%f21
loop_333:
	movneg	%xcc,	%o1,	%i7
	tneg	%icc,	0x2
	fbo,a	%fcc3,	loop_334
	fbo	%fcc2,	loop_335
	andcc	%i0,	0x1A3B,	%i1
	subccc	%i3,	0x0804,	%o7
loop_334:
	movvc	%icc,	%o6,	%g7
loop_335:
	fmovdvs	%icc,	%f31,	%f31
	orcc	%o4,	0x1108,	%g1
	movneg	%icc,	%i6,	%i4
	sra	%g4,	%g3,	%o5
	ldsb	[%l7 + 0x0D],	%g2
	edge16ln	%o2,	%l0,	%i5
	srl	%o0,	0x07,	%l6
	xor	%l3,	0x1739,	%l2
	tsubcc	%l5,	%l1,	%o3
	fsrc1	%f6,	%f26
	move	%icc,	%g6,	%l4
	fbuge,a	%fcc1,	loop_336
	nop
	setx	loop_337,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fmul8x16au	%f4,	%f13,	%f10
	set	0x7C, %i4
	stha	%g5,	[%l7 + %i4] 0x15
loop_336:
	tcc	%xcc,	0x2
loop_337:
	stbar
	movvc	%xcc,	%i2,	%i7
	andn	%o1,	%i1,	%i3
	tge	%xcc,	0x2
	fbug	%fcc1,	loop_338
	sdiv	%i0,	0x1F74,	%o6
	or	%g7,	%o4,	%o7
	tn	%xcc,	0x3
loop_338:
	tcc	%xcc,	0x2
	fmovrsgz	%i6,	%f9,	%f30
	addccc	%g1,	%g4,	%i4
	fornot1s	%f25,	%f20,	%f30
	movg	%icc,	%g3,	%g2
	membar	0x61
	flush	%l7 + 0x60
	orn	%o5,	0x09ED,	%o2
	fbne	%fcc1,	loop_339
	fmul8x16au	%f3,	%f23,	%f16
	srl	%i5,	0x0C,	%o0
	call	loop_340
loop_339:
	bneg,pt	%xcc,	loop_341
	movre	%l6,	%l3,	%l0
	bshuffle	%f18,	%f26,	%f10
loop_340:
	stw	%l2,	[%l7 + 0x38]
loop_341:
	ta	%icc,	0x6
	fmovdg	%icc,	%f25,	%f7
	sra	%l5,	%l1,	%g6
	alignaddrl	%l4,	%o3,	%i2
	brz	%i7,	loop_342
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mulx	%o1,	0x0B47,	%g5
	array16	%i3,	%i1,	%i0
loop_342:
	movrne	%o6,	0x0DA,	%g7
	nop
	fitos	%f2,	%f29
	fstox	%f29,	%f10
	fxtos	%f10,	%f17
	set	0x60, %i6
	ldda	[%l7 + %i6] 0xe3,	%o6
	taddcctv	%o4,	0x0E5C,	%g1
	sdiv	%g4,	0x073A,	%i6
	stb	%i4,	[%l7 + 0x6B]
	orn	%g2,	0x0F03,	%g3
	fbne	%fcc0,	loop_343
	ba	loop_344
	tn	%icc,	0x2
	movne	%icc,	%o2,	%i5
loop_343:
	fsrc2	%f14,	%f22
loop_344:
	sdiv	%o0,	0x0AF3,	%l6
	fbl,a	%fcc0,	loop_345
	movn	%icc,	%o5,	%l0
	edge32	%l2,	%l5,	%l1
	fmovrdlez	%l3,	%f8,	%f8
loop_345:
	bn	%icc,	loop_346
	tle	%icc,	0x5
	edge32ln	%l4,	%g6,	%i2
	edge32	%i7,	%o3,	%g5
loop_346:
	tneg	%icc,	0x5
	edge32	%o1,	%i3,	%i0
	and	%i1,	0x123E,	%o6
	set	0x4D, %g6
	stba	%g7,	[%l7 + %g6] 0x81
	wr	%g0,	0x04,	%asi
	lduba	[%l7 + 0x1F] %asi,	%o4
	swap	[%l7 + 0x24],	%o7
	fnor	%f24,	%f26,	%f26
	alignaddr	%g4,	%i6,	%g1
	tsubcc	%i4,	%g3,	%g2
	brgz	%o2,	loop_347
	sub	%o0,	%i5,	%o5
	orncc	%l0,	%l6,	%l2
	and	%l1,	%l3,	%l5
loop_347:
	subccc	%g6,	0x1CC3,	%l4
	xnor	%i7,	0x1E2A,	%i2
	te	%xcc,	0x7
	lduh	[%l7 + 0x46],	%o3
	addcc	%g5,	%i3,	%i0
	ldx	[%l7 + 0x40],	%o1
	edge32n	%i1,	%g7,	%o4
	fbn	%fcc2,	loop_348
	and	%o7,	%o6,	%i6
	movvc	%xcc,	%g1,	%g4
	bpos,a,pt	%icc,	loop_349
loop_348:
	edge8	%i4,	%g2,	%o2
	movrlez	%g3,	%i5,	%o5
	or	%o0,	%l0,	%l2
loop_349:
	xorcc	%l1,	%l6,	%l3
	edge8n	%g6,	%l5,	%l4
	tge	%xcc,	0x0
	addc	%i2,	%i7,	%g5
	xorcc	%o3,	%i3,	%i0
	sra	%i1,	%g7,	%o4
	lduh	[%l7 + 0x26],	%o1
	bpos,pt	%xcc,	loop_350
	sdivx	%o6,	0x0443,	%o7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movle	%xcc,	%i6,	%g4
loop_350:
	edge16n	%g1,	%g2,	%o2
	movl	%icc,	%i4,	%g3
	fexpand	%f23,	%f6
	fbo	%fcc0,	loop_351
	fmovrslez	%i5,	%f30,	%f22
	nop
	setx	0xFFFB5D84FF7ABD50,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0x394B0CF168E53023,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	fdivd	%f10,	%f26,	%f30
	be,pt	%xcc,	loop_352
loop_351:
	stw	%o0,	[%l7 + 0x2C]
	fmovsneg	%icc,	%f11,	%f6
	movg	%icc,	%o5,	%l2
loop_352:
	fmovsn	%icc,	%f20,	%f6
	fmovrdne	%l0,	%f4,	%f8
	edge32	%l1,	%l6,	%g6
	xnorcc	%l5,	%l3,	%i2
	fandnot2	%f22,	%f16,	%f12
	fble	%fcc0,	loop_353
	or	%l4,	0x0202,	%i7
	nop
	setx	loop_354,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	srax	%o3,	0x03,	%i3
loop_353:
	addccc	%i0,	%i1,	%g7
	fzero	%f10
loop_354:
	lduw	[%l7 + 0x5C],	%g5
	fmovdgu	%xcc,	%f24,	%f13
	wr	%g0,	0x04,	%asi
	lduha	[%l7 + 0x7C] %asi,	%o4
	edge32l	%o1,	%o7,	%o6
	fmovrdlz	%i6,	%f0,	%f10
	addccc	%g1,	%g4,	%o2
	move	%xcc,	%g2,	%g3
	srlx	%i5,	%o0,	%i4
	fpadd32	%f8,	%f2,	%f20
	andcc	%l2,	%o5,	%l1
	set	0x40, %g1
	ldda	[%l7 + %g1] 0x89,	%f0
	nop
	setx	0x106ED740,	%l0,	%l6
	st	%l6,	[%l7 + 0x40]
	ld	[%l7 + 0x40],	%fsr
	tneg	%xcc,	0x5
	sdivcc	%l0,	0x007C,	%g6
	ta	%xcc,	0x2
	movpos	%icc,	%l6,	%l3
	edge16n	%i2,	%l4,	%l5
	fpadd16s	%f23,	%f0,	%f21
	orcc	%i7,	0x1FE2,	%o3
	fmovrsgz	%i3,	%f12,	%f14
	tn	%xcc,	0x5
	addc	%i1,	0x02C3,	%g7
	array8	%i0,	%o4,	%o1
	for	%f30,	%f12,	%f12
	fmovsne	%xcc,	%f25,	%f13
	set	0x5E, %g5
	stha	%o7,	[%l7 + %g5] 0x10
	sll	%o6,	%i6,	%g5
	udiv	%g4,	0x0FEC,	%g1
	movcc	%icc,	%g2,	%g3
	nop
	fitos	%f5,	%f7
	fstox	%f7,	%f8
	fxtos	%f8,	%f12
	array16	%o2,	%i5,	%o0
	movrlz	%i4,	%o5,	%l2
	xnor	%l1,	%g6,	%l0
	wr	%g0,	0x11,	%asi
	lduba	[%l7 + 0x32] %asi,	%l6
	subccc	%i2,	0x1B10,	%l4
	xnorcc	%l5,	0x0A90,	%i7
	edge16ln	%o3,	%i3,	%i1
	addccc	%g7,	%l3,	%o4
	set	0x40, %l0
	stda	%f0,	[%l7 + %l0] 0x81
	fnand	%f22,	%f2,	%f12
	tl	%icc,	0x0
	smulcc	%i0,	%o7,	%o1
	edge8n	%o6,	%g5,	%i6
	fba,a	%fcc0,	loop_355
	bneg,a,pt	%xcc,	loop_356
	fmovdneg	%xcc,	%f16,	%f24
	ld	[%l7 + 0x58],	%f24
loop_355:
	ldx	[%l7 + 0x10],	%g4
loop_356:
	fble,a	%fcc2,	loop_357
	bpos,a,pt	%icc,	loop_358
	nop
	setx	0x615B4083C05D83FF,	%l0,	%l6
	stx	%l6,	[%l7 + 0x48]
	ldx	[%l7 + 0x48],	%fsr
	fmul8x16al	%f5,	%f15,	%f12
loop_357:
	fmovs	%f10,	%f2
loop_358:
	ldsb	[%l7 + 0x66],	%g2
	wr	%g0,	0x81,	%asi
	sta	%f14,	[%l7 + 0x40] %asi
	array8	%g1,	%g3,	%i5
	brgz,a	%o0,	loop_359
	edge32l	%i4,	%o5,	%o2
	movg	%xcc,	%l1,	%l2
	ldsb	[%l7 + 0x69],	%g6
loop_359:
	tle	%xcc,	0x3
	edge32l	%l0,	%l6,	%l4
	mova	%icc,	%l5,	%i2
	mulx	%i7,	0x1056,	%o3
	movcc	%icc,	%i3,	%g7
	fba,a	%fcc0,	loop_360
	fbe	%fcc2,	loop_361
	ldd	[%l7 + 0x28],	%i0
	stbar
loop_360:
	tne	%icc,	0x3
loop_361:
	ldstub	[%l7 + 0x11],	%l3
	fbne,a	%fcc2,	loop_362
	fsrc2s	%f11,	%f20
	movneg	%xcc,	%i0,	%o7
	fbul,a	%fcc1,	loop_363
loop_362:
	fmovsvs	%icc,	%f23,	%f23
	umulcc	%o1,	%o4,	%g5
	edge16ln	%o6,	%g4,	%g2
loop_363:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stb	%g1,	[%l7 + 0x4C]
	bg,a	%xcc,	loop_364
	sub	%g3,	%i5,	%i6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8ln	%i4,	%o0,	%o5
loop_364:
	fbuge,a	%fcc2,	loop_365
	taddcc	%o2,	%l1,	%g6
	movvs	%xcc,	%l0,	%l6
	orncc	%l2,	0x0898,	%l4
loop_365:
	and	%i2,	0x100A,	%i7
	tneg	%icc,	0x5
	edge16	%o3,	%i3,	%g7
	fmovdvc	%icc,	%f0,	%f6
	movpos	%xcc,	%l5,	%i1
	xnor	%i0,	0x1903,	%l3
	fmovrsgez	%o7,	%f12,	%f22
	fone	%f18
	tle	%icc,	0x2
	nop
	setx	0x3B07DCAA74E9EDD0,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	fsqrtd	%f28,	%f20
	array8	%o4,	%g5,	%o1
	sir	0x072D
	for	%f0,	%f2,	%f10
	brz,a	%g4,	loop_366
	fmovsg	%icc,	%f11,	%f22
	faligndata	%f10,	%f16,	%f24
	bpos,a,pt	%xcc,	loop_367
loop_366:
	fpackfix	%f26,	%f19
	brgz,a	%o6,	loop_368
	addcc	%g2,	0x02B2,	%g1
loop_367:
	bvc,a	%xcc,	loop_369
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
loop_368:
	fxnor	%f16,	%f24,	%f30
	movrgez	%i5,	%i6,	%i4
loop_369:
	mulx	%g3,	%o0,	%o2
loop_370:
	sth	%l1,	[%l7 + 0x7C]
	bg,a,pt	%icc,	loop_371
	umul	%o5,	0x14CE,	%g6
	edge32	%l0,	%l6,	%l2
	umul	%i2,	0x00B0,	%i7
loop_371:
	edge32	%o3,	%i3,	%l4
	or	%l5,	%i1,	%g7
	edge8l	%i0,	%l3,	%o4
	tleu	%xcc,	0x3
	fmovdcs	%icc,	%f4,	%f20
	fxor	%f24,	%f12,	%f14
	fbue,a	%fcc1,	loop_372
	ld	[%l7 + 0x20],	%f19
	fbul	%fcc0,	loop_373
	movrgez	%o7,	%g5,	%g4
loop_372:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xorcc	%o6,	%g2,	%g1
loop_373:
	fpsub16	%f20,	%f14,	%f8
	add	%o1,	0x08D5,	%i5
	fbl	%fcc2,	loop_374
	fxors	%f7,	%f6,	%f20
	movrlez	%i4,	0x2BB,	%g3
	lduh	[%l7 + 0x4C],	%i6
loop_374:
	movg	%icc,	%o0,	%o2
	flush	%l7 + 0x70
	edge16ln	%l1,	%g6,	%o5
	movpos	%xcc,	%l6,	%l0
	orncc	%i2,	%i7,	%l2
	fbuge,a	%fcc1,	loop_375
	fbue,a	%fcc1,	loop_376
	tvc	%xcc,	0x2
	movrlez	%o3,	%l4,	%i3
loop_375:
	fblg,a	%fcc3,	loop_377
loop_376:
	fxnor	%f20,	%f22,	%f10
	fsrc2s	%f29,	%f27
	xor	%l5,	0x1A7E,	%g7
loop_377:
	edge8l	%i0,	%l3,	%o4
	fmovspos	%xcc,	%f22,	%f15
	fmovdn	%icc,	%f4,	%f28
	fmul8sux16	%f18,	%f10,	%f24
	set	0x28, %o4
	lda	[%l7 + %o4] 0x10,	%f8
	nop
	setx	0xF056089D,	%l0,	%l6
	st	%l6,	[%l7 + 0x68]
	ld	[%l7 + 0x68],	%fsr
	ble,a,pt	%icc,	loop_378
	movre	%i1,	0x3A4,	%g5
	tne	%icc,	0x0
	addcc	%g4,	0x0003,	%o6
loop_378:
	fnot1s	%f16,	%f17
	tge	%xcc,	0x4
	smulcc	%g2,	%g1,	%o1
	sub	%o7,	%i5,	%i4
	mulscc	%g3,	0x1606,	%i6
	set	0x40, %i5
	stda	%f16,	[%l7 + %i5] 0x18
	fandnot1	%f10,	%f14,	%f24
	sdiv	%o2,	0x087D,	%l1
	sdivx	%g6,	0x0F9D,	%o0
	fnot2	%f18,	%f20
	add	%l6,	0x1F4B,	%l0
	movn	%xcc,	%i2,	%i7
	ldstub	[%l7 + 0x18],	%l2
	set	0x40, %g2
	stwa	%o3,	[%l7 + %g2] 0x2a
	membar	#Sync
	movleu	%xcc,	%o5,	%l4
	for	%f2,	%f6,	%f2
	sll	%i3,	0x19,	%l5
	fnegd	%f16,	%f20
	edge16l	%i0,	%g7,	%o4
	tneg	%xcc,	0x2
	ta	%xcc,	0x0
	membar	0x2A
	fmovrsgz	%i1,	%f8,	%f9
	umul	%l3,	%g4,	%o6
	xnorcc	%g5,	%g2,	%g1
	edge8n	%o1,	%i5,	%o7
	edge8ln	%g3,	%i6,	%o2
	xor	%l1,	%g6,	%i4
	movrlez	%l6,	0x2D7,	%l0
	movrne	%i2,	0x114,	%i7
	ld	[%l7 + 0x60],	%f5
	set	0x44, %i2
	ldsha	[%l7 + %i2] 0x80,	%l2
	movl	%icc,	%o0,	%o3
	sdiv	%o5,	0x0E62,	%i3
	sdiv	%l5,	0x130D,	%l4
	movge	%xcc,	%i0,	%o4
	tle	%icc,	0x4
	ble	%xcc,	loop_379
	andncc	%i1,	%l3,	%g4
	smul	%g7,	0x1A70,	%o6
	movne	%icc,	%g5,	%g1
loop_379:
	nop
	set	0x40, %l1
	ldswa	[%l7 + %l1] 0x88,	%g2
	for	%f18,	%f18,	%f2
	taddcc	%o1,	%o7,	%g3
	sethi	0x02A9,	%i5
	movcs	%icc,	%o2,	%i6
	fbn,a	%fcc2,	loop_380
	fmovrsgez	%g6,	%f30,	%f13
	brgez	%i4,	loop_381
	fnands	%f15,	%f0,	%f27
loop_380:
	be,pt	%icc,	loop_382
	taddcc	%l1,	0x11DC,	%l6
loop_381:
	tvc	%xcc,	0x0
	fmovd	%f2,	%f18
loop_382:
	fsrc1s	%f28,	%f11
	sllx	%l0,	0x17,	%i2
	nop
	fitos	%f10,	%f26
	fstoi	%f26,	%f21
	set	0x73, %l3
	stba	%l2,	[%l7 + %l3] 0x23
	membar	#Sync
	ldsh	[%l7 + 0x6E],	%o0
	ldd	[%l7 + 0x08],	%f0
	brgz	%i7,	loop_383
	nop
	setx	0xB8A5B67D,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f23
	setx	0x344A90C6,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f24
	fdivs	%f24,	%f23,	%f11
	fbul,a	%fcc2,	loop_384
	sllx	%o3,	%o5,	%l5
loop_383:
	fbn	%fcc2,	loop_385
	fmovrdlez	%l4,	%f14,	%f0
loop_384:
	movleu	%xcc,	%i3,	%o4
	tle	%icc,	0x2
loop_385:
	fmul8x16al	%f25,	%f30,	%f0
	edge32l	%i1,	%l3,	%i0
	tsubcc	%g7,	0x0F65,	%o6
	orn	%g4,	%g5,	%g1
	movrgez	%g2,	%o7,	%g3
	membar	0x26
	ldd	[%l7 + 0x70],	%f16
	tne	%xcc,	0x3
	stbar
	st	%f7,	[%l7 + 0x60]
	ba,a,pn	%xcc,	loop_386
	flush	%l7 + 0x20
	fmovdneg	%icc,	%f2,	%f21
	movrgez	%o1,	%i5,	%i6
loop_386:
	tcc	%icc,	0x5
	mulx	%o2,	%g6,	%i4
	movcs	%icc,	%l6,	%l0
	fzero	%f22
	alignaddrl	%i2,	%l2,	%o0
	fbuge,a	%fcc1,	loop_387
	tle	%xcc,	0x7
	fcmpeq32	%f22,	%f10,	%l1
	wr	%g0,	0x11,	%asi
	ldstuba	[%l7 + 0x60] %asi,	%o3
loop_387:
	fzeros	%f24
	set	0x18, %o6
	stxa	%o5,	[%l7 + %o6] 0x14
	tneg	%icc,	0x7
	tsubcc	%l5,	0x1374,	%i7
	smul	%l4,	0x11D8,	%o4
	fmuld8sux16	%f8,	%f11,	%f18
	umulcc	%i1,	%l3,	%i3
	orcc	%i0,	%g7,	%g4
	sra	%g5,	0x12,	%g1
	fblg,a	%fcc2,	loop_388
	tcc	%xcc,	0x3
	wr	%g0,	0x88,	%asi
	lduwa	[%l7 + 0x1C] %asi,	%g2
loop_388:
	fmuld8ulx16	%f7,	%f0,	%f12
	set	0x64, %i1
	stwa	%o7,	[%l7 + %i1] 0x80
	sdiv	%g3,	0x1538,	%o1
	xnorcc	%o6,	0x0916,	%i6
	tsubcc	%o2,	0x0D4E,	%i5
	movpos	%xcc,	%i4,	%l6
	nop
	setx	loop_389,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	flush	%l7 + 0x5C
	srlx	%l0,	%g6,	%i2
	set	0x08, %l4
	prefetcha	[%l7 + %l4] 0x80,	 0x1
loop_389:
	stbar
	sdiv	%l1,	0x1E76,	%o0
	taddcctv	%o3,	%l5,	%i7
	fbug,a	%fcc2,	loop_390
	umulcc	%l4,	%o5,	%i1
	movleu	%xcc,	%l3,	%o4
	set	0x24, %g4
	stha	%i3,	[%l7 + %g4] 0x81
loop_390:
	srax	%i0,	%g7,	%g5
	addcc	%g4,	%g1,	%o7
	movrlz	%g2,	%g3,	%o6
	edge16ln	%o1,	%o2,	%i6
	udivx	%i5,	0x169A,	%l6
	bl	%xcc,	loop_391
	movre	%i4,	0x0DF,	%l0
	orcc	%g6,	%l2,	%i2
	movne	%xcc,	%l1,	%o0
loop_391:
	popc	0x070E,	%o3
	membar	0x4E
	fmovsleu	%xcc,	%f31,	%f1
	movne	%xcc,	%i7,	%l5
	fmovsneg	%xcc,	%f3,	%f1
	movg	%xcc,	%o5,	%l4
	fcmpne32	%f26,	%f20,	%l3
	ldsw	[%l7 + 0x78],	%o4
	edge8l	%i1,	%i0,	%i3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addccc	%g7,	0x01EA,	%g4
	smulcc	%g5,	%g1,	%g2
	fmuld8sux16	%f10,	%f6,	%f26
	add	%l7,	0x40,	%l6
	wr	%g0,	0x10,	%asi
	casa	[%l6] %asi,	%g3,	%o6
	st	%f25,	[%l7 + 0x38]
	ldsb	[%l7 + 0x46],	%o7
	fornot2	%f18,	%f26,	%f26
	ldsb	[%l7 + 0x31],	%o2
	be	%xcc,	loop_392
	addcc	%o1,	%i6,	%l6
	edge16l	%i4,	%i5,	%g6
	sra	%l2,	0x13,	%l0
loop_392:
	ldsh	[%l7 + 0x56],	%l1
	tg	%icc,	0x1
	fmovdcs	%xcc,	%f29,	%f23
	nop
	setx	loop_393,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	orn	%o0,	0x0E8F,	%o3
	ldub	[%l7 + 0x27],	%i7
	fbul,a	%fcc1,	loop_394
loop_393:
	movleu	%xcc,	%l5,	%i2
	smul	%l4,	0x1555,	%o5
	fbu	%fcc3,	loop_395
loop_394:
	fmovdvs	%icc,	%f23,	%f14
	movvs	%xcc,	%l3,	%o4
	alignaddrl	%i1,	%i0,	%g7
loop_395:
	srlx	%g4,	0x08,	%g5
	fcmpeq32	%f16,	%f18,	%i3
	edge8	%g1,	%g2,	%g3
	stbar
	tn	%icc,	0x7
	edge8	%o7,	%o2,	%o6
	fnegd	%f14,	%f4
	movg	%icc,	%o1,	%l6
	sdiv	%i4,	0x14CD,	%i5
	fmovdge	%xcc,	%f28,	%f15
	tgu	%xcc,	0x0
	movge	%icc,	%i6,	%l2
	alignaddr	%l0,	%l1,	%o0
	bshuffle	%f12,	%f18,	%f20
	sdivx	%g6,	0x0D3D,	%i7
	andncc	%o3,	%l5,	%l4
	orn	%i2,	%l3,	%o4
	ldsw	[%l7 + 0x14],	%o5
	tsubcc	%i1,	0x07D0,	%i0
	alignaddr	%g7,	%g5,	%g4
	sdivx	%g1,	0x11D0,	%g2
	addccc	%i3,	%o7,	%g3
	fandnot2s	%f30,	%f0,	%f9
	edge8l	%o2,	%o6,	%l6
	xnor	%o1,	0x1B65,	%i4
	movn	%icc,	%i6,	%i5
	movpos	%xcc,	%l2,	%l1
	te	%xcc,	0x7
	bneg,a,pt	%xcc,	loop_396
	sllx	%l0,	%o0,	%i7
	orn	%g6,	0x04C9,	%o3
	sdiv	%l5,	0x03B3,	%l4
loop_396:
	fmovspos	%icc,	%f7,	%f15
	std	%f20,	[%l7 + 0x20]
	movvs	%xcc,	%i2,	%o4
	edge8l	%o5,	%l3,	%i0
	nop
	fitod	%f10,	%f18
	fdtoi	%f18,	%f0
	mova	%xcc,	%i1,	%g5
	fba,a	%fcc3,	loop_397
	array32	%g7,	%g4,	%g1
	tn	%icc,	0x4
	bg,a	%icc,	loop_398
loop_397:
	tleu	%icc,	0x2
	nop
	fitod	%f10,	%f12
	edge32l	%g2,	%o7,	%i3
loop_398:
	movrlez	%o2,	%o6,	%l6
	fbo,a	%fcc3,	loop_399
	fone	%f26
	add	%l7,	0x74,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] %asi,	%g3,	%i4
loop_399:
	add	%o1,	%i5,	%l2
	tle	%icc,	0x5
	fmovs	%f4,	%f12
	move	%icc,	%l1,	%i6
	fmovdgu	%icc,	%f22,	%f11
	edge8	%o0,	%l0,	%i7
	fmovdn	%icc,	%f8,	%f30
	edge8ln	%o3,	%g6,	%l4
	tcs	%icc,	0x3
	set	0x14, %o2
	lduwa	[%l7 + %o2] 0x81,	%l5
	sethi	0x16EF,	%i2
	sll	%o4,	%l3,	%o5
	bvs,a,pt	%icc,	loop_400
	ldsw	[%l7 + 0x24],	%i0
	prefetch	[%l7 + 0x0C],	 0x1
	tne	%icc,	0x2
loop_400:
	movn	%icc,	%g5,	%g7
	ldub	[%l7 + 0x3C],	%i1
	sra	%g4,	%g2,	%o7
	fnegs	%f19,	%f27
	mulx	%g1,	%o2,	%o6
	nop
	setx loop_401, %l0, %l1
	jmpl %l1, %l6
	fba	%fcc1,	loop_402
	sdiv	%g3,	0x1BE3,	%i3
	fcmple16	%f16,	%f24,	%o1
loop_401:
	nop
	wr	%g0,	0x89,	%asi
	ldxa	[%l7 + 0x08] %asi,	%i4
loop_402:
	addcc	%l2,	0x1B37,	%i5
	fmovsn	%xcc,	%f5,	%f9
	sir	0x1689
	xnor	%l1,	%i6,	%o0
	or	%i7,	%l0,	%g6
	fbe	%fcc2,	loop_403
	movrgz	%l4,	0x2F0,	%l5
	array8	%i2,	%o3,	%l3
	edge8n	%o4,	%o5,	%g5
loop_403:
	sub	%g7,	0x0903,	%i0
	fbne,a	%fcc2,	loop_404
	ta	%xcc,	0x6
	set	0x40, %i0
	stda	%f16,	[%l7 + %i0] 0x15
loop_404:
	xnor	%g4,	0x13BD,	%g2
	nop
	setx	0xE07C4208,	%l0,	%l6
	st	%l6,	[%l7 + 0x68]
	ld	[%l7 + 0x68],	%fsr
	tne	%xcc,	0x7
	movl	%xcc,	%i1,	%g1
	tvs	%xcc,	0x2
	fbul	%fcc2,	loop_405
	subcc	%o7,	0x1DC5,	%o2
	fsrc2	%f8,	%f0
	nop
	set	0x16, %g7
	ldsb	[%l7 + %g7],	%l6
loop_405:
	tge	%icc,	0x6
	mulscc	%o6,	0x0ACA,	%i3
	ldsb	[%l7 + 0x09],	%g3
	fbg,a	%fcc2,	loop_406
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bvs,a	%icc,	loop_407
	array8	%i4,	%o1,	%i5
loop_406:
	movre	%l1,	0x0DF,	%l2
	popc	%i6,	%o0
loop_407:
	fbn	%fcc1,	loop_408
	tsubcc	%i7,	%g6,	%l0
	fpadd32	%f14,	%f20,	%f28
	fmovsneg	%xcc,	%f25,	%f10
loop_408:
	fors	%f25,	%f17,	%f22
	tne	%xcc,	0x4
	bgu,pn	%icc,	loop_409
	sir	0x0944
	fbul,a	%fcc0,	loop_410
	tg	%icc,	0x5
loop_409:
	fcmpne32	%f12,	%f28,	%l4
	bpos,a,pn	%xcc,	loop_411
loop_410:
	srlx	%l5,	%o3,	%l3
	srlx	%o4,	0x00,	%o5
	edge32ln	%g5,	%i2,	%g7
loop_411:
	andn	%g4,	0x1B2D,	%i0
	fmovrdgz	%i1,	%f16,	%f22
	move	%xcc,	%g2,	%g1
	edge32	%o7,	%l6,	%o2
	nop
	fitos	%f4,	%f31
	fstod	%f31,	%f26
	edge16ln	%o6,	%g3,	%i4
	alignaddrl	%o1,	%i5,	%i3
	edge32n	%l2,	%l1,	%o0
	bgu,pn	%xcc,	loop_412
	sdivx	%i6,	0x0010,	%i7
	nop
	fitos	%f2,	%f15
	fstox	%f15,	%f8
	fxtos	%f8,	%f21
	umul	%g6,	0x1863,	%l0
loop_412:
	movl	%xcc,	%l5,	%l4
	array32	%o3,	%o4,	%l3
	movcc	%xcc,	%g5,	%o5
	tsubcctv	%g7,	%g4,	%i2
	tcc	%icc,	0x1
	fbuge	%fcc1,	loop_413
	orn	%i1,	0x0A99,	%i0
	tsubcctv	%g2,	%g1,	%o7
	movleu	%xcc,	%l6,	%o2
loop_413:
	tne	%xcc,	0x1
	orncc	%o6,	%g3,	%o1
	taddcctv	%i4,	0x0025,	%i5
	fandnot2	%f4,	%f16,	%f18
	edge32ln	%l2,	%l1,	%o0
	andncc	%i6,	%i7,	%i3
	move	%xcc,	%l0,	%g6
	movneg	%icc,	%l5,	%l4
	bne,pt	%xcc,	loop_414
	array32	%o4,	%l3,	%g5
	xorcc	%o3,	0x065E,	%o5
	fbuge,a	%fcc0,	loop_415
loop_414:
	edge16	%g4,	%i2,	%i1
	movne	%xcc,	%i0,	%g2
	orn	%g7,	0x1225,	%o7
loop_415:
	fbue,a	%fcc1,	loop_416
	ldsh	[%l7 + 0x0C],	%l6
	movle	%icc,	%g1,	%o6
	nop
	fitod	%f4,	%f24
	fdtoi	%f24,	%f22
loop_416:
	movvs	%icc,	%g3,	%o2
	fornot2	%f2,	%f28,	%f4
	bvs,a,pn	%icc,	loop_417
	addccc	%o1,	0x150C,	%i5
	ldd	[%l7 + 0x50],	%l2
	ta	%icc,	0x4
loop_417:
	fmovscc	%xcc,	%f30,	%f8
	bgu	%xcc,	loop_418
	tneg	%xcc,	0x5
	ldstub	[%l7 + 0x65],	%l1
	pdist	%f22,	%f4,	%f0
loop_418:
	fmovrdlz	%i4,	%f30,	%f18
	movgu	%icc,	%i6,	%o0
	bcs,pt	%xcc,	loop_419
	movrlz	%i7,	0x2C8,	%i3
	fbue,a	%fcc2,	loop_420
	tle	%xcc,	0x0
loop_419:
	subcc	%l0,	%g6,	%l5
	edge8n	%l4,	%l3,	%o4
loop_420:
	sethi	0x0501,	%o3
	tgu	%xcc,	0x3
	andncc	%g5,	%g4,	%o5
	sllx	%i2,	%i1,	%i0
	set	0x30, %g3
	stxa	%g2,	[%l7 + %g3] 0x27
	membar	#Sync
	tneg	%xcc,	0x1
	array16	%o7,	%l6,	%g1
	subc	%g7,	0x035C,	%g3
	ldsh	[%l7 + 0x5C],	%o2
	fmovrdlez	%o1,	%f22,	%f16
	tvc	%icc,	0x0
	te	%icc,	0x7
	brz,a	%o6,	loop_421
	tleu	%xcc,	0x7
	ldsb	[%l7 + 0x40],	%l2
	andcc	%i5,	%i4,	%l1
loop_421:
	edge8ln	%o0,	%i7,	%i6
	sllx	%l0,	%g6,	%l5
	swap	[%l7 + 0x10],	%l4
	movrne	%l3,	0x128,	%i3
	addc	%o3,	%g5,	%g4
	xnorcc	%o5,	0x0AE8,	%i2
	fmul8x16al	%f4,	%f30,	%f20
	fmovsl	%xcc,	%f24,	%f1
	edge32l	%o4,	%i0,	%g2
	andcc	%i1,	%o7,	%l6
	sdiv	%g1,	0x03C6,	%g7
	movrgz	%o2,	%g3,	%o1
	edge32ln	%l2,	%i5,	%i4
	fmovdn	%xcc,	%f0,	%f8
	orncc	%l1,	0x0917,	%o0
	nop
	fitos	%f4,	%f2
	fstox	%f2,	%f0
	wr	%g0,	0x11,	%asi
	lduha	[%l7 + 0x10] %asi,	%o6
	edge8	%i6,	%i7,	%l0
	udivx	%l5,	0x1B7D,	%g6
	addccc	%l4,	%l3,	%i3
	array32	%o3,	%g4,	%g5
	st	%f11,	[%l7 + 0x44]
	orncc	%o5,	%o4,	%i0
	nop
	setx	0xBD09589E,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f5
	setx	0x2618AD91,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f19
	fadds	%f19,	%f5,	%f31
	tpos	%xcc,	0x1
	bneg,a,pt	%xcc,	loop_422
	tvs	%xcc,	0x2
	set	0x60, %o1
	ldswa	[%l7 + %o1] 0x0c,	%g2
loop_422:
	edge16n	%i2,	%i1,	%l6
	movrgz	%g1,	%o7,	%o2
	udivcc	%g7,	0x0E17,	%o1
	edge8n	%l2,	%g3,	%i5
	fmovrdlez	%i4,	%f6,	%f8
	subc	%l1,	0x1C82,	%o0
	fmovdg	%xcc,	%f20,	%f13
	fmovd	%f0,	%f28
	brnz	%o6,	loop_423
	te	%icc,	0x0
	umulcc	%i7,	0x0EF2,	%i6
	udiv	%l5,	0x0238,	%l0
loop_423:
	movvc	%icc,	%g6,	%l3
	xorcc	%i3,	%o3,	%g4
	ldsh	[%l7 + 0x4C],	%l4
	movleu	%icc,	%g5,	%o4
	fxor	%f14,	%f24,	%f0
	tcc	%xcc,	0x6
	tle	%icc,	0x3
	sub	%o5,	0x100A,	%i0
	mulscc	%g2,	%i1,	%i2
	set	0x4E, %i7
	lduha	[%l7 + %i7] 0x80,	%g1
	tpos	%xcc,	0x7
	stb	%o7,	[%l7 + 0x74]
	fmovsneg	%icc,	%f28,	%f25
	fmovrsgz	%o2,	%f22,	%f22
	fbue,a	%fcc3,	loop_424
	movvs	%xcc,	%l6,	%o1
	prefetch	[%l7 + 0x10],	 0x1
	fblg,a	%fcc1,	loop_425
loop_424:
	fmovrde	%g7,	%f10,	%f12
	movcc	%icc,	%g3,	%l2
	xnor	%i4,	0x11F1,	%l1
loop_425:
	fmovdneg	%xcc,	%f11,	%f12
	bleu,pt	%icc,	loop_426
	xnorcc	%i5,	%o0,	%o6
	fmovse	%xcc,	%f9,	%f9
	movvs	%icc,	%i7,	%i6
loop_426:
	movrlez	%l5,	%g6,	%l3
	movcs	%icc,	%i3,	%l0
	smul	%g4,	0x0F87,	%l4
	edge16	%o3,	%o4,	%g5
	movrgz	%o5,	%i0,	%i1
	bleu,pn	%xcc,	loop_427
	xnor	%i2,	0x165B,	%g1
	wr	%g0,	0x81,	%asi
	lduba	[%l7 + 0x3E] %asi,	%g2
loop_427:
	tsubcc	%o2,	0x16AD,	%l6
	tge	%icc,	0x1
	addccc	%o1,	0x0601,	%o7
	fbge,a	%fcc0,	loop_428
	brlz,a	%g7,	loop_429
	nop
	set	0x60, %l6
	std	%f28,	[%l7 + %l6]
	alignaddr	%g3,	%i4,	%l1
loop_428:
	edge8l	%i5,	%l2,	%o0
loop_429:
	fnand	%f24,	%f14,	%f8
	edge8l	%o6,	%i7,	%i6
	set	0x6A, %o0
	lduba	[%l7 + %o0] 0x11,	%g6
	andn	%l5,	0x1C23,	%l3
	fmovdleu	%icc,	%f11,	%f2
	movge	%xcc,	%i3,	%l0
	subcc	%g4,	%l4,	%o4
	std	%f14,	[%l7 + 0x50]
	edge8	%o3,	%g5,	%o5
	wr	%g0,	0x81,	%asi
	ldswa	[%l7 + 0x74] %asi,	%i0
	movcc	%icc,	%i2,	%g1
	movl	%icc,	%g2,	%i1
	ta	%xcc,	0x2
	movcs	%icc,	%o2,	%l6
	xnorcc	%o1,	0x0963,	%g7
	tleu	%xcc,	0x1
	call	loop_430
	taddcctv	%g3,	0x1096,	%o7
	edge8ln	%i4,	%i5,	%l1
	tn	%xcc,	0x2
loop_430:
	ldsb	[%l7 + 0x70],	%o0
	edge32l	%o6,	%l2,	%i7
	movge	%icc,	%i6,	%g6
	movpos	%xcc,	%l3,	%l5
	brlez	%i3,	loop_431
	tn	%xcc,	0x1
	movneg	%xcc,	%g4,	%l4
	stx	%o4,	[%l7 + 0x30]
loop_431:
	tvc	%xcc,	0x0
	subc	%o3,	%g5,	%l0
	stx	%o5,	[%l7 + 0x40]
	fbule,a	%fcc0,	loop_432
	edge8ln	%i2,	%i0,	%g1
	alignaddrl	%g2,	%o2,	%l6
	fbuge	%fcc1,	loop_433
loop_432:
	andn	%o1,	0x0240,	%i1
	smulcc	%g3,	%g7,	%o7
	faligndata	%f22,	%f8,	%f10
loop_433:
	nop
	fitos	%f8,	%f26
	movleu	%xcc,	%i4,	%l1
	tge	%icc,	0x4
	subccc	%o0,	%o6,	%l2
	edge32l	%i5,	%i6,	%g6
	bvs,a	loop_434
	nop
	setx	0xDC054E07506D34D6,	%l0,	%l6
	stx	%l6,	[%l7 + 0x20]
	ldx	[%l7 + 0x20],	%fsr
	andncc	%i7,	%l3,	%i3
	brlz	%l5,	loop_435
loop_434:
	or	%l4,	0x0103,	%o4
	set	0x2C, %o5
	lduwa	[%l7 + %o5] 0x18,	%o3
loop_435:
	xorcc	%g4,	%l0,	%g5
	bcs,a,pn	%xcc,	loop_436
	sub	%o5,	%i2,	%i0
	ta	%icc,	0x6
	tvc	%xcc,	0x2
loop_436:
	nop
	set	0x50, %o7
	sta	%f18,	[%l7 + %o7] 0x10
	fbuge	%fcc2,	loop_437
	andn	%g1,	%o2,	%g2
	sllx	%l6,	0x12,	%o1
	edge8ln	%g3,	%g7,	%o7
loop_437:
	fmovdcs	%icc,	%f5,	%f26
	ldub	[%l7 + 0x39],	%i1
	sth	%l1,	[%l7 + 0x44]
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	fitos	%f9,	%f13
	fstoi	%f13,	%f3
	tn	%icc,	0x0
	ta	%icc,	0x5
	fmovdl	%xcc,	%f25,	%f29
	movre	%o0,	0x3EF,	%o6
	edge8	%i4,	%l2,	%i6
	movgu	%xcc,	%g6,	%i5
	orcc	%i7,	%l3,	%i3
	sth	%l5,	[%l7 + 0x56]
	addc	%o4,	0x175A,	%l4
	te	%xcc,	0x2
	fmovrdlz	%o3,	%f22,	%f4
	addccc	%g4,	0x1D41,	%g5
	fnegd	%f14,	%f16
	ld	[%l7 + 0x28],	%f30
	fxors	%f14,	%f14,	%f15
	edge8l	%o5,	%l0,	%i0
	mulscc	%g1,	%i2,	%g2
	tneg	%xcc,	0x1
	edge8ln	%l6,	%o1,	%o2
	sth	%g7,	[%l7 + 0x2C]
	wr	%g0,	0x80,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	ldstub	[%l7 + 0x77],	%g3
	fmovsg	%icc,	%f10,	%f24
	addc	%i1,	0x1B89,	%o7
	tpos	%xcc,	0x3
	edge16	%o0,	%o6,	%i4
	movn	%xcc,	%l1,	%l2
	fzero	%f0
	tneg	%icc,	0x6
	fornot2s	%f14,	%f18,	%f12
	move	%icc,	%g6,	%i6
	xnor	%i5,	%l3,	%i7
	orncc	%i3,	0x1CBF,	%o4
	nop
	setx	0xA656453280481B64,	%l0,	%l6
	stx	%l6,	[%l7 + 0x10]
	ldx	[%l7 + 0x10],	%fsr
	fbne,a	%fcc3,	loop_438
	tsubcctv	%l4,	0x0053,	%o3
	movre	%g4,	%l5,	%g5
	movleu	%icc,	%l0,	%o5
loop_438:
	fbge,a	%fcc0,	loop_439
	edge16ln	%i0,	%i2,	%g1
	subccc	%l6,	0x117C,	%g2
	and	%o2,	%o1,	%g7
loop_439:
	movcs	%xcc,	%g3,	%o7
	sllx	%o0,	%o6,	%i4
	sir	0x1FFB
	prefetch	[%l7 + 0x08],	 0x1
	bvc	loop_440
	movrlz	%l1,	0x10F,	%l2
	fmul8sux16	%f18,	%f30,	%f24
	movneg	%icc,	%g6,	%i1
loop_440:
	ta	%xcc,	0x6
	fxnor	%f22,	%f22,	%f20
	edge8	%i6,	%l3,	%i7
	call	loop_441
	tsubcc	%i3,	0x1A3F,	%o4
	umul	%i5,	0x0DEC,	%o3
	fmovd	%f14,	%f10
loop_441:
	sdiv	%l4,	0x1EC2,	%g4
	fxnors	%f26,	%f12,	%f5
	fmovsvc	%icc,	%f3,	%f21
	ldsb	[%l7 + 0x4E],	%l5
	bleu,a,pn	%xcc,	loop_442
	fmovdcs	%xcc,	%f26,	%f30
	wr	%g0,	0x10,	%asi
	lduwa	[%l7 + 0x20] %asi,	%l0
loop_442:
	fbo,a	%fcc0,	loop_443
	tle	%icc,	0x2
	nop
	setx loop_444, %l0, %l1
	jmpl %l1, %o5
	mulscc	%i0,	%i2,	%g1
loop_443:
	stx	%g5,	[%l7 + 0x20]
	tgu	%icc,	0x5
loop_444:
	fmovscs	%icc,	%f13,	%f21
	tcs	%xcc,	0x7
	orcc	%l6,	%o2,	%g2
	tvc	%xcc,	0x2
	nop
	setx	0xA06ADFAC,	%l0,	%l6
	st	%l6,	[%l7 + 0x70]
	ld	[%l7 + 0x70],	%fsr
	fmovsn	%xcc,	%f10,	%f11
	movg	%xcc,	%g7,	%g3
	fpsub32	%f24,	%f22,	%f6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xorcc	%o7,	%o0,	%o6
	tcc	%icc,	0x7
	smul	%i4,	0x1969,	%o1
	wr	%g0,	0x88,	%asi
	lda	[%l7 + 0x7C] %asi,	%f4
	add	%l7,	0x08,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] %asi,	%l1,	%l2
	orncc	%g6,	0x09EC,	%i6
	nop
	fitos	%f25,	%f2
	fbg,a	%fcc0,	loop_445
	edge8	%l3,	%i7,	%i1
	fmovdleu	%icc,	%f15,	%f13
	or	%i3,	%o4,	%o3
loop_445:
	lduw	[%l7 + 0x7C],	%l4
	fcmpgt32	%f10,	%f18,	%i5
	udivcc	%g4,	0x0A25,	%l0
	move	%icc,	%l5,	%i0
	membar	0x68
	sdivx	%o5,	0x0277,	%g1
	tle	%icc,	0x7
	movrlz	%g5,	0x00A,	%i2
	ldstub	[%l7 + 0x48],	%l6
	movrlz	%o2,	%g2,	%g3
	movcs	%icc,	%g7,	%o0
	movrlez	%o7,	%i4,	%o1
	fands	%f9,	%f29,	%f30
	wr	%g0,	0x80,	%asi
	ldda	[%l7 + 0x70] %asi,	%o6
	fnot2s	%f14,	%f24
	edge32l	%l2,	%g6,	%i6
	fbug,a	%fcc2,	loop_446
	edge32ln	%l1,	%l3,	%i1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbne	%fcc0,	loop_447
loop_446:
	fmovdle	%icc,	%f5,	%f4
	xnorcc	%i7,	0x0357,	%o4
	wr	%g0,	0x81,	%asi
	prefetcha	[%l7 + 0x08] %asi,	 0x0
loop_447:
	nop
	setx	0xBC35D64A6752C19D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0xDBBEC147A9B507DD,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	fdivd	%f14,	%f6,	%f22
	andncc	%o3,	%i5,	%l4
	fbne	%fcc2,	loop_448
	edge32l	%l0,	%g4,	%i0
	or	%o5,	0x0F5B,	%g1
	nop
	setx	0xE42EE5161BBA1FC1,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0x4872554B1624653D,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	fsubd	%f28,	%f6,	%f10
loop_448:
	fmovrse	%g5,	%f3,	%f20
	movrlez	%l5,	%i2,	%l6
	ldsb	[%l7 + 0x71],	%g2
	xorcc	%g3,	%o2,	%o0
	tvs	%xcc,	0x0
	fpmerge	%f8,	%f16,	%f30
	fbule	%fcc2,	loop_449
	taddcctv	%g7,	%o7,	%o1
	smulcc	%o6,	%i4,	%g6
	subccc	%l2,	%l1,	%i6
loop_449:
	bshuffle	%f18,	%f0,	%f8
	fble,a	%fcc2,	loop_450
	smulcc	%i1,	0x0773,	%l3
	ta	%icc,	0x3
	fmul8sux16	%f8,	%f12,	%f2
loop_450:
	movle	%xcc,	%i7,	%i3
	tcs	%xcc,	0x0
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x62] %asi,	%o3
	fbuge,a	%fcc2,	loop_451
	fmovsn	%icc,	%f31,	%f13
	be	loop_452
	fmovrslz	%i5,	%f13,	%f15
loop_451:
	bcs,a,pn	%xcc,	loop_453
	xor	%l4,	%o4,	%g4
loop_452:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tvc	%xcc,	0x5
loop_453:
	sdivx	%l0,	0x0FBE,	%i0
	fsrc1	%f2,	%f16
	nop
	setx	0x20C08FC0,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f2
	setx	0xB3FFEEBE,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f14
	fmuls	%f14,	%f2,	%f2
	movn	%icc,	%g1,	%o5
	movle	%xcc,	%g5,	%i2
	nop
	setx	0x0000B93882A1A36D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0xFBA9E010A5AC840F,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	fsubd	%f20,	%f26,	%f30
	movgu	%icc,	%l5,	%g2
	fbe	%fcc0,	loop_454
	movrne	%g3,	%o2,	%o0
	movvs	%icc,	%l6,	%g7
	ldd	[%l7 + 0x48],	%o6
loop_454:
	mulscc	%o6,	0x061E,	%o1
	sir	0x00F3
	alignaddrl	%g6,	%i4,	%l2
	nop
	setx	0xD5E9517FF84512DF,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0x8E5A892A58A06506,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	fsubd	%f20,	%f6,	%f4
	tl	%xcc,	0x5
	ba,a	%xcc,	loop_455
	movcc	%icc,	%l1,	%i1
	alignaddr	%l3,	%i7,	%i6
	wr	%g0,	0x10,	%asi
	swapa	[%l7 + 0x78] %asi,	%i3
loop_455:
	nop
	set	0x51, %o3
	lduba	[%l7 + %o3] 0x04,	%i5
	sdivx	%o3,	0x0318,	%l4
	smulcc	%o4,	0x1A1E,	%l0
	ldd	[%l7 + 0x60],	%f10
	tsubcctv	%g4,	%i0,	%o5
	tneg	%icc,	0x0
	sdivcc	%g5,	0x15EF,	%i2
	sll	%l5,	%g1,	%g2
	tle	%icc,	0x4
	nop
	set	0x53, %l2
	ldub	[%l7 + %l2],	%g3
	movrgez	%o2,	%l6,	%g7
	fbuge,a	%fcc1,	loop_456
	fmovdleu	%xcc,	%f4,	%f9
	tge	%icc,	0x7
	alignaddr	%o7,	%o0,	%o6
loop_456:
	tn	%icc,	0x5
	addcc	%o1,	0x0535,	%g6
	bne,a	%icc,	loop_457
	udivx	%i4,	0x0524,	%l1
	mova	%icc,	%i1,	%l3
	fmovsgu	%icc,	%f11,	%f3
loop_457:
	udivcc	%l2,	0x1DD7,	%i6
	tsubcctv	%i3,	%i5,	%o3
	st	%f31,	[%l7 + 0x3C]
	bvc	loop_458
	subc	%i7,	%l4,	%l0
	nop
	setx	0x18DA72BDE11D9112,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	setx	0xBAD770741F525A68,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	fsubd	%f18,	%f18,	%f22
	movneg	%icc,	%g4,	%o4
loop_458:
	fnot2s	%f7,	%f23
	edge32ln	%o5,	%i0,	%i2
	sth	%g5,	[%l7 + 0x2C]
	for	%f22,	%f10,	%f4
	movle	%icc,	%l5,	%g1
	tneg	%icc,	0x7
	tleu	%xcc,	0x2
	brgz	%g2,	loop_459
	andncc	%g3,	%o2,	%g7
	membar	0x77
	tl	%icc,	0x5
loop_459:
	edge8	%o7,	%l6,	%o0
	orn	%o1,	%g6,	%i4
	subccc	%l1,	%o6,	%l3
	fbg,a	%fcc3,	loop_460
	tle	%icc,	0x4
	fmovrdlz	%i1,	%f30,	%f16
	fmovdle	%xcc,	%f3,	%f2
loop_460:
	array32	%l2,	%i6,	%i3
	bgu,pn	%icc,	loop_461
	fblg	%fcc2,	loop_462
	membar	0x49
	fmovdcs	%xcc,	%f14,	%f10
loop_461:
	andncc	%o3,	%i7,	%l4
loop_462:
	edge8n	%i5,	%l0,	%g4
	fnegd	%f10,	%f30
	nop
	setx	0x6C2EFD5E,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f30
	setx	0x93617A72,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f17
	fadds	%f17,	%f30,	%f10
	ble,a	%icc,	loop_463
	sub	%o4,	0x1B3F,	%o5
	be	%xcc,	loop_464
	tl	%icc,	0x2
loop_463:
	fpack16	%f6,	%f0
	fmovsvc	%icc,	%f14,	%f10
loop_464:
	sethi	0x1F24,	%i0
	tcs	%xcc,	0x3
	tneg	%icc,	0x4
	xnor	%i2,	%l5,	%g5
	mulx	%g2,	0x051C,	%g1
	fnegd	%f2,	%f4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tvc	%icc,	0x2
	call	loop_465
	addc	%g3,	%o2,	%o7
	bl	%xcc,	loop_466
	srlx	%g7,	%l6,	%o0
loop_465:
	movpos	%icc,	%o1,	%i4
	fornot2s	%f11,	%f23,	%f4
loop_466:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	lduw	[%l7 + 0x7C],	%g6
	movgu	%icc,	%l1,	%o6
	set	0x1C, %l5
	lduba	[%l7 + %l5] 0x0c,	%i1
	tneg	%xcc,	0x5
	umulcc	%l3,	0x0A11,	%l2
	movl	%icc,	%i6,	%o3
	addc	%i3,	%i7,	%i5
	sdiv	%l0,	0x0CD1,	%l4
	bvs,pt	%icc,	loop_467
	sub	%o4,	0x13F3,	%g4
	udivcc	%i0,	0x16C5,	%o5
	fornot1s	%f31,	%f30,	%f12
loop_467:
	sdiv	%l5,	0x008F,	%i2
	fpmerge	%f15,	%f27,	%f0
	taddcc	%g2,	%g5,	%g1
	tcs	%icc,	0x5
	srl	%o2,	0x0C,	%g3
	array8	%g7,	%o7,	%l6
	tg	%xcc,	0x0
	srl	%o1,	%i4,	%g6
	sir	0x1B09
	edge32	%l1,	%o0,	%o6
	add	%i1,	%l3,	%l2
	bvc,pt	%icc,	loop_468
	te	%icc,	0x3
	set	0x40, %i4
	ldda	[%l7 + %i4] 0xea,	%o2
loop_468:
	alignaddr	%i3,	%i6,	%i7
	movvc	%icc,	%l0,	%l4
	brz	%o4,	loop_469
	or	%g4,	%i5,	%i0
	edge16n	%o5,	%i2,	%l5
	edge8ln	%g2,	%g5,	%g1
loop_469:
	movl	%icc,	%o2,	%g7
	bcc,a	%icc,	loop_470
	call	loop_471
	movrne	%g3,	%o7,	%l6
	tg	%icc,	0x1
loop_470:
	movneg	%xcc,	%i4,	%g6
loop_471:
	te	%icc,	0x4
	movneg	%xcc,	%o1,	%o0
	fbn,a	%fcc0,	loop_472
	fpadd16	%f6,	%f10,	%f10
	nop
	fitod	%f15,	%f30
	swap	[%l7 + 0x78],	%o6
loop_472:
	ldx	[%l7 + 0x70],	%l1
	subccc	%i1,	%l2,	%o3
	fxors	%f3,	%f10,	%f5
	fbo	%fcc0,	loop_473
	taddcctv	%l3,	%i3,	%i7
	bcc	%xcc,	loop_474
	fzeros	%f26
loop_473:
	sllx	%l0,	0x0E,	%i6
	fzeros	%f12
loop_474:
	tleu	%icc,	0x6
	stb	%l4,	[%l7 + 0x23]
	tsubcc	%o4,	%i5,	%g4
	edge8	%i0,	%o5,	%l5
	move	%icc,	%i2,	%g5
	smulcc	%g2,	0x11E4,	%g1
	nop
	setx	0x8D5F2D494ADFF302,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0x181AF3223CAD044D,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	fmuld	%f6,	%f8,	%f6
	fmovsne	%icc,	%f8,	%f7
	edge8n	%g7,	%g3,	%o7
	movvc	%xcc,	%l6,	%i4
	movcc	%xcc,	%o2,	%g6
	nop
	fitod	%f4,	%f16
	fdtox	%f16,	%f20
	fxtod	%f20,	%f8
	sir	0x1263
	ld	[%l7 + 0x10],	%f28
	fbne,a	%fcc3,	loop_475
	tne	%xcc,	0x2
	fpsub16s	%f29,	%f11,	%f5
	fmovsvs	%xcc,	%f22,	%f18
loop_475:
	bpos	loop_476
	addccc	%o1,	0x05AB,	%o6
	fbg	%fcc0,	loop_477
	subc	%o0,	0x0271,	%i1
loop_476:
	movrne	%l1,	0x36C,	%l2
	edge32	%l3,	%i3,	%o3
loop_477:
	bcs,a,pt	%icc,	loop_478
	move	%xcc,	%l0,	%i6
	ta	%icc,	0x2
	movleu	%icc,	%i7,	%o4
loop_478:
	edge8	%i5,	%g4,	%i0
	fbue,a	%fcc3,	loop_479
	alignaddr	%o5,	%l4,	%l5
	nop
	setx loop_480, %l0, %l1
	jmpl %l1, %g5
	fnot1s	%f13,	%f28
loop_479:
	alignaddr	%g2,	%g1,	%g7
	swap	[%l7 + 0x70],	%i2
loop_480:
	nop
	set	0x70, %i6
	ldd	[%l7 + %i6],	%f28
	andcc	%o7,	0x0E80,	%l6
	srax	%i4,	0x09,	%g3
	sethi	0x0939,	%g6
	movcs	%icc,	%o2,	%o6
	movcc	%xcc,	%o0,	%i1
	brgz,a	%o1,	loop_481
	tge	%icc,	0x6
	udivcc	%l2,	0x163B,	%l1
	edge32l	%l3,	%o3,	%i3
loop_481:
	alignaddrl	%l0,	%i6,	%o4
	nop
	setx	0xD89C961D,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f1
	fsqrts	%f1,	%f17
	stw	%i5,	[%l7 + 0x4C]
	tsubcc	%g4,	%i0,	%o5
	tne	%icc,	0x5
	edge32n	%i7,	%l4,	%g5
	sll	%l5,	0x03,	%g2
	nop
	setx	0x9E8C5673C04B5FFB,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldx	[%l7 + 0x28],	%fsr
	tne	%xcc,	0x4
	tne	%icc,	0x1
	swap	[%l7 + 0x10],	%g1
	udivx	%g7,	0x17B4,	%o7
	udivcc	%l6,	0x0289,	%i4
	stbar
	wr	%g0,	0x80,	%asi
	prefetcha	[%l7 + 0x68] %asi,	 0x1
	brnz	%g3,	loop_482
	ldsb	[%l7 + 0x56],	%o2
	edge16n	%o6,	%o0,	%g6
	sir	0x0AFD
loop_482:
	udivx	%o1,	0x18BF,	%i1
	fmovsle	%icc,	%f9,	%f0
	fmovrsne	%l1,	%f10,	%f22
	movre	%l3,	0x2F7,	%l2
	subcc	%o3,	%l0,	%i6
	orn	%i3,	%i5,	%g4
	movn	%icc,	%i0,	%o4
	nop
	setx loop_483, %l0, %l1
	jmpl %l1, %o5
	movcc	%xcc,	%i7,	%g5
	ldstub	[%l7 + 0x4B],	%l4
	umulcc	%g2,	0x0AB8,	%g1
loop_483:
	andn	%g7,	0x060E,	%l5
	taddcc	%l6,	0x05BE,	%i4
	udiv	%i2,	0x17B3,	%o7
	fbn	%fcc2,	loop_484
	fbul	%fcc1,	loop_485
	add	%o2,	%g3,	%o0
	andncc	%g6,	%o6,	%o1
loop_484:
	faligndata	%f30,	%f0,	%f18
loop_485:
	nop
	add	%l7,	0x0C,	%l6
	wr	%g0,	0x11,	%asi
	lda	[%l6] %asi,	%i1
	casa	[%l6] 0x11,	%i1,	%l1
	fmovsge	%xcc,	%f29,	%f6
	movre	%l2,	0x2F2,	%o3
	edge8ln	%l0,	%i6,	%i3
	fpsub16	%f26,	%f2,	%f24
	addcc	%i5,	%g4,	%i0
	orn	%o4,	0x1753,	%o5
	add	%i7,	0x1FAA,	%l3
	movg	%icc,	%l4,	%g2
	bgu,a	loop_486
	edge8	%g1,	%g5,	%l5
	tgu	%xcc,	0x7
	fbuge,a	%fcc3,	loop_487
loop_486:
	edge8n	%l6,	%g7,	%i4
	fmovspos	%xcc,	%f27,	%f15
	ta	%xcc,	0x6
loop_487:
	tgu	%icc,	0x3
	edge8n	%i2,	%o2,	%g3
	edge16ln	%o0,	%g6,	%o6
	set	0x70, %g6
	ldsha	[%l7 + %g6] 0x04,	%o1
	flush	%l7 + 0x3C
	tle	%xcc,	0x6
	bleu,a	loop_488
	fmovsleu	%icc,	%f21,	%f29
	bvc	loop_489
	fsrc2s	%f29,	%f20
loop_488:
	fble,a	%fcc1,	loop_490
	fmovda	%xcc,	%f4,	%f20
loop_489:
	sll	%o7,	0x18,	%l1
	fmovdg	%icc,	%f18,	%f8
loop_490:
	move	%icc,	%i1,	%l2
	fmovrdgz	%o3,	%f22,	%f26
	mulx	%l0,	0x1063,	%i3
	tcc	%icc,	0x2
	fmovsn	%icc,	%f31,	%f25
	stw	%i5,	[%l7 + 0x64]
	fpsub16s	%f2,	%f27,	%f7
	edge32ln	%g4,	%i0,	%o4
	tcs	%xcc,	0x7
	movrgz	%o5,	0x015,	%i6
	fbul	%fcc0,	loop_491
	fnegd	%f6,	%f0
	wr	%g0,	0x81,	%asi
	stxa	%l3,	[%l7 + 0x38] %asi
loop_491:
	xnor	%i7,	%l4,	%g1
	movneg	%xcc,	%g2,	%l5
	srlx	%l6,	0x09,	%g7
	alignaddr	%i4,	%g5,	%o2
	movvs	%icc,	%g3,	%i2
	movleu	%xcc,	%o0,	%g6
	fmovrdgz	%o1,	%f0,	%f14
	add	%l7,	0x44,	%l6
	wr	%g0,	0x04,	%asi
	casa	[%l6] 0x04,	%o6,	%o7
	fmovrdlz	%l1,	%f16,	%f0
	nop
	setx	0xD52B83F6,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f16
	setx	0x4F3BE432,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f11
	fmuls	%f11,	%f16,	%f7
	smulcc	%i1,	0x1166,	%o3
	fblg	%fcc1,	loop_492
	lduh	[%l7 + 0x18],	%l2
	ta	%icc,	0x4
	fmovrslz	%i3,	%f13,	%f18
loop_492:
	swap	[%l7 + 0x0C],	%i5
	tsubcc	%g4,	%i0,	%l0
	taddcc	%o4,	0x1873,	%o5
	tneg	%icc,	0x6
	ldx	[%l7 + 0x58],	%i6
	movne	%xcc,	%l3,	%l4
	set	0x40, %i3
	ldda	[%l7 + %i3] 0x10,	%f16
	wr	%g0,	0x18,	%asi
	ldsba	[%l7 + 0x4B] %asi,	%i7
	movpos	%icc,	%g2,	%g1
	movg	%xcc,	%l6,	%g7
	nop
	fitos	%f3,	%f27
	fstox	%f27,	%f26
	fxtos	%f26,	%f8
	fmovd	%f16,	%f22
	prefetch	[%l7 + 0x38],	 0x2
	movn	%icc,	%l5,	%i4
	subcc	%o2,	0x04AC,	%g5
	movgu	%icc,	%g3,	%i2
	brz,a	%g6,	loop_493
	movrgz	%o0,	0x14C,	%o1
	fmovscc	%xcc,	%f25,	%f26
	stx	%o6,	[%l7 + 0x50]
loop_493:
	smul	%l1,	%i1,	%o3
	nop
	setx	0x74A27D08,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f1
	setx	0x23797A7E,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f30
	fdivs	%f30,	%f1,	%f17
	movrlez	%o7,	%i3,	%i5
	sir	0x0E72
	stw	%g4,	[%l7 + 0x20]
	fbul	%fcc2,	loop_494
	orn	%i0,	%l0,	%l2
	popc	0x0ABE,	%o4
	addcc	%o5,	%l3,	%l4
loop_494:
	taddcctv	%i7,	0x040B,	%i6
	nop
	set	0x25, %g1
	ldub	[%l7 + %g1],	%g2
	xnor	%l6,	0x10EA,	%g7
	addcc	%l5,	%g1,	%i4
	tg	%icc,	0x2
	fnegd	%f10,	%f18
	movn	%icc,	%g5,	%o2
	fmovdleu	%icc,	%f5,	%f13
	tne	%xcc,	0x5
	ld	[%l7 + 0x0C],	%f22
	sth	%g3,	[%l7 + 0x10]
	fmovdvs	%xcc,	%f3,	%f26
	bg,pt	%icc,	loop_495
	andncc	%i2,	%o0,	%o1
	movvs	%icc,	%o6,	%g6
	bpos,a	loop_496
loop_495:
	orcc	%l1,	%o3,	%o7
	movge	%xcc,	%i3,	%i1
	brgez,a	%g4,	loop_497
loop_496:
	subccc	%i0,	%i5,	%l2
	srax	%l0,	0x07,	%o5
	movrne	%o4,	%l3,	%l4
loop_497:
	orcc	%i6,	%i7,	%l6
	edge32n	%g2,	%g7,	%g1
	and	%l5,	0x0B1A,	%g5
	fbo,a	%fcc0,	loop_498
	fpack32	%f10,	%f2,	%f18
	flush	%l7 + 0x3C
	array32	%i4,	%g3,	%o2
loop_498:
	nop
	fitod	%f0,	%f8
	fdtox	%f8,	%f4
	xorcc	%o0,	%i2,	%o6
	addccc	%o1,	%g6,	%o3
	movl	%xcc,	%o7,	%l1
	sdiv	%i3,	0x184D,	%i1
	movrlez	%g4,	0x0F5,	%i0
	sra	%i5,	%l0,	%o5
	ld	[%l7 + 0x18],	%f19
	wr	%g0,	0x2f,	%asi
	stwa	%l2,	[%l7 + 0x4C] %asi
	membar	#Sync
	edge8ln	%l3,	%o4,	%i6
	fmovsn	%xcc,	%f12,	%f17
	wr	%g0,	0x0c,	%asi
	sta	%f25,	[%l7 + 0x68] %asi
	fpadd32	%f20,	%f0,	%f8
	orn	%l4,	0x1057,	%i7
	stx	%l6,	[%l7 + 0x40]
	fmovdpos	%xcc,	%f18,	%f18
	fmovrdgez	%g7,	%f12,	%f24
	fbge,a	%fcc2,	loop_499
	nop
	setx	0x841E8380F05C4472,	%l0,	%l6
	stx	%l6,	[%l7 + 0x10]
	ldx	[%l7 + 0x10],	%fsr
	sdivcc	%g1,	0x0ADC,	%l5
	xnor	%g2,	0x0757,	%i4
loop_499:
	fmovdl	%icc,	%f26,	%f9
	wr	%g0,	0x80,	%asi
	lduba	[%l7 + 0x7F] %asi,	%g5
	edge32l	%g3,	%o0,	%i2
	fmovse	%icc,	%f4,	%f20
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32ln	%o6,	%o1,	%g6
	edge8ln	%o3,	%o2,	%l1
	ldd	[%l7 + 0x60],	%f8
	edge16l	%i3,	%i1,	%o7
	bvc,pn	%icc,	loop_500
	fmovdneg	%xcc,	%f10,	%f31
	edge32l	%g4,	%i0,	%i5
	movrgz	%o5,	%l2,	%l0
loop_500:
	fcmple32	%f2,	%f4,	%l3
	fbe,a	%fcc0,	loop_501
	fbu,a	%fcc3,	loop_502
	add	%i6,	0x0799,	%o4
	fbo,a	%fcc2,	loop_503
loop_501:
	movn	%icc,	%i7,	%l4
loop_502:
	movle	%icc,	%g7,	%g1
	edge16ln	%l6,	%g2,	%i4
loop_503:
	srax	%g5,	%g3,	%o0
	fcmpeq32	%f26,	%f0,	%l5
	tleu	%xcc,	0x4
	xnorcc	%o6,	%i2,	%o1
	movvc	%icc,	%o3,	%o2
	fand	%f22,	%f20,	%f0
	orncc	%g6,	0x1CFA,	%i3
	edge16l	%i1,	%l1,	%o7
	bleu,a	%icc,	loop_504
	srax	%i0,	0x16,	%g4
	fbu,a	%fcc0,	loop_505
	sth	%i5,	[%l7 + 0x14]
loop_504:
	taddcc	%o5,	%l0,	%l3
	fba	%fcc2,	loop_506
loop_505:
	nop
	setx	0x4FA412EC793191F3,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0xE830AC9AE5FEEC2B,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	faddd	%f12,	%f22,	%f24
	movvc	%icc,	%i6,	%o4
	andn	%l2,	%l4,	%i7
loop_506:
	edge16l	%g1,	%l6,	%g2
	edge8ln	%g7,	%i4,	%g3
	tsubcc	%g5,	0x040C,	%l5
	movre	%o0,	0x19B,	%o6
	subc	%o1,	%o3,	%i2
	ta	%xcc,	0x6
	movpos	%icc,	%o2,	%g6
	andncc	%i3,	%l1,	%o7
	membar	0x5C
	edge32	%i1,	%i0,	%g4
	ldd	[%l7 + 0x40],	%i4
	fmovde	%xcc,	%f22,	%f3
	movpos	%xcc,	%o5,	%l0
	for	%f24,	%f0,	%f2
	set	0x38, %l0
	stxa	%l3,	[%l7 + %l0] 0x10
	fmovsvs	%icc,	%f5,	%f9
	movn	%xcc,	%o4,	%l2
	edge32	%i6,	%i7,	%l4
	stb	%g1,	[%l7 + 0x4E]
	movcc	%icc,	%l6,	%g7
	nop
	set	0x2E, %g5
	ldsh	[%l7 + %g5],	%g2
	tne	%icc,	0x5
	add	%l7,	0x50,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] %asi,	%i4,	%g3
	movleu	%xcc,	%l5,	%o0
	bleu	loop_507
	bg,pt	%xcc,	loop_508
	udivx	%o6,	0x0C29,	%g5
	flush	%l7 + 0x4C
loop_507:
	fmovrdgz	%o1,	%f16,	%f6
loop_508:
	fmovsne	%icc,	%f9,	%f7
	te	%xcc,	0x3
	edge16ln	%o3,	%i2,	%o2
	bcs,a,pt	%xcc,	loop_509
	bl,a	%icc,	loop_510
	nop
	setx	0xF8B175178F0F2034,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0xB92F166E9BD312E3,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	faddd	%f20,	%f22,	%f2
	wr	%g0,	0x88,	%asi
	lda	[%l7 + 0x08] %asi,	%f12
loop_509:
	prefetch	[%l7 + 0x7C],	 0x0
loop_510:
	sdiv	%g6,	0x1AB3,	%i3
	movrgz	%o7,	0x217,	%i1
	fmovrsgez	%i0,	%f13,	%f28
	sth	%g4,	[%l7 + 0x16]
	bvs,a,pt	%xcc,	loop_511
	fba,a	%fcc0,	loop_512
	movg	%xcc,	%i5,	%o5
	nop
	fitos	%f21,	%f1
loop_511:
	fbu	%fcc3,	loop_513
loop_512:
	addc	%l1,	%l3,	%l0
	movvc	%xcc,	%o4,	%l2
	and	%i6,	%l4,	%i7
loop_513:
	andcc	%l6,	%g7,	%g2
	udiv	%i4,	0x162F,	%g3
	fbuge	%fcc1,	loop_514
	tl	%xcc,	0x4
	fnors	%f6,	%f19,	%f29
	edge8n	%g1,	%o0,	%o6
loop_514:
	fmovrdne	%l5,	%f30,	%f16
	and	%o1,	0x00A8,	%g5
	movre	%i2,	%o3,	%g6
	set	0x40, %o4
	stda	%f0,	[%l7 + %o4] 0x1e
	membar	#Sync
	movrlez	%i3,	0x2AA,	%o2
	popc	%i1,	%i0
	edge32	%g4,	%o7,	%i5
	nop
	setx	0x3D826C49,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f17
	setx	0x816147AC,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f31
	fdivs	%f31,	%f17,	%f17
	udivx	%o5,	0x0E8F,	%l3
	faligndata	%f28,	%f22,	%f2
	movvc	%xcc,	%l1,	%o4
	fmovdvc	%xcc,	%f29,	%f21
	nop
	setx	0x600A632E8069C27F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x20]
	ldx	[%l7 + 0x20],	%fsr
	edge8	%l0,	%i6,	%l4
	fbuge	%fcc0,	loop_515
	bshuffle	%f26,	%f20,	%f20
	fmovrdgz	%l2,	%f2,	%f2
	sdivx	%l6,	0x15E9,	%i7
loop_515:
	fmovsgu	%xcc,	%f20,	%f3
	fbul	%fcc2,	loop_516
	fcmple16	%f12,	%f16,	%g7
	edge16l	%i4,	%g2,	%g3
	andn	%o0,	0x0702,	%o6
loop_516:
	fnand	%f18,	%f4,	%f20
	tvc	%xcc,	0x4
	ta	%xcc,	0x3
	edge16ln	%g1,	%o1,	%l5
	srl	%g5,	0x0F,	%o3
	fxnor	%f18,	%f20,	%f2
	orn	%i2,	0x1A0E,	%i3
	xorcc	%o2,	0x1432,	%g6
	edge8n	%i0,	%i1,	%g4
	set	0x74, %g2
	stha	%o7,	[%l7 + %g2] 0x23
	membar	#Sync
	nop
	setx	loop_517,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	brgez	%o5,	loop_518
	ta	%icc,	0x2
	tsubcctv	%l3,	0x00B1,	%l1
loop_517:
	movneg	%icc,	%o4,	%l0
loop_518:
	edge16n	%i5,	%i6,	%l2
	array16	%l6,	%l4,	%i7
	lduh	[%l7 + 0x62],	%i4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movge	%icc,	%g2,	%g7
	udivx	%g3,	0x0811,	%o6
	tcc	%xcc,	0x4
	nop
	fitod	%f31,	%f8
	lduw	[%l7 + 0x6C],	%g1
	movrgez	%o0,	0x278,	%o1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movcs	%icc,	%g5,	%l5
	set	0x33, %i2
	lduba	[%l7 + %i2] 0x14,	%i2
	edge8	%i3,	%o3,	%g6
	addccc	%o2,	0x12F4,	%i0
	fmovrde	%g4,	%f12,	%f20
	tcc	%icc,	0x5
	movneg	%icc,	%i1,	%o7
	ta	%xcc,	0x7
	tcc	%xcc,	0x0
	fmovdg	%icc,	%f29,	%f20
	fmovdge	%icc,	%f13,	%f21
	fbl,a	%fcc2,	loop_519
	prefetch	[%l7 + 0x70],	 0x0
	stx	%l3,	[%l7 + 0x28]
	smul	%l1,	%o4,	%o5
loop_519:
	srl	%l0,	%i5,	%i6
	fmovrse	%l2,	%f29,	%f20
	edge16	%l4,	%i7,	%l6
	mulscc	%i4,	0x03CE,	%g2
	fmovscc	%xcc,	%f30,	%f26
	ldub	[%l7 + 0x32],	%g3
	edge32n	%o6,	%g1,	%g7
	edge32ln	%o0,	%o1,	%g5
	bgu,a	loop_520
	sdiv	%i2,	0x0016,	%l5
	tvs	%icc,	0x0
	sll	%i3,	0x13,	%o3
loop_520:
	taddcc	%g6,	0x0F23,	%i0
	movrlez	%g4,	%i1,	%o7
	bn,a,pn	%icc,	loop_521
	fbg	%fcc1,	loop_522
	bpos,a	%xcc,	loop_523
	bne,a	%icc,	loop_524
loop_521:
	ldsh	[%l7 + 0x18],	%l3
loop_522:
	movl	%xcc,	%l1,	%o2
loop_523:
	fbg,a	%fcc2,	loop_525
loop_524:
	mulscc	%o5,	0x1C2A,	%l0
	movcs	%icc,	%i5,	%o4
	sll	%l2,	0x11,	%i6
loop_525:
	stw	%l4,	[%l7 + 0x14]
	ldd	[%l7 + 0x28],	%i6
	tpos	%xcc,	0x2
	movl	%icc,	%l6,	%i4
	sub	%g2,	%g3,	%g1
	tsubcc	%g7,	%o0,	%o6
	st	%f22,	[%l7 + 0x18]
	move	%xcc,	%g5,	%i2
	movrne	%o1,	%l5,	%o3
	movge	%xcc,	%g6,	%i3
	sllx	%i0,	0x0A,	%i1
	srl	%o7,	%l3,	%g4
	fbu,a	%fcc0,	loop_526
	and	%o2,	%l1,	%l0
	orncc	%o5,	%o4,	%l2
	xnorcc	%i5,	0x0D06,	%i6
loop_526:
	popc	%l4,	%i7
	nop
	setx	0xC05C8DAB,	%l0,	%l6
	st	%l6,	[%l7 + 0x48]
	ld	[%l7 + 0x48],	%fsr
	smul	%l6,	0x06E8,	%g2
	sdivcc	%i4,	0x1B04,	%g1
	edge16	%g3,	%g7,	%o6
	pdist	%f6,	%f22,	%f16
	fcmpne32	%f20,	%f16,	%o0
	movne	%xcc,	%i2,	%o1
	bn	%icc,	loop_527
	bleu,pt	%icc,	loop_528
	fpackfix	%f2,	%f30
	movrlz	%g5,	%l5,	%g6
loop_527:
	sdivcc	%i3,	0x0240,	%o3
loop_528:
	tleu	%xcc,	0x5
	nop
	setx	0x7EA35A86D43C234F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0xE79CFF6D165F7DA8,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	faddd	%f30,	%f20,	%f22
	fbu	%fcc2,	loop_529
	srl	%i0,	%i1,	%o7
	movrlez	%g4,	0x16A,	%o2
	sll	%l1,	%l0,	%l3
loop_529:
	fbge,a	%fcc1,	loop_530
	tvs	%icc,	0x3
	ldd	[%l7 + 0x18],	%o4
	taddcctv	%o5,	%i5,	%i6
loop_530:
	tvc	%icc,	0x2
	movg	%icc,	%l4,	%i7
	mova	%icc,	%l6,	%g2
	fpadd16s	%f28,	%f2,	%f26
	wr	%g0,	0x80,	%asi
	lduba	[%l7 + 0x54] %asi,	%l2
	movn	%icc,	%i4,	%g1
	sth	%g7,	[%l7 + 0x10]
	tle	%xcc,	0x2
	edge8ln	%o6,	%g3,	%o0
	srax	%i2,	%o1,	%g5
	ble,pt	%xcc,	loop_531
	movge	%icc,	%l5,	%i3
	movrlez	%o3,	0x138,	%i0
	fmovsvc	%icc,	%f15,	%f30
loop_531:
	bcs,a	%xcc,	loop_532
	nop
	set	0x4C, %i5
	lduw	[%l7 + %i5],	%i1
	edge16ln	%o7,	%g6,	%o2
	edge8l	%g4,	%l0,	%l1
loop_532:
	umul	%o4,	0x10C4,	%o5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x10,	%asi
	swapa	[%l7 + 0x2C] %asi,	%l3
	fmovsne	%icc,	%f31,	%f29
	nop
	setx loop_533, %l0, %l1
	jmpl %l1, %i5
	ldub	[%l7 + 0x20],	%i6
	nop
	setx	0x937F49F035378B7D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0xBE8F62EB82B227C9,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	fsubd	%f12,	%f0,	%f4
	sub	%i7,	0x0A51,	%l6
loop_533:
	fpsub16	%f8,	%f6,	%f20
	add	%g2,	%l2,	%l4
	bvc,a	%xcc,	loop_534
	fbule,a	%fcc1,	loop_535
	movrne	%i4,	%g1,	%o6
	bneg,a,pt	%icc,	loop_536
loop_534:
	sra	%g7,	%g3,	%i2
loop_535:
	fmovde	%icc,	%f1,	%f9
	be,a	loop_537
loop_536:
	andn	%o0,	0x06D4,	%o1
	or	%g5,	%i3,	%l5
	orcc	%o3,	%i0,	%i1
loop_537:
	fmovdleu	%icc,	%f14,	%f0
	ble,a	%xcc,	loop_538
	sll	%g6,	0x05,	%o2
	xor	%g4,	0x1D69,	%l0
	movrlez	%l1,	%o4,	%o7
loop_538:
	movpos	%icc,	%o5,	%l3
	add	%i5,	%i6,	%i7
	move	%icc,	%g2,	%l2
	movvc	%xcc,	%l4,	%l6
	tvc	%xcc,	0x1
	brz	%i4,	loop_539
	array8	%o6,	%g1,	%g3
	mulx	%i2,	0x170A,	%o0
	fba	%fcc3,	loop_540
loop_539:
	flush	%l7 + 0x20
	te	%icc,	0x4
	fcmpeq16	%f10,	%f4,	%o1
loop_540:
	sdivx	%g5,	0x07CD,	%i3
	set	0x30, %l3
	prefetcha	[%l7 + %l3] 0x15,	 0x3
	fcmpne16	%f2,	%f30,	%o3
	fnor	%f8,	%f18,	%f6
	fmul8x16	%f19,	%f12,	%f2
	array8	%g7,	%i1,	%i0
	movpos	%icc,	%g6,	%o2
	srax	%g4,	0x19,	%l1
	fpack32	%f22,	%f26,	%f16
	move	%icc,	%l0,	%o4
	wr	%g0,	0x11,	%asi
	ldxa	[%l7 + 0x70] %asi,	%o7
	brz	%o5,	loop_541
	fmovdvs	%xcc,	%f15,	%f0
	nop
	fitod	%f2,	%f12
	fdtos	%f12,	%f15
	addccc	%i5,	0x0579,	%l3
loop_541:
	ta	%icc,	0x1
	fnand	%f8,	%f16,	%f6
	srlx	%i6,	%i7,	%l2
	edge32ln	%g2,	%l4,	%i4
	stb	%o6,	[%l7 + 0x3C]
	andn	%g1,	%g3,	%l6
	srlx	%o0,	%i2,	%g5
	addccc	%o1,	%i3,	%o3
	smulcc	%l5,	0x0D2B,	%i1
	fmovda	%xcc,	%f0,	%f5
	subc	%i0,	%g7,	%o2
	membar	0x3A
	set	0x40, %o6
	stda	%f0,	[%l7 + %o6] 0xf1
	membar	#Sync
	movrgz	%g6,	%l1,	%l0
	fbug	%fcc0,	loop_542
	fbe	%fcc3,	loop_543
	tn	%icc,	0x6
	addccc	%g4,	%o7,	%o4
loop_542:
	fmovsgu	%xcc,	%f1,	%f18
loop_543:
	fones	%f17
	fnot1s	%f5,	%f3
	stbar
	fmuld8sux16	%f24,	%f15,	%f26
	fmovdcs	%icc,	%f12,	%f21
	fblg,a	%fcc1,	loop_544
	tge	%xcc,	0x2
	sdivx	%i5,	0x0928,	%l3
	edge8n	%i6,	%i7,	%o5
loop_544:
	edge8n	%l2,	%g2,	%i4
	nop
	setx	0xD0B8825753B4D9DA,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0xCFD16ECC536B10C5,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	fdivd	%f16,	%f8,	%f24
	bvs,a,pt	%xcc,	loop_545
	umul	%o6,	0x1588,	%g1
	smul	%g3,	0x195B,	%l4
	bne,pn	%icc,	loop_546
loop_545:
	xnorcc	%o0,	0x0959,	%l6
	movrgez	%g5,	0x297,	%i2
	brlez,a	%i3,	loop_547
loop_546:
	brz,a	%o3,	loop_548
	bcc,pn	%icc,	loop_549
	ld	[%l7 + 0x28],	%f18
loop_547:
	edge16n	%o1,	%l5,	%i1
loop_548:
	udivcc	%i0,	0x0219,	%g7
loop_549:
	fmovdcc	%icc,	%f22,	%f3
	movneg	%xcc,	%o2,	%g6
	wr	%g0,	0x0c,	%asi
	lduha	[%l7 + 0x20] %asi,	%l0
	edge32l	%g4,	%o7,	%o4
	prefetch	[%l7 + 0x28],	 0x2
	fcmpgt32	%f18,	%f14,	%i5
	taddcc	%l1,	%l3,	%i6
	udiv	%i7,	0x0916,	%l2
	fmovrslz	%g2,	%f14,	%f0
	tpos	%xcc,	0x3
	andcc	%o5,	0x122C,	%i4
	movne	%icc,	%o6,	%g1
	sir	0x0999
	tge	%icc,	0x5
	edge16ln	%l4,	%g3,	%l6
	movvc	%xcc,	%o0,	%i2
	movne	%icc,	%g5,	%o3
	set	0x44, %i1
	lduwa	[%l7 + %i1] 0x88,	%o1
	tl	%icc,	0x5
	srax	%i3,	%i1,	%l5
	bcs,a	%icc,	loop_550
	tge	%icc,	0x3
	xnorcc	%g7,	0x1D08,	%o2
	movle	%xcc,	%g6,	%i0
loop_550:
	movneg	%icc,	%g4,	%l0
	array8	%o7,	%i5,	%l1
	tl	%icc,	0x1
	tn	%xcc,	0x4
	fba,a	%fcc2,	loop_551
	alignaddrl	%o4,	%i6,	%i7
	subcc	%l2,	%g2,	%o5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_551:
	edge8	%i4,	%l3,	%o6
	tneg	%xcc,	0x2
	nop
	set	0x28, %l1
	ldsb	[%l7 + %l1],	%l4
	std	%f14,	[%l7 + 0x78]
	tne	%icc,	0x5
	fmovrse	%g3,	%f6,	%f7
	sll	%g1,	%l6,	%o0
	edge32n	%g5,	%o3,	%o1
	subcc	%i2,	0x1173,	%i1
	fmovdvs	%icc,	%f1,	%f13
	fand	%f6,	%f4,	%f4
	tvs	%xcc,	0x7
	set	0x14, %l4
	swapa	[%l7 + %l4] 0x18,	%l5
	mulx	%g7,	0x051D,	%o2
	st	%f11,	[%l7 + 0x3C]
	udivx	%i3,	0x0FC7,	%g6
	mulscc	%i0,	%g4,	%l0
	bpos,pn	%xcc,	loop_552
	udiv	%o7,	0x1932,	%l1
	movpos	%xcc,	%i5,	%i6
	tcc	%xcc,	0x5
loop_552:
	mulx	%o4,	0x063E,	%i7
	movge	%xcc,	%l2,	%o5
	tcs	%xcc,	0x2
	umulcc	%i4,	%g2,	%o6
	edge8n	%l3,	%g3,	%g1
	tne	%icc,	0x0
	ldsw	[%l7 + 0x40],	%l6
	xorcc	%l4,	%g5,	%o3
	bvs,a,pn	%xcc,	loop_553
	tne	%xcc,	0x5
	edge16	%o1,	%o0,	%i2
	wr	%g0,	0x0c,	%asi
	ldswa	[%l7 + 0x48] %asi,	%l5
loop_553:
	subc	%g7,	0x1F84,	%o2
	edge16n	%i1,	%i3,	%g6
	edge16ln	%g4,	%l0,	%o7
	tge	%icc,	0x7
	membar	0x75
	add	%l7,	0x4C,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%i0
	casa	[%l6] 0x89,	%i0,	%l1
	nop
	setx	loop_554,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	mova	%xcc,	%i5,	%i6
	array8	%o4,	%l2,	%o5
	fpack32	%f22,	%f28,	%f0
loop_554:
	flush	%l7 + 0x2C
	tpos	%icc,	0x1
	sllx	%i4,	0x0B,	%i7
	fpack32	%f26,	%f8,	%f20
	ta	%xcc,	0x3
	bl,pt	%icc,	loop_555
	brlz,a	%g2,	loop_556
	alignaddr	%o6,	%l3,	%g1
	sir	0x0997
loop_555:
	nop
	wr	%g0,	0x04,	%asi
	ldsha	[%l7 + 0x48] %asi,	%g3
loop_556:
	fabss	%f4,	%f15
	wr	%g0,	0x89,	%asi
	lduba	[%l7 + 0x1D] %asi,	%l6
	fmovsn	%xcc,	%f4,	%f15
	stbar
	fmul8x16al	%f8,	%f22,	%f16
	umul	%l4,	%o3,	%o1
	array16	%o0,	%g5,	%l5
	mova	%xcc,	%i2,	%o2
	fcmpgt16	%f16,	%f2,	%i1
	movrlez	%i3,	%g7,	%g6
	array16	%l0,	%g4,	%i0
	wr	%g0,	0x19,	%asi
	lduwa	[%l7 + 0x18] %asi,	%o7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tsubcc	%i5,	0x0976,	%l1
	xor	%o4,	%l2,	%o5
	fpsub16s	%f0,	%f8,	%f4
	andncc	%i6,	%i7,	%g2
	edge16ln	%o6,	%l3,	%g1
	fbg	%fcc3,	loop_557
	movne	%xcc,	%i4,	%l6
	sir	0x1DA3
	tvc	%xcc,	0x1
loop_557:
	tn	%icc,	0x7
	subc	%l4,	0x1D6B,	%g3
	nop
	fitos	%f0,	%f19
	fstod	%f19,	%f8
	fmovdl	%xcc,	%f21,	%f7
	tsubcc	%o3,	%o1,	%g5
	sir	0x1653
	movleu	%icc,	%l5,	%o0
	srlx	%o2,	%i1,	%i3
	fmovdne	%xcc,	%f25,	%f3
	or	%i2,	%g7,	%g6
	fmovde	%icc,	%f27,	%f11
	udiv	%l0,	0x1CB5,	%i0
	fmovrse	%g4,	%f20,	%f5
	edge32l	%i5,	%l1,	%o7
	ble	%icc,	loop_558
	mulx	%l2,	%o4,	%o5
	ta	%icc,	0x4
	move	%xcc,	%i7,	%i6
loop_558:
	movrgz	%g2,	0x261,	%l3
	fmuld8sux16	%f19,	%f7,	%f22
	xorcc	%o6,	0x1D76,	%i4
	nop
	setx	loop_559,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movvs	%xcc,	%g1,	%l6
	edge8l	%g3,	%l4,	%o1
	mova	%icc,	%g5,	%l5
loop_559:
	edge8ln	%o3,	%o0,	%o2
	movrlz	%i1,	0x2F4,	%i2
	movrne	%i3,	%g7,	%g6
	movcs	%xcc,	%l0,	%i0
	addccc	%i5,	%g4,	%o7
	wr	%g0,	0x22,	%asi
	stba	%l2,	[%l7 + 0x17] %asi
	membar	#Sync
	addccc	%o4,	%o5,	%l1
	edge32ln	%i7,	%g2,	%l3
	sdiv	%i6,	0x03FD,	%o6
	fmuld8sux16	%f0,	%f14,	%f2
	fandnot2s	%f0,	%f20,	%f4
	movpos	%xcc,	%i4,	%g1
	fpadd16	%f8,	%f24,	%f2
	orncc	%g3,	%l6,	%o1
	wr	%g0,	0x04,	%asi
	lduba	[%l7 + 0x1B] %asi,	%l4
	fmovdleu	%xcc,	%f24,	%f1
	bcs,pt	%xcc,	loop_560
	movn	%xcc,	%l5,	%g5
	movn	%icc,	%o0,	%o2
	subcc	%o3,	0x0B64,	%i2
loop_560:
	tpos	%xcc,	0x1
	movcc	%icc,	%i3,	%g7
	fbe	%fcc2,	loop_561
	tvc	%xcc,	0x5
	array8	%g6,	%i1,	%l0
	nop
	fitod	%f4,	%f22
	fdtos	%f22,	%f11
loop_561:
	udivcc	%i0,	0x0C6F,	%i5
	andcc	%g4,	0x1AC3,	%l2
	movcs	%xcc,	%o4,	%o7
	edge16ln	%o5,	%i7,	%g2
	fba	%fcc2,	loop_562
	lduw	[%l7 + 0x58],	%l1
	prefetch	[%l7 + 0x68],	 0x0
	fmovspos	%xcc,	%f23,	%f25
loop_562:
	array32	%i6,	%l3,	%i4
	array32	%g1,	%o6,	%g3
	smul	%l6,	%o1,	%l5
	set	0x24, %g4
	ldswa	[%l7 + %g4] 0x10,	%l4
	mova	%icc,	%o0,	%g5
	move	%xcc,	%o2,	%i2
	andncc	%o3,	%i3,	%g6
	fmovsvs	%icc,	%f4,	%f6
	movrne	%g7,	0x04E,	%i1
	fpadd32	%f14,	%f18,	%f16
	tleu	%icc,	0x7
	fmovsne	%xcc,	%f6,	%f30
	move	%icc,	%i0,	%i5
	edge32l	%l0,	%g4,	%o4
	movrgez	%o7,	%o5,	%i7
	fmovdvs	%icc,	%f27,	%f30
	te	%xcc,	0x3
	st	%f12,	[%l7 + 0x5C]
	wr	%g0,	0x89,	%asi
	ldswa	[%l7 + 0x20] %asi,	%g2
	movge	%icc,	%l2,	%l1
	fmovrse	%l3,	%f7,	%f26
	nop
	set	0x10, %o2
	stx	%i6,	[%l7 + %o2]
	movrlz	%i4,	%o6,	%g3
	ba,a,pt	%xcc,	loop_563
	ldd	[%l7 + 0x40],	%f8
	ldsb	[%l7 + 0x40],	%l6
	popc	0x03D0,	%g1
loop_563:
	stb	%l5,	[%l7 + 0x7F]
	fcmpeq16	%f16,	%f24,	%o1
	fmovdne	%xcc,	%f21,	%f23
	tge	%icc,	0x5
	add	%l4,	0x09F6,	%o0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbo,a	%fcc2,	loop_564
	fmul8x16al	%f2,	%f19,	%f26
	xnor	%g5,	%i2,	%o2
	tvs	%icc,	0x1
loop_564:
	ldsb	[%l7 + 0x76],	%o3
	tvc	%xcc,	0x3
	edge8	%i3,	%g6,	%g7
	movrlez	%i1,	%i5,	%i0
	tvs	%icc,	0x2
	fmovrslz	%l0,	%f29,	%f9
	brz,a	%o4,	loop_565
	fmovse	%icc,	%f8,	%f5
	fmovdgu	%xcc,	%f31,	%f15
	fbo,a	%fcc2,	loop_566
loop_565:
	fbug,a	%fcc0,	loop_567
	edge32	%o7,	%g4,	%i7
	tge	%xcc,	0x0
loop_566:
	tgu	%xcc,	0x1
loop_567:
	fone	%f12
	ldsh	[%l7 + 0x22],	%o5
	tgu	%icc,	0x2
	tsubcc	%l2,	%l1,	%g2
	ld	[%l7 + 0x7C],	%f17
	sllx	%l3,	0x0F,	%i4
	movrlez	%o6,	%i6,	%g3
	or	%l6,	%g1,	%o1
	smulcc	%l5,	%l4,	%o0
	nop
	fitos	%f5,	%f13
	fstox	%f13,	%f30
	fxtos	%f30,	%f16
	edge32n	%i2,	%o2,	%g5
	fmovde	%icc,	%f7,	%f9
	stx	%o3,	[%l7 + 0x20]
	movrlez	%g6,	%g7,	%i1
	wr	%g0,	0x0c,	%asi
	stha	%i5,	[%l7 + 0x18] %asi
	mulscc	%i3,	%l0,	%o4
	srlx	%i0,	0x15,	%g4
	move	%xcc,	%i7,	%o7
	fble	%fcc2,	loop_568
	be,a,pn	%xcc,	loop_569
	edge16n	%l2,	%l1,	%g2
	addccc	%l3,	0x1096,	%i4
loop_568:
	fcmple16	%f0,	%f22,	%o5
loop_569:
	movne	%icc,	%o6,	%g3
	movn	%xcc,	%i6,	%g1
	addccc	%l6,	%l5,	%o1
	movg	%xcc,	%o0,	%l4
	umul	%o2,	%i2,	%o3
	taddcctv	%g6,	%g5,	%g7
	set	0x48, %i0
	lda	[%l7 + %i0] 0x11,	%f16
	array32	%i5,	%i1,	%i3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andncc	%l0,	%i0,	%g4
	set	0x24, %g3
	sta	%f15,	[%l7 + %g3] 0x18
	fnors	%f13,	%f11,	%f13
	subc	%o4,	%o7,	%l2
	umulcc	%l1,	%g2,	%i7
	umul	%l3,	0x03DE,	%i4
	edge16n	%o5,	%g3,	%o6
	movge	%xcc,	%i6,	%g1
	taddcctv	%l5,	0x0576,	%l6
	fbue	%fcc2,	loop_570
	fandnot2	%f16,	%f4,	%f20
	mulscc	%o1,	0x0D89,	%o0
	sra	%o2,	0x05,	%i2
loop_570:
	movcc	%icc,	%l4,	%o3
	move	%icc,	%g5,	%g6
	be,a	%icc,	loop_571
	subccc	%i5,	%i1,	%g7
	fbul,a	%fcc0,	loop_572
	st	%f9,	[%l7 + 0x2C]
loop_571:
	fandnot2s	%f18,	%f6,	%f30
	xnor	%l0,	0x127A,	%i3
loop_572:
	udiv	%i0,	0x038A,	%o4
	movneg	%icc,	%g4,	%o7
	fmovrdne	%l1,	%f0,	%f2
	orcc	%l2,	%g2,	%i7
	edge32ln	%i4,	%o5,	%g3
	nop
	fitos	%f4,	%f6
	fstoi	%f6,	%f0
	andncc	%l3,	%o6,	%g1
	array16	%i6,	%l6,	%l5
	andn	%o0,	%o1,	%o2
	tsubcc	%i2,	%o3,	%g5
	fmovsvc	%icc,	%f19,	%f24
	movpos	%icc,	%l4,	%i5
	fbug,a	%fcc1,	loop_573
	tvc	%xcc,	0x0
	alignaddrl	%g6,	%g7,	%i1
	tne	%icc,	0x6
loop_573:
	nop
	set	0x2A, %g7
	lduha	[%l7 + %g7] 0x80,	%l0
	nop
	setx	0xDC8B7E60,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f2
	setx	0x0D4B5EC1,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f7
	fadds	%f7,	%f2,	%f27
	fnors	%f29,	%f22,	%f15
	add	%l7,	0x3C,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] %asi,	%i3,	%i0
	nop
	setx	loop_574,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fmuld8sux16	%f5,	%f24,	%f0
	fones	%f28
	fmovsne	%xcc,	%f30,	%f15
loop_574:
	fabss	%f17,	%f1
	fcmpne16	%f12,	%f4,	%g4
	umulcc	%o4,	%l1,	%l2
	edge32	%o7,	%i7,	%g2
	andn	%i4,	0x0521,	%g3
	bgu,a	loop_575
	movg	%icc,	%l3,	%o5
	ldstub	[%l7 + 0x55],	%g1
	tn	%xcc,	0x2
loop_575:
	bpos	loop_576
	udivcc	%i6,	0x1335,	%o6
	edge8	%l6,	%l5,	%o1
	fmovrdgz	%o0,	%f24,	%f18
loop_576:
	movvc	%xcc,	%i2,	%o3
	edge16	%o2,	%g5,	%l4
	movcc	%icc,	%i5,	%g7
	udivx	%g6,	0x0C29,	%l0
	fmovsneg	%icc,	%f16,	%f20
	subcc	%i1,	%i0,	%g4
	movleu	%xcc,	%i3,	%l1
	nop
	fitod	%f12,	%f10
	fdtox	%f10,	%f18
	fxtod	%f18,	%f4
	tcs	%xcc,	0x0
	nop
	setx	0xB085699E,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f23
	setx	0x84482BC6,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f4
	fdivs	%f4,	%f23,	%f9
	swap	[%l7 + 0x10],	%o4
	sub	%o7,	%l2,	%i7
	subc	%i4,	0x17CD,	%g2
	sub	%g3,	0x19FB,	%o5
	stx	%g1,	[%l7 + 0x70]
	fbo,a	%fcc0,	loop_577
	fcmpeq32	%f20,	%f12,	%i6
	xnorcc	%l3,	%o6,	%l6
	nop
	setx	0xF084B3DE,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f16
	fsqrts	%f16,	%f5
loop_577:
	fmovsn	%xcc,	%f21,	%f7
	sdivcc	%o1,	0x0CD5,	%l5
	smul	%o0,	0x05CC,	%o3
	andncc	%o2,	%g5,	%i2
	umulcc	%i5,	0x120A,	%g7
	movg	%xcc,	%g6,	%l4
	set	0x2E, %i7
	ldsha	[%l7 + %i7] 0x81,	%l0
	alignaddr	%i0,	%i1,	%i3
	call	loop_578
	fmovde	%icc,	%f0,	%f28
	tpos	%xcc,	0x1
	addc	%g4,	%o4,	%o7
loop_578:
	brlz,a	%l2,	loop_579
	nop
	fitod	%f0,	%f22
	fdtos	%f22,	%f10
	nop
	setx	0x10668DC2,	%l0,	%l6
	st	%l6,	[%l7 + 0x08]
	ld	[%l7 + 0x08],	%fsr
	tne	%xcc,	0x2
loop_579:
	tcc	%xcc,	0x3
	orn	%l1,	%i7,	%i4
	xnor	%g2,	0x1407,	%o5
	movle	%xcc,	%g1,	%g3
	movge	%icc,	%l3,	%i6
	movcc	%icc,	%o6,	%l6
	fbe	%fcc0,	loop_580
	fbo	%fcc0,	loop_581
	tleu	%icc,	0x7
	nop
	set	0x44, %o1
	stb	%l5,	[%l7 + %o1]
loop_580:
	fmovrdlz	%o0,	%f12,	%f10
loop_581:
	tg	%icc,	0x4
	addc	%o3,	%o2,	%o1
	movre	%g5,	0x3D7,	%i2
	sll	%g7,	0x13,	%i5
	udivcc	%g6,	0x0374,	%l4
	sdiv	%i0,	0x0262,	%i1
	nop
	setx	loop_582,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fnot1	%f26,	%f20
	fmovdcs	%xcc,	%f3,	%f27
	edge8ln	%l0,	%g4,	%i3
loop_582:
	nop
	wr	%g0,	0x21,	%asi
	ldxa	[%g0 + 0x108] %asi,	%o4
	tvc	%icc,	0x5
	sdiv	%l2,	0x0B49,	%o7
	movre	%i7,	0x067,	%l1
	andn	%i4,	%g2,	%o5
	or	%g1,	%l3,	%g3
	set	0x76, %l6
	lduha	[%l7 + %l6] 0x0c,	%o6
	movl	%xcc,	%l6,	%i6
	orncc	%o0,	%o3,	%l5
	orn	%o1,	0x0B4C,	%o2
	tleu	%icc,	0x7
	popc	%i2,	%g7
	membar	0x74
	std	%f18,	[%l7 + 0x10]
	pdist	%f20,	%f26,	%f30
	for	%f20,	%f4,	%f14
	srlx	%g5,	0x17,	%i5
	fmovdleu	%xcc,	%f30,	%f3
	nop
	setx	0xF6B9CFABB0761518,	%l0,	%l6
	stx	%l6,	[%l7 + 0x78]
	ldx	[%l7 + 0x78],	%fsr
	taddcc	%g6,	0x1FC0,	%l4
	fxor	%f26,	%f10,	%f10
	add	%i1,	0x0A00,	%l0
	edge16ln	%g4,	%i3,	%i0
	fpadd16	%f8,	%f0,	%f24
	wr	%g0,	0x81,	%asi
	lduba	[%l7 + 0x6A] %asi,	%o4
	edge16	%o7,	%i7,	%l1
	array8	%i4,	%l2,	%g2
	movrlz	%o5,	0x2EC,	%g1
	set	0x5A, %o5
	ldsba	[%l7 + %o5] 0x11,	%l3
	movpos	%icc,	%g3,	%l6
	bge,a	%xcc,	loop_583
	fmovrsgez	%i6,	%f28,	%f8
	fmovdpos	%xcc,	%f23,	%f8
	bne,a,pt	%xcc,	loop_584
loop_583:
	bl,a,pn	%icc,	loop_585
	fmovda	%xcc,	%f12,	%f12
	mulx	%o0,	%o6,	%l5
loop_584:
	edge32ln	%o1,	%o2,	%o3
loop_585:
	bcs,pn	%icc,	loop_586
	edge32ln	%g7,	%i2,	%g5
	edge8n	%i5,	%l4,	%i1
	fmul8ulx16	%f10,	%f22,	%f12
loop_586:
	fmovrdne	%l0,	%f16,	%f8
	set	0x68, %o7
	prefetcha	[%l7 + %o7] 0x0c,	 0x3
	bgu	loop_587
	tpos	%xcc,	0x6
	fmovsn	%xcc,	%f11,	%f24
	tge	%icc,	0x2
loop_587:
	nop
	wr	%g0,	0x0c,	%asi
	ldswa	[%l7 + 0x08] %asi,	%g4
	orn	%i0,	%o4,	%o7
	nop
	setx	0xA65032D4B81EFAFC,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0x24CBB620492A16B8,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	fsubd	%f20,	%f26,	%f8
	set	0x3C, %o3
	sta	%f20,	[%l7 + %o3] 0x11
	subccc	%i7,	%l1,	%i4
	edge8n	%i3,	%g2,	%o5
	fnands	%f25,	%f21,	%f22
	array8	%g1,	%l3,	%g3
	udivx	%l6,	0x0462,	%l2
	bgu	loop_588
	fmovrsgz	%i6,	%f8,	%f20
	tcs	%icc,	0x0
	nop
	setx	loop_589,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_588:
	ldx	[%l7 + 0x30],	%o0
	tg	%xcc,	0x1
	st	%f27,	[%l7 + 0x20]
loop_589:
	brlez,a	%o6,	loop_590
	addccc	%l5,	%o1,	%o2
	ldd	[%l7 + 0x08],	%f28
	movvc	%icc,	%o3,	%i2
loop_590:
	and	%g5,	0x1595,	%i5
	sllx	%g7,	%i1,	%l0
	set	0x2D, %l2
	ldsba	[%l7 + %l2] 0x14,	%g6
	fmovrsgez	%g4,	%f11,	%f22
	movcc	%xcc,	%i0,	%l4
	movne	%xcc,	%o7,	%o4
	ta	%xcc,	0x4
	set	0x68, %o0
	ldxa	[%l7 + %o0] 0x81,	%i7
	srax	%i4,	%l1,	%g2
	movpos	%xcc,	%o5,	%g1
	edge32l	%i3,	%g3,	%l3
	bvc,a	%xcc,	loop_591
	bcc,a,pn	%xcc,	loop_592
	fcmpne32	%f16,	%f12,	%l2
	movrgz	%i6,	%o0,	%l6
loop_591:
	tneg	%icc,	0x2
loop_592:
	mulscc	%l5,	%o1,	%o2
	nop
	setx loop_593, %l0, %l1
	jmpl %l1, %o3
	tvs	%icc,	0x3
	tcs	%xcc,	0x2
	wr	%g0,	0x80,	%asi
	lduba	[%l7 + 0x79] %asi,	%o6
loop_593:
	taddcc	%g5,	0x1E80,	%i2
	tn	%xcc,	0x7
	fmovsg	%xcc,	%f23,	%f9
	tcc	%xcc,	0x2
	fmovdg	%icc,	%f9,	%f23
	faligndata	%f20,	%f28,	%f2
	lduw	[%l7 + 0x64],	%i5
	movrne	%i1,	0x289,	%l0
	bn,pt	%icc,	loop_594
	nop
	setx	0x825A13D57B7B47D6,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0xA04322A0C912B056,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	fmuld	%f30,	%f16,	%f16
	tl	%xcc,	0x2
	movge	%xcc,	%g6,	%g4
loop_594:
	fbule	%fcc0,	loop_595
	fzeros	%f29
	bne,pn	%xcc,	loop_596
	xnorcc	%g7,	%i0,	%l4
loop_595:
	tn	%icc,	0x2
	edge32	%o7,	%i7,	%o4
loop_596:
	fnands	%f3,	%f15,	%f31
	set	0x5C, %i4
	swapa	[%l7 + %i4] 0x19,	%l1
	movne	%icc,	%i4,	%o5
	nop
	setx	0xA07B9869,	%l0,	%l6
	st	%l6,	[%l7 + 0x64]
	ld	[%l7 + 0x64],	%fsr
	fsrc2	%f10,	%f4
	nop
	setx	0x1DD6C95E,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f23
	setx	0xC4B9F196,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f0
	fdivs	%f0,	%f23,	%f17
	nop
	fitod	%f27,	%f28
	fmovdg	%icc,	%f31,	%f3
	tcs	%xcc,	0x3
	edge16n	%g1,	%g2,	%g3
	alignaddr	%l3,	%l2,	%i6
	add	%l7,	0x7C,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%i3
	casa	[%l6] 0x80,	%i3,	%o0
	fmovdneg	%icc,	%f19,	%f9
	movre	%l6,	%l5,	%o2
	bn,pt	%icc,	loop_597
	tvs	%icc,	0x3
	orncc	%o3,	%o1,	%o6
	fpackfix	%f2,	%f29
loop_597:
	fmovrde	%i2,	%f24,	%f24
	andn	%i5,	%i1,	%l0
	wr	%g0,	0x88,	%asi
	lduba	[%l7 + 0x44] %asi,	%g6
	bvc	loop_598
	taddcctv	%g5,	%g4,	%i0
	fmovspos	%xcc,	%f0,	%f19
	xorcc	%g7,	0x1012,	%o7
loop_598:
	fbe,a	%fcc1,	loop_599
	tg	%xcc,	0x4
	movrgez	%l4,	0x1D8,	%i7
	tcs	%icc,	0x0
loop_599:
	edge16l	%l1,	%i4,	%o5
	bg,a	%xcc,	loop_600
	addccc	%o4,	0x048B,	%g2
	fmovdg	%icc,	%f14,	%f1
	nop
	setx	0x95836BF634AD618C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	setx	0x8892ED202CB4FE6F,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	fmuld	%f6,	%f18,	%f4
loop_600:
	fmovscc	%icc,	%f25,	%f19
	fmul8sux16	%f12,	%f18,	%f14
	umulcc	%g3,	%l3,	%l2
	srax	%i6,	%g1,	%i3
	fmovsn	%xcc,	%f29,	%f26
	movg	%xcc,	%o0,	%l6
	wr	%g0,	0x04,	%asi
	ldxa	[%l7 + 0x38] %asi,	%o2
	stw	%l5,	[%l7 + 0x7C]
	fmovrsgz	%o3,	%f29,	%f7
	xnor	%o6,	%o1,	%i2
	fmovrslz	%i5,	%f31,	%f25
	tneg	%icc,	0x7
	membar	0x0C
	tn	%icc,	0x0
	movge	%xcc,	%i1,	%g6
	array8	%l0,	%g5,	%g4
	tgu	%xcc,	0x7
	brgz	%g7,	loop_601
	fsrc2s	%f8,	%f7
	orcc	%i0,	0x072F,	%o7
	fmovsa	%icc,	%f0,	%f20
loop_601:
	nop
	add	%l7,	0x68,	%l6
	wr	%g0,	0x11,	%asi
	ldxa	[%l6] %asi,	%l4
	casxa	[%l6] 0x11,	%l4,	%l1
	movleu	%xcc,	%i4,	%o5
	orn	%i7,	0x0AE6,	%o4
	tg	%icc,	0x6
	prefetch	[%l7 + 0x58],	 0x0
	movle	%icc,	%g3,	%g2
	movgu	%icc,	%l3,	%i6
	udivx	%g1,	0x0A4A,	%l2
	movcs	%icc,	%i3,	%o0
	andn	%o2,	0x0F6F,	%l5
	edge16	%o3,	%o6,	%l6
	fpadd32	%f8,	%f16,	%f10
	bg	loop_602
	bn,pt	%xcc,	loop_603
	ldd	[%l7 + 0x60],	%i2
	fabsd	%f28,	%f12
loop_602:
	addcc	%o1,	0x09CA,	%i1
loop_603:
	fmovsneg	%xcc,	%f11,	%f19
	nop
	setx	loop_604,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fnors	%f13,	%f4,	%f1
	bl	%xcc,	loop_605
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_604:
	andcc	%i5,	%g6,	%l0
	fandnot1s	%f23,	%f26,	%f11
loop_605:
	addc	%g4,	0x0662,	%g7
	movne	%xcc,	%i0,	%o7
	set	0x40, %i6
	ldda	[%l7 + %i6] 0x10,	%f16
	fmovsgu	%icc,	%f17,	%f6
	bpos,a	loop_606
	sra	%l4,	0x14,	%l1
	bgu,pt	%xcc,	loop_607
	brgz,a	%g5,	loop_608
loop_606:
	movrlz	%i4,	0x127,	%o5
	bcs	%icc,	loop_609
loop_607:
	tpos	%xcc,	0x0
loop_608:
	tl	%xcc,	0x3
	mova	%xcc,	%i7,	%g3
loop_609:
	flush	%l7 + 0x1C
	fcmpne16	%f24,	%f8,	%g2
	ta	%icc,	0x4
	ld	[%l7 + 0x14],	%f25
	nop
	fitos	%f14,	%f18
	fstoi	%f18,	%f12
	brlez,a	%o4,	loop_610
	addccc	%i6,	0x02FF,	%g1
	edge32l	%l3,	%l2,	%o0
	movvs	%xcc,	%o2,	%i3
loop_610:
	movgu	%icc,	%o3,	%l5
	mulx	%o6,	0x0236,	%l6
	edge8ln	%i2,	%o1,	%i5
	fmovdcs	%xcc,	%f29,	%f17
	udivcc	%i1,	0x04EB,	%g6
	wr	%g0,	0x80,	%asi
	swapa	[%l7 + 0x50] %asi,	%g4
	fmovdn	%icc,	%f10,	%f20
	tne	%xcc,	0x3
	tvc	%xcc,	0x1
	sethi	0x118C,	%l0
	tsubcctv	%i0,	0x16D7,	%o7
	sll	%l4,	0x02,	%g7
	or	%l1,	%i4,	%g5
	fba	%fcc3,	loop_611
	andcc	%o5,	0x1808,	%g3
	xnor	%i7,	0x1932,	%o4
	subcc	%g2,	%i6,	%g1
loop_611:
	array32	%l2,	%l3,	%o2
	tcs	%icc,	0x6
	udiv	%o0,	0x13F6,	%o3
	fbo	%fcc1,	loop_612
	fmul8x16al	%f29,	%f15,	%f6
	fmovdpos	%icc,	%f26,	%f18
	ldsh	[%l7 + 0x26],	%i3
loop_612:
	bcs,pt	%icc,	loop_613
	bn	loop_614
	tcc	%xcc,	0x2
	array8	%o6,	%l5,	%l6
loop_613:
	fbuge,a	%fcc2,	loop_615
loop_614:
	fmovde	%xcc,	%f21,	%f19
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srlx	%i2,	%o1,	%i1
loop_615:
	fxor	%f4,	%f14,	%f26
	ldsh	[%l7 + 0x10],	%i5
	nop
	setx	0x8B0FF41E,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f4
	setx	0x3782535B,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f25
	fsubs	%f25,	%f4,	%f3
	udiv	%g6,	0x16D9,	%l0
	umulcc	%i0,	0x1EA1,	%g4
	tge	%icc,	0x0
	fmovrsgz	%l4,	%f28,	%f7
	edge16	%o7,	%g7,	%l1
	movrgz	%g5,	0x1F2,	%i4
	tgu	%xcc,	0x6
	smul	%o5,	%g3,	%o4
	sll	%i7,	0x0F,	%g2
	srax	%i6,	%g1,	%l3
	fmovdg	%icc,	%f13,	%f10
	edge32ln	%o2,	%l2,	%o3
	fbul,a	%fcc1,	loop_616
	tg	%icc,	0x4
	tpos	%icc,	0x0
	movle	%icc,	%o0,	%o6
loop_616:
	fmovdpos	%icc,	%f27,	%f2
	fcmpeq16	%f12,	%f14,	%l5
	taddcc	%l6,	%i3,	%i2
	xor	%i1,	%o1,	%i5
	edge16	%l0,	%i0,	%g4
	fmovdvs	%icc,	%f6,	%f25
	subc	%l4,	%g6,	%g7
	array32	%l1,	%g5,	%o7
	st	%f4,	[%l7 + 0x44]
	set	0x8, %g6
	ldxa	[%g0 + %g6] 0x21,	%o5
	umulcc	%i4,	0x0897,	%o4
	fbe,a	%fcc3,	loop_617
	srl	%g3,	%g2,	%i7
	nop
	fitos	%f0,	%f28
	movrgz	%i6,	0x047,	%g1
loop_617:
	fand	%f24,	%f2,	%f4
	tge	%xcc,	0x4
	fexpand	%f20,	%f16
	orn	%l3,	0x04D9,	%l2
	taddcc	%o2,	%o3,	%o0
	stb	%o6,	[%l7 + 0x5B]
	tleu	%xcc,	0x3
	sub	%l6,	0x013C,	%l5
	bpos,a,pn	%xcc,	loop_618
	xorcc	%i2,	%i3,	%i1
	nop
	setx	0x61B01099BCC74C1C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	fsqrtd	%f24,	%f8
	movrgez	%i5,	%l0,	%i0
loop_618:
	fmovsne	%xcc,	%f11,	%f3
	bneg,a	%icc,	loop_619
	movpos	%icc,	%o1,	%l4
	subcc	%g4,	%g7,	%g6
	fmul8sux16	%f14,	%f22,	%f8
loop_619:
	xnor	%g5,	0x0FE9,	%l1
	brgez,a	%o7,	loop_620
	movrlz	%i4,	0x070,	%o5
	fcmpne32	%f6,	%f4,	%o4
	fnands	%f17,	%f24,	%f16
loop_620:
	edge8	%g2,	%g3,	%i6
	wr	%g0,	0x10,	%asi
	stxa	%g1,	[%l7 + 0x10] %asi
	edge32ln	%i7,	%l3,	%o2
	fbul,a	%fcc2,	loop_621
	sdivx	%o3,	0x1660,	%l2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movcc	%xcc,	%o6,	%l6
loop_621:
	udiv	%o0,	0x0FAF,	%i2
	tsubcctv	%l5,	0x0D40,	%i3
	bn	loop_622
	fbug,a	%fcc3,	loop_623
	xnor	%i1,	0x12D9,	%l0
	tge	%xcc,	0x0
loop_622:
	nop
	setx	loop_624,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_623:
	mova	%xcc,	%i0,	%o1
	bgu	%xcc,	loop_625
	fxnor	%f10,	%f8,	%f30
loop_624:
	nop
	setx	loop_626,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	be,a	loop_627
loop_625:
	fbule	%fcc1,	loop_628
	movrgz	%i5,	%l4,	%g4
loop_626:
	tsubcc	%g6,	0x001F,	%g7
loop_627:
	nop
	wr	%g0,	0x80,	%asi
	sta	%f9,	[%l7 + 0x44] %asi
loop_628:
	fmovscs	%icc,	%f28,	%f7
	nop
	setx	0x2BC15F07,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f4
	setx	0xC0A86B14,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f21
	fsubs	%f21,	%f4,	%f31
	andncc	%g5,	%l1,	%o7
	movrlz	%o5,	0x1FC,	%i4
	movrlez	%o4,	%g3,	%g2
	movcs	%icc,	%g1,	%i6
	fblg,a	%fcc2,	loop_629
	alignaddrl	%l3,	%i7,	%o2
	movgu	%icc,	%l2,	%o3
	array8	%o6,	%o0,	%l6
loop_629:
	orcc	%i2,	0x1C78,	%i3
	fmovrde	%l5,	%f20,	%f28
	edge32	%i1,	%l0,	%i0
	fornot2s	%f30,	%f21,	%f16
	brz,a	%o1,	loop_630
	tcs	%xcc,	0x7
	xnorcc	%l4,	%i5,	%g4
	tleu	%xcc,	0x5
loop_630:
	nop
	setx	0x255B3F7ACC8C2565,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0xEF9C0B5EA3003389,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	fdivd	%f6,	%f2,	%f2
	mulx	%g7,	%g6,	%g5
	mulx	%l1,	0x1B59,	%o7
	and	%o5,	%o4,	%i4
	ldub	[%l7 + 0x3D],	%g2
	edge8ln	%g3,	%g1,	%i6
	edge16n	%l3,	%o2,	%l2
	movvs	%icc,	%o3,	%o6
	fmovrdne	%o0,	%f0,	%f4
	ta	%icc,	0x7
	nop
	setx	0x1D89CA28,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f27
	setx	0x87BD73E4,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f23
	fadds	%f23,	%f27,	%f4
	tne	%icc,	0x2
	fnands	%f27,	%f17,	%f20
	nop
	fitod	%f15,	%f0
	edge32n	%i7,	%i2,	%i3
	brlz	%l6,	loop_631
	xnorcc	%i1,	0x0E99,	%l5
	edge8	%i0,	%o1,	%l4
	sdivcc	%i5,	0x1E46,	%g4
loop_631:
	nop
	set	0x10, %l5
	ldx	[%l7 + %l5],	%l0
	sra	%g6,	0x17,	%g7
	umulcc	%l1,	%o7,	%o5
	ldub	[%l7 + 0x67],	%g5
	xorcc	%i4,	%g2,	%g3
	fmovrsgz	%o4,	%f9,	%f23
	bg,pn	%xcc,	loop_632
	orn	%g1,	%l3,	%o2
	movrne	%l2,	0x2CC,	%o3
	fcmpeq32	%f8,	%f30,	%o6
loop_632:
	sll	%o0,	0x01,	%i6
	set	0x30, %g1
	swapa	[%l7 + %g1] 0x89,	%i2
	fornot1s	%f26,	%f28,	%f9
	fmovde	%xcc,	%f11,	%f19
	bcs,a	%xcc,	loop_633
	bleu,a	loop_634
	srlx	%i7,	0x02,	%i3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_633:
	fxnor	%f0,	%f4,	%f6
loop_634:
	fpadd32s	%f21,	%f2,	%f22
	udivx	%i1,	0x1C81,	%l6
	nop
	fitos	%f4,	%f6
	fmovrsgz	%i0,	%f19,	%f20
	addc	%l5,	0x1154,	%o1
	tcc	%xcc,	0x1
	fnand	%f6,	%f30,	%f18
	ldd	[%l7 + 0x10],	%f0
	sir	0x170A
	bcs	%xcc,	loop_635
	fmovrslez	%i5,	%f6,	%f29
	wr	%g0,	0x10,	%asi
	sta	%f20,	[%l7 + 0x78] %asi
loop_635:
	movcs	%xcc,	%l4,	%g4
	brz	%l0,	loop_636
	edge32l	%g7,	%g6,	%l1
	edge16ln	%o7,	%g5,	%o5
	add	%i4,	%g2,	%g3
loop_636:
	brz	%o4,	loop_637
	tvc	%xcc,	0x1
	add	%g1,	%o2,	%l2
	smulcc	%l3,	%o6,	%o3
loop_637:
	subc	%o0,	0x1C05,	%i2
	fpack32	%f2,	%f16,	%f10
	xnorcc	%i6,	0x1A59,	%i7
	wr	%g0,	0x89,	%asi
	prefetcha	[%l7 + 0x08] %asi,	 0x1
	fmovdgu	%xcc,	%f27,	%f31
	sdivcc	%i3,	0x0E15,	%i0
	tgu	%icc,	0x2
	movrgez	%l5,	0x29B,	%l6
	edge16ln	%o1,	%i5,	%l4
	fbul,a	%fcc3,	loop_638
	movrgz	%g4,	0x1B2,	%g7
	set	0x15, %i3
	stba	%g6,	[%l7 + %i3] 0x11
loop_638:
	orncc	%l1,	%l0,	%g5
	movg	%xcc,	%o7,	%i4
	swap	[%l7 + 0x68],	%g2
	stw	%g3,	[%l7 + 0x18]
	fbge,a	%fcc3,	loop_639
	move	%xcc,	%o5,	%g1
	brlez,a	%o4,	loop_640
	sll	%o2,	0x11,	%l3
loop_639:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnands	%f0,	%f4,	%f9
loop_640:
	ble,pn	%icc,	loop_641
	smulcc	%l2,	0x1C0F,	%o3
	fcmple16	%f12,	%f0,	%o0
	subc	%o6,	0x1371,	%i2
loop_641:
	bneg,pt	%xcc,	loop_642
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldd	[%l7 + 0x30],	%i6
	set	0x0E, %l0
	lduba	[%l7 + %l0] 0x19,	%i1
loop_642:
	edge16ln	%i3,	%i6,	%i0
	prefetch	[%l7 + 0x1C],	 0x2
	fble,a	%fcc3,	loop_643
	andcc	%l5,	0x1757,	%o1
	andncc	%i5,	%l6,	%g4
	fbge,a	%fcc3,	loop_644
loop_643:
	fcmple32	%f18,	%f30,	%g7
	xnor	%g6,	%l1,	%l4
	wr	%g0,	0x89,	%asi
	lduwa	[%l7 + 0x30] %asi,	%l0
loop_644:
	nop
	wr	%g0,	0x19,	%asi
	prefetcha	[%l7 + 0x60] %asi,	 0x0
	bneg	loop_645
	fmovda	%icc,	%f8,	%f5
	fbu	%fcc0,	loop_646
	sub	%g5,	%i4,	%g3
loop_645:
	movrgz	%g2,	%g1,	%o5
	call	loop_647
loop_646:
	fsrc1	%f4,	%f24
	fones	%f14
	orn	%o2,	%o4,	%l2
loop_647:
	xnor	%l3,	%o3,	%o0
	te	%xcc,	0x5
	fmovscs	%icc,	%f18,	%f22
	ldub	[%l7 + 0x55],	%i2
	tvc	%xcc,	0x4
	fones	%f25
	lduw	[%l7 + 0x6C],	%i7
	movleu	%xcc,	%o6,	%i1
	fabsd	%f30,	%f8
	tsubcctv	%i6,	0x1FC6,	%i0
	edge16n	%i3,	%o1,	%l5
	srlx	%l6,	0x1A,	%i5
	wr	%g0,	0x89,	%asi
	ldda	[%l7 + 0x70] %asi,	%g4
	fzero	%f12
	movg	%icc,	%g7,	%l1
	sra	%l4,	0x03,	%g6
	tcc	%xcc,	0x5
	sir	0x14D4
	wr	%g0,	0x19,	%asi
	stxa	%o7,	[%l7 + 0x28] %asi
	taddcc	%l0,	%i4,	%g5
	edge32n	%g3,	%g2,	%g1
	bpos,a	loop_648
	movvs	%xcc,	%o5,	%o4
	ta	%xcc,	0x6
	fbuge	%fcc0,	loop_649
loop_648:
	edge32n	%l2,	%l3,	%o2
	tge	%xcc,	0x2
	fmovsneg	%icc,	%f19,	%f11
loop_649:
	nop
	set	0x0A, %o4
	stb	%o3,	[%l7 + %o4]
	movleu	%xcc,	%i2,	%o0
	movrgz	%i7,	0x3B4,	%o6
	fexpand	%f25,	%f28
	umulcc	%i1,	0x134A,	%i6
	array16	%i3,	%i0,	%l5
	taddcc	%o1,	0x0962,	%l6
	ldd	[%l7 + 0x28],	%f20
	fcmpeq16	%f6,	%f24,	%i5
	fblg	%fcc0,	loop_650
	array32	%g4,	%l1,	%g7
	fmovda	%icc,	%f17,	%f3
	bcs,a	loop_651
loop_650:
	sethi	0x0CD9,	%g6
	fblg,a	%fcc2,	loop_652
	popc	%o7,	%l0
loop_651:
	brlez,a	%i4,	loop_653
	addcc	%g5,	0x1454,	%g3
loop_652:
	swap	[%l7 + 0x34],	%g2
	fcmpgt32	%f2,	%f28,	%l4
loop_653:
	tge	%xcc,	0x3
	fmovsle	%icc,	%f29,	%f31
	andncc	%g1,	%o4,	%l2
	tg	%xcc,	0x5
	movrlez	%l3,	0x18A,	%o5
	ta	%xcc,	0x2
	xor	%o2,	%o3,	%i2
	brgz,a	%o0,	loop_654
	movvc	%icc,	%i7,	%i1
	ld	[%l7 + 0x34],	%f4
	sdivx	%o6,	0x0A48,	%i6
loop_654:
	fcmpeq16	%f24,	%f26,	%i3
	fpadd32	%f12,	%f24,	%f26
	wr	%g0,	0x89,	%asi
	sta	%f20,	[%l7 + 0x28] %asi
	movrgez	%l5,	0x2AF,	%o1
	subcc	%i0,	0x0B02,	%l6
	fnands	%f23,	%f12,	%f30
	udivcc	%i5,	0x0E76,	%g4
	fmovrdgez	%g7,	%f10,	%f6
	fones	%f28
	addc	%l1,	%o7,	%l0
	mulscc	%i4,	%g6,	%g5
	mulx	%g3,	0x1D07,	%g2
	nop
	setx	0x2FBF8379,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f5
	setx	0xC29A861B,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f13
	fdivs	%f13,	%f5,	%f10
	bgu,a	loop_655
	fxnors	%f11,	%f0,	%f3
	fmuld8ulx16	%f18,	%f2,	%f8
	movleu	%xcc,	%l4,	%o4
loop_655:
	or	%g1,	%l3,	%l2
	fmovsleu	%xcc,	%f29,	%f29
	mulscc	%o2,	0x1860,	%o5
	ldx	[%l7 + 0x68],	%o3
	tvs	%xcc,	0x7
	nop
	setx	loop_656,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tvs	%xcc,	0x3
	sdiv	%i2,	0x035E,	%i7
	fornot1s	%f31,	%f13,	%f10
loop_656:
	fabsd	%f12,	%f14
	andcc	%o0,	0x0637,	%o6
	wr	%g0,	0x18,	%asi
	ldda	[%l7 + 0x10] %asi,	%i0
	andn	%i6,	0x06F0,	%l5
	fmovspos	%xcc,	%f7,	%f15
	edge32ln	%o1,	%i3,	%l6
	fmovrdgz	%i5,	%f24,	%f14
	array8	%g4,	%i0,	%l1
	taddcc	%g7,	0x1106,	%o7
	subcc	%i4,	%g6,	%l0
	edge8n	%g5,	%g3,	%g2
	fbg	%fcc3,	loop_657
	sdiv	%l4,	0x0BF0,	%g1
	subc	%o4,	%l2,	%l3
	movrgz	%o2,	0x21E,	%o5
loop_657:
	add	%i2,	%o3,	%i7
	movrlz	%o6,	0x1AE,	%o0
	wr	%g0,	0x17,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
	sub	%i1,	0x1FD3,	%l5
	fmovscs	%xcc,	%f1,	%f8
	nop
	setx	loop_658,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	subccc	%i6,	%i3,	%o1
	fbl	%fcc2,	loop_659
	ld	[%l7 + 0x74],	%f15
loop_658:
	tcc	%icc,	0x2
	udivx	%l6,	0x00A7,	%g4
loop_659:
	nop
	add	%l7,	0x58,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%i5
	casxa	[%l6] %asi,	%i5,	%l1
	edge32ln	%i0,	%o7,	%i4
	umulcc	%g7,	%l0,	%g6
	fandnot1	%f16,	%f18,	%f18
	fmovsl	%icc,	%f1,	%f21
	fmovsn	%xcc,	%f6,	%f8
	tvc	%icc,	0x0
	brz	%g3,	loop_660
	nop
	setx	0x200D7E30206753E1,	%l0,	%l6
	stx	%l6,	[%l7 + 0x38]
	ldx	[%l7 + 0x38],	%fsr
	set	0x18, %g5
	ldxa	[%g0 + %g5] 0x58,	%g5
loop_660:
	sdivcc	%g2,	0x1222,	%l4
	tneg	%xcc,	0x4
	fands	%f15,	%f31,	%f0
	movcs	%xcc,	%g1,	%o4
	taddcc	%l2,	%l3,	%o5
	tvc	%xcc,	0x2
	wr	%g0,	0x18,	%asi
	swapa	[%l7 + 0x54] %asi,	%o2
	sllx	%o3,	%i7,	%o6
	edge8ln	%i2,	%i1,	%l5
	fmul8x16	%f22,	%f30,	%f28
	umulcc	%i6,	0x1152,	%i3
	bpos	%icc,	loop_661
	tne	%icc,	0x5
	sth	%o0,	[%l7 + 0x4C]
	taddcctv	%o1,	%g4,	%l6
loop_661:
	orn	%l1,	%i0,	%o7
	sra	%i5,	0x1B,	%g7
	movleu	%icc,	%l0,	%i4
	fbg,a	%fcc2,	loop_662
	subcc	%g3,	0x0C28,	%g6
	fpadd32	%f8,	%f18,	%f8
	nop
	setx	0x9FB564344045ED36,	%l0,	%l6
	stx	%l6,	[%l7 + 0x78]
	ldx	[%l7 + 0x78],	%fsr
loop_662:
	nop
	fitos	%f13,	%f0
	fstod	%f0,	%f8
	taddcc	%g5,	0x14BC,	%g2
	udivx	%l4,	0x1E72,	%g1
	fble,a	%fcc1,	loop_663
	movn	%xcc,	%o4,	%l3
	nop
	setx	0xFECB2855,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f29
	setx	0x2A1B5B86,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f14
	fdivs	%f14,	%f29,	%f15
	fbue	%fcc3,	loop_664
loop_663:
	tgu	%icc,	0x7
	umulcc	%l2,	%o5,	%o3
	fnands	%f19,	%f24,	%f3
loop_664:
	ta	%icc,	0x4
	fzeros	%f14
	fmovrde	%o2,	%f14,	%f30
	fpmerge	%f30,	%f27,	%f16
	subc	%o6,	%i7,	%i2
	fnors	%f22,	%f13,	%f22
	udiv	%i1,	0x1D37,	%l5
	brz,a	%i3,	loop_665
	edge32ln	%o0,	%o1,	%g4
	fbu,a	%fcc1,	loop_666
	fnands	%f12,	%f8,	%f7
loop_665:
	ba,pt	%icc,	loop_667
	edge8	%l6,	%i6,	%l1
loop_666:
	fbule	%fcc0,	loop_668
	fbu	%fcc0,	loop_669
loop_667:
	nop
	setx	0x804E3355,	%l0,	%l6
	st	%l6,	[%l7 + 0x1C]
	ld	[%l7 + 0x1C],	%fsr
	nop
	setx	0x033C6807,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f18
	setx	0xBB391298,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f5
	fadds	%f5,	%f18,	%f22
loop_668:
	fpsub16s	%f8,	%f23,	%f19
loop_669:
	smulcc	%i0,	%o7,	%g7
	andcc	%l0,	%i5,	%i4
	ldsh	[%l7 + 0x14],	%g6
	tge	%xcc,	0x1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sllx	%g3,	%g5,	%l4
	tsubcctv	%g2,	%o4,	%g1
	array8	%l3,	%o5,	%l2
	fbug	%fcc0,	loop_670
	movl	%icc,	%o3,	%o6
	orcc	%i7,	%o2,	%i1
	brlez	%l5,	loop_671
loop_670:
	andn	%i2,	0x1FC3,	%o0
	sub	%i3,	%g4,	%o1
	bl	%xcc,	loop_672
loop_671:
	addc	%l6,	%l1,	%i6
	fmovdpos	%icc,	%f13,	%f31
	alignaddr	%i0,	%o7,	%l0
loop_672:
	fornot1	%f22,	%f30,	%f4
	fsrc2s	%f2,	%f6
	tne	%icc,	0x6
	fbo	%fcc0,	loop_673
	edge16	%g7,	%i5,	%i4
	bvc,a	%icc,	loop_674
	mulx	%g3,	0x0CCE,	%g5
loop_673:
	tcc	%xcc,	0x1
	movg	%icc,	%g6,	%g2
loop_674:
	tleu	%icc,	0x7
	sll	%o4,	%g1,	%l3
	udiv	%o5,	0x1B44,	%l2
	srlx	%l4,	0x11,	%o3
	movl	%icc,	%o6,	%o2
	array16	%i7,	%l5,	%i1
	fornot1	%f20,	%f22,	%f8
	sub	%i2,	0x06B8,	%i3
	mova	%icc,	%g4,	%o0
	sra	%l6,	0x09,	%o1
	edge16n	%l1,	%i6,	%o7
	movcc	%xcc,	%i0,	%g7
	swap	[%l7 + 0x5C],	%i5
	fbuge,a	%fcc0,	loop_675
	fmovsge	%xcc,	%f8,	%f26
	fmovdg	%icc,	%f19,	%f13
	ble,pt	%icc,	loop_676
loop_675:
	fbul,a	%fcc2,	loop_677
	sir	0x0EA9
	edge32	%l0,	%g3,	%g5
loop_676:
	or	%g6,	0x023F,	%i4
loop_677:
	sir	0x02BA
	taddcctv	%g2,	%g1,	%o4
	fmovsne	%icc,	%f8,	%f18
	bneg,a,pn	%icc,	loop_678
	brgz	%l3,	loop_679
	tvs	%icc,	0x1
	ldx	[%l7 + 0x78],	%l2
loop_678:
	ldsb	[%l7 + 0x7C],	%o5
loop_679:
	stb	%o3,	[%l7 + 0x41]
	srax	%l4,	%o2,	%o6
	taddcctv	%i7,	%i1,	%i2
	set	0x0C, %g2
	sta	%f8,	[%l7 + %g2] 0x14
	popc	0x0180,	%i3
	tg	%icc,	0x2
	nop
	set	0x4B, %i2
	stb	%g4,	[%l7 + %i2]
	orn	%o0,	%l6,	%o1
	te	%icc,	0x3
	movre	%l1,	%i6,	%o7
	fpack32	%f28,	%f20,	%f0
	edge32	%l5,	%i0,	%i5
	orcc	%l0,	%g7,	%g3
	movneg	%xcc,	%g5,	%i4
	te	%xcc,	0x3
	tpos	%icc,	0x3
	fmovrsne	%g2,	%f24,	%f19
	array16	%g6,	%o4,	%l3
	brz	%g1,	loop_680
	fmovdl	%icc,	%f26,	%f5
	fbu,a	%fcc3,	loop_681
	edge16	%o5,	%l2,	%l4
loop_680:
	fandnot2s	%f24,	%f28,	%f5
	taddcc	%o2,	0x0B2E,	%o3
loop_681:
	fbn,a	%fcc0,	loop_682
	brgz	%i7,	loop_683
	fnot1	%f12,	%f0
	edge32n	%o6,	%i1,	%i3
loop_682:
	andn	%i2,	0x09DF,	%g4
loop_683:
	edge32n	%l6,	%o1,	%l1
	wr	%g0,	0x19,	%asi
	ldsba	[%l7 + 0x4C] %asi,	%o0
	srax	%o7,	0x18,	%i6
	array32	%i0,	%l5,	%l0
	nop
	fitod	%f10,	%f16
	fdtox	%f16,	%f28
	fxtod	%f28,	%f28
	srax	%i5,	%g3,	%g5
	smul	%i4,	0x045D,	%g2
	andncc	%g6,	%g7,	%l3
	sra	%g1,	%o4,	%l2
	fmovrdlez	%o5,	%f18,	%f28
	fmovsl	%xcc,	%f25,	%f1
	fba	%fcc1,	loop_684
	fmovscc	%icc,	%f28,	%f26
	xnor	%o2,	0x0A6E,	%o3
	bpos,pt	%xcc,	loop_685
loop_684:
	fcmpeq16	%f18,	%f8,	%l4
	fnot2s	%f29,	%f0
	tsubcctv	%o6,	0x0DD6,	%i7
loop_685:
	sll	%i1,	0x1D,	%i3
	fmovdge	%icc,	%f8,	%f17
	andcc	%i2,	0x09A9,	%g4
	fble,a	%fcc2,	loop_686
	subccc	%l6,	%o1,	%l1
	sra	%o7,	%o0,	%i0
	smulcc	%i6,	%l0,	%i5
loop_686:
	fpadd16	%f8,	%f24,	%f6
	bpos,pt	%icc,	loop_687
	tpos	%xcc,	0x7
	edge16	%l5,	%g5,	%i4
	edge16	%g2,	%g3,	%g7
loop_687:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbge,a	%fcc0,	loop_688
	mova	%xcc,	%g6,	%l3
	xnorcc	%o4,	0x090C,	%l2
	udiv	%g1,	0x173D,	%o2
loop_688:
	movpos	%xcc,	%o5,	%o3
	stbar
	movcc	%icc,	%o6,	%l4
	tsubcctv	%i1,	%i3,	%i2
	movvc	%xcc,	%i7,	%l6
	movleu	%xcc,	%g4,	%l1
	tsubcctv	%o1,	0x09BD,	%o0
	brz	%o7,	loop_689
	array32	%i6,	%l0,	%i5
	fmovdvs	%xcc,	%f10,	%f22
	bne,a	loop_690
loop_689:
	array8	%l5,	%i0,	%i4
	movrlez	%g5,	0x32F,	%g2
	fornot2s	%f19,	%f5,	%f10
loop_690:
	fbu	%fcc0,	loop_691
	edge16	%g7,	%g6,	%g3
	fmovsl	%icc,	%f5,	%f21
	faligndata	%f18,	%f14,	%f26
loop_691:
	movn	%xcc,	%o4,	%l3
	wr	%g0,	0x81,	%asi
	lduha	[%l7 + 0x42] %asi,	%g1
	edge32l	%o2,	%l2,	%o5
	prefetch	[%l7 + 0x14],	 0x1
	fpadd32s	%f13,	%f26,	%f4
	be,a,pt	%icc,	loop_692
	bvs,pn	%icc,	loop_693
	tsubcc	%o3,	%o6,	%i1
	orn	%i3,	%i2,	%i7
loop_692:
	ldd	[%l7 + 0x38],	%l4
loop_693:
	movre	%g4,	0x204,	%l1
	ldx	[%l7 + 0x68],	%o1
	orcc	%l6,	%o7,	%i6
	ldsw	[%l7 + 0x74],	%l0
	edge32n	%i5,	%o0,	%i0
	tcc	%xcc,	0x3
	fpmerge	%f20,	%f27,	%f0
	prefetch	[%l7 + 0x18],	 0x1
	movneg	%xcc,	%i4,	%g5
	fbe,a	%fcc0,	loop_694
	edge8	%l5,	%g7,	%g2
	fmovdleu	%icc,	%f1,	%f25
	andncc	%g6,	%o4,	%l3
loop_694:
	fornot1	%f2,	%f30,	%f2
	movcs	%xcc,	%g1,	%g3
	brlz,a	%o2,	loop_695
	fsrc2	%f16,	%f12
	sethi	0x093C,	%l2
	st	%f18,	[%l7 + 0x70]
loop_695:
	fmovrdgez	%o5,	%f20,	%f6
	tneg	%icc,	0x4
	sir	0x123E
	fmovsgu	%xcc,	%f27,	%f30
	fmovsgu	%xcc,	%f10,	%f22
	edge32ln	%o3,	%i1,	%i3
	movneg	%icc,	%i2,	%o6
	edge32ln	%i7,	%l4,	%l1
	and	%g4,	%l6,	%o7
	sdivx	%i6,	0x02B4,	%o1
	fmovrslz	%i5,	%f11,	%f3
	tn	%xcc,	0x4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tleu	%xcc,	0x2
	orcc	%o0,	%l0,	%i0
	ldx	[%l7 + 0x28],	%g5
	xor	%l5,	%g7,	%g2
	movgu	%xcc,	%g6,	%i4
	tgu	%icc,	0x4
	fmovdvs	%icc,	%f10,	%f20
	fmovrdgz	%l3,	%f14,	%f8
	fpsub16	%f30,	%f4,	%f22
	fxnors	%f18,	%f30,	%f27
	movle	%xcc,	%o4,	%g3
	fsrc2s	%f1,	%f2
	call	loop_696
	bg	%icc,	loop_697
	fbug,a	%fcc2,	loop_698
	movneg	%xcc,	%o2,	%g1
loop_696:
	movvc	%icc,	%l2,	%o5
loop_697:
	nop
	set	0x78, %i5
	lduha	[%l7 + %i5] 0x04,	%i1
loop_698:
	fmovdleu	%icc,	%f15,	%f0
	nop
	set	0x60, %l3
	ldd	[%l7 + %l3],	%f24
	sub	%i3,	0x0D68,	%i2
	sll	%o6,	0x0F,	%i7
	edge16n	%l4,	%o3,	%l1
	prefetch	[%l7 + 0x20],	 0x3
	tleu	%icc,	0x5
	fnors	%f3,	%f21,	%f15
	movge	%icc,	%g4,	%l6
	fmovsge	%xcc,	%f25,	%f28
	movle	%xcc,	%o7,	%i6
	call	loop_699
	fmovscs	%xcc,	%f19,	%f4
	wr	%g0,	0x89,	%asi
	lduwa	[%l7 + 0x54] %asi,	%i5
loop_699:
	brz,a	%o1,	loop_700
	sir	0x1430
	ta	%icc,	0x4
	array16	%o0,	%i0,	%l0
loop_700:
	fbn	%fcc0,	loop_701
	movcc	%icc,	%g5,	%l5
	mova	%icc,	%g7,	%g6
	nop
	fitod	%f6,	%f2
	fdtox	%f2,	%f12
loop_701:
	edge16	%i4,	%g2,	%o4
	brlz,a	%g3,	loop_702
	fcmpne16	%f16,	%f28,	%o2
	sra	%l3,	%l2,	%g1
	membar	#Sync
	set	0x40, %o6
	ldda	[%l7 + %o6] 0xf8,	%f0
loop_702:
	fbge	%fcc3,	loop_703
	array16	%o5,	%i3,	%i2
	nop
	setx	0x19374E069A3A90FD,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0x5B30640D6B0BBABB,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	fmuld	%f14,	%f2,	%f8
	movpos	%icc,	%i1,	%i7
loop_703:
	fmovdvs	%xcc,	%f16,	%f11
	xnorcc	%l4,	%o6,	%l1
	movpos	%xcc,	%o3,	%l6
	tne	%xcc,	0x3
	smulcc	%o7,	0x0BCE,	%g4
	edge32l	%i6,	%o1,	%o0
	move	%xcc,	%i0,	%i5
	movle	%xcc,	%g5,	%l5
	sdivcc	%l0,	0x0EF9,	%g7
	sir	0x02C8
	fand	%f0,	%f18,	%f22
	set	0x1C, %l1
	stwa	%i4,	[%l7 + %l1] 0x2a
	membar	#Sync
	subc	%g6,	0x1850,	%o4
	fxnors	%f0,	%f28,	%f24
	wr	%g0,	0x89,	%asi
	stxa	%g3,	[%l7 + 0x60] %asi
	wr	%g0,	0x80,	%asi
	lda	[%l7 + 0x28] %asi,	%f31
	movle	%xcc,	%o2,	%l3
	tg	%icc,	0x5
	and	%l2,	0x135E,	%g1
	ldsw	[%l7 + 0x50],	%g2
	fbn,a	%fcc3,	loop_704
	umul	%i3,	0x1184,	%i2
	srlx	%o5,	%i1,	%i7
	lduh	[%l7 + 0x0C],	%o6
loop_704:
	movg	%xcc,	%l4,	%l1
	sra	%o3,	%o7,	%g4
	nop
	setx	loop_705,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	taddcctv	%i6,	0x022D,	%l6
	edge16n	%o1,	%i0,	%i5
	fmovrdlz	%g5,	%f14,	%f24
loop_705:
	bneg,a	%icc,	loop_706
	fsrc2s	%f7,	%f7
	set	0x50, %i1
	stxa	%o0,	[%l7 + %i1] 0x81
loop_706:
	edge32n	%l0,	%l5,	%i4
	ta	%icc,	0x4
	ldub	[%l7 + 0x58],	%g7
	pdist	%f18,	%f4,	%f26
	fbg,a	%fcc1,	loop_707
	sir	0x0B18
	stbar
	smul	%o4,	0x0DE0,	%g3
loop_707:
	umulcc	%g6,	%o2,	%l2
	sub	%l3,	%g2,	%i3
	sllx	%g1,	0x15,	%o5
	tg	%xcc,	0x0
	nop
	setx	loop_708,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fornot2	%f6,	%f30,	%f18
	wr	%g0,	0x80,	%asi
	stba	%i2,	[%l7 + 0x43] %asi
loop_708:
	edge16l	%i1,	%i7,	%l4
	wr	%g0,	0x80,	%asi
	lduba	[%l7 + 0x1F] %asi,	%l1
	ldub	[%l7 + 0x51],	%o6
	fmovsleu	%xcc,	%f0,	%f25
	smulcc	%o3,	0x0881,	%g4
	alignaddrl	%o7,	%l6,	%o1
	movcc	%xcc,	%i6,	%i5
	or	%i0,	0x1E71,	%o0
	nop
	setx	0xB3ACE3AE,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f3
	setx	0xB2706A82,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f23
	fsubs	%f23,	%f3,	%f0
	lduw	[%l7 + 0x10],	%l0
	orncc	%g5,	0x0289,	%l5
	fandnot2s	%f8,	%f9,	%f8
	fcmpne16	%f28,	%f24,	%g7
	orcc	%o4,	%g3,	%i4
	edge16	%o2,	%g6,	%l3
	movn	%xcc,	%l2,	%g2
	movrlz	%i3,	%o5,	%g1
	movrlez	%i1,	%i2,	%i7
	tg	%icc,	0x0
	wr	%g0,	0xea,	%asi
	stha	%l1,	[%l7 + 0x28] %asi
	membar	#Sync
	subcc	%o6,	0x1D4A,	%l4
	array32	%g4,	%o3,	%l6
	movg	%icc,	%o1,	%i6
	tpos	%xcc,	0x1
	movne	%xcc,	%o7,	%i5
	movge	%icc,	%o0,	%i0
	movrlz	%g5,	0x27F,	%l5
	tvs	%icc,	0x6
	tne	%xcc,	0x7
	tg	%icc,	0x2
	call	loop_709
	andcc	%g7,	0x1125,	%o4
	bleu,pn	%xcc,	loop_710
	nop
	setx	0xB054ECD0,	%l0,	%l6
	st	%l6,	[%l7 + 0x34]
	ld	[%l7 + 0x34],	%fsr
loop_709:
	tsubcc	%g3,	%i4,	%o2
	andncc	%l0,	%g6,	%l3
loop_710:
	nop
	setx loop_711, %l0, %l1
	jmpl %l1, %g2
	movrlz	%i3,	%l2,	%o5
	udivx	%i1,	0x0308,	%i2
	sth	%i7,	[%l7 + 0x58]
loop_711:
	movrlez	%g1,	0x11F,	%l1
	orn	%l4,	0x0893,	%o6
	ldsw	[%l7 + 0x54],	%g4
	wr	%g0,	0x2a,	%asi
	stwa	%l6,	[%l7 + 0x50] %asi
	membar	#Sync
	edge32n	%o1,	%o3,	%o7
	andcc	%i5,	0x0011,	%i6
	fmovdn	%icc,	%f12,	%f30
	movg	%xcc,	%i0,	%g5
	andcc	%o0,	%l5,	%o4
	array32	%g7,	%i4,	%g3
	smulcc	%l0,	0x0148,	%g6
	tcc	%xcc,	0x4
	fbug,a	%fcc0,	loop_712
	smulcc	%o2,	%g2,	%l3
	edge32	%l2,	%o5,	%i1
	wr	%g0,	0x0c,	%asi
	swapa	[%l7 + 0x0C] %asi,	%i3
loop_712:
	movrlz	%i7,	0x0D8,	%g1
	fmovspos	%icc,	%f6,	%f16
	movg	%xcc,	%i2,	%l4
	taddcctv	%o6,	%g4,	%l1
	fmovspos	%xcc,	%f12,	%f10
	udivx	%o1,	0x0387,	%o3
	nop
	setx	0xB357D051E04FFADD,	%l0,	%l6
	stx	%l6,	[%l7 + 0x50]
	ldx	[%l7 + 0x50],	%fsr
	movvc	%icc,	%o7,	%i5
	movl	%xcc,	%i6,	%l6
	stx	%i0,	[%l7 + 0x48]
	fcmpeq32	%f28,	%f2,	%g5
	srax	%l5,	%o4,	%o0
	edge32n	%g7,	%i4,	%g3
	movvs	%icc,	%g6,	%o2
	wr	%g0,	0x0c,	%asi
	lduha	[%l7 + 0x76] %asi,	%l0
	andcc	%g2,	0x0F13,	%l3
	nop
	fitod	%f12,	%f16
	fdtos	%f16,	%f30
	move	%icc,	%o5,	%i1
	nop
	setx	0x00762053,	%l0,	%l6
	st	%l6,	[%l7 + 0x2C]
	ld	[%l7 + 0x2C],	%fsr
	fabsd	%f20,	%f28
	fones	%f21
	brgez,a	%i3,	loop_713
	nop
	setx	0x0EF19C9D,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f1
	fsqrts	%f1,	%f9
	fabsd	%f0,	%f4
	sir	0x1669
loop_713:
	tvc	%xcc,	0x5
	stbar
	sdivcc	%i7,	0x1588,	%g1
	orn	%l2,	0x0964,	%i2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array16	%o6,	%l4,	%l1
	fmovsgu	%xcc,	%f28,	%f19
	edge8l	%g4,	%o1,	%o7
	edge8l	%i5,	%i6,	%l6
	edge16n	%o3,	%i0,	%l5
	alignaddr	%o4,	%g5,	%o0
	movg	%xcc,	%i4,	%g3
	fandnot1	%f2,	%f20,	%f2
	movrgz	%g7,	%g6,	%l0
	tn	%xcc,	0x1
	fbge	%fcc3,	loop_714
	edge8n	%o2,	%g2,	%l3
	wr	%g0,	0x81,	%asi
	stxa	%i1,	[%l7 + 0x58] %asi
loop_714:
	fbu	%fcc2,	loop_715
	movg	%xcc,	%i3,	%o5
	fbuge	%fcc3,	loop_716
	bleu,a	loop_717
loop_715:
	tleu	%xcc,	0x4
	fmovrsne	%i7,	%f25,	%f9
loop_716:
	movgu	%icc,	%g1,	%i2
loop_717:
	move	%xcc,	%o6,	%l4
	edge16	%l2,	%l1,	%o1
	fbe,a	%fcc3,	loop_718
	srl	%o7,	0x1B,	%g4
	sdiv	%i5,	0x0078,	%l6
	tle	%icc,	0x4
loop_718:
	fpsub32s	%f26,	%f14,	%f27
	array8	%i6,	%o3,	%l5
	edge8l	%o4,	%i0,	%g5
	edge16ln	%i4,	%o0,	%g7
	movneg	%icc,	%g6,	%g3
	movrne	%o2,	%l0,	%l3
	movneg	%xcc,	%g2,	%i1
	ldd	[%l7 + 0x08],	%f20
	membar	#Sync
	set	0x40, %g4
	ldda	[%l7 + %g4] 0x1e,	%f16
	fmul8sux16	%f14,	%f12,	%f2
	brgez	%i3,	loop_719
	movleu	%xcc,	%i7,	%o5
	sth	%i2,	[%l7 + 0x0A]
	movle	%icc,	%g1,	%o6
loop_719:
	nop
	set	0x28, %l4
	ldxa	[%g0 + %l4] 0x4f,	%l4
	movvs	%icc,	%l2,	%l1
	edge16ln	%o1,	%o7,	%g4
	subc	%i5,	0x0B35,	%i6
	tcs	%icc,	0x5
	tl	%icc,	0x3
	addc	%o3,	%l6,	%o4
	fxnors	%f24,	%f7,	%f16
	ldstub	[%l7 + 0x3B],	%i0
	tgu	%xcc,	0x2
	movge	%xcc,	%l5,	%g5
	andcc	%i4,	%o0,	%g6
	wr	%g0,	0xe2,	%asi
	ldda	[%l7 + 0x40] %asi,	%g2
	udivcc	%g7,	0x1C0D,	%o2
	brnz,a	%l3,	loop_720
	ble,pn	%icc,	loop_721
	fpsub16s	%f27,	%f22,	%f10
	xnor	%g2,	0x058A,	%l0
loop_720:
	fmovdg	%icc,	%f0,	%f8
loop_721:
	bneg,a	loop_722
	fmovrdlz	%i1,	%f24,	%f2
	fmovdn	%icc,	%f17,	%f7
	bvc,a	loop_723
loop_722:
	tvs	%xcc,	0x6
	udivcc	%i7,	0x10BC,	%i3
	andcc	%i2,	0x1AAF,	%g1
loop_723:
	fbge	%fcc2,	loop_724
	fbo,a	%fcc0,	loop_725
	orn	%o6,	%l4,	%o5
	orncc	%l1,	%l2,	%o7
loop_724:
	array16	%g4,	%i5,	%o1
loop_725:
	nop
	setx	0x80597429,	%l0,	%l6
	st	%l6,	[%l7 + 0x7C]
	ld	[%l7 + 0x7C],	%fsr
	tcc	%xcc,	0x7
	fmovrsgez	%o3,	%f20,	%f11
	movrgz	%i6,	%l6,	%i0
	array8	%o4,	%l5,	%g5
	mova	%icc,	%i4,	%g6
	fcmpne16	%f28,	%f4,	%o0
	tvs	%xcc,	0x3
	ta	%icc,	0x6
	membar	0x0F
	fmovdn	%icc,	%f29,	%f0
	movpos	%icc,	%g3,	%o2
	bpos,a,pn	%icc,	loop_726
	andcc	%g7,	%g2,	%l3
	xnorcc	%l0,	%i1,	%i3
	tsubcctv	%i2,	0x1E18,	%g1
loop_726:
	tcc	%icc,	0x4
	fmovdvc	%icc,	%f26,	%f12
	movgu	%icc,	%i7,	%l4
	movrgez	%o6,	0x2AA,	%o5
	sdiv	%l1,	0x1EBB,	%l2
	wr	%g0,	0x80,	%asi
	sta	%f16,	[%l7 + 0x74] %asi
	nop
	fitod	%f13,	%f6
	ld	[%l7 + 0x60],	%f14
	bgu,pt	%icc,	loop_727
	edge8	%o7,	%g4,	%o1
	stb	%i5,	[%l7 + 0x32]
	andncc	%i6,	%l6,	%i0
loop_727:
	nop
	wr	%g0,	0x20,	%asi
	ldxa	[%g0 + 0x10] %asi,	%o4
	tne	%icc,	0x6
	bvc,a,pn	%icc,	loop_728
	srax	%l5,	0x0C,	%g5
	movrlz	%o3,	0x1E0,	%g6
	orcc	%o0,	%g3,	%i4
loop_728:
	bn	%icc,	loop_729
	taddcc	%g7,	0x1EE2,	%g2
	fmul8ulx16	%f30,	%f14,	%f8
	wr	%g0,	0x0c,	%asi
	ldda	[%l7 + 0x20] %asi,	%o2
loop_729:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	brlez,a	%l3,	loop_730
	edge32l	%i1,	%i3,	%i2
	for	%f2,	%f8,	%f2
	udivcc	%l0,	0x073E,	%i7
loop_730:
	sra	%g1,	%l4,	%o5
	edge32n	%o6,	%l2,	%l1
	srax	%g4,	0x06,	%o1
	smulcc	%o7,	0x056E,	%i5
	addcc	%i6,	0x10A1,	%l6
	te	%icc,	0x0
	and	%i0,	%l5,	%g5
	bn,a	%xcc,	loop_731
	sdivcc	%o3,	0x060A,	%g6
	fmovrsgz	%o0,	%f14,	%f6
	popc	0x180B,	%o4
loop_731:
	umul	%i4,	0x1039,	%g3
	addcc	%g7,	%g2,	%l3
	nop
	fitod	%f2,	%f18
	fdtox	%f18,	%f16
	xorcc	%o2,	0x0428,	%i3
	fnegs	%f9,	%f12
	fbule,a	%fcc3,	loop_732
	bl,a,pt	%icc,	loop_733
	umul	%i2,	%i1,	%l0
	ldstub	[%l7 + 0x7C],	%i7
loop_732:
	move	%xcc,	%g1,	%o5
loop_733:
	tsubcc	%l4,	0x1A22,	%o6
	set	0x0C, %o2
	lduba	[%l7 + %o2] 0x19,	%l2
	st	%f10,	[%l7 + 0x68]
	or	%g4,	%o1,	%o7
	fnegs	%f0,	%f11
	fmovdcc	%xcc,	%f20,	%f17
	add	%l7,	0x48,	%l6
	wr	%g0,	0x04,	%asi
	ldxa	[%l6] %asi,	%i5
	casxa	[%l6] 0x04,	%i5,	%l1
	or	%i6,	0x18FA,	%l6
	ta	%xcc,	0x6
	bn,pn	%xcc,	loop_734
	fpsub16s	%f22,	%f16,	%f28
	fblg	%fcc1,	loop_735
	fmovscs	%xcc,	%f7,	%f4
loop_734:
	nop
	set	0x3C, %i0
	ldswa	[%l7 + %i0] 0x19,	%l5
loop_735:
	movn	%xcc,	%i0,	%o3
	tg	%icc,	0x7
	fmovdl	%xcc,	%f11,	%f0
	orncc	%g5,	%o0,	%g6
	fmuld8ulx16	%f10,	%f24,	%f12
	movleu	%icc,	%i4,	%o4
	fbule	%fcc1,	loop_736
	fbe,a	%fcc2,	loop_737
	fmovrdlez	%g3,	%f24,	%f22
	movpos	%xcc,	%g2,	%g7
loop_736:
	bne,a,pt	%icc,	loop_738
loop_737:
	fandnot2	%f22,	%f30,	%f4
	popc	0x1367,	%o2
	taddcc	%i3,	%i2,	%i1
loop_738:
	mova	%xcc,	%l0,	%l3
	popc	%g1,	%i7
	be,a,pt	%xcc,	loop_739
	fbg	%fcc1,	loop_740
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16	%l4,	%o6,	%l2
loop_739:
	mulx	%g4,	0x054B,	%o5
loop_740:
	or	%o7,	%i5,	%o1
	nop
	setx	0x70494C7F,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%fsr
	set	0x73, %g3
	stba	%i6,	[%l7 + %g3] 0x14
	tpos	%icc,	0x7
	udivcc	%l1,	0x0934,	%l5
	udivcc	%i0,	0x1B87,	%l6
	array32	%o3,	%o0,	%g5
	taddcc	%g6,	0x1ACE,	%i4
	addcc	%g3,	0x1706,	%o4
	fmovdneg	%xcc,	%f9,	%f11
	add	%l7,	0x08,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%g2
	casxa	[%l6] 0x80,	%g2,	%g7
	movrne	%i3,	%i2,	%i1
	smul	%l0,	%l3,	%o2
	sdivx	%g1,	0x1A0D,	%i7
	nop
	setx	loop_741,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	ldub	[%l7 + 0x44],	%l4
	prefetch	[%l7 + 0x0C],	 0x1
	movrlez	%o6,	0x152,	%g4
loop_741:
	movgu	%xcc,	%l2,	%o5
	tcs	%xcc,	0x5
	fba,a	%fcc1,	loop_742
	fsrc1	%f10,	%f26
	and	%o7,	%i5,	%i6
	wr	%g0,	0x10,	%asi
	swapa	[%l7 + 0x20] %asi,	%o1
loop_742:
	fmovscs	%icc,	%f14,	%f8
	fbne,a	%fcc2,	loop_743
	edge8l	%l5,	%l1,	%l6
	subccc	%o3,	%i0,	%g5
	fba,a	%fcc0,	loop_744
loop_743:
	sll	%g6,	%i4,	%g3
	wr	%g0,	0x89,	%asi
	lduwa	[%l7 + 0x6C] %asi,	%o0
loop_744:
	fbl	%fcc0,	loop_745
	udivcc	%g2,	0x0FC4,	%o4
	movne	%xcc,	%g7,	%i3
	movpos	%xcc,	%i1,	%l0
loop_745:
	sllx	%l3,	0x07,	%o2
	set	0x58, %i7
	prefetcha	[%l7 + %i7] 0x88,	 0x1
	fornot2	%f6,	%f26,	%f8
	bpos,a	%icc,	loop_746
	fmovrde	%i7,	%f28,	%f20
	sllx	%l4,	0x11,	%g1
	set	0x16, %g7
	lduba	[%l7 + %g7] 0x14,	%o6
loop_746:
	fbug,a	%fcc1,	loop_747
	fpsub16s	%f4,	%f23,	%f25
	tsubcc	%g4,	0x0941,	%o5
	edge32n	%o7,	%i5,	%i6
loop_747:
	srlx	%l2,	0x04,	%l5
	fmovdcs	%icc,	%f4,	%f7
	brz,a	%o1,	loop_748
	nop
	setx	0xE6AA7BC183CFB599,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0xB3760C05DB4CE17D,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	fmuld	%f14,	%f14,	%f0
	subccc	%l1,	%o3,	%l6
	movne	%icc,	%i0,	%g6
loop_748:
	movrgez	%g5,	0x2BD,	%g3
	alignaddr	%o0,	%g2,	%i4
	brlez,a	%o4,	loop_749
	fcmpgt16	%f2,	%f30,	%i3
	brz,a	%i1,	loop_750
	umulcc	%l0,	%g7,	%o2
loop_749:
	addccc	%i2,	0x1458,	%l3
	mulscc	%l4,	0x059F,	%g1
loop_750:
	movrlez	%o6,	0x137,	%i7
	wr	%g0,	0x80,	%asi
	ldstuba	[%l7 + 0x72] %asi,	%o5
	fmovdcc	%xcc,	%f8,	%f17
	bpos,pt	%icc,	loop_751
	udiv	%g4,	0x0FB1,	%i5
	nop
	fitos	%f6,	%f15
	fstox	%f15,	%f16
	fxtos	%f16,	%f18
	fxnors	%f22,	%f29,	%f17
loop_751:
	fmovspos	%icc,	%f15,	%f16
	andn	%i6,	%o7,	%l5
	bcs,a	loop_752
	tle	%icc,	0x4
	ldsw	[%l7 + 0x60],	%o1
	fmul8ulx16	%f6,	%f12,	%f18
loop_752:
	ldsw	[%l7 + 0x54],	%l2
	xnorcc	%o3,	0x0434,	%l6
	addccc	%i0,	0x0FE2,	%g6
	edge8l	%g5,	%l1,	%o0
	fcmpgt16	%f8,	%f2,	%g3
	edge32ln	%i4,	%g2,	%i3
	tcs	%xcc,	0x6
	tge	%xcc,	0x3
	fpsub16	%f26,	%f8,	%f28
	movrlez	%o4,	%i1,	%g7
	movvc	%icc,	%o2,	%i2
	nop
	setx	0xDB4528C9F34F703F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	fsqrtd	%f4,	%f20
	taddcc	%l0,	%l4,	%g1
	taddcctv	%l3,	0x1660,	%o6
	tcs	%icc,	0x7
	orcc	%o5,	0x187B,	%i7
	nop
	setx	0x84EFB8AD804D732E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x08]
	ldx	[%l7 + 0x08],	%fsr
	movcs	%xcc,	%g4,	%i6
	fbuge,a	%fcc1,	loop_753
	mova	%icc,	%i5,	%l5
	nop
	setx	loop_754,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	ldd	[%l7 + 0x08],	%o6
loop_753:
	sdivcc	%o1,	0x0CDC,	%l2
	xnorcc	%o3,	%i0,	%l6
loop_754:
	subcc	%g5,	%l1,	%g6
	nop
	setx	0x5663B385806AD6AA,	%l0,	%l6
	stx	%l6,	[%l7 + 0x08]
	ldx	[%l7 + 0x08],	%fsr
	fba,a	%fcc1,	loop_755
	andncc	%g3,	%i4,	%o0
	orcc	%i3,	0x1C21,	%g2
	fbo	%fcc0,	loop_756
loop_755:
	fbge,a	%fcc0,	loop_757
	edge32l	%o4,	%g7,	%i1
	movvc	%icc,	%i2,	%l0
loop_756:
	nop
	set	0x71, %o1
	stba	%l4,	[%l7 + %o1] 0x88
loop_757:
	movvs	%xcc,	%g1,	%l3
	fpadd16	%f18,	%f6,	%f28
	movvc	%xcc,	%o6,	%o5
	fcmpgt16	%f12,	%f30,	%i7
	movcc	%xcc,	%o2,	%g4
	fabss	%f3,	%f26
	udivcc	%i6,	0x13C3,	%l5
	ba	loop_758
	bvs,a	%xcc,	loop_759
	edge16	%i5,	%o1,	%l2
	edge32ln	%o3,	%i0,	%o7
loop_758:
	movg	%xcc,	%l6,	%l1
loop_759:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddr	%g5,	%g3,	%i4
	udivcc	%o0,	0x0765,	%g6
	nop
	setx	0x3C841AB19074BA99,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0xBF0593932AC5810D,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	fsubd	%f12,	%f26,	%f14
	fors	%f0,	%f22,	%f3
	movrlz	%i3,	%o4,	%g7
	subcc	%i1,	%i2,	%g2
	set	0x3A, %l6
	lduba	[%l7 + %l6] 0x81,	%l0
	edge16	%g1,	%l4,	%l3
	membar	0x15
	srax	%o6,	0x05,	%o5
	fcmpgt16	%f24,	%f4,	%o2
	fand	%f4,	%f28,	%f20
	brgez,a	%g4,	loop_760
	subc	%i7,	%l5,	%i5
	edge32l	%i6,	%o1,	%o3
	fbge,a	%fcc0,	loop_761
loop_760:
	sub	%i0,	0x1C77,	%o7
	membar	#Sync
	wr	%g0,	0x1e,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
loop_761:
	movpos	%icc,	%l2,	%l6
	wr	%g0,	0x80,	%asi
	ldswa	[%l7 + 0x10] %asi,	%g5
	udivx	%l1,	0x0950,	%g3
	fmovrdlz	%i4,	%f10,	%f18
	tl	%icc,	0x3
	bneg,a,pn	%icc,	loop_762
	movpos	%xcc,	%o0,	%g6
	move	%icc,	%i3,	%g7
	xor	%o4,	%i2,	%i1
loop_762:
	std	%f6,	[%l7 + 0x70]
	nop
	set	0x48, %o7
	std	%f0,	[%l7 + %o7]
	move	%xcc,	%g2,	%g1
	umulcc	%l4,	0x0128,	%l0
	popc	%o6,	%o5
	orncc	%o2,	%l3,	%g4
	fmovsvc	%icc,	%f13,	%f12
	ldd	[%l7 + 0x10],	%i6
	tpos	%icc,	0x5
	xnor	%l5,	0x0460,	%i6
	tcc	%icc,	0x1
	movrgz	%i5,	0x246,	%o3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subcc	%i0,	%o7,	%o1
	bge,pn	%icc,	loop_763
	fandnot2	%f30,	%f18,	%f2
	wr	%g0,	0x11,	%asi
	sta	%f5,	[%l7 + 0x48] %asi
loop_763:
	fmuld8ulx16	%f22,	%f31,	%f24
	movpos	%icc,	%l6,	%g5
	fmovsa	%icc,	%f15,	%f21
	orn	%l1,	%l2,	%i4
	fmovdge	%icc,	%f20,	%f19
	edge16l	%o0,	%g6,	%i3
	bcs,a,pn	%icc,	loop_764
	taddcc	%g3,	%o4,	%i2
	srax	%g7,	%i1,	%g2
	tle	%icc,	0x1
loop_764:
	orn	%l4,	0x1381,	%g1
	xorcc	%l0,	%o5,	%o2
	ldub	[%l7 + 0x0E],	%l3
	wr	%g0,	0x04,	%asi
	lduba	[%l7 + 0x23] %asi,	%g4
	tneg	%icc,	0x7
	and	%o6,	%i7,	%i6
	fpsub16s	%f28,	%f24,	%f0
	stx	%l5,	[%l7 + 0x08]
	tpos	%icc,	0x6
	bl,a	loop_765
	tn	%icc,	0x6
	tsubcctv	%o3,	0x1753,	%i5
	fmovdg	%xcc,	%f16,	%f8
loop_765:
	tg	%xcc,	0x1
	tle	%xcc,	0x6
	nop
	setx	loop_766,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	andncc	%i0,	%o1,	%o7
	movn	%icc,	%l6,	%l1
	fcmpgt16	%f2,	%f26,	%l2
loop_766:
	array16	%i4,	%o0,	%g5
	movvc	%xcc,	%g6,	%g3
	edge16	%i3,	%i2,	%g7
	tvs	%icc,	0x3
	edge32ln	%o4,	%i1,	%g2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbg	%fcc0,	loop_767
	alignaddr	%g1,	%l4,	%o5
	edge16l	%l0,	%o2,	%l3
	nop
	fitos	%f2,	%f26
	fstoi	%f26,	%f2
loop_767:
	umul	%o6,	%g4,	%i6
	umul	%l5,	0x1AE3,	%i7
	udiv	%o3,	0x16B3,	%i5
	addcc	%i0,	%o1,	%l6
	add	%l7,	0x50,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%o7,	%l2
	addc	%l1,	0x12AF,	%i4
	wr	%g0,	0x18,	%asi
	stha	%g5,	[%l7 + 0x7C] %asi
	movrne	%g6,	0x0EF,	%g3
	fbne,a	%fcc0,	loop_768
	udivcc	%o0,	0x0E5A,	%i3
	nop
	setx	loop_769,	%l0,	%l1
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
loop_768:
	fpsub16	%f16,	%f2,	%f0
	nop
	setx	loop_770,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_769:
	movre	%i2,	%g7,	%o4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sub	%g2,	0x0FD2,	%i1
loop_770:
	nop
	set	0x30, %o5
	lduwa	[%l7 + %o5] 0x81,	%g1
	nop
	setx	0xF5AC97D790552E55,	%l0,	%l6
	stx	%l6,	[%l7 + 0x38]
	ldx	[%l7 + 0x38],	%fsr
	ldd	[%l7 + 0x28],	%f14
	tgu	%xcc,	0x4
	xnor	%l4,	%l0,	%o5
	orcc	%o2,	%o6,	%l3
	movneg	%icc,	%i6,	%g4
	tn	%xcc,	0x5
	fmovdge	%xcc,	%f22,	%f13
	sllx	%i7,	%o3,	%l5
	movrlez	%i5,	0x27E,	%o1
	bneg,a,pt	%xcc,	loop_771
	movne	%xcc,	%l6,	%i0
	tcs	%icc,	0x4
	tg	%icc,	0x2
loop_771:
	sllx	%l2,	0x01,	%l1
	tcc	%xcc,	0x4
	xnor	%i4,	0x0E73,	%o7
	movneg	%xcc,	%g5,	%g6
	st	%f3,	[%l7 + 0x1C]
	wr	%g0,	0x88,	%asi
	ldstuba	[%l7 + 0x65] %asi,	%o0
	nop
	fitos	%f11,	%f12
	fstod	%f12,	%f20
	edge8n	%i3,	%i2,	%g3
	fsrc2	%f16,	%f22
	mova	%xcc,	%o4,	%g7
	umul	%g2,	0x1E73,	%g1
	alignaddrl	%i1,	%l0,	%o5
	udivcc	%l4,	0x17A7,	%o2
	tsubcctv	%l3,	0x0F87,	%o6
	bl,pn	%xcc,	loop_772
	movneg	%xcc,	%g4,	%i7
	fmul8x16	%f27,	%f14,	%f14
	alignaddrl	%i6,	%l5,	%i5
loop_772:
	fmovsleu	%xcc,	%f15,	%f29
	stb	%o3,	[%l7 + 0x2B]
	bg	%xcc,	loop_773
	fpsub32	%f20,	%f14,	%f0
	array16	%l6,	%i0,	%l2
	tsubcctv	%l1,	0x06AD,	%o1
loop_773:
	srax	%o7,	0x16,	%g5
	nop
	setx	0xF8A38D25,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f0
	fsqrts	%f0,	%f21
	ldstub	[%l7 + 0x7D],	%g6
	srax	%o0,	%i4,	%i3
	lduh	[%l7 + 0x78],	%g3
	fmovspos	%icc,	%f5,	%f4
	wr	%g0,	0x10,	%asi
	ldstuba	[%l7 + 0x13] %asi,	%i2
	edge16	%g7,	%g2,	%o4
	movre	%i1,	%l0,	%g1
	fandnot2s	%f15,	%f16,	%f20
	fbo	%fcc0,	loop_774
	bn,a,pt	%icc,	loop_775
	add	%o5,	0x0D68,	%l4
	tsubcc	%o2,	%o6,	%l3
loop_774:
	movg	%icc,	%g4,	%i7
loop_775:
	alignaddrl	%i6,	%l5,	%i5
	membar	0x50
	movle	%icc,	%o3,	%l6
	andcc	%l2,	0x1106,	%i0
	bcc,a	%icc,	loop_776
	movgu	%xcc,	%l1,	%o1
	addc	%g5,	%o7,	%o0
	andncc	%g6,	%i3,	%g3
loop_776:
	tle	%icc,	0x0
	edge16	%i2,	%i4,	%g7
	addccc	%o4,	0x05F3,	%g2
	fmovrse	%i1,	%f25,	%f25
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x1C] %asi,	%g1
	umul	%o5,	0x0F81,	%l4
	tne	%icc,	0x7
	movgu	%icc,	%o2,	%l0
	subc	%o6,	0x0C37,	%g4
	fmovsge	%xcc,	%f30,	%f28
	set	0x68, %l2
	lda	[%l7 + %l2] 0x80,	%f23
	wr	%g0,	0x11,	%asi
	stwa	%l3,	[%l7 + 0x7C] %asi
	popc	%i7,	%l5
	add	%i5,	0x1B75,	%o3
	wr	%g0,	0x80,	%asi
	ldstuba	[%l7 + 0x2C] %asi,	%l6
	tleu	%icc,	0x0
	movrlz	%l2,	0x188,	%i0
	set	0x4E, %o0
	ldsha	[%l7 + %o0] 0x0c,	%l1
	fnot1	%f14,	%f0
	array32	%i6,	%g5,	%o1
	fmovrde	%o7,	%f2,	%f14
	bvc,a	%xcc,	loop_777
	sdivcc	%g6,	0x07AD,	%o0
	subcc	%g3,	0x1711,	%i2
	fmuld8ulx16	%f16,	%f8,	%f2
loop_777:
	andn	%i4,	0x11F8,	%i3
	wr	%g0,	0x88,	%asi
	lduba	[%l7 + 0x41] %asi,	%o4
	fnand	%f10,	%f2,	%f24
	stb	%g2,	[%l7 + 0x18]
	wr	%g0,	0x81,	%asi
	ldstuba	[%l7 + 0x5F] %asi,	%i1
	addccc	%g7,	0x1D3A,	%o5
	ta	%icc,	0x4
	bcs	%xcc,	loop_778
	sll	%g1,	%o2,	%l4
	ble,a	%xcc,	loop_779
	fpsub16	%f8,	%f30,	%f18
loop_778:
	fpsub16	%f18,	%f12,	%f18
	brlz,a	%o6,	loop_780
loop_779:
	ldsw	[%l7 + 0x5C],	%l0
	movpos	%xcc,	%g4,	%l3
	tleu	%xcc,	0x2
loop_780:
	sub	%l5,	%i5,	%i7
	udivx	%l6,	0x0CEC,	%o3
	movrlz	%l2,	%i0,	%l1
	movvs	%icc,	%i6,	%g5
	movvs	%xcc,	%o1,	%g6
	smul	%o0,	%g3,	%o7
	tvs	%xcc,	0x4
	andncc	%i4,	%i3,	%i2
	bn,a	%icc,	loop_781
	sll	%o4,	%g2,	%i1
	subccc	%g7,	%o5,	%o2
	movg	%xcc,	%g1,	%o6
loop_781:
	ldub	[%l7 + 0x1B],	%l4
	alignaddrl	%l0,	%g4,	%l5
	stbar
	sdivx	%l3,	0x1AE9,	%i7
	sub	%l6,	0x1522,	%o3
	addcc	%l2,	0x0630,	%i0
	stw	%i5,	[%l7 + 0x20]
	ldstub	[%l7 + 0x52],	%i6
	movl	%xcc,	%l1,	%o1
	movcs	%icc,	%g6,	%g5
	bshuffle	%f18,	%f2,	%f10
	tn	%icc,	0x6
	pdist	%f26,	%f18,	%f14
	fxors	%f28,	%f0,	%f30
	umul	%g3,	0x0A9B,	%o7
	movrgz	%o0,	0x09D,	%i3
	wr	%g0,	0x81,	%asi
	lduwa	[%l7 + 0x30] %asi,	%i2
	andn	%i4,	%g2,	%i1
	movrlz	%o4,	%o5,	%g7
	set	0x40, %o3
	stda	%f16,	[%l7 + %o3] 0x14
	fmovdcc	%icc,	%f10,	%f0
	orn	%g1,	%o6,	%o2
	pdist	%f8,	%f30,	%f4
	fand	%f24,	%f6,	%f6
	tn	%icc,	0x5
	bneg,a,pn	%xcc,	loop_782
	movl	%icc,	%l0,	%g4
	movneg	%xcc,	%l4,	%l5
	edge16ln	%i7,	%l3,	%o3
loop_782:
	tpos	%xcc,	0x7
	tvc	%icc,	0x1
	alignaddr	%l2,	%l6,	%i5
	fxor	%f10,	%f8,	%f2
	fpsub16s	%f8,	%f4,	%f29
	te	%icc,	0x0
	xnorcc	%i0,	0x1322,	%l1
	wr	%g0,	0x80,	%asi
	ldswa	[%l7 + 0x60] %asi,	%i6
	umulcc	%o1,	0x0E9F,	%g6
	prefetch	[%l7 + 0x18],	 0x0
	be,a	loop_783
	sub	%g3,	0x06C5,	%g5
	mova	%icc,	%o0,	%i3
	orn	%o7,	%i4,	%i2
loop_783:
	tsubcctv	%i1,	%o4,	%g2
	edge8	%g7,	%g1,	%o6
	edge16n	%o5,	%l0,	%o2
	movrgez	%l4,	0x366,	%g4
	mulx	%i7,	%l3,	%o3
	fxnor	%f12,	%f30,	%f14
	fmovrsgz	%l5,	%f25,	%f7
	add	%l6,	0x051E,	%i5
	tneg	%icc,	0x7
	fcmpgt16	%f2,	%f30,	%i0
	swap	[%l7 + 0x44],	%l1
	fand	%f10,	%f10,	%f20
	fabsd	%f18,	%f0
	edge8l	%l2,	%o1,	%g6
	fmovrsgez	%i6,	%f25,	%f5
	addccc	%g3,	%o0,	%g5
	array32	%o7,	%i3,	%i4
	sllx	%i1,	0x13,	%i2
	subc	%g2,	%g7,	%g1
	tne	%icc,	0x1
	movleu	%icc,	%o6,	%o4
	stw	%l0,	[%l7 + 0x64]
	fmovdn	%icc,	%f6,	%f21
	movrlz	%o5,	0x048,	%l4
	fbl	%fcc3,	loop_784
	movcs	%icc,	%g4,	%i7
	nop
	setx	0xAF64873690704DB1,	%l0,	%l6
	stx	%l6,	[%l7 + 0x68]
	ldx	[%l7 + 0x68],	%fsr
	fcmple16	%f24,	%f6,	%l3
loop_784:
	andn	%o3,	%l5,	%l6
	andncc	%o2,	%i0,	%i5
	bcc,pt	%icc,	loop_785
	nop
	setx	0x0875E8F4,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f14
	setx	0xC8D86237,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f14
	fmuls	%f14,	%f14,	%f18
	tl	%icc,	0x2
	orcc	%l2,	%l1,	%o1
loop_785:
	edge16n	%i6,	%g3,	%g6
	movpos	%xcc,	%o0,	%o7
	set	0x40, %i6
	swapa	[%l7 + %i6] 0x88,	%g5
	tn	%xcc,	0x7
	fbul	%fcc2,	loop_786
	move	%xcc,	%i4,	%i1
	movge	%xcc,	%i2,	%g2
	fpackfix	%f28,	%f15
loop_786:
	tsubcctv	%i3,	%g1,	%o6
	fnand	%f16,	%f28,	%f10
	smul	%g7,	0x180B,	%o4
	alignaddr	%l0,	%l4,	%g4
	orcc	%o5,	0x1DA2,	%l3
	nop
	setx	0xC2EA36B1,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f26
	setx	0xFBA80A44,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f21
	fdivs	%f21,	%f26,	%f16
	fmul8x16au	%f5,	%f19,	%f28
	xor	%i7,	%o3,	%l6
	tleu	%icc,	0x4
	edge32n	%o2,	%i0,	%l5
	set	0x75, %g6
	stba	%i5,	[%l7 + %g6] 0x22
	membar	#Sync
	edge8l	%l2,	%o1,	%i6
	alignaddr	%l1,	%g6,	%o0
	andn	%g3,	0x00BF,	%o7
	lduh	[%l7 + 0x68],	%i4
	pdist	%f12,	%f6,	%f0
	lduw	[%l7 + 0x30],	%g5
	movg	%xcc,	%i2,	%i1
	fmovda	%xcc,	%f24,	%f31
	movcc	%xcc,	%i3,	%g2
	fmovsleu	%xcc,	%f0,	%f6
	wr	%g0,	0x0c,	%asi
	sta	%f29,	[%l7 + 0x2C] %asi
	wr	%g0,	0x11,	%asi
	lda	[%l7 + 0x10] %asi,	%f21
	movpos	%xcc,	%g1,	%o6
	movne	%icc,	%o4,	%g7
	and	%l0,	%g4,	%l4
	popc	%l3,	%i7
	bvc	%icc,	loop_787
	sub	%o5,	0x09DA,	%l6
	bpos	loop_788
	tvs	%xcc,	0x4
loop_787:
	fxor	%f30,	%f24,	%f6
	fnand	%f12,	%f14,	%f30
loop_788:
	edge8ln	%o3,	%i0,	%l5
	alignaddr	%i5,	%o2,	%l2
	movrne	%o1,	0x30D,	%i6
	edge16ln	%g6,	%l1,	%g3
	wr	%g0,	0x81,	%asi
	stwa	%o0,	[%l7 + 0x78] %asi
	nop
	fitod	%f10,	%f14
	fdtox	%f14,	%f26
	wr	%g0,	0x0c,	%asi
	ldsha	[%l7 + 0x2E] %asi,	%i4
	edge16n	%o7,	%g5,	%i1
	fnot1	%f30,	%f16
	fandnot2s	%f20,	%f28,	%f29
	and	%i2,	0x090F,	%i3
	fzeros	%f23
	wr	%g0,	0x2b,	%asi
	stba	%g1,	[%l7 + 0x25] %asi
	membar	#Sync
	tvc	%xcc,	0x0
	fpsub32s	%f2,	%f26,	%f2
	edge8	%g2,	%o4,	%o6
	fxor	%f28,	%f18,	%f26
	brlz	%g7,	loop_789
	sdivcc	%l0,	0x103D,	%l4
	fpmerge	%f3,	%f17,	%f6
	taddcc	%l3,	%i7,	%g4
loop_789:
	bl,pt	%xcc,	loop_790
	xnor	%o5,	0x1B5E,	%o3
	fpsub32	%f28,	%f20,	%f26
	tgu	%xcc,	0x4
loop_790:
	tne	%icc,	0x5
	movrlez	%l6,	0x110,	%i0
	stx	%l5,	[%l7 + 0x18]
	fmuld8ulx16	%f20,	%f25,	%f22
	sllx	%i5,	%o2,	%o1
	set	0x7C, %i4
	ldswa	[%l7 + %i4] 0x04,	%i6
	set	0x22, %l5
	stha	%l2,	[%l7 + %l5] 0x15
	fbe,a	%fcc1,	loop_791
	tvs	%xcc,	0x4
	fbul	%fcc2,	loop_792
	mova	%xcc,	%g6,	%g3
loop_791:
	ldsw	[%l7 + 0x50],	%l1
	fsrc1s	%f17,	%f25
loop_792:
	xnor	%i4,	0x1E73,	%o7
	lduw	[%l7 + 0x3C],	%g5
	ldx	[%l7 + 0x40],	%o0
	mova	%icc,	%i1,	%i3
	tl	%xcc,	0x0
	brlez,a	%i2,	loop_793
	edge32	%g2,	%o4,	%g1
	ldstub	[%l7 + 0x1D],	%o6
	movge	%xcc,	%g7,	%l0
loop_793:
	sethi	0x1BDC,	%l3
	sra	%i7,	0x19,	%l4
	bn,pt	%xcc,	loop_794
	nop
	set	0x38, %i3
	lduw	[%l7 + %i3],	%g4
	edge16n	%o3,	%l6,	%o5
	te	%xcc,	0x1
loop_794:
	movvs	%icc,	%l5,	%i0
	orn	%i5,	%o1,	%i6
	fpadd16	%f0,	%f28,	%f22
	movge	%icc,	%o2,	%l2
	movg	%icc,	%g6,	%l1
	tcc	%xcc,	0x3
	sllx	%g3,	0x03,	%o7
	fpsub16	%f2,	%f22,	%f14
	mulscc	%g5,	0x08C6,	%i4
	fmovsl	%icc,	%f5,	%f6
	edge8	%o0,	%i1,	%i3
	xnor	%i2,	0x163E,	%g2
	tcc	%xcc,	0x0
	ta	%icc,	0x1
	edge16l	%g1,	%o6,	%o4
	fmovsg	%xcc,	%f15,	%f27
	flush	%l7 + 0x28
	ldsh	[%l7 + 0x52],	%g7
	nop
	setx	0xA17440CCB74F86D2,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0xDADB4F2A5D4CDA91,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	fmuld	%f24,	%f22,	%f10
	fnot2s	%f21,	%f4
	sra	%l3,	0x0C,	%l0
	array16	%l4,	%i7,	%g4
	umul	%l6,	%o3,	%l5
	xorcc	%i0,	%i5,	%o5
	fmovsne	%xcc,	%f10,	%f2
	nop
	fitod	%f12,	%f6
	fdtoi	%f6,	%f17
	bl,pt	%xcc,	loop_795
	fmovsvc	%xcc,	%f19,	%f25
	fmovrde	%o1,	%f2,	%f8
	array8	%i6,	%l2,	%o2
loop_795:
	fbuge	%fcc0,	loop_796
	mova	%icc,	%l1,	%g6
	ld	[%l7 + 0x74],	%f15
	movvc	%xcc,	%o7,	%g3
loop_796:
	mova	%xcc,	%i4,	%o0
	wr	%g0,	0x89,	%asi
	sta	%f2,	[%l7 + 0x28] %asi
	movneg	%icc,	%i1,	%i3
	ldsw	[%l7 + 0x4C],	%g5
	xnorcc	%i2,	0x19E1,	%g1
	edge32l	%g2,	%o4,	%o6
	fmovrslz	%g7,	%f13,	%f10
	fcmple16	%f22,	%f0,	%l3
	fpsub16s	%f2,	%f0,	%f13
	movrne	%l4,	%l0,	%i7
	edge32	%l6,	%o3,	%l5
	sdivcc	%i0,	0x0A8C,	%i5
	tvs	%xcc,	0x3
	xor	%o5,	%o1,	%g4
	edge32ln	%l2,	%i6,	%o2
	movle	%xcc,	%l1,	%o7
	udivcc	%g3,	0x0418,	%i4
	fmovdne	%icc,	%f20,	%f27
	stbar
	array8	%g6,	%o0,	%i3
	nop
	fitod	%f10,	%f0
	fdtoi	%f0,	%f24
	fmovsvs	%icc,	%f9,	%f20
	or	%i1,	%g5,	%g1
	alignaddr	%g2,	%i2,	%o4
	movrgez	%o6,	%g7,	%l3
	xorcc	%l4,	%l0,	%l6
	set	0x69, %g1
	ldsba	[%l7 + %g1] 0x19,	%i7
	sllx	%l5,	%o3,	%i5
	movge	%icc,	%o5,	%o1
	fsrc2s	%f6,	%f15
	fone	%f0
	sdivcc	%g4,	0x0B04,	%i0
	movre	%i6,	0x10A,	%l2
	add	%l7,	0x30,	%l6
	wr	%g0,	0x18,	%asi
	casxa	[%l6] 0x18,	%l1,	%o2
	andcc	%g3,	%o7,	%i4
	fmovscs	%xcc,	%f30,	%f27
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	add	%l7,	0x70,	%l6
	wr	%g0,	0x04,	%asi
	ldxa	[%l6] %asi,	%o0
	casxa	[%l6] 0x04,	%o0,	%i3
	fpsub16	%f8,	%f30,	%f16
	fbn,a	%fcc1,	loop_797
	orn	%g6,	0x04DA,	%g5
	wr	%g0,	0x11,	%asi
	stwa	%g1,	[%l7 + 0x64] %asi
loop_797:
	tsubcc	%g2,	0x10F8,	%i2
	fnands	%f17,	%f21,	%f1
	fsrc2s	%f25,	%f26
	addc	%o4,	0x1C63,	%i1
	fbg	%fcc0,	loop_798
	tvs	%xcc,	0x4
	fcmpeq32	%f30,	%f12,	%g7
	subcc	%o6,	%l3,	%l4
loop_798:
	movrgez	%l6,	0x360,	%i7
	udivx	%l5,	0x164B,	%l0
	set	0x70, %l0
	ldxa	[%l7 + %l0] 0x04,	%o3
	tle	%icc,	0x6
	tg	%xcc,	0x6
	faligndata	%f20,	%f2,	%f24
	movpos	%icc,	%o5,	%i5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sth	%g4,	[%l7 + 0x18]
	sub	%i0,	0x15E0,	%i6
	nop
	setx loop_799, %l0, %l1
	jmpl %l1, %o1
	xor	%l1,	0x100E,	%l2
	add	%l7,	0x78,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] %asi,	%g3,	%o2
loop_799:
	fmovdge	%icc,	%f19,	%f28
	fornot2	%f2,	%f12,	%f22
	movg	%xcc,	%i4,	%o0
	taddcctv	%i3,	0x1336,	%g6
	movl	%xcc,	%g5,	%o7
	edge32	%g2,	%i2,	%o4
	tvc	%xcc,	0x2
	sdivx	%i1,	0x0437,	%g1
	taddcc	%o6,	0x1072,	%l3
	edge16n	%g7,	%l6,	%i7
	fsrc1	%f4,	%f0
	tpos	%icc,	0x3
	wr	%g0,	0x1f,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
	tneg	%xcc,	0x2
	nop
	set	0x20, %o4
	ldd	[%l7 + %o4],	%f4
	sir	0x194B
	te	%icc,	0x6
	orn	%l5,	%l4,	%o3
	edge16l	%o5,	%i5,	%l0
	tne	%icc,	0x0
	fcmpgt32	%f26,	%f8,	%g4
	sll	%i6,	%o1,	%l1
	fmuld8sux16	%f28,	%f27,	%f18
	faligndata	%f4,	%f0,	%f12
	fnegd	%f0,	%f22
	fsrc1s	%f10,	%f6
	nop
	fitod	%f4,	%f4
	fdtoi	%f4,	%f19
	udivx	%i0,	0x1795,	%g3
	sdiv	%l2,	0x0551,	%i4
	movrne	%o0,	0x06D,	%o2
	be,pn	%xcc,	loop_800
	addc	%g6,	0x099D,	%i3
	edge8ln	%g5,	%o7,	%g2
	taddcctv	%i2,	0x1FE0,	%o4
loop_800:
	prefetch	[%l7 + 0x28],	 0x2
	umul	%g1,	0x08D1,	%o6
	nop
	fitos	%f11,	%f3
	fstod	%f3,	%f6
	edge32ln	%l3,	%g7,	%l6
	set	0x10, %g2
	stha	%i1,	[%l7 + %g2] 0x2a
	membar	#Sync
	fmovrdgez	%i7,	%f24,	%f10
	taddcctv	%l4,	0x0344,	%o3
	fbne	%fcc3,	loop_801
	ldsh	[%l7 + 0x1E],	%o5
	add	%l7,	0x10,	%l6
	wr	%g0,	0x11,	%asi
	casxa	[%l6] %asi,	%i5,	%l5
loop_801:
	edge16	%g4,	%i6,	%l0
	fba	%fcc2,	loop_802
	subccc	%o1,	%l1,	%g3
	edge16n	%i0,	%i4,	%l2
	sub	%o0,	%o2,	%i3
loop_802:
	edge32l	%g6,	%o7,	%g5
	fmovda	%icc,	%f28,	%f8
	tvs	%icc,	0x7
	udivx	%i2,	0x04A7,	%o4
	fmovs	%f9,	%f12
	smulcc	%g2,	0x06AF,	%o6
	movge	%xcc,	%g1,	%l3
	subcc	%l6,	0x0C5D,	%i1
	fpadd32s	%f2,	%f31,	%f15
	set	0x34, %g5
	lda	[%l7 + %g5] 0x15,	%f27
	fabsd	%f18,	%f16
	movgu	%xcc,	%i7,	%g7
	tcs	%xcc,	0x6
	wr	%g0,	0x89,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	nop
	setx	0x9CE930A6AF21D965,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0xB439E6DCAF935DFB,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	faddd	%f14,	%f6,	%f20
	tg	%xcc,	0x7
	edge32n	%o3,	%o5,	%l4
	movg	%xcc,	%i5,	%l5
	xnorcc	%g4,	0x1FD3,	%l0
	movrgez	%i6,	%l1,	%o1
	brlez,a	%g3,	loop_803
	movrgz	%i0,	0x137,	%i4
	bvs,pt	%xcc,	loop_804
	nop
	fitos	%f5,	%f27
	fstod	%f27,	%f14
loop_803:
	fnot1	%f26,	%f22
	alignaddrl	%o0,	%l2,	%o2
loop_804:
	stw	%g6,	[%l7 + 0x68]
	fmovsne	%icc,	%f28,	%f21
	bg,a,pt	%xcc,	loop_805
	ldx	[%l7 + 0x18],	%o7
	brlz,a	%i3,	loop_806
	fmovsvc	%icc,	%f16,	%f11
loop_805:
	sethi	0x10BA,	%i2
	orcc	%g5,	%g2,	%o4
loop_806:
	fmovda	%icc,	%f27,	%f18
	orn	%o6,	%l3,	%l6
	edge32ln	%g1,	%i1,	%i7
	alignaddr	%g7,	%o5,	%l4
	fbl,a	%fcc0,	loop_807
	movneg	%xcc,	%i5,	%o3
	umulcc	%l5,	%g4,	%l0
	brnz,a	%l1,	loop_808
loop_807:
	movg	%xcc,	%o1,	%g3
	ble,a	%icc,	loop_809
	tcc	%icc,	0x6
loop_808:
	fpack32	%f30,	%f24,	%f10
	fbge,a	%fcc0,	loop_810
loop_809:
	fmovsvc	%icc,	%f18,	%f14
	sir	0x0A4C
	bcs	loop_811
loop_810:
	ldsb	[%l7 + 0x5F],	%i0
	ta	%xcc,	0x5
	andncc	%i4,	%o0,	%l2
loop_811:
	tgu	%xcc,	0x1
	xnor	%i6,	%g6,	%o2
	andncc	%i3,	%o7,	%g5
	subccc	%i2,	%g2,	%o6
	fmovsleu	%xcc,	%f24,	%f20
	fmovsvc	%icc,	%f29,	%f31
	movvs	%icc,	%l3,	%o4
	movrlez	%g1,	0x043,	%i1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xorcc	%i7,	0x0115,	%g7
	be,a	loop_812
	fblg,a	%fcc0,	loop_813
	bne,pn	%xcc,	loop_814
	edge8	%o5,	%l4,	%l6
loop_812:
	movneg	%xcc,	%i5,	%l5
loop_813:
	membar	0x59
loop_814:
	te	%icc,	0x4
	bpos	%icc,	loop_815
	fbug	%fcc2,	loop_816
	bcs,a	loop_817
	nop
	setx	0x0874FF78EF4C6942,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0x09435D32B946F079,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	fmuld	%f14,	%f6,	%f2
loop_815:
	fxnor	%f6,	%f14,	%f14
loop_816:
	mulx	%g4,	%o3,	%l0
loop_817:
	fmovdle	%icc,	%f13,	%f18
	nop
	setx	0x7EB81F45406E6897,	%l0,	%l6
	stx	%l6,	[%l7 + 0x38]
	ldx	[%l7 + 0x38],	%fsr
	fands	%f31,	%f25,	%f10
	tsubcc	%l1,	0x1650,	%o1
	lduh	[%l7 + 0x70],	%g3
	movrlez	%i0,	0x005,	%i4
	fbug	%fcc3,	loop_818
	brlz,a	%o0,	loop_819
	brlz,a	%l2,	loop_820
	fmovdcc	%xcc,	%f10,	%f19
loop_818:
	ldx	[%l7 + 0x48],	%g6
loop_819:
	nop
	fitos	%f3,	%f26
	fstod	%f26,	%f8
loop_820:
	fornot2	%f2,	%f24,	%f4
	fblg,a	%fcc1,	loop_821
	fmovsne	%xcc,	%f13,	%f21
	udivcc	%i6,	0x0F12,	%o2
	ld	[%l7 + 0x5C],	%f13
loop_821:
	fpadd16	%f0,	%f0,	%f24
	tneg	%xcc,	0x5
	fandnot1s	%f18,	%f13,	%f23
	fmovrde	%i3,	%f12,	%f30
	bgu	loop_822
	sll	%g5,	0x04,	%i2
	stx	%o7,	[%l7 + 0x50]
	addccc	%g2,	0x1E6E,	%l3
loop_822:
	fbl,a	%fcc3,	loop_823
	sethi	0x117D,	%o4
	ldsh	[%l7 + 0x20],	%o6
	fcmple16	%f26,	%f16,	%i1
loop_823:
	umul	%g1,	%g7,	%o5
	popc	0x032B,	%l4
	fcmpgt32	%f12,	%f28,	%i7
	mova	%icc,	%l6,	%i5
	fmovrdlz	%g4,	%f22,	%f26
	movcs	%icc,	%o3,	%l5
	lduw	[%l7 + 0x20],	%l1
	tvs	%xcc,	0x7
	umulcc	%o1,	%l0,	%i0
	andn	%i4,	%g3,	%o0
	alignaddrl	%g6,	%i6,	%o2
	ldstub	[%l7 + 0x40],	%i3
	tl	%xcc,	0x5
	alignaddr	%g5,	%l2,	%o7
	fmul8x16au	%f9,	%f17,	%f24
	sdivx	%i2,	0x0268,	%l3
	tn	%xcc,	0x4
	fbn	%fcc1,	loop_824
	umulcc	%o4,	0x0351,	%g2
	fmovdcc	%icc,	%f9,	%f20
	edge16	%i1,	%o6,	%g1
loop_824:
	sllx	%g7,	%o5,	%i7
	bgu,pn	%icc,	loop_825
	orncc	%l4,	%i5,	%g4
	tpos	%xcc,	0x6
	fbule	%fcc2,	loop_826
loop_825:
	fpsub32	%f20,	%f12,	%f4
	andcc	%o3,	0x0D63,	%l6
	addc	%l1,	0x132A,	%o1
loop_826:
	edge8n	%l0,	%i0,	%l5
	movgu	%icc,	%i4,	%g3
	xor	%g6,	0x0B09,	%o0
	bne,a	loop_827
	tn	%xcc,	0x2
	srlx	%o2,	%i6,	%i3
	bgu,a	loop_828
loop_827:
	movvs	%xcc,	%l2,	%g5
	bn	loop_829
	addc	%i2,	0x16FB,	%l3
loop_828:
	brlz	%o4,	loop_830
	movn	%xcc,	%o7,	%i1
loop_829:
	ta	%icc,	0x2
	set	0x40, %i5
	ldda	[%l7 + %i5] 0x81,	%f16
loop_830:
	fmovse	%xcc,	%f14,	%f28
	andn	%g2,	0x067B,	%g1
	fmovrsgz	%g7,	%f28,	%f16
	orcc	%o6,	%i7,	%l4
	movcc	%xcc,	%o5,	%i5
	sra	%o3,	0x17,	%g4
	sub	%l6,	0x088B,	%l1
	fnands	%f5,	%f26,	%f22
	sdiv	%l0,	0x19B8,	%o1
	fmul8ulx16	%f20,	%f14,	%f12
	fblg	%fcc2,	loop_831
	sdivx	%l5,	0x13FD,	%i0
	umulcc	%g3,	0x19F9,	%g6
	edge8l	%i4,	%o0,	%o2
loop_831:
	edge16ln	%i3,	%i6,	%l2
	edge32n	%i2,	%l3,	%o4
	fandnot1	%f24,	%f28,	%f6
	popc	%g5,	%o7
	add	%l7,	0x6C,	%l6
	wr	%g0,	0x19,	%asi
	lda	[%l6] %asi,	%g2
	casa	[%l6] 0x19,	%g2,	%i1
	xnorcc	%g1,	%g7,	%i7
	tle	%xcc,	0x6
	fandnot1s	%f20,	%f5,	%f15
	smul	%l4,	0x080C,	%o6
	tvs	%xcc,	0x1
	movl	%xcc,	%o5,	%i5
	orcc	%o3,	%l6,	%l1
	nop
	setx loop_832, %l0, %l1
	jmpl %l1, %l0
	fbu,a	%fcc2,	loop_833
	edge32l	%o1,	%l5,	%g4
	brnz,a	%i0,	loop_834
loop_832:
	xor	%g6,	%i4,	%o0
loop_833:
	movpos	%xcc,	%g3,	%o2
	set	0x10, %l3
	sta	%f29,	[%l7 + %l3] 0x04
loop_834:
	fnands	%f10,	%f3,	%f8
	nop
	setx	0x807CFFAE,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f6
	setx	0x924D9AB1,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f26
	fmuls	%f26,	%f6,	%f29
	movcc	%xcc,	%i3,	%i6
	or	%l2,	%l3,	%o4
	udivcc	%i2,	0x163D,	%o7
	membar	#Sync
	wr	%g0,	0xf9,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	smulcc	%g2,	%g5,	%i1
	umulcc	%g7,	0x1B85,	%g1
	alignaddrl	%i7,	%o6,	%l4
	subc	%o5,	0x1055,	%i5
	te	%icc,	0x6
	sub	%o3,	%l1,	%l6
	xor	%l0,	0x0C5B,	%o1
	movne	%xcc,	%g4,	%i0
	tgu	%xcc,	0x5
	movn	%icc,	%l5,	%g6
	xnorcc	%i4,	0x1AEB,	%o0
	fcmpgt32	%f26,	%f20,	%o2
	wr	%g0,	0x04,	%asi
	ldstuba	[%l7 + 0x4E] %asi,	%i3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsgu	%icc,	%f10,	%f18
	fornot2	%f12,	%f14,	%f20
	wr	%g0,	0x89,	%asi
	ldxa	[%l7 + 0x40] %asi,	%g3
	udiv	%l2,	0x1D95,	%i6
	wr	%g0,	0xf9,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
	fmovdg	%icc,	%f6,	%f9
	fmovdg	%xcc,	%f3,	%f10
	umulcc	%o4,	%i2,	%l3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tleu	%icc,	0x3
	movl	%xcc,	%g2,	%o7
	smulcc	%g5,	0x1687,	%g7
	sethi	0x14A1,	%i1
	array8	%g1,	%i7,	%o6
	addccc	%l4,	0x0238,	%i5
	fbug,a	%fcc3,	loop_835
	tvc	%xcc,	0x6
	sll	%o3,	%l1,	%l6
	movrgez	%o5,	%o1,	%g4
loop_835:
	taddcctv	%i0,	0x060D,	%l5
	ble,pt	%icc,	loop_836
	ta	%xcc,	0x3
	addccc	%g6,	0x0748,	%i4
	and	%l0,	0x1A88,	%o2
loop_836:
	fexpand	%f28,	%f8
	sth	%i3,	[%l7 + 0x4C]
	fmovdgu	%xcc,	%f26,	%f6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	lduw	[%l7 + 0x74],	%g3
	tvc	%icc,	0x5
	tn	%xcc,	0x1
	fmul8ulx16	%f30,	%f10,	%f26
	ba,pn	%xcc,	loop_837
	fcmpgt32	%f4,	%f18,	%o0
	ldsb	[%l7 + 0x1E],	%i6
	fmovsle	%icc,	%f8,	%f12
loop_837:
	fbne,a	%fcc2,	loop_838
	fmul8x16au	%f6,	%f18,	%f26
	mulx	%l2,	0x001D,	%o4
	fbne	%fcc3,	loop_839
loop_838:
	orncc	%i2,	0x11A4,	%g2
	edge16ln	%l3,	%o7,	%g5
	movrgz	%i1,	0x367,	%g1
loop_839:
	brnz,a	%g7,	loop_840
	subcc	%o6,	%i7,	%i5
	fbu	%fcc0,	loop_841
	srl	%o3,	0x09,	%l1
loop_840:
	nop
	set	0x20, %o6
	stwa	%l6,	[%l7 + %o6] 0x04
loop_841:
	movcc	%icc,	%o5,	%l4
	nop
	set	0x78, %l1
	std	%f20,	[%l7 + %l1]
	wr	%g0,	0x80,	%asi
	lduha	[%l7 + 0x30] %asi,	%o1
	fbn	%fcc0,	loop_842
	and	%g4,	0x0D65,	%l5
	xor	%g6,	0x01BB,	%i4
	sir	0x12A3
loop_842:
	move	%xcc,	%l0,	%i0
	nop
	setx	0xFDF77185,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f2
	setx	0x6B2D0BBF,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f21
	fmuls	%f21,	%f2,	%f27
	nop
	fitos	%f9,	%f28
	fstoi	%f28,	%f9
	subcc	%o2,	%i3,	%o0
	alignaddrl	%g3,	%l2,	%i6
	and	%i2,	0x0019,	%o4
	fmul8x16au	%f25,	%f28,	%f10
	edge32	%l3,	%o7,	%g5
	subcc	%i1,	0x1C54,	%g1
	sdiv	%g7,	0x02B7,	%o6
	movvs	%icc,	%g2,	%i5
	edge8ln	%o3,	%i7,	%l1
	st	%f24,	[%l7 + 0x78]
	ble	loop_843
	fmovdneg	%xcc,	%f1,	%f11
	stx	%l6,	[%l7 + 0x40]
	bcc	loop_844
loop_843:
	bn	%icc,	loop_845
	movneg	%icc,	%l4,	%o5
	fbul,a	%fcc2,	loop_846
loop_844:
	fmovsl	%xcc,	%f9,	%f6
loop_845:
	edge32n	%g4,	%o1,	%g6
	brgez	%i4,	loop_847
loop_846:
	udivcc	%l5,	0x19E0,	%i0
	tne	%icc,	0x2
	edge32l	%o2,	%l0,	%i3
loop_847:
	sdivcc	%g3,	0x14F5,	%o0
	tneg	%xcc,	0x0
	wr	%g0,	0x11,	%asi
	lduba	[%l7 + 0x44] %asi,	%i6
	set	0x50, %i2
	prefetcha	[%l7 + %i2] 0x11,	 0x3
	mulx	%l2,	0x1CD4,	%o4
	or	%o7,	0x1292,	%g5
	ta	%icc,	0x5
	movge	%icc,	%l3,	%i1
	fmovdcc	%icc,	%f23,	%f10
	fmovdpos	%icc,	%f8,	%f8
	edge8	%g7,	%g1,	%o6
	brlz,a	%g2,	loop_848
	edge32n	%o3,	%i7,	%l1
	movleu	%icc,	%l6,	%l4
	bne	loop_849
loop_848:
	sethi	0x0833,	%o5
	ba	%xcc,	loop_850
	sethi	0x0625,	%g4
loop_849:
	tvc	%icc,	0x0
	tsubcc	%i5,	%g6,	%o1
loop_850:
	tvc	%xcc,	0x6
	edge32ln	%l5,	%i4,	%o2
	ta	%xcc,	0x5
	brz	%i0,	loop_851
	fmovse	%xcc,	%f31,	%f28
	movl	%icc,	%l0,	%i3
	array8	%g3,	%o0,	%i6
loop_851:
	ldd	[%l7 + 0x68],	%i2
	nop
	fitos	%f29,	%f26
	array32	%o4,	%l2,	%g5
	set	0x40, %i1
	stda	%f16,	[%l7 + %i1] 0x18
	tn	%icc,	0x3
	nop
	setx loop_852, %l0, %l1
	jmpl %l1, %l3
	edge32n	%i1,	%g7,	%o7
	brgz,a	%g1,	loop_853
	srl	%g2,	0x17,	%o6
loop_852:
	ldsw	[%l7 + 0x2C],	%o3
	edge32n	%i7,	%l6,	%l1
loop_853:
	movpos	%xcc,	%o5,	%l4
	addc	%i5,	%g6,	%g4
	sth	%o1,	[%l7 + 0x28]
	brlez,a	%l5,	loop_854
	bcs,pn	%xcc,	loop_855
	prefetch	[%l7 + 0x18],	 0x1
	brz,a	%o2,	loop_856
loop_854:
	fbug	%fcc2,	loop_857
loop_855:
	tvs	%xcc,	0x2
	fmovde	%xcc,	%f13,	%f0
loop_856:
	udivx	%i4,	0x117F,	%l0
loop_857:
	fmovsvs	%xcc,	%f9,	%f31
	movgu	%xcc,	%i3,	%g3
	tl	%icc,	0x7
	fcmpgt16	%f20,	%f12,	%o0
	sllx	%i6,	0x16,	%i0
	wr	%g0,	0x23,	%asi
	ldda	[%l7 + 0x10] %asi,	%i2
	fmuld8ulx16	%f13,	%f18,	%f4
	sub	%l2,	0x1632,	%g5
	subcc	%o4,	0x12D3,	%l3
	tcc	%xcc,	0x2
	array32	%i1,	%g7,	%g1
	orn	%g2,	0x06A6,	%o6
	fors	%f9,	%f5,	%f6
	tsubcctv	%o7,	%o3,	%i7
	edge16ln	%l6,	%l1,	%o5
	fmuld8ulx16	%f3,	%f27,	%f22
	tg	%icc,	0x5
	movrne	%l4,	%g6,	%g4
	fmul8x16au	%f15,	%f8,	%f4
	fbo,a	%fcc2,	loop_858
	or	%i5,	0x076E,	%o1
	edge16	%o2,	%l5,	%l0
	sir	0x168E
loop_858:
	sdivcc	%i4,	0x19C8,	%g3
	tneg	%xcc,	0x5
	movrlz	%i3,	0x3D6,	%i6
	tcc	%xcc,	0x7
	movrne	%i0,	%o0,	%i2
	fmovsgu	%xcc,	%f0,	%f11
	movg	%xcc,	%g5,	%o4
	xorcc	%l3,	0x1860,	%l2
	set	0x48, %g4
	ldswa	[%l7 + %g4] 0x89,	%g7
	array32	%g1,	%g2,	%i1
	addc	%o7,	0x1072,	%o3
	move	%icc,	%i7,	%l6
	brlz	%l1,	loop_859
	nop
	fitod	%f6,	%f18
	edge32n	%o5,	%o6,	%l4
	udiv	%g6,	0x1103,	%i5
loop_859:
	bvs,a,pt	%xcc,	loop_860
	movle	%xcc,	%o1,	%o2
	udivcc	%g4,	0x103A,	%l5
	edge8n	%l0,	%g3,	%i4
loop_860:
	bge,pt	%xcc,	loop_861
	fmovs	%f8,	%f29
	ldd	[%l7 + 0x10],	%f26
	fbo,a	%fcc2,	loop_862
loop_861:
	sth	%i3,	[%l7 + 0x10]
	edge16n	%i6,	%i0,	%i2
	sdiv	%o0,	0x0A9C,	%o4
loop_862:
	for	%f16,	%f22,	%f12
	nop
	setx	0xBD20B669224CD919,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0x45972E9BEE12D1C8,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	fdivd	%f20,	%f6,	%f8
	umul	%l3,	0x0F69,	%g5
	bcs,pt	%xcc,	loop_863
	subcc	%l2,	%g1,	%g7
	movrgez	%g2,	0x04E,	%o7
	xorcc	%o3,	0x1F44,	%i7
loop_863:
	ldx	[%l7 + 0x50],	%i1
	movpos	%xcc,	%l6,	%o5
	umulcc	%l1,	0x1A75,	%l4
	fmuld8sux16	%f6,	%f26,	%f14
	tvs	%xcc,	0x1
	subc	%g6,	0x0641,	%o6
	membar	0x44
	fbge	%fcc0,	loop_864
	edge32l	%o1,	%o2,	%g4
	tgu	%icc,	0x0
	ldd	[%l7 + 0x78],	%i4
loop_864:
	fmuld8sux16	%f1,	%f11,	%f8
	fbul,a	%fcc3,	loop_865
	ldstub	[%l7 + 0x0F],	%l0
	array32	%l5,	%g3,	%i3
	xor	%i4,	%i6,	%i0
loop_865:
	smulcc	%i2,	%o4,	%l3
	sdiv	%g5,	0x1D59,	%o0
	tne	%icc,	0x6
	faligndata	%f12,	%f28,	%f20
	fbo,a	%fcc1,	loop_866
	bcc,a,pn	%icc,	loop_867
	orncc	%l2,	0x08BA,	%g7
	brlez	%g2,	loop_868
loop_866:
	subccc	%g1,	0x1981,	%o7
loop_867:
	fpsub16	%f0,	%f6,	%f18
	and	%o3,	%i7,	%l6
loop_868:
	taddcc	%i1,	0x1BB3,	%l1
	fmovsneg	%xcc,	%f7,	%f7
	srl	%o5,	0x10,	%l4
	movge	%xcc,	%g6,	%o6
	bg,a,pn	%xcc,	loop_869
	bl,a,pt	%xcc,	loop_870
	array8	%o2,	%o1,	%i5
	subccc	%l0,	0x13E0,	%g4
loop_869:
	edge16n	%l5,	%g3,	%i4
loop_870:
	movge	%xcc,	%i6,	%i3
	fpack32	%f22,	%f10,	%f2
	nop
	setx	loop_871,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	stbar
	fbg,a	%fcc1,	loop_872
	flush	%l7 + 0x20
loop_871:
	be,pn	%xcc,	loop_873
	or	%i2,	%o4,	%i0
loop_872:
	movrlez	%l3,	%g5,	%l2
	sth	%o0,	[%l7 + 0x7E]
loop_873:
	sth	%g7,	[%l7 + 0x20]
	alignaddr	%g2,	%g1,	%o7
	movge	%xcc,	%o3,	%i7
	fornot1	%f6,	%f18,	%f26
	fpadd32	%f0,	%f2,	%f22
	fmul8sux16	%f4,	%f30,	%f6
	umul	%i1,	%l1,	%l6
	orcc	%l4,	0x1D94,	%g6
	fbu,a	%fcc2,	loop_874
	movg	%icc,	%o6,	%o5
	bl	loop_875
	taddcc	%o1,	0x1FCA,	%i5
loop_874:
	edge8n	%l0,	%g4,	%l5
	fnot1s	%f24,	%f29
loop_875:
	stbar
	ldx	[%l7 + 0x40],	%g3
	bvs,pn	%xcc,	loop_876
	movge	%xcc,	%i4,	%o2
	edge16	%i6,	%i2,	%i3
	fbge	%fcc2,	loop_877
loop_876:
	fmovsneg	%icc,	%f13,	%f6
	wr	%g0,	0x18,	%asi
	stxa	%o4,	[%l7 + 0x40] %asi
loop_877:
	nop
	fitos	%f21,	%f8
	edge32n	%i0,	%l3,	%l2
	ldsh	[%l7 + 0x22],	%g5
	tl	%icc,	0x0
	set	0x7E, %o2
	lduha	[%l7 + %o2] 0x88,	%g7
	fornot2	%f12,	%f20,	%f30
	edge8n	%o0,	%g2,	%g1
	te	%xcc,	0x0
	andncc	%o7,	%o3,	%i1
	fpadd32s	%f4,	%f1,	%f29
	fmovrslez	%i7,	%f17,	%f20
	subcc	%l6,	%l1,	%l4
	fors	%f4,	%f18,	%f0
	alignaddrl	%g6,	%o6,	%o1
	movneg	%icc,	%o5,	%i5
	nop
	setx	0x25748842,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f11
	setx	0xE7694759,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f3
	fmuls	%f3,	%f11,	%f24
	sdivx	%l0,	0x135C,	%l5
	fzero	%f16
	edge16ln	%g3,	%g4,	%o2
	tneg	%xcc,	0x4
	edge8ln	%i4,	%i2,	%i6
	taddcctv	%o4,	%i0,	%i3
	be,pn	%xcc,	loop_878
	lduh	[%l7 + 0x50],	%l2
	pdist	%f4,	%f22,	%f2
	set	0x40, %i0
	stwa	%g5,	[%l7 + %i0] 0xea
	membar	#Sync
loop_878:
	edge16l	%l3,	%g7,	%o0
	ldx	[%l7 + 0x18],	%g2
	nop
	fitos	%f1,	%f19
	fstoi	%f19,	%f24
	tsubcctv	%o7,	0x13C4,	%g1
	addccc	%o3,	%i7,	%l6
	movcc	%xcc,	%l1,	%l4
	array16	%g6,	%i1,	%o1
	tvc	%xcc,	0x1
	fmovdcs	%icc,	%f22,	%f4
	fbug,a	%fcc2,	loop_879
	tgu	%xcc,	0x2
	edge8	%o5,	%i5,	%l0
	andcc	%l5,	%g3,	%o6
loop_879:
	stw	%o2,	[%l7 + 0x2C]
	or	%g4,	%i4,	%i6
	bneg,pt	%icc,	loop_880
	fmovdcs	%xcc,	%f19,	%f4
	fpsub16s	%f8,	%f29,	%f12
	fmovsvc	%xcc,	%f18,	%f0
loop_880:
	bne,pt	%icc,	loop_881
	brnz,a	%o4,	loop_882
	brnz,a	%i2,	loop_883
	udivx	%i0,	0x0F2A,	%i3
loop_881:
	tcc	%icc,	0x0
loop_882:
	xnor	%g5,	0x0787,	%l2
loop_883:
	fmovsleu	%xcc,	%f23,	%f0
	stw	%l3,	[%l7 + 0x3C]
	sllx	%g7,	0x12,	%g2
	movvs	%icc,	%o7,	%o0
	xorcc	%o3,	0x08CF,	%g1
	fpackfix	%f30,	%f7
	edge16n	%i7,	%l6,	%l1
	tvs	%icc,	0x0
	move	%icc,	%l4,	%i1
	nop
	setx	0xA87C0EE4,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f13
	setx	0x61F79814,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f9
	fadds	%f9,	%f13,	%f22
	st	%f22,	[%l7 + 0x28]
	sdivx	%g6,	0x1DAC,	%o5
	set	0x1B, %g3
	stba	%i5,	[%l7 + %g3] 0x14
	ld	[%l7 + 0x78],	%f18
	udiv	%l0,	0x1A6C,	%o1
	tg	%xcc,	0x0
	brlz,a	%g3,	loop_884
	smulcc	%l5,	0x0681,	%o6
	array32	%g4,	%i4,	%i6
	edge8l	%o4,	%o2,	%i2
loop_884:
	fzero	%f22
	movrlez	%i3,	%i0,	%g5
	movrlez	%l2,	%l3,	%g7
	xor	%g2,	0x1FA7,	%o0
	tsubcctv	%o7,	0x19E3,	%o3
	fmovdge	%xcc,	%f19,	%f28
	tcc	%xcc,	0x2
	fmovdne	%xcc,	%f3,	%f24
	fnot1	%f20,	%f2
	add	%i7,	%g1,	%l1
	taddcctv	%l6,	0x0B3F,	%l4
	st	%f5,	[%l7 + 0x7C]
	tcc	%xcc,	0x5
	brz	%g6,	loop_885
	movle	%icc,	%i1,	%i5
	xnor	%l0,	%o5,	%g3
	movrlz	%o1,	0x34E,	%l5
loop_885:
	fbl	%fcc2,	loop_886
	ld	[%l7 + 0x78],	%f8
	fbug	%fcc3,	loop_887
	fbu,a	%fcc0,	loop_888
loop_886:
	addccc	%g4,	%o6,	%i4
	tvs	%icc,	0x6
loop_887:
	fsrc1s	%f3,	%f20
loop_888:
	fmovdleu	%xcc,	%f18,	%f4
	st	%f20,	[%l7 + 0x14]
	nop
	fitos	%f19,	%f16
	fmovdcs	%icc,	%f15,	%f11
	sdivx	%i6,	0x04AD,	%o2
	fornot2	%f22,	%f30,	%f10
	movpos	%icc,	%i2,	%i3
	movrlez	%i0,	0x05C,	%g5
	fsrc1s	%f20,	%f18
	wr	%g0,	0x88,	%asi
	prefetcha	[%l7 + 0x78] %asi,	 0x3
	movneg	%icc,	%l3,	%l2
	edge32ln	%g7,	%g2,	%o0
	tvs	%xcc,	0x3
	fand	%f26,	%f18,	%f4
	fnot2s	%f19,	%f22
	nop
	setx	0xE04F3C59,	%l0,	%l6
	st	%l6,	[%l7 + 0x58]
	ld	[%l7 + 0x58],	%fsr
	movleu	%xcc,	%o7,	%o3
	movge	%icc,	%i7,	%g1
	fnot1	%f18,	%f2
	subccc	%l1,	0x0D7A,	%l4
	movrlez	%l6,	%g6,	%i5
	tleu	%xcc,	0x4
	std	%f16,	[%l7 + 0x70]
	or	%l0,	0x1285,	%o5
	bgu	%xcc,	loop_889
	xor	%i1,	%g3,	%o1
	udiv	%l5,	0x0AAD,	%o6
	pdist	%f2,	%f16,	%f14
loop_889:
	movrlz	%g4,	0x356,	%i6
	fcmpne32	%f22,	%f26,	%i4
	movrlez	%o2,	%i3,	%i0
	movre	%i2,	%o4,	%g5
	fbu	%fcc1,	loop_890
	andncc	%l3,	%g7,	%l2
	movle	%icc,	%g2,	%o7
	nop
	set	0x44, %l4
	ldub	[%l7 + %l4],	%o0
loop_890:
	andcc	%i7,	0x0678,	%o3
	addcc	%l1,	%l4,	%l6
	srax	%g1,	0x0C,	%g6
	ldx	[%l7 + 0x58],	%l0
	movrne	%i5,	%i1,	%g3
	fmovdpos	%icc,	%f4,	%f11
	edge32ln	%o1,	%l5,	%o5
	tcc	%xcc,	0x6
	sir	0x0185
	tleu	%icc,	0x1
	nop
	fitod	%f2,	%f4
	fdtos	%f4,	%f1
	addcc	%g4,	0x1FAE,	%i6
	bn,a	%icc,	loop_891
	fmovrdgz	%i4,	%f26,	%f30
	stx	%o6,	[%l7 + 0x30]
	edge32n	%i3,	%o2,	%i2
loop_891:
	tn	%xcc,	0x2
	brz,a	%i0,	loop_892
	sllx	%g5,	0x18,	%l3
	fmovspos	%icc,	%f21,	%f1
	edge8ln	%g7,	%l2,	%o4
loop_892:
	sethi	0x098D,	%o7
	sllx	%o0,	0x0D,	%g2
	sllx	%o3,	%l1,	%i7
	andncc	%l6,	%l4,	%g1
	fexpand	%f29,	%f20
	srlx	%l0,	%i5,	%g6
	set	0x7C, %i7
	ldswa	[%l7 + %i7] 0x15,	%i1
	fmovspos	%xcc,	%f17,	%f15
	movvc	%icc,	%o1,	%l5
	bvs,pt	%xcc,	loop_893
	or	%o5,	%g3,	%g4
	fbue,a	%fcc2,	loop_894
	fmovdl	%icc,	%f12,	%f3
loop_893:
	tg	%icc,	0x4
	fmovsleu	%icc,	%f9,	%f7
loop_894:
	sethi	0x09E0,	%i4
	set	0x24, %g7
	stwa	%o6,	[%l7 + %g7] 0x2b
	membar	#Sync
	fabss	%f3,	%f12
	umul	%i3,	%o2,	%i2
	brlez,a	%i0,	loop_895
	andcc	%g5,	0x0603,	%l3
	wr	%g0,	0x10,	%asi
	swapa	[%l7 + 0x70] %asi,	%i6
loop_895:
	tvc	%icc,	0x5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32ln	%g7,	%l2,	%o7
	addccc	%o0,	0x021C,	%g2
	movrlz	%o4,	0x24B,	%o3
	addcc	%l1,	0x1627,	%i7
	mova	%xcc,	%l6,	%g1
	wr	%g0,	0x80,	%asi
	ldstuba	[%l7 + 0x64] %asi,	%l4
	set	0x3F, %o1
	ldsba	[%l7 + %o1] 0x81,	%l0
	srax	%g6,	0x16,	%i1
	xor	%i5,	%l5,	%o1
	wr	%g0,	0x81,	%asi
	swapa	[%l7 + 0x44] %asi,	%o5
	fmovsleu	%icc,	%f4,	%f23
	edge32l	%g3,	%i4,	%o6
	edge8n	%i3,	%g4,	%i2
	fpadd16	%f16,	%f22,	%f30
	fmovrdlz	%o2,	%f20,	%f24
	fmovdg	%xcc,	%f12,	%f18
	fmul8x16al	%f10,	%f0,	%f22
	fcmpeq16	%f10,	%f22,	%i0
	ba	loop_896
	nop
	setx	loop_897,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fcmpgt32	%f24,	%f10,	%l3
	andcc	%g5,	%g7,	%l2
loop_896:
	fmovdl	%icc,	%f6,	%f16
loop_897:
	srl	%i6,	0x17,	%o7
	ldd	[%l7 + 0x28],	%o0
	array32	%o4,	%g2,	%o3
	andncc	%l1,	%l6,	%i7
	andncc	%g1,	%l0,	%g6
	orcc	%i1,	%i5,	%l4
	udivcc	%o1,	0x0953,	%l5
	sllx	%g3,	%i4,	%o5
	movrgez	%o6,	%i3,	%g4
	fbe,a	%fcc0,	loop_898
	taddcc	%i2,	%i0,	%o2
	addccc	%g5,	%g7,	%l2
	edge8l	%i6,	%l3,	%o0
loop_898:
	brlez	%o4,	loop_899
	bneg	%xcc,	loop_900
	bleu,pn	%icc,	loop_901
	fbl	%fcc3,	loop_902
loop_899:
	nop
	setx	0xDA8412916826BE96,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0xEF9822D98D4A76F2,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	fmuld	%f28,	%f14,	%f10
loop_900:
	fnot2	%f2,	%f14
loop_901:
	nop
	setx	0x044C192DD9CE9212,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0x2BAF62B70CBB14DF,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	faddd	%f30,	%f6,	%f16
loop_902:
	udiv	%g2,	0x0814,	%o7
	sdiv	%l1,	0x16F5,	%o3
	movcs	%icc,	%i7,	%g1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldub	[%l7 + 0x5F],	%l6
	brz,a	%l0,	loop_903
	sdivx	%i1,	0x086F,	%g6
	bpos	loop_904
	fbul,a	%fcc1,	loop_905
loop_903:
	fzero	%f0
	addc	%i5,	0x1BF4,	%o1
loop_904:
	sth	%l4,	[%l7 + 0x72]
loop_905:
	nop
	wr	%g0,	0x89,	%asi
	ldsba	[%l7 + 0x6B] %asi,	%l5
	subcc	%i4,	%g3,	%o6
	sra	%i3,	%o5,	%i2
	edge8n	%i0,	%g4,	%o2
	orncc	%g5,	0x16A4,	%l2
	fandnot1s	%f31,	%f22,	%f26
	move	%xcc,	%g7,	%i6
	movvs	%xcc,	%o0,	%l3
	ldsb	[%l7 + 0x37],	%o4
	andncc	%o7,	%g2,	%o3
	umul	%l1,	0x0990,	%g1
	xor	%l6,	0x0E7D,	%i7
	edge8	%l0,	%i1,	%i5
	fmovsvs	%xcc,	%f18,	%f16
	set	0x68, %o7
	lduha	[%l7 + %o7] 0x80,	%o1
	fcmple32	%f10,	%f14,	%g6
	fbg	%fcc0,	loop_906
	fmovrdgz	%l4,	%f18,	%f20
	mulx	%i4,	0x1EDF,	%l5
	tpos	%xcc,	0x3
loop_906:
	nop
	set	0x6C, %o5
	ldstuba	[%l7 + %o5] 0x04,	%o6
	tcc	%xcc,	0x6
	fbue	%fcc2,	loop_907
	movg	%icc,	%g3,	%o5
	fmul8ulx16	%f2,	%f0,	%f8
	movn	%icc,	%i3,	%i0
loop_907:
	xnorcc	%i2,	0x19F4,	%o2
	orn	%g4,	0x013F,	%l2
	fmovrslez	%g5,	%f8,	%f19
	xnor	%i6,	0x053C,	%o0
	wr	%g0,	0x0c,	%asi
	swapa	[%l7 + 0x30] %asi,	%l3
	nop
	setx	loop_908,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fmovdne	%icc,	%f26,	%f23
	addcc	%o4,	%g7,	%g2
	edge32ln	%o7,	%o3,	%g1
loop_908:
	nop
	setx	0xB32CB4C681BC418B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	fsqrtd	%f0,	%f10
	fmovsne	%xcc,	%f27,	%f25
	tcs	%icc,	0x2
	fmovrslz	%l1,	%f15,	%f31
	movvs	%icc,	%i7,	%l6
	bvc,pn	%icc,	loop_909
	movne	%xcc,	%i1,	%i5
	fpackfix	%f16,	%f11
	movg	%xcc,	%l0,	%o1
loop_909:
	alignaddr	%g6,	%l4,	%i4
	ldd	[%l7 + 0x10],	%o6
	ba,pn	%xcc,	loop_910
	stx	%g3,	[%l7 + 0x58]
	tcc	%xcc,	0x6
	movg	%icc,	%l5,	%o5
loop_910:
	sdivx	%i3,	0x1771,	%i2
	movneg	%xcc,	%o2,	%g4
	set	0x5D, %l6
	lduba	[%l7 + %l6] 0x81,	%l2
	mulx	%i0,	%i6,	%o0
	sir	0x0E92
	movcs	%icc,	%g5,	%o4
	bge,a	loop_911
	umul	%g7,	0x0E7B,	%l3
	movrgz	%o7,	0x13D,	%o3
	edge16	%g2,	%l1,	%i7
loop_911:
	add	%g1,	0x1F7F,	%i1
	movrgz	%l6,	%i5,	%l0
	movg	%icc,	%g6,	%o1
	tleu	%icc,	0x4
	array32	%l4,	%i4,	%g3
	fpack32	%f10,	%f10,	%f30
	fnot2	%f24,	%f2
	movl	%icc,	%l5,	%o5
	sir	0x0AE7
	fbne	%fcc0,	loop_912
	fcmple32	%f18,	%f24,	%o6
	movg	%icc,	%i2,	%i3
	ldstub	[%l7 + 0x7C],	%o2
loop_912:
	fmovrslz	%g4,	%f23,	%f25
	edge32ln	%i0,	%l2,	%o0
	movl	%icc,	%g5,	%i6
	tg	%icc,	0x1
	wr	%g0,	0x04,	%asi
	lduba	[%l7 + 0x0D] %asi,	%o4
	edge8n	%g7,	%o7,	%o3
	nop
	fitos	%f0,	%f19
	fstoi	%f19,	%f30
	edge16n	%g2,	%l3,	%l1
	edge16n	%i7,	%g1,	%i1
	movleu	%xcc,	%l6,	%l0
	fsrc2s	%f8,	%f20
	udivcc	%i5,	0x1BEB,	%o1
	ba	%icc,	loop_913
	edge16n	%g6,	%l4,	%i4
	sub	%g3,	0x1C6D,	%l5
	move	%icc,	%o6,	%o5
loop_913:
	fmovsvc	%xcc,	%f25,	%f11
	alignaddrl	%i3,	%i2,	%g4
	andn	%o2,	%l2,	%i0
	movpos	%icc,	%o0,	%i6
	tsubcc	%g5,	%g7,	%o4
	fmovspos	%xcc,	%f6,	%f4
	udivx	%o7,	0x1E1E,	%g2
	smulcc	%l3,	0x11CA,	%l1
	tg	%icc,	0x5
	nop
	setx	loop_914,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movvs	%xcc,	%i7,	%g1
	addccc	%i1,	%o3,	%l6
	sub	%i5,	%o1,	%l0
loop_914:
	te	%xcc,	0x7
	fcmpeq32	%f10,	%f16,	%l4
	fmovrdgz	%i4,	%f24,	%f30
	movre	%g6,	%l5,	%o6
	movcs	%icc,	%g3,	%i3
	tvc	%xcc,	0x5
	tsubcc	%o5,	%g4,	%i2
	movre	%l2,	0x337,	%o2
	ble,a	%xcc,	loop_915
	array32	%o0,	%i6,	%i0
	tsubcc	%g7,	%o4,	%g5
	udivcc	%g2,	0x002F,	%o7
loop_915:
	edge8	%l3,	%i7,	%g1
	movrlz	%l1,	%o3,	%l6
	wr	%g0,	0x89,	%asi
	lduba	[%l7 + 0x52] %asi,	%i5
	bneg,pt	%icc,	loop_916
	array32	%o1,	%l0,	%l4
	fpadd16s	%f2,	%f15,	%f22
	nop
	setx	0xAC2F789E,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f28
	setx	0x1F51341D,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f27
	fsubs	%f27,	%f28,	%f15
loop_916:
	alignaddr	%i1,	%i4,	%l5
	fmovrde	%o6,	%f30,	%f12
	edge32l	%g3,	%i3,	%g6
	udiv	%o5,	0x17A7,	%i2
	fand	%f24,	%f10,	%f14
	set	0x4C, %o0
	ldswa	[%l7 + %o0] 0x0c,	%g4
	tleu	%icc,	0x2
	srlx	%l2,	0x15,	%o0
	movvc	%icc,	%i6,	%i0
	orcc	%g7,	0x046A,	%o4
	umulcc	%g5,	0x0551,	%o2
	fcmple16	%f0,	%f26,	%g2
	nop
	set	0x3E, %l2
	ldub	[%l7 + %l2],	%o7
	tvs	%xcc,	0x7
	mulx	%l3,	0x1820,	%i7
	fbug,a	%fcc3,	loop_917
	fmovdgu	%icc,	%f24,	%f22
	andn	%g1,	0x124B,	%l1
	fbug	%fcc1,	loop_918
loop_917:
	nop
	set	0x4A, %o3
	ldstub	[%l7 + %o3],	%l6
	nop
	set	0x5D, %g6
	ldub	[%l7 + %g6],	%o3
	srlx	%i5,	0x1F,	%l0
loop_918:
	fmovdcc	%icc,	%f13,	%f31
	fcmple16	%f0,	%f28,	%l4
	fnors	%f11,	%f27,	%f26
	fba,a	%fcc2,	loop_919
	tl	%icc,	0x5
	movcs	%icc,	%o1,	%i1
	fabsd	%f8,	%f26
loop_919:
	nop
	set	0x50, %i4
	ldda	[%l7 + %i4] 0xe2,	%l4
	alignaddrl	%i4,	%g3,	%i3
	st	%f11,	[%l7 + 0x28]
	nop
	setx loop_920, %l0, %l1
	jmpl %l1, %o6
	fpsub32	%f28,	%f22,	%f12
	umulcc	%g6,	%o5,	%g4
	edge8l	%i2,	%o0,	%i6
loop_920:
	umul	%i0,	%l2,	%g7
	bcs,a,pt	%icc,	loop_921
	alignaddr	%o4,	%o2,	%g2
	nop
	setx	loop_922,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	edge8n	%o7,	%l3,	%i7
loop_921:
	udivx	%g1,	0x1ACE,	%l1
	fmovdvs	%xcc,	%f30,	%f29
loop_922:
	fsrc1s	%f20,	%f23
	movre	%l6,	0x294,	%o3
	edge16ln	%g5,	%i5,	%l4
	ble,a	loop_923
	ba,pn	%icc,	loop_924
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	add	%l0,	%i1,	%l5
loop_923:
	edge16	%i4,	%g3,	%o1
loop_924:
	sir	0x021D
	subcc	%o6,	0x0CE1,	%i3
	popc	%o5,	%g6
	movneg	%xcc,	%i2,	%g4
	fzeros	%f5
	fexpand	%f12,	%f2
	set	0x5A, %i6
	ldsha	[%l7 + %i6] 0x89,	%i6
	fones	%f2
	mulx	%o0,	0x1FE9,	%i0
	fmul8x16al	%f2,	%f30,	%f14
	fandnot1s	%f6,	%f18,	%f30
	set	0x46, %l5
	lduha	[%l7 + %l5] 0x15,	%l2
	set	0x50, %i3
	ldda	[%l7 + %i3] 0xeb,	%g6
	brz,a	%o4,	loop_925
	alignaddr	%o2,	%g2,	%l3
	nop
	setx	0x14588BA0,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f15
	setx	0xC2418291,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f13
	fadds	%f13,	%f15,	%f17
	set	0x7C, %g1
	ldswa	[%l7 + %g1] 0x04,	%i7
loop_925:
	fxnor	%f26,	%f10,	%f26
	movle	%xcc,	%o7,	%g1
	edge16	%l6,	%o3,	%l1
	ba,a	%xcc,	loop_926
	bleu,a,pn	%icc,	loop_927
	nop
	setx	0x59848A87,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f22
	setx	0x8BB81014,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f13
	fdivs	%f13,	%f22,	%f6
	udivcc	%i5,	0x12E2,	%l4
loop_926:
	fmovsne	%xcc,	%f3,	%f31
loop_927:
	fxors	%f25,	%f6,	%f7
	alignaddr	%g5,	%i1,	%l0
	movle	%icc,	%l5,	%i4
	tg	%xcc,	0x3
	fand	%f6,	%f18,	%f16
	movpos	%xcc,	%g3,	%o6
	addccc	%o1,	0x0412,	%i3
	fandnot2	%f30,	%f0,	%f16
	fmovsgu	%xcc,	%f2,	%f13
	fpsub16	%f28,	%f14,	%f20
	tvc	%icc,	0x5
	fbo	%fcc2,	loop_928
	andn	%g6,	0x1384,	%i2
	alignaddrl	%o5,	%i6,	%g4
	array32	%o0,	%l2,	%i0
loop_928:
	fmovs	%f9,	%f16
	edge16	%o4,	%g7,	%o2
	wr	%g0,	0x81,	%asi
	lduwa	[%l7 + 0x2C] %asi,	%l3
	edge8n	%i7,	%o7,	%g2
	for	%f26,	%f22,	%f26
	sdivcc	%l6,	0x10B8,	%g1
	fmovrdgz	%o3,	%f0,	%f6
	movg	%xcc,	%l1,	%l4
	movl	%xcc,	%i5,	%i1
	umul	%g5,	%l0,	%i4
	tneg	%xcc,	0x0
	smulcc	%g3,	0x1EC0,	%o6
	orn	%o1,	%i3,	%g6
	fbne,a	%fcc0,	loop_929
	addccc	%i2,	0x1F35,	%o5
	lduh	[%l7 + 0x6E],	%l5
	fmovrslz	%g4,	%f24,	%f20
loop_929:
	srlx	%i6,	0x04,	%o0
	fbule	%fcc1,	loop_930
	movrgz	%i0,	0x34E,	%l2
	tleu	%icc,	0x6
	movgu	%icc,	%g7,	%o4
loop_930:
	nop
	setx	0xA2F94EF5,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f6
	setx	0xCB6EFBDD,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f9
	fmuls	%f9,	%f6,	%f13
	tg	%xcc,	0x4
	fbul	%fcc3,	loop_931
	subc	%o2,	%l3,	%o7
	bne,a	loop_932
	nop
	fitos	%f10,	%f29
	fstod	%f29,	%f22
loop_931:
	movrlez	%i7,	%l6,	%g1
	call	loop_933
loop_932:
	fpsub32	%f12,	%f18,	%f4
	tvc	%icc,	0x3
	brgz	%o3,	loop_934
loop_933:
	sll	%g2,	0x08,	%l1
	orcc	%l4,	0x05F6,	%i5
	ldub	[%l7 + 0x48],	%i1
loop_934:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	std	%f30,	[%l7 + 0x08]
	ld	[%l7 + 0x18],	%f5
	fmovdvs	%icc,	%f2,	%f19
	set	0x36, %l0
	ldstuba	[%l7 + %l0] 0x81,	%g5
	movneg	%xcc,	%i4,	%l0
	fandnot2s	%f1,	%f8,	%f11
	bl,a,pt	%icc,	loop_935
	movvs	%xcc,	%o6,	%g3
	fmovrdgz	%o1,	%f24,	%f0
	faligndata	%f4,	%f2,	%f16
loop_935:
	brnz	%g6,	loop_936
	nop
	setx	0x207FE38C,	%l0,	%l6
	st	%l6,	[%l7 + 0x24]
	ld	[%l7 + 0x24],	%fsr
	fmovsn	%xcc,	%f19,	%f31
	edge8l	%i3,	%i2,	%l5
loop_936:
	bn,a,pt	%xcc,	loop_937
	sll	%g4,	0x03,	%o5
	fbul,a	%fcc1,	loop_938
	edge32	%o0,	%i6,	%i0
loop_937:
	tn	%icc,	0x1
	xnorcc	%l2,	%g7,	%o2
loop_938:
	movleu	%icc,	%o4,	%l3
	sra	%i7,	%l6,	%o7
	fxnor	%f8,	%f28,	%f30
	fcmpeq32	%f0,	%f28,	%o3
	ldsw	[%l7 + 0x10],	%g1
	movn	%xcc,	%l1,	%g2
	edge32	%l4,	%i1,	%i5
	andn	%i4,	%l0,	%g5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tcc	%xcc,	0x2
	fbn,a	%fcc2,	loop_939
	brz	%o6,	loop_940
	xorcc	%g3,	%g6,	%i3
	lduw	[%l7 + 0x24],	%o1
loop_939:
	fzero	%f18
loop_940:
	fbge	%fcc3,	loop_941
	subcc	%i2,	%g4,	%l5
	xor	%o0,	0x0BF9,	%o5
	movcc	%icc,	%i6,	%l2
loop_941:
	fmovsg	%xcc,	%f1,	%f21
	tge	%xcc,	0x6
	fbuge	%fcc0,	loop_942
	movl	%xcc,	%g7,	%o2
	fzeros	%f0
	wr	%g0,	0xea,	%asi
	ldda	[%l7 + 0x70] %asi,	%i0
loop_942:
	bcc,pn	%icc,	loop_943
	fandnot1s	%f18,	%f29,	%f7
	fbge,a	%fcc3,	loop_944
	or	%l3,	0x0129,	%i7
loop_943:
	movvc	%xcc,	%l6,	%o4
	fmul8x16au	%f23,	%f4,	%f12
loop_944:
	bcc	%xcc,	loop_945
	srlx	%o7,	0x05,	%o3
	nop
	setx	0xB1E733E3B0527FCF,	%l0,	%l6
	stx	%l6,	[%l7 + 0x18]
	ldx	[%l7 + 0x18],	%fsr
	fone	%f18
loop_945:
	edge16	%g1,	%l1,	%l4
	sdivcc	%g2,	0x0179,	%i1
	edge8	%i4,	%l0,	%i5
	set	0x14, %g2
	swapa	[%l7 + %g2] 0x81,	%o6
	addc	%g3,	0x16E0,	%g6
	wr	%g0,	0x19,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	bl	loop_946
	movleu	%icc,	%i3,	%o1
	fnands	%f5,	%f21,	%f25
	movrne	%g5,	%i2,	%g4
loop_946:
	bgu,pn	%icc,	loop_947
	movrne	%o0,	0x27B,	%o5
	taddcctv	%i6,	0x0315,	%l2
	subcc	%g7,	%l5,	%o2
loop_947:
	ta	%icc,	0x4
	add	%i0,	%i7,	%l6
	movpos	%xcc,	%o4,	%o7
	andcc	%o3,	0x08E9,	%g1
	nop
	fitod	%f6,	%f14
	fdtox	%f14,	%f30
	fxtod	%f30,	%f6
	popc	0x0A6F,	%l1
	umul	%l4,	0x059B,	%l3
	set	0x70, %o4
	ldda	[%l7 + %o4] 0xe3,	%g2
	alignaddr	%i1,	%l0,	%i5
	movrgz	%i4,	0x29C,	%o6
	set	0x2F, %g5
	ldsba	[%l7 + %g5] 0x19,	%g6
	movrgez	%g3,	%i3,	%g5
	tl	%icc,	0x3
	srl	%i2,	0x0E,	%o1
	fbg	%fcc1,	loop_948
	tge	%icc,	0x3
	edge8ln	%g4,	%o0,	%o5
	movl	%icc,	%i6,	%l2
loop_948:
	fbuge,a	%fcc2,	loop_949
	swap	[%l7 + 0x14],	%l5
	edge8l	%o2,	%i0,	%i7
	add	%g7,	0x1E76,	%l6
loop_949:
	stb	%o7,	[%l7 + 0x48]
	fmovdpos	%xcc,	%f6,	%f10
	set	0x25, %i5
	lduba	[%l7 + %i5] 0x11,	%o3
	xor	%g1,	0x18DD,	%l1
	fmovspos	%icc,	%f1,	%f10
	edge16	%l4,	%o4,	%l3
	addcc	%i1,	0x01D3,	%g2
	sub	%l0,	0x0C3B,	%i4
	membar	0x1E
	tcs	%xcc,	0x0
	edge16ln	%i5,	%o6,	%g6
	fpadd32	%f18,	%f10,	%f14
	movl	%icc,	%i3,	%g3
	bgu,pt	%icc,	loop_950
	fbn	%fcc0,	loop_951
	andn	%i2,	%o1,	%g5
	edge32n	%o0,	%g4,	%o5
loop_950:
	sllx	%l2,	%l5,	%i6
loop_951:
	stx	%i0,	[%l7 + 0x50]
	bl,pt	%xcc,	loop_952
	fornot2	%f30,	%f8,	%f16
	smul	%o2,	%g7,	%l6
	or	%i7,	0x1676,	%o7
loop_952:
	srl	%g1,	%l1,	%o3
	brlez	%l4,	loop_953
	nop
	setx	loop_954,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fcmpeq32	%f2,	%f22,	%l3
	addcc	%i1,	0x1FF7,	%o4
loop_953:
	nop
	fitos	%f20,	%f12
loop_954:
	bvc	%xcc,	loop_955
	popc	0x1562,	%l0
	edge16	%g2,	%i4,	%i5
	set	0x40, %o6
	ldda	[%l7 + %o6] 0x0c,	%f0
loop_955:
	smul	%o6,	%i3,	%g6
	fpadd32s	%f0,	%f5,	%f28
	ble,pn	%icc,	loop_956
	tneg	%icc,	0x3
	fpadd16s	%f27,	%f8,	%f8
	array32	%i2,	%g3,	%g5
loop_956:
	st	%f7,	[%l7 + 0x18]
	movl	%xcc,	%o0,	%o1
	edge32ln	%g4,	%o5,	%l5
	xor	%l2,	0x14DD,	%i6
	movrlez	%o2,	%g7,	%l6
	edge16	%i0,	%i7,	%o7
	fsrc2	%f6,	%f12
	taddcc	%g1,	0x1F56,	%o3
	tpos	%icc,	0x5
	edge16n	%l4,	%l3,	%i1
	ldsb	[%l7 + 0x61],	%o4
	edge8	%l0,	%l1,	%i4
	alignaddrl	%i5,	%g2,	%i3
	movrne	%o6,	0x284,	%g6
	movre	%g3,	%i2,	%o0
	bshuffle	%f10,	%f22,	%f2
	fmovdvs	%icc,	%f4,	%f18
	bgu,a	loop_957
	fcmpgt16	%f2,	%f22,	%o1
	edge8	%g5,	%g4,	%l5
	mulx	%o5,	%l2,	%o2
loop_957:
	fmovse	%xcc,	%f29,	%f19
	tge	%icc,	0x1
	srax	%i6,	0x04,	%g7
	ldstub	[%l7 + 0x30],	%i0
	popc	%i7,	%l6
	faligndata	%f22,	%f10,	%f20
	popc	0x140E,	%o7
	srlx	%g1,	%o3,	%l3
	fmovsvc	%xcc,	%f7,	%f3
	movge	%icc,	%l4,	%o4
	edge16	%l0,	%i1,	%i4
	fbue	%fcc2,	loop_958
	addc	%l1,	0x1CBB,	%g2
	movg	%icc,	%i5,	%o6
	fcmpgt32	%f2,	%f18,	%g6
loop_958:
	te	%icc,	0x5
	fbule	%fcc3,	loop_959
	tneg	%icc,	0x5
	smulcc	%i3,	0x1327,	%g3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_959:
	umulcc	%o0,	0x0BCF,	%i2
	lduw	[%l7 + 0x14],	%g5
	movgu	%xcc,	%g4,	%l5
	edge16	%o1,	%o5,	%o2
	subccc	%i6,	0x19FB,	%l2
	movrlz	%i0,	0x34B,	%i7
	set	0x17, %l3
	ldstuba	[%l7 + %l3] 0x18,	%l6
	sra	%g7,	0x17,	%o7
	fcmpgt32	%f26,	%f6,	%o3
	fmovdcc	%icc,	%f7,	%f18
	nop
	setx	0x8CB701F8E2E82BFE,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0x784F8AC772DFBC01,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	fdivd	%f26,	%f20,	%f22
	alignaddr	%l3,	%g1,	%o4
	set	0x78, %l1
	stxa	%l0,	[%l7 + %l1] 0x04
	fcmple32	%f20,	%f28,	%i1
	movg	%xcc,	%l4,	%l1
	orcc	%g2,	0x0E72,	%i4
	bne	loop_960
	edge32ln	%o6,	%g6,	%i5
	xor	%g3,	0x05C1,	%i3
	nop
	fitod	%f12,	%f16
	fdtox	%f16,	%f10
loop_960:
	umulcc	%i2,	%o0,	%g5
	subcc	%l5,	%o1,	%o5
	orcc	%o2,	%i6,	%g4
	fba,a	%fcc1,	loop_961
	smulcc	%i0,	0x0EF2,	%i7
	prefetch	[%l7 + 0x7C],	 0x2
	sdivcc	%l2,	0x17E8,	%l6
loop_961:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srlx	%o7,	0x0E,	%o3
	brgez	%l3,	loop_962
	fzeros	%f12
	fmovdge	%xcc,	%f9,	%f31
	stx	%g7,	[%l7 + 0x38]
loop_962:
	array32	%o4,	%g1,	%i1
	membar	0x56
	fmovrsgez	%l0,	%f26,	%f22
	tcc	%xcc,	0x4
	nop
	setx loop_963, %l0, %l1
	jmpl %l1, %l4
	ldstub	[%l7 + 0x0A],	%g2
	srlx	%l1,	%o6,	%g6
	nop
	setx	0xD6251FD1B04FF062,	%l0,	%l6
	stx	%l6,	[%l7 + 0x18]
	ldx	[%l7 + 0x18],	%fsr
loop_963:
	fbge	%fcc3,	loop_964
	movrgez	%i5,	%g3,	%i4
	edge8ln	%i3,	%o0,	%i2
	membar	0x19
loop_964:
	xnor	%g5,	0x1B7F,	%l5
	tcs	%icc,	0x1
	fnot1	%f28,	%f4
	membar	0x50
	wr	%g0,	0x2b,	%asi
	stha	%o1,	[%l7 + 0x58] %asi
	membar	#Sync
	movgu	%xcc,	%o2,	%i6
	addccc	%g4,	%i0,	%o5
	umulcc	%l2,	%l6,	%i7
	andcc	%o7,	%o3,	%g7
	swap	[%l7 + 0x2C],	%o4
	flush	%l7 + 0x30
	edge32n	%l3,	%g1,	%l0
	fbe	%fcc2,	loop_965
	tpos	%icc,	0x2
	fandnot2s	%f15,	%f3,	%f30
	tcs	%icc,	0x3
loop_965:
	edge16l	%i1,	%g2,	%l4
	fand	%f16,	%f0,	%f28
	movrlz	%o6,	%l1,	%g6
	srlx	%g3,	0x09,	%i4
	edge16l	%i5,	%i3,	%o0
	fbul,a	%fcc0,	loop_966
	subc	%i2,	%g5,	%o1
	brlz	%o2,	loop_967
	srax	%i6,	0x11,	%g4
loop_966:
	nop
	fitod	%f12,	%f16
	fdtoi	%f16,	%f2
	alignaddrl	%i0,	%o5,	%l2
loop_967:
	fcmple16	%f18,	%f26,	%l6
	andncc	%i7,	%o7,	%l5
	tn	%xcc,	0x6
	lduh	[%l7 + 0x54],	%o3
	nop
	setx	0x0C9D365D1056E992,	%l0,	%l6
	stx	%l6,	[%l7 + 0x08]
	ldx	[%l7 + 0x08],	%fsr
	fmovda	%xcc,	%f15,	%f2
	sub	%g7,	0x13FC,	%o4
	movre	%g1,	0x114,	%l3
	edge16ln	%l0,	%g2,	%i1
	ldsb	[%l7 + 0x3A],	%l4
	taddcctv	%o6,	0x0F19,	%l1
	addcc	%g3,	0x1880,	%i4
	taddcctv	%i5,	0x15E8,	%i3
	move	%icc,	%g6,	%i2
	sdiv	%o0,	0x0B35,	%o1
	lduw	[%l7 + 0x08],	%o2
	srlx	%i6,	%g5,	%g4
	nop
	setx	0x107A9660,	%l0,	%l6
	st	%l6,	[%l7 + 0x58]
	ld	[%l7 + 0x58],	%fsr
	brlz,a	%o5,	loop_968
	movneg	%xcc,	%i0,	%l2
	tleu	%icc,	0x4
	add	%i7,	%l6,	%o7
loop_968:
	addccc	%o3,	%l5,	%g7
	tne	%icc,	0x2
	ldd	[%l7 + 0x10],	%f26
	andcc	%g1,	%o4,	%l0
	movre	%l3,	%i1,	%g2
	orncc	%l4,	%o6,	%g3
	tn	%xcc,	0x7
	tge	%xcc,	0x5
	stbar
	umul	%i4,	0x0EF9,	%l1
	lduh	[%l7 + 0x14],	%i3
	addc	%g6,	%i2,	%o0
	edge16ln	%o1,	%o2,	%i5
	prefetch	[%l7 + 0x64],	 0x3
	movcs	%icc,	%g5,	%i6
	tle	%icc,	0x2
	fbul	%fcc0,	loop_969
	movn	%xcc,	%g4,	%i0
	tgu	%icc,	0x3
	wr	%g0,	0xe3,	%asi
	stwa	%o5,	[%l7 + 0x64] %asi
	membar	#Sync
loop_969:
	sdiv	%i7,	0x0B65,	%l2
	fbo	%fcc2,	loop_970
	array8	%l6,	%o7,	%l5
	fmovrslez	%o3,	%f10,	%f26
	array8	%g1,	%g7,	%l0
loop_970:
	orncc	%l3,	%i1,	%g2
	nop
	fitos	%f14,	%f4
	fstod	%f4,	%f18
	edge16l	%o4,	%o6,	%l4
	nop
	setx	0xA04047C2,	%l0,	%l6
	st	%l6,	[%l7 + 0x40]
	ld	[%l7 + 0x40],	%fsr
	smul	%i4,	0x02A3,	%l1
	tleu	%icc,	0x4
	lduh	[%l7 + 0x78],	%g3
	subc	%g6,	%i2,	%i3
	movneg	%icc,	%o1,	%o2
	fmovsgu	%xcc,	%f17,	%f13
	pdist	%f18,	%f12,	%f14
	te	%xcc,	0x6
	ld	[%l7 + 0x64],	%f0
	movvs	%xcc,	%o0,	%g5
	sra	%i5,	%i6,	%g4
	set	0x10, %i2
	swapa	[%l7 + %i2] 0x11,	%i0
	add	%o5,	0x0164,	%i7
	fmovrsgz	%l6,	%f3,	%f2
	fmovsgu	%icc,	%f25,	%f19
	tpos	%icc,	0x3
	tgu	%xcc,	0x6
	be	loop_971
	edge32n	%o7,	%l2,	%l5
	fnegd	%f20,	%f24
	fbule	%fcc1,	loop_972
loop_971:
	fmul8x16al	%f2,	%f31,	%f10
	xnor	%o3,	0x00ED,	%g7
	fbug,a	%fcc2,	loop_973
loop_972:
	movre	%g1,	0x069,	%l0
	sdiv	%i1,	0x16F4,	%g2
	orncc	%l3,	%o6,	%o4
loop_973:
	tsubcctv	%l4,	%l1,	%g3
	xnorcc	%g6,	0x1BBE,	%i4
	xorcc	%i3,	%o1,	%o2
	ldsw	[%l7 + 0x64],	%i2
	fcmple16	%f12,	%f30,	%g5
	taddcctv	%o0,	0x199F,	%i5
	sra	%g4,	%i0,	%o5
	orcc	%i7,	%i6,	%o7
	fnot1	%f12,	%f14
	movrlz	%l2,	0x32C,	%l5
	fcmpgt16	%f6,	%f28,	%o3
	flush	%l7 + 0x24
	fone	%f2
	move	%icc,	%g7,	%l6
	or	%l0,	%g1,	%i1
	pdist	%f12,	%f24,	%f2
	brgz	%g2,	loop_974
	edge16	%o6,	%o4,	%l3
	edge32n	%l4,	%g3,	%g6
	umul	%l1,	0x1E40,	%i3
loop_974:
	movrne	%i4,	0x2CA,	%o1
	add	%o2,	%i2,	%o0
	tn	%icc,	0x6
	stbar
	sra	%g5,	%g4,	%i5
	xnor	%o5,	%i7,	%i0
	alignaddrl	%o7,	%l2,	%l5
	bcc,pt	%icc,	loop_975
	sub	%i6,	0x0FC3,	%g7
	fnands	%f27,	%f25,	%f15
	nop
	setx	loop_976,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_975:
	fblg,a	%fcc0,	loop_977
	andcc	%o3,	0x170F,	%l0
	wr	%g0,	0x04,	%asi
	ldxa	[%l7 + 0x68] %asi,	%g1
loop_976:
	ta	%icc,	0x6
loop_977:
	fmul8x16au	%f22,	%f29,	%f28
	tcc	%xcc,	0x5
	fcmpne32	%f10,	%f0,	%l6
	movrgez	%i1,	%g2,	%o4
	ta	%icc,	0x1
	ldsw	[%l7 + 0x60],	%l3
	movge	%xcc,	%o6,	%g3
	bn	%xcc,	loop_978
	te	%icc,	0x7
	fbul	%fcc1,	loop_979
	array8	%l4,	%l1,	%i3
loop_978:
	tsubcctv	%g6,	0x076E,	%i4
	fmovsa	%xcc,	%f25,	%f5
loop_979:
	tvc	%xcc,	0x4
	addcc	%o2,	%o1,	%i2
	edge32	%o0,	%g5,	%g4
	tvc	%icc,	0x7
	set	0x4C, %i1
	ldswa	[%l7 + %i1] 0x04,	%o5
	ldsh	[%l7 + 0x28],	%i7
	bcc,pn	%icc,	loop_980
	edge16n	%i5,	%o7,	%l2
	movle	%xcc,	%l5,	%i6
	movrlz	%i0,	%g7,	%l0
loop_980:
	lduh	[%l7 + 0x54],	%g1
	fmovspos	%icc,	%f21,	%f10
	fandnot1	%f10,	%f8,	%f6
	fbe,a	%fcc1,	loop_981
	call	loop_982
	tleu	%icc,	0x0
	tsubcctv	%o3,	0x1CD7,	%l6
loop_981:
	nop
	fitod	%f2,	%f14
	fdtox	%f14,	%f16
	fxtod	%f16,	%f24
loop_982:
	ldd	[%l7 + 0x78],	%i0
	tleu	%xcc,	0x2
	mulscc	%g2,	%o4,	%o6
	udivcc	%g3,	0x08DF,	%l4
	fmovdcc	%xcc,	%f12,	%f17
	edge8l	%l3,	%l1,	%i3
	sth	%i4,	[%l7 + 0x0C]
	fmovdcc	%xcc,	%f18,	%f23
	be,a	%icc,	loop_983
	alignaddr	%o2,	%o1,	%g6
	nop
	setx	0xC1C284FC,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f9
	setx	0x0C5791DA,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f2
	fdivs	%f2,	%f9,	%f18
	membar	0x47
loop_983:
	stbar
	smul	%o0,	%i2,	%g4
	movcc	%icc,	%o5,	%i7
	addc	%g5,	%o7,	%l2
	movvc	%xcc,	%l5,	%i6
	fnegs	%f24,	%f28
	addcc	%i0,	%i5,	%g7
	nop
	setx loop_984, %l0, %l1
	jmpl %l1, %l0
	fmovsgu	%xcc,	%f17,	%f29
	ble,pt	%icc,	loop_985
	fornot2	%f8,	%f20,	%f30
loop_984:
	edge8l	%g1,	%o3,	%l6
	fmul8x16	%f6,	%f12,	%f0
loop_985:
	sllx	%i1,	0x14,	%g2
	taddcctv	%o6,	0x0272,	%o4
	nop
	setx	loop_986,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tneg	%xcc,	0x1
	call	loop_987
	tne	%icc,	0x2
loop_986:
	swap	[%l7 + 0x20],	%g3
	sdiv	%l3,	0x0FF0,	%l4
loop_987:
	tleu	%xcc,	0x3
	brnz,a	%i3,	loop_988
	ba,a,pt	%icc,	loop_989
	sir	0x129E
	movpos	%icc,	%i4,	%l1
loop_988:
	xnorcc	%o2,	%g6,	%o0
loop_989:
	edge16n	%i2,	%g4,	%o5
	tpos	%icc,	0x2
	edge8l	%i7,	%o1,	%o7
	edge8ln	%g5,	%l2,	%i6
	array8	%l5,	%i0,	%i5
	fmovsge	%xcc,	%f16,	%f7
	edge8	%g7,	%g1,	%o3
	fmovd	%f8,	%f0
	fmovsgu	%icc,	%f27,	%f15
	smulcc	%l6,	0x1BBF,	%i1
	movne	%icc,	%g2,	%o6
	brnz,a	%l0,	loop_990
	nop
	fitod	%f4,	%f24
	fdtos	%f24,	%f29
	fbu	%fcc2,	loop_991
	addccc	%g3,	%o4,	%l4
loop_990:
	bl,a	%xcc,	loop_992
	fnot1	%f4,	%f10
loop_991:
	fpadd16s	%f10,	%f6,	%f6
	flush	%l7 + 0x1C
loop_992:
	movrlez	%i3,	0x116,	%i4
	movleu	%xcc,	%l3,	%o2
	nop
	fitos	%f2,	%f27
	fstox	%f27,	%f14
	fxtos	%f14,	%f31
	ta	%xcc,	0x0
	edge16	%g6,	%o0,	%i2
	fsrc1	%f8,	%f14
	movrgez	%l1,	%o5,	%g4
	udivcc	%o1,	0x0B88,	%i7
	fandnot1s	%f17,	%f19,	%f12
	taddcc	%o7,	%g5,	%l2
	alignaddrl	%l5,	%i0,	%i5
	bvs	%icc,	loop_993
	orn	%i6,	0x19B0,	%g1
	te	%xcc,	0x4
	tneg	%xcc,	0x7
loop_993:
	nop
	fitos	%f2,	%f14
	fstod	%f14,	%f20
	fmovrsgz	%o3,	%f25,	%f4
	fmovrsne	%l6,	%f19,	%f15
	tne	%icc,	0x4
	fmovdcs	%icc,	%f22,	%f30
	bneg,pt	%icc,	loop_994
	fmovse	%xcc,	%f6,	%f1
	tvc	%icc,	0x4
	edge16ln	%i1,	%g2,	%o6
loop_994:
	subc	%g7,	%l0,	%g3
	fmovsge	%xcc,	%f17,	%f17
	stbar
	bleu,pn	%icc,	loop_995
	movcs	%xcc,	%l4,	%i3
	fnot2s	%f29,	%f12
	addcc	%i4,	0x1EFC,	%o4
loop_995:
	tneg	%icc,	0x1
	tn	%icc,	0x7
	addcc	%o2,	%l3,	%o0
	fbn	%fcc0,	loop_996
	edge32n	%i2,	%g6,	%l1
	brgz,a	%o5,	loop_997
	fbuge,a	%fcc3,	loop_998
loop_996:
	membar	0x07
	array32	%g4,	%i7,	%o7
loop_997:
	movrgez	%g5,	0x0F7,	%o1
loop_998:
	movpos	%icc,	%l2,	%l5
	fmovd	%f18,	%f2
	set	0x0C, %o2
	lda	[%l7 + %o2] 0x14,	%f16
	movg	%icc,	%i5,	%i0
	wr	%g0,	0x10,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	edge8l	%i6,	%g1,	%o3
	edge16n	%i1,	%g2,	%o6
	fpackfix	%f26,	%f31
	fors	%f17,	%f26,	%f11
	edge16n	%l6,	%l0,	%g7
	sra	%g3,	0x0A,	%l4
	fbule,a	%fcc2,	loop_999
	movre	%i3,	%i4,	%o4
	or	%l3,	%o2,	%i2
	wr	%g0,	0x2b,	%asi
	ldda	[%l7 + 0x70] %asi,	%g6
loop_999:
	umul	%o0,	0x1882,	%l1
	tle	%icc,	0x6
	orncc	%g4,	0x179B,	%o5
	fmovsn	%xcc,	%f14,	%f15
	bge	%icc,	loop_1000
	fmovrdne	%i7,	%f18,	%f26
	fbn	%fcc3,	loop_1001
	fnegd	%f24,	%f16
loop_1000:
	umul	%g5,	%o1,	%o7
	bcs	loop_1002
loop_1001:
	movge	%xcc,	%l2,	%l5
	udivx	%i5,	0x1FD8,	%i0
	srlx	%g1,	0x00,	%i6
loop_1002:
	movne	%xcc,	%o3,	%i1
	bge	loop_1003
	subccc	%g2,	0x0C64,	%l6
	mulscc	%o6,	0x076E,	%l0
	xnorcc	%g7,	0x0774,	%g3
loop_1003:
	fmovsgu	%icc,	%f23,	%f16
	sdivcc	%l4,	0x1338,	%i3
	xnor	%o4,	%i4,	%o2
	fsrc1	%f30,	%f4
	fbuge,a	%fcc3,	loop_1004
	fmovdgu	%xcc,	%f14,	%f6
	movn	%xcc,	%i2,	%g6
	tcc	%icc,	0x3
loop_1004:
	bneg,a,pt	%icc,	loop_1005
	fbul	%fcc3,	loop_1006
	brlez,a	%o0,	loop_1007
	bg,a,pn	%xcc,	loop_1008
loop_1005:
	fmovsa	%icc,	%f1,	%f1
loop_1006:
	fnand	%f4,	%f0,	%f22
loop_1007:
	subc	%l1,	%l3,	%o5
loop_1008:
	tleu	%xcc,	0x5
	sir	0x0ED6
	set	0x48, %g4
	ldsha	[%l7 + %g4] 0x04,	%g4
	stw	%g5,	[%l7 + 0x30]
	nop
	setx	0x9FB50F70,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f12
	setx	0x369C5339,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f29
	fsubs	%f29,	%f12,	%f12
	taddcc	%i7,	%o1,	%o7
	tcc	%icc,	0x3
	set	0x36, %g3
	ldstuba	[%l7 + %g3] 0x80,	%l5
	edge32l	%i5,	%l2,	%i0
	udivcc	%i6,	0x1D6E,	%g1
	add	%l7,	0x70,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%o3
	casxa	[%l6] 0x80,	%o3,	%i1
	ldstub	[%l7 + 0x12],	%g2
	xnorcc	%o6,	%l6,	%l0
	set	0x20, %i0
	swapa	[%l7 + %i0] 0x80,	%g3
	ldd	[%l7 + 0x38],	%f18
	smulcc	%g7,	%l4,	%o4
	edge32n	%i4,	%o2,	%i2
	edge8	%i3,	%g6,	%o0
	movvs	%icc,	%l3,	%l1
	tvc	%icc,	0x5
	array32	%o5,	%g5,	%g4
	sll	%i7,	%o1,	%l5
	edge16ln	%i5,	%l2,	%i0
	add	%l7,	0x4C,	%l6
	wr	%g0,	0x04,	%asi
	lda	[%l6] %asi,	%i6
	casa	[%l6] 0x04,	%i6,	%o7
	tne	%xcc,	0x2
	addc	%o3,	0x04DF,	%i1
	ld	[%l7 + 0x4C],	%f12
	tneg	%xcc,	0x3
	sdiv	%g2,	0x1A81,	%g1
	mulscc	%l6,	%o6,	%l0
	srl	%g7,	%g3,	%l4
	tvc	%icc,	0x3
	fbne,a	%fcc2,	loop_1009
	bvc,a	loop_1010
	edge16	%o4,	%o2,	%i4
	srlx	%i2,	0x15,	%g6
loop_1009:
	nop
	wr	%g0,	0x27,	%asi
	ldda	[%l7 + 0x50] %asi,	%i2
loop_1010:
	addcc	%o0,	%l3,	%l1
	fpsub16	%f12,	%f28,	%f26
	subc	%g5,	0x13F4,	%g4
	stb	%o5,	[%l7 + 0x10]
	prefetch	[%l7 + 0x64],	 0x1
	movg	%xcc,	%o1,	%i7
	ldsb	[%l7 + 0x4F],	%i5
	fmovdcc	%xcc,	%f29,	%f11
	fornot1	%f0,	%f20,	%f8
	nop
	setx	0x0DB36280,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f19
	setx	0x1048221B,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f7
	fdivs	%f7,	%f19,	%f13
	nop
	fitos	%f3,	%f7
	fstox	%f7,	%f6
	subccc	%l5,	%i0,	%i6
	fxnor	%f14,	%f22,	%f14
	brlz,a	%o7,	loop_1011
	ldd	[%l7 + 0x18],	%f0
	nop
	setx	0x7111C6BE,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f23
	setx	0x3012479D,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f8
	fmuls	%f8,	%f23,	%f6
	subcc	%l2,	0x109B,	%o3
loop_1011:
	mova	%icc,	%g2,	%i1
	set	0x60, %l4
	swapa	[%l7 + %l4] 0x0c,	%l6
	orncc	%g1,	0x03BD,	%l0
	sra	%o6,	0x19,	%g7
	edge8n	%l4,	%o4,	%g3
	edge32n	%o2,	%i2,	%i4
	set	0x1D, %i7
	ldstuba	[%l7 + %i7] 0x81,	%g6
	edge8	%o0,	%l3,	%l1
	fors	%f25,	%f18,	%f6
	xnor	%i3,	0x14E5,	%g5
	ba,a	%xcc,	loop_1012
	movvc	%xcc,	%o5,	%o1
	add	%g4,	%i5,	%l5
	nop
	setx	0x3793826C,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f27
	setx	0x850DA6CE,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f16
	fdivs	%f16,	%f27,	%f6
loop_1012:
	orn	%i0,	0x0B32,	%i7
	stbar
	sra	%o7,	%i6,	%l2
	ldstub	[%l7 + 0x61],	%o3
	te	%icc,	0x2
	andncc	%i1,	%l6,	%g1
	tpos	%xcc,	0x4
	movvs	%xcc,	%l0,	%o6
	membar	0x4A
	andcc	%g2,	%g7,	%o4
	edge16l	%l4,	%o2,	%i2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnor	%i4,	0x19DB,	%g6
	set	0x4A, %o1
	ldsha	[%l7 + %o1] 0x19,	%o0
	srl	%l3,	%l1,	%g3
	fnot2s	%f0,	%f6
	subcc	%g5,	0x104E,	%o5
	addc	%i3,	%g4,	%o1
	fmovrsgez	%l5,	%f30,	%f14
	movrlez	%i0,	%i5,	%o7
	fandnot1	%f6,	%f10,	%f30
	ldd	[%l7 + 0x60],	%i6
	fmovse	%icc,	%f14,	%f0
	lduw	[%l7 + 0x34],	%l2
	ldd	[%l7 + 0x30],	%f6
	smul	%o3,	0x0F66,	%i1
	xor	%l6,	0x1555,	%i7
	edge32l	%g1,	%o6,	%l0
	movn	%xcc,	%g2,	%o4
	bvc,a,pt	%icc,	loop_1013
	mova	%xcc,	%l4,	%g7
	srax	%o2,	%i4,	%g6
	fsrc2s	%f22,	%f28
loop_1013:
	tneg	%icc,	0x5
	fxor	%f0,	%f0,	%f30
	movrne	%o0,	%i2,	%l3
	ld	[%l7 + 0x48],	%f15
	edge16n	%g3,	%g5,	%l1
	fbg,a	%fcc1,	loop_1014
	movleu	%xcc,	%i3,	%g4
	andcc	%o5,	%o1,	%l5
	tg	%icc,	0x3
loop_1014:
	fmovda	%icc,	%f17,	%f0
	orn	%i0,	0x03D8,	%o7
	brgz,a	%i6,	loop_1015
	tg	%xcc,	0x5
	movl	%icc,	%i5,	%o3
	srl	%l2,	0x1A,	%l6
loop_1015:
	movne	%xcc,	%i1,	%g1
	fmovrdgez	%o6,	%f20,	%f10
	movgu	%xcc,	%l0,	%g2
	ld	[%l7 + 0x64],	%f9
	tpos	%icc,	0x7
	nop
	fitod	%f4,	%f22
	subccc	%i7,	%o4,	%g7
	movleu	%icc,	%l4,	%o2
	fmovsn	%xcc,	%f17,	%f15
	ldub	[%l7 + 0x32],	%i4
	umul	%o0,	0x11A7,	%i2
	nop
	setx	0x5329BDAFEBDC634A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	fsqrtd	%f16,	%f22
	movne	%icc,	%l3,	%g3
	lduw	[%l7 + 0x28],	%g5
	lduh	[%l7 + 0x40],	%g6
	set	0x40, %g7
	ldda	[%l7 + %g7] 0x0c,	%f16
	prefetch	[%l7 + 0x78],	 0x3
	movgu	%xcc,	%l1,	%i3
	fbg	%fcc0,	loop_1016
	te	%xcc,	0x6
	edge8n	%g4,	%o5,	%l5
	ldstub	[%l7 + 0x69],	%i0
loop_1016:
	edge16n	%o7,	%o1,	%i6
	smul	%o3,	%l2,	%i5
	xorcc	%l6,	%g1,	%i1
	ldx	[%l7 + 0x70],	%o6
	edge8l	%g2,	%l0,	%i7
	te	%icc,	0x5
	set	0x36, %o5
	lduba	[%l7 + %o5] 0x11,	%g7
	umul	%l4,	%o4,	%i4
	sub	%o0,	0x063B,	%i2
	movrgez	%l3,	0x0FB,	%g3
	nop
	fitos	%f3,	%f26
	fstoi	%f26,	%f28
	movg	%xcc,	%o2,	%g6
	fmovsvc	%xcc,	%f22,	%f24
	mulscc	%g5,	0x099D,	%l1
	movcc	%icc,	%g4,	%o5
	swap	[%l7 + 0x0C],	%i3
	alignaddr	%i0,	%l5,	%o1
	xnor	%i6,	%o7,	%l2
	movrlz	%i5,	0x35F,	%o3
	tle	%xcc,	0x6
	movre	%g1,	%l6,	%i1
	movre	%o6,	0x249,	%l0
	orn	%i7,	0x1DA0,	%g7
	fpack32	%f8,	%f14,	%f18
	for	%f30,	%f24,	%f28
	smul	%g2,	%o4,	%i4
	tne	%icc,	0x3
	tpos	%xcc,	0x1
	array8	%l4,	%i2,	%o0
	alignaddrl	%l3,	%o2,	%g3
	bcc,a	%icc,	loop_1017
	xnor	%g5,	0x0D38,	%g6
	edge8n	%l1,	%g4,	%i3
	ldsw	[%l7 + 0x7C],	%i0
loop_1017:
	fors	%f11,	%f29,	%f8
	fpsub16	%f14,	%f16,	%f8
	sdivx	%o5,	0x1278,	%l5
	fmovdneg	%icc,	%f4,	%f29
	fcmpeq32	%f4,	%f30,	%i6
	nop
	setx	loop_1018,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fmovrse	%o7,	%f7,	%f22
	bn,a,pn	%icc,	loop_1019
	edge16	%l2,	%i5,	%o3
loop_1018:
	mulx	%o1,	%g1,	%l6
	movvc	%xcc,	%o6,	%i1
loop_1019:
	nop
	setx	0x30F19C1E2A6BC6B2,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0x40D08D9DA628A6FA,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	fdivd	%f22,	%f6,	%f10
	tcs	%xcc,	0x6
	flush	%l7 + 0x20
	movre	%l0,	%g7,	%i7
	movcs	%xcc,	%o4,	%g2
	fmovdvs	%xcc,	%f30,	%f15
	and	%l4,	0x0802,	%i2
	prefetch	[%l7 + 0x5C],	 0x2
	nop
	setx	0xA8A5490A090745DD,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0x1E71905518026B23,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	fmuld	%f16,	%f16,	%f30
	st	%f0,	[%l7 + 0x14]
	nop
	setx loop_1020, %l0, %l1
	jmpl %l1, %i4
	tvc	%xcc,	0x6
	bshuffle	%f14,	%f18,	%f16
	movrlz	%l3,	0x00F,	%o2
loop_1020:
	fmovsn	%xcc,	%f10,	%f1
	movcc	%icc,	%o0,	%g3
	andcc	%g6,	0x0945,	%g5
	te	%xcc,	0x1
	tle	%icc,	0x0
	movrlz	%g4,	0x320,	%l1
	tvs	%xcc,	0x4
	flush	%l7 + 0x40
	bgu,a	%icc,	loop_1021
	sth	%i0,	[%l7 + 0x1C]
	sdiv	%o5,	0x0CC8,	%l5
	sub	%i3,	0x187E,	%i6
loop_1021:
	sll	%o7,	0x05,	%i5
	sdiv	%o3,	0x041B,	%l2
	andn	%o1,	%g1,	%l6
	fmovdg	%xcc,	%f4,	%f11
	set	0x2C, %o7
	lda	[%l7 + %o7] 0x14,	%f6
	tneg	%xcc,	0x0
	flush	%l7 + 0x0C
	fmovsleu	%icc,	%f0,	%f23
	fba,a	%fcc0,	loop_1022
	bg,pn	%xcc,	loop_1023
	edge32ln	%o6,	%i1,	%l0
	wr	%g0,	0x88,	%asi
	lduwa	[%l7 + 0x30] %asi,	%i7
loop_1022:
	membar	0x59
loop_1023:
	smul	%o4,	%g2,	%l4
	andncc	%i2,	%g7,	%l3
	movrne	%o2,	0x30E,	%o0
	brnz,a	%g3,	loop_1024
	array8	%g6,	%g5,	%g4
	fcmple16	%f20,	%f14,	%i4
	ta	%xcc,	0x0
loop_1024:
	mulx	%i0,	%l1,	%o5
	nop
	setx	loop_1025,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fbu	%fcc0,	loop_1026
	orn	%l5,	0x1B67,	%i6
	ld	[%l7 + 0x30],	%f5
loop_1025:
	fbn,a	%fcc3,	loop_1027
loop_1026:
	srl	%o7,	0x08,	%i5
	movpos	%icc,	%i3,	%o3
	bvs,pt	%icc,	loop_1028
loop_1027:
	edge8ln	%l2,	%g1,	%l6
	edge32ln	%o6,	%o1,	%i1
	movrgz	%l0,	%o4,	%i7
loop_1028:
	fbug	%fcc1,	loop_1029
	fcmpeq16	%f12,	%f28,	%l4
	bcc,a	loop_1030
	fbul,a	%fcc2,	loop_1031
loop_1029:
	nop
	setx	0x8ACAABEE,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f12
	setx	0x3FEEBB64,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f16
	fsubs	%f16,	%f12,	%f22
	sdivcc	%i2,	0x1710,	%g7
loop_1030:
	ba,a	loop_1032
loop_1031:
	tl	%xcc,	0x7
	stbar
	ldub	[%l7 + 0x25],	%l3
loop_1032:
	movleu	%xcc,	%o2,	%g2
	fbge	%fcc3,	loop_1033
	tle	%xcc,	0x0
	stb	%o0,	[%l7 + 0x6C]
	nop
	setx loop_1034, %l0, %l1
	jmpl %l1, %g3
loop_1033:
	brlz	%g5,	loop_1035
	subccc	%g6,	%i4,	%g4
	fbe,a	%fcc2,	loop_1036
loop_1034:
	udivx	%l1,	0x12FA,	%i0
loop_1035:
	tle	%xcc,	0x7
	nop
	fitos	%f0,	%f21
	fstoi	%f21,	%f16
loop_1036:
	umulcc	%l5,	0x1B0B,	%i6
	fmuld8sux16	%f3,	%f5,	%f14
	ldd	[%l7 + 0x18],	%f24
	movcc	%xcc,	%o5,	%o7
	movre	%i5,	0x0F8,	%i3
	movleu	%xcc,	%l2,	%g1
	bleu,a,pt	%icc,	loop_1037
	array32	%l6,	%o3,	%o6
	fmovdne	%xcc,	%f23,	%f8
	fnot1	%f18,	%f6
loop_1037:
	nop
	set	0x40, %o0
	prefetcha	[%l7 + %o0] 0x81,	 0x3
	bge	%icc,	loop_1038
	srlx	%l0,	0x1E,	%o1
	taddcctv	%i7,	0x08C0,	%l4
	orn	%i2,	%o4,	%g7
loop_1038:
	nop
	wr	%g0,	0x11,	%asi
	sta	%f21,	[%l7 + 0x14] %asi
	te	%xcc,	0x2
	xnor	%o2,	0x06EB,	%g2
	xnorcc	%l3,	0x1EE5,	%g3
	fmovda	%icc,	%f1,	%f15
	edge8	%g5,	%g6,	%i4
	edge32l	%g4,	%o0,	%l1
	edge32ln	%l5,	%i6,	%o5
	fpadd32	%f2,	%f4,	%f12
	std	%f10,	[%l7 + 0x58]
	orncc	%o7,	%i5,	%i3
	umulcc	%l2,	0x0162,	%i0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array16	%l6,	%o3,	%o6
	fxnors	%f20,	%f31,	%f24
	fnot1s	%f20,	%f26
	tsubcctv	%i1,	%l0,	%g1
	array16	%i7,	%l4,	%i2
	movvc	%icc,	%o1,	%o4
	set	0x34, %l2
	lda	[%l7 + %l2] 0x11,	%f3
	fcmpne32	%f22,	%f8,	%g7
	tn	%icc,	0x2
	or	%o2,	%g2,	%l3
	movgu	%icc,	%g5,	%g3
	mulx	%i4,	%g4,	%o0
	fnegs	%f30,	%f22
	movrlez	%g6,	%l5,	%l1
	sir	0x12ED
	movvc	%icc,	%i6,	%o5
	stb	%o7,	[%l7 + 0x75]
	fornot1s	%f27,	%f9,	%f11
	sll	%i3,	%i5,	%i0
	fsrc2	%f28,	%f2
	tneg	%icc,	0x1
	prefetch	[%l7 + 0x24],	 0x3
	set	0x50, %o3
	sta	%f29,	[%l7 + %o3] 0x15
	movvs	%xcc,	%l2,	%o3
	lduh	[%l7 + 0x74],	%l6
	stb	%i1,	[%l7 + 0x3A]
	tne	%icc,	0x7
	bcs,pt	%icc,	loop_1039
	fmul8sux16	%f14,	%f8,	%f20
	fbg	%fcc1,	loop_1040
	subccc	%l0,	0x16F0,	%g1
loop_1039:
	fpadd16s	%f4,	%f12,	%f5
	subc	%i7,	%o6,	%l4
loop_1040:
	fmul8x16al	%f4,	%f29,	%f6
	nop
	set	0x20, %l6
	stx	%i2,	[%l7 + %l6]
	fmovrdlez	%o4,	%f18,	%f16
	fxnor	%f20,	%f10,	%f8
	fmovrdgz	%g7,	%f0,	%f18
	udiv	%o1,	0x1CBA,	%o2
	udivcc	%g2,	0x18F5,	%g5
	ldsb	[%l7 + 0x7A],	%g3
	fmovsneg	%xcc,	%f26,	%f9
	tg	%xcc,	0x5
	movrlz	%l3,	0x352,	%i4
	taddcctv	%o0,	%g4,	%g6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	be,a	loop_1041
	srlx	%l5,	0x0B,	%l1
	sdivcc	%o5,	0x1826,	%i6
	ldstub	[%l7 + 0x3C],	%o7
loop_1041:
	stw	%i5,	[%l7 + 0x10]
	movpos	%icc,	%i3,	%l2
	fcmpgt32	%f16,	%f12,	%i0
	subcc	%l6,	%o3,	%i1
	nop
	setx	0x03B4FFDB,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f11
	setx	0xF41C6C4D,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f21
	fsubs	%f21,	%f11,	%f21
	edge16n	%g1,	%i7,	%o6
	smul	%l0,	0x0391,	%l4
	sllx	%o4,	%g7,	%o1
	fmovsvc	%icc,	%f15,	%f2
	fzeros	%f29
	movneg	%icc,	%i2,	%o2
	fmul8x16au	%f6,	%f21,	%f6
	fpack16	%f16,	%f10
	membar	0x68
	movpos	%icc,	%g5,	%g3
	fmovrde	%l3,	%f26,	%f14
	fmovdn	%xcc,	%f0,	%f29
	fmovse	%xcc,	%f13,	%f0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	faligndata	%f8,	%f24,	%f16
	udivx	%i4,	0x1E7E,	%g2
	sdiv	%o0,	0x0365,	%g6
	fbul	%fcc1,	loop_1042
	fmovrsne	%g4,	%f9,	%f0
	fbul,a	%fcc3,	loop_1043
	movrgz	%l1,	%l5,	%o5
loop_1042:
	movg	%xcc,	%i6,	%i5
	nop
	fitod	%f6,	%f16
	fdtox	%f16,	%f22
	fxtod	%f22,	%f26
loop_1043:
	movgu	%icc,	%i3,	%o7
	brgez	%l2,	loop_1044
	movrlez	%i0,	0x399,	%o3
	brgez,a	%l6,	loop_1045
	ldx	[%l7 + 0x30],	%g1
loop_1044:
	tle	%icc,	0x1
	tgu	%icc,	0x6
loop_1045:
	nop
	set	0x30, %g6
	ldxa	[%g0 + %g6] 0x58,	%i7
	membar	0x24
	bgu	loop_1046
	fabss	%f25,	%f1
	smulcc	%i1,	0x15F1,	%l0
	ldstub	[%l7 + 0x5E],	%o6
loop_1046:
	bvc,pn	%icc,	loop_1047
	tle	%xcc,	0x2
	sir	0x13C6
	nop
	setx	0x27C9969BD2778A43,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0x96CC9254361467B0,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	fdivd	%f20,	%f24,	%f24
loop_1047:
	nop
	fitos	%f8,	%f31
	fstoi	%f31,	%f30
	movpos	%icc,	%o4,	%g7
	fmovsle	%xcc,	%f22,	%f1
	tpos	%xcc,	0x3
	popc	%o1,	%l4
	fbule,a	%fcc1,	loop_1048
	movneg	%xcc,	%i2,	%o2
	fmovdcs	%xcc,	%f12,	%f2
	bcs	loop_1049
loop_1048:
	tpos	%icc,	0x0
	edge32	%g5,	%l3,	%i4
	sth	%g3,	[%l7 + 0x64]
loop_1049:
	fandnot2	%f26,	%f8,	%f18
	sub	%g2,	0x190B,	%o0
	movn	%xcc,	%g6,	%g4
	fxors	%f9,	%f11,	%f9
	ble,a	loop_1050
	sub	%l5,	%l1,	%o5
	tvc	%icc,	0x4
	sllx	%i5,	0x0D,	%i6
loop_1050:
	fbule	%fcc0,	loop_1051
	fnors	%f28,	%f18,	%f29
	alignaddrl	%o7,	%i3,	%i0
	bleu,pt	%xcc,	loop_1052
loop_1051:
	movl	%xcc,	%o3,	%l2
	edge32	%g1,	%i7,	%i1
	orn	%l0,	0x0085,	%l6
loop_1052:
	fnor	%f24,	%f18,	%f0
	andncc	%o6,	%o4,	%g7
	addcc	%o1,	0x0C62,	%i2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andcc	%o2,	0x0F8B,	%g5
	addc	%l3,	%l4,	%g3
	sir	0x06AD
	fzero	%f26
	or	%i4,	0x1DA1,	%g2
	tle	%xcc,	0x3
	nop
	fitos	%f3,	%f8
	fstox	%f8,	%f14
	wr	%g0,	0x0c,	%asi
	ldswa	[%l7 + 0x0C] %asi,	%o0
	sdivx	%g4,	0x1D6E,	%g6
	andcc	%l5,	0x15C9,	%l1
	add	%o5,	%i5,	%i6
	edge16	%o7,	%i3,	%o3
	membar	0x4D
	tsubcctv	%i0,	%g1,	%l2
	fabss	%f24,	%f12
	fandnot2s	%f28,	%f24,	%f19
	tneg	%icc,	0x2
	movge	%xcc,	%i1,	%i7
	array8	%l0,	%o6,	%o4
	fmovde	%xcc,	%f14,	%f16
	alignaddr	%g7,	%o1,	%l6
	edge8l	%i2,	%g5,	%l3
	nop
	fitod	%f10,	%f16
	fdtox	%f16,	%f24
	sir	0x1151
	fbu	%fcc0,	loop_1053
	xnor	%l4,	0x0696,	%o2
	fmul8x16au	%f9,	%f24,	%f18
	movvc	%icc,	%g3,	%g2
loop_1053:
	tn	%xcc,	0x1
	membar	0x6C
	orn	%o0,	0x0734,	%g4
	movrne	%g6,	0x29C,	%l5
	wr	%g0,	0x88,	%asi
	lduha	[%l7 + 0x20] %asi,	%l1
	sdiv	%o5,	0x031A,	%i4
	movvs	%icc,	%i6,	%o7
	set	0x70, %i6
	ldxa	[%l7 + %i6] 0x89,	%i5
	sdivx	%o3,	0x012F,	%i0
	sdivcc	%g1,	0x0656,	%i3
	movpos	%xcc,	%l2,	%i1
	movl	%icc,	%l0,	%o6
	orn	%i7,	%g7,	%o4
	bleu	loop_1054
	st	%f17,	[%l7 + 0x3C]
	fmovse	%xcc,	%f25,	%f23
	nop
	setx	0x32D82630E9E51D63,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	fsqrtd	%f30,	%f16
loop_1054:
	nop
	set	0x60, %l5
	lda	[%l7 + %l5] 0x14,	%f3
	popc	%l6,	%o1
	edge16n	%i2,	%l3,	%l4
	orn	%o2,	0x1DCD,	%g5
	ldsh	[%l7 + 0x6A],	%g3
	set	0x68, %i4
	sta	%f4,	[%l7 + %i4] 0x18
	wr	%g0,	0x10,	%asi
	stba	%o0,	[%l7 + 0x24] %asi
	nop
	fitod	%f8,	%f12
	fdtos	%f12,	%f16
	te	%icc,	0x2
	srax	%g2,	%g4,	%l5
	set	0x30, %g1
	ldda	[%l7 + %g1] 0x10,	%g6
	edge32l	%l1,	%o5,	%i4
	fmovdleu	%xcc,	%f0,	%f2
	nop
	setx loop_1055, %l0, %l1
	jmpl %l1, %i6
	te	%icc,	0x7
	or	%o7,	%i5,	%o3
	bneg,a,pt	%icc,	loop_1056
loop_1055:
	nop
	setx	0x452FE49E2DC20AC9,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0x73A75188D7B19774,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	fsubd	%f14,	%f16,	%f4
	movrlez	%i0,	0x173,	%i3
	tvs	%icc,	0x1
loop_1056:
	or	%l2,	0x0832,	%i1
	flush	%l7 + 0x20
	set	0x08, %l0
	ldswa	[%l7 + %l0] 0x14,	%l0
	st	%f3,	[%l7 + 0x30]
	andn	%o6,	%g1,	%g7
	tge	%icc,	0x2
	xor	%i7,	0x0D68,	%o4
	fbge,a	%fcc0,	loop_1057
	fbo	%fcc2,	loop_1058
	brgez,a	%l6,	loop_1059
	fpadd32	%f24,	%f14,	%f0
loop_1057:
	nop
	setx	0xFAD382304041CAC8,	%l0,	%l6
	stx	%l6,	[%l7 + 0x18]
	ldx	[%l7 + 0x18],	%fsr
loop_1058:
	nop
	fitod	%f2,	%f8
	fdtox	%f8,	%f10
	fxtod	%f10,	%f30
loop_1059:
	edge8l	%o1,	%i2,	%l4
	stx	%l3,	[%l7 + 0x18]
	fbuge,a	%fcc3,	loop_1060
	xnor	%o2,	%g5,	%g3
	be,pt	%icc,	loop_1061
	stx	%g2,	[%l7 + 0x08]
loop_1060:
	nop
	wr	%g0,	0x10,	%asi
	lduha	[%l7 + 0x66] %asi,	%g4
loop_1061:
	fmovdg	%xcc,	%f27,	%f4
	tne	%icc,	0x6
	edge32	%l5,	%o0,	%l1
	tsubcc	%g6,	%i4,	%i6
	smul	%o5,	%i5,	%o7
	tvs	%icc,	0x7
	edge16ln	%o3,	%i3,	%l2
	bge,a	loop_1062
	fors	%f11,	%f11,	%f22
	edge32ln	%i1,	%l0,	%i0
	xorcc	%o6,	%g1,	%g7
loop_1062:
	fbo,a	%fcc0,	loop_1063
	srl	%i7,	0x09,	%l6
	fble	%fcc2,	loop_1064
	stbar
loop_1063:
	umulcc	%o1,	%i2,	%o4
	set	0x08, %i3
	stwa	%l3,	[%l7 + %i3] 0x04
loop_1064:
	nop
	fitos	%f19,	%f6
	brz	%l4,	loop_1065
	be,a	%xcc,	loop_1066
	st	%f7,	[%l7 + 0x34]
	ldsb	[%l7 + 0x15],	%g5
loop_1065:
	fbge	%fcc2,	loop_1067
loop_1066:
	xnorcc	%o2,	0x01D1,	%g3
	bne	%xcc,	loop_1068
	or	%g2,	0x14C2,	%l5
loop_1067:
	movn	%xcc,	%g4,	%o0
	fmovrsne	%g6,	%f24,	%f12
loop_1068:
	nop
	set	0x54, %g2
	stha	%l1,	[%l7 + %g2] 0x81
	brz	%i6,	loop_1069
	nop
	fitos	%f29,	%f4
	orcc	%i4,	%o5,	%o7
	tsubcctv	%o3,	0x1E8E,	%i3
loop_1069:
	edge32ln	%l2,	%i5,	%i1
	ldd	[%l7 + 0x78],	%i0
	smul	%l0,	0x1B17,	%g1
	nop
	setx	0x90762F23,	%l0,	%l6
	st	%l6,	[%l7 + 0x58]
	ld	[%l7 + 0x58],	%fsr
	fbg,a	%fcc2,	loop_1070
	sll	%o6,	%g7,	%i7
	sdivx	%o1,	0x001D,	%i2
	edge32	%o4,	%l3,	%l6
loop_1070:
	movn	%xcc,	%g5,	%o2
	edge32	%l4,	%g2,	%l5
	sllx	%g4,	%o0,	%g3
	fmovdvc	%xcc,	%f29,	%f18
	bge,pn	%icc,	loop_1071
	subc	%l1,	0x11AC,	%i6
	call	loop_1072
	ble,a,pn	%icc,	loop_1073
loop_1071:
	tgu	%icc,	0x2
	bg	loop_1074
loop_1072:
	tgu	%icc,	0x6
loop_1073:
	fmovscs	%icc,	%f13,	%f0
	brnz,a	%g6,	loop_1075
loop_1074:
	tleu	%xcc,	0x3
	fmovrdgz	%o5,	%f6,	%f12
	edge32l	%o7,	%o3,	%i4
loop_1075:
	tn	%icc,	0x0
	fbge	%fcc3,	loop_1076
	membar	0x00
	movl	%icc,	%i3,	%l2
	movcs	%icc,	%i1,	%i5
loop_1076:
	tl	%xcc,	0x2
	tleu	%icc,	0x5
	fpack16	%f28,	%f11
	movneg	%icc,	%l0,	%i0
	movrlez	%o6,	%g7,	%g1
	smulcc	%i7,	0x1EA4,	%i2
	fbuge,a	%fcc3,	loop_1077
	nop
	setx	0x187E5E87,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f23
	fsqrts	%f23,	%f22
	movg	%icc,	%o4,	%l3
	tge	%icc,	0x6
loop_1077:
	smul	%l6,	%g5,	%o2
	movpos	%xcc,	%o1,	%l4
	be	%icc,	loop_1078
	fmovdneg	%icc,	%f15,	%f2
	set	0x60, %o4
	lduwa	[%l7 + %o4] 0x15,	%l5
loop_1078:
	nop
	set	0x1D, %g5
	stba	%g4,	[%l7 + %g5] 0x22
	membar	#Sync
	alignaddrl	%g2,	%o0,	%g3
	tgu	%xcc,	0x7
	smul	%l1,	%g6,	%o5
	movrlz	%i6,	%o3,	%o7
	fnot2s	%f12,	%f9
	tcc	%xcc,	0x3
	mulscc	%i3,	%i4,	%i1
	alignaddr	%l2,	%l0,	%i0
	fpsub16	%f28,	%f10,	%f24
	array16	%i5,	%g7,	%g1
	smulcc	%i7,	0x07C6,	%i2
	edge32ln	%o4,	%o6,	%l3
	movcc	%xcc,	%l6,	%g5
	mulscc	%o2,	%o1,	%l4
	movrgez	%l5,	%g4,	%o0
	array8	%g3,	%l1,	%g2
	bgu,pn	%xcc,	loop_1079
	array8	%g6,	%i6,	%o3
	tneg	%xcc,	0x5
	fbe	%fcc0,	loop_1080
loop_1079:
	umulcc	%o5,	%o7,	%i4
	pdist	%f14,	%f8,	%f10
	bgu,a	%icc,	loop_1081
loop_1080:
	fble	%fcc2,	loop_1082
	movl	%xcc,	%i3,	%i1
	fbge	%fcc2,	loop_1083
loop_1081:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1082:
	popc	0x1EB1,	%l2
	add	%i0,	0x0276,	%i5
loop_1083:
	nop
	wr	%g0,	0x11,	%asi
	ldsba	[%l7 + 0x3B] %asi,	%l0
	fmovsn	%xcc,	%f13,	%f19
	fnegd	%f4,	%f8
	or	%g7,	%i7,	%i2
	alignaddrl	%o4,	%o6,	%l3
	fblg	%fcc0,	loop_1084
	edge32l	%l6,	%g5,	%o2
	pdist	%f30,	%f26,	%f8
	membar	0x2A
loop_1084:
	srl	%o1,	%g1,	%l5
	udivx	%l4,	0x1682,	%g4
	fones	%f12
	tcs	%icc,	0x1
	edge16	%g3,	%l1,	%o0
	smul	%g2,	%g6,	%o3
	taddcctv	%i6,	%o5,	%i4
	udiv	%o7,	0x099A,	%i3
	fcmpeq16	%f2,	%f22,	%i1
	movcs	%icc,	%l2,	%i0
	fmovspos	%xcc,	%f13,	%f9
	fcmpne32	%f4,	%f2,	%l0
	movrlez	%i5,	%i7,	%i2
	fmovrslz	%o4,	%f14,	%f5
	sdiv	%g7,	0x0111,	%o6
	set	0x1D, %i5
	lduba	[%l7 + %i5] 0x14,	%l6
	bg,a	loop_1085
	tneg	%icc,	0x3
	movge	%icc,	%l3,	%g5
	nop
	setx	0xB05E6F3A,	%l0,	%l6
	st	%l6,	[%l7 + 0x20]
	ld	[%l7 + 0x20],	%fsr
loop_1085:
	ldsb	[%l7 + 0x10],	%o1
	tsubcctv	%g1,	%l5,	%l4
	nop
	setx	loop_1086,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	ldstub	[%l7 + 0x0E],	%o2
	edge8ln	%g4,	%g3,	%l1
	tleu	%icc,	0x5
loop_1086:
	fnors	%f30,	%f2,	%f16
	tsubcctv	%g2,	0x1E95,	%g6
	edge16n	%o3,	%i6,	%o0
	fmovrse	%o5,	%f21,	%f17
	mova	%xcc,	%o7,	%i4
	edge32n	%i3,	%l2,	%i1
	fbul,a	%fcc3,	loop_1087
	movneg	%icc,	%i0,	%l0
	fabss	%f1,	%f11
	fblg	%fcc0,	loop_1088
loop_1087:
	bcs,a,pt	%icc,	loop_1089
	move	%xcc,	%i5,	%i2
	xnorcc	%o4,	0x0767,	%i7
loop_1088:
	nop
	setx	0x3FFDDDFE41F9A96F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	fsqrtd	%f16,	%f22
loop_1089:
	movrlez	%g7,	0x09F,	%o6
	set	0x48, %o6
	ldsba	[%l7 + %o6] 0x0c,	%l6
	bvs,a	loop_1090
	andncc	%g5,	%o1,	%l3
	fnegd	%f12,	%f16
	xnorcc	%g1,	0x058F,	%l4
loop_1090:
	fnot2s	%f19,	%f21
	bshuffle	%f8,	%f20,	%f20
	orcc	%o2,	%g4,	%l5
	smul	%g3,	%l1,	%g2
	edge32	%g6,	%o3,	%i6
	tsubcctv	%o0,	0x0165,	%o5
	fbg,a	%fcc3,	loop_1091
	tsubcc	%i4,	0x1E66,	%o7
	movcs	%icc,	%l2,	%i1
	edge32	%i3,	%l0,	%i5
loop_1091:
	edge16l	%i0,	%i2,	%i7
	movl	%xcc,	%g7,	%o4
	tneg	%xcc,	0x7
	taddcctv	%l6,	0x1BF1,	%g5
	fnors	%f28,	%f5,	%f16
	tle	%icc,	0x1
	fxnor	%f20,	%f28,	%f24
	fbug	%fcc0,	loop_1092
	edge32	%o6,	%o1,	%g1
	stx	%l4,	[%l7 + 0x38]
	nop
	setx	loop_1093,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_1092:
	movrne	%l3,	%g4,	%l5
	bcc,pt	%icc,	loop_1094
	movge	%xcc,	%o2,	%l1
loop_1093:
	faligndata	%f22,	%f18,	%f16
	bvs	loop_1095
loop_1094:
	fmovrse	%g2,	%f28,	%f13
	movcc	%icc,	%g6,	%g3
	movvc	%icc,	%o3,	%i6
loop_1095:
	fbne	%fcc1,	loop_1096
	ldstub	[%l7 + 0x13],	%o5
	array16	%o0,	%i4,	%l2
	nop
	fitod	%f0,	%f28
	fdtoi	%f28,	%f18
loop_1096:
	nop
	setx	loop_1097,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	addc	%o7,	0x1A7F,	%i1
	tl	%icc,	0x3
	fmovdle	%icc,	%f11,	%f14
loop_1097:
	te	%icc,	0x7
	xor	%i3,	0x1219,	%l0
	xnor	%i5,	%i2,	%i0
	movl	%icc,	%g7,	%o4
	tge	%xcc,	0x0
	addc	%i7,	%g5,	%l6
	movgu	%xcc,	%o6,	%o1
	movrne	%l4,	%g1,	%g4
	nop
	setx	0xA3B14769B04F2E1C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x18]
	ldx	[%l7 + 0x18],	%fsr
	fmovdle	%xcc,	%f25,	%f30
	nop
	fitos	%f12,	%f19
	fstox	%f19,	%f20
	fxtos	%f20,	%f15
	xnorcc	%l3,	%o2,	%l1
	subc	%l5,	0x11D2,	%g2
	wr	%g0,	0x80,	%asi
	ldstuba	[%l7 + 0x0C] %asi,	%g6
	tg	%icc,	0x0
	subccc	%o3,	0x0581,	%g3
	movvc	%icc,	%o5,	%i6
	brlez	%i4,	loop_1098
	move	%icc,	%o0,	%o7
	edge16	%l2,	%i3,	%i1
	tsubcc	%i5,	0x1F38,	%i2
loop_1098:
	edge8ln	%l0,	%i0,	%o4
	brlez,a	%g7,	loop_1099
	fmovsge	%xcc,	%f21,	%f2
	fmul8x16	%f12,	%f26,	%f0
	ldd	[%l7 + 0x48],	%i6
loop_1099:
	edge32n	%g5,	%o6,	%o1
	sdivx	%l4,	0x1C3D,	%g1
	popc	0x01B7,	%g4
	fcmpgt16	%f6,	%f10,	%l3
	fpsub16s	%f9,	%f18,	%f25
	fnegs	%f8,	%f8
	movrne	%o2,	%l6,	%l5
	alignaddrl	%l1,	%g6,	%g2
	udiv	%o3,	0x0D55,	%o5
	edge16	%g3,	%i4,	%o0
	mulscc	%o7,	0x17DD,	%l2
	brlz	%i3,	loop_1100
	fexpand	%f29,	%f30
	fsrc2	%f16,	%f6
	stb	%i6,	[%l7 + 0x50]
loop_1100:
	edge8	%i5,	%i1,	%l0
	brz	%i0,	loop_1101
	fbu	%fcc3,	loop_1102
	call	loop_1103
	stw	%i2,	[%l7 + 0x58]
loop_1101:
	fzero	%f30
loop_1102:
	stw	%o4,	[%l7 + 0x38]
loop_1103:
	sethi	0x0DE7,	%i7
	movvc	%xcc,	%g7,	%g5
	fmovs	%f18,	%f26
	edge16l	%o6,	%l4,	%g1
	tvs	%icc,	0x4
	brnz	%o1,	loop_1104
	edge32n	%l3,	%o2,	%l6
	orncc	%g4,	0x1C5D,	%l5
	orncc	%l1,	0x12D4,	%g6
loop_1104:
	tvc	%icc,	0x3
	fblg,a	%fcc1,	loop_1105
	fpsub16s	%f7,	%f7,	%f31
	movpos	%icc,	%g2,	%o3
	add	%l7,	0x08,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%g3,	%i4
loop_1105:
	ta	%icc,	0x6
	move	%xcc,	%o0,	%o5
	fmovdvs	%xcc,	%f3,	%f26
	edge16	%o7,	%l2,	%i6
	fmovdneg	%xcc,	%f1,	%f14
	fcmpgt16	%f6,	%f20,	%i5
	movneg	%xcc,	%i1,	%l0
	ba	%xcc,	loop_1106
	popc	0x1BB4,	%i3
	fbn,a	%fcc3,	loop_1107
	edge8n	%i0,	%o4,	%i7
loop_1106:
	fbue,a	%fcc0,	loop_1108
	movvc	%xcc,	%g7,	%g5
loop_1107:
	ldd	[%l7 + 0x60],	%f0
	nop
	setx	0x1CC67959CF28A73C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	fsqrtd	%f16,	%f2
loop_1108:
	orn	%o6,	0x1333,	%i2
	nop
	setx	loop_1109,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	or	%l4,	%g1,	%l3
	te	%icc,	0x0
	array16	%o2,	%l6,	%o1
loop_1109:
	udivcc	%l5,	0x0488,	%l1
	set	0x45, %l1
	stba	%g4,	[%l7 + %l1] 0x81
	subccc	%g6,	%o3,	%g2
	fmovsn	%xcc,	%f28,	%f17
	alignaddrl	%g3,	%i4,	%o5
	tvs	%icc,	0x4
	fnegs	%f27,	%f26
	array16	%o7,	%l2,	%i6
	fmovrdgz	%o0,	%f12,	%f18
	fcmpeq32	%f18,	%f2,	%i5
	movle	%xcc,	%i1,	%i3
	nop
	setx	0xCB9606B8,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f23
	setx	0xAADEBFB9,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f11
	fmuls	%f11,	%f23,	%f23
	call	loop_1110
	brlez,a	%i0,	loop_1111
	fnor	%f20,	%f14,	%f0
	fnegs	%f25,	%f13
loop_1110:
	fmovscc	%icc,	%f23,	%f7
loop_1111:
	edge16	%o4,	%i7,	%l0
	sir	0x1E0C
	movvs	%xcc,	%g5,	%g7
	fcmpne16	%f18,	%f22,	%o6
	te	%xcc,	0x0
	tcs	%xcc,	0x6
	wr	%g0,	0xeb,	%asi
	stwa	%i2,	[%l7 + 0x50] %asi
	membar	#Sync
	movneg	%icc,	%l4,	%l3
	tg	%icc,	0x0
	and	%g1,	0x1F91,	%o2
	umul	%l6,	0x1AD9,	%l5
	st	%f28,	[%l7 + 0x64]
	set	0x0, %l3
	ldxa	[%g0 + %l3] 0x58,	%o1
	movcs	%icc,	%l1,	%g4
	fbn	%fcc0,	loop_1112
	brlez	%g6,	loop_1113
	bge,pt	%xcc,	loop_1114
	movcc	%xcc,	%g2,	%g3
loop_1112:
	nop
	wr	%g0,	0xe3,	%asi
	stwa	%o3,	[%l7 + 0x40] %asi
	membar	#Sync
loop_1113:
	sll	%o5,	%i4,	%l2
loop_1114:
	or	%o7,	%i6,	%i5
	membar	0x63
	wr	%g0,	0x89,	%asi
	lduba	[%l7 + 0x1A] %asi,	%i1
	fbl	%fcc3,	loop_1115
	taddcc	%i3,	%o0,	%i0
	popc	%i7,	%l0
	addc	%g5,	%o4,	%g7
loop_1115:
	taddcctv	%o6,	%i2,	%l4
	ba,a,pt	%xcc,	loop_1116
	addc	%g1,	0x0509,	%l3
	edge16l	%l6,	%o2,	%o1
	edge32	%l5,	%g4,	%g6
loop_1116:
	ldub	[%l7 + 0x77],	%g2
	edge8	%l1,	%o3,	%g3
	bl	%xcc,	loop_1117
	brlez,a	%o5,	loop_1118
	taddcctv	%i4,	0x1C25,	%l2
	edge8	%o7,	%i6,	%i5
loop_1117:
	nop
	set	0x40, %i2
	stda	%f16,	[%l7 + %i2] 0xf8
	membar	#Sync
loop_1118:
	fmovsn	%xcc,	%f13,	%f27
	movleu	%xcc,	%i1,	%o0
	tn	%icc,	0x1
	udivcc	%i0,	0x08D5,	%i7
	fcmpne16	%f30,	%f26,	%l0
	tge	%icc,	0x7
	tge	%xcc,	0x6
	subcc	%i3,	%g5,	%o4
	edge16n	%g7,	%i2,	%o6
	fmovdge	%icc,	%f7,	%f28
	xnorcc	%g1,	0x1269,	%l3
	subcc	%l6,	%l4,	%o1
	nop
	fitod	%f0,	%f18
	fdtox	%f18,	%f2
	fxtod	%f2,	%f12
	udiv	%l5,	0x102D,	%g4
	nop
	fitos	%f9,	%f22
	fstod	%f22,	%f18
	and	%o2,	%g6,	%g2
	sub	%o3,	%l1,	%o5
	tgu	%xcc,	0x3
	fmovdle	%icc,	%f7,	%f0
	addcc	%i4,	%g3,	%o7
	fbg,a	%fcc3,	loop_1119
	alignaddrl	%l2,	%i5,	%i6
	set	0x60, %i1
	ldxa	[%l7 + %i1] 0x80,	%i1
loop_1119:
	edge16n	%i0,	%i7,	%l0
	fbe	%fcc3,	loop_1120
	fbue,a	%fcc3,	loop_1121
	sdiv	%i3,	0x0450,	%g5
	fmovsle	%xcc,	%f19,	%f15
loop_1120:
	bgu,a	loop_1122
loop_1121:
	sdivcc	%o0,	0x0685,	%g7
	bl	%icc,	loop_1123
	umulcc	%o4,	0x1CBB,	%o6
loop_1122:
	udiv	%i2,	0x1BC1,	%l3
	bshuffle	%f6,	%f2,	%f26
loop_1123:
	te	%xcc,	0x1
	tn	%icc,	0x5
	fmovdge	%xcc,	%f16,	%f25
	fsrc2	%f30,	%f0
	bcs	%xcc,	loop_1124
	fmovsle	%icc,	%f22,	%f20
	nop
	set	0x70, %o2
	prefetch	[%l7 + %o2],	 0x3
	fmovrsne	%l6,	%f18,	%f22
loop_1124:
	tsubcctv	%l4,	0x17D2,	%o1
	fble,a	%fcc0,	loop_1125
	edge8l	%l5,	%g1,	%g4
	taddcctv	%g6,	0x1D1C,	%o2
	srlx	%g2,	0x07,	%l1
loop_1125:
	fmovd	%f16,	%f2
	sdivx	%o3,	0x0319,	%i4
	tvs	%xcc,	0x6
	sll	%o5,	0x0D,	%g3
	fpackfix	%f2,	%f3
	sdivx	%o7,	0x1A93,	%l2
	smulcc	%i6,	%i5,	%i1
	tcs	%xcc,	0x2
	set	0x50, %g4
	swapa	[%l7 + %g4] 0x19,	%i7
	nop
	setx	0x6E2996BD,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f16
	setx	0xF87FAF08,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f21
	fmuls	%f21,	%f16,	%f23
	smulcc	%l0,	%i0,	%g5
	nop
	setx	loop_1126,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fbl,a	%fcc1,	loop_1127
	fsrc1	%f8,	%f6
	and	%o0,	0x0669,	%g7
loop_1126:
	fbge	%fcc0,	loop_1128
loop_1127:
	ldsb	[%l7 + 0x0E],	%i3
	udiv	%o4,	0x1CA2,	%o6
	fmovscs	%icc,	%f24,	%f10
loop_1128:
	movrne	%l3,	%l6,	%i2
	tsubcc	%l4,	%o1,	%g1
	wr	%g0,	0x23,	%asi
	stxa	%g4,	[%l7 + 0x58] %asi
	membar	#Sync
	ba,a,pt	%xcc,	loop_1129
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnot2	%f4,	%f6
	fmovde	%icc,	%f0,	%f21
loop_1129:
	tneg	%xcc,	0x0
	wr	%g0,	0x27,	%asi
	stba	%l5,	[%l7 + 0x5F] %asi
	membar	#Sync
	fmovsne	%icc,	%f20,	%f1
	alignaddr	%o2,	%g6,	%l1
	nop
	fitod	%f0,	%f20
	fdtox	%f20,	%f18
	movvc	%icc,	%g2,	%i4
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
	fmovsleu	%xcc,	%f30,	%f10
	wr	%g0,	0x80,	%asi
	lduha	[%l7 + 0x64] %asi,	%o5
loop_1130:
	movcc	%icc,	%o3,	%g3
	tvc	%xcc,	0x0
	fmul8x16al	%f5,	%f20,	%f18
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	setx	0xC8646157,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f15
	setx	0x278676CB,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f13
	fmuls	%f13,	%f15,	%f12
	movcs	%xcc,	%o7,	%i6
	srax	%i5,	0x1B,	%i1
	fmovsneg	%icc,	%f5,	%f12
	nop
	setx	0xEE8F824BA425DF98,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0x4AD9E1D2C22BE888,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	fsubd	%f26,	%f6,	%f16
	fbul	%fcc3,	loop_1131
	movvc	%xcc,	%l2,	%i7
	bn,a	loop_1132
	andncc	%l0,	%g5,	%o0
loop_1131:
	tpos	%icc,	0x6
	sllx	%g7,	%i3,	%o4
loop_1132:
	edge16	%o6,	%i0,	%l3
	brlz,a	%i2,	loop_1133
	sll	%l6,	%l4,	%g1
	movrgz	%o1,	%g4,	%o2
	fbl,a	%fcc3,	loop_1134
loop_1133:
	fmovsgu	%xcc,	%f27,	%f8
	fmul8sux16	%f24,	%f2,	%f12
	move	%icc,	%l5,	%l1
loop_1134:
	srax	%g6,	%g2,	%o5
	ldsb	[%l7 + 0x41],	%o3
	bge	loop_1135
	umul	%g3,	%i4,	%o7
	andn	%i5,	0x1CFC,	%i1
	nop
	setx	0x0047CE23,	%l0,	%l6
	st	%l6,	[%l7 + 0x5C]
	ld	[%l7 + 0x5C],	%fsr
loop_1135:
	edge8ln	%l2,	%i7,	%i6
	subcc	%g5,	0x17CC,	%o0
	fmul8x16au	%f15,	%f14,	%f6
	swap	[%l7 + 0x58],	%l0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8l	%i3,	%o4,	%o6
	movrlz	%i0,	%l3,	%i2
	fmovdn	%xcc,	%f7,	%f28
	stbar
	srl	%l6,	%l4,	%g1
	fpmerge	%f9,	%f11,	%f10
	mulscc	%o1,	0x02FA,	%g4
	subc	%o2,	%l5,	%g7
	ldstub	[%l7 + 0x4A],	%l1
	subcc	%g6,	%o5,	%g2
	sdivx	%g3,	0x05B4,	%i4
	xorcc	%o7,	%i5,	%i1
	movne	%icc,	%l2,	%i7
	fmuld8ulx16	%f24,	%f28,	%f20
	add	%i6,	%g5,	%o0
	bcs	loop_1136
	array16	%o3,	%i3,	%l0
	wr	%g0,	0x88,	%asi
	lduwa	[%l7 + 0x28] %asi,	%o6
loop_1136:
	fmovrdlz	%o4,	%f4,	%f16
	tl	%xcc,	0x1
	sdiv	%l3,	0x1613,	%i2
	bvc,a	%icc,	loop_1137
	movcs	%xcc,	%l6,	%l4
	tgu	%xcc,	0x0
	ta	%xcc,	0x3
loop_1137:
	tvs	%xcc,	0x6
	bneg,a,pt	%icc,	loop_1138
	or	%i0,	0x17C3,	%o1
	subccc	%g1,	%g4,	%o2
	ldsb	[%l7 + 0x6C],	%l5
loop_1138:
	fsrc1s	%f6,	%f24
	fmovrslez	%l1,	%f6,	%f21
	fone	%f20
	andn	%g6,	%g7,	%g2
	fmul8sux16	%f0,	%f26,	%f28
	umulcc	%o5,	%i4,	%g3
	stbar
	tne	%icc,	0x6
	tle	%xcc,	0x0
	fpadd32	%f12,	%f30,	%f20
	fandnot2	%f8,	%f26,	%f20
	tgu	%icc,	0x2
	stbar
	bleu,a,pn	%icc,	loop_1139
	tsubcctv	%i5,	%i1,	%o7
	subcc	%i7,	0x0AC5,	%l2
	fmovsvs	%icc,	%f19,	%f28
loop_1139:
	nop
	wr	%g0,	0xe2,	%asi
	ldda	[%l7 + 0x30] %asi,	%g4
	addc	%i6,	%o0,	%i3
	movneg	%icc,	%o3,	%o6
	fmovrsne	%l0,	%f8,	%f13
	pdist	%f8,	%f2,	%f30
	ta	%icc,	0x4
	fcmpeq16	%f20,	%f0,	%o4
	set	0x45, %g3
	ldstuba	[%l7 + %g3] 0x0c,	%l3
	bneg	%xcc,	loop_1140
	fbne,a	%fcc1,	loop_1141
	sub	%i2,	%l6,	%l4
	movcc	%xcc,	%i0,	%g1
loop_1140:
	fpadd32s	%f25,	%f25,	%f22
loop_1141:
	fands	%f17,	%f4,	%f19
	fmovd	%f16,	%f2
	tge	%xcc,	0x0
	fbo,a	%fcc1,	loop_1142
	alignaddrl	%g4,	%o2,	%o1
	fmovsne	%icc,	%f16,	%f31
	mulx	%l5,	%l1,	%g6
loop_1142:
	fmovsvs	%icc,	%f12,	%f19
	alignaddrl	%g7,	%g2,	%i4
	wr	%g0,	0x81,	%asi
	ldsba	[%l7 + 0x2B] %asi,	%g3
	fbge	%fcc3,	loop_1143
	ba	loop_1144
	movge	%xcc,	%i5,	%i1
	andn	%o7,	%i7,	%o5
loop_1143:
	fmovsne	%xcc,	%f4,	%f2
loop_1144:
	edge32n	%g5,	%l2,	%o0
	ldd	[%l7 + 0x48],	%i2
	bvc,a	loop_1145
	fmovrslez	%i6,	%f20,	%f9
	taddcc	%o3,	0x0242,	%l0
	orcc	%o4,	%l3,	%i2
loop_1145:
	bge,a,pn	%xcc,	loop_1146
	movg	%xcc,	%l6,	%o6
	taddcc	%l4,	%g1,	%g4
	edge32n	%i0,	%o2,	%l5
loop_1146:
	nop
	wr	%g0,	0x89,	%asi
	ldstuba	[%l7 + 0x08] %asi,	%o1
	movrlz	%l1,	0x37A,	%g6
	fcmpeq16	%f22,	%f30,	%g2
	set	0x58, %i0
	lduba	[%l7 + %i0] 0x11,	%g7
	fsrc2	%f30,	%f2
	brnz	%g3,	loop_1147
	sdiv	%i4,	0x0D07,	%i1
	bgu,a	loop_1148
	ldd	[%l7 + 0x20],	%i4
loop_1147:
	fmovrse	%i7,	%f4,	%f1
	edge16n	%o7,	%o5,	%g5
loop_1148:
	nop
	fitos	%f7,	%f10
	fstoi	%f10,	%f17
	movvc	%xcc,	%l2,	%i3
	ba,pn	%icc,	loop_1149
	tpos	%icc,	0x6
	sir	0x1758
	fmovrse	%o0,	%f8,	%f21
loop_1149:
	ldsb	[%l7 + 0x7D],	%i6
	fzeros	%f12
	bcs,pt	%icc,	loop_1150
	movgu	%xcc,	%l0,	%o3
	pdist	%f26,	%f12,	%f20
	bvc	loop_1151
loop_1150:
	movrgz	%l3,	0x3A0,	%o4
	nop
	setx	0xB2D2B430006FD353,	%l0,	%l6
	stx	%l6,	[%l7 + 0x30]
	ldx	[%l7 + 0x30],	%fsr
	movcs	%icc,	%l6,	%o6
loop_1151:
	nop
	setx	0x5A3AD56BED421671,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0xA9A1F1F1E732DFD8,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	faddd	%f30,	%f0,	%f6
	subcc	%i2,	0x11B8,	%g1
	xorcc	%l4,	0x17B0,	%g4
	call	loop_1152
	movrgz	%i0,	%l5,	%o2
	movn	%xcc,	%o1,	%l1
	sub	%g6,	0x09D6,	%g2
loop_1152:
	movgu	%xcc,	%g7,	%g3
	array16	%i1,	%i4,	%i5
	wr	%g0,	0x80,	%asi
	sta	%f1,	[%l7 + 0x60] %asi
	edge8	%o7,	%i7,	%o5
	tg	%icc,	0x3
	smulcc	%l2,	%i3,	%o0
	mova	%icc,	%g5,	%l0
	movgu	%xcc,	%o3,	%l3
	movleu	%xcc,	%o4,	%l6
	fbne	%fcc2,	loop_1153
	bcs,a,pn	%icc,	loop_1154
	fmovrsgez	%o6,	%f2,	%f6
	movrgez	%i2,	%g1,	%l4
loop_1153:
	addcc	%g4,	0x1287,	%i0
loop_1154:
	andncc	%i6,	%l5,	%o1
	bneg,a,pn	%icc,	loop_1155
	tgu	%xcc,	0x6
	ba	loop_1156
	alignaddr	%l1,	%g6,	%o2
loop_1155:
	movpos	%xcc,	%g2,	%g3
	subc	%g7,	%i1,	%i4
loop_1156:
	nop
	set	0x64, %l4
	stb	%i5,	[%l7 + %l4]
	fba	%fcc3,	loop_1157
	sdiv	%o7,	0x0ABC,	%i7
	sethi	0x19AB,	%o5
	set	0x5A, %i7
	ldsba	[%l7 + %i7] 0x81,	%l2
loop_1157:
	fmovd	%f14,	%f28
	tcs	%icc,	0x5
	ld	[%l7 + 0x78],	%f19
	tgu	%xcc,	0x2
	fbuge,a	%fcc0,	loop_1158
	bg,a,pn	%xcc,	loop_1159
	stx	%i3,	[%l7 + 0x48]
	sll	%g5,	0x0B,	%o0
loop_1158:
	movrne	%l0,	%o3,	%o4
loop_1159:
	stb	%l3,	[%l7 + 0x2D]
	smul	%o6,	%i2,	%g1
	movneg	%icc,	%l4,	%l6
	lduh	[%l7 + 0x7E],	%i0
	tn	%xcc,	0x4
	nop
	setx	0x4E3B85F7D55094CD,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0x9A11C4565BB1A002,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	faddd	%f10,	%f10,	%f14
	brlz,a	%i6,	loop_1160
	umul	%l5,	%o1,	%g4
	edge16l	%l1,	%g6,	%o2
	wr	%g0,	0x11,	%asi
	sta	%f11,	[%l7 + 0x58] %asi
loop_1160:
	sdiv	%g2,	0x0F23,	%g3
	mulx	%g7,	%i1,	%i5
	sethi	0x095D,	%i4
	fbo	%fcc0,	loop_1161
	sdivx	%o7,	0x06C2,	%i7
	set	0x6C, %g7
	lduha	[%l7 + %g7] 0x18,	%l2
loop_1161:
	bcs,a,pt	%icc,	loop_1162
	edge16l	%i3,	%o5,	%g5
	ldsb	[%l7 + 0x27],	%o0
	udivcc	%l0,	0x0D74,	%o3
loop_1162:
	fbn	%fcc1,	loop_1163
	te	%icc,	0x0
	fmovdvc	%icc,	%f3,	%f26
	call	loop_1164
loop_1163:
	fmovsa	%xcc,	%f2,	%f7
	fmovsvc	%xcc,	%f21,	%f27
	xnor	%l3,	%o6,	%o4
loop_1164:
	sllx	%i2,	0x18,	%l4
	movrlz	%l6,	0x3EC,	%g1
	membar	0x14
	mulx	%i6,	0x1531,	%i0
	nop
	setx loop_1165, %l0, %l1
	jmpl %l1, %l5
	edge8l	%g4,	%o1,	%g6
	ta	%icc,	0x0
	sdiv	%l1,	0x00B9,	%g2
loop_1165:
	tneg	%icc,	0x6
	tcc	%icc,	0x1
	array8	%g3,	%g7,	%i1
	mova	%xcc,	%o2,	%i4
	fmovrslez	%o7,	%f20,	%f16
	nop
	setx loop_1166, %l0, %l1
	jmpl %l1, %i5
	nop
	fitos	%f11,	%f23
	fstoi	%f23,	%f20
	st	%f24,	[%l7 + 0x0C]
	fmovdpos	%xcc,	%f8,	%f11
loop_1166:
	movle	%icc,	%i7,	%i3
	movrlz	%l2,	0x18A,	%g5
	ldsb	[%l7 + 0x3E],	%o0
	nop
	setx	loop_1167,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fpack16	%f26,	%f11
	subcc	%o5,	%l0,	%o3
	subc	%l3,	%o4,	%i2
loop_1167:
	mulx	%o6,	%l6,	%l4
	subc	%g1,	0x0756,	%i6
	nop
	fitod	%f28,	%f18
	umul	%l5,	%i0,	%g4
	fba	%fcc1,	loop_1168
	fbule,a	%fcc0,	loop_1169
	fmovscc	%icc,	%f29,	%f30
	brz,a	%g6,	loop_1170
loop_1168:
	sll	%l1,	0x09,	%g2
loop_1169:
	nop
	setx	loop_1171,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	umul	%g3,	%o1,	%i1
loop_1170:
	brlz	%o2,	loop_1172
	movge	%xcc,	%i4,	%o7
loop_1171:
	taddcc	%i5,	0x1D20,	%g7
	tge	%icc,	0x0
loop_1172:
	fpsub32	%f30,	%f24,	%f10
	stb	%i3,	[%l7 + 0x71]
	bvc,a,pn	%icc,	loop_1173
	tge	%xcc,	0x5
	andn	%l2,	0x16E5,	%i7
	nop
	fitod	%f0,	%f6
	fdtox	%f6,	%f28
	fxtod	%f28,	%f2
loop_1173:
	array8	%o0,	%g5,	%l0
	sllx	%o3,	0x13,	%o5
	tcs	%icc,	0x0
	udivcc	%o4,	0x0095,	%i2
	sdiv	%l3,	0x10C0,	%o6
	sub	%l4,	0x1914,	%g1
	tg	%icc,	0x5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbl	%fcc3,	loop_1174
	brgez,a	%i6,	loop_1175
	smul	%l5,	0x09CB,	%l6
	fmovsg	%xcc,	%f30,	%f22
loop_1174:
	fmovdvs	%icc,	%f6,	%f5
loop_1175:
	tne	%xcc,	0x5
	move	%xcc,	%i0,	%g4
	fmovdneg	%xcc,	%f23,	%f22
	alignaddrl	%g6,	%l1,	%g2
	fcmpgt16	%f14,	%f16,	%o1
	stw	%i1,	[%l7 + 0x30]
	fbe,a	%fcc1,	loop_1176
	ta	%icc,	0x0
	bneg,pn	%icc,	loop_1177
	alignaddr	%o2,	%i4,	%o7
loop_1176:
	fmovsvc	%xcc,	%f14,	%f2
	array32	%i5,	%g7,	%i3
loop_1177:
	andn	%l2,	%g3,	%i7
	brnz	%g5,	loop_1178
	edge16	%l0,	%o0,	%o5
	bgu	%xcc,	loop_1179
	movcs	%icc,	%o4,	%o3
loop_1178:
	tge	%xcc,	0x2
	bpos,a	loop_1180
loop_1179:
	and	%i2,	%o6,	%l4
	wr	%g0,	0x80,	%asi
	stha	%l3,	[%l7 + 0x68] %asi
loop_1180:
	ta	%icc,	0x7
	alignaddrl	%i6,	%g1,	%l5
	sdivcc	%l6,	0x11A6,	%i0
	nop
	setx	0x2E61EF7626E27258,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0x599B86A598697BC2,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	fsubd	%f24,	%f10,	%f14
	for	%f30,	%f0,	%f28
	nop
	setx	0x6C6237F3074088CA,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0xE9EE9B34A75AB4B8,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	fsubd	%f22,	%f8,	%f28
	tgu	%icc,	0x3
	srax	%g4,	0x0E,	%g6
	tleu	%icc,	0x7
	fmovdpos	%xcc,	%f7,	%f20
	umul	%l1,	%g2,	%i1
	movvs	%icc,	%o1,	%o2
	sra	%i4,	%i5,	%o7
	fmovscs	%xcc,	%f14,	%f30
	xor	%g7,	%l2,	%g3
	add	%l7,	0x78,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%i3
	casa	[%l6] %asi,	%i3,	%i7
	bshuffle	%f6,	%f18,	%f8
	mulscc	%l0,	%g5,	%o0
	movpos	%icc,	%o4,	%o5
	movneg	%icc,	%o3,	%o6
	xor	%i2,	%l4,	%l3
	umulcc	%i6,	%g1,	%l5
	movgu	%xcc,	%l6,	%g4
	bpos,pt	%xcc,	loop_1181
	fbe,a	%fcc2,	loop_1182
	sethi	0x1C92,	%i0
	movl	%xcc,	%g6,	%g2
loop_1181:
	srl	%l1,	0x0A,	%i1
loop_1182:
	addcc	%o1,	%o2,	%i5
	subccc	%i4,	0x05E8,	%o7
	bn,a,pn	%icc,	loop_1183
	lduw	[%l7 + 0x34],	%g7
	srl	%l2,	0x09,	%g3
	edge32ln	%i7,	%l0,	%g5
loop_1183:
	edge8n	%i3,	%o4,	%o0
	set	0x48, %o5
	ldswa	[%l7 + %o5] 0x18,	%o3
	fbu	%fcc1,	loop_1184
	fbl	%fcc2,	loop_1185
	tsubcc	%o5,	%o6,	%i2
	tvs	%xcc,	0x4
loop_1184:
	nop
	wr	%g0,	0x27,	%asi
	stwa	%l3,	[%l7 + 0x58] %asi
	membar	#Sync
loop_1185:
	mulx	%l4,	%g1,	%i6
	fmovd	%f2,	%f26
	swap	[%l7 + 0x74],	%l5
	edge16ln	%g4,	%l6,	%g6
	fsrc2	%f26,	%f18
	sub	%g2,	0x0A0C,	%i0
	tle	%icc,	0x0
	movrne	%i1,	%l1,	%o2
	alignaddrl	%o1,	%i5,	%i4
	fpadd16	%f10,	%f8,	%f16
	fmul8x16au	%f30,	%f9,	%f18
	set	0x50, %o1
	lduha	[%l7 + %o1] 0x81,	%o7
	ldsh	[%l7 + 0x20],	%g7
	taddcc	%l2,	%g3,	%i7
	edge16n	%l0,	%i3,	%o4
	mulscc	%g5,	0x1F1B,	%o0
	edge32ln	%o3,	%o6,	%o5
	sir	0x1D63
	addccc	%l3,	0x0047,	%i2
	fbne	%fcc0,	loop_1186
	nop
	setx	loop_1187,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	xorcc	%g1,	0x0207,	%l4
	and	%l5,	0x1899,	%g4
loop_1186:
	fbne	%fcc3,	loop_1188
loop_1187:
	ldsb	[%l7 + 0x7A],	%i6
	tge	%xcc,	0x0
	mova	%xcc,	%g6,	%g2
loop_1188:
	fbue,a	%fcc2,	loop_1189
	movgu	%xcc,	%l6,	%i1
	fmovrdlez	%l1,	%f20,	%f24
	taddcc	%o2,	0x1BD1,	%i0
loop_1189:
	ldx	[%l7 + 0x30],	%i5
	fcmple16	%f20,	%f2,	%i4
	udivcc	%o1,	0x1246,	%o7
	and	%l2,	0x0F48,	%g7
	mulscc	%g3,	%l0,	%i7
	movneg	%icc,	%i3,	%g5
	xnor	%o0,	%o3,	%o4
	edge16	%o5,	%l3,	%i2
	tleu	%icc,	0x4
	array16	%g1,	%l4,	%l5
	fpadd32s	%f12,	%f10,	%f14
	movne	%icc,	%g4,	%i6
	fmovsn	%icc,	%f6,	%f25
	xnor	%o6,	0x140F,	%g2
	set	0x40, %o7
	stda	%f0,	[%l7 + %o7] 0xf1
	membar	#Sync
	or	%g6,	%l6,	%i1
	sdiv	%l1,	0x0BF7,	%o2
	te	%icc,	0x5
	brlz,a	%i5,	loop_1190
	alignaddr	%i0,	%o1,	%o7
	tge	%icc,	0x1
	te	%icc,	0x5
loop_1190:
	fcmpne16	%f16,	%f8,	%l2
	movle	%icc,	%g7,	%i4
	mulscc	%g3,	%i7,	%l0
	edge8	%g5,	%i3,	%o0
	fpack32	%f10,	%f4,	%f24
	movvs	%icc,	%o3,	%o4
	fbu	%fcc0,	loop_1191
	andn	%o5,	0x14FA,	%i2
	movle	%icc,	%g1,	%l4
	andn	%l5,	%g4,	%l3
loop_1191:
	membar	0x2E
	edge8	%o6,	%g2,	%i6
	movcs	%icc,	%l6,	%g6
	array32	%i1,	%l1,	%o2
	fnands	%f29,	%f28,	%f7
	andn	%i5,	%o1,	%i0
	bg,a	%icc,	loop_1192
	fbe	%fcc1,	loop_1193
	taddcc	%o7,	%g7,	%i4
	xnor	%l2,	%g3,	%i7
loop_1192:
	tne	%icc,	0x2
loop_1193:
	tvs	%icc,	0x4
	fnands	%f27,	%f3,	%f28
	sir	0x0C51
	fexpand	%f15,	%f26
	tvs	%xcc,	0x1
	edge8	%g5,	%i3,	%o0
	nop
	setx	loop_1194,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tge	%xcc,	0x7
	fpadd16	%f30,	%f10,	%f8
	sllx	%l0,	%o4,	%o5
loop_1194:
	orn	%o3,	0x13E5,	%g1
	set	0x40, %l2
	stda	%f0,	[%l7 + %l2] 0x88
	bcc	%icc,	loop_1195
	fxnors	%f16,	%f29,	%f0
	umulcc	%i2,	%l5,	%l4
	movrne	%g4,	0x1C7,	%o6
loop_1195:
	edge8l	%g2,	%i6,	%l3
	brlz,a	%g6,	loop_1196
	movvs	%xcc,	%i1,	%l6
	fmovsne	%xcc,	%f11,	%f22
	movrlez	%l1,	0x2E9,	%i5
loop_1196:
	addcc	%o1,	%o2,	%o7
	fbul,a	%fcc0,	loop_1197
	bvc,pn	%xcc,	loop_1198
	st	%f17,	[%l7 + 0x1C]
	andncc	%i0,	%i4,	%l2
loop_1197:
	sllx	%g7,	0x05,	%g3
loop_1198:
	fbue,a	%fcc3,	loop_1199
	addccc	%g5,	0x0230,	%i7
	orcc	%o0,	%i3,	%l0
	movcs	%icc,	%o4,	%o5
loop_1199:
	nop
	wr	%g0,	0x89,	%asi
	ldsba	[%l7 + 0x6A] %asi,	%o3
	addccc	%i2,	0x1959,	%l5
	sra	%l4,	%g1,	%o6
	edge16ln	%g4,	%i6,	%g2
	edge32l	%g6,	%i1,	%l6
	orncc	%l3,	0x00AC,	%i5
	fmovrdgez	%o1,	%f30,	%f6
	fbe	%fcc1,	loop_1200
	movle	%xcc,	%o2,	%o7
	wr	%g0,	0x0c,	%asi
	stha	%l1,	[%l7 + 0x44] %asi
loop_1200:
	andn	%i4,	%i0,	%l2
	fmuld8ulx16	%f30,	%f21,	%f6
	umul	%g7,	0x186F,	%g5
	nop
	setx	0x1775A501F06501F7,	%l0,	%l6
	stx	%l6,	[%l7 + 0x18]
	ldx	[%l7 + 0x18],	%fsr
	tgu	%icc,	0x3
	movl	%icc,	%i7,	%g3
	xorcc	%o0,	0x044E,	%l0
	movrlz	%i3,	0x121,	%o5
	fmovspos	%xcc,	%f30,	%f28
	fmuld8sux16	%f9,	%f21,	%f6
	movrne	%o3,	0x3B7,	%o4
	tge	%icc,	0x5
	nop
	fitos	%f21,	%f25
	ble,pn	%xcc,	loop_1201
	umulcc	%l5,	0x040F,	%l4
	nop
	set	0x6D, %o0
	ldub	[%l7 + %o0],	%i2
	fbne,a	%fcc0,	loop_1202
loop_1201:
	fbug,a	%fcc0,	loop_1203
	tn	%icc,	0x0
	edge16ln	%g1,	%o6,	%g4
loop_1202:
	tcs	%icc,	0x0
loop_1203:
	move	%xcc,	%i6,	%g2
	tneg	%icc,	0x7
	fandnot1	%f20,	%f28,	%f0
	ble	%xcc,	loop_1204
	array8	%g6,	%i1,	%l3
	andncc	%i5,	%o1,	%o2
	mulx	%l6,	%l1,	%o7
loop_1204:
	movvs	%xcc,	%i4,	%i0
	tneg	%xcc,	0x3
	set	0x60, %o3
	lduha	[%l7 + %o3] 0x10,	%l2
	movneg	%icc,	%g7,	%g5
	fornot1	%f20,	%f28,	%f18
	array32	%g3,	%i7,	%o0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tpos	%icc,	0x2
	add	%l0,	0x17EE,	%o5
	tvs	%xcc,	0x4
	xorcc	%o3,	0x1FC1,	%o4
	taddcc	%i3,	%l4,	%l5
	tcc	%icc,	0x5
	orncc	%i2,	%o6,	%g4
	nop
	fitod	%f0,	%f24
	fdtos	%f24,	%f14
	fbu	%fcc0,	loop_1205
	nop
	fitod	%f12,	%f20
	fdtos	%f20,	%f7
	xorcc	%i6,	0x1DAD,	%g1
	fnand	%f6,	%f28,	%f2
loop_1205:
	fzeros	%f29
	fmovdcc	%icc,	%f10,	%f12
	mova	%icc,	%g6,	%i1
	wr	%g0,	0x11,	%asi
	prefetcha	[%l7 + 0x28] %asi,	 0x0
	xnorcc	%g2,	%i5,	%o1
	srlx	%l6,	0x19,	%o2
	fblg,a	%fcc1,	loop_1206
	tle	%xcc,	0x7
	and	%l1,	0x0273,	%o7
	fmovrdlez	%i4,	%f8,	%f6
loop_1206:
	fmovrdgz	%l2,	%f6,	%f4
	nop
	setx	0xF828C59C06503C86,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0x90F46B5F2CB859ED,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	faddd	%f22,	%f30,	%f14
	movgu	%xcc,	%i0,	%g7
	movrgz	%g5,	0x39F,	%g3
	addccc	%o0,	0x1FF4,	%l0
	array16	%o5,	%i7,	%o3
	edge16	%o4,	%l4,	%i3
	smul	%l5,	%i2,	%o6
	andn	%i6,	0x0907,	%g1
	array32	%g4,	%g6,	%i1
	tg	%icc,	0x7
	fornot1s	%f11,	%f21,	%f26
	tcc	%xcc,	0x5
	fbule,a	%fcc0,	loop_1207
	movrgz	%l3,	%g2,	%i5
	addccc	%l6,	%o1,	%l1
	movvs	%xcc,	%o2,	%o7
loop_1207:
	fbne	%fcc1,	loop_1208
	tsubcctv	%l2,	0x0BC5,	%i4
	nop
	fitos	%f6,	%f11
	fstox	%f11,	%f8
	fxtos	%f8,	%f9
	fbg,a	%fcc3,	loop_1209
loop_1208:
	subc	%i0,	0x114D,	%g7
	wr	%g0,	0x81,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
loop_1209:
	edge32l	%g3,	%g5,	%o0
	movl	%icc,	%l0,	%i7
	subcc	%o5,	%o4,	%l4
	fbl	%fcc3,	loop_1210
	nop
	setx	0x2B6D46D8CB2724BA,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0x519620436C0C06AD,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	faddd	%f12,	%f30,	%f4
	fornot2s	%f29,	%f26,	%f18
	tle	%xcc,	0x7
loop_1210:
	tsubcctv	%i3,	%o3,	%l5
	wr	%g0,	0x04,	%asi
	ldsba	[%l7 + 0x12] %asi,	%i2
	tge	%icc,	0x4
	xnorcc	%i6,	0x1C74,	%g1
	tg	%icc,	0x6
	fba,a	%fcc1,	loop_1211
	alignaddrl	%o6,	%g4,	%i1
	set	0x66, %g6
	ldstuba	[%l7 + %g6] 0x04,	%g6
loop_1211:
	tg	%icc,	0x2
	mulx	%l3,	0x0A27,	%i5
	bg,a	%xcc,	loop_1212
	movle	%icc,	%g2,	%l6
	nop
	setx	loop_1213,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movle	%icc,	%l1,	%o1
loop_1212:
	addc	%o2,	%o7,	%i4
	xorcc	%i0,	%l2,	%g3
loop_1213:
	movcc	%icc,	%g7,	%o0
	bleu,a,pt	%xcc,	loop_1214
	smulcc	%l0,	0x0D22,	%g5
	subcc	%o5,	%i7,	%o4
	tgu	%icc,	0x7
loop_1214:
	nop
	wr	%g0,	0x0c,	%asi
	stxa	%i3,	[%l7 + 0x28] %asi
	movre	%o3,	0x342,	%l5
	array32	%i2,	%i6,	%l4
	set	0x3A, %i6
	stha	%o6,	[%l7 + %i6] 0x14
	fcmpeq16	%f4,	%f28,	%g4
	fmul8x16al	%f6,	%f20,	%f22
	andcc	%g1,	0x0482,	%g6
	taddcc	%l3,	0x03B6,	%i1
	brz	%g2,	loop_1215
	edge8n	%i5,	%l1,	%l6
	fmul8x16au	%f18,	%f20,	%f26
	wr	%g0,	0x89,	%asi
	sta	%f27,	[%l7 + 0x18] %asi
loop_1215:
	nop
	setx	loop_1216,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movn	%icc,	%o2,	%o7
	fmovrdgz	%i4,	%f2,	%f14
	sethi	0x0B01,	%o1
loop_1216:
	tleu	%icc,	0x7
	fcmple32	%f2,	%f0,	%i0
	fpack16	%f2,	%f9
	array16	%l2,	%g7,	%o0
	udivcc	%g3,	0x1FDE,	%g5
	tpos	%xcc,	0x0
	fand	%f0,	%f28,	%f20
	fmovdg	%icc,	%f26,	%f28
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sllx	%l0,	0x1E,	%i7
	nop
	set	0x20, %l5
	std	%f24,	[%l7 + %l5]
	sll	%o5,	%i3,	%o3
	brz	%o4,	loop_1217
	movge	%xcc,	%l5,	%i6
	movg	%xcc,	%i2,	%o6
	wr	%g0,	0xea,	%asi
	stba	%g4,	[%l7 + 0x2C] %asi
	membar	#Sync
loop_1217:
	addcc	%l4,	0x1B68,	%g6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpsub16s	%f2,	%f4,	%f13
	edge32l	%g1,	%l3,	%g2
	tsubcctv	%i5,	0x1B0B,	%i1
	nop
	fitos	%f6,	%f14
	fstoi	%f14,	%f2
	fbe,a	%fcc0,	loop_1218
	fcmple16	%f0,	%f8,	%l6
	popc	%l1,	%o7
	ble,a,pt	%icc,	loop_1219
loop_1218:
	edge8ln	%o2,	%i4,	%o1
	edge16	%l2,	%i0,	%o0
	movvc	%icc,	%g3,	%g7
loop_1219:
	ldsb	[%l7 + 0x2C],	%g5
	xor	%i7,	0x0885,	%l0
	movg	%xcc,	%i3,	%o3
	fbo	%fcc0,	loop_1220
	udiv	%o5,	0x1546,	%o4
	brlz,a	%l5,	loop_1221
	srax	%i2,	0x0D,	%i6
loop_1220:
	tl	%icc,	0x4
	tn	%icc,	0x5
loop_1221:
	sra	%g4,	0x08,	%l4
	nop
	fitod	%f12,	%f30
	fdtox	%f30,	%f16
	nop
	set	0x31, %i4
	ldsb	[%l7 + %i4],	%g6
	subcc	%g1,	%l3,	%o6
	movrlez	%g2,	0x331,	%i1
	sra	%i5,	0x10,	%l1
	fzero	%f2
	array16	%o7,	%o2,	%l6
	movpos	%xcc,	%o1,	%i4
	brgez,a	%i0,	loop_1222
	movne	%icc,	%o0,	%l2
	andncc	%g7,	%g3,	%g5
	sethi	0x17A1,	%i7
loop_1222:
	movle	%xcc,	%i3,	%o3
	edge8n	%o5,	%l0,	%l5
	bcs,a,pt	%xcc,	loop_1223
	udiv	%o4,	0x05FD,	%i6
	ld	[%l7 + 0x64],	%f0
	movneg	%xcc,	%i2,	%g4
loop_1223:
	nop
	set	0x64, %l6
	stba	%l4,	[%l7 + %l6] 0x0c
	set	0x40, %g1
	ldsba	[%l7 + %g1] 0x88,	%g1
	movrlez	%l3,	%o6,	%g2
	fcmpne16	%f0,	%f24,	%g6
	wr	%g0,	0x04,	%asi
	ldswa	[%l7 + 0x2C] %asi,	%i5
	edge32l	%i1,	%o7,	%l1
	nop
	setx loop_1224, %l0, %l1
	jmpl %l1, %o2
	nop
	setx	0x29A13000707D88A4,	%l0,	%l6
	stx	%l6,	[%l7 + 0x20]
	ldx	[%l7 + 0x20],	%fsr
	fmovsleu	%icc,	%f25,	%f2
	add	%l7,	0x28,	%l6
	wr	%g0,	0x11,	%asi
	casa	[%l6] %asi,	%o1,	%i4
loop_1224:
	tsubcctv	%i0,	0x0F79,	%o0
	wr	%g0,	0xe3,	%asi
	ldda	[%l7 + 0x70] %asi,	%i6
	fbuge	%fcc3,	loop_1225
	subccc	%g7,	%g3,	%l2
	fnors	%f20,	%f25,	%f10
	fnegd	%f10,	%f6
loop_1225:
	tvc	%icc,	0x2
	andcc	%g5,	0x0B17,	%i7
	movl	%icc,	%i3,	%o3
	tvs	%xcc,	0x2
	bcc,a	%xcc,	loop_1226
	andcc	%o5,	%l5,	%l0
	ldsb	[%l7 + 0x70],	%i6
	tvc	%icc,	0x4
loop_1226:
	add	%o4,	%g4,	%l4
	fmovsn	%xcc,	%f20,	%f19
	fmovdgu	%xcc,	%f0,	%f18
	nop
	fitod	%f10,	%f28
	fdtos	%f28,	%f12
	orncc	%g1,	0x1CD2,	%l3
	stw	%i2,	[%l7 + 0x64]
	fbe	%fcc2,	loop_1227
	array8	%o6,	%g6,	%g2
	smulcc	%i5,	%o7,	%l1
	andncc	%o2,	%o1,	%i4
loop_1227:
	edge8	%i1,	%i0,	%l6
	or	%o0,	%g7,	%g3
	edge32l	%g5,	%l2,	%i3
	smul	%i7,	%o5,	%l5
	xnor	%l0,	0x1F53,	%i6
	movre	%o4,	0x3CD,	%g4
	fbule,a	%fcc3,	loop_1228
	nop
	setx	0xDA73E651732D6222,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	fsqrtd	%f12,	%f4
	set	0x20, %i3
	ldda	[%l7 + %i3] 0x2b,	%l4
loop_1228:
	bpos,a	%xcc,	loop_1229
	smulcc	%g1,	%l3,	%o3
	alignaddrl	%o6,	%i2,	%g2
	te	%icc,	0x3
loop_1229:
	ble,a	loop_1230
	fmovrdgz	%i5,	%f22,	%f18
	taddcc	%o7,	0x1676,	%g6
	smulcc	%o2,	0x15EC,	%o1
loop_1230:
	fandnot1s	%f19,	%f8,	%f2
	bl,pt	%icc,	loop_1231
	fnot1	%f6,	%f10
	movne	%icc,	%l1,	%i1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1231:
	andcc	%i4,	0x071F,	%l6
	movle	%xcc,	%o0,	%g7
	set	0x24, %g2
	ldswa	[%l7 + %g2] 0x80,	%i0
	sethi	0x154D,	%g5
	edge32	%g3,	%l2,	%i7
	bl,a	%icc,	loop_1232
	movrne	%o5,	%i3,	%l0
	lduh	[%l7 + 0x3E],	%l5
	for	%f2,	%f28,	%f0
loop_1232:
	nop
	wr	%g0,	0x88,	%asi
	stba	%i6,	[%l7 + 0x49] %asi
	andn	%g4,	%o4,	%l4
	membar	#Sync
	wr	%g0,	0x1e,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	movn	%xcc,	%l3,	%g1
	fnands	%f20,	%f17,	%f25
	movcs	%xcc,	%o3,	%o6
	fmovrdgez	%g2,	%f24,	%f6
	tpos	%icc,	0x1
	fpsub16	%f28,	%f22,	%f2
	orncc	%i2,	0x1A76,	%i5
	fmovdvs	%xcc,	%f13,	%f5
	wr	%g0,	0xea,	%asi
	stwa	%g6,	[%l7 + 0x1C] %asi
	membar	#Sync
	fmovrsgez	%o2,	%f0,	%f9
	ldsh	[%l7 + 0x46],	%o1
	alignaddr	%l1,	%o7,	%i4
	udiv	%l6,	0x1171,	%i1
	udivcc	%o0,	0x0258,	%g7
	ldsw	[%l7 + 0x44],	%g5
	subc	%i0,	%l2,	%g3
	bpos,a,pt	%xcc,	loop_1233
	srlx	%i7,	%i3,	%o5
	movneg	%xcc,	%l5,	%l0
	movvc	%xcc,	%i6,	%g4
loop_1233:
	fba	%fcc1,	loop_1234
	array8	%o4,	%l4,	%g1
	movcc	%xcc,	%l3,	%o3
	bge	loop_1235
loop_1234:
	tcs	%xcc,	0x0
	ldx	[%l7 + 0x60],	%g2
	nop
	setx	0x70486CCF,	%l0,	%l6
	st	%l6,	[%l7 + 0x38]
	ld	[%l7 + 0x38],	%fsr
loop_1235:
	fsrc1	%f6,	%f26
	fbg,a	%fcc0,	loop_1236
	brlz	%o6,	loop_1237
	fbug,a	%fcc3,	loop_1238
	nop
	setx	0x5434BD1EB8BB35FE,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	fsqrtd	%f4,	%f6
loop_1236:
	nop
	wr	%g0,	0x2a,	%asi
	ldda	[%l7 + 0x20] %asi,	%i2
loop_1237:
	tvs	%icc,	0x7
loop_1238:
	movrlez	%i5,	0x14A,	%o2
	fmul8sux16	%f24,	%f12,	%f12
	udiv	%g6,	0x0FBD,	%o1
	nop
	fitos	%f6,	%f29
	fstoi	%f29,	%f26
	andcc	%l1,	0x09F0,	%o7
	fbu,a	%fcc3,	loop_1239
	movleu	%icc,	%l6,	%i4
	movcs	%icc,	%i1,	%g7
	movgu	%xcc,	%g5,	%o0
loop_1239:
	fcmpne32	%f10,	%f22,	%i0
	srax	%l2,	%g3,	%i3
	fbuge	%fcc0,	loop_1240
	subc	%o5,	%l5,	%l0
	nop
	setx	0x5F9FD6D4E051230B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x50]
	ldx	[%l7 + 0x50],	%fsr
	subcc	%i6,	%g4,	%o4
loop_1240:
	movcs	%icc,	%l4,	%g1
	taddcc	%l3,	0x1D18,	%o3
	fmovsneg	%icc,	%f18,	%f29
	tle	%icc,	0x2
	fbg,a	%fcc1,	loop_1241
	movre	%i7,	%g2,	%o6
	bvc,a	loop_1242
	sdiv	%i5,	0x0538,	%i2
loop_1241:
	subcc	%g6,	0x1712,	%o2
	edge16n	%l1,	%o1,	%o7
loop_1242:
	andn	%l6,	0x1CA3,	%i4
	set	0x24, %l0
	lda	[%l7 + %l0] 0x88,	%f6
	nop
	set	0x38, %g5
	ldx	[%l7 + %g5],	%i1
	array32	%g7,	%o0,	%i0
	movn	%icc,	%l2,	%g3
	fandnot2s	%f12,	%f4,	%f11
	movgu	%xcc,	%i3,	%g5
	fcmpgt16	%f26,	%f0,	%l5
	fbge,a	%fcc0,	loop_1243
	smulcc	%o5,	0x1F99,	%i6
	array16	%g4,	%l0,	%o4
	nop
	setx	0x8EAF94E9,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f6
	setx	0x67EC6731,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f14
	fadds	%f14,	%f6,	%f9
loop_1243:
	nop
	set	0x40, %o4
	ldda	[%l7 + %o4] 0x18,	%f16
	brgz,a	%l4,	loop_1244
	bvc,pt	%icc,	loop_1245
	edge16l	%g1,	%o3,	%l3
	smulcc	%i7,	%g2,	%i5
loop_1244:
	subc	%i2,	%o6,	%o2
loop_1245:
	sdiv	%g6,	0x10BA,	%o1
	array32	%l1,	%o7,	%l6
	fmovde	%icc,	%f19,	%f11
	nop
	setx	0xADF967EF,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f7
	setx	0x57471F2F,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f8
	fmuls	%f8,	%f7,	%f31
	addccc	%i1,	0x1BB3,	%g7
	movle	%icc,	%o0,	%i0
	bl,a,pn	%xcc,	loop_1246
	edge32ln	%l2,	%i4,	%i3
	fmul8x16au	%f24,	%f24,	%f16
	tge	%icc,	0x2
loop_1246:
	fmovsne	%icc,	%f29,	%f12
	subc	%g3,	%l5,	%o5
	ldsw	[%l7 + 0x3C],	%g5
	udivcc	%g4,	0x08AD,	%i6
	array8	%l0,	%l4,	%o4
	xnor	%o3,	%l3,	%i7
	fmovsg	%xcc,	%f12,	%f12
	addccc	%g1,	0x01AB,	%i5
	fmul8x16au	%f23,	%f13,	%f16
	tneg	%xcc,	0x2
	ldd	[%l7 + 0x50],	%g2
	tleu	%xcc,	0x2
	fbo	%fcc2,	loop_1247
	sll	%o6,	0x04,	%o2
	sethi	0x1C84,	%g6
	sir	0x0989
loop_1247:
	array8	%o1,	%l1,	%i2
	te	%xcc,	0x6
	movn	%xcc,	%o7,	%l6
	movrlez	%i1,	0x307,	%o0
	brz,a	%i0,	loop_1248
	fpackfix	%f2,	%f21
	sll	%g7,	%l2,	%i4
	wr	%g0,	0x27,	%asi
	stha	%g3,	[%l7 + 0x3E] %asi
	membar	#Sync
loop_1248:
	fmovs	%f20,	%f6
	fmovs	%f1,	%f22
	brlz,a	%l5,	loop_1249
	edge8ln	%o5,	%g5,	%g4
	movrne	%i3,	%i6,	%l4
	xorcc	%o4,	0x05D6,	%o3
loop_1249:
	fpadd32	%f10,	%f30,	%f20
	fmovdg	%icc,	%f24,	%f11
	fsrc1	%f14,	%f2
	wr	%g0,	0x81,	%asi
	lduba	[%l7 + 0x3D] %asi,	%l3
	sir	0x1DF3
	tvc	%icc,	0x1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addcc	%l0,	%g1,	%i5
	bleu,a,pn	%icc,	loop_1250
	fnegd	%f14,	%f8
	fnegd	%f14,	%f10
	lduw	[%l7 + 0x64],	%i7
loop_1250:
	subccc	%g2,	0x173C,	%o6
	sub	%o2,	%g6,	%l1
	umul	%i2,	%o1,	%l6
	movle	%xcc,	%o7,	%i1
	srlx	%i0,	%g7,	%l2
	fbl	%fcc1,	loop_1251
	fsrc2s	%f14,	%f3
	subccc	%i4,	%o0,	%g3
	fxors	%f17,	%f5,	%f1
loop_1251:
	swap	[%l7 + 0x7C],	%l5
	taddcctv	%g5,	%g4,	%o5
	tg	%icc,	0x6
	ldsw	[%l7 + 0x70],	%i3
	andcc	%l4,	0x1402,	%i6
	set	0x56, %o6
	stba	%o3,	[%l7 + %o6] 0x10
	array32	%o4,	%l3,	%g1
	ta	%icc,	0x2
	ldx	[%l7 + 0x18],	%l0
	nop
	setx	loop_1252,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	stbar
	set	0x40, %i5
	ldda	[%l7 + %i5] 0x80,	%f16
loop_1252:
	addccc	%i7,	0x0A17,	%g2
	bgu,a	loop_1253
	udivcc	%i5,	0x1CC7,	%o2
	udivcc	%g6,	0x1558,	%l1
	subc	%i2,	0x034E,	%o6
loop_1253:
	nop
	set	0x08, %l3
	swapa	[%l7 + %l3] 0x18,	%o1
	bn	loop_1254
	nop
	fitod	%f8,	%f10
	fdtoi	%f10,	%f31
	tcc	%icc,	0x5
	fmovsvs	%xcc,	%f8,	%f10
loop_1254:
	tg	%xcc,	0x7
	sub	%l6,	%i1,	%i0
	popc	%o7,	%g7
	edge8l	%l2,	%i4,	%o0
	xnorcc	%g3,	0x00BE,	%l5
	fandnot1s	%f20,	%f23,	%f25
	umulcc	%g4,	0x11D0,	%g5
	tvc	%icc,	0x1
	tpos	%xcc,	0x3
	sir	0x16E2
	wr	%g0,	0x23,	%asi
	stwa	%i3,	[%l7 + 0x60] %asi
	membar	#Sync
	addcc	%o5,	%i6,	%o3
	wr	%g0,	0x2a,	%asi
	stba	%l4,	[%l7 + 0x53] %asi
	membar	#Sync
	fblg,a	%fcc3,	loop_1255
	tg	%icc,	0x1
	bgu,a	loop_1256
	fmovdvs	%xcc,	%f16,	%f17
loop_1255:
	nop
	fitod	%f6,	%f14
	smul	%l3,	0x0979,	%g1
loop_1256:
	nop
	wr	%g0,	0x2b,	%asi
	stha	%o4,	[%l7 + 0x2E] %asi
	membar	#Sync
	bshuffle	%f10,	%f18,	%f30
	fbu	%fcc1,	loop_1257
	tge	%icc,	0x5
	edge16	%i7,	%l0,	%g2
	move	%icc,	%i5,	%g6
loop_1257:
	sdivcc	%l1,	0x18EC,	%o2
	movrlez	%i2,	0x073,	%o6
	movrgz	%l6,	%i1,	%o1
	sra	%o7,	0x0C,	%i0
	edge16n	%l2,	%g7,	%i4
	movle	%icc,	%o0,	%l5
	fbn	%fcc0,	loop_1258
	fcmpgt16	%f0,	%f14,	%g3
	tsubcctv	%g5,	%i3,	%o5
	tcs	%xcc,	0x2
loop_1258:
	nop
	set	0x10, %i2
	ldda	[%l7 + %i2] 0xe2,	%g4
	edge16l	%o3,	%l4,	%i6
	tgu	%xcc,	0x4
	popc	%g1,	%o4
	andn	%l3,	%i7,	%g2
	edge32n	%i5,	%l0,	%l1
	set	0x14, %l1
	ldsba	[%l7 + %l1] 0x80,	%g6
	udiv	%i2,	0x1FA4,	%o6
	tcc	%xcc,	0x5
	smul	%l6,	0x191F,	%i1
	alignaddrl	%o2,	%o1,	%o7
	set	0x40, %i1
	lduwa	[%l7 + %i1] 0x0c,	%i0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32l	%l2,	%i4,	%g7
	sllx	%l5,	0x1D,	%o0
	andncc	%g5,	%g3,	%o5
	fmovrslez	%i3,	%f11,	%f0
	sllx	%o3,	0x12,	%g4
	edge32l	%l4,	%i6,	%g1
	tneg	%xcc,	0x7
	movrgez	%o4,	0x322,	%l3
	orn	%g2,	%i5,	%i7
	srax	%l1,	0x0C,	%l0
	xorcc	%g6,	0x1936,	%i2
	edge8ln	%o6,	%i1,	%o2
	edge16n	%l6,	%o7,	%i0
	srlx	%l2,	%i4,	%o1
	fnot1s	%f23,	%f16
	fbe,a	%fcc2,	loop_1259
	fbl,a	%fcc0,	loop_1260
	ldd	[%l7 + 0x18],	%f4
	edge16l	%g7,	%l5,	%o0
loop_1259:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1260:
	array32	%g5,	%o5,	%g3
	edge32n	%i3,	%g4,	%l4
	array32	%o3,	%g1,	%o4
	membar	0x03
	fcmpgt16	%f24,	%f22,	%i6
	bvc	%xcc,	loop_1261
	and	%g2,	%l3,	%i7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnorcc	%i5,	%l1,	%g6
loop_1261:
	nop
	fitos	%f3,	%f23
	fstox	%f23,	%f4
	fcmpgt32	%f4,	%f12,	%i2
	addc	%l0,	0x07D9,	%o6
	bn,pt	%xcc,	loop_1262
	nop
	setx	0x2F5906F2C05BC758,	%l0,	%l6
	stx	%l6,	[%l7 + 0x48]
	ldx	[%l7 + 0x48],	%fsr
	stx	%o2,	[%l7 + 0x58]
	fcmpgt16	%f20,	%f22,	%l6
loop_1262:
	tge	%icc,	0x4
	set	0x22, %o2
	lduha	[%l7 + %o2] 0x88,	%i1
	sir	0x1A4D
	movge	%xcc,	%o7,	%l2
	movpos	%xcc,	%i4,	%o1
	array32	%g7,	%l5,	%i0
	tle	%icc,	0x1
	add	%l7,	0x2C,	%l6
	wr	%g0,	0x19,	%asi
	casa	[%l6] 0x19,	%o0,	%o5
	sethi	0x098C,	%g3
	fpmerge	%f4,	%f10,	%f20
	fmovsge	%icc,	%f13,	%f22
	brgez	%g5,	loop_1263
	bleu	%icc,	loop_1264
	edge8n	%i3,	%g4,	%o3
	xor	%g1,	%o4,	%i6
loop_1263:
	fbuge,a	%fcc0,	loop_1265
loop_1264:
	fxnors	%f11,	%f1,	%f18
	fmovsvc	%xcc,	%f20,	%f30
	edge32ln	%g2,	%l4,	%l3
loop_1265:
	fbne,a	%fcc3,	loop_1266
	sub	%i5,	0x0624,	%i7
	stb	%g6,	[%l7 + 0x53]
	bvc,a,pn	%xcc,	loop_1267
loop_1266:
	movneg	%xcc,	%l1,	%l0
	array8	%o6,	%i2,	%l6
	sdiv	%i1,	0x0D48,	%o2
loop_1267:
	flush	%l7 + 0x20
	lduw	[%l7 + 0x70],	%l2
	tvc	%xcc,	0x4
	fpadd16	%f4,	%f2,	%f0
	addcc	%o7,	%i4,	%g7
	tsubcctv	%l5,	0x04BC,	%o1
	nop
	setx	loop_1268,	%l0,	%l1
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
	brz,a	%i0,	loop_1269
	ldx	[%l7 + 0x68],	%o5
loop_1268:
	orcc	%o0,	0x0B40,	%g5
	movgu	%icc,	%i3,	%g3
loop_1269:
	fmovsvs	%xcc,	%f14,	%f31
	move	%icc,	%g4,	%g1
	bcc,a,pn	%icc,	loop_1270
	tcc	%xcc,	0x7
	edge8ln	%o3,	%o4,	%g2
	tcs	%icc,	0x7
loop_1270:
	sethi	0x0796,	%l4
	fmovrdlz	%i6,	%f22,	%f12
	movcc	%xcc,	%i5,	%l3
	mulx	%i7,	0x17F1,	%g6
	fbule,a	%fcc1,	loop_1271
	taddcctv	%l1,	%o6,	%i2
	fba,a	%fcc2,	loop_1272
	xnor	%l0,	%l6,	%o2
loop_1271:
	tcc	%icc,	0x2
	movrlz	%l2,	%i1,	%i4
loop_1272:
	stx	%g7,	[%l7 + 0x38]
	fmovrslez	%o7,	%f19,	%f27
	movvs	%icc,	%l5,	%i0
	tsubcc	%o1,	0x0FCB,	%o5
	sir	0x0BCB
	mulscc	%g5,	0x0C84,	%i3
	nop
	setx	0x53EAD289,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f9
	fsqrts	%f9,	%f20
	movne	%icc,	%o0,	%g4
	edge16	%g3,	%g1,	%o3
	or	%g2,	%l4,	%i6
	bleu	%xcc,	loop_1273
	addcc	%o4,	%i5,	%i7
	sllx	%l3,	%g6,	%l1
	edge32ln	%i2,	%l0,	%l6
loop_1273:
	bpos	loop_1274
	ta	%icc,	0x5
	fsrc2	%f10,	%f24
	tle	%icc,	0x3
loop_1274:
	call	loop_1275
	fbug,a	%fcc0,	loop_1276
	stw	%o2,	[%l7 + 0x5C]
	fornot2s	%f1,	%f11,	%f5
loop_1275:
	nop
	setx	0xD885BFDB,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f13
	fsqrts	%f13,	%f6
loop_1276:
	srlx	%o6,	%l2,	%i1
	movne	%icc,	%g7,	%o7
	srax	%i4,	0x14,	%i0
	movl	%xcc,	%o1,	%o5
	xnor	%l5,	%g5,	%i3
	movvs	%xcc,	%o0,	%g4
	fzeros	%f9
	edge8	%g3,	%g1,	%o3
	fbne	%fcc2,	loop_1277
	edge8	%g2,	%i6,	%o4
	bgu,pt	%xcc,	loop_1278
	fnegd	%f8,	%f20
loop_1277:
	brgz,a	%i5,	loop_1279
	alignaddrl	%l4,	%l3,	%g6
loop_1278:
	array8	%i7,	%l1,	%i2
	nop
	setx loop_1280, %l0, %l1
	jmpl %l1, %l6
loop_1279:
	nop
	setx loop_1281, %l0, %l1
	jmpl %l1, %o2
	fmovdvs	%xcc,	%f20,	%f23
	fnors	%f8,	%f22,	%f17
loop_1280:
	fcmpeq32	%f26,	%f22,	%o6
loop_1281:
	nop
	setx	0x7D06E48FA07E9C8C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x50]
	ldx	[%l7 + 0x50],	%fsr
	sethi	0x11A5,	%l0
	sth	%i1,	[%l7 + 0x7A]
	tvs	%icc,	0x0
	xorcc	%l2,	0x1AD7,	%g7
	tl	%xcc,	0x4
	swap	[%l7 + 0x70],	%o7
	tpos	%xcc,	0x7
	fmovsleu	%icc,	%f29,	%f26
	edge8l	%i4,	%o1,	%o5
	taddcctv	%l5,	%i0,	%g5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnot2s	%f1,	%f2
	tcs	%xcc,	0x6
	sdiv	%i3,	0x1103,	%o0
	bne,pt	%icc,	loop_1282
	te	%xcc,	0x6
	set	0x50, %g4
	ldxa	[%l7 + %g4] 0x89,	%g3
loop_1282:
	fmovdcc	%xcc,	%f30,	%f4
	andncc	%g1,	%g4,	%o3
	movgu	%icc,	%i6,	%o4
	edge16ln	%i5,	%l4,	%g2
	movrgz	%g6,	%i7,	%l3
	swap	[%l7 + 0x38],	%i2
	fmovsg	%xcc,	%f20,	%f8
	movcc	%icc,	%l1,	%l6
	sdivcc	%o6,	0x035C,	%o2
	fmovdl	%icc,	%f17,	%f31
	movcs	%xcc,	%i1,	%l0
	array8	%g7,	%o7,	%i4
	movvs	%icc,	%o1,	%l2
	edge8ln	%o5,	%l5,	%i0
	mova	%icc,	%g5,	%o0
	fpadd32	%f22,	%f26,	%f6
	wr	%g0,	0x21,	%asi
	stxa	%g3,	[%g0 + 0x108] %asi
	fmovrdgez	%g1,	%f24,	%f18
	alignaddr	%i3,	%o3,	%i6
	fpsub32s	%f5,	%f0,	%f7
	fsrc1s	%f5,	%f2
	edge8n	%o4,	%i5,	%g4
	tleu	%icc,	0x6
	fands	%f28,	%f6,	%f29
	udivcc	%g2,	0x08A6,	%l4
	alignaddrl	%g6,	%i7,	%l3
	sdivx	%l1,	0x1CB5,	%l6
	set	0x40, %i0
	ldda	[%l7 + %i0] 0x2f,	%o6
	wr	%g0,	0x80,	%asi
	prefetcha	[%l7 + 0x68] %asi,	 0x3
	tle	%icc,	0x0
	movge	%icc,	%o2,	%l0
	nop
	set	0x70, %l4
	ldsw	[%l7 + %l4],	%g7
	udiv	%o7,	0x076E,	%i1
	movleu	%xcc,	%i4,	%l2
	tneg	%xcc,	0x7
	alignaddr	%o5,	%o1,	%l5
	movrne	%g5,	0x02B,	%i0
	taddcctv	%g3,	%g1,	%o0
	tgu	%xcc,	0x0
	fba,a	%fcc1,	loop_1283
	tn	%icc,	0x3
	movrne	%o3,	%i6,	%i3
	edge32ln	%i5,	%o4,	%g4
loop_1283:
	nop
	set	0x3C, %i7
	lda	[%l7 + %i7] 0x89,	%f11
	tvc	%icc,	0x4
	fmovrsne	%g2,	%f19,	%f6
	taddcc	%g6,	%l4,	%i7
	nop
	setx loop_1284, %l0, %l1
	jmpl %l1, %l1
	ldsb	[%l7 + 0x49],	%l3
	srlx	%l6,	0x0E,	%i2
	mova	%xcc,	%o6,	%o2
loop_1284:
	fmovdvs	%xcc,	%f8,	%f4
	ta	%icc,	0x3
	mulscc	%l0,	%o7,	%i1
	tg	%icc,	0x5
	nop
	setx	loop_1285,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movleu	%icc,	%g7,	%l2
	addc	%o5,	%o1,	%l5
	tn	%icc,	0x6
loop_1285:
	movrne	%i4,	0x0A3,	%i0
	brlz,a	%g3,	loop_1286
	edge16ln	%g1,	%o0,	%o3
	bcs,a	%xcc,	loop_1287
	fornot2s	%f22,	%f2,	%f6
loop_1286:
	fnand	%f22,	%f28,	%f26
	sethi	0x1AB1,	%i6
loop_1287:
	umul	%i3,	0x148D,	%g5
	fmovsne	%icc,	%f27,	%f21
	nop
	setx	loop_1288,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	andcc	%i5,	0x0424,	%o4
	movleu	%icc,	%g4,	%g6
	wr	%g0,	0x22,	%asi
	stha	%l4,	[%l7 + 0x64] %asi
	membar	#Sync
loop_1288:
	fornot2s	%f6,	%f30,	%f29
	movrgez	%i7,	0x1B1,	%l1
	ld	[%l7 + 0x14],	%f2
	addc	%g2,	%l6,	%l3
	movneg	%icc,	%i2,	%o6
	udivcc	%l0,	0x0F96,	%o2
	fmovrdgz	%o7,	%f16,	%f2
	bge,a	%xcc,	loop_1289
	ba,pt	%xcc,	loop_1290
	move	%xcc,	%i1,	%l2
	movpos	%icc,	%g7,	%o5
loop_1289:
	movrlz	%l5,	0x16B,	%o1
loop_1290:
	xor	%i4,	%g3,	%i0
	movneg	%icc,	%g1,	%o3
	xorcc	%i6,	0x0019,	%o0
	fblg,a	%fcc2,	loop_1291
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x22,	%asi
	ldda	[%l7 + 0x40] %asi,	%i2
loop_1291:
	xnor	%g5,	0x12C1,	%i5
	add	%o4,	%g4,	%g6
	stw	%l4,	[%l7 + 0x0C]
	fbuge,a	%fcc2,	loop_1292
	array16	%i7,	%g2,	%l6
	xor	%l3,	%l1,	%i2
	sethi	0x165D,	%o6
loop_1292:
	fmovdvs	%icc,	%f1,	%f31
	xor	%o2,	%o7,	%l0
	alignaddr	%i1,	%l2,	%o5
	edge32ln	%l5,	%g7,	%i4
	fmovda	%xcc,	%f10,	%f11
	fandnot1	%f28,	%f30,	%f26
	nop
	fitod	%f12,	%f12
	fdtox	%f12,	%f6
	brlz,a	%o1,	loop_1293
	tne	%xcc,	0x7
	movrgz	%i0,	%g3,	%g1
	std	%f24,	[%l7 + 0x70]
loop_1293:
	brnz,a	%i6,	loop_1294
	fmovscc	%xcc,	%f14,	%f7
	fnot1	%f22,	%f16
	orn	%o0,	0x0D48,	%i3
loop_1294:
	flush	%l7 + 0x24
	sll	%o3,	%i5,	%g5
	brlez	%g4,	loop_1295
	fmul8x16al	%f17,	%f15,	%f20
	sir	0x0AE7
	tsubcc	%g6,	%o4,	%i7
loop_1295:
	fpsub16s	%f16,	%f23,	%f21
	tcc	%xcc,	0x4
	tge	%icc,	0x4
	bneg,a,pt	%icc,	loop_1296
	edge8n	%g2,	%l6,	%l3
	udivx	%l4,	0x19B6,	%i2
	movcs	%icc,	%l1,	%o2
loop_1296:
	addcc	%o7,	%o6,	%l0
	nop
	setx	0x805E6EFE,	%l0,	%l6
	st	%l6,	[%l7 + 0x18]
	ld	[%l7 + 0x18],	%fsr
	fmovsgu	%xcc,	%f23,	%f12
	te	%xcc,	0x0
	edge32	%l2,	%i1,	%o5
	udivcc	%g7,	0x1056,	%i4
	fmovdge	%xcc,	%f31,	%f17
	ld	[%l7 + 0x38],	%f8
	movge	%xcc,	%o1,	%i0
	set	0x5C, %g7
	stwa	%g3,	[%l7 + %g7] 0x81
	fxnor	%f30,	%f28,	%f26
	mova	%xcc,	%g1,	%i6
	movrgz	%l5,	0x2AF,	%i3
	stw	%o3,	[%l7 + 0x6C]
	movneg	%xcc,	%i5,	%g5
	edge32	%g4,	%g6,	%o4
	bgu	%xcc,	loop_1297
	tl	%xcc,	0x0
	ta	%xcc,	0x7
	sdiv	%i7,	0x0558,	%o0
loop_1297:
	udivx	%g2,	0x006D,	%l3
	xnor	%l6,	%l4,	%l1
	nop
	fitod	%f4,	%f10
	fdtox	%f10,	%f0
	fxtod	%f0,	%f0
	sdivx	%i2,	0x0AFA,	%o7
	udivx	%o2,	0x1D76,	%o6
	tneg	%icc,	0x2
	fxnors	%f14,	%f29,	%f4
	sethi	0x1467,	%l0
	movcc	%xcc,	%i1,	%l2
	fblg	%fcc0,	loop_1298
	tn	%icc,	0x5
	set	0x58, %g3
	ldswa	[%l7 + %g3] 0x11,	%g7
loop_1298:
	movrne	%o5,	%i4,	%o1
	stbar
	sra	%i0,	0x1B,	%g1
	alignaddrl	%g3,	%i6,	%l5
	bne,a,pt	%icc,	loop_1299
	addc	%o3,	%i3,	%i5
	membar	0x3E
	orn	%g4,	0x069A,	%g5
loop_1299:
	nop
	fitos	%f2,	%f0
	fstoi	%f0,	%f11
	edge32	%g6,	%o4,	%o0
	lduh	[%l7 + 0x1A],	%g2
	nop
	setx	0xF052E07A,	%l0,	%l6
	st	%l6,	[%l7 + 0x30]
	ld	[%l7 + 0x30],	%fsr
	set	0x7C, %o5
	lda	[%l7 + %o5] 0x15,	%f4
	sdivcc	%i7,	0x09ED,	%l3
	brlz	%l4,	loop_1300
	movl	%icc,	%l6,	%l1
	sub	%i2,	0x13CB,	%o2
	tsubcctv	%o6,	%l0,	%i1
loop_1300:
	fnegd	%f26,	%f12
	fnor	%f8,	%f2,	%f0
	umulcc	%l2,	%o7,	%g7
	bleu,a,pt	%icc,	loop_1301
	edge32l	%i4,	%o5,	%i0
	srl	%o1,	%g3,	%i6
	movl	%icc,	%l5,	%g1
loop_1301:
	move	%xcc,	%o3,	%i3
	srlx	%g4,	%i5,	%g5
	sdiv	%o4,	0x104B,	%o0
	membar	0x10
	fmovsleu	%icc,	%f12,	%f9
	udiv	%g6,	0x09A4,	%i7
	wr	%g0,	0x18,	%asi
	ldsba	[%l7 + 0x08] %asi,	%g2
	movleu	%icc,	%l4,	%l6
	tcc	%icc,	0x0
	tneg	%icc,	0x4
	or	%l3,	%i2,	%o2
	umul	%l1,	0x1DEE,	%l0
	bg	%icc,	loop_1302
	membar	0x1D
	movrgz	%i1,	%l2,	%o6
	brgz	%g7,	loop_1303
loop_1302:
	andn	%o7,	%i4,	%i0
	movneg	%icc,	%o1,	%g3
	orcc	%i6,	0x0E9A,	%o5
loop_1303:
	edge8l	%g1,	%o3,	%i3
	fnot1s	%f7,	%f12
	udivx	%g4,	0x0225,	%l5
	fmovspos	%xcc,	%f2,	%f8
	alignaddrl	%i5,	%g5,	%o0
	fnegd	%f14,	%f0
	fbne	%fcc2,	loop_1304
	fand	%f6,	%f30,	%f10
	fmovdleu	%xcc,	%f9,	%f8
	set	0x10, %o7
	stwa	%o4,	[%l7 + %o7] 0x2a
	membar	#Sync
loop_1304:
	bvc,a,pt	%icc,	loop_1305
	srax	%i7,	0x13,	%g6
	fmovdge	%xcc,	%f17,	%f5
	popc	%g2,	%l6
loop_1305:
	bcs,a	loop_1306
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movg	%xcc,	%l4,	%l3
	movvc	%xcc,	%i2,	%l1
loop_1306:
	bleu	loop_1307
	nop
	setx	0xFAE75D45,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f14
	fsqrts	%f14,	%f3
	tsubcctv	%o2,	%l0,	%i1
	fabsd	%f10,	%f16
loop_1307:
	ldsw	[%l7 + 0x30],	%l2
	udiv	%g7,	0x04B5,	%o7
	fnegd	%f18,	%f0
	bne,a,pn	%xcc,	loop_1308
	alignaddr	%o6,	%i0,	%i4
	fmovdvs	%xcc,	%f14,	%f1
	fmovsle	%icc,	%f10,	%f31
loop_1308:
	bleu	loop_1309
	tne	%xcc,	0x7
	addc	%g3,	%o1,	%o5
	nop
	setx loop_1310, %l0, %l1
	jmpl %l1, %g1
loop_1309:
	xor	%o3,	0x1666,	%i6
	fblg,a	%fcc3,	loop_1311
	fble,a	%fcc0,	loop_1312
loop_1310:
	xnor	%g4,	%l5,	%i5
	fabss	%f4,	%f19
loop_1311:
	fzeros	%f31
loop_1312:
	ldd	[%l7 + 0x10],	%i2
	ldub	[%l7 + 0x62],	%g5
	wr	%g0,	0x0c,	%asi
	ldswa	[%l7 + 0x68] %asi,	%o4
	tneg	%xcc,	0x7
	sll	%o0,	0x02,	%g6
	set	0x0A, %l2
	ldsha	[%l7 + %l2] 0x15,	%i7
	movl	%icc,	%l6,	%g2
	for	%f4,	%f14,	%f20
	wr	%g0,	0x88,	%asi
	ldxa	[%l7 + 0x50] %asi,	%l4
	fcmpeq32	%f30,	%f2,	%l3
	ba,a	%icc,	loop_1313
	tsubcctv	%i2,	0x106E,	%o2
	edge16ln	%l1,	%i1,	%l2
	popc	%g7,	%l0
loop_1313:
	smul	%o7,	0x0D26,	%o6
	movrgz	%i0,	%i4,	%g3
	fmovsa	%icc,	%f27,	%f23
	nop
	setx	0xD0645E53,	%l0,	%l6
	st	%l6,	[%l7 + 0x60]
	ld	[%l7 + 0x60],	%fsr
	tcs	%xcc,	0x5
	wr	%g0,	0x89,	%asi
	stha	%o1,	[%l7 + 0x2E] %asi
	subc	%g1,	0x0477,	%o5
	movneg	%icc,	%i6,	%g4
	edge8n	%o3,	%i5,	%l5
	sdiv	%i3,	0x1CB1,	%g5
	tcs	%icc,	0x7
	fzeros	%f5
	fpsub32	%f28,	%f22,	%f26
	bpos,a,pt	%icc,	loop_1314
	addcc	%o4,	0x1E0B,	%g6
	stb	%i7,	[%l7 + 0x3D]
	tgu	%icc,	0x3
loop_1314:
	bl,a	loop_1315
	fsrc2	%f6,	%f16
	srl	%o0,	0x10,	%g2
	tle	%icc,	0x1
loop_1315:
	fmul8ulx16	%f14,	%f20,	%f8
	fandnot1	%f16,	%f10,	%f26
	wr	%g0,	0x10,	%asi
	ldsha	[%l7 + 0x0A] %asi,	%l4
	mulscc	%l6,	%i2,	%l3
	sth	%l1,	[%l7 + 0x6C]
	tsubcctv	%o2,	%i1,	%g7
	udivcc	%l2,	0x1ED0,	%l0
	movcs	%xcc,	%o6,	%o7
	srl	%i0,	%g3,	%i4
	sub	%g1,	%o1,	%o5
	nop
	setx	0xF048D1E4,	%l0,	%l6
	st	%l6,	[%l7 + 0x18]
	ld	[%l7 + 0x18],	%fsr
	sdivx	%i6,	0x1189,	%g4
	fmovsvs	%icc,	%f16,	%f31
	movrgz	%o3,	0x10D,	%l5
	sdivx	%i3,	0x085E,	%g5
	swap	[%l7 + 0x28],	%i5
	add	%l7,	0x74,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%g6
	casa	[%l6] 0x81,	%g6,	%o4
	fble	%fcc1,	loop_1316
	fbule	%fcc0,	loop_1317
	fxnor	%f24,	%f2,	%f14
	wr	%g0,	0x0c,	%asi
	ldswa	[%l7 + 0x14] %asi,	%i7
loop_1316:
	movl	%xcc,	%g2,	%o0
loop_1317:
	edge8l	%l6,	%i2,	%l4
	set	0x0C, %o1
	lduwa	[%l7 + %o1] 0x88,	%l1
	fmovdg	%xcc,	%f18,	%f22
	fmovrdgez	%o2,	%f16,	%f16
	edge32n	%l3,	%i1,	%g7
	edge16ln	%l0,	%l2,	%o6
	stb	%o7,	[%l7 + 0x62]
	subc	%i0,	%i4,	%g1
	edge32	%o1,	%g3,	%i6
	andcc	%g4,	0x15A8,	%o3
	array32	%o5,	%l5,	%i3
	sth	%g5,	[%l7 + 0x54]
	fxor	%f26,	%f22,	%f22
	fmovrdlez	%i5,	%f20,	%f12
	movvc	%xcc,	%g6,	%o4
	bg	loop_1318
	tsubcc	%i7,	%o0,	%l6
	edge32n	%i2,	%l4,	%l1
	movleu	%xcc,	%o2,	%l3
loop_1318:
	movre	%i1,	%g7,	%g2
	wr	%g0,	0x04,	%asi
	lda	[%l7 + 0x48] %asi,	%f13
	sethi	0x1D4B,	%l0
	orcc	%o6,	%l2,	%i0
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x0A] %asi,	%o7
	add	%l7,	0x48,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%i4,	%o1
	fexpand	%f30,	%f8
	edge16ln	%g3,	%g1,	%i6
	tge	%icc,	0x1
	fbug,a	%fcc3,	loop_1319
	array32	%g4,	%o5,	%l5
	taddcc	%i3,	0x0795,	%o3
	fone	%f12
loop_1319:
	fsrc2s	%f30,	%f22
	fble	%fcc0,	loop_1320
	pdist	%f10,	%f2,	%f16
	umulcc	%g5,	%g6,	%o4
	bcs,pn	%xcc,	loop_1321
loop_1320:
	movvs	%xcc,	%i7,	%o0
	fnors	%f16,	%f27,	%f23
	fmovdg	%icc,	%f29,	%f8
loop_1321:
	fmovdleu	%icc,	%f10,	%f22
	mulscc	%i5,	0x0964,	%l6
	movrgz	%i2,	0x3E9,	%l1
	fmovsneg	%icc,	%f20,	%f15
	tcs	%icc,	0x7
	tne	%xcc,	0x0
	mulscc	%l4,	0x0531,	%o2
	mova	%xcc,	%i1,	%l3
	bge,pn	%icc,	loop_1322
	movne	%icc,	%g2,	%g7
	edge32l	%o6,	%l2,	%i0
	array8	%l0,	%i4,	%o1
loop_1322:
	add	%o7,	0x1872,	%g3
	bcs,a	loop_1323
	fbn,a	%fcc1,	loop_1324
	edge32l	%i6,	%g4,	%o5
	fmovsn	%xcc,	%f27,	%f24
loop_1323:
	fmovdne	%xcc,	%f11,	%f30
loop_1324:
	movre	%g1,	0x0BA,	%i3
	movrne	%o3,	0x1FD,	%g5
	fbuge,a	%fcc2,	loop_1325
	tsubcc	%l5,	%o4,	%g6
	fpmerge	%f24,	%f19,	%f8
	movvs	%xcc,	%i7,	%i5
loop_1325:
	sdiv	%l6,	0x018B,	%o0
	fmovdvc	%icc,	%f7,	%f0
	taddcctv	%l1,	%l4,	%o2
	edge32n	%i1,	%l3,	%i2
	mova	%icc,	%g2,	%o6
	orncc	%g7,	0x0D47,	%l2
	sub	%l0,	%i0,	%i4
	nop
	fitos	%f7,	%f8
	fstod	%f8,	%f2
	tpos	%xcc,	0x6
	tpos	%xcc,	0x6
	srlx	%o1,	0x03,	%o7
	edge32n	%g3,	%i6,	%o5
	addccc	%g4,	0x0203,	%i3
	ldsw	[%l7 + 0x08],	%o3
	bvc,a	loop_1326
	fmovdg	%xcc,	%f3,	%f12
	orcc	%g5,	%l5,	%o4
	srlx	%g1,	0x18,	%i7
loop_1326:
	nop
	wr	%g0,	0x89,	%asi
	sta	%f18,	[%l7 + 0x78] %asi
	edge32	%g6,	%l6,	%i5
	nop
	setx	0xF4C80516,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f1
	setx	0x80C1B18A,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f20
	fsubs	%f20,	%f1,	%f26
	fmovse	%icc,	%f20,	%f0
	movrne	%o0,	0x3C1,	%l4
	fbl	%fcc2,	loop_1327
	edge32ln	%l1,	%o2,	%l3
	nop
	fitod	%f6,	%f16
	fdtoi	%f16,	%f11
	nop
	setx	0xE5B472604A3F8F38,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	fsqrtd	%f26,	%f10
loop_1327:
	movge	%xcc,	%i2,	%i1
	xor	%o6,	%g2,	%l2
	fbul,a	%fcc2,	loop_1328
	xnorcc	%g7,	%i0,	%i4
	fbule,a	%fcc0,	loop_1329
	flush	%l7 + 0x64
loop_1328:
	nop
	fitos	%f14,	%f7
	fstox	%f7,	%f14
	fxtos	%f14,	%f23
	array8	%o1,	%o7,	%l0
loop_1329:
	alignaddr	%g3,	%o5,	%g4
	popc	0x0665,	%i6
	movgu	%icc,	%i3,	%g5
	movvc	%xcc,	%o3,	%o4
	sth	%l5,	[%l7 + 0x20]
	alignaddr	%i7,	%g6,	%l6
	nop
	setx	0xEB07342F,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f23
	setx	0x9A39D6B3,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f15
	fadds	%f15,	%f23,	%f12
	te	%xcc,	0x0
	andcc	%g1,	%o0,	%i5
	andcc	%l1,	%l4,	%o2
	sdivx	%l3,	0x0029,	%i1
	add	%i2,	%g2,	%o6
	fzero	%f6
	taddcctv	%l2,	0x19F5,	%i0
	set	0x24, %o3
	lduwa	[%l7 + %o3] 0x11,	%i4
	fmovsneg	%icc,	%f3,	%f11
	fmovrde	%o1,	%f14,	%f4
	edge8ln	%o7,	%l0,	%g7
	ldsb	[%l7 + 0x0D],	%o5
	fpadd16s	%f3,	%f18,	%f29
	tvc	%xcc,	0x6
	fmovdvs	%icc,	%f8,	%f4
	addcc	%g3,	0x0D2B,	%i6
	tsubcc	%g4,	0x1122,	%g5
	nop
	setx	loop_1330,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movne	%icc,	%i3,	%o4
	stb	%o3,	[%l7 + 0x0A]
	udivx	%i7,	0x1E9F,	%g6
loop_1330:
	bl	%xcc,	loop_1331
	bgu,a,pn	%xcc,	loop_1332
	movre	%l5,	0x02C,	%g1
	fmovscs	%icc,	%f7,	%f15
loop_1331:
	ldsh	[%l7 + 0x18],	%o0
loop_1332:
	taddcctv	%l6,	0x1C0D,	%l1
	fmovsleu	%xcc,	%f1,	%f24
	fmovrdne	%l4,	%f24,	%f28
	wr	%g0,	0x88,	%asi
	swapa	[%l7 + 0x38] %asi,	%o2
	andn	%l3,	0x0B37,	%i5
	bgu	%xcc,	loop_1333
	taddcc	%i2,	%g2,	%o6
	fnors	%f12,	%f3,	%f24
	tvs	%xcc,	0x5
loop_1333:
	ldsb	[%l7 + 0x52],	%i1
	orncc	%l2,	0x1FDD,	%i0
	fmovdn	%icc,	%f13,	%f26
	brnz,a	%o1,	loop_1334
	movpos	%icc,	%o7,	%l0
	brlz,a	%g7,	loop_1335
	nop
	setx	loop_1336,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_1334:
	nop
	setx	0xFD041229007F7526,	%l0,	%l6
	stx	%l6,	[%l7 + 0x18]
	ldx	[%l7 + 0x18],	%fsr
	addccc	%i4,	%g3,	%o5
loop_1335:
	sllx	%g4,	%i6,	%i3
loop_1336:
	sll	%o4,	%o3,	%g5
	set	0x20, %o0
	stxa	%i7,	[%g0 + %o0] 0x4f
	ldsh	[%l7 + 0x1E],	%g6
	bneg,a	loop_1337
	brz,a	%g1,	loop_1338
	or	%o0,	%l5,	%l6
	tcc	%icc,	0x5
loop_1337:
	tvs	%icc,	0x2
loop_1338:
	edge16l	%l1,	%o2,	%l4
	tne	%icc,	0x7
	movrne	%l3,	0x13D,	%i5
	edge32	%g2,	%i2,	%i1
	xor	%o6,	0x1C4F,	%i0
	fmul8ulx16	%f22,	%f12,	%f12
	umul	%o1,	0x0449,	%l2
	fbl,a	%fcc0,	loop_1339
	movl	%icc,	%o7,	%l0
	stbar
	fbu	%fcc2,	loop_1340
loop_1339:
	tn	%icc,	0x2
	nop
	setx	0x2FA891EC,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f20
	fsqrts	%f20,	%f3
	bgu	loop_1341
loop_1340:
	ldstub	[%l7 + 0x7D],	%i4
	fandnot1	%f24,	%f26,	%f28
	tle	%icc,	0x3
loop_1341:
	nop
	fitos	%f7,	%f19
	fstoi	%f19,	%f11
	srlx	%g7,	%g3,	%g4
	udivx	%o5,	0x0E57,	%i3
	nop
	setx	0x20360950E07012DE,	%l0,	%l6
	stx	%l6,	[%l7 + 0x38]
	ldx	[%l7 + 0x38],	%fsr
	wr	%g0,	0x11,	%asi
	ldswa	[%l7 + 0x54] %asi,	%i6
	edge16n	%o3,	%g5,	%o4
	fcmpeq32	%f6,	%f12,	%i7
	mulx	%g1,	%o0,	%l5
	add	%g6,	0x04FD,	%l1
	bvs	loop_1342
	fbo	%fcc0,	loop_1343
	fbn	%fcc0,	loop_1344
	nop
	fitod	%f6,	%f8
	fdtox	%f8,	%f28
loop_1342:
	subccc	%o2,	%l6,	%l3
loop_1343:
	alignaddr	%i5,	%g2,	%i2
loop_1344:
	subccc	%l4,	%i1,	%i0
	sll	%o6,	%o1,	%o7
	stbar
	andcc	%l2,	%l0,	%g7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addccc	%i4,	%g3,	%o5
	array8	%g4,	%i3,	%i6
	sllx	%o3,	0x18,	%g5
	subccc	%i7,	%g1,	%o0
	edge8n	%l5,	%g6,	%l1
	mulscc	%o2,	0x0354,	%o4
	brgez	%l6,	loop_1345
	orncc	%i5,	0x1674,	%g2
	set	0x40, %i6
	stda	%f16,	[%l7 + %i6] 0x1f
	membar	#Sync
loop_1345:
	sub	%l3,	0x18FF,	%l4
	stw	%i2,	[%l7 + 0x60]
	move	%icc,	%i1,	%o6
	bneg,pt	%xcc,	loop_1346
	sethi	0x0413,	%i0
	fmovdgu	%icc,	%f16,	%f10
	fbg	%fcc1,	loop_1347
loop_1346:
	movge	%icc,	%o1,	%o7
	nop
	setx	loop_1348,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movleu	%xcc,	%l2,	%g7
loop_1347:
	xor	%l0,	0x17ED,	%g3
	fbn	%fcc3,	loop_1349
loop_1348:
	fmovse	%xcc,	%f17,	%f24
	movrgez	%i4,	0x270,	%g4
	edge8ln	%i3,	%o5,	%i6
loop_1349:
	fbule,a	%fcc2,	loop_1350
	sdivx	%g5,	0x1012,	%o3
	bne,pt	%icc,	loop_1351
	edge16n	%g1,	%i7,	%o0
loop_1350:
	xnorcc	%l5,	%g6,	%o2
	movgu	%icc,	%l1,	%o4
loop_1351:
	nop
	add	%l7,	0x68,	%l6
	wr	%g0,	0x18,	%asi
	casxa	[%l6] 0x18,	%i5,	%l6
	nop
	setx	0x9B98E3A1,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f27
	fsqrts	%f27,	%f8
	sir	0x17D9
	movrgez	%g2,	%l4,	%i2
	fmovse	%icc,	%f5,	%f28
	fmovdge	%icc,	%f15,	%f25
	fmovrde	%l3,	%f24,	%f30
	fmovdcs	%icc,	%f9,	%f20
	fbe,a	%fcc1,	loop_1352
	subcc	%i1,	%i0,	%o1
	movrlez	%o7,	%o6,	%l2
	bgu,pn	%xcc,	loop_1353
loop_1352:
	movrgez	%l0,	0x372,	%g7
	addcc	%g3,	0x0792,	%g4
	ldsb	[%l7 + 0x1E],	%i3
loop_1353:
	brz,a	%i4,	loop_1354
	movne	%icc,	%i6,	%o5
	fbl,a	%fcc0,	loop_1355
	edge8l	%o3,	%g5,	%i7
loop_1354:
	sdivx	%o0,	0x108C,	%l5
	movrgz	%g1,	%o2,	%l1
loop_1355:
	movvc	%xcc,	%o4,	%i5
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x24] %asi,	%l6
	fpsub32	%f30,	%f20,	%f2
	orn	%g6,	0x0AD4,	%g2
	andn	%i2,	%l3,	%l4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnor	%i0,	0x107A,	%i1
	andn	%o1,	0x0736,	%o7
	movl	%icc,	%l2,	%l0
	subcc	%o6,	%g7,	%g4
	orcc	%g3,	%i4,	%i3
	fnot2s	%f19,	%f12
	array32	%o5,	%o3,	%i6
	fmovrsgez	%g5,	%f12,	%f27
	movrgez	%o0,	%l5,	%i7
	movcs	%xcc,	%g1,	%l1
	brnz,a	%o2,	loop_1356
	for	%f24,	%f4,	%f2
	alignaddr	%i5,	%l6,	%o4
	array16	%g6,	%i2,	%l3
loop_1356:
	ldx	[%l7 + 0x18],	%l4
	umulcc	%g2,	0x179E,	%i1
	bn,pn	%xcc,	loop_1357
	nop
	set	0x48, %g6
	ldub	[%l7 + %g6],	%i0
	fone	%f30
	sdivcc	%o1,	0x1A95,	%o7
loop_1357:
	fmovsvc	%icc,	%f1,	%f28
	fpack32	%f4,	%f12,	%f20
	brlz	%l2,	loop_1358
	fbn	%fcc3,	loop_1359
	array16	%o6,	%g7,	%l0
	sdivcc	%g3,	0x0F8F,	%g4
loop_1358:
	ldd	[%l7 + 0x40],	%i2
loop_1359:
	nop
	fitod	%f2,	%f8
	fdtox	%f8,	%f18
	fxtod	%f18,	%f0
	fbge	%fcc2,	loop_1360
	umul	%o5,	0x03A3,	%i4
	bl,a	loop_1361
	edge32l	%o3,	%g5,	%o0
loop_1360:
	tvc	%icc,	0x0
	sll	%l5,	%i6,	%g1
loop_1361:
	fmovda	%icc,	%f9,	%f13
	fmul8sux16	%f20,	%f28,	%f10
	sir	0x1DA4
	nop
	fitos	%f9,	%f25
	fstox	%f25,	%f26
	fxtos	%f26,	%f20
	brgz,a	%i7,	loop_1362
	movg	%xcc,	%l1,	%i5
	addcc	%o2,	%o4,	%l6
	tsubcc	%g6,	0x1199,	%l3
loop_1362:
	tpos	%icc,	0x3
	alignaddr	%l4,	%g2,	%i1
	edge8	%i0,	%o1,	%i2
	movrne	%l2,	%o7,	%o6
	nop
	fitos	%f4,	%f5
	fstod	%f5,	%f2
	edge32n	%g7,	%l0,	%g3
	wr	%g0,	0x19,	%asi
	stba	%g4,	[%l7 + 0x6E] %asi
	fmovdneg	%icc,	%f4,	%f9
	sra	%i3,	%o5,	%o3
	bg,a,pn	%icc,	loop_1363
	sll	%i4,	0x0F,	%o0
	wr	%g0,	0x89,	%asi
	lda	[%l7 + 0x54] %asi,	%f31
loop_1363:
	nop
	wr	%g0,	0x18,	%asi
	stxa	%g5,	[%l7 + 0x40] %asi
	mulscc	%i6,	0x038E,	%l5
	tle	%icc,	0x3
	tvs	%xcc,	0x2
	fpadd32s	%f25,	%f30,	%f9
	orncc	%i7,	0x0A2C,	%g1
	mulscc	%l1,	0x177B,	%o2
	addc	%o4,	0x1B9F,	%i5
	sethi	0x14AE,	%l6
	edge16	%g6,	%l3,	%g2
	movpos	%icc,	%l4,	%i1
	sllx	%i0,	0x03,	%i2
	orn	%o1,	0x0242,	%o7
	edge16ln	%l2,	%o6,	%g7
	edge8ln	%l0,	%g3,	%g4
	move	%xcc,	%i3,	%o3
	sll	%o5,	%o0,	%i4
	srl	%g5,	%l5,	%i7
	ta	%xcc,	0x0
	fsrc1	%f0,	%f8
	mulx	%i6,	0x0105,	%g1
	fmovrdne	%o2,	%f14,	%f26
	fandnot2	%f4,	%f12,	%f20
	movleu	%xcc,	%o4,	%l1
	edge16l	%l6,	%g6,	%i5
	brgz,a	%l3,	loop_1364
	xnorcc	%g2,	0x0747,	%l4
	move	%xcc,	%i0,	%i2
	subcc	%o1,	0x1E27,	%o7
loop_1364:
	alignaddr	%i1,	%l2,	%g7
	fnot1s	%f0,	%f24
	movneg	%icc,	%l0,	%g3
	add	%l7,	0x78,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%o6
	casa	[%l6] 0x80,	%o6,	%g4
	movvs	%icc,	%o3,	%i3
	move	%icc,	%o5,	%o0
	mulscc	%g5,	%l5,	%i4
	movl	%xcc,	%i7,	%g1
	set	0x4B, %l5
	ldstuba	[%l7 + %l5] 0x19,	%i6
	sdivcc	%o2,	0x01A0,	%o4
	tge	%xcc,	0x7
	ldd	[%l7 + 0x18],	%f28
	smulcc	%l6,	%l1,	%g6
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x28] %asi,	%l3
	srlx	%g2,	%l4,	%i0
	movpos	%xcc,	%i5,	%o1
	fornot1s	%f19,	%f13,	%f22
	tne	%icc,	0x0
	bleu,a	%icc,	loop_1365
	bne,pt	%icc,	loop_1366
	tsubcctv	%i2,	%i1,	%o7
	fbe	%fcc1,	loop_1367
loop_1365:
	movrne	%g7,	0x225,	%l2
loop_1366:
	move	%icc,	%l0,	%g3
	sethi	0x1C7A,	%o6
loop_1367:
	fmovrslz	%g4,	%f14,	%f1
	tge	%xcc,	0x1
	tn	%xcc,	0x4
	movrlz	%o3,	0x283,	%o5
	fabsd	%f8,	%f4
	lduw	[%l7 + 0x48],	%o0
	bg	loop_1368
	sethi	0x182F,	%g5
	sub	%i3,	0x09B1,	%l5
	tgu	%xcc,	0x3
loop_1368:
	mulx	%i4,	%i7,	%i6
	taddcc	%g1,	%o2,	%o4
	movpos	%icc,	%l6,	%l1
	tg	%icc,	0x4
	movcc	%icc,	%g6,	%g2
	fmovsvc	%icc,	%f10,	%f19
	srax	%l4,	%l3,	%i5
	sub	%o1,	%i0,	%i1
	ldstub	[%l7 + 0x30],	%i2
	fpsub32	%f0,	%f14,	%f16
	alignaddrl	%g7,	%l2,	%l0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsleu	%xcc,	%f29,	%f14
	and	%o7,	0x1DCB,	%g3
	movleu	%icc,	%o6,	%o3
	bcs,pt	%xcc,	loop_1369
	movcc	%xcc,	%o5,	%o0
	andncc	%g5,	%g4,	%l5
	andcc	%i4,	0x041F,	%i3
loop_1369:
	movrgez	%i6,	%g1,	%i7
	tge	%icc,	0x4
	bgu,a	loop_1370
	edge8	%o2,	%l6,	%l1
	movl	%icc,	%o4,	%g2
	popc	%l4,	%g6
loop_1370:
	orncc	%l3,	0x0017,	%o1
	edge16	%i5,	%i1,	%i0
	sllx	%i2,	%l2,	%l0
	lduw	[%l7 + 0x50],	%g7
	wr	%g0,	0x18,	%asi
	ldstuba	[%l7 + 0x5D] %asi,	%g3
	mulscc	%o6,	%o3,	%o5
	bpos,a,pn	%icc,	loop_1371
	fmovsvc	%icc,	%f7,	%f23
	edge16	%o0,	%o7,	%g5
	ldx	[%l7 + 0x58],	%g4
loop_1371:
	fmovrslz	%l5,	%f31,	%f12
	wr	%g0,	0x88,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	tsubcctv	%i4,	0x1762,	%i6
	set	0x1D, %i4
	lduba	[%l7 + %i4] 0x11,	%g1
	taddcc	%i3,	%i7,	%l6
	bvs,pn	%xcc,	loop_1372
	xnor	%o2,	0x14FF,	%l1
	wr	%g0,	0x89,	%asi
	ldda	[%l7 + 0x10] %asi,	%g2
loop_1372:
	udivx	%o4,	0x05A7,	%g6
	swap	[%l7 + 0x30],	%l3
	fba	%fcc2,	loop_1373
	fmovdneg	%xcc,	%f13,	%f12
	subc	%o1,	%i5,	%l4
	tpos	%icc,	0x3
loop_1373:
	nop
	set	0x68, %g1
	ldd	[%l7 + %g1],	%f12
	xorcc	%i0,	0x16CD,	%i1
	srlx	%l2,	%i2,	%l0
	udiv	%g7,	0x1560,	%o6
	tpos	%icc,	0x3
	fbuge,a	%fcc1,	loop_1374
	movre	%g3,	%o5,	%o0
	edge16n	%o7,	%g5,	%o3
	movrlez	%l5,	0x12C,	%g4
loop_1374:
	movl	%xcc,	%i6,	%g1
	tpos	%xcc,	0x5
	bgu,a	%icc,	loop_1375
	mova	%xcc,	%i3,	%i7
	tl	%icc,	0x4
	fxnor	%f2,	%f0,	%f28
loop_1375:
	fcmple16	%f20,	%f30,	%l6
	fmovrsgez	%i4,	%f11,	%f3
	wr	%g0,	0x80,	%asi
	lda	[%l7 + 0x78] %asi,	%f10
	tcc	%icc,	0x6
	movrlz	%l1,	%o2,	%o4
	fmovdleu	%icc,	%f17,	%f14
	or	%g2,	0x0AA2,	%l3
	wr	%g0,	0x89,	%asi
	lduba	[%l7 + 0x1B] %asi,	%o1
	brlez	%g6,	loop_1376
	flush	%l7 + 0x24
	edge32n	%i5,	%l4,	%i0
	prefetch	[%l7 + 0x74],	 0x3
loop_1376:
	nop
	setx	0xE750C16A5046D120,	%l0,	%l6
	stx	%l6,	[%l7 + 0x78]
	ldx	[%l7 + 0x78],	%fsr
	fmovdge	%xcc,	%f7,	%f31
	edge16n	%l2,	%i2,	%i1
	fnot1s	%f15,	%f0
	fmovrdgez	%l0,	%f20,	%f0
	movcc	%icc,	%g7,	%g3
	fmovdvc	%icc,	%f29,	%f28
	wr	%g0,	0x80,	%asi
	ldxa	[%l7 + 0x48] %asi,	%o6
	tcc	%icc,	0x5
	fbuge	%fcc3,	loop_1377
	ble,a,pn	%xcc,	loop_1378
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
loop_1377:
	edge32ln	%o0,	%o7,	%g5
loop_1378:
	std	%f0,	[%l7 + 0x40]
	fsrc1s	%f8,	%f8
	array32	%o5,	%l5,	%g4
	fmovse	%xcc,	%f8,	%f2
	fble,a	%fcc1,	loop_1379
	sllx	%i6,	%o3,	%i3
	movg	%xcc,	%i7,	%g1
	bcs,pt	%xcc,	loop_1380
loop_1379:
	fpack32	%f0,	%f18,	%f10
	movl	%xcc,	%i4,	%l6
	fmovdvs	%icc,	%f16,	%f19
loop_1380:
	stx	%l1,	[%l7 + 0x60]
	edge8ln	%o2,	%g2,	%o4
	and	%o1,	%g6,	%i5
	tsubcc	%l3,	%l4,	%i0
	fba	%fcc3,	loop_1381
	movle	%icc,	%l2,	%i2
	movn	%xcc,	%i1,	%l0
	array8	%g3,	%o6,	%g7
loop_1381:
	orn	%o0,	0x1A83,	%g5
	tcc	%icc,	0x0
	nop
	setx loop_1382, %l0, %l1
	jmpl %l1, %o5
	movrgz	%o7,	%l5,	%i6
	ldd	[%l7 + 0x78],	%f22
	brnz,a	%o3,	loop_1383
loop_1382:
	stx	%g4,	[%l7 + 0x30]
	fcmpgt32	%f0,	%f10,	%i7
	edge32	%i3,	%i4,	%g1
loop_1383:
	sdivx	%l6,	0x063B,	%o2
	lduw	[%l7 + 0x2C],	%g2
	movrlz	%l1,	%o1,	%g6
	sdiv	%i5,	0x061B,	%o4
	movvs	%xcc,	%l4,	%l3
	movge	%xcc,	%l2,	%i0
	alignaddrl	%i2,	%l0,	%g3
	fcmpne32	%f28,	%f16,	%i1
	popc	%o6,	%o0
	subcc	%g7,	0x1AC9,	%g5
	array8	%o5,	%o7,	%i6
	fmovdvc	%xcc,	%f16,	%f3
	add	%l5,	%o3,	%g4
	nop
	setx	0x92B170E8,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f25
	setx	0xE71D7E67,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f29
	fadds	%f29,	%f25,	%f23
	fors	%f11,	%f2,	%f4
	fpmerge	%f2,	%f3,	%f22
	nop
	setx	0x469A5A9BD11F6DE2,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0x9A3718FB80552401,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	fmuld	%f6,	%f8,	%f18
	ldd	[%l7 + 0x30],	%i6
	srax	%i3,	0x02,	%i4
	bcc,a	%xcc,	loop_1384
	array8	%g1,	%l6,	%g2
	ba,a	%icc,	loop_1385
	edge32l	%l1,	%o2,	%g6
loop_1384:
	alignaddrl	%o1,	%o4,	%i5
	mova	%xcc,	%l3,	%l4
loop_1385:
	brlz	%i0,	loop_1386
	tge	%xcc,	0x6
	and	%l2,	0x1A4F,	%l0
	ba,pt	%icc,	loop_1387
loop_1386:
	sdivcc	%i2,	0x0F93,	%i1
	movvs	%xcc,	%g3,	%o0
	fnors	%f17,	%f12,	%f25
loop_1387:
	ldx	[%l7 + 0x38],	%o6
	orncc	%g5,	0x0472,	%g7
	tne	%xcc,	0x5
	movge	%xcc,	%o5,	%o7
	movge	%icc,	%l5,	%i6
	subc	%o3,	0x1A54,	%i7
	andncc	%i3,	%i4,	%g4
	edge16ln	%l6,	%g1,	%l1
	edge32	%g2,	%g6,	%o2
	fors	%f24,	%f26,	%f3
	movcc	%icc,	%o1,	%i5
	nop
	setx	0x60C94976,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f27
	setx	0x33A4C48D,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f7
	fmuls	%f7,	%f27,	%f9
	fmovsvc	%xcc,	%f24,	%f2
	edge8n	%l3,	%o4,	%l4
	be,a,pn	%xcc,	loop_1388
	membar	0x06
	edge32ln	%l2,	%l0,	%i0
	movcc	%icc,	%i1,	%g3
loop_1388:
	fmovsneg	%icc,	%f14,	%f10
	tvc	%xcc,	0x7
	xnorcc	%o0,	%o6,	%i2
	bn	loop_1389
	fbn,a	%fcc3,	loop_1390
	nop
	set	0x18, %l6
	ldx	[%l7 + %l6],	%g7
	alignaddr	%o5,	%g5,	%o7
loop_1389:
	fmovsne	%xcc,	%f29,	%f4
loop_1390:
	array16	%i6,	%o3,	%i7
	tvs	%xcc,	0x6
	sth	%i3,	[%l7 + 0x1E]
	set	0x60, %i3
	stxa	%l5,	[%l7 + %i3] 0x19
	tgu	%xcc,	0x7
	wr	%g0,	0x10,	%asi
	ldswa	[%l7 + 0x4C] %asi,	%i4
	edge32n	%l6,	%g4,	%l1
	bcs	loop_1391
	fbuge,a	%fcc2,	loop_1392
	tcc	%icc,	0x6
	ldsh	[%l7 + 0x18],	%g2
loop_1391:
	edge16l	%g6,	%o2,	%o1
loop_1392:
	edge32	%g1,	%l3,	%i5
	umulcc	%o4,	%l4,	%l0
	movg	%xcc,	%l2,	%i1
	movvs	%icc,	%g3,	%i0
	tleu	%icc,	0x5
	tne	%xcc,	0x7
	bneg,a,pt	%xcc,	loop_1393
	fandnot1	%f20,	%f6,	%f10
	bgu,a	loop_1394
	tsubcc	%o6,	0x01E8,	%o0
loop_1393:
	udivcc	%g7,	0x10EF,	%i2
	umulcc	%g5,	0x1CCE,	%o7
loop_1394:
	sub	%o5,	%o3,	%i7
	mova	%xcc,	%i6,	%i3
	lduh	[%l7 + 0x1E],	%l5
	fmovd	%f28,	%f20
	fand	%f6,	%f18,	%f14
	swap	[%l7 + 0x18],	%l6
	umulcc	%g4,	0x18D3,	%i4
	fbue	%fcc1,	loop_1395
	fmovsne	%icc,	%f11,	%f21
	xorcc	%l1,	%g2,	%g6
	movleu	%xcc,	%o1,	%o2
loop_1395:
	swap	[%l7 + 0x1C],	%l3
	nop
	fitos	%f3,	%f17
	fstox	%f17,	%f22
	fxtos	%f22,	%f16
	add	%l7,	0x70,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%g1,	%i5
	bvc,a,pn	%xcc,	loop_1396
	fpsub16	%f0,	%f20,	%f20
	fxnors	%f27,	%f14,	%f16
	tg	%icc,	0x4
loop_1396:
	fnands	%f30,	%f30,	%f5
	addccc	%l4,	0x0FBB,	%o4
	fmul8ulx16	%f28,	%f6,	%f18
	fsrc2	%f12,	%f12
	subcc	%l0,	0x186F,	%l2
	set	0x20, %g2
	ldda	[%l7 + %g2] 0x04,	%i0
	movle	%xcc,	%g3,	%o6
	nop
	fitod	%f8,	%f20
	fdtos	%f20,	%f16
	be,pn	%icc,	loop_1397
	tneg	%icc,	0x6
	fmul8x16au	%f12,	%f5,	%f4
	xor	%o0,	%i0,	%g7
loop_1397:
	call	loop_1398
	fba,a	%fcc1,	loop_1399
	tvs	%icc,	0x2
	popc	%g5,	%i2
loop_1398:
	edge32ln	%o5,	%o7,	%i7
loop_1399:
	tsubcc	%i6,	%i3,	%l5
	fpsub16s	%f6,	%f10,	%f31
	fmovs	%f6,	%f2
	tgu	%icc,	0x3
	movrgz	%o3,	%l6,	%g4
	fpadd32	%f8,	%f22,	%f18
	tg	%icc,	0x2
	movrgz	%l1,	%i4,	%g6
	mova	%xcc,	%o1,	%g2
	ldsb	[%l7 + 0x23],	%l3
	tvc	%xcc,	0x5
	popc	%g1,	%o2
	movneg	%xcc,	%l4,	%o4
	mulx	%i5,	0x022E,	%l0
	array8	%l2,	%i1,	%o6
	edge32	%g3,	%o0,	%g7
	fnot1	%f6,	%f14
	fbl,a	%fcc2,	loop_1400
	movcs	%xcc,	%g5,	%i0
	fones	%f8
	addcc	%i2,	%o5,	%o7
loop_1400:
	edge32	%i6,	%i3,	%l5
	orcc	%i7,	0x069D,	%o3
	movre	%g4,	%l1,	%i4
	bcs,pn	%xcc,	loop_1401
	fornot2	%f28,	%f30,	%f16
	movrlez	%l6,	0x25E,	%g6
	subcc	%g2,	0x1B02,	%o1
loop_1401:
	edge32	%g1,	%o2,	%l3
	xnorcc	%o4,	0x190D,	%l4
	wr	%g0,	0x88,	%asi
	lduba	[%l7 + 0x70] %asi,	%l0
	ldsh	[%l7 + 0x1A],	%i5
	brgz,a	%i1,	loop_1402
	sub	%o6,	0x1583,	%g3
	pdist	%f10,	%f24,	%f20
	fcmple32	%f18,	%f28,	%l2
loop_1402:
	nop
	fitod	%f2,	%f4
	fdtoi	%f4,	%f15
	movgu	%icc,	%o0,	%g7
	bpos,a,pn	%icc,	loop_1403
	movgu	%xcc,	%i0,	%i2
	edge32n	%o5,	%g5,	%o7
	tcs	%xcc,	0x0
loop_1403:
	movrlz	%i3,	%i6,	%l5
	fmuld8ulx16	%f3,	%f11,	%f30
	subc	%o3,	0x04A8,	%i7
	ldsw	[%l7 + 0x60],	%g4
	mova	%xcc,	%i4,	%l1
	fsrc2s	%f2,	%f12
	bpos,pn	%xcc,	loop_1404
	fexpand	%f0,	%f24
	sdivcc	%g6,	0x0347,	%l6
	alignaddr	%g2,	%g1,	%o2
loop_1404:
	sub	%o1,	0x180B,	%l3
	set	0x50, %l0
	ldda	[%l7 + %l0] 0xe2,	%l4
	alignaddrl	%l0,	%i5,	%o4
	udivcc	%o6,	0x1096,	%g3
	wr	%g0,	0x19,	%asi
	ldsha	[%l7 + 0x7C] %asi,	%l2
	st	%f18,	[%l7 + 0x3C]
	nop
	set	0x52, %o4
	lduh	[%l7 + %o4],	%o0
	subcc	%i1,	%i0,	%g7
	array32	%o5,	%i2,	%o7
	wr	%g0,	0x04,	%asi
	lda	[%l7 + 0x48] %asi,	%f5
	bg,a,pt	%xcc,	loop_1405
	sra	%i3,	%i6,	%l5
	xnor	%g5,	%o3,	%g4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1405:
	or	%i4,	0x1909,	%i7
	taddcc	%l1,	%l6,	%g6
	ldd	[%l7 + 0x10],	%g0
	fornot1	%f8,	%f20,	%f12
	set	0x4D, %g5
	ldstuba	[%l7 + %g5] 0x10,	%g2
	wr	%g0,	0x81,	%asi
	lda	[%l7 + 0x5C] %asi,	%f19
	fzero	%f24
	sdivx	%o1,	0x1FD0,	%l3
	fbul,a	%fcc3,	loop_1406
	brz	%l4,	loop_1407
	bge	%icc,	loop_1408
	addccc	%o2,	%l0,	%i5
loop_1406:
	mova	%xcc,	%o6,	%g3
loop_1407:
	fmovsgu	%icc,	%f2,	%f31
loop_1408:
	nop
	setx	0x4CA72F9A,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f21
	setx	0x322E8733,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f30
	fmuls	%f30,	%f21,	%f9
	call	loop_1409
	edge8n	%o4,	%l2,	%o0
	edge8	%i0,	%g7,	%i1
	tne	%xcc,	0x3
loop_1409:
	edge32	%i2,	%o5,	%o7
	subcc	%i6,	%l5,	%g5
	fnot1	%f30,	%f14
	fbue,a	%fcc2,	loop_1410
	udivcc	%i3,	0x1B2B,	%o3
	movle	%icc,	%g4,	%i7
	sdiv	%l1,	0x0E2E,	%l6
loop_1410:
	movg	%icc,	%g6,	%i4
	fsrc2s	%f18,	%f31
	set	0x40, %i5
	ldda	[%l7 + %i5] 0x2b,	%g0
	set	0x10, %o6
	ldda	[%l7 + %o6] 0x2b,	%g2
	fmovrdlz	%l3,	%f14,	%f30
	sir	0x05FC
	fbu	%fcc2,	loop_1411
	sdivx	%l4,	0x0D93,	%o1
	fmovde	%icc,	%f23,	%f10
	edge16ln	%l0,	%o2,	%i5
loop_1411:
	udivx	%o6,	0x18B9,	%g3
	fmovrsgez	%l2,	%f16,	%f0
	tneg	%icc,	0x7
	edge32n	%o4,	%o0,	%i0
	sth	%g7,	[%l7 + 0x2E]
	movrgz	%i2,	%i1,	%o7
	nop
	setx	0x65F21EBD,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f1
	fsqrts	%f1,	%f13
	prefetch	[%l7 + 0x2C],	 0x2
	array16	%i6,	%l5,	%g5
	set	0x26, %i2
	lduha	[%l7 + %i2] 0x11,	%i3
	taddcc	%o5,	%g4,	%i7
	ldub	[%l7 + 0x18],	%o3
	alignaddrl	%l1,	%g6,	%i4
	fmovdl	%xcc,	%f3,	%f14
	fbue	%fcc3,	loop_1412
	fble	%fcc2,	loop_1413
	edge8	%g1,	%g2,	%l3
	nop
	fitos	%f31,	%f11
loop_1412:
	fmovrsne	%l4,	%f18,	%f15
loop_1413:
	edge16l	%o1,	%l6,	%l0
	sll	%i5,	0x16,	%o2
	ldsw	[%l7 + 0x3C],	%o6
	fone	%f14
	sdivcc	%g3,	0x0C50,	%l2
	fblg,a	%fcc0,	loop_1414
	be	loop_1415
	tne	%xcc,	0x0
	edge8	%o4,	%o0,	%i0
loop_1414:
	movrgez	%i2,	0x21A,	%i1
loop_1415:
	array32	%o7,	%i6,	%l5
	edge16n	%g7,	%g5,	%o5
	fmovsn	%xcc,	%f21,	%f20
	fpadd16	%f30,	%f14,	%f14
	fxnors	%f25,	%f6,	%f20
	fbule,a	%fcc2,	loop_1416
	movne	%icc,	%i3,	%i7
	movne	%xcc,	%o3,	%g4
	movneg	%icc,	%g6,	%i4
loop_1416:
	addcc	%g1,	%g2,	%l1
	fmul8x16au	%f2,	%f28,	%f8
	movl	%icc,	%l4,	%o1
	sdivcc	%l3,	0x009D,	%l6
	movneg	%xcc,	%i5,	%o2
	set	0x70, %l1
	prefetcha	[%l7 + %l1] 0x14,	 0x1
	subc	%g3,	0x0284,	%o6
	tn	%xcc,	0x7
	array32	%o4,	%l2,	%i0
	fornot1s	%f8,	%f5,	%f14
	fcmpgt32	%f10,	%f6,	%o0
	movrlz	%i2,	%o7,	%i1
	ta	%icc,	0x0
	flush	%l7 + 0x20
	addccc	%i6,	0x0CD6,	%g7
	edge16l	%g5,	%l5,	%i3
	wr	%g0,	0x11,	%asi
	lduba	[%l7 + 0x51] %asi,	%i7
	stx	%o3,	[%l7 + 0x18]
	wr	%g0,	0x80,	%asi
	lda	[%l7 + 0x7C] %asi,	%f15
	mulscc	%o5,	0x1FC2,	%g4
	fabsd	%f4,	%f28
	udivcc	%g6,	0x152C,	%g1
	fones	%f14
	tvc	%icc,	0x3
	fbne	%fcc3,	loop_1417
	subcc	%i4,	%l1,	%l4
	add	%o1,	%g2,	%l6
	brlez	%l3,	loop_1418
loop_1417:
	nop
	set	0x6E, %l3
	ldsh	[%l7 + %l3],	%i5
	subcc	%o2,	0x0802,	%l0
	set	0x48, %o2
	lduwa	[%l7 + %o2] 0x88,	%g3
loop_1418:
	edge8l	%o4,	%l2,	%o6
	movrne	%o0,	%i0,	%i2
	nop
	setx	0x038AA4ADFC0E083D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0xDCB6F6218E8A5696,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	fsubd	%f12,	%f22,	%f28
	set	0x40, %g4
	stda	%f16,	[%l7 + %g4] 0x81
	addccc	%i1,	%o7,	%i6
	movn	%icc,	%g5,	%l5
	set	0x3E, %i1
	ldsha	[%l7 + %i1] 0x14,	%g7
	brz,a	%i7,	loop_1419
	sir	0x1548
	fblg	%fcc3,	loop_1420
	alignaddr	%o3,	%o5,	%i3
loop_1419:
	fmovd	%f2,	%f14
	subcc	%g6,	0x08C9,	%g4
loop_1420:
	srl	%i4,	%g1,	%l1
	bne	loop_1421
	te	%xcc,	0x5
	edge16ln	%l4,	%o1,	%g2
	set	0x12, %l4
	ldsha	[%l7 + %l4] 0x80,	%l6
loop_1421:
	movrlez	%i5,	0x225,	%l3
	andncc	%l0,	%g3,	%o4
	brz	%o2,	loop_1422
	movneg	%icc,	%o6,	%l2
	set	0x4E, %i0
	stha	%i0,	[%l7 + %i0] 0x80
loop_1422:
	movge	%icc,	%o0,	%i1
	tle	%xcc,	0x1
	brz,a	%o7,	loop_1423
	swap	[%l7 + 0x18],	%i2
	set	0x2A, %g7
	lduha	[%l7 + %g7] 0x80,	%g5
loop_1423:
	fnor	%f26,	%f22,	%f0
	edge32n	%l5,	%i6,	%i7
	bgu,a,pt	%icc,	loop_1424
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mulx	%o3,	%o5,	%g7
	edge32	%i3,	%g4,	%i4
loop_1424:
	fandnot2s	%f9,	%f11,	%f12
	edge8l	%g1,	%g6,	%l1
	edge16	%l4,	%o1,	%l6
	tleu	%xcc,	0x7
	fba,a	%fcc2,	loop_1425
	tn	%xcc,	0x7
	fpsub16s	%f26,	%f10,	%f28
	taddcctv	%i5,	%l3,	%g2
loop_1425:
	fmovde	%xcc,	%f29,	%f0
	be,pn	%icc,	loop_1426
	lduh	[%l7 + 0x14],	%l0
	fone	%f18
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1426:
	xorcc	%o4,	%g3,	%o2
	sll	%l2,	0x1E,	%o6
	fmul8sux16	%f14,	%f12,	%f8
	fors	%f3,	%f30,	%f8
	array32	%i0,	%i1,	%o0
	umul	%i2,	%g5,	%l5
	bg,pt	%xcc,	loop_1427
	alignaddr	%i6,	%o7,	%o3
	nop
	setx loop_1428, %l0, %l1
	jmpl %l1, %i7
	bvs,a,pt	%xcc,	loop_1429
loop_1427:
	sdiv	%g7,	0x0232,	%i3
	tcs	%xcc,	0x7
loop_1428:
	bg	%icc,	loop_1430
loop_1429:
	fpack32	%f16,	%f18,	%f28
	fornot2s	%f8,	%f28,	%f20
	srlx	%g4,	%i4,	%g1
loop_1430:
	fbuge	%fcc0,	loop_1431
	fmovsneg	%xcc,	%f1,	%f1
	sth	%o5,	[%l7 + 0x5C]
	or	%l1,	%g6,	%o1
loop_1431:
	lduh	[%l7 + 0x0C],	%l6
	fmul8sux16	%f24,	%f18,	%f20
	fbuge,a	%fcc3,	loop_1432
	tcs	%xcc,	0x5
	fmovrsgez	%i5,	%f6,	%f5
	brlez,a	%l4,	loop_1433
loop_1432:
	fcmpgt16	%f18,	%f24,	%l3
	ldsh	[%l7 + 0x74],	%l0
	fpack16	%f28,	%f12
loop_1433:
	swap	[%l7 + 0x18],	%o4
	fnot1s	%f6,	%f18
	sub	%g3,	0x15CD,	%g2
	fone	%f10
	subc	%o2,	0x1035,	%o6
	movleu	%icc,	%i0,	%i1
	set	0x20, %i7
	ldda	[%l7 + %i7] 0x26,	%o0
	bne,pt	%xcc,	loop_1434
	sdiv	%i2,	0x0AC7,	%l2
	fmovscs	%icc,	%f10,	%f11
	array32	%l5,	%g5,	%o7
loop_1434:
	srax	%i6,	%o3,	%g7
	movrlez	%i7,	%i3,	%i4
	movre	%g1,	%g4,	%o5
	fmovsge	%icc,	%f30,	%f6
	sdiv	%g6,	0x1142,	%o1
	movne	%icc,	%l1,	%l6
	nop
	setx	0x6821AB0BE070AAEB,	%l0,	%l6
	stx	%l6,	[%l7 + 0x20]
	ldx	[%l7 + 0x20],	%fsr
	set	0x18, %g3
	ldxa	[%g0 + %g3] 0x50,	%i5
	fpmerge	%f24,	%f26,	%f8
	fcmpne16	%f24,	%f14,	%l4
	te	%xcc,	0x2
	movre	%l0,	0x07E,	%l3
	fmovdleu	%icc,	%f30,	%f0
	array32	%g3,	%g2,	%o4
	bcs,pt	%icc,	loop_1435
	for	%f12,	%f22,	%f6
	movrlz	%o6,	%i0,	%o2
	tl	%xcc,	0x0
loop_1435:
	sdiv	%i1,	0x136A,	%i2
	movcs	%xcc,	%l2,	%o0
	mova	%icc,	%g5,	%l5
	edge32	%i6,	%o7,	%o3
	fmovde	%icc,	%f2,	%f14
	subcc	%i7,	0x13C0,	%g7
	tl	%icc,	0x4
	alignaddr	%i4,	%g1,	%i3
	ldub	[%l7 + 0x24],	%o5
	fmovs	%f1,	%f17
	subcc	%g6,	%o1,	%l1
	ba,a,pn	%icc,	loop_1436
	edge32l	%l6,	%i5,	%g4
	xnor	%l0,	0x0AB9,	%l3
	ldsh	[%l7 + 0x48],	%l4
loop_1436:
	smulcc	%g3,	0x1A9B,	%g2
	wr	%g0,	0x80,	%asi
	lduba	[%l7 + 0x64] %asi,	%o4
	udivx	%o6,	0x0D06,	%o2
	tg	%icc,	0x5
	movle	%icc,	%i0,	%i2
	fblg,a	%fcc2,	loop_1437
	edge32ln	%l2,	%o0,	%i1
	edge32	%g5,	%l5,	%i6
	edge16	%o3,	%i7,	%o7
loop_1437:
	tleu	%icc,	0x3
	tg	%icc,	0x5
	tge	%icc,	0x5
	fpackfix	%f30,	%f26
	fbe	%fcc0,	loop_1438
	array8	%i4,	%g1,	%i3
	fxnor	%f0,	%f30,	%f24
	sdivx	%g7,	0x0DE2,	%o5
loop_1438:
	swap	[%l7 + 0x44],	%g6
	fcmpne16	%f28,	%f22,	%l1
	nop
	fitod	%f0,	%f16
	fdtos	%f16,	%f16
	fmul8x16	%f8,	%f4,	%f16
	fbu	%fcc1,	loop_1439
	fmuld8ulx16	%f18,	%f18,	%f24
	udivcc	%o1,	0x1F73,	%i5
	ldsh	[%l7 + 0x54],	%l6
loop_1439:
	tle	%icc,	0x3
	stbar
	brgz	%g4,	loop_1440
	fbule	%fcc0,	loop_1441
	movpos	%icc,	%l0,	%l4
	movne	%xcc,	%l3,	%g2
loop_1440:
	fblg,a	%fcc2,	loop_1442
loop_1441:
	movle	%xcc,	%g3,	%o4
	call	loop_1443
	xnor	%o2,	0x0440,	%i0
loop_1442:
	nop
	fitod	%f10,	%f16
	fdtox	%f16,	%f0
	fxtod	%f0,	%f8
	fbl,a	%fcc0,	loop_1444
loop_1443:
	fmovrdlz	%o6,	%f26,	%f6
	sra	%i2,	0x04,	%l2
	xor	%o0,	0x18EB,	%i1
loop_1444:
	array32	%g5,	%l5,	%o3
	set	0x76, %o5
	stba	%i7,	[%l7 + %o5] 0xe3
	membar	#Sync
	tl	%xcc,	0x0
	set	0x52, %o7
	lduba	[%l7 + %o7] 0x88,	%o7
	tgu	%icc,	0x3
	membar	0x6D
	movrlez	%i6,	%i4,	%i3
	fcmpne32	%f8,	%f28,	%g1
	fbge,a	%fcc0,	loop_1445
	fbne,a	%fcc0,	loop_1446
	nop
	fitod	%f4,	%f26
	fdtox	%f26,	%f2
	movle	%icc,	%g7,	%g6
loop_1445:
	nop
	setx	0x2A4AFB8A,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f19
	setx	0x430B1772,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f30
	fdivs	%f30,	%f19,	%f31
loop_1446:
	smul	%o5,	0x1BEC,	%l1
	add	%i5,	%l6,	%o1
	fnand	%f2,	%f20,	%f22
	sethi	0x13E3,	%g4
	nop
	fitod	%f2,	%f20
	fandnot1	%f18,	%f22,	%f6
	brgez,a	%l0,	loop_1447
	add	%l3,	%g2,	%g3
	fbug	%fcc0,	loop_1448
	orcc	%l4,	0x0EF3,	%o2
loop_1447:
	nop
	setx	0x0EB7DC5D,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f18
	setx	0x743E758C,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f11
	fmuls	%f11,	%f18,	%f15
	movle	%xcc,	%i0,	%o6
loop_1448:
	ta	%xcc,	0x4
	movge	%xcc,	%o4,	%l2
	ta	%icc,	0x3
	stw	%o0,	[%l7 + 0x1C]
	umulcc	%i2,	%g5,	%l5
	brgz	%o3,	loop_1449
	sdivcc	%i1,	0x096B,	%i7
	mulx	%i6,	0x196A,	%i4
	nop
	setx	0x9064C4D7,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f17
	setx	0x54D4581B,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f3
	fadds	%f3,	%f17,	%f12
loop_1449:
	movrgz	%i3,	%o7,	%g7
	tn	%icc,	0x4
	bpos	loop_1450
	fors	%f22,	%f4,	%f5
	fmovsgu	%xcc,	%f7,	%f11
	movcs	%xcc,	%g1,	%g6
loop_1450:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	setx	0x94D172E9D561EA32,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	fsqrtd	%f16,	%f4
	nop
	setx loop_1451, %l0, %l1
	jmpl %l1, %o5
	tne	%icc,	0x3
	tcc	%icc,	0x5
	bne	%icc,	loop_1452
loop_1451:
	move	%xcc,	%i5,	%l6
	wr	%g0,	0x80,	%asi
	lduwa	[%l7 + 0x7C] %asi,	%l1
loop_1452:
	movpos	%icc,	%g4,	%l0
	orcc	%l3,	%g2,	%g3
	addc	%o1,	%l4,	%i0
	tvc	%icc,	0x7
	sdivx	%o6,	0x0FB6,	%o2
	fba	%fcc0,	loop_1453
	edge16l	%l2,	%o0,	%o4
	ta	%xcc,	0x5
	tpos	%icc,	0x5
loop_1453:
	membar	0x0B
	movrgez	%g5,	%l5,	%i2
	edge32ln	%i1,	%i7,	%o3
	set	0x2E, %o1
	ldstuba	[%l7 + %o1] 0x88,	%i6
	andncc	%i3,	%i4,	%g7
	set	0x14, %o3
	sta	%f31,	[%l7 + %o3] 0x04
	fmovrsgz	%g1,	%f14,	%f24
	bg,pt	%xcc,	loop_1454
	edge16	%g6,	%o5,	%i5
	fmovsg	%xcc,	%f29,	%f28
	nop
	fitod	%f7,	%f8
loop_1454:
	fblg	%fcc3,	loop_1455
	srl	%o7,	0x1D,	%l6
	andcc	%l1,	%g4,	%l3
	andcc	%l0,	%g3,	%g2
loop_1455:
	fcmpgt16	%f26,	%f0,	%l4
	ba,a	%icc,	loop_1456
	movgu	%icc,	%i0,	%o6
	move	%icc,	%o1,	%l2
	brgez,a	%o0,	loop_1457
loop_1456:
	movpos	%xcc,	%o2,	%o4
	set	0x50, %o0
	sta	%f27,	[%l7 + %o0] 0x11
loop_1457:
	udiv	%l5,	0x0AF4,	%g5
	tl	%xcc,	0x3
	wr	%g0,	0x80,	%asi
	ldsba	[%l7 + 0x1F] %asi,	%i2
	srax	%i7,	0x05,	%i1
	nop
	setx	0x39A20CB1,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f31
	setx	0x96850DA5,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f22
	fmuls	%f22,	%f31,	%f30
	membar	0x7E
	set	0x14, %l2
	ldswa	[%l7 + %l2] 0x19,	%i6
	fmuld8sux16	%f23,	%f14,	%f4
	nop
	setx	0x8C74849D,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f3
	fsqrts	%f3,	%f4
	fmovsvc	%xcc,	%f20,	%f26
	or	%i3,	0x0686,	%o3
	smul	%g7,	0x1DB1,	%g1
	edge8l	%g6,	%i4,	%i5
	bg,a	%xcc,	loop_1458
	nop
	fitod	%f6,	%f8
	fdtox	%f8,	%f6
	fxtod	%f6,	%f28
	xorcc	%o5,	%l6,	%l1
	ldub	[%l7 + 0x4D],	%g4
loop_1458:
	nop
	set	0x38, %i6
	ldxa	[%l7 + %i6] 0x18,	%l3
	ldsh	[%l7 + 0x50],	%l0
	popc	0x027E,	%o7
	fmovsneg	%xcc,	%f22,	%f28
	sdiv	%g3,	0x1B7E,	%l4
	fmovdgu	%icc,	%f23,	%f6
	stx	%g2,	[%l7 + 0x48]
	umul	%o6,	%i0,	%l2
	ldd	[%l7 + 0x70],	%f30
	xnor	%o1,	0x1978,	%o2
	edge32n	%o0,	%l5,	%g5
	edge16ln	%o4,	%i2,	%i7
	movn	%xcc,	%i6,	%i3
	sra	%i1,	0x1D,	%g7
	set	0x18, %g6
	ldsha	[%l7 + %g6] 0x19,	%g1
	stw	%o3,	[%l7 + 0x0C]
	fblg	%fcc0,	loop_1459
	movvc	%icc,	%g6,	%i4
	movpos	%icc,	%i5,	%l6
	andcc	%o5,	0x1BC5,	%l1
loop_1459:
	fpsub32s	%f22,	%f21,	%f16
	fcmpeq32	%f8,	%f12,	%g4
	fmovsg	%icc,	%f18,	%f28
	nop
	setx	0x9F68DCE04D3023B7,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0xA89C2087FA9BD9E1,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	fsubd	%f8,	%f12,	%f30
	sethi	0x11E9,	%l3
	edge32n	%o7,	%l0,	%l4
	movl	%icc,	%g3,	%o6
	edge16	%i0,	%g2,	%o1
	stbar
	nop
	setx	0x28F96AC286C864B8,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0xA93CFCC7097CF2DA,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	fmuld	%f30,	%f28,	%f0
	taddcc	%o2,	0x0602,	%l2
	flush	%l7 + 0x70
	addccc	%l5,	0x12BF,	%g5
	edge16n	%o0,	%o4,	%i2
	and	%i6,	0x174D,	%i7
	fmovsl	%xcc,	%f16,	%f10
	nop
	setx	0x32E2B2268A49CEA1,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0x8D972FE8F071903A,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	fsubd	%f12,	%f26,	%f26
	popc	0x14A2,	%i1
	fbue,a	%fcc3,	loop_1460
	tn	%xcc,	0x7
	nop
	fitos	%f9,	%f25
	fstod	%f25,	%f12
	fpadd32	%f20,	%f28,	%f16
loop_1460:
	mulx	%i3,	%g1,	%g7
	tn	%icc,	0x4
	fabsd	%f8,	%f10
	tsubcctv	%g6,	%o3,	%i4
	fsrc1s	%f14,	%f26
	fmovrdgez	%l6,	%f22,	%f0
	fands	%f3,	%f3,	%f30
	array8	%o5,	%l1,	%g4
	fpsub32s	%f26,	%f8,	%f17
	edge16n	%l3,	%o7,	%l0
	add	%l7,	0x60,	%l6
	wr	%g0,	0x0c,	%asi
	casxa	[%l6] 0x0c,	%l4,	%i5
	nop
	setx	0x655CD98DB4BC9D2A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0x6E80B63015B692CB,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	fdivd	%f22,	%f22,	%f28
	subcc	%g3,	0x0DFC,	%i0
	tle	%xcc,	0x3
	fmovspos	%xcc,	%f30,	%f0
	movrlez	%o6,	%g2,	%o2
	fbg,a	%fcc3,	loop_1461
	movvc	%icc,	%o1,	%l2
	srl	%l5,	0x15,	%g5
	fones	%f11
loop_1461:
	movrlez	%o4,	%o0,	%i2
	edge16l	%i7,	%i1,	%i3
	tvc	%xcc,	0x7
	movre	%i6,	%g7,	%g1
	srlx	%g6,	0x02,	%o3
	movrgz	%i4,	0x0C5,	%o5
	movge	%icc,	%l1,	%g4
	wr	%g0,	0x04,	%asi
	ldstuba	[%l7 + 0x51] %asi,	%l3
	addccc	%l6,	0x15D0,	%o7
	fmuld8sux16	%f14,	%f20,	%f4
	orcc	%l4,	%l0,	%i5
	srax	%g3,	0x0F,	%o6
	bvs	%icc,	loop_1462
	sdiv	%g2,	0x0D46,	%i0
	bne,a,pt	%icc,	loop_1463
	nop
	set	0x39, %i4
	ldub	[%l7 + %i4],	%o2
loop_1462:
	tleu	%xcc,	0x6
	sdivx	%o1,	0x1B33,	%l5
loop_1463:
	andcc	%g5,	0x0B5A,	%o4
	tpos	%icc,	0x1
	srax	%o0,	%i2,	%l2
	fmovdle	%xcc,	%f10,	%f21
	sdivcc	%i7,	0x1EA8,	%i3
	orn	%i1,	0x080D,	%i6
	fmovsg	%xcc,	%f16,	%f2
	movre	%g1,	%g7,	%g6
	addcc	%i4,	0x0EE8,	%o5
	set	0x30, %g1
	stha	%o3,	[%l7 + %g1] 0x80
	addccc	%g4,	%l3,	%l6
	popc	%o7,	%l1
	fornot2	%f6,	%f20,	%f16
	fcmpgt32	%f12,	%f0,	%l0
	wr	%g0,	0x89,	%asi
	ldda	[%l7 + 0x70] %asi,	%l4
	stw	%i5,	[%l7 + 0x68]
	udiv	%o6,	0x08C4,	%g3
	fnands	%f12,	%f10,	%f27
	fsrc1	%f4,	%f8
	movleu	%icc,	%g2,	%o2
	brz	%o1,	loop_1464
	fpsub32s	%f20,	%f23,	%f16
	tg	%icc,	0x5
	subc	%i0,	%l5,	%g5
loop_1464:
	fbe	%fcc2,	loop_1465
	move	%xcc,	%o4,	%o0
	movre	%l2,	0x2DC,	%i7
	edge8ln	%i2,	%i1,	%i6
loop_1465:
	nop
	set	0x34, %l5
	ldsba	[%l7 + %l5] 0x18,	%i3
	nop
	setx loop_1466, %l0, %l1
	jmpl %l1, %g7
	pdist	%f18,	%f10,	%f10
	fbge,a	%fcc2,	loop_1467
	edge16n	%g6,	%i4,	%g1
loop_1466:
	ldd	[%l7 + 0x30],	%o2
	brgez	%o5,	loop_1468
loop_1467:
	bge,pt	%xcc,	loop_1469
	orn	%l3,	0x0999,	%l6
	edge8l	%g4,	%l1,	%o7
loop_1468:
	tgu	%icc,	0x7
loop_1469:
	fble	%fcc3,	loop_1470
	stw	%l4,	[%l7 + 0x1C]
	bvs,a	%icc,	loop_1471
	tgu	%icc,	0x0
loop_1470:
	umulcc	%l0,	%i5,	%g3
	edge16ln	%o6,	%o2,	%g2
loop_1471:
	tvs	%xcc,	0x5
	fbne,a	%fcc2,	loop_1472
	fmovspos	%xcc,	%f26,	%f26
	fmovdne	%xcc,	%f6,	%f31
	xnorcc	%o1,	%i0,	%g5
loop_1472:
	nop
	fitod	%f6,	%f24
	edge8n	%l5,	%o0,	%o4
	fnegd	%f10,	%f24
	tge	%xcc,	0x3
	tpos	%xcc,	0x1
	fcmpne16	%f28,	%f6,	%i7
	sdiv	%l2,	0x14F7,	%i2
	fmovdleu	%xcc,	%f23,	%f4
	tneg	%icc,	0x5
	addccc	%i1,	%i3,	%i6
	movvc	%xcc,	%g6,	%g7
	bge	loop_1473
	bpos,pt	%xcc,	loop_1474
	fmul8sux16	%f2,	%f28,	%f22
	set	0x24, %l6
	ldswa	[%l7 + %l6] 0x80,	%i4
loop_1473:
	orn	%o3,	%o5,	%l3
loop_1474:
	addcc	%l6,	%g4,	%l1
	xorcc	%g1,	0x0E33,	%o7
	fmovsne	%xcc,	%f14,	%f3
	add	%l0,	%l4,	%g3
	tsubcctv	%i5,	%o2,	%o6
	fpmerge	%f4,	%f25,	%f18
	smul	%g2,	%o1,	%i0
	edge16l	%g5,	%o0,	%o4
	move	%xcc,	%l5,	%i7
	sir	0x1E83
	fnot2	%f6,	%f20
	movrne	%i2,	%i1,	%l2
	umul	%i3,	%g6,	%i6
	andn	%g7,	%i4,	%o5
	fbe,a	%fcc0,	loop_1475
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srl	%l3,	%l6,	%o3
	brgz	%g4,	loop_1476
loop_1475:
	and	%g1,	%l1,	%o7
	tne	%xcc,	0x3
	fmul8x16au	%f1,	%f0,	%f24
loop_1476:
	movgu	%xcc,	%l4,	%l0
	fpsub16	%f28,	%f24,	%f28
	movrlz	%g3,	%i5,	%o6
	movcc	%xcc,	%g2,	%o2
	subcc	%i0,	0x179F,	%g5
	srlx	%o1,	0x0C,	%o4
	movvc	%xcc,	%o0,	%i7
	srax	%i2,	%l5,	%l2
	subc	%i1,	0x0DB7,	%i3
	movneg	%xcc,	%g6,	%g7
	xor	%i4,	0x1946,	%o5
	fexpand	%f25,	%f22
	te	%xcc,	0x1
	and	%l3,	0x0920,	%l6
	edge16	%o3,	%g4,	%i6
	tsubcc	%g1,	0x0483,	%o7
	fcmpne16	%f8,	%f26,	%l4
	edge16	%l0,	%g3,	%i5
	sllx	%o6,	0x12,	%g2
	fmovdl	%xcc,	%f12,	%f14
	alignaddr	%l1,	%o2,	%i0
	movge	%icc,	%o1,	%o4
	move	%icc,	%o0,	%i7
	fmovrslz	%g5,	%f23,	%f8
	movgu	%icc,	%i2,	%l5
	movrgz	%l2,	0x04C,	%i1
	fmovrslez	%g6,	%f16,	%f12
	fpsub16s	%f16,	%f4,	%f16
	bl,pt	%xcc,	loop_1477
	fpadd32	%f8,	%f2,	%f14
	edge32	%i3,	%g7,	%o5
	array32	%l3,	%l6,	%o3
loop_1477:
	ldsh	[%l7 + 0x24],	%i4
	fmovscc	%icc,	%f9,	%f18
	lduw	[%l7 + 0x18],	%g4
	fmovrslz	%i6,	%f8,	%f11
	alignaddrl	%g1,	%l4,	%o7
	edge8ln	%l0,	%g3,	%o6
	smul	%i5,	%l1,	%o2
	taddcc	%g2,	0x03A1,	%o1
	fmovdpos	%xcc,	%f12,	%f28
	set	0x38, %g2
	lduwa	[%l7 + %g2] 0x10,	%i0
	array16	%o0,	%i7,	%o4
	movneg	%xcc,	%g5,	%l5
	or	%l2,	%i2,	%g6
	prefetch	[%l7 + 0x38],	 0x3
	sra	%i1,	0x01,	%g7
	movcs	%xcc,	%o5,	%l3
	nop
	fitos	%f3,	%f4
	fstoi	%f4,	%f2
	fmovs	%f24,	%f2
	fand	%f26,	%f4,	%f26
	sdivcc	%l6,	0x0D6D,	%i3
	move	%xcc,	%o3,	%i4
	umulcc	%i6,	%g1,	%g4
	addccc	%o7,	%l4,	%l0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8	%g3,	%i5,	%l1
	fmovsvc	%xcc,	%f22,	%f17
	tsubcctv	%o6,	0x096C,	%g2
	bleu,a,pn	%xcc,	loop_1478
	popc	%o1,	%i0
	fmuld8sux16	%f0,	%f9,	%f20
	add	%l7,	0x08,	%l6
	wr	%g0,	0x10,	%asi
	ldxa	[%l6] %asi,	%o0
	casxa	[%l6] %asi,	%o0,	%o2
loop_1478:
	nop
	setx	0xF04BB2AD,	%l0,	%l6
	st	%l6,	[%l7 + 0x18]
	ld	[%l7 + 0x18],	%fsr
	fmovrsgez	%i7,	%f16,	%f29
	tl	%xcc,	0x5
	nop
	setx	0xFE76F0D380663724,	%l0,	%l6
	stx	%l6,	[%l7 + 0x58]
	ldx	[%l7 + 0x58],	%fsr
	movne	%icc,	%g5,	%o4
	add	%l7,	0x58,	%l6
	wr	%g0,	0x04,	%asi
	casxa	[%l6] %asi,	%l5,	%i2
	tcc	%icc,	0x7
	movrgez	%g6,	%i1,	%g7
	tn	%icc,	0x7
	udiv	%l2,	0x1730,	%o5
	bleu,a	%xcc,	loop_1479
	movgu	%icc,	%l6,	%i3
	tvs	%xcc,	0x6
	nop
	setx	0x04BB7A874048A790,	%l0,	%l6
	stx	%l6,	[%l7 + 0x08]
	ldx	[%l7 + 0x08],	%fsr
loop_1479:
	movrlz	%l3,	0x336,	%i4
	lduh	[%l7 + 0x2C],	%i6
	sra	%g1,	%g4,	%o3
	taddcc	%l4,	0x1DF8,	%l0
	edge32	%o7,	%g3,	%i5
	sdiv	%o6,	0x1E16,	%g2
	fpadd16s	%f6,	%f15,	%f6
	fbge	%fcc3,	loop_1480
	brgez,a	%o1,	loop_1481
	fpackfix	%f30,	%f24
	edge32l	%l1,	%i0,	%o2
loop_1480:
	fmovdleu	%xcc,	%f23,	%f12
loop_1481:
	movl	%icc,	%i7,	%g5
	tcs	%icc,	0x5
	subccc	%o0,	0x06E7,	%l5
	array16	%o4,	%i2,	%i1
	fcmpgt32	%f12,	%f2,	%g6
	fmovrdgez	%g7,	%f20,	%f4
	smulcc	%l2,	%o5,	%l6
	brlz	%i3,	loop_1482
	stx	%l3,	[%l7 + 0x10]
	nop
	setx	0xFFE2498E,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f10
	setx	0xDFF40EB2,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f15
	fmuls	%f15,	%f10,	%f26
	addccc	%i4,	0x00D0,	%i6
loop_1482:
	fba,a	%fcc0,	loop_1483
	fbl,a	%fcc1,	loop_1484
	fand	%f24,	%f8,	%f2
	sdivx	%g4,	0x0F4C,	%g1
loop_1483:
	tcs	%xcc,	0x1
loop_1484:
	sll	%o3,	%l0,	%o7
	fbug,a	%fcc2,	loop_1485
	edge32	%g3,	%l4,	%i5
	bpos,a,pn	%xcc,	loop_1486
	movcs	%icc,	%g2,	%o1
loop_1485:
	edge8ln	%o6,	%i0,	%l1
	fbuge	%fcc0,	loop_1487
loop_1486:
	srlx	%o2,	%i7,	%g5
	tge	%xcc,	0x1
	movneg	%icc,	%l5,	%o4
loop_1487:
	fmul8ulx16	%f10,	%f22,	%f2
	ta	%xcc,	0x5
	tneg	%xcc,	0x7
	fpsub16s	%f20,	%f14,	%f18
	fand	%f28,	%f14,	%f30
	te	%icc,	0x3
	udivx	%i2,	0x076E,	%o0
	alignaddr	%i1,	%g6,	%g7
	fbge	%fcc1,	loop_1488
	addc	%l2,	%o5,	%i3
	nop
	fitod	%f17,	%f18
	fnors	%f16,	%f24,	%f7
loop_1488:
	andcc	%l6,	0x1E0A,	%l3
	ba,a	loop_1489
	add	%i6,	%g4,	%i4
	stx	%o3,	[%l7 + 0x18]
	bn	loop_1490
loop_1489:
	movrgez	%l0,	0x057,	%o7
	movl	%xcc,	%g3,	%l4
	add	%i5,	%g2,	%g1
loop_1490:
	srl	%o6,	0x1A,	%o1
	bpos	loop_1491
	membar	0x22
	bcs	%icc,	loop_1492
	prefetch	[%l7 + 0x40],	 0x2
loop_1491:
	tvs	%xcc,	0x7
	bneg	loop_1493
loop_1492:
	fnor	%f28,	%f6,	%f10
	stx	%i0,	[%l7 + 0x20]
	nop
	fitos	%f14,	%f23
	fstox	%f23,	%f6
	fxtos	%f6,	%f9
loop_1493:
	bgu,a,pt	%xcc,	loop_1494
	fmovscs	%icc,	%f31,	%f16
	tl	%xcc,	0x5
	edge16	%o2,	%l1,	%i7
loop_1494:
	movn	%xcc,	%l5,	%g5
	movle	%xcc,	%i2,	%o4
	movgu	%xcc,	%i1,	%o0
	tge	%xcc,	0x0
	fpmerge	%f5,	%f10,	%f24
	set	0x78, %i3
	sta	%f22,	[%l7 + %i3] 0x0c
	sll	%g6,	0x02,	%g7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array16	%l2,	%i3,	%l6
	fmovdcs	%xcc,	%f22,	%f2
	fba,a	%fcc1,	loop_1495
	movrgz	%o5,	0x0F6,	%l3
	umulcc	%i6,	0x1FD6,	%i4
	fmul8x16al	%f8,	%f0,	%f22
loop_1495:
	sll	%o3,	%g4,	%o7
	tvs	%icc,	0x4
	fones	%f27
	nop
	fitos	%f8,	%f12
	fstox	%f12,	%f8
	faligndata	%f2,	%f20,	%f22
	fmul8x16al	%f2,	%f18,	%f2
	udiv	%g3,	0x06E2,	%l4
	fmovrsgez	%i5,	%f23,	%f6
	umulcc	%l0,	%g1,	%o6
	be,a	loop_1496
	fornot1	%f22,	%f12,	%f24
	edge32ln	%g2,	%i0,	%o2
	edge8n	%l1,	%i7,	%o1
loop_1496:
	sll	%g5,	%l5,	%o4
	tsubcctv	%i2,	%i1,	%o0
	bg,pt	%icc,	loop_1497
	smulcc	%g6,	0x08A2,	%g7
	tvs	%icc,	0x7
	nop
	fitod	%f0,	%f10
	fdtox	%f10,	%f30
loop_1497:
	taddcctv	%i3,	0x19F0,	%l2
	array32	%o5,	%l3,	%i6
	fble	%fcc2,	loop_1498
	xorcc	%l6,	%o3,	%i4
	bneg,pn	%icc,	loop_1499
	alignaddrl	%o7,	%g4,	%g3
loop_1498:
	nop
	set	0x70, %o4
	stx	%i5,	[%l7 + %o4]
	ba,pt	%icc,	loop_1500
loop_1499:
	fxnor	%f24,	%f4,	%f6
	addccc	%l4,	%g1,	%o6
	fnot2	%f6,	%f16
loop_1500:
	srlx	%g2,	0x07,	%l0
	movle	%xcc,	%o2,	%l1
	ldd	[%l7 + 0x10],	%i0
	fpsub32	%f26,	%f12,	%f12
	tge	%icc,	0x4
	fcmpeq32	%f18,	%f24,	%o1
	nop
	setx	0x56B4D565405B9937,	%l0,	%l6
	stx	%l6,	[%l7 + 0x10]
	ldx	[%l7 + 0x10],	%fsr
	umul	%i7,	%g5,	%l5
	add	%o4,	%i2,	%o0
	membar	#Sync
	wr	%g0,	0xf1,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	brlz,a	%g6,	loop_1501
	edge8ln	%i1,	%i3,	%l2
	wr	%g0,	0x80,	%asi
	lda	[%l7 + 0x58] %asi,	%f19
loop_1501:
	movgu	%xcc,	%o5,	%g7
	movvc	%icc,	%l3,	%l6
	andncc	%o3,	%i6,	%i4
	sub	%o7,	%g4,	%i5
	taddcc	%g3,	%g1,	%l4
	array32	%o6,	%l0,	%o2
	set	0x40, %g5
	stda	%f0,	[%l7 + %g5] 0xf8
	membar	#Sync
	fbn,a	%fcc3,	loop_1502
	sub	%l1,	0x197C,	%i0
	fcmple16	%f2,	%f10,	%o1
	srax	%i7,	%g5,	%g2
loop_1502:
	tn	%icc,	0x6
	ba,a,pn	%xcc,	loop_1503
	addccc	%o4,	%l5,	%i2
	tpos	%icc,	0x7
	set	0x24, %l0
	sta	%f14,	[%l7 + %l0] 0x18
loop_1503:
	udiv	%g6,	0x0850,	%o0
	wr	%g0,	0x18,	%asi
	ldswa	[%l7 + 0x40] %asi,	%i3
	mulx	%i1,	%l2,	%g7
	movge	%xcc,	%o5,	%l6
	edge8n	%o3,	%i6,	%i4
	nop
	fitos	%f9,	%f5
	fstox	%f5,	%f24
	fxtos	%f24,	%f30
	call	loop_1504
	movleu	%icc,	%l3,	%g4
	fmuld8sux16	%f10,	%f25,	%f24
	movgu	%icc,	%i5,	%o7
loop_1504:
	fmovspos	%xcc,	%f19,	%f20
	tcc	%icc,	0x5
	bcc,pt	%xcc,	loop_1505
	bgu,pn	%icc,	loop_1506
	fmovd	%f16,	%f30
	edge32	%g3,	%g1,	%l4
loop_1505:
	tne	%xcc,	0x2
loop_1506:
	bvc,a,pn	%xcc,	loop_1507
	xor	%l0,	0x0CB5,	%o6
	fmovdneg	%icc,	%f29,	%f1
	fmovdpos	%icc,	%f29,	%f14
loop_1507:
	movge	%icc,	%o2,	%i0
	edge16ln	%o1,	%l1,	%g5
	subc	%i7,	%g2,	%o4
	fnot1s	%f25,	%f7
	brnz,a	%i2,	loop_1508
	add	%g6,	%l5,	%o0
	fbn	%fcc1,	loop_1509
	srlx	%i3,	%i1,	%g7
loop_1508:
	fmovrsgz	%l2,	%f30,	%f17
	xorcc	%o5,	%l6,	%i6
loop_1509:
	popc	%o3,	%i4
	alignaddrl	%g4,	%i5,	%o7
	movrgez	%l3,	0x18C,	%g3
	tpos	%icc,	0x3
	movge	%xcc,	%g1,	%l4
	addccc	%o6,	%o2,	%l0
	fbo,a	%fcc2,	loop_1510
	tl	%icc,	0x0
	movg	%xcc,	%o1,	%i0
	wr	%g0,	0x88,	%asi
	lda	[%l7 + 0x28] %asi,	%f9
loop_1510:
	bvs,a	loop_1511
	umul	%l1,	0x14C6,	%g5
	fmovd	%f28,	%f18
	tcs	%icc,	0x7
loop_1511:
	edge32l	%i7,	%o4,	%g2
	fones	%f16
	movrlez	%i2,	0x2A1,	%l5
	ldstub	[%l7 + 0x61],	%o0
	array16	%g6,	%i1,	%g7
	tg	%icc,	0x4
	flush	%l7 + 0x34
	sir	0x0F06
	fbule	%fcc2,	loop_1512
	nop
	setx	0x9771B919F0408CB8,	%l0,	%l6
	stx	%l6,	[%l7 + 0x58]
	ldx	[%l7 + 0x58],	%fsr
	popc	0x141B,	%l2
	brz,a	%i3,	loop_1513
loop_1512:
	nop
	setx loop_1514, %l0, %l1
	jmpl %l1, %l6
	movrne	%i6,	%o3,	%i4
	andcc	%g4,	0x0E5C,	%i5
loop_1513:
	fblg	%fcc3,	loop_1515
loop_1514:
	be	loop_1516
	fmul8x16au	%f9,	%f13,	%f2
	movge	%xcc,	%o5,	%l3
loop_1515:
	movleu	%xcc,	%g3,	%g1
loop_1516:
	fandnot2s	%f13,	%f19,	%f17
	mulx	%o7,	%o6,	%l4
	tl	%icc,	0x7
	movrgez	%l0,	%o1,	%o2
	movge	%icc,	%l1,	%g5
	movrne	%i0,	%i7,	%g2
	alignaddr	%i2,	%l5,	%o4
	ldsb	[%l7 + 0x52],	%g6
	movn	%xcc,	%i1,	%g7
	or	%o0,	0x0721,	%l2
	fbo,a	%fcc3,	loop_1517
	sra	%l6,	0x14,	%i6
	orncc	%i3,	%o3,	%i4
	fbo,a	%fcc3,	loop_1518
loop_1517:
	sdivx	%g4,	0x168F,	%i5
	bpos,a	%xcc,	loop_1519
	fmovdl	%xcc,	%f19,	%f19
loop_1518:
	brnz	%l3,	loop_1520
	srl	%g3,	%o5,	%o7
loop_1519:
	taddcctv	%o6,	%g1,	%l0
	sethi	0x0CFD,	%o1
loop_1520:
	fzero	%f26
	movl	%icc,	%l4,	%o2
	tsubcc	%l1,	0x0C41,	%i0
	udivcc	%i7,	0x0855,	%g2
	set	0x76, %o6
	stba	%g5,	[%l7 + %o6] 0x23
	membar	#Sync
	add	%i2,	0x1C77,	%l5
	fabsd	%f8,	%f16
	and	%o4,	0x1B66,	%g6
	fbul	%fcc1,	loop_1521
	sllx	%g7,	%i1,	%l2
	movvc	%xcc,	%o0,	%i6
	udiv	%l6,	0x024D,	%o3
loop_1521:
	taddcc	%i4,	%g4,	%i3
	edge16l	%l3,	%i5,	%o5
	tvs	%xcc,	0x0
	movneg	%xcc,	%o7,	%g3
	xor	%g1,	%o6,	%l0
	udivcc	%l4,	0x09E0,	%o1
	add	%l7,	0x18,	%l6
	wr	%g0,	0x04,	%asi
	ldxa	[%l6] %asi,	%o2
	casxa	[%l6] %asi,	%o2,	%i0
	edge16	%l1,	%g2,	%g5
	addccc	%i7,	%i2,	%l5
	tvc	%xcc,	0x4
	movrlez	%o4,	0x1B8,	%g6
	bl,pt	%xcc,	loop_1522
	movleu	%xcc,	%g7,	%i1
	wr	%g0,	0xea,	%asi
	ldda	[%l7 + 0x30] %asi,	%l2
loop_1522:
	nop
	set	0x10, %i5
	stha	%o0,	[%l7 + %i5] 0x11
	subc	%l6,	%i6,	%i4
	ldsh	[%l7 + 0x46],	%g4
	fbl,a	%fcc1,	loop_1523
	movne	%xcc,	%i3,	%o3
	fbule	%fcc2,	loop_1524
	fcmpne16	%f14,	%f24,	%i5
loop_1523:
	fmovscc	%icc,	%f14,	%f14
	tvs	%icc,	0x7
loop_1524:
	tneg	%icc,	0x3
	wr	%g0,	0x89,	%asi
	stwa	%l3,	[%l7 + 0x08] %asi
	nop
	fitos	%f3,	%f17
	fstox	%f17,	%f18
	movvc	%xcc,	%o7,	%g3
	subcc	%o5,	0x1096,	%g1
	sdiv	%l0,	0x1A66,	%o6
	ldx	[%l7 + 0x58],	%o1
	ta	%xcc,	0x0
	tge	%icc,	0x3
	set	0x38, %i2
	ldswa	[%l7 + %i2] 0x81,	%o2
	movn	%icc,	%i0,	%l1
	sth	%g2,	[%l7 + 0x3A]
	sllx	%g5,	0x1E,	%i7
	xor	%l4,	0x1DB0,	%i2
	sdivcc	%o4,	0x05A9,	%g6
	brnz,a	%g7,	loop_1525
	tpos	%icc,	0x5
	sll	%i1,	0x0A,	%l5
	movcs	%icc,	%l2,	%l6
loop_1525:
	add	%i6,	%i4,	%o0
	fmovsge	%icc,	%f7,	%f15
	fmovsneg	%xcc,	%f11,	%f21
	fmovdcs	%xcc,	%f9,	%f4
	fpmerge	%f4,	%f31,	%f10
	ldd	[%l7 + 0x38],	%f30
	xor	%i3,	0x1B03,	%o3
	edge8ln	%i5,	%g4,	%o7
	udivx	%l3,	0x1958,	%g3
	tsubcctv	%o5,	%l0,	%g1
	set	0x48, %l3
	ldswa	[%l7 + %l3] 0x89,	%o1
	edge32	%o2,	%o6,	%l1
	fcmple32	%f26,	%f26,	%i0
	fbul	%fcc1,	loop_1526
	sub	%g2,	%g5,	%i7
	subc	%l4,	0x0173,	%o4
	srax	%i2,	%g6,	%i1
loop_1526:
	add	%l5,	%l2,	%g7
	bcc	loop_1527
	bg,a,pt	%icc,	loop_1528
	srl	%i6,	0x04,	%l6
	srax	%o0,	0x1C,	%i4
loop_1527:
	fornot2s	%f6,	%f21,	%f23
loop_1528:
	movpos	%xcc,	%i3,	%o3
	fbul,a	%fcc1,	loop_1529
	fbg	%fcc2,	loop_1530
	fbe	%fcc0,	loop_1531
	te	%xcc,	0x5
loop_1529:
	nop
	set	0x20, %o2
	sta	%f23,	[%l7 + %o2] 0x81
loop_1530:
	fmovdcc	%xcc,	%f26,	%f0
loop_1531:
	fbl,a	%fcc0,	loop_1532
	fpackfix	%f8,	%f16
	edge8ln	%i5,	%g4,	%l3
	tpos	%icc,	0x5
loop_1532:
	alignaddrl	%o7,	%g3,	%o5
	srax	%g1,	%l0,	%o1
	sdivx	%o2,	0x1BC1,	%l1
	smulcc	%i0,	%g2,	%o6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bl,a,pt	%xcc,	loop_1533
	edge8l	%g5,	%i7,	%o4
	fpackfix	%f12,	%f1
	tneg	%icc,	0x4
loop_1533:
	bgu,a,pn	%xcc,	loop_1534
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tg	%icc,	0x3
	fornot1s	%f8,	%f24,	%f24
loop_1534:
	brz,a	%l4,	loop_1535
	edge32n	%g6,	%i1,	%i2
	udiv	%l2,	0x1008,	%l5
	movleu	%icc,	%g7,	%l6
loop_1535:
	fnot2s	%f29,	%f15
	fba	%fcc3,	loop_1536
	nop
	setx	0x4A0B70122A076BF4,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0x7508D3F4241A15A4,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	faddd	%f8,	%f22,	%f24
	fone	%f16
	nop
	setx	0x5A462262,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f22
	setx	0xB7388242,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f2
	fdivs	%f2,	%f22,	%f10
loop_1536:
	fpadd16s	%f31,	%f22,	%f7
	sub	%o0,	%i6,	%i4
	st	%f29,	[%l7 + 0x38]
	move	%icc,	%o3,	%i3
	add	%g4,	%i5,	%o7
	fbul,a	%fcc0,	loop_1537
	tne	%icc,	0x5
	movvs	%xcc,	%l3,	%o5
	brlez,a	%g1,	loop_1538
loop_1537:
	fmovscs	%icc,	%f7,	%f16
	bvc	%xcc,	loop_1539
	fbug,a	%fcc0,	loop_1540
loop_1538:
	fsrc2	%f6,	%f2
	fmovsge	%icc,	%f18,	%f30
loop_1539:
	membar	0x3A
loop_1540:
	nop
	set	0x40, %g4
	stda	%f16,	[%l7 + %g4] 0x11
	fxnors	%f12,	%f3,	%f11
	tneg	%xcc,	0x6
	fble	%fcc2,	loop_1541
	fbuge,a	%fcc1,	loop_1542
	ld	[%l7 + 0x30],	%f6
	bn,pn	%xcc,	loop_1543
loop_1541:
	fnot2	%f18,	%f16
loop_1542:
	stbar
	fmovscs	%icc,	%f28,	%f29
loop_1543:
	sra	%l0,	0x18,	%g3
	movneg	%xcc,	%o1,	%l1
	orcc	%i0,	%o2,	%o6
	bpos,a	%xcc,	loop_1544
	edge8l	%g5,	%i7,	%o4
	nop
	setx	0x6AD5BE11,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f30
	setx	0x3E2441E8,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f16
	fmuls	%f16,	%f30,	%f1
	smul	%g2,	%g6,	%l4
loop_1544:
	fcmple32	%f8,	%f8,	%i1
	sra	%i2,	%l5,	%l2
	movvs	%icc,	%g7,	%l6
	orn	%i6,	%o0,	%i4
	wr	%g0,	0x2a,	%asi
	stba	%o3,	[%l7 + 0x4D] %asi
	membar	#Sync
	fmuld8ulx16	%f4,	%f24,	%f16
	fmovdl	%xcc,	%f24,	%f19
	xor	%i3,	%i5,	%g4
	tgu	%icc,	0x3
	fmovsgu	%icc,	%f0,	%f3
	edge8	%o7,	%l3,	%o5
	andcc	%l0,	0x01F9,	%g3
	tcs	%xcc,	0x4
	tsubcctv	%g1,	%o1,	%l1
	sdiv	%i0,	0x172B,	%o2
	add	%o6,	0x02B7,	%i7
	nop
	set	0x20, %l1
	std	%f26,	[%l7 + %l1]
	umulcc	%g5,	%g2,	%g6
	srlx	%o4,	0x0E,	%l4
	fmovsl	%icc,	%f21,	%f9
	umulcc	%i1,	%l5,	%i2
	tcc	%xcc,	0x5
	tgu	%xcc,	0x1
	brz,a	%l2,	loop_1545
	edge16	%l6,	%i6,	%o0
	ldsb	[%l7 + 0x2C],	%g7
	wr	%g0,	0x10,	%asi
	lduba	[%l7 + 0x7A] %asi,	%i4
loop_1545:
	fmovsg	%icc,	%f12,	%f16
	fbule,a	%fcc0,	loop_1546
	ta	%xcc,	0x2
	fnands	%f26,	%f6,	%f14
	bpos	loop_1547
loop_1546:
	tvc	%xcc,	0x4
	smul	%o3,	%i3,	%g4
	fmovdn	%icc,	%f19,	%f8
loop_1547:
	mulx	%o7,	%l3,	%i5
	wr	%g0,	0x18,	%asi
	lduha	[%l7 + 0x4A] %asi,	%o5
	movvs	%icc,	%l0,	%g1
	fbl	%fcc1,	loop_1548
	tsubcc	%g3,	0x0D41,	%l1
	subcc	%i0,	0x1EA3,	%o1
	set	0x68, %l4
	swapa	[%l7 + %l4] 0x18,	%o6
loop_1548:
	stx	%i7,	[%l7 + 0x28]
	tneg	%xcc,	0x2
	addcc	%g5,	0x1E33,	%g2
	movle	%icc,	%o2,	%o4
	bcs,a	%icc,	loop_1549
	tn	%xcc,	0x0
	fble,a	%fcc0,	loop_1550
	nop
	setx	0xB1BBFBB9,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f0
	setx	0x738BE1E0,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f9
	fmuls	%f9,	%f0,	%f13
loop_1549:
	tneg	%icc,	0x1
	mulx	%g6,	%l4,	%i1
loop_1550:
	movleu	%xcc,	%l5,	%i2
	xorcc	%l6,	%i6,	%o0
	or	%g7,	%l2,	%o3
	udiv	%i3,	0x0103,	%i4
	ldd	[%l7 + 0x48],	%f26
	ldsb	[%l7 + 0x1F],	%o7
	udiv	%g4,	0x1094,	%i5
	fzero	%f28
	edge8	%o5,	%l0,	%l3
	tvc	%icc,	0x1
	fmovsleu	%xcc,	%f28,	%f10
	smulcc	%g1,	%g3,	%i0
	sir	0x00E2
	movge	%xcc,	%o1,	%l1
	prefetch	[%l7 + 0x60],	 0x3
	ld	[%l7 + 0x54],	%f25
	fmovrdne	%o6,	%f22,	%f4
	xnor	%i7,	%g5,	%g2
	sdiv	%o4,	0x1126,	%g6
	movvc	%icc,	%l4,	%i1
	edge16ln	%l5,	%o2,	%i2
	movvs	%icc,	%l6,	%o0
	smulcc	%i6,	0x0DE5,	%l2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x80,	%asi
	swapa	[%l7 + 0x38] %asi,	%g7
	bcs,a	loop_1551
	bg,pn	%icc,	loop_1552
	fcmpeq16	%f16,	%f0,	%o3
	fzeros	%f7
loop_1551:
	bcc,a,pn	%icc,	loop_1553
loop_1552:
	fcmpne16	%f14,	%f12,	%i3
	fxor	%f22,	%f16,	%f20
	movle	%icc,	%o7,	%g4
loop_1553:
	fpadd16	%f2,	%f20,	%f4
	udivcc	%i5,	0x1817,	%o5
	bcs	%icc,	loop_1554
	edge8	%i4,	%l0,	%l3
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
loop_1554:
	nop
	add	%l7,	0x44,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%g1
	casa	[%l6] %asi,	%g1,	%g3
	movle	%icc,	%i0,	%l1
	sdiv	%o1,	0x1169,	%i7
	fbg,a	%fcc0,	loop_1555
	movneg	%xcc,	%o6,	%g5
	fors	%f10,	%f23,	%f15
	stbar
loop_1555:
	orcc	%g2,	0x0A04,	%o4
	fbl,a	%fcc1,	loop_1556
	tpos	%icc,	0x6
	wr	%g0,	0x10,	%asi
	lduba	[%l7 + 0x61] %asi,	%l4
loop_1556:
	fmovsn	%xcc,	%f6,	%f2
	array32	%i1,	%l5,	%o2
	sllx	%g6,	%l6,	%i2
	fbne,a	%fcc0,	loop_1557
	xnorcc	%i6,	0x0B29,	%o0
	fbu,a	%fcc3,	loop_1558
	ble,a,pt	%icc,	loop_1559
loop_1557:
	fbne	%fcc0,	loop_1560
	nop
	setx	0xAEBCC6E776FAF06A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0x000DAECAC8EB5C18,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	fmuld	%f18,	%f0,	%f22
loop_1558:
	nop
	wr	%g0,	0x81,	%asi
	stha	%l2,	[%l7 + 0x64] %asi
loop_1559:
	fmul8ulx16	%f2,	%f18,	%f4
loop_1560:
	edge16l	%g7,	%i3,	%o7
	movrlez	%o3,	0x150,	%i5
	movneg	%xcc,	%g4,	%i4
	xorcc	%l0,	%o5,	%g1
	fbuge,a	%fcc1,	loop_1561
	movrlez	%g3,	%l3,	%i0
	sdivcc	%o1,	0x145A,	%i7
	fmul8x16au	%f25,	%f31,	%f22
loop_1561:
	nop
	setx	loop_1562,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	be,pn	%icc,	loop_1563
	srlx	%o6,	%l1,	%g5
	set	0x4C, %i0
	sta	%f14,	[%l7 + %i0] 0x19
loop_1562:
	movle	%xcc,	%o4,	%g2
loop_1563:
	tge	%xcc,	0x1
	movcs	%icc,	%i1,	%l5
	fbuge,a	%fcc3,	loop_1564
	edge32l	%o2,	%g6,	%l4
	movvs	%icc,	%i2,	%i6
	movrlz	%l6,	0x389,	%o0
loop_1564:
	subc	%l2,	0x1A5B,	%g7
	set	0x10, %i1
	ldda	[%l7 + %i1] 0x15,	%i2
	udivcc	%o3,	0x0771,	%i5
	srl	%o7,	%i4,	%g4
	tsubcc	%o5,	%g1,	%g3
	andncc	%l3,	%l0,	%o1
	ta	%xcc,	0x0
	nop
	fitos	%f13,	%f27
	fstoi	%f27,	%f8
	te	%xcc,	0x5
	bgu,a	%icc,	loop_1565
	tneg	%icc,	0x2
	fmovrsgez	%i0,	%f10,	%f5
	te	%icc,	0x2
loop_1565:
	tle	%xcc,	0x4
	popc	0x0AFE,	%i7
	fmovrsgz	%l1,	%f2,	%f0
	stx	%o6,	[%l7 + 0x10]
	mova	%xcc,	%o4,	%g5
	fandnot2	%f12,	%f16,	%f4
	movre	%g2,	%l5,	%i1
	fzeros	%f17
	nop
	setx	0x278F5E4230463593,	%l0,	%l6
	stx	%l6,	[%l7 + 0x50]
	ldx	[%l7 + 0x50],	%fsr
	tge	%icc,	0x2
	xnor	%o2,	%l4,	%i2
	nop
	setx	0xE9792E214850D361,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0xF1C72D3BA91556F7,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	fsubd	%f2,	%f4,	%f22
	movvc	%xcc,	%g6,	%l6
	udiv	%i6,	0x1B62,	%l2
	fnot2	%f10,	%f20
	tcs	%xcc,	0x1
	sir	0x11AD
	move	%xcc,	%o0,	%g7
	for	%f20,	%f4,	%f24
	bgu,a	loop_1566
	fnegd	%f4,	%f6
	flush	%l7 + 0x78
	tl	%xcc,	0x1
loop_1566:
	ble	%xcc,	loop_1567
	array16	%o3,	%i3,	%i5
	tg	%icc,	0x7
	fpadd32	%f0,	%f0,	%f0
loop_1567:
	movvs	%icc,	%o7,	%g4
	edge32	%i4,	%o5,	%g1
	movrgez	%l3,	0x070,	%g3
	sethi	0x1697,	%l0
	addcc	%o1,	%i7,	%i0
	and	%l1,	0x13CB,	%o6
	movleu	%icc,	%o4,	%g5
	movgu	%icc,	%l5,	%i1
	edge16ln	%g2,	%l4,	%i2
	set	0x70, %g7
	ldda	[%l7 + %g7] 0xeb,	%o2
	alignaddrl	%g6,	%i6,	%l6
	lduh	[%l7 + 0x78],	%l2
	xorcc	%o0,	%o3,	%g7
	nop
	setx	0x21873DDC,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f14
	setx	0x72F15EDD,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f2
	fdivs	%f2,	%f14,	%f9
	stbar
	fbu,a	%fcc1,	loop_1568
	brgez,a	%i3,	loop_1569
	andncc	%i5,	%g4,	%i4
	prefetch	[%l7 + 0x2C],	 0x0
loop_1568:
	edge32	%o7,	%g1,	%l3
loop_1569:
	movrlz	%o5,	%l0,	%g3
	popc	0x13A8,	%o1
	fmovrdlez	%i0,	%f4,	%f14
	swap	[%l7 + 0x74],	%l1
	fcmpne32	%f26,	%f8,	%o6
	add	%i7,	%g5,	%o4
	for	%f18,	%f16,	%f14
	brlez,a	%i1,	loop_1570
	movcs	%icc,	%l5,	%l4
	movrne	%i2,	%g2,	%g6
	srl	%o2,	%i6,	%l2
loop_1570:
	tle	%xcc,	0x7
	umul	%l6,	%o0,	%g7
	set	0x70, %g3
	ldda	[%l7 + %g3] 0x2c,	%o2
	ta	%icc,	0x5
	sllx	%i5,	0x11,	%i3
	srax	%g4,	0x0F,	%o7
	tneg	%icc,	0x4
	movrgez	%g1,	0x09C,	%l3
	brgez	%i4,	loop_1571
	tl	%xcc,	0x7
	fabsd	%f16,	%f14
	edge16n	%o5,	%g3,	%l0
loop_1571:
	edge32ln	%i0,	%o1,	%o6
	addccc	%l1,	0x1B97,	%i7
	movleu	%icc,	%g5,	%i1
	tle	%icc,	0x4
	fbuge,a	%fcc3,	loop_1572
	nop
	fitod	%f4,	%f16
	fdtox	%f16,	%f22
	fxtod	%f22,	%f18
	ldsb	[%l7 + 0x31],	%o4
	andncc	%l4,	%l5,	%i2
loop_1572:
	movrlez	%g6,	%g2,	%o2
	sdivx	%l2,	0x0BFB,	%l6
	edge32	%i6,	%o0,	%g7
	sdivx	%o3,	0x08CE,	%i5
	fpsub16s	%f25,	%f7,	%f1
	movrne	%g4,	0x1BB,	%o7
	flush	%l7 + 0x1C
	brgz	%i3,	loop_1573
	movge	%icc,	%g1,	%i4
	fxors	%f11,	%f9,	%f7
	fblg	%fcc2,	loop_1574
loop_1573:
	fbn,a	%fcc1,	loop_1575
	mulscc	%o5,	%g3,	%l0
	movvc	%icc,	%l3,	%o1
loop_1574:
	umulcc	%o6,	0x0DCC,	%l1
loop_1575:
	movvs	%icc,	%i0,	%g5
	wr	%g0,	0x18,	%asi
	lduba	[%l7 + 0x17] %asi,	%i1
	mova	%xcc,	%o4,	%l4
	andncc	%l5,	%i7,	%i2
	set	0x40, %o5
	stda	%f16,	[%l7 + %o5] 0x88
	fbule,a	%fcc2,	loop_1576
	fbl,a	%fcc1,	loop_1577
	move	%icc,	%g2,	%o2
	orncc	%g6,	%l6,	%l2
loop_1576:
	nop
	set	0x0A, %i7
	stba	%o0,	[%l7 + %i7] 0xeb
	membar	#Sync
loop_1577:
	nop
	set	0x2E, %o7
	lduba	[%l7 + %o7] 0x89,	%i6
	andcc	%o3,	0x1558,	%i5
	std	%f4,	[%l7 + 0x18]
	fbul	%fcc2,	loop_1578
	tleu	%icc,	0x2
	wr	%g0,	0xe3,	%asi
	stwa	%g4,	[%l7 + 0x18] %asi
	membar	#Sync
loop_1578:
	fmovda	%xcc,	%f14,	%f26
	mulx	%o7,	0x15E6,	%g7
	flush	%l7 + 0x44
	fcmpeq32	%f6,	%f22,	%g1
	nop
	setx	0x1046C9D0,	%l0,	%l6
	st	%l6,	[%l7 + 0x34]
	ld	[%l7 + 0x34],	%fsr
	wr	%g0,	0x89,	%asi
	prefetcha	[%l7 + 0x08] %asi,	 0x0
	smul	%i3,	%o5,	%l0
	udivcc	%l3,	0x0EAE,	%o1
	fornot1	%f28,	%f2,	%f24
	movge	%xcc,	%g3,	%o6
	addcc	%l1,	%i0,	%g5
	nop
	setx	0xBC1ED8EA,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f0
	setx	0xA4C6963B,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f2
	fdivs	%f2,	%f0,	%f21
	movl	%icc,	%i1,	%o4
	fmovrse	%l5,	%f15,	%f16
	ldub	[%l7 + 0x33],	%l4
	brgz	%i2,	loop_1579
	fpadd16	%f8,	%f24,	%f24
	fbne	%fcc3,	loop_1580
	edge32	%g2,	%o2,	%g6
loop_1579:
	fbn	%fcc1,	loop_1581
	tneg	%icc,	0x5
loop_1580:
	edge16ln	%l6,	%l2,	%i7
	edge8n	%i6,	%o3,	%o0
loop_1581:
	fpsub16	%f20,	%f20,	%f22
	nop
	setx loop_1582, %l0, %l1
	jmpl %l1, %g4
	nop
	setx	0xE0557ED3,	%l0,	%l6
	st	%l6,	[%l7 + 0x64]
	ld	[%l7 + 0x64],	%fsr
	ldd	[%l7 + 0x20],	%o6
	tsubcctv	%i5,	0x0093,	%g7
loop_1582:
	edge8	%i4,	%g1,	%i3
	fmovrdgz	%o5,	%f12,	%f26
	fpmerge	%f27,	%f23,	%f20
	movge	%icc,	%l3,	%l0
	subcc	%g3,	0x03EF,	%o1
	brz,a	%l1,	loop_1583
	nop
	setx	loop_1584,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	tne	%icc,	0x5
	add	%o6,	0x14CE,	%i0
loop_1583:
	movcc	%icc,	%i1,	%g5
loop_1584:
	fbul	%fcc2,	loop_1585
	movvs	%icc,	%l5,	%o4
	movneg	%xcc,	%i2,	%g2
	srlx	%l4,	%o2,	%l6
loop_1585:
	brgz	%l2,	loop_1586
	edge16ln	%g6,	%i6,	%o3
	bne	loop_1587
	edge8l	%o0,	%g4,	%o7
loop_1586:
	nop
	wr	%g0,	0x88,	%asi
	swapa	[%l7 + 0x4C] %asi,	%i7
loop_1587:
	movcc	%icc,	%g7,	%i4
	fmuld8sux16	%f3,	%f18,	%f26
	fmovsl	%icc,	%f18,	%f19
	fcmpne16	%f20,	%f0,	%i5
	movvs	%xcc,	%i3,	%g1
	fnot2	%f18,	%f8
	fbl,a	%fcc2,	loop_1588
	fbl,a	%fcc0,	loop_1589
	fmul8x16al	%f0,	%f10,	%f2
	and	%o5,	0x169F,	%l0
loop_1588:
	faligndata	%f6,	%f10,	%f24
loop_1589:
	fone	%f24
	fnegs	%f28,	%f0
	movn	%icc,	%l3,	%o1
	subccc	%l1,	0x0C85,	%o6
	fbe,a	%fcc0,	loop_1590
	taddcctv	%i0,	0x12A6,	%i1
	brz,a	%g3,	loop_1591
	movcs	%icc,	%l5,	%g5
loop_1590:
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
	edge8	%i2,	%g2,	%o4
loop_1591:
	fbu	%fcc0,	loop_1593
	movrlez	%l4,	%l6,	%o2
loop_1592:
	and	%g6,	%l2,	%o3
	addc	%i6,	0x0B13,	%o0
loop_1593:
	orn	%g4,	0x1B98,	%i7
	tsubcctv	%o7,	0x0EFB,	%g7
	tsubcctv	%i5,	%i3,	%g1
	udiv	%o5,	0x1DE4,	%i4
	nop
	setx	0xBB6FC337,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f4
	setx	0x6726560C,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f12
	fdivs	%f12,	%f4,	%f21
	udivcc	%l3,	0x1230,	%o1
	fbn,a	%fcc2,	loop_1594
	ldd	[%l7 + 0x28],	%l0
	umulcc	%o6,	0x19A3,	%l0
	fcmpne16	%f18,	%f24,	%i0
loop_1594:
	popc	0x0FAC,	%g3
	srax	%l5,	0x1C,	%i1
	fpack32	%f10,	%f4,	%f18
	tg	%xcc,	0x7
	tsubcc	%g5,	0x18A5,	%g2
	stx	%o4,	[%l7 + 0x50]
	edge16	%i2,	%l4,	%o2
	movvs	%xcc,	%g6,	%l2
	sra	%o3,	%l6,	%o0
	taddcctv	%i6,	%i7,	%g4
	ldub	[%l7 + 0x14],	%o7
	sdivx	%g7,	0x02C4,	%i5
	move	%icc,	%g1,	%i3
	edge16ln	%o5,	%l3,	%o1
	fnegd	%f18,	%f16
	fsrc2s	%f2,	%f16
	fxor	%f18,	%f22,	%f0
	subcc	%i4,	0x1A5A,	%o6
	andcc	%l0,	%i0,	%l1
	lduw	[%l7 + 0x38],	%g3
	nop
	fitod	%f12,	%f14
	fdtox	%f14,	%f6
	fxtod	%f6,	%f0
	ldub	[%l7 + 0x25],	%i1
	fmovda	%xcc,	%f18,	%f14
	movl	%xcc,	%l5,	%g2
	edge16l	%g5,	%i2,	%l4
	fnor	%f20,	%f12,	%f4
	fmovsn	%xcc,	%f17,	%f3
	orn	%o4,	0x1F4B,	%g6
	fmovrsgz	%o2,	%f27,	%f7
	udiv	%o3,	0x15EB,	%l6
	array8	%l2,	%o0,	%i7
	fcmpgt32	%f26,	%f20,	%g4
	brgz	%o7,	loop_1595
	addcc	%g7,	0x1BEA,	%i5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tgu	%xcc,	0x1
loop_1595:
	sethi	0x0782,	%i6
	fxnor	%f6,	%f18,	%f14
	fmovrdgz	%g1,	%f18,	%f30
	movge	%xcc,	%o5,	%i3
	movrgez	%o1,	0x282,	%i4
	subcc	%l3,	%l0,	%o6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnot2s	%f6,	%f28
	edge32	%l1,	%i0,	%g3
	movre	%i1,	0x225,	%g2
	movre	%l5,	%i2,	%g5
	smulcc	%o4,	0x0E30,	%l4
	fmovdg	%xcc,	%f9,	%f18
	ldsh	[%l7 + 0x32],	%g6
	addc	%o3,	0x0F38,	%l6
	bpos,a	loop_1596
	bge	loop_1597
	fpackfix	%f22,	%f21
	nop
	setx	0xC0496781,	%l0,	%l6
	st	%l6,	[%l7 + 0x78]
	ld	[%l7 + 0x78],	%fsr
loop_1596:
	bleu,a	loop_1598
loop_1597:
	sir	0x14FF
	bg	%xcc,	loop_1599
	add	%l2,	%o2,	%i7
loop_1598:
	edge8n	%o0,	%o7,	%g7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1599:
	bne,a,pt	%icc,	loop_1600
	fbue	%fcc3,	loop_1601
	stb	%g4,	[%l7 + 0x54]
	set	0x40, %o3
	stda	%f16,	[%l7 + %o3] 0x11
loop_1600:
	mova	%xcc,	%i6,	%g1
loop_1601:
	sra	%o5,	%i3,	%o1
	fnot1	%f18,	%f4
	bleu,a	loop_1602
	movle	%xcc,	%i5,	%l3
	set	0x40, %o1
	stda	%f16,	[%l7 + %o1] 0xf1
	membar	#Sync
loop_1602:
	movne	%xcc,	%i4,	%l0
	wr	%g0,	0xeb,	%asi
	stba	%l1,	[%l7 + 0x23] %asi
	membar	#Sync
	srlx	%i0,	%o6,	%g3
	edge8n	%g2,	%i1,	%i2
	fbe,a	%fcc1,	loop_1603
	mulx	%l5,	%o4,	%g5
	brlez,a	%l4,	loop_1604
	fpadd16	%f16,	%f4,	%f16
loop_1603:
	srax	%o3,	0x03,	%g6
	fbug,a	%fcc1,	loop_1605
loop_1604:
	tcs	%icc,	0x7
	set	0x10, %o0
	ldswa	[%l7 + %o0] 0x0c,	%l6
loop_1605:
	tsubcc	%l2,	0x0E40,	%i7
	stw	%o2,	[%l7 + 0x60]
	fmovdvs	%icc,	%f8,	%f25
	array8	%o7,	%o0,	%g4
	movge	%icc,	%g7,	%i6
	call	loop_1606
	edge8	%o5,	%i3,	%g1
	andn	%i5,	%l3,	%o1
	orcc	%l0,	0x0C96,	%i4
loop_1606:
	edge8	%l1,	%i0,	%o6
	ldd	[%l7 + 0x10],	%g2
	stw	%i1,	[%l7 + 0x50]
	fba,a	%fcc2,	loop_1607
	ldsh	[%l7 + 0x56],	%g3
	addcc	%l5,	0x1FAA,	%i2
	wr	%g0,	0x2a,	%asi
	stba	%o4,	[%l7 + 0x6F] %asi
	membar	#Sync
loop_1607:
	fcmpgt32	%f2,	%f18,	%l4
	tsubcctv	%o3,	%g5,	%l6
	wr	%g0,	0x81,	%asi
	lduwa	[%l7 + 0x10] %asi,	%g6
	membar	0x12
	sethi	0x067C,	%l2
	subccc	%o2,	0x0711,	%o7
	tvc	%xcc,	0x7
	fbuge	%fcc0,	loop_1608
	xor	%o0,	0x0F9A,	%g4
	mova	%xcc,	%g7,	%i6
	membar	0x6A
loop_1608:
	sdivcc	%i7,	0x1125,	%i3
	fzeros	%f2
	for	%f20,	%f26,	%f26
	nop
	setx	0x8EF25236,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f6
	setx	0x2A099B45,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f25
	fadds	%f25,	%f6,	%f5
	tleu	%xcc,	0x0
	smulcc	%g1,	%i5,	%o5
	edge8n	%o1,	%l0,	%l3
	fmovdle	%icc,	%f10,	%f30
	addc	%i4,	%l1,	%i0
	sra	%g2,	%o6,	%g3
	fpack32	%f12,	%f16,	%f0
	array16	%l5,	%i2,	%i1
	addcc	%l4,	0x0253,	%o4
	call	loop_1609
	fcmpne32	%f0,	%f28,	%g5
	subcc	%l6,	0x0D4C,	%g6
	smul	%l2,	%o3,	%o2
loop_1609:
	or	%o0,	%g4,	%g7
	fxnor	%f16,	%f8,	%f6
	edge16n	%i6,	%o7,	%i7
	fbug	%fcc3,	loop_1610
	bleu,a	%xcc,	loop_1611
	addc	%i3,	%i5,	%o5
	fxnors	%f3,	%f24,	%f7
loop_1610:
	fbue,a	%fcc2,	loop_1612
loop_1611:
	fbo	%fcc0,	loop_1613
	edge32l	%o1,	%l0,	%g1
	movleu	%xcc,	%l3,	%i4
loop_1612:
	tn	%icc,	0x7
loop_1613:
	tvc	%icc,	0x1
	wr	%g0,	0x0c,	%asi
	lduha	[%l7 + 0x2E] %asi,	%l1
	movrgz	%g2,	%o6,	%i0
	tsubcctv	%g3,	0x1BAD,	%l5
	sllx	%i2,	%l4,	%i1
	fcmpne32	%f18,	%f4,	%o4
	sllx	%g5,	0x01,	%g6
	array16	%l6,	%l2,	%o2
	taddcctv	%o0,	0x1A6B,	%g4
	fandnot2	%f30,	%f26,	%f30
	bge	loop_1614
	tneg	%xcc,	0x5
	subcc	%g7,	%o3,	%i6
	fandnot2s	%f17,	%f27,	%f5
loop_1614:
	movrne	%i7,	0x1BE,	%o7
	bge,a,pn	%icc,	loop_1615
	edge16	%i5,	%i3,	%o1
	wr	%g0,	0x80,	%asi
	ldda	[%l7 + 0x60] %asi,	%o4
loop_1615:
	movg	%icc,	%l0,	%l3
	fandnot2s	%f7,	%f10,	%f16
	sir	0x0152
	mulx	%g1,	0x0E64,	%l1
	fsrc1s	%f24,	%f22
	popc	%i4,	%o6
	fxor	%f10,	%f26,	%f28
	movvc	%icc,	%g2,	%g3
	srlx	%i0,	%i2,	%l4
	bn,a	loop_1616
	movre	%i1,	0x200,	%l5
	mulx	%g5,	%g6,	%o4
	tsubcc	%l6,	%l2,	%o0
loop_1616:
	orn	%g4,	%g7,	%o2
	edge16ln	%o3,	%i7,	%o7
	subc	%i6,	0x0251,	%i3
	lduw	[%l7 + 0x30],	%i5
	xnor	%o1,	%l0,	%l3
	wr	%g0,	0x1f,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
	xorcc	%g1,	0x07FF,	%l1
	tneg	%xcc,	0x1
	fcmpne16	%f6,	%f24,	%o5
	mova	%icc,	%i4,	%g2
	udivx	%g3,	0x13FC,	%o6
	movleu	%icc,	%i2,	%i0
	tpos	%xcc,	0x2
	fmovdcc	%icc,	%f14,	%f3
	xnor	%l4,	0x0475,	%l5
	movleu	%icc,	%g5,	%g6
	fble,a	%fcc0,	loop_1617
	movrgz	%o4,	0x34F,	%i1
	movgu	%icc,	%l2,	%o0
	tle	%icc,	0x6
loop_1617:
	movle	%icc,	%l6,	%g4
	fabsd	%f20,	%f4
	sub	%o2,	%g7,	%o3
	movgu	%icc,	%i7,	%o7
	tneg	%icc,	0x3
	ta	%xcc,	0x0
	edge16n	%i6,	%i5,	%i3
	fcmple16	%f10,	%f26,	%l0
	tn	%xcc,	0x7
	fxors	%f21,	%f4,	%f2
	bge	%icc,	loop_1618
	swap	[%l7 + 0x0C],	%l3
	taddcctv	%o1,	%g1,	%o5
	movle	%xcc,	%l1,	%g2
loop_1618:
	movrlz	%i4,	%g3,	%i2
	edge8ln	%o6,	%l4,	%i0
	sethi	0x1D50,	%l5
	umulcc	%g6,	0x162E,	%o4
	tsubcc	%i1,	0x0D2F,	%l2
	fbue	%fcc3,	loop_1619
	nop
	setx	loop_1620,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fbn	%fcc2,	loop_1621
	sdivx	%o0,	0x0FEF,	%g5
loop_1619:
	fblg,a	%fcc3,	loop_1622
loop_1620:
	fbuge,a	%fcc1,	loop_1623
loop_1621:
	nop
	setx	0xCE5D9845BC5A482B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0x4423A32234A51CE5,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	faddd	%f20,	%f2,	%f26
	tcs	%icc,	0x1
loop_1622:
	nop
	setx	0x6D8486E8C09AEB76,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0xB0E596D3F2E8436D,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	fmuld	%f30,	%f30,	%f8
loop_1623:
	bne,pn	%icc,	loop_1624
	array16	%g4,	%l6,	%o2
	fmovse	%xcc,	%f1,	%f16
	brlez,a	%g7,	loop_1625
loop_1624:
	bneg,pn	%xcc,	loop_1626
	fcmpne16	%f6,	%f8,	%o3
	bn,pt	%xcc,	loop_1627
loop_1625:
	tvc	%xcc,	0x3
loop_1626:
	movpos	%icc,	%o7,	%i6
	sllx	%i5,	0x12,	%i3
loop_1627:
	edge16	%l0,	%i7,	%o1
	movrlz	%g1,	%l3,	%o5
	movrgz	%l1,	0x321,	%i4
	addcc	%g2,	0x0E7E,	%i2
	taddcc	%o6,	0x02EA,	%g3
	movcc	%icc,	%i0,	%l4
	move	%icc,	%g6,	%o4
	wr	%g0,	0x89,	%asi
	sta	%f2,	[%l7 + 0x78] %asi
	lduw	[%l7 + 0x70],	%i1
	movvc	%icc,	%l5,	%l2
	fmovse	%xcc,	%f16,	%f15
	movrgez	%g5,	%o0,	%l6
	smul	%o2,	%g4,	%g7
	srax	%o7,	%o3,	%i6
	bvc,pn	%icc,	loop_1628
	fbl	%fcc1,	loop_1629
	st	%f14,	[%l7 + 0x3C]
	tsubcctv	%i3,	%l0,	%i5
loop_1628:
	bcs,a,pn	%xcc,	loop_1630
loop_1629:
	nop
	setx	0x42832F0F,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f27
	fsqrts	%f27,	%f7
	movpos	%icc,	%o1,	%g1
	movg	%xcc,	%i7,	%l3
loop_1630:
	nop
	setx	0xD07FC4CC,	%l0,	%l6
	st	%l6,	[%l7 + 0x24]
	ld	[%l7 + 0x24],	%fsr
	fmovde	%xcc,	%f24,	%f3
	nop
	fitod	%f2,	%f6
	fdtox	%f6,	%f6
	fxtod	%f6,	%f6
	sll	%l1,	0x09,	%i4
	movg	%icc,	%g2,	%o5
	edge8	%i2,	%o6,	%g3
	movge	%xcc,	%i0,	%g6
	tcs	%xcc,	0x0
	set	0x7A, %i6
	ldsha	[%l7 + %i6] 0x11,	%o4
	smul	%i1,	%l4,	%l2
	fxor	%f24,	%f28,	%f6
	edge16n	%g5,	%o0,	%l6
	movrne	%l5,	0x29A,	%g4
	srl	%o2,	%g7,	%o3
	add	%l7,	0x38,	%l6
	wr	%g0,	0x18,	%asi
	casxa	[%l6] %asi,	%o7,	%i3
	fmovdleu	%icc,	%f8,	%f30
	movle	%xcc,	%l0,	%i6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	taddcc	%i5,	%g1,	%o1
	srax	%i7,	0x16,	%l3
	fmovdne	%icc,	%f15,	%f29
	movcs	%icc,	%l1,	%g2
	ldstub	[%l7 + 0x35],	%i4
	ba,a,pt	%xcc,	loop_1631
	fbule	%fcc2,	loop_1632
	edge16l	%o5,	%o6,	%g3
	bpos	%icc,	loop_1633
loop_1631:
	ldsb	[%l7 + 0x1D],	%i2
loop_1632:
	fmul8x16au	%f12,	%f5,	%f24
	swap	[%l7 + 0x0C],	%g6
loop_1633:
	fbule,a	%fcc1,	loop_1634
	prefetch	[%l7 + 0x2C],	 0x2
	addc	%i0,	0x1000,	%o4
	sdiv	%l4,	0x192D,	%l2
loop_1634:
	edge16l	%g5,	%i1,	%o0
	fbne	%fcc2,	loop_1635
	nop
	fitod	%f10,	%f14
	fdtox	%f14,	%f24
	ldx	[%l7 + 0x08],	%l6
	umulcc	%g4,	0x1171,	%l5
loop_1635:
	bpos,a	loop_1636
	mulx	%g7,	%o2,	%o7
	add	%l7,	0x78,	%l6
	wr	%g0,	0x19,	%asi
	ldxa	[%l6] %asi,	%i3
	casxa	[%l6] %asi,	%i3,	%o3
loop_1636:
	bn	%xcc,	loop_1637
	nop
	setx	0x806EB8BE,	%l0,	%l6
	st	%l6,	[%l7 + 0x40]
	ld	[%l7 + 0x40],	%fsr
	udivcc	%i6,	0x03FE,	%l0
	orncc	%i5,	%g1,	%i7
loop_1637:
	fbu	%fcc3,	loop_1638
	or	%o1,	0x0CB1,	%l1
	fmovdne	%icc,	%f10,	%f18
	taddcc	%g2,	0x00CB,	%i4
loop_1638:
	sllx	%o5,	%l3,	%o6
	te	%xcc,	0x4
	te	%icc,	0x7
	andn	%g3,	0x1933,	%g6
	alignaddr	%i0,	%o4,	%i2
	orcc	%l4,	0x00DA,	%g5
	fmul8x16al	%f20,	%f28,	%f26
	fmul8x16	%f3,	%f20,	%f28
	addccc	%l2,	%o0,	%i1
	tsubcctv	%g4,	0x159E,	%l5
	tneg	%icc,	0x7
	wr	%g0,	0x11,	%asi
	sta	%f2,	[%l7 + 0x68] %asi
	addc	%g7,	0x0EA1,	%l6
	tge	%xcc,	0x3
	orcc	%o7,	%o2,	%i3
	array8	%i6,	%o3,	%i5
	movl	%xcc,	%g1,	%i7
	fmovsvc	%icc,	%f13,	%f6
	tvc	%icc,	0x7
	xnorcc	%l0,	0x0ECA,	%o1
	taddcctv	%l1,	%i4,	%g2
	sdivx	%l3,	0x0C58,	%o5
	edge32ln	%g3,	%o6,	%g6
	edge8ln	%i0,	%i2,	%o4
	movg	%icc,	%g5,	%l4
	wr	%g0,	0xe2,	%asi
	stba	%o0,	[%l7 + 0x79] %asi
	membar	#Sync
	brnz	%l2,	loop_1639
	tne	%icc,	0x6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bvc,pt	%icc,	loop_1640
loop_1639:
	xorcc	%i1,	0x0473,	%g4
	movleu	%icc,	%l5,	%l6
	tvs	%icc,	0x5
loop_1640:
	sethi	0x1BB3,	%o7
	edge32n	%o2,	%i3,	%g7
	add	%l7,	0x7C,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] %asi,	%o3,	%i6
	swap	[%l7 + 0x44],	%g1
	ldx	[%l7 + 0x58],	%i7
	fabss	%f1,	%f0
	fbne	%fcc0,	loop_1641
	membar	0x61
	movrne	%i5,	0x1FD,	%l0
	movne	%icc,	%l1,	%o1
loop_1641:
	movn	%icc,	%g2,	%l3
	prefetch	[%l7 + 0x58],	 0x0
	nop
	setx	0x6003A9DC974E105F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0xD644E7C7EF1A5360,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	fmuld	%f24,	%f26,	%f12
	nop
	setx	0x1A305BAB11671F95,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0x4DDB7F2C69228D9B,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	faddd	%f8,	%f26,	%f18
	sll	%i4,	0x1A,	%o5
	smul	%g3,	%o6,	%g6
	st	%f7,	[%l7 + 0x2C]
	tgu	%xcc,	0x2
	array8	%i2,	%o4,	%i0
	edge16n	%g5,	%l4,	%l2
	orncc	%o0,	%g4,	%l5
	fmovrdne	%i1,	%f20,	%f0
	subcc	%o7,	%l6,	%o2
	edge8	%g7,	%i3,	%o3
	fzeros	%f21
	fmovrdlez	%g1,	%f20,	%f4
	wr	%g0,	0x19,	%asi
	ldda	[%l7 + 0x20] %asi,	%i6
	srax	%i7,	%i5,	%l0
	movvs	%icc,	%l1,	%g2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	setx	loop_1642,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fzero	%f20
	edge8l	%o1,	%i4,	%l3
	tneg	%icc,	0x4
loop_1642:
	taddcctv	%o5,	%g3,	%g6
	fbue	%fcc3,	loop_1643
	addcc	%o6,	%o4,	%i2
	nop
	fitod	%f10,	%f2
	movleu	%icc,	%g5,	%i0
loop_1643:
	nop
	fitos	%f5,	%f11
	fstox	%f11,	%f10
	fxtos	%f10,	%f25
	taddcc	%l4,	0x07E0,	%l2
	tsubcctv	%g4,	%l5,	%i1
	sllx	%o0,	0x19,	%o7
	fbue,a	%fcc0,	loop_1644
	umul	%l6,	0x0E31,	%g7
	smulcc	%i3,	%o2,	%g1
	fbge	%fcc3,	loop_1645
loop_1644:
	bg,a	%icc,	loop_1646
	srlx	%i6,	%o3,	%i7
	movg	%icc,	%i5,	%l0
loop_1645:
	fmovscc	%xcc,	%f14,	%f27
loop_1646:
	udivx	%l1,	0x1B7B,	%o1
	orncc	%i4,	0x1B84,	%g2
	movrne	%l3,	%o5,	%g3
	addccc	%g6,	%o6,	%o4
	fcmple32	%f26,	%f8,	%i2
	udivcc	%g5,	0x0041,	%i0
	fmovrse	%l2,	%f29,	%f3
	fbug,a	%fcc0,	loop_1647
	udivx	%g4,	0x1A02,	%l4
	sll	%l5,	0x03,	%i1
	bvc,a,pt	%xcc,	loop_1648
loop_1647:
	nop
	setx	loop_1649,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	alignaddr	%o0,	%o7,	%l6
	tsubcctv	%i3,	%g7,	%g1
loop_1648:
	nop
	wr	%g0,	0x89,	%asi
	ldswa	[%l7 + 0x08] %asi,	%o2
loop_1649:
	fbue,a	%fcc1,	loop_1650
	ldsh	[%l7 + 0x64],	%i6
	fnot1	%f8,	%f28
	movneg	%icc,	%i7,	%o3
loop_1650:
	nop
	fitod	%f12,	%f12
	fdtoi	%f12,	%f20
	nop
	set	0x6B, %g6
	stb	%i5,	[%l7 + %g6]
	nop
	setx	0x96F369976C7BD1C0,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0x3CEB525E400E2FFF,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	fmuld	%f22,	%f30,	%f18
	umul	%l1,	%o1,	%l0
	fpmerge	%f27,	%f13,	%f4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbl	%fcc3,	loop_1651
	array32	%g2,	%l3,	%o5
	srl	%g3,	0x0C,	%i4
	movrgz	%o6,	0x207,	%g6
loop_1651:
	fand	%f14,	%f4,	%f14
	movrgez	%i2,	%g5,	%o4
	wr	%g0,	0x80,	%asi
	ldswa	[%l7 + 0x64] %asi,	%l2
	xnor	%i0,	0x0672,	%g4
	fone	%f26
	array32	%l5,	%l4,	%o0
	tcc	%xcc,	0x1
	subc	%o7,	0x1BB5,	%i1
	stb	%i3,	[%l7 + 0x18]
	srax	%g7,	%l6,	%o2
	stx	%g1,	[%l7 + 0x28]
	fabsd	%f0,	%f0
	tge	%icc,	0x0
	edge16ln	%i7,	%i6,	%i5
	fmovdneg	%xcc,	%f1,	%f12
	tge	%icc,	0x0
	pdist	%f30,	%f16,	%f28
	sethi	0x137C,	%l1
	move	%icc,	%o3,	%l0
	edge32	%o1,	%l3,	%o5
	udiv	%g3,	0x11CA,	%g2
	ldsb	[%l7 + 0x40],	%o6
	edge32l	%i4,	%i2,	%g5
	tpos	%icc,	0x5
	lduw	[%l7 + 0x74],	%g6
	xnorcc	%l2,	0x1415,	%i0
	movge	%icc,	%g4,	%l5
	bcs,a,pn	%xcc,	loop_1652
	movg	%xcc,	%l4,	%o0
	fandnot1	%f20,	%f4,	%f28
	movneg	%icc,	%o4,	%o7
loop_1652:
	nop
	wr	%g0,	0xe3,	%asi
	stba	%i1,	[%l7 + 0x4A] %asi
	membar	#Sync
	sir	0x03A6
	tleu	%icc,	0x4
	fnot2	%f4,	%f16
	fnot2s	%f7,	%f0
	alignaddr	%g7,	%i3,	%o2
	brnz	%l6,	loop_1653
	fbl	%fcc0,	loop_1654
	tgu	%icc,	0x7
	tpos	%icc,	0x7
loop_1653:
	mulx	%g1,	%i6,	%i7
loop_1654:
	fbo,a	%fcc2,	loop_1655
	array16	%i5,	%o3,	%l0
	movrgz	%l1,	0x2D3,	%l3
	set	0x76, %l2
	stba	%o5,	[%l7 + %l2] 0x14
loop_1655:
	movge	%xcc,	%g3,	%o1
	array8	%o6,	%g2,	%i2
	array32	%i4,	%g5,	%l2
	tgu	%icc,	0x5
	fcmpgt32	%f0,	%f2,	%i0
	addccc	%g6,	%g4,	%l4
	addccc	%l5,	%o4,	%o7
	sdiv	%o0,	0x05B3,	%i1
	fble,a	%fcc1,	loop_1656
	ble	%icc,	loop_1657
	bleu,a,pt	%xcc,	loop_1658
	nop
	fitod	%f28,	%f24
loop_1656:
	sll	%g7,	0x00,	%i3
loop_1657:
	tsubcctv	%o2,	%g1,	%i6
loop_1658:
	tgu	%xcc,	0x7
	tsubcc	%i7,	0x0C58,	%l6
	umulcc	%o3,	0x1A9F,	%i5
	fnot2s	%f15,	%f7
	movne	%icc,	%l0,	%l1
	fbo,a	%fcc2,	loop_1659
	edge16ln	%o5,	%g3,	%l3
	subc	%o1,	%g2,	%o6
	nop
	fitos	%f7,	%f27
	fstod	%f27,	%f22
loop_1659:
	taddcctv	%i2,	0x1E53,	%g5
	edge32n	%l2,	%i0,	%i4
	nop
	setx	loop_1660,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	nop
	setx	0x914D59A8106E1961,	%l0,	%l6
	stx	%l6,	[%l7 + 0x40]
	ldx	[%l7 + 0x40],	%fsr
	bvs	%icc,	loop_1661
	fmovscc	%xcc,	%f4,	%f17
loop_1660:
	brnz	%g4,	loop_1662
	ldub	[%l7 + 0x41],	%g6
loop_1661:
	membar	0x5F
	fabsd	%f26,	%f30
loop_1662:
	movrgz	%l4,	%o4,	%o7
	orcc	%o0,	0x1148,	%i1
	set	0x08, %i4
	lduha	[%l7 + %i4] 0x04,	%g7
	tsubcc	%l5,	%i3,	%g1
	bvc	loop_1663
	ldsb	[%l7 + 0x16],	%o2
	fpack16	%f22,	%f29
	fpsub16	%f30,	%f22,	%f20
loop_1663:
	fandnot1s	%f19,	%f12,	%f1
	lduh	[%l7 + 0x7E],	%i7
	ta	%icc,	0x7
	addc	%i6,	0x0AA6,	%l6
	nop
	fitos	%f0,	%f6
	fstod	%f6,	%f4
	fnot2	%f28,	%f30
	subc	%o3,	%l0,	%i5
	alignaddr	%l1,	%o5,	%l3
	stb	%g3,	[%l7 + 0x44]
	ldsw	[%l7 + 0x44],	%o1
	addccc	%o6,	0x189F,	%i2
	xnorcc	%g2,	0x0FBF,	%l2
	movcc	%xcc,	%i0,	%i4
	fmovdgu	%icc,	%f30,	%f0
	edge16	%g4,	%g6,	%g5
	nop
	setx	0x61FE1794,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f11
	setx	0x4E49EF33,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f31
	fmuls	%f31,	%f11,	%f26
	tleu	%icc,	0x5
	fmovrse	%o4,	%f11,	%f15
	sub	%o7,	0x1BFA,	%l4
	bg,pn	%xcc,	loop_1664
	alignaddr	%o0,	%g7,	%l5
	bneg,a	loop_1665
	movrgz	%i1,	0x0FC,	%i3
loop_1664:
	movpos	%xcc,	%g1,	%o2
	movn	%icc,	%i6,	%l6
loop_1665:
	edge16ln	%i7,	%o3,	%i5
	and	%l0,	%o5,	%l3
	subcc	%l1,	%o1,	%o6
	add	%l7,	0x0C,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%i2,	%g3
	fmovsneg	%xcc,	%f2,	%f25
	fmovrsgez	%l2,	%f12,	%f26
	addcc	%i0,	%g2,	%g4
	udivcc	%g6,	0x0602,	%g5
	or	%o4,	0x066C,	%o7
	movcs	%icc,	%i4,	%o0
	tn	%icc,	0x1
	fpackfix	%f30,	%f1
	orncc	%g7,	%l4,	%i1
	nop
	setx	0x205397C2,	%l0,	%l6
	st	%l6,	[%l7 + 0x24]
	ld	[%l7 + 0x24],	%fsr
	fpack32	%f28,	%f10,	%f30
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movge	%xcc,	%l5,	%g1
	fmovrsne	%i3,	%f17,	%f5
	fmovdge	%icc,	%f11,	%f8
	umul	%o2,	0x029D,	%i6
	orncc	%l6,	%o3,	%i7
	flush	%l7 + 0x7C
	fmovdg	%icc,	%f15,	%f24
	movrgez	%l0,	0x243,	%i5
	movrne	%o5,	0x217,	%l3
	fmovd	%f10,	%f26
	mova	%icc,	%o1,	%o6
	tleu	%xcc,	0x5
	fmul8x16au	%f31,	%f22,	%f22
	sdivx	%i2,	0x0E25,	%l1
	movrne	%l2,	%g3,	%g2
	alignaddrl	%g4,	%g6,	%g5
	tn	%icc,	0x4
	taddcc	%o4,	0x1425,	%i0
	popc	%i4,	%o7
	addcc	%o0,	%l4,	%g7
	edge32ln	%l5,	%g1,	%i1
	ldsh	[%l7 + 0x32],	%o2
	std	%f2,	[%l7 + 0x18]
	subc	%i6,	%i3,	%l6
	wr	%g0,	0x19,	%asi
	ldsba	[%l7 + 0x08] %asi,	%o3
	edge8ln	%l0,	%i7,	%o5
	movg	%xcc,	%i5,	%l3
	nop
	setx	0x3A779FC3,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f29
	setx	0x5839F923,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f16
	fsubs	%f16,	%f29,	%f14
	nop
	setx loop_1666, %l0, %l1
	jmpl %l1, %o1
	bcs,pt	%icc,	loop_1667
	movn	%xcc,	%i2,	%o6
	fbl,a	%fcc3,	loop_1668
loop_1666:
	smul	%l2,	0x0F60,	%g3
loop_1667:
	movrgez	%g2,	0x128,	%l1
	fmovse	%icc,	%f11,	%f24
loop_1668:
	movcs	%icc,	%g4,	%g5
	tvs	%icc,	0x1
	fmovdneg	%icc,	%f16,	%f8
	srax	%o4,	0x12,	%g6
	fmovsgu	%xcc,	%f6,	%f12
	nop
	fitos	%f4,	%f23
	fstox	%f23,	%f18
	fxtos	%f18,	%f18
	alignaddr	%i0,	%o7,	%i4
	call	loop_1669
	tle	%xcc,	0x5
	movle	%xcc,	%l4,	%o0
	wr	%g0,	0xf1,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
loop_1669:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tge	%xcc,	0x0
	movvc	%xcc,	%g7,	%g1
	nop
	setx	0xE36EBCACD81AB3ED,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0x8450C6C5757B9A89,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	fmuld	%f6,	%f28,	%f4
	mulx	%i1,	%o2,	%l5
	movcs	%icc,	%i3,	%i6
	movvc	%xcc,	%o3,	%l6
	set	0x80, %l5
	ldxa	[%g0 + %l5] 0x58,	%i7
	set	0x68, %g1
	prefetcha	[%l7 + %g1] 0x19,	 0x0
	fnand	%f2,	%f12,	%f18
	lduh	[%l7 + 0x14],	%i5
	movrgz	%l3,	0x3D7,	%o5
	fzero	%f24
	fnors	%f8,	%f28,	%f11
	sdivx	%o1,	0x092C,	%o6
	ldub	[%l7 + 0x09],	%i2
	movcc	%xcc,	%g3,	%l2
	set	0x20, %g2
	prefetcha	[%l7 + %g2] 0x81,	 0x2
	edge8l	%g4,	%g5,	%o4
	sllx	%g6,	%l1,	%i0
	movvc	%icc,	%o7,	%l4
	stb	%i4,	[%l7 + 0x49]
	sdivx	%o0,	0x1F2E,	%g1
	movcc	%icc,	%i1,	%o2
	tvs	%xcc,	0x1
	tge	%xcc,	0x7
	srl	%g7,	%i3,	%i6
	fcmple32	%f18,	%f14,	%l5
	sll	%o3,	0x09,	%l6
	sllx	%i7,	0x14,	%i5
	edge16n	%l0,	%l3,	%o1
	orncc	%o6,	0x0A12,	%i2
	edge32	%g3,	%o5,	%l2
	movvc	%icc,	%g4,	%g5
	edge8l	%o4,	%g2,	%g6
	bcc	loop_1670
	fornot1	%f20,	%f12,	%f18
	set	0x59, %l6
	ldstuba	[%l7 + %l6] 0x0c,	%l1
loop_1670:
	add	%i0,	0x0A3B,	%o7
	fmovscs	%xcc,	%f24,	%f8
	nop
	setx	0x76C802EFA079E7CD,	%l0,	%l6
	stx	%l6,	[%l7 + 0x70]
	ldx	[%l7 + 0x70],	%fsr
	prefetch	[%l7 + 0x34],	 0x3
	addcc	%l4,	%i4,	%g1
	ldstub	[%l7 + 0x5D],	%i1
	sra	%o0,	0x19,	%o2
	edge16n	%i3,	%g7,	%i6
	edge32l	%o3,	%l5,	%i7
	fmovrsgez	%i5,	%f15,	%f14
	xnor	%l6,	%l0,	%o1
	tg	%xcc,	0x1
	ldstub	[%l7 + 0x3A],	%o6
	smul	%i2,	0x0A70,	%l3
	umulcc	%g3,	%l2,	%g4
	stw	%o5,	[%l7 + 0x68]
	sdiv	%g5,	0x180F,	%o4
	wr	%g0,	0xe2,	%asi
	ldda	[%l7 + 0x60] %asi,	%g2
	edge32l	%l1,	%i0,	%g6
	andncc	%o7,	%i4,	%g1
	sth	%l4,	[%l7 + 0x42]
	fornot2	%f16,	%f12,	%f6
	ldsh	[%l7 + 0x2A],	%o0
	tsubcc	%o2,	0x0C8B,	%i3
	tne	%icc,	0x5
	set	0x0C, %i3
	ldsha	[%l7 + %i3] 0x19,	%i1
	mova	%icc,	%i6,	%g7
	movvc	%xcc,	%o3,	%i7
	edge8l	%l5,	%i5,	%l0
	sdiv	%o1,	0x1A05,	%l6
	mulx	%i2,	%l3,	%g3
	popc	%o6,	%g4
	bleu,a,pt	%icc,	loop_1671
	stx	%o5,	[%l7 + 0x38]
	tcc	%icc,	0x3
	edge16ln	%g5,	%l2,	%o4
loop_1671:
	andcc	%l1,	%i0,	%g6
	movrlez	%g2,	0x045,	%i4
	udivcc	%o7,	0x18BA,	%l4
	fpack32	%f8,	%f24,	%f4
	fzeros	%f21
	fandnot2	%f26,	%f20,	%f16
	te	%xcc,	0x6
	udivcc	%g1,	0x10FB,	%o0
	andcc	%o2,	0x1110,	%i3
	movpos	%icc,	%i6,	%g7
	and	%o3,	%i1,	%l5
	array16	%i5,	%l0,	%o1
	umul	%l6,	%i7,	%l3
	fnot1s	%f20,	%f29
	fmul8sux16	%f14,	%f6,	%f6
	movl	%xcc,	%g3,	%i2
	srax	%o6,	%g4,	%o5
	fbule,a	%fcc1,	loop_1672
	orncc	%l2,	%o4,	%g5
	fsrc2s	%f20,	%f17
	sdivcc	%l1,	0x0DC7,	%i0
loop_1672:
	nop
	setx	0x8686DCCD3B345BA7,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0x04074C450F2EC4CD,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	fdivd	%f6,	%f0,	%f16
	edge16	%g2,	%g6,	%o7
	nop
	setx	0x857D548874CDE0DB,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0xBD986044A0E31E17,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	fmuld	%f30,	%f14,	%f16
	fornot2s	%f11,	%f24,	%f25
	fone	%f4
	xnorcc	%i4,	0x11D0,	%g1
	set	0x48, %g5
	stwa	%l4,	[%l7 + %g5] 0x2b
	membar	#Sync
	movg	%icc,	%o0,	%o2
	nop
	setx loop_1673, %l0, %l1
	jmpl %l1, %i6
	sllx	%i3,	0x03,	%g7
	sdivx	%o3,	0x07BC,	%l5
	udivcc	%i5,	0x0EFE,	%l0
loop_1673:
	fmovrsne	%o1,	%f12,	%f15
	orcc	%l6,	0x030C,	%i7
	edge8	%l3,	%g3,	%i2
	edge16l	%i1,	%o6,	%g4
	edge16ln	%o5,	%l2,	%o4
	movne	%icc,	%l1,	%i0
	tgu	%icc,	0x6
	smul	%g2,	0x1770,	%g6
	movleu	%xcc,	%o7,	%i4
	movre	%g1,	%l4,	%g5
	tpos	%xcc,	0x5
	nop
	fitos	%f5,	%f21
	fstod	%f21,	%f6
	add	%l7,	0x74,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%o2
	casa	[%l6] %asi,	%o2,	%o0
	ble,a,pn	%xcc,	loop_1674
	orcc	%i3,	0x01D9,	%g7
	and	%i6,	0x02CA,	%o3
	sub	%l5,	0x1BAC,	%l0
loop_1674:
	nop
	setx	0xA1073F5F,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f30
	setx	0xE756D1AE,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f4
	fsubs	%f4,	%f30,	%f21
	smul	%o1,	%i5,	%l6
	nop
	setx loop_1675, %l0, %l1
	jmpl %l1, %i7
	fors	%f28,	%f27,	%f18
	tle	%icc,	0x5
	alignaddr	%l3,	%i2,	%g3
loop_1675:
	tge	%icc,	0x2
	fandnot2s	%f7,	%f19,	%f19
	movpos	%icc,	%i1,	%o6
	tcc	%xcc,	0x7
	movrlez	%o5,	%g4,	%l2
	tleu	%xcc,	0x4
	taddcc	%o4,	%l1,	%g2
	xnor	%g6,	0x09E7,	%o7
	sub	%i4,	0x1EF9,	%i0
	edge16l	%g1,	%l4,	%o2
	fmovdg	%icc,	%f30,	%f26
	fmovsvs	%icc,	%f29,	%f15
	orcc	%g5,	0x1A1D,	%i3
	fornot2	%f8,	%f4,	%f22
	fbul	%fcc2,	loop_1676
	smul	%g7,	%i6,	%o0
	fbul,a	%fcc1,	loop_1677
	edge32l	%o3,	%l0,	%o1
loop_1676:
	nop
	wr	%g0,	0x17,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
loop_1677:
	array16	%l5,	%i5,	%l6
	bne,pt	%xcc,	loop_1678
	movcs	%xcc,	%l3,	%i7
	movleu	%icc,	%g3,	%i1
	nop
	fitod	%f9,	%f10
loop_1678:
	fmul8x16au	%f0,	%f18,	%f26
	tgu	%icc,	0x2
	sub	%o6,	%o5,	%i2
	mulx	%g4,	0x1868,	%l2
	srax	%o4,	%g2,	%g6
	set	0x0A, %l0
	ldsba	[%l7 + %l0] 0x80,	%o7
	array16	%l1,	%i4,	%g1
	udivcc	%l4,	0x1BC1,	%i0
	bn,a	%icc,	loop_1679
	movgu	%xcc,	%o2,	%g5
	edge8n	%i3,	%g7,	%o0
	nop
	setx	0xA06EC8BE,	%l0,	%l6
	st	%l6,	[%l7 + 0x54]
	ld	[%l7 + 0x54],	%fsr
loop_1679:
	fpadd32	%f14,	%f22,	%f8
	orncc	%i6,	%l0,	%o1
	sub	%l5,	%i5,	%l6
	xor	%o3,	%l3,	%i7
	fabss	%f28,	%f24
	mova	%icc,	%g3,	%o6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fble	%fcc1,	loop_1680
	be	%xcc,	loop_1681
	tne	%icc,	0x6
	fpsub16s	%f13,	%f17,	%f26
loop_1680:
	tcs	%icc,	0x3
loop_1681:
	fmovdvs	%xcc,	%f30,	%f29
	mova	%icc,	%i1,	%i2
	array8	%o5,	%l2,	%o4
	tne	%icc,	0x0
	set	0x40, %o4
	stda	%f16,	[%l7 + %o4] 0xf9
	membar	#Sync
	move	%xcc,	%g2,	%g4
	ta	%xcc,	0x6
	fmovdleu	%xcc,	%f29,	%f3
	tcs	%icc,	0x3
	tcs	%xcc,	0x1
	xor	%o7,	%g6,	%i4
	fmovscs	%icc,	%f6,	%f3
	movrne	%l1,	0x3CA,	%g1
	edge8ln	%i0,	%l4,	%o2
	fmuld8sux16	%f2,	%f8,	%f8
	edge16ln	%i3,	%g7,	%g5
	wr	%g0,	0x19,	%asi
	lduwa	[%l7 + 0x48] %asi,	%o0
	fmovs	%f5,	%f21
	sllx	%i6,	%l0,	%o1
	sdivcc	%l5,	0x0AB5,	%l6
	wr	%g0,	0x27,	%asi
	ldda	[%l7 + 0x30] %asi,	%o2
	alignaddr	%i5,	%i7,	%l3
	tneg	%icc,	0x5
	fbul,a	%fcc3,	loop_1682
	sir	0x093C
	fands	%f2,	%f22,	%f21
	movrgz	%o6,	0x08D,	%i1
loop_1682:
	membar	0x3D
	lduw	[%l7 + 0x2C],	%i2
	set	0x58, %i5
	stha	%g3,	[%l7 + %i5] 0x88
	set	0x20, %o6
	sta	%f25,	[%l7 + %o6] 0x10
	taddcc	%o5,	0x15DA,	%l2
	orncc	%g2,	0x0B14,	%o4
	movge	%icc,	%o7,	%g4
	movrlez	%g6,	%i4,	%g1
	fsrc2	%f16,	%f0
	subccc	%i0,	%l4,	%l1
	fmovsa	%xcc,	%f29,	%f27
	ba,a	%icc,	loop_1683
	andncc	%o2,	%g7,	%i3
	movg	%xcc,	%o0,	%i6
	movrlez	%l0,	0x080,	%o1
loop_1683:
	subc	%l5,	%l6,	%g5
	bpos,a	%xcc,	loop_1684
	tneg	%icc,	0x3
	movvs	%xcc,	%o3,	%i7
	tg	%xcc,	0x0
loop_1684:
	ldsw	[%l7 + 0x70],	%l3
	bvc,a,pt	%icc,	loop_1685
	fpadd16	%f28,	%f12,	%f16
	udivx	%i5,	0x1F7E,	%o6
	movcs	%xcc,	%i1,	%g3
loop_1685:
	udivx	%i2,	0x0E75,	%o5
	movvs	%xcc,	%l2,	%o4
	movrgez	%o7,	0x026,	%g2
	fmovsn	%icc,	%f17,	%f13
	fpadd16	%f26,	%f18,	%f16
	fpadd32	%f18,	%f18,	%f0
	tvc	%xcc,	0x7
	tl	%icc,	0x6
	movne	%icc,	%g4,	%i4
	fnot1s	%f7,	%f28
	tvc	%icc,	0x5
	edge32l	%g1,	%i0,	%l4
	taddcc	%l1,	%o2,	%g7
	fzeros	%f14
	srax	%i3,	%g6,	%o0
	sra	%i6,	0x1C,	%o1
	stbar
	ldd	[%l7 + 0x28],	%l0
	fbule,a	%fcc3,	loop_1686
	nop
	setx	0xE5DE12FC50756A7E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldx	[%l7 + 0x28],	%fsr
	movrlez	%l5,	%g5,	%l6
	stx	%o3,	[%l7 + 0x18]
loop_1686:
	fcmpeq32	%f12,	%f6,	%l3
	bcs	%icc,	loop_1687
	fbo,a	%fcc2,	loop_1688
	stx	%i5,	[%l7 + 0x10]
	tsubcctv	%i7,	%i1,	%o6
loop_1687:
	alignaddr	%g3,	%o5,	%i2
loop_1688:
	fmovscs	%icc,	%f10,	%f8
	xorcc	%l2,	%o7,	%o4
	movg	%icc,	%g2,	%g4
	movle	%icc,	%i4,	%i0
	srl	%g1,	%l4,	%o2
	udivcc	%l1,	0x04A0,	%i3
	movre	%g7,	%o0,	%i6
	orcc	%o1,	0x0109,	%l0
	nop
	setx	loop_1689,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	nop
	setx	0x08E0FB61B070CCEE,	%l0,	%l6
	stx	%l6,	[%l7 + 0x58]
	ldx	[%l7 + 0x58],	%fsr
	fmovrsne	%g6,	%f18,	%f12
	xorcc	%l5,	%g5,	%o3
loop_1689:
	st	%f19,	[%l7 + 0x14]
	smulcc	%l3,	%i5,	%l6
	ldsw	[%l7 + 0x50],	%i1
	andncc	%i7,	%g3,	%o6
	set	0x28, %l3
	ldswa	[%l7 + %l3] 0x0c,	%i2
	tg	%icc,	0x5
	wr	%g0,	0x88,	%asi
	ldsba	[%l7 + 0x60] %asi,	%l2
	fbo	%fcc1,	loop_1690
	call	loop_1691
	orn	%o5,	%o7,	%o4
	smul	%g2,	0x153B,	%i4
loop_1690:
	fmovsne	%icc,	%f16,	%f6
loop_1691:
	fornot2	%f26,	%f30,	%f26
	move	%xcc,	%g4,	%g1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	or	%i0,	%o2,	%l4
	umulcc	%l1,	%i3,	%g7
	mulx	%i6,	%o0,	%l0
	lduw	[%l7 + 0x18],	%g6
	mulscc	%o1,	%g5,	%l5
	nop
	setx	0x93C78E104ABC6BAC,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0x1555EE49A3C659E6,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	fdivd	%f28,	%f4,	%f22
	mulx	%l3,	0x1865,	%o3
	st	%f24,	[%l7 + 0x44]
	udivcc	%l6,	0x06D9,	%i5
	sethi	0x1983,	%i1
	movrgz	%g3,	%o6,	%i7
	fnot1s	%f9,	%f24
	nop
	set	0x3E, %o2
	sth	%l2,	[%l7 + %o2]
	sdiv	%o5,	0x0515,	%i2
	be	loop_1692
	fbue,a	%fcc0,	loop_1693
	sdivcc	%o4,	0x097C,	%g2
	bcs	loop_1694
loop_1692:
	addccc	%o7,	%i4,	%g1
loop_1693:
	movcc	%icc,	%i0,	%o2
	movvs	%icc,	%l4,	%l1
loop_1694:
	tcc	%xcc,	0x1
	nop
	fitos	%f7,	%f22
	movrgz	%i3,	%g7,	%g4
	sub	%o0,	%i6,	%l0
	wr	%g0,	0x18,	%asi
	swapa	[%l7 + 0x20] %asi,	%o1
	fmovda	%icc,	%f9,	%f2
	array16	%g5,	%l5,	%l3
	edge16l	%o3,	%g6,	%i5
	tcc	%icc,	0x5
	tvs	%xcc,	0x3
	movvc	%xcc,	%l6,	%g3
	edge32l	%i1,	%o6,	%i7
	mulscc	%l2,	%i2,	%o5
	tne	%icc,	0x5
	srax	%o4,	0x12,	%o7
	nop
	setx	0x4DBA2F958074A403,	%l0,	%l6
	stx	%l6,	[%l7 + 0x08]
	ldx	[%l7 + 0x08],	%fsr
	wr	%g0,	0x10,	%asi
	lduwa	[%l7 + 0x30] %asi,	%g2
	tl	%icc,	0x4
	tge	%icc,	0x2
	udiv	%g1,	0x1DE0,	%i0
	edge8l	%o2,	%i4,	%l4
	taddcc	%i3,	%g7,	%g4
	edge32ln	%l1,	%i6,	%o0
	fnot2s	%f1,	%f8
	xor	%o1,	0x1610,	%l0
	wr	%g0,	0x04,	%asi
	ldswa	[%l7 + 0x14] %asi,	%l5
	stbar
	fbul	%fcc2,	loop_1695
	tcs	%icc,	0x4
	xnorcc	%l3,	%g5,	%g6
	fcmpne32	%f10,	%f14,	%o3
loop_1695:
	tsubcctv	%i5,	%g3,	%l6
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
	movg	%icc,	%i1,	%i7
	brnz,a	%l2,	loop_1696
	umul	%i2,	0x13B1,	%o5
	sdivx	%o4,	0x119A,	%o7
	andncc	%o6,	%g2,	%i0
loop_1696:
	mulx	%o2,	%i4,	%g1
	tcc	%icc,	0x7
	movcs	%xcc,	%l4,	%g7
	set	0x0C, %g4
	lduwa	[%l7 + %g4] 0x04,	%i3
	fabss	%f0,	%f14
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	add	%g4,	0x19FB,	%i6
	edge16ln	%l1,	%o1,	%o0
	sir	0x1C3F
	sdivcc	%l5,	0x0E21,	%l0
	fmovsvc	%icc,	%f13,	%f20
	set	0x2C, %l1
	swapa	[%l7 + %l1] 0x80,	%l3
	fmovrslez	%g6,	%f19,	%f7
	movg	%xcc,	%o3,	%g5
	bleu,pt	%icc,	loop_1697
	ldx	[%l7 + 0x78],	%g3
	fbu	%fcc2,	loop_1698
	sth	%l6,	[%l7 + 0x28]
loop_1697:
	sllx	%i5,	%i1,	%i7
	mulx	%l2,	%o5,	%o4
loop_1698:
	bgu	loop_1699
	fmovdn	%xcc,	%f13,	%f17
	fbl,a	%fcc2,	loop_1700
	array8	%o7,	%i2,	%o6
loop_1699:
	std	%f8,	[%l7 + 0x08]
	array8	%i0,	%g2,	%i4
loop_1700:
	sdivx	%g1,	0x154D,	%o2
	ld	[%l7 + 0x3C],	%f2
	nop
	setx	0x2FD31D5B,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f30
	setx	0x0CAC4CC9,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f12
	fadds	%f12,	%f30,	%f6
	stbar
	edge8	%g7,	%l4,	%g4
	tvs	%icc,	0x1
	brz	%i3,	loop_1701
	ble	loop_1702
	tneg	%icc,	0x2
	orncc	%l1,	0x0B23,	%o1
loop_1701:
	brlz,a	%o0,	loop_1703
loop_1702:
	brgz,a	%i6,	loop_1704
	tle	%icc,	0x0
	andcc	%l5,	0x0C4E,	%l3
loop_1703:
	st	%f12,	[%l7 + 0x4C]
loop_1704:
	fmovrdne	%g6,	%f18,	%f8
	addccc	%o3,	%g5,	%l0
	nop
	fitod	%f6,	%f22
	fdtox	%f22,	%f30
	edge32l	%g3,	%i5,	%i1
	fbuge,a	%fcc1,	loop_1705
	tneg	%xcc,	0x1
	sethi	0x00D3,	%l6
	movg	%xcc,	%l2,	%i7
loop_1705:
	tle	%icc,	0x4
	fbg	%fcc1,	loop_1706
	fbg	%fcc1,	loop_1707
	umulcc	%o5,	%o7,	%o4
	alignaddrl	%o6,	%i2,	%i0
loop_1706:
	orn	%i4,	0x025A,	%g2
loop_1707:
	brlez,a	%g1,	loop_1708
	edge16l	%g7,	%o2,	%l4
	sdivcc	%g4,	0x111E,	%i3
	udivcc	%l1,	0x02C8,	%o1
loop_1708:
	movre	%i6,	0x198,	%o0
	nop
	set	0x0B, %i2
	stb	%l3,	[%l7 + %i2]
	fcmpgt32	%f14,	%f22,	%g6
	fmuld8ulx16	%f0,	%f23,	%f6
	ldsb	[%l7 + 0x5E],	%l5
	tleu	%icc,	0x5
	fbl	%fcc1,	loop_1709
	andcc	%g5,	%o3,	%l0
	sdiv	%i5,	0x1FAD,	%i1
	fmul8x16au	%f28,	%f15,	%f24
loop_1709:
	ldx	[%l7 + 0x30],	%g3
	stbar
	tvc	%xcc,	0x6
	sra	%l2,	0x0D,	%l6
	movl	%xcc,	%i7,	%o7
	udivx	%o5,	0x022D,	%o6
	fba,a	%fcc1,	loop_1710
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
	bshuffle	%f26,	%f24,	%f28
	andn	%o4,	%i0,	%i4
loop_1710:
	brz,a	%i2,	loop_1712
loop_1711:
	fmovsleu	%xcc,	%f15,	%f17
	xorcc	%g1,	0x1823,	%g2
	mulscc	%g7,	%l4,	%g4
loop_1712:
	orn	%o2,	0x1E32,	%l1
	brlz,a	%i3,	loop_1713
	stb	%i6,	[%l7 + 0x11]
	fpsub32s	%f29,	%f30,	%f17
	taddcctv	%o0,	0x1506,	%l3
loop_1713:
	tpos	%xcc,	0x1
	ta	%xcc,	0x2
	tsubcc	%g6,	%l5,	%o1
	tvs	%icc,	0x6
	edge8l	%o3,	%l0,	%g5
	alignaddr	%i5,	%i1,	%l2
	tne	%xcc,	0x4
	movcc	%xcc,	%l6,	%i7
	umulcc	%g3,	0x1B95,	%o7
	add	%l7,	0x5C,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%o6,	%o4
	set	0x68, %l4
	stxa	%o5,	[%l7 + %l4] 0x88
	set	0x60, %i1
	ldda	[%l7 + %i1] 0x2e,	%i4
	movrgez	%i2,	0x25D,	%i0
	nop
	setx	0x207BB558,	%l0,	%l6
	st	%l6,	[%l7 + 0x30]
	ld	[%l7 + 0x30],	%fsr
	fmuld8sux16	%f8,	%f0,	%f2
	fmovrdgez	%g2,	%f2,	%f26
	ldd	[%l7 + 0x58],	%f30
	fmovdgu	%icc,	%f7,	%f22
	movg	%icc,	%g1,	%g7
	fmovrse	%g4,	%f17,	%f17
	srl	%o2,	%l1,	%i3
	fmovsneg	%icc,	%f14,	%f16
	stw	%i6,	[%l7 + 0x64]
	fmovrde	%o0,	%f8,	%f6
	nop
	setx loop_1714, %l0, %l1
	jmpl %l1, %l3
	fmovsvc	%icc,	%f27,	%f23
	umul	%g6,	0x068A,	%l5
	sdiv	%o1,	0x070D,	%o3
loop_1714:
	movrgez	%l4,	0x0FB,	%g5
	edge32ln	%i5,	%i1,	%l0
	wr	%g0,	0x04,	%asi
	stxa	%l2,	[%l7 + 0x78] %asi
	array8	%i7,	%l6,	%o7
	tne	%icc,	0x5
	add	%l7,	0x70,	%l6
	wr	%g0,	0x10,	%asi
	ldxa	[%l6] %asi,	%g3
	casxa	[%l6] 0x10,	%g3,	%o6
	wr	%g0,	0x23,	%asi
	stwa	%o5,	[%l7 + 0x58] %asi
	membar	#Sync
	add	%l7,	0x08,	%l6
	wr	%g0,	0x10,	%asi
	casa	[%l6] %asi,	%i4,	%i2
	lduw	[%l7 + 0x40],	%i0
	st	%f21,	[%l7 + 0x28]
	xor	%o4,	0x198D,	%g1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	setx	0x09D65CE64611CE10,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	setx	0x42C22FCBC788DE81,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	fmuld	%f6,	%f18,	%f0
	alignaddrl	%g2,	%g7,	%g4
	edge32	%l1,	%i3,	%i6
	fandnot2	%f24,	%f24,	%f0
	smul	%o0,	0x1BFD,	%o2
	umul	%l3,	%l5,	%g6
	edge16n	%o3,	%o1,	%l4
	udivcc	%g5,	0x1217,	%i1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	or	%l0,	0x196D,	%i5
	fmovrsgz	%i7,	%f2,	%f15
	addc	%l6,	%l2,	%o7
	fmovrsne	%g3,	%f8,	%f3
	sllx	%o5,	%o6,	%i2
	movn	%icc,	%i4,	%i0
	wr	%g0,	0x2f,	%asi
	stwa	%o4,	[%l7 + 0x68] %asi
	membar	#Sync
	movrgez	%g1,	0x1F6,	%g2
	fmovsvs	%xcc,	%f2,	%f15
	fmovdpos	%xcc,	%f28,	%f19
	fmovsgu	%xcc,	%f1,	%f11
	fsrc1	%f30,	%f10
	fbuge	%fcc1,	loop_1715
	addc	%g4,	%l1,	%i3
	fblg	%fcc1,	loop_1716
	andncc	%g7,	%o0,	%i6
loop_1715:
	movl	%icc,	%o2,	%l3
	mulscc	%g6,	0x1FDA,	%o3
loop_1716:
	fmovsgu	%icc,	%f6,	%f27
	fbug	%fcc2,	loop_1717
	tvc	%xcc,	0x7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	smul	%l5,	0x1A92,	%o1
loop_1717:
	mulx	%g5,	0x1836,	%l4
	stbar
	tvc	%xcc,	0x4
	movcs	%xcc,	%i1,	%l0
	tcc	%icc,	0x0
	nop
	setx	0x9A066140107011CB,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldx	[%l7 + 0x28],	%fsr
	brlz	%i7,	loop_1718
	sdivcc	%i5,	0x15E4,	%l2
	movre	%l6,	0x10A,	%g3
	addc	%o5,	%o7,	%o6
loop_1718:
	nop
	setx	0xF820C6D91ABC8501,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0xBFF405AEB4BFDD93,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	fsubd	%f10,	%f0,	%f12
	fmovdcs	%xcc,	%f5,	%f26
	alignaddr	%i2,	%i0,	%i4
	bleu	%icc,	loop_1719
	bcc,a,pn	%xcc,	loop_1720
	fpack16	%f8,	%f16
	fbg,a	%fcc2,	loop_1721
loop_1719:
	fmovrdne	%o4,	%f28,	%f16
loop_1720:
	fmovda	%icc,	%f3,	%f18
	tge	%icc,	0x4
loop_1721:
	edge32ln	%g1,	%g2,	%g4
	addcc	%l1,	%i3,	%o0
	tvs	%xcc,	0x5
	andncc	%i6,	%g7,	%l3
	sir	0x1239
	set	0x3F, %g7
	ldsba	[%l7 + %g7] 0x0c,	%g6
	tsubcctv	%o2,	0x0BEF,	%l5
	fmovrsgz	%o3,	%f6,	%f14
	fmovrdlez	%g5,	%f22,	%f20
	fmovsl	%xcc,	%f28,	%f10
	nop
	setx	0xA04E5AAE,	%l0,	%l6
	st	%l6,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%fsr
	fbne,a	%fcc1,	loop_1722
	srl	%l4,	0x00,	%i1
	tcc	%xcc,	0x4
	swap	[%l7 + 0x58],	%o1
loop_1722:
	nop
	set	0x40, %i0
	stda	%f16,	[%l7 + %i0] 0xf9
	membar	#Sync
	edge16l	%l0,	%i7,	%l2
	fble	%fcc2,	loop_1723
	nop
	setx	0x0289D057104DDE75,	%l0,	%l6
	stx	%l6,	[%l7 + 0x08]
	ldx	[%l7 + 0x08],	%fsr
	taddcctv	%i5,	%l6,	%g3
	fmovdvc	%icc,	%f9,	%f20
loop_1723:
	array8	%o7,	%o5,	%i2
	movleu	%icc,	%i0,	%o6
	fmovdg	%xcc,	%f22,	%f25
	bl,pn	%icc,	loop_1724
	movne	%icc,	%i4,	%o4
	udiv	%g1,	0x1A80,	%g4
	orncc	%l1,	0x1801,	%g2
loop_1724:
	bn,a	%xcc,	loop_1725
	stx	%i3,	[%l7 + 0x70]
	tge	%icc,	0x2
	orncc	%i6,	%g7,	%l3
loop_1725:
	edge32ln	%o0,	%o2,	%l5
	tcs	%icc,	0x7
	fsrc1s	%f11,	%f15
	fblg,a	%fcc1,	loop_1726
	fmul8x16	%f15,	%f24,	%f20
	fmovdneg	%xcc,	%f15,	%f4
	sll	%g6,	0x09,	%g5
loop_1726:
	nop
	set	0x63, %g3
	ldsba	[%l7 + %g3] 0x15,	%o3
	movge	%xcc,	%l4,	%i1
	movne	%xcc,	%l0,	%i7
	set	0x4C, %o5
	ldswa	[%l7 + %o5] 0x88,	%l2
	fsrc2s	%f3,	%f24
	fnand	%f18,	%f30,	%f2
	tgu	%icc,	0x5
	ta	%xcc,	0x3
	wr	%g0,	0x19,	%asi
	lduba	[%l7 + 0x41] %asi,	%i5
	fmovsn	%icc,	%f31,	%f20
	movgu	%icc,	%l6,	%g3
	andncc	%o1,	%o7,	%o5
	fsrc1	%f12,	%f0
	fornot2s	%f3,	%f26,	%f25
	fbo,a	%fcc0,	loop_1727
	ta	%icc,	0x1
	tle	%xcc,	0x6
	mulscc	%i0,	%o6,	%i2
loop_1727:
	movg	%icc,	%i4,	%g1
	tl	%xcc,	0x6
	fnegd	%f18,	%f10
	edge32l	%o4,	%g4,	%l1
	fpsub32	%f8,	%f14,	%f2
	wr	%g0,	0x80,	%asi
	lduwa	[%l7 + 0x60] %asi,	%g2
	fmovdgu	%icc,	%f17,	%f18
	srlx	%i3,	%i6,	%l3
	fmovrde	%o0,	%f26,	%f24
	movvc	%xcc,	%g7,	%l5
	edge8n	%g6,	%o2,	%g5
	sdivcc	%l4,	0x0228,	%o3
	fmovsl	%xcc,	%f3,	%f26
	call	loop_1728
	sra	%l0,	%i1,	%l2
	movrlez	%i7,	0x334,	%i5
	addccc	%l6,	0x1088,	%o1
loop_1728:
	fbul	%fcc1,	loop_1729
	xor	%o7,	%g3,	%o5
	array8	%o6,	%i0,	%i4
	umul	%i2,	%o4,	%g4
loop_1729:
	fmovrde	%l1,	%f22,	%f22
	fmovdne	%icc,	%f17,	%f4
	tcc	%icc,	0x5
	edge8ln	%g1,	%i3,	%g2
	tpos	%icc,	0x2
	call	loop_1730
	orn	%l3,	0x1FBA,	%i6
	subcc	%o0,	0x1B21,	%g7
	tg	%icc,	0x1
loop_1730:
	tg	%xcc,	0x0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnorcc	%g6,	0x02BE,	%o2
	lduh	[%l7 + 0x3A],	%l5
	edge16l	%g5,	%l4,	%o3
	set	0x72, %i7
	ldsha	[%l7 + %i7] 0x89,	%l0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32ln	%l2,	%i7,	%i1
	mova	%icc,	%l6,	%i5
	nop
	fitod	%f10,	%f20
	fdtoi	%f20,	%f25
	mova	%xcc,	%o1,	%g3
	srl	%o7,	0x03,	%o5
	movle	%xcc,	%o6,	%i0
	fnegs	%f19,	%f14
	addc	%i4,	%o4,	%i2
	fors	%f27,	%f23,	%f11
	edge32	%l1,	%g4,	%i3
	te	%xcc,	0x1
	set	0x40, %o7
	ldswa	[%l7 + %o7] 0x04,	%g2
	movgu	%xcc,	%l3,	%i6
	fblg,a	%fcc0,	loop_1731
	edge8l	%g1,	%g7,	%o0
	smul	%o2,	0x0731,	%l5
	umul	%g6,	%g5,	%l4
loop_1731:
	edge8	%l0,	%o3,	%l2
	edge32l	%i7,	%l6,	%i1
	edge32ln	%i5,	%o1,	%o7
	fnors	%f8,	%f1,	%f9
	alignaddrl	%o5,	%o6,	%i0
	fbg,a	%fcc3,	loop_1732
	or	%g3,	%o4,	%i2
	fornot1	%f22,	%f0,	%f16
	mulscc	%l1,	0x0C3D,	%i4
loop_1732:
	nop
	fitod	%f0,	%f28
	fdtox	%f28,	%f22
	move	%icc,	%i3,	%g2
	movvc	%icc,	%l3,	%g4
	fmovrsne	%i6,	%f13,	%f11
	xnorcc	%g1,	0x1406,	%g7
	fnot1	%f0,	%f4
	bpos	loop_1733
	sllx	%o0,	0x0F,	%l5
	movgu	%xcc,	%g6,	%g5
	sir	0x0655
loop_1733:
	edge8	%o2,	%l4,	%l0
	tvc	%xcc,	0x0
	fbu	%fcc0,	loop_1734
	nop
	fitos	%f2,	%f3
	fstoi	%f3,	%f0
	fxnors	%f25,	%f16,	%f19
	sra	%l2,	%o3,	%l6
loop_1734:
	bleu,a,pn	%icc,	loop_1735
	edge16ln	%i1,	%i5,	%o1
	andncc	%o7,	%i7,	%o6
	fnegd	%f10,	%f14
loop_1735:
	srax	%i0,	0x1A,	%o5
	edge8n	%g3,	%o4,	%i2
	stx	%i4,	[%l7 + 0x20]
	movn	%xcc,	%i3,	%l1
	bvc,pn	%xcc,	loop_1736
	sra	%g2,	0x06,	%g4
	std	%f4,	[%l7 + 0x28]
	tge	%xcc,	0x6
loop_1736:
	fnot1	%f26,	%f20
	bg,a,pn	%xcc,	loop_1737
	fmovrslez	%i6,	%f31,	%f15
	ldx	[%l7 + 0x20],	%l3
	fzeros	%f17
loop_1737:
	nop
	add	%l7,	0x28,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] %asi,	%g7,	%g1
	nop
	setx	0x79E56D9E,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f12
	fsqrts	%f12,	%f30
	tle	%icc,	0x4
	nop
	setx	0xBCF4BB2B,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f19
	setx	0xB2631096,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f19
	fmuls	%f19,	%f19,	%f30
	sllx	%l5,	%g6,	%o0
	alignaddr	%o2,	%g5,	%l4
	bl,a,pt	%icc,	loop_1738
	bcc,pt	%xcc,	loop_1739
	umul	%l2,	%l0,	%o3
	movg	%icc,	%l6,	%i5
loop_1738:
	movvc	%icc,	%i1,	%o7
loop_1739:
	tgu	%xcc,	0x3
	membar	0x77
	set	0x2C, %o3
	ldsha	[%l7 + %o3] 0x10,	%o1
	nop
	set	0x78, %o1
	lduw	[%l7 + %o1],	%i7
	popc	0x0CA3,	%o6
	fbge	%fcc0,	loop_1740
	tpos	%xcc,	0x6
	bneg,a,pn	%icc,	loop_1741
	addc	%i0,	0x0A82,	%o5
loop_1740:
	nop
	wr	%g0,	0x11,	%asi
	stba	%g3,	[%l7 + 0x5E] %asi
loop_1741:
	sir	0x036C
	smulcc	%i2,	0x1D1D,	%i4
	edge32ln	%o4,	%l1,	%i3
	fornot2s	%f17,	%f13,	%f14
	array16	%g4,	%i6,	%g2
	movvc	%icc,	%l3,	%g1
	srl	%l5,	0x18,	%g6
	popc	%g7,	%o0
	tvs	%xcc,	0x5
	fmovsvs	%xcc,	%f11,	%f1
	tleu	%icc,	0x1
	ta	%icc,	0x7
	brgez,a	%o2,	loop_1742
	tle	%xcc,	0x4
	movpos	%xcc,	%g5,	%l2
	andcc	%l0,	0x1F9C,	%o3
loop_1742:
	fbule	%fcc3,	loop_1743
	movrlez	%l4,	0x328,	%i5
	fmovsne	%icc,	%f19,	%f2
	fmovsgu	%icc,	%f12,	%f2
loop_1743:
	edge32l	%l6,	%i1,	%o1
	movrlz	%i7,	0x1E6,	%o6
	wr	%g0,	0x18,	%asi
	lduha	[%l7 + 0x2A] %asi,	%i0
	smulcc	%o5,	0x1436,	%o7
	tn	%icc,	0x3
	tge	%xcc,	0x4
	edge8ln	%g3,	%i4,	%i2
	fornot2	%f18,	%f28,	%f4
	fsrc2s	%f29,	%f10
	fors	%f4,	%f21,	%f19
	fmovrdlz	%l1,	%f0,	%f14
	bcs	%xcc,	loop_1744
	and	%o4,	%g4,	%i6
	move	%icc,	%i3,	%l3
	nop
	setx loop_1745, %l0, %l1
	jmpl %l1, %g2
loop_1744:
	fmovdl	%xcc,	%f21,	%f17
	ldsh	[%l7 + 0x54],	%l5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1745:
	fabsd	%f10,	%f30
	movne	%icc,	%g6,	%g1
	array16	%g7,	%o2,	%g5
	edge8l	%o0,	%l2,	%l0
	tpos	%icc,	0x6
	nop
	setx	loop_1746,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fbule,a	%fcc0,	loop_1747
	udiv	%l4,	0x0CAC,	%i5
	edge8n	%l6,	%i1,	%o3
loop_1746:
	fpackfix	%f2,	%f25
loop_1747:
	mova	%icc,	%o1,	%o6
	edge32ln	%i0,	%o5,	%i7
	bcs	loop_1748
	tneg	%xcc,	0x5
	nop
	fitos	%f3,	%f17
	fstox	%f17,	%f30
	fxtos	%f30,	%f29
	movre	%g3,	%i4,	%o7
loop_1748:
	brgez	%i2,	loop_1749
	fpack16	%f12,	%f8
	fpadd16	%f24,	%f24,	%f30
	bshuffle	%f28,	%f8,	%f20
loop_1749:
	fmuld8ulx16	%f19,	%f11,	%f16
	sdivx	%l1,	0x184F,	%g4
	subccc	%o4,	0x1B4D,	%i6
	fbge,a	%fcc0,	loop_1750
	xnorcc	%l3,	%g2,	%l5
	fmovdne	%icc,	%f8,	%f23
	movge	%icc,	%i3,	%g1
loop_1750:
	bvc,a	%xcc,	loop_1751
	faligndata	%f30,	%f0,	%f4
	fbge,a	%fcc1,	loop_1752
	movrne	%g6,	%g7,	%o2
loop_1751:
	srlx	%o0,	%g5,	%l2
	fpadd32	%f10,	%f12,	%f0
loop_1752:
	nop
	wr	%g0,	0x0c,	%asi
	ldsba	[%l7 + 0x2A] %asi,	%l4
	fmul8x16au	%f5,	%f12,	%f16
	fnors	%f7,	%f28,	%f19
	nop
	setx	0x0590E765A055A137,	%l0,	%l6
	stx	%l6,	[%l7 + 0x78]
	ldx	[%l7 + 0x78],	%fsr
	fbug,a	%fcc0,	loop_1753
	stbar
	ldsw	[%l7 + 0x78],	%i5
	sll	%l0,	0x1A,	%i1
loop_1753:
	movrlez	%o3,	0x1CA,	%l6
	tn	%icc,	0x5
	wr	%g0,	0x89,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	fnot2	%f10,	%f26
	tleu	%icc,	0x6
	fpadd32s	%f11,	%f11,	%f20
	movrgz	%o6,	0x047,	%o1
	edge16	%o5,	%i7,	%g3
	nop
	setx	loop_1754,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	stb	%i4,	[%l7 + 0x7E]
	sll	%i0,	0x1F,	%o7
	andncc	%i2,	%l1,	%o4
loop_1754:
	fmovrsgez	%i6,	%f18,	%f1
	subc	%l3,	0x0D8C,	%g4
	srlx	%g2,	0x0E,	%l5
	fbne	%fcc0,	loop_1755
	ldsh	[%l7 + 0x64],	%i3
	alignaddrl	%g1,	%g6,	%g7
	edge16ln	%o0,	%o2,	%g5
loop_1755:
	membar	0x32
	fsrc2	%f28,	%f8
	bcs,pt	%icc,	loop_1756
	edge8ln	%l4,	%i5,	%l0
	andn	%i1,	%o3,	%l2
	mova	%xcc,	%o6,	%o1
loop_1756:
	subccc	%o5,	0x1522,	%l6
	addccc	%g3,	0x087D,	%i7
	sdivcc	%i0,	0x08F4,	%o7
	movpos	%icc,	%i4,	%l1
	movg	%icc,	%i2,	%o4
	xor	%l3,	%g4,	%i6
	fnegs	%f7,	%f6
	fble,a	%fcc2,	loop_1757
	tvc	%icc,	0x5
	movvc	%xcc,	%l5,	%i3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1757:
	tpos	%icc,	0x7
	bne,a,pn	%xcc,	loop_1758
	orn	%g2,	%g1,	%g6
	nop
	fitos	%f6,	%f13
	fstox	%f13,	%f18
	tgu	%icc,	0x1
loop_1758:
	taddcctv	%g7,	0x00AD,	%o0
	fpadd32	%f30,	%f20,	%f14
	tle	%xcc,	0x0
	fmovdn	%xcc,	%f11,	%f20
	edge8n	%g5,	%l4,	%i5
	bl,a,pn	%icc,	loop_1759
	taddcctv	%o2,	%i1,	%l0
	popc	%o3,	%o6
	movvs	%icc,	%o1,	%o5
loop_1759:
	te	%xcc,	0x5
	sdivx	%l6,	0x1580,	%g3
	bl	%xcc,	loop_1760
	movge	%xcc,	%i7,	%l2
	flush	%l7 + 0x48
	orncc	%i0,	0x086E,	%o7
loop_1760:
	tge	%xcc,	0x2
	movl	%xcc,	%i4,	%l1
	bcs,a	%xcc,	loop_1761
	tvc	%icc,	0x2
	udiv	%o4,	0x05F0,	%l3
	fmovdcc	%icc,	%f23,	%f31
loop_1761:
	mulscc	%i2,	%g4,	%l5
	fpack16	%f20,	%f10
	nop
	set	0x71, %o0
	ldstub	[%l7 + %o0],	%i6
	xor	%i3,	%g1,	%g2
	wr	%g0,	0x88,	%asi
	ldda	[%l7 + 0x50] %asi,	%g6
	sra	%o0,	0x19,	%g6
	fzero	%f28
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	setx	0x2C477DB4EE301492,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0xF374F1C59320B489,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	fsubd	%f12,	%f0,	%f26
	ldsb	[%l7 + 0x77],	%g5
	tge	%icc,	0x6
	fmovdl	%icc,	%f8,	%f25
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32n	%i5,	%o2,	%i1
	movrlez	%l4,	%o3,	%o6
	xnor	%o1,	0x09EA,	%l0
	movgu	%xcc,	%l6,	%g3
	ldsb	[%l7 + 0x7E],	%i7
	sdivx	%l2,	0x0C89,	%o5
	fmovsgu	%icc,	%f18,	%f24
	fcmple16	%f12,	%f18,	%i0
	xorcc	%i4,	%o7,	%l1
	tcc	%xcc,	0x6
	wr	%g0,	0x88,	%asi
	lduha	[%l7 + 0x7C] %asi,	%o4
	ta	%xcc,	0x2
	fornot2	%f10,	%f24,	%f0
	mulx	%i2,	%g4,	%l3
	fmovrsgez	%i6,	%f20,	%f21
	fands	%f30,	%f16,	%f0
	bgu,a	%xcc,	loop_1762
	xorcc	%l5,	%g1,	%g2
	fmovdne	%xcc,	%f23,	%f29
	movle	%icc,	%g7,	%o0
loop_1762:
	fxnor	%f18,	%f26,	%f18
	fba,a	%fcc2,	loop_1763
	fmul8sux16	%f12,	%f18,	%f20
	addcc	%g6,	%i3,	%g5
	edge8l	%i5,	%i1,	%l4
loop_1763:
	tsubcc	%o2,	%o6,	%o1
	nop
	fitos	%f14,	%f29
	fstox	%f29,	%f14
	fxtos	%f14,	%f13
	edge16ln	%o3,	%l6,	%g3
	movrlez	%i7,	%l2,	%o5
	fmovrsgez	%i0,	%f11,	%f12
	fornot2	%f10,	%f22,	%f30
	call	loop_1764
	array32	%i4,	%l0,	%l1
	ldd	[%l7 + 0x08],	%f30
	fmovrdlz	%o4,	%f30,	%f24
loop_1764:
	bvs	loop_1765
	fmovda	%icc,	%f4,	%f15
	tn	%xcc,	0x0
	edge8	%o7,	%g4,	%l3
loop_1765:
	nop
	set	0x53, %g6
	ldstub	[%l7 + %g6],	%i2
	fpsub16s	%f31,	%f26,	%f26
	subc	%l5,	0x05C8,	%g1
	edge16ln	%g2,	%g7,	%o0
	membar	#Sync
	set	0x40, %i6
	ldda	[%l7 + %i6] 0x16,	%f0
	fandnot1s	%f14,	%f31,	%f7
	bcc	loop_1766
	fpack16	%f2,	%f25
	srlx	%g6,	%i3,	%i6
	sth	%i5,	[%l7 + 0x14]
loop_1766:
	nop
	add	%l7,	0x74,	%l6
	wr	%g0,	0x0c,	%asi
	casa	[%l6] 0x0c,	%i1,	%g5
	orn	%l4,	%o6,	%o2
	sll	%o3,	0x0E,	%l6
	fba,a	%fcc3,	loop_1767
	array8	%o1,	%i7,	%l2
	xorcc	%g3,	0x0680,	%i0
	tn	%icc,	0x4
loop_1767:
	edge8n	%o5,	%l0,	%l1
	xnorcc	%o4,	%i4,	%g4
	wr	%g0,	0x89,	%asi
	stwa	%l3,	[%l7 + 0x78] %asi
	mulscc	%o7,	0x09C0,	%l5
	orcc	%g1,	%g2,	%i2
	tneg	%icc,	0x0
	andn	%o0,	%g6,	%i3
	fbge	%fcc0,	loop_1768
	xnorcc	%i6,	%i5,	%i1
	fbo,a	%fcc3,	loop_1769
	brlz	%g5,	loop_1770
loop_1768:
	fbne	%fcc0,	loop_1771
	fbuge,a	%fcc3,	loop_1772
loop_1769:
	alignaddr	%l4,	%g7,	%o2
loop_1770:
	movne	%xcc,	%o3,	%o6
loop_1771:
	tsubcc	%l6,	0x1401,	%o1
loop_1772:
	addcc	%i7,	%g3,	%l2
	orcc	%i0,	%l0,	%o5
	sub	%l1,	%o4,	%i4
	membar	0x5F
	tvc	%xcc,	0x6
	taddcc	%l3,	0x1F1F,	%g4
	array8	%o7,	%l5,	%g1
	edge32n	%g2,	%o0,	%g6
	movl	%icc,	%i2,	%i6
	fmovde	%xcc,	%f17,	%f8
	fmovdvs	%xcc,	%f24,	%f20
	fmovs	%f0,	%f6
	ldstub	[%l7 + 0x3B],	%i3
	edge32	%i5,	%i1,	%g5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sll	%g7,	%o2,	%l4
	movge	%icc,	%o3,	%l6
	lduw	[%l7 + 0x54],	%o6
	movne	%xcc,	%i7,	%o1
	fcmpgt16	%f30,	%f22,	%g3
	bcs,pt	%icc,	loop_1773
	sdivx	%l2,	0x10A7,	%i0
	fmovse	%xcc,	%f7,	%f30
	fcmpgt32	%f24,	%f24,	%l0
loop_1773:
	nop
	setx	0x204618B1,	%l0,	%l6
	st	%l6,	[%l7 + 0x7C]
	ld	[%l7 + 0x7C],	%fsr
	sir	0x151F
	edge8ln	%o5,	%o4,	%l1
	membar	0x75
	tcc	%icc,	0x3
	umulcc	%l3,	%i4,	%g4
	tle	%xcc,	0x0
	ld	[%l7 + 0x48],	%f4
	or	%l5,	%g1,	%o7
	bne,pn	%icc,	loop_1774
	fmovdcc	%icc,	%f19,	%f4
	fornot2s	%f16,	%f19,	%f21
	sir	0x0916
loop_1774:
	brlez,a	%o0,	loop_1775
	nop
	setx	loop_1776,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	subccc	%g2,	0x169C,	%g6
	fmovspos	%icc,	%f25,	%f5
loop_1775:
	brgez,a	%i2,	loop_1777
loop_1776:
	tg	%icc,	0x1
	addc	%i6,	%i5,	%i1
	movrlz	%g5,	0x13B,	%g7
loop_1777:
	fbule	%fcc3,	loop_1778
	movn	%xcc,	%o2,	%l4
	fmovrdlez	%o3,	%f22,	%f24
	srl	%l6,	%i3,	%i7
loop_1778:
	edge8ln	%o1,	%o6,	%g3
	sub	%l2,	%l0,	%i0
	bgu,pt	%xcc,	loop_1779
	tgu	%icc,	0x0
	nop
	setx	loop_1780,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	sdivx	%o5,	0x017B,	%o4
loop_1779:
	nop
	wr	%g0,	0x2a,	%asi
	stha	%l1,	[%l7 + 0x2E] %asi
	membar	#Sync
loop_1780:
	nop
	membar	#Sync
	set	0x40, %l2
	ldda	[%l7 + %l2] 0x17,	%f0
	alignaddr	%i4,	%g4,	%l3
	taddcctv	%l5,	%g1,	%o0
	alignaddr	%o7,	%g6,	%g2
	fmovrdlz	%i6,	%f0,	%f26
	stb	%i2,	[%l7 + 0x0F]
	tle	%icc,	0x0
	sllx	%i5,	0x12,	%g5
	fmul8x16al	%f3,	%f30,	%f16
	movneg	%xcc,	%i1,	%o2
	stbar
	movrne	%g7,	0x15D,	%l4
	nop
	setx	loop_1781,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	andn	%l6,	%i3,	%i7
	tgu	%xcc,	0x5
	tcs	%xcc,	0x3
loop_1781:
	tleu	%xcc,	0x1
	tne	%icc,	0x4
	srl	%o3,	%o1,	%g3
	edge32n	%l2,	%l0,	%o6
	movgu	%xcc,	%i0,	%o4
	mulx	%l1,	0x057F,	%i4
	tneg	%icc,	0x4
	movge	%icc,	%o5,	%l3
	bg,pn	%icc,	loop_1782
	mova	%xcc,	%l5,	%g4
	sdivcc	%o0,	0x003C,	%o7
	fmovdl	%xcc,	%f0,	%f4
loop_1782:
	taddcc	%g6,	%g2,	%i6
	set	0x24, %i4
	ldswa	[%l7 + %i4] 0x10,	%g1
	fzero	%f14
	mova	%icc,	%i2,	%i5
	andn	%i1,	%o2,	%g5
	sdiv	%g7,	0x1C6B,	%l6
	fmovdn	%icc,	%f5,	%f0
	fbu,a	%fcc1,	loop_1783
	udiv	%i3,	0x0FC4,	%l4
	membar	0x4A
	membar	0x70
loop_1783:
	move	%icc,	%o3,	%o1
	prefetch	[%l7 + 0x30],	 0x1
	movrlz	%g3,	0x290,	%i7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrne	%l2,	0x1D3,	%o6
	movne	%xcc,	%i0,	%l0
	fnot2	%f0,	%f0
	movn	%xcc,	%o4,	%l1
	movge	%xcc,	%i4,	%o5
	tpos	%xcc,	0x5
	bne,pn	%xcc,	loop_1784
	alignaddrl	%l3,	%l5,	%o0
	membar	0x39
	movneg	%xcc,	%o7,	%g6
loop_1784:
	fmovdcc	%icc,	%f4,	%f25
	sdivx	%g4,	0x0A00,	%i6
	edge16l	%g1,	%g2,	%i5
	andncc	%i1,	%o2,	%g5
	orn	%g7,	0x0CA5,	%i2
	wr	%g0,	0x88,	%asi
	sta	%f1,	[%l7 + 0x34] %asi
	movrlz	%i3,	%l6,	%l4
	set	0x74, %g1
	ldsba	[%l7 + %g1] 0x04,	%o1
	wr	%g0,	0x19,	%asi
	ldswa	[%l7 + 0x0C] %asi,	%o3
	taddcctv	%i7,	0x1A92,	%g3
	andn	%l2,	%o6,	%l0
	fpsub32s	%f11,	%f31,	%f28
	fmovse	%icc,	%f9,	%f5
	fones	%f25
	wr	%g0,	0x19,	%asi
	lduwa	[%l7 + 0x0C] %asi,	%i0
	ldsb	[%l7 + 0x0C],	%o4
	addcc	%l1,	%o5,	%i4
	movre	%l3,	0x37D,	%l5
	sdivcc	%o7,	0x05AB,	%o0
	mulx	%g6,	%i6,	%g4
	fbue,a	%fcc0,	loop_1785
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stw	%g2,	[%l7 + 0x08]
	movgu	%icc,	%g1,	%i1
loop_1785:
	smul	%o2,	%g5,	%i5
	sub	%i2,	%i3,	%l6
	fandnot1s	%f31,	%f25,	%f10
	fbe	%fcc0,	loop_1786
	ldstub	[%l7 + 0x60],	%g7
	fble,a	%fcc1,	loop_1787
	fbuge	%fcc2,	loop_1788
loop_1786:
	bne,pt	%xcc,	loop_1789
	tvc	%icc,	0x2
loop_1787:
	tle	%icc,	0x5
loop_1788:
	edge8l	%l4,	%o3,	%i7
loop_1789:
	fbul,a	%fcc1,	loop_1790
	subccc	%o1,	%l2,	%g3
	xnorcc	%o6,	0x1A0F,	%l0
	movrgz	%o4,	0x10C,	%i0
loop_1790:
	bneg,a,pt	%icc,	loop_1791
	sth	%l1,	[%l7 + 0x4A]
	edge16n	%o5,	%l3,	%i4
	fbo	%fcc2,	loop_1792
loop_1791:
	fornot1	%f22,	%f10,	%f20
	tpos	%xcc,	0x4
	call	loop_1793
loop_1792:
	fbe	%fcc1,	loop_1794
	xnorcc	%l5,	0x03DD,	%o7
	add	%l7,	0x34,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%g6
	casa	[%l6] %asi,	%g6,	%i6
loop_1793:
	call	loop_1795
loop_1794:
	fnand	%f26,	%f12,	%f14
	subccc	%g4,	%g2,	%g1
	fone	%f30
loop_1795:
	brgez,a	%o0,	loop_1796
	brnz,a	%o2,	loop_1797
	fnegs	%f5,	%f8
	edge16l	%i1,	%i5,	%i2
loop_1796:
	nop
	setx	loop_1798,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_1797:
	fble	%fcc2,	loop_1799
	edge32ln	%i3,	%g5,	%g7
	movg	%xcc,	%l6,	%l4
loop_1798:
	brz	%i7,	loop_1800
loop_1799:
	sllx	%o3,	0x02,	%o1
	ld	[%l7 + 0x70],	%f8
	edge16ln	%l2,	%g3,	%l0
loop_1800:
	movvc	%xcc,	%o4,	%o6
	tge	%icc,	0x5
	xnor	%l1,	0x1165,	%o5
	move	%xcc,	%i0,	%i4
	bgu,a	loop_1801
	lduw	[%l7 + 0x28],	%l5
	udivcc	%o7,	0x13BF,	%l3
	subcc	%g6,	0x10CE,	%i6
loop_1801:
	ldsw	[%l7 + 0x78],	%g2
	movrlez	%g1,	%g4,	%o0
	xorcc	%o2,	%i5,	%i1
	set	0x50, %g2
	ldda	[%l7 + %g2] 0x2b,	%i2
	movvs	%xcc,	%i2,	%g5
	tl	%icc,	0x6
	sdivx	%l6,	0x1B6C,	%g7
	fandnot1	%f30,	%f10,	%f2
	fnegs	%f15,	%f5
	tn	%icc,	0x1
	mova	%icc,	%i7,	%l4
	edge16ln	%o3,	%l2,	%o1
	movleu	%icc,	%l0,	%o4
	tl	%xcc,	0x3
	brlz,a	%g3,	loop_1802
	nop
	setx	0xACA5F80151CB68F1,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0xD30D81BB2E9E754F,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fdivd	%f0,	%f22,	%f12
	edge32	%o6,	%l1,	%o5
	fnot1s	%f22,	%f16
loop_1802:
	fsrc1	%f16,	%f26
	umul	%i4,	0x1B62,	%l5
	ldd	[%l7 + 0x70],	%f8
	edge32l	%i0,	%o7,	%g6
	fbul,a	%fcc1,	loop_1803
	orncc	%i6,	0x0816,	%l3
	tsubcctv	%g2,	%g4,	%g1
	nop
	setx	0xB0706BA0,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f10
	fsqrts	%f10,	%f25
loop_1803:
	subcc	%o0,	%i5,	%i1
	tcs	%xcc,	0x7
	andn	%i3,	%o2,	%i2
	and	%g5,	0x14A8,	%l6
	movne	%icc,	%g7,	%l4
	umul	%i7,	0x1FB5,	%l2
	fblg	%fcc1,	loop_1804
	addccc	%o1,	0x0490,	%o3
	andcc	%o4,	0x19BA,	%g3
	ble,a,pt	%icc,	loop_1805
loop_1804:
	bvc,a	%xcc,	loop_1806
	sra	%o6,	0x0A,	%l1
	fmul8x16au	%f10,	%f2,	%f2
loop_1805:
	fmovsvs	%xcc,	%f24,	%f12
loop_1806:
	fbue,a	%fcc3,	loop_1807
	mulx	%o5,	0x116B,	%i4
	fsrc1s	%f16,	%f30
	edge8ln	%l0,	%l5,	%o7
loop_1807:
	bvs,pt	%icc,	loop_1808
	umul	%g6,	0x1917,	%i6
	mulscc	%l3,	%i0,	%g4
	popc	0x1A0F,	%g2
loop_1808:
	call	loop_1809
	bcs,a,pn	%icc,	loop_1810
	mulx	%g1,	%i5,	%o0
	fmovdvc	%xcc,	%f20,	%f12
loop_1809:
	fxnors	%f1,	%f22,	%f29
loop_1810:
	movcs	%icc,	%i3,	%i1
	stw	%i2,	[%l7 + 0x64]
	ldstub	[%l7 + 0x47],	%o2
	sir	0x00BC
	edge16n	%l6,	%g7,	%l4
	fba	%fcc3,	loop_1811
	udivx	%g5,	0x15CB,	%i7
	movn	%xcc,	%l2,	%o3
	for	%f10,	%f28,	%f2
loop_1811:
	lduw	[%l7 + 0x28],	%o1
	add	%o4,	%g3,	%o6
	edge16ln	%o5,	%l1,	%i4
	sdiv	%l5,	0x13AB,	%l0
	movrgz	%o7,	0x29B,	%i6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sub	%l3,	0x1E35,	%i0
	fmovda	%xcc,	%f4,	%f10
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movcc	%xcc,	%g4,	%g2
	subc	%g6,	%i5,	%o0
	fmul8x16	%f29,	%f28,	%f12
	edge16ln	%i3,	%i1,	%i2
	movrgz	%o2,	%g1,	%g7
	fmovdle	%xcc,	%f3,	%f16
	swap	[%l7 + 0x14],	%l4
	wr	%g0,	0x81,	%asi
	ldstuba	[%l7 + 0x25] %asi,	%g5
	tleu	%icc,	0x4
	movne	%icc,	%i7,	%l6
	movneg	%xcc,	%l2,	%o3
	edge32ln	%o4,	%g3,	%o6
	nop
	setx	loop_1812,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	bne,pn	%xcc,	loop_1813
	sth	%o5,	[%l7 + 0x18]
	fpmerge	%f15,	%f21,	%f4
loop_1812:
	brlz,a	%o1,	loop_1814
loop_1813:
	tsubcctv	%i4,	%l5,	%l0
	xnorcc	%l1,	0x0A0A,	%i6
	bleu,a	loop_1815
loop_1814:
	lduw	[%l7 + 0x30],	%l3
	sir	0x0FAF
	fbne,a	%fcc3,	loop_1816
loop_1815:
	sir	0x1FBF
	sub	%o7,	0x0F7C,	%g4
	addccc	%i0,	0x0F32,	%g2
loop_1816:
	subccc	%g6,	%i5,	%o0
	fmovsneg	%xcc,	%f10,	%f0
	fmovdge	%xcc,	%f30,	%f21
	membar	0x7A
	xnorcc	%i3,	0x0E9F,	%i2
	fnors	%f20,	%f29,	%f15
	addccc	%o2,	%i1,	%g1
	edge32n	%l4,	%g7,	%i7
	movleu	%xcc,	%l6,	%l2
	and	%g5,	0x1D50,	%o4
	nop
	fitos	%f14,	%f17
	fstod	%f17,	%f0
	orn	%o3,	%o6,	%g3
	bn,pt	%xcc,	loop_1817
	movle	%icc,	%o1,	%o5
	fbne	%fcc3,	loop_1818
	ldsw	[%l7 + 0x64],	%i4
loop_1817:
	smulcc	%l0,	0x1B1B,	%l1
	fzero	%f4
loop_1818:
	add	%l5,	0x0D3F,	%l3
	udivcc	%o7,	0x002F,	%g4
	tneg	%xcc,	0x1
	fmuld8sux16	%f30,	%f6,	%f2
	movg	%icc,	%i6,	%g2
	fmovda	%xcc,	%f9,	%f19
	fbuge,a	%fcc1,	loop_1819
	fabss	%f15,	%f16
	edge16n	%i0,	%i5,	%g6
	std	%f8,	[%l7 + 0x40]
loop_1819:
	mova	%xcc,	%i3,	%o0
	tsubcc	%o2,	%i1,	%i2
	fabss	%f12,	%f0
	fnot2s	%f4,	%f7
	xorcc	%l4,	%g1,	%i7
	movg	%icc,	%l6,	%l2
	set	0x52, %l5
	lduha	[%l7 + %l5] 0x0c,	%g7
	fmovs	%f20,	%f10
	tpos	%xcc,	0x7
	nop
	setx	0xD45D1196,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f10
	fsqrts	%f10,	%f30
	fmovdvs	%xcc,	%f12,	%f23
	fcmpeq32	%f6,	%f2,	%g5
	movrgz	%o3,	0x040,	%o4
	tvs	%icc,	0x0
	tne	%icc,	0x1
	fbue,a	%fcc0,	loop_1820
	brlez,a	%o6,	loop_1821
	movneg	%xcc,	%o1,	%g3
	alignaddrl	%o5,	%i4,	%l0
loop_1820:
	fmovdge	%icc,	%f28,	%f7
loop_1821:
	ldd	[%l7 + 0x28],	%l0
	wr	%g0,	0x23,	%asi
	stxa	%l5,	[%l7 + 0x50] %asi
	membar	#Sync
	fmovdgu	%icc,	%f21,	%f28
	flush	%l7 + 0x20
	movpos	%icc,	%o7,	%l3
	tneg	%icc,	0x3
	set	0x12, %i3
	lduha	[%l7 + %i3] 0x10,	%g4
	tg	%icc,	0x0
	and	%g2,	0x1E3A,	%i6
	fmovscc	%xcc,	%f31,	%f30
	array8	%i0,	%i5,	%g6
	movg	%icc,	%o0,	%o2
	udivcc	%i3,	0x10A5,	%i2
	movl	%xcc,	%l4,	%g1
	nop
	set	0x40, %l6
	ldsw	[%l7 + %l6],	%i1
	brlez,a	%i7,	loop_1822
	tge	%xcc,	0x5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrlez	%l2,	%l6,	%g7
loop_1822:
	sub	%o3,	0x0604,	%o4
	fmovdpos	%xcc,	%f3,	%f8
	tvc	%xcc,	0x5
	tne	%xcc,	0x1
	fbl	%fcc0,	loop_1823
	nop
	fitod	%f0,	%f16
	fdtox	%f16,	%f16
	fxtod	%f16,	%f24
	fmovdle	%icc,	%f5,	%f4
	movrlz	%g5,	%o6,	%g3
loop_1823:
	bleu	loop_1824
	movre	%o1,	0x0FF,	%o5
	smulcc	%i4,	0x128F,	%l1
	bcc,a	%xcc,	loop_1825
loop_1824:
	fsrc2s	%f0,	%f8
	fmovsa	%icc,	%f13,	%f20
	movcs	%xcc,	%l0,	%l5
loop_1825:
	sra	%o7,	%g4,	%l3
	fpadd32	%f18,	%f2,	%f24
	set	0x30, %g5
	ldda	[%l7 + %g5] 0x2a,	%i6
	tg	%icc,	0x5
	te	%icc,	0x0
	fmovsvc	%xcc,	%f11,	%f17
	fmovrse	%g2,	%f17,	%f7
	lduh	[%l7 + 0x60],	%i0
	xnor	%g6,	0x1DF5,	%o0
	edge32n	%o2,	%i3,	%i5
	edge16n	%i2,	%g1,	%i1
	set	0x1E, %o4
	stha	%i7,	[%l7 + %o4] 0x0c
	mulx	%l2,	%l4,	%l6
	taddcc	%o3,	0x0E76,	%g7
	movpos	%xcc,	%g5,	%o4
	fmul8sux16	%f14,	%f22,	%f4
	sdivcc	%g3,	0x0003,	%o1
	edge8n	%o6,	%o5,	%i4
	std	%f4,	[%l7 + 0x38]
	fmovrdgz	%l0,	%f2,	%f22
	fmovsa	%icc,	%f14,	%f28
	fmovrdgz	%l1,	%f6,	%f20
	fmovsge	%icc,	%f0,	%f28
	tneg	%icc,	0x1
	sir	0x1E23
	movle	%xcc,	%l5,	%g4
	wr	%g0,	0x88,	%asi
	lduba	[%l7 + 0x43] %asi,	%l3
	tcc	%icc,	0x1
	swap	[%l7 + 0x44],	%i6
	smulcc	%o7,	0x0559,	%i0
	smul	%g2,	%g6,	%o2
	bl	loop_1826
	xnorcc	%o0,	0x09BD,	%i5
	fmovsgu	%icc,	%f10,	%f6
	movcc	%xcc,	%i2,	%g1
loop_1826:
	movvs	%xcc,	%i3,	%i7
	fpsub32s	%f0,	%f31,	%f3
	edge16n	%l2,	%l4,	%l6
	fmovdcc	%xcc,	%f10,	%f18
	array8	%i1,	%g7,	%o3
	nop
	setx	0x63C45C5F904FDB0D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldx	[%l7 + 0x28],	%fsr
	prefetch	[%l7 + 0x10],	 0x3
	bl,a	loop_1827
	fmovscs	%icc,	%f4,	%f14
	fmul8x16	%f10,	%f0,	%f6
	smul	%o4,	%g3,	%g5
loop_1827:
	movneg	%xcc,	%o6,	%o5
	edge8l	%i4,	%l0,	%o1
	edge16n	%l1,	%l5,	%g4
	movl	%xcc,	%l3,	%o7
	tl	%xcc,	0x6
	movrlez	%i6,	%i0,	%g6
	fmovs	%f20,	%f27
	nop
	fitos	%f0,	%f7
	fstox	%f7,	%f0
	movne	%icc,	%g2,	%o2
	tvc	%icc,	0x3
	xnorcc	%o0,	%i5,	%g1
	movg	%xcc,	%i2,	%i3
	umulcc	%l2,	0x1A98,	%i7
	edge16n	%l4,	%i1,	%l6
	wr	%g0,	0x10,	%asi
	sta	%f4,	[%l7 + 0x50] %asi
	nop
	setx	0x46293B9B,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f26
	fsqrts	%f26,	%f23
	sethi	0x0BAE,	%o3
	orncc	%o4,	0x00F5,	%g7
	fmul8x16au	%f20,	%f2,	%f16
	sdiv	%g5,	0x147B,	%o6
	subcc	%o5,	0x1C1A,	%i4
	movn	%icc,	%g3,	%o1
	call	loop_1828
	fxor	%f20,	%f20,	%f18
	tneg	%icc,	0x2
	movre	%l1,	%l0,	%g4
loop_1828:
	fnot2	%f16,	%f20
	tge	%icc,	0x6
	bvc,a,pt	%xcc,	loop_1829
	fmovrslez	%l5,	%f2,	%f16
	fmovdneg	%xcc,	%f27,	%f25
	movvs	%xcc,	%l3,	%i6
loop_1829:
	nop
	fitos	%f28,	%f6
	sll	%i0,	0x07,	%g6
	xorcc	%o7,	0x0A01,	%g2
	fmovrsgez	%o2,	%f30,	%f26
	xorcc	%o0,	%g1,	%i5
	fors	%f1,	%f3,	%f23
	fmovscc	%icc,	%f4,	%f25
	edge16ln	%i3,	%i2,	%i7
	ldd	[%l7 + 0x68],	%l2
	tcc	%icc,	0x1
	addcc	%i1,	0x179D,	%l4
	movvc	%xcc,	%l6,	%o3
	fcmpeq32	%f2,	%f16,	%o4
	addcc	%g5,	0x0A22,	%o6
	movrlz	%o5,	0x284,	%i4
	fnegd	%f0,	%f22
	tvc	%xcc,	0x3
	fmovrde	%g7,	%f28,	%f28
	smul	%g3,	%o1,	%l1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdivx	%g4,	0x0EED,	%l0
	fmovdvc	%xcc,	%f14,	%f1
	edge8l	%l5,	%i6,	%i0
	ldsh	[%l7 + 0x22],	%g6
	edge16ln	%l3,	%g2,	%o7
	ta	%xcc,	0x1
	add	%l7,	0x40,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%o0,	%o2
	fmovspos	%xcc,	%f11,	%f7
	movcs	%xcc,	%g1,	%i5
	fba	%fcc3,	loop_1830
	bgu,pt	%icc,	loop_1831
	xorcc	%i2,	%i7,	%l2
	movrgz	%i3,	0x214,	%i1
loop_1830:
	sethi	0x19AC,	%l4
loop_1831:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	setx	0x7E24B46D,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f16
	setx	0xF4EF3019,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f24
	fmuls	%f24,	%f16,	%f13
	smul	%o3,	%o4,	%l6
	fmovsa	%icc,	%f0,	%f16
	fmovrsgez	%o6,	%f8,	%f11
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udiv	%g5,	0x0BF5,	%o5
	fbuge,a	%fcc2,	loop_1832
	stb	%g7,	[%l7 + 0x2F]
	tg	%icc,	0x1
	popc	%i4,	%o1
loop_1832:
	subcc	%l1,	0x0655,	%g3
	fbg	%fcc2,	loop_1833
	edge32l	%l0,	%l5,	%g4
	alignaddrl	%i0,	%i6,	%l3
	tg	%xcc,	0x3
loop_1833:
	xnorcc	%g6,	0x10D3,	%o7
	set	0x30, %i5
	sta	%f6,	[%l7 + %i5] 0x89
	wr	%g0,	0x88,	%asi
	lduha	[%l7 + 0x12] %asi,	%g2
	set	0x12, %l0
	lduba	[%l7 + %l0] 0x10,	%o2
	move	%xcc,	%o0,	%g1
	srax	%i5,	0x01,	%i7
	edge32n	%i2,	%l2,	%i1
	fpsub16s	%f26,	%f31,	%f24
	move	%icc,	%i3,	%o3
	xor	%l4,	0x0F31,	%l6
	mulx	%o4,	0x149B,	%o6
	sdivx	%g5,	0x1F8D,	%g7
	addccc	%i4,	%o5,	%o1
	edge32	%g3,	%l1,	%l5
	fcmpgt16	%f4,	%f14,	%l0
	fxors	%f22,	%f30,	%f10
	edge16l	%i0,	%i6,	%g4
	bcs,a,pt	%xcc,	loop_1834
	movrne	%l3,	0x24F,	%g6
	sdiv	%o7,	0x0410,	%g2
	set	0x10, %l3
	ldda	[%l7 + %l3] 0x23,	%o2
loop_1834:
	nop
	setx	0x8059CACB,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%fsr
	edge16ln	%o0,	%g1,	%i5
	fpsub16s	%f24,	%f19,	%f16
	fmovrdlez	%i2,	%f18,	%f22
	tvc	%icc,	0x7
	bleu	loop_1835
	edge16l	%l2,	%i7,	%i3
	bg,a	loop_1836
	movvc	%icc,	%o3,	%l4
loop_1835:
	lduw	[%l7 + 0x10],	%i1
	movne	%xcc,	%l6,	%o4
loop_1836:
	movpos	%xcc,	%g5,	%o6
	fbg	%fcc0,	loop_1837
	bne,a,pt	%xcc,	loop_1838
	fsrc1	%f26,	%f20
	wr	%g0,	0x19,	%asi
	ldstuba	[%l7 + 0x1F] %asi,	%g7
loop_1837:
	smulcc	%i4,	0x102E,	%o1
loop_1838:
	ba,a,pn	%xcc,	loop_1839
	call	loop_1840
	movneg	%icc,	%o5,	%g3
	sdivcc	%l5,	0x1430,	%l0
loop_1839:
	fmovscs	%xcc,	%f11,	%f6
loop_1840:
	bcc,a,pn	%icc,	loop_1841
	fandnot2s	%f10,	%f1,	%f12
	movrlez	%i0,	0x235,	%i6
	fba	%fcc2,	loop_1842
loop_1841:
	sir	0x05FA
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movgu	%xcc,	%g4,	%l3
loop_1842:
	nop
	setx	0x5C99F45180555CB3,	%l0,	%l6
	stx	%l6,	[%l7 + 0x60]
	ldx	[%l7 + 0x60],	%fsr
	xnorcc	%g6,	%o7,	%g2
	andcc	%l1,	%o0,	%o2
	lduw	[%l7 + 0x78],	%g1
	stbar
	fmovrsgez	%i5,	%f20,	%f24
	xorcc	%i2,	0x1061,	%l2
	fone	%f16
	swap	[%l7 + 0x48],	%i3
	fcmpeq16	%f2,	%f4,	%o3
	edge8ln	%i7,	%l4,	%i1
	add	%l7,	0x50,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%o4
	casa	[%l6] %asi,	%o4,	%g5
	fpackfix	%f10,	%f24
	smul	%l6,	%o6,	%g7
	mova	%xcc,	%i4,	%o5
	nop
	setx	0x5CFC1F304766A3AC,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	setx	0x152E25EC89BE58B9,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	fmuld	%f18,	%f18,	%f0
	tn	%xcc,	0x4
	smulcc	%g3,	0x0788,	%l5
	sdivx	%o1,	0x0E06,	%l0
	sll	%i0,	0x0A,	%i6
	brnz	%l3,	loop_1843
	fba	%fcc2,	loop_1844
	fmovrdne	%g6,	%f28,	%f4
	ta	%icc,	0x7
loop_1843:
	tle	%xcc,	0x7
loop_1844:
	ta	%xcc,	0x2
	edge8ln	%o7,	%g2,	%g4
	tvc	%icc,	0x1
	fmovsleu	%icc,	%f23,	%f15
	fmovrde	%o0,	%f22,	%f22
	wr	%g0,	0x2b,	%asi
	stxa	%o2,	[%l7 + 0x78] %asi
	membar	#Sync
	bneg,pt	%xcc,	loop_1845
	tn	%xcc,	0x7
	edge32n	%g1,	%l1,	%i5
	fxors	%f30,	%f28,	%f30
loop_1845:
	fbn,a	%fcc2,	loop_1846
	tvc	%xcc,	0x6
	edge32ln	%i2,	%i3,	%l2
	fors	%f29,	%f13,	%f21
loop_1846:
	mulscc	%i7,	0x1377,	%o3
	sir	0x081E
	srax	%i1,	%o4,	%l4
	call	loop_1847
	nop
	fitos	%f11,	%f23
	fstox	%f23,	%f4
	subc	%l6,	%o6,	%g7
	edge32	%g5,	%i4,	%g3
loop_1847:
	movgu	%xcc,	%o5,	%o1
	movne	%xcc,	%l5,	%i0
	fcmple32	%f12,	%f28,	%l0
	fornot1	%f10,	%f16,	%f24
	tl	%xcc,	0x0
	nop
	fitod	%f3,	%f8
	movgu	%xcc,	%i6,	%g6
	fmul8x16	%f5,	%f8,	%f12
	array16	%l3,	%o7,	%g2
	movn	%icc,	%g4,	%o0
	fbue,a	%fcc2,	loop_1848
	fblg	%fcc3,	loop_1849
	sethi	0x0B72,	%g1
	umulcc	%o2,	0x1FF0,	%i5
loop_1848:
	movrgez	%l1,	0x183,	%i3
loop_1849:
	mova	%xcc,	%l2,	%i2
	ldsh	[%l7 + 0x18],	%o3
	edge32n	%i1,	%o4,	%l4
	movvc	%icc,	%i7,	%o6
	edge8n	%g7,	%g5,	%l6
	tsubcc	%i4,	0x065B,	%o5
	brnz	%o1,	loop_1850
	udivcc	%l5,	0x0727,	%i0
	fmovdle	%icc,	%f9,	%f2
	addc	%g3,	0x162C,	%i6
loop_1850:
	nop
	setx	0xDC19A543,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f6
	setx	0x2AC1FCAA,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f19
	fadds	%f19,	%f6,	%f3
	tl	%xcc,	0x6
	fmovdn	%xcc,	%f12,	%f21
	tcc	%icc,	0x2
	tne	%xcc,	0x2
	movgu	%icc,	%l0,	%g6
	movpos	%xcc,	%o7,	%l3
	mulscc	%g4,	%o0,	%g1
	fnegs	%f9,	%f17
	movvc	%icc,	%o2,	%i5
	bvc,a,pt	%icc,	loop_1851
	umulcc	%g2,	0x09BF,	%i3
	nop
	setx	0xC06BBB70,	%l0,	%l6
	st	%l6,	[%l7 + 0x34]
	ld	[%l7 + 0x34],	%fsr
	bn,pt	%icc,	loop_1852
loop_1851:
	tcc	%icc,	0x4
	sllx	%l1,	%l2,	%i2
	fmovdvc	%icc,	%f26,	%f30
loop_1852:
	nop
	fitos	%f6,	%f17
	fstox	%f17,	%f26
	fxtos	%f26,	%f8
	movvs	%icc,	%o3,	%i1
	add	%l4,	%o4,	%o6
	movgu	%xcc,	%g7,	%i7
	wr	%g0,	0x80,	%asi
	ldstuba	[%l7 + 0x67] %asi,	%g5
	bleu	%xcc,	loop_1853
	movge	%xcc,	%l6,	%i4
	add	%o5,	0x0FC7,	%o1
	ble	loop_1854
loop_1853:
	fsrc2s	%f12,	%f22
	array8	%i0,	%g3,	%l5
	bne,a,pn	%xcc,	loop_1855
loop_1854:
	fbne	%fcc0,	loop_1856
	movl	%icc,	%l0,	%i6
	movleu	%xcc,	%o7,	%l3
loop_1855:
	edge16ln	%g6,	%o0,	%g4
loop_1856:
	edge8ln	%g1,	%i5,	%o2
	ldx	[%l7 + 0x20],	%g2
	movvs	%xcc,	%l1,	%l2
	udiv	%i2,	0x12DB,	%o3
	sir	0x1982
	movre	%i3,	0x369,	%l4
	movpos	%icc,	%o4,	%i1
	tvs	%xcc,	0x6
	movvc	%xcc,	%g7,	%i7
	set	0x34, %o2
	lduwa	[%l7 + %o2] 0x81,	%g5
	orcc	%o6,	0x1EF7,	%i4
	alignaddr	%l6,	%o1,	%i0
	sdivcc	%o5,	0x14C1,	%g3
	bl	%icc,	loop_1857
	fmovrdlez	%l5,	%f14,	%f4
	sir	0x1D14
	fmovrdne	%l0,	%f26,	%f8
loop_1857:
	array16	%i6,	%o7,	%l3
	stx	%g6,	[%l7 + 0x70]
	tg	%xcc,	0x7
	udivx	%g4,	0x0095,	%o0
	fmuld8sux16	%f24,	%f24,	%f12
	fands	%f18,	%f4,	%f2
	nop
	fitos	%f5,	%f16
	fstod	%f16,	%f8
	std	%f10,	[%l7 + 0x78]
	udivcc	%i5,	0x15D6,	%g1
	andcc	%g2,	0x018C,	%o2
	nop
	fitod	%f2,	%f20
	edge16	%l1,	%i2,	%o3
	fornot2s	%f5,	%f2,	%f14
	nop
	setx	0x83D02A98EEDCB7DF,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0x5EA587DB2B952A2D,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	fmuld	%f2,	%f26,	%f30
	fmovspos	%icc,	%f3,	%f10
	sir	0x0726
	tle	%xcc,	0x0
	addc	%l2,	%i3,	%l4
	tg	%xcc,	0x0
	udiv	%o4,	0x08E1,	%i1
	fble,a	%fcc1,	loop_1858
	sllx	%g7,	0x11,	%g5
	movneg	%xcc,	%o6,	%i7
	edge32l	%l6,	%o1,	%i0
loop_1858:
	nop
	wr	%g0,	0x81,	%asi
	lduwa	[%l7 + 0x78] %asi,	%i4
	xnorcc	%g3,	0x1E5B,	%o5
	subcc	%l0,	%i6,	%l5
	udivcc	%o7,	0x1462,	%l3
	brnz,a	%g4,	loop_1859
	fmovse	%xcc,	%f4,	%f18
	xor	%o0,	%g6,	%g1
	popc	%i5,	%o2
loop_1859:
	udivcc	%l1,	0x02AA,	%i2
	subcc	%g2,	%l2,	%o3
	bn	%xcc,	loop_1860
	tvc	%icc,	0x1
	ldstub	[%l7 + 0x45],	%l4
	bshuffle	%f8,	%f28,	%f16
loop_1860:
	nop
	fitod	%f2,	%f0
	edge8	%o4,	%i1,	%g7
	add	%g5,	%o6,	%i3
	fmovscs	%icc,	%f14,	%f26
	or	%l6,	0x15C3,	%i7
	fmovsgu	%icc,	%f20,	%f17
	edge16l	%o1,	%i0,	%i4
	sllx	%g3,	%o5,	%i6
	addcc	%l0,	%l5,	%l3
	movneg	%xcc,	%o7,	%o0
	fnor	%f22,	%f2,	%f16
	and	%g4,	0x1345,	%g1
	wr	%g0,	0x04,	%asi
	lduha	[%l7 + 0x30] %asi,	%i5
	add	%l7,	0x48,	%l6
	wr	%g0,	0x19,	%asi
	casxa	[%l6] %asi,	%o2,	%g6
	tcs	%icc,	0x0
	taddcctv	%i2,	0x171C,	%g2
	edge32n	%l2,	%o3,	%l1
	subc	%o4,	%l4,	%g7
	sllx	%i1,	0x02,	%o6
	umulcc	%g5,	%i3,	%l6
	add	%l7,	0x48,	%l6
	wr	%g0,	0x19,	%asi
	casxa	[%l6] %asi,	%i7,	%i0
	fmovdne	%xcc,	%f21,	%f30
	srl	%o1,	%g3,	%o5
	tpos	%xcc,	0x2
	be	%icc,	loop_1861
	flush	%l7 + 0x34
	sdiv	%i6,	0x1CAE,	%l0
	nop
	set	0x40, %o6
	stx	%l5,	[%l7 + %o6]
loop_1861:
	fcmpgt16	%f12,	%f28,	%i4
	fabss	%f24,	%f8
	tneg	%xcc,	0x0
	movleu	%xcc,	%o7,	%o0
	edge32ln	%g4,	%l3,	%g1
	fbge,a	%fcc2,	loop_1862
	andn	%i5,	%g6,	%o2
	ldsw	[%l7 + 0x74],	%i2
	edge16	%l2,	%g2,	%o3
loop_1862:
	fbge	%fcc3,	loop_1863
	ldsw	[%l7 + 0x18],	%l1
	fbue	%fcc2,	loop_1864
	orn	%l4,	%o4,	%i1
loop_1863:
	stbar
	movge	%icc,	%o6,	%g5
loop_1864:
	tge	%icc,	0x7
	add	%l7,	0x60,	%l6
	wr	%g0,	0x0c,	%asi
	casa	[%l6] 0x0c,	%i3,	%l6
	xnor	%i7,	0x1BE4,	%i0
	fnand	%f20,	%f16,	%f16
	ta	%xcc,	0x3
	srl	%g7,	%g3,	%o1
	tl	%icc,	0x4
	mulscc	%i6,	%o5,	%l5
	umul	%i4,	%o7,	%o0
	or	%g4,	%l0,	%l3
	move	%icc,	%i5,	%g6
	addccc	%o2,	%g1,	%i2
	tvc	%xcc,	0x2
	addc	%g2,	%l2,	%o3
	andn	%l4,	%l1,	%o4
	edge16ln	%i1,	%g5,	%i3
	tgu	%xcc,	0x3
	edge32ln	%l6,	%o6,	%i7
	wr	%g0,	0x81,	%asi
	lda	[%l7 + 0x50] %asi,	%f7
	sub	%i0,	%g3,	%g7
	tn	%icc,	0x1
	fbule	%fcc0,	loop_1865
	move	%xcc,	%o1,	%i6
	tcc	%icc,	0x4
	fnot1	%f18,	%f20
loop_1865:
	movre	%l5,	0x1CA,	%o5
	taddcctv	%i4,	%o0,	%g4
	movle	%xcc,	%l0,	%o7
	smul	%l3,	%i5,	%o2
	set	0x64, %g4
	stwa	%g1,	[%l7 + %g4] 0x88
	andncc	%i2,	%g6,	%l2
	movpos	%xcc,	%g2,	%o3
	fors	%f11,	%f30,	%f18
	fmovde	%icc,	%f28,	%f7
	movrlz	%l1,	0x2DB,	%l4
	faligndata	%f18,	%f26,	%f10
	edge16	%o4,	%i1,	%g5
	xorcc	%i3,	%o6,	%i7
	bg	loop_1866
	mova	%xcc,	%l6,	%g3
	movneg	%icc,	%i0,	%o1
	st	%f1,	[%l7 + 0x48]
loop_1866:
	nop
	wr	%g0,	0x04,	%asi
	lduba	[%l7 + 0x47] %asi,	%i6
	fcmple32	%f12,	%f30,	%g7
	fcmpgt32	%f8,	%f10,	%l5
	movrlz	%o5,	%i4,	%o0
	andcc	%g4,	0x056C,	%l0
	wr	%g0,	0x80,	%asi
	stha	%l3,	[%l7 + 0x7E] %asi
	fbule,a	%fcc3,	loop_1867
	subcc	%o7,	0x1338,	%i5
	xnor	%o2,	%g1,	%i2
	edge16	%g6,	%l2,	%g2
loop_1867:
	tg	%icc,	0x0
	nop
	setx	loop_1868,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	udiv	%l1,	0x0129,	%o3
	smul	%l4,	%i1,	%g5
	bleu	%icc,	loop_1869
loop_1868:
	edge32	%o4,	%o6,	%i7
	movrlez	%i3,	%g3,	%l6
	or	%i0,	%o1,	%i6
loop_1869:
	tpos	%icc,	0x3
	movcc	%xcc,	%g7,	%o5
	sra	%l5,	%i4,	%o0
	mulx	%g4,	0x0FDE,	%l0
	umul	%o7,	%i5,	%o2
	tcc	%xcc,	0x3
	fcmpne32	%f18,	%f26,	%g1
	subcc	%i2,	0x1ED6,	%l3
	bne	loop_1870
	bpos,a	loop_1871
	movneg	%icc,	%g6,	%l2
	taddcctv	%g2,	%o3,	%l1
loop_1870:
	movne	%xcc,	%l4,	%i1
loop_1871:
	fcmple16	%f0,	%f14,	%o4
	movrlz	%g5,	0x22C,	%o6
	addccc	%i3,	0x1AE4,	%i7
	array16	%g3,	%l6,	%i0
	ta	%icc,	0x7
	movcc	%icc,	%i6,	%g7
	add	%o5,	%o1,	%i4
	edge32l	%o0,	%g4,	%l0
	smulcc	%l5,	0x16E6,	%i5
	mulscc	%o7,	0x0D5D,	%g1
	fblg,a	%fcc3,	loop_1872
	edge8	%o2,	%i2,	%g6
	movrlz	%l3,	%l2,	%o3
	ld	[%l7 + 0x68],	%f3
loop_1872:
	fmovse	%icc,	%f6,	%f1
	subcc	%g2,	0x0B5D,	%l4
	bne,a,pt	%icc,	loop_1873
	edge16l	%i1,	%l1,	%o4
	brnz,a	%o6,	loop_1874
	edge16	%i3,	%i7,	%g5
loop_1873:
	movle	%xcc,	%l6,	%i0
	brlz,a	%i6,	loop_1875
loop_1874:
	tpos	%icc,	0x2
	fbug,a	%fcc3,	loop_1876
	or	%g7,	%g3,	%o5
loop_1875:
	fmovrdlez	%o1,	%f20,	%f0
	taddcc	%o0,	0x0F26,	%g4
loop_1876:
	fnand	%f30,	%f0,	%f2
	srl	%i4,	%l0,	%i5
	movg	%icc,	%l5,	%o7
	movleu	%icc,	%g1,	%o2
	fmul8x16au	%f10,	%f6,	%f18
	alignaddr	%i2,	%l3,	%g6
	fblg,a	%fcc1,	loop_1877
	sra	%o3,	%g2,	%l4
	taddcc	%l2,	0x1EAA,	%i1
	ta	%xcc,	0x5
loop_1877:
	mova	%icc,	%o4,	%o6
	tle	%xcc,	0x6
	or	%l1,	%i3,	%i7
	sub	%g5,	%l6,	%i6
	fmovscc	%icc,	%f4,	%f17
	fbule	%fcc1,	loop_1878
	fbo,a	%fcc3,	loop_1879
	sll	%i0,	%g7,	%g3
	tl	%icc,	0x0
loop_1878:
	nop
	set	0x12, %l1
	lduha	[%l7 + %l1] 0x19,	%o1
loop_1879:
	edge8l	%o5,	%o0,	%i4
	move	%icc,	%l0,	%g4
	tvs	%icc,	0x0
	edge32ln	%i5,	%o7,	%g1
	smulcc	%o2,	%l5,	%l3
	brz,a	%i2,	loop_1880
	ta	%icc,	0x7
	movne	%xcc,	%o3,	%g6
	for	%f26,	%f6,	%f16
loop_1880:
	tpos	%xcc,	0x2
	fmovse	%icc,	%f27,	%f21
	edge32	%l4,	%l2,	%i1
	nop
	fitod	%f22,	%f10
	subcc	%o4,	%g2,	%o6
	brgz	%i3,	loop_1881
	movle	%xcc,	%i7,	%g5
	addccc	%l6,	0x1AA9,	%i6
	faligndata	%f20,	%f4,	%f8
loop_1881:
	fcmpeq32	%f28,	%f0,	%l1
	movl	%xcc,	%i0,	%g7
	umul	%o1,	%o5,	%g3
	tpos	%xcc,	0x1
	fbu	%fcc0,	loop_1882
	bgu,pn	%xcc,	loop_1883
	fmovdle	%xcc,	%f5,	%f28
	fmovd	%f16,	%f16
loop_1882:
	orn	%o0,	0x18C3,	%i4
loop_1883:
	movgu	%xcc,	%g4,	%i5
	fba,a	%fcc0,	loop_1884
	pdist	%f8,	%f24,	%f10
	orncc	%l0,	0x0508,	%o7
	addccc	%g1,	%o2,	%l5
loop_1884:
	tsubcctv	%i2,	%o3,	%l3
	andn	%l4,	%l2,	%i1
	xorcc	%o4,	0x1633,	%g2
	edge32ln	%g6,	%i3,	%o6
	sra	%i7,	%l6,	%i6
	fpadd32	%f20,	%f30,	%f18
	addcc	%l1,	0x09B5,	%i0
	smul	%g5,	%o1,	%g7
	fbul,a	%fcc1,	loop_1885
	tvc	%xcc,	0x2
	tcs	%xcc,	0x7
	brgez	%g3,	loop_1886
loop_1885:
	fbl	%fcc1,	loop_1887
	fmul8x16	%f6,	%f0,	%f30
	edge8	%o5,	%i4,	%o0
loop_1886:
	ldstub	[%l7 + 0x6E],	%g4
loop_1887:
	lduh	[%l7 + 0x74],	%i5
	stbar
	movvs	%icc,	%l0,	%g1
	bl,a	loop_1888
	membar	0x2F
	bne,pn	%icc,	loop_1889
	edge16l	%o2,	%l5,	%o7
loop_1888:
	fbuge,a	%fcc3,	loop_1890
	ldub	[%l7 + 0x31],	%i2
loop_1889:
	sra	%o3,	%l4,	%l2
	alignaddr	%i1,	%l3,	%o4
loop_1890:
	membar	0x63
	movvc	%xcc,	%g2,	%i3
	udiv	%o6,	0x17A3,	%g6
	mulscc	%i7,	0x1355,	%l6
	movneg	%icc,	%l1,	%i0
	alignaddr	%i6,	%o1,	%g7
	stb	%g3,	[%l7 + 0x24]
	wr	%g0,	0x19,	%asi
	stba	%o5,	[%l7 + 0x6A] %asi
	lduh	[%l7 + 0x52],	%g5
	udiv	%i4,	0x1BEC,	%o0
	or	%g4,	0x1D02,	%l0
	movg	%xcc,	%i5,	%o2
	movgu	%xcc,	%g1,	%o7
	srax	%l5,	0x0E,	%o3
	fnot1s	%f26,	%f5
	fbne,a	%fcc1,	loop_1891
	movrgez	%i2,	%l2,	%l4
	ldub	[%l7 + 0x40],	%i1
	movrgez	%l3,	0x2EC,	%g2
loop_1891:
	xorcc	%i3,	%o4,	%o6
	fbg	%fcc2,	loop_1892
	fbl,a	%fcc0,	loop_1893
	fbule,a	%fcc3,	loop_1894
	nop
	set	0x34, %i2
	stw	%g6,	[%l7 + %i2]
loop_1892:
	fmovrdne	%i7,	%f14,	%f20
loop_1893:
	nop
	wr	%g0,	0x18,	%asi
	ldsba	[%l7 + 0x78] %asi,	%l1
loop_1894:
	mova	%icc,	%l6,	%i6
	fmovdl	%xcc,	%f2,	%f20
	tg	%xcc,	0x4
	movrgez	%o1,	0x31B,	%i0
	bvs	%xcc,	loop_1895
	orncc	%g7,	%o5,	%g3
	fmul8x16al	%f25,	%f13,	%f8
	fornot2s	%f7,	%f18,	%f28
loop_1895:
	fsrc2s	%f27,	%f27
	fmovdvs	%xcc,	%f15,	%f11
	movl	%icc,	%i4,	%g5
	taddcctv	%o0,	%l0,	%g4
	orcc	%i5,	0x1826,	%g1
	fblg	%fcc0,	loop_1896
	sethi	0x1C93,	%o7
	stw	%l5,	[%l7 + 0x10]
	fmovsvs	%xcc,	%f0,	%f27
loop_1896:
	bcc,a,pt	%xcc,	loop_1897
	bcs	%xcc,	loop_1898
	movrlez	%o3,	0x0C9,	%i2
	brgez,a	%o2,	loop_1899
loop_1897:
	nop
	fitos	%f0,	%f16
	fstox	%f16,	%f18
loop_1898:
	nop
	setx	loop_1900,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fone	%f4
loop_1899:
	nop
	set	0x60, %i1
	ldxa	[%l7 + %i1] 0x15,	%l4
loop_1900:
	add	%l2,	%l3,	%i1
	nop
	setx	0xBA669EC378671ACD,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	fsqrtd	%f14,	%f20
	brlez,a	%g2,	loop_1901
	fnot2s	%f2,	%f5
	nop
	setx loop_1902, %l0, %l1
	jmpl %l1, %o4
	movge	%icc,	%i3,	%o6
loop_1901:
	addc	%g6,	0x0B1A,	%l1
	nop
	setx	loop_1903,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_1902:
	move	%icc,	%i7,	%i6
	fpmerge	%f2,	%f6,	%f26
	movne	%icc,	%l6,	%o1
loop_1903:
	mulx	%i0,	0x0881,	%g7
	for	%f6,	%f20,	%f24
	movg	%xcc,	%g3,	%o5
	fzeros	%f4
	srl	%i4,	%o0,	%l0
	edge16n	%g4,	%g5,	%i5
	tle	%icc,	0x4
	fmovsneg	%xcc,	%f4,	%f31
	alignaddrl	%g1,	%o7,	%o3
	fpsub32	%f10,	%f10,	%f24
	nop
	setx	0x1B3AF49B10742950,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldx	[%l7 + 0x28],	%fsr
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subccc	%l5,	0x195C,	%i2
	set	0x20, %g7
	ldxa	[%l7 + %g7] 0x18,	%l4
	fbl,a	%fcc2,	loop_1904
	taddcctv	%l2,	%l3,	%i1
	taddcctv	%o2,	0x1B61,	%g2
	fbuge,a	%fcc0,	loop_1905
loop_1904:
	tvs	%icc,	0x0
	edge16n	%o4,	%i3,	%g6
	fmovdgu	%xcc,	%f5,	%f18
loop_1905:
	sllx	%l1,	0x0D,	%o6
	tgu	%icc,	0x0
	edge32l	%i6,	%i7,	%o1
	ldd	[%l7 + 0x28],	%i6
	edge16	%g7,	%i0,	%o5
	movrne	%i4,	%o0,	%g3
	wr	%g0,	0x88,	%asi
	sta	%f4,	[%l7 + 0x3C] %asi
	fmul8x16al	%f24,	%f19,	%f10
	tcc	%icc,	0x2
	fmovd	%f8,	%f6
	sll	%g4,	0x0E,	%g5
	sra	%l0,	0x1D,	%g1
	movrlz	%i5,	%o3,	%l5
	fmovrdgez	%o7,	%f4,	%f30
	fbne,a	%fcc3,	loop_1906
	brgez	%l4,	loop_1907
	array8	%i2,	%l3,	%l2
	fnors	%f25,	%f25,	%f9
loop_1906:
	orncc	%o2,	%g2,	%o4
loop_1907:
	stw	%i1,	[%l7 + 0x2C]
	wr	%g0,	0x52,	%asi
	stxa	%g6,	[%g0 + 0x110] %asi
	edge32	%i3,	%l1,	%i6
	fmovdn	%icc,	%f25,	%f4
	taddcctv	%o6,	%i7,	%o1
	sdiv	%l6,	0x0E01,	%i0
	movleu	%xcc,	%o5,	%g7
	wr	%g0,	0x22,	%asi
	stba	%o0,	[%l7 + 0x46] %asi
	membar	#Sync
	ldd	[%l7 + 0x78],	%f14
	tleu	%xcc,	0x2
	fmovsa	%xcc,	%f21,	%f18
	sdiv	%g3,	0x0C12,	%g4
	fmul8ulx16	%f24,	%f16,	%f8
	fbue,a	%fcc0,	loop_1908
	fnot1	%f18,	%f14
	fbug	%fcc3,	loop_1909
	tsubcc	%g5,	0x15C9,	%i4
loop_1908:
	orn	%g1,	0x1B61,	%l0
	sub	%i5,	%l5,	%o7
loop_1909:
	orncc	%o3,	0x0412,	%l4
	nop
	fitos	%f1,	%f27
	fstod	%f27,	%f12
	movrlz	%l3,	%l2,	%o2
	sll	%i2,	0x1B,	%o4
	subcc	%g2,	0x045C,	%g6
	addcc	%i3,	%l1,	%i6
	membar	0x21
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32l	%o6,	%i7,	%i1
	addcc	%o1,	0x19E1,	%i0
	addcc	%o5,	0x04D7,	%g7
	fmovse	%xcc,	%f15,	%f28
	fbn,a	%fcc3,	loop_1910
	movrgez	%l6,	0x166,	%g3
	subcc	%o0,	%g5,	%g4
	fpmerge	%f0,	%f18,	%f28
loop_1910:
	movle	%xcc,	%g1,	%i4
	sllx	%i5,	%l0,	%l5
	fzeros	%f11
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movleu	%xcc,	%o3,	%o7
	stw	%l4,	[%l7 + 0x7C]
	subc	%l3,	0x1E5B,	%l2
	set	0x10, %l4
	swapa	[%l7 + %l4] 0x89,	%i2
	xnorcc	%o2,	%o4,	%g6
	bge,a	%xcc,	loop_1911
	nop
	setx	0xD88FC59F9040A6AE,	%l0,	%l6
	stx	%l6,	[%l7 + 0x48]
	ldx	[%l7 + 0x48],	%fsr
	nop
	setx	loop_1912,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	srax	%g2,	%i3,	%i6
loop_1911:
	fnors	%f14,	%f13,	%f13
	tpos	%xcc,	0x2
loop_1912:
	brz,a	%l1,	loop_1913
	ldd	[%l7 + 0x28],	%o6
	addc	%i7,	%o1,	%i1
	edge8	%i0,	%o5,	%g7
loop_1913:
	andcc	%g3,	%l6,	%g5
	movrne	%o0,	%g1,	%i4
	tl	%icc,	0x5
	tg	%xcc,	0x1
	movne	%xcc,	%i5,	%l0
	movge	%icc,	%l5,	%g4
	xor	%o7,	%o3,	%l4
	taddcc	%l3,	%l2,	%o2
	udivx	%o4,	0x1615,	%g6
	fmovsne	%icc,	%f12,	%f6
	andn	%i2,	%g2,	%i6
	mulx	%l1,	%i3,	%o6
	movge	%xcc,	%i7,	%o1
	edge8	%i0,	%i1,	%o5
	fmovdn	%icc,	%f8,	%f23
	smul	%g3,	0x1264,	%g7
	sdiv	%g5,	0x077C,	%l6
	movgu	%icc,	%o0,	%g1
	ldsh	[%l7 + 0x6C],	%i5
	fmovrdgz	%l0,	%f28,	%f28
	fbue	%fcc1,	loop_1914
	movvs	%icc,	%l5,	%g4
	udivx	%i4,	0x0CDA,	%o7
	tcc	%xcc,	0x0
loop_1914:
	movrgz	%l4,	%o3,	%l3
	swap	[%l7 + 0x24],	%l2
	edge32l	%o2,	%o4,	%g6
	sdivx	%g2,	0x1D2A,	%i2
	movvc	%icc,	%l1,	%i6
	tcs	%icc,	0x2
	andncc	%o6,	%i7,	%i3
	bcc,a	loop_1915
	orcc	%i0,	0x0CCE,	%i1
	movcc	%xcc,	%o5,	%g3
	alignaddr	%o1,	%g5,	%g7
loop_1915:
	fmovsle	%xcc,	%f29,	%f11
	movn	%xcc,	%l6,	%o0
	sdiv	%g1,	0x15E9,	%l0
	brgz	%l5,	loop_1916
	nop
	fitod	%f10,	%f26
	fdtox	%f26,	%f20
	fpadd32s	%f31,	%f24,	%f6
	fmovdvs	%xcc,	%f12,	%f25
loop_1916:
	edge32ln	%g4,	%i4,	%i5
	mova	%icc,	%o7,	%l4
	movne	%icc,	%l3,	%o3
	bl	loop_1917
	tcs	%icc,	0x2
	movn	%icc,	%l2,	%o4
	fmovs	%f20,	%f11
loop_1917:
	tneg	%xcc,	0x6
	movne	%xcc,	%o2,	%g2
	srlx	%g6,	%i2,	%i6
	be	loop_1918
	fcmpgt16	%f22,	%f24,	%o6
	and	%l1,	0x0798,	%i7
	brgez	%i3,	loop_1919
loop_1918:
	tn	%icc,	0x5
	set	0x50, %i0
	ldda	[%l7 + %i0] 0xe2,	%i0
loop_1919:
	edge32n	%i0,	%o5,	%g3
	umulcc	%g5,	%o1,	%l6
	fmovspos	%icc,	%f13,	%f11
	fmovsne	%xcc,	%f8,	%f20
	andn	%g7,	%o0,	%g1
	ba,a,pn	%icc,	loop_1920
	tleu	%xcc,	0x1
	taddcctv	%l5,	%l0,	%i4
	sdivcc	%i5,	0x05C4,	%o7
loop_1920:
	nop
	fitod	%f12,	%f0
	fdtoi	%f0,	%f22
	mova	%icc,	%g4,	%l3
	nop
	setx	0x03712B9EDD5A8121,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	fsqrtd	%f24,	%f28
	ldd	[%l7 + 0x18],	%f20
	movcs	%xcc,	%o3,	%l2
	fmovda	%xcc,	%f28,	%f10
	fmul8x16au	%f31,	%f27,	%f16
	fmovsne	%xcc,	%f8,	%f1
	tle	%xcc,	0x4
	set	0x68, %o5
	swapa	[%l7 + %o5] 0x0c,	%l4
	add	%l7,	0x28,	%l6
	wr	%g0,	0x11,	%asi
	lda	[%l6] %asi,	%o2
	casa	[%l6] 0x11,	%o2,	%g2
	tn	%icc,	0x3
	edge8n	%o4,	%g6,	%i2
	movcs	%xcc,	%o6,	%l1
	tpos	%icc,	0x4
	fmovse	%icc,	%f31,	%f1
	subc	%i7,	0x0033,	%i3
	sllx	%i6,	%i1,	%i0
	movrlz	%o5,	0x217,	%g3
	fmovdge	%xcc,	%f23,	%f10
	edge32l	%o1,	%g5,	%l6
	fbo	%fcc1,	loop_1921
	taddcctv	%g7,	%o0,	%l5
	sllx	%g1,	0x11,	%i4
	fnand	%f12,	%f26,	%f2
loop_1921:
	movn	%icc,	%i5,	%l0
	alignaddr	%g4,	%l3,	%o3
	fabss	%f20,	%f1
	fmovsleu	%xcc,	%f27,	%f10
	bleu	%xcc,	loop_1922
	move	%icc,	%o7,	%l4
	movvc	%icc,	%o2,	%l2
	ta	%xcc,	0x7
loop_1922:
	nop
	setx loop_1923, %l0, %l1
	jmpl %l1, %o4
	sub	%g6,	%i2,	%o6
	sethi	0x1899,	%l1
	movgu	%xcc,	%g2,	%i3
loop_1923:
	edge32ln	%i7,	%i6,	%i0
	bleu,a	%icc,	loop_1924
	fbg	%fcc1,	loop_1925
	udiv	%i1,	0x1C34,	%o5
	fand	%f16,	%f26,	%f18
loop_1924:
	nop
	set	0x68, %i7
	swapa	[%l7 + %i7] 0x80,	%g3
loop_1925:
	movrne	%g5,	%o1,	%g7
	set	0x08, %o7
	stwa	%l6,	[%l7 + %o7] 0xea
	membar	#Sync
	wr	%g0,	0x11,	%asi
	ldswa	[%l7 + 0x60] %asi,	%l5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnand	%f30,	%f18,	%f30
	tvc	%xcc,	0x5
	fmovda	%icc,	%f5,	%f14
	edge32ln	%o0,	%g1,	%i5
	edge16n	%i4,	%g4,	%l0
	sub	%l3,	0x0F5B,	%o3
	udivcc	%l4,	0x056D,	%o2
	wr	%g0,	0x81,	%asi
	lda	[%l7 + 0x30] %asi,	%f3
	fxors	%f23,	%f0,	%f19
	xorcc	%o7,	%o4,	%g6
	wr	%g0,	0x18,	%asi
	stha	%l2,	[%l7 + 0x18] %asi
	subc	%i2,	0x0C7D,	%l1
	ldub	[%l7 + 0x3C],	%g2
	orn	%i3,	0x107F,	%o6
	sdivcc	%i7,	0x13D4,	%i6
	movg	%xcc,	%i0,	%i1
	umulcc	%g3,	0x0879,	%o5
	edge8l	%o1,	%g5,	%l6
	faligndata	%f6,	%f4,	%f10
	umulcc	%l5,	%o0,	%g1
	add	%g7,	%i4,	%i5
	fandnot1	%f10,	%f18,	%f0
	addcc	%l0,	%l3,	%g4
	set	0x40, %g3
	ldda	[%l7 + %g3] 0x81,	%f16
	tgu	%xcc,	0x2
	bpos,a,pn	%icc,	loop_1926
	stx	%l4,	[%l7 + 0x48]
	fmovscc	%icc,	%f24,	%f4
	fcmpeq16	%f26,	%f20,	%o3
loop_1926:
	fpsub16	%f22,	%f6,	%f24
	wr	%g0,	0xe3,	%asi
	stba	%o2,	[%l7 + 0x24] %asi
	membar	#Sync
	movcs	%xcc,	%o7,	%o4
	sub	%l2,	0x0813,	%i2
	popc	0x0587,	%g6
	edge32l	%g2,	%l1,	%o6
	movpos	%xcc,	%i3,	%i6
	fbu	%fcc1,	loop_1927
	sdivcc	%i0,	0x00BA,	%i7
	fmovrsgez	%i1,	%f16,	%f24
	fbuge,a	%fcc1,	loop_1928
loop_1927:
	nop
	setx loop_1929, %l0, %l1
	jmpl %l1, %g3
	edge8ln	%o1,	%g5,	%o5
	ldx	[%l7 + 0x40],	%l6
loop_1928:
	fandnot2	%f2,	%f26,	%f16
loop_1929:
	edge16	%l5,	%g1,	%g7
	fsrc2	%f28,	%f0
	movge	%icc,	%i4,	%i5
	sub	%o0,	0x127A,	%l0
	fbue,a	%fcc0,	loop_1930
	movvc	%xcc,	%l3,	%g4
	sllx	%l4,	%o3,	%o7
	srl	%o2,	%o4,	%l2
loop_1930:
	move	%icc,	%g6,	%i2
	fpadd32s	%f1,	%f3,	%f16
	movleu	%xcc,	%l1,	%g2
	tvs	%xcc,	0x7
	sdivcc	%i3,	0x0397,	%i6
	set	0x70, %o1
	stwa	%i0,	[%l7 + %o1] 0x04
	srax	%o6,	0x15,	%i1
	orn	%g3,	0x17FF,	%i7
	movleu	%icc,	%g5,	%o5
	and	%l6,	0x15D9,	%l5
	for	%f0,	%f22,	%f18
	movgu	%icc,	%g1,	%o1
	andcc	%g7,	%i4,	%o0
	nop
	setx	loop_1931,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	smulcc	%i5,	%l0,	%g4
	xnorcc	%l4,	0x06EC,	%o3
	lduw	[%l7 + 0x40],	%l3
loop_1931:
	addcc	%o2,	%o7,	%l2
	movrlez	%g6,	%o4,	%l1
	fmovspos	%icc,	%f25,	%f22
	set	0x57, %o0
	ldstuba	[%l7 + %o0] 0x80,	%g2
	fsrc2	%f4,	%f26
	sth	%i3,	[%l7 + 0x3A]
	set	0x28, %g6
	stxa	%i6,	[%g0 + %g6] 0x20
	orncc	%i0,	0x1537,	%o6
	fbug,a	%fcc3,	loop_1932
	tl	%xcc,	0x3
	tl	%icc,	0x4
	bvc,pt	%xcc,	loop_1933
loop_1932:
	udiv	%i2,	0x0E26,	%i1
	mova	%xcc,	%g3,	%i7
	tleu	%icc,	0x7
loop_1933:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsvc	%icc,	%f3,	%f21
	edge8	%g5,	%o5,	%l6
	xnor	%l5,	0x0F2F,	%o1
	wr	%g0,	0x0c,	%asi
	ldstuba	[%l7 + 0x1D] %asi,	%g7
	edge16	%g1,	%i4,	%i5
	srlx	%o0,	0x11,	%g4
	fmovsge	%icc,	%f30,	%f17
	bleu,pn	%xcc,	loop_1934
	srax	%l4,	0x02,	%l0
	orn	%o3,	%l3,	%o2
	fbule	%fcc1,	loop_1935
loop_1934:
	tl	%icc,	0x7
	ble,pn	%icc,	loop_1936
	movrgez	%o7,	%l2,	%o4
loop_1935:
	nop
	wr	%g0,	0x0c,	%asi
	ldsba	[%l7 + 0x73] %asi,	%l1
loop_1936:
	call	loop_1937
	taddcctv	%g2,	0x0575,	%g6
	sra	%i3,	0x14,	%i6
	sethi	0x0F97,	%o6
loop_1937:
	sra	%i0,	%i1,	%i2
	tsubcctv	%g3,	0x1B28,	%g5
	taddcc	%o5,	0x039F,	%i7
	fmovrdne	%l6,	%f22,	%f28
	fcmpne16	%f20,	%f30,	%l5
	movcs	%icc,	%o1,	%g1
	nop
	setx	0x09ED67272333994E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0x06693730B91C5480,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	fsubd	%f4,	%f26,	%f14
	bneg,a	loop_1938
	sir	0x0D8C
	tne	%icc,	0x4
	fpmerge	%f25,	%f4,	%f12
loop_1938:
	mulx	%i4,	%i5,	%g7
	bvc,a	loop_1939
	fmul8sux16	%f18,	%f12,	%f12
	tneg	%xcc,	0x6
	ldsh	[%l7 + 0x36],	%o0
loop_1939:
	fabsd	%f0,	%f24
	xnorcc	%g4,	0x17AB,	%l0
	taddcctv	%o3,	0x1256,	%l3
	stb	%l4,	[%l7 + 0x2B]
	array32	%o2,	%o7,	%l2
	nop
	fitod	%f4,	%f14
	fdtox	%f14,	%f26
	fxtod	%f26,	%f26
	tvs	%icc,	0x4
	fandnot2	%f20,	%f26,	%f14
	bneg	%icc,	loop_1940
	fbg	%fcc1,	loop_1941
	andncc	%o4,	%l1,	%g2
	movrgez	%i3,	%i6,	%g6
loop_1940:
	xnorcc	%i0,	0x0AD5,	%o6
loop_1941:
	fnors	%f1,	%f6,	%f28
	and	%i1,	%g3,	%g5
	bn	loop_1942
	fcmpgt16	%f4,	%f2,	%o5
	xnor	%i2,	%l6,	%l5
	sethi	0x028B,	%o1
loop_1942:
	movvc	%icc,	%g1,	%i4
	nop
	setx	loop_1943,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fblg	%fcc3,	loop_1944
	nop
	setx	0x54F50086,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f16
	setx	0x2C19656B,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f21
	fsubs	%f21,	%f16,	%f11
	smul	%i5,	%i7,	%g7
loop_1943:
	tl	%xcc,	0x5
loop_1944:
	movvc	%xcc,	%g4,	%o0
	brz,a	%o3,	loop_1945
	fands	%f19,	%f9,	%f26
	call	loop_1946
	umulcc	%l3,	%l0,	%l4
loop_1945:
	array32	%o7,	%l2,	%o2
	xor	%l1,	%o4,	%g2
loop_1946:
	fmovspos	%icc,	%f29,	%f16
	fandnot1	%f14,	%f20,	%f6
	tge	%icc,	0x1
	membar	0x66
	fmovscc	%icc,	%f0,	%f15
	movle	%xcc,	%i3,	%g6
	membar	0x34
	tcc	%icc,	0x4
	addccc	%i0,	%i6,	%i1
	tsubcc	%o6,	%g3,	%g5
	movcs	%icc,	%o5,	%i2
	edge16n	%l5,	%l6,	%g1
	wr	%g0,	0x89,	%asi
	ldxa	[%l7 + 0x78] %asi,	%i4
	fpadd16s	%f5,	%f23,	%f28
	edge8ln	%i5,	%i7,	%o1
	srlx	%g7,	%g4,	%o3
	call	loop_1947
	fmovde	%xcc,	%f8,	%f26
	stbar
	lduw	[%l7 + 0x6C],	%o0
loop_1947:
	alignaddr	%l0,	%l3,	%l4
	set	0x44, %o3
	stwa	%o7,	[%l7 + %o3] 0x14
	andncc	%o2,	%l1,	%l2
	lduh	[%l7 + 0x2C],	%o4
	fnegd	%f4,	%f8
	bleu,a	%xcc,	loop_1948
	srl	%g2,	0x03,	%i3
	set	0x28, %i6
	prefetcha	[%l7 + %i6] 0x18,	 0x3
loop_1948:
	popc	0x0F9A,	%i6
	edge8n	%i0,	%o6,	%i1
	membar	0x00
	movleu	%icc,	%g5,	%o5
	movleu	%xcc,	%g3,	%l5
	tge	%xcc,	0x4
	ble,a	%icc,	loop_1949
	ble,a,pt	%xcc,	loop_1950
	edge8	%i2,	%l6,	%g1
	tsubcctv	%i4,	0x06DB,	%i5
loop_1949:
	sdivx	%i7,	0x0123,	%o1
loop_1950:
	movg	%xcc,	%g7,	%g4
	movge	%icc,	%o0,	%l0
	movvc	%icc,	%l3,	%l4
	tcs	%xcc,	0x6
	bcs,pn	%xcc,	loop_1951
	movne	%icc,	%o3,	%o2
	srax	%l1,	%l2,	%o7
	edge8n	%g2,	%i3,	%g6
loop_1951:
	nop
	set	0x28, %l2
	ldd	[%l7 + %l2],	%f24
	orcc	%i6,	0x19CA,	%i0
	tle	%xcc,	0x5
	movvs	%icc,	%o4,	%i1
	ld	[%l7 + 0x78],	%f6
	edge8l	%g5,	%o5,	%g3
	fmovscs	%icc,	%f27,	%f2
	sdivx	%o6,	0x0FC0,	%l5
	set	0x6A, %i4
	ldsha	[%l7 + %i4] 0x11,	%i2
	edge8ln	%l6,	%i4,	%g1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stbar
	movvc	%icc,	%i5,	%o1
	udivcc	%g7,	0x084A,	%g4
	edge8	%o0,	%l0,	%l3
	taddcc	%i7,	0x0078,	%l4
	sethi	0x00BF,	%o3
	umulcc	%o2,	%l1,	%o7
	udivx	%l2,	0x0AA4,	%g2
	std	%f24,	[%l7 + 0x40]
	edge16ln	%g6,	%i3,	%i0
	edge32n	%o4,	%i1,	%g5
	movcc	%xcc,	%o5,	%g3
	taddcc	%o6,	0x09F4,	%l5
	fbug	%fcc0,	loop_1952
	alignaddr	%i6,	%l6,	%i4
	or	%g1,	%i2,	%i5
	bcs,a,pt	%xcc,	loop_1953
loop_1952:
	bvc,pn	%xcc,	loop_1954
	edge8n	%g7,	%g4,	%o0
	edge16	%o1,	%l3,	%l0
loop_1953:
	sir	0x1B82
loop_1954:
	edge8ln	%i7,	%o3,	%o2
	movcc	%icc,	%l1,	%o7
	ble,a,pn	%xcc,	loop_1955
	or	%l4,	0x1C15,	%l2
	wr	%g0,	0x19,	%asi
	ldsha	[%l7 + 0x2C] %asi,	%g2
loop_1955:
	movcs	%xcc,	%g6,	%i0
	sllx	%i3,	%o4,	%i1
	subc	%o5,	%g5,	%o6
	orcc	%l5,	0x16CB,	%i6
	bpos	%xcc,	loop_1956
	fbl,a	%fcc2,	loop_1957
	fmovdleu	%xcc,	%f16,	%f9
	fpsub32s	%f0,	%f27,	%f24
loop_1956:
	taddcc	%l6,	%g3,	%g1
loop_1957:
	fmovse	%icc,	%f4,	%f10
	tsubcc	%i2,	0x0580,	%i4
	flush	%l7 + 0x64
	addcc	%i5,	0x1D70,	%g7
	fands	%f15,	%f11,	%f28
	edge16	%o0,	%g4,	%o1
	andn	%l0,	0x13F4,	%i7
	tleu	%xcc,	0x2
	fnot2	%f12,	%f22
	fnands	%f5,	%f5,	%f26
	tle	%xcc,	0x1
	edge16n	%l3,	%o3,	%o2
	srlx	%o7,	%l4,	%l2
	pdist	%f30,	%f4,	%f8
	udiv	%l1,	0x1522,	%g6
	tvc	%icc,	0x7
	fmovsgu	%icc,	%f0,	%f10
	xnor	%g2,	%i3,	%i0
	nop
	setx	0xD12A821FBB53DE6F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	fsqrtd	%f18,	%f12
	fmovde	%icc,	%f1,	%f2
	tsubcc	%o4,	0x1684,	%o5
	fnot1	%f14,	%f18
	fpadd32	%f8,	%f26,	%f18
	edge16ln	%g5,	%o6,	%l5
	alignaddrl	%i6,	%i1,	%l6
	brgez	%g3,	loop_1958
	and	%g1,	%i4,	%i2
	xor	%i5,	0x08B5,	%o0
	set	0x40, %g1
	stda	%f0,	[%l7 + %g1] 0x80
loop_1958:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	setx	loop_1959,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	xorcc	%g7,	0x1448,	%g4
	fsrc1s	%f23,	%f5
	fbul	%fcc0,	loop_1960
loop_1959:
	addcc	%l0,	0x143A,	%o1
	movleu	%xcc,	%l3,	%i7
	lduw	[%l7 + 0x38],	%o2
loop_1960:
	subcc	%o3,	%l4,	%o7
	nop
	setx	loop_1961,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	orn	%l2,	0x153D,	%l1
	movn	%xcc,	%g6,	%i3
	movn	%xcc,	%g2,	%o4
loop_1961:
	subc	%o5,	%i0,	%o6
	movcc	%icc,	%g5,	%i6
	andn	%i1,	%l6,	%g3
	udiv	%l5,	0x0E61,	%i4
	add	%l7,	0x50,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%i2
	casxa	[%l6] 0x89,	%i2,	%i5
	xorcc	%o0,	0x0A0C,	%g7
	movvs	%icc,	%g1,	%l0
	movge	%icc,	%o1,	%l3
	fmovrdgz	%i7,	%f24,	%f24
	fandnot1	%f12,	%f6,	%f14
	fpadd16	%f0,	%f18,	%f6
	edge32ln	%g4,	%o3,	%l4
	stw	%o2,	[%l7 + 0x70]
	movcc	%icc,	%l2,	%o7
	smulcc	%l1,	0x16F5,	%i3
	mulx	%g6,	0x0A91,	%o4
	tleu	%xcc,	0x4
	movge	%xcc,	%o5,	%g2
	movvc	%xcc,	%o6,	%g5
	edge16ln	%i6,	%i1,	%i0
	nop
	set	0x30, %l5
	stw	%g3,	[%l7 + %l5]
	smulcc	%l5,	%i4,	%i2
	addccc	%i5,	0x0594,	%o0
	set	0x50, %g2
	prefetcha	[%l7 + %g2] 0x19,	 0x0
	movrne	%g1,	0x0DB,	%l6
	edge8	%o1,	%l3,	%i7
	stbar
	andncc	%l0,	%g4,	%o3
	edge16l	%l4,	%o2,	%o7
	ldx	[%l7 + 0x68],	%l2
	movpos	%icc,	%i3,	%l1
	fpsub16s	%f30,	%f15,	%f24
	fbl	%fcc3,	loop_1962
	movre	%g6,	%o5,	%o4
	ldstub	[%l7 + 0x0F],	%o6
	tgu	%icc,	0x0
loop_1962:
	movgu	%icc,	%g2,	%g5
	lduh	[%l7 + 0x0C],	%i6
	nop
	setx	loop_1963,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movne	%xcc,	%i0,	%g3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	brlz,a	%i1,	loop_1964
loop_1963:
	sllx	%l5,	0x11,	%i4
	edge16	%i5,	%o0,	%i2
	ldstub	[%l7 + 0x09],	%g7
loop_1964:
	tle	%icc,	0x4
	movneg	%xcc,	%l6,	%o1
	set	0x70, %l6
	prefetcha	[%l7 + %l6] 0x14,	 0x2
	array8	%i7,	%g1,	%g4
	move	%icc,	%l0,	%o3
	fcmpne32	%f6,	%f24,	%l4
	lduh	[%l7 + 0x5C],	%o2
	xnor	%l2,	%o7,	%i3
	set	0x3D, %g5
	ldstuba	[%l7 + %g5] 0x88,	%g6
	ldub	[%l7 + 0x7F],	%l1
	lduw	[%l7 + 0x44],	%o5
	edge16l	%o4,	%g2,	%g5
	edge16l	%i6,	%i0,	%o6
	edge16n	%i1,	%g3,	%l5
	sll	%i4,	0x02,	%i5
	tsubcctv	%o0,	%g7,	%l6
	sllx	%i2,	0x14,	%l3
	add	%o1,	%g1,	%i7
	smul	%g4,	%o3,	%l0
	add	%l7,	0x4C,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%o2
	casa	[%l6] 0x88,	%o2,	%l4
	tcs	%xcc,	0x1
	edge32	%o7,	%i3,	%l2
	ldsh	[%l7 + 0x30],	%l1
	orncc	%g6,	%o4,	%g2
	mulscc	%o5,	0x199D,	%i6
	tvs	%xcc,	0x0
	fbul,a	%fcc3,	loop_1965
	alignaddr	%i0,	%g5,	%o6
	ldstub	[%l7 + 0x60],	%g3
	orn	%i1,	%i4,	%l5
loop_1965:
	sub	%i5,	0x1527,	%g7
	fmovsne	%icc,	%f17,	%f11
	sir	0x18F5
	fnegd	%f22,	%f28
	tne	%icc,	0x1
	be,a	loop_1966
	bvc,pn	%icc,	loop_1967
	andncc	%o0,	%i2,	%l3
	movl	%icc,	%o1,	%l6
loop_1966:
	ldd	[%l7 + 0x40],	%f20
loop_1967:
	nop
	wr	%g0,	0xf0,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
	fsrc2s	%f1,	%f16
	edge16	%i7,	%g1,	%g4
	fblg,a	%fcc2,	loop_1968
	movcc	%xcc,	%o3,	%l0
	nop
	setx	0xFF3C3E33E8D19B0B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0x036D3FDE12F6DAEB,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	faddd	%f20,	%f24,	%f10
	edge8	%o2,	%l4,	%o7
loop_1968:
	fbue,a	%fcc1,	loop_1969
	nop
	setx	0x7980BF741074CBEC,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0xD4AD0E57554793EE,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fdivd	%f0,	%f30,	%f14
	movrgez	%l2,	%l1,	%g6
	fmovdle	%icc,	%f24,	%f0
loop_1969:
	brnz,a	%i3,	loop_1970
	fbue,a	%fcc1,	loop_1971
	movn	%xcc,	%g2,	%o4
	edge16ln	%o5,	%i0,	%i6
loop_1970:
	nop
	fitos	%f9,	%f10
loop_1971:
	movrne	%g5,	0x313,	%o6
	movpos	%xcc,	%g3,	%i1
	set	0x12, %i3
	stha	%l5,	[%l7 + %i3] 0x19
	nop
	setx	loop_1972,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	bl,a,pn	%xcc,	loop_1973
	movl	%icc,	%i5,	%g7
	sdiv	%o0,	0x0DD5,	%i2
loop_1972:
	nop
	wr	%g0,	0x04,	%asi
	ldsba	[%l7 + 0x14] %asi,	%l3
loop_1973:
	nop
	set	0x50, %i5
	lduwa	[%l7 + %i5] 0x10,	%i4
	set	0x70, %o4
	sta	%f30,	[%l7 + %o4] 0x15
	ldd	[%l7 + 0x40],	%i6
	nop
	set	0x56, %l3
	lduh	[%l7 + %l3],	%o1
	andcc	%i7,	%g1,	%g4
	add	%l7,	0x10,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%o3,	%l0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrdgez	%o2,	%f4,	%f30
	tneg	%xcc,	0x4
	fbule,a	%fcc0,	loop_1974
	fmovspos	%xcc,	%f2,	%f6
	fbg	%fcc0,	loop_1975
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1974:
	edge32ln	%o7,	%l4,	%l1
	fmovsleu	%icc,	%f3,	%f31
loop_1975:
	edge8n	%g6,	%l2,	%g2
	nop
	fitod	%f6,	%f10
	fdtox	%f10,	%f16
	brlz,a	%i3,	loop_1976
	orncc	%o4,	%o5,	%i6
	andncc	%i0,	%g5,	%o6
	mova	%icc,	%i1,	%l5
loop_1976:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udiv	%g3,	0x02AE,	%i5
	fmovsleu	%icc,	%f2,	%f0
	addcc	%g7,	0x1BC1,	%o0
	wr	%g0,	0x80,	%asi
	ldstuba	[%l7 + 0x08] %asi,	%l3
	nop
	set	0x60, %o2
	ldub	[%l7 + %o2],	%i4
	move	%icc,	%i2,	%o1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movpos	%icc,	%i7,	%g1
	movleu	%xcc,	%g4,	%o3
	set	0x20, %o6
	ldda	[%l7 + %o6] 0x19,	%i6
	wr	%g0,	0x18,	%asi
	lduba	[%l7 + 0x6D] %asi,	%o2
	movpos	%xcc,	%l0,	%o7
	brgez,a	%l1,	loop_1977
	tpos	%xcc,	0x3
	and	%g6,	0x09A8,	%l2
	movgu	%icc,	%g2,	%i3
loop_1977:
	edge16l	%o4,	%l4,	%o5
	fmovsle	%icc,	%f20,	%f9
	fmovdpos	%icc,	%f15,	%f1
	fmul8x16	%f2,	%f12,	%f28
	edge32	%i6,	%g5,	%o6
	tle	%xcc,	0x7
	nop
	setx	loop_1978,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	srlx	%i0,	%i1,	%g3
	fexpand	%f31,	%f4
	orcc	%i5,	%g7,	%l5
loop_1978:
	tvc	%icc,	0x5
	edge32ln	%o0,	%i4,	%i2
	set	0x40, %g4
	swapa	[%l7 + %g4] 0x0c,	%l3
	bvs	loop_1979
	fmovdg	%icc,	%f15,	%f16
	brz	%i7,	loop_1980
	fpadd32	%f30,	%f10,	%f16
loop_1979:
	sllx	%g1,	%o1,	%g4
	set	0x40, %l1
	stda	%f16,	[%l7 + %l1] 0x16
	membar	#Sync
loop_1980:
	bl,a,pn	%xcc,	loop_1981
	movcs	%icc,	%l6,	%o2
	edge32ln	%l0,	%o3,	%l1
	nop
	setx	0x758C5BD8,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f30
	setx	0x9FFC55FA,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f6
	fmuls	%f6,	%f30,	%f6
loop_1981:
	fmovsge	%icc,	%f6,	%f20
	xnor	%g6,	0x0383,	%o7
	bne,pn	%xcc,	loop_1982
	movle	%xcc,	%l2,	%i3
	sethi	0x070D,	%g2
	nop
	setx	loop_1983,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_1982:
	edge8n	%o4,	%o5,	%i6
	add	%l7,	0x10,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%l4
	casxa	[%l6] 0x88,	%l4,	%g5
loop_1983:
	edge8l	%o6,	%i1,	%g3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0xe2,	%asi
	stba	%i5,	[%l7 + 0x45] %asi
	membar	#Sync
	sdiv	%g7,	0x1CD1,	%l5
	movre	%i0,	%o0,	%i2
	movn	%icc,	%l3,	%i4
	pdist	%f28,	%f12,	%f18
	nop
	setx	0xED2C27646241D8F4,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0x8E88FC4D5CF4FC97,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	faddd	%f4,	%f30,	%f26
	tg	%xcc,	0x6
	pdist	%f18,	%f4,	%f18
	edge16ln	%i7,	%g1,	%o1
	brnz	%l6,	loop_1984
	sir	0x045D
	orn	%g4,	%l0,	%o3
	orncc	%l1,	%g6,	%o7
loop_1984:
	brnz,a	%o2,	loop_1985
	and	%l2,	%g2,	%o4
	movleu	%xcc,	%i3,	%o5
	ldsw	[%l7 + 0x18],	%l4
loop_1985:
	xnor	%i6,	0x0221,	%o6
	fble	%fcc0,	loop_1986
	movle	%icc,	%g5,	%i1
	popc	%g3,	%i5
	bge,a,pn	%icc,	loop_1987
loop_1986:
	movrlz	%l5,	%g7,	%o0
	movrlez	%i2,	%l3,	%i0
	fmovdn	%xcc,	%f13,	%f6
loop_1987:
	fblg,a	%fcc1,	loop_1988
	fnot2	%f22,	%f6
	fba,a	%fcc0,	loop_1989
	andncc	%i4,	%i7,	%g1
loop_1988:
	nop
	fitos	%f6,	%f1
	fstox	%f1,	%f2
	fxtos	%f2,	%f8
	fmovsvs	%icc,	%f15,	%f22
loop_1989:
	membar	0x66
	fmovrsgz	%l6,	%f14,	%f23
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
	fmovrsgez	%o1,	%f18,	%f16
	nop
	setx	0x9CC4ACE188619C7A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0x77F0E9C1A15EA3E2,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	fsubd	%f28,	%f6,	%f0
	fmovdl	%icc,	%f22,	%f17
loop_1990:
	movgu	%xcc,	%g4,	%l0
	popc	0x1A52,	%o3
	movne	%icc,	%g6,	%o7
	brnz,a	%o2,	loop_1991
	fmovsle	%icc,	%f28,	%f0
	array8	%l1,	%l2,	%o4
	srlx	%g2,	0x08,	%i3
loop_1991:
	nop
	wr	%g0,	0x0c,	%asi
	lduba	[%l7 + 0x1C] %asi,	%o5
	ta	%icc,	0x0
	nop
	fitod	%f18,	%f14
	brlz,a	%i6,	loop_1992
	ldub	[%l7 + 0x74],	%l4
	sll	%o6,	0x08,	%g5
	srlx	%i1,	%g3,	%i5
loop_1992:
	fmovdcs	%xcc,	%f19,	%f4
	brgez	%g7,	loop_1993
	alignaddr	%l5,	%o0,	%i2
	fpsub16	%f30,	%f0,	%f14
	tneg	%icc,	0x0
loop_1993:
	sir	0x0B65
	tcs	%xcc,	0x2
	fmovdcc	%xcc,	%f15,	%f22
	ble,pn	%xcc,	loop_1994
	fmovdgu	%xcc,	%f15,	%f15
	edge8n	%l3,	%i4,	%i0
	bne,pn	%xcc,	loop_1995
loop_1994:
	brz	%g1,	loop_1996
	tpos	%icc,	0x3
	edge8l	%i7,	%l6,	%g4
loop_1995:
	ldsb	[%l7 + 0x41],	%l0
loop_1996:
	bvc,pt	%icc,	loop_1997
	ldd	[%l7 + 0x60],	%f6
	tn	%xcc,	0x6
	movneg	%icc,	%o3,	%o1
loop_1997:
	st	%f15,	[%l7 + 0x30]
	fandnot2s	%f9,	%f27,	%f5
	set	0x18, %i2
	prefetcha	[%l7 + %i2] 0x19,	 0x3
	taddcctv	%o2,	%l1,	%g6
	or	%o4,	%l2,	%i3
	sethi	0x1FCE,	%o5
	sra	%i6,	%g2,	%l4
	add	%g5,	%i1,	%o6
	fcmpeq16	%f14,	%f12,	%i5
	fbule,a	%fcc2,	loop_1998
	movpos	%icc,	%g3,	%l5
	nop
	setx loop_1999, %l0, %l1
	jmpl %l1, %g7
	movcs	%icc,	%o0,	%i2
loop_1998:
	orcc	%l3,	%i0,	%i4
	sethi	0x0B52,	%g1
loop_1999:
	movvs	%xcc,	%l6,	%g4
	sethi	0x01AA,	%i7
	movleu	%icc,	%o3,	%o1
	edge16	%o7,	%o2,	%l1
	lduw	[%l7 + 0x5C],	%g6
	ldd	[%l7 + 0x28],	%f20
	set	0x58, %l0
	swapa	[%l7 + %l0] 0x10,	%o4
	srax	%l2,	%l0,	%o5
	sdivx	%i3,	0x0636,	%g2
	ble,a	loop_2000
	tg	%icc,	0x4
	addcc	%i6,	%g5,	%l4
	fbg	%fcc3,	loop_2001
loop_2000:
	brlez,a	%i1,	loop_2002
	fcmpgt16	%f30,	%f24,	%i5
	tvc	%xcc,	0x4
loop_2001:
	nop
	add	%l7,	0x38,	%l6
	wr	%g0,	0x10,	%asi
	ldxa	[%l6] %asi,	%o6
	casxa	[%l6] 0x10,	%o6,	%l5
loop_2002:
	umulcc	%g7,	0x0B91,	%o0
	movrlez	%g3,	0x24D,	%l3
	bneg,a,pn	%xcc,	loop_2003
	movrlz	%i2,	%i0,	%g1
	edge16ln	%l6,	%g4,	%i4
	tneg	%xcc,	0x1
loop_2003:
	tg	%xcc,	0x6
	fmovrsgez	%o3,	%f17,	%f3
	edge16	%o1,	%i7,	%o7
	orncc	%o2,	%l1,	%o4
	sllx	%l2,	0x01,	%l0
	edge32ln	%g6,	%i3,	%o5
	sra	%i6,	%g5,	%g2
	stw	%l4,	[%l7 + 0x1C]
	ta	%xcc,	0x1
	bcc,pn	%icc,	loop_2004
	andn	%i1,	0x0697,	%o6
	move	%xcc,	%i5,	%l5
	andn	%g7,	0x1D8E,	%o0
loop_2004:
	xnorcc	%g3,	%i2,	%i0
	tsubcctv	%g1,	%l3,	%g4
	mulscc	%i4,	0x104A,	%o3
	movneg	%icc,	%l6,	%i7
	taddcc	%o7,	0x1E69,	%o2
	tcc	%icc,	0x2
	tg	%xcc,	0x5
	addc	%o1,	0x0C47,	%l1
	be,pn	%xcc,	loop_2005
	xnor	%l2,	%l0,	%g6
	array8	%o4,	%i3,	%i6
	xor	%o5,	%g2,	%l4
loop_2005:
	edge32l	%i1,	%g5,	%i5
	bcs,a	loop_2006
	tvc	%xcc,	0x1
	fmovsvs	%xcc,	%f0,	%f1
	fblg	%fcc2,	loop_2007
loop_2006:
	movcc	%xcc,	%l5,	%o6
	edge32	%o0,	%g7,	%i2
	fble	%fcc3,	loop_2008
loop_2007:
	subccc	%i0,	0x0107,	%g1
	nop
	setx	0x1AB290E37BF54ACC,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0xFFF4EF076855FCCD,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fsubd	%f0,	%f10,	%f8
	fmovsleu	%xcc,	%f11,	%f1
loop_2008:
	movleu	%icc,	%l3,	%g3
	udiv	%i4,	0x00C0,	%o3
	xnor	%l6,	%i7,	%g4
	movrlz	%o7,	0x0F3,	%o2
	be,pn	%xcc,	loop_2009
	fxors	%f17,	%f17,	%f2
	edge32n	%l1,	%o1,	%l2
	ldd	[%l7 + 0x58],	%f8
loop_2009:
	fmovsvc	%icc,	%f18,	%f21
	orncc	%l0,	0x13FA,	%o4
	andn	%i3,	0x0EC4,	%i6
	movneg	%icc,	%o5,	%g2
	fmovrsne	%l4,	%f10,	%f9
	fmovsge	%icc,	%f9,	%f29
	xor	%g6,	0x11E2,	%i1
	brgz,a	%i5,	loop_2010
	and	%g5,	0x1144,	%l5
	tsubcc	%o0,	0x0C16,	%g7
	stw	%i2,	[%l7 + 0x60]
loop_2010:
	edge8n	%i0,	%g1,	%o6
	set	0x40, %g7
	ldda	[%l7 + %g7] 0x18,	%f0
	or	%g3,	0x026D,	%l3
	ldd	[%l7 + 0x50],	%f18
	fbue	%fcc3,	loop_2011
	fcmpeq32	%f22,	%f16,	%i4
	fornot2	%f8,	%f26,	%f4
	mulscc	%l6,	0x1508,	%o3
loop_2011:
	tcc	%xcc,	0x1
	array32	%i7,	%o7,	%g4
	srl	%o2,	0x02,	%l1
	nop
	setx	loop_2012,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movrlz	%l2,	0x2AB,	%l0
	nop
	fitos	%f12,	%f13
	fstox	%f13,	%f28
	fxtos	%f28,	%f28
	add	%l7,	0x08,	%l6
	wr	%g0,	0x18,	%asi
	casxa	[%l6] %asi,	%o1,	%o4
loop_2012:
	nop
	setx	0x5EC2DABAA0571AB1,	%l0,	%l6
	stx	%l6,	[%l7 + 0x70]
	ldx	[%l7 + 0x70],	%fsr
	udivcc	%i3,	0x00CC,	%i6
	nop
	setx	0x7C3C4D21,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f3
	setx	0x26D8EF9B,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f1
	fadds	%f1,	%f3,	%f22
	tl	%xcc,	0x3
	ldub	[%l7 + 0x52],	%o5
	movle	%icc,	%g2,	%g6
	edge16l	%i1,	%i5,	%l4
	tn	%icc,	0x3
	nop
	setx	loop_2013,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fmovse	%icc,	%f29,	%f22
	bneg,pt	%icc,	loop_2014
	ble,pt	%xcc,	loop_2015
loop_2013:
	fmovsn	%xcc,	%f31,	%f23
	add	%l7,	0x14,	%l6
	wr	%g0,	0x04,	%asi
	casa	[%l6] %asi,	%l5,	%g5
loop_2014:
	movvs	%icc,	%o0,	%g7
loop_2015:
	fpadd16	%f10,	%f10,	%f6
	bg,pt	%icc,	loop_2016
	fmovsg	%icc,	%f5,	%f29
	tsubcctv	%i0,	0x0AAF,	%i2
	nop
	set	0x60, %l4
	prefetch	[%l7 + %l4],	 0x0
loop_2016:
	edge8l	%o6,	%g3,	%l3
	movpos	%xcc,	%g1,	%i4
	bleu,a	loop_2017
	tge	%icc,	0x4
	fmovsneg	%icc,	%f4,	%f1
	set	0x18, %i0
	ldxa	[%g0 + %i0] 0x58,	%o3
loop_2017:
	or	%l6,	%o7,	%g4
	mulx	%i7,	%l1,	%l2
	orcc	%l0,	0x15EA,	%o1
	bshuffle	%f8,	%f6,	%f24
	fmovdcc	%xcc,	%f23,	%f25
	bleu	%icc,	loop_2018
	edge32	%o4,	%i3,	%i6
	edge8n	%o5,	%o2,	%g2
	brgz	%i1,	loop_2019
loop_2018:
	nop
	fitos	%f6,	%f19
	fstod	%f19,	%f10
	lduh	[%l7 + 0x7C],	%g6
	fbuge	%fcc3,	loop_2020
loop_2019:
	sra	%i5,	0x0F,	%l4
	faligndata	%f12,	%f22,	%f14
	membar	0x41
loop_2020:
	tleu	%xcc,	0x5
	alignaddr	%l5,	%o0,	%g7
	wr	%g0,	0x27,	%asi
	stwa	%g5,	[%l7 + 0x7C] %asi
	membar	#Sync
	fba,a	%fcc0,	loop_2021
	udiv	%i2,	0x0B6C,	%o6
	andncc	%i0,	%l3,	%g1
	fpsub32s	%f22,	%f3,	%f22
loop_2021:
	fbuge,a	%fcc3,	loop_2022
	sll	%i4,	0x00,	%g3
	sethi	0x09EC,	%o3
	tle	%icc,	0x5
loop_2022:
	movn	%xcc,	%o7,	%l6
	movvc	%xcc,	%i7,	%l1
	xnorcc	%g4,	0x0311,	%l0
	fmovsl	%xcc,	%f20,	%f14
	fabss	%f25,	%f9
	sllx	%o1,	%o4,	%i3
	addccc	%l2,	%i6,	%o5
	fzeros	%f25
	wr	%g0,	0x17,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
	edge32l	%o2,	%i1,	%g6
	umulcc	%i5,	%g2,	%l4
	fmovsvc	%xcc,	%f13,	%f13
	membar	0x79
	nop
	fitos	%f25,	%f28
	umulcc	%l5,	%o0,	%g7
	fandnot2s	%f19,	%f27,	%f7
	fxors	%f7,	%f29,	%f4
	fbug	%fcc0,	loop_2023
	smul	%i2,	%o6,	%i0
	add	%l3,	%g1,	%i4
	sra	%g5,	%o3,	%g3
loop_2023:
	call	loop_2024
	nop
	setx loop_2025, %l0, %l1
	jmpl %l1, %o7
	movle	%icc,	%i7,	%l1
	nop
	fitod	%f8,	%f12
	fdtoi	%f12,	%f11
loop_2024:
	ld	[%l7 + 0x6C],	%f27
loop_2025:
	movvc	%xcc,	%g4,	%l6
	taddcctv	%o1,	0x16B4,	%l0
	tl	%icc,	0x4
	wr	%g0,	0x19,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	smul	%o4,	%i3,	%l2
	tne	%icc,	0x7
	edge8	%i6,	%o5,	%i1
	set	0x68, %o5
	ldswa	[%l7 + %o5] 0x81,	%o2
	move	%xcc,	%i5,	%g2
	mova	%xcc,	%g6,	%l5
	fnot2	%f30,	%f22
	fmovsneg	%icc,	%f16,	%f17
	movg	%icc,	%o0,	%l4
	movvs	%xcc,	%g7,	%i2
	sllx	%i0,	0x1C,	%l3
	srlx	%g1,	0x0A,	%i4
	sethi	0x1FD0,	%g5
	movcc	%icc,	%o3,	%o6
	movcs	%xcc,	%o7,	%i7
	taddcc	%l1,	%g4,	%l6
	tle	%xcc,	0x6
	fbge,a	%fcc1,	loop_2026
	fmuld8sux16	%f4,	%f5,	%f30
	ldub	[%l7 + 0x3D],	%g3
	movrne	%o1,	0x1D7,	%o4
loop_2026:
	or	%l0,	0x0C38,	%l2
	movcc	%icc,	%i6,	%o5
	sdivx	%i1,	0x0AED,	%o2
	set	0x4E, %i1
	stba	%i3,	[%l7 + %i1] 0xeb
	membar	#Sync
	smulcc	%i5,	0x1AF0,	%g6
	popc	0x073D,	%l5
	mulx	%o0,	0x0710,	%g2
	smulcc	%g7,	0x0EBF,	%i2
	wr	%g0,	0x80,	%asi
	sta	%f8,	[%l7 + 0x54] %asi
	ldd	[%l7 + 0x48],	%l4
	sth	%i0,	[%l7 + 0x78]
	nop
	setx	loop_2027,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movle	%xcc,	%g1,	%l3
	fmovrdgz	%g5,	%f12,	%f12
	fbl	%fcc3,	loop_2028
loop_2027:
	umul	%i4,	%o6,	%o3
	movrlez	%i7,	0x298,	%o7
	stbar
loop_2028:
	array32	%l1,	%g4,	%l6
	movle	%xcc,	%o1,	%o4
	subccc	%l0,	0x1B55,	%l2
	orn	%i6,	0x14CE,	%g3
	andncc	%o5,	%i1,	%i3
	add	%l7,	0x40,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%o2,	%i5
	faligndata	%f18,	%f6,	%f0
	tg	%icc,	0x5
	movrlz	%g6,	0x1D5,	%o0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x0c,	%asi
	ldsba	[%l7 + 0x22] %asi,	%g2
	fmovdpos	%xcc,	%f26,	%f7
	ba	loop_2029
	tsubcc	%l5,	%i2,	%l4
	nop
	fitos	%f0,	%f7
	fstox	%f7,	%f26
	tneg	%xcc,	0x1
loop_2029:
	fandnot2	%f18,	%f8,	%f12
	smul	%i0,	0x1073,	%g7
	set	0x58, %i7
	lduha	[%l7 + %i7] 0x81,	%g1
	andncc	%g5,	%l3,	%o6
	ldsb	[%l7 + 0x3B],	%i4
	addccc	%o3,	%o7,	%i7
	subc	%l1,	0x12D1,	%g4
	fmovscc	%icc,	%f10,	%f18
	edge16ln	%o1,	%o4,	%l0
	nop
	setx	0x507F5FA1,	%l0,	%l6
	st	%l6,	[%l7 + 0x1C]
	ld	[%l7 + 0x1C],	%fsr
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16n	%l6,	%i6,	%l2
	fba,a	%fcc3,	loop_2030
	movg	%icc,	%g3,	%i1
	fmovrdlez	%i3,	%f22,	%f16
	tneg	%icc,	0x0
loop_2030:
	fbue,a	%fcc3,	loop_2031
	fmul8x16al	%f11,	%f11,	%f8
	taddcctv	%o5,	0x10B6,	%i5
	movvc	%xcc,	%g6,	%o2
loop_2031:
	sir	0x1C27
	ldstub	[%l7 + 0x51],	%g2
	movg	%icc,	%l5,	%i2
	edge32ln	%o0,	%i0,	%l4
	bcc,a	loop_2032
	ld	[%l7 + 0x68],	%f22
	edge8n	%g7,	%g1,	%g5
	array16	%l3,	%i4,	%o3
loop_2032:
	fmovsle	%icc,	%f10,	%f22
	xnor	%o6,	0x1523,	%o7
	edge32ln	%i7,	%g4,	%l1
	bpos	%icc,	loop_2033
	movre	%o1,	0x1ED,	%l0
	or	%o4,	0x0889,	%i6
	add	%l7,	0x60,	%l6
	wr	%g0,	0x10,	%asi
	ldxa	[%l6] %asi,	%l2
	casxa	[%l6] %asi,	%l2,	%g3
loop_2033:
	move	%icc,	%i1,	%l6
	tsubcctv	%o5,	%i5,	%i3
	fmovsgu	%icc,	%f6,	%f8
	nop
	setx	0x57E306AE781F412D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0x639DAF832688EE41,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	fmuld	%f12,	%f2,	%f10
	tl	%icc,	0x1
	fpack16	%f12,	%f21
	fbne,a	%fcc3,	loop_2034
	xnorcc	%o2,	0x1211,	%g2
	fmovdpos	%icc,	%f17,	%f8
	tvc	%icc,	0x0
loop_2034:
	orncc	%l5,	%g6,	%o0
	orn	%i0,	%l4,	%g7
	fabsd	%f14,	%f24
	nop
	fitos	%f7,	%f31
	fstod	%f31,	%f18
	addccc	%g1,	0x1E80,	%i2
	fmovsa	%xcc,	%f26,	%f0
	edge16ln	%l3,	%g5,	%o3
	nop
	fitod	%f8,	%f26
	fdtos	%f26,	%f24
	nop
	set	0x64, %o7
	sth	%i4,	[%l7 + %o7]
	fmovdvs	%xcc,	%f2,	%f17
	tcc	%xcc,	0x1
	ble,pt	%icc,	loop_2035
	edge32	%o6,	%o7,	%g4
	addc	%l1,	%i7,	%l0
	tgu	%icc,	0x3
loop_2035:
	tpos	%icc,	0x0
	fmovsgu	%xcc,	%f27,	%f29
	or	%o4,	0x15D8,	%o1
	wr	%g0,	0x18,	%asi
	lduba	[%l7 + 0x6B] %asi,	%i6
	wr	%g0,	0x89,	%asi
	ldsba	[%l7 + 0x5C] %asi,	%g3
	tcs	%icc,	0x6
	bne	%icc,	loop_2036
	ba,pt	%xcc,	loop_2037
	add	%l2,	%l6,	%o5
	flush	%l7 + 0x38
loop_2036:
	fmovrde	%i5,	%f8,	%f12
loop_2037:
	movl	%xcc,	%i1,	%i3
	fmul8x16al	%f17,	%f12,	%f8
	movre	%o2,	%g2,	%l5
	fbo,a	%fcc3,	loop_2038
	mova	%icc,	%o0,	%i0
	bl,a,pn	%xcc,	loop_2039
	movrlez	%g6,	0x10C,	%g7
loop_2038:
	nop
	setx	0x904F452E,	%l0,	%l6
	st	%l6,	[%l7 + 0x0C]
	ld	[%l7 + 0x0C],	%fsr
	nop
	setx loop_2040, %l0, %l1
	jmpl %l1, %l4
loop_2039:
	call	loop_2041
	fmul8x16au	%f27,	%f1,	%f20
	fpsub16s	%f0,	%f21,	%f9
loop_2040:
	umul	%i2,	%l3,	%g5
loop_2041:
	nop
	set	0x1C, %o1
	stwa	%o3,	[%l7 + %o1] 0xe3
	membar	#Sync
	edge32l	%i4,	%o6,	%g1
	fcmpgt16	%f22,	%f10,	%g4
	udivx	%l1,	0x0028,	%o7
	st	%f17,	[%l7 + 0x0C]
	fbug,a	%fcc2,	loop_2042
	orcc	%l0,	0x0546,	%i7
	tsubcc	%o4,	0x12DD,	%i6
	fmovrde	%g3,	%f18,	%f24
loop_2042:
	edge32	%o1,	%l6,	%o5
	fmovd	%f8,	%f8
	movrlez	%i5,	0x0A2,	%l2
	fmuld8ulx16	%f11,	%f18,	%f22
	wr	%g0,	0x11,	%asi
	swapa	[%l7 + 0x78] %asi,	%i3
	membar	0x4B
	stx	%o2,	[%l7 + 0x40]
	nop
	setx	0x6067BE22,	%l0,	%l6
	st	%l6,	[%l7 + 0x40]
	ld	[%l7 + 0x40],	%fsr
	fandnot1	%f20,	%f18,	%f14
	movvc	%icc,	%i1,	%l5
	nop
	fitos	%f9,	%f18
	fstoi	%f18,	%f30
	fbul	%fcc0,	loop_2043
	fcmpne32	%f8,	%f0,	%g2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsne	%icc,	%f13,	%f6
loop_2043:
	tn	%xcc,	0x5
	wr	%g0,	0x80,	%asi
	swapa	[%l7 + 0x78] %asi,	%o0
	srl	%g6,	0x06,	%i0
	wr	%g0,	0x80,	%asi
	lduwa	[%l7 + 0x5C] %asi,	%g7
	bpos,pn	%xcc,	loop_2044
	movgu	%xcc,	%l4,	%l3
	movge	%icc,	%i2,	%o3
	fmovrslz	%i4,	%f25,	%f14
loop_2044:
	nop
	fitos	%f10,	%f1
	fstox	%f1,	%f24
	fxtos	%f24,	%f18
	tpos	%icc,	0x4
	sir	0x1F87
	xnorcc	%g5,	%g1,	%g4
	fpadd32s	%f22,	%f7,	%f30
	fsrc1	%f6,	%f4
	tl	%icc,	0x2
	sllx	%l1,	%o6,	%l0
	movrgez	%o7,	%o4,	%i6
	move	%icc,	%g3,	%o1
	fandnot2s	%f2,	%f24,	%f25
	fcmple16	%f6,	%f28,	%i7
	sdiv	%o5,	0x09A9,	%l6
	smul	%l2,	%i3,	%o2
	fnot1s	%f28,	%f15
	addc	%i1,	0x04E3,	%l5
	mova	%icc,	%i5,	%o0
	umulcc	%g6,	0x1B2C,	%i0
	orcc	%g2,	%g7,	%l3
	xnor	%l4,	0x18A2,	%o3
	mova	%icc,	%i2,	%g5
	popc	%i4,	%g4
	tge	%xcc,	0x2
	bneg	%icc,	loop_2045
	tne	%xcc,	0x7
	edge32l	%l1,	%o6,	%g1
	fbe,a	%fcc1,	loop_2046
loop_2045:
	ta	%icc,	0x6
	udivx	%o7,	0x1EFD,	%o4
	fabss	%f30,	%f20
loop_2046:
	nop
	set	0x21, %g3
	ldsba	[%l7 + %g3] 0x10,	%l0
	be	loop_2047
	tvc	%icc,	0x6
	ldsb	[%l7 + 0x61],	%g3
	movge	%icc,	%o1,	%i7
loop_2047:
	nop
	set	0x53, %g6
	ldsb	[%l7 + %g6],	%i6
	set	0x18, %o3
	prefetcha	[%l7 + %o3] 0x81,	 0x2
	nop
	set	0x36, %i6
	ldsh	[%l7 + %i6],	%o5
	edge32l	%i3,	%l2,	%i1
	st	%f4,	[%l7 + 0x34]
	sdivx	%l5,	0x1E68,	%o2
	orcc	%i5,	0x1245,	%g6
	fcmple32	%f0,	%f10,	%o0
	wr	%g0,	0x81,	%asi
	sta	%f13,	[%l7 + 0x74] %asi
	edge16l	%i0,	%g2,	%g7
	movneg	%icc,	%l4,	%l3
	fbg,a	%fcc1,	loop_2048
	tgu	%icc,	0x1
	xorcc	%o3,	0x0733,	%g5
	fpsub32s	%f20,	%f0,	%f0
loop_2048:
	membar	0x1F
	fmul8ulx16	%f12,	%f8,	%f2
	edge8ln	%i2,	%g4,	%i4
	nop
	setx	loop_2049,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	sdivx	%o6,	0x05DA,	%l1
	fbl,a	%fcc1,	loop_2050
	fmovrse	%o7,	%f3,	%f8
loop_2049:
	tsubcctv	%g1,	0x1955,	%l0
	fbo	%fcc1,	loop_2051
loop_2050:
	xorcc	%g3,	%o1,	%o4
	fcmpgt32	%f30,	%f6,	%i7
	edge32ln	%i6,	%l6,	%i3
loop_2051:
	movvc	%xcc,	%o5,	%l2
	stx	%i1,	[%l7 + 0x48]
	brgz,a	%o2,	loop_2052
	fmovs	%f0,	%f2
	fmovse	%xcc,	%f11,	%f7
	tsubcc	%i5,	0x15BD,	%l5
loop_2052:
	nop
	setx loop_2053, %l0, %l1
	jmpl %l1, %g6
	stw	%o0,	[%l7 + 0x0C]
	set	0x14, %o0
	stha	%g2,	[%l7 + %o0] 0xea
	membar	#Sync
loop_2053:
	fcmple16	%f24,	%f6,	%g7
	xorcc	%i0,	%l3,	%l4
	alignaddrl	%g5,	%o3,	%i2
	movrgez	%g4,	0x0D3,	%i4
	popc	%o6,	%l1
	movcc	%icc,	%o7,	%g1
	fbg	%fcc2,	loop_2054
	te	%icc,	0x3
	set	0x30, %l2
	ldda	[%l7 + %l2] 0x80,	%l0
loop_2054:
	fblg,a	%fcc0,	loop_2055
	umul	%o1,	%o4,	%g3
	smul	%i7,	%i6,	%i3
	subc	%l6,	%l2,	%o5
loop_2055:
	edge16l	%o2,	%i1,	%l5
	subccc	%i5,	0x04A7,	%g6
	nop
	setx	0xF50CC97F,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f30
	fsqrts	%f30,	%f13
	fmovrdgz	%o0,	%f2,	%f12
	xnor	%g7,	%i0,	%g2
	taddcctv	%l4,	%g5,	%l3
	fmul8x16	%f25,	%f8,	%f8
	edge8n	%o3,	%i2,	%i4
	movrne	%o6,	0x007,	%g4
	fbule	%fcc3,	loop_2056
	addc	%o7,	%l1,	%l0
	xnor	%g1,	%o4,	%o1
	set	0x64, %g1
	sta	%f8,	[%l7 + %g1] 0x89
loop_2056:
	movne	%xcc,	%i7,	%g3
	sir	0x0740
	lduh	[%l7 + 0x34],	%i3
	movcc	%icc,	%l6,	%l2
	brlz	%i6,	loop_2057
	subcc	%o5,	%o2,	%i1
	fxors	%f0,	%f21,	%f29
	stx	%i5,	[%l7 + 0x78]
loop_2057:
	fcmple16	%f2,	%f10,	%l5
	movneg	%icc,	%g6,	%g7
	ba,pt	%icc,	loop_2058
	xor	%o0,	0x05B5,	%i0
	movleu	%icc,	%l4,	%g5
	wr	%g0,	0x11,	%asi
	ldswa	[%l7 + 0x1C] %asi,	%g2
loop_2058:
	be,a	%xcc,	loop_2059
	tleu	%xcc,	0x5
	sllx	%o3,	%i2,	%i4
	smulcc	%l3,	%g4,	%o6
loop_2059:
	subc	%o7,	0x0AC9,	%l1
	srax	%g1,	%o4,	%o1
	sll	%i7,	%l0,	%i3
	sll	%g3,	%l6,	%l2
	orcc	%o5,	0x1FCE,	%o2
	subcc	%i1,	%i6,	%l5
	tg	%xcc,	0x6
	movle	%icc,	%i5,	%g6
	orncc	%g7,	0x1CB1,	%i0
	fbn,a	%fcc3,	loop_2060
	fmovrsgz	%o0,	%f10,	%f11
	udiv	%g5,	0x04D8,	%l4
	tle	%xcc,	0x6
loop_2060:
	srax	%o3,	%i2,	%i4
	std	%f18,	[%l7 + 0x60]
	std	%f12,	[%l7 + 0x60]
	ldx	[%l7 + 0x28],	%g2
	umulcc	%g4,	0x0646,	%o6
	edge8n	%l3,	%l1,	%g1
	brnz	%o7,	loop_2061
	sra	%o1,	0x00,	%i7
	set	0x3A, %i4
	ldstuba	[%l7 + %i4] 0x18,	%o4
loop_2061:
	tleu	%icc,	0x4
	mova	%icc,	%i3,	%g3
	xorcc	%l6,	%l2,	%l0
	sir	0x0569
	swap	[%l7 + 0x78],	%o2
	xnor	%i1,	%o5,	%i6
	movpos	%icc,	%l5,	%i5
	fbne	%fcc2,	loop_2062
	mova	%xcc,	%g6,	%g7
	nop
	fitod	%f10,	%f12
	fdtox	%f12,	%f30
	fxtod	%f30,	%f22
	ldub	[%l7 + 0x69],	%o0
loop_2062:
	movl	%xcc,	%g5,	%l4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	brgz	%o3,	loop_2063
	fxnors	%f20,	%f24,	%f31
	edge16n	%i2,	%i0,	%i4
	fmul8ulx16	%f20,	%f16,	%f20
loop_2063:
	std	%f16,	[%l7 + 0x10]
	fbul	%fcc3,	loop_2064
	array8	%g4,	%o6,	%l3
	tge	%icc,	0x2
	fbge	%fcc3,	loop_2065
loop_2064:
	edge32n	%l1,	%g1,	%o7
	ldx	[%l7 + 0x70],	%o1
	movn	%xcc,	%g2,	%o4
loop_2065:
	taddcc	%i3,	0x1C69,	%i7
	ldsw	[%l7 + 0x18],	%g3
	wr	%g0,	0xe2,	%asi
	stha	%l6,	[%l7 + 0x10] %asi
	membar	#Sync
	orncc	%l2,	%o2,	%i1
	fble	%fcc3,	loop_2066
	tge	%xcc,	0x6
	fpsub16	%f12,	%f14,	%f6
	edge32	%o5,	%l0,	%i6
loop_2066:
	movrgz	%i5,	%l5,	%g7
	fexpand	%f9,	%f30
	andcc	%g6,	%g5,	%o0
	tcs	%icc,	0x3
	membar	0x5E
	alignaddrl	%o3,	%l4,	%i2
	tsubcc	%i0,	%g4,	%i4
	wr	%g0,	0x04,	%asi
	stwa	%o6,	[%l7 + 0x30] %asi
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbe	%fcc3,	loop_2067
	for	%f28,	%f12,	%f26
	mulscc	%l3,	%l1,	%g1
	or	%o1,	%g2,	%o4
loop_2067:
	nop
	wr	%g0,	0x04,	%asi
	ldstuba	[%l7 + 0x78] %asi,	%o7
	sir	0x186D
	array16	%i3,	%g3,	%i7
	movrgz	%l6,	%o2,	%l2
	bcs,pn	%xcc,	loop_2068
	flush	%l7 + 0x78
	fzeros	%f6
	sethi	0x137B,	%i1
loop_2068:
	fzero	%f6
	umulcc	%l0,	%o5,	%i5
	movrgez	%l5,	0x25C,	%g7
	andncc	%g6,	%i6,	%o0
	fnors	%f5,	%f10,	%f13
	and	%g5,	%o3,	%l4
	ld	[%l7 + 0x14],	%f3
	movle	%xcc,	%i2,	%i0
	subcc	%i4,	%o6,	%l3
	ldstub	[%l7 + 0x24],	%l1
	add	%l7,	0x28,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%g1,	%g4
	alignaddr	%o1,	%g2,	%o7
	nop
	set	0x1C, %l5
	lduh	[%l7 + %l5],	%o4
	edge32ln	%g3,	%i7,	%i3
	movle	%xcc,	%l6,	%l2
	movvs	%icc,	%i1,	%l0
	fbg,a	%fcc3,	loop_2069
	bvc,a,pt	%xcc,	loop_2070
	swap	[%l7 + 0x14],	%o2
	membar	0x23
loop_2069:
	movpos	%xcc,	%i5,	%l5
loop_2070:
	smul	%g7,	%g6,	%o5
	taddcc	%o0,	%i6,	%g5
	fmovrde	%l4,	%f14,	%f18
	te	%icc,	0x6
	array16	%o3,	%i0,	%i2
	movg	%icc,	%o6,	%l3
	taddcctv	%i4,	0x00EB,	%g1
	fmovsa	%icc,	%f22,	%f9
	nop
	setx	0xBF69CF3E843ABACB,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0xAFADD8FEEBA56E0A,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	fsubd	%f8,	%f12,	%f2
	fblg,a	%fcc2,	loop_2071
	ldsb	[%l7 + 0x71],	%g4
	fbl	%fcc2,	loop_2072
	fmovdl	%xcc,	%f31,	%f3
loop_2071:
	membar	0x5A
	or	%o1,	%l1,	%g2
loop_2072:
	andn	%o4,	%g3,	%o7
	taddcc	%i7,	%i3,	%l2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tg	%icc,	0x6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array16	%i1,	%l6,	%l0
	edge32	%i5,	%o2,	%l5
	smul	%g7,	%o5,	%g6
	nop
	fitos	%f14,	%f23
	fstoi	%f23,	%f15
	add	%i6,	0x1D58,	%g5
	orn	%o0,	0x01E8,	%o3
	subcc	%i0,	0x1B1D,	%i2
	movg	%xcc,	%o6,	%l4
	bge	%icc,	loop_2073
	faligndata	%f22,	%f10,	%f26
	fmovsg	%icc,	%f12,	%f15
	sub	%l3,	%g1,	%g4
loop_2073:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovda	%icc,	%f28,	%f4
	smulcc	%i4,	%o1,	%l1
	tleu	%xcc,	0x4
	fnot2	%f28,	%f24
	fmovrdgz	%o4,	%f4,	%f16
	fmovrdgz	%g2,	%f6,	%f26
	edge16	%o7,	%g3,	%i3
	wr	%g0,	0x04,	%asi
	prefetcha	[%l7 + 0x38] %asi,	 0x3
	sdivx	%i1,	0x0192,	%l6
	edge16ln	%l2,	%l0,	%i5
	movrgz	%l5,	%o2,	%g7
	xorcc	%o5,	%i6,	%g5
	mova	%xcc,	%g6,	%o0
	taddcctv	%o3,	0x098F,	%i0
	edge16n	%i2,	%l4,	%l3
	bn,pn	%icc,	loop_2074
	tleu	%xcc,	0x2
	movvc	%icc,	%g1,	%o6
	tsubcc	%i4,	%g4,	%o1
loop_2074:
	edge32l	%l1,	%g2,	%o4
	fcmpne16	%f10,	%f0,	%g3
	movl	%xcc,	%o7,	%i7
	fsrc2	%f10,	%f0
	movcc	%xcc,	%i3,	%l6
	fpsub32	%f4,	%f8,	%f4
	fmovsne	%icc,	%f25,	%f13
	fsrc1s	%f14,	%f7
	fmovdne	%icc,	%f2,	%f31
	movrlez	%l2,	0x196,	%l0
	fpack16	%f18,	%f27
	taddcctv	%i5,	%i1,	%o2
	fmovrdgez	%l5,	%f14,	%f18
	udivx	%o5,	0x0697,	%i6
	bne,a	%xcc,	loop_2075
	fandnot2s	%f18,	%f11,	%f3
	fandnot2	%f6,	%f30,	%f26
	nop
	setx	0x497FEB1CF05BB86C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x30]
	ldx	[%l7 + 0x30],	%fsr
loop_2075:
	movcc	%xcc,	%g7,	%g5
	movvs	%xcc,	%g6,	%o3
	movl	%xcc,	%o0,	%i0
	or	%i2,	%l4,	%g1
	srlx	%o6,	%l3,	%i4
	fsrc1	%f2,	%f2
	tle	%icc,	0x4
	wr	%g0,	0x10,	%asi
	lda	[%l7 + 0x4C] %asi,	%f25
	brgz	%g4,	loop_2076
	movl	%icc,	%o1,	%l1
	sra	%o4,	%g3,	%g2
	nop
	setx	0x164035B0,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f12
	setx	0xD56768B2,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f25
	fdivs	%f25,	%f12,	%f10
loop_2076:
	xnor	%o7,	0x016C,	%i3
	tpos	%icc,	0x1
	ble,pn	%icc,	loop_2077
	tne	%icc,	0x2
	bneg,a,pt	%xcc,	loop_2078
	movre	%l6,	%i7,	%l0
loop_2077:
	andcc	%l2,	0x1F41,	%i5
	addcc	%o2,	0x1439,	%l5
loop_2078:
	fmul8x16au	%f20,	%f29,	%f26
	tvs	%icc,	0x1
	sdiv	%o5,	0x0DA9,	%i1
	movre	%i6,	0x345,	%g5
	fones	%f16
	sethi	0x038A,	%g6
	fbuge,a	%fcc1,	loop_2079
	array16	%g7,	%o0,	%o3
	or	%i2,	%l4,	%g1
	sra	%o6,	0x18,	%l3
loop_2079:
	nop
	wr	%g0,	0xe2,	%asi
	stwa	%i4,	[%l7 + 0x5C] %asi
	membar	#Sync
	fbl	%fcc0,	loop_2080
	orncc	%i0,	0x0713,	%o1
	movn	%xcc,	%g4,	%o4
	movre	%l1,	%g2,	%o7
loop_2080:
	fmovsn	%xcc,	%f29,	%f31
	tl	%icc,	0x0
	edge16l	%i3,	%g3,	%l6
	set	0x40, %g2
	stda	%f0,	[%l7 + %g2] 0xf0
	membar	#Sync
	movvs	%xcc,	%l0,	%l2
	brgz	%i5,	loop_2081
	ta	%xcc,	0x6
	andn	%i7,	%l5,	%o2
	fmovrdlez	%o5,	%f10,	%f6
loop_2081:
	udiv	%i1,	0x0747,	%g5
	brgez,a	%i6,	loop_2082
	xnorcc	%g6,	%o0,	%o3
	sethi	0x0411,	%i2
	nop
	fitos	%f12,	%f15
	fstox	%f15,	%f20
	fxtos	%f20,	%f9
loop_2082:
	ldx	[%l7 + 0x50],	%g7
	ta	%xcc,	0x7
	ldsw	[%l7 + 0x54],	%l4
	ldsw	[%l7 + 0x5C],	%g1
	fmul8x16	%f22,	%f22,	%f4
	movle	%xcc,	%l3,	%i4
	fmovsleu	%xcc,	%f18,	%f9
	edge32	%o6,	%i0,	%o1
	add	%l7,	0x60,	%l6
	wr	%g0,	0x04,	%asi
	ldxa	[%l6] %asi,	%o4
	casxa	[%l6] %asi,	%o4,	%l1
	smulcc	%g2,	%g4,	%o7
	movge	%xcc,	%i3,	%l6
	movne	%icc,	%g3,	%l0
	be,pn	%icc,	loop_2083
	movvc	%xcc,	%l2,	%i5
	stb	%i7,	[%l7 + 0x1E]
	umulcc	%l5,	0x19A2,	%o2
loop_2083:
	fmuld8ulx16	%f25,	%f6,	%f20
	wr	%g0,	0x22,	%asi
	stha	%o5,	[%l7 + 0x6A] %asi
	membar	#Sync
	fmovdg	%icc,	%f17,	%f2
	fmovdg	%xcc,	%f22,	%f24
	tsubcctv	%g5,	0x057D,	%i1
	alignaddr	%i6,	%o0,	%o3
	fone	%f24
	fmovrslz	%g6,	%f29,	%f25
	tl	%icc,	0x7
	set	0x36, %g5
	lduha	[%l7 + %g5] 0x80,	%i2
	brlz,a	%g7,	loop_2084
	fpsub32s	%f22,	%f0,	%f12
	tne	%xcc,	0x5
	fmovsleu	%xcc,	%f2,	%f17
loop_2084:
	nop
	wr	%g0,	0x81,	%asi
	sta	%f8,	[%l7 + 0x58] %asi
	srl	%l4,	%g1,	%i4
	edge16l	%l3,	%o6,	%i0
	add	%o4,	0x0E71,	%l1
	tg	%xcc,	0x1
	te	%xcc,	0x2
	movge	%xcc,	%o1,	%g2
	fbuge,a	%fcc0,	loop_2085
	orcc	%o7,	0x02B2,	%i3
	edge8l	%g4,	%g3,	%l0
	lduh	[%l7 + 0x5E],	%l2
loop_2085:
	movcc	%icc,	%l6,	%i5
	bshuffle	%f26,	%f0,	%f6
	xor	%l5,	0x17D7,	%o2
	sllx	%o5,	%g5,	%i1
	xor	%i6,	%i7,	%o0
	mulscc	%g6,	0x043E,	%o3
	fblg,a	%fcc1,	loop_2086
	fmovrslz	%i2,	%f31,	%f12
	movge	%xcc,	%l4,	%g7
	fbul,a	%fcc2,	loop_2087
loop_2086:
	brlz	%i4,	loop_2088
	bleu	loop_2089
	ldx	[%l7 + 0x28],	%l3
loop_2087:
	ldd	[%l7 + 0x58],	%o6
loop_2088:
	srax	%i0,	0x0B,	%o4
loop_2089:
	nop
	set	0x1C, %l6
	lduwa	[%l7 + %l6] 0x04,	%g1
	tleu	%xcc,	0x7
	tgu	%xcc,	0x0
	smulcc	%o1,	%g2,	%o7
	fblg	%fcc2,	loop_2090
	array8	%i3,	%g4,	%g3
	fone	%f10
	edge8ln	%l0,	%l1,	%l6
loop_2090:
	fbuge	%fcc3,	loop_2091
	fmovsa	%icc,	%f15,	%f13
	edge8ln	%l2,	%l5,	%o2
	edge8n	%i5,	%g5,	%o5
loop_2091:
	alignaddr	%i1,	%i7,	%o0
	ldsb	[%l7 + 0x0D],	%g6
	taddcc	%i6,	0x03FE,	%o3
	movleu	%icc,	%i2,	%l4
	addcc	%i4,	0x1FA5,	%l3
	udivcc	%g7,	0x0962,	%i0
	edge32l	%o4,	%g1,	%o1
	ldsw	[%l7 + 0x1C],	%g2
	movl	%icc,	%o6,	%o7
	movne	%xcc,	%g4,	%g3
	set	0x64, %i5
	stha	%i3,	[%l7 + %i5] 0xea
	membar	#Sync
	fmovsg	%icc,	%f29,	%f19
	add	%l0,	0x0197,	%l1
	bn,a	%xcc,	loop_2092
	andn	%l6,	0x02B2,	%l2
	tsubcc	%o2,	0x1989,	%i5
	movge	%xcc,	%g5,	%l5
loop_2092:
	fmovrse	%i1,	%f29,	%f14
	fbule,a	%fcc2,	loop_2093
	fzeros	%f5
	tcc	%icc,	0x1
	sir	0x164B
loop_2093:
	nop
	wr	%g0,	0x81,	%asi
	lduha	[%l7 + 0x48] %asi,	%i7
	xnorcc	%o5,	0x08A0,	%o0
	tg	%xcc,	0x0
	fbule,a	%fcc3,	loop_2094
	fsrc2s	%f9,	%f27
	addc	%g6,	%i6,	%o3
	orcc	%l4,	0x015D,	%i2
loop_2094:
	sra	%i4,	0x04,	%l3
	xnorcc	%i0,	%o4,	%g7
	tneg	%xcc,	0x1
	andcc	%g1,	0x0644,	%g2
	lduw	[%l7 + 0x10],	%o1
	movrgz	%o6,	0x21F,	%g4
	nop
	fitod	%f8,	%f18
	fdtox	%f18,	%f24
	fxtod	%f24,	%f8
	smulcc	%g3,	0x004F,	%o7
	udivcc	%l0,	0x0D3C,	%i3
	fbuge	%fcc0,	loop_2095
	andncc	%l1,	%l2,	%l6
	subccc	%i5,	%o2,	%l5
	nop
	setx	loop_2096,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_2095:
	andncc	%g5,	%i7,	%o5
	fpadd16s	%f11,	%f28,	%f29
	move	%xcc,	%o0,	%g6
loop_2096:
	popc	0x1657,	%i6
	sll	%o3,	0x0B,	%i1
	subccc	%l4,	%i4,	%l3
	movcc	%icc,	%i0,	%o4
	fpmerge	%f28,	%f11,	%f14
	tn	%icc,	0x4
	fpsub16s	%f21,	%f6,	%f23
	edge32n	%g7,	%g1,	%i2
	nop
	fitod	%f2,	%f8
	fdtoi	%f8,	%f19
	nop
	setx	0x9AFDF0680053E23E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x18]
	ldx	[%l7 + 0x18],	%fsr
	edge8	%g2,	%o6,	%g4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movl	%xcc,	%o1,	%o7
	fmovsa	%icc,	%f16,	%f0
	edge32l	%l0,	%g3,	%l1
	fbu,a	%fcc1,	loop_2097
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbu,a	%fcc0,	loop_2098
	ldsw	[%l7 + 0x70],	%i3
loop_2097:
	andn	%l2,	0x1D10,	%i5
	fmovrse	%o2,	%f31,	%f20
loop_2098:
	sethi	0x137B,	%l6
	taddcc	%l5,	0x07B7,	%i7
	tcs	%icc,	0x4
	edge8	%o5,	%g5,	%g6
	bne,pt	%icc,	loop_2099
	subccc	%o0,	%i6,	%i1
	fpsub32	%f8,	%f10,	%f18
	fnot2	%f4,	%f18
loop_2099:
	sub	%l4,	0x0D8E,	%i4
	movpos	%xcc,	%l3,	%i0
	tleu	%xcc,	0x1
	smul	%o4,	%o3,	%g1
	umulcc	%g7,	%g2,	%i2
	lduw	[%l7 + 0x50],	%g4
	move	%xcc,	%o1,	%o7
	movcc	%xcc,	%l0,	%o6
	fmovrde	%l1,	%f12,	%f10
	membar	0x5A
	nop
	set	0x7A, %i3
	sth	%i3,	[%l7 + %i3]
	sub	%g3,	%l2,	%o2
	sir	0x17DA
	smul	%i5,	%l5,	%l6
	set	0x08, %l3
	prefetcha	[%l7 + %l3] 0x18,	 0x0
	xor	%g5,	0x1D47,	%o5
	tgu	%icc,	0x7
	wr	%g0,	0x80,	%asi
	lda	[%l7 + 0x60] %asi,	%f0
	fpadd32	%f2,	%f20,	%f6
	tvs	%icc,	0x6
	sra	%o0,	0x17,	%i6
	add	%l7,	0x48,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%i1
	casa	[%l6] 0x80,	%i1,	%l4
	xorcc	%i4,	0x01F3,	%l3
	fbn,a	%fcc2,	loop_2100
	fnands	%f19,	%f14,	%f5
	movneg	%xcc,	%g6,	%o4
	tcc	%icc,	0x3
loop_2100:
	add	%i0,	0x0203,	%o3
	edge16n	%g1,	%g7,	%g2
	umul	%g4,	%o1,	%o7
	swap	[%l7 + 0x38],	%l0
	bvc,a	%xcc,	loop_2101
	ldsw	[%l7 + 0x74],	%i2
	brlez	%l1,	loop_2102
	fpmerge	%f29,	%f24,	%f30
loop_2101:
	fblg,a	%fcc2,	loop_2103
	edge8n	%o6,	%i3,	%l2
loop_2102:
	lduh	[%l7 + 0x26],	%o2
	movl	%icc,	%i5,	%l5
loop_2103:
	fble	%fcc0,	loop_2104
	fmovdle	%xcc,	%f14,	%f6
	brlez,a	%l6,	loop_2105
	brlz,a	%g3,	loop_2106
loop_2104:
	ble	loop_2107
	fands	%f9,	%f23,	%f2
loop_2105:
	addccc	%g5,	0x0861,	%o5
loop_2106:
	nop
	setx	0x0B8C33BC60439D01,	%l0,	%l6
	stx	%l6,	[%l7 + 0x20]
	ldx	[%l7 + 0x20],	%fsr
loop_2107:
	tg	%icc,	0x7
	set	0x68, %o4
	stxa	%i7,	[%l7 + %o4] 0x23
	membar	#Sync
	fmovrdgz	%o0,	%f0,	%f16
	mova	%icc,	%i6,	%i1
	array16	%i4,	%l3,	%g6
	fbul	%fcc2,	loop_2108
	fbul	%fcc1,	loop_2109
	edge32ln	%l4,	%i0,	%o3
	srax	%o4,	0x1C,	%g1
loop_2108:
	nop
	wr	%g0,	0x11,	%asi
	swapa	[%l7 + 0x58] %asi,	%g2
loop_2109:
	lduw	[%l7 + 0x48],	%g4
	wr	%g0,	0x88,	%asi
	ldsha	[%l7 + 0x62] %asi,	%o1
	ldx	[%l7 + 0x60],	%g7
	edge16n	%o7,	%l0,	%l1
	movn	%xcc,	%o6,	%i3
	brz,a	%i2,	loop_2110
	fmovdn	%icc,	%f17,	%f1
	srax	%o2,	%l2,	%i5
	wr	%g0,	0x80,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
loop_2110:
	fblg	%fcc1,	loop_2111
	tle	%xcc,	0x7
	movleu	%xcc,	%l6,	%g3
	orncc	%g5,	0x104A,	%o5
loop_2111:
	array8	%i7,	%l5,	%i6
	orcc	%o0,	%i1,	%i4
	set	0x30, %o6
	sta	%f6,	[%l7 + %o6] 0x11
	movle	%icc,	%g6,	%l4
	fcmpeq32	%f6,	%f12,	%l3
	nop
	setx	0xE6844EFE,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f18
	setx	0x429CFF47,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f4
	fadds	%f4,	%f18,	%f1
	edge8	%i0,	%o4,	%g1
	fbl	%fcc3,	loop_2112
	subcc	%g2,	%g4,	%o1
	movne	%xcc,	%o3,	%g7
	movn	%icc,	%l0,	%o7
loop_2112:
	brgz,a	%l1,	loop_2113
	orn	%i3,	%o6,	%o2
	ba	%icc,	loop_2114
	sll	%i2,	0x03,	%i5
loop_2113:
	fbe	%fcc2,	loop_2115
	fmovsg	%icc,	%f28,	%f25
loop_2114:
	ble,pt	%icc,	loop_2116
	fbu	%fcc2,	loop_2117
loop_2115:
	sdivcc	%l2,	0x0784,	%l6
	movvc	%icc,	%g3,	%g5
loop_2116:
	smulcc	%i7,	0x16ED,	%o5
loop_2117:
	bge	%xcc,	loop_2118
	movneg	%xcc,	%i6,	%l5
	alignaddr	%o0,	%i4,	%g6
	std	%f22,	[%l7 + 0x38]
loop_2118:
	movrne	%i1,	%l4,	%i0
	add	%o4,	%l3,	%g1
	wr	%g0,	0x88,	%asi
	stba	%g2,	[%l7 + 0x20] %asi
	sethi	0x1051,	%g4
	udivx	%o1,	0x166A,	%o3
	addcc	%l0,	%o7,	%g7
	taddcc	%i3,	0x002E,	%o6
	nop
	setx	0x48D823C2,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f18
	setx	0xD25F8458,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f5
	fsubs	%f5,	%f18,	%f27
	smulcc	%l1,	%o2,	%i5
	movcc	%icc,	%l2,	%l6
	brnz	%i2,	loop_2119
	movne	%xcc,	%g3,	%i7
	tsubcc	%g5,	%o5,	%l5
	popc	0x1559,	%o0
loop_2119:
	nop
	fitod	%f4,	%f18
	fdtos	%f18,	%f29
	movn	%icc,	%i6,	%g6
	srlx	%i1,	%i4,	%i0
	edge32n	%o4,	%l3,	%l4
	movleu	%xcc,	%g1,	%g4
	nop
	fitod	%f12,	%f10
	fsrc1s	%f22,	%f25
	add	%l7,	0x50,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%o1,	%g2
	tne	%xcc,	0x6
	wr	%g0,	0x22,	%asi
	ldda	[%l7 + 0x60] %asi,	%l0
	fmovrdgz	%o7,	%f12,	%f28
	subc	%g7,	%i3,	%o6
	brnz,a	%o3,	loop_2120
	fand	%f12,	%f0,	%f16
	edge8l	%l1,	%o2,	%l2
	sir	0x0754
loop_2120:
	ldsh	[%l7 + 0x42],	%l6
	fbuge	%fcc2,	loop_2121
	fpack16	%f4,	%f20
	set	0x7C, %g4
	lda	[%l7 + %g4] 0x0c,	%f16
loop_2121:
	fcmpeq32	%f18,	%f6,	%i2
	tl	%xcc,	0x1
	array32	%i5,	%i7,	%g5
	xnor	%g3,	%o5,	%l5
	ble,pn	%xcc,	loop_2122
	alignaddr	%o0,	%i6,	%g6
	fpmerge	%f2,	%f22,	%f14
	brgez	%i4,	loop_2123
loop_2122:
	array16	%i1,	%i0,	%l3
	nop
	fitod	%f10,	%f10
	fdtox	%f10,	%f26
	alignaddr	%l4,	%g1,	%g4
loop_2123:
	sll	%o4,	0x16,	%g2
	fmovdvc	%xcc,	%f31,	%f8
	nop
	set	0x26, %l1
	sth	%o1,	[%l7 + %l1]
	edge8l	%o7,	%g7,	%l0
	tvc	%xcc,	0x2
	edge32n	%i3,	%o3,	%o6
	mulx	%l1,	0x1ACC,	%o2
	tneg	%icc,	0x5
	fnot2	%f18,	%f18
	fmovrse	%l6,	%f13,	%f20
	edge32l	%i2,	%l2,	%i5
	nop
	setx	0xB0781793,	%l0,	%l6
	st	%l6,	[%l7 + 0x78]
	ld	[%l7 + 0x78],	%fsr
	ld	[%l7 + 0x18],	%f3
	bl	%xcc,	loop_2124
	xnor	%g5,	0x043E,	%g3
	pdist	%f6,	%f2,	%f28
	edge16ln	%o5,	%i7,	%l5
loop_2124:
	prefetch	[%l7 + 0x74],	 0x3
	fmovrdgez	%i6,	%f18,	%f4
	tg	%icc,	0x3
	umul	%o0,	0x0696,	%g6
	tvs	%icc,	0x7
	taddcc	%i1,	%i0,	%i4
	edge32ln	%l3,	%g1,	%g4
	sir	0x1C12
	fmovsa	%icc,	%f8,	%f31
	fmovd	%f2,	%f28
	tvc	%icc,	0x1
	fmovdleu	%icc,	%f11,	%f28
	taddcctv	%l4,	0x0956,	%o4
	bl,pn	%icc,	loop_2125
	nop
	setx	0x88BEABB2,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f8
	setx	0x6E594882,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f26
	fadds	%f26,	%f8,	%f8
	tvc	%icc,	0x0
	addcc	%g2,	0x1688,	%o7
loop_2125:
	tg	%icc,	0x4
	tcc	%icc,	0x5
	edge16l	%g7,	%o1,	%i3
	fmovsg	%icc,	%f24,	%f30
	stbar
	andn	%o3,	%l0,	%l1
	sdivx	%o2,	0x09B9,	%l6
	movn	%icc,	%o6,	%i2
	mova	%icc,	%l2,	%g5
	movn	%icc,	%i5,	%g3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movpos	%icc,	%o5,	%l5
	array32	%i7,	%o0,	%i6
	brlz	%g6,	loop_2126
	fbue,a	%fcc2,	loop_2127
	fnands	%f13,	%f13,	%f11
	fbul,a	%fcc3,	loop_2128
loop_2126:
	tcs	%icc,	0x0
loop_2127:
	fbg,a	%fcc1,	loop_2129
	bcs,a	%xcc,	loop_2130
loop_2128:
	edge8	%i1,	%i0,	%i4
	udiv	%g1,	0x0655,	%l3
loop_2129:
	fpack32	%f6,	%f26,	%f0
loop_2130:
	array8	%l4,	%g4,	%o4
	alignaddr	%g2,	%g7,	%o1
	fmul8x16al	%f8,	%f27,	%f0
	fmovrdgez	%o7,	%f16,	%f10
	brnz,a	%i3,	loop_2131
	bpos,a,pt	%icc,	loop_2132
	edge32n	%o3,	%l1,	%l0
	fsrc1s	%f17,	%f8
loop_2131:
	fmovdg	%icc,	%f27,	%f8
loop_2132:
	mulscc	%l6,	%o6,	%i2
	nop
	fitod	%f0,	%f10
	fdtos	%f10,	%f1
	set	0x20, %i2
	stxa	%l2,	[%l7 + %i2] 0x10
	fbu	%fcc2,	loop_2133
	orncc	%g5,	%i5,	%o2
	tpos	%xcc,	0x7
	bg,pn	%icc,	loop_2134
loop_2133:
	fsrc2	%f22,	%f28
	or	%g3,	%l5,	%o5
	lduw	[%l7 + 0x58],	%i7
loop_2134:
	tge	%xcc,	0x6
	movle	%icc,	%o0,	%i6
	taddcc	%i1,	%i0,	%i4
	fsrc2	%f24,	%f26
	fmovdvc	%xcc,	%f20,	%f13
	edge8l	%g6,	%l3,	%l4
	umul	%g1,	%g4,	%g2
	movg	%xcc,	%g7,	%o4
	fmovsg	%xcc,	%f24,	%f25
	edge8	%o7,	%o1,	%i3
	edge32l	%o3,	%l0,	%l1
	bvc,a	loop_2135
	fbe,a	%fcc2,	loop_2136
	movvc	%icc,	%l6,	%i2
	ta	%xcc,	0x0
loop_2135:
	bvc	%icc,	loop_2137
loop_2136:
	movgu	%icc,	%l2,	%o6
	fxors	%f19,	%f2,	%f2
	fbug,a	%fcc1,	loop_2138
loop_2137:
	movcs	%icc,	%i5,	%o2
	fmovsl	%xcc,	%f20,	%f12
	edge32l	%g3,	%l5,	%g5
loop_2138:
	movl	%icc,	%o5,	%i7
	tcs	%xcc,	0x4
	edge16	%i6,	%i1,	%i0
	tcc	%xcc,	0x3
	ldsh	[%l7 + 0x42],	%i4
	edge8n	%o0,	%l3,	%l4
	movvc	%xcc,	%g6,	%g1
	fmovdge	%xcc,	%f18,	%f10
	fnand	%f4,	%f20,	%f0
	andn	%g4,	0x1A39,	%g7
	smulcc	%o4,	0x0E90,	%g2
	movrgez	%o1,	%o7,	%i3
	tpos	%icc,	0x3
	fmovsleu	%xcc,	%f18,	%f19
	orncc	%o3,	%l0,	%l6
	mulscc	%i2,	0x01BD,	%l1
	ta	%icc,	0x1
	mulx	%l2,	0x057F,	%o6
	movgu	%icc,	%i5,	%o2
	mulscc	%l5,	%g3,	%g5
	move	%icc,	%o5,	%i7
	tn	%xcc,	0x5
	alignaddrl	%i1,	%i6,	%i4
	srax	%o0,	%l3,	%i0
	fmovsgu	%xcc,	%f2,	%f12
	nop
	setx	0x1B8A6855A439E683,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0x8C40E8799E4793B9,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	fdivd	%f16,	%f10,	%f30
	tgu	%icc,	0x6
	srl	%l4,	0x16,	%g6
	sub	%g4,	%g7,	%o4
	umulcc	%g2,	0x08AD,	%g1
	add	%l7,	0x70,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%o7
	casa	[%l6] %asi,	%o7,	%o1
	membar	0x36
	andn	%i3,	0x11D9,	%l0
	tleu	%xcc,	0x4
	sra	%l6,	0x0E,	%i2
	movrlez	%l1,	0x333,	%o3
	fnor	%f10,	%f18,	%f22
	std	%f0,	[%l7 + 0x58]
	fnor	%f24,	%f20,	%f12
	tvc	%icc,	0x2
	addccc	%l2,	0x06C9,	%i5
	edge16ln	%o2,	%o6,	%g3
	wr	%g0,	0x80,	%asi
	stwa	%l5,	[%l7 + 0x4C] %asi
	st	%f20,	[%l7 + 0x40]
	bgu,pn	%xcc,	loop_2139
	edge8l	%g5,	%o5,	%i1
	tleu	%icc,	0x5
	and	%i7,	%i4,	%i6
loop_2139:
	movl	%icc,	%l3,	%i0
	bshuffle	%f22,	%f24,	%f2
	fmovdpos	%xcc,	%f28,	%f11
	xnorcc	%o0,	%l4,	%g6
	fmovdle	%icc,	%f25,	%f13
	sll	%g7,	0x16,	%g4
	umulcc	%o4,	%g2,	%g1
	fmovse	%icc,	%f24,	%f3
	tge	%xcc,	0x1
	mulx	%o1,	0x1FFA,	%i3
	alignaddr	%l0,	%o7,	%l6
	nop
	setx loop_2140, %l0, %l1
	jmpl %l1, %i2
	tn	%icc,	0x0
	movrlez	%o3,	%l2,	%i5
	movne	%xcc,	%o2,	%o6
loop_2140:
	nop
	setx	0x477B0E470DE0DA55,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0x20F56BAA3B5B1967,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	fmuld	%f2,	%f20,	%f18
	fcmpeq16	%f28,	%f12,	%g3
	movne	%icc,	%l1,	%l5
	movvc	%icc,	%o5,	%i1
	nop
	setx	loop_2141,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fmovrdlez	%g5,	%f8,	%f0
	membar	0x74
	movl	%icc,	%i7,	%i4
loop_2141:
	edge8ln	%l3,	%i6,	%i0
	ldd	[%l7 + 0x20],	%l4
	nop
	fitos	%f6,	%f20
	fstod	%f20,	%f14
	movge	%icc,	%o0,	%g7
	fmovsgu	%xcc,	%f25,	%f1
	set	0x40, %o2
	stda	%f16,	[%l7 + %o2] 0x88
	bvs,a	%icc,	loop_2142
	tn	%xcc,	0x5
	nop
	fitod	%f0,	%f2
	fdtox	%f2,	%f10
	fone	%f22
loop_2142:
	edge32l	%g4,	%g6,	%o4
	nop
	setx	0x21A426A8,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f28
	setx	0x4C3528A0,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f20
	fadds	%f20,	%f28,	%f25
	ldsb	[%l7 + 0x18],	%g2
	fexpand	%f30,	%f18
	fpsub32s	%f10,	%f9,	%f11
	alignaddr	%g1,	%o1,	%i3
	mulscc	%l0,	%l6,	%o7
	udivcc	%i2,	0x073A,	%l2
	tcc	%xcc,	0x7
	andcc	%o3,	%i5,	%o6
	swap	[%l7 + 0x10],	%g3
	movn	%xcc,	%l1,	%o2
	fmovsvs	%icc,	%f23,	%f14
	orn	%o5,	0x1EA9,	%l5
	bg,pt	%icc,	loop_2143
	ldx	[%l7 + 0x58],	%i1
	fmovrde	%g5,	%f14,	%f14
	tn	%xcc,	0x5
loop_2143:
	tl	%icc,	0x1
	fmovrsgez	%i4,	%f13,	%f19
	array8	%l3,	%i7,	%i6
	nop
	setx	0x31D62DFD,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f4
	setx	0x142D1A80,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f18
	fadds	%f18,	%f4,	%f2
	fone	%f22
	subccc	%i0,	0x031E,	%l4
	sethi	0x1A73,	%g7
	movge	%icc,	%o0,	%g4
	tpos	%icc,	0x2
	edge16n	%g6,	%g2,	%g1
	fpackfix	%f4,	%f2
	fnor	%f26,	%f4,	%f26
	movvs	%xcc,	%o4,	%i3
	bneg,a	%xcc,	loop_2144
	sdiv	%o1,	0x192E,	%l0
	fbl,a	%fcc0,	loop_2145
	fbuge	%fcc0,	loop_2146
loop_2144:
	fzero	%f16
	nop
	set	0x20, %g7
	std	%f30,	[%l7 + %g7]
loop_2145:
	fble,a	%fcc0,	loop_2147
loop_2146:
	fbu	%fcc2,	loop_2148
	fcmple16	%f12,	%f14,	%o7
	sub	%i2,	%l6,	%l2
loop_2147:
	tne	%xcc,	0x6
loop_2148:
	fnot2	%f6,	%f22
	fbne,a	%fcc1,	loop_2149
	bcs,a	loop_2150
	addcc	%i5,	%o6,	%o3
	sethi	0x1A20,	%g3
loop_2149:
	faligndata	%f6,	%f28,	%f12
loop_2150:
	array32	%l1,	%o2,	%o5
	nop
	setx	0x664431CE520F322F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	fsqrtd	%f2,	%f12
	fbe,a	%fcc0,	loop_2151
	bneg,a	%xcc,	loop_2152
	xnor	%i1,	%l5,	%g5
	fmovdl	%xcc,	%f31,	%f6
loop_2151:
	fba	%fcc3,	loop_2153
loop_2152:
	tvs	%icc,	0x7
	nop
	setx	loop_2154,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	edge8l	%l3,	%i7,	%i4
loop_2153:
	movcc	%xcc,	%i6,	%l4
	ldd	[%l7 + 0x68],	%f0
loop_2154:
	sdivcc	%g7,	0x0919,	%i0
	fmovsleu	%xcc,	%f18,	%f17
	andncc	%g4,	%o0,	%g2
	movgu	%xcc,	%g1,	%g6
	fmul8ulx16	%f14,	%f26,	%f20
	set	0x74, %l0
	lduwa	[%l7 + %l0] 0x15,	%o4
	movne	%icc,	%o1,	%i3
	ta	%xcc,	0x6
	fbg	%fcc3,	loop_2155
	sllx	%l0,	%o7,	%l6
	movvs	%xcc,	%l2,	%i2
	ble,a,pt	%xcc,	loop_2156
loop_2155:
	and	%o6,	0x000E,	%i5
	wr	%g0,	0x10,	%asi
	ldsha	[%l7 + 0x4A] %asi,	%g3
loop_2156:
	fcmpeq16	%f2,	%f8,	%l1
	fones	%f4
	fsrc1	%f14,	%f2
	and	%o2,	%o3,	%i1
	fbuge	%fcc3,	loop_2157
	fmovd	%f8,	%f12
	mulscc	%l5,	%o5,	%g5
	tsubcctv	%i7,	%l3,	%i6
loop_2157:
	ba,a,pn	%icc,	loop_2158
	tcs	%xcc,	0x4
	movvs	%icc,	%l4,	%i4
	fsrc2	%f10,	%f12
loop_2158:
	smul	%g7,	%g4,	%i0
	brlz,a	%o0,	loop_2159
	bneg,a,pt	%xcc,	loop_2160
	edge32l	%g2,	%g6,	%o4
	or	%g1,	0x0220,	%o1
loop_2159:
	sdivcc	%i3,	0x0365,	%o7
loop_2160:
	movrne	%l6,	%l2,	%i2
	edge32n	%o6,	%l0,	%i5
	fnot1	%f10,	%f26
	sra	%g3,	%o2,	%o3
	movne	%xcc,	%i1,	%l5
	array16	%o5,	%l1,	%i7
	wr	%g0,	0x0c,	%asi
	ldsha	[%l7 + 0x50] %asi,	%l3
	wr	%g0,	0x89,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	ta	%xcc,	0x3
	nop
	setx	loop_2161,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	edge32n	%i6,	%g5,	%i4
	fands	%f29,	%f7,	%f21
	fnand	%f28,	%f18,	%f18
loop_2161:
	sdiv	%g7,	0x120B,	%g4
	fmovrslz	%i0,	%f26,	%f18
	tne	%icc,	0x6
	ta	%xcc,	0x6
	andn	%o0,	%g2,	%g6
	taddcctv	%o4,	%l4,	%g1
	bcs,pn	%icc,	loop_2162
	fmovrsgz	%i3,	%f9,	%f29
	fabss	%f6,	%f13
	movvs	%icc,	%o1,	%l6
loop_2162:
	udivcc	%o7,	0x08F8,	%i2
	fmovrsne	%l2,	%f26,	%f2
	fmovdvc	%icc,	%f1,	%f26
	orcc	%l0,	%i5,	%g3
	sllx	%o6,	0x10,	%o3
	udivx	%o2,	0x0472,	%i1
	tvs	%icc,	0x1
	movcc	%icc,	%o5,	%l1
	bcs	%xcc,	loop_2163
	tvs	%icc,	0x5
	orncc	%i7,	0x1D25,	%l3
	movn	%icc,	%i6,	%g5
loop_2163:
	brz,a	%i4,	loop_2164
	edge16l	%g7,	%l5,	%g4
	fmovsg	%xcc,	%f2,	%f12
	wr	%g0,	0x04,	%asi
	stxa	%i0,	[%l7 + 0x48] %asi
loop_2164:
	nop
	setx	0x0537361B162FA1E5,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0xE5D6BD8927A24555,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	faddd	%f2,	%f30,	%f2
	fba,a	%fcc2,	loop_2165
	sth	%o0,	[%l7 + 0x1A]
	sir	0x0F2D
	sethi	0x089E,	%g6
loop_2165:
	edge8ln	%o4,	%g2,	%l4
	sra	%i3,	0x0B,	%o1
	sethi	0x09C8,	%l6
	edge8	%o7,	%g1,	%i2
	andn	%l2,	0x05DA,	%l0
	edge32n	%i5,	%g3,	%o3
	fands	%f23,	%f3,	%f30
	xnor	%o2,	%o6,	%i1
	movrlz	%o5,	0x284,	%i7
	movrgez	%l1,	%i6,	%l3
	ldsw	[%l7 + 0x60],	%i4
	tcs	%xcc,	0x5
	or	%g7,	%g5,	%l5
	alignaddr	%i0,	%o0,	%g6
	nop
	fitos	%f10,	%f1
	fstox	%f1,	%f18
	fxtos	%f18,	%f7
	edge8ln	%o4,	%g4,	%g2
	edge8ln	%i3,	%o1,	%l4
	bge,a	%icc,	loop_2166
	fnegs	%f9,	%f25
	edge8n	%o7,	%g1,	%l6
	nop
	setx	0x4A3A9FDA74E3A583,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0xCE9CC6AECD09293B,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	faddd	%f14,	%f16,	%f18
loop_2166:
	sub	%l2,	%l0,	%i5
	sdivcc	%i2,	0x0E69,	%g3
	movrgz	%o2,	%o3,	%o6
	fbge,a	%fcc1,	loop_2167
	fbuge	%fcc3,	loop_2168
	orn	%o5,	0x00FD,	%i7
	fmovse	%icc,	%f1,	%f9
loop_2167:
	movvc	%xcc,	%i1,	%i6
loop_2168:
	fmovrse	%l3,	%f8,	%f23
	nop
	setx	0xC634C944,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f20
	setx	0xD1B91B9B,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f18
	fsubs	%f18,	%f20,	%f27
	ta	%icc,	0x1
	fpack16	%f12,	%f23
	tcs	%icc,	0x2
	fbul,a	%fcc1,	loop_2169
	tl	%xcc,	0x6
	tne	%icc,	0x5
	movrgz	%l1,	%i4,	%g5
loop_2169:
	bne,pt	%xcc,	loop_2170
	brlez	%l5,	loop_2171
	xnorcc	%i0,	%g7,	%o0
	fble,a	%fcc0,	loop_2172
loop_2170:
	fmovrdlez	%o4,	%f2,	%f8
loop_2171:
	orn	%g4,	%g6,	%i3
	nop
	setx	0x206BB745,	%l0,	%l6
	st	%l6,	[%l7 + 0x18]
	ld	[%l7 + 0x18],	%fsr
loop_2172:
	fpsub32	%f8,	%f4,	%f0
	fpsub16	%f24,	%f12,	%f6
	set	0x66, %l4
	lduha	[%l7 + %l4] 0x0c,	%g2
	movne	%icc,	%l4,	%o1
	sub	%g1,	0x130A,	%o7
	set	0x0C, %i0
	ldswa	[%l7 + %i0] 0x04,	%l6
	srax	%l0,	0x05,	%i5
	and	%l2,	%g3,	%o2
	fbule,a	%fcc3,	loop_2173
	array32	%i2,	%o6,	%o3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	move	%icc,	%o5,	%i1
loop_2173:
	and	%i7,	0x0DCF,	%i6
	fbul	%fcc2,	loop_2174
	fmovrsne	%l1,	%f3,	%f21
	fmovdcs	%icc,	%f11,	%f20
	tl	%icc,	0x4
loop_2174:
	lduw	[%l7 + 0x68],	%i4
	edge32l	%l3,	%g5,	%i0
	brnz,a	%l5,	loop_2175
	edge16ln	%o0,	%g7,	%g4
	fsrc1	%f26,	%f20
	movg	%icc,	%g6,	%o4
loop_2175:
	fmul8x16au	%f27,	%f3,	%f18
	tge	%xcc,	0x2
	bpos,a,pt	%xcc,	loop_2176
	edge32l	%g2,	%i3,	%l4
	nop
	setx	0xC9616DD5D05D219F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x58]
	ldx	[%l7 + 0x58],	%fsr
	movcc	%xcc,	%g1,	%o7
loop_2176:
	faligndata	%f16,	%f20,	%f20
	bgu,a,pn	%icc,	loop_2177
	addc	%l6,	%o1,	%i5
	tn	%icc,	0x6
	fmovrsne	%l2,	%f13,	%f22
loop_2177:
	or	%l0,	%o2,	%i2
	edge16ln	%o6,	%o3,	%g3
	udivcc	%o5,	0x062D,	%i7
	wr	%g0,	0x26,	%asi
	ldda	[%l7 + 0x30] %asi,	%i6
	bpos	loop_2178
	fmovsl	%icc,	%f3,	%f21
	subc	%l1,	0x19C9,	%i1
	srl	%l3,	%i4,	%i0
loop_2178:
	fbo	%fcc0,	loop_2179
	tgu	%xcc,	0x1
	udivx	%g5,	0x0F55,	%l5
	set	0x58, %i1
	ldswa	[%l7 + %i1] 0x88,	%o0
loop_2179:
	nop
	fitos	%f2,	%f13
	fstox	%f13,	%f10
	movn	%xcc,	%g7,	%g6
	wr	%g0,	0x80,	%asi
	lda	[%l7 + 0x4C] %asi,	%f26
	fones	%f20
	fmovrse	%o4,	%f31,	%f7
	edge16l	%g4,	%i3,	%l4
	wr	%g0,	0x18,	%asi
	ldstuba	[%l7 + 0x29] %asi,	%g2
	movg	%xcc,	%o7,	%g1
	fsrc2	%f30,	%f26
	bvc,a,pn	%icc,	loop_2180
	fbn,a	%fcc0,	loop_2181
	nop
	setx	loop_2182,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	mulx	%l6,	0x1AE5,	%o1
loop_2180:
	nop
	wr	%g0,	0x88,	%asi
	lduwa	[%l7 + 0x48] %asi,	%i5
loop_2181:
	prefetch	[%l7 + 0x54],	 0x2
loop_2182:
	movne	%xcc,	%l0,	%l2
	fmovdleu	%xcc,	%f16,	%f24
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32l	%i2,	%o2,	%o6
	udivcc	%g3,	0x01BE,	%o5
	fnot1	%f2,	%f24
	ldx	[%l7 + 0x18],	%i7
	bcs,a	%xcc,	loop_2183
	sdivx	%i6,	0x1365,	%l1
	movge	%xcc,	%o3,	%l3
	tsubcctv	%i4,	0x0BDF,	%i1
loop_2183:
	fsrc1	%f14,	%f24
	addc	%g5,	0x0428,	%i0
	movrgz	%o0,	0x27B,	%l5
	brlz	%g6,	loop_2184
	fpackfix	%f8,	%f5
	edge16l	%g7,	%o4,	%i3
	addcc	%g4,	0x1460,	%g2
loop_2184:
	fbul	%fcc2,	loop_2185
	nop
	setx	0xED0E80DAD2CFC90D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0x24807E0983600E8D,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	fsubd	%f22,	%f26,	%f20
	wr	%g0,	0x0c,	%asi
	swapa	[%l7 + 0x20] %asi,	%l4
loop_2185:
	edge16n	%o7,	%l6,	%g1
	ldstub	[%l7 + 0x22],	%i5
	subcc	%o1,	0x1391,	%l2
	xnorcc	%i2,	%l0,	%o6
	st	%f11,	[%l7 + 0x44]
	bgu	loop_2186
	smulcc	%g3,	0x09CF,	%o5
	fornot1s	%f5,	%f24,	%f22
	fbg	%fcc3,	loop_2187
loop_2186:
	movre	%o2,	0x13D,	%i6
	ldd	[%l7 + 0x08],	%i6
	alignaddr	%o3,	%l3,	%l1
loop_2187:
	sth	%i1,	[%l7 + 0x60]
	move	%xcc,	%i4,	%g5
	fmovsvs	%xcc,	%f22,	%f11
	bneg,a	loop_2188
	fpsub16	%f24,	%f4,	%f0
	subcc	%i0,	%l5,	%g6
	movneg	%xcc,	%o0,	%o4
loop_2188:
	nop
	wr	%g0,	0x89,	%asi
	ldsba	[%l7 + 0x4F] %asi,	%g7
	movge	%icc,	%i3,	%g4
	alignaddrl	%g2,	%o7,	%l6
	movne	%xcc,	%l4,	%g1
	fmul8x16al	%f9,	%f19,	%f16
	fbuge,a	%fcc0,	loop_2189
	tvc	%icc,	0x0
	fcmpgt16	%f18,	%f22,	%i5
	lduw	[%l7 + 0x28],	%o1
loop_2189:
	fblg,a	%fcc1,	loop_2190
	movgu	%icc,	%i2,	%l2
	edge16	%o6,	%g3,	%l0
	ldd	[%l7 + 0x70],	%f30
loop_2190:
	orcc	%o5,	0x1D35,	%i6
	movge	%xcc,	%o2,	%o3
	andn	%i7,	0x1B0F,	%l3
	movle	%xcc,	%l1,	%i4
	wr	%g0,	0x11,	%asi
	ldxa	[%l7 + 0x60] %asi,	%g5
	smul	%i0,	%i1,	%g6
	udivcc	%l5,	0x0A3F,	%o0
	taddcc	%g7,	%i3,	%o4
	fpsub32	%f0,	%f10,	%f22
	sir	0x0950
	srax	%g2,	%g4,	%o7
	nop
	setx	0x4E836FA5E5F7B3DC,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0x4E6A71D00EC95F36,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	fdivd	%f20,	%f28,	%f0
	sra	%l4,	%g1,	%i5
	fpsub16	%f30,	%f30,	%f0
	edge16	%l6,	%o1,	%l2
	fmovsa	%icc,	%f23,	%f4
	fbul,a	%fcc2,	loop_2191
	tpos	%icc,	0x3
	fors	%f22,	%f22,	%f22
	orcc	%o6,	0x1AF0,	%i2
loop_2191:
	fmovrdlz	%l0,	%f10,	%f2
	fmovdcs	%icc,	%f6,	%f4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addccc	%g3,	0x0DC3,	%i6
	fmovsgu	%xcc,	%f27,	%f30
	edge8	%o2,	%o5,	%o3
	bneg,a,pt	%xcc,	loop_2192
	tcs	%xcc,	0x1
	fmovsleu	%icc,	%f21,	%f24
	tcc	%xcc,	0x6
loop_2192:
	movrlz	%l3,	0x1DB,	%i7
	tne	%xcc,	0x6
	tg	%xcc,	0x6
	fbu,a	%fcc3,	loop_2193
	tleu	%icc,	0x5
	movle	%xcc,	%l1,	%g5
	udiv	%i4,	0x0B14,	%i1
loop_2193:
	edge32n	%g6,	%i0,	%l5
	wr	%g0,	0x80,	%asi
	ldswa	[%l7 + 0x48] %asi,	%g7
	fblg	%fcc3,	loop_2194
	xorcc	%i3,	0x0C3D,	%o0
	fbge,a	%fcc3,	loop_2195
	xor	%o4,	0x09BC,	%g4
loop_2194:
	fmovsa	%xcc,	%f11,	%f12
	tge	%icc,	0x5
loop_2195:
	fsrc1s	%f15,	%f26
	st	%f22,	[%l7 + 0x48]
	srlx	%o7,	%g2,	%l4
	fble,a	%fcc3,	loop_2196
	sir	0x16FC
	fba,a	%fcc3,	loop_2197
	edge32ln	%i5,	%l6,	%o1
loop_2196:
	nop
	setx	0x853167DC,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f18
	fsqrts	%f18,	%f31
	array16	%l2,	%g1,	%i2
loop_2197:
	tvs	%xcc,	0x2
	edge16l	%o6,	%g3,	%i6
	udiv	%o2,	0x114F,	%l0
	addc	%o5,	%l3,	%i7
	ldsw	[%l7 + 0x60],	%l1
	set	0x44, %i7
	lduwa	[%l7 + %i7] 0x10,	%o3
	movg	%icc,	%i4,	%g5
	nop
	setx	0x13BB838E9041C9A8,	%l0,	%l6
	stx	%l6,	[%l7 + 0x60]
	ldx	[%l7 + 0x60],	%fsr
	movcc	%xcc,	%i1,	%g6
	sdivcc	%l5,	0x02E3,	%i0
	sll	%g7,	0x04,	%i3
	udivx	%o4,	0x08DE,	%o0
	fmovdl	%icc,	%f10,	%f18
	fmovrdgz	%o7,	%f6,	%f16
	edge8n	%g2,	%l4,	%i5
	popc	0x1BA2,	%l6
	udivcc	%g4,	0x04C7,	%l2
	bneg,a,pt	%icc,	loop_2198
	sdivx	%g1,	0x0BBD,	%i2
	tcs	%icc,	0x2
	fbne,a	%fcc0,	loop_2199
loop_2198:
	fba	%fcc1,	loop_2200
	subccc	%o1,	%o6,	%i6
	wr	%g0,	0x89,	%asi
	ldswa	[%l7 + 0x7C] %asi,	%g3
loop_2199:
	subc	%l0,	0x0113,	%o5
loop_2200:
	tsubcctv	%o2,	%l3,	%l1
	taddcctv	%o3,	0x173A,	%i7
	edge16l	%i4,	%g5,	%i1
	fmovrsgz	%g6,	%f25,	%f4
	nop
	setx	0xDD91A1AF,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f15
	setx	0xC28DB225,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f7
	fdivs	%f7,	%f15,	%f24
	bneg	loop_2201
	call	loop_2202
	brlez	%i0,	loop_2203
	tcc	%xcc,	0x3
loop_2201:
	edge8	%g7,	%i3,	%o4
loop_2202:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2203:
	prefetch	[%l7 + 0x20],	 0x3
	tneg	%icc,	0x1
	set	0x60, %o5
	prefetcha	[%l7 + %o5] 0x19,	 0x2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	fitod	%f8,	%f8
	fdtos	%f8,	%f28
	set	0x18, %o7
	ldstuba	[%l7 + %o7] 0x11,	%o0
	umul	%o7,	0x169B,	%g2
	tvs	%icc,	0x5
	fmul8ulx16	%f14,	%f0,	%f22
	edge16	%i5,	%l4,	%g4
	tgu	%xcc,	0x3
	fmul8sux16	%f4,	%f8,	%f28
	tvs	%icc,	0x4
	fbge	%fcc2,	loop_2204
	movl	%xcc,	%l6,	%l2
	alignaddr	%i2,	%g1,	%o6
	alignaddrl	%i6,	%g3,	%o1
loop_2204:
	xnor	%l0,	%o2,	%o5
	edge8ln	%l3,	%o3,	%i7
	wr	%g0,	0x11,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	tn	%icc,	0x2
	fbge	%fcc0,	loop_2205
	bvs,pt	%xcc,	loop_2206
	array32	%l1,	%i4,	%g5
	srlx	%g6,	%i1,	%i0
loop_2205:
	andcc	%g7,	0x1813,	%o4
loop_2206:
	nop
	fitod	%f0,	%f18
	fdtox	%f18,	%f20
	fxtod	%f20,	%f30
	fmovrde	%l5,	%f12,	%f30
	tvs	%xcc,	0x3
	movrgez	%o0,	0x2A3,	%i3
	movrlz	%o7,	%g2,	%l4
	smul	%g4,	0x01E4,	%i5
	fbul,a	%fcc0,	loop_2207
	movg	%xcc,	%l2,	%i2
	edge16n	%l6,	%g1,	%i6
	fcmple16	%f18,	%f18,	%o6
loop_2207:
	nop
	fitos	%f1,	%f26
	fstox	%f26,	%f0
	fmovdg	%xcc,	%f27,	%f0
	fbuge	%fcc2,	loop_2208
	orncc	%g3,	%o1,	%l0
	movge	%xcc,	%o5,	%o2
	fmovdneg	%xcc,	%f8,	%f29
loop_2208:
	nop
	wr	%g0,	0x88,	%asi
	ldsba	[%l7 + 0x36] %asi,	%l3
	fpsub16	%f18,	%f26,	%f12
	orcc	%o3,	0x137E,	%l1
	bneg	loop_2209
	tcc	%xcc,	0x4
	movcs	%icc,	%i7,	%i4
	tsubcctv	%g5,	%i1,	%i0
loop_2209:
	nop
	set	0x3C, %g3
	ldsha	[%l7 + %g3] 0x18,	%g6
	tsubcctv	%o4,	%g7,	%l5
	set	0x62, %o1
	stha	%i3,	[%l7 + %o1] 0x22
	membar	#Sync
	array8	%o0,	%g2,	%o7
	tsubcctv	%l4,	%g4,	%l2
	fmovrsne	%i5,	%f6,	%f3
	fmovsne	%icc,	%f29,	%f1
	edge8n	%i2,	%g1,	%l6
	fnot2s	%f0,	%f17
	fmul8x16au	%f4,	%f17,	%f4
	udiv	%o6,	0x0E10,	%g3
	ldstub	[%l7 + 0x1D],	%o1
	tne	%icc,	0x0
	taddcctv	%i6,	%o5,	%l0
	tpos	%icc,	0x5
	alignaddr	%l3,	%o3,	%l1
	orn	%o2,	%i7,	%g5
	wr	%g0,	0x81,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	edge8l	%i1,	%i4,	%g6
	movre	%i0,	0x1A0,	%o4
	srlx	%l5,	%g7,	%i3
	fba	%fcc0,	loop_2210
	fbue	%fcc3,	loop_2211
	edge8ln	%g2,	%o0,	%l4
	andn	%o7,	0x1799,	%g4
loop_2210:
	be,pt	%xcc,	loop_2212
loop_2211:
	fcmpeq32	%f6,	%f4,	%i5
	movleu	%icc,	%i2,	%g1
	movneg	%xcc,	%l6,	%l2
loop_2212:
	ba	loop_2213
	tne	%xcc,	0x3
	wr	%g0,	0xea,	%asi
	stxa	%o6,	[%l7 + 0x58] %asi
	membar	#Sync
loop_2213:
	nop
	setx loop_2214, %l0, %l1
	jmpl %l1, %o1
	tcc	%xcc,	0x4
	smulcc	%i6,	0x0A02,	%o5
	orn	%l0,	0x197A,	%g3
loop_2214:
	orcc	%l3,	%l1,	%o3
	ld	[%l7 + 0x18],	%f8
	sra	%i7,	0x11,	%g5
	fcmpeq16	%f2,	%f18,	%i1
	edge8l	%i4,	%g6,	%i0
	smulcc	%o4,	0x0A87,	%o2
	subccc	%l5,	%i3,	%g2
	membar	0x27
	edge8l	%o0,	%l4,	%o7
	fmovse	%icc,	%f10,	%f23
	edge32ln	%g7,	%g4,	%i5
	srlx	%i2,	0x11,	%g1
	nop
	fitod	%f10,	%f16
	fdtox	%f16,	%f8
	fmovsneg	%icc,	%f14,	%f21
	sllx	%l2,	0x19,	%o6
	edge32l	%o1,	%l6,	%i6
	srlx	%o5,	0x0B,	%g3
	tcc	%xcc,	0x6
	mulscc	%l0,	0x199A,	%l1
	brlz,a	%l3,	loop_2215
	movcc	%xcc,	%i7,	%o3
	sethi	0x0A90,	%g5
	movle	%icc,	%i4,	%i1
loop_2215:
	fmul8x16au	%f8,	%f29,	%f26
	mulscc	%i0,	%g6,	%o4
	or	%l5,	%o2,	%g2
	udiv	%o0,	0x101E,	%l4
	tge	%icc,	0x2
	movvs	%icc,	%i3,	%o7
	fand	%f14,	%f22,	%f16
	srl	%g4,	0x1E,	%g7
	fnor	%f20,	%f30,	%f0
	st	%f29,	[%l7 + 0x14]
	movneg	%icc,	%i2,	%i5
	sra	%l2,	0x0B,	%g1
	bgu,a	loop_2216
	tvc	%icc,	0x1
	movge	%xcc,	%o6,	%l6
	fbl	%fcc2,	loop_2217
loop_2216:
	fmovsge	%icc,	%f14,	%f9
	call	loop_2218
	ba,pn	%icc,	loop_2219
loop_2217:
	fmovrdne	%i6,	%f18,	%f6
	movl	%xcc,	%o1,	%o5
loop_2218:
	smul	%g3,	0x1251,	%l0
loop_2219:
	fmovsleu	%xcc,	%f22,	%f6
	movne	%icc,	%l1,	%l3
	fble	%fcc0,	loop_2220
	edge8	%o3,	%g5,	%i4
	fzeros	%f4
	move	%icc,	%i7,	%i0
loop_2220:
	movvs	%xcc,	%g6,	%o4
	tge	%icc,	0x2
	bpos,a	%icc,	loop_2221
	edge32n	%l5,	%i1,	%g2
	movg	%xcc,	%o2,	%l4
	array32	%o0,	%i3,	%g4
loop_2221:
	fmovrslez	%g7,	%f7,	%f19
	orncc	%o7,	0x01B1,	%i2
	sra	%i5,	%g1,	%o6
	fsrc1s	%f26,	%f13
	lduw	[%l7 + 0x40],	%l6
	stx	%i6,	[%l7 + 0x78]
	ldx	[%l7 + 0x70],	%l2
	edge16ln	%o1,	%g3,	%o5
	alignaddrl	%l0,	%l1,	%l3
	fble,a	%fcc2,	loop_2222
	edge32l	%g5,	%o3,	%i7
	umulcc	%i4,	0x1B17,	%i0
	fmovrdne	%o4,	%f16,	%f28
loop_2222:
	fornot1s	%f21,	%f11,	%f11
	fmovdpos	%xcc,	%f22,	%f14
	wr	%g0,	0x04,	%asi
	ldstuba	[%l7 + 0x76] %asi,	%g6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orn	%l5,	0x1F57,	%i1
	set	0x6E, %g6
	ldsha	[%l7 + %g6] 0x10,	%o2
	fbn	%fcc3,	loop_2223
	andn	%l4,	0x1617,	%o0
	umulcc	%i3,	0x002E,	%g4
	edge16ln	%g2,	%o7,	%i2
loop_2223:
	taddcc	%g7,	0x0E6A,	%i5
	fmuld8sux16	%f13,	%f7,	%f20
	brgz,a	%o6,	loop_2224
	edge8	%l6,	%i6,	%g1
	movgu	%xcc,	%l2,	%g3
	or	%o5,	%o1,	%l1
loop_2224:
	edge16ln	%l0,	%g5,	%l3
	wr	%g0,	0x80,	%asi
	sta	%f25,	[%l7 + 0x2C] %asi
	smul	%i7,	%o3,	%i0
	tneg	%icc,	0x1
	movvs	%xcc,	%i4,	%o4
	edge16ln	%l5,	%g6,	%i1
	fmovrdgz	%l4,	%f6,	%f2
	xnorcc	%o2,	0x1AF1,	%o0
	udivx	%g4,	0x04D9,	%i3
	fmovrdne	%g2,	%f28,	%f26
	for	%f18,	%f14,	%f12
	tvs	%icc,	0x1
	for	%f0,	%f14,	%f30
	array16	%i2,	%o7,	%g7
	subccc	%o6,	0x027C,	%l6
	mulx	%i6,	0x02D0,	%g1
	nop
	set	0x30, %o3
	std	%f20,	[%l7 + %o3]
	tgu	%xcc,	0x6
	edge8	%i5,	%l2,	%o5
	ldsw	[%l7 + 0x0C],	%g3
	edge8	%o1,	%l0,	%l1
	movle	%xcc,	%g5,	%l3
	nop
	setx	0x615CB7BE99340935,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0x53F216A760E798CA,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	faddd	%f26,	%f12,	%f6
	fnot1s	%f17,	%f28
	ldsw	[%l7 + 0x14],	%o3
	srax	%i7,	0x0F,	%i4
	move	%xcc,	%i0,	%l5
	movcs	%icc,	%g6,	%i1
	edge16n	%o4,	%o2,	%o0
	xor	%g4,	%l4,	%g2
	movcc	%xcc,	%i3,	%i2
	udivx	%o7,	0x1167,	%o6
	bcs,a	loop_2225
	ldsh	[%l7 + 0x4C],	%l6
	set	0x54, %o0
	sta	%f26,	[%l7 + %o0] 0x19
loop_2225:
	ldsh	[%l7 + 0x7A],	%g7
	fandnot1s	%f9,	%f24,	%f20
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tgu	%xcc,	0x7
	call	loop_2226
	movge	%xcc,	%g1,	%i5
	te	%xcc,	0x1
	te	%icc,	0x3
loop_2226:
	movcc	%xcc,	%l2,	%i6
	and	%o5,	%g3,	%l0
	fbl	%fcc1,	loop_2227
	tpos	%xcc,	0x2
	movne	%icc,	%l1,	%g5
	nop
	setx	0xB22F937C,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f10
	fsqrts	%f10,	%f12
loop_2227:
	edge32	%l3,	%o3,	%i7
	fmovdgu	%icc,	%f13,	%f15
	array8	%o1,	%i4,	%l5
	popc	0x1FB2,	%g6
	wr	%g0,	0x81,	%asi
	swapa	[%l7 + 0x64] %asi,	%i1
	fnot1s	%f14,	%f10
	edge32n	%i0,	%o2,	%o4
	sth	%g4,	[%l7 + 0x24]
	array8	%o0,	%g2,	%l4
	array8	%i3,	%o7,	%i2
	wr	%g0,	0x19,	%asi
	lduwa	[%l7 + 0x0C] %asi,	%l6
	alignaddr	%o6,	%g7,	%i5
	fcmpne32	%f26,	%f18,	%l2
	fmovrsgez	%g1,	%f28,	%f11
	edge32l	%i6,	%g3,	%o5
	edge16n	%l0,	%g5,	%l1
	fzeros	%f6
	for	%f26,	%f28,	%f24
	movn	%xcc,	%o3,	%i7
	nop
	fitod	%f0,	%f30
	fdtox	%f30,	%f22
	edge8n	%o1,	%i4,	%l3
	popc	%g6,	%i1
	tvs	%xcc,	0x2
	fmovdcc	%icc,	%f10,	%f22
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	brnz,a	%l5,	loop_2228
	movvs	%xcc,	%o2,	%o4
	nop
	fitod	%f6,	%f16
	fdtox	%f16,	%f0
	fxtod	%f0,	%f12
	fsrc2s	%f30,	%f17
loop_2228:
	tvs	%icc,	0x5
	taddcctv	%g4,	%o0,	%i0
	nop
	setx	0xF39EE792,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f7
	fsqrts	%f7,	%f13
	sdiv	%l4,	0x0191,	%g2
	movrlez	%i3,	0x196,	%i2
	add	%o7,	%l6,	%o6
	srl	%i5,	0x11,	%g7
	mulx	%g1,	0x103E,	%i6
	nop
	set	0x44, %i6
	lduw	[%l7 + %i6],	%g3
	alignaddr	%o5,	%l2,	%l0
	fmuld8sux16	%f6,	%f30,	%f6
	stw	%l1,	[%l7 + 0x6C]
	tne	%xcc,	0x2
	fmul8sux16	%f22,	%f24,	%f4
	nop
	set	0x5C, %l2
	prefetch	[%l7 + %l2],	 0x1
	fzero	%f4
	andcc	%g5,	%o3,	%o1
	ldsh	[%l7 + 0x0C],	%i4
	fnot2	%f30,	%f2
	movle	%xcc,	%l3,	%g6
	fmuld8ulx16	%f11,	%f7,	%f24
	st	%f15,	[%l7 + 0x64]
	tpos	%icc,	0x6
	addcc	%i1,	%i7,	%l5
	edge32l	%o2,	%o4,	%o0
	taddcctv	%i0,	0x154C,	%l4
	ta	%icc,	0x4
	movrgez	%g4,	%g2,	%i3
	sllx	%o7,	0x1A,	%i2
	tpos	%icc,	0x1
	membar	0x6D
	prefetch	[%l7 + 0x44],	 0x3
	fcmpgt16	%f30,	%f26,	%o6
	fbuge,a	%fcc2,	loop_2229
	tvc	%xcc,	0x0
	movrne	%l6,	%i5,	%g1
	subcc	%g7,	0x08FE,	%g3
loop_2229:
	movvs	%icc,	%o5,	%l2
	bg,a	loop_2230
	fmovrsgz	%i6,	%f20,	%f16
	brgez	%l1,	loop_2231
	alignaddrl	%g5,	%l0,	%o3
loop_2230:
	mulscc	%o1,	0x1211,	%l3
	edge8	%i4,	%i1,	%g6
loop_2231:
	nop
	set	0x40, %i4
	sta	%f16,	[%l7 + %i4] 0x80
	ldd	[%l7 + 0x30],	%f26
	srax	%i7,	%l5,	%o2
	srlx	%o4,	0x18,	%i0
	fba	%fcc3,	loop_2232
	edge8l	%o0,	%g4,	%l4
	fnand	%f30,	%f6,	%f4
	fnors	%f29,	%f5,	%f25
loop_2232:
	tg	%icc,	0x1
	wr	%g0,	0x0c,	%asi
	stba	%i3,	[%l7 + 0x7D] %asi
	edge32ln	%g2,	%o7,	%i2
	alignaddrl	%l6,	%i5,	%g1
	fbne	%fcc1,	loop_2233
	fmovdvs	%xcc,	%f20,	%f16
	tcs	%xcc,	0x7
	umul	%g7,	%g3,	%o6
loop_2233:
	ldub	[%l7 + 0x33],	%l2
	set	0x00, %g1
	ldxa	[%g0 + %g1] 0x50,	%o5
	edge16	%i6,	%l1,	%l0
	set	0x60, %l5
	stha	%g5,	[%l7 + %l5] 0x19
	lduh	[%l7 + 0x0A],	%o1
	udiv	%o3,	0x0DBD,	%i4
	orn	%i1,	0x00B1,	%g6
	mova	%xcc,	%i7,	%l5
	movcc	%icc,	%o2,	%l3
	fsrc2s	%f13,	%f23
	fmovdvs	%xcc,	%f10,	%f26
	nop
	fitod	%f0,	%f28
	fdtos	%f28,	%f24
	sethi	0x19A2,	%i0
	fmovse	%xcc,	%f11,	%f1
	flush	%l7 + 0x5C
	sra	%o4,	0x16,	%g4
	fbge,a	%fcc1,	loop_2234
	movrgez	%o0,	0x28A,	%i3
	array32	%g2,	%l4,	%o7
	fxnor	%f10,	%f28,	%f16
loop_2234:
	fmovdpos	%icc,	%f5,	%f12
	fmovrdgez	%l6,	%f30,	%f12
	tcc	%xcc,	0x6
	fmul8sux16	%f6,	%f10,	%f22
	udivcc	%i2,	0x0660,	%i5
	bne,a	%icc,	loop_2235
	stb	%g1,	[%l7 + 0x6F]
	orcc	%g7,	%o6,	%l2
	mulscc	%o5,	%g3,	%i6
loop_2235:
	fmovs	%f30,	%f15
	fmuld8ulx16	%f27,	%f14,	%f8
	tge	%xcc,	0x2
	srax	%l0,	%g5,	%o1
	xor	%l1,	%i4,	%i1
	edge16l	%o3,	%g6,	%i7
	xnor	%o2,	0x0FDD,	%l5
	set	0x40, %g5
	stda	%f16,	[%l7 + %g5] 0x1e
	membar	#Sync
	movrlez	%l3,	%i0,	%g4
	membar	0x4E
	bcc,pt	%icc,	loop_2236
	tsubcc	%o0,	%i3,	%g2
	movg	%xcc,	%o4,	%o7
	tn	%icc,	0x2
loop_2236:
	std	%f12,	[%l7 + 0x78]
	udiv	%l4,	0x05C5,	%l6
	fpadd16	%f4,	%f28,	%f2
	brlz	%i5,	loop_2237
	fmovdcc	%icc,	%f20,	%f28
	fmovsg	%icc,	%f16,	%f18
	ta	%icc,	0x3
loop_2237:
	flush	%l7 + 0x4C
	bleu,a	loop_2238
	movn	%icc,	%i2,	%g1
	stw	%o6,	[%l7 + 0x6C]
	fmovrse	%g7,	%f30,	%f23
loop_2238:
	sllx	%l2,	%o5,	%g3
	wr	%g0,	0x19,	%asi
	stwa	%l0,	[%l7 + 0x24] %asi
	membar	0x07
	fbo	%fcc0,	loop_2239
	xorcc	%g5,	%i6,	%l1
	flush	%l7 + 0x44
	fbo	%fcc2,	loop_2240
loop_2239:
	alignaddrl	%i4,	%i1,	%o1
	set	0x64, %l6
	lduwa	[%l7 + %l6] 0x11,	%o3
loop_2240:
	fmovscc	%icc,	%f2,	%f6
	bl,a	loop_2241
	addcc	%i7,	0x0E3E,	%o2
	ldd	[%l7 + 0x70],	%l4
	edge32	%g6,	%l3,	%i0
loop_2241:
	fmovrdgez	%g4,	%f18,	%f10
	add	%o0,	%i3,	%o4
	sethi	0x14EA,	%o7
	movcs	%xcc,	%g2,	%l4
	umul	%i5,	0x17C9,	%l6
	nop
	setx	0x3A7A9179,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f23
	setx	0x962475C9,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f4
	fsubs	%f4,	%f23,	%f9
	array16	%i2,	%g1,	%g7
	fmovsle	%icc,	%f8,	%f0
	mova	%icc,	%o6,	%o5
	edge16l	%g3,	%l0,	%l2
	ble,pt	%icc,	loop_2242
	fnot1s	%f18,	%f26
	nop
	set	0x60, %i5
	ldsw	[%l7 + %i5],	%g5
	smulcc	%l1,	%i4,	%i6
loop_2242:
	fba	%fcc3,	loop_2243
	fpsub16	%f2,	%f6,	%f28
	tgu	%icc,	0x2
	tpos	%icc,	0x6
loop_2243:
	brnz,a	%i1,	loop_2244
	fmuld8sux16	%f7,	%f22,	%f14
	movl	%xcc,	%o3,	%o1
	movn	%xcc,	%i7,	%o2
loop_2244:
	for	%f24,	%f6,	%f10
	fbu,a	%fcc0,	loop_2245
	srlx	%l5,	%l3,	%g6
	movrlez	%i0,	%o0,	%i3
	orncc	%o4,	0x0CF5,	%g4
loop_2245:
	array32	%o7,	%g2,	%i5
	be	loop_2246
	fmovsvs	%icc,	%f22,	%f4
	alignaddrl	%l6,	%l4,	%i2
	movpos	%icc,	%g1,	%o6
loop_2246:
	tsubcc	%g7,	%g3,	%o5
	movrne	%l2,	0x3C5,	%l0
	nop
	setx loop_2247, %l0, %l1
	jmpl %l1, %l1
	bvc	%xcc,	loop_2248
	udivx	%g5,	0x167C,	%i6
	set	0x1F, %g2
	stba	%i1,	[%l7 + %g2] 0x2a
	membar	#Sync
loop_2247:
	subcc	%i4,	%o3,	%o1
loop_2248:
	addcc	%o2,	0x1EF0,	%l5
	call	loop_2249
	popc	%l3,	%g6
	andcc	%i0,	%i7,	%o0
	fbl,a	%fcc2,	loop_2250
loop_2249:
	edge32ln	%i3,	%g4,	%o7
	fmovsvs	%xcc,	%f22,	%f3
	fzeros	%f29
loop_2250:
	ldd	[%l7 + 0x30],	%o4
	ldub	[%l7 + 0x5F],	%i5
	fblg,a	%fcc2,	loop_2251
	tgu	%icc,	0x5
	smulcc	%l6,	0x17D1,	%l4
	sth	%i2,	[%l7 + 0x18]
loop_2251:
	movrlez	%g2,	0x105,	%g1
	wr	%g0,	0x80,	%asi
	ldstuba	[%l7 + 0x1C] %asi,	%o6
	udivcc	%g7,	0x0C52,	%o5
	popc	0x1923,	%g3
	bne,a	loop_2252
	addcc	%l2,	%l1,	%g5
	movrlez	%l0,	0x22D,	%i1
	mulx	%i4,	%i6,	%o1
loop_2252:
	nop
	wr	%g0,	0x2a,	%asi
	stha	%o3,	[%l7 + 0x6E] %asi
	membar	#Sync
	movcc	%icc,	%o2,	%l3
	srax	%l5,	%i0,	%g6
	or	%o0,	%i3,	%g4
	movre	%o7,	%i7,	%i5
	brlz	%l6,	loop_2253
	fxors	%f27,	%f22,	%f20
	addc	%l4,	0x15B7,	%i2
	ble	%xcc,	loop_2254
loop_2253:
	xor	%o4,	%g1,	%o6
	movrgez	%g2,	%o5,	%g7
	be,a,pt	%xcc,	loop_2255
loop_2254:
	movleu	%icc,	%l2,	%l1
	sdivx	%g3,	0x0C3C,	%g5
	fbo	%fcc1,	loop_2256
loop_2255:
	or	%i1,	%i4,	%l0
	nop
	fitos	%f12,	%f7
	fstod	%f7,	%f30
	edge32n	%o1,	%i6,	%o3
loop_2256:
	or	%o2,	%l3,	%l5
	and	%i0,	0x0AAC,	%o0
	taddcc	%g6,	%i3,	%o7
	nop
	setx loop_2257, %l0, %l1
	jmpl %l1, %i7
	movneg	%icc,	%g4,	%i5
	nop
	setx	0xA951A0A0,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f16
	fsqrts	%f16,	%f12
	bpos,a	loop_2258
loop_2257:
	edge8n	%l6,	%i2,	%o4
	tl	%xcc,	0x7
	edge16ln	%l4,	%o6,	%g1
loop_2258:
	tleu	%icc,	0x6
	tneg	%xcc,	0x3
	fabsd	%f2,	%f0
	fmovsvs	%xcc,	%f22,	%f2
	fnegd	%f26,	%f26
	fcmple32	%f4,	%f18,	%o5
	bleu,a	%icc,	loop_2259
	movrne	%g2,	0x04E,	%l2
	fmovdge	%icc,	%f23,	%f8
	fandnot1	%f4,	%f22,	%f30
loop_2259:
	addc	%g7,	%l1,	%g5
	xnorcc	%g3,	0x1A3E,	%i1
	fmovrdne	%i4,	%f22,	%f0
	smulcc	%l0,	%o1,	%i6
	faligndata	%f14,	%f18,	%f30
	nop
	setx loop_2260, %l0, %l1
	jmpl %l1, %o3
	orncc	%o2,	0x0F5F,	%l3
	fpadd16s	%f24,	%f23,	%f15
	movrne	%l5,	0x281,	%i0
loop_2260:
	fandnot1	%f0,	%f10,	%f20
	udivx	%o0,	0x043C,	%i3
	movneg	%xcc,	%o7,	%g6
	edge32ln	%g4,	%i5,	%l6
	fnors	%f20,	%f9,	%f18
	sir	0x1E05
	movneg	%icc,	%i7,	%o4
	nop
	set	0x6A, %i3
	ldub	[%l7 + %i3],	%l4
	fmovscc	%xcc,	%f21,	%f7
	smulcc	%i2,	%o6,	%g1
	ta	%icc,	0x1
	bge	%icc,	loop_2261
	fmul8x16au	%f27,	%f13,	%f16
	addcc	%o5,	%l2,	%g7
	fmovda	%xcc,	%f2,	%f17
loop_2261:
	sll	%l1,	0x12,	%g2
	bneg,a	%xcc,	loop_2262
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrdgz	%g3,	%f18,	%f8
	edge8	%i1,	%i4,	%g5
loop_2262:
	alignaddrl	%l0,	%o1,	%i6
	fnands	%f31,	%f20,	%f10
	srl	%o2,	0x1D,	%l3
	smulcc	%l5,	%o3,	%o0
	fpackfix	%f10,	%f25
	tleu	%xcc,	0x2
	nop
	setx	0x767F697D233E3FDC,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0xBE0292AE9AB32D4B,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	faddd	%f30,	%f16,	%f12
	xnorcc	%i0,	%o7,	%i3
	movpos	%icc,	%g6,	%i5
	movre	%g4,	%i7,	%o4
	fpadd32s	%f14,	%f10,	%f13
	fzeros	%f26
	movrlez	%l6,	0x37A,	%l4
	smulcc	%o6,	0x077B,	%g1
	wr	%g0,	0x0c,	%asi
	prefetcha	[%l7 + 0x68] %asi,	 0x0
	stx	%o5,	[%l7 + 0x10]
	stx	%l2,	[%l7 + 0x68]
	fandnot1s	%f31,	%f19,	%f30
	tl	%xcc,	0x4
	mulx	%g7,	0x000E,	%g2
	orcc	%g3,	0x09F8,	%l1
	subccc	%i1,	0x1A5F,	%i4
	edge16n	%g5,	%l0,	%i6
	nop
	setx	loop_2263,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	array8	%o2,	%l3,	%o1
	fmovdleu	%icc,	%f25,	%f16
	andncc	%o3,	%o0,	%l5
loop_2263:
	alignaddrl	%o7,	%i0,	%g6
	sir	0x039B
	edge32l	%i3,	%i5,	%i7
	and	%o4,	0x0964,	%g4
	smulcc	%l4,	%l6,	%o6
	movg	%icc,	%i2,	%o5
	wr	%g0,	0x23,	%asi
	ldda	[%l7 + 0x60] %asi,	%l2
	set	0x18, %o4
	ldstuba	[%l7 + %o4] 0x18,	%g1
	fmovsleu	%icc,	%f12,	%f22
	tvs	%icc,	0x7
	fsrc1s	%f25,	%f31
	tsubcc	%g2,	0x0D51,	%g7
	add	%g3,	%i1,	%i4
	fcmple32	%f16,	%f4,	%l1
	addccc	%g5,	0x1EAC,	%l0
	movrgz	%i6,	0x0F2,	%l3
	movne	%icc,	%o1,	%o2
	nop
	set	0x6C, %l3
	prefetch	[%l7 + %l3],	 0x2
	tne	%icc,	0x4
	umul	%o3,	0x0A0E,	%l5
	fone	%f30
	edge16	%o0,	%i0,	%g6
	andn	%i3,	%o7,	%i5
	sir	0x0B10
	taddcctv	%i7,	0x09A8,	%g4
	wr	%g0,	0x81,	%asi
	swapa	[%l7 + 0x18] %asi,	%l4
	movneg	%xcc,	%l6,	%o6
	edge32	%i2,	%o5,	%l2
	sub	%o4,	%g2,	%g7
	fcmpeq32	%f22,	%f28,	%g1
	set	0x24, %g4
	sta	%f6,	[%l7 + %g4] 0x04
	nop
	fitod	%f6,	%f14
	fdtox	%f14,	%f30
	fxtod	%f30,	%f8
	add	%i1,	0x0F51,	%i4
	fpsub32	%f14,	%f12,	%f16
	fbge,a	%fcc3,	loop_2264
	sra	%l1,	%g3,	%l0
	tgu	%xcc,	0x4
	andn	%g5,	%i6,	%o1
loop_2264:
	srax	%l3,	0x1E,	%o2
	tsubcc	%o3,	0x07CA,	%o0
	tcc	%xcc,	0x2
	fmovrse	%i0,	%f10,	%f30
	tsubcctv	%l5,	%g6,	%i3
	mova	%icc,	%o7,	%i5
	fxor	%f20,	%f12,	%f24
	wr	%g0,	0x81,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	mulscc	%i7,	0x1269,	%g4
	fcmple32	%f26,	%f24,	%l4
	taddcctv	%l6,	%i2,	%o6
	movpos	%xcc,	%l2,	%o5
	prefetch	[%l7 + 0x50],	 0x3
	add	%g2,	%o4,	%g1
	fmovdle	%icc,	%f22,	%f2
	smul	%g7,	0x1925,	%i4
	fzeros	%f0
	fexpand	%f7,	%f28
	sdiv	%l1,	0x0C75,	%i1
	fmovdle	%xcc,	%f25,	%f12
	fcmpeq16	%f16,	%f8,	%l0
	wr	%g0,	0x04,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	movn	%icc,	%g5,	%i6
	fmovdcc	%icc,	%f15,	%f21
	stb	%o1,	[%l7 + 0x2B]
	nop
	fitod	%f31,	%f16
	smulcc	%g3,	%l3,	%o3
	tleu	%icc,	0x1
	sdivcc	%o0,	0x195C,	%o2
	wr	%g0,	0x88,	%asi
	swapa	[%l7 + 0x6C] %asi,	%i0
	nop
	setx	0xF04D6CE7,	%l0,	%l6
	st	%l6,	[%l7 + 0x68]
	ld	[%l7 + 0x68],	%fsr
	call	loop_2265
	bge,pt	%icc,	loop_2266
	edge8	%l5,	%i3,	%o7
	ldd	[%l7 + 0x40],	%f12
loop_2265:
	fandnot2s	%f6,	%f28,	%f19
loop_2266:
	tsubcctv	%g6,	0x0DC3,	%i7
	bn,pt	%icc,	loop_2267
	udivx	%g4,	0x0861,	%l4
	set	0x74, %l1
	lduwa	[%l7 + %l1] 0x14,	%l6
loop_2267:
	fmovrsgez	%i2,	%f21,	%f8
	bgu,a	loop_2268
	subccc	%i5,	%l2,	%o5
	umulcc	%o6,	%o4,	%g1
	nop
	set	0x10, %o6
	stw	%g7,	[%l7 + %o6]
loop_2268:
	fpadd16s	%f13,	%f0,	%f18
	andn	%i4,	%l1,	%g2
	sdivcc	%l0,	0x034A,	%g5
	subcc	%i6,	%i1,	%g3
	set	0x0E, %i2
	lduha	[%l7 + %i2] 0x04,	%l3
	array8	%o3,	%o0,	%o2
	nop
	setx	0x825D6B655B661EF0,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0x406B6B3F57EA4A69,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	fsubd	%f20,	%f0,	%f24
	srlx	%i0,	%l5,	%i3
	tgu	%icc,	0x4
	edge8ln	%o1,	%o7,	%g6
	set	0x69, %g7
	stba	%g4,	[%l7 + %g7] 0xea
	membar	#Sync
	addcc	%i7,	0x0680,	%l6
	tle	%icc,	0x1
	edge8n	%l4,	%i5,	%i2
	movrgez	%o5,	0x034,	%l2
	set	0x7C, %l0
	ldswa	[%l7 + %l0] 0x89,	%o4
	fblg	%fcc3,	loop_2269
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orn	%g1,	%g7,	%i4
	add	%l7,	0x08,	%l6
	wr	%g0,	0x04,	%asi
	ldxa	[%l6] %asi,	%l1
	casxa	[%l6] %asi,	%l1,	%g2
loop_2269:
	tleu	%xcc,	0x2
	movvs	%icc,	%l0,	%o6
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x50] %asi,	%g5
	ldd	[%l7 + 0x58],	%f16
	tleu	%xcc,	0x0
	set	0x1A, %o2
	ldsha	[%l7 + %o2] 0x18,	%i6
	tleu	%xcc,	0x2
	fbge	%fcc2,	loop_2270
	orn	%i1,	0x15EF,	%g3
	udivcc	%l3,	0x0164,	%o3
	tgu	%xcc,	0x2
loop_2270:
	fmovdge	%xcc,	%f13,	%f28
	brgz	%o0,	loop_2271
	edge16	%o2,	%l5,	%i0
	fzeros	%f6
	movleu	%icc,	%i3,	%o1
loop_2271:
	nop
	setx	0xF5D7E1842B11CF44,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	setx	0xC1F91492C9EDB9A2,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	fsubd	%f30,	%f18,	%f18
	movgu	%xcc,	%o7,	%g4
	wr	%g0,	0x22,	%asi
	stba	%g6,	[%l7 + 0x08] %asi
	membar	#Sync
	movne	%icc,	%l6,	%l4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tpos	%xcc,	0x2
	bne,pt	%xcc,	loop_2272
	fxor	%f16,	%f0,	%f18
	fbn,a	%fcc3,	loop_2273
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2272:
	nop
	setx	0x8BBCA5291B775303,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0x7F21352CDA90042F,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	fdivd	%f4,	%f0,	%f2
	movleu	%icc,	%i5,	%i2
loop_2273:
	edge16ln	%i7,	%o5,	%o4
	tvs	%xcc,	0x0
	st	%f9,	[%l7 + 0x3C]
	udivx	%l2,	0x11EF,	%g7
	fandnot2	%f4,	%f10,	%f0
	fmovsn	%xcc,	%f20,	%f2
	fpack32	%f28,	%f16,	%f16
	sdivcc	%i4,	0x142E,	%l1
	be	loop_2274
	fmovdl	%xcc,	%f23,	%f13
	movcs	%icc,	%g2,	%g1
	wr	%g0,	0x19,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
loop_2274:
	and	%l0,	%o6,	%g5
	fornot2	%f10,	%f8,	%f28
	edge16ln	%i1,	%g3,	%i6
	sethi	0x1C64,	%o3
	sdivx	%l3,	0x1229,	%o2
	srl	%o0,	0x16,	%l5
	add	%i3,	0x0E4C,	%o1
	movne	%xcc,	%o7,	%i0
	fpadd16	%f20,	%f10,	%f26
	and	%g6,	%g4,	%l6
	fbne	%fcc0,	loop_2275
	edge16l	%i5,	%l4,	%i2
	fmovscs	%xcc,	%f22,	%f11
	nop
	setx	loop_2276,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_2275:
	movrlz	%i7,	0x098,	%o5
	membar	0x4D
	brlz,a	%o4,	loop_2277
loop_2276:
	brgez,a	%g7,	loop_2278
	bne,pt	%xcc,	loop_2279
	fmovrdlz	%l2,	%f16,	%f18
loop_2277:
	mova	%xcc,	%l1,	%g2
loop_2278:
	fbo,a	%fcc0,	loop_2280
loop_2279:
	xorcc	%i4,	0x0E89,	%g1
	tneg	%xcc,	0x1
	sra	%l0,	0x08,	%o6
loop_2280:
	xnorcc	%i1,	%g5,	%i6
	fmovrse	%o3,	%f18,	%f0
	wr	%g0,	0x81,	%asi
	ldswa	[%l7 + 0x58] %asi,	%g3
	sll	%l3,	0x19,	%o2
	sub	%o0,	%l5,	%i3
	ldub	[%l7 + 0x40],	%o1
	and	%o7,	0x0B61,	%i0
	edge16ln	%g4,	%l6,	%g6
	subcc	%l4,	0x188C,	%i5
	taddcc	%i7,	0x043F,	%o5
	movrne	%i2,	0x10F,	%o4
	smulcc	%l2,	0x149E,	%g7
	movcs	%xcc,	%g2,	%l1
	ld	[%l7 + 0x08],	%f22
	tcs	%xcc,	0x7
	ldsb	[%l7 + 0x41],	%g1
	sll	%l0,	%i4,	%o6
	fmuld8sux16	%f1,	%f16,	%f24
	orcc	%i1,	%g5,	%i6
	fmovse	%icc,	%f20,	%f18
	edge16	%g3,	%o3,	%o2
	tcc	%xcc,	0x6
	fmovdpos	%xcc,	%f29,	%f21
	ld	[%l7 + 0x64],	%f5
	fands	%f20,	%f13,	%f12
	wr	%g0,	0x89,	%asi
	ldswa	[%l7 + 0x08] %asi,	%l3
	movcs	%icc,	%o0,	%l5
	set	0x38, %l4
	ldswa	[%l7 + %l4] 0x89,	%o1
	fmovrslez	%o7,	%f21,	%f17
	sllx	%i0,	%g4,	%i3
	tpos	%icc,	0x1
	fmovsl	%icc,	%f28,	%f30
	movpos	%icc,	%g6,	%l6
	set	0x14, %i0
	swapa	[%l7 + %i0] 0x81,	%i5
	fbn,a	%fcc0,	loop_2281
	edge32n	%l4,	%o5,	%i7
	fpack32	%f8,	%f0,	%f20
	udiv	%i2,	0x0479,	%l2
loop_2281:
	add	%o4,	%g7,	%l1
	edge32n	%g1,	%l0,	%i4
	movle	%icc,	%o6,	%g2
	sir	0x0B6A
	tcc	%xcc,	0x0
	movneg	%xcc,	%i1,	%g5
	movleu	%icc,	%i6,	%g3
	bshuffle	%f6,	%f30,	%f22
	set	0x1A, %i7
	ldsha	[%l7 + %i7] 0x88,	%o3
	fcmpeq16	%f22,	%f8,	%o2
	sethi	0x0CE7,	%l3
	addc	%l5,	%o1,	%o7
	tvs	%xcc,	0x0
	movl	%xcc,	%i0,	%g4
	subccc	%i3,	%g6,	%o0
	movne	%icc,	%i5,	%l4
	set	0x50, %o5
	ldda	[%l7 + %o5] 0x81,	%o4
	membar	0x72
	movl	%xcc,	%l6,	%i7
	movcs	%icc,	%l2,	%o4
	edge8ln	%g7,	%i2,	%l1
	xnor	%g1,	%l0,	%i4
	ldsb	[%l7 + 0x12],	%g2
	movrne	%i1,	0x031,	%g5
	tpos	%icc,	0x2
	set	0x24, %o7
	lda	[%l7 + %o7] 0x10,	%f6
	tg	%icc,	0x5
	faligndata	%f8,	%f6,	%f0
	udiv	%i6,	0x0CD7,	%g3
	fandnot1s	%f17,	%f24,	%f22
	edge32ln	%o3,	%o6,	%o2
	movneg	%icc,	%l5,	%o1
	nop
	fitod	%f13,	%f16
	fbul	%fcc2,	loop_2282
	stx	%l3,	[%l7 + 0x08]
	tpos	%icc,	0x0
	sdivcc	%i0,	0x1BD1,	%o7
loop_2282:
	fpadd32	%f20,	%f0,	%f12
	fmovsn	%icc,	%f21,	%f22
	set	0x7F, %g3
	ldsba	[%l7 + %g3] 0x88,	%i3
	srl	%g6,	0x11,	%g4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fba,a	%fcc3,	loop_2283
	move	%icc,	%o0,	%l4
	fmovsvc	%xcc,	%f10,	%f17
	movrgz	%o5,	%i5,	%i7
loop_2283:
	fmovdvc	%xcc,	%f24,	%f27
	bne	loop_2284
	array16	%l2,	%l6,	%g7
	or	%i2,	0x1CF3,	%o4
	nop
	fitod	%f6,	%f30
	fdtox	%f30,	%f18
loop_2284:
	nop
	wr	%g0,	0x89,	%asi
	stha	%g1,	[%l7 + 0x44] %asi
	movcc	%icc,	%l1,	%i4
	sllx	%l0,	0x1E,	%g2
	sub	%g5,	%i6,	%i1
	flush	%l7 + 0x3C
	ldsb	[%l7 + 0x29],	%g3
	sir	0x003F
	bl	loop_2285
	addccc	%o3,	%o2,	%l5
	tgu	%xcc,	0x1
	fmovscs	%xcc,	%f4,	%f14
loop_2285:
	nop
	wr	%g0,	0x80,	%asi
	lduwa	[%l7 + 0x54] %asi,	%o6
	fcmpeq16	%f10,	%f14,	%o1
	fmovdleu	%xcc,	%f5,	%f31
	fbule,a	%fcc3,	loop_2286
	fblg,a	%fcc1,	loop_2287
	srlx	%i0,	0x08,	%o7
	movcc	%icc,	%l3,	%g6
loop_2286:
	fbug,a	%fcc2,	loop_2288
loop_2287:
	tl	%icc,	0x3
	fones	%f29
	fbu	%fcc0,	loop_2289
loop_2288:
	or	%i3,	0x055A,	%o0
	fbl,a	%fcc3,	loop_2290
	fmovsg	%xcc,	%f30,	%f13
loop_2289:
	fmovrsne	%l4,	%f9,	%f31
	fxnors	%f24,	%f7,	%f29
loop_2290:
	membar	0x54
	ba	%xcc,	loop_2291
	umul	%g4,	0x1CD5,	%o5
	fpmerge	%f31,	%f27,	%f6
	fcmpne16	%f10,	%f16,	%i7
loop_2291:
	fmovrsgez	%l2,	%f25,	%f0
	tsubcc	%l6,	%i5,	%i2
	addccc	%o4,	0x0839,	%g1
	movcc	%icc,	%l1,	%g7
	fmovrslz	%l0,	%f14,	%f7
	xorcc	%g2,	%i4,	%g5
	nop
	setx	0xBFEA909ADBF3B1D0,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0x1639E2B46C1ED31F,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	fmuld	%f4,	%f4,	%f12
	fcmpeq32	%f16,	%f16,	%i6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x58, %i1
	ldswa	[%l7 + %i1] 0x15,	%i1
	xorcc	%o3,	%g3,	%o2
	brlz	%o6,	loop_2292
	ldsw	[%l7 + 0x7C],	%l5
	fmovrdlez	%i0,	%f18,	%f12
	subcc	%o1,	0x0F7D,	%l3
loop_2292:
	fmovsn	%icc,	%f2,	%f21
	movg	%icc,	%o7,	%g6
	fmovdg	%icc,	%f23,	%f18
	edge16	%i3,	%l4,	%o0
	or	%o5,	%i7,	%l2
	and	%g4,	0x1EA5,	%i5
	subc	%i2,	%l6,	%g1
	edge16	%o4,	%g7,	%l0
	sethi	0x1AE9,	%g2
	fnot1	%f18,	%f24
	andncc	%i4,	%l1,	%g5
	or	%i1,	0x109C,	%o3
	fba,a	%fcc3,	loop_2293
	taddcc	%g3,	%i6,	%o6
	subcc	%l5,	0x13AF,	%o2
	set	0x7C, %g6
	ldswa	[%l7 + %g6] 0x18,	%o1
loop_2293:
	nop
	set	0x18, %o1
	prefetcha	[%l7 + %o1] 0x88,	 0x3
	orn	%o7,	0x1453,	%g6
	xnorcc	%l3,	%i3,	%o0
	call	loop_2294
	movneg	%xcc,	%l4,	%i7
	umulcc	%o5,	%g4,	%i5
	tleu	%icc,	0x1
loop_2294:
	array32	%i2,	%l6,	%g1
	fbule	%fcc1,	loop_2295
	nop
	fitos	%f7,	%f9
	fstox	%f9,	%f20
	fxtos	%f20,	%f30
	fnor	%f20,	%f20,	%f14
	movn	%xcc,	%l2,	%o4
loop_2295:
	subc	%g7,	0x01D4,	%g2
	fmovdcc	%xcc,	%f10,	%f15
	movcc	%xcc,	%i4,	%l0
	edge32l	%g5,	%l1,	%i1
	fmovrsgez	%o3,	%f5,	%f10
	movg	%icc,	%i6,	%o6
	fnand	%f4,	%f0,	%f10
	fmovscc	%xcc,	%f3,	%f7
	lduw	[%l7 + 0x60],	%g3
	tcc	%icc,	0x7
	call	loop_2296
	edge8n	%o2,	%l5,	%o1
	movpos	%icc,	%o7,	%g6
	fpack16	%f26,	%f4
loop_2296:
	fnor	%f4,	%f28,	%f24
	srax	%i0,	0x10,	%l3
	srax	%i3,	%l4,	%i7
	bleu,a	%xcc,	loop_2297
	sdivcc	%o5,	0x1133,	%g4
	udiv	%o0,	0x093A,	%i2
	edge8n	%i5,	%g1,	%l6
loop_2297:
	fba	%fcc3,	loop_2298
	fba,a	%fcc3,	loop_2299
	movcs	%icc,	%o4,	%g7
	fmovd	%f30,	%f10
loop_2298:
	movvc	%xcc,	%l2,	%i4
loop_2299:
	fbge,a	%fcc3,	loop_2300
	fpadd32s	%f6,	%f19,	%f31
	flush	%l7 + 0x30
	bpos,a	%icc,	loop_2301
loop_2300:
	fbg	%fcc2,	loop_2302
	smul	%l0,	%g5,	%g2
	edge16ln	%i1,	%o3,	%l1
loop_2301:
	nop
	add	%l7,	0x50,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%i6
	casa	[%l6] 0x81,	%i6,	%g3
loop_2302:
	fnand	%f0,	%f18,	%f10
	wr	%g0,	0x04,	%asi
	lduwa	[%l7 + 0x28] %asi,	%o6
	udivx	%l5,	0x1741,	%o1
	movpos	%xcc,	%o7,	%g6
	call	loop_2303
	sdiv	%i0,	0x06D6,	%l3
	swap	[%l7 + 0x2C],	%o2
	nop
	setx	loop_2304,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_2303:
	fbne,a	%fcc0,	loop_2305
	stx	%l4,	[%l7 + 0x78]
	set	0x54, %o0
	swapa	[%l7 + %o0] 0x80,	%i3
loop_2304:
	tgu	%xcc,	0x5
loop_2305:
	xor	%i7,	%g4,	%o0
	membar	0x55
	tvs	%icc,	0x5
	stb	%i2,	[%l7 + 0x0B]
	alignaddrl	%o5,	%i5,	%g1
	fmovsl	%icc,	%f6,	%f13
	smul	%o4,	0x18AF,	%g7
	movge	%xcc,	%l2,	%i4
	fnand	%f14,	%f2,	%f28
	movvc	%xcc,	%l6,	%g5
	tg	%icc,	0x7
	fmuld8ulx16	%f1,	%f29,	%f22
	tvc	%xcc,	0x1
	fmovrdlez	%g2,	%f6,	%f26
	tn	%icc,	0x6
	fnot2s	%f26,	%f7
	movg	%icc,	%i1,	%l0
	nop
	setx	0x60FB6033,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f23
	setx	0xB8957E42,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f19
	fadds	%f19,	%f23,	%f13
	orcc	%l1,	%i6,	%o3
	umul	%g3,	0x1D36,	%o6
	tvc	%icc,	0x0
	subc	%l5,	0x1686,	%o7
	taddcc	%o1,	0x1FEF,	%g6
	fmovrsne	%l3,	%f10,	%f20
	fbge,a	%fcc3,	loop_2306
	popc	%i0,	%o2
	wr	%g0,	0x81,	%asi
	prefetcha	[%l7 + 0x70] %asi,	 0x3
loop_2306:
	fors	%f4,	%f17,	%f15
	set	0x30, %i6
	stha	%i3,	[%l7 + %i6] 0x10
	add	%l7,	0x28,	%l6
	wr	%g0,	0x0c,	%asi
	casxa	[%l6] 0x0c,	%g4,	%i7
	edge8n	%o0,	%i2,	%o5
	xorcc	%g1,	0x137B,	%o4
	nop
	fitod	%f8,	%f2
	fdtos	%f2,	%f28
	orncc	%i5,	%l2,	%g7
	array8	%l6,	%i4,	%g5
	orcc	%i1,	%g2,	%l0
	nop
	fitod	%f10,	%f6
	fdtos	%f6,	%f1
	mulscc	%l1,	0x10DD,	%o3
	stw	%i6,	[%l7 + 0x2C]
	orcc	%o6,	0x1F6E,	%l5
	fnand	%f14,	%f8,	%f24
	ldd	[%l7 + 0x60],	%g2
	wr	%g0,	0x11,	%asi
	lduha	[%l7 + 0x5A] %asi,	%o7
	fcmple16	%f10,	%f26,	%g6
	brlez,a	%l3,	loop_2307
	membar	0x61
	alignaddr	%i0,	%o2,	%l4
	srlx	%o1,	%g4,	%i3
loop_2307:
	fblg,a	%fcc2,	loop_2308
	fornot2	%f6,	%f22,	%f24
	set	0x14, %l2
	lduwa	[%l7 + %l2] 0x04,	%i7
loop_2308:
	movrgez	%o0,	0x373,	%o5
	edge8ln	%g1,	%i2,	%o4
	fornot1s	%f21,	%f6,	%f9
	ld	[%l7 + 0x70],	%f30
	fmul8sux16	%f30,	%f22,	%f26
	sdiv	%l2,	0x13FF,	%g7
	wr	%g0,	0x81,	%asi
	ldda	[%l7 + 0x10] %asi,	%i4
	sllx	%l6,	%g5,	%i1
	tcc	%xcc,	0x5
	alignaddrl	%g2,	%l0,	%l1
	fbg	%fcc0,	loop_2309
	movpos	%xcc,	%o3,	%i4
	smul	%i6,	0x10B0,	%l5
	fmuld8sux16	%f28,	%f10,	%f28
loop_2309:
	ldd	[%l7 + 0x08],	%g2
	fbuge	%fcc2,	loop_2310
	brgz	%o7,	loop_2311
	movre	%o6,	%l3,	%g6
	mulx	%o2,	%i0,	%o1
loop_2310:
	edge16ln	%l4,	%i3,	%g4
loop_2311:
	edge32n	%o0,	%o5,	%i7
	orn	%i2,	0x075E,	%g1
	bvc,a	%xcc,	loop_2312
	ldx	[%l7 + 0x10],	%o4
	fpadd32	%f2,	%f18,	%f20
	brlz,a	%g7,	loop_2313
loop_2312:
	tg	%xcc,	0x0
	xnorcc	%i5,	%l2,	%l6
	bgu,a	loop_2314
loop_2313:
	alignaddrl	%g5,	%i1,	%l0
	subc	%g2,	0x0E50,	%o3
	edge8ln	%l1,	%i6,	%l5
loop_2314:
	edge32l	%g3,	%o7,	%o6
	add	%i4,	%g6,	%l3
	edge8ln	%i0,	%o2,	%o1
	edge8l	%l4,	%i3,	%g4
	subcc	%o5,	%o0,	%i7
	tgu	%xcc,	0x1
	bge,pt	%icc,	loop_2315
	sir	0x180C
	movvc	%xcc,	%g1,	%o4
	fnand	%f24,	%f26,	%f10
loop_2315:
	fbe	%fcc0,	loop_2316
	subcc	%g7,	%i2,	%i5
	bl	%xcc,	loop_2317
	movg	%icc,	%l2,	%l6
loop_2316:
	brnz	%i1,	loop_2318
	tcc	%icc,	0x2
loop_2317:
	tleu	%icc,	0x7
	movgu	%xcc,	%l0,	%g2
loop_2318:
	fcmpgt32	%f20,	%f12,	%g5
	fpsub32s	%f25,	%f28,	%f3
	set	0x51, %o3
	stba	%l1,	[%l7 + %o3] 0xe3
	membar	#Sync
	bge	loop_2319
	edge8l	%i6,	%o3,	%g3
	smul	%o7,	%l5,	%i4
	edge16n	%o6,	%l3,	%g6
loop_2319:
	sdivx	%i0,	0x0E02,	%o1
	be	%icc,	loop_2320
	array8	%l4,	%i3,	%g4
	edge8ln	%o2,	%o0,	%i7
	edge8n	%g1,	%o4,	%g7
loop_2320:
	edge16ln	%o5,	%i2,	%i5
	bvs,pt	%icc,	loop_2321
	or	%l2,	0x0957,	%i1
	smul	%l6,	%l0,	%g5
	nop
	setx	0xD07A4171,	%l0,	%l6
	st	%l6,	[%l7 + 0x14]
	ld	[%l7 + 0x14],	%fsr
loop_2321:
	movleu	%xcc,	%l1,	%i6
	addcc	%g2,	0x072D,	%o3
	fmovs	%f6,	%f23
	subc	%g3,	0x122D,	%o7
	umulcc	%l5,	%o6,	%i4
	set	0x1C, %i4
	sta	%f27,	[%l7 + %i4] 0x0c
	tcs	%xcc,	0x3
	nop
	fitod	%f10,	%f8
	fdtox	%f8,	%f22
	fxtod	%f22,	%f28
	sir	0x1CFE
	movre	%g6,	0x051,	%l3
	xnorcc	%i0,	%l4,	%o1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrdgz	%g4,	%f0,	%f12
	edge32n	%o2,	%i3,	%o0
	sll	%i7,	0x19,	%g1
	set	0x09, %l5
	ldsba	[%l7 + %l5] 0x14,	%g7
	sra	%o4,	%i2,	%i5
	bgu,a,pn	%xcc,	loop_2322
	sdivx	%o5,	0x146C,	%i1
	sethi	0x1869,	%l6
	movge	%icc,	%l2,	%g5
loop_2322:
	movg	%icc,	%l0,	%i6
	nop
	setx	loop_2323,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tge	%icc,	0x6
	fbue,a	%fcc2,	loop_2324
	edge8l	%l1,	%g2,	%g3
loop_2323:
	fmovdleu	%icc,	%f0,	%f15
	movre	%o3,	0x1BC,	%l5
loop_2324:
	bneg,a	%xcc,	loop_2325
	xorcc	%o6,	%i4,	%g6
	fbge	%fcc1,	loop_2326
	movcc	%xcc,	%o7,	%i0
loop_2325:
	fcmpgt32	%f2,	%f16,	%l4
	fmovrdgz	%o1,	%f18,	%f6
loop_2326:
	alignaddr	%l3,	%g4,	%i3
	fpadd32	%f10,	%f20,	%f10
	add	%o0,	%i7,	%o2
	tge	%xcc,	0x3
	add	%g1,	%o4,	%i2
	sethi	0x084A,	%g7
	bleu	loop_2327
	movrgz	%i5,	0x236,	%i1
	fble	%fcc1,	loop_2328
	fzeros	%f8
loop_2327:
	fsrc2	%f16,	%f20
	wr	%g0,	0x80,	%asi
	ldsba	[%l7 + 0x50] %asi,	%l6
loop_2328:
	movle	%icc,	%o5,	%g5
	wr	%g0,	0x18,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnor	%f10,	%f0,	%f16
	edge16l	%l0,	%i6,	%l2
	fornot2	%f0,	%f0,	%f22
	xnor	%l1,	0x13E5,	%g3
	fxor	%f8,	%f26,	%f28
	xnorcc	%o3,	0x081A,	%l5
	ta	%icc,	0x6
	fmul8x16	%f26,	%f30,	%f14
	umulcc	%o6,	0x1772,	%g2
	nop
	setx loop_2329, %l0, %l1
	jmpl %l1, %g6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mulx	%i4,	0x0461,	%o7
	stw	%l4,	[%l7 + 0x74]
loop_2329:
	tle	%icc,	0x3
	mulscc	%o1,	0x0D11,	%l3
	tsubcc	%g4,	0x0439,	%i3
	movgu	%icc,	%o0,	%i7
	fbe,a	%fcc1,	loop_2330
	membar	0x52
	nop
	fitod	%f4,	%f18
	fdtox	%f18,	%f26
	movcs	%icc,	%i0,	%o2
loop_2330:
	tpos	%icc,	0x0
	fmovdcs	%icc,	%f10,	%f28
	tne	%xcc,	0x3
	movcs	%icc,	%o4,	%g1
	tcs	%icc,	0x7
	fones	%f13
	edge8	%g7,	%i5,	%i2
	movrlz	%l6,	0x1C9,	%o5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	smulcc	%g5,	%i1,	%i6
	st	%f4,	[%l7 + 0x2C]
	tsubcctv	%l0,	%l2,	%l1
	fmovs	%f0,	%f22
	sdivx	%o3,	0x08B5,	%g3
	edge32	%l5,	%o6,	%g6
	tn	%icc,	0x7
	array8	%i4,	%o7,	%l4
	add	%l7,	0x58,	%l6
	wr	%g0,	0x11,	%asi
	casa	[%l6] %asi,	%o1,	%g2
	fexpand	%f11,	%f26
	movrgez	%l3,	%g4,	%i3
	fcmpeq16	%f16,	%f12,	%i7
	movre	%o0,	0x391,	%o2
	wr	%g0,	0x89,	%asi
	lduha	[%l7 + 0x1C] %asi,	%o4
	nop
	setx loop_2331, %l0, %l1
	jmpl %l1, %i0
	orn	%g7,	0x03C6,	%g1
	wr	%g0,	0x81,	%asi
	lduwa	[%l7 + 0x4C] %asi,	%i5
loop_2331:
	fmovsl	%icc,	%f30,	%f30
	set	0x30, %g1
	ldsha	[%l7 + %g1] 0x18,	%i2
	xnorcc	%l6,	%g5,	%i1
	fbge	%fcc0,	loop_2332
	fnor	%f6,	%f24,	%f28
	bgu,pt	%icc,	loop_2333
	ba	%icc,	loop_2334
loop_2332:
	popc	0x076F,	%i6
	mulscc	%l0,	0x1710,	%o5
loop_2333:
	xnorcc	%l2,	0x0D69,	%o3
loop_2334:
	edge16	%l1,	%g3,	%l5
	addccc	%g6,	0x04F2,	%o6
	movpos	%icc,	%o7,	%l4
	fmovrslz	%i4,	%f21,	%f21
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x7A, %l6
	ldstuba	[%l7 + %l6] 0x89,	%g2
	orcc	%o1,	0x0C62,	%g4
	addcc	%i3,	0x1CC6,	%l3
	tgu	%xcc,	0x0
	movrlez	%o0,	%o2,	%i7
	fbl	%fcc2,	loop_2335
	mulx	%i0,	0x1507,	%o4
	fmovsvs	%icc,	%f20,	%f17
	membar	0x41
loop_2335:
	movrne	%g1,	0x23E,	%i5
	movle	%icc,	%i2,	%g7
	fbu	%fcc1,	loop_2336
	srlx	%g5,	0x19,	%l6
	movre	%i6,	0x212,	%i1
	taddcc	%o5,	%l2,	%o3
loop_2336:
	edge16ln	%l0,	%g3,	%l5
	movne	%icc,	%l1,	%g6
	subc	%o7,	%l4,	%i4
	set	0x3A, %g5
	stba	%o6,	[%l7 + %g5] 0x88
	movre	%g2,	0x070,	%g4
	edge16n	%o1,	%l3,	%i3
	fmovrsne	%o0,	%f25,	%f12
	sth	%i7,	[%l7 + 0x24]
	sir	0x0116
	bgu,pn	%icc,	loop_2337
	orn	%i0,	0x0F99,	%o2
	sdivcc	%g1,	0x03BC,	%o4
	lduh	[%l7 + 0x16],	%i5
loop_2337:
	smulcc	%i2,	0x1B94,	%g5
	fors	%f25,	%f26,	%f24
	brgez	%l6,	loop_2338
	movrgez	%i6,	0x06E,	%g7
	fnor	%f8,	%f26,	%f18
	stb	%i1,	[%l7 + 0x6E]
loop_2338:
	popc	0x0083,	%o5
	sdiv	%o3,	0x09BC,	%l0
	bcs	%xcc,	loop_2339
	movrgez	%l2,	0x06C,	%g3
	tsubcc	%l1,	0x09AD,	%g6
	fnor	%f4,	%f8,	%f16
loop_2339:
	fmuld8ulx16	%f4,	%f3,	%f16
	addc	%o7,	0x17E5,	%l4
	orncc	%i4,	%o6,	%g2
	movvs	%xcc,	%g4,	%o1
	srlx	%l5,	0x02,	%i3
	srlx	%o0,	0x16,	%l3
	fabsd	%f18,	%f22
	sll	%i7,	%i0,	%o2
	fblg,a	%fcc2,	loop_2340
	movrgez	%g1,	0x0BF,	%o4
	array8	%i5,	%g5,	%i2
	tle	%icc,	0x7
loop_2340:
	alignaddrl	%i6,	%l6,	%i1
	subcc	%g7,	0x189C,	%o3
	ldd	[%l7 + 0x18],	%l0
	edge32ln	%o5,	%l2,	%g3
	fmovd	%f16,	%f22
	fbne	%fcc1,	loop_2341
	alignaddr	%g6,	%o7,	%l1
	tcc	%xcc,	0x3
	alignaddr	%l4,	%o6,	%g2
loop_2341:
	tneg	%xcc,	0x4
	ld	[%l7 + 0x7C],	%f20
	sth	%g4,	[%l7 + 0x22]
	subcc	%i4,	0x1870,	%l5
	fmovrslz	%i3,	%f0,	%f13
	wr	%g0,	0x11,	%asi
	lduha	[%l7 + 0x68] %asi,	%o1
	tvc	%icc,	0x1
	movcs	%xcc,	%l3,	%i7
	sth	%i0,	[%l7 + 0x4E]
	mulx	%o2,	0x069E,	%o0
	edge8ln	%g1,	%o4,	%g5
	te	%icc,	0x4
	sethi	0x0311,	%i5
	add	%i2,	0x07AA,	%i6
	movne	%icc,	%l6,	%g7
	bl,a	%xcc,	loop_2342
	membar	0x13
	movcc	%icc,	%o3,	%i1
	orncc	%o5,	%l0,	%l2
loop_2342:
	tvc	%icc,	0x1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subc	%g3,	%g6,	%l1
	tl	%xcc,	0x0
	movrne	%o7,	0x3C5,	%l4
	subc	%g2,	%o6,	%g4
	fors	%f17,	%f28,	%f19
	edge32	%i4,	%i3,	%l5
	nop
	setx	loop_2343,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	subccc	%o1,	%i7,	%l3
	set	0x18, %g2
	prefetcha	[%l7 + %g2] 0x19,	 0x0
loop_2343:
	addc	%o2,	0x1615,	%g1
	fmovrdne	%o0,	%f8,	%f0
	movrlez	%o4,	%i5,	%g5
	fxnor	%f12,	%f28,	%f16
	nop
	setx	0x2AE214FE,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f18
	setx	0xBAD9C1D1,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f6
	fadds	%f6,	%f18,	%f11
	ldub	[%l7 + 0x53],	%i6
	movrgez	%i2,	0x02B,	%g7
	fmovdne	%icc,	%f12,	%f18
	andcc	%o3,	%l6,	%o5
	stb	%l0,	[%l7 + 0x37]
	sdivx	%i1,	0x105E,	%g3
	alignaddr	%g6,	%l1,	%o7
	nop
	fitos	%f12,	%f22
	fstod	%f22,	%f2
	tg	%xcc,	0x6
	sethi	0x0E39,	%l2
	tleu	%xcc,	0x1
	movrgez	%l4,	0x0B0,	%g2
	array8	%g4,	%o6,	%i3
	ldd	[%l7 + 0x08],	%f24
	edge16n	%i4,	%o1,	%l5
	movn	%xcc,	%i7,	%i0
	tle	%icc,	0x4
	movrgz	%o2,	0x03A,	%g1
	ldub	[%l7 + 0x34],	%o0
	edge32l	%o4,	%l3,	%i5
	orn	%i6,	0x033A,	%g5
	fmovdn	%icc,	%f9,	%f21
	addccc	%i2,	0x1997,	%o3
	movrgez	%l6,	0x157,	%o5
	swap	[%l7 + 0x54],	%l0
	sdiv	%i1,	0x0790,	%g3
	flush	%l7 + 0x64
	fmovdn	%icc,	%f7,	%f30
	fzero	%f10
	set	0x30, %i3
	stxa	%g6,	[%l7 + %i3] 0x80
	tn	%xcc,	0x0
	fxnors	%f22,	%f4,	%f5
	fbu	%fcc1,	loop_2344
	fmovdcs	%xcc,	%f2,	%f22
	brlz	%l1,	loop_2345
	popc	%g7,	%o7
loop_2344:
	udiv	%l2,	0x017D,	%l4
	fmovrslz	%g4,	%f4,	%f29
loop_2345:
	fbule	%fcc2,	loop_2346
	ld	[%l7 + 0x64],	%f25
	nop
	set	0x20, %o4
	stx	%g2,	[%l7 + %o4]
	te	%xcc,	0x1
loop_2346:
	nop
	setx	0xCEAE0D0BB611905C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0xA34E80F90051C38D,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	faddd	%f2,	%f16,	%f28
	movne	%icc,	%o6,	%i4
	wr	%g0,	0x80,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	fandnot2	%f8,	%f8,	%f2
	std	%f0,	[%l7 + 0x38]
	tg	%icc,	0x5
	nop
	setx	0x8B5FEC134C65D091,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0x815C351B74E3F787,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	faddd	%f4,	%f30,	%f28
	fmovdleu	%xcc,	%f18,	%f12
	fba,a	%fcc0,	loop_2347
	tsubcctv	%o1,	0x0783,	%l5
	nop
	setx	loop_2348,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fxor	%f12,	%f6,	%f26
loop_2347:
	fmuld8sux16	%f20,	%f12,	%f16
	fmovde	%xcc,	%f19,	%f5
loop_2348:
	fxor	%f28,	%f16,	%f14
	set	0x40, %i5
	swapa	[%l7 + %i5] 0x80,	%i3
	fbuge	%fcc2,	loop_2349
	addc	%i7,	0x0540,	%i0
	sdivx	%g1,	0x08BF,	%o2
	bneg	%icc,	loop_2350
loop_2349:
	udiv	%o0,	0x1F42,	%l3
	fmuld8ulx16	%f11,	%f6,	%f26
	add	%l7,	0x48,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%i5
	casxa	[%l6] 0x81,	%i5,	%o4
loop_2350:
	nop
	set	0x40, %l3
	stda	%f16,	[%l7 + %l3] 0x04
	movg	%xcc,	%g5,	%i6
	fxor	%f8,	%f10,	%f6
	addccc	%o3,	%i2,	%o5
	movleu	%icc,	%l6,	%l0
	or	%i1,	0x101C,	%g6
	alignaddr	%l1,	%g7,	%g3
	fnot2s	%f0,	%f6
	tcs	%xcc,	0x2
	andncc	%o7,	%l4,	%g4
	fmovsge	%xcc,	%f14,	%f7
	bshuffle	%f2,	%f28,	%f22
	edge16ln	%g2,	%l2,	%o6
	fmovrdne	%i4,	%f6,	%f14
	bcs,a,pt	%icc,	loop_2351
	array16	%l5,	%i3,	%o1
	movvc	%icc,	%i0,	%g1
	popc	0x04F4,	%o2
loop_2351:
	fornot1s	%f31,	%f24,	%f30
	movrlz	%i7,	0x23E,	%l3
	edge32l	%i5,	%o0,	%o4
	array8	%g5,	%o3,	%i2
	taddcc	%o5,	%i6,	%l0
	sll	%l6,	0x01,	%g6
	bneg,a	%icc,	loop_2352
	te	%xcc,	0x2
	fmovdge	%icc,	%f21,	%f10
	orncc	%l1,	0x0BD8,	%i1
loop_2352:
	nop
	set	0x18, %l1
	ldsw	[%l7 + %l1],	%g3
	nop
	fitos	%f16,	%f28
	fmovdn	%icc,	%f14,	%f5
	fmovsn	%icc,	%f5,	%f8
	bleu,a	loop_2353
	fpsub16s	%f23,	%f19,	%f31
	edge16l	%g7,	%l4,	%o7
	tpos	%xcc,	0x5
loop_2353:
	edge16ln	%g4,	%l2,	%o6
	brnz	%g2,	loop_2354
	andncc	%l5,	%i3,	%o1
	membar	0x68
	bge	loop_2355
loop_2354:
	fabsd	%f6,	%f24
	udivcc	%i4,	0x1C1B,	%i0
	xnorcc	%o2,	0x089C,	%g1
loop_2355:
	nop
	add	%l7,	0x30,	%l6
	wr	%g0,	0x19,	%asi
	ldxa	[%l6] %asi,	%i7
	casxa	[%l6] %asi,	%i7,	%l3
	udivx	%o0,	0x11C2,	%i5
	fabss	%f23,	%f18
	call	loop_2356
	taddcctv	%g5,	0x1247,	%o4
	edge16l	%o3,	%o5,	%i6
	movg	%xcc,	%i2,	%l0
loop_2356:
	fsrc2	%f6,	%f8
	nop
	fitod	%f0,	%f8
	fdtox	%f8,	%f16
	or	%l6,	%g6,	%i1
	edge8n	%l1,	%g3,	%g7
	fmovsgu	%xcc,	%f15,	%f20
	tpos	%xcc,	0x7
	sir	0x1C92
	sdivx	%l4,	0x0669,	%g4
	andcc	%l2,	0x1979,	%o6
	andn	%g2,	0x0492,	%l5
	umulcc	%o7,	%o1,	%i4
	xor	%i0,	0x00B0,	%o2
	fcmpne16	%f10,	%f28,	%g1
	set	0x7A, %g4
	ldsha	[%l7 + %g4] 0x88,	%i3
	fmovrdgz	%l3,	%f2,	%f0
	movrlz	%i7,	0x1ED,	%i5
	umulcc	%o0,	%g5,	%o4
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
	taddcctv	%o3,	0x0BC7,	%o5
	bgu,a	loop_2358
	fornot2	%f18,	%f8,	%f6
loop_2357:
	movrgz	%i6,	%i2,	%l0
	swap	[%l7 + 0x5C],	%l6
loop_2358:
	tn	%xcc,	0x5
	ble,pn	%xcc,	loop_2359
	edge32n	%i1,	%g6,	%g3
	array32	%l1,	%l4,	%g7
	xnor	%l2,	0x0515,	%o6
loop_2359:
	movge	%xcc,	%g4,	%g2
	sir	0x1593
	tne	%icc,	0x3
	and	%l5,	%o7,	%o1
	addccc	%i4,	0x0A55,	%i0
	fmul8sux16	%f14,	%f26,	%f2
	movrlez	%o2,	%i3,	%l3
	fmovse	%xcc,	%f13,	%f28
	fones	%f27
	be	loop_2360
	udiv	%g1,	0x18A5,	%i5
	movcc	%xcc,	%o0,	%i7
	sdivcc	%o4,	0x0560,	%g5
loop_2360:
	fnors	%f16,	%f6,	%f4
	alignaddr	%o5,	%i6,	%i2
	movrgz	%l0,	%l6,	%i1
	set	0x44, %i2
	ldstuba	[%l7 + %i2] 0x11,	%g6
	ldsh	[%l7 + 0x46],	%o3
	xnor	%l1,	0x1E36,	%l4
	fmovdg	%xcc,	%f6,	%f14
	stx	%g3,	[%l7 + 0x18]
	set	0x40, %g7
	ldda	[%l7 + %g7] 0x15,	%f16
	bne,a	%xcc,	loop_2361
	taddcc	%g7,	%l2,	%g4
	edge32	%o6,	%l5,	%g2
	movg	%xcc,	%o7,	%o1
loop_2361:
	stb	%i4,	[%l7 + 0x3A]
	fnand	%f12,	%f14,	%f12
	xnorcc	%o2,	%i0,	%l3
	edge32ln	%i3,	%g1,	%i5
	brnz,a	%o0,	loop_2362
	tg	%icc,	0x6
	tcc	%xcc,	0x6
	brlez,a	%o4,	loop_2363
loop_2362:
	srlx	%g5,	0x1B,	%o5
	swap	[%l7 + 0x30],	%i6
	orncc	%i2,	0x1060,	%l0
loop_2363:
	movrlez	%l6,	0x13D,	%i7
	edge32l	%i1,	%o3,	%g6
	movl	%icc,	%l1,	%g3
	for	%f6,	%f4,	%f14
	fbul,a	%fcc1,	loop_2364
	mulscc	%l4,	%l2,	%g4
	tvs	%xcc,	0x1
	nop
	setx	0x962A68989FB605AB,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	fsqrtd	%f28,	%f2
loop_2364:
	ldstub	[%l7 + 0x54],	%o6
	prefetch	[%l7 + 0x68],	 0x2
	nop
	fitos	%f3,	%f4
	fstox	%f4,	%f10
	xnor	%l5,	%g2,	%g7
	xnor	%o7,	0x0A75,	%i4
	sllx	%o1,	%o2,	%l3
	fzero	%f28
	edge32	%i3,	%g1,	%i5
	umul	%i0,	%o4,	%o0
	tleu	%icc,	0x7
	fcmpeq32	%f16,	%f20,	%g5
	tne	%xcc,	0x0
	movrne	%i6,	0x39D,	%i2
	fexpand	%f25,	%f12
	umul	%l0,	%l6,	%i7
	fnand	%f18,	%f2,	%f26
	bcs	%icc,	loop_2365
	mulx	%o5,	0x114D,	%o3
	andcc	%i1,	%g6,	%l1
	edge32n	%g3,	%l2,	%l4
loop_2365:
	fbue	%fcc2,	loop_2366
	fcmpgt16	%f28,	%f14,	%o6
	edge32ln	%g4,	%l5,	%g7
	membar	0x17
loop_2366:
	sra	%o7,	0x1F,	%g2
	popc	0x14E4,	%i4
	mulx	%o2,	0x18CA,	%o1
	fones	%f10
	tsubcctv	%l3,	0x0A3C,	%g1
	edge32n	%i5,	%i0,	%o4
	bcs,a,pt	%icc,	loop_2367
	fpack16	%f6,	%f1
	nop
	setx	0x54429537,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f26
	fsqrts	%f26,	%f27
	fandnot1s	%f20,	%f23,	%f9
loop_2367:
	edge32n	%o0,	%g5,	%i6
	fble	%fcc0,	loop_2368
	tcc	%icc,	0x6
	nop
	setx	0x2BEE941FA049E889,	%l0,	%l6
	stx	%l6,	[%l7 + 0x20]
	ldx	[%l7 + 0x20],	%fsr
	addccc	%i2,	0x0FAE,	%i3
loop_2368:
	prefetch	[%l7 + 0x08],	 0x1
	orncc	%l0,	%l6,	%i7
	taddcc	%o5,	%i1,	%o3
	fmovrdgz	%g6,	%f4,	%f28
	addc	%l1,	0x1D51,	%g3
	fmovdle	%xcc,	%f4,	%f27
	umul	%l4,	0x1E07,	%l2
	and	%o6,	%g4,	%l5
	addccc	%o7,	%g7,	%i4
	orcc	%g2,	%o2,	%o1
	fpackfix	%f2,	%f28
	subcc	%l3,	0x16D5,	%g1
	add	%i0,	0x1822,	%i5
	fcmple16	%f16,	%f14,	%o4
	andcc	%o0,	0x0BF1,	%g5
	alignaddrl	%i2,	%i3,	%i6
	set	0x3D, %l0
	stba	%l6,	[%l7 + %l0] 0x2b
	membar	#Sync
	tne	%xcc,	0x4
	fmovdgu	%xcc,	%f1,	%f21
	fcmpne16	%f16,	%f22,	%i7
	edge8	%o5,	%l0,	%o3
	movle	%icc,	%g6,	%i1
	movge	%icc,	%g3,	%l1
	ldstub	[%l7 + 0x58],	%l2
	fbge	%fcc1,	loop_2369
	fbg,a	%fcc2,	loop_2370
	nop
	setx	loop_2371,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	nop
	setx	loop_2372,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_2369:
	sir	0x000F
loop_2370:
	bg,a,pt	%xcc,	loop_2373
loop_2371:
	fmovsle	%icc,	%f15,	%f23
loop_2372:
	lduw	[%l7 + 0x78],	%l4
	fcmple32	%f8,	%f18,	%g4
loop_2373:
	tleu	%icc,	0x0
	or	%o6,	%o7,	%g7
	bne,a,pt	%xcc,	loop_2374
	tgu	%icc,	0x1
	nop
	fitod	%f4,	%f18
	fdtox	%f18,	%f16
	fble	%fcc3,	loop_2375
loop_2374:
	mova	%icc,	%i4,	%g2
	array8	%o2,	%o1,	%l5
	sllx	%g1,	%l3,	%i0
loop_2375:
	tpos	%xcc,	0x4
	fmovsa	%xcc,	%f29,	%f24
	smulcc	%i5,	0x027E,	%o0
	fmovspos	%xcc,	%f3,	%f6
	array32	%o4,	%g5,	%i2
	srlx	%i3,	0x13,	%l6
	nop
	setx loop_2376, %l0, %l1
	jmpl %l1, %i6
	fxors	%f26,	%f3,	%f23
	tpos	%xcc,	0x2
	tle	%xcc,	0x6
loop_2376:
	sra	%i7,	0x1C,	%o5
	sdivx	%l0,	0x06A5,	%o3
	fmovsleu	%xcc,	%f6,	%f20
	fsrc1	%f14,	%f22
	fbne	%fcc3,	loop_2377
	fnegs	%f13,	%f8
	ble,a	%icc,	loop_2378
	sra	%g6,	0x19,	%g3
loop_2377:
	movle	%icc,	%l1,	%l2
	lduh	[%l7 + 0x10],	%i1
loop_2378:
	for	%f30,	%f10,	%f24
	move	%icc,	%g4,	%l4
	addccc	%o6,	0x0A69,	%g7
	fmul8x16	%f7,	%f28,	%f2
	bleu	%icc,	loop_2379
	array8	%i4,	%g2,	%o7
	tsubcctv	%o2,	0x153C,	%o1
	edge32	%g1,	%l3,	%i0
loop_2379:
	edge8ln	%l5,	%i5,	%o0
	movl	%icc,	%g5,	%i2
	orcc	%o4,	0x0291,	%i3
	movrne	%i6,	%l6,	%o5
	wr	%g0,	0x2f,	%asi
	stba	%i7,	[%l7 + 0x50] %asi
	membar	#Sync
	edge8ln	%l0,	%o3,	%g6
	fmul8x16	%f4,	%f28,	%f26
	sdivx	%l1,	0x177C,	%l2
	fmovrdne	%i1,	%f16,	%f16
	tvc	%xcc,	0x4
	stw	%g3,	[%l7 + 0x44]
	movleu	%icc,	%g4,	%l4
	alignaddr	%o6,	%i4,	%g7
	fpadd32s	%f25,	%f26,	%f5
	srax	%o7,	%g2,	%o1
	mulscc	%g1,	%o2,	%i0
	set	0x10, %o6
	prefetcha	[%l7 + %o6] 0x0c,	 0x2
	xnor	%l3,	0x1404,	%o0
	set	0x60, %l4
	swapa	[%l7 + %l4] 0x89,	%i5
	add	%l7,	0x60,	%l6
	wr	%g0,	0x18,	%asi
	casxa	[%l6] 0x18,	%g5,	%i2
	tne	%icc,	0x0
	movgu	%xcc,	%o4,	%i3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stbar
	fmovscc	%xcc,	%f8,	%f2
	wr	%g0,	0x11,	%asi
	ldswa	[%l7 + 0x08] %asi,	%i6
	fmovrdne	%l6,	%f18,	%f8
	srl	%i7,	0x12,	%o5
	movgu	%icc,	%o3,	%l0
	add	%l1,	%l2,	%g6
	sdiv	%i1,	0x1ED6,	%g4
	std	%f16,	[%l7 + 0x08]
	subc	%l4,	0x0EC6,	%g3
	for	%f30,	%f6,	%f20
	fzeros	%f26
	std	%f0,	[%l7 + 0x10]
	fmovsl	%xcc,	%f4,	%f30
	bge,pn	%icc,	loop_2380
	tneg	%icc,	0x5
	brgez,a	%o6,	loop_2381
	array8	%g7,	%o7,	%i4
loop_2380:
	fbl,a	%fcc0,	loop_2382
	or	%o1,	0x1AF3,	%g2
loop_2381:
	fmovspos	%icc,	%f28,	%f10
	orncc	%g1,	%o2,	%i0
loop_2382:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbge	%fcc1,	loop_2383
	fbu	%fcc1,	loop_2384
	movpos	%xcc,	%l5,	%l3
	ta	%icc,	0x0
loop_2383:
	array16	%o0,	%i5,	%g5
loop_2384:
	movn	%xcc,	%o4,	%i2
	add	%i6,	0x1557,	%i3
	popc	0x05A6,	%l6
	tleu	%xcc,	0x2
	movle	%xcc,	%i7,	%o3
	wr	%g0,	0x04,	%asi
	ldda	[%l7 + 0x30] %asi,	%l0
	fbge,a	%fcc0,	loop_2385
	fmovrsne	%l1,	%f11,	%f20
	andcc	%o5,	0x1AE9,	%l2
	srlx	%i1,	0x08,	%g4
loop_2385:
	xorcc	%l4,	0x099F,	%g3
	movrlz	%g6,	%o6,	%g7
	tgu	%xcc,	0x1
	tsubcctv	%i4,	%o7,	%o1
	for	%f20,	%f14,	%f18
	pdist	%f26,	%f24,	%f2
	xorcc	%g1,	0x1476,	%o2
	and	%i0,	%g2,	%l5
	smul	%o0,	%l3,	%i5
	wr	%g0,	0x81,	%asi
	stwa	%g5,	[%l7 + 0x10] %asi
	fba,a	%fcc1,	loop_2386
	movge	%xcc,	%i2,	%o4
	lduw	[%l7 + 0x28],	%i6
	fpsub16s	%f16,	%f23,	%f27
loop_2386:
	fornot2	%f28,	%f8,	%f12
	movrlz	%i3,	%l6,	%i7
	membar	0x20
	mulscc	%l0,	0x18F9,	%o3
	wr	%g0,	0x80,	%asi
	ldstuba	[%l7 + 0x11] %asi,	%l1
	edge32n	%l2,	%o5,	%i1
	move	%icc,	%l4,	%g4
	fmovrslez	%g6,	%f31,	%f4
	set	0x5D, %o2
	stba	%o6,	[%l7 + %o2] 0x88
	ldsb	[%l7 + 0x63],	%g3
	movn	%icc,	%g7,	%i4
	nop
	setx	0x97726BF5F07DF8B5,	%l0,	%l6
	stx	%l6,	[%l7 + 0x08]
	ldx	[%l7 + 0x08],	%fsr
	tge	%xcc,	0x2
	bne,pn	%xcc,	loop_2387
	movrlz	%o1,	%o7,	%o2
	set	0x12, %i0
	stha	%i0,	[%l7 + %i0] 0x2a
	membar	#Sync
loop_2387:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tneg	%icc,	0x6
	fbne	%fcc2,	loop_2388
	fpadd32s	%f28,	%f21,	%f26
	movle	%icc,	%g2,	%g1
	wr	%g0,	0x89,	%asi
	ldstuba	[%l7 + 0x20] %asi,	%o0
loop_2388:
	ba,pn	%xcc,	loop_2389
	mulscc	%l5,	%i5,	%l3
	nop
	fitos	%f2,	%f23
	fstoi	%f23,	%f26
	wr	%g0,	0x81,	%asi
	prefetcha	[%l7 + 0x68] %asi,	 0x3
loop_2389:
	fbo,a	%fcc2,	loop_2390
	movrlez	%o4,	0x378,	%i2
	srax	%i6,	0x0B,	%l6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2390:
	movcc	%xcc,	%i7,	%i3
	fbl,a	%fcc1,	loop_2391
	edge32l	%o3,	%l0,	%l2
	set	0x50, %i7
	lda	[%l7 + %i7] 0x14,	%f6
loop_2391:
	edge16ln	%l1,	%o5,	%i1
	andn	%g4,	0x1B31,	%g6
	movleu	%xcc,	%l4,	%g3
	nop
	setx	0x8CFC60B710653DD8,	%l0,	%l6
	stx	%l6,	[%l7 + 0x08]
	ldx	[%l7 + 0x08],	%fsr
	sdivcc	%g7,	0x1AD8,	%o6
	array8	%o1,	%o7,	%o2
	fbe	%fcc3,	loop_2392
	ldd	[%l7 + 0x48],	%i4
	array32	%i0,	%g2,	%o0
	fbe,a	%fcc3,	loop_2393
loop_2392:
	fmovrdgz	%l5,	%f28,	%f4
	fpsub16	%f24,	%f28,	%f12
	mulscc	%i5,	%l3,	%g5
loop_2393:
	membar	0x1D
	taddcc	%g1,	0x06B9,	%o4
	xorcc	%i6,	%i2,	%l6
	nop
	setx	0x654B43CFF06D4B65,	%l0,	%l6
	stx	%l6,	[%l7 + 0x78]
	ldx	[%l7 + 0x78],	%fsr
	andn	%i7,	%i3,	%o3
	fmovspos	%icc,	%f3,	%f1
	addc	%l0,	%l1,	%l2
	fmovrse	%o5,	%f7,	%f21
	fmovde	%icc,	%f8,	%f24
	xorcc	%g4,	0x00C0,	%i1
	fornot1	%f0,	%f4,	%f10
	ldx	[%l7 + 0x08],	%g6
	movpos	%xcc,	%l4,	%g3
	fmovdg	%icc,	%f20,	%f3
	prefetch	[%l7 + 0x5C],	 0x2
	faligndata	%f18,	%f30,	%f2
	fbe,a	%fcc2,	loop_2394
	edge16l	%o6,	%o1,	%o7
	srax	%o2,	0x15,	%i4
	st	%f14,	[%l7 + 0x60]
loop_2394:
	tg	%xcc,	0x1
	xnorcc	%i0,	%g7,	%g2
	stbar
	fbg,a	%fcc1,	loop_2395
	taddcctv	%l5,	%i5,	%l3
	wr	%g0,	0x81,	%asi
	lduba	[%l7 + 0x20] %asi,	%g5
loop_2395:
	movre	%o0,	%g1,	%o4
	fzeros	%f20
	sdiv	%i6,	0x1D59,	%l6
	set	0x27, %o7
	stba	%i7,	[%l7 + %o7] 0x2b
	membar	#Sync
	prefetch	[%l7 + 0x3C],	 0x1
	sdivx	%i2,	0x0DA6,	%i3
	prefetch	[%l7 + 0x34],	 0x3
	edge16l	%o3,	%l0,	%l1
	mulscc	%l2,	%o5,	%i1
	movrgez	%g6,	%l4,	%g3
	wr	%g0,	0x0c,	%asi
	prefetcha	[%l7 + 0x10] %asi,	 0x2
	stb	%o6,	[%l7 + 0x0A]
	nop
	fitos	%f4,	%f18
	fstod	%f18,	%f22
	bn,a,pt	%xcc,	loop_2396
	te	%icc,	0x7
	fmovrslez	%o1,	%f21,	%f1
	nop
	set	0x60, %g3
	ldd	[%l7 + %g3],	%f4
loop_2396:
	tpos	%xcc,	0x1
	xorcc	%o7,	%o2,	%i0
	fmovrdlz	%g7,	%f30,	%f28
	edge8ln	%i4,	%g2,	%i5
	add	%l5,	%g5,	%o0
	fmul8ulx16	%f6,	%f22,	%f14
	fnot2s	%f10,	%f22
	subcc	%g1,	%l3,	%o4
	movpos	%xcc,	%l6,	%i6
	tle	%xcc,	0x2
	sethi	0x05B3,	%i2
	fcmpne16	%f8,	%f28,	%i3
	stbar
	fbn,a	%fcc1,	loop_2397
	fble	%fcc3,	loop_2398
	movvc	%icc,	%o3,	%l0
	fbe	%fcc1,	loop_2399
loop_2397:
	bleu	loop_2400
loop_2398:
	movvc	%icc,	%l1,	%l2
	sll	%i7,	0x08,	%i1
loop_2399:
	be,a,pn	%icc,	loop_2401
loop_2400:
	array8	%o5,	%g6,	%l4
	fbge,a	%fcc0,	loop_2402
	movn	%icc,	%g4,	%o6
loop_2401:
	addccc	%g3,	%o7,	%o2
	fsrc1	%f8,	%f22
loop_2402:
	nop
	fitos	%f13,	%f20
	fstox	%f20,	%f12
	sdivcc	%o1,	0x0116,	%i0
	udiv	%g7,	0x17BA,	%g2
	udivcc	%i5,	0x0F99,	%i4
	fmovse	%xcc,	%f14,	%f23
	xor	%l5,	%g5,	%g1
	and	%l3,	0x0FC7,	%o0
	sethi	0x1AF9,	%l6
	tgu	%icc,	0x4
	fmovrdlez	%o4,	%f30,	%f10
	srl	%i6,	0x12,	%i3
	udivcc	%i2,	0x1648,	%l0
	sub	%o3,	0x02C7,	%l1
	umulcc	%i7,	0x08B8,	%i1
	movrlez	%o5,	0x0DA,	%g6
	fcmple16	%f24,	%f16,	%l2
	movre	%g4,	%o6,	%g3
	movcc	%icc,	%l4,	%o2
	membar	0x17
	fmovsn	%icc,	%f8,	%f4
	umul	%o1,	0x0B1F,	%o7
	edge32l	%g7,	%i0,	%g2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addccc	%i5,	%i4,	%l5
	membar	0x58
	sllx	%g1,	%l3,	%o0
	fbne,a	%fcc1,	loop_2403
	bl,a,pt	%xcc,	loop_2404
	std	%f10,	[%l7 + 0x30]
	fmovrslz	%l6,	%f28,	%f30
loop_2403:
	fbo	%fcc2,	loop_2405
loop_2404:
	fornot1	%f14,	%f14,	%f24
	fcmpeq32	%f10,	%f30,	%o4
	fbg	%fcc0,	loop_2406
loop_2405:
	movl	%xcc,	%g5,	%i3
	tvc	%icc,	0x2
	orn	%i2,	0x179E,	%l0
loop_2406:
	array16	%i6,	%o3,	%i7
	st	%f25,	[%l7 + 0x5C]
	pdist	%f4,	%f22,	%f26
	fbu,a	%fcc3,	loop_2407
	srlx	%i1,	%o5,	%g6
	fmovscc	%xcc,	%f5,	%f31
	fmovsl	%xcc,	%f17,	%f15
loop_2407:
	bshuffle	%f10,	%f12,	%f10
	tgu	%xcc,	0x6
	tne	%icc,	0x0
	wr	%g0,	0x19,	%asi
	stba	%l2,	[%l7 + 0x0B] %asi
	sub	%l1,	0x1278,	%g4
	fmovrdgz	%g3,	%f14,	%f6
	bleu,a	loop_2408
	fbuge	%fcc3,	loop_2409
	sub	%o6,	0x1B69,	%o2
	fbug	%fcc0,	loop_2410
loop_2408:
	tleu	%xcc,	0x4
loop_2409:
	fmul8x16au	%f19,	%f21,	%f12
	fmovdge	%icc,	%f24,	%f12
loop_2410:
	movrgez	%l4,	%o7,	%g7
	fmovdg	%xcc,	%f22,	%f22
	tcs	%icc,	0x0
	movrlez	%o1,	%g2,	%i5
	srl	%i4,	0x18,	%l5
	sdivx	%g1,	0x1282,	%l3
	sll	%i0,	%o0,	%l6
	fsrc1	%f24,	%f18
	bn,a	loop_2411
	fmovrsgz	%o4,	%f16,	%f28
	movrgez	%g5,	%i2,	%l0
	tl	%xcc,	0x6
loop_2411:
	fxor	%f2,	%f24,	%f30
	mulx	%i3,	0x104E,	%i6
	movre	%i7,	%o3,	%i1
	tgu	%xcc,	0x3
	fbu,a	%fcc2,	loop_2412
	bcc	loop_2413
	edge8n	%o5,	%g6,	%l1
	edge8n	%l2,	%g3,	%o6
loop_2412:
	taddcctv	%g4,	%o2,	%l4
loop_2413:
	tleu	%icc,	0x2
	array32	%o7,	%g7,	%g2
	wr	%g0,	0x19,	%asi
	sta	%f5,	[%l7 + 0x64] %asi
	movrlz	%o1,	0x2B9,	%i4
	sir	0x0CDF
	fmovdg	%icc,	%f9,	%f29
	movge	%icc,	%l5,	%i5
	tleu	%icc,	0x2
	movl	%icc,	%g1,	%l3
	wr	%g0,	0x88,	%asi
	prefetcha	[%l7 + 0x70] %asi,	 0x0
	fmovdleu	%xcc,	%f14,	%f6
	taddcctv	%o0,	0x1E57,	%l6
	edge32l	%g5,	%i2,	%o4
	fcmpeq16	%f6,	%f24,	%i3
	brz	%i6,	loop_2414
	movge	%icc,	%i7,	%l0
	fmovdcs	%xcc,	%f0,	%f22
	fmovrslz	%i1,	%f3,	%f0
loop_2414:
	edge32l	%o3,	%g6,	%o5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tcs	%xcc,	0x6
	fsrc1	%f28,	%f28
	set	0x108, %o5
	ldxa	[%g0 + %o5] 0x21,	%l2
	edge8l	%l1,	%o6,	%g3
	movrlz	%g4,	0x14F,	%o2
	membar	0x6D
	fbule	%fcc3,	loop_2415
	fbe	%fcc1,	loop_2416
	nop
	setx	loop_2417,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	tpos	%icc,	0x2
loop_2415:
	movl	%xcc,	%o7,	%g7
loop_2416:
	ta	%xcc,	0x5
loop_2417:
	fmovsvs	%icc,	%f19,	%f22
	array16	%g2,	%o1,	%l4
	taddcc	%i4,	0x1132,	%l5
	and	%g1,	0x169B,	%l3
	tcs	%icc,	0x1
	udivcc	%i0,	0x14F4,	%i5
	movg	%icc,	%l6,	%g5
	std	%f6,	[%l7 + 0x68]
	ldsh	[%l7 + 0x4E],	%i2
	bpos,a,pn	%xcc,	loop_2418
	movvc	%icc,	%o4,	%o0
	ldsh	[%l7 + 0x6A],	%i6
	tcs	%xcc,	0x3
loop_2418:
	nop
	set	0x38, %g6
	lda	[%l7 + %g6] 0x0c,	%f21
	movrlz	%i7,	0x09F,	%l0
	movg	%icc,	%i1,	%i3
	nop
	setx	0x900C89F660109D97,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	fsqrtd	%f12,	%f28
	fmovrslz	%o3,	%f17,	%f10
	ble,a,pt	%icc,	loop_2419
	sub	%g6,	0x0371,	%l2
	movrlz	%o5,	%l1,	%g3
	nop
	fitod	%f0,	%f30
	fdtos	%f30,	%f30
loop_2419:
	smul	%o6,	0x1D69,	%g4
	alignaddr	%o2,	%g7,	%o7
	movcc	%icc,	%o1,	%g2
	fmovsg	%icc,	%f4,	%f19
	set	0x38, %o1
	ldxa	[%l7 + %o1] 0x81,	%l4
	fbg,a	%fcc2,	loop_2420
	addccc	%i4,	%l5,	%g1
	fones	%f23
	orcc	%i0,	%l3,	%l6
loop_2420:
	ta	%xcc,	0x5
	fbne,a	%fcc2,	loop_2421
	edge32	%g5,	%i2,	%i5
	nop
	setx loop_2422, %l0, %l1
	jmpl %l1, %o4
	edge32ln	%i6,	%i7,	%o0
loop_2421:
	sll	%i1,	%i3,	%o3
	orcc	%g6,	%l0,	%l2
loop_2422:
	fbue,a	%fcc3,	loop_2423
	movg	%icc,	%l1,	%o5
	nop
	setx	0xF084024C90449CE7,	%l0,	%l6
	stx	%l6,	[%l7 + 0x18]
	ldx	[%l7 + 0x18],	%fsr
	stx	%g3,	[%l7 + 0x30]
loop_2423:
	tpos	%xcc,	0x6
	fmovscs	%xcc,	%f23,	%f2
	fmovscc	%icc,	%f19,	%f28
	movrlez	%g4,	0x268,	%o2
	edge16ln	%g7,	%o6,	%o1
	tne	%icc,	0x7
	fbu,a	%fcc3,	loop_2424
	movn	%xcc,	%o7,	%g2
	movl	%icc,	%l4,	%i4
	edge16	%g1,	%i0,	%l3
loop_2424:
	ldd	[%l7 + 0x10],	%f10
	movl	%icc,	%l6,	%g5
	tl	%xcc,	0x5
	edge32ln	%i2,	%l5,	%i5
	fbn	%fcc1,	loop_2425
	addc	%o4,	%i7,	%i6
	ldsh	[%l7 + 0x1C],	%o0
	tg	%icc,	0x6
loop_2425:
	fnor	%f30,	%f8,	%f26
	srax	%i3,	%o3,	%g6
	edge32ln	%i1,	%l0,	%l1
	be,pt	%icc,	loop_2426
	andcc	%o5,	0x0A9B,	%l2
	fpackfix	%f8,	%f24
	movre	%g4,	%o2,	%g7
loop_2426:
	array32	%o6,	%o1,	%o7
	movne	%icc,	%g2,	%g3
	udiv	%l4,	0x1911,	%i4
	nop
	set	0x66, %i1
	lduh	[%l7 + %i1],	%i0
	wr	%g0,	0x04,	%asi
	ldsba	[%l7 + 0x14] %asi,	%l3
	movrgz	%l6,	%g5,	%i2
	nop
	setx	0xB0552B5F,	%l0,	%l6
	st	%l6,	[%l7 + 0x74]
	ld	[%l7 + 0x74],	%fsr
	array16	%g1,	%i5,	%o4
	fzero	%f30
	orcc	%i7,	%i6,	%l5
	wr	%g0,	0x88,	%asi
	lduha	[%l7 + 0x4C] %asi,	%i3
	edge32ln	%o0,	%o3,	%i1
	edge8l	%l0,	%g6,	%l1
	fmovrdlez	%l2,	%f24,	%f28
	sub	%g4,	0x1CB3,	%o2
	umul	%o5,	%g7,	%o6
	edge32ln	%o1,	%o7,	%g2
	fmovdneg	%xcc,	%f14,	%f17
	ldx	[%l7 + 0x58],	%l4
	brz,a	%g3,	loop_2427
	tcc	%icc,	0x6
	edge8l	%i4,	%l3,	%l6
	ba,a	%icc,	loop_2428
loop_2427:
	fmul8x16au	%f1,	%f6,	%f30
	ble,a,pt	%xcc,	loop_2429
	edge8	%g5,	%i0,	%g1
loop_2428:
	nop
	wr	%g0,	0x19,	%asi
	stba	%i2,	[%l7 + 0x25] %asi
loop_2429:
	tne	%icc,	0x4
	edge8n	%i5,	%o4,	%i6
	fornot2s	%f29,	%f11,	%f13
	set	0x20, %o0
	ldxa	[%l7 + %o0] 0x80,	%l5
	tpos	%icc,	0x2
	smul	%i3,	0x1F21,	%o0
	nop
	set	0x68, %l2
	std	%f2,	[%l7 + %l2]
	sth	%i7,	[%l7 + 0x62]
	fandnot1s	%f17,	%f28,	%f18
	fnors	%f19,	%f0,	%f22
	fsrc2s	%f28,	%f8
	tge	%icc,	0x2
	umulcc	%i1,	0x0DFB,	%l0
	andcc	%g6,	%l1,	%o3
	mulx	%g4,	%l2,	%o2
	flush	%l7 + 0x7C
	xnorcc	%o5,	0x0FA4,	%o6
	fxors	%f0,	%f8,	%f14
	ldstub	[%l7 + 0x64],	%g7
	array32	%o7,	%g2,	%o1
	nop
	fitod	%f4,	%f14
	fdtox	%f14,	%f14
	fxtod	%f14,	%f26
	edge16n	%l4,	%i4,	%g3
	bvc,a	%icc,	loop_2430
	tne	%xcc,	0x4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movcs	%xcc,	%l6,	%g5
loop_2430:
	srlx	%i0,	%l3,	%g1
	move	%xcc,	%i5,	%o4
	tne	%xcc,	0x5
	tvs	%xcc,	0x2
	wr	%g0,	0x19,	%asi
	ldda	[%l7 + 0x10] %asi,	%i6
	andncc	%i2,	%i3,	%l5
	tsubcc	%i7,	%i1,	%l0
	brgez	%o0,	loop_2431
	stb	%l1,	[%l7 + 0x7B]
	umulcc	%g6,	0x095D,	%g4
	add	%o3,	0x17D5,	%l2
loop_2431:
	nop
	set	0x46, %o3
	ldsba	[%l7 + %o3] 0x15,	%o5
	sdiv	%o2,	0x0162,	%o6
	sllx	%g7,	0x04,	%o7
	set	0x27, %i6
	ldstuba	[%l7 + %i6] 0x89,	%o1
	smulcc	%g2,	0x1295,	%l4
	fcmple32	%f20,	%f8,	%g3
	bleu,a,pt	%icc,	loop_2432
	and	%l6,	%i4,	%i0
	xorcc	%g5,	0x0849,	%l3
	sth	%g1,	[%l7 + 0x52]
loop_2432:
	edge8l	%o4,	%i6,	%i2
	edge8ln	%i5,	%i3,	%i7
	and	%l5,	%i1,	%o0
	smulcc	%l1,	0x1054,	%l0
	movleu	%icc,	%g4,	%g6
	sethi	0x16C7,	%l2
	fmovsvc	%xcc,	%f16,	%f6
	udivx	%o5,	0x1D05,	%o3
	fxnors	%f21,	%f14,	%f30
	fmovdcs	%xcc,	%f14,	%f5
	fone	%f18
	tle	%xcc,	0x1
	fbue	%fcc3,	loop_2433
	fnors	%f3,	%f19,	%f11
	pdist	%f26,	%f2,	%f14
	edge8	%o6,	%o2,	%o7
loop_2433:
	nop
	wr	%g0,	0x50,	%asi
	ldxa	[%g0 + 0x30] %asi,	%g7
	sra	%g2,	%o1,	%g3
	tgu	%icc,	0x5
	nop
	setx	0xCECC7F657F5CF5D8,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0xB56EFF65FDEB234B,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	fdivd	%f6,	%f28,	%f14
	nop
	set	0x2E, %l5
	lduh	[%l7 + %l5],	%l6
	wr	%g0,	0x18,	%asi
	lduha	[%l7 + 0x2E] %asi,	%i4
	xorcc	%i0,	%l4,	%g5
	fmovsn	%xcc,	%f14,	%f15
	fmovscc	%xcc,	%f15,	%f11
	edge16l	%l3,	%g1,	%i6
	ldstub	[%l7 + 0x6B],	%o4
	srl	%i2,	%i5,	%i7
	tvs	%xcc,	0x6
	edge8	%l5,	%i3,	%i1
	fcmpeq32	%f14,	%f24,	%l1
	fmovspos	%xcc,	%f13,	%f25
	edge8l	%l0,	%o0,	%g6
	ldd	[%l7 + 0x78],	%l2
	fmovsne	%icc,	%f13,	%f31
	sub	%g4,	%o3,	%o5
	tpos	%icc,	0x3
	ble,pn	%xcc,	loop_2434
	mulscc	%o2,	%o7,	%g7
	lduh	[%l7 + 0x6E],	%g2
	subccc	%o6,	%o1,	%g3
loop_2434:
	tne	%icc,	0x6
	set	0x78, %g1
	ldswa	[%l7 + %g1] 0x04,	%i4
	udiv	%i0,	0x0104,	%l6
	fors	%f21,	%f20,	%f16
	wr	%g0,	0x81,	%asi
	ldxa	[%l7 + 0x30] %asi,	%l4
	set	0x52, %i4
	lduha	[%l7 + %i4] 0x88,	%l3
	srl	%g1,	0x03,	%g5
	xorcc	%o4,	0x1714,	%i2
	movg	%icc,	%i5,	%i6
	orn	%i7,	0x07A3,	%l5
	movrgz	%i1,	0x0EC,	%l1
	nop
	setx	0xF9273A76,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f16
	setx	0x62E1E709,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f15
	fmuls	%f15,	%f16,	%f7
	addc	%l0,	%o0,	%i3
	tne	%xcc,	0x3
	tvs	%icc,	0x3
	smulcc	%l2,	%g6,	%o3
	fexpand	%f24,	%f18
	edge16	%o5,	%o2,	%g4
	fcmpeq32	%f22,	%f12,	%o7
	movcc	%icc,	%g7,	%g2
	tcs	%xcc,	0x6
	ldx	[%l7 + 0x58],	%o6
	tvc	%xcc,	0x0
	set	0x49, %l6
	stba	%g3,	[%l7 + %l6] 0x27
	membar	#Sync
	nop
	setx	0x010165D1,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f26
	fsqrts	%f26,	%f2
	tleu	%xcc,	0x1
	tge	%xcc,	0x2
	fmovdg	%icc,	%f23,	%f9
	fzeros	%f4
	edge16	%o1,	%i0,	%i4
	ldd	[%l7 + 0x08],	%f30
	nop
	setx	0x6AC25228E30D34E4,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	setx	0xD0807B891B2FB002,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	faddd	%f12,	%f18,	%f6
	lduh	[%l7 + 0x18],	%l6
	edge16	%l3,	%l4,	%g5
	lduh	[%l7 + 0x62],	%g1
	nop
	fitos	%f10,	%f15
	fstox	%f15,	%f22
	fxtos	%f22,	%f15
	array32	%o4,	%i2,	%i5
	ta	%icc,	0x7
	brgez,a	%i7,	loop_2435
	fmovsvs	%icc,	%f15,	%f18
	ta	%xcc,	0x5
	lduw	[%l7 + 0x3C],	%l5
loop_2435:
	sllx	%i1,	0x0C,	%l1
	fmul8x16	%f10,	%f22,	%f16
	fpmerge	%f20,	%f11,	%f10
	ld	[%l7 + 0x28],	%f14
	andcc	%l0,	%i6,	%o0
	xnorcc	%l2,	0x15E0,	%i3
	pdist	%f8,	%f14,	%f18
	bvs,pt	%icc,	loop_2436
	fmovrdgez	%o3,	%f10,	%f30
	subc	%o5,	%o2,	%g4
	array32	%g6,	%o7,	%g2
loop_2436:
	nop
	set	0x27, %g2
	ldsba	[%l7 + %g2] 0x14,	%g7
	fbug	%fcc2,	loop_2437
	ldx	[%l7 + 0x28],	%o6
	ldsh	[%l7 + 0x2E],	%o1
	fmovdcs	%xcc,	%f12,	%f29
loop_2437:
	mulscc	%g3,	0x12C8,	%i0
	fmovsleu	%xcc,	%f9,	%f26
	set	0x3C, %i3
	lda	[%l7 + %i3] 0x81,	%f31
	tpos	%xcc,	0x4
	sll	%i4,	0x0A,	%l3
	tn	%icc,	0x7
	fmovrsgez	%l6,	%f27,	%f23
	edge32n	%l4,	%g5,	%o4
	nop
	setx	0x7C861969D29592A9,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0xFDF5C4DFC9329880,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	fsubd	%f28,	%f22,	%f28
	sir	0x0D33
	nop
	fitos	%f10,	%f2
	fstod	%f2,	%f30
	fmovsvs	%xcc,	%f9,	%f27
	sub	%g1,	%i5,	%i2
	alignaddr	%i7,	%i1,	%l5
	movre	%l1,	%l0,	%o0
	fmovrsgz	%i6,	%f20,	%f0
	brnz	%i3,	loop_2438
	fmovda	%xcc,	%f21,	%f2
	tvc	%xcc,	0x5
	movcs	%xcc,	%o3,	%l2
loop_2438:
	fbn	%fcc1,	loop_2439
	movcs	%icc,	%o5,	%o2
	fbg	%fcc1,	loop_2440
	tsubcc	%g6,	0x074D,	%o7
loop_2439:
	fmovscs	%xcc,	%f17,	%f22
	xor	%g4,	%g2,	%g7
loop_2440:
	addc	%o1,	0x1445,	%g3
	alignaddrl	%o6,	%i0,	%i4
	fmovrdgez	%l3,	%f16,	%f4
	fnot2s	%f26,	%f8
	orncc	%l4,	%g5,	%l6
	alignaddr	%g1,	%o4,	%i5
	add	%i7,	0x09F2,	%i1
	bcs,a	%xcc,	loop_2441
	fmovrsgz	%l5,	%f10,	%f29
	ldub	[%l7 + 0x08],	%i2
	ldx	[%l7 + 0x70],	%l1
loop_2441:
	fone	%f22
	fornot2s	%f2,	%f8,	%f6
	edge32	%o0,	%l0,	%i6
	faligndata	%f30,	%f26,	%f22
	subc	%i3,	%l2,	%o3
	tcs	%icc,	0x6
	tcs	%icc,	0x4
	tvc	%icc,	0x1
	nop 	! 	nop 	! 	wr	%g0,	0x40,	%asi ripped by fixASI40.pl ripped by fixASI40.pl
	nop 	! 	nop 	! 	ldxa	[%g0 + 0x1c8] %asi,	%o5 ripped by fixASI40.pl ripped by fixASI40.pl
	fpmerge	%f25,	%f3,	%f6
	alignaddr	%o2,	%g6,	%o7
	fmovsa	%xcc,	%f8,	%f14
	sra	%g2,	%g7,	%o1
	udivcc	%g4,	0x0FEF,	%o6
	srlx	%i0,	%g3,	%l3
	fble,a	%fcc1,	loop_2442
	bshuffle	%f14,	%f28,	%f18
	bne,a,pn	%icc,	loop_2443
	movne	%icc,	%i4,	%g5
loop_2442:
	nop
	add	%l7,	0x50,	%l6
	wr	%g0,	0x0c,	%asi
	casxa	[%l6] 0x0c,	%l6,	%g1
loop_2443:
	bleu,a,pt	%icc,	loop_2444
	fbn	%fcc1,	loop_2445
	array16	%o4,	%l4,	%i7
	tn	%xcc,	0x2
loop_2444:
	pdist	%f30,	%f22,	%f22
loop_2445:
	fbug,a	%fcc2,	loop_2446
	fcmple32	%f8,	%f12,	%i1
	wr	%g0,	0x89,	%asi
	prefetcha	[%l7 + 0x40] %asi,	 0x1
loop_2446:
	fnors	%f10,	%f10,	%f28
	sllx	%i2,	%l1,	%l5
	srlx	%l0,	%o0,	%i3
	edge16	%l2,	%i6,	%o3
	nop
	fitod	%f6,	%f18
	fdtox	%f18,	%f18
	fxtod	%f18,	%f2
	or	%o2,	%g6,	%o5
	fbne	%fcc3,	loop_2447
	tgu	%xcc,	0x2
	brz,a	%g2,	loop_2448
	sdiv	%g7,	0x0A0E,	%o1
loop_2447:
	fmovrdlez	%o7,	%f26,	%f20
	edge16ln	%g4,	%o6,	%i0
loop_2448:
	sub	%l3,	%i4,	%g3
	array16	%l6,	%g1,	%o4
	fcmpgt32	%f4,	%f26,	%l4
	fbuge	%fcc3,	loop_2449
	fmovsn	%icc,	%f29,	%f2
	array16	%g5,	%i1,	%i5
	fmovrslez	%i7,	%f16,	%f31
loop_2449:
	nop
	wr	%g0,	0x89,	%asi
	stwa	%l1,	[%l7 + 0x3C] %asi
	fmovd	%f14,	%f30
	bl	%icc,	loop_2450
	udiv	%i2,	0x017B,	%l5
	andn	%o0,	%i3,	%l2
	movcs	%icc,	%i6,	%o3
loop_2450:
	fmovsn	%xcc,	%f28,	%f1
	movle	%icc,	%l0,	%o2
	edge8n	%o5,	%g2,	%g6
	array8	%g7,	%o1,	%o7
	nop
	set	0x3C, %g5
	ldsw	[%l7 + %g5],	%g4
	set	0x40, %i5
	lda	[%l7 + %i5] 0x89,	%f17
	tleu	%xcc,	0x3
	udiv	%i0,	0x079C,	%l3
	movl	%icc,	%o6,	%g3
	taddcc	%i4,	%g1,	%o4
	fpsub16	%f12,	%f4,	%f28
	nop
	setx	loop_2451,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movge	%xcc,	%l6,	%g5
	movne	%xcc,	%l4,	%i1
	movpos	%xcc,	%i5,	%i7
loop_2451:
	call	loop_2452
	sdivx	%i2,	0x15F7,	%l5
	fabss	%f0,	%f22
	nop
	setx loop_2453, %l0, %l1
	jmpl %l1, %l1
loop_2452:
	sll	%o0,	0x18,	%l2
	xnor	%i3,	%i6,	%o3
	fbl,a	%fcc1,	loop_2454
loop_2453:
	movn	%xcc,	%l0,	%o2
	add	%l7,	0x38,	%l6
	wr	%g0,	0x10,	%asi
	casxa	[%l6] %asi,	%g2,	%o5
loop_2454:
	tvs	%icc,	0x5
	fcmpeq32	%f8,	%f12,	%g6
	srl	%o1,	0x1C,	%g7
	fxor	%f4,	%f20,	%f6
	brlez	%g4,	loop_2455
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andncc	%i0,	%l3,	%o6
	bneg,a	%xcc,	loop_2456
loop_2455:
	fbule,a	%fcc3,	loop_2457
	nop
	setx	0x80767DFB,	%l0,	%l6
	st	%l6,	[%l7 + 0x68]
	ld	[%l7 + 0x68],	%fsr
	fmovda	%icc,	%f8,	%f13
loop_2456:
	move	%xcc,	%g3,	%o7
loop_2457:
	tl	%icc,	0x4
	tpos	%icc,	0x4
	fnot2	%f22,	%f12
	set	0x10, %o4
	stba	%g1,	[%l7 + %o4] 0x2a
	membar	#Sync
	call	loop_2458
	fornot2	%f8,	%f4,	%f30
	sdiv	%o4,	0x0A9A,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l7 + 0x78] %asi,	%f29
loop_2458:
	fornot2s	%f14,	%f15,	%f30
	fbule,a	%fcc2,	loop_2459
	ld	[%l7 + 0x0C],	%f2
	fmovsl	%xcc,	%f11,	%f21
	movpos	%xcc,	%g5,	%l4
loop_2459:
	fxnor	%f18,	%f18,	%f18
	tle	%icc,	0x2
	movg	%icc,	%i4,	%i1
	tsubcctv	%i5,	0x1C11,	%i2
	nop
	setx	0x9058A46A,	%l0,	%l6
	st	%l6,	[%l7 + 0x48]
	ld	[%l7 + 0x48],	%fsr
	fmovrdgez	%i7,	%f14,	%f12
	lduh	[%l7 + 0x62],	%l1
	movg	%icc,	%o0,	%l2
	popc	0x0D63,	%i3
	fmovsg	%xcc,	%f20,	%f7
	te	%icc,	0x4
	or	%i6,	%o3,	%l0
	tvc	%xcc,	0x3
	sdivx	%o2,	0x0E86,	%g2
	set	0x40, %l3
	stda	%f0,	[%l7 + %l3] 0x11
	nop
	setx	0x9C80F915,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f19
	setx	0xE94C103F,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f1
	fsubs	%f1,	%f19,	%f8
	fcmple32	%f14,	%f14,	%o5
	sllx	%g6,	%o1,	%g7
	tvc	%icc,	0x5
	lduw	[%l7 + 0x38],	%l5
	nop
	fitos	%f11,	%f25
	fstox	%f25,	%f16
	fxtos	%f16,	%f2
	movvc	%xcc,	%g4,	%i0
	add	%l7,	0x40,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%l3
	casxa	[%l6] %asi,	%l3,	%o6
	tvs	%xcc,	0x6
	fbl,a	%fcc3,	loop_2460
	fsrc1	%f12,	%f22
	fornot1	%f28,	%f22,	%f30
	fnor	%f28,	%f12,	%f8
loop_2460:
	prefetch	[%l7 + 0x70],	 0x3
	tl	%xcc,	0x6
	fmovsg	%xcc,	%f23,	%f6
	brz	%g3,	loop_2461
	tgu	%icc,	0x3
	fbl,a	%fcc1,	loop_2462
	move	%icc,	%g1,	%o7
loop_2461:
	nop
	setx	0x3217F343,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f26
	setx	0x41AA193A,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f9
	fmuls	%f9,	%f26,	%f10
	taddcc	%o4,	%g5,	%l4
loop_2462:
	fble,a	%fcc0,	loop_2463
	fbl,a	%fcc1,	loop_2464
	movl	%icc,	%i4,	%l6
	fornot1s	%f16,	%f22,	%f19
loop_2463:
	nop
	setx	0xF20546F394D4422B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0xB0133360E9E70E14,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	faddd	%f6,	%f12,	%f30
loop_2464:
	edge16ln	%i5,	%i1,	%i2
	movne	%icc,	%i7,	%l1
	orn	%l2,	0x159A,	%i3
	andn	%o0,	%o3,	%l0
	ta	%icc,	0x6
	andn	%i6,	%o2,	%o5
	movvc	%icc,	%g6,	%g2
	brz,a	%g7,	loop_2465
	movcc	%icc,	%l5,	%g4
	fmovrslez	%i0,	%f6,	%f13
	fmovrdlez	%o1,	%f30,	%f20
loop_2465:
	tl	%icc,	0x2
	movl	%icc,	%o6,	%g3
	tsubcctv	%g1,	%l3,	%o7
	sdiv	%o4,	0x136F,	%l4
	fcmple32	%f8,	%f20,	%g5
	xorcc	%l6,	0x0CB1,	%i5
	fsrc2	%f16,	%f24
	brlez,a	%i1,	loop_2466
	std	%f2,	[%l7 + 0x28]
	fors	%f8,	%f26,	%f7
	movn	%icc,	%i2,	%i7
loop_2466:
	tsubcctv	%l1,	0x1652,	%i4
	edge8	%l2,	%o0,	%i3
	fzeros	%f21
	fmovdneg	%xcc,	%f14,	%f8
	nop
	setx	0xF0561247,	%l0,	%l6
	st	%l6,	[%l7 + 0x7C]
	ld	[%l7 + 0x7C],	%fsr
	fpsub16s	%f29,	%f30,	%f15
	edge8ln	%l0,	%o3,	%i6
	bl,a,pn	%icc,	loop_2467
	xorcc	%o2,	%o5,	%g2
	set	0x70, %l1
	stwa	%g6,	[%l7 + %l1] 0x89
loop_2467:
	fcmpgt32	%f28,	%f16,	%l5
	membar	0x5F
	movrgz	%g4,	0x24C,	%g7
	orncc	%i0,	%o6,	%o1
	tl	%xcc,	0x6
	stw	%g1,	[%l7 + 0x50]
	te	%xcc,	0x4
	tle	%icc,	0x5
	fblg,a	%fcc1,	loop_2468
	fcmpeq32	%f28,	%f28,	%g3
	udivcc	%o7,	0x1A4B,	%l3
	udivx	%l4,	0x158E,	%g5
loop_2468:
	movcs	%xcc,	%l6,	%i5
	mova	%xcc,	%o4,	%i1
	fpack16	%f8,	%f23
	tleu	%xcc,	0x4
	andcc	%i2,	%i7,	%i4
	fnors	%f18,	%f16,	%f6
	fmovdcc	%icc,	%f6,	%f4
	orn	%l2,	0x0BF9,	%l1
	fcmpeq16	%f16,	%f30,	%o0
	fmovsle	%xcc,	%f13,	%f8
	call	loop_2469
	tn	%icc,	0x6
	mova	%xcc,	%l0,	%o3
	addcc	%i6,	0x111F,	%i3
loop_2469:
	fmovsge	%icc,	%f17,	%f2
	and	%o2,	0x0786,	%o5
	taddcc	%g2,	%g6,	%l5
	taddcc	%g4,	0x11C0,	%g7
	movrgz	%o6,	0x3D5,	%i0
	fmuld8ulx16	%f10,	%f0,	%f26
	fornot2	%f26,	%f8,	%f4
	udivcc	%g1,	0x1AB9,	%g3
	taddcctv	%o7,	0x1579,	%o1
	fmovde	%icc,	%f25,	%f6
	smulcc	%l4,	%g5,	%l3
	add	%l7,	0x18,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%l6,	%o4
	fcmpgt16	%f14,	%f22,	%i5
	tn	%icc,	0x5
	edge32n	%i2,	%i7,	%i1
	edge8	%l2,	%l1,	%o0
	nop
	fitod	%f12,	%f26
	fdtox	%f26,	%f8
	movcc	%icc,	%i4,	%l0
	tge	%xcc,	0x4
	fmovdcc	%icc,	%f18,	%f31
	nop
	set	0x20, %g4
	sth	%o3,	[%l7 + %g4]
	ldsh	[%l7 + 0x32],	%i3
	umul	%i6,	%o5,	%o2
	bn	%icc,	loop_2470
	fpsub32s	%f8,	%f23,	%f24
	tcs	%xcc,	0x3
	tcc	%xcc,	0x3
loop_2470:
	fmul8ulx16	%f22,	%f24,	%f16
	add	%l7,	0x08,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%g6,	%g2
	tle	%xcc,	0x6
	fmul8x16al	%f17,	%f0,	%f16
	udiv	%l5,	0x101E,	%g4
	subccc	%o6,	%i0,	%g7
	or	%g3,	%o7,	%g1
	tvs	%icc,	0x6
	fbo	%fcc2,	loop_2471
	sra	%o1,	%g5,	%l3
	move	%xcc,	%l6,	%l4
	tl	%xcc,	0x0
loop_2471:
	mulscc	%i5,	%i2,	%i7
	edge16	%i1,	%o4,	%l1
	movge	%icc,	%l2,	%i4
	fbule,a	%fcc3,	loop_2472
	fblg,a	%fcc1,	loop_2473
	and	%o0,	0x190C,	%l0
	movge	%icc,	%o3,	%i3
loop_2472:
	tl	%xcc,	0x2
loop_2473:
	nop
	fitod	%f8,	%f4
	fdtos	%f4,	%f12
	edge32n	%i6,	%o5,	%g6
	tvc	%icc,	0x0
	bg,a	%xcc,	loop_2474
	nop
	setx	0x95903CD71764FD74,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0xEBD2340E1EA21CB2,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	fdivd	%f14,	%f14,	%f12
	fcmpeq16	%f2,	%f12,	%g2
	smulcc	%o2,	0x0B74,	%l5
loop_2474:
	array16	%o6,	%g4,	%g7
	sdivcc	%i0,	0x00DA,	%g3
	tsubcctv	%o7,	%g1,	%g5
	orncc	%o1,	%l6,	%l4
	bpos,a,pt	%icc,	loop_2475
	bcs,a,pt	%icc,	loop_2476
	edge16	%i5,	%i2,	%i7
	array16	%l3,	%o4,	%l1
loop_2475:
	fbul,a	%fcc2,	loop_2477
loop_2476:
	subc	%l2,	0x0894,	%i4
	wr	%g0,	0x80,	%asi
	swapa	[%l7 + 0x5C] %asi,	%o0
loop_2477:
	and	%l0,	0x02CD,	%i1
	edge8n	%o3,	%i6,	%o5
	fmuld8sux16	%f17,	%f21,	%f8
	edge16n	%g6,	%i3,	%g2
	xnor	%l5,	0x1F36,	%o2
	set	0x2C, %g7
	lda	[%l7 + %g7] 0x10,	%f24
	smul	%o6,	0x1575,	%g4
	fbl,a	%fcc0,	loop_2478
	brgz,a	%g7,	loop_2479
	tgu	%xcc,	0x5
	movle	%icc,	%i0,	%o7
loop_2478:
	movpos	%icc,	%g1,	%g5
loop_2479:
	fpsub16s	%f13,	%f14,	%f30
	xnorcc	%g3,	%l6,	%l4
	sdivcc	%i5,	0x042B,	%i2
	xnor	%i7,	%l3,	%o4
	lduw	[%l7 + 0x70],	%l1
	movvc	%icc,	%o1,	%i4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	lduh	[%l7 + 0x16],	%o0
	nop
	setx loop_2480, %l0, %l1
	jmpl %l1, %l2
	movneg	%xcc,	%i1,	%o3
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x5A] %asi,	%l0
loop_2480:
	edge16ln	%o5,	%g6,	%i3
	bvc,a	%icc,	loop_2481
	fones	%f25
	bpos,a	loop_2482
	fabss	%f27,	%f4
loop_2481:
	fnot1	%f16,	%f4
	edge8ln	%i6,	%l5,	%o2
loop_2482:
	andn	%o6,	%g2,	%g4
	addcc	%i0,	0x1AA5,	%o7
	set	0x08, %l0
	lduwa	[%l7 + %l0] 0x80,	%g7
	edge16n	%g1,	%g3,	%g5
	fpadd16s	%f23,	%f26,	%f29
	movl	%icc,	%l4,	%i5
	movrlez	%i2,	%l6,	%l3
	edge8n	%i7,	%l1,	%o1
	edge8l	%o4,	%o0,	%i4
	wr	%g0,	0x11,	%asi
	lda	[%l7 + 0x40] %asi,	%f8
	edge16	%l2,	%o3,	%l0
	bn,pt	%icc,	loop_2483
	movcc	%xcc,	%o5,	%g6
	or	%i1,	0x13A4,	%i3
	edge8	%i6,	%o2,	%o6
loop_2483:
	nop
	membar	#Sync
	wr	%g0,	0x16,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	subccc	%g2,	%l5,	%g4
	fxors	%f16,	%f28,	%f31
	sll	%o7,	0x10,	%i0
	fnor	%f20,	%f10,	%f30
	edge8l	%g7,	%g1,	%g3
	movrgz	%l4,	%g5,	%i2
	xnorcc	%l6,	0x13D7,	%l3
	ldsw	[%l7 + 0x2C],	%i7
	te	%icc,	0x3
	bneg,a	loop_2484
	edge16l	%i5,	%l1,	%o4
	fandnot2	%f6,	%f6,	%f2
	sdivx	%o0,	0x0FF9,	%i4
loop_2484:
	movne	%xcc,	%o1,	%o3
	set	0x40, %o6
	stda	%f0,	[%l7 + %o6] 0x19
	ldub	[%l7 + 0x0E],	%l2
	ldx	[%l7 + 0x28],	%o5
	fbe	%fcc3,	loop_2485
	fmovrsgez	%g6,	%f23,	%f7
	wr	%g0,	0x2a,	%asi
	stha	%l0,	[%l7 + 0x1C] %asi
	membar	#Sync
loop_2485:
	tsubcctv	%i1,	0x0FE9,	%i6
	fblg,a	%fcc1,	loop_2486
	membar	0x09
	taddcctv	%i3,	%o6,	%g2
	array8	%l5,	%o2,	%o7
loop_2486:
	edge16l	%g4,	%i0,	%g1
	mulscc	%g7,	0x144B,	%g3
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
	te	%xcc,	0x6
	ba,pn	%icc,	loop_2488
	movle	%icc,	%l4,	%i2
loop_2487:
	fbul,a	%fcc0,	loop_2489
	movcs	%xcc,	%g5,	%l3
loop_2488:
	edge32	%i7,	%l6,	%l1
	fnegs	%f6,	%f9
loop_2489:
	edge16n	%i5,	%o4,	%o0
	smul	%i4,	0x1195,	%o3
	tcc	%icc,	0x7
	udivx	%l2,	0x0998,	%o1
	movpos	%icc,	%o5,	%g6
	sdiv	%l0,	0x1130,	%i1
	bneg,a	%xcc,	loop_2490
	movrgz	%i3,	%o6,	%i6
	xor	%l5,	0x1ED5,	%o2
	array16	%o7,	%g4,	%i0
loop_2490:
	fbuge,a	%fcc2,	loop_2491
	movrne	%g2,	0x32E,	%g7
	andn	%g3,	%l4,	%i2
	edge8l	%g1,	%g5,	%l3
loop_2491:
	fand	%f24,	%f0,	%f10
	array32	%i7,	%l6,	%l1
	fnand	%f10,	%f2,	%f26
	te	%xcc,	0x0
	movvc	%xcc,	%o4,	%o0
	addc	%i4,	%i5,	%l2
	popc	%o3,	%o1
	xorcc	%g6,	%l0,	%i1
	fblg,a	%fcc2,	loop_2492
	nop
	setx	0x0E803D9B505313ED,	%l0,	%l6
	stx	%l6,	[%l7 + 0x70]
	ldx	[%l7 + 0x70],	%fsr
	movrne	%o5,	0x265,	%o6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2492:
	tvs	%icc,	0x5
	set	0x44, %i2
	swapa	[%l7 + %i2] 0x04,	%i6
	fbul	%fcc2,	loop_2493
	tcc	%icc,	0x5
	nop
	fitos	%f2,	%f11
	fstox	%f11,	%f28
	array16	%i3,	%l5,	%o2
loop_2493:
	nop
	setx loop_2494, %l0, %l1
	jmpl %l1, %o7
	edge16n	%i0,	%g4,	%g7
	membar	0x36
	swap	[%l7 + 0x1C],	%g2
loop_2494:
	movrlez	%l4,	%g3,	%i2
	fblg	%fcc1,	loop_2495
	subccc	%g5,	%g1,	%l3
	array8	%i7,	%l1,	%o4
	movpos	%xcc,	%l6,	%i4
loop_2495:
	udivx	%i5,	0x1B1D,	%o0
	edge8	%l2,	%o3,	%o1
	movrne	%g6,	0x054,	%l0
	wr	%g0,	0x89,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	fmovdne	%xcc,	%f12,	%f30
	set	0x30, %l4
	stba	%i1,	[%l7 + %l4] 0x2f
	membar	#Sync
	bpos,a,pn	%xcc,	loop_2496
	ta	%xcc,	0x1
	edge16l	%o6,	%i6,	%i3
	udivx	%l5,	0x0AF0,	%o2
loop_2496:
	ldd	[%l7 + 0x68],	%f0
	tge	%xcc,	0x4
	tsubcctv	%o7,	%i0,	%g4
	tcc	%icc,	0x4
	movvc	%icc,	%o5,	%g7
	fble	%fcc3,	loop_2497
	fmovdcs	%xcc,	%f5,	%f25
	movcs	%xcc,	%l4,	%g2
	smul	%i2,	%g5,	%g1
loop_2497:
	srax	%l3,	%g3,	%l1
	edge32n	%o4,	%l6,	%i7
	tne	%xcc,	0x2
	udiv	%i5,	0x121C,	%i4
	srl	%o0,	0x1E,	%l2
	std	%f14,	[%l7 + 0x48]
	set	0x54, %o2
	stwa	%o1,	[%l7 + %o2] 0x2a
	membar	#Sync
	fmovsn	%xcc,	%f16,	%f24
	movn	%icc,	%g6,	%o3
	bgu	loop_2498
	fmovs	%f16,	%f18
	umulcc	%i1,	%o6,	%i6
	movrlez	%l0,	0x18E,	%l5
loop_2498:
	fpsub16s	%f22,	%f21,	%f9
	fmul8x16	%f4,	%f24,	%f8
	fornot2s	%f14,	%f22,	%f21
	tsubcctv	%o2,	0x169A,	%o7
	fmovdcc	%icc,	%f6,	%f17
	sir	0x0B9B
	array32	%i3,	%i0,	%o5
	ta	%icc,	0x5
	udivx	%g7,	0x1CF6,	%l4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	brlz,a	%g4,	loop_2499
	bne,a,pt	%xcc,	loop_2500
	fmovrslz	%g2,	%f26,	%f27
	bneg,a	%icc,	loop_2501
loop_2499:
	be	%xcc,	loop_2502
loop_2500:
	movrlz	%g5,	%i2,	%l3
	brgez	%g1,	loop_2503
loop_2501:
	fmovsleu	%icc,	%f9,	%f12
loop_2502:
	tcc	%xcc,	0x3
	xor	%l1,	0x0D0A,	%o4
loop_2503:
	tgu	%icc,	0x7
	tneg	%icc,	0x1
	xorcc	%g3,	0x0EFF,	%l6
	edge8l	%i5,	%i4,	%o0
	subccc	%l2,	0x1677,	%o1
	tl	%xcc,	0x6
	tleu	%xcc,	0x0
	and	%g6,	0x13D6,	%i7
	set	0x22, %i7
	lduba	[%l7 + %i7] 0x15,	%o3
	nop
	setx	0x7757C869C05DC739,	%l0,	%l6
	stx	%l6,	[%l7 + 0x40]
	ldx	[%l7 + 0x40],	%fsr
	fmovsl	%xcc,	%f13,	%f2
	edge16	%i1,	%o6,	%l0
	edge16l	%i6,	%l5,	%o7
	sdiv	%o2,	0x0434,	%i0
	srl	%i3,	0x16,	%g7
	fmul8x16au	%f7,	%f10,	%f30
	ldd	[%l7 + 0x40],	%f18
	bg	%xcc,	loop_2504
	srl	%o5,	%l4,	%g4
	set	0x59, %i0
	ldsba	[%l7 + %i0] 0x89,	%g5
loop_2504:
	tcc	%xcc,	0x0
	srlx	%i2,	%l3,	%g2
	fmul8x16au	%f29,	%f12,	%f26
	movpos	%xcc,	%g1,	%l1
	movpos	%icc,	%g3,	%o4
	udivx	%l6,	0x0FC3,	%i4
	fandnot2s	%f12,	%f0,	%f12
	orn	%o0,	0x021A,	%l2
	movg	%xcc,	%i5,	%o1
	fandnot1s	%f9,	%f6,	%f25
	fbg,a	%fcc1,	loop_2505
	udiv	%g6,	0x12C2,	%o3
	tg	%icc,	0x7
	bleu	loop_2506
loop_2505:
	fcmpgt32	%f18,	%f22,	%i7
	stbar
	bgu,pt	%xcc,	loop_2507
loop_2506:
	fnot2s	%f11,	%f14
	mulx	%i1,	0x155F,	%o6
	tcc	%icc,	0x1
loop_2507:
	xnor	%l0,	0x01AC,	%l5
	wr	%g0,	0x22,	%asi
	stba	%i6,	[%l7 + 0x49] %asi
	membar	#Sync
	fpsub32	%f18,	%f10,	%f10
	edge8	%o7,	%i0,	%o2
	fandnot1s	%f5,	%f7,	%f29
	set	0x30, %g3
	stxa	%i3,	[%g0 + %g3] 0x4f
	wr	%g0,	0x18,	%asi
	prefetcha	[%l7 + 0x38] %asi,	 0x1
	xor	%l4,	0x10FD,	%g4
	edge8	%o5,	%i2,	%l3
	ta	%icc,	0x7
	taddcctv	%g2,	0x0293,	%g5
	movpos	%xcc,	%l1,	%g3
	fpsub32s	%f25,	%f9,	%f28
	fcmpgt16	%f30,	%f2,	%o4
	movge	%icc,	%g1,	%l6
	alignaddrl	%i4,	%l2,	%o0
	andn	%i5,	%o1,	%o3
	tle	%icc,	0x3
	fpsub32	%f20,	%f16,	%f26
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsb	[%l7 + 0x66],	%g6
	ldsh	[%l7 + 0x7C],	%i1
	tvs	%icc,	0x1
	fmovsg	%icc,	%f24,	%f8
	array8	%i7,	%o6,	%l5
	tne	%xcc,	0x2
	fmovrde	%i6,	%f28,	%f30
	fornot2s	%f25,	%f0,	%f11
	tvs	%icc,	0x3
	nop
	fitos	%f23,	%f22
	smul	%l0,	0x1BF0,	%o7
	fmovdpos	%icc,	%f10,	%f20
	sdiv	%i0,	0x0EDF,	%o2
	wr	%g0,	0xf1,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
	nop
	setx	0x2C79C17EBF8EBF2D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0xE1D3BABA79494F58,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	fdivd	%f14,	%f16,	%f4
	fbuge	%fcc3,	loop_2508
	tcs	%xcc,	0x1
	smulcc	%i3,	%l4,	%g7
	sll	%g4,	%i2,	%l3
loop_2508:
	ldsb	[%l7 + 0x7D],	%g2
	bne,pn	%xcc,	loop_2509
	xorcc	%g5,	0x11D8,	%o5
	fmovsn	%icc,	%f18,	%f0
	fbne	%fcc2,	loop_2510
loop_2509:
	fpack32	%f28,	%f14,	%f0
	bpos	%icc,	loop_2511
	bn,a	%xcc,	loop_2512
loop_2510:
	udivx	%l1,	0x0774,	%g3
	set	0x108, %o7
	ldxa	[%g0 + %o7] 0x21,	%g1
loop_2511:
	tg	%icc,	0x0
loop_2512:
	membar	0x42
	set	0x5E, %o5
	stba	%l6,	[%l7 + %o5] 0xe3
	membar	#Sync
	add	%i4,	0x12C1,	%o4
	fblg,a	%fcc2,	loop_2513
	smul	%o0,	0x0C66,	%i5
	fmovdvs	%icc,	%f28,	%f27
	bne	loop_2514
loop_2513:
	fbu,a	%fcc0,	loop_2515
	movne	%xcc,	%l2,	%o3
	fnegs	%f10,	%f25
loop_2514:
	fmovrdgz	%o1,	%f2,	%f8
loop_2515:
	andncc	%i1,	%g6,	%i7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tl	%icc,	0x4
	tge	%xcc,	0x0
	array32	%o6,	%i6,	%l0
	pdist	%f14,	%f24,	%f6
	ble,a,pn	%xcc,	loop_2516
	or	%o7,	0x0DA2,	%i0
	edge16n	%o2,	%i3,	%l4
	movrgez	%g7,	%l5,	%i2
loop_2516:
	edge16n	%g4,	%g2,	%l3
	te	%xcc,	0x3
	te	%icc,	0x1
	bleu,a,pn	%xcc,	loop_2517
	bg,a,pt	%xcc,	loop_2518
	fbuge	%fcc2,	loop_2519
	tsubcctv	%o5,	0x0C87,	%g5
loop_2517:
	taddcc	%g3,	%g1,	%l6
loop_2518:
	movne	%xcc,	%l1,	%i4
loop_2519:
	tle	%xcc,	0x5
	fmovdn	%xcc,	%f28,	%f4
	edge8ln	%o4,	%o0,	%i5
	set	0x44, %g6
	swapa	[%l7 + %g6] 0x11,	%l2
	tcc	%icc,	0x5
	movcs	%xcc,	%o3,	%i1
	tcc	%xcc,	0x4
	srax	%o1,	0x01,	%i7
	movcc	%xcc,	%o6,	%g6
	fmovdne	%xcc,	%f21,	%f24
	sir	0x0AD2
	subcc	%l0,	%i6,	%o7
	taddcctv	%i0,	0x163C,	%o2
	fble,a	%fcc3,	loop_2520
	taddcc	%l4,	%i3,	%g7
	fxor	%f28,	%f16,	%f24
	mulscc	%l5,	%i2,	%g2
loop_2520:
	udivcc	%l3,	0x1E2C,	%g4
	movle	%xcc,	%g5,	%g3
	array32	%o5,	%g1,	%l1
	addcc	%i4,	%o4,	%o0
	udiv	%l6,	0x1224,	%i5
	addccc	%o3,	0x0ED5,	%i1
	fmovrslz	%l2,	%f19,	%f4
	udiv	%o1,	0x059C,	%o6
	fmovrslz	%g6,	%f4,	%f25
	wr	%g0,	0x88,	%asi
	stwa	%i7,	[%l7 + 0x4C] %asi
	edge8	%l0,	%o7,	%i0
	movl	%xcc,	%i6,	%l4
	fmul8x16	%f16,	%f2,	%f24
	addcc	%i3,	%o2,	%l5
	alignaddr	%g7,	%i2,	%g2
	udivx	%l3,	0x1028,	%g4
	array16	%g3,	%o5,	%g5
	movvs	%xcc,	%g1,	%l1
	orncc	%i4,	%o4,	%l6
	movrlez	%o0,	%o3,	%i5
	movne	%xcc,	%l2,	%i1
	bne,a,pn	%icc,	loop_2521
	udivx	%o1,	0x1C8A,	%g6
	tvs	%icc,	0x4
	movge	%icc,	%o6,	%l0
loop_2521:
	nop
	setx	0xF067EDA0,	%l0,	%l6
	st	%l6,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%fsr
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movcc	%xcc,	%o7,	%i0
	sdiv	%i7,	0x1F1C,	%i6
	prefetch	[%l7 + 0x4C],	 0x1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8n	%i3,	%o2,	%l5
	movgu	%icc,	%l4,	%i2
	set	0x08, %o1
	swapa	[%l7 + %o1] 0x89,	%g7
	movl	%icc,	%l3,	%g2
	movvs	%xcc,	%g3,	%g4
	fmovde	%icc,	%f29,	%f6
	fmuld8sux16	%f18,	%f15,	%f16
	subc	%o5,	%g1,	%g5
	bvs	loop_2522
	movl	%icc,	%l1,	%i4
	fzeros	%f4
	mova	%xcc,	%o4,	%o0
loop_2522:
	edge32ln	%l6,	%i5,	%o3
	movrgez	%l2,	0x036,	%i1
	edge32	%o1,	%o6,	%g6
	bneg	loop_2523
	tgu	%xcc,	0x6
	xorcc	%l0,	0x1E3D,	%o7
	edge8	%i7,	%i0,	%i6
loop_2523:
	fors	%f26,	%f0,	%f0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movvc	%xcc,	%i3,	%o2
	fmovrslz	%l5,	%f29,	%f3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnand	%f16,	%f26,	%f10
	set	0x44, %i1
	lda	[%l7 + %i1] 0x15,	%f18
	smul	%l4,	%i2,	%g7
	add	%l7,	0x1C,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] %asi,	%g2,	%l3
	fabss	%f18,	%f28
	edge32n	%g4,	%g3,	%g1
	movrlz	%g5,	%o5,	%i4
	edge32ln	%o4,	%l1,	%o0
	movrne	%l6,	0x187,	%i5
	fmovsle	%icc,	%f23,	%f22
	set	0x20, %l2
	prefetcha	[%l7 + %l2] 0x89,	 0x1
	addccc	%l2,	0x17CD,	%o1
	tg	%icc,	0x1
	fcmpeq16	%f18,	%f22,	%o6
	edge32ln	%i1,	%l0,	%o7
	fpsub16	%f14,	%f10,	%f24
	tpos	%icc,	0x5
	udivx	%g6,	0x01FE,	%i7
	fbuge,a	%fcc3,	loop_2524
	movcc	%icc,	%i0,	%i6
	edge32ln	%i3,	%l5,	%o2
	ldx	[%l7 + 0x48],	%l4
loop_2524:
	addccc	%i2,	0x1708,	%g2
	fsrc2	%f6,	%f16
	stbar
	subc	%l3,	%g7,	%g4
	edge32ln	%g3,	%g5,	%g1
	fbo	%fcc0,	loop_2525
	bneg,a	loop_2526
	be,a	loop_2527
	tle	%xcc,	0x5
loop_2525:
	tneg	%icc,	0x7
loop_2526:
	bcs	loop_2528
loop_2527:
	taddcctv	%o5,	%o4,	%i4
	movleu	%xcc,	%o0,	%l1
	movcs	%icc,	%l6,	%i5
loop_2528:
	edge16ln	%o3,	%l2,	%o6
	fmovda	%icc,	%f30,	%f26
	fmovrsne	%o1,	%f17,	%f29
	edge8	%i1,	%l0,	%g6
	fmovsge	%xcc,	%f9,	%f11
	fbug	%fcc3,	loop_2529
	tvs	%xcc,	0x0
	st	%f21,	[%l7 + 0x54]
	tvs	%xcc,	0x4
loop_2529:
	tleu	%icc,	0x6
	bgu,a,pn	%xcc,	loop_2530
	fpsub32	%f4,	%f12,	%f6
	movrlez	%i7,	0x231,	%o7
	sll	%i0,	%i3,	%i6
loop_2530:
	bshuffle	%f28,	%f24,	%f4
	set	0x2E, %o3
	lduba	[%l7 + %o3] 0x88,	%o2
	fbne,a	%fcc0,	loop_2531
	tg	%icc,	0x1
	tvc	%xcc,	0x1
	smulcc	%l5,	%i2,	%l4
loop_2531:
	edge8	%l3,	%g7,	%g4
	popc	0x053E,	%g3
	tvc	%xcc,	0x7
	edge16l	%g5,	%g2,	%o5
	fmovrdlez	%o4,	%f8,	%f28
	bl,a,pn	%icc,	loop_2532
	nop
	fitos	%f7,	%f7
	fstoi	%f7,	%f20
	sllx	%g1,	0x0D,	%i4
	fands	%f3,	%f1,	%f8
loop_2532:
	nop
	fitos	%f13,	%f25
	fstox	%f25,	%f22
	fxtos	%f22,	%f27
	nop
	setx loop_2533, %l0, %l1
	jmpl %l1, %o0
	fpsub32s	%f16,	%f3,	%f29
	fsrc2s	%f9,	%f7
	movleu	%icc,	%l6,	%l1
loop_2533:
	mova	%xcc,	%o3,	%i5
	sdiv	%o6,	0x07AC,	%o1
	edge16ln	%i1,	%l2,	%l0
	wr	%g0,	0x04,	%asi
	stwa	%i7,	[%l7 + 0x78] %asi
	fmovrdlez	%g6,	%f6,	%f24
	fbuge	%fcc2,	loop_2534
	std	%f8,	[%l7 + 0x08]
	ldub	[%l7 + 0x74],	%o7
	sth	%i0,	[%l7 + 0x1E]
loop_2534:
	tsubcctv	%i6,	%o2,	%l5
	set	0x350, %i6
	nop 	! 	nop 	! 	ldxa	[%g0 + %i6] 0x40,	%i3 ripped by fixASI40.pl ripped by fixASI40.pl
	fnegs	%f15,	%f11
	srl	%i2,	0x09,	%l3
	st	%f27,	[%l7 + 0x3C]
	umul	%g7,	%g4,	%l4
	movn	%icc,	%g5,	%g3
	tge	%xcc,	0x3
	edge8	%o5,	%g2,	%g1
	fnegs	%f22,	%f4
	tpos	%xcc,	0x2
	orcc	%o4,	%o0,	%l6
	fnot2	%f16,	%f26
	movpos	%icc,	%i4,	%l1
	fnegd	%f4,	%f10
	array8	%o3,	%o6,	%o1
	sdivcc	%i1,	0x042A,	%i5
	wr	%g0,	0x18,	%asi
	ldsha	[%l7 + 0x24] %asi,	%l0
	set	0x0F, %o0
	ldsba	[%l7 + %o0] 0x04,	%i7
	srl	%g6,	%l2,	%i0
	movleu	%xcc,	%o7,	%o2
	wr	%g0,	0x23,	%asi
	stha	%l5,	[%l7 + 0x40] %asi
	membar	#Sync
	taddcc	%i6,	0x1A5A,	%i3
	udivcc	%l3,	0x0C2F,	%g7
	tge	%xcc,	0x0
	fcmpeq32	%f24,	%f20,	%i2
	udivx	%g4,	0x044B,	%l4
	tcc	%icc,	0x1
	ba,a,pn	%xcc,	loop_2535
	taddcc	%g5,	%g3,	%g2
	movrlz	%g1,	0x136,	%o4
	movrgz	%o5,	0x048,	%l6
loop_2535:
	srlx	%i4,	%l1,	%o0
	umul	%o3,	%o1,	%o6
	addc	%i5,	%l0,	%i7
	nop
	fitos	%f0,	%f19
	fstox	%f19,	%f18
	fxtos	%f18,	%f10
	array16	%g6,	%l2,	%i1
	array32	%o7,	%i0,	%o2
	addccc	%i6,	%i3,	%l3
	nop
	setx	loop_2536,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	tpos	%xcc,	0x2
	bleu,pt	%icc,	loop_2537
	edge16ln	%l5,	%g7,	%i2
loop_2536:
	nop
	set	0x4B, %g1
	ldub	[%l7 + %g1],	%l4
	sth	%g4,	[%l7 + 0x3E]
loop_2537:
	mova	%xcc,	%g5,	%g2
	sdiv	%g1,	0x027B,	%o4
	edge32n	%g3,	%l6,	%o5
	nop
	setx	0x34835FD0806DBCE1,	%l0,	%l6
	stx	%l6,	[%l7 + 0x68]
	ldx	[%l7 + 0x68],	%fsr
	move	%xcc,	%i4,	%o0
	movge	%icc,	%o3,	%l1
	or	%o6,	0x19FA,	%i5
	brlz	%l0,	loop_2538
	fmovs	%f24,	%f11
	or	%i7,	0x076C,	%o1
	ta	%xcc,	0x6
loop_2538:
	membar	0x28
	tvs	%icc,	0x5
	movcc	%xcc,	%g6,	%i1
	fmovrdne	%l2,	%f8,	%f8
	edge8ln	%i0,	%o2,	%i6
	srax	%i3,	%l3,	%l5
	move	%xcc,	%o7,	%i2
	fmovsg	%icc,	%f16,	%f10
	movvs	%icc,	%g7,	%g4
	movrgz	%l4,	0x3AE,	%g2
	te	%icc,	0x5
	fornot1	%f18,	%f26,	%f6
	movrgz	%g5,	0x1D2,	%g1
	swap	[%l7 + 0x14],	%g3
	movpos	%icc,	%o4,	%o5
	smul	%l6,	%i4,	%o0
	umul	%o3,	%o6,	%l1
	fornot2s	%f31,	%f28,	%f12
	xnorcc	%i5,	0x0708,	%i7
	tcs	%xcc,	0x1
	nop
	setx	loop_2539,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	bn	loop_2540
	movrgez	%l0,	%o1,	%g6
	and	%i1,	%i0,	%l2
loop_2539:
	popc	0x15E0,	%o2
loop_2540:
	fmovrde	%i3,	%f16,	%f18
	alignaddr	%l3,	%l5,	%i6
	subcc	%o7,	%g7,	%g4
	prefetch	[%l7 + 0x14],	 0x3
	add	%l4,	%i2,	%g5
	edge32ln	%g2,	%g1,	%g3
	fcmple16	%f0,	%f8,	%o4
	fmovrdlez	%l6,	%f10,	%f18
	fbue	%fcc3,	loop_2541
	xor	%i4,	0x034B,	%o5
	wr	%g0,	0x10,	%asi
	ldswa	[%l7 + 0x70] %asi,	%o3
loop_2541:
	nop
	wr	%g0,	0x89,	%asi
	ldsba	[%l7 + 0x61] %asi,	%o0
	orncc	%l1,	0x0058,	%o6
	nop
	set	0x20, %i4
	ldd	[%l7 + %i4],	%f18
	bshuffle	%f6,	%f16,	%f30
	array32	%i7,	%i5,	%o1
	movleu	%icc,	%g6,	%l0
	mova	%icc,	%i0,	%i1
	sdiv	%l2,	0x10FD,	%o2
	movneg	%icc,	%i3,	%l5
	alignaddr	%i6,	%l3,	%g7
	ta	%icc,	0x5
	fnot2s	%f5,	%f6
	sll	%g4,	%l4,	%i2
	fbe,a	%fcc3,	loop_2542
	or	%o7,	0x16F8,	%g2
	ta	%xcc,	0x1
	movpos	%xcc,	%g1,	%g5
loop_2542:
	te	%xcc,	0x1
	ldsb	[%l7 + 0x2E],	%g3
	taddcctv	%o4,	%l6,	%o5
	edge8	%o3,	%o0,	%l1
	xnorcc	%i4,	%o6,	%i5
	fmovsa	%icc,	%f11,	%f10
	fmovrdgz	%o1,	%f4,	%f8
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srax	%i7,	0x11,	%g6
	movvs	%xcc,	%l0,	%i1
	edge16	%i0,	%o2,	%l2
	bleu,pt	%xcc,	loop_2543
	add	%i3,	%l5,	%l3
	te	%xcc,	0x5
	bn,a,pt	%icc,	loop_2544
loop_2543:
	ldd	[%l7 + 0x18],	%g6
	faligndata	%f14,	%f6,	%f8
	fmovd	%f24,	%f8
loop_2544:
	nop
	set	0x23, %l6
	ldsba	[%l7 + %l6] 0x14,	%i6
	fmul8sux16	%f0,	%f6,	%f18
	te	%icc,	0x5
	array8	%g4,	%i2,	%o7
	alignaddr	%g2,	%l4,	%g1
	or	%g5,	0x178D,	%o4
	sra	%g3,	0x08,	%l6
	mulx	%o3,	0x1106,	%o5
	srlx	%o0,	0x05,	%i4
	te	%icc,	0x5
	sir	0x178F
	brz,a	%o6,	loop_2545
	fornot1s	%f26,	%f22,	%f8
	nop
	set	0x54, %l5
	sth	%l1,	[%l7 + %l5]
	subc	%i5,	%i7,	%g6
loop_2545:
	brlz,a	%o1,	loop_2546
	mulx	%i1,	%l0,	%i0
	wr	%g0,	0x24,	%asi
	ldda	[%l7 + 0x50] %asi,	%o2
loop_2546:
	sub	%l2,	0x1779,	%l5
	lduh	[%l7 + 0x34],	%i3
	fmul8x16	%f2,	%f6,	%f12
	fbuge	%fcc2,	loop_2547
	ldstub	[%l7 + 0x1E],	%l3
	mulx	%i6,	0x10A3,	%g4
	movcs	%icc,	%i2,	%o7
loop_2547:
	ta	%icc,	0x2
	tn	%xcc,	0x2
	edge16	%g2,	%l4,	%g1
	movcc	%icc,	%g7,	%o4
	movn	%icc,	%g5,	%g3
	movvs	%icc,	%l6,	%o5
	tgu	%xcc,	0x6
	alignaddr	%o3,	%i4,	%o0
	nop
	fitos	%f12,	%f1
	fstod	%f1,	%f26
	alignaddr	%l1,	%i5,	%i7
	edge16	%g6,	%o6,	%o1
	nop
	setx	0x6C55256A203AAE82,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0xB387CFC46D1917CD,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	fdivd	%f24,	%f0,	%f14
	nop
	fitod	%f12,	%f10
	popc	%i1,	%i0
	set	0x22, %g2
	lduha	[%l7 + %g2] 0x81,	%o2
	fmovdge	%xcc,	%f30,	%f10
	popc	0x1A34,	%l2
	fxor	%f0,	%f18,	%f22
	fmovdne	%icc,	%f15,	%f15
	fmovrsgez	%l5,	%f13,	%f17
	set	0x7C, %g5
	ldswa	[%l7 + %g5] 0x15,	%l0
	te	%xcc,	0x1
	xnor	%i3,	0x17C9,	%l3
	fbo,a	%fcc3,	loop_2548
	fmovsa	%icc,	%f17,	%f4
	fmovsge	%icc,	%f4,	%f22
	movrgz	%i6,	0x230,	%g4
loop_2548:
	mulscc	%i2,	%g2,	%o7
	edge8ln	%l4,	%g7,	%g1
	nop
	fitos	%f14,	%f30
	fstox	%f30,	%f28
	movne	%icc,	%o4,	%g5
	udivx	%l6,	0x12E3,	%o5
	tgu	%icc,	0x4
	udivcc	%o3,	0x103E,	%i4
	andcc	%g3,	%o0,	%i5
	edge32n	%l1,	%i7,	%o6
	nop
	setx	0x9047B9EA,	%l0,	%l6
	st	%l6,	[%l7 + 0x64]
	ld	[%l7 + 0x64],	%fsr
	fmovrsne	%g6,	%f27,	%f18
	fandnot2s	%f26,	%f12,	%f3
	addc	%i1,	0x1640,	%i0
	movrgz	%o1,	%l2,	%l5
	ldub	[%l7 + 0x20],	%l0
	tl	%icc,	0x0
	movleu	%xcc,	%o2,	%i3
	fcmpgt32	%f4,	%f26,	%l3
	sir	0x1CA0
	set	0x58, %i3
	ldswa	[%l7 + %i3] 0x19,	%i6
	or	%i2,	0x076E,	%g2
	umul	%g4,	%l4,	%g7
	or	%g1,	%o7,	%g5
	tcc	%xcc,	0x5
	movrgz	%o4,	0x14E,	%o5
	sdivcc	%o3,	0x1AD4,	%i4
	edge8ln	%g3,	%o0,	%l6
	te	%xcc,	0x5
	edge8l	%l1,	%i5,	%o6
	edge16ln	%i7,	%i1,	%g6
	set	0x38, %i5
	lda	[%l7 + %i5] 0x88,	%f30
	edge16n	%i0,	%l2,	%o1
	mulx	%l5,	0x1595,	%l0
	alignaddrl	%o2,	%l3,	%i3
	tgu	%icc,	0x4
	brlez,a	%i2,	loop_2549
	brz,a	%g2,	loop_2550
	add	%i6,	%g4,	%g7
	sdiv	%l4,	0x1120,	%o7
loop_2549:
	andncc	%g5,	%o4,	%o5
loop_2550:
	fbu	%fcc2,	loop_2551
	sllx	%g1,	0x11,	%i4
	nop
	setx	0x5073E791,	%l0,	%l6
	st	%l6,	[%l7 + 0x74]
	ld	[%l7 + 0x74],	%fsr
	movrgez	%o3,	%o0,	%l6
loop_2551:
	edge32	%l1,	%g3,	%i5
	movcc	%xcc,	%o6,	%i7
	add	%l7,	0x7C,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%g6
	casa	[%l6] 0x89,	%g6,	%i0
	udivcc	%l2,	0x13CA,	%i1
	xor	%l5,	%o1,	%l0
	ble	%icc,	loop_2552
	tl	%xcc,	0x2
	nop
	setx	0xCD63A48DFA0DE742,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0xA100842F7C2C14F0,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	fdivd	%f10,	%f20,	%f22
	movrgez	%l3,	0x093,	%o2
loop_2552:
	mulscc	%i2,	0x13C2,	%i3
	fbu,a	%fcc2,	loop_2553
	membar	0x1E
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16	%g2,	%i6,	%g4
loop_2553:
	movvc	%icc,	%l4,	%g7
	tcc	%xcc,	0x0
	array16	%g5,	%o4,	%o7
	edge32n	%o5,	%i4,	%o3
	tne	%icc,	0x4
	bvs,pt	%icc,	loop_2554
	fmovdn	%icc,	%f9,	%f29
	edge32l	%o0,	%g1,	%l1
	bge,a,pn	%xcc,	loop_2555
loop_2554:
	bneg,a	%icc,	loop_2556
	sdiv	%g3,	0x1826,	%i5
	fmovdpos	%icc,	%f1,	%f15
loop_2555:
	tge	%xcc,	0x6
loop_2556:
	sth	%l6,	[%l7 + 0x0E]
	sdivx	%o6,	0x050A,	%i7
	ldsw	[%l7 + 0x74],	%i0
	smulcc	%l2,	0x0C27,	%g6
	fmovs	%f15,	%f2
	bg,a,pt	%icc,	loop_2557
	movcc	%icc,	%l5,	%o1
	fone	%f30
	fpackfix	%f18,	%f20
loop_2557:
	sdiv	%i1,	0x0BD7,	%l0
	smulcc	%l3,	0x037F,	%o2
	bpos,pn	%icc,	loop_2558
	call	loop_2559
	tg	%xcc,	0x3
	bcs,pt	%icc,	loop_2560
loop_2558:
	tgu	%icc,	0x2
loop_2559:
	edge16	%i3,	%i2,	%g2
	tcs	%xcc,	0x6
loop_2560:
	bne,a	%xcc,	loop_2561
	flush	%l7 + 0x68
	ldstub	[%l7 + 0x28],	%g4
	movcs	%xcc,	%i6,	%l4
loop_2561:
	nop
	set	0x50, %o4
	ldda	[%l7 + %o4] 0x2b,	%g6
	edge16	%g5,	%o4,	%o5
	movrgz	%i4,	%o3,	%o7
	movrgez	%g1,	%l1,	%o0
	movrne	%i5,	%g3,	%o6
	udivx	%l6,	0x1DE6,	%i7
	edge16n	%l2,	%g6,	%l5
	andn	%o1,	0x0FC5,	%i1
	tgu	%xcc,	0x6
	fnot2s	%f15,	%f31
	bn	%icc,	loop_2562
	ba	%xcc,	loop_2563
	tvs	%icc,	0x1
	bvc,pt	%xcc,	loop_2564
loop_2562:
	fmovrsne	%l0,	%f14,	%f23
loop_2563:
	fmovse	%xcc,	%f9,	%f24
	movle	%xcc,	%l3,	%o2
loop_2564:
	xnorcc	%i3,	0x0879,	%i2
	set	0x18, %l3
	stwa	%g2,	[%l7 + %l3] 0x2b
	membar	#Sync
	fpack16	%f20,	%f13
	bleu,pt	%xcc,	loop_2565
	fbne	%fcc1,	loop_2566
	movrgz	%i0,	%i6,	%g4
	fexpand	%f12,	%f6
loop_2565:
	nop
	set	0x58, %g4
	stxa	%g7,	[%l7 + %g4] 0x18
loop_2566:
	edge16l	%g5,	%l4,	%o5
	nop
	fitos	%f13,	%f10
	fstoi	%f10,	%f29
	alignaddr	%o4,	%o3,	%i4
	edge16l	%o7,	%l1,	%o0
	brlez	%g1,	loop_2567
	fornot1s	%f7,	%f18,	%f12
	popc	0x16E6,	%g3
	brgz	%i5,	loop_2568
loop_2567:
	fornot2	%f22,	%f6,	%f30
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldub	[%l7 + 0x5E],	%o6
loop_2568:
	bvc,a,pn	%xcc,	loop_2569
	bge,a,pn	%icc,	loop_2570
	fcmple16	%f26,	%f26,	%i7
	movvc	%xcc,	%l6,	%g6
loop_2569:
	fnands	%f0,	%f8,	%f30
loop_2570:
	nop
	wr	%g0,	0x80,	%asi
	ldsba	[%l7 + 0x67] %asi,	%l2
	sdiv	%o1,	0x1EFE,	%i1
	alignaddrl	%l5,	%l3,	%o2
	movn	%xcc,	%l0,	%i3
	alignaddr	%i2,	%g2,	%i6
	andncc	%g4,	%i0,	%g5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	taddcc	%g7,	%l4,	%o5
	tneg	%icc,	0x5
	tle	%xcc,	0x6
	array8	%o3,	%i4,	%o7
	movrgez	%o4,	%l1,	%o0
	sra	%g3,	0x0B,	%g1
	taddcctv	%o6,	0x16CB,	%i7
	smulcc	%i5,	0x1200,	%g6
	for	%f20,	%f22,	%f26
	orcc	%l2,	0x1CAF,	%o1
	fmovdn	%xcc,	%f16,	%f10
	mova	%xcc,	%l6,	%l5
	brlez,a	%i1,	loop_2571
	movle	%icc,	%o2,	%l0
	set	0x40, %g7
	ldda	[%l7 + %g7] 0x11,	%f16
loop_2571:
	nop
	set	0x7C, %l0
	ldswa	[%l7 + %l0] 0x15,	%i3
	fmovsneg	%icc,	%f26,	%f24
	mulscc	%i2,	0x0D05,	%g2
	tgu	%xcc,	0x0
	fmovsg	%icc,	%f29,	%f17
	wr	%g0,	0x18,	%asi
	prefetcha	[%l7 + 0x30] %asi,	 0x0
	move	%xcc,	%i6,	%i0
	tl	%icc,	0x7
	udiv	%g5,	0x1EFA,	%g7
	movn	%xcc,	%l4,	%o5
	fmovs	%f23,	%f8
	edge32	%o3,	%i4,	%o7
	fandnot1	%f24,	%f24,	%f16
	movre	%g4,	%l1,	%o0
	movg	%icc,	%g3,	%g1
	wr	%g0,	0x89,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	nop
	fitos	%f5,	%f29
	fstox	%f29,	%f0
	fxtos	%f0,	%f31
	tne	%xcc,	0x1
	udiv	%o6,	0x1C15,	%i7
	taddcctv	%i5,	0x110D,	%o4
	tg	%icc,	0x3
	fmovrdgez	%g6,	%f12,	%f24
	fnands	%f8,	%f29,	%f25
	xorcc	%l2,	%o1,	%l5
	fzero	%f4
	smulcc	%i1,	0x0D67,	%l6
	bgu	loop_2572
	be,a	loop_2573
	movrlez	%o2,	0x248,	%i3
	subccc	%i2,	%g2,	%l3
loop_2572:
	std	%f26,	[%l7 + 0x28]
loop_2573:
	xnor	%i6,	%l0,	%i0
	smulcc	%g5,	%g7,	%o5
	fmovsge	%icc,	%f9,	%f23
	popc	%o3,	%l4
	xorcc	%i4,	0x1137,	%o7
	prefetch	[%l7 + 0x78],	 0x2
	tcc	%icc,	0x3
	fpmerge	%f27,	%f21,	%f28
	srlx	%g4,	0x1C,	%o0
	umul	%g3,	%g1,	%l1
	fxor	%f24,	%f22,	%f4
	fmovsa	%xcc,	%f16,	%f13
	tl	%xcc,	0x0
	fpadd16	%f4,	%f8,	%f2
	sethi	0x19B8,	%o6
	movn	%icc,	%i7,	%o4
	edge32n	%i5,	%g6,	%l2
	ldsh	[%l7 + 0x5C],	%o1
	nop
	setx	0xFEFC374E2C0F7D37,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0x07543C5981598ECB,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	faddd	%f2,	%f20,	%f28
	flush	%l7 + 0x10
	udivx	%l5,	0x0D11,	%i1
	edge32l	%o2,	%l6,	%i2
	smulcc	%g2,	%i3,	%i6
	stw	%l0,	[%l7 + 0x08]
	swap	[%l7 + 0x10],	%i0
	udiv	%g5,	0x0CB2,	%l3
	fbue	%fcc3,	loop_2574
	smulcc	%o5,	0x1148,	%g7
	fblg,a	%fcc0,	loop_2575
	mova	%icc,	%l4,	%i4
loop_2574:
	tne	%xcc,	0x7
	ld	[%l7 + 0x08],	%f11
loop_2575:
	fmovsg	%xcc,	%f13,	%f27
	fblg	%fcc2,	loop_2576
	tneg	%xcc,	0x1
	taddcc	%o7,	0x1E60,	%g4
	srax	%o3,	0x1C,	%g3
loop_2576:
	movrgz	%g1,	0x012,	%o0
	movl	%icc,	%o6,	%i7
	set	0x58, %l1
	ldswa	[%l7 + %l1] 0x11,	%l1
	fmovd	%f18,	%f10
	fblg,a	%fcc1,	loop_2577
	tg	%xcc,	0x7
	tl	%xcc,	0x0
	fornot2	%f6,	%f22,	%f10
loop_2577:
	nop
	setx	loop_2578,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	move	%icc,	%o4,	%g6
	fmovrdgez	%i5,	%f2,	%f12
	brgez	%o1,	loop_2579
loop_2578:
	bgu,pn	%xcc,	loop_2580
	tle	%xcc,	0x5
	lduh	[%l7 + 0x50],	%l5
loop_2579:
	fsrc2	%f12,	%f22
loop_2580:
	edge32	%l2,	%o2,	%i1
	movrgez	%i2,	%l6,	%i3
	fbule	%fcc0,	loop_2581
	tne	%xcc,	0x6
	fmovde	%xcc,	%f27,	%f13
	fbne	%fcc0,	loop_2582
loop_2581:
	tl	%icc,	0x2
	xor	%g2,	0x1F0B,	%l0
	orncc	%i6,	%i0,	%l3
loop_2582:
	movgu	%xcc,	%o5,	%g7
	tge	%icc,	0x0
	bneg,pt	%icc,	loop_2583
	prefetch	[%l7 + 0x2C],	 0x2
	xnorcc	%g5,	%l4,	%o7
	array8	%g4,	%o3,	%g3
loop_2583:
	call	loop_2584
	brgz,a	%g1,	loop_2585
	movrgz	%o0,	0x180,	%o6
	tneg	%icc,	0x5
loop_2584:
	smul	%i7,	%l1,	%o4
loop_2585:
	subccc	%i4,	%g6,	%i5
	tsubcctv	%o1,	%l5,	%l2
	edge16ln	%o2,	%i1,	%l6
	array8	%i2,	%g2,	%l0
	fornot1	%f20,	%f8,	%f24
	fbu	%fcc0,	loop_2586
	swap	[%l7 + 0x48],	%i3
	bleu,pt	%xcc,	loop_2587
	umulcc	%i0,	0x0D4B,	%i6
loop_2586:
	fzeros	%f6
	andncc	%l3,	%o5,	%g7
loop_2587:
	fmovsne	%xcc,	%f11,	%f12
	fmovrslz	%l4,	%f25,	%f18
	umul	%g5,	%o7,	%g4
	mulscc	%g3,	%o3,	%g1
	fbo,a	%fcc2,	loop_2588
	std	%f28,	[%l7 + 0x10]
	brlez,a	%o0,	loop_2589
	sllx	%o6,	%i7,	%l1
loop_2588:
	fmovrdgez	%i4,	%f22,	%f22
	movl	%icc,	%g6,	%o4
loop_2589:
	subccc	%i5,	%l5,	%l2
	set	0x5C, %i2
	lduwa	[%l7 + %i2] 0x14,	%o1
	call	loop_2590
	nop
	setx	0xF7715D05B34F3E37,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0x5701C0B3929F4CF0,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	faddd	%f2,	%f2,	%f28
	fpack16	%f24,	%f13
	bshuffle	%f14,	%f22,	%f18
loop_2590:
	movneg	%xcc,	%o2,	%i1
	wr	%g0,	0x11,	%asi
	lduha	[%l7 + 0x6E] %asi,	%i2
	fble	%fcc2,	loop_2591
	tl	%icc,	0x3
	fmovdcc	%xcc,	%f18,	%f6
	set	0x42, %o6
	stha	%l6,	[%l7 + %o6] 0x81
loop_2591:
	ldsh	[%l7 + 0x18],	%l0
	sdiv	%i3,	0x1249,	%i0
	nop
	setx	0xF61FB113,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f26
	setx	0xED9D9CBF,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f0
	fsubs	%f0,	%f26,	%f28
	edge16l	%i6,	%g2,	%o5
	add	%g7,	%l3,	%g5
	fmovdn	%xcc,	%f10,	%f6
	addcc	%o7,	%g4,	%l4
	sth	%g3,	[%l7 + 0x10]
	orcc	%o3,	0x0AFC,	%o0
	array16	%g1,	%o6,	%l1
	tgu	%xcc,	0x5
	movrlez	%i7,	%g6,	%i4
	fmovrdgz	%o4,	%f8,	%f12
	brnz	%l5,	loop_2592
	mulscc	%i5,	%l2,	%o2
	bne,a,pn	%icc,	loop_2593
	subc	%i1,	%o1,	%i2
loop_2592:
	movvc	%icc,	%l6,	%i3
	edge8ln	%l0,	%i6,	%g2
loop_2593:
	ldx	[%l7 + 0x78],	%o5
	taddcctv	%g7,	%i0,	%g5
	sdivcc	%l3,	0x1E46,	%g4
	or	%o7,	0x1444,	%g3
	fmovrdgz	%o3,	%f14,	%f26
	orn	%l4,	%o0,	%o6
	stw	%g1,	[%l7 + 0x44]
	sllx	%l1,	0x19,	%g6
	mulx	%i4,	0x0C15,	%i7
	add	%l5,	0x1E8F,	%o4
	fabss	%f0,	%f22
	movrlez	%i5,	%l2,	%i1
	edge32ln	%o2,	%o1,	%l6
	edge16ln	%i2,	%i3,	%i6
	wr	%g0,	0xe3,	%asi
	stwa	%l0,	[%l7 + 0x3C] %asi
	membar	#Sync
	lduw	[%l7 + 0x60],	%g2
	sdivx	%g7,	0x0ACB,	%o5
	edge8	%i0,	%g5,	%g4
	fmovrdgez	%l3,	%f24,	%f6
	edge32n	%g3,	%o7,	%l4
	subcc	%o3,	0x09F7,	%o6
	fsrc1s	%f21,	%f14
	xorcc	%o0,	%l1,	%g6
	subcc	%i4,	0x0699,	%g1
	sdivx	%l5,	0x0111,	%i7
	ta	%icc,	0x0
	orcc	%o4,	0x0941,	%i5
	srlx	%l2,	%i1,	%o1
	orcc	%o2,	%i2,	%i3
	fcmpgt16	%f26,	%f18,	%l6
	sra	%i6,	%g2,	%l0
	tneg	%icc,	0x0
	umul	%o5,	0x1310,	%i0
	tl	%icc,	0x1
	move	%xcc,	%g7,	%g4
	movrgz	%g5,	0x0F3,	%l3
	fbn	%fcc0,	loop_2594
	fzero	%f8
	mova	%xcc,	%g3,	%o7
	add	%o3,	0x1D31,	%o6
loop_2594:
	or	%l4,	0x0BD6,	%l1
	call	loop_2595
	movg	%xcc,	%g6,	%o0
	fmovdgu	%xcc,	%f0,	%f18
	fmovs	%f13,	%f13
loop_2595:
	add	%i4,	%g1,	%i7
	orcc	%l5,	0x026F,	%i5
	add	%o4,	0x150E,	%i1
	bn,pn	%icc,	loop_2596
	sra	%l2,	0x17,	%o2
	wr	%g0,	0x0c,	%asi
	lduwa	[%l7 + 0x4C] %asi,	%i2
loop_2596:
	fnot1s	%f22,	%f5
	tne	%icc,	0x4
	fbule	%fcc1,	loop_2597
	addcc	%i3,	0x0C27,	%o1
	movvs	%xcc,	%i6,	%g2
	bcc,a	loop_2598
loop_2597:
	subccc	%l0,	0x1B68,	%l6
	orncc	%o5,	%i0,	%g4
	addcc	%g7,	0x0BDC,	%l3
loop_2598:
	movcc	%icc,	%g3,	%o7
	fnot1	%f30,	%f12
	bvs,pn	%xcc,	loop_2599
	fornot2	%f18,	%f24,	%f4
	andcc	%o3,	0x1A1D,	%g5
	brgez	%l4,	loop_2600
loop_2599:
	fbn,a	%fcc0,	loop_2601
	movpos	%icc,	%l1,	%o6
	addcc	%o0,	%i4,	%g6
loop_2600:
	movneg	%xcc,	%i7,	%g1
loop_2601:
	fmovrsgez	%i5,	%f25,	%f3
	andncc	%l5,	%o4,	%l2
	fbo	%fcc1,	loop_2602
	movvc	%xcc,	%i1,	%o2
	nop
	setx	0x1B414DDB90566CD4,	%l0,	%l6
	stx	%l6,	[%l7 + 0x78]
	ldx	[%l7 + 0x78],	%fsr
	tcc	%icc,	0x3
loop_2602:
	sub	%i3,	0x03DD,	%i2
	movre	%i6,	0x165,	%g2
	movleu	%icc,	%o1,	%l0
	sir	0x1AAA
	srax	%l6,	%i0,	%g4
	fmovdle	%icc,	%f12,	%f14
	te	%xcc,	0x6
	fbug	%fcc2,	loop_2603
	ble,a,pt	%icc,	loop_2604
	nop
	setx	0x29AB6BA560641F42,	%l0,	%l6
	stx	%l6,	[%l7 + 0x68]
	ldx	[%l7 + 0x68],	%fsr
	fsrc2	%f28,	%f12
loop_2603:
	fnands	%f9,	%f8,	%f15
loop_2604:
	tne	%xcc,	0x5
	sll	%o5,	%l3,	%g7
	xnor	%g3,	%o7,	%o3
	taddcctv	%g5,	%l1,	%o6
	fmovdg	%xcc,	%f24,	%f12
	fpsub16s	%f8,	%f3,	%f6
	edge32n	%l4,	%o0,	%g6
	sdiv	%i4,	0x030C,	%g1
	xnor	%i5,	0x1094,	%i7
	tl	%icc,	0x7
	fornot2s	%f31,	%f24,	%f17
	movvc	%xcc,	%l5,	%o4
	bl,pn	%xcc,	loop_2605
	brz	%i1,	loop_2606
	udivcc	%l2,	0x1625,	%i3
	movl	%xcc,	%i2,	%i6
loop_2605:
	orn	%o2,	%o1,	%g2
loop_2606:
	sdiv	%l6,	0x046D,	%i0
	movl	%xcc,	%l0,	%g4
	movn	%icc,	%o5,	%g7
	edge32	%g3,	%o7,	%l3
	movrlz	%g5,	%l1,	%o6
	nop
	setx	0xBC28E5A0,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f9
	setx	0xC7C18523,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f19
	fdivs	%f19,	%f9,	%f10
	udiv	%o3,	0x0D4B,	%o0
	edge8l	%l4,	%i4,	%g1
	set	0x0C, %l4
	swapa	[%l7 + %l4] 0x80,	%i5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x0C, %o2
	lduwa	[%l7 + %o2] 0x0c,	%i7
	wr	%g0,	0x88,	%asi
	lduwa	[%l7 + 0x28] %asi,	%g6
	faligndata	%f30,	%f30,	%f4
	fandnot2	%f10,	%f2,	%f14
	umul	%l5,	%o4,	%i1
	tsubcc	%l2,	%i2,	%i3
	movcc	%xcc,	%i6,	%o1
	movge	%xcc,	%o2,	%l6
	sub	%i0,	0x061A,	%l0
	tgu	%icc,	0x3
	tneg	%xcc,	0x0
	udiv	%g4,	0x1A9B,	%o5
	fnand	%f6,	%f0,	%f18
	mova	%xcc,	%g2,	%g3
	popc	%g7,	%o7
	sdivx	%g5,	0x1D79,	%l1
	udivcc	%l3,	0x13ED,	%o3
	brlz	%o6,	loop_2607
	umul	%o0,	0x0459,	%i4
	fpsub32s	%f26,	%f13,	%f26
	fmovdneg	%xcc,	%f3,	%f17
loop_2607:
	nop
	wr	%g0,	0x80,	%asi
	swapa	[%l7 + 0x34] %asi,	%g1
	tpos	%xcc,	0x3
	fnot2s	%f29,	%f22
	sllx	%l4,	%i5,	%i7
	smulcc	%g6,	0x034F,	%o4
	ld	[%l7 + 0x6C],	%f20
	orcc	%l5,	%i1,	%i2
	popc	0x1425,	%i3
	fsrc2s	%f31,	%f28
	tvc	%xcc,	0x3
	swap	[%l7 + 0x54],	%l2
	tvc	%xcc,	0x6
	edge32n	%o1,	%i6,	%l6
	movre	%o2,	0x19A,	%l0
	bcs,a	loop_2608
	movcs	%icc,	%i0,	%g4
	fbu,a	%fcc2,	loop_2609
	nop
	setx	0xD1492602,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f13
	setx	0x5466BB1C,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f9
	fsubs	%f9,	%f13,	%f10
loop_2608:
	movcc	%xcc,	%o5,	%g3
	alignaddrl	%g7,	%o7,	%g5
loop_2609:
	stbar
	ba,a,pt	%xcc,	loop_2610
	edge8l	%l1,	%l3,	%g2
	fbue	%fcc3,	loop_2611
	xnorcc	%o3,	0x1A53,	%o6
loop_2610:
	bg	loop_2612
	movne	%icc,	%i4,	%o0
loop_2611:
	fbuge	%fcc0,	loop_2613
	tvs	%xcc,	0x4
loop_2612:
	fbug	%fcc2,	loop_2614
	nop
	setx	0x1ACC5462DFD1AF36,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0xCCFB117BEFF701E1,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fdivd	%f0,	%f16,	%f24
loop_2613:
	addcc	%l4,	0x1B74,	%g1
	edge8ln	%i7,	%g6,	%i5
loop_2614:
	fmovdle	%xcc,	%f22,	%f13
	movneg	%xcc,	%l5,	%o4
	std	%f28,	[%l7 + 0x18]
	movne	%xcc,	%i1,	%i3
	fabsd	%f6,	%f2
	fmovsne	%icc,	%f4,	%f23
	fornot2s	%f15,	%f5,	%f29
	fmovd	%f0,	%f6
	move	%xcc,	%l2,	%i2
	movge	%icc,	%o1,	%l6
	fbe	%fcc3,	loop_2615
	movle	%icc,	%i6,	%l0
	movcc	%icc,	%o2,	%g4
	nop
	setx	0x192F99A7,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f9
	setx	0x30FDD28A,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f15
	fmuls	%f15,	%f9,	%f2
loop_2615:
	movgu	%xcc,	%o5,	%i0
	be,pt	%icc,	loop_2616
	edge32	%g7,	%o7,	%g5
	edge16l	%l1,	%l3,	%g3
	sllx	%g2,	0x1E,	%o3
loop_2616:
	tneg	%icc,	0x6
	fmovrse	%i4,	%f24,	%f29
	lduw	[%l7 + 0x64],	%o6
	brnz	%o0,	loop_2617
	bge,pn	%xcc,	loop_2618
	movrgz	%l4,	%g1,	%g6
	tcs	%xcc,	0x2
loop_2617:
	movne	%xcc,	%i7,	%l5
loop_2618:
	tleu	%xcc,	0x2
	array32	%i5,	%i1,	%o4
	array8	%i3,	%l2,	%o1
	ldub	[%l7 + 0x15],	%l6
	edge32l	%i6,	%i2,	%l0
	movpos	%icc,	%o2,	%g4
	set	0x18, %i7
	prefetcha	[%l7 + %i7] 0x88,	 0x1
	edge8l	%g7,	%o5,	%o7
	nop
	fitos	%f9,	%f10
	fstoi	%f10,	%f7
	udivcc	%g5,	0x0C49,	%l1
	bn,a,pn	%xcc,	loop_2619
	movrlz	%g3,	0x057,	%l3
	xnorcc	%g2,	%o3,	%i4
	edge16l	%o6,	%l4,	%o0
loop_2619:
	tcc	%xcc,	0x0
	movleu	%xcc,	%g6,	%i7
	ta	%icc,	0x4
	fzeros	%f27
	sll	%g1,	0x0A,	%i5
	bn	%xcc,	loop_2620
	andcc	%l5,	0x0545,	%i1
	xnor	%i3,	0x1A6E,	%l2
	orn	%o1,	0x11BD,	%o4
loop_2620:
	fmovspos	%icc,	%f22,	%f15
	tl	%icc,	0x4
	sdivcc	%i6,	0x10CA,	%l6
	bge,a	%icc,	loop_2621
	tn	%xcc,	0x1
	nop
	fitos	%f14,	%f26
	fstod	%f26,	%f30
	fmovdge	%xcc,	%f22,	%f17
loop_2621:
	edge16n	%l0,	%i2,	%o2
	bneg,pt	%xcc,	loop_2622
	nop
	setx	0x26A911CA,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f9
	setx	0x006E7C1E,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f18
	fmuls	%f18,	%f9,	%f31
	st	%f19,	[%l7 + 0x38]
	subcc	%i0,	0x0E9F,	%g4
loop_2622:
	brgz	%o5,	loop_2623
	sdiv	%g7,	0x0A1D,	%o7
	sdivx	%g5,	0x056B,	%l1
	tgu	%xcc,	0x4
loop_2623:
	fcmpeq16	%f10,	%f30,	%l3
	fbug	%fcc0,	loop_2624
	nop
	fitos	%f9,	%f14
	fstod	%f14,	%f10
	fcmpgt32	%f30,	%f22,	%g3
	set	0x5C, %g3
	lda	[%l7 + %g3] 0x11,	%f1
loop_2624:
	lduw	[%l7 + 0x60],	%g2
	stw	%o3,	[%l7 + 0x78]
	sdivcc	%i4,	0x1354,	%l4
	set	0x70, %i0
	lda	[%l7 + %i0] 0x0c,	%f18
	udivcc	%o0,	0x15CE,	%o6
	fbu	%fcc2,	loop_2625
	edge16l	%i7,	%g1,	%g6
	subccc	%l5,	%i1,	%i3
	movre	%l2,	0x210,	%o1
loop_2625:
	brz,a	%o4,	loop_2626
	be,a,pn	%icc,	loop_2627
	sub	%i5,	%l6,	%l0
	alignaddr	%i6,	%o2,	%i0
loop_2626:
	ld	[%l7 + 0x0C],	%f30
loop_2627:
	fbe	%fcc2,	loop_2628
	tg	%icc,	0x2
	tle	%icc,	0x1
	fxors	%f5,	%f31,	%f26
loop_2628:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdiv	%i2,	0x1567,	%o5
	sir	0x0F79
	tcc	%icc,	0x5
	fmovdl	%icc,	%f7,	%f10
	tn	%icc,	0x0
	nop
	setx loop_2629, %l0, %l1
	jmpl %l1, %g7
	udivcc	%o7,	0x1DA8,	%g5
	array8	%l1,	%l3,	%g3
	xnorcc	%g2,	0x18A4,	%o3
loop_2629:
	tg	%xcc,	0x5
	fpack16	%f26,	%f5
	ld	[%l7 + 0x0C],	%f5
	fbg	%fcc0,	loop_2630
	fbue,a	%fcc0,	loop_2631
	faligndata	%f0,	%f24,	%f16
	tpos	%xcc,	0x2
loop_2630:
	fbul	%fcc3,	loop_2632
loop_2631:
	tg	%xcc,	0x6
	edge8	%i4,	%g4,	%l4
	ldd	[%l7 + 0x38],	%f8
loop_2632:
	bvs,a	%xcc,	loop_2633
	tsubcc	%o6,	0x0623,	%i7
	fandnot1s	%f14,	%f13,	%f31
	tcc	%xcc,	0x2
loop_2633:
	fandnot1	%f12,	%f30,	%f26
	xor	%g1,	%g6,	%o0
	andn	%l5,	0x0E9C,	%i1
	ldsw	[%l7 + 0x5C],	%i3
	set	0x8, %o7
	stxa	%l2,	[%g0 + %o7] 0x21
	bn,pn	%icc,	loop_2634
	bpos,a	%icc,	loop_2635
	movgu	%icc,	%o4,	%o1
	edge16n	%i5,	%l0,	%i6
loop_2634:
	ldd	[%l7 + 0x78],	%i6
loop_2635:
	array8	%o2,	%i0,	%i2
	nop
	setx	0x028EEB48,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f8
	setx	0x3C7B0311,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f31
	fsubs	%f31,	%f8,	%f21
	alignaddrl	%o5,	%o7,	%g7
	andcc	%l1,	%l3,	%g5
	set	0x40, %o5
	stda	%f16,	[%l7 + %o5] 0x04
	stb	%g3,	[%l7 + 0x0F]
	umulcc	%g2,	0x03CE,	%o3
	movcc	%xcc,	%i4,	%l4
	tvc	%icc,	0x1
	edge32n	%o6,	%g4,	%g1
	edge32	%i7,	%o0,	%l5
	xnor	%g6,	%i3,	%i1
	fcmpgt32	%f14,	%f30,	%l2
	andn	%o1,	0x0370,	%i5
	fbge	%fcc1,	loop_2636
	ba,pt	%xcc,	loop_2637
	bneg	loop_2638
	brlez	%o4,	loop_2639
loop_2636:
	tpos	%xcc,	0x2
loop_2637:
	nop
	wr	%g0,	0x1f,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
loop_2638:
	bgu	loop_2640
loop_2639:
	movle	%icc,	%i6,	%l6
	bneg,pt	%xcc,	loop_2641
	movcs	%xcc,	%l0,	%i0
loop_2640:
	nop
	fitod	%f4,	%f28
	fdtox	%f28,	%f4
	bg,pn	%xcc,	loop_2642
loop_2641:
	edge32l	%o2,	%o5,	%i2
	xor	%o7,	0x0CDD,	%l1
	edge32	%l3,	%g5,	%g3
loop_2642:
	brnz	%g7,	loop_2643
	xnorcc	%o3,	%i4,	%g2
	addccc	%l4,	0x0611,	%o6
	prefetch	[%l7 + 0x3C],	 0x2
loop_2643:
	subc	%g1,	0x1F19,	%i7
	addccc	%g4,	%o0,	%l5
	bvc	%xcc,	loop_2644
	movn	%icc,	%i3,	%i1
	set	0x6C, %o1
	stha	%l2,	[%l7 + %o1] 0x11
loop_2644:
	udivx	%o1,	0x0DEF,	%g6
	edge32ln	%i5,	%o4,	%l6
	sth	%l0,	[%l7 + 0x76]
	brlez,a	%i6,	loop_2645
	pdist	%f8,	%f12,	%f28
	tvc	%xcc,	0x0
	movrlez	%o2,	0x1E2,	%o5
loop_2645:
	movrgez	%i0,	0x351,	%o7
	edge32	%i2,	%l1,	%g5
	te	%icc,	0x3
	xnorcc	%g3,	%l3,	%o3
	brz	%i4,	loop_2646
	tsubcc	%g2,	0x0CF2,	%g7
	ta	%icc,	0x4
	nop
	fitos	%f1,	%f22
loop_2646:
	movle	%xcc,	%o6,	%l4
	edge32n	%g1,	%i7,	%o0
	membar	0x01
	srax	%l5,	%i3,	%i1
	movcc	%xcc,	%l2,	%g4
	subccc	%g6,	0x07FB,	%o1
	mova	%xcc,	%i5,	%o4
	alignaddr	%l0,	%l6,	%i6
	edge8n	%o5,	%o2,	%i0
	movgu	%icc,	%i2,	%o7
	wr	%g0,	0x80,	%asi
	ldsba	[%l7 + 0x41] %asi,	%l1
	edge32n	%g3,	%g5,	%o3
	fba	%fcc3,	loop_2647
	fmovrdgz	%l3,	%f22,	%f28
	taddcc	%g2,	0x1ABC,	%g7
	fmovspos	%xcc,	%f25,	%f27
loop_2647:
	fnegd	%f22,	%f0
	movre	%i4,	%l4,	%o6
	bn,a,pn	%icc,	loop_2648
	edge8	%i7,	%o0,	%l5
	smulcc	%g1,	0x1282,	%i3
	fble,a	%fcc2,	loop_2649
loop_2648:
	tl	%xcc,	0x6
	edge16n	%l2,	%i1,	%g6
	movle	%xcc,	%g4,	%o1
loop_2649:
	brlz	%o4,	loop_2650
	tvs	%icc,	0x0
	fbul	%fcc2,	loop_2651
	fmovdvs	%icc,	%f15,	%f9
loop_2650:
	bne,a,pn	%icc,	loop_2652
	movcs	%xcc,	%i5,	%l0
loop_2651:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sethi	0x0EEF,	%l6
loop_2652:
	fbug	%fcc3,	loop_2653
	fmovsleu	%icc,	%f18,	%f15
	fnot2	%f22,	%f26
	ld	[%l7 + 0x6C],	%f11
loop_2653:
	array32	%o5,	%o2,	%i0
	movvc	%icc,	%i6,	%o7
	tcs	%icc,	0x3
	umulcc	%i2,	0x08D0,	%g3
	or	%g5,	0x18DE,	%l1
	tvs	%icc,	0x1
	membar	0x6D
	bl,a,pt	%xcc,	loop_2654
	tpos	%xcc,	0x3
	set	0x4E, %g6
	ldsha	[%l7 + %g6] 0x81,	%l3
loop_2654:
	edge16ln	%g2,	%o3,	%g7
	ldub	[%l7 + 0x29],	%i4
	umulcc	%o6,	0x1E9C,	%l4
	nop
	setx loop_2655, %l0, %l1
	jmpl %l1, %i7
	tcc	%xcc,	0x7
	nop
	setx	0x3BA29E43D043EA03,	%l0,	%l6
	stx	%l6,	[%l7 + 0x50]
	ldx	[%l7 + 0x50],	%fsr
	smulcc	%o0,	0x06A1,	%g1
loop_2655:
	taddcctv	%i3,	%l5,	%l2
	fcmple16	%f0,	%f30,	%g6
	movrne	%i1,	0x32D,	%o1
	edge8n	%g4,	%i5,	%l0
	umulcc	%o4,	0x0930,	%l6
	tneg	%icc,	0x2
	tl	%xcc,	0x4
	fmovdn	%icc,	%f26,	%f10
	fbg	%fcc2,	loop_2656
	tleu	%xcc,	0x4
	smul	%o5,	%o2,	%i0
	movle	%icc,	%o7,	%i6
loop_2656:
	stbar
	bn,a	loop_2657
	movgu	%icc,	%i2,	%g5
	subcc	%g3,	%l1,	%g2
	sdivx	%l3,	0x012B,	%g7
loop_2657:
	udivx	%i4,	0x122A,	%o6
	smul	%o3,	0x067F,	%l4
	edge8ln	%i7,	%g1,	%i3
	xor	%o0,	0x00E1,	%l5
	fbul	%fcc2,	loop_2658
	fmovdge	%xcc,	%f13,	%f31
	edge8ln	%l2,	%i1,	%g6
	bne,pt	%icc,	loop_2659
loop_2658:
	bneg	%icc,	loop_2660
	te	%xcc,	0x6
	movl	%xcc,	%o1,	%g4
loop_2659:
	andn	%i5,	%o4,	%l6
loop_2660:
	and	%l0,	%o2,	%o5
	lduh	[%l7 + 0x64],	%o7
	tpos	%icc,	0x0
	movrlz	%i6,	0x01E,	%i0
	mulscc	%i2,	0x0B8D,	%g5
	brgz	%g3,	loop_2661
	movvc	%icc,	%l1,	%g2
	fmovdcc	%icc,	%f31,	%f30
	tne	%icc,	0x5
loop_2661:
	move	%icc,	%g7,	%l3
	mova	%xcc,	%i4,	%o6
	tge	%icc,	0x6
	bpos,a	%icc,	loop_2662
	tl	%xcc,	0x2
	fbo	%fcc1,	loop_2663
	ba,pn	%xcc,	loop_2664
loop_2662:
	st	%f24,	[%l7 + 0x10]
	fbg	%fcc2,	loop_2665
loop_2663:
	add	%o3,	0x0F10,	%l4
loop_2664:
	edge32ln	%g1,	%i3,	%o0
	movrgez	%i7,	0x39F,	%l2
loop_2665:
	ba	%xcc,	loop_2666
	edge32l	%i1,	%g6,	%l5
	move	%icc,	%g4,	%i5
	movneg	%xcc,	%o1,	%o4
loop_2666:
	array8	%l6,	%o2,	%o5
	sdivx	%l0,	0x0AE4,	%i6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movle	%icc,	%o7,	%i2
	sdivx	%i0,	0x17F5,	%g5
	sll	%g3,	%l1,	%g2
	addcc	%g7,	%i4,	%o6
	smul	%o3,	0x1AFF,	%l3
	add	%l7,	0x10,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%g1
	casxa	[%l6] %asi,	%g1,	%l4
	edge8n	%o0,	%i3,	%l2
	srl	%i1,	0x0E,	%g6
	fbue,a	%fcc3,	loop_2667
	brz,a	%l5,	loop_2668
	subccc	%i7,	%g4,	%i5
	srlx	%o1,	%l6,	%o4
loop_2667:
	edge8	%o2,	%l0,	%i6
loop_2668:
	movrlz	%o5,	%o7,	%i2
	tn	%xcc,	0x3
	tpos	%xcc,	0x4
	edge16l	%i0,	%g3,	%l1
	brgez,a	%g5,	loop_2669
	tg	%icc,	0x5
	alignaddrl	%g7,	%i4,	%o6
	tcs	%icc,	0x2
loop_2669:
	nop
	wr	%g0,	0x10,	%asi
	prefetcha	[%l7 + 0x30] %asi,	 0x3
	nop
	set	0x66, %l2
	sth	%l3,	[%l7 + %l2]
	movl	%icc,	%o3,	%l4
	fmovdcc	%icc,	%f3,	%f2
	andcc	%g1,	%i3,	%l2
	bge,pt	%icc,	loop_2670
	tneg	%icc,	0x6
	fmul8sux16	%f8,	%f2,	%f8
	tsubcc	%i1,	%g6,	%l5
loop_2670:
	tvs	%xcc,	0x5
	smulcc	%i7,	%g4,	%o0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fandnot2s	%f29,	%f27,	%f22
	te	%xcc,	0x4
	add	%l7,	0x20,	%l6
	wr	%g0,	0x11,	%asi
	lda	[%l6] %asi,	%o1
	casa	[%l6] %asi,	%o1,	%i5
	movvc	%icc,	%l6,	%o4
	tge	%icc,	0x3
	edge32l	%l0,	%i6,	%o2
	movleu	%icc,	%o7,	%o5
	smul	%i0,	0x047B,	%i2
	movrlez	%l1,	0x0E9,	%g5
	fbg,a	%fcc3,	loop_2671
	fmul8x16al	%f1,	%f21,	%f28
	fcmpne16	%f10,	%f8,	%g3
	udivx	%g7,	0x0317,	%o6
loop_2671:
	movcc	%xcc,	%i4,	%l3
	fzero	%f18
	fpackfix	%f14,	%f12
	fandnot2	%f8,	%f30,	%f28
	tcs	%xcc,	0x7
	subc	%o3,	0x153D,	%l4
	subccc	%g1,	%i3,	%g2
	movvc	%icc,	%l2,	%i1
	umulcc	%g6,	0x06DE,	%l5
	bgu	loop_2672
	fbl,a	%fcc3,	loop_2673
	bge,a	loop_2674
	edge8	%i7,	%o0,	%o1
loop_2672:
	subc	%g4,	0x163E,	%l6
loop_2673:
	nop
	fitod	%f6,	%f14
	fdtox	%f14,	%f10
	fxtod	%f10,	%f10
loop_2674:
	fpsub16s	%f5,	%f29,	%f22
	fmovdvc	%icc,	%f9,	%f8
	movle	%icc,	%i5,	%l0
	fbue	%fcc0,	loop_2675
	ta	%xcc,	0x7
	add	%l7,	0x28,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%o4
	casxa	[%l6] %asi,	%o4,	%o2
loop_2675:
	fmovsne	%xcc,	%f30,	%f7
	brz,a	%i6,	loop_2676
	sethi	0x0CD9,	%o5
	nop
	setx	0x415730C4,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f22
	setx	0x38A7514A,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f17
	fsubs	%f17,	%f22,	%f3
	movrgez	%o7,	0x1FE,	%i0
loop_2676:
	xnor	%i2,	%l1,	%g5
	ldstub	[%l7 + 0x1B],	%g7
	movrgez	%o6,	%i4,	%l3
	movne	%icc,	%o3,	%l4
	bn,a,pn	%icc,	loop_2677
	andcc	%g3,	%g1,	%g2
	movn	%icc,	%l2,	%i1
	fbo,a	%fcc1,	loop_2678
loop_2677:
	tpos	%xcc,	0x6
	udivx	%g6,	0x0047,	%l5
	fabsd	%f30,	%f14
loop_2678:
	membar	0x3C
	srl	%i7,	%i3,	%o0
	fornot1	%f0,	%f22,	%f24
	tgu	%xcc,	0x3
	udivcc	%o1,	0x014B,	%g4
	array8	%i5,	%l6,	%o4
	array32	%l0,	%i6,	%o5
	edge32l	%o2,	%i0,	%i2
	fsrc1	%f26,	%f18
	fbl	%fcc1,	loop_2679
	edge32l	%o7,	%l1,	%g5
	bshuffle	%f10,	%f22,	%f24
	movg	%xcc,	%g7,	%i4
loop_2679:
	fandnot2s	%f4,	%f30,	%f21
	taddcctv	%o6,	%o3,	%l4
	set	0x7C, %i1
	lduha	[%l7 + %i1] 0x89,	%l3
	movneg	%xcc,	%g3,	%g1
	fbu	%fcc0,	loop_2680
	movg	%icc,	%l2,	%i1
	sllx	%g2,	0x1E,	%g6
	xorcc	%l5,	%i3,	%i7
loop_2680:
	fmovsg	%icc,	%f21,	%f28
	udivcc	%o1,	0x0CC0,	%g4
	add	%o0,	%i5,	%o4
	orn	%l0,	%l6,	%i6
	fcmpgt16	%f20,	%f6,	%o5
	edge8ln	%i0,	%o2,	%o7
	tcs	%icc,	0x4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sllx	%i2,	%l1,	%g7
	nop
	set	0x1D, %o3
	ldsb	[%l7 + %o3],	%i4
	fpadd32	%f8,	%f0,	%f22
	stb	%g5,	[%l7 + 0x24]
	sllx	%o6,	0x14,	%o3
	sub	%l3,	0x0BD8,	%g3
	srlx	%l4,	%l2,	%i1
	sir	0x1821
	tg	%xcc,	0x5
	fcmpgt32	%f20,	%f22,	%g2
	fmovdn	%icc,	%f12,	%f30
	tn	%xcc,	0x3
	srlx	%g1,	%l5,	%i3
	tne	%xcc,	0x0
	tvc	%icc,	0x4
	nop
	setx	0xA50E1F09,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f9
	setx	0xF2EA306E,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f2
	fmuls	%f2,	%f9,	%f20
	subc	%i7,	%o1,	%g4
	nop
	setx	loop_2681,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	orncc	%o0,	0x1893,	%g6
	fpsub16	%f2,	%f8,	%f20
	ta	%icc,	0x3
loop_2681:
	nop
	wr	%g0,	0x81,	%asi
	ldxa	[%l7 + 0x38] %asi,	%o4
	set	0x7C, %i6
	sta	%f14,	[%l7 + %i6] 0x10
	edge8l	%i5,	%l6,	%i6
	fmovdvs	%xcc,	%f27,	%f21
	sth	%o5,	[%l7 + 0x40]
	movrlez	%i0,	0x00C,	%l0
	movge	%xcc,	%o7,	%o2
	edge32ln	%i2,	%l1,	%g7
	fabss	%f9,	%f21
	fba	%fcc2,	loop_2682
	fnor	%f28,	%f20,	%f16
	ld	[%l7 + 0x7C],	%f10
	fmul8x16	%f24,	%f10,	%f18
loop_2682:
	stbar
	lduw	[%l7 + 0x08],	%g5
	sra	%o6,	0x1C,	%i4
	orncc	%l3,	%o3,	%g3
	addccc	%l2,	0x0C23,	%i1
	srax	%l4,	0x02,	%g2
	movvs	%icc,	%l5,	%g1
	tle	%icc,	0x2
	alignaddrl	%i3,	%o1,	%i7
	tl	%xcc,	0x2
	fbul,a	%fcc1,	loop_2683
	popc	0x1778,	%o0
	srl	%g4,	0x19,	%g6
	srlx	%o4,	%i5,	%i6
loop_2683:
	nop
	setx	0xE0499C51,	%l0,	%l6
	st	%l6,	[%l7 + 0x44]
	ld	[%l7 + 0x44],	%fsr
	subccc	%l6,	%o5,	%l0
	mulx	%o7,	%i0,	%o2
	tneg	%xcc,	0x2
	bvs,a	%xcc,	loop_2684
	st	%f7,	[%l7 + 0x54]
	bshuffle	%f0,	%f26,	%f22
	tge	%icc,	0x7
loop_2684:
	fabsd	%f20,	%f22
	ldsw	[%l7 + 0x3C],	%l1
	fmovs	%f29,	%f24
	edge16n	%g7,	%g5,	%o6
	stw	%i2,	[%l7 + 0x74]
	sll	%l3,	%o3,	%i4
	tneg	%icc,	0x7
	movleu	%icc,	%g3,	%l2
	bvc,a,pn	%xcc,	loop_2685
	smul	%i1,	0x1AB9,	%l4
	mulx	%l5,	%g2,	%g1
	bl,a	%icc,	loop_2686
loop_2685:
	fcmpeq32	%f24,	%f20,	%i3
	array8	%i7,	%o0,	%g4
	fcmple16	%f24,	%f18,	%o1
loop_2686:
	nop
	wr	%g0,	0x11,	%asi
	lduha	[%l7 + 0x14] %asi,	%o4
	smulcc	%g6,	0x19CB,	%i5
	fmovrse	%l6,	%f17,	%f18
	andncc	%i6,	%l0,	%o7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tpos	%xcc,	0x6
	mova	%icc,	%o5,	%o2
	alignaddr	%l1,	%g7,	%i0
	sdivx	%o6,	0x0B20,	%g5
	sub	%i2,	0x0C15,	%l3
	orncc	%i4,	%o3,	%g3
	fcmpeq16	%f0,	%f8,	%l2
	movneg	%xcc,	%i1,	%l4
	sra	%l5,	0x0F,	%g2
	tl	%icc,	0x7
	wr	%g0,	0x89,	%asi
	ldsha	[%l7 + 0x52] %asi,	%i3
	subc	%i7,	%o0,	%g4
	ldsw	[%l7 + 0x40],	%o1
	array16	%g1,	%o4,	%g6
	movpos	%icc,	%i5,	%i6
	mulscc	%l0,	%o7,	%l6
	udivx	%o2,	0x1D5D,	%o5
	addccc	%g7,	0x056D,	%l1
	fbug,a	%fcc3,	loop_2687
	edge16n	%i0,	%g5,	%o6
	andn	%l3,	0x1FAF,	%i2
	st	%f3,	[%l7 + 0x10]
loop_2687:
	sllx	%o3,	0x13,	%i4
	prefetch	[%l7 + 0x7C],	 0x3
	addcc	%l2,	%g3,	%l4
	xnor	%i1,	0x1063,	%l5
	movn	%xcc,	%i3,	%i7
	brz	%g2,	loop_2688
	array16	%o0,	%g4,	%g1
	fmovrdgez	%o4,	%f18,	%f22
	sra	%g6,	%i5,	%i6
loop_2688:
	fbul	%fcc1,	loop_2689
	fmovsne	%icc,	%f4,	%f20
	nop
	setx loop_2690, %l0, %l1
	jmpl %l1, %o1
	movgu	%icc,	%l0,	%o7
loop_2689:
	nop
	wr	%g0,	0xe3,	%asi
	ldda	[%l7 + 0x50] %asi,	%i6
loop_2690:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	move	%icc,	%o5,	%o2
	nop
	setx loop_2691, %l0, %l1
	jmpl %l1, %l1
	fzeros	%f4
	fbo,a	%fcc3,	loop_2692
	sllx	%g7,	%g5,	%o6
loop_2691:
	fmovde	%xcc,	%f11,	%f31
	ble,pn	%icc,	loop_2693
loop_2692:
	edge8	%i0,	%l3,	%i2
	swap	[%l7 + 0x44],	%o3
	fmovdn	%icc,	%f6,	%f16
loop_2693:
	fblg	%fcc2,	loop_2694
	fnot1s	%f13,	%f2
	fmovrsne	%i4,	%f5,	%f29
	mulx	%g3,	0x022E,	%l4
loop_2694:
	fandnot1	%f4,	%f28,	%f30
	wr	%g0,	0x04,	%asi
	lduha	[%l7 + 0x40] %asi,	%l2
	nop
	setx	0xE99FF792A9A9F4CA,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0xC6E89564D5BB7CB4,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	fmuld	%f6,	%f30,	%f26
	edge8	%l5,	%i3,	%i1
	alignaddrl	%i7,	%g2,	%g4
	bn,a,pt	%icc,	loop_2695
	fornot2	%f6,	%f18,	%f24
	sethi	0x167C,	%o0
	fbge,a	%fcc0,	loop_2696
loop_2695:
	array16	%o4,	%g1,	%i5
	popc	%i6,	%g6
	alignaddr	%l0,	%o1,	%l6
loop_2696:
	smul	%o7,	0x1829,	%o5
	set	0x0C, %g1
	stwa	%l1,	[%l7 + %g1] 0x80
	wr	%g0,	0x10,	%asi
	ldstuba	[%l7 + 0x3D] %asi,	%o2
	nop
	fitos	%f9,	%f21
	fstox	%f21,	%f22
	movcs	%xcc,	%g7,	%o6
	srl	%i0,	0x12,	%l3
	andncc	%g5,	%i2,	%o3
	andcc	%i4,	0x1DA2,	%l4
	movpos	%icc,	%l2,	%l5
	lduw	[%l7 + 0x1C],	%i3
	set	0x56, %i4
	stha	%i1,	[%l7 + %i4] 0x10
	fandnot2	%f28,	%f14,	%f16
	tl	%icc,	0x7
	fmovscs	%icc,	%f3,	%f28
	te	%xcc,	0x7
	set	0x10, %l6
	ldda	[%l7 + %l6] 0x18,	%g2
	movrlez	%g2,	0x0C3,	%i7
	tgu	%xcc,	0x0
	sra	%o0,	0x18,	%o4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbug,a	%fcc3,	loop_2697
	stw	%g4,	[%l7 + 0x70]
	orn	%i5,	0x0C86,	%g1
	brnz	%i6,	loop_2698
loop_2697:
	sir	0x02E5
	nop
	setx	0xF0027022,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f7
	setx	0x5E4774C6,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f15
	fadds	%f15,	%f7,	%f22
	tpos	%xcc,	0x3
loop_2698:
	umul	%g6,	0x0D5C,	%o1
	fnot1	%f28,	%f10
	add	%l6,	0x19DE,	%o7
	fmul8sux16	%f16,	%f0,	%f2
	set	0x44, %o0
	lduwa	[%l7 + %o0] 0x18,	%o5
	tcs	%icc,	0x6
	array8	%l0,	%o2,	%g7
	mova	%xcc,	%l1,	%o6
	add	%l7,	0x14,	%l6
	wr	%g0,	0x11,	%asi
	casa	[%l6] %asi,	%l3,	%i0
	edge16n	%g5,	%i2,	%i4
	nop
	setx	0x3EA03F62,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f18
	setx	0x07247928,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f29
	fadds	%f29,	%f18,	%f8
	wr	%g0,	0x04,	%asi
	sta	%f23,	[%l7 + 0x44] %asi
	bneg,a	%xcc,	loop_2699
	movge	%icc,	%o3,	%l2
	popc	0x0C78,	%l5
	edge8n	%i3,	%l4,	%g3
loop_2699:
	sdivcc	%g2,	0x1D7E,	%i1
	edge32n	%o0,	%i7,	%g4
	std	%f0,	[%l7 + 0x28]
	movrlez	%i5,	0x2DA,	%o4
	subc	%g1,	%i6,	%o1
	fbne,a	%fcc3,	loop_2700
	fmovrsgez	%l6,	%f13,	%f30
	movvs	%icc,	%g6,	%o5
	set	0x55, %g2
	stba	%l0,	[%l7 + %g2] 0x89
loop_2700:
	fmovrsgz	%o2,	%f30,	%f25
	membar	0x1A
	tleu	%icc,	0x0
	nop
	setx	0x40705EBF,	%l0,	%l6
	st	%l6,	[%l7 + 0x64]
	ld	[%l7 + 0x64],	%fsr
	fand	%f4,	%f12,	%f2
	tsubcctv	%g7,	%o7,	%o6
	fandnot1	%f6,	%f6,	%f6
	orcc	%l1,	0x1AD5,	%i0
	fmuld8ulx16	%f0,	%f8,	%f22
	edge8l	%g5,	%i2,	%i4
	nop
	fitos	%f13,	%f29
	fstod	%f29,	%f30
	fcmpne32	%f30,	%f6,	%l3
	bleu,a,pt	%icc,	loop_2701
	ta	%xcc,	0x4
	ble,pt	%icc,	loop_2702
	ldd	[%l7 + 0x28],	%f30
loop_2701:
	edge16n	%o3,	%l2,	%l5
	movcs	%xcc,	%i3,	%g3
loop_2702:
	fxnors	%f2,	%f9,	%f22
	movcs	%icc,	%l4,	%i1
	movcs	%xcc,	%o0,	%i7
	movne	%icc,	%g4,	%i5
	mulx	%o4,	0x1709,	%g2
	bg,a,pn	%icc,	loop_2703
	flush	%l7 + 0x08
	bn,pn	%xcc,	loop_2704
	nop
	fitod	%f1,	%f30
loop_2703:
	tl	%icc,	0x3
	sdiv	%g1,	0x0B48,	%o1
loop_2704:
	stbar
	movle	%xcc,	%l6,	%g6
	andn	%o5,	%i6,	%l0
	edge16ln	%o2,	%g7,	%o7
	udivx	%o6,	0x115E,	%i0
	bshuffle	%f16,	%f24,	%f2
	popc	0x16CD,	%g5
	fmovsl	%icc,	%f26,	%f9
	fmovdge	%icc,	%f9,	%f0
	bvc,a	%xcc,	loop_2705
	ldx	[%l7 + 0x18],	%i2
	nop
	setx	0x70533655,	%l0,	%l6
	st	%l6,	[%l7 + 0x5C]
	ld	[%l7 + 0x5C],	%fsr
	tsubcc	%i4,	0x12DD,	%l1
loop_2705:
	te	%icc,	0x6
	set	0x2E, %g5
	stha	%o3,	[%l7 + %g5] 0x19
	srlx	%l3,	0x02,	%l2
	tsubcc	%l5,	%g3,	%l4
	srl	%i1,	0x0C,	%o0
	taddcc	%i3,	0x19DD,	%g4
	edge8ln	%i7,	%o4,	%g2
	tsubcc	%g1,	%i5,	%l6
	edge16n	%o1,	%o5,	%g6
	bge,pn	%icc,	loop_2706
	orncc	%i6,	%o2,	%g7
	addc	%o7,	0x0CF5,	%o6
	st	%f18,	[%l7 + 0x64]
loop_2706:
	fmovrsgez	%i0,	%f12,	%f25
	array32	%g5,	%i2,	%i4
	set	0x7C, %l5
	lda	[%l7 + %l5] 0x10,	%f26
	fbule,a	%fcc2,	loop_2707
	sub	%l0,	0x1697,	%l1
	bcc,pt	%icc,	loop_2708
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2707:
	fxors	%f13,	%f9,	%f30
	tn	%xcc,	0x5
loop_2708:
	sdiv	%o3,	0x0DF3,	%l3
	addcc	%l5,	%g3,	%l4
	set	0x78, %i5
	stwa	%i1,	[%l7 + %i5] 0x04
	sra	%o0,	%l2,	%g4
	addccc	%i3,	0x0663,	%o4
	set	0x00, %o4
	ldxa	[%g0 + %o4] 0x50,	%g2
	edge16l	%g1,	%i5,	%l6
	tne	%icc,	0x2
	smul	%i7,	0x150A,	%o5
	nop
	fitos	%f1,	%f20
	fstod	%f20,	%f26
	mova	%icc,	%o1,	%i6
	sll	%g6,	%g7,	%o2
	bn,a	%icc,	loop_2709
	srl	%o7,	%i0,	%g5
	movre	%o6,	0x05C,	%i2
	tsubcc	%l0,	0x1F5C,	%i4
loop_2709:
	or	%l1,	0x09ED,	%l3
	fmovrslez	%l5,	%f0,	%f14
	sir	0x0A83
	tsubcctv	%o3,	%l4,	%g3
	lduh	[%l7 + 0x10],	%i1
	bgu,a,pt	%xcc,	loop_2710
	xnor	%o0,	%l2,	%g4
	fnors	%f15,	%f2,	%f29
	fmul8x16al	%f9,	%f11,	%f14
loop_2710:
	xnor	%i3,	0x0453,	%g2
	edge32l	%o4,	%i5,	%l6
	fbule,a	%fcc1,	loop_2711
	sth	%i7,	[%l7 + 0x74]
	te	%xcc,	0x7
	edge8l	%g1,	%o5,	%o1
loop_2711:
	smulcc	%i6,	0x1F2E,	%g7
	edge32l	%g6,	%o7,	%i0
	move	%xcc,	%o2,	%g5
	movg	%xcc,	%i2,	%l0
	mulx	%o6,	%i4,	%l3
	movvs	%icc,	%l1,	%l5
	nop
	set	0x78, %l3
	ldsh	[%l7 + %l3],	%o3
	array16	%g3,	%i1,	%l4
	fmovrslez	%l2,	%f13,	%f5
	fmovda	%icc,	%f24,	%f1
	taddcc	%g4,	0x0096,	%i3
	ldd	[%l7 + 0x28],	%g2
	taddcctv	%o4,	%o0,	%i5
	subcc	%l6,	0x1F02,	%i7
	movrgez	%g1,	%o5,	%o1
	srl	%g7,	%i6,	%g6
	fzeros	%f13
	wr	%g0,	0x89,	%asi
	ldsha	[%l7 + 0x3A] %asi,	%i0
	fnor	%f4,	%f12,	%f30
	fabsd	%f30,	%f14
	edge8	%o7,	%g5,	%o2
	movl	%icc,	%i2,	%o6
	fmovrdgez	%i4,	%f24,	%f10
	taddcc	%l0,	0x0388,	%l1
	lduh	[%l7 + 0x34],	%l5
	tpos	%xcc,	0x4
	fcmple16	%f8,	%f28,	%o3
	andncc	%l3,	%i1,	%g3
	fmovscc	%icc,	%f8,	%f26
	fbuge,a	%fcc3,	loop_2712
	nop
	set	0x58, %i3
	lduw	[%l7 + %i3],	%l4
	tleu	%icc,	0x2
	fmovdn	%icc,	%f2,	%f11
loop_2712:
	nop
	set	0x24, %g4
	swapa	[%l7 + %g4] 0x89,	%g4
	sll	%i3,	0x17,	%g2
	movrlez	%l2,	0x1A3,	%o0
	edge32ln	%o4,	%i5,	%i7
	sllx	%g1,	%o5,	%l6
	sdivx	%g7,	0x1FF0,	%i6
	tvc	%icc,	0x1
	tcs	%icc,	0x3
	movrlez	%o1,	0x2FF,	%g6
	fbg	%fcc1,	loop_2713
	nop
	setx	loop_2714,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tge	%icc,	0x5
	set	0x40, %g7
	ldda	[%l7 + %g7] 0x81,	%f16
loop_2713:
	fpack32	%f26,	%f8,	%f30
loop_2714:
	nop
	wr	%g0,	0x89,	%asi
	lduba	[%l7 + 0x63] %asi,	%i0
	sdivcc	%o7,	0x1FB2,	%g5
	sub	%o2,	%o6,	%i4
	udivx	%i2,	0x06DC,	%l0
	movg	%icc,	%l1,	%l5
	fcmpeq32	%f12,	%f4,	%o3
	edge8l	%i1,	%l3,	%g3
	movrne	%l4,	0x2CB,	%i3
	fcmpeq32	%f8,	%f18,	%g4
	flush	%l7 + 0x30
	edge8n	%g2,	%l2,	%o4
	sdivcc	%i5,	0x18B8,	%i7
	taddcctv	%g1,	%o0,	%l6
	fmovscc	%xcc,	%f18,	%f23
	smul	%o5,	0x0AA5,	%g7
	sir	0x1057
	fmovsn	%xcc,	%f17,	%f17
	array16	%o1,	%g6,	%i0
	fmovsg	%xcc,	%f29,	%f5
	ta	%xcc,	0x2
	nop
	setx	0xC601D6B4,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f15
	fsqrts	%f15,	%f1
	alignaddr	%o7,	%g5,	%o2
	movleu	%icc,	%i6,	%o6
	wr	%g0,	0x04,	%asi
	ldda	[%l7 + 0x60] %asi,	%i2
	sra	%i4,	0x0C,	%l0
	taddcc	%l5,	0x0A55,	%o3
	fmovrde	%l1,	%f18,	%f30
	addcc	%l3,	0x0816,	%g3
	ldsh	[%l7 + 0x1C],	%i1
	array16	%l4,	%g4,	%g2
	tl	%icc,	0x4
	sra	%i3,	%l2,	%i5
	tsubcctv	%i7,	%g1,	%o4
	sllx	%l6,	0x15,	%o0
	srax	%o5,	0x19,	%g7
	set	0x16, %l0
	lduha	[%l7 + %l0] 0x11,	%o1
	fblg,a	%fcc1,	loop_2715
	lduw	[%l7 + 0x50],	%g6
	membar	0x73
	set	0x24, %i2
	stwa	%o7,	[%l7 + %i2] 0x14
loop_2715:
	nop
	setx	0xC99663E7,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f14
	setx	0x09A7B01C,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f7
	fdivs	%f7,	%f14,	%f17
	movleu	%xcc,	%g5,	%i0
	set	0x5C, %o6
	lduba	[%l7 + %o6] 0x15,	%o2
	umul	%i6,	%o6,	%i4
	wr	%g0,	0x80,	%asi
	stha	%i2,	[%l7 + 0x36] %asi
	and	%l0,	%l5,	%l1
	subcc	%l3,	%o3,	%i1
	sllx	%g3,	0x13,	%l4
	fsrc2	%f26,	%f10
	fmovde	%xcc,	%f23,	%f20
	alignaddrl	%g2,	%i3,	%g4
	array8	%i5,	%l2,	%i7
	fmul8x16	%f23,	%f26,	%f10
	movcc	%icc,	%g1,	%l6
	fbn,a	%fcc2,	loop_2716
	add	%o0,	%o5,	%g7
	ldub	[%l7 + 0x5E],	%o4
	fbne,a	%fcc1,	loop_2717
loop_2716:
	alignaddr	%o1,	%o7,	%g6
	brz	%g5,	loop_2718
	fxnors	%f10,	%f14,	%f23
loop_2717:
	edge16l	%i0,	%i6,	%o2
	fmul8x16	%f0,	%f26,	%f16
loop_2718:
	fmovsl	%icc,	%f10,	%f21
	wr	%g0,	0x89,	%asi
	ldsha	[%l7 + 0x64] %asi,	%o6
	tn	%icc,	0x4
	be,a,pn	%xcc,	loop_2719
	edge8	%i2,	%l0,	%i4
	xnor	%l1,	%l3,	%o3
	sub	%i1,	0x0EFF,	%l5
loop_2719:
	fmul8x16	%f7,	%f28,	%f8
	fornot2	%f14,	%f14,	%f26
	srax	%l4,	0x04,	%g2
	subccc	%g3,	0x0EF3,	%i3
	sub	%g4,	0x020E,	%l2
	nop
	fitos	%f5,	%f31
	fstod	%f31,	%f18
	brlez,a	%i7,	loop_2720
	nop
	fitos	%f0,	%f12
	fstoi	%f12,	%f4
	edge32	%i5,	%g1,	%l6
	andncc	%o5,	%g7,	%o0
loop_2720:
	fpadd16	%f12,	%f8,	%f16
	tge	%xcc,	0x2
	bge,pn	%xcc,	loop_2721
	fmovde	%icc,	%f17,	%f28
	wr	%g0,	0x11,	%asi
	lduba	[%l7 + 0x7B] %asi,	%o1
loop_2721:
	tgu	%icc,	0x4
	fcmpgt16	%f22,	%f14,	%o7
	movrlez	%o4,	%g5,	%i0
	movgu	%xcc,	%g6,	%i6
	move	%xcc,	%o6,	%o2
	fbu,a	%fcc1,	loop_2722
	bneg	%icc,	loop_2723
	edge8n	%l0,	%i4,	%l1
	array16	%i2,	%l3,	%i1
loop_2722:
	fnegs	%f31,	%f15
loop_2723:
	movvc	%xcc,	%l5,	%o3
	ldx	[%l7 + 0x70],	%l4
	ld	[%l7 + 0x64],	%f23
	fmovsgu	%icc,	%f3,	%f0
	popc	0x1BBB,	%g2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	st	%f15,	[%l7 + 0x2C]
	fxors	%f3,	%f4,	%f4
	movge	%xcc,	%i3,	%g3
	movvs	%icc,	%g4,	%i7
	subc	%l2,	0x1A02,	%i5
	tge	%xcc,	0x4
	fmovde	%xcc,	%f9,	%f24
	fmul8x16au	%f20,	%f6,	%f18
	set	0x58, %l1
	lda	[%l7 + %l1] 0x80,	%f10
	be	loop_2724
	fcmple32	%f22,	%f28,	%g1
	movre	%o5,	%g7,	%o0
	movrne	%o1,	0x0EE,	%o7
loop_2724:
	fands	%f18,	%f30,	%f18
	orcc	%l6,	%o4,	%g5
	fbug	%fcc3,	loop_2725
	edge16ln	%g6,	%i6,	%o6
	wr	%g0,	0x19,	%asi
	swapa	[%l7 + 0x78] %asi,	%i0
loop_2725:
	mulx	%l0,	0x01E7,	%o2
	tsubcctv	%l1,	%i2,	%l3
	movrne	%i4,	0x3BF,	%l5
	sir	0x04D0
	membar	0x22
	edge8l	%i1,	%l4,	%g2
	udivx	%i3,	0x0157,	%g3
	movleu	%xcc,	%o3,	%g4
	andncc	%i7,	%l2,	%g1
	addc	%o5,	0x004C,	%i5
	ldub	[%l7 + 0x60],	%o0
	tle	%icc,	0x3
	udivcc	%o1,	0x14E7,	%g7
	sdivcc	%o7,	0x1D96,	%o4
	movre	%g5,	0x392,	%l6
	wr	%g0,	0x89,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	andn	%i6,	%o6,	%g6
	tge	%icc,	0x2
	edge16	%l0,	%i0,	%l1
	tleu	%xcc,	0x1
	subcc	%i2,	%l3,	%i4
	subccc	%o2,	%l5,	%i1
	nop
	setx	0x26E40BB3,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f26
	setx	0x42B6A4BC,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f12
	fadds	%f12,	%f26,	%f14
	andncc	%g2,	%i3,	%g3
	edge32ln	%o3,	%g4,	%i7
	fmovsge	%xcc,	%f13,	%f30
	fmovrsgz	%l2,	%f25,	%f3
	movrgez	%l4,	%o5,	%i5
	movg	%icc,	%g1,	%o1
	fbule	%fcc2,	loop_2726
	array8	%g7,	%o0,	%o4
	xor	%o7,	0x001C,	%g5
	edge8	%l6,	%i6,	%g6
loop_2726:
	movle	%icc,	%o6,	%l0
	edge8l	%i0,	%l1,	%l3
	ldsb	[%l7 + 0x2E],	%i2
	addc	%o2,	%i4,	%i1
	membar	0x7B
	fornot1s	%f14,	%f13,	%f17
	mulscc	%l5,	0x1098,	%i3
	lduw	[%l7 + 0x24],	%g2
	fmovscs	%icc,	%f5,	%f20
	srl	%o3,	0x0E,	%g4
	nop
	setx loop_2727, %l0, %l1
	jmpl %l1, %g3
	sth	%l2,	[%l7 + 0x14]
	sdiv	%i7,	0x0482,	%l4
	edge16	%i5,	%o5,	%g1
loop_2727:
	udiv	%g7,	0x143F,	%o1
	set	0x210, %o2
	ldxa	[%g0 + %o2] 0x52,	%o0
	fxors	%f10,	%f2,	%f9
	edge8ln	%o7,	%g5,	%l6
	edge32ln	%o4,	%i6,	%g6
	movcs	%xcc,	%l0,	%o6
	or	%i0,	0x045C,	%l1
	fbue	%fcc1,	loop_2728
	edge8l	%l3,	%i2,	%o2
	fnors	%f3,	%f15,	%f16
	wr	%g0,	0x10,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
loop_2728:
	movre	%i4,	0x3AC,	%i1
	udivx	%l5,	0x11C3,	%g2
	orn	%i3,	%g4,	%o3
	fmovrdne	%g3,	%f16,	%f20
	fmovrdgez	%i7,	%f26,	%f20
	sllx	%l2,	%l4,	%i5
	movcs	%xcc,	%g1,	%o5
	ble,pn	%icc,	loop_2729
	bneg,a,pn	%icc,	loop_2730
	movne	%xcc,	%o1,	%g7
	bn,pt	%icc,	loop_2731
loop_2729:
	fpadd16s	%f0,	%f9,	%f16
loop_2730:
	movl	%icc,	%o0,	%o7
	movge	%xcc,	%g5,	%l6
loop_2731:
	brnz	%o4,	loop_2732
	fmovrde	%g6,	%f14,	%f8
	edge8l	%i6,	%o6,	%i0
	nop
	set	0x4C, %l4
	prefetch	[%l7 + %l4],	 0x2
loop_2732:
	fmuld8ulx16	%f21,	%f14,	%f8
	fmovdge	%xcc,	%f19,	%f17
	brz,a	%l1,	loop_2733
	udivcc	%l3,	0x0EF1,	%l0
	brnz,a	%o2,	loop_2734
	nop
	setx	0x5475A6CF,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f3
	setx	0xA4EB5861,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f17
	fmuls	%f17,	%f3,	%f2
loop_2733:
	fmovrdne	%i2,	%f20,	%f2
	sllx	%i4,	%i1,	%g2
loop_2734:
	movneg	%icc,	%i3,	%l5
	array16	%g4,	%o3,	%g3
	and	%l2,	%l4,	%i7
	edge8	%i5,	%g1,	%o5
	edge8l	%o1,	%o0,	%g7
	nop
	fitod	%f0,	%f16
	fdtox	%f16,	%f6
	fxtod	%f6,	%f6
	movrne	%g5,	%o7,	%o4
	edge32ln	%l6,	%i6,	%g6
	subcc	%i0,	0x0ADB,	%l1
	lduw	[%l7 + 0x40],	%o6
	fmul8x16au	%f16,	%f14,	%f20
	flush	%l7 + 0x1C
	edge32ln	%l0,	%o2,	%i2
	swap	[%l7 + 0x50],	%i4
	fbo	%fcc2,	loop_2735
	movrgez	%l3,	%i1,	%g2
	bneg	loop_2736
	nop
	set	0x70, %i7
	stx	%l5,	[%l7 + %i7]
loop_2735:
	flush	%l7 + 0x78
	wr	%g0,	0x10,	%asi
	stba	%i3,	[%l7 + 0x55] %asi
loop_2736:
	tge	%icc,	0x2
	fcmpeq32	%f14,	%f24,	%g4
	movl	%xcc,	%g3,	%l2
	tvs	%icc,	0x3
	movneg	%xcc,	%o3,	%l4
	srax	%i7,	%g1,	%o5
	fmovdl	%xcc,	%f3,	%f21
	movle	%icc,	%o1,	%o0
	tpos	%icc,	0x4
	fmul8sux16	%f14,	%f22,	%f28
	fabsd	%f18,	%f26
	xnorcc	%i5,	0x0DCA,	%g7
	fsrc2s	%f16,	%f28
	tsubcc	%o7,	0x1620,	%g5
	edge16	%o4,	%i6,	%g6
	movrne	%i0,	%l6,	%l1
	xorcc	%l0,	0x108E,	%o6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fands	%f29,	%f18,	%f23
	taddcctv	%i2,	%o2,	%i4
	xnor	%i1,	0x1797,	%g2
	wr	%g0,	0x80,	%asi
	ldda	[%l7 + 0x20] %asi,	%l2
	orcc	%i3,	0x17FB,	%g4
	ldsh	[%l7 + 0x36],	%g3
	addccc	%l5,	0x0F1F,	%o3
	movcc	%icc,	%l2,	%i7
	addc	%g1,	0x0836,	%l4
	edge32n	%o5,	%o1,	%i5
	subcc	%g7,	%o7,	%g5
	movg	%icc,	%o0,	%o4
	movl	%xcc,	%i6,	%i0
	tsubcctv	%l6,	0x1915,	%g6
	alignaddr	%l0,	%l1,	%i2
	tl	%icc,	0x7
	wr	%g0,	0x04,	%asi
	lduha	[%l7 + 0x4A] %asi,	%o2
	sra	%o6,	%i4,	%g2
	fmul8x16	%f25,	%f12,	%f20
	taddcc	%i1,	0x0989,	%l3
	and	%i3,	0x081A,	%g3
	movre	%l5,	0x27A,	%g4
	nop
	setx loop_2737, %l0, %l1
	jmpl %l1, %l2
	xorcc	%o3,	0x1F1E,	%i7
	sll	%g1,	0x0B,	%l4
	fnegs	%f27,	%f17
loop_2737:
	ta	%xcc,	0x7
	set	0x40, %g3
	stha	%o1,	[%l7 + %g3] 0x18
	stw	%i5,	[%l7 + 0x1C]
	movrgez	%o5,	%o7,	%g5
	ldd	[%l7 + 0x60],	%o0
	stw	%g7,	[%l7 + 0x68]
	movrne	%o4,	0x242,	%i0
	andn	%i6,	0x1318,	%g6
	srlx	%l6,	%l0,	%i2
	stx	%o2,	[%l7 + 0x38]
	te	%icc,	0x0
	fmovdgu	%icc,	%f19,	%f27
	movrlez	%l1,	%i4,	%g2
	fnands	%f16,	%f3,	%f26
	sll	%o6,	%l3,	%i1
	movle	%icc,	%g3,	%i3
	movcs	%icc,	%g4,	%l2
	smul	%o3,	0x132E,	%i7
	fandnot1	%f18,	%f0,	%f16
	sir	0x11A4
	fpsub16	%f12,	%f6,	%f0
	bvc,pn	%xcc,	loop_2738
	andcc	%l5,	0x1E36,	%l4
	umulcc	%o1,	%i5,	%o5
	set	0x1D, %i0
	lduba	[%l7 + %i0] 0x19,	%o7
loop_2738:
	bne,a	%xcc,	loop_2739
	tcc	%icc,	0x2
	fpmerge	%f12,	%f10,	%f28
	tvs	%xcc,	0x0
loop_2739:
	brz	%g1,	loop_2740
	fbu,a	%fcc1,	loop_2741
	edge16l	%g5,	%g7,	%o4
	edge32n	%i0,	%i6,	%o0
loop_2740:
	fmovdcc	%xcc,	%f26,	%f26
loop_2741:
	bcs,a,pt	%icc,	loop_2742
	bgu,a,pt	%xcc,	loop_2743
	edge8n	%g6,	%l0,	%l6
	movrlez	%o2,	%l1,	%i4
loop_2742:
	taddcc	%i2,	0x123A,	%o6
loop_2743:
	fnor	%f6,	%f20,	%f30
	tvc	%xcc,	0x1
	fmovdleu	%xcc,	%f29,	%f31
	tvs	%xcc,	0x4
	ldd	[%l7 + 0x18],	%g2
	nop
	setx	0x9AEF45F4,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f29
	setx	0x6376A5BA,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f28
	fmuls	%f28,	%f29,	%f16
	movcs	%xcc,	%i1,	%l3
	edge8ln	%i3,	%g4,	%l2
	tcc	%xcc,	0x5
	ta	%icc,	0x5
	smul	%o3,	%i7,	%g3
	movne	%icc,	%l5,	%o1
	array32	%l4,	%i5,	%o7
	fmovsvs	%icc,	%f5,	%f8
	bge,pt	%icc,	loop_2744
	stw	%o5,	[%l7 + 0x0C]
	movre	%g1,	%g5,	%o4
	nop
	fitos	%f6,	%f15
	fstox	%f15,	%f14
	fxtos	%f14,	%f20
loop_2744:
	tg	%icc,	0x0
	fbg	%fcc3,	loop_2745
	bcc	loop_2746
	movleu	%xcc,	%g7,	%i0
	movpos	%icc,	%i6,	%o0
loop_2745:
	tl	%icc,	0x7
loop_2746:
	edge32l	%g6,	%l0,	%o2
	subccc	%l6,	%l1,	%i4
	smul	%i2,	%g2,	%o6
	movrlz	%i1,	%i3,	%l3
	movle	%icc,	%l2,	%g4
	fnot2s	%f10,	%f25
	bge,a	loop_2747
	tcc	%xcc,	0x6
	and	%i7,	%g3,	%o3
	for	%f14,	%f22,	%f16
loop_2747:
	bshuffle	%f28,	%f10,	%f24
	fba	%fcc0,	loop_2748
	tsubcctv	%l5,	0x1785,	%o1
	fmovrslez	%i5,	%f15,	%f13
	tpos	%icc,	0x3
loop_2748:
	nop
	fitod	%f0,	%f4
	fdtox	%f4,	%f30
	movle	%xcc,	%l4,	%o5
	nop
	fitod	%f10,	%f28
	fdtos	%f28,	%f23
	movrgz	%o7,	%g1,	%g5
	udivcc	%g7,	0x17F8,	%o4
	movl	%xcc,	%i0,	%i6
	fpadd32	%f4,	%f12,	%f22
	movrlez	%g6,	0x047,	%o0
	sir	0x0A54
	tcs	%icc,	0x4
	fnegs	%f14,	%f26
	fandnot1	%f16,	%f8,	%f12
	nop
	setx	0xD04A8A38,	%l0,	%l6
	st	%l6,	[%l7 + 0x18]
	ld	[%l7 + 0x18],	%fsr
	tsubcctv	%l0,	0x151E,	%l6
	fxnor	%f18,	%f14,	%f0
	set	0x78, %o7
	prefetcha	[%l7 + %o7] 0x81,	 0x3
	tge	%xcc,	0x1
	edge16n	%o2,	%i2,	%g2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udivcc	%i4,	0x028D,	%o6
	wr	%g0,	0x04,	%asi
	ldstuba	[%l7 + 0x4F] %asi,	%i3
	fnands	%f14,	%f5,	%f5
	fmovrdlz	%i1,	%f8,	%f28
	subc	%l2,	0x1608,	%g4
	ld	[%l7 + 0x30],	%f8
	wr	%g0,	0x80,	%asi
	stha	%l3,	[%l7 + 0x7A] %asi
	edge16n	%i7,	%g3,	%o3
	fbue,a	%fcc0,	loop_2749
	bgu,pt	%icc,	loop_2750
	sub	%l5,	%o1,	%l4
	bl,pn	%xcc,	loop_2751
loop_2749:
	xorcc	%o5,	0x0E4F,	%o7
loop_2750:
	xor	%i5,	0x0F06,	%g5
	edge8	%g7,	%g1,	%o4
loop_2751:
	nop
	setx	0x20575A38,	%l0,	%l6
	st	%l6,	[%l7 + 0x7C]
	ld	[%l7 + 0x7C],	%fsr
	wr	%g0,	0x81,	%asi
	swapa	[%l7 + 0x2C] %asi,	%i0
	membar	0x4C
	addcc	%i6,	%o0,	%g6
	fbl,a	%fcc1,	loop_2752
	movvs	%icc,	%l0,	%l1
	andncc	%l6,	%o2,	%g2
	fcmpne32	%f30,	%f8,	%i4
loop_2752:
	subc	%i2,	0x0D59,	%o6
	fornot1s	%f13,	%f12,	%f5
	mulx	%i1,	0x15BB,	%l2
	edge32ln	%g4,	%l3,	%i3
	movne	%icc,	%g3,	%i7
	fxnors	%f3,	%f2,	%f6
	fbu,a	%fcc2,	loop_2753
	edge8	%o3,	%o1,	%l5
	brlz	%o5,	loop_2754
	movvs	%icc,	%l4,	%i5
loop_2753:
	te	%icc,	0x2
	umul	%g5,	%g7,	%g1
loop_2754:
	edge16l	%o4,	%i0,	%i6
	fmovda	%icc,	%f16,	%f12
	array8	%o7,	%g6,	%o0
	fmovrsgez	%l0,	%f31,	%f18
	membar	0x67
	movvc	%icc,	%l1,	%o2
	bne,pn	%xcc,	loop_2755
	ldub	[%l7 + 0x5A],	%g2
	movrgz	%i4,	%l6,	%o6
	srax	%i2,	0x09,	%i1
loop_2755:
	nop
	set	0x40, %o5
	stda	%f0,	[%l7 + %o5] 0xf8
	membar	#Sync
	fmuld8ulx16	%f15,	%f9,	%f20
	fmovscc	%xcc,	%f24,	%f10
	ldx	[%l7 + 0x18],	%l2
	sra	%g4,	%i3,	%l3
	bvc,pt	%icc,	loop_2756
	call	loop_2757
	xnor	%i7,	0x0AF5,	%o3
	bge,a	loop_2758
loop_2756:
	addc	%g3,	%o1,	%o5
loop_2757:
	udivx	%l5,	0x0A25,	%i5
	subc	%g5,	%l4,	%g7
loop_2758:
	taddcctv	%g1,	%i0,	%i6
	xorcc	%o4,	0x0872,	%g6
	mulx	%o0,	%o7,	%l1
	tcc	%icc,	0x0
	bvs	loop_2759
	andn	%l0,	0x0A33,	%g2
	srax	%i4,	%l6,	%o2
	bge,a,pn	%icc,	loop_2760
loop_2759:
	movvs	%xcc,	%i2,	%i1
	subccc	%l2,	%o6,	%g4
	tne	%icc,	0x0
loop_2760:
	ldd	[%l7 + 0x08],	%i2
	srl	%l3,	0x1C,	%i7
	movleu	%icc,	%o3,	%g3
	taddcctv	%o1,	%o5,	%l5
	andn	%g5,	0x0751,	%l4
	fbg	%fcc3,	loop_2761
	mulscc	%g7,	0x188F,	%i5
	ld	[%l7 + 0x48],	%f6
	array8	%i0,	%g1,	%o4
loop_2761:
	edge16n	%i6,	%g6,	%o0
	movneg	%icc,	%o7,	%l0
	tsubcc	%l1,	0x0161,	%i4
	fsrc1	%f2,	%f2
	movrlez	%l6,	%o2,	%i2
	edge32l	%i1,	%l2,	%g2
	and	%g4,	0x19DE,	%i3
	set	0x70, %g6
	ldxa	[%l7 + %g6] 0x18,	%o6
	srl	%i7,	0x0B,	%o3
	addccc	%l3,	0x15B4,	%g3
	ta	%icc,	0x3
	subc	%o1,	%o5,	%g5
	edge32n	%l5,	%l4,	%g7
	tcs	%icc,	0x2
	bleu,a,pt	%xcc,	loop_2762
	sub	%i5,	%g1,	%i0
	subccc	%i6,	%o4,	%g6
	fbuge,a	%fcc0,	loop_2763
loop_2762:
	fmovsgu	%xcc,	%f22,	%f5
	popc	0x1D50,	%o0
	fmovrslz	%l0,	%f15,	%f27
loop_2763:
	tsubcc	%o7,	0x1E4C,	%l1
	fbe	%fcc0,	loop_2764
	array8	%i4,	%o2,	%l6
	brz	%i1,	loop_2765
	edge8	%l2,	%i2,	%g4
loop_2764:
	nop
	fitod	%f8,	%f28
	fdtoi	%f28,	%f19
	be,pt	%icc,	loop_2766
loop_2765:
	umulcc	%g2,	0x00C7,	%o6
	edge32l	%i7,	%o3,	%l3
	wr	%g0,	0x04,	%asi
	lduha	[%l7 + 0x36] %asi,	%i3
loop_2766:
	fandnot1s	%f29,	%f14,	%f13
	addccc	%o1,	%o5,	%g3
	lduh	[%l7 + 0x18],	%g5
	fmovdpos	%icc,	%f11,	%f26
	fmovsg	%xcc,	%f11,	%f31
	tsubcc	%l4,	0x1D33,	%l5
	tcc	%xcc,	0x3
	popc	%i5,	%g7
	ldub	[%l7 + 0x6F],	%g1
	xorcc	%i0,	0x077F,	%i6
	sub	%o4,	0x114B,	%o0
	movre	%l0,	0x1EA,	%g6
	fone	%f30
	faligndata	%f28,	%f10,	%f12
	te	%xcc,	0x2
	orn	%o7,	0x05CA,	%i4
	movge	%xcc,	%o2,	%l6
	orn	%l1,	%i1,	%i2
	fmovd	%f2,	%f30
	stbar
	and	%g4,	0x1EC7,	%l2
	nop
	setx	0x005DB5BD86854466,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0x8AAC0723CBB15A7B,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	fsubd	%f18,	%f26,	%f2
	fmovsle	%xcc,	%f13,	%f21
	movl	%xcc,	%o6,	%i7
	movvs	%icc,	%g2,	%o3
	sethi	0x055C,	%i3
	fpadd16	%f18,	%f2,	%f26
	fxors	%f0,	%f1,	%f29
	movgu	%xcc,	%o1,	%l3
	fmovdn	%icc,	%f21,	%f26
	subcc	%g3,	%g5,	%o5
	stb	%l5,	[%l7 + 0x54]
	tn	%xcc,	0x4
	fcmple16	%f2,	%f16,	%i5
	tcs	%xcc,	0x1
	movre	%l4,	0x272,	%g7
	andncc	%i0,	%i6,	%g1
	addcc	%o0,	%l0,	%o4
	array32	%g6,	%i4,	%o2
	alignaddr	%l6,	%l1,	%o7
	addcc	%i1,	0x1BFE,	%g4
	movrlez	%i2,	0x0C4,	%l2
	tleu	%xcc,	0x2
	sir	0x19AF
	fornot1s	%f18,	%f31,	%f0
	brlez	%i7,	loop_2767
	ldstub	[%l7 + 0x6B],	%g2
	movvc	%icc,	%o6,	%i3
	movrlz	%o1,	%l3,	%o3
loop_2767:
	fmovsne	%icc,	%f18,	%f13
	fabsd	%f10,	%f28
	subccc	%g3,	%g5,	%l5
	tge	%xcc,	0x0
	movvs	%xcc,	%i5,	%o5
	flush	%l7 + 0x2C
	sethi	0x14D0,	%g7
	subcc	%i0,	%i6,	%l4
	tpos	%icc,	0x6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bcc	%xcc,	loop_2768
	stbar
	fmovsn	%icc,	%f13,	%f29
	alignaddr	%o0,	%l0,	%o4
loop_2768:
	movvs	%xcc,	%g6,	%g1
	fpsub32	%f28,	%f24,	%f26
	movpos	%xcc,	%o2,	%i4
	fnegs	%f13,	%f20
	fba,a	%fcc3,	loop_2769
	tleu	%xcc,	0x0
	nop
	setx	0xA07C8096,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%fsr
	movne	%icc,	%l6,	%o7
loop_2769:
	fxor	%f2,	%f28,	%f26
	sth	%l1,	[%l7 + 0x34]
	fmovsn	%icc,	%f26,	%f14
	sra	%g4,	0x08,	%i1
	brgez,a	%i2,	loop_2770
	tcs	%icc,	0x4
	mulx	%l2,	%g2,	%o6
	addccc	%i7,	%o1,	%l3
loop_2770:
	edge16n	%i3,	%o3,	%g3
	edge32ln	%g5,	%l5,	%i5
	nop
	setx	0x6EEE7706106049CC,	%l0,	%l6
	stx	%l6,	[%l7 + 0x70]
	ldx	[%l7 + 0x70],	%fsr
	call	loop_2771
	array32	%g7,	%o5,	%i0
	fsrc1s	%f30,	%f31
	movleu	%icc,	%i6,	%o0
loop_2771:
	addc	%l4,	%o4,	%g6
	nop
	fitos	%f4,	%f31
	fstod	%f31,	%f14
	srax	%g1,	%o2,	%i4
	fcmpeq16	%f26,	%f6,	%l6
	set	0x34, %l2
	swapa	[%l7 + %l2] 0x04,	%l0
	taddcctv	%l1,	%o7,	%g4
	sub	%i2,	0x15C1,	%l2
	orncc	%g2,	%i1,	%i7
	bvc,a,pt	%icc,	loop_2772
	flush	%l7 + 0x70
	fbne	%fcc1,	loop_2773
	andn	%o1,	%o6,	%l3
loop_2772:
	stw	%o3,	[%l7 + 0x50]
	edge32	%i3,	%g3,	%l5
loop_2773:
	sdiv	%i5,	0x1D17,	%g7
	nop
	setx	loop_2774,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	edge32n	%g5,	%i0,	%i6
	bleu,a,pt	%xcc,	loop_2775
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2774:
	alignaddrl	%o5,	%l4,	%o4
	sllx	%o0,	%g1,	%g6
loop_2775:
	movcc	%icc,	%o2,	%i4
	set	0x55, %i1
	ldstuba	[%l7 + %i1] 0x18,	%l6
	array32	%l1,	%l0,	%o7
	set	0x40, %o1
	ldda	[%l7 + %o1] 0x18,	%f0
	fmovsleu	%icc,	%f25,	%f2
	fmovdcs	%xcc,	%f31,	%f18
	tle	%icc,	0x1
	mulscc	%i2,	%g4,	%g2
	brgez,a	%l2,	loop_2776
	edge8l	%i1,	%o1,	%i7
	ldstub	[%l7 + 0x65],	%o6
	fcmpgt16	%f28,	%f0,	%l3
loop_2776:
	sir	0x1A51
	ldd	[%l7 + 0x18],	%i2
	fands	%f5,	%f11,	%f3
	nop
	setx	loop_2777,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fand	%f22,	%f22,	%f20
	set	0x40, %o3
	ldda	[%l7 + %o3] 0x88,	%o2
loop_2777:
	udivcc	%g3,	0x0D3A,	%l5
	set	0x7E, %i6
	stha	%i5,	[%l7 + %i6] 0x0c
	movrgz	%g5,	0x10C,	%g7
	tge	%icc,	0x5
	nop
	fitod	%f10,	%f8
	fdtox	%f8,	%f14
	fxtod	%f14,	%f8
	bshuffle	%f10,	%f14,	%f14
	tvs	%icc,	0x0
	set	0x68, %g1
	ldsba	[%l7 + %g1] 0x14,	%i6
	fmovdn	%xcc,	%f9,	%f18
	sethi	0x08D1,	%o5
	edge8ln	%i0,	%o4,	%l4
	fmovdle	%xcc,	%f5,	%f29
	tgu	%icc,	0x0
	fnegd	%f14,	%f26
	wr	%g0,	0x80,	%asi
	lduha	[%l7 + 0x20] %asi,	%o0
	movneg	%xcc,	%g6,	%g1
	nop
	fitod	%f10,	%f30
	fdtoi	%f30,	%f4
	tle	%xcc,	0x2
	fbuge	%fcc3,	loop_2778
	sra	%o2,	0x09,	%i4
	andcc	%l1,	0x1238,	%l6
	alignaddrl	%l0,	%o7,	%g4
loop_2778:
	udivcc	%g2,	0x1BD4,	%l2
	set	0x60, %i4
	stwa	%i2,	[%l7 + %i4] 0x80
	fmul8sux16	%f18,	%f30,	%f28
	sir	0x1F82
	fmovdvc	%icc,	%f13,	%f7
	movneg	%icc,	%i1,	%i7
	tleu	%icc,	0x0
	or	%o1,	%l3,	%i3
	wr	%g0,	0x89,	%asi
	swapa	[%l7 + 0x74] %asi,	%o6
	popc	%o3,	%l5
	fnot2s	%f26,	%f20
	edge32ln	%i5,	%g3,	%g7
	set	0x40, %o0
	ldda	[%l7 + %o0] 0x0c,	%f0
	bge,a,pt	%icc,	loop_2779
	tg	%xcc,	0x1
	smul	%i6,	%o5,	%g5
	tn	%xcc,	0x2
loop_2779:
	fpsub16s	%f24,	%f12,	%f14
	fxor	%f18,	%f28,	%f4
	umulcc	%o4,	0x03EA,	%i0
	sethi	0x0EA9,	%l4
	fmovrse	%o0,	%f12,	%f23
	nop
	setx	0x14EBFCB8B91DEB3B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	fsqrtd	%f30,	%f18
	srlx	%g6,	%o2,	%g1
	edge8ln	%i4,	%l1,	%l0
	subccc	%o7,	%l6,	%g4
	edge8	%g2,	%l2,	%i2
	orcc	%i7,	%i1,	%o1
	ble	%xcc,	loop_2780
	sll	%i3,	0x0C,	%l3
	taddcc	%o6,	0x0236,	%o3
	sll	%i5,	0x03,	%g3
loop_2780:
	nop
	setx	loop_2781,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	stbar
	fxnor	%f10,	%f12,	%f20
	movg	%xcc,	%l5,	%g7
loop_2781:
	nop
	set	0x28, %g2
	lda	[%l7 + %g2] 0x10,	%f31
	tvc	%icc,	0x6
	srax	%i6,	0x1D,	%o5
	move	%icc,	%o4,	%g5
	fmovdge	%xcc,	%f22,	%f2
	edge32ln	%l4,	%o0,	%i0
	movne	%xcc,	%g6,	%o2
	edge8n	%g1,	%i4,	%l0
	subcc	%o7,	0x1A3F,	%l1
	smul	%g4,	%l6,	%l2
	movge	%icc,	%i2,	%i7
	bne	%xcc,	loop_2782
	edge32l	%g2,	%o1,	%i1
	movrlez	%l3,	0x3F0,	%o6
	fpsub16s	%f14,	%f23,	%f29
loop_2782:
	movneg	%icc,	%i3,	%i5
	fbg,a	%fcc1,	loop_2783
	fmovsne	%icc,	%f23,	%f10
	srlx	%g3,	%o3,	%l5
	movcc	%icc,	%g7,	%o5
loop_2783:
	subccc	%o4,	0x12B8,	%i6
	taddcc	%l4,	0x1616,	%o0
	ldd	[%l7 + 0x40],	%g4
	movle	%icc,	%i0,	%g6
	array16	%o2,	%g1,	%i4
	fornot1s	%f16,	%f19,	%f31
	ble	loop_2784
	smulcc	%l0,	0x0C66,	%o7
	tge	%icc,	0x2
	bvc,a,pn	%icc,	loop_2785
loop_2784:
	subc	%l1,	0x0BBB,	%g4
	mulx	%l6,	0x05FD,	%l2
	wr	%g0,	0x89,	%asi
	stxa	%i2,	[%l7 + 0x08] %asi
loop_2785:
	array32	%g2,	%i7,	%o1
	set	0x68, %l6
	lda	[%l7 + %l6] 0x88,	%f7
	nop 	! 	nop 	! 	wr	%g0,	0x40,	%asi ripped by fixASI40.pl ripped by fixASI40.pl
	nop 	! 	nop 	! 	stxa	%l3,	[%g0 + 0x130] %asi ripped by fixASI40.pl ripped by fixASI40.pl
	taddcctv	%i1,	%i3,	%o6
	fbge,a	%fcc3,	loop_2786
	udivcc	%g3,	0x1745,	%o3
	fcmpgt16	%f24,	%f10,	%l5
	move	%icc,	%i5,	%g7
loop_2786:
	edge32ln	%o4,	%i6,	%l4
	sll	%o5,	0x07,	%g5
	nop
	fitos	%f12,	%f23
	fstox	%f23,	%f16
	fxtos	%f16,	%f0
	bvc,pt	%icc,	loop_2787
	fmuld8ulx16	%f28,	%f0,	%f14
	for	%f18,	%f6,	%f10
	bneg	loop_2788
loop_2787:
	alignaddr	%o0,	%g6,	%o2
	movpos	%xcc,	%i0,	%i4
	movrlez	%g1,	%l0,	%o7
loop_2788:
	movrgz	%g4,	0x1D7,	%l1
	fmovrsne	%l6,	%f10,	%f11
	xorcc	%l2,	%g2,	%i7
	movcs	%icc,	%i2,	%o1
	fmovsle	%xcc,	%f25,	%f19
	fcmpne16	%f26,	%f28,	%l3
	bgu,a,pt	%xcc,	loop_2789
	edge16ln	%i1,	%i3,	%o6
	movcs	%xcc,	%o3,	%l5
	nop
	setx	0xC39E354B,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f22
	setx	0x015FAD20,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f18
	fmuls	%f18,	%f22,	%f26
loop_2789:
	move	%icc,	%i5,	%g3
	srax	%g7,	%i6,	%o4
	brgz	%l4,	loop_2790
	fmovrsgz	%o5,	%f27,	%f26
	nop
	setx	0xB2CDFED1073E3DCA,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	fsqrtd	%f0,	%f26
	edge16ln	%o0,	%g6,	%g5
loop_2790:
	bne,pt	%icc,	loop_2791
	ta	%xcc,	0x5
	tneg	%icc,	0x6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2791:
	nop
	setx	0xA4563B27,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f31
	setx	0xF22C1F4B,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f17
	fmuls	%f17,	%f31,	%f10
	bn,a	loop_2792
	fandnot2s	%f27,	%f14,	%f23
	swap	[%l7 + 0x7C],	%i0
	umul	%o2,	%g1,	%i4
loop_2792:
	membar	0x41
	tcc	%icc,	0x3
	umul	%o7,	%l0,	%l1
	sir	0x19B9
	nop
	fitod	%f29,	%f0
	add	%l7,	0x2C,	%l6
	wr	%g0,	0x19,	%asi
	casa	[%l6] 0x19,	%g4,	%l2
	edge16l	%l6,	%i7,	%g2
	movrne	%i2,	%o1,	%i1
	sub	%i3,	%o6,	%o3
	movleu	%xcc,	%l5,	%i5
	move	%xcc,	%l3,	%g7
	fnot2	%f8,	%f16
	edge8ln	%i6,	%o4,	%l4
	andn	%o5,	%o0,	%g6
	fornot1	%f26,	%f30,	%f16
	fbo,a	%fcc2,	loop_2793
	fmovde	%icc,	%f2,	%f7
	sub	%g5,	%i0,	%g3
	xnorcc	%g1,	%i4,	%o7
loop_2793:
	alignaddr	%l0,	%l1,	%o2
	fxor	%f22,	%f22,	%f4
	sdiv	%l2,	0x0FB8,	%g4
	movpos	%icc,	%i7,	%l6
	bn,a,pn	%icc,	loop_2794
	fpackfix	%f16,	%f20
	movle	%icc,	%g2,	%o1
	wr	%g0,	0x0c,	%asi
	lda	[%l7 + 0x14] %asi,	%f10
loop_2794:
	brnz	%i1,	loop_2795
	lduw	[%l7 + 0x74],	%i3
	fblg,a	%fcc2,	loop_2796
	popc	0x04C9,	%i2
loop_2795:
	stbar
	bvs	%xcc,	loop_2797
loop_2796:
	fbu,a	%fcc2,	loop_2798
	edge16	%o3,	%o6,	%i5
	edge16n	%l3,	%l5,	%i6
loop_2797:
	edge32	%o4,	%l4,	%o5
loop_2798:
	srl	%g7,	%o0,	%g5
	array8	%i0,	%g6,	%g3
	te	%icc,	0x2
	bne,a	%icc,	loop_2799
	umul	%i4,	0x16DD,	%o7
	alignaddr	%l0,	%l1,	%g1
	pdist	%f18,	%f16,	%f2
loop_2799:
	taddcc	%o2,	0x1A6B,	%g4
	set	0x53, %l5
	lduba	[%l7 + %l5] 0x89,	%i7
	tn	%icc,	0x3
	srax	%l2,	%l6,	%o1
	tgu	%icc,	0x7
	bne	%icc,	loop_2800
	movl	%xcc,	%g2,	%i1
	tneg	%icc,	0x5
	addccc	%i3,	0x1118,	%i2
loop_2800:
	srlx	%o6,	%o3,	%l3
	nop
	setx	0x7F78BF4B,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f8
	setx	0xBF709D99,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f4
	fsubs	%f4,	%f8,	%f10
	array32	%l5,	%i6,	%o4
	fones	%f23
	movle	%icc,	%i5,	%l4
	sdiv	%g7,	0x127A,	%o5
	fpadd16s	%f25,	%f3,	%f26
	movn	%icc,	%g5,	%o0
	tvs	%xcc,	0x0
	tcc	%xcc,	0x1
	movg	%xcc,	%i0,	%g3
	wr	%g0,	0x04,	%asi
	ldswa	[%l7 + 0x0C] %asi,	%g6
	movge	%icc,	%i4,	%o7
	edge16l	%l0,	%l1,	%g1
	edge16l	%g4,	%o2,	%l2
	set	0x18, %g5
	ldxa	[%l7 + %g5] 0x80,	%l6
	array16	%i7,	%o1,	%i1
	tvc	%icc,	0x3
	te	%xcc,	0x6
	smul	%i3,	%g2,	%i2
	add	%l7,	0x38,	%l6
	wr	%g0,	0x04,	%asi
	casxa	[%l6] %asi,	%o3,	%o6
	nop
	setx	0x6287FFD6,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f16
	setx	0x7BEA008F,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f16
	fadds	%f16,	%f16,	%f17
	te	%xcc,	0x6
	tsubcctv	%l3,	0x02B5,	%l5
	stx	%i6,	[%l7 + 0x58]
	tgu	%xcc,	0x4
	popc	0x1558,	%i5
	bleu,pn	%xcc,	loop_2801
	mova	%icc,	%o4,	%l4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnegs	%f30,	%f28
loop_2801:
	fnors	%f3,	%f31,	%f16
	set	0x32, %i5
	ldstuba	[%l7 + %i5] 0x10,	%g7
	ldsw	[%l7 + 0x68],	%g5
	edge16n	%o5,	%i0,	%o0
	add	%l7,	0x08,	%l6
	wr	%g0,	0x11,	%asi
	casa	[%l6] 0x11,	%g6,	%i4
	edge32ln	%o7,	%l0,	%g3
	edge32n	%g1,	%l1,	%o2
	edge8ln	%l2,	%l6,	%g4
	wr	%g0,	0x80,	%asi
	swapa	[%l7 + 0x64] %asi,	%i7
	pdist	%f2,	%f0,	%f8
	bcc,pn	%icc,	loop_2802
	edge8	%i1,	%o1,	%g2
	tpos	%icc,	0x6
	tle	%icc,	0x3
loop_2802:
	xnorcc	%i3,	%i2,	%o3
	brnz,a	%l3,	loop_2803
	andn	%o6,	0x1B9E,	%l5
	membar	0x72
	tn	%xcc,	0x6
loop_2803:
	nop
	wr	%g0,	0x89,	%asi
	prefetcha	[%l7 + 0x20] %asi,	 0x3
	bvs	%icc,	loop_2804
	brgez,a	%o4,	loop_2805
	array8	%l4,	%g7,	%i6
	te	%xcc,	0x1
loop_2804:
	flush	%l7 + 0x34
loop_2805:
	sra	%o5,	0x15,	%i0
	fbl	%fcc3,	loop_2806
	fpsub16s	%f29,	%f11,	%f10
	subccc	%o0,	%g5,	%g6
	fnot1s	%f10,	%f6
loop_2806:
	edge8n	%o7,	%i4,	%l0
	bge	%icc,	loop_2807
	xor	%g1,	0x15F0,	%g3
	edge32ln	%o2,	%l2,	%l1
	tsubcc	%g4,	0x0A10,	%l6
loop_2807:
	fbo	%fcc1,	loop_2808
	taddcc	%i1,	0x0DCE,	%i7
	addcc	%g2,	%i3,	%i2
	array32	%o1,	%o3,	%l3
loop_2808:
	fpsub32s	%f8,	%f30,	%f4
	srax	%l5,	%i5,	%o4
	set	0x148, %l3
	nop 	! 	nop 	! 	ldxa	[%g0 + %l3] 0x40,	%o6 ripped by fixASI40.pl ripped by fixASI40.pl
	fmovrslez	%g7,	%f6,	%f20
	tcs	%xcc,	0x2
	fbu,a	%fcc0,	loop_2809
	tsubcctv	%l4,	0x095F,	%o5
	movge	%xcc,	%i6,	%i0
	stw	%o0,	[%l7 + 0x78]
loop_2809:
	stbar
	movrlz	%g5,	%g6,	%o7
	movrgz	%l0,	%g1,	%i4
	pdist	%f28,	%f12,	%f4
	movne	%xcc,	%o2,	%l2
	sub	%l1,	%g4,	%g3
	udiv	%l6,	0x0939,	%i7
	nop
	setx	0x55BA15AB,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f23
	setx	0x4D1B574A,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f20
	fmuls	%f20,	%f23,	%f12
	bn,pt	%icc,	loop_2810
	prefetch	[%l7 + 0x08],	 0x2
	sdiv	%g2,	0x0F66,	%i1
	sll	%i2,	0x12,	%i3
loop_2810:
	movcc	%icc,	%o1,	%o3
	movcc	%icc,	%l3,	%l5
	fsrc1	%f22,	%f18
	movvs	%icc,	%i5,	%o6
	srl	%g7,	0x08,	%l4
	srl	%o5,	%o4,	%i6
	sub	%i0,	%o0,	%g5
	fmovdgu	%xcc,	%f12,	%f31
	tg	%icc,	0x1
	wr	%g0,	0xeb,	%asi
	stwa	%g6,	[%l7 + 0x50] %asi
	membar	#Sync
	fbul,a	%fcc0,	loop_2811
	ldub	[%l7 + 0x2A],	%l0
	sethi	0x1222,	%g1
	orn	%i4,	%o7,	%l2
loop_2811:
	membar	0x4E
	udivx	%l1,	0x02F7,	%g4
	taddcc	%g3,	%l6,	%i7
	orn	%g2,	0x170D,	%i1
	addccc	%o2,	%i3,	%i2
	fpsub32s	%f14,	%f30,	%f15
	tvs	%icc,	0x5
	fone	%f2
	subc	%o3,	%o1,	%l3
	srlx	%l5,	0x0D,	%i5
	std	%f26,	[%l7 + 0x50]
	srl	%g7,	0x1B,	%l4
	edge16ln	%o6,	%o5,	%o4
	movrgez	%i6,	0x3E3,	%i0
	sir	0x13E0
	tsubcctv	%o0,	0x05E3,	%g6
	orncc	%g5,	%g1,	%l0
	tge	%icc,	0x7
	fcmpne16	%f4,	%f16,	%i4
	bne,pn	%xcc,	loop_2812
	fcmpeq32	%f20,	%f12,	%o7
	orncc	%l2,	0x14AF,	%g4
	tne	%xcc,	0x6
loop_2812:
	mulx	%l1,	0x00DD,	%l6
	movgu	%xcc,	%i7,	%g3
	tneg	%icc,	0x3
	srax	%i1,	0x18,	%g2
	nop
	setx loop_2813, %l0, %l1
	jmpl %l1, %o2
	movg	%icc,	%i3,	%i2
	tvc	%xcc,	0x1
	movvs	%icc,	%o1,	%o3
loop_2813:
	sdiv	%l3,	0x0B97,	%i5
	edge32ln	%l5,	%g7,	%o6
	ldub	[%l7 + 0x79],	%o5
	srlx	%l4,	%o4,	%i0
	edge16	%i6,	%g6,	%o0
	stbar
	tge	%icc,	0x6
	sethi	0x0398,	%g5
	bvc,a,pn	%icc,	loop_2814
	fsrc2s	%f22,	%f27
	tneg	%xcc,	0x1
	fbne,a	%fcc0,	loop_2815
loop_2814:
	fmovrdlez	%g1,	%f0,	%f28
	sllx	%l0,	%o7,	%i4
	bn,a	%xcc,	loop_2816
loop_2815:
	fbuge	%fcc2,	loop_2817
	ldsb	[%l7 + 0x24],	%g4
	tvs	%icc,	0x3
loop_2816:
	fmovscc	%xcc,	%f20,	%f8
loop_2817:
	orcc	%l2,	0x08FB,	%l1
	sllx	%i7,	0x11,	%l6
	call	loop_2818
	nop
	setx loop_2819, %l0, %l1
	jmpl %l1, %g3
	tsubcc	%i1,	0x0B75,	%o2
	fbu,a	%fcc2,	loop_2820
loop_2818:
	taddcc	%i3,	0x14CD,	%i2
loop_2819:
	sethi	0x188A,	%o1
	brnz,a	%g2,	loop_2821
loop_2820:
	subc	%l3,	0x0D17,	%o3
	bge	loop_2822
	bcs,a,pt	%xcc,	loop_2823
loop_2821:
	edge32ln	%l5,	%g7,	%i5
	fzero	%f0
loop_2822:
	fnot1s	%f27,	%f26
loop_2823:
	edge32l	%o5,	%o6,	%o4
	nop
	setx	0xE074FEEA,	%l0,	%l6
	st	%l6,	[%l7 + 0x40]
	ld	[%l7 + 0x40],	%fsr
	array16	%i0,	%i6,	%g6
	udivx	%l4,	0x036D,	%g5
	bn,a,pt	%icc,	loop_2824
	edge32l	%g1,	%l0,	%o7
	tle	%icc,	0x6
	udivx	%i4,	0x1817,	%o0
loop_2824:
	or	%l2,	%l1,	%g4
	movrne	%l6,	%i7,	%i1
	fmovrdgz	%g3,	%f26,	%f22
	fsrc1s	%f15,	%f19
	umul	%i3,	%o2,	%o1
	fnot1s	%f6,	%f5
	fblg	%fcc3,	loop_2825
	andncc	%i2,	%l3,	%g2
	xnorcc	%l5,	%o3,	%g7
	nop
	setx	0xABF5B02D3482D387,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0x2D4BBB85188F47C5,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	fmuld	%f18,	%f2,	%f8
loop_2825:
	udivcc	%o5,	0x1ADE,	%i5
	set	0x0C, %i3
	lduwa	[%l7 + %i3] 0x14,	%o6
	andcc	%o4,	%i6,	%g6
	smul	%i0,	0x061A,	%g5
	fbn	%fcc2,	loop_2826
	srl	%g1,	0x03,	%l4
	mulscc	%o7,	%i4,	%l0
	ta	%xcc,	0x5
loop_2826:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	smul	%l2,	%l1,	%o0
	array32	%g4,	%l6,	%i7
	tvs	%xcc,	0x7
	taddcctv	%g3,	%i3,	%o2
	tcc	%icc,	0x7
	fmovse	%xcc,	%f28,	%f17
	sllx	%o1,	0x0D,	%i2
	andncc	%i1,	%l3,	%l5
	umul	%g2,	0x04BD,	%g7
	edge8l	%o3,	%o5,	%i5
	movge	%icc,	%o4,	%i6
	edge8ln	%g6,	%i0,	%o6
	move	%icc,	%g5,	%g1
	tl	%icc,	0x6
	movg	%icc,	%o7,	%l4
	fpsub16	%f24,	%f28,	%f28
	fmuld8ulx16	%f16,	%f6,	%f8
	tcc	%icc,	0x1
	fands	%f16,	%f23,	%f1
	wr	%g0,	0x10,	%asi
	ldsba	[%l7 + 0x1E] %asi,	%l0
	sdivcc	%l2,	0x06F1,	%l1
	fbge,a	%fcc3,	loop_2827
	fmovdpos	%icc,	%f25,	%f29
	tcc	%icc,	0x6
	tvc	%xcc,	0x4
loop_2827:
	xorcc	%o0,	%g4,	%i4
	fmovdvc	%icc,	%f29,	%f22
	edge16l	%l6,	%i7,	%i3
	mova	%icc,	%o2,	%g3
	move	%icc,	%i2,	%i1
	movcs	%xcc,	%o1,	%l5
	sub	%l3,	0x1822,	%g2
	fmovrse	%g7,	%f8,	%f2
	brgz	%o5,	loop_2828
	for	%f6,	%f14,	%f12
	movgu	%xcc,	%i5,	%o4
	and	%o3,	%g6,	%i6
loop_2828:
	movcs	%icc,	%i0,	%g5
	add	%l7,	0x4C,	%l6
	wr	%g0,	0x04,	%asi
	lda	[%l6] %asi,	%g1
	casa	[%l6] 0x04,	%g1,	%o6
	movcc	%xcc,	%o7,	%l0
	fpackfix	%f28,	%f3
	mulscc	%l4,	%l1,	%o0
	edge16	%g4,	%i4,	%l6
	movrgez	%l2,	0x3C3,	%i7
	prefetch	[%l7 + 0x44],	 0x0
	movvc	%icc,	%i3,	%o2
	umulcc	%i2,	0x024D,	%i1
	movrgz	%g3,	0x389,	%l5
	movl	%xcc,	%l3,	%g2
	movne	%icc,	%o1,	%g7
	andn	%i5,	0x1B92,	%o5
	fnot1s	%f1,	%f23
	for	%f16,	%f12,	%f12
	flush	%l7 + 0x54
	flush	%l7 + 0x58
	srl	%o3,	0x03,	%o4
	movle	%xcc,	%i6,	%g6
	fmul8sux16	%f22,	%f4,	%f28
	mulx	%i0,	%g5,	%o6
	and	%o7,	%g1,	%l0
	ldx	[%l7 + 0x78],	%l1
	sdiv	%o0,	0x043F,	%l4
	brnz,a	%i4,	loop_2829
	fmovdge	%icc,	%f22,	%f29
	edge32n	%l6,	%g4,	%l2
	edge16n	%i3,	%o2,	%i2
loop_2829:
	subcc	%i7,	%i1,	%g3
	wr	%g0,	0x04,	%asi
	ldsha	[%l7 + 0x18] %asi,	%l3
	movgu	%xcc,	%l5,	%g2
	movg	%xcc,	%g7,	%i5
	edge16	%o1,	%o3,	%o5
	sdivx	%o4,	0x1BC7,	%g6
	xnorcc	%i0,	0x1EE2,	%g5
	tl	%xcc,	0x5
	tvc	%xcc,	0x3
	udivcc	%o6,	0x087E,	%i6
	xnorcc	%o7,	0x1579,	%g1
	wr	%g0,	0xe2,	%asi
	stxa	%l1,	[%l7 + 0x58] %asi
	membar	#Sync
	edge32	%l0,	%l4,	%i4
	nop
	setx	0xB38EE10B,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f24
	setx	0xC035D669,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f23
	fmuls	%f23,	%f24,	%f14
	array16	%l6,	%o0,	%l2
	fmovsgu	%xcc,	%f30,	%f12
	tle	%xcc,	0x5
	edge8n	%i3,	%o2,	%i2
	set	0x50, %o4
	lda	[%l7 + %o4] 0x04,	%f19
	edge16ln	%i7,	%g4,	%i1
	movcc	%xcc,	%g3,	%l3
	fnegs	%f22,	%f31
	popc	%g2,	%g7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrsgz	%i5,	%f28,	%f9
	andcc	%o1,	%o3,	%l5
	movleu	%icc,	%o4,	%o5
	fmovd	%f14,	%f10
	brnz	%i0,	loop_2830
	edge32ln	%g6,	%g5,	%o6
	bpos	%icc,	loop_2831
	st	%f27,	[%l7 + 0x14]
loop_2830:
	fmovdge	%xcc,	%f15,	%f26
	smul	%o7,	%i6,	%l1
loop_2831:
	fpadd32s	%f14,	%f5,	%f29
	nop
	setx	0xB849BB65507DC9E6,	%l0,	%l6
	stx	%l6,	[%l7 + 0x40]
	ldx	[%l7 + 0x40],	%fsr
	tle	%icc,	0x4
	tsubcc	%l0,	0x121C,	%l4
	tge	%xcc,	0x2
	prefetch	[%l7 + 0x08],	 0x2
	movne	%icc,	%g1,	%i4
	fpsub16s	%f8,	%f12,	%f0
	fnegs	%f11,	%f12
	bvc	loop_2832
	edge16	%o0,	%l2,	%i3
	edge8n	%l6,	%o2,	%i7
	mulscc	%i2,	%g4,	%g3
loop_2832:
	movrlez	%i1,	0x362,	%l3
	fand	%f24,	%f30,	%f22
	brlz	%g2,	loop_2833
	fnor	%f18,	%f4,	%f20
	ldsh	[%l7 + 0x58],	%i5
	movl	%xcc,	%g7,	%o3
loop_2833:
	tgu	%xcc,	0x7
	nop
	setx	loop_2834,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fmovsl	%icc,	%f6,	%f7
	movpos	%icc,	%o1,	%o4
	fnot1	%f0,	%f10
loop_2834:
	nop
	set	0x6E, %g7
	ldstuba	[%l7 + %g7] 0x89,	%l5
	edge16	%o5,	%g6,	%g5
	tgu	%icc,	0x7
	brgz,a	%o6,	loop_2835
	orcc	%o7,	%i0,	%i6
	movcs	%xcc,	%l1,	%l4
	andn	%g1,	%l0,	%o0
loop_2835:
	sub	%i4,	0x182F,	%i3
	sub	%l6,	%o2,	%i7
	alignaddr	%l2,	%g4,	%g3
	sll	%i1,	0x0D,	%i2
	nop
	fitos	%f7,	%f24
	umulcc	%g2,	0x0636,	%l3
	brnz	%i5,	loop_2836
	andcc	%o3,	%o1,	%g7
	ldsh	[%l7 + 0x46],	%l5
	nop
	set	0x21, %g4
	ldub	[%l7 + %g4],	%o4
loop_2836:
	sdiv	%o5,	0x196A,	%g5
	nop
	setx loop_2837, %l0, %l1
	jmpl %l1, %g6
	tcc	%icc,	0x7
	stb	%o7,	[%l7 + 0x23]
	movne	%xcc,	%i0,	%o6
loop_2837:
	tleu	%icc,	0x6
	alignaddrl	%l1,	%l4,	%g1
	tge	%icc,	0x0
	movle	%icc,	%i6,	%l0
	fbug	%fcc2,	loop_2838
	movg	%xcc,	%o0,	%i3
	fmovspos	%xcc,	%f4,	%f28
	move	%icc,	%l6,	%o2
loop_2838:
	sethi	0x1A31,	%i4
	taddcctv	%l2,	0x00A1,	%i7
	subcc	%g3,	0x1E44,	%i1
	movvc	%icc,	%g4,	%i2
	udivx	%l3,	0x124B,	%g2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sra	%o3,	%i5,	%o1
	fmovsgu	%xcc,	%f4,	%f28
	andcc	%g7,	0x174D,	%l5
	movge	%icc,	%o4,	%o5
	movvs	%icc,	%g6,	%o7
	nop 	! 	nop 	! 	wr	%g0,	0x40,	%asi ripped by fixASI40.pl ripped by fixASI40.pl
	nop 	! 	nop 	! 	ldxa	[%g0 + 0x148] %asi,	%i0 ripped by fixASI40.pl ripped by fixASI40.pl
	umulcc	%o6,	%l1,	%g5
	ldd	[%l7 + 0x40],	%g0
	addcc	%i6,	0x1334,	%l0
	wr	%g0,	0x89,	%asi
	lda	[%l7 + 0x58] %asi,	%f14
	popc	%l4,	%i3
	nop
	fitos	%f11,	%f13
	fstod	%f13,	%f18
	addc	%o0,	%o2,	%l6
	fbu,a	%fcc0,	loop_2839
	umul	%l2,	%i4,	%g3
	tvs	%icc,	0x6
	fcmpne16	%f2,	%f26,	%i1
loop_2839:
	udiv	%g4,	0x19D8,	%i2
	edge8ln	%l3,	%i7,	%g2
	fpadd32	%f22,	%f2,	%f8
	tleu	%xcc,	0x0
	alignaddr	%i5,	%o1,	%o3
	bvs,a	%icc,	loop_2840
	fzeros	%f28
	tg	%xcc,	0x3
	sll	%g7,	%l5,	%o5
loop_2840:
	nop
	set	0x38, %i2
	stwa	%o4,	[%l7 + %i2] 0x11
	sir	0x0E67
	edge32n	%g6,	%o7,	%o6
	ta	%icc,	0x1
	addcc	%l1,	0x1CCF,	%g5
	movrlz	%i0,	%i6,	%g1
	fbge	%fcc2,	loop_2841
	srlx	%l0,	%l4,	%o0
	smul	%o2,	0x1D89,	%l6
	alignaddrl	%l2,	%i3,	%g3
loop_2841:
	sdivx	%i4,	0x1818,	%g4
	ldsh	[%l7 + 0x10],	%i2
	popc	0x1C71,	%l3
	tl	%xcc,	0x6
	subccc	%i1,	%g2,	%i5
	addc	%i7,	%o3,	%g7
	fcmple32	%f4,	%f16,	%l5
	udivx	%o1,	0x023D,	%o4
	prefetch	[%l7 + 0x08],	 0x3
	movneg	%icc,	%g6,	%o7
	bg,a	%icc,	loop_2842
	movvc	%xcc,	%o6,	%o5
	fmovdcc	%xcc,	%f30,	%f29
	smul	%l1,	%i0,	%g5
loop_2842:
	fmul8x16	%f9,	%f2,	%f10
	stx	%i6,	[%l7 + 0x28]
	fpadd32	%f0,	%f6,	%f28
	fmovdg	%icc,	%f15,	%f13
	fpadd32	%f10,	%f28,	%f6
	bvc,a,pt	%xcc,	loop_2843
	edge16l	%l0,	%g1,	%l4
	smul	%o0,	0x0919,	%l6
	addcc	%o2,	0x01B4,	%i3
loop_2843:
	tleu	%xcc,	0x5
	array32	%g3,	%l2,	%i4
	brgz	%g4,	loop_2844
	edge8	%i2,	%l3,	%i1
	xorcc	%i5,	0x0529,	%i7
	move	%xcc,	%o3,	%g2
loop_2844:
	andn	%l5,	%o1,	%o4
	tl	%xcc,	0x3
	bg	loop_2845
	srax	%g7,	%g6,	%o6
	nop
	setx	0xBD614FA70058FF13,	%l0,	%l6
	stx	%l6,	[%l7 + 0x10]
	ldx	[%l7 + 0x10],	%fsr
	alignaddr	%o7,	%o5,	%i0
loop_2845:
	tsubcc	%l1,	0x02E2,	%g5
	smulcc	%l0,	0x006A,	%i6
	subccc	%l4,	%o0,	%l6
	nop
	setx	loop_2846,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movrgz	%o2,	0x045,	%i3
	movleu	%xcc,	%g3,	%g1
	ta	%xcc,	0x2
loop_2846:
	sub	%i4,	%l2,	%g4
	fzeros	%f0
	ba,a	loop_2847
	fmovde	%xcc,	%f26,	%f12
	movge	%xcc,	%l3,	%i1
	tvs	%xcc,	0x2
loop_2847:
	nop
	add	%l7,	0x48,	%l6
	wr	%g0,	0x04,	%asi
	casxa	[%l6] %asi,	%i2,	%i7
	set	0x20, %o6
	lduha	[%l7 + %o6] 0x04,	%i5
	tcs	%xcc,	0x0
	fmovdn	%icc,	%f4,	%f22
	nop
	setx	0x404921C5,	%l0,	%l6
	st	%l6,	[%l7 + 0x60]
	ld	[%l7 + 0x60],	%fsr
	fmovdn	%xcc,	%f8,	%f15
	movl	%icc,	%g2,	%l5
	nop
	setx	0xD05DC2DA,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f13
	setx	0x3B9E2CA3,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f21
	fmuls	%f21,	%f13,	%f3
	prefetch	[%l7 + 0x08],	 0x2
	movrlz	%o3,	0x285,	%o4
	fbul	%fcc3,	loop_2848
	tn	%icc,	0x0
	swap	[%l7 + 0x64],	%g7
	ldsh	[%l7 + 0x5C],	%o1
loop_2848:
	fbug	%fcc3,	loop_2849
	edge32ln	%g6,	%o6,	%o7
	edge32	%i0,	%l1,	%o5
	fzeros	%f29
loop_2849:
	movrne	%g5,	%i6,	%l4
	movgu	%icc,	%l0,	%l6
	fmovsl	%xcc,	%f21,	%f9
	stbar
	fors	%f6,	%f13,	%f31
	fbue	%fcc0,	loop_2850
	fmovrse	%o2,	%f11,	%f12
	tcs	%xcc,	0x7
	bne,a,pt	%xcc,	loop_2851
loop_2850:
	fabsd	%f30,	%f16
	fbule,a	%fcc3,	loop_2852
	array8	%o0,	%g3,	%g1
loop_2851:
	fbug,a	%fcc1,	loop_2853
	edge8l	%i3,	%l2,	%g4
loop_2852:
	tcs	%xcc,	0x5
	taddcc	%i4,	0x1C52,	%i1
loop_2853:
	edge8	%l3,	%i7,	%i5
	sdiv	%g2,	0x15B9,	%l5
	smul	%i2,	%o4,	%o3
	alignaddr	%o1,	%g7,	%g6
	fpadd16	%f2,	%f6,	%f24
	fmovrslz	%o6,	%f7,	%f10
	addccc	%i0,	%o7,	%o5
	ldsb	[%l7 + 0x4F],	%l1
	taddcctv	%g5,	%i6,	%l4
	ldsw	[%l7 + 0x30],	%l6
	tcs	%icc,	0x7
	fmovrse	%o2,	%f14,	%f24
	orncc	%o0,	0x12E4,	%g3
	fbn	%fcc0,	loop_2854
	bcc,pn	%icc,	loop_2855
	mova	%icc,	%g1,	%l0
	umul	%i3,	0x1839,	%g4
loop_2854:
	movcs	%xcc,	%i4,	%l2
loop_2855:
	edge8ln	%l3,	%i1,	%i5
	ble,a	%icc,	loop_2856
	nop
	setx	0x2F2881E4,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f29
	setx	0x45A61C24,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f29
	fsubs	%f29,	%f29,	%f18
	edge8ln	%g2,	%i7,	%i2
	fbe	%fcc1,	loop_2857
loop_2856:
	udiv	%o4,	0x1D90,	%o3
	swap	[%l7 + 0x78],	%o1
	fbn	%fcc2,	loop_2858
loop_2857:
	ble,a,pt	%xcc,	loop_2859
	bneg,pn	%xcc,	loop_2860
	nop
	fitod	%f6,	%f10
	fdtos	%f10,	%f2
loop_2858:
	movrne	%g7,	%g6,	%o6
loop_2859:
	alignaddrl	%l5,	%o7,	%o5
loop_2860:
	xnor	%l1,	%i0,	%i6
	popc	0x0AED,	%l4
	tcc	%xcc,	0x1
	udivcc	%l6,	0x0904,	%g5
	array32	%o0,	%g3,	%g1
	fmovsvc	%icc,	%f18,	%f2
	stb	%l0,	[%l7 + 0x1B]
	wr	%g0,	0x89,	%asi
	stwa	%i3,	[%l7 + 0x6C] %asi
	movrne	%o2,	%g4,	%i4
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
	lduw	[%l7 + 0x58],	%l3
	fbul,a	%fcc0,	loop_2862
	fmul8x16	%f10,	%f0,	%f16
loop_2861:
	xnorcc	%l2,	%i1,	%g2
	bvs	loop_2863
loop_2862:
	fpsub32s	%f3,	%f9,	%f27
	wr	%g0,	0x89,	%asi
	ldsha	[%l7 + 0x2C] %asi,	%i7
loop_2863:
	add	%i2,	%o4,	%i5
	addcc	%o3,	%g7,	%g6
	ld	[%l7 + 0x3C],	%f11
	membar	0x6E
	nop
	fitos	%f8,	%f9
	fstox	%f9,	%f18
	fxtos	%f18,	%f28
	fba	%fcc3,	loop_2864
	fands	%f12,	%f31,	%f2
	sth	%o1,	[%l7 + 0x6E]
	subcc	%o6,	0x103F,	%o7
loop_2864:
	popc	0x1F0E,	%l5
	movn	%xcc,	%o5,	%i0
	addc	%i6,	%l1,	%l4
	wr	%g0,	0x10,	%asi
	ldstuba	[%l7 + 0x41] %asi,	%g5
	tgu	%xcc,	0x4
	wr	%g0,	0x2a,	%asi
	stxa	%l6,	[%l7 + 0x70] %asi
	membar	#Sync
	brlez	%o0,	loop_2865
	movre	%g1,	%l0,	%i3
	brnz,a	%o2,	loop_2866
	bvs,a	loop_2867
loop_2865:
	fmovdcc	%xcc,	%f10,	%f13
	movneg	%icc,	%g4,	%i4
loop_2866:
	be,pt	%icc,	loop_2868
loop_2867:
	tvc	%icc,	0x7
	wr	%g0,	0x89,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
loop_2868:
	nop
	setx	0x36757B67,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f19
	setx	0x460BC19D,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f18
	fsubs	%f18,	%f19,	%f17
	srax	%g3,	0x19,	%l2
	edge32	%i1,	%l3,	%i7
	smul	%g2,	%o4,	%i5
	fmovsneg	%xcc,	%f1,	%f24
	edge32	%i2,	%g7,	%o3
	movcc	%icc,	%g6,	%o1
	st	%f17,	[%l7 + 0x24]
	bl,pn	%icc,	loop_2869
	fblg,a	%fcc3,	loop_2870
	sdiv	%o6,	0x0F5B,	%l5
	fsrc2	%f24,	%f24
loop_2869:
	tleu	%icc,	0x0
loop_2870:
	ta	%icc,	0x6
	srax	%o5,	%o7,	%i0
	srlx	%i6,	%l4,	%l1
	edge16n	%l6,	%o0,	%g1
	fornot2s	%f3,	%f16,	%f4
	mova	%icc,	%l0,	%g5
	add	%o2,	0x14AE,	%i3
	bshuffle	%f12,	%f16,	%f10
	nop
	setx	0xBD0BFA38,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f3
	setx	0xB54542D5,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f7
	fadds	%f7,	%f3,	%f30
	array32	%g4,	%i4,	%g3
	movcc	%icc,	%l2,	%l3
	tneg	%xcc,	0x1
	edge8n	%i1,	%g2,	%i7
	brlez,a	%i5,	loop_2871
	edge32ln	%i2,	%g7,	%o3
	xor	%g6,	0x1C5F,	%o4
	fmovsge	%xcc,	%f11,	%f29
loop_2871:
	fbue,a	%fcc1,	loop_2872
	nop
	setx	0xF730F710E079B85B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x68]
	ldx	[%l7 + 0x68],	%fsr
	add	%l7,	0x70,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%o1
	casxa	[%l6] %asi,	%o1,	%o6
loop_2872:
	bleu,a,pt	%xcc,	loop_2873
	alignaddr	%l5,	%o7,	%i0
	andncc	%i6,	%l4,	%o5
	nop
	fitos	%f0,	%f10
	fstox	%f10,	%f26
loop_2873:
	edge32n	%l1,	%l6,	%g1
	st	%f0,	[%l7 + 0x2C]
	wr	%g0,	0x10,	%asi
	swapa	[%l7 + 0x30] %asi,	%o0
	orcc	%g5,	0x171A,	%l0
	movn	%icc,	%i3,	%o2
	movre	%i4,	%g3,	%g4
	movg	%xcc,	%l3,	%l2
	fnot2	%f28,	%f30
	fbe,a	%fcc2,	loop_2874
	call	loop_2875
	movrgez	%g2,	0x24B,	%i1
	movpos	%icc,	%i5,	%i7
loop_2874:
	edge8l	%i2,	%o3,	%g7
loop_2875:
	fbule	%fcc0,	loop_2876
	movge	%icc,	%g6,	%o4
	fornot1	%f22,	%f16,	%f10
	alignaddrl	%o1,	%l5,	%o7
loop_2876:
	movrlez	%o6,	%i0,	%i6
	sethi	0x1EC8,	%o5
	set	0x3C, %l1
	lda	[%l7 + %l1] 0x81,	%f1
	sir	0x1FA7
	add	%l4,	%l6,	%l1
	andncc	%g1,	%o0,	%g5
	addcc	%i3,	0x10F0,	%o2
	set	0x48, %l0
	ldxa	[%l7 + %l0] 0x80,	%l0
	movne	%xcc,	%g3,	%g4
	membar	0x48
	te	%xcc,	0x3
	fbo,a	%fcc3,	loop_2877
	xorcc	%l3,	0x1A0E,	%i4
	add	%l2,	%g2,	%i5
	alignaddrl	%i1,	%i7,	%i2
loop_2877:
	brgez,a	%o3,	loop_2878
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andncc	%g6,	%o4,	%g7
	te	%icc,	0x7
loop_2878:
	std	%f6,	[%l7 + 0x40]
	bcs,pt	%xcc,	loop_2879
	sub	%o1,	%o7,	%l5
	movl	%icc,	%i0,	%i6
	wr	%g0,	0x80,	%asi
	ldxa	[%l7 + 0x10] %asi,	%o5
loop_2879:
	subcc	%o6,	%l6,	%l1
	movre	%g1,	0x1A4,	%l4
	fnands	%f21,	%f25,	%f24
	edge16	%o0,	%i3,	%g5
	addccc	%l0,	0x1FD8,	%o2
	fnor	%f8,	%f6,	%f12
	movl	%icc,	%g4,	%l3
	fmovsneg	%xcc,	%f21,	%f5
	udivx	%g3,	0x1767,	%l2
	tcc	%xcc,	0x2
	fpsub16	%f6,	%f12,	%f24
	bvc,pn	%xcc,	loop_2880
	tvc	%xcc,	0x0
	membar	0x66
	fmovdn	%icc,	%f23,	%f15
loop_2880:
	movrgz	%g2,	%i4,	%i5
	smul	%i7,	0x17D5,	%i2
	set	0x40, %o2
	prefetcha	[%l7 + %o2] 0x11,	 0x3
	fmovspos	%icc,	%f5,	%f9
	fbule,a	%fcc0,	loop_2881
	nop
	fitos	%f5,	%f2
	fstoi	%f2,	%f0
	brlez,a	%i1,	loop_2882
	bge,a,pt	%icc,	loop_2883
loop_2881:
	brlez,a	%g6,	loop_2884
	be,pt	%icc,	loop_2885
loop_2882:
	umul	%o4,	0x1BFE,	%o1
loop_2883:
	fpadd32	%f2,	%f16,	%f18
loop_2884:
	andn	%g7,	%o7,	%i0
loop_2885:
	nop
	fitod	%f8,	%f8
	fdtox	%f8,	%f20
	fxtod	%f20,	%f2
	fpsub32s	%f10,	%f6,	%f17
	tge	%xcc,	0x3
	fmovrdne	%l5,	%f2,	%f0
	sub	%o5,	0x0AFB,	%o6
	ble,a	%xcc,	loop_2886
	bge,pt	%icc,	loop_2887
	fbuge,a	%fcc0,	loop_2888
	nop
	fitod	%f30,	%f30
loop_2886:
	edge16	%i6,	%l6,	%g1
loop_2887:
	edge16l	%l4,	%o0,	%i3
loop_2888:
	fblg,a	%fcc3,	loop_2889
	subccc	%l1,	%l0,	%g5
	ldsw	[%l7 + 0x10],	%o2
	andn	%l3,	0x1623,	%g4
loop_2889:
	edge16ln	%g3,	%l2,	%g2
	tge	%icc,	0x6
	brnz	%i5,	loop_2890
	xor	%i4,	%i7,	%o3
	tvc	%icc,	0x7
	movrlz	%i2,	0x208,	%i1
loop_2890:
	movgu	%icc,	%o4,	%o1
	edge16l	%g6,	%o7,	%i0
	fsrc2	%f8,	%f12
	set	0x58, %i7
	lda	[%l7 + %i7] 0x15,	%f7
	movneg	%xcc,	%g7,	%o5
	taddcctv	%o6,	0x1B15,	%l5
	movrlez	%l6,	0x25F,	%g1
	edge32l	%l4,	%o0,	%i6
	udivx	%l1,	0x019C,	%l0
	movcs	%icc,	%i3,	%o2
	movge	%xcc,	%l3,	%g4
	wr	%g0,	0x18,	%asi
	ldsba	[%l7 + 0x23] %asi,	%g5
	udiv	%g3,	0x1FF1,	%l2
	fmuld8sux16	%f20,	%f22,	%f16
	sdivx	%i5,	0x167F,	%i4
	mulscc	%g2,	%i7,	%o3
	fbue	%fcc3,	loop_2891
	andncc	%i2,	%o4,	%o1
	subccc	%g6,	0x11E9,	%i1
	brgz	%o7,	loop_2892
loop_2891:
	nop
	setx	0x014845F97026CADF,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0x52652729B1E28077,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	fdivd	%f26,	%f16,	%f24
	tcs	%icc,	0x0
	xorcc	%i0,	%o5,	%g7
loop_2892:
	subcc	%o6,	%l5,	%l6
	wr	%g0,	0xf9,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
	edge16ln	%g1,	%l4,	%o0
	mulscc	%l1,	%i6,	%l0
	move	%xcc,	%i3,	%o2
	xor	%g4,	0x0793,	%l3
	movpos	%xcc,	%g5,	%g3
	alignaddr	%i5,	%i4,	%l2
	subccc	%i7,	%g2,	%o3
	srl	%o4,	%o1,	%i2
	fblg	%fcc3,	loop_2893
	movn	%icc,	%g6,	%o7
	fmovsleu	%xcc,	%f22,	%f3
	xnorcc	%i1,	%o5,	%g7
loop_2893:
	taddcc	%o6,	%i0,	%l5
	fbo,a	%fcc0,	loop_2894
	tleu	%icc,	0x4
	fbul	%fcc3,	loop_2895
	brz	%l6,	loop_2896
loop_2894:
	alignaddrl	%g1,	%l4,	%l1
	udivcc	%i6,	0x0F88,	%o0
loop_2895:
	movcc	%icc,	%l0,	%o2
loop_2896:
	call	loop_2897
	srax	%i3,	%g4,	%l3
	xor	%g5,	%i5,	%i4
	movrgz	%g3,	0x307,	%i7
loop_2897:
	movneg	%icc,	%l2,	%g2
	or	%o4,	0x1CF5,	%o1
	fba,a	%fcc1,	loop_2898
	movle	%xcc,	%i2,	%o3
	fabsd	%f28,	%f30
	movrgez	%g6,	0x09E,	%o7
loop_2898:
	orcc	%o5,	0x1A18,	%g7
	call	loop_2899
	sdivcc	%i1,	0x0BD3,	%i0
	fpadd16	%f16,	%f26,	%f8
	fbne,a	%fcc3,	loop_2900
loop_2899:
	or	%o6,	%l5,	%l6
	tge	%icc,	0x5
	fcmple16	%f14,	%f22,	%l4
loop_2900:
	umul	%l1,	0x19C8,	%g1
	srlx	%o0,	%l0,	%i6
	fpsub16	%f10,	%f0,	%f20
	movge	%xcc,	%i3,	%o2
	fcmple32	%f28,	%f6,	%g4
	addc	%l3,	0x060C,	%i5
	movrlz	%i4,	%g3,	%i7
	tsubcc	%l2,	%g5,	%g2
	tcs	%icc,	0x7
	nop
	fitos	%f3,	%f22
	fstox	%f22,	%f18
	add	%l7,	0x78,	%l6
	wr	%g0,	0x04,	%asi
	casa	[%l6] %asi,	%o1,	%i2
	andcc	%o3,	0x05A4,	%g6
	fands	%f4,	%f4,	%f30
	bn,a,pn	%xcc,	loop_2901
	movvc	%xcc,	%o4,	%o5
	movre	%g7,	%o7,	%i0
	edge16	%i1,	%o6,	%l5
loop_2901:
	fnot2	%f26,	%f12
	fmovsgu	%xcc,	%f29,	%f2
	set	0x8, %l4
	stxa	%l4,	[%g0 + %l4] 0x21
	and	%l1,	0x1F10,	%l6
	edge32n	%g1,	%o0,	%l0
	membar	0x5C
	movvc	%icc,	%i6,	%o2
	orn	%g4,	%l3,	%i5
	te	%xcc,	0x3
	sdivcc	%i4,	0x1C80,	%i3
	bn	loop_2902
	sll	%g3,	%l2,	%i7
	sllx	%g5,	0x07,	%o1
	add	%i2,	0x192C,	%g2
loop_2902:
	fbo,a	%fcc2,	loop_2903
	udivcc	%g6,	0x1D01,	%o3
	tsubcc	%o4,	%o5,	%o7
	fbue,a	%fcc3,	loop_2904
loop_2903:
	bleu	loop_2905
	membar	0x40
	bshuffle	%f30,	%f6,	%f12
loop_2904:
	bn,a,pt	%icc,	loop_2906
loop_2905:
	tvs	%icc,	0x2
	fcmpne16	%f14,	%f0,	%g7
	fsrc1s	%f26,	%f7
loop_2906:
	fpsub16s	%f7,	%f9,	%f29
	or	%i0,	%i1,	%l5
	nop
	setx loop_2907, %l0, %l1
	jmpl %l1, %l4
	orn	%l1,	0x1CC3,	%l6
	addccc	%g1,	0x087F,	%o0
	xorcc	%l0,	%i6,	%o6
loop_2907:
	tsubcc	%o2,	0x0B47,	%l3
	tg	%icc,	0x3
	fmovdg	%icc,	%f26,	%f2
	fbne,a	%fcc2,	loop_2908
	movleu	%icc,	%i5,	%i4
	nop
	setx	0x7C304AA4307C7E67,	%l0,	%l6
	stx	%l6,	[%l7 + 0x48]
	ldx	[%l7 + 0x48],	%fsr
	ta	%icc,	0x0
loop_2908:
	movgu	%icc,	%g4,	%i3
	fmovsvc	%xcc,	%f12,	%f6
	bpos,a	loop_2909
	fbge,a	%fcc2,	loop_2910
	fabsd	%f18,	%f0
	sll	%g3,	%i7,	%g5
loop_2909:
	fandnot1	%f18,	%f20,	%f26
loop_2910:
	tneg	%xcc,	0x7
	bvc	%icc,	loop_2911
	tvs	%xcc,	0x0
	srax	%o1,	%i2,	%l2
	bneg,pt	%xcc,	loop_2912
loop_2911:
	fmovsne	%icc,	%f28,	%f1
	smulcc	%g6,	%o3,	%g2
	fmovspos	%icc,	%f8,	%f31
loop_2912:
	fmovsne	%icc,	%f1,	%f15
	movre	%o4,	0x3A0,	%o7
	be	%icc,	loop_2913
	bgu,pn	%xcc,	loop_2914
	bl,a	%icc,	loop_2915
	andncc	%g7,	%o5,	%i1
loop_2913:
	mova	%xcc,	%l5,	%i0
loop_2914:
	ldd	[%l7 + 0x20],	%l4
loop_2915:
	fmovsne	%icc,	%f23,	%f8
	edge32l	%l6,	%g1,	%o0
	fbo	%fcc1,	loop_2916
	movle	%icc,	%l0,	%i6
	tn	%icc,	0x2
	fnands	%f28,	%f29,	%f8
loop_2916:
	fcmpeq16	%f28,	%f4,	%l1
	movneg	%icc,	%o2,	%l3
	smulcc	%i5,	0x0346,	%o6
	fcmpeq32	%f22,	%f30,	%g4
	fmovrdgez	%i4,	%f14,	%f18
	movrgez	%i3,	%g3,	%g5
	tneg	%xcc,	0x6
	stb	%o1,	[%l7 + 0x6A]
	bl	loop_2917
	srl	%i2,	%l2,	%g6
	fnegs	%f3,	%f4
	fmovscs	%xcc,	%f16,	%f21
loop_2917:
	nop
	setx	0x3F7E9FF7,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f21
	setx	0x49B3A950,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f4
	fdivs	%f4,	%f21,	%f8
	movn	%xcc,	%i7,	%o3
	fmovsvs	%xcc,	%f7,	%f18
	mulx	%o4,	0x10E8,	%g2
	movle	%icc,	%o7,	%o5
	movn	%icc,	%g7,	%l5
	movn	%icc,	%i0,	%l4
	orncc	%l6,	0x1202,	%g1
	movvc	%xcc,	%i1,	%l0
	popc	%i6,	%l1
	edge32	%o2,	%l3,	%i5
	addc	%o6,	%o0,	%i4
	addccc	%i3,	%g4,	%g3
	fmovsg	%xcc,	%f28,	%f20
	movne	%xcc,	%g5,	%o1
	wr	%g0,	0x80,	%asi
	lduha	[%l7 + 0x08] %asi,	%l2
	fblg	%fcc3,	loop_2918
	tpos	%xcc,	0x7
	fpsub32s	%f11,	%f10,	%f26
	fbg	%fcc1,	loop_2919
loop_2918:
	umulcc	%g6,	%i2,	%o3
	fcmpeq16	%f24,	%f16,	%i7
	movgu	%xcc,	%o4,	%g2
loop_2919:
	srl	%o7,	%o5,	%g7
	udiv	%l5,	0x01D6,	%l4
	ldsw	[%l7 + 0x3C],	%i0
	membar	0x38
	bge	loop_2920
	tcs	%xcc,	0x7
	sra	%l6,	%i1,	%g1
	tvs	%icc,	0x1
loop_2920:
	mulx	%i6,	%l1,	%l0
	fbge,a	%fcc1,	loop_2921
	movrlez	%l3,	0x18F,	%o2
	xor	%i5,	0x1144,	%o0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2921:
	tvc	%xcc,	0x0
	bvs	%icc,	loop_2922
	edge16n	%o6,	%i4,	%g4
	mulscc	%g3,	%i3,	%g5
	movle	%icc,	%l2,	%g6
loop_2922:
	edge32n	%i2,	%o1,	%i7
	fpsub16	%f22,	%f22,	%f14
	sethi	0x1F27,	%o4
	edge8	%o3,	%g2,	%o7
	sra	%g7,	0x02,	%l5
	smulcc	%l4,	0x13B9,	%o5
	xor	%l6,	0x0E80,	%i1
	fbg	%fcc1,	loop_2923
	movre	%g1,	0x122,	%i6
	movle	%icc,	%l1,	%i0
	fmovsn	%icc,	%f7,	%f28
loop_2923:
	ta	%icc,	0x3
	wr	%g0,	0x80,	%asi
	lduha	[%l7 + 0x5C] %asi,	%l0
	wr	%g0,	0x04,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	andn	%l3,	0x02A7,	%i5
	movge	%xcc,	%o2,	%o0
	fandnot1s	%f6,	%f10,	%f21
	sdivcc	%i4,	0x1422,	%o6
	te	%icc,	0x0
	te	%xcc,	0x2
	bleu	loop_2924
	tl	%icc,	0x4
	movrlez	%g4,	0x286,	%i3
	subc	%g3,	%l2,	%g5
loop_2924:
	edge8n	%i2,	%g6,	%i7
	movg	%xcc,	%o1,	%o3
	udivx	%g2,	0x02FC,	%o7
	xnorcc	%g7,	0x197D,	%l5
	bcc,pn	%icc,	loop_2925
	srl	%o4,	%o5,	%l6
	brlz,a	%l4,	loop_2926
	fpsub16	%f26,	%f0,	%f8
loop_2925:
	nop
	wr	%g0,	0x89,	%asi
	prefetcha	[%l7 + 0x70] %asi,	 0x2
loop_2926:
	fcmpne32	%f2,	%f20,	%g1
	nop
	setx	0x0B1EE6FA,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f16
	setx	0x7934A485,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f11
	fsubs	%f11,	%f16,	%f26
	nop
	setx	0xB85490C9B2AEE0BB,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0xC7E6B410B37202E8,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	fsubd	%f14,	%f24,	%f10
	tleu	%icc,	0x2
	ld	[%l7 + 0x48],	%f22
	addcc	%l1,	%i6,	%l0
	fmovdvs	%icc,	%f5,	%f18
	fmuld8ulx16	%f7,	%f13,	%f30
	fbo,a	%fcc2,	loop_2927
	movrgez	%i0,	%l3,	%o2
	addccc	%o0,	0x1F26,	%i5
	fnot2	%f30,	%f20
loop_2927:
	sra	%o6,	0x1B,	%g4
	movle	%icc,	%i4,	%g3
	ble,a	%icc,	loop_2928
	fornot1	%f18,	%f10,	%f8
	movge	%icc,	%l2,	%i3
	addc	%i2,	0x0A9C,	%g6
loop_2928:
	sdivcc	%i7,	0x1FD0,	%o1
	umulcc	%o3,	%g2,	%g5
	fzeros	%f20
	wr	%g0,	0x10,	%asi
	sta	%f25,	[%l7 + 0x08] %asi
	srl	%o7,	%g7,	%l5
	orn	%o5,	%l6,	%o4
	nop
	set	0x3A, %i0
	lduh	[%l7 + %i0],	%i1
	brgz	%l4,	loop_2929
	fbuge	%fcc2,	loop_2930
	membar	0x71
	movleu	%icc,	%l1,	%g1
loop_2929:
	movrne	%i6,	%l0,	%l3
loop_2930:
	subccc	%i0,	%o2,	%o0
	mulx	%i5,	%g4,	%i4
	ldsb	[%l7 + 0x61],	%o6
	fpadd32	%f26,	%f16,	%f8
	fmovsn	%xcc,	%f26,	%f15
	umul	%g3,	0x1DB7,	%i3
	movge	%icc,	%i2,	%g6
	subc	%l2,	0x1214,	%o1
	bneg,pn	%xcc,	loop_2931
	fbn,a	%fcc1,	loop_2932
	movcs	%xcc,	%i7,	%o3
	xorcc	%g5,	%o7,	%g2
loop_2931:
	movrgz	%g7,	%o5,	%l5
loop_2932:
	bl,a	%icc,	loop_2933
	array16	%o4,	%i1,	%l4
	movvc	%xcc,	%l1,	%l6
	te	%xcc,	0x5
loop_2933:
	for	%f2,	%f26,	%f10
	tcs	%xcc,	0x1
	fbne	%fcc2,	loop_2934
	fpack32	%f20,	%f16,	%f0
	fblg,a	%fcc1,	loop_2935
	movrgez	%g1,	%l0,	%i6
loop_2934:
	fornot2s	%f10,	%f2,	%f6
	wr	%g0,	0x18,	%asi
	swapa	[%l7 + 0x64] %asi,	%l3
loop_2935:
	fba	%fcc2,	loop_2936
	subc	%i0,	0x0001,	%o2
	call	loop_2937
	membar	0x40
loop_2936:
	bcs	loop_2938
	ba,a,pn	%xcc,	loop_2939
loop_2937:
	brgz,a	%i5,	loop_2940
	movle	%xcc,	%o0,	%g4
loop_2938:
	fornot2s	%f31,	%f8,	%f10
loop_2939:
	bne	loop_2941
loop_2940:
	movne	%xcc,	%o6,	%g3
	fmovrdlez	%i4,	%f14,	%f24
	nop
	setx	loop_2942,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_2941:
	smul	%i2,	%i3,	%l2
	ldstub	[%l7 + 0x17],	%g6
	fxor	%f20,	%f0,	%f18
loop_2942:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	brnz,a	%i7,	loop_2943
	fmovsge	%xcc,	%f31,	%f16
	fmovdne	%icc,	%f27,	%f0
	fpadd32s	%f13,	%f9,	%f31
loop_2943:
	nop
	set	0x50, %o7
	lda	[%l7 + %o7] 0x15,	%f26
	fbe,a	%fcc1,	loop_2944
	fones	%f2
	srl	%o1,	0x1D,	%g5
	nop
	set	0x38, %g3
	ldd	[%l7 + %g3],	%o6
loop_2944:
	nop
	set	0x18, %o5
	prefetcha	[%l7 + %o5] 0x11,	 0x0
	edge32l	%g2,	%g7,	%o5
	fbo	%fcc0,	loop_2945
	fbne	%fcc3,	loop_2946
	fnor	%f6,	%f8,	%f20
	fpsub32s	%f17,	%f1,	%f27
loop_2945:
	alignaddrl	%o4,	%i1,	%l4
loop_2946:
	movrlz	%l5,	%l1,	%g1
	andn	%l6,	0x1B12,	%i6
	bshuffle	%f30,	%f0,	%f6
	fmovdleu	%icc,	%f15,	%f27
	add	%l7,	0x30,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] %asi,	%l3,	%i0
	alignaddrl	%l0,	%i5,	%o2
	fbule,a	%fcc1,	loop_2947
	movgu	%icc,	%o0,	%o6
	fbg	%fcc3,	loop_2948
	tg	%icc,	0x3
loop_2947:
	xorcc	%g4,	%g3,	%i4
	nop
	setx	0x749B44E23C9E14E2,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0xA6C768C7D3B64A96,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fdivd	%f0,	%f2,	%f8
loop_2948:
	tl	%icc,	0x5
	wr	%g0,	0x52,	%asi
	ldxa	[%g0 + 0x210] %asi,	%i3
	fmovrdlz	%i2,	%f8,	%f12
	movgu	%xcc,	%g6,	%l2
	ldsw	[%l7 + 0x30],	%i7
	fornot1	%f18,	%f28,	%f4
	movge	%xcc,	%o1,	%o7
	sir	0x0283
	fmul8sux16	%f20,	%f22,	%f22
	edge8l	%o3,	%g5,	%g2
	sth	%o5,	[%l7 + 0x0E]
	tvc	%icc,	0x1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrgz	%o4,	%i1,	%g7
	fmovsn	%icc,	%f28,	%f26
	subccc	%l5,	0x116E,	%l1
	fmovdge	%icc,	%f17,	%f23
	edge32	%g1,	%l4,	%i6
	fbn	%fcc2,	loop_2949
	movcs	%icc,	%l3,	%i0
	fnot2s	%f10,	%f16
	sdiv	%l6,	0x08FE,	%l0
loop_2949:
	nop
	setx loop_2950, %l0, %l1
	jmpl %l1, %i5
	tsubcc	%o2,	0x13F1,	%o0
	fmovdg	%xcc,	%f5,	%f31
	nop
	setx	0x284554059F098533,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0xA20092755CD1094C,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	fmuld	%f12,	%f10,	%f20
loop_2950:
	fmovsg	%xcc,	%f0,	%f20
	nop
	setx	loop_2951,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fnegd	%f4,	%f26
	subcc	%o6,	%g4,	%i4
	xor	%i3,	0x046A,	%g3
loop_2951:
	fpsub16	%f2,	%f20,	%f22
	srl	%i2,	%l2,	%i7
	fone	%f2
	set	0x70, %g6
	ldxa	[%l7 + %g6] 0x18,	%o1
	srax	%o7,	%o3,	%g6
	stbar
	movcc	%icc,	%g5,	%o5
	wr	%g0,	0x11,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	bg,a	loop_2952
	fbg,a	%fcc1,	loop_2953
	fornot2	%f16,	%f24,	%f14
	movrgez	%g2,	%o4,	%i1
loop_2952:
	array32	%g7,	%l5,	%g1
loop_2953:
	movgu	%xcc,	%l4,	%l1
	set	0x1E, %i1
	lduba	[%l7 + %i1] 0x81,	%l3
	nop
	fitos	%f14,	%f14
	fstox	%f14,	%f4
	sethi	0x1912,	%i6
	fxnor	%f12,	%f2,	%f20
	sdivx	%i0,	0x165F,	%l6
	sethi	0x176D,	%l0
	srl	%o2,	%i5,	%o0
	brnz	%o6,	loop_2954
	fnands	%f7,	%f8,	%f10
	movrlez	%g4,	0x1D0,	%i4
	movvs	%icc,	%g3,	%i3
loop_2954:
	smulcc	%l2,	0x065C,	%i7
	movg	%xcc,	%i2,	%o1
	subc	%o7,	%o3,	%g6
	fmovsa	%xcc,	%f15,	%f9
	tn	%icc,	0x0
	movpos	%icc,	%o5,	%g2
	wr	%g0,	0x18,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	tneg	%xcc,	0x4
	fbne,a	%fcc0,	loop_2955
	bpos,pn	%xcc,	loop_2956
	andncc	%g5,	%o4,	%i1
	sth	%l5,	[%l7 + 0x66]
loop_2955:
	bvc,a	%icc,	loop_2957
loop_2956:
	fmovscs	%xcc,	%f10,	%f7
	fmovdge	%icc,	%f16,	%f3
	tvc	%icc,	0x5
loop_2957:
	alignaddr	%g1,	%g7,	%l4
	fmovse	%xcc,	%f6,	%f1
	xor	%l3,	0x1881,	%l1
	tsubcc	%i0,	%i6,	%l6
	fmovdpos	%xcc,	%f16,	%f18
	nop
	setx	loop_2958,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movrgez	%l0,	0x3DE,	%i5
	movrne	%o0,	0x3C3,	%o6
	add	%g4,	%o2,	%g3
loop_2958:
	movge	%icc,	%i4,	%i3
	xnor	%i7,	%i2,	%l2
	fone	%f10
	bleu,pn	%icc,	loop_2959
	fmovdvc	%xcc,	%f6,	%f17
	edge8	%o1,	%o3,	%g6
	addccc	%o5,	0x0D30,	%o7
loop_2959:
	fxors	%f11,	%f28,	%f19
	tne	%icc,	0x6
	andncc	%g5,	%g2,	%o4
	fnot1s	%f14,	%f25
	movle	%icc,	%i1,	%g1
	bneg,pn	%icc,	loop_2960
	edge16ln	%g7,	%l5,	%l3
	wr	%g0,	0xeb,	%asi
	ldda	[%l7 + 0x50] %asi,	%l0
loop_2960:
	udivcc	%l4,	0x13AC,	%i6
	sdivcc	%l6,	0x18B2,	%i0
	edge16	%l0,	%o0,	%i5
	mulscc	%g4,	%o6,	%o2
	nop
	setx	loop_2961,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	udivcc	%i4,	0x145F,	%g3
	fbue,a	%fcc3,	loop_2962
	mulx	%i3,	%i2,	%i7
loop_2961:
	fcmple32	%f30,	%f4,	%l2
	movrgz	%o3,	%g6,	%o5
loop_2962:
	fble,a	%fcc1,	loop_2963
	fbe,a	%fcc1,	loop_2964
	bpos	loop_2965
	fmovse	%xcc,	%f2,	%f3
loop_2963:
	edge16	%o7,	%o1,	%g2
loop_2964:
	call	loop_2966
loop_2965:
	smulcc	%g5,	0x07D7,	%i1
	movre	%o4,	0x1E2,	%g7
	fmovdle	%xcc,	%f21,	%f0
loop_2966:
	andcc	%g1,	0x0AA8,	%l5
	tcs	%xcc,	0x1
	udivcc	%l1,	0x0834,	%l3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sll	%i6,	0x13,	%l6
	bpos,a,pn	%xcc,	loop_2967
	nop
	setx	0xC698E3EB,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f5
	setx	0x18A6B457,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f6
	fmuls	%f6,	%f5,	%f0
	movpos	%icc,	%i0,	%l0
	subcc	%o0,	0x0F5E,	%i5
loop_2967:
	ldd	[%l7 + 0x68],	%g4
	movrne	%o6,	%l4,	%o2
	tneg	%icc,	0x7
	faligndata	%f2,	%f8,	%f2
	edge32l	%i4,	%g3,	%i2
	sth	%i7,	[%l7 + 0x12]
	or	%l2,	0x0270,	%o3
	taddcctv	%g6,	0x0D03,	%o5
	smul	%o7,	0x17AB,	%o1
	movne	%icc,	%i3,	%g2
	fpsub32	%f14,	%f6,	%f10
	fbe,a	%fcc1,	loop_2968
	mova	%icc,	%g5,	%i1
	fbu	%fcc3,	loop_2969
	subccc	%g7,	0x0E7F,	%o4
loop_2968:
	fandnot2s	%f29,	%f3,	%f18
	orn	%l5,	0x112B,	%l1
loop_2969:
	sra	%g1,	%l3,	%l6
	fbo	%fcc2,	loop_2970
	stw	%i6,	[%l7 + 0x58]
	fmovrsgz	%i0,	%f4,	%f10
	udivx	%l0,	0x145C,	%o0
loop_2970:
	movvc	%xcc,	%i5,	%o6
	tge	%xcc,	0x2
	move	%icc,	%l4,	%g4
	fsrc2	%f2,	%f0
	movge	%icc,	%o2,	%i4
	umulcc	%i2,	0x0703,	%g3
	mulx	%i7,	0x0910,	%o3
	sir	0x00A2
	move	%icc,	%l2,	%g6
	bne	%xcc,	loop_2971
	andn	%o7,	%o1,	%o5
	or	%g2,	%g5,	%i3
	nop
	setx	0x806273A3,	%l0,	%l6
	st	%l6,	[%l7 + 0x7C]
	ld	[%l7 + 0x7C],	%fsr
loop_2971:
	andcc	%g7,	%i1,	%l5
	bgu	%icc,	loop_2972
	tneg	%xcc,	0x7
	tle	%xcc,	0x6
	orncc	%l1,	%o4,	%l3
loop_2972:
	mova	%xcc,	%g1,	%l6
	srax	%i6,	0x1B,	%i0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fornot1s	%f26,	%f31,	%f21
	prefetch	[%l7 + 0x2C],	 0x3
	call	loop_2973
	ba,pn	%icc,	loop_2974
	fcmple16	%f28,	%f18,	%o0
	bn,pt	%xcc,	loop_2975
loop_2973:
	alignaddrl	%l0,	%o6,	%i5
loop_2974:
	fmovsneg	%xcc,	%f28,	%f9
	fpsub32s	%f24,	%f20,	%f31
loop_2975:
	edge8l	%l4,	%o2,	%g4
	fmovdvs	%icc,	%f22,	%f24
	wr	%g0,	0x11,	%asi
	stwa	%i4,	[%l7 + 0x6C] %asi
	ldsh	[%l7 + 0x40],	%g3
	brlz	%i7,	loop_2976
	addccc	%o3,	0x0D54,	%l2
	movpos	%xcc,	%i2,	%g6
	nop
	setx	0x36BC3EC6,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f6
	fsqrts	%f6,	%f22
loop_2976:
	fpadd16	%f24,	%f28,	%f10
	nop
	setx	0x80544685,	%l0,	%l6
	st	%l6,	[%l7 + 0x68]
	ld	[%l7 + 0x68],	%fsr
	sdiv	%o1,	0x05D4,	%o7
	bneg	%icc,	loop_2977
	smulcc	%o5,	0x040B,	%g2
	tneg	%icc,	0x4
	xnor	%i3,	%g5,	%g7
loop_2977:
	fmovrsgez	%l5,	%f31,	%f25
	alignaddr	%i1,	%l1,	%o4
	movcc	%xcc,	%g1,	%l3
	tg	%icc,	0x1
	ldsb	[%l7 + 0x62],	%l6
	fcmple32	%f26,	%f0,	%i6
	ta	%icc,	0x6
	tvs	%icc,	0x7
	movneg	%xcc,	%i0,	%l0
	fbne	%fcc0,	loop_2978
	alignaddrl	%o6,	%o0,	%i5
	array16	%o2,	%g4,	%l4
	bvs,a,pt	%xcc,	loop_2979
loop_2978:
	fbl,a	%fcc2,	loop_2980
	addccc	%i4,	%g3,	%o3
	fmovsle	%xcc,	%f9,	%f4
loop_2979:
	fmovdleu	%xcc,	%f25,	%f6
loop_2980:
	tvc	%xcc,	0x7
	fbe,a	%fcc2,	loop_2981
	andn	%i7,	%i2,	%l2
	faligndata	%f10,	%f28,	%f10
	tsubcctv	%g6,	0x0956,	%o1
loop_2981:
	xorcc	%o7,	0x1E2F,	%o5
	sethi	0x1B9C,	%g2
	subcc	%g5,	%g7,	%l5
	movpos	%xcc,	%i1,	%i3
	set	0x40, %o1
	ldda	[%l7 + %o1] 0x10,	%f0
	ba	loop_2982
	ld	[%l7 + 0x5C],	%f28
	movge	%icc,	%l1,	%g1
	movvs	%icc,	%l3,	%l6
loop_2982:
	smulcc	%i6,	%i0,	%l0
	alignaddr	%o4,	%o6,	%o0
	fnot1	%f18,	%f30
	fmovda	%xcc,	%f6,	%f13
	subc	%i5,	%o2,	%l4
	edge16n	%i4,	%g4,	%g3
	fmul8x16au	%f0,	%f26,	%f14
	fxors	%f31,	%f16,	%f28
	tge	%icc,	0x6
	udivcc	%o3,	0x1E95,	%i7
	be,a	%xcc,	loop_2983
	taddcctv	%i2,	%l2,	%g6
	fsrc2s	%f17,	%f20
	wr	%g0,	0x04,	%asi
	lda	[%l7 + 0x50] %asi,	%f12
loop_2983:
	tg	%icc,	0x5
	popc	0x1921,	%o7
	membar	#Sync
	wr	%g0,	0x17,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	bpos,a	%icc,	loop_2984
	tle	%icc,	0x6
	srlx	%o1,	0x07,	%o5
	movrne	%g5,	%g2,	%l5
loop_2984:
	nop
	setx	0xA0D7C0E3506E6DDE,	%l0,	%l6
	stx	%l6,	[%l7 + 0x58]
	ldx	[%l7 + 0x58],	%fsr
	wr	%g0,	0x81,	%asi
	sta	%f2,	[%l7 + 0x4C] %asi
	bne	loop_2985
	or	%i1,	%g7,	%l1
	smulcc	%i3,	0x1245,	%g1
	fmovrsgez	%l6,	%f11,	%f28
loop_2985:
	movneg	%xcc,	%i6,	%i0
	fmovrse	%l3,	%f7,	%f27
	fcmple32	%f4,	%f14,	%l0
	fba,a	%fcc2,	loop_2986
	tpos	%icc,	0x3
	sllx	%o6,	0x1F,	%o0
	fzero	%f24
loop_2986:
	orcc	%i5,	%o2,	%l4
	fnors	%f22,	%f3,	%f25
	umulcc	%o4,	%i4,	%g4
	subc	%g3,	%i7,	%i2
	movneg	%icc,	%o3,	%l2
	bvc	loop_2987
	edge32l	%g6,	%o7,	%o5
	fmovdl	%icc,	%f8,	%f14
	fbo,a	%fcc2,	loop_2988
loop_2987:
	brz	%o1,	loop_2989
	fbge	%fcc0,	loop_2990
	subcc	%g5,	%g2,	%i1
loop_2988:
	movvc	%xcc,	%g7,	%l1
loop_2989:
	edge8ln	%i3,	%g1,	%l6
loop_2990:
	movrgez	%l5,	%i6,	%l3
	nop
	set	0x38, %o3
	stb	%l0,	[%l7 + %o3]
	edge8	%o6,	%i0,	%i5
	orcc	%o2,	%o0,	%o4
	tgu	%xcc,	0x4
	movle	%icc,	%l4,	%i4
	movge	%icc,	%g4,	%i7
	edge32ln	%g3,	%o3,	%i2
	fmovsgu	%icc,	%f24,	%f21
	bshuffle	%f24,	%f18,	%f6
	fba	%fcc2,	loop_2991
	tgu	%icc,	0x3
	fmovda	%icc,	%f28,	%f27
	mulx	%l2,	%g6,	%o5
loop_2991:
	nop
	setx	0xDDEA72005CCDF46B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	fsqrtd	%f8,	%f22
	fpack32	%f16,	%f4,	%f10
	edge32ln	%o7,	%g5,	%g2
	nop
	set	0x58, %i6
	ldub	[%l7 + %i6],	%o1
	bcc,a	%icc,	loop_2992
	bgu,a,pt	%icc,	loop_2993
	smul	%g7,	0x05CC,	%i1
	movge	%icc,	%i3,	%g1
loop_2992:
	edge32ln	%l6,	%l1,	%l5
loop_2993:
	edge16l	%l3,	%l0,	%o6
	fone	%f10
	add	%i6,	0x164F,	%i0
	sdivcc	%i5,	0x1BF2,	%o0
	edge16	%o4,	%o2,	%l4
	fxor	%f6,	%f24,	%f12
	fsrc1s	%f18,	%f4
	edge16n	%i4,	%i7,	%g4
	bge	%icc,	loop_2994
	brgz,a	%o3,	loop_2995
	sir	0x082D
	set	0x118, %g1
	ldxa	[%g0 + %g1] 0x52,	%g3
loop_2994:
	ldsh	[%l7 + 0x4C],	%l2
loop_2995:
	fornot1s	%f12,	%f15,	%f2
	fmovsa	%icc,	%f8,	%f0
	movneg	%xcc,	%g6,	%o5
	edge16ln	%i2,	%g5,	%o7
	addcc	%o1,	%g7,	%g2
	add	%i1,	0x10BC,	%g1
	ldsb	[%l7 + 0x23],	%l6
	tvs	%icc,	0x1
	nop
	fitos	%f1,	%f23
	fstox	%f23,	%f2
	bcc	loop_2996
	movgu	%icc,	%i3,	%l1
	nop
	setx	loop_2997,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	alignaddr	%l3,	%l0,	%o6
loop_2996:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	setx	0x4DC1604F,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f18
	setx	0x649648B1,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f1
	fdivs	%f1,	%f18,	%f1
loop_2997:
	add	%i6,	0x1334,	%l5
	nop
	fitos	%f17,	%f23
	alignaddrl	%i0,	%o0,	%o4
	andcc	%o2,	%l4,	%i4
	taddcctv	%i7,	0x0E7B,	%i5
	movl	%xcc,	%o3,	%g3
	tleu	%xcc,	0x2
	array32	%g4,	%g6,	%o5
	taddcc	%i2,	%l2,	%g5
	nop
	setx	0x0ECBDE9A,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f14
	setx	0x4759044F,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f0
	fadds	%f0,	%f14,	%f28
	sdivcc	%o1,	0x155E,	%g7
	wr	%g0,	0x18,	%asi
	stwa	%g2,	[%l7 + 0x1C] %asi
	sllx	%o7,	%i1,	%l6
	array32	%g1,	%i3,	%l3
	sllx	%l1,	%l0,	%o6
	brgz	%i6,	loop_2998
	move	%icc,	%l5,	%i0
	fbu,a	%fcc0,	loop_2999
	tne	%icc,	0x2
loop_2998:
	bneg,pt	%icc,	loop_3000
	bpos,a,pn	%icc,	loop_3001
loop_2999:
	ldstub	[%l7 + 0x15],	%o4
	fnot1s	%f5,	%f27
loop_3000:
	sethi	0x0DED,	%o0
loop_3001:
	edge16ln	%o2,	%l4,	%i4
	orncc	%i7,	%i5,	%g3
	bleu,pt	%xcc,	loop_3002
	ldsh	[%l7 + 0x34],	%g4
	fcmple32	%f12,	%f8,	%o3
	bshuffle	%f12,	%f22,	%f14
loop_3002:
	fbu,a	%fcc0,	loop_3003
	movrlz	%o5,	0x369,	%g6
	edge8n	%i2,	%l2,	%g5
	fcmple16	%f24,	%f6,	%g7
loop_3003:
	nop
	setx	0x65EFCC78,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f30
	fsqrts	%f30,	%f27
	sdivcc	%o1,	0x155A,	%o7
	bgu,a,pt	%icc,	loop_3004
	ldstub	[%l7 + 0x4F],	%g2
	lduh	[%l7 + 0x26],	%i1
	fandnot2	%f12,	%f22,	%f26
loop_3004:
	array16	%l6,	%i3,	%l3
	fxors	%f30,	%f27,	%f11
	add	%l7,	0x20,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] %asi,	%l1,	%g1
	bvs,a	loop_3005
	tvs	%icc,	0x0
	call	loop_3006
	andcc	%l0,	%i6,	%l5
loop_3005:
	nop
	set	0x40, %l2
	stda	%f16,	[%l7 + %l2] 0x80
loop_3006:
	bne,pn	%xcc,	loop_3007
	fbuge,a	%fcc1,	loop_3008
	fnor	%f18,	%f8,	%f26
	movvc	%icc,	%i0,	%o6
loop_3007:
	addcc	%o4,	0x154A,	%o2
loop_3008:
	fmovsvs	%icc,	%f17,	%f10
	sll	%o0,	%l4,	%i4
	movcs	%xcc,	%i5,	%g3
	nop
	setx	0x4CB895E5FD3F9698,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0xDB1961DDFD931DFB,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	faddd	%f14,	%f26,	%f0
	edge16n	%g4,	%i7,	%o3
	membar	0x51
	membar	0x7D
	bn,pn	%xcc,	loop_3009
	bg	loop_3010
	ba	%xcc,	loop_3011
	and	%o5,	0x1884,	%i2
loop_3009:
	tvs	%icc,	0x2
loop_3010:
	nop
	setx	0x53971231,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f20
	setx	0xC2A29F8F,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f10
	fdivs	%f10,	%f20,	%f28
loop_3011:
	nop
	setx	loop_3012,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	bge,pt	%icc,	loop_3013
	nop
	setx	0x4E7EEA680CFAB13B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0xDBAD991407442F55,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	fsubd	%f8,	%f14,	%f30
	tpos	%xcc,	0x5
loop_3012:
	fblg	%fcc1,	loop_3014
loop_3013:
	ld	[%l7 + 0x10],	%f15
	fmovrdlz	%l2,	%f26,	%f4
	tsubcctv	%g6,	%g5,	%o1
loop_3014:
	tsubcc	%g7,	%o7,	%i1
	nop
	fitod	%f8,	%f8
	fdtoi	%f8,	%f31
	tg	%xcc,	0x3
	set	0x28, %i4
	ldxa	[%l7 + %i4] 0x15,	%l6
	fcmpne32	%f14,	%f2,	%g2
	umulcc	%i3,	%l3,	%g1
	fcmple32	%f22,	%f12,	%l0
	movrlez	%i6,	%l1,	%i0
	srlx	%o6,	%o4,	%o2
	fmovrde	%l5,	%f16,	%f20
	tge	%icc,	0x5
	brlez,a	%l4,	loop_3015
	andcc	%i4,	0x0B83,	%i5
	fzero	%f30
	taddcctv	%o0,	%g4,	%i7
loop_3015:
	fmovdge	%xcc,	%f30,	%f10
	stbar
	movvc	%icc,	%g3,	%o3
	srlx	%o5,	%i2,	%l2
	fandnot1	%f2,	%f22,	%f22
	movg	%xcc,	%g5,	%g6
	orncc	%o1,	%g7,	%o7
	sllx	%i1,	0x16,	%l6
	umul	%i3,	0x08DC,	%g2
	tn	%xcc,	0x4
	array8	%g1,	%l3,	%l0
	fpadd16s	%f3,	%f5,	%f25
	andncc	%l1,	%i6,	%o6
	andcc	%i0,	%o2,	%o4
	movrlz	%l5,	%i4,	%l4
	nop
	setx	loop_3016,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	te	%icc,	0x2
	edge32	%i5,	%o0,	%g4
	fcmpgt16	%f24,	%f14,	%i7
loop_3016:
	fcmpne16	%f12,	%f10,	%o3
	and	%g3,	0x1803,	%i2
	edge8n	%l2,	%g5,	%o5
	nop
	setx	0xA000DECF,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f28
	setx	0x0CD9471C,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f5
	fmuls	%f5,	%f28,	%f22
	edge32l	%o1,	%g7,	%g6
	add	%l7,	0x18,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%i1
	casxa	[%l6] %asi,	%i1,	%l6
	fmovsne	%xcc,	%f14,	%f17
	srlx	%o7,	0x05,	%g2
	brz	%g1,	loop_3017
	fnands	%f0,	%f2,	%f24
	fmovdle	%icc,	%f3,	%f9
	ldsw	[%l7 + 0x70],	%i3
loop_3017:
	fbe	%fcc2,	loop_3018
	subcc	%l3,	%l1,	%l0
	ld	[%l7 + 0x6C],	%f14
	fsrc1	%f14,	%f8
loop_3018:
	nop
	setx	0x4A50B61A,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f20
	setx	0xCB72B7F6,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f3
	fdivs	%f3,	%f20,	%f2
	edge32	%i6,	%i0,	%o2
	tne	%xcc,	0x2
	wr	%g0,	0x89,	%asi
	lda	[%l7 + 0x4C] %asi,	%f2
	lduw	[%l7 + 0x40],	%o6
	fsrc2s	%f0,	%f15
	srlx	%l5,	0x14,	%i4
	or	%o4,	0x1921,	%l4
	bne,pn	%xcc,	loop_3019
	tsubcctv	%o0,	0x00A1,	%i5
	fzeros	%f2
	movn	%xcc,	%g4,	%i7
loop_3019:
	movleu	%icc,	%o3,	%i2
	fmovdn	%xcc,	%f23,	%f25
	fpsub32s	%f21,	%f3,	%f25
	edge16l	%l2,	%g3,	%g5
	edge32ln	%o5,	%g7,	%g6
	set	0x58, %o0
	prefetcha	[%l7 + %o0] 0x80,	 0x0
	ldsh	[%l7 + 0x6C],	%l6
	fmovsa	%icc,	%f31,	%f11
	fpadd16	%f10,	%f0,	%f8
	fmovsle	%icc,	%f29,	%f1
	set	0x25, %g2
	ldsba	[%l7 + %g2] 0x0c,	%o7
	movrne	%i1,	%g2,	%i3
	sra	%l3,	%l1,	%l0
	bg,a,pt	%xcc,	loop_3020
	nop
	setx	0x40425D28,	%l0,	%l6
	st	%l6,	[%l7 + 0x08]
	ld	[%l7 + 0x08],	%fsr
	sra	%g1,	%i6,	%i0
	fble	%fcc0,	loop_3021
loop_3020:
	brgz,a	%o2,	loop_3022
	tvs	%icc,	0x1
	st	%f2,	[%l7 + 0x60]
loop_3021:
	nop
	fitod	%f12,	%f18
	fdtox	%f18,	%f12
loop_3022:
	popc	%o6,	%i4
	te	%icc,	0x4
	fpadd32s	%f31,	%f13,	%f12
	udivcc	%o4,	0x13EB,	%l4
	fmovdn	%icc,	%f12,	%f29
	fmovrdlz	%l5,	%f20,	%f16
	xor	%i5,	%o0,	%g4
	bpos,a,pt	%icc,	loop_3023
	tvs	%icc,	0x1
	movge	%xcc,	%o3,	%i2
	fcmpgt16	%f26,	%f4,	%i7
loop_3023:
	alignaddr	%l2,	%g3,	%g5
	movrlz	%g7,	%o5,	%o1
	and	%l6,	%g6,	%o7
	fnegd	%f14,	%f14
	ta	%xcc,	0x7
	set	0x5A, %l5
	lduba	[%l7 + %l5] 0x88,	%i1
	tvs	%xcc,	0x0
	fbl	%fcc2,	loop_3024
	fornot1	%f10,	%f18,	%f4
	movvc	%icc,	%i3,	%l3
	taddcc	%l1,	0x0F84,	%l0
loop_3024:
	alignaddr	%g1,	%i6,	%i0
	fmovdgu	%xcc,	%f5,	%f15
	movcc	%icc,	%o2,	%o6
	edge16n	%g2,	%o4,	%i4
	fnegs	%f31,	%f0
	xorcc	%l4,	%i5,	%l5
	movrne	%o0,	0x2C0,	%g4
	std	%f2,	[%l7 + 0x60]
	fmovrde	%o3,	%f0,	%f8
	tcs	%icc,	0x3
	add	%i2,	%i7,	%g3
	ldsb	[%l7 + 0x23],	%l2
	movg	%icc,	%g7,	%o5
	sra	%g5,	0x14,	%l6
	movrne	%g6,	%o1,	%o7
	edge32ln	%i3,	%i1,	%l1
	xor	%l0,	%l3,	%i6
	fbe	%fcc2,	loop_3025
	fbuge,a	%fcc1,	loop_3026
	te	%icc,	0x0
	fornot2s	%f20,	%f15,	%f27
loop_3025:
	addc	%i0,	%g1,	%o6
loop_3026:
	taddcc	%g2,	0x1D0D,	%o4
	taddcctv	%i4,	0x0074,	%l4
	ld	[%l7 + 0x50],	%f10
	srl	%i5,	0x1E,	%l5
	wr	%g0,	0x19,	%asi
	ldswa	[%l7 + 0x20] %asi,	%o0
	edge8ln	%o2,	%g4,	%o3
	te	%icc,	0x4
	nop
	setx	0x6067790F,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f13
	setx	0x51383D2D,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f8
	fmuls	%f8,	%f13,	%f9
	set	0x0F, %g5
	ldsba	[%l7 + %g5] 0x19,	%i2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orcc	%g3,	%l2,	%g7
	movcs	%icc,	%o5,	%i7
	array8	%l6,	%g6,	%g5
	sdivcc	%o1,	0x086B,	%o7
	tvc	%icc,	0x3
	fxnor	%f16,	%f6,	%f0
	edge8n	%i3,	%i1,	%l0
	fmovrde	%l1,	%f18,	%f30
	membar	0x7A
	wr	%g0,	0x0c,	%asi
	sta	%f31,	[%l7 + 0x20] %asi
	movl	%icc,	%i6,	%i0
	alignaddr	%l3,	%g1,	%o6
	nop
	fitod	%f12,	%f10
	fdtoi	%f10,	%f29
	bgu,a	loop_3027
	nop
	set	0x38, %l6
	ldd	[%l7 + %l6],	%f12
	fornot2	%f6,	%f10,	%f4
	ble,a,pt	%xcc,	loop_3028
loop_3027:
	edge32ln	%g2,	%i4,	%o4
	array16	%l4,	%i5,	%o0
	fpack32	%f10,	%f4,	%f0
loop_3028:
	edge16	%o2,	%g4,	%l5
	fmovrdgz	%i2,	%f12,	%f12
	sllx	%o3,	%g3,	%l2
	tl	%xcc,	0x2
	addcc	%g7,	%i7,	%o5
	movleu	%icc,	%l6,	%g5
	fmovsl	%xcc,	%f27,	%f14
	bcc	loop_3029
	add	%o1,	0x0BED,	%o7
	edge32ln	%g6,	%i1,	%i3
	fbge	%fcc3,	loop_3030
loop_3029:
	movrne	%l1,	%l0,	%i0
	addc	%l3,	%i6,	%g1
	umulcc	%g2,	0x0A98,	%o6
loop_3030:
	tcc	%xcc,	0x6
	be,a,pn	%icc,	loop_3031
	fnot1	%f26,	%f12
	movge	%xcc,	%o4,	%l4
	edge8l	%i5,	%o0,	%i4
loop_3031:
	movneg	%xcc,	%g4,	%l5
	tne	%xcc,	0x2
	fmovdvc	%xcc,	%f4,	%f6
	mulx	%o2,	%i2,	%o3
	nop
	setx	0xE0DA6391,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f31
	setx	0xA128A772,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f21
	fadds	%f21,	%f31,	%f8
	taddcc	%l2,	0x0F26,	%g7
	tsubcc	%g3,	0x10CB,	%o5
	fmovsa	%xcc,	%f9,	%f26
	sdivcc	%l6,	0x0A9F,	%i7
	subccc	%g5,	0x1B5A,	%o1
	fbne,a	%fcc0,	loop_3032
	array16	%o7,	%i1,	%i3
	stbar
	sra	%g6,	%l0,	%l1
loop_3032:
	subc	%l3,	%i6,	%g1
	srl	%i0,	0x0D,	%o6
	movcc	%xcc,	%o4,	%l4
	brgz	%i5,	loop_3033
	edge32l	%o0,	%g2,	%g4
	udiv	%l5,	0x1091,	%i4
	movneg	%icc,	%o2,	%o3
loop_3033:
	edge8l	%l2,	%i2,	%g3
	tvc	%icc,	0x2
	movl	%icc,	%g7,	%l6
	and	%i7,	0x1E96,	%o5
	edge8ln	%o1,	%g5,	%o7
	nop
	setx	0x0B3400CE70431A84,	%l0,	%l6
	stx	%l6,	[%l7 + 0x60]
	ldx	[%l7 + 0x60],	%fsr
	tsubcctv	%i3,	0x0A56,	%g6
	edge32l	%l0,	%l1,	%i1
	xor	%l3,	%g1,	%i6
	edge32ln	%o6,	%i0,	%o4
	sllx	%i5,	%o0,	%g2
	nop
	setx loop_3034, %l0, %l1
	jmpl %l1, %l4
	fbuge	%fcc0,	loop_3035
	movpos	%icc,	%l5,	%g4
	nop
	setx	0xF8CF58A3E5569A74,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	fsqrtd	%f26,	%f18
loop_3034:
	nop
	set	0x38, %l3
	ldxa	[%l7 + %l3] 0x18,	%o2
loop_3035:
	andncc	%o3,	%l2,	%i2
	tpos	%xcc,	0x4
	tpos	%xcc,	0x2
	movle	%icc,	%g3,	%g7
	edge16n	%l6,	%i4,	%o5
	bvs,a,pt	%icc,	loop_3036
	fpsub32	%f26,	%f22,	%f8
	edge16ln	%o1,	%i7,	%o7
	set	0x38, %i3
	ldsha	[%l7 + %i3] 0x15,	%i3
loop_3036:
	fbu,a	%fcc3,	loop_3037
	fmovdgu	%xcc,	%f2,	%f0
	udivcc	%g5,	0x0E57,	%l0
	sdiv	%g6,	0x19CA,	%i1
loop_3037:
	stbar
	ldsb	[%l7 + 0x2C],	%l3
	fmovrse	%g1,	%f4,	%f21
	fmovdgu	%xcc,	%f25,	%f22
	array8	%l1,	%i6,	%i0
	bge	loop_3038
	fandnot1	%f20,	%f22,	%f22
	fmul8sux16	%f24,	%f16,	%f28
	fmovrdgez	%o4,	%f16,	%f2
loop_3038:
	stbar
	movrgz	%i5,	%o6,	%g2
	tneg	%icc,	0x6
	movne	%xcc,	%o0,	%l4
	fmovrsgz	%g4,	%f4,	%f24
	nop
	setx	loop_3039,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	ldsw	[%l7 + 0x6C],	%o2
	mulscc	%o3,	%l5,	%l2
	ble,a	loop_3040
loop_3039:
	movcs	%xcc,	%g3,	%g7
	tpos	%xcc,	0x1
	fmovsg	%icc,	%f30,	%f0
loop_3040:
	fbl,a	%fcc2,	loop_3041
	xnor	%l6,	%i2,	%i4
	sub	%o1,	0x04F5,	%i7
	fmovsvc	%icc,	%f14,	%f18
loop_3041:
	nop
	setx	loop_3042,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	and	%o7,	0x06F7,	%i3
	be,a	loop_3043
	smulcc	%g5,	0x1F19,	%o5
loop_3042:
	nop
	add	%l7,	0x6C,	%l6
	wr	%g0,	0x11,	%asi
	casa	[%l6] %asi,	%l0,	%g6
loop_3043:
	brlez,a	%i1,	loop_3044
	tvc	%icc,	0x7
	tsubcctv	%g1,	0x1A31,	%l3
	tcs	%icc,	0x1
loop_3044:
	tgu	%icc,	0x5
	edge8ln	%i6,	%i0,	%o4
	movneg	%icc,	%i5,	%o6
	bleu,a	%xcc,	loop_3045
	fmovrslez	%l1,	%f5,	%f7
	fmul8x16al	%f16,	%f14,	%f26
	mulscc	%o0,	0x06E8,	%l4
loop_3045:
	bneg,pn	%icc,	loop_3046
	umulcc	%g2,	0x0AD9,	%g4
	sra	%o2,	0x0E,	%o3
	movle	%icc,	%l5,	%g3
loop_3046:
	popc	%g7,	%l6
	srl	%l2,	0x1A,	%i4
	movneg	%icc,	%o1,	%i2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fzero	%f20
	umul	%i7,	0x117E,	%i3
	edge16n	%o7,	%o5,	%l0
	movrlez	%g5,	0x17B,	%g6
	nop
	setx	0xD05BB4CF,	%l0,	%l6
	st	%l6,	[%l7 + 0x20]
	ld	[%l7 + 0x20],	%fsr
	set	0x58, %o4
	prefetcha	[%l7 + %o4] 0x15,	 0x3
	fsrc2s	%f18,	%f15
	tsubcc	%l3,	%i6,	%i0
	tcc	%xcc,	0x6
	tneg	%xcc,	0x5
	sllx	%o4,	0x1F,	%i1
	set	0x55, %i5
	ldstuba	[%l7 + %i5] 0x88,	%i5
	orncc	%l1,	0x1A38,	%o0
	set	0x30, %g4
	ldxa	[%l7 + %g4] 0x19,	%o6
	fblg	%fcc1,	loop_3047
	fpmerge	%f25,	%f14,	%f12
	movle	%icc,	%g2,	%l4
	mova	%xcc,	%o2,	%g4
loop_3047:
	fands	%f8,	%f11,	%f18
	ldd	[%l7 + 0x58],	%l4
	srlx	%o3,	%g3,	%l6
	edge8ln	%g7,	%i4,	%o1
	andncc	%i2,	%i7,	%i3
	fsrc1s	%f0,	%f18
	movvs	%xcc,	%o7,	%o5
	array32	%l0,	%g5,	%g6
	membar	0x24
	flush	%l7 + 0x48
	mova	%icc,	%l2,	%l3
	set	0x7B, %g7
	stba	%i6,	[%l7 + %g7] 0x22
	membar	#Sync
	edge8n	%i0,	%g1,	%i1
	edge8ln	%i5,	%o4,	%l1
	smulcc	%o0,	%o6,	%g2
	fcmpne16	%f16,	%f22,	%o2
	array16	%l4,	%g4,	%o3
	nop
	set	0x3C, %o6
	sth	%g3,	[%l7 + %o6]
	orncc	%l5,	%g7,	%i4
	edge16	%o1,	%l6,	%i7
	sdiv	%i3,	0x05E5,	%o7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbue,a	%fcc1,	loop_3048
	fxnor	%f28,	%f14,	%f10
	fabsd	%f30,	%f20
	fxnors	%f5,	%f19,	%f11
loop_3048:
	edge32l	%o5,	%i2,	%l0
	andn	%g6,	0x0257,	%l2
	subc	%g5,	0x0C17,	%i6
	nop
	setx	0x5C56A17A,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f3
	setx	0x1DB76FB2,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f17
	fadds	%f17,	%f3,	%f17
	movre	%i0,	%g1,	%i1
	movvs	%xcc,	%i5,	%o4
	mova	%xcc,	%l3,	%l1
	edge32ln	%o0,	%g2,	%o2
	fandnot2s	%f5,	%f12,	%f3
	movrne	%o6,	%l4,	%g4
	fmul8x16al	%f11,	%f27,	%f30
	subc	%g3,	0x1B07,	%l5
	array16	%o3,	%g7,	%o1
	fmovd	%f28,	%f20
	subccc	%i4,	%i7,	%l6
	movn	%icc,	%o7,	%i3
	addcc	%o5,	0x1A41,	%i2
	sdivcc	%l0,	0x0178,	%l2
	movne	%xcc,	%g5,	%i6
	fbl	%fcc1,	loop_3049
	movrgez	%g6,	0x079,	%g1
	fbg	%fcc2,	loop_3050
	umul	%i0,	%i5,	%o4
loop_3049:
	bne,pn	%xcc,	loop_3051
	subc	%l3,	%i1,	%l1
loop_3050:
	ba	loop_3052
	xorcc	%g2,	0x152D,	%o2
loop_3051:
	nop
	fitod	%f2,	%f16
	fdtox	%f16,	%f16
	fxtod	%f16,	%f6
	tvs	%icc,	0x3
loop_3052:
	fmovdneg	%icc,	%f24,	%f21
	smul	%o6,	0x1927,	%l4
	sir	0x1EAC
	sll	%o0,	0x15,	%g4
	fmovdpos	%xcc,	%f28,	%f9
	nop
	setx	loop_3053,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fpmerge	%f23,	%f12,	%f12
	tge	%xcc,	0x2
	bg,a,pn	%xcc,	loop_3054
loop_3053:
	sir	0x1BC3
	addccc	%l5,	0x16A7,	%g3
	edge32	%g7,	%o1,	%o3
loop_3054:
	edge16n	%i7,	%l6,	%i4
	flush	%l7 + 0x68
	movneg	%icc,	%o7,	%i3
	movge	%xcc,	%o5,	%i2
	edge32n	%l2,	%g5,	%i6
	wr	%g0,	0x0c,	%asi
	stxa	%g6,	[%l7 + 0x30] %asi
	add	%l0,	0x0EC0,	%g1
	fmovsn	%xcc,	%f8,	%f0
	fmul8ulx16	%f18,	%f4,	%f22
	array32	%i5,	%o4,	%l3
	taddcctv	%i0,	0x1615,	%i1
	edge8	%g2,	%l1,	%o6
	sub	%o2,	%l4,	%g4
	movn	%xcc,	%l5,	%g3
	andn	%g7,	0x0C73,	%o1
	movrne	%o0,	0x379,	%i7
	sra	%l6,	0x1C,	%o3
	array16	%o7,	%i4,	%o5
	tsubcctv	%i2,	0x1B1C,	%l2
	addccc	%i3,	0x0D16,	%g5
	edge32l	%g6,	%l0,	%i6
	edge16	%i5,	%g1,	%o4
	orn	%l3,	0x1CE1,	%i0
	bpos,a,pn	%xcc,	loop_3055
	movgu	%xcc,	%g2,	%l1
	movleu	%xcc,	%o6,	%i1
	edge16l	%o2,	%g4,	%l4
loop_3055:
	fmovde	%xcc,	%f5,	%f13
	and	%g3,	%g7,	%o1
	fnor	%f26,	%f28,	%f26
	tvc	%icc,	0x0
	move	%xcc,	%o0,	%i7
	tl	%icc,	0x1
	tle	%icc,	0x0
	swap	[%l7 + 0x38],	%l6
	set	0x40, %l1
	stda	%f0,	[%l7 + %l1] 0x14
	subccc	%o3,	0x0FAA,	%o7
	edge8n	%l5,	%i4,	%o5
	call	loop_3056
	nop
	fitod	%f2,	%f26
	fdtos	%f26,	%f12
	xnorcc	%l2,	0x01D3,	%i3
	orn	%g5,	0x1971,	%i2
loop_3056:
	membar	0x43
	edge16n	%g6,	%i6,	%i5
	add	%l7,	0x78,	%l6
	wr	%g0,	0x19,	%asi
	casa	[%l6] %asi,	%g1,	%l0
	tneg	%xcc,	0x6
	fnors	%f5,	%f25,	%f27
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 0:
!
!	Type l   	: 2783
!	Type x   	: 1210
!	Type cti   	: 3056
!	Type f   	: 4450
!	Type i   	: 13501
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


	EXIT_GOOD	/* test finish  */

/************************************************************************
   Test case data start
 ************************************************************************/
.data
user_data_start:
scratch_area:
.word 0xAF6177E9
.word 0x1262686A
.word 0xBBBE193C
.word 0x2252307C
.word 0x854E8A06
.word 0xB71E4EC7
.word 0x19FBE61C
.word 0xEB82DB06
.word 0x9D5F09FA
.word 0x78281B05
.word 0x29B28D2F
.word 0x64F0049B
.word 0x8D7E740D
.word 0xF9F301FA
.word 0xC85C640F
.word 0xEDF87694
.word 0x434938EB
.word 0x649171C9
.word 0x248E2C10
.word 0x41662C78
.word 0xB53B470C
.word 0xED05A64A
.word 0x236311D3
.word 0xA3FEAE52
.word 0x9FA32E12
.word 0x13CB1846
.word 0x3C2ED11B
.word 0x25B840C3
.word 0x18F276F6
.word 0xF7577363
.word 0xF95DA328
.word 0x8984F5FA
.word 0x765C6406
.word 0x8E0BA17C
.word 0x89565DA0
.word 0xF578A586
.word 0x7F24D19C
.word 0x6A3F33D5
.word 0xFF091E94
.word 0x069FB623
.word 0x8665B4DC
.word 0x6D2F80AB
.word 0x691DEB6E
.word 0x16BDF14D
.word 0x3929BD09
.word 0xD7C3C96F
.word 0x074F948A
.word 0x1B752081
.word 0xD51C2715
.word 0xCCA2D98D
.word 0x11384BB0
.word 0x4BA3A366
.word 0xF3CAD5D8
.word 0x217A1117
.word 0x972CE77F
.word 0xCD6C8BDA
.word 0x0AFE6C75
.word 0x58C899A6
.word 0x8ECE86E6
.word 0xD430F1DF
.word 0x6CF360D6
.word 0x8DA88FE9
.word 0x9077DE64
.word 0x65105520
.end
