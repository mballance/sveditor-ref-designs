/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: isa3_fsr3_f4.s
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
.ident "Using Instruction Hash for Focus :$Id: isa3_fsr3_f4.s,v 1.1 2007/05/11 17:22:28 drp Exp $"
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
	setx	0xD6FD3F0450403240,	%l0,	%l6
	stx	%l6,	[%l7 + 0x0]
	ldx	[%l7 + 0x0],	%fsr
!
! Thread 0 Start
!
main_t0:

	!# Initialize registers ..

	!# Global registers
	set	0xD,	%g1
	set	0xD,	%g2
	set	0xE,	%g3
	set	0xA,	%g4
	set	0x4,	%g5
	set	0x3,	%g6
	set	0xE,	%g7
	!# Input registers
	set	-0xA,	%i0
	set	-0x2,	%i1
	set	-0xD,	%i2
	set	-0xB,	%i3
	set	-0xC,	%i4
	set	-0x0,	%i5
	set	-0xB,	%i6
	set	-0x3,	%i7
	!# Local registers
	set	0x3DDA4FAB,	%l0
	set	0x028F2274,	%l1
	set	0x148FDAFD,	%l2
	set	0x2CB2D784,	%l3
	set	0x05E06FD4,	%l4
	set	0x5E8CF219,	%l5
	set	0x2F08C3F1,	%l6
	!# Output registers
	set	-0x1CA2,	%o0
	set	-0x1FDF,	%o1
	set	0x048B,	%o2
	set	0x1262,	%o3
	set	-0x0B05,	%o4
	set	0x1EF1,	%o5
	set	0x08FB,	%o6
	set	-0x1620,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0xA745E3A2DD17F990)
	INIT_TH_FP_REG(%l7,%f2,0x9E05CD43193FC3FB)
	INIT_TH_FP_REG(%l7,%f4,0x726B877ED404EAE1)
	INIT_TH_FP_REG(%l7,%f6,0x6B3036CC91C86A43)
	INIT_TH_FP_REG(%l7,%f8,0x142DFCD657C724AA)
	INIT_TH_FP_REG(%l7,%f10,0x566BFEED0E04CD87)
	INIT_TH_FP_REG(%l7,%f12,0x32479E985E674637)
	INIT_TH_FP_REG(%l7,%f14,0x23E1AD686D39A36C)
	INIT_TH_FP_REG(%l7,%f16,0x49EBFB25C37BD2FE)
	INIT_TH_FP_REG(%l7,%f18,0xF75D0A1D840C7407)
	INIT_TH_FP_REG(%l7,%f20,0x16605204B3082883)
	INIT_TH_FP_REG(%l7,%f22,0xE13FFD62B0737256)
	INIT_TH_FP_REG(%l7,%f24,0x0207559B53BA6B56)
	INIT_TH_FP_REG(%l7,%f26,0xCE17128F3A6FBCC1)
	INIT_TH_FP_REG(%l7,%f28,0xF9045901D8C3F387)
	INIT_TH_FP_REG(%l7,%f30,0x8279690D6D7161F1)
	!# Other state
	
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xB46, 	%hsys_tick_cmpr


	!# Execute Main Diag ..

	fbo,a	%fcc3,	loop_1
	movrlez	%l2,	%i5,	%g1
	wr	%g0,	0x19,	%asi
	ldswa	[%l7 + 0x4C] %asi,	%o4
loop_1:
	nop
	fitod	%f19,	%f16
	fbule,a	%fcc3,	loop_2
	edge16	%l4,	%l6,	%o5
	fbne,a	%fcc0,	loop_3
	udivx	%o3,	0x07D0,	%g2
loop_2:
	edge16ln	%g4,	%g6,	%g7
	edge32n	%i0,	%l3,	%l5
loop_3:
	movle	%xcc,	%g3,	%o0
	addc	%i1,	%o7,	%i7
	subcc	%i2,	%o6,	%o2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movvc	%icc,	%i6,	%o1
	fnot2s	%f2,	%f28
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmul8x16au	%f13,	%f24,	%f8
	edge8ln	%g5,	%l0,	%i3
	array16	%l1,	%i4,	%l2
	addccc	%g1,	0x0841,	%i5
	edge16ln	%o4,	%l4,	%o5
	subc	%o3,	0x0CD4,	%g2
	tsubcctv	%l6,	0x11A0,	%g4
	wr	%g0,	0x10,	%asi
	lduha	[%l7 + 0x3C] %asi,	%g6
	movl	%xcc,	%g7,	%i0
	movle	%icc,	%l5,	%l3
	edge32ln	%o0,	%g3,	%i1
	sdivcc	%i7,	0x158A,	%o7
	tpos	%icc,	0x3
	addccc	%i2,	%o6,	%i6
	mulx	%o1,	%o2,	%g5
	taddcc	%i3,	%l1,	%i4
	ta	%icc,	0x2
	bvc	%xcc,	loop_4
	smulcc	%l2,	%g1,	%i5
	nop
	fitod	%f6,	%f14
	fdtox	%f14,	%f0
	fxtod	%f0,	%f28
	edge16l	%l0,	%o4,	%l4
loop_4:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnegd	%f16,	%f22
	movl	%xcc,	%o3,	%g2
	edge8ln	%o5,	%g4,	%g6
	membar	0x1D
	sra	%l6,	%g7,	%i0
	tn	%xcc,	0x4
	sdivx	%l3,	0x0ACE,	%l5
	taddcc	%g3,	0x1CB7,	%o0
	tsubcctv	%i1,	0x154F,	%i7
	fornot2	%f4,	%f6,	%f26
	bgu	%xcc,	loop_5
	alignaddr	%o7,	%o6,	%i6
	tleu	%xcc,	0x7
	tcc	%icc,	0x3
loop_5:
	call	loop_6
	taddcc	%o1,	0x1EB9,	%i2
	fmovscs	%icc,	%f8,	%f7
	tge	%icc,	0x5
loop_6:
	sir	0x1D94
	edge16ln	%o2,	%g5,	%l1
	or	%i3,	%l2,	%g1
	addcc	%i4,	0x05CA,	%i5
	edge16ln	%l0,	%l4,	%o4
	addc	%o3,	%o5,	%g4
	fcmple16	%f28,	%f10,	%g6
	movrlz	%g2,	0x10F,	%g7
	fmovrslz	%i0,	%f29,	%f19
	mulscc	%l6,	%l5,	%g3
	bvc,pn	%xcc,	loop_7
	fmovs	%f3,	%f30
	stw	%l3,	[%l7 + 0x18]
	flush	%l7 + 0x60
loop_7:
	srlx	%o0,	0x1F,	%i1
	mova	%icc,	%o7,	%i7
	fbo,a	%fcc2,	loop_8
	fand	%f14,	%f28,	%f12
	tcs	%icc,	0x1
	xor	%i6,	0x0294,	%o1
loop_8:
	array16	%o6,	%o2,	%i2
	tsubcctv	%g5,	%l1,	%i3
	fbne	%fcc3,	loop_9
	brlz,a	%l2,	loop_10
	edge8ln	%i4,	%i5,	%g1
	fmovrsgz	%l0,	%f4,	%f27
loop_9:
	xnor	%l4,	%o4,	%o3
loop_10:
	tvs	%icc,	0x4
	membar	0x16
	tl	%icc,	0x1
	fmovrdne	%o5,	%f8,	%f14
	nop
	setx	loop_11,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fors	%f27,	%f19,	%f25
	fxnor	%f30,	%f14,	%f24
	flush	%l7 + 0x78
loop_11:
	fmovrslez	%g6,	%f20,	%f26
	movcs	%xcc,	%g4,	%g7
	movcs	%xcc,	%i0,	%l6
	ldsb	[%l7 + 0x66],	%g2
	nop
	fitod	%f4,	%f8
	fdtox	%f8,	%f20
	bvs	%xcc,	loop_12
	sllx	%l5,	%g3,	%l3
	sir	0x15C2
	fmovsleu	%xcc,	%f2,	%f12
loop_12:
	edge8	%i1,	%o0,	%o7
	tcs	%xcc,	0x2
	tcs	%xcc,	0x6
	tge	%xcc,	0x4
	bge,a,pn	%icc,	loop_13
	fmul8sux16	%f6,	%f18,	%f14
	tl	%icc,	0x0
	wr	%g0,	0x11,	%asi
	ldstuba	[%l7 + 0x23] %asi,	%i7
loop_13:
	edge8ln	%i6,	%o6,	%o1
	udivcc	%i2,	0x1154,	%o2
	edge32l	%l1,	%i3,	%l2
	addc	%i4,	%i5,	%g1
	orn	%l0,	%g5,	%o4
	fpsub32s	%f15,	%f2,	%f25
	nop
	fitos	%f0,	%f5
	fstox	%f5,	%f16
	ldd	[%l7 + 0x40],	%f26
	fmul8sux16	%f4,	%f6,	%f16
	movg	%xcc,	%o3,	%l4
	edge16l	%g6,	%o5,	%g7
	subc	%i0,	%g4,	%l6
	orn	%g2,	0x1023,	%l5
	tleu	%icc,	0x5
	set	0x7C, %g2
	lduwa	[%l7 + %g2] 0x04,	%g3
	fandnot1	%f26,	%f20,	%f10
	sdivx	%i1,	0x04B6,	%o0
	te	%icc,	0x0
	xnorcc	%l3,	0x0C26,	%i7
	fmovdl	%xcc,	%f24,	%f16
	sethi	0x0675,	%o7
	wr	%g0,	0x11,	%asi
	sta	%f12,	[%l7 + 0x1C] %asi
	andncc	%i6,	%o6,	%i2
	sdivcc	%o1,	0x1ED6,	%l1
	movpos	%xcc,	%o2,	%l2
	te	%xcc,	0x2
	movrlez	%i3,	0x157,	%i5
	fnot2	%f8,	%f22
	sra	%g1,	%l0,	%i4
	or	%o4,	0x1854,	%o3
	prefetch	[%l7 + 0x6C],	 0x1
	udivx	%g5,	0x19A0,	%g6
	fbule,a	%fcc1,	loop_14
	tcs	%icc,	0x5
	fbge	%fcc3,	loop_15
	st	%f10,	[%l7 + 0x54]
loop_14:
	fcmpne16	%f16,	%f22,	%l4
	brlez,a	%g7,	loop_16
loop_15:
	movcs	%icc,	%i0,	%g4
	fzeros	%f31
	nop
	fitod	%f10,	%f16
	fdtos	%f16,	%f25
loop_16:
	sir	0x0692
	smulcc	%l6,	0x14C6,	%g2
	fcmple32	%f24,	%f26,	%l5
	bleu,a	%icc,	loop_17
	movle	%xcc,	%o5,	%g3
	fmovrsgz	%i1,	%f17,	%f24
	udivcc	%l3,	0x0FF2,	%o0
loop_17:
	movrgz	%o7,	0x39A,	%i7
	wr	%g0,	0x89,	%asi
	ldsha	[%l7 + 0x3E] %asi,	%o6
	tge	%xcc,	0x6
	ldx	[%l7 + 0x30],	%i2
	subcc	%o1,	%l1,	%o2
	sdiv	%l2,	0x1A6F,	%i3
	xnorcc	%i5,	%g1,	%l0
	addc	%i6,	0x0965,	%i4
	nop
	set	0x40, %o3
	ldx	[%l7 + %o3],	%o4
	fbu,a	%fcc1,	loop_18
	array32	%g5,	%o3,	%l4
	edge32ln	%g7,	%i0,	%g4
	fmovrsne	%l6,	%f13,	%f6
loop_18:
	udiv	%g6,	0x1EFB,	%g2
	edge32ln	%o5,	%g3,	%l5
	umulcc	%l3,	0x110E,	%i1
	tpos	%xcc,	0x0
	movne	%xcc,	%o7,	%i7
	array32	%o0,	%i2,	%o1
	set	0x64, %o2
	stwa	%o6,	[%l7 + %o2] 0xea
	membar	#Sync
	alignaddr	%l1,	%l2,	%i3
	xor	%i5,	0x0E2D,	%g1
	addc	%o2,	%i6,	%l0
	movvs	%icc,	%i4,	%g5
	fpack16	%f0,	%f27
	movcs	%icc,	%o3,	%l4
	addcc	%g7,	%i0,	%o4
	flush	%l7 + 0x4C
	movre	%l6,	0x25C,	%g4
	bshuffle	%f28,	%f2,	%f18
	movneg	%icc,	%g6,	%o5
	fxnor	%f22,	%f26,	%f22
	array8	%g3,	%g2,	%l5
	tcs	%xcc,	0x5
	fmul8x16al	%f26,	%f27,	%f24
	movn	%icc,	%l3,	%i1
	udiv	%i7,	0x0AAF,	%o7
	udivx	%i2,	0x0F10,	%o0
	fcmpgt16	%f8,	%f12,	%o1
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
	edge16ln	%o6,	%l1,	%l2
	fors	%f10,	%f22,	%f13
	array32	%i3,	%i5,	%g1
loop_19:
	fmovdcc	%xcc,	%f0,	%f27
	movge	%icc,	%o2,	%l0
	bcc,pn	%xcc,	loop_20
	orncc	%i4,	%g5,	%i6
	brgez	%l4,	loop_21
	movne	%icc,	%g7,	%o3
loop_20:
	ldub	[%l7 + 0x65],	%i0
	bgu,a,pn	%xcc,	loop_22
loop_21:
	fandnot2s	%f24,	%f22,	%f1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fxnor	%f24,	%f16,	%f20
loop_22:
	andcc	%o4,	0x0506,	%g4
	add	%l7,	0x60,	%l6
	wr	%g0,	0x0c,	%asi
	ldxa	[%l6] %asi,	%g6
	casxa	[%l6] %asi,	%g6,	%o5
	tl	%icc,	0x1
	fsrc2s	%f25,	%f2
	fmovdcc	%xcc,	%f14,	%f30
	udivx	%g3,	0x0617,	%l6
	edge32ln	%g2,	%l3,	%l5
	movcc	%xcc,	%i1,	%i7
	edge16n	%i2,	%o7,	%o0
	nop
	setx	0x3D1A8F4FC4E3128E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	fsqrtd	%f18,	%f0
	fmovrdlz	%o1,	%f6,	%f10
	andncc	%l1,	%o6,	%l2
	brlez	%i3,	loop_23
	te	%xcc,	0x4
	srl	%g1,	0x00,	%i5
	lduh	[%l7 + 0x0C],	%o2
loop_23:
	subcc	%i4,	0x0D1C,	%g5
	fbug,a	%fcc0,	loop_24
	nop
	fitod	%f6,	%f16
	fdtox	%f16,	%f0
	fxtod	%f0,	%f20
	fpsub32	%f16,	%f6,	%f6
	fmovdle	%icc,	%f13,	%f1
loop_24:
	fmovsl	%xcc,	%f3,	%f13
	ldd	[%l7 + 0x78],	%l0
	brlez	%l4,	loop_25
	orncc	%i6,	%g7,	%o3
	sir	0x147C
	fmovse	%xcc,	%f26,	%f12
loop_25:
	ta	%icc,	0x4
	movn	%xcc,	%i0,	%o4
	movcs	%xcc,	%g4,	%o5
	sllx	%g6,	0x0C,	%l6
	bleu,a	%xcc,	loop_26
	fbul,a	%fcc2,	loop_27
	fbule	%fcc0,	loop_28
	fblg	%fcc2,	loop_29
loop_26:
	nop
	setx	loop_30,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_27:
	movn	%icc,	%g2,	%l3
loop_28:
	nop
	wr	%g0,	0x10,	%asi
	ldstuba	[%l7 + 0x51] %asi,	%g3
loop_29:
	tsubcctv	%i1,	%l5,	%i7
loop_30:
	edge32ln	%i2,	%o0,	%o7
	fmovsleu	%icc,	%f31,	%f23
	andncc	%l1,	%o6,	%o1
	fbuge,a	%fcc1,	loop_31
	movrgez	%i3,	0x388,	%g1
	fmovdl	%xcc,	%f5,	%f24
	taddcc	%l2,	%o2,	%i5
loop_31:
	fmovdcc	%xcc,	%f17,	%f8
	andn	%i4,	0x10FB,	%g5
	tneg	%icc,	0x1
	fbug	%fcc1,	loop_32
	orcc	%l4,	0x153D,	%i6
	nop
	setx	0x40C4F5523FE003D0,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0x7C3F603D40E993D0,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	fdivd	%f24,	%f30,	%f4
	stx	%l0,	[%l7 + 0x28]
loop_32:
	bvs,a	%icc,	loop_33
	edge32ln	%o3,	%i0,	%o4
	tcs	%icc,	0x1
	edge16	%g7,	%o5,	%g4
loop_33:
	nop
	setx	0xC24B5EEF,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f31
	setx	0x124FAFFF,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f6
	fsubs	%f6,	%f31,	%f12
	fbge	%fcc3,	loop_34
	movrlz	%g6,	%l6,	%g2
	ta	%icc,	0x7
	movvc	%icc,	%l3,	%g3
loop_34:
	brgez	%l5,	loop_35
	array16	%i7,	%i1,	%o0
	bge,a,pn	%xcc,	loop_36
	fmovdcs	%xcc,	%f29,	%f3
loop_35:
	edge32	%o7,	%l1,	%i2
	fmovrde	%o1,	%f16,	%f28
loop_36:
	brgez	%i3,	loop_37
	srax	%o6,	0x16,	%l2
	array32	%o2,	%i5,	%i4
	sdivcc	%g5,	0x0049,	%l4
loop_37:
	movl	%icc,	%g1,	%i6
	bvc	%xcc,	loop_38
	fmovrsne	%l0,	%f9,	%f5
	alignaddrl	%i0,	%o3,	%o4
	mova	%xcc,	%g7,	%o5
loop_38:
	be,a	%icc,	loop_39
	bvs	loop_40
	edge32l	%g4,	%g6,	%l6
	tcs	%icc,	0x6
loop_39:
	tcc	%icc,	0x2
loop_40:
	fands	%f8,	%f27,	%f2
	stx	%l3,	[%l7 + 0x18]
	fba,a	%fcc0,	loop_41
	edge32ln	%g3,	%l5,	%g2
	alignaddr	%i7,	%i1,	%o7
	edge32ln	%l1,	%o0,	%i2
loop_41:
	nop
	membar	#Sync
	wr	%g0,	0xf8,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	addc	%o1,	0x0EC4,	%o6
	bcs	loop_42
	mulscc	%i3,	%o2,	%l2
	te	%icc,	0x2
	alignaddrl	%i4,	%g5,	%i5
loop_42:
	umul	%g1,	%l4,	%l0
	xor	%i0,	0x1DFB,	%o3
	tsubcctv	%i6,	%o4,	%o5
	ld	[%l7 + 0x70],	%f11
	fmovdl	%xcc,	%f22,	%f2
	fmovsle	%xcc,	%f3,	%f26
	fmovd	%f22,	%f2
	edge32ln	%g7,	%g4,	%l6
	fmovsvc	%xcc,	%f0,	%f12
	orcc	%l3,	%g3,	%g6
	array16	%l5,	%i7,	%i1
	xnor	%g2,	0x00C8,	%l1
	fbug,a	%fcc1,	loop_43
	fmovdge	%icc,	%f9,	%f0
	edge16ln	%o7,	%i2,	%o0
	ba,pt	%xcc,	loop_44
loop_43:
	fbuge	%fcc2,	loop_45
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tsubcctv	%o6,	%o1,	%o2
loop_44:
	movle	%xcc,	%i3,	%l2
loop_45:
	movrgz	%i4,	%g5,	%g1
	nop
	setx loop_46, %l0, %l1
	jmpl %l1, %i5
	popc	%l4,	%i0
	tle	%xcc,	0x6
	fmovsl	%icc,	%f26,	%f28
loop_46:
	bpos,a	loop_47
	fsrc1	%f4,	%f18
	call	loop_48
	move	%icc,	%o3,	%l0
loop_47:
	andncc	%o4,	%o5,	%g7
	bleu,a	loop_49
loop_48:
	bne	%icc,	loop_50
	edge16n	%i6,	%l6,	%l3
	fcmpne16	%f2,	%f24,	%g4
loop_49:
	bge	%icc,	loop_51
loop_50:
	movrlez	%g6,	%g3,	%i7
	andncc	%i1,	%g2,	%l5
	bl,a,pn	%xcc,	loop_52
loop_51:
	tl	%icc,	0x6
	edge8l	%l1,	%i2,	%o0
	nop
	setx	0x9CFFB6DE7E64D062,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	fsqrtd	%f18,	%f4
loop_52:
	nop
	wr	%g0,	0xea,	%asi
	ldda	[%l7 + 0x50] %asi,	%o6
	tcs	%xcc,	0x6
	sllx	%o1,	%o7,	%i3
	wr	%g0,	0x0c,	%asi
	ldsba	[%l7 + 0x2F] %asi,	%o2
	membar	0x2A
	lduh	[%l7 + 0x70],	%i4
	or	%l2,	0x0304,	%g1
	nop
	setx	loop_53,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	tle	%icc,	0x1
	te	%xcc,	0x1
	membar	0x45
loop_53:
	movrgz	%g5,	%l4,	%i0
	mulscc	%o3,	0x0329,	%i5
	sethi	0x1740,	%l0
	sdivx	%o4,	0x012C,	%g7
	wr	%g0,	0x19,	%asi
	swapa	[%l7 + 0x28] %asi,	%i6
	subcc	%l6,	0x0889,	%l3
	ba,a	%xcc,	loop_54
	edge8	%o5,	%g6,	%g4
	movle	%xcc,	%g3,	%i1
	nop
	fitos	%f2,	%f5
	fstox	%f5,	%f18
	fxtos	%f18,	%f17
loop_54:
	tsubcc	%i7,	%g2,	%l5
	xnor	%l1,	%o0,	%o6
	nop
	setx	0x51710FC2,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f23
	setx	0xF57CDAFB,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f6
	fmuls	%f6,	%f23,	%f20
	srl	%i2,	%o7,	%i3
	fmuld8sux16	%f26,	%f30,	%f30
	bgu,a,pn	%xcc,	loop_55
	edge16n	%o1,	%o2,	%i4
	tpos	%icc,	0x5
	brlz,a	%l2,	loop_56
loop_55:
	sllx	%g5,	0x0D,	%g1
	fexpand	%f17,	%f14
	fbug	%fcc1,	loop_57
loop_56:
	nop
	setx	0x66277817B14C7684,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0x54EDFC31A086B544,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	fmuld	%f26,	%f6,	%f2
	mulscc	%l4,	%i0,	%o3
	fpadd32s	%f10,	%f28,	%f29
loop_57:
	addccc	%i5,	%l0,	%o4
	movneg	%xcc,	%i6,	%g7
	or	%l6,	0x176F,	%o5
	fand	%f16,	%f18,	%f14
	fnors	%f23,	%f7,	%f10
	fornot2	%f6,	%f22,	%f6
	xorcc	%l3,	%g6,	%g4
	edge32l	%g3,	%i7,	%i1
	fmul8sux16	%f24,	%f14,	%f24
	set	0x78, %i7
	sta	%f13,	[%l7 + %i7] 0x04
	nop
	setx	0x178BB5B4,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f14
	fsqrts	%f14,	%f13
	sllx	%g2,	%l5,	%o0
	fmovsgu	%xcc,	%f29,	%f20
	fornot2s	%f27,	%f24,	%f20
	fmovdcs	%xcc,	%f29,	%f9
	fand	%f8,	%f4,	%f16
	xnorcc	%l1,	0x0FB7,	%i2
	bge	%xcc,	loop_58
	edge8l	%o7,	%o6,	%i3
	tcc	%xcc,	0x2
	fxnors	%f16,	%f26,	%f6
loop_58:
	fcmpne32	%f12,	%f26,	%o2
	xorcc	%o1,	%i4,	%l2
	move	%xcc,	%g1,	%g5
	fornot2s	%f11,	%f24,	%f22
	fornot1	%f24,	%f2,	%f28
	tvc	%icc,	0x2
	fbg	%fcc0,	loop_59
	fba	%fcc1,	loop_60
	tcs	%xcc,	0x1
	tcc	%icc,	0x5
loop_59:
	fbue	%fcc3,	loop_61
loop_60:
	addcc	%i0,	%l4,	%i5
	movvc	%icc,	%l0,	%o4
	fmovsl	%xcc,	%f16,	%f4
loop_61:
	bgu,a	loop_62
	tpos	%icc,	0x1
	sdiv	%o3,	0x0E11,	%g7
	movgu	%xcc,	%l6,	%i6
loop_62:
	movrne	%l3,	%g6,	%g4
	nop
	setx	0x62789D454353F374,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0x652A753C47BD88B7,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	fdivd	%f12,	%f6,	%f24
	fnand	%f8,	%f8,	%f24
	fpadd32	%f12,	%f0,	%f24
	fmovdvs	%icc,	%f27,	%f21
	fbo	%fcc1,	loop_63
	add	%o5,	%i7,	%i1
	fornot1	%f20,	%f16,	%f6
	fmovspos	%icc,	%f17,	%f1
loop_63:
	movrlz	%g2,	%g3,	%l5
	udiv	%o0,	0x1E90,	%l1
	array32	%o7,	%i2,	%o6
	tvs	%xcc,	0x5
	wr	%g0,	0x88,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	brgez,a	%o2,	loop_64
	fmuld8ulx16	%f24,	%f15,	%f8
	movvc	%icc,	%i3,	%o1
	fmovrse	%l2,	%f21,	%f14
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
	movvs	%icc,	%i4,	%g5
	ldsw	[%l7 + 0x3C],	%g1
	set	0x4E, %o1
	ldsha	[%l7 + %o1] 0x81,	%l4
loop_65:
	fmovdpos	%icc,	%f12,	%f18
	nop
	fitod	%f0,	%f12
	fdtox	%f12,	%f14
	fxtod	%f14,	%f20
	edge8l	%i0,	%l0,	%i5
	tl	%xcc,	0x2
	subc	%o3,	%g7,	%o4
	movrgz	%l6,	0x23E,	%i6
	xorcc	%l3,	0x1FE8,	%g4
	bleu,a,pn	%xcc,	loop_66
	lduh	[%l7 + 0x0C],	%g6
	edge16	%o5,	%i7,	%i1
	popc	0x1D22,	%g2
loop_66:
	bshuffle	%f22,	%f24,	%f20
	nop
	setx loop_67, %l0, %l1
	jmpl %l1, %l5
	movneg	%xcc,	%g3,	%l1
	fornot2	%f30,	%f6,	%f10
	edge16n	%o7,	%o0,	%i2
loop_67:
	nop
	set	0x5C, %l5
	ldsh	[%l7 + %l5],	%o2
	fbuge,a	%fcc0,	loop_68
	nop
	setx	0x9917911B78E5816E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0xFE2FD563D9F7824E,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	fmuld	%f22,	%f8,	%f8
	tgu	%icc,	0x5
	movge	%icc,	%o6,	%i3
loop_68:
	sub	%o1,	0x10E5,	%l2
	popc	%g5,	%g1
	nop
	fitos	%f28,	%f31
	taddcc	%l4,	0x05DD,	%i0
	sth	%i4,	[%l7 + 0x08]
	andncc	%l0,	%o3,	%i5
	fbo,a	%fcc2,	loop_69
	movrlz	%o4,	0x240,	%l6
	fmovsvc	%icc,	%f12,	%f3
	tcc	%icc,	0x0
loop_69:
	te	%xcc,	0x3
	sethi	0x077D,	%i6
	andn	%g7,	%g4,	%l3
	sdivx	%o5,	0x0E27,	%g6
	ble	%xcc,	loop_70
	tsubcctv	%i1,	%i7,	%g2
	orncc	%g3,	0x0629,	%l5
	tpos	%icc,	0x0
loop_70:
	fcmple32	%f20,	%f16,	%l1
	fmovde	%icc,	%f29,	%f24
	xnorcc	%o7,	%i2,	%o0
	fors	%f28,	%f10,	%f1
	fmovdgu	%icc,	%f7,	%f6
	edge32	%o2,	%i3,	%o1
	fpack16	%f28,	%f7
	srl	%o6,	0x0C,	%l2
	brgz,a	%g1,	loop_71
	fzeros	%f0
	fpadd32s	%f12,	%f28,	%f5
	tn	%icc,	0x6
loop_71:
	fzeros	%f1
	mulx	%l4,	%g5,	%i0
	bneg,a	loop_72
	edge32ln	%i4,	%l0,	%o3
	orncc	%o4,	%i5,	%l6
	movne	%icc,	%i6,	%g4
loop_72:
	fmovdgu	%icc,	%f0,	%f11
	subc	%l3,	0x11E0,	%g7
	addcc	%g6,	%o5,	%i1
	fones	%f26
	ldstub	[%l7 + 0x59],	%i7
	tleu	%xcc,	0x7
	stx	%g2,	[%l7 + 0x08]
	movvs	%icc,	%g3,	%l1
	smulcc	%l5,	%i2,	%o0
	taddcc	%o7,	0x0E9D,	%o2
	nop
	setx	0x1B7B0295,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f5
	setx	0x2E7137B2,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f22
	fsubs	%f22,	%f5,	%f23
	tl	%xcc,	0x3
	nop
	setx	0x36F7DA2E504A8EDF,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldx	[%l7 + 0x28],	%fsr
	lduw	[%l7 + 0x68],	%i3
	movg	%icc,	%o1,	%o6
	nop
	fitos	%f4,	%f6
	fstod	%f6,	%f4
	addcc	%g1,	%l4,	%g5
	movg	%xcc,	%l2,	%i4
	stb	%l0,	[%l7 + 0x60]
	ta	%xcc,	0x5
	movgu	%xcc,	%i0,	%o3
	alignaddr	%i5,	%o4,	%i6
	fbe,a	%fcc3,	loop_73
	fbug	%fcc1,	loop_74
	udivx	%l6,	0x1BCB,	%g4
	fones	%f13
loop_73:
	fones	%f24
loop_74:
	xorcc	%g7,	0x117E,	%l3
	smulcc	%o5,	%i1,	%g6
	fbne,a	%fcc2,	loop_75
	srlx	%i7,	0x16,	%g3
	andncc	%g2,	%l5,	%l1
	array32	%i2,	%o0,	%o2
loop_75:
	tl	%icc,	0x3
	fmovs	%f30,	%f25
	subcc	%i3,	0x1C73,	%o7
	tg	%icc,	0x1
	fxnor	%f2,	%f20,	%f20
	movn	%xcc,	%o6,	%o1
	bg	loop_76
	ldsh	[%l7 + 0x2E],	%l4
	ldd	[%l7 + 0x68],	%g0
	alignaddr	%g5,	%i4,	%l2
loop_76:
	movgu	%xcc,	%i0,	%o3
	te	%icc,	0x1
	movl	%icc,	%l0,	%i5
	fmovrdgz	%o4,	%f6,	%f0
	set	0x10, %g7
	lduwa	[%l7 + %g7] 0x11,	%i6
	array16	%g4,	%l6,	%g7
	fbne,a	%fcc1,	loop_77
	fmovscc	%xcc,	%f28,	%f9
	wr	%g0,	0x89,	%asi
	ldstuba	[%l7 + 0x6E] %asi,	%l3
loop_77:
	brlez	%i1,	loop_78
	mulx	%g6,	%o5,	%i7
	fbn,a	%fcc3,	loop_79
	edge16	%g2,	%l5,	%l1
loop_78:
	te	%icc,	0x5
	mulscc	%g3,	%i2,	%o2
loop_79:
	fmovscs	%icc,	%f21,	%f20
	ld	[%l7 + 0x74],	%f29
	popc	0x0F9F,	%i3
	alignaddr	%o0,	%o7,	%o1
	tne	%icc,	0x1
	sth	%l4,	[%l7 + 0x42]
	movrgez	%o6,	%g5,	%i4
	movvs	%icc,	%l2,	%i0
	add	%l7,	0x58,	%l6
	wr	%g0,	0x11,	%asi
	casxa	[%l6] 0x11,	%o3,	%g1
	for	%f12,	%f14,	%f30
	ldsh	[%l7 + 0x5A],	%i5
	orcc	%l0,	%i6,	%g4
	nop
	setx	0x5D7C2E73,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f19
	setx	0x25B549DF,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f25
	fadds	%f25,	%f19,	%f30
	lduh	[%l7 + 0x1A],	%o4
	edge16l	%g7,	%l6,	%i1
	edge16ln	%g6,	%o5,	%l3
	set	0x60, %i1
	stba	%g2,	[%l7 + %i1] 0x27
	membar	#Sync
	edge16l	%i7,	%l1,	%l5
	sth	%g3,	[%l7 + 0x76]
	fmovdge	%xcc,	%f19,	%f1
	andcc	%o2,	%i3,	%o0
	movvs	%icc,	%i2,	%o1
	movcc	%xcc,	%o7,	%l4
	edge16n	%o6,	%i4,	%l2
	umul	%g5,	0x05DA,	%i0
	membar	0x2B
	swap	[%l7 + 0x0C],	%o3
	fzero	%f24
	add	%l7,	0x24,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] %asi,	%g1,	%i5
	std	%f24,	[%l7 + 0x50]
	bcs,a,pt	%icc,	loop_80
	ldstub	[%l7 + 0x52],	%i6
	fnot2	%f16,	%f24
	fpadd32	%f18,	%f16,	%f24
loop_80:
	fsrc1	%f2,	%f8
	udiv	%g4,	0x10C0,	%o4
	tn	%icc,	0x0
	fmovrdlz	%l0,	%f30,	%f8
	subcc	%l6,	0x0820,	%g7
	array8	%g6,	%o5,	%l3
	movge	%xcc,	%g2,	%i7
	fmovdge	%icc,	%f21,	%f29
	fandnot2	%f18,	%f14,	%f22
	set	0x68, %i3
	sta	%f18,	[%l7 + %i3] 0x18
	mulscc	%l1,	0x0175,	%i1
	fnot2	%f24,	%f14
	fmovrsne	%g3,	%f0,	%f8
	st	%f23,	[%l7 + 0x0C]
	array32	%o2,	%l5,	%o0
	subccc	%i3,	0x0837,	%o1
	brgez,a	%i2,	loop_81
	sra	%l4,	%o6,	%i4
	movle	%xcc,	%l2,	%o7
	fmovdn	%xcc,	%f24,	%f12
loop_81:
	fmovdpos	%xcc,	%f26,	%f17
	fxor	%f26,	%f30,	%f28
	edge32	%g5,	%i0,	%o3
	fmovdleu	%icc,	%f11,	%f4
	xnor	%g1,	%i5,	%g4
	subcc	%i6,	0x0A2E,	%o4
	andcc	%l6,	%l0,	%g6
	fandnot2	%f4,	%f20,	%f28
	fnot2s	%f4,	%f10
	bvc	loop_82
	sub	%o5,	%l3,	%g2
	brgz,a	%g7,	loop_83
	tgu	%xcc,	0x4
loop_82:
	brz	%i7,	loop_84
	fba	%fcc3,	loop_85
loop_83:
	movcs	%xcc,	%i1,	%g3
	movpos	%icc,	%o2,	%l5
loop_84:
	ble,pn	%xcc,	loop_86
loop_85:
	stbar
	wr	%g0,	0x81,	%asi
	swapa	[%l7 + 0x08] %asi,	%o0
loop_86:
	movne	%icc,	%i3,	%o1
	movcs	%icc,	%l1,	%i2
	array32	%o6,	%i4,	%l2
	alignaddr	%l4,	%o7,	%i0
	fpack16	%f28,	%f6
	fmovs	%f8,	%f0
	tge	%xcc,	0x4
	fcmpne16	%f26,	%f4,	%g5
	movgu	%icc,	%o3,	%i5
	fmovdgu	%icc,	%f20,	%f1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	fitod	%f8,	%f28
	fdtoi	%f28,	%f14
	nop
	setx	0x518602C7,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f12
	setx	0x50DCA3B8,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f0
	fmuls	%f0,	%f12,	%f30
	nop
	fitos	%f1,	%f19
	fstox	%f19,	%f4
	fxtos	%f4,	%f0
	mova	%xcc,	%g1,	%g4
	umul	%i6,	%o4,	%l6
	fsrc2	%f28,	%f20
	movg	%icc,	%l0,	%g6
	fblg,a	%fcc3,	loop_87
	orcc	%l3,	0x12DF,	%o5
	movrgez	%g2,	%i7,	%g7
	array16	%g3,	%i1,	%l5
loop_87:
	movle	%xcc,	%o2,	%i3
	brgez	%o0,	loop_88
	sethi	0x09DC,	%l1
	set	0x34, %o4
	stwa	%i2,	[%l7 + %o4] 0x22
	membar	#Sync
loop_88:
	fbul,a	%fcc1,	loop_89
	srlx	%o1,	%o6,	%l2
	ldd	[%l7 + 0x20],	%f24
	set	0x14, %l4
	ldswa	[%l7 + %l4] 0x14,	%i4
loop_89:
	fbule,a	%fcc3,	loop_90
	stw	%o7,	[%l7 + 0x64]
	nop
	setx	0x3F61AE77C764696F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0xD657D152524B2119,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	fsubd	%f22,	%f10,	%f6
	smulcc	%i0,	%l4,	%o3
loop_90:
	bcc	%icc,	loop_91
	call	loop_92
	subcc	%i5,	%g1,	%g5
	fbne	%fcc1,	loop_93
loop_91:
	bgu,a	loop_94
loop_92:
	brz	%i6,	loop_95
	fsrc1	%f4,	%f10
loop_93:
	edge32ln	%g4,	%l6,	%l0
loop_94:
	tvs	%xcc,	0x3
loop_95:
	membar	0x34
	stbar
	move	%xcc,	%g6,	%o4
	alignaddrl	%o5,	%l3,	%g2
	tcc	%xcc,	0x2
	tn	%xcc,	0x4
	bgu	%icc,	loop_96
	edge32	%g7,	%i7,	%g3
	srax	%i1,	0x0B,	%o2
	fpack16	%f10,	%f26
loop_96:
	edge16ln	%i3,	%l5,	%l1
	tn	%icc,	0x4
	fmovdleu	%xcc,	%f21,	%f12
	movrne	%i2,	%o1,	%o0
	movl	%icc,	%l2,	%i4
	fmovrdgz	%o6,	%f16,	%f6
	ta	%icc,	0x2
	fcmple32	%f4,	%f8,	%i0
	movneg	%xcc,	%l4,	%o3
	fcmpgt32	%f12,	%f0,	%o7
	fnors	%f14,	%f0,	%f15
	sethi	0x0804,	%i5
	membar	0x16
	bg,pt	%xcc,	loop_97
	ldx	[%l7 + 0x30],	%g1
	nop
	set	0x1D, %i2
	stb	%i6,	[%l7 + %i2]
	tvc	%xcc,	0x3
loop_97:
	fbule,a	%fcc1,	loop_98
	and	%g5,	0x00D7,	%l6
	taddcctv	%l0,	%g6,	%g4
	movl	%xcc,	%o5,	%o4
loop_98:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tn	%icc,	0x3
	sethi	0x0DC5,	%g2
	fnegs	%f14,	%f29
	fcmple16	%f12,	%f6,	%g7
	ldsb	[%l7 + 0x5A],	%l3
	orn	%i7,	0x16AB,	%g3
	ldd	[%l7 + 0x10],	%i0
	array8	%o2,	%i3,	%l1
	tsubcc	%i2,	0x004A,	%l5
	tle	%xcc,	0x1
	nop
	setx	0x30420FE0,	%l0,	%l6
	st	%l6,	[%l7 + 0x70]
	ld	[%l7 + 0x70],	%fsr
	mulx	%o1,	%o0,	%l2
	fmovdle	%xcc,	%f4,	%f18
	fmul8x16al	%f16,	%f28,	%f10
	fblg	%fcc1,	loop_99
	movne	%icc,	%o6,	%i4
	tge	%xcc,	0x4
	umulcc	%i0,	0x0322,	%o3
loop_99:
	ld	[%l7 + 0x10],	%f13
	fmovdcs	%xcc,	%f14,	%f5
	popc	%o7,	%i5
	ldx	[%l7 + 0x18],	%l4
	ba,a,pn	%xcc,	loop_100
	movg	%icc,	%i6,	%g5
	stw	%g1,	[%l7 + 0x3C]
	fsrc2s	%f1,	%f20
loop_100:
	fmuld8ulx16	%f13,	%f7,	%f8
	tgu	%icc,	0x0
	andn	%l0,	0x0E61,	%l6
	movl	%xcc,	%g4,	%g6
	addccc	%o5,	%o4,	%g2
	ldsb	[%l7 + 0x1C],	%l3
	sdiv	%i7,	0x1148,	%g7
	set	0x50, %l6
	prefetcha	[%l7 + %l6] 0x15,	 0x0
	addccc	%o2,	%i1,	%i3
	alignaddr	%i2,	%l5,	%o1
	movrgez	%o0,	%l1,	%l2
	tgu	%xcc,	0x1
	movneg	%xcc,	%o6,	%i4
	fmovdgu	%icc,	%f3,	%f27
	sllx	%o3,	0x01,	%i0
	wr	%g0,	0x89,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	ldd	[%l7 + 0x08],	%o6
	tg	%icc,	0x5
	bcs,a	%icc,	loop_101
	tgu	%xcc,	0x7
	fandnot1s	%f12,	%f19,	%f11
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
loop_101:
	subc	%i5,	0x142E,	%l4
	or	%i6,	0x1DEB,	%g5
	sir	0x1BE5
loop_102:
	movl	%icc,	%l0,	%l6
	fxnor	%f6,	%f4,	%f12
	taddcctv	%g1,	%g6,	%g4
	subccc	%o4,	0x0FD7,	%o5
	edge32n	%g2,	%l3,	%i7
	umulcc	%g3,	%g7,	%i1
	tl	%xcc,	0x2
	set	0x08, %o5
	stxa	%o2,	[%l7 + %o5] 0x2b
	membar	#Sync
	tcs	%icc,	0x1
	fmul8x16	%f6,	%f18,	%f24
	edge16l	%i2,	%l5,	%o1
	prefetch	[%l7 + 0x10],	 0x0
	alignaddr	%i3,	%o0,	%l2
	taddcctv	%o6,	%i4,	%l1
	nop
	setx	loop_103,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	sllx	%i0,	%o3,	%o7
	fmovrdlez	%i5,	%f28,	%f18
	orcc	%i6,	%g5,	%l4
loop_103:
	fpsub16	%f30,	%f4,	%f8
	movvs	%xcc,	%l0,	%l6
	movgu	%icc,	%g6,	%g1
	add	%o4,	%o5,	%g4
	tl	%icc,	0x3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbul,a	%fcc3,	loop_104
	orncc	%l3,	0x0A74,	%g2
	stx	%i7,	[%l7 + 0x78]
	fbul	%fcc3,	loop_105
loop_104:
	edge8ln	%g3,	%g7,	%o2
	orn	%i1,	0x0402,	%l5
	ba,a	loop_106
loop_105:
	tg	%xcc,	0x7
	taddcctv	%i2,	%o1,	%o0
	stw	%l2,	[%l7 + 0x1C]
loop_106:
	edge32n	%i3,	%o6,	%i4
	fpadd16	%f0,	%f22,	%f10
	bn	%icc,	loop_107
	movl	%xcc,	%i0,	%l1
	sra	%o7,	%i5,	%i6
	srlx	%g5,	%l4,	%o3
loop_107:
	edge16ln	%l0,	%g6,	%l6
	orncc	%g1,	0x01D8,	%o4
	taddcctv	%g4,	0x0CD2,	%o5
	movvs	%xcc,	%g2,	%l3
	bvs	loop_108
	fxnor	%f24,	%f4,	%f2
	wr	%g0,	0x10,	%asi
	ldswa	[%l7 + 0x08] %asi,	%i7
loop_108:
	nop
	wr	%g0,	0x88,	%asi
	ldstuba	[%l7 + 0x2B] %asi,	%g7
	movg	%icc,	%o2,	%i1
	tvs	%icc,	0x6
	srl	%l5,	%i2,	%o1
	brnz,a	%o0,	loop_109
	tgu	%icc,	0x6
	tsubcc	%g3,	%i3,	%l2
	movle	%xcc,	%o6,	%i0
loop_109:
	sir	0x0688
	set	0x68, %l0
	sta	%f3,	[%l7 + %l0] 0x10
	brnz,a	%l1,	loop_110
	nop
	fitod	%f18,	%f2
	bvc	loop_111
	fbne	%fcc1,	loop_112
loop_110:
	subccc	%i4,	0x04FA,	%o7
	fone	%f14
loop_111:
	umul	%i5,	%g5,	%l4
loop_112:
	fmovspos	%xcc,	%f16,	%f9
	fornot2	%f20,	%f18,	%f18
	tcs	%icc,	0x5
	sllx	%o3,	%l0,	%g6
	edge16	%i6,	%l6,	%g1
	taddcctv	%o4,	0x047C,	%o5
	srax	%g4,	0x08,	%l3
	set	0x50, %o6
	sta	%f3,	[%l7 + %o6] 0x81
	nop
	fitos	%f8,	%f23
	fstox	%f23,	%f16
	fxtos	%f16,	%f14
	smulcc	%g2,	0x12DC,	%g7
	wr	%g0,	0x18,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	wr	%g0,	0x88,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	fmovrdlez	%o2,	%f14,	%f28
	umulcc	%i7,	%i1,	%l5
	stw	%i2,	[%l7 + 0x20]
	andcc	%o0,	%g3,	%o1
	xorcc	%i3,	0x0770,	%l2
	ldsh	[%l7 + 0x38],	%o6
	nop
	fitod	%f4,	%f10
	fdtos	%f10,	%f29
	tn	%icc,	0x5
	fpack32	%f2,	%f20,	%f12
	tl	%icc,	0x5
	fsrc2	%f0,	%f2
	set	0x28, %g4
	sta	%f28,	[%l7 + %g4] 0x88
	fmovscs	%xcc,	%f26,	%f2
	swap	[%l7 + 0x68],	%l1
	sll	%i4,	%o7,	%i0
	sir	0x04BA
	std	%f26,	[%l7 + 0x10]
	subc	%i5,	0x1AD5,	%g5
	array16	%o3,	%l0,	%g6
	sethi	0x07D3,	%l4
	fpsub16s	%f9,	%f14,	%f17
	fexpand	%f0,	%f18
	taddcctv	%l6,	0x1D84,	%i6
	movrlz	%g1,	0x226,	%o5
	fpadd32s	%f12,	%f27,	%f26
	addcc	%o4,	%l3,	%g2
	andcc	%g4,	%g7,	%o2
	srax	%i1,	%l5,	%i2
	fsrc1s	%f14,	%f25
	fcmple16	%f26,	%f30,	%i7
	fpsub32s	%f22,	%f21,	%f28
	fmovrdgz	%g3,	%f24,	%f26
	edge32n	%o1,	%i3,	%o0
	sub	%l2,	0x1BED,	%o6
	brz,a	%i4,	loop_113
	fpackfix	%f26,	%f12
	orncc	%l1,	0x1C92,	%i0
	tleu	%icc,	0x3
loop_113:
	and	%i5,	%o7,	%o3
	edge8l	%l0,	%g5,	%g6
	ldstub	[%l7 + 0x4E],	%l4
	fornot1s	%f29,	%f10,	%f8
	mulx	%i6,	0x0173,	%l6
	wr	%g0,	0x89,	%asi
	sta	%f7,	[%l7 + 0x50] %asi
	movl	%icc,	%o5,	%g1
	fbe,a	%fcc1,	loop_114
	edge32	%l3,	%g2,	%g4
	taddcc	%o4,	0x0BF5,	%o2
	tneg	%xcc,	0x7
loop_114:
	tle	%icc,	0x6
	fbue	%fcc2,	loop_115
	edge16	%g7,	%l5,	%i2
	fornot1	%f4,	%f8,	%f28
	addccc	%i7,	%g3,	%i1
loop_115:
	nop
	set	0x1C, %g6
	prefetch	[%l7 + %g6],	 0x3
	popc	0x1415,	%i3
	edge8n	%o0,	%o1,	%o6
	sllx	%i4,	0x08,	%l1
	fxor	%f2,	%f20,	%f8
	xorcc	%l2,	%i5,	%i0
	wr	%g0,	0x19,	%asi
	lduba	[%l7 + 0x42] %asi,	%o3
	movrlez	%l0,	0x28E,	%g5
	fmovsle	%xcc,	%f10,	%f12
	set	0x70, %i4
	ldxa	[%l7 + %i4] 0x89,	%o7
	xorcc	%g6,	%i6,	%l4
	tgu	%icc,	0x5
	fbne	%fcc1,	loop_116
	membar	0x40
	array32	%o5,	%l6,	%g1
	fmovsvs	%xcc,	%f15,	%f23
loop_116:
	nop
	setx	loop_117,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	edge32ln	%l3,	%g2,	%g4
	popc	%o2,	%g7
	fmul8x16	%f15,	%f20,	%f8
loop_117:
	nop
	fitod	%f2,	%f24
	fdtos	%f24,	%f1
	ta	%icc,	0x4
	bge,a,pt	%xcc,	loop_118
	movpos	%xcc,	%o4,	%l5
	wr	%g0,	0x80,	%asi
	lduba	[%l7 + 0x46] %asi,	%i7
loop_118:
	fsrc1	%f4,	%f6
	edge16ln	%g3,	%i2,	%i3
	subc	%o0,	0x0AC7,	%i1
	edge8ln	%o1,	%o6,	%i4
	movneg	%icc,	%l2,	%l1
	bvc,pt	%xcc,	loop_119
	tn	%icc,	0x2
	movvc	%xcc,	%i5,	%o3
	array32	%l0,	%g5,	%o7
loop_119:
	andn	%i0,	%g6,	%i6
	fblg,a	%fcc1,	loop_120
	subcc	%l4,	%l6,	%o5
	std	%f26,	[%l7 + 0x18]
	tleu	%icc,	0x1
loop_120:
	srlx	%l3,	0x17,	%g1
	fpsub32s	%f1,	%f27,	%f10
	fmovdl	%icc,	%f23,	%f21
	sub	%g4,	0x0F32,	%o2
	edge8ln	%g7,	%o4,	%g2
	tgu	%icc,	0x3
	flush	%l7 + 0x30
	sra	%l5,	%i7,	%i2
	fmul8sux16	%f24,	%f6,	%f18
	orn	%g3,	0x0C4E,	%o0
	movpos	%xcc,	%i1,	%i3
	edge16ln	%o1,	%i4,	%l2
	fornot2s	%f11,	%f6,	%f4
	move	%icc,	%o6,	%i5
	fmovdle	%xcc,	%f25,	%f24
	edge16ln	%l1,	%o3,	%g5
	edge16l	%l0,	%o7,	%i0
	edge32n	%i6,	%g6,	%l6
	movn	%icc,	%l4,	%l3
	fmovdne	%icc,	%f27,	%f5
	set	0x50, %i5
	ldda	[%l7 + %i5] 0x2e,	%o4
	bneg,pt	%xcc,	loop_121
	mulx	%g1,	%o2,	%g7
	movrlez	%g4,	%g2,	%l5
	xnor	%o4,	0x07AD,	%i7
loop_121:
	flush	%l7 + 0x54
	fands	%f16,	%f1,	%f0
	popc	%g3,	%o0
	fxnors	%f12,	%f25,	%f1
	array16	%i1,	%i2,	%o1
	movrne	%i3,	0x2AD,	%l2
	taddcctv	%i4,	%i5,	%o6
	pdist	%f0,	%f26,	%f22
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
	bge,a	loop_123
	edge32ln	%o3,	%g5,	%l0
	movcc	%xcc,	%l1,	%o7
loop_122:
	fbg	%fcc1,	loop_124
loop_123:
	nop
	set	0x3C, %g3
	stb	%i0,	[%l7 + %g3]
	add	%l7,	0x58,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%i6,	%g6
loop_124:
	bneg,a	loop_125
	xor	%l6,	0x1D8D,	%l4
	fmovsne	%icc,	%f24,	%f22
	sll	%l3,	0x0F,	%o5
loop_125:
	movrlez	%g1,	%g7,	%g4
	fexpand	%f15,	%f4
	nop
	fitos	%f11,	%f6
	fstod	%f6,	%f20
	sir	0x1112
	movrgz	%o2,	%g2,	%l5
	movrlez	%i7,	0x29F,	%o4
	sll	%g3,	0x0A,	%o0
	udiv	%i2,	0x1C26,	%i1
	sethi	0x10A0,	%o1
	edge8l	%i3,	%l2,	%i4
	sdiv	%i5,	0x0382,	%o3
	nop
	fitos	%f10,	%f19
	fble	%fcc1,	loop_126
	orncc	%o6,	0x0D15,	%l0
	xorcc	%l1,	0x1A57,	%g5
	bcs,a	loop_127
loop_126:
	srax	%i0,	%i6,	%g6
	brz	%l6,	loop_128
	array8	%o7,	%l4,	%o5
loop_127:
	edge8l	%g1,	%g7,	%g4
	sethi	0x15A8,	%o2
loop_128:
	smul	%g2,	0x0238,	%l3
	alignaddr	%l5,	%i7,	%g3
	movge	%xcc,	%o0,	%o4
	subccc	%i2,	%i1,	%i3
	add	%l7,	0x18,	%l6
	wr	%g0,	0x11,	%asi
	casxa	[%l6] 0x11,	%o1,	%i4
	umul	%l2,	%i5,	%o3
	fpsub16s	%f14,	%f3,	%f14
	tneg	%icc,	0x6
	movleu	%icc,	%l0,	%l1
	fmovrdgez	%o6,	%f4,	%f4
	mova	%icc,	%i0,	%i6
	movge	%xcc,	%g6,	%l6
	umul	%o7,	0x1C1A,	%g5
	wr	%g0,	0xe2,	%asi
	stwa	%o5,	[%l7 + 0x28] %asi
	membar	#Sync
	ldsb	[%l7 + 0x34],	%g1
	bcc,a	%xcc,	loop_129
	edge32	%g7,	%l4,	%o2
	tpos	%icc,	0x0
	ldstub	[%l7 + 0x4B],	%g2
loop_129:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	smulcc	%l3,	0x13F9,	%g4
	ldsb	[%l7 + 0x26],	%i7
	tsubcctv	%l5,	%o0,	%g3
	bneg,a,pt	%icc,	loop_130
	fornot2	%f6,	%f16,	%f16
	wr	%g0,	0x24,	%asi
	ldda	[%l7 + 0x30] %asi,	%i2
loop_130:
	fsrc1	%f28,	%f10
	sdivx	%i1,	0x11F6,	%o4
	movrlez	%i3,	0x3FC,	%o1
	fmovdle	%icc,	%f29,	%f6
	edge16	%l2,	%i4,	%o3
	tsubcc	%l0,	%l1,	%i5
	xor	%o6,	0x098A,	%i6
	fnot1s	%f10,	%f0
	movrne	%i0,	%g6,	%o7
	udivcc	%g5,	0x1C17,	%o5
	fmovde	%icc,	%f17,	%f6
	te	%xcc,	0x4
	subccc	%g1,	%g7,	%l4
	subc	%l6,	0x06FB,	%o2
	addccc	%l3,	%g4,	%i7
	fpack16	%f22,	%f8
	edge8n	%g2,	%l5,	%g3
	edge8n	%o0,	%i1,	%i2
	smul	%i3,	%o1,	%o4
	tg	%xcc,	0x4
	add	%l2,	0x111B,	%i4
	tcc	%icc,	0x7
	movl	%icc,	%l0,	%o3
	andcc	%l1,	0x0D03,	%i5
	movrlez	%i6,	0x202,	%i0
	subcc	%o6,	%o7,	%g5
	fbe	%fcc0,	loop_131
	mulx	%o5,	%g6,	%g1
	fmovse	%xcc,	%f30,	%f9
	bleu,pn	%icc,	loop_132
loop_131:
	nop
	fitos	%f1,	%f5
	fstox	%f5,	%f4
	fxtos	%f4,	%f15
	nop
	fitos	%f2,	%f21
	fstox	%f21,	%f18
	fxtos	%f18,	%f17
	fornot1	%f28,	%f12,	%f18
loop_132:
	call	loop_133
	tneg	%xcc,	0x0
	edge16l	%g7,	%l6,	%l4
	xnorcc	%o2,	%g4,	%i7
loop_133:
	edge16	%g2,	%l5,	%l3
	sdivx	%o0,	0x170E,	%i1
	and	%i2,	0x0023,	%i3
	fzero	%f20
	fmovdg	%xcc,	%f26,	%f5
	swap	[%l7 + 0x20],	%o1
	tvc	%xcc,	0x2
	srlx	%o4,	%l2,	%i4
	fmovdn	%xcc,	%f19,	%f12
	wr	%g0,	0x80,	%asi
	swapa	[%l7 + 0x68] %asi,	%g3
	fmovrdgez	%l0,	%f14,	%f14
	bpos,a,pn	%xcc,	loop_134
	taddcc	%l1,	0x15B7,	%i5
	brgz,a	%o3,	loop_135
	bn,pn	%icc,	loop_136
loop_134:
	fnot2s	%f21,	%f16
	bge,pn	%icc,	loop_137
loop_135:
	sub	%i0,	%i6,	%o7
loop_136:
	udivx	%o6,	0x02C2,	%g5
	popc	%o5,	%g6
loop_137:
	te	%xcc,	0x2
	bn,pt	%icc,	loop_138
	tg	%xcc,	0x2
	movleu	%icc,	%g7,	%l6
	movrne	%l4,	0x369,	%g1
loop_138:
	smulcc	%o2,	0x16E9,	%i7
	smul	%g4,	0x0911,	%g2
	bvs,a	loop_139
	srax	%l3,	0x0A,	%l5
	edge16ln	%i1,	%i2,	%o0
	movrlez	%o1,	%i3,	%l2
loop_139:
	edge32ln	%o4,	%g3,	%i4
	movrgz	%l1,	%l0,	%o3
	addcc	%i0,	%i5,	%o7
	fnands	%f24,	%f23,	%f11
	movl	%icc,	%i6,	%g5
	tpos	%xcc,	0x1
	fmovrsne	%o5,	%f19,	%f28
	fmovdneg	%xcc,	%f31,	%f24
	set	0x4A, %i0
	stba	%o6,	[%l7 + %i0] 0x0c
	brnz	%g7,	loop_140
	fnegd	%f18,	%f12
	tle	%icc,	0x7
	set	0x70, %i6
	sta	%f0,	[%l7 + %i6] 0x18
loop_140:
	movrne	%l6,	0x125,	%l4
	tgu	%xcc,	0x3
	lduh	[%l7 + 0x32],	%g1
	fmovscs	%icc,	%f16,	%f3
	wr	%g0,	0x0c,	%asi
	lduha	[%l7 + 0x5C] %asi,	%g6
	movne	%icc,	%o2,	%i7
	wr	%g0,	0x2e,	%asi
	ldda	[%l7 + 0x50] %asi,	%g2
	be,a	loop_141
	tle	%icc,	0x4
	edge32	%l3,	%l5,	%g4
	wr	%g0,	0x04,	%asi
	ldswa	[%l7 + 0x70] %asi,	%i2
loop_141:
	udivx	%o0,	0x1DF1,	%i1
	nop
	setx	0x58A3FA5D1095F299,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	fsqrtd	%f26,	%f6
	edge8n	%o1,	%i3,	%l2
	fmovrdgz	%o4,	%f4,	%f0
	mulx	%i4,	0x14DC,	%g3
	andn	%l0,	0x1A63,	%o3
	edge32n	%l1,	%i0,	%i5
	tsubcctv	%i6,	%o7,	%g5
	sra	%o6,	0x06,	%o5
	tneg	%xcc,	0x6
	mulx	%g7,	0x0AF6,	%l4
	xnorcc	%g1,	0x0F02,	%l6
	nop
	fitos	%f5,	%f9
	tg	%icc,	0x7
	ldub	[%l7 + 0x47],	%g6
	fcmple16	%f12,	%f20,	%o2
	fpadd16	%f4,	%f0,	%f8
	fmovdl	%icc,	%f9,	%f28
	fbu,a	%fcc2,	loop_142
	sll	%g2,	0x1F,	%l3
	array32	%l5,	%g4,	%i7
	fmovscc	%icc,	%f5,	%f14
loop_142:
	fmovspos	%xcc,	%f7,	%f11
	wr	%g0,	0x10,	%asi
	sta	%f20,	[%l7 + 0x64] %asi
	popc	%i2,	%o0
	movrgez	%o1,	%i3,	%l2
	set	0x34, %l3
	swapa	[%l7 + %l3] 0x89,	%i1
	nop
	setx	0x8049DB31,	%l0,	%l6
	st	%l6,	[%l7 + 0x7C]
	ld	[%l7 + 0x7C],	%fsr
	smul	%i4,	%g3,	%o4
	move	%xcc,	%o3,	%l1
	fmovdvs	%icc,	%f3,	%f0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subc	%i0,	%i5,	%i6
	movle	%xcc,	%o7,	%l0
	lduh	[%l7 + 0x76],	%o6
	movpos	%xcc,	%g5,	%o5
	ldub	[%l7 + 0x63],	%g7
	fand	%f14,	%f10,	%f4
	and	%l4,	0x0187,	%l6
	movge	%xcc,	%g1,	%g6
	mulscc	%o2,	%l3,	%l5
	movne	%icc,	%g2,	%g4
	bleu,a	%icc,	loop_143
	umul	%i7,	%o0,	%o1
	be,a,pt	%xcc,	loop_144
	movneg	%xcc,	%i2,	%l2
loop_143:
	sub	%i3,	0x1658,	%i4
	movvs	%xcc,	%i1,	%o4
loop_144:
	tsubcctv	%o3,	0x13F9,	%l1
	tle	%icc,	0x7
	ldd	[%l7 + 0x28],	%f2
	fornot1	%f22,	%f26,	%f22
	taddcc	%i0,	%i5,	%i6
	tle	%icc,	0x4
	andn	%g3,	%l0,	%o6
	edge8	%g5,	%o5,	%o7
	add	%l4,	%g7,	%l6
	ta	%icc,	0x2
	tcs	%xcc,	0x1
	fba,a	%fcc1,	loop_145
	fmovscs	%xcc,	%f14,	%f24
	movrlez	%g6,	%g1,	%l3
	or	%l5,	0x0ED9,	%o2
loop_145:
	tvc	%xcc,	0x0
	movl	%icc,	%g4,	%g2
	taddcc	%i7,	0x01B7,	%o1
	alignaddr	%o0,	%i2,	%l2
	tcc	%icc,	0x6
	xnorcc	%i3,	%i4,	%i1
	nop
	fitos	%f0,	%f25
	fstoi	%f25,	%f17
	ldub	[%l7 + 0x53],	%o3
	movre	%o4,	0x1C4,	%i0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fxnors	%f18,	%f3,	%f6
	fmovdvc	%icc,	%f8,	%f12
	movg	%icc,	%l1,	%i5
	fmul8ulx16	%f4,	%f18,	%f26
	be	%xcc,	loop_146
	movle	%xcc,	%i6,	%g3
	ldd	[%l7 + 0x70],	%f18
	tvc	%icc,	0x1
loop_146:
	fmovrslz	%l0,	%f10,	%f24
	fornot2s	%f2,	%f21,	%f17
	brgz,a	%o6,	loop_147
	ldsh	[%l7 + 0x56],	%g5
	fsrc1s	%f21,	%f0
	tg	%xcc,	0x6
loop_147:
	fmovrdne	%o5,	%f6,	%f0
	andncc	%l4,	%o7,	%l6
	tsubcctv	%g6,	%g7,	%l3
	membar	0x2A
	fpsub16	%f30,	%f12,	%f14
	tcs	%xcc,	0x3
	fandnot1s	%f24,	%f30,	%f16
	bcc,a	loop_148
	tle	%xcc,	0x0
	bpos,pn	%icc,	loop_149
	fmovda	%icc,	%f13,	%f29
loop_148:
	fones	%f10
	fmul8x16al	%f16,	%f23,	%f8
loop_149:
	nop
	setx loop_150, %l0, %l1
	jmpl %l1, %g1
	movle	%icc,	%l5,	%g4
	nop
	setx	0xB253A126,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f6
	fsqrts	%f6,	%f10
	set	0x08, %g1
	ldswa	[%l7 + %g1] 0x0c,	%o2
loop_150:
	movrlz	%g2,	0x035,	%o1
	sir	0x123F
	ldstub	[%l7 + 0x4A],	%i7
	fmuld8sux16	%f9,	%f20,	%f16
	fmovsl	%icc,	%f1,	%f6
	tcc	%xcc,	0x4
	membar	#Sync
	set	0x40, %g5
	ldda	[%l7 + %g5] 0xf0,	%f16
	fnors	%f5,	%f24,	%f9
	wr	%g0,	0x0c,	%asi
	swapa	[%l7 + 0x44] %asi,	%o0
	edge8l	%l2,	%i3,	%i4
	ldsb	[%l7 + 0x30],	%i1
	array16	%o3,	%o4,	%i2
	fbe	%fcc2,	loop_151
	sra	%l1,	0x17,	%i0
	be,a	%icc,	loop_152
	mova	%xcc,	%i6,	%g3
loop_151:
	andn	%l0,	0x1203,	%i5
	fornot1s	%f0,	%f2,	%f11
loop_152:
	nop
	set	0x78, %l1
	prefetcha	[%l7 + %l1] 0x14,	 0x1
	set	0x48, %o7
	stxa	%o5,	[%l7 + %o7] 0x27
	membar	#Sync
	fbn	%fcc1,	loop_153
	subccc	%l4,	0x064C,	%g5
	movg	%xcc,	%o7,	%l6
	wr	%g0,	0x04,	%asi
	ldsha	[%l7 + 0x64] %asi,	%g7
loop_153:
	ta	%icc,	0x6
	smul	%g6,	0x0014,	%l3
	set	0x70, %o0
	ldxa	[%l7 + %o0] 0x88,	%g1
	lduw	[%l7 + 0x70],	%g4
	brgez	%l5,	loop_154
	fabss	%f10,	%f8
	fblg	%fcc3,	loop_155
	orcc	%o2,	0x196B,	%g2
loop_154:
	fsrc2	%f30,	%f26
	fornot2s	%f20,	%f7,	%f15
loop_155:
	subccc	%o1,	%i7,	%l2
	xor	%o0,	%i4,	%i1
	fandnot2	%f18,	%f10,	%f12
	bg,pn	%icc,	loop_156
	tneg	%icc,	0x4
	nop
	set	0x4E, %l2
	lduh	[%l7 + %l2],	%o3
	edge16n	%o4,	%i2,	%i3
loop_156:
	fbe	%fcc0,	loop_157
	andn	%i0,	0x0C11,	%i6
	wr	%g0,	0x11,	%asi
	stba	%g3,	[%l7 + 0x32] %asi
loop_157:
	bpos,pt	%xcc,	loop_158
	fpack16	%f12,	%f4
	tsubcctv	%l1,	%l0,	%i5
	edge32	%o5,	%l4,	%o6
loop_158:
	udivx	%g5,	0x03DA,	%o7
	faligndata	%f22,	%f8,	%f26
	wr	%g0,	0x0c,	%asi
	swapa	[%l7 + 0x1C] %asi,	%g7
	edge32	%l6,	%g6,	%l3
	bvc,a,pt	%icc,	loop_159
	nop
	fitod	%f26,	%f28
	sethi	0x032D,	%g4
	tl	%xcc,	0x5
loop_159:
	tne	%icc,	0x4
	movge	%xcc,	%g1,	%o2
	membar	0x27
	fmovscs	%xcc,	%f19,	%f1
	tneg	%icc,	0x3
	popc	%g2,	%o1
	movg	%xcc,	%l5,	%i7
	brnz	%o0,	loop_160
	movrne	%l2,	%i1,	%o3
	fbne	%fcc1,	loop_161
	fmovrsgez	%o4,	%f20,	%f7
loop_160:
	sdivcc	%i4,	0x1CA1,	%i3
	bpos,a,pt	%icc,	loop_162
loop_161:
	movvc	%xcc,	%i2,	%i0
	wr	%g0,	0x04,	%asi
	ldsba	[%l7 + 0x52] %asi,	%i6
loop_162:
	tge	%xcc,	0x6
	fmovdcs	%xcc,	%f31,	%f11
	stw	%l1,	[%l7 + 0x24]
	bcs,pt	%xcc,	loop_163
	tneg	%xcc,	0x4
	fbn	%fcc0,	loop_164
	fbge	%fcc3,	loop_165
loop_163:
	fbuge,a	%fcc0,	loop_166
	tneg	%xcc,	0x5
loop_164:
	edge8n	%g3,	%l0,	%i5
loop_165:
	tgu	%xcc,	0x1
loop_166:
	srlx	%o5,	0x10,	%l4
	wr	%g0,	0x88,	%asi
	prefetcha	[%l7 + 0x40] %asi,	 0x0
	srlx	%o7,	%g7,	%l6
	tneg	%icc,	0x0
	brnz,a	%g6,	loop_167
	bcc	loop_168
	tsubcctv	%g5,	%l3,	%g1
	set	0x32, %g2
	stba	%o2,	[%l7 + %g2] 0x11
loop_167:
	fand	%f4,	%f24,	%f28
loop_168:
	sll	%g4,	%o1,	%l5
	tge	%icc,	0x1
	smul	%i7,	%g2,	%o0
	xor	%i1,	%l2,	%o4
	xnor	%o3,	%i4,	%i2
	tne	%icc,	0x5
	orncc	%i3,	%i0,	%l1
	fpsub32s	%f29,	%f24,	%f9
	edge16	%i6,	%g3,	%i5
	srl	%l0,	%l4,	%o6
	sir	0x0EAA
	brlez,a	%o7,	loop_169
	fmovsvc	%xcc,	%f27,	%f12
	addc	%g7,	%o5,	%l6
	stbar
loop_169:
	movn	%xcc,	%g5,	%g6
	andncc	%g1,	%l3,	%g4
	set	0x4C, %o3
	ldswa	[%l7 + %o3] 0x19,	%o1
	edge8	%o2,	%i7,	%g2
	edge8n	%o0,	%i1,	%l2
	bl	loop_170
	sethi	0x030E,	%o4
	array32	%l5,	%o3,	%i2
	nop
	fitod	%f11,	%f30
loop_170:
	nop
	set	0x2A, %i7
	lduh	[%l7 + %i7],	%i3
	addcc	%i4,	%l1,	%i6
	sra	%i0,	%i5,	%g3
	fmovdne	%icc,	%f14,	%f21
	move	%icc,	%l4,	%o6
	edge32n	%o7,	%l0,	%o5
	fmovsl	%icc,	%f8,	%f11
	srlx	%g7,	0x03,	%g5
	xor	%l6,	0x098A,	%g6
	orn	%l3,	%g1,	%g4
	udiv	%o1,	0x1AD0,	%o2
	fmovscc	%xcc,	%f21,	%f12
	set	0x30, %o1
	ldda	[%l7 + %o1] 0x89,	%i6
	ldsw	[%l7 + 0x58],	%g2
	fxnor	%f24,	%f0,	%f22
	movrlez	%i1,	%o0,	%o4
	alignaddrl	%l5,	%l2,	%o3
	andcc	%i2,	%i3,	%l1
	tcc	%xcc,	0x5
	movne	%xcc,	%i6,	%i0
	fmovsleu	%xcc,	%f6,	%f28
	movl	%xcc,	%i4,	%i5
	taddcctv	%l4,	0x127F,	%o6
	sdiv	%o7,	0x1AB1,	%l0
	popc	%g3,	%o5
	edge8l	%g7,	%g5,	%l6
	or	%g6,	%g1,	%l3
	ba	%icc,	loop_171
	fmovsgu	%xcc,	%f7,	%f0
	fbo,a	%fcc3,	loop_172
	movpos	%icc,	%o1,	%o2
loop_171:
	tsubcc	%g4,	%g2,	%i1
	tg	%xcc,	0x0
loop_172:
	sra	%i7,	0x0D,	%o0
	movrne	%l5,	%o4,	%o3
	tneg	%icc,	0x7
	fcmpne32	%f18,	%f22,	%i2
	edge8l	%l2,	%l1,	%i6
	edge16l	%i0,	%i4,	%i3
	movrgz	%i5,	0x213,	%l4
	fornot1	%f18,	%f6,	%f8
	sir	0x01EB
	udivcc	%o6,	0x1C61,	%l0
	nop
	fitos	%f6,	%f9
	fstox	%f9,	%f24
	sth	%o7,	[%l7 + 0x54]
	fmul8sux16	%f2,	%f28,	%f16
	mulx	%o5,	0x0F86,	%g7
	add	%l7,	0x08,	%l6
	wr	%g0,	0x18,	%asi
	lda	[%l6] %asi,	%g3
	casa	[%l6] 0x18,	%g3,	%l6
	smulcc	%g5,	%g6,	%g1
	fnor	%f20,	%f22,	%f28
	movleu	%xcc,	%l3,	%o2
	nop
	setx	0x9040C640,	%l0,	%l6
	st	%l6,	[%l7 + 0x30]
	ld	[%l7 + 0x30],	%fsr
	te	%xcc,	0x4
	edge16n	%o1,	%g4,	%g2
	movneg	%icc,	%i1,	%o0
	udiv	%i7,	0x09A5,	%l5
	ldub	[%l7 + 0x41],	%o4
	fmovspos	%icc,	%f16,	%f11
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
	sir	0x17AD
	fbue,a	%fcc0,	loop_174
	xnorcc	%o3,	0x1455,	%l2
loop_173:
	tneg	%xcc,	0x7
	fbu,a	%fcc0,	loop_175
loop_174:
	movrgz	%l1,	%i2,	%i0
	edge16n	%i4,	%i3,	%i6
	wr	%g0,	0x19,	%asi
	ldstuba	[%l7 + 0x64] %asi,	%i5
loop_175:
	movrlez	%l4,	%l0,	%o7
	bgu,pn	%icc,	loop_176
	swap	[%l7 + 0x68],	%o5
	fbn,a	%fcc2,	loop_177
	te	%xcc,	0x0
loop_176:
	movrne	%g7,	0x2A5,	%o6
	nop
	fitod	%f4,	%f0
	fdtos	%f0,	%f14
loop_177:
	fbo,a	%fcc2,	loop_178
	fxnor	%f18,	%f26,	%f22
	fsrc2s	%f28,	%f26
	movcs	%xcc,	%l6,	%g5
loop_178:
	movn	%icc,	%g3,	%g1
	fmovdne	%icc,	%f26,	%f24
	add	%l3,	%g6,	%o1
	brnz,a	%o2,	loop_179
	fmovsne	%icc,	%f30,	%f2
	andn	%g4,	%i1,	%o0
	tne	%icc,	0x1
loop_179:
	nop
	setx	0x88389E28B60A8B01,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0xF3C0B784296292AC,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	fmuld	%f18,	%f28,	%f18
	fblg,a	%fcc3,	loop_180
	fxor	%f20,	%f28,	%f26
	ldx	[%l7 + 0x78],	%g2
	tne	%xcc,	0x7
loop_180:
	edge8	%i7,	%l5,	%o4
	udiv	%l2,	0x0107,	%o3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sir	0x0460
	bneg,a,pt	%xcc,	loop_181
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x10, %l5
	ldda	[%l7 + %l5] 0x14,	%l0
loop_181:
	umul	%i2,	%i0,	%i4
	taddcctv	%i3,	%i5,	%l4
	tsubcctv	%i6,	0x0A7C,	%o7
	tvs	%icc,	0x7
	wr	%g0,	0x19,	%asi
	ldsha	[%l7 + 0x5C] %asi,	%l0
	tle	%icc,	0x3
	edge32n	%o5,	%o6,	%l6
	movge	%xcc,	%g5,	%g7
	bcs,a	loop_182
	bn,a	loop_183
	array16	%g3,	%l3,	%g1
	fpsub32	%f26,	%f24,	%f6
loop_182:
	nop
	wr	%g0,	0x11,	%asi
	ldxa	[%l7 + 0x68] %asi,	%o1
loop_183:
	umul	%g6,	%o2,	%i1
	brlez	%g4,	loop_184
	add	%g2,	0x0E3E,	%o0
	edge8ln	%l5,	%o4,	%i7
	sub	%l2,	0x06C9,	%l1
loop_184:
	fbue	%fcc3,	loop_185
	fmovrdne	%i2,	%f20,	%f22
	srlx	%i0,	0x18,	%i4
	mova	%xcc,	%o3,	%i5
loop_185:
	nop
	setx loop_186, %l0, %l1
	jmpl %l1, %i3
	srl	%i6,	0x0F,	%l4
	ldd	[%l7 + 0x68],	%l0
	set	0x08, %o2
	lda	[%l7 + %o2] 0x19,	%f23
loop_186:
	bleu,a	%xcc,	loop_187
	edge8ln	%o7,	%o5,	%l6
	fands	%f24,	%f7,	%f22
	set	0x48, %g7
	stxa	%o6,	[%l7 + %g7] 0x18
loop_187:
	movrgz	%g5,	%g7,	%g3
	nop
	setx	loop_188,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	umul	%l3,	0x1F4B,	%g1
	udivx	%g6,	0x1583,	%o2
	fbl	%fcc0,	loop_189
loop_188:
	fmovscs	%xcc,	%f25,	%f6
	xorcc	%i1,	%o1,	%g2
	fsrc1s	%f11,	%f0
loop_189:
	nop
	membar	#Sync
	set	0x40, %i3
	ldda	[%l7 + %i3] 0xf1,	%f16
	sdivcc	%g4,	0x1CB4,	%o0
	sra	%o4,	0x02,	%l5
	tleu	%icc,	0x6
	fbue,a	%fcc0,	loop_190
	movle	%xcc,	%i7,	%l1
	fxnors	%f22,	%f23,	%f28
	add	%l7,	0x58,	%l6
	wr	%g0,	0x10,	%asi
	lda	[%l6] %asi,	%i2
	casa	[%l6] 0x10,	%i2,	%l2
loop_190:
	alignaddr	%i4,	%i0,	%i5
	brgez,a	%i3,	loop_191
	mova	%xcc,	%i6,	%l4
	bn	loop_192
	fcmpne16	%f28,	%f28,	%l0
loop_191:
	umul	%o7,	%o5,	%o3
	fba	%fcc1,	loop_193
loop_192:
	tneg	%xcc,	0x5
	andcc	%o6,	%l6,	%g5
	tg	%icc,	0x3
loop_193:
	ld	[%l7 + 0x60],	%f3
	movgu	%xcc,	%g7,	%g3
	ldsb	[%l7 + 0x45],	%g1
	fba	%fcc2,	loop_194
	andcc	%g6,	0x1D99,	%o2
	bvs,a,pn	%xcc,	loop_195
	sdivcc	%i1,	0x064F,	%l3
loop_194:
	nop
	setx	0x3BDF89E3,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f16
	setx	0xEBD0FBA7,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f21
	fsubs	%f21,	%f16,	%f3
	fnot2s	%f27,	%f16
loop_195:
	addccc	%g2,	0x1CEC,	%o1
	movrlz	%g4,	0x28B,	%o0
	fblg,a	%fcc0,	loop_196
	move	%icc,	%o4,	%l5
	sdivcc	%i7,	0x0122,	%l1
	sdivcc	%i2,	0x0C1E,	%l2
loop_196:
	bg,pn	%icc,	loop_197
	nop
	setx	0x29D4AD10,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f5
	fsqrts	%f5,	%f9
	movrne	%i4,	%i5,	%i3
	addc	%i0,	%i6,	%l0
loop_197:
	array32	%o7,	%l4,	%o5
	and	%o6,	%o3,	%g5
	fpack16	%f8,	%f25
	sdiv	%g7,	0x053A,	%g3
	fmuld8ulx16	%f26,	%f22,	%f6
	orncc	%g1,	%g6,	%l6
	umulcc	%o2,	%l3,	%g2
	popc	%o1,	%i1
	tneg	%xcc,	0x7
	movrgez	%g4,	0x1AF,	%o4
	edge32ln	%o0,	%i7,	%l1
	tge	%icc,	0x4
	tn	%xcc,	0x1
	flush	%l7 + 0x5C
	move	%xcc,	%l5,	%l2
	fbne,a	%fcc0,	loop_198
	sra	%i4,	%i5,	%i2
	tn	%icc,	0x4
	nop
	fitos	%f4,	%f25
	fstox	%f25,	%f2
	fxtos	%f2,	%f25
loop_198:
	fmuld8sux16	%f12,	%f15,	%f24
	sll	%i3,	0x03,	%i0
	wr	%g0,	0x04,	%asi
	prefetcha	[%l7 + 0x38] %asi,	 0x3
	movne	%xcc,	%o7,	%l4
	fmovda	%icc,	%f4,	%f7
	nop
	setx	loop_199,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fbe	%fcc3,	loop_200
	alignaddr	%i6,	%o6,	%o5
	nop
	setx loop_201, %l0, %l1
	jmpl %l1, %g5
loop_199:
	movvs	%icc,	%o3,	%g3
loop_200:
	xorcc	%g1,	0x0293,	%g6
	xorcc	%g7,	%l6,	%l3
loop_201:
	movg	%icc,	%o2,	%o1
	tpos	%xcc,	0x3
	add	%i1,	%g2,	%o4
	popc	0x0F56,	%g4
	bge,a	loop_202
	membar	0x7C
	movleu	%icc,	%o0,	%l1
	array16	%l5,	%i7,	%i4
loop_202:
	movneg	%xcc,	%i5,	%l2
	array32	%i3,	%i2,	%i0
	fands	%f11,	%f17,	%f11
	fmovrsne	%l0,	%f15,	%f7
	srl	%l4,	0x0E,	%i6
	umul	%o7,	0x152F,	%o6
	tne	%xcc,	0x7
	tgu	%icc,	0x3
	flush	%l7 + 0x1C
	edge16l	%o5,	%g5,	%g3
	tvs	%xcc,	0x0
	movvc	%xcc,	%g1,	%g6
	tsubcc	%g7,	0x01F6,	%o3
	set	0x1C, %i1
	ldswa	[%l7 + %i1] 0x11,	%l3
	sdiv	%l6,	0x0E43,	%o2
	lduw	[%l7 + 0x64],	%o1
	brlz	%g2,	loop_203
	addcc	%o4,	0x0731,	%i1
	flush	%l7 + 0x08
	fcmpgt32	%f24,	%f14,	%o0
loop_203:
	nop
	setx	0x4037459ABDD32405,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0xCF2B5AD9E0A278DC,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	fmuld	%f2,	%f2,	%f14
	fcmpne16	%f16,	%f28,	%l1
	set	0x18, %o4
	stwa	%l5,	[%l7 + %o4] 0x2f
	membar	#Sync
	umul	%g4,	%i7,	%i4
	sub	%l2,	%i5,	%i3
	tl	%icc,	0x2
	brlz,a	%i0,	loop_204
	bne,pn	%xcc,	loop_205
	umul	%i2,	%l0,	%i6
	orcc	%l4,	0x1BDC,	%o6
loop_204:
	taddcc	%o5,	%o7,	%g3
loop_205:
	orcc	%g1,	%g6,	%g5
	andcc	%g7,	%o3,	%l6
	fmovdg	%xcc,	%f13,	%f10
	fmovsg	%xcc,	%f25,	%f13
	swap	[%l7 + 0x10],	%o2
	set	0x30, %l4
	sta	%f29,	[%l7 + %l4] 0x14
	addccc	%l3,	0x0C69,	%o1
	set	0x5C, %i2
	lduba	[%l7 + %i2] 0x19,	%g2
	andncc	%o4,	%i1,	%o0
	movcc	%xcc,	%l1,	%l5
	bleu,pn	%xcc,	loop_206
	smul	%g4,	%i7,	%l2
	sdiv	%i4,	0x1390,	%i3
	tgu	%icc,	0x4
loop_206:
	tge	%icc,	0x7
	prefetch	[%l7 + 0x1C],	 0x1
	sra	%i0,	%i2,	%l0
	ldd	[%l7 + 0x10],	%i4
	movg	%icc,	%l4,	%i6
	edge32n	%o5,	%o7,	%o6
	fbue,a	%fcc3,	loop_207
	fbug	%fcc2,	loop_208
	fmovdvs	%xcc,	%f23,	%f12
	sethi	0x0A86,	%g1
loop_207:
	edge8ln	%g6,	%g3,	%g7
loop_208:
	movpos	%icc,	%o3,	%g5
	movvs	%xcc,	%l6,	%l3
	edge32	%o1,	%g2,	%o2
	taddcc	%i1,	%o4,	%l1
	srlx	%l5,	0x12,	%g4
	movrlz	%o0,	%i7,	%i4
	wr	%g0,	0x81,	%asi
	lda	[%l7 + 0x28] %asi,	%f7
	mova	%xcc,	%i3,	%l2
	fpadd32s	%f1,	%f9,	%f13
	array32	%i2,	%i0,	%i5
	fones	%f15
	fmovscc	%xcc,	%f6,	%f11
	fpadd32	%f24,	%f18,	%f6
	subccc	%l4,	%i6,	%o5
	fbul	%fcc3,	loop_209
	prefetch	[%l7 + 0x0C],	 0x2
	subc	%l0,	0x04C0,	%o6
	addccc	%o7,	%g1,	%g3
loop_209:
	orncc	%g6,	0x0583,	%o3
	nop
	fitod	%f8,	%f18
	fdtoi	%f18,	%f8
	movcs	%icc,	%g7,	%l6
	popc	%g5,	%o1
	ldd	[%l7 + 0x28],	%g2
	movne	%xcc,	%l3,	%i1
	edge32n	%o2,	%l1,	%o4
	fpack32	%f16,	%f16,	%f20
	wr	%g0,	0x19,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	addcc	%g4,	0x1BE7,	%o0
	fpack16	%f0,	%f12
	fxor	%f2,	%f6,	%f8
	fpackfix	%f6,	%f22
	movrlez	%i7,	0x1AA,	%i4
	movcs	%icc,	%l5,	%i3
	fand	%f22,	%f10,	%f12
	mulscc	%l2,	%i0,	%i5
	tle	%xcc,	0x2
	nop
	setx	0xABA3087B3D5D0E3C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0xC76695AD787C208C,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	faddd	%f4,	%f26,	%f16
	bge,a,pt	%icc,	loop_210
	tleu	%xcc,	0x1
	nop
	setx	0x41B852F2,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f29
	setx	0x3ED168FB,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f11
	fadds	%f11,	%f29,	%f6
	sub	%i2,	0x1D2B,	%i6
loop_210:
	alignaddr	%o5,	%l0,	%l4
	ldsw	[%l7 + 0x50],	%o7
	edge32l	%g1,	%o6,	%g6
	popc	0x0EF0,	%g3
	wr	%g0,	0x04,	%asi
	swapa	[%l7 + 0x7C] %asi,	%g7
	bne,pn	%xcc,	loop_211
	mulx	%l6,	0x009A,	%g5
	movcc	%xcc,	%o3,	%o1
	bvs,a	loop_212
loop_211:
	sub	%g2,	%l3,	%o2
	fsrc2	%f2,	%f24
	brlz	%l1,	loop_213
loop_212:
	sdiv	%o4,	0x1E01,	%g4
	membar	0x51
	tpos	%xcc,	0x4
loop_213:
	xnorcc	%i1,	0x0312,	%i7
	xorcc	%i4,	0x1EAE,	%l5
	sdiv	%i3,	0x0D08,	%o0
	wr	%g0,	0x81,	%asi
	ldda	[%l7 + 0x10] %asi,	%i0
	tne	%icc,	0x6
	andn	%i5,	%l2,	%i2
	andn	%i6,	0x000C,	%l0
	udiv	%l4,	0x1AFC,	%o5
	addccc	%g1,	0x1489,	%o6
	tge	%xcc,	0x5
	movpos	%icc,	%g6,	%g3
	subccc	%o7,	0x128D,	%l6
	umulcc	%g5,	%o3,	%o1
	array8	%g7,	%l3,	%g2
	ldsh	[%l7 + 0x66],	%l1
	movleu	%xcc,	%o2,	%o4
	fcmpeq32	%f20,	%f30,	%g4
	movge	%icc,	%i7,	%i4
	fcmple32	%f6,	%f16,	%i1
	fone	%f14
	addcc	%i3,	0x1EDC,	%l5
	edge16ln	%o0,	%i0,	%i5
	fmovda	%xcc,	%f31,	%f24
	and	%i2,	%i6,	%l0
	movrgez	%l2,	0x3F9,	%l4
	array8	%g1,	%o6,	%o5
	array16	%g3,	%o7,	%l6
	bn,a,pn	%icc,	loop_214
	fmovrslz	%g5,	%f18,	%f17
	smul	%o3,	0x199D,	%g6
	tneg	%icc,	0x3
loop_214:
	edge8l	%o1,	%l3,	%g7
	fnegd	%f8,	%f12
	brgez,a	%l1,	loop_215
	bshuffle	%f10,	%f20,	%f8
	stx	%g2,	[%l7 + 0x40]
	fmovrslez	%o4,	%f23,	%f16
loop_215:
	prefetch	[%l7 + 0x20],	 0x1
	nop
	setx loop_216, %l0, %l1
	jmpl %l1, %g4
	nop
	setx	0xEE7595F3ECA15984,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0x802F30AC031BCFFF,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	faddd	%f6,	%f30,	%f4
	sra	%o2,	0x17,	%i7
	taddcc	%i4,	%i3,	%l5
loop_216:
	fmovd	%f28,	%f24
	movg	%icc,	%o0,	%i0
	and	%i1,	%i2,	%i6
	ldstub	[%l7 + 0x51],	%i5
	set	0x37, %l6
	ldstuba	[%l7 + %l6] 0x19,	%l0
	bgu,pt	%xcc,	loop_217
	movrgz	%l4,	%l2,	%o6
	fmul8x16al	%f22,	%f28,	%f30
	add	%o5,	%g1,	%g3
loop_217:
	faligndata	%f2,	%f18,	%f18
	nop
	setx	0x77A987118BF77C3A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0x3A6BBADC2BA82A0D,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	faddd	%f24,	%f20,	%f18
	movcs	%icc,	%o7,	%l6
	sir	0x0813
	tcs	%icc,	0x2
	array16	%g5,	%o3,	%o1
	movvs	%xcc,	%g6,	%g7
	nop
	setx	0x03E77A0A,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f22
	setx	0x39E909AA,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f10
	fadds	%f10,	%f22,	%f6
	subccc	%l1,	0x1305,	%l3
	wr	%g0,	0x88,	%asi
	prefetcha	[%l7 + 0x68] %asi,	 0x3
	fmuld8sux16	%f8,	%f10,	%f22
	taddcctv	%o4,	0x18B8,	%g4
	umul	%i7,	0x1306,	%o2
	fmovdcs	%xcc,	%f31,	%f9
	tpos	%icc,	0x1
	andn	%i3,	%l5,	%i4
	sub	%o0,	0x19D6,	%i0
	movpos	%xcc,	%i2,	%i6
	sub	%i1,	%i5,	%l4
	sdivcc	%l2,	0x17E6,	%l0
	nop
	fitod	%f8,	%f8
	fdtox	%f8,	%f10
	fxtod	%f10,	%f22
	sdivcc	%o5,	0x1332,	%o6
	xnor	%g3,	0x1BBD,	%o7
	fmovdneg	%xcc,	%f30,	%f28
	wr	%g0,	0x18,	%asi
	sta	%f11,	[%l7 + 0x54] %asi
	fmovd	%f6,	%f22
	fmuld8ulx16	%f26,	%f7,	%f14
	srlx	%l6,	%g1,	%g5
	alignaddrl	%o1,	%o3,	%g7
	fmovsg	%icc,	%f0,	%f4
	fbuge,a	%fcc3,	loop_218
	nop
	fitod	%f15,	%f10
	andncc	%l1,	%g6,	%g2
	set	0x72, %o5
	lduha	[%l7 + %o5] 0x19,	%o4
loop_218:
	sdivx	%g4,	0x1ECE,	%i7
	fble,a	%fcc0,	loop_219
	udivcc	%o2,	0x0737,	%i3
	andcc	%l3,	0x03E8,	%i4
	lduw	[%l7 + 0x58],	%o0
loop_219:
	nop
	set	0x18, %l0
	ldxa	[%g0 + %l0] 0x20,	%l5
	bpos,a	%xcc,	loop_220
	fmovsle	%icc,	%f14,	%f27
	edge32	%i0,	%i6,	%i2
	udivx	%i1,	0x1C27,	%i5
loop_220:
	be,a	loop_221
	fmul8ulx16	%f14,	%f8,	%f24
	fmovsvc	%icc,	%f3,	%f24
	taddcctv	%l2,	0x1863,	%l4
loop_221:
	add	%l0,	0x0BB7,	%o5
	andn	%o6,	0x0353,	%g3
	movl	%icc,	%o7,	%l6
	array16	%g5,	%o1,	%g1
	fmovrdne	%g7,	%f30,	%f4
	edge8n	%o3,	%g6,	%g2
	ble,pt	%xcc,	loop_222
	lduh	[%l7 + 0x08],	%l1
	edge32l	%g4,	%i7,	%o2
	edge8n	%o4,	%l3,	%i3
loop_222:
	popc	%i4,	%o0
	lduh	[%l7 + 0x2A],	%i0
	udivx	%i6,	0x18D0,	%l5
	umulcc	%i1,	0x03C7,	%i2
	bn	%xcc,	loop_223
	subccc	%l2,	%i5,	%l0
	te	%xcc,	0x5
	tgu	%xcc,	0x0
loop_223:
	bne,pn	%xcc,	loop_224
	fba	%fcc2,	loop_225
	tge	%icc,	0x2
	addc	%l4,	0x1778,	%o5
loop_224:
	subcc	%g3,	%o7,	%l6
loop_225:
	fmovrdgz	%o6,	%f20,	%f2
	xnor	%g5,	%g1,	%g7
	smulcc	%o3,	%o1,	%g6
	xorcc	%g2,	%l1,	%i7
	xorcc	%g4,	%o2,	%l3
	taddcc	%i3,	%o4,	%o0
	fbul,a	%fcc3,	loop_226
	tge	%icc,	0x3
	fmuld8sux16	%f4,	%f17,	%f8
	udivcc	%i0,	0x15A7,	%i4
loop_226:
	smul	%l5,	%i6,	%i2
	fsrc1s	%f31,	%f20
	movl	%xcc,	%i1,	%i5
	edge32n	%l2,	%l0,	%l4
	fmovrdgz	%g3,	%f28,	%f18
	fbg,a	%fcc3,	loop_227
	fxor	%f26,	%f30,	%f18
	st	%f30,	[%l7 + 0x5C]
	sra	%o5,	0x00,	%o7
loop_227:
	bge,pt	%icc,	loop_228
	xor	%o6,	%g5,	%g1
	movge	%xcc,	%l6,	%g7
	edge32ln	%o1,	%o3,	%g2
loop_228:
	stx	%g6,	[%l7 + 0x08]
	tvs	%icc,	0x1
	sethi	0x0CDD,	%i7
	tvc	%icc,	0x3
	movrgz	%l1,	0x180,	%o2
	mulx	%g4,	0x025D,	%i3
	andn	%l3,	%o4,	%i0
	nop
	fitod	%f6,	%f22
	fdtoi	%f22,	%f28
	wr	%g0,	0x89,	%asi
	ldsha	[%l7 + 0x62] %asi,	%o0
	xor	%i4,	0x0476,	%l5
	swap	[%l7 + 0x78],	%i6
	edge32ln	%i2,	%i5,	%l2
	movgu	%icc,	%l0,	%i1
	tle	%icc,	0x1
	set	0x52, %o6
	lduha	[%l7 + %o6] 0x19,	%l4
	edge8	%g3,	%o7,	%o6
	wr	%g0,	0x04,	%asi
	stba	%g5,	[%l7 + 0x28] %asi
	alignaddrl	%g1,	%o5,	%g7
	fmovde	%xcc,	%f29,	%f16
	edge32	%o1,	%l6,	%g2
	flush	%l7 + 0x0C
	tsubcc	%g6,	0x01FE,	%i7
	fmovsn	%icc,	%f16,	%f18
	fbue,a	%fcc0,	loop_229
	tl	%xcc,	0x6
	fbe	%fcc1,	loop_230
	and	%l1,	%o3,	%o2
loop_229:
	fmovrdne	%i3,	%f6,	%f30
	sdivx	%g4,	0x11BF,	%l3
loop_230:
	subccc	%o4,	%i0,	%o0
	edge16n	%i4,	%l5,	%i2
	tl	%xcc,	0x2
	srax	%i5,	0x1E,	%l2
	ldd	[%l7 + 0x30],	%f14
	te	%xcc,	0x6
	movrgz	%i6,	%l0,	%l4
	movneg	%xcc,	%g3,	%i1
	fpsub32	%f10,	%f12,	%f6
	orcc	%o7,	%g5,	%g1
	mulx	%o5,	0x1EA5,	%o6
	fpadd16	%f18,	%f14,	%f10
	sdiv	%g7,	0x1509,	%o1
	ldd	[%l7 + 0x48],	%g2
	xor	%l6,	0x17B3,	%i7
	smul	%l1,	%g6,	%o3
	fpadd16s	%f2,	%f1,	%f15
	ldsw	[%l7 + 0x1C],	%i3
	sethi	0x090A,	%o2
	flush	%l7 + 0x60
	movcs	%icc,	%g4,	%o4
	andncc	%l3,	%i0,	%o0
	ldstub	[%l7 + 0x72],	%l5
	nop
	setx loop_231, %l0, %l1
	jmpl %l1, %i2
	edge32	%i5,	%i4,	%l2
	and	%l0,	%l4,	%i6
	srax	%g3,	%o7,	%i1
loop_231:
	fmul8x16	%f1,	%f8,	%f30
	movcs	%icc,	%g5,	%g1
	fxors	%f14,	%f6,	%f9
	wr	%g0,	0x04,	%asi
	ldxa	[%l7 + 0x20] %asi,	%o5
	tvs	%xcc,	0x6
	fbuge,a	%fcc0,	loop_232
	srax	%o6,	0x1E,	%o1
	be	%xcc,	loop_233
	nop
	fitos	%f5,	%f15
	fstox	%f15,	%f2
loop_232:
	fmovrde	%g2,	%f4,	%f18
	nop
	setx	0x015DAD49,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f20
	fsqrts	%f20,	%f11
loop_233:
	fmul8ulx16	%f4,	%f2,	%f8
	prefetch	[%l7 + 0x64],	 0x1
	alignaddr	%l6,	%g7,	%i7
	move	%xcc,	%l1,	%g6
	ld	[%l7 + 0x58],	%f12
	fcmpeq32	%f2,	%f8,	%o3
	sdivcc	%o2,	0x0710,	%g4
	edge8l	%o4,	%l3,	%i3
	tg	%icc,	0x2
	fmovsge	%xcc,	%f28,	%f0
	alignaddrl	%i0,	%o0,	%i2
	edge16	%i5,	%l5,	%i4
	srax	%l2,	0x0F,	%l0
	fsrc1s	%f16,	%f4
	addccc	%i6,	0x06AB,	%g3
	movle	%icc,	%o7,	%l4
	edge16	%i1,	%g5,	%g1
	fbu	%fcc0,	loop_234
	srax	%o6,	%o1,	%g2
	smul	%l6,	%o5,	%i7
	edge16l	%g7,	%l1,	%g6
loop_234:
	array8	%o2,	%g4,	%o4
	taddcc	%l3,	0x0DE1,	%i3
	edge8ln	%o3,	%o0,	%i2
	movge	%xcc,	%i0,	%i5
	bvs	%icc,	loop_235
	edge16ln	%i4,	%l2,	%l5
	movrgz	%l0,	%i6,	%o7
	bgu,pn	%icc,	loop_236
loop_235:
	ldx	[%l7 + 0x70],	%l4
	fpadd16	%f2,	%f30,	%f20
	fbn	%fcc1,	loop_237
loop_236:
	tleu	%xcc,	0x5
	addccc	%i1,	%g5,	%g1
	te	%icc,	0x0
loop_237:
	alignaddr	%g3,	%o6,	%g2
	fblg	%fcc2,	loop_238
	andcc	%o1,	%l6,	%i7
	fbue,a	%fcc1,	loop_239
	movpos	%icc,	%g7,	%o5
loop_238:
	umul	%l1,	%g6,	%g4
	wr	%g0,	0x0c,	%asi
	swapa	[%l7 + 0x08] %asi,	%o4
loop_239:
	fbl	%fcc0,	loop_240
	fpsub32s	%f21,	%f14,	%f3
	movneg	%icc,	%o2,	%i3
	add	%l3,	0x06FB,	%o0
loop_240:
	fnands	%f27,	%f10,	%f21
	orncc	%o3,	0x15AC,	%i2
	stb	%i5,	[%l7 + 0x20]
	tvs	%icc,	0x1
	movrlz	%i0,	%l2,	%i4
	fmul8sux16	%f2,	%f4,	%f8
	taddcc	%l5,	%l0,	%o7
	brnz,a	%l4,	loop_241
	fpsub32s	%f4,	%f1,	%f25
	movrlez	%i1,	0x202,	%i6
	nop
	setx loop_242, %l0, %l1
	jmpl %l1, %g1
loop_241:
	stbar
	edge8ln	%g3,	%g5,	%o6
	movrlez	%o1,	0x073,	%g2
loop_242:
	fmovs	%f16,	%f14
	tg	%xcc,	0x0
	fsrc1s	%f2,	%f5
	movrne	%i7,	0x3AD,	%l6
	ldsb	[%l7 + 0x38],	%o5
	tleu	%icc,	0x4
	edge32ln	%g7,	%g6,	%g4
	xorcc	%o4,	0x11BC,	%o2
	brz	%i3,	loop_243
	xor	%l3,	0x0641,	%o0
	subcc	%l1,	%i2,	%i5
	te	%icc,	0x2
loop_243:
	subccc	%i0,	0x0170,	%o3
	fpadd16s	%f1,	%f1,	%f19
	movle	%xcc,	%l2,	%i4
	movl	%icc,	%l5,	%l0
	tge	%icc,	0x5
	tcc	%xcc,	0x2
	sethi	0x135C,	%o7
	ldub	[%l7 + 0x11],	%i1
	wr	%g0,	0x2a,	%asi
	stxa	%i6,	[%l7 + 0x48] %asi
	membar	#Sync
	fbge	%fcc0,	loop_244
	fones	%f26
	orcc	%g1,	%g3,	%l4
	wr	%g0,	0x80,	%asi
	lda	[%l7 + 0x44] %asi,	%f26
loop_244:
	ldub	[%l7 + 0x4F],	%g5
	movneg	%icc,	%o6,	%g2
	fpsub32s	%f13,	%f5,	%f17
	alignaddr	%i7,	%l6,	%o5
	udiv	%o1,	0x1EFC,	%g6
	srl	%g7,	0x1D,	%o4
	srl	%g4,	0x05,	%o2
	sra	%i3,	%o0,	%l1
	fbg	%fcc2,	loop_245
	fmovdleu	%xcc,	%f30,	%f19
	ba,pn	%icc,	loop_246
	fmovdle	%icc,	%f21,	%f7
loop_245:
	fmovdl	%xcc,	%f30,	%f22
	sethi	0x1DAC,	%l3
loop_246:
	sdivcc	%i5,	0x0A2C,	%i2
	fandnot2s	%f12,	%f6,	%f18
	orncc	%o3,	%i0,	%i4
	edge32	%l5,	%l2,	%l0
	movne	%xcc,	%i1,	%o7
	udivcc	%i6,	0x1203,	%g1
	bge,a	%icc,	loop_247
	taddcc	%g3,	0x0BF6,	%l4
	movneg	%xcc,	%g5,	%g2
	bneg,pt	%xcc,	loop_248
loop_247:
	tneg	%xcc,	0x2
	movgu	%xcc,	%o6,	%i7
	fbule,a	%fcc2,	loop_249
loop_248:
	subccc	%o5,	%l6,	%o1
	be,pn	%xcc,	loop_250
	brgz,a	%g6,	loop_251
loop_249:
	fabsd	%f28,	%f20
	fmovrdlez	%o4,	%f16,	%f28
loop_250:
	stx	%g4,	[%l7 + 0x60]
loop_251:
	move	%icc,	%g7,	%o2
	add	%o0,	0x0D66,	%l1
	nop
	fitos	%f17,	%f7
	wr	%g0,	0x11,	%asi
	stxa	%i3,	[%l7 + 0x28] %asi
	xnor	%i5,	%l3,	%i2
	fbo	%fcc3,	loop_252
	edge8n	%o3,	%i4,	%l5
	set	0x68, %g6
	ldxa	[%l7 + %g6] 0x0c,	%l2
loop_252:
	fmul8x16au	%f12,	%f28,	%f16
	alignaddrl	%l0,	%i0,	%i1
	nop
	fitod	%f0,	%f20
	fdtos	%f20,	%f0
	sll	%o7,	0x1B,	%g1
	wr	%g0,	0x80,	%asi
	stwa	%i6,	[%l7 + 0x50] %asi
	nop
	fitod	%f12,	%f6
	smul	%l4,	0x1A15,	%g3
	bg	loop_253
	alignaddrl	%g2,	%o6,	%i7
	fmovda	%xcc,	%f23,	%f4
	nop
	setx	0x17BFAAEA061F4BE3,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0x31D4A8D9EB434325,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	fdivd	%f10,	%f14,	%f8
loop_253:
	taddcctv	%o5,	%l6,	%g5
	edge32	%o1,	%g6,	%g4
	fxors	%f31,	%f8,	%f11
	fmovdge	%xcc,	%f29,	%f8
	fmovdcs	%icc,	%f4,	%f22
	edge16ln	%g7,	%o2,	%o0
	movle	%icc,	%l1,	%i3
	fnors	%f18,	%f21,	%f28
	xor	%o4,	%i5,	%i2
	andncc	%l3,	%i4,	%l5
	srax	%o3,	%l2,	%i0
	andcc	%l0,	%o7,	%i1
	wr	%g0,	0x81,	%asi
	lduha	[%l7 + 0x40] %asi,	%g1
	bneg	%xcc,	loop_254
	umulcc	%i6,	%l4,	%g3
	sir	0x110A
	add	%l7,	0x48,	%l6
	wr	%g0,	0x11,	%asi
	casxa	[%l6] 0x11,	%g2,	%o6
loop_254:
	and	%i7,	0x035D,	%l6
	andn	%g5,	%o1,	%o5
	fone	%f0
	sir	0x1BD0
	movl	%xcc,	%g6,	%g7
	orncc	%o2,	0x0ADF,	%g4
	addcc	%l1,	0x09EE,	%i3
	tg	%icc,	0x3
	edge16l	%o0,	%i5,	%i2
	sub	%o4,	%i4,	%l5
	xnor	%o3,	0x146A,	%l3
	alignaddr	%l2,	%l0,	%o7
	popc	%i1,	%i0
	fand	%f2,	%f10,	%f10
	tcc	%xcc,	0x5
	ta	%xcc,	0x2
	tneg	%icc,	0x6
	bneg,pt	%icc,	loop_255
	edge32l	%i6,	%g1,	%g3
	set	0x7C, %g4
	lda	[%l7 + %g4] 0x10,	%f28
loop_255:
	ta	%xcc,	0x3
	edge8n	%g2,	%l4,	%o6
	movl	%icc,	%l6,	%g5
	fmovdleu	%icc,	%f1,	%f15
	tsubcctv	%i7,	%o5,	%g6
	tgu	%icc,	0x5
	wr	%g0,	0x89,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	bcs,a,pt	%icc,	loop_256
	addcc	%o1,	0x000E,	%o2
	tl	%icc,	0x5
	srax	%g4,	%l1,	%i3
loop_256:
	fmovdcc	%xcc,	%f1,	%f24
	fbug,a	%fcc1,	loop_257
	tsubcc	%o0,	%i5,	%g7
	fandnot2s	%f0,	%f17,	%f16
	andn	%o4,	%i2,	%l5
loop_257:
	movcs	%xcc,	%i4,	%l3
	sethi	0x04A4,	%o3
	edge16ln	%l2,	%o7,	%l0
	set	0x4C, %i4
	lda	[%l7 + %i4] 0x19,	%f23
	brz	%i0,	loop_258
	ble,pt	%icc,	loop_259
	fnegd	%f6,	%f4
	fxors	%f30,	%f28,	%f29
loop_258:
	umul	%i1,	%g1,	%i6
loop_259:
	edge16n	%g2,	%g3,	%l4
	fpadd32s	%f25,	%f24,	%f2
	tl	%xcc,	0x3
	fba,a	%fcc3,	loop_260
	movgu	%icc,	%o6,	%g5
	fmovscs	%xcc,	%f7,	%f0
	ldsb	[%l7 + 0x57],	%i7
loop_260:
	fmovda	%icc,	%f21,	%f8
	fxors	%f0,	%f12,	%f14
	fxnors	%f29,	%f26,	%f30
	fpadd32	%f18,	%f18,	%f12
	addccc	%o5,	%l6,	%o1
	ba,pn	%xcc,	loop_261
	fmovsa	%xcc,	%f22,	%f5
	wr	%g0,	0x81,	%asi
	lduba	[%l7 + 0x42] %asi,	%o2
loop_261:
	nop
	wr	%g0,	0x81,	%asi
	ldswa	[%l7 + 0x44] %asi,	%g6
	bcs,pn	%icc,	loop_262
	tvs	%icc,	0x5
	umul	%l1,	0x0938,	%i3
	tcs	%xcc,	0x2
loop_262:
	udivcc	%o0,	0x15C9,	%g4
	fble,a	%fcc1,	loop_263
	movne	%icc,	%g7,	%i5
	movcs	%xcc,	%o4,	%i2
	fmovdcs	%icc,	%f11,	%f28
loop_263:
	smul	%l5,	0x0D56,	%i4
	array16	%l3,	%l2,	%o3
	fsrc1s	%f28,	%f26
	fbue	%fcc1,	loop_264
	smul	%o7,	0x0266,	%l0
	brlz	%i0,	loop_265
	xnorcc	%g1,	0x19B2,	%i1
loop_264:
	sub	%i6,	%g3,	%l4
	sdivx	%o6,	0x0601,	%g5
loop_265:
	fmovdle	%xcc,	%f26,	%f9
	ldstub	[%l7 + 0x4C],	%g2
	srl	%i7,	0x15,	%o5
	edge32n	%o1,	%o2,	%l6
	wr	%g0,	0x18,	%asi
	swapa	[%l7 + 0x68] %asi,	%g6
	ldx	[%l7 + 0x78],	%i3
	sdivx	%o0,	0x119A,	%l1
	st	%f18,	[%l7 + 0x20]
	xnor	%g7,	%i5,	%o4
	brnz,a	%g4,	loop_266
	sir	0x1D6F
	nop
	setx	0x3C48DBD46041E0B6,	%l0,	%l6
	stx	%l6,	[%l7 + 0x40]
	ldx	[%l7 + 0x40],	%fsr
	fpadd16s	%f28,	%f15,	%f19
loop_266:
	alignaddr	%i2,	%l5,	%l3
	movg	%icc,	%i4,	%o3
	fbl	%fcc1,	loop_267
	fmovdleu	%icc,	%f22,	%f22
	fxnors	%f13,	%f12,	%f30
	srl	%l2,	0x06,	%l0
loop_267:
	mova	%xcc,	%i0,	%g1
	tsubcctv	%o7,	%i1,	%g3
	bneg,a	loop_268
	bne,a,pn	%icc,	loop_269
	fones	%f17
	brlez	%l4,	loop_270
loop_268:
	tle	%icc,	0x4
loop_269:
	nop
	setx	0xF7C4598F,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f13
	fsqrts	%f13,	%f6
	lduw	[%l7 + 0x14],	%i6
loop_270:
	movgu	%xcc,	%g5,	%o6
	fmovsn	%icc,	%f10,	%f14
	array16	%i7,	%o5,	%g2
	sdiv	%o2,	0x0D86,	%l6
	tl	%xcc,	0x0
	tg	%icc,	0x0
	tvs	%xcc,	0x5
	move	%icc,	%g6,	%i3
	fmovrsgz	%o0,	%f28,	%f28
	fcmpne32	%f8,	%f0,	%o1
	sir	0x0B0C
	movvc	%icc,	%l1,	%i5
	smul	%g7,	0x144A,	%o4
	wr	%g0,	0x89,	%asi
	ldsha	[%l7 + 0x32] %asi,	%g4
	umulcc	%l5,	%l3,	%i4
	bvc,pn	%icc,	loop_271
	fbue	%fcc0,	loop_272
	alignaddr	%o3,	%l2,	%l0
	andcc	%i0,	%g1,	%o7
loop_271:
	fmovdl	%xcc,	%f9,	%f15
loop_272:
	nop
	setx	0xEFA9BD37,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f14
	setx	0xBDCE725D,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f11
	fmuls	%f11,	%f14,	%f13
	movcs	%xcc,	%i1,	%g3
	membar	0x78
	movl	%icc,	%l4,	%i6
	sethi	0x1513,	%i2
	movrlz	%g5,	%o6,	%i7
	set	0x3A, %i5
	ldsha	[%l7 + %i5] 0x10,	%g2
	fmovdvc	%xcc,	%f12,	%f0
	tcs	%xcc,	0x2
	tsubcc	%o2,	0x0525,	%o5
	subcc	%l6,	%i3,	%g6
	nop
	fitos	%f12,	%f27
	fstod	%f27,	%f14
	fnand	%f14,	%f2,	%f22
	orncc	%o1,	%o0,	%i5
	fmul8sux16	%f30,	%f14,	%f18
	subc	%g7,	%o4,	%l1
	taddcctv	%g4,	%l3,	%l5
	fmovsneg	%xcc,	%f12,	%f24
	fbue	%fcc0,	loop_273
	fblg	%fcc2,	loop_274
	movle	%xcc,	%o3,	%i4
	bne,a,pn	%xcc,	loop_275
loop_273:
	fmovsl	%xcc,	%f12,	%f17
loop_274:
	stw	%l2,	[%l7 + 0x68]
	fpadd32s	%f0,	%f11,	%f8
loop_275:
	taddcctv	%i0,	0x1021,	%g1
	nop
	setx	0x4F3B7535A8EF6B77,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0x8F68EDDC6A720F81,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	fmuld	%f12,	%f30,	%f0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tneg	%icc,	0x0
	bl	loop_276
	fmovrde	%o7,	%f18,	%f10
	lduh	[%l7 + 0x0C],	%i1
	fmovs	%f12,	%f8
loop_276:
	ta	%icc,	0x0
	nop
	setx	0x4CF02735758F49E4,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0x4A6CB95C054199DB,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	fsubd	%f12,	%f16,	%f12
	movrgez	%l0,	%l4,	%g3
	edge8ln	%i6,	%g5,	%i2
	fornot1	%f12,	%f10,	%f30
	prefetch	[%l7 + 0x08],	 0x0
	add	%i7,	0x157C,	%g2
	bpos,pn	%icc,	loop_277
	edge32n	%o2,	%o5,	%o6
	edge8l	%l6,	%i3,	%g6
	array32	%o1,	%o0,	%g7
loop_277:
	andn	%o4,	0x1D14,	%l1
	nop
	setx	0xB07E9F1F,	%l0,	%l6
	st	%l6,	[%l7 + 0x60]
	ld	[%l7 + 0x60],	%fsr
	fpsub32s	%f15,	%f10,	%f7
	ldd	[%l7 + 0x68],	%f8
	bge,pn	%icc,	loop_278
	tsubcc	%i5,	%g4,	%l5
	sethi	0x0485,	%l3
	nop
	fitod	%f26,	%f22
loop_278:
	tl	%xcc,	0x0
	ldsb	[%l7 + 0x35],	%o3
	alignaddrl	%l2,	%i4,	%i0
	movrgz	%o7,	%g1,	%i1
	nop
	setx	0xB4941537,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f15
	setx	0x46856001,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f10
	fdivs	%f10,	%f15,	%f12
	and	%l0,	0x1C01,	%g3
	fbo,a	%fcc2,	loop_279
	bl	%icc,	loop_280
	edge8n	%i6,	%g5,	%i2
	sethi	0x010D,	%i7
loop_279:
	andcc	%l4,	0x087A,	%o2
loop_280:
	nop
	set	0x6F, %i0
	ldstuba	[%l7 + %i0] 0x11,	%g2
	tge	%xcc,	0x3
	fornot1s	%f1,	%f30,	%f10
	edge32ln	%o6,	%o5,	%l6
	sdivcc	%g6,	0x006F,	%i3
	be,a	loop_281
	fbne	%fcc1,	loop_282
	fbn,a	%fcc3,	loop_283
	nop
	setx	0x1AF3FDDA76B9AEE3,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	setx	0x1A1A86F85704DE76,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	fmuld	%f18,	%f18,	%f6
loop_281:
	movrne	%o0,	0x2E7,	%g7
loop_282:
	and	%o1,	0x0F17,	%o4
loop_283:
	fble	%fcc0,	loop_284
	tgu	%xcc,	0x1
	andn	%l1,	%i5,	%g4
	taddcctv	%l3,	0x1448,	%l5
loop_284:
	fmovdvc	%xcc,	%f15,	%f20
	movpos	%xcc,	%l2,	%i4
	sth	%o3,	[%l7 + 0x50]
	fmul8x16	%f3,	%f0,	%f22
	movg	%xcc,	%o7,	%g1
	orcc	%i0,	0x18ED,	%l0
	movpos	%icc,	%g3,	%i1
	fmovdcc	%xcc,	%f15,	%f31
	set	0x58, %g3
	swapa	[%l7 + %g3] 0x10,	%i6
	bvc,pn	%icc,	loop_285
	movleu	%xcc,	%i2,	%g5
	fone	%f18
	or	%i7,	%l4,	%g2
loop_285:
	ldsw	[%l7 + 0x78],	%o6
	movgu	%xcc,	%o2,	%o5
	tl	%xcc,	0x1
	subc	%l6,	0x11D7,	%i3
	set	0x53, %l3
	stba	%g6,	[%l7 + %l3] 0xe2
	membar	#Sync
	sra	%g7,	%o1,	%o4
	stw	%l1,	[%l7 + 0x70]
	fpmerge	%f30,	%f24,	%f6
	fmovdle	%xcc,	%f19,	%f24
	set	0x78, %i6
	prefetcha	[%l7 + %i6] 0x80,	 0x0
	movrne	%i5,	0x058,	%l3
	edge8l	%g4,	%l2,	%i4
	movne	%xcc,	%o3,	%o7
	nop
	setx	0x406F142487887B4D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0xFA16B1DB95001545,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	fmuld	%f22,	%f20,	%f16
	bl,pn	%icc,	loop_286
	sub	%g1,	%l5,	%i0
	movle	%xcc,	%l0,	%g3
	umul	%i1,	0x0F5B,	%i6
loop_286:
	edge8	%i2,	%g5,	%i7
	movge	%xcc,	%l4,	%o6
	call	loop_287
	tleu	%icc,	0x2
	movrne	%o2,	%o5,	%g2
	sethi	0x1A92,	%l6
loop_287:
	alignaddrl	%g6,	%i3,	%g7
	andcc	%o1,	0x0A20,	%l1
	fmovscs	%xcc,	%f24,	%f4
	tg	%icc,	0x4
	nop
	setx	0x3681D174F869687A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0x34873ABBEAE3B1F0,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	fdivd	%f14,	%f8,	%f16
	edge16l	%o0,	%o4,	%l3
	ldd	[%l7 + 0x18],	%f6
	orn	%g4,	%l2,	%i5
	add	%l7,	0x5C,	%l6
	wr	%g0,	0x04,	%asi
	casa	[%l6] %asi,	%o3,	%o7
	fpadd32	%f28,	%f12,	%f8
	array16	%i4,	%g1,	%l5
	fsrc2s	%f29,	%f19
	sra	%i0,	0x1E,	%g3
	set	0x54, %g5
	lduwa	[%l7 + %g5] 0x15,	%i1
	tgu	%icc,	0x2
	wr	%g0,	0x11,	%asi
	sta	%f6,	[%l7 + 0x64] %asi
	sdivcc	%l0,	0x093B,	%i6
	andn	%i2,	%i7,	%g5
	nop
	fitod	%f4,	%f26
	fdtoi	%f26,	%f13
	edge16	%o6,	%o2,	%o5
	movneg	%icc,	%l4,	%g2
	array8	%g6,	%l6,	%i3
	swap	[%l7 + 0x64],	%o1
	move	%icc,	%l1,	%g7
	srax	%o4,	%o0,	%g4
	array8	%l2,	%l3,	%o3
	ba,pn	%xcc,	loop_288
	move	%xcc,	%o7,	%i5
	edge8	%i4,	%g1,	%l5
	movrgez	%i0,	%i1,	%l0
loop_288:
	brgez	%g3,	loop_289
	movpos	%xcc,	%i6,	%i2
	fmovsg	%icc,	%f14,	%f9
	fnegs	%f26,	%f19
loop_289:
	fpsub32s	%f5,	%f0,	%f25
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddr	%i7,	%o6,	%g5
	fcmpne32	%f12,	%f22,	%o2
	edge16ln	%l4,	%g2,	%g6
	wr	%g0,	0x0c,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	tsubcc	%l6,	0x0B3E,	%i3
	ldsw	[%l7 + 0x50],	%o1
	fpackfix	%f2,	%f7
	tneg	%icc,	0x5
	array8	%o5,	%g7,	%l1
	ta	%xcc,	0x5
	udiv	%o4,	0x1AA5,	%g4
	lduw	[%l7 + 0x08],	%o0
	and	%l3,	%l2,	%o3
	nop
	setx	0xDB5B7C4EDADD9CB4,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	fsqrtd	%f16,	%f30
	taddcc	%o7,	0x09A0,	%i4
	fmovdgu	%xcc,	%f22,	%f11
	ba,a	loop_290
	brgez	%i5,	loop_291
	ldd	[%l7 + 0x40],	%f8
	nop
	fitod	%f10,	%f12
	fdtox	%f12,	%f28
	fxtod	%f28,	%f16
loop_290:
	nop
	wr	%g0,	0x2a,	%asi
	ldda	[%l7 + 0x40] %asi,	%g0
loop_291:
	bcc,pt	%xcc,	loop_292
	add	%i0,	0x14A8,	%i1
	fnot1s	%f21,	%f29
	tn	%xcc,	0x4
loop_292:
	fmovsne	%xcc,	%f24,	%f9
	fnot2s	%f29,	%f25
	tvs	%icc,	0x4
	array32	%l5,	%g3,	%i6
	tg	%icc,	0x7
	movneg	%icc,	%l0,	%i7
	edge32n	%o6,	%i2,	%g5
	nop
	fitos	%f18,	%f30
	set	0x40, %l1
	stda	%f16,	[%l7 + %l1] 0x11
	set	0x25, %o7
	ldsba	[%l7 + %o7] 0x18,	%o2
	srlx	%g2,	0x09,	%l4
	ldsh	[%l7 + 0x2A],	%l6
	fmovd	%f30,	%f20
	tleu	%icc,	0x0
	nop
	setx	loop_293,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	edge16l	%g6,	%o1,	%o5
	fpack32	%f22,	%f18,	%f30
	movrgz	%g7,	0x2DA,	%i3
loop_293:
	bn,a	loop_294
	fcmpgt32	%f18,	%f24,	%l1
	stx	%g4,	[%l7 + 0x58]
	fmovda	%xcc,	%f18,	%f14
loop_294:
	movvs	%xcc,	%o4,	%o0
	array8	%l3,	%l2,	%o7
	std	%f0,	[%l7 + 0x58]
	tne	%icc,	0x6
	fble	%fcc0,	loop_295
	sra	%i4,	%i5,	%o3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orncc	%g1,	0x060E,	%i0
loop_295:
	subcc	%l5,	%g3,	%i6
	fnot1s	%f10,	%f3
	fmovspos	%icc,	%f8,	%f27
	xnorcc	%l0,	%i1,	%i7
	fmovrse	%o6,	%f3,	%f2
	wr	%g0,	0x22,	%asi
	stxa	%i2,	[%l7 + 0x40] %asi
	membar	#Sync
	tge	%xcc,	0x4
	andncc	%o2,	%g5,	%l4
	fornot1	%f24,	%f18,	%f26
	fsrc2	%f30,	%f4
	fmovsa	%xcc,	%f19,	%f1
	fabss	%f28,	%f23
	fbule	%fcc3,	loop_296
	movcc	%icc,	%l6,	%g6
	mova	%icc,	%g2,	%o5
	edge32ln	%o1,	%i3,	%g7
loop_296:
	ldstub	[%l7 + 0x7B],	%l1
	wr	%g0,	0x89,	%asi
	swapa	[%l7 + 0x40] %asi,	%o4
	subcc	%g4,	%o0,	%l2
	fpadd16	%f20,	%f0,	%f16
	fble	%fcc1,	loop_297
	edge16ln	%l3,	%o7,	%i5
	fnors	%f17,	%f29,	%f10
	edge8	%i4,	%g1,	%i0
loop_297:
	nop
	setx	0xD1A2BB2F0630ECAF,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	fsqrtd	%f4,	%f8
	tcc	%icc,	0x2
	edge32n	%o3,	%l5,	%i6
	sub	%l0,	0x102A,	%i1
	andcc	%i7,	%g3,	%o6
	movneg	%icc,	%o2,	%g5
	taddcc	%l4,	0x0236,	%i2
	nop
	set	0x36, %g1
	stb	%g6,	[%l7 + %g1]
	brz,a	%l6,	loop_298
	movcs	%icc,	%o5,	%o1
	tsubcc	%g2,	%i3,	%l1
	nop
	setx	0xEEA36300069FD34F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	fsqrtd	%f20,	%f0
loop_298:
	be,a,pn	%icc,	loop_299
	and	%g7,	%o4,	%o0
	xnorcc	%l2,	0x164C,	%l3
	movre	%g4,	0x1FD,	%i5
loop_299:
	movge	%icc,	%i4,	%o7
	fmovsgu	%xcc,	%f23,	%f27
	te	%icc,	0x4
	fbg	%fcc2,	loop_300
	fmovde	%xcc,	%f30,	%f14
	fnegs	%f21,	%f12
	fnot1	%f20,	%f2
loop_300:
	movrlz	%g1,	%o3,	%i0
	sethi	0x013C,	%i6
	movneg	%xcc,	%l0,	%i1
	nop
	fitos	%f10,	%f8
	fstoi	%f8,	%f28
	sub	%l5,	%i7,	%o6
	fpsub32	%f28,	%f28,	%f4
	brlz	%o2,	loop_301
	subc	%g3,	0x1966,	%l4
	subccc	%i2,	0x05A3,	%g6
	andn	%g5,	%o5,	%o1
loop_301:
	popc	%l6,	%g2
	subcc	%i3,	%l1,	%g7
	ldstub	[%l7 + 0x22],	%o0
	ta	%xcc,	0x7
	nop
	set	0x3A, %l2
	ldstub	[%l7 + %l2],	%o4
	set	0x38, %o0
	stha	%l3,	[%l7 + %o0] 0x22
	membar	#Sync
	ta	%icc,	0x5
	ldsw	[%l7 + 0x5C],	%l2
	tsubcctv	%g4,	%i5,	%i4
	fmovsl	%xcc,	%f7,	%f30
	subccc	%o7,	%o3,	%i0
	array8	%i6,	%g1,	%i1
	ldub	[%l7 + 0x2B],	%l0
	and	%i7,	%l5,	%o6
	array8	%g3,	%l4,	%i2
	ldsw	[%l7 + 0x0C],	%o2
	array32	%g6,	%o5,	%o1
	fba,a	%fcc1,	loop_302
	sdivcc	%l6,	0x1C15,	%g2
	wr	%g0,	0x80,	%asi
	lduha	[%l7 + 0x36] %asi,	%i3
loop_302:
	fcmpne32	%f28,	%f12,	%l1
	sdivx	%g5,	0x148A,	%o0
	orn	%o4,	0x1659,	%l3
	sethi	0x03A7,	%g7
	stb	%g4,	[%l7 + 0x3C]
	sdivcc	%i5,	0x171B,	%l2
	fmovdvc	%icc,	%f28,	%f1
	movne	%xcc,	%o7,	%i4
	ldx	[%l7 + 0x40],	%i0
	ldsb	[%l7 + 0x78],	%o3
	add	%l7,	0x68,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%i6,	%i1
	flush	%l7 + 0x44
	taddcctv	%g1,	0x0D90,	%i7
	nop
	setx	0xDDE56B4CA630D4E1,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	fsqrtd	%f8,	%f30
	fbuge	%fcc3,	loop_303
	fmovsgu	%icc,	%f9,	%f2
	ldsb	[%l7 + 0x0F],	%l0
	edge16l	%o6,	%g3,	%l5
loop_303:
	ldd	[%l7 + 0x18],	%f28
	edge8l	%i2,	%l4,	%o2
	sdiv	%o5,	0x1029,	%g6
	fmovscc	%xcc,	%f7,	%f21
	movge	%icc,	%o1,	%l6
	movcc	%xcc,	%i3,	%l1
	tpos	%xcc,	0x7
	bvc	loop_304
	sdivcc	%g5,	0x0ACB,	%o0
	tn	%icc,	0x6
	edge32l	%g2,	%o4,	%g7
loop_304:
	fmovdg	%icc,	%f27,	%f19
	edge8	%g4,	%i5,	%l3
	addc	%l2,	%o7,	%i4
	wr	%g0,	0x10,	%asi
	lduha	[%l7 + 0x26] %asi,	%o3
	movg	%xcc,	%i0,	%i1
	subccc	%i6,	%g1,	%l0
	brgez	%i7,	loop_305
	sethi	0x06A4,	%o6
	fmovrdlz	%g3,	%f14,	%f20
	array8	%i2,	%l4,	%l5
loop_305:
	call	loop_306
	edge32ln	%o2,	%o5,	%o1
	edge32n	%l6,	%i3,	%l1
	ta	%xcc,	0x5
loop_306:
	tl	%icc,	0x7
	prefetch	[%l7 + 0x78],	 0x3
	tl	%icc,	0x1
	fmovdneg	%xcc,	%f21,	%f0
	addccc	%g5,	%g6,	%g2
	fbe	%fcc0,	loop_307
	taddcc	%o4,	0x06D2,	%o0
	edge8l	%g4,	%g7,	%i5
	move	%xcc,	%l3,	%l2
loop_307:
	movneg	%icc,	%i4,	%o7
	edge32l	%i0,	%i1,	%i6
	movge	%icc,	%g1,	%l0
	tn	%icc,	0x2
	tle	%xcc,	0x3
	fbuge	%fcc1,	loop_308
	prefetch	[%l7 + 0x2C],	 0x1
	nop
	set	0x21, %g2
	ldstub	[%l7 + %g2],	%i7
	andcc	%o3,	0x046E,	%o6
loop_308:
	nop
	wr	%g0,	0x19,	%asi
	lda	[%l7 + 0x34] %asi,	%f24
	wr	%g0,	0x88,	%asi
	ldsha	[%l7 + 0x68] %asi,	%g3
	andcc	%i2,	0x0DBB,	%l4
	movrlez	%o2,	%o5,	%l5
	brlz	%o1,	loop_309
	tcc	%xcc,	0x4
	srl	%l6,	%i3,	%g5
	sra	%l1,	0x0A,	%g6
loop_309:
	xorcc	%g2,	0x1470,	%o4
	tl	%icc,	0x7
	smulcc	%g4,	0x067D,	%g7
	orn	%i5,	%o0,	%l3
	edge32	%i4,	%l2,	%i0
	sdivx	%o7,	0x0620,	%i6
	wr	%g0,	0x88,	%asi
	stxa	%i1,	[%l7 + 0x08] %asi
	sra	%g1,	0x12,	%l0
	fmovrsgz	%o3,	%f10,	%f29
	lduh	[%l7 + 0x2C],	%o6
	brlez	%g3,	loop_310
	edge16l	%i2,	%i7,	%o2
	movgu	%xcc,	%o5,	%l4
	edge8n	%o1,	%l5,	%l6
loop_310:
	ble,pn	%icc,	loop_311
	mulx	%g5,	0x1C58,	%l1
	fmovrslez	%g6,	%f29,	%f27
	xorcc	%i3,	0x0F50,	%g2
loop_311:
	srlx	%g4,	%o4,	%g7
	tcc	%xcc,	0x5
	fands	%f31,	%f14,	%f21
	wr	%g0,	0x80,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	edge32	%i5,	%l3,	%o0
	alignaddrl	%i4,	%i0,	%o7
	subc	%l2,	%i6,	%i1
	mova	%xcc,	%g1,	%o3
	fcmpne32	%f6,	%f22,	%o6
	bcc,pn	%xcc,	loop_312
	sethi	0x109B,	%g3
	bn,a	%xcc,	loop_313
	alignaddrl	%l0,	%i2,	%o2
loop_312:
	fnot1s	%f20,	%f31
	te	%xcc,	0x6
loop_313:
	sdiv	%o5,	0x1A84,	%l4
	movvc	%xcc,	%o1,	%i7
	movcs	%icc,	%l6,	%g5
	edge16	%l5,	%l1,	%i3
	tsubcctv	%g2,	%g4,	%o4
	andcc	%g7,	0x1947,	%g6
	movneg	%xcc,	%i5,	%o0
	movl	%xcc,	%l3,	%i0
	addccc	%o7,	%l2,	%i6
	fnand	%f0,	%f14,	%f22
	move	%icc,	%i1,	%g1
	mulscc	%o3,	%o6,	%g3
	movgu	%xcc,	%l0,	%i4
	fbn,a	%fcc0,	loop_314
	fexpand	%f20,	%f30
	brlz	%o2,	loop_315
	ldd	[%l7 + 0x18],	%f30
loop_314:
	nop
	fitos	%f30,	%f21
	tleu	%xcc,	0x7
loop_315:
	array8	%o5,	%l4,	%i2
	and	%o1,	%l6,	%i7
	edge32ln	%g5,	%l5,	%i3
	st	%f15,	[%l7 + 0x18]
	mova	%xcc,	%g2,	%g4
	fmul8x16	%f17,	%f10,	%f22
	nop
	fitos	%f18,	%f19
	fones	%f20
	fandnot1	%f16,	%f10,	%f22
	tneg	%icc,	0x3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpsub32	%f0,	%f2,	%f6
	brgez,a	%l1,	loop_316
	fbue	%fcc0,	loop_317
	fxnor	%f28,	%f4,	%f30
	sdivx	%o4,	0x12ED,	%g6
loop_316:
	sdivcc	%g7,	0x1D4C,	%i5
loop_317:
	addcc	%l3,	0x0FC6,	%i0
	add	%o0,	0x03B0,	%l2
	bvs,a,pt	%xcc,	loop_318
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpadd32	%f8,	%f22,	%f2
	movge	%icc,	%o7,	%i1
loop_318:
	movne	%xcc,	%g1,	%o3
	xnorcc	%o6,	%g3,	%i6
	nop
	fitos	%f2,	%f14
	fstod	%f14,	%f24
	brgez,a	%i4,	loop_319
	movpos	%xcc,	%l0,	%o5
	movge	%xcc,	%o2,	%i2
	and	%l4,	%l6,	%o1
loop_319:
	te	%icc,	0x6
	mova	%icc,	%g5,	%i7
	wr	%g0,	0x23,	%asi
	stwa	%l5,	[%l7 + 0x48] %asi
	membar	#Sync
	nop
	fitos	%f3,	%f15
	fstox	%f15,	%f0
	fxtos	%f0,	%f8
	subcc	%g2,	%i3,	%g4
	xorcc	%l1,	%g6,	%o4
	bvs,a,pt	%icc,	loop_320
	tl	%xcc,	0x7
	fmovsgu	%xcc,	%f3,	%f4
	subc	%i5,	0x1CE1,	%g7
loop_320:
	fmovrse	%l3,	%f31,	%f30
	alignaddrl	%o0,	%i0,	%l2
	wr	%g0,	0x18,	%asi
	ldsba	[%l7 + 0x28] %asi,	%o7
	fornot2s	%f29,	%f22,	%f15
	lduh	[%l7 + 0x16],	%g1
	tgu	%xcc,	0x1
	ldd	[%l7 + 0x18],	%o2
	umul	%o6,	0x0933,	%i1
	tneg	%xcc,	0x7
	fbuge,a	%fcc0,	loop_321
	fsrc1s	%f16,	%f26
	fmovdneg	%icc,	%f25,	%f19
	movrgez	%g3,	%i4,	%l0
loop_321:
	fmovdneg	%xcc,	%f16,	%f9
	tg	%icc,	0x0
	edge32n	%i6,	%o5,	%i2
	fbu	%fcc1,	loop_322
	xor	%o2,	%l4,	%l6
	ta	%xcc,	0x2
	ldub	[%l7 + 0x72],	%o1
loop_322:
	movleu	%xcc,	%i7,	%l5
	ldd	[%l7 + 0x68],	%f6
	srax	%g2,	%g5,	%g4
	alignaddrl	%l1,	%g6,	%o4
	sll	%i3,	0x00,	%g7
	fmul8x16	%f15,	%f2,	%f8
	tcs	%xcc,	0x3
	bne,a	loop_323
	ldstub	[%l7 + 0x2D],	%l3
	edge16	%o0,	%i5,	%i0
	edge8ln	%o7,	%g1,	%l2
loop_323:
	tcs	%icc,	0x5
	subccc	%o3,	0x18BE,	%i1
	fsrc1s	%f25,	%f9
	membar	#Sync
	set	0x40, %i7
	ldda	[%l7 + %i7] 0x1e,	%f16
	sra	%o6,	0x1A,	%i4
	fcmpgt32	%f20,	%f4,	%g3
	tvs	%xcc,	0x6
	te	%xcc,	0x3
	for	%f2,	%f8,	%f20
	fornot1s	%f7,	%f11,	%f6
	fbe	%fcc0,	loop_324
	fbug,a	%fcc0,	loop_325
	fmul8sux16	%f18,	%f6,	%f6
	movn	%icc,	%l0,	%o5
loop_324:
	bgu,a	loop_326
loop_325:
	subccc	%i2,	0x0935,	%o2
	tleu	%xcc,	0x5
	movge	%icc,	%l4,	%l6
loop_326:
	tgu	%icc,	0x3
	ldsw	[%l7 + 0x10],	%o1
	fblg,a	%fcc1,	loop_327
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdl	%xcc,	%f6,	%f28
	subc	%i6,	0x06B2,	%l5
loop_327:
	tcc	%xcc,	0x1
	edge32l	%g2,	%g5,	%g4
	nop
	fitod	%f6,	%f16
	fdtox	%f16,	%f18
	fxtod	%f18,	%f16
	movl	%xcc,	%l1,	%g6
	movvs	%icc,	%i7,	%i3
	orncc	%o4,	0x0AD1,	%g7
	fmul8ulx16	%f16,	%f28,	%f28
	tsubcc	%l3,	0x159C,	%i5
	pdist	%f10,	%f8,	%f4
	ldsw	[%l7 + 0x34],	%i0
	fba	%fcc2,	loop_328
	udiv	%o7,	0x1A5F,	%g1
	alignaddrl	%l2,	%o3,	%i1
	set	0x22, %o1
	ldsha	[%l7 + %o1] 0x88,	%o0
loop_328:
	fbu	%fcc1,	loop_329
	fmovdvc	%xcc,	%f6,	%f20
	movpos	%icc,	%i4,	%o6
	brlz	%g3,	loop_330
loop_329:
	tleu	%icc,	0x2
	sra	%o5,	%i2,	%o2
	fmovdge	%icc,	%f30,	%f11
loop_330:
	movgu	%icc,	%l0,	%l4
	set	0x0A, %l5
	ldsha	[%l7 + %l5] 0x88,	%o1
	udiv	%i6,	0x1EDD,	%l5
	set	0x1E, %o2
	stba	%g2,	[%l7 + %o2] 0x04
	mulx	%g5,	%g4,	%l6
	subcc	%l1,	%g6,	%i7
	or	%i3,	%g7,	%o4
	movn	%icc,	%i5,	%i0
	fmovde	%icc,	%f16,	%f31
	edge8	%o7,	%l3,	%g1
	subccc	%o3,	%l2,	%i1
	tpos	%xcc,	0x5
	movleu	%xcc,	%o0,	%o6
	tsubcctv	%g3,	0x0A13,	%i4
	set	0x78, %o3
	prefetcha	[%l7 + %o3] 0x0c,	 0x3
	edge16	%i2,	%o2,	%l0
	fmovrse	%l4,	%f25,	%f18
	xor	%o1,	0x094D,	%i6
	edge16l	%g2,	%l5,	%g5
	subc	%g4,	%l6,	%l1
	tvs	%xcc,	0x6
	move	%icc,	%i7,	%g6
	addccc	%i3,	%g7,	%i5
	wr	%g0,	0x10,	%asi
	lduba	[%l7 + 0x79] %asi,	%i0
	orncc	%o4,	0x1324,	%l3
	call	loop_331
	bleu,pn	%icc,	loop_332
	sub	%g1,	%o3,	%l2
	fandnot1	%f2,	%f0,	%f12
loop_331:
	tneg	%icc,	0x6
loop_332:
	movvc	%icc,	%i1,	%o7
	fbug	%fcc2,	loop_333
	and	%o6,	%g3,	%i4
	xor	%o5,	0x0E53,	%o0
	nop
	setx loop_334, %l0, %l1
	jmpl %l1, %i2
loop_333:
	fmovdle	%xcc,	%f24,	%f27
	movre	%o2,	%l0,	%o1
	edge32	%i6,	%g2,	%l5
loop_334:
	andcc	%g5,	0x06CD,	%g4
	ldub	[%l7 + 0x7B],	%l6
	and	%l4,	%l1,	%i7
	fnands	%f8,	%f21,	%f30
	movrlez	%g6,	%g7,	%i5
	srax	%i3,	%o4,	%i0
	add	%l7,	0x74,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%l3
	casa	[%l6] %asi,	%l3,	%g1
	bn,a	loop_335
	array32	%l2,	%i1,	%o3
	fmovrdlez	%o6,	%f6,	%f2
	taddcctv	%o7,	0x0AA7,	%g3
loop_335:
	fmul8ulx16	%f16,	%f4,	%f20
	std	%f14,	[%l7 + 0x20]
	call	loop_336
	stw	%o5,	[%l7 + 0x38]
	tg	%xcc,	0x0
	faligndata	%f0,	%f16,	%f16
loop_336:
	movcc	%xcc,	%i4,	%i2
	udiv	%o2,	0x040E,	%o0
	bg,a	loop_337
	fand	%f22,	%f16,	%f8
	movle	%xcc,	%o1,	%i6
	ldsh	[%l7 + 0x2A],	%l0
loop_337:
	nop
	fitod	%f0,	%f16
	fdtox	%f16,	%f16
	fxtod	%f16,	%f0
	edge32ln	%l5,	%g2,	%g5
	edge16n	%l6,	%g4,	%l1
	movg	%icc,	%i7,	%l4
	fmovdn	%xcc,	%f12,	%f10
	fnands	%f1,	%f24,	%f22
	movcs	%icc,	%g7,	%i5
	bcc,a	loop_338
	orcc	%g6,	0x060C,	%o4
	sdivx	%i0,	0x04C1,	%l3
	stx	%g1,	[%l7 + 0x18]
loop_338:
	tpos	%icc,	0x6
	fors	%f22,	%f18,	%f14
	nop
	setx	0x5058CEF31CDF7DA3,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	fsqrtd	%f10,	%f28
	umul	%l2,	0x1796,	%i1
	tneg	%icc,	0x5
	bge,a,pt	%icc,	loop_339
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ta	%icc,	0x4
	edge16l	%o3,	%i3,	%o6
loop_339:
	movrlz	%o7,	0x059,	%o5
	bleu,a,pn	%icc,	loop_340
	movn	%xcc,	%g3,	%i4
	set	0x12, %g7
	ldstuba	[%l7 + %g7] 0x81,	%i2
loop_340:
	alignaddr	%o2,	%o1,	%i6
	array16	%o0,	%l0,	%g2
	nop
	setx	0x33E9805CB448E5C0,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0x4ABF56CBBE5C5011,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fmuld	%f0,	%f8,	%f0
	alignaddr	%l5,	%g5,	%l6
	set	0x40, %i3
	lduha	[%l7 + %i3] 0x14,	%g4
	nop
	set	0x5C, %o4
	lduw	[%l7 + %o4],	%i7
	brlz,a	%l4,	loop_341
	nop
	setx	loop_342,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movcs	%icc,	%l1,	%g7
	alignaddrl	%g6,	%i5,	%i0
loop_341:
	nop
	wr	%g0,	0x89,	%asi
	ldsha	[%l7 + 0x58] %asi,	%o4
loop_342:
	bcs,a	%icc,	loop_343
	tvc	%icc,	0x2
	umul	%l3,	0x1242,	%g1
	fbo,a	%fcc1,	loop_344
loop_343:
	stb	%i1,	[%l7 + 0x15]
	mova	%icc,	%l2,	%o3
	edge8n	%i3,	%o6,	%o5
loop_344:
	sethi	0x0E97,	%g3
	fsrc1s	%f21,	%f10
	tpos	%xcc,	0x5
	tcc	%icc,	0x5
	array8	%o7,	%i4,	%o2
	srlx	%o1,	%i2,	%i6
	edge32l	%l0,	%g2,	%l5
	fnot2	%f16,	%f20
	fbge,a	%fcc3,	loop_345
	tsubcctv	%g5,	0x10CC,	%l6
	wr	%g0,	0x11,	%asi
	lda	[%l7 + 0x4C] %asi,	%f22
loop_345:
	tgu	%xcc,	0x4
	udiv	%o0,	0x0A49,	%g4
	brlez	%i7,	loop_346
	edge32ln	%l1,	%l4,	%g7
	ba,pn	%xcc,	loop_347
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_346:
	bl	loop_348
	fnands	%f12,	%f31,	%f14
loop_347:
	fmovdn	%icc,	%f8,	%f9
	nop
	setx	0xAB20F796DACBE75E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0xA918A2204B77DC4D,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	faddd	%f28,	%f22,	%f0
loop_348:
	subc	%i5,	0x1441,	%g6
	fpadd16s	%f5,	%f21,	%f23
	ta	%icc,	0x7
	edge8n	%i0,	%o4,	%l3
	movcs	%xcc,	%g1,	%i1
	taddcc	%l2,	0x18B9,	%i3
	tle	%icc,	0x3
	nop
	setx	loop_349,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tsubcc	%o6,	0x1477,	%o3
	fmovsleu	%xcc,	%f6,	%f4
	subcc	%g3,	0x095C,	%o5
loop_349:
	array32	%o7,	%i4,	%o2
	movle	%xcc,	%i2,	%o1
	tgu	%xcc,	0x4
	fbug	%fcc0,	loop_350
	fmovdvs	%xcc,	%f31,	%f12
	brgz,a	%i6,	loop_351
	brnz	%l0,	loop_352
loop_350:
	sll	%g2,	0x03,	%l5
	mulscc	%l6,	%o0,	%g5
loop_351:
	orncc	%i7,	0x1975,	%l1
loop_352:
	fmovdleu	%xcc,	%f6,	%f0
	fnors	%f7,	%f26,	%f11
	tneg	%xcc,	0x2
	movrlez	%g4,	%l4,	%i5
	edge8	%g7,	%g6,	%o4
	tl	%icc,	0x5
	fbu	%fcc0,	loop_353
	mova	%icc,	%l3,	%i0
	movn	%icc,	%i1,	%l2
	movrlez	%i3,	0x0EB,	%g1
loop_353:
	stx	%o3,	[%l7 + 0x40]
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movre	%o6,	0x1A2,	%o5
	pdist	%f20,	%f6,	%f28
	edge32ln	%o7,	%i4,	%o2
	bl	loop_354
	addcc	%g3,	%i2,	%i6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ba	%xcc,	loop_355
loop_354:
	sdivcc	%o1,	0x112F,	%g2
	set	0x70, %i1
	ldda	[%l7 + %i1] 0x04,	%l0
loop_355:
	fmovsvs	%xcc,	%f21,	%f24
	set	0x40, %l4
	stda	%f0,	[%l7 + %l4] 0x1f
	membar	#Sync
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	brgz	%l6,	loop_356
	movge	%xcc,	%l5,	%o0
	tvc	%xcc,	0x5
	addccc	%g5,	0x0131,	%l1
loop_356:
	movge	%icc,	%i7,	%l4
	wr	%g0,	0x18,	%asi
	stwa	%i5,	[%l7 + 0x28] %asi
	alignaddr	%g7,	%g6,	%o4
	brnz,a	%l3,	loop_357
	ta	%icc,	0x7
	sir	0x157E
	umul	%i0,	%i1,	%l2
loop_357:
	nop
	setx	0xB05187F3,	%l0,	%l6
	st	%l6,	[%l7 + 0x20]
	ld	[%l7 + 0x20],	%fsr
	brgz	%i3,	loop_358
	nop
	setx	0x546F9EA150503D25,	%l0,	%l6
	stx	%l6,	[%l7 + 0x40]
	ldx	[%l7 + 0x40],	%fsr
	tvs	%icc,	0x6
	tg	%icc,	0x3
loop_358:
	fxnor	%f2,	%f18,	%f4
	taddcctv	%g1,	%g4,	%o3
	brlez	%o6,	loop_359
	tneg	%icc,	0x3
	fsrc2s	%f1,	%f1
	fmovrsgez	%o7,	%f6,	%f18
loop_359:
	lduw	[%l7 + 0x34],	%o5
	nop
	setx loop_360, %l0, %l1
	jmpl %l1, %i4
	movn	%xcc,	%g3,	%i2
	movcs	%icc,	%i6,	%o2
	sll	%g2,	%l0,	%l6
loop_360:
	edge8l	%l5,	%o0,	%o1
	be,pn	%icc,	loop_361
	array32	%l1,	%i7,	%g5
	brnz,a	%i5,	loop_362
	tleu	%xcc,	0x0
loop_361:
	nop
	setx	loop_363,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	tne	%icc,	0x6
loop_362:
	tg	%xcc,	0x4
	edge32ln	%l4,	%g6,	%g7
loop_363:
	fmul8ulx16	%f16,	%f18,	%f8
	subc	%l3,	0x078C,	%o4
	bleu	loop_364
	and	%i1,	%l2,	%i0
	nop
	fitos	%f0,	%f17
	fstox	%f17,	%f0
	fxtos	%f0,	%f4
	be,a	%icc,	loop_365
loop_364:
	for	%f22,	%f24,	%f22
	sdivcc	%i3,	0x015E,	%g1
	bge,a	%icc,	loop_366
loop_365:
	fbug	%fcc3,	loop_367
	and	%o3,	0x07A7,	%g4
	udivx	%o7,	0x1274,	%o5
loop_366:
	taddcctv	%o6,	%i4,	%g3
loop_367:
	xor	%i2,	%o2,	%g2
	brlz,a	%i6,	loop_368
	movg	%icc,	%l6,	%l5
	mulscc	%l0,	0x1FC2,	%o1
	fmovrsgez	%l1,	%f26,	%f8
loop_368:
	fbne,a	%fcc1,	loop_369
	fbe	%fcc2,	loop_370
	tsubcctv	%o0,	0x00A9,	%i7
	bvs,a	loop_371
loop_369:
	subccc	%g5,	%i5,	%g6
loop_370:
	addcc	%l4,	%g7,	%o4
	movrne	%i1,	%l2,	%l3
loop_371:
	tl	%icc,	0x3
	nop
	setx	0x4FD2FADEAF899817,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0x683DCADB13BCE097,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	fmuld	%f30,	%f6,	%f18
	tle	%xcc,	0x6
	fbe,a	%fcc3,	loop_372
	xnor	%i3,	%g1,	%o3
	movrne	%i0,	%g4,	%o5
	movvs	%xcc,	%o7,	%o6
loop_372:
	tcs	%icc,	0x4
	nop
	setx	0x1EB7FE7B,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f16
	fsqrts	%f16,	%f27
	alignaddrl	%i4,	%i2,	%o2
	brnz	%g2,	loop_373
	movrlez	%i6,	0x0EF,	%l6
	fmovsge	%xcc,	%f14,	%f11
	fpadd16s	%f29,	%f21,	%f10
loop_373:
	bleu,pn	%xcc,	loop_374
	ble,a,pn	%icc,	loop_375
	movle	%icc,	%g3,	%l0
	bvc,pn	%icc,	loop_376
loop_374:
	movrne	%o1,	0x059,	%l1
loop_375:
	fornot1s	%f25,	%f10,	%f23
	fands	%f2,	%f24,	%f17
loop_376:
	nop
	wr	%g0,	0x27,	%asi
	ldda	[%l7 + 0x20] %asi,	%l4
	movcs	%icc,	%i7,	%g5
	brnz,a	%o0,	loop_377
	fone	%f28
	edge32ln	%i5,	%g6,	%g7
	tn	%icc,	0x2
loop_377:
	nop
	fitod	%f4,	%f28
	fdtoi	%f28,	%f31
	brgz,a	%l4,	loop_378
	ldsb	[%l7 + 0x6B],	%i1
	faligndata	%f2,	%f22,	%f10
	bn,a,pn	%icc,	loop_379
loop_378:
	movgu	%icc,	%l2,	%l3
	ldstub	[%l7 + 0x45],	%o4
	movn	%icc,	%g1,	%i3
loop_379:
	udivcc	%i0,	0x0DA9,	%o3
	movrne	%o5,	%g4,	%o7
	tneg	%xcc,	0x6
	sdivcc	%i4,	0x0363,	%i2
	tn	%icc,	0x4
	set	0x0D, %l6
	ldsba	[%l7 + %l6] 0x04,	%o2
	wr	%g0,	0x80,	%asi
	sta	%f0,	[%l7 + 0x38] %asi
	tleu	%icc,	0x5
	set	0x5C, %i2
	ldswa	[%l7 + %i2] 0x81,	%o6
	tneg	%icc,	0x4
	edge8ln	%i6,	%l6,	%g3
	pdist	%f14,	%f20,	%f18
	wr	%g0,	0x10,	%asi
	stwa	%g2,	[%l7 + 0x4C] %asi
	nop
	setx	0x44D9821B904FEB14,	%l0,	%l6
	stx	%l6,	[%l7 + 0x68]
	ldx	[%l7 + 0x68],	%fsr
	movvc	%icc,	%o1,	%l0
	fbu	%fcc2,	loop_380
	edge16n	%l5,	%l1,	%g5
	ld	[%l7 + 0x0C],	%f17
	movpos	%icc,	%i7,	%i5
loop_380:
	edge32	%o0,	%g6,	%l4
	ldx	[%l7 + 0x10],	%g7
	movvc	%xcc,	%i1,	%l2
	fmuld8ulx16	%f15,	%f17,	%f0
	bgu,a,pn	%xcc,	loop_381
	fbe,a	%fcc0,	loop_382
	fmovsge	%icc,	%f14,	%f4
	add	%l7,	0x5C,	%l6
	wr	%g0,	0x11,	%asi
	casa	[%l6] 0x11,	%l3,	%g1
loop_381:
	fmul8sux16	%f20,	%f0,	%f0
loop_382:
	movgu	%icc,	%o4,	%i3
	fbge,a	%fcc1,	loop_383
	edge16	%o3,	%i0,	%g4
	lduw	[%l7 + 0x1C],	%o5
	nop
	setx	0x31805CA9B07ECA01,	%l0,	%l6
	stx	%l6,	[%l7 + 0x40]
	ldx	[%l7 + 0x40],	%fsr
loop_383:
	be,a,pn	%xcc,	loop_384
	sdivcc	%o7,	0x1611,	%i4
	ld	[%l7 + 0x28],	%f2
	xnor	%o2,	0x1E07,	%i2
loop_384:
	fmul8x16au	%f16,	%f22,	%f30
	movvs	%xcc,	%i6,	%o6
	movl	%xcc,	%l6,	%g3
	ldsb	[%l7 + 0x3A],	%o1
	fandnot1	%f6,	%f12,	%f6
	ldub	[%l7 + 0x6B],	%g2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fexpand	%f10,	%f16
	movvc	%icc,	%l5,	%l0
	edge16ln	%l1,	%i7,	%g5
	movg	%xcc,	%o0,	%i5
	add	%l7,	0x60,	%l6
	wr	%g0,	0x10,	%asi
	casa	[%l6] %asi,	%l4,	%g7
	xor	%i1,	0x0D28,	%g6
	nop
	setx	0x84C3AE3B1248AB0F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0xA6C8E6DD819C5E2D,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	fdivd	%f18,	%f14,	%f12
	fbn,a	%fcc2,	loop_385
	ta	%icc,	0x2
	fpackfix	%f4,	%f27
	andcc	%l3,	0x1EBD,	%l2
loop_385:
	stbar
	xnorcc	%g1,	%i3,	%o3
	taddcc	%i0,	%g4,	%o4
	edge8n	%o7,	%i4,	%o5
	tpos	%xcc,	0x7
	andn	%o2,	%i6,	%o6
	tl	%icc,	0x6
	bgu,a	loop_386
	move	%xcc,	%l6,	%g3
	and	%o1,	%g2,	%l5
	fpsub16	%f20,	%f2,	%f2
loop_386:
	edge16l	%i2,	%l0,	%i7
	sll	%l1,	%o0,	%i5
	fmovsleu	%icc,	%f22,	%f23
	fexpand	%f17,	%f20
	brlez	%g5,	loop_387
	movrgez	%g7,	0x37E,	%i1
	movge	%xcc,	%l4,	%g6
	bg	%icc,	loop_388
loop_387:
	movcs	%icc,	%l3,	%l2
	fmovrde	%g1,	%f22,	%f2
	tcc	%icc,	0x3
loop_388:
	fpackfix	%f12,	%f21
	srlx	%o3,	%i0,	%g4
	orcc	%i3,	0x136A,	%o7
	edge16ln	%o4,	%i4,	%o2
	edge16	%i6,	%o6,	%l6
	brlez,a	%o5,	loop_389
	smul	%o1,	0x1305,	%g3
	xorcc	%l5,	0x0A01,	%i2
	call	loop_390
loop_389:
	brz,a	%l0,	loop_391
	movcs	%icc,	%g2,	%i7
	and	%o0,	0x11BD,	%l1
loop_390:
	subc	%i5,	%g5,	%g7
loop_391:
	edge32ln	%l4,	%g6,	%l3
	orcc	%l2,	0x1B67,	%g1
	fabsd	%f20,	%f22
	array8	%o3,	%i0,	%i1
	stbar
	tl	%xcc,	0x1
	te	%icc,	0x6
	wr	%g0,	0x10,	%asi
	ldsha	[%l7 + 0x16] %asi,	%g4
	move	%xcc,	%o7,	%o4
	subcc	%i3,	%o2,	%i6
	or	%i4,	%o6,	%l6
	udiv	%o1,	0x0731,	%g3
	movrgez	%o5,	%i2,	%l5
	fbue,a	%fcc3,	loop_392
	fbu	%fcc0,	loop_393
	tsubcctv	%l0,	%i7,	%o0
	fbo,a	%fcc3,	loop_394
loop_392:
	bne	%icc,	loop_395
loop_393:
	movg	%icc,	%g2,	%l1
	edge8n	%g5,	%i5,	%g7
loop_394:
	udiv	%l4,	0x15A6,	%l3
loop_395:
	fmovsle	%icc,	%f27,	%f21
	brgz,a	%g6,	loop_396
	fbuge,a	%fcc2,	loop_397
	movrgez	%l2,	0x1D2,	%o3
	andn	%g1,	0x0BA3,	%i0
loop_396:
	subccc	%i1,	0x117D,	%o7
loop_397:
	nop
	setx	0x1313BD5E6170CE54,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	fsqrtd	%f20,	%f24
	tcs	%xcc,	0x2
	srlx	%g4,	0x12,	%o4
	movne	%icc,	%o2,	%i3
	fmovrslz	%i6,	%f18,	%f13
	nop
	set	0x2D, %l0
	stb	%o6,	[%l7 + %l0]
	fpsub32	%f0,	%f8,	%f12
	fmovdpos	%icc,	%f28,	%f27
	tle	%icc,	0x0
	orcc	%l6,	%o1,	%i4
	fmovrsgez	%o5,	%f17,	%f13
	array16	%i2,	%l5,	%g3
	nop
	fitod	%f4,	%f14
	fdtox	%f14,	%f18
	fxtod	%f18,	%f22
	nop
	setx	loop_398,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fmovd	%f22,	%f28
	edge16l	%i7,	%o0,	%l0
	movge	%xcc,	%l1,	%g2
loop_398:
	sra	%i5,	0x0B,	%g7
	tvs	%xcc,	0x4
	movneg	%icc,	%g5,	%l4
	ta	%icc,	0x6
	subc	%g6,	0x1069,	%l2
	bcs	loop_399
	fornot1s	%f25,	%f28,	%f17
	orn	%l3,	%o3,	%i0
	fpsub16	%f10,	%f6,	%f18
loop_399:
	tn	%icc,	0x3
	addc	%g1,	%i1,	%g4
	sll	%o4,	%o7,	%i3
	fmovrdgz	%i6,	%f8,	%f26
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16	%o6,	%l6,	%o2
	movne	%xcc,	%o1,	%o5
	fabsd	%f8,	%f20
	tl	%icc,	0x7
	bgu,a,pt	%icc,	loop_400
	smul	%i4,	0x0A7E,	%i2
	tvc	%xcc,	0x3
	nop
	fitos	%f8,	%f7
	fstoi	%f7,	%f0
loop_400:
	std	%f20,	[%l7 + 0x50]
	bg	%xcc,	loop_401
	array32	%l5,	%i7,	%g3
	tleu	%icc,	0x5
	fmovs	%f18,	%f21
loop_401:
	movneg	%xcc,	%o0,	%l1
	movrlz	%g2,	0x367,	%i5
	edge16	%g7,	%l0,	%g5
	nop
	setx	loop_402,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	ldsw	[%l7 + 0x64],	%g6
	movre	%l4,	%l2,	%o3
	movvc	%xcc,	%i0,	%g1
loop_402:
	xor	%i1,	%g4,	%l3
	brlez,a	%o7,	loop_403
	fpadd16	%f28,	%f26,	%f2
	alignaddrl	%i3,	%o4,	%o6
	fbo,a	%fcc2,	loop_404
loop_403:
	edge32n	%l6,	%i6,	%o1
	movrgez	%o5,	0x29A,	%i4
	movrgz	%i2,	0x3D4,	%l5
loop_404:
	fnot1s	%f5,	%f7
	nop
	setx	loop_405,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	bn	%xcc,	loop_406
	bcc	loop_407
	sdivx	%o2,	0x1333,	%g3
loop_405:
	movl	%icc,	%o0,	%l1
loop_406:
	bcc,pt	%xcc,	loop_408
loop_407:
	sll	%i7,	0x16,	%i5
	sth	%g2,	[%l7 + 0x16]
	array32	%g7,	%l0,	%g6
loop_408:
	srax	%l4,	%l2,	%g5
	andn	%o3,	0x1EA3,	%i0
	movle	%icc,	%g1,	%g4
	udivcc	%i1,	0x0F8A,	%o7
	be	%icc,	loop_409
	te	%xcc,	0x7
	subccc	%i3,	0x0EA1,	%l3
	movrlz	%o6,	%o4,	%i6
loop_409:
	addc	%l6,	0x03FC,	%o5
	movre	%o1,	0x213,	%i4
	edge8ln	%l5,	%i2,	%g3
	subcc	%o2,	0x0D24,	%o0
	nop
	fitod	%f4,	%f28
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movneg	%xcc,	%i7,	%l1
	bge,pt	%icc,	loop_410
	alignaddr	%i5,	%g7,	%g2
	fmovdleu	%xcc,	%f21,	%f19
	fmovs	%f20,	%f30
loop_410:
	tcs	%icc,	0x3
	bleu,a,pn	%xcc,	loop_411
	edge16n	%g6,	%l0,	%l2
	fbn	%fcc0,	loop_412
	fandnot2s	%f20,	%f24,	%f2
loop_411:
	fmovsleu	%xcc,	%f25,	%f7
	umulcc	%g5,	0x12D9,	%o3
loop_412:
	smulcc	%i0,	%g1,	%g4
	mulx	%i1,	%l4,	%i3
	wr	%g0,	0x10,	%asi
	lduba	[%l7 + 0x6B] %asi,	%l3
	set	0x50, %o5
	ldda	[%l7 + %o5] 0x11,	%o6
	alignaddr	%o4,	%o6,	%l6
	movrlz	%o5,	%i6,	%i4
	fbe	%fcc1,	loop_413
	smul	%l5,	0x1DE0,	%i2
	add	%o1,	0x1B33,	%o2
	alignaddr	%g3,	%o0,	%l1
loop_413:
	array32	%i7,	%g7,	%i5
	tcs	%xcc,	0x5
	addcc	%g6,	%g2,	%l0
	fmovdl	%xcc,	%f16,	%f28
	fmovrde	%l2,	%f2,	%f8
	alignaddr	%o3,	%i0,	%g1
	movneg	%icc,	%g4,	%i1
	or	%l4,	0x038E,	%g5
	ble,a	%xcc,	loop_414
	addcc	%l3,	0x0A58,	%o7
	bleu,a	loop_415
	fmovrsgz	%o4,	%f20,	%f23
loop_414:
	movneg	%icc,	%o6,	%l6
	tge	%icc,	0x4
loop_415:
	fbue,a	%fcc0,	loop_416
	mulscc	%i3,	0x12EC,	%o5
	movrgez	%i6,	%l5,	%i2
	sllx	%i4,	%o1,	%g3
loop_416:
	movle	%xcc,	%o0,	%l1
	edge32	%i7,	%g7,	%i5
	orncc	%g6,	%o2,	%l0
	call	loop_417
	movg	%xcc,	%g2,	%l2
	set	0x6A, %o6
	stha	%i0,	[%l7 + %o6] 0x23
	membar	#Sync
loop_417:
	movne	%icc,	%o3,	%g1
	tge	%xcc,	0x4
	andn	%i1,	0x0854,	%l4
	udiv	%g5,	0x1C0D,	%l3
	fmovsvs	%xcc,	%f2,	%f23
	ble	loop_418
	edge8n	%g4,	%o7,	%o4
	fnand	%f4,	%f26,	%f0
	xorcc	%o6,	0x1793,	%l6
loop_418:
	flush	%l7 + 0x4C
	array32	%i3,	%o5,	%l5
	sll	%i2,	%i4,	%o1
	orn	%i6,	0x1BE0,	%g3
	xorcc	%l1,	%i7,	%o0
	fba,a	%fcc2,	loop_419
	nop
	setx	loop_420,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	nop
	fitos	%f1,	%f3
	brgz	%g7,	loop_421
loop_419:
	tvc	%icc,	0x7
loop_420:
	fmovsvc	%icc,	%f7,	%f30
	fsrc1s	%f10,	%f16
loop_421:
	movrlz	%g6,	%i5,	%o2
	fors	%f12,	%f29,	%f22
	tg	%icc,	0x2
	add	%l0,	%l2,	%g2
	mulx	%o3,	%g1,	%i1
	fbo	%fcc2,	loop_422
	orn	%i0,	%g5,	%l3
	fsrc2s	%f6,	%f21
	fmovsl	%icc,	%f30,	%f22
loop_422:
	nop
	add	%l7,	0x40,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] %asi,	%l4,	%g4
	fbn	%fcc3,	loop_423
	fxors	%f20,	%f12,	%f1
	sir	0x0D24
	sdivx	%o7,	0x0A03,	%o4
loop_423:
	bge,pn	%xcc,	loop_424
	brlez	%o6,	loop_425
	smulcc	%l6,	0x0616,	%o5
	movrne	%i3,	%l5,	%i2
loop_424:
	fmul8sux16	%f0,	%f26,	%f26
loop_425:
	fnand	%f6,	%f6,	%f26
	edge32l	%o1,	%i4,	%i6
	tle	%xcc,	0x0
	be	%icc,	loop_426
	bleu,a	%xcc,	loop_427
	tcc	%xcc,	0x2
	movre	%g3,	0x112,	%i7
loop_426:
	udiv	%l1,	0x039C,	%g7
loop_427:
	fcmpgt16	%f28,	%f16,	%g6
	addccc	%o0,	%i5,	%o2
	bvs,a	loop_428
	udivx	%l0,	0x13B3,	%g2
	movvc	%xcc,	%l2,	%g1
	tvs	%xcc,	0x6
loop_428:
	movl	%xcc,	%o3,	%i1
	set	0x7C, %g6
	sta	%f31,	[%l7 + %g6] 0x19
	movrgz	%i0,	%g5,	%l3
	xnorcc	%g4,	%o7,	%l4
	ble	%icc,	loop_429
	sub	%o4,	%l6,	%o6
	fbn,a	%fcc2,	loop_430
	ta	%xcc,	0x5
loop_429:
	tne	%xcc,	0x0
	umulcc	%i3,	0x0E56,	%l5
loop_430:
	xnorcc	%o5,	0x098C,	%o1
	tpos	%xcc,	0x7
	edge16l	%i4,	%i2,	%g3
	movrgez	%i7,	0x166,	%i6
	membar	0x37
	fnot1s	%f14,	%f3
	sdivcc	%l1,	0x142F,	%g7
	edge16	%g6,	%o0,	%o2
	fmovda	%icc,	%f29,	%f3
	wr	%g0,	0x10,	%asi
	swapa	[%l7 + 0x40] %asi,	%l0
	fmovsle	%icc,	%f4,	%f31
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	swap	[%l7 + 0x10],	%i5
	movrgz	%l2,	%g1,	%g2
	fbo,a	%fcc1,	loop_431
	mova	%icc,	%o3,	%i0
	fnegs	%f24,	%f30
	srl	%g5,	%i1,	%l3
loop_431:
	fbu,a	%fcc2,	loop_432
	sth	%o7,	[%l7 + 0x1A]
	fnot1s	%f16,	%f6
	brlez,a	%l4,	loop_433
loop_432:
	bpos	loop_434
	st	%f25,	[%l7 + 0x68]
	edge32n	%g4,	%l6,	%o4
loop_433:
	tleu	%icc,	0x5
loop_434:
	popc	%o6,	%i3
	fbn,a	%fcc3,	loop_435
	sdivcc	%o5,	0x15D2,	%l5
	tpos	%xcc,	0x0
	smulcc	%o1,	%i4,	%i2
loop_435:
	nop
	set	0x54, %g4
	stha	%g3,	[%l7 + %g4] 0xe2
	membar	#Sync
	tge	%xcc,	0x4
	nop
	setx loop_436, %l0, %l1
	jmpl %l1, %i7
	edge8n	%l1,	%g7,	%g6
	fnegs	%f13,	%f0
	addc	%i6,	%o0,	%o2
loop_436:
	nop
	set	0x5C, %i4
	swapa	[%l7 + %i4] 0x19,	%i5
	lduw	[%l7 + 0x78],	%l2
	fcmpeq32	%f20,	%f12,	%g1
	edge32l	%l0,	%g2,	%o3
	andncc	%g5,	%i1,	%i0
	andn	%l3,	0x1962,	%l4
	mova	%icc,	%g4,	%l6
	te	%xcc,	0x7
	fmovsgu	%icc,	%f29,	%f10
	nop
	fitod	%f6,	%f0
	fdtox	%f0,	%f22
	fornot1	%f28,	%f24,	%f18
	fmovse	%icc,	%f20,	%f13
	sub	%o7,	0x1A4B,	%o4
	tgu	%xcc,	0x5
	edge8l	%o6,	%i3,	%l5
	sub	%o1,	%i4,	%o5
	ldd	[%l7 + 0x48],	%g2
	brz	%i7,	loop_437
	movg	%xcc,	%i2,	%l1
	xorcc	%g6,	%i6,	%g7
	sub	%o0,	0x1297,	%i5
loop_437:
	array16	%l2,	%o2,	%g1
	faligndata	%f28,	%f16,	%f16
	mulx	%g2,	0x1D84,	%l0
	brgez,a	%o3,	loop_438
	ldsw	[%l7 + 0x18],	%g5
	xnor	%i0,	0x1645,	%l3
	subc	%i1,	%g4,	%l4
loop_438:
	fble,a	%fcc3,	loop_439
	fandnot2s	%f12,	%f12,	%f3
	ta	%xcc,	0x6
	movcs	%xcc,	%l6,	%o4
loop_439:
	smulcc	%o6,	0x061D,	%o7
	fandnot1s	%f15,	%f9,	%f1
	set	0x40, %i0
	lduha	[%l7 + %i0] 0x19,	%l5
	fzeros	%f25
	fmovs	%f31,	%f16
	movgu	%xcc,	%i3,	%o1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmpgt32	%f8,	%f8,	%o5
	fmovsa	%icc,	%f22,	%f30
	fbug	%fcc0,	loop_440
	andncc	%i4,	%g3,	%i2
	nop
	setx	0x4F7EE467,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f28
	setx	0x3DB36867,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f23
	fdivs	%f23,	%f28,	%f6
	bleu,pt	%icc,	loop_441
loop_440:
	bne	%xcc,	loop_442
	edge16l	%l1,	%g6,	%i6
	bcs,a,pn	%xcc,	loop_443
loop_441:
	ta	%xcc,	0x6
loop_442:
	fmovrdgz	%i7,	%f8,	%f0
	movneg	%icc,	%g7,	%o0
loop_443:
	fmovda	%icc,	%f22,	%f18
	umul	%i5,	%l2,	%g1
	addcc	%o2,	%l0,	%o3
	fmul8x16au	%f9,	%f25,	%f0
	fbug	%fcc0,	loop_444
	nop
	setx	0xCE659DBB27CA9251,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0x6713D3C68C887571,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	fmuld	%f8,	%f22,	%f14
	tle	%icc,	0x2
	movrne	%g2,	%g5,	%i0
loop_444:
	taddcctv	%l3,	0x0534,	%g4
	sra	%i1,	0x0A,	%l4
	udivx	%o4,	0x06F1,	%o6
	umulcc	%o7,	%l5,	%l6
	andcc	%o1,	0x1BCA,	%i3
	sub	%o5,	%g3,	%i4
	fxors	%f27,	%f18,	%f14
	udiv	%l1,	0x1794,	%g6
	fmovrsgz	%i6,	%f0,	%f30
	sub	%i7,	0x15F4,	%i2
	fpack16	%f30,	%f2
	xnor	%g7,	%o0,	%i5
	fpsub16	%f0,	%f14,	%f22
	edge8ln	%g1,	%l2,	%o2
	movne	%xcc,	%o3,	%g2
	fmovdle	%xcc,	%f25,	%f28
	mulx	%g5,	%l0,	%l3
	tle	%icc,	0x1
	tsubcctv	%i0,	%g4,	%l4
	fmovs	%f12,	%f20
	movrlz	%i1,	%o4,	%o6
	tl	%xcc,	0x5
	edge32	%l5,	%o7,	%o1
	fmuld8sux16	%f24,	%f30,	%f18
	mulx	%i3,	%l6,	%g3
	set	0x74, %g3
	stwa	%o5,	[%l7 + %g3] 0x18
	flush	%l7 + 0x48
	fbe,a	%fcc1,	loop_445
	sethi	0x10BC,	%l1
	nop
	setx	0x83E18AA9,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f18
	setx	0x7DA824BA,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f28
	fmuls	%f28,	%f18,	%f15
	set	0x36, %i5
	lduha	[%l7 + %i5] 0x80,	%g6
loop_445:
	fbue,a	%fcc0,	loop_446
	srlx	%i4,	0x09,	%i7
	lduh	[%l7 + 0x24],	%i6
	fabsd	%f4,	%f6
loop_446:
	fcmpeq32	%f10,	%f2,	%g7
	andn	%o0,	%i2,	%g1
	movne	%icc,	%i5,	%o2
	orcc	%l2,	%o3,	%g5
	sll	%l0,	0x07,	%g2
	fexpand	%f10,	%f30
	stbar
	prefetch	[%l7 + 0x2C],	 0x2
	subc	%i0,	%g4,	%l3
	tge	%xcc,	0x1
	edge8n	%l4,	%o4,	%o6
	movg	%xcc,	%l5,	%o7
	nop
	setx loop_447, %l0, %l1
	jmpl %l1, %i1
	movpos	%xcc,	%i3,	%o1
	lduh	[%l7 + 0x3E],	%g3
	ta	%icc,	0x6
loop_447:
	alignaddrl	%l6,	%o5,	%l1
	movvc	%xcc,	%g6,	%i4
	add	%l7,	0x68,	%l6
	wr	%g0,	0x04,	%asi
	casa	[%l6] %asi,	%i7,	%g7
	set	0x4C, %l3
	ldswa	[%l7 + %l3] 0x81,	%o0
	wr	%g0,	0x88,	%asi
	lduwa	[%l7 + 0x54] %asi,	%i6
	orcc	%g1,	%i2,	%o2
	xnorcc	%l2,	0x09F8,	%o3
	sdiv	%g5,	0x157E,	%i5
	fbg,a	%fcc2,	loop_448
	be	%xcc,	loop_449
	popc	0x0F7F,	%g2
	std	%f24,	[%l7 + 0x70]
loop_448:
	fornot2s	%f15,	%f28,	%f28
loop_449:
	te	%xcc,	0x2
	edge32n	%i0,	%l0,	%l3
	edge32ln	%g4,	%l4,	%o4
	movle	%icc,	%o6,	%l5
	fmovdcs	%xcc,	%f16,	%f15
	stx	%i1,	[%l7 + 0x58]
	wr	%g0,	0x04,	%asi
	lda	[%l7 + 0x30] %asi,	%f0
	swap	[%l7 + 0x58],	%i3
	tvs	%icc,	0x3
	movl	%xcc,	%o7,	%g3
	smulcc	%o1,	%o5,	%l1
	subcc	%l6,	0x0FB1,	%i4
	tge	%icc,	0x5
	fornot2s	%f15,	%f7,	%f26
	set	0x40, %i6
	ldsha	[%l7 + %i6] 0x10,	%i7
	wr	%g0,	0x80,	%asi
	ldxa	[%l7 + 0x38] %asi,	%g6
	movne	%icc,	%o0,	%i6
	udiv	%g1,	0x0FCF,	%g7
	edge8ln	%o2,	%i2,	%o3
	bvs,pt	%xcc,	loop_450
	fmovda	%icc,	%f19,	%f20
	addccc	%g5,	%i5,	%g2
	edge8n	%i0,	%l0,	%l3
loop_450:
	bcs,pt	%icc,	loop_451
	movrgez	%l2,	%l4,	%g4
	umulcc	%o6,	%o4,	%l5
	smulcc	%i3,	0x1B8C,	%o7
loop_451:
	nop
	wr	%g0,	0x10,	%asi
	ldstuba	[%l7 + 0x65] %asi,	%g3
	smul	%i1,	%o5,	%o1
	brlez	%l6,	loop_452
	nop
	setx	0x40FD49921C0B955F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0xB4013BD7F0AD6932,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fmuld	%f0,	%f24,	%f6
	tleu	%icc,	0x5
	popc	%l1,	%i4
loop_452:
	bpos	%xcc,	loop_453
	udivcc	%g6,	0x04D3,	%o0
	movneg	%xcc,	%i7,	%g1
	fmovda	%icc,	%f24,	%f7
loop_453:
	tle	%icc,	0x4
	movle	%xcc,	%i6,	%o2
	bn,pn	%xcc,	loop_454
	brgez	%i2,	loop_455
	movgu	%icc,	%g7,	%o3
	tleu	%xcc,	0x7
loop_454:
	movrlz	%g5,	%g2,	%i0
loop_455:
	movle	%icc,	%i5,	%l3
	edge32n	%l2,	%l4,	%g4
	udiv	%o6,	0x0F30,	%l0
	movrgez	%l5,	%i3,	%o4
	fpsub16s	%f16,	%f23,	%f17
	srl	%o7,	%g3,	%o5
	subc	%o1,	%i1,	%l1
	edge32n	%i4,	%l6,	%o0
	sethi	0x092D,	%i7
	mulscc	%g1,	%i6,	%g6
	fand	%f26,	%f22,	%f20
	subc	%o2,	0x10B7,	%i2
	fbu	%fcc3,	loop_456
	stx	%g7,	[%l7 + 0x78]
	tgu	%icc,	0x4
	andcc	%g5,	%g2,	%o3
loop_456:
	umul	%i5,	0x1CDF,	%l3
	mova	%xcc,	%l2,	%l4
	edge8ln	%g4,	%o6,	%i0
	fmovsvs	%icc,	%f31,	%f10
	nop
	setx	loop_457,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fmovsleu	%icc,	%f27,	%f28
	edge32l	%l0,	%i3,	%o4
	ldd	[%l7 + 0x18],	%l4
loop_457:
	sdivx	%o7,	0x1738,	%o5
	movle	%icc,	%o1,	%g3
	fmovdge	%icc,	%f9,	%f30
	mova	%xcc,	%l1,	%i4
	fandnot1s	%f23,	%f12,	%f18
	smulcc	%i1,	%l6,	%i7
	addccc	%g1,	%i6,	%o0
	sth	%g6,	[%l7 + 0x3A]
	movleu	%icc,	%i2,	%g7
	xorcc	%o2,	0x0846,	%g5
	movcs	%icc,	%g2,	%o3
	sdiv	%i5,	0x1942,	%l3
	tleu	%xcc,	0x4
	membar	0x4D
	udivcc	%l4,	0x0E78,	%g4
	bvc,a	%icc,	loop_458
	sdivcc	%l2,	0x1174,	%i0
	movvs	%xcc,	%o6,	%i3
	ldd	[%l7 + 0x10],	%o4
loop_458:
	nop
	wr	%g0,	0x18,	%asi
	ldstuba	[%l7 + 0x5D] %asi,	%l0
	sllx	%l5,	%o7,	%o5
	mulscc	%o1,	0x0F4E,	%l1
	sll	%g3,	0x01,	%i4
	fmul8sux16	%f30,	%f22,	%f24
	bg	loop_459
	std	%f4,	[%l7 + 0x40]
	sdiv	%l6,	0x1950,	%i1
	brgez,a	%g1,	loop_460
loop_459:
	subc	%i7,	%o0,	%g6
	movl	%xcc,	%i2,	%g7
	alignaddr	%o2,	%i6,	%g2
loop_460:
	fandnot2	%f4,	%f6,	%f2
	mova	%icc,	%o3,	%i5
	nop
	setx	0xF06B2A82,	%l0,	%l6
	st	%l6,	[%l7 + 0x1C]
	ld	[%l7 + 0x1C],	%fsr
	movrne	%g5,	%l4,	%l3
	edge8	%g4,	%l2,	%o6
	te	%icc,	0x0
	faligndata	%f12,	%f6,	%f6
	tpos	%icc,	0x4
	bge	%xcc,	loop_461
	movne	%icc,	%i0,	%o4
	orn	%i3,	%l5,	%l0
	smul	%o5,	0x106B,	%o1
loop_461:
	fbuge,a	%fcc2,	loop_462
	edge16	%l1,	%o7,	%i4
	nop
	setx	0xF86EC988,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f15
	setx	0x3EE8F6C2,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f7
	fdivs	%f7,	%f15,	%f13
	brlez	%l6,	loop_463
loop_462:
	movvs	%xcc,	%i1,	%g3
	orncc	%g1,	0x037A,	%o0
	xor	%i7,	0x0231,	%g6
loop_463:
	addccc	%i2,	0x1F58,	%o2
	call	loop_464
	alignaddr	%g7,	%g2,	%o3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	setx	0x0C9ED415,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f29
	setx	0x4163222E,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f10
	fsubs	%f10,	%f29,	%f29
loop_464:
	addc	%i5,	%i6,	%g5
	sll	%l4,	%g4,	%l2
	xnor	%o6,	0x010B,	%i0
	fpadd32	%f4,	%f26,	%f30
	tleu	%icc,	0x6
	orn	%o4,	%i3,	%l3
	movcc	%xcc,	%l0,	%o5
	movn	%xcc,	%o1,	%l5
	bg	loop_465
	bleu,a,pt	%xcc,	loop_466
	fmovrdlez	%o7,	%f16,	%f24
	fmul8sux16	%f12,	%f18,	%f24
loop_465:
	xnorcc	%i4,	%l6,	%i1
loop_466:
	fmovsvc	%icc,	%f0,	%f20
	fmul8x16au	%f27,	%f27,	%f2
	sir	0x174C
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnor	%l1,	0x0EA5,	%g3
	subc	%o0,	%i7,	%g1
	edge16	%g6,	%o2,	%i2
	nop
	fitod	%f4,	%f0
	fdtos	%f0,	%f19
	xnorcc	%g7,	0x0C1F,	%g2
	edge32ln	%o3,	%i5,	%g5
	fmovrsgz	%i6,	%f13,	%f23
	addccc	%l4,	0x13E4,	%g4
	nop
	setx	loop_467,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	mova	%xcc,	%l2,	%i0
	fmovdpos	%xcc,	%f0,	%f13
	subc	%o4,	%o6,	%i3
loop_467:
	bl,a,pt	%xcc,	loop_468
	fsrc1s	%f16,	%f28
	fmul8sux16	%f26,	%f8,	%f28
	wr	%g0,	0x0c,	%asi
	prefetcha	[%l7 + 0x50] %asi,	 0x1
loop_468:
	fmovrdne	%l0,	%f20,	%f30
	orn	%o5,	0x138E,	%l5
	add	%o7,	0x0660,	%i4
	nop
	setx	0xF046292B,	%l0,	%l6
	st	%l6,	[%l7 + 0x2C]
	ld	[%l7 + 0x2C],	%fsr
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x88,	%asi
	swapa	[%l7 + 0x0C] %asi,	%l6
	alignaddrl	%o1,	%l1,	%i1
	fmovdleu	%icc,	%f30,	%f18
	add	%o0,	0x1C7F,	%g3
	tn	%icc,	0x1
	fbge	%fcc3,	loop_469
	tne	%icc,	0x6
	sethi	0x067F,	%i7
	fmovsne	%icc,	%f21,	%f6
loop_469:
	ldx	[%l7 + 0x68],	%g6
	nop
	setx	loop_470,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	brz,a	%o2,	loop_471
	tleu	%xcc,	0x0
	wr	%g0,	0x89,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
loop_470:
	umul	%g1,	0x0C35,	%g7
loop_471:
	fmovrslz	%i2,	%f2,	%f7
	faligndata	%f8,	%f0,	%f18
	andncc	%o3,	%g2,	%i5
	fnor	%f12,	%f24,	%f14
	edge32ln	%g5,	%l4,	%g4
	movre	%i6,	%i0,	%o4
	bneg,pn	%icc,	loop_472
	tsubcctv	%o6,	0x1A4D,	%i3
	stx	%l2,	[%l7 + 0x58]
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_472:
	sir	0x0D3D
	edge16ln	%l3,	%o5,	%l0
	array32	%o7,	%i4,	%l5
	set	0x24, %l1
	ldsha	[%l7 + %l1] 0x10,	%l6
	alignaddr	%l1,	%o1,	%i1
	stw	%g3,	[%l7 + 0x38]
	movcs	%icc,	%i7,	%g6
	tcc	%icc,	0x3
	xnorcc	%o2,	0x1A3C,	%g1
	tvs	%xcc,	0x7
	movg	%xcc,	%g7,	%o0
	fones	%f3
	brgz	%i2,	loop_473
	movvs	%icc,	%o3,	%i5
	popc	0x14C2,	%g5
	and	%g2,	0x07F7,	%g4
loop_473:
	umul	%l4,	%i0,	%i6
	tn	%icc,	0x1
	fcmpeq16	%f14,	%f16,	%o6
	alignaddrl	%i3,	%o4,	%l2
	bvs,pn	%icc,	loop_474
	movneg	%xcc,	%l3,	%l0
	wr	%g0,	0x81,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
loop_474:
	sra	%o5,	%o7,	%i4
	tne	%xcc,	0x4
	movge	%xcc,	%l6,	%l1
	bn,a	loop_475
	edge16ln	%o1,	%l5,	%g3
	andn	%i1,	%i7,	%g6
	tpos	%xcc,	0x1
loop_475:
	movl	%xcc,	%o2,	%g7
	movcc	%icc,	%g1,	%o0
	tcs	%icc,	0x7
	set	0x40, %g5
	stda	%f0,	[%l7 + %g5] 0x81
	lduw	[%l7 + 0x4C],	%i2
	tsubcc	%o3,	%g5,	%i5
	movrlz	%g2,	0x3ED,	%l4
	movrlz	%i0,	%g4,	%i6
	fmovdcs	%icc,	%f28,	%f23
	edge16l	%o6,	%o4,	%l2
	movrgz	%l3,	%i3,	%l0
	ldd	[%l7 + 0x58],	%o4
	sethi	0x0C56,	%i4
	tge	%xcc,	0x2
	tle	%icc,	0x0
	bg	loop_476
	movleu	%icc,	%l6,	%o7
	nop
	setx	loop_477,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fabss	%f20,	%f22
loop_476:
	edge16l	%o1,	%l5,	%g3
	fcmpgt32	%f2,	%f8,	%l1
loop_477:
	fmovdcc	%icc,	%f1,	%f17
	fmovsvc	%xcc,	%f17,	%f21
	subcc	%i7,	0x02A6,	%g6
	tpos	%xcc,	0x5
	taddcc	%i1,	%o2,	%g1
	sethi	0x1F53,	%o0
	edge32l	%i2,	%o3,	%g7
	movcs	%icc,	%i5,	%g2
	movcc	%xcc,	%l4,	%g5
	fmul8x16	%f1,	%f10,	%f22
	fmovdne	%xcc,	%f7,	%f17
	subccc	%i0,	%i6,	%g4
	fbn,a	%fcc3,	loop_478
	sllx	%o6,	0x18,	%l2
	edge16n	%o4,	%i3,	%l3
	andn	%l0,	%o5,	%l6
loop_478:
	fzero	%f14
	ldsh	[%l7 + 0x10],	%o7
	sllx	%o1,	0x1A,	%i4
	mulx	%l5,	0x08B1,	%l1
	xnorcc	%g3,	%g6,	%i1
	membar	0x2F
	edge8ln	%o2,	%i7,	%o0
	tleu	%xcc,	0x7
	movpos	%icc,	%i2,	%g1
	movvc	%xcc,	%g7,	%i5
	array8	%o3,	%l4,	%g5
	mova	%xcc,	%i0,	%i6
	lduw	[%l7 + 0x7C],	%g2
	wr	%g0,	0x10,	%asi
	lda	[%l7 + 0x7C] %asi,	%f23
	pdist	%f30,	%f0,	%f26
	fnands	%f2,	%f24,	%f17
	fornot1s	%f28,	%f5,	%f29
	sethi	0x00AC,	%g4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tsubcc	%o6,	0x120F,	%l2
	wr	%g0,	0x58,	%asi
	ldxa	[%g0 + 0x0] %asi,	%o4
	sll	%l3,	0x01,	%l0
	movrgez	%o5,	%l6,	%o7
	edge8n	%i3,	%i4,	%o1
	sra	%l5,	%l1,	%g3
	sll	%i1,	0x16,	%o2
	flush	%l7 + 0x68
	andncc	%g6,	%o0,	%i2
	fbue,a	%fcc0,	loop_479
	edge16l	%g1,	%i7,	%g7
	xorcc	%o3,	0x086A,	%l4
	edge32	%i5,	%g5,	%i6
loop_479:
	movrgz	%i0,	0x042,	%g2
	edge32n	%g4,	%o6,	%o4
	movvs	%xcc,	%l2,	%l0
	te	%xcc,	0x5
	andcc	%o5,	%l6,	%l3
	fbo	%fcc0,	loop_480
	srax	%i3,	%o7,	%i4
	fandnot2	%f14,	%f4,	%f18
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_480:
	movge	%xcc,	%o1,	%l1
	fand	%f24,	%f0,	%f16
	fmovrsgz	%g3,	%f17,	%f8
	tvc	%icc,	0x3
	membar	0x04
	set	0x62, %g1
	ldsha	[%l7 + %g1] 0x89,	%i1
	movcc	%icc,	%l5,	%g6
	fmovsle	%xcc,	%f13,	%f29
	umul	%o2,	0x1E74,	%i2
	brlez,a	%o0,	loop_481
	for	%f10,	%f20,	%f8
	fba	%fcc3,	loop_482
	array16	%g1,	%i7,	%g7
loop_481:
	nop
	wr	%g0,	0x2f,	%asi
	stwa	%l4,	[%l7 + 0x30] %asi
	membar	#Sync
loop_482:
	tge	%icc,	0x2
	brlz	%i5,	loop_483
	orn	%g5,	%o3,	%i6
	swap	[%l7 + 0x18],	%g2
	prefetch	[%l7 + 0x38],	 0x2
loop_483:
	ta	%xcc,	0x7
	brz,a	%g4,	loop_484
	fbe	%fcc2,	loop_485
	orncc	%o6,	%o4,	%i0
	edge16	%l2,	%l0,	%o5
loop_484:
	lduh	[%l7 + 0x48],	%l6
loop_485:
	fbne,a	%fcc2,	loop_486
	and	%i3,	0x0D8E,	%o7
	ld	[%l7 + 0x6C],	%f30
	brgz	%l3,	loop_487
loop_486:
	fmovdvs	%xcc,	%f29,	%f6
	mulx	%o1,	0x173D,	%l1
	xnorcc	%i4,	%g3,	%i1
loop_487:
	edge32n	%g6,	%l5,	%i2
	nop
	setx	0x94F4E523307833BA,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldx	[%l7 + 0x28],	%fsr
	alignaddr	%o2,	%g1,	%o0
	sll	%g7,	0x00,	%l4
	nop
	setx	0x03860E96,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f25
	setx	0x95CB15BE,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f8
	fsubs	%f8,	%f25,	%f29
	udivx	%i5,	0x0459,	%i7
	tsubcc	%g5,	%i6,	%o3
	wr	%g0,	0x89,	%asi
	sta	%f16,	[%l7 + 0x7C] %asi
	ble	loop_488
	lduw	[%l7 + 0x18],	%g4
	set	0x60, %o7
	ldda	[%l7 + %o7] 0x14,	%o6
loop_488:
	array16	%o4,	%i0,	%l2
	orncc	%l0,	0x02EC,	%o5
	bcc,a	%icc,	loop_489
	edge8	%l6,	%i3,	%o7
	sll	%g2,	0x12,	%l3
	edge8ln	%l1,	%i4,	%g3
loop_489:
	xnorcc	%o1,	0x1115,	%i1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsge	%icc,	%f30,	%f31
	edge16	%l5,	%i2,	%g6
	movge	%xcc,	%g1,	%o2
	edge8ln	%o0,	%g7,	%l4
	edge8ln	%i5,	%i7,	%i6
	tge	%icc,	0x4
	brlz	%g5,	loop_490
	movneg	%xcc,	%g4,	%o3
	nop
	setx	loop_491,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	tsubcc	%o6,	%o4,	%i0
loop_490:
	fpmerge	%f29,	%f1,	%f2
	call	loop_492
loop_491:
	bcs,pn	%icc,	loop_493
	tpos	%xcc,	0x6
	fsrc1s	%f29,	%f10
loop_492:
	edge8n	%l0,	%l2,	%l6
loop_493:
	fbe	%fcc2,	loop_494
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	fitos	%f9,	%f10
	fstod	%f10,	%f18
	add	%o5,	0x0EF4,	%i3
loop_494:
	fpadd32	%f6,	%f6,	%f12
	mulx	%g2,	%l3,	%l1
	edge8ln	%i4,	%g3,	%o1
	fornot2	%f2,	%f6,	%f8
	ta	%xcc,	0x2
	stw	%i1,	[%l7 + 0x10]
	fbule,a	%fcc0,	loop_495
	fpsub32	%f4,	%f20,	%f6
	set	0x20, %l2
	ldxa	[%g0 + %l2] 0x58,	%o7
loop_495:
	te	%xcc,	0x4
	fpmerge	%f31,	%f31,	%f8
	fxnor	%f26,	%f28,	%f10
	fmovsn	%xcc,	%f4,	%f24
	mova	%xcc,	%i2,	%g6
	tvs	%xcc,	0x4
	movn	%icc,	%g1,	%o2
	nop
	setx	0xE721BC04,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f10
	setx	0xEE1525BC,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f14
	fdivs	%f14,	%f10,	%f15
	fbl,a	%fcc3,	loop_496
	fmovsvs	%xcc,	%f11,	%f9
	brz	%l5,	loop_497
	lduh	[%l7 + 0x28],	%g7
loop_496:
	fnot2s	%f13,	%f30
	fnands	%f7,	%f16,	%f24
loop_497:
	tge	%icc,	0x3
	nop
	setx	0x72BCFA5B,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f28
	fsqrts	%f28,	%f12
	tneg	%icc,	0x1
	nop
	fitod	%f4,	%f2
	fdtoi	%f2,	%f28
	fsrc2s	%f18,	%f7
	tcc	%icc,	0x6
	orncc	%l4,	%o0,	%i5
	nop
	setx	0xF5720FBFC40C3BBF,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0x524CF79CDDBF6176,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fsubd	%f0,	%f26,	%f0
	or	%i7,	0x0F3C,	%i6
	smulcc	%g5,	0x1853,	%o3
	fcmple32	%f22,	%f16,	%g4
	fxnors	%f26,	%f16,	%f29
	udiv	%o6,	0x0E9C,	%o4
	fmovrdlz	%l0,	%f28,	%f0
	nop
	setx	0x908152724ABE9EEF,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0x6FBEC9638CC68798,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	fsubd	%f4,	%f2,	%f10
	sra	%l2,	%i0,	%o5
	orcc	%i3,	%g2,	%l6
	fsrc2s	%f24,	%f28
	fnot2s	%f1,	%f2
	popc	%l1,	%l3
	fxnors	%f4,	%f27,	%f9
	fbul	%fcc3,	loop_498
	umul	%i4,	0x0468,	%g3
	stbar
	fbue	%fcc2,	loop_499
loop_498:
	bneg,a	loop_500
	movge	%xcc,	%i1,	%o1
	tcc	%xcc,	0x1
loop_499:
	bleu,pn	%xcc,	loop_501
loop_500:
	tle	%icc,	0x3
	edge16n	%i2,	%o7,	%g1
	move	%xcc,	%o2,	%l5
loop_501:
	sdivcc	%g6,	0x0452,	%l4
	movge	%xcc,	%o0,	%i5
	xnorcc	%i7,	0x09E9,	%i6
	and	%g5,	0x1ED8,	%g7
	xnorcc	%o3,	%o6,	%g4
	tn	%icc,	0x4
	std	%f26,	[%l7 + 0x20]
	orn	%l0,	%l2,	%o4
	array32	%i0,	%i3,	%g2
	fmovdcc	%icc,	%f16,	%f30
	bshuffle	%f8,	%f18,	%f28
	stw	%o5,	[%l7 + 0x68]
	tsubcctv	%l1,	%l6,	%i4
	xorcc	%l3,	%g3,	%o1
	edge16n	%i2,	%i1,	%o7
	edge16n	%o2,	%g1,	%g6
	stbar
	fnand	%f12,	%f14,	%f0
	fmovdcs	%xcc,	%f5,	%f26
	set	0x10, %o0
	lduwa	[%l7 + %o0] 0x18,	%l5
	array8	%o0,	%i5,	%l4
	fmovscs	%icc,	%f14,	%f31
	sub	%i7,	%g5,	%i6
	edge16l	%g7,	%o6,	%g4
	fcmpgt32	%f18,	%f2,	%o3
	fzeros	%f25
	edge8ln	%l2,	%o4,	%l0
	lduh	[%l7 + 0x0C],	%i0
	xnorcc	%i3,	%o5,	%g2
	ldx	[%l7 + 0x58],	%l6
	fbue,a	%fcc3,	loop_502
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fzero	%f22
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_502:
	array8	%i4,	%l3,	%g3
	movrgz	%o1,	0x170,	%l1
	movrgz	%i2,	%i1,	%o7
	movvc	%xcc,	%g1,	%g6
	fmovdne	%icc,	%f16,	%f29
	xorcc	%o2,	%o0,	%i5
	movcc	%icc,	%l5,	%l4
	brlz,a	%i7,	loop_503
	edge32n	%g5,	%g7,	%i6
	fnor	%f24,	%f30,	%f6
	move	%xcc,	%o6,	%o3
loop_503:
	fmovsge	%xcc,	%f10,	%f25
	edge8	%l2,	%o4,	%g4
	ldub	[%l7 + 0x2B],	%l0
	ldx	[%l7 + 0x08],	%i0
	wr	%g0,	0x80,	%asi
	stba	%i3,	[%l7 + 0x34] %asi
	stbar
	fmovrslez	%o5,	%f27,	%f5
	tg	%xcc,	0x2
	movrlz	%l6,	%i4,	%g2
	edge16l	%g3,	%l3,	%o1
	tge	%icc,	0x2
	bpos,a,pn	%xcc,	loop_504
	popc	%l1,	%i2
	alignaddrl	%o7,	%i1,	%g6
	movpos	%icc,	%g1,	%o0
loop_504:
	addcc	%o2,	%i5,	%l4
	fsrc1s	%f11,	%f22
	fbl	%fcc1,	loop_505
	movrlez	%l5,	%g5,	%i7
	movrne	%g7,	0x21E,	%o6
	nop
	setx	0xCCA0443488FE3953,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0x67015E3F70B4D72A,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	fsubd	%f24,	%f26,	%f8
loop_505:
	xorcc	%i6,	0x0F4B,	%o3
	fmovde	%xcc,	%f20,	%f1
	sra	%l2,	0x1A,	%g4
	addc	%l0,	0x0556,	%i0
	tpos	%xcc,	0x6
	edge16n	%o4,	%o5,	%i3
	fble	%fcc2,	loop_506
	array16	%l6,	%g2,	%i4
	fmovdneg	%xcc,	%f9,	%f29
	fpack32	%f26,	%f30,	%f12
loop_506:
	brlz,a	%g3,	loop_507
	movcs	%icc,	%l3,	%l1
	lduw	[%l7 + 0x34],	%i2
	movre	%o7,	%i1,	%o1
loop_507:
	fmovse	%icc,	%f16,	%f27
	tsubcc	%g6,	0x0AF8,	%g1
	subcc	%o2,	%o0,	%l4
	nop
	setx	0x9F144F98E4844068,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0x842C6D6372126859,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	fdivd	%f28,	%f30,	%f28
	movg	%icc,	%i5,	%g5
	fba,a	%fcc0,	loop_508
	fnot1	%f24,	%f8
	andcc	%i7,	0x1EAA,	%g7
	tgu	%icc,	0x2
loop_508:
	nop
	set	0x7C, %i7
	swapa	[%l7 + %i7] 0x88,	%l5
	fmuld8sux16	%f1,	%f18,	%f14
	wr	%g0,	0x10,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	std	%f14,	[%l7 + 0x58]
	fmovdvc	%icc,	%f11,	%f13
	fornot1s	%f0,	%f19,	%f24
	std	%f10,	[%l7 + 0x08]
	sir	0x01A6
	mova	%xcc,	%o6,	%i6
	fbule	%fcc1,	loop_509
	bl,a	%icc,	loop_510
	fxors	%f28,	%f17,	%f27
	bvs,pt	%xcc,	loop_511
loop_509:
	fbge,a	%fcc3,	loop_512
loop_510:
	array32	%o3,	%g4,	%l0
	fexpand	%f15,	%f22
loop_511:
	movle	%xcc,	%i0,	%l2
loop_512:
	edge32	%o5,	%o4,	%l6
	bpos,a,pt	%xcc,	loop_513
	fbug,a	%fcc0,	loop_514
	edge8n	%g2,	%i3,	%i4
	addcc	%g3,	%l3,	%l1
loop_513:
	bgu	loop_515
loop_514:
	edge16	%o7,	%i2,	%i1
	set	0x68, %g2
	lduba	[%l7 + %g2] 0x04,	%g6
loop_515:
	mulx	%o1,	0x1793,	%o2
	wr	%g0,	0x89,	%asi
	ldsha	[%l7 + 0x36] %asi,	%o0
	fmovrdlez	%l4,	%f6,	%f28
	fone	%f26
	andncc	%g1,	%i5,	%i7
	xor	%g5,	%l5,	%g7
	orn	%i6,	%o6,	%g4
	wr	%g0,	0x89,	%asi
	stba	%l0,	[%l7 + 0x6A] %asi
	brgez	%o3,	loop_516
	alignaddrl	%l2,	%i0,	%o5
	movrlez	%l6,	%o4,	%g2
	movvs	%icc,	%i3,	%g3
loop_516:
	bvs,pn	%xcc,	loop_517
	bne	%xcc,	loop_518
	fmul8sux16	%f20,	%f10,	%f2
	mova	%icc,	%l3,	%i4
loop_517:
	fmovsn	%icc,	%f29,	%f30
loop_518:
	std	%f14,	[%l7 + 0x30]
	add	%o7,	%l1,	%i2
	nop
	setx	0x3DDCB3864F9B5104,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0xA21228A76C469BEA,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	fdivd	%f24,	%f14,	%f6
	brnz,a	%g6,	loop_519
	brz	%o1,	loop_520
	fpackfix	%f28,	%f25
	subcc	%i1,	%o2,	%l4
loop_519:
	nop
	wr	%g0,	0x18,	%asi
	ldda	[%l7 + 0x10] %asi,	%o0
loop_520:
	fbn	%fcc3,	loop_521
	ba,a,pn	%icc,	loop_522
	fmovsneg	%icc,	%f17,	%f24
	wr	%g0,	0xe3,	%asi
	stwa	%i5,	[%l7 + 0x74] %asi
	membar	#Sync
loop_521:
	subc	%i7,	0x0C65,	%g5
loop_522:
	srl	%g1,	0x0B,	%l5
	wr	%g0,	0x18,	%asi
	lda	[%l7 + 0x70] %asi,	%f26
	fpadd16	%f8,	%f20,	%f20
	movl	%icc,	%i6,	%g7
	fmul8ulx16	%f30,	%f24,	%f28
	sll	%o6,	%l0,	%g4
	brgz,a	%o3,	loop_523
	movcs	%xcc,	%l2,	%i0
	taddcc	%o5,	0x0FFD,	%o4
	fpadd32	%f10,	%f12,	%f14
loop_523:
	tle	%icc,	0x1
	subc	%l6,	0x0F58,	%g2
	sll	%i3,	%g3,	%i4
	tvc	%xcc,	0x3
	movleu	%xcc,	%l3,	%l1
	smulcc	%i2,	0x0613,	%o7
	movcc	%xcc,	%o1,	%g6
	sethi	0x0F7D,	%o2
	fpack32	%f4,	%f0,	%f4
	orcc	%l4,	%o0,	%i5
	tvc	%xcc,	0x4
	xor	%i1,	%g5,	%g1
	fmovrdne	%i7,	%f28,	%f2
	fpsub32s	%f17,	%f6,	%f5
	fmovrsgez	%l5,	%f31,	%f2
	ldsb	[%l7 + 0x7F],	%g7
	smul	%i6,	0x1F3B,	%o6
	fbule	%fcc1,	loop_524
	stw	%g4,	[%l7 + 0x08]
	tne	%xcc,	0x0
	fmovspos	%icc,	%f9,	%f18
loop_524:
	nop
	fitos	%f5,	%f4
	fstox	%f4,	%f14
	nop
	set	0x68, %l5
	ldsb	[%l7 + %l5],	%o3
	xnor	%l2,	%i0,	%o5
	fbule,a	%fcc0,	loop_525
	andcc	%o4,	%l6,	%l0
	nop
	setx loop_526, %l0, %l1
	jmpl %l1, %g2
	movvs	%icc,	%i3,	%g3
loop_525:
	andn	%i4,	%l1,	%i2
	subc	%o7,	%o1,	%l3
loop_526:
	fpsub32s	%f23,	%f23,	%f2
	fmovsne	%icc,	%f16,	%f6
	nop
	setx	0x03751185306D08ED,	%l0,	%l6
	stx	%l6,	[%l7 + 0x30]
	ldx	[%l7 + 0x30],	%fsr
	edge32n	%o2,	%l4,	%o0
	bcs,a,pn	%xcc,	loop_527
	alignaddr	%i5,	%g6,	%g5
	fbu	%fcc3,	loop_528
	nop
	setx loop_529, %l0, %l1
	jmpl %l1, %i1
loop_527:
	movleu	%icc,	%g1,	%l5
	andcc	%i7,	0x037C,	%i6
loop_528:
	sdiv	%g7,	0x1E18,	%o6
loop_529:
	bg	%icc,	loop_530
	fbu,a	%fcc1,	loop_531
	movvs	%xcc,	%o3,	%g4
	ld	[%l7 + 0x5C],	%f20
loop_530:
	brlez	%i0,	loop_532
loop_531:
	fandnot1	%f18,	%f4,	%f26
	nop
	set	0x0C, %o2
	sth	%l2,	[%l7 + %o2]
	fbg,a	%fcc1,	loop_533
loop_532:
	mova	%icc,	%o5,	%l6
	fpsub32s	%f18,	%f11,	%f21
	tl	%icc,	0x1
loop_533:
	srl	%o4,	%g2,	%l0
	sdivx	%i3,	0x01A2,	%g3
	set	0x4C, %o1
	stha	%l1,	[%l7 + %o1] 0x27
	membar	#Sync
	sdivx	%i4,	0x1C60,	%o7
	tne	%icc,	0x1
	brlez	%i2,	loop_534
	nop
	setx	0xC69BCCF8,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f31
	setx	0x3B3F4830,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f3
	fdivs	%f3,	%f31,	%f14
	movpos	%icc,	%o1,	%l3
	st	%f9,	[%l7 + 0x20]
loop_534:
	fmovdcc	%icc,	%f4,	%f10
	movrgez	%l4,	0x212,	%o0
	fbule,a	%fcc3,	loop_535
	tsubcctv	%i5,	%o2,	%g6
	fxnor	%f2,	%f0,	%f4
	srlx	%i1,	%g5,	%g1
loop_535:
	ble,a,pt	%icc,	loop_536
	flush	%l7 + 0x20
	tle	%xcc,	0x4
	subc	%i7,	%l5,	%g7
loop_536:
	nop
	fitos	%f6,	%f5
	fstox	%f5,	%f2
	fxtos	%f2,	%f4
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
	andncc	%o6,	%i6,	%g4
	subcc	%i0,	%o3,	%l2
	xnor	%l6,	0x0264,	%o5
loop_537:
	sir	0x0A6E
	subcc	%g2,	%o4,	%l0
	wr	%g0,	0x04,	%asi
	lda	[%l7 + 0x2C] %asi,	%f0
	andn	%g3,	%l1,	%i4
	edge16ln	%i3,	%o7,	%i2
	movcs	%icc,	%l3,	%o1
	wr	%g0,	0x89,	%asi
	sta	%f16,	[%l7 + 0x7C] %asi
	add	%o0,	0x0A37,	%l4
	movle	%xcc,	%o2,	%i5
	brlz	%i1,	loop_538
	sub	%g6,	%g5,	%g1
	ldx	[%l7 + 0x18],	%l5
	fpadd32	%f0,	%f2,	%f2
loop_538:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovda	%xcc,	%f15,	%f8
	fblg,a	%fcc3,	loop_539
	sra	%i7,	0x00,	%o6
	orncc	%g7,	%g4,	%i6
	tcc	%icc,	0x1
loop_539:
	movvc	%icc,	%o3,	%i0
	taddcctv	%l6,	%l2,	%g2
	fmovrdgez	%o4,	%f20,	%f14
	mulscc	%o5,	%l0,	%l1
	add	%g3,	%i3,	%o7
	fbul,a	%fcc1,	loop_540
	edge8n	%i4,	%l3,	%i2
	fbue,a	%fcc3,	loop_541
	xnor	%o1,	%l4,	%o2
loop_540:
	bge	loop_542
	udivx	%i5,	0x156C,	%o0
loop_541:
	fbuge,a	%fcc3,	loop_543
	bpos,pn	%icc,	loop_544
loop_542:
	umulcc	%g6,	%g5,	%g1
	movcs	%xcc,	%i1,	%i7
loop_543:
	fba,a	%fcc3,	loop_545
loop_544:
	sir	0x11F2
	sethi	0x13DB,	%o6
	set	0x6C, %o3
	lduwa	[%l7 + %o3] 0x89,	%g7
loop_545:
	st	%f9,	[%l7 + 0x64]
	nop
	fitod	%f17,	%f30
	tneg	%icc,	0x7
	movvc	%icc,	%l5,	%i6
	andcc	%g4,	%o3,	%i0
	nop
	setx	0x77EA5DCB8040F50C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x48]
	ldx	[%l7 + 0x48],	%fsr
	fbuge,a	%fcc2,	loop_546
	taddcc	%l2,	0x1338,	%l6
	movpos	%icc,	%o4,	%g2
	edge16ln	%l0,	%l1,	%g3
loop_546:
	movgu	%icc,	%i3,	%o7
	fmovscc	%icc,	%f19,	%f19
	fnegs	%f11,	%f14
	movgu	%xcc,	%o5,	%l3
	fmovrse	%i4,	%f26,	%f31
	movrlz	%o1,	%l4,	%o2
	andcc	%i5,	0x05AC,	%i2
	swap	[%l7 + 0x60],	%o0
	edge32	%g5,	%g6,	%g1
	bg,a,pt	%xcc,	loop_547
	orn	%i7,	%i1,	%g7
	tsubcctv	%o6,	0x0237,	%l5
	fmul8x16al	%f25,	%f3,	%f14
loop_547:
	sdiv	%i6,	0x1937,	%o3
	movrne	%g4,	%l2,	%i0
	bg	loop_548
	bvc	%xcc,	loop_549
	edge16l	%l6,	%g2,	%o4
	fnegd	%f16,	%f16
loop_548:
	movne	%xcc,	%l1,	%l0
loop_549:
	smulcc	%i3,	%o7,	%g3
	edge8n	%o5,	%i4,	%l3
	membar	0x5C
	tn	%icc,	0x4
	wr	%g0,	0x0c,	%asi
	lda	[%l7 + 0x6C] %asi,	%f18
	srl	%l4,	%o2,	%o1
	addccc	%i5,	0x1B2A,	%o0
	fmovrdgez	%i2,	%f28,	%f14
	movvc	%icc,	%g6,	%g5
	mova	%xcc,	%i7,	%i1
	movre	%g7,	0x05F,	%o6
	edge8ln	%l5,	%g1,	%i6
	movneg	%xcc,	%o3,	%l2
	fba,a	%fcc2,	loop_550
	movrne	%i0,	0x008,	%g4
	fornot2s	%f0,	%f17,	%f15
	set	0x20, %i3
	prefetcha	[%l7 + %i3] 0x18,	 0x1
loop_550:
	fmovdn	%xcc,	%f15,	%f27
	srlx	%l6,	0x04,	%o4
	sll	%l1,	0x08,	%i3
	bg,a	%icc,	loop_551
	edge32l	%o7,	%g3,	%l0
	movcc	%icc,	%i4,	%o5
	alignaddr	%l4,	%l3,	%o1
loop_551:
	nop
	fitod	%f10,	%f30
	fdtos	%f30,	%f11
	edge32n	%i5,	%o2,	%o0
	movrgez	%g6,	%g5,	%i7
	fnot2s	%f11,	%f18
	edge32ln	%i1,	%i2,	%o6
	set	0x40, %g7
	prefetcha	[%l7 + %g7] 0x88,	 0x3
	smul	%g1,	0x0D10,	%l5
	set	0x40, %i1
	stda	%f16,	[%l7 + %i1] 0x1f
	membar	#Sync
	fba	%fcc0,	loop_552
	fnot1s	%f10,	%f11
	swap	[%l7 + 0x48],	%i6
	stb	%o3,	[%l7 + 0x0D]
loop_552:
	subcc	%i0,	0x0D07,	%g4
	add	%l2,	%g2,	%l6
	wr	%g0,	0x89,	%asi
	ldswa	[%l7 + 0x7C] %asi,	%o4
	fxors	%f15,	%f17,	%f14
	fmovdvc	%icc,	%f25,	%f10
	nop
	setx	loop_553,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fmovsvc	%icc,	%f3,	%f3
	tn	%xcc,	0x4
	andcc	%l1,	%o7,	%g3
loop_553:
	edge32	%l0,	%i3,	%o5
	edge32	%l4,	%i4,	%l3
	tg	%xcc,	0x4
	edge32l	%o1,	%o2,	%o0
	movre	%g6,	%g5,	%i5
	set	0x40, %o4
	stda	%f0,	[%l7 + %o4] 0x11
	movn	%icc,	%i1,	%i7
	mulscc	%i2,	0x0D2C,	%o6
	taddcc	%g7,	0x0DC0,	%g1
	fnands	%f0,	%f4,	%f15
	fmovsvc	%xcc,	%f21,	%f5
	set	0x54, %l6
	stwa	%i6,	[%l7 + %l6] 0xe2
	membar	#Sync
	array16	%o3,	%i0,	%g4
	tneg	%icc,	0x0
	bcs,a,pn	%xcc,	loop_554
	bneg,pt	%xcc,	loop_555
	mulx	%l2,	0x0764,	%g2
	edge32	%l5,	%l6,	%o4
loop_554:
	nop
	setx loop_556, %l0, %l1
	jmpl %l1, %o7
loop_555:
	addccc	%g3,	0x0351,	%l1
	fnor	%f20,	%f24,	%f14
	membar	0x5D
loop_556:
	nop
	fitod	%f9,	%f26
	fmovdle	%xcc,	%f16,	%f16
	fnot1s	%f12,	%f6
	subcc	%l0,	%o5,	%l4
	set	0x18, %l4
	prefetcha	[%l7 + %l4] 0x04,	 0x3
	array16	%l3,	%o1,	%o2
	xor	%o0,	0x0E9C,	%g6
	stb	%g5,	[%l7 + 0x5D]
	fmovrdne	%i3,	%f4,	%f30
	bgu,a	%icc,	loop_557
	tcs	%xcc,	0x2
	ldd	[%l7 + 0x28],	%i0
	fnegd	%f28,	%f0
loop_557:
	fmovrsgz	%i7,	%f10,	%f18
	edge16ln	%i5,	%o6,	%g7
	brz,a	%g1,	loop_558
	bl	loop_559
	edge8n	%i2,	%o3,	%i6
	alignaddrl	%i0,	%l2,	%g2
loop_558:
	subc	%l5,	%l6,	%g4
loop_559:
	nop
	set	0x47, %l0
	stba	%o4,	[%l7 + %l0] 0xeb
	membar	#Sync
	nop
	setx	loop_560,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movcc	%xcc,	%o7,	%g3
	nop
	fitod	%f6,	%f10
	fdtox	%f10,	%f30
	wr	%g0,	0x88,	%asi
	lduwa	[%l7 + 0x48] %asi,	%l0
loop_560:
	mulscc	%l1,	%l4,	%i4
	mulx	%l3,	0x16C2,	%o1
	edge8l	%o5,	%o0,	%o2
	movre	%g5,	%i3,	%g6
	movcc	%xcc,	%i7,	%i1
	movle	%xcc,	%o6,	%g7
	movcc	%xcc,	%g1,	%i2
	fzero	%f20
	fbo	%fcc1,	loop_561
	fxor	%f24,	%f16,	%f6
	and	%o3,	%i6,	%i5
	ldub	[%l7 + 0x3F],	%i0
loop_561:
	edge16n	%l2,	%g2,	%l6
	fmul8x16au	%f31,	%f11,	%f30
	subccc	%l5,	%g4,	%o7
	fbne,a	%fcc2,	loop_562
	sra	%o4,	%l0,	%g3
	tl	%xcc,	0x7
	taddcc	%l1,	%l4,	%i4
loop_562:
	mova	%icc,	%o1,	%l3
	smul	%o0,	%o2,	%g5
	edge32l	%i3,	%o5,	%i7
	smul	%i1,	0x1660,	%o6
	movrgez	%g7,	0x01F,	%g6
	tneg	%icc,	0x3
	tvs	%xcc,	0x1
	fmovscc	%icc,	%f10,	%f22
	set	0x74, %i2
	lda	[%l7 + %i2] 0x18,	%f28
	fba	%fcc3,	loop_563
	bneg	loop_564
	fmul8x16au	%f18,	%f15,	%f20
	taddcctv	%g1,	%i2,	%o3
loop_563:
	fmuld8sux16	%f0,	%f5,	%f6
loop_564:
	fpsub16	%f24,	%f6,	%f26
	fmul8ulx16	%f28,	%f14,	%f18
	fmovrdne	%i5,	%f4,	%f20
	fcmpeq16	%f24,	%f16,	%i6
	fnors	%f30,	%f29,	%f31
	move	%xcc,	%l2,	%i0
	array16	%g2,	%l5,	%g4
	fmovrdgez	%o7,	%f24,	%f24
	alignaddrl	%l6,	%l0,	%g3
	fmovde	%icc,	%f1,	%f8
	tpos	%xcc,	0x2
	fxnor	%f18,	%f18,	%f18
	nop
	setx	0xEB1EC3E0A559093A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0xA9B71D6F4B8C46E2,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	fsubd	%f4,	%f26,	%f12
	or	%l1,	%l4,	%o4
	brnz	%o1,	loop_565
	mova	%icc,	%l3,	%o0
	sll	%o2,	%i4,	%g5
	andcc	%i3,	0x0783,	%i7
loop_565:
	swap	[%l7 + 0x28],	%i1
	bn	%xcc,	loop_566
	movrne	%o5,	0x212,	%g7
	movg	%xcc,	%g6,	%o6
	and	%g1,	%i2,	%i5
loop_566:
	movne	%xcc,	%o3,	%l2
	ldd	[%l7 + 0x58],	%i0
	fpsub32	%f0,	%f26,	%f14
	umul	%g2,	0x0F0A,	%i6
	call	loop_567
	udiv	%l5,	0x124A,	%o7
	edge16n	%l6,	%g4,	%l0
	fpsub32	%f12,	%f22,	%f0
loop_567:
	bcs,a,pn	%icc,	loop_568
	edge32n	%g3,	%l1,	%o4
	wr	%g0,	0x81,	%asi
	swapa	[%l7 + 0x78] %asi,	%l4
loop_568:
	tsubcc	%l3,	0x051B,	%o1
	fbne,a	%fcc3,	loop_569
	fnot1s	%f1,	%f13
	flush	%l7 + 0x54
	lduh	[%l7 + 0x76],	%o2
loop_569:
	edge8	%o0,	%g5,	%i4
	tcc	%icc,	0x0
	movn	%icc,	%i3,	%i1
	udivcc	%o5,	0x1D05,	%i7
	fnor	%f14,	%f14,	%f18
	and	%g7,	%o6,	%g1
	sll	%i2,	0x10,	%i5
	movn	%icc,	%g6,	%o3
	movre	%l2,	%g2,	%i0
	fnegs	%f6,	%f12
	fmovsvc	%icc,	%f20,	%f16
	nop
	setx	0x522946B0F045CD82,	%l0,	%l6
	stx	%l6,	[%l7 + 0x50]
	ldx	[%l7 + 0x50],	%fsr
	wr	%g0,	0x88,	%asi
	stha	%i6,	[%l7 + 0x60] %asi
	stx	%l5,	[%l7 + 0x30]
	xor	%o7,	0x0155,	%l6
	bpos,a,pt	%xcc,	loop_570
	addcc	%l0,	%g3,	%g4
	bpos,a,pt	%icc,	loop_571
	tcc	%xcc,	0x1
loop_570:
	fbne,a	%fcc3,	loop_572
	taddcctv	%o4,	%l4,	%l3
loop_571:
	lduh	[%l7 + 0x18],	%o1
	std	%f18,	[%l7 + 0x40]
loop_572:
	fbg	%fcc0,	loop_573
	nop
	setx	0x51704048,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f30
	setx	0xC59F4B7A,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f11
	fsubs	%f11,	%f30,	%f8
	set	0x64, %o6
	lduha	[%l7 + %o6] 0x19,	%l1
loop_573:
	smulcc	%o0,	0x038B,	%o2
	add	%g5,	%i4,	%i1
	edge32	%i3,	%i7,	%o5
	tvc	%icc,	0x0
	fba,a	%fcc0,	loop_574
	mulx	%o6,	0x1E52,	%g7
	andncc	%i2,	%g1,	%g6
	edge32n	%o3,	%l2,	%i5
loop_574:
	ld	[%l7 + 0x74],	%f3
	bl	loop_575
	bshuffle	%f6,	%f8,	%f14
	set	0x39, %g6
	ldstuba	[%l7 + %g6] 0x80,	%g2
loop_575:
	taddcc	%i6,	0x1C05,	%i0
	udivx	%l5,	0x0BB2,	%o7
	fcmpeq32	%f8,	%f20,	%l6
	xnor	%g3,	%g4,	%l0
	edge8l	%o4,	%l3,	%o1
	fnands	%f9,	%f1,	%f9
	fmul8x16al	%f5,	%f26,	%f12
	sdivcc	%l1,	0x053D,	%l4
	for	%f18,	%f24,	%f20
	addcc	%o2,	0x08FA,	%g5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movneg	%xcc,	%o0,	%i1
	tvs	%xcc,	0x0
	fmovdcs	%icc,	%f29,	%f27
	srl	%i3,	%i4,	%o5
	fmovsa	%icc,	%f4,	%f12
	nop
	fitos	%f28,	%f8
	tle	%icc,	0x6
	sir	0x13FF
	ldub	[%l7 + 0x6B],	%i7
	fba,a	%fcc1,	loop_576
	fbue	%fcc2,	loop_577
	addccc	%g7,	0x1096,	%o6
	ldub	[%l7 + 0x50],	%g1
loop_576:
	srlx	%i2,	0x11,	%g6
loop_577:
	fornot2s	%f29,	%f16,	%f9
	bcs,a,pn	%icc,	loop_578
	movrlz	%l2,	0x102,	%i5
	add	%l7,	0x38,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%o3,	%g2
loop_578:
	nop
	set	0x0B, %g4
	ldub	[%l7 + %g4],	%i6
	fnors	%f31,	%f30,	%f22
	tl	%xcc,	0x0
	bge,pt	%xcc,	loop_579
	srlx	%i0,	0x06,	%o7
	membar	0x79
	add	%l7,	0x3C,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] %asi,	%l5,	%l6
loop_579:
	sdivx	%g3,	0x10AB,	%g4
	ldd	[%l7 + 0x70],	%f2
	udivcc	%o4,	0x0AC3,	%l3
	fsrc2s	%f12,	%f29
	edge16l	%l0,	%o1,	%l1
	fcmple16	%f8,	%f24,	%o2
	fbo,a	%fcc0,	loop_580
	edge8	%g5,	%o0,	%l4
	set	0x78, %o5
	stxa	%i1,	[%l7 + %o5] 0x89
loop_580:
	fmovdge	%xcc,	%f27,	%f14
	fpackfix	%f24,	%f3
	bge	loop_581
	nop
	fitod	%f0,	%f12
	fdtox	%f12,	%f22
	fxtod	%f22,	%f14
	array32	%i4,	%i3,	%i7
	sra	%o5,	0x1E,	%o6
loop_581:
	fnot2s	%f18,	%f8
	array32	%g1,	%g7,	%i2
	addccc	%g6,	0x1907,	%l2
	nop
	setx	0xB9F03B1A,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f22
	setx	0x802D0980,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f20
	fmuls	%f20,	%f22,	%f29
	tl	%xcc,	0x6
	ba,pn	%xcc,	loop_582
	tge	%xcc,	0x2
	xor	%o3,	0x0600,	%i5
	fmovde	%icc,	%f21,	%f1
loop_582:
	tvc	%icc,	0x6
	fornot2	%f26,	%f26,	%f18
	nop
	setx	0x55E40284443CF9D7,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0x904259E96E7923BA,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	fsubd	%f8,	%f12,	%f6
	set	0x3A, %i0
	lduba	[%l7 + %i0] 0x15,	%i6
	udivcc	%g2,	0x1FB5,	%o7
	fmovsa	%icc,	%f18,	%f28
	wr	%g0,	0x89,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	tcc	%icc,	0x1
	orn	%i0,	0x18EB,	%l6
	bne,pn	%icc,	loop_583
	nop
	fitos	%f31,	%f19
	movle	%icc,	%l5,	%g3
	tpos	%xcc,	0x3
loop_583:
	fpsub32s	%f31,	%f4,	%f17
	fxor	%f14,	%f16,	%f6
	fsrc2s	%f10,	%f21
	fxnors	%f10,	%f25,	%f18
	move	%icc,	%g4,	%l3
	fpack16	%f4,	%f2
	fpsub16s	%f25,	%f12,	%f10
	add	%o4,	0x1238,	%l0
	taddcc	%o1,	%l1,	%g5
	or	%o2,	0x168A,	%o0
	smul	%i1,	%i4,	%l4
	movne	%xcc,	%i7,	%i3
	te	%xcc,	0x3
	wr	%g0,	0x21,	%asi
	stxa	%o6,	[%g0 + 0x10] %asi
	andcc	%g1,	%o5,	%g7
	be,a,pn	%xcc,	loop_584
	xnorcc	%g6,	0x1CB9,	%l2
	movvs	%xcc,	%o3,	%i2
	addccc	%i5,	%i6,	%o7
loop_584:
	brlz,a	%i0,	loop_585
	tl	%xcc,	0x6
	udiv	%g2,	0x00E5,	%l6
	fxor	%f26,	%f22,	%f24
loop_585:
	movcs	%xcc,	%l5,	%g3
	fsrc1	%f30,	%f30
	fbul	%fcc3,	loop_586
	fbuge,a	%fcc1,	loop_587
	movrgez	%l3,	%g4,	%o4
	fxnor	%f0,	%f22,	%f8
loop_586:
	edge8	%o1,	%l0,	%g5
loop_587:
	movpos	%icc,	%l1,	%o0
	srax	%o2,	0x1F,	%i4
	ldd	[%l7 + 0x50],	%i0
	srax	%i7,	0x0F,	%i3
	umul	%l4,	0x1696,	%g1
	edge16ln	%o5,	%g7,	%g6
	umul	%l2,	0x05FD,	%o3
	brgez,a	%i2,	loop_588
	umulcc	%i5,	0x0D09,	%i6
	xnor	%o6,	%o7,	%i0
	subc	%g2,	%l5,	%l6
loop_588:
	fpadd32	%f24,	%f8,	%f18
	udivcc	%g3,	0x10AF,	%g4
	subcc	%o4,	0x1DBD,	%l3
	fmovsl	%xcc,	%f12,	%f31
	ta	%icc,	0x4
	movleu	%xcc,	%o1,	%g5
	fmovsl	%icc,	%f25,	%f21
	fpmerge	%f6,	%f19,	%f16
	movl	%icc,	%l0,	%l1
	tneg	%icc,	0x2
	or	%o2,	0x0937,	%o0
	nop
	set	0x0C, %g3
	prefetch	[%l7 + %g3],	 0x1
	swap	[%l7 + 0x48],	%i4
	tcc	%xcc,	0x1
	call	loop_589
	fbe	%fcc0,	loop_590
	movre	%i1,	0x302,	%i3
	fblg	%fcc1,	loop_591
loop_589:
	fmul8x16al	%f0,	%f18,	%f2
loop_590:
	fbuge	%fcc3,	loop_592
	edge32l	%i7,	%l4,	%o5
loop_591:
	tg	%xcc,	0x4
	fornot2s	%f9,	%f11,	%f30
loop_592:
	array32	%g1,	%g7,	%l2
	fmovdvs	%xcc,	%f26,	%f23
	edge8n	%o3,	%g6,	%i2
	fmovs	%f17,	%f2
	nop
	setx loop_593, %l0, %l1
	jmpl %l1, %i6
	fmovrdgz	%i5,	%f22,	%f8
	edge16l	%o6,	%i0,	%o7
	sdivcc	%g2,	0x146A,	%l5
loop_593:
	tvs	%xcc,	0x1
	sdiv	%g3,	0x1308,	%g4
	fone	%f8
	bl,a,pn	%xcc,	loop_594
	tne	%xcc,	0x2
	fmovda	%icc,	%f20,	%f13
	fbue	%fcc1,	loop_595
loop_594:
	fpadd32	%f12,	%f20,	%f8
	edge16	%l6,	%o4,	%o1
	array8	%g5,	%l0,	%l3
loop_595:
	srl	%o2,	0x1E,	%o0
	sll	%i4,	%i1,	%l1
	bcs,a	loop_596
	movleu	%xcc,	%i3,	%l4
	wr	%g0,	0x21,	%asi
	stxa	%o5,	[%g0 + 0x110] %asi
loop_596:
	be,a,pn	%icc,	loop_597
	fblg	%fcc2,	loop_598
	ldstub	[%l7 + 0x4C],	%i7
	tcs	%icc,	0x5
loop_597:
	tgu	%icc,	0x6
loop_598:
	fbuge	%fcc0,	loop_599
	ta	%icc,	0x1
	brz,a	%g7,	loop_600
	sdivcc	%l2,	0x017A,	%o3
loop_599:
	ta	%icc,	0x6
	sra	%g6,	%i2,	%g1
loop_600:
	ldub	[%l7 + 0x6E],	%i5
	add	%l7,	0x48,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%i6,	%o6
	movleu	%icc,	%o7,	%i0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbu,a	%fcc0,	loop_601
	fabss	%f3,	%f17
	xnorcc	%g2,	%l5,	%g4
	movleu	%xcc,	%l6,	%o4
loop_601:
	sdivcc	%g3,	0x0BA8,	%g5
	edge16l	%o1,	%l0,	%l3
	tsubcc	%o0,	0x164A,	%i4
	fmovscs	%xcc,	%f4,	%f4
	smulcc	%o2,	%i1,	%l1
	wr	%g0,	0x27,	%asi
	stba	%i3,	[%l7 + 0x76] %asi
	membar	#Sync
	array8	%o5,	%i7,	%g7
	tcc	%xcc,	0x2
	fmovdg	%icc,	%f30,	%f30
	bneg,a	%icc,	loop_602
	sll	%l2,	%l4,	%o3
	tleu	%icc,	0x5
	fmovrdne	%i2,	%f28,	%f2
loop_602:
	array16	%g6,	%i5,	%g1
	movcs	%icc,	%i6,	%o7
	tvs	%xcc,	0x5
	fmovrsgz	%o6,	%f28,	%f17
	sra	%i0,	%g2,	%l5
	movne	%xcc,	%g4,	%l6
	movvs	%xcc,	%g3,	%g5
	array32	%o4,	%o1,	%l0
	tleu	%xcc,	0x1
	xnorcc	%o0,	0x0C26,	%l3
	fbuge,a	%fcc3,	loop_603
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
	move	%icc,	%o2,	%i1
	or	%i4,	0x0DE1,	%l1
loop_603:
	fornot1	%f2,	%f26,	%f30
loop_604:
	movrlz	%o5,	%i7,	%i3
	fors	%f13,	%f28,	%f25
	udivx	%g7,	0x0786,	%l2
	smulcc	%l4,	0x16AD,	%i2
	fmovsleu	%xcc,	%f23,	%f25
	sdivx	%o3,	0x1EEC,	%i5
	movneg	%icc,	%g6,	%g1
	nop
	setx	0x0E8207E7,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f18
	fsqrts	%f18,	%f28
	fornot2	%f18,	%f0,	%f28
	tpos	%icc,	0x3
	set	0x18, %i5
	lduwa	[%l7 + %i5] 0x88,	%i6
	mulscc	%o7,	0x0552,	%i0
	fbl,a	%fcc0,	loop_605
	brgz,a	%o6,	loop_606
	addccc	%l5,	0x10BA,	%g2
	and	%g4,	0x193C,	%l6
loop_605:
	xnorcc	%g5,	0x1CB9,	%o4
loop_606:
	fmovrsgz	%o1,	%f3,	%f18
	tvc	%xcc,	0x4
	xorcc	%g3,	%o0,	%l3
	edge32	%l0,	%o2,	%i4
	tg	%icc,	0x3
	srax	%i1,	0x18,	%l1
	and	%o5,	0x1D08,	%i7
	add	%l7,	0x18,	%l6
	wr	%g0,	0x18,	%asi
	casxa	[%l6] %asi,	%g7,	%i3
	bg	loop_607
	fmovsgu	%xcc,	%f26,	%f15
	call	loop_608
	fpack16	%f10,	%f19
loop_607:
	orn	%l2,	0x164D,	%l4
	fpmerge	%f20,	%f9,	%f6
loop_608:
	nop
	set	0x30, %i4
	lda	[%l7 + %i4] 0x80,	%f15
	fones	%f31
	srl	%o3,	0x0C,	%i5
	brlz	%i2,	loop_609
	orn	%g6,	0x0210,	%g1
	tge	%xcc,	0x3
	fcmpeq32	%f8,	%f4,	%i6
loop_609:
	addcc	%i0,	0x0FC7,	%o6
	subccc	%l5,	%o7,	%g2
	movl	%xcc,	%g4,	%l6
	movrgez	%o4,	%o1,	%g3
	bvs,a,pt	%icc,	loop_610
	smul	%g5,	%l3,	%l0
	movvs	%icc,	%o0,	%i4
	fsrc2s	%f26,	%f14
loop_610:
	nop
	set	0x68, %i6
	ldsba	[%l7 + %i6] 0x88,	%o2
	movpos	%icc,	%i1,	%l1
	fnors	%f9,	%f19,	%f16
	fmovdl	%xcc,	%f14,	%f22
	fornot2	%f26,	%f8,	%f24
	bg,a,pt	%xcc,	loop_611
	edge16l	%o5,	%i7,	%i3
	fbe	%fcc2,	loop_612
	ldsb	[%l7 + 0x36],	%l2
loop_611:
	taddcc	%g7,	%o3,	%l4
	wr	%g0,	0x27,	%asi
	stxa	%i5,	[%l7 + 0x48] %asi
	membar	#Sync
loop_612:
	xor	%g6,	%g1,	%i2
	movge	%icc,	%i6,	%o6
	movrgez	%l5,	%i0,	%o7
	addccc	%g2,	0x1311,	%g4
	srl	%l6,	%o4,	%g3
	tne	%icc,	0x1
	edge32n	%o1,	%l3,	%l0
	fcmple16	%f4,	%f6,	%g5
	ldsh	[%l7 + 0x6E],	%i4
	call	loop_613
	ta	%icc,	0x0
	bl	loop_614
	tpos	%icc,	0x1
loop_613:
	tn	%xcc,	0x6
	fbl,a	%fcc0,	loop_615
loop_614:
	srlx	%o2,	0x1F,	%o0
	mova	%icc,	%i1,	%l1
	wr	%g0,	0x80,	%asi
	sta	%f25,	[%l7 + 0x78] %asi
loop_615:
	fxnor	%f28,	%f8,	%f4
	stw	%o5,	[%l7 + 0x5C]
	tcc	%icc,	0x0
	fmovrdlz	%i3,	%f18,	%f18
	taddcc	%i7,	%g7,	%l2
	set	0x23, %l3
	ldsba	[%l7 + %l3] 0x81,	%l4
	fornot1s	%f20,	%f2,	%f13
	fmovspos	%xcc,	%f14,	%f7
	nop
	setx	0x0C7C36B3,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f0
	setx	0xC38B8983,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f4
	fadds	%f4,	%f0,	%f11
	tl	%icc,	0x1
	movl	%xcc,	%i5,	%g6
	bne,a	%xcc,	loop_616
	subccc	%o3,	0x1818,	%g1
	tsubcc	%i6,	0x1724,	%o6
	tcs	%xcc,	0x2
loop_616:
	edge8ln	%i2,	%i0,	%l5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddrl	%o7,	%g4,	%g2
	movcc	%icc,	%l6,	%g3
	prefetch	[%l7 + 0x54],	 0x1
	fpadd32s	%f31,	%f23,	%f15
	bvc,pt	%icc,	loop_617
	fmovdge	%xcc,	%f8,	%f24
	fmovdleu	%xcc,	%f13,	%f31
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_617:
	brgz,a	%o1,	loop_618
	umulcc	%o4,	0x19B0,	%l3
	sdiv	%g5,	0x127B,	%l0
	edge8	%o2,	%o0,	%i1
loop_618:
	tge	%xcc,	0x7
	be,a	%icc,	loop_619
	edge16	%i4,	%l1,	%i3
	movrgez	%o5,	%i7,	%l2
	fnand	%f6,	%f18,	%f4
loop_619:
	nop
	wr	%g0,	0x89,	%asi
	prefetcha	[%l7 + 0x78] %asi,	 0x0
	alignaddr	%i5,	%g7,	%g6
	nop
	set	0x40, %g5
	stx	%o3,	[%l7 + %g5]
	set	0x78, %g1
	sta	%f19,	[%l7 + %g1] 0x04
	movrlz	%g1,	0x052,	%i6
	array8	%i2,	%i0,	%l5
	brgez	%o7,	loop_620
	fxor	%f20,	%f4,	%f20
	movcc	%icc,	%g4,	%o6
	srlx	%g2,	0x0D,	%l6
loop_620:
	sir	0x1F11
	fpadd32	%f2,	%f6,	%f20
	movneg	%icc,	%g3,	%o4
	wr	%g0,	0x04,	%asi
	stba	%o1,	[%l7 + 0x68] %asi
	set	0x20, %l1
	sta	%f12,	[%l7 + %l1] 0x10
	popc	0x054A,	%l3
	tle	%xcc,	0x4
	orcc	%l0,	%o2,	%g5
	movcs	%icc,	%o0,	%i4
	tne	%icc,	0x4
	andn	%i1,	0x07DB,	%l1
	movn	%icc,	%o5,	%i3
	fba	%fcc3,	loop_621
	addcc	%l2,	%i7,	%i5
	movgu	%xcc,	%l4,	%g6
	tn	%icc,	0x7
loop_621:
	movl	%xcc,	%o3,	%g7
	fsrc1s	%f19,	%f1
	movleu	%icc,	%i6,	%i2
	array16	%i0,	%l5,	%g1
	udivcc	%g4,	0x0E1A,	%o7
	umul	%o6,	%l6,	%g2
	bl	loop_622
	fbl	%fcc0,	loop_623
	movcs	%icc,	%g3,	%o4
	tcc	%icc,	0x3
loop_622:
	bshuffle	%f28,	%f28,	%f4
loop_623:
	edge32n	%o1,	%l3,	%l0
	udivcc	%g5,	0x1818,	%o2
	fsrc2s	%f12,	%f12
	mulscc	%o0,	%i4,	%l1
	sdivcc	%i1,	0x077B,	%o5
	fbg	%fcc2,	loop_624
	edge8	%l2,	%i7,	%i5
	bl,a	loop_625
	stw	%i3,	[%l7 + 0x24]
loop_624:
	andncc	%l4,	%g6,	%g7
	udivcc	%o3,	0x046A,	%i2
loop_625:
	fcmpgt32	%f4,	%f0,	%i6
	mova	%icc,	%i0,	%l5
	xorcc	%g4,	%o7,	%g1
	edge16ln	%l6,	%o6,	%g3
	fmul8x16au	%f0,	%f21,	%f14
	tg	%xcc,	0x5
	wr	%g0,	0x89,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	umulcc	%g2,	%o4,	%l3
	stbar
	set	0x4E, %l2
	ldsba	[%l7 + %l2] 0x11,	%l0
	tl	%icc,	0x6
	pdist	%f28,	%f16,	%f16
	movvc	%xcc,	%g5,	%o2
	alignaddrl	%o0,	%i4,	%l1
	udiv	%o1,	0x186C,	%o5
	andncc	%i1,	%l2,	%i7
	sllx	%i3,	%l4,	%i5
	fpsub32	%f26,	%f4,	%f6
	edge16n	%g6,	%g7,	%o3
	fxnor	%f10,	%f24,	%f12
	fmovd	%f2,	%f16
	tn	%icc,	0x1
	edge16n	%i2,	%i6,	%i0
	set	0x26, %o0
	lduba	[%l7 + %o0] 0x14,	%l5
	movvc	%icc,	%o7,	%g4
	tge	%icc,	0x5
	alignaddr	%g1,	%o6,	%g3
	xnor	%l6,	0x1746,	%o4
	or	%g2,	%l0,	%l3
	fnot2s	%f0,	%f9
	tleu	%xcc,	0x5
	wr	%g0,	0x04,	%asi
	lduwa	[%l7 + 0x54] %asi,	%g5
	tvs	%xcc,	0x5
	set	0x40, %o7
	stda	%f16,	[%l7 + %o7] 0xf0
	membar	#Sync
	bneg	loop_626
	edge16	%o2,	%o0,	%l1
	brlz,a	%o1,	loop_627
	fnot2s	%f21,	%f8
loop_626:
	tvs	%xcc,	0x5
	edge32	%i4,	%o5,	%i1
loop_627:
	fmovdneg	%icc,	%f5,	%f6
	xnor	%l2,	%i7,	%i3
	fsrc1	%f18,	%f24
	nop
	fitod	%f12,	%f26
	fdtos	%f26,	%f3
	movrlez	%l4,	%i5,	%g7
	andn	%g6,	0x03BF,	%i2
	brlz,a	%o3,	loop_628
	edge8l	%i0,	%l5,	%o7
	stb	%i6,	[%l7 + 0x64]
	faligndata	%f18,	%f30,	%f4
loop_628:
	fbg	%fcc1,	loop_629
	fnors	%f9,	%f6,	%f29
	move	%xcc,	%g4,	%g1
	nop
	setx	0x66AAA364,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f30
	setx	0xDE399AEE,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f18
	fadds	%f18,	%f30,	%f11
loop_629:
	fbne,a	%fcc0,	loop_630
	udivcc	%g3,	0x1739,	%o6
	tle	%icc,	0x6
	flush	%l7 + 0x0C
loop_630:
	ldsw	[%l7 + 0x48],	%o4
	tl	%xcc,	0x4
	array32	%l6,	%l0,	%g2
	wr	%g0,	0x81,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	fmul8x16	%f6,	%f20,	%f24
	edge32	%g5,	%o2,	%l3
	fpadd32s	%f31,	%f19,	%f1
	udiv	%o0,	0x0283,	%l1
	movn	%xcc,	%i4,	%o5
	xorcc	%i1,	0x1E45,	%l2
	ldd	[%l7 + 0x10],	%o0
	movneg	%xcc,	%i3,	%i7
	taddcc	%l4,	%g7,	%g6
	fpsub32	%f20,	%f24,	%f28
	sdiv	%i5,	0x032B,	%o3
	srlx	%i2,	0x1B,	%l5
	movrlz	%o7,	%i6,	%g4
	ba	%icc,	loop_631
	sir	0x14DA
	tle	%icc,	0x7
	subc	%g1,	0x0366,	%g3
loop_631:
	fba,a	%fcc1,	loop_632
	andcc	%o6,	%o4,	%i0
	bcs,pt	%xcc,	loop_633
	fbug,a	%fcc2,	loop_634
loop_632:
	fpadd16	%f22,	%f0,	%f22
	fbg,a	%fcc0,	loop_635
loop_633:
	udivx	%l6,	0x0638,	%g2
loop_634:
	andcc	%g5,	0x0704,	%o2
	movne	%xcc,	%l0,	%o0
loop_635:
	fandnot2	%f30,	%f30,	%f14
	edge8l	%l1,	%i4,	%l3
	sir	0x0829
	nop
	setx loop_636, %l0, %l1
	jmpl %l1, %o5
	fsrc1	%f24,	%f16
	fbule	%fcc0,	loop_637
	fnors	%f9,	%f22,	%f22
loop_636:
	fones	%f1
	fsrc2	%f0,	%f16
loop_637:
	edge32n	%i1,	%o1,	%i3
	movn	%xcc,	%i7,	%l2
	set	0x12, %g2
	lduba	[%l7 + %g2] 0x04,	%g7
	tneg	%xcc,	0x7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdivcc	%l4,	0x170F,	%g6
	fands	%f23,	%f31,	%f19
	movneg	%xcc,	%o3,	%i2
	fandnot1s	%f24,	%f4,	%f11
	fmovdn	%icc,	%f29,	%f2
	fmovde	%icc,	%f4,	%f9
	fpmerge	%f19,	%f23,	%f26
	fbul	%fcc1,	loop_638
	movle	%xcc,	%l5,	%o7
	fmuld8ulx16	%f3,	%f28,	%f2
	movneg	%xcc,	%i6,	%g4
loop_638:
	xnorcc	%i5,	0x0F1D,	%g1
	move	%icc,	%g3,	%o4
	fmovdgu	%xcc,	%f6,	%f22
	tle	%icc,	0x5
	fbe	%fcc3,	loop_639
	fmovdle	%xcc,	%f11,	%f17
	wr	%g0,	0x21,	%asi
	ldxa	[%g0 + 0x8] %asi,	%o6
loop_639:
	nop
	wr	%g0,	0x80,	%asi
	prefetcha	[%l7 + 0x50] %asi,	 0x0
	tgu	%icc,	0x2
	wr	%g0,	0x80,	%asi
	ldsba	[%l7 + 0x48] %asi,	%l6
	edge32	%g2,	%o2,	%l0
	edge32n	%o0,	%g5,	%l1
	fpackfix	%f14,	%f11
	nop
	setx	0x2D3D9643D064254F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x78]
	ldx	[%l7 + 0x78],	%fsr
	nop
	setx	0x8F3D5808,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f8
	fsqrts	%f8,	%f7
	movvs	%xcc,	%i4,	%l3
	fmovrsgz	%i1,	%f1,	%f29
	tge	%xcc,	0x4
	alignaddr	%o1,	%i3,	%o5
	nop
	setx	0x6A3CAB30,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f29
	fsqrts	%f29,	%f5
	brnz,a	%l2,	loop_640
	and	%i7,	0x06DD,	%g7
	movgu	%icc,	%l4,	%g6
	fnot1	%f6,	%f16
loop_640:
	fcmpgt32	%f12,	%f4,	%i2
	movge	%xcc,	%o3,	%l5
	sdiv	%o7,	0x1F4A,	%g4
	nop
	setx loop_641, %l0, %l1
	jmpl %l1, %i6
	movre	%i5,	%g1,	%o4
	add	%l7,	0x28,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%g3
	casxa	[%l6] 0x88,	%g3,	%o6
loop_641:
	fbule	%fcc3,	loop_642
	movrlz	%i0,	0x25D,	%l6
	fba,a	%fcc1,	loop_643
	fnands	%f29,	%f11,	%f10
loop_642:
	smul	%g2,	%o2,	%l0
	fbn,a	%fcc1,	loop_644
loop_643:
	taddcctv	%g5,	%o0,	%l1
	tvs	%icc,	0x1
	array16	%l3,	%i1,	%i4
loop_644:
	movpos	%icc,	%o1,	%i3
	edge16ln	%o5,	%l2,	%i7
	fmovdcs	%xcc,	%f5,	%f13
	addcc	%g7,	0x0570,	%l4
	umul	%i2,	%o3,	%l5
	prefetch	[%l7 + 0x48],	 0x0
	orn	%o7,	0x174E,	%g6
	fsrc1s	%f17,	%f17
	tcs	%icc,	0x4
	add	%l7,	0x08,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%g4,	%i6
	fandnot2	%f10,	%f28,	%f6
	tn	%icc,	0x4
	andncc	%g1,	%o4,	%g3
	tcs	%xcc,	0x4
	flush	%l7 + 0x08
	udiv	%i5,	0x03AB,	%o6
	taddcc	%i0,	0x0C75,	%l6
	ldub	[%l7 + 0x41],	%o2
	tvc	%icc,	0x6
	fbug,a	%fcc2,	loop_645
	tvs	%icc,	0x1
	movleu	%icc,	%g2,	%l0
	umul	%g5,	0x163D,	%l1
loop_645:
	fmovdleu	%icc,	%f3,	%f2
	fands	%f25,	%f28,	%f24
	array32	%o0,	%l3,	%i1
	st	%f1,	[%l7 + 0x44]
	bcc,pt	%icc,	loop_646
	fmovdn	%xcc,	%f31,	%f21
	ldsw	[%l7 + 0x60],	%o1
	wr	%g0,	0x04,	%asi
	prefetcha	[%l7 + 0x48] %asi,	 0x1
loop_646:
	pdist	%f16,	%f12,	%f24
	fnand	%f28,	%f12,	%f22
	mulx	%o5,	%l2,	%i7
	nop
	setx	0xD045030A,	%l0,	%l6
	st	%l6,	[%l7 + 0x48]
	ld	[%l7 + 0x48],	%fsr
	fmovdcc	%icc,	%f9,	%f1
	sdivx	%i4,	0x114E,	%g7
	tgu	%xcc,	0x0
	umul	%i2,	0x0D7C,	%l4
	fbl	%fcc3,	loop_647
	sllx	%l5,	%o7,	%g6
	edge8l	%o3,	%i6,	%g4
	edge8ln	%o4,	%g3,	%i5
loop_647:
	umul	%o6,	0x126D,	%i0
	edge32l	%l6,	%g1,	%g2
	andn	%l0,	%g5,	%o2
	taddcc	%l1,	0x1EB9,	%o0
	smul	%i1,	0x1073,	%l3
	stx	%o1,	[%l7 + 0x20]
	fmovsl	%icc,	%f10,	%f6
	movcs	%xcc,	%o5,	%l2
	popc	%i7,	%i4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movgu	%xcc,	%i3,	%g7
	mova	%icc,	%l4,	%i2
	mulscc	%l5,	%g6,	%o7
	movcs	%xcc,	%o3,	%i6
	taddcc	%g4,	%o4,	%g3
	sethi	0x0AC6,	%o6
	edge8l	%i5,	%i0,	%g1
	array16	%l6,	%l0,	%g2
	nop
	set	0x4E, %l5
	lduh	[%l7 + %l5],	%g5
	subc	%l1,	%o0,	%i1
	movcc	%icc,	%o2,	%l3
	array8	%o1,	%o5,	%l2
	ta	%xcc,	0x1
	smul	%i7,	0x0C7A,	%i3
	subc	%i4,	0x1DF9,	%l4
	tsubcc	%g7,	0x1362,	%l5
	smulcc	%g6,	%o7,	%i2
	fbge	%fcc3,	loop_648
	sdivx	%i6,	0x1209,	%g4
	subc	%o3,	0x1C71,	%g3
	sll	%o4,	0x0A,	%o6
loop_648:
	andn	%i0,	%i5,	%l6
	fmovsneg	%xcc,	%f20,	%f9
	brlez	%g1,	loop_649
	ble,a	%icc,	loop_650
	tleu	%icc,	0x6
	taddcc	%g2,	%g5,	%l1
loop_649:
	nop
	set	0x48, %i7
	stxa	%l0,	[%l7 + %i7] 0x81
loop_650:
	taddcctv	%i1,	%o2,	%l3
	set	0x18, %o2
	ldswa	[%l7 + %o2] 0x11,	%o1
	fpadd16s	%f2,	%f12,	%f1
	addc	%o5,	%l2,	%i7
	sllx	%o0,	%i3,	%l4
	udiv	%g7,	0x0EFC,	%i4
	udivx	%g6,	0x1E5A,	%o7
	tge	%xcc,	0x1
	edge32ln	%l5,	%i2,	%g4
	fnegd	%f0,	%f0
	movle	%xcc,	%i6,	%g3
	srax	%o4,	0x0F,	%o3
	movne	%xcc,	%o6,	%i5
	addccc	%l6,	0x076C,	%g1
	fcmpeq32	%f4,	%f10,	%g2
	fmul8ulx16	%f24,	%f0,	%f2
	tleu	%icc,	0x5
	fmovsl	%xcc,	%f11,	%f17
	set	0x44, %o3
	lda	[%l7 + %o3] 0x14,	%f5
	edge32l	%i0,	%l1,	%l0
	fmovde	%xcc,	%f0,	%f14
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	lduw	[%l7 + 0x28],	%g5
	movrlez	%i1,	%l3,	%o1
	fcmpgt32	%f8,	%f28,	%o5
	fmovdvc	%xcc,	%f6,	%f6
	set	0x28, %o1
	prefetcha	[%l7 + %o1] 0x89,	 0x0
	fblg,a	%fcc3,	loop_651
	lduh	[%l7 + 0x12],	%i7
	edge16l	%o2,	%o0,	%l4
	tcs	%xcc,	0x4
loop_651:
	fmovdneg	%xcc,	%f16,	%f29
	fcmpne16	%f12,	%f10,	%i3
	nop
	fitos	%f0,	%f26
	fstoi	%f26,	%f0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x11,	%asi
	lduwa	[%l7 + 0x64] %asi,	%i4
	fpadd32s	%f30,	%f21,	%f31
	set	0x48, %i3
	lduwa	[%l7 + %i3] 0x11,	%g6
	tsubcc	%g7,	0x05F4,	%o7
	subc	%i2,	0x050C,	%g4
	xnor	%i6,	%g3,	%l5
	tsubcc	%o4,	0x14C7,	%o3
	smulcc	%o6,	%l6,	%g1
	nop
	setx	0xFAF8C507A7EC9CA1,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0xF95F8C8E80400EC5,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	fsubd	%f16,	%f20,	%f18
	bn	loop_652
	fpsub32	%f4,	%f12,	%f28
	tle	%xcc,	0x2
	movrgz	%i5,	0x072,	%i0
loop_652:
	ldub	[%l7 + 0x19],	%g2
	tg	%icc,	0x4
	fmovde	%xcc,	%f3,	%f24
	movleu	%icc,	%l1,	%g5
	fmovdleu	%xcc,	%f6,	%f29
	prefetch	[%l7 + 0x14],	 0x0
	wr	%g0,	0x80,	%asi
	ldstuba	[%l7 + 0x2A] %asi,	%i1
	subcc	%l0,	0x181B,	%o1
	subc	%l3,	%l2,	%i7
	movneg	%icc,	%o5,	%o0
	bpos,pt	%icc,	loop_653
	fmovsg	%xcc,	%f13,	%f28
	movgu	%xcc,	%o2,	%l4
	mulscc	%i3,	%i4,	%g6
loop_653:
	taddcc	%o7,	%i2,	%g4
	edge16l	%i6,	%g3,	%l5
	movrgez	%g7,	0x382,	%o3
	mulx	%o4,	0x12A9,	%l6
	fmovsl	%icc,	%f26,	%f27
	movne	%icc,	%o6,	%g1
	ldsh	[%l7 + 0x3A],	%i5
	nop
	fitos	%f2,	%f23
	fstox	%f23,	%f0
	fxtos	%f0,	%f16
	edge32	%g2,	%i0,	%l1
	movneg	%xcc,	%g5,	%l0
	tcc	%xcc,	0x0
	movleu	%icc,	%i1,	%l3
	fbue	%fcc2,	loop_654
	edge32l	%l2,	%o1,	%o5
	movrgez	%i7,	0x097,	%o0
	movre	%l4,	%o2,	%i3
loop_654:
	subccc	%g6,	%i4,	%o7
	nop
	setx	loop_655,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	sth	%i2,	[%l7 + 0x22]
	fmovsge	%icc,	%f2,	%f14
	movrne	%g4,	0x206,	%g3
loop_655:
	be,a,pn	%icc,	loop_656
	sir	0x01F3
	tcc	%icc,	0x3
	ldub	[%l7 + 0x30],	%i6
loop_656:
	fbue,a	%fcc3,	loop_657
	fsrc1	%f0,	%f18
	nop
	setx	0xC007F7D0F07EF134,	%l0,	%l6
	stx	%l6,	[%l7 + 0x10]
	ldx	[%l7 + 0x10],	%fsr
	stx	%l5,	[%l7 + 0x48]
loop_657:
	xnor	%g7,	%o4,	%o3
	std	%f0,	[%l7 + 0x20]
	umulcc	%l6,	%g1,	%i5
	edge32	%o6,	%g2,	%i0
	swap	[%l7 + 0x28],	%g5
	smul	%l1,	%i1,	%l3
	movcs	%icc,	%l2,	%l0
	fmovdvc	%icc,	%f0,	%f20
	fmovdleu	%icc,	%f6,	%f24
	nop
	setx	0x004BAA92,	%l0,	%l6
	st	%l6,	[%l7 + 0x2C]
	ld	[%l7 + 0x2C],	%fsr
	fnor	%f2,	%f12,	%f14
	tle	%xcc,	0x6
	sth	%o5,	[%l7 + 0x76]
	fblg,a	%fcc2,	loop_658
	movle	%xcc,	%o1,	%o0
	fmovdn	%icc,	%f6,	%f30
	bn	loop_659
loop_658:
	edge32	%i7,	%o2,	%i3
	subcc	%l4,	%i4,	%g6
	nop
	setx	0xAE8D4934,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f15
	fsqrts	%f15,	%f10
loop_659:
	add	%i2,	0x022B,	%g4
	sllx	%o7,	%i6,	%l5
	tvc	%xcc,	0x2
	andn	%g3,	0x13E6,	%g7
	fexpand	%f6,	%f22
	fcmple16	%f8,	%f0,	%o3
	add	%o4,	0x071C,	%l6
	ldstub	[%l7 + 0x33],	%i5
	sir	0x1657
	sth	%o6,	[%l7 + 0x6A]
	fmovsle	%xcc,	%f13,	%f23
	stw	%g1,	[%l7 + 0x1C]
	lduw	[%l7 + 0x28],	%i0
	movrlez	%g5,	%l1,	%i1
	fmovsle	%xcc,	%f7,	%f6
	fmul8sux16	%f10,	%f10,	%f6
	edge8ln	%l3,	%g2,	%l0
	fmovsg	%icc,	%f17,	%f16
	popc	0x1DC8,	%o5
	sdivx	%o1,	0x143E,	%o0
	movrne	%l2,	%i7,	%i3
	fmul8x16al	%f15,	%f3,	%f22
	ta	%icc,	0x5
	orncc	%o2,	0x0A2A,	%l4
	fmovde	%xcc,	%f12,	%f31
	fmul8x16al	%f13,	%f21,	%f4
	stbar
	fmovsg	%xcc,	%f19,	%f19
	ba,a	%xcc,	loop_660
	edge8ln	%i4,	%g6,	%g4
	edge8ln	%o7,	%i6,	%i2
	stbar
loop_660:
	nop
	setx	0x88ED1AF0,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f27
	setx	0x6FB82750,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f12
	fmuls	%f12,	%f27,	%f0
	brgez	%l5,	loop_661
	movrlz	%g3,	0x181,	%g7
	fmovsg	%icc,	%f3,	%f6
	sll	%o4,	0x00,	%o3
loop_661:
	bcs	%icc,	loop_662
	movg	%xcc,	%i5,	%o6
	tcs	%xcc,	0x1
	set	0x28, %i1
	lduwa	[%l7 + %i1] 0x18,	%g1
loop_662:
	movcs	%xcc,	%i0,	%l6
	tle	%icc,	0x5
	tgu	%icc,	0x7
	fbn,a	%fcc0,	loop_663
	tg	%xcc,	0x4
	addc	%l1,	%g5,	%l3
	subc	%i1,	0x097E,	%l0
loop_663:
	srl	%g2,	0x11,	%o5
	faligndata	%f18,	%f28,	%f28
	andn	%o1,	%l2,	%o0
	tgu	%icc,	0x6
	srax	%i7,	0x0F,	%i3
	tvc	%icc,	0x2
	brz	%l4,	loop_664
	sub	%i4,	%g6,	%o2
	bcc,a	%xcc,	loop_665
	fmul8x16al	%f15,	%f9,	%f4
loop_664:
	sir	0x149C
	alignaddr	%g4,	%i6,	%i2
loop_665:
	ldstub	[%l7 + 0x74],	%o7
	ld	[%l7 + 0x74],	%f21
	bg,a	loop_666
	nop
	setx	loop_667,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	nop
	fitos	%f5,	%f24
	fstoi	%f24,	%f31
	fble	%fcc1,	loop_668
loop_666:
	ta	%icc,	0x1
loop_667:
	nop
	add	%l7,	0x60,	%l6
	wr	%g0,	0x04,	%asi
	casxa	[%l6] %asi,	%l5,	%g3
loop_668:
	addccc	%o4,	%o3,	%g7
	mulx	%o6,	0x129F,	%i5
	fandnot2	%f8,	%f8,	%f26
	nop
	fitod	%f10,	%f6
	fdtox	%f6,	%f6
	fxtod	%f6,	%f8
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpsub32	%f22,	%f6,	%f0
	fpack32	%f6,	%f18,	%f28
	bvc,a	%icc,	loop_669
	srax	%i0,	0x1C,	%g1
	sra	%l1,	%l6,	%l3
	addcc	%i1,	0x161C,	%l0
loop_669:
	sir	0x0FDF
	array16	%g5,	%g2,	%o5
	sir	0x05FD
	edge16l	%l2,	%o1,	%i7
	nop
	set	0x10, %o4
	stx	%i3,	[%l7 + %o4]
	alignaddrl	%o0,	%l4,	%i4
	faligndata	%f14,	%f24,	%f28
	movrlez	%o2,	%g4,	%i6
	nop
	setx	0x7BD9F67BBEEA0819,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0xB20026CB9669FD6F,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	faddd	%f12,	%f6,	%f22
	fmovdcs	%icc,	%f20,	%f12
	srlx	%i2,	%g6,	%o7
	fbe,a	%fcc1,	loop_670
	ldx	[%l7 + 0x60],	%l5
	nop
	fitod	%f0,	%f18
	fdtox	%f18,	%f12
	fxtod	%f12,	%f24
	wr	%g0,	0x89,	%asi
	lda	[%l7 + 0x18] %asi,	%f28
loop_670:
	addc	%g3,	0x19C0,	%o3
	fsrc2	%f16,	%f24
	edge32l	%o4,	%g7,	%o6
	fmovdneg	%xcc,	%f29,	%f7
	ta	%icc,	0x2
	movge	%icc,	%i5,	%i0
	wr	%g0,	0x80,	%asi
	prefetcha	[%l7 + 0x70] %asi,	 0x0
	tleu	%icc,	0x7
	addccc	%l6,	%l1,	%i1
	addccc	%l0,	%g5,	%l3
	membar	0x39
	array16	%o5,	%l2,	%g2
	brgz	%o1,	loop_671
	udivx	%i3,	0x1320,	%i7
	fsrc1s	%f27,	%f7
	movpos	%xcc,	%o0,	%i4
loop_671:
	movrne	%l4,	0x34B,	%g4
	wr	%g0,	0x89,	%asi
	ldda	[%l7 + 0x60] %asi,	%i6
	edge16l	%o2,	%g6,	%o7
	nop
	setx loop_672, %l0, %l1
	jmpl %l1, %i2
	umul	%l5,	0x0473,	%g3
	sethi	0x0420,	%o3
	fbul,a	%fcc3,	loop_673
loop_672:
	edge32n	%o4,	%o6,	%g7
	taddcc	%i0,	%g1,	%i5
	nop
	setx	loop_674,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_673:
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
	fmul8x16au	%f9,	%f16,	%f14
	bn	loop_676
loop_674:
	movcs	%icc,	%l6,	%l1
loop_675:
	lduw	[%l7 + 0x14],	%i1
	bshuffle	%f18,	%f20,	%f26
loop_676:
	fbl,a	%fcc0,	loop_677
	and	%l0,	%l3,	%o5
	tn	%xcc,	0x6
	fmovrslez	%g5,	%f26,	%f8
loop_677:
	fble	%fcc0,	loop_678
	fmovsa	%xcc,	%f16,	%f18
	addc	%g2,	0x03E0,	%l2
	fmovrdne	%i3,	%f18,	%f26
loop_678:
	fmovrsne	%i7,	%f17,	%f11
	ldd	[%l7 + 0x60],	%f30
	fpsub32s	%f16,	%f7,	%f16
	tl	%xcc,	0x3
	umul	%o0,	0x0169,	%o1
	udivcc	%i4,	0x1EE6,	%g4
	stw	%l4,	[%l7 + 0x28]
	ldstub	[%l7 + 0x4A],	%i6
	tne	%icc,	0x7
	edge8n	%o2,	%o7,	%i2
	mulscc	%g6,	0x1A51,	%g3
	flush	%l7 + 0x0C
	movpos	%icc,	%o3,	%o4
	tn	%xcc,	0x5
	nop
	setx	0x8633849A,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f0
	setx	0xA845E075,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f7
	fadds	%f7,	%f0,	%f17
	fpsub16s	%f25,	%f26,	%f17
	sll	%l5,	%g7,	%i0
	nop
	fitod	%f19,	%f24
	or	%o6,	%g1,	%l6
	movre	%l1,	%i1,	%i5
	add	%l7,	0x40,	%l6
	wr	%g0,	0x18,	%asi
	casa	[%l6] %asi,	%l3,	%l0
	nop
	setx	0x756A740E,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f25
	fsqrts	%f25,	%f12
	mulscc	%o5,	0x1315,	%g2
	movcs	%xcc,	%g5,	%i3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	add	%l2,	0x02E0,	%i7
	movge	%xcc,	%o1,	%i4
	tg	%icc,	0x4
	udiv	%g4,	0x0D9E,	%l4
	call	loop_679
	fmovspos	%xcc,	%f0,	%f31
	tsubcc	%o0,	%i6,	%o7
	fmovsvs	%icc,	%f21,	%f5
loop_679:
	fmovrde	%i2,	%f14,	%f20
	nop
	setx	0x4B7933CC32BD6057,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0x8689892F034B3E91,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	fmuld	%f2,	%f16,	%f6
	edge32ln	%g6,	%o2,	%g3
	taddcctv	%o3,	0x0498,	%l5
	tpos	%xcc,	0x1
	orn	%g7,	%o4,	%o6
	fsrc1	%f2,	%f28
	srlx	%g1,	%l6,	%i0
	addc	%l1,	%i1,	%i5
	mulscc	%l0,	0x1101,	%l3
	array16	%g2,	%g5,	%i3
	brnz,a	%l2,	loop_680
	movpos	%xcc,	%i7,	%o1
	movgu	%icc,	%o5,	%i4
	membar	0x1C
loop_680:
	fands	%f14,	%f1,	%f7
	udivx	%g4,	0x153A,	%l4
	udivx	%o0,	0x1467,	%i6
	srl	%i2,	%o7,	%o2
	movrlez	%g6,	%g3,	%o3
	sdivcc	%g7,	0x1B29,	%o4
	fblg	%fcc2,	loop_681
	fbuge	%fcc2,	loop_682
	ldsh	[%l7 + 0x1C],	%l5
	tcc	%icc,	0x0
loop_681:
	fmovdpos	%xcc,	%f16,	%f11
loop_682:
	fblg	%fcc2,	loop_683
	taddcctv	%g1,	0x1E82,	%l6
	fmul8x16au	%f9,	%f4,	%f18
	umul	%o6,	%l1,	%i0
loop_683:
	ld	[%l7 + 0x50],	%f6
	nop
	fitod	%f10,	%f10
	fdtox	%f10,	%f22
	fxtod	%f22,	%f0
	nop
	fitos	%f1,	%f4
	fstox	%f4,	%f26
	sub	%i5,	%i1,	%l0
	nop
	fitod	%f24,	%f6
	sdivcc	%l3,	0x187F,	%g5
	fpsub16	%f18,	%f26,	%f4
	ldd	[%l7 + 0x38],	%g2
	edge16ln	%l2,	%i3,	%i7
	fmovscs	%xcc,	%f3,	%f28
	xnor	%o5,	%i4,	%o1
	nop
	fitos	%f11,	%f15
	fstox	%f15,	%f20
	fxtos	%f20,	%f16
	fsrc1	%f26,	%f6
	fpadd32s	%f25,	%f2,	%f4
	edge16l	%g4,	%o0,	%i6
	ldsw	[%l7 + 0x18],	%i2
	ldsb	[%l7 + 0x12],	%l4
	mulscc	%o7,	0x10FB,	%o2
	sllx	%g3,	%o3,	%g6
	mulscc	%g7,	0x0A7D,	%l5
	nop
	setx	0x0396459D,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f3
	fsqrts	%f3,	%f25
	tpos	%xcc,	0x3
	wr	%g0,	0x80,	%asi
	lduwa	[%l7 + 0x34] %asi,	%g1
	andn	%l6,	%o6,	%l1
	fmovsvc	%icc,	%f18,	%f5
	set	0x58, %g7
	sta	%f6,	[%l7 + %g7] 0x0c
	wr	%g0,	0x89,	%asi
	ldxa	[%l7 + 0x48] %asi,	%o4
	mova	%icc,	%i0,	%i5
	fbug	%fcc0,	loop_684
	or	%i1,	%l0,	%g5
	movvs	%icc,	%g2,	%l2
	mulx	%l3,	0x04F0,	%i7
loop_684:
	xor	%i3,	%o5,	%i4
	movne	%icc,	%o1,	%o0
	srlx	%g4,	0x19,	%i2
	tn	%xcc,	0x4
	stw	%i6,	[%l7 + 0x7C]
	taddcctv	%l4,	%o2,	%o7
	movre	%g3,	%o3,	%g7
	mulx	%g6,	0x1ED2,	%g1
	andncc	%l5,	%l6,	%o6
	fmovscc	%icc,	%f9,	%f18
	xnor	%o4,	0x1EF6,	%l1
	wr	%g0,	0x80,	%asi
	sta	%f12,	[%l7 + 0x60] %asi
	tsubcctv	%i5,	0x0885,	%i1
	orcc	%l0,	%g5,	%i0
	ldstub	[%l7 + 0x4A],	%l2
	taddcctv	%g2,	0x0A8F,	%l3
	set	0x40, %l6
	stda	%f0,	[%l7 + %l6] 0x11
	tcs	%xcc,	0x2
	movrne	%i3,	0x075,	%o5
	fnand	%f20,	%f22,	%f10
	fmovdle	%xcc,	%f3,	%f23
	nop
	fitod	%f12,	%f18
	fdtoi	%f18,	%f0
	fcmpne32	%f4,	%f26,	%i4
	fbul	%fcc1,	loop_685
	fmovdvs	%xcc,	%f9,	%f1
	edge8n	%o1,	%o0,	%i7
	fornot2s	%f19,	%f26,	%f19
loop_685:
	movrgez	%g4,	%i2,	%l4
	tgu	%xcc,	0x6
	movrgez	%i6,	%o7,	%g3
	fmovscc	%icc,	%f3,	%f15
	addcc	%o3,	0x12CC,	%g7
	movgu	%icc,	%o2,	%g1
	sra	%g6,	%l5,	%o6
	move	%xcc,	%l6,	%o4
	movneg	%icc,	%l1,	%i5
	fxors	%f14,	%f14,	%f8
	edge16n	%l0,	%i1,	%g5
	set	0x6C, %l4
	ldswa	[%l7 + %l4] 0x10,	%l2
	call	loop_686
	fbn	%fcc3,	loop_687
	edge32	%g2,	%l3,	%i0
	and	%o5,	0x1058,	%i3
loop_686:
	fbl	%fcc1,	loop_688
loop_687:
	std	%f22,	[%l7 + 0x38]
	udivx	%i4,	0x1547,	%o0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_688:
	tle	%xcc,	0x4
	tcs	%icc,	0x2
	andcc	%i7,	0x0AD0,	%o1
	tcc	%xcc,	0x3
	taddcc	%i2,	0x1865,	%g4
	smulcc	%i6,	0x0967,	%l4
	edge8ln	%g3,	%o7,	%o3
	xnor	%o2,	0x0976,	%g1
	umul	%g6,	%l5,	%g7
	fornot1s	%f16,	%f24,	%f21
	fbo,a	%fcc0,	loop_689
	bgu	loop_690
	srl	%o6,	%l6,	%l1
	andn	%o4,	0x1109,	%l0
loop_689:
	fsrc1	%f22,	%f14
loop_690:
	edge8ln	%i5,	%g5,	%i1
	fbue	%fcc1,	loop_691
	smulcc	%g2,	%l3,	%i0
	andcc	%o5,	%i3,	%l2
	umul	%o0,	0x1981,	%i7
loop_691:
	nop
	setx	loop_692,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	ldx	[%l7 + 0x50],	%o1
	orcc	%i2,	%g4,	%i6
	lduw	[%l7 + 0x5C],	%i4
loop_692:
	movne	%icc,	%l4,	%o7
	call	loop_693
	bne,pn	%xcc,	loop_694
	tcs	%icc,	0x0
	andcc	%o3,	%o2,	%g3
loop_693:
	sdiv	%g1,	0x0C82,	%l5
loop_694:
	nop
	set	0x55, %l0
	stba	%g6,	[%l7 + %l0] 0x23
	membar	#Sync
	sub	%o6,	%g7,	%l6
	addc	%l1,	0x0C7A,	%o4
	edge32l	%l0,	%i5,	%g5
	popc	%g2,	%l3
	srlx	%i1,	%o5,	%i0
	fpsub16s	%f5,	%f21,	%f27
	sra	%l2,	0x08,	%i3
	ta	%icc,	0x2
	fcmpgt32	%f6,	%f16,	%o0
	nop
	setx	0xB069C934,	%l0,	%l6
	st	%l6,	[%l7 + 0x24]
	ld	[%l7 + 0x24],	%fsr
	and	%i7,	%o1,	%i2
	xorcc	%i6,	%i4,	%l4
	popc	%g4,	%o7
	set	0x58, %o6
	lduwa	[%l7 + %o6] 0x19,	%o3
	addc	%g3,	%g1,	%l5
	udivx	%o2,	0x045C,	%g6
	stb	%g7,	[%l7 + 0x3B]
	brgz,a	%o6,	loop_695
	bg,a	%icc,	loop_696
	lduw	[%l7 + 0x2C],	%l1
	sra	%l6,	%l0,	%o4
loop_695:
	call	loop_697
loop_696:
	movvs	%xcc,	%g5,	%g2
	edge16	%l3,	%i1,	%i5
	fbl,a	%fcc1,	loop_698
loop_697:
	tvs	%xcc,	0x4
	fba	%fcc2,	loop_699
	brnz,a	%o5,	loop_700
loop_698:
	fmovrse	%l2,	%f17,	%f4
	movg	%xcc,	%i3,	%o0
loop_699:
	xor	%i0,	%i7,	%o1
loop_700:
	fmovrslez	%i2,	%f31,	%f0
	stbar
	fmovsgu	%xcc,	%f1,	%f10
	ta	%xcc,	0x3
	fbuge	%fcc2,	loop_701
	fpadd32	%f10,	%f0,	%f26
	mulx	%i4,	0x19D0,	%l4
	ldsh	[%l7 + 0x08],	%i6
loop_701:
	fmovd	%f14,	%f10
	wr	%g0,	0x11,	%asi
	ldsha	[%l7 + 0x0C] %asi,	%o7
	sdiv	%g4,	0x1909,	%o3
	fmovsl	%xcc,	%f17,	%f6
	set	0x10, %i2
	stxa	%g3,	[%l7 + %i2] 0xe2
	membar	#Sync
	nop
	fitod	%f12,	%f0
	fdtoi	%f0,	%f10
	tvc	%icc,	0x1
	sllx	%g1,	0x08,	%l5
	tleu	%xcc,	0x6
	fors	%f19,	%f31,	%f11
	st	%f31,	[%l7 + 0x58]
	ldsh	[%l7 + 0x2E],	%o2
	movn	%xcc,	%g7,	%o6
	tsubcc	%l1,	0x0EC3,	%l6
	umul	%l0,	%g6,	%g5
	andncc	%g2,	%l3,	%o4
	wr	%g0,	0x10,	%asi
	ldxa	[%l7 + 0x68] %asi,	%i5
	bcs,pn	%icc,	loop_702
	edge8ln	%o5,	%i1,	%i3
	stw	%o0,	[%l7 + 0x38]
	edge32ln	%i0,	%i7,	%l2
loop_702:
	fbne	%fcc3,	loop_703
	mova	%xcc,	%i2,	%i4
	fbg,a	%fcc0,	loop_704
	xnor	%l4,	0x0D77,	%i6
loop_703:
	fmovs	%f13,	%f27
	movvs	%xcc,	%o1,	%g4
loop_704:
	stb	%o3,	[%l7 + 0x49]
	tvc	%xcc,	0x7
	movrgez	%o7,	0x22C,	%g3
	mulscc	%l5,	0x0AB3,	%g1
	nop
	fitod	%f6,	%f12
	fdtox	%f12,	%f18
	fxtod	%f18,	%f6
	edge16l	%g7,	%o6,	%l1
	movn	%xcc,	%o2,	%l6
	ba,a	%icc,	loop_705
	fmovsvs	%icc,	%f2,	%f8
	wr	%g0,	0x22,	%asi
	stha	%l0,	[%l7 + 0x20] %asi
	membar	#Sync
loop_705:
	xnorcc	%g6,	%g2,	%l3
	fmul8x16	%f20,	%f20,	%f16
	fble	%fcc0,	loop_706
	movrlz	%g5,	0x328,	%o4
	movrlez	%i5,	0x0BA,	%i1
	tleu	%icc,	0x7
loop_706:
	nop
	setx	0xC6188D2CCF5E33AC,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0x8920E99A5D648AA9,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	fdivd	%f2,	%f12,	%f18
	fmovrdlz	%i3,	%f16,	%f20
	fbu	%fcc2,	loop_707
	fxor	%f8,	%f26,	%f2
	alignaddr	%o0,	%i0,	%i7
	nop
	set	0x70, %g6
	std	%f18,	[%l7 + %g6]
loop_707:
	sir	0x168D
	wr	%g0,	0x81,	%asi
	ldstuba	[%l7 + 0x5F] %asi,	%l2
	fmovrdgez	%o5,	%f28,	%f0
	movne	%icc,	%i2,	%l4
	fnot2s	%f18,	%f5
	te	%xcc,	0x0
	smulcc	%i4,	0x1F2A,	%i6
	fmovde	%icc,	%f0,	%f9
	tvc	%icc,	0x2
	tpos	%xcc,	0x7
	movre	%o1,	0x12F,	%o3
	orncc	%o7,	%g4,	%l5
	fmovse	%icc,	%f16,	%f7
	udivx	%g3,	0x00A7,	%g7
	subccc	%o6,	%g1,	%o2
	movleu	%icc,	%l6,	%l1
	tle	%xcc,	0x4
	wr	%g0,	0x88,	%asi
	swapa	[%l7 + 0x18] %asi,	%l0
	bge	loop_708
	bcc,a,pn	%xcc,	loop_709
	tcs	%xcc,	0x5
	lduw	[%l7 + 0x44],	%g2
loop_708:
	movne	%xcc,	%l3,	%g5
loop_709:
	fmul8sux16	%f30,	%f16,	%f0
	udivx	%o4,	0x10F2,	%g6
	bvc,a	loop_710
	tcc	%icc,	0x4
	or	%i5,	%i1,	%i3
	alignaddrl	%i0,	%i7,	%o0
loop_710:
	fornot1s	%f10,	%f16,	%f15
	orcc	%l2,	0x183A,	%i2
	fzero	%f26
	fcmpgt16	%f18,	%f12,	%o5
	wr	%g0,	0x88,	%asi
	swapa	[%l7 + 0x74] %asi,	%i4
	alignaddr	%i6,	%o1,	%l4
	fmovdpos	%icc,	%f0,	%f3
	movge	%icc,	%o3,	%g4
	movrgez	%l5,	0x1B6,	%g3
	wr	%g0,	0x0c,	%asi
	ldxa	[%l7 + 0x20] %asi,	%g7
	sll	%o7,	0x1C,	%o6
	edge8ln	%g1,	%l6,	%o2
	fmovsneg	%xcc,	%f28,	%f24
	and	%l0,	0x08CA,	%l1
	lduh	[%l7 + 0x70],	%l3
	fmovde	%icc,	%f31,	%f15
	smul	%g2,	0x1000,	%g5
	nop
	setx	0xAE4714C101ED4130,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0x14912A83B737430D,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	fmuld	%f16,	%f14,	%f12
	movcs	%xcc,	%o4,	%g6
	movg	%xcc,	%i1,	%i5
	subccc	%i0,	%i7,	%i3
	movne	%icc,	%o0,	%i2
	nop
	setx	0x702893ADC0694385,	%l0,	%l6
	stx	%l6,	[%l7 + 0x18]
	ldx	[%l7 + 0x18],	%fsr
	tneg	%xcc,	0x6
	fmovdpos	%xcc,	%f17,	%f4
	tleu	%xcc,	0x7
	fpack32	%f6,	%f20,	%f24
	call	loop_711
	swap	[%l7 + 0x3C],	%o5
	movneg	%xcc,	%l2,	%i4
	edge16n	%o1,	%l4,	%i6
loop_711:
	movne	%xcc,	%o3,	%g4
	fbul,a	%fcc0,	loop_712
	fmovsvs	%xcc,	%f7,	%f2
	fbge	%fcc2,	loop_713
	tgu	%icc,	0x0
loop_712:
	edge32l	%l5,	%g7,	%o7
	wr	%g0,	0x04,	%asi
	stwa	%o6,	[%l7 + 0x08] %asi
loop_713:
	orn	%g3,	%l6,	%g1
	fpack16	%f8,	%f15
	stx	%o2,	[%l7 + 0x60]
	swap	[%l7 + 0x74],	%l0
	orn	%l3,	%l1,	%g2
	mova	%xcc,	%g5,	%o4
	ldsh	[%l7 + 0x38],	%g6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x1C, %o5
	lda	[%l7 + %o5] 0x88,	%f2
	movcs	%xcc,	%i1,	%i0
	tsubcctv	%i7,	%i5,	%i3
	fzeros	%f19
	membar	0x77
	taddcc	%o0,	0x1451,	%i2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbl,a	%fcc1,	loop_714
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bneg,a	loop_715
	nop
	fitod	%f12,	%f18
	fdtox	%f18,	%f22
loop_714:
	fnand	%f28,	%f24,	%f4
	xnor	%l2,	0x13F8,	%i4
loop_715:
	fandnot1s	%f20,	%f13,	%f20
	srlx	%o5,	%l4,	%o1
	tne	%icc,	0x0
	fbul	%fcc2,	loop_716
	flush	%l7 + 0x24
	set	0x70, %g4
	prefetcha	[%l7 + %g4] 0x80,	 0x0
loop_716:
	tcc	%xcc,	0x0
	fmovsn	%xcc,	%f16,	%f26
	mulx	%o3,	%l5,	%g7
	srlx	%g4,	%o6,	%o7
	tg	%icc,	0x0
	te	%xcc,	0x6
	movneg	%icc,	%g3,	%g1
	edge8ln	%l6,	%l0,	%o2
	sll	%l3,	0x1D,	%g2
	alignaddr	%l1,	%g5,	%g6
	fmul8x16au	%f18,	%f9,	%f18
	stx	%o4,	[%l7 + 0x18]
	tvc	%xcc,	0x2
	brz	%i1,	loop_717
	edge8n	%i7,	%i0,	%i3
	ldub	[%l7 + 0x61],	%o0
	orncc	%i5,	%l2,	%i4
loop_717:
	fbuge,a	%fcc1,	loop_718
	movl	%xcc,	%i2,	%l4
	edge16	%o1,	%i6,	%o5
	smul	%l5,	0x1E90,	%o3
loop_718:
	tle	%xcc,	0x2
	tleu	%xcc,	0x2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mulscc	%g7,	%g4,	%o6
	wr	%g0,	0x80,	%asi
	prefetcha	[%l7 + 0x68] %asi,	 0x0
	brnz	%g3,	loop_719
	faligndata	%f12,	%f18,	%f2
	orn	%g1,	%l0,	%o2
	edge8l	%l3,	%l6,	%g2
loop_719:
	mulscc	%g5,	%l1,	%o4
	fmul8x16al	%f1,	%f12,	%f28
	andncc	%i1,	%g6,	%i7
	edge32n	%i0,	%o0,	%i5
	movvc	%icc,	%l2,	%i4
	addccc	%i3,	%i2,	%l4
	fmovdleu	%xcc,	%f28,	%f27
	wr	%g0,	0x11,	%asi
	stha	%i6,	[%l7 + 0x68] %asi
	orncc	%o5,	0x0238,	%o1
	fpadd16s	%f22,	%f29,	%f1
	add	%l7,	0x70,	%l6
	wr	%g0,	0x0c,	%asi
	casa	[%l6] 0x0c,	%l5,	%g7
	ldstub	[%l7 + 0x7F],	%o3
	xnorcc	%o6,	0x1797,	%g4
	fmovrdgez	%g3,	%f18,	%f10
	movgu	%xcc,	%g1,	%l0
	fpsub32s	%f9,	%f4,	%f17
	movg	%icc,	%o2,	%l3
	tle	%xcc,	0x7
	bneg,a,pt	%xcc,	loop_720
	fba,a	%fcc0,	loop_721
	tvc	%xcc,	0x1
	alignaddr	%l6,	%o7,	%g5
loop_720:
	nop
	wr	%g0,	0x2a,	%asi
	stba	%g2,	[%l7 + 0x75] %asi
	membar	#Sync
loop_721:
	fandnot2s	%f23,	%f19,	%f23
	fbue,a	%fcc1,	loop_722
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8ln	%o4,	%i1,	%l1
	movcc	%icc,	%g6,	%i0
loop_722:
	nop
	fitos	%f8,	%f19
	andncc	%i7,	%o0,	%l2
	for	%f22,	%f30,	%f26
	te	%icc,	0x5
	mulx	%i4,	%i5,	%i2
	fnot1s	%f30,	%f1
	fbug,a	%fcc1,	loop_723
	tvc	%xcc,	0x6
	fmul8sux16	%f20,	%f22,	%f18
	tn	%xcc,	0x3
loop_723:
	array8	%l4,	%i6,	%i3
	movleu	%xcc,	%o1,	%l5
	movl	%xcc,	%o5,	%g7
	set	0x28, %g3
	sta	%f20,	[%l7 + %g3] 0x11
	fornot2s	%f8,	%f10,	%f28
	tgu	%icc,	0x7
	or	%o6,	%o3,	%g4
	tge	%icc,	0x7
	and	%g3,	%l0,	%g1
	movl	%xcc,	%l3,	%o2
	movgu	%xcc,	%l6,	%g5
	fmul8x16	%f30,	%f10,	%f28
	tcc	%icc,	0x5
	movl	%icc,	%o7,	%g2
	movrgz	%i1,	0x11E,	%o4
	mulscc	%g6,	%i0,	%l1
	sub	%i7,	%o0,	%l2
	fblg	%fcc1,	loop_724
	tleu	%icc,	0x1
	smulcc	%i5,	%i2,	%l4
	tpos	%xcc,	0x7
loop_724:
	edge32n	%i6,	%i4,	%o1
	movleu	%xcc,	%l5,	%i3
	set	0x48, %i5
	stwa	%g7,	[%l7 + %i5] 0x2b
	membar	#Sync
	smulcc	%o5,	0x108B,	%o6
	alignaddr	%g4,	%o3,	%g3
	brz,a	%g1,	loop_725
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fblg,a	%fcc3,	loop_726
	movg	%icc,	%l0,	%o2
loop_725:
	ldd	[%l7 + 0x38],	%i6
	edge32	%l3,	%g5,	%o7
loop_726:
	addccc	%g2,	0x13EB,	%i1
	fornot2	%f2,	%f10,	%f6
	movvc	%icc,	%g6,	%i0
	movrgez	%l1,	%o4,	%i7
	movrlez	%l2,	0x169,	%o0
	mulscc	%i2,	%l4,	%i5
	subc	%i6,	0x171D,	%o1
	movvs	%xcc,	%i4,	%l5
	lduh	[%l7 + 0x4C],	%g7
	lduh	[%l7 + 0x2A],	%i3
	fmovrsgz	%o6,	%f6,	%f8
	fbg,a	%fcc3,	loop_727
	nop
	setx	0xE9A34E84,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f16
	setx	0x79A87020,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f13
	fdivs	%f13,	%f16,	%f6
	fsrc2	%f6,	%f12
	andncc	%o5,	%g4,	%g3
loop_727:
	fmovrslz	%o3,	%f0,	%f14
	fmovd	%f8,	%f6
	movgu	%icc,	%l0,	%o2
	edge8	%l6,	%l3,	%g1
	fblg	%fcc2,	loop_728
	fmovde	%icc,	%f7,	%f30
	movrlez	%o7,	0x1CB,	%g2
	movrne	%g5,	%g6,	%i0
loop_728:
	tsubcc	%l1,	%o4,	%i7
	fcmpgt32	%f8,	%f10,	%i1
	movrgez	%l2,	%i2,	%o0
	fmovdgu	%icc,	%f14,	%f19
	xnorcc	%i5,	0x0175,	%i6
	nop
	setx	loop_729,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fpadd16	%f10,	%f30,	%f24
	edge8l	%l4,	%i4,	%l5
	srlx	%g7,	0x04,	%i3
loop_729:
	fmovrdlez	%o1,	%f30,	%f16
	set	0x08, %i4
	sta	%f12,	[%l7 + %i4] 0x15
	fcmpgt32	%f24,	%f28,	%o5
	edge16	%g4,	%o6,	%g3
	tsubcctv	%o3,	0x1232,	%o2
	tgu	%icc,	0x6
	nop
	set	0x5C, %i6
	ldsw	[%l7 + %i6],	%l0
	tge	%xcc,	0x4
	bpos,a	loop_730
	tcs	%xcc,	0x2
	fmovrsgz	%l3,	%f12,	%f2
	fcmpeq16	%f18,	%f28,	%g1
loop_730:
	bvc,pn	%xcc,	loop_731
	and	%l6,	0x195B,	%g2
	stb	%g5,	[%l7 + 0x35]
	edge8	%o7,	%g6,	%l1
loop_731:
	fmovdvs	%xcc,	%f15,	%f24
	mova	%icc,	%i0,	%o4
	movpos	%icc,	%i7,	%i1
	fble	%fcc0,	loop_732
	nop
	set	0x18, %i0
	stb	%i2,	[%l7 + %i0]
	fba,a	%fcc0,	loop_733
	pdist	%f2,	%f28,	%f20
loop_732:
	popc	%o0,	%i5
	wr	%g0,	0x81,	%asi
	ldstuba	[%l7 + 0x0F] %asi,	%l2
loop_733:
	sllx	%l4,	0x03,	%i4
	tg	%icc,	0x4
	xnorcc	%l5,	%g7,	%i6
	be,a	%icc,	loop_734
	subccc	%i3,	%o5,	%g4
	movrgez	%o1,	%o6,	%g3
	tne	%icc,	0x6
loop_734:
	andcc	%o2,	0x1681,	%o3
	subccc	%l0,	0x108C,	%g1
	bcc,a,pt	%xcc,	loop_735
	tgu	%icc,	0x4
	ta	%xcc,	0x2
	tpos	%xcc,	0x5
loop_735:
	nop
	wr	%g0,	0x23,	%asi
	stxa	%l3,	[%l7 + 0x70] %asi
	membar	#Sync
	movleu	%xcc,	%l6,	%g5
	sir	0x0C8D
	fmovdcc	%icc,	%f20,	%f24
	fpmerge	%f3,	%f0,	%f20
	sra	%o7,	0x1B,	%g6
	move	%xcc,	%g2,	%i0
	fcmple32	%f28,	%f30,	%o4
	edge32	%i7,	%l1,	%i2
	alignaddrl	%i1,	%i5,	%l2
	nop
	fitos	%f2,	%f8
	fstod	%f8,	%f6
	nop
	fitos	%f11,	%f26
	tvs	%icc,	0x4
	xnor	%l4,	0x127C,	%i4
	andncc	%o0,	%l5,	%i6
	xorcc	%i3,	%o5,	%g7
	edge32ln	%o1,	%o6,	%g4
	tsubcc	%o2,	%o3,	%g3
	fmovrdlez	%g1,	%f12,	%f10
	fmovsg	%xcc,	%f30,	%f15
	ldsb	[%l7 + 0x7B],	%l3
	subcc	%l0,	0x1C0B,	%l6
	fbg	%fcc2,	loop_736
	movcc	%xcc,	%o7,	%g6
	wr	%g0,	0x80,	%asi
	swapa	[%l7 + 0x64] %asi,	%g5
loop_736:
	fmovdn	%icc,	%f3,	%f24
	srlx	%i0,	0x10,	%g2
	add	%l7,	0x18,	%l6
	wr	%g0,	0x18,	%asi
	casa	[%l6] 0x18,	%o4,	%l1
	andn	%i2,	%i1,	%i7
	membar	0x2D
	edge8	%l2,	%l4,	%i4
	fmuld8ulx16	%f17,	%f30,	%f6
	pdist	%f6,	%f20,	%f4
	brz,a	%i5,	loop_737
	add	%o0,	%i6,	%l5
	wr	%g0,	0x2e,	%asi
	ldda	[%l7 + 0x40] %asi,	%o4
loop_737:
	fmovdn	%icc,	%f9,	%f7
	fbug	%fcc3,	loop_738
	andncc	%g7,	%o1,	%o6
	tge	%xcc,	0x1
	fand	%f2,	%f22,	%f2
loop_738:
	tl	%icc,	0x7
	fpackfix	%f16,	%f7
	set	0x48, %g5
	prefetcha	[%l7 + %g5] 0x10,	 0x0
	st	%f14,	[%l7 + 0x24]
	wr	%g0,	0x81,	%asi
	swapa	[%l7 + 0x58] %asi,	%o2
	ld	[%l7 + 0x64],	%f12
	fors	%f13,	%f21,	%f19
	sdivcc	%g4,	0x075A,	%o3
	fmovdcc	%xcc,	%f28,	%f27
	set	0x60, %g1
	stwa	%g3,	[%l7 + %g1] 0x10
	bl,a,pn	%icc,	loop_739
	sra	%l3,	%g1,	%l0
	fpsub32s	%f7,	%f9,	%f24
	bne	loop_740
loop_739:
	or	%l6,	%o7,	%g5
	addccc	%g6,	0x17BA,	%i0
	and	%g2,	0x04BA,	%o4
loop_740:
	tge	%xcc,	0x1
	fzero	%f8
	sdivx	%l1,	0x12EF,	%i2
	bn	loop_741
	nop
	setx	0x9EE8D976CECE7961,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0x631D99672FCBF1C6,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	faddd	%f10,	%f14,	%f30
	tg	%xcc,	0x2
	bshuffle	%f16,	%f6,	%f28
loop_741:
	orcc	%i1,	0x02FC,	%l2
	bvs,a,pn	%icc,	loop_742
	nop
	fitod	%f4,	%f10
	fdtox	%f10,	%f4
	fxtod	%f4,	%f20
	fmovdvc	%xcc,	%f4,	%f22
	fornot1s	%f11,	%f1,	%f22
loop_742:
	add	%i7,	0x0D81,	%l4
	movrlz	%i4,	0x0CD,	%i5
	orncc	%i6,	%o0,	%o5
	fbul	%fcc0,	loop_743
	movre	%l5,	0x117,	%g7
	fmovsg	%xcc,	%f28,	%f21
	fand	%f20,	%f16,	%f28
loop_743:
	tge	%icc,	0x0
	fmovsa	%icc,	%f24,	%f3
	movpos	%xcc,	%o6,	%i3
	fmuld8sux16	%f5,	%f4,	%f10
	movgu	%icc,	%o2,	%g4
	xnorcc	%o1,	%g3,	%o3
	fmovdne	%icc,	%f11,	%f17
	ldstub	[%l7 + 0x27],	%g1
	ba,a,pt	%xcc,	loop_744
	movre	%l0,	0x31D,	%l3
	edge8l	%o7,	%l6,	%g6
	mova	%xcc,	%i0,	%g2
loop_744:
	tneg	%icc,	0x2
	sllx	%g5,	%l1,	%i2
	sethi	0x10C2,	%i1
	movle	%icc,	%o4,	%l2
	fcmpeq16	%f10,	%f2,	%i7
	xnor	%l4,	0x03D8,	%i4
	set	0x0C, %l3
	lda	[%l7 + %l3] 0x81,	%f24
	call	loop_745
	fmovdvs	%icc,	%f17,	%f31
	alignaddr	%i5,	%o0,	%o5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_745:
	ld	[%l7 + 0x48],	%f27
	movrgez	%l5,	%g7,	%i6
	sll	%o6,	%o2,	%g4
	orcc	%o1,	%g3,	%i3
	sir	0x02D4
	sth	%g1,	[%l7 + 0x48]
	fmovdcc	%xcc,	%f22,	%f15
	andncc	%l0,	%l3,	%o3
	fand	%f4,	%f24,	%f28
	brlez,a	%o7,	loop_746
	brlz,a	%g6,	loop_747
	tleu	%xcc,	0x5
	fbue,a	%fcc0,	loop_748
loop_746:
	edge8	%i0,	%g2,	%g5
loop_747:
	movrne	%l1,	0x286,	%i2
	movleu	%icc,	%i1,	%l6
loop_748:
	fmovsvs	%icc,	%f0,	%f6
	array16	%o4,	%l2,	%l4
	flush	%l7 + 0x74
	brz	%i7,	loop_749
	sir	0x1132
	fbule	%fcc3,	loop_750
	movrgz	%i4,	0x0FD,	%o0
loop_749:
	andcc	%o5,	0x182E,	%i5
	mulscc	%g7,	%i6,	%o6
loop_750:
	nop
	set	0x2B, %l1
	ldstuba	[%l7 + %l1] 0x88,	%l5
	edge32	%g4,	%o1,	%o2
	mulscc	%g3,	%g1,	%i3
	add	%l7,	0x5C,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] %asi,	%l0,	%o3
	prefetch	[%l7 + 0x10],	 0x1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movl	%xcc,	%l3,	%g6
	tne	%xcc,	0x6
	fmul8x16	%f28,	%f26,	%f12
	ldx	[%l7 + 0x30],	%i0
	membar	0x03
	udiv	%g2,	0x099D,	%g5
	tsubcc	%l1,	%o7,	%i1
	set	0x2C, %l2
	ldsha	[%l7 + %l2] 0x19,	%l6
	edge8ln	%i2,	%l2,	%o4
	subccc	%i7,	%i4,	%l4
	srl	%o0,	%i5,	%o5
	fmovsle	%icc,	%f18,	%f13
	fpsub16	%f8,	%f14,	%f6
	movcs	%icc,	%i6,	%g7
	tle	%xcc,	0x4
	sdivcc	%o6,	0x1D8E,	%g4
	addccc	%o1,	%o2,	%l5
	tsubcc	%g1,	%g3,	%l0
	stw	%i3,	[%l7 + 0x40]
	bl	%icc,	loop_751
	nop
	set	0x5B, %o0
	ldsb	[%l7 + %o0],	%l3
	brnz	%o3,	loop_752
	fmovsleu	%xcc,	%f9,	%f5
loop_751:
	ldsh	[%l7 + 0x12],	%i0
	be	%icc,	loop_753
loop_752:
	fbuge	%fcc0,	loop_754
	movcs	%icc,	%g2,	%g5
	ta	%icc,	0x0
loop_753:
	movle	%icc,	%l1,	%g6
loop_754:
	fpadd32s	%f24,	%f3,	%f0
	alignaddr	%o7,	%l6,	%i2
	fpadd16	%f8,	%f22,	%f24
	nop
	setx	0x79E5C4345190EBA6,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	fsqrtd	%f22,	%f28
	fxors	%f19,	%f9,	%f25
	bvc,a	loop_755
	fmovsneg	%icc,	%f4,	%f5
	fmovsg	%icc,	%f7,	%f5
	fbue,a	%fcc1,	loop_756
loop_755:
	subc	%i1,	%l2,	%o4
	fandnot1	%f30,	%f24,	%f18
	subccc	%i4,	0x16EC,	%i7
loop_756:
	addc	%l4,	%o0,	%o5
	srax	%i5,	%g7,	%o6
	bgu,pt	%xcc,	loop_757
	fnot2s	%f13,	%f7
	bneg,a,pn	%xcc,	loop_758
	sdivx	%i6,	0x12F3,	%o1
loop_757:
	movl	%icc,	%g4,	%o2
	movl	%icc,	%g1,	%l5
loop_758:
	fcmpne16	%f0,	%f30,	%g3
	fandnot1	%f18,	%f22,	%f10
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sth	%l0,	[%l7 + 0x6E]
	movre	%l3,	0x1E6,	%i3
	add	%o3,	%g2,	%i0
	lduh	[%l7 + 0x5A],	%l1
	bpos,a,pt	%icc,	loop_759
	edge16	%g5,	%o7,	%l6
	movcs	%xcc,	%g6,	%i1
	brnz,a	%l2,	loop_760
loop_759:
	nop
	fitos	%f0,	%f23
	fstoi	%f23,	%f9
	tsubcc	%o4,	0x0B11,	%i4
	sethi	0x023F,	%i7
loop_760:
	orncc	%i2,	%o0,	%l4
	popc	%o5,	%g7
	srax	%i5,	0x1E,	%i6
	srl	%o6,	0x1C,	%g4
	fbe	%fcc2,	loop_761
	fmovspos	%icc,	%f1,	%f6
	fbul	%fcc1,	loop_762
	movl	%icc,	%o1,	%g1
loop_761:
	andcc	%l5,	0x1BAB,	%o2
	te	%icc,	0x7
loop_762:
	nop
	setx	0x1B74445F,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f16
	fsqrts	%f16,	%f30
	movrgz	%l0,	%l3,	%g3
	popc	0x13FA,	%i3
	fsrc1	%f30,	%f0
	wr	%g0,	0x11,	%asi
	lda	[%l7 + 0x18] %asi,	%f15
	nop
	setx loop_763, %l0, %l1
	jmpl %l1, %g2
	taddcc	%o3,	0x1B4C,	%i0
	udivx	%g5,	0x089A,	%o7
	tl	%icc,	0x5
loop_763:
	umul	%l6,	0x1450,	%g6
	wr	%g0,	0x11,	%asi
	sta	%f14,	[%l7 + 0x4C] %asi
	movcc	%xcc,	%i1,	%l1
	fsrc1	%f26,	%f20
	addc	%l2,	%o4,	%i4
	st	%f28,	[%l7 + 0x30]
	tg	%icc,	0x3
	tg	%icc,	0x4
	sra	%i2,	0x1D,	%i7
	sdivx	%l4,	0x029D,	%o5
	sra	%g7,	%i5,	%o0
	fornot2	%f16,	%f30,	%f0
	edge32ln	%o6,	%i6,	%o1
	stb	%g4,	[%l7 + 0x66]
	andcc	%l5,	%o2,	%g1
	mulscc	%l0,	0x1913,	%g3
	fabss	%f0,	%f30
	movrlez	%i3,	%l3,	%g2
	stx	%i0,	[%l7 + 0x40]
	movvc	%icc,	%g5,	%o7
	edge32l	%l6,	%o3,	%i1
	sethi	0x0992,	%g6
	lduh	[%l7 + 0x20],	%l1
	ble	%icc,	loop_764
	movgu	%xcc,	%o4,	%l2
	nop
	setx	0x35D66DEC,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f12
	setx	0xFDD7EE9E,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f1
	fadds	%f1,	%f12,	%f2
	bn,a	loop_765
loop_764:
	orn	%i2,	%i4,	%l4
	wr	%g0,	0x89,	%asi
	lduwa	[%l7 + 0x28] %asi,	%i7
loop_765:
	tcs	%xcc,	0x4
	xor	%o5,	%g7,	%o0
	ldsb	[%l7 + 0x5E],	%o6
	umulcc	%i5,	0x15FC,	%o1
	nop
	setx loop_766, %l0, %l1
	jmpl %l1, %i6
	ldsh	[%l7 + 0x7E],	%g4
	fbuge,a	%fcc0,	loop_767
	bl,a	loop_768
loop_766:
	fbge,a	%fcc3,	loop_769
	array8	%o2,	%l5,	%g1
loop_767:
	nop
	wr	%g0,	0x2f,	%asi
	stxa	%g3,	[%l7 + 0x28] %asi
	membar	#Sync
loop_768:
	sir	0x1364
loop_769:
	mova	%icc,	%l0,	%l3
	bn,a,pn	%xcc,	loop_770
	tg	%xcc,	0x4
	tvs	%xcc,	0x5
	fnor	%f20,	%f10,	%f8
loop_770:
	fpack16	%f28,	%f23
	flush	%l7 + 0x78
	movge	%xcc,	%i3,	%i0
	movgu	%xcc,	%g5,	%g2
	or	%l6,	%o7,	%o3
	edge8	%i1,	%l1,	%g6
	fexpand	%f7,	%f0
	nop
	fitod	%f14,	%f4
	udivcc	%o4,	0x0F03,	%i2
	fmovrslez	%l2,	%f23,	%f16
	movrne	%i4,	0x3AB,	%i7
	addccc	%l4,	%o5,	%o0
	tne	%xcc,	0x6
	movrlez	%o6,	%g7,	%i5
	or	%i6,	0x0A5A,	%o1
	fzeros	%f2
	umul	%g4,	0x0B05,	%o2
	fmovrslz	%l5,	%f5,	%f29
	fsrc2	%f22,	%f18
	fmovdcs	%icc,	%f16,	%f7
	sdivcc	%g1,	0x1EA1,	%g3
	tpos	%icc,	0x3
	or	%l0,	%l3,	%i0
	movrgez	%i3,	0x28D,	%g2
	ldsh	[%l7 + 0x48],	%g5
	movn	%xcc,	%l6,	%o7
	fands	%f31,	%f7,	%f7
	ldsb	[%l7 + 0x56],	%i1
	fmovrdgez	%l1,	%f4,	%f8
	sth	%o3,	[%l7 + 0x0C]
	fmovrdne	%g6,	%f6,	%f8
	set	0x50, %o7
	lduha	[%l7 + %o7] 0x10,	%o4
	edge16ln	%l2,	%i4,	%i7
	sub	%l4,	0x01D7,	%i2
	movrlez	%o5,	%o0,	%o6
	fmovrslez	%g7,	%f21,	%f22
	edge8l	%i5,	%o1,	%i6
	ld	[%l7 + 0x60],	%f5
	andcc	%o2,	%l5,	%g4
	be	%xcc,	loop_771
	array32	%g3,	%l0,	%l3
	nop
	setx	loop_772,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	orncc	%i0,	0x098C,	%i3
loop_771:
	nop
	wr	%g0,	0xeb,	%asi
	stba	%g2,	[%l7 + 0x59] %asi
	membar	#Sync
loop_772:
	fcmpgt16	%f0,	%f26,	%g5
	tl	%icc,	0x3
	fbge,a	%fcc3,	loop_773
	subcc	%g1,	%l6,	%o7
	edge32ln	%i1,	%l1,	%o3
	bne	%icc,	loop_774
loop_773:
	addccc	%o4,	%g6,	%l2
	edge16	%i7,	%l4,	%i4
	array32	%i2,	%o5,	%o6
loop_774:
	xorcc	%o0,	%g7,	%i5
	fmovrdlz	%i6,	%f8,	%f24
	ldsw	[%l7 + 0x74],	%o1
	umulcc	%l5,	0x0910,	%o2
	mova	%icc,	%g3,	%l0
	set	0x60, %l5
	ldxa	[%l7 + %l5] 0x18,	%g4
	bg,pn	%xcc,	loop_775
	movcc	%icc,	%i0,	%i3
	andncc	%g2,	%g5,	%l3
	fabss	%f14,	%f28
loop_775:
	fandnot2	%f2,	%f2,	%f0
	tcc	%xcc,	0x5
	udivcc	%l6,	0x1C44,	%g1
	nop
	setx	0xE404E6FE,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f29
	fsqrts	%f29,	%f23
	fcmpne32	%f28,	%f30,	%i1
	orn	%o7,	0x150D,	%o3
	subccc	%l1,	%g6,	%o4
	umulcc	%l2,	%l4,	%i7
	tneg	%icc,	0x1
	set	0x31, %g2
	ldsba	[%l7 + %g2] 0x81,	%i2
	udivcc	%o5,	0x1B85,	%o6
	nop
	fitos	%f9,	%f1
	fstox	%f1,	%f4
	fxtos	%f4,	%f19
	fmovrslez	%i4,	%f15,	%f21
	set	0x18, %i7
	stwa	%o0,	[%l7 + %i7] 0x88
	fmovdne	%xcc,	%f2,	%f19
	edge32n	%g7,	%i5,	%o1
	fexpand	%f26,	%f18
	mulscc	%i6,	%l5,	%g3
	bleu	%icc,	loop_776
	andncc	%l0,	%o2,	%i0
	sra	%i3,	%g4,	%g5
	tge	%icc,	0x6
loop_776:
	tneg	%icc,	0x2
	st	%f1,	[%l7 + 0x7C]
	subcc	%g2,	%l6,	%l3
	fble	%fcc2,	loop_777
	sllx	%g1,	0x0A,	%o7
	andcc	%i1,	%o3,	%g6
	wr	%g0,	0x88,	%asi
	lduba	[%l7 + 0x40] %asi,	%l1
loop_777:
	flush	%l7 + 0x78
	tvc	%xcc,	0x0
	be	loop_778
	sethi	0x14FD,	%o4
	tvc	%icc,	0x3
	movneg	%xcc,	%l2,	%l4
loop_778:
	movpos	%xcc,	%i7,	%i2
	umulcc	%o6,	0x1713,	%i4
	fmovdvc	%xcc,	%f26,	%f26
	sdiv	%o5,	0x0713,	%g7
	fnors	%f12,	%f21,	%f23
	edge8l	%o0,	%o1,	%i6
	brnz,a	%i5,	loop_779
	andn	%g3,	%l0,	%o2
	fmovrdgz	%i0,	%f30,	%f28
	tvs	%icc,	0x4
loop_779:
	fmovdn	%xcc,	%f27,	%f0
	fbul,a	%fcc0,	loop_780
	movrlez	%i3,	%l5,	%g5
	addcc	%g2,	%g4,	%l6
	fmovrdgez	%g1,	%f4,	%f30
loop_780:
	array16	%o7,	%i1,	%l3
	brgz,a	%g6,	loop_781
	brz	%o3,	loop_782
	swap	[%l7 + 0x08],	%o4
	or	%l2,	%l4,	%l1
loop_781:
	addcc	%i2,	0x102F,	%o6
loop_782:
	fmovrslez	%i7,	%f3,	%f20
	fnot2	%f20,	%f6
	andcc	%o5,	0x1D50,	%i4
	wr	%g0,	0x80,	%asi
	lda	[%l7 + 0x54] %asi,	%f23
	fandnot1	%f24,	%f26,	%f4
	subcc	%o0,	0x04B9,	%g7
	brnz,a	%o1,	loop_783
	ba,a,pn	%xcc,	loop_784
	nop
	fitos	%f6,	%f4
	fstod	%f4,	%f10
	orn	%i5,	%i6,	%l0
loop_783:
	nop
	set	0x40, %o2
	stba	%g3,	[%l7 + %o2] 0x11
loop_784:
	tcc	%icc,	0x7
	edge32n	%i0,	%i3,	%l5
	tcs	%xcc,	0x2
	xnorcc	%g5,	0x0DFD,	%g2
	tleu	%icc,	0x1
	tsubcc	%o2,	0x1480,	%g4
	fxor	%f8,	%f18,	%f30
	movvc	%xcc,	%g1,	%o7
	fbo,a	%fcc1,	loop_785
	tcs	%xcc,	0x4
	movvs	%xcc,	%l6,	%i1
	mova	%icc,	%l3,	%g6
loop_785:
	xnor	%o3,	0x013A,	%l2
	udiv	%o4,	0x1D1A,	%l4
	tneg	%xcc,	0x6
	fpsub16	%f0,	%f10,	%f24
	nop
	setx	0x93269D9B,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f11
	fsqrts	%f11,	%f3
	tsubcctv	%l1,	0x1463,	%o6
	fand	%f16,	%f8,	%f2
	and	%i7,	%i2,	%o5
	array8	%o0,	%i4,	%o1
	fmovdgu	%icc,	%f6,	%f29
	fnegs	%f27,	%f23
	movpos	%icc,	%i5,	%g7
	bleu,a,pt	%xcc,	loop_786
	brz,a	%l0,	loop_787
	bn,pt	%icc,	loop_788
	movre	%i6,	0x278,	%i0
loop_786:
	tl	%icc,	0x2
loop_787:
	edge16	%g3,	%l5,	%i3
loop_788:
	movn	%icc,	%g2,	%g5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udivx	%o2,	0x13B7,	%g4
	andn	%o7,	0x02E0,	%l6
	subc	%g1,	0x1C51,	%i1
	ba	loop_789
	nop
	fitos	%f11,	%f16
	fstod	%f16,	%f22
	edge16n	%g6,	%o3,	%l2
	subcc	%o4,	%l3,	%l1
loop_789:
	nop
	set	0x54, %o3
	sta	%f29,	[%l7 + %o3] 0x88
	tpos	%icc,	0x3
	mulscc	%l4,	0x14DC,	%o6
	fmovd	%f18,	%f20
	tl	%icc,	0x2
	orcc	%i7,	0x00FB,	%o5
	set	0x10, %i3
	lduha	[%l7 + %i3] 0x88,	%o0
	tneg	%xcc,	0x5
	udiv	%i4,	0x1B88,	%i2
	brgez,a	%o1,	loop_790
	movl	%icc,	%g7,	%i5
	ldd	[%l7 + 0x50],	%f22
	movle	%icc,	%l0,	%i0
loop_790:
	srax	%i6,	%g3,	%l5
	std	%f18,	[%l7 + 0x18]
	tpos	%xcc,	0x4
	array16	%i3,	%g2,	%o2
	call	loop_791
	tl	%xcc,	0x4
	subcc	%g5,	0x10F3,	%o7
	fmovdneg	%xcc,	%f28,	%f16
loop_791:
	fmovdg	%icc,	%f9,	%f1
	tcc	%icc,	0x3
	movrne	%g4,	%l6,	%i1
	fmovsneg	%icc,	%f23,	%f24
	fbge	%fcc0,	loop_792
	movrlz	%g6,	0x200,	%g1
	movvs	%xcc,	%o3,	%o4
	and	%l2,	0x0199,	%l3
loop_792:
	alignaddrl	%l4,	%o6,	%i7
	srlx	%l1,	0x09,	%o5
	movne	%xcc,	%o0,	%i2
	add	%o1,	0x0906,	%g7
	smul	%i4,	0x0BA7,	%l0
	fmovdvs	%icc,	%f22,	%f3
	stbar
	nop
	setx	0x9735D9EFB8AB719C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0x12BB431E37D6B902,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	fdivd	%f6,	%f28,	%f10
	set	0x44, %i1
	lduha	[%l7 + %i1] 0x80,	%i0
	fpsub32	%f20,	%f10,	%f26
	movgu	%icc,	%i5,	%g3
	edge16ln	%l5,	%i3,	%i6
	tleu	%icc,	0x2
	srlx	%g2,	%o2,	%g5
	tsubcc	%o7,	%g4,	%l6
	bl,pt	%icc,	loop_793
	fmovdne	%xcc,	%f27,	%f13
	ldsb	[%l7 + 0x7C],	%g6
	fbg	%fcc3,	loop_794
loop_793:
	nop
	setx	loop_795,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	edge16ln	%g1,	%i1,	%o3
	nop
	fitos	%f12,	%f18
	fstox	%f18,	%f0
loop_794:
	mulscc	%l2,	0x0434,	%l3
loop_795:
	fmovdle	%xcc,	%f16,	%f31
	xorcc	%o4,	0x042E,	%l4
	set	0x4C, %o1
	lda	[%l7 + %o1] 0x88,	%f24
	fnot2	%f16,	%f16
	andn	%i7,	0x1DC7,	%l1
	edge8ln	%o6,	%o0,	%o5
	smulcc	%o1,	%i2,	%g7
	ble,a,pn	%xcc,	loop_796
	edge32n	%i4,	%l0,	%i5
	udivcc	%g3,	0x028C,	%i0
	tvs	%icc,	0x2
loop_796:
	movcs	%icc,	%l5,	%i6
	set	0x58, %g7
	stxa	%g2,	[%l7 + %g7] 0x80
	array32	%o2,	%g5,	%o7
	brlez,a	%g4,	loop_797
	fmuld8sux16	%f15,	%f19,	%f16
	brlez,a	%i3,	loop_798
	udivcc	%l6,	0x1CB6,	%g1
loop_797:
	subccc	%i1,	0x0EF8,	%o3
	array8	%g6,	%l3,	%l2
loop_798:
	stw	%o4,	[%l7 + 0x64]
	tg	%xcc,	0x4
	be,a,pt	%xcc,	loop_799
	bvs,a,pt	%icc,	loop_800
	movvc	%icc,	%l4,	%l1
	tn	%icc,	0x0
loop_799:
	srax	%i7,	%o6,	%o0
loop_800:
	edge8	%o1,	%i2,	%o5
	ldd	[%l7 + 0x70],	%f0
	stb	%i4,	[%l7 + 0x6C]
	xorcc	%l0,	0x0A75,	%g7
	nop
	fitos	%f6,	%f22
	fstoi	%f22,	%f6
	ldd	[%l7 + 0x70],	%g2
	movneg	%xcc,	%i5,	%l5
	addc	%i0,	%g2,	%o2
	movrlez	%g5,	0x030,	%i6
	tsubcc	%g4,	0x1890,	%i3
	edge16	%l6,	%o7,	%g1
	nop
	fitod	%f6,	%f8
	fdtox	%f8,	%f16
	fxtod	%f16,	%f18
	movcc	%xcc,	%o3,	%g6
	be,a	%icc,	loop_801
	be,a,pt	%icc,	loop_802
	sir	0x1E24
	edge32	%i1,	%l3,	%o4
loop_801:
	sub	%l2,	%l1,	%i7
loop_802:
	tcs	%xcc,	0x7
	tl	%xcc,	0x7
	lduh	[%l7 + 0x60],	%l4
	add	%o6,	0x01D6,	%o0
	sir	0x1D3D
	array32	%o1,	%i2,	%i4
	addc	%l0,	0x04B3,	%o5
	ldsw	[%l7 + 0x6C],	%g3
	movn	%icc,	%g7,	%i5
	bne,pn	%icc,	loop_803
	fbn	%fcc2,	loop_804
	bge,pn	%xcc,	loop_805
	or	%i0,	0x0B67,	%g2
loop_803:
	stx	%l5,	[%l7 + 0x30]
loop_804:
	movrgz	%g5,	0x0C3,	%o2
loop_805:
	movne	%xcc,	%g4,	%i3
	set	0x30, %l6
	lduha	[%l7 + %l6] 0x04,	%i6
	movre	%l6,	%o7,	%o3
	subccc	%g6,	0x13F5,	%g1
	fcmple32	%f8,	%f12,	%i1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x18,	%asi
	ldstuba	[%l7 + 0x2C] %asi,	%l3
	wr	%g0,	0x89,	%asi
	lduwa	[%l7 + 0x58] %asi,	%l2
	sir	0x1625
	move	%xcc,	%o4,	%i7
	movne	%xcc,	%l4,	%l1
	edge32	%o0,	%o6,	%i2
	sra	%o1,	%l0,	%o5
	subcc	%g3,	0x02CB,	%i4
	nop
	setx	loop_806,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	xnorcc	%g7,	%i5,	%g2
	sllx	%i0,	0x1E,	%g5
	fandnot1	%f14,	%f22,	%f0
loop_806:
	array8	%l5,	%g4,	%o2
	tpos	%xcc,	0x7
	bleu,pn	%xcc,	loop_807
	subc	%i3,	0x1774,	%i6
	fbule,a	%fcc2,	loop_808
	movre	%o7,	0x2E3,	%l6
loop_807:
	fmovsgu	%icc,	%f27,	%f23
	brgz	%o3,	loop_809
loop_808:
	movne	%icc,	%g1,	%i1
	fpsub32s	%f30,	%f15,	%f15
	sdivx	%g6,	0x08DA,	%l3
loop_809:
	sllx	%l2,	%i7,	%l4
	tg	%icc,	0x5
	sub	%l1,	%o4,	%o0
	andn	%o6,	%i2,	%o1
	edge16l	%o5,	%l0,	%i4
	tle	%icc,	0x7
	xorcc	%g3,	0x073D,	%g7
	brlz,a	%i5,	loop_810
	stbar
	tcs	%xcc,	0x1
	tne	%xcc,	0x5
loop_810:
	edge32n	%i0,	%g5,	%l5
	tl	%icc,	0x2
	fblg,a	%fcc3,	loop_811
	array8	%g4,	%o2,	%i3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	call	loop_812
loop_811:
	edge32l	%i6,	%o7,	%l6
	or	%o3,	0x0A1C,	%g1
	add	%l7,	0x50,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%g2
	casxa	[%l6] 0x80,	%g2,	%i1
loop_812:
	fzero	%f28
	movleu	%xcc,	%l3,	%l2
	xnorcc	%g6,	%i7,	%l4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpsub32s	%f20,	%f28,	%f21
	brgz,a	%l1,	loop_813
	fandnot1s	%f9,	%f31,	%f29
	sllx	%o0,	%o4,	%o6
	edge8n	%o1,	%o5,	%l0
loop_813:
	ldx	[%l7 + 0x50],	%i4
	and	%g3,	0x1C59,	%g7
	edge8ln	%i5,	%i2,	%i0
	tneg	%icc,	0x7
	nop
	fitod	%f8,	%f18
	fdtos	%f18,	%f8
	orcc	%l5,	%g4,	%o2
	ldd	[%l7 + 0x18],	%f20
	nop
	setx	loop_814,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movrlz	%i3,	0x1FE,	%i6
	tvs	%icc,	0x5
	set	0x58, %l4
	stwa	%o7,	[%l7 + %l4] 0x04
loop_814:
	movle	%xcc,	%l6,	%o3
	movvc	%icc,	%g1,	%g5
	edge16ln	%i1,	%l3,	%l2
	movneg	%icc,	%g2,	%g6
	edge32	%l4,	%l1,	%i7
	movcs	%xcc,	%o0,	%o4
	tl	%xcc,	0x3
	edge16	%o1,	%o6,	%o5
	udivx	%i4,	0x1048,	%g3
	tvs	%icc,	0x7
	sub	%l0,	0x0ADF,	%g7
	nop
	setx	loop_815,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	ta	%icc,	0x5
	fxor	%f0,	%f6,	%f4
	sir	0x08AE
loop_815:
	stw	%i5,	[%l7 + 0x4C]
	wr	%g0,	0x80,	%asi
	ldstuba	[%l7 + 0x56] %asi,	%i2
	swap	[%l7 + 0x58],	%l5
	movg	%xcc,	%i0,	%g4
	bl	%xcc,	loop_816
	fsrc1	%f12,	%f10
	fpadd32s	%f29,	%f12,	%f11
	sth	%o2,	[%l7 + 0x68]
loop_816:
	tn	%xcc,	0x1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bcs,a,pn	%xcc,	loop_817
	nop
	setx loop_818, %l0, %l1
	jmpl %l1, %i3
	fones	%f18
	movcc	%xcc,	%o7,	%l6
loop_817:
	and	%o3,	%i6,	%g1
loop_818:
	sth	%g5,	[%l7 + 0x3E]
	fbul	%fcc2,	loop_819
	orn	%i1,	%l3,	%l2
	addccc	%g2,	%l4,	%l1
	movge	%icc,	%i7,	%g6
loop_819:
	edge32ln	%o4,	%o1,	%o6
	movne	%xcc,	%o0,	%o5
	xorcc	%g3,	0x0B7A,	%l0
	bn,a,pn	%icc,	loop_820
	fcmpne32	%f16,	%f16,	%g7
	movrlz	%i4,	0x052,	%i5
	movleu	%icc,	%l5,	%i0
loop_820:
	nop
	set	0x61, %l0
	lduba	[%l7 + %l0] 0x15,	%g4
	subc	%o2,	0x1516,	%i3
	srl	%o7,	0x18,	%i2
	alignaddrl	%l6,	%i6,	%o3
	movcc	%xcc,	%g1,	%i1
	addccc	%g5,	%l2,	%l3
	fbl	%fcc0,	loop_821
	tvs	%icc,	0x2
	std	%f22,	[%l7 + 0x18]
	fmul8x16au	%f27,	%f27,	%f28
loop_821:
	fbl,a	%fcc3,	loop_822
	movne	%icc,	%g2,	%l1
	stbar
	tne	%icc,	0x4
loop_822:
	tn	%xcc,	0x5
	fmovsle	%xcc,	%f26,	%f14
	taddcc	%l4,	0x1335,	%i7
	sdiv	%g6,	0x09AF,	%o4
	sethi	0x070C,	%o1
	movrlez	%o6,	%o0,	%g3
	fmovdpos	%xcc,	%f22,	%f8
	st	%f9,	[%l7 + 0x24]
	add	%o5,	0x12B9,	%l0
	sdivcc	%g7,	0x11A7,	%i4
	fbn	%fcc3,	loop_823
	swap	[%l7 + 0x1C],	%i5
	fmovsgu	%icc,	%f3,	%f8
	fmovrdlez	%i0,	%f26,	%f8
loop_823:
	edge8l	%g4,	%o2,	%l5
	sdivcc	%o7,	0x16EF,	%i2
	nop
	fitos	%f5,	%f15
	fstoi	%f15,	%f6
	nop
	setx loop_824, %l0, %l1
	jmpl %l1, %i3
	sdivcc	%l6,	0x1B10,	%o3
	andn	%i6,	0x0048,	%g1
	sub	%i1,	0x020C,	%g5
loop_824:
	fmovdcs	%xcc,	%f14,	%f19
	wr	%g0,	0x19,	%asi
	stba	%l3,	[%l7 + 0x56] %asi
	fmovdvs	%xcc,	%f27,	%f30
	sir	0x050F
	orncc	%l2,	0x044A,	%l1
	umulcc	%l4,	%g2,	%i7
	tleu	%xcc,	0x4
	subcc	%o4,	0x1A6F,	%o1
	stb	%g6,	[%l7 + 0x34]
	xnorcc	%o0,	%g3,	%o5
	orcc	%l0,	%o6,	%g7
	te	%icc,	0x2
	sub	%i5,	0x060E,	%i4
	fbu,a	%fcc1,	loop_825
	sth	%i0,	[%l7 + 0x78]
	fbu,a	%fcc1,	loop_826
	te	%icc,	0x4
loop_825:
	movn	%xcc,	%g4,	%o2
	movcc	%xcc,	%l5,	%o7
loop_826:
	andncc	%i2,	%l6,	%i3
	movrgez	%o3,	%i6,	%g1
	add	%i1,	%l3,	%g5
	add	%l2,	0x0CA8,	%l4
	movcc	%xcc,	%g2,	%i7
	wr	%g0,	0x10,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	wr	%g0,	0xea,	%asi
	stha	%l1,	[%l7 + 0x48] %asi
	membar	#Sync
	std	%f14,	[%l7 + 0x38]
	umul	%o4,	0x1E98,	%g6
	and	%o1,	0x187A,	%g3
	nop
	fitos	%f2,	%f15
	fstox	%f15,	%f8
	wr	%g0,	0x04,	%asi
	ldxa	[%l7 + 0x50] %asi,	%o0
	srax	%o5,	0x0F,	%o6
	alignaddr	%l0,	%i5,	%i4
	fmovsn	%icc,	%f29,	%f5
	movpos	%xcc,	%g7,	%i0
	fmovdl	%icc,	%f15,	%f29
	ta	%icc,	0x3
	fmovs	%f5,	%f6
	movrne	%g4,	%o2,	%l5
	movne	%xcc,	%i2,	%o7
	movvs	%icc,	%l6,	%o3
	udivcc	%i6,	0x07CB,	%g1
	edge8ln	%i1,	%i3,	%l3
	fmovsleu	%icc,	%f0,	%f19
	subc	%g5,	%l4,	%l2
	movcc	%icc,	%g2,	%l1
	fmovscs	%icc,	%f0,	%f8
	tsubcctv	%o4,	0x1339,	%g6
	umul	%o1,	%i7,	%g3
	nop
	fitos	%f13,	%f6
	movleu	%xcc,	%o0,	%o6
	edge32n	%o5,	%i5,	%l0
	movvc	%xcc,	%g7,	%i0
	movcs	%xcc,	%i4,	%o2
	set	0x7C, %o6
	lduha	[%l7 + %o6] 0x0c,	%g4
	movn	%xcc,	%i2,	%l5
	alignaddrl	%l6,	%o3,	%i6
	fmuld8sux16	%f15,	%f2,	%f0
	fmovdne	%icc,	%f17,	%f15
	fbl	%fcc1,	loop_827
	tvs	%icc,	0x2
	xor	%o7,	%g1,	%i3
	movle	%xcc,	%l3,	%i1
loop_827:
	movpos	%icc,	%l4,	%l2
	addccc	%g2,	0x0D3A,	%l1
	sethi	0x1190,	%g5
	alignaddr	%o4,	%g6,	%i7
	fbl,a	%fcc1,	loop_828
	movne	%icc,	%g3,	%o0
	edge8	%o1,	%o5,	%i5
	nop
	fitod	%f8,	%f10
	fdtox	%f10,	%f8
	fxtod	%f8,	%f24
loop_828:
	faligndata	%f28,	%f2,	%f30
	ldub	[%l7 + 0x0F],	%l0
	bge	loop_829
	tge	%icc,	0x5
	edge16	%g7,	%i0,	%i4
	nop
	setx	0x064D38CB,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f10
	setx	0x0FF7B39F,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f8
	fmuls	%f8,	%f10,	%f27
loop_829:
	brgz,a	%o6,	loop_830
	fbge	%fcc2,	loop_831
	andncc	%o2,	%i2,	%g4
	fbl,a	%fcc1,	loop_832
loop_830:
	fandnot1	%f16,	%f20,	%f6
loop_831:
	tsubcc	%l5,	0x1FE2,	%o3
	array16	%i6,	%o7,	%l6
loop_832:
	fmovs	%f0,	%f7
	movpos	%icc,	%i3,	%g1
	andn	%i1,	%l4,	%l2
	mulscc	%l3,	%g2,	%g5
	ldsh	[%l7 + 0x10],	%o4
	bvs,a	loop_833
	andn	%g6,	0x1508,	%l1
	subc	%g3,	%o0,	%i7
	edge16	%o1,	%i5,	%l0
loop_833:
	alignaddr	%o5,	%g7,	%i4
	te	%xcc,	0x1
	add	%o6,	0x1683,	%i0
	movgu	%icc,	%o2,	%i2
	nop
	fitos	%f13,	%f22
	taddcc	%l5,	%g4,	%i6
	movrne	%o7,	0x2F7,	%l6
	nop
	setx loop_834, %l0, %l1
	jmpl %l1, %i3
	fmovsl	%icc,	%f26,	%f28
	tvc	%icc,	0x2
	sth	%o3,	[%l7 + 0x74]
loop_834:
	nop
	wr	%g0,	0x18,	%asi
	lda	[%l7 + 0x20] %asi,	%f13
	sdivx	%g1,	0x17E1,	%i1
	set	0x31, %i2
	ldsba	[%l7 + %i2] 0x88,	%l2
	mulscc	%l3,	%g2,	%g5
	std	%f2,	[%l7 + 0x70]
	andcc	%o4,	0x1A6F,	%l4
	bleu,a,pn	%xcc,	loop_835
	ta	%xcc,	0x1
	fxors	%f10,	%f4,	%f0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_835:
	nop
	set	0x50, %o4
	ldxa	[%l7 + %o4] 0x18,	%g6
	movneg	%xcc,	%l1,	%o0
	brlez	%g3,	loop_836
	sllx	%i7,	0x0E,	%o1
	fbl	%fcc2,	loop_837
	ldsw	[%l7 + 0x60],	%l0
loop_836:
	movle	%icc,	%o5,	%g7
	fands	%f29,	%f6,	%f5
loop_837:
	ldd	[%l7 + 0x50],	%i4
	movle	%icc,	%i4,	%o6
	movn	%xcc,	%i0,	%o2
	array8	%i2,	%l5,	%g4
	fmovsa	%xcc,	%f29,	%f24
	tcs	%xcc,	0x3
	fmovdcc	%icc,	%f7,	%f22
	addccc	%o7,	%l6,	%i6
	addccc	%i3,	%g1,	%o3
	fbo	%fcc0,	loop_838
	fbl,a	%fcc1,	loop_839
	edge8ln	%i1,	%l2,	%l3
	ldd	[%l7 + 0x30],	%g4
loop_838:
	orncc	%o4,	%g2,	%g6
loop_839:
	and	%l1,	0x190F,	%o0
	fblg,a	%fcc3,	loop_840
	fmovse	%xcc,	%f1,	%f15
	fxor	%f10,	%f10,	%f4
	xnor	%g3,	0x1B65,	%l4
loop_840:
	sdiv	%o1,	0x0B86,	%i7
	srlx	%l0,	%o5,	%i5
	set	0x20, %g6
	lduwa	[%l7 + %g6] 0x19,	%g7
	edge16n	%i4,	%o6,	%i0
	bge	%xcc,	loop_841
	ld	[%l7 + 0x48],	%f4
	or	%o2,	0x190F,	%i2
	edge32l	%g4,	%l5,	%l6
loop_841:
	fmovsvc	%icc,	%f16,	%f10
	edge16ln	%i6,	%i3,	%g1
	addccc	%o3,	%o7,	%i1
	fmovdl	%icc,	%f19,	%f2
	fbn	%fcc2,	loop_842
	tge	%icc,	0x4
	ta	%xcc,	0x3
	sir	0x1111
loop_842:
	bne	loop_843
	edge16n	%l2,	%l3,	%o4
	taddcc	%g5,	%g6,	%l1
	edge8ln	%g2,	%g3,	%l4
loop_843:
	taddcc	%o1,	%i7,	%l0
	ta	%icc,	0x0
	xnor	%o5,	0x1DEE,	%i5
	brgz,a	%g7,	loop_844
	movvc	%icc,	%o0,	%i4
	fbn	%fcc1,	loop_845
	movrgez	%i0,	%o2,	%o6
loop_844:
	movre	%i2,	%g4,	%l5
	umul	%i6,	0x18D9,	%l6
loop_845:
	nop
	wr	%g0,	0x2b,	%asi
	stha	%i3,	[%l7 + 0x1A] %asi
	membar	#Sync
	fpadd16	%f2,	%f4,	%f16
	movgu	%icc,	%g1,	%o7
	wr	%g0,	0x81,	%asi
	sta	%f4,	[%l7 + 0x18] %asi
	edge32	%i1,	%l2,	%l3
	fbne,a	%fcc1,	loop_846
	fzeros	%f5
	wr	%g0,	0x2a,	%asi
	stba	%o3,	[%l7 + 0x7E] %asi
	membar	#Sync
loop_846:
	nop
	wr	%g0,	0x81,	%asi
	ldsba	[%l7 + 0x4E] %asi,	%g5
	fmovsle	%xcc,	%f4,	%f8
	andcc	%o4,	%l1,	%g6
	andncc	%g3,	%g2,	%l4
	wr	%g0,	0x04,	%asi
	lduha	[%l7 + 0x74] %asi,	%o1
	fmovs	%f18,	%f14
	edge16l	%i7,	%l0,	%o5
	xor	%g7,	%o0,	%i5
	tsubcc	%i4,	0x010D,	%i0
	st	%f18,	[%l7 + 0x10]
	fmul8x16au	%f13,	%f21,	%f18
	andncc	%o6,	%o2,	%g4
	sllx	%i2,	%l5,	%l6
	tleu	%icc,	0x2
	fmovdle	%icc,	%f16,	%f21
	nop
	setx	0xA8B147024D3E0E2D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	fsqrtd	%f8,	%f10
	fbne	%fcc3,	loop_847
	sll	%i3,	%g1,	%o7
	fcmple32	%f14,	%f2,	%i1
	fmovda	%icc,	%f12,	%f26
loop_847:
	fmovrsgez	%l2,	%f26,	%f15
	srlx	%i6,	%l3,	%g5
	movcc	%xcc,	%o4,	%o3
	array32	%l1,	%g6,	%g3
	wr	%g0,	0x80,	%asi
	ldsba	[%l7 + 0x46] %asi,	%l4
	nop
	setx	0x1075DDC8,	%l0,	%l6
	st	%l6,	[%l7 + 0x68]
	ld	[%l7 + 0x68],	%fsr
	movl	%icc,	%g2,	%i7
	fmovrdlz	%o1,	%f16,	%f2
	nop
	setx	0xE453481BF193C6DC,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0xF04664E4A8C57B92,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	faddd	%f22,	%f2,	%f22
	edge32ln	%o5,	%l0,	%o0
	edge8	%g7,	%i4,	%i5
	edge16l	%i0,	%o2,	%g4
	sir	0x0FBE
	srax	%o6,	%l5,	%l6
	add	%l7,	0x50,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] %asi,	%i2,	%i3
	bneg,a	%xcc,	loop_848
	std	%f14,	[%l7 + 0x10]
	brgez	%o7,	loop_849
	udivcc	%i1,	0x16D4,	%g1
loop_848:
	bn,pn	%icc,	loop_850
	srax	%l2,	%i6,	%g5
loop_849:
	movvc	%icc,	%l3,	%o4
	bvs,pn	%icc,	loop_851
loop_850:
	fmovd	%f26,	%f4
	st	%f31,	[%l7 + 0x6C]
	brgez	%o3,	loop_852
loop_851:
	edge32n	%l1,	%g6,	%g3
	ldd	[%l7 + 0x58],	%f0
	orn	%g2,	%i7,	%o1
loop_852:
	fpsub16s	%f15,	%f4,	%f27
	xorcc	%l4,	0x0A46,	%l0
	umulcc	%o5,	%o0,	%g7
	subc	%i4,	%i0,	%o2
	sub	%i5,	%o6,	%g4
	bneg,a,pt	%xcc,	loop_853
	tgu	%icc,	0x4
	nop
	setx	0xE1425ABD,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f16
	setx	0x514E147E,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f1
	fsubs	%f1,	%f16,	%f31
	wr	%g0,	0x19,	%asi
	ldswa	[%l7 + 0x24] %asi,	%l6
loop_853:
	tge	%icc,	0x4
	sub	%l5,	0x1CD8,	%i3
	fmovrdne	%i2,	%f18,	%f12
	ta	%xcc,	0x0
	andncc	%o7,	%i1,	%g1
	bvs,pn	%icc,	loop_854
	fmovrdlez	%i6,	%f26,	%f14
	movl	%icc,	%g5,	%l3
	sub	%l2,	0x0EF6,	%o3
loop_854:
	popc	%o4,	%l1
	fmovsgu	%xcc,	%f9,	%f27
	or	%g6,	%g3,	%g2
	brlez	%o1,	loop_855
	orncc	%i7,	0x10A7,	%l0
	add	%o5,	0x1AA7,	%l4
	sir	0x134E
loop_855:
	bpos,a	%icc,	loop_856
	fmul8x16al	%f12,	%f21,	%f26
	bgu,pt	%icc,	loop_857
	fpsub32s	%f26,	%f7,	%f16
loop_856:
	nop
	set	0x0C, %g4
	ldswa	[%l7 + %g4] 0x88,	%o0
loop_857:
	movrgz	%i4,	%g7,	%i0
	move	%icc,	%o2,	%o6
	smul	%g4,	0x1AA4,	%i5
	addc	%l5,	%l6,	%i3
	stb	%o7,	[%l7 + 0x35]
	wr	%g0,	0x04,	%asi
	lduwa	[%l7 + 0x54] %asi,	%i2
	stbar
	tcs	%icc,	0x0
	movne	%xcc,	%g1,	%i1
	tl	%icc,	0x7
	tcs	%icc,	0x2
	flush	%l7 + 0x14
	tsubcctv	%i6,	%l3,	%l2
	tleu	%icc,	0x7
	tl	%xcc,	0x5
	fxors	%f10,	%f27,	%f30
	fnor	%f12,	%f2,	%f6
	tg	%xcc,	0x3
	xnorcc	%g5,	%o3,	%l1
	nop
	setx	loop_858,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	smulcc	%o4,	%g6,	%g3
	subc	%o1,	%g2,	%i7
	fsrc1s	%f2,	%f2
loop_858:
	bneg,a,pn	%icc,	loop_859
	movvc	%icc,	%o5,	%l4
	tne	%icc,	0x4
	addccc	%o0,	%l0,	%i4
loop_859:
	array8	%g7,	%o2,	%o6
	xor	%g4,	%i5,	%l5
	fmovdvc	%icc,	%f11,	%f29
	fand	%f22,	%f16,	%f10
	wr	%g0,	0x18,	%asi
	lduba	[%l7 + 0x2A] %asi,	%i0
	fpsub16s	%f0,	%f1,	%f31
	membar	#Sync
	wr	%g0,	0x1e,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	and	%i3,	%l6,	%o7
	movl	%icc,	%g1,	%i1
	add	%l7,	0x3C,	%l6
	wr	%g0,	0x18,	%asi
	casa	[%l6] %asi,	%i6,	%l3
	edge32ln	%i2,	%l2,	%g5
	andn	%l1,	0x031D,	%o4
	andcc	%g6,	%o3,	%g3
	alignaddr	%g2,	%o1,	%o5
	andn	%i7,	%l4,	%l0
	fcmpne16	%f4,	%f26,	%o0
	mulscc	%i4,	0x0087,	%g7
	tne	%icc,	0x7
	mulscc	%o6,	0x179A,	%g4
	edge8ln	%o2,	%l5,	%i0
	wr	%g0,	0x80,	%asi
	lduba	[%l7 + 0x72] %asi,	%i3
	wr	%g0,	0x88,	%asi
	lduwa	[%l7 + 0x14] %asi,	%l6
	tsubcctv	%o7,	0x05FA,	%i5
	fmovsa	%xcc,	%f3,	%f3
	set	0x38, %o5
	sta	%f16,	[%l7 + %o5] 0x18
	fmovdvc	%xcc,	%f15,	%f23
	movneg	%xcc,	%i1,	%g1
	movcc	%icc,	%l3,	%i6
	tle	%xcc,	0x3
	movrlez	%l2,	0x353,	%i2
	ta	%xcc,	0x6
	popc	%g5,	%l1
	movpos	%xcc,	%o4,	%o3
	addccc	%g6,	%g2,	%g3
	tneg	%xcc,	0x7
	nop
	setx loop_860, %l0, %l1
	jmpl %l1, %o1
	ta	%xcc,	0x0
	stx	%o5,	[%l7 + 0x58]
	addc	%i7,	%l0,	%o0
loop_860:
	taddcctv	%l4,	0x1DF1,	%g7
	movle	%xcc,	%i4,	%o6
	fnor	%f22,	%f6,	%f12
	fmul8ulx16	%f12,	%f4,	%f20
	set	0x5C, %i5
	ldswa	[%l7 + %i5] 0x04,	%o2
	fmovsne	%icc,	%f12,	%f5
	brgz,a	%l5,	loop_861
	orncc	%g4,	%i3,	%l6
	sdivx	%i0,	0x18AE,	%i5
	fmovd	%f30,	%f16
loop_861:
	andcc	%o7,	0x01EB,	%i1
	sdivx	%l3,	0x1C45,	%i6
	edge8l	%g1,	%i2,	%g5
	movcc	%xcc,	%l1,	%o4
	and	%o3,	0x17EB,	%g6
	umulcc	%g2,	0x053F,	%l2
	tcs	%xcc,	0x4
	movge	%xcc,	%o1,	%g3
	smul	%i7,	0x12F4,	%l0
	brz	%o5,	loop_862
	udiv	%l4,	0x0607,	%g7
	and	%i4,	0x1445,	%o6
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
loop_862:
	fnands	%f28,	%f26,	%f21
	set	0x22, %g3
	ldstuba	[%l7 + %g3] 0x81,	%o0
loop_863:
	udivx	%l5,	0x0B8F,	%o2
	or	%i3,	%l6,	%i0
	sdivcc	%g4,	0x04CB,	%i5
	orncc	%i1,	0x1AD3,	%o7
	add	%l7,	0x60,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] %asi,	%l3,	%i6
	set	0x64, %i6
	stwa	%g1,	[%l7 + %i6] 0x88
	tn	%xcc,	0x4
	orcc	%i2,	0x0313,	%g5
	fmovsgu	%icc,	%f31,	%f30
	taddcc	%o4,	%l1,	%o3
	prefetch	[%l7 + 0x24],	 0x3
	fmovrdgez	%g2,	%f22,	%f18
	sll	%l2,	0x0A,	%o1
	fbuge,a	%fcc3,	loop_864
	fpsub32	%f18,	%f28,	%f18
	nop
	setx	loop_865,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movcc	%xcc,	%g3,	%i7
loop_864:
	srax	%l0,	0x0B,	%o5
	for	%f16,	%f22,	%f0
loop_865:
	fmovdvc	%icc,	%f24,	%f13
	wr	%g0,	0x80,	%asi
	lduha	[%l7 + 0x20] %asi,	%l4
	nop
	fitos	%f14,	%f14
	fstoi	%f14,	%f21
	bpos,a	%xcc,	loop_866
	mova	%icc,	%g6,	%i4
	orcc	%g7,	%o0,	%o6
	addc	%l5,	0x1DB0,	%i3
loop_866:
	array8	%o2,	%l6,	%i0
	sdivx	%i5,	0x192C,	%i1
	and	%o7,	0x03B3,	%g4
	fpsub32s	%f28,	%f8,	%f12
	tn	%xcc,	0x3
	wr	%g0,	0x04,	%asi
	ldsha	[%l7 + 0x44] %asi,	%l3
	udivx	%g1,	0x164C,	%i2
	edge8	%g5,	%o4,	%i6
	tle	%icc,	0x1
	fmovsge	%icc,	%f4,	%f28
	fbn	%fcc3,	loop_867
	tle	%xcc,	0x7
	nop
	fitod	%f0,	%f20
	fdtos	%f20,	%f28
	movne	%icc,	%o3,	%l1
loop_867:
	fsrc2	%f2,	%f18
	movle	%xcc,	%l2,	%o1
	be	%icc,	loop_868
	xorcc	%g2,	%i7,	%g3
	movpos	%icc,	%o5,	%l4
	ldstub	[%l7 + 0x6E],	%l0
loop_868:
	tcc	%xcc,	0x0
	fmovdne	%icc,	%f18,	%f14
	sub	%g6,	0x1E61,	%g7
	wr	%g0,	0x89,	%asi
	ldxa	[%l7 + 0x28] %asi,	%i4
	umulcc	%o6,	%l5,	%o0
	tsubcc	%o2,	%l6,	%i0
	wr	%g0,	0x11,	%asi
	prefetcha	[%l7 + 0x08] %asi,	 0x1
	move	%icc,	%i3,	%o7
	smul	%g4,	0x0B71,	%i1
	movcs	%xcc,	%g1,	%l3
	edge32	%g5,	%i2,	%i6
	fpsub16s	%f15,	%f22,	%f5
	brgez,a	%o4,	loop_869
	move	%xcc,	%o3,	%l1
	udivx	%o1,	0x0C21,	%l2
	te	%xcc,	0x6
loop_869:
	edge8	%g2,	%g3,	%i7
	popc	0x1998,	%o5
	sll	%l4,	0x14,	%g6
	sub	%l0,	0x19E8,	%g7
	sir	0x0CF8
	andcc	%i4,	0x1317,	%l5
	orcc	%o0,	%o2,	%l6
	sth	%o6,	[%l7 + 0x6A]
	sub	%i0,	%i5,	%i3
	fmovrsne	%g4,	%f27,	%f18
	edge8n	%i1,	%o7,	%l3
	flush	%l7 + 0x18
	andn	%g1,	%i2,	%i6
	bne,a	loop_870
	fmovs	%f13,	%f3
	or	%g5,	0x02A5,	%o3
	edge8ln	%l1,	%o4,	%l2
loop_870:
	movle	%xcc,	%o1,	%g3
	tle	%icc,	0x2
	fbe,a	%fcc2,	loop_871
	prefetch	[%l7 + 0x70],	 0x3
	fmul8x16al	%f30,	%f19,	%f28
	add	%g2,	0x050D,	%i7
loop_871:
	bshuffle	%f22,	%f28,	%f8
	fmovscs	%xcc,	%f11,	%f8
	fabsd	%f22,	%f16
	andn	%l4,	%g6,	%o5
	srl	%g7,	%i4,	%l0
	srl	%l5,	0x03,	%o2
	taddcctv	%o0,	%l6,	%i0
	ta	%icc,	0x2
	edge8ln	%i5,	%i3,	%g4
	movle	%icc,	%i1,	%o7
	sllx	%o6,	%g1,	%i2
	brlz	%l3,	loop_872
	fmovrdne	%i6,	%f12,	%f30
	membar	#Sync
	wr	%g0,	0xf1,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
loop_872:
	movvc	%xcc,	%g5,	%l1
	orncc	%o3,	%l2,	%o4
	smulcc	%g3,	0x0611,	%g2
	fabss	%f6,	%f13
	sdivcc	%i7,	0x0C3A,	%l4
	edge32	%g6,	%o1,	%o5
	tgu	%xcc,	0x7
	tg	%xcc,	0x2
	bge,pt	%xcc,	loop_873
	std	%f20,	[%l7 + 0x38]
	stw	%i4,	[%l7 + 0x58]
	fmovrslz	%l0,	%f2,	%f22
loop_873:
	nop
	wr	%g0,	0x80,	%asi
	lduha	[%l7 + 0x46] %asi,	%l5
	edge8	%g7,	%o0,	%o2
	srax	%l6,	0x1E,	%i5
	bgu,pt	%icc,	loop_874
	edge16n	%i0,	%g4,	%i1
	xor	%o7,	0x16C5,	%o6
	fmovrsne	%g1,	%f3,	%f8
loop_874:
	sdiv	%i3,	0x18EC,	%i2
	ldsb	[%l7 + 0x51],	%i6
	movleu	%icc,	%l3,	%l1
	subc	%g5,	%l2,	%o3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrsgz	%g3,	%f6,	%f5
	call	loop_875
	orn	%o4,	%g2,	%i7
	tleu	%icc,	0x5
	subccc	%l4,	0x1A4A,	%g6
loop_875:
	tvc	%icc,	0x1
	edge16	%o1,	%o5,	%l0
	movrne	%i4,	%l5,	%g7
	tsubcc	%o2,	0x059F,	%o0
	smul	%i5,	%l6,	%g4
	tge	%xcc,	0x3
	wr	%g0,	0x89,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	set	0x3D, %i0
	stba	%i1,	[%l7 + %i0] 0x2a
	membar	#Sync
	nop
	setx	loop_876,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fsrc1	%f8,	%f14
	fornot1	%f14,	%f30,	%f12
	bgu,pn	%icc,	loop_877
loop_876:
	taddcc	%o7,	0x1734,	%i0
	orncc	%o6,	0x0F37,	%i3
	ldub	[%l7 + 0x33],	%g1
loop_877:
	nop
	setx	0x29CBC69AA40BC8BD,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	fsqrtd	%f26,	%f8
	smul	%i6,	%l3,	%l1
	or	%g5,	0x0232,	%l2
	bshuffle	%f2,	%f20,	%f26
	subcc	%o3,	%g3,	%o4
	bne	loop_878
	mova	%xcc,	%g2,	%i2
	fmovdleu	%icc,	%f8,	%f2
	edge8ln	%l4,	%i7,	%o1
loop_878:
	movg	%icc,	%g6,	%o5
	fmuld8sux16	%f3,	%f1,	%f16
	movg	%icc,	%l0,	%l5
	st	%f2,	[%l7 + 0x1C]
	membar	#Sync
	wr	%g0,	0xf8,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	flush	%l7 + 0x70
	mova	%icc,	%i4,	%g7
	subccc	%o2,	%i5,	%o0
	edge32	%g4,	%i1,	%l6
	array16	%i0,	%o6,	%i3
	bcs,a	%xcc,	loop_879
	ta	%icc,	0x5
	subc	%g1,	%o7,	%l3
	te	%xcc,	0x7
loop_879:
	nop
	wr	%g0,	0x0c,	%asi
	ldstuba	[%l7 + 0x39] %asi,	%i6
	fmovs	%f3,	%f2
	mulx	%l1,	%g5,	%o3
	brz,a	%g3,	loop_880
	andncc	%l2,	%o4,	%i2
	sra	%g2,	0x15,	%l4
	fbn,a	%fcc1,	loop_881
loop_880:
	fsrc1	%f16,	%f28
	set	0x10, %i4
	ldda	[%l7 + %i4] 0x2b,	%o0
loop_881:
	movne	%icc,	%g6,	%o5
	tgu	%xcc,	0x4
	tge	%xcc,	0x7
	fpackfix	%f26,	%f11
	sdivcc	%l0,	0x0F05,	%i7
	sethi	0x14B5,	%i4
	array8	%l5,	%g7,	%i5
	edge32l	%o0,	%o2,	%i1
	alignaddrl	%g4,	%l6,	%i0
	fmovsleu	%xcc,	%f11,	%f11
	xorcc	%i3,	%g1,	%o6
	sdivx	%o7,	0x1A4E,	%l3
	fpsub16	%f16,	%f0,	%f4
	movgu	%xcc,	%i6,	%g5
	stx	%l1,	[%l7 + 0x38]
	subcc	%g3,	0x005E,	%o3
	tcs	%icc,	0x6
	set	0x30, %g1
	lda	[%l7 + %g1] 0x14,	%f9
	movrgz	%o4,	0x06C,	%l2
	tgu	%icc,	0x3
	fbg,a	%fcc3,	loop_882
	tsubcctv	%g2,	0x146C,	%i2
	umulcc	%o1,	0x0164,	%g6
	orncc	%l4,	%l0,	%o5
loop_882:
	srlx	%i7,	0x08,	%i4
	sll	%g7,	0x19,	%i5
	fcmpgt16	%f4,	%f4,	%o0
	tl	%icc,	0x6
	stw	%l5,	[%l7 + 0x18]
	fpadd16	%f16,	%f12,	%f30
	taddcctv	%o2,	0x09CD,	%g4
	taddcctv	%l6,	%i0,	%i3
	fbul,a	%fcc2,	loop_883
	move	%xcc,	%i1,	%o6
	subcc	%g1,	%l3,	%o7
	flush	%l7 + 0x2C
loop_883:
	nop
	setx	0x60B950FC1053B87F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x48]
	ldx	[%l7 + 0x48],	%fsr
	fsrc2s	%f26,	%f16
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrne	%g5,	%i6,	%l1
	tsubcc	%g3,	0x16DD,	%o3
	xor	%l2,	0x14D1,	%g2
	fcmpeq16	%f12,	%f14,	%o4
	brnz,a	%i2,	loop_884
	fmuld8sux16	%f23,	%f4,	%f2
	fornot1s	%f5,	%f14,	%f4
	add	%l7,	0x24,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%o1
	casa	[%l6] %asi,	%o1,	%g6
loop_884:
	fbule	%fcc1,	loop_885
	edge8l	%l4,	%l0,	%o5
	edge8n	%i7,	%g7,	%i4
	srlx	%i5,	0x1B,	%o0
loop_885:
	fbu,a	%fcc0,	loop_886
	movrne	%o2,	%g4,	%l6
	fbn,a	%fcc2,	loop_887
	lduh	[%l7 + 0x0A],	%l5
loop_886:
	bvc,a	loop_888
	call	loop_889
loop_887:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	setx loop_890, %l0, %l1
	jmpl %l1, %i0
loop_888:
	fmovrsgz	%i1,	%f11,	%f19
loop_889:
	bvs,pn	%icc,	loop_891
	fpadd16s	%f13,	%f28,	%f21
loop_890:
	prefetch	[%l7 + 0x30],	 0x1
	alignaddr	%i3,	%g1,	%o6
loop_891:
	udivx	%o7,	0x1DFC,	%g5
	fpadd16	%f22,	%f26,	%f20
	orcc	%l3,	%i6,	%l1
	smulcc	%o3,	%l2,	%g3
	fnand	%f30,	%f20,	%f4
	fmovrslz	%o4,	%f0,	%f20
	sub	%i2,	%g2,	%g6
	tcc	%xcc,	0x2
	sdiv	%o1,	0x0159,	%l0
	fble	%fcc3,	loop_892
	edge8n	%o5,	%i7,	%l4
	tsubcctv	%g7,	%i4,	%o0
	brz	%i5,	loop_893
loop_892:
	udivcc	%g4,	0x1691,	%l6
	smul	%l5,	0x05E6,	%o2
	array32	%i0,	%i1,	%i3
loop_893:
	tcc	%xcc,	0x2
	bshuffle	%f30,	%f18,	%f26
	fbu	%fcc1,	loop_894
	sdivx	%o6,	0x0586,	%o7
	movl	%xcc,	%g1,	%l3
	lduw	[%l7 + 0x38],	%i6
loop_894:
	tleu	%icc,	0x5
	movg	%icc,	%l1,	%o3
	edge16n	%l2,	%g5,	%o4
	nop
	setx	0x8EAFE93F80602F41,	%l0,	%l6
	stx	%l6,	[%l7 + 0x60]
	ldx	[%l7 + 0x60],	%fsr
	edge16	%g3,	%g2,	%i2
	movl	%icc,	%o1,	%l0
	lduh	[%l7 + 0x4C],	%o5
	bge	%icc,	loop_895
	xorcc	%i7,	%g6,	%g7
	movrlz	%l4,	0x0E3,	%i4
	addcc	%i5,	0x1359,	%g4
loop_895:
	addccc	%o0,	%l5,	%l6
	tvc	%xcc,	0x4
	set	0x40, %g5
	stda	%f0,	[%l7 + %g5] 0xf0
	membar	#Sync
	fbug	%fcc2,	loop_896
	udivcc	%i0,	0x1C26,	%o2
	nop
	fitod	%f2,	%f18
	fdtoi	%f18,	%f26
	array16	%i1,	%i3,	%o7
loop_896:
	fmovrsgz	%g1,	%f13,	%f3
	tl	%icc,	0x3
	movne	%xcc,	%o6,	%i6
	udivx	%l3,	0x01B5,	%l1
	subcc	%o3,	0x00F4,	%l2
	fnot2s	%f28,	%f24
	sdivcc	%o4,	0x17DA,	%g3
	sdivcc	%g5,	0x0698,	%g2
	bneg,pn	%xcc,	loop_897
	tleu	%icc,	0x0
	xorcc	%o1,	0x06D0,	%i2
	edge32l	%o5,	%l0,	%i7
loop_897:
	movge	%xcc,	%g6,	%l4
	bg,a	loop_898
	fmovs	%f8,	%f9
	tcs	%xcc,	0x6
	fandnot1s	%f8,	%f22,	%f18
loop_898:
	fandnot1	%f10,	%f0,	%f16
	udivcc	%g7,	0x0A7C,	%i5
	tsubcctv	%g4,	0x032B,	%o0
	bpos,a,pt	%icc,	loop_899
	fbuge,a	%fcc3,	loop_900
	mulscc	%l5,	%i4,	%l6
	swap	[%l7 + 0x54],	%i0
loop_899:
	brz,a	%i1,	loop_901
loop_900:
	alignaddrl	%i3,	%o2,	%o7
	ba,a	loop_902
	taddcctv	%g1,	%i6,	%l3
loop_901:
	edge16n	%l1,	%o6,	%l2
	sra	%o4,	%o3,	%g3
loop_902:
	ta	%icc,	0x4
	wr	%g0,	0x88,	%asi
	ldstuba	[%l7 + 0x45] %asi,	%g5
	tpos	%xcc,	0x4
	fand	%f28,	%f30,	%f12
	ta	%icc,	0x4
	fsrc1s	%f1,	%f16
	brnz	%g2,	loop_903
	std	%f10,	[%l7 + 0x10]
	sra	%o1,	0x00,	%o5
	fmovsne	%icc,	%f17,	%f28
loop_903:
	nop
	set	0x0C, %l3
	ldsha	[%l7 + %l3] 0x0c,	%i2
	fbue,a	%fcc0,	loop_904
	ta	%icc,	0x2
	ld	[%l7 + 0x58],	%f31
	bgu,a	%icc,	loop_905
loop_904:
	brlez	%i7,	loop_906
	udiv	%g6,	0x1494,	%l4
	wr	%g0,	0x81,	%asi
	prefetcha	[%l7 + 0x78] %asi,	 0x0
loop_905:
	edge16	%l0,	%i5,	%o0
loop_906:
	tn	%icc,	0x5
	movvs	%icc,	%l5,	%g4
	brlez,a	%i4,	loop_907
	movrlez	%i0,	0x237,	%i1
	fbne	%fcc3,	loop_908
	movg	%xcc,	%i3,	%l6
loop_907:
	fnot1s	%f27,	%f16
	fbul	%fcc2,	loop_909
loop_908:
	ldx	[%l7 + 0x78],	%o2
	and	%g1,	%o7,	%i6
	sll	%l3,	0x08,	%o6
loop_909:
	taddcc	%l1,	0x1EC1,	%l2
	srl	%o3,	0x0C,	%g3
	stb	%o4,	[%l7 + 0x11]
	fbug	%fcc0,	loop_910
	ld	[%l7 + 0x48],	%f0
	fbne	%fcc3,	loop_911
	edge32l	%g5,	%g2,	%o5
loop_910:
	nop
	set	0x6F, %l2
	stb	%i2,	[%l7 + %l2]
	wr	%g0,	0x18,	%asi
	ldsha	[%l7 + 0x10] %asi,	%i7
loop_911:
	sdiv	%o1,	0x1F8C,	%g6
	stx	%l4,	[%l7 + 0x70]
	movcs	%xcc,	%l0,	%i5
	lduw	[%l7 + 0x40],	%o0
	sethi	0x1879,	%l5
	nop
	set	0x38, %l1
	stw	%g7,	[%l7 + %l1]
	set	0x40, %o0
	lduwa	[%l7 + %o0] 0x18,	%i4
	fbule	%fcc2,	loop_912
	sdivcc	%i0,	0x163C,	%i1
	sir	0x093A
	membar	0x47
loop_912:
	alignaddr	%g4,	%l6,	%i3
	tle	%icc,	0x7
	mulx	%g1,	%o2,	%o7
	fpack32	%f10,	%f10,	%f2
	fbul	%fcc2,	loop_913
	membar	0x53
	xnor	%l3,	0x12A4,	%o6
	movl	%xcc,	%l1,	%i6
loop_913:
	fpsub16s	%f4,	%f20,	%f27
	udivcc	%o3,	0x0232,	%g3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movcc	%xcc,	%l2,	%o4
	fbe	%fcc2,	loop_914
	fbn	%fcc1,	loop_915
	srlx	%g5,	0x01,	%g2
	sdivcc	%i2,	0x16CD,	%o5
loop_914:
	brlz	%i7,	loop_916
loop_915:
	fmovrdgz	%g6,	%f24,	%f6
	smulcc	%o1,	%l4,	%l0
	wr	%g0,	0x89,	%asi
	stwa	%i5,	[%l7 + 0x30] %asi
loop_916:
	fornot2s	%f15,	%f19,	%f1
	udivcc	%o0,	0x1256,	%l5
	tvs	%xcc,	0x0
	set	0x61, %o7
	ldsba	[%l7 + %o7] 0x18,	%g7
	fnot1s	%f10,	%f22
	fornot1	%f28,	%f4,	%f8
	udivx	%i4,	0x15C9,	%i1
	and	%i0,	0x0868,	%g4
	addcc	%i3,	0x0417,	%l6
	mova	%xcc,	%g1,	%o7
	movvs	%xcc,	%l3,	%o6
	addc	%o2,	%i6,	%l1
	ld	[%l7 + 0x50],	%f10
	fnegs	%f13,	%f24
	fsrc1	%f12,	%f4
	addcc	%o3,	%g3,	%l2
	srax	%g5,	0x0F,	%g2
	alignaddr	%i2,	%o4,	%o5
	edge8ln	%i7,	%o1,	%l4
	tgu	%icc,	0x5
	tleu	%xcc,	0x5
	movrgz	%l0,	0x35F,	%i5
	fabss	%f9,	%f13
	set	0x48, %l5
	stwa	%o0,	[%l7 + %l5] 0x88
	nop
	setx	0x2ECAC85B4E18DB63,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0x271913B406CADDA3,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	faddd	%f16,	%f20,	%f26
	movcc	%xcc,	%g6,	%g7
	xnor	%l5,	%i1,	%i0
	tvc	%icc,	0x7
	bvs,a	loop_917
	tvc	%xcc,	0x1
	bleu,a,pt	%icc,	loop_918
	fnegd	%f8,	%f16
loop_917:
	call	loop_919
	andn	%g4,	%i4,	%i3
loop_918:
	nop
	wr	%g0,	0x88,	%asi
	lduwa	[%l7 + 0x4C] %asi,	%g1
loop_919:
	orn	%l6,	0x0EC8,	%o7
	bn,pt	%icc,	loop_920
	flush	%l7 + 0x44
	swap	[%l7 + 0x28],	%o6
	edge32n	%o2,	%l3,	%i6
loop_920:
	fmovdl	%icc,	%f1,	%f9
	set	0x58, %g2
	stwa	%o3,	[%l7 + %g2] 0x14
	fmovsneg	%icc,	%f10,	%f26
	fpsub16	%f22,	%f6,	%f16
	udivcc	%l1,	0x1534,	%g3
	ba,pt	%xcc,	loop_921
	bge,a,pn	%xcc,	loop_922
	smulcc	%g5,	0x071E,	%g2
	nop
	fitos	%f11,	%f5
	fstox	%f5,	%f4
	fxtos	%f4,	%f26
loop_921:
	subccc	%l2,	%o4,	%i2
loop_922:
	move	%xcc,	%i7,	%o5
	sllx	%l4,	%l0,	%i5
	movge	%xcc,	%o0,	%o1
	movneg	%icc,	%g7,	%l5
	alignaddr	%g6,	%i1,	%i0
	call	loop_923
	movcc	%xcc,	%g4,	%i4
	fbuge,a	%fcc0,	loop_924
	fand	%f16,	%f14,	%f20
loop_923:
	nop
	setx	0x7FA2F1A7,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f2
	setx	0x016AAE0A,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f10
	fadds	%f10,	%f2,	%f8
	movrlez	%i3,	0x365,	%l6
loop_924:
	fbu,a	%fcc2,	loop_925
	smulcc	%o7,	%o6,	%o2
	subcc	%l3,	0x1997,	%i6
	bne,a,pt	%xcc,	loop_926
loop_925:
	and	%g1,	0x0B00,	%o3
	membar	0x0A
	movge	%icc,	%g3,	%g5
loop_926:
	fcmpeq32	%f10,	%f22,	%g2
	tleu	%xcc,	0x6
	fbe	%fcc3,	loop_927
	add	%l1,	0x1438,	%o4
	smul	%i2,	%l2,	%o5
	edge8l	%i7,	%l0,	%l4
loop_927:
	subccc	%o0,	%i5,	%g7
	movle	%icc,	%l5,	%o1
	set	0x3D, %i7
	stba	%g6,	[%l7 + %i7] 0xeb
	membar	#Sync
	call	loop_928
	sdivcc	%i1,	0x11D6,	%g4
	set	0x1A, %o3
	lduha	[%l7 + %o3] 0x0c,	%i4
loop_928:
	nop
	add	%l7,	0x64,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%i0
	casa	[%l6] %asi,	%i0,	%i3
	movrlez	%o7,	%o6,	%l6
	fandnot1s	%f9,	%f22,	%f19
	fmovrdne	%o2,	%f0,	%f20
	smul	%l3,	0x001A,	%g1
	fmovrdgez	%o3,	%f30,	%f18
	orn	%i6,	%g3,	%g5
	stb	%l1,	[%l7 + 0x78]
	alignaddrl	%o4,	%g2,	%l2
	move	%icc,	%o5,	%i2
	edge8n	%i7,	%l4,	%l0
	brgez,a	%o0,	loop_929
	fbule,a	%fcc1,	loop_930
	movcs	%icc,	%g7,	%i5
	taddcc	%o1,	0x0344,	%g6
loop_929:
	nop
	set	0x77, %o2
	stb	%i1,	[%l7 + %o2]
loop_930:
	tn	%icc,	0x7
	sll	%g4,	0x15,	%l5
	srax	%i0,	0x1B,	%i4
	fmovspos	%icc,	%f21,	%f13
	orcc	%i3,	%o7,	%o6
	umul	%o2,	%l6,	%l3
	orcc	%o3,	0x07A2,	%i6
	tg	%xcc,	0x0
	umul	%g3,	0x051A,	%g1
	array8	%g5,	%o4,	%l1
	addccc	%l2,	0x0AC1,	%o5
	andn	%i2,	0x1B26,	%i7
	set	0x34, %i3
	stwa	%l4,	[%l7 + %i3] 0x27
	membar	#Sync
	fmovdvc	%icc,	%f22,	%f24
	xor	%g2,	0x0CE4,	%l0
	fbn,a	%fcc0,	loop_931
	or	%o0,	0x063A,	%i5
	movpos	%icc,	%g7,	%g6
	edge8l	%o1,	%i1,	%l5
loop_931:
	edge8l	%i0,	%g4,	%i3
	ldsw	[%l7 + 0x4C],	%o7
	sethi	0x0C1E,	%i4
	tleu	%xcc,	0x4
	ldx	[%l7 + 0x70],	%o2
	fmovs	%f12,	%f15
	edge8ln	%o6,	%l6,	%o3
	lduw	[%l7 + 0x54],	%l3
	nop
	set	0x21, %i1
	ldsb	[%l7 + %i1],	%g3
	tn	%xcc,	0x7
	bcs	loop_932
	fmovrde	%g1,	%f0,	%f10
	srl	%i6,	%g5,	%o4
	fnot2	%f8,	%f30
loop_932:
	brz	%l2,	loop_933
	movpos	%xcc,	%l1,	%i2
	sra	%o5,	%l4,	%i7
	nop
	setx	loop_934,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_933:
	tsubcc	%l0,	0x0E9C,	%g2
	or	%i5,	0x0252,	%g7
	movvs	%icc,	%o0,	%o1
loop_934:
	tleu	%xcc,	0x4
	fornot2	%f26,	%f14,	%f2
	brlz,a	%i1,	loop_935
	taddcctv	%l5,	0x00E1,	%i0
	edge8	%g6,	%g4,	%i3
	nop
	set	0x48, %o1
	ldd	[%l7 + %o1],	%o6
loop_935:
	mulscc	%i4,	%o2,	%o6
	edge8n	%l6,	%l3,	%o3
	tneg	%icc,	0x1
	movrne	%g1,	0x09A,	%g3
	alignaddr	%i6,	%o4,	%l2
	stw	%g5,	[%l7 + 0x5C]
	orcc	%i2,	%o5,	%l1
	array16	%l4,	%l0,	%i7
	bg,pn	%icc,	loop_936
	bcs,a,pt	%xcc,	loop_937
	tg	%icc,	0x4
	tpos	%icc,	0x7
loop_936:
	xnorcc	%i5,	%g7,	%g2
loop_937:
	xor	%o1,	%i1,	%l5
	alignaddr	%o0,	%i0,	%g6
	edge32l	%g4,	%i3,	%i4
	nop
	setx	loop_938,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	mulx	%o7,	0x160A,	%o2
	fcmpeq16	%f14,	%f30,	%l6
	wr	%g0,	0x80,	%asi
	ldsba	[%l7 + 0x11] %asi,	%l3
loop_938:
	tvc	%xcc,	0x6
	edge8n	%o6,	%o3,	%g3
	tvs	%xcc,	0x6
	nop
	setx	loop_939,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	stb	%g1,	[%l7 + 0x54]
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	taddcctv	%i6,	%l2,	%o4
loop_939:
	nop
	setx	loop_940,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fmovse	%xcc,	%f14,	%f28
	std	%f0,	[%l7 + 0x48]
	wr	%g0,	0x11,	%asi
	ldsha	[%l7 + 0x4A] %asi,	%i2
loop_940:
	movle	%xcc,	%o5,	%l1
	add	%g5,	%l4,	%l0
	fmul8ulx16	%f12,	%f22,	%f20
	add	%i5,	%g7,	%g2
	nop
	setx	0x2513C01D,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f17
	setx	0x5537174A,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f21
	fadds	%f21,	%f17,	%f9
	movge	%xcc,	%i7,	%o1
	fcmpeq32	%f20,	%f14,	%i1
	ldsh	[%l7 + 0x64],	%l5
	movne	%xcc,	%i0,	%o0
	fnot1s	%f28,	%f3
	alignaddrl	%g6,	%g4,	%i4
	edge16	%o7,	%i3,	%l6
	ld	[%l7 + 0x4C],	%f7
	fmovrslez	%o2,	%f22,	%f12
	fmul8x16au	%f9,	%f1,	%f14
	srl	%l3,	0x03,	%o3
	fmovrdne	%o6,	%f20,	%f20
	wr	%g0,	0x89,	%asi
	sta	%f4,	[%l7 + 0x5C] %asi
	fbul	%fcc0,	loop_941
	fzero	%f18
	tne	%icc,	0x2
	nop
	setx	0xCC5C4C8B,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f17
	setx	0x45855309,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f13
	fmuls	%f13,	%f17,	%f30
loop_941:
	mulscc	%g3,	%i6,	%l2
	tge	%icc,	0x3
	ta	%icc,	0x4
	tleu	%icc,	0x3
	set	0x5B, %l6
	ldstuba	[%l7 + %l6] 0x18,	%g1
	tl	%icc,	0x1
	tvc	%xcc,	0x1
	sra	%i2,	0x0E,	%o4
	fand	%f14,	%f28,	%f14
	smulcc	%o5,	0x183C,	%g5
	and	%l1,	%l4,	%l0
	mulx	%i5,	0x0970,	%g7
	sth	%i7,	[%l7 + 0x6A]
	ta	%xcc,	0x2
	tsubcc	%g2,	0x1034,	%o1
	add	%i1,	0x1467,	%l5
	wr	%g0,	0x88,	%asi
	prefetcha	[%l7 + 0x20] %asi,	 0x2
	tne	%icc,	0x5
	set	0x26, %g7
	lduba	[%l7 + %g7] 0x14,	%g6
	be,a,pn	%icc,	loop_942
	sdiv	%g4,	0x15B8,	%i4
	movgu	%icc,	%o7,	%i0
	fpsub16s	%f3,	%f1,	%f29
loop_942:
	swap	[%l7 + 0x0C],	%i3
	nop
	fitod	%f6,	%f10
	fdtox	%f10,	%f14
	fxtod	%f14,	%f8
	fpadd16s	%f7,	%f4,	%f3
	array32	%l6,	%l3,	%o3
	taddcctv	%o6,	0x090E,	%g3
	tne	%icc,	0x5
	tl	%xcc,	0x5
	fmul8sux16	%f20,	%f8,	%f2
	nop
	setx	0x607047E3317F5E3B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0xC651F58D291BEB56,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	faddd	%f26,	%f28,	%f28
	bpos,a	%icc,	loop_943
	sir	0x075C
	orncc	%i6,	0x0A91,	%o2
	and	%l2,	%g1,	%i2
loop_943:
	ld	[%l7 + 0x48],	%f3
	set	0x40, %l4
	stda	%f16,	[%l7 + %l4] 0x1f
	membar	#Sync
	set	0x58, %o6
	lda	[%l7 + %o6] 0x04,	%f25
	set	0x54, %i2
	ldsha	[%l7 + %i2] 0x10,	%o4
	addc	%g5,	%l1,	%l4
	fbule	%fcc3,	loop_944
	ldsb	[%l7 + 0x1E],	%o5
	te	%xcc,	0x2
	addcc	%i5,	%g7,	%l0
loop_944:
	pdist	%f20,	%f2,	%f22
	movcs	%icc,	%g2,	%i7
	tne	%icc,	0x4
	edge8ln	%o1,	%i1,	%o0
	tneg	%icc,	0x4
	fbge,a	%fcc1,	loop_945
	srlx	%g6,	%g4,	%i4
	tle	%icc,	0x0
	tvs	%xcc,	0x7
loop_945:
	tsubcctv	%o7,	0x0B3F,	%i0
	movvc	%icc,	%l5,	%i3
	set	0x0F, %o4
	stba	%l6,	[%l7 + %o4] 0x2f
	membar	#Sync
	pdist	%f10,	%f4,	%f4
	bg,pt	%icc,	loop_946
	movcc	%icc,	%l3,	%o3
	edge8l	%o6,	%g3,	%i6
	movgu	%icc,	%o2,	%g1
loop_946:
	nop
	membar	#Sync
	wr	%g0,	0xf0,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	tle	%icc,	0x7
	taddcctv	%l2,	%o4,	%g5
	brgez,a	%l1,	loop_947
	nop
	setx	0xD1596706,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f22
	fsqrts	%f22,	%f31
	fmovdleu	%icc,	%f22,	%f2
	edge8	%i2,	%o5,	%l4
loop_947:
	nop
	wr	%g0,	0x11,	%asi
	ldsha	[%l7 + 0x5C] %asi,	%i5
	move	%icc,	%l0,	%g2
	subcc	%i7,	0x0282,	%g7
	fblg,a	%fcc0,	loop_948
	ta	%xcc,	0x2
	srlx	%i1,	0x0A,	%o0
	tvs	%xcc,	0x3
loop_948:
	membar	0x03
	edge16n	%g6,	%g4,	%i4
	nop
	setx	loop_949,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fbn,a	%fcc3,	loop_950
	fba,a	%fcc1,	loop_951
	fbue	%fcc1,	loop_952
loop_949:
	brlez	%o7,	loop_953
loop_950:
	membar	0x5A
loop_951:
	fbne,a	%fcc1,	loop_954
loop_952:
	alignaddrl	%i0,	%o1,	%i3
loop_953:
	fbug	%fcc1,	loop_955
	taddcctv	%l5,	0x1993,	%l3
loop_954:
	tpos	%icc,	0x1
	tvc	%icc,	0x6
loop_955:
	brlez	%o3,	loop_956
	call	loop_957
	fblg,a	%fcc2,	loop_958
	umulcc	%o6,	%l6,	%g3
loop_956:
	bvc	loop_959
loop_957:
	movrlez	%o2,	%i6,	%g1
loop_958:
	fcmple16	%f18,	%f26,	%l2
	and	%o4,	0x15AC,	%l1
loop_959:
	orn	%i2,	0x0182,	%o5
	popc	0x1B6A,	%g5
	bg,a,pt	%xcc,	loop_960
	ba,a,pn	%xcc,	loop_961
	stb	%i5,	[%l7 + 0x7F]
	stbar
loop_960:
	fandnot2	%f20,	%f10,	%f2
loop_961:
	edge16l	%l0,	%l4,	%g2
	set	0x28, %l0
	prefetcha	[%l7 + %l0] 0x80,	 0x0
	movgu	%icc,	%i1,	%i7
	subccc	%g6,	%g4,	%i4
	array32	%o7,	%i0,	%o1
	fmuld8ulx16	%f23,	%f26,	%f24
	alignaddr	%i3,	%l5,	%o0
	bg,pn	%icc,	loop_962
	sdiv	%o3,	0x1E11,	%l3
	ldsb	[%l7 + 0x11],	%l6
	wr	%g0,	0x10,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
loop_962:
	fmovscs	%icc,	%f8,	%f28
	set	0x75, %g6
	stba	%o6,	[%l7 + %g6] 0x04
	edge8	%o2,	%g3,	%i6
	fbule,a	%fcc3,	loop_963
	fnegd	%f6,	%f8
	edge8n	%g1,	%l2,	%l1
	nop
	fitod	%f6,	%f16
	fdtos	%f16,	%f7
loop_963:
	std	%f24,	[%l7 + 0x28]
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movne	%xcc,	%i2,	%o5
	smul	%o4,	%g5,	%l0
	andn	%i5,	%l4,	%g2
	andcc	%g7,	0x1FDA,	%i7
	taddcctv	%i1,	0x1951,	%g6
	fmovda	%icc,	%f24,	%f5
	movne	%xcc,	%i4,	%g4
	subc	%o7,	%o1,	%i0
	udivx	%l5,	0x083B,	%i3
	tvc	%xcc,	0x2
	movrne	%o0,	0x3C2,	%l3
	ldd	[%l7 + 0x08],	%f2
	fpack16	%f12,	%f25
	movcs	%xcc,	%l6,	%o6
	tg	%icc,	0x5
	tneg	%icc,	0x1
	fmovspos	%icc,	%f20,	%f12
	tleu	%xcc,	0x4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tcs	%xcc,	0x2
	fbn,a	%fcc3,	loop_964
	std	%f16,	[%l7 + 0x08]
	movvc	%xcc,	%o3,	%o2
	fbue	%fcc3,	loop_965
loop_964:
	tcs	%icc,	0x0
	addccc	%i6,	%g1,	%l2
	fmovd	%f12,	%f22
loop_965:
	mulscc	%l1,	%g3,	%o5
	fnot1s	%f30,	%f31
	ldd	[%l7 + 0x60],	%f22
	tneg	%xcc,	0x6
	movg	%xcc,	%i2,	%o4
	array16	%g5,	%i5,	%l4
	set	0x70, %g4
	ldda	[%l7 + %g4] 0x23,	%l0
	movrgez	%g7,	%g2,	%i1
	nop
	fitod	%f26,	%f10
	movrgz	%g6,	0x2A0,	%i4
	movleu	%xcc,	%g4,	%o7
	set	0x48, %i5
	prefetcha	[%l7 + %i5] 0x88,	 0x0
	movne	%xcc,	%i0,	%o1
	stx	%l5,	[%l7 + 0x30]
	alignaddr	%i3,	%l3,	%l6
	mova	%xcc,	%o0,	%o6
	fmovsl	%icc,	%f11,	%f4
	wr	%g0,	0x88,	%asi
	swapa	[%l7 + 0x2C] %asi,	%o3
	membar	0x26
	edge16	%i6,	%o2,	%g1
	sdivx	%l1,	0x1E0D,	%l2
	bgu,a	loop_966
	edge16l	%g3,	%i2,	%o4
	te	%xcc,	0x3
	sir	0x16A0
loop_966:
	edge8	%g5,	%o5,	%l4
	udiv	%l0,	0x0EDB,	%i5
	ble,a,pt	%xcc,	loop_967
	bne,pt	%xcc,	loop_968
	tg	%xcc,	0x7
	nop
	set	0x1E, %o5
	ldstub	[%l7 + %o5],	%g2
loop_967:
	fnot1	%f0,	%f0
loop_968:
	subcc	%i1,	%g7,	%g6
	wr	%g0,	0x0c,	%asi
	ldxa	[%l7 + 0x38] %asi,	%i4
	alignaddr	%g4,	%i7,	%i0
	taddcctv	%o7,	%l5,	%o1
	alignaddr	%i3,	%l6,	%l3
	subc	%o6,	%o3,	%o0
	fmovrdgez	%i6,	%f14,	%f6
	fbn,a	%fcc1,	loop_969
	fmovdl	%icc,	%f19,	%f3
	set	0x18, %i6
	lduwa	[%l7 + %i6] 0x81,	%o2
loop_969:
	smulcc	%l1,	%g1,	%g3
	srlx	%i2,	0x00,	%l2
	xnorcc	%o4,	0x1B31,	%o5
	bgu	loop_970
	fbge	%fcc0,	loop_971
	addc	%l4,	0x02F1,	%g5
	bne,pn	%xcc,	loop_972
loop_970:
	fmovsleu	%icc,	%f2,	%f22
loop_971:
	fbug	%fcc1,	loop_973
	fnot2	%f30,	%f4
loop_972:
	movre	%i5,	%l0,	%g2
	nop
	setx	0xDC50AB52,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f19
	setx	0xED5E1523,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f23
	fmuls	%f23,	%f19,	%f28
loop_973:
	edge32l	%g7,	%g6,	%i1
	movge	%icc,	%i4,	%i7
	fpackfix	%f30,	%f19
	udivx	%i0,	0x103B,	%g4
	prefetch	[%l7 + 0x34],	 0x0
	edge32	%o7,	%l5,	%o1
	tleu	%icc,	0x5
	nop
	set	0x20, %g3
	stx	%l6,	[%l7 + %g3]
	movvs	%icc,	%i3,	%o6
	be,a	%icc,	loop_974
	movrne	%l3,	%o0,	%i6
	movrlez	%o3,	%o2,	%g1
	sub	%g3,	0x0FC1,	%i2
loop_974:
	taddcc	%l2,	%o4,	%l1
	add	%l7,	0x1C,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%o5
	casa	[%l6] %asi,	%o5,	%l4
	bl,a,pn	%xcc,	loop_975
	movvs	%xcc,	%g5,	%l0
	set	0x20, %i4
	stxa	%g2,	[%g0 + %i4] 0x4f
loop_975:
	fmovrslz	%g7,	%f21,	%f8
	tn	%icc,	0x0
	tge	%icc,	0x1
	edge32l	%g6,	%i5,	%i1
	fpsub16s	%f3,	%f16,	%f9
	popc	0x0DF0,	%i7
	ta	%icc,	0x5
	nop
	setx	0xDF06716CE0600960,	%l0,	%l6
	stx	%l6,	[%l7 + 0x20]
	ldx	[%l7 + 0x20],	%fsr
	movrlz	%i0,	0x2A3,	%i4
	for	%f8,	%f24,	%f18
	bne	%xcc,	loop_976
	mova	%icc,	%o7,	%g4
	tg	%icc,	0x0
	fnegs	%f24,	%f11
loop_976:
	nop
	setx	loop_977,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	and	%l5,	%l6,	%i3
	bgu	%icc,	loop_978
	movge	%icc,	%o6,	%l3
loop_977:
	popc	%o1,	%o0
	fcmpeq32	%f4,	%f2,	%o3
loop_978:
	sdiv	%i6,	0x0468,	%g1
	umul	%o2,	0x01A4,	%g3
	fbn,a	%fcc2,	loop_979
	movle	%xcc,	%l2,	%o4
	movcc	%xcc,	%l1,	%o5
	movrgez	%i2,	0x196,	%g5
loop_979:
	array32	%l0,	%g2,	%l4
	fmovdne	%xcc,	%f4,	%f8
	orcc	%g6,	%g7,	%i5
	wr	%g0,	0x81,	%asi
	ldsba	[%l7 + 0x0D] %asi,	%i7
	array8	%i0,	%i1,	%i4
	movvc	%xcc,	%o7,	%l5
	nop
	setx	0x044AA1B59167AEAF,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	fsqrtd	%f20,	%f28
	stb	%l6,	[%l7 + 0x33]
	fmovrslez	%i3,	%f25,	%f22
	mulscc	%o6,	%g4,	%l3
	fxnors	%f29,	%f2,	%f10
	fmuld8ulx16	%f17,	%f2,	%f10
	fcmple16	%f22,	%f2,	%o1
	tgu	%xcc,	0x6
	fba,a	%fcc2,	loop_980
	fba,a	%fcc3,	loop_981
	umul	%o0,	%o3,	%i6
	srl	%o2,	0x09,	%g1
loop_980:
	edge32	%l2,	%o4,	%l1
loop_981:
	nop
	setx	loop_982,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tsubcc	%g3,	%o5,	%i2
	ldsh	[%l7 + 0x64],	%l0
	edge8ln	%g2,	%g5,	%l4
loop_982:
	edge16n	%g7,	%g6,	%i5
	or	%i0,	%i7,	%i4
	fzeros	%f23
	movcc	%xcc,	%i1,	%l5
	udivcc	%l6,	0x0AB1,	%i3
	fornot1	%f10,	%f24,	%f18
	fbe	%fcc2,	loop_983
	alignaddr	%o6,	%g4,	%l3
	sub	%o7,	0x1FDF,	%o0
	movcc	%xcc,	%o1,	%i6
loop_983:
	edge8	%o3,	%o2,	%l2
	edge16l	%o4,	%g1,	%g3
	add	%l7,	0x14,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%l1
	casa	[%l6] 0x81,	%l1,	%i2
	fmovsleu	%icc,	%f6,	%f0
	taddcc	%o5,	0x1B00,	%l0
	edge16	%g2,	%l4,	%g7
	addc	%g6,	%i5,	%g5
	xnorcc	%i7,	%i4,	%i0
	ba	loop_984
	fble	%fcc2,	loop_985
	fmovdvs	%icc,	%f2,	%f15
	tl	%xcc,	0x4
loop_984:
	popc	%i1,	%l6
loop_985:
	array32	%i3,	%l5,	%g4
	ldub	[%l7 + 0x2F],	%l3
	edge16ln	%o7,	%o6,	%o0
	fzeros	%f7
	sdivcc	%i6,	0x0A14,	%o1
	sdivx	%o2,	0x1347,	%o3
	srlx	%o4,	%l2,	%g1
	fcmpeq16	%f20,	%f30,	%g3
	taddcc	%l1,	0x06A8,	%o5
	edge32ln	%i2,	%g2,	%l0
	movpos	%xcc,	%g7,	%g6
	movl	%icc,	%l4,	%i5
	tl	%xcc,	0x1
	mova	%icc,	%i7,	%i4
	tn	%icc,	0x2
	addccc	%g5,	0x14D3,	%i0
	popc	%i1,	%l6
	stb	%l5,	[%l7 + 0x69]
	bleu,a,pt	%xcc,	loop_986
	move	%icc,	%g4,	%i3
	nop
	setx	loop_987,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fmovse	%xcc,	%f0,	%f4
loop_986:
	tneg	%icc,	0x6
	and	%o7,	%l3,	%o6
loop_987:
	edge8n	%o0,	%o1,	%i6
	movrlez	%o3,	%o2,	%l2
	nop
	setx	loop_988,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	array16	%g1,	%o4,	%l1
	bpos,pt	%icc,	loop_989
	mulscc	%g3,	%o5,	%g2
loop_988:
	tle	%icc,	0x6
	fsrc1	%f28,	%f2
loop_989:
	nop
	fitod	%f4,	%f16
	fdtoi	%f16,	%f28
	sdivx	%l0,	0x121B,	%i2
	orn	%g7,	0x004C,	%l4
	sllx	%i5,	0x1E,	%i7
	wr	%g0,	0x88,	%asi
	stba	%g6,	[%l7 + 0x72] %asi
	movn	%xcc,	%i4,	%i0
	or	%g5,	0x00CE,	%i1
	umul	%l6,	0x0C20,	%g4
	alignaddrl	%l5,	%i3,	%o7
	tcc	%xcc,	0x6
	fmovdcs	%icc,	%f7,	%f26
	edge16ln	%l3,	%o6,	%o0
	fmovda	%icc,	%f3,	%f19
	fmovrse	%o1,	%f21,	%f31
	srax	%i6,	0x06,	%o2
	fpadd32s	%f7,	%f14,	%f17
	edge8n	%l2,	%o3,	%o4
	be,a	%xcc,	loop_990
	edge8ln	%l1,	%g1,	%o5
	edge16l	%g3,	%l0,	%g2
	sdivcc	%i2,	0x1083,	%g7
loop_990:
	movge	%icc,	%i5,	%i7
	movleu	%icc,	%g6,	%i4
	ldx	[%l7 + 0x48],	%l4
	sdivx	%i0,	0x015A,	%g5
	addccc	%i1,	0x161C,	%g4
	srl	%l6,	%i3,	%l5
	movre	%o7,	%l3,	%o0
	tl	%icc,	0x0
	tpos	%xcc,	0x2
	membar	0x5E
	movne	%xcc,	%o1,	%i6
	wr	%g0,	0x88,	%asi
	sta	%f15,	[%l7 + 0x74] %asi
	movle	%xcc,	%o2,	%l2
	fxnors	%f6,	%f22,	%f27
	fmul8ulx16	%f2,	%f0,	%f10
	mova	%xcc,	%o3,	%o4
	tsubcc	%o6,	0x17B2,	%g1
	wr	%g0,	0x80,	%asi
	ldsba	[%l7 + 0x76] %asi,	%l1
	sllx	%g3,	%o5,	%l0
	fcmpgt16	%f0,	%f14,	%i2
	andn	%g7,	%g2,	%i5
	fnand	%f28,	%f2,	%f28
	umul	%i7,	0x1D99,	%g6
	fcmpgt16	%f20,	%f14,	%i4
	addcc	%l4,	0x0C53,	%i0
	edge8	%i1,	%g4,	%l6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addc	%g5,	0x19E3,	%l5
	orn	%o7,	%i3,	%o0
	move	%icc,	%o1,	%i6
	fxnor	%f24,	%f8,	%f6
	fmul8x16	%f4,	%f12,	%f0
	fnegs	%f14,	%f24
	sllx	%o2,	%l3,	%o3
	brz,a	%o4,	loop_991
	fzero	%f30
	nop
	fitos	%f6,	%f30
	fstoi	%f30,	%f1
	sir	0x1EEA
loop_991:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srlx	%l2,	0x1C,	%g1
	sethi	0x0589,	%o6
	fnegd	%f14,	%f12
	movrgz	%g3,	0x377,	%o5
	membar	0x30
	sra	%l1,	0x1C,	%l0
	set	0x2A, %g1
	stha	%g7,	[%l7 + %g1] 0x89
	add	%l7,	0x10,	%l6
	wr	%g0,	0x18,	%asi
	casa	[%l6] 0x18,	%g2,	%i2
	sethi	0x13DB,	%i7
	or	%i5,	%i4,	%l4
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
	smul	%g6,	%i1,	%g4
	movcs	%xcc,	%l6,	%g5
	tle	%xcc,	0x2
loop_992:
	fbug	%fcc0,	loop_993
	faligndata	%f18,	%f22,	%f16
	srl	%l5,	%o7,	%i3
	popc	%o0,	%i0
loop_993:
	fmovspos	%icc,	%f7,	%f6
	array32	%o1,	%o2,	%i6
	ldsb	[%l7 + 0x5D],	%o3
	edge8n	%l3,	%l2,	%g1
	orn	%o4,	%o6,	%g3
	fmovrslz	%l1,	%f14,	%f31
	fbu,a	%fcc1,	loop_994
	addcc	%l0,	0x0FFF,	%o5
	mova	%icc,	%g2,	%g7
	tleu	%xcc,	0x0
loop_994:
	movneg	%icc,	%i2,	%i5
	udiv	%i4,	0x1099,	%i7
	nop
	setx loop_995, %l0, %l1
	jmpl %l1, %g6
	nop
	setx	0xDD25516D,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f3
	fsqrts	%f3,	%f31
	movre	%l4,	%g4,	%i1
	fbo	%fcc0,	loop_996
loop_995:
	sdivx	%l6,	0x0F37,	%g5
	sdivx	%o7,	0x07D9,	%l5
	array8	%i3,	%i0,	%o0
loop_996:
	andncc	%o2,	%i6,	%o3
	tpos	%xcc,	0x6
	sethi	0x0E4C,	%o1
	tsubcctv	%l2,	0x1D5B,	%g1
	sdivcc	%o4,	0x1E62,	%l3
	movpos	%icc,	%g3,	%o6
	fmovspos	%icc,	%f5,	%f22
	array16	%l1,	%o5,	%g2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbu	%fcc0,	loop_997
	fcmpgt16	%f20,	%f0,	%l0
	tg	%icc,	0x4
	fmovrslez	%i2,	%f14,	%f8
loop_997:
	smul	%g7,	%i5,	%i4
	edge16ln	%g6,	%i7,	%g4
	add	%l4,	0x1036,	%i1
	movrlz	%g5,	%o7,	%l6
	be,pn	%icc,	loop_998
	movle	%xcc,	%l5,	%i3
	addc	%o0,	%i0,	%o2
	fmuld8sux16	%f2,	%f10,	%f8
loop_998:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdvc	%icc,	%f0,	%f31
	bvc,a,pn	%xcc,	loop_999
	st	%f19,	[%l7 + 0x14]
	fabsd	%f4,	%f28
	fxor	%f16,	%f20,	%f20
loop_999:
	mulscc	%i6,	%o3,	%o1
	nop
	setx	0x979FE765A002CF5F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0x9B3A350F78E10113,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	fsubd	%f16,	%f8,	%f14
	movneg	%icc,	%l2,	%o4
	ldsh	[%l7 + 0x48],	%g1
	movrne	%l3,	0x030,	%o6
	fnot1s	%f22,	%f13
	orn	%l1,	0x1F5D,	%o5
	move	%icc,	%g2,	%g3
	std	%f0,	[%l7 + 0x10]
	edge16ln	%i2,	%g7,	%l0
	add	%i5,	0x041E,	%i4
	addccc	%i7,	0x04E4,	%g6
	ble	loop_1000
	fbuge,a	%fcc2,	loop_1001
	fbl,a	%fcc2,	loop_1002
	bvs,a,pt	%icc,	loop_1003
loop_1000:
	srlx	%l4,	0x0D,	%i1
loop_1001:
	sethi	0x1EEE,	%g5
loop_1002:
	ldsb	[%l7 + 0x6B],	%o7
loop_1003:
	fornot1s	%f3,	%f3,	%f5
	movrlz	%g4,	%l5,	%l6
	movle	%icc,	%i3,	%o0
	umulcc	%o2,	0x0B47,	%i6
	array16	%i0,	%o1,	%l2
	tn	%icc,	0x4
	fcmpgt32	%f18,	%f16,	%o3
	movge	%xcc,	%g1,	%o4
	brz,a	%o6,	loop_1004
	tl	%icc,	0x4
	udivx	%l1,	0x0010,	%o5
	umul	%g2,	%g3,	%l3
loop_1004:
	addccc	%g7,	%l0,	%i2
	array32	%i5,	%i7,	%g6
	set	0x44, %g5
	lda	[%l7 + %g5] 0x80,	%f15
	udiv	%l4,	0x14A2,	%i4
	fnot1s	%f8,	%f31
	nop
	fitod	%f10,	%f8
	fdtox	%f8,	%f10
	fxtod	%f10,	%f22
	tn	%icc,	0x5
	fbul	%fcc0,	loop_1005
	te	%xcc,	0x1
	edge8l	%i1,	%o7,	%g5
	fbn,a	%fcc2,	loop_1006
loop_1005:
	mulx	%g4,	%l6,	%l5
	fbu	%fcc0,	loop_1007
	addccc	%i3,	0x090C,	%o2
loop_1006:
	movge	%xcc,	%i6,	%o0
	tneg	%icc,	0x2
loop_1007:
	nop
	wr	%g0,	0x19,	%asi
	lduba	[%l7 + 0x46] %asi,	%o1
	tcc	%icc,	0x4
	fxnors	%f15,	%f29,	%f13
	andcc	%i0,	0x1713,	%l2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldd	[%l7 + 0x08],	%o2
	xor	%o4,	%o6,	%g1
	umulcc	%o5,	%g2,	%g3
	nop
	setx	0xF05D9BDD,	%l0,	%l6
	st	%l6,	[%l7 + 0x68]
	ld	[%l7 + 0x68],	%fsr
	fmovdcc	%icc,	%f18,	%f17
	fandnot2s	%f28,	%f20,	%f3
	fpadd32	%f28,	%f18,	%f24
	ldstub	[%l7 + 0x59],	%l1
	fmovdne	%icc,	%f11,	%f23
	flush	%l7 + 0x30
	add	%l3,	0x1502,	%l0
	brnz	%g7,	loop_1008
	sdivcc	%i5,	0x1B4F,	%i7
	bge,a,pn	%xcc,	loop_1009
	orn	%i2,	0x1EE3,	%g6
loop_1008:
	fbul	%fcc0,	loop_1010
	sdivcc	%i4,	0x1DAB,	%i1
loop_1009:
	fmovrsgz	%l4,	%f30,	%f17
	tl	%xcc,	0x2
loop_1010:
	alignaddr	%g5,	%o7,	%g4
	wr	%g0,	0x4f,	%asi
	ldxa	[%g0 + 0x30] %asi,	%l6
	tg	%icc,	0x5
	taddcc	%i3,	0x045B,	%l5
	tleu	%icc,	0x2
	set	0x18, %l3
	stha	%i6,	[%l7 + %l3] 0x11
	fandnot2s	%f14,	%f31,	%f14
	nop
	setx	0x3513E0A5,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f24
	setx	0xE4CBF274,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f8
	fsubs	%f8,	%f24,	%f10
	udivcc	%o2,	0x0522,	%o1
	movle	%icc,	%i0,	%o0
	bgu	loop_1011
	subcc	%o3,	0x1301,	%o4
	movle	%icc,	%o6,	%l2
	edge16n	%o5,	%g1,	%g3
loop_1011:
	sllx	%g2,	0x1C,	%l3
	movvc	%icc,	%l0,	%l1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	membar	0x69
	wr	%g0,	0x1f,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
	set	0x73, %i0
	ldstuba	[%l7 + %i0] 0x89,	%g7
	edge16n	%i7,	%i5,	%g6
	smulcc	%i2,	0x031A,	%i4
	tpos	%icc,	0x0
	fmovsl	%icc,	%f15,	%f10
	tsubcctv	%i1,	0x035F,	%l4
	edge16l	%g5,	%g4,	%l6
	fmovsn	%xcc,	%f10,	%f16
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	membar	0x26
	sethi	0x0FC5,	%o7
	bl,a,pt	%icc,	loop_1012
	orcc	%l5,	%i3,	%o2
	subcc	%i6,	%i0,	%o0
	fmovrde	%o1,	%f16,	%f12
loop_1012:
	bne,a	loop_1013
	addc	%o4,	0x184E,	%o3
	nop
	fitod	%f12,	%f22
	fdtox	%f22,	%f28
	tl	%xcc,	0x4
loop_1013:
	movvs	%icc,	%l2,	%o5
	edge16ln	%o6,	%g1,	%g2
	bcc,pt	%icc,	loop_1014
	fbe,a	%fcc1,	loop_1015
	nop
	fitos	%f2,	%f30
	fstod	%f30,	%f14
	tcs	%icc,	0x5
loop_1014:
	add	%l3,	0x0A38,	%g3
loop_1015:
	andn	%l0,	%g7,	%l1
	fmovspos	%xcc,	%f31,	%f4
	sll	%i7,	0x14,	%i5
	fcmpeq16	%f30,	%f28,	%g6
	fmovrslez	%i2,	%f7,	%f10
	movle	%xcc,	%i4,	%l4
	tgu	%icc,	0x4
	taddcctv	%i1,	0x15AD,	%g4
	ldstub	[%l7 + 0x60],	%l6
	edge16l	%g5,	%o7,	%i3
	movne	%icc,	%l5,	%o2
	membar	0x5E
	fbu,a	%fcc0,	loop_1016
	umul	%i6,	%o0,	%i0
	movneg	%icc,	%o4,	%o3
	set	0x20, %l1
	stwa	%o1,	[%l7 + %l1] 0x22
	membar	#Sync
loop_1016:
	nop
	setx	0x9EADC2D54066D7A9,	%l0,	%l6
	stx	%l6,	[%l7 + 0x78]
	ldx	[%l7 + 0x78],	%fsr
	set	0x44, %o0
	sta	%f14,	[%l7 + %o0] 0x88
	or	%o5,	0x03B3,	%l2
	xnor	%o6,	0x0FC5,	%g1
	movcs	%xcc,	%g2,	%l3
	tge	%icc,	0x2
	sethi	0x1F03,	%l0
	tcc	%icc,	0x4
	tle	%xcc,	0x7
	srlx	%g7,	%g3,	%i7
	nop
	setx loop_1017, %l0, %l1
	jmpl %l1, %i5
	edge8ln	%g6,	%i2,	%l1
	and	%i4,	%i1,	%l4
	fpack32	%f4,	%f24,	%f30
loop_1017:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	setx	0x40E30159,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f28
	setx	0x00D44CBA,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f1
	fmuls	%f1,	%f28,	%f24
	movpos	%icc,	%l6,	%g5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bne,pt	%xcc,	loop_1018
	xor	%g4,	%i3,	%l5
	movre	%o7,	0x092,	%i6
	fba	%fcc0,	loop_1019
loop_1018:
	ldsb	[%l7 + 0x53],	%o2
	sir	0x1B80
	wr	%g0,	0x88,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
loop_1019:
	movleu	%icc,	%o0,	%o4
	stb	%i0,	[%l7 + 0x73]
	ta	%xcc,	0x6
	movvs	%icc,	%o3,	%o5
	tneg	%icc,	0x3
	edge8l	%o1,	%l2,	%o6
	tsubcctv	%g2,	%l3,	%g1
	movrlez	%g7,	%l0,	%g3
	tgu	%icc,	0x2
	fba	%fcc1,	loop_1020
	bge	%xcc,	loop_1021
	smulcc	%i5,	0x025F,	%i7
	stbar
loop_1020:
	tge	%xcc,	0x4
loop_1021:
	sdivcc	%i2,	0x0057,	%g6
	orn	%l1,	%i1,	%l4
	xorcc	%l6,	%g5,	%i4
	bneg,a	loop_1022
	fbe,a	%fcc2,	loop_1023
	tne	%icc,	0x4
	fmovsvs	%xcc,	%f1,	%f5
loop_1022:
	smulcc	%i3,	%l5,	%o7
loop_1023:
	subc	%g4,	%o2,	%i6
	nop
	setx	0xE8A8289C,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f6
	setx	0x9D1F84C2,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f12
	fadds	%f12,	%f6,	%f24
	fbe	%fcc1,	loop_1024
	fxors	%f30,	%f26,	%f31
	fone	%f30
	sdiv	%o4,	0x139D,	%o0
loop_1024:
	edge16	%i0,	%o3,	%o5
	fmovdgu	%xcc,	%f30,	%f24
	tneg	%icc,	0x5
	brgez,a	%l2,	loop_1025
	addc	%o6,	0x0341,	%o1
	fmovdneg	%icc,	%f25,	%f31
	movne	%xcc,	%g2,	%l3
loop_1025:
	movcs	%xcc,	%g7,	%g1
	fmovde	%icc,	%f0,	%f10
	addcc	%l0,	0x0D06,	%g3
	umul	%i5,	%i2,	%i7
	brz,a	%l1,	loop_1026
	fmovse	%xcc,	%f3,	%f11
	srax	%g6,	%l4,	%i1
	umul	%l6,	%g5,	%i3
loop_1026:
	movrgz	%l5,	0x04F,	%o7
	lduh	[%l7 + 0x10],	%g4
	sllx	%o2,	0x1E,	%i6
	tle	%icc,	0x2
	ldx	[%l7 + 0x20],	%i4
	fpsub16s	%f30,	%f3,	%f17
	movne	%xcc,	%o0,	%o4
	udivcc	%o3,	0x0A05,	%i0
	umul	%l2,	%o6,	%o1
	movl	%icc,	%g2,	%o5
	fmovdgu	%icc,	%f13,	%f10
	bneg,pn	%xcc,	loop_1027
	fandnot1	%f20,	%f4,	%f10
	edge32	%l3,	%g7,	%l0
	smulcc	%g3,	0x1899,	%i5
loop_1027:
	bneg,a	%xcc,	loop_1028
	tvc	%xcc,	0x5
	array8	%i2,	%i7,	%g1
	bleu,pt	%xcc,	loop_1029
loop_1028:
	bn,a,pt	%icc,	loop_1030
	tl	%icc,	0x5
	andncc	%g6,	%l4,	%i1
loop_1029:
	movvs	%icc,	%l6,	%g5
loop_1030:
	fmuld8ulx16	%f1,	%f30,	%f30
	array32	%l1,	%l5,	%o7
	edge16l	%i3,	%g4,	%o2
	fnor	%f6,	%f30,	%f0
	ta	%icc,	0x2
	xorcc	%i4,	%o0,	%i6
	xorcc	%o4,	%o3,	%l2
	movcs	%xcc,	%o6,	%o1
	fbge,a	%fcc1,	loop_1031
	add	%i0,	0x1B24,	%o5
	edge16ln	%l3,	%g7,	%l0
	fmul8x16al	%f11,	%f21,	%f4
loop_1031:
	movge	%xcc,	%g3,	%g2
	movcc	%icc,	%i5,	%i2
	nop
	fitod	%f0,	%f0
	fdtox	%f0,	%f22
	movle	%xcc,	%g1,	%g6
	be,a	loop_1032
	fbg	%fcc2,	loop_1033
	movvc	%xcc,	%l4,	%i1
	fabsd	%f28,	%f14
loop_1032:
	nop
	wr	%g0,	0x04,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
loop_1033:
	movg	%icc,	%l6,	%g5
	stw	%i7,	[%l7 + 0x14]
	bg,a,pt	%xcc,	loop_1034
	move	%xcc,	%l5,	%l1
	set	0x40, %o7
	ldda	[%l7 + %o7] 0x15,	%f16
loop_1034:
	fand	%f22,	%f16,	%f26
	fmovrsgz	%i3,	%f22,	%f31
	tcs	%icc,	0x1
	taddcc	%g4,	0x08DC,	%o7
	fmovsvc	%xcc,	%f13,	%f23
	xorcc	%o2,	0x06D3,	%o0
	fandnot1s	%f17,	%f13,	%f10
	fpadd32	%f30,	%f10,	%f30
	tne	%xcc,	0x7
	ldd	[%l7 + 0x50],	%i6
	addccc	%i4,	0x1966,	%o3
	brgez	%l2,	loop_1035
	tneg	%xcc,	0x1
	fbug,a	%fcc3,	loop_1036
	popc	0x0DE3,	%o6
loop_1035:
	taddcc	%o1,	0x0D64,	%o4
	fnot2	%f24,	%f24
loop_1036:
	sdivcc	%i0,	0x0340,	%o5
	fble,a	%fcc1,	loop_1037
	srax	%l3,	%g7,	%l0
	lduw	[%l7 + 0x28],	%g2
	fblg	%fcc1,	loop_1038
loop_1037:
	edge16l	%g3,	%i2,	%g1
	movneg	%icc,	%i5,	%g6
	edge32ln	%i1,	%l4,	%g5
loop_1038:
	nop
	setx	loop_1039,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	stbar
	fnands	%f26,	%f28,	%f17
	orn	%i7,	0x08B9,	%l6
loop_1039:
	movn	%xcc,	%l5,	%i3
	addcc	%g4,	0x0015,	%l1
	edge8	%o2,	%o0,	%o7
	tcc	%xcc,	0x5
	mova	%xcc,	%i6,	%i4
	fpackfix	%f12,	%f10
	fble,a	%fcc2,	loop_1040
	edge16	%o3,	%l2,	%o6
	xnorcc	%o1,	%o4,	%o5
	taddcc	%i0,	0x06A8,	%l3
loop_1040:
	udivx	%l0,	0x0659,	%g7
	movrne	%g3,	0x1F9,	%i2
	flush	%l7 + 0x64
	fbl,a	%fcc1,	loop_1041
	sub	%g2,	0x19D7,	%i5
	te	%xcc,	0x4
	move	%icc,	%g1,	%i1
loop_1041:
	srax	%g6,	%g5,	%l4
	fbu	%fcc2,	loop_1042
	tcc	%xcc,	0x5
	edge32n	%l6,	%l5,	%i7
	xor	%g4,	%l1,	%i3
loop_1042:
	fpmerge	%f29,	%f14,	%f8
	ldx	[%l7 + 0x18],	%o0
	fbu,a	%fcc0,	loop_1043
	smulcc	%o7,	0x0E41,	%i6
	fmuld8sux16	%f3,	%f16,	%f30
	fpadd16	%f10,	%f6,	%f4
loop_1043:
	sra	%i4,	%o3,	%l2
	tvc	%icc,	0x4
	movrlez	%o2,	0x160,	%o6
	set	0x75, %l5
	ldstuba	[%l7 + %l5] 0x88,	%o4
	edge16n	%o5,	%o1,	%l3
	edge8n	%i0,	%g7,	%l0
	fzeros	%f1
	movne	%xcc,	%g3,	%g2
	movre	%i2,	0x060,	%i5
	fbg,a	%fcc1,	loop_1044
	tsubcc	%i1,	%g6,	%g1
	array8	%g5,	%l6,	%l4
	movre	%i7,	%l5,	%g4
loop_1044:
	andn	%i3,	0x04FE,	%l1
	add	%o0,	%i6,	%i4
	edge8	%o7,	%o3,	%o2
	movvc	%xcc,	%l2,	%o4
	movle	%xcc,	%o6,	%o5
	fpadd32	%f2,	%f22,	%f18
	ble,pt	%icc,	loop_1045
	tge	%icc,	0x6
	swap	[%l7 + 0x78],	%l3
	mova	%icc,	%o1,	%i0
loop_1045:
	nop
	set	0x50, %g2
	prefetcha	[%l7 + %g2] 0x15,	 0x1
	fabss	%f12,	%f11
	fbn	%fcc3,	loop_1046
	edge16l	%l0,	%g2,	%i2
	fmovrsgz	%i5,	%f1,	%f24
	edge32n	%i1,	%g3,	%g1
loop_1046:
	subc	%g6,	%l6,	%g5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	brlez,a	%l4,	loop_1047
	edge16	%i7,	%l5,	%g4
	wr	%g0,	0x0c,	%asi
	lduha	[%l7 + 0x76] %asi,	%l1
loop_1047:
	movg	%icc,	%i3,	%i6
	sir	0x11E4
	orn	%o0,	0x157A,	%i4
	fpadd32s	%f23,	%f8,	%f19
	sethi	0x14B7,	%o3
	bl,pn	%xcc,	loop_1048
	srax	%o7,	%l2,	%o4
	fandnot1s	%f13,	%f6,	%f27
	set	0x30, %l2
	ldswa	[%l7 + %l2] 0x14,	%o6
loop_1048:
	movcc	%icc,	%o2,	%l3
	fbuge	%fcc1,	loop_1049
	tgu	%icc,	0x3
	tsubcctv	%o1,	%o5,	%g7
	te	%icc,	0x4
loop_1049:
	fpadd16	%f14,	%f10,	%f0
	or	%l0,	0x19CF,	%g2
	sll	%i0,	0x0F,	%i5
	nop
	setx	0x7B00FD43,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f8
	setx	0x14730D02,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f4
	fdivs	%f4,	%f8,	%f23
	orcc	%i1,	%g3,	%g1
	subccc	%g6,	0x160C,	%i2
	sllx	%l6,	%g5,	%i7
	fmovrdgez	%l4,	%f2,	%f16
	udivx	%g4,	0x1A35,	%l1
	movvs	%xcc,	%l5,	%i6
	bl,pn	%xcc,	loop_1050
	fbule	%fcc3,	loop_1051
	tsubcc	%o0,	0x0A7B,	%i3
	fmovrse	%o3,	%f1,	%f14
loop_1050:
	fbo	%fcc3,	loop_1052
loop_1051:
	array16	%i4,	%l2,	%o7
	fcmple32	%f8,	%f6,	%o4
	sll	%o6,	%l3,	%o1
loop_1052:
	edge8	%o5,	%g7,	%o2
	fbn	%fcc2,	loop_1053
	fmovspos	%xcc,	%f1,	%f23
	movgu	%icc,	%l0,	%g2
	tgu	%icc,	0x2
loop_1053:
	fmovdne	%icc,	%f1,	%f16
	fmovsn	%icc,	%f24,	%f29
	movge	%xcc,	%i5,	%i1
	fnot1s	%f15,	%f20
	set	0x68, %i7
	stxa	%g3,	[%l7 + %i7] 0x23
	membar	#Sync
	sir	0x0735
	movvs	%icc,	%g1,	%g6
	edge8n	%i0,	%i2,	%g5
	bgu,a,pn	%icc,	loop_1054
	swap	[%l7 + 0x30],	%i7
	srl	%l4,	0x03,	%l6
	sethi	0x0FD7,	%l1
loop_1054:
	brgz	%g4,	loop_1055
	mulscc	%i6,	0x1E8E,	%l5
	tvc	%xcc,	0x7
	movvc	%xcc,	%i3,	%o0
loop_1055:
	addcc	%o3,	0x10D0,	%i4
	movvc	%icc,	%o7,	%l2
	fmovdge	%icc,	%f20,	%f7
	fmovrsgz	%o6,	%f29,	%f18
	fnegs	%f6,	%f14
	tl	%icc,	0x1
	alignaddrl	%l3,	%o4,	%o1
	wr	%g0,	0x10,	%asi
	sta	%f14,	[%l7 + 0x50] %asi
	taddcc	%g7,	0x1FE9,	%o2
	nop
	setx	loop_1056,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fmovdgu	%icc,	%f28,	%f17
	fzeros	%f27
	fbe	%fcc1,	loop_1057
loop_1056:
	smul	%o5,	%l0,	%i5
	brnz	%g2,	loop_1058
	edge16l	%g3,	%i1,	%g6
loop_1057:
	srax	%i0,	%i2,	%g1
	fmovrdlz	%g5,	%f10,	%f16
loop_1058:
	move	%xcc,	%l4,	%l6
	edge32n	%i7,	%l1,	%i6
	edge8l	%g4,	%l5,	%i3
	tgu	%xcc,	0x2
	fornot1	%f10,	%f18,	%f20
	movrgez	%o0,	%o3,	%i4
	alignaddr	%o7,	%l2,	%l3
	fmovdg	%xcc,	%f18,	%f29
	tg	%icc,	0x0
	tsubcc	%o4,	%o6,	%g7
	udivcc	%o1,	0x0154,	%o2
	tneg	%xcc,	0x4
	edge8n	%o5,	%i5,	%g2
	tgu	%xcc,	0x7
	edge16	%g3,	%i1,	%g6
	edge16	%i0,	%i2,	%l0
	ldsb	[%l7 + 0x3A],	%g5
	nop
	fitos	%f12,	%f30
	ldub	[%l7 + 0x23],	%l4
	tvc	%icc,	0x3
	fblg,a	%fcc2,	loop_1059
	edge16	%g1,	%l6,	%l1
	edge16n	%i6,	%g4,	%i7
	set	0x60, %o2
	prefetcha	[%l7 + %o2] 0x80,	 0x3
loop_1059:
	andcc	%l5,	0x04E9,	%o0
	srlx	%i4,	%o3,	%o7
	orncc	%l2,	%o4,	%l3
	sub	%o6,	%g7,	%o2
	array16	%o5,	%o1,	%i5
	srl	%g2,	%g3,	%i1
	alignaddrl	%i0,	%g6,	%l0
	sdivx	%g5,	0x1F14,	%i2
	fmuld8sux16	%f24,	%f10,	%f4
	fmovscs	%icc,	%f9,	%f15
	swap	[%l7 + 0x60],	%g1
	fxnors	%f9,	%f17,	%f17
	tl	%icc,	0x0
	fcmple16	%f28,	%f2,	%l6
	set	0x28, %o3
	sta	%f29,	[%l7 + %o3] 0x89
	membar	0x43
	tpos	%icc,	0x3
	fpadd16	%f18,	%f24,	%f10
	nop
	setx	loop_1060,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tne	%xcc,	0x3
	movneg	%icc,	%l1,	%l4
	fbg	%fcc2,	loop_1061
loop_1060:
	fmovscc	%xcc,	%f24,	%f25
	smulcc	%i6,	0x1A05,	%g4
	fcmpne16	%f20,	%f18,	%i3
loop_1061:
	add	%i7,	%l5,	%o0
	xnorcc	%i4,	%o7,	%o3
	stbar
	tleu	%icc,	0x1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tgu	%icc,	0x6
	bne	loop_1062
	ldd	[%l7 + 0x68],	%o4
	fmovrslez	%l2,	%f11,	%f13
	stx	%l3,	[%l7 + 0x50]
loop_1062:
	nop
	set	0x50, %i1
	ldswa	[%l7 + %i1] 0x10,	%o6
	bpos,a,pt	%xcc,	loop_1063
	nop
	fitod	%f8,	%f14
	fdtox	%f14,	%f26
	fxtod	%f26,	%f22
	fmovdge	%xcc,	%f17,	%f10
	subc	%o2,	0x1547,	%g7
loop_1063:
	srlx	%o1,	%i5,	%g2
	fbge,a	%fcc3,	loop_1064
	bvs	loop_1065
	bleu	%xcc,	loop_1066
	subcc	%g3,	%i1,	%i0
loop_1064:
	umul	%o5,	%l0,	%g5
loop_1065:
	movrgez	%g6,	%g1,	%l6
loop_1066:
	fandnot2	%f18,	%f26,	%f28
	edge8l	%l1,	%l4,	%i2
	array8	%g4,	%i3,	%i7
	add	%l5,	%i6,	%i4
	fba,a	%fcc3,	loop_1067
	umul	%o7,	0x1EF1,	%o0
	movne	%xcc,	%o3,	%o4
	udiv	%l3,	0x17BF,	%o6
loop_1067:
	taddcc	%o2,	0x1885,	%l2
	movle	%xcc,	%g7,	%i5
	movre	%g2,	0x0EB,	%g3
	fbn	%fcc2,	loop_1068
	tsubcc	%i1,	0x06A5,	%o1
	addc	%i0,	0x140A,	%l0
	movneg	%xcc,	%o5,	%g5
loop_1068:
	lduw	[%l7 + 0x34],	%g6
	fba,a	%fcc3,	loop_1069
	mulx	%l6,	%l1,	%l4
	orncc	%i2,	%g1,	%g4
	movg	%xcc,	%i3,	%i7
loop_1069:
	mulx	%l5,	0x0143,	%i4
	fmovscs	%icc,	%f12,	%f23
	or	%i6,	0x120E,	%o0
	ldsb	[%l7 + 0x1D],	%o7
	array16	%o3,	%l3,	%o4
	edge16l	%o6,	%l2,	%o2
	tg	%icc,	0x6
	sdivcc	%i5,	0x0C02,	%g2
	fmovsleu	%icc,	%f23,	%f30
	movle	%icc,	%g7,	%g3
	movrne	%o1,	0x1E0,	%i0
	nop
	setx	0x5E8222EA,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f5
	setx	0xA743585F,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f6
	fdivs	%f6,	%f5,	%f13
	set	0x45, %i3
	ldsba	[%l7 + %i3] 0x10,	%l0
	udivcc	%i1,	0x1965,	%o5
	edge16ln	%g6,	%l6,	%l1
	tneg	%icc,	0x7
	edge8ln	%l4,	%g5,	%g1
	wr	%g0,	0x89,	%asi
	stha	%g4,	[%l7 + 0x70] %asi
	stx	%i3,	[%l7 + 0x18]
	fmovsne	%icc,	%f19,	%f13
	stbar
	movn	%icc,	%i2,	%i7
	alignaddr	%i4,	%l5,	%o0
	nop
	setx	0x90729066,	%l0,	%l6
	st	%l6,	[%l7 + 0x34]
	ld	[%l7 + 0x34],	%fsr
	edge8n	%i6,	%o7,	%o3
	srax	%l3,	0x05,	%o6
	movge	%icc,	%l2,	%o2
	popc	%o4,	%g2
	tle	%xcc,	0x0
	movre	%i5,	0x2FB,	%g3
	movgu	%icc,	%o1,	%i0
	smul	%l0,	0x189B,	%g7
	edge8n	%i1,	%o5,	%g6
	stx	%l6,	[%l7 + 0x50]
	srl	%l1,	0x1A,	%g5
	alignaddrl	%g1,	%l4,	%i3
	tcc	%icc,	0x7
	move	%xcc,	%g4,	%i2
	ld	[%l7 + 0x74],	%f30
	edge32ln	%i7,	%i4,	%l5
	fxor	%f2,	%f24,	%f12
	set	0x0D, %l6
	stba	%i6,	[%l7 + %l6] 0x04
	xnor	%o7,	0x193A,	%o0
	fmovdg	%xcc,	%f21,	%f25
	tg	%xcc,	0x6
	tsubcctv	%l3,	%o6,	%o3
	ldx	[%l7 + 0x40],	%l2
	faligndata	%f14,	%f14,	%f8
	sir	0x1102
	sdivcc	%o4,	0x01D3,	%g2
	movge	%icc,	%o2,	%i5
	set	0x2B, %o1
	ldstuba	[%l7 + %o1] 0x89,	%o1
	movrlez	%g3,	0x116,	%l0
	tvc	%xcc,	0x5
	tvs	%xcc,	0x3
	tg	%icc,	0x6
	fmovrsgez	%i0,	%f21,	%f15
	alignaddr	%g7,	%i1,	%o5
	fcmpne32	%f20,	%f24,	%l6
	movg	%xcc,	%l1,	%g5
	fpadd32s	%f20,	%f30,	%f13
	alignaddr	%g6,	%l4,	%i3
	membar	0x03
	sdivcc	%g4,	0x1C2B,	%g1
	movrlz	%i2,	0x2E3,	%i7
	edge8n	%i4,	%l5,	%o7
	tsubcctv	%i6,	%l3,	%o0
	fmovdl	%icc,	%f26,	%f18
	umulcc	%o3,	0x186B,	%l2
	call	loop_1070
	fmovdne	%xcc,	%f18,	%f16
	lduw	[%l7 + 0x6C],	%o4
	movcc	%xcc,	%o6,	%o2
loop_1070:
	faligndata	%f30,	%f12,	%f12
	fornot2s	%f23,	%f4,	%f0
	andncc	%i5,	%g2,	%g3
	movl	%icc,	%o1,	%i0
	movneg	%icc,	%g7,	%i1
	brgez,a	%o5,	loop_1071
	subcc	%l0,	%l6,	%l1
	bvs	loop_1072
	addc	%g6,	0x0E0A,	%g5
loop_1071:
	lduh	[%l7 + 0x76],	%i3
	edge32n	%g4,	%g1,	%l4
loop_1072:
	stx	%i2,	[%l7 + 0x28]
	nop
	setx	0x68F6829AB5231268,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0x7B4396F5DA25E2E7,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	fdivd	%f26,	%f10,	%f12
	fcmpne16	%f8,	%f8,	%i4
	fpadd32	%f14,	%f2,	%f6
	srax	%i7,	%l5,	%o7
	ldub	[%l7 + 0x7C],	%i6
	umulcc	%l3,	0x1BB0,	%o3
	bleu	%icc,	loop_1073
	stx	%o0,	[%l7 + 0x70]
	movgu	%xcc,	%l2,	%o6
	subcc	%o4,	0x0227,	%o2
loop_1073:
	smulcc	%g2,	0x17B2,	%i5
	subc	%g3,	0x196B,	%i0
	stb	%g7,	[%l7 + 0x65]
	tcc	%xcc,	0x4
	udivcc	%i1,	0x0427,	%o5
	taddcctv	%o1,	0x118A,	%l0
	orncc	%l6,	%g6,	%l1
	tvs	%xcc,	0x2
	mulscc	%i3,	0x1305,	%g4
	fandnot2s	%f22,	%f4,	%f15
	addc	%g1,	0x13FD,	%g5
	bn,pn	%xcc,	loop_1074
	fmovscc	%xcc,	%f7,	%f24
	brgz,a	%l4,	loop_1075
	fone	%f2
loop_1074:
	fmovrde	%i2,	%f28,	%f6
	set	0x10, %l4
	stxa	%i4,	[%l7 + %l4] 0x80
loop_1075:
	movpos	%icc,	%i7,	%l5
	nop
	setx	0x0D090CE7B94CFFF8,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0x67586371C68FB8EE,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	fsubd	%f4,	%f10,	%f22
	movvs	%icc,	%i6,	%o7
	set	0x1C, %g7
	swapa	[%l7 + %g7] 0x80,	%o3
	nop
	setx	loop_1076,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	stx	%o0,	[%l7 + 0x08]
	movleu	%icc,	%l2,	%o6
	fmovdle	%icc,	%f28,	%f27
loop_1076:
	sethi	0x034C,	%l3
	sll	%o2,	0x05,	%o4
	fmovsl	%xcc,	%f5,	%f15
	fmovde	%xcc,	%f7,	%f15
	sdivcc	%g2,	0x1B87,	%g3
	set	0x2F, %i2
	stba	%i5,	[%l7 + %i2] 0x2a
	membar	#Sync
	smulcc	%g7,	%i1,	%o5
	bneg,a,pn	%xcc,	loop_1077
	fpadd32	%f4,	%f0,	%f18
	bn	loop_1078
	fbule	%fcc1,	loop_1079
loop_1077:
	udivx	%o1,	0x0D33,	%l0
	umul	%i0,	0x199A,	%l6
loop_1078:
	brnz,a	%g6,	loop_1080
loop_1079:
	edge32n	%l1,	%g4,	%g1
	udivcc	%g5,	0x09DF,	%l4
	add	%l7,	0x74,	%l6
	wr	%g0,	0x11,	%asi
	casa	[%l6] %asi,	%i3,	%i4
loop_1080:
	mova	%icc,	%i2,	%i7
	fmovsvc	%icc,	%f5,	%f1
	fands	%f24,	%f28,	%f15
	movne	%xcc,	%l5,	%o7
	xnorcc	%i6,	%o0,	%l2
	bg,a	loop_1081
	tcc	%xcc,	0x7
	bgu,a	%icc,	loop_1082
	fmovrdne	%o3,	%f4,	%f24
loop_1081:
	nop
	setx	0xFA60D59CC953603F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	setx	0xB4B9F95B3A5B4AE4,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	fsubd	%f12,	%f18,	%f10
	edge16ln	%o6,	%l3,	%o2
loop_1082:
	movrgez	%o4,	0x128,	%g3
	fbe,a	%fcc1,	loop_1083
	ba,pn	%icc,	loop_1084
	movrlez	%i5,	0x09A,	%g7
	edge8	%i1,	%g2,	%o1
loop_1083:
	tg	%icc,	0x6
loop_1084:
	sra	%o5,	%i0,	%l0
	fpadd32	%f22,	%f18,	%f4
	fmovrse	%l6,	%f17,	%f1
	fabsd	%f2,	%f26
	umulcc	%g6,	0x01DA,	%l1
	xorcc	%g4,	%g5,	%l4
	movg	%xcc,	%i3,	%i4
	fmovdleu	%icc,	%f24,	%f30
	andcc	%g1,	0x03AA,	%i2
	ld	[%l7 + 0x68],	%f9
	sll	%i7,	0x14,	%l5
	umulcc	%o7,	%i6,	%l2
	sra	%o0,	%o3,	%l3
	fbge	%fcc0,	loop_1085
	ldsh	[%l7 + 0x1C],	%o2
	fmovrslez	%o6,	%f30,	%f20
	tsubcctv	%g3,	0x12DF,	%o4
loop_1085:
	addc	%i5,	0x00E9,	%g7
	fnot2s	%f24,	%f13
	sdiv	%g2,	0x1097,	%o1
	srl	%i1,	%i0,	%l0
	fmovrsne	%l6,	%f26,	%f0
	for	%f20,	%f24,	%f30
	sdivcc	%o5,	0x0B71,	%g6
	fmovdn	%icc,	%f28,	%f24
	sdiv	%g4,	0x1E97,	%l1
	array32	%g5,	%i3,	%i4
	tge	%icc,	0x6
	movcc	%icc,	%g1,	%l4
	edge8l	%i2,	%i7,	%o7
	xorcc	%i6,	%l5,	%o0
	tpos	%xcc,	0x0
	bge,a,pt	%xcc,	loop_1086
	srl	%l2,	%o3,	%o2
	xor	%o6,	0x0E5A,	%g3
	mulscc	%l3,	0x18A2,	%i5
loop_1086:
	udiv	%o4,	0x1641,	%g2
	nop
	set	0x40, %o6
	ldsh	[%l7 + %o6],	%o1
	movcs	%icc,	%g7,	%i0
	nop
	setx	0xBD38BEDA,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f3
	setx	0xD385CEE1,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f5
	fadds	%f5,	%f3,	%f28
	brnz	%l0,	loop_1087
	smulcc	%i1,	%l6,	%o5
	smulcc	%g6,	0x0B05,	%l1
	movvc	%icc,	%g5,	%g4
loop_1087:
	sdiv	%i4,	0x13ED,	%g1
	sdiv	%l4,	0x04FA,	%i2
	movle	%xcc,	%i3,	%i7
	tsubcctv	%o7,	0x180A,	%i6
	smulcc	%o0,	0x0734,	%l2
	fmovrse	%o3,	%f11,	%f12
	fsrc1s	%f17,	%f22
	fmovrdgz	%o2,	%f8,	%f2
	ta	%xcc,	0x0
	nop
	setx	0x2057EAB9,	%l0,	%l6
	st	%l6,	[%l7 + 0x0C]
	ld	[%l7 + 0x0C],	%fsr
	tg	%icc,	0x5
	lduw	[%l7 + 0x20],	%o6
	movvc	%icc,	%g3,	%l5
	stw	%i5,	[%l7 + 0x30]
	andn	%l3,	%o4,	%o1
	movle	%icc,	%g7,	%g2
	nop
	setx	0x4BF3067A,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f18
	setx	0x44155260,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f17
	fmuls	%f17,	%f18,	%f9
	sll	%i0,	%l0,	%i1
	edge32n	%o5,	%l6,	%g6
	brnz,a	%g5,	loop_1088
	array32	%l1,	%g4,	%i4
	or	%g1,	0x127D,	%i2
	array8	%l4,	%i7,	%o7
loop_1088:
	edge8	%i3,	%i6,	%o0
	ldstub	[%l7 + 0x1A],	%l2
	wr	%g0,	0x89,	%asi
	ldxa	[%l7 + 0x68] %asi,	%o3
	wr	%g0,	0x81,	%asi
	swapa	[%l7 + 0x50] %asi,	%o2
	fxnors	%f13,	%f14,	%f17
	bcs	%xcc,	loop_1089
	umulcc	%g3,	0x0CE2,	%o6
	nop
	setx	0x661CBE3C85BF196E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0xE9BD188B0E562183,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	fdivd	%f10,	%f10,	%f20
	fbu,a	%fcc2,	loop_1090
loop_1089:
	movrne	%l5,	%l3,	%i5
	te	%xcc,	0x1
	subc	%o1,	0x0D92,	%o4
loop_1090:
	sub	%g7,	%i0,	%l0
	bvs,a,pt	%icc,	loop_1091
	fones	%f2
	fbne,a	%fcc0,	loop_1092
	movpos	%xcc,	%g2,	%i1
loop_1091:
	fmovrslz	%l6,	%f25,	%f27
	fmovsvs	%icc,	%f23,	%f30
loop_1092:
	brlz,a	%o5,	loop_1093
	fble,a	%fcc1,	loop_1094
	bne,pn	%xcc,	loop_1095
	tleu	%icc,	0x5
loop_1093:
	nop
	wr	%g0,	0x80,	%asi
	stha	%g6,	[%l7 + 0x5E] %asi
loop_1094:
	fmovdcc	%xcc,	%f18,	%f22
loop_1095:
	fnor	%f30,	%f8,	%f10
	fbl,a	%fcc2,	loop_1096
	sdivcc	%g5,	0x1453,	%l1
	wr	%g0,	0x10,	%asi
	ldsba	[%l7 + 0x70] %asi,	%g4
loop_1096:
	fmovsvc	%xcc,	%f25,	%f7
	prefetch	[%l7 + 0x78],	 0x0
	subccc	%g1,	0x1313,	%i2
	edge32ln	%i4,	%i7,	%l4
	taddcctv	%o7,	0x1FF8,	%i6
	nop
	setx	0xAE0EC060,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f19
	setx	0xFF6E70E5,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f27
	fsubs	%f27,	%f19,	%f5
	fbule	%fcc1,	loop_1097
	srax	%o0,	%i3,	%o3
	nop
	set	0x6C, %o4
	lduw	[%l7 + %o4],	%l2
	mulscc	%o2,	%g3,	%o6
loop_1097:
	fnor	%f20,	%f24,	%f22
	movle	%icc,	%l3,	%i5
	ldx	[%l7 + 0x68],	%o1
	fandnot1s	%f20,	%f4,	%f14
	brz	%l5,	loop_1098
	xorcc	%o4,	0x1511,	%i0
	movrlz	%l0,	0x005,	%g2
	movrlez	%i1,	0x0AC,	%g7
loop_1098:
	nop
	membar	#Sync
	set	0x40, %l0
	ldda	[%l7 + %l0] 0xf1,	%f16
	edge16n	%o5,	%g6,	%l6
	nop
	setx loop_1099, %l0, %l1
	jmpl %l1, %g5
	fcmpne16	%f8,	%f28,	%l1
	fmuld8sux16	%f21,	%f1,	%f30
	array16	%g1,	%i2,	%i4
loop_1099:
	nop
	add	%l7,	0x40,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%i7
	casxa	[%l6] 0x81,	%i7,	%l4
	fmovrsgz	%o7,	%f8,	%f18
	array32	%i6,	%o0,	%i3
	movrlz	%o3,	0x289,	%l2
	tle	%icc,	0x7
	array16	%o2,	%g3,	%o6
	move	%xcc,	%g4,	%l3
	nop
	setx	0x1891B46F,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f28
	setx	0xE2F804A0,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f20
	fdivs	%f20,	%f28,	%f14
	bvc,a	%xcc,	loop_1100
	brlez,a	%o1,	loop_1101
	brlz	%i5,	loop_1102
	lduw	[%l7 + 0x74],	%l5
loop_1100:
	movrlz	%o4,	%l0,	%g2
loop_1101:
	ta	%icc,	0x2
loop_1102:
	tge	%xcc,	0x3
	edge8	%i0,	%g7,	%i1
	tn	%xcc,	0x6
	edge16l	%g6,	%l6,	%o5
	tne	%icc,	0x7
	wr	%g0,	0x80,	%asi
	lduwa	[%l7 + 0x58] %asi,	%g5
	edge8n	%g1,	%l1,	%i4
	nop
	setx	0xEE7584D1ABD42029,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0x810D282DBF007E6C,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	fdivd	%f18,	%f24,	%f20
	sub	%i7,	%i2,	%l4
	orncc	%i6,	%o0,	%i3
	edge16ln	%o3,	%l2,	%o2
	ba,a,pt	%xcc,	loop_1103
	fandnot1	%f28,	%f10,	%f28
	brz	%g3,	loop_1104
	movvs	%icc,	%o7,	%g4
loop_1103:
	udiv	%l3,	0x153F,	%o6
	and	%i5,	0x18A4,	%l5
loop_1104:
	movcc	%icc,	%o1,	%o4
	ldx	[%l7 + 0x10],	%l0
	smul	%g2,	%i0,	%g7
	movrne	%g6,	0x14C,	%i1
	andncc	%l6,	%o5,	%g1
	fmovdleu	%xcc,	%f22,	%f25
	edge16ln	%g5,	%i4,	%i7
	tcs	%xcc,	0x4
	bvs,a	%xcc,	loop_1105
	xor	%l1,	%l4,	%i6
	movgu	%icc,	%i2,	%i3
	swap	[%l7 + 0x44],	%o0
loop_1105:
	subc	%o3,	0x0CEC,	%l2
	fzero	%f28
	movneg	%xcc,	%o2,	%g3
	alignaddr	%g4,	%l3,	%o7
	stb	%o6,	[%l7 + 0x1B]
	nop
	setx	0x74990171,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f19
	setx	0x91F857D6,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f30
	fsubs	%f30,	%f19,	%f15
	movrne	%i5,	%l5,	%o1
	movrgz	%l0,	0x36F,	%g2
	fbg,a	%fcc1,	loop_1106
	array8	%i0,	%o4,	%g6
	stw	%g7,	[%l7 + 0x08]
	edge8ln	%i1,	%o5,	%g1
loop_1106:
	movrlz	%g5,	%l6,	%i7
	umul	%l1,	%i4,	%l4
	mulscc	%i2,	%i6,	%o0
	faligndata	%f8,	%f24,	%f14
	lduw	[%l7 + 0x78],	%i3
	fbe	%fcc3,	loop_1107
	fnot2	%f8,	%f6
	fmovda	%icc,	%f18,	%f7
	subc	%o3,	0x106C,	%l2
loop_1107:
	bpos,a	loop_1108
	tleu	%xcc,	0x3
	brgez,a	%o2,	loop_1109
	tvc	%icc,	0x0
loop_1108:
	or	%g4,	%l3,	%g3
	tvc	%xcc,	0x4
loop_1109:
	nop
	setx	0x5049D83A7045BDA8,	%l0,	%l6
	stx	%l6,	[%l7 + 0x30]
	ldx	[%l7 + 0x30],	%fsr
	orcc	%o7,	%o6,	%i5
	fmul8sux16	%f8,	%f0,	%f10
	fpadd16	%f8,	%f28,	%f28
	mulscc	%o1,	%l0,	%g2
	pdist	%f10,	%f8,	%f16
	fmovscc	%icc,	%f20,	%f23
	fxors	%f19,	%f14,	%f4
	movpos	%xcc,	%l5,	%i0
	movne	%icc,	%o4,	%g7
	tle	%xcc,	0x0
	movrne	%g6,	%i1,	%g1
	membar	0x3F
	fmovse	%icc,	%f2,	%f16
	wr	%g0,	0x2a,	%asi
	stba	%g5,	[%l7 + 0x11] %asi
	membar	#Sync
	set	0x48, %g6
	ldxa	[%l7 + %g6] 0x11,	%o5
	mulscc	%i7,	0x021E,	%l6
	nop
	setx loop_1110, %l0, %l1
	jmpl %l1, %i4
	bvc,pt	%xcc,	loop_1111
	sra	%l4,	0x1E,	%l1
	orncc	%i6,	%i2,	%i3
loop_1110:
	sllx	%o3,	%l2,	%o0
loop_1111:
	fmovrsgez	%o2,	%f30,	%f30
	nop
	setx	0xA620751C,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f13
	setx	0x56BE05DC,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f0
	fsubs	%f0,	%f13,	%f14
	fmovrdgz	%l3,	%f16,	%f30
	sdivcc	%g4,	0x1909,	%o7
	udivx	%g3,	0x13F7,	%o6
	movvs	%icc,	%i5,	%l0
	fxor	%f12,	%f12,	%f10
	edge8l	%g2,	%l5,	%i0
	fbge,a	%fcc2,	loop_1112
	sdivx	%o4,	0x0E93,	%g7
	tgu	%xcc,	0x6
	bvs	%xcc,	loop_1113
loop_1112:
	fmovdgu	%xcc,	%f6,	%f28
	wr	%g0,	0x80,	%asi
	ldstuba	[%l7 + 0x77] %asi,	%o1
loop_1113:
	movgu	%xcc,	%g6,	%g1
	fabss	%f28,	%f13
	nop
	setx	0xC5E8D5030A743244,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	setx	0x098BBC7B315B687C,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	fsubd	%f2,	%f18,	%f28
	nop
	setx	0x0FBBDE04,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f4
	setx	0x9FEE364E,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f13
	fadds	%f13,	%f4,	%f1
	sth	%i1,	[%l7 + 0x4A]
	array16	%g5,	%o5,	%i7
	smulcc	%l6,	%i4,	%l1
	taddcctv	%l4,	0x1A51,	%i2
	fnor	%f12,	%f26,	%f0
	movl	%xcc,	%i6,	%o3
	set	0x0C, %g4
	sta	%f9,	[%l7 + %g4] 0x10
	fcmpgt16	%f28,	%f20,	%l2
	movl	%xcc,	%o0,	%i3
	subc	%o2,	%g4,	%o7
	fmovscc	%xcc,	%f14,	%f7
	edge8n	%g3,	%o6,	%l3
	movle	%xcc,	%l0,	%i5
	xorcc	%l5,	0x06FE,	%i0
	udivx	%g2,	0x1399,	%o4
	std	%f30,	[%l7 + 0x50]
	sethi	0x0D71,	%o1
	udivx	%g7,	0x02F5,	%g6
	tcs	%xcc,	0x2
	edge8l	%g1,	%g5,	%i1
	nop
	setx	0xCE48C343E04D7FC3,	%l0,	%l6
	stx	%l6,	[%l7 + 0x68]
	ldx	[%l7 + 0x68],	%fsr
	prefetch	[%l7 + 0x68],	 0x2
	nop
	setx	0x9BA8A15D30564A78,	%l0,	%l6
	stx	%l6,	[%l7 + 0x60]
	ldx	[%l7 + 0x60],	%fsr
	mulscc	%o5,	0x0F72,	%l6
	array8	%i7,	%i4,	%l4
	subccc	%l1,	%i6,	%o3
	alignaddrl	%l2,	%o0,	%i3
	tle	%icc,	0x3
	be	%xcc,	loop_1114
	tcs	%icc,	0x0
	taddcc	%i2,	%o2,	%g4
	tle	%xcc,	0x4
loop_1114:
	te	%xcc,	0x6
	and	%o7,	%g3,	%l3
	umul	%l0,	0x0D66,	%o6
	nop
	setx	0x845CC555F3F844B0,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0x01551A0D491EEA28,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fmuld	%f0,	%f16,	%f26
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subcc	%l5,	0x16F1,	%i5
	ld	[%l7 + 0x60],	%f11
	movge	%xcc,	%i0,	%o4
	mulx	%o1,	%g7,	%g6
	fmovsgu	%xcc,	%f1,	%f24
	nop
	setx	0xD0681CA4,	%l0,	%l6
	st	%l6,	[%l7 + 0x6C]
	ld	[%l7 + 0x6C],	%fsr
	add	%l7,	0x60,	%l6
	wr	%g0,	0x0c,	%asi
	ldxa	[%l6] %asi,	%g2
	casxa	[%l6] 0x0c,	%g2,	%g5
	ble	%icc,	loop_1115
	nop
	fitod	%f4,	%f8
	fdtox	%f8,	%f16
	mulscc	%g1,	0x147D,	%o5
	bvs,pn	%xcc,	loop_1116
loop_1115:
	stb	%i1,	[%l7 + 0x5E]
	fmovsgu	%icc,	%f1,	%f24
	tne	%xcc,	0x6
loop_1116:
	brgez,a	%i7,	loop_1117
	movcc	%xcc,	%l6,	%i4
	for	%f24,	%f10,	%f18
	xorcc	%l1,	%i6,	%o3
loop_1117:
	smul	%l4,	0x05EE,	%o0
	sethi	0x17F3,	%i3
	fmul8x16al	%f26,	%f26,	%f14
	orncc	%l2,	%i2,	%g4
	fmovda	%xcc,	%f18,	%f20
	sdivx	%o2,	0x1A43,	%g3
	movrgz	%l3,	%o7,	%o6
	lduw	[%l7 + 0x60],	%l5
	ld	[%l7 + 0x44],	%f2
	udiv	%i5,	0x05C7,	%i0
	fbu	%fcc2,	loop_1118
	fmovd	%f28,	%f8
	movneg	%xcc,	%o4,	%l0
	ldd	[%l7 + 0x40],	%o0
loop_1118:
	call	loop_1119
	orcc	%g7,	0x0DB0,	%g2
	fxor	%f2,	%f6,	%f16
	wr	%g0,	0x0c,	%asi
	ldda	[%l7 + 0x50] %asi,	%g4
loop_1119:
	orncc	%g1,	%o5,	%g6
	smulcc	%i1,	%l6,	%i4
	wr	%g0,	0x88,	%asi
	ldsha	[%l7 + 0x78] %asi,	%i7
	movrlez	%l1,	0x2BD,	%o3
	orn	%i6,	%o0,	%i3
	sub	%l4,	%i2,	%l2
	smul	%o2,	0x1086,	%g4
	nop
	fitod	%f21,	%f0
	wr	%g0,	0x11,	%asi
	ldsba	[%l7 + 0x09] %asi,	%g3
	fbl,a	%fcc0,	loop_1120
	edge32ln	%o7,	%o6,	%l5
	edge16l	%l3,	%i0,	%o4
	wr	%g0,	0x88,	%asi
	ldsba	[%l7 + 0x09] %asi,	%i5
loop_1120:
	tne	%xcc,	0x0
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
	fnot2s	%f31,	%f19
	udivx	%o1,	0x1577,	%g7
	movpos	%icc,	%l0,	%g5
loop_1121:
	tsubcc	%g1,	%g2,	%g6
	nop
	setx loop_1122, %l0, %l1
	jmpl %l1, %o5
	addcc	%l6,	%i1,	%i4
	sir	0x055E
	array8	%l1,	%i7,	%o3
loop_1122:
	movcs	%icc,	%i6,	%i3
	tvc	%icc,	0x4
	movne	%icc,	%o0,	%i2
	edge32l	%l4,	%o2,	%g4
	tvc	%icc,	0x3
	fmul8x16au	%f26,	%f18,	%f24
	movge	%icc,	%l2,	%g3
	fandnot2	%f16,	%f6,	%f26
	fmovsne	%xcc,	%f22,	%f5
	subc	%o6,	0x09AA,	%o7
	tl	%xcc,	0x1
	fnot1s	%f19,	%f11
	fxnor	%f24,	%f2,	%f20
	fmovdgu	%xcc,	%f22,	%f15
	srlx	%l5,	0x07,	%l3
	array8	%i0,	%o4,	%i5
	set	0x2C, %o5
	stwa	%o1,	[%l7 + %o5] 0xe3
	membar	#Sync
	andncc	%g7,	%g5,	%l0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movn	%xcc,	%g1,	%g2
	movneg	%icc,	%g6,	%l6
	orn	%o5,	%i4,	%l1
	sdiv	%i7,	0x1935,	%o3
	fbn,a	%fcc3,	loop_1123
	xnorcc	%i1,	%i3,	%i6
	wr	%g0,	0x89,	%asi
	lda	[%l7 + 0x70] %asi,	%f21
loop_1123:
	movg	%xcc,	%o0,	%l4
	sra	%o2,	0x0A,	%g4
	mova	%xcc,	%i2,	%g3
	tle	%icc,	0x4
	sdiv	%l2,	0x123A,	%o7
	tne	%xcc,	0x7
	tle	%xcc,	0x0
	membar	0x31
	fbule	%fcc2,	loop_1124
	bcs,a,pt	%xcc,	loop_1125
	andn	%l5,	%l3,	%i0
	edge32n	%o6,	%o4,	%i5
loop_1124:
	nop
	wr	%g0,	0x80,	%asi
	sta	%f1,	[%l7 + 0x18] %asi
loop_1125:
	membar	0x73
	bne,pt	%icc,	loop_1126
	taddcctv	%g7,	%g5,	%l0
	alignaddrl	%o1,	%g1,	%g6
	udivcc	%l6,	0x1765,	%g2
loop_1126:
	fbug	%fcc2,	loop_1127
	sdivx	%i4,	0x1E02,	%l1
	and	%i7,	%o5,	%o3
	sdiv	%i3,	0x0AFA,	%i1
loop_1127:
	sll	%i6,	0x04,	%o0
	movpos	%icc,	%o2,	%g4
	sra	%l4,	%i2,	%g3
	array8	%o7,	%l2,	%l3
	movre	%i0,	0x376,	%o6
	edge8n	%l5,	%i5,	%g7
	nop
	fitod	%f12,	%f24
	fdtos	%f24,	%f4
	tne	%xcc,	0x6
	array32	%o4,	%l0,	%g5
	ldsw	[%l7 + 0x38],	%g1
	movleu	%xcc,	%g6,	%o1
	movrgz	%l6,	0x341,	%g2
	smul	%l1,	0x04A2,	%i7
	fnands	%f5,	%f12,	%f3
	sdiv	%i4,	0x1AC3,	%o3
	fmovsge	%icc,	%f6,	%f7
	fcmpne16	%f6,	%f4,	%o5
	smul	%i1,	0x0496,	%i6
	fpsub32s	%f2,	%f24,	%f28
	call	loop_1128
	udiv	%i3,	0x0A79,	%o2
	sll	%o0,	%g4,	%l4
	bne,a	%xcc,	loop_1129
loop_1128:
	umulcc	%g3,	0x09EB,	%i2
	fmovscs	%xcc,	%f6,	%f7
	sra	%o7,	0x14,	%l2
loop_1129:
	movneg	%xcc,	%l3,	%i0
	edge16l	%o6,	%i5,	%g7
	fxnor	%f12,	%f24,	%f8
	mulx	%l5,	0x19E5,	%o4
	fsrc2	%f14,	%f20
	movn	%icc,	%g5,	%l0
	xor	%g1,	0x1E92,	%o1
	tgu	%xcc,	0x2
	tsubcctv	%g6,	0x078C,	%g2
	fble	%fcc0,	loop_1130
	movrne	%l6,	%i7,	%i4
	addccc	%o3,	%o5,	%l1
	fandnot2s	%f14,	%f29,	%f20
loop_1130:
	bshuffle	%f30,	%f18,	%f4
	mulscc	%i6,	%i1,	%i3
	xnorcc	%o0,	0x1E5F,	%g4
	tl	%icc,	0x2
	udiv	%l4,	0x1473,	%o2
	edge8ln	%i2,	%o7,	%l2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnot1s	%f29,	%f12
	fblg	%fcc3,	loop_1131
	movcs	%xcc,	%g3,	%l3
	sdivx	%o6,	0x0E40,	%i0
	mulscc	%g7,	%i5,	%l5
loop_1131:
	array8	%g5,	%l0,	%o4
	std	%f14,	[%l7 + 0x70]
	movge	%icc,	%g1,	%g6
	fmovrslez	%o1,	%f0,	%f18
	fmovsn	%xcc,	%f31,	%f18
	edge8	%g2,	%l6,	%i7
	fnors	%f22,	%f11,	%f1
	fmovsl	%icc,	%f13,	%f18
	fmovdvc	%icc,	%f5,	%f11
	movpos	%icc,	%o3,	%i4
	xnorcc	%o5,	0x14E7,	%i6
	bleu,a	loop_1132
	sdivx	%l1,	0x0F93,	%i3
	fbu	%fcc1,	loop_1133
	nop
	setx loop_1134, %l0, %l1
	jmpl %l1, %o0
loop_1132:
	fmul8sux16	%f18,	%f12,	%f26
	fbul	%fcc1,	loop_1135
loop_1133:
	movre	%g4,	0x05D,	%i1
loop_1134:
	fmul8sux16	%f6,	%f4,	%f12
	smulcc	%o2,	%l4,	%o7
loop_1135:
	mova	%xcc,	%i2,	%l2
	udivx	%g3,	0x1BF7,	%l3
	array32	%i0,	%g7,	%o6
	bge,a,pt	%icc,	loop_1136
	tgu	%xcc,	0x4
	move	%icc,	%i5,	%l5
	umul	%g5,	0x01DF,	%o4
loop_1136:
	ldsh	[%l7 + 0x60],	%g1
	tge	%icc,	0x4
	tvs	%icc,	0x6
	ta	%icc,	0x1
	movvc	%icc,	%l0,	%o1
	for	%f6,	%f12,	%f12
	swap	[%l7 + 0x0C],	%g2
	nop
	setx	0x071D15642635D48D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	fsqrtd	%f0,	%f30
	nop
	fitod	%f6,	%f16
	fdtox	%f16,	%f18
	subcc	%l6,	0x0D57,	%i7
	add	%l7,	0x68,	%l6
	wr	%g0,	0x18,	%asi
	ldxa	[%l6] %asi,	%g6
	casxa	[%l6] %asi,	%g6,	%o3
	fxnor	%f28,	%f4,	%f14
	fcmpgt16	%f24,	%f24,	%i4
	addc	%i6,	0x1BF9,	%l1
	wr	%g0,	0x04,	%asi
	stha	%i3,	[%l7 + 0x5A] %asi
	st	%f5,	[%l7 + 0x58]
	fbuge	%fcc2,	loop_1137
	array8	%o5,	%g4,	%i1
	edge8l	%o0,	%o2,	%l4
	tl	%xcc,	0x1
loop_1137:
	fmovrdgz	%o7,	%f28,	%f30
	sub	%l2,	%i2,	%l3
	membar	0x66
	subcc	%g3,	0x15DB,	%i0
	srl	%g7,	0x1B,	%i5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	be,a,pt	%xcc,	loop_1138
	movrgez	%l5,	%o6,	%g5
	set	0x48, %i5
	ldxa	[%l7 + %i5] 0x19,	%g1
loop_1138:
	bg,pn	%xcc,	loop_1139
	orn	%o4,	%o1,	%l0
	fmovde	%xcc,	%f29,	%f16
	popc	%l6,	%i7
loop_1139:
	tleu	%xcc,	0x6
	fblg	%fcc1,	loop_1140
	bl,a,pn	%xcc,	loop_1141
	movrlez	%g2,	%o3,	%g6
	fmovsg	%xcc,	%f22,	%f5
loop_1140:
	srax	%i4,	%l1,	%i3
loop_1141:
	smulcc	%i6,	%g4,	%o5
	subccc	%o0,	0x106F,	%i1
	sdiv	%o2,	0x18FC,	%o7
	tsubcc	%l2,	%l4,	%l3
	fmovdcc	%xcc,	%f9,	%f2
	tle	%icc,	0x1
	srl	%i2,	0x0B,	%i0
	bleu,pn	%icc,	loop_1142
	fmovdne	%icc,	%f30,	%f22
	subccc	%g7,	0x0DA9,	%i5
	edge32ln	%g3,	%o6,	%g5
loop_1142:
	move	%icc,	%g1,	%l5
	wr	%g0,	0x04,	%asi
	lda	[%l7 + 0x68] %asi,	%f11
	and	%o1,	0x097D,	%l0
	edge8ln	%l6,	%i7,	%g2
	fand	%f20,	%f26,	%f30
	nop
	set	0x6C, %g3
	stw	%o3,	[%l7 + %g3]
	edge32	%g6,	%o4,	%l1
	array8	%i4,	%i6,	%g4
	ldd	[%l7 + 0x78],	%i2
	bshuffle	%f4,	%f28,	%f2
	nop
	fitos	%f7,	%f30
	fstod	%f30,	%f24
	swap	[%l7 + 0x58],	%o5
	udiv	%i1,	0x0362,	%o0
	stw	%o7,	[%l7 + 0x54]
	movvc	%icc,	%l2,	%l4
	tvc	%icc,	0x1
	ldsb	[%l7 + 0x3B],	%o2
	movleu	%xcc,	%i2,	%i0
	udivx	%g7,	0x0B58,	%l3
	std	%f4,	[%l7 + 0x50]
	fnors	%f24,	%f15,	%f15
	movcs	%icc,	%g3,	%o6
	edge8ln	%g5,	%g1,	%l5
	mulscc	%i5,	%o1,	%l6
	bg,a,pn	%xcc,	loop_1143
	fornot2	%f30,	%f16,	%f28
	tsubcctv	%i7,	0x1DA4,	%l0
	xorcc	%o3,	0x0E26,	%g6
loop_1143:
	tsubcc	%g2,	%o4,	%i4
	fpadd32	%f20,	%f28,	%f26
	brlz	%i6,	loop_1144
	edge16ln	%l1,	%g4,	%o5
	wr	%g0,	0x80,	%asi
	ldsba	[%l7 + 0x36] %asi,	%i3
loop_1144:
	stbar
	andn	%o0,	%o7,	%l2
	tvs	%icc,	0x2
	brgz,a	%l4,	loop_1145
	stx	%o2,	[%l7 + 0x10]
	tg	%icc,	0x2
	tl	%icc,	0x6
loop_1145:
	smulcc	%i1,	%i2,	%i0
	te	%xcc,	0x4
	fnot1	%f8,	%f28
	edge8l	%g7,	%g3,	%l3
	add	%o6,	%g1,	%g5
	brgez,a	%l5,	loop_1146
	flush	%l7 + 0x78
	taddcctv	%o1,	0x0BF9,	%l6
	movre	%i5,	0x11C,	%i7
loop_1146:
	edge16ln	%l0,	%g6,	%o3
	fmovdneg	%icc,	%f6,	%f21
	edge16ln	%o4,	%g2,	%i4
	fbul	%fcc2,	loop_1147
	edge16	%l1,	%i6,	%o5
	addc	%i3,	%o0,	%o7
	fmovrdgez	%g4,	%f20,	%f14
loop_1147:
	brnz,a	%l2,	loop_1148
	nop
	fitod	%f2,	%f2
	fdtos	%f2,	%f24
	nop
	setx	loop_1149,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tvc	%xcc,	0x1
loop_1148:
	nop
	set	0x70, %i4
	ldsh	[%l7 + %i4],	%l4
	tpos	%icc,	0x1
loop_1149:
	fmovsgu	%icc,	%f10,	%f13
	ble,a,pt	%icc,	loop_1150
	nop
	fitod	%f13,	%f28
	edge16ln	%o2,	%i1,	%i0
	edge8n	%g7,	%i2,	%l3
loop_1150:
	fands	%f31,	%f6,	%f29
	fmul8x16au	%f3,	%f4,	%f22
	tg	%xcc,	0x4
	fors	%f12,	%f24,	%f23
	taddcc	%o6,	0x0CA6,	%g1
	movle	%xcc,	%g3,	%l5
	fmovrdne	%g5,	%f12,	%f30
	array32	%l6,	%o1,	%i7
	fpmerge	%f18,	%f16,	%f24
	taddcctv	%l0,	0x0E3F,	%i5
	and	%g6,	0x1221,	%o3
	nop
	fitos	%f14,	%f11
	fstoi	%f11,	%f15
	and	%g2,	%o4,	%l1
	pdist	%f8,	%f6,	%f16
	orncc	%i4,	%i6,	%o5
	fbu,a	%fcc2,	loop_1151
	edge8ln	%i3,	%o0,	%o7
	te	%icc,	0x5
	ta	%icc,	0x2
loop_1151:
	edge16n	%g4,	%l4,	%l2
	fble,a	%fcc1,	loop_1152
	fbn,a	%fcc3,	loop_1153
	sdiv	%o2,	0x0158,	%i0
	edge16	%i1,	%i2,	%g7
loop_1152:
	smulcc	%l3,	0x125D,	%g1
loop_1153:
	andncc	%g3,	%o6,	%g5
	sra	%l5,	0x1B,	%o1
	andn	%i7,	%l6,	%l0
	ldsw	[%l7 + 0x60],	%g6
	fandnot1s	%f27,	%f28,	%f15
	sdivcc	%i5,	0x02AE,	%o3
	array16	%o4,	%l1,	%g2
	smulcc	%i4,	%i6,	%i3
	xor	%o0,	%o7,	%g4
	bn,pt	%icc,	loop_1154
	movrne	%l4,	%l2,	%o5
	sll	%i0,	%o2,	%i1
	fandnot1	%f2,	%f2,	%f18
loop_1154:
	edge8l	%i2,	%g7,	%g1
	tn	%icc,	0x5
	fmul8x16	%f27,	%f12,	%f26
	xnor	%l3,	0x0616,	%g3
	tsubcc	%o6,	0x0B5F,	%l5
	tle	%icc,	0x0
	movrlez	%o1,	%g5,	%l6
	fmovscs	%icc,	%f8,	%f24
	brnz,a	%l0,	loop_1155
	fcmple16	%f4,	%f2,	%i7
	membar	0x0B
	xnorcc	%g6,	%i5,	%o4
loop_1155:
	mulscc	%o3,	%g2,	%i4
	bge,pt	%icc,	loop_1156
	mulscc	%l1,	%i6,	%o0
	fbn	%fcc0,	loop_1157
	fmovrsne	%i3,	%f29,	%f25
loop_1156:
	popc	0x0136,	%g4
	edge16ln	%o7,	%l2,	%l4
loop_1157:
	xorcc	%i0,	0x0B6E,	%o5
	fble	%fcc2,	loop_1158
	fmovdvs	%icc,	%f9,	%f29
	edge32ln	%o2,	%i2,	%g7
	sllx	%g1,	%i1,	%l3
loop_1158:
	andcc	%o6,	0x045B,	%l5
	bne	loop_1159
	srax	%o1,	%g3,	%l6
	udivx	%g5,	0x0821,	%l0
	set	0x60, %i6
	ldswa	[%l7 + %i6] 0x89,	%i7
loop_1159:
	nop
	wr	%g0,	0x89,	%asi
	stba	%g6,	[%l7 + 0x13] %asi
	edge16n	%o4,	%o3,	%i5
	ba,a,pn	%icc,	loop_1160
	fpsub32	%f4,	%f30,	%f0
	wr	%g0,	0x80,	%asi
	lduha	[%l7 + 0x1A] %asi,	%i4
loop_1160:
	fcmple32	%f18,	%f4,	%g2
	fbge	%fcc3,	loop_1161
	brgez	%i6,	loop_1162
	tsubcc	%l1,	0x00EF,	%i3
	fbu,a	%fcc1,	loop_1163
loop_1161:
	tl	%xcc,	0x0
loop_1162:
	fbne	%fcc1,	loop_1164
	mova	%icc,	%g4,	%o0
loop_1163:
	orcc	%l2,	%o7,	%l4
	tg	%icc,	0x5
loop_1164:
	bne,pn	%xcc,	loop_1165
	tgu	%icc,	0x1
	tgu	%icc,	0x3
	array8	%i0,	%o2,	%i2
loop_1165:
	tsubcctv	%o5,	%g1,	%i1
	popc	0x1526,	%l3
	tleu	%icc,	0x3
	fblg	%fcc2,	loop_1166
	std	%f30,	[%l7 + 0x50]
	movl	%xcc,	%g7,	%o6
	fba	%fcc2,	loop_1167
loop_1166:
	fors	%f3,	%f9,	%f14
	fnegs	%f30,	%f23
	set	0x40, %g5
	stda	%f16,	[%l7 + %g5] 0x14
loop_1167:
	sdivx	%l5,	0x11DE,	%o1
	fmovrde	%l6,	%f4,	%f16
	ta	%icc,	0x2
	or	%g3,	%g5,	%l0
	or	%g6,	0x1668,	%o4
	smulcc	%o3,	0x18F3,	%i7
	nop
	setx	0xD757B952,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f23
	setx	0x979AEC31,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f25
	fdivs	%f25,	%f23,	%f2
	nop
	setx	0x5D9EE390D04CFDC8,	%l0,	%l6
	stx	%l6,	[%l7 + 0x30]
	ldx	[%l7 + 0x30],	%fsr
	fmovde	%icc,	%f8,	%f14
	tle	%icc,	0x3
	movg	%icc,	%i4,	%g2
	tvs	%icc,	0x1
	fmovrdlz	%i5,	%f24,	%f24
	edge16	%l1,	%i6,	%g4
	sllx	%o0,	%i3,	%l2
	bg,a	loop_1168
	fmul8x16au	%f23,	%f14,	%f24
	sub	%o7,	0x043B,	%l4
	fmovdl	%xcc,	%f23,	%f31
loop_1168:
	tsubcc	%o2,	%i2,	%i0
	stb	%g1,	[%l7 + 0x09]
	movne	%xcc,	%o5,	%i1
	fornot2s	%f10,	%f26,	%f15
	set	0x5C, %l3
	ldsba	[%l7 + %l3] 0x14,	%l3
	fmovsne	%xcc,	%f17,	%f13
	fble	%fcc1,	loop_1169
	fbo,a	%fcc0,	loop_1170
	movn	%xcc,	%g7,	%l5
	xnor	%o1,	%l6,	%o6
loop_1169:
	xnorcc	%g5,	0x1668,	%l0
loop_1170:
	te	%xcc,	0x6
	edge16	%g6,	%g3,	%o3
	tgu	%icc,	0x7
	edge8	%o4,	%i4,	%i7
	movleu	%xcc,	%i5,	%g2
	add	%l7,	0x30,	%l6
	wr	%g0,	0x18,	%asi
	lda	[%l6] %asi,	%l1
	casa	[%l6] %asi,	%l1,	%i6
	stb	%g4,	[%l7 + 0x52]
	fnand	%f6,	%f18,	%f16
	movn	%icc,	%i3,	%l2
	andn	%o0,	0x1704,	%l4
	and	%o7,	0x15B4,	%i2
	edge32n	%i0,	%g1,	%o5
	nop
	fitod	%f0,	%f16
	fdtox	%f16,	%f26
	fxtod	%f26,	%f0
	bcs,a	%icc,	loop_1171
	smulcc	%o2,	0x1878,	%l3
	nop
	setx	0xF8DDC4A6B7DC1074,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0x262467186E04AD4C,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	fsubd	%f22,	%f24,	%f20
	movrlz	%i1,	%l5,	%o1
loop_1171:
	brgz,a	%g7,	loop_1172
	for	%f28,	%f10,	%f6
	orn	%l6,	0x05FD,	%g5
	ldstub	[%l7 + 0x14],	%l0
loop_1172:
	nop
	add	%l7,	0x50,	%l6
	wr	%g0,	0x04,	%asi
	ldxa	[%l6] %asi,	%g6
	casxa	[%l6] 0x04,	%g6,	%o6
	edge8	%o3,	%o4,	%g3
	and	%i4,	%i7,	%g2
	set	0x74, %i0
	sta	%f5,	[%l7 + %i0] 0x04
	fbo	%fcc3,	loop_1173
	alignaddr	%i5,	%l1,	%g4
	tvs	%icc,	0x4
	tcs	%icc,	0x1
loop_1173:
	tne	%icc,	0x0
	sir	0x022B
	nop
	fitod	%f4,	%f18
	fdtox	%f18,	%f30
	mulscc	%i3,	%i6,	%o0
	fcmpne32	%f28,	%f2,	%l4
	fmovsleu	%xcc,	%f13,	%f3
	sra	%o7,	%l2,	%i0
	orcc	%i2,	%o5,	%o2
	fbl,a	%fcc3,	loop_1174
	edge8n	%l3,	%g1,	%l5
	movge	%icc,	%o1,	%g7
	fmuld8sux16	%f9,	%f11,	%f14
loop_1174:
	and	%i1,	%g5,	%l0
	ldd	[%l7 + 0x08],	%f26
	andncc	%l6,	%g6,	%o3
	movvs	%xcc,	%o6,	%g3
	nop
	setx	loop_1175,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	stw	%i4,	[%l7 + 0x60]
	fba,a	%fcc2,	loop_1176
	subccc	%o4,	0x1AF5,	%g2
loop_1175:
	edge16ln	%i7,	%i5,	%l1
	smulcc	%g4,	0x14E3,	%i6
loop_1176:
	tle	%xcc,	0x7
	fbule,a	%fcc3,	loop_1177
	nop
	setx	0x69E7A568,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f11
	setx	0xAD00E5EE,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f17
	fsubs	%f17,	%f11,	%f6
	popc	%i3,	%o0
	prefetch	[%l7 + 0x58],	 0x1
loop_1177:
	sethi	0x0E05,	%l4
	move	%icc,	%l2,	%i0
	bvs,a	loop_1178
	fnegs	%f11,	%f26
	andncc	%i2,	%o5,	%o2
	fble	%fcc1,	loop_1179
loop_1178:
	movneg	%icc,	%o7,	%g1
	array16	%l3,	%o1,	%g7
	set	0x20, %g1
	swapa	[%l7 + %g1] 0x89,	%i1
loop_1179:
	brgez	%g5,	loop_1180
	tn	%xcc,	0x0
	sub	%l5,	%l0,	%g6
	te	%xcc,	0x0
loop_1180:
	edge8n	%o3,	%l6,	%g3
	nop
	setx	0xBA182D77AF10AB9C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	fsqrtd	%f28,	%f10
	orncc	%o6,	%i4,	%g2
	xor	%o4,	0x19B8,	%i5
	membar	#Sync
	set	0x40, %l1
	ldda	[%l7 + %l1] 0xf9,	%f0
	edge32l	%l1,	%i7,	%i6
	wr	%g0,	0x11,	%asi
	lda	[%l7 + 0x2C] %asi,	%f23
	tne	%icc,	0x0
	fpackfix	%f18,	%f16
	movl	%xcc,	%i3,	%g4
	brz,a	%o0,	loop_1181
	edge16n	%l4,	%i0,	%i2
	tleu	%icc,	0x1
	tcs	%icc,	0x2
loop_1181:
	ldsh	[%l7 + 0x2E],	%o5
	tl	%icc,	0x5
	tsubcc	%o2,	0x0BE0,	%l2
	subccc	%o7,	0x1CB1,	%l3
	movl	%icc,	%o1,	%g1
	edge16ln	%i1,	%g5,	%l5
	subccc	%l0,	%g7,	%g6
	subccc	%o3,	0x090D,	%l6
	fone	%f0
	tcc	%xcc,	0x2
	ta	%xcc,	0x3
	fbn	%fcc3,	loop_1182
	edge8n	%o6,	%i4,	%g2
	addccc	%g3,	%i5,	%l1
	taddcc	%i7,	0x15E4,	%o4
loop_1182:
	nop
	set	0x30, %o7
	ldda	[%l7 + %o7] 0xe2,	%i2
	bvc,pt	%xcc,	loop_1183
	edge32	%g4,	%o0,	%l4
	edge16ln	%i6,	%i0,	%i2
	set	0x78, %o0
	stwa	%o2,	[%l7 + %o0] 0x19
loop_1183:
	mova	%xcc,	%l2,	%o7
	edge32ln	%o5,	%o1,	%g1
	nop
	fitos	%f13,	%f29
	orncc	%i1,	%g5,	%l3
	ld	[%l7 + 0x08],	%f23
	nop
	fitos	%f1,	%f3
	fstox	%f3,	%f18
	fxtos	%f18,	%f19
	move	%icc,	%l5,	%l0
	umulcc	%g6,	%g7,	%l6
	set	0x43, %g2
	lduba	[%l7 + %g2] 0x81,	%o3
	tg	%icc,	0x5
	fnot2s	%f21,	%f7
	tn	%icc,	0x3
	alignaddr	%i4,	%g2,	%g3
	taddcc	%i5,	%o6,	%i7
	movle	%xcc,	%o4,	%i3
	fbul,a	%fcc2,	loop_1184
	movrgez	%g4,	0x2D4,	%o0
	wr	%g0,	0x89,	%asi
	ldda	[%l7 + 0x30] %asi,	%l4
loop_1184:
	fpackfix	%f18,	%f22
	edge16n	%l1,	%i6,	%i0
	set	0x18, %l2
	swapa	[%l7 + %l2] 0x89,	%i2
	movvs	%xcc,	%l2,	%o7
	alignaddrl	%o2,	%o1,	%o5
	subccc	%i1,	0x09EA,	%g5
	andncc	%g1,	%l5,	%l0
	wr	%g0,	0x89,	%asi
	ldxa	[%l7 + 0x18] %asi,	%l3
	movrlz	%g7,	%l6,	%o3
	sdiv	%g6,	0x086C,	%i4
	nop
	setx	0xA95565BC,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f27
	setx	0x4023F4E2,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f10
	fmuls	%f10,	%f27,	%f16
	fmovd	%f6,	%f16
	movl	%xcc,	%g2,	%g3
	bg,pn	%icc,	loop_1185
	fmovdpos	%icc,	%f13,	%f13
	fpadd32s	%f9,	%f7,	%f13
	array8	%o6,	%i7,	%i5
loop_1185:
	bneg	loop_1186
	orcc	%i3,	%o4,	%g4
	te	%xcc,	0x7
	fmovrse	%l4,	%f2,	%f9
loop_1186:
	bcc,a,pn	%xcc,	loop_1187
	brgz	%o0,	loop_1188
	tvc	%xcc,	0x2
	subcc	%i6,	0x12D7,	%i0
loop_1187:
	taddcctv	%l1,	%l2,	%i2
loop_1188:
	tne	%xcc,	0x5
	smul	%o7,	0x0A53,	%o1
	subc	%o2,	0x0AD0,	%o5
	movgu	%icc,	%i1,	%g5
	te	%icc,	0x2
	xorcc	%l5,	%l0,	%g1
	addccc	%l3,	%g7,	%l6
	tleu	%xcc,	0x2
	movcs	%icc,	%g6,	%i4
	fmovdcc	%icc,	%f8,	%f3
	nop
	setx	loop_1189,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	array8	%g2,	%o3,	%g3
	tneg	%xcc,	0x2
	movg	%icc,	%i7,	%i5
loop_1189:
	array16	%o6,	%i3,	%g4
	fbu,a	%fcc3,	loop_1190
	fpack16	%f2,	%f10
	ldstub	[%l7 + 0x1D],	%o4
	tne	%xcc,	0x2
loop_1190:
	for	%f2,	%f22,	%f28
	nop
	setx loop_1191, %l0, %l1
	jmpl %l1, %o0
	edge16n	%l4,	%i6,	%i0
	movrlz	%l2,	%l1,	%o7
	fandnot2s	%f11,	%f25,	%f15
loop_1191:
	sir	0x1CB8
	fbge	%fcc1,	loop_1192
	mulscc	%i2,	0x0B6C,	%o1
	membar	0x51
	edge32l	%o5,	%i1,	%g5
loop_1192:
	fmovscc	%xcc,	%f17,	%f16
	bcs,a,pt	%icc,	loop_1193
	nop
	setx	loop_1194,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fmovrdne	%o2,	%f20,	%f26
	edge32	%l0,	%l5,	%l3
loop_1193:
	array8	%g7,	%l6,	%g6
loop_1194:
	edge8l	%g1,	%g2,	%o3
	movrgez	%i4,	0x374,	%g3
	fnegs	%f23,	%f18
	xnor	%i5,	%o6,	%i3
	wr	%g0,	0x11,	%asi
	prefetcha	[%l7 + 0x08] %asi,	 0x0
	movcc	%xcc,	%g4,	%o0
	call	loop_1195
	movn	%xcc,	%o4,	%i6
	nop
	setx	loop_1196,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	sth	%l4,	[%l7 + 0x12]
loop_1195:
	add	%i0,	0x0F53,	%l2
	flush	%l7 + 0x40
loop_1196:
	add	%l1,	%o7,	%i2
	fmovrdgz	%o5,	%f28,	%f6
	movge	%xcc,	%o1,	%i1
	subc	%o2,	0x0043,	%g5
	taddcctv	%l0,	%l3,	%l5
	alignaddr	%g7,	%g6,	%g1
	andncc	%g2,	%o3,	%i4
	movgu	%icc,	%g3,	%i5
	set	0x40, %i7
	stda	%f16,	[%l7 + %i7] 0x19
	popc	0x1D1B,	%l6
	orcc	%o6,	0x1660,	%i7
	movrgz	%i3,	%o0,	%g4
	edge32	%i6,	%l4,	%o4
	set	0x63, %l5
	lduba	[%l7 + %l5] 0x15,	%i0
	fmovsg	%icc,	%f25,	%f13
	set	0x60, %o2
	ldxa	[%l7 + %o2] 0x89,	%l1
	nop
	setx	0xA0557099,	%l0,	%l6
	st	%l6,	[%l7 + 0x4C]
	ld	[%l7 + 0x4C],	%fsr
	tsubcctv	%o7,	%i2,	%o5
	bn,pn	%xcc,	loop_1197
	or	%o1,	%l2,	%o2
	andncc	%g5,	%i1,	%l3
	sra	%l0,	0x03,	%l5
loop_1197:
	call	loop_1198
	bneg,a	%xcc,	loop_1199
	umul	%g7,	%g6,	%g1
	movgu	%xcc,	%o3,	%g2
loop_1198:
	movneg	%icc,	%i4,	%g3
loop_1199:
	movpos	%icc,	%l6,	%i5
	fmovrslez	%o6,	%f2,	%f31
	wr	%g0,	0x89,	%asi
	ldsba	[%l7 + 0x30] %asi,	%i3
	taddcc	%i7,	%o0,	%g4
	movleu	%icc,	%l4,	%o4
	edge32	%i6,	%i0,	%o7
	fbug	%fcc1,	loop_1200
	movrgz	%l1,	0x077,	%i2
	mulx	%o1,	0x1934,	%l2
	fmovrsne	%o5,	%f10,	%f30
loop_1200:
	fmuld8sux16	%f31,	%f31,	%f6
	udivx	%o2,	0x098D,	%i1
	tne	%icc,	0x7
	taddcctv	%g5,	%l0,	%l5
	bpos,pn	%xcc,	loop_1201
	fmovrslez	%l3,	%f0,	%f5
	fbne,a	%fcc2,	loop_1202
	fmovrsgez	%g6,	%f1,	%f26
loop_1201:
	fsrc1	%f0,	%f0
	fble,a	%fcc0,	loop_1203
loop_1202:
	swap	[%l7 + 0x5C],	%g1
	bvs,a,pt	%icc,	loop_1204
	tcc	%icc,	0x3
loop_1203:
	fbne,a	%fcc0,	loop_1205
	fbne	%fcc3,	loop_1206
loop_1204:
	movrgz	%g7,	0x292,	%o3
	te	%icc,	0x3
loop_1205:
	udivx	%i4,	0x15E6,	%g2
loop_1206:
	fble	%fcc3,	loop_1207
	movneg	%icc,	%g3,	%l6
	xorcc	%i5,	0x0FB3,	%i3
	tge	%icc,	0x3
loop_1207:
	fba,a	%fcc3,	loop_1208
	edge16n	%i7,	%o6,	%o0
	prefetch	[%l7 + 0x78],	 0x2
	movle	%xcc,	%l4,	%o4
loop_1208:
	mova	%icc,	%i6,	%i0
	sll	%o7,	%g4,	%l1
	fxors	%f5,	%f11,	%f18
	fmul8sux16	%f26,	%f16,	%f16
	bshuffle	%f22,	%f22,	%f18
	edge16l	%o1,	%i2,	%o5
	sethi	0x119D,	%o2
	ldub	[%l7 + 0x24],	%i1
	movneg	%icc,	%g5,	%l2
	popc	%l0,	%l3
	andncc	%g6,	%l5,	%g1
	set	0x46, %i1
	ldsba	[%l7 + %i1] 0x0c,	%g7
	movcs	%icc,	%i4,	%o3
	movge	%icc,	%g3,	%g2
	wr	%g0,	0x04,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	movrlez	%i5,	%l6,	%i7
	edge16l	%o6,	%i3,	%o0
	tgu	%icc,	0x5
	fmovdgu	%xcc,	%f17,	%f13
	edge8	%o4,	%l4,	%i6
	wr	%g0,	0x11,	%asi
	ldsba	[%l7 + 0x42] %asi,	%i0
	brgz	%o7,	loop_1209
	orncc	%l1,	0x09EA,	%o1
	or	%g4,	0x046B,	%i2
	bne	%xcc,	loop_1210
loop_1209:
	fornot1s	%f28,	%f17,	%f31
	sethi	0x1635,	%o5
	fmovd	%f18,	%f26
loop_1210:
	nop
	wr	%g0,	0x0c,	%asi
	ldsba	[%l7 + 0x4D] %asi,	%o2
	movneg	%icc,	%g5,	%l2
	set	0x7A, %i3
	ldstuba	[%l7 + %i3] 0x89,	%i1
	brlz,a	%l3,	loop_1211
	nop
	setx	loop_1212,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fmovsa	%icc,	%f27,	%f4
	array32	%l0,	%l5,	%g1
loop_1211:
	sdivx	%g7,	0x04B5,	%g6
loop_1212:
	orncc	%i4,	0x09AE,	%o3
	edge32	%g3,	%g2,	%l6
	sdivcc	%i7,	0x02EC,	%o6
	fmovsvs	%icc,	%f16,	%f15
	mulx	%i5,	%i3,	%o4
	movcs	%xcc,	%o0,	%l4
	mulx	%i6,	0x04B4,	%i0
	movgu	%xcc,	%o7,	%l1
	movn	%icc,	%o1,	%g4
	array32	%o5,	%i2,	%o2
	swap	[%l7 + 0x4C],	%l2
	set	0x30, %o3
	stwa	%i1,	[%l7 + %o3] 0x2b
	membar	#Sync
	udivcc	%l3,	0x0DE1,	%l0
	taddcc	%l5,	0x1388,	%g1
	tne	%icc,	0x4
	xorcc	%g7,	0x1F2E,	%g6
	lduh	[%l7 + 0x64],	%i4
	srl	%g5,	%o3,	%g3
	fpadd16	%f12,	%f24,	%f2
	smulcc	%g2,	0x0102,	%i7
	movrlz	%o6,	%l6,	%i5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movre	%o4,	%o0,	%l4
	bneg	%xcc,	loop_1213
	tle	%xcc,	0x5
	st	%f30,	[%l7 + 0x6C]
	move	%icc,	%i3,	%i0
loop_1213:
	edge16l	%i6,	%l1,	%o7
	fandnot1	%f18,	%f4,	%f2
	fmovdne	%xcc,	%f24,	%f16
	tvc	%icc,	0x3
	fmovsge	%xcc,	%f15,	%f12
	tvc	%xcc,	0x0
	sub	%g4,	%o1,	%i2
	orncc	%o5,	%o2,	%l2
	edge16ln	%l3,	%l0,	%i1
	srax	%g1,	%g7,	%g6
	addc	%i4,	0x0F2A,	%g5
	movvc	%icc,	%o3,	%g3
	movre	%g2,	%l5,	%o6
	fpadd16	%f12,	%f14,	%f4
	fmuld8ulx16	%f28,	%f23,	%f20
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x20] %asi,	%i7
	fmovscc	%xcc,	%f19,	%f8
	tsubcc	%l6,	0x0F29,	%o4
	edge16n	%i5,	%l4,	%i3
	sdivx	%o0,	0x037F,	%i0
	nop
	setx	0x29A428209EBDA9DF,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0xA7B28BD9D60505D4,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	fdivd	%f26,	%f2,	%f6
	fblg,a	%fcc2,	loop_1214
	fpack16	%f12,	%f19
	mulscc	%l1,	%i6,	%g4
	movvs	%icc,	%o7,	%o1
loop_1214:
	membar	0x1E
	movg	%xcc,	%i2,	%o2
	smul	%l2,	0x0A10,	%o5
	movl	%xcc,	%l3,	%l0
	tgu	%icc,	0x3
	sub	%g1,	0x09C5,	%i1
	tg	%xcc,	0x0
	edge16	%g6,	%i4,	%g7
	set	0x30, %l6
	stxa	%o3,	[%l7 + %l6] 0x10
	tg	%xcc,	0x4
	movcc	%icc,	%g5,	%g3
	st	%f31,	[%l7 + 0x50]
	movrgez	%l5,	%o6,	%g2
	fmovdne	%icc,	%f9,	%f15
	srl	%i7,	0x11,	%l6
	ldstub	[%l7 + 0x71],	%o4
	edge16n	%l4,	%i5,	%i3
	edge16n	%i0,	%l1,	%i6
	for	%f24,	%f26,	%f20
	fmovs	%f8,	%f24
	sra	%o0,	0x1F,	%g4
	wr	%g0,	0xe2,	%asi
	stha	%o7,	[%l7 + 0x08] %asi
	membar	#Sync
	udiv	%o1,	0x00CD,	%o2
	umulcc	%l2,	0x0B3A,	%i2
	xnor	%o5,	0x0269,	%l0
	movgu	%icc,	%g1,	%i1
	edge8	%l3,	%i4,	%g7
	alignaddrl	%g6,	%g5,	%o3
	udiv	%l5,	0x1CB1,	%o6
	ldsb	[%l7 + 0x37],	%g3
	set	0x58, %l4
	stxa	%g2,	[%l7 + %l4] 0x15
	fmovdg	%xcc,	%f9,	%f13
	sth	%l6,	[%l7 + 0x78]
	edge16l	%i7,	%o4,	%l4
	tne	%icc,	0x1
	set	0x30, %g7
	ldxa	[%g0 + %g7] 0x50,	%i3
	fbo	%fcc2,	loop_1215
	udivcc	%i5,	0x07EF,	%i0
	tne	%xcc,	0x0
	subcc	%l1,	%i6,	%o0
loop_1215:
	bgu,a,pt	%xcc,	loop_1216
	movrgez	%o7,	%o1,	%g4
	umulcc	%l2,	0x1618,	%i2
	fbne	%fcc1,	loop_1217
loop_1216:
	fcmpeq16	%f6,	%f4,	%o5
	movleu	%xcc,	%l0,	%g1
	ble,a	%xcc,	loop_1218
loop_1217:
	tl	%xcc,	0x7
	fnegd	%f28,	%f16
	addc	%o2,	0x0821,	%l3
loop_1218:
	fpsub32	%f14,	%f30,	%f12
	bl,a,pn	%xcc,	loop_1219
	edge32n	%i1,	%g7,	%i4
	fnegd	%f12,	%f20
	nop
	set	0x25, %i2
	ldstub	[%l7 + %i2],	%g6
loop_1219:
	fmovrsgz	%o3,	%f16,	%f23
	st	%f21,	[%l7 + 0x10]
	set	0x21, %o6
	ldsba	[%l7 + %o6] 0x80,	%g5
	movl	%icc,	%o6,	%l5
	movn	%xcc,	%g3,	%l6
	set	0x40, %o1
	lda	[%l7 + %o1] 0x15,	%f31
	fmovrdne	%g2,	%f22,	%f16
	edge16	%i7,	%l4,	%o4
	fpackfix	%f4,	%f24
	tn	%icc,	0x1
	set	0x10, %l0
	ldxa	[%l7 + %l0] 0x0c,	%i3
	wr	%g0,	0x89,	%asi
	lda	[%l7 + 0x70] %asi,	%f20
	fmovsn	%icc,	%f13,	%f2
	bl	loop_1220
	fmovdge	%icc,	%f18,	%f17
	fnot2s	%f17,	%f14
	fmuld8sux16	%f26,	%f29,	%f18
loop_1220:
	ldsb	[%l7 + 0x65],	%i5
	nop
	setx	0x0F926F8F,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f5
	setx	0x6C9E1284,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f3
	fdivs	%f3,	%f5,	%f10
	edge32	%l1,	%i0,	%o0
	umul	%o7,	0x1BFB,	%o1
	fmovdle	%xcc,	%f12,	%f30
	movre	%i6,	0x2EE,	%g4
	wr	%g0,	0x2f,	%asi
	stha	%l2,	[%l7 + 0x2E] %asi
	membar	#Sync
	fpack16	%f30,	%f21
	ta	%xcc,	0x2
	bge,pt	%icc,	loop_1221
	fbue	%fcc3,	loop_1222
	sdivx	%o5,	0x0C71,	%i2
	fmovdneg	%icc,	%f26,	%f14
loop_1221:
	movge	%icc,	%l0,	%o2
loop_1222:
	sra	%l3,	%i1,	%g7
	fmovsleu	%xcc,	%f24,	%f22
	fbne	%fcc3,	loop_1223
	tcc	%xcc,	0x6
	srl	%g1,	%g6,	%i4
	smul	%g5,	%o3,	%l5
loop_1223:
	fbge	%fcc3,	loop_1224
	te	%xcc,	0x2
	ldub	[%l7 + 0x7A],	%o6
	fnot2	%f4,	%f4
loop_1224:
	addc	%g3,	0x194E,	%l6
	te	%icc,	0x1
	fbn,a	%fcc0,	loop_1225
	ldstub	[%l7 + 0x27],	%g2
	tg	%xcc,	0x3
	sir	0x09FD
loop_1225:
	andn	%i7,	0x1A74,	%o4
	ta	%icc,	0x5
	fmovspos	%xcc,	%f18,	%f23
	tvc	%icc,	0x0
	edge16l	%l4,	%i5,	%l1
	bl	loop_1226
	fbge	%fcc2,	loop_1227
	nop
	set	0x2F, %o4
	ldsb	[%l7 + %o4],	%i3
	movleu	%xcc,	%i0,	%o7
loop_1226:
	nop
	setx loop_1228, %l0, %l1
	jmpl %l1, %o1
loop_1227:
	udivcc	%o0,	0x0E62,	%i6
	edge8ln	%g4,	%l2,	%i2
	tsubcctv	%l0,	%o2,	%l3
loop_1228:
	fmuld8sux16	%f23,	%f27,	%f4
	smulcc	%i1,	0x0C64,	%o5
	andncc	%g1,	%g7,	%i4
	umulcc	%g6,	0x1D57,	%o3
	movgu	%xcc,	%l5,	%o6
	alignaddr	%g3,	%l6,	%g5
	movrgez	%i7,	%o4,	%l4
	call	loop_1229
	movneg	%icc,	%i5,	%g2
	fone	%f12
	fpadd16	%f8,	%f16,	%f26
loop_1229:
	nop
	setx	0xE077FEA8,	%l0,	%l6
	st	%l6,	[%l7 + 0x48]
	ld	[%l7 + 0x48],	%fsr
	add	%l1,	0x14CA,	%i0
	fmovdl	%icc,	%f9,	%f29
	wr	%g0,	0x19,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	fpsub32s	%f29,	%f20,	%f18
	movn	%xcc,	%o7,	%o1
	movleu	%icc,	%o0,	%i3
	edge8	%i6,	%g4,	%i2
	movpos	%icc,	%l0,	%l2
	fbge,a	%fcc1,	loop_1230
	tsubcc	%l3,	0x10EA,	%i1
	movneg	%xcc,	%o2,	%o5
	ldstub	[%l7 + 0x62],	%g7
loop_1230:
	tcc	%xcc,	0x7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrdgz	%g1,	%f14,	%f10
	bvc	loop_1231
	sdiv	%i4,	0x12C9,	%g6
	sir	0x0926
	sll	%o3,	%l5,	%o6
loop_1231:
	movcc	%icc,	%g3,	%l6
	fand	%f4,	%f28,	%f12
	fpackfix	%f4,	%f9
	fpack16	%f30,	%f29
	nop
	setx	loop_1232,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	taddcctv	%g5,	0x1356,	%i7
	ld	[%l7 + 0x38],	%f24
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1232:
	tg	%icc,	0x5
	tge	%icc,	0x1
	edge32l	%o4,	%l4,	%g2
	array16	%i5,	%l1,	%o7
	andcc	%i0,	0x0861,	%o0
	tleu	%icc,	0x2
	sethi	0x1E7A,	%i3
	array8	%i6,	%g4,	%i2
	nop
	setx	0x4420CF63B04CAA74,	%l0,	%l6
	stx	%l6,	[%l7 + 0x70]
	ldx	[%l7 + 0x70],	%fsr
	tneg	%icc,	0x4
	array8	%o1,	%l2,	%l3
	set	0x74, %g4
	swapa	[%l7 + %g4] 0x81,	%i1
	fcmple32	%f28,	%f0,	%o2
	set	0x70, %o5
	ldda	[%l7 + %o5] 0x2b,	%o4
	nop
	fitod	%f12,	%f16
	fdtox	%f16,	%f6
	fxtod	%f6,	%f24
	andn	%l0,	%g7,	%i4
	fmovrdgz	%g6,	%f22,	%f2
	taddcc	%o3,	0x1243,	%g1
	fmuld8ulx16	%f10,	%f9,	%f10
	fcmpeq16	%f10,	%f12,	%o6
	sethi	0x0602,	%g3
	set	0x55, %i5
	ldstuba	[%l7 + %i5] 0x18,	%l5
	smulcc	%l6,	0x1F0C,	%g5
	alignaddr	%o4,	%l4,	%g2
	movpos	%xcc,	%i5,	%l1
	movpos	%icc,	%i7,	%o7
	xnor	%i0,	%i3,	%o0
	fbe	%fcc0,	loop_1233
	taddcc	%i6,	%i2,	%o1
	fba	%fcc2,	loop_1234
	xnorcc	%g4,	%l2,	%l3
loop_1233:
	brz	%o2,	loop_1235
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1234:
	fbne,a	%fcc1,	loop_1236
	sdivcc	%o5,	0x02A0,	%i1
loop_1235:
	alignaddr	%g7,	%l0,	%i4
	andcc	%o3,	0x0FFA,	%g6
loop_1236:
	sir	0x0F14
	brlez	%o6,	loop_1237
	movgu	%icc,	%g3,	%l5
	nop
	setx	loop_1238,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	ldstub	[%l7 + 0x2E],	%l6
loop_1237:
	taddcctv	%g5,	%g1,	%o4
	tleu	%xcc,	0x4
loop_1238:
	ldsh	[%l7 + 0x46],	%g2
	stb	%i5,	[%l7 + 0x14]
	xnorcc	%l4,	0x1C37,	%l1
	edge8l	%o7,	%i7,	%i3
	bn,pn	%xcc,	loop_1239
	xnorcc	%o0,	0x1BFC,	%i6
	tneg	%xcc,	0x0
	move	%xcc,	%i2,	%i0
loop_1239:
	edge16n	%g4,	%l2,	%o1
	wr	%g0,	0x11,	%asi
	stxa	%o2,	[%l7 + 0x58] %asi
	stbar
	tge	%xcc,	0x7
	andn	%o5,	%l3,	%i1
	lduh	[%l7 + 0x28],	%l0
	fone	%f4
	move	%icc,	%i4,	%g7
	nop
	fitod	%f4,	%f18
	fdtoi	%f18,	%f18
	movn	%icc,	%g6,	%o3
	bge,a	%xcc,	loop_1240
	nop
	fitod	%f12,	%f12
	fdtox	%f12,	%f28
	fxtod	%f28,	%f6
	udiv	%o6,	0x1EEE,	%l5
	bpos,a	%icc,	loop_1241
loop_1240:
	movn	%xcc,	%g3,	%l6
	umulcc	%g5,	%o4,	%g1
	set	0x18, %g6
	stxa	%g2,	[%l7 + %g6] 0x11
loop_1241:
	nop
	add	%l7,	0x40,	%l6
	wr	%g0,	0x19,	%asi
	ldxa	[%l6] %asi,	%i5
	casxa	[%l6] %asi,	%i5,	%l4
	fbule,a	%fcc0,	loop_1242
	tle	%icc,	0x7
	movleu	%xcc,	%l1,	%o7
	fmovsvc	%icc,	%f6,	%f16
loop_1242:
	sdiv	%i3,	0x0B25,	%o0
	st	%f27,	[%l7 + 0x78]
	fnands	%f30,	%f25,	%f29
	fpadd16s	%f7,	%f20,	%f29
	srax	%i7,	0x0B,	%i6
	fmovrsgez	%i0,	%f2,	%f14
	stbar
	brgz	%i2,	loop_1243
	faligndata	%f26,	%f28,	%f30
	and	%g4,	0x1CE8,	%o1
	movn	%xcc,	%l2,	%o2
loop_1243:
	fmovsn	%xcc,	%f20,	%f27
	nop
	set	0x40, %g3
	ldx	[%l7 + %g3],	%l3
	taddcc	%o5,	0x0FA6,	%l0
	fmuld8ulx16	%f7,	%f25,	%f30
	lduh	[%l7 + 0x2E],	%i4
	movrlz	%i1,	%g7,	%o3
	fnegs	%f29,	%f19
	swap	[%l7 + 0x28],	%o6
	fmovrdlez	%l5,	%f28,	%f12
	fmovde	%icc,	%f18,	%f12
	st	%f18,	[%l7 + 0x74]
	movrgz	%g3,	0x3E4,	%g6
	te	%icc,	0x5
	fmovsl	%icc,	%f8,	%f9
	fbu,a	%fcc1,	loop_1244
	movcs	%xcc,	%l6,	%g5
	fnand	%f30,	%f10,	%f20
	orcc	%g1,	0x0951,	%g2
loop_1244:
	fnegd	%f0,	%f30
	sth	%o4,	[%l7 + 0x4C]
	popc	%i5,	%l1
	subc	%l4,	0x1D76,	%o7
	orn	%o0,	0x0E0E,	%i3
	fzero	%f18
	bshuffle	%f8,	%f2,	%f0
	srax	%i7,	%i0,	%i2
	tl	%xcc,	0x2
	fblg,a	%fcc1,	loop_1245
	fpsub16	%f8,	%f12,	%f2
	tsubcctv	%i6,	%g4,	%o1
	edge8l	%o2,	%l3,	%l2
loop_1245:
	taddcc	%o5,	0x16A2,	%l0
	fmovdl	%icc,	%f25,	%f0
	edge8n	%i4,	%g7,	%o3
	movgu	%icc,	%i1,	%o6
	tle	%xcc,	0x0
	subccc	%g3,	0x0428,	%l5
	fors	%f0,	%f16,	%f26
	fmovsn	%icc,	%f3,	%f7
	ldsb	[%l7 + 0x78],	%g6
	st	%f17,	[%l7 + 0x0C]
	fornot1s	%f29,	%f12,	%f1
	fcmpeq32	%f4,	%f22,	%l6
	movvc	%xcc,	%g1,	%g5
	fblg	%fcc1,	loop_1246
	nop
	fitod	%f6,	%f8
	fdtoi	%f8,	%f14
	mulx	%g2,	0x1BC3,	%i5
	tsubcc	%o4,	%l4,	%o7
loop_1246:
	fmovsneg	%icc,	%f8,	%f31
	movrne	%l1,	0x24A,	%o0
	fmovdleu	%icc,	%f15,	%f11
	movge	%xcc,	%i7,	%i3
	fmovdl	%icc,	%f8,	%f12
	ta	%xcc,	0x2
	fnegd	%f2,	%f0
	movn	%xcc,	%i0,	%i2
	fmovsne	%icc,	%f11,	%f26
	fcmple32	%f28,	%f16,	%i6
	lduh	[%l7 + 0x28],	%o1
	tleu	%icc,	0x4
	mulscc	%o2,	0x1A33,	%l3
	edge8l	%g4,	%o5,	%l0
	edge32l	%i4,	%l2,	%o3
	edge16ln	%i1,	%g7,	%o6
	fsrc2	%f24,	%f8
	fble	%fcc3,	loop_1247
	bn	loop_1248
	prefetch	[%l7 + 0x58],	 0x0
	bleu,pt	%xcc,	loop_1249
loop_1247:
	subccc	%l5,	0x088D,	%g6
loop_1248:
	fornot2	%f6,	%f16,	%f0
	ta	%icc,	0x7
loop_1249:
	nop
	wr	%g0,	0x04,	%asi
	stba	%l6,	[%l7 + 0x21] %asi
	tgu	%icc,	0x4
	fzero	%f6
	tl	%icc,	0x3
	fand	%f22,	%f28,	%f26
	nop
	setx	loop_1250,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fba	%fcc3,	loop_1251
	edge32ln	%g3,	%g1,	%g2
	sdiv	%g5,	0x07D9,	%i5
loop_1250:
	srax	%l4,	0x06,	%o7
loop_1251:
	movvc	%icc,	%o4,	%o0
	fmovsn	%xcc,	%f28,	%f22
	tl	%xcc,	0x4
	set	0x18, %i6
	stha	%l1,	[%l7 + %i6] 0x81
	tvs	%xcc,	0x3
	fnands	%f11,	%f28,	%f25
	andncc	%i7,	%i0,	%i2
	wr	%g0,	0x04,	%asi
	lduwa	[%l7 + 0x24] %asi,	%i3
	fors	%f27,	%f0,	%f23
	membar	0x01
	fmovrdlez	%i6,	%f2,	%f6
	fnegd	%f6,	%f30
	add	%l7,	0x48,	%l6
	wr	%g0,	0x11,	%asi
	casxa	[%l6] 0x11,	%o1,	%l3
	movre	%g4,	0x159,	%o5
	fmul8ulx16	%f10,	%f14,	%f2
	sub	%l0,	%i4,	%o2
	fsrc2s	%f15,	%f18
	fnegd	%f8,	%f2
	sra	%l2,	%o3,	%i1
	fmuld8ulx16	%f3,	%f17,	%f16
	tsubcc	%o6,	0x0000,	%l5
	movge	%icc,	%g7,	%l6
	udivcc	%g3,	0x082D,	%g1
	fblg,a	%fcc1,	loop_1252
	orcc	%g6,	%g2,	%g5
	brgz	%i5,	loop_1253
	subc	%o7,	%o4,	%l4
loop_1252:
	movneg	%icc,	%o0,	%i7
	edge8ln	%i0,	%l1,	%i2
loop_1253:
	fnor	%f2,	%f0,	%f30
	movn	%xcc,	%i6,	%i3
	subc	%o1,	0x1D2A,	%g4
	or	%o5,	%l3,	%l0
	movrgz	%i4,	%o2,	%o3
	smulcc	%l2,	0x11A9,	%i1
	ldd	[%l7 + 0x30],	%o6
	tneg	%xcc,	0x7
	lduw	[%l7 + 0x68],	%g7
	wr	%g0,	0x11,	%asi
	sta	%f5,	[%l7 + 0x24] %asi
	movrgz	%l6,	0x013,	%l5
	for	%f4,	%f10,	%f24
	tleu	%xcc,	0x1
	fmovrsgez	%g3,	%f30,	%f31
	movle	%xcc,	%g1,	%g6
	srax	%g5,	%i5,	%o7
	edge8l	%g2,	%o4,	%o0
	array32	%i7,	%l4,	%i0
	fcmple16	%f0,	%f18,	%l1
	fpadd16s	%f10,	%f3,	%f4
	movcc	%icc,	%i2,	%i6
	fmovde	%xcc,	%f6,	%f16
	orcc	%i3,	0x16C1,	%o1
	fmovsn	%icc,	%f23,	%f17
	sdivcc	%g4,	0x0634,	%o5
	ldx	[%l7 + 0x18],	%l0
	sir	0x0AEC
	tsubcctv	%i4,	0x07F2,	%o2
	andn	%l3,	%l2,	%o3
	movrlez	%i1,	0x10B,	%g7
	tleu	%xcc,	0x0
	tle	%icc,	0x3
	xor	%o6,	%l6,	%l5
	fmovde	%icc,	%f12,	%f5
	sethi	0x00FC,	%g1
	sub	%g6,	%g5,	%i5
	mova	%xcc,	%o7,	%g3
	subc	%o4,	0x0A4F,	%o0
	fornot2s	%f8,	%f9,	%f27
	bne,a	loop_1254
	stw	%g2,	[%l7 + 0x0C]
	ldstub	[%l7 + 0x16],	%i7
	orncc	%l4,	0x1C91,	%l1
loop_1254:
	sdivcc	%i2,	0x176D,	%i0
	fmovscc	%xcc,	%f3,	%f24
	taddcctv	%i3,	0x0A18,	%i6
	ta	%xcc,	0x1
	udivcc	%o1,	0x110B,	%o5
	tneg	%xcc,	0x6
	ldsh	[%l7 + 0x3E],	%l0
	add	%g4,	%i4,	%o2
	smulcc	%l2,	0x0891,	%l3
	fnand	%f4,	%f16,	%f8
	edge32l	%i1,	%o3,	%g7
	membar	0x40
	nop
	setx	0x13D99F58,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f12
	setx	0xE30C9797,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f17
	fdivs	%f17,	%f12,	%f20
	subc	%o6,	%l6,	%g1
	movcc	%xcc,	%l5,	%g5
	orncc	%i5,	0x02BF,	%o7
	nop
	set	0x75, %i4
	stb	%g6,	[%l7 + %i4]
	edge16n	%o4,	%o0,	%g2
	fmovsvs	%xcc,	%f29,	%f31
	addc	%i7,	%g3,	%l1
	fones	%f8
	xorcc	%l4,	0x09AE,	%i2
	sdivx	%i3,	0x1739,	%i6
	brgez,a	%o1,	loop_1255
	tpos	%icc,	0x5
	srlx	%i0,	0x1D,	%o5
	movrgz	%l0,	0x065,	%g4
loop_1255:
	edge8n	%o2,	%l2,	%l3
	movrlez	%i4,	%o3,	%i1
	nop
	setx	loop_1256,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tle	%icc,	0x5
	bn,a	loop_1257
	xnorcc	%g7,	0x0553,	%l6
loop_1256:
	nop
	wr	%g0,	0x88,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
loop_1257:
	nop
	set	0x18, %g5
	ldxa	[%l7 + %g5] 0x04,	%o6
	fmovdcs	%icc,	%f31,	%f23
	fbuge,a	%fcc2,	loop_1258
	be,pt	%xcc,	loop_1259
	movrgez	%l5,	%g1,	%i5
	sdivcc	%o7,	0x09E5,	%g6
loop_1258:
	fcmpne16	%f4,	%f28,	%o4
loop_1259:
	fexpand	%f28,	%f0
	tcs	%icc,	0x5
	movre	%o0,	%g5,	%g2
	udiv	%i7,	0x09F3,	%g3
	fbuge,a	%fcc1,	loop_1260
	bvc	loop_1261
	srlx	%l4,	0x05,	%l1
	tcs	%icc,	0x5
loop_1260:
	bg,pt	%xcc,	loop_1262
loop_1261:
	tcc	%xcc,	0x6
	fnot1	%f0,	%f22
	fmovdcc	%icc,	%f8,	%f21
loop_1262:
	ld	[%l7 + 0x6C],	%f6
	alignaddr	%i2,	%i3,	%o1
	fmovrdlz	%i6,	%f18,	%f12
	edge8ln	%o5,	%i0,	%l0
	addccc	%g4,	%l2,	%o2
	edge32n	%l3,	%i4,	%o3
	bleu,a,pn	%xcc,	loop_1263
	sdiv	%i1,	0x12E1,	%g7
	movvc	%xcc,	%l6,	%o6
	tne	%xcc,	0x2
loop_1263:
	srl	%l5,	%i5,	%o7
	fxnor	%f16,	%f10,	%f2
	movne	%xcc,	%g6,	%o4
	brgez,a	%g1,	loop_1264
	bn,a,pn	%xcc,	loop_1265
	fornot1	%f2,	%f18,	%f10
	edge32n	%g5,	%o0,	%i7
loop_1264:
	movge	%xcc,	%g3,	%l4
loop_1265:
	sethi	0x1C28,	%l1
	andncc	%g2,	%i3,	%o1
	fmul8x16au	%f3,	%f22,	%f6
	sdivcc	%i2,	0x0054,	%o5
	sdivcc	%i6,	0x18BB,	%i0
	xor	%g4,	0x088D,	%l2
	udiv	%o2,	0x1EDF,	%l0
	bn,a	loop_1266
	fnegs	%f8,	%f13
	srlx	%l3,	%i4,	%o3
	fmovspos	%icc,	%f7,	%f31
loop_1266:
	movgu	%xcc,	%i1,	%l6
	sdivx	%o6,	0x17B4,	%g7
	smulcc	%l5,	0x136E,	%i5
	sll	%o7,	%g6,	%g1
	sll	%o4,	%o0,	%i7
	tcc	%icc,	0x7
	orn	%g5,	0x16FF,	%l4
	nop
	fitod	%f10,	%f24
	fdtoi	%f24,	%f27
	ldstub	[%l7 + 0x6B],	%l1
	tn	%xcc,	0x3
	fmovrdne	%g2,	%f18,	%f20
	fbne	%fcc0,	loop_1267
	call	loop_1268
	movcc	%xcc,	%g3,	%i3
	fxors	%f1,	%f14,	%f7
loop_1267:
	movn	%icc,	%i2,	%o5
loop_1268:
	xnor	%i6,	%o1,	%i0
	andncc	%g4,	%o2,	%l0
	tleu	%icc,	0x2
	tl	%icc,	0x2
	srlx	%l3,	%i4,	%o3
	alignaddr	%i1,	%l2,	%l6
	array16	%o6,	%g7,	%l5
	addccc	%o7,	%g6,	%i5
	edge8ln	%o4,	%o0,	%i7
	array32	%g1,	%l4,	%g5
	movneg	%xcc,	%l1,	%g2
	movcc	%xcc,	%i3,	%g3
	array16	%o5,	%i2,	%o1
	smul	%i6,	0x1903,	%i0
	movcs	%xcc,	%o2,	%g4
	sdivx	%l3,	0x11B8,	%l0
	orcc	%i4,	0x177F,	%i1
	mulscc	%l2,	0x091E,	%o3
	alignaddr	%l6,	%g7,	%o6
	taddcc	%o7,	%l5,	%g6
	bg,a,pn	%xcc,	loop_1269
	fnot2s	%f23,	%f18
	array32	%i5,	%o4,	%o0
	ta	%icc,	0x6
loop_1269:
	popc	%g1,	%i7
	fmovdleu	%xcc,	%f30,	%f20
	nop
	set	0x68, %i0
	ldd	[%l7 + %i0],	%f26
	edge8	%l4,	%g5,	%g2
	addc	%l1,	%i3,	%g3
	bcs	%icc,	loop_1270
	orcc	%o5,	0x1CE2,	%o1
	smulcc	%i2,	%i0,	%o2
	movgu	%xcc,	%g4,	%l3
loop_1270:
	fmovsgu	%icc,	%f12,	%f4
	smulcc	%i6,	%i4,	%i1
	movrgz	%l2,	%o3,	%l6
	fnor	%f2,	%f4,	%f6
	fmul8ulx16	%f20,	%f30,	%f10
	movrlez	%g7,	0x3ED,	%l0
	set	0x70, %g1
	stxa	%o6,	[%l7 + %g1] 0xea
	membar	#Sync
	std	%f2,	[%l7 + 0x68]
	mulscc	%o7,	0x1253,	%g6
	tneg	%icc,	0x0
	edge16l	%i5,	%l5,	%o4
	fpackfix	%f10,	%f1
	movleu	%xcc,	%g1,	%i7
	fzeros	%f5
	fexpand	%f28,	%f30
	fmovs	%f9,	%f23
	nop
	setx	0x2D66E37F897CEB63,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	fsqrtd	%f26,	%f18
	tle	%xcc,	0x3
	fcmpeq16	%f12,	%f12,	%o0
	xor	%l4,	%g2,	%l1
	membar	0x41
	ldd	[%l7 + 0x58],	%f24
	orncc	%g5,	0x0817,	%g3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movcs	%xcc,	%o5,	%o1
	edge16	%i3,	%i2,	%o2
	movvc	%xcc,	%i0,	%l3
	umulcc	%g4,	%i6,	%i1
	umul	%i4,	0x1FE7,	%o3
	movre	%l6,	0x0B7,	%l2
	tvc	%icc,	0x4
	fxors	%f8,	%f28,	%f26
	orcc	%g7,	0x155D,	%o6
	fmovrdlez	%o7,	%f22,	%f4
	nop
	setx	loop_1271,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movpos	%xcc,	%l0,	%g6
	move	%xcc,	%i5,	%o4
	add	%l7,	0x30,	%l6
	wr	%g0,	0x19,	%asi
	ldxa	[%l6] %asi,	%g1
	casxa	[%l6] %asi,	%g1,	%i7
loop_1271:
	fandnot2	%f12,	%f16,	%f0
	bn,pt	%xcc,	loop_1272
	movcs	%icc,	%l5,	%o0
	nop
	setx	0x87EE4CD6906A8BE5,	%l0,	%l6
	stx	%l6,	[%l7 + 0x70]
	ldx	[%l7 + 0x70],	%fsr
	edge8l	%g2,	%l4,	%l1
loop_1272:
	nop
	set	0x77, %l1
	ldstuba	[%l7 + %l1] 0x10,	%g5
	umulcc	%o5,	%g3,	%o1
	edge32n	%i3,	%o2,	%i0
	fmovdcs	%icc,	%f2,	%f10
	membar	0x51
	andcc	%i2,	%l3,	%i6
	brgez,a	%i1,	loop_1273
	fmovdvc	%icc,	%f2,	%f31
	or	%g4,	%o3,	%i4
	sll	%l6,	%l2,	%g7
loop_1273:
	fble	%fcc3,	loop_1274
	movn	%icc,	%o6,	%l0
	nop
	setx loop_1275, %l0, %l1
	jmpl %l1, %g6
	xnorcc	%i5,	%o4,	%o7
loop_1274:
	nop
	setx	0xE0E2B343F076D83C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x58]
	ldx	[%l7 + 0x58],	%fsr
	sra	%i7,	%g1,	%o0
loop_1275:
	fmovrdlz	%l5,	%f26,	%f14
	nop
	setx	0x1FAABBE3,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f23
	fsqrts	%f23,	%f4
	addccc	%l4,	%g2,	%g5
	subc	%o5,	0x067C,	%l1
	andncc	%o1,	%g3,	%o2
	ldd	[%l7 + 0x08],	%i0
	sdivcc	%i3,	0x0D78,	%l3
	subcc	%i2,	0x18EB,	%i6
	fba	%fcc0,	loop_1276
	sdivx	%g4,	0x19A4,	%o3
	orncc	%i1,	%i4,	%l6
	fnor	%f6,	%f12,	%f4
loop_1276:
	popc	%g7,	%l2
	bne,a	loop_1277
	srl	%o6,	0x16,	%g6
	fmovsne	%xcc,	%f9,	%f22
	nop
	setx	loop_1278,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_1277:
	fsrc1	%f16,	%f16
	tn	%icc,	0x6
	wr	%g0,	0x04,	%asi
	ldstuba	[%l7 + 0x1B] %asi,	%i5
loop_1278:
	xorcc	%l0,	0x1A10,	%o4
	fpadd32	%f28,	%f14,	%f26
	edge16ln	%i7,	%g1,	%o7
	subcc	%l5,	%l4,	%o0
	fbe	%fcc0,	loop_1279
	movrlez	%g5,	%o5,	%l1
	fmovrsgz	%g2,	%f28,	%f2
	ldsb	[%l7 + 0x17],	%o1
loop_1279:
	brz,a	%o2,	loop_1280
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
	umulcc	%g3,	%i0,	%i3
	subccc	%i2,	%l3,	%g4
loop_1280:
	mulscc	%i6,	0x034A,	%i1
loop_1281:
	sethi	0x1760,	%o3
	sdiv	%l6,	0x0F23,	%i4
	edge32n	%l2,	%g7,	%o6
	movn	%xcc,	%i5,	%l0
	fnot1s	%f1,	%f26
	movcc	%xcc,	%o4,	%i7
	nop
	setx	0x0D02EF62C81C64E6,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0x345CE3586E1B9D06,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fdivd	%f0,	%f0,	%f0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdiv	%g6,	0x0628,	%o7
	andncc	%l5,	%g1,	%l4
	fmovsne	%xcc,	%f9,	%f13
	tvs	%xcc,	0x4
	umul	%g5,	%o5,	%o0
	tl	%icc,	0x6
	andcc	%g2,	0x1C60,	%l1
	edge16	%o2,	%o1,	%i0
	fmovdvc	%xcc,	%f23,	%f0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovse	%icc,	%f17,	%f5
	tpos	%icc,	0x4
	edge16	%i3,	%i2,	%g3
	umulcc	%l3,	%g4,	%i6
	fmovd	%f2,	%f30
	movcs	%icc,	%i1,	%o3
	movleu	%xcc,	%l6,	%l2
	taddcctv	%i4,	0x1459,	%o6
	fbo,a	%fcc0,	loop_1282
	movrlez	%i5,	%g7,	%l0
	fba	%fcc0,	loop_1283
	edge32ln	%o4,	%g6,	%o7
loop_1282:
	call	loop_1284
	ldsh	[%l7 + 0x3A],	%i7
loop_1283:
	tle	%icc,	0x4
	fmul8ulx16	%f4,	%f2,	%f28
loop_1284:
	brnz,a	%g1,	loop_1285
	edge32	%l4,	%g5,	%o5
	nop
	setx	0x338D14F920707034,	%l0,	%l6
	stx	%l6,	[%l7 + 0x78]
	ldx	[%l7 + 0x78],	%fsr
	fmovdneg	%xcc,	%f14,	%f25
loop_1285:
	edge32ln	%o0,	%l5,	%g2
	add	%l1,	%o2,	%i0
	add	%l7,	0x78,	%l6
	wr	%g0,	0x18,	%asi
	casxa	[%l6] %asi,	%i3,	%i2
	fbule,a	%fcc1,	loop_1286
	xor	%g3,	%o1,	%g4
	bge	loop_1287
	orn	%l3,	0x0E50,	%i6
loop_1286:
	tcs	%xcc,	0x6
	movge	%icc,	%o3,	%i1
loop_1287:
	brnz	%l6,	loop_1288
	fcmpgt32	%f24,	%f2,	%l2
	stx	%i4,	[%l7 + 0x78]
	nop
	setx	0x37CE3E48AB7E5CD0,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0xBDF976FB129BEB92,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	fmuld	%f14,	%f22,	%f30
loop_1288:
	nop
	set	0x0B, %l3
	lduba	[%l7 + %l3] 0x18,	%i5
	ldsb	[%l7 + 0x77],	%o6
	mulx	%l0,	%o4,	%g7
	sth	%g6,	[%l7 + 0x36]
	nop
	fitod	%f4,	%f14
	fdtox	%f14,	%f4
	fmovd	%f16,	%f14
	movne	%icc,	%i7,	%g1
	and	%o7,	%g5,	%l4
	andncc	%o0,	%l5,	%g2
	udivx	%o5,	0x189D,	%o2
	movgu	%xcc,	%l1,	%i0
	nop
	fitos	%f13,	%f18
	fstox	%f18,	%f18
	fmovde	%xcc,	%f1,	%f23
	edge32	%i3,	%g3,	%o1
	bl	%xcc,	loop_1289
	brlz,a	%g4,	loop_1290
	fabsd	%f14,	%f10
	mulscc	%l3,	0x12E0,	%i2
loop_1289:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1290:
	nop
	set	0x17, %o0
	lduba	[%l7 + %o0] 0x0c,	%i6
	fpadd32s	%f2,	%f10,	%f29
	movvc	%xcc,	%o3,	%i1
	fbul	%fcc2,	loop_1291
	fmovrdgz	%l2,	%f4,	%f28
	fble,a	%fcc3,	loop_1292
	fzero	%f8
loop_1291:
	sll	%i4,	0x0B,	%l6
	tne	%xcc,	0x3
loop_1292:
	tgu	%icc,	0x2
	array8	%i5,	%o6,	%o4
	nop
	setx	loop_1293,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	umul	%l0,	%g7,	%i7
	subccc	%g6,	0x0B69,	%o7
	fxnor	%f6,	%f24,	%f8
loop_1293:
	fcmpgt32	%f24,	%f2,	%g5
	brnz	%g1,	loop_1294
	fblg	%fcc3,	loop_1295
	edge8l	%l4,	%l5,	%g2
	movvc	%icc,	%o0,	%o2
loop_1294:
	fandnot1s	%f24,	%f16,	%f9
loop_1295:
	orncc	%l1,	%i0,	%o5
	stb	%i3,	[%l7 + 0x3A]
	nop
	setx	loop_1296,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fmovrsgz	%g3,	%f9,	%f24
	set	0x3A, %g2
	stba	%g4,	[%l7 + %g2] 0xeb
	membar	#Sync
loop_1296:
	tn	%xcc,	0x7
	swap	[%l7 + 0x48],	%o1
	movrne	%i2,	0x10F,	%l3
	smulcc	%o3,	0x1B1F,	%i6
	addc	%l2,	0x1BA6,	%i4
	tne	%xcc,	0x5
	set	0x6C, %l2
	stwa	%l6,	[%l7 + %l2] 0x27
	membar	#Sync
	srlx	%i1,	%i5,	%o4
	wr	%g0,	0x18,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	addc	%o6,	0x0C75,	%g7
	tl	%icc,	0x7
	movcc	%icc,	%l0,	%g6
	addccc	%o7,	%g5,	%g1
	sll	%i7,	%l5,	%g2
	or	%o0,	0x0254,	%o2
	bl,a,pn	%icc,	loop_1297
	edge16n	%l1,	%l4,	%i0
	tge	%icc,	0x4
	wr	%g0,	0x80,	%asi
	ldda	[%l7 + 0x50] %asi,	%i2
loop_1297:
	srax	%o5,	0x15,	%g4
	movre	%g3,	0x0E8,	%i2
	add	%o1,	%l3,	%i6
	movrlez	%o3,	0x19D,	%i4
	fands	%f6,	%f27,	%f28
	movrlz	%l6,	%l2,	%i1
	edge16n	%i5,	%o4,	%g7
	fmovd	%f8,	%f4
	ldd	[%l7 + 0x30],	%l0
	brgez	%g6,	loop_1298
	edge32ln	%o6,	%o7,	%g5
	fmul8x16au	%f3,	%f11,	%f18
	tvc	%icc,	0x1
loop_1298:
	tl	%icc,	0x6
	tle	%icc,	0x5
	tle	%xcc,	0x3
	tn	%xcc,	0x6
	sdiv	%g1,	0x05C1,	%l5
	move	%icc,	%i7,	%g2
	edge16l	%o2,	%o0,	%l1
	faligndata	%f16,	%f4,	%f10
	tn	%icc,	0x4
	fcmple32	%f26,	%f6,	%i0
	subcc	%l4,	0x187E,	%i3
	movl	%icc,	%g4,	%g3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bge,a	loop_1299
	nop
	setx	0xE04DDEED,	%l0,	%l6
	st	%l6,	[%l7 + 0x5C]
	ld	[%l7 + 0x5C],	%fsr
	fmovdvc	%xcc,	%f13,	%f21
	fpack16	%f20,	%f11
loop_1299:
	umulcc	%o5,	%i2,	%l3
	subccc	%o1,	%o3,	%i4
	fxnor	%f30,	%f8,	%f6
	movl	%xcc,	%i6,	%l2
	smulcc	%l6,	%i5,	%o4
	tleu	%xcc,	0x1
	smulcc	%i1,	%g7,	%g6
	sdiv	%l0,	0x098D,	%o6
	tge	%xcc,	0x6
	nop
	setx	0x5BF3E5B9,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f10
	setx	0x0918ED35,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f23
	fmuls	%f23,	%f10,	%f2
	fabss	%f13,	%f30
	fbuge,a	%fcc1,	loop_1300
	nop
	fitod	%f12,	%f14
	fdtox	%f14,	%f0
	fxtod	%f0,	%f8
	fpadd16	%f26,	%f20,	%f22
	fcmple32	%f18,	%f8,	%o7
loop_1300:
	movle	%xcc,	%g5,	%g1
	fmovsvc	%xcc,	%f19,	%f16
	tleu	%xcc,	0x2
	and	%i7,	0x1BBD,	%g2
	xor	%o2,	0x146C,	%l5
	ldsb	[%l7 + 0x66],	%l1
	fbul	%fcc1,	loop_1301
	umulcc	%o0,	%l4,	%i3
	fmovrsne	%g4,	%f10,	%f6
	movg	%icc,	%g3,	%i0
loop_1301:
	movrlez	%o5,	%l3,	%i2
	fsrc2s	%f20,	%f23
	movge	%icc,	%o3,	%o1
	fand	%f22,	%f18,	%f12
	orn	%i6,	%i4,	%l6
	tcc	%icc,	0x6
	ldstub	[%l7 + 0x1C],	%l2
	tg	%xcc,	0x7
	brlez,a	%o4,	loop_1302
	movrlz	%i5,	%i1,	%g6
	edge8	%g7,	%l0,	%o7
	call	loop_1303
loop_1302:
	movcc	%icc,	%o6,	%g1
	movl	%xcc,	%g5,	%i7
	set	0x50, %i7
	sta	%f11,	[%l7 + %i7] 0x88
loop_1303:
	srlx	%g2,	0x07,	%l5
	set	0x40, %o7
	ldda	[%l7 + %o7] 0x04,	%f0
	fxors	%f27,	%f17,	%f8
	srlx	%o2,	%o0,	%l4
	edge16n	%i3,	%l1,	%g3
	stb	%i0,	[%l7 + 0x6C]
	srax	%g4,	%o5,	%i2
	brlez,a	%o3,	loop_1304
	sdivx	%l3,	0x0DD1,	%o1
	fandnot2s	%f2,	%f9,	%f3
	fabss	%f15,	%f0
loop_1304:
	fmovsneg	%icc,	%f6,	%f11
	umulcc	%i6,	0x1E5F,	%l6
	udivx	%l2,	0x0DA1,	%i4
	fmovsa	%icc,	%f25,	%f1
	array32	%o4,	%i5,	%g6
	fnot1	%f24,	%f18
	fmovse	%xcc,	%f22,	%f15
	bvs,a,pt	%xcc,	loop_1305
	ldsw	[%l7 + 0x74],	%g7
	movleu	%icc,	%l0,	%i1
	bne,a,pt	%xcc,	loop_1306
loop_1305:
	movrlez	%o6,	0x2C3,	%g1
	movleu	%icc,	%o7,	%i7
	fpmerge	%f22,	%f23,	%f16
loop_1306:
	nop
	setx	0xB6BEA47570576084,	%l0,	%l6
	stx	%l6,	[%l7 + 0x78]
	ldx	[%l7 + 0x78],	%fsr
	tcs	%xcc,	0x1
	umul	%g2,	0x081D,	%g5
	tvs	%xcc,	0x4
	wr	%g0,	0x88,	%asi
	stwa	%l5,	[%l7 + 0x30] %asi
	fornot2	%f8,	%f12,	%f0
	movrgez	%o0,	0x3D8,	%l4
	andn	%i3,	0x1E3D,	%o2
	tneg	%xcc,	0x2
	tge	%icc,	0x7
	sub	%g3,	0x10DC,	%l1
	tsubcc	%i0,	%o5,	%i2
	edge32ln	%o3,	%g4,	%l3
	movrgez	%i6,	0x027,	%l6
	edge8ln	%l2,	%o1,	%i4
	movre	%i5,	%o4,	%g7
	set	0x2F, %l5
	ldsba	[%l7 + %l5] 0x18,	%l0
	sdiv	%i1,	0x0413,	%o6
	addccc	%g1,	%g6,	%i7
	nop
	setx	0x19F848289051C0ED,	%l0,	%l6
	stx	%l6,	[%l7 + 0x38]
	ldx	[%l7 + 0x38],	%fsr
	srl	%o7,	%g2,	%l5
	st	%f0,	[%l7 + 0x50]
	set	0x38, %o2
	ldswa	[%l7 + %o2] 0x81,	%g5
	fbug,a	%fcc3,	loop_1307
	bgu,a	%icc,	loop_1308
	subcc	%o0,	%i3,	%l4
	movre	%g3,	0x316,	%l1
loop_1307:
	movcc	%icc,	%o2,	%i0
loop_1308:
	smul	%i2,	%o5,	%o3
	ble	loop_1309
	fmovdcc	%xcc,	%f22,	%f28
	tvs	%icc,	0x1
	fandnot1s	%f8,	%f29,	%f24
loop_1309:
	edge32n	%g4,	%i6,	%l3
	fmovsle	%xcc,	%f30,	%f1
	mulx	%l2,	0x1F3C,	%l6
	edge32	%o1,	%i4,	%i5
	srlx	%g7,	0x1B,	%l0
	movrlez	%o4,	0x043,	%o6
	sir	0x03AC
	tvc	%xcc,	0x1
	srl	%i1,	0x07,	%g6
	fmovscs	%icc,	%f19,	%f0
	fmovrde	%g1,	%f26,	%f10
	fmovsleu	%xcc,	%f18,	%f18
	movrne	%o7,	0x272,	%i7
	movgu	%xcc,	%g2,	%l5
	ba,a	loop_1310
	add	%o0,	0x0A4F,	%i3
	tsubcc	%g5,	%l4,	%g3
	add	%l7,	0x60,	%l6
	wr	%g0,	0x19,	%asi
	casxa	[%l6] %asi,	%l1,	%i0
loop_1310:
	mulscc	%i2,	0x11E4,	%o5
	nop
	setx loop_1311, %l0, %l1
	jmpl %l1, %o3
	fpsub16s	%f26,	%f9,	%f23
	movge	%xcc,	%o2,	%g4
	edge32l	%l3,	%l2,	%i6
loop_1311:
	popc	%o1,	%i4
	udivcc	%l6,	0x1460,	%g7
	fnot1s	%f21,	%f12
	add	%l0,	%o4,	%i5
	fmul8x16al	%f31,	%f15,	%f20
	fmovrdlz	%i1,	%f14,	%f16
	tge	%icc,	0x7
	or	%o6,	%g1,	%o7
	nop
	fitod	%f4,	%f10
	fdtox	%f10,	%f18
	fxtod	%f18,	%f8
	movrlz	%g6,	%g2,	%i7
	set	0x3F, %i1
	lduba	[%l7 + %i1] 0x18,	%l5
	ta	%xcc,	0x4
	edge8n	%o0,	%g5,	%i3
	subccc	%l4,	%l1,	%g3
	udivcc	%i0,	0x15C0,	%i2
	fmovsne	%xcc,	%f5,	%f22
	movle	%xcc,	%o5,	%o2
	sll	%o3,	%g4,	%l2
	sdivx	%l3,	0x1204,	%o1
	fand	%f24,	%f24,	%f24
	nop
	set	0x4A, %o3
	ldub	[%l7 + %o3],	%i4
	fsrc1s	%f3,	%f29
	swap	[%l7 + 0x6C],	%i6
	movne	%xcc,	%l6,	%l0
	fmul8x16au	%f31,	%f21,	%f20
	fmovsvc	%icc,	%f4,	%f11
	movpos	%icc,	%o4,	%g7
	movrlz	%i5,	0x3C4,	%o6
	mulscc	%i1,	0x1784,	%o7
	movn	%icc,	%g6,	%g2
	edge8	%i7,	%l5,	%g1
	set	0x60, %i3
	lda	[%l7 + %i3] 0x80,	%f27
	ld	[%l7 + 0x54],	%f19
	fpack32	%f8,	%f24,	%f2
	fble,a	%fcc2,	loop_1312
	bg,a	%icc,	loop_1313
	addc	%o0,	%i3,	%g5
	nop
	setx	0x95FCB5026355A190,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0xAEAF5722D6C50124,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	faddd	%f0,	%f22,	%f30
loop_1312:
	fornot1	%f26,	%f8,	%f8
loop_1313:
	subccc	%l4,	0x1D2A,	%g3
	tg	%icc,	0x3
	lduh	[%l7 + 0x40],	%i0
	sllx	%l1,	0x0A,	%i2
	smul	%o5,	0x1095,	%o3
	edge32l	%g4,	%l2,	%l3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tge	%xcc,	0x0
	nop
	setx	0x0429FF8BCF6A9B50,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0x18C463EF326065BA,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	faddd	%f12,	%f24,	%f24
	mulx	%o1,	%i4,	%i6
	set	0x20, %l6
	ldsha	[%l7 + %l6] 0x15,	%o2
	fba,a	%fcc2,	loop_1314
	mulx	%l0,	%o4,	%l6
	umulcc	%i5,	0x1B29,	%g7
	smulcc	%o6,	%i1,	%g6
loop_1314:
	sdivcc	%o7,	0x09F2,	%i7
	fmovrsgez	%g2,	%f31,	%f14
	fbuge,a	%fcc2,	loop_1315
	edge16ln	%l5,	%g1,	%o0
	andncc	%i3,	%l4,	%g5
	st	%f28,	[%l7 + 0x30]
loop_1315:
	sll	%i0,	0x00,	%g3
	sdivcc	%l1,	0x0D13,	%i2
	edge16ln	%o5,	%o3,	%l2
	fsrc1s	%f24,	%f3
	brz	%l3,	loop_1316
	mulx	%o1,	0x1C5E,	%g4
	fabsd	%f20,	%f26
	andn	%i6,	0x11B2,	%i4
loop_1316:
	ta	%icc,	0x7
	sdivx	%l0,	0x00C0,	%o4
	ldd	[%l7 + 0x28],	%o2
	mova	%icc,	%l6,	%i5
	te	%icc,	0x1
	popc	%g7,	%o6
	fba	%fcc0,	loop_1317
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsb	[%l7 + 0x1A],	%i1
	fmuld8sux16	%f30,	%f10,	%f26
loop_1317:
	movge	%icc,	%g6,	%o7
	movcc	%xcc,	%g2,	%i7
	fcmpgt16	%f12,	%f26,	%g1
	wr	%g0,	0x52,	%asi
	stxa	%o0,	[%g0 + 0x118] %asi
	tneg	%icc,	0x4
	or	%l5,	%l4,	%g5
	srl	%i3,	0x0F,	%i0
	tg	%xcc,	0x0
	move	%xcc,	%g3,	%i2
	edge16	%o5,	%l1,	%o3
	for	%f22,	%f26,	%f2
	srl	%l3,	%l2,	%g4
	umulcc	%i6,	0x033E,	%i4
	brlez	%o1,	loop_1318
	addccc	%l0,	%o2,	%o4
	fmovrdgez	%i5,	%f28,	%f28
	addccc	%g7,	0x0E1E,	%l6
loop_1318:
	swap	[%l7 + 0x10],	%o6
	movle	%icc,	%i1,	%g6
	tleu	%xcc,	0x3
	fmovrdne	%g2,	%f18,	%f26
	tleu	%xcc,	0x5
	movrne	%i7,	%o7,	%o0
	fcmple16	%f22,	%f12,	%l5
	fmovdgu	%icc,	%f31,	%f7
	wr	%g0,	0x88,	%asi
	ldswa	[%l7 + 0x68] %asi,	%l4
	edge16	%g5,	%i3,	%g1
	edge16	%g3,	%i0,	%o5
	orn	%l1,	0x0271,	%i2
	movvs	%icc,	%l3,	%o3
	movne	%xcc,	%l2,	%i6
	sth	%i4,	[%l7 + 0x72]
	fnot1s	%f3,	%f23
	fornot2s	%f14,	%f12,	%f3
	move	%xcc,	%g4,	%l0
	edge8	%o1,	%o4,	%i5
	nop
	fitod	%f2,	%f28
	fdtoi	%f28,	%f24
	edge16n	%o2,	%l6,	%o6
	xnor	%g7,	0x1E41,	%i1
	movneg	%xcc,	%g6,	%g2
	fsrc2s	%f28,	%f29
	array8	%o7,	%i7,	%l5
	fands	%f5,	%f27,	%f15
	add	%l4,	0x17F4,	%g5
	std	%f2,	[%l7 + 0x18]
	sir	0x1922
	fmovrslez	%i3,	%f23,	%f1
	sdiv	%o0,	0x10F2,	%g1
	fbe,a	%fcc0,	loop_1319
	alignaddr	%g3,	%o5,	%l1
	movle	%icc,	%i0,	%l3
	edge32	%o3,	%l2,	%i2
loop_1319:
	array32	%i6,	%g4,	%l0
	movpos	%icc,	%i4,	%o4
	wr	%g0,	0x10,	%asi
	ldsha	[%l7 + 0x52] %asi,	%i5
	wr	%g0,	0x04,	%asi
	ldswa	[%l7 + 0x0C] %asi,	%o2
	or	%o1,	0x0411,	%o6
	fmovdleu	%xcc,	%f25,	%f26
	tsubcc	%l6,	0x034B,	%g7
	movrlez	%i1,	0x3B8,	%g6
	brnz,a	%g2,	loop_1320
	mova	%xcc,	%i7,	%l5
	bleu	%icc,	loop_1321
	edge32n	%l4,	%o7,	%g5
loop_1320:
	movg	%xcc,	%o0,	%g1
	srlx	%g3,	0x07,	%i3
loop_1321:
	nop
	setx	loop_1322,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fbul,a	%fcc3,	loop_1323
	fzero	%f20
	fba,a	%fcc1,	loop_1324
loop_1322:
	movrgz	%l1,	0x26B,	%o5
loop_1323:
	tleu	%xcc,	0x1
	fbn	%fcc3,	loop_1325
loop_1324:
	edge8l	%l3,	%o3,	%l2
	srax	%i0,	0x11,	%i6
	bvc,a,pn	%icc,	loop_1326
loop_1325:
	movleu	%icc,	%i2,	%l0
	movrgz	%i4,	0x20F,	%o4
	fmovsleu	%icc,	%f12,	%f1
loop_1326:
	tn	%icc,	0x2
	ldd	[%l7 + 0x78],	%i4
	movl	%icc,	%o2,	%o1
	array8	%g4,	%o6,	%l6
	xnor	%i1,	0x1800,	%g7
	ba	loop_1327
	fpadd16	%f10,	%f4,	%f20
	fbul	%fcc0,	loop_1328
	nop
	setx	0xBA1D4829AD62FB3F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	fsqrtd	%f20,	%f4
loop_1327:
	move	%icc,	%g6,	%g2
	tvs	%xcc,	0x1
loop_1328:
	tcs	%xcc,	0x4
	tcs	%xcc,	0x2
	movrlz	%i7,	0x1EA,	%l5
	array8	%o7,	%l4,	%g5
	orn	%g1,	%g3,	%i3
	fbne,a	%fcc0,	loop_1329
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsh	[%l7 + 0x1E],	%o0
	fba	%fcc0,	loop_1330
loop_1329:
	fmovdpos	%icc,	%f7,	%f20
	fbg	%fcc2,	loop_1331
	movrlez	%l1,	0x3AB,	%l3
loop_1330:
	taddcctv	%o5,	0x041D,	%o3
	nop
	setx	0xA7E479E660572A4C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldx	[%l7 + 0x28],	%fsr
loop_1331:
	srlx	%l2,	%i6,	%i0
	udiv	%l0,	0x17CF,	%i2
	fnor	%f4,	%f0,	%f30
	movneg	%icc,	%o4,	%i4
	mulx	%i5,	%o2,	%o1
	movvc	%xcc,	%g4,	%o6
	nop
	setx	0xC41B60DB,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f7
	setx	0x7566DCDB,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f14
	fadds	%f14,	%f7,	%f21
	fbuge,a	%fcc1,	loop_1332
	addc	%l6,	%i1,	%g7
	bshuffle	%f8,	%f4,	%f8
	brlz,a	%g2,	loop_1333
loop_1332:
	movgu	%xcc,	%g6,	%l5
	nop
	fitod	%f12,	%f2
	fdtox	%f2,	%f14
	wr	%g0,	0x88,	%asi
	swapa	[%l7 + 0x0C] %asi,	%o7
loop_1333:
	movrne	%i7,	0x2C9,	%l4
	fble,a	%fcc0,	loop_1334
	fmovsa	%xcc,	%f13,	%f16
	edge32	%g5,	%g3,	%g1
	fandnot2s	%f20,	%f11,	%f30
loop_1334:
	umul	%o0,	0x1EC7,	%i3
	array16	%l3,	%o5,	%o3
	tgu	%icc,	0x7
	bvc	loop_1335
	xnor	%l1,	0x1A4F,	%l2
	brnz,a	%i0,	loop_1336
	orn	%l0,	%i2,	%i6
loop_1335:
	orcc	%i4,	0x000F,	%i5
	movvs	%xcc,	%o2,	%o4
loop_1336:
	fpack32	%f10,	%f0,	%f6
	popc	0x0CEB,	%g4
	movgu	%icc,	%o1,	%o6
	edge16n	%i1,	%l6,	%g2
	addc	%g7,	0x123C,	%l5
	taddcc	%g6,	0x0C40,	%o7
	sllx	%l4,	0x13,	%g5
	set	0x40, %g7
	ldda	[%l7 + %g7] 0x88,	%f16
	movg	%xcc,	%g3,	%i7
	fmovdcs	%icc,	%f28,	%f5
	ldx	[%l7 + 0x68],	%o0
	movrne	%g1,	%i3,	%o5
	movvs	%xcc,	%o3,	%l3
	tl	%icc,	0x4
	fblg,a	%fcc1,	loop_1337
	fmovsleu	%xcc,	%f19,	%f2
	brlz	%l1,	loop_1338
	orcc	%l2,	0x025D,	%l0
loop_1337:
	sllx	%i0,	%i2,	%i6
	stb	%i5,	[%l7 + 0x1B]
loop_1338:
	srl	%o2,	%i4,	%o4
	nop
	fitos	%f12,	%f18
	fstod	%f18,	%f0
	tne	%xcc,	0x4
	tpos	%xcc,	0x5
	fpack32	%f8,	%f10,	%f30
	tsubcctv	%o1,	0x198C,	%o6
	andcc	%i1,	%l6,	%g2
	brgz	%g7,	loop_1339
	andcc	%g4,	%g6,	%l5
	fmovdcc	%icc,	%f30,	%f25
	movn	%icc,	%o7,	%g5
loop_1339:
	nop
	add	%l7,	0x18,	%l6
	wr	%g0,	0x10,	%asi
	casa	[%l6] %asi,	%l4,	%i7
	xnorcc	%g3,	%g1,	%i3
	tl	%xcc,	0x3
	stx	%o5,	[%l7 + 0x08]
	fones	%f12
	fpsub32	%f20,	%f2,	%f10
	sub	%o3,	%l3,	%l1
	wr	%g0,	0x80,	%asi
	swapa	[%l7 + 0x68] %asi,	%l2
	orn	%l0,	%o0,	%i2
	st	%f22,	[%l7 + 0x2C]
	set	0x14, %i2
	stwa	%i6,	[%l7 + %i2] 0x19
	movrne	%i5,	%o2,	%i4
	fmovdge	%xcc,	%f6,	%f24
	bgu	%xcc,	loop_1340
	tcc	%icc,	0x7
	edge32n	%i0,	%o1,	%o4
	ldd	[%l7 + 0x40],	%f2
loop_1340:
	te	%xcc,	0x1
	fmovdleu	%xcc,	%f22,	%f29
	ta	%icc,	0x5
	mulx	%o6,	0x1290,	%l6
	brlez,a	%g2,	loop_1341
	andn	%g7,	0x0D29,	%g4
	fmovsvc	%icc,	%f7,	%f31
	tg	%icc,	0x7
loop_1341:
	tcc	%icc,	0x3
	ba,pt	%icc,	loop_1342
	st	%f14,	[%l7 + 0x40]
	fmul8x16au	%f7,	%f22,	%f30
	movl	%icc,	%i1,	%l5
loop_1342:
	tcs	%xcc,	0x0
	fandnot1s	%f25,	%f14,	%f6
	bne,a,pt	%icc,	loop_1343
	fsrc2s	%f17,	%f27
	add	%l7,	0x20,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%o7,	%g6
loop_1343:
	srlx	%g5,	%i7,	%g3
	srl	%l4,	0x13,	%g1
	std	%f30,	[%l7 + 0x48]
	wr	%g0,	0x18,	%asi
	sta	%f9,	[%l7 + 0x48] %asi
	sir	0x0A56
	call	loop_1344
	nop
	setx	0xC78828A1D7D5BE36,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0x8994F2591B03A937,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	fsubd	%f22,	%f8,	%f24
	movle	%icc,	%i3,	%o3
	udivx	%l3,	0x1A77,	%o5
loop_1344:
	faligndata	%f8,	%f2,	%f18
	movcc	%icc,	%l1,	%l2
	tle	%xcc,	0x0
	for	%f28,	%f22,	%f4
	fmovrdne	%o0,	%f14,	%f18
	sub	%i2,	%l0,	%i6
	umulcc	%i5,	%i4,	%i0
	sub	%o1,	%o2,	%o6
	sethi	0x0362,	%o4
	wr	%g0,	0x11,	%asi
	swapa	[%l7 + 0x58] %asi,	%g2
	movpos	%icc,	%l6,	%g7
	fpadd32s	%f8,	%f4,	%f14
	ta	%icc,	0x1
	set	0x74, %o6
	lda	[%l7 + %o6] 0x15,	%f4
	movl	%icc,	%i1,	%g4
	movrlz	%o7,	%l5,	%g6
	fandnot1	%f30,	%f24,	%f10
	ba,a	loop_1345
	faligndata	%f16,	%f30,	%f4
	fxors	%f27,	%f30,	%f4
	fcmpne32	%f2,	%f8,	%i7
loop_1345:
	sethi	0x028A,	%g5
	edge32	%l4,	%g3,	%g1
	nop
	fitos	%f0,	%f25
	fstox	%f25,	%f10
	fxtos	%f10,	%f14
	movre	%i3,	0x0E3,	%o3
	xorcc	%o5,	0x017F,	%l3
	nop
	setx loop_1346, %l0, %l1
	jmpl %l1, %l1
	edge8l	%o0,	%l2,	%l0
	stbar
	tvc	%icc,	0x1
loop_1346:
	fbue,a	%fcc0,	loop_1347
	fandnot2	%f12,	%f4,	%f26
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrlez	%i2,	%i5,	%i6
loop_1347:
	addcc	%i4,	%o1,	%i0
	fpsub32	%f18,	%f6,	%f26
	set	0x10, %l4
	ldda	[%l7 + %l4] 0x19,	%o6
	tcc	%icc,	0x3
	std	%f16,	[%l7 + 0x48]
	fand	%f20,	%f4,	%f20
	xnorcc	%o4,	0x0250,	%g2
	alignaddrl	%l6,	%g7,	%i1
	movcc	%xcc,	%g4,	%o2
	wr	%g0,	0x81,	%asi
	lda	[%l7 + 0x14] %asi,	%f8
	array32	%o7,	%l5,	%g6
	edge16ln	%g5,	%i7,	%g3
	nop
	setx	0x4F2A90EA992BA3E3,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0xEF2C7DC54B5CB506,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	fdivd	%f20,	%f24,	%f24
	fones	%f30
	mova	%xcc,	%l4,	%g1
	addcc	%o3,	%i3,	%o5
	taddcc	%l1,	%o0,	%l3
	fpsub32s	%f19,	%f4,	%f6
	nop
	set	0x4B, %l0
	ldsb	[%l7 + %l0],	%l2
	fxnor	%f10,	%f22,	%f26
	mova	%xcc,	%l0,	%i5
	fblg	%fcc2,	loop_1348
	fbug,a	%fcc0,	loop_1349
	fblg	%fcc2,	loop_1350
	nop
	fitod	%f16,	%f26
loop_1348:
	bn,pn	%icc,	loop_1351
loop_1349:
	fand	%f18,	%f4,	%f6
loop_1350:
	edge32ln	%i6,	%i4,	%o1
	ldub	[%l7 + 0x6F],	%i2
loop_1351:
	fmovdle	%icc,	%f5,	%f3
	array32	%i0,	%o4,	%g2
	lduh	[%l7 + 0x42],	%o6
	udivx	%g7,	0x15B9,	%i1
	mulscc	%g4,	%o2,	%o7
	add	%l7,	0x20,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%l5,	%l6
	subc	%g5,	%i7,	%g6
	ldub	[%l7 + 0x65],	%l4
	movrgz	%g1,	%o3,	%i3
	nop
	setx	0x20779F28,	%l0,	%l6
	st	%l6,	[%l7 + 0x40]
	ld	[%l7 + 0x40],	%fsr
	fandnot2	%f6,	%f14,	%f18
	fsrc2s	%f24,	%f24
	movrlz	%g3,	%l1,	%o5
	edge16ln	%o0,	%l3,	%l0
	movrlez	%i5,	%i6,	%i4
	alignaddrl	%l2,	%i2,	%i0
	sub	%o4,	%g2,	%o6
	nop
	setx loop_1352, %l0, %l1
	jmpl %l1, %g7
	movrgez	%o1,	%g4,	%i1
	bneg	loop_1353
	udivcc	%o2,	0x0FB3,	%o7
loop_1352:
	nop
	set	0x0E, %o1
	ldsha	[%l7 + %o1] 0x11,	%l5
loop_1353:
	movcc	%xcc,	%l6,	%i7
	fpadd16s	%f15,	%f9,	%f15
	tcs	%xcc,	0x5
	tvs	%xcc,	0x6
	taddcc	%g6,	0x10A1,	%g5
	edge16ln	%l4,	%o3,	%i3
	movne	%icc,	%g1,	%l1
	edge32ln	%o5,	%o0,	%g3
	movg	%xcc,	%l3,	%l0
	subcc	%i6,	%i4,	%i5
	bn,a,pt	%xcc,	loop_1354
	nop
	setx loop_1355, %l0, %l1
	jmpl %l1, %l2
	fxor	%f4,	%f6,	%f2
	mova	%icc,	%i2,	%i0
loop_1354:
	fble	%fcc2,	loop_1356
loop_1355:
	ble	loop_1357
	edge16ln	%g2,	%o6,	%o4
	sdivcc	%g7,	0x0989,	%g4
loop_1356:
	array16	%o1,	%i1,	%o2
loop_1357:
	alignaddr	%l5,	%o7,	%i7
	fmovsge	%icc,	%f3,	%f5
	movgu	%xcc,	%g6,	%l6
	sll	%g5,	%l4,	%o3
	set	0x48, %g4
	sta	%f30,	[%l7 + %g4] 0x80
	tvs	%xcc,	0x5
	brgez	%i3,	loop_1358
	fmovrdlez	%g1,	%f16,	%f24
	or	%o5,	%o0,	%g3
	edge16l	%l3,	%l0,	%l1
loop_1358:
	nop
	setx	0x271230E8E3588F31,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0x4E590BEABEE981C7,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	fdivd	%f20,	%f2,	%f8
	and	%i6,	0x01BC,	%i4
	array16	%i5,	%l2,	%i2
	edge16l	%g2,	%o6,	%i0
	movcs	%xcc,	%g7,	%o4
	fmovdneg	%icc,	%f15,	%f13
	movcs	%icc,	%g4,	%o1
	nop
	setx	0xC0FA21AF,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f30
	setx	0xE81A9C01,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f2
	fdivs	%f2,	%f30,	%f2
	move	%icc,	%o2,	%l5
	movpos	%xcc,	%i1,	%o7
	andn	%i7,	0x0846,	%l6
	umulcc	%g6,	%l4,	%g5
	fornot1	%f22,	%f6,	%f14
	fble	%fcc3,	loop_1359
	fbne,a	%fcc1,	loop_1360
	sdivcc	%o3,	0x183F,	%g1
	brnz,a	%i3,	loop_1361
loop_1359:
	sllx	%o5,	%g3,	%l3
loop_1360:
	tneg	%icc,	0x0
	flush	%l7 + 0x20
loop_1361:
	swap	[%l7 + 0x50],	%o0
	andcc	%l0,	%l1,	%i6
	bcs,a,pt	%icc,	loop_1362
	mulscc	%i5,	0x1681,	%l2
	bvc,pn	%icc,	loop_1363
	fblg,a	%fcc2,	loop_1364
loop_1362:
	mova	%icc,	%i2,	%i4
	sdiv	%g2,	0x09CC,	%i0
loop_1363:
	sth	%o6,	[%l7 + 0x3E]
loop_1364:
	te	%icc,	0x1
	bvs,a	%xcc,	loop_1365
	orncc	%g7,	0x051B,	%g4
	fsrc2	%f20,	%f2
	set	0x6C, %o4
	ldswa	[%l7 + %o4] 0x88,	%o4
loop_1365:
	udivx	%o1,	0x0B24,	%l5
	popc	%i1,	%o7
	srax	%i7,	0x13,	%l6
	fmovse	%icc,	%f11,	%f23
	movgu	%xcc,	%o2,	%l4
	edge32	%g6,	%g5,	%g1
	tleu	%xcc,	0x5
	move	%icc,	%o3,	%i3
	xorcc	%g3,	0x1D80,	%l3
	fmovdvs	%icc,	%f23,	%f3
	sdiv	%o5,	0x0135,	%o0
	movrlz	%l1,	0x2FE,	%i6
	mulx	%l0,	%i5,	%l2
	movrgez	%i4,	%g2,	%i0
	movle	%icc,	%i2,	%g7
	ldx	[%l7 + 0x78],	%g4
	andn	%o6,	%o4,	%o1
	edge32l	%l5,	%i1,	%o7
	tne	%xcc,	0x4
	edge8n	%l6,	%o2,	%l4
	movne	%icc,	%i7,	%g6
	fandnot1s	%f5,	%f27,	%f11
	tn	%xcc,	0x6
	prefetch	[%l7 + 0x6C],	 0x0
	nop
	fitod	%f2,	%f10
	fdtos	%f10,	%f23
	movvc	%xcc,	%g5,	%g1
	std	%f30,	[%l7 + 0x78]
	edge32ln	%i3,	%o3,	%l3
	fpack32	%f24,	%f14,	%f20
	ble	%xcc,	loop_1366
	tleu	%icc,	0x2
	ldx	[%l7 + 0x30],	%g3
	fmovrse	%o5,	%f3,	%f5
loop_1366:
	nop
	wr	%g0,	0x0c,	%asi
	swapa	[%l7 + 0x64] %asi,	%o0
	add	%i6,	%l0,	%i5
	movrgez	%l2,	%i4,	%g2
	andcc	%i0,	0x1946,	%l1
	sdivcc	%i2,	0x0FD2,	%g4
	mulscc	%o6,	%g7,	%o1
	array32	%o4,	%i1,	%l5
	nop
	setx	0x563A7E0E90775508,	%l0,	%l6
	stx	%l6,	[%l7 + 0x58]
	ldx	[%l7 + 0x58],	%fsr
	set	0x30, %o5
	prefetcha	[%l7 + %o5] 0x04,	 0x0
	tcs	%xcc,	0x1
	tvs	%xcc,	0x7
	smulcc	%l6,	%o2,	%l4
	movneg	%xcc,	%i7,	%g6
	fmovdvc	%xcc,	%f3,	%f24
	nop
	setx	loop_1367,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	stw	%g1,	[%l7 + 0x34]
	fmovdvc	%icc,	%f29,	%f10
	set	0x08, %i5
	lda	[%l7 + %i5] 0x14,	%f18
loop_1367:
	fmovrsne	%i3,	%f28,	%f22
	movle	%xcc,	%g5,	%l3
	tcc	%icc,	0x7
	edge8ln	%o3,	%g3,	%o0
	movneg	%xcc,	%o5,	%i6
	fbn,a	%fcc0,	loop_1368
	movvs	%icc,	%i5,	%l0
	sdiv	%l2,	0x05A8,	%g2
	brgez,a	%i0,	loop_1369
loop_1368:
	call	loop_1370
	umulcc	%i4,	0x15AE,	%i2
	add	%l7,	0x60,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%g4
	casxa	[%l6] %asi,	%g4,	%o6
loop_1369:
	udivcc	%g7,	0x0625,	%o1
loop_1370:
	faligndata	%f24,	%f28,	%f28
	smul	%o4,	%l1,	%l5
	bneg,pn	%icc,	loop_1371
	fmovdvs	%xcc,	%f27,	%f7
	udiv	%o7,	0x0AF8,	%i1
	add	%l7,	0x28,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%o2,	%l4
loop_1371:
	edge16n	%l6,	%g6,	%g1
	alignaddrl	%i7,	%i3,	%g5
	subc	%l3,	%g3,	%o0
	subcc	%o3,	%o5,	%i5
	addccc	%i6,	%l2,	%l0
	ba,a,pt	%icc,	loop_1372
	lduw	[%l7 + 0x58],	%g2
	subccc	%i0,	0x0C80,	%i4
	movrlz	%i2,	%o6,	%g4
loop_1372:
	sllx	%g7,	%o4,	%l1
	fmovdleu	%xcc,	%f1,	%f12
	brnz	%l5,	loop_1373
	fcmpgt32	%f4,	%f12,	%o1
	fpackfix	%f18,	%f20
	mulscc	%i1,	%o2,	%l4
loop_1373:
	alignaddr	%l6,	%g6,	%o7
	fbu,a	%fcc0,	loop_1374
	edge16n	%g1,	%i7,	%i3
	fmovdvs	%xcc,	%f3,	%f21
	addcc	%l3,	%g3,	%g5
loop_1374:
	stb	%o3,	[%l7 + 0x7D]
	movrgz	%o5,	0x0F2,	%o0
	movvs	%icc,	%i6,	%l2
	srl	%l0,	0x1F,	%i5
	ldub	[%l7 + 0x1E],	%i0
	fmovrslez	%i4,	%f17,	%f23
	movrlz	%i2,	0x1D5,	%o6
	tcc	%xcc,	0x3
	fexpand	%f12,	%f14
	edge8n	%g2,	%g4,	%o4
	fnot1s	%f13,	%f18
	brnz	%g7,	loop_1375
	fandnot2	%f14,	%f28,	%f12
	bpos,a	loop_1376
	fmovscc	%xcc,	%f23,	%f13
loop_1375:
	fmovrdgz	%l5,	%f6,	%f4
	sdiv	%o1,	0x1D01,	%i1
loop_1376:
	fbule,a	%fcc3,	loop_1377
	movleu	%icc,	%l1,	%o2
	movvc	%xcc,	%l4,	%g6
	fabsd	%f0,	%f22
loop_1377:
	sir	0x1699
	alignaddr	%l6,	%o7,	%i7
	sdivx	%i3,	0x14C1,	%l3
	edge32l	%g1,	%g5,	%o3
	udivx	%o5,	0x0220,	%g3
	fmovsgu	%xcc,	%f3,	%f3
	fmul8x16	%f9,	%f24,	%f30
	subccc	%i6,	0x13E8,	%l2
	bneg,a,pt	%xcc,	loop_1378
	array32	%o0,	%i5,	%l0
	orcc	%i0,	0x04B8,	%i4
	nop
	setx	0x3BA043C5,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f3
	setx	0x62CDE205,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f11
	fmuls	%f11,	%f3,	%f27
loop_1378:
	tle	%icc,	0x2
	wr	%g0,	0x1e,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
	edge8n	%i2,	%g2,	%o6
	fbule	%fcc1,	loop_1379
	nop
	fitod	%f2,	%f20
	fdtoi	%f20,	%f3
	bn,a	loop_1380
	nop
	setx	0x2594A2ED,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f13
	setx	0x9D5FF817,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f18
	fmuls	%f18,	%f13,	%f24
loop_1379:
	srlx	%o4,	%g7,	%g4
	edge8ln	%l5,	%o1,	%i1
loop_1380:
	fmovrslz	%o2,	%f13,	%f5
	edge16	%l1,	%g6,	%l6
	sdivcc	%o7,	0x0A93,	%l4
	fbule,a	%fcc0,	loop_1381
	or	%i3,	0x1EEA,	%i7
	sdivx	%l3,	0x0AC8,	%g5
	movre	%g1,	0x2CD,	%o3
loop_1381:
	movvc	%xcc,	%g3,	%o5
	movrlez	%l2,	%o0,	%i6
	andn	%l0,	0x1ADE,	%i5
	tle	%xcc,	0x4
	fmovdcs	%icc,	%f5,	%f8
	fmovrdgez	%i4,	%f18,	%f30
	edge16l	%i2,	%g2,	%i0
	movle	%xcc,	%o4,	%o6
	ta	%icc,	0x5
	mulx	%g4,	0x0160,	%g7
	brz	%l5,	loop_1382
	fbue	%fcc2,	loop_1383
	tsubcctv	%i1,	%o2,	%l1
	fmovsleu	%xcc,	%f18,	%f20
loop_1382:
	tneg	%xcc,	0x4
loop_1383:
	movne	%xcc,	%o1,	%g6
	ld	[%l7 + 0x44],	%f30
	movgu	%xcc,	%o7,	%l6
	srl	%i3,	0x05,	%i7
	set	0x70, %g6
	ldstuba	[%l7 + %g6] 0x19,	%l3
	smul	%g5,	0x072B,	%l4
	array8	%g1,	%o3,	%o5
	fmovdle	%icc,	%f31,	%f25
	movleu	%xcc,	%l2,	%g3
	lduh	[%l7 + 0x6A],	%o0
	taddcctv	%i6,	%i5,	%l0
	fmovsn	%icc,	%f11,	%f4
	ldd	[%l7 + 0x30],	%f10
	fors	%f31,	%f4,	%f28
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrdgz	%i4,	%f2,	%f26
	set	0x50, %g3
	lduwa	[%l7 + %g3] 0x89,	%i2
	bpos	%xcc,	loop_1384
	srax	%g2,	%o4,	%i0
	edge8	%g4,	%g7,	%l5
	fbu,a	%fcc0,	loop_1385
loop_1384:
	alignaddrl	%i1,	%o6,	%o2
	edge16l	%l1,	%o1,	%o7
	tneg	%icc,	0x1
loop_1385:
	tsubcctv	%g6,	0x01C8,	%l6
	fmuld8sux16	%f14,	%f24,	%f10
	set	0x0F, %i6
	lduba	[%l7 + %i6] 0x80,	%i3
	brnz	%i7,	loop_1386
	fabsd	%f10,	%f26
	tg	%xcc,	0x5
	ta	%icc,	0x7
loop_1386:
	array16	%g5,	%l4,	%g1
	tneg	%xcc,	0x5
	or	%l3,	0x01BC,	%o3
	ldsh	[%l7 + 0x3C],	%o5
	ta	%icc,	0x7
	andn	%l2,	0x0299,	%o0
	andncc	%g3,	%i6,	%i5
	tneg	%icc,	0x1
	edge8l	%i4,	%l0,	%i2
	edge32	%o4,	%i0,	%g4
	udivx	%g7,	0x0C22,	%g2
	fbo	%fcc1,	loop_1387
	tneg	%xcc,	0x0
	membar	0x7B
	tgu	%icc,	0x5
loop_1387:
	fmovrslez	%i1,	%f8,	%f21
	edge32ln	%l5,	%o2,	%o6
	stbar
	movcs	%icc,	%l1,	%o7
	fmovscs	%icc,	%f2,	%f29
	nop
	setx	0x8DC6181B,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f0
	setx	0xD3049D60,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f30
	fmuls	%f30,	%f0,	%f19
	fmovdne	%icc,	%f13,	%f23
	xnor	%o1,	%l6,	%i3
	nop
	fitos	%f12,	%f15
	fstox	%f15,	%f22
	fxtos	%f22,	%f23
	nop
	setx loop_1388, %l0, %l1
	jmpl %l1, %g6
	movl	%icc,	%g5,	%i7
	prefetch	[%l7 + 0x38],	 0x3
	bge,a	%icc,	loop_1389
loop_1388:
	srl	%g1,	%l3,	%l4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnor	%o3,	0x1DD8,	%o5
loop_1389:
	fmovrdne	%o0,	%f0,	%f18
	fmovdl	%icc,	%f8,	%f11
	movrgez	%l2,	%i6,	%i5
	fandnot2s	%f31,	%f27,	%f17
	array8	%g3,	%i4,	%l0
	fzeros	%f24
	bleu	loop_1390
	fbul,a	%fcc3,	loop_1391
	be,a,pn	%xcc,	loop_1392
	tleu	%xcc,	0x1
loop_1390:
	edge32	%o4,	%i0,	%g4
loop_1391:
	xor	%i2,	%g2,	%g7
loop_1392:
	fmuld8sux16	%f29,	%f18,	%f6
	edge32n	%l5,	%o2,	%i1
	fmovrdne	%o6,	%f28,	%f0
	fandnot2s	%f21,	%f3,	%f2
	bvs,pt	%xcc,	loop_1393
	movcs	%xcc,	%o7,	%o1
	xnorcc	%l6,	0x1188,	%i3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1393:
	sllx	%g6,	%l1,	%i7
	movl	%icc,	%g1,	%g5
	array16	%l3,	%o3,	%l4
	udiv	%o0,	0x1CCA,	%l2
	fmovsa	%xcc,	%f19,	%f13
	taddcc	%o5,	%i6,	%i5
	subcc	%g3,	0x0EE1,	%l0
	fzero	%f20
	fbu,a	%fcc0,	loop_1394
	fbule	%fcc3,	loop_1395
	taddcc	%i4,	%i0,	%o4
	mova	%icc,	%g4,	%g2
loop_1394:
	fmovrdgez	%i2,	%f2,	%f14
loop_1395:
	edge16	%l5,	%g7,	%o2
	edge32	%i1,	%o7,	%o1
	fmovde	%xcc,	%f17,	%f18
	fbo,a	%fcc2,	loop_1396
	smul	%o6,	%i3,	%g6
	edge16ln	%l6,	%i7,	%g1
	te	%xcc,	0x0
loop_1396:
	edge32l	%g5,	%l3,	%o3
	sllx	%l1,	0x1E,	%l4
	nop
	setx	0xD1ACB1BF70C40951,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0xC07EC243FC565E01,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	fdivd	%f14,	%f16,	%f22
	mulx	%l2,	0x0DB1,	%o0
	movcc	%icc,	%i6,	%o5
	sdivcc	%g3,	0x0103,	%i5
	fblg,a	%fcc3,	loop_1397
	tl	%xcc,	0x3
	ldub	[%l7 + 0x28],	%i4
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
loop_1397:
	addcc	%i0,	%o4,	%g4
	fmovrse	%g2,	%f19,	%f10
	edge32l	%l0,	%l5,	%i2
loop_1398:
	fmovrdgez	%o2,	%f26,	%f16
	ldsw	[%l7 + 0x54],	%g7
	set	0x31, %g5
	lduba	[%l7 + %g5] 0x88,	%i1
	edge8l	%o7,	%o1,	%o6
	sir	0x1223
	array32	%g6,	%l6,	%i7
	tvc	%icc,	0x3
	xnorcc	%g1,	%g5,	%i3
	wr	%g0,	0x04,	%asi
	ldsha	[%l7 + 0x28] %asi,	%o3
	te	%icc,	0x7
	movrgz	%l1,	0x102,	%l3
	brnz,a	%l2,	loop_1399
	movge	%icc,	%o0,	%i6
	nop
	fitos	%f11,	%f3
	fstox	%f3,	%f6
	fpadd16	%f2,	%f10,	%f18
loop_1399:
	faligndata	%f26,	%f24,	%f20
	movcc	%xcc,	%o5,	%l4
	tneg	%xcc,	0x0
	fpack32	%f10,	%f14,	%f16
	swap	[%l7 + 0x20],	%g3
	fxnors	%f21,	%f21,	%f10
	mulx	%i5,	0x019C,	%i4
	set	0x70, %i4
	ldda	[%l7 + %i4] 0x88,	%i0
	movrlz	%o4,	0x16F,	%g4
	movneg	%xcc,	%l0,	%g2
	bne,pn	%icc,	loop_1400
	taddcctv	%l5,	0x0857,	%o2
	tge	%icc,	0x7
	tpos	%icc,	0x7
loop_1400:
	bvs,a,pt	%xcc,	loop_1401
	edge8ln	%i2,	%i1,	%g7
	tg	%icc,	0x5
	smul	%o7,	0x0F3A,	%o1
loop_1401:
	movneg	%icc,	%g6,	%l6
	call	loop_1402
	fnand	%f14,	%f16,	%f4
	movpos	%icc,	%i7,	%g1
	movne	%xcc,	%g5,	%i3
loop_1402:
	nop
	setx	0xADD36D7F144F3DDC,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	fsqrtd	%f8,	%f26
	bleu,pn	%xcc,	loop_1403
	sir	0x1439
	tsubcctv	%o3,	%l1,	%l3
	movgu	%xcc,	%o6,	%l2
loop_1403:
	andncc	%i6,	%o0,	%o5
	addccc	%g3,	0x1CAA,	%l4
	sdivx	%i5,	0x174F,	%i4
	fpsub16s	%f21,	%f21,	%f29
	prefetch	[%l7 + 0x18],	 0x1
	add	%o4,	%i0,	%l0
	sub	%g2,	0x0628,	%g4
	srlx	%l5,	%o2,	%i1
	call	loop_1404
	subcc	%g7,	0x0E51,	%o7
	fsrc1	%f0,	%f2
	edge8	%i2,	%g6,	%o1
loop_1404:
	alignaddrl	%i7,	%g1,	%g5
	fmul8sux16	%f0,	%f8,	%f20
	nop
	fitos	%f10,	%f2
	fstod	%f2,	%f2
	tvc	%xcc,	0x5
	edge32ln	%i3,	%o3,	%l1
	smul	%l6,	%l3,	%o6
	fpadd16	%f10,	%f14,	%f18
	fpadd32s	%f3,	%f12,	%f20
	movrlez	%i6,	0x2AE,	%o0
	brgz	%l2,	loop_1405
	edge8n	%g3,	%o5,	%l4
	nop
	set	0x1C, %g1
	sth	%i4,	[%l7 + %g1]
	tle	%xcc,	0x5
loop_1405:
	movge	%xcc,	%i5,	%i0
	subc	%l0,	0x0F80,	%g2
	fcmple16	%f26,	%f26,	%o4
	fmovdne	%icc,	%f2,	%f11
	tne	%xcc,	0x7
	movne	%xcc,	%l5,	%g4
	array8	%i1,	%g7,	%o7
	fble,a	%fcc3,	loop_1406
	movrgez	%o2,	%i2,	%g6
	bleu,a	loop_1407
	fones	%f19
loop_1406:
	smulcc	%o1,	%i7,	%g1
	fbn	%fcc1,	loop_1408
loop_1407:
	ld	[%l7 + 0x58],	%f27
	fbu	%fcc3,	loop_1409
	fmovrsne	%g5,	%f7,	%f28
loop_1408:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbl	%fcc1,	loop_1410
loop_1409:
	fsrc2s	%f10,	%f29
	xnor	%i3,	0x108B,	%o3
	wr	%g0,	0x88,	%asi
	ldswa	[%l7 + 0x3C] %asi,	%l6
loop_1410:
	bleu,pt	%icc,	loop_1411
	nop
	set	0x60, %l1
	ldx	[%l7 + %l1],	%l1
	stbar
	movrgez	%l3,	%i6,	%o6
loop_1411:
	fmovrdgez	%l2,	%f2,	%f0
	smulcc	%g3,	0x0CFC,	%o0
	ldsb	[%l7 + 0x6F],	%l4
	subcc	%i4,	0x1E32,	%o5
	xnor	%i0,	0x1CBD,	%l0
	fcmpgt32	%f20,	%f22,	%g2
	xorcc	%i5,	0x1247,	%l5
	set	0x28, %i0
	swapa	[%l7 + %i0] 0x81,	%o4
	edge8	%i1,	%g7,	%g4
	sir	0x1B35
	set	0x30, %o0
	stwa	%o2,	[%l7 + %o0] 0x2a
	membar	#Sync
	xorcc	%o7,	0x0147,	%g6
	sdiv	%o1,	0x096E,	%i7
	srlx	%i2,	%g5,	%i3
	tn	%icc,	0x2
	fnot2s	%f15,	%f5
	std	%f28,	[%l7 + 0x30]
	std	%f24,	[%l7 + 0x60]
	array16	%o3,	%g1,	%l6
	xorcc	%l1,	0x0D9C,	%i6
	nop
	setx	0xB5C7120E919C5726,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0xEF92A84DF000D211,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	faddd	%f16,	%f14,	%f6
	umul	%l3,	0x1054,	%o6
	movleu	%xcc,	%g3,	%o0
	movl	%xcc,	%l4,	%l2
	xnorcc	%i4,	0x1BE9,	%i0
	orncc	%l0,	%g2,	%i5
	fmovdne	%xcc,	%f9,	%f16
	nop
	fitod	%f0,	%f18
	fdtox	%f18,	%f2
	fxtod	%f2,	%f20
	fcmpne16	%f10,	%f10,	%l5
	movrgez	%o4,	0x2C0,	%o5
	umulcc	%g7,	%g4,	%i1
	xorcc	%o2,	0x14AC,	%g6
	fcmpne16	%f16,	%f6,	%o7
	fandnot2s	%f7,	%f0,	%f4
	movleu	%icc,	%o1,	%i2
	fbo,a	%fcc3,	loop_1412
	move	%xcc,	%i7,	%g5
	fbge,a	%fcc2,	loop_1413
	fmovsge	%xcc,	%f10,	%f28
loop_1412:
	andcc	%o3,	0x1282,	%g1
	fmovdge	%icc,	%f20,	%f26
loop_1413:
	movrgz	%i3,	%l1,	%l6
	movn	%icc,	%l3,	%o6
	fandnot1s	%f4,	%f4,	%f20
	srl	%i6,	%o0,	%g3
	bpos	%icc,	loop_1414
	fzeros	%f25
	wr	%g0,	0x80,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
loop_1414:
	movle	%icc,	%l2,	%i4
	ldx	[%l7 + 0x60],	%l4
	tge	%icc,	0x2
	nop
	set	0x58, %g2
	ldx	[%l7 + %g2],	%l0
	array16	%i0,	%g2,	%l5
	ldstub	[%l7 + 0x38],	%i5
	fnot1	%f4,	%f26
	wr	%g0,	0x81,	%asi
	ldswa	[%l7 + 0x44] %asi,	%o5
	subc	%o4,	%g7,	%i1
	addcc	%o2,	%g6,	%o7
	fmovspos	%xcc,	%f31,	%f16
	fpack32	%f2,	%f28,	%f20
	ldsb	[%l7 + 0x22],	%o1
	sdivx	%g4,	0x0E68,	%i2
	tn	%xcc,	0x5
	set	0x5E, %l3
	ldstuba	[%l7 + %l3] 0x89,	%g5
	fpack32	%f26,	%f24,	%f14
	taddcctv	%i7,	%g1,	%o3
	fandnot2	%f10,	%f8,	%f24
	movne	%icc,	%l1,	%l6
	bvs	%icc,	loop_1415
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mulscc	%l3,	%i3,	%o6
	bvs	%xcc,	loop_1416
loop_1415:
	movl	%xcc,	%o0,	%i6
	bvc,a,pt	%icc,	loop_1417
	fbuge	%fcc1,	loop_1418
loop_1416:
	ldsb	[%l7 + 0x19],	%g3
	srlx	%l2,	%l4,	%i4
loop_1417:
	fmovdge	%icc,	%f22,	%f10
loop_1418:
	movvs	%icc,	%l0,	%i0
	movneg	%icc,	%g2,	%i5
	bne	loop_1419
	tsubcc	%l5,	%o5,	%o4
	bne,pt	%xcc,	loop_1420
	movrlz	%i1,	0x0C2,	%g7
loop_1419:
	movrlz	%o2,	0x0B6,	%g6
	std	%f28,	[%l7 + 0x30]
loop_1420:
	mova	%icc,	%o1,	%g4
	sll	%o7,	%g5,	%i2
	taddcc	%i7,	0x0185,	%g1
	fbuge	%fcc1,	loop_1421
	movrgez	%l1,	0x1AA,	%o3
	orncc	%l3,	0x0D11,	%l6
	tneg	%icc,	0x7
loop_1421:
	edge16l	%i3,	%o0,	%i6
	movle	%xcc,	%g3,	%o6
	fsrc2	%f16,	%f22
	edge32ln	%l4,	%i4,	%l2
	fpadd16	%f2,	%f30,	%f2
	tpos	%xcc,	0x2
	orcc	%l0,	%g2,	%i0
	set	0x08, %i7
	stha	%l5,	[%l7 + %i7] 0x22
	membar	#Sync
	edge32	%i5,	%o4,	%o5
	fmovd	%f18,	%f12
	edge16l	%g7,	%o2,	%g6
	movne	%xcc,	%o1,	%g4
	fnands	%f6,	%f25,	%f2
	fabss	%f20,	%f30
	brlez	%o7,	loop_1422
	tleu	%xcc,	0x0
	sub	%g5,	0x15F8,	%i1
	fcmpeq16	%f0,	%f20,	%i7
loop_1422:
	alignaddrl	%g1,	%l1,	%o3
	movn	%xcc,	%l3,	%i2
	srax	%i3,	0x0E,	%o0
	sdivx	%l6,	0x12D1,	%g3
	xorcc	%i6,	%o6,	%i4
	wr	%g0,	0xe2,	%asi
	stwa	%l2,	[%l7 + 0x38] %asi
	membar	#Sync
	andncc	%l0,	%g2,	%l4
	edge32n	%i0,	%i5,	%l5
	bcc,a,pn	%xcc,	loop_1423
	bcc,a	%xcc,	loop_1424
	srl	%o4,	%o5,	%g7
	bcs,a	loop_1425
loop_1423:
	lduh	[%l7 + 0x72],	%g6
loop_1424:
	tgu	%xcc,	0x4
	umulcc	%o2,	%g4,	%o7
loop_1425:
	fmovrslz	%o1,	%f20,	%f7
	add	%i1,	0x16AE,	%g5
	umul	%i7,	%g1,	%o3
	tl	%xcc,	0x1
	movg	%xcc,	%l1,	%i2
	fand	%f18,	%f20,	%f18
	movle	%icc,	%l3,	%o0
	fpsub32s	%f2,	%f19,	%f1
	or	%i3,	0x0D12,	%g3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tle	%xcc,	0x0
	orncc	%i6,	%o6,	%l6
	subccc	%l2,	%i4,	%l0
	edge16	%g2,	%i0,	%l4
	wr	%g0,	0x17,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
	movle	%xcc,	%l5,	%o4
	faligndata	%f30,	%f20,	%f12
	sub	%o5,	0x142C,	%i5
	andn	%g7,	%g6,	%g4
	fbg	%fcc1,	loop_1426
	edge16n	%o2,	%o7,	%i1
	udiv	%g5,	0x1E5E,	%i7
	bneg	loop_1427
loop_1426:
	tvs	%xcc,	0x2
	bpos,a	%icc,	loop_1428
	srax	%g1,	%o1,	%o3
loop_1427:
	tg	%xcc,	0x5
	bcc,a	loop_1429
loop_1428:
	fxor	%f10,	%f4,	%f0
	popc	%l1,	%i2
	srax	%l3,	0x1A,	%i3
loop_1429:
	fbge,a	%fcc1,	loop_1430
	xor	%o0,	0x0CDB,	%g3
	sethi	0x041D,	%i6
	bneg	loop_1431
loop_1430:
	fnor	%f10,	%f4,	%f4
	edge16ln	%o6,	%l6,	%i4
	fpackfix	%f4,	%f10
loop_1431:
	array16	%l2,	%l0,	%g2
	fzeros	%f12
	fba	%fcc3,	loop_1432
	fmovsneg	%xcc,	%f6,	%f5
	fpadd32	%f30,	%f14,	%f2
	edge8l	%l4,	%i0,	%l5
loop_1432:
	movpos	%xcc,	%o5,	%i5
	fxor	%f16,	%f2,	%f8
	movle	%xcc,	%o4,	%g7
	orn	%g6,	0x0357,	%g4
	array32	%o7,	%i1,	%o2
	fnot1	%f26,	%f2
	movn	%xcc,	%i7,	%g5
	fsrc2	%f24,	%f0
	xnor	%o1,	0x07B5,	%g1
	fmovrde	%o3,	%f8,	%f0
	array32	%i2,	%l3,	%l1
	wr	%g0,	0x88,	%asi
	ldxa	[%l7 + 0x40] %asi,	%i3
	set	0x5C, %o7
	lduba	[%l7 + %o7] 0x15,	%g3
	fpsub16s	%f2,	%f20,	%f26
	sdivcc	%i6,	0x0973,	%o6
	set	0x40, %l5
	stda	%f16,	[%l7 + %l5] 0x18
	stx	%l6,	[%l7 + 0x40]
	fpadd16s	%f11,	%f24,	%f8
	edge32l	%o0,	%i4,	%l2
	tsubcctv	%g2,	%l0,	%i0
	call	loop_1433
	array32	%l5,	%l4,	%i5
	fmovsleu	%icc,	%f21,	%f26
	fmovdpos	%icc,	%f10,	%f12
loop_1433:
	bvs	%xcc,	loop_1434
	stb	%o4,	[%l7 + 0x49]
	fpack16	%f20,	%f0
	bleu,pn	%xcc,	loop_1435
loop_1434:
	fmovd	%f16,	%f20
	smulcc	%g7,	%g6,	%o5
	tn	%icc,	0x5
loop_1435:
	edge32l	%g4,	%i1,	%o2
	mova	%xcc,	%i7,	%o7
	wr	%g0,	0x2f,	%asi
	stba	%g5,	[%l7 + 0x1B] %asi
	membar	#Sync
	add	%o1,	%g1,	%o3
	tsubcc	%l3,	%i2,	%l1
	wr	%g0,	0x2a,	%asi
	stxa	%i3,	[%l7 + 0x28] %asi
	membar	#Sync
	fpsub32	%f16,	%f18,	%f12
	movleu	%xcc,	%i6,	%g3
	movl	%icc,	%o6,	%l6
	alignaddrl	%o0,	%i4,	%l2
	xnor	%g2,	%l0,	%l5
	bg,a,pn	%icc,	loop_1436
	tcc	%icc,	0x4
	stbar
	nop
	set	0x40, %l2
	ldd	[%l7 + %l2],	%i0
loop_1436:
	fmovscc	%xcc,	%f13,	%f17
	ldsw	[%l7 + 0x2C],	%l4
	fbug,a	%fcc2,	loop_1437
	tleu	%xcc,	0x4
	fmul8ulx16	%f10,	%f4,	%f24
	bne,a,pn	%icc,	loop_1438
loop_1437:
	tn	%xcc,	0x3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrslz	%o4,	%f7,	%f29
loop_1438:
	tn	%icc,	0x4
	bneg,a,pn	%icc,	loop_1439
	movleu	%xcc,	%i5,	%g6
	bleu,pt	%xcc,	loop_1440
	umulcc	%g7,	%o5,	%i1
loop_1439:
	ba	loop_1441
	fbug	%fcc3,	loop_1442
loop_1440:
	tpos	%icc,	0x5
	fbuge	%fcc3,	loop_1443
loop_1441:
	fbo,a	%fcc1,	loop_1444
loop_1442:
	sll	%o2,	%i7,	%o7
	fbne,a	%fcc3,	loop_1445
loop_1443:
	tge	%xcc,	0x2
loop_1444:
	movle	%xcc,	%g4,	%g5
	mova	%icc,	%o1,	%o3
loop_1445:
	tg	%icc,	0x7
	edge8	%l3,	%i2,	%l1
	ble,a	%icc,	loop_1446
	fbl	%fcc1,	loop_1447
	movne	%xcc,	%g1,	%i6
	popc	0x1702,	%g3
loop_1446:
	nop
	setx	0x55B8A01765BE959F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0xA5481FEB1F1D5D78,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	fmuld	%f10,	%f6,	%f4
loop_1447:
	sdiv	%i3,	0x1B23,	%l6
	movre	%o0,	%o6,	%i4
	fnot1s	%f2,	%f11
	xor	%g2,	0x1637,	%l2
	sdivcc	%l5,	0x0CD3,	%l0
	fbl,a	%fcc0,	loop_1448
	membar	0x2B
	nop
	fitos	%f14,	%f2
	fstoi	%f2,	%f13
	movvc	%icc,	%l4,	%i0
loop_1448:
	xorcc	%i5,	%g6,	%o4
	tcs	%xcc,	0x1
	movneg	%xcc,	%o5,	%g7
	nop
	setx	0x205143C6,	%l0,	%l6
	st	%l6,	[%l7 + 0x20]
	ld	[%l7 + 0x20],	%fsr
	ble,a	loop_1449
	bcc,a	%icc,	loop_1450
	brz,a	%o2,	loop_1451
	tsubcctv	%i1,	%i7,	%o7
loop_1449:
	ble,a,pt	%xcc,	loop_1452
loop_1450:
	membar	0x0F
loop_1451:
	udivx	%g5,	0x1CB6,	%g4
	fbg,a	%fcc0,	loop_1453
loop_1452:
	fandnot2s	%f29,	%f23,	%f26
	nop
	setx	0x6596138AE4879BB9,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0xBB3538E8978A81EF,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	faddd	%f24,	%f8,	%f24
	movrlez	%o3,	0x2DA,	%o1
loop_1453:
	sth	%l3,	[%l7 + 0x74]
	tcc	%xcc,	0x5
	fbue,a	%fcc1,	loop_1454
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	setx	0x907A13D9,	%l0,	%l6
	st	%l6,	[%l7 + 0x3C]
	ld	[%l7 + 0x3C],	%fsr
	fmovscc	%xcc,	%f18,	%f5
loop_1454:
	ldstub	[%l7 + 0x42],	%i2
	fabss	%f17,	%f14
	fmovd	%f4,	%f22
	fbl,a	%fcc2,	loop_1455
	brgez,a	%g1,	loop_1456
	sllx	%l1,	%i6,	%i3
	fmovdcc	%xcc,	%f6,	%f14
loop_1455:
	movcc	%xcc,	%l6,	%o0
loop_1456:
	nop
	set	0x75, %o2
	ldstuba	[%l7 + %o2] 0x04,	%o6
	nop
	fitos	%f4,	%f18
	fmovrdlez	%g3,	%f4,	%f16
	add	%l7,	0x48,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%i4
	casxa	[%l6] %asi,	%i4,	%g2
	ldd	[%l7 + 0x38],	%f0
	fnot2	%f0,	%f14
	srl	%l2,	%l0,	%l4
	tne	%xcc,	0x5
	fbo,a	%fcc0,	loop_1457
	fmul8sux16	%f24,	%f12,	%f6
	set	0x1E, %o3
	stba	%i0,	[%l7 + %o3] 0x14
loop_1457:
	subccc	%l5,	%g6,	%o4
	fpsub16s	%f7,	%f28,	%f12
	call	loop_1458
	movgu	%xcc,	%o5,	%g7
	fxor	%f26,	%f14,	%f22
	fmovscs	%icc,	%f29,	%f20
loop_1458:
	movneg	%xcc,	%o2,	%i5
	edge8l	%i7,	%i1,	%g5
	taddcctv	%o7,	0x02A7,	%g4
	movle	%icc,	%o1,	%o3
	fbge	%fcc3,	loop_1459
	movre	%i2,	%l3,	%l1
	xnor	%g1,	%i6,	%l6
	sdiv	%i3,	0x1CB5,	%o6
loop_1459:
	mulx	%o0,	0x1AD5,	%g3
	bg,pn	%xcc,	loop_1460
	movn	%xcc,	%i4,	%g2
	sllx	%l2,	0x0A,	%l0
	fmovscs	%icc,	%f11,	%f1
loop_1460:
	nop
	set	0x60, %i1
	ldd	[%l7 + %i1],	%f2
	edge32l	%i0,	%l5,	%g6
	movle	%icc,	%l4,	%o5
	tle	%xcc,	0x2
	sub	%o4,	%g7,	%o2
	smul	%i7,	%i1,	%g5
	nop
	setx	0x47056851572AA473,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0x76D4E142A4D36E89,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	fmuld	%f12,	%f22,	%f8
	movg	%icc,	%o7,	%g4
	set	0x40, %i3
	ldda	[%l7 + %i3] 0x15,	%o0
	srlx	%i5,	%o3,	%l3
	set	0x0C, %g7
	swapa	[%l7 + %g7] 0x04,	%i2
	sllx	%g1,	0x16,	%i6
	set	0x14, %i2
	swapa	[%l7 + %i2] 0x18,	%l1
	add	%l7,	0x58,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%i3
	casxa	[%l6] 0x88,	%i3,	%l6
	st	%f6,	[%l7 + 0x50]
	movle	%xcc,	%o6,	%g3
	fzeros	%f29
	movrgz	%o0,	%i4,	%l2
	fmovrdlez	%l0,	%f24,	%f8
	movleu	%xcc,	%i0,	%l5
	alignaddrl	%g2,	%l4,	%g6
	nop
	setx	loop_1461,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	edge16n	%o4,	%g7,	%o5
	addcc	%i7,	%i1,	%g5
	fmovrsgez	%o7,	%f26,	%f4
loop_1461:
	tcc	%xcc,	0x6
	fbne	%fcc0,	loop_1462
	addcc	%g4,	%o2,	%i5
	movgu	%icc,	%o1,	%l3
	bshuffle	%f8,	%f14,	%f24
loop_1462:
	tge	%xcc,	0x1
	xor	%i2,	0x007E,	%g1
	set	0x40, %l6
	ldda	[%l7 + %l6] 0x11,	%f0
	edge16n	%o3,	%i6,	%l1
	fmul8x16au	%f13,	%f22,	%f26
	movg	%icc,	%i3,	%l6
	udivcc	%g3,	0x0980,	%o6
	popc	0x11ED,	%i4
	fmul8x16	%f22,	%f8,	%f6
	fzero	%f18
	faligndata	%f14,	%f0,	%f18
	add	%l2,	%l0,	%i0
	subccc	%l5,	%g2,	%o0
	wr	%g0,	0x10,	%asi
	lda	[%l7 + 0x1C] %asi,	%f16
	udivcc	%g6,	0x1EC2,	%o4
	nop
	fitos	%f1,	%f25
	fstox	%f25,	%f4
	fxtos	%f4,	%f11
	movle	%icc,	%g7,	%l4
	fnot2	%f18,	%f6
	membar	0x3C
	set	0x22, %l4
	stha	%o5,	[%l7 + %l4] 0x19
	sra	%i1,	%i7,	%g5
	movrlez	%o7,	%g4,	%i5
	set	0x10, %o6
	sta	%f17,	[%l7 + %o6] 0x04
	ld	[%l7 + 0x6C],	%f16
	sethi	0x157D,	%o2
	fble	%fcc2,	loop_1463
	subcc	%o1,	0x1C3D,	%i2
	wr	%g0,	0x11,	%asi
	lduba	[%l7 + 0x15] %asi,	%l3
loop_1463:
	movvc	%icc,	%o3,	%i6
	add	%l7,	0x68,	%l6
	wr	%g0,	0x04,	%asi
	ldxa	[%l6] %asi,	%l1
	casxa	[%l6] 0x04,	%l1,	%i3
	fmovdneg	%xcc,	%f24,	%f26
	stw	%l6,	[%l7 + 0x08]
	umul	%g3,	0x1274,	%g1
	bg	%icc,	loop_1464
	add	%i4,	%o6,	%l0
	fblg	%fcc2,	loop_1465
	movne	%xcc,	%i0,	%l2
loop_1464:
	andcc	%l5,	0x0120,	%o0
	tleu	%xcc,	0x4
loop_1465:
	umul	%g2,	%o4,	%g6
	movcs	%icc,	%g7,	%o5
	fornot2	%f6,	%f20,	%f30
	movn	%xcc,	%i1,	%i7
	set	0x30, %l0
	ldxa	[%g0 + %l0] 0x50,	%g5
	fmovdvs	%xcc,	%f24,	%f0
	st	%f5,	[%l7 + 0x24]
	fmul8ulx16	%f2,	%f20,	%f14
	fmovsvs	%icc,	%f15,	%f0
	movn	%icc,	%o7,	%l4
	ldstub	[%l7 + 0x7F],	%i5
	mulx	%g4,	0x0252,	%o2
	wr	%g0,	0x10,	%asi
	sta	%f8,	[%l7 + 0x40] %asi
	edge32l	%i2,	%o1,	%o3
	movrlz	%l3,	0x03B,	%l1
	edge32l	%i3,	%l6,	%g3
	ld	[%l7 + 0x20],	%f9
	fpadd16	%f28,	%f6,	%f8
	udivcc	%i6,	0x0CCE,	%g1
	tcs	%xcc,	0x6
	fble,a	%fcc1,	loop_1466
	andn	%o6,	%i4,	%l0
	movne	%icc,	%i0,	%l5
	fbe	%fcc3,	loop_1467
loop_1466:
	edge16l	%o0,	%g2,	%o4
	array8	%l2,	%g7,	%g6
	be	%icc,	loop_1468
loop_1467:
	swap	[%l7 + 0x14],	%i1
	fors	%f30,	%f17,	%f10
	fbge,a	%fcc2,	loop_1469
loop_1468:
	ldsb	[%l7 + 0x08],	%i7
	tneg	%xcc,	0x6
	std	%f18,	[%l7 + 0x50]
loop_1469:
	tvs	%xcc,	0x6
	xor	%o5,	0x1301,	%o7
	wr	%g0,	0x89,	%asi
	lduba	[%l7 + 0x0A] %asi,	%l4
	sdiv	%i5,	0x1F75,	%g5
	bvs,pt	%xcc,	loop_1470
	fands	%f28,	%f24,	%f2
	edge32ln	%g4,	%i2,	%o2
	prefetch	[%l7 + 0x28],	 0x2
loop_1470:
	fba,a	%fcc1,	loop_1471
	movn	%icc,	%o3,	%o1
	movre	%l1,	0x095,	%l3
	ldd	[%l7 + 0x68],	%i6
loop_1471:
	bge,a,pt	%icc,	loop_1472
	fmul8sux16	%f4,	%f26,	%f24
	array8	%g3,	%i3,	%g1
	edge32n	%i6,	%i4,	%l0
loop_1472:
	stbar
	stw	%o6,	[%l7 + 0x48]
	fpsub32s	%f24,	%f29,	%f7
	popc	%i0,	%l5
	fmovdl	%icc,	%f12,	%f8
	add	%o0,	%o4,	%g2
	nop
	setx	0x4FC59B1D,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f18
	setx	0x956CFA0F,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f17
	fmuls	%f17,	%f18,	%f25
	andncc	%l2,	%g7,	%g6
	fbug,a	%fcc1,	loop_1473
	nop
	fitod	%f8,	%f20
	fdtoi	%f20,	%f20
	sll	%i7,	0x1C,	%o5
	set	0x1C, %g4
	lduwa	[%l7 + %g4] 0x14,	%i1
loop_1473:
	nop
	fitos	%f3,	%f7
	fstox	%f7,	%f10
	fxtos	%f10,	%f16
	lduh	[%l7 + 0x50],	%o7
	taddcc	%l4,	0x028B,	%g5
	fxors	%f30,	%f26,	%f22
	bvs,pt	%icc,	loop_1474
	brgez	%g4,	loop_1475
	orncc	%i2,	%i5,	%o3
	movcs	%xcc,	%o1,	%l1
loop_1474:
	movl	%icc,	%l3,	%o2
loop_1475:
	nop
	set	0x7E, %o4
	lduha	[%l7 + %o4] 0x18,	%l6
	tgu	%icc,	0x1
	andncc	%i3,	%g3,	%g1
	edge32ln	%i6,	%l0,	%i4
	bn,pt	%icc,	loop_1476
	fmovsgu	%xcc,	%f8,	%f17
	lduw	[%l7 + 0x08],	%i0
	fmovdgu	%xcc,	%f5,	%f2
loop_1476:
	movl	%xcc,	%l5,	%o0
	ldstub	[%l7 + 0x20],	%o4
	srax	%o6,	0x01,	%l2
	fbge,a	%fcc1,	loop_1477
	movgu	%icc,	%g7,	%g2
	set	0x40, %o1
	ldda	[%l7 + %o1] 0x89,	%f16
loop_1477:
	movge	%icc,	%g6,	%i7
	add	%l7,	0x68,	%l6
	wr	%g0,	0x0c,	%asi
	casa	[%l6] %asi,	%o5,	%i1
	bn,pt	%xcc,	loop_1478
	subccc	%o7,	0x1E68,	%l4
	sdivx	%g4,	0x0E43,	%g5
	sethi	0x0CB0,	%i2
loop_1478:
	bne,pt	%icc,	loop_1479
	movcs	%icc,	%i5,	%o3
	nop
	setx	0x304477CC,	%l0,	%l6
	st	%l6,	[%l7 + 0x68]
	ld	[%l7 + 0x68],	%fsr
	tgu	%xcc,	0x1
loop_1479:
	mulx	%o1,	0x0A3C,	%l1
	tsubcc	%l3,	%o2,	%l6
	movle	%xcc,	%g3,	%i3
	subcc	%i6,	0x0034,	%g1
	srlx	%l0,	0x18,	%i0
	udiv	%i4,	0x1B03,	%l5
	fcmpeq16	%f2,	%f14,	%o4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addccc	%o6,	0x07FC,	%l2
	set	0x17, %i5
	lduba	[%l7 + %i5] 0x81,	%g7
	xnor	%o0,	0x09BF,	%g2
	sethi	0x1863,	%g6
	fcmpeq32	%f26,	%f22,	%o5
	tvs	%xcc,	0x2
	wr	%g0,	0x04,	%asi
	ldsba	[%l7 + 0x19] %asi,	%i1
	tneg	%icc,	0x2
	tge	%icc,	0x3
	nop
	fitos	%f2,	%f0
	fstod	%f0,	%f26
	bvc,pn	%icc,	loop_1480
	or	%i7,	%l4,	%o7
	addccc	%g5,	0x00EE,	%i2
	movvs	%xcc,	%i5,	%o3
loop_1480:
	fxnors	%f22,	%f17,	%f14
	mova	%icc,	%g4,	%l1
	umul	%o1,	0x02D7,	%l3
	tsubcc	%l6,	0x120C,	%o2
	fbule	%fcc0,	loop_1481
	orcc	%i3,	0x0B40,	%g3
	tcc	%icc,	0x0
	brgz	%g1,	loop_1482
loop_1481:
	tg	%icc,	0x7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbul	%fcc1,	loop_1483
loop_1482:
	xor	%i6,	0x0AFD,	%l0
	wr	%g0,	0x88,	%asi
	lduba	[%l7 + 0x78] %asi,	%i4
loop_1483:
	fmovrdlz	%l5,	%f30,	%f30
	sra	%o4,	%i0,	%l2
	movvc	%xcc,	%g7,	%o0
	fones	%f22
	movge	%xcc,	%g2,	%o6
	xorcc	%g6,	%i1,	%i7
	udivx	%l4,	0x07AC,	%o7
	movn	%xcc,	%o5,	%g5
	fbue	%fcc0,	loop_1484
	alignaddrl	%i5,	%i2,	%g4
	nop
	fitos	%f8,	%f17
	fstox	%f17,	%f6
	fxtos	%f6,	%f9
	movrgz	%l1,	0x397,	%o1
loop_1484:
	nop
	add	%l7,	0x44,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%o3
	casa	[%l6] 0x88,	%o3,	%l6
	bgu,a,pt	%xcc,	loop_1485
	edge16	%o2,	%l3,	%i3
	umul	%g1,	%i6,	%l0
	nop
	fitos	%f0,	%f25
	fstox	%f25,	%f28
loop_1485:
	xnorcc	%i4,	%l5,	%g3
	smulcc	%i0,	%o4,	%l2
	st	%f16,	[%l7 + 0x54]
	edge32ln	%g7,	%o0,	%o6
	lduh	[%l7 + 0x54],	%g2
	umul	%g6,	%i1,	%i7
	tsubcctv	%l4,	0x0BDA,	%o5
	fnor	%f18,	%f20,	%f30
	umul	%g5,	%i5,	%o7
	xor	%i2,	0x0D4F,	%l1
	fmovrslz	%g4,	%f4,	%f21
	fbo,a	%fcc0,	loop_1486
	edge32l	%o3,	%l6,	%o1
	fcmpgt32	%f8,	%f30,	%o2
	sub	%l3,	0x04E7,	%i3
loop_1486:
	bge,pt	%icc,	loop_1487
	movrne	%g1,	%i6,	%i4
	tleu	%xcc,	0x0
	nop
	setx	0x48E70A99,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f15
	setx	0x7C3E6643,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f1
	fmuls	%f1,	%f15,	%f27
loop_1487:
	ldd	[%l7 + 0x30],	%l4
	sub	%l0,	0x0EBC,	%g3
	movre	%i0,	%o4,	%g7
	alignaddrl	%l2,	%o0,	%g2
	fmovrdne	%g6,	%f2,	%f14
	subcc	%o6,	%i1,	%i7
	edge32l	%l4,	%g5,	%i5
	mova	%xcc,	%o7,	%i2
	nop
	setx	0x0C517F010C78AE11,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	fsqrtd	%f18,	%f14
	ldsw	[%l7 + 0x20],	%l1
	wr	%g0,	0x88,	%asi
	prefetcha	[%l7 + 0x28] %asi,	 0x1
	bgu,a,pt	%icc,	loop_1488
	movre	%g4,	%o3,	%l6
	fsrc1	%f24,	%f28
	movcc	%icc,	%o2,	%o1
loop_1488:
	fmovsvs	%xcc,	%f10,	%f10
	tpos	%icc,	0x2
	edge16	%l3,	%i3,	%i6
	nop
	setx	0x71564AF7D052BB4F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x58]
	ldx	[%l7 + 0x58],	%fsr
	fba,a	%fcc0,	loop_1489
	sth	%i4,	[%l7 + 0x22]
	xorcc	%g1,	%l0,	%l5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1489:
	ldsb	[%l7 + 0x4E],	%i0
	edge16n	%o4,	%g7,	%g3
	fnot2s	%f19,	%f27
	fmovsgu	%xcc,	%f23,	%f29
	ldx	[%l7 + 0x58],	%o0
	fbuge	%fcc1,	loop_1490
	fmovrdlz	%l2,	%f24,	%f26
	umulcc	%g2,	%o6,	%i1
	membar	0x1B
loop_1490:
	alignaddr	%i7,	%l4,	%g5
	nop
	setx	loop_1491,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tneg	%icc,	0x5
	fpack16	%f30,	%f23
	nop
	setx	0xD47F12A4,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f9
	setx	0xB884522F,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f5
	fadds	%f5,	%f9,	%f19
loop_1491:
	fors	%f5,	%f1,	%f17
	be,a,pt	%icc,	loop_1492
	fmovde	%xcc,	%f14,	%f7
	orncc	%i5,	%o7,	%i2
	edge16ln	%g6,	%l1,	%o5
loop_1492:
	or	%o3,	%l6,	%o2
	wr	%g0,	0x0c,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	0x7C
	tl	%xcc,	0x6
	std	%f22,	[%l7 + 0x70]
	movleu	%xcc,	%o1,	%g4
	taddcctv	%l3,	%i3,	%i4
	movvs	%icc,	%g1,	%l0
	fnot1s	%f0,	%f30
	movpos	%xcc,	%l5,	%i6
	tvs	%icc,	0x2
	fcmpgt16	%f4,	%f30,	%i0
	fmovda	%xcc,	%f3,	%f0
	fmovsne	%xcc,	%f31,	%f29
	edge8ln	%o4,	%g3,	%g7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orn	%o0,	%g2,	%o6
	ble,a	%xcc,	loop_1493
	fbl	%fcc2,	loop_1494
	fornot2s	%f5,	%f26,	%f15
	wr	%g0,	0x18,	%asi
	sta	%f13,	[%l7 + 0x58] %asi
loop_1493:
	fmovrdne	%i1,	%f10,	%f30
loop_1494:
	sdivx	%l2,	0x0125,	%l4
	bleu,a,pt	%icc,	loop_1495
	srax	%g5,	0x1F,	%i7
	edge32n	%i5,	%i2,	%g6
	fpsub16s	%f19,	%f2,	%f23
loop_1495:
	brz,a	%o7,	loop_1496
	fmovdle	%icc,	%f20,	%f1
	prefetch	[%l7 + 0x50],	 0x2
	stx	%l1,	[%l7 + 0x78]
loop_1496:
	tn	%xcc,	0x2
	movleu	%xcc,	%o3,	%o5
	fpadd32s	%f0,	%f13,	%f24
	movle	%icc,	%o2,	%o1
	tvs	%xcc,	0x1
	ldd	[%l7 + 0x10],	%i6
	brz,a	%l3,	loop_1497
	add	%i3,	0x0BC1,	%g4
	xorcc	%i4,	0x034D,	%l0
	sra	%l5,	0x1C,	%g1
loop_1497:
	nop
	setx	loop_1498,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fmovsl	%icc,	%f0,	%f26
	addc	%i0,	0x1361,	%i6
	nop
	setx	0x304E1666,	%l0,	%l6
	st	%l6,	[%l7 + 0x2C]
	ld	[%l7 + 0x2C],	%fsr
loop_1498:
	umul	%o4,	%g7,	%g3
	fpsub16s	%f20,	%f10,	%f16
	movleu	%icc,	%o0,	%o6
	edge8l	%g2,	%i1,	%l2
	fornot2s	%f18,	%f24,	%f22
	umulcc	%g5,	%l4,	%i7
	stw	%i2,	[%l7 + 0x3C]
	tcc	%xcc,	0x2
	fmovsneg	%icc,	%f21,	%f9
	or	%g6,	0x1957,	%o7
	edge8n	%l1,	%o3,	%o5
	edge8l	%o2,	%o1,	%l6
	ldsb	[%l7 + 0x63],	%l3
	nop
	fitod	%f8,	%f22
	fdtox	%f22,	%f20
	nop
	fitos	%f3,	%f17
	fstoi	%f17,	%f7
	lduh	[%l7 + 0x14],	%i5
	andcc	%i3,	%i4,	%l0
	tpos	%xcc,	0x3
	fmovsa	%icc,	%f20,	%f7
	fblg,a	%fcc0,	loop_1499
	tcs	%icc,	0x0
	nop
	fitos	%f5,	%f0
	fstod	%f0,	%f2
	bneg	%icc,	loop_1500
loop_1499:
	movge	%icc,	%g4,	%g1
	edge8l	%i0,	%l5,	%o4
	andcc	%g7,	%g3,	%i6
loop_1500:
	fnors	%f21,	%f8,	%f26
	stbar
	fxors	%f4,	%f15,	%f29
	fbne,a	%fcc2,	loop_1501
	fones	%f9
	set	0x5E, %g6
	lduba	[%l7 + %g6] 0x19,	%o0
loop_1501:
	sethi	0x04C9,	%g2
	ba,pn	%icc,	loop_1502
	udivcc	%i1,	0x0277,	%l2
	andn	%o6,	0x09A5,	%g5
	nop
	set	0x30, %o5
	stx	%l4,	[%l7 + %o5]
loop_1502:
	movge	%xcc,	%i7,	%i2
	fbl	%fcc1,	loop_1503
	movcc	%xcc,	%g6,	%o7
	brgez,a	%l1,	loop_1504
	movge	%xcc,	%o3,	%o2
loop_1503:
	fbg	%fcc0,	loop_1505
	subccc	%o1,	%o5,	%l3
loop_1504:
	brgez	%l6,	loop_1506
	xor	%i3,	0x1245,	%i5
loop_1505:
	brlez,a	%l0,	loop_1507
	ldsw	[%l7 + 0x14],	%i4
loop_1506:
	fxnor	%f4,	%f14,	%f14
	tpos	%xcc,	0x2
loop_1507:
	xnorcc	%g4,	%g1,	%l5
	fmovscs	%xcc,	%f7,	%f16
	movvc	%xcc,	%i0,	%g7
	sra	%g3,	%i6,	%o4
	smulcc	%g2,	0x0F9D,	%o0
	xor	%i1,	0x0D55,	%l2
	ld	[%l7 + 0x5C],	%f23
	tneg	%icc,	0x3
	alignaddr	%g5,	%l4,	%i7
	andncc	%i2,	%g6,	%o6
	wr	%g0,	0x10,	%asi
	prefetcha	[%l7 + 0x40] %asi,	 0x2
	movvs	%icc,	%l1,	%o2
	sdivcc	%o3,	0x0720,	%o5
	nop
	setx	0x4B7F69FA,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f26
	fsqrts	%f26,	%f7
	tpos	%icc,	0x4
	set	0x28, %i6
	ldsba	[%l7 + %i6] 0x04,	%l3
	sll	%o1,	0x06,	%i3
	fmovsg	%xcc,	%f6,	%f10
	sethi	0x0A1B,	%l6
	bleu,a	%icc,	loop_1508
	movge	%xcc,	%i5,	%l0
	sethi	0x1BAA,	%g4
	array8	%g1,	%i4,	%i0
loop_1508:
	brnz	%l5,	loop_1509
	fmovdne	%icc,	%f30,	%f25
	nop
	setx	loop_1510,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	for	%f22,	%f0,	%f4
loop_1509:
	tn	%xcc,	0x5
	fmovd	%f14,	%f28
loop_1510:
	mova	%xcc,	%g3,	%i6
	wr	%g0,	0x24,	%asi
	ldda	[%l7 + 0x10] %asi,	%g6
	fxnor	%f6,	%f4,	%f22
	set	0x50, %g3
	sta	%f11,	[%l7 + %g3] 0x18
	tsubcctv	%o4,	%g2,	%i1
	sub	%l2,	0x1F52,	%g5
	flush	%l7 + 0x68
	edge32n	%l4,	%o0,	%i2
	and	%i7,	0x00DC,	%g6
	nop
	fitos	%f12,	%f10
	fstod	%f10,	%f6
	tg	%xcc,	0x1
	flush	%l7 + 0x3C
	array16	%o7,	%l1,	%o2
	array8	%o6,	%o3,	%o5
	andn	%o1,	0x105C,	%l3
	fxor	%f18,	%f4,	%f12
	bge,pn	%xcc,	loop_1511
	tne	%xcc,	0x4
	sub	%i3,	0x03BD,	%l6
	movle	%icc,	%l0,	%g4
loop_1511:
	andn	%i5,	%i4,	%i0
	add	%g1,	%g3,	%i6
	fbo,a	%fcc3,	loop_1512
	edge8ln	%l5,	%o4,	%g7
	mulscc	%g2,	0x151A,	%i1
	taddcctv	%g5,	%l2,	%l4
loop_1512:
	orncc	%o0,	0x113C,	%i7
	subccc	%i2,	0x13C0,	%o7
	fmovrdlz	%l1,	%f18,	%f8
	tsubcc	%o2,	%o6,	%g6
	xorcc	%o5,	0x194F,	%o1
	bgu,pt	%icc,	loop_1513
	nop
	setx	0x7226A380E04D67EA,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldx	[%l7 + 0x28],	%fsr
	ba,a	loop_1514
	fpadd32	%f8,	%f16,	%f0
loop_1513:
	bge,a	loop_1515
	fmovrsgez	%l3,	%f16,	%f24
loop_1514:
	subcc	%i3,	%l6,	%l0
	nop
	setx	loop_1516,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_1515:
	fbl	%fcc1,	loop_1517
	and	%g4,	0x0D2D,	%i5
	set	0x40, %i4
	stda	%f16,	[%l7 + %i4] 0x11
loop_1516:
	sdiv	%i4,	0x12ED,	%i0
loop_1517:
	te	%icc,	0x1
	tn	%xcc,	0x0
	tg	%xcc,	0x0
	stbar
	nop
	setx	0xA674FCF45CA0C618,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	fsqrtd	%f0,	%f4
	srlx	%o3,	0x16,	%g3
	call	loop_1518
	array8	%i6,	%l5,	%g1
	te	%xcc,	0x4
	fba,a	%fcc2,	loop_1519
loop_1518:
	movn	%xcc,	%o4,	%g2
	movcc	%icc,	%g7,	%i1
	wr	%g0,	0xeb,	%asi
	stwa	%l2,	[%l7 + 0x58] %asi
	membar	#Sync
loop_1519:
	nop
	wr	%g0,	0xf1,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
	lduh	[%l7 + 0x34],	%l4
	tvc	%xcc,	0x5
	bn	loop_1520
	udivcc	%o0,	0x0E4F,	%g5
	fnegd	%f28,	%f10
	fpadd16	%f30,	%f10,	%f14
loop_1520:
	edge16n	%i2,	%o7,	%i7
	bneg	%icc,	loop_1521
	edge32n	%o2,	%l1,	%o6
	wr	%g0,	0x89,	%asi
	lduha	[%l7 + 0x24] %asi,	%o5
loop_1521:
	fba,a	%fcc1,	loop_1522
	edge8ln	%g6,	%l3,	%i3
	tvs	%icc,	0x3
	sdivx	%o1,	0x1A63,	%l0
loop_1522:
	alignaddrl	%g4,	%i5,	%l6
	fmovs	%f4,	%f6
	movl	%xcc,	%i0,	%o3
	fmuld8ulx16	%f30,	%f13,	%f14
	nop
	setx	0xF1D538AA,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f24
	setx	0xE07E1CD2,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f5
	fadds	%f5,	%f24,	%f8
	fmovrslz	%i4,	%f28,	%f19
	tle	%icc,	0x1
	tl	%xcc,	0x7
	tvc	%xcc,	0x1
	bn,a,pt	%xcc,	loop_1523
	nop
	fitod	%f12,	%f18
	add	%i6,	%l5,	%g1
	tl	%xcc,	0x3
loop_1523:
	movrne	%g3,	0x262,	%g2
	fnot2	%f16,	%f24
	taddcc	%g7,	%o4,	%i1
	set	0x38, %g5
	prefetcha	[%l7 + %g5] 0x10,	 0x2
	nop
	setx	0x4F29EA91,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f12
	fsqrts	%f12,	%f1
	subcc	%o0,	%l4,	%g5
	ld	[%l7 + 0x50],	%f17
	bvs,a	%icc,	loop_1524
	subcc	%o7,	0x0427,	%i7
	fornot1	%f24,	%f16,	%f24
	movne	%xcc,	%o2,	%i2
loop_1524:
	xnorcc	%o6,	%o5,	%l1
	wr	%g0,	0x80,	%asi
	stha	%g6,	[%l7 + 0x46] %asi
	udivx	%l3,	0x1180,	%i3
	tcs	%icc,	0x5
	movcs	%icc,	%o1,	%g4
	edge32l	%l0,	%l6,	%i5
	fnegd	%f10,	%f6
	taddcc	%i0,	%i4,	%o3
	fandnot1s	%f27,	%f24,	%f11
	fblg	%fcc1,	loop_1525
	movvs	%icc,	%i6,	%l5
	tneg	%xcc,	0x4
	fbug	%fcc0,	loop_1526
loop_1525:
	nop
	setx	0xEE31AD97,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f3
	setx	0xFA7AE0BD,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f29
	fsubs	%f29,	%f3,	%f19
	fandnot2s	%f14,	%f29,	%f26
	bge	loop_1527
loop_1526:
	fbo	%fcc1,	loop_1528
	nop
	setx	0xAF1BDE90F763345A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0x0B855A5D3A2F4E82,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	faddd	%f10,	%f24,	%f14
	tvs	%icc,	0x7
loop_1527:
	mova	%icc,	%g1,	%g2
loop_1528:
	xorcc	%g7,	%g3,	%o4
	tvs	%icc,	0x4
	smul	%l2,	%i1,	%l4
	smul	%o0,	%o7,	%i7
	sdiv	%g5,	0x166D,	%i2
	wr	%g0,	0x80,	%asi
	ldswa	[%l7 + 0x70] %asi,	%o6
	fmovsge	%xcc,	%f16,	%f28
	wr	%g0,	0x2a,	%asi
	stxa	%o2,	[%l7 + 0x20] %asi
	membar	#Sync
	subccc	%l1,	%o5,	%l3
	movne	%icc,	%g6,	%o1
	fbul,a	%fcc2,	loop_1529
	subc	%i3,	%g4,	%l6
	sdivx	%i5,	0x1F83,	%i0
	movrlz	%l0,	0x3FA,	%i4
loop_1529:
	movrgz	%i6,	%o3,	%l5
	movrne	%g1,	%g7,	%g2
	bvc,a	loop_1530
	fcmpgt16	%f12,	%f0,	%o4
	fnor	%f16,	%f0,	%f16
	xnorcc	%g3,	0x0BF7,	%l2
loop_1530:
	bgu,a	loop_1531
	nop
	setx loop_1532, %l0, %l1
	jmpl %l1, %i1
	fnegd	%f20,	%f30
	edge8l	%l4,	%o0,	%i7
loop_1531:
	orcc	%g5,	0x0121,	%o7
loop_1532:
	bgu	%xcc,	loop_1533
	brnz	%o6,	loop_1534
	orncc	%o2,	0x01C6,	%l1
	sth	%o5,	[%l7 + 0x74]
loop_1533:
	movrlez	%i2,	0x1BA,	%l3
loop_1534:
	fbl	%fcc2,	loop_1535
	fmovrdlez	%g6,	%f10,	%f30
	add	%o1,	0x085A,	%i3
	srax	%l6,	%g4,	%i5
loop_1535:
	ta	%icc,	0x3
	call	loop_1536
	tcs	%xcc,	0x1
	fnor	%f12,	%f20,	%f10
	andcc	%i0,	0x0F0D,	%i4
loop_1536:
	stb	%i6,	[%l7 + 0x39]
	nop
	setx	0xE493D303AC16E3E2,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0x8A1F57F43F11685C,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	fdivd	%f14,	%f2,	%f6
	addc	%l0,	0x1A5F,	%o3
	and	%g1,	%g7,	%g2
	fpadd16	%f10,	%f10,	%f18
	edge16n	%o4,	%g3,	%l5
	ldsb	[%l7 + 0x7D],	%i1
	fandnot2s	%f22,	%f26,	%f18
	bne,a	%xcc,	loop_1537
	bvs,pn	%icc,	loop_1538
	tleu	%icc,	0x3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1537:
	edge16ln	%l2,	%o0,	%i7
loop_1538:
	fmovdl	%icc,	%f4,	%f16
	fmovspos	%icc,	%f1,	%f23
	umulcc	%l4,	0x0996,	%o7
	brnz,a	%g5,	loop_1539
	mulx	%o6,	0x1F3D,	%l1
	xnorcc	%o5,	%i2,	%o2
	orncc	%g6,	0x1E7E,	%o1
loop_1539:
	fbge,a	%fcc2,	loop_1540
	alignaddr	%l3,	%i3,	%g4
	nop
	setx	loop_1541,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	ba,pt	%xcc,	loop_1542
loop_1540:
	fpack16	%f26,	%f15
	nop
	setx	0xA06821DE,	%l0,	%l6
	st	%l6,	[%l7 + 0x5C]
	ld	[%l7 + 0x5C],	%fsr
loop_1541:
	movleu	%xcc,	%i5,	%i0
loop_1542:
	edge8n	%i4,	%l6,	%l0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x44, %l1
	lduha	[%l7 + %l1] 0x14,	%i6
	nop
	fitod	%f4,	%f20
	fdtox	%f20,	%f14
	nop
	setx	0x6D6CF50B,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f27
	fsqrts	%f27,	%f9
	xorcc	%o3,	%g1,	%g7
	nop
	fitod	%f2,	%f6
	fdtoi	%f6,	%f5
	movpos	%icc,	%o4,	%g2
	movrne	%g3,	%l5,	%i1
	alignaddr	%l2,	%o0,	%l4
	fxnors	%f9,	%f11,	%f20
	tcc	%icc,	0x4
	and	%o7,	0x0759,	%i7
	set	0x38, %g1
	lduwa	[%l7 + %g1] 0x19,	%o6
	tgu	%xcc,	0x4
	sllx	%g5,	0x1A,	%o5
	bne,pn	%xcc,	loop_1543
	sethi	0x1D58,	%i2
	array16	%o2,	%g6,	%l1
	taddcctv	%o1,	0x0639,	%l3
loop_1543:
	fmul8x16	%f16,	%f0,	%f20
	movvs	%icc,	%i3,	%g4
	fornot2s	%f20,	%f27,	%f22
	edge16l	%i0,	%i5,	%i4
	bcc,pn	%xcc,	loop_1544
	xnorcc	%l0,	0x074F,	%i6
	smulcc	%o3,	%g1,	%l6
	sdivx	%g7,	0x11EB,	%o4
loop_1544:
	subcc	%g2,	%l5,	%i1
	nop
	fitod	%f8,	%f18
	fdtox	%f18,	%f12
	nop
	setx	0x6978B854E526F2EB,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0xDE01404221B71DF4,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	fmuld	%f12,	%f12,	%f18
	tge	%xcc,	0x6
	subc	%g3,	%o0,	%l4
	nop
	fitos	%f5,	%f26
	fstoi	%f26,	%f16
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x0C] %asi,	%o7
	subcc	%l2,	0x0023,	%o6
	tpos	%xcc,	0x6
	move	%icc,	%g5,	%o5
	ldub	[%l7 + 0x22],	%i7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddrl	%i2,	%o2,	%l1
	movcs	%xcc,	%o1,	%l3
	fbul	%fcc2,	loop_1545
	edge8n	%i3,	%g6,	%i0
	mova	%xcc,	%g4,	%i4
	fcmpgt16	%f8,	%f20,	%i5
loop_1545:
	fmovspos	%icc,	%f8,	%f16
	mulscc	%i6,	0x0D3C,	%o3
	ta	%icc,	0x7
	bn	%xcc,	loop_1546
	udiv	%g1,	0x1A20,	%l6
	fmovda	%xcc,	%f17,	%f21
	or	%l0,	0x0F72,	%g7
loop_1546:
	fbe,a	%fcc1,	loop_1547
	and	%o4,	%l5,	%i1
	array8	%g3,	%g2,	%l4
	tgu	%icc,	0x5
loop_1547:
	nop
	wr	%g0,	0x19,	%asi
	lduwa	[%l7 + 0x40] %asi,	%o7
	bge,pn	%xcc,	loop_1548
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdpos	%xcc,	%f31,	%f8
	ldd	[%l7 + 0x70],	%f2
loop_1548:
	fmovsneg	%icc,	%f0,	%f24
	fmovdne	%xcc,	%f15,	%f5
	xor	%l2,	%o0,	%g5
	addc	%o6,	0x1FCA,	%i7
	fbne	%fcc0,	loop_1549
	sllx	%o5,	0x1A,	%i2
	fnot2s	%f19,	%f19
	fble,a	%fcc1,	loop_1550
loop_1549:
	tcs	%xcc,	0x4
	wr	%g0,	0x04,	%asi
	ldda	[%l7 + 0x40] %asi,	%o2
loop_1550:
	popc	%l1,	%l3
	mova	%icc,	%i3,	%g6
	call	loop_1551
	edge8n	%i0,	%g4,	%o1
	fmovscc	%xcc,	%f13,	%f6
	edge8	%i5,	%i4,	%i6
loop_1551:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stw	%o3,	[%l7 + 0x70]
	set	0x76, %i0
	ldsha	[%l7 + %i0] 0x04,	%l6
	xnor	%l0,	%g7,	%o4
	xnor	%l5,	0x0B2D,	%i1
	tge	%xcc,	0x7
	edge32	%g1,	%g3,	%g2
	swap	[%l7 + 0x60],	%o7
	movneg	%xcc,	%l4,	%o0
	movgu	%xcc,	%l2,	%o6
	array16	%g5,	%o5,	%i2
	ld	[%l7 + 0x7C],	%f18
	fnegs	%f2,	%f13
	fpack16	%f4,	%f3
	subccc	%i7,	0x0E23,	%l1
	srlx	%l3,	%i3,	%g6
	fmovsl	%xcc,	%f16,	%f7
	fmovrdne	%o2,	%f6,	%f4
	tle	%xcc,	0x7
	fxor	%f30,	%f26,	%f10
	edge32l	%g4,	%o1,	%i0
	andn	%i5,	%i6,	%i4
	prefetch	[%l7 + 0x7C],	 0x2
	tcc	%icc,	0x3
	sub	%o3,	%l0,	%l6
	wr	%g0,	0x88,	%asi
	ldsha	[%l7 + 0x70] %asi,	%o4
	andncc	%l5,	%g7,	%i1
	sub	%g1,	0x0516,	%g2
	movl	%xcc,	%g3,	%l4
	array8	%o0,	%o7,	%l2
	udiv	%o6,	0x025D,	%o5
	orn	%g5,	%i2,	%i7
	mulscc	%l1,	0x0598,	%i3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrde	%g6,	%f0,	%f26
	tcs	%icc,	0x3
	xorcc	%o2,	%l3,	%o1
	set	0x6E, %g2
	lduba	[%l7 + %g2] 0x15,	%g4
	sub	%i0,	%i6,	%i5
	set	0x58, %l3
	ldswa	[%l7 + %l3] 0x0c,	%o3
	fornot2	%f22,	%f4,	%f2
	fmovrslz	%l0,	%f22,	%f22
	for	%f22,	%f14,	%f30
	sir	0x1F93
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	taddcc	%l6,	%i4,	%l5
	fpadd32	%f26,	%f8,	%f22
	tl	%icc,	0x2
	bleu,pt	%icc,	loop_1552
	nop
	fitos	%f4,	%f13
	fstox	%f13,	%f14
	mova	%xcc,	%o4,	%g7
	bg,a,pt	%xcc,	loop_1553
loop_1552:
	movcc	%xcc,	%g1,	%i1
	tsubcc	%g3,	%g2,	%o0
	fbule	%fcc2,	loop_1554
loop_1553:
	brnz	%l4,	loop_1555
	fcmpne32	%f22,	%f24,	%l2
	ta	%xcc,	0x5
loop_1554:
	nop
	setx	0xAE505B93,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f22
	setx	0xBF97C1E2,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f5
	fdivs	%f5,	%f22,	%f19
loop_1555:
	edge32n	%o7,	%o5,	%g5
	nop
	fitos	%f3,	%f27
	fstox	%f27,	%f30
	fxtos	%f30,	%f24
	subccc	%i2,	0x0045,	%i7
	sdivx	%o6,	0x14A7,	%i3
	tgu	%icc,	0x0
	nop
	fitod	%f2,	%f2
	fdtox	%f2,	%f8
	set	0x18, %i7
	prefetcha	[%l7 + %i7] 0x80,	 0x0
	tcs	%icc,	0x7
	tg	%xcc,	0x7
	tleu	%xcc,	0x6
	brnz	%o2,	loop_1556
	fmul8sux16	%f30,	%f30,	%f12
	udiv	%l1,	0x152F,	%l3
	ba	loop_1557
loop_1556:
	fmovsvc	%icc,	%f0,	%f13
	fbe,a	%fcc1,	loop_1558
	fmul8x16	%f27,	%f0,	%f2
loop_1557:
	nop
	fitos	%f9,	%f27
	fstox	%f27,	%f6
	fxtos	%f6,	%f20
	fpackfix	%f14,	%f12
loop_1558:
	lduw	[%l7 + 0x50],	%o1
	tne	%xcc,	0x3
	addc	%g4,	0x0FEB,	%i6
	orcc	%i5,	%i0,	%o3
	fbul	%fcc1,	loop_1559
	fbul	%fcc0,	loop_1560
	move	%xcc,	%l6,	%l0
	fsrc1s	%f22,	%f8
loop_1559:
	mova	%icc,	%i4,	%o4
loop_1560:
	brgz	%g7,	loop_1561
	tneg	%xcc,	0x6
	movgu	%icc,	%g1,	%i1
	smulcc	%g3,	0x0941,	%g2
loop_1561:
	sub	%o0,	0x1739,	%l4
	fmovdcc	%xcc,	%f4,	%f27
	movcc	%icc,	%l2,	%l5
	popc	0x090C,	%o7
	tl	%icc,	0x6
	bpos,a	%xcc,	loop_1562
	fpadd32s	%f8,	%f4,	%f20
	wr	%g0,	0x88,	%asi
	prefetcha	[%l7 + 0x78] %asi,	 0x3
loop_1562:
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
	bge,a	loop_1564
	movleu	%xcc,	%g5,	%i2
	tvc	%icc,	0x4
loop_1563:
	tneg	%icc,	0x2
loop_1564:
	sub	%i7,	0x195C,	%o6
	set	0x66, %o7
	lduha	[%l7 + %o7] 0x10,	%g6
	stw	%i3,	[%l7 + 0x74]
	ta	%icc,	0x2
	fxors	%f3,	%f26,	%f19
	set	0x10, %l5
	sta	%f11,	[%l7 + %l5] 0x0c
	sra	%l1,	0x1B,	%o2
	or	%o1,	%l3,	%g4
	fbg,a	%fcc1,	loop_1565
	pdist	%f22,	%f4,	%f24
	sll	%i6,	0x14,	%i5
	fmovsg	%icc,	%f5,	%f2
loop_1565:
	movneg	%icc,	%o3,	%i0
	tg	%xcc,	0x7
	movvc	%icc,	%l6,	%l0
	movcc	%icc,	%i4,	%g7
	fmovsvs	%xcc,	%f27,	%f9
	srl	%g1,	0x0D,	%o4
	movne	%xcc,	%g3,	%i1
	fmovrdgz	%g2,	%f0,	%f4
	sth	%o0,	[%l7 + 0x66]
	sdiv	%l2,	0x1950,	%l4
	nop
	setx	0x4E30614A,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f0
	setx	0x2919C8E4,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f22
	fdivs	%f22,	%f0,	%f29
	nop
	setx	0x38490EFE,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f7
	setx	0xE990750A,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f29
	fdivs	%f29,	%f7,	%f2
	nop
	fitod	%f17,	%f8
	udivx	%o7,	0x06CB,	%l5
	add	%o5,	%g5,	%i2
	ble,pt	%icc,	loop_1566
	ldd	[%l7 + 0x30],	%i6
	std	%f18,	[%l7 + 0x20]
	edge32l	%g6,	%o6,	%l1
loop_1566:
	fabss	%f24,	%f2
	te	%xcc,	0x6
	set	0x40, %o0
	stwa	%o2,	[%l7 + %o0] 0x2f
	membar	#Sync
	mulscc	%i3,	%l3,	%g4
	smulcc	%i6,	%o1,	%i5
	mulscc	%o3,	0x1D26,	%i0
	movneg	%icc,	%l6,	%i4
	udivcc	%g7,	0x0559,	%g1
	edge8l	%o4,	%g3,	%l0
	subc	%g2,	%o0,	%l2
	srl	%i1,	%l4,	%l5
	movrgz	%o5,	%o7,	%g5
	movgu	%xcc,	%i7,	%g6
	fmovsn	%icc,	%f8,	%f25
	tn	%icc,	0x3
	xnor	%o6,	%l1,	%i2
	fmul8x16au	%f27,	%f27,	%f8
	edge32	%o2,	%i3,	%g4
	taddcc	%i6,	%l3,	%i5
	umulcc	%o1,	0x0068,	%o3
	edge32	%l6,	%i0,	%g7
	xor	%i4,	%g1,	%o4
	tvc	%xcc,	0x7
	set	0x70, %l2
	stwa	%l0,	[%l7 + %l2] 0x14
	fcmpgt32	%f0,	%f2,	%g2
	tn	%icc,	0x2
	tneg	%icc,	0x0
	fmovdleu	%xcc,	%f4,	%f21
	bneg,pt	%icc,	loop_1567
	edge32ln	%g3,	%o0,	%l2
	alignaddrl	%i1,	%l4,	%l5
	tgu	%xcc,	0x1
loop_1567:
	sdivx	%o5,	0x01C3,	%g5
	movle	%xcc,	%i7,	%g6
	smul	%o7,	%l1,	%i2
	set	0x38, %o2
	swapa	[%l7 + %o2] 0x80,	%o6
	tsubcctv	%o2,	0x0A45,	%g4
	add	%i6,	0x088B,	%l3
	alignaddr	%i5,	%o1,	%i3
	tneg	%icc,	0x0
	tn	%icc,	0x2
	swap	[%l7 + 0x30],	%l6
	brgz	%i0,	loop_1568
	fmovdle	%icc,	%f22,	%f28
	fmovrdgez	%o3,	%f16,	%f26
	sll	%g7,	%i4,	%g1
loop_1568:
	edge32ln	%o4,	%l0,	%g3
	fbule,a	%fcc3,	loop_1569
	fmovdn	%xcc,	%f26,	%f9
	bpos,pt	%xcc,	loop_1570
	sdivx	%g2,	0x1CF2,	%l2
loop_1569:
	fpadd32	%f24,	%f24,	%f12
	udiv	%i1,	0x0A26,	%l4
loop_1570:
	fmovdcs	%icc,	%f26,	%f24
	fbo,a	%fcc0,	loop_1571
	fbue	%fcc2,	loop_1572
	fbne	%fcc1,	loop_1573
	fmovrdne	%o0,	%f14,	%f24
loop_1571:
	array8	%o5,	%l5,	%g5
loop_1572:
	ta	%xcc,	0x1
loop_1573:
	tl	%xcc,	0x7
	nop
	fitod	%f4,	%f10
	fdtox	%f10,	%f2
	sir	0x1969
	xnor	%i7,	%o7,	%g6
	addccc	%i2,	%l1,	%o2
	nop
	fitod	%f12,	%f10
	fdtox	%f10,	%f2
	brz	%o6,	loop_1574
	movge	%xcc,	%g4,	%l3
	movvs	%icc,	%i6,	%i5
	movn	%icc,	%i3,	%l6
loop_1574:
	fmovdpos	%xcc,	%f29,	%f8
	edge32l	%o1,	%i0,	%o3
	fsrc2s	%f4,	%f20
	fmovse	%icc,	%f14,	%f18
	wr	%g0,	0x80,	%asi
	lduha	[%l7 + 0x7C] %asi,	%g7
	fmovrslz	%g1,	%f4,	%f3
	array32	%o4,	%l0,	%i4
	lduw	[%l7 + 0x34],	%g3
	movne	%icc,	%l2,	%g2
	movle	%xcc,	%l4,	%i1
	fnor	%f30,	%f16,	%f14
	udivcc	%o5,	0x04FA,	%o0
	fmovdcc	%icc,	%f25,	%f20
	edge8	%l5,	%g5,	%o7
	sllx	%g6,	0x1B,	%i2
	fbo,a	%fcc3,	loop_1575
	movre	%l1,	0x2D0,	%o2
	nop
	setx	0xDB9F93DD507A3939,	%l0,	%l6
	stx	%l6,	[%l7 + 0x10]
	ldx	[%l7 + 0x10],	%fsr
	mulx	%o6,	0x0CAF,	%g4
loop_1575:
	fxors	%f30,	%f5,	%f27
	sub	%i7,	0x0909,	%l3
	tvs	%icc,	0x1
	membar	0x36
	xorcc	%i5,	0x0B50,	%i6
	fmovrde	%l6,	%f18,	%f22
	subc	%i3,	%i0,	%o1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andcc	%o3,	%g1,	%o4
	call	loop_1576
	ta	%icc,	0x0
	umul	%g7,	0x1E04,	%i4
	fbuge,a	%fcc3,	loop_1577
loop_1576:
	edge32	%g3,	%l0,	%g2
	sll	%l4,	0x05,	%l2
	nop
	setx	loop_1578,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_1577:
	membar	0x1A
	tge	%xcc,	0x0
	movrgez	%o5,	%o0,	%i1
loop_1578:
	edge16n	%g5,	%o7,	%l5
	sllx	%i2,	%g6,	%o2
	movgu	%icc,	%o6,	%l1
	edge32ln	%i7,	%g4,	%i5
	fmovsa	%xcc,	%f19,	%f23
	edge8ln	%l3,	%i6,	%i3
	fmovdneg	%icc,	%f5,	%f24
	fble,a	%fcc1,	loop_1579
	movge	%icc,	%i0,	%o1
	tge	%xcc,	0x6
	prefetch	[%l7 + 0x44],	 0x3
loop_1579:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	set	0x57, %o3
	ldub	[%l7 + %o3],	%l6
	fexpand	%f1,	%f14
	tgu	%icc,	0x3
	srl	%g1,	0x0B,	%o4
	fcmple32	%f2,	%f10,	%o3
	stbar
	set	0x18, %i3
	swapa	[%l7 + %i3] 0x80,	%i4
	tcc	%xcc,	0x6
	fxors	%f23,	%f5,	%f18
	ldsw	[%l7 + 0x5C],	%g7
	sdiv	%g3,	0x0513,	%l0
	tl	%xcc,	0x7
	fabss	%f26,	%f16
	fmovrslez	%l4,	%f3,	%f12
	fmovdcs	%icc,	%f20,	%f15
	movl	%xcc,	%g2,	%o5
	fcmpeq16	%f22,	%f22,	%l2
	wr	%g0,	0x89,	%asi
	prefetcha	[%l7 + 0x70] %asi,	 0x3
	fmovsl	%icc,	%f20,	%f29
	edge32l	%g5,	%o7,	%o0
	tcs	%icc,	0x7
	tcc	%icc,	0x3
	wr	%g0,	0x0c,	%asi
	lduha	[%l7 + 0x2C] %asi,	%l5
	swap	[%l7 + 0x1C],	%i2
	xnorcc	%g6,	%o6,	%o2
	fbne	%fcc1,	loop_1580
	tvc	%xcc,	0x2
	movrgz	%l1,	0x1FA,	%g4
	subcc	%i7,	%l3,	%i5
loop_1580:
	nop
	fitod	%f12,	%f24
	fdtox	%f24,	%f30
	tvc	%icc,	0x0
	move	%xcc,	%i6,	%i3
	orn	%o1,	%i0,	%g1
	fandnot2	%f14,	%f26,	%f2
	st	%f26,	[%l7 + 0x20]
	movg	%icc,	%l6,	%o3
	wr	%g0,	0x10,	%asi
	sta	%f13,	[%l7 + 0x40] %asi
	wr	%g0,	0x19,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	edge16ln	%i4,	%g7,	%g3
	brgz,a	%o4,	loop_1581
	ldsb	[%l7 + 0x25],	%l0
	movrgez	%g2,	0x314,	%o5
	lduw	[%l7 + 0x18],	%l4
loop_1581:
	orncc	%l2,	0x1CDE,	%i1
	array32	%o7,	%o0,	%l5
	array16	%i2,	%g6,	%o6
	edge8l	%o2,	%g5,	%g4
	fbug	%fcc3,	loop_1582
	fmovdle	%icc,	%f29,	%f25
	bshuffle	%f10,	%f24,	%f30
	wr	%g0,	0x0c,	%asi
	ldsba	[%l7 + 0x47] %asi,	%i7
loop_1582:
	bge,a	loop_1583
	tpos	%icc,	0x7
	addcc	%l3,	%l1,	%i6
	ldsb	[%l7 + 0x09],	%i5
loop_1583:
	xnor	%o1,	0x0752,	%i0
	udiv	%g1,	0x158D,	%l6
	sir	0x1F2C
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
	tne	%icc,	0x1
	fones	%f9
	fabss	%f11,	%f3
loop_1584:
	nop
	wr	%g0,	0x10,	%asi
	stwa	%i3,	[%l7 + 0x48] %asi
	stw	%i4,	[%l7 + 0x10]
	fbo,a	%fcc0,	loop_1585
	fpmerge	%f29,	%f2,	%f4
	fbl,a	%fcc2,	loop_1586
	bn,pt	%xcc,	loop_1587
loop_1585:
	array8	%o3,	%g3,	%o4
	sdiv	%l0,	0x16EB,	%g2
loop_1586:
	fmovse	%icc,	%f14,	%f16
loop_1587:
	edge32l	%g7,	%o5,	%l2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fsrc1s	%f10,	%f28
	nop
	fitos	%f10,	%f9
	fstod	%f9,	%f2
	tsubcctv	%i1,	%o7,	%l4
	fpadd32s	%f15,	%f27,	%f2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	brnz	%o0,	loop_1588
	bg,a,pn	%xcc,	loop_1589
	mulscc	%l5,	0x04CC,	%g6
	umulcc	%o6,	0x0178,	%o2
loop_1588:
	fmovsvs	%xcc,	%f22,	%f27
loop_1589:
	pdist	%f26,	%f6,	%f18
	tcc	%icc,	0x1
	nop
	setx	0x82BF6B63,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f22
	setx	0x259E6029,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f23
	fmuls	%f23,	%f22,	%f0
	orncc	%g5,	%g4,	%i2
	tvc	%xcc,	0x4
	fbuge,a	%fcc3,	loop_1590
	movle	%xcc,	%i7,	%l1
	movvs	%xcc,	%i6,	%i5
	fnor	%f22,	%f8,	%f24
loop_1590:
	tsubcctv	%l3,	0x1247,	%i0
	subc	%g1,	0x1BF0,	%o1
	fpsub32s	%f11,	%f3,	%f11
	fmovsneg	%icc,	%f17,	%f9
	umul	%l6,	0x1895,	%i3
	tpos	%xcc,	0x7
	fcmpgt32	%f0,	%f14,	%o3
	xnorcc	%i4,	0x0837,	%g3
	fmovsge	%icc,	%f2,	%f11
	st	%f27,	[%l7 + 0x10]
	fzeros	%f29
	fbge,a	%fcc0,	loop_1591
	movvc	%xcc,	%l0,	%g2
	sra	%g7,	%o4,	%o5
	umulcc	%i1,	0x0E69,	%l2
loop_1591:
	umulcc	%o7,	0x11C3,	%o0
	brlez	%l4,	loop_1592
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdivx	%g6,	0x0892,	%l5
	brnz	%o6,	loop_1593
loop_1592:
	sdivx	%g5,	0x09EF,	%o2
	srax	%i2,	0x0B,	%g4
	edge8l	%l1,	%i6,	%i5
loop_1593:
	xorcc	%l3,	%i0,	%g1
	fmovsgu	%icc,	%f26,	%f21
	fornot1s	%f10,	%f20,	%f7
	tgu	%icc,	0x5
	edge16l	%o1,	%i7,	%i3
	movvs	%xcc,	%l6,	%o3
	addccc	%g3,	%l0,	%g2
	brz	%g7,	loop_1594
	tvc	%xcc,	0x5
	orn	%i4,	%o4,	%i1
	sir	0x0883
loop_1594:
	fmovdne	%xcc,	%f2,	%f12
	array16	%l2,	%o7,	%o5
	tcs	%icc,	0x6
	sdiv	%o0,	0x08BF,	%l4
	edge16ln	%g6,	%l5,	%g5
	tneg	%icc,	0x0
	ldd	[%l7 + 0x10],	%f0
	xnorcc	%o6,	%i2,	%o2
	fandnot1	%f14,	%f8,	%f26
	tn	%icc,	0x7
	movrgz	%g4,	%i6,	%i5
	fmovdne	%xcc,	%f25,	%f29
	edge16n	%l1,	%l3,	%g1
	tsubcc	%i0,	%o1,	%i3
	membar	0x2D
	mulx	%l6,	0x077D,	%i7
	popc	0x1748,	%o3
	srlx	%l0,	%g3,	%g2
	tge	%icc,	0x6
	add	%g7,	0x0EBD,	%o4
	edge32	%i1,	%i4,	%o7
	stx	%o5,	[%l7 + 0x58]
	movrne	%o0,	0x360,	%l2
	fpadd32s	%f27,	%f26,	%f26
	tpos	%xcc,	0x7
	set	0x40, %i1
	ldda	[%l7 + %i1] 0x22,	%l4
	lduw	[%l7 + 0x08],	%g6
	move	%icc,	%g5,	%o6
	fmovsge	%icc,	%f6,	%f13
	subcc	%l5,	0x1AC5,	%i2
	smulcc	%g4,	0x07AD,	%i6
	tneg	%xcc,	0x6
	alignaddr	%o2,	%i5,	%l3
	tn	%xcc,	0x0
	movcc	%xcc,	%g1,	%i0
	edge32n	%o1,	%i3,	%l1
	fones	%f18
	set	0x10, %g7
	ldxa	[%g0 + %g7] 0x20,	%i7
	array16	%l6,	%o3,	%g3
	sra	%l0,	0x0E,	%g2
	add	%l7,	0x48,	%l6
	wr	%g0,	0x19,	%asi
	lda	[%l6] %asi,	%o4
	casa	[%l6] 0x19,	%o4,	%g7
	edge16ln	%i1,	%i4,	%o7
	movrgz	%o0,	%l2,	%l4
	movpos	%icc,	%g6,	%o5
	or	%o6,	0x0F7A,	%l5
	movrlz	%i2,	%g4,	%i6
	fmul8x16au	%f7,	%f0,	%f8
	umulcc	%o2,	%i5,	%l3
	srlx	%g5,	%g1,	%o1
	movge	%icc,	%i0,	%i3
	edge32ln	%i7,	%l6,	%o3
	fzeros	%f25
	fpadd16	%f30,	%f2,	%f24
	tg	%xcc,	0x2
	orn	%l1,	%l0,	%g3
	movpos	%xcc,	%o4,	%g2
	tsubcc	%i1,	%g7,	%o7
	edge32l	%i4,	%o0,	%l4
	tvc	%xcc,	0x6
	fbug,a	%fcc3,	loop_1595
	subcc	%g6,	%o5,	%l2
	st	%f10,	[%l7 + 0x0C]
	fbue,a	%fcc0,	loop_1596
loop_1595:
	sra	%o6,	%l5,	%g4
	fabss	%f18,	%f29
	fbug	%fcc3,	loop_1597
loop_1596:
	udiv	%i2,	0x0110,	%i6
	xor	%o2,	0x1EA4,	%i5
	xorcc	%g5,	0x0D60,	%l3
loop_1597:
	swap	[%l7 + 0x60],	%g1
	fcmpeq32	%f12,	%f20,	%i0
	tl	%icc,	0x5
	te	%icc,	0x5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fornot2	%f8,	%f18,	%f28
	addccc	%o1,	%i3,	%l6
	sdivx	%i7,	0x134E,	%o3
	ta	%icc,	0x0
	mulx	%l1,	%l0,	%g3
	tgu	%xcc,	0x2
	srax	%g2,	%o4,	%i1
	tg	%icc,	0x6
	membar	0x69
	fcmple16	%f6,	%f26,	%g7
	xnor	%i4,	0x0FDF,	%o7
	srlx	%o0,	%l4,	%o5
	bcc,a,pn	%icc,	loop_1598
	ldstub	[%l7 + 0x65],	%l2
	smulcc	%g6,	%l5,	%g4
	udiv	%o6,	0x0CA0,	%i6
loop_1598:
	fmovsa	%icc,	%f3,	%f0
	movvs	%xcc,	%i2,	%i5
	sdivcc	%g5,	0x1B61,	%l3
	edge32ln	%g1,	%o2,	%o1
	edge8l	%i3,	%l6,	%i0
	sethi	0x1205,	%o3
	sdiv	%i7,	0x1B67,	%l0
	tneg	%icc,	0x2
	membar	0x3A
	movrlez	%l1,	0x3BB,	%g2
	fmovdvc	%xcc,	%f15,	%f20
	smul	%g3,	%i1,	%g7
	srax	%o4,	0x0A,	%i4
	te	%xcc,	0x1
	brz	%o7,	loop_1599
	fmovsgu	%xcc,	%f5,	%f24
	std	%f12,	[%l7 + 0x20]
	sethi	0x136C,	%o0
loop_1599:
	fbug	%fcc3,	loop_1600
	move	%icc,	%l4,	%o5
	fbu,a	%fcc3,	loop_1601
	edge16	%g6,	%l5,	%l2
loop_1600:
	movpos	%icc,	%o6,	%g4
	addc	%i6,	0x0476,	%i2
loop_1601:
	movrne	%g5,	%l3,	%g1
	nop
	setx	0x5DBD0404,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f27
	fsqrts	%f27,	%f7
	subc	%o2,	0x048D,	%o1
	ldsb	[%l7 + 0x25],	%i5
	movge	%icc,	%l6,	%i0
	bvs,a	%xcc,	loop_1602
	brgez	%i3,	loop_1603
	fmovrde	%i7,	%f14,	%f28
	fpmerge	%f3,	%f28,	%f18
loop_1602:
	nop
	setx	0xF3B961558F496254,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0x58306EEDD807EC20,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	fmuld	%f14,	%f26,	%f14
loop_1603:
	tsubcc	%o3,	0x1A82,	%l0
	udivcc	%l1,	0x1D56,	%g2
	set	0x60, %l6
	lduba	[%l7 + %l6] 0x10,	%g3
	fmovrdlz	%i1,	%f0,	%f24
	lduh	[%l7 + 0x5C],	%o4
	fcmpne32	%f16,	%f8,	%i4
	udivx	%g7,	0x0C42,	%o0
	movcs	%icc,	%o7,	%o5
	fmovsge	%xcc,	%f8,	%f6
	movge	%icc,	%l4,	%g6
	bgu,a,pn	%icc,	loop_1604
	sdivx	%l5,	0x1216,	%l2
	smul	%o6,	%i6,	%i2
	stw	%g5,	[%l7 + 0x64]
loop_1604:
	edge32ln	%l3,	%g4,	%o2
	fones	%f21
	wr	%g0,	0x80,	%asi
	lduba	[%l7 + 0x79] %asi,	%g1
	nop
	setx	0x304C27AE,	%l0,	%l6
	st	%l6,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%fsr
	umul	%o1,	%i5,	%i0
	nop
	fitod	%f4,	%f22
	fdtox	%f22,	%f0
	movrgez	%l6,	0x39B,	%i3
	brz	%o3,	loop_1605
	fmovscc	%icc,	%f21,	%f31
	bpos,a,pn	%xcc,	loop_1606
	movneg	%icc,	%l0,	%i7
loop_1605:
	fnand	%f4,	%f8,	%f6
	movpos	%xcc,	%g2,	%g3
loop_1606:
	bge,a	%xcc,	loop_1607
	fbo,a	%fcc1,	loop_1608
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sllx	%i1,	%o4,	%l1
loop_1607:
	edge8ln	%i4,	%g7,	%o7
loop_1608:
	nop
	fitod	%f2,	%f12
	fdtox	%f12,	%f26
	fxtod	%f26,	%f10
	srl	%o5,	%o0,	%g6
	edge8	%l5,	%l4,	%o6
	sllx	%i6,	0x1F,	%i2
	stw	%g5,	[%l7 + 0x40]
	movgu	%xcc,	%l2,	%l3
	tl	%icc,	0x1
	fmovscs	%xcc,	%f20,	%f15
	fmul8x16au	%f9,	%f28,	%f18
	fandnot2s	%f15,	%f0,	%f24
	alignaddrl	%g4,	%g1,	%o2
	subcc	%o1,	%i5,	%i0
	tg	%xcc,	0x4
	smul	%l6,	0x1565,	%i3
	smulcc	%l0,	0x0469,	%i7
	edge8l	%g2,	%o3,	%g3
	sra	%i1,	0x11,	%l1
	edge32	%i4,	%o4,	%o7
	bneg	loop_1609
	bg,pn	%xcc,	loop_1610
	fones	%f19
	wr	%g0,	0x11,	%asi
	swapa	[%l7 + 0x44] %asi,	%o5
loop_1609:
	udiv	%g7,	0x1C1A,	%g6
loop_1610:
	fmovscs	%icc,	%f11,	%f13
	fba,a	%fcc2,	loop_1611
	fmovsneg	%xcc,	%f15,	%f23
	tl	%xcc,	0x4
	addcc	%l5,	0x0E10,	%l4
loop_1611:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fand	%f16,	%f8,	%f26
	ldstub	[%l7 + 0x62],	%o6
	tn	%xcc,	0x5
	tl	%icc,	0x6
	movrgz	%i6,	%i2,	%o0
	bleu	%icc,	loop_1612
	alignaddrl	%g5,	%l2,	%g4
	subcc	%g1,	%o2,	%l3
	set	0x40, %i2
	ldda	[%l7 + %i2] 0x0c,	%f16
loop_1612:
	udivx	%i5,	0x1758,	%i0
	wr	%g0,	0x18,	%asi
	prefetcha	[%l7 + 0x78] %asi,	 0x1
	fcmpne16	%f14,	%f26,	%o1
	brlz,a	%i3,	loop_1613
	brz	%l0,	loop_1614
	fpmerge	%f17,	%f9,	%f16
	movpos	%xcc,	%g2,	%o3
loop_1613:
	smul	%g3,	%i7,	%i1
loop_1614:
	fsrc2s	%f8,	%f30
	fsrc2s	%f23,	%f7
	alignaddr	%i4,	%l1,	%o4
	membar	0x59
	wr	%g0,	0x89,	%asi
	ldda	[%l7 + 0x20] %asi,	%o6
	movle	%icc,	%o5,	%g6
	sub	%l5,	%l4,	%o6
	ldx	[%l7 + 0x18],	%g7
	fmovdneg	%xcc,	%f24,	%f27
	movre	%i6,	%i2,	%o0
	fmovdn	%icc,	%f23,	%f6
	fabss	%f28,	%f22
	bcc,pt	%icc,	loop_1615
	prefetch	[%l7 + 0x48],	 0x2
	wr	%g0,	0xea,	%asi
	stba	%g5,	[%l7 + 0x78] %asi
	membar	#Sync
loop_1615:
	smulcc	%l2,	0x0BCD,	%g4
	fabss	%f1,	%f24
	fmovdpos	%xcc,	%f20,	%f28
	smul	%o2,	%l3,	%i5
	fandnot1s	%f5,	%f1,	%f2
	fpadd16s	%f31,	%f28,	%f14
	tge	%icc,	0x3
	udivx	%i0,	0x0B42,	%g1
	sub	%o1,	0x0903,	%l6
	te	%xcc,	0x6
	udivcc	%i3,	0x08D7,	%l0
	tne	%icc,	0x6
	tvc	%xcc,	0x7
	ldsw	[%l7 + 0x50],	%g2
	mova	%xcc,	%g3,	%o3
	movgu	%xcc,	%i1,	%i7
	fbn,a	%fcc3,	loop_1616
	movrlz	%i4,	%o4,	%l1
	edge16	%o7,	%g6,	%l5
	movrne	%l4,	%o5,	%o6
loop_1616:
	alignaddrl	%i6,	%g7,	%i2
	fbule	%fcc2,	loop_1617
	xnorcc	%g5,	0x00EE,	%l2
	fzero	%f2
	and	%g4,	%o2,	%o0
loop_1617:
	fmul8x16au	%f31,	%f28,	%f30
	fabss	%f18,	%f13
	brgz,a	%l3,	loop_1618
	nop
	setx	0xE5B72F78DCE508D0,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	fsqrtd	%f8,	%f2
	tcs	%icc,	0x3
	set	0x74, %l4
	swapa	[%l7 + %l4] 0x19,	%i5
loop_1618:
	alignaddrl	%i0,	%g1,	%o1
	fmovrsgz	%l6,	%f16,	%f11
	tcc	%icc,	0x3
	tpos	%xcc,	0x7
	movg	%xcc,	%i3,	%l0
	fmovsgu	%xcc,	%f11,	%f20
	brlz	%g2,	loop_1619
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sra	%o3,	%i1,	%i7
	movcs	%icc,	%i4,	%g3
loop_1619:
	movne	%icc,	%o4,	%o7
	tgu	%xcc,	0x6
	brz,a	%l1,	loop_1620
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	be,a	%xcc,	loop_1621
	srlx	%l5,	0x13,	%l4
loop_1620:
	fmovdgu	%xcc,	%f7,	%f18
	subc	%o5,	0x1ACE,	%o6
loop_1621:
	nop
	setx	0x49F0A180,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f19
	setx	0xDA1BA953,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f0
	fdivs	%f0,	%f19,	%f20
	subc	%i6,	0x1D6E,	%g7
	udivcc	%g6,	0x1E29,	%i2
	fpsub16s	%f31,	%f31,	%f11
	mova	%xcc,	%l2,	%g5
	movgu	%xcc,	%g4,	%o2
	fcmpne16	%f0,	%f8,	%o0
	movrne	%i5,	%i0,	%g1
	st	%f13,	[%l7 + 0x68]
	brz,a	%o1,	loop_1622
	fornot1	%f6,	%f10,	%f16
	fmovrdlez	%l3,	%f14,	%f12
	stb	%i3,	[%l7 + 0x15]
loop_1622:
	edge8n	%l0,	%l6,	%o3
	fmovda	%icc,	%f8,	%f16
	ldub	[%l7 + 0x36],	%i1
	fmovrsgz	%i7,	%f24,	%f10
	ba,pn	%xcc,	loop_1623
	orn	%i4,	%g2,	%g3
	movre	%o4,	0x0A2,	%o7
	fcmpgt32	%f14,	%f6,	%l5
loop_1623:
	te	%icc,	0x6
	movgu	%icc,	%l4,	%o5
	taddcctv	%o6,	0x01A9,	%i6
	tn	%xcc,	0x1
	fmovrslz	%l1,	%f3,	%f15
	add	%l7,	0x60,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%g6
	casa	[%l6] %asi,	%g6,	%i2
	udiv	%g7,	0x103A,	%g5
	membar	0x2D
	membar	0x22
	fzero	%f22
	be,a,pn	%icc,	loop_1624
	srl	%g4,	0x16,	%o2
	fmovdg	%xcc,	%f23,	%f26
	nop
	setx loop_1625, %l0, %l1
	jmpl %l1, %o0
loop_1624:
	srl	%i5,	%l2,	%i0
	udiv	%o1,	0x175A,	%l3
	edge16ln	%i3,	%g1,	%l0
loop_1625:
	fmovrdlz	%l6,	%f10,	%f18
	addc	%i1,	0x10E9,	%i7
	or	%i4,	0x18EE,	%o3
	set	0x10, %o6
	ldswa	[%l7 + %o6] 0x10,	%g3
	and	%g2,	0x1423,	%o4
	stx	%l5,	[%l7 + 0x18]
	nop
	setx loop_1626, %l0, %l1
	jmpl %l1, %o7
	membar	0x0A
	ta	%icc,	0x2
	fandnot1s	%f20,	%f30,	%f19
loop_1626:
	movvc	%icc,	%o5,	%l4
	add	%l7,	0x20,	%l6
	wr	%g0,	0x19,	%asi
	lda	[%l6] %asi,	%i6
	casa	[%l6] 0x19,	%i6,	%o6
	fmovdn	%xcc,	%f6,	%f5
	sethi	0x05F9,	%l1
	tvs	%xcc,	0x2
	set	0x40, %g4
	ldda	[%l7 + %g4] 0x88,	%f16
	movg	%xcc,	%i2,	%g6
	movg	%icc,	%g7,	%g4
	fbne	%fcc1,	loop_1627
	stb	%g5,	[%l7 + 0x59]
	sra	%o0,	0x1D,	%o2
	bge,a,pt	%xcc,	loop_1628
loop_1627:
	ldstub	[%l7 + 0x3B],	%i5
	movvs	%icc,	%i0,	%o1
	wr	%g0,	0x88,	%asi
	prefetcha	[%l7 + 0x78] %asi,	 0x1
loop_1628:
	andcc	%i3,	%g1,	%l3
	andn	%l0,	0x0B92,	%i1
	sra	%i7,	%i4,	%l6
	sllx	%g3,	%o3,	%o4
	fmovdneg	%icc,	%f18,	%f4
	movcc	%icc,	%g2,	%l5
	fbne,a	%fcc1,	loop_1629
	mulscc	%o7,	%l4,	%i6
	fabss	%f4,	%f26
	move	%icc,	%o6,	%l1
loop_1629:
	addccc	%o5,	0x16E0,	%g6
	edge16l	%i2,	%g7,	%g4
	movre	%g5,	%o2,	%i5
	sra	%i0,	0x1C,	%o0
	fpack16	%f4,	%f13
	nop
	fitos	%f11,	%f3
	fstod	%f3,	%f24
	sub	%l2,	%o1,	%i3
	fmovsge	%icc,	%f18,	%f2
	ldstub	[%l7 + 0x0C],	%l3
	edge32ln	%g1,	%l0,	%i1
	subcc	%i7,	0x0297,	%l6
	brnz	%i4,	loop_1630
	edge32	%g3,	%o4,	%g2
	ldsb	[%l7 + 0x20],	%o3
	bleu,a	loop_1631
loop_1630:
	mulscc	%l5,	0x0FD0,	%l4
	bleu	%xcc,	loop_1632
	taddcctv	%i6,	0x1BE8,	%o6
loop_1631:
	bl,pt	%xcc,	loop_1633
	umul	%l1,	0x0A93,	%o7
loop_1632:
	sdivx	%g6,	0x0806,	%o5
	xor	%g7,	%i2,	%g5
loop_1633:
	addccc	%g4,	%i5,	%i0
	xnorcc	%o2,	0x061A,	%l2
	edge16l	%o1,	%i3,	%o0
	smulcc	%l3,	0x0ADE,	%l0
	nop
	fitod	%f6,	%f14
	fdtos	%f14,	%f17
	alignaddr	%i1,	%g1,	%i7
	fbg,a	%fcc2,	loop_1634
	ldsw	[%l7 + 0x64],	%l6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	setx	0x0A5F45F00079E0A2,	%l0,	%l6
	stx	%l6,	[%l7 + 0x70]
	ldx	[%l7 + 0x70],	%fsr
loop_1634:
	taddcc	%g3,	0x0B83,	%o4
	ba,a	%icc,	loop_1635
	addccc	%g2,	%i4,	%l5
	ldub	[%l7 + 0x09],	%l4
	edge16	%i6,	%o6,	%l1
loop_1635:
	stbar
	te	%icc,	0x7
	fzeros	%f17
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmpne16	%f16,	%f24,	%o7
	array16	%g6,	%o5,	%o3
	set	0x50, %l0
	stba	%g7,	[%l7 + %l0] 0x80
	movcs	%icc,	%g5,	%i2
	fmovsge	%icc,	%f14,	%f11
	movrlz	%i5,	%g4,	%o2
	umul	%l2,	0x11C3,	%i0
	edge8n	%o1,	%o0,	%i3
	tge	%xcc,	0x7
	set	0x60, %o4
	lduba	[%l7 + %o4] 0x89,	%l0
	fbe	%fcc0,	loop_1636
	mulscc	%i1,	%l3,	%i7
	movne	%xcc,	%g1,	%l6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1636:
	sra	%o4,	0x1F,	%g2
	edge8	%i4,	%g3,	%l5
	movg	%icc,	%i6,	%l4
	fbl	%fcc0,	loop_1637
	tvs	%icc,	0x7
	nop
	setx	loop_1638,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movge	%xcc,	%o6,	%l1
loop_1637:
	subccc	%o7,	0x178C,	%g6
	fcmpeq32	%f30,	%f14,	%o5
loop_1638:
	edge8n	%o3,	%g5,	%i2
	movrgz	%g7,	0x16B,	%g4
	fornot1s	%f18,	%f18,	%f29
	fpadd32	%f14,	%f14,	%f14
	andncc	%o2,	%l2,	%i0
	nop
	set	0x08, %o1
	stb	%o1,	[%l7 + %o1]
	fmul8x16au	%f7,	%f29,	%f22
	edge16	%o0,	%i5,	%i3
	bgu	%icc,	loop_1639
	tneg	%xcc,	0x2
	mulx	%i1,	%l0,	%i7
	array16	%g1,	%l6,	%o4
loop_1639:
	ldsh	[%l7 + 0x6C],	%l3
	nop
	setx	0x88257BDD24619898,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0xCBCEE3F3325DC3EA,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	fdivd	%f10,	%f24,	%f22
	fnot1	%f24,	%f20
	udiv	%i4,	0x0DB1,	%g3
	umul	%l5,	%i6,	%g2
	movne	%xcc,	%o6,	%l1
	movrgez	%o7,	0x040,	%g6
	sra	%l4,	%o5,	%o3
	fmovdle	%icc,	%f7,	%f1
	sethi	0x0616,	%g5
	bneg,pt	%xcc,	loop_1640
	bvs	loop_1641
	stbar
	fbule,a	%fcc0,	loop_1642
loop_1640:
	mulscc	%i2,	0x02C9,	%g7
loop_1641:
	fbge,a	%fcc2,	loop_1643
	brlez	%o2,	loop_1644
loop_1642:
	lduw	[%l7 + 0x58],	%l2
	fmovs	%f28,	%f8
loop_1643:
	bg,a	loop_1645
loop_1644:
	movrlez	%g4,	%o1,	%i0
	fmovsg	%xcc,	%f27,	%f5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1645:
	udivcc	%o0,	0x0973,	%i3
	lduh	[%l7 + 0x7A],	%i1
	nop
	setx	0xCC12EC428052743B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x50]
	ldx	[%l7 + 0x50],	%fsr
	fzeros	%f27
	ta	%icc,	0x1
	popc	%l0,	%i7
	tg	%icc,	0x7
	udivcc	%i5,	0x0ADD,	%g1
	mova	%icc,	%o4,	%l3
	edge32ln	%i4,	%l6,	%g3
	movpos	%xcc,	%i6,	%g2
	lduw	[%l7 + 0x08],	%l5
	smul	%o6,	%l1,	%o7
	sllx	%g6,	0x1A,	%l4
	edge8ln	%o5,	%o3,	%i2
	wr	%g0,	0x2b,	%asi
	ldda	[%l7 + 0x20] %asi,	%g6
	mulscc	%o2,	%l2,	%g5
	fpadd32	%f14,	%f6,	%f28
	popc	0x16E8,	%o1
	tge	%icc,	0x5
	move	%icc,	%i0,	%g4
	movl	%icc,	%i3,	%o0
	bcs,a,pn	%icc,	loop_1646
	movcc	%icc,	%i1,	%l0
	tvs	%xcc,	0x0
	bne	%icc,	loop_1647
loop_1646:
	bn,pn	%icc,	loop_1648
	fcmpne16	%f28,	%f20,	%i5
	set	0x17, %i5
	ldsba	[%l7 + %i5] 0x14,	%g1
loop_1647:
	brnz	%i7,	loop_1649
loop_1648:
	fnegd	%f2,	%f26
	edge8ln	%l3,	%o4,	%i4
	subc	%g3,	0x0866,	%i6
loop_1649:
	orn	%l6,	%g2,	%o6
	srl	%l1,	0x11,	%l5
	tcc	%xcc,	0x1
	sdivcc	%o7,	0x12A3,	%l4
	tcc	%icc,	0x7
	edge8ln	%g6,	%o3,	%o5
	fcmpeq32	%f12,	%f12,	%i2
	edge8l	%o2,	%l2,	%g5
	membar	0x06
	orncc	%g7,	%o1,	%i0
	fbn	%fcc1,	loop_1650
	edge8	%i3,	%g4,	%o0
	array8	%l0,	%i1,	%i5
	fands	%f2,	%f9,	%f14
loop_1650:
	or	%i7,	%g1,	%o4
	srlx	%l3,	0x1E,	%g3
	ldsw	[%l7 + 0x4C],	%i6
	movge	%icc,	%i4,	%l6
	ldsb	[%l7 + 0x35],	%g2
	tvc	%icc,	0x1
	nop
	fitos	%f13,	%f27
	fstox	%f27,	%f10
	fxtos	%f10,	%f14
	edge32n	%l1,	%l5,	%o7
	array16	%l4,	%g6,	%o6
	fmovdg	%xcc,	%f14,	%f29
	add	%o5,	0x0192,	%i2
	fpadd32	%f2,	%f8,	%f4
	movrlez	%o3,	%l2,	%o2
	ldx	[%l7 + 0x58],	%g5
	movrlez	%o1,	0x0C2,	%i0
	or	%i3,	0x09FF,	%g4
	edge16l	%g7,	%l0,	%o0
	sethi	0x0A0F,	%i5
	fmovdcc	%xcc,	%f5,	%f25
	tvc	%icc,	0x1
	taddcctv	%i7,	0x1879,	%g1
	tcs	%xcc,	0x4
	lduw	[%l7 + 0x10],	%o4
	mulx	%l3,	%i1,	%i6
	fmovrdlz	%g3,	%f26,	%f0
	movcs	%icc,	%l6,	%i4
	fxor	%f10,	%f30,	%f18
	movle	%xcc,	%l1,	%l5
	sub	%o7,	0x1D8B,	%l4
	fcmpne16	%f16,	%f2,	%g6
	array32	%o6,	%o5,	%g2
	fmovrsne	%i2,	%f0,	%f25
	fxnor	%f28,	%f14,	%f22
	andn	%l2,	%o3,	%o2
	movvs	%icc,	%o1,	%g5
	array32	%i3,	%i0,	%g7
	srlx	%g4,	%l0,	%i5
	array16	%i7,	%o0,	%o4
	wr	%g0,	0x10,	%asi
	lduwa	[%l7 + 0x5C] %asi,	%g1
	tge	%xcc,	0x2
	tle	%icc,	0x5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	st	%f31,	[%l7 + 0x18]
	edge16	%l3,	%i1,	%g3
	orn	%l6,	0x1ED5,	%i4
	tcc	%icc,	0x4
	fmul8sux16	%f16,	%f14,	%f0
	fba,a	%fcc0,	loop_1651
	movvc	%xcc,	%l1,	%i6
	fands	%f27,	%f9,	%f6
	movleu	%icc,	%o7,	%l4
loop_1651:
	movl	%icc,	%l5,	%g6
	fornot1s	%f21,	%f30,	%f22
	movleu	%xcc,	%o6,	%g2
	subccc	%i2,	%l2,	%o5
	tl	%icc,	0x3
	movcs	%icc,	%o2,	%o1
	edge16	%g5,	%i3,	%i0
	fbue	%fcc0,	loop_1652
	addcc	%o3,	%g4,	%l0
	wr	%g0,	0xe2,	%asi
	ldda	[%l7 + 0x50] %asi,	%g6
loop_1652:
	nop
	setx loop_1653, %l0, %l1
	jmpl %l1, %i7
	brz	%o0,	loop_1654
	ld	[%l7 + 0x70],	%f6
	sdivcc	%o4,	0x00C4,	%g1
loop_1653:
	fbo,a	%fcc2,	loop_1655
loop_1654:
	mova	%icc,	%i5,	%i1
	membar	0x13
	fmovrdlz	%l3,	%f10,	%f28
loop_1655:
	tle	%xcc,	0x4
	smulcc	%l6,	0x1E5E,	%i4
	edge32	%l1,	%i6,	%o7
	fzeros	%f24
	tcc	%xcc,	0x6
	fbne	%fcc2,	loop_1656
	movneg	%xcc,	%l4,	%g3
	fbu,a	%fcc3,	loop_1657
	fble,a	%fcc1,	loop_1658
loop_1656:
	movl	%xcc,	%l5,	%o6
	fcmpne32	%f10,	%f20,	%g2
loop_1657:
	movne	%xcc,	%g6,	%i2
loop_1658:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbg	%fcc2,	loop_1659
	movn	%icc,	%l2,	%o5
	tvs	%icc,	0x1
	fpmerge	%f17,	%f2,	%f14
loop_1659:
	edge32	%o1,	%g5,	%o2
	array8	%i3,	%o3,	%i0
	movg	%icc,	%g4,	%g7
	bcc	loop_1660
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xor	%l0,	0x1EAC,	%o0
	fmul8sux16	%f6,	%f30,	%f18
loop_1660:
	brz,a	%i7,	loop_1661
	movrgez	%o4,	0x16E,	%i5
	ba,pt	%xcc,	loop_1662
	andn	%i1,	0x1EB0,	%l3
loop_1661:
	fmovdgu	%xcc,	%f23,	%f10
	or	%g1,	0x1E97,	%i4
loop_1662:
	alignaddr	%l6,	%l1,	%o7
	tle	%icc,	0x0
	mova	%icc,	%i6,	%l4
	tleu	%icc,	0x7
	fbue	%fcc0,	loop_1663
	addccc	%g3,	0x00FB,	%o6
	movrlz	%l5,	0x151,	%g6
	udivcc	%i2,	0x0CAD,	%l2
loop_1663:
	tcc	%icc,	0x6
	sdiv	%o5,	0x0105,	%g2
	fbn,a	%fcc3,	loop_1664
	sll	%o1,	0x1C,	%o2
	tl	%icc,	0x4
	edge16l	%i3,	%g5,	%i0
loop_1664:
	fbul	%fcc0,	loop_1665
	tl	%xcc,	0x6
	orn	%g4,	0x119E,	%g7
	set	0x38, %g6
	prefetcha	[%l7 + %g6] 0x19,	 0x3
loop_1665:
	ldsw	[%l7 + 0x60],	%o0
	tsubcctv	%i7,	0x06B9,	%l0
	edge32ln	%i5,	%o4,	%i1
	movle	%xcc,	%g1,	%i4
	alignaddr	%l6,	%l3,	%o7
	fmovscc	%xcc,	%f28,	%f2
	fxnor	%f12,	%f6,	%f26
	wr	%g0,	0x80,	%asi
	lduha	[%l7 + 0x4A] %asi,	%i6
	fpadd16	%f14,	%f20,	%f26
	sethi	0x0037,	%l1
	nop
	set	0x76, %o5
	ldstub	[%l7 + %o5],	%g3
	movne	%xcc,	%l4,	%l5
	sdivcc	%g6,	0x00E4,	%i2
	xnorcc	%o6,	%l2,	%o5
	ta	%icc,	0x0
	edge8ln	%g2,	%o1,	%i3
	nop
	setx loop_1666, %l0, %l1
	jmpl %l1, %g5
	fbl	%fcc3,	loop_1667
	fmovrsne	%i0,	%f26,	%f4
	movn	%icc,	%g4,	%g7
loop_1666:
	edge8	%o3,	%o0,	%o2
loop_1667:
	fmovse	%xcc,	%f16,	%f12
	fmuld8sux16	%f28,	%f26,	%f6
	nop
	setx	0xFFECCC07121CECED,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0xB64B641769DD86CF,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	fsubd	%f24,	%f28,	%f10
	fbge,a	%fcc2,	loop_1668
	fbue	%fcc2,	loop_1669
	tneg	%xcc,	0x7
	fornot1s	%f15,	%f25,	%f23
loop_1668:
	orncc	%i7,	%i5,	%o4
loop_1669:
	fnot1s	%f6,	%f28
	bne,a,pt	%xcc,	loop_1670
	fcmple32	%f0,	%f10,	%l0
	subc	%i1,	0x1FB3,	%g1
	fbn,a	%fcc0,	loop_1671
loop_1670:
	fpackfix	%f24,	%f16
	fmovsvc	%icc,	%f9,	%f29
	fmul8x16au	%f7,	%f24,	%f26
loop_1671:
	fnot2s	%f8,	%f24
	smulcc	%i4,	%l3,	%l6
	ldd	[%l7 + 0x50],	%o6
	movrgez	%l1,	0x187,	%g3
	fbg,a	%fcc3,	loop_1672
	orcc	%i6,	%l4,	%g6
	taddcc	%i2,	0x0AE1,	%o6
	subc	%l5,	0x052F,	%l2
loop_1672:
	movrlez	%g2,	0x1E3,	%o5
	tcc	%xcc,	0x1
	fmovrdlz	%o1,	%f16,	%f8
	fpack16	%f6,	%f31
	tcs	%icc,	0x7
	addc	%g5,	%i3,	%g4
	set	0x58, %i6
	ldxa	[%l7 + %i6] 0x11,	%i0
	smulcc	%o3,	0x16D6,	%g7
	subc	%o2,	%o0,	%i7
	edge8l	%o4,	%l0,	%i5
	movrlz	%g1,	%i1,	%l3
	ldstub	[%l7 + 0x45],	%l6
	fmuld8ulx16	%f22,	%f7,	%f2
	brz,a	%o7,	loop_1673
	edge16n	%l1,	%i4,	%g3
	fmovrse	%l4,	%f25,	%f25
	tvc	%icc,	0x2
loop_1673:
	andncc	%g6,	%i6,	%o6
	xorcc	%i2,	0x0BA5,	%l2
	movg	%icc,	%g2,	%l5
	fone	%f6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srlx	%o5,	0x16,	%g5
	alignaddr	%i3,	%o1,	%g4
	ldub	[%l7 + 0x36],	%o3
	tcc	%xcc,	0x2
	lduh	[%l7 + 0x5E],	%g7
	bvs,a	loop_1674
	udivx	%o2,	0x1C06,	%i0
	fnot1	%f28,	%f12
	mulx	%o0,	%i7,	%l0
loop_1674:
	xnor	%i5,	%g1,	%i1
	fmovsvs	%icc,	%f29,	%f7
	taddcc	%l3,	%o4,	%o7
	srax	%l6,	0x0C,	%i4
	fzero	%f10
	edge32n	%g3,	%l4,	%l1
	st	%f17,	[%l7 + 0x50]
	movl	%xcc,	%g6,	%i6
	fpadd16s	%f7,	%f10,	%f31
	movrgz	%o6,	%l2,	%i2
	flush	%l7 + 0x48
	fbne,a	%fcc2,	loop_1675
	nop
	setx loop_1676, %l0, %l1
	jmpl %l1, %l5
	fmovsvs	%icc,	%f29,	%f6
	tgu	%xcc,	0x6
loop_1675:
	edge8	%o5,	%g2,	%g5
loop_1676:
	orcc	%o1,	0x0211,	%i3
	andncc	%o3,	%g7,	%o2
	call	loop_1677
	movcs	%xcc,	%g4,	%i0
	udivcc	%i7,	0x026A,	%l0
	fble	%fcc0,	loop_1678
loop_1677:
	te	%icc,	0x4
	add	%o0,	0x0839,	%g1
	subccc	%i5,	0x1511,	%l3
loop_1678:
	alignaddr	%i1,	%o7,	%o4
	ld	[%l7 + 0x70],	%f30
	xor	%l6,	0x1827,	%g3
	movge	%icc,	%i4,	%l4
	taddcctv	%g6,	%l1,	%o6
	set	0x7C, %g3
	lduwa	[%l7 + %g3] 0x88,	%i6
	fnor	%f0,	%f8,	%f22
	st	%f13,	[%l7 + 0x78]
	edge8	%l2,	%l5,	%i2
	wr	%g0,	0x19,	%asi
	stxa	%g2,	[%l7 + 0x08] %asi
	fmovd	%f12,	%f2
	movleu	%xcc,	%g5,	%o1
	fcmple32	%f22,	%f30,	%o5
	brlz,a	%o3,	loop_1679
	movcc	%xcc,	%g7,	%i3
	tsubcctv	%g4,	0x09C5,	%i0
	tleu	%icc,	0x1
loop_1679:
	addcc	%i7,	%o2,	%l0
	flush	%l7 + 0x44
	xorcc	%o0,	0x1132,	%i5
	movn	%xcc,	%l3,	%i1
	fpack32	%f6,	%f14,	%f20
	move	%xcc,	%g1,	%o7
	fbug,a	%fcc0,	loop_1680
	lduh	[%l7 + 0x30],	%o4
	tn	%xcc,	0x3
	movg	%icc,	%l6,	%i4
loop_1680:
	fmovsneg	%icc,	%f6,	%f2
	sllx	%g3,	%g6,	%l4
	edge16	%o6,	%i6,	%l2
	movpos	%xcc,	%l1,	%l5
	taddcctv	%g2,	%g5,	%o1
	ldsh	[%l7 + 0x2C],	%i2
	ldx	[%l7 + 0x20],	%o5
	fmuld8ulx16	%f3,	%f22,	%f30
	add	%l7,	0x6C,	%l6
	wr	%g0,	0x10,	%asi
	casa	[%l6] %asi,	%g7,	%i3
	brlez	%g4,	loop_1681
	movleu	%icc,	%o3,	%i7
	bgu,a	loop_1682
	sir	0x019B
loop_1681:
	te	%icc,	0x1
	taddcctv	%o2,	%i0,	%l0
loop_1682:
	ldsh	[%l7 + 0x78],	%i5
	tcs	%icc,	0x5
	fbu	%fcc1,	loop_1683
	tn	%icc,	0x0
	xor	%o0,	0x0841,	%i1
	edge8l	%g1,	%o7,	%l3
loop_1683:
	tgu	%xcc,	0x2
	and	%o4,	%l6,	%i4
	tcs	%icc,	0x5
	bshuffle	%f30,	%f18,	%f6
	fmovdne	%icc,	%f12,	%f1
	edge8n	%g3,	%l4,	%o6
	edge16ln	%g6,	%i6,	%l1
	andn	%l2,	%g2,	%g5
	movge	%xcc,	%o1,	%i2
	sll	%l5,	0x0A,	%g7
	be,pt	%xcc,	loop_1684
	fandnot1s	%f19,	%f10,	%f7
	bleu,pn	%icc,	loop_1685
	tne	%xcc,	0x5
loop_1684:
	stw	%i3,	[%l7 + 0x24]
	std	%f18,	[%l7 + 0x50]
loop_1685:
	addccc	%g4,	%o5,	%o3
	tl	%xcc,	0x7
	fmovdcc	%xcc,	%f6,	%f22
	movrlez	%i7,	%o2,	%l0
	or	%i0,	%i5,	%o0
	fxors	%f22,	%f1,	%f23
	smulcc	%i1,	%o7,	%l3
	lduh	[%l7 + 0x52],	%g1
	edge16n	%l6,	%i4,	%o4
	tgu	%icc,	0x0
	bge,pn	%xcc,	loop_1686
	movne	%xcc,	%g3,	%o6
	ta	%xcc,	0x3
	bvs,a,pn	%xcc,	loop_1687
loop_1686:
	sethi	0x1610,	%g6
	array16	%l4,	%l1,	%i6
	sethi	0x05A9,	%l2
loop_1687:
	bl,a,pt	%icc,	loop_1688
	tl	%icc,	0x7
	movpos	%xcc,	%g5,	%g2
	movl	%xcc,	%o1,	%l5
loop_1688:
	edge8	%g7,	%i2,	%i3
	movvc	%xcc,	%g4,	%o3
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
	fzero	%f4
	fbu	%fcc0,	loop_1690
	array16	%i7,	%o2,	%l0
loop_1689:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrne	%i0,	%o5,	%o0
loop_1690:
	sra	%i1,	%i5,	%o7
	fmovdvc	%icc,	%f3,	%f13
	srax	%l3,	0x0D,	%g1
	movle	%icc,	%i4,	%o4
	array32	%g3,	%o6,	%g6
	nop
	set	0x5A, %i4
	stb	%l6,	[%l7 + %i4]
	fnand	%f0,	%f8,	%f4
	movle	%xcc,	%l4,	%i6
	smul	%l1,	0x1899,	%l2
	wr	%g0,	0x10,	%asi
	ldsha	[%l7 + 0x34] %asi,	%g2
	call	loop_1691
	umul	%g5,	%l5,	%o1
	edge8ln	%g7,	%i3,	%g4
	andn	%o3,	%i2,	%o2
loop_1691:
	addccc	%l0,	0x1B19,	%i7
	fmovdne	%icc,	%f15,	%f15
	movgu	%icc,	%o5,	%o0
	movneg	%xcc,	%i0,	%i5
	sra	%o7,	0x08,	%l3
	nop
	setx loop_1692, %l0, %l1
	jmpl %l1, %i1
	tvc	%xcc,	0x1
	fbue	%fcc1,	loop_1693
	st	%f31,	[%l7 + 0x5C]
loop_1692:
	fpack16	%f30,	%f16
	fpack16	%f2,	%f26
loop_1693:
	addc	%i4,	0x09B0,	%o4
	nop
	setx loop_1694, %l0, %l1
	jmpl %l1, %g3
	fmovrdgz	%g1,	%f14,	%f8
	mulscc	%o6,	%l6,	%l4
	nop
	setx	0x1EECA9BFD3ACE9B3,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0x38F734CD13F2CE51,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	faddd	%f12,	%f0,	%f22
loop_1694:
	andcc	%i6,	%l1,	%g6
	fcmpne16	%f0,	%f4,	%l2
	sra	%g5,	0x0D,	%g2
	andcc	%o1,	0x1088,	%l5
	sllx	%g7,	%g4,	%o3
	fmovsle	%xcc,	%f20,	%f20
	tsubcc	%i3,	%i2,	%l0
	movrgez	%i7,	0x256,	%o5
	movgu	%xcc,	%o2,	%o0
	udivx	%i5,	0x0826,	%i0
	movg	%xcc,	%o7,	%l3
	alignaddr	%i4,	%o4,	%i1
	fone	%f10
	fmovdne	%xcc,	%f10,	%f11
	set	0x18, %l1
	ldsha	[%l7 + %l1] 0x0c,	%g3
	nop
	setx	loop_1695,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	andcc	%o6,	0x18E6,	%l6
	nop
	fitod	%f0,	%f16
	fdtox	%f16,	%f0
	fxtod	%f0,	%f30
	edge16	%l4,	%i6,	%l1
loop_1695:
	tsubcctv	%g6,	0x04CD,	%l2
	tcc	%icc,	0x0
	nop 	! 	nop 	! 	wr	%g0,	0x40,	%asi ripped by fixASI40.pl ripped by fixASI40.pl
	nop 	! 	nop 	! 	ldxa	[%g0 + 0x1a8] %asi,	%g5 ripped by fixASI40.pl ripped by fixASI40.pl
	set	0x0C, %g5
	lduha	[%l7 + %g5] 0x89,	%g2
	tg	%icc,	0x6
	tvc	%icc,	0x5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmul8ulx16	%f6,	%f20,	%f28
	edge32n	%o1,	%l5,	%g1
	wr	%g0,	0x0c,	%asi
	lduba	[%l7 + 0x43] %asi,	%g4
	array8	%o3,	%g7,	%i3
	xnorcc	%i2,	0x014A,	%i7
	tvs	%xcc,	0x7
	ldd	[%l7 + 0x70],	%f28
	bcc	%icc,	loop_1696
	ldd	[%l7 + 0x30],	%l0
	tgu	%icc,	0x6
	fmovrse	%o2,	%f20,	%f3
loop_1696:
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
	fblg,a	%fcc0,	loop_1697
	taddcctv	%o5,	0x0883,	%o0
	movrgez	%i5,	0x241,	%o7
	fblg,a	%fcc1,	loop_1698
loop_1697:
	movl	%xcc,	%l3,	%i0
	movleu	%icc,	%i4,	%i1
	addccc	%g3,	0x1000,	%o4
loop_1698:
	tsubcctv	%l6,	0x16D9,	%o6
	set	0x18, %g1
	stha	%l4,	[%l7 + %g1] 0x81
	set	0x14, %g2
	stba	%i6,	[%l7 + %g2] 0x22
	membar	#Sync
	sub	%l1,	0x0490,	%g6
	fbg	%fcc3,	loop_1699
	fmovdneg	%xcc,	%f5,	%f26
	edge8ln	%g5,	%l2,	%g2
	subc	%l5,	%g1,	%g4
loop_1699:
	mulscc	%o3,	0x17CD,	%o1
	tcc	%icc,	0x2
	edge32n	%g7,	%i2,	%i7
	movn	%xcc,	%l0,	%i3
	srax	%o2,	0x04,	%o0
	fpack16	%f28,	%f8
	tleu	%icc,	0x7
	movgu	%xcc,	%i5,	%o7
	add	%l7,	0x50,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%l3
	casa	[%l6] %asi,	%l3,	%i0
	smulcc	%o5,	%i1,	%g3
	fmul8sux16	%f4,	%f26,	%f20
	taddcc	%i4,	0x13C3,	%l6
	fors	%f16,	%f31,	%f24
	fmovd	%f20,	%f22
	movneg	%icc,	%o4,	%o6
	nop
	fitod	%f10,	%f26
	fdtox	%f26,	%f28
	udiv	%l4,	0x1028,	%i6
	edge8n	%l1,	%g6,	%g5
	tgu	%xcc,	0x0
	ldsb	[%l7 + 0x7F],	%g2
	nop
	fitod	%f6,	%f12
	fdtoi	%f12,	%f16
	subc	%l5,	%g1,	%g4
	wr	%g0,	0x11,	%asi
	ldstuba	[%l7 + 0x66] %asi,	%o3
	srlx	%l2,	%g7,	%i2
	sra	%i7,	0x17,	%o1
	set	0x14, %l3
	sta	%f31,	[%l7 + %l3] 0x0c
	bvs,pn	%icc,	loop_1700
	fmovsle	%icc,	%f12,	%f15
	smulcc	%l0,	0x1F38,	%i3
	ldsw	[%l7 + 0x48],	%o0
loop_1700:
	fornot2	%f12,	%f14,	%f6
	xnor	%i5,	%o2,	%l3
	set	0x30, %i7
	stwa	%o7,	[%l7 + %i7] 0x2f
	membar	#Sync
	umulcc	%i0,	%o5,	%g3
	fornot1s	%f9,	%f12,	%f5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tl	%icc,	0x7
	fmovrsne	%i4,	%f7,	%f9
	sir	0x17CD
	edge16n	%i1,	%l6,	%o6
	sdivx	%l4,	0x0D35,	%o4
	fnot1s	%f14,	%f23
	mulx	%i6,	0x00D4,	%l1
	wr	%g0,	0x81,	%asi
	prefetcha	[%l7 + 0x60] %asi,	 0x2
	movg	%xcc,	%g2,	%g6
	stw	%l5,	[%l7 + 0x3C]
	faligndata	%f28,	%f28,	%f24
	orn	%g4,	%o3,	%g1
	fbn	%fcc0,	loop_1701
	movcc	%icc,	%g7,	%i2
	fbo,a	%fcc2,	loop_1702
	tcc	%xcc,	0x1
loop_1701:
	tn	%icc,	0x5
	fxnors	%f10,	%f0,	%f16
loop_1702:
	movne	%xcc,	%i7,	%l2
	udivx	%o1,	0x1C0E,	%l0
	fmul8x16al	%f27,	%f19,	%f14
	fmovdvs	%icc,	%f1,	%f7
	nop
	fitos	%f4,	%f12
	tne	%icc,	0x0
	add	%l7,	0x78,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] %asi,	%o0,	%i3
	fcmpeq32	%f12,	%f4,	%i5
	movrlez	%o2,	%l3,	%o7
	fmovrsne	%i0,	%f20,	%f27
	bgu	loop_1703
	stbar
	fandnot2s	%f4,	%f15,	%f11
	edge16n	%o5,	%g3,	%i4
loop_1703:
	nop
	set	0x1A, %i0
	stba	%l6,	[%l7 + %i0] 0xea
	membar	#Sync
	tge	%icc,	0x6
	movleu	%xcc,	%o6,	%i1
	fbu	%fcc3,	loop_1704
	andn	%l4,	0x0BD6,	%o4
	movneg	%xcc,	%l1,	%i6
	tg	%icc,	0x6
loop_1704:
	movrgz	%g5,	%g2,	%g6
	bne	%xcc,	loop_1705
	subc	%g4,	0x009E,	%l5
	tge	%icc,	0x1
	movrlz	%g1,	%o3,	%g7
loop_1705:
	nop
	add	%l7,	0x48,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%i2
	casxa	[%l6] 0x80,	%i2,	%l2
	nop
	setx	0x53EE0EDF,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f20
	setx	0x266AAF96,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f11
	fadds	%f11,	%f20,	%f16
	tne	%xcc,	0x2
	bvs	%xcc,	loop_1706
	fandnot2s	%f3,	%f13,	%f25
	fmovdvs	%xcc,	%f25,	%f8
	bpos,pt	%xcc,	loop_1707
loop_1706:
	andn	%o1,	0x1F79,	%l0
	sll	%o0,	%i7,	%i5
	bg	%xcc,	loop_1708
loop_1707:
	tneg	%xcc,	0x6
	fmovdcs	%icc,	%f12,	%f2
	fornot2	%f16,	%f16,	%f28
loop_1708:
	fmovsleu	%icc,	%f27,	%f6
	movg	%icc,	%o2,	%l3
	alignaddr	%i3,	%o7,	%o5
	movrne	%i0,	%g3,	%i4
	fxnor	%f4,	%f14,	%f6
	brgz	%o6,	loop_1709
	edge16	%l6,	%l4,	%i1
	addcc	%o4,	0x05D2,	%i6
	fmovde	%xcc,	%f5,	%f26
loop_1709:
	fmovrsne	%l1,	%f14,	%f28
	movrne	%g2,	%g5,	%g4
	for	%f10,	%f28,	%f12
	std	%f12,	[%l7 + 0x58]
	movneg	%icc,	%g6,	%l5
	faligndata	%f0,	%f26,	%f26
	set	0x40, %l5
	ldda	[%l7 + %l5] 0x04,	%f0
	fmovde	%icc,	%f21,	%f26
	fmovdge	%icc,	%f12,	%f21
	add	%o3,	0x0EE9,	%g7
	tsubcc	%i2,	%l2,	%o1
	sll	%g1,	0x05,	%o0
	movrlz	%i7,	%l0,	%o2
	set	0x48, %o0
	ldswa	[%l7 + %o0] 0x81,	%i5
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
	tge	%icc,	0x3
	sllx	%i3,	0x18,	%l3
	fmovd	%f18,	%f22
loop_1710:
	bgu,pt	%icc,	loop_1711
	bvs,a	%xcc,	loop_1712
	move	%xcc,	%o7,	%i0
	fmovsgu	%xcc,	%f29,	%f17
loop_1711:
	addc	%g3,	0x19A4,	%o5
loop_1712:
	addcc	%i4,	0x0008,	%l6
	call	loop_1713
	udiv	%l4,	0x077C,	%i1
	fcmpgt32	%f14,	%f26,	%o6
	movrlez	%i6,	%o4,	%l1
loop_1713:
	nop
	setx	loop_1714,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	umul	%g2,	0x042A,	%g4
	lduw	[%l7 + 0x24],	%g5
	fmovrde	%l5,	%f20,	%f24
loop_1714:
	nop
	fitos	%f4,	%f26
	fstoi	%f26,	%f31
	subc	%o3,	0x184F,	%g7
	movl	%icc,	%i2,	%g6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	setx	loop_1715,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	addc	%l2,	0x145F,	%g1
	umul	%o0,	0x049F,	%i7
	fbl	%fcc2,	loop_1716
loop_1715:
	movgu	%icc,	%o1,	%l0
	andcc	%i5,	0x1B6C,	%i3
	movge	%icc,	%l3,	%o7
loop_1716:
	andn	%i0,	%g3,	%o5
	fbn,a	%fcc1,	loop_1717
	udivcc	%o2,	0x1E59,	%l6
	fmovsneg	%xcc,	%f0,	%f6
	srax	%i4,	0x17,	%l4
loop_1717:
	nop
	setx	0x73DCC992FD83E9D6,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0x46CF87BC9D067FD3,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	faddd	%f24,	%f6,	%f10
	fmovsge	%xcc,	%f15,	%f14
	fandnot2	%f12,	%f24,	%f2
	fmul8x16au	%f22,	%f13,	%f28
	edge8ln	%i1,	%i6,	%o6
	sth	%l1,	[%l7 + 0x2C]
	smul	%o4,	0x1217,	%g4
	bge,a,pn	%xcc,	loop_1718
	movrlz	%g2,	0x056,	%g5
	or	%o3,	0x00FB,	%g7
	fmovrde	%i2,	%f8,	%f28
loop_1718:
	tvc	%xcc,	0x3
	xorcc	%g6,	%l5,	%l2
	bvc,pn	%icc,	loop_1719
	bvs,a	loop_1720
	movl	%icc,	%o0,	%g1
	movcs	%xcc,	%o1,	%i7
loop_1719:
	fpmerge	%f24,	%f15,	%f0
loop_1720:
	xnorcc	%l0,	%i3,	%l3
	fexpand	%f8,	%f4
	nop
	setx loop_1721, %l0, %l1
	jmpl %l1, %i5
	tne	%icc,	0x0
	edge8l	%i0,	%g3,	%o7
	wr	%g0,	0x18,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
loop_1721:
	mulx	%o2,	%o5,	%i4
	sir	0x1A80
	movgu	%icc,	%l6,	%i1
	movneg	%xcc,	%l4,	%i6
	movne	%xcc,	%l1,	%o6
	fornot1	%f24,	%f0,	%f20
	tg	%icc,	0x3
	movvs	%icc,	%o4,	%g2
	umulcc	%g5,	%g4,	%o3
	movl	%icc,	%i2,	%g6
	nop
	set	0x1E, %l2
	sth	%l5,	[%l7 + %l2]
	fbue,a	%fcc2,	loop_1722
	fmovrslz	%g7,	%f27,	%f8
	sir	0x1044
	fcmpne16	%f18,	%f18,	%o0
loop_1722:
	fbule,a	%fcc1,	loop_1723
	xnor	%g1,	%o1,	%l2
	edge16ln	%i7,	%i3,	%l0
	andn	%l3,	0x01F4,	%i5
loop_1723:
	or	%i0,	0x1202,	%o7
	sethi	0x1005,	%g3
	brnz,a	%o5,	loop_1724
	addcc	%i4,	%l6,	%i1
	fnor	%f26,	%f30,	%f6
	stbar
loop_1724:
	edge8	%l4,	%i6,	%l1
	edge16ln	%o2,	%o6,	%g2
	tgu	%xcc,	0x4
	tcc	%icc,	0x0
	fmovsl	%xcc,	%f8,	%f7
	nop
	setx	0x85632F81,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f20
	setx	0x0D14AFFD,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f19
	fadds	%f19,	%f20,	%f2
	subcc	%g5,	0x160D,	%g4
	movrlz	%o4,	0x151,	%i2
	sra	%g6,	0x1F,	%o3
	ldd	[%l7 + 0x68],	%g6
	mulscc	%o0,	%g1,	%o1
	nop
	setx	0x71EC7B1B68CC9738,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	setx	0x82DA6C512BD6CCEA,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fmuld	%f0,	%f18,	%f24
	tge	%icc,	0x5
	sdivcc	%l2,	0x0027,	%l5
	tpos	%icc,	0x4
	movneg	%xcc,	%i7,	%i3
	xorcc	%l0,	0x1258,	%l3
	movn	%xcc,	%i5,	%o7
	sdivx	%g3,	0x0652,	%i0
	fpadd16	%f8,	%f10,	%f12
	fmovdle	%icc,	%f11,	%f12
	ba	%xcc,	loop_1725
	fble	%fcc2,	loop_1726
	brgez	%i4,	loop_1727
	addcc	%l6,	%i1,	%o5
loop_1725:
	movre	%l4,	0x1B3,	%i6
loop_1726:
	orncc	%l1,	%o2,	%g2
loop_1727:
	tcs	%xcc,	0x1
	array32	%o6,	%g5,	%g4
	alignaddrl	%o4,	%i2,	%o3
	movn	%icc,	%g6,	%o0
	tle	%xcc,	0x1
	edge32ln	%g1,	%o1,	%l2
	popc	%g7,	%i7
	fcmpne16	%f20,	%f0,	%i3
	fmovsleu	%icc,	%f7,	%f3
	sll	%l0,	0x03,	%l5
	flush	%l7 + 0x2C
	sll	%l3,	%o7,	%i5
	movl	%xcc,	%g3,	%i4
	array8	%l6,	%i0,	%o5
	edge16n	%l4,	%i1,	%l1
	tcc	%xcc,	0x2
	tgu	%icc,	0x3
	movgu	%xcc,	%i6,	%o2
	wr	%g0,	0x2f,	%asi
	stha	%o6,	[%l7 + 0x52] %asi
	membar	#Sync
	fabsd	%f6,	%f20
	fnor	%f28,	%f28,	%f4
	fzero	%f24
	bge	%xcc,	loop_1728
	add	%g5,	%g4,	%g2
	fmovrde	%o4,	%f26,	%f10
	edge32	%i2,	%g6,	%o3
loop_1728:
	tsubcctv	%g1,	%o0,	%o1
	add	%g7,	0x1285,	%i7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbue,a	%fcc2,	loop_1729
	bneg,a	loop_1730
	bge	%xcc,	loop_1731
	nop
	setx	0x507F183F,	%l0,	%l6
	st	%l6,	[%l7 + 0x64]
	ld	[%l7 + 0x64],	%fsr
loop_1729:
	nop
	setx	0xB62F926E,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f1
	setx	0x49924D9C,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f18
	fdivs	%f18,	%f1,	%f21
loop_1730:
	tle	%icc,	0x3
loop_1731:
	udiv	%i3,	0x12BB,	%l2
	udivx	%l5,	0x070A,	%l0
	membar	#Sync
	set	0x40, %o2
	ldda	[%l7 + %o2] 0xf8,	%f0
	movgu	%icc,	%l3,	%i5
	sra	%o7,	%i4,	%g3
	edge8ln	%l6,	%i0,	%l4
	fbul,a	%fcc0,	loop_1732
	movn	%icc,	%o5,	%l1
	fabss	%f12,	%f20
	xnor	%i1,	0x0300,	%o2
loop_1732:
	sra	%i6,	0x00,	%g5
	sub	%g4,	%o6,	%o4
	fone	%f22
	fmul8sux16	%f0,	%f30,	%f18
	set	0x58, %o3
	stxa	%g2,	[%l7 + %o3] 0x11
	fpsub32	%f30,	%f18,	%f0
	subccc	%i2,	0x163E,	%o3
	tne	%xcc,	0x7
	tl	%xcc,	0x3
	bgu,a	%xcc,	loop_1733
	fbug,a	%fcc2,	loop_1734
	addc	%g6,	%o0,	%g1
	sir	0x0801
loop_1733:
	sth	%o1,	[%l7 + 0x4A]
loop_1734:
	movcc	%icc,	%i7,	%i3
	movvc	%xcc,	%l2,	%l5
	tl	%xcc,	0x1
	fbo,a	%fcc3,	loop_1735
	prefetch	[%l7 + 0x30],	 0x0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bneg	%icc,	loop_1736
loop_1735:
	movpos	%xcc,	%g7,	%l3
	movcs	%xcc,	%l0,	%o7
	nop
	setx	loop_1737,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_1736:
	xnor	%i5,	%i4,	%g3
	and	%i0,	0x1071,	%l4
	tl	%icc,	0x1
loop_1737:
	nop
	setx	0x4D520F27,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f9
	setx	0x71966F12,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f18
	fdivs	%f18,	%f9,	%f28
	subcc	%o5,	%l6,	%l1
	fmovde	%xcc,	%f9,	%f20
	tcc	%icc,	0x1
	andn	%o2,	%i1,	%i6
	fbl,a	%fcc0,	loop_1738
	nop
	setx	loop_1739,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	nop
	setx	0x34FBB4BA83B048EC,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0x177192AA93BD5B93,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	fsubd	%f12,	%f30,	%f2
	swap	[%l7 + 0x18],	%g4
loop_1738:
	fbl	%fcc3,	loop_1740
loop_1739:
	edge16l	%g5,	%o6,	%o4
	tleu	%icc,	0x1
	tneg	%xcc,	0x3
loop_1740:
	srax	%g2,	%o3,	%i2
	movrlez	%g6,	0x297,	%o0
	movcc	%icc,	%g1,	%o1
	umul	%i3,	%l2,	%i7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orncc	%g7,	%l5,	%l0
	movn	%icc,	%l3,	%i5
	fmovrdne	%o7,	%f16,	%f18
	movrgz	%i4,	0x0C4,	%g3
	smul	%i0,	%l4,	%l6
	addccc	%o5,	%o2,	%l1
	tpos	%icc,	0x2
	sdivx	%i1,	0x0E88,	%i6
	fcmpne32	%f14,	%f28,	%g5
	fblg,a	%fcc1,	loop_1741
	fmovrdgz	%g4,	%f18,	%f22
	addc	%o4,	0x194B,	%o6
	addc	%o3,	%i2,	%g6
loop_1741:
	sethi	0x1C79,	%o0
	alignaddr	%g1,	%o1,	%g2
	brlz	%i3,	loop_1742
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sllx	%i7,	0x05,	%g7
	tne	%icc,	0x1
loop_1742:
	nop
	setx	loop_1743,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fmovsg	%xcc,	%f21,	%f31
	umul	%l2,	0x0A20,	%l5
	orn	%l0,	0x1683,	%i5
loop_1743:
	smul	%l3,	%i4,	%o7
	fbule	%fcc0,	loop_1744
	tcc	%xcc,	0x7
	fmovrsgez	%i0,	%f19,	%f1
	fmovdle	%xcc,	%f22,	%f19
loop_1744:
	edge32n	%l4,	%g3,	%o5
	tn	%xcc,	0x3
	fmul8ulx16	%f28,	%f20,	%f14
	fmovrdgz	%l6,	%f8,	%f18
	or	%l1,	%o2,	%i6
	mulscc	%i1,	%g5,	%g4
	udiv	%o4,	0x0F4E,	%o3
	orcc	%i2,	%o6,	%o0
	movle	%xcc,	%g6,	%o1
	fpadd16	%f26,	%f4,	%f10
	fornot1s	%f8,	%f17,	%f21
	fabss	%f2,	%f17
	nop
	setx	0x5B58E15357B85B0E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0x5688384591B7ED24,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	fsubd	%f30,	%f8,	%f0
	bpos,a	loop_1745
	tl	%icc,	0x5
	bvc	loop_1746
	umulcc	%g2,	%i3,	%i7
loop_1745:
	tvs	%icc,	0x1
	tcs	%xcc,	0x5
loop_1746:
	subcc	%g7,	%g1,	%l5
	sllx	%l2,	0x12,	%l0
	nop
	setx	0x54DF6124,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f31
	setx	0xF94DA7E8,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f17
	fsubs	%f17,	%f31,	%f11
	xnorcc	%i5,	0x0774,	%i4
	set	0x70, %i3
	stxa	%l3,	[%l7 + %i3] 0x2f
	membar	#Sync
	srax	%i0,	0x15,	%l4
	fmovdvc	%icc,	%f23,	%f7
	edge16	%g3,	%o5,	%l6
	ldd	[%l7 + 0x30],	%f28
	st	%f26,	[%l7 + 0x10]
	sra	%o7,	0x15,	%l1
	orncc	%i6,	%i1,	%g5
	brnz	%o2,	loop_1747
	ldd	[%l7 + 0x70],	%f10
	wr	%g0,	0x11,	%asi
	swapa	[%l7 + 0x74] %asi,	%o4
loop_1747:
	nop
	setx	loop_1748,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	sub	%g4,	%i2,	%o3
	movpos	%icc,	%o6,	%g6
	srlx	%o1,	0x19,	%o0
loop_1748:
	add	%i3,	%i7,	%g2
	orncc	%g7,	%l5,	%g1
	movleu	%xcc,	%l2,	%i5
	brgez	%l0,	loop_1749
	movn	%xcc,	%l3,	%i0
	set	0x52, %i1
	stha	%l4,	[%l7 + %i1] 0x04
loop_1749:
	edge8n	%i4,	%g3,	%l6
	edge16l	%o7,	%l1,	%i6
	sir	0x09A2
	ldx	[%l7 + 0x68],	%o5
	popc	0x1F5F,	%g5
	edge16	%i1,	%o2,	%g4
	nop
	setx	0x3777BE017058DA71,	%l0,	%l6
	stx	%l6,	[%l7 + 0x48]
	ldx	[%l7 + 0x48],	%fsr
	srax	%i2,	0x17,	%o3
	subcc	%o4,	%o6,	%o1
	te	%xcc,	0x2
	andncc	%o0,	%g6,	%i3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fxor	%f30,	%f0,	%f6
	fmovrsgz	%g2,	%f0,	%f4
	lduh	[%l7 + 0x56],	%g7
	tsubcc	%i7,	0x0F65,	%g1
	orcc	%l2,	%i5,	%l5
	stw	%l0,	[%l7 + 0x7C]
	bg,a,pn	%xcc,	loop_1750
	subccc	%l3,	%i0,	%i4
	edge16	%l4,	%l6,	%g3
	srlx	%o7,	%i6,	%o5
loop_1750:
	bneg	%xcc,	loop_1751
	tl	%xcc,	0x1
	tvc	%xcc,	0x7
	udiv	%g5,	0x0B52,	%l1
loop_1751:
	tcs	%icc,	0x4
	sllx	%i1,	0x01,	%g4
	set	0x3A, %o7
	lduha	[%l7 + %o7] 0x81,	%o2
	fnot2s	%f5,	%f8
	edge8ln	%o3,	%o4,	%o6
	edge16n	%i2,	%o0,	%o1
	wr	%g0,	0x11,	%asi
	lduba	[%l7 + 0x26] %asi,	%i3
	wr	%g0,	0x19,	%asi
	ldsba	[%l7 + 0x12] %asi,	%g6
	edge16l	%g7,	%i7,	%g1
	fmovrslez	%g2,	%f29,	%f4
	movrlez	%l2,	%l5,	%l0
	sra	%i5,	%l3,	%i0
	bvs,pn	%icc,	loop_1752
	prefetch	[%l7 + 0x3C],	 0x2
	sdiv	%i4,	0x063A,	%l4
	brgez	%g3,	loop_1753
loop_1752:
	fnand	%f26,	%f18,	%f18
	xnor	%l6,	%o7,	%o5
	stx	%g5,	[%l7 + 0x20]
loop_1753:
	sdivcc	%i6,	0x05BD,	%l1
	nop
	setx loop_1754, %l0, %l1
	jmpl %l1, %g4
	fxor	%f26,	%f4,	%f0
	fones	%f6
	orcc	%i1,	%o3,	%o2
loop_1754:
	ta	%icc,	0x5
	nop
	setx	0x3B24C2BCDE09BA39,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0x0C0F7AFC7EFB2BED,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	fsubd	%f30,	%f20,	%f14
	movrlz	%o4,	0x2F0,	%i2
	fpadd32	%f2,	%f26,	%f12
	udivx	%o6,	0x0055,	%o1
	wr	%g0,	0x89,	%asi
	ldxa	[%l7 + 0x08] %asi,	%i3
	fmovsne	%icc,	%f29,	%f17
	addcc	%g6,	%g7,	%i7
	bl,a	%xcc,	loop_1755
	fmovdpos	%icc,	%f30,	%f12
	ble	%icc,	loop_1756
	add	%g1,	%o0,	%l2
loop_1755:
	bne,pt	%xcc,	loop_1757
	subc	%g2,	%l0,	%i5
loop_1756:
	nop
	wr	%g0,	0x80,	%asi
	ldxa	[%l7 + 0x40] %asi,	%l3
loop_1757:
	fnegd	%f16,	%f26
	andncc	%i0,	%i4,	%l4
	edge32	%l5,	%g3,	%o7
	alignaddr	%o5,	%g5,	%l6
	fmovrsne	%i6,	%f13,	%f20
	sdivcc	%l1,	0x0EC6,	%i1
	taddcctv	%o3,	%g4,	%o4
	andcc	%o2,	0x18E3,	%i2
	fbue,a	%fcc0,	loop_1758
	fblg,a	%fcc1,	loop_1759
	movgu	%xcc,	%o1,	%i3
	wr	%g0,	0x04,	%asi
	sta	%f11,	[%l7 + 0x4C] %asi
loop_1758:
	edge8l	%g6,	%g7,	%o6
loop_1759:
	tle	%icc,	0x3
	bcs,pt	%xcc,	loop_1760
	fbne	%fcc3,	loop_1761
	fblg	%fcc3,	loop_1762
	fpack32	%f24,	%f0,	%f22
loop_1760:
	edge8ln	%g1,	%o0,	%l2
loop_1761:
	fbu,a	%fcc3,	loop_1763
loop_1762:
	fabsd	%f10,	%f24
	edge32n	%g2,	%l0,	%i5
	wr	%g0,	0x11,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
loop_1763:
	fmul8x16	%f30,	%f28,	%f10
	movle	%xcc,	%i7,	%i0
	xnor	%l3,	0x1BE7,	%i4
	fnot2s	%f29,	%f27
	fbu,a	%fcc3,	loop_1764
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array8	%l5,	%g3,	%l4
	addc	%o7,	%g5,	%o5
loop_1764:
	and	%l6,	0x1CB0,	%l1
	movneg	%xcc,	%i1,	%o3
	subccc	%i6,	%g4,	%o2
	tcs	%xcc,	0x4
	fmovrde	%o4,	%f26,	%f26
	tcc	%xcc,	0x0
	tg	%icc,	0x3
	bleu,a,pn	%icc,	loop_1765
	sra	%i2,	%o1,	%i3
	edge8	%g6,	%g7,	%g1
	edge8l	%o6,	%o0,	%g2
loop_1765:
	movneg	%xcc,	%l0,	%l2
	fmovdleu	%xcc,	%f29,	%f26
	tge	%xcc,	0x0
	movvs	%icc,	%i7,	%i5
	srl	%l3,	%i0,	%l5
	bpos,pt	%icc,	loop_1766
	or	%i4,	0x08A2,	%g3
	movneg	%icc,	%l4,	%o7
	orcc	%g5,	0x1D60,	%l6
loop_1766:
	sdivcc	%l1,	0x0406,	%i1
	taddcc	%o3,	0x0F51,	%o5
	orn	%g4,	%i6,	%o2
	fbo	%fcc2,	loop_1767
	tsubcc	%o4,	%o1,	%i2
	nop
	fitod	%f10,	%f14
	fdtox	%f14,	%f12
	fxtod	%f12,	%f24
	tneg	%xcc,	0x7
loop_1767:
	movrne	%g6,	%i3,	%g1
	movre	%g7,	0x377,	%o6
	movg	%icc,	%g2,	%o0
	wr	%g0,	0x04,	%asi
	ldstuba	[%l7 + 0x45] %asi,	%l2
	movrgez	%i7,	0x22E,	%i5
	andcc	%l0,	%i0,	%l3
	membar	0x2A
	movg	%xcc,	%i4,	%l5
	tn	%xcc,	0x5
	nop
	setx	0x2B0C5C3A,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f31
	setx	0xA7DF5CAF,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f28
	fadds	%f28,	%f31,	%f18
	membar	0x09
	bne,a,pn	%icc,	loop_1768
	fandnot2s	%f23,	%f17,	%f18
	bcc,a,pt	%icc,	loop_1769
	orncc	%l4,	%o7,	%g3
loop_1768:
	bl,a	%xcc,	loop_1770
	ldsh	[%l7 + 0x28],	%l6
loop_1769:
	fbul	%fcc1,	loop_1771
	brgez,a	%g5,	loop_1772
loop_1770:
	movrlz	%i1,	%l1,	%o5
	sll	%g4,	0x1B,	%o3
loop_1771:
	tleu	%icc,	0x4
loop_1772:
	fcmpgt16	%f28,	%f16,	%o2
	tvc	%icc,	0x4
	movleu	%xcc,	%o4,	%i6
	srl	%i2,	%o1,	%i3
	set	0x78, %g7
	lduwa	[%l7 + %g7] 0x81,	%g6
	movvc	%xcc,	%g7,	%o6
	movvs	%xcc,	%g1,	%o0
	fnor	%f28,	%f8,	%f4
	tl	%xcc,	0x2
	set	0x52, %l6
	stha	%l2,	[%l7 + %l6] 0x88
	movn	%xcc,	%g2,	%i5
	umulcc	%l0,	0x076B,	%i7
	movrgez	%i0,	%i4,	%l3
	nop
	setx	loop_1773,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	sdivcc	%l5,	0x1AE1,	%l4
	tsubcctv	%o7,	0x14C9,	%g3
	sub	%g5,	%i1,	%l1
loop_1773:
	movvs	%icc,	%l6,	%o5
	nop
	fitos	%f5,	%f29
	fstox	%f29,	%f14
	fxtos	%f14,	%f11
	sir	0x0A41
	nop
	setx	0x6B1D44B67B7FD727,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0x6FB009A18444E61D,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	fdivd	%f28,	%f0,	%f24
	fzero	%f24
	tsubcctv	%o3,	0x0ABB,	%o2
	mulx	%o4,	%i6,	%g4
	movleu	%xcc,	%i2,	%o1
	edge8ln	%g6,	%i3,	%g7
	xnorcc	%g1,	0x1715,	%o0
	addccc	%l2,	0x10FB,	%o6
	movrne	%g2,	%i5,	%l0
	udivcc	%i7,	0x04AD,	%i4
	tpos	%icc,	0x5
	fmovrsgz	%l3,	%f30,	%f11
	movvs	%icc,	%i0,	%l4
	fsrc1	%f8,	%f22
	tgu	%xcc,	0x7
	array8	%o7,	%g3,	%l5
	tl	%xcc,	0x6
	nop
	setx loop_1774, %l0, %l1
	jmpl %l1, %i1
	or	%g5,	0x0FDA,	%l6
	tgu	%icc,	0x2
	wr	%g0,	0x0c,	%asi
	lda	[%l7 + 0x28] %asi,	%f0
loop_1774:
	brgz,a	%o5,	loop_1775
	movl	%icc,	%o3,	%o2
	tl	%icc,	0x1
	sdivx	%l1,	0x1065,	%i6
loop_1775:
	tleu	%icc,	0x3
	nop
	fitos	%f2,	%f1
	fstox	%f1,	%f16
	fxtos	%f16,	%f9
	fxnors	%f11,	%f19,	%f1
	prefetch	[%l7 + 0x24],	 0x3
	addc	%o4,	%i2,	%g4
	tge	%icc,	0x6
	movrgez	%g6,	%o1,	%g7
	te	%xcc,	0x5
	orcc	%g1,	0x1DA7,	%o0
	fmovsvc	%icc,	%f8,	%f5
	wr	%g0,	0x19,	%asi
	swapa	[%l7 + 0x64] %asi,	%i3
	movneg	%xcc,	%l2,	%o6
	tle	%xcc,	0x0
	andcc	%i5,	%l0,	%i7
	movre	%g2,	0x2E1,	%l3
	bleu,a	%icc,	loop_1776
	nop
	set	0x0F, %l4
	stb	%i4,	[%l7 + %l4]
	tge	%icc,	0x7
	move	%xcc,	%l4,	%o7
loop_1776:
	edge16l	%g3,	%l5,	%i0
	nop
	fitos	%f10,	%f29
	fstod	%f29,	%f30
	edge16n	%g5,	%i1,	%o5
	srax	%o3,	%o2,	%l1
	ldub	[%l7 + 0x56],	%i6
	tne	%icc,	0x4
	brgez,a	%l6,	loop_1777
	te	%xcc,	0x0
	addcc	%i2,	%o4,	%g4
	wr	%g0,	0x80,	%asi
	lduwa	[%l7 + 0x0C] %asi,	%g6
loop_1777:
	nop
	set	0x220, %i2
	stxa	%g7,	[%g0 + %i2] 0x52
	tgu	%icc,	0x3
	fbn,a	%fcc1,	loop_1778
	lduh	[%l7 + 0x14],	%o1
	ld	[%l7 + 0x54],	%f9
	movpos	%icc,	%g1,	%i3
loop_1778:
	umulcc	%o0,	%o6,	%i5
	udivcc	%l0,	0x1067,	%l2
	movcs	%icc,	%g2,	%i7
	movcc	%icc,	%l3,	%l4
	fmovsne	%icc,	%f16,	%f27
	edge8n	%i4,	%g3,	%o7
	smulcc	%i0,	0x114E,	%g5
	bpos,a	%xcc,	loop_1779
	ldsb	[%l7 + 0x16],	%i1
	ldsh	[%l7 + 0x3A],	%l5
	fbn,a	%fcc2,	loop_1780
loop_1779:
	move	%icc,	%o3,	%o2
	subc	%l1,	0x01D9,	%o5
	fcmple16	%f26,	%f28,	%l6
loop_1780:
	fbne,a	%fcc2,	loop_1781
	fmovscs	%xcc,	%f20,	%f11
	subcc	%i6,	%i2,	%o4
	wr	%g0,	0x52,	%asi
	stxa	%g4,	[%g0 + 0x220] %asi
loop_1781:
	fmovsn	%icc,	%f1,	%f19
	ba	%xcc,	loop_1782
	taddcctv	%g6,	0x00EA,	%g7
	taddcc	%o1,	0x1725,	%i3
	fpmerge	%f13,	%f7,	%f16
loop_1782:
	movrne	%o0,	0x1FA,	%g1
	sir	0x0D79
	fbue,a	%fcc0,	loop_1783
	srl	%o6,	0x15,	%i5
	sdivx	%l2,	0x0A4B,	%l0
	fones	%f19
loop_1783:
	movcc	%icc,	%g2,	%l3
	movrgez	%l4,	0x04A,	%i7
	addccc	%i4,	0x1163,	%o7
	tvc	%xcc,	0x0
	array16	%g3,	%i0,	%i1
	sub	%g5,	%l5,	%o3
	prefetch	[%l7 + 0x58],	 0x2
	ldsw	[%l7 + 0x6C],	%l1
	stx	%o5,	[%l7 + 0x30]
	wr	%g0,	0x0c,	%asi
	stba	%o2,	[%l7 + 0x50] %asi
	srax	%l6,	0x11,	%i2
	nop
	fitos	%f8,	%f13
	fstox	%f13,	%f4
	fxtos	%f4,	%f14
	alignaddr	%o4,	%g4,	%g6
	nop
	fitod	%f12,	%f14
	fdtox	%f14,	%f26
	or	%g7,	0x02A4,	%o1
	taddcc	%i3,	0x05A5,	%o0
	fble,a	%fcc0,	loop_1784
	brgz	%g1,	loop_1785
	nop
	setx	0x9066E84E,	%l0,	%l6
	st	%l6,	[%l7 + 0x78]
	ld	[%l7 + 0x78],	%fsr
	xnor	%o6,	%i5,	%i6
loop_1784:
	edge8l	%l0,	%l2,	%l3
loop_1785:
	fpsub16	%f26,	%f24,	%f0
	addccc	%g2,	0x10EB,	%l4
	fmovrdgez	%i4,	%f2,	%f4
	fzero	%f18
	bg	loop_1786
	tl	%xcc,	0x2
	fmul8x16	%f4,	%f14,	%f24
	sethi	0x045E,	%i7
loop_1786:
	smulcc	%g3,	%o7,	%i1
	fblg	%fcc0,	loop_1787
	movneg	%xcc,	%i0,	%l5
	movvc	%xcc,	%g5,	%l1
	tvc	%icc,	0x1
loop_1787:
	edge8l	%o3,	%o5,	%o2
	taddcc	%i2,	0x0ED0,	%o4
	fmovsne	%xcc,	%f1,	%f5
	udivx	%g4,	0x0C6E,	%g6
	mulscc	%g7,	0x1E6C,	%o1
	movre	%l6,	%o0,	%g1
	fblg	%fcc1,	loop_1788
	movgu	%icc,	%o6,	%i3
	nop
	fitod	%f10,	%f8
	fdtoi	%f8,	%f17
	fbo,a	%fcc2,	loop_1789
loop_1788:
	membar	0x64
	fmovspos	%xcc,	%f9,	%f2
	ldd	[%l7 + 0x70],	%i4
loop_1789:
	bcc,pn	%icc,	loop_1790
	nop
	setx	loop_1791,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fbue	%fcc2,	loop_1792
	fcmpne32	%f10,	%f20,	%l0
loop_1790:
	brgez,a	%i6,	loop_1793
loop_1791:
	edge16l	%l2,	%l3,	%g2
loop_1792:
	move	%icc,	%l4,	%i4
	tvs	%icc,	0x4
loop_1793:
	addccc	%i7,	0x0071,	%g3
	stw	%o7,	[%l7 + 0x40]
	fxor	%f24,	%f2,	%f2
	movl	%xcc,	%i0,	%l5
	stw	%g5,	[%l7 + 0x28]
	udiv	%l1,	0x1111,	%o3
	movgu	%icc,	%o5,	%o2
	bneg,a	%icc,	loop_1794
	edge32ln	%i1,	%o4,	%g4
	tg	%icc,	0x5
	edge16l	%i2,	%g6,	%o1
loop_1794:
	tpos	%xcc,	0x7
	sethi	0x1C6B,	%l6
	fbue	%fcc1,	loop_1795
	umulcc	%o0,	0x09A7,	%g1
	std	%f12,	[%l7 + 0x70]
	fsrc1s	%f19,	%f17
loop_1795:
	movcs	%xcc,	%o6,	%i3
	fbn	%fcc0,	loop_1796
	sub	%i5,	0x0193,	%l0
	and	%i6,	%g7,	%l2
	srax	%g2,	0x19,	%l3
loop_1796:
	ldsb	[%l7 + 0x2B],	%l4
	xnor	%i4,	%i7,	%g3
	fandnot2s	%f0,	%f10,	%f7
	addcc	%i0,	%l5,	%g5
	bpos,a,pt	%xcc,	loop_1797
	bcs,a	loop_1798
	sdiv	%l1,	0x0045,	%o3
	tg	%xcc,	0x7
loop_1797:
	mulx	%o7,	%o5,	%o2
loop_1798:
	nop
	fitod	%f1,	%f16
	srax	%i1,	0x14,	%g4
	tg	%xcc,	0x6
	subcc	%o4,	0x07A2,	%g6
	movvc	%xcc,	%o1,	%i2
	wr	%g0,	0x81,	%asi
	sta	%f4,	[%l7 + 0x64] %asi
	fbug,a	%fcc3,	loop_1799
	fba,a	%fcc1,	loop_1800
	fmovda	%xcc,	%f4,	%f2
	ldsw	[%l7 + 0x60],	%o0
loop_1799:
	sethi	0x084E,	%l6
loop_1800:
	edge8	%o6,	%i3,	%i5
	orncc	%l0,	0x1C08,	%i6
	nop
	set	0x08, %g4
	lduw	[%l7 + %g4],	%g7
	fbuge,a	%fcc1,	loop_1801
	fmovscs	%xcc,	%f28,	%f31
	fmovrse	%g1,	%f24,	%f15
	call	loop_1802
loop_1801:
	addccc	%g2,	0x01CE,	%l3
	wr	%g0,	0xe3,	%asi
	stha	%l2,	[%l7 + 0x2A] %asi
	membar	#Sync
loop_1802:
	fbge,a	%fcc2,	loop_1803
	movvs	%icc,	%i4,	%i7
	sth	%l4,	[%l7 + 0x2C]
	tsubcc	%g3,	0x1B9B,	%i0
loop_1803:
	ldx	[%l7 + 0x50],	%g5
	ldx	[%l7 + 0x30],	%l5
	andcc	%o3,	0x004A,	%l1
	xorcc	%o7,	0x0130,	%o5
	tcs	%xcc,	0x6
	movne	%xcc,	%i1,	%o2
	subcc	%o4,	0x1493,	%g6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbu	%fcc0,	loop_1804
	nop
	setx	0x90DA83000EDB2290,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0xF77D0E2C9E15925E,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	fsubd	%f26,	%f22,	%f12
	sll	%o1,	%g4,	%o0
	wr	%g0,	0x11,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
loop_1804:
	popc	%l6,	%i2
	te	%icc,	0x1
	fmovdpos	%icc,	%f20,	%f31
	movleu	%icc,	%i3,	%i5
	wr	%g0,	0x19,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	ba,pn	%xcc,	loop_1805
	tpos	%icc,	0x2
	tgu	%xcc,	0x1
	tcc	%xcc,	0x6
loop_1805:
	sllx	%o6,	%i6,	%g7
	srl	%l0,	0x05,	%g1
	brnz,a	%l3,	loop_1806
	fbo,a	%fcc0,	loop_1807
	nop
	setx	0xDBD2964D,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f11
	fsqrts	%f11,	%f24
	tne	%icc,	0x2
loop_1806:
	fmovsle	%xcc,	%f4,	%f1
loop_1807:
	nop
	set	0x40, %l0
	stda	%f0,	[%l7 + %l0] 0x0c
	edge8ln	%g2,	%i4,	%i7
	xnorcc	%l4,	%l2,	%i0
	addc	%g5,	0x034D,	%l5
	mova	%icc,	%o3,	%l1
	smul	%g3,	0x15AB,	%o5
	fbg	%fcc0,	loop_1808
	udiv	%o7,	0x0C56,	%i1
	movneg	%xcc,	%o4,	%g6
	fmovrslez	%o1,	%f6,	%f10
loop_1808:
	and	%o2,	0x09B6,	%o0
	sdivx	%g4,	0x193D,	%l6
	umulcc	%i2,	%i3,	%i5
	add	%i6,	%o6,	%l0
	tvc	%icc,	0x0
	be	%xcc,	loop_1809
	fmovrslez	%g7,	%f19,	%f21
	add	%l7,	0x10,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%l3,	%g2
loop_1809:
	nop
	set	0x40, %o4
	sta	%f23,	[%l7 + %o4] 0x0c
	fmul8sux16	%f0,	%f22,	%f16
	sub	%i4,	0x059A,	%i7
	movrlez	%l4,	%l2,	%i0
	nop
	setx	0xC3615FE8F27FFA70,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	fsqrtd	%f14,	%f28
	fbg,a	%fcc1,	loop_1810
	fmovsneg	%icc,	%f14,	%f31
	fbe	%fcc1,	loop_1811
	xnorcc	%g1,	0x04DA,	%g5
loop_1810:
	movvc	%xcc,	%o3,	%l1
	fbu,a	%fcc0,	loop_1812
loop_1811:
	tl	%icc,	0x0
	tsubcctv	%l5,	0x1FDB,	%o5
	stx	%g3,	[%l7 + 0x48]
loop_1812:
	fbu	%fcc2,	loop_1813
	umulcc	%o7,	%i1,	%g6
	fpadd16s	%f12,	%f26,	%f24
	stb	%o4,	[%l7 + 0x20]
loop_1813:
	movneg	%xcc,	%o1,	%o2
	edge16l	%g4,	%l6,	%o0
	for	%f20,	%f4,	%f14
	nop
	setx	0x9062416A,	%l0,	%l6
	st	%l6,	[%l7 + 0x48]
	ld	[%l7 + 0x48],	%fsr
	array16	%i3,	%i5,	%i2
	nop
	fitod	%f16,	%f10
	lduh	[%l7 + 0x3E],	%i6
	fmovsneg	%icc,	%f12,	%f30
	orn	%o6,	0x1905,	%l0
	nop
	set	0x30, %o6
	ldd	[%l7 + %o6],	%f30
	movrgez	%g7,	%g2,	%i4
	srlx	%i7,	%l4,	%l2
	movvc	%xcc,	%l3,	%i0
	wr	%g0,	0xea,	%asi
	stha	%g1,	[%l7 + 0x60] %asi
	membar	#Sync
	fmovdne	%xcc,	%f27,	%f7
	ldsb	[%l7 + 0x19],	%o3
	bn,pt	%icc,	loop_1814
	movge	%icc,	%l1,	%l5
	tvs	%icc,	0x2
	edge32l	%o5,	%g5,	%g3
loop_1814:
	fnot2	%f0,	%f8
	mova	%xcc,	%i1,	%g6
	movneg	%icc,	%o7,	%o1
	fmovsle	%icc,	%f15,	%f18
	bcs,a,pt	%icc,	loop_1815
	edge32n	%o4,	%o2,	%l6
	edge32	%o0,	%i3,	%i5
	movrgez	%g4,	%i2,	%o6
loop_1815:
	brlez	%i6,	loop_1816
	movrgez	%l0,	0x396,	%g2
	wr	%g0,	0x11,	%asi
	sta	%f9,	[%l7 + 0x70] %asi
loop_1816:
	nop
	wr	%g0,	0x0c,	%asi
	lduha	[%l7 + 0x20] %asi,	%i4
	set	0x08, %i5
	lda	[%l7 + %i5] 0x15,	%f21
	edge16ln	%g7,	%l4,	%l2
	fmovdcc	%xcc,	%f22,	%f23
	sdivx	%i7,	0x16C1,	%i0
	xnorcc	%g1,	%l3,	%o3
	movl	%icc,	%l1,	%l5
	fmovsle	%xcc,	%f26,	%f26
	orcc	%g5,	0x1226,	%o5
	movle	%icc,	%g3,	%i1
	wr	%g0,	0xe2,	%asi
	stba	%g6,	[%l7 + 0x66] %asi
	membar	#Sync
	fmovrdne	%o1,	%f0,	%f24
	stbar
	brlz	%o7,	loop_1817
	fpackfix	%f16,	%f24
	alignaddr	%o4,	%l6,	%o0
	prefetch	[%l7 + 0x58],	 0x2
loop_1817:
	fmovrde	%o2,	%f12,	%f18
	smul	%i5,	%i3,	%g4
	movle	%xcc,	%i2,	%i6
	movn	%icc,	%l0,	%g2
	ta	%xcc,	0x7
	fnot2s	%f29,	%f18
	andn	%i4,	0x033A,	%o6
	srlx	%l4,	%l2,	%g7
	fmovscc	%icc,	%f11,	%f13
	edge32	%i7,	%g1,	%i0
	movpos	%xcc,	%l3,	%l1
	movcc	%xcc,	%o3,	%g5
	xnorcc	%l5,	%g3,	%o5
	nop
	fitod	%f10,	%f28
	orcc	%i1,	0x0B02,	%g6
	fmovsge	%icc,	%f11,	%f4
	set	0x14, %g6
	lduwa	[%l7 + %g6] 0x81,	%o7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	setx	0x458AF104,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f9
	setx	0x03A59297,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f17
	fsubs	%f17,	%f9,	%f31
	subc	%o1,	%o4,	%l6
	popc	0x07EA,	%o2
	fba,a	%fcc1,	loop_1818
	movge	%xcc,	%i5,	%i3
	bvc	%icc,	loop_1819
	fmovdleu	%xcc,	%f7,	%f18
loop_1818:
	fblg,a	%fcc0,	loop_1820
	taddcc	%o0,	0x1BFE,	%i2
loop_1819:
	array8	%g4,	%l0,	%i6
	addcc	%g2,	%o6,	%i4
loop_1820:
	brgez	%l4,	loop_1821
	bn	%xcc,	loop_1822
	lduh	[%l7 + 0x58],	%l2
	orn	%i7,	%g1,	%i0
loop_1821:
	alignaddrl	%g7,	%l1,	%o3
loop_1822:
	brgz,a	%g5,	loop_1823
	nop
	setx	0x507EF91A,	%l0,	%l6
	st	%l6,	[%l7 + 0x50]
	ld	[%l7 + 0x50],	%fsr
	swap	[%l7 + 0x44],	%l5
	stbar
loop_1823:
	edge16ln	%l3,	%o5,	%i1
	set	0x16, %o1
	stba	%g6,	[%l7 + %o1] 0x22
	membar	#Sync
	fpadd16s	%f22,	%f4,	%f22
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mulx	%g3,	0x021C,	%o7
	fabsd	%f20,	%f8
	srlx	%o1,	0x1C,	%l6
	sth	%o4,	[%l7 + 0x40]
	fbl	%fcc3,	loop_1824
	umul	%o2,	0x0723,	%i3
	udiv	%o0,	0x144D,	%i5
	edge32	%i2,	%g4,	%l0
loop_1824:
	alignaddr	%i6,	%o6,	%i4
	movneg	%xcc,	%l4,	%g2
	edge32ln	%l2,	%i7,	%g1
	edge8l	%i0,	%g7,	%o3
	tleu	%xcc,	0x0
	srlx	%l1,	%g5,	%l3
	fmovdleu	%icc,	%f31,	%f18
	fnot2s	%f27,	%f23
	alignaddrl	%l5,	%o5,	%i1
	brz,a	%g3,	loop_1825
	fmovdneg	%xcc,	%f15,	%f12
	set	0x6C, %i6
	swapa	[%l7 + %i6] 0x10,	%o7
loop_1825:
	brlez	%g6,	loop_1826
	fzeros	%f4
	nop
	setx	0xDB7D95E2B07A0317,	%l0,	%l6
	stx	%l6,	[%l7 + 0x68]
	ldx	[%l7 + 0x68],	%fsr
	bvs,a,pn	%icc,	loop_1827
loop_1826:
	fmovrse	%l6,	%f20,	%f27
	taddcctv	%o1,	%o4,	%o2
	sethi	0x00A0,	%i3
loop_1827:
	nop
	wr	%g0,	0x04,	%asi
	ldstuba	[%l7 + 0x36] %asi,	%i5
	udivcc	%i2,	0x07EF,	%g4
	edge16	%l0,	%i6,	%o0
	fnot1s	%f25,	%f16
	fone	%f2
	brgez,a	%i4,	loop_1828
	movge	%icc,	%o6,	%l4
	subccc	%l2,	0x1A04,	%g2
	fbge,a	%fcc3,	loop_1829
loop_1828:
	orncc	%i7,	%g1,	%g7
	mova	%xcc,	%o3,	%i0
	andn	%l1,	0x1179,	%l3
loop_1829:
	fcmpne32	%f20,	%f10,	%g5
	alignaddrl	%l5,	%o5,	%g3
	mulscc	%o7,	0x1D56,	%g6
	ldd	[%l7 + 0x38],	%f20
	tneg	%xcc,	0x5
	nop
	setx	0x73D47320,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f7
	setx	0x575DE55E,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f31
	fmuls	%f31,	%f7,	%f4
	nop
	setx	0x104194E0,	%l0,	%l6
	st	%l6,	[%l7 + 0x2C]
	ld	[%l7 + 0x2C],	%fsr
	fbu,a	%fcc0,	loop_1830
	sll	%l6,	%o1,	%i1
	fandnot1s	%f30,	%f26,	%f2
	bvc,a,pn	%icc,	loop_1831
loop_1830:
	nop
	fitod	%f2,	%f26
	fdtox	%f26,	%f4
	ba,a,pt	%icc,	loop_1832
	fmovdcc	%xcc,	%f25,	%f22
loop_1831:
	subcc	%o4,	0x1155,	%o2
	tg	%xcc,	0x6
loop_1832:
	edge16ln	%i5,	%i3,	%i2
	orn	%g4,	%l0,	%o0
	tne	%icc,	0x7
	edge32l	%i6,	%o6,	%i4
	sra	%l2,	0x0C,	%l4
	faligndata	%f30,	%f10,	%f0
	tneg	%xcc,	0x4
	membar	0x2C
	fmovrdgz	%i7,	%f16,	%f4
	orcc	%g2,	%g7,	%o3
	srlx	%i0,	0x0D,	%g1
	subc	%l3,	%l1,	%g5
	addccc	%l5,	%g3,	%o5
	fbuge	%fcc1,	loop_1833
	ba,a	%icc,	loop_1834
	movne	%icc,	%o7,	%g6
	movne	%icc,	%l6,	%o1
loop_1833:
	ldub	[%l7 + 0x77],	%o4
loop_1834:
	movrlez	%o2,	%i1,	%i3
	tl	%icc,	0x1
	nop
	setx	0xABC02576,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f0
	setx	0x706C61F6,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f23
	fdivs	%f23,	%f0,	%f17
	srl	%i5,	0x0B,	%i2
	flush	%l7 + 0x44
	umulcc	%g4,	0x17A8,	%o0
	edge8l	%i6,	%l0,	%o6
	add	%l7,	0x60,	%l6
	wr	%g0,	0x19,	%asi
	casa	[%l6] 0x19,	%l2,	%i4
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x54] %asi,	%i7
	orn	%l4,	%g7,	%g2
	edge16n	%o3,	%g1,	%i0
	bneg,a	%xcc,	loop_1835
	fnor	%f2,	%f0,	%f22
	xnorcc	%l1,	0x1C93,	%g5
	brgez	%l5,	loop_1836
loop_1835:
	edge8	%l3,	%o5,	%g3
	fsrc2s	%f30,	%f13
	ldstub	[%l7 + 0x6C],	%o7
loop_1836:
	movpos	%icc,	%l6,	%o1
	fbu,a	%fcc2,	loop_1837
	tvc	%xcc,	0x5
	fnot2	%f12,	%f28
	edge16	%o4,	%g6,	%i1
loop_1837:
	tleu	%icc,	0x5
	array32	%i3,	%i5,	%i2
	fmovsg	%icc,	%f4,	%f2
	addcc	%g4,	0x13DB,	%o2
	bcc,a,pt	%icc,	loop_1838
	subcc	%i6,	0x060D,	%o0
	edge32n	%l0,	%o6,	%i4
	movle	%icc,	%l2,	%i7
loop_1838:
	andn	%g7,	0x0B09,	%l4
	array32	%g2,	%g1,	%i0
	fnot1	%f6,	%f20
	edge16l	%l1,	%o3,	%l5
	fpsub32	%f24,	%f0,	%f6
	fbul	%fcc3,	loop_1839
	nop
	setx	0xD97FCA6A1E9EC546,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	fsqrtd	%f16,	%f24
	tg	%xcc,	0x4
	fzeros	%f29
loop_1839:
	nop
	fitos	%f14,	%f28
	fstod	%f28,	%f22
	fxor	%f6,	%f0,	%f8
	sll	%g5,	%l3,	%o5
	sll	%g3,	0x1E,	%l6
	orncc	%o1,	%o4,	%o7
	fmovscc	%xcc,	%f5,	%f20
	edge16	%i1,	%i3,	%g6
	addcc	%i2,	%g4,	%o2
	addcc	%i5,	%i6,	%o0
	nop
	setx	0x204579C0,	%l0,	%l6
	st	%l6,	[%l7 + 0x50]
	ld	[%l7 + 0x50],	%fsr
	fbule	%fcc2,	loop_1840
	and	%o6,	0x0BF8,	%i4
	swap	[%l7 + 0x70],	%l0
	edge16	%i7,	%g7,	%l2
loop_1840:
	fmovse	%xcc,	%f21,	%f26
	array8	%l4,	%g1,	%i0
	udiv	%l1,	0x1BA9,	%g2
	tg	%icc,	0x1
	nop
	setx	loop_1841,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	sir	0x0E9E
	set	0x31, %o5
	stba	%o3,	[%l7 + %o5] 0x04
loop_1841:
	lduh	[%l7 + 0x48],	%l5
	tge	%icc,	0x5
	popc	0x148E,	%l3
	bcs,a,pn	%xcc,	loop_1842
	edge32l	%g5,	%g3,	%o5
	fmovrslez	%l6,	%f3,	%f19
	edge8ln	%o1,	%o7,	%o4
loop_1842:
	fornot2s	%f8,	%f1,	%f30
	fcmple32	%f4,	%f18,	%i3
	tge	%icc,	0x4
	lduw	[%l7 + 0x54],	%i1
	tvs	%icc,	0x4
	edge8n	%i2,	%g6,	%o2
	udivcc	%i5,	0x020F,	%g4
	bl,a,pt	%xcc,	loop_1843
	fnot1s	%f10,	%f28
	edge32l	%o0,	%o6,	%i6
	fble	%fcc0,	loop_1844
loop_1843:
	umul	%l0,	0x0488,	%i7
	fmovrdne	%i4,	%f28,	%f10
	subc	%g7,	%l4,	%l2
loop_1844:
	fandnot2	%f28,	%f22,	%f20
	fmovdcc	%icc,	%f30,	%f6
	edge16n	%g1,	%i0,	%l1
	bshuffle	%f26,	%f18,	%f18
	fmuld8ulx16	%f30,	%f0,	%f10
	subc	%g2,	0x0ECD,	%l5
	ldstub	[%l7 + 0x2E],	%l3
	edge8l	%o3,	%g3,	%g5
	sdiv	%l6,	0x0C9F,	%o5
	movg	%icc,	%o7,	%o1
	popc	0x1E09,	%o4
	popc	%i1,	%i2
	sll	%g6,	0x16,	%i3
	tle	%icc,	0x1
	popc	0x1DAD,	%o2
	array16	%g4,	%i5,	%o6
	fbne	%fcc0,	loop_1845
	fmovdcc	%xcc,	%f11,	%f18
	fblg,a	%fcc2,	loop_1846
	fones	%f24
loop_1845:
	edge16	%o0,	%l0,	%i7
	ldsh	[%l7 + 0x7C],	%i4
loop_1846:
	fmovsl	%icc,	%f19,	%f31
	edge32	%i6,	%l4,	%l2
	tcc	%xcc,	0x6
	lduh	[%l7 + 0x54],	%g1
	sdivcc	%g7,	0x0849,	%i0
	set	0x40, %i4
	ldda	[%l7 + %i4] 0x15,	%f0
	edge8n	%g2,	%l1,	%l5
	ldx	[%l7 + 0x18],	%l3
	set	0x68, %g3
	ldsha	[%l7 + %g3] 0x0c,	%o3
	fxor	%f8,	%f24,	%f14
	udivx	%g3,	0x1D3A,	%l6
	fandnot2	%f28,	%f20,	%f4
	fmovsg	%icc,	%f10,	%f22
	set	0x54, %l1
	lda	[%l7 + %l1] 0x88,	%f15
	tvc	%icc,	0x6
	fornot2	%f10,	%f18,	%f16
	movvs	%icc,	%o5,	%g5
	edge32ln	%o1,	%o7,	%o4
	wr	%g0,	0x89,	%asi
	lduba	[%l7 + 0x3B] %asi,	%i1
	movrne	%i2,	%i3,	%o2
	nop
	set	0x60, %g5
	ldd	[%l7 + %g5],	%g4
	fmovdcc	%icc,	%f2,	%f22
	fxnors	%f30,	%f13,	%f20
	set	0x14, %g1
	stwa	%g6,	[%l7 + %g1] 0x10
	brlz,a	%i5,	loop_1847
	ldub	[%l7 + 0x3A],	%o0
	brnz	%o6,	loop_1848
	tne	%xcc,	0x5
loop_1847:
	fbn	%fcc2,	loop_1849
	flush	%l7 + 0x1C
loop_1848:
	sra	%l0,	0x02,	%i4
	stb	%i7,	[%l7 + 0x7B]
loop_1849:
	fmovrse	%l4,	%f13,	%f0
	bn,pt	%xcc,	loop_1850
	andn	%l2,	%g1,	%i6
	xnor	%i0,	%g7,	%l1
	xnorcc	%l5,	%l3,	%g2
loop_1850:
	andcc	%g3,	%o3,	%l6
	movvc	%icc,	%g5,	%o5
	tn	%xcc,	0x0
	movvc	%icc,	%o7,	%o4
	fbg,a	%fcc0,	loop_1851
	tcc	%xcc,	0x3
	fornot1s	%f9,	%f5,	%f30
	movvs	%icc,	%i1,	%i2
loop_1851:
	bshuffle	%f28,	%f30,	%f8
	orn	%o1,	0x09C7,	%o2
	stw	%g4,	[%l7 + 0x08]
	tl	%xcc,	0x0
	movleu	%icc,	%i3,	%g6
	edge8ln	%i5,	%o6,	%o0
	flush	%l7 + 0x58
	nop
	setx	0x339684776BF9DD13,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0x3F8BB498F905F9D7,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	fdivd	%f8,	%f2,	%f4
	tge	%xcc,	0x2
	ldsw	[%l7 + 0x4C],	%l0
	fbn,a	%fcc1,	loop_1852
	addccc	%i4,	0x0623,	%l4
	and	%l2,	0x007C,	%g1
	edge16ln	%i7,	%i6,	%i0
loop_1852:
	srax	%g7,	%l1,	%l5
	nop
	fitos	%f5,	%f10
	fstoi	%f10,	%f2
	mulx	%g2,	%g3,	%l3
	fble,a	%fcc2,	loop_1853
	orcc	%l6,	0x162F,	%g5
	set	0x14, %g2
	lda	[%l7 + %g2] 0x18,	%f14
loop_1853:
	tsubcc	%o3,	0x0C5B,	%o5
	tl	%icc,	0x2
	taddcc	%o7,	%o4,	%i1
	fmovd	%f30,	%f26
	bcc,a	%icc,	loop_1854
	movleu	%icc,	%i2,	%o2
	fmovs	%f18,	%f22
	xnor	%g4,	%i3,	%g6
loop_1854:
	nop
	fitos	%f3,	%f8
	fstox	%f8,	%f2
	sir	0x0F05
	fbul,a	%fcc1,	loop_1855
	nop
	fitod	%f0,	%f26
	fdtos	%f26,	%f16
	movrlz	%o1,	%i5,	%o6
	orn	%o0,	%i4,	%l4
loop_1855:
	edge8n	%l2,	%l0,	%i7
	fbne	%fcc2,	loop_1856
	swap	[%l7 + 0x2C],	%i6
	edge8	%i0,	%g1,	%g7
	tne	%xcc,	0x6
loop_1856:
	nop
	fitod	%f6,	%f8
	fdtox	%f8,	%f30
	fbu	%fcc3,	loop_1857
	movvc	%icc,	%l5,	%l1
	mova	%icc,	%g3,	%g2
	fpackfix	%f28,	%f7
loop_1857:
	fmovdcc	%icc,	%f20,	%f5
	wr	%g0,	0x80,	%asi
	prefetcha	[%l7 + 0x28] %asi,	 0x0
	fbu,a	%fcc2,	loop_1858
	fmovsn	%xcc,	%f30,	%f11
	sllx	%g5,	0x1F,	%l6
	movrlz	%o3,	%o7,	%o4
loop_1858:
	movne	%xcc,	%o5,	%i2
	movrgz	%o2,	0x3F7,	%g4
	movrgz	%i1,	0x3F0,	%i3
	movneg	%xcc,	%g6,	%o1
	array32	%o6,	%i5,	%o0
	fmovda	%xcc,	%f6,	%f8
	nop
	setx	0x2A0FFD1B22B318B3,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	fsqrtd	%f2,	%f14
	smul	%l4,	%i4,	%l2
	fmovrse	%l0,	%f17,	%f10
	srl	%i7,	%i0,	%g1
	fnegd	%f22,	%f4
	mulx	%g7,	0x0B01,	%i6
	set	0x10, %l3
	ldda	[%l7 + %l3] 0xeb,	%l4
	udivcc	%l1,	0x1A97,	%g3
	edge32l	%l3,	%g5,	%l6
	fmovdge	%icc,	%f17,	%f27
	addcc	%g2,	0x1A0E,	%o3
	fbne	%fcc3,	loop_1859
	subcc	%o4,	0x1534,	%o7
	umulcc	%i2,	0x0509,	%o5
	te	%icc,	0x0
loop_1859:
	andncc	%o2,	%g4,	%i1
	edge8	%i3,	%o1,	%g6
	ldd	[%l7 + 0x78],	%o6
	movne	%xcc,	%o0,	%l4
	fbne,a	%fcc0,	loop_1860
	xnorcc	%i5,	%i4,	%l2
	movg	%icc,	%l0,	%i0
	fmuld8sux16	%f30,	%f22,	%f4
loop_1860:
	bge	loop_1861
	fpadd32	%f16,	%f28,	%f0
	lduw	[%l7 + 0x40],	%i7
	fmovsvs	%xcc,	%f1,	%f13
loop_1861:
	movpos	%xcc,	%g1,	%g7
	fcmpgt32	%f16,	%f10,	%i6
	be	loop_1862
	subccc	%l1,	%g3,	%l5
	lduw	[%l7 + 0x38],	%l3
	umulcc	%g5,	%g2,	%o3
loop_1862:
	umulcc	%o4,	0x18B8,	%o7
	tl	%icc,	0x1
	fornot2s	%f14,	%f31,	%f25
	tsubcc	%l6,	0x1104,	%i2
	xor	%o2,	%g4,	%i1
	edge16ln	%o5,	%o1,	%g6
	movrlez	%o6,	0x07C,	%o0
	alignaddr	%l4,	%i3,	%i5
	edge32n	%i4,	%l0,	%i0
	ldsh	[%l7 + 0x26],	%l2
	andncc	%g1,	%g7,	%i6
	subcc	%i7,	%g3,	%l5
	taddcc	%l3,	0x17F1,	%g5
	sethi	0x19BD,	%l1
	tgu	%icc,	0x4
	wr	%g0,	0x81,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	fbe	%fcc1,	loop_1863
	fmovse	%xcc,	%f23,	%f8
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrgez	%g2,	%o4,	%o7
loop_1863:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udivcc	%o3,	0x192E,	%l6
	nop
	fitos	%f7,	%f3
	fstox	%f3,	%f2
	fxtos	%f2,	%f10
	set	0x48, %i0
	ldswa	[%l7 + %i0] 0x88,	%o2
	fmovrdlez	%i2,	%f22,	%f30
	alignaddrl	%i1,	%o5,	%g4
	movgu	%xcc,	%o1,	%g6
	tcs	%xcc,	0x6
	ba,a	%xcc,	loop_1864
	xorcc	%o6,	%o0,	%l4
	movvc	%icc,	%i5,	%i4
	fbge	%fcc3,	loop_1865
loop_1864:
	xorcc	%l0,	%i0,	%i3
	fpackfix	%f24,	%f24
	nop
	fitod	%f0,	%f8
	fdtos	%f8,	%f13
loop_1865:
	edge16l	%g1,	%l2,	%g7
	edge8	%i6,	%i7,	%g3
	edge16	%l5,	%g5,	%l3
	addc	%g2,	%l1,	%o4
	ldd	[%l7 + 0x38],	%o2
	fmovrdne	%o7,	%f26,	%f26
	movrgez	%o2,	0x367,	%l6
	brlez	%i1,	loop_1866
	edge32	%i2,	%g4,	%o1
	subc	%g6,	0x1E26,	%o6
	orn	%o5,	%o0,	%i5
loop_1866:
	subc	%i4,	%l0,	%i0
	udiv	%l4,	0x0BF2,	%g1
	bg,pn	%icc,	loop_1867
	array32	%l2,	%i3,	%g7
	brlez	%i7,	loop_1868
	ta	%xcc,	0x0
loop_1867:
	swap	[%l7 + 0x0C],	%i6
	edge32ln	%g3,	%g5,	%l3
loop_1868:
	umul	%l5,	%l1,	%o4
	bvs,a,pt	%icc,	loop_1869
	movge	%xcc,	%g2,	%o3
	tvs	%icc,	0x5
	bshuffle	%f6,	%f22,	%f28
loop_1869:
	bgu,pt	%icc,	loop_1870
	bgu,pn	%xcc,	loop_1871
	sra	%o7,	%l6,	%o2
	nop
	setx	loop_1872,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_1870:
	orncc	%i2,	0x09DC,	%i1
loop_1871:
	sethi	0x1082,	%o1
	andcc	%g4,	%g6,	%o6
loop_1872:
	fmovrsne	%o0,	%f19,	%f31
	st	%f16,	[%l7 + 0x40]
	or	%o5,	%i5,	%i4
	fmovrse	%i0,	%f18,	%f30
	popc	%l4,	%l0
	alignaddrl	%l2,	%i3,	%g1
	movn	%xcc,	%g7,	%i6
	edge32l	%i7,	%g5,	%g3
	srl	%l5,	0x10,	%l1
	subc	%l3,	%g2,	%o3
	movrne	%o7,	%o4,	%o2
	brnz,a	%i2,	loop_1873
	sllx	%l6,	0x02,	%i1
	subc	%o1,	%g6,	%o6
	tn	%xcc,	0x0
loop_1873:
	fmovsn	%xcc,	%f3,	%f9
	brgez	%g4,	loop_1874
	orncc	%o0,	%i5,	%o5
	fcmpne16	%f30,	%f20,	%i4
	wr	%g0,	0x2a,	%asi
	stwa	%l4,	[%l7 + 0x40] %asi
	membar	#Sync
loop_1874:
	edge32n	%l0,	%l2,	%i3
	fmovdvs	%icc,	%f26,	%f29
	umulcc	%g1,	0x1325,	%g7
	fbn,a	%fcc2,	loop_1875
	ldstub	[%l7 + 0x32],	%i0
	addc	%i7,	0x1CC3,	%i6
	movrgz	%g3,	%g5,	%l1
loop_1875:
	nop
	wr	%g0,	0x10,	%asi
	sta	%f18,	[%l7 + 0x64] %asi
	flush	%l7 + 0x54
	udivcc	%l3,	0x0FD5,	%g2
	sub	%o3,	%l5,	%o7
	sub	%o4,	%o2,	%i2
	membar	#Sync
	wr	%g0,	0x1f,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	edge32	%l6,	%o1,	%g6
	fnors	%f1,	%f29,	%f28
	set	0x40, %i7
	stda	%f16,	[%l7 + %i7] 0x1f
	membar	#Sync
	movrgz	%i1,	0x0AA,	%g4
	tsubcc	%o0,	0x126E,	%o6
	movgu	%xcc,	%i5,	%i4
	nop
	setx	0x12E9D0177BCB4E08,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0x6BE45FCB2883404E,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	fdivd	%f28,	%f22,	%f14
	movcc	%xcc,	%l4,	%o5
	fmovrsgez	%l0,	%f26,	%f23
	set	0x30, %o0
	stxa	%l2,	[%l7 + %o0] 0xeb
	membar	#Sync
	ldstub	[%l7 + 0x37],	%i3
	andn	%g1,	%g7,	%i7
	fmovrslez	%i6,	%f30,	%f15
	set	0x5A, %l5
	ldstuba	[%l7 + %l5] 0x80,	%g3
	bge	loop_1876
	edge16	%g5,	%l1,	%l3
	fandnot1s	%f24,	%f23,	%f6
	tneg	%icc,	0x7
loop_1876:
	xor	%g2,	0x149E,	%o3
	set	0x26, %l2
	ldsha	[%l7 + %l2] 0x15,	%i0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movgu	%icc,	%l5,	%o4
	edge16ln	%o7,	%i2,	%o2
	popc	%o1,	%l6
	sir	0x1FDE
	ble,a	loop_1877
	fbe	%fcc1,	loop_1878
	fmovdneg	%icc,	%f31,	%f31
	fmovdn	%xcc,	%f6,	%f7
loop_1877:
	movcs	%xcc,	%g6,	%g4
loop_1878:
	array8	%i1,	%o6,	%o0
	fmul8x16al	%f30,	%f27,	%f14
	movn	%icc,	%i5,	%l4
	smul	%o5,	0x1650,	%l0
	and	%i4,	%i3,	%l2
	fbe,a	%fcc1,	loop_1879
	ldd	[%l7 + 0x78],	%f10
	set	0x40, %o2
	stda	%f16,	[%l7 + %o2] 0x88
loop_1879:
	sdivcc	%g7,	0x0F46,	%g1
	movvc	%icc,	%i7,	%g3
	ldd	[%l7 + 0x38],	%f12
	ldstub	[%l7 + 0x6B],	%i6
	tg	%icc,	0x2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnand	%f12,	%f24,	%f6
	fba	%fcc0,	loop_1880
	move	%xcc,	%g5,	%l1
	fmovdne	%icc,	%f30,	%f11
	bshuffle	%f6,	%f22,	%f8
loop_1880:
	bl,pt	%xcc,	loop_1881
	orcc	%l3,	%o3,	%i0
	orncc	%g2,	%l5,	%o4
	prefetch	[%l7 + 0x08],	 0x1
loop_1881:
	fornot1s	%f5,	%f0,	%f3
	or	%o7,	%o2,	%i2
	movvc	%icc,	%l6,	%o1
	array8	%g4,	%g6,	%o6
	fblg	%fcc0,	loop_1882
	udivcc	%i1,	0x0464,	%i5
	tleu	%xcc,	0x7
	fabsd	%f6,	%f0
loop_1882:
	fmuld8sux16	%f27,	%f12,	%f10
	brnz,a	%o0,	loop_1883
	fble,a	%fcc3,	loop_1884
	udiv	%o5,	0x12F3,	%l4
	edge32ln	%i4,	%l0,	%l2
loop_1883:
	sethi	0x1876,	%i3
loop_1884:
	andn	%g7,	%i7,	%g1
	brgz,a	%i6,	loop_1885
	udiv	%g5,	0x180E,	%l1
	movge	%xcc,	%g3,	%l3
	and	%i0,	0x0941,	%o3
loop_1885:
	sra	%g2,	%o4,	%l5
	addccc	%o7,	0x1BBD,	%i2
	fbule,a	%fcc0,	loop_1886
	movrgez	%l6,	%o2,	%o1
	movrgz	%g4,	%g6,	%i1
	xnorcc	%i5,	0x18D5,	%o0
loop_1886:
	subc	%o5,	%o6,	%l4
	subc	%i4,	0x08B7,	%l0
	tle	%xcc,	0x5
	fmovdleu	%icc,	%f13,	%f17
	nop
	fitod	%f14,	%f30
	tvs	%icc,	0x2
	movvs	%xcc,	%l2,	%i3
	mova	%xcc,	%i7,	%g1
	alignaddr	%g7,	%i6,	%l1
	brgez,a	%g3,	loop_1887
	fbg,a	%fcc1,	loop_1888
	edge32l	%l3,	%g5,	%o3
	ld	[%l7 + 0x78],	%f21
loop_1887:
	array16	%i0,	%g2,	%o4
loop_1888:
	nop
	wr	%g0,	0x04,	%asi
	lduba	[%l7 + 0x49] %asi,	%o7
	xnorcc	%l5,	%l6,	%o2
	umulcc	%o1,	0x10CD,	%i2
	movcs	%xcc,	%g6,	%i1
	ldstub	[%l7 + 0x4D],	%g4
	udivcc	%i5,	0x14D0,	%o0
	tpos	%xcc,	0x3
	edge8	%o5,	%o6,	%i4
	taddcctv	%l4,	%l0,	%l2
	fba,a	%fcc2,	loop_1889
	addc	%i7,	%g1,	%i3
	move	%icc,	%g7,	%i6
	fmovdn	%icc,	%f23,	%f23
loop_1889:
	tge	%xcc,	0x4
	ldstub	[%l7 + 0x26],	%g3
	sth	%l1,	[%l7 + 0x44]
	swap	[%l7 + 0x30],	%l3
	movrlz	%o3,	%i0,	%g2
	fbu,a	%fcc1,	loop_1890
	fcmpeq32	%f8,	%f2,	%o4
	movl	%xcc,	%g5,	%o7
	set	0x40, %o3
	ldda	[%l7 + %o3] 0x14,	%f0
loop_1890:
	ldd	[%l7 + 0x28],	%i6
	andncc	%l5,	%o2,	%o1
	tcc	%icc,	0x3
	movg	%icc,	%i2,	%i1
	nop
	setx	0x6054B6BF,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%fsr
	add	%l7,	0x0C,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%g6
	casa	[%l6] %asi,	%g6,	%i5
	movge	%icc,	%o0,	%g4
	nop
	set	0x73, %i3
	ldub	[%l7 + %i3],	%o5
	membar	0x3A
	udivcc	%o6,	0x0069,	%i4
	tne	%icc,	0x1
	nop
	set	0x72, %o7
	sth	%l0,	[%l7 + %o7]
	edge16	%l2,	%i7,	%g1
	edge8n	%l4,	%i3,	%g7
	brnz	%g3,	loop_1891
	nop
	setx	loop_1892,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movrne	%i6,	0x1B6,	%l1
	edge32n	%l3,	%i0,	%o3
loop_1891:
	tsubcctv	%o4,	%g2,	%o7
loop_1892:
	fbne	%fcc1,	loop_1893
	edge16	%l6,	%l5,	%g5
	fbu	%fcc3,	loop_1894
	bcs,a,pn	%xcc,	loop_1895
loop_1893:
	fmovrdgz	%o1,	%f4,	%f30
	move	%icc,	%o2,	%i2
loop_1894:
	fxors	%f14,	%f18,	%f1
loop_1895:
	tcs	%icc,	0x7
	addc	%g6,	%i1,	%o0
	srl	%g4,	0x03,	%o5
	bleu	loop_1896
	bcs,pn	%xcc,	loop_1897
	edge8l	%o6,	%i5,	%l0
	movl	%xcc,	%l2,	%i4
loop_1896:
	tge	%icc,	0x6
loop_1897:
	smul	%g1,	0x0120,	%i7
	and	%i3,	%l4,	%g3
	edge32l	%i6,	%l1,	%g7
	tvs	%xcc,	0x5
	xorcc	%l3,	0x04BA,	%o3
	tg	%xcc,	0x3
	sdivcc	%i0,	0x0A65,	%g2
	tle	%xcc,	0x0
	stw	%o7,	[%l7 + 0x54]
	fsrc1s	%f14,	%f1
	andncc	%l6,	%l5,	%g5
	fmovdge	%xcc,	%f27,	%f3
	nop
	set	0x10, %i1
	ldx	[%l7 + %i1],	%o1
	tg	%icc,	0x3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orcc	%o4,	%o2,	%g6
	tg	%icc,	0x5
	fbul	%fcc2,	loop_1898
	movleu	%xcc,	%i2,	%i1
	movg	%xcc,	%g4,	%o0
	edge8	%o5,	%i5,	%l0
loop_1898:
	udivcc	%o6,	0x1944,	%l2
	subcc	%i4,	0x0AAD,	%i7
	add	%g1,	0x08CF,	%i3
	fmul8sux16	%f4,	%f12,	%f30
	fmovdgu	%icc,	%f5,	%f8
	movrne	%g3,	0x250,	%l4
	edge8ln	%l1,	%g7,	%i6
	mulscc	%o3,	0x1F0F,	%i0
	tg	%xcc,	0x3
	fmovdl	%icc,	%f1,	%f23
	membar	0x64
	bneg,pn	%icc,	loop_1899
	xorcc	%l3,	%o7,	%g2
	edge32l	%l6,	%g5,	%o1
	fmul8x16au	%f25,	%f30,	%f20
loop_1899:
	fexpand	%f14,	%f14
	wr	%g0,	0x81,	%asi
	ldswa	[%l7 + 0x1C] %asi,	%l5
	movrlz	%o2,	%g6,	%i2
	movge	%xcc,	%i1,	%g4
	tle	%icc,	0x3
	andncc	%o4,	%o5,	%i5
	array8	%o0,	%o6,	%l2
	fmovdle	%icc,	%f5,	%f31
	andncc	%i4,	%l0,	%i7
	add	%i3,	0x1A44,	%g1
	tge	%xcc,	0x0
	srl	%g3,	0x18,	%l4
	fone	%f10
	ble,a,pn	%xcc,	loop_1900
	movrne	%l1,	%g7,	%i6
	fmovdneg	%xcc,	%f15,	%f30
	array16	%i0,	%l3,	%o3
loop_1900:
	fnot2s	%f22,	%f24
	fands	%f7,	%f17,	%f22
	brz	%o7,	loop_1901
	faligndata	%f8,	%f2,	%f28
	nop
	fitos	%f9,	%f31
	fstod	%f31,	%f24
	movpos	%xcc,	%g2,	%l6
loop_1901:
	nop
	add	%l7,	0x5C,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] %asi,	%o1,	%l5
	sdiv	%o2,	0x1520,	%g6
	movre	%g5,	0x371,	%i1
	fpadd32s	%f10,	%f5,	%f27
	alignaddrl	%i2,	%o4,	%o5
	srlx	%g4,	%o0,	%o6
	st	%f3,	[%l7 + 0x44]
	udivcc	%i5,	0x131F,	%l2
	bn,a,pt	%icc,	loop_1902
	ldsw	[%l7 + 0x5C],	%i4
	ldsw	[%l7 + 0x0C],	%i7
	movne	%icc,	%l0,	%i3
loop_1902:
	smul	%g3,	%l4,	%l1
	ldx	[%l7 + 0x78],	%g1
	add	%i6,	%g7,	%i0
	lduh	[%l7 + 0x3C],	%l3
	andncc	%o7,	%o3,	%l6
	fabss	%f6,	%f29
	sdivcc	%g2,	0x0774,	%l5
	movcs	%icc,	%o2,	%g6
	udiv	%g5,	0x04C1,	%i1
	addccc	%o1,	0x172F,	%i2
	fmovrdne	%o4,	%f18,	%f20
	tsubcc	%g4,	0x036D,	%o5
	fbuge	%fcc0,	loop_1903
	edge16ln	%o0,	%i5,	%o6
	sra	%i4,	%i7,	%l0
	fmul8x16al	%f7,	%f15,	%f22
loop_1903:
	xnorcc	%i3,	%l2,	%g3
	bcc,a	%icc,	loop_1904
	andn	%l4,	%l1,	%g1
	fmovrdlez	%i6,	%f0,	%f6
	movpos	%xcc,	%g7,	%l3
loop_1904:
	srlx	%o7,	0x02,	%o3
	fornot2	%f26,	%f28,	%f30
	sllx	%l6,	0x17,	%i0
	sth	%g2,	[%l7 + 0x58]
	bgu	%xcc,	loop_1905
	fbg,a	%fcc3,	loop_1906
	tl	%xcc,	0x0
	tgu	%icc,	0x4
loop_1905:
	srl	%o2,	0x1B,	%l5
loop_1906:
	tpos	%xcc,	0x1
	fmovsleu	%xcc,	%f20,	%f20
	srl	%g6,	0x1F,	%i1
	wr	%g0,	0x11,	%asi
	lduha	[%l7 + 0x2E] %asi,	%o1
	lduw	[%l7 + 0x0C],	%g5
	addccc	%o4,	0x1412,	%g4
	tsubcctv	%o5,	0x0BE9,	%o0
	nop
	fitos	%f6,	%f5
	fstox	%f5,	%f8
	fxtos	%f8,	%f27
	movvs	%icc,	%i5,	%o6
	movpos	%icc,	%i2,	%i7
	edge32l	%l0,	%i3,	%i4
	movne	%xcc,	%l2,	%g3
	movpos	%icc,	%l4,	%g1
	set	0x40, %l6
	stda	%f16,	[%l7 + %l6] 0xf1
	membar	#Sync
	tne	%icc,	0x7
	bvs,pt	%icc,	loop_1907
	tpos	%icc,	0x0
	bge	%icc,	loop_1908
	movrgz	%l1,	0x2D4,	%g7
loop_1907:
	fandnot1	%f14,	%f20,	%f10
	fbu,a	%fcc0,	loop_1909
loop_1908:
	movrgz	%l3,	0x17B,	%o7
	ldstub	[%l7 + 0x7F],	%o3
	ba,pt	%xcc,	loop_1910
loop_1909:
	nop
	fitod	%f8,	%f8
	fdtox	%f8,	%f8
	fxtod	%f8,	%f6
	fblg	%fcc3,	loop_1911
	fmovsleu	%icc,	%f26,	%f12
loop_1910:
	te	%xcc,	0x2
	fandnot1s	%f7,	%f9,	%f30
loop_1911:
	call	loop_1912
	edge32l	%l6,	%i0,	%g2
	movrne	%i6,	%o2,	%g6
	subccc	%i1,	0x17C2,	%o1
loop_1912:
	tsubcctv	%l5,	0x07AD,	%o4
	udivx	%g5,	0x079B,	%g4
	mova	%xcc,	%o0,	%i5
	umul	%o6,	%i2,	%i7
	taddcc	%l0,	0x1A67,	%i3
	fabsd	%f6,	%f0
	wr	%g0,	0x10,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	popc	0x08B0,	%i4
	set	0x40, %g7
	stda	%f16,	[%l7 + %g7] 0x16
	membar	#Sync
	wr	%g0,	0x89,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	tvs	%icc,	0x2
	brlz,a	%o5,	loop_1913
	sethi	0x1881,	%l2
	array8	%g3,	%l4,	%l1
	ble,a,pt	%xcc,	loop_1914
loop_1913:
	fmovdneg	%xcc,	%f9,	%f16
	bvs,pt	%xcc,	loop_1915
	subc	%g7,	%l3,	%g1
loop_1914:
	tvc	%icc,	0x7
	fmovdgu	%xcc,	%f8,	%f25
loop_1915:
	subccc	%o3,	%l6,	%o7
	movcc	%icc,	%g2,	%i6
	fmovdg	%xcc,	%f24,	%f22
	bshuffle	%f14,	%f2,	%f20
	fmovsle	%icc,	%f6,	%f15
	andn	%i0,	0x1C67,	%o2
	sethi	0x15E2,	%i1
	brgz	%o1,	loop_1916
	edge32n	%l5,	%g6,	%g5
	array16	%o4,	%g4,	%i5
	ldsw	[%l7 + 0x7C],	%o6
loop_1916:
	move	%icc,	%o0,	%i2
	sll	%i7,	%l0,	%i4
	std	%f8,	[%l7 + 0x78]
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	swap	[%l7 + 0x14],	%o5
	fmovda	%icc,	%f17,	%f8
	sdivcc	%l2,	0x1DF2,	%g3
	nop
	setx	loop_1917,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	bpos,pn	%xcc,	loop_1918
	fnands	%f17,	%f15,	%f14
	addc	%i3,	%l4,	%l1
loop_1917:
	movvs	%xcc,	%g7,	%l3
loop_1918:
	movre	%o3,	%l6,	%o7
	xorcc	%g2,	0x1FF0,	%g1
	stx	%i0,	[%l7 + 0x68]
	udivcc	%i6,	0x1717,	%i1
	addcc	%o2,	%l5,	%g6
	subccc	%o1,	0x1493,	%g5
	fbge	%fcc3,	loop_1919
	edge8l	%g4,	%o4,	%o6
	ble,a,pn	%icc,	loop_1920
	srax	%i5,	0x12,	%o0
loop_1919:
	subc	%i2,	%i7,	%l0
	movne	%xcc,	%o5,	%l2
loop_1920:
	bleu	loop_1921
	subcc	%i4,	%i3,	%l4
	movrlez	%l1,	0x327,	%g7
	fpsub16s	%f6,	%f7,	%f10
loop_1921:
	ta	%xcc,	0x5
	wr	%g0,	0x80,	%asi
	ldxa	[%l7 + 0x50] %asi,	%l3
	array8	%o3,	%l6,	%o7
	movpos	%icc,	%g3,	%g1
	tvs	%xcc,	0x7
	udivx	%g2,	0x1440,	%i0
	sdivx	%i1,	0x1AEB,	%o2
	andncc	%l5,	%g6,	%i6
	be,pt	%icc,	loop_1922
	movgu	%icc,	%o1,	%g5
	sdivx	%g4,	0x07AC,	%o6
	fbue,a	%fcc1,	loop_1923
loop_1922:
	edge32	%o4,	%i5,	%i2
	fandnot1s	%f14,	%f4,	%f0
	fble,a	%fcc0,	loop_1924
loop_1923:
	fmovsne	%icc,	%f6,	%f3
	sub	%o0,	0x1B6D,	%i7
	fcmpne16	%f26,	%f10,	%l0
loop_1924:
	ld	[%l7 + 0x70],	%f3
	array8	%o5,	%i4,	%i3
	ta	%xcc,	0x0
	wr	%g0,	0x2b,	%asi
	stha	%l4,	[%l7 + 0x6E] %asi
	membar	#Sync
	edge8ln	%l1,	%g7,	%l3
	nop
	setx	loop_1925,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	bneg,a,pt	%xcc,	loop_1926
	taddcc	%o3,	0x0114,	%l6
	set	0x77, %l4
	lduba	[%l7 + %l4] 0x0c,	%o7
loop_1925:
	nop
	set	0x6E, %i2
	ldsha	[%l7 + %i2] 0x10,	%g3
loop_1926:
	ldub	[%l7 + 0x4C],	%l2
	bvc,a	%icc,	loop_1927
	nop
	setx	loop_1928,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fmovscc	%xcc,	%f11,	%f20
	andn	%g1,	%g2,	%i1
loop_1927:
	movre	%i0,	0x05A,	%o2
loop_1928:
	movpos	%xcc,	%l5,	%g6
	fornot1	%f8,	%f18,	%f16
	be,a	loop_1929
	ble,a	%xcc,	loop_1930
	tcs	%xcc,	0x2
	fexpand	%f4,	%f18
loop_1929:
	xorcc	%o1,	0x0369,	%g5
loop_1930:
	movrlz	%i6,	%g4,	%o6
	sethi	0x128F,	%i5
	udivcc	%i2,	0x1C87,	%o4
	movvc	%icc,	%i7,	%l0
	fbge,a	%fcc1,	loop_1931
	ta	%xcc,	0x7
	fmovrdne	%o5,	%f4,	%f0
	array8	%i4,	%o0,	%l4
loop_1931:
	stw	%l1,	[%l7 + 0x28]
	wr	%g0,	0x81,	%asi
	lda	[%l7 + 0x74] %asi,	%f1
	fmovrslez	%i3,	%f25,	%f12
	fbl,a	%fcc3,	loop_1932
	edge8	%g7,	%o3,	%l6
	brz,a	%o7,	loop_1933
	fmovdn	%xcc,	%f7,	%f4
loop_1932:
	fands	%f11,	%f10,	%f22
	xorcc	%l3,	%l2,	%g1
loop_1933:
	array16	%g3,	%g2,	%i0
	or	%i1,	%o2,	%g6
	nop
	fitod	%f2,	%f10
	fdtox	%f10,	%f6
	tle	%icc,	0x7
	edge8n	%o1,	%g5,	%i6
	brnz,a	%g4,	loop_1934
	taddcc	%l5,	0x129E,	%o6
	fmovsneg	%icc,	%f17,	%f0
	udivcc	%i2,	0x17D1,	%i5
loop_1934:
	tn	%xcc,	0x4
	smulcc	%i7,	0x0370,	%l0
	orcc	%o4,	0x122B,	%i4
	add	%o0,	%l4,	%o5
	set	0x10, %l0
	stwa	%i3,	[%l7 + %l0] 0x2a
	membar	#Sync
	bvs,pn	%icc,	loop_1935
	fandnot2	%f6,	%f10,	%f26
	movn	%icc,	%g7,	%o3
	tge	%icc,	0x0
loop_1935:
	nop
	wr	%g0,	0x80,	%asi
	ldstuba	[%l7 + 0x51] %asi,	%l6
	lduh	[%l7 + 0x76],	%l1
	move	%icc,	%o7,	%l3
	nop
	fitos	%f5,	%f24
	fstox	%f24,	%f16
	tsubcctv	%g1,	0x0055,	%l2
	wr	%g0,	0x81,	%asi
	swapa	[%l7 + 0x08] %asi,	%g2
	fnor	%f26,	%f28,	%f2
	tg	%xcc,	0x3
	bleu,pt	%icc,	loop_1936
	brgz,a	%g3,	loop_1937
	taddcc	%i0,	0x1FFC,	%o2
	call	loop_1938
loop_1936:
	edge32l	%i1,	%o1,	%g5
loop_1937:
	edge32l	%i6,	%g4,	%g6
	sll	%l5,	0x12,	%o6
loop_1938:
	fmovdg	%icc,	%f2,	%f29
	fmul8x16au	%f9,	%f4,	%f26
	movrlz	%i2,	0x2B3,	%i5
	fcmpne32	%f16,	%f18,	%l0
	bge	%icc,	loop_1939
	umulcc	%i7,	0x0D3D,	%o4
	array16	%o0,	%l4,	%i4
	taddcc	%i3,	%o5,	%o3
loop_1939:
	movleu	%xcc,	%l6,	%g7
	fmovse	%xcc,	%f14,	%f2
	movrgez	%o7,	0x074,	%l1
	addccc	%l3,	0x1262,	%l2
	sll	%g2,	0x13,	%g3
	umulcc	%g1,	0x185F,	%i0
	wr	%g0,	0x10,	%asi
	swapa	[%l7 + 0x14] %asi,	%o2
	tcs	%xcc,	0x6
	fabsd	%f30,	%f24
	sub	%i1,	%o1,	%i6
	edge8ln	%g5,	%g6,	%g4
	wr	%g0,	0x11,	%asi
	lduba	[%l7 + 0x1E] %asi,	%o6
	srlx	%i2,	%l5,	%i5
	subccc	%l0,	%o4,	%o0
	set	0x4A, %g4
	stha	%i7,	[%l7 + %g4] 0x2b
	membar	#Sync
	nop
	setx	0xD4F84AEEC6B5E8E3,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0x387C5058C59F772A,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fsubd	%f0,	%f22,	%f4
	fmovrdlez	%i4,	%f10,	%f10
	std	%f20,	[%l7 + 0x18]
	set	0x10, %o6
	stwa	%i3,	[%l7 + %o6] 0xe2
	membar	#Sync
	fbug,a	%fcc2,	loop_1940
	fandnot1	%f20,	%f12,	%f0
	fcmple32	%f22,	%f22,	%o5
	movne	%icc,	%o3,	%l4
loop_1940:
	sdiv	%l6,	0x059E,	%g7
	sdivcc	%o7,	0x0ABC,	%l1
	bge,pn	%icc,	loop_1941
	fnegd	%f8,	%f30
	edge32n	%l3,	%g2,	%l2
	fmovdpos	%icc,	%f24,	%f9
loop_1941:
	smulcc	%g3,	0x0632,	%i0
	set	0x48, %i5
	lda	[%l7 + %i5] 0x89,	%f31
	nop
	set	0x28, %o4
	lduw	[%l7 + %o4],	%o2
	edge32l	%i1,	%o1,	%i6
	tvs	%icc,	0x0
	wr	%g0,	0x0c,	%asi
	ldstuba	[%l7 + 0x6B] %asi,	%g5
	alignaddr	%g6,	%g1,	%o6
	ld	[%l7 + 0x18],	%f3
	movrne	%i2,	%l5,	%i5
	fnegd	%f24,	%f24
	fmovrdgez	%l0,	%f16,	%f22
	or	%g4,	%o0,	%o4
	sir	0x1592
	fnegs	%f31,	%f8
	umulcc	%i4,	%i3,	%i7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpsub32s	%f9,	%f31,	%f1
	movre	%o5,	0x030,	%o3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnegd	%f24,	%f16
	tl	%xcc,	0x1
	fmovrsne	%l6,	%f6,	%f10
	fmovsgu	%icc,	%f16,	%f28
	taddcctv	%g7,	0x15EF,	%o7
	bvc,a	%xcc,	loop_1942
	fmovrde	%l4,	%f12,	%f22
	mova	%icc,	%l3,	%g2
	movrlz	%l2,	0x0C8,	%g3
loop_1942:
	fpackfix	%f6,	%f10
	stbar
	nop
	setx	0xBF8B17E9BE137908,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0x6955F02EF27884A5,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	fdivd	%f20,	%f24,	%f28
	fblg	%fcc1,	loop_1943
	array8	%i0,	%o2,	%l1
	fcmpgt16	%f22,	%f30,	%i1
	tge	%xcc,	0x5
loop_1943:
	sdivx	%i6,	0x1ABB,	%o1
	fandnot1s	%f30,	%f14,	%f31
	nop
	setx	loop_1944,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movpos	%icc,	%g6,	%g5
	fpack16	%f22,	%f31
	fmovrdgez	%o6,	%f22,	%f30
loop_1944:
	tl	%xcc,	0x2
	array32	%i2,	%l5,	%i5
	fblg,a	%fcc3,	loop_1945
	movcs	%xcc,	%g1,	%l0
	sethi	0x0FBC,	%g4
	sdivcc	%o4,	0x172F,	%o0
loop_1945:
	fpsub32s	%f4,	%f21,	%f18
	nop
	setx	0xA190C94F9ED60AD8,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	setx	0xE8733A022526DC0C,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	fdivd	%f6,	%f18,	%f8
	mulscc	%i3,	0x08BD,	%i7
	move	%icc,	%i4,	%o3
	udivcc	%l6,	0x062C,	%o5
	smul	%o7,	%g7,	%l4
	edge8l	%g2,	%l2,	%l3
	movrlz	%i0,	%g3,	%o2
	andn	%i1,	%l1,	%o1
	fsrc2	%f2,	%f10
	brnz,a	%i6,	loop_1946
	tle	%icc,	0x2
	wr	%g0,	0x11,	%asi
	sta	%f27,	[%l7 + 0x5C] %asi
loop_1946:
	nop
	fitos	%f7,	%f31
	addccc	%g5,	0x0F5B,	%g6
	tcc	%xcc,	0x5
	nop
	setx	0x5075EBE1,	%l0,	%l6
	st	%l6,	[%l7 + 0x6C]
	ld	[%l7 + 0x6C],	%fsr
	sir	0x174A
	edge16l	%i2,	%o6,	%l5
	wr	%g0,	0x80,	%asi
	prefetcha	[%l7 + 0x20] %asi,	 0x1
	tle	%icc,	0x5
	andncc	%l0,	%i5,	%o4
	prefetch	[%l7 + 0x40],	 0x1
	set	0x78, %g6
	stha	%o0,	[%l7 + %g6] 0x19
	alignaddrl	%g4,	%i3,	%i4
	tcs	%icc,	0x0
	add	%l7,	0x24,	%l6
	wr	%g0,	0x19,	%asi
	casa	[%l6] 0x19,	%i7,	%o3
	xorcc	%l6,	%o7,	%g7
	tpos	%icc,	0x0
	nop
	fitod	%f3,	%f30
	fmovd	%f26,	%f14
	sdivx	%l4,	0x1D40,	%o5
	fone	%f4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbne	%fcc2,	loop_1947
	tvc	%xcc,	0x4
	movrgz	%l2,	0x223,	%l3
	xnor	%g2,	%i0,	%o2
loop_1947:
	nop
	set	0x50, %i6
	stxa	%i1,	[%l7 + %i6] 0x80
	array32	%l1,	%o1,	%g3
	set	0x18, %o5
	stwa	%g5,	[%l7 + %o5] 0x81
	fones	%f0
	subccc	%g6,	%i6,	%i2
	nop
	setx	loop_1948,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tsubcctv	%l5,	0x1B9A,	%g1
	edge32n	%o6,	%i5,	%o4
	nop
	setx	0x660C5900,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f13
	fsqrts	%f13,	%f24
loop_1948:
	ta	%xcc,	0x4
	popc	%o0,	%g4
	edge8n	%i3,	%i4,	%l0
	xor	%i7,	0x0EB7,	%o3
	xnor	%l6,	0x146F,	%g7
	movcc	%icc,	%l4,	%o5
	movle	%xcc,	%l2,	%l3
	tleu	%xcc,	0x4
	fmovscs	%xcc,	%f15,	%f3
	umulcc	%o7,	0x1B81,	%g2
	xor	%o2,	0x176C,	%i1
	sll	%i0,	0x1A,	%l1
	popc	0x1A0B,	%o1
	brz	%g3,	loop_1949
	sub	%g5,	%g6,	%i2
	membar	#Sync
	set	0x40, %i4
	ldda	[%l7 + %i4] 0xf0,	%f16
loop_1949:
	movgu	%xcc,	%i6,	%l5
	umulcc	%o6,	0x10A2,	%i5
	smul	%g1,	0x0A53,	%o4
	andcc	%g4,	0x018D,	%o0
	sub	%i4,	%l0,	%i7
	umul	%o3,	0x1828,	%l6
	set	0x77, %o1
	stba	%i3,	[%l7 + %o1] 0x10
	edge32l	%g7,	%o5,	%l4
	movne	%icc,	%l2,	%o7
	fmovrslz	%g2,	%f25,	%f15
	udiv	%o2,	0x1944,	%l3
	bvc,a	loop_1950
	sdiv	%i0,	0x0EE1,	%i1
	sir	0x1776
	edge32n	%o1,	%l1,	%g5
loop_1950:
	and	%g6,	0x1783,	%i2
	nop
	setx	0x4209703F5069196C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x30]
	ldx	[%l7 + 0x30],	%fsr
	swap	[%l7 + 0x7C],	%g3
	fands	%f3,	%f24,	%f27
	bpos,a,pn	%icc,	loop_1951
	udivcc	%l5,	0x14F1,	%o6
	ldstub	[%l7 + 0x39],	%i6
	movre	%i5,	%o4,	%g4
loop_1951:
	fblg,a	%fcc1,	loop_1952
	ldsb	[%l7 + 0x2E],	%g1
	xorcc	%i4,	0x1745,	%l0
	movne	%icc,	%o0,	%o3
loop_1952:
	fpadd32s	%f16,	%f15,	%f3
	edge8ln	%l6,	%i3,	%g7
	fnot2	%f2,	%f0
	st	%f18,	[%l7 + 0x28]
	fnegs	%f18,	%f11
	movneg	%icc,	%o5,	%l4
	fmovscs	%icc,	%f24,	%f30
	bleu,a	loop_1953
	sllx	%l2,	%i7,	%g2
	sdiv	%o7,	0x1834,	%l3
	fmovdvc	%icc,	%f22,	%f1
loop_1953:
	array32	%i0,	%i1,	%o1
	ldsh	[%l7 + 0x6E],	%l1
	movcs	%icc,	%g5,	%o2
	addc	%g6,	%g3,	%l5
	ldsw	[%l7 + 0x6C],	%o6
	edge8l	%i6,	%i5,	%i2
	udiv	%o4,	0x0D89,	%g1
	srlx	%i4,	0x1E,	%l0
	smulcc	%o0,	0x05AD,	%o3
	bge,a	%xcc,	loop_1954
	movvc	%icc,	%g4,	%i3
	tl	%icc,	0x2
	bvs,a	loop_1955
loop_1954:
	sllx	%l6,	%o5,	%l4
	std	%f2,	[%l7 + 0x70]
	edge16ln	%l2,	%g7,	%g2
loop_1955:
	membar	0x11
	fzero	%f8
	fpack32	%f10,	%f14,	%f30
	nop
	setx	loop_1956,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	swap	[%l7 + 0x2C],	%i7
	smul	%l3,	0x1258,	%i0
	tsubcctv	%i1,	0x0013,	%o7
loop_1956:
	edge16	%o1,	%g5,	%o2
	umul	%g6,	%g3,	%l5
	orcc	%l1,	0x1C82,	%o6
	mulscc	%i5,	0x19DC,	%i2
	umulcc	%i6,	%g1,	%o4
	subccc	%i4,	%l0,	%o3
	array16	%g4,	%i3,	%o0
	fpsub32	%f18,	%f12,	%f14
	tcc	%xcc,	0x6
	fbg	%fcc2,	loop_1957
	movg	%icc,	%l6,	%o5
	lduh	[%l7 + 0x54],	%l2
	nop
	set	0x58, %g3
	std	%f26,	[%l7 + %g3]
loop_1957:
	tvc	%icc,	0x2
	tleu	%icc,	0x4
	brgez	%g7,	loop_1958
	movrlz	%l4,	0x27D,	%i7
	fbge,a	%fcc1,	loop_1959
	fcmple16	%f2,	%f6,	%l3
loop_1958:
	movgu	%xcc,	%i0,	%g2
	bge,a,pt	%icc,	loop_1960
loop_1959:
	fmovrde	%i1,	%f28,	%f14
	srax	%o7,	0x03,	%o1
	fnors	%f4,	%f22,	%f2
loop_1960:
	tsubcctv	%o2,	0x1EA6,	%g5
	edge16n	%g6,	%g3,	%l5
	fmovdneg	%xcc,	%f1,	%f0
	movcs	%icc,	%l1,	%i5
	sra	%i2,	0x05,	%o6
	xorcc	%g1,	0x0C7E,	%i6
	fbne,a	%fcc2,	loop_1961
	sir	0x06FB
	stb	%o4,	[%l7 + 0x3A]
	te	%xcc,	0x6
loop_1961:
	udivx	%i4,	0x0ABF,	%l0
	fbul	%fcc1,	loop_1962
	bneg	%icc,	loop_1963
	fabss	%f0,	%f30
	ta	%icc,	0x5
loop_1962:
	fmovrdgez	%g4,	%f0,	%f24
loop_1963:
	fmovdcc	%xcc,	%f1,	%f13
	fnot2	%f22,	%f12
	tvc	%icc,	0x7
	stbar
	prefetch	[%l7 + 0x5C],	 0x0
	sdiv	%o3,	0x1ECC,	%i3
	movn	%xcc,	%o0,	%l6
	udivcc	%l2,	0x1683,	%g7
	sdivx	%o5,	0x1481,	%l4
	fmovrslz	%i7,	%f24,	%f0
	tcs	%xcc,	0x0
	for	%f26,	%f10,	%f2
	fbl	%fcc1,	loop_1964
	movvc	%icc,	%i0,	%l3
	bvs,a,pt	%icc,	loop_1965
	tsubcc	%i1,	%g2,	%o7
loop_1964:
	edge8	%o1,	%g5,	%g6
	umulcc	%o2,	0x1231,	%l5
loop_1965:
	fmovrslez	%g3,	%f10,	%f30
	movg	%icc,	%i5,	%i2
	array32	%o6,	%l1,	%g1
	nop
	fitod	%f6,	%f26
	fdtox	%f26,	%f12
	tsubcc	%i6,	%o4,	%l0
	fbe,a	%fcc2,	loop_1966
	bcs	%xcc,	loop_1967
	movne	%xcc,	%i4,	%o3
	popc	%i3,	%g4
loop_1966:
	smul	%l6,	0x1A18,	%o0
loop_1967:
	tsubcctv	%l2,	0x1DCF,	%g7
	tvs	%xcc,	0x6
	fone	%f0
	nop
	setx	0x02415407,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f25
	fsqrts	%f25,	%f3
	bne,a	%xcc,	loop_1968
	fmovsneg	%xcc,	%f17,	%f4
	set	0x40, %g5
	ldda	[%l7 + %g5] 0x04,	%f0
loop_1968:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbo	%fcc3,	loop_1969
	alignaddrl	%l4,	%i7,	%i0
	brnz,a	%o5,	loop_1970
	smul	%l3,	%g2,	%o7
loop_1969:
	nop
	add	%l7,	0x14,	%l6
	wr	%g0,	0x18,	%asi
	lda	[%l6] %asi,	%i1
	casa	[%l6] %asi,	%i1,	%o1
loop_1970:
	array32	%g6,	%o2,	%g5
	fbg,a	%fcc1,	loop_1971
	tn	%icc,	0x7
	sllx	%g3,	%i5,	%l5
	edge8n	%o6,	%l1,	%g1
loop_1971:
	nop
	wr	%g0,	0x80,	%asi
	swapa	[%l7 + 0x1C] %asi,	%i6
	fbo	%fcc1,	loop_1972
	movvc	%icc,	%i2,	%l0
	edge16n	%i4,	%o4,	%o3
	srlx	%g4,	0x04,	%i3
loop_1972:
	udivcc	%o0,	0x02EA,	%l6
	or	%g7,	0x1149,	%l4
	fmovrse	%l2,	%f12,	%f25
	fsrc1s	%f12,	%f0
	xnor	%i7,	%o5,	%l3
	sir	0x0AF9
	nop
	set	0x70, %l1
	ldx	[%l7 + %l1],	%g2
	movcc	%icc,	%i0,	%i1
	xorcc	%o7,	0x10F2,	%o1
	set	0x20, %g2
	ldda	[%l7 + %g2] 0xea,	%o2
	bne,a,pt	%icc,	loop_1973
	fpadd16	%f10,	%f26,	%f8
	udiv	%g5,	0x0B50,	%g6
	sdiv	%i5,	0x0E70,	%g3
loop_1973:
	ld	[%l7 + 0x30],	%f25
	movleu	%icc,	%o6,	%l5
	andcc	%l1,	0x14C7,	%g1
	subc	%i2,	%i6,	%l0
	edge8ln	%o4,	%o3,	%i4
	fmovdgu	%xcc,	%f13,	%f5
	ldsw	[%l7 + 0x24],	%g4
	sdivx	%o0,	0x1A63,	%i3
	fcmpne16	%f24,	%f28,	%g7
	srlx	%l6,	0x17,	%l2
	fmul8x16au	%f23,	%f7,	%f20
	andncc	%i7,	%o5,	%l4
	fmovrslez	%l3,	%f24,	%f7
	sub	%g2,	0x18DE,	%i1
	orcc	%i0,	%o1,	%o2
	movle	%icc,	%g5,	%g6
	xnorcc	%o7,	%g3,	%i5
	orn	%l5,	%l1,	%o6
	edge16ln	%i2,	%i6,	%l0
	wr	%g0,	0xe2,	%asi
	stxa	%o4,	[%l7 + 0x38] %asi
	membar	#Sync
	brnz	%g1,	loop_1974
	array8	%i4,	%g4,	%o0
	nop
	fitod	%f2,	%f0
	fdtoi	%f0,	%f12
	edge8ln	%i3,	%o3,	%g7
loop_1974:
	bvs	%xcc,	loop_1975
	alignaddr	%l2,	%i7,	%l6
	set	0x64, %g1
	swapa	[%l7 + %g1] 0x18,	%l4
loop_1975:
	udivx	%o5,	0x15B4,	%l3
	umulcc	%i1,	%i0,	%g2
	wr	%g0,	0x10,	%asi
	lduwa	[%l7 + 0x44] %asi,	%o1
	stbar
	fbge,a	%fcc1,	loop_1976
	edge16n	%g5,	%o2,	%g6
	fbo,a	%fcc1,	loop_1977
	edge32n	%g3,	%o7,	%i5
loop_1976:
	fbn	%fcc0,	loop_1978
	taddcctv	%l5,	0x1275,	%l1
loop_1977:
	mova	%icc,	%i2,	%i6
	bleu	loop_1979
loop_1978:
	fmovdl	%icc,	%f29,	%f12
	fzeros	%f14
	mova	%icc,	%o6,	%o4
loop_1979:
	taddcctv	%g1,	%i4,	%g4
	lduh	[%l7 + 0x0A],	%o0
	fmovsgu	%xcc,	%f7,	%f16
	lduh	[%l7 + 0x18],	%l0
	tsubcctv	%o3,	%i3,	%g7
	fmovspos	%xcc,	%f31,	%f3
	edge8	%l2,	%l6,	%i7
	edge32n	%l4,	%o5,	%i1
	bpos,a	loop_1980
	ta	%icc,	0x0
	edge16ln	%l3,	%g2,	%i0
	tneg	%xcc,	0x1
loop_1980:
	edge8ln	%g5,	%o1,	%o2
	movpos	%icc,	%g6,	%g3
	tcs	%icc,	0x7
	sll	%i5,	%l5,	%o7
	tcc	%icc,	0x3
	edge32ln	%l1,	%i6,	%i2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrlz	%o4,	0x169,	%o6
	movpos	%icc,	%g1,	%i4
	ta	%xcc,	0x3
	xnor	%o0,	0x08C5,	%g4
	srax	%l0,	%i3,	%o3
	sdiv	%l2,	0x0EA6,	%l6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpsub32	%f14,	%f18,	%f12
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tl	%xcc,	0x6
	srl	%i7,	0x00,	%l4
	fmovs	%f6,	%f8
	ldub	[%l7 + 0x6A],	%g7
	edge8l	%o5,	%i1,	%l3
	array16	%g2,	%i0,	%o1
	tle	%icc,	0x2
	ldx	[%l7 + 0x48],	%o2
	move	%icc,	%g6,	%g5
	movrlz	%g3,	%l5,	%i5
	movrne	%o7,	%i6,	%l1
	fmovrdne	%i2,	%f28,	%f18
	fmovspos	%xcc,	%f19,	%f18
	edge32	%o6,	%o4,	%g1
	taddcc	%i4,	%o0,	%l0
	bl,a,pn	%xcc,	loop_1981
	pdist	%f24,	%f20,	%f12
	fornot2	%f24,	%f10,	%f10
	fors	%f26,	%f26,	%f29
loop_1981:
	ta	%icc,	0x5
	fbu	%fcc3,	loop_1982
	lduw	[%l7 + 0x40],	%i3
	fmovrsgz	%g4,	%f7,	%f17
	sir	0x122C
loop_1982:
	te	%xcc,	0x3
	popc	%l2,	%o3
	set	0x3E, %l3
	lduha	[%l7 + %l3] 0x81,	%l6
	move	%xcc,	%l4,	%i7
	movg	%icc,	%o5,	%i1
	movg	%icc,	%l3,	%g2
	wr	%g0,	0x80,	%asi
	ldswa	[%l7 + 0x1C] %asi,	%i0
	andncc	%g7,	%o2,	%o1
	tsubcc	%g6,	%g5,	%g3
	fbe	%fcc3,	loop_1983
	tcs	%icc,	0x1
	sir	0x03AD
	for	%f14,	%f12,	%f10
loop_1983:
	udivcc	%i5,	0x123B,	%l5
	nop
	setx	loop_1984,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	brnz,a	%o7,	loop_1985
	for	%f28,	%f24,	%f6
	movrlz	%l1,	0x107,	%i6
loop_1984:
	or	%i2,	%o4,	%g1
loop_1985:
	fmovdvc	%icc,	%f8,	%f8
	fmovdcc	%xcc,	%f20,	%f9
	fpadd16s	%f0,	%f11,	%f10
	taddcctv	%o6,	%i4,	%o0
	umul	%i3,	%l0,	%l2
	brgz,a	%g4,	loop_1986
	fba	%fcc2,	loop_1987
	tn	%xcc,	0x6
	fbge,a	%fcc1,	loop_1988
loop_1986:
	bneg,pt	%icc,	loop_1989
loop_1987:
	fmovdvc	%xcc,	%f12,	%f22
	movpos	%xcc,	%l6,	%l4
loop_1988:
	tsubcctv	%i7,	0x099A,	%o3
loop_1989:
	addcc	%o5,	%l3,	%i1
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
	fandnot2	%f26,	%f8,	%f18
	edge32n	%i0,	%g7,	%g2
	fbl,a	%fcc3,	loop_1991
loop_1990:
	lduh	[%l7 + 0x7C],	%o1
	movg	%xcc,	%g6,	%g5
	edge32l	%g3,	%i5,	%l5
loop_1991:
	ld	[%l7 + 0x70],	%f18
	sub	%o7,	%l1,	%o2
	nop
	set	0x58, %i7
	ldd	[%l7 + %i7],	%i2
	tle	%xcc,	0x2
	movle	%icc,	%i6,	%o4
	fpack16	%f24,	%f3
	fmovdpos	%icc,	%f29,	%f24
	movge	%icc,	%g1,	%i4
	fmovrslez	%o0,	%f31,	%f18
	tne	%xcc,	0x1
	fmovscs	%xcc,	%f20,	%f23
	edge16ln	%i3,	%l0,	%o6
	smulcc	%g4,	%l2,	%l4
	tneg	%xcc,	0x5
	movle	%xcc,	%i7,	%o3
	movre	%l6,	0x3EB,	%l3
	stb	%o5,	[%l7 + 0x21]
	edge8ln	%i1,	%i0,	%g2
	ldstub	[%l7 + 0x25],	%o1
	edge16	%g6,	%g5,	%g3
	stw	%i5,	[%l7 + 0x1C]
	movrgez	%l5,	0x3BF,	%o7
	fbo	%fcc0,	loop_1992
	andn	%g7,	0x0E16,	%l1
	flush	%l7 + 0x4C
	sll	%o2,	0x0E,	%i2
loop_1992:
	tsubcctv	%o4,	0x1147,	%i6
	nop
	setx	0x996B4F70,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f2
	setx	0x32C5DD5C,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f27
	fdivs	%f27,	%f2,	%f0
	fbue,a	%fcc2,	loop_1993
	tg	%xcc,	0x6
	std	%f0,	[%l7 + 0x40]
	udivcc	%g1,	0x18CF,	%o0
loop_1993:
	flush	%l7 + 0x70
	fand	%f30,	%f28,	%f4
	movcc	%xcc,	%i3,	%i4
	array32	%o6,	%l0,	%l2
	nop
	setx	0x149DC3F9,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f19
	fsqrts	%f19,	%f6
	for	%f8,	%f26,	%f24
	edge16ln	%g4,	%i7,	%l4
	orcc	%l6,	%o3,	%o5
	set	0x10, %o0
	ldxa	[%l7 + %o0] 0x80,	%i1
	nop
	setx	loop_1994,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fmovdg	%xcc,	%f3,	%f3
	fnot1	%f20,	%f24
	orncc	%l3,	0x030F,	%i0
loop_1994:
	tvs	%icc,	0x1
	orcc	%o1,	0x1032,	%g2
	set	0x70, %l5
	ldda	[%l7 + %l5] 0x24,	%g4
	move	%xcc,	%g3,	%g6
	subcc	%l5,	%i5,	%g7
	edge32n	%o7,	%o2,	%l1
	addccc	%i2,	%o4,	%i6
	sethi	0x1D5D,	%o0
	set	0x44, %l2
	swapa	[%l7 + %l2] 0x88,	%g1
	movvs	%icc,	%i4,	%i3
	andcc	%l0,	0x00EC,	%l2
	be,a,pn	%xcc,	loop_1995
	fbul,a	%fcc3,	loop_1996
	fbe,a	%fcc3,	loop_1997
	xor	%g4,	%i7,	%o6
loop_1995:
	ble,a,pt	%icc,	loop_1998
loop_1996:
	taddcctv	%l6,	%o3,	%o5
loop_1997:
	xorcc	%i1,	0x0D4A,	%l4
	movre	%i0,	0x28E,	%o1
loop_1998:
	brlez,a	%l3,	loop_1999
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tcc	%xcc,	0x4
	edge8l	%g2,	%g5,	%g6
loop_1999:
	movcs	%icc,	%l5,	%g3
	movre	%i5,	0x141,	%g7
	fsrc1	%f4,	%f8
	bvc,pn	%xcc,	loop_2000
	fcmpne16	%f20,	%f14,	%o7
	tvc	%xcc,	0x7
	ble,pn	%xcc,	loop_2001
loop_2000:
	tg	%xcc,	0x3
	and	%l1,	%i2,	%o2
	array16	%o4,	%o0,	%g1
loop_2001:
	fmovsvs	%icc,	%f5,	%f5
	tcc	%icc,	0x0
	fmul8sux16	%f28,	%f18,	%f18
	movrne	%i6,	%i4,	%i3
	movne	%xcc,	%l2,	%g4
	andcc	%i7,	%o6,	%l0
	tsubcctv	%l6,	%o3,	%i1
	fmovsle	%icc,	%f21,	%f13
	fmovdvs	%icc,	%f0,	%f31
	ldx	[%l7 + 0x68],	%l4
	bshuffle	%f0,	%f0,	%f28
	fmovsg	%icc,	%f19,	%f8
	movre	%o5,	0x10C,	%i0
	alignaddr	%l3,	%o1,	%g5
	wr	%g0,	0x88,	%asi
	lduba	[%l7 + 0x13] %asi,	%g6
	sir	0x0DEF
	ba,a	%icc,	loop_2002
	array16	%l5,	%g2,	%i5
	stx	%g3,	[%l7 + 0x70]
	fmul8x16au	%f13,	%f10,	%f0
loop_2002:
	nop
	wr	%g0,	0x11,	%asi
	swapa	[%l7 + 0x4C] %asi,	%g7
	st	%f6,	[%l7 + 0x1C]
	taddcc	%o7,	%i2,	%o2
	sdivx	%l1,	0x1ADC,	%o4
	movneg	%icc,	%o0,	%g1
	fnors	%f4,	%f29,	%f19
	mova	%xcc,	%i4,	%i3
	membar	0x59
	udivx	%i6,	0x17A1,	%g4
	membar	0x28
	movleu	%icc,	%i7,	%o6
	orcc	%l0,	0x0C33,	%l2
	movcs	%icc,	%o3,	%i1
	brgz	%l4,	loop_2003
	fpmerge	%f11,	%f14,	%f0
	xorcc	%o5,	%l6,	%l3
	edge32n	%o1,	%i0,	%g5
loop_2003:
	fabsd	%f20,	%f22
	movleu	%icc,	%l5,	%g6
	array32	%g2,	%i5,	%g3
	fba	%fcc0,	loop_2004
	stb	%g7,	[%l7 + 0x67]
	ldsb	[%l7 + 0x31],	%i2
	bpos,a	%xcc,	loop_2005
loop_2004:
	stx	%o7,	[%l7 + 0x70]
	sllx	%l1,	0x13,	%o2
	nop
	setx	loop_2006,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_2005:
	tvc	%xcc,	0x3
	sdiv	%o0,	0x1F56,	%g1
	ldstub	[%l7 + 0x2F],	%i4
loop_2006:
	edge16n	%i3,	%o4,	%i6
	movvs	%xcc,	%i7,	%g4
	tgu	%xcc,	0x1
	sth	%o6,	[%l7 + 0x5C]
	fmovspos	%icc,	%f21,	%f11
	srl	%l2,	%o3,	%i1
	nop
	fitod	%f8,	%f14
	fdtox	%f14,	%f22
	movge	%xcc,	%l4,	%o5
	srl	%l0,	%l3,	%o1
	fbo,a	%fcc0,	loop_2007
	alignaddrl	%l6,	%i0,	%g5
	movn	%xcc,	%l5,	%g2
	movle	%xcc,	%g6,	%i5
loop_2007:
	brlz,a	%g7,	loop_2008
	sub	%g3,	%o7,	%i2
	xor	%o2,	%o0,	%g1
	movgu	%icc,	%l1,	%i3
loop_2008:
	edge8n	%o4,	%i4,	%i7
	wr	%g0,	0x04,	%asi
	ldswa	[%l7 + 0x78] %asi,	%g4
	set	0x60, %o2
	ldswa	[%l7 + %o2] 0x81,	%o6
	fba	%fcc2,	loop_2009
	lduh	[%l7 + 0x1E],	%l2
	edge16l	%i6,	%o3,	%i1
	movre	%l4,	%l0,	%o5
loop_2009:
	udivcc	%o1,	0x1F23,	%l6
	tcc	%xcc,	0x4
	edge8n	%i0,	%g5,	%l3
	fbule	%fcc1,	loop_2010
	stx	%l5,	[%l7 + 0x50]
	udiv	%g2,	0x1384,	%g6
	fmovd	%f18,	%f26
loop_2010:
	xorcc	%i5,	0x1BC7,	%g7
	edge8	%o7,	%i2,	%o2
	movgu	%icc,	%g3,	%o0
	movne	%icc,	%g1,	%l1
	fpack16	%f2,	%f3
	xor	%o4,	0x18A0,	%i4
	fandnot1s	%f20,	%f28,	%f28
	andcc	%i3,	0x13EB,	%g4
	set	0x30, %i0
	lduwa	[%l7 + %i0] 0x88,	%o6
	fmovscc	%xcc,	%f7,	%f1
	edge32n	%l2,	%i6,	%o3
	tn	%icc,	0x7
	te	%xcc,	0x5
	sethi	0x0A9D,	%i7
	edge32	%i1,	%l0,	%l4
	brgz	%o1,	loop_2011
	fnot1s	%f18,	%f15
	movrgz	%o5,	%l6,	%i0
	nop
	setx	loop_2012,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_2011:
	movl	%xcc,	%g5,	%l3
	tneg	%icc,	0x6
	and	%g2,	0x0F77,	%l5
loop_2012:
	fone	%f22
	fbl	%fcc2,	loop_2013
	tcs	%icc,	0x0
	edge16l	%g6,	%g7,	%o7
	tvs	%icc,	0x5
loop_2013:
	fandnot2	%f12,	%f16,	%f6
	movrlez	%i2,	%i5,	%g3
	edge16l	%o0,	%o2,	%g1
	andncc	%l1,	%i4,	%o4
	stbar
	fmovrdgez	%i3,	%f18,	%f4
	wr	%g0,	0x80,	%asi
	stwa	%g4,	[%l7 + 0x24] %asi
	add	%l2,	%o6,	%i6
	mova	%xcc,	%o3,	%i1
	move	%icc,	%i7,	%l0
	tsubcctv	%l4,	0x0758,	%o1
	ta	%xcc,	0x1
	xor	%o5,	%l6,	%g5
	fornot2	%f30,	%f28,	%f22
	edge16	%i0,	%g2,	%l3
	tne	%icc,	0x1
	movge	%icc,	%l5,	%g6
	sdiv	%o7,	0x11DA,	%i2
	nop
	setx	0x41F8BBF2D4CE9B11,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0x1AFF70017B72D223,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	fsubd	%f12,	%f28,	%f4
	nop
	setx	loop_2014,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fcmple16	%f28,	%f10,	%g7
	fcmpgt16	%f14,	%f20,	%g3
	tcc	%xcc,	0x3
loop_2014:
	movneg	%icc,	%o0,	%o2
	tpos	%icc,	0x3
	edge8n	%i5,	%g1,	%i4
	ldx	[%l7 + 0x68],	%o4
	edge8n	%l1,	%i3,	%g4
	wr	%g0,	0x89,	%asi
	ldsba	[%l7 + 0x23] %asi,	%o6
	nop
	setx	0x97DAD6A1,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f23
	setx	0xB2A5598D,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f7
	fadds	%f7,	%f23,	%f20
	fmovdg	%icc,	%f2,	%f4
	smul	%l2,	%i6,	%o3
	movrgz	%i7,	0x2C1,	%l0
	andn	%l4,	%o1,	%i1
	tle	%xcc,	0x2
	set	0x7B, %o3
	stba	%o5,	[%l7 + %o3] 0xe2
	membar	#Sync
	tpos	%icc,	0x1
	sdiv	%g5,	0x0062,	%l6
	movne	%xcc,	%g2,	%l3
	ld	[%l7 + 0x6C],	%f26
	for	%f26,	%f20,	%f28
	edge16l	%l5,	%i0,	%o7
	fbe	%fcc3,	loop_2015
	fbl	%fcc1,	loop_2016
	movrgez	%i2,	0x011,	%g7
	xnorcc	%g6,	0x1EDB,	%o0
loop_2015:
	tge	%xcc,	0x6
loop_2016:
	andncc	%g3,	%o2,	%i5
	andncc	%i4,	%o4,	%g1
	movgu	%icc,	%i3,	%g4
	sdivx	%o6,	0x02BE,	%l1
	edge8n	%i6,	%o3,	%l2
	edge32ln	%i7,	%l0,	%l4
	tpos	%xcc,	0x3
	stb	%i1,	[%l7 + 0x0D]
	move	%xcc,	%o5,	%o1
	brz	%l6,	loop_2017
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrlez	%g5,	%g2,	%l5
	and	%i0,	%o7,	%l3
loop_2017:
	movcs	%xcc,	%g7,	%g6
	fmovsne	%xcc,	%f27,	%f10
	edge8	%o0,	%i2,	%o2
	tcc	%icc,	0x6
	nop
	set	0x38, %o7
	ldd	[%l7 + %o7],	%f18
	tleu	%xcc,	0x6
	fpackfix	%f2,	%f17
	wr	%g0,	0xf0,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
	edge32ln	%i5,	%i4,	%o4
	udivcc	%g1,	0x0A8F,	%i3
	xor	%g4,	%o6,	%l1
	fmovdvs	%xcc,	%f29,	%f18
	edge16	%i6,	%g3,	%l2
	fcmpgt16	%f6,	%f18,	%i7
	set	0x35, %i1
	ldsba	[%l7 + %i1] 0x19,	%o3
	fnor	%f26,	%f6,	%f6
	fzeros	%f17
	movgu	%xcc,	%l4,	%i1
	fmovspos	%xcc,	%f27,	%f3
	fmovdl	%icc,	%f17,	%f28
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fones	%f18
	fmovrdgez	%l0,	%f6,	%f22
	sll	%o1,	%l6,	%o5
	fpack32	%f2,	%f30,	%f20
	tl	%xcc,	0x7
	edge8	%g2,	%g5,	%l5
	edge16n	%i0,	%l3,	%g7
	wr	%g0,	0x80,	%asi
	ldxa	[%l7 + 0x60] %asi,	%g6
	taddcctv	%o0,	0x1832,	%i2
	mulscc	%o7,	%o2,	%i5
	set	0x74, %i3
	stba	%i4,	[%l7 + %i3] 0x18
	nop
	setx	0x138781F3D51CB970,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0x694EC17CAD110891,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	fdivd	%f26,	%f2,	%f26
	tvc	%icc,	0x3
	smul	%g1,	0x0BE9,	%i3
	set	0x0E, %g7
	ldstuba	[%l7 + %g7] 0x89,	%g4
	bg,a	%xcc,	loop_2018
	movleu	%icc,	%o6,	%o4
	bleu,a,pt	%icc,	loop_2019
	udivcc	%l1,	0x1068,	%i6
loop_2018:
	andncc	%l2,	%g3,	%i7
	fpsub16	%f24,	%f30,	%f18
loop_2019:
	orn	%l4,	0x00A4,	%o3
	taddcctv	%i1,	0x03E5,	%l0
	movl	%icc,	%o1,	%l6
	fbge	%fcc3,	loop_2020
	fsrc2	%f24,	%f16
	bneg,pt	%icc,	loop_2021
	tleu	%icc,	0x3
loop_2020:
	udiv	%g2,	0x16F0,	%o5
	fblg	%fcc2,	loop_2022
loop_2021:
	fmovdcc	%xcc,	%f25,	%f5
	nop
	setx	0xE754478EE05E6C52,	%l0,	%l6
	stx	%l6,	[%l7 + 0x10]
	ldx	[%l7 + 0x10],	%fsr
	te	%icc,	0x3
loop_2022:
	fpadd32s	%f26,	%f8,	%f17
	srax	%l5,	%g5,	%l3
	addccc	%i0,	0x052B,	%g7
	fbl	%fcc0,	loop_2023
	fbn,a	%fcc2,	loop_2024
	tge	%icc,	0x5
	fcmpne16	%f28,	%f0,	%o0
loop_2023:
	sdiv	%g6,	0x1060,	%i2
loop_2024:
	umul	%o2,	0x0D99,	%o7
	mova	%xcc,	%i5,	%i4
	edge16n	%i3,	%g4,	%o6
	fbue	%fcc1,	loop_2025
	tcc	%icc,	0x4
	taddcctv	%g1,	%o4,	%l1
	nop
	setx	loop_2026,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_2025:
	edge8l	%l2,	%i6,	%i7
	tge	%xcc,	0x0
	wr	%g0,	0x23,	%asi
	ldda	[%l7 + 0x60] %asi,	%g2
loop_2026:
	movrlez	%l4,	0x1DA,	%i1
	fbg,a	%fcc3,	loop_2027
	fbule	%fcc0,	loop_2028
	nop
	setx	0x80771627,	%l0,	%l6
	st	%l6,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%fsr
	smul	%o3,	%l0,	%o1
loop_2027:
	fmul8x16au	%f3,	%f28,	%f12
loop_2028:
	smul	%l6,	%g2,	%o5
	add	%l7,	0x10,	%l6
	wr	%g0,	0x04,	%asi
	casa	[%l6] %asi,	%g5,	%l3
	srl	%i0,	%l5,	%g7
	sdiv	%g6,	0x0CE7,	%o0
	mulscc	%o2,	0x0A18,	%i2
	ldsw	[%l7 + 0x7C],	%i5
	edge16n	%i4,	%o7,	%g4
	fpackfix	%f28,	%f22
	brgez	%o6,	loop_2029
	movcc	%xcc,	%g1,	%i3
	fbu,a	%fcc2,	loop_2030
	flush	%l7 + 0x68
loop_2029:
	edge8l	%o4,	%l1,	%l2
	movrgz	%i7,	%g3,	%l4
loop_2030:
	movle	%icc,	%i6,	%o3
	fbg	%fcc1,	loop_2031
	smulcc	%l0,	%i1,	%l6
	nop
	fitod	%f4,	%f8
	fdtox	%f8,	%f22
	fxtod	%f22,	%f28
	add	%l7,	0x78,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%o1
	casxa	[%l6] %asi,	%o1,	%g2
loop_2031:
	fmovdcs	%icc,	%f1,	%f2
	te	%icc,	0x7
	movne	%icc,	%o5,	%g5
	movvc	%icc,	%l3,	%i0
	fmovsl	%xcc,	%f18,	%f28
	ldsw	[%l7 + 0x38],	%g7
	bcs,pn	%xcc,	loop_2032
	for	%f6,	%f2,	%f16
	subccc	%l5,	%g6,	%o0
	tle	%icc,	0x5
loop_2032:
	fcmpgt16	%f10,	%f28,	%i2
	edge32	%i5,	%i4,	%o7
	set	0x53, %l6
	stba	%o2,	[%l7 + %l6] 0x14
	movrlez	%o6,	%g1,	%i3
	edge32l	%o4,	%l1,	%l2
	fmul8sux16	%f0,	%f14,	%f0
	stb	%i7,	[%l7 + 0x21]
	wr	%g0,	0x18,	%asi
	stba	%g3,	[%l7 + 0x2C] %asi
	movneg	%icc,	%g4,	%l4
	nop
	fitod	%f9,	%f14
	orn	%i6,	%l0,	%o3
	nop
	set	0x22, %i2
	ldstub	[%l7 + %i2],	%i1
	fmovdcs	%xcc,	%f7,	%f25
	fmovrsgez	%l6,	%f14,	%f11
	tcs	%icc,	0x2
	xorcc	%o1,	%g2,	%o5
	be,a	loop_2033
	movg	%xcc,	%l3,	%g5
	movvs	%xcc,	%i0,	%g7
	tle	%icc,	0x4
loop_2033:
	fpack16	%f6,	%f22
	sdivx	%l5,	0x017F,	%o0
	fandnot1	%f2,	%f14,	%f10
	bcc,a	loop_2034
	tgu	%xcc,	0x5
	fmovdleu	%xcc,	%f15,	%f0
	movpos	%xcc,	%i2,	%i5
loop_2034:
	edge8n	%g6,	%i4,	%o2
	fzero	%f12
	fpadd16s	%f30,	%f0,	%f11
	sll	%o7,	%o6,	%g1
	xnorcc	%o4,	%i3,	%l2
	fpsub32	%f28,	%f28,	%f18
	subc	%i7,	%g3,	%l1
	nop
	fitos	%f2,	%f18
	srl	%g4,	0x03,	%i6
	movrgez	%l4,	0x16F,	%l0
	array16	%i1,	%l6,	%o1
	fble	%fcc1,	loop_2035
	tsubcc	%o3,	%g2,	%l3
	set	0x20, %l4
	ldsha	[%l7 + %l4] 0x80,	%o5
loop_2035:
	brlez,a	%g5,	loop_2036
	srlx	%i0,	%l5,	%o0
	fbo,a	%fcc3,	loop_2037
	lduw	[%l7 + 0x2C],	%g7
loop_2036:
	srlx	%i2,	0x10,	%g6
	set	0x14, %g4
	lduwa	[%l7 + %g4] 0x11,	%i5
loop_2037:
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
	sdiv	%i4,	0x01C9,	%o7
	alignaddr	%o2,	%o6,	%g1
	te	%icc,	0x5
loop_2038:
	ldub	[%l7 + 0x4C],	%i3
	add	%l7,	0x10,	%l6
	wr	%g0,	0x18,	%asi
	casxa	[%l6] %asi,	%o4,	%l2
	nop
	setx	0xAEBA458A,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f10
	fsqrts	%f10,	%f16
	ble,a,pt	%icc,	loop_2039
	nop
	setx	0x532C0F8F,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f27
	setx	0x7E1A4FB4,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f19
	fmuls	%f19,	%f27,	%f7
	bneg,pt	%icc,	loop_2040
	movpos	%xcc,	%g3,	%i7
loop_2039:
	fmovsvs	%xcc,	%f30,	%f5
	tg	%icc,	0x2
loop_2040:
	fbl,a	%fcc2,	loop_2041
	tvs	%icc,	0x3
	tneg	%icc,	0x3
	umulcc	%l1,	0x09F3,	%g4
loop_2041:
	be,a,pn	%xcc,	loop_2042
	andncc	%i6,	%l4,	%l0
	edge16n	%l6,	%o1,	%o3
	fbe,a	%fcc3,	loop_2043
loop_2042:
	fpadd32	%f14,	%f10,	%f22
	sethi	0x0235,	%i1
	addc	%l3,	%g2,	%o5
loop_2043:
	tne	%icc,	0x7
	subccc	%g5,	%i0,	%l5
	movgu	%xcc,	%g7,	%i2
	sub	%o0,	0x0ABC,	%i5
	tleu	%xcc,	0x0
	nop
	setx	0x37E3F03D,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f15
	setx	0xDE87B9B6,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f3
	fsubs	%f3,	%f15,	%f9
	udivx	%g6,	0x1A65,	%o7
	tge	%xcc,	0x0
	tg	%xcc,	0x6
	fmovscc	%xcc,	%f23,	%f13
	ldsb	[%l7 + 0x57],	%o2
	fmul8x16au	%f2,	%f3,	%f22
	xnor	%o6,	0x1EF8,	%g1
	ldub	[%l7 + 0x20],	%i3
	tsubcc	%i4,	%o4,	%g3
	edge16	%i7,	%l1,	%g4
	edge32ln	%i6,	%l4,	%l2
	add	%l0,	0x0834,	%l6
	orcc	%o1,	%o3,	%i1
	ldd	[%l7 + 0x10],	%g2
	fmovrdgz	%o5,	%f26,	%f30
	tsubcctv	%g5,	%i0,	%l5
	andn	%g7,	0x0E2E,	%i2
	nop
	setx	0x443367E7,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f17
	setx	0x4A57AFD2,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f19
	fmuls	%f19,	%f17,	%f29
	nop
	setx	loop_2044,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	umul	%l3,	%i5,	%g6
	umulcc	%o0,	0x19C6,	%o7
	lduh	[%l7 + 0x26],	%o6
loop_2044:
	tvc	%xcc,	0x0
	andcc	%o2,	0x0482,	%i3
	fba	%fcc3,	loop_2045
	fxnors	%f26,	%f25,	%f21
	alignaddrl	%g1,	%o4,	%g3
	edge8ln	%i7,	%l1,	%i4
loop_2045:
	sll	%g4,	%i6,	%l2
	fble	%fcc3,	loop_2046
	ba,pt	%xcc,	loop_2047
	addc	%l0,	0x0A2F,	%l4
	and	%o1,	%o3,	%i1
loop_2046:
	bgu	loop_2048
loop_2047:
	brgez	%g2,	loop_2049
	udivx	%l6,	0x0010,	%g5
	bleu,a,pt	%xcc,	loop_2050
loop_2048:
	bg	%xcc,	loop_2051
loop_2049:
	te	%xcc,	0x7
	movl	%xcc,	%o5,	%i0
loop_2050:
	popc	%g7,	%i2
loop_2051:
	array16	%l5,	%i5,	%g6
	wr	%g0,	0x19,	%asi
	ldxa	[%l7 + 0x10] %asi,	%l3
	movcc	%icc,	%o0,	%o7
	sra	%o6,	0x15,	%o2
	movrgz	%g1,	0x0EE,	%o4
	set	0x40, %o6
	stda	%f16,	[%l7 + %o6] 0xf9
	membar	#Sync
	ldx	[%l7 + 0x40],	%i3
	tneg	%xcc,	0x4
	bleu,pt	%xcc,	loop_2052
	edge8n	%g3,	%l1,	%i4
	swap	[%l7 + 0x68],	%g4
	fexpand	%f7,	%f8
loop_2052:
	bpos,pt	%icc,	loop_2053
	andcc	%i6,	%l2,	%l0
	movneg	%icc,	%l4,	%o1
	bshuffle	%f14,	%f4,	%f26
loop_2053:
	bvs,a	%xcc,	loop_2054
	fmuld8sux16	%f29,	%f15,	%f24
	fpsub16s	%f16,	%f2,	%f24
	fxor	%f30,	%f6,	%f10
loop_2054:
	fmovsneg	%icc,	%f31,	%f19
	movrne	%o3,	%i7,	%g2
	fpack16	%f10,	%f28
	brlez,a	%i1,	loop_2055
	fmovsne	%xcc,	%f30,	%f14
	edge16	%l6,	%g5,	%i0
	xnor	%g7,	0x18F7,	%o5
loop_2055:
	swap	[%l7 + 0x70],	%i2
	nop
	setx	0x3071CC5F,	%l0,	%l6
	st	%l6,	[%l7 + 0x68]
	ld	[%l7 + 0x68],	%fsr
	udiv	%l5,	0x0C6E,	%g6
	fmul8x16au	%f9,	%f17,	%f8
	movpos	%icc,	%l3,	%i5
	mulscc	%o0,	%o6,	%o2
	fmovdge	%icc,	%f22,	%f19
	fmovda	%icc,	%f14,	%f24
	bleu,pt	%xcc,	loop_2056
	tgu	%xcc,	0x1
	xorcc	%o7,	%o4,	%g1
	orcc	%g3,	0x00BC,	%i3
loop_2056:
	array8	%l1,	%i4,	%g4
	movgu	%icc,	%i6,	%l2
	fcmpgt16	%f24,	%f20,	%l4
	fnors	%f16,	%f19,	%f6
	wr	%g0,	0x10,	%asi
	stxa	%o1,	[%l7 + 0x68] %asi
	add	%l0,	0x08DB,	%o3
	set	0x2D, %l0
	lduba	[%l7 + %l0] 0x81,	%g2
	fmovsl	%icc,	%f28,	%f20
	taddcctv	%i1,	0x075B,	%l6
	fmovse	%icc,	%f8,	%f6
	andcc	%i7,	0x0F2D,	%i0
	edge16n	%g5,	%g7,	%o5
	fpmerge	%f9,	%f15,	%f16
	orcc	%i2,	0x04A6,	%g6
	fabss	%f0,	%f8
	brgz	%l3,	loop_2057
	brlz	%l5,	loop_2058
	edge16l	%i5,	%o6,	%o2
	fmovdneg	%xcc,	%f20,	%f31
loop_2057:
	nop
	fitos	%f10,	%f11
	fstod	%f11,	%f0
loop_2058:
	fcmpne16	%f6,	%f10,	%o7
	fmul8sux16	%f0,	%f2,	%f0
	edge16ln	%o4,	%o0,	%g1
	or	%i3,	0x16B0,	%g3
	smul	%i4,	0x10BE,	%l1
	fpadd16s	%f16,	%f26,	%f23
	smul	%g4,	%i6,	%l2
	fsrc2	%f16,	%f2
	umulcc	%l4,	0x0F1C,	%l0
	tsubcctv	%o3,	0x0E6D,	%o1
	fmovrdgez	%i1,	%f18,	%f4
	movle	%icc,	%g2,	%i7
	st	%f17,	[%l7 + 0x20]
	fbl	%fcc1,	loop_2059
	fbul,a	%fcc3,	loop_2060
	nop
	set	0x63, %i5
	ldsb	[%l7 + %i5],	%l6
	ldub	[%l7 + 0x59],	%g5
loop_2059:
	movleu	%icc,	%i0,	%o5
loop_2060:
	fnand	%f16,	%f12,	%f0
	movrne	%g7,	0x07D,	%i2
	taddcctv	%g6,	0x02BB,	%l5
	nop
	fitod	%f4,	%f6
	array16	%i5,	%l3,	%o6
	nop
	setx	0x521F31688C550C25,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0x1E72953E59BF2253,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	fdivd	%f30,	%f8,	%f26
	movl	%icc,	%o7,	%o4
	fbue,a	%fcc0,	loop_2061
	nop
	setx loop_2062, %l0, %l1
	jmpl %l1, %o2
	tcc	%icc,	0x7
	subccc	%g1,	0x1E3E,	%i3
loop_2061:
	edge8	%o0,	%i4,	%g3
loop_2062:
	edge16n	%l1,	%i6,	%g4
	set	0x1C, %o4
	lda	[%l7 + %o4] 0x11,	%f3
	srl	%l2,	%l0,	%l4
	be,a	%icc,	loop_2063
	movrlz	%o1,	0x1FF,	%i1
	tleu	%icc,	0x0
	movrgz	%o3,	%g2,	%i7
loop_2063:
	tle	%icc,	0x0
	fba	%fcc2,	loop_2064
	edge16n	%l6,	%g5,	%o5
	sdiv	%i0,	0x047D,	%i2
	swap	[%l7 + 0x1C],	%g7
loop_2064:
	srlx	%l5,	0x07,	%g6
	mulscc	%i5,	%o6,	%o7
	fzero	%f30
	edge8l	%l3,	%o2,	%o4
	popc	%g1,	%i3
	bpos	%icc,	loop_2065
	addc	%o0,	0x0F6A,	%g3
	tneg	%xcc,	0x0
	xnor	%l1,	%i4,	%i6
loop_2065:
	ldx	[%l7 + 0x18],	%l2
	sra	%l0,	%l4,	%g4
	ld	[%l7 + 0x7C],	%f13
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array16	%o1,	%o3,	%i1
	fmovsge	%xcc,	%f25,	%f9
	tcc	%icc,	0x4
	fbul	%fcc3,	loop_2066
	fbue	%fcc0,	loop_2067
	st	%f21,	[%l7 + 0x40]
	edge16l	%i7,	%g2,	%l6
loop_2066:
	movleu	%xcc,	%g5,	%o5
loop_2067:
	andncc	%i0,	%i2,	%g7
	edge8	%l5,	%g6,	%o6
	movpos	%xcc,	%o7,	%l3
	movvs	%xcc,	%o2,	%o4
	wr	%g0,	0x80,	%asi
	ldsba	[%l7 + 0x43] %asi,	%i5
	movrlez	%g1,	0x337,	%o0
	movvc	%xcc,	%g3,	%l1
	movge	%xcc,	%i4,	%i6
	bgu,a,pt	%xcc,	loop_2068
	edge32	%l2,	%i3,	%l4
	set	0x20, %i6
	ldda	[%l7 + %i6] 0xeb,	%l0
loop_2068:
	movne	%icc,	%o1,	%o3
	flush	%l7 + 0x4C
	taddcc	%i1,	%i7,	%g4
	bvs,pn	%icc,	loop_2069
	sdivcc	%g2,	0x0C35,	%g5
	movl	%xcc,	%l6,	%o5
	nop
	setx	loop_2070,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_2069:
	bvs,a	loop_2071
	movrlz	%i0,	0x298,	%i2
	sir	0x02B5
loop_2070:
	udivcc	%l5,	0x1D46,	%g6
loop_2071:
	bshuffle	%f0,	%f0,	%f6
	movre	%g7,	%o6,	%o7
	fmovda	%xcc,	%f8,	%f8
	tsubcctv	%l3,	%o2,	%o4
	bneg,pn	%icc,	loop_2072
	membar	0x14
	nop
	setx loop_2073, %l0, %l1
	jmpl %l1, %g1
	movrgez	%o0,	0x255,	%i5
loop_2072:
	fmovsge	%icc,	%f26,	%f3
	movcs	%icc,	%l1,	%g3
loop_2073:
	nop
	setx	0xE0DEFD25,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f21
	setx	0xCC99B6D0,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f29
	fmuls	%f29,	%f21,	%f8
	fones	%f31
	movle	%icc,	%i4,	%i6
	nop
	setx	0x9DC6A8E2,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f26
	setx	0x6CDB1F6F,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f31
	fdivs	%f31,	%f26,	%f23
	wr	%g0,	0x23,	%asi
	stha	%l2,	[%l7 + 0x2E] %asi
	membar	#Sync
	fmovrdlez	%i3,	%f18,	%f30
	umulcc	%l0,	0x0476,	%o1
	ldx	[%l7 + 0x40],	%l4
	movcs	%xcc,	%i1,	%o3
	fpsub32	%f16,	%f14,	%f10
	fnot2s	%f21,	%f4
	xorcc	%g4,	0x1018,	%g2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	add	%g5,	0x017E,	%l6
	tgu	%icc,	0x6
	fexpand	%f10,	%f22
	movpos	%icc,	%o5,	%i7
	tsubcctv	%i0,	0x064A,	%l5
	fmovrde	%i2,	%f12,	%f0
	fmovrse	%g7,	%f2,	%f11
	udivcc	%o6,	0x11A9,	%g6
	wr	%g0,	0x80,	%asi
	sta	%f1,	[%l7 + 0x3C] %asi
	movrne	%o7,	0x31D,	%o2
	taddcc	%o4,	%l3,	%g1
	movvs	%icc,	%o0,	%i5
	fxnor	%f30,	%f6,	%f12
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tg	%icc,	0x2
	tle	%xcc,	0x3
	brgez,a	%g3,	loop_2074
	edge16	%l1,	%i4,	%l2
	taddcc	%i6,	%l0,	%o1
	bcc,pt	%icc,	loop_2075
loop_2074:
	and	%l4,	0x140C,	%i3
	movvc	%xcc,	%o3,	%g4
	fmovdgu	%xcc,	%f27,	%f31
loop_2075:
	movle	%icc,	%g2,	%g5
	fornot1s	%f3,	%f22,	%f3
	movrgez	%l6,	0x117,	%i1
	wr	%g0,	0x81,	%asi
	lda	[%l7 + 0x34] %asi,	%f7
	tn	%icc,	0x3
	tleu	%icc,	0x3
	taddcc	%i7,	0x0A6B,	%i0
	tle	%xcc,	0x6
	tpos	%xcc,	0x3
	fba,a	%fcc3,	loop_2076
	andn	%l5,	%i2,	%o5
	sir	0x161D
	fblg	%fcc3,	loop_2077
loop_2076:
	andcc	%g7,	0x1C5B,	%o6
	bvc	%xcc,	loop_2078
	tneg	%xcc,	0x7
loop_2077:
	edge32n	%g6,	%o2,	%o7
	movleu	%icc,	%l3,	%g1
loop_2078:
	nop
	set	0x2C, %g6
	sta	%f23,	[%l7 + %g6] 0x81
	fmuld8ulx16	%f7,	%f24,	%f8
	movrgez	%o0,	%o4,	%g3
	nop
	setx	0x0CFF7A137077BDBD,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldx	[%l7 + 0x28],	%fsr
	fbul	%fcc3,	loop_2079
	fbug	%fcc0,	loop_2080
	sdivcc	%l1,	0x0951,	%i4
	edge8l	%i5,	%l2,	%i6
loop_2079:
	sethi	0x116D,	%l0
loop_2080:
	movrlez	%l4,	0x1F1,	%o1
	xnor	%o3,	%g4,	%i3
	xnorcc	%g2,	%g5,	%l6
	edge16ln	%i7,	%i1,	%l5
	movrgez	%i2,	0x12A,	%i0
	fmuld8ulx16	%f19,	%f23,	%f24
	srax	%g7,	0x02,	%o6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	te	%icc,	0x7
	fnegs	%f15,	%f12
	stb	%g6,	[%l7 + 0x75]
	srlx	%o2,	0x16,	%o5
	movge	%xcc,	%l3,	%o7
	udivcc	%g1,	0x0FCD,	%o0
	or	%o4,	0x0A66,	%g3
	sethi	0x06E5,	%i4
	fbg,a	%fcc0,	loop_2081
	bgu,pt	%icc,	loop_2082
	nop
	setx	0x5469B76D0EA4CEE0,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	fsqrtd	%f8,	%f2
	mulx	%i5,	0x0AA3,	%l1
loop_2081:
	movcs	%icc,	%i6,	%l0
loop_2082:
	subccc	%l4,	%o1,	%o3
	ldx	[%l7 + 0x78],	%g4
	srax	%l2,	0x1C,	%g2
	prefetch	[%l7 + 0x64],	 0x2
	movvc	%xcc,	%g5,	%i3
	addccc	%l6,	0x0935,	%i7
	st	%f11,	[%l7 + 0x08]
	movrne	%i1,	0x050,	%l5
	ldsh	[%l7 + 0x6E],	%i0
	and	%g7,	0x1FFF,	%o6
	tle	%xcc,	0x4
	addcc	%g6,	%i2,	%o5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	fitos	%f11,	%f17
	fstox	%f17,	%f10
	fxtos	%f10,	%f0
	xor	%o2,	0x0DCF,	%o7
	udivx	%g1,	0x12A4,	%o0
	movg	%xcc,	%o4,	%g3
	taddcc	%l3,	%i4,	%l1
	bvc,a	%xcc,	loop_2083
	fblg	%fcc2,	loop_2084
	ldd	[%l7 + 0x40],	%f0
	edge16l	%i6,	%l0,	%l4
loop_2083:
	sll	%i5,	0x10,	%o3
loop_2084:
	stb	%o1,	[%l7 + 0x57]
	fpack16	%f12,	%f14
	movvc	%xcc,	%l2,	%g4
	sethi	0x1738,	%g5
	fcmpne16	%f2,	%f24,	%i3
	nop
	setx	loop_2085,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	nop
	setx	loop_2086,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fbe,a	%fcc2,	loop_2087
	bleu	%xcc,	loop_2088
loop_2085:
	srl	%l6,	%g2,	%i1
loop_2086:
	orcc	%i7,	%l5,	%i0
loop_2087:
	tne	%xcc,	0x5
loop_2088:
	stb	%o6,	[%l7 + 0x2A]
	fmovrdlz	%g7,	%f14,	%f10
	subcc	%g6,	0x0D05,	%o5
	subccc	%o2,	%o7,	%g1
	fmovrslz	%o0,	%f24,	%f26
	movrlz	%i2,	%g3,	%o4
	sth	%l3,	[%l7 + 0x1C]
	movvc	%icc,	%i4,	%i6
	std	%f24,	[%l7 + 0x20]
	edge32l	%l1,	%l0,	%i5
	movpos	%xcc,	%o3,	%l4
	nop
	fitos	%f4,	%f13
	fstox	%f13,	%f22
	movrne	%o1,	0x027,	%g4
	sdivcc	%l2,	0x009C,	%i3
	bcc,a	%xcc,	loop_2089
	array8	%g5,	%l6,	%g2
	fmovde	%xcc,	%f22,	%f4
	umul	%i1,	0x116F,	%l5
loop_2089:
	nop
	wr	%g0,	0x18,	%asi
	lduha	[%l7 + 0x6A] %asi,	%i0
	fmovsleu	%icc,	%f24,	%f23
	movrgz	%i7,	%g7,	%o6
	orcc	%o5,	%o2,	%g6
	fbul,a	%fcc0,	loop_2090
	movneg	%xcc,	%g1,	%o0
	movre	%i2,	0x12A,	%g3
	edge16	%o7,	%l3,	%i4
loop_2090:
	udivx	%i6,	0x0F4D,	%o4
	te	%icc,	0x6
	xnor	%l0,	0x0E6C,	%i5
	sdiv	%o3,	0x0947,	%l1
	fabss	%f31,	%f30
	bge	%xcc,	loop_2091
	movge	%icc,	%o1,	%l4
	fnors	%f8,	%f0,	%f0
	movne	%xcc,	%g4,	%l2
loop_2091:
	andncc	%i3,	%g5,	%l6
	movrne	%i1,	%l5,	%i0
	fand	%f20,	%f10,	%f4
	addccc	%i7,	%g2,	%g7
	edge32ln	%o5,	%o2,	%g6
	nop
	fitod	%f2,	%f20
	fdtoi	%f20,	%f8
	sdivx	%o6,	0x1F71,	%g1
	subccc	%i2,	%g3,	%o7
	fabss	%f27,	%f6
	orncc	%l3,	0x0E36,	%o0
	fnor	%f10,	%f10,	%f4
	add	%l7,	0x08,	%l6
	wr	%g0,	0x0c,	%asi
	casa	[%l6] 0x0c,	%i4,	%o4
	umul	%i6,	0x1ACC,	%l0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	pdist	%f28,	%f18,	%f28
	tsubcc	%i5,	0x064C,	%l1
	tg	%xcc,	0x4
	fmovsg	%icc,	%f7,	%f12
	edge32	%o1,	%o3,	%g4
	alignaddr	%l2,	%l4,	%g5
	fbu	%fcc0,	loop_2092
	fmovdvc	%xcc,	%f16,	%f18
	fbe	%fcc0,	loop_2093
	bn	%icc,	loop_2094
loop_2092:
	fblg,a	%fcc3,	loop_2095
	st	%f17,	[%l7 + 0x4C]
loop_2093:
	tn	%icc,	0x2
loop_2094:
	nop
	set	0x4C, %o5
	ldswa	[%l7 + %o5] 0x81,	%i3
loop_2095:
	nop
	setx	0x31E5B13821EAAC34,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0xEE32C3CA9E939BCD,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	fdivd	%f14,	%f30,	%f14
	movcc	%icc,	%l6,	%i1
	movpos	%xcc,	%i0,	%l5
	bne	%xcc,	loop_2096
	andn	%i7,	0x1572,	%g2
	bneg,a	%xcc,	loop_2097
	sub	%g7,	%o5,	%o2
loop_2096:
	nop
	add	%l7,	0x70,	%l6
	wr	%g0,	0x0c,	%asi
	casa	[%l6] %asi,	%o6,	%g1
loop_2097:
	edge8l	%i2,	%g3,	%o7
	tcs	%xcc,	0x1
	brlez	%l3,	loop_2098
	ldub	[%l7 + 0x5C],	%o0
	fmovsn	%icc,	%f18,	%f31
	array8	%i4,	%o4,	%g6
loop_2098:
	edge16ln	%i6,	%l0,	%l1
	tsubcc	%i5,	0x1DD3,	%o1
	fmovsge	%xcc,	%f4,	%f13
	stx	%g4,	[%l7 + 0x68]
	flush	%l7 + 0x44
	fbue	%fcc2,	loop_2099
	fands	%f12,	%f5,	%f4
	fzeros	%f11
	or	%o3,	0x050B,	%l4
loop_2099:
	nop
	setx	0x6DA5F085C13276D7,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0x294A6715590B78CB,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	fsubd	%f10,	%f16,	%f4
	nop
	setx	0x02CF30AACD601B99,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0x397C166039188FB5,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	fmuld	%f2,	%f20,	%f14
	fble	%fcc2,	loop_2100
	fornot1s	%f2,	%f27,	%f25
	tg	%xcc,	0x2
	prefetch	[%l7 + 0x40],	 0x1
loop_2100:
	fbe	%fcc2,	loop_2101
	srl	%g5,	0x1F,	%l2
	movcc	%xcc,	%l6,	%i1
	movrne	%i3,	0x0AC,	%i0
loop_2101:
	fmul8sux16	%f8,	%f30,	%f6
	movle	%xcc,	%l5,	%g2
	movrgez	%g7,	%o5,	%o2
	wr	%g0,	0x19,	%asi
	lda	[%l7 + 0x38] %asi,	%f13
	edge32	%o6,	%g1,	%i7
	fmovdcc	%xcc,	%f24,	%f6
	sdivx	%i2,	0x1687,	%o7
	subc	%l3,	%o0,	%g3
	umulcc	%o4,	0x1660,	%i4
	bvs,pt	%icc,	loop_2102
	fbne	%fcc3,	loop_2103
	fmovrsne	%i6,	%f14,	%f30
	std	%f18,	[%l7 + 0x60]
loop_2102:
	edge8l	%g6,	%l1,	%i5
loop_2103:
	tsubcctv	%o1,	%l0,	%g4
	stb	%o3,	[%l7 + 0x27]
	tsubcc	%g5,	0x0439,	%l4
	tcs	%icc,	0x2
	xnorcc	%l6,	0x0DF1,	%l2
	tne	%icc,	0x1
	bshuffle	%f18,	%f16,	%f6
	fmovde	%icc,	%f16,	%f13
	set	0x50, %o1
	lda	[%l7 + %o1] 0x11,	%f19
	nop
	setx	0xDD511B12,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f1
	setx	0x690FC835,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f23
	fmuls	%f23,	%f1,	%f9
	srlx	%i3,	%i0,	%l5
	fands	%f1,	%f10,	%f11
	srl	%i1,	%g7,	%g2
	sra	%o2,	%o5,	%g1
	srl	%i7,	0x19,	%o6
	sra	%o7,	%i2,	%l3
	srl	%o0,	%o4,	%g3
	tvs	%icc,	0x5
	sra	%i4,	0x12,	%g6
	movl	%xcc,	%i6,	%i5
	set	0x08, %i4
	lduwa	[%l7 + %i4] 0x14,	%l1
	mulx	%o1,	0x1EE7,	%g4
	fpadd16s	%f21,	%f4,	%f20
	call	loop_2104
	sir	0x03FC
	movleu	%xcc,	%o3,	%g5
	fbu,a	%fcc0,	loop_2105
loop_2104:
	movne	%xcc,	%l0,	%l6
	faligndata	%f2,	%f8,	%f2
	edge32	%l4,	%i3,	%l2
loop_2105:
	movrgez	%i0,	%i1,	%l5
	bvs,a,pn	%xcc,	loop_2106
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16l	%g7,	%g2,	%o2
	set	0x24, %g3
	stwa	%o5,	[%l7 + %g3] 0x0c
loop_2106:
	fones	%f30
	edge32n	%i7,	%o6,	%o7
	movvc	%xcc,	%g1,	%l3
	fmovrsgz	%o0,	%f10,	%f5
	alignaddr	%o4,	%i2,	%i4
	smulcc	%g6,	0x157B,	%g3
	nop
	setx	0x90422D36,	%l0,	%l6
	st	%l6,	[%l7 + 0x48]
	ld	[%l7 + 0x48],	%fsr
	stw	%i6,	[%l7 + 0x0C]
	edge8	%l1,	%i5,	%g4
	edge16n	%o1,	%o3,	%g5
	movrne	%l6,	0x352,	%l4
	edge16n	%l0,	%i3,	%l2
	udivcc	%i1,	0x10D2,	%i0
	array32	%l5,	%g2,	%o2
	ba,a,pn	%icc,	loop_2107
	edge16ln	%o5,	%g7,	%o6
	udiv	%o7,	0x154F,	%g1
	fmovrsgez	%i7,	%f12,	%f13
loop_2107:
	std	%f0,	[%l7 + 0x38]
	te	%icc,	0x3
	tne	%xcc,	0x5
	edge8l	%o0,	%l3,	%o4
	movrlez	%i2,	0x06F,	%g6
	fmovsn	%xcc,	%f12,	%f30
	set	0x20, %g5
	ldsha	[%l7 + %g5] 0x89,	%g3
	xor	%i4,	%l1,	%i6
	srax	%g4,	0x1E,	%o1
	tle	%xcc,	0x1
	subc	%o3,	%i5,	%l6
	brz,a	%g5,	loop_2108
	nop
	setx	0xDF2589D53AD5DA1B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0x2A75FF72F6F25DD7,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	fdivd	%f30,	%f20,	%f0
	sdivcc	%l0,	0x0566,	%i3
	movvc	%xcc,	%l4,	%l2
loop_2108:
	mova	%xcc,	%i0,	%i1
	set	0x0D, %g2
	ldstuba	[%l7 + %g2] 0x0c,	%g2
	sll	%l5,	0x1D,	%o5
	mulx	%g7,	0x1C08,	%o2
	set	0x10, %g1
	ldxa	[%g0 + %g1] 0x4f,	%o7
	be,a,pt	%icc,	loop_2109
	edge16ln	%o6,	%g1,	%i7
	movrlez	%o0,	0x05A,	%l3
	alignaddr	%o4,	%i2,	%g6
loop_2109:
	nop
	setx	0x4E3214A4,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f12
	setx	0x20E9DF2D,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f19
	fsubs	%f19,	%f12,	%f14
	tpos	%xcc,	0x6
	andn	%g3,	%i4,	%i6
	tneg	%xcc,	0x3
	fmovspos	%xcc,	%f0,	%f17
	udiv	%g4,	0x0E43,	%l1
	add	%o3,	%i5,	%o1
	sdiv	%l6,	0x1C44,	%g5
	nop
	fitod	%f25,	%f10
	set	0x12, %l3
	ldstuba	[%l7 + %l3] 0x04,	%l0
	bpos,a	%xcc,	loop_2110
	fmovdcs	%icc,	%f11,	%f13
	fandnot2	%f16,	%f4,	%f2
	fmul8x16al	%f30,	%f1,	%f24
loop_2110:
	mova	%icc,	%l4,	%l2
	addc	%i0,	%i3,	%i1
	tleu	%icc,	0x0
	fxor	%f6,	%f14,	%f22
	fandnot2s	%f3,	%f27,	%f30
	ldd	[%l7 + 0x18],	%l4
	movneg	%xcc,	%g2,	%g7
	brnz	%o2,	loop_2111
	udivx	%o7,	0x18F2,	%o6
	sllx	%g1,	0x12,	%o5
	fmovrdne	%i7,	%f26,	%f0
loop_2111:
	nop
	set	0x53, %l1
	lduba	[%l7 + %l1] 0x88,	%l3
	movrgez	%o4,	0x184,	%o0
	movpos	%xcc,	%i2,	%g3
	fpack16	%f2,	%f21
	alignaddr	%g6,	%i4,	%i6
	brnz,a	%l1,	loop_2112
	andn	%o3,	0x0F5C,	%g4
	movre	%o1,	%l6,	%g5
	taddcc	%i5,	0x1801,	%l4
loop_2112:
	bgu,pn	%icc,	loop_2113
	fba	%fcc2,	loop_2114
	umulcc	%l0,	0x1AC1,	%i0
	fands	%f8,	%f21,	%f22
loop_2113:
	tne	%icc,	0x3
loop_2114:
	fbug,a	%fcc3,	loop_2115
	movre	%l2,	%i1,	%i3
	array32	%l5,	%g7,	%o2
	movcs	%icc,	%g2,	%o7
loop_2115:
	movl	%icc,	%g1,	%o6
	fmuld8ulx16	%f22,	%f2,	%f18
	udiv	%i7,	0x0920,	%l3
	set	0x20, %i7
	stxa	%o5,	[%l7 + %i7] 0xea
	membar	#Sync
	tpos	%xcc,	0x5
	edge16n	%o4,	%o0,	%i2
	wr	%g0,	0x22,	%asi
	stha	%g6,	[%l7 + 0x12] %asi
	membar	#Sync
	fbn	%fcc2,	loop_2116
	ld	[%l7 + 0x30],	%f31
	fpadd16	%f8,	%f14,	%f14
	movneg	%xcc,	%i4,	%i6
loop_2116:
	nop
	wr	%g0,	0x2f,	%asi
	stxa	%l1,	[%l7 + 0x20] %asi
	membar	#Sync
	nop
	setx	0xFA7909E0,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f24
	fsqrts	%f24,	%f8
	bpos,pt	%xcc,	loop_2117
	movneg	%icc,	%o3,	%g3
	srlx	%o1,	0x09,	%g4
	fmovdneg	%icc,	%f29,	%f2
loop_2117:
	tneg	%icc,	0x6
	fcmpgt32	%f18,	%f22,	%g5
	or	%i5,	0x15D7,	%l6
	fpack16	%f26,	%f3
	tg	%xcc,	0x0
	st	%f30,	[%l7 + 0x68]
	array8	%l4,	%l0,	%l2
	fzero	%f8
	orncc	%i0,	%i1,	%i3
	srl	%g7,	%l5,	%g2
	tg	%xcc,	0x7
	srl	%o7,	%o2,	%g1
	ldstub	[%l7 + 0x3A],	%i7
	movleu	%icc,	%o6,	%o5
	alignaddrl	%o4,	%o0,	%i2
	sth	%l3,	[%l7 + 0x74]
	edge32n	%g6,	%i6,	%i4
	xnorcc	%o3,	0x14B2,	%g3
	bcc,pt	%icc,	loop_2118
	ba,a	%icc,	loop_2119
	addc	%o1,	0x07B5,	%l1
	fmovrsne	%g4,	%f6,	%f11
loop_2118:
	fmuld8sux16	%f29,	%f13,	%f8
loop_2119:
	andncc	%g5,	%i5,	%l4
	sll	%l6,	0x1B,	%l0
	fbe,a	%fcc3,	loop_2120
	tneg	%xcc,	0x3
	array32	%i0,	%i1,	%l2
	smulcc	%g7,	%l5,	%g2
loop_2120:
	movcc	%icc,	%o7,	%i3
	fandnot2s	%f6,	%f19,	%f6
	for	%f12,	%f10,	%f24
	set	0x44, %o0
	stwa	%g1,	[%l7 + %o0] 0x2b
	membar	#Sync
	nop
	fitos	%f0,	%f10
	fstod	%f10,	%f18
	stb	%o2,	[%l7 + 0x2B]
	smulcc	%i7,	%o5,	%o6
	fmovrdlez	%o0,	%f14,	%f4
	alignaddr	%o4,	%l3,	%i2
	smul	%i6,	%g6,	%i4
	tcc	%xcc,	0x5
	fbug,a	%fcc0,	loop_2121
	fbo	%fcc2,	loop_2122
	fpackfix	%f4,	%f6
	smulcc	%g3,	0x0827,	%o3
loop_2121:
	tle	%icc,	0x1
loop_2122:
	tpos	%icc,	0x3
	sra	%l1,	%o1,	%g4
	fcmpne16	%f0,	%f6,	%g5
	tcc	%xcc,	0x0
	membar	#Sync
	wr	%g0,	0xf1,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	tne	%xcc,	0x5
	tl	%xcc,	0x2
	fmul8x16al	%f4,	%f3,	%f22
	tvc	%icc,	0x7
	tcc	%icc,	0x3
	tgu	%xcc,	0x6
	bneg,a,pn	%icc,	loop_2123
	bcc,a,pt	%xcc,	loop_2124
	tg	%xcc,	0x1
	movneg	%xcc,	%i5,	%l4
loop_2123:
	brnz,a	%l0,	loop_2125
loop_2124:
	edge16n	%i0,	%i1,	%l2
	ldd	[%l7 + 0x48],	%g6
	movgu	%xcc,	%l6,	%g2
loop_2125:
	edge32l	%o7,	%l5,	%g1
	edge32l	%i3,	%o2,	%i7
	set	0x74, %l2
	sta	%f17,	[%l7 + %l2] 0x19
	lduh	[%l7 + 0x12],	%o6
	tle	%icc,	0x6
	tle	%icc,	0x3
	tleu	%xcc,	0x7
	brgez	%o0,	loop_2126
	xnorcc	%o4,	0x11BB,	%l3
	srax	%o5,	%i6,	%g6
	ta	%xcc,	0x7
loop_2126:
	xor	%i4,	0x0D69,	%g3
	movrlez	%o3,	%l1,	%i2
	movneg	%xcc,	%g4,	%o1
	tg	%xcc,	0x1
	sth	%i5,	[%l7 + 0x6A]
	set	0x28, %o2
	lduba	[%l7 + %o2] 0x89,	%l4
	movrlez	%g5,	%i0,	%i1
	wr	%g0,	0x0c,	%asi
	lduwa	[%l7 + 0x5C] %asi,	%l2
	bgu,pn	%xcc,	loop_2127
	fmovdpos	%xcc,	%f26,	%f14
	set	0x67, %l5
	lduba	[%l7 + %l5] 0x0c,	%g7
loop_2127:
	umul	%l0,	%g2,	%o7
	nop
	setx	0x02645E3394DE9234,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	fsqrtd	%f22,	%f12
	fxors	%f11,	%f1,	%f29
	addc	%l6,	%l5,	%g1
	subcc	%o2,	%i7,	%o6
	edge32l	%o0,	%i3,	%l3
	bpos,a	loop_2128
	fnands	%f8,	%f22,	%f30
	movgu	%xcc,	%o5,	%o4
	wr	%g0,	0x04,	%asi
	prefetcha	[%l7 + 0x38] %asi,	 0x3
loop_2128:
	movl	%icc,	%i4,	%g6
	fbg,a	%fcc1,	loop_2129
	stw	%o3,	[%l7 + 0x54]
	sdivx	%l1,	0x0786,	%i2
	movre	%g3,	%g4,	%i5
loop_2129:
	stw	%l4,	[%l7 + 0x30]
	movpos	%icc,	%o1,	%g5
	edge8	%i1,	%i0,	%g7
	subcc	%l0,	0x1F56,	%g2
	ldd	[%l7 + 0x50],	%f18
	tpos	%xcc,	0x3
	fpadd16	%f16,	%f22,	%f26
	set	0x4C, %i0
	lduba	[%l7 + %i0] 0x89,	%o7
	fpadd32s	%f19,	%f20,	%f26
	movrgz	%l6,	%l2,	%l5
	fbue	%fcc2,	loop_2130
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	fitos	%f1,	%f14
	fstox	%f14,	%f26
	fblg	%fcc0,	loop_2131
loop_2130:
	fxnor	%f30,	%f0,	%f6
	fone	%f0
	movle	%xcc,	%g1,	%o2
loop_2131:
	sll	%o6,	0x05,	%o0
	udivcc	%i7,	0x0F73,	%i3
	edge8l	%o5,	%l3,	%i6
	movn	%icc,	%o4,	%g6
	wr	%g0,	0x80,	%asi
	lduwa	[%l7 + 0x50] %asi,	%o3
	fmovrslez	%i4,	%f23,	%f14
	mulscc	%l1,	0x1EF9,	%g3
	orn	%g4,	0x10A4,	%i5
	movre	%i2,	%o1,	%l4
	fmovdge	%icc,	%f9,	%f26
	movre	%i1,	%i0,	%g7
	bn	%xcc,	loop_2132
	bpos	loop_2133
	movleu	%icc,	%g5,	%l0
	sdiv	%o7,	0x1113,	%l6
loop_2132:
	ta	%xcc,	0x5
loop_2133:
	subcc	%g2,	0x0881,	%l5
	tl	%xcc,	0x0
	taddcctv	%g1,	0x0825,	%l2
	sll	%o6,	%o0,	%o2
	array16	%i7,	%i3,	%o5
	edge32	%i6,	%l3,	%g6
	taddcc	%o3,	0x03AE,	%i4
	fxor	%f14,	%f6,	%f16
	fmovrsgez	%o4,	%f5,	%f9
	nop
	set	0x0D, %o7
	stb	%l1,	[%l7 + %o7]
	fnors	%f1,	%f20,	%f9
	addc	%g3,	%i5,	%g4
	movrlz	%o1,	%i2,	%i1
	tg	%xcc,	0x4
	movgu	%icc,	%l4,	%i0
	taddcc	%g7,	0x1716,	%g5
	fsrc1	%f30,	%f8
	addcc	%l0,	%l6,	%g2
	set	0x40, %o3
	stda	%f0,	[%l7 + %o3] 0x89
	pdist	%f8,	%f12,	%f28
	fbge	%fcc0,	loop_2134
	edge32n	%o7,	%l5,	%g1
	subcc	%o6,	%o0,	%l2
	edge16	%i7,	%o2,	%o5
loop_2134:
	tcc	%icc,	0x1
	fornot2	%f2,	%f24,	%f18
	array32	%i3,	%l3,	%i6
	addccc	%g6,	0x111D,	%i4
	ta	%icc,	0x7
	xor	%o4,	%l1,	%o3
	fsrc1s	%f3,	%f4
	taddcctv	%i5,	%g4,	%o1
	movrne	%i2,	0x19C,	%i1
	tge	%icc,	0x1
	xorcc	%l4,	0x021A,	%g3
	sll	%g7,	%g5,	%i0
	alignaddr	%l6,	%l0,	%o7
	wr	%g0,	0x88,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	nop
	set	0x40, %i1
	prefetch	[%l7 + %i1],	 0x0
	umulcc	%l5,	0x0F0E,	%g2
	lduw	[%l7 + 0x38],	%o6
	fcmpgt32	%f4,	%f22,	%g1
	fbue	%fcc1,	loop_2135
	tn	%icc,	0x1
	xorcc	%o0,	0x1D42,	%l2
	edge16l	%i7,	%o2,	%o5
loop_2135:
	fpack16	%f30,	%f16
	array8	%l3,	%i6,	%i3
	set	0x70, %g7
	ldda	[%l7 + %g7] 0x22,	%g6
	movg	%xcc,	%o4,	%l1
	movne	%icc,	%o3,	%i4
	bvs	%icc,	loop_2136
	fmovrdlez	%g4,	%f30,	%f0
	nop
	fitos	%f22,	%f7
	flush	%l7 + 0x5C
loop_2136:
	tneg	%icc,	0x2
	movge	%icc,	%o1,	%i5
	nop
	setx	0x10607CC5,	%l0,	%l6
	st	%l6,	[%l7 + 0x20]
	ld	[%l7 + 0x20],	%fsr
	umulcc	%i2,	%l4,	%g3
	nop
	fitod	%f6,	%f2
	fdtoi	%f2,	%f9
	srl	%g7,	0x1D,	%i1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bcs,a	%xcc,	loop_2137
	movgu	%icc,	%i0,	%g5
	movvs	%icc,	%l6,	%o7
	sub	%l0,	%l5,	%g2
loop_2137:
	movre	%g1,	%o0,	%l2
	edge32l	%i7,	%o2,	%o6
	movgu	%icc,	%o5,	%i6
	set	0x40, %i3
	ldswa	[%l7 + %i3] 0x11,	%l3
	set	0x60, %l6
	swapa	[%l7 + %l6] 0x89,	%g6
	set	0x1A, %l4
	stba	%i3,	[%l7 + %l4] 0x19
	st	%f0,	[%l7 + 0x2C]
	movrlz	%o4,	0x217,	%l1
	set	0x0, %g4
	stxa	%o3,	[%g0 + %g4] 0x4f
	xnor	%g4,	%o1,	%i5
	tsubcc	%i2,	%l4,	%g3
	fzeros	%f1
	movre	%g7,	%i1,	%i0
	ldub	[%l7 + 0x0A],	%i4
	movvs	%xcc,	%l6,	%o7
	edge8l	%l0,	%g5,	%g2
	bn	%xcc,	loop_2138
	edge16n	%l5,	%g1,	%o0
	bvs,a,pn	%xcc,	loop_2139
	tcs	%xcc,	0x3
loop_2138:
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
	edge32	%l2,	%o2,	%i7
loop_2139:
	fornot2	%f0,	%f30,	%f30
	wr	%g0,	0x0c,	%asi
	lduba	[%l7 + 0x35] %asi,	%o6
loop_2140:
	fcmpeq16	%f16,	%f30,	%i6
	tpos	%icc,	0x1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tl	%icc,	0x4
	subcc	%o5,	%g6,	%l3
	fabss	%f7,	%f9
	ld	[%l7 + 0x5C],	%f4
	taddcc	%i3,	0x1FE5,	%o4
	ldsh	[%l7 + 0x08],	%o3
	xorcc	%g4,	0x1FEC,	%l1
	wr	%g0,	0x89,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	fblg,a	%fcc3,	loop_2141
	tcc	%xcc,	0x3
	set	0x28, %i2
	lduha	[%l7 + %i2] 0x88,	%o1
loop_2141:
	tvc	%xcc,	0x3
	wr	%g0,	0xf8,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
	tle	%xcc,	0x0
	edge16n	%i2,	%i5,	%l4
	fcmpeq32	%f16,	%f4,	%g3
	fmovrde	%g7,	%f0,	%f8
	movrlz	%i1,	%i4,	%i0
	fxor	%f26,	%f16,	%f12
	fmovrsne	%o7,	%f23,	%f28
	fmovsg	%xcc,	%f26,	%f21
	fmovs	%f28,	%f19
	tsubcctv	%l0,	0x10C5,	%g5
	movrgz	%l6,	0x12A,	%g2
	tsubcctv	%g1,	%o0,	%l2
	ld	[%l7 + 0x40],	%f29
	movleu	%xcc,	%o2,	%i7
	ta	%xcc,	0x4
	movrgz	%o6,	%l5,	%o5
	umulcc	%g6,	%l3,	%i6
	edge32	%o4,	%i3,	%g4
	nop
	setx	0x427C074C,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f13
	setx	0x6661A838,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f0
	fsubs	%f0,	%f13,	%f25
	wr	%g0,	0x10,	%asi
	ldxa	[%l7 + 0x40] %asi,	%l1
	add	%o1,	%o3,	%i2
	fbl,a	%fcc2,	loop_2142
	movcs	%icc,	%i5,	%l4
	sdiv	%g3,	0x1902,	%i1
	fbe,a	%fcc2,	loop_2143
loop_2142:
	movle	%icc,	%i4,	%g7
	fands	%f7,	%f10,	%f30
	brgez	%o7,	loop_2144
loop_2143:
	edge32n	%i0,	%g5,	%l0
	fcmpeq32	%f16,	%f8,	%l6
	ta	%icc,	0x6
loop_2144:
	movn	%xcc,	%g2,	%o0
	sethi	0x09CF,	%g1
	movneg	%xcc,	%o2,	%i7
	fmovdg	%icc,	%f23,	%f24
	movrne	%l2,	0x351,	%l5
	fmovspos	%xcc,	%f2,	%f7
	fmovdvs	%icc,	%f27,	%f27
	ld	[%l7 + 0x0C],	%f4
	srl	%o5,	0x1D,	%g6
	fmovsleu	%icc,	%f0,	%f18
	fnegs	%f20,	%f31
	array8	%l3,	%o6,	%o4
	fmovdne	%xcc,	%f17,	%f31
	array32	%i6,	%g4,	%l1
	fpsub16s	%f15,	%f8,	%f21
	orncc	%o1,	%o3,	%i2
	movcc	%icc,	%i3,	%l4
	fsrc1	%f22,	%f10
	addccc	%g3,	%i5,	%i4
	array8	%g7,	%i1,	%i0
	nop
	fitod	%f31,	%f2
	fandnot1s	%f27,	%f9,	%f1
	movpos	%icc,	%g5,	%l0
	movrgez	%l6,	%o7,	%g2
	te	%icc,	0x0
	xnor	%g1,	%o2,	%i7
	tge	%xcc,	0x4
	fandnot2	%f18,	%f10,	%f16
	tleu	%icc,	0x4
	andn	%l2,	%l5,	%o5
	movre	%g6,	%l3,	%o6
	movrlez	%o0,	%o4,	%g4
	sethi	0x0D50,	%l1
	fcmpeq32	%f8,	%f4,	%o1
	fmovrsgz	%o3,	%f19,	%f26
	fmovscc	%xcc,	%f7,	%f31
	wr	%g0,	0x88,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	alignaddr	%i2,	%i6,	%i3
	xorcc	%l4,	%i5,	%g3
	move	%icc,	%i4,	%g7
	tneg	%icc,	0x3
	fba,a	%fcc2,	loop_2145
	subc	%i0,	%g5,	%i1
	ldsb	[%l7 + 0x16],	%l6
	wr	%g0,	0x10,	%asi
	sta	%f12,	[%l7 + 0x50] %asi
loop_2145:
	udiv	%o7,	0x1207,	%g2
	fmovse	%icc,	%f1,	%f29
	tgu	%xcc,	0x5
	fbg,a	%fcc3,	loop_2146
	tg	%icc,	0x0
	bcs,pt	%xcc,	loop_2147
	movl	%xcc,	%g1,	%l0
loop_2146:
	fmovdcc	%xcc,	%f23,	%f10
	tvc	%xcc,	0x6
loop_2147:
	movcc	%icc,	%o2,	%l2
	movre	%i7,	0x237,	%l5
	bl,a	loop_2148
	fmovrslz	%o5,	%f11,	%f28
	edge16	%l3,	%o6,	%o0
	fmovdne	%icc,	%f8,	%f13
loop_2148:
	tvc	%xcc,	0x2
	array8	%g6,	%o4,	%g4
	nop
	set	0x20, %l0
	ldx	[%l7 + %l0],	%l1
	tneg	%icc,	0x3
	sdivcc	%o3,	0x111B,	%i2
	edge32ln	%i6,	%o1,	%i3
	taddcctv	%i5,	0x0DB7,	%l4
	tn	%xcc,	0x2
	nop
	fitos	%f9,	%f11
	fstox	%f11,	%f28
	fxtos	%f28,	%f19
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fxor	%f6,	%f26,	%f26
	wr	%g0,	0x80,	%asi
	swapa	[%l7 + 0x78] %asi,	%g3
	edge32l	%i4,	%g7,	%g5
	edge32l	%i1,	%l6,	%i0
	fpackfix	%f14,	%f2
	bgu,a	loop_2149
	movl	%xcc,	%g2,	%o7
	fblg	%fcc3,	loop_2150
	udiv	%g1,	0x0312,	%o2
loop_2149:
	and	%l2,	%l0,	%i7
	edge32	%l5,	%l3,	%o5
loop_2150:
	edge8	%o6,	%g6,	%o4
	andn	%g4,	%o0,	%o3
	stw	%l1,	[%l7 + 0x3C]
	bge	%icc,	loop_2151
	ba	%xcc,	loop_2152
	ldsb	[%l7 + 0x26],	%i6
	fornot1s	%f17,	%f2,	%f22
loop_2151:
	nop
	wr	%g0,	0x04,	%asi
	ldswa	[%l7 + 0x4C] %asi,	%o1
loop_2152:
	brgez	%i2,	loop_2153
	add	%i5,	%i3,	%l4
	umul	%i4,	0x1C9B,	%g7
	sth	%g3,	[%l7 + 0x36]
loop_2153:
	fbu,a	%fcc1,	loop_2154
	tleu	%icc,	0x6
	movrgez	%g5,	%l6,	%i0
	nop
	setx	loop_2155,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_2154:
	tle	%icc,	0x7
	fmul8ulx16	%f8,	%f24,	%f8
	movpos	%xcc,	%g2,	%o7
loop_2155:
	tne	%icc,	0x2
	tgu	%icc,	0x1
	fpadd32	%f18,	%f10,	%f14
	swap	[%l7 + 0x30],	%i1
	fmovdcs	%icc,	%f18,	%f26
	smul	%o2,	%g1,	%l0
	movg	%icc,	%l2,	%i7
	set	0x34, %i5
	swapa	[%l7 + %i5] 0x81,	%l3
	bcc,a,pt	%xcc,	loop_2156
	fsrc1s	%f1,	%f27
	tpos	%xcc,	0x5
	add	%l5,	%o6,	%g6
loop_2156:
	mulx	%o5,	0x158D,	%o4
	set	0x61, %o6
	ldstuba	[%l7 + %o6] 0x18,	%g4
	subccc	%o3,	0x1DEA,	%o0
	edge8ln	%l1,	%o1,	%i2
	ldsh	[%l7 + 0x26],	%i6
	sdivcc	%i3,	0x03C1,	%i5
	fmovsl	%xcc,	%f9,	%f0
	smul	%i4,	0x044E,	%l4
	edge8	%g3,	%g5,	%g7
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
	fones	%f2
	wr	%g0,	0x89,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
loop_2157:
	addcc	%l6,	0x0557,	%g2
	tpos	%icc,	0x0
	popc	0x1DBC,	%i0
	ldd	[%l7 + 0x40],	%i0
	fnegd	%f26,	%f6
	nop
	setx	0x531DA84C,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f22
	setx	0xCF403175,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f31
	fadds	%f31,	%f22,	%f25
	fmul8x16al	%f3,	%f1,	%f30
	fbl,a	%fcc2,	loop_2158
	srax	%o7,	0x11,	%g1
	orcc	%l0,	%l2,	%o2
	movcs	%xcc,	%l3,	%l5
loop_2158:
	movre	%o6,	0x08F,	%g6
	ta	%xcc,	0x1
	tvs	%xcc,	0x3
	tcs	%xcc,	0x3
	fsrc2s	%f2,	%f20
	alignaddr	%o5,	%i7,	%o4
	movrlz	%g4,	%o3,	%l1
	sllx	%o0,	%i2,	%i6
	srax	%o1,	0x1B,	%i5
	fbo,a	%fcc2,	loop_2159
	udiv	%i3,	0x1C79,	%i4
	fnors	%f29,	%f20,	%f5
	nop
	setx	loop_2160,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_2159:
	te	%icc,	0x6
	orn	%g3,	0x0C7D,	%g5
	movcs	%icc,	%g7,	%l4
loop_2160:
	move	%icc,	%g2,	%i0
	fmovdcc	%icc,	%f26,	%f31
	bleu,a	%icc,	loop_2161
	fmovdcs	%icc,	%f31,	%f6
	bpos,a,pt	%xcc,	loop_2162
	tleu	%icc,	0x7
loop_2161:
	sllx	%i1,	0x0F,	%o7
	mova	%xcc,	%l6,	%g1
loop_2162:
	sdivx	%l0,	0x05B1,	%o2
	tge	%icc,	0x5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ta	%xcc,	0x5
	tcc	%xcc,	0x4
	xorcc	%l3,	0x0782,	%l2
	fbl,a	%fcc1,	loop_2163
	ble,pt	%xcc,	loop_2164
	udivx	%l5,	0x0DC8,	%o6
	wr	%g0,	0x0c,	%asi
	prefetcha	[%l7 + 0x30] %asi,	 0x0
loop_2163:
	tgu	%xcc,	0x7
loop_2164:
	taddcctv	%g6,	0x158A,	%o4
	nop
	fitod	%f6,	%f10
	fdtox	%f10,	%f24
	fxtod	%f24,	%f26
	array8	%i7,	%o3,	%g4
	sdivx	%o0,	0x128D,	%i2
	fmovda	%xcc,	%f12,	%f12
	udivx	%l1,	0x01B4,	%o1
	srax	%i6,	%i5,	%i4
	and	%i3,	%g5,	%g7
	nop
	setx	0x11C4571F1054B4AA,	%l0,	%l6
	stx	%l6,	[%l7 + 0x78]
	ldx	[%l7 + 0x78],	%fsr
	andncc	%l4,	%g2,	%g3
	st	%f24,	[%l7 + 0x1C]
	wr	%g0,	0x81,	%asi
	sta	%f22,	[%l7 + 0x78] %asi
	fmul8x16al	%f2,	%f0,	%f12
	tne	%icc,	0x7
	movvs	%icc,	%i1,	%o7
	brgz	%l6,	loop_2165
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdivcc	%i0,	0x176A,	%l0
	andn	%g1,	%l3,	%l2
loop_2165:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	taddcc	%l5,	%o6,	%o5
	tcc	%icc,	0x1
	array16	%o2,	%g6,	%i7
	movrlez	%o4,	%g4,	%o3
	sethi	0x1502,	%o0
	ba,a	%xcc,	loop_2166
	mova	%icc,	%l1,	%i2
	add	%i6,	%o1,	%i5
	smul	%i4,	0x123D,	%g5
loop_2166:
	mova	%icc,	%i3,	%g7
	nop
	fitod	%f2,	%f14
	fdtoi	%f14,	%f16
	subc	%l4,	0x0D46,	%g3
	fcmpgt32	%f30,	%f26,	%i1
	fnot1s	%f7,	%f22
	movle	%icc,	%o7,	%l6
	bpos	loop_2167
	fmul8ulx16	%f18,	%f28,	%f22
	ldsw	[%l7 + 0x78],	%g2
	nop
	setx	0xAA5F524F80D276FC,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0x39C6EA1893425177,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	fmuld	%f12,	%f30,	%f4
loop_2167:
	tsubcc	%l0,	%i0,	%l3
	fmovdcs	%xcc,	%f24,	%f17
	movvc	%icc,	%g1,	%l2
	movleu	%icc,	%o6,	%l5
	fand	%f4,	%f2,	%f16
	smul	%o5,	0x193C,	%g6
	movpos	%xcc,	%o2,	%i7
	sra	%g4,	%o4,	%o0
	subc	%o3,	0x1409,	%l1
	and	%i2,	0x1788,	%o1
	wr	%g0,	0x10,	%asi
	ldsha	[%l7 + 0x40] %asi,	%i5
	fmovdgu	%icc,	%f19,	%f14
	srax	%i4,	0x07,	%i6
	tn	%icc,	0x2
	andncc	%g5,	%i3,	%g7
	wr	%g0,	0x80,	%asi
	swapa	[%l7 + 0x20] %asi,	%l4
	fxors	%f29,	%f23,	%f31
	set	0x20, %o4
	sta	%f14,	[%l7 + %o4] 0x04
	taddcc	%i1,	0x09C1,	%o7
	movvc	%icc,	%l6,	%g3
	andn	%g2,	0x05EE,	%i0
	movvs	%xcc,	%l0,	%l3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmpne16	%f6,	%f12,	%l2
	movpos	%icc,	%g1,	%l5
	wr	%g0,	0x24,	%asi
	ldda	[%l7 + 0x40] %asi,	%o6
	edge16	%o5,	%o2,	%g6
	fmovse	%icc,	%f21,	%f4
	fnegs	%f20,	%f28
	umulcc	%i7,	0x1248,	%g4
	tvc	%icc,	0x2
	edge16l	%o4,	%o3,	%o0
	edge8	%i2,	%l1,	%o1
	wr	%g0,	0x11,	%asi
	prefetcha	[%l7 + 0x08] %asi,	 0x0
	sdivx	%i6,	0x0470,	%g5
	set	0x58, %i6
	prefetcha	[%l7 + %i6] 0x04,	 0x0
	udivcc	%g7,	0x0AD1,	%l4
	subccc	%i5,	0x0ABB,	%o7
	sir	0x19FE
	orncc	%l6,	0x1E8B,	%i1
	umul	%g2,	%i0,	%l0
	membar	0x54
	xorcc	%g3,	%l3,	%l2
	flush	%l7 + 0x7C
	bpos	%xcc,	loop_2168
	orncc	%l5,	0x1E01,	%o6
	fmovdvc	%xcc,	%f0,	%f20
	fnot2	%f2,	%f14
loop_2168:
	nop
	set	0x40, %g6
	stda	%f16,	[%l7 + %g6] 0x0c
	orn	%o5,	%g1,	%g6
	movcs	%icc,	%o2,	%g4
	fmovdvc	%icc,	%f5,	%f17
	tvs	%xcc,	0x6
	fmovsl	%icc,	%f16,	%f16
	sethi	0x1CD9,	%i7
	fpsub16s	%f3,	%f29,	%f2
	fcmpne16	%f16,	%f24,	%o4
	subcc	%o0,	%o3,	%i2
	sir	0x0C4E
	edge8ln	%l1,	%o1,	%i6
	tneg	%icc,	0x7
	srax	%i4,	%g5,	%g7
	tn	%xcc,	0x3
	bgu,pt	%icc,	loop_2169
	fmovsl	%icc,	%f8,	%f6
	brz	%i3,	loop_2170
	ta	%icc,	0x6
loop_2169:
	tpos	%icc,	0x2
	andncc	%l4,	%o7,	%i5
loop_2170:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subc	%i1,	%g2,	%l6
	bl,a	loop_2171
	andcc	%l0,	0x1774,	%g3
	smulcc	%l3,	%i0,	%l5
	movl	%icc,	%l2,	%o6
loop_2171:
	movrlz	%g1,	%g6,	%o5
	or	%g4,	0x0A7D,	%i7
	fmovrdne	%o4,	%f8,	%f10
	orncc	%o0,	0x1F6E,	%o3
	taddcctv	%i2,	0x0EED,	%o2
	brgez,a	%o1,	loop_2172
	orcc	%l1,	0x06CA,	%i6
	nop
	setx	0x586828B6,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f10
	setx	0xD0D1EB4B,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f25
	fmuls	%f25,	%f10,	%f21
	ldub	[%l7 + 0x67],	%i4
loop_2172:
	ldd	[%l7 + 0x38],	%g6
	edge32l	%i3,	%l4,	%g5
	fbul,a	%fcc2,	loop_2173
	smul	%o7,	%i5,	%i1
	sdivx	%l6,	0x0030,	%g2
	movrgez	%l0,	0x254,	%l3
loop_2173:
	array16	%i0,	%l5,	%l2
	brgez,a	%o6,	loop_2174
	fbg,a	%fcc0,	loop_2175
	movleu	%xcc,	%g1,	%g6
	andcc	%g3,	0x015A,	%g4
loop_2174:
	add	%o5,	%i7,	%o4
loop_2175:
	tg	%icc,	0x5
	fbl,a	%fcc0,	loop_2176
	nop
	fitos	%f0,	%f17
	fstoi	%f17,	%f19
	addc	%o0,	%i2,	%o2
	nop
	setx	0x0E345F71,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f12
	fsqrts	%f12,	%f22
loop_2176:
	edge16	%o1,	%l1,	%i6
	xorcc	%i4,	0x0B4A,	%g7
	sdivcc	%i3,	0x074C,	%o3
	fmovrslz	%l4,	%f22,	%f5
	movvc	%xcc,	%g5,	%i5
	fble	%fcc2,	loop_2177
	or	%i1,	0x13A6,	%l6
	std	%f22,	[%l7 + 0x70]
	sra	%o7,	0x0A,	%g2
loop_2177:
	alignaddr	%l0,	%l3,	%l5
	edge32l	%i0,	%o6,	%l2
	fblg,a	%fcc1,	loop_2178
	sllx	%g1,	%g3,	%g6
	add	%l7,	0x70,	%l6
	wr	%g0,	0x10,	%asi
	ldxa	[%l6] %asi,	%o5
	casxa	[%l6] 0x10,	%o5,	%g4
loop_2178:
	fmovsn	%xcc,	%f11,	%f1
	nop
	setx	0x97B1295D,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f10
	setx	0xD5A9EF1A,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f26
	fadds	%f26,	%f10,	%f11
	edge32	%i7,	%o0,	%i2
	movgu	%icc,	%o2,	%o1
	wr	%g0,	0x81,	%asi
	sta	%f13,	[%l7 + 0x0C] %asi
	tsubcc	%l1,	0x1F34,	%o4
	fbul	%fcc2,	loop_2179
	andncc	%i4,	%i6,	%i3
	umul	%g7,	%o3,	%g5
	andn	%i5,	%l4,	%l6
loop_2179:
	fba,a	%fcc0,	loop_2180
	orcc	%o7,	0x1E44,	%i1
	xor	%g2,	%l0,	%l3
	lduw	[%l7 + 0x48],	%l5
loop_2180:
	movrlz	%o6,	%l2,	%g1
	fba	%fcc2,	loop_2181
	mova	%icc,	%i0,	%g6
	edge16ln	%g3,	%o5,	%i7
	sethi	0x02FD,	%o0
loop_2181:
	movrgz	%g4,	0x1B3,	%o2
	sra	%i2,	0x12,	%o1
	movcs	%xcc,	%o4,	%l1
	nop
	fitod	%f12,	%f22
	nop
	setx	0xF1416519636EF8D6,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	fsqrtd	%f2,	%f14
	fone	%f4
	movg	%xcc,	%i6,	%i3
	sll	%g7,	0x13,	%i4
	subccc	%o3,	0x166F,	%g5
	subccc	%l4,	%l6,	%o7
	fxnor	%f10,	%f28,	%f20
	tpos	%icc,	0x4
	fnors	%f28,	%f3,	%f6
	udiv	%i1,	0x1C42,	%i5
	movg	%xcc,	%g2,	%l3
	fcmpeq32	%f10,	%f30,	%l5
	fone	%f18
	tgu	%icc,	0x7
	tle	%xcc,	0x3
	ta	%xcc,	0x3
	tgu	%icc,	0x0
	subccc	%o6,	0x1099,	%l0
	tpos	%xcc,	0x6
	fexpand	%f29,	%f24
	umul	%l2,	%g1,	%i0
	orcc	%g3,	%g6,	%i7
	brgz	%o5,	loop_2182
	movrlez	%o0,	%g4,	%o2
	xorcc	%i2,	0x09C3,	%o1
	fmovrsgez	%o4,	%f20,	%f15
loop_2182:
	array16	%i6,	%i3,	%g7
	be,pn	%icc,	loop_2183
	fbne	%fcc3,	loop_2184
	or	%i4,	0x1759,	%l1
	edge8	%o3,	%g5,	%l4
loop_2183:
	xorcc	%l6,	%i1,	%i5
loop_2184:
	be,pn	%xcc,	loop_2185
	nop
	fitos	%f8,	%f6
	fstox	%f6,	%f14
	tsubcctv	%g2,	%o7,	%l5
	tgu	%xcc,	0x3
loop_2185:
	fpsub16s	%f20,	%f20,	%f7
	fmovrsgz	%l3,	%f3,	%f28
	movcc	%xcc,	%o6,	%l0
	fpmerge	%f25,	%f14,	%f8
	alignaddrl	%g1,	%l2,	%i0
	edge8	%g6,	%i7,	%o5
	sth	%g3,	[%l7 + 0x12]
	stbar
	std	%f18,	[%l7 + 0x58]
	fbul,a	%fcc1,	loop_2186
	alignaddrl	%g4,	%o2,	%o0
	movrlz	%o1,	%o4,	%i6
	movrlz	%i3,	0x20B,	%i2
loop_2186:
	lduh	[%l7 + 0x20],	%i4
	taddcc	%l1,	%o3,	%g7
	addcc	%g5,	0x1997,	%l4
	sll	%i1,	%i5,	%g2
	wr	%g0,	0x89,	%asi
	ldxa	[%l7 + 0x18] %asi,	%l6
	sth	%o7,	[%l7 + 0x3A]
	sub	%l5,	%o6,	%l3
	sub	%g1,	%l2,	%i0
	bvc,pt	%icc,	loop_2187
	fbge	%fcc2,	loop_2188
	lduw	[%l7 + 0x34],	%l0
	udiv	%i7,	0x0AEC,	%o5
loop_2187:
	nop
	setx	0x143FEB7C,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f9
	setx	0x09C7311C,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f24
	fmuls	%f24,	%f9,	%f4
loop_2188:
	addccc	%g3,	%g4,	%g6
	movleu	%xcc,	%o0,	%o2
	movcc	%icc,	%o4,	%i6
	movleu	%xcc,	%o1,	%i2
	fzero	%f4
	smul	%i4,	0x1003,	%i3
	movge	%icc,	%l1,	%g7
	udiv	%g5,	0x1DB7,	%o3
	stw	%i1,	[%l7 + 0x78]
	fmovspos	%icc,	%f2,	%f23
	fone	%f22
	stb	%l4,	[%l7 + 0x77]
	subccc	%i5,	0x0CF3,	%g2
	mulx	%o7,	0x0876,	%l6
	tleu	%icc,	0x4
	and	%l5,	0x0B2B,	%l3
	set	0x4D, %o5
	stba	%o6,	[%l7 + %o5] 0xeb
	membar	#Sync
	mulx	%g1,	%i0,	%l0
	ba	%xcc,	loop_2189
	tge	%xcc,	0x0
	add	%l7,	0x54,	%l6
	wr	%g0,	0x0c,	%asi
	lda	[%l6] %asi,	%i7
	casa	[%l6] 0x0c,	%i7,	%o5
loop_2189:
	udivx	%l2,	0x0C3D,	%g4
	movrlez	%g3,	0x347,	%g6
	tleu	%xcc,	0x4
	tleu	%icc,	0x5
	edge8	%o0,	%o4,	%i6
	nop
	setx	0x353FE2E4,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f7
	setx	0x612BD5D9,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f15
	fdivs	%f15,	%f7,	%f6
	fandnot1	%f18,	%f2,	%f14
	set	0x64, %i4
	swapa	[%l7 + %i4] 0x80,	%o2
	subccc	%o1,	%i4,	%i3
	fbge	%fcc3,	loop_2190
	mova	%xcc,	%i2,	%l1
	movvs	%icc,	%g5,	%o3
	movge	%icc,	%g7,	%i1
loop_2190:
	movvc	%xcc,	%i5,	%g2
	or	%o7,	0x1042,	%l6
	add	%l7,	0x20,	%l6
	wr	%g0,	0x04,	%asi
	ldxa	[%l6] %asi,	%l5
	casxa	[%l6] 0x04,	%l5,	%l4
	tl	%icc,	0x7
	wr	%g0,	0x88,	%asi
	ldswa	[%l7 + 0x4C] %asi,	%l3
	xnor	%o6,	0x0B40,	%i0
	fmovsne	%xcc,	%f31,	%f11
	edge8n	%l0,	%g1,	%i7
	tpos	%icc,	0x3
	tvs	%xcc,	0x0
	sir	0x0F8B
	tcc	%xcc,	0x2
	nop
	set	0x08, %o1
	ldx	[%l7 + %o1],	%o5
	fcmpne32	%f4,	%f18,	%l2
	andn	%g4,	%g3,	%o0
	movpos	%xcc,	%o4,	%i6
	andncc	%g6,	%o2,	%i4
	addcc	%o1,	0x01AE,	%i3
	fbl,a	%fcc3,	loop_2191
	edge32l	%i2,	%l1,	%g5
	andn	%g7,	0x1581,	%i1
	tgu	%icc,	0x4
loop_2191:
	nop
	set	0x70, %g3
	stwa	%i5,	[%l7 + %g3] 0x81
	ldsb	[%l7 + 0x26],	%g2
	fpsub16	%f4,	%f4,	%f16
	fmovdge	%icc,	%f8,	%f1
	bshuffle	%f24,	%f22,	%f14
	andn	%o3,	0x075C,	%o7
	movrlez	%l6,	%l5,	%l3
	fornot1	%f8,	%f10,	%f28
	edge32	%o6,	%i0,	%l4
	andcc	%g1,	0x078A,	%l0
	edge32ln	%o5,	%l2,	%i7
	sdiv	%g4,	0x0496,	%o0
	add	%g3,	0x0593,	%o4
	sra	%i6,	%g6,	%i4
	fnor	%f24,	%f8,	%f2
	sdivcc	%o2,	0x0A44,	%o1
	ta	%icc,	0x7
	fmul8x16au	%f2,	%f9,	%f6
	tpos	%icc,	0x3
	set	0x28, %g2
	ldswa	[%l7 + %g2] 0x10,	%i2
	lduw	[%l7 + 0x20],	%i3
	fmul8x16au	%f11,	%f14,	%f6
	edge8ln	%l1,	%g5,	%i1
	edge32n	%i5,	%g2,	%o3
	lduh	[%l7 + 0x34],	%o7
	edge16	%g7,	%l6,	%l3
	edge16	%l5,	%i0,	%l4
	fbn	%fcc3,	loop_2192
	subccc	%g1,	%l0,	%o6
	fnands	%f17,	%f13,	%f4
	andncc	%o5,	%l2,	%i7
loop_2192:
	edge32l	%g4,	%g3,	%o0
	st	%f4,	[%l7 + 0x24]
	nop
	fitos	%f1,	%f11
	fstox	%f11,	%f18
	fxtos	%f18,	%f0
	fsrc2	%f14,	%f16
	bvc,a	%icc,	loop_2193
	tsubcc	%i6,	0x0543,	%g6
	orcc	%o4,	%i4,	%o2
	membar	0x66
loop_2193:
	tpos	%xcc,	0x5
	addcc	%i2,	0x0FC7,	%o1
	bcs	loop_2194
	subccc	%i3,	0x0394,	%l1
	andcc	%i1,	0x0E01,	%i5
	sdivcc	%g2,	0x015B,	%g5
loop_2194:
	alignaddrl	%o3,	%g7,	%o7
	fmovrdlz	%l6,	%f8,	%f20
	mulscc	%l5,	0x0344,	%i0
	bl,pn	%xcc,	loop_2195
	andn	%l3,	%g1,	%l0
	addcc	%o6,	0x0730,	%o5
	xnor	%l4,	%i7,	%l2
loop_2195:
	tpos	%icc,	0x7
	addc	%g3,	%g4,	%i6
	fpadd16	%f28,	%f14,	%f0
	nop
	setx	0x324A2E36,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f31
	setx	0x1F54D117,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f4
	fsubs	%f4,	%f31,	%f0
	te	%xcc,	0x6
	andncc	%g6,	%o4,	%i4
	brlez,a	%o2,	loop_2196
	udivcc	%o0,	0x1C95,	%i2
	andncc	%i3,	%l1,	%i1
	mova	%icc,	%i5,	%o1
loop_2196:
	brz	%g2,	loop_2197
	ble,a	loop_2198
	smul	%o3,	%g5,	%o7
	fmovsg	%icc,	%f6,	%f8
loop_2197:
	tle	%xcc,	0x2
loop_2198:
	std	%f6,	[%l7 + 0x20]
	nop
	setx	0x6DEB0F3A20570FA2,	%l0,	%l6
	stx	%l6,	[%l7 + 0x08]
	ldx	[%l7 + 0x08],	%fsr
	wr	%g0,	0x0c,	%asi
	stha	%l6,	[%l7 + 0x6A] %asi
	stb	%l5,	[%l7 + 0x19]
	fmovdpos	%xcc,	%f27,	%f31
	bleu,a,pn	%icc,	loop_2199
	ldx	[%l7 + 0x30],	%i0
	fornot1s	%f2,	%f20,	%f2
	membar	0x3B
loop_2199:
	and	%l3,	%g7,	%l0
	popc	0x118E,	%o6
	movleu	%icc,	%o5,	%l4
	fsrc1s	%f25,	%f26
	orncc	%g1,	0x1031,	%l2
	membar	0x3A
	movpos	%xcc,	%i7,	%g4
	fmovrdne	%i6,	%f28,	%f16
	tsubcc	%g6,	%o4,	%g3
	srlx	%i4,	%o2,	%i2
	tl	%icc,	0x7
	fmovscc	%xcc,	%f9,	%f21
	nop
	setx	0xC755C5B2,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f1
	setx	0x439C0ADE,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f14
	fadds	%f14,	%f1,	%f16
	tge	%xcc,	0x5
	sdivcc	%o0,	0x1134,	%l1
	ldsb	[%l7 + 0x64],	%i1
	orncc	%i5,	%o1,	%i3
	fmovrsne	%o3,	%f13,	%f20
	wr	%g0,	0xe2,	%asi
	ldda	[%l7 + 0x20] %asi,	%g4
	mova	%xcc,	%g2,	%l6
	fpack16	%f24,	%f15
	fmovd	%f18,	%f14
	xor	%o7,	0x1749,	%l5
	wr	%g0,	0x88,	%asi
	lduha	[%l7 + 0x54] %asi,	%i0
	ldsw	[%l7 + 0x38],	%l3
	tn	%icc,	0x7
	fba	%fcc3,	loop_2200
	movgu	%icc,	%l0,	%o6
	andcc	%g7,	0x05D7,	%o5
	set	0x78, %g5
	lda	[%l7 + %g5] 0x15,	%f18
loop_2200:
	tne	%xcc,	0x5
	prefetch	[%l7 + 0x34],	 0x3
	subcc	%l4,	%l2,	%g1
	tcs	%icc,	0x4
	nop
	setx	loop_2201,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	nop
	set	0x14, %g1
	lduw	[%l7 + %g1],	%g4
	fble	%fcc0,	loop_2202
	edge32n	%i6,	%g6,	%i7
loop_2201:
	add	%g3,	%i4,	%o2
	movne	%icc,	%o4,	%o0
loop_2202:
	nop
	add	%l7,	0x60,	%l6
	wr	%g0,	0x04,	%asi
	ldxa	[%l6] %asi,	%i2
	casxa	[%l6] 0x04,	%i2,	%i1
	and	%i5,	0x1841,	%l1
	prefetch	[%l7 + 0x4C],	 0x2
	movle	%icc,	%i3,	%o1
	tvc	%icc,	0x5
	nop
	fitod	%f0,	%f12
	fdtox	%f12,	%f18
	fxtod	%f18,	%f16
	fbg,a	%fcc1,	loop_2203
	edge32l	%g5,	%o3,	%l6
	sth	%o7,	[%l7 + 0x5C]
	tle	%xcc,	0x1
loop_2203:
	addc	%l5,	%g2,	%i0
	movg	%xcc,	%l3,	%l0
	tvs	%xcc,	0x2
	fbule	%fcc1,	loop_2204
	fbue,a	%fcc0,	loop_2205
	nop
	setx	loop_2206,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	popc	0x12F0,	%o6
loop_2204:
	sir	0x14AC
loop_2205:
	addccc	%g7,	%l4,	%l2
loop_2206:
	tneg	%xcc,	0x0
	fmovsg	%icc,	%f2,	%f7
	srl	%o5,	0x13,	%g4
	wr	%g0,	0x23,	%asi
	stha	%g1,	[%l7 + 0x28] %asi
	membar	#Sync
	smulcc	%i6,	%i7,	%g6
	nop
	fitos	%f0,	%f7
	fstox	%f7,	%f24
	fandnot2s	%f10,	%f23,	%f1
	fand	%f12,	%f24,	%f24
	bg,pn	%xcc,	loop_2207
	add	%i4,	0x0CE2,	%g3
	fbe,a	%fcc0,	loop_2208
	bleu,pn	%xcc,	loop_2209
loop_2207:
	edge16n	%o4,	%o0,	%o2
	orncc	%i2,	0x1D2B,	%i5
loop_2208:
	fcmple16	%f26,	%f24,	%l1
loop_2209:
	std	%f28,	[%l7 + 0x40]
	tcs	%icc,	0x1
	fornot1s	%f4,	%f6,	%f30
	array32	%i3,	%o1,	%i1
	smulcc	%o3,	%l6,	%g5
	wr	%g0,	0x80,	%asi
	swapa	[%l7 + 0x40] %asi,	%l5
	orn	%g2,	%i0,	%l3
	sethi	0x0E7B,	%l0
	movne	%xcc,	%o6,	%o7
	edge16	%g7,	%l2,	%l4
	movleu	%icc,	%o5,	%g1
	fbl	%fcc3,	loop_2210
	fsrc2	%f4,	%f10
	array8	%i6,	%i7,	%g6
	andcc	%i4,	0x0D7B,	%g3
loop_2210:
	alignaddr	%o4,	%g4,	%o0
	or	%i2,	%i5,	%l1
	movrgz	%i3,	0x239,	%o2
	xor	%o1,	%o3,	%i1
	ld	[%l7 + 0x28],	%f4
	fors	%f18,	%f18,	%f27
	move	%xcc,	%g5,	%l5
	fnand	%f12,	%f26,	%f26
	set	0x50, %l3
	sta	%f9,	[%l7 + %l3] 0x80
	fpack32	%f28,	%f16,	%f2
	wr	%g0,	0x88,	%asi
	lduba	[%l7 + 0x63] %asi,	%g2
	tleu	%xcc,	0x1
	tpos	%icc,	0x7
	fmovsneg	%icc,	%f29,	%f2
	nop
	setx	0x9192B0BE,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f16
	fsqrts	%f16,	%f22
	movrgz	%i0,	%l3,	%l6
	edge32	%o6,	%o7,	%g7
	movrgez	%l0,	%l2,	%l4
	array16	%g1,	%i6,	%i7
	orncc	%o5,	0x1E9E,	%g6
	edge16n	%g3,	%i4,	%g4
	bgu,pn	%xcc,	loop_2211
	or	%o4,	%o0,	%i5
	movneg	%icc,	%l1,	%i2
	fpsub32	%f22,	%f12,	%f18
loop_2211:
	sub	%o2,	%o1,	%o3
	tcs	%icc,	0x1
	ldsw	[%l7 + 0x40],	%i3
	sethi	0x0FB4,	%i1
	fnegd	%f16,	%f2
	taddcctv	%g5,	0x0B62,	%l5
	brz	%i0,	loop_2212
	edge8ln	%l3,	%l6,	%o6
	edge16l	%g2,	%g7,	%l0
	add	%l2,	%o7,	%l4
loop_2212:
	edge16n	%g1,	%i6,	%o5
	fone	%f18
	sth	%g6,	[%l7 + 0x1E]
	movleu	%icc,	%g3,	%i4
	umul	%i7,	0x0D7B,	%g4
	tpos	%xcc,	0x3
	fpsub32s	%f9,	%f2,	%f2
	nop
	setx	loop_2213,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	nop
	fitod	%f6,	%f30
	fdtox	%f30,	%f16
	edge16ln	%o4,	%i5,	%o0
	bn,a,pn	%icc,	loop_2214
loop_2213:
	bvc,a	%xcc,	loop_2215
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bleu,a,pt	%xcc,	loop_2216
loop_2214:
	sdivx	%i2,	0x18AB,	%l1
loop_2215:
	membar	0x65
	and	%o1,	0x070E,	%o3
loop_2216:
	nop
	set	0x1F, %l1
	ldsba	[%l7 + %l1] 0x11,	%o2
	movcc	%xcc,	%i3,	%g5
	nop
	setx	loop_2217,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movneg	%icc,	%l5,	%i1
	nop
	setx	loop_2218,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movvc	%xcc,	%l3,	%l6
loop_2217:
	fpadd32s	%f6,	%f17,	%f20
	mova	%icc,	%o6,	%g2
loop_2218:
	tneg	%xcc,	0x6
	wr	%g0,	0x81,	%asi
	ldsba	[%l7 + 0x74] %asi,	%g7
	bvc,pt	%icc,	loop_2219
	fmovdleu	%xcc,	%f25,	%f22
	tleu	%icc,	0x7
	addcc	%i0,	%l2,	%l0
loop_2219:
	movcc	%icc,	%o7,	%g1
	ldub	[%l7 + 0x34],	%l4
	movg	%xcc,	%o5,	%g6
	fmovdvc	%icc,	%f24,	%f0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
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
	fmul8ulx16	%f14,	%f18,	%f22
	fmovsl	%xcc,	%f29,	%f24
	addccc	%g3,	0x01B3,	%i6
loop_2220:
	fmovrsgez	%i7,	%f5,	%f12
	nop
	setx	0x66B9AB80,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f20
	setx	0x1A4F955D,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f2
	fmuls	%f2,	%f20,	%f27
	stx	%i4,	[%l7 + 0x78]
	fpadd16s	%f29,	%f20,	%f27
	brgz	%o4,	loop_2221
	srl	%i5,	0x12,	%g4
	tge	%xcc,	0x0
	umul	%i2,	0x03B3,	%l1
loop_2221:
	fnot1	%f26,	%f20
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	te	%icc,	0x4
	edge32n	%o1,	%o0,	%o3
	tneg	%xcc,	0x5
	xor	%i3,	%o2,	%g5
	orncc	%i1,	0x09EB,	%l5
	srlx	%l3,	0x00,	%l6
	movpos	%xcc,	%g2,	%o6
	fcmpeq16	%f18,	%f22,	%g7
	flush	%l7 + 0x3C
	srlx	%i0,	%l0,	%o7
	edge16	%l2,	%l4,	%o5
	movg	%icc,	%g1,	%g3
	edge16n	%i6,	%i7,	%g6
	bshuffle	%f16,	%f12,	%f26
	tn	%icc,	0x2
	fmovsvs	%xcc,	%f28,	%f3
	bg,pt	%xcc,	loop_2222
	movrne	%i4,	0x37A,	%o4
	movpos	%xcc,	%i5,	%i2
	taddcctv	%g4,	0x180D,	%o1
loop_2222:
	andn	%o0,	0x02C0,	%o3
	or	%l1,	%o2,	%i3
	fmovsa	%xcc,	%f10,	%f14
	ba,a,pn	%icc,	loop_2223
	fbue,a	%fcc2,	loop_2224
	edge16ln	%g5,	%i1,	%l3
	set	0x22, %i7
	ldsha	[%l7 + %i7] 0x14,	%l5
loop_2223:
	srl	%l6,	0x0F,	%g2
loop_2224:
	movrlez	%g7,	%o6,	%i0
	movne	%icc,	%l0,	%o7
	xorcc	%l2,	0x1929,	%o5
	set	0x4C, %o0
	lda	[%l7 + %o0] 0x81,	%f13
	fpmerge	%f18,	%f20,	%f20
	andcc	%l4,	0x014D,	%g1
	sethi	0x1DCB,	%g3
	fornot2	%f22,	%f28,	%f14
	xorcc	%i7,	0x118D,	%i6
	fands	%f9,	%f9,	%f14
	brgez	%g6,	loop_2225
	edge8l	%o4,	%i4,	%i2
	fpsub16	%f24,	%f26,	%f14
	smul	%i5,	0x156C,	%g4
loop_2225:
	nop
	setx	0xCB1B6A059EC8479D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0xBB95A7E68E1F3CD7,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	fsubd	%f24,	%f0,	%f16
	tl	%icc,	0x0
	fmovscc	%xcc,	%f9,	%f14
	movrlz	%o0,	0x08D,	%o3
	nop
	fitod	%f26,	%f12
	mulx	%l1,	0x048B,	%o1
	tgu	%icc,	0x2
	bne,pn	%xcc,	loop_2226
	xorcc	%o2,	0x1DF2,	%i3
	fbne	%fcc2,	loop_2227
	edge8	%g5,	%i1,	%l5
loop_2226:
	srlx	%l6,	%l3,	%g7
	fmovrde	%o6,	%f16,	%f8
loop_2227:
	fmovsa	%icc,	%f19,	%f26
	nop
	fitos	%f4,	%f24
	fstox	%f24,	%f2
	fmovsvs	%icc,	%f29,	%f10
	fands	%f14,	%f16,	%f0
	fbl,a	%fcc3,	loop_2228
	movvc	%xcc,	%i0,	%g2
	stbar
	nop
	set	0x6B, %l2
	ldsb	[%l7 + %l2],	%l0
loop_2228:
	tne	%xcc,	0x3
	subccc	%o7,	%l2,	%o5
	fbge	%fcc2,	loop_2229
	te	%xcc,	0x6
	edge8	%l4,	%g1,	%g3
	orcc	%i6,	0x0435,	%g6
loop_2229:
	bleu	%xcc,	loop_2230
	andcc	%i7,	0x11F6,	%o4
	edge8l	%i4,	%i2,	%g4
	andncc	%i5,	%o3,	%l1
loop_2230:
	movvs	%xcc,	%o1,	%o0
	nop
	set	0x30, %o2
	ldx	[%l7 + %o2],	%o2
	membar	0x71
	movg	%icc,	%g5,	%i3
	andcc	%i1,	0x1102,	%l5
	addccc	%l6,	%l3,	%g7
	edge16n	%i0,	%g2,	%o6
	fcmpne16	%f22,	%f0,	%l0
	subc	%o7,	0x1805,	%l2
	ba,a	loop_2231
	ldstub	[%l7 + 0x41],	%o5
	movrgez	%g1,	%g3,	%i6
	subcc	%l4,	0x02B4,	%i7
loop_2231:
	edge8	%o4,	%i4,	%g6
	tl	%xcc,	0x3
	edge16l	%g4,	%i5,	%i2
	bleu,a	%icc,	loop_2232
	nop
	setx	0x94082521F0469790,	%l0,	%l6
	stx	%l6,	[%l7 + 0x38]
	ldx	[%l7 + 0x38],	%fsr
	edge32	%o3,	%l1,	%o1
	andncc	%o0,	%o2,	%g5
loop_2232:
	xor	%i3,	0x1682,	%l5
	fmovrslz	%l6,	%f6,	%f1
	bgu	%icc,	loop_2233
	sra	%i1,	0x1E,	%g7
	fnor	%f20,	%f20,	%f24
	wr	%g0,	0x81,	%asi
	ldswa	[%l7 + 0x78] %asi,	%l3
loop_2233:
	sra	%g2,	%i0,	%l0
	movn	%icc,	%o7,	%l2
	orcc	%o5,	0x1AFB,	%o6
	subcc	%g3,	0x0A82,	%g1
	fmovsge	%icc,	%f28,	%f27
	add	%l7,	0x0C,	%l6
	wr	%g0,	0x11,	%asi
	lda	[%l6] %asi,	%l4
	casa	[%l6] %asi,	%l4,	%i6
	movrne	%i7,	%o4,	%g6
	movgu	%icc,	%i4,	%g4
	fnands	%f22,	%f13,	%f14
	fxnors	%f29,	%f11,	%f20
	sethi	0x17BA,	%i5
	fpack16	%f4,	%f13
	andncc	%o3,	%i2,	%o1
	fpsub16	%f6,	%f8,	%f30
	smulcc	%l1,	0x0A58,	%o2
	tpos	%xcc,	0x3
	sll	%o0,	%i3,	%g5
	srax	%l6,	%l5,	%i1
	fmovdcs	%xcc,	%f19,	%f17
	fmovsa	%icc,	%f28,	%f14
	membar	0x57
	movgu	%xcc,	%l3,	%g7
	fzero	%f6
	movvc	%icc,	%g2,	%l0
	edge32n	%o7,	%i0,	%o5
	edge32	%l2,	%g3,	%o6
	movvc	%icc,	%l4,	%i6
	nop
	fitod	%f2,	%f10
	fdtos	%f10,	%f8
	edge32	%i7,	%g1,	%g6
	fmovdcc	%icc,	%f15,	%f30
	wr	%g0,	0x04,	%asi
	stha	%i4,	[%l7 + 0x16] %asi
	fabsd	%f16,	%f12
	taddcc	%o4,	%g4,	%i5
	tvc	%xcc,	0x1
	nop
	set	0x11, %l5
	stb	%i2,	[%l7 + %l5]
	fcmple32	%f30,	%f20,	%o3
	fble	%fcc3,	loop_2234
	sth	%o1,	[%l7 + 0x60]
	tpos	%xcc,	0x2
	wr	%g0,	0x80,	%asi
	ldswa	[%l7 + 0x70] %asi,	%o2
loop_2234:
	nop
	setx	0x4128D7A0,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f17
	setx	0x1BF751A8,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f11
	fmuls	%f11,	%f17,	%f15
	bneg	%icc,	loop_2235
	sethi	0x1369,	%o0
	xnorcc	%l1,	%i3,	%g5
	nop
	fitod	%f0,	%f30
	fdtox	%f30,	%f20
loop_2235:
	fpack32	%f12,	%f24,	%f14
	set	0x20, %o7
	ldstuba	[%l7 + %o7] 0x18,	%l5
	stx	%i1,	[%l7 + 0x58]
	array8	%l6,	%g7,	%l3
	movrgez	%g2,	%l0,	%o7
	addcc	%i0,	0x0E48,	%l2
	ldsw	[%l7 + 0x4C],	%g3
	fnegs	%f6,	%f4
	set	0x18, %i0
	ldswa	[%l7 + %i0] 0x11,	%o5
	prefetch	[%l7 + 0x30],	 0x1
	and	%o6,	0x1A1A,	%l4
	be,pt	%icc,	loop_2236
	fbue,a	%fcc3,	loop_2237
	tcc	%xcc,	0x2
	udiv	%i7,	0x0B7D,	%i6
loop_2236:
	sdivcc	%g6,	0x168F,	%g1
loop_2237:
	nop
	wr	%g0,	0x04,	%asi
	prefetcha	[%l7 + 0x40] %asi,	 0x0
	xnor	%g4,	%i4,	%i5
	smulcc	%i2,	%o3,	%o1
	xnor	%o0,	%l1,	%i3
	srax	%o2,	%g5,	%l5
	wr	%g0,	0x89,	%asi
	stba	%i1,	[%l7 + 0x43] %asi
	array8	%g7,	%l3,	%g2
	set	0x68, %o3
	lduwa	[%l7 + %o3] 0x18,	%l0
	tne	%icc,	0x3
	fnegs	%f29,	%f15
	movrne	%l6,	0x070,	%o7
	movl	%xcc,	%i0,	%l2
	tgu	%xcc,	0x3
	ba,a,pt	%xcc,	loop_2238
	fands	%f19,	%f17,	%f9
	fbg	%fcc1,	loop_2239
	subcc	%o5,	0x1C23,	%o6
loop_2238:
	srl	%g3,	0x14,	%l4
	sub	%i6,	%g6,	%i7
loop_2239:
	movge	%xcc,	%g1,	%o4
	taddcctv	%g4,	%i5,	%i2
	andncc	%o3,	%o1,	%o0
	edge8n	%l1,	%i4,	%o2
	fmovrdlz	%i3,	%f10,	%f18
	fnors	%f16,	%f10,	%f21
	fsrc1s	%f27,	%f9
	array32	%g5,	%l5,	%g7
	movge	%xcc,	%i1,	%g2
	sdivcc	%l0,	0x1D6C,	%l6
	fsrc1	%f8,	%f2
	brz	%o7,	loop_2240
	fcmpgt16	%f26,	%f18,	%i0
	fornot1s	%f11,	%f13,	%f5
	ta	%icc,	0x4
loop_2240:
	andncc	%l2,	%o5,	%l3
	add	%o6,	%g3,	%l4
	fmovd	%f14,	%f20
	movcc	%icc,	%i6,	%i7
	array32	%g1,	%g6,	%o4
	brgz	%i5,	loop_2241
	tg	%xcc,	0x2
	fmul8x16al	%f0,	%f13,	%f8
	fbule,a	%fcc2,	loop_2242
loop_2241:
	tvc	%xcc,	0x2
	fcmpgt32	%f16,	%f28,	%g4
	fbule,a	%fcc1,	loop_2243
loop_2242:
	smulcc	%i2,	%o3,	%o1
	tle	%xcc,	0x6
	nop
	setx	0x0FA07AA92079752D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x70]
	ldx	[%l7 + 0x70],	%fsr
loop_2243:
	bvc,a	%icc,	loop_2244
	movleu	%icc,	%l1,	%i4
	movrne	%o2,	0x150,	%i3
	smul	%g5,	%o0,	%l5
loop_2244:
	ldd	[%l7 + 0x08],	%g6
	subccc	%g2,	%l0,	%l6
	call	loop_2245
	std	%f2,	[%l7 + 0x18]
	edge8	%o7,	%i0,	%i1
	fcmpne32	%f6,	%f2,	%o5
loop_2245:
	movrgez	%l3,	0x1C1,	%o6
	add	%l7,	0x38,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%l2
	casa	[%l6] 0x80,	%l2,	%g3
	tcs	%xcc,	0x1
	fzero	%f0
	tle	%icc,	0x1
	tg	%icc,	0x7
	fbge,a	%fcc2,	loop_2246
	tg	%icc,	0x1
	wr	%g0,	0x10,	%asi
	lduba	[%l7 + 0x71] %asi,	%l4
loop_2246:
	edge32ln	%i6,	%i7,	%g6
	sir	0x153A
	wr	%g0,	0x80,	%asi
	swapa	[%l7 + 0x60] %asi,	%o4
	udivcc	%i5,	0x0AA6,	%g1
	fmovdne	%xcc,	%f22,	%f27
	fmovrsgez	%i2,	%f23,	%f0
	addcc	%o3,	%o1,	%l1
	bne,a,pn	%icc,	loop_2247
	fbe,a	%fcc2,	loop_2248
	fmuld8ulx16	%f7,	%f17,	%f10
	call	loop_2249
loop_2247:
	orcc	%i4,	%o2,	%g4
loop_2248:
	subc	%i3,	%g5,	%o0
	nop
	setx	loop_2250,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_2249:
	addcc	%g7,	0x0037,	%g2
	fmovsa	%icc,	%f23,	%f9
	set	0x2C, %i1
	stwa	%l5,	[%l7 + %i1] 0x11
loop_2250:
	call	loop_2251
	tsubcc	%l6,	%l0,	%i0
	bn	loop_2252
	andncc	%o7,	%o5,	%i1
loop_2251:
	brlez,a	%o6,	loop_2253
	tsubcctv	%l2,	%l3,	%l4
loop_2252:
	tle	%icc,	0x3
	set	0x46, %g7
	stha	%g3,	[%l7 + %g7] 0x88
loop_2253:
	array8	%i6,	%i7,	%g6
	sdivx	%o4,	0x1C6E,	%g1
	lduh	[%l7 + 0x0E],	%i5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	add	%l7,	0x38,	%l6
	wr	%g0,	0x11,	%asi
	casxa	[%l6] %asi,	%o3,	%i2
	nop
	setx	loop_2254,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fmuld8sux16	%f21,	%f23,	%f4
	fbug	%fcc2,	loop_2255
	fpack32	%f22,	%f14,	%f14
loop_2254:
	subc	%l1,	%i4,	%o2
	wr	%g0,	0x11,	%asi
	lda	[%l7 + 0x70] %asi,	%f26
loop_2255:
	fmovda	%xcc,	%f5,	%f24
	edge32n	%o1,	%i3,	%g4
	umul	%o0,	0x1F10,	%g7
	set	0x48, %i3
	swapa	[%l7 + %i3] 0x0c,	%g2
	wr	%g0,	0x04,	%asi
	stxa	%l5,	[%l7 + 0x78] %asi
	umul	%l6,	%g5,	%i0
	brgez,a	%l0,	loop_2256
	orncc	%o7,	0x0874,	%o5
	fandnot2	%f10,	%f20,	%f10
	fsrc1	%f30,	%f26
loop_2256:
	movleu	%xcc,	%o6,	%l2
	wr	%g0,	0x89,	%asi
	swapa	[%l7 + 0x28] %asi,	%i1
	fcmpgt16	%f24,	%f10,	%l4
	tsubcc	%g3,	%i6,	%i7
	wr	%g0,	0x88,	%asi
	lduwa	[%l7 + 0x08] %asi,	%l3
	subccc	%g6,	0x0DC0,	%o4
	wr	%g0,	0x11,	%asi
	ldstuba	[%l7 + 0x6C] %asi,	%g1
	movrne	%i5,	%o3,	%l1
	tl	%xcc,	0x2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xor	%i4,	%i2,	%o1
	srax	%o2,	%i3,	%o0
	umulcc	%g7,	%g2,	%g4
	movvs	%xcc,	%l5,	%g5
	stb	%l6,	[%l7 + 0x3C]
	pdist	%f0,	%f16,	%f2
	fornot2s	%f10,	%f21,	%f4
	fbg	%fcc1,	loop_2257
	stw	%l0,	[%l7 + 0x08]
	edge32l	%o7,	%o5,	%i0
	brnz,a	%l2,	loop_2258
loop_2257:
	udiv	%o6,	0x0790,	%l4
	set	0x40, %l6
	sta	%f26,	[%l7 + %l6] 0x15
loop_2258:
	tvs	%xcc,	0x3
	fmovdne	%icc,	%f2,	%f8
	addc	%i1,	%g3,	%i6
	addccc	%i7,	0x1A35,	%g6
	sdiv	%l3,	0x0931,	%g1
	sra	%o4,	%i5,	%l1
	set	0x38, %g4
	stha	%i4,	[%l7 + %g4] 0xe2
	membar	#Sync
	fmovda	%xcc,	%f26,	%f18
	nop
	setx	loop_2259,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	tvc	%icc,	0x5
	fbul	%fcc3,	loop_2260
	nop
	fitod	%f10,	%f10
	fdtox	%f10,	%f18
loop_2259:
	movrgz	%i2,	%o3,	%o1
	movg	%xcc,	%i3,	%o0
loop_2260:
	popc	%g7,	%g2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16l	%g4,	%l5,	%g5
	sdivcc	%l6,	0x050D,	%o2
	add	%l7,	0x08,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%l0
	casxa	[%l6] 0x88,	%l0,	%o5
	bcc,a	loop_2261
	fcmpne16	%f24,	%f10,	%i0
	wr	%g0,	0x19,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
loop_2261:
	xorcc	%o7,	0x0CDA,	%l2
	addccc	%l4,	%i1,	%o6
	ta	%icc,	0x3
	srax	%g3,	0x1A,	%i6
	edge8	%g6,	%i7,	%l3
	wr	%g0,	0x89,	%asi
	ldsha	[%l7 + 0x38] %asi,	%g1
	xnorcc	%o4,	0x1DA9,	%i5
	move	%icc,	%i4,	%i2
	udivcc	%o3,	0x1C76,	%l1
	ldsh	[%l7 + 0x2C],	%i3
	sdiv	%o0,	0x052C,	%o1
	tne	%xcc,	0x7
	xnor	%g7,	0x143B,	%g4
	be,a,pn	%xcc,	loop_2262
	edge8ln	%l5,	%g5,	%g2
	subcc	%l6,	%o2,	%l0
	tvs	%icc,	0x4
loop_2262:
	tcs	%icc,	0x7
	fmovdg	%icc,	%f17,	%f7
	fpsub32s	%f29,	%f0,	%f17
	ld	[%l7 + 0x60],	%f14
	fmovdcs	%icc,	%f0,	%f20
	udivx	%o5,	0x1FC4,	%o7
	bl	%xcc,	loop_2263
	be,pt	%xcc,	loop_2264
	srlx	%l2,	0x05,	%l4
	fmovrdgz	%i0,	%f14,	%f12
loop_2263:
	orn	%i1,	%g3,	%i6
loop_2264:
	tvc	%xcc,	0x7
	fmovrslez	%g6,	%f25,	%f25
	fbg,a	%fcc0,	loop_2265
	movrlz	%i7,	0x291,	%o6
	tle	%icc,	0x6
	st	%f3,	[%l7 + 0x58]
loop_2265:
	nop
	wr	%g0,	0x19,	%asi
	stxa	%g1,	[%l7 + 0x60] %asi
	movrlez	%l3,	%i5,	%i4
	subc	%o4,	0x07D8,	%o3
	set	0x0C, %l4
	swapa	[%l7 + %l4] 0x81,	%l1
	lduh	[%l7 + 0x60],	%i2
	movne	%xcc,	%i3,	%o1
	nop
	fitos	%f4,	%f27
	fstod	%f27,	%f8
	movre	%o0,	0x05E,	%g7
	tge	%icc,	0x5
	fmovsa	%xcc,	%f19,	%f18
	nop
	setx	0x2738D4D4,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f6
	setx	0xD5856056,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f15
	fadds	%f15,	%f6,	%f30
	ta	%icc,	0x0
	movcc	%icc,	%g4,	%l5
	movrlz	%g5,	0x332,	%l6
	array16	%g2,	%o2,	%o5
	st	%f26,	[%l7 + 0x20]
	smul	%o7,	0x1BCD,	%l0
	stbar
	tne	%icc,	0x7
	fpadd32s	%f22,	%f12,	%f24
	movge	%icc,	%l2,	%i0
	array32	%i1,	%l4,	%i6
	movvc	%xcc,	%g3,	%g6
	edge8	%o6,	%g1,	%l3
	tleu	%icc,	0x5
	lduw	[%l7 + 0x44],	%i7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tl	%xcc,	0x1
	membar	0x3C
	fmovdne	%icc,	%f22,	%f9
	wr	%g0,	0x04,	%asi
	prefetcha	[%l7 + 0x40] %asi,	 0x1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sth	%i4,	[%l7 + 0x78]
	fone	%f26
	fbl,a	%fcc1,	loop_2266
	movgu	%icc,	%o4,	%l1
	movre	%i2,	0x012,	%i3
	subccc	%o3,	0x16BF,	%o0
loop_2266:
	fpmerge	%f6,	%f3,	%f28
	fnegd	%f6,	%f2
	mova	%icc,	%g7,	%o1
	stw	%g4,	[%l7 + 0x0C]
	tl	%xcc,	0x3
	edge16n	%l5,	%l6,	%g5
	mulscc	%o2,	0x1368,	%o5
	fmovsl	%icc,	%f12,	%f4
	fbo	%fcc1,	loop_2267
	fpackfix	%f28,	%f5
	tle	%xcc,	0x5
	movl	%icc,	%o7,	%l0
loop_2267:
	mulx	%g2,	%i0,	%i1
	xnorcc	%l4,	0x0AF3,	%l2
	movcc	%xcc,	%i6,	%g3
	array16	%g6,	%g1,	%o6
	fnegs	%f3,	%f31
	edge8l	%i7,	%l3,	%i4
	sir	0x017B
	nop
	fitod	%f4,	%f18
	fdtox	%f18,	%f16
	fxtod	%f16,	%f18
	ba	%xcc,	loop_2268
	addc	%i5,	%o4,	%i2
	addc	%l1,	%o3,	%i3
	add	%l7,	0x38,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] %asi,	%o0,	%o1
loop_2268:
	sir	0x0378
	and	%g4,	0x1BF6,	%g7
	mulscc	%l5,	%g5,	%l6
	nop
	fitod	%f18,	%f24
	edge8l	%o2,	%o5,	%o7
	subcc	%l0,	%i0,	%g2
	stx	%i1,	[%l7 + 0x60]
	addc	%l2,	0x0B8F,	%l4
	tle	%xcc,	0x6
	ldsb	[%l7 + 0x3C],	%g3
	movcs	%icc,	%i6,	%g6
	fmovsne	%icc,	%f5,	%f7
	fmovrdlz	%g1,	%f30,	%f30
	fmovrdne	%i7,	%f28,	%f12
	add	%l3,	%i4,	%o6
	bn	%xcc,	loop_2269
	fmovdn	%icc,	%f3,	%f17
	tgu	%xcc,	0x4
	set	0x14, %l0
	stha	%i5,	[%l7 + %l0] 0x81
loop_2269:
	movleu	%icc,	%o4,	%l1
	wr	%g0,	0x81,	%asi
	ldda	[%l7 + 0x30] %asi,	%o2
	flush	%l7 + 0x58
	andncc	%i2,	%i3,	%o0
	sdivcc	%o1,	0x020E,	%g7
	sll	%l5,	%g4,	%g5
	fmovsneg	%xcc,	%f8,	%f20
	tle	%xcc,	0x0
	xor	%l6,	%o2,	%o7
	udivcc	%l0,	0x0A69,	%o5
	movrne	%i0,	%i1,	%l2
	movneg	%icc,	%g2,	%l4
	tge	%xcc,	0x5
	movcs	%icc,	%i6,	%g3
	orncc	%g6,	0x06D1,	%g1
	fpackfix	%f6,	%f25
	fmovdne	%xcc,	%f21,	%f3
	movne	%xcc,	%i7,	%l3
	fmovrsgz	%i4,	%f23,	%f23
	move	%icc,	%o6,	%i5
	fmovrdgz	%l1,	%f8,	%f18
	fexpand	%f30,	%f14
	andcc	%o4,	0x1FA0,	%i2
	edge16n	%o3,	%o0,	%i3
	addcc	%o1,	%g7,	%g4
	wr	%g0,	0x0c,	%asi
	ldstuba	[%l7 + 0x44] %asi,	%g5
	stw	%l6,	[%l7 + 0x30]
	fmovse	%icc,	%f5,	%f9
	fbge	%fcc0,	loop_2270
	array16	%l5,	%o7,	%l0
	add	%l7,	0x40,	%l6
	wr	%g0,	0x10,	%asi
	casxa	[%l6] 0x10,	%o2,	%i0
loop_2270:
	edge32	%i1,	%o5,	%g2
	alignaddrl	%l4,	%i6,	%l2
	fmovsg	%icc,	%f15,	%f19
	fnegs	%f20,	%f26
	srax	%g3,	%g1,	%g6
	movle	%xcc,	%i7,	%i4
	andcc	%o6,	%i5,	%l1
	bneg,pn	%icc,	loop_2271
	fbuge,a	%fcc2,	loop_2272
	movrgz	%l3,	%o4,	%i2
	tle	%icc,	0x7
loop_2271:
	sdiv	%o3,	0x1B10,	%i3
loop_2272:
	nop
	wr	%g0,	0x89,	%asi
	lduwa	[%l7 + 0x44] %asi,	%o1
	sdivx	%o0,	0x0E60,	%g7
	nop
	set	0x5C, %i5
	prefetch	[%l7 + %i5],	 0x2
	fbge	%fcc0,	loop_2273
	edge32n	%g5,	%g4,	%l5
	nop
	set	0x18, %i2
	std	%f18,	[%l7 + %i2]
	movl	%xcc,	%l6,	%l0
loop_2273:
	subcc	%o2,	0x03FE,	%i0
	fands	%f0,	%f14,	%f6
	tcs	%icc,	0x7
	popc	0x16D8,	%i1
	movl	%xcc,	%o5,	%o7
	edge32	%l4,	%i6,	%l2
	fmovrse	%g3,	%f1,	%f22
	membar	0x0A
	movg	%icc,	%g1,	%g6
	bl	%xcc,	loop_2274
	sdivcc	%g2,	0x0882,	%i4
	lduw	[%l7 + 0x74],	%i7
	array16	%i5,	%l1,	%o6
loop_2274:
	alignaddrl	%o4,	%l3,	%i2
	tg	%xcc,	0x0
	xor	%i3,	0x100E,	%o3
	fmovd	%f12,	%f0
	fpsub16s	%f15,	%f4,	%f29
	fornot1	%f6,	%f12,	%f10
	array16	%o0,	%g7,	%g5
	alignaddr	%o1,	%g4,	%l6
	fands	%f8,	%f18,	%f30
	nop
	set	0x40, %o4
	std	%f2,	[%l7 + %o4]
	move	%icc,	%l5,	%o2
	array32	%l0,	%i0,	%o5
	wr	%g0,	0x88,	%asi
	prefetcha	[%l7 + 0x30] %asi,	 0x1
	add	%l7,	0x48,	%l6
	wr	%g0,	0x18,	%asi
	casxa	[%l6] %asi,	%l4,	%i6
	umulcc	%l2,	%g3,	%g1
	nop
	fitos	%f9,	%f17
	fstox	%f17,	%f30
	add	%g6,	%g2,	%o7
	orncc	%i7,	0x1F27,	%i4
	ble,pt	%icc,	loop_2275
	fmovd	%f10,	%f4
	movrlz	%i5,	%l1,	%o4
	lduh	[%l7 + 0x10],	%o6
loop_2275:
	tsubcctv	%l3,	%i2,	%i3
	bleu	%xcc,	loop_2276
	edge8l	%o0,	%o3,	%g5
	fbule	%fcc3,	loop_2277
	fmul8x16	%f14,	%f8,	%f24
loop_2276:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	umulcc	%g7,	0x1EE9,	%g4
loop_2277:
	movrgz	%o1,	0x2FA,	%l6
	brgz,a	%l5,	loop_2278
	ld	[%l7 + 0x44],	%f18
	std	%f4,	[%l7 + 0x28]
	movre	%l0,	%i0,	%o2
loop_2278:
	fmovsleu	%icc,	%f7,	%f30
	movg	%xcc,	%i1,	%o5
	nop
	fitos	%f2,	%f29
	fstox	%f29,	%f28
	fxtos	%f28,	%f11
	bpos,a,pn	%xcc,	loop_2279
	srl	%i6,	%l4,	%g3
	and	%l2,	0x1836,	%g6
	edge16ln	%g1,	%g2,	%i7
loop_2279:
	sth	%i4,	[%l7 + 0x6C]
	fpsub32s	%f10,	%f3,	%f25
	sth	%o7,	[%l7 + 0x38]
	fmovdg	%icc,	%f13,	%f15
	fmovdgu	%icc,	%f21,	%f30
	sethi	0x08C2,	%l1
	alignaddrl	%i5,	%o6,	%l3
	subccc	%o4,	%i2,	%o0
	mulscc	%o3,	0x1C42,	%i3
	set	0x40, %o6
	stda	%f16,	[%l7 + %o6] 0x19
	edge16ln	%g5,	%g4,	%o1
	bgu,a	loop_2280
	orncc	%l6,	%l5,	%l0
	fmovrslez	%g7,	%f27,	%f6
	fmovdvc	%icc,	%f0,	%f4
loop_2280:
	brnz,a	%i0,	loop_2281
	fsrc2	%f30,	%f6
	edge16ln	%i1,	%o5,	%i6
	orn	%l4,	%o2,	%g3
loop_2281:
	nop
	wr	%g0,	0x89,	%asi
	lduwa	[%l7 + 0x3C] %asi,	%g6
	edge8ln	%l2,	%g2,	%g1
	edge16n	%i7,	%i4,	%l1
	movne	%icc,	%o7,	%i5
	bleu,pt	%icc,	loop_2282
	movrlz	%l3,	0x3C9,	%o4
	fbule,a	%fcc3,	loop_2283
	nop
	setx loop_2284, %l0, %l1
	jmpl %l1, %o6
loop_2282:
	ldsw	[%l7 + 0x10],	%o0
	add	%l7,	0x30,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%o3
	casxa	[%l6] %asi,	%o3,	%i3
loop_2283:
	tgu	%icc,	0x0
loop_2284:
	nop
	setx loop_2285, %l0, %l1
	jmpl %l1, %i2
	alignaddr	%g5,	%g4,	%l6
	tn	%icc,	0x0
	tge	%icc,	0x5
loop_2285:
	movcc	%xcc,	%l5,	%l0
	bvs,a	loop_2286
	smulcc	%o1,	0x1B6E,	%g7
	te	%xcc,	0x0
	udivcc	%i0,	0x1944,	%i1
loop_2286:
	fabsd	%f0,	%f24
	brgz	%i6,	loop_2287
	nop
	setx	0x6A5629FB,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f23
	setx	0xDA8B9813,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f17
	fadds	%f17,	%f23,	%f0
	addccc	%o5,	0x1874,	%o2
	umulcc	%l4,	0x0E9B,	%g3
loop_2287:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bg,pt	%xcc,	loop_2288
	udiv	%g6,	0x0D63,	%l2
	bn,a	%icc,	loop_2289
	sllx	%g2,	%i7,	%i4
loop_2288:
	umulcc	%l1,	%g1,	%i5
	edge16n	%l3,	%o7,	%o4
loop_2289:
	and	%o6,	%o0,	%i3
	fmul8x16au	%f29,	%f31,	%f20
	bne,a,pt	%icc,	loop_2290
	udivcc	%o3,	0x108A,	%g5
	set	0x38, %i6
	prefetcha	[%l7 + %i6] 0x81,	 0x1
loop_2290:
	nop
	setx loop_2291, %l0, %l1
	jmpl %l1, %l6
	call	loop_2292
	bpos,pn	%icc,	loop_2293
	smul	%g4,	%l5,	%o1
loop_2291:
	fornot2	%f18,	%f8,	%f20
loop_2292:
	lduh	[%l7 + 0x72],	%g7
loop_2293:
	tcc	%icc,	0x0
	movrlez	%l0,	%i0,	%i6
	tl	%icc,	0x1
	nop
	setx	0x6693CDF6505D4466,	%l0,	%l6
	stx	%l6,	[%l7 + 0x70]
	ldx	[%l7 + 0x70],	%fsr
	fsrc1s	%f19,	%f5
	fmovdneg	%xcc,	%f2,	%f16
	bvc	loop_2294
	bg	loop_2295
	movvc	%xcc,	%o5,	%o2
	tn	%icc,	0x2
loop_2294:
	tsubcc	%i1,	0x1AF1,	%g3
loop_2295:
	tcc	%icc,	0x4
	set	0x12, %o5
	stha	%g6,	[%l7 + %o5] 0x18
	subcc	%l4,	0x0A53,	%l2
	fmovsleu	%xcc,	%f14,	%f12
	prefetch	[%l7 + 0x48],	 0x2
	srax	%i7,	0x1A,	%g2
	srax	%l1,	0x1C,	%i4
	edge16ln	%i5,	%l3,	%o7
	nop
	setx	0x3EFEAAE4,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f11
	setx	0x07B58A7C,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f25
	fsubs	%f25,	%f11,	%f16
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpackfix	%f24,	%f0
	movrgez	%o4,	%o6,	%o0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udivx	%i3,	0x17C1,	%o3
	movge	%xcc,	%g1,	%g5
	movpos	%xcc,	%i2,	%l6
	set	0x68, %g6
	sta	%f17,	[%l7 + %g6] 0x81
	edge8l	%g4,	%l5,	%g7
	fcmple32	%f4,	%f16,	%l0
	add	%l7,	0x18,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%o1,	%i0
	movrgz	%i6,	%o2,	%i1
	xorcc	%o5,	0x1919,	%g6
	addccc	%g3,	0x1B0D,	%l4
	srax	%l2,	%g2,	%i7
	fandnot1s	%f9,	%f31,	%f0
	subcc	%l1,	%i5,	%l3
	movgu	%icc,	%i4,	%o4
	tle	%icc,	0x2
	tgu	%icc,	0x7
	movvc	%icc,	%o7,	%o6
	stx	%o0,	[%l7 + 0x68]
	fnor	%f12,	%f30,	%f0
	tcs	%icc,	0x1
	fmovdvc	%icc,	%f4,	%f21
	edge32n	%o3,	%i3,	%g1
	sdivx	%g5,	0x070B,	%l6
	fpadd16	%f22,	%f24,	%f22
	edge16n	%g4,	%i2,	%l5
	movleu	%icc,	%g7,	%o1
	tvc	%icc,	0x1
	alignaddr	%i0,	%l0,	%i6
	sdiv	%o2,	0x107C,	%o5
	brlz,a	%i1,	loop_2296
	edge16l	%g3,	%l4,	%g6
	ldx	[%l7 + 0x68],	%g2
	movrgez	%l2,	0x072,	%l1
loop_2296:
	nop
	set	0x33, %i4
	ldstuba	[%l7 + %i4] 0x80,	%i7
	fandnot2s	%f19,	%f1,	%f27
	fcmple16	%f8,	%f26,	%l3
	nop
	fitod	%f0,	%f8
	fdtox	%f8,	%f14
	fxtod	%f14,	%f10
	nop
	fitod	%f2,	%f18
	fdtos	%f18,	%f30
	xnor	%i5,	0x10A2,	%o4
	tg	%xcc,	0x2
	bvc,pt	%icc,	loop_2297
	fmovdgu	%icc,	%f19,	%f4
	stbar
	fbu,a	%fcc1,	loop_2298
loop_2297:
	orn	%o7,	0x1FCC,	%i4
	xnor	%o6,	0x1028,	%o0
	add	%o3,	0x0FB6,	%g1
loop_2298:
	fmovrslez	%i3,	%f29,	%f30
	movg	%icc,	%g5,	%g4
	tg	%icc,	0x1
	alignaddr	%i2,	%l6,	%l5
	fpadd32s	%f29,	%f21,	%f24
	andncc	%o1,	%g7,	%i0
	fmovrde	%i6,	%f4,	%f0
	wr	%g0,	0x0c,	%asi
	prefetcha	[%l7 + 0x18] %asi,	 0x1
	bvs,a	%icc,	loop_2299
	ldx	[%l7 + 0x60],	%o2
	wr	%g0,	0x11,	%asi
	lduha	[%l7 + 0x62] %asi,	%o5
loop_2299:
	faligndata	%f26,	%f20,	%f4
	flush	%l7 + 0x18
	fsrc2s	%f19,	%f9
	move	%icc,	%i1,	%g3
	sub	%g6,	0x1F0B,	%l4
	nop
	setx	0x6A75E803DA4CC950,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	fsqrtd	%f26,	%f20
	te	%xcc,	0x3
	add	%g2,	%l2,	%l1
	movre	%i7,	0x04A,	%i5
	fmovsn	%xcc,	%f12,	%f21
	sra	%l3,	0x08,	%o4
	fmuld8sux16	%f2,	%f13,	%f26
	fblg	%fcc3,	loop_2300
	mulscc	%o7,	%i4,	%o6
	orncc	%o3,	%g1,	%i3
	tvc	%icc,	0x2
loop_2300:
	tl	%icc,	0x1
	fnot2	%f12,	%f24
	tsubcctv	%o0,	%g4,	%i2
	array16	%l6,	%l5,	%o1
	xor	%g7,	0x134E,	%i0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addc	%g5,	0x0576,	%i6
	fmovsa	%icc,	%f1,	%f4
	fbne	%fcc2,	loop_2301
	subcc	%o2,	%l0,	%o5
	ldub	[%l7 + 0x34],	%g3
	wr	%g0,	0x22,	%asi
	ldda	[%l7 + 0x10] %asi,	%g6
loop_2301:
	tvc	%icc,	0x2
	ta	%xcc,	0x0
	swap	[%l7 + 0x54],	%l4
	udiv	%i1,	0x1A44,	%g2
	wr	%g0,	0x58,	%asi
	ldxa	[%g0 + 0x20] %asi,	%l2
	edge8l	%l1,	%i5,	%i7
	edge8n	%o4,	%l3,	%o7
	fmuld8sux16	%f7,	%f17,	%f26
	andcc	%i4,	%o3,	%o6
	movge	%xcc,	%i3,	%o0
	popc	0x1665,	%g1
	movrlez	%g4,	0x2AC,	%i2
	orncc	%l6,	0x165E,	%l5
	fxnors	%f22,	%f19,	%f22
	bneg	loop_2302
	addccc	%o1,	%g7,	%g5
	tsubcctv	%i0,	0x1C6B,	%o2
	move	%xcc,	%l0,	%o5
loop_2302:
	edge16	%g3,	%g6,	%i6
	orncc	%l4,	%i1,	%g2
	movcs	%icc,	%l1,	%l2
	fmul8x16au	%f11,	%f1,	%f16
	tne	%xcc,	0x6
	fmovdle	%xcc,	%f23,	%f3
	movre	%i7,	%o4,	%i5
	sub	%l3,	0x04D3,	%o7
	udiv	%i4,	0x0F3F,	%o6
	brgz	%i3,	loop_2303
	sra	%o3,	0x03,	%g1
	bvs,pt	%xcc,	loop_2304
	edge8n	%o0,	%g4,	%l6
loop_2303:
	edge32n	%l5,	%o1,	%g7
	movrlez	%g5,	%i2,	%i0
loop_2304:
	move	%xcc,	%l0,	%o2
	movre	%o5,	0x028,	%g3
	udivcc	%g6,	0x15AB,	%l4
	bg,a	%xcc,	loop_2305
	fbne,a	%fcc2,	loop_2306
	nop
	fitos	%f26,	%f25
	tvc	%icc,	0x0
loop_2305:
	fmuld8sux16	%f0,	%f30,	%f18
loop_2306:
	nop
	setx	loop_2307,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	alignaddr	%i1,	%g2,	%i6
	edge16l	%l2,	%i7,	%o4
	movne	%icc,	%i5,	%l3
loop_2307:
	movneg	%xcc,	%o7,	%l1
	movgu	%xcc,	%o6,	%i4
	umulcc	%i3,	0x0EA1,	%o3
	add	%l7,	0x08,	%l6
	wr	%g0,	0x04,	%asi
	ldxa	[%l6] %asi,	%g1
	casxa	[%l6] %asi,	%g1,	%g4
	tle	%icc,	0x3
	sdivx	%l6,	0x1F84,	%l5
	add	%o0,	%o1,	%g5
	tgu	%icc,	0x5
	flush	%l7 + 0x10
	fmovdcs	%xcc,	%f5,	%f27
	fmovsgu	%xcc,	%f0,	%f11
	fnot1s	%f8,	%f12
	nop
	fitod	%f10,	%f6
	fdtos	%f6,	%f2
	flush	%l7 + 0x30
	edge8	%g7,	%i2,	%i0
	movgu	%xcc,	%l0,	%o2
	fcmpgt32	%f12,	%f14,	%o5
	fcmpne16	%f26,	%f10,	%g6
	fcmpgt16	%f18,	%f22,	%l4
	tge	%icc,	0x1
	ba	%icc,	loop_2308
	tcc	%icc,	0x6
	movvs	%icc,	%i1,	%g2
	bpos	loop_2309
loop_2308:
	fmovrdlz	%i6,	%f6,	%f12
	tn	%icc,	0x3
	ba,pt	%xcc,	loop_2310
loop_2309:
	xnor	%l2,	0x1A57,	%g3
	fmovspos	%icc,	%f7,	%f9
	brz,a	%i7,	loop_2311
loop_2310:
	nop
	setx	0xA00C3B70,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f16
	fsqrts	%f16,	%f13
	bgu	%icc,	loop_2312
	tvs	%xcc,	0x4
loop_2311:
	udivx	%o4,	0x1302,	%i5
	sdiv	%o7,	0x0BEC,	%l1
loop_2312:
	umulcc	%l3,	%o6,	%i3
	fmovrdgz	%o3,	%f0,	%f8
	sdivx	%g1,	0x1861,	%i4
	tsubcctv	%g4,	%l5,	%l6
	tle	%xcc,	0x7
	add	%l7,	0x20,	%l6
	wr	%g0,	0x18,	%asi
	casxa	[%l6] 0x18,	%o0,	%o1
	tn	%icc,	0x7
	fmovdvs	%icc,	%f3,	%f26
	tcs	%xcc,	0x0
	brz,a	%g5,	loop_2313
	tn	%icc,	0x2
	andn	%i2,	%i0,	%g7
	move	%xcc,	%o2,	%l0
loop_2313:
	fpack16	%f16,	%f12
	fmovdvc	%xcc,	%f9,	%f16
	membar	0x30
	fmovsneg	%xcc,	%f14,	%f23
	alignaddr	%o5,	%l4,	%g6
	tcs	%xcc,	0x2
	fbue	%fcc3,	loop_2314
	nop
	setx	loop_2315,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	add	%g2,	%i1,	%i6
	udivcc	%l2,	0x12FA,	%g3
loop_2314:
	nop
	fitos	%f4,	%f25
	fstox	%f25,	%f14
	fxtos	%f14,	%f31
loop_2315:
	fsrc1s	%f30,	%f11
	sir	0x1819
	tvc	%icc,	0x1
	srax	%i7,	%i5,	%o7
	tvc	%icc,	0x1
	movg	%icc,	%l1,	%o4
	nop
	setx	0xC4DCDCB7,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f29
	setx	0x490740CD,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f24
	fadds	%f24,	%f29,	%f23
	fmovsge	%xcc,	%f15,	%f1
	fpack32	%f14,	%f12,	%f6
	movrlz	%o6,	%i3,	%l3
	movn	%xcc,	%g1,	%o3
	or	%g4,	%i4,	%l5
	for	%f8,	%f12,	%f20
	fmovdle	%icc,	%f0,	%f14
	bvs	%xcc,	loop_2316
	xorcc	%l6,	0x1B7B,	%o1
	fbo	%fcc3,	loop_2317
	ldub	[%l7 + 0x5F],	%o0
loop_2316:
	fbue,a	%fcc1,	loop_2318
	xnor	%i2,	%i0,	%g7
loop_2317:
	ldub	[%l7 + 0x6F],	%o2
	bne,a	%icc,	loop_2319
loop_2318:
	sir	0x01F9
	ldsw	[%l7 + 0x68],	%g5
	movl	%xcc,	%o5,	%l4
loop_2319:
	bcc,pn	%xcc,	loop_2320
	movvc	%icc,	%g6,	%l0
	tleu	%icc,	0x7
	bvc,a,pn	%xcc,	loop_2321
loop_2320:
	sir	0x0CEF
	addccc	%g2,	%i1,	%l2
	array32	%g3,	%i7,	%i5
loop_2321:
	edge16n	%o7,	%l1,	%o4
	nop
	fitod	%f12,	%f0
	fdtoi	%f0,	%f18
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
	for	%f14,	%f16,	%f4
	tl	%icc,	0x7
	edge16	%o6,	%i3,	%l3
loop_2322:
	ldsh	[%l7 + 0x66],	%i6
	brgz,a	%o3,	loop_2323
	and	%g4,	0x151E,	%g1
	move	%xcc,	%l5,	%l6
	ldsb	[%l7 + 0x5C],	%i4
loop_2323:
	movleu	%xcc,	%o1,	%o0
	fandnot2s	%f19,	%f12,	%f15
	srl	%i2,	%g7,	%o2
	ldd	[%l7 + 0x18],	%f2
	wr	%g0,	0x11,	%asi
	ldsha	[%l7 + 0x76] %asi,	%i0
	add	%o5,	%g5,	%g6
	fcmpne32	%f4,	%f30,	%l4
	move	%icc,	%l0,	%g2
	tn	%icc,	0x5
	wr	%g0,	0x0c,	%asi
	prefetcha	[%l7 + 0x48] %asi,	 0x2
	popc	0x167A,	%l2
	fmovdvs	%xcc,	%f19,	%f10
	fmovdleu	%icc,	%f30,	%f5
	movl	%icc,	%g3,	%i5
	wr	%g0,	0x11,	%asi
	lda	[%l7 + 0x4C] %asi,	%f3
	st	%f13,	[%l7 + 0x74]
	alignaddr	%i7,	%o7,	%o4
	fba	%fcc2,	loop_2324
	fbuge	%fcc1,	loop_2325
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udivx	%o6,	0x1315,	%i3
loop_2324:
	movvs	%icc,	%l3,	%l1
loop_2325:
	fmovrdgz	%i6,	%f16,	%f24
	fbe	%fcc1,	loop_2326
	fornot2	%f18,	%f24,	%f4
	tge	%xcc,	0x3
	sdivx	%o3,	0x09C6,	%g1
loop_2326:
	mulx	%l5,	0x1097,	%l6
	or	%g4,	0x0CC5,	%i4
	nop
	fitod	%f4,	%f8
	fdtox	%f8,	%f6
	fxtod	%f6,	%f14
	fsrc1s	%f7,	%f2
	fmovsgu	%icc,	%f25,	%f29
	movl	%icc,	%o0,	%i2
	wr	%g0,	0x81,	%asi
	ldstuba	[%l7 + 0x25] %asi,	%o1
	subc	%g7,	0x11A4,	%o2
	nop
	set	0x58, %g3
	ldx	[%l7 + %g3],	%o5
	movneg	%xcc,	%g5,	%i0
	fmul8x16al	%f31,	%f21,	%f16
	movle	%xcc,	%g6,	%l4
	edge8	%g2,	%l0,	%l2
	sra	%g3,	%i5,	%i7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tcc	%icc,	0x6
	movne	%icc,	%o7,	%o4
	brlz,a	%i1,	loop_2327
	fbule,a	%fcc2,	loop_2328
	fpack32	%f12,	%f2,	%f28
	movrlez	%i3,	%o6,	%l1
loop_2327:
	fmovrsgez	%i6,	%f7,	%f10
loop_2328:
	movg	%icc,	%o3,	%l3
	set	0x55, %o1
	stba	%l5,	[%l7 + %o1] 0x0c
	movpos	%xcc,	%g1,	%g4
	addc	%l6,	%i4,	%o0
	fnot1s	%f29,	%f23
	set	0x3B, %g2
	ldsba	[%l7 + %g2] 0x11,	%o1
	subc	%g7,	0x1C19,	%i2
	fpadd32s	%f29,	%f6,	%f27
	fmovscc	%icc,	%f6,	%f27
	add	%l7,	0x30,	%l6
	wr	%g0,	0x18,	%asi
	casa	[%l6] %asi,	%o5,	%o2
	fmovsvs	%xcc,	%f5,	%f4
	edge8l	%i0,	%g6,	%g5
	fcmpeq32	%f14,	%f22,	%g2
	movrgez	%l4,	0x355,	%l0
	fbule,a	%fcc0,	loop_2329
	movrlez	%l2,	%g3,	%i5
	wr	%g0,	0x52,	%asi
	ldxa	[%g0 + 0x108] %asi,	%o7
loop_2329:
	alignaddr	%i7,	%i1,	%i3
	movrlez	%o4,	%l1,	%o6
	srl	%i6,	0x1D,	%l3
	fbn,a	%fcc2,	loop_2330
	ta	%xcc,	0x5
	movn	%xcc,	%o3,	%l5
	subc	%g1,	%g4,	%i4
loop_2330:
	or	%o0,	%l6,	%g7
	fblg,a	%fcc0,	loop_2331
	nop
	setx	0xB256B0BCD1961252,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0xC02E78EF13333DC7,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	faddd	%f30,	%f8,	%f22
	orcc	%o1,	%o5,	%i2
	fcmpeq32	%f18,	%f12,	%o2
loop_2331:
	sdivx	%i0,	0x0A2C,	%g6
	nop
	fitos	%f14,	%f11
	fstoi	%f11,	%f6
	movrlz	%g5,	0x0DB,	%l4
	umul	%g2,	%l2,	%g3
	wr	%g0,	0x80,	%asi
	ldsba	[%l7 + 0x6D] %asi,	%i5
	fmovsvs	%icc,	%f17,	%f11
	subc	%o7,	%i7,	%i1
	array16	%l0,	%o4,	%i3
	tsubcctv	%l1,	%o6,	%l3
	movvs	%xcc,	%i6,	%o3
	array8	%g1,	%g4,	%l5
	srlx	%o0,	%l6,	%g7
	stw	%o1,	[%l7 + 0x5C]
	edge16	%i4,	%o5,	%i2
	nop
	set	0x5C, %g1
	prefetch	[%l7 + %g1],	 0x2
	fmovdneg	%icc,	%f0,	%f13
	alignaddr	%o2,	%i0,	%g6
	fmovrslz	%l4,	%f26,	%f28
	movcc	%xcc,	%g2,	%g5
	movre	%l2,	%i5,	%o7
	smulcc	%g3,	%i1,	%l0
	srax	%i7,	%i3,	%l1
	array16	%o4,	%l3,	%o6
	tsubcctv	%o3,	%g1,	%i6
	tleu	%xcc,	0x1
	te	%icc,	0x3
	edge8	%g4,	%o0,	%l6
	fmovdpos	%xcc,	%f27,	%f5
	fble	%fcc0,	loop_2332
	bvs,pt	%xcc,	loop_2333
	popc	0x13E9,	%l5
	tvs	%icc,	0x0
loop_2332:
	fmovsleu	%icc,	%f18,	%f26
loop_2333:
	movrlez	%g7,	%i4,	%o5
	fmovsvs	%icc,	%f31,	%f8
	smul	%i2,	%o1,	%o2
	nop
	setx	0xE30345691A50263D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	setx	0x9284839CB7581A15,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	fsubd	%f14,	%f18,	%f14
	array8	%i0,	%l4,	%g6
	call	loop_2334
	srl	%g5,	%l2,	%g2
	orncc	%o7,	0x0E03,	%i5
	fandnot1	%f0,	%f2,	%f16
loop_2334:
	fbue,a	%fcc0,	loop_2335
	udivx	%g3,	0x140D,	%i1
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
	fxors	%f19,	%f29,	%f13
loop_2335:
	fpsub32	%f26,	%f2,	%f24
	fmovrdgez	%i7,	%f22,	%f14
loop_2336:
	tpos	%xcc,	0x7
	movcs	%xcc,	%l0,	%i3
	mulscc	%o4,	0x1AA7,	%l1
	movvs	%xcc,	%l3,	%o3
	movgu	%xcc,	%g1,	%o6
	bneg,pn	%xcc,	loop_2337
	movrlez	%g4,	0x36D,	%o0
	lduw	[%l7 + 0x6C],	%i6
	bvs	loop_2338
loop_2337:
	addccc	%l6,	%g7,	%i4
	ta	%icc,	0x2
	tne	%xcc,	0x4
loop_2338:
	tne	%xcc,	0x0
	fcmpne32	%f26,	%f24,	%l5
	brlez,a	%i2,	loop_2339
	fpsub32	%f30,	%f18,	%f26
	fmul8ulx16	%f28,	%f8,	%f28
	addccc	%o5,	0x1482,	%o1
loop_2339:
	bvs,pn	%icc,	loop_2340
	bge,pn	%icc,	loop_2341
	movgu	%icc,	%i0,	%o2
	ta	%icc,	0x6
loop_2340:
	nop
	setx	0x2D943290,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f6
	setx	0xC644100D,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f8
	fmuls	%f8,	%f6,	%f17
loop_2341:
	taddcc	%l4,	%g6,	%l2
	sir	0x0CBC
	andcc	%g5,	%o7,	%g2
	movn	%xcc,	%g3,	%i1
	array8	%i7,	%l0,	%i5
	set	0x10, %g5
	ldstuba	[%l7 + %g5] 0x10,	%i3
	set	0x64, %l1
	lda	[%l7 + %l1] 0x15,	%f8
	fbg	%fcc3,	loop_2342
	tcs	%icc,	0x7
	fnands	%f6,	%f26,	%f4
	set	0x22, %i7
	stha	%o4,	[%l7 + %i7] 0x0c
loop_2342:
	tsubcc	%l1,	%l3,	%o3
	movleu	%icc,	%g1,	%o6
	fbl,a	%fcc3,	loop_2343
	fnand	%f30,	%f2,	%f0
	xor	%o0,	%g4,	%l6
	sub	%g7,	%i4,	%i6
loop_2343:
	movgu	%xcc,	%i2,	%o5
	fnot1	%f6,	%f20
	umulcc	%o1,	%l5,	%o2
	alignaddr	%l4,	%g6,	%l2
	tg	%xcc,	0x4
	fzeros	%f16
	tpos	%xcc,	0x3
	nop
	setx	0x00D3457DD47A2F19,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0x530D1E893A2CAE87,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	fsubd	%f16,	%f6,	%f12
	fmovdcs	%icc,	%f13,	%f21
	orcc	%i0,	%g5,	%g2
	edge32l	%g3,	%i1,	%o7
	ta	%xcc,	0x6
	add	%l7,	0x54,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%i7
	casa	[%l6] %asi,	%i7,	%l0
	fble,a	%fcc2,	loop_2344
	taddcc	%i5,	0x1240,	%i3
	tleu	%icc,	0x6
	fbe,a	%fcc3,	loop_2345
loop_2344:
	nop
	fitod	%f10,	%f18
	fdtox	%f18,	%f18
	fxtod	%f18,	%f22
	orncc	%l1,	%o4,	%o3
	set	0x10, %o0
	prefetcha	[%l7 + %o0] 0x80,	 0x1
loop_2345:
	bge	loop_2346
	fble	%fcc3,	loop_2347
	subccc	%g1,	0x0C53,	%o6
	wr	%g0,	0x2a,	%asi
	stwa	%o0,	[%l7 + 0x1C] %asi
	membar	#Sync
loop_2346:
	nop
	set	0x60, %l2
	ldda	[%l7 + %l2] 0x04,	%i6
loop_2347:
	nop
	setx	0x877BA53C,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f7
	setx	0x3377FD3A,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f5
	fadds	%f5,	%f7,	%f6
	or	%g4,	0x0F91,	%g7
	tg	%icc,	0x1
	ldd	[%l7 + 0x48],	%f6
	nop
	set	0x20, %l3
	ldd	[%l7 + %l3],	%f26
	sdivx	%i6,	0x091E,	%i4
	movrgez	%i2,	0x0B4,	%o1
	orcc	%l5,	0x171D,	%o2
	brnz	%o5,	loop_2348
	movn	%xcc,	%l4,	%g6
	edge32ln	%i0,	%l2,	%g2
	or	%g3,	%i1,	%g5
loop_2348:
	ba,a	%icc,	loop_2349
	edge32ln	%o7,	%i7,	%i5
	brgez,a	%i3,	loop_2350
	tvs	%icc,	0x4
loop_2349:
	edge32n	%l0,	%o4,	%o3
	ldd	[%l7 + 0x20],	%l0
loop_2350:
	call	loop_2351
	fpadd32	%f20,	%f12,	%f28
	movcc	%icc,	%l3,	%o6
	taddcctv	%o0,	%l6,	%g4
loop_2351:
	fbge,a	%fcc0,	loop_2352
	ld	[%l7 + 0x30],	%f29
	fcmpeq32	%f24,	%f8,	%g7
	set	0x58, %o2
	lda	[%l7 + %o2] 0x0c,	%f20
loop_2352:
	sllx	%i6,	%i4,	%i2
	fxors	%f29,	%f11,	%f6
	or	%o1,	0x030A,	%g1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdivx	%o2,	0x0ACE,	%l5
	subccc	%o5,	%l4,	%i0
	nop
	setx loop_2353, %l0, %l1
	jmpl %l1, %g6
	bge,a	%xcc,	loop_2354
	andn	%g2,	%g3,	%i1
	srlx	%l2,	%o7,	%g5
loop_2353:
	sra	%i5,	%i3,	%i7
loop_2354:
	te	%icc,	0x5
	edge16ln	%l0,	%o3,	%o4
	taddcc	%l3,	0x1A97,	%l1
	movvc	%xcc,	%o0,	%l6
	movg	%icc,	%g4,	%g7
	fmovdne	%icc,	%f14,	%f20
	fxor	%f4,	%f8,	%f22
	bcc,a	%xcc,	loop_2355
	sdivx	%i6,	0x0E63,	%o6
	sdivcc	%i2,	0x1B82,	%i4
	fbl	%fcc2,	loop_2356
loop_2355:
	movle	%icc,	%g1,	%o1
	add	%l7,	0x20,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%o2
	casxa	[%l6] 0x89,	%o2,	%l5
loop_2356:
	movne	%icc,	%o5,	%i0
	popc	%l4,	%g2
	subccc	%g6,	0x1291,	%i1
	edge16n	%l2,	%o7,	%g5
	sdiv	%i5,	0x0739,	%g3
	smulcc	%i7,	0x18B6,	%i3
	fmovsleu	%xcc,	%f21,	%f20
	fpadd32s	%f11,	%f23,	%f0
	alignaddrl	%o3,	%o4,	%l0
	fmuld8ulx16	%f16,	%f3,	%f20
	fmul8x16al	%f21,	%f7,	%f30
	alignaddr	%l3,	%l1,	%o0
	fmovsne	%xcc,	%f3,	%f20
	movl	%xcc,	%g4,	%l6
	nop
	fitos	%f9,	%f27
	fstox	%f27,	%f4
	wr	%g0,	0x81,	%asi
	stxa	%i6,	[%l7 + 0x70] %asi
	call	loop_2357
	sdivcc	%g7,	0x00C4,	%i2
	tle	%icc,	0x4
	smul	%o6,	0x0AEB,	%g1
loop_2357:
	bcc,a,pt	%icc,	loop_2358
	nop
	fitod	%f12,	%f14
	fdtos	%f14,	%f4
	movcc	%xcc,	%o1,	%o2
	fors	%f17,	%f2,	%f22
loop_2358:
	brz	%l5,	loop_2359
	brz	%i4,	loop_2360
	ldd	[%l7 + 0x28],	%o4
	nop
	setx	0x7A04F0DB,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f19
	fsqrts	%f19,	%f22
loop_2359:
	fmovdpos	%icc,	%f7,	%f15
loop_2360:
	fpadd16s	%f22,	%f15,	%f13
	fmovsneg	%xcc,	%f29,	%f19
	srlx	%l4,	%g2,	%i0
	tvs	%xcc,	0x0
	edge16l	%g6,	%i1,	%o7
	fbe,a	%fcc1,	loop_2361
	andn	%l2,	0x13B7,	%g5
	mulx	%i5,	0x0D05,	%i7
	movrne	%g3,	%o3,	%i3
loop_2361:
	fmovda	%icc,	%f31,	%f31
	lduw	[%l7 + 0x24],	%l0
	sllx	%o4,	0x1D,	%l1
	ble,a,pn	%xcc,	loop_2362
	nop
	fitod	%f10,	%f24
	fdtoi	%f24,	%f1
	tcs	%xcc,	0x3
	brgz,a	%o0,	loop_2363
loop_2362:
	nop
	setx	0xC586CFC88BE4F36D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	fsqrtd	%f20,	%f6
	sdiv	%l3,	0x111A,	%l6
	bne,pt	%icc,	loop_2364
loop_2363:
	edge8ln	%i6,	%g4,	%g7
	array32	%o6,	%g1,	%o1
	sll	%i2,	0x08,	%l5
loop_2364:
	fbl	%fcc1,	loop_2365
	fbne,a	%fcc0,	loop_2366
	edge16ln	%i4,	%o2,	%l4
	fsrc2	%f20,	%f4
loop_2365:
	fmovdne	%icc,	%f5,	%f6
loop_2366:
	bg	%xcc,	loop_2367
	edge16n	%o5,	%g2,	%i0
	fnot2	%f10,	%f0
	xnor	%g6,	%i1,	%o7
loop_2367:
	tne	%xcc,	0x7
	tpos	%xcc,	0x5
	fbul,a	%fcc2,	loop_2368
	taddcc	%l2,	0x009E,	%g5
	movrgez	%i7,	0x2DE,	%g3
	movl	%xcc,	%i5,	%o3
loop_2368:
	fpack16	%f18,	%f9
	fpadd16s	%f27,	%f13,	%f31
	add	%l0,	%i3,	%l1
	nop
	fitos	%f4,	%f27
	fstod	%f27,	%f16
	tsubcc	%o0,	0x02B6,	%l3
	edge16	%l6,	%o4,	%g4
	ldsh	[%l7 + 0x2E],	%i6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movvc	%xcc,	%g7,	%o6
	fone	%f30
	subcc	%g1,	%i2,	%o1
	movleu	%icc,	%i4,	%o2
	fnand	%f16,	%f16,	%f30
	xor	%l4,	0x1E21,	%o5
	movg	%xcc,	%g2,	%l5
	andncc	%i0,	%g6,	%o7
	edge16	%l2,	%i1,	%g5
	fpack16	%f2,	%f1
	fmovse	%icc,	%f15,	%f5
	fmul8x16	%f2,	%f16,	%f8
	movvs	%xcc,	%g3,	%i5
	udivcc	%o3,	0x08DB,	%l0
	tsubcctv	%i7,	0x07B1,	%l1
	smul	%o0,	%i3,	%l3
	set	0x3C, %o7
	lduwa	[%l7 + %o7] 0x19,	%o4
	tleu	%icc,	0x3
	tvc	%icc,	0x1
	fcmpeq16	%f4,	%f22,	%l6
	ldsw	[%l7 + 0x08],	%g4
	edge8l	%g7,	%i6,	%o6
	nop
	setx	0xA04EAAAA,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%fsr
	tn	%xcc,	0x2
	tl	%icc,	0x2
	movgu	%xcc,	%i2,	%o1
	udivx	%i4,	0x0E58,	%o2
	fbu	%fcc0,	loop_2369
	movrgz	%g1,	%o5,	%g2
	fba	%fcc2,	loop_2370
	fmovrdlz	%l4,	%f22,	%f14
loop_2369:
	brz	%l5,	loop_2371
	ldstub	[%l7 + 0x63],	%i0
loop_2370:
	edge16n	%o7,	%l2,	%i1
	edge8	%g5,	%g6,	%g3
loop_2371:
	udiv	%i5,	0x1E30,	%l0
	be,a,pn	%icc,	loop_2372
	tvs	%icc,	0x2
	sllx	%o3,	0x16,	%l1
	tge	%xcc,	0x5
loop_2372:
	membar	0x56
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16l	%i7,	%i3,	%l3
	fandnot2	%f18,	%f24,	%f8
	andn	%o4,	0x1988,	%o0
	sll	%l6,	%g4,	%i6
	tge	%icc,	0x3
	fmovsn	%xcc,	%f6,	%f28
	alignaddrl	%g7,	%o6,	%o1
	ldsb	[%l7 + 0x50],	%i4
	taddcctv	%i2,	%o2,	%o5
	movcs	%icc,	%g1,	%l4
	tle	%icc,	0x4
	tle	%icc,	0x4
	brz,a	%g2,	loop_2373
	edge16n	%l5,	%o7,	%i0
	fbo,a	%fcc1,	loop_2374
	srax	%i1,	0x13,	%l2
loop_2373:
	fmovsleu	%xcc,	%f7,	%f13
	nop
	setx	0xEFD842C91EF44CC6,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	fsqrtd	%f8,	%f24
loop_2374:
	nop
	fitod	%f4,	%f6
	fdtoi	%f6,	%f31
	movleu	%icc,	%g5,	%g3
	mova	%xcc,	%i5,	%g6
	tvs	%icc,	0x7
	subcc	%l0,	%l1,	%i7
	sra	%i3,	%o3,	%o4
	tneg	%icc,	0x1
	tvc	%icc,	0x1
	fnands	%f5,	%f4,	%f28
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	setx	0x043C391D,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f27
	setx	0xFA578B5F,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f1
	fsubs	%f1,	%f27,	%f11
	bne	loop_2375
	sir	0x12F9
	movg	%xcc,	%l3,	%l6
	taddcctv	%g4,	%o0,	%i6
loop_2375:
	tneg	%xcc,	0x6
	stx	%g7,	[%l7 + 0x38]
	fbne	%fcc3,	loop_2376
	tleu	%icc,	0x7
	tvc	%xcc,	0x5
	fbo	%fcc0,	loop_2377
loop_2376:
	movne	%icc,	%o6,	%i4
	alignaddr	%i2,	%o2,	%o1
	edge16n	%o5,	%g1,	%g2
loop_2377:
	andn	%l5,	%l4,	%o7
	sdiv	%i1,	0x0C43,	%i0
	nop
	set	0x70, %i0
	ldd	[%l7 + %i0],	%g4
	udivx	%g3,	0x1899,	%i5
	array32	%l2,	%g6,	%l0
	fmovdpos	%icc,	%f12,	%f24
	nop
	setx	0xC2453E30,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f3
	fsqrts	%f3,	%f16
	movle	%icc,	%l1,	%i7
	orn	%o3,	%o4,	%i3
	bpos,a	%xcc,	loop_2378
	edge32l	%l3,	%g4,	%l6
	tge	%xcc,	0x3
	fnors	%f15,	%f1,	%f12
loop_2378:
	lduw	[%l7 + 0x74],	%o0
	fone	%f20
	sllx	%i6,	0x1E,	%o6
	xnorcc	%g7,	0x0278,	%i4
	fbe,a	%fcc0,	loop_2379
	tn	%icc,	0x4
	prefetch	[%l7 + 0x58],	 0x3
	sdivx	%o2,	0x0E35,	%i2
loop_2379:
	tpos	%icc,	0x4
	nop
	fitos	%f19,	%f14
	set	0x40, %l5
	stda	%f0,	[%l7 + %l5] 0x10
	brz	%o5,	loop_2380
	fornot1	%f30,	%f26,	%f8
	sdiv	%o1,	0x0F47,	%g1
	popc	%g2,	%l5
loop_2380:
	andcc	%o7,	%l4,	%i1
	set	0x70, %o3
	ldsba	[%l7 + %o3] 0x11,	%g5
	fba,a	%fcc2,	loop_2381
	fble	%fcc0,	loop_2382
	te	%icc,	0x2
	tpos	%icc,	0x5
loop_2381:
	nop
	fitos	%f10,	%f12
	fstoi	%f12,	%f25
loop_2382:
	orcc	%i0,	0x0C8C,	%g3
	addccc	%i5,	0x1BE4,	%l2
	movcc	%icc,	%g6,	%l1
	nop
	fitos	%f31,	%f30
	fbe	%fcc2,	loop_2383
	fbul,a	%fcc1,	loop_2384
	fmovdleu	%icc,	%f12,	%f24
	ldd	[%l7 + 0x40],	%l0
loop_2383:
	fand	%f24,	%f8,	%f26
loop_2384:
	st	%f13,	[%l7 + 0x28]
	orn	%o3,	0x137A,	%o4
	udiv	%i3,	0x13D9,	%l3
	ldsb	[%l7 + 0x16],	%g4
	tleu	%xcc,	0x1
	umul	%l6,	0x1FC5,	%o0
	for	%f30,	%f4,	%f10
	bvc,pt	%icc,	loop_2385
	edge32ln	%i7,	%o6,	%g7
	ldx	[%l7 + 0x58],	%i4
	ldsh	[%l7 + 0x44],	%i6
loop_2385:
	nop
	set	0x34, %g7
	lduha	[%l7 + %g7] 0x89,	%o2
	add	%l7,	0x70,	%l6
	wr	%g0,	0x0c,	%asi
	ldxa	[%l6] %asi,	%o5
	casxa	[%l6] 0x0c,	%o5,	%i2
	subc	%o1,	%g2,	%g1
	ld	[%l7 + 0x30],	%f26
	sethi	0x0330,	%o7
	edge32ln	%l5,	%i1,	%g5
	array8	%l4,	%i0,	%i5
	ldd	[%l7 + 0x60],	%f18
	sdiv	%g3,	0x1899,	%l2
	pdist	%f8,	%f0,	%f24
	nop
	fitod	%f0,	%f18
	fdtoi	%f18,	%f5
	movre	%g6,	%l1,	%l0
	bge,a,pt	%icc,	loop_2386
	edge32ln	%o4,	%i3,	%l3
	tle	%xcc,	0x7
	tpos	%xcc,	0x3
loop_2386:
	fones	%f22
	orcc	%g4,	0x0822,	%o3
	array8	%o0,	%l6,	%i7
	brnz	%o6,	loop_2387
	fmovrsgez	%i4,	%f13,	%f8
	movge	%icc,	%i6,	%o2
	xnor	%g7,	0x0318,	%o5
loop_2387:
	nop
	set	0x37, %i1
	ldsba	[%l7 + %i1] 0x80,	%o1
	fmovdneg	%icc,	%f1,	%f25
	fbu,a	%fcc1,	loop_2388
	srl	%g2,	0x16,	%g1
	movcc	%icc,	%i2,	%o7
	nop
	setx	0x23024BF1107F839A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x08]
	ldx	[%l7 + 0x08],	%fsr
loop_2388:
	edge8	%i1,	%l5,	%l4
	fmovse	%xcc,	%f23,	%f27
	fble,a	%fcc2,	loop_2389
	fpackfix	%f4,	%f26
	add	%l7,	0x50,	%l6
	wr	%g0,	0x0c,	%asi
	ldxa	[%l6] %asi,	%i0
	casxa	[%l6] 0x0c,	%i0,	%g5
loop_2389:
	nop
	setx	0xE5EC0C0BE05A79AB,	%l0,	%l6
	stx	%l6,	[%l7 + 0x70]
	ldx	[%l7 + 0x70],	%fsr
	edge8ln	%g3,	%i5,	%l2
	movleu	%icc,	%l1,	%l0
	edge8ln	%o4,	%i3,	%g6
	fmovdn	%icc,	%f25,	%f16
	movgu	%xcc,	%g4,	%l3
	fmovrse	%o0,	%f7,	%f9
	fmul8sux16	%f10,	%f8,	%f20
	tn	%xcc,	0x7
	movneg	%icc,	%o3,	%l6
	ta	%icc,	0x5
	nop
	setx	loop_2390,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	ldub	[%l7 + 0x7E],	%o6
	fbl	%fcc1,	loop_2391
	move	%icc,	%i7,	%i4
loop_2390:
	nop
	setx	0x65ED9614,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f23
	fsqrts	%f23,	%f19
	set	0x6E, %i3
	ldsha	[%l7 + %i3] 0x10,	%o2
loop_2391:
	movvs	%icc,	%g7,	%i6
	wr	%g0,	0x89,	%asi
	prefetcha	[%l7 + 0x70] %asi,	 0x3
	movleu	%icc,	%o1,	%g1
	orcc	%i2,	0x168C,	%g2
	wr	%g0,	0x18,	%asi
	lduba	[%l7 + 0x4F] %asi,	%i1
	smulcc	%o7,	%l4,	%l5
	brgz	%i0,	loop_2392
	st	%f1,	[%l7 + 0x14]
	taddcc	%g5,	%g3,	%i5
	fbge,a	%fcc3,	loop_2393
loop_2392:
	move	%xcc,	%l2,	%l1
	wr	%g0,	0x27,	%asi
	stha	%l0,	[%l7 + 0x74] %asi
	membar	#Sync
loop_2393:
	fmovrdlez	%o4,	%f0,	%f30
	sir	0x1A2D
	edge8	%i3,	%g6,	%l3
	fbg	%fcc0,	loop_2394
	tge	%xcc,	0x4
	bpos,a,pn	%xcc,	loop_2395
	fmuld8sux16	%f0,	%f6,	%f0
loop_2394:
	fbule	%fcc3,	loop_2396
	fbge,a	%fcc3,	loop_2397
loop_2395:
	fmovsg	%xcc,	%f21,	%f17
	ba	loop_2398
loop_2396:
	tpos	%xcc,	0x7
loop_2397:
	fandnot2s	%f29,	%f25,	%f6
	movg	%icc,	%g4,	%o0
loop_2398:
	fba	%fcc2,	loop_2399
	movg	%xcc,	%l6,	%o6
	fandnot1s	%f3,	%f15,	%f29
	sll	%i7,	0x1E,	%o3
loop_2399:
	sllx	%o2,	%g7,	%i6
	fbne	%fcc3,	loop_2400
	bge,a,pt	%xcc,	loop_2401
	addc	%i4,	%o1,	%o5
	tne	%xcc,	0x5
loop_2400:
	addcc	%i2,	0x17DC,	%g1
loop_2401:
	array16	%i1,	%o7,	%l4
	add	%l7,	0x70,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] %asi,	%l5,	%i0
	tgu	%xcc,	0x0
	tle	%icc,	0x4
	lduw	[%l7 + 0x40],	%g2
	fandnot2s	%f1,	%f31,	%f12
	bl,a,pn	%xcc,	loop_2402
	edge16	%g5,	%i5,	%g3
	wr	%g0,	0x89,	%asi
	lduha	[%l7 + 0x2E] %asi,	%l2
loop_2402:
	addccc	%l1,	0x0848,	%l0
	ldsh	[%l7 + 0x40],	%o4
	fbne,a	%fcc1,	loop_2403
	fsrc1	%f30,	%f18
	stw	%g6,	[%l7 + 0x08]
	fpsub16	%f8,	%f6,	%f14
loop_2403:
	sll	%i3,	0x0A,	%g4
	sdiv	%o0,	0x083A,	%l3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tn	%icc,	0x1
	edge8l	%l6,	%o6,	%i7
	movl	%icc,	%o2,	%g7
	fpsub32	%f8,	%f10,	%f24
	fble,a	%fcc2,	loop_2404
	udiv	%o3,	0x1679,	%i4
	fpsub16	%f26,	%f10,	%f22
	edge8ln	%i6,	%o5,	%o1
loop_2404:
	mova	%icc,	%i2,	%i1
	tleu	%icc,	0x6
	fmovsvs	%xcc,	%f27,	%f5
	sllx	%o7,	%l4,	%g1
	andcc	%l5,	%i0,	%g2
	popc	%g5,	%g3
	addcc	%l2,	%i5,	%l0
	sdivcc	%l1,	0x0941,	%o4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fblg,a	%fcc1,	loop_2405
	movcc	%icc,	%g6,	%g4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andncc	%o0,	%l3,	%i3
loop_2405:
	bleu,a	loop_2406
	tcc	%icc,	0x2
	sethi	0x1CE3,	%o6
	wr	%g0,	0x81,	%asi
	ldsha	[%l7 + 0x34] %asi,	%i7
loop_2406:
	movrlez	%o2,	0x3F1,	%g7
	sdivcc	%o3,	0x12F1,	%l6
	orn	%i6,	%i4,	%o1
	edge16	%i2,	%i1,	%o5
	ld	[%l7 + 0x68],	%f16
	sir	0x0302
	edge32l	%l4,	%g1,	%o7
	sdivx	%i0,	0x1EAC,	%l5
	set	0x40, %l6
	stda	%f16,	[%l7 + %l6] 0x14
	fmovdneg	%icc,	%f11,	%f10
	fbg,a	%fcc0,	loop_2407
	fornot2	%f26,	%f30,	%f22
	ldd	[%l7 + 0x78],	%f0
	sllx	%g2,	%g3,	%g5
loop_2407:
	movcc	%xcc,	%l2,	%i5
	alignaddrl	%l0,	%l1,	%g6
	move	%xcc,	%g4,	%o4
	set	0x2C, %l4
	stwa	%o0,	[%l7 + %l4] 0xea
	membar	#Sync
	edge32l	%l3,	%i3,	%o6
	movcs	%icc,	%o2,	%g7
	fbue,a	%fcc2,	loop_2408
	and	%o3,	%l6,	%i6
	sra	%i7,	%o1,	%i4
	mulx	%i2,	%i1,	%l4
loop_2408:
	edge32l	%o5,	%o7,	%g1
	movneg	%xcc,	%l5,	%g2
	fmovsgu	%icc,	%f15,	%f13
	taddcctv	%g3,	0x1D34,	%i0
	fnors	%f12,	%f23,	%f9
	fmovrsgez	%g5,	%f29,	%f18
	movrlez	%l2,	%l0,	%l1
	fmovda	%icc,	%f31,	%f22
	fmovrdlez	%i5,	%f20,	%f6
	tneg	%icc,	0x3
	fpadd32	%f28,	%f18,	%f8
	nop
	setx	0xCD8BE971,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f23
	setx	0x4F2FAE53,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f29
	fdivs	%f29,	%f23,	%f4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fsrc1	%f0,	%f24
	tg	%icc,	0x0
	set	0x40, %l0
	stxa	%g6,	[%l7 + %l0] 0x10
	fcmpeq32	%f14,	%f30,	%o4
	nop
	setx	0xF94D9ADE,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f20
	setx	0x249135E2,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f15
	fadds	%f15,	%f20,	%f18
	orcc	%g4,	0x009D,	%o0
	sra	%l3,	%i3,	%o2
	movne	%icc,	%g7,	%o3
	tcc	%xcc,	0x4
	fzeros	%f5
	fmovdle	%xcc,	%f21,	%f13
	mova	%icc,	%l6,	%i6
	tpos	%xcc,	0x2
	tn	%icc,	0x3
	wr	%g0,	0x80,	%asi
	stha	%o6,	[%l7 + 0x52] %asi
	fmovrde	%o1,	%f0,	%f20
	edge16n	%i4,	%i7,	%i1
	swap	[%l7 + 0x34],	%l4
	sir	0x0226
	tneg	%icc,	0x5
	tge	%icc,	0x6
	xnorcc	%o5,	0x17DF,	%o7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x44, %g4
	ldswa	[%l7 + %g4] 0x18,	%i2
	fbge,a	%fcc3,	loop_2409
	fmul8sux16	%f30,	%f14,	%f2
	tneg	%icc,	0x1
	tpos	%icc,	0x2
loop_2409:
	fmovdneg	%xcc,	%f2,	%f5
	fbug,a	%fcc2,	loop_2410
	umulcc	%g1,	0x1717,	%l5
	taddcctv	%g2,	0x1A60,	%i0
	movvs	%xcc,	%g5,	%g3
loop_2410:
	te	%xcc,	0x7
	te	%xcc,	0x7
	andn	%l2,	%l0,	%l1
	fmovscs	%icc,	%f19,	%f14
	sir	0x10E7
	flush	%l7 + 0x58
	or	%i5,	0x1741,	%g6
	movneg	%xcc,	%g4,	%o4
	fmovs	%f9,	%f23
	fbo,a	%fcc0,	loop_2411
	bg,a,pn	%icc,	loop_2412
	brlez,a	%o0,	loop_2413
	movcc	%icc,	%i3,	%l3
loop_2411:
	sdiv	%g7,	0x125F,	%o3
loop_2412:
	movvs	%icc,	%o2,	%l6
loop_2413:
	edge8n	%i6,	%o1,	%i4
	fmovrdlz	%i7,	%f24,	%f30
	movg	%icc,	%o6,	%i1
	ldsw	[%l7 + 0x3C],	%l4
	srax	%o7,	0x19,	%i2
	fbu	%fcc3,	loop_2414
	ld	[%l7 + 0x54],	%f27
	tsubcc	%g1,	0x0B79,	%o5
	fmovse	%icc,	%f18,	%f21
loop_2414:
	nop
	set	0x3F, %i5
	stba	%l5,	[%l7 + %i5] 0xe3
	membar	#Sync
	tpos	%icc,	0x6
	addcc	%g2,	%g5,	%g3
	for	%f6,	%f8,	%f14
	xnorcc	%i0,	0x07FD,	%l2
	tn	%xcc,	0x4
	fbul	%fcc2,	loop_2415
	ldstub	[%l7 + 0x56],	%l0
	brlez,a	%i5,	loop_2416
	fbg,a	%fcc0,	loop_2417
loop_2415:
	fcmpne32	%f20,	%f0,	%g6
	andncc	%l1,	%o4,	%g4
loop_2416:
	fcmple32	%f10,	%f2,	%i3
loop_2417:
	movre	%o0,	%g7,	%l3
	movl	%xcc,	%o3,	%o2
	array32	%l6,	%o1,	%i6
	movl	%icc,	%i7,	%i4
	movrgez	%i1,	0x159,	%l4
	edge32ln	%o6,	%o7,	%i2
	array32	%o5,	%g1,	%l5
	bleu,pn	%icc,	loop_2418
	movre	%g2,	%g5,	%i0
	or	%g3,	0x037C,	%l2
	smul	%l0,	0x0174,	%g6
loop_2418:
	nop
	wr	%g0,	0x80,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	set	0x20, %i2
	lduba	[%l7 + %i2] 0x89,	%l1
	tn	%icc,	0x3
	xnor	%o4,	0x08A8,	%i5
	array8	%i3,	%o0,	%g7
	umul	%l3,	0x074C,	%g4
	movrlez	%o3,	0x3C8,	%l6
	brgez	%o1,	loop_2419
	fmovrslez	%i6,	%f3,	%f8
	tsubcctv	%o2,	0x1090,	%i7
	stbar
loop_2419:
	nop
	wr	%g0,	0x88,	%asi
	ldsba	[%l7 + 0x41] %asi,	%i1
	movrlz	%l4,	%o6,	%i4
	tvs	%icc,	0x1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	be,a	loop_2420
	fzero	%f20
	taddcc	%i2,	%o5,	%g1
	fbn,a	%fcc0,	loop_2421
loop_2420:
	tleu	%xcc,	0x3
	xor	%l5,	%g2,	%g5
	edge8l	%o7,	%i0,	%g3
loop_2421:
	orcc	%l2,	0x1D03,	%g6
	edge16n	%l0,	%o4,	%i5
	fcmpgt16	%f22,	%f8,	%i3
	st	%f5,	[%l7 + 0x20]
	addccc	%l1,	0x053C,	%o0
	bvc,pn	%icc,	loop_2422
	fmuld8sux16	%f13,	%f26,	%f18
	alignaddr	%g7,	%g4,	%o3
	andn	%l3,	%l6,	%i6
loop_2422:
	orncc	%o2,	0x01AF,	%o1
	movg	%icc,	%i7,	%i1
	edge8l	%l4,	%o6,	%i4
	nop
	setx	0x7239567925A7D244,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0xD847FC7A81C038A1,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	fsubd	%f18,	%f10,	%f26
	move	%xcc,	%i2,	%o5
	tcs	%xcc,	0x1
	srl	%l5,	0x18,	%g2
	fpsub16	%f18,	%f30,	%f6
	tle	%icc,	0x4
	te	%icc,	0x2
	movvs	%xcc,	%g1,	%o7
	fmovsvs	%xcc,	%f23,	%f13
	addc	%g5,	%g3,	%l2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xor	%i0,	%l0,	%g6
	movcs	%xcc,	%i5,	%i3
	nop
	setx	loop_2423,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	edge32	%o4,	%o0,	%l1
	fmuld8sux16	%f30,	%f12,	%f30
	movle	%xcc,	%g4,	%o3
loop_2423:
	sll	%l3,	0x0C,	%l6
	sethi	0x0182,	%i6
	bcc,a	%xcc,	loop_2424
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	brgz	%g7,	loop_2425
	alignaddrl	%o2,	%o1,	%i7
loop_2424:
	mulscc	%i1,	%o6,	%i4
	fmovdl	%icc,	%f30,	%f12
loop_2425:
	stx	%i2,	[%l7 + 0x20]
	sethi	0x0CB0,	%o5
	edge16	%l4,	%g2,	%g1
	lduh	[%l7 + 0x6A],	%l5
	fmovdvc	%icc,	%f17,	%f17
	taddcctv	%o7,	0x12E8,	%g3
	subcc	%l2,	%g5,	%i0
	fpadd16	%f24,	%f24,	%f20
	subc	%g6,	0x0D55,	%l0
	sdiv	%i5,	0x059A,	%i3
	tge	%xcc,	0x0
	fpadd16	%f28,	%f6,	%f16
	tneg	%icc,	0x5
	srlx	%o4,	%l1,	%g4
	umulcc	%o3,	0x19B4,	%l3
	movpos	%icc,	%o0,	%i6
	movn	%xcc,	%l6,	%g7
	srl	%o1,	%i7,	%i1
	orcc	%o6,	0x05C6,	%i4
	movcc	%icc,	%i2,	%o5
	ta	%xcc,	0x1
	addcc	%o2,	0x0F22,	%l4
	movpos	%xcc,	%g1,	%g2
	lduh	[%l7 + 0x64],	%l5
	fpadd32s	%f10,	%f0,	%f10
	tne	%xcc,	0x0
	wr	%g0,	0x81,	%asi
	stha	%o7,	[%l7 + 0x70] %asi
	sllx	%l2,	%g3,	%i0
	fmovsleu	%xcc,	%f15,	%f12
	array8	%g5,	%g6,	%l0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16	%i3,	%o4,	%i5
	addcc	%l1,	%o3,	%l3
	edge16ln	%o0,	%g4,	%l6
	mulscc	%g7,	0x1E39,	%o1
	fxors	%f13,	%f10,	%f19
	fmovrdne	%i6,	%f28,	%f8
	nop
	setx	0x3F33347C,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f30
	setx	0xE6EE0608,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f30
	fdivs	%f30,	%f30,	%f11
	tne	%icc,	0x3
	smul	%i1,	0x1914,	%i7
	xnorcc	%i4,	0x149D,	%i2
	sdivx	%o6,	0x15B8,	%o2
	alignaddr	%o5,	%g1,	%l4
	alignaddr	%l5,	%o7,	%g2
	fmovsge	%xcc,	%f21,	%f24
	nop
	setx	loop_2426,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	edge16l	%g3,	%i0,	%g5
	nop
	setx	0xB06F69563451AD0D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	fsqrtd	%f2,	%f24
	andcc	%g6,	%l2,	%i3
loop_2426:
	nop
	set	0x68, %o4
	stba	%l0,	[%l7 + %o4] 0x2f
	membar	#Sync
	xorcc	%o4,	%i5,	%o3
	stbar
	fmovdn	%icc,	%f30,	%f13
	tne	%icc,	0x6
	array32	%l3,	%o0,	%g4
	bleu,pt	%xcc,	loop_2427
	movrgz	%l6,	%l1,	%g7
	prefetch	[%l7 + 0x08],	 0x3
	fbne,a	%fcc3,	loop_2428
loop_2427:
	andncc	%o1,	%i1,	%i6
	and	%i4,	%i7,	%o6
	fmul8x16au	%f11,	%f11,	%f22
loop_2428:
	smul	%o2,	%i2,	%o5
	movcs	%icc,	%g1,	%l4
	edge8n	%l5,	%o7,	%g2
	fble	%fcc2,	loop_2429
	bvc,a	%icc,	loop_2430
	xnor	%g3,	%g5,	%i0
	movcs	%icc,	%g6,	%l2
loop_2429:
	array32	%l0,	%o4,	%i3
loop_2430:
	bleu,a	%icc,	loop_2431
	edge32l	%i5,	%o3,	%l3
	movl	%icc,	%o0,	%l6
	edge32	%l1,	%g4,	%g7
loop_2431:
	tl	%icc,	0x4
	movn	%xcc,	%i1,	%o1
	bleu,a	loop_2432
	subcc	%i4,	%i7,	%o6
	movn	%icc,	%o2,	%i2
	sra	%o5,	%i6,	%g1
loop_2432:
	nop
	wr	%g0,	0x89,	%asi
	ldsha	[%l7 + 0x56] %asi,	%l4
	wr	%g0,	0x18,	%asi
	sta	%f12,	[%l7 + 0x58] %asi
	brlz	%l5,	loop_2433
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpsub32	%f16,	%f18,	%f0
	edge32l	%g2,	%g3,	%g5
loop_2433:
	stb	%o7,	[%l7 + 0x19]
	sub	%i0,	%g6,	%l2
	movg	%icc,	%o4,	%i3
	ba	loop_2434
	edge32l	%i5,	%o3,	%l3
	add	%l7,	0x10,	%l6
	wr	%g0,	0x0c,	%asi
	casa	[%l6] %asi,	%l0,	%o0
loop_2434:
	tvc	%icc,	0x3
	set	0x2E, %i6
	ldsba	[%l7 + %i6] 0x18,	%l6
	nop
	setx	0xBA1D410C09D1866D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	fsqrtd	%f24,	%f10
	bl,a,pn	%xcc,	loop_2435
	movcc	%icc,	%g4,	%g7
	fmovsvc	%xcc,	%f19,	%f6
	edge32ln	%i1,	%l1,	%i4
loop_2435:
	sra	%i7,	0x1F,	%o1
	tn	%xcc,	0x7
	edge8n	%o2,	%o6,	%o5
	fmovrsne	%i2,	%f8,	%f27
	andn	%i6,	%l4,	%g1
	array16	%l5,	%g3,	%g5
	orcc	%o7,	%g2,	%i0
	fabss	%f23,	%f2
	movrne	%l2,	0x18D,	%g6
	alignaddr	%o4,	%i5,	%i3
	sra	%o3,	0x1F,	%l0
	ldx	[%l7 + 0x50],	%l3
	andn	%o0,	0x0044,	%l6
	sll	%g7,	%i1,	%g4
	fcmple32	%f6,	%f20,	%i4
	subcc	%i7,	0x0E66,	%o1
	fpsub32	%f22,	%f2,	%f20
	edge8l	%o2,	%l1,	%o6
	edge32ln	%o5,	%i6,	%i2
	movne	%xcc,	%g1,	%l5
	fsrc1s	%f2,	%f30
	fmovspos	%icc,	%f20,	%f4
	nop
	setx	0x66CBB4E6,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f10
	setx	0x78DE377A,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f5
	fsubs	%f5,	%f10,	%f9
	fmovdvs	%xcc,	%f12,	%f31
	movne	%xcc,	%l4,	%g3
	tneg	%xcc,	0x3
	st	%f9,	[%l7 + 0x34]
	edge16n	%o7,	%g2,	%i0
	edge8l	%g5,	%l2,	%o4
	taddcctv	%i5,	%i3,	%o3
	wr	%g0,	0x10,	%asi
	lduwa	[%l7 + 0x10] %asi,	%l0
	tl	%xcc,	0x1
	ldd	[%l7 + 0x70],	%g6
	sdivcc	%l3,	0x1E1B,	%l6
	bshuffle	%f12,	%f30,	%f24
	tcc	%icc,	0x5
	array8	%o0,	%i1,	%g7
	andn	%i4,	0x1B3F,	%g4
	alignaddr	%o1,	%o2,	%i7
	movrgz	%o6,	%o5,	%l1
	movle	%xcc,	%i6,	%i2
	movgu	%icc,	%l5,	%g1
	be	%icc,	loop_2436
	move	%icc,	%g3,	%l4
	ldd	[%l7 + 0x30],	%g2
	xorcc	%o7,	0x0C2C,	%i0
loop_2436:
	ta	%icc,	0x2
	prefetch	[%l7 + 0x40],	 0x2
	stw	%g5,	[%l7 + 0x70]
	fpadd32	%f18,	%f12,	%f10
	brz,a	%l2,	loop_2437
	tn	%xcc,	0x0
	edge8l	%i5,	%i3,	%o4
	nop
	setx	0xB2236ED68B6A0653,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0xE02E806D79EE2BD1,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	fsubd	%f8,	%f12,	%f8
loop_2437:
	tg	%icc,	0x4
	brlez	%l0,	loop_2438
	sdivcc	%o3,	0x1CD9,	%l3
	mulx	%g6,	%l6,	%i1
	bvs,pn	%icc,	loop_2439
loop_2438:
	fnand	%f14,	%f0,	%f0
	fbo	%fcc3,	loop_2440
	movne	%icc,	%o0,	%i4
loop_2439:
	orn	%g4,	%g7,	%o1
	tl	%icc,	0x6
loop_2440:
	movrne	%o2,	%i7,	%o5
	edge16l	%l1,	%o6,	%i6
	fblg,a	%fcc2,	loop_2441
	nop
	setx	loop_2442,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	edge32ln	%l5,	%i2,	%g3
	nop
	setx	0xD0797415,	%l0,	%l6
	st	%l6,	[%l7 + 0x48]
	ld	[%l7 + 0x48],	%fsr
loop_2441:
	movrne	%l4,	%g1,	%o7
loop_2442:
	movge	%xcc,	%i0,	%g2
	fmovse	%xcc,	%f2,	%f19
	faligndata	%f14,	%f0,	%f18
	sll	%l2,	%i5,	%i3
	andn	%g5,	0x01C9,	%l0
	movrgz	%o3,	%o4,	%g6
	movleu	%icc,	%l3,	%i1
	fsrc1s	%f22,	%f18
	ld	[%l7 + 0x10],	%f7
	subc	%l6,	0x1AFA,	%i4
	popc	0x0729,	%g4
	edge16ln	%o0,	%o1,	%o2
	ldx	[%l7 + 0x10],	%g7
	fpsub16s	%f19,	%f17,	%f6
	nop
	setx	0x5051E3B3,	%l0,	%l6
	st	%l6,	[%l7 + 0x24]
	ld	[%l7 + 0x24],	%fsr
	fpadd16	%f10,	%f12,	%f12
	tsubcctv	%i7,	0x1E00,	%o5
	addccc	%l1,	0x1A08,	%i6
	nop
	set	0x38, %o5
	prefetch	[%l7 + %o5],	 0x3
	sdiv	%l5,	0x1155,	%o6
	nop
	setx loop_2443, %l0, %l1
	jmpl %l1, %i2
	nop
	setx	loop_2444,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	sub	%l4,	0x182C,	%g1
	st	%f10,	[%l7 + 0x0C]
loop_2443:
	nop
	add	%l7,	0x10,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%o7
	casa	[%l6] 0x80,	%o7,	%g3
loop_2444:
	nop
	fitod	%f4,	%f18
	fdtox	%f18,	%f18
	fxtod	%f18,	%f2
	udivx	%i0,	0x025B,	%g2
	sll	%l2,	%i3,	%g5
	udivx	%l0,	0x0F8D,	%o3
	tsubcctv	%i5,	%g6,	%l3
	set	0x5C, %g6
	lda	[%l7 + %g6] 0x89,	%f13
	fbule	%fcc1,	loop_2445
	fmovsgu	%icc,	%f5,	%f31
	fcmpne32	%f14,	%f8,	%i1
	fnegs	%f30,	%f26
loop_2445:
	fand	%f16,	%f26,	%f28
	tge	%xcc,	0x1
	set	0x50, %i4
	ldda	[%l7 + %i4] 0x88,	%i6
	edge32ln	%i4,	%g4,	%o4
	tvs	%xcc,	0x5
	nop
	fitos	%f5,	%f7
	edge16l	%o1,	%o2,	%g7
	fnot1s	%f22,	%f13
	edge32	%i7,	%o0,	%o5
	movpos	%icc,	%l1,	%i6
	fors	%f27,	%f5,	%f29
	sethi	0x1F75,	%l5
	edge32l	%o6,	%i2,	%g1
	nop
	fitos	%f7,	%f19
	fstox	%f19,	%f12
	fxtos	%f12,	%f6
	andcc	%o7,	0x013B,	%l4
	nop
	setx	0x1D1410E5,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f29
	setx	0x5D8107A2,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f7
	fmuls	%f7,	%f29,	%f19
	sth	%i0,	[%l7 + 0x0A]
	faligndata	%f14,	%f2,	%f30
	edge32l	%g2,	%g3,	%i3
	fmovdl	%xcc,	%f13,	%f7
	bge,pn	%icc,	loop_2446
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fxnor	%f2,	%f12,	%f2
	mulscc	%g5,	%l2,	%o3
loop_2446:
	fmovrdlz	%l0,	%f30,	%f16
	edge32	%i5,	%g6,	%l3
	tl	%xcc,	0x2
	tne	%xcc,	0x1
	nop
	fitos	%f13,	%f4
	fstox	%f4,	%f14
	edge8ln	%i1,	%i4,	%g4
	ta	%icc,	0x3
	addc	%o4,	0x0418,	%o1
	movgu	%icc,	%l6,	%g7
	fpsub16	%f30,	%f0,	%f18
	fpadd16	%f24,	%f30,	%f28
	movcs	%xcc,	%o2,	%o0
	fmovdle	%icc,	%f1,	%f7
	tneg	%xcc,	0x6
	tcs	%xcc,	0x5
	sethi	0x1653,	%i7
	nop
	setx	0xB4223467907EC1B0,	%l0,	%l6
	stx	%l6,	[%l7 + 0x70]
	ldx	[%l7 + 0x70],	%fsr
	movne	%xcc,	%o5,	%l1
	wr	%g0,	0x27,	%asi
	stxa	%l5,	[%l7 + 0x10] %asi
	membar	#Sync
	subc	%i6,	%o6,	%g1
	fmovdne	%icc,	%f16,	%f3
	or	%i2,	0x0ACB,	%l4
	fmovdneg	%icc,	%f6,	%f14
	fmovsg	%xcc,	%f14,	%f9
	bvs,a	%xcc,	loop_2447
	tne	%xcc,	0x6
	tvs	%xcc,	0x4
	edge16l	%o7,	%i0,	%g3
loop_2447:
	edge8ln	%g2,	%i3,	%g5
	movne	%icc,	%l2,	%o3
	fmovd	%f2,	%f10
	sdivcc	%l0,	0x1C7B,	%i5
	ldd	[%l7 + 0x70],	%f12
	movneg	%xcc,	%l3,	%g6
	edge16	%i1,	%g4,	%i4
	nop
	setx	0x5A1DA335406FB689,	%l0,	%l6
	stx	%l6,	[%l7 + 0x70]
	ldx	[%l7 + 0x70],	%fsr
	fcmpgt32	%f4,	%f16,	%o1
	movvs	%xcc,	%o4,	%l6
	orncc	%g7,	0x1B10,	%o0
	tl	%xcc,	0x5
	tcc	%xcc,	0x2
	srlx	%i7,	%o5,	%o2
	sdivcc	%l1,	0x1F5E,	%l5
	bge	loop_2448
	subccc	%i6,	0x1FCD,	%g1
	srlx	%i2,	0x07,	%l4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2448:
	nop
	set	0x1C, %o6
	ldsw	[%l7 + %o6],	%o6
	subc	%o7,	0x07BA,	%g3
	andcc	%i0,	0x0F03,	%i3
	srlx	%g5,	%g2,	%l2
	tge	%icc,	0x7
	srl	%l0,	0x1B,	%i5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8	%o3,	%g6,	%i1
	fmovsleu	%xcc,	%f12,	%f2
	bge	%xcc,	loop_2449
	tg	%icc,	0x0
	popc	%l3,	%g4
	array16	%i4,	%o1,	%o4
loop_2449:
	nop
	setx	0x6467488B,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f17
	setx	0x233AF03C,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f16
	fdivs	%f16,	%f17,	%f5
	movcc	%icc,	%g7,	%o0
	addc	%l6,	%o5,	%o2
	fbn,a	%fcc1,	loop_2450
	fpmerge	%f3,	%f24,	%f12
	fmovrse	%l1,	%f13,	%f24
	fbuge	%fcc1,	loop_2451
loop_2450:
	ldsh	[%l7 + 0x5C],	%l5
	tgu	%xcc,	0x6
	set	0x28, %g3
	stha	%i6,	[%l7 + %g3] 0x23
	membar	#Sync
loop_2451:
	xnorcc	%i7,	%g1,	%l4
	xnorcc	%i2,	0x0B87,	%o6
	pdist	%f2,	%f10,	%f0
	bvs	loop_2452
	array8	%o7,	%g3,	%i0
	tne	%icc,	0x6
	alignaddr	%i3,	%g5,	%g2
loop_2452:
	tn	%xcc,	0x2
	st	%f17,	[%l7 + 0x24]
	tne	%icc,	0x1
	mova	%xcc,	%l0,	%i5
	fabsd	%f18,	%f8
	fmovdneg	%xcc,	%f11,	%f12
	nop
	setx	0x43BAD8AA,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f18
	setx	0x2DB72C8A,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f7
	fmuls	%f7,	%f18,	%f10
	alignaddr	%l2,	%g6,	%o3
	nop
	fitos	%f5,	%f7
	fstox	%f7,	%f18
	stw	%l3,	[%l7 + 0x74]
	bge,a,pn	%icc,	loop_2453
	fcmple32	%f14,	%f12,	%i1
	xnorcc	%g4,	%o1,	%o4
	srlx	%i4,	%o0,	%l6
loop_2453:
	movrlez	%g7,	%o5,	%o2
	edge16ln	%l1,	%l5,	%i7
	pdist	%f10,	%f12,	%f8
	edge32l	%i6,	%g1,	%l4
	edge8n	%i2,	%o6,	%g3
	fcmpeq16	%f30,	%f28,	%o7
	movrgez	%i0,	%i3,	%g2
	alignaddrl	%g5,	%i5,	%l0
	tsubcctv	%g6,	0x00EA,	%l2
	edge8ln	%o3,	%l3,	%g4
	edge8l	%o1,	%o4,	%i4
	bneg,pn	%icc,	loop_2454
	call	loop_2455
	umul	%i1,	%o0,	%g7
	sethi	0x1AA1,	%o5
loop_2454:
	ldsb	[%l7 + 0x1D],	%l6
loop_2455:
	sdivx	%l1,	0x0B34,	%o2
	fmovsvc	%xcc,	%f4,	%f18
	movrgez	%l5,	0x02D,	%i6
	fmovsa	%icc,	%f22,	%f6
	tgu	%xcc,	0x6
	tvc	%icc,	0x3
	move	%xcc,	%i7,	%g1
	fandnot1	%f30,	%f10,	%f8
	movcc	%xcc,	%l4,	%o6
	set	0x20, %g2
	ldsba	[%l7 + %g2] 0x0c,	%i2
	tsubcc	%o7,	%i0,	%i3
	udivcc	%g3,	0x006B,	%g2
	fmovrdgz	%i5,	%f30,	%f8
	bn,a,pt	%xcc,	loop_2456
	andn	%l0,	0x1EF3,	%g6
	membar	0x47
	set	0x40, %o1
	ldswa	[%l7 + %o1] 0x89,	%g5
loop_2456:
	movrlez	%o3,	0x21E,	%l2
	andn	%l3,	%o1,	%o4
	xnor	%g4,	0x0AF3,	%i1
	movl	%icc,	%i4,	%g7
	fpmerge	%f4,	%f27,	%f6
	movrne	%o5,	0x1E5,	%o0
	orn	%l6,	0x093B,	%l1
	bcs,a,pn	%icc,	loop_2457
	tneg	%icc,	0x6
	tl	%xcc,	0x2
	fxnor	%f14,	%f10,	%f28
loop_2457:
	subcc	%o2,	0x16FF,	%i6
	tge	%xcc,	0x5
	bvc,a,pn	%icc,	loop_2458
	sdivcc	%l5,	0x007D,	%i7
	xorcc	%g1,	%l4,	%o6
	fmovscc	%xcc,	%f27,	%f22
loop_2458:
	nop
	wr	%g0,	0xe3,	%asi
	stxa	%o7,	[%l7 + 0x48] %asi
	membar	#Sync
	tneg	%icc,	0x6
	tg	%icc,	0x0
	addccc	%i0,	%i3,	%i2
	ld	[%l7 + 0x64],	%f16
	umul	%g2,	%i5,	%g3
	movcs	%xcc,	%l0,	%g6
	tg	%icc,	0x6
	fmovsge	%icc,	%f5,	%f28
	fmovdleu	%icc,	%f26,	%f2
	nop
	setx	0x8658FC6F,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f28
	fsqrts	%f28,	%f23
	srax	%g5,	0x10,	%l2
	or	%l3,	0x0B9E,	%o1
	movvc	%xcc,	%o4,	%o3
	tcc	%xcc,	0x7
	fcmpne32	%f26,	%f20,	%g4
	movrlz	%i1,	0x01C,	%i4
	fmovrdne	%o5,	%f12,	%f16
	fbo	%fcc3,	loop_2459
	fbuge,a	%fcc1,	loop_2460
	fnor	%f28,	%f0,	%f24
	taddcctv	%o0,	0x17F8,	%g7
loop_2459:
	st	%f3,	[%l7 + 0x68]
loop_2460:
	and	%l1,	0x1EA5,	%o2
	edge16ln	%i6,	%l6,	%i7
	swap	[%l7 + 0x08],	%l5
	movrlz	%l4,	0x158,	%o6
	fmovdl	%xcc,	%f18,	%f5
	edge32n	%o7,	%g1,	%i3
	tne	%xcc,	0x1
	tgu	%xcc,	0x2
	sdivx	%i0,	0x1105,	%i2
	fbo	%fcc0,	loop_2461
	fbule,a	%fcc0,	loop_2462
	srl	%i5,	%g3,	%l0
	fmovsneg	%xcc,	%f5,	%f11
loop_2461:
	fmovsa	%xcc,	%f20,	%f19
loop_2462:
	movrlez	%g6,	0x020,	%g2
	fmovda	%xcc,	%f12,	%f9
	fcmpeq16	%f8,	%f6,	%l2
	nop
	set	0x40, %g1
	lduh	[%l7 + %g1],	%l3
	mulx	%g5,	0x1338,	%o4
	add	%l7,	0x58,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%o1,	%g4
	bneg	loop_2463
	fpsub16	%f30,	%f28,	%f14
	nop
	setx	0x975578C4,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f22
	setx	0xD203E4DB,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f25
	fmuls	%f25,	%f22,	%f8
	fbne	%fcc3,	loop_2464
loop_2463:
	edge8l	%o3,	%i1,	%o5
	ldstub	[%l7 + 0x7A],	%o0
	array16	%g7,	%l1,	%i4
loop_2464:
	sdiv	%i6,	0x03CF,	%o2
	mulx	%i7,	0x0EE2,	%l5
	fbe,a	%fcc2,	loop_2465
	bge,pt	%xcc,	loop_2466
	swap	[%l7 + 0x40],	%l4
	or	%o6,	%o7,	%l6
loop_2465:
	te	%xcc,	0x0
loop_2466:
	tsubcctv	%i3,	0x1F58,	%i0
	andn	%i2,	0x12E8,	%g1
	fbue	%fcc1,	loop_2467
	ldstub	[%l7 + 0x7B],	%g3
	faligndata	%f14,	%f2,	%f14
	srlx	%l0,	%i5,	%g2
loop_2467:
	subcc	%g6,	0x14E8,	%l3
	mova	%icc,	%g5,	%l2
	smulcc	%o4,	%g4,	%o3
	fcmple16	%f2,	%f4,	%o1
	nop
	setx	0x21273EC0,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f29
	fsqrts	%f29,	%f26
	fmovdne	%xcc,	%f27,	%f21
	add	%l7,	0x30,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%o5,	%o0
	fands	%f0,	%f25,	%f0
	brz,a	%g7,	loop_2468
	movvs	%icc,	%l1,	%i1
	sdiv	%i4,	0x1E82,	%o2
	fmuld8ulx16	%f25,	%f4,	%f28
loop_2468:
	taddcc	%i6,	%l5,	%l4
	tsubcc	%o6,	0x06CA,	%o7
	nop
	setx	0xA076047B,	%l0,	%l6
	st	%l6,	[%l7 + 0x44]
	ld	[%l7 + 0x44],	%fsr
	fbg,a	%fcc1,	loop_2469
	edge16	%l6,	%i7,	%i3
	andn	%i2,	0x0E31,	%i0
	tg	%xcc,	0x0
loop_2469:
	addccc	%g1,	%l0,	%i5
	movrlz	%g2,	0x219,	%g3
	smul	%g6,	%l3,	%l2
	mova	%icc,	%o4,	%g4
	fcmple16	%f28,	%f20,	%o3
	udivx	%o1,	0x1515,	%g5
	membar	0x2B
	ldstub	[%l7 + 0x47],	%o0
	andncc	%g7,	%o5,	%l1
	wr	%g0,	0x18,	%asi
	lduwa	[%l7 + 0x5C] %asi,	%i4
	movg	%xcc,	%o2,	%i1
	addc	%i6,	%l4,	%l5
	fpsub32	%f24,	%f10,	%f22
	alignaddr	%o6,	%l6,	%o7
	mulx	%i7,	%i3,	%i2
	tle	%icc,	0x7
	tle	%icc,	0x4
	sdivx	%g1,	0x1514,	%i0
	movrgz	%l0,	%g2,	%i5
	nop
	setx loop_2470, %l0, %l1
	jmpl %l1, %g3
	fmovrsne	%l3,	%f20,	%f21
	umulcc	%g6,	0x0DD1,	%l2
	udivcc	%o4,	0x018F,	%g4
loop_2470:
	fabss	%f22,	%f25
	alignaddr	%o1,	%o3,	%o0
	sth	%g7,	[%l7 + 0x0C]
	prefetch	[%l7 + 0x64],	 0x3
	tvs	%xcc,	0x7
	movre	%g5,	0x165,	%o5
	tvc	%xcc,	0x7
	fbge	%fcc1,	loop_2471
	lduh	[%l7 + 0x5A],	%i4
	bvc,pn	%icc,	loop_2472
	ldsb	[%l7 + 0x6F],	%l1
loop_2471:
	movrlez	%o2,	%i1,	%i6
	mulx	%l4,	%l5,	%o6
loop_2472:
	fandnot2	%f8,	%f20,	%f2
	nop
	set	0x66, %l1
	sth	%o7,	[%l7 + %l1]
	edge8ln	%l6,	%i7,	%i3
	fsrc2s	%f9,	%f13
	fornot2s	%f9,	%f27,	%f21
	fmovdleu	%icc,	%f17,	%f5
	fornot1s	%f9,	%f19,	%f8
	sdiv	%g1,	0x087D,	%i2
	fble,a	%fcc2,	loop_2473
	fmul8ulx16	%f14,	%f30,	%f24
	lduw	[%l7 + 0x58],	%i0
	orncc	%g2,	0x1755,	%l0
loop_2473:
	ldd	[%l7 + 0x58],	%i4
	nop
	fitos	%f6,	%f25
	fstox	%f25,	%f8
	fxtos	%f8,	%f9
	alignaddrl	%l3,	%g3,	%g6
	movl	%icc,	%l2,	%o4
	orcc	%g4,	0x1BFE,	%o1
	xnor	%o3,	0x07FD,	%g7
	fpack32	%f12,	%f30,	%f20
	tg	%icc,	0x2
	fmovrsgez	%o0,	%f10,	%f1
	addcc	%g5,	%o5,	%i4
	ldstub	[%l7 + 0x19],	%o2
	movrne	%i1,	0x1B1,	%i6
	movge	%xcc,	%l4,	%l1
	brz,a	%o6,	loop_2474
	mulx	%o7,	%l5,	%i7
	or	%l6,	0x1C46,	%g1
	sll	%i2,	0x0E,	%i0
loop_2474:
	membar	0x63
	fmul8x16al	%f3,	%f27,	%f6
	movgu	%xcc,	%i3,	%l0
	fmovsne	%xcc,	%f25,	%f11
	movle	%icc,	%g2,	%i5
	edge32ln	%l3,	%g6,	%g3
	std	%f10,	[%l7 + 0x28]
	nop
	setx	0x613482AF2C9768C7,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	fsqrtd	%f20,	%f2
	stbar
	tg	%icc,	0x2
	add	%l7,	0x20,	%l6
	wr	%g0,	0x19,	%asi
	ldxa	[%l6] %asi,	%l2
	casxa	[%l6] %asi,	%l2,	%o4
	fmovdne	%xcc,	%f6,	%f27
	tg	%icc,	0x4
	andncc	%g4,	%o1,	%o3
	sethi	0x1186,	%o0
	fbu,a	%fcc2,	loop_2475
	umul	%g7,	0x147F,	%g5
	alignaddr	%o5,	%o2,	%i1
	wr	%g0,	0x04,	%asi
	ldxa	[%l7 + 0x48] %asi,	%i6
loop_2475:
	fmul8x16au	%f5,	%f3,	%f4
	edge32n	%l4,	%l1,	%o6
	edge32ln	%o7,	%i4,	%l5
	wr	%g0,	0x10,	%asi
	ldsba	[%l7 + 0x22] %asi,	%i7
	orncc	%l6,	0x1D74,	%g1
	fbne,a	%fcc0,	loop_2476
	tvc	%xcc,	0x0
	wr	%g0,	0x80,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
loop_2476:
	edge16ln	%i0,	%i2,	%i3
	wr	%g0,	0x04,	%asi
	lduha	[%l7 + 0x62] %asi,	%l0
	edge8l	%i5,	%l3,	%g6
	fpadd32s	%f25,	%f11,	%f7
	sdivcc	%g3,	0x160F,	%g2
	tg	%xcc,	0x0
	fsrc1	%f4,	%f20
	tn	%xcc,	0x7
	or	%o4,	0x0671,	%g4
	membar	0x2A
	sethi	0x0F21,	%l2
	fpadd32s	%f6,	%f29,	%f10
	nop
	setx	0x730281DEA557E603,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0xE94149E5CAC4D185,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	fsubd	%f4,	%f6,	%f6
	subc	%o1,	0x1E99,	%o0
	srlx	%o3,	0x17,	%g5
	taddcc	%g7,	%o5,	%o2
	fmovdpos	%xcc,	%f17,	%f13
	sir	0x0E4B
	array16	%i6,	%l4,	%i1
	fbule	%fcc2,	loop_2477
	fbuge,a	%fcc1,	loop_2478
	brnz	%l1,	loop_2479
	srax	%o6,	%o7,	%l5
loop_2477:
	nop
	set	0x5A, %i7
	ldstuba	[%l7 + %i7] 0x80,	%i7
loop_2478:
	edge16	%i4,	%l6,	%g1
loop_2479:
	tl	%xcc,	0x0
	bl,a	loop_2480
	edge8l	%i0,	%i2,	%l0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movvs	%xcc,	%i5,	%l3
loop_2480:
	addcc	%i3,	%g3,	%g2
	movne	%xcc,	%o4,	%g4
	wr	%g0,	0x88,	%asi
	sta	%f18,	[%l7 + 0x58] %asi
	mova	%icc,	%l2,	%g6
	edge8ln	%o0,	%o1,	%g5
	movrne	%g7,	0x19F,	%o3
	popc	%o5,	%i6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsh	[%l7 + 0x2E],	%l4
	movrgez	%o2,	0x3E9,	%i1
	lduw	[%l7 + 0x40],	%l1
	array16	%o7,	%l5,	%i7
	lduw	[%l7 + 0x10],	%o6
	addc	%i4,	%l6,	%i0
	movcs	%icc,	%g1,	%l0
	sub	%i5,	%i2,	%i3
	tneg	%icc,	0x1
	sth	%g3,	[%l7 + 0x1C]
	orcc	%l3,	%o4,	%g4
	orcc	%l2,	0x1ADF,	%g6
	orncc	%g2,	%o1,	%g5
	faligndata	%f12,	%f6,	%f24
	brlz,a	%o0,	loop_2481
	fornot2	%f30,	%f28,	%f8
	fmovde	%xcc,	%f2,	%f15
	movneg	%icc,	%o3,	%g7
loop_2481:
	xorcc	%o5,	0x0416,	%i6
	stw	%l4,	[%l7 + 0x58]
	movrlez	%i1,	0x335,	%l1
	edge16	%o2,	%l5,	%i7
	movre	%o7,	%o6,	%i4
	add	%i0,	0x0011,	%l6
	wr	%g0,	0x89,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	xorcc	%g1,	%l0,	%i5
	wr	%g0,	0x89,	%asi
	swapa	[%l7 + 0x1C] %asi,	%i3
	srax	%i2,	0x00,	%g3
	tge	%xcc,	0x2
	udiv	%l3,	0x1DD0,	%o4
	set	0x20, %g5
	prefetcha	[%l7 + %g5] 0x11,	 0x3
	srax	%g6,	0x01,	%g2
	movvc	%icc,	%g4,	%o1
	ldsb	[%l7 + 0x0E],	%o0
	bleu,a	%icc,	loop_2482
	array32	%g5,	%g7,	%o3
	tcc	%icc,	0x5
	fbug	%fcc1,	loop_2483
loop_2482:
	nop
	setx	0x71E7F3C8693C7B97,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	fsqrtd	%f18,	%f18
	movrlz	%i6,	0x0A6,	%l4
	bg,pn	%xcc,	loop_2484
loop_2483:
	xnorcc	%i1,	%l1,	%o5
	tpos	%icc,	0x6
	brlz	%o2,	loop_2485
loop_2484:
	popc	%i7,	%l5
	movrgz	%o6,	0x3AD,	%i4
	tcc	%xcc,	0x4
loop_2485:
	fmovrslz	%o7,	%f31,	%f20
	move	%icc,	%i0,	%l6
	add	%l0,	0x0AD2,	%i5
	fmul8x16	%f8,	%f16,	%f6
	mulscc	%i3,	%g1,	%i2
	ldsw	[%l7 + 0x38],	%g3
	array8	%l3,	%l2,	%o4
	move	%icc,	%g2,	%g4
	movneg	%icc,	%g6,	%o0
	addccc	%o1,	%g7,	%o3
	addccc	%i6,	0x0E71,	%g5
	edge32ln	%l4,	%l1,	%i1
	movrne	%o5,	0x2D4,	%o2
	movg	%icc,	%l5,	%i7
	or	%i4,	%o6,	%o7
	movvs	%xcc,	%i0,	%l0
	fmovda	%xcc,	%f22,	%f27
	tpos	%icc,	0x2
	ldsh	[%l7 + 0x3A],	%l6
	add	%i5,	0x18B0,	%g1
	fpadd16s	%f1,	%f21,	%f4
	edge16ln	%i2,	%g3,	%l3
	sllx	%l2,	0x0C,	%i3
	fpsub16	%f30,	%f6,	%f24
	fexpand	%f5,	%f12
	stx	%g2,	[%l7 + 0x38]
	be,pn	%icc,	loop_2486
	tn	%xcc,	0x0
	fmovrse	%o4,	%f16,	%f28
	fornot2	%f0,	%f20,	%f18
loop_2486:
	fmovrsne	%g4,	%f15,	%f2
	ta	%icc,	0x4
	tleu	%xcc,	0x6
	nop
	fitos	%f12,	%f16
	fmovdvc	%xcc,	%f24,	%f2
	movneg	%icc,	%g6,	%o0
	sethi	0x0ED3,	%g7
	wr	%g0,	0xf1,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
	edge16l	%o1,	%o3,	%g5
	edge16ln	%l4,	%i6,	%l1
	orncc	%o5,	%i1,	%o2
	tcc	%icc,	0x7
	alignaddrl	%i7,	%i4,	%l5
	subcc	%o7,	%i0,	%o6
	sir	0x1DB0
	tle	%icc,	0x6
	fpmerge	%f18,	%f7,	%f2
	alignaddrl	%l0,	%l6,	%i5
	sth	%g1,	[%l7 + 0x16]
	movneg	%xcc,	%i2,	%g3
	bg,pn	%xcc,	loop_2487
	lduh	[%l7 + 0x4C],	%l2
	movre	%l3,	0x3C8,	%g2
	brlez,a	%i3,	loop_2488
loop_2487:
	fmovdcc	%icc,	%f7,	%f25
	edge32n	%o4,	%g4,	%o0
	srax	%g7,	%o1,	%o3
loop_2488:
	fmovdvc	%xcc,	%f7,	%f12
	fblg,a	%fcc0,	loop_2489
	ldx	[%l7 + 0x20],	%g6
	flush	%l7 + 0x74
	movn	%xcc,	%g5,	%i6
loop_2489:
	sdiv	%l1,	0x0FE4,	%l4
	swap	[%l7 + 0x7C],	%o5
	movg	%icc,	%o2,	%i1
	tcs	%icc,	0x4
	faligndata	%f12,	%f8,	%f8
	fmovse	%xcc,	%f17,	%f13
	brz,a	%i7,	loop_2490
	move	%icc,	%l5,	%i4
	fand	%f8,	%f24,	%f4
	sethi	0x1821,	%i0
loop_2490:
	bcc,pt	%icc,	loop_2491
	fmovrdgez	%o6,	%f20,	%f22
	tvs	%xcc,	0x2
	set	0x5D, %o0
	ldstuba	[%l7 + %o0] 0x81,	%o7
loop_2491:
	fmul8x16al	%f4,	%f18,	%f4
	tle	%xcc,	0x7
	edge8l	%l6,	%l0,	%g1
	swap	[%l7 + 0x3C],	%i2
	set	0x40, %l2
	stda	%f16,	[%l7 + %l2] 0x19
	srax	%g3,	%l2,	%i5
	tsubcctv	%l3,	0x12BB,	%g2
	fmovsle	%xcc,	%f13,	%f31
	umulcc	%i3,	0x09C6,	%g4
	fmovsleu	%icc,	%f29,	%f28
	fbn,a	%fcc0,	loop_2492
	fba	%fcc1,	loop_2493
	fcmple16	%f6,	%f2,	%o4
	nop
	setx	0x11FA0F8C,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f14
	setx	0xB00941A3,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f8
	fadds	%f8,	%f14,	%f0
loop_2492:
	movn	%xcc,	%o0,	%o1
loop_2493:
	fbul,a	%fcc3,	loop_2494
	fmovdn	%icc,	%f11,	%f16
	movcc	%icc,	%o3,	%g7
	brlez,a	%g6,	loop_2495
loop_2494:
	movn	%xcc,	%g5,	%i6
	bg	loop_2496
	edge16n	%l4,	%o5,	%o2
loop_2495:
	fmovspos	%icc,	%f14,	%f25
	tg	%icc,	0x6
loop_2496:
	movleu	%xcc,	%l1,	%i7
	movrgz	%l5,	%i1,	%i4
	ldd	[%l7 + 0x60],	%f2
	movne	%xcc,	%i0,	%o6
	xor	%o7,	%l6,	%l0
	fnot2s	%f30,	%f4
	fmovsvs	%xcc,	%f31,	%f31
	edge8n	%i2,	%g1,	%l2
	tg	%xcc,	0x6
	fmovdne	%xcc,	%f2,	%f14
	faligndata	%f2,	%f4,	%f4
	and	%g3,	0x023F,	%i5
	edge32l	%g2,	%l3,	%i3
	movgu	%xcc,	%o4,	%g4
	fsrc1s	%f10,	%f9
	addc	%o1,	0x0C1A,	%o0
	st	%f27,	[%l7 + 0x4C]
	fbge,a	%fcc3,	loop_2497
	xnorcc	%o3,	0x0A5C,	%g6
	fcmple16	%f30,	%f16,	%g7
	fmovdge	%xcc,	%f12,	%f4
loop_2497:
	udivcc	%g5,	0x1736,	%l4
	mova	%xcc,	%i6,	%o5
	fxnor	%f24,	%f20,	%f6
	add	%l7,	0x50,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%l1
	casa	[%l6] 0x88,	%l1,	%o2
	membar	#Sync
	set	0x40, %l3
	ldda	[%l7 + %l3] 0x17,	%f16
	sub	%l5,	%i1,	%i7
	movrgez	%i0,	%i4,	%o6
	movcc	%icc,	%l6,	%o7
	brnz	%i2,	loop_2498
	edge8l	%l0,	%l2,	%g1
	tcc	%xcc,	0x5
	bgu,pt	%icc,	loop_2499
loop_2498:
	tcs	%icc,	0x5
	fmovrse	%g3,	%f25,	%f4
	fmul8ulx16	%f18,	%f4,	%f24
loop_2499:
	bl,a,pn	%xcc,	loop_2500
	srlx	%g2,	%l3,	%i3
	fors	%f23,	%f21,	%f13
	edge16n	%i5,	%g4,	%o4
loop_2500:
	fble	%fcc0,	loop_2501
	movrne	%o1,	0x0EB,	%o3
	ta	%icc,	0x4
	subcc	%g6,	%o0,	%g7
loop_2501:
	lduw	[%l7 + 0x5C],	%g5
	and	%i6,	0x09AD,	%o5
	edge32n	%l4,	%o2,	%l5
	fmovdle	%xcc,	%f29,	%f17
	movrgez	%i1,	%i7,	%i0
	add	%l7,	0x60,	%l6
	wr	%g0,	0x18,	%asi
	ldxa	[%l6] %asi,	%i4
	casxa	[%l6] %asi,	%i4,	%l1
	wr	%g0,	0x89,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	ldx	[%l7 + 0x08],	%o6
	tcc	%icc,	0x6
	nop
	fitos	%f0,	%f2
	fstoi	%f2,	%f17
	bneg	loop_2502
	edge32ln	%o7,	%l6,	%i2
	popc	%l2,	%g1
	array32	%g3,	%l0,	%l3
loop_2502:
	movge	%icc,	%i3,	%i5
	edge16n	%g4,	%g2,	%o1
	fba,a	%fcc1,	loop_2503
	tne	%xcc,	0x4
	tgu	%xcc,	0x1
	fnors	%f27,	%f17,	%f2
loop_2503:
	fmovrse	%o3,	%f0,	%f15
	fmovsl	%icc,	%f29,	%f16
	subc	%o4,	0x06F0,	%g6
	fpadd32s	%f27,	%f25,	%f31
	wr	%g0,	0x81,	%asi
	swapa	[%l7 + 0x48] %asi,	%o0
	fmul8ulx16	%f16,	%f18,	%f10
	fnegs	%f24,	%f14
	nop
	fitos	%f12,	%f22
	fstox	%f22,	%f20
	sllx	%g7,	%g5,	%o5
	sllx	%l4,	0x09,	%o2
	nop
	setx	0xE64CA7AABAF2B303,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0x77B89BFC2E498B30,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	fsubd	%f26,	%f6,	%f8
	tcs	%icc,	0x0
	alignaddrl	%i6,	%l5,	%i7
	movg	%icc,	%i0,	%i4
	andn	%l1,	0x02AA,	%i1
	andcc	%o7,	%o6,	%l6
	addccc	%i2,	%l2,	%g1
	fbge,a	%fcc3,	loop_2504
	nop
	setx	0xAAB350B7,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f28
	setx	0x78EC2065,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f27
	fmuls	%f27,	%f28,	%f23
	tge	%icc,	0x2
	fmovdl	%icc,	%f15,	%f6
loop_2504:
	nop
	wr	%g0,	0x0c,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	tgu	%icc,	0x1
	fmovdgu	%icc,	%f8,	%f6
	edge32ln	%g3,	%l3,	%i3
	tcc	%icc,	0x1
	edge8n	%l0,	%i5,	%g2
	nop
	fitos	%f2,	%f31
	fstoi	%f31,	%f11
	fbule	%fcc1,	loop_2505
	brz	%o1,	loop_2506
	te	%xcc,	0x5
	or	%o3,	%g4,	%o4
loop_2505:
	smulcc	%o0,	%g7,	%g6
loop_2506:
	orncc	%g5,	0x008C,	%l4
	movgu	%icc,	%o2,	%o5
	tsubcc	%l5,	%i7,	%i6
	movre	%i4,	%i0,	%l1
	edge16	%o7,	%i1,	%l6
	fpsub32s	%f4,	%f28,	%f23
	sethi	0x0F40,	%o6
	smulcc	%i2,	%g1,	%g3
	tsubcctv	%l3,	0x08CA,	%l2
	ld	[%l7 + 0x78],	%f12
	nop
	fitos	%f4,	%f17
	move	%xcc,	%l0,	%i5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmul8sux16	%f8,	%f28,	%f10
	fmovsle	%xcc,	%f3,	%f17
	andn	%i3,	0x01DF,	%g2
	popc	0x0596,	%o1
	brlez,a	%g4,	loop_2507
	nop
	setx	0xC06F3C95,	%l0,	%l6
	st	%l6,	[%l7 + 0x08]
	ld	[%l7 + 0x08],	%fsr
	tne	%icc,	0x6
	fornot1	%f12,	%f4,	%f10
loop_2507:
	brlz	%o4,	loop_2508
	fmovscs	%xcc,	%f3,	%f28
	tn	%icc,	0x6
	fmovrdlz	%o0,	%f10,	%f4
loop_2508:
	bn,pt	%xcc,	loop_2509
	ldd	[%l7 + 0x48],	%o2
	xor	%g7,	0x0010,	%g5
	fbue,a	%fcc0,	loop_2510
loop_2509:
	taddcctv	%l4,	%g6,	%o5
	tg	%icc,	0x0
	bge,pn	%icc,	loop_2511
loop_2510:
	fmovdvc	%xcc,	%f11,	%f23
	fpsub32s	%f21,	%f14,	%f6
	bvc	loop_2512
loop_2511:
	sra	%o2,	%l5,	%i7
	tneg	%xcc,	0x3
	fmovsg	%icc,	%f1,	%f2
loop_2512:
	movge	%xcc,	%i4,	%i0
	ldsw	[%l7 + 0x24],	%i6
	brgez	%o7,	loop_2513
	srl	%l1,	0x03,	%i1
	addcc	%l6,	0x1BA4,	%i2
	andncc	%o6,	%g3,	%g1
loop_2513:
	edge32	%l2,	%l3,	%l0
	fmovdcs	%icc,	%f5,	%f6
	tneg	%icc,	0x0
	or	%i3,	%g2,	%o1
	tgu	%xcc,	0x6
	fzero	%f26
	set	0x0D, %o7
	ldsba	[%l7 + %o7] 0x15,	%i5
	fzero	%f16
	wr	%g0,	0x1f,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
	srax	%o4,	%g4,	%o0
	fornot1s	%f0,	%f3,	%f18
	tn	%icc,	0x2
	fxors	%f27,	%f29,	%f23
	andncc	%g7,	%g5,	%l4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8ln	%g6,	%o5,	%o2
	edge32l	%o3,	%l5,	%i4
	wr	%g0,	0x52,	%asi
	stxa	%i0,	[%g0 + 0x208] %asi
	swap	[%l7 + 0x5C],	%i6
	fnands	%f0,	%f22,	%f5
	nop
	setx	loop_2514,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fble	%fcc0,	loop_2515
	ldx	[%l7 + 0x50],	%i7
	flush	%l7 + 0x3C
loop_2514:
	sll	%l1,	0x0A,	%o7
loop_2515:
	nop
	set	0x4C, %o2
	stba	%i1,	[%l7 + %o2] 0xe2
	membar	#Sync
	edge16ln	%l6,	%i2,	%o6
	set	0x60, %i0
	ldda	[%l7 + %i0] 0x88,	%g2
	edge8ln	%g1,	%l2,	%l0
	wr	%g0,	0x04,	%asi
	prefetcha	[%l7 + 0x08] %asi,	 0x1
	fandnot2s	%f12,	%f6,	%f14
	fones	%f21
	addccc	%g2,	%o1,	%i3
	edge16n	%o4,	%i5,	%g4
	tneg	%icc,	0x7
	nop
	fitod	%f4,	%f2
	fdtoi	%f2,	%f8
	bleu	loop_2516
	tn	%icc,	0x3
	taddcctv	%o0,	0x0FB3,	%g7
	sir	0x04FC
loop_2516:
	movleu	%xcc,	%l4,	%g5
	popc	0x0FE0,	%g6
	or	%o5,	0x060C,	%o3
	movne	%xcc,	%o2,	%i4
	edge32l	%l5,	%i0,	%i7
	ldub	[%l7 + 0x6D],	%i6
	movre	%o7,	%i1,	%l1
	tg	%xcc,	0x1
	movrne	%i2,	%o6,	%l6
	edge16n	%g1,	%l2,	%g3
	brz	%l3,	loop_2517
	fbge,a	%fcc1,	loop_2518
	sir	0x0110
	bshuffle	%f30,	%f8,	%f14
loop_2517:
	mova	%icc,	%g2,	%l0
loop_2518:
	tgu	%icc,	0x1
	fornot2s	%f30,	%f21,	%f15
	subc	%o1,	0x1920,	%i3
	movrne	%o4,	%i5,	%o0
	fbge	%fcc3,	loop_2519
	fpadd16	%f10,	%f14,	%f6
	sir	0x028D
	ldd	[%l7 + 0x68],	%g6
loop_2519:
	ba,pn	%icc,	loop_2520
	fornot2s	%f25,	%f13,	%f30
	brlez	%l4,	loop_2521
	fmovsleu	%icc,	%f5,	%f29
loop_2520:
	nop
	setx	loop_2522,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fmovrslz	%g5,	%f6,	%f15
loop_2521:
	movrlez	%g6,	0x184,	%o5
	array8	%o3,	%o2,	%i4
loop_2522:
	nop
	fitos	%f9,	%f23
	fstod	%f23,	%f2
	movg	%xcc,	%l5,	%g4
	fble,a	%fcc1,	loop_2523
	fnegs	%f10,	%f27
	ta	%xcc,	0x7
	ldx	[%l7 + 0x48],	%i0
loop_2523:
	nop
	set	0x7B, %l5
	ldstuba	[%l7 + %l5] 0x0c,	%i6
	nop
	setx	loop_2524,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fbg,a	%fcc1,	loop_2525
	bcs	loop_2526
	tn	%xcc,	0x4
loop_2524:
	fmovdg	%icc,	%f9,	%f17
loop_2525:
	fnands	%f2,	%f23,	%f24
loop_2526:
	add	%o7,	0x07D9,	%i1
	fbul	%fcc0,	loop_2527
	bpos	loop_2528
	sra	%i7,	0x1D,	%i2
	wr	%g0,	0x10,	%asi
	prefetcha	[%l7 + 0x08] %asi,	 0x3
loop_2527:
	alignaddrl	%o6,	%l6,	%g1
loop_2528:
	tpos	%icc,	0x4
	fmovrsgz	%l2,	%f18,	%f26
	movvs	%xcc,	%g3,	%g2
	fornot2	%f10,	%f14,	%f22
	movrlez	%l0,	0x1CB,	%l3
	brlez,a	%i3,	loop_2529
	sdivcc	%o1,	0x0C45,	%i5
	wr	%g0,	0x0c,	%asi
	ldsha	[%l7 + 0x46] %asi,	%o0
loop_2529:
	te	%xcc,	0x3
	edge8n	%o4,	%g7,	%l4
	sdivcc	%g5,	0x1EB8,	%g6
	srax	%o5,	0x1F,	%o3
	movneg	%xcc,	%o2,	%l5
	edge16ln	%i4,	%i0,	%i6
	call	loop_2530
	tn	%xcc,	0x5
	sdivcc	%o7,	0x1CB0,	%i1
	brlz	%i7,	loop_2531
loop_2530:
	ldsw	[%l7 + 0x74],	%g4
	wr	%g0,	0x89,	%asi
	ldsba	[%l7 + 0x49] %asi,	%i2
loop_2531:
	ldsw	[%l7 + 0x28],	%l1
	movpos	%icc,	%l6,	%o6
	nop
	setx	0xCD431535418A2E04,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	fsqrtd	%f30,	%f26
	fsrc1	%f0,	%f12
	fmovsvs	%icc,	%f11,	%f3
	tn	%icc,	0x4
	prefetch	[%l7 + 0x0C],	 0x2
	mova	%icc,	%g1,	%g3
	bn,pn	%icc,	loop_2532
	addcc	%l2,	0x1980,	%g2
	sll	%l0,	0x1B,	%i3
	fmovd	%f8,	%f16
loop_2532:
	fpadd32	%f6,	%f8,	%f16
	wr	%g0,	0x89,	%asi
	ldswa	[%l7 + 0x40] %asi,	%l3
	fnors	%f4,	%f26,	%f2
	andncc	%i5,	%o1,	%o0
	fcmple32	%f18,	%f16,	%g7
	sllx	%o4,	0x0A,	%g5
	fmovrde	%l4,	%f20,	%f20
	fmovdvc	%icc,	%f21,	%f17
	tsubcctv	%g6,	%o5,	%o3
	fbul,a	%fcc3,	loop_2533
	fmovrde	%l5,	%f22,	%f24
	andn	%o2,	%i0,	%i4
	brlez,a	%o7,	loop_2534
loop_2533:
	edge8	%i6,	%i1,	%g4
	smul	%i7,	0x1E42,	%l1
	mova	%xcc,	%l6,	%o6
loop_2534:
	movleu	%icc,	%i2,	%g3
	fbne,a	%fcc3,	loop_2535
	orncc	%l2,	%g2,	%l0
	move	%icc,	%g1,	%l3
	fbg,a	%fcc3,	loop_2536
loop_2535:
	sethi	0x1C91,	%i5
	nop
	setx	0xB9E91E46C06C2846,	%l0,	%l6
	stx	%l6,	[%l7 + 0x38]
	ldx	[%l7 + 0x38],	%fsr
	wr	%g0,	0x80,	%asi
	ldstuba	[%l7 + 0x26] %asi,	%i3
loop_2536:
	nop
	fitos	%f30,	%f8
	bpos	loop_2537
	alignaddrl	%o1,	%o0,	%o4
	fmovsge	%icc,	%f16,	%f5
	fmul8x16al	%f13,	%f23,	%f10
loop_2537:
	nop
	wr	%g0,	0x80,	%asi
	ldstuba	[%l7 + 0x2E] %asi,	%g7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	st	%f29,	[%l7 + 0x5C]
	bg,pt	%icc,	loop_2538
	and	%g5,	0x03A6,	%l4
	nop
	setx	0x511444451274B89A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0x4A13E041C487B84B,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	fmuld	%f6,	%f2,	%f12
	fmovspos	%icc,	%f2,	%f15
loop_2538:
	sth	%o5,	[%l7 + 0x42]
	fmovrsgz	%o3,	%f6,	%f28
	sdivcc	%g6,	0x0076,	%l5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	call	loop_2539
	add	%i0,	0x187B,	%o2
	fnors	%f12,	%f0,	%f12
	movrgez	%o7,	0x1D0,	%i6
loop_2539:
	movn	%xcc,	%i1,	%i4
	edge32l	%i7,	%l1,	%g4
	or	%o6,	%i2,	%l6
	ta	%icc,	0x5
	tcs	%icc,	0x6
	nop
	setx	0x15A02366,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f24
	fsqrts	%f24,	%f22
	tcs	%xcc,	0x5
	popc	%l2,	%g3
	set	0x10, %o3
	ldda	[%l7 + %o3] 0x23,	%g2
	movcs	%xcc,	%l0,	%l3
	xorcc	%i5,	0x1194,	%i3
	ldd	[%l7 + 0x40],	%o0
	brz	%o0,	loop_2540
	smulcc	%o4,	0x1228,	%g7
	fmovsne	%xcc,	%f19,	%f31
	fmovsge	%xcc,	%f2,	%f25
loop_2540:
	tneg	%icc,	0x4
	sra	%g5,	0x06,	%l4
	add	%g1,	%o3,	%g6
	edge8	%l5,	%i0,	%o2
	st	%f26,	[%l7 + 0x2C]
	movrlez	%o7,	%i6,	%i1
	umul	%i4,	%o5,	%l1
	fbge	%fcc2,	loop_2541
	orncc	%i7,	0x147E,	%g4
	andn	%i2,	%o6,	%l2
	xnor	%l6,	0x0B2B,	%g3
loop_2541:
	fbue,a	%fcc2,	loop_2542
	sdiv	%g2,	0x153E,	%l3
	subc	%l0,	0x05EA,	%i3
	mulx	%i5,	0x19CF,	%o1
loop_2542:
	nop
	fitos	%f10,	%f17
	fstox	%f17,	%f4
	fxtos	%f4,	%f9
	fbul,a	%fcc2,	loop_2543
	fmovscs	%icc,	%f29,	%f9
	edge32ln	%o0,	%g7,	%o4
	fcmpne32	%f28,	%f24,	%l4
loop_2543:
	movge	%xcc,	%g1,	%o3
	ldsb	[%l7 + 0x0D],	%g5
	fsrc2	%f4,	%f4
	wr	%g0,	0x11,	%asi
	lduba	[%l7 + 0x5A] %asi,	%l5
	movrgz	%g6,	0x125,	%o2
	movrne	%o7,	0x198,	%i6
	array16	%i1,	%i4,	%i0
	fbug,a	%fcc2,	loop_2544
	edge16l	%o5,	%l1,	%i7
	fmovda	%icc,	%f30,	%f5
	add	%g4,	0x05C6,	%i2
loop_2544:
	orcc	%l2,	0x1AD0,	%o6
	fbn	%fcc3,	loop_2545
	subccc	%g3,	0x1E62,	%l6
	move	%icc,	%g2,	%l3
	tl	%xcc,	0x3
loop_2545:
	movrgez	%l0,	%i5,	%i3
	ldx	[%l7 + 0x20],	%o0
	bge,pn	%xcc,	loop_2546
	ldub	[%l7 + 0x1C],	%g7
	tle	%xcc,	0x1
	mova	%xcc,	%o4,	%l4
loop_2546:
	tn	%xcc,	0x6
	ld	[%l7 + 0x7C],	%f10
	bl,a,pn	%icc,	loop_2547
	edge16n	%o1,	%g1,	%g5
	tn	%xcc,	0x5
	move	%xcc,	%l5,	%g6
loop_2547:
	xnorcc	%o2,	0x1BCC,	%o3
	nop
	setx	0xFC0EDEB853D6C5C7,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0xFBFD548E9E18D6AD,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	fsubd	%f26,	%f26,	%f6
	fble,a	%fcc2,	loop_2548
	ta	%xcc,	0x6
	tleu	%icc,	0x7
	tgu	%xcc,	0x0
loop_2548:
	fbe	%fcc0,	loop_2549
	array32	%o7,	%i6,	%i1
	fmul8sux16	%f2,	%f14,	%f0
	fmovsvc	%icc,	%f8,	%f28
loop_2549:
	edge8ln	%i4,	%o5,	%i0
	bshuffle	%f12,	%f8,	%f28
	ldsb	[%l7 + 0x7D],	%l1
	fble	%fcc3,	loop_2550
	tge	%icc,	0x2
	sir	0x1264
	orcc	%g4,	%i2,	%l2
loop_2550:
	fbn	%fcc0,	loop_2551
	movrgz	%o6,	0x3AD,	%i7
	movpos	%icc,	%l6,	%g2
	ldd	[%l7 + 0x48],	%f0
loop_2551:
	ldub	[%l7 + 0x12],	%l3
	membar	#Sync
	set	0x40, %i1
	ldda	[%l7 + %i1] 0xf9,	%f0
	fmovdvc	%icc,	%f24,	%f4
	flush	%l7 + 0x08
	sethi	0x0496,	%l0
	srlx	%g3,	0x1A,	%i5
	xor	%o0,	0x1E37,	%g7
	sdiv	%o4,	0x11E1,	%i3
	stbar
	edge16n	%l4,	%o1,	%g5
	edge32	%l5,	%g1,	%o2
	edge32ln	%o3,	%o7,	%g6
	fmovda	%xcc,	%f23,	%f24
	fba,a	%fcc1,	loop_2552
	fbn,a	%fcc1,	loop_2553
	mulscc	%i6,	0x1E30,	%i1
	udivcc	%i4,	0x0E63,	%o5
loop_2552:
	addcc	%l1,	%g4,	%i2
loop_2553:
	alignaddrl	%i0,	%o6,	%l2
	sdivcc	%i7,	0x15FC,	%g2
	nop
	setx	loop_2554,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	bgu	loop_2555
	movvc	%xcc,	%l6,	%l0
	udivcc	%l3,	0x1F8D,	%g3
loop_2554:
	subc	%o0,	%g7,	%o4
loop_2555:
	or	%i5,	%l4,	%i3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnor	%g5,	%o1,	%g1
	movgu	%xcc,	%o2,	%o3
	udiv	%o7,	0x07B6,	%l5
	ldsw	[%l7 + 0x54],	%g6
	nop
	fitos	%f16,	%f15
	sra	%i6,	%i4,	%i1
	xnor	%l1,	%o5,	%i2
	edge32ln	%g4,	%i0,	%o6
	stbar
	fbuge,a	%fcc3,	loop_2556
	mulx	%i7,	%l2,	%g2
	srlx	%l0,	0x12,	%l3
	orncc	%l6,	%g3,	%o0
loop_2556:
	orcc	%g7,	%i5,	%l4
	srax	%o4,	0x0D,	%g5
	nop
	fitod	%f0,	%f20
	fdtoi	%f20,	%f2
	bne,a,pt	%xcc,	loop_2557
	orncc	%o1,	%g1,	%i3
	brlz,a	%o2,	loop_2558
	sethi	0x1D1A,	%o3
loop_2557:
	fble	%fcc2,	loop_2559
	movle	%xcc,	%o7,	%g6
loop_2558:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tleu	%icc,	0x2
loop_2559:
	movcc	%icc,	%i6,	%i4
	addccc	%l5,	%l1,	%i1
	mulx	%i2,	0x0F66,	%o5
	pdist	%f18,	%f24,	%f14
	bne	loop_2560
	bcc,a,pt	%icc,	loop_2561
	movl	%icc,	%g4,	%i0
	fmuld8ulx16	%f19,	%f31,	%f14
loop_2560:
	movrlez	%i7,	0x09F,	%o6
loop_2561:
	tsubcc	%l2,	0x0FE7,	%l0
	fcmpne16	%f14,	%f20,	%g2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orncc	%l3,	0x1BEB,	%l6
	brlz	%o0,	loop_2562
	fandnot1	%f16,	%f8,	%f8
	tvs	%icc,	0x5
	movvc	%icc,	%g3,	%i5
loop_2562:
	nop
	set	0x40, %g7
	stda	%f16,	[%l7 + %g7] 0x15
	xorcc	%g7,	%l4,	%g5
	or	%o4,	%g1,	%i3
	edge16ln	%o1,	%o2,	%o7
	umul	%o3,	0x141B,	%g6
	set	0x14, %i3
	lduba	[%l7 + %i3] 0x88,	%i6
	edge8n	%l5,	%l1,	%i4
	fble,a	%fcc1,	loop_2563
	lduh	[%l7 + 0x22],	%i2
	fbne,a	%fcc2,	loop_2564
	ldsh	[%l7 + 0x6A],	%i1
loop_2563:
	sllx	%g4,	0x1C,	%i0
	nop
	setx	0x5D62CF2C,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f11
	setx	0x26EE9A88,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f27
	fadds	%f27,	%f11,	%f0
loop_2564:
	nop
	set	0x40, %l4
	stda	%f16,	[%l7 + %l4] 0x15
	bcc,a,pt	%xcc,	loop_2565
	nop
	fitos	%f5,	%f25
	fstox	%f25,	%f20
	andncc	%i7,	%o6,	%l2
	st	%f16,	[%l7 + 0x30]
loop_2565:
	ldsb	[%l7 + 0x7E],	%l0
	fmovdle	%xcc,	%f18,	%f24
	or	%g2,	%l3,	%l6
	orn	%o5,	0x1A17,	%g3
	set	0x7C, %l6
	ldswa	[%l7 + %l6] 0x14,	%i5
	edge32n	%o0,	%g7,	%g5
	membar	0x64
	tvc	%xcc,	0x2
	set	0x70, %l0
	stxa	%o4,	[%l7 + %l0] 0x23
	membar	#Sync
	edge32n	%l4,	%i3,	%o1
	mulx	%g1,	%o2,	%o3
	tsubcctv	%o7,	%g6,	%l5
	srl	%l1,	%i4,	%i6
	fmul8ulx16	%f24,	%f30,	%f18
	fbu	%fcc2,	loop_2566
	xnor	%i2,	0x1E41,	%g4
	sdivx	%i0,	0x0B2D,	%i1
	set	0x08, %i5
	ldsha	[%l7 + %i5] 0x88,	%o6
loop_2566:
	nop
	set	0x78, %i2
	lda	[%l7 + %i2] 0x18,	%f20
	sub	%i7,	%l2,	%l0
	mulscc	%l3,	%l6,	%g2
	sllx	%g3,	%o5,	%o0
	orn	%g7,	%g5,	%o4
	array32	%l4,	%i3,	%o1
	srl	%i5,	%o2,	%g1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fxors	%f20,	%f15,	%f13
	movcs	%xcc,	%o3,	%g6
	orn	%o7,	0x0C9B,	%l1
	nop
	setx	loop_2567,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movvc	%icc,	%i4,	%l5
	tne	%xcc,	0x3
	lduw	[%l7 + 0x68],	%i2
loop_2567:
	nop
	wr	%g0,	0x88,	%asi
	stba	%g4,	[%l7 + 0x19] %asi
	movrne	%i0,	0x3B9,	%i6
	move	%xcc,	%i1,	%o6
	fnegs	%f29,	%f16
	sethi	0x1838,	%l2
	tge	%xcc,	0x7
	ble,a	%icc,	loop_2568
	tgu	%icc,	0x3
	movvc	%xcc,	%l0,	%i7
	ta	%icc,	0x0
loop_2568:
	move	%xcc,	%l3,	%g2
	bneg	loop_2569
	add	%g3,	0x059E,	%o5
	alignaddrl	%l6,	%o0,	%g5
	taddcctv	%o4,	%l4,	%i3
loop_2569:
	nop
	fitos	%f8,	%f17
	fstox	%f17,	%f10
	fbo,a	%fcc1,	loop_2570
	andn	%o1,	0x1C44,	%i5
	fmul8x16au	%f25,	%f23,	%f0
	andn	%g7,	%o2,	%g1
loop_2570:
	fmovsneg	%icc,	%f18,	%f7
	sethi	0x1AB7,	%o3
	fmovrsne	%g6,	%f15,	%f3
	taddcctv	%o7,	0x1B79,	%i4
	movrne	%l5,	%l1,	%i2
	edge32l	%i0,	%g4,	%i1
	fabsd	%f4,	%f16
	sllx	%o6,	%l2,	%i6
	call	loop_2571
	orcc	%i7,	0x0F03,	%l0
	srlx	%g2,	0x0B,	%g3
	fmovda	%icc,	%f27,	%f17
loop_2571:
	fbg	%fcc2,	loop_2572
	membar	0x10
	swap	[%l7 + 0x18],	%l3
	tpos	%xcc,	0x3
loop_2572:
	andncc	%o5,	%o0,	%l6
	membar	0x3E
	tsubcctv	%o4,	0x07CC,	%l4
	srl	%i3,	0x1C,	%g5
	tvs	%xcc,	0x4
	bn,a	loop_2573
	alignaddrl	%i5,	%g7,	%o2
	fmovsl	%icc,	%f7,	%f17
	addccc	%g1,	0x0CC7,	%o3
loop_2573:
	stw	%g6,	[%l7 + 0x74]
	tvc	%icc,	0x2
	edge16ln	%o1,	%o7,	%i4
	be,a,pn	%xcc,	loop_2574
	faligndata	%f20,	%f4,	%f16
	fmovrdlz	%l5,	%f8,	%f14
	movvc	%xcc,	%l1,	%i2
loop_2574:
	andncc	%i0,	%g4,	%i1
	fmuld8ulx16	%f0,	%f8,	%f6
	tl	%icc,	0x7
	stb	%l2,	[%l7 + 0x0C]
	movneg	%xcc,	%o6,	%i7
	fmovdn	%icc,	%f14,	%f28
	sdiv	%l0,	0x055E,	%i6
	fpsub16	%f20,	%f10,	%f16
	alignaddr	%g3,	%g2,	%l3
	movl	%icc,	%o5,	%o0
	edge32n	%l6,	%o4,	%i3
	fmovsle	%icc,	%f20,	%f23
	tge	%xcc,	0x7
	add	%g5,	0x0755,	%i5
	movrne	%l4,	%o2,	%g7
	fbu	%fcc2,	loop_2575
	te	%xcc,	0x5
	movneg	%icc,	%g1,	%g6
	set	0x40, %g4
	stda	%f16,	[%l7 + %g4] 0x1e
	membar	#Sync
loop_2575:
	fba,a	%fcc1,	loop_2576
	andcc	%o1,	%o7,	%i4
	addcc	%l5,	0x1A39,	%o3
	set	0x74, %i6
	lduha	[%l7 + %i6] 0x18,	%i2
loop_2576:
	bneg,a	loop_2577
	edge8	%i0,	%g4,	%l1
	orncc	%l2,	%o6,	%i7
	nop
	setx	0x407A5110798EAFA0,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	fsqrtd	%f2,	%f20
loop_2577:
	fcmpeq32	%f6,	%f20,	%l0
	fmovdn	%xcc,	%f27,	%f13
	fcmple16	%f4,	%f24,	%i6
	subc	%g3,	%i1,	%l3
	sir	0x094A
	array16	%o5,	%o0,	%g2
	fone	%f0
	nop
	fitos	%f7,	%f22
	fstoi	%f22,	%f11
	fxors	%f17,	%f5,	%f6
	fbuge,a	%fcc1,	loop_2578
	movl	%icc,	%l6,	%o4
	tsubcc	%i3,	0x0F90,	%g5
	ta	%icc,	0x1
loop_2578:
	edge16ln	%i5,	%l4,	%o2
	wr	%g0,	0x19,	%asi
	stha	%g1,	[%l7 + 0x4E] %asi
	movne	%xcc,	%g6,	%o1
	movre	%o7,	0x227,	%g7
	srl	%l5,	%o3,	%i4
	fsrc1	%f16,	%f14
	sethi	0x17C4,	%i2
	mulscc	%i0,	%l1,	%g4
	mulscc	%l2,	%i7,	%l0
	fnot1	%f12,	%f22
	fandnot2s	%f24,	%f7,	%f24
	st	%f3,	[%l7 + 0x50]
	sdiv	%o6,	0x0279,	%i6
	movvc	%xcc,	%i1,	%g3
	fmovrsgz	%o5,	%f9,	%f12
	fbul	%fcc0,	loop_2579
	fone	%f4
	movleu	%xcc,	%l3,	%g2
	ldd	[%l7 + 0x48],	%i6
loop_2579:
	or	%o4,	0x0017,	%o0
	addccc	%g5,	%i3,	%l4
	subcc	%i5,	%o2,	%g6
	addcc	%g1,	0x0902,	%o1
	wr	%g0,	0x10,	%asi
	lduwa	[%l7 + 0x18] %asi,	%g7
	bneg,a	loop_2580
	movne	%xcc,	%o7,	%l5
	brlz,a	%o3,	loop_2581
	or	%i2,	%i4,	%l1
loop_2580:
	movpos	%icc,	%i0,	%l2
	nop
	fitos	%f4,	%f26
	fstoi	%f26,	%f19
loop_2581:
	xor	%i7,	0x1015,	%l0
	or	%o6,	%g4,	%i6
	fmovsl	%xcc,	%f11,	%f27
	membar	0x1C
	ta	%xcc,	0x0
	movcc	%icc,	%g3,	%i1
	taddcc	%l3,	%g2,	%o5
	xor	%l6,	%o0,	%o4
	ldsh	[%l7 + 0x42],	%g5
	fbule	%fcc2,	loop_2582
	movrlez	%l4,	%i3,	%i5
	edge8	%g6,	%o2,	%o1
	alignaddrl	%g1,	%g7,	%o7
loop_2582:
	edge32l	%l5,	%i2,	%o3
	subcc	%i4,	0x19ED,	%i0
	bvc,pt	%xcc,	loop_2583
	fbug	%fcc2,	loop_2584
	nop
	set	0x0D, %o4
	stb	%l1,	[%l7 + %o4]
	fnor	%f14,	%f10,	%f8
loop_2583:
	movge	%xcc,	%i7,	%l0
loop_2584:
	udivx	%o6,	0x1844,	%g4
	array8	%l2,	%i6,	%g3
	movg	%icc,	%i1,	%l3
	movre	%g2,	0x2A6,	%l6
	membar	0x4B
	fmovrdne	%o0,	%f28,	%f24
	mulscc	%o5,	%g5,	%o4
	fmovrdgz	%l4,	%f18,	%f0
	bne	%icc,	loop_2585
	nop
	setx	0x104E4010,	%l0,	%l6
	st	%l6,	[%l7 + 0x18]
	ld	[%l7 + 0x18],	%fsr
	movle	%icc,	%i3,	%g6
	bn,pt	%xcc,	loop_2586
loop_2585:
	fbue	%fcc0,	loop_2587
	sllx	%o2,	0x17,	%i5
	fmovsg	%xcc,	%f23,	%f11
loop_2586:
	ldd	[%l7 + 0x10],	%f28
loop_2587:
	fxnor	%f8,	%f12,	%f14
	movrlz	%g1,	%o1,	%g7
	movne	%icc,	%o7,	%l5
	tneg	%icc,	0x7
	tgu	%icc,	0x1
	brlz	%i2,	loop_2588
	edge8ln	%i4,	%i0,	%o3
	andncc	%l1,	%i7,	%l0
	fcmple16	%f24,	%f22,	%g4
loop_2588:
	nop
	wr	%g0,	0x89,	%asi
	ldstuba	[%l7 + 0x2C] %asi,	%l2
	popc	0x0A3E,	%i6
	wr	%g0,	0x10,	%asi
	ldstuba	[%l7 + 0x16] %asi,	%g3
	array16	%i1,	%o6,	%l3
	wr	%g0,	0x11,	%asi
	lduwa	[%l7 + 0x20] %asi,	%g2
	tsubcctv	%o0,	0x0E06,	%l6
	nop
	set	0x58, %g6
	stx	%o5,	[%l7 + %g6]
	bpos,a,pn	%xcc,	loop_2589
	sub	%o4,	0x05D8,	%l4
	fnand	%f30,	%f28,	%f30
	fones	%f9
loop_2589:
	subccc	%g5,	%i3,	%o2
	taddcc	%g6,	0x1264,	%g1
	addccc	%o1,	%i5,	%o7
	srlx	%l5,	%g7,	%i4
	brz,a	%i2,	loop_2590
	ta	%icc,	0x1
	sllx	%o3,	%i0,	%l1
	edge8	%l0,	%i7,	%l2
loop_2590:
	alignaddrl	%i6,	%g3,	%g4
	fmovsvs	%xcc,	%f14,	%f26
	fand	%f14,	%f28,	%f28
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	setx loop_2591, %l0, %l1
	jmpl %l1, %o6
	tle	%icc,	0x7
	sir	0x15AF
	wr	%g0,	0x88,	%asi
	stha	%i1,	[%l7 + 0x6A] %asi
loop_2591:
	fones	%f14
	orncc	%g2,	%l3,	%l6
	sir	0x03A8
	fbu	%fcc3,	loop_2592
	sub	%o5,	0x15F4,	%o0
	subc	%l4,	%o4,	%g5
	move	%icc,	%i3,	%g6
loop_2592:
	fmul8x16au	%f4,	%f17,	%f0
	movge	%xcc,	%g1,	%o2
	nop
	setx	loop_2593,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tvs	%icc,	0x0
	sdivx	%i5,	0x1383,	%o1
	movpos	%icc,	%o7,	%l5
loop_2593:
	call	loop_2594
	fbo,a	%fcc1,	loop_2595
	tsubcc	%g7,	0x10BE,	%i2
	tgu	%icc,	0x5
loop_2594:
	edge8ln	%o3,	%i4,	%l1
loop_2595:
	mova	%xcc,	%l0,	%i7
	taddcc	%l2,	%i0,	%g3
	andcc	%g4,	0x1E98,	%o6
	fpsub32s	%f12,	%f19,	%f22
	fpsub32s	%f18,	%f16,	%f11
	fone	%f12
	sethi	0x1375,	%i6
	mulx	%g2,	0x1D24,	%i1
	fnor	%f0,	%f30,	%f2
	edge16	%l6,	%l3,	%o0
	ldsh	[%l7 + 0x4E],	%o5
	umulcc	%o4,	%l4,	%i3
	edge32l	%g5,	%g1,	%g6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsle	%icc,	%f9,	%f14
	edge8l	%i5,	%o2,	%o7
	st	%f19,	[%l7 + 0x44]
	fmovsl	%icc,	%f26,	%f31
	xnor	%o1,	%g7,	%l5
	set	0x4C, %i4
	lduwa	[%l7 + %i4] 0x14,	%i2
	movcc	%xcc,	%o3,	%l1
	prefetch	[%l7 + 0x34],	 0x3
	and	%l0,	%i7,	%i4
	fbue	%fcc1,	loop_2596
	fbuge	%fcc3,	loop_2597
	sll	%i0,	%l2,	%g3
	set	0x41, %o6
	ldsba	[%l7 + %o6] 0x18,	%g4
loop_2596:
	move	%xcc,	%o6,	%i6
loop_2597:
	nop
	wr	%g0,	0x10,	%asi
	lduba	[%l7 + 0x26] %asi,	%i1
	mova	%xcc,	%l6,	%l3
	tvs	%xcc,	0x4
	addc	%g2,	0x05EE,	%o0
	movrlz	%o4,	0x164,	%o5
	popc	0x19FE,	%i3
	fmovrde	%g5,	%f4,	%f2
	addccc	%l4,	0x1772,	%g1
	fnors	%f11,	%f0,	%f3
	movl	%xcc,	%g6,	%o2
	edge32l	%i5,	%o7,	%o1
	fble	%fcc3,	loop_2598
	sdivx	%g7,	0x144A,	%l5
	fornot1	%f8,	%f2,	%f6
	call	loop_2599
loop_2598:
	fmovdleu	%icc,	%f20,	%f26
	fbl	%fcc0,	loop_2600
	tvc	%icc,	0x0
loop_2599:
	tle	%icc,	0x4
	or	%i2,	0x0B0A,	%l1
loop_2600:
	fbe	%fcc2,	loop_2601
	ld	[%l7 + 0x70],	%f12
	bg,pn	%xcc,	loop_2602
	fmovrsgz	%l0,	%f16,	%f29
loop_2601:
	fmovrslz	%o3,	%f8,	%f18
	movgu	%xcc,	%i7,	%i4
loop_2602:
	swap	[%l7 + 0x34],	%l2
	tle	%xcc,	0x5
	fmovs	%f22,	%f14
	stb	%i0,	[%l7 + 0x0C]
	subc	%g4,	0x0A67,	%g3
	nop
	set	0x3E, %o5
	ldsh	[%l7 + %o5],	%o6
	set	0x20, %g3
	prefetcha	[%l7 + %g3] 0x14,	 0x1
	movvc	%icc,	%l6,	%i6
	fpmerge	%f25,	%f26,	%f6
	fmovsneg	%xcc,	%f15,	%f2
	or	%l3,	%g2,	%o4
	tg	%icc,	0x0
	movn	%xcc,	%o0,	%i3
	array16	%g5,	%o5,	%g1
	fsrc1	%f8,	%f30
	xor	%l4,	0x1914,	%g6
	wr	%g0,	0x80,	%asi
	stxa	%i5,	[%l7 + 0x10] %asi
	tleu	%xcc,	0x5
	bn,a,pt	%icc,	loop_2603
	fnor	%f22,	%f22,	%f10
	ldx	[%l7 + 0x50],	%o7
	subccc	%o2,	%o1,	%l5
loop_2603:
	array8	%g7,	%l1,	%l0
	fcmpeq32	%f8,	%f20,	%o3
	fmovdgu	%xcc,	%f14,	%f2
	wr	%g0,	0x19,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	smul	%i2,	0x1900,	%i4
	fpsub16	%f8,	%f20,	%f30
	movvs	%xcc,	%l2,	%i7
	umulcc	%g4,	%i0,	%g3
	tvs	%icc,	0x2
	set	0x0B, %g2
	ldsba	[%l7 + %g2] 0x81,	%o6
	subccc	%i1,	%i6,	%l3
	nop
	fitod	%f12,	%f18
	fdtox	%f18,	%f14
	fxtod	%f14,	%f18
	fba	%fcc1,	loop_2604
	tle	%icc,	0x4
	tsubcc	%g2,	%o4,	%l6
	tl	%icc,	0x0
loop_2604:
	fbule,a	%fcc0,	loop_2605
	movleu	%icc,	%o0,	%i3
	tcc	%xcc,	0x3
	nop
	setx loop_2606, %l0, %l1
	jmpl %l1, %o5
loop_2605:
	smulcc	%g5,	%l4,	%g1
	movvc	%xcc,	%g6,	%o7
	movle	%xcc,	%i5,	%o1
loop_2606:
	sll	%o2,	0x0E,	%g7
	edge16n	%l1,	%l0,	%o3
	movgu	%xcc,	%i2,	%l5
	edge8ln	%l2,	%i4,	%g4
	taddcctv	%i7,	0x0266,	%g3
	sethi	0x0B48,	%o6
	set	0x59, %g1
	stba	%i0,	[%l7 + %g1] 0x23
	membar	#Sync
	and	%i6,	0x11C6,	%i1
	ble,pt	%xcc,	loop_2607
	edge8l	%l3,	%o4,	%g2
	bl,pt	%icc,	loop_2608
	nop
	fitos	%f1,	%f0
	fstoi	%f0,	%f2
loop_2607:
	tcs	%icc,	0x6
	tleu	%xcc,	0x0
loop_2608:
	nop
	setx	0x98116AEC,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f15
	setx	0xD1A15D3F,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f25
	fdivs	%f25,	%f15,	%f5
	fbug	%fcc0,	loop_2609
	movvs	%xcc,	%o0,	%l6
	srax	%i3,	0x0B,	%o5
	wr	%g0,	0x0c,	%asi
	lduwa	[%l7 + 0x50] %asi,	%g5
loop_2609:
	tcc	%xcc,	0x4
	array8	%g1,	%g6,	%o7
	edge16n	%i5,	%o1,	%o2
	nop
	setx loop_2610, %l0, %l1
	jmpl %l1, %l4
	tleu	%xcc,	0x1
	bleu,a,pt	%xcc,	loop_2611
	fornot2s	%f30,	%f22,	%f3
loop_2610:
	fmovsle	%xcc,	%f4,	%f10
	tsubcctv	%g7,	%l0,	%o3
loop_2611:
	sdivx	%l1,	0x16CD,	%i2
	fmovdvc	%icc,	%f23,	%f22
	sdivx	%l5,	0x10BF,	%i4
	edge32	%l2,	%g4,	%i7
	xnor	%g3,	0x0DFD,	%i0
	srl	%i6,	%o6,	%l3
	fmul8x16	%f18,	%f2,	%f0
	nop
	setx	0x3C66EDC2FA255F06,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	fsqrtd	%f14,	%f30
	set	0x3E, %l1
	stha	%o4,	[%l7 + %l1] 0x19
	faligndata	%f18,	%f20,	%f28
	movgu	%xcc,	%g2,	%i1
	edge8n	%l6,	%i3,	%o0
	movrgez	%g5,	0x252,	%g1
	fmovde	%xcc,	%f19,	%f22
	movpos	%icc,	%g6,	%o7
	movle	%icc,	%o5,	%i5
	srax	%o1,	%l4,	%g7
	stb	%l0,	[%l7 + 0x6B]
	edge8n	%o2,	%l1,	%i2
	bne	%xcc,	loop_2612
	fnegd	%f4,	%f14
	ba,a	loop_2613
	movrgez	%l5,	0x25A,	%o3
loop_2612:
	umulcc	%l2,	0x1BDC,	%i4
	movl	%icc,	%g4,	%g3
loop_2613:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tge	%icc,	0x1
	ldsw	[%l7 + 0x60],	%i0
	movrlez	%i7,	0x311,	%o6
	brlz,a	%l3,	loop_2614
	mova	%icc,	%o4,	%g2
	fexpand	%f12,	%f30
	bne,a,pt	%xcc,	loop_2615
loop_2614:
	edge8n	%i1,	%l6,	%i3
	nop
	setx	0xC04C76B4,	%l0,	%l6
	st	%l6,	[%l7 + 0x3C]
	ld	[%l7 + 0x3C],	%fsr
	fpsub16s	%f17,	%f30,	%f7
loop_2615:
	taddcc	%o0,	%g5,	%i6
	be,a	loop_2616
	movge	%xcc,	%g6,	%g1
	wr	%g0,	0x89,	%asi
	stba	%o5,	[%l7 + 0x57] %asi
loop_2616:
	movl	%xcc,	%o7,	%o1
	andncc	%i5,	%l4,	%l0
	movle	%icc,	%o2,	%g7
	fxor	%f16,	%f0,	%f20
	fxnor	%f10,	%f18,	%f18
	membar	0x29
	fbge,a	%fcc3,	loop_2617
	ldsw	[%l7 + 0x60],	%i2
	mova	%xcc,	%l5,	%o3
	tleu	%icc,	0x5
loop_2617:
	fmovda	%xcc,	%f8,	%f23
	edge16ln	%l1,	%l2,	%i4
	orn	%g4,	0x1D52,	%i0
	ldub	[%l7 + 0x3A],	%i7
	subc	%o6,	0x0A8D,	%g3
	tl	%xcc,	0x7
	array16	%o4,	%l3,	%g2
	movrlz	%l6,	0x303,	%i1
	fcmpeq32	%f28,	%f30,	%i3
	movrgez	%o0,	0x28C,	%g5
	tvc	%icc,	0x2
	xnor	%g6,	%g1,	%i6
	fmovs	%f29,	%f24
	fmovsne	%xcc,	%f8,	%f14
	nop
	setx	0x44497F0D09E6C17A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0x601493B802E8FAB2,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	fsubd	%f14,	%f14,	%f10
	sth	%o5,	[%l7 + 0x72]
	nop
	set	0x40, %i7
	ldx	[%l7 + %i7],	%o1
	wr	%g0,	0x04,	%asi
	lda	[%l7 + 0x74] %asi,	%f18
	tvc	%xcc,	0x7
	orcc	%i5,	%o7,	%l0
	popc	%l4,	%o2
	stx	%g7,	[%l7 + 0x20]
	move	%icc,	%l5,	%o3
	tcc	%icc,	0x1
	ldsb	[%l7 + 0x6B],	%i2
	array32	%l2,	%i4,	%g4
	tcs	%xcc,	0x6
	addcc	%l1,	%i7,	%i0
	udivx	%o6,	0x085F,	%g3
	fbne,a	%fcc2,	loop_2618
	mova	%icc,	%l3,	%o4
	edge8	%l6,	%i1,	%g2
	fmovdgu	%icc,	%f11,	%f14
loop_2618:
	edge32ln	%i3,	%o0,	%g5
	fxors	%f24,	%f3,	%f1
	edge8ln	%g6,	%g1,	%o5
	edge8ln	%o1,	%i6,	%i5
	fmovdcs	%icc,	%f7,	%f13
	taddcctv	%l0,	%o7,	%l4
	bpos	%xcc,	loop_2619
	orn	%o2,	0x1BC5,	%l5
	tcs	%icc,	0x7
	fbg	%fcc0,	loop_2620
loop_2619:
	nop
	set	0x6A, %o1
	sth	%o3,	[%l7 + %o1]
	srax	%g7,	0x1C,	%i2
	movne	%icc,	%i4,	%l2
loop_2620:
	sethi	0x02BD,	%l1
	movleu	%icc,	%g4,	%i7
	nop
	setx loop_2621, %l0, %l1
	jmpl %l1, %o6
	sdiv	%g3,	0x05C8,	%i0
	xor	%l3,	%o4,	%i1
	bn	%icc,	loop_2622
loop_2621:
	movcs	%xcc,	%g2,	%l6
	stw	%o0,	[%l7 + 0x30]
	add	%g5,	%i3,	%g6
loop_2622:
	stw	%o5,	[%l7 + 0x58]
	umul	%o1,	0x033B,	%g1
	fbl,a	%fcc3,	loop_2623
	movne	%xcc,	%i5,	%i6
	fpadd32	%f24,	%f30,	%f26
	movrlez	%l0,	%o7,	%o2
loop_2623:
	alignaddr	%l4,	%o3,	%l5
	udivcc	%i2,	0x0814,	%g7
	set	0x20, %o0
	lduba	[%l7 + %o0] 0x0c,	%l2
	udivx	%l1,	0x0AE9,	%g4
	taddcc	%i4,	%i7,	%g3
	set	0x18, %g5
	stwa	%i0,	[%l7 + %g5] 0x81
	movpos	%xcc,	%l3,	%o6
	fsrc2	%f10,	%f20
	bge	loop_2624
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldub	[%l7 + 0x3A],	%o4
	fmovsle	%xcc,	%f11,	%f12
loop_2624:
	tpos	%xcc,	0x6
	fbn,a	%fcc0,	loop_2625
	sdiv	%g2,	0x1C58,	%i1
	array8	%o0,	%g5,	%i3
	tne	%icc,	0x6
loop_2625:
	subccc	%l6,	0x0A20,	%o5
	edge8n	%g6,	%g1,	%i5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addcc	%o1,	%l0,	%i6
	nop
	setx	0x8D75034F,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f21
	fsqrts	%f21,	%f7
	wr	%g0,	0x81,	%asi
	stba	%o2,	[%l7 + 0x71] %asi
	sir	0x10F5
	movle	%xcc,	%l4,	%o3
	lduh	[%l7 + 0x12],	%l5
	fbge,a	%fcc0,	loop_2626
	tpos	%icc,	0x5
	fmovrdgez	%i2,	%f6,	%f30
	edge16	%o7,	%l2,	%l1
loop_2626:
	prefetch	[%l7 + 0x7C],	 0x1
	tleu	%xcc,	0x3
	sethi	0x0E09,	%g4
	movpos	%icc,	%g7,	%i7
	fmul8x16	%f15,	%f0,	%f14
	tvc	%xcc,	0x2
	brgz	%g3,	loop_2627
	nop
	fitos	%f8,	%f27
	fstox	%f27,	%f26
	fxors	%f10,	%f28,	%f18
	umul	%i4,	0x1E78,	%i0
loop_2627:
	fnot1s	%f18,	%f14
	edge16ln	%o6,	%l3,	%g2
	xor	%o4,	%i1,	%g5
	tne	%icc,	0x5
	fcmpne16	%f6,	%f26,	%i3
	movle	%icc,	%o0,	%l6
	orncc	%g6,	%o5,	%i5
	taddcctv	%g1,	0x13AC,	%o1
	nop
	setx	0x61F2764E20453415,	%l0,	%l6
	stx	%l6,	[%l7 + 0x40]
	ldx	[%l7 + 0x40],	%fsr
	wr	%g0,	0x80,	%asi
	ldxa	[%l7 + 0x78] %asi,	%i6
	edge8n	%l0,	%o2,	%o3
	array8	%l4,	%l5,	%i2
	fbue	%fcc3,	loop_2628
	sll	%o7,	0x04,	%l2
	nop
	setx	0x27225DF6,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f18
	fsqrts	%f18,	%f27
	fpack16	%f24,	%f9
loop_2628:
	fcmpeq16	%f22,	%f14,	%g4
	xorcc	%l1,	0x093C,	%g7
	fmovrslz	%g3,	%f17,	%f23
	movvs	%icc,	%i4,	%i0
	wr	%g0,	0x10,	%asi
	lduwa	[%l7 + 0x64] %asi,	%i7
	edge8n	%l3,	%g2,	%o6
	ldd	[%l7 + 0x60],	%i0
	fbne,a	%fcc1,	loop_2629
	bge,a	loop_2630
	fmovdleu	%xcc,	%f15,	%f2
	mulscc	%o4,	0x11C2,	%i3
loop_2629:
	movge	%icc,	%o0,	%l6
loop_2630:
	fmovdcs	%icc,	%f13,	%f0
	tl	%xcc,	0x2
	set	0x74, %l3
	lduwa	[%l7 + %l3] 0x04,	%g6
	alignaddr	%g5,	%o5,	%i5
	alignaddrl	%g1,	%o1,	%i6
	for	%f14,	%f2,	%f16
	stw	%o2,	[%l7 + 0x64]
	set	0x63, %l2
	lduba	[%l7 + %l2] 0x04,	%l0
	edge8l	%o3,	%l4,	%l5
	edge32n	%o7,	%l2,	%g4
	fmovdpos	%xcc,	%f3,	%f7
	brlz	%l1,	loop_2631
	movl	%icc,	%i2,	%g3
	alignaddrl	%i4,	%g7,	%i0
	srl	%i7,	%g2,	%o6
loop_2631:
	xnorcc	%l3,	%o4,	%i3
	stw	%i1,	[%l7 + 0x6C]
	fmul8x16al	%f9,	%f23,	%f30
	movcc	%xcc,	%o0,	%l6
	movleu	%icc,	%g5,	%g6
	fmul8sux16	%f28,	%f16,	%f30
	tpos	%xcc,	0x7
	fcmpgt32	%f10,	%f20,	%o5
	fcmple16	%f22,	%f4,	%i5
	popc	%g1,	%i6
	edge8ln	%o1,	%o2,	%o3
	andcc	%l0,	%l5,	%o7
	alignaddrl	%l2,	%l4,	%l1
	movvs	%xcc,	%g4,	%i2
	smul	%i4,	0x1F85,	%g3
	tpos	%icc,	0x5
	nop
	setx	0xE8BD8BC6,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f20
	setx	0xFE0DD163,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f28
	fmuls	%f28,	%f20,	%f10
	set	0x5C, %o7
	lda	[%l7 + %o7] 0x89,	%f12
	srl	%i0,	%i7,	%g2
	movne	%icc,	%g7,	%l3
	tvc	%icc,	0x2
	edge16ln	%o6,	%i3,	%i1
	fpadd16	%f10,	%f20,	%f14
	fand	%f8,	%f28,	%f14
	edge16ln	%o0,	%l6,	%g5
	edge32ln	%g6,	%o4,	%i5
	fornot2s	%f29,	%f0,	%f9
	taddcc	%o5,	0x1CEA,	%i6
	movleu	%icc,	%g1,	%o1
	sethi	0x134C,	%o2
	xnorcc	%o3,	%l0,	%o7
	fandnot2s	%f13,	%f2,	%f0
	and	%l5,	0x0EFD,	%l4
	ldsb	[%l7 + 0x6B],	%l2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	setx	0xE1B6593D,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f11
	fsqrts	%f11,	%f14
	fmovdge	%icc,	%f31,	%f12
	nop
	fitos	%f1,	%f23
	fstox	%f23,	%f20
	fxtos	%f20,	%f23
	edge8	%l1,	%i2,	%i4
	umulcc	%g3,	0x1C0C,	%g4
	addccc	%i0,	0x1576,	%i7
	sllx	%g2,	%l3,	%g7
	fmovsn	%xcc,	%f8,	%f25
	smulcc	%i3,	0x0DC7,	%i1
	brz,a	%o0,	loop_2632
	movg	%xcc,	%l6,	%g5
	nop
	setx	0x3D53E28A,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f1
	setx	0x5534198E,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f16
	fsubs	%f16,	%f1,	%f15
	bne,a	%xcc,	loop_2633
loop_2632:
	taddcc	%o6,	%o4,	%i5
	xnorcc	%g6,	0x063F,	%i6
	tne	%icc,	0x4
loop_2633:
	movrgez	%o5,	%o1,	%o2
	fmovsge	%icc,	%f7,	%f2
	sll	%g1,	0x16,	%o3
	set	0x70, %i0
	swapa	[%l7 + %i0] 0x04,	%o7
	edge16ln	%l5,	%l4,	%l2
	tpos	%icc,	0x0
	tvc	%xcc,	0x1
	tcs	%xcc,	0x6
	fmovsleu	%icc,	%f24,	%f25
	movpos	%xcc,	%l1,	%i2
	smul	%i4,	0x0311,	%l0
	alignaddrl	%g4,	%g3,	%i7
	edge16	%g2,	%i0,	%g7
	fmovdgu	%xcc,	%f18,	%f10
	bvc,a,pt	%xcc,	loop_2634
	brlz	%i3,	loop_2635
	umulcc	%i1,	%l3,	%o0
	addc	%g5,	0x0369,	%l6
loop_2634:
	fnegd	%f24,	%f2
loop_2635:
	fbule	%fcc0,	loop_2636
	movrlez	%o6,	0x258,	%o4
	orn	%i5,	%i6,	%o5
	wr	%g0,	0x80,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
loop_2636:
	prefetch	[%l7 + 0x20],	 0x2
	set	0x20, %l5
	ldswa	[%l7 + %l5] 0x80,	%o1
	add	%l7,	0x68,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%g6
	casxa	[%l6] %asi,	%g6,	%g1
	brlz,a	%o2,	loop_2637
	addcc	%o3,	%l5,	%l4
	wr	%g0,	0x81,	%asi
	lduha	[%l7 + 0x0E] %asi,	%l2
loop_2637:
	fnands	%f19,	%f2,	%f17
	fbo,a	%fcc2,	loop_2638
	fbu	%fcc2,	loop_2639
	or	%o7,	0x05AC,	%i2
	array8	%i4,	%l1,	%l0
loop_2638:
	movrgez	%g4,	%g3,	%i7
loop_2639:
	ldsw	[%l7 + 0x4C],	%i0
	udiv	%g2,	0x19E0,	%i3
	srax	%i1,	0x0B,	%l3
	subc	%g7,	%g5,	%o0
	mova	%xcc,	%l6,	%o6
	fmovsn	%xcc,	%f7,	%f31
	sir	0x1D0A
	set	0x4C, %o3
	stba	%o4,	[%l7 + %o3] 0x22
	membar	#Sync
	fble	%fcc3,	loop_2640
	edge8n	%i5,	%i6,	%o1
	xorcc	%g6,	%o5,	%g1
	tn	%icc,	0x5
loop_2640:
	fpadd32	%f4,	%f8,	%f16
	edge16	%o2,	%o3,	%l5
	movrgz	%l4,	%o7,	%l2
	addc	%i4,	%l1,	%i2
	fbge,a	%fcc0,	loop_2641
	or	%g4,	%g3,	%l0
	fabss	%f6,	%f7
	xnor	%i7,	%i0,	%g2
loop_2641:
	flush	%l7 + 0x60
	tcc	%icc,	0x3
	fcmpgt16	%f4,	%f20,	%i1
	brgz,a	%i3,	loop_2642
	fbe,a	%fcc1,	loop_2643
	bgu,a	loop_2644
	tcs	%xcc,	0x4
loop_2642:
	nop
	set	0x74, %o2
	stw	%g7,	[%l7 + %o2]
loop_2643:
	addccc	%g5,	%o0,	%l6
loop_2644:
	nop
	fitos	%f3,	%f18
	fstod	%f18,	%f6
	tcc	%xcc,	0x7
	movl	%xcc,	%l3,	%o6
	tcs	%xcc,	0x0
	subccc	%o4,	0x022C,	%i6
	mova	%xcc,	%i5,	%o1
	bne,a,pt	%xcc,	loop_2645
	edge8l	%o5,	%g1,	%o2
	movcc	%xcc,	%g6,	%l5
	movleu	%xcc,	%o3,	%l4
loop_2645:
	pdist	%f18,	%f12,	%f14
	bn,a,pt	%xcc,	loop_2646
	brlz	%o7,	loop_2647
	nop
	setx	0xDC183548,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f0
	setx	0xA06C3615,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f15
	fmuls	%f15,	%f0,	%f6
	tl	%icc,	0x6
loop_2646:
	nop
	setx	0xC567DD6F,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f28
	setx	0x08D98690,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f13
	fadds	%f13,	%f28,	%f21
loop_2647:
	te	%icc,	0x0
	fmovsgu	%xcc,	%f31,	%f5
	alignaddrl	%i4,	%l1,	%l2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fabss	%f11,	%f17
	fcmple16	%f16,	%f6,	%i2
	movrlz	%g3,	%l0,	%g4
	tvs	%icc,	0x1
	edge8ln	%i7,	%i0,	%i1
	tn	%xcc,	0x1
	bpos,a	loop_2648
	subcc	%i3,	0x0DCE,	%g7
	xorcc	%g2,	%g5,	%l6
	orcc	%l3,	0x097F,	%o0
loop_2648:
	bl,a	loop_2649
	swap	[%l7 + 0x0C],	%o6
	sdivx	%i6,	0x035A,	%i5
	tl	%icc,	0x7
loop_2649:
	fpadd16	%f18,	%f10,	%f18
	lduw	[%l7 + 0x5C],	%o1
	alignaddr	%o5,	%g1,	%o4
	fnands	%f16,	%f14,	%f21
	tsubcc	%o2,	%l5,	%o3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ta	%xcc,	0x1
	edge32l	%g6,	%o7,	%i4
	tcc	%xcc,	0x5
	tneg	%xcc,	0x4
	wr	%g0,	0x80,	%asi
	lduwa	[%l7 + 0x54] %asi,	%l4
	udiv	%l1,	0x1A4E,	%i2
	stw	%g3,	[%l7 + 0x6C]
	fbug	%fcc0,	loop_2650
	xor	%l0,	0x1745,	%l2
	bvc	loop_2651
	andcc	%i7,	%g4,	%i0
loop_2650:
	tvs	%xcc,	0x7
	alignaddrl	%i3,	%i1,	%g2
loop_2651:
	fbne,a	%fcc2,	loop_2652
	mulscc	%g7,	%g5,	%l6
	move	%xcc,	%l3,	%o0
	stw	%i6,	[%l7 + 0x38]
loop_2652:
	tpos	%icc,	0x2
	movg	%icc,	%i5,	%o6
	ldsw	[%l7 + 0x08],	%o5
	wr	%g0,	0x19,	%asi
	lduwa	[%l7 + 0x70] %asi,	%g1
	tcs	%xcc,	0x6
	tl	%icc,	0x1
	udiv	%o4,	0x041C,	%o2
	sub	%l5,	0x1121,	%o1
	fpack32	%f26,	%f2,	%f4
	fbul,a	%fcc0,	loop_2653
	nop
	setx	0xAF166073283C96DF,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	fsqrtd	%f18,	%f8
	fones	%f5
	add	%l7,	0x68,	%l6
	wr	%g0,	0x04,	%asi
	ldxa	[%l6] %asi,	%o3
	casxa	[%l6] %asi,	%o3,	%g6
loop_2653:
	movneg	%icc,	%o7,	%i4
	nop
	setx	0x54FEB5BC,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f0
	setx	0xE22D7F60,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f9
	fsubs	%f9,	%f0,	%f14
	movg	%xcc,	%l4,	%i2
	tge	%xcc,	0x7
	mova	%icc,	%g3,	%l1
	nop
	setx	0xA6389724,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f4
	setx	0xB7D881A8,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f29
	fadds	%f29,	%f4,	%f5
	fnot1	%f6,	%f16
	sllx	%l0,	%l2,	%i7
	movrlez	%i0,	0x2AF,	%g4
	fbuge,a	%fcc0,	loop_2654
	fone	%f6
	set	0x5F, %g7
	ldstuba	[%l7 + %g7] 0x04,	%i1
loop_2654:
	tcc	%xcc,	0x5
	tsubcc	%g2,	0x059D,	%i3
	move	%icc,	%g7,	%g5
	sub	%l6,	%l3,	%i6
	orcc	%o0,	0x1A0D,	%o6
	udivcc	%i5,	0x1982,	%o5
	fmovdn	%xcc,	%f5,	%f22
	bpos	loop_2655
	pdist	%f0,	%f22,	%f24
	xorcc	%g1,	0x0183,	%o4
	fmul8ulx16	%f4,	%f22,	%f14
loop_2655:
	subc	%o2,	%o1,	%l5
	bcs	%icc,	loop_2656
	fmovdn	%xcc,	%f26,	%f7
	array32	%g6,	%o7,	%i4
	sra	%l4,	%i2,	%o3
loop_2656:
	fbule	%fcc3,	loop_2657
	edge8n	%g3,	%l0,	%l2
	addcc	%i7,	%i0,	%l1
	fmovsneg	%icc,	%f22,	%f27
loop_2657:
	nop
	setx	0x8B2495F7,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f24
	setx	0x714FEE5C,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f25
	fsubs	%f25,	%f24,	%f3
	fnands	%f19,	%f23,	%f26
	set	0x2C, %i3
	ldswa	[%l7 + %i3] 0x88,	%i1
	movvs	%icc,	%g4,	%i3
	tneg	%xcc,	0x1
	xnor	%g7,	%g5,	%g2
	ldsw	[%l7 + 0x44],	%l3
	mova	%icc,	%l6,	%i6
	smulcc	%o0,	%i5,	%o5
	fxors	%f2,	%f22,	%f25
	sdiv	%g1,	0x064F,	%o4
	mulscc	%o6,	0x1F74,	%o1
	wr	%g0,	0x80,	%asi
	lduwa	[%l7 + 0x74] %asi,	%o2
	swap	[%l7 + 0x78],	%l5
	mulx	%g6,	%o7,	%i4
	bg	%icc,	loop_2658
	nop
	fitod	%f6,	%f20
	fdtoi	%f20,	%f15
	fmovscc	%xcc,	%f25,	%f1
	nop
	fitod	%f7,	%f14
loop_2658:
	movrgz	%l4,	%i2,	%g3
	ldd	[%l7 + 0x70],	%f26
	fmovde	%xcc,	%f11,	%f21
	addc	%l0,	%l2,	%i7
	andncc	%o3,	%l1,	%i0
	nop
	setx	0x6071A6C3,	%l0,	%l6
	st	%l6,	[%l7 + 0x58]
	ld	[%l7 + 0x58],	%fsr
	edge16l	%g4,	%i1,	%g7
	sllx	%i3,	%g5,	%l3
	membar	0x62
	tgu	%icc,	0x1
	movn	%icc,	%l6,	%g2
	orcc	%i6,	%o0,	%i5
	edge8l	%o5,	%g1,	%o6
	xnorcc	%o1,	0x0B07,	%o4
	taddcctv	%l5,	0x15BC,	%g6
	fmovsge	%xcc,	%f18,	%f25
	fmovdn	%xcc,	%f23,	%f9
	nop
	setx	0x015A206B87201321,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0xE88E80BFC0032BB9,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	fdivd	%f6,	%f16,	%f14
	set	0x70, %i1
	lduwa	[%l7 + %i1] 0x81,	%o2
	alignaddr	%o7,	%i4,	%l4
	tvs	%xcc,	0x7
	andn	%g3,	%i2,	%l0
	call	loop_2659
	smulcc	%i7,	%l2,	%o3
	tneg	%icc,	0x6
	edge32ln	%i0,	%l1,	%g4
loop_2659:
	nop
	setx	0xD12065AD,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f10
	setx	0xA0506566,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f5
	fmuls	%f5,	%f10,	%f24
	sllx	%i1,	%i3,	%g5
	edge8n	%g7,	%l6,	%g2
	add	%l3,	0x0672,	%o0
	subccc	%i6,	%i5,	%g1
	bcs,a,pn	%icc,	loop_2660
	alignaddrl	%o5,	%o6,	%o4
	orn	%o1,	%l5,	%o2
	fmul8x16	%f18,	%f8,	%f28
loop_2660:
	nop
	fitos	%f10,	%f15
	fstoi	%f15,	%f2
	movneg	%xcc,	%o7,	%i4
	nop
	fitod	%f12,	%f8
	fdtoi	%f8,	%f22
	bg,pt	%icc,	loop_2661
	std	%f24,	[%l7 + 0x10]
	edge8n	%l4,	%g3,	%i2
	addcc	%l0,	0x1BC2,	%g6
loop_2661:
	fblg,a	%fcc3,	loop_2662
	taddcctv	%i7,	0x17FA,	%o3
	set	0x2D, %l4
	ldsba	[%l7 + %l4] 0x88,	%i0
loop_2662:
	nop
	add	%l7,	0x70,	%l6
	wr	%g0,	0x10,	%asi
	ldxa	[%l6] %asi,	%l2
	casxa	[%l6] 0x10,	%l2,	%g4
	te	%icc,	0x7
	nop
	setx	0x9BCF6AF6D0644E75,	%l0,	%l6
	stx	%l6,	[%l7 + 0x18]
	ldx	[%l7 + 0x18],	%fsr
	udivcc	%i1,	0x0B89,	%l1
	tneg	%xcc,	0x5
	ble,a	loop_2663
	fmovrdgz	%i3,	%f0,	%f30
	wr	%g0,	0x80,	%asi
	lduha	[%l7 + 0x0C] %asi,	%g5
loop_2663:
	movrne	%g7,	%g2,	%l6
	brgez	%o0,	loop_2664
	fbug	%fcc3,	loop_2665
	fxor	%f24,	%f28,	%f26
	or	%l3,	%i5,	%i6
loop_2664:
	nop
	wr	%g0,	0x80,	%asi
	ldstuba	[%l7 + 0x4C] %asi,	%g1
loop_2665:
	fmovsl	%icc,	%f22,	%f20
	tleu	%xcc,	0x3
	xnor	%o6,	0x1F0A,	%o5
	array16	%o4,	%l5,	%o1
	fblg	%fcc0,	loop_2666
	xor	%o7,	0x1D45,	%o2
	tle	%icc,	0x5
	andn	%i4,	0x0232,	%l4
loop_2666:
	mova	%icc,	%i2,	%l0
	umul	%g3,	0x039B,	%g6
	tne	%icc,	0x7
	movpos	%icc,	%i7,	%o3
	movrlez	%i0,	0x0B8,	%l2
	bshuffle	%f20,	%f20,	%f8
	brgez	%g4,	loop_2667
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpadd16s	%f29,	%f29,	%f11
	movcs	%xcc,	%i1,	%l1
loop_2667:
	movgu	%xcc,	%i3,	%g7
	fmovdn	%icc,	%f17,	%f19
	umul	%g5,	0x09B5,	%g2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bvc,a,pt	%icc,	loop_2668
	movvs	%icc,	%o0,	%l6
	array16	%i5,	%l3,	%i6
	nop
	fitos	%f0,	%f26
loop_2668:
	edge32ln	%o6,	%o5,	%o4
	nop
	fitos	%f11,	%f26
	fstox	%f26,	%f20
	taddcctv	%g1,	%l5,	%o1
	tle	%xcc,	0x4
	fmovsleu	%icc,	%f30,	%f12
	movn	%xcc,	%o2,	%o7
	movrgz	%i4,	0x122,	%i2
	fmuld8ulx16	%f0,	%f2,	%f10
	bvs,pt	%icc,	loop_2669
	andncc	%l4,	%g3,	%g6
	fmovsneg	%icc,	%f31,	%f10
	movcs	%xcc,	%i7,	%o3
loop_2669:
	fpsub16s	%f27,	%f17,	%f27
	xorcc	%i0,	0x14BF,	%l2
	edge16	%g4,	%l0,	%i1
	fbg	%fcc3,	loop_2670
	bneg	loop_2671
	fbe	%fcc0,	loop_2672
	membar	0x3F
loop_2670:
	ld	[%l7 + 0x48],	%f5
loop_2671:
	lduw	[%l7 + 0x20],	%l1
loop_2672:
	edge16ln	%g7,	%g5,	%g2
	mova	%icc,	%i3,	%o0
	fbu,a	%fcc2,	loop_2673
	umul	%l6,	0x01EB,	%l3
	movvs	%xcc,	%i5,	%o6
	alignaddrl	%i6,	%o5,	%o4
loop_2673:
	taddcctv	%g1,	0x009F,	%o1
	nop
	fitos	%f6,	%f3
	fstox	%f3,	%f4
	srlx	%l5,	%o2,	%o7
	fmovrsgz	%i4,	%f11,	%f28
	ta	%icc,	0x7
	nop
	setx	0x30303544,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f3
	setx	0xA107E487,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f13
	fadds	%f13,	%f3,	%f23
	fmovsvc	%xcc,	%f26,	%f15
	brgez	%l4,	loop_2674
	fbue	%fcc3,	loop_2675
	mova	%xcc,	%i2,	%g6
	array8	%i7,	%g3,	%o3
loop_2674:
	movl	%xcc,	%l2,	%i0
loop_2675:
	movrne	%l0,	0x223,	%g4
	fmovsne	%xcc,	%f1,	%f10
	or	%l1,	%i1,	%g7
	orncc	%g5,	%i3,	%o0
	fcmpeq16	%f8,	%f2,	%l6
	sdivx	%l3,	0x1F3F,	%i5
	fandnot2	%f26,	%f28,	%f24
	sdivcc	%g2,	0x17E9,	%o6
	bneg,pn	%xcc,	loop_2676
	fbg	%fcc3,	loop_2677
	nop
	setx	0x09FCC4C16D64234E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	setx	0x6CB4608614AE3496,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fdivd	%f0,	%f18,	%f20
	call	loop_2678
loop_2676:
	tvc	%xcc,	0x6
loop_2677:
	movl	%icc,	%o5,	%o4
	bpos,a	loop_2679
loop_2678:
	fbug	%fcc1,	loop_2680
	fmovscs	%xcc,	%f1,	%f22
	fmovrde	%i6,	%f26,	%f18
loop_2679:
	edge32l	%o1,	%g1,	%l5
loop_2680:
	fmovsge	%icc,	%f23,	%f1
	movre	%o2,	%o7,	%l4
	fpsub16s	%f4,	%f0,	%f21
	bne,a,pt	%icc,	loop_2681
	sllx	%i2,	%i4,	%i7
	edge32	%g6,	%g3,	%o3
	subccc	%l2,	%l0,	%i0
loop_2681:
	movrgez	%l1,	%g4,	%i1
	swap	[%l7 + 0x4C],	%g5
	ta	%xcc,	0x5
	xnor	%g7,	%i3,	%o0
	sdivx	%l3,	0x1018,	%l6
	addcc	%i5,	0x16AA,	%o6
	fmovdcs	%icc,	%f11,	%f7
	wr	%g0,	0x11,	%asi
	sta	%f4,	[%l7 + 0x08] %asi
	bge,a,pn	%icc,	loop_2682
	move	%icc,	%g2,	%o5
	udiv	%i6,	0x03D8,	%o1
	orcc	%o4,	%l5,	%o2
loop_2682:
	tneg	%xcc,	0x7
	fmovdg	%xcc,	%f16,	%f24
	movl	%xcc,	%g1,	%l4
	fxors	%f13,	%f1,	%f22
	edge32ln	%o7,	%i4,	%i2
	nop
	fitod	%f8,	%f4
	fdtos	%f4,	%f18
	fbn,a	%fcc0,	loop_2683
	movpos	%icc,	%i7,	%g3
	fpadd32s	%f15,	%f21,	%f14
	mova	%xcc,	%o3,	%l2
loop_2683:
	fmovsvs	%icc,	%f18,	%f19
	taddcctv	%g6,	%l0,	%l1
	orcc	%g4,	0x04C3,	%i0
	udiv	%g5,	0x0760,	%g7
	tg	%icc,	0x1
	tle	%icc,	0x3
	bcc,a	loop_2684
	edge32l	%i3,	%o0,	%i1
	move	%xcc,	%l3,	%i5
	fmovrsne	%o6,	%f11,	%f2
loop_2684:
	smul	%l6,	0x1A38,	%o5
	fpadd16	%f18,	%f8,	%f16
	movrlz	%g2,	0x13E,	%i6
	movneg	%icc,	%o1,	%o4
	fmovsg	%icc,	%f10,	%f30
	fmovsle	%xcc,	%f22,	%f4
	movrgez	%l5,	%g1,	%l4
	fbuge,a	%fcc0,	loop_2685
	movrlez	%o7,	%i4,	%i2
	movrlz	%o2,	0x3CD,	%g3
	srax	%o3,	%i7,	%g6
loop_2685:
	brlz	%l0,	loop_2686
	sth	%l1,	[%l7 + 0x38]
	movl	%xcc,	%g4,	%i0
	std	%f8,	[%l7 + 0x78]
loop_2686:
	edge32n	%l2,	%g7,	%g5
	movleu	%xcc,	%i3,	%i1
	edge8	%o0,	%i5,	%l3
	addc	%o6,	0x0299,	%l6
	fmovrdgz	%o5,	%f8,	%f2
	udiv	%g2,	0x0FC9,	%i6
	edge16ln	%o1,	%o4,	%l5
	movrgez	%g1,	0x116,	%o7
	edge32	%l4,	%i2,	%i4
	udivx	%o2,	0x03DF,	%o3
	movn	%xcc,	%i7,	%g3
	fors	%f8,	%f23,	%f16
	set	0x42, %l0
	stba	%g6,	[%l7 + %l0] 0xea
	membar	#Sync
	fnot1s	%f3,	%f9
	fzero	%f28
	movl	%icc,	%l1,	%l0
	set	0x30, %i5
	ldxa	[%g0 + %i5] 0x50,	%g4
	fbu	%fcc0,	loop_2687
	movg	%icc,	%i0,	%g7
	movrlez	%l2,	%g5,	%i3
	bcs,pn	%icc,	loop_2688
loop_2687:
	udivcc	%o0,	0x1C95,	%i1
	fbule	%fcc3,	loop_2689
	nop
	setx loop_2690, %l0, %l1
	jmpl %l1, %l3
loop_2688:
	fmovdcc	%icc,	%f29,	%f1
	xnor	%o6,	%i5,	%l6
loop_2689:
	be,pt	%xcc,	loop_2691
loop_2690:
	tsubcctv	%g2,	%o5,	%i6
	nop
	setx	0x685988801CEA3F1D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0x9B9B637586F5BE9D,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	faddd	%f14,	%f2,	%f12
	tg	%icc,	0x5
loop_2691:
	srlx	%o1,	0x17,	%l5
	be,pn	%icc,	loop_2692
	fbu	%fcc2,	loop_2693
	nop
	fitod	%f2,	%f10
	fdtoi	%f10,	%f6
	movvc	%xcc,	%g1,	%o4
loop_2692:
	bcc,a,pt	%xcc,	loop_2694
loop_2693:
	tge	%xcc,	0x5
	add	%l7,	0x10,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] %asi,	%l4,	%i2
loop_2694:
	umulcc	%i4,	%o7,	%o2
	fpadd16	%f24,	%f4,	%f24
	smulcc	%i7,	0x1ACB,	%g3
	movrne	%g6,	0x36D,	%l1
	lduh	[%l7 + 0x7C],	%o3
	udiv	%g4,	0x19A7,	%i0
	set	0x70, %i2
	stha	%l0,	[%l7 + %i2] 0x15
	fmovsa	%xcc,	%f17,	%f29
	nop
	setx	0xD07C113C,	%l0,	%l6
	st	%l6,	[%l7 + 0x30]
	ld	[%l7 + 0x30],	%fsr
	te	%xcc,	0x0
	fpack32	%f8,	%f26,	%f10
	udivx	%l2,	0x0359,	%g5
	wr	%g0,	0x80,	%asi
	ldsba	[%l7 + 0x56] %asi,	%i3
	fsrc1	%f0,	%f30
	ldub	[%l7 + 0x3F],	%g7
	fone	%f30
	fpsub32	%f24,	%f2,	%f16
	nop
	setx	0xF073D42C,	%l0,	%l6
	st	%l6,	[%l7 + 0x54]
	ld	[%l7 + 0x54],	%fsr
	nop
	fitos	%f2,	%f17
	fstox	%f17,	%f12
	swap	[%l7 + 0x68],	%i1
	mulscc	%o0,	0x05F4,	%l3
	bcs	loop_2695
	fnegd	%f14,	%f4
	movle	%icc,	%o6,	%i5
	bcs	loop_2696
loop_2695:
	nop
	setx	0x9628E34EA97716EE,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	fsqrtd	%f10,	%f2
	addc	%l6,	0x09C7,	%o5
	bvs,a	loop_2697
loop_2696:
	movg	%xcc,	%g2,	%o1
	fmovdl	%icc,	%f21,	%f22
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
loop_2697:
	addccc	%i6,	%g1,	%o4
	set	0x40, %l6
	stda	%f16,	[%l7 + %l6] 0x88
loop_2698:
	sethi	0x12A6,	%l4
	tg	%xcc,	0x5
	edge16ln	%l5,	%i2,	%i4
	fsrc1	%f18,	%f6
	set	0x66, %i6
	stba	%o7,	[%l7 + %i6] 0x14
	xnor	%i7,	%g3,	%o2
	movcc	%xcc,	%l1,	%o3
	bvc,a,pt	%icc,	loop_2699
	fmovsle	%icc,	%f26,	%f15
	fmovspos	%icc,	%f8,	%f8
	srax	%g6,	%i0,	%g4
loop_2699:
	edge8ln	%l2,	%g5,	%i3
	fpadd16	%f18,	%f24,	%f4
	movvs	%xcc,	%g7,	%i1
	movl	%icc,	%l0,	%l3
	tle	%xcc,	0x2
	tcs	%icc,	0x2
	fnors	%f27,	%f1,	%f8
	swap	[%l7 + 0x3C],	%o6
	movgu	%xcc,	%i5,	%o0
	nop
	setx	0xC71ED3CA10510DC8,	%l0,	%l6
	stx	%l6,	[%l7 + 0x08]
	ldx	[%l7 + 0x08],	%fsr
	xnorcc	%o5,	%l6,	%o1
	fmovsle	%xcc,	%f19,	%f20
	brgz,a	%g2,	loop_2700
	umulcc	%i6,	%o4,	%l4
	edge32ln	%g1,	%l5,	%i4
	srlx	%o7,	0x1C,	%i7
loop_2700:
	sir	0x0ECC
	nop
	setx	0x5B1FDEBF3FF38B56,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0x9C613456DAF3CDE0,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	fdivd	%f18,	%f20,	%f0
	orncc	%g3,	0x1E42,	%o2
	brgz,a	%i2,	loop_2701
	srl	%l1,	%o3,	%i0
	sll	%g6,	%g4,	%l2
	movcs	%xcc,	%i3,	%g5
loop_2701:
	umul	%i1,	0x015A,	%g7
	edge8ln	%l0,	%o6,	%i5
	andcc	%o0,	0x0D4A,	%o5
	movl	%icc,	%l3,	%o1
	smul	%g2,	%i6,	%o4
	set	0x08, %g4
	stha	%l6,	[%l7 + %g4] 0xeb
	membar	#Sync
	edge16	%l4,	%l5,	%i4
	movrgz	%g1,	%i7,	%o7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andncc	%o2,	%g3,	%l1
	array32	%o3,	%i2,	%i0
	and	%g6,	%g4,	%i3
	fmovde	%xcc,	%f15,	%f29
	bge,pt	%icc,	loop_2702
	sir	0x0B72
	xorcc	%l2,	0x0775,	%g5
	ldsb	[%l7 + 0x14],	%g7
loop_2702:
	ldub	[%l7 + 0x22],	%l0
	udiv	%o6,	0x1BB1,	%i5
	tcs	%xcc,	0x2
	wr	%g0,	0x18,	%asi
	lda	[%l7 + 0x68] %asi,	%f19
	mova	%xcc,	%i1,	%o0
	fbule	%fcc0,	loop_2703
	andcc	%o5,	%l3,	%g2
	andn	%i6,	0x0140,	%o1
	srl	%l6,	0x1F,	%l4
loop_2703:
	udivcc	%o4,	0x0C54,	%l5
	sra	%g1,	0x16,	%i7
	fornot2s	%f10,	%f24,	%f28
	movre	%i4,	%o7,	%o2
	stx	%g3,	[%l7 + 0x50]
	udiv	%o3,	0x1EAF,	%i2
	fcmple16	%f26,	%f30,	%l1
	fmovs	%f7,	%f12
	bshuffle	%f28,	%f8,	%f0
	nop
	setx	0x98A0394E,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f5
	setx	0x50F3EBF7,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f2
	fsubs	%f2,	%f5,	%f4
	edge8ln	%i0,	%g6,	%i3
	tvs	%xcc,	0x4
	ld	[%l7 + 0x14],	%f25
	fmul8x16	%f28,	%f4,	%f4
	popc	0x0480,	%g4
	fbn,a	%fcc0,	loop_2704
	orcc	%g5,	%l2,	%l0
	movge	%xcc,	%g7,	%o6
	mulscc	%i1,	%o0,	%o5
loop_2704:
	tne	%xcc,	0x3
	fcmple32	%f2,	%f10,	%i5
	edge8n	%g2,	%i6,	%o1
	tle	%icc,	0x6
	sir	0x0261
	nop
	setx	0x9E420D7704D02981,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0x428E1AF5EE7A5D9A,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	fdivd	%f22,	%f24,	%f26
	nop
	setx	0x41BB6F60B90298C1,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	fsqrtd	%f24,	%f28
	edge16ln	%l6,	%l3,	%o4
	membar	#Sync
	wr	%g0,	0x1e,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	fpadd32	%f24,	%f18,	%f30
	nop
	setx	0x5E6875A8405D60DE,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldx	[%l7 + 0x28],	%fsr
	faligndata	%f16,	%f20,	%f30
	sir	0x1CCE
	tsubcc	%l4,	0x1AD3,	%l5
	smulcc	%g1,	%i7,	%i4
	alignaddr	%o7,	%g3,	%o2
	fmovscc	%xcc,	%f28,	%f31
	fmovdn	%xcc,	%f1,	%f19
	edge8ln	%o3,	%l1,	%i2
	sdivcc	%g6,	0x065D,	%i0
	udiv	%g4,	0x0950,	%i3
	fmovsgu	%icc,	%f29,	%f24
	fmovdneg	%icc,	%f15,	%f14
	movgu	%xcc,	%g5,	%l2
	orncc	%g7,	%l0,	%i1
	srlx	%o0,	%o5,	%o6
	taddcctv	%g2,	0x145C,	%i5
	ldsh	[%l7 + 0x66],	%o1
	movvs	%icc,	%l6,	%i6
	nop
	fitos	%f8,	%f23
	fstox	%f23,	%f18
	tsubcc	%o4,	%l3,	%l5
	fsrc1	%f22,	%f6
	tge	%icc,	0x4
	movle	%xcc,	%l4,	%i7
	movvc	%xcc,	%g1,	%o7
	nop
	setx	0x5E654CF3D8073948,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	fsqrtd	%f14,	%f28
	xorcc	%i4,	%o2,	%o3
	sdivcc	%l1,	0x1207,	%g3
	bpos,a	%xcc,	loop_2705
	mulx	%i2,	0x10A9,	%i0
	xnorcc	%g6,	0x15FB,	%i3
	tsubcc	%g5,	0x0ED8,	%l2
loop_2705:
	sir	0x1F80
	tpos	%xcc,	0x5
	mulscc	%g4,	%l0,	%i1
	fmovs	%f22,	%f17
	xorcc	%o0,	%o5,	%g7
	brlez	%g2,	loop_2706
	udivcc	%o6,	0x133F,	%o1
	bvc,a,pn	%icc,	loop_2707
	ba,pn	%xcc,	loop_2708
loop_2706:
	srax	%i5,	%i6,	%o4
	tn	%xcc,	0x1
loop_2707:
	nop
	wr	%g0,	0x89,	%asi
	ldda	[%l7 + 0x40] %asi,	%l2
loop_2708:
	bl,pn	%xcc,	loop_2709
	sir	0x1AA0
	tge	%xcc,	0x6
	nop
	setx	0x337B10F9807B1702,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldx	[%l7 + 0x28],	%fsr
loop_2709:
	movpos	%xcc,	%l6,	%l5
	sdiv	%i7,	0x0FFF,	%l4
	movleu	%xcc,	%o7,	%i4
	stbar
	andn	%o2,	%o3,	%l1
	membar	0x24
	subc	%g3,	%i2,	%i0
	tn	%xcc,	0x2
	ldd	[%l7 + 0x48],	%g0
	edge8ln	%g6,	%g5,	%l2
	tsubcctv	%g4,	%l0,	%i3
	alignaddrl	%o0,	%o5,	%g7
	fsrc1	%f16,	%f26
	smulcc	%g2,	0x1FF6,	%i1
	brlez,a	%o1,	loop_2710
	nop
	setx	0x2FB2BFAF004E2D85,	%l0,	%l6
	stx	%l6,	[%l7 + 0x18]
	ldx	[%l7 + 0x18],	%fsr
	fnot1	%f14,	%f14
	prefetch	[%l7 + 0x18],	 0x0
loop_2710:
	subcc	%o6,	%i6,	%o4
	fands	%f26,	%f9,	%f9
	ble,a,pn	%icc,	loop_2711
	tneg	%icc,	0x6
	movvs	%icc,	%l3,	%i5
	stw	%l5,	[%l7 + 0x1C]
loop_2711:
	movvs	%xcc,	%l6,	%i7
	tl	%xcc,	0x1
	smulcc	%o7,	0x1BA1,	%l4
	ta	%icc,	0x3
	fmovd	%f2,	%f0
	bg	loop_2712
	movle	%xcc,	%i4,	%o2
	fpadd32s	%f28,	%f22,	%f28
	bn	%icc,	loop_2713
loop_2712:
	movle	%xcc,	%l1,	%o3
	membar	0x51
	movcc	%xcc,	%g3,	%i0
loop_2713:
	nop
	wr	%g0,	0x0c,	%asi
	ldsba	[%l7 + 0x21] %asi,	%i2
	taddcctv	%g6,	%g1,	%g5
	flush	%l7 + 0x10
	movcc	%icc,	%g4,	%l0
	stbar
	taddcc	%l2,	%o0,	%o5
	fmovdvs	%xcc,	%f24,	%f17
	bvc,a	%icc,	loop_2714
	edge8n	%g7,	%g2,	%i1
	sethi	0x1B7B,	%o1
	fornot1s	%f26,	%f5,	%f28
loop_2714:
	array16	%o6,	%i3,	%o4
	bneg,a,pt	%icc,	loop_2715
	movvc	%icc,	%l3,	%i5
	edge8ln	%l5,	%i6,	%l6
	umulcc	%o7,	0x16AA,	%l4
loop_2715:
	andn	%i4,	0x1A8D,	%o2
	set	0x3C, %g6
	ldswa	[%l7 + %g6] 0x11,	%i7
	set	0x0C, %i4
	stha	%o3,	[%l7 + %i4] 0xeb
	membar	#Sync
	set	0x27, %o6
	stba	%l1,	[%l7 + %o6] 0x27
	membar	#Sync
	mova	%icc,	%i0,	%g3
	bneg,a,pn	%xcc,	loop_2716
	movgu	%xcc,	%g6,	%i2
	fsrc1	%f14,	%f18
	fmovsvc	%icc,	%f1,	%f7
loop_2716:
	fbe	%fcc2,	loop_2717
	bneg,a	loop_2718
	tgu	%xcc,	0x6
	bvs	%icc,	loop_2719
loop_2717:
	movcc	%icc,	%g1,	%g5
loop_2718:
	andcc	%g4,	%l0,	%o0
	array8	%l2,	%o5,	%g7
loop_2719:
	fxnors	%f26,	%f15,	%f25
	ldsb	[%l7 + 0x48],	%i1
	edge8	%g2,	%o1,	%i3
	edge16ln	%o4,	%o6,	%i5
	sdivx	%l5,	0x09B7,	%i6
	addccc	%l6,	0x1380,	%l3
	or	%o7,	%l4,	%o2
	bvc,a,pt	%xcc,	loop_2720
	movle	%icc,	%i7,	%o3
	swap	[%l7 + 0x70],	%i4
	wr	%g0,	0x80,	%asi
	stha	%l1,	[%l7 + 0x62] %asi
loop_2720:
	ble,pn	%icc,	loop_2721
	edge8n	%i0,	%g3,	%g6
	tpos	%icc,	0x7
	sub	%g1,	0x1122,	%i2
loop_2721:
	fbuge	%fcc2,	loop_2722
	fmul8sux16	%f20,	%f8,	%f14
	xnor	%g5,	%l0,	%o0
	alignaddrl	%l2,	%o5,	%g7
loop_2722:
	movl	%icc,	%g4,	%g2
	orncc	%o1,	%i1,	%o4
	tsubcc	%o6,	%i3,	%i5
	nop
	setx loop_2723, %l0, %l1
	jmpl %l1, %i6
	sth	%l6,	[%l7 + 0x40]
	fmovdle	%icc,	%f29,	%f13
	movrlz	%l3,	%l5,	%o7
loop_2723:
	brgz	%l4,	loop_2724
	tge	%icc,	0x5
	edge8	%o2,	%o3,	%i7
	set	0x0C, %o5
	lduwa	[%l7 + %o5] 0x11,	%l1
loop_2724:
	movrlez	%i0,	%i4,	%g3
	ld	[%l7 + 0x58],	%f23
	addc	%g1,	0x04BE,	%i2
	movleu	%icc,	%g5,	%l0
	sub	%g6,	%o0,	%o5
	movrgz	%l2,	%g4,	%g2
	mova	%xcc,	%g7,	%o1
	fbn	%fcc0,	loop_2725
	fmovrsgz	%i1,	%f31,	%f30
	nop
	setx	loop_2726,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fmuld8ulx16	%f11,	%f7,	%f0
loop_2725:
	alignaddr	%o4,	%o6,	%i3
	movrgez	%i5,	0x142,	%i6
loop_2726:
	nop
	fitos	%f0,	%f20
	tpos	%xcc,	0x5
	andncc	%l3,	%l5,	%l6
	taddcctv	%l4,	%o2,	%o7
	fmul8ulx16	%f16,	%f22,	%f8
	fxnors	%f25,	%f19,	%f24
	nop
	set	0x7C, %o4
	prefetch	[%l7 + %o4],	 0x2
	and	%i7,	0x1953,	%l1
	edge16ln	%o3,	%i0,	%g3
	fmovrsgz	%g1,	%f22,	%f22
	fornot2s	%f11,	%f5,	%f16
	subcc	%i4,	0x1D86,	%g5
	movge	%xcc,	%l0,	%g6
	sdiv	%o0,	0x13C7,	%i2
	fbuge,a	%fcc0,	loop_2727
	udiv	%o5,	0x0A1A,	%g4
	udivx	%l2,	0x093D,	%g7
	membar	0x7A
loop_2727:
	fmovrdlz	%o1,	%f4,	%f4
	nop
	setx	0x8954D417,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f3
	setx	0x6C49EAF8,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f15
	fsubs	%f15,	%f3,	%f19
	nop
	setx	0x8E25513B,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f5
	setx	0x0012F24E,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f11
	fdivs	%f11,	%f5,	%f11
	set	0x24, %g2
	stha	%g2,	[%l7 + %g2] 0xe2
	membar	#Sync
	srlx	%o4,	%i1,	%i3
	tl	%xcc,	0x7
	fones	%f17
	movvs	%icc,	%i5,	%o6
	sub	%l3,	0x17C1,	%l5
	alignaddrl	%i6,	%l6,	%o2
	edge16l	%l4,	%o7,	%i7
	tvc	%icc,	0x0
	tvc	%xcc,	0x7
	fandnot2s	%f14,	%f27,	%f16
	movvs	%icc,	%l1,	%i0
	set	0x30, %g3
	lduha	[%l7 + %g3] 0x0c,	%g3
	movrlez	%g1,	0x256,	%o3
	nop
	setx	loop_2728,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	sdiv	%i4,	0x1BAB,	%g5
	edge8n	%g6,	%l0,	%o0
	addc	%i2,	%g4,	%o5
loop_2728:
	fxnors	%f8,	%f17,	%f23
	fmovrdlez	%g7,	%f0,	%f30
	brlez,a	%l2,	loop_2729
	fbule	%fcc3,	loop_2730
	sdiv	%g2,	0x1795,	%o1
	sdiv	%o4,	0x1EE8,	%i1
loop_2729:
	and	%i5,	0x09A5,	%i3
loop_2730:
	fnand	%f12,	%f2,	%f26
	movvc	%icc,	%l3,	%o6
	fmul8ulx16	%f8,	%f22,	%f26
	edge32	%l5,	%i6,	%l6
	fxnor	%f18,	%f14,	%f18
	add	%l7,	0x30,	%l6
	wr	%g0,	0x18,	%asi
	lda	[%l6] %asi,	%l4
	casa	[%l6] %asi,	%l4,	%o2
	sir	0x0752
	fmul8x16	%f21,	%f26,	%f12
	pdist	%f24,	%f12,	%f0
	move	%icc,	%i7,	%l1
	edge32ln	%o7,	%i0,	%g1
	srlx	%g3,	0x07,	%o3
	orn	%i4,	%g5,	%l0
	movrgez	%o0,	%i2,	%g4
	nop
	setx	0xD7027DE6404CC2DD,	%l0,	%l6
	stx	%l6,	[%l7 + 0x58]
	ldx	[%l7 + 0x58],	%fsr
	tneg	%icc,	0x2
	nop
	set	0x78, %l1
	stx	%g6,	[%l7 + %l1]
	movvc	%xcc,	%o5,	%l2
	edge16	%g7,	%o1,	%g2
	tge	%xcc,	0x1
	edge32ln	%o4,	%i5,	%i1
	array8	%i3,	%l3,	%o6
	tcs	%xcc,	0x0
	movvc	%icc,	%l5,	%l6
	set	0x00, %g1
	ldxa	[%g0 + %g1] 0x50,	%i6
	fble	%fcc3,	loop_2731
	orcc	%o2,	%i7,	%l1
	mova	%icc,	%o7,	%i0
	fmovdpos	%icc,	%f25,	%f4
loop_2731:
	fsrc1s	%f7,	%f14
	edge16l	%g1,	%g3,	%l4
	fmovse	%icc,	%f14,	%f11
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movgu	%icc,	%o3,	%g5
	sdivcc	%i4,	0x01D1,	%l0
	sdivcc	%o0,	0x13E2,	%g4
	wr	%g0,	0x81,	%asi
	lduba	[%l7 + 0x55] %asi,	%g6
	ldub	[%l7 + 0x12],	%o5
	movcc	%icc,	%i2,	%g7
	nop
	setx	0x2674A69D,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f21
	setx	0xA321AB24,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f28
	fadds	%f28,	%f21,	%f8
	nop
	fitod	%f6,	%f18
	fdtox	%f18,	%f24
	bvc	%xcc,	loop_2732
	be,a	%icc,	loop_2733
	xnorcc	%l2,	%g2,	%o1
	tcc	%icc,	0x3
loop_2732:
	fmul8ulx16	%f20,	%f14,	%f12
loop_2733:
	srax	%i5,	0x0D,	%i1
	andcc	%o4,	0x1DBF,	%l3
	edge8n	%i3,	%l5,	%o6
	fcmpeq32	%f12,	%f28,	%l6
	wr	%g0,	0x18,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	addc	%o2,	0x1120,	%i6
	fmovs	%f27,	%f11
	fors	%f30,	%f30,	%f6
	fmovde	%xcc,	%f14,	%f14
	wr	%g0,	0x2e,	%asi
	ldda	[%l7 + 0x60] %asi,	%i6
	subcc	%l1,	%i0,	%g1
	tn	%xcc,	0x7
	wr	%g0,	0xeb,	%asi
	stwa	%g3,	[%l7 + 0x44] %asi
	membar	#Sync
	fpack32	%f4,	%f24,	%f6
	fpsub32	%f20,	%f26,	%f2
	tn	%icc,	0x7
	fbl	%fcc3,	loop_2734
	tcc	%xcc,	0x3
	movrgz	%o7,	0x213,	%l4
	sra	%o3,	0x17,	%i4
loop_2734:
	add	%l0,	%o0,	%g4
	fpadd16	%f10,	%f0,	%f6
	movgu	%xcc,	%g5,	%g6
	movvs	%icc,	%i2,	%o5
	movge	%icc,	%l2,	%g2
	fbn,a	%fcc3,	loop_2735
	bge,pt	%icc,	loop_2736
	popc	%o1,	%i5
	bpos,a	loop_2737
loop_2735:
	fbge	%fcc2,	loop_2738
loop_2736:
	addccc	%i1,	0x0E62,	%o4
	movrlz	%l3,	0x0C2,	%i3
loop_2737:
	andn	%g7,	0x0A6A,	%o6
loop_2738:
	fpadd16s	%f17,	%f24,	%f20
	tneg	%xcc,	0x5
	or	%l6,	%l5,	%i6
	sdiv	%i7,	0x1AE1,	%l1
	mova	%icc,	%o2,	%i0
	bn,pt	%xcc,	loop_2739
	tsubcc	%g1,	%g3,	%l4
	set	0x28, %o1
	prefetcha	[%l7 + %o1] 0x89,	 0x1
loop_2739:
	fmovsge	%icc,	%f9,	%f20
	taddcc	%o3,	0x1E41,	%i4
	popc	0x10C7,	%l0
	orncc	%g4,	0x074C,	%o0
	flush	%l7 + 0x7C
	tpos	%xcc,	0x3
	tle	%xcc,	0x6
	fmovscs	%xcc,	%f18,	%f4
	te	%icc,	0x6
	edge32	%g5,	%g6,	%i2
	udivx	%l2,	0x080D,	%o5
	edge16ln	%g2,	%i5,	%o1
	wr	%g0,	0x80,	%asi
	stxa	%o4,	[%l7 + 0x50] %asi
	and	%l3,	%i1,	%i3
	fzero	%f2
	edge16	%o6,	%g7,	%l5
	fbn	%fcc0,	loop_2740
	fmovdvc	%icc,	%f10,	%f4
	udiv	%l6,	0x0F1A,	%i6
	movvc	%xcc,	%l1,	%o2
loop_2740:
	tge	%xcc,	0x4
	nop
	set	0x08, %o0
	ldsh	[%l7 + %o0],	%i0
	fmovrslez	%i7,	%f10,	%f23
	array8	%g1,	%g3,	%l4
	lduh	[%l7 + 0x58],	%o3
	sra	%i4,	%l0,	%o7
	tg	%xcc,	0x7
	fornot2s	%f9,	%f20,	%f11
	edge32ln	%o0,	%g5,	%g6
	bcs	loop_2741
	te	%xcc,	0x1
	tgu	%icc,	0x2
	fmovrse	%i2,	%f10,	%f22
loop_2741:
	bn,a,pn	%xcc,	loop_2742
	brlz,a	%g4,	loop_2743
	fmovse	%xcc,	%f6,	%f14
	tleu	%xcc,	0x1
loop_2742:
	srlx	%l2,	0x07,	%o5
loop_2743:
	nop
	wr	%g0,	0x04,	%asi
	ldda	[%l7 + 0x70] %asi,	%i4
	call	loop_2744
	fsrc1s	%f27,	%f4
	fbug,a	%fcc0,	loop_2745
	tleu	%xcc,	0x7
loop_2744:
	andncc	%g2,	%o1,	%l3
	faligndata	%f12,	%f22,	%f30
loop_2745:
	ldsh	[%l7 + 0x64],	%i1
	sllx	%o4,	0x01,	%o6
	popc	0x0BBF,	%g7
	edge8ln	%l5,	%l6,	%i3
	fbe,a	%fcc2,	loop_2746
	stbar
	fnot2s	%f27,	%f17
	tleu	%xcc,	0x0
loop_2746:
	fbu	%fcc0,	loop_2747
	popc	%l1,	%o2
	fcmple32	%f12,	%f8,	%i0
	andcc	%i6,	0x1777,	%i7
loop_2747:
	ldsh	[%l7 + 0x24],	%g1
	wr	%g0,	0x89,	%asi
	lduwa	[%l7 + 0x24] %asi,	%g3
	movl	%icc,	%o3,	%l4
	andncc	%i4,	%l0,	%o0
	tge	%xcc,	0x4
	mulx	%g5,	%o7,	%i2
	srax	%g6,	0x11,	%g4
	alignaddrl	%o5,	%i5,	%l2
	tg	%icc,	0x3
	tleu	%icc,	0x1
	sra	%g2,	%o1,	%l3
	bshuffle	%f0,	%f10,	%f6
	nop
	set	0x50, %g5
	ldsb	[%l7 + %g5],	%o4
	andn	%i1,	%g7,	%o6
	orn	%l6,	%i3,	%l1
	or	%l5,	%o2,	%i6
	mulscc	%i0,	%g1,	%g3
	bvs	loop_2748
	movpos	%icc,	%i7,	%l4
	membar	0x55
	edge32l	%i4,	%o3,	%l0
loop_2748:
	ldd	[%l7 + 0x58],	%o0
	xnor	%g5,	0x0140,	%i2
	popc	0x192F,	%o7
	orcc	%g4,	%g6,	%o5
	ldub	[%l7 + 0x54],	%i5
	membar	0x5E
	sllx	%l2,	0x0A,	%g2
	set	0x60, %i7
	ldxa	[%l7 + %i7] 0x04,	%l3
	tpos	%icc,	0x5
	udivx	%o4,	0x0BD5,	%o1
	wr	%g0,	0x18,	%asi
	ldsba	[%l7 + 0x27] %asi,	%g7
	fbule	%fcc0,	loop_2749
	sethi	0x1152,	%i1
	xnorcc	%o6,	0x18BF,	%i3
	nop
	setx	0x422D1E38A0552D9C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldx	[%l7 + 0x28],	%fsr
loop_2749:
	andncc	%l1,	%l5,	%o2
	sethi	0x030D,	%l6
	fmovsn	%icc,	%f0,	%f10
	mova	%icc,	%i0,	%i6
	orn	%g1,	%g3,	%i7
	lduh	[%l7 + 0x60],	%l4
	movge	%xcc,	%o3,	%l0
	fbne	%fcc3,	loop_2750
	be	%icc,	loop_2751
	edge8n	%o0,	%i4,	%g5
	taddcc	%i2,	%g4,	%g6
loop_2750:
	bshuffle	%f10,	%f20,	%f8
loop_2751:
	taddcc	%o5,	0x13F8,	%i5
	tge	%xcc,	0x4
	umulcc	%o7,	0x12CA,	%g2
	tsubcctv	%l2,	%o4,	%l3
	umul	%g7,	%i1,	%o6
	wr	%g0,	0x10,	%asi
	lduha	[%l7 + 0x46] %asi,	%i3
	nop
	fitos	%f9,	%f29
	fstod	%f29,	%f6
	addccc	%o1,	%l5,	%l1
	brnz,a	%l6,	loop_2752
	movg	%icc,	%o2,	%i0
	move	%icc,	%i6,	%g3
	fpadd32	%f18,	%f20,	%f26
loop_2752:
	ldub	[%l7 + 0x12],	%i7
	faligndata	%f8,	%f20,	%f24
	umul	%g1,	%l4,	%l0
	fors	%f31,	%f6,	%f26
	tl	%icc,	0x3
	tsubcc	%o3,	0x08A2,	%o0
	edge32	%i4,	%g5,	%i2
	fsrc1	%f16,	%f2
	brlez	%g6,	loop_2753
	edge16n	%g4,	%i5,	%o5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fsrc1	%f10,	%f10
loop_2753:
	movne	%icc,	%g2,	%o7
	movn	%xcc,	%l2,	%o4
	edge32l	%g7,	%i1,	%l3
	tge	%icc,	0x6
	movrlz	%o6,	%i3,	%l5
	fabsd	%f8,	%f10
	fbn	%fcc1,	loop_2754
	fmovsvc	%xcc,	%f3,	%f25
	fornot2s	%f30,	%f30,	%f12
	or	%o1,	0x009C,	%l6
loop_2754:
	nop
	fitos	%f3,	%f25
	fstox	%f25,	%f10
	fxtos	%f10,	%f20
	ldd	[%l7 + 0x10],	%l0
	xnor	%o2,	0x0F72,	%i6
	fpsub16	%f18,	%f24,	%f18
	fmovsge	%icc,	%f6,	%f8
	addccc	%i0,	%g3,	%g1
	addccc	%i7,	%l0,	%l4
	set	0x33, %l3
	ldstuba	[%l7 + %l3] 0x89,	%o3
	alignaddr	%o0,	%i4,	%g5
	add	%g6,	0x15BD,	%i2
	fsrc2	%f0,	%f12
	set	0x0D, %l2
	stba	%g4,	[%l7 + %l2] 0x04
	tsubcc	%o5,	%i5,	%o7
	lduh	[%l7 + 0x7E],	%g2
	tne	%xcc,	0x6
	taddcctv	%o4,	0x17E7,	%l2
	fpsub32s	%f6,	%f28,	%f19
	fnot1s	%f20,	%f9
	movgu	%xcc,	%g7,	%l3
	movleu	%icc,	%o6,	%i3
	popc	0x0E95,	%l5
	for	%f4,	%f2,	%f8
	movrgz	%o1,	0x10D,	%i1
	tle	%icc,	0x4
	movre	%l6,	%l1,	%o2
	edge8ln	%i0,	%i6,	%g1
	movge	%xcc,	%g3,	%i7
	bcc,a	%icc,	loop_2755
	ldsw	[%l7 + 0x38],	%l4
	srl	%o3,	0x01,	%o0
	bpos,pt	%xcc,	loop_2756
loop_2755:
	srl	%l0,	0x15,	%i4
	sdiv	%g5,	0x1484,	%g6
	fpsub32	%f18,	%f6,	%f28
loop_2756:
	brgez	%i2,	loop_2757
	tn	%xcc,	0x2
	udiv	%g4,	0x0ACD,	%o5
	fcmple32	%f20,	%f22,	%i5
loop_2757:
	sir	0x0BE2
	movcs	%icc,	%g2,	%o7
	sra	%o4,	0x1A,	%l2
	nop
	fitod	%f24,	%f8
	bvc,a,pn	%icc,	loop_2758
	movgu	%xcc,	%l3,	%g7
	fmovrsgz	%o6,	%f18,	%f18
	movle	%icc,	%i3,	%l5
loop_2758:
	udiv	%i1,	0x0346,	%l6
	ld	[%l7 + 0x50],	%f9
	fmovsl	%icc,	%f9,	%f6
	tgu	%icc,	0x2
	faligndata	%f20,	%f26,	%f18
	te	%icc,	0x0
	udivx	%o1,	0x19C9,	%o2
	fmuld8ulx16	%f30,	%f22,	%f16
	umul	%i0,	%l1,	%i6
	xor	%g1,	0x0FA9,	%i7
	udivx	%g3,	0x09FD,	%o3
	andcc	%o0,	0x0049,	%l4
	fmovsgu	%icc,	%f21,	%f25
	movcs	%xcc,	%l0,	%g5
	fbo	%fcc2,	loop_2759
	nop
	fitod	%f10,	%f10
	fdtos	%f10,	%f20
	edge16l	%i4,	%g6,	%g4
	wr	%g0,	0x11,	%asi
	swapa	[%l7 + 0x58] %asi,	%i2
loop_2759:
	nop
	set	0x4A, %i0
	stba	%o5,	[%l7 + %i0] 0x2b
	membar	#Sync
	tgu	%xcc,	0x2
	nop
	fitod	%f4,	%f6
	fdtos	%f6,	%f10
	movg	%icc,	%i5,	%g2
	fcmple16	%f16,	%f22,	%o7
	set	0x14, %o7
	swapa	[%l7 + %o7] 0x88,	%o4
	mova	%icc,	%l3,	%g7
	movrgez	%o6,	0x037,	%i3
	sth	%l2,	[%l7 + 0x72]
	fbg	%fcc3,	loop_2760
	edge16n	%i1,	%l6,	%o1
	fbuge,a	%fcc0,	loop_2761
	taddcctv	%o2,	0x14B0,	%i0
loop_2760:
	bvc,a	%xcc,	loop_2762
	fnot2s	%f0,	%f10
loop_2761:
	sdivx	%l1,	0x0474,	%i6
	taddcc	%g1,	%l5,	%g3
loop_2762:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fones	%f10
	bshuffle	%f16,	%f16,	%f0
	edge8l	%o3,	%o0,	%i7
	tcc	%icc,	0x7
	edge32n	%l4,	%l0,	%i4
	ldsw	[%l7 + 0x14],	%g5
	lduw	[%l7 + 0x7C],	%g4
	tle	%icc,	0x0
	andcc	%g6,	%i2,	%o5
	tcc	%icc,	0x3
	set	0x50, %o3
	ldda	[%l7 + %o3] 0x89,	%g2
	udiv	%i5,	0x1DF0,	%o7
	movge	%xcc,	%o4,	%g7
	movneg	%xcc,	%o6,	%l3
	movrgz	%l2,	%i1,	%i3
	sir	0x1CF6
	fbuge,a	%fcc0,	loop_2763
	movn	%icc,	%o1,	%o2
	bne	loop_2764
	fmovsa	%xcc,	%f26,	%f26
loop_2763:
	edge8	%i0,	%l6,	%l1
	udivcc	%i6,	0x0C8E,	%l5
loop_2764:
	brz	%g1,	loop_2765
	fbl,a	%fcc0,	loop_2766
	fbo	%fcc2,	loop_2767
	fxor	%f28,	%f8,	%f20
loop_2765:
	movrne	%g3,	0x16B,	%o0
loop_2766:
	movgu	%xcc,	%i7,	%l4
loop_2767:
	fpmerge	%f13,	%f30,	%f8
	set	0x1C, %o2
	lduwa	[%l7 + %o2] 0x15,	%l0
	wr	%g0,	0xe3,	%asi
	stha	%i4,	[%l7 + 0x24] %asi
	membar	#Sync
	xor	%o3,	0x0F87,	%g4
	fbue	%fcc1,	loop_2768
	array16	%g6,	%g5,	%o5
	udiv	%g2,	0x0DF4,	%i5
	andn	%i2,	0x0ECA,	%o4
loop_2768:
	addccc	%o7,	0x1939,	%o6
	movrgz	%g7,	0x278,	%l2
	fmovsn	%xcc,	%f4,	%f21
	fmovsne	%icc,	%f12,	%f14
	edge32n	%i1,	%l3,	%o1
	tgu	%xcc,	0x7
	bpos	%xcc,	loop_2769
	tvs	%xcc,	0x4
	addcc	%i3,	%o2,	%i0
	movrlz	%l6,	%i6,	%l5
loop_2769:
	edge16	%g1,	%g3,	%o0
	subccc	%l1,	%i7,	%l0
	bl,a,pn	%xcc,	loop_2770
	edge8n	%l4,	%o3,	%i4
	movn	%icc,	%g4,	%g6
	set	0x28, %g7
	sta	%f4,	[%l7 + %g7] 0x10
loop_2770:
	array16	%g5,	%g2,	%i5
	alignaddr	%o5,	%i2,	%o4
	edge8n	%o7,	%g7,	%o6
	fcmpeq16	%f0,	%f28,	%l2
	membar	0x2B
	movgu	%xcc,	%l3,	%i1
	sir	0x153F
	ldsh	[%l7 + 0x0E],	%i3
	set	0x5E, %l5
	lduha	[%l7 + %l5] 0x10,	%o1
	fandnot2s	%f25,	%f13,	%f5
	ldsh	[%l7 + 0x62],	%o2
	addc	%l6,	%i6,	%l5
	ldd	[%l7 + 0x08],	%i0
	call	loop_2771
	edge16ln	%g3,	%o0,	%l1
	add	%i7,	0x1784,	%g1
	for	%f12,	%f12,	%f22
loop_2771:
	tl	%icc,	0x1
	edge16l	%l4,	%l0,	%i4
	movre	%g4,	0x115,	%o3
	wr	%g0,	0x19,	%asi
	stha	%g6,	[%l7 + 0x48] %asi
	movl	%icc,	%g2,	%i5
	brnz,a	%g5,	loop_2772
	addcc	%o5,	%i2,	%o7
	fand	%f2,	%f28,	%f16
	mulscc	%g7,	0x1F0A,	%o6
loop_2772:
	xor	%o4,	0x1E57,	%l3
	smulcc	%i1,	0x1D2E,	%l2
	movle	%xcc,	%i3,	%o2
	ldsh	[%l7 + 0x26],	%o1
	wr	%g0,	0x80,	%asi
	ldsba	[%l7 + 0x14] %asi,	%l6
	andn	%l5,	%i6,	%g3
	smul	%i0,	%o0,	%i7
	fmovrdlz	%g1,	%f24,	%f30
	fcmpgt32	%f4,	%f30,	%l4
	add	%l0,	%l1,	%i4
	umulcc	%g4,	%g6,	%o3
	sll	%g2,	%i5,	%g5
	te	%icc,	0x1
	subc	%o5,	0x1910,	%o7
	movrne	%g7,	0x097,	%i2
	ldstub	[%l7 + 0x32],	%o4
	ble,pt	%icc,	loop_2773
	st	%f23,	[%l7 + 0x38]
	tne	%icc,	0x7
	udiv	%o6,	0x1A95,	%i1
loop_2773:
	srax	%l2,	%l3,	%o2
	edge32ln	%o1,	%i3,	%l6
	wr	%g0,	0x19,	%asi
	swapa	[%l7 + 0x50] %asi,	%l5
	movcc	%icc,	%i6,	%i0
	movge	%icc,	%o0,	%i7
	tneg	%xcc,	0x3
	sdivx	%g1,	0x0055,	%g3
	fmovd	%f6,	%f28
	bvs,pt	%icc,	loop_2774
	andncc	%l4,	%l0,	%l1
	movge	%xcc,	%i4,	%g4
	fbge	%fcc0,	loop_2775
loop_2774:
	fexpand	%f25,	%f0
	wr	%g0,	0x2f,	%asi
	stba	%o3,	[%l7 + 0x59] %asi
	membar	#Sync
loop_2775:
	tne	%icc,	0x4
	umul	%g2,	%i5,	%g6
	movn	%icc,	%g5,	%o7
	ldub	[%l7 + 0x4C],	%o5
	movgu	%icc,	%g7,	%o4
	tsubcc	%o6,	0x0AEF,	%i2
	tleu	%icc,	0x5
	movpos	%xcc,	%l2,	%i1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srlx	%o2,	0x1A,	%l3
	bneg,a	loop_2776
	andncc	%o1,	%i3,	%l6
	array8	%i6,	%l5,	%o0
	subc	%i7,	%i0,	%g3
loop_2776:
	xnor	%g1,	0x0099,	%l4
	std	%f28,	[%l7 + 0x58]
	xnorcc	%l0,	0x1144,	%l1
	bne,a,pt	%icc,	loop_2777
	srl	%i4,	0x0B,	%o3
	xnorcc	%g4,	0x17ED,	%i5
	movrlez	%g6,	%g5,	%o7
loop_2777:
	movvs	%xcc,	%o5,	%g2
	fbu	%fcc3,	loop_2778
	nop
	setx	0xAD505BD7,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f28
	setx	0xAF056C4B,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f12
	fmuls	%f12,	%f28,	%f6
	subcc	%o4,	%g7,	%i2
	tg	%xcc,	0x6
loop_2778:
	nop
	wr	%g0,	0x27,	%asi
	stha	%l2,	[%l7 + 0x7C] %asi
	membar	#Sync
	lduw	[%l7 + 0x6C],	%o6
	andcc	%o2,	0x17BE,	%i1
	fpsub16s	%f10,	%f1,	%f30
	tcc	%xcc,	0x2
	popc	0x0CAA,	%o1
	lduw	[%l7 + 0x30],	%l3
	tge	%icc,	0x6
	tsubcctv	%l6,	%i3,	%i6
	orn	%o0,	0x0CAA,	%i7
	set	0x7C, %i3
	ldstuba	[%l7 + %i3] 0x0c,	%l5
	fmovdle	%xcc,	%f9,	%f28
	tvs	%xcc,	0x3
	orncc	%i0,	%g1,	%g3
	sllx	%l4,	0x08,	%l0
	fmovse	%icc,	%f1,	%f22
	wr	%g0,	0x2b,	%asi
	stha	%l1,	[%l7 + 0x48] %asi
	membar	#Sync
	movn	%icc,	%o3,	%g4
	stbar
	srlx	%i4,	%g6,	%i5
	fsrc2s	%f12,	%f12
	set	0x0C, %i1
	sta	%f16,	[%l7 + %i1] 0x89
	fmul8x16	%f31,	%f26,	%f22
	sra	%o7,	0x1B,	%o5
	andn	%g5,	%o4,	%g7
	srl	%g2,	%l2,	%i2
	edge16ln	%o6,	%i1,	%o1
	fble,a	%fcc3,	loop_2779
	fandnot1	%f4,	%f14,	%f22
	ldx	[%l7 + 0x20],	%o2
	sdivcc	%l6,	0x13EB,	%i3
loop_2779:
	stw	%i6,	[%l7 + 0x78]
	fbe	%fcc1,	loop_2780
	umul	%l3,	%o0,	%i7
	nop
	fitos	%f12,	%f7
	edge8ln	%l5,	%g1,	%i0
loop_2780:
	brlz,a	%g3,	loop_2781
	tvc	%icc,	0x2
	sll	%l4,	0x0E,	%l1
	subc	%o3,	0x1BFF,	%l0
loop_2781:
	edge8n	%g4,	%g6,	%i4
	ta	%xcc,	0x5
	sth	%i5,	[%l7 + 0x42]
	ldx	[%l7 + 0x38],	%o5
	movrlz	%g5,	0x1D4,	%o7
	addc	%g7,	0x0512,	%g2
	popc	0x099E,	%l2
	add	%l7,	0x50,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] %asi,	%i2,	%o6
	bvc,a	loop_2782
	te	%xcc,	0x2
	umulcc	%i1,	0x102B,	%o1
	edge8n	%o4,	%l6,	%i3
loop_2782:
	bcs,pt	%xcc,	loop_2783
	ldub	[%l7 + 0x0B],	%i6
	movcc	%xcc,	%l3,	%o2
	call	loop_2784
loop_2783:
	fmovrdne	%o0,	%f20,	%f16
	edge32ln	%l5,	%i7,	%i0
	fmovdn	%icc,	%f3,	%f9
loop_2784:
	movle	%icc,	%g1,	%g3
	mulscc	%l1,	0x05FC,	%o3
	ldd	[%l7 + 0x58],	%f16
	smulcc	%l4,	%g4,	%g6
	edge32	%i4,	%l0,	%i5
	sir	0x1DCD
	srlx	%o5,	%g5,	%o7
	ldd	[%l7 + 0x30],	%g6
	edge16	%l2,	%i2,	%g2
	ba	%xcc,	loop_2785
	fcmpgt16	%f20,	%f14,	%i1
	tleu	%xcc,	0x2
	xorcc	%o1,	0x10C3,	%o6
loop_2785:
	nop
	setx loop_2786, %l0, %l1
	jmpl %l1, %l6
	fcmpeq16	%f24,	%f6,	%o4
	movrgez	%i3,	0x324,	%i6
	tvc	%xcc,	0x5
loop_2786:
	alignaddrl	%l3,	%o0,	%l5
	fba	%fcc1,	loop_2787
	edge16l	%o2,	%i7,	%g1
	bvs,pt	%xcc,	loop_2788
	subcc	%i0,	%l1,	%g3
loop_2787:
	tcc	%xcc,	0x2
	fmovde	%icc,	%f25,	%f29
loop_2788:
	fors	%f6,	%f16,	%f1
	set	0x2E, %l0
	ldsha	[%l7 + %l0] 0x81,	%o3
	fmovsn	%icc,	%f13,	%f21
	mulx	%l4,	0x167F,	%g6
	tpos	%icc,	0x7
	set	0x20, %l4
	swapa	[%l7 + %l4] 0x18,	%g4
	tn	%icc,	0x3
	andcc	%i4,	0x0C53,	%i5
	tg	%icc,	0x7
	andn	%l0,	0x08C3,	%o5
	nop
	setx	0x4261B128B71F5355,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0x551CE5638BD9E21C,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	fdivd	%f8,	%f20,	%f20
	te	%icc,	0x7
	sdiv	%g5,	0x1701,	%g7
	tcc	%xcc,	0x2
	tneg	%icc,	0x7
	wr	%g0,	0x2e,	%asi
	ldda	[%l7 + 0x40] %asi,	%o6
	srlx	%l2,	%i2,	%i1
	taddcctv	%o1,	0x0F28,	%g2
	tsubcc	%l6,	%o6,	%i3
	ta	%xcc,	0x0
	edge16l	%i6,	%l3,	%o4
	umulcc	%l5,	0x1FAF,	%o0
	ldd	[%l7 + 0x18],	%i6
	membar	#Sync
	set	0x40, %i2
	ldda	[%l7 + %i2] 0x1f,	%f16
	tge	%icc,	0x3
	fmovdg	%icc,	%f10,	%f1
	fmovdcc	%xcc,	%f8,	%f17
	move	%icc,	%g1,	%o2
	sllx	%l1,	0x1F,	%g3
	fbo,a	%fcc0,	loop_2789
	movvs	%xcc,	%o3,	%l4
	movne	%icc,	%i0,	%g6
	orncc	%g4,	%i4,	%i5
loop_2789:
	fnot2	%f10,	%f2
	add	%l0,	0x1FA6,	%g5
	edge16ln	%g7,	%o7,	%o5
	subcc	%i2,	%l2,	%i1
	movge	%xcc,	%o1,	%g2
	fmovsvc	%icc,	%f3,	%f3
	and	%o6,	%l6,	%i6
	tle	%icc,	0x0
	srl	%i3,	%l3,	%l5
	edge8	%o0,	%i7,	%g1
	tn	%xcc,	0x5
	movpos	%icc,	%o4,	%o2
	subcc	%l1,	0x0599,	%g3
	nop
	setx	0x90682687,	%l0,	%l6
	st	%l6,	[%l7 + 0x60]
	ld	[%l7 + 0x60],	%fsr
	sdivcc	%o3,	0x0645,	%l4
	tleu	%xcc,	0x7
	movcs	%icc,	%i0,	%g4
	movpos	%icc,	%g6,	%i5
	tsubcc	%l0,	0x1B1E,	%g5
	tl	%xcc,	0x1
	movrlz	%g7,	0x04E,	%i4
	fmovspos	%xcc,	%f7,	%f19
	bge,a	%xcc,	loop_2790
	tl	%icc,	0x4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsneg	%xcc,	%f20,	%f10
loop_2790:
	ldsh	[%l7 + 0x44],	%o5
	set	0x7C, %i5
	stha	%o7,	[%l7 + %i5] 0x10
	sub	%i2,	0x0040,	%l2
	edge16l	%i1,	%g2,	%o6
	stw	%o1,	[%l7 + 0x38]
	brlz,a	%l6,	loop_2791
	fsrc1s	%f18,	%f1
	subccc	%i3,	0x199A,	%i6
	sir	0x101A
loop_2791:
	ble,a	%xcc,	loop_2792
	movge	%icc,	%l3,	%o0
	subcc	%l5,	%i7,	%g1
	ldsw	[%l7 + 0x7C],	%o4
loop_2792:
	fornot1s	%f10,	%f18,	%f8
	nop
	setx loop_2793, %l0, %l1
	jmpl %l1, %l1
	tgu	%icc,	0x3
	orncc	%o2,	%g3,	%l4
	tg	%icc,	0x0
loop_2793:
	umulcc	%i0,	0x13EA,	%g4
	movrlez	%o3,	0x323,	%i5
	srl	%l0,	%g6,	%g7
	tcs	%icc,	0x1
	sdivx	%g5,	0x0289,	%o5
	brgz,a	%o7,	loop_2794
	srlx	%i2,	%l2,	%i4
	edge32l	%i1,	%g2,	%o6
	fbo	%fcc3,	loop_2795
loop_2794:
	tsubcctv	%o1,	%i3,	%l6
	set	0x40, %i6
	stda	%f16,	[%l7 + %i6] 0x17
	membar	#Sync
loop_2795:
	smul	%l3,	%i6,	%l5
	fmovsleu	%icc,	%f24,	%f28
	edge8l	%i7,	%o0,	%o4
	fmovdne	%icc,	%f1,	%f3
	bvc	%icc,	loop_2796
	nop
	fitos	%f10,	%f9
	fstox	%f9,	%f24
	fmovrsgez	%l1,	%f21,	%f3
	fbe	%fcc1,	loop_2797
loop_2796:
	srlx	%o2,	%g1,	%g3
	add	%l4,	%i0,	%g4
	ta	%icc,	0x5
loop_2797:
	movcs	%xcc,	%o3,	%i5
	tneg	%icc,	0x0
	udivx	%g6,	0x0F9E,	%g7
	ldsh	[%l7 + 0x24],	%g5
	brnz,a	%l0,	loop_2798
	nop
	setx	0xC0712448,	%l0,	%l6
	st	%l6,	[%l7 + 0x08]
	ld	[%l7 + 0x08],	%fsr
	mova	%icc,	%o5,	%o7
	nop
	setx	loop_2799,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_2798:
	xnor	%i2,	%i4,	%i1
	srlx	%g2,	%o6,	%l2
	te	%xcc,	0x3
loop_2799:
	tneg	%xcc,	0x6
	srax	%i3,	%l6,	%o1
	movrne	%i6,	0x3FD,	%l5
	movvc	%icc,	%l3,	%o0
	srlx	%o4,	0x08,	%l1
	sethi	0x1B17,	%i7
	fnor	%f6,	%f14,	%f24
	movcs	%xcc,	%g1,	%g3
	or	%l4,	0x141C,	%o2
	bneg,a,pt	%xcc,	loop_2800
	move	%xcc,	%i0,	%g4
	fors	%f12,	%f9,	%f13
	xor	%i5,	0x1C94,	%g6
loop_2800:
	sllx	%o3,	0x15,	%g5
	nop
	fitod	%f10,	%f6
	fornot1s	%f2,	%f30,	%f18
	stx	%l0,	[%l7 + 0x18]
	addc	%g7,	%o5,	%i2
	movrgz	%o7,	%i1,	%i4
	wr	%g0,	0x0c,	%asi
	prefetcha	[%l7 + 0x70] %asi,	 0x0
	tneg	%xcc,	0x2
	fcmple32	%f16,	%f30,	%o6
	array16	%i3,	%l2,	%l6
	movge	%icc,	%o1,	%l5
	movrne	%i6,	0x0CC,	%o0
	tle	%xcc,	0x7
	bge,a	%icc,	loop_2801
	smul	%l3,	0x02A3,	%o4
	sethi	0x1B9D,	%i7
	nop
	setx	0xA0F144F5C7A5380E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0x0ADB3703666D200D,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	fmuld	%f18,	%f26,	%f26
loop_2801:
	nop
	setx	0xF7D2C13D40704DA7,	%l0,	%l6
	stx	%l6,	[%l7 + 0x10]
	ldx	[%l7 + 0x10],	%fsr
	tvc	%xcc,	0x4
	edge8ln	%g1,	%l1,	%l4
	sllx	%g3,	0x0F,	%i0
	call	loop_2802
	stb	%g4,	[%l7 + 0x09]
	nop
	setx loop_2803, %l0, %l1
	jmpl %l1, %o2
	fble	%fcc2,	loop_2804
loop_2802:
	movrgz	%g6,	0x171,	%i5
	edge32l	%o3,	%g5,	%l0
loop_2803:
	tg	%icc,	0x6
loop_2804:
	bcs,a	%icc,	loop_2805
	fbu	%fcc0,	loop_2806
	sethi	0x0974,	%g7
	umulcc	%o5,	%i2,	%o7
loop_2805:
	stx	%i4,	[%l7 + 0x68]
loop_2806:
	prefetch	[%l7 + 0x58],	 0x0
	nop
	setx	loop_2807,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	array8	%g2,	%o6,	%i3
	srl	%i1,	%l2,	%o1
	nop
	setx	loop_2808,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_2807:
	fmovse	%xcc,	%f12,	%f26
	xnor	%l6,	0x1BCD,	%l5
	fxor	%f18,	%f2,	%f10
loop_2808:
	sub	%o0,	0x0AC8,	%l3
	edge32ln	%i6,	%o4,	%g1
	orn	%i7,	0x1C9A,	%l4
	edge8	%l1,	%g3,	%g4
	fmovrdgez	%o2,	%f22,	%f4
	movleu	%icc,	%g6,	%i5
	fandnot2	%f24,	%f4,	%f14
	add	%l7,	0x5C,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] %asi,	%i0,	%o3
	edge32ln	%l0,	%g7,	%o5
	sdivx	%g5,	0x0CC7,	%i2
	lduh	[%l7 + 0x4E],	%i4
	fbu	%fcc3,	loop_2809
	tge	%xcc,	0x1
	movcc	%xcc,	%o7,	%o6
	tsubcc	%g2,	0x07D7,	%i3
loop_2809:
	nop
	setx	0x2A9B28EE805C797D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x40]
	ldx	[%l7 + 0x40],	%fsr
	set	0x30, %l6
	ldxa	[%g0 + %l6] 0x58,	%i1
	flush	%l7 + 0x4C
	edge16l	%l2,	%o1,	%l6
	tle	%xcc,	0x0
	te	%icc,	0x5
	nop
	setx	0x4B1C6BAC2EF8647F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	setx	0x8D8FD75D33E56034,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fdivd	%f0,	%f18,	%f24
	srl	%o0,	0x1F,	%l3
	bn,pt	%xcc,	loop_2810
	ble,a,pt	%icc,	loop_2811
	tneg	%icc,	0x4
	fbul,a	%fcc3,	loop_2812
loop_2810:
	tsubcc	%i6,	0x05C0,	%o4
loop_2811:
	tleu	%icc,	0x1
	tvc	%xcc,	0x3
loop_2812:
	fmovdneg	%icc,	%f12,	%f30
	edge32	%l5,	%g1,	%l4
	xor	%l1,	0x1C09,	%i7
	sethi	0x03AF,	%g3
	edge32ln	%g4,	%g6,	%o2
	sethi	0x006E,	%i0
	stw	%i5,	[%l7 + 0x2C]
	movrgez	%l0,	0x2DF,	%o3
	sth	%g7,	[%l7 + 0x1E]
	smul	%o5,	0x13B8,	%g5
	wr	%g0,	0x11,	%asi
	ldswa	[%l7 + 0x3C] %asi,	%i2
	fands	%f22,	%f30,	%f10
	tn	%xcc,	0x1
	fmovsleu	%icc,	%f19,	%f22
	fmovrdgez	%i4,	%f12,	%f26
	umul	%o7,	0x11F0,	%g2
	edge8ln	%i3,	%o6,	%i1
	fmovrsne	%l2,	%f18,	%f26
	xor	%l6,	%o0,	%o1
	movl	%xcc,	%i6,	%l3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrdgz	%l5,	%f6,	%f30
	subcc	%o4,	0x124C,	%g1
	movne	%xcc,	%l1,	%l4
	movpos	%icc,	%i7,	%g4
	fnegs	%f16,	%f4
	nop
	fitod	%f8,	%f30
	fdtox	%f30,	%f26
	fmovsg	%icc,	%f22,	%f22
	tle	%xcc,	0x2
	te	%icc,	0x5
	fmul8ulx16	%f6,	%f4,	%f30
	mulx	%g3,	0x0C46,	%g6
	fmovrdne	%o2,	%f18,	%f28
	bl	loop_2813
	fsrc1	%f30,	%f28
	fandnot2s	%f16,	%f6,	%f9
	fors	%f13,	%f26,	%f15
loop_2813:
	smul	%i0,	0x1A74,	%l0
	sdivx	%i5,	0x1409,	%g7
	fmovsg	%xcc,	%f21,	%f25
	fbuge,a	%fcc3,	loop_2814
	andncc	%o3,	%g5,	%o5
	wr	%g0,	0x0c,	%asi
	ldsba	[%l7 + 0x3C] %asi,	%i2
loop_2814:
	fbl,a	%fcc2,	loop_2815
	bn,a	%xcc,	loop_2816
	fbul,a	%fcc0,	loop_2817
	edge32n	%o7,	%g2,	%i4
loop_2815:
	srlx	%i3,	%i1,	%l2
loop_2816:
	movrgz	%o6,	%o0,	%o1
loop_2817:
	edge16	%l6,	%i6,	%l5
	stx	%o4,	[%l7 + 0x68]
	set	0x38, %g4
	ldswa	[%l7 + %g4] 0x18,	%g1
	set	0x5B, %i4
	lduba	[%l7 + %i4] 0x80,	%l3
	movleu	%icc,	%l1,	%i7
	fcmpeq32	%f10,	%f24,	%g4
	movg	%xcc,	%g3,	%l4
	brgez,a	%o2,	loop_2818
	movgu	%icc,	%g6,	%l0
	edge8	%i0,	%g7,	%i5
	tge	%icc,	0x1
loop_2818:
	bge,pt	%icc,	loop_2819
	movre	%g5,	%o3,	%o5
	mulx	%o7,	0x16BF,	%i2
	ld	[%l7 + 0x3C],	%f25
loop_2819:
	fpadd32s	%f28,	%f8,	%f4
	fmovrslez	%g2,	%f11,	%f27
	movcc	%xcc,	%i4,	%i1
	movl	%xcc,	%l2,	%i3
	fbul	%fcc2,	loop_2820
	addccc	%o0,	0x141A,	%o1
	wr	%g0,	0x0c,	%asi
	stxa	%o6,	[%l7 + 0x50] %asi
loop_2820:
	edge16n	%i6,	%l5,	%o4
	movl	%xcc,	%l6,	%l3
	fmovdvs	%xcc,	%f3,	%f18
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbue	%fcc2,	loop_2821
	nop
	setx	0x9F1EC98FA040A8E7,	%l0,	%l6
	stx	%l6,	[%l7 + 0x58]
	ldx	[%l7 + 0x58],	%fsr
	smulcc	%l1,	%g1,	%g4
	tcs	%icc,	0x7
loop_2821:
	nop
	setx	0x7CB6EAB2,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f8
	setx	0xD20AD04C,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f6
	fmuls	%f6,	%f8,	%f26
	tvs	%icc,	0x0
	wr	%g0,	0x04,	%asi
	ldsha	[%l7 + 0x72] %asi,	%g3
	xorcc	%l4,	0x0254,	%i7
	fpack16	%f24,	%f2
	sllx	%g6,	%o2,	%i0
	fmovdvs	%icc,	%f14,	%f11
	movrlez	%l0,	%g7,	%g5
	fbl,a	%fcc1,	loop_2822
	tcs	%icc,	0x5
	subccc	%i5,	0x114B,	%o5
	edge32	%o3,	%o7,	%g2
loop_2822:
	andcc	%i4,	0x078F,	%i2
	orcc	%l2,	0x0460,	%i1
	fpsub16s	%f0,	%f11,	%f25
	srax	%o0,	0x0F,	%i3
	movvs	%icc,	%o1,	%i6
	fsrc1	%f0,	%f22
	fblg,a	%fcc0,	loop_2823
	fmovrde	%o6,	%f26,	%f6
	fmul8sux16	%f24,	%f6,	%f2
	tge	%xcc,	0x3
loop_2823:
	orncc	%o4,	%l5,	%l6
	lduh	[%l7 + 0x18],	%l3
	srlx	%g1,	0x0E,	%g4
	bvs	loop_2824
	ldstub	[%l7 + 0x48],	%g3
	bne	loop_2825
	fpsub32	%f6,	%f26,	%f0
loop_2824:
	movge	%icc,	%l4,	%l1
	wr	%g0,	0x04,	%asi
	sta	%f23,	[%l7 + 0x48] %asi
loop_2825:
	movge	%icc,	%g6,	%o2
	umulcc	%i0,	0x05D9,	%i7
	wr	%g0,	0x10,	%asi
	prefetcha	[%l7 + 0x40] %asi,	 0x1
	nop
	setx	0x07BF400D,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f21
	setx	0x89A47CD4,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f19
	fmuls	%f19,	%f21,	%f27
	orcc	%g5,	%g7,	%o5
	fmovdneg	%icc,	%f14,	%f16
	umul	%o3,	0x07AF,	%o7
	brz	%i5,	loop_2826
	edge8	%g2,	%i4,	%l2
	fmovrdgez	%i1,	%f22,	%f4
	fmovsvs	%xcc,	%f27,	%f16
loop_2826:
	tcc	%xcc,	0x5
	set	0x58, %g6
	prefetcha	[%l7 + %g6] 0x88,	 0x2
	wr	%g0,	0x04,	%asi
	ldda	[%l7 + 0x60] %asi,	%i2
	nop
	setx	0x9C99F4B74FFE8F29,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	fsqrtd	%f26,	%f18
	tvc	%icc,	0x3
	movl	%icc,	%i3,	%i6
	taddcc	%o1,	0x16DB,	%o4
	move	%icc,	%o6,	%l5
	ldd	[%l7 + 0x10],	%f16
	xor	%l6,	%g1,	%g4
	fmovdn	%icc,	%f12,	%f23
	set	0x68, %o6
	lduwa	[%l7 + %o6] 0x18,	%l3
	tneg	%xcc,	0x2
	alignaddrl	%l4,	%l1,	%g6
	movleu	%xcc,	%o2,	%g3
	movrlz	%i0,	0x0E2,	%i7
	sll	%l0,	%g5,	%g7
	tn	%xcc,	0x5
	set	0x50, %o4
	ldxa	[%l7 + %o4] 0x14,	%o5
	sdivx	%o3,	0x1E3A,	%o7
	taddcc	%i5,	0x1519,	%i4
	wr	%g0,	0x04,	%asi
	swapa	[%l7 + 0x44] %asi,	%g2
	tle	%icc,	0x6
	fnot2	%f14,	%f16
	orncc	%l2,	0x0B29,	%i1
	nop
	fitos	%f0,	%f6
	fstoi	%f6,	%f28
	movl	%icc,	%i2,	%o0
	mulscc	%i3,	%i6,	%o4
	tvs	%icc,	0x2
	popc	%o1,	%o6
	sll	%l5,	0x17,	%g1
	tne	%icc,	0x3
	addc	%g4,	%l3,	%l6
	movvs	%xcc,	%l1,	%g6
	tne	%icc,	0x6
	fble,a	%fcc3,	loop_2827
	bne	%xcc,	loop_2828
	andncc	%l4,	%g3,	%o2
	set	0x7B, %g2
	ldstuba	[%l7 + %g2] 0x04,	%i0
loop_2827:
	te	%icc,	0x3
loop_2828:
	brgez	%l0,	loop_2829
	udivcc	%g5,	0x1D36,	%g7
	nop
	fitod	%f2,	%f14
	fdtos	%f14,	%f25
	alignaddrl	%i7,	%o3,	%o7
loop_2829:
	movle	%xcc,	%i5,	%o5
	bg	loop_2830
	orcc	%i4,	%g2,	%i1
	tvc	%xcc,	0x3
	bn	loop_2831
loop_2830:
	subcc	%i2,	%o0,	%l2
	movge	%icc,	%i3,	%o4
	subc	%i6,	0x1FB7,	%o6
loop_2831:
	nop
	wr	%g0,	0x88,	%asi
	lduha	[%l7 + 0x4C] %asi,	%l5
	addc	%g1,	0x1D40,	%o1
	movn	%xcc,	%l3,	%g4
	xnor	%l1,	%l6,	%g6
	membar	0x2E
	bgu,a,pt	%icc,	loop_2832
	smul	%l4,	0x1694,	%g3
	srlx	%o2,	%l0,	%g5
	nop
	setx	loop_2833,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_2832:
	umul	%i0,	%i7,	%g7
	srlx	%o7,	%o3,	%i5
	prefetch	[%l7 + 0x28],	 0x1
loop_2833:
	addcc	%o5,	%g2,	%i4
	fbue,a	%fcc1,	loop_2834
	fbo	%fcc2,	loop_2835
	or	%i2,	%o0,	%i1
	stbar
loop_2834:
	srax	%i3,	0x0B,	%l2
loop_2835:
	ldx	[%l7 + 0x18],	%o4
	tg	%icc,	0x0
	edge16l	%i6,	%o6,	%l5
	fmuld8ulx16	%f0,	%f6,	%f20
	edge32n	%o1,	%g1,	%l3
	edge16	%g4,	%l6,	%g6
	movg	%icc,	%l4,	%l1
	tle	%icc,	0x7
	fmovse	%xcc,	%f22,	%f20
	fandnot2	%f18,	%f18,	%f10
	edge32	%o2,	%l0,	%g3
	nop
	setx	0xEB0E1D6C,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f14
	setx	0x65BE426E,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f8
	fmuls	%f8,	%f14,	%f20
	bge	%xcc,	loop_2836
	ldsh	[%l7 + 0x70],	%i0
	nop
	setx	0xDF3D210B3FDEB10B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0xEB0B291D955A4EDC,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	fdivd	%f10,	%f12,	%f20
	tgu	%xcc,	0x2
loop_2836:
	popc	%i7,	%g5
	fmovsvs	%xcc,	%f1,	%f4
	taddcctv	%g7,	%o3,	%o7
	tne	%xcc,	0x2
	and	%i5,	%g2,	%o5
	faligndata	%f26,	%f30,	%f26
	sdiv	%i2,	0x1D68,	%o0
	tsubcc	%i1,	0x05BA,	%i4
	fmovd	%f28,	%f14
	set	0x7C, %g3
	lduha	[%l7 + %g3] 0x11,	%i3
	xor	%l2,	%i6,	%o4
	move	%xcc,	%o6,	%o1
	fbue,a	%fcc1,	loop_2837
	sllx	%l5,	0x01,	%l3
	set	0x1A, %o5
	stha	%g4,	[%l7 + %o5] 0x80
loop_2837:
	srax	%g1,	%l6,	%g6
	array16	%l1,	%l4,	%l0
	nop
	setx	0x1B2A8873,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f31
	setx	0xA1A93DA7,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f5
	fadds	%f5,	%f31,	%f4
	fnot1s	%f0,	%f3
	edge8l	%g3,	%i0,	%i7
	sdivx	%g5,	0x1556,	%o2
	fmovsleu	%xcc,	%f13,	%f17
	udivcc	%g7,	0x148F,	%o3
	addcc	%o7,	%i5,	%o5
	ldsh	[%l7 + 0x34],	%i2
	bne,a	%icc,	loop_2838
	fmovsn	%icc,	%f20,	%f25
	subccc	%o0,	%i1,	%i4
	sethi	0x1251,	%g2
loop_2838:
	ldx	[%l7 + 0x10],	%i3
	xnorcc	%i6,	%o4,	%o6
	movrlez	%o1,	0x32A,	%l5
	ta	%icc,	0x4
	orn	%l2,	%l3,	%g1
	fnor	%f10,	%f10,	%f12
	xnor	%l6,	0x080A,	%g6
	nop
	setx	0xADF20EAE,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f20
	setx	0x5C3ADCCB,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f13
	fsubs	%f13,	%f20,	%f31
	or	%l1,	0x124B,	%g4
	movrgz	%l4,	%l0,	%i0
	smulcc	%g3,	%i7,	%g5
	fbuge	%fcc3,	loop_2839
	tne	%icc,	0x6
	fpsub16s	%f13,	%f31,	%f20
	edge16n	%o2,	%o3,	%g7
loop_2839:
	sra	%i5,	%o7,	%i2
	ble,a,pn	%icc,	loop_2840
	fnors	%f16,	%f21,	%f3
	movpos	%icc,	%o5,	%o0
	edge16	%i4,	%g2,	%i3
loop_2840:
	fmovsge	%icc,	%f29,	%f16
	fabss	%f11,	%f21
	movcc	%xcc,	%i6,	%i1
	te	%xcc,	0x5
	edge8l	%o6,	%o1,	%l5
	subcc	%o4,	0x09B2,	%l2
	andcc	%l3,	%l6,	%g6
	bcs,a	loop_2841
	edge16n	%g1,	%g4,	%l1
	movrgz	%l0,	%l4,	%i0
	movn	%icc,	%g3,	%i7
loop_2841:
	fmovdgu	%xcc,	%f7,	%f4
	array16	%o2,	%g5,	%g7
	wr	%g0,	0x11,	%asi
	ldstuba	[%l7 + 0x11] %asi,	%o3
	tgu	%xcc,	0x5
	for	%f26,	%f28,	%f16
	movneg	%icc,	%i5,	%o7
	taddcctv	%i2,	0x1961,	%o0
	tcs	%icc,	0x5
	fmovdcc	%icc,	%f19,	%f0
	tsubcc	%o5,	%g2,	%i4
	fcmpne16	%f2,	%f4,	%i6
	for	%f28,	%f8,	%f16
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16ln	%i3,	%o6,	%o1
	tvs	%icc,	0x6
	std	%f24,	[%l7 + 0x18]
	srax	%i1,	%o4,	%l5
	xnor	%l2,	%l6,	%l3
	fmovdl	%icc,	%f20,	%f27
	add	%g1,	0x1F7F,	%g6
	alignaddr	%l1,	%l0,	%l4
	subc	%g4,	%g3,	%i7
	fzeros	%f6
	edge32n	%o2,	%g5,	%i0
	movneg	%icc,	%g7,	%o3
	udivx	%o7,	0x0176,	%i2
	sdivcc	%o0,	0x1FE4,	%o5
	fmovdle	%icc,	%f26,	%f20
	set	0x40, %l1
	stda	%f0,	[%l7 + %l1] 0x17
	membar	#Sync
	nop
	setx	0xDAA2ECDF705565FC,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldx	[%l7 + 0x28],	%fsr
	tsubcctv	%g2,	%i5,	%i6
	set	0x32, %g1
	stha	%i4,	[%l7 + %g1] 0x80
	fmovsge	%icc,	%f21,	%f8
	set	0x1F, %o1
	ldstuba	[%l7 + %o1] 0x80,	%i3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movvc	%xcc,	%o6,	%i1
	umul	%o4,	0x134B,	%o1
	movre	%l2,	%l6,	%l5
	fmovdleu	%icc,	%f10,	%f11
	sth	%l3,	[%l7 + 0x4A]
	nop
	set	0x74, %o0
	ldsb	[%l7 + %o0],	%g1
	fcmpeq16	%f24,	%f8,	%l1
	swap	[%l7 + 0x40],	%g6
	wr	%g0,	0x27,	%asi
	stha	%l0,	[%l7 + 0x6E] %asi
	membar	#Sync
	subc	%g4,	0x1A49,	%l4
	movcc	%icc,	%i7,	%o2
	fpsub16	%f26,	%f4,	%f2
	bpos	%xcc,	loop_2842
	fmovsvc	%xcc,	%f8,	%f28
	movpos	%xcc,	%g5,	%g3
	sethi	0x0B25,	%i0
loop_2842:
	fmovrdgez	%g7,	%f28,	%f14
	popc	%o7,	%i2
	movl	%icc,	%o0,	%o5
	ldsw	[%l7 + 0x2C],	%g2
	edge16n	%i5,	%o3,	%i6
	fbn	%fcc3,	loop_2843
	add	%i4,	0x030A,	%i3
	tleu	%xcc,	0x3
	subc	%i1,	%o4,	%o6
loop_2843:
	srax	%o1,	0x1F,	%l2
	nop
	set	0x2A, %i7
	ldub	[%l7 + %i7],	%l5
	edge16l	%l6,	%l3,	%g1
	fmovdl	%xcc,	%f1,	%f16
	te	%xcc,	0x6
	flush	%l7 + 0x10
	orncc	%g6,	0x0F70,	%l1
	umulcc	%l0,	%g4,	%l4
	edge8n	%i7,	%g5,	%o2
	wr	%g0,	0x88,	%asi
	stha	%i0,	[%l7 + 0x2E] %asi
	nop
	setx	loop_2844,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	xor	%g3,	0x1A1A,	%o7
	fmul8ulx16	%f28,	%f14,	%f18
	fabsd	%f14,	%f26
loop_2844:
	sir	0x0615
	movre	%g7,	%o0,	%o5
	taddcctv	%i2,	%g2,	%i5
	fbne	%fcc2,	loop_2845
	brz	%i6,	loop_2846
	edge16l	%o3,	%i3,	%i1
	mova	%xcc,	%o4,	%o6
loop_2845:
	nop
	wr	%g0,	0x80,	%asi
	swapa	[%l7 + 0x08] %asi,	%i4
loop_2846:
	flush	%l7 + 0x2C
	fzero	%f26
	edge8n	%l2,	%o1,	%l6
	xor	%l5,	0x03E4,	%g1
	fexpand	%f13,	%f4
	srax	%l3,	0x05,	%g6
	set	0x1E, %l3
	ldsha	[%l7 + %l3] 0x14,	%l0
	fmovrdgez	%g4,	%f8,	%f20
	mulx	%l1,	0x1B77,	%l4
	edge32ln	%g5,	%i7,	%i0
	movrlz	%o2,	%g3,	%o7
	taddcc	%o0,	0x0F0B,	%o5
	srl	%i2,	0x1F,	%g2
	movvs	%xcc,	%g7,	%i6
	nop
	setx	0x79E859CD,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f5
	setx	0xF2B2D688,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f17
	fmuls	%f17,	%f5,	%f8
	udiv	%i5,	0x1E26,	%o3
	taddcctv	%i1,	0x1029,	%o4
	fmovrslez	%o6,	%f0,	%f21
	tle	%xcc,	0x4
	movge	%icc,	%i4,	%i3
	edge16	%o1,	%l2,	%l6
	nop
	setx	0x6388A05C,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f24
	fsqrts	%f24,	%f27
	flush	%l7 + 0x0C
	bn,a	%xcc,	loop_2847
	addc	%g1,	0x1784,	%l5
	wr	%g0,	0x10,	%asi
	ldsba	[%l7 + 0x16] %asi,	%l3
loop_2847:
	fandnot1	%f14,	%f14,	%f18
	edge8	%g6,	%g4,	%l1
	fabss	%f19,	%f31
	bge,a	loop_2848
	smulcc	%l0,	%g5,	%l4
	movrgez	%i0,	0x2AB,	%o2
	ta	%icc,	0x0
loop_2848:
	fmovdpos	%xcc,	%f24,	%f18
	edge16ln	%g3,	%o7,	%i7
	sll	%o0,	0x04,	%i2
	movrlz	%g2,	0x25D,	%o5
	wr	%g0,	0x11,	%asi
	stxa	%g7,	[%l7 + 0x70] %asi
	bneg	loop_2849
	fcmpne16	%f4,	%f18,	%i5
	movrgz	%i6,	0x1A6,	%i1
	tgu	%icc,	0x3
loop_2849:
	movvc	%icc,	%o4,	%o6
	bne,pn	%icc,	loop_2850
	bvc	loop_2851
	and	%o3,	%i3,	%i4
	set	0x5F, %g5
	stba	%o1,	[%l7 + %g5] 0x81
loop_2850:
	nop
	fitod	%f8,	%f18
	fdtos	%f18,	%f2
loop_2851:
	tleu	%xcc,	0x2
	andn	%l2,	0x1208,	%g1
	xnor	%l5,	0x1F5C,	%l3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orcc	%g6,	0x09A2,	%l6
	orn	%g4,	%l0,	%l1
	smulcc	%l4,	0x0CA6,	%i0
	tvc	%icc,	0x0
	or	%g5,	0x0051,	%o2
	fones	%f31
	fpsub16	%f24,	%f12,	%f4
	wr	%g0,	0x11,	%asi
	swapa	[%l7 + 0x70] %asi,	%o7
	popc	0x1087,	%i7
	movcs	%xcc,	%o0,	%g3
	edge16l	%i2,	%g2,	%o5
	smul	%i5,	%g7,	%i1
	srl	%i6,	0x0C,	%o6
	nop
	fitod	%f24,	%f6
	fcmpgt32	%f16,	%f12,	%o4
	orcc	%i3,	0x0FCE,	%i4
	sll	%o1,	%l2,	%o3
	bneg,a,pn	%xcc,	loop_2852
	sdivx	%g1,	0x1DB7,	%l5
	srlx	%g6,	0x1A,	%l6
	mulx	%l3,	0x0D9D,	%g4
loop_2852:
	xorcc	%l1,	0x045F,	%l4
	addcc	%i0,	0x0550,	%l0
	udiv	%g5,	0x031A,	%o7
	or	%o2,	%o0,	%g3
	orn	%i7,	0x1AAF,	%i2
	edge32ln	%g2,	%i5,	%g7
	sethi	0x0ECA,	%o5
	ldstub	[%l7 + 0x49],	%i6
	fmovsl	%icc,	%f19,	%f15
	subcc	%i1,	0x08A6,	%o4
	move	%xcc,	%o6,	%i3
	fmovrslz	%i4,	%f10,	%f10
	smulcc	%l2,	0x03F0,	%o1
	fmovsle	%icc,	%f16,	%f10
	edge8n	%g1,	%o3,	%l5
	call	loop_2853
	lduw	[%l7 + 0x74],	%g6
	udiv	%l6,	0x1E73,	%l3
	te	%icc,	0x1
loop_2853:
	tneg	%icc,	0x1
	bvc,pt	%xcc,	loop_2854
	nop
	setx	0xAB28B979,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f23
	setx	0x1E10CAC6,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f24
	fmuls	%f24,	%f23,	%f14
	set	0x5E, %l2
	ldsha	[%l7 + %l2] 0x0c,	%g4
loop_2854:
	tvc	%icc,	0x1
	faligndata	%f8,	%f2,	%f8
	tleu	%xcc,	0x6
	ta	%icc,	0x1
	fbg,a	%fcc3,	loop_2855
	fmovrdlez	%l4,	%f30,	%f18
	orcc	%l1,	%i0,	%l0
	fba,a	%fcc1,	loop_2856
loop_2855:
	subccc	%o7,	0x0590,	%g5
	nop
	setx	0x2ACDDCDA60409711,	%l0,	%l6
	stx	%l6,	[%l7 + 0x58]
	ldx	[%l7 + 0x58],	%fsr
	nop
	setx	0x30511005,	%l0,	%l6
	st	%l6,	[%l7 + 0x4C]
	ld	[%l7 + 0x4C],	%fsr
loop_2856:
	tgu	%icc,	0x6
	nop
	setx	loop_2857,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fcmpeq16	%f10,	%f10,	%o2
	tg	%xcc,	0x7
	tsubcc	%o0,	%i7,	%i2
loop_2857:
	tcs	%xcc,	0x5
	wr	%g0,	0x89,	%asi
	prefetcha	[%l7 + 0x28] %asi,	 0x2
	mova	%icc,	%i5,	%g3
	tcs	%icc,	0x4
	ldub	[%l7 + 0x6C],	%o5
	fnot2s	%f7,	%f9
	fmovsne	%xcc,	%f28,	%f5
	fmovde	%icc,	%f26,	%f9
	sll	%g7,	%i6,	%i1
	sdiv	%o4,	0x1B4C,	%o6
	edge32ln	%i3,	%l2,	%o1
	fmovsneg	%xcc,	%f30,	%f18
	move	%icc,	%g1,	%i4
	brlz,a	%o3,	loop_2858
	fblg	%fcc0,	loop_2859
	stb	%l5,	[%l7 + 0x63]
	fmovdn	%icc,	%f26,	%f20
loop_2858:
	fbule,a	%fcc0,	loop_2860
loop_2859:
	fmovdn	%xcc,	%f19,	%f12
	ldsw	[%l7 + 0x58],	%l6
	xnorcc	%g6,	0x0952,	%g4
loop_2860:
	nop
	wr	%g0,	0x81,	%asi
	ldswa	[%l7 + 0x74] %asi,	%l4
	fbe	%fcc1,	loop_2861
	sir	0x1711
	fmul8sux16	%f26,	%f30,	%f16
	fornot1s	%f15,	%f2,	%f4
loop_2861:
	brlz,a	%l3,	loop_2862
	edge8	%l1,	%l0,	%o7
	mova	%icc,	%i0,	%g5
	umul	%o0,	0x1513,	%i7
loop_2862:
	be,a,pn	%icc,	loop_2863
	subccc	%o2,	%i2,	%i5
	set	0x40, %i0
	stda	%f0,	[%l7 + %i0] 0x16
	membar	#Sync
loop_2863:
	nop
	setx	0x00329DAC,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f12
	setx	0x8DE57B65,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f20
	fmuls	%f20,	%f12,	%f21
	add	%l7,	0x38,	%l6
	wr	%g0,	0x18,	%asi
	ldxa	[%l6] %asi,	%g3
	casxa	[%l6] 0x18,	%g3,	%g2
	movge	%icc,	%o5,	%g7
	nop
	setx	0xDC2CAB03,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f8
	setx	0x37F5899B,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f20
	fsubs	%f20,	%f8,	%f22
	fmovse	%icc,	%f1,	%f7
	umul	%i6,	0x04A6,	%o4
	edge8l	%o6,	%i3,	%i1
	fmovspos	%xcc,	%f15,	%f4
	movrgez	%l2,	%g1,	%o1
	udivx	%o3,	0x0118,	%l5
	movrgez	%i4,	%l6,	%g4
	ldsh	[%l7 + 0x4A],	%l4
	movn	%icc,	%l3,	%g6
	bne,a	loop_2864
	bpos,pt	%xcc,	loop_2865
	ta	%icc,	0x5
	bge,a	loop_2866
loop_2864:
	bvc,a	loop_2867
loop_2865:
	nop
	fitos	%f13,	%f21
	fstoi	%f21,	%f2
	movpos	%icc,	%l0,	%o7
loop_2866:
	movrne	%l1,	0x0FD,	%g5
loop_2867:
	brlez	%i0,	loop_2868
	nop
	setx	0x01809371,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f16
	setx	0x3A748553,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f5
	fdivs	%f5,	%f16,	%f3
	orcc	%i7,	%o2,	%o0
	sub	%i5,	0x0F09,	%g3
loop_2868:
	array32	%i2,	%o5,	%g2
	brz,a	%g7,	loop_2869
	stb	%o4,	[%l7 + 0x2B]
	subc	%i6,	%o6,	%i3
	udivcc	%i1,	0x08AD,	%l2
loop_2869:
	fbne	%fcc2,	loop_2870
	fmovde	%xcc,	%f23,	%f27
	alignaddrl	%o1,	%o3,	%l5
	movcc	%xcc,	%g1,	%l6
loop_2870:
	fbge	%fcc1,	loop_2871
	edge8ln	%g4,	%i4,	%l4
	sdiv	%g6,	0x03A9,	%l3
	subcc	%l0,	0x0EC5,	%o7
loop_2871:
	tn	%xcc,	0x2
	edge8l	%g5,	%l1,	%i0
	movrne	%o2,	0x1C0,	%i7
	flush	%l7 + 0x58
	tn	%xcc,	0x2
	fzeros	%f7
	subcc	%o0,	0x1561,	%i5
	movne	%xcc,	%g3,	%o5
	brgez,a	%g2,	loop_2872
	fmovdgu	%icc,	%f1,	%f26
	fbge,a	%fcc1,	loop_2873
	fbue	%fcc2,	loop_2874
loop_2872:
	movl	%icc,	%i2,	%o4
	and	%g7,	0x182B,	%o6
loop_2873:
	nop
	fitos	%f24,	%f2
loop_2874:
	movn	%icc,	%i6,	%i1
	subcc	%i3,	0x1420,	%o1
	nop
	setx	0x12B5C9A5,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f12
	setx	0x8497567C,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f29
	fadds	%f29,	%f12,	%f10
	brnz	%l2,	loop_2875
	taddcctv	%o3,	%g1,	%l5
	lduw	[%l7 + 0x14],	%l6
	bl	loop_2876
loop_2875:
	sll	%i4,	0x0C,	%g4
	fcmpne16	%f10,	%f12,	%l4
	subcc	%l3,	0x02AF,	%l0
loop_2876:
	tsubcc	%g6,	%o7,	%l1
	fcmpeq32	%f10,	%f8,	%g5
	fbule	%fcc3,	loop_2877
	fpsub32	%f0,	%f8,	%f28
	fba	%fcc2,	loop_2878
	umul	%o2,	0x1678,	%i7
loop_2877:
	fones	%f16
	fmovdgu	%icc,	%f17,	%f2
loop_2878:
	stb	%o0,	[%l7 + 0x22]
	srlx	%i5,	%g3,	%o5
	nop
	setx	0x0E58E78E204810A8,	%l0,	%l6
	stx	%l6,	[%l7 + 0x18]
	ldx	[%l7 + 0x18],	%fsr
	sub	%i0,	%g2,	%o4
	edge16	%g7,	%i2,	%i6
	fmovsleu	%xcc,	%f5,	%f4
	array16	%o6,	%i1,	%o1
	nop
	setx	0x977BBBCF,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f15
	fsqrts	%f15,	%f15
	bcs,a,pt	%icc,	loop_2879
	fmovdg	%icc,	%f15,	%f27
	ld	[%l7 + 0x44],	%f0
	fbu,a	%fcc0,	loop_2880
loop_2879:
	tpos	%xcc,	0x6
	fbge,a	%fcc0,	loop_2881
	fandnot2s	%f6,	%f11,	%f2
loop_2880:
	fmul8x16	%f30,	%f4,	%f30
	fbu	%fcc3,	loop_2882
loop_2881:
	nop
	fitos	%f5,	%f17
	fstoi	%f17,	%f8
	fbo	%fcc1,	loop_2883
	bge	%icc,	loop_2884
loop_2882:
	andcc	%i3,	0x019F,	%l2
	tle	%xcc,	0x0
loop_2883:
	fone	%f0
loop_2884:
	nop
	fitos	%f5,	%f23
	fstox	%f23,	%f2
	udiv	%o3,	0x0E2B,	%g1
	fnegd	%f26,	%f16
	fbn	%fcc3,	loop_2885
	orn	%l5,	%l6,	%i4
	srax	%l4,	0x13,	%g4
	fmovdvs	%icc,	%f22,	%f5
loop_2885:
	ldstub	[%l7 + 0x13],	%l3
	nop
	setx	0x3DC670A933D554DC,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0xDE0A36E37D6CF3D7,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fdivd	%f0,	%f12,	%f16
	andn	%l0,	0x085A,	%o7
	ta	%icc,	0x5
	ta	%xcc,	0x5
	st	%f26,	[%l7 + 0x64]
	addcc	%l1,	0x010B,	%g5
	fornot1	%f0,	%f8,	%f4
	fbo,a	%fcc3,	loop_2886
	fbo	%fcc2,	loop_2887
	fmovspos	%xcc,	%f20,	%f18
	fsrc1s	%f29,	%f12
loop_2886:
	popc	0x1559,	%g6
loop_2887:
	nop
	set	0x50, %o7
	ldxa	[%l7 + %o7] 0x88,	%o2
	fbug	%fcc2,	loop_2888
	array16	%i7,	%i5,	%o0
	ldub	[%l7 + 0x6E],	%o5
	edge32ln	%g3,	%g2,	%i0
loop_2888:
	movrne	%o4,	0x328,	%i2
	nop
	setx	0x327756B6,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f17
	setx	0x117B69BA,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f20
	fmuls	%f20,	%f17,	%f12
	edge8	%g7,	%o6,	%i1
	fmovdleu	%xcc,	%f29,	%f9
	bgu,pn	%xcc,	loop_2889
	fors	%f19,	%f30,	%f30
	nop
	setx	0x4E792C8E,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f5
	setx	0xF1E4AE5D,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f13
	fadds	%f13,	%f5,	%f23
	edge32n	%o1,	%i6,	%i3
loop_2889:
	movge	%icc,	%o3,	%g1
	sdivx	%l2,	0x18F8,	%l5
	xor	%l6,	0x16EB,	%i4
	and	%g4,	0x072D,	%l4
	nop
	setx loop_2890, %l0, %l1
	jmpl %l1, %l0
	xor	%l3,	%o7,	%g5
	fmovdcc	%icc,	%f14,	%f3
	fabsd	%f10,	%f16
loop_2890:
	xorcc	%l1,	0x0111,	%g6
	addccc	%o2,	0x033B,	%i5
	movle	%icc,	%o0,	%o5
	nop
	fitod	%f2,	%f14
	fdtoi	%f14,	%f0
	set	0x1A, %o2
	ldsba	[%l7 + %o2] 0x81,	%i7
	movl	%xcc,	%g3,	%g2
	movn	%xcc,	%i0,	%o4
	xor	%i2,	0x1F0F,	%o6
	wr	%g0,	0x88,	%asi
	swapa	[%l7 + 0x28] %asi,	%g7
	bl,a,pn	%xcc,	loop_2891
	umul	%o1,	%i6,	%i3
	fornot1s	%f11,	%f20,	%f30
	set	0x2C, %o3
	swapa	[%l7 + %o3] 0x80,	%i1
loop_2891:
	taddcc	%o3,	0x1D6D,	%g1
	fpack32	%f0,	%f14,	%f30
	tvc	%icc,	0x0
	add	%l7,	0x60,	%l6
	wr	%g0,	0x10,	%asi
	casa	[%l6] %asi,	%l2,	%l5
	sethi	0x0693,	%i4
	sdivx	%l6,	0x1063,	%l4
	fba	%fcc0,	loop_2892
	nop
	setx	loop_2893,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	orn	%l0,	0x14B6,	%l3
	edge8ln	%g4,	%g5,	%o7
loop_2892:
	movrlez	%l1,	%g6,	%i5
loop_2893:
	alignaddr	%o0,	%o2,	%o5
	fmovrslez	%g3,	%f19,	%f10
	set	0x18, %l5
	prefetcha	[%l7 + %l5] 0x18,	 0x3
	bleu,pt	%icc,	loop_2894
	fsrc2	%f30,	%f12
	umulcc	%i0,	%i7,	%o4
	edge16n	%o6,	%g7,	%i2
loop_2894:
	bgu,a,pn	%xcc,	loop_2895
	xor	%o1,	%i6,	%i3
	tg	%xcc,	0x2
	ldub	[%l7 + 0x4E],	%i1
loop_2895:
	nop
	wr	%g0,	0x11,	%asi
	lduha	[%l7 + 0x66] %asi,	%g1
	brgz	%o3,	loop_2896
	popc	0x0EDE,	%l2
	for	%f16,	%f12,	%f8
	bneg,a	loop_2897
loop_2896:
	array16	%i4,	%l5,	%l4
	tneg	%icc,	0x4
	edge32	%l0,	%l6,	%l3
loop_2897:
	subc	%g5,	0x040B,	%g4
	sdivx	%o7,	0x11DB,	%g6
	sub	%i5,	0x1F4F,	%o0
	nop
	fitos	%f5,	%f25
	fstox	%f25,	%f2
	fxtos	%f2,	%f7
	addccc	%l1,	0x03AD,	%o2
	movrlez	%o5,	0x3B6,	%g2
	srl	%i0,	%g3,	%i7
	tcc	%xcc,	0x5
	stb	%o4,	[%l7 + 0x0D]
	ta	%icc,	0x6
	sethi	0x016E,	%o6
	wr	%g0,	0x89,	%asi
	ldxa	[%l7 + 0x18] %asi,	%g7
	fbe	%fcc1,	loop_2898
	tsubcc	%o1,	0x05E4,	%i6
	sdivx	%i3,	0x06C0,	%i2
	fmovdneg	%xcc,	%f15,	%f9
loop_2898:
	array16	%g1,	%o3,	%l2
	mova	%icc,	%i1,	%l5
	fnegs	%f11,	%f4
	tle	%xcc,	0x5
	array16	%i4,	%l4,	%l0
	fbul	%fcc0,	loop_2899
	edge8l	%l3,	%g5,	%l6
	tg	%icc,	0x4
	edge8l	%g4,	%g6,	%o7
loop_2899:
	bvs,a,pn	%xcc,	loop_2900
	tgu	%xcc,	0x7
	membar	0x7E
	te	%xcc,	0x2
loop_2900:
	tn	%icc,	0x1
	bge	%icc,	loop_2901
	sra	%o0,	0x15,	%i5
	ldd	[%l7 + 0x78],	%l0
	movrgz	%o2,	%o5,	%g2
loop_2901:
	orncc	%g3,	0x0E53,	%i7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addc	%o4,	0x09D1,	%i0
	add	%l7,	0x20,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%g7
	casxa	[%l6] 0x80,	%g7,	%o6
	membar	0x5C
	xor	%o1,	%i6,	%i3
	bcs,a,pt	%icc,	loop_2902
	udivx	%i2,	0x1C0E,	%o3
	pdist	%f12,	%f26,	%f6
	ldx	[%l7 + 0x70],	%l2
loop_2902:
	orn	%i1,	0x0893,	%l5
	fpmerge	%f18,	%f31,	%f6
	fornot1	%f10,	%f18,	%f24
	brlez,a	%i4,	loop_2903
	tg	%xcc,	0x7
	andncc	%g1,	%l4,	%l0
	movgu	%icc,	%l3,	%g5
loop_2903:
	nop
	set	0x68, %i3
	prefetcha	[%l7 + %i3] 0x04,	 0x0
	fmovdg	%icc,	%f15,	%f19
	fbule,a	%fcc0,	loop_2904
	nop
	fitos	%f3,	%f2
	fstoi	%f2,	%f25
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	for	%f22,	%f6,	%f8
loop_2904:
	tcc	%icc,	0x1
	ldd	[%l7 + 0x60],	%f18
	fmovrdne	%g6,	%f24,	%f8
	fmovdle	%icc,	%f2,	%f14
	wr	%g0,	0x10,	%asi
	ldsba	[%l7 + 0x14] %asi,	%o7
	fmovrde	%g4,	%f10,	%f8
	bn,pn	%icc,	loop_2905
	fbn	%fcc2,	loop_2906
	pdist	%f10,	%f0,	%f26
	movn	%icc,	%i5,	%l1
loop_2905:
	stx	%o0,	[%l7 + 0x58]
loop_2906:
	nop
	wr	%g0,	0x04,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	brgz,a	%o2,	loop_2907
	mulx	%g2,	0x182F,	%g3
	nop
	fitod	%f4,	%f28
	fdtox	%f28,	%f8
	array8	%o5,	%o4,	%i7
loop_2907:
	tleu	%xcc,	0x2
	fmovdne	%xcc,	%f21,	%f31
	addcc	%g7,	0x0253,	%i0
	tpos	%xcc,	0x0
	nop
	fitod	%f6,	%f10
	fdtos	%f10,	%f6
	fmovdge	%xcc,	%f31,	%f19
	ldd	[%l7 + 0x10],	%o0
	movrlez	%i6,	%i3,	%o6
	udiv	%o3,	0x058B,	%l2
	fmul8x16au	%f31,	%f24,	%f10
	nop
	setx	0x0065E5D2,	%l0,	%l6
	st	%l6,	[%l7 + 0x5C]
	ld	[%l7 + 0x5C],	%fsr
	bne	%icc,	loop_2908
	taddcc	%i2,	%i1,	%l5
	fmovdneg	%xcc,	%f16,	%f19
	wr	%g0,	0x81,	%asi
	swapa	[%l7 + 0x50] %asi,	%g1
loop_2908:
	udivx	%l4,	0x05E0,	%l0
	movcs	%xcc,	%i4,	%g5
	fmovdneg	%icc,	%f30,	%f6
	set	0x2C, %g7
	stwa	%l6,	[%l7 + %g7] 0x10
	fbl,a	%fcc3,	loop_2909
	fmovscs	%icc,	%f2,	%f20
	andcc	%g6,	0x0F50,	%o7
	array16	%l3,	%g4,	%l1
loop_2909:
	pdist	%f22,	%f10,	%f12
	fabsd	%f18,	%f12
	lduw	[%l7 + 0x5C],	%o0
	fmovdcc	%icc,	%f14,	%f8
	edge32	%o2,	%i5,	%g3
	orncc	%g2,	%o5,	%i7
	nop
	fitod	%f0,	%f18
	fdtox	%f18,	%f28
	fxtod	%f28,	%f26
	movg	%icc,	%o4,	%i0
	set	0x60, %l0
	swapa	[%l7 + %l0] 0x04,	%o1
	stbar
	xor	%g7,	%i3,	%i6
	fcmpgt32	%f20,	%f16,	%o3
	tcc	%xcc,	0x6
	edge32ln	%l2,	%i2,	%o6
	udivcc	%i1,	0x1BAE,	%g1
	tg	%xcc,	0x3
	tg	%xcc,	0x2
	xnorcc	%l4,	0x12E6,	%l5
	movrgz	%l0,	0x03E,	%i4
	subcc	%l6,	0x0990,	%g6
	movrne	%o7,	%l3,	%g4
	tgu	%icc,	0x5
	for	%f30,	%f22,	%f10
	andncc	%l1,	%g5,	%o0
	ld	[%l7 + 0x64],	%f31
	set	0x38, %i1
	ldxa	[%l7 + %i1] 0x18,	%o2
	call	loop_2910
	tle	%xcc,	0x5
	set	0x68, %i2
	lda	[%l7 + %i2] 0x18,	%f5
loop_2910:
	movcs	%icc,	%i5,	%g3
	fbu,a	%fcc1,	loop_2911
	flush	%l7 + 0x74
	ldsh	[%l7 + 0x24],	%o5
	nop
	fitod	%f0,	%f16
	fdtox	%f16,	%f2
	fxtod	%f2,	%f0
loop_2911:
	bpos,a	loop_2912
	be,a	loop_2913
	umul	%g2,	%o4,	%i7
	ta	%icc,	0x3
loop_2912:
	ble,a,pn	%xcc,	loop_2914
loop_2913:
	popc	%i0,	%g7
	edge8	%o1,	%i3,	%o3
	fmovrslz	%i6,	%f0,	%f0
loop_2914:
	nop
	wr	%g0,	0x11,	%asi
	lduwa	[%l7 + 0x48] %asi,	%l2
	mulx	%i2,	%o6,	%i1
	fsrc2	%f22,	%f12
	tcs	%xcc,	0x5
	fsrc1	%f24,	%f0
	fsrc2	%f6,	%f24
	nop
	setx	0x3D9431D4,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f14
	setx	0x301A1505,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f30
	fsubs	%f30,	%f14,	%f4
	edge16	%g1,	%l4,	%l5
	array8	%l0,	%l6,	%g6
	nop
	set	0x18, %i5
	ldx	[%l7 + %i5],	%i4
	udiv	%l3,	0x0D73,	%g4
	membar	0x38
	udiv	%l1,	0x0948,	%o7
	edge32l	%o0,	%g5,	%i5
	fxor	%f26,	%f6,	%f0
	edge16n	%o2,	%g3,	%g2
	tcc	%xcc,	0x4
	bge,a,pt	%xcc,	loop_2915
	movle	%icc,	%o4,	%o5
	ldd	[%l7 + 0x48],	%f24
	ta	%xcc,	0x6
loop_2915:
	udivcc	%i0,	0x1431,	%i7
	fbn,a	%fcc2,	loop_2916
	bcs,pt	%icc,	loop_2917
	umulcc	%g7,	0x12F7,	%o1
	or	%o3,	0x1D80,	%i3
loop_2916:
	mulx	%l2,	%i6,	%i2
loop_2917:
	movg	%icc,	%i1,	%o6
	movgu	%icc,	%g1,	%l5
	fmovdle	%icc,	%f23,	%f19
	mulscc	%l4,	0x07F9,	%l0
	fbug	%fcc0,	loop_2918
	fmovrdgz	%l6,	%f6,	%f10
	set	0x48, %i6
	lda	[%l7 + %i6] 0x19,	%f5
loop_2918:
	edge32n	%g6,	%l3,	%g4
	addc	%i4,	0x1917,	%l1
	movpos	%icc,	%o7,	%o0
	fmovsle	%icc,	%f4,	%f25
	nop
	fitos	%f28,	%f30
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tleu	%xcc,	0x1
	fpack32	%f26,	%f28,	%f16
	subccc	%i5,	%o2,	%g3
	sll	%g2,	%o4,	%g5
	movre	%i0,	0x04F,	%i7
	movle	%xcc,	%o5,	%o1
	set	0x6C, %l6
	lduwa	[%l7 + %l6] 0x88,	%g7
	fmovrdne	%o3,	%f8,	%f14
	andcc	%l2,	%i6,	%i2
	fmul8sux16	%f0,	%f26,	%f10
	array32	%i3,	%i1,	%o6
	srax	%l5,	%l4,	%g1
	array16	%l0,	%l6,	%l3
	edge8ln	%g6,	%g4,	%l1
	movcs	%icc,	%i4,	%o7
	fbo,a	%fcc2,	loop_2919
	ld	[%l7 + 0x48],	%f8
	popc	%i5,	%o0
	te	%xcc,	0x0
loop_2919:
	taddcctv	%g3,	0x0F9E,	%o2
	pdist	%f28,	%f30,	%f10
	mova	%xcc,	%g2,	%g5
	fsrc1	%f16,	%f18
	orcc	%o4,	0x1327,	%i7
	bn,a	loop_2920
	edge8ln	%i0,	%o1,	%o5
	movl	%icc,	%o3,	%g7
	st	%f2,	[%l7 + 0x34]
loop_2920:
	alignaddrl	%l2,	%i2,	%i3
	popc	0x1C72,	%i1
	fbge	%fcc1,	loop_2921
	sethi	0x0E3F,	%o6
	movle	%icc,	%l5,	%l4
	edge32	%g1,	%l0,	%l6
loop_2921:
	fandnot1	%f28,	%f18,	%f22
	set	0x40, %g4
	ldda	[%l7 + %g4] 0x19,	%f0
	movg	%xcc,	%i6,	%l3
	movrlz	%g6,	%g4,	%i4
	fpack32	%f4,	%f12,	%f12
	edge16ln	%l1,	%i5,	%o7
	set	0x58, %i4
	sta	%f19,	[%l7 + %i4] 0x18
	edge16l	%o0,	%o2,	%g3
	set	0x28, %g6
	lduba	[%l7 + %g6] 0x89,	%g2
	te	%xcc,	0x6
	wr	%g0,	0x10,	%asi
	ldstuba	[%l7 + 0x3E] %asi,	%o4
	movrgz	%g5,	0x1F1,	%i0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdivcc	%i7,	0x1338,	%o1
	set	0x20, %l4
	stxa	%o5,	[%l7 + %l4] 0x2a
	membar	#Sync
	array8	%g7,	%l2,	%o3
	set	0x40, %o4
	ldda	[%l7 + %o4] 0x18,	%f0
	orn	%i2,	0x01F6,	%i3
	movrlz	%i1,	0x26B,	%o6
	fbne	%fcc2,	loop_2922
	nop
	fitos	%f14,	%f29
	brgz	%l5,	loop_2923
	movvc	%xcc,	%g1,	%l4
loop_2922:
	addccc	%l0,	%i6,	%l3
	fands	%f25,	%f11,	%f13
loop_2923:
	orn	%l6,	%g6,	%i4
	addccc	%l1,	0x1DEB,	%g4
	xorcc	%o7,	%i5,	%o0
	te	%xcc,	0x2
	popc	0x061C,	%o2
	set	0x7C, %o6
	lduha	[%l7 + %o6] 0x89,	%g2
	tn	%icc,	0x6
	fpadd32s	%f17,	%f15,	%f28
	lduw	[%l7 + 0x50],	%g3
	be,a,pn	%xcc,	loop_2924
	mova	%xcc,	%o4,	%i0
	popc	0x1C45,	%g5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2924:
	movrlz	%o1,	%o5,	%i7
	orn	%l2,	%o3,	%i2
	popc	%g7,	%i1
	fsrc2	%f10,	%f2
	fmovdleu	%xcc,	%f26,	%f13
	ldx	[%l7 + 0x18],	%o6
	udivcc	%i3,	0x11D3,	%l5
	move	%xcc,	%l4,	%l0
	nop
	fitod	%f7,	%f14
	brlz	%g1,	loop_2925
	be,pn	%xcc,	loop_2926
	sra	%i6,	0x13,	%l6
	add	%l3,	0x0854,	%i4
loop_2925:
	edge32ln	%g6,	%g4,	%o7
loop_2926:
	fpack32	%f20,	%f0,	%f18
	xor	%i5,	0x0DDA,	%l1
	movrne	%o0,	0x0BE,	%o2
	fcmpne32	%f4,	%f2,	%g2
	sub	%g3,	0x196B,	%i0
	alignaddr	%g5,	%o4,	%o1
	wr	%g0,	0x19,	%asi
	ldsba	[%l7 + 0x21] %asi,	%i7
	subccc	%l2,	%o3,	%i2
	edge8ln	%g7,	%i1,	%o6
	bvs,a	loop_2927
	fbug,a	%fcc2,	loop_2928
	addcc	%i3,	0x185B,	%l5
	movrlz	%o5,	%l0,	%l4
loop_2927:
	alignaddrl	%g1,	%i6,	%l6
loop_2928:
	ldd	[%l7 + 0x20],	%i4
	fcmpgt32	%f16,	%f10,	%g6
	sub	%l3,	0x0662,	%o7
	fmovda	%icc,	%f27,	%f23
	tleu	%icc,	0x6
	smulcc	%g4,	0x0A2C,	%l1
	faligndata	%f28,	%f28,	%f8
	fnor	%f26,	%f2,	%f30
	srl	%o0,	%o2,	%i5
	fmovdne	%xcc,	%f22,	%f9
	movvc	%xcc,	%g3,	%g2
	fmovsneg	%xcc,	%f22,	%f1
	nop
	set	0x3C, %g3
	ldsw	[%l7 + %g3],	%g5
	fbuge	%fcc3,	loop_2929
	add	%i0,	0x0BBB,	%o1
	te	%icc,	0x3
	movrgz	%i7,	0x2CF,	%l2
loop_2929:
	nop
	setx	0x7EA070A403C59B8D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	fsqrtd	%f12,	%f10
	xor	%o4,	0x1F79,	%i2
	mulscc	%o3,	%g7,	%o6
	edge8ln	%i3,	%l5,	%o5
	prefetch	[%l7 + 0x0C],	 0x3
	fmovrdne	%l0,	%f22,	%f14
	edge16ln	%i1,	%g1,	%l4
	nop
	setx	0x55B4B191,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f30
	setx	0xB35FF78E,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f22
	fsubs	%f22,	%f30,	%f15
	sub	%l6,	0x0581,	%i4
	sdivcc	%i6,	0x0832,	%l3
	movrgz	%o7,	%g6,	%g4
	movrgz	%o0,	0x0A9,	%o2
	tneg	%xcc,	0x7
	movg	%icc,	%i5,	%l1
	brlez,a	%g3,	loop_2930
	nop
	setx	0xA04CF922,	%l0,	%l6
	st	%l6,	[%l7 + 0x54]
	ld	[%l7 + 0x54],	%fsr
	nop
	setx	0xA3881C21757C4FE1,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0x574A7268827A4CE1,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	fmuld	%f10,	%f28,	%f0
	movgu	%xcc,	%g5,	%g2
loop_2930:
	movcc	%xcc,	%i0,	%i7
	brlz,a	%l2,	loop_2931
	movre	%o1,	%o4,	%o3
	tneg	%xcc,	0x5
	for	%f0,	%f8,	%f30
loop_2931:
	tpos	%xcc,	0x4
	movrgez	%i2,	0x1D6,	%o6
	sethi	0x1D56,	%g7
	wr	%g0,	0x89,	%asi
	prefetcha	[%l7 + 0x38] %asi,	 0x3
	tneg	%icc,	0x5
	tl	%xcc,	0x0
	stb	%o5,	[%l7 + 0x3B]
	tvc	%xcc,	0x1
	add	%l7,	0x30,	%l6
	wr	%g0,	0x0c,	%asi
	casxa	[%l6] 0x0c,	%l5,	%i1
	orcc	%g1,	0x0A32,	%l0
	edge8n	%l4,	%i4,	%l6
	bleu	loop_2932
	call	loop_2933
	sdiv	%l3,	0x104F,	%i6
	tsubcc	%g6,	%g4,	%o7
loop_2932:
	movn	%xcc,	%o0,	%o2
loop_2933:
	nop
	setx	0x6C152A04FA552686,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0x0FC3105A8C1ED6E0,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	fmuld	%f18,	%f8,	%f22
	fors	%f7,	%f24,	%f22
	fbo,a	%fcc2,	loop_2934
	edge16l	%i5,	%g3,	%g5
	edge8n	%l1,	%i0,	%i7
	fabsd	%f8,	%f30
loop_2934:
	nop
	wr	%g0,	0x80,	%asi
	prefetcha	[%l7 + 0x38] %asi,	 0x1
	sll	%g2,	%o1,	%o3
	fnot1	%f20,	%f24
	edge32n	%i2,	%o4,	%g7
	movneg	%icc,	%i3,	%o5
	te	%icc,	0x5
	fmovrdne	%o6,	%f26,	%f10
	alignaddrl	%i1,	%l5,	%l0
	set	0x68, %o5
	sta	%f23,	[%l7 + %o5] 0x10
	movrgz	%g1,	0x024,	%l4
	srax	%l6,	%l3,	%i6
	sll	%i4,	%g4,	%g6
	movne	%icc,	%o7,	%o0
	tsubcc	%i5,	0x1752,	%g3
	xnorcc	%g5,	0x0B67,	%l1
	bne,pn	%icc,	loop_2935
	edge32	%i0,	%o2,	%l2
	movg	%icc,	%g2,	%i7
	tleu	%xcc,	0x2
loop_2935:
	nop
	add	%l7,	0x50,	%l6
	wr	%g0,	0x18,	%asi
	ldxa	[%l6] %asi,	%o3
	casxa	[%l6] %asi,	%o3,	%o1
	array32	%i2,	%o4,	%i3
	add	%l7,	0x54,	%l6
	wr	%g0,	0x04,	%asi
	lda	[%l6] %asi,	%g7
	casa	[%l6] 0x04,	%g7,	%o6
	tcc	%icc,	0x4
	fmovrsgez	%i1,	%f0,	%f21
	and	%l5,	0x151E,	%o5
	tpos	%icc,	0x6
	fba	%fcc0,	loop_2936
	sdivx	%g1,	0x0E3B,	%l4
	fcmpeq32	%f8,	%f6,	%l6
	fbn	%fcc3,	loop_2937
loop_2936:
	mulscc	%l3,	%l0,	%i6
	wr	%g0,	0x80,	%asi
	ldstuba	[%l7 + 0x2E] %asi,	%i4
loop_2937:
	move	%icc,	%g4,	%o7
	tcs	%xcc,	0x6
	fmovdg	%icc,	%f13,	%f6
	bvs	loop_2938
	orn	%g6,	%i5,	%o0
	wr	%g0,	0x04,	%asi
	stha	%g5,	[%l7 + 0x42] %asi
loop_2938:
	movgu	%icc,	%g3,	%i0
	sdiv	%l1,	0x13FE,	%o2
	tne	%xcc,	0x4
	set	0x18, %g2
	sta	%f18,	[%l7 + %g2] 0x81
	movl	%xcc,	%l2,	%g2
	tge	%xcc,	0x1
	movrgz	%o3,	0x058,	%o1
	set	0x40, %g1
	ldda	[%l7 + %g1] 0x88,	%i6
	tneg	%icc,	0x2
	tvc	%icc,	0x1
	movvs	%icc,	%o4,	%i2
	array8	%g7,	%i3,	%o6
	fmovrsne	%l5,	%f1,	%f11
	bl,a	loop_2939
	fxnor	%f30,	%f2,	%f10
	array32	%i1,	%g1,	%l4
	movle	%icc,	%l6,	%o5
loop_2939:
	bn,a	%xcc,	loop_2940
	sethi	0x1E50,	%l0
	mulscc	%i6,	%i4,	%l3
	fbne,a	%fcc3,	loop_2941
loop_2940:
	or	%o7,	0x1170,	%g6
	edge8l	%g4,	%i5,	%g5
	tcs	%icc,	0x6
loop_2941:
	fornot2	%f18,	%f4,	%f2
	tsubcc	%g3,	%i0,	%o0
	mulx	%o2,	0x1A0A,	%l1
	fand	%f26,	%f6,	%f16
	wr	%g0,	0x89,	%asi
	ldstuba	[%l7 + 0x58] %asi,	%l2
	andcc	%g2,	%o3,	%i7
	movgu	%xcc,	%o1,	%o4
	smul	%g7,	0x0CC3,	%i3
	fmovrslz	%i2,	%f17,	%f5
	edge16n	%l5,	%o6,	%i1
	fbul	%fcc2,	loop_2942
	move	%icc,	%g1,	%l6
	movre	%l4,	%l0,	%o5
	nop
	set	0x70, %o1
	ldd	[%l7 + %o1],	%i4
loop_2942:
	brgez,a	%i6,	loop_2943
	movrgz	%l3,	0x3AF,	%g6
	xorcc	%g4,	0x1405,	%o7
	xnor	%i5,	%g3,	%g5
loop_2943:
	lduw	[%l7 + 0x40],	%i0
	movvc	%icc,	%o2,	%l1
	subcc	%l2,	0x1C94,	%g2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovd	%f12,	%f6
	tvs	%xcc,	0x3
	srlx	%o3,	0x1B,	%o0
	std	%f24,	[%l7 + 0x38]
	movrlz	%o1,	0x283,	%o4
	edge32n	%i7,	%g7,	%i2
	movrgez	%i3,	0x33F,	%l5
	tle	%xcc,	0x0
	orcc	%i1,	0x150E,	%o6
	array32	%l6,	%l4,	%l0
	movge	%xcc,	%g1,	%i4
	fmovsg	%icc,	%f10,	%f12
	sethi	0x0E55,	%o5
	srax	%i6,	%g6,	%g4
	wr	%g0,	0x11,	%asi
	ldsha	[%l7 + 0x20] %asi,	%l3
	fmovsvs	%icc,	%f26,	%f25
	fpsub32	%f30,	%f0,	%f30
	fbug	%fcc1,	loop_2944
	popc	%i5,	%g3
	fornot2	%f20,	%f18,	%f12
	andcc	%g5,	0x05BB,	%o7
loop_2944:
	sub	%i0,	0x1E92,	%o2
	lduh	[%l7 + 0x34],	%l2
	fbug	%fcc1,	loop_2945
	xor	%g2,	0x1D92,	%o3
	tcs	%xcc,	0x2
	fnot2s	%f23,	%f7
loop_2945:
	nop
	set	0x0C, %o0
	swapa	[%l7 + %o0] 0x18,	%o0
	ba,a,pn	%icc,	loop_2946
	edge8l	%l1,	%o4,	%i7
	fcmple16	%f2,	%f12,	%o1
	fornot1	%f12,	%f20,	%f26
loop_2946:
	fandnot2s	%f12,	%f19,	%f7
	add	%g7,	%i3,	%l5
	edge8ln	%i1,	%o6,	%i2
	fornot1s	%f27,	%f3,	%f30
	srlx	%l4,	%l0,	%l6
	sll	%i4,	%o5,	%i6
	set	0x78, %i7
	stxa	%g6,	[%l7 + %i7] 0x88
	movneg	%icc,	%g4,	%g1
	wr	%g0,	0x19,	%asi
	prefetcha	[%l7 + 0x60] %asi,	 0x0
	fba	%fcc2,	loop_2947
	sub	%g3,	0x19D6,	%g5
	faligndata	%f0,	%f10,	%f18
	mulx	%o7,	%i5,	%i0
loop_2947:
	fnot2	%f8,	%f18
	fblg	%fcc1,	loop_2948
	movrgz	%l2,	0x035,	%g2
	xorcc	%o2,	%o3,	%o0
	tvs	%icc,	0x7
loop_2948:
	membar	0x19
	fmovdleu	%xcc,	%f28,	%f13
	tn	%xcc,	0x4
	fmul8x16al	%f19,	%f2,	%f30
	add	%l1,	%o4,	%i7
	edge16n	%o1,	%g7,	%l5
	be	%icc,	loop_2949
	bleu,pt	%xcc,	loop_2950
	tneg	%icc,	0x7
	bge	%icc,	loop_2951
loop_2949:
	fornot2	%f10,	%f2,	%f22
loop_2950:
	umulcc	%i1,	0x13CE,	%o6
	tn	%xcc,	0x3
loop_2951:
	fble	%fcc1,	loop_2952
	movl	%xcc,	%i2,	%i3
	sra	%l0,	0x08,	%l6
	fpackfix	%f16,	%f31
loop_2952:
	ta	%xcc,	0x6
	ldub	[%l7 + 0x5C],	%i4
	set	0x30, %l1
	ldxa	[%l7 + %l1] 0x88,	%l4
	bvs	loop_2953
	movn	%icc,	%o5,	%g6
	brz,a	%i6,	loop_2954
	xnor	%g4,	%g1,	%g3
loop_2953:
	sth	%l3,	[%l7 + 0x34]
	edge32n	%g5,	%o7,	%i5
loop_2954:
	sethi	0x0D05,	%i0
	wr	%g0,	0x80,	%asi
	sta	%f10,	[%l7 + 0x10] %asi
	tpos	%icc,	0x7
	fmovdne	%icc,	%f16,	%f2
	wr	%g0,	0x81,	%asi
	ldsha	[%l7 + 0x2C] %asi,	%g2
	nop
	fitos	%f6,	%f19
	fstox	%f19,	%f12
	fxtos	%f12,	%f27
	fmovdneg	%icc,	%f10,	%f31
	movrgz	%l2,	0x344,	%o2
	edge8n	%o0,	%l1,	%o4
	movl	%icc,	%o3,	%i7
	fand	%f8,	%f26,	%f0
	set	0x1E, %g5
	ldsba	[%l7 + %g5] 0x04,	%o1
	add	%l7,	0x48,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%l5
	casxa	[%l6] %asi,	%l5,	%g7
	fmovrdlez	%i1,	%f18,	%f28
	tvs	%xcc,	0x7
	edge8	%o6,	%i3,	%l0
	bleu,pt	%xcc,	loop_2955
	array8	%l6,	%i2,	%i4
	tvc	%xcc,	0x3
	bleu	%icc,	loop_2956
loop_2955:
	fbue,a	%fcc1,	loop_2957
	smul	%l4,	%o5,	%g6
	or	%g4,	%g1,	%g3
loop_2956:
	edge32ln	%i6,	%l3,	%g5
loop_2957:
	fmovsvc	%xcc,	%f1,	%f1
	xnor	%i5,	%i0,	%g2
	ldd	[%l7 + 0x20],	%l2
	be,a,pt	%icc,	loop_2958
	umul	%o2,	%o7,	%o0
	ldsb	[%l7 + 0x5D],	%o4
	movg	%icc,	%l1,	%o3
loop_2958:
	fmovdpos	%xcc,	%f13,	%f21
	array16	%o1,	%i7,	%g7
	andcc	%l5,	0x0F28,	%i1
	ta	%xcc,	0x3
	movrne	%i3,	0x3F0,	%l0
	sll	%l6,	0x18,	%i2
	edge16n	%i4,	%l4,	%o6
	fcmpne16	%f20,	%f30,	%g6
	fnot2s	%f25,	%f6
	nop
	fitos	%f9,	%f7
	nop
	setx	0xE012956C,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f26
	setx	0x5E5F4A2E,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f9
	fadds	%f9,	%f26,	%f6
	udiv	%g4,	0x15A9,	%o5
	sdivcc	%g1,	0x1710,	%i6
	fbl,a	%fcc3,	loop_2959
	srax	%l3,	%g3,	%i5
	orcc	%i0,	%g5,	%g2
	movne	%xcc,	%o2,	%o7
loop_2959:
	fsrc1s	%f30,	%f26
	tcs	%xcc,	0x4
	ta	%xcc,	0x2
	edge16	%l2,	%o0,	%l1
	movrgez	%o3,	%o4,	%i7
	fble,a	%fcc3,	loop_2960
	edge32l	%g7,	%l5,	%o1
	xnor	%i3,	%l0,	%i1
	movcs	%icc,	%l6,	%i2
loop_2960:
	bl,pn	%icc,	loop_2961
	fors	%f19,	%f31,	%f0
	set	0x2C, %l3
	ldswa	[%l7 + %l3] 0x14,	%l4
loop_2961:
	andn	%i4,	0x1300,	%g6
	udivcc	%o6,	0x09DF,	%o5
	or	%g4,	%i6,	%l3
	bgu,pn	%icc,	loop_2962
	tneg	%xcc,	0x1
	wr	%g0,	0x2f,	%asi
	stba	%g1,	[%l7 + 0x7C] %asi
	membar	#Sync
loop_2962:
	nop
	set	0x10, %l2
	ldda	[%l7 + %l2] 0x0c,	%i4
	addcc	%i0,	0x071B,	%g3
	movrlz	%g5,	%g2,	%o7
	ldsh	[%l7 + 0x36],	%l2
	movrlez	%o0,	0x134,	%l1
	fpsub16	%f8,	%f2,	%f2
	fandnot1	%f26,	%f20,	%f22
	edge8	%o2,	%o3,	%o4
	edge16l	%i7,	%l5,	%g7
	bleu,a,pn	%icc,	loop_2963
	movg	%icc,	%o1,	%i3
	alignaddrl	%i1,	%l6,	%i2
	movcc	%xcc,	%l4,	%l0
loop_2963:
	srlx	%g6,	0x12,	%o6
	tneg	%xcc,	0x0
	ba,a,pn	%xcc,	loop_2964
	tg	%icc,	0x4
	srl	%o5,	%g4,	%i4
	sir	0x1A5D
loop_2964:
	tge	%icc,	0x3
	taddcc	%l3,	%g1,	%i5
	movcs	%icc,	%i0,	%g3
	tsubcctv	%i6,	0x1441,	%g5
	movl	%xcc,	%g2,	%o7
	fbe	%fcc2,	loop_2965
	fbge,a	%fcc3,	loop_2966
	sllx	%o0,	0x06,	%l1
	xorcc	%l2,	0x0A84,	%o3
loop_2965:
	be,a,pt	%xcc,	loop_2967
loop_2966:
	movleu	%icc,	%o4,	%o2
	xorcc	%i7,	%l5,	%o1
	tn	%xcc,	0x6
loop_2967:
	fmovrde	%i3,	%f18,	%f10
	wr	%g0,	0x11,	%asi
	lduha	[%l7 + 0x62] %asi,	%g7
	sethi	0x1451,	%i1
	orn	%i2,	0x1458,	%l4
	smulcc	%l6,	0x1EA3,	%l0
	bl,pt	%xcc,	loop_2968
	fpsub16	%f8,	%f2,	%f6
	sra	%g6,	%o5,	%o6
	sllx	%g4,	0x1A,	%i4
loop_2968:
	tgu	%xcc,	0x5
	tgu	%xcc,	0x5
	add	%l7,	0x50,	%l6
	wr	%g0,	0x18,	%asi
	casxa	[%l6] 0x18,	%l3,	%g1
	fmovsvs	%xcc,	%f0,	%f20
	or	%i5,	0x1305,	%g3
	movneg	%icc,	%i0,	%i6
	edge8	%g5,	%o7,	%o0
	nop
	setx	0x5834A0DFF059EB14,	%l0,	%l6
	stx	%l6,	[%l7 + 0x58]
	ldx	[%l7 + 0x58],	%fsr
	tge	%xcc,	0x0
	movl	%icc,	%l1,	%l2
	movcs	%xcc,	%g2,	%o3
	fbne,a	%fcc0,	loop_2969
	tge	%xcc,	0x7
	taddcctv	%o2,	%i7,	%l5
	fbl,a	%fcc2,	loop_2970
loop_2969:
	srax	%o1,	%i3,	%g7
	fmovdn	%xcc,	%f11,	%f29
	udiv	%i1,	0x0EEF,	%o4
loop_2970:
	fmovrde	%l4,	%f16,	%f30
	udivx	%i2,	0x019E,	%l0
	edge8ln	%l6,	%o5,	%o6
	set	0x4C, %i0
	ldsha	[%l7 + %i0] 0x19,	%g4
	fbg	%fcc2,	loop_2971
	mulscc	%i4,	%g6,	%l3
	nop
	setx	0xC9EDC293DA07DD83,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0xE75B45FA837C16DE,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	fmuld	%f18,	%f2,	%f20
	udivcc	%i5,	0x160B,	%g3
loop_2971:
	addccc	%i0,	0x104B,	%i6
	add	%l7,	0x64,	%l6
	wr	%g0,	0x10,	%asi
	casa	[%l6] 0x10,	%g1,	%o7
	membar	#Sync
	wr	%g0,	0x1e,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	fmul8sux16	%f2,	%f26,	%f18
	edge8l	%g5,	%l1,	%l2
	set	0x30, %o7
	stxa	%o0,	[%g0 + %o7] 0x20
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 0:
!
!	Type l   	: 2846
!	Type x   	: 1250
!	Type cti   	: 2971
!	Type f   	: 4549
!	Type i   	: 13384
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


	EXIT_GOOD	/* test finish  */

/************************************************************************
   Test case data start
 ************************************************************************/
.data
user_data_start:
scratch_area:
.word 0x56B480B1
.word 0xB306672C
.word 0xAEBE4299
.word 0xC1628A2F
.word 0x4FA55079
.word 0x1337686C
.word 0x32C8AA93
.word 0x5FEF2E25
.word 0xBB1F4CCB
.word 0x3A265A80
.word 0xD060D77F
.word 0x6976C550
.word 0x6D281848
.word 0x6853BDF9
.word 0xB9211761
.word 0x7B168437
.word 0x986EC81A
.word 0xE6138512
.word 0x31261E8E
.word 0x65C70CED
.word 0x528A944A
.word 0x1CE05F00
.word 0xE7CBB14F
.word 0x6821540A
.word 0x43F24380
.word 0x7222DAFF
.word 0x61A2D639
.word 0x48EF4DEA
.word 0x1AA1F1E6
.word 0x17177576
.word 0xFADC7D02
.word 0xD0FB8DA4
.word 0x70829B93
.word 0x0CB4AEEC
.word 0xFE63D409
.word 0x03453E58
.word 0x79B34B1F
.word 0x16568403
.word 0x6123BF24
.word 0xA406A63C
.word 0x860FB196
.word 0x0046DFEA
.word 0x18A5E533
.word 0xE512AB33
.word 0xA2A6EF9F
.word 0x151822CC
.word 0x8635BCBE
.word 0x2B4B27FE
.word 0x14DCA31C
.word 0x93629DC0
.word 0x9B54B33A
.word 0xD1B0F3F0
.word 0x11830339
.word 0x81895F37
.word 0xCE561056
.word 0x0C99897F
.word 0xAE929113
.word 0x0D9C0D2E
.word 0x95F454BE
.word 0xCFB196C3
.word 0x464337C7
.word 0x46E06DB2
.word 0x661C875B
.word 0x0DCA6371
.end
