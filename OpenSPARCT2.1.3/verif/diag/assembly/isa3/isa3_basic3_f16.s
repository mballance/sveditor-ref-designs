/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: isa3_basic3_f16.s
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
.ident "Using Instruction Hash for Focus :$Id: isa3_basic3_f16.s,v 1.1 2007/05/11 17:22:22 drp Exp $"
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
	setx	0xE59B887700466B0C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x0]
	ldx	[%l7 + 0x0],	%fsr
!
! Thread 0 Start
!
main_t0:

	!# Initialize registers ..

	!# Global registers
	set	0x9,	%g1
	set	0x7,	%g2
	set	0xE,	%g3
	set	0x7,	%g4
	set	0xC,	%g5
	set	0xB,	%g6
	set	0x7,	%g7
	!# Input registers
	set	-0x7,	%i0
	set	-0xD,	%i1
	set	-0xA,	%i2
	set	-0x7,	%i3
	set	-0xA,	%i4
	set	-0x3,	%i5
	set	-0x9,	%i6
	set	-0x2,	%i7
	!# Local registers
	set	0x4DFB4A79,	%l0
	set	0x3F062E64,	%l1
	set	0x17DA835F,	%l2
	set	0x619C4B0F,	%l3
	set	0x2284D2C3,	%l4
	set	0x7BF039CC,	%l5
	set	0x55AAEA21,	%l6
	!# Output registers
	set	0x08D0,	%o0
	set	-0x0956,	%o1
	set	0x12FD,	%o2
	set	-0x011E,	%o3
	set	-0x1C6B,	%o4
	set	-0x0001,	%o5
	set	0x1D53,	%o6
	set	-0x1C10,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0xCF826D9AA8C55237)
	INIT_TH_FP_REG(%l7,%f2,0xD7170932988BC81C)
	INIT_TH_FP_REG(%l7,%f4,0x2EC7D18FDDDDED8B)
	INIT_TH_FP_REG(%l7,%f6,0x271E515B8E77C389)
	INIT_TH_FP_REG(%l7,%f8,0x62753F6CE31BDF68)
	INIT_TH_FP_REG(%l7,%f10,0x89CAE1BAEB220D3A)
	INIT_TH_FP_REG(%l7,%f12,0x4D43E03E889DAB86)
	INIT_TH_FP_REG(%l7,%f14,0xD50195D332AEB276)
	INIT_TH_FP_REG(%l7,%f16,0x026B8F0DD79207F1)
	INIT_TH_FP_REG(%l7,%f18,0xD99D71D1425E21E5)
	INIT_TH_FP_REG(%l7,%f20,0xB570019F81B0ABBB)
	INIT_TH_FP_REG(%l7,%f22,0x9A1F43D20A95C13E)
	INIT_TH_FP_REG(%l7,%f24,0x9ED0817C7F1D2DEB)
	INIT_TH_FP_REG(%l7,%f26,0xCC32128AE967DF18)
	INIT_TH_FP_REG(%l7,%f28,0x92085F51B5D2C567)
	INIT_TH_FP_REG(%l7,%f30,0x5F829FC476A286AE)
	!# Other state
	
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xC81, 	%hsys_tick_cmpr


	!# Execute Main Diag ..

	taddcctv	%i0,	0x11AC,	%o6
	fmovrsgez	%l2,	%f25,	%f31
	ldd	[%l7 + 0x40],	%f28
	stb	%g7,	[%l7 + 0x26]
	movrlz	%i7,	0x260,	%g2
	fsrc1	%f10,	%f0
	fnot1	%f24,	%f18
	alignaddr	%o2,	%o4,	%i2
	edge8n	%g6,	%o7,	%l1
	movleu	%icc,	%i3,	%o3
	fmovsg	%icc,	%f17,	%f16
	brz	%i4,	loop_1
	bg	loop_2
	srl	%g5,	0x0F,	%i6
	movleu	%icc,	%o0,	%l0
loop_1:
	edge8l	%g1,	%g4,	%l3
loop_2:
	bpos,a	loop_3
	fbn,a	%fcc0,	loop_4
	bn,pt	%icc,	loop_5
	fbug	%fcc3,	loop_6
loop_3:
	movvs	%xcc,	%g3,	%o5
loop_4:
	fors	%f14,	%f4,	%f3
loop_5:
	fmovrdlez	%l4,	%f2,	%f8
loop_6:
	tcc	%xcc,	0x2
	fmovrdgz	%i1,	%f26,	%f26
	edge8l	%o1,	%l5,	%l6
	movgu	%xcc,	%i0,	%i5
	fbge,a	%fcc0,	loop_7
	fnot1	%f16,	%f28
	popc	%l2,	%o6
	bshuffle	%f10,	%f10,	%f26
loop_7:
	bcs	loop_8
	tpos	%icc,	0x2
	flush	%l7 + 0x58
	mulscc	%i7,	%g7,	%g2
loop_8:
	nop
	set	0x58, %o0
	stda	%o4,	[%l7 + %o0] 0x27
	membar	#Sync
	movcs	%icc,	%o2,	%g6
	movrne	%o7,	0x197,	%l1
	edge32l	%i3,	%i2,	%i4
	popc	%g5,	%o3
	te	%xcc,	0x3
	edge16n	%o0,	%i6,	%g1
	smulcc	%l0,	0x0172,	%g4
	fandnot2	%f18,	%f30,	%f18
	ta	%xcc,	0x5
	movn	%icc,	%l3,	%g3
	edge16ln	%l4,	%i1,	%o1
	sllx	%o5,	0x1E,	%l6
	edge32l	%l5,	%i0,	%i5
	movg	%xcc,	%o6,	%i7
	set	0x0E, %g5
	stha	%g7,	[%l7 + %g5] 0xeb
	membar	#Sync
	tvs	%icc,	0x7
	popc	0x015B,	%l2
	subccc	%o4,	0x0B9A,	%g2
	fmovdgu	%xcc,	%f26,	%f28
	ldsh	[%l7 + 0x0C],	%g6
	movl	%xcc,	%o7,	%o2
	fnegs	%f5,	%f3
	ld	[%l7 + 0x28],	%f23
	movg	%icc,	%i3,	%i2
	te	%xcc,	0x5
	fbl	%fcc3,	loop_9
	fnot2	%f8,	%f14
	sll	%l1,	%g5,	%o3
	udivcc	%o0,	0x1AFA,	%i4
loop_9:
	mova	%icc,	%i6,	%g1
	smul	%l0,	0x1B9F,	%l3
	xor	%g4,	0x0AE0,	%g3
	sra	%l4,	%i1,	%o1
	fandnot1	%f8,	%f0,	%f26
	movn	%xcc,	%o5,	%l5
	fbue	%fcc3,	loop_10
	tneg	%icc,	0x0
	udivcc	%l6,	0x1F7E,	%i0
	edge32l	%i5,	%o6,	%g7
loop_10:
	fsrc1s	%f14,	%f4
	movrgz	%i7,	0x227,	%l2
	srax	%o4,	0x1D,	%g2
	edge16ln	%o7,	%o2,	%i3
	bneg,a,pt	%xcc,	loop_11
	stbar
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	flush	%l7 + 0x74
loop_11:
	movvc	%xcc,	%i2,	%l1
	subcc	%g6,	0x0641,	%o3
	edge16l	%g5,	%o0,	%i4
	sra	%g1,	%i6,	%l3
	fbue,a	%fcc3,	loop_12
	umulcc	%l0,	%g3,	%l4
	fnot2	%f4,	%f28
	alignaddr	%i1,	%g4,	%o1
loop_12:
	ldsw	[%l7 + 0x58],	%l5
	fpackfix	%f0,	%f4
	fmovdl	%icc,	%f30,	%f25
	fbug	%fcc3,	loop_13
	addccc	%l6,	%o5,	%i0
	smulcc	%i5,	%g7,	%o6
	movrlz	%l2,	%i7,	%o4
loop_13:
	tge	%icc,	0x4
	fcmpne16	%f4,	%f6,	%o7
	fxor	%f14,	%f26,	%f4
	tg	%icc,	0x6
	tle	%xcc,	0x4
	fnands	%f12,	%f27,	%f1
	orcc	%o2,	%g2,	%i3
	fones	%f26
	movgu	%xcc,	%l1,	%i2
	brgez	%g6,	loop_14
	tneg	%xcc,	0x4
	fbule,a	%fcc0,	loop_15
	fzero	%f28
loop_14:
	fba,a	%fcc2,	loop_16
	te	%xcc,	0x1
loop_15:
	be	%xcc,	loop_17
	movrlez	%o3,	0x211,	%o0
loop_16:
	nop
	set	0x2C, %o5
	stha	%g5,	[%l7 + %o5] 0xe2
	membar	#Sync
loop_17:
	tl	%xcc,	0x1
	bvs,a	%xcc,	loop_18
	fcmps	%fcc1,	%f27,	%f19
	bvs,pn	%icc,	loop_19
	tge	%xcc,	0x0
loop_18:
	srlx	%g1,	%i4,	%l3
	edge16	%i6,	%g3,	%l0
loop_19:
	nop
	set	0x48, %l2
	ldd	[%l7 + %l2],	%l4
	xnor	%i1,	0x1044,	%g4
	te	%xcc,	0x4
	fabss	%f25,	%f12
	alignaddrl	%l5,	%o1,	%o5
	fble	%fcc1,	loop_20
	fpadd32s	%f26,	%f1,	%f26
	tl	%xcc,	0x5
	fone	%f20
loop_20:
	movge	%xcc,	%l6,	%i0
	edge8	%g7,	%o6,	%l2
	fbue,a	%fcc2,	loop_21
	movl	%icc,	%i7,	%o4
	fmovsa	%xcc,	%f12,	%f16
	lduh	[%l7 + 0x68],	%o7
loop_21:
	andncc	%o2,	%g2,	%i3
	fnot1s	%f10,	%f29
	movcc	%icc,	%l1,	%i2
	movrgez	%g6,	%o3,	%o0
	tneg	%xcc,	0x2
	tn	%icc,	0x6
	movleu	%xcc,	%g5,	%g1
	fxor	%f28,	%f20,	%f22
	udivx	%i5,	0x18AA,	%l3
	andn	%i6,	0x1EF2,	%g3
	fmovdle	%icc,	%f23,	%f25
	set	0x10, %g3
	stda	%l0,	[%l7 + %g3] 0x14
	edge16l	%l4,	%i1,	%g4
	ldub	[%l7 + 0x6B],	%i4
	popc	0x0E5F,	%l5
	wr	%g0,	0x19,	%asi
	lda	[%l7 + 0x2C] %asi,	%f19
	fmovsn	%xcc,	%f23,	%f4
	stx	%o1,	[%l7 + 0x28]
	fbue,a	%fcc0,	loop_22
	fpadd32	%f12,	%f14,	%f6
	srl	%l6,	%i0,	%g7
	fsrc2s	%f24,	%f6
loop_22:
	sdivcc	%o5,	0x0E12,	%o6
	fmovdleu	%xcc,	%f10,	%f26
	move	%xcc,	%l2,	%o4
	movpos	%xcc,	%o7,	%o2
	addc	%i7,	0x1E88,	%i3
	fmovdneg	%xcc,	%f30,	%f13
	fmovscs	%icc,	%f13,	%f12
	edge32l	%l1,	%i2,	%g6
	fone	%f26
	tle	%xcc,	0x2
	fmovrsne	%o3,	%f2,	%f16
	subcc	%g2,	%o0,	%g1
	membar	0x6C
	taddcc	%g5,	0x0A90,	%l3
	nop
	setx loop_23, %l0, %l1
	jmpl %l1, %i5
	or	%g3,	%i6,	%l0
	stbar
	fbe	%fcc3,	loop_24
loop_23:
	mova	%xcc,	%i1,	%l4
	brlez,a	%g4,	loop_25
	membar	0x7F
loop_24:
	tneg	%xcc,	0x6
	std	%f4,	[%l7 + 0x58]
loop_25:
	smulcc	%i4,	0x02C3,	%o1
	fbg	%fcc1,	loop_26
	tg	%xcc,	0x2
	edge8n	%l6,	%i0,	%l5
	alignaddr	%g7,	%o6,	%l2
loop_26:
	tsubcctv	%o5,	%o7,	%o4
	fmovscc	%xcc,	%f8,	%f4
	bcs,a,pt	%xcc,	loop_27
	movn	%xcc,	%i7,	%o2
	array8	%i3,	%i2,	%l1
	fbule,a	%fcc0,	loop_28
loop_27:
	fbuge,a	%fcc0,	loop_29
	fbule	%fcc0,	loop_30
	edge16l	%o3,	%g2,	%g6
loop_28:
	fors	%f1,	%f0,	%f10
loop_29:
	movrgez	%g1,	0x232,	%o0
loop_30:
	srax	%g5,	0x07,	%l3
	array32	%g3,	%i6,	%l0
	sir	0x10E0
	sdivx	%i5,	0x19D9,	%l4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsl	%icc,	%f28,	%f11
	tsubcc	%i1,	%i4,	%o1
	sdivcc	%g4,	0x1780,	%l6
	tgu	%icc,	0x1
	fand	%f26,	%f0,	%f24
	fmovsgu	%xcc,	%f27,	%f26
	tvc	%icc,	0x1
	move	%icc,	%l5,	%g7
	fmovsl	%icc,	%f21,	%f21
	nop
	set	0x53, %g6
	ldstub	[%l7 + %g6],	%o6
	brnz,a	%l2,	loop_31
	fnand	%f18,	%f12,	%f8
	lduh	[%l7 + 0x46],	%i0
	tcs	%icc,	0x1
loop_31:
	nop
	set	0x17, %g2
	stba	%o5,	[%l7 + %g2] 0xea
	membar	#Sync
	taddcctv	%o4,	%i7,	%o7
	fmovrdgez	%i3,	%f10,	%f28
	or	%o2,	%l1,	%i2
	fmovrdne	%g2,	%f18,	%f24
	nop
	set	0x08, %l1
	stx	%o3,	[%l7 + %l1]
	fxnors	%f23,	%f3,	%f31
	fmovsl	%xcc,	%f23,	%f2
	mulx	%g6,	0x14AF,	%o0
	set	0x19, %i4
	ldstuba	[%l7 + %i4] 0x89,	%g5
	movvc	%icc,	%g1,	%g3
	fbne,a	%fcc2,	loop_32
	ldub	[%l7 + 0x15],	%i6
	udivcc	%l0,	0x1F1C,	%l3
	fmovrsne	%l4,	%f13,	%f26
loop_32:
	udiv	%i5,	0x194E,	%i1
	movneg	%xcc,	%i4,	%g4
	xnor	%o1,	0x13FD,	%l6
	udiv	%l5,	0x01DC,	%o6
	membar	0x6C
	srax	%l2,	0x1B,	%g7
	movcs	%xcc,	%i0,	%o4
	bshuffle	%f4,	%f30,	%f8
	tsubcctv	%i7,	%o5,	%o7
	movrlez	%o2,	%l1,	%i3
	edge16	%i2,	%g2,	%g6
	edge16n	%o0,	%g5,	%g1
	fnegd	%f20,	%f20
	subcc	%o3,	0x0B45,	%i6
	movgu	%xcc,	%g3,	%l3
	edge32ln	%l4,	%i5,	%l0
	tn	%xcc,	0x6
	movrne	%i4,	0x05E,	%g4
	wr	%g0,	0x24,	%asi
	ldda	[%l7 + 0x40] %asi,	%i0
	movre	%l6,	%l5,	%o6
	stb	%o1,	[%l7 + 0x55]
	fmovrdgz	%g7,	%f0,	%f2
	movvs	%icc,	%l2,	%i0
	srax	%o4,	%o5,	%i7
	alignaddrl	%o7,	%l1,	%i3
	edge16l	%i2,	%g2,	%o2
	fmovse	%xcc,	%f17,	%f7
	movrne	%g6,	0x303,	%g5
	taddcctv	%g1,	%o3,	%i6
	movvc	%icc,	%g3,	%o0
	xnorcc	%l3,	0x1B5B,	%l4
	subccc	%i5,	%l0,	%g4
	taddcc	%i1,	%l6,	%l5
	brz,a	%o6,	loop_33
	srl	%i4,	0x07,	%g7
	udivx	%l2,	0x0355,	%i0
	sub	%o1,	%o4,	%i7
loop_33:
	edge32l	%o7,	%l1,	%o5
	fmovdneg	%xcc,	%f30,	%f15
	tcc	%xcc,	0x5
	bg,a,pn	%icc,	loop_34
	srax	%i2,	0x1D,	%g2
	and	%o2,	0x1AC7,	%i3
	fcmpgt32	%f20,	%f14,	%g5
loop_34:
	edge16l	%g1,	%o3,	%g6
	taddcctv	%g3,	0x0DE5,	%i6
	wr	%g0,	0x18,	%asi
	prefetcha	[%l7 + 0x60] %asi,	 0x2
	taddcc	%l4,	%o0,	%l0
	mova	%xcc,	%i5,	%i1
	xnorcc	%g4,	0x07C8,	%l5
	add	%o6,	%i4,	%g7
	tsubcctv	%l6,	0x05B1,	%i0
	fbge,a	%fcc2,	loop_35
	fbue,a	%fcc3,	loop_36
	fnot1	%f12,	%f4
	edge8n	%l2,	%o1,	%i7
loop_35:
	smul	%o7,	%o4,	%o5
loop_36:
	movrne	%i2,	0x356,	%l1
	wr	%g0,	0x0c,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	set	0x58, %o7
	sta	%f15,	[%l7 + %o7] 0x89
	sir	0x130D
	edge32n	%o2,	%i3,	%g5
	fpackfix	%f14,	%f2
	edge8n	%g2,	%g1,	%g6
	srax	%o3,	0x10,	%g3
	edge32	%l3,	%l4,	%i6
	srl	%o0,	%l0,	%i5
	tneg	%xcc,	0x4
	addccc	%g4,	%l5,	%i1
	bn,a,pt	%icc,	loop_37
	tcs	%xcc,	0x2
	srlx	%i4,	0x11,	%g7
	orn	%o6,	%l6,	%l2
loop_37:
	tn	%xcc,	0x4
	tcc	%xcc,	0x2
	fmovrdlz	%i0,	%f12,	%f18
	tcc	%icc,	0x3
	fmovdl	%xcc,	%f15,	%f14
	fmovscs	%xcc,	%f13,	%f23
	movvs	%icc,	%i7,	%o1
	orncc	%o7,	0x086E,	%o5
	fmovdvs	%xcc,	%f7,	%f10
	xnorcc	%o4,	%i2,	%o2
	mulscc	%l1,	0x12A9,	%g5
	fpsub32	%f30,	%f2,	%f24
	array8	%g2,	%g1,	%g6
	fabsd	%f18,	%f0
	call	loop_38
	fmovrde	%o3,	%f26,	%f28
	srlx	%i3,	%g3,	%l4
	movleu	%icc,	%i6,	%o0
loop_38:
	fmovdgu	%xcc,	%f2,	%f13
	alignaddr	%l3,	%l0,	%g4
	fmovdvc	%xcc,	%f26,	%f18
	movne	%xcc,	%l5,	%i1
	andcc	%i4,	0x1F9C,	%g7
	orn	%i5,	0x0EA7,	%l6
	swap	[%l7 + 0x60],	%l2
	fsrc2	%f18,	%f10
	edge16n	%o6,	%i7,	%o1
	alignaddr	%o7,	%o5,	%o4
	udivx	%i0,	0x09A6,	%o2
	edge32	%l1,	%g5,	%i2
	fmovspos	%icc,	%f3,	%f20
	fpsub32s	%f3,	%f12,	%f29
	fxors	%f17,	%f21,	%f11
	mova	%icc,	%g1,	%g6
	fnands	%f9,	%f4,	%f0
	prefetch	[%l7 + 0x1C],	 0x1
	fmovspos	%xcc,	%f14,	%f15
	siam	0x0
	fbge,a	%fcc0,	loop_39
	fmovrdlez	%g2,	%f26,	%f8
	addc	%i3,	0x0D00,	%g3
	std	%l4,	[%l7 + 0x70]
loop_39:
	movgu	%xcc,	%o3,	%i6
	edge8l	%l3,	%o0,	%g4
	fmuld8sux16	%f22,	%f28,	%f6
	edge8	%l5,	%l0,	%i4
	fcmpne16	%f26,	%f18,	%g7
	fbg	%fcc2,	loop_40
	bn	loop_41
	orncc	%i5,	%i1,	%l2
	fmovdn	%icc,	%f3,	%f4
loop_40:
	sethi	0x1C12,	%l6
loop_41:
	edge32n	%i7,	%o1,	%o7
	subccc	%o5,	0x1E64,	%o6
	fbug,a	%fcc0,	loop_42
	move	%xcc,	%o4,	%i0
	tvc	%xcc,	0x5
	nop
	setx loop_43, %l0, %l1
	jmpl %l1, %o2
loop_42:
	edge32l	%l1,	%i2,	%g1
	fxors	%f29,	%f25,	%f19
	fbn	%fcc0,	loop_44
loop_43:
	tvs	%xcc,	0x5
	fand	%f20,	%f22,	%f18
	sethi	0x1A8C,	%g5
loop_44:
	brlz	%g2,	loop_45
	edge16l	%g6,	%i3,	%g3
	fandnot1	%f20,	%f24,	%f30
	smul	%l4,	0x0B27,	%o3
loop_45:
	nop
	wr	%g0,	0x10,	%asi
	prefetcha	[%l7 + 0x60] %asi,	 0x2
	smulcc	%o0,	%i6,	%l5
	edge32l	%l0,	%g4,	%i4
	movvc	%icc,	%i5,	%g7
	bge,a,pt	%icc,	loop_46
	edge16n	%l2,	%i1,	%i7
	sll	%o1,	%o7,	%l6
	fmovsn	%xcc,	%f11,	%f17
loop_46:
	movleu	%icc,	%o5,	%o4
	fpack16	%f18,	%f1
	sdivcc	%o6,	0x0AD1,	%o2
	sdivcc	%i0,	0x0840,	%l1
	tleu	%icc,	0x5
	bvs,a,pn	%icc,	loop_47
	orncc	%i2,	%g1,	%g5
	set	0x58, %l0
	lda	[%l7 + %l0] 0x14,	%f25
loop_47:
	srl	%g6,	%g2,	%g3
	mova	%icc,	%l4,	%o3
	bvc,pt	%xcc,	loop_48
	fsrc1	%f6,	%f2
	fandnot1	%f14,	%f4,	%f4
	nop
	setx loop_49, %l0, %l1
	jmpl %l1, %i3
loop_48:
	umulcc	%o0,	0x12E8,	%l3
	movl	%xcc,	%l5,	%l0
	subccc	%g4,	%i6,	%i5
loop_49:
	edge32ln	%i4,	%g7,	%l2
	edge8l	%i7,	%o1,	%o7
	std	%i0,	[%l7 + 0x38]
	fbg	%fcc0,	loop_50
	xnor	%o5,	%l6,	%o6
	umul	%o4,	0x0BFD,	%i0
	sir	0x1D48
loop_50:
	mulscc	%l1,	%i2,	%g1
	tne	%icc,	0x3
	movg	%xcc,	%g5,	%g6
	wr	%g0,	0x10,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	fbo	%fcc2,	loop_51
	tle	%icc,	0x4
	movre	%o2,	0x2C2,	%g3
	fmovd	%f30,	%f30
loop_51:
	fmuld8sux16	%f30,	%f4,	%f10
	fmovdneg	%xcc,	%f6,	%f3
	ldsh	[%l7 + 0x7A],	%g2
	edge16n	%o3,	%l4,	%o0
	tsubcc	%i3,	0x1117,	%l5
	array8	%l0,	%g4,	%l3
	movcs	%icc,	%i5,	%i4
	tn	%icc,	0x5
	subccc	%g7,	%i6,	%i7
	fmovsvc	%xcc,	%f0,	%f6
	movrne	%o1,	0x174,	%o7
	tsubcctv	%i1,	0x1972,	%l2
	fone	%f6
	xorcc	%l6,	%o6,	%o4
	edge16ln	%i0,	%o5,	%l1
	set	0x08, %i1
	prefetcha	[%l7 + %i1] 0x89,	 0x2
	stw	%g1,	[%l7 + 0x10]
	edge8	%g6,	%g5,	%o2
	std	%g2,	[%l7 + 0x10]
	fmovsle	%icc,	%f17,	%f24
	alignaddr	%g2,	%o3,	%o0
	tn	%icc,	0x3
	fmovdne	%xcc,	%f13,	%f19
	edge8ln	%i3,	%l4,	%l5
	ldub	[%l7 + 0x4A],	%l0
	te	%xcc,	0x6
	fcmpes	%fcc1,	%f17,	%f25
	tleu	%icc,	0x6
	tn	%icc,	0x7
	fands	%f26,	%f4,	%f15
	umul	%g4,	0x0AD8,	%l3
	taddcctv	%i4,	0x1613,	%i5
	smulcc	%g7,	%i6,	%o1
	alignaddr	%o7,	%i1,	%i7
	andcc	%l2,	0x1AD2,	%l6
	subcc	%o6,	%o4,	%o5
	edge16l	%l1,	%i2,	%g1
	fmovsne	%xcc,	%f26,	%f12
	mulx	%g6,	0x1AD7,	%i0
	fcmple16	%f18,	%f12,	%g5
	fxor	%f22,	%f0,	%f30
	movneg	%xcc,	%g3,	%o2
	for	%f22,	%f26,	%f6
	ldsw	[%l7 + 0x4C],	%g2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovd	%f28,	%f14
	wr	%g0,	0x11,	%asi
	ldsba	[%l7 + 0x13] %asi,	%o3
	movre	%i3,	%l4,	%l5
	bneg,pn	%icc,	loop_52
	orncc	%l0,	%o0,	%l3
	and	%g4,	%i5,	%g7
	fand	%f28,	%f20,	%f18
loop_52:
	tvs	%xcc,	0x5
	umul	%i6,	%i4,	%o1
	set	0x40, %l3
	stda	%f0,	[%l7 + %l3] 0x15
	ldsw	[%l7 + 0x3C],	%i1
	fpadd32s	%f4,	%f27,	%f31
	movcs	%icc,	%o7,	%i7
	orncc	%l6,	0x077D,	%l2
	sdivx	%o4,	0x0339,	%o6
	fbuge	%fcc0,	loop_53
	fpadd16s	%f11,	%f1,	%f17
	sllx	%l1,	0x04,	%o5
	tpos	%icc,	0x4
loop_53:
	siam	0x3
	srax	%g1,	%g6,	%i0
	fmul8x16au	%f3,	%f22,	%f30
	fmul8x16	%f22,	%f14,	%f6
	ldsw	[%l7 + 0x34],	%g5
	andcc	%i2,	%o2,	%g2
	sethi	0x0C78,	%g3
	fornot2	%f14,	%f12,	%f8
	set	0x36, %l4
	lduha	[%l7 + %l4] 0x11,	%o3
	edge16	%i3,	%l4,	%l5
	fbul	%fcc1,	loop_54
	movcc	%icc,	%o0,	%l0
	fpadd32	%f18,	%f26,	%f8
	fbe,a	%fcc3,	loop_55
loop_54:
	tcc	%icc,	0x7
	fmovd	%f8,	%f16
	fmovsneg	%icc,	%f16,	%f24
loop_55:
	andncc	%g4,	%i5,	%g7
	tpos	%xcc,	0x6
	udiv	%l3,	0x1199,	%i6
	fcmpeq16	%f30,	%f4,	%o1
	brz,a	%i1,	loop_56
	fnot2s	%f10,	%f16
	edge32ln	%i4,	%i7,	%o7
	xnorcc	%l2,	0x0630,	%l6
loop_56:
	tg	%xcc,	0x3
	fbul	%fcc2,	loop_57
	movn	%icc,	%o6,	%o4
	movle	%xcc,	%l1,	%g1
	mulx	%o5,	0x1D47,	%i0
loop_57:
	tge	%icc,	0x2
	movle	%icc,	%g5,	%g6
	set	0x5E, %o6
	stha	%i2,	[%l7 + %o6] 0x15
	fnands	%f20,	%f3,	%f18
	srax	%g2,	%g3,	%o3
	ld	[%l7 + 0x6C],	%f7
	movcc	%icc,	%o2,	%i3
	sir	0x09D0
	brlez,a	%l5,	loop_58
	tn	%xcc,	0x0
	ta	%xcc,	0x2
	stbar
loop_58:
	udiv	%o0,	0x0742,	%l4
	nop
	set	0x24, %o4
	stw	%l0,	[%l7 + %o4]
	edge32	%i5,	%g7,	%g4
	fbn	%fcc0,	loop_59
	fmovrdlz	%l3,	%f8,	%f22
	movvc	%xcc,	%i6,	%i1
	wr	%g0,	0x0c,	%asi
	prefetcha	[%l7 + 0x38] %asi,	 0x2
loop_59:
	edge32ln	%i7,	%o1,	%o7
	movrgez	%l2,	%l6,	%o6
	tn	%xcc,	0x1
	movg	%xcc,	%o4,	%g1
	movgu	%xcc,	%l1,	%o5
	edge32	%g5,	%i0,	%i2
	xor	%g2,	%g3,	%g6
	tn	%icc,	0x5
	smulcc	%o3,	%i3,	%o2
	movn	%icc,	%o0,	%l4
	fmuld8sux16	%f13,	%f0,	%f0
	tpos	%xcc,	0x5
	set	0x6A, %o2
	lduha	[%l7 + %o2] 0x88,	%l0
	tge	%icc,	0x7
	sdivcc	%l5,	0x0EFB,	%i5
	swap	[%l7 + 0x2C],	%g4
	set	0x7E, %o3
	stha	%l3,	[%l7 + %o3] 0x2b
	membar	#Sync
	move	%xcc,	%g7,	%i1
	umulcc	%i4,	0x0FD7,	%i6
	movvs	%xcc,	%i7,	%o1
	edge16ln	%o7,	%l6,	%o6
	fmovsneg	%xcc,	%f14,	%f16
	te	%xcc,	0x2
	orcc	%l2,	%o4,	%l1
	fmovrdlz	%o5,	%f2,	%f2
	fbge,a	%fcc1,	loop_60
	array32	%g1,	%i0,	%i2
	srlx	%g2,	0x05,	%g5
	sethi	0x105D,	%g3
loop_60:
	andncc	%o3,	%i3,	%o2
	edge8ln	%g6,	%l4,	%o0
	and	%l5,	%i5,	%g4
	sdivcc	%l0,	0x0AAF,	%g7
	movne	%icc,	%l3,	%i1
	fbuge,a	%fcc1,	loop_61
	movre	%i6,	%i7,	%i4
	srl	%o7,	%o1,	%o6
	edge32	%l2,	%l6,	%o4
loop_61:
	srax	%o5,	0x1D,	%g1
	fnot2	%f20,	%f28
	xor	%l1,	%i2,	%g2
	fors	%f31,	%f26,	%f28
	std	%f6,	[%l7 + 0x58]
	movre	%i0,	0x082,	%g5
	fornot1	%f8,	%f14,	%f28
	fornot1s	%f7,	%f3,	%f16
	tsubcc	%o3,	%g3,	%o2
	tvc	%icc,	0x0
	fnot2	%f20,	%f16
	te	%xcc,	0x0
	fbe	%fcc1,	loop_62
	srl	%i3,	%l4,	%g6
	set	0x5F, %l5
	ldstuba	[%l7 + %l5] 0x89,	%o0
loop_62:
	subcc	%i5,	0x07BD,	%g4
	fpsub32	%f12,	%f0,	%f18
	bne	%icc,	loop_63
	tgu	%xcc,	0x7
	movcs	%icc,	%l5,	%g7
	wr	%g0,	0x11,	%asi
	lduwa	[%l7 + 0x34] %asi,	%l0
loop_63:
	edge32l	%l3,	%i6,	%i7
	edge8l	%i1,	%o7,	%o1
	fbge	%fcc0,	loop_64
	udivx	%i4,	0x1976,	%o6
	and	%l2,	0x0F1D,	%l6
	lduh	[%l7 + 0x40],	%o4
loop_64:
	nop
	add	%l7,	0x1C,	%l6
	wr	%g0,	0x18,	%asi
	casa	[%l6] 0x18,	%o5,	%g1
	srl	%i2,	0x01,	%g2
	fmovsvc	%icc,	%f30,	%f9
	brlz	%l1,	loop_65
	fmovdg	%icc,	%f5,	%f18
	fmovdl	%xcc,	%f6,	%f30
	udiv	%i0,	0x1DFF,	%g5
loop_65:
	fmovsvs	%icc,	%f24,	%f12
	tl	%icc,	0x5
	edge16	%g3,	%o2,	%o3
	wr	%g0,	0x88,	%asi
	swapa	[%l7 + 0x50] %asi,	%l4
	taddcctv	%i3,	0x1AFB,	%o0
	fmovsge	%icc,	%f24,	%f11
	fzeros	%f0
	movrgz	%i5,	%g4,	%l5
	fmovdgu	%xcc,	%f1,	%f11
	movrgz	%g7,	%l0,	%l3
	srax	%g6,	%i7,	%i1
	udiv	%i6,	0x00B3,	%o1
	sdivx	%o7,	0x0149,	%i4
	tvc	%xcc,	0x7
	fandnot1	%f6,	%f20,	%f30
	nop
	set	0x14, %i0
	stw	%l2,	[%l7 + %i0]
	add	%l6,	0x0882,	%o6
	tvc	%icc,	0x5
	bne,a,pn	%xcc,	loop_66
	fcmpgt16	%f14,	%f26,	%o4
	movrlez	%g1,	%o5,	%i2
	subc	%g2,	0x0FC8,	%l1
loop_66:
	bleu	%xcc,	loop_67
	brlez,a	%i0,	loop_68
	fbug,a	%fcc3,	loop_69
	fmuld8ulx16	%f22,	%f1,	%f12
loop_67:
	fmovdleu	%icc,	%f0,	%f2
loop_68:
	tvc	%icc,	0x0
loop_69:
	brgz,a	%g5,	loop_70
	movvc	%xcc,	%g3,	%o2
	tvs	%icc,	0x6
	and	%l4,	%o3,	%o0
loop_70:
	tneg	%icc,	0x0
	bvs,a,pn	%icc,	loop_71
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movvs	%xcc,	%i5,	%g4
	fmovs	%f3,	%f16
loop_71:
	edge16ln	%l5,	%g7,	%l0
	movvc	%xcc,	%i3,	%g6
	edge16	%i7,	%l3,	%i1
	movvc	%xcc,	%o1,	%o7
	bvs,a,pn	%icc,	loop_72
	movvs	%xcc,	%i6,	%l2
	addc	%l6,	%o6,	%i4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_72:
	movrgez	%o4,	0x1D9,	%o5
	add	%l7,	0x30,	%l6
	wr	%g0,	0x19,	%asi
	casxa	[%l6] 0x19,	%g1,	%i2
	andncc	%g2,	%l1,	%g5
	fcmpgt16	%f8,	%f30,	%g3
	fblg,a	%fcc3,	loop_73
	sethi	0x0741,	%i0
	udivx	%o2,	0x0460,	%l4
	umulcc	%o3,	0x107D,	%i5
loop_73:
	movrgz	%o0,	0x2B5,	%g4
	fmovsgu	%icc,	%f1,	%f25
	nop
	setx loop_74, %l0, %l1
	jmpl %l1, %g7
	tg	%xcc,	0x1
	udiv	%l5,	0x0D27,	%l0
	alignaddrl	%g6,	%i7,	%l3
loop_74:
	fmovdn	%xcc,	%f17,	%f29
	tge	%icc,	0x4
	or	%i1,	%i3,	%o1
	ldsb	[%l7 + 0x56],	%o7
	movvc	%xcc,	%l2,	%l6
	alignaddrl	%o6,	%i6,	%i4
	fsrc1	%f28,	%f2
	mulscc	%o4,	%o5,	%g1
	taddcc	%g2,	%l1,	%i2
	ble	%xcc,	loop_75
	xnorcc	%g5,	0x1066,	%i0
	fmovd	%f12,	%f22
	set	0x40, %l6
	ldda	[%l7 + %l6] 0x2b,	%o2
loop_75:
	sllx	%l4,	0x0D,	%g3
	tle	%xcc,	0x7
	tl	%xcc,	0x0
	ldsw	[%l7 + 0x7C],	%i5
	subccc	%o0,	0x0EB8,	%o3
	fbu	%fcc2,	loop_76
	stb	%g7,	[%l7 + 0x41]
	pdist	%f24,	%f18,	%f28
	sdiv	%l5,	0x1F1C,	%g4
loop_76:
	umul	%g6,	%i7,	%l3
	xnor	%i1,	%l0,	%o1
	fcmped	%fcc1,	%f0,	%f26
	movvc	%xcc,	%i3,	%o7
	sth	%l6,	[%l7 + 0x36]
	fcmpne16	%f14,	%f30,	%l2
	fxors	%f16,	%f5,	%f17
	fbge	%fcc1,	loop_77
	swap	[%l7 + 0x38],	%o6
	sdivx	%i6,	0x0F27,	%i4
	fmovdg	%icc,	%f1,	%f26
loop_77:
	fornot2	%f2,	%f26,	%f10
	ldd	[%l7 + 0x50],	%o4
	wr	%g0,	0x89,	%asi
	lda	[%l7 + 0x6C] %asi,	%f25
	fmovsle	%icc,	%f8,	%f15
	movrlz	%g1,	0x2D5,	%o5
	edge16	%g2,	%i2,	%l1
	wr	%g0,	0x81,	%asi
	prefetcha	[%l7 + 0x58] %asi,	 0x0
	movrgez	%o2,	0x290,	%g5
	fsrc2	%f14,	%f8
	subccc	%l4,	0x0D2D,	%g3
	sethi	0x01B8,	%i5
	movrlz	%o0,	%g7,	%l5
	tcc	%icc,	0x0
	bn	loop_78
	fxor	%f26,	%f30,	%f0
	edge32n	%o3,	%g6,	%i7
	srl	%l3,	%g4,	%l0
loop_78:
	edge32n	%o1,	%i1,	%i3
	edge16n	%l6,	%l2,	%o7
	brgz,a	%i6,	loop_79
	tsubcc	%o6,	%o4,	%i4
	fpackfix	%f30,	%f11
	bleu,a	loop_80
loop_79:
	movrlz	%o5,	0x157,	%g2
	fbge	%fcc3,	loop_81
	edge8ln	%i2,	%l1,	%i0
loop_80:
	andncc	%g1,	%o2,	%g5
	tcs	%xcc,	0x5
loop_81:
	edge16n	%g3,	%i5,	%o0
	mulscc	%l4,	%g7,	%o3
	or	%l5,	0x00D4,	%i7
	ldd	[%l7 + 0x08],	%f30
	fnands	%f5,	%f3,	%f28
	fmovdcs	%icc,	%f24,	%f9
	srax	%g6,	0x12,	%g4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bgu,a	%xcc,	loop_82
	bvs	loop_83
	srax	%l0,	0x1C,	%l3
	nop
	setx loop_84, %l0, %l1
	jmpl %l1, %o1
loop_82:
	brz,a	%i1,	loop_85
loop_83:
	flush	%l7 + 0x7C
	call	loop_86
loop_84:
	srl	%l6,	0x0E,	%l2
loop_85:
	subcc	%o7,	%i3,	%o6
	membar	0x1B
loop_86:
	ta	%xcc,	0x2
	fmovrdne	%o4,	%f0,	%f8
	popc	%i6,	%i4
	movle	%icc,	%o5,	%i2
	udivx	%l1,	0x1560,	%i0
	brlz,a	%g2,	loop_87
	fbug,a	%fcc1,	loop_88
	tleu	%xcc,	0x4
	bge,a,pn	%xcc,	loop_89
loop_87:
	fmuld8sux16	%f13,	%f30,	%f16
loop_88:
	edge32l	%o2,	%g5,	%g3
	mulscc	%g1,	0x1614,	%i5
loop_89:
	orncc	%l4,	0x02EE,	%g7
	edge16ln	%o0,	%o3,	%l5
	fba	%fcc3,	loop_90
	st	%f20,	[%l7 + 0x48]
	fmovscc	%xcc,	%f19,	%f8
	fmuld8ulx16	%f3,	%f22,	%f10
loop_90:
	movvc	%xcc,	%i7,	%g6
	sdivx	%l0,	0x06E5,	%l3
	edge8ln	%o1,	%i1,	%l6
	st	%f22,	[%l7 + 0x7C]
	edge8n	%g4,	%o7,	%l2
	sub	%i3,	%o6,	%i6
	tne	%icc,	0x6
	fnot2s	%f30,	%f13
	add	%l7,	0x48,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%o4,	%o5
	sethi	0x0FD0,	%i4
	array32	%i2,	%l1,	%i0
	fcmps	%fcc1,	%f22,	%f30
	st	%f7,	[%l7 + 0x14]
	smulcc	%o2,	0x0933,	%g2
	array8	%g5,	%g3,	%i5
	fbuge,a	%fcc1,	loop_91
	tvc	%icc,	0x2
	ldsh	[%l7 + 0x58],	%l4
	fnegs	%f26,	%f25
loop_91:
	udiv	%g7,	0x1B39,	%o0
	fmul8ulx16	%f8,	%f30,	%f14
	addccc	%o3,	%g1,	%i7
	sir	0x0BE0
	fnors	%f29,	%f21,	%f17
	subc	%l5,	0x1412,	%l0
	std	%f20,	[%l7 + 0x40]
	udivcc	%g6,	0x18F1,	%l3
	stbar
	movne	%icc,	%i1,	%l6
	edge16n	%g4,	%o1,	%o7
	andcc	%l2,	%o6,	%i3
	addc	%o4,	%i6,	%o5
	tleu	%xcc,	0x0
	set	0x1B, %g7
	lduba	[%l7 + %g7] 0x0c,	%i2
	fbug,a	%fcc2,	loop_92
	fbge,a	%fcc2,	loop_93
	fpadd16	%f16,	%f8,	%f24
	movn	%icc,	%l1,	%i4
loop_92:
	stx	%i0,	[%l7 + 0x28]
loop_93:
	fbo,a	%fcc2,	loop_94
	fcmpeq16	%f4,	%f14,	%o2
	bcs	loop_95
	tpos	%xcc,	0x5
loop_94:
	tne	%xcc,	0x2
	udiv	%g5,	0x1E63,	%g2
loop_95:
	movrne	%g3,	0x0A1,	%i5
	bn,a	%xcc,	loop_96
	fmovsne	%icc,	%f11,	%f13
	edge32n	%g7,	%l4,	%o0
	fxnors	%f26,	%f20,	%f23
loop_96:
	fone	%f20
	fmovspos	%xcc,	%f5,	%f27
	set	0x10, %i5
	swapa	[%l7 + %i5] 0x88,	%g1
	addccc	%o3,	%i7,	%l0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x54, %o1
	sta	%f4,	[%l7 + %o1] 0x19
	tge	%xcc,	0x2
	movcc	%xcc,	%g6,	%l3
	sllx	%l5,	%l6,	%g4
	movge	%xcc,	%i1,	%o7
	alignaddrl	%l2,	%o6,	%i3
	array32	%o4,	%o1,	%o5
	andncc	%i2,	%i6,	%l1
	sth	%i4,	[%l7 + 0x66]
	fmovrdlz	%o2,	%f10,	%f16
	addcc	%g5,	0x192D,	%i0
	subccc	%g3,	0x1516,	%i5
	fcmped	%fcc3,	%f10,	%f20
	edge16l	%g2,	%l4,	%o0
	fornot1s	%f25,	%f9,	%f9
	xnor	%g1,	0x0509,	%o3
	subc	%i7,	%l0,	%g6
	mova	%xcc,	%g7,	%l5
	taddcc	%l6,	%l3,	%g4
	array16	%o7,	%l2,	%o6
	xorcc	%i1,	0x19CA,	%o4
	tleu	%icc,	0x6
	tcc	%xcc,	0x5
	umul	%o1,	%i3,	%i2
	andncc	%o5,	%l1,	%i4
	tpos	%icc,	0x4
	fmovdpos	%icc,	%f9,	%f27
	mulscc	%o2,	0x0CE3,	%i6
	ldsh	[%l7 + 0x32],	%g5
	array32	%g3,	%i5,	%i0
	movcc	%xcc,	%l4,	%g2
	movrgz	%o0,	0x36C,	%g1
	wr	%g0,	0x11,	%asi
	ldswa	[%l7 + 0x78] %asi,	%i7
	array16	%o3,	%g6,	%g7
	subccc	%l0,	%l6,	%l5
	fmovrdgez	%g4,	%f12,	%f18
	std	%f24,	[%l7 + 0x28]
	nop
	setx loop_97, %l0, %l1
	jmpl %l1, %o7
	fnegs	%f17,	%f21
	edge32l	%l2,	%o6,	%i1
	nop
	setx loop_98, %l0, %l1
	jmpl %l1, %o4
loop_97:
	brz	%l3,	loop_99
	edge16n	%i3,	%i2,	%o5
	andcc	%l1,	%o1,	%o2
loop_98:
	std	%f16,	[%l7 + 0x38]
loop_99:
	faligndata	%f14,	%f6,	%f10
	set	0x26, %i7
	stha	%i4,	[%l7 + %i7] 0x19
	movleu	%icc,	%i6,	%g3
	fsrc1	%f8,	%f18
	fmovsge	%xcc,	%f12,	%f23
	and	%g5,	0x174F,	%i0
	wr	%g0,	0x89,	%asi
	ldsba	[%l7 + 0x34] %asi,	%l4
	sll	%g2,	%o0,	%g1
	fnot1s	%f22,	%f12
	fpack16	%f10,	%f25
	set	0x44, %g1
	ldstuba	[%l7 + %g1] 0x89,	%i7
	sth	%o3,	[%l7 + 0x0E]
	sdivx	%i5,	0x062E,	%g6
	edge16l	%g7,	%l6,	%l0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldd	[%l7 + 0x48],	%f30
	edge32	%l5,	%o7,	%g4
	fmovspos	%xcc,	%f1,	%f11
	fmovscc	%xcc,	%f13,	%f1
	fmovdne	%xcc,	%f7,	%f1
	fcmpeq32	%f18,	%f14,	%l2
	tne	%xcc,	0x7
	edge8	%o6,	%i1,	%o4
	membar	0x4D
	membar	0x3D
	fmovsa	%xcc,	%f22,	%f9
	edge16n	%l3,	%i3,	%i2
	movrgez	%o5,	%o1,	%l1
	srax	%o2,	%i6,	%g3
	fbul	%fcc3,	loop_100
	fmovsl	%xcc,	%f21,	%f9
	edge16l	%i4,	%i0,	%g5
	fnot1s	%f2,	%f4
loop_100:
	edge8l	%g2,	%o0,	%g1
	fbug,a	%fcc2,	loop_101
	addcc	%i7,	%o3,	%i5
	tleu	%xcc,	0x4
	fmovrslz	%g6,	%f9,	%f18
loop_101:
	nop
	set	0x25, %g4
	lduba	[%l7 + %g4] 0x11,	%l4
	bg,a,pn	%xcc,	loop_102
	fbul	%fcc3,	loop_103
	tl	%icc,	0x7
	xnor	%g7,	%l6,	%l5
loop_102:
	nop
	add	%l7,	0x18,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%l0,	%g4
loop_103:
	alignaddr	%o7,	%l2,	%i1
	fcmpgt32	%f22,	%f20,	%o4
	ta	%icc,	0x1
	andncc	%l3,	%o6,	%i2
	sth	%i3,	[%l7 + 0x5A]
	ldd	[%l7 + 0x40],	%o4
	taddcctv	%l1,	0x0124,	%o1
	movrne	%i6,	0x3C8,	%g3
	brz	%o2,	loop_104
	tl	%xcc,	0x4
	wr	%g0,	0x04,	%asi
	ldstuba	[%l7 + 0x7E] %asi,	%i0
loop_104:
	fmovde	%xcc,	%f18,	%f29
	fmovsl	%xcc,	%f27,	%f12
	fands	%f6,	%f23,	%f7
	add	%g5,	%g2,	%o0
	movge	%xcc,	%g1,	%i7
	orn	%o3,	0x087C,	%i5
	ldsb	[%l7 + 0x3B],	%g6
	ldsw	[%l7 + 0x38],	%i4
	nop
	setx	loop_105,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	edge32	%l4,	%l6,	%l5
	fmovdvc	%xcc,	%f0,	%f12
	tg	%icc,	0x5
loop_105:
	edge32	%l0,	%g7,	%g4
	edge32ln	%o7,	%i1,	%o4
	fmovsa	%xcc,	%f23,	%f0
	brnz	%l2,	loop_106
	std	%o6,	[%l7 + 0x48]
	fmovdvc	%xcc,	%f2,	%f29
	stbar
loop_106:
	sdiv	%l3,	0x1FA4,	%i2
	membar	0x3B
	fblg,a	%fcc0,	loop_107
	udiv	%i3,	0x19C3,	%l1
	set	0x54, %i3
	ldswa	[%l7 + %i3] 0x11,	%o5
loop_107:
	movleu	%xcc,	%i6,	%o1
	alignaddrl	%o2,	%g3,	%i0
	fble	%fcc0,	loop_108
	smulcc	%g2,	0x108C,	%o0
	fmovdneg	%xcc,	%f5,	%f26
	movneg	%icc,	%g5,	%g1
loop_108:
	call	loop_109
	xnorcc	%o3,	%i5,	%i7
	fcmpne16	%f14,	%f2,	%i4
	add	%l7,	0x68,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%l4,	%l6
loop_109:
	fmovsge	%icc,	%f28,	%f27
	nop
	set	0x08, %i2
	ldd	[%l7 + %i2],	%f4
	movl	%icc,	%g6,	%l5
	fmul8ulx16	%f4,	%f16,	%f4
	ba,pn	%icc,	loop_110
	fors	%f25,	%f3,	%f10
	fmovsvs	%icc,	%f18,	%f27
	andcc	%l0,	%g7,	%g4
loop_110:
	fbu,a	%fcc1,	loop_111
	edge32l	%o7,	%i1,	%l2
	array8	%o4,	%o6,	%i2
	nop
	setx	loop_112,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_111:
	bl	%icc,	loop_113
	andcc	%i3,	%l1,	%l3
	tcs	%icc,	0x3
loop_112:
	nop
	wr	%g0,	0x81,	%asi
	stwa	%i6,	[%l7 + 0x48] %asi
loop_113:
	array16	%o5,	%o2,	%g3
	xor	%o1,	%i0,	%o0
	movneg	%icc,	%g5,	%g2
	sethi	0x1DE2,	%o3
	tvs	%xcc,	0x1
	subc	%g1,	0x11A6,	%i5
	mulx	%i7,	%l4,	%i4
	fmovdleu	%xcc,	%f0,	%f24
	fnot2	%f30,	%f28
	movneg	%icc,	%l6,	%l5
	bleu,a	%icc,	loop_114
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	brlz,a	%l0,	loop_115
	movpos	%xcc,	%g7,	%g4
loop_114:
	fpack32	%f26,	%f12,	%f4
	fnand	%f10,	%f8,	%f2
loop_115:
	nop
	set	0x3A, %o0
	ldsba	[%l7 + %o0] 0x81,	%o7
	xnorcc	%i1,	%l2,	%o4
	fmovsle	%xcc,	%f26,	%f8
	mulx	%g6,	%i2,	%i3
	nop
	setx	loop_116,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movvs	%xcc,	%l1,	%o6
	xnor	%i6,	%l3,	%o5
	movneg	%icc,	%o2,	%o1
loop_116:
	sir	0x1A75
	movvs	%icc,	%g3,	%o0
	faligndata	%f18,	%f0,	%f20
	wr	%g0,	0x80,	%asi
	stda	%i0,	[%l7 + 0x78] %asi
	array32	%g5,	%o3,	%g1
	fones	%f8
	std	%i4,	[%l7 + 0x18]
	tneg	%icc,	0x1
	array8	%i7,	%l4,	%g2
	movcs	%xcc,	%i4,	%l6
	array16	%l5,	%g7,	%l0
	fbul	%fcc2,	loop_117
	movge	%icc,	%g4,	%i1
	srax	%o7,	0x15,	%l2
	subc	%o4,	%i2,	%i3
loop_117:
	sir	0x14D5
	tsubcctv	%l1,	0x113C,	%o6
	subccc	%g6,	0x1EA5,	%l3
	orcc	%i6,	0x0D97,	%o2
	fmovdl	%xcc,	%f27,	%f8
	xnor	%o5,	0x0BFE,	%o1
	array16	%o0,	%g3,	%g5
	fmovsneg	%icc,	%f4,	%f19
	fexpand	%f29,	%f22
	bn	%xcc,	loop_118
	xorcc	%i0,	%g1,	%i5
	set	0x14, %g5
	lda	[%l7 + %g5] 0x04,	%f25
loop_118:
	fmovscc	%icc,	%f13,	%f19
	array32	%i7,	%o3,	%l4
	movle	%icc,	%i4,	%l6
	fblg	%fcc0,	loop_119
	sdiv	%g2,	0x0ECF,	%l5
	alignaddr	%g7,	%l0,	%i1
	edge16n	%g4,	%l2,	%o4
loop_119:
	array16	%i2,	%i3,	%l1
	movcc	%xcc,	%o6,	%g6
	brlz	%l3,	loop_120
	fnot2	%f0,	%f22
	bg,pn	%xcc,	loop_121
	tgu	%xcc,	0x3
loop_120:
	orcc	%o7,	%i6,	%o5
	fandnot2s	%f4,	%f26,	%f30
loop_121:
	st	%f25,	[%l7 + 0x4C]
	fmovdpos	%icc,	%f30,	%f31
	stx	%o1,	[%l7 + 0x18]
	fornot2s	%f8,	%f1,	%f16
	fmovrdlez	%o0,	%f28,	%f8
	movre	%g3,	%g5,	%i0
	umulcc	%g1,	0x1E5C,	%i5
	nop
	setx	loop_122,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movvs	%icc,	%o2,	%o3
	fsrc1s	%f19,	%f3
	fxnor	%f26,	%f26,	%f4
loop_122:
	udivx	%i7,	0x0CCF,	%i4
	brlez	%l6,	loop_123
	te	%icc,	0x6
	mulx	%g2,	0x12C9,	%l5
	array16	%l4,	%g7,	%i1
loop_123:
	xnor	%g4,	%l0,	%o4
	edge8n	%l2,	%i2,	%l1
	tl	%xcc,	0x2
	bn	loop_124
	nop
	set	0x58, %i6
	ldx	[%l7 + %i6],	%o6
	fmovsn	%xcc,	%f8,	%f18
	move	%xcc,	%g6,	%i3
loop_124:
	alignaddrl	%l3,	%o7,	%o5
	fmovsle	%icc,	%f9,	%f23
	array16	%i6,	%o0,	%g3
	brz,a	%g5,	loop_125
	nop
	setx	loop_126,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	edge32	%o1,	%i0,	%g1
	smulcc	%o2,	%o3,	%i5
loop_125:
	alignaddrl	%i7,	%i4,	%g2
loop_126:
	tpos	%icc,	0x2
	fornot2	%f2,	%f28,	%f20
	fmul8x16au	%f20,	%f27,	%f20
	smulcc	%l6,	%l4,	%l5
	fbue	%fcc2,	loop_127
	mova	%icc,	%i1,	%g4
	fxnors	%f17,	%f0,	%f28
	udivx	%l0,	0x1C6F,	%o4
loop_127:
	array16	%l2,	%i2,	%g7
	udivx	%l1,	0x195F,	%g6
	edge32ln	%i3,	%l3,	%o6
	fpadd32s	%f27,	%f5,	%f24
	movcs	%xcc,	%o7,	%i6
	fblg	%fcc0,	loop_128
	fbuge	%fcc2,	loop_129
	movne	%icc,	%o0,	%g3
	wr	%g0,	0x80,	%asi
	lduha	[%l7 + 0x20] %asi,	%o5
loop_128:
	tleu	%icc,	0x6
loop_129:
	tcs	%icc,	0x4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ba	%icc,	loop_130
	sir	0x18D9
	movleu	%icc,	%o1,	%g5
	fpsub16	%f26,	%f28,	%f20
loop_130:
	fbn,a	%fcc1,	loop_131
	fsrc2	%f28,	%f24
	edge8	%g1,	%o2,	%i0
	add	%l7,	0x40,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%o3,	%i7
loop_131:
	andncc	%i5,	%g2,	%i4
	tne	%icc,	0x2
	orn	%l6,	%l5,	%l4
	fandnot2s	%f26,	%f6,	%f19
	fnor	%f14,	%f28,	%f12
	movn	%xcc,	%g4,	%i1
	ldsb	[%l7 + 0x2F],	%o4
	sll	%l2,	%l0,	%g7
	orcc	%i2,	0x06C2,	%l1
	movn	%icc,	%g6,	%i3
	tgu	%icc,	0x6
	add	%o6,	0x1D24,	%o7
	tleu	%icc,	0x1
	fmul8sux16	%f4,	%f8,	%f30
	fmovdcc	%xcc,	%f10,	%f19
	edge32	%l3,	%i6,	%o0
	array8	%g3,	%o1,	%g5
	edge8n	%o5,	%g1,	%i0
	brlz,a	%o2,	loop_132
	fcmpne32	%f18,	%f18,	%o3
	fmovdcc	%xcc,	%f2,	%f24
	addccc	%i7,	0x010B,	%i5
loop_132:
	fxnor	%f26,	%f14,	%f28
	fpsub16	%f4,	%f6,	%f22
	edge8l	%g2,	%i4,	%l6
	fmovd	%f28,	%f22
	flush	%l7 + 0x40
	orncc	%l5,	%l4,	%g4
	membar	0x4B
	movrgz	%i1,	%o4,	%l2
	lduh	[%l7 + 0x2C],	%l0
	bgu,a	loop_133
	fmovscs	%xcc,	%f23,	%f31
	movleu	%xcc,	%g7,	%i2
	fmovrse	%g6,	%f17,	%f12
loop_133:
	fexpand	%f7,	%f20
	tcc	%icc,	0x7
	edge32n	%l1,	%i3,	%o7
	ta	%icc,	0x1
	bvs,pt	%xcc,	loop_134
	array8	%l3,	%o6,	%o0
	movl	%xcc,	%i6,	%g3
	addcc	%o1,	0x0308,	%o5
loop_134:
	sllx	%g5,	0x09,	%i0
	movn	%xcc,	%o2,	%g1
	edge32ln	%i7,	%o3,	%i5
	movrlz	%g2,	%l6,	%i4
	udivcc	%l5,	0x1473,	%l4
	xnor	%g4,	0x069E,	%i1
	fnors	%f22,	%f19,	%f3
	orncc	%o4,	0x1265,	%l2
	sdivcc	%l0,	0x1A08,	%i2
	edge32	%g6,	%g7,	%l1
	fmuld8ulx16	%f16,	%f4,	%f24
	srax	%i3,	0x1B,	%l3
	xnor	%o7,	0x1FCB,	%o0
	edge16	%o6,	%g3,	%o1
	array32	%o5,	%g5,	%i6
	fzero	%f12
	edge8ln	%o2,	%i0,	%i7
	brgz	%o3,	loop_135
	movge	%xcc,	%i5,	%g1
	movl	%icc,	%l6,	%i4
	xor	%g2,	%l4,	%l5
loop_135:
	taddcctv	%g4,	0x1852,	%o4
	edge32n	%i1,	%l2,	%i2
	ta	%xcc,	0x3
	fzeros	%f22
	taddcc	%l0,	%g6,	%g7
	tsubcc	%i3,	0x19F0,	%l1
	membar	0x62
	xorcc	%o7,	%l3,	%o0
	subcc	%g3,	%o6,	%o1
	wr	%g0,	0x4f,	%asi
	ldxa	[%g0 + 0x38] %asi,	%g5
	movcs	%xcc,	%o5,	%i6
	tl	%xcc,	0x3
	udivcc	%o2,	0x164A,	%i7
	fbug	%fcc2,	loop_136
	tgu	%icc,	0x7
	edge32n	%o3,	%i5,	%g1
	bgu,pt	%icc,	loop_137
loop_136:
	edge16n	%i0,	%l6,	%g2
	sdivx	%l4,	0x0A5A,	%l5
	tle	%xcc,	0x1
loop_137:
	st	%f25,	[%l7 + 0x6C]
	sllx	%i4,	%o4,	%i1
	tge	%icc,	0x5
	stbar
	fmovsg	%xcc,	%f3,	%f0
	movneg	%icc,	%l2,	%g4
	array8	%l0,	%i2,	%g6
	tne	%icc,	0x4
	fand	%f2,	%f4,	%f8
	movl	%xcc,	%g7,	%l1
	edge16l	%o7,	%l3,	%i3
	be,a	loop_138
	tsubcc	%g3,	%o0,	%o6
	wr	%g0,	0x19,	%asi
	ldxa	[%l7 + 0x10] %asi,	%o1
loop_138:
	subccc	%g5,	0x0C93,	%o5
	fnegs	%f6,	%f1
	addc	%o2,	0x0E5E,	%i6
	sllx	%o3,	0x14,	%i5
	edge32n	%i7,	%i0,	%g1
	subcc	%l6,	%g2,	%l5
	and	%i4,	0x018D,	%l4
	subcc	%i1,	0x1579,	%o4
	smul	%g4,	0x02B6,	%l0
	smul	%i2,	0x06A3,	%g6
	sub	%g7,	0x194D,	%l2
	sub	%l1,	0x07C7,	%l3
	wr	%g0,	0x80,	%asi
	ldxa	[%l7 + 0x18] %asi,	%o7
	umulcc	%g3,	%o0,	%i3
	sdiv	%o1,	0x14D7,	%o6
	lduw	[%l7 + 0x1C],	%o5
	ldsh	[%l7 + 0x74],	%g5
	fornot1	%f30,	%f2,	%f24
	fbe	%fcc1,	loop_139
	fsrc2	%f12,	%f14
	fbo,a	%fcc0,	loop_140
	tsubcctv	%o2,	0x0EAD,	%o3
loop_139:
	brlez	%i5,	loop_141
	addccc	%i7,	0x1B5B,	%i6
loop_140:
	fpadd16s	%f3,	%f7,	%f26
	fandnot2s	%f6,	%f10,	%f30
loop_141:
	srax	%g1,	%i0,	%g2
	xnor	%l5,	%i4,	%l6
	andncc	%i1,	%l4,	%g4
	fmovdn	%xcc,	%f16,	%f19
	fbu	%fcc3,	loop_142
	fbne,a	%fcc0,	loop_143
	xorcc	%l0,	%o4,	%g6
	taddcc	%i2,	0x0DEB,	%l2
loop_142:
	edge16l	%l1,	%l3,	%o7
loop_143:
	movne	%xcc,	%g3,	%o0
	fpadd32	%f30,	%f26,	%f10
	std	%f4,	[%l7 + 0x08]
	movneg	%icc,	%g7,	%o1
	movpos	%icc,	%i3,	%o5
	tle	%icc,	0x1
	fandnot2	%f6,	%f16,	%f18
	fmovdpos	%xcc,	%f30,	%f14
	movleu	%xcc,	%g5,	%o2
	orn	%o3,	%i5,	%o6
	or	%i6,	0x04A9,	%i7
	alignaddr	%i0,	%g1,	%l5
	bn	loop_144
	udivcc	%g2,	0x04A7,	%i4
	edge16ln	%i1,	%l4,	%g4
	fbuge,a	%fcc3,	loop_145
loop_144:
	xorcc	%l0,	0x0562,	%o4
	popc	0x04D7,	%l6
	fble	%fcc2,	loop_146
loop_145:
	brlez	%i2,	loop_147
	sir	0x17C0
	xorcc	%g6,	%l2,	%l3
loop_146:
	or	%o7,	0x0219,	%l1
loop_147:
	movrne	%o0,	%g7,	%g3
	udiv	%o1,	0x0324,	%o5
	xnor	%g5,	%o2,	%o3
	nop
	setx	loop_148,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fmovda	%icc,	%f29,	%f15
	udivx	%i5,	0x0235,	%i3
	set	0x20, %o5
	stxa	%i6,	[%l7 + %o5] 0x81
loop_148:
	edge16	%o6,	%i0,	%g1
	flush	%l7 + 0x60
	add	%l5,	%i7,	%i4
	movrgez	%g2,	0x2C9,	%i1
	fmovdpos	%icc,	%f23,	%f11
	movne	%xcc,	%g4,	%l4
	fmovdl	%icc,	%f18,	%f19
	edge16l	%o4,	%l0,	%l6
	smul	%g6,	0x07D4,	%l2
	fmuld8sux16	%f0,	%f24,	%f30
	ta	%icc,	0x6
	orcc	%i2,	%l3,	%l1
	fcmpes	%fcc1,	%f16,	%f25
	wr	%g0,	0x22,	%asi
	stha	%o0,	[%l7 + 0x68] %asi
	membar	#Sync
	tvc	%xcc,	0x4
	flush	%l7 + 0x70
	orn	%o7,	%g3,	%o1
	edge16ln	%g7,	%g5,	%o2
	fmovdcc	%icc,	%f15,	%f10
	udivx	%o3,	0x0200,	%o5
	movne	%icc,	%i5,	%i6
	add	%o6,	0x1CA5,	%i0
	andncc	%g1,	%i3,	%i7
	nop
	setx	loop_149,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fmuld8sux16	%f6,	%f11,	%f26
	movrlz	%l5,	0x01C,	%g2
	st	%f15,	[%l7 + 0x24]
loop_149:
	brgz,a	%i1,	loop_150
	stx	%i4,	[%l7 + 0x70]
	or	%g4,	0x10E5,	%l4
	movrgz	%l0,	%o4,	%l6
loop_150:
	movg	%icc,	%l2,	%g6
	movpos	%xcc,	%l3,	%i2
	movrlez	%o0,	%l1,	%o7
	tne	%xcc,	0x5
	edge32ln	%g3,	%g7,	%g5
	ldub	[%l7 + 0x63],	%o1
	movcc	%icc,	%o3,	%o5
	add	%o2,	%i5,	%o6
	xnorcc	%i0,	%i6,	%g1
	orn	%i3,	0x071C,	%l5
	stbar
	umulcc	%i7,	0x0B66,	%i1
	fmovsle	%icc,	%f2,	%f3
	subcc	%g2,	0x1E67,	%i4
	tgu	%icc,	0x2
	mulx	%l4,	%l0,	%g4
	addcc	%l6,	0x0808,	%o4
	sdiv	%g6,	0x1129,	%l2
	tne	%icc,	0x7
	movgu	%xcc,	%i2,	%o0
	xnor	%l3,	%o7,	%l1
	set	0x20, %l2
	stxa	%g3,	[%l7 + %l2] 0x89
	bl,a,pn	%icc,	loop_151
	movcc	%icc,	%g5,	%o1
	alignaddrl	%o3,	%g7,	%o5
	sth	%o2,	[%l7 + 0x2A]
loop_151:
	sdivx	%i5,	0x113C,	%i0
	ta	%icc,	0x3
	array16	%i6,	%g1,	%o6
	addcc	%i3,	%i7,	%i1
	tl	%xcc,	0x2
	brz	%g2,	loop_152
	siam	0x4
	wr	%g0,	0x89,	%asi
	lda	[%l7 + 0x54] %asi,	%f6
loop_152:
	sethi	0x1923,	%l5
	tsubcc	%l4,	%l0,	%i4
	wr	%g0,	0x04,	%asi
	prefetcha	[%l7 + 0x38] %asi,	 0x2
	fbuge	%fcc2,	loop_153
	tsubcctv	%g4,	%o4,	%l2
	tgu	%icc,	0x6
	xnorcc	%g6,	%o0,	%i2
loop_153:
	movn	%xcc,	%o7,	%l3
	fmovsg	%icc,	%f25,	%f14
	fmovrslz	%l1,	%f13,	%f10
	sdiv	%g3,	0x1E3A,	%o1
	addccc	%g5,	%g7,	%o5
	fandnot2s	%f27,	%f15,	%f21
	membar	0x4F
	fcmpd	%fcc3,	%f20,	%f22
	call	loop_154
	xorcc	%o2,	%i5,	%i0
	bgu	loop_155
	or	%o3,	%g1,	%o6
loop_154:
	andncc	%i3,	%i7,	%i6
	movrne	%i1,	%g2,	%l4
loop_155:
	edge16n	%l5,	%i4,	%l6
	fcmped	%fcc1,	%f8,	%f16
	edge32ln	%l0,	%g4,	%o4
	movge	%xcc,	%g6,	%l2
	siam	0x0
	fmovsvc	%icc,	%f10,	%f8
	brgez,a	%o0,	loop_156
	fmovsle	%icc,	%f29,	%f15
	movrgz	%o7,	0x05D,	%i2
	fmovrdne	%l1,	%f28,	%f28
loop_156:
	fbu,a	%fcc2,	loop_157
	sllx	%g3,	0x08,	%o1
	fmovscs	%xcc,	%f14,	%f2
	mova	%xcc,	%g5,	%l3
loop_157:
	edge32l	%o5,	%o2,	%g7
	orncc	%i0,	%o3,	%g1
	edge8l	%i5,	%i3,	%i7
	udivcc	%o6,	0x06BF,	%i1
	movre	%g2,	0x3EF,	%l4
	subcc	%l5,	%i6,	%l6
	smulcc	%l0,	%i4,	%o4
	add	%l7,	0x50,	%l6
	wr	%g0,	0x10,	%asi
	casa	[%l6] 0x10,	%g6,	%l2
	nop
	setx loop_158, %l0, %l1
	jmpl %l1, %g4
	ld	[%l7 + 0x54],	%f19
	set	0x48, %g3
	prefetcha	[%l7 + %g3] 0x88,	 0x0
loop_158:
	movrgez	%o0,	%i2,	%g3
	movcs	%icc,	%l1,	%g5
	mulscc	%l3,	0x1268,	%o5
	bne,pt	%icc,	loop_159
	addcc	%o1,	%g7,	%i0
	sll	%o2,	%g1,	%o3
	movrgz	%i5,	0x1FF,	%i7
loop_159:
	ldstub	[%l7 + 0x14],	%i3
	wr	%g0,	0x89,	%asi
	swapa	[%l7 + 0x20] %asi,	%o6
	wr	%g0,	0x81,	%asi
	sta	%f24,	[%l7 + 0x3C] %asi
	fabsd	%f6,	%f10
	andncc	%g2,	%i1,	%l4
	fmul8sux16	%f6,	%f4,	%f2
	xor	%l5,	0x13C1,	%l6
	fsrc1	%f4,	%f16
	bcs,a,pt	%icc,	loop_160
	udivcc	%i6,	0x1010,	%i4
	tsubcctv	%o4,	0x0952,	%l0
	srlx	%g6,	0x10,	%g4
loop_160:
	mova	%xcc,	%l2,	%o7
	set	0x18, %g2
	sta	%f31,	[%l7 + %g2] 0x18
	set	0x0E, %l1
	ldsha	[%l7 + %l1] 0x80,	%o0
	fsrc2	%f18,	%f28
	bcs,a,pn	%xcc,	loop_161
	ldub	[%l7 + 0x20],	%g3
	movrgez	%l1,	0x20A,	%g5
	fors	%f31,	%f17,	%f14
loop_161:
	edge16l	%l3,	%i2,	%o1
	fones	%f6
	nop
	set	0x7C, %i4
	prefetch	[%l7 + %i4],	 0x0
	fbue,a	%fcc2,	loop_162
	te	%xcc,	0x7
	edge32ln	%o5,	%g7,	%i0
	xor	%g1,	0x1F96,	%o3
loop_162:
	brnz	%o2,	loop_163
	tge	%icc,	0x1
	sir	0x15A9
	fpadd32	%f26,	%f4,	%f0
loop_163:
	xnor	%i7,	0x1FBB,	%i3
	ld	[%l7 + 0x6C],	%f25
	wr	%g0,	0x0c,	%asi
	swapa	[%l7 + 0x6C] %asi,	%i5
	edge32n	%o6,	%g2,	%i1
	smul	%l5,	%l4,	%i6
	fsrc2s	%f22,	%f3
	fmovrslez	%l6,	%f24,	%f16
	tvc	%xcc,	0x5
	fmovdg	%xcc,	%f19,	%f23
	fmovsneg	%icc,	%f22,	%f1
	membar	#Sync
	wr	%g0,	0x1f,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	tsubcc	%o4,	0x1B72,	%l0
	movrgz	%g6,	%i4,	%g4
	andncc	%l2,	%o7,	%o0
	tgu	%xcc,	0x0
	movpos	%icc,	%l1,	%g5
	fbuge,a	%fcc3,	loop_164
	bvs,a	loop_165
	fcmpes	%fcc2,	%f18,	%f16
	set	0x5E, %o7
	ldstuba	[%l7 + %o7] 0x0c,	%l3
loop_164:
	xnor	%i2,	0x05DC,	%g3
loop_165:
	udivx	%o5,	0x0B5C,	%o1
	mulscc	%i0,	%g1,	%g7
	fabss	%f14,	%f19
	bne	loop_166
	nop
	setx	loop_167,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fmovdleu	%icc,	%f23,	%f19
	sra	%o3,	%i7,	%o2
loop_166:
	array16	%i3,	%o6,	%g2
loop_167:
	fmovdleu	%icc,	%f0,	%f1
	ldub	[%l7 + 0x5D],	%i5
	fnands	%f17,	%f27,	%f24
	fbne,a	%fcc2,	loop_168
	xor	%i1,	0x0F30,	%l4
	fba,a	%fcc3,	loop_169
	fbuge,a	%fcc2,	loop_170
loop_168:
	movn	%xcc,	%i6,	%l5
	bcs,a,pt	%xcc,	loop_171
loop_169:
	movl	%xcc,	%o4,	%l6
loop_170:
	sir	0x1FB9
	te	%xcc,	0x5
loop_171:
	mulscc	%g6,	0x0DB9,	%l0
	fcmpgt16	%f18,	%f30,	%i4
	sllx	%l2,	0x1F,	%g4
	set	0x28, %g6
	stda	%o6,	[%l7 + %g6] 0x18
	edge16l	%l1,	%g5,	%o0
	andncc	%i2,	%g3,	%l3
	movne	%icc,	%o1,	%o5
	fba,a	%fcc3,	loop_172
	subcc	%i0,	0x05BA,	%g7
	fsrc1s	%f29,	%f8
	fbn	%fcc2,	loop_173
loop_172:
	tg	%xcc,	0x4
	edge16ln	%o3,	%g1,	%o2
	movrgez	%i7,	%o6,	%i3
loop_173:
	fmovsne	%xcc,	%f1,	%f30
	edge8n	%i5,	%i1,	%g2
	edge16l	%l4,	%i6,	%o4
	fmovrslez	%l6,	%f17,	%f25
	fornot2	%f8,	%f4,	%f16
	tleu	%xcc,	0x3
	tsubcctv	%g6,	0x1357,	%l0
	tle	%icc,	0x2
	movrlez	%i4,	0x089,	%l2
	sth	%l5,	[%l7 + 0x62]
	andn	%o7,	0x0F8F,	%l1
	wr	%g0,	0x57,	%asi
	stxa	%g5,	[%g0 + 0x0] %asi
	set	0x08, %l0
	swapa	[%l7 + %l0] 0x89,	%o0
	tleu	%icc,	0x6
	bgu,a,pn	%icc,	loop_174
	move	%xcc,	%i2,	%g4
	edge32n	%g3,	%l3,	%o5
	orncc	%i0,	%o1,	%o3
loop_174:
	and	%g1,	0x06F1,	%g7
	sll	%i7,	0x1B,	%o2
	tcc	%xcc,	0x5
	xor	%i3,	%i5,	%i1
	sllx	%g2,	%o6,	%l4
	movcc	%icc,	%i6,	%o4
	ldd	[%l7 + 0x70],	%f10
	sethi	0x1AD8,	%l6
	tpos	%icc,	0x5
	array32	%g6,	%l0,	%i4
	and	%l5,	0x0F4D,	%l2
	tgu	%icc,	0x0
	ld	[%l7 + 0x40],	%f6
	smul	%l1,	0x0A46,	%o7
	movneg	%xcc,	%g5,	%i2
	fbul,a	%fcc3,	loop_175
	fnand	%f30,	%f6,	%f6
	xorcc	%o0,	%g3,	%l3
	fmul8x16	%f30,	%f8,	%f20
loop_175:
	ta	%icc,	0x5
	tge	%icc,	0x0
	mova	%xcc,	%g4,	%i0
	fmovsge	%xcc,	%f21,	%f22
	ble,pn	%xcc,	loop_176
	alignaddrl	%o5,	%o3,	%o1
	edge8n	%g1,	%g7,	%i7
	ble,a,pt	%icc,	loop_177
loop_176:
	fpack16	%f20,	%f15
	wr	%g0,	0x89,	%asi
	prefetcha	[%l7 + 0x40] %asi,	 0x2
loop_177:
	edge16n	%i5,	%i1,	%o2
	fxnors	%f27,	%f17,	%f16
	xnor	%g2,	%l4,	%o6
	smul	%i6,	%o4,	%g6
	array32	%l0,	%l6,	%l5
	array8	%i4,	%l2,	%o7
	tg	%icc,	0x7
	fba,a	%fcc2,	loop_178
	fmovrsne	%l1,	%f7,	%f25
	stb	%g5,	[%l7 + 0x27]
	xorcc	%i2,	%g3,	%o0
loop_178:
	fmovsleu	%icc,	%f9,	%f25
	set	0x60, %l3
	ldsha	[%l7 + %l3] 0x11,	%g4
	fmovdleu	%icc,	%f30,	%f1
	fpack32	%f8,	%f30,	%f18
	andncc	%l3,	%o5,	%i0
	flush	%l7 + 0x58
	sdivcc	%o1,	0x163D,	%g1
	nop
	setx loop_179, %l0, %l1
	jmpl %l1, %g7
	stbar
	movpos	%xcc,	%i7,	%i3
	fmovsgu	%icc,	%f31,	%f28
loop_179:
	brgz	%o3,	loop_180
	fbug	%fcc0,	loop_181
	edge8	%i5,	%i1,	%g2
	fpadd16s	%f19,	%f21,	%f4
loop_180:
	movrgez	%l4,	%o6,	%i6
loop_181:
	tle	%icc,	0x7
	tcc	%icc,	0x3
	membar	0x55
	alignaddr	%o2,	%o4,	%g6
	movge	%icc,	%l0,	%l5
	mova	%xcc,	%l6,	%l2
	fpsub16s	%f30,	%f17,	%f9
	fmovspos	%icc,	%f30,	%f19
	tsubcc	%i4,	%l1,	%o7
	wr	%g0,	0x18,	%asi
	lduha	[%l7 + 0x2A] %asi,	%i2
	te	%icc,	0x0
	fbue,a	%fcc2,	loop_182
	fcmps	%fcc0,	%f16,	%f4
	tleu	%xcc,	0x5
	srlx	%g3,	0x05,	%o0
loop_182:
	tge	%xcc,	0x6
	sllx	%g5,	0x17,	%l3
	fpackfix	%f16,	%f28
	stb	%g4,	[%l7 + 0x30]
	fmovrde	%i0,	%f20,	%f8
	nop
	setx	loop_183,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fpack32	%f16,	%f14,	%f8
	tcs	%icc,	0x0
	movre	%o1,	0x3AB,	%g1
loop_183:
	nop
	wr	%g0,	0x27,	%asi
	stxa	%o5,	[%l7 + 0x68] %asi
	membar	#Sync
	movneg	%icc,	%g7,	%i3
	popc	0x1B79,	%o3
	fabsd	%f22,	%f18
	fbuge	%fcc0,	loop_184
	lduh	[%l7 + 0x14],	%i7
	fsrc2s	%f18,	%f17
	movgu	%icc,	%i1,	%i5
loop_184:
	tg	%icc,	0x7
	taddcctv	%l4,	%g2,	%i6
	fmovde	%icc,	%f12,	%f1
	edge16ln	%o2,	%o4,	%g6
	std	%o6,	[%l7 + 0x48]
	array16	%l0,	%l5,	%l6
	taddcc	%i4,	%l2,	%l1
	add	%l7,	0x60,	%l6
	wr	%g0,	0x10,	%asi
	casxa	[%l6] %asi,	%i2,	%o7
	set	0x3A, %i1
	stha	%g3,	[%l7 + %i1] 0xe3
	membar	#Sync
	movn	%xcc,	%g5,	%l3
	fmul8x16au	%f10,	%f27,	%f14
	smul	%g4,	%i0,	%o1
	mova	%icc,	%g1,	%o0
	add	%o5,	0x0E4A,	%i3
	fble,a	%fcc2,	loop_185
	fones	%f8
	brgez,a	%o3,	loop_186
	brlz,a	%i7,	loop_187
loop_185:
	movn	%icc,	%i1,	%i5
	udiv	%l4,	0x0857,	%g2
loop_186:
	nop
	set	0x76, %l4
	ldsha	[%l7 + %l4] 0x81,	%i6
loop_187:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tleu	%icc,	0x3
	fmovs	%f11,	%f23
	sir	0x0442
	wr	%g0,	0x11,	%asi
	lduba	[%l7 + 0x6F] %asi,	%g7
	fandnot1	%f14,	%f28,	%f10
	brgz,a	%o4,	loop_188
	movre	%g6,	%o2,	%o6
	fzero	%f16
	edge16ln	%l0,	%l6,	%i4
loop_188:
	bvs	%xcc,	loop_189
	st	%f8,	[%l7 + 0x50]
	taddcc	%l2,	0x0E28,	%l1
	fzero	%f6
loop_189:
	bcc	%xcc,	loop_190
	taddcc	%l5,	%o7,	%i2
	movcc	%icc,	%g3,	%g5
	fmovdpos	%icc,	%f14,	%f20
loop_190:
	edge16n	%g4,	%l3,	%o1
	wr	%g0,	0x19,	%asi
	lda	[%l7 + 0x44] %asi,	%f20
	fornot1	%f8,	%f28,	%f30
	set	0x5C, %o4
	lduwa	[%l7 + %o4] 0x81,	%g1
	ldsw	[%l7 + 0x60],	%o0
	array8	%i0,	%i3,	%o5
	add	%i7,	%o3,	%i1
	movvc	%xcc,	%l4,	%i5
	fcmpne32	%f24,	%f0,	%i6
	add	%l7,	0x5C,	%l6
	wr	%g0,	0x04,	%asi
	lda	[%l6] %asi,	%g2
	casa	[%l6] %asi,	%g2,	%g7
	lduw	[%l7 + 0x58],	%g6
	movleu	%xcc,	%o2,	%o6
	smulcc	%o4,	%l0,	%l6
	or	%i4,	%l2,	%l5
	sir	0x0E29
	mulscc	%l1,	0x001E,	%o7
	fnot1	%f4,	%f16
	tleu	%xcc,	0x1
	subccc	%i2,	0x174F,	%g3
	fbu	%fcc1,	loop_191
	movre	%g4,	0x391,	%g5
	orcc	%o1,	%l3,	%o0
	fcmpgt32	%f2,	%f24,	%i0
loop_191:
	fmovrdgz	%g1,	%f12,	%f28
	tvc	%icc,	0x4
	bg,pt	%icc,	loop_192
	tcc	%xcc,	0x6
	andncc	%i3,	%o5,	%o3
	mulscc	%i1,	%i7,	%i5
loop_192:
	fmovdvs	%icc,	%f19,	%f4
	udivcc	%l4,	0x0A1E,	%g2
	umulcc	%i6,	0x19BB,	%g7
	edge32l	%g6,	%o6,	%o2
	tsubcctv	%o4,	%l0,	%l6
	udiv	%i4,	0x0E80,	%l2
	fabss	%f4,	%f3
	wr	%g0,	0x23,	%asi
	stxa	%l5,	[%l7 + 0x58] %asi
	membar	#Sync
	popc	%o7,	%l1
	edge16n	%g3,	%g4,	%i2
	addc	%g5,	%o1,	%o0
	edge8l	%l3,	%i0,	%i3
	movg	%xcc,	%o5,	%o3
	fmovdneg	%icc,	%f20,	%f3
	mova	%icc,	%i1,	%g1
	fbu	%fcc0,	loop_193
	movn	%icc,	%i5,	%l4
	tg	%icc,	0x6
	ldsh	[%l7 + 0x4E],	%g2
loop_193:
	subcc	%i7,	%g7,	%i6
	ldsh	[%l7 + 0x26],	%g6
	addcc	%o6,	%o2,	%o4
	lduw	[%l7 + 0x70],	%l6
	edge8ln	%l0,	%i4,	%l5
	ldsw	[%l7 + 0x74],	%l2
	fcmpeq16	%f8,	%f18,	%o7
	fpsub16	%f22,	%f28,	%f10
	movrgz	%l1,	0x372,	%g3
	or	%g4,	%i2,	%g5
	udiv	%o1,	0x1B3B,	%o0
	addc	%l3,	%i3,	%i0
	fxors	%f19,	%f27,	%f18
	fmul8sux16	%f16,	%f4,	%f10
	fbu	%fcc2,	loop_194
	st	%f17,	[%l7 + 0x28]
	fnegs	%f0,	%f12
	srl	%o3,	0x15,	%i1
loop_194:
	smul	%o5,	%i5,	%l4
	fmovdvc	%icc,	%f28,	%f31
	tvs	%icc,	0x4
	fxor	%f8,	%f12,	%f16
	fba,a	%fcc2,	loop_195
	fbe,a	%fcc3,	loop_196
	edge16n	%g1,	%i7,	%g2
	fmovsn	%icc,	%f13,	%f29
loop_195:
	taddcctv	%i6,	0x0BC7,	%g6
loop_196:
	movrgz	%o6,	0x1C7,	%o2
	xor	%o4,	%g7,	%l0
	wr	%g0,	0x16,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
	srax	%i4,	%l6,	%l5
	movvc	%icc,	%l2,	%l1
	edge16n	%o7,	%g4,	%i2
	membar	0x00
	bvc	%xcc,	loop_197
	fmovrdgz	%g3,	%f22,	%f20
	smulcc	%g5,	%o1,	%o0
	stw	%l3,	[%l7 + 0x78]
loop_197:
	edge32l	%i3,	%i0,	%o3
	umul	%o5,	%i5,	%l4
	movcs	%icc,	%i1,	%g1
	brz,a	%g2,	loop_198
	edge8l	%i7,	%i6,	%g6
	taddcc	%o6,	0x17FC,	%o4
	fmovsvs	%icc,	%f11,	%f22
loop_198:
	mova	%icc,	%o2,	%l0
	fbule	%fcc3,	loop_199
	tle	%icc,	0x6
	sir	0x1399
	fbge	%fcc2,	loop_200
loop_199:
	bge,a	loop_201
	fcmple32	%f4,	%f20,	%i4
	fbge,a	%fcc3,	loop_202
loop_200:
	movrgz	%g7,	%l6,	%l2
loop_201:
	tn	%xcc,	0x3
	popc	%l1,	%l5
loop_202:
	edge8	%g4,	%o7,	%i2
	tvs	%xcc,	0x3
	sdiv	%g5,	0x1019,	%o1
	sir	0x12BB
	set	0x67, %o6
	stba	%g3,	[%l7 + %o6] 0x14
	bgu,a	%icc,	loop_203
	fnegd	%f22,	%f14
	edge8n	%o0,	%i3,	%i0
	fmovdleu	%xcc,	%f11,	%f3
loop_203:
	addccc	%l3,	0x0F8A,	%o5
	fands	%f27,	%f30,	%f12
	orncc	%i5,	%l4,	%o3
	movleu	%icc,	%i1,	%g2
	lduh	[%l7 + 0x78],	%g1
	udiv	%i6,	0x0374,	%i7
	tne	%icc,	0x5
	alignaddrl	%g6,	%o6,	%o2
	stw	%o4,	[%l7 + 0x4C]
	udivcc	%i4,	0x1348,	%l0
	bpos,a,pt	%icc,	loop_204
	fands	%f6,	%f20,	%f11
	fpsub32	%f20,	%f12,	%f22
	move	%icc,	%g7,	%l2
loop_204:
	movcs	%icc,	%l1,	%l5
	orn	%l6,	0x0D3E,	%o7
	movrgez	%i2,	%g5,	%g4
	fmovrsgz	%g3,	%f10,	%f18
	move	%xcc,	%o1,	%o0
	movgu	%xcc,	%i3,	%l3
	fmovda	%xcc,	%f29,	%f4
	movle	%xcc,	%i0,	%o5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmpne16	%f4,	%f20,	%l4
	ble,a	loop_205
	brnz	%i5,	loop_206
	fnor	%f28,	%f12,	%f30
	umulcc	%o3,	0x0C1C,	%g2
loop_205:
	brnz	%g1,	loop_207
loop_206:
	std	%f2,	[%l7 + 0x70]
	subccc	%i1,	0x1722,	%i6
	fpsub16s	%f20,	%f30,	%f15
loop_207:
	tn	%xcc,	0x0
	fbule,a	%fcc3,	loop_208
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fornot1s	%f14,	%f2,	%f21
	tvc	%xcc,	0x0
loop_208:
	mulscc	%g6,	%o6,	%i7
	orn	%o2,	0x1853,	%i4
	xorcc	%l0,	%o4,	%l2
	and	%l1,	0x0568,	%l5
	xorcc	%g7,	%o7,	%i2
	movn	%icc,	%g5,	%g4
	movrne	%l6,	%o1,	%o0
	taddcc	%g3,	%l3,	%i3
	std	%i0,	[%l7 + 0x10]
	movrlez	%l4,	%i5,	%o5
	addccc	%o3,	0x1067,	%g2
	fnors	%f14,	%f4,	%f17
	edge16ln	%g1,	%i1,	%g6
	fbge,a	%fcc3,	loop_209
	umulcc	%o6,	%i6,	%o2
	taddcctv	%i7,	0x11D6,	%l0
	smul	%i4,	%o4,	%l2
loop_209:
	fmovdpos	%xcc,	%f3,	%f18
	fcmpes	%fcc1,	%f19,	%f21
	fbu,a	%fcc1,	loop_210
	fbe	%fcc2,	loop_211
	ta	%xcc,	0x0
	tg	%icc,	0x5
loop_210:
	bn,pn	%icc,	loop_212
loop_211:
	ble,pt	%xcc,	loop_213
	fabsd	%f26,	%f6
	movge	%xcc,	%l5,	%g7
loop_212:
	movcc	%icc,	%o7,	%l1
loop_213:
	tneg	%icc,	0x1
	fmovdvs	%icc,	%f13,	%f8
	fcmpgt32	%f12,	%f12,	%i2
	edge16n	%g4,	%l6,	%g5
	std	%o0,	[%l7 + 0x60]
	ble	%xcc,	loop_214
	udivcc	%g3,	0x0043,	%l3
	ba,a	loop_215
	fbu,a	%fcc0,	loop_216
loop_214:
	tge	%xcc,	0x1
	andncc	%i3,	%o1,	%l4
loop_215:
	te	%xcc,	0x2
loop_216:
	tleu	%icc,	0x1
	edge8	%i0,	%i5,	%o3
	movgu	%icc,	%o5,	%g2
	fmovdpos	%icc,	%f26,	%f19
	edge8	%i1,	%g1,	%g6
	edge16	%o6,	%o2,	%i6
	fpsub32s	%f20,	%f28,	%f6
	add	%l7,	0x78,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%i7
	casxa	[%l6] 0x88,	%i7,	%l0
	sdiv	%o4,	0x18BE,	%i4
	fbo,a	%fcc1,	loop_217
	taddcc	%l2,	0x15FA,	%l5
	andncc	%o7,	%g7,	%i2
	set	0x58, %o2
	lduba	[%l7 + %o2] 0x04,	%l1
loop_217:
	fcmpne16	%f26,	%f28,	%l6
	wr	%g0,	0x0c,	%asi
	lduwa	[%l7 + 0x14] %asi,	%g4
	fmovde	%icc,	%f30,	%f7
	tge	%xcc,	0x2
	sub	%g5,	%o0,	%l3
	array16	%g3,	%i3,	%l4
	andn	%o1,	0x0272,	%i0
	tne	%icc,	0x3
	fmovda	%xcc,	%f25,	%f21
	fblg,a	%fcc0,	loop_218
	movrlz	%o3,	%i5,	%g2
	edge16ln	%i1,	%o5,	%g1
	add	%g6,	0x1436,	%o6
loop_218:
	fmovde	%xcc,	%f22,	%f14
	nop
	setx	loop_219,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	edge32n	%i6,	%i7,	%l0
	swap	[%l7 + 0x7C],	%o4
	te	%icc,	0x1
loop_219:
	brz	%i4,	loop_220
	movpos	%icc,	%l2,	%o2
	subcc	%l5,	0x18AC,	%g7
	fzero	%f30
loop_220:
	movrlz	%i2,	0x29D,	%o7
	movrgz	%l1,	%l6,	%g4
	flush	%l7 + 0x34
	fbo	%fcc3,	loop_221
	fors	%f26,	%f5,	%f24
	be	loop_222
	popc	0x103C,	%g5
loop_221:
	ldsw	[%l7 + 0x7C],	%l3
	ldd	[%l7 + 0x20],	%o0
loop_222:
	edge32l	%i3,	%l4,	%o1
	edge16	%i0,	%o3,	%g3
	movpos	%xcc,	%g2,	%i5
	bgu,a	%icc,	loop_223
	edge8ln	%i1,	%g1,	%o5
	udivcc	%o6,	0x08C9,	%i6
	wr	%g0,	0xe3,	%asi
	stba	%i7,	[%l7 + 0x76] %asi
	membar	#Sync
loop_223:
	nop
	membar	#Sync
	wr	%g0,	0xf0,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	smulcc	%g6,	%l0,	%i4
	edge16	%l2,	%o4,	%o2
	and	%l5,	%i2,	%g7
	fbul	%fcc3,	loop_224
	edge16ln	%l1,	%l6,	%g4
	fnands	%f2,	%f20,	%f18
	sdiv	%g5,	0x0B1A,	%o7
loop_224:
	ldd	[%l7 + 0x18],	%f4
	tge	%icc,	0x5
	set	0x26, %l5
	ldsha	[%l7 + %l5] 0x81,	%l3
	edge32l	%i3,	%l4,	%o0
	fnands	%f12,	%f21,	%f7
	tvc	%xcc,	0x7
	sdiv	%o1,	0x0CF9,	%i0
	prefetch	[%l7 + 0x40],	 0x1
	ldx	[%l7 + 0x68],	%g3
	fbu	%fcc0,	loop_225
	bcc	%icc,	loop_226
	fmul8x16al	%f14,	%f27,	%f10
	ta	%xcc,	0x7
loop_225:
	membar	0x0C
loop_226:
	nop
	set	0x78, %i0
	stxa	%g2,	[%l7 + %i0] 0x15
	fmovdl	%icc,	%f1,	%f17
	movl	%xcc,	%i5,	%i1
	lduw	[%l7 + 0x38],	%o3
	fnands	%f28,	%f0,	%f30
	set	0x78, %o3
	prefetcha	[%l7 + %o3] 0x10,	 0x0
	wr	%g0,	0x81,	%asi
	ldsha	[%l7 + 0x4C] %asi,	%o6
	movrgz	%o5,	0x3F6,	%i6
	fmovsneg	%xcc,	%f18,	%f30
	wr	%g0,	0x19,	%asi
	ldstuba	[%l7 + 0x67] %asi,	%i7
	fmovde	%xcc,	%f3,	%f11
	sub	%l0,	0x02F1,	%g6
	fmovdcc	%xcc,	%f9,	%f6
	subcc	%i4,	%l2,	%o2
	fmovsvc	%icc,	%f15,	%f24
	fpadd16s	%f11,	%f30,	%f12
	fones	%f20
	wr	%g0,	0x18,	%asi
	lduwa	[%l7 + 0x58] %asi,	%l5
	fmul8x16au	%f18,	%f16,	%f24
	fmovsle	%icc,	%f11,	%f0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bg,pn	%icc,	loop_227
	brgez,a	%i2,	loop_228
	srl	%o4,	%l1,	%g7
	fbo,a	%fcc0,	loop_229
loop_227:
	xorcc	%l6,	%g4,	%o7
loop_228:
	edge32n	%l3,	%g5,	%l4
	edge8n	%o0,	%i3,	%i0
loop_229:
	movn	%xcc,	%g3,	%g2
	taddcc	%i5,	0x095E,	%i1
	lduh	[%l7 + 0x6A],	%o3
	alignaddrl	%g1,	%o6,	%o1
	smul	%i6,	0x0CA0,	%i7
	fmovdleu	%xcc,	%f15,	%f7
	xor	%o5,	0x10AE,	%l0
	movrgez	%i4,	%l2,	%g6
	movleu	%xcc,	%l5,	%i2
	udiv	%o2,	0x035E,	%o4
	alignaddrl	%l1,	%l6,	%g7
	sll	%g4,	0x08,	%o7
	set	0x40, %g7
	ldxa	[%l7 + %g7] 0x81,	%g5
	xnorcc	%l3,	0x0DF7,	%o0
	srlx	%i3,	%l4,	%i0
	srax	%g2,	0x06,	%i5
	fcmple32	%f20,	%f20,	%i1
	smul	%o3,	%g1,	%o6
	movneg	%icc,	%o1,	%g3
	fpmerge	%f6,	%f21,	%f28
	nop
	setx	loop_230,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movge	%xcc,	%i6,	%o5
	andncc	%l0,	%i4,	%i7
	fmul8sux16	%f24,	%f18,	%f18
loop_230:
	fcmpes	%fcc2,	%f26,	%f16
	movrlez	%l2,	%g6,	%i2
	movn	%icc,	%l5,	%o4
	fbo	%fcc1,	loop_231
	bvs	%xcc,	loop_232
	be	%icc,	loop_233
	sllx	%o2,	%l6,	%l1
loop_231:
	tpos	%icc,	0x5
loop_232:
	edge8	%g7,	%o7,	%g5
loop_233:
	brnz,a	%l3,	loop_234
	movcs	%icc,	%o0,	%g4
	ta	%icc,	0x3
	edge8ln	%l4,	%i3,	%i0
loop_234:
	xor	%i5,	%i1,	%o3
	set	0x6C, %i5
	lduwa	[%l7 + %i5] 0x10,	%g1
	fmovrdne	%g2,	%f8,	%f2
	fpsub32s	%f16,	%f26,	%f2
	fbe,a	%fcc2,	loop_235
	movre	%o6,	0x18F,	%o1
	tvs	%icc,	0x4
	nop
	setx	loop_236,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_235:
	movpos	%icc,	%g3,	%o5
	movg	%xcc,	%l0,	%i4
	sdivcc	%i7,	0x1677,	%l2
loop_236:
	fmovrsgez	%i6,	%f12,	%f17
	edge32ln	%i2,	%g6,	%o4
	fmovdpos	%xcc,	%f27,	%f3
	srax	%l5,	%l6,	%o2
	fmovs	%f7,	%f16
	tl	%icc,	0x5
	tge	%xcc,	0x0
	for	%f18,	%f20,	%f4
	sth	%l1,	[%l7 + 0x4E]
	fpack32	%f26,	%f14,	%f24
	fmovdvc	%xcc,	%f29,	%f12
	sub	%g7,	0x0376,	%o7
	fbuge	%fcc0,	loop_237
	sir	0x1F3A
	membar	0x26
	tge	%xcc,	0x2
loop_237:
	nop
	wr	%g0,	0xe3,	%asi
	stxa	%g5,	[%l7 + 0x68] %asi
	membar	#Sync
	movcs	%icc,	%l3,	%g4
	tge	%icc,	0x6
	fcmpeq32	%f2,	%f26,	%o0
	tle	%icc,	0x4
	tneg	%xcc,	0x6
	bleu,pt	%icc,	loop_238
	xor	%l4,	%i0,	%i5
	membar	0x6C
	sll	%i3,	%i1,	%o3
loop_238:
	movrlez	%g2,	%g1,	%o1
	or	%o6,	0x1F61,	%g3
	udivx	%o5,	0x0CDA,	%l0
	tvc	%icc,	0x6
	and	%i4,	0x191D,	%l2
	tsubcctv	%i7,	0x0B49,	%i6
	tgu	%icc,	0x3
	fmovd	%f4,	%f16
	tcs	%icc,	0x5
	fbule,a	%fcc0,	loop_239
	brgz	%i2,	loop_240
	fbul	%fcc0,	loop_241
	andcc	%g6,	%o4,	%l5
loop_239:
	xorcc	%o2,	%l1,	%g7
loop_240:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_241:
	nop
	wr	%g0,	0x10,	%asi
	lduba	[%l7 + 0x2B] %asi,	%o7
	brlz	%g5,	loop_242
	fxor	%f30,	%f0,	%f0
	fors	%f16,	%f14,	%f8
	fcmps	%fcc1,	%f21,	%f2
loop_242:
	orcc	%l3,	0x166B,	%g4
	fmovde	%icc,	%f29,	%f24
	fcmpgt32	%f0,	%f14,	%o0
	addc	%l4,	%l6,	%i5
	fnegd	%f26,	%f10
	edge8n	%i3,	%i0,	%o3
	subcc	%i1,	%g2,	%o1
	fbue,a	%fcc1,	loop_243
	udivcc	%g1,	0x03AB,	%o6
	ldsh	[%l7 + 0x7A],	%o5
	sdivcc	%l0,	0x1746,	%g3
loop_243:
	fmovs	%f25,	%f23
	movcc	%xcc,	%i4,	%i7
	nop
	setx	loop_244,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tvc	%icc,	0x3
	subccc	%i6,	0x00A7,	%l2
	fmovdcs	%xcc,	%f30,	%f4
loop_244:
	bvc,a,pn	%icc,	loop_245
	tg	%icc,	0x4
	sub	%g6,	%o4,	%l5
	movrgez	%i2,	%o2,	%g7
loop_245:
	addc	%l1,	0x0F66,	%g5
	set	0x50, %l6
	stwa	%o7,	[%l7 + %l6] 0x80
	movl	%icc,	%g4,	%o0
	addcc	%l4,	0x0A5C,	%l6
	fones	%f17
	fblg,a	%fcc2,	loop_246
	fpack16	%f28,	%f19
	fsrc1s	%f26,	%f13
	movge	%xcc,	%i5,	%i3
loop_246:
	membar	0x2C
	sllx	%i0,	0x1A,	%l3
	fcmpne16	%f0,	%f12,	%o3
	fmovrdgz	%g2,	%f30,	%f4
	udivx	%i1,	0x180B,	%o1
	set	0x50, %i7
	stda	%g0,	[%l7 + %i7] 0x27
	membar	#Sync
	umulcc	%o6,	0x1570,	%o5
	movrlez	%g3,	%l0,	%i7
	tcc	%xcc,	0x6
	bg,a,pt	%icc,	loop_247
	move	%icc,	%i6,	%l2
	bneg,pn	%xcc,	loop_248
	tcs	%xcc,	0x6
loop_247:
	tneg	%icc,	0x5
	fsrc2	%f12,	%f0
loop_248:
	edge32ln	%i4,	%g6,	%o4
	wr	%g0,	0x10,	%asi
	ldstuba	[%l7 + 0x28] %asi,	%i2
	movne	%icc,	%o2,	%l5
	tneg	%xcc,	0x3
	array32	%l1,	%g7,	%o7
	fpackfix	%f10,	%f8
	wr	%g0,	0x80,	%asi
	prefetcha	[%l7 + 0x70] %asi,	 0x0
	fbge,a	%fcc2,	loop_249
	fmovsgu	%xcc,	%f26,	%f9
	ldsw	[%l7 + 0x74],	%o0
	sll	%g5,	%l6,	%l4
loop_249:
	tl	%icc,	0x2
	fmovsle	%icc,	%f26,	%f4
	edge8l	%i3,	%i5,	%i0
	addcc	%o3,	0x027B,	%g2
	fnot2s	%f5,	%f19
	fmovdne	%xcc,	%f5,	%f29
	movcs	%icc,	%l3,	%i1
	mova	%xcc,	%g1,	%o1
	orn	%o5,	%o6,	%g3
	nop
	setx	loop_250,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	edge16l	%i7,	%i6,	%l2
	fmul8x16	%f15,	%f0,	%f2
	orcc	%l0,	0x0DF5,	%i4
loop_250:
	udivcc	%o4,	0x149C,	%g6
	udivcc	%i2,	0x1946,	%l5
	edge16l	%l1,	%o2,	%o7
	for	%f24,	%f20,	%f20
	addccc	%g7,	0x1981,	%o0
	fbl	%fcc2,	loop_251
	movgu	%icc,	%g4,	%l6
	fors	%f18,	%f23,	%f9
	movge	%icc,	%g5,	%l4
loop_251:
	tsubcctv	%i3,	%i5,	%o3
	movrgz	%g2,	%l3,	%i1
	brlez,a	%g1,	loop_252
	fcmpgt16	%f18,	%f6,	%o1
	movrgez	%i0,	%o5,	%o6
	sdiv	%i7,	0x1B83,	%i6
loop_252:
	fbge	%fcc0,	loop_253
	movrgez	%l2,	%l0,	%i4
	array8	%g3,	%o4,	%i2
	sllx	%l5,	0x00,	%l1
loop_253:
	fnot2	%f14,	%f8
	fcmpeq32	%f30,	%f12,	%g6
	set	0x64, %o1
	ldswa	[%l7 + %o1] 0x18,	%o2
	fmovrdlez	%o7,	%f18,	%f8
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
	ld	[%l7 + 0x1C],	%f5
	fbl,a	%fcc3,	loop_255
	orncc	%o0,	0x08CF,	%g7
loop_254:
	edge8n	%l6,	%g4,	%l4
	prefetch	[%l7 + 0x54],	 0x2
loop_255:
	sdivcc	%g5,	0x0B58,	%i3
	fbg	%fcc0,	loop_256
	fpadd16s	%f29,	%f31,	%f1
	tsubcctv	%o3,	%i5,	%g2
	set	0x6C, %g4
	ldsha	[%l7 + %g4] 0x04,	%i1
loop_256:
	fmovrslez	%l3,	%f8,	%f17
	fmovsneg	%xcc,	%f5,	%f2
	udivx	%o1,	0x0EA8,	%g1
	and	%o5,	0x0CC6,	%o6
	tge	%xcc,	0x3
	xor	%i0,	0x1464,	%i7
	nop
	setx loop_257, %l0, %l1
	jmpl %l1, %l2
	bleu,pt	%xcc,	loop_258
	movne	%icc,	%i6,	%i4
	tsubcctv	%g3,	%o4,	%i2
loop_257:
	edge8	%l0,	%l5,	%g6
loop_258:
	orcc	%l1,	0x1005,	%o7
	array32	%o0,	%g7,	%o2
	bn,a	%xcc,	loop_259
	tg	%icc,	0x4
	fmovda	%xcc,	%f27,	%f23
	mulscc	%l6,	0x15B1,	%g4
loop_259:
	sub	%g5,	%i3,	%o3
	set	0x28, %g1
	sta	%f6,	[%l7 + %g1] 0x18
	tl	%xcc,	0x1
	popc	0x13DB,	%l4
	or	%i5,	0x0303,	%g2
	te	%xcc,	0x3
	andcc	%l3,	%o1,	%g1
	tn	%xcc,	0x6
	edge8l	%o5,	%o6,	%i1
	fpadd16	%f6,	%f16,	%f10
	sub	%i0,	0x03A5,	%i7
	mulscc	%l2,	%i4,	%g3
	fandnot1s	%f17,	%f25,	%f19
	edge32n	%i6,	%i2,	%l0
	umulcc	%l5,	%g6,	%l1
	srlx	%o7,	%o4,	%o0
	and	%o2,	%g7,	%g4
	tvc	%xcc,	0x2
	fsrc1s	%f13,	%f6
	nop
	set	0x30, %i2
	stw	%l6,	[%l7 + %i2]
	fnors	%f15,	%f24,	%f0
	tne	%icc,	0x6
	stx	%i3,	[%l7 + 0x70]
	fmovrdlez	%o3,	%f20,	%f8
	fblg,a	%fcc2,	loop_260
	stx	%g5,	[%l7 + 0x28]
	array32	%i5,	%g2,	%l3
	fbu	%fcc2,	loop_261
loop_260:
	andcc	%l4,	0x0E6C,	%g1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
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
loop_261:
	fmovrsgz	%o5,	%f16,	%f18
	or	%o6,	0x1F6E,	%i1
	umulcc	%i0,	%i7,	%l2
loop_262:
	andncc	%i4,	%o1,	%g3
	array32	%i6,	%l0,	%l5
	set	0x4A, %i3
	ldsha	[%l7 + %i3] 0x11,	%g6
	fmovd	%f6,	%f30
	fbg,a	%fcc0,	loop_263
	bleu,a,pt	%xcc,	loop_264
	fbul	%fcc3,	loop_265
	fmovsge	%icc,	%f16,	%f13
loop_263:
	nop
	wr	%g0,	0x80,	%asi
	lduba	[%l7 + 0x12] %asi,	%l1
loop_264:
	fblg,a	%fcc1,	loop_266
loop_265:
	popc	%i2,	%o4
	fbu,a	%fcc1,	loop_267
	fcmpne16	%f14,	%f4,	%o7
loop_266:
	xnorcc	%o2,	0x05A4,	%g7
	taddcc	%o0,	0x14A9,	%g4
loop_267:
	udiv	%i3,	0x01BB,	%l6
	tge	%xcc,	0x2
	udivx	%o3,	0x0C1E,	%g5
	fbug,a	%fcc2,	loop_268
	movgu	%xcc,	%i5,	%g2
	fcmple16	%f26,	%f6,	%l3
	prefetch	[%l7 + 0x44],	 0x3
loop_268:
	fbg	%fcc3,	loop_269
	movrne	%l4,	%o5,	%o6
	add	%l7,	0x30,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] %asi,	%g1,	%i0
loop_269:
	nop
	set	0x40, %o0
	stda	%f0,	[%l7 + %o0] 0x0c
	fbue,a	%fcc2,	loop_270
	call	loop_271
	fmovde	%xcc,	%f16,	%f8
	sra	%i7,	0x0A,	%l2
loop_270:
	tleu	%icc,	0x2
loop_271:
	tgu	%xcc,	0x2
	movrgz	%i4,	0x2E4,	%o1
	taddcctv	%g3,	%i6,	%l0
	ta	%icc,	0x4
	array16	%l5,	%i1,	%g6
	fnot2	%f18,	%f24
	set	0x48, %i6
	swapa	[%l7 + %i6] 0x19,	%i2
	taddcctv	%o4,	%l1,	%o7
	movrgez	%g7,	%o0,	%g4
	fnands	%f17,	%f21,	%f27
	fba	%fcc2,	loop_272
	sdivx	%o2,	0x0D3D,	%l6
	st	%f30,	[%l7 + 0x10]
	tle	%xcc,	0x2
loop_272:
	sub	%o3,	0x1B5A,	%i3
	fmuld8sux16	%f2,	%f4,	%f0
	addcc	%i5,	%g5,	%l3
	set	0x60, %o5
	lduha	[%l7 + %o5] 0x04,	%g2
	tn	%icc,	0x7
	bpos,pn	%xcc,	loop_273
	tne	%xcc,	0x6
	fnot2	%f2,	%f16
	movne	%icc,	%l4,	%o5
loop_273:
	ldd	[%l7 + 0x20],	%f16
	fpadd32	%f24,	%f18,	%f6
	fbug	%fcc1,	loop_274
	fcmpne16	%f16,	%f16,	%o6
	movge	%xcc,	%g1,	%i7
	te	%icc,	0x7
loop_274:
	sub	%i0,	%l2,	%i4
	srlx	%g3,	%o1,	%i6
	tcc	%icc,	0x0
	fnot1	%f0,	%f0
	array16	%l5,	%l0,	%g6
	smulcc	%i1,	%o4,	%i2
	mulx	%o7,	0x02C9,	%l1
	movvc	%icc,	%o0,	%g4
	fmovsl	%icc,	%f28,	%f28
	te	%xcc,	0x3
	faligndata	%f6,	%f22,	%f26
	set	0x28, %g5
	sta	%f1,	[%l7 + %g5] 0x04
	fandnot1s	%f17,	%f4,	%f25
	fabsd	%f16,	%f24
	subc	%g7,	%o2,	%l6
	ldsw	[%l7 + 0x64],	%i3
	mulx	%i5,	0x1828,	%o3
	sub	%g5,	%g2,	%l4
	fmovrdlz	%o5,	%f6,	%f6
	orcc	%o6,	0x1B39,	%g1
	fmovrslz	%i7,	%f1,	%f15
	fble,a	%fcc0,	loop_275
	fmul8x16	%f29,	%f6,	%f0
	mova	%xcc,	%l3,	%i0
	fpack32	%f24,	%f12,	%f6
loop_275:
	fbug,a	%fcc2,	loop_276
	srlx	%i4,	0x05,	%l2
	flush	%l7 + 0x58
	orn	%o1,	%g3,	%l5
loop_276:
	alignaddrl	%i6,	%g6,	%i1
	fmovspos	%icc,	%f31,	%f12
	movpos	%xcc,	%l0,	%o4
	fmovdn	%xcc,	%f5,	%f16
	tsubcctv	%i2,	0x0A56,	%o7
	edge8	%o0,	%l1,	%g4
	fmovrslz	%o2,	%f23,	%f12
	taddcctv	%l6,	%i3,	%i5
	orn	%g7,	%o3,	%g5
	fcmpgt16	%f28,	%f4,	%l4
	xor	%o5,	%g2,	%g1
	lduw	[%l7 + 0x38],	%o6
	bg,pt	%xcc,	loop_277
	fcmped	%fcc1,	%f12,	%f14
	movneg	%xcc,	%i7,	%i0
	fbn,a	%fcc2,	loop_278
loop_277:
	srax	%l3,	0x09,	%l2
	fbug	%fcc3,	loop_279
	xorcc	%i4,	0x1CDD,	%o1
loop_278:
	bg,pn	%xcc,	loop_280
	edge8n	%l5,	%i6,	%g3
loop_279:
	fblg	%fcc2,	loop_281
	edge32n	%i1,	%g6,	%l0
loop_280:
	fbue,a	%fcc2,	loop_282
	tpos	%xcc,	0x1
loop_281:
	array32	%i2,	%o7,	%o0
	bl,a,pt	%icc,	loop_283
loop_282:
	fsrc1	%f30,	%f6
	fcmpeq16	%f24,	%f12,	%o4
	movpos	%xcc,	%g4,	%l1
loop_283:
	prefetch	[%l7 + 0x34],	 0x3
	movg	%icc,	%o2,	%l6
	movge	%icc,	%i3,	%i5
	fmovrslez	%g7,	%f14,	%f7
	fmovdg	%icc,	%f11,	%f27
	wr	%g0,	0x89,	%asi
	prefetcha	[%l7 + 0x08] %asi,	 0x0
	smulcc	%l4,	%g5,	%o5
	fmovsgu	%icc,	%f4,	%f16
	fcmpgt32	%f12,	%f14,	%g1
	tsubcc	%g2,	%i7,	%o6
	fba	%fcc1,	loop_284
	brlez,a	%i0,	loop_285
	fandnot2	%f12,	%f0,	%f2
	andncc	%l3,	%l2,	%i4
loop_284:
	bvc,a,pn	%xcc,	loop_286
loop_285:
	edge8ln	%l5,	%i6,	%o1
	siam	0x4
	edge32l	%i1,	%g3,	%l0
loop_286:
	movrlz	%i2,	0x316,	%o7
	array32	%o0,	%o4,	%g4
	stb	%g6,	[%l7 + 0x6B]
	array8	%l1,	%l6,	%i3
	edge16l	%i5,	%g7,	%o2
	set	0x18, %l2
	stxa	%o3,	[%l7 + %l2] 0x2a
	membar	#Sync
	umul	%g5,	%o5,	%l4
	tg	%xcc,	0x6
	srax	%g2,	0x19,	%i7
	alignaddrl	%o6,	%g1,	%l3
	edge8l	%i0,	%l2,	%i4
	sra	%i6,	0x18,	%l5
	ba,a,pn	%xcc,	loop_287
	prefetch	[%l7 + 0x14],	 0x3
	nop
	setx loop_288, %l0, %l1
	jmpl %l1, %i1
	sdivcc	%g3,	0x1C84,	%l0
loop_287:
	ldsw	[%l7 + 0x18],	%i2
	fbge,a	%fcc0,	loop_289
loop_288:
	alignaddrl	%o1,	%o0,	%o4
	umul	%g4,	0x164E,	%o7
	fmovrdlz	%l1,	%f6,	%f6
loop_289:
	movvc	%xcc,	%l6,	%g6
	movre	%i3,	%i5,	%g7
	fnor	%f14,	%f16,	%f22
	bl,a,pn	%xcc,	loop_290
	fmul8x16al	%f28,	%f7,	%f26
	fsrc1	%f0,	%f14
	sra	%o2,	0x07,	%o3
loop_290:
	ldstub	[%l7 + 0x2E],	%o5
	addcc	%g5,	0x0F01,	%g2
	ld	[%l7 + 0x48],	%f13
	edge8ln	%l4,	%o6,	%g1
	sdivcc	%l3,	0x152A,	%i7
	fbug	%fcc2,	loop_291
	subc	%l2,	%i0,	%i6
	nop
	setx	loop_292,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	sdiv	%i4,	0x1DDA,	%i1
loop_291:
	brnz,a	%l5,	loop_293
	ldub	[%l7 + 0x36],	%g3
loop_292:
	tvc	%xcc,	0x5
	ldx	[%l7 + 0x28],	%i2
loop_293:
	udivx	%l0,	0x023C,	%o0
	tge	%xcc,	0x0
	movn	%icc,	%o1,	%g4
	tle	%xcc,	0x6
	edge8n	%o7,	%o4,	%l1
	fmovsvs	%icc,	%f11,	%f9
	andncc	%l6,	%i3,	%i5
	fmovrslez	%g7,	%f27,	%f29
	fmovde	%icc,	%f24,	%f0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16n	%o2,	%o3,	%g6
	tcs	%xcc,	0x0
	movvs	%xcc,	%o5,	%g5
	edge8ln	%g2,	%o6,	%l4
	brz	%l3,	loop_294
	bvc,a	%xcc,	loop_295
	fbule,a	%fcc3,	loop_296
	nop
	set	0x15, %g2
	stb	%g1,	[%l7 + %g2]
loop_294:
	fmovrsgz	%i7,	%f28,	%f16
loop_295:
	edge8l	%l2,	%i6,	%i4
loop_296:
	fandnot2	%f2,	%f24,	%f2
	wr	%g0,	0x18,	%asi
	sta	%f11,	[%l7 + 0x20] %asi
	movcs	%icc,	%i1,	%l5
	move	%icc,	%i0,	%g3
	fba	%fcc3,	loop_297
	movrlz	%i2,	%l0,	%o0
	membar	0x65
	tvc	%xcc,	0x0
loop_297:
	brz,a	%g4,	loop_298
	nop
	set	0x20, %l1
	ldx	[%l7 + %l1],	%o1
	fornot1s	%f2,	%f7,	%f26
	edge8	%o4,	%o7,	%l1
loop_298:
	fbule	%fcc3,	loop_299
	flush	%l7 + 0x78
	sethi	0x1D8B,	%l6
	fpsub32	%f12,	%f0,	%f28
loop_299:
	tpos	%icc,	0x5
	andcc	%i5,	%i3,	%g7
	andcc	%o2,	0x1729,	%g6
	nop
	set	0x1E, %g3
	sth	%o5,	[%l7 + %g3]
	fmovsg	%xcc,	%f9,	%f9
	fbn	%fcc2,	loop_300
	fxor	%f14,	%f8,	%f10
	movpos	%icc,	%o3,	%g5
	movrlez	%g2,	0x3DB,	%o6
loop_300:
	fmovdl	%icc,	%f13,	%f11
	movpos	%xcc,	%l4,	%g1
	orncc	%l3,	%i7,	%l2
	move	%xcc,	%i6,	%i1
	membar	#Sync
	set	0x40, %i4
	ldda	[%l7 + %i4] 0xf0,	%f16
	andn	%l5,	%i0,	%g3
	set	0x72, %o7
	ldstuba	[%l7 + %o7] 0x81,	%i2
	orcc	%l0,	%i4,	%o0
	movneg	%xcc,	%g4,	%o1
	wr	%g0,	0xf9,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
	taddcctv	%o4,	%o7,	%l1
	fble,a	%fcc3,	loop_301
	movvs	%icc,	%l6,	%i3
	fmovse	%icc,	%f16,	%f17
	movg	%icc,	%i5,	%g7
loop_301:
	te	%xcc,	0x5
	tpos	%xcc,	0x0
	sllx	%o2,	%g6,	%o3
	movrlz	%g5,	%o5,	%o6
	fbn	%fcc3,	loop_302
	ldx	[%l7 + 0x48],	%l4
	tvs	%xcc,	0x3
	addc	%g2,	%g1,	%l3
loop_302:
	orncc	%l2,	%i6,	%i1
	fcmpes	%fcc3,	%f21,	%f15
	srl	%i7,	0x14,	%l5
	fnors	%f13,	%f25,	%f0
	smulcc	%g3,	0x1B55,	%i2
	edge32l	%l0,	%i4,	%o0
	edge32ln	%i0,	%o1,	%o4
	orcc	%o7,	0x0090,	%g4
	movleu	%xcc,	%l1,	%l6
	tsubcc	%i5,	%g7,	%o2
	fmovsl	%xcc,	%f25,	%f21
	wr	%g0,	0x11,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	bpos,a,pt	%xcc,	loop_303
	ldstub	[%l7 + 0x13],	%g6
	udivx	%o3,	0x18E5,	%g5
	ta	%xcc,	0x3
loop_303:
	movleu	%xcc,	%o5,	%o6
	subcc	%i3,	%l4,	%g1
	xnor	%l3,	0x171B,	%g2
	tneg	%icc,	0x0
	mulx	%i6,	0x0FEB,	%l2
	fnegs	%f26,	%f9
	bcc,a,pn	%xcc,	loop_304
	st	%f28,	[%l7 + 0x60]
	stw	%i7,	[%l7 + 0x18]
	faligndata	%f2,	%f28,	%f22
loop_304:
	subccc	%i1,	%l5,	%g3
	wr	%g0,	0x0c,	%asi
	ldsha	[%l7 + 0x1C] %asi,	%l0
	fmovrslez	%i2,	%f25,	%f25
	fbuge,a	%fcc0,	loop_305
	bne	%xcc,	loop_306
	tsubcc	%i4,	%i0,	%o0
	brlez	%o4,	loop_307
loop_305:
	st	%f28,	[%l7 + 0x44]
loop_306:
	movcs	%xcc,	%o1,	%g4
	movl	%xcc,	%l1,	%o7
loop_307:
	tge	%icc,	0x4
	fnegd	%f16,	%f4
	movn	%icc,	%l6,	%i5
	wr	%g0,	0x21,	%asi
	ldxa	[%g0 + 0x110] %asi,	%o2
	set	0x64, %l0
	stba	%g7,	[%l7 + %l0] 0x18
	tg	%xcc,	0x6
	stw	%o3,	[%l7 + 0x48]
	add	%l7,	0x0C,	%l6
	wr	%g0,	0x04,	%asi
	casa	[%l6] 0x04,	%g6,	%o5
	fmovdvs	%xcc,	%f20,	%f23
	edge8n	%o6,	%i3,	%g5
	srl	%l4,	0x1B,	%l3
	orcc	%g2,	0x0F50,	%i6
	movrgez	%g1,	%l2,	%i1
	tvc	%icc,	0x4
	fbu,a	%fcc2,	loop_308
	brlz,a	%i7,	loop_309
	nop
	setx loop_310, %l0, %l1
	jmpl %l1, %g3
	fpadd32s	%f30,	%f20,	%f21
loop_308:
	ldstub	[%l7 + 0x33],	%l0
loop_309:
	fbn	%fcc3,	loop_311
loop_310:
	move	%xcc,	%i2,	%i4
	tsubcctv	%l5,	0x0DA8,	%i0
	ble,pt	%icc,	loop_312
loop_311:
	fba,a	%fcc2,	loop_313
	subcc	%o4,	0x0C6F,	%o1
	array32	%g4,	%l1,	%o7
loop_312:
	fmovdvc	%xcc,	%f5,	%f12
loop_313:
	or	%l6,	0x07D4,	%o0
	sethi	0x14D6,	%i5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsneg	%icc,	%f21,	%f11
	taddcc	%o2,	0x06D7,	%g7
	fcmpne32	%f30,	%f28,	%o3
	brgz,a	%o5,	loop_314
	movgu	%icc,	%o6,	%i3
	movneg	%icc,	%g6,	%g5
	edge32n	%l3,	%l4,	%i6
loop_314:
	andcc	%g2,	0x07B2,	%g1
	udivcc	%l2,	0x1AD9,	%i1
	xnor	%i7,	%g3,	%l0
	tneg	%xcc,	0x6
	te	%xcc,	0x5
	alignaddrl	%i4,	%i2,	%l5
	fnot2s	%f21,	%f9
	andncc	%o4,	%o1,	%i0
	fmovrdlez	%l1,	%f26,	%f18
	sub	%g4,	%o7,	%l6
	movne	%icc,	%o0,	%i5
	fpsub32	%f4,	%f24,	%f6
	fxor	%f28,	%f6,	%f4
	edge8ln	%o2,	%g7,	%o3
	subcc	%o6,	%o5,	%i3
	st	%f2,	[%l7 + 0x08]
	fbl,a	%fcc2,	loop_315
	add	%g5,	0x19EF,	%g6
	set	0x68, %l3
	lda	[%l7 + %l3] 0x11,	%f19
loop_315:
	edge16l	%l4,	%i6,	%l3
	movrgz	%g1,	%l2,	%i1
	fcmpeq32	%f6,	%f30,	%i7
	sllx	%g3,	0x14,	%g2
	move	%xcc,	%l0,	%i4
	sdivcc	%i2,	0x1FBC,	%o4
	set	0x70, %g6
	swapa	[%l7 + %g6] 0x89,	%l5
	andcc	%i0,	0x1E18,	%o1
	addcc	%g4,	0x1355,	%l1
	fmovrdgz	%o7,	%f0,	%f30
	smul	%o0,	0x0794,	%l6
	subcc	%o2,	0x10DE,	%i5
	te	%xcc,	0x0
	tvc	%xcc,	0x3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16l	%o3,	%g7,	%o6
	fsrc2	%f18,	%f16
	udivx	%i3,	0x0281,	%o5
	mulx	%g5,	0x0037,	%g6
	membar	0x4E
	ldsb	[%l7 + 0x68],	%i6
	membar	0x01
	movrgez	%l4,	%g1,	%l3
	sdiv	%l2,	0x0E89,	%i1
	movrlez	%i7,	0x096,	%g3
	umul	%l0,	%g2,	%i4
	prefetch	[%l7 + 0x30],	 0x2
	movrlz	%o4,	0x1CB,	%i2
	mova	%xcc,	%i0,	%l5
	fbuge,a	%fcc0,	loop_316
	movcs	%xcc,	%g4,	%o1
	fmovd	%f6,	%f14
	brgz	%o7,	loop_317
loop_316:
	movvs	%icc,	%l1,	%o0
	bshuffle	%f22,	%f18,	%f16
	tl	%xcc,	0x0
loop_317:
	edge16l	%o2,	%i5,	%o3
	te	%icc,	0x7
	tne	%xcc,	0x4
	fcmpgt16	%f22,	%f6,	%g7
	fmovrse	%o6,	%f28,	%f16
	std	%i2,	[%l7 + 0x10]
	movneg	%icc,	%l6,	%o5
	movl	%icc,	%g6,	%g5
	fblg	%fcc3,	loop_318
	movre	%i6,	0x238,	%l4
	udivcc	%g1,	0x0801,	%l2
	ldd	[%l7 + 0x40],	%f22
loop_318:
	fmovs	%f10,	%f18
	fmovsvc	%icc,	%f19,	%f10
	or	%l3,	%i1,	%i7
	fornot1s	%f18,	%f22,	%f0
	tcc	%xcc,	0x2
	array16	%l0,	%g2,	%g3
	fcmpd	%fcc0,	%f22,	%f14
	edge16l	%o4,	%i4,	%i2
	set	0x20, %l4
	ldxa	[%l7 + %l4] 0x04,	%i0
	tneg	%xcc,	0x7
	udiv	%g4,	0x1F11,	%l5
	brlz,a	%o1,	loop_319
	tsubcc	%l1,	%o7,	%o2
	tgu	%icc,	0x5
	movvc	%icc,	%o0,	%i5
loop_319:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udivcc	%o3,	0x0FAA,	%g7
	wr	%g0,	0x18,	%asi
	prefetcha	[%l7 + 0x40] %asi,	 0x2
	edge16l	%i3,	%o5,	%l6
	orcc	%g5,	0x03D7,	%i6
	tne	%icc,	0x6
	ba	loop_320
	tvs	%xcc,	0x7
	fbuge	%fcc3,	loop_321
	tneg	%xcc,	0x5
loop_320:
	edge16l	%l4,	%g6,	%l2
	movpos	%xcc,	%l3,	%g1
loop_321:
	andn	%i1,	%l0,	%g2
	fpsub16s	%f3,	%f18,	%f16
	tvs	%xcc,	0x6
	orcc	%i7,	0x1724,	%o4
	movge	%xcc,	%g3,	%i4
	tsubcctv	%i2,	0x023D,	%g4
	fmovrde	%l5,	%f14,	%f18
	fmovdvs	%xcc,	%f27,	%f2
	sll	%o1,	%i0,	%l1
	edge16ln	%o7,	%o2,	%i5
	stbar
	addcc	%o0,	%g7,	%o6
	edge8l	%i3,	%o5,	%o3
	ldsh	[%l7 + 0x5E],	%l6
	wr	%g0,	0x22,	%asi
	stba	%g5,	[%l7 + 0x1A] %asi
	membar	#Sync
	fmovrsne	%l4,	%f7,	%f5
	tsubcctv	%i6,	0x00B8,	%l2
	sdivcc	%l3,	0x1197,	%g1
	mulscc	%g6,	0x0559,	%l0
	fbo	%fcc1,	loop_322
	tle	%xcc,	0x5
	tl	%xcc,	0x2
	edge16ln	%i1,	%i7,	%o4
loop_322:
	edge32ln	%g3,	%g2,	%i4
	movl	%xcc,	%i2,	%l5
	set	0x64, %o4
	swapa	[%l7 + %o4] 0x0c,	%o1
	tne	%xcc,	0x0
	edge16n	%g4,	%l1,	%o7
	tsubcc	%i0,	%i5,	%o0
	movcs	%icc,	%g7,	%o6
	xorcc	%o2,	0x1DF1,	%i3
	bcc,pt	%icc,	loop_323
	subcc	%o3,	%o5,	%g5
	wr	%g0,	0x19,	%asi
	ldswa	[%l7 + 0x5C] %asi,	%l4
loop_323:
	add	%l6,	0x0A48,	%l2
	sub	%i6,	%l3,	%g6
	fbue	%fcc0,	loop_324
	movleu	%xcc,	%g1,	%i1
	sdivx	%l0,	0x0781,	%i7
	fmovsgu	%icc,	%f3,	%f27
loop_324:
	fpmerge	%f30,	%f31,	%f20
	addc	%o4,	0x1441,	%g3
	bl,pt	%icc,	loop_325
	membar	0x47
	fpadd32s	%f8,	%f0,	%f16
	edge8ln	%i4,	%g2,	%l5
loop_325:
	movrgz	%o1,	0x3FB,	%g4
	sub	%l1,	%i2,	%i0
	set	0x40, %o6
	lda	[%l7 + %o6] 0x15,	%f15
	tl	%icc,	0x0
	mulx	%o7,	%o0,	%i5
	and	%g7,	%o6,	%o2
	set	0x20, %o2
	ldxa	[%l7 + %o2] 0x0c,	%o3
	andcc	%o5,	%i3,	%l4
	siam	0x4
	mulscc	%g5,	0x0799,	%l2
	sth	%l6,	[%l7 + 0x4C]
	taddcc	%l3,	%g6,	%i6
	fmovrslz	%g1,	%f4,	%f30
	movrgez	%l0,	%i7,	%i1
	bgu	loop_326
	brz	%o4,	loop_327
	movge	%icc,	%g3,	%g2
	set	0x78, %i1
	prefetcha	[%l7 + %i1] 0x15,	 0x3
loop_326:
	stx	%o1,	[%l7 + 0x30]
loop_327:
	edge8	%i4,	%g4,	%i2
	fmovrdlz	%i0,	%f2,	%f0
	taddcc	%o7,	0x1B3A,	%l1
	ldsh	[%l7 + 0x34],	%i5
	tsubcc	%o0,	0x1A7E,	%o6
	edge8l	%o2,	%g7,	%o3
	sir	0x1A89
	sub	%i3,	%l4,	%g5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srax	%l2,	%l6,	%o5
	ldx	[%l7 + 0x58],	%g6
	movvc	%xcc,	%l3,	%g1
	fmovsa	%icc,	%f0,	%f4
	movrgez	%i6,	%l0,	%i1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movne	%xcc,	%o4,	%g3
	fbuge	%fcc1,	loop_328
	ld	[%l7 + 0x2C],	%f25
	mova	%xcc,	%i7,	%l5
	smulcc	%g2,	0x0BD3,	%i4
loop_328:
	bl,a	%xcc,	loop_329
	fmovd	%f20,	%f6
	addccc	%g4,	%i2,	%i0
	srl	%o7,	0x04,	%o1
loop_329:
	membar	0x4E
	udivcc	%l1,	0x0D33,	%o0
	fmovde	%icc,	%f24,	%f21
	andncc	%o6,	%i5,	%g7
	movpos	%icc,	%o2,	%o3
	mova	%xcc,	%l4,	%i3
	edge32	%l2,	%g5,	%l6
	fbue	%fcc3,	loop_330
	bgu,a	loop_331
	sethi	0x07CD,	%g6
	fpack32	%f14,	%f8,	%f0
loop_330:
	nop
	add	%l7,	0x5C,	%l6
	wr	%g0,	0x0c,	%asi
	casa	[%l6] 0x0c,	%l3,	%o5
loop_331:
	flush	%l7 + 0x6C
	wr	%g0,	0x0c,	%asi
	ldsba	[%l7 + 0x78] %asi,	%g1
	mova	%xcc,	%i6,	%l0
	tgu	%icc,	0x7
	subccc	%o4,	%i1,	%i7
	tne	%icc,	0x3
	ldstub	[%l7 + 0x24],	%g3
	tvs	%icc,	0x3
	fcmpd	%fcc2,	%f26,	%f4
	fmovsge	%icc,	%f4,	%f3
	wr	%g0,	0x10,	%asi
	stda	%l4,	[%l7 + 0x70] %asi
	ldd	[%l7 + 0x18],	%f24
	bge,a,pn	%icc,	loop_332
	tgu	%xcc,	0x5
	andcc	%g2,	%i4,	%g4
	fornot1	%f16,	%f14,	%f2
loop_332:
	fmovsgu	%icc,	%f13,	%f8
	bneg,a,pt	%xcc,	loop_333
	ldub	[%l7 + 0x14],	%i2
	edge32ln	%o7,	%o1,	%l1
	edge8ln	%o0,	%i0,	%i5
loop_333:
	ta	%xcc,	0x0
	andcc	%o6,	%g7,	%o3
	mova	%icc,	%o2,	%l4
	sub	%l2,	0x1D98,	%g5
	brgez,a	%l6,	loop_334
	orn	%g6,	0x0834,	%l3
	subc	%i3,	%g1,	%i6
	fbg,a	%fcc1,	loop_335
loop_334:
	fba	%fcc2,	loop_336
	ldsh	[%l7 + 0x16],	%l0
	sethi	0x011F,	%o5
loop_335:
	nop
	add	%l7,	0x24,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%i1,	%i7
loop_336:
	or	%o4,	%g3,	%l5
	srl	%g2,	%g4,	%i4
	tne	%icc,	0x2
	prefetch	[%l7 + 0x18],	 0x2
	movne	%icc,	%i2,	%o7
	ble	loop_337
	orncc	%l1,	%o1,	%i0
	xor	%o0,	0x16C4,	%i5
	fmovsa	%icc,	%f9,	%f9
loop_337:
	ldsb	[%l7 + 0x10],	%o6
	flush	%l7 + 0x60
	tpos	%icc,	0x3
	edge16l	%o3,	%g7,	%l4
	stx	%l2,	[%l7 + 0x38]
	taddcc	%o2,	%g5,	%l6
	stw	%g6,	[%l7 + 0x14]
	bcs,pt	%xcc,	loop_338
	fandnot1s	%f19,	%f6,	%f3
	movneg	%icc,	%l3,	%g1
	fmovdn	%icc,	%f29,	%f23
loop_338:
	nop
	wr	%g0,	0x18,	%asi
	lduwa	[%l7 + 0x3C] %asi,	%i6
	fbne	%fcc2,	loop_339
	brnz,a	%l0,	loop_340
	brgez,a	%o5,	loop_341
	bvc,pt	%icc,	loop_342
loop_339:
	fmovrslz	%i1,	%f4,	%f10
loop_340:
	nop
	set	0x11, %i0
	ldsba	[%l7 + %i0] 0x14,	%i7
loop_341:
	movleu	%xcc,	%i3,	%g3
loop_342:
	tneg	%xcc,	0x5
	set	0x20, %l5
	stda	%o4,	[%l7 + %l5] 0x04
	wr	%g0,	0x22,	%asi
	stda	%g2,	[%l7 + 0x40] %asi
	membar	#Sync
	prefetch	[%l7 + 0x14],	 0x2
	brgez,a	%g4,	loop_343
	tvs	%icc,	0x3
	orn	%l5,	0x0034,	%i2
	fbue,a	%fcc3,	loop_344
loop_343:
	tpos	%icc,	0x7
	movrne	%o7,	%l1,	%o1
	wr	%g0,	0x11,	%asi
	prefetcha	[%l7 + 0x10] %asi,	 0x3
loop_344:
	fxors	%f17,	%f8,	%f26
	movvs	%icc,	%o0,	%i5
	udiv	%i4,	0x081D,	%o3
	tge	%xcc,	0x0
	edge16ln	%o6,	%g7,	%l2
	alignaddr	%l4,	%o2,	%l6
	bcs	%xcc,	loop_345
	udiv	%g6,	0x0266,	%g5
	brlz,a	%l3,	loop_346
	tcc	%icc,	0x6
loop_345:
	subccc	%i6,	0x108B,	%l0
	fmovspos	%icc,	%f7,	%f12
loop_346:
	edge8ln	%o5,	%g1,	%i7
	xnorcc	%i1,	%g3,	%o4
	edge32ln	%g2,	%g4,	%l5
	prefetch	[%l7 + 0x50],	 0x1
	smulcc	%i2,	0x0F08,	%o7
	edge16	%l1,	%i3,	%i0
	fmovsa	%xcc,	%f10,	%f18
	fpsub32	%f26,	%f26,	%f12
	addccc	%o1,	%i5,	%i4
	tneg	%xcc,	0x6
	brgz	%o0,	loop_347
	add	%o3,	0x1886,	%g7
	fxor	%f18,	%f4,	%f30
	fmovscc	%icc,	%f6,	%f1
loop_347:
	nop
	set	0x08, %g7
	ldsba	[%l7 + %g7] 0x11,	%l2
	alignaddr	%o6,	%l4,	%o2
	fmovrsgez	%l6,	%f2,	%f16
	udivcc	%g6,	0x0420,	%l3
	xnorcc	%g5,	0x105A,	%l0
	fmovdl	%icc,	%f25,	%f6
	fcmpd	%fcc2,	%f30,	%f2
	fpsub32s	%f21,	%f8,	%f13
	ble,pn	%icc,	loop_348
	tpos	%xcc,	0x4
	bvc,pn	%xcc,	loop_349
	tg	%icc,	0x3
loop_348:
	udivcc	%i6,	0x146F,	%g1
	st	%f31,	[%l7 + 0x34]
loop_349:
	fone	%f20
	movn	%icc,	%o5,	%i1
	xor	%g3,	%o4,	%i7
	xnor	%g4,	0x1C5A,	%g2
	brlez	%l5,	loop_350
	andn	%o7,	%i2,	%l1
	movg	%xcc,	%i3,	%i0
	bl,a	%xcc,	loop_351
loop_350:
	bg,a,pt	%icc,	loop_352
	fmul8x16au	%f18,	%f30,	%f20
	ldsb	[%l7 + 0x41],	%o1
loop_351:
	array16	%i5,	%o0,	%o3
loop_352:
	udiv	%i4,	0x1843,	%l2
	edge8	%g7,	%l4,	%o2
	movl	%icc,	%l6,	%o6
	nop
	set	0x4C, %o3
	lduw	[%l7 + %o3],	%g6
	edge16ln	%l3,	%l0,	%g5
	fxor	%f10,	%f8,	%f26
	bg,pt	%icc,	loop_353
	and	%g1,	0x0BF6,	%i6
	array32	%o5,	%g3,	%o4
	umulcc	%i7,	0x0447,	%g4
loop_353:
	array8	%g2,	%i1,	%l5
	edge16n	%i2,	%l1,	%o7
	set	0x37, %l6
	lduba	[%l7 + %l6] 0x04,	%i0
	tl	%icc,	0x2
	subcc	%i3,	%o1,	%o0
	or	%i5,	0x1AAF,	%i4
	brlez,a	%l2,	loop_354
	movrne	%o3,	%l4,	%o2
	tsubcctv	%l6,	0x1363,	%o6
	fzeros	%f21
loop_354:
	sir	0x1D06
	taddcctv	%g6,	%g7,	%l3
	std	%f26,	[%l7 + 0x40]
	andn	%l0,	0x0A6C,	%g5
	edge16l	%i6,	%o5,	%g3
	orcc	%o4,	%i7,	%g4
	fcmpes	%fcc1,	%f10,	%f21
	fmovdleu	%xcc,	%f19,	%f23
	bg,pt	%xcc,	loop_355
	umul	%g2,	0x1EC2,	%g1
	std	%f12,	[%l7 + 0x48]
	fnot1s	%f8,	%f21
loop_355:
	edge16	%i1,	%i2,	%l5
	movrlz	%o7,	0x0FC,	%i0
	sub	%l1,	%i3,	%o1
	sllx	%o0,	%i4,	%i5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	and	%o3,	0x10E5,	%l4
	ld	[%l7 + 0x20],	%f11
	fcmpne32	%f26,	%f2,	%l2
	nop
	set	0x38, %i5
	std	%i6,	[%l7 + %i5]
	subccc	%o6,	%o2,	%g7
	tn	%xcc,	0x1
	swap	[%l7 + 0x4C],	%l3
	array32	%g6,	%g5,	%l0
	fmovrdlez	%o5,	%f28,	%f2
	movrlz	%i6,	%g3,	%o4
	tge	%icc,	0x7
	srl	%i7,	%g4,	%g1
	fone	%f30
	edge16n	%i1,	%i2,	%g2
	orncc	%l5,	%o7,	%l1
	taddcc	%i3,	%o1,	%o0
	movrlz	%i0,	0x0BB,	%i4
	tneg	%icc,	0x3
	xnorcc	%i5,	0x087F,	%o3
	udivcc	%l4,	0x011F,	%l2
	subc	%o6,	%o2,	%g7
	bge,a,pn	%xcc,	loop_356
	ldx	[%l7 + 0x08],	%l6
	subccc	%g6,	0x0D27,	%g5
	fmovrse	%l3,	%f9,	%f27
loop_356:
	fmovdcs	%icc,	%f3,	%f3
	membar	0x41
	orncc	%l0,	%i6,	%g3
	edge16	%o5,	%i7,	%g4
	fpackfix	%f8,	%f19
	andcc	%g1,	%i1,	%o4
	tcc	%xcc,	0x6
	movrgz	%g2,	0x1C7,	%l5
	brlez	%o7,	loop_357
	fmovsl	%xcc,	%f24,	%f5
	add	%l7,	0x0C,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%l1
	casa	[%l6] 0x81,	%l1,	%i2
loop_357:
	tne	%xcc,	0x2
	mulscc	%i3,	0x1B2B,	%o0
	movleu	%icc,	%i0,	%o1
	and	%i5,	0x11BA,	%i4
	tleu	%xcc,	0x6
	movvc	%xcc,	%o3,	%l2
	addcc	%l4,	0x1E30,	%o6
	fabsd	%f24,	%f6
	wr	%g0,	0x18,	%asi
	sta	%f5,	[%l7 + 0x60] %asi
	addc	%g7,	%l6,	%o2
	bl,a	loop_358
	fbge	%fcc2,	loop_359
	udiv	%g5,	0x0402,	%g6
	fmovdne	%xcc,	%f2,	%f14
loop_358:
	udiv	%l0,	0x0E15,	%l3
loop_359:
	tneg	%icc,	0x1
	tcs	%icc,	0x3
	or	%g3,	%o5,	%i6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmul8x16	%f25,	%f12,	%f28
	edge16	%i7,	%g1,	%i1
	tsubcc	%g4,	0x0587,	%g2
	ta	%xcc,	0x6
	fornot1	%f24,	%f14,	%f10
	array32	%l5,	%o4,	%o7
	udivx	%l1,	0x0410,	%i2
	fbue	%fcc2,	loop_360
	array16	%i3,	%i0,	%o0
	movrne	%o1,	%i4,	%o3
	srl	%l2,	%i5,	%o6
loop_360:
	taddcctv	%l4,	%g7,	%o2
	orn	%g5,	0x13F7,	%g6
	edge32	%l0,	%l3,	%l6
	fmul8ulx16	%f10,	%f12,	%f12
	bge,pn	%xcc,	loop_361
	fpmerge	%f27,	%f1,	%f26
	mulscc	%o5,	%i6,	%i7
	movpos	%icc,	%g1,	%g3
loop_361:
	te	%xcc,	0x1
	add	%g4,	%i1,	%g2
	fbo,a	%fcc1,	loop_362
	movrlez	%o4,	0x193,	%o7
	fmovrdlez	%l5,	%f12,	%f0
	edge16	%i2,	%i3,	%i0
loop_362:
	sra	%l1,	0x01,	%o0
	fandnot1s	%f9,	%f0,	%f14
	fpackfix	%f8,	%f5
	fmovscs	%icc,	%f6,	%f13
	add	%l7,	0x08,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] %asi,	%i4,	%o1
	popc	0x1274,	%l2
	fmovrslez	%i5,	%f31,	%f19
	sdivcc	%o3,	0x151B,	%l4
	orcc	%g7,	%o2,	%g5
	or	%o6,	0x1A44,	%l0
	smulcc	%g6,	%l6,	%l3
	tsubcctv	%o5,	%i7,	%g1
	fandnot2	%f16,	%f12,	%f24
	xnor	%i6,	%g3,	%i1
	fnors	%f17,	%f19,	%f19
	bgu,a,pt	%xcc,	loop_363
	fble	%fcc1,	loop_364
	fble	%fcc1,	loop_365
	tvs	%icc,	0x4
loop_363:
	pdist	%f20,	%f16,	%f16
loop_364:
	sir	0x0720
loop_365:
	fbug	%fcc3,	loop_366
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tn	%xcc,	0x5
	movleu	%xcc,	%g4,	%g2
loop_366:
	smulcc	%o7,	0x0AD8,	%o4
	fcmpeq16	%f16,	%f0,	%l5
	movcc	%icc,	%i2,	%i0
	subccc	%l1,	0x1EB5,	%o0
	sll	%i3,	%o1,	%l2
	bne	loop_367
	xorcc	%i5,	0x1D49,	%i4
	tleu	%icc,	0x5
	fmovdn	%xcc,	%f18,	%f20
loop_367:
	fnands	%f4,	%f8,	%f29
	srlx	%l4,	0x14,	%o3
	srlx	%o2,	%g5,	%g7
	movpos	%icc,	%l0,	%o6
	brgez,a	%g6,	loop_368
	fcmpes	%fcc1,	%f10,	%f7
	edge8l	%l6,	%o5,	%i7
	fnor	%f30,	%f12,	%f26
loop_368:
	tg	%icc,	0x5
	movre	%g1,	%l3,	%g3
	orcc	%i6,	0x1852,	%g4
	tleu	%icc,	0x4
	xnor	%g2,	0x1528,	%i1
	fmovda	%icc,	%f3,	%f3
	fmul8x16al	%f23,	%f20,	%f8
	fpsub16	%f0,	%f8,	%f12
	std	%o6,	[%l7 + 0x48]
	fnand	%f0,	%f2,	%f16
	edge8ln	%l5,	%o4,	%i2
	movge	%xcc,	%l1,	%i0
	fnand	%f12,	%f14,	%f24
	brlez	%o0,	loop_369
	subcc	%i3,	%l2,	%i5
	nop
	setx loop_370, %l0, %l1
	jmpl %l1, %o1
	udivcc	%l4,	0x1AEA,	%i4
loop_369:
	fmovsg	%xcc,	%f12,	%f5
	ldsh	[%l7 + 0x36],	%o3
loop_370:
	sllx	%o2,	%g5,	%g7
	movg	%icc,	%o6,	%g6
	fornot2	%f28,	%f20,	%f22
	bn,a,pn	%icc,	loop_371
	movg	%icc,	%l6,	%o5
	bleu,a,pt	%xcc,	loop_372
	tn	%icc,	0x1
loop_371:
	nop
	set	0x68, %i7
	ldxa	[%l7 + %i7] 0x89,	%l0
loop_372:
	addccc	%g1,	%l3,	%i7
	fones	%f12
	fone	%f0
	tneg	%icc,	0x4
	fmovde	%xcc,	%f10,	%f1
	fand	%f8,	%f24,	%f30
	xnor	%i6,	%g3,	%g4
	membar	0x24
	fmovrdgez	%i1,	%f26,	%f18
	edge8l	%g2,	%o7,	%l5
	array32	%i2,	%o4,	%l1
	movgu	%xcc,	%o0,	%i3
	movl	%xcc,	%l2,	%i0
	fbge,a	%fcc3,	loop_373
	fnot2s	%f8,	%f27
	srl	%i5,	%l4,	%o1
	wr	%g0,	0x80,	%asi
	swapa	[%l7 + 0x14] %asi,	%i4
loop_373:
	fsrc2s	%f16,	%f11
	edge32ln	%o3,	%o2,	%g5
	fmul8x16al	%f12,	%f16,	%f2
	fpadd32s	%f4,	%f20,	%f26
	edge8n	%g7,	%o6,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l7 + 0x38] %asi,	%f20
	fmovscs	%icc,	%f27,	%f24
	fnors	%f7,	%f10,	%f20
	addc	%g6,	%l0,	%o5
	add	%l3,	0x1AD5,	%g1
	fmovse	%icc,	%f6,	%f31
	tne	%icc,	0x0
	edge16l	%i6,	%g3,	%g4
	xor	%i7,	0x1474,	%i1
	movn	%icc,	%o7,	%l5
	andcc	%g2,	%o4,	%l1
	fmovdpos	%icc,	%f20,	%f19
	movcs	%xcc,	%o0,	%i2
	ta	%xcc,	0x4
	faligndata	%f18,	%f16,	%f10
	wr	%g0,	0x88,	%asi
	sta	%f6,	[%l7 + 0x58] %asi
	ldstub	[%l7 + 0x4D],	%i3
	fbg,a	%fcc2,	loop_374
	ba,a,pt	%icc,	loop_375
	xorcc	%i0,	%l2,	%l4
	movn	%icc,	%o1,	%i5
loop_374:
	xnor	%o3,	%o2,	%i4
loop_375:
	tl	%xcc,	0x0
	movleu	%xcc,	%g5,	%g7
	set	0x70, %o1
	ldda	[%l7 + %o1] 0x27,	%o6
	sdivx	%l6,	0x102A,	%g6
	sdiv	%o5,	0x1B1C,	%l0
	fmovrslz	%g1,	%f14,	%f4
	smulcc	%l3,	0x1741,	%g3
	movrlz	%i6,	0x35E,	%g4
	xor	%i1,	%o7,	%i7
	tpos	%icc,	0x5
	set	0x48, %g4
	stxa	%g2,	[%l7 + %g4] 0xea
	membar	#Sync
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmpgt16	%f16,	%f0,	%l5
	stb	%o4,	[%l7 + 0x3A]
	tgu	%xcc,	0x4
	ldsw	[%l7 + 0x74],	%o0
	edge16n	%i2,	%i3,	%i0
	add	%l2,	%l1,	%l4
	mulscc	%o1,	%i5,	%o3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmped	%fcc1,	%f20,	%f0
	bcc,pt	%icc,	loop_376
	fpadd32s	%f19,	%f20,	%f22
	xorcc	%i4,	0x1ECA,	%o2
	fexpand	%f25,	%f2
loop_376:
	mulx	%g5,	0x16D0,	%g7
	edge16n	%o6,	%l6,	%g6
	andncc	%o5,	%g1,	%l0
	fmovdne	%icc,	%f30,	%f18
	fmovsa	%icc,	%f6,	%f23
	subc	%l3,	0x1894,	%g3
	tne	%icc,	0x7
	umulcc	%i6,	0x0915,	%i1
	move	%xcc,	%o7,	%g4
	tgu	%icc,	0x1
	wr	%g0,	0x80,	%asi
	prefetcha	[%l7 + 0x20] %asi,	 0x2
	add	%l5,	0x0935,	%i7
	movcs	%xcc,	%o0,	%i2
	sdivx	%i3,	0x1E54,	%o4
	srl	%l2,	0x15,	%l1
	set	0x74, %i2
	stwa	%i0,	[%l7 + %i2] 0x88
	umul	%l4,	%i5,	%o3
	srlx	%i4,	0x06,	%o2
	tle	%icc,	0x7
	tneg	%icc,	0x2
	fxnor	%f0,	%f6,	%f30
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbn	%fcc0,	loop_377
	fbn	%fcc2,	loop_378
	edge8ln	%o1,	%g7,	%g5
	fcmped	%fcc3,	%f6,	%f14
loop_377:
	tgu	%icc,	0x0
loop_378:
	move	%icc,	%o6,	%g6
	fmovsg	%icc,	%f10,	%f12
	edge16n	%l6,	%g1,	%o5
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
	movvs	%icc,	%l0,	%g3
	bcs	loop_380
	edge16ln	%l3,	%i6,	%o7
loop_379:
	fmovse	%xcc,	%f4,	%f13
	edge32l	%i1,	%g4,	%g2
loop_380:
	sir	0x002B
	fcmps	%fcc3,	%f28,	%f4
	fmovrdlz	%l5,	%f22,	%f18
	movle	%icc,	%o0,	%i2
	udiv	%i3,	0x1726,	%i7
	sethi	0x01F4,	%o4
	movg	%icc,	%l2,	%i0
	edge8l	%l4,	%i5,	%l1
	wr	%g0,	0x19,	%asi
	lduha	[%l7 + 0x16] %asi,	%i4
	fxnors	%f19,	%f5,	%f17
	andcc	%o2,	0x0A89,	%o3
	tl	%xcc,	0x7
	ta	%xcc,	0x3
	movge	%xcc,	%g7,	%o1
	tg	%icc,	0x0
	movg	%xcc,	%g5,	%g6
	wr	%g0,	0x89,	%asi
	lduba	[%l7 + 0x4C] %asi,	%o6
	fmul8x16au	%f2,	%f21,	%f10
	lduw	[%l7 + 0x34],	%l6
	sdiv	%g1,	0x13A0,	%o5
	sir	0x13ED
	movg	%icc,	%l0,	%g3
	fmovda	%icc,	%f3,	%f14
	mulscc	%i6,	%o7,	%i1
	orcc	%l3,	0x1893,	%g2
	bcc	%icc,	loop_381
	fpsub32s	%f6,	%f16,	%f21
	tsubcctv	%l5,	0x12F3,	%o0
	edge32	%i2,	%i3,	%i7
loop_381:
	fmovrse	%g4,	%f30,	%f27
	edge16n	%l2,	%i0,	%l4
	fmovrdgz	%i5,	%f14,	%f18
	subc	%l1,	0x0FDF,	%o4
	move	%icc,	%i4,	%o2
	tneg	%icc,	0x3
	movre	%o3,	0x039,	%g7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fblg	%fcc0,	loop_382
	edge16	%o1,	%g6,	%g5
	edge32l	%o6,	%l6,	%g1
	fmul8x16au	%f23,	%f3,	%f30
loop_382:
	te	%icc,	0x5
	tneg	%icc,	0x1
	sethi	0x1681,	%l0
	sir	0x0C99
	movge	%xcc,	%g3,	%i6
	fcmple16	%f20,	%f8,	%o5
	add	%o7,	0x1C5F,	%i1
	movcs	%icc,	%g2,	%l5
	fzeros	%f14
	fbuge,a	%fcc2,	loop_383
	movl	%icc,	%o0,	%l3
	subccc	%i2,	%i3,	%i7
	fcmpeq16	%f22,	%f6,	%l2
loop_383:
	sdiv	%i0,	0x148F,	%l4
	wr	%g0,	0xf8,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
	fmovrdlz	%i5,	%f26,	%f26
	movl	%xcc,	%l1,	%g4
	tsubcctv	%o4,	%o2,	%i4
	tvs	%icc,	0x3
	fmovrsgz	%o3,	%f21,	%f19
	fzeros	%f29
	fornot1s	%f19,	%f22,	%f13
	tgu	%xcc,	0x5
	subccc	%g7,	%o1,	%g6
	tpos	%xcc,	0x6
	fzero	%f30
	tvs	%icc,	0x6
	move	%icc,	%o6,	%l6
	fmovdgu	%xcc,	%f25,	%f20
	bcs,a	%icc,	loop_384
	fpack16	%f18,	%f29
	bcs,a	loop_385
	orncc	%g1,	0x1927,	%g5
loop_384:
	movvs	%icc,	%l0,	%g3
	bneg,a,pn	%xcc,	loop_386
loop_385:
	bcs	loop_387
	tn	%icc,	0x4
	srlx	%o5,	0x1A,	%o7
loop_386:
	fnors	%f28,	%f17,	%f27
loop_387:
	ldub	[%l7 + 0x79],	%i6
	wr	%g0,	0x11,	%asi
	prefetcha	[%l7 + 0x18] %asi,	 0x3
	tsubcc	%g2,	0x1454,	%l5
	addccc	%l3,	%o0,	%i2
	movre	%i7,	0x0EA,	%i3
	sra	%i0,	0x14,	%l2
	fbuge,a	%fcc3,	loop_388
	subcc	%l4,	0x0B36,	%i5
	udivcc	%g4,	0x0243,	%o4
	tsubcc	%o2,	0x07F9,	%i4
loop_388:
	udivx	%o3,	0x063C,	%l1
	bn,a	%xcc,	loop_389
	brlz	%g7,	loop_390
	fmovdgu	%xcc,	%f7,	%f11
	and	%g6,	%o1,	%o6
loop_389:
	fexpand	%f25,	%f24
loop_390:
	tsubcctv	%g1,	0x10F7,	%l6
	ldstub	[%l7 + 0x59],	%g5
	xorcc	%l0,	0x0F09,	%o5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8n	%o7,	%i6,	%g3
	set	0x0C, %i3
	ldsha	[%l7 + %i3] 0x04,	%g2
	edge8l	%l5,	%l3,	%o0
	fmovsne	%xcc,	%f12,	%f8
	fone	%f18
	srax	%i1,	%i2,	%i3
	sdiv	%i0,	0x0FD9,	%i7
	tn	%xcc,	0x1
	sir	0x08DA
	tsubcc	%l4,	%i5,	%g4
	tcc	%xcc,	0x2
	fmovsvs	%xcc,	%f19,	%f30
	fmovsneg	%xcc,	%f26,	%f17
	wr	%g0,	0x80,	%asi
	lda	[%l7 + 0x30] %asi,	%f20
	array16	%o4,	%l2,	%o2
	udiv	%o3,	0x1567,	%i4
	movrgz	%g7,	0x10B,	%l1
	xorcc	%g6,	0x0908,	%o1
	bleu,a,pt	%icc,	loop_391
	fbn	%fcc1,	loop_392
	tcs	%xcc,	0x1
	movrgz	%g1,	%l6,	%o6
loop_391:
	call	loop_393
loop_392:
	smul	%g5,	0x0004,	%o5
	brnz,a	%o7,	loop_394
	fmovdgu	%xcc,	%f3,	%f3
loop_393:
	mova	%icc,	%i6,	%g3
	movn	%icc,	%l0,	%l5
loop_394:
	bl	loop_395
	ble,a,pn	%xcc,	loop_396
	tn	%xcc,	0x3
	ta	%icc,	0x3
loop_395:
	fmovrdlez	%g2,	%f4,	%f12
loop_396:
	fbu,a	%fcc1,	loop_397
	fmovsvs	%xcc,	%f29,	%f11
	edge8l	%o0,	%l3,	%i1
	tne	%xcc,	0x2
loop_397:
	ble,a,pn	%xcc,	loop_398
	bge,pn	%icc,	loop_399
	fmovdcc	%xcc,	%f4,	%f9
	edge8l	%i2,	%i0,	%i3
loop_398:
	movvs	%xcc,	%l4,	%i7
loop_399:
	nop
	set	0x38, %g1
	sta	%f3,	[%l7 + %g1] 0x81
	xnor	%g4,	0x103F,	%i5
	membar	#Sync
	set	0x40, %o0
	ldda	[%l7 + %o0] 0xf9,	%f0
	movgu	%icc,	%o4,	%l2
	set	0x64, %o5
	lduha	[%l7 + %o5] 0x0c,	%o3
	orncc	%i4,	0x0DA3,	%g7
	bcc,a	loop_400
	te	%icc,	0x3
	fpackfix	%f26,	%f30
	nop
	set	0x2C, %g5
	lduw	[%l7 + %g5],	%l1
loop_400:
	fmovsvc	%icc,	%f14,	%f31
	orncc	%o2,	0x0FBD,	%o1
	movne	%xcc,	%g1,	%l6
	edge32	%o6,	%g5,	%g6
	sllx	%o5,	%i6,	%g3
	tvc	%xcc,	0x2
	andn	%o7,	0x1BD0,	%l0
	sdiv	%l5,	0x0066,	%o0
	sdivx	%l3,	0x18E8,	%i1
	ldstub	[%l7 + 0x32],	%g2
	movge	%xcc,	%i0,	%i3
	nop
	setx loop_401, %l0, %l1
	jmpl %l1, %i2
	be	%xcc,	loop_402
	fmovdleu	%xcc,	%f6,	%f16
	wr	%g0,	0x89,	%asi
	lduba	[%l7 + 0x28] %asi,	%l4
loop_401:
	smul	%g4,	0x12DB,	%i7
loop_402:
	fmovsvc	%xcc,	%f31,	%f22
	fone	%f12
	brlez,a	%o4,	loop_403
	edge16	%l2,	%i5,	%o3
	fpmerge	%f5,	%f0,	%f4
	prefetch	[%l7 + 0x40],	 0x3
loop_403:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbge	%fcc0,	loop_404
	edge32n	%i4,	%l1,	%g7
	movneg	%icc,	%o2,	%o1
	wr	%g0,	0x19,	%asi
	ldstuba	[%l7 + 0x3A] %asi,	%l6
loop_404:
	xor	%o6,	0x11EE,	%g5
	fornot1	%f20,	%f22,	%f14
	tn	%icc,	0x3
	movrlez	%g1,	%g6,	%o5
	fmovdneg	%xcc,	%f31,	%f2
	st	%f28,	[%l7 + 0x08]
	fbug	%fcc3,	loop_405
	taddcctv	%i6,	%o7,	%l0
	move	%icc,	%l5,	%g3
	array32	%o0,	%l3,	%g2
loop_405:
	fcmpgt32	%f18,	%f18,	%i0
	udivx	%i3,	0x083E,	%i1
	fpadd32s	%f13,	%f15,	%f19
	addcc	%i2,	0x13E6,	%l4
	tvc	%icc,	0x3
	movvc	%xcc,	%g4,	%i7
	fabss	%f7,	%f16
	fnot2s	%f27,	%f2
	movn	%xcc,	%o4,	%i5
	orncc	%o3,	0x0757,	%l2
	edge8	%i4,	%l1,	%o2
	array8	%o1,	%l6,	%g7
	sllx	%g5,	%o6,	%g1
	fandnot2	%f12,	%f26,	%f28
	xorcc	%g6,	0x0BEC,	%i6
	fbg	%fcc0,	loop_406
	movneg	%icc,	%o5,	%o7
	edge8	%l0,	%g3,	%l5
	xorcc	%l3,	%o0,	%g2
loop_406:
	sethi	0x1633,	%i0
	add	%l7,	0x3C,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%i1,	%i2
	subcc	%l4,	0x1D81,	%g4
	popc	0x0EE4,	%i7
	membar	0x6A
	fbe,a	%fcc0,	loop_407
	subc	%o4,	0x1FB9,	%i5
	sra	%i3,	%o3,	%i4
	membar	0x54
loop_407:
	nop
	wr	%g0,	0x04,	%asi
	ldda	[%l7 + 0x70] %asi,	%l0
	ba,a	loop_408
	movleu	%xcc,	%o2,	%o1
	and	%l6,	0x0EAD,	%l2
	movcs	%xcc,	%g5,	%g7
loop_408:
	sdivcc	%g1,	0x18BA,	%g6
	faligndata	%f14,	%f28,	%f28
	edge16ln	%o6,	%o5,	%o7
	addc	%i6,	0x072A,	%g3
	mulscc	%l0,	%l3,	%l5
	srlx	%o0,	0x05,	%i0
	fnot1	%f6,	%f8
	fcmpne16	%f16,	%f18,	%g2
	ldsb	[%l7 + 0x29],	%i2
	nop
	set	0x74, %i6
	ldsh	[%l7 + %i6],	%l4
	movleu	%icc,	%g4,	%i7
	tsubcctv	%o4,	%i5,	%i1
	fmovdle	%icc,	%f15,	%f10
	fcmpgt32	%f30,	%f18,	%o3
	fmovsg	%xcc,	%f1,	%f22
	fbn,a	%fcc3,	loop_409
	tneg	%icc,	0x3
	faligndata	%f16,	%f4,	%f6
	fsrc1s	%f0,	%f4
loop_409:
	tl	%icc,	0x2
	brlz	%i4,	loop_410
	fcmpeq16	%f0,	%f6,	%i3
	fbo	%fcc1,	loop_411
	umul	%l1,	0x1426,	%o2
loop_410:
	xorcc	%o1,	0x0B01,	%l2
	fnands	%f23,	%f12,	%f18
loop_411:
	fand	%f22,	%f18,	%f2
	stbar
	movleu	%xcc,	%l6,	%g5
	fpadd32	%f8,	%f4,	%f6
	fandnot2	%f26,	%f24,	%f10
	movleu	%xcc,	%g7,	%g1
	fmovsa	%xcc,	%f12,	%f14
	srlx	%o6,	0x07,	%g6
	brlez,a	%o5,	loop_412
	sir	0x1EC5
	tcs	%icc,	0x1
	nop
	set	0x58, %g2
	std	%f18,	[%l7 + %g2]
loop_412:
	edge16l	%o7,	%g3,	%l0
	sir	0x16B9
	stw	%l3,	[%l7 + 0x1C]
	smul	%i6,	0x1758,	%l5
	tsubcc	%i0,	%o0,	%i2
	fcmps	%fcc1,	%f30,	%f29
	fmovsgu	%xcc,	%f25,	%f19
	xnor	%g2,	%g4,	%l4
	movrlez	%o4,	%i5,	%i1
	andn	%i7,	0x10DF,	%o3
	fmul8x16	%f27,	%f0,	%f14
	alignaddrl	%i4,	%l1,	%i3
	fbg	%fcc0,	loop_413
	sir	0x03DC
	edge32	%o1,	%l2,	%o2
	edge32n	%l6,	%g5,	%g1
loop_413:
	fcmpne32	%f10,	%f0,	%g7
	orn	%g6,	%o6,	%o5
	umulcc	%o7,	0x1044,	%l0
	subcc	%l3,	0x103F,	%g3
	tge	%icc,	0x1
	edge32ln	%l5,	%i6,	%i0
	edge16n	%i2,	%g2,	%o0
	fone	%f2
	bne,a	%icc,	loop_414
	brlez,a	%g4,	loop_415
	fmovsg	%xcc,	%f8,	%f3
	edge16ln	%o4,	%i5,	%l4
loop_414:
	edge32l	%i7,	%i1,	%i4
loop_415:
	fpsub16s	%f23,	%f23,	%f22
	fmul8x16	%f15,	%f2,	%f20
	movrgez	%o3,	0x3F5,	%l1
	fcmpne32	%f12,	%f18,	%o1
	srlx	%i3,	%l2,	%l6
	fpadd16s	%f31,	%f22,	%f12
	fzeros	%f17
	movcs	%icc,	%g5,	%g1
	tl	%icc,	0x2
	sllx	%o2,	0x19,	%g6
	fnot1	%f4,	%f0
	fmovdneg	%xcc,	%f12,	%f2
	fnegs	%f25,	%f11
	orcc	%o6,	0x1644,	%g7
	fpadd16s	%f26,	%f11,	%f27
	ta	%icc,	0x4
	fnors	%f12,	%f8,	%f31
	edge32l	%o7,	%o5,	%l3
	fbe	%fcc1,	loop_416
	smulcc	%l0,	%g3,	%l5
	movleu	%icc,	%i6,	%i2
	fmovsge	%icc,	%f17,	%f10
loop_416:
	mulscc	%i0,	0x01EB,	%o0
	sub	%g4,	%g2,	%o4
	tl	%icc,	0x7
	andncc	%l4,	%i5,	%i7
	tgu	%xcc,	0x0
	movrgz	%i4,	0x326,	%o3
	nop
	setx	loop_417,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fmovsl	%xcc,	%f6,	%f11
	movrlez	%l1,	0x36D,	%o1
	nop
	set	0x4E, %l2
	ldsh	[%l7 + %l2],	%i3
loop_417:
	popc	%l2,	%i1
	edge16ln	%g5,	%g1,	%o2
	nop
	set	0x20, %g3
	std	%f8,	[%l7 + %g3]
	fpsub32s	%f10,	%f16,	%f13
	movne	%xcc,	%g6,	%l6
	mulscc	%g7,	%o7,	%o6
	fbu	%fcc0,	loop_418
	tsubcctv	%l3,	0x0F67,	%o5
	membar	0x20
	tvs	%xcc,	0x2
loop_418:
	movrlez	%l0,	0x3BA,	%l5
	fmovde	%icc,	%f21,	%f11
	orcc	%i6,	0x106F,	%i2
	tle	%icc,	0x6
	sdivcc	%g3,	0x0581,	%o0
	fcmpgt32	%f12,	%f22,	%i0
	umulcc	%g2,	%o4,	%l4
	move	%icc,	%i5,	%g4
	udivx	%i4,	0x11F8,	%o3
	brgez,a	%l1,	loop_419
	andn	%i7,	%i3,	%l2
	tcs	%xcc,	0x3
	sethi	0x1FFF,	%o1
loop_419:
	sub	%i1,	0x053D,	%g1
	array16	%g5,	%g6,	%o2
	fpadd32	%f2,	%f30,	%f6
	movcc	%icc,	%g7,	%l6
	addcc	%o6,	0x1552,	%o7
	sll	%o5,	0x10,	%l0
	stbar
	sdivcc	%l3,	0x1494,	%i6
	tvc	%icc,	0x3
	tcc	%icc,	0x0
	lduw	[%l7 + 0x7C],	%i2
	tsubcctv	%g3,	0x0076,	%l5
	movl	%icc,	%o0,	%g2
	brgez,a	%o4,	loop_420
	edge32	%l4,	%i0,	%g4
	fmovrdgez	%i4,	%f0,	%f4
	movrlez	%o3,	%l1,	%i5
loop_420:
	nop
	set	0x3C, %l1
	ldsw	[%l7 + %l1],	%i3
	xorcc	%i7,	%l2,	%o1
	tleu	%xcc,	0x0
	fpackfix	%f26,	%f11
	andncc	%g1,	%i1,	%g5
	array8	%o2,	%g6,	%l6
	orn	%o6,	%o7,	%g7
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
	movg	%icc,	%l0,	%o5
	fcmped	%fcc0,	%f10,	%f16
	srax	%i6,	%i2,	%l3
loop_421:
	fnands	%f13,	%f31,	%f13
	tge	%icc,	0x4
	tne	%icc,	0x6
	udivcc	%g3,	0x1C60,	%l5
	fbue	%fcc1,	loop_422
	fba,a	%fcc3,	loop_423
	fand	%f30,	%f26,	%f0
	sdiv	%o0,	0x1C2F,	%o4
loop_422:
	sll	%l4,	%i0,	%g2
loop_423:
	edge8ln	%i4,	%g4,	%o3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array16	%l1,	%i3,	%i5
	fandnot1	%f0,	%f30,	%f12
	bpos,a	%xcc,	loop_424
	fbne	%fcc3,	loop_425
	edge8l	%i7,	%o1,	%g1
	sra	%i1,	0x02,	%g5
loop_424:
	movpos	%xcc,	%o2,	%g6
loop_425:
	umul	%l2,	%l6,	%o6
	edge8	%g7,	%o7,	%l0
	tle	%xcc,	0x0
	xor	%i6,	%o5,	%l3
	fnot2s	%f1,	%f19
	edge8l	%i2,	%g3,	%o0
	edge8	%l5,	%o4,	%i0
	edge32	%g2,	%i4,	%l4
	addc	%g4,	%l1,	%i3
	brnz,a	%i5,	loop_426
	sub	%i7,	0x0D2D,	%o3
	tle	%xcc,	0x0
	udivx	%o1,	0x14EA,	%g1
loop_426:
	bge	loop_427
	srl	%i1,	%g5,	%g6
	edge16n	%o2,	%l6,	%o6
	ba,a	loop_428
loop_427:
	tpos	%xcc,	0x4
	brlez	%l2,	loop_429
	edge8ln	%o7,	%g7,	%i6
loop_428:
	addccc	%l0,	0x175F,	%l3
	xnor	%o5,	%g3,	%i2
loop_429:
	fmuld8ulx16	%f5,	%f0,	%f2
	movneg	%icc,	%o0,	%l5
	movpos	%xcc,	%o4,	%g2
	set	0x34, %i4
	lduwa	[%l7 + %i4] 0x19,	%i0
	ldstub	[%l7 + 0x50],	%i4
	smul	%g4,	%l1,	%i3
	movrgez	%i5,	0x173,	%l4
	xnorcc	%i7,	%o3,	%g1
	taddcc	%i1,	0x0954,	%g5
	movrgz	%o1,	%g6,	%o2
	swap	[%l7 + 0x14],	%l6
	tge	%xcc,	0x0
	xnor	%l2,	%o7,	%g7
	movvs	%xcc,	%i6,	%l0
	fmovrse	%o6,	%f25,	%f24
	popc	%l3,	%o5
	set	0x40, %o7
	stda	%f16,	[%l7 + %o7] 0x19
	fbo	%fcc3,	loop_430
	tvc	%xcc,	0x0
	nop
	setx loop_431, %l0, %l1
	jmpl %l1, %g3
	brlz	%o0,	loop_432
loop_430:
	tn	%icc,	0x1
	edge32	%i2,	%l5,	%o4
loop_431:
	movvs	%xcc,	%i0,	%g2
loop_432:
	siam	0x1
	wr	%g0,	0xf8,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
	tpos	%icc,	0x6
	tsubcctv	%i4,	0x1D43,	%l1
	movge	%icc,	%g4,	%i5
	bn,a,pt	%icc,	loop_433
	andn	%i3,	0x0BEA,	%l4
	add	%l7,	0x20,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%o3
	casxa	[%l6] 0x88,	%o3,	%g1
loop_433:
	fmovrsgez	%i7,	%f29,	%f17
	bcs,pn	%xcc,	loop_434
	tcs	%icc,	0x4
	nop
	set	0x78, %l0
	std	%f30,	[%l7 + %l0]
	nop
	setx loop_435, %l0, %l1
	jmpl %l1, %g5
loop_434:
	edge16	%o1,	%i1,	%g6
	nop
	setx	loop_436,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tcc	%icc,	0x5
loop_435:
	array16	%l6,	%l2,	%o7
	fpack32	%f22,	%f8,	%f4
loop_436:
	edge32	%o2,	%i6,	%l0
	edge16ln	%o6,	%g7,	%o5
	srl	%l3,	0x14,	%g3
	edge32n	%o0,	%i2,	%o4
	wr	%g0,	0x89,	%asi
	ldswa	[%l7 + 0x74] %asi,	%l5
	set	0x40, %l3
	stda	%f16,	[%l7 + %l3] 0x16
	membar	#Sync
	andncc	%i0,	%i4,	%l1
	fbo	%fcc1,	loop_437
	fblg,a	%fcc3,	loop_438
	fmovdgu	%xcc,	%f5,	%f16
	mulscc	%g4,	%i5,	%i3
loop_437:
	tne	%xcc,	0x6
loop_438:
	umul	%g2,	%l4,	%o3
	st	%f29,	[%l7 + 0x58]
	ldub	[%l7 + 0x25],	%i7
	fbne	%fcc1,	loop_439
	edge32l	%g5,	%o1,	%g1
	tsubcctv	%g6,	0x118B,	%l6
	movgu	%xcc,	%i1,	%o7
loop_439:
	brgez	%o2,	loop_440
	move	%icc,	%l2,	%l0
	std	%f4,	[%l7 + 0x58]
	call	loop_441
loop_440:
	fmul8sux16	%f26,	%f0,	%f14
	brgez	%o6,	loop_442
	fbl	%fcc2,	loop_443
loop_441:
	fandnot1s	%f7,	%f1,	%f7
	umul	%i6,	%o5,	%l3
loop_442:
	andn	%g3,	%g7,	%i2
loop_443:
	tcs	%icc,	0x3
	tvs	%icc,	0x5
	tle	%xcc,	0x2
	wr	%g0,	0x27,	%asi
	stba	%o0,	[%l7 + 0x2D] %asi
	membar	#Sync
	sdivx	%o4,	0x0E1A,	%i0
	nop
	set	0x70, %l4
	stw	%l5,	[%l7 + %l4]
	taddcc	%i4,	%l1,	%g4
	add	%l7,	0x28,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%i3,	%i5
	andcc	%g2,	%l4,	%o3
	wr	%g0,	0x88,	%asi
	stba	%g5,	[%l7 + 0x76] %asi
	brlz,a	%o1,	loop_444
	tsubcc	%i7,	0x0E07,	%g6
	sub	%l6,	0x0A54,	%g1
	fbl,a	%fcc1,	loop_445
loop_444:
	fmovrsgez	%o7,	%f21,	%f12
	brgez	%i1,	loop_446
	edge8ln	%o2,	%l2,	%l0
loop_445:
	fbug	%fcc2,	loop_447
	fnot2s	%f10,	%f29
loop_446:
	tpos	%xcc,	0x4
	movl	%xcc,	%o6,	%i6
loop_447:
	bcc	loop_448
	fmovrsgz	%o5,	%f13,	%f24
	andcc	%g3,	%l3,	%i2
	tle	%icc,	0x3
loop_448:
	fmovrse	%g7,	%f5,	%f11
	fnot1	%f14,	%f26
	fmovrdlz	%o0,	%f20,	%f20
	fmovdneg	%icc,	%f28,	%f19
	edge32l	%i0,	%l5,	%i4
	subc	%l1,	%g4,	%i3
	fmovde	%icc,	%f16,	%f4
	orncc	%i5,	0x1A83,	%o4
	fbug,a	%fcc1,	loop_449
	movgu	%icc,	%g2,	%o3
	movpos	%icc,	%g5,	%l4
	ldsb	[%l7 + 0x73],	%o1
loop_449:
	sir	0x17DD
	fnands	%f12,	%f11,	%f9
	tsubcctv	%g6,	0x1850,	%l6
	sll	%i7,	0x04,	%g1
	nop
	set	0x6C, %g6
	ldsw	[%l7 + %g6],	%i1
	wr	%g0,	0x80,	%asi
	ldswa	[%l7 + 0x14] %asi,	%o2
	taddcctv	%o7,	%l0,	%l2
	fandnot2	%f30,	%f22,	%f26
	fmovs	%f22,	%f9
	edge16l	%i6,	%o5,	%o6
	bn,a	%icc,	loop_450
	fxor	%f22,	%f6,	%f18
	array32	%g3,	%l3,	%i2
	fbue,a	%fcc2,	loop_451
loop_450:
	brgez,a	%g7,	loop_452
	sdivcc	%i0,	0x011F,	%o0
	edge8ln	%l5,	%l1,	%g4
loop_451:
	membar	0x24
loop_452:
	movn	%icc,	%i4,	%i5
	sdiv	%o4,	0x0F01,	%i3
	bl	%xcc,	loop_453
	alignaddr	%o3,	%g2,	%g5
	tleu	%icc,	0x5
	movvc	%icc,	%o1,	%l4
loop_453:
	srlx	%l6,	0x1E,	%g6
	movleu	%xcc,	%g1,	%i1
	fmovsgu	%xcc,	%f16,	%f4
	faligndata	%f2,	%f12,	%f18
	subcc	%i7,	%o7,	%l0
	umul	%o2,	%l2,	%i6
	movle	%xcc,	%o6,	%g3
	fmovrdlz	%l3,	%f8,	%f18
	addcc	%o5,	%g7,	%i0
	fbue	%fcc3,	loop_454
	movl	%icc,	%o0,	%l5
	fmovdleu	%xcc,	%f6,	%f31
	movrne	%i2,	%l1,	%g4
loop_454:
	fmul8x16al	%f28,	%f7,	%f26
	mulscc	%i5,	0x04BD,	%o4
	ta	%xcc,	0x2
	fone	%f18
	udivcc	%i4,	0x122E,	%o3
	tsubcc	%i3,	0x1F14,	%g5
	ba,pn	%icc,	loop_455
	movrgez	%g2,	%l4,	%l6
	orncc	%o1,	%g6,	%g1
	movle	%icc,	%i1,	%o7
loop_455:
	nop
	wr	%g0,	0x27,	%asi
	stha	%i7,	[%l7 + 0x62] %asi
	membar	#Sync
	movvc	%xcc,	%l0,	%o2
	fmovscc	%icc,	%f21,	%f18
	set	0x38, %o6
	lda	[%l7 + %o6] 0x81,	%f3
	fcmpgt32	%f8,	%f30,	%l2
	ldd	[%l7 + 0x30],	%f12
	fcmpne32	%f16,	%f20,	%i6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8n	%o6,	%g3,	%o5
	fmovd	%f30,	%f8
	wr	%g0,	0x11,	%asi
	ldstuba	[%l7 + 0x42] %asi,	%g7
	subc	%l3,	%o0,	%l5
	fandnot2s	%f3,	%f20,	%f3
	edge16n	%i0,	%i2,	%g4
	xnorcc	%l1,	0x036C,	%o4
	array8	%i4,	%o3,	%i3
	edge32	%i5,	%g2,	%l4
	xnor	%g5,	0x13F0,	%o1
	popc	%g6,	%l6
	and	%g1,	0x0B34,	%o7
	fbue	%fcc2,	loop_456
	tcc	%icc,	0x6
	brz,a	%i7,	loop_457
	fcmpeq16	%f20,	%f0,	%l0
loop_456:
	ta	%icc,	0x5
	movneg	%icc,	%o2,	%i1
loop_457:
	tvs	%icc,	0x2
	movvc	%xcc,	%i6,	%o6
	lduw	[%l7 + 0x50],	%l2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrlz	%g3,	%g7,	%o5
	taddcc	%l3,	0x0543,	%l5
	bshuffle	%f4,	%f2,	%f28
	edge8n	%o0,	%i2,	%i0
	fmovrdlez	%g4,	%f8,	%f16
	wr	%g0,	0x2b,	%asi
	stxa	%o4,	[%l7 + 0x28] %asi
	membar	#Sync
	fand	%f22,	%f6,	%f18
	addcc	%i4,	0x0414,	%o3
	orcc	%i3,	%i5,	%l1
	taddcctv	%g2,	0x09E3,	%l4
	fcmpeq32	%f10,	%f18,	%o1
	bgu	loop_458
	and	%g5,	%g6,	%g1
	ta	%icc,	0x7
	move	%icc,	%o7,	%l6
loop_458:
	nop
	wr	%g0,	0x89,	%asi
	ldxa	[%l7 + 0x68] %asi,	%i7
	andcc	%l0,	0x0053,	%i1
	fcmpd	%fcc2,	%f28,	%f16
	fcmpgt16	%f18,	%f28,	%o2
	sub	%o6,	0x05F7,	%i6
	fands	%f5,	%f2,	%f17
	brgez	%l2,	loop_459
	array32	%g3,	%g7,	%l3
	sethi	0x0946,	%o5
	fsrc2	%f0,	%f0
loop_459:
	xor	%l5,	%i2,	%i0
	fbl	%fcc1,	loop_460
	fmul8x16	%f4,	%f2,	%f16
	sdivcc	%o0,	0x1D41,	%o4
	fpadd32	%f6,	%f28,	%f2
loop_460:
	xnorcc	%i4,	%o3,	%i3
	wr	%g0,	0x80,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	fxnor	%f2,	%f26,	%f12
	call	loop_461
	smul	%i5,	%g4,	%g2
	xnorcc	%l4,	%o1,	%g5
	brnz,a	%l1,	loop_462
loop_461:
	alignaddrl	%g6,	%o7,	%l6
	flush	%l7 + 0x44
	fmul8x16	%f12,	%f18,	%f12
loop_462:
	fmovrde	%g1,	%f6,	%f30
	fbg,a	%fcc1,	loop_463
	alignaddrl	%l0,	%i1,	%o2
	movgu	%xcc,	%o6,	%i6
	fsrc1s	%f22,	%f28
loop_463:
	nop
	wr	%g0,	0x18,	%asi
	lduba	[%l7 + 0x13] %asi,	%l2
	sll	%g3,	0x1F,	%g7
	fbuge,a	%fcc1,	loop_464
	bvc,a,pn	%xcc,	loop_465
	mulscc	%l3,	0x0F2E,	%o5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_464:
	udivx	%i7,	0x18BB,	%l5
loop_465:
	tle	%icc,	0x5
	swap	[%l7 + 0x50],	%i2
	tge	%xcc,	0x4
	tvc	%icc,	0x5
	movleu	%icc,	%o0,	%o4
	fbu,a	%fcc1,	loop_466
	pdist	%f14,	%f12,	%f0
	fble,a	%fcc2,	loop_467
	fmovdpos	%icc,	%f5,	%f22
loop_466:
	nop
	wr	%g0,	0x0c,	%asi
	lduba	[%l7 + 0x4A] %asi,	%i0
loop_467:
	fmovrdgez	%o3,	%f2,	%f4
	edge16n	%i4,	%i3,	%i5
	wr	%g0,	0x18,	%asi
	stha	%g2,	[%l7 + 0x4C] %asi
	udivcc	%l4,	0x07F4,	%o1
	fmovrdgz	%g5,	%f4,	%f20
	orncc	%g4,	0x0637,	%g6
	move	%icc,	%l1,	%l6
	fbne,a	%fcc3,	loop_468
	fnands	%f25,	%f8,	%f15
	fmovdleu	%xcc,	%f13,	%f30
	udiv	%o7,	0x0749,	%l0
loop_468:
	fmovs	%f29,	%f19
	fnor	%f8,	%f2,	%f0
	umul	%i1,	%o2,	%g1
	addccc	%o6,	%l2,	%g3
	and	%g7,	0x1D9C,	%l3
	srlx	%i6,	0x12,	%i7
	movleu	%xcc,	%l5,	%o5
	udivcc	%o0,	0x1253,	%o4
	andncc	%i2,	%i0,	%i4
	fbue,a	%fcc1,	loop_469
	tle	%icc,	0x7
	wr	%g0,	0x88,	%asi
	ldsha	[%l7 + 0x7A] %asi,	%o3
loop_469:
	edge32	%i5,	%i3,	%g2
	orn	%l4,	%o1,	%g5
	movvc	%icc,	%g6,	%l1
	edge32l	%l6,	%o7,	%g4
	edge32ln	%i1,	%l0,	%o2
	srlx	%g1,	%o6,	%g3
	movn	%xcc,	%l2,	%g7
	fmovrslz	%i6,	%f29,	%f24
	movvs	%xcc,	%i7,	%l3
	sir	0x0D88
	fmovrdgz	%l5,	%f26,	%f12
	fbge	%fcc1,	loop_470
	alignaddr	%o5,	%o4,	%i2
	fmovrdlez	%o0,	%f30,	%f26
	orn	%i0,	0x090E,	%i4
loop_470:
	fmul8x16	%f2,	%f10,	%f26
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddrl	%i5,	%o3,	%i3
	sdivx	%g2,	0x1CCE,	%l4
	sllx	%g5,	%o1,	%l1
	umul	%l6,	0x14EC,	%o7
	brgz	%g4,	loop_471
	sdivx	%g6,	0x0CDF,	%l0
	for	%f24,	%f24,	%f18
	andcc	%i1,	%o2,	%o6
loop_471:
	ble	loop_472
	nop
	setx	loop_473,	%l0,	%l1
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
	edge32n	%g1,	%g3,	%g7
loop_472:
	fornot2s	%f11,	%f6,	%f11
loop_473:
	sdivcc	%l2,	0x1FA7,	%i7
	bn	%xcc,	loop_474
	mulx	%i6,	%l5,	%o5
	sub	%o4,	0x0567,	%l3
	sdivx	%i2,	0x1A87,	%o0
loop_474:
	subc	%i4,	%i5,	%i0
	fpadd16	%f30,	%f0,	%f12
	fones	%f23
	umul	%i3,	0x075B,	%o3
	ldd	[%l7 + 0x70],	%l4
	mova	%icc,	%g5,	%o1
	add	%g2,	%l6,	%o7
	fbule,a	%fcc0,	loop_475
	edge32n	%l1,	%g6,	%l0
	std	%g4,	[%l7 + 0x60]
	and	%i1,	%o6,	%g1
loop_475:
	tvc	%icc,	0x1
	fpsub32	%f10,	%f6,	%f4
	taddcc	%g3,	0x1114,	%o2
	movcs	%icc,	%l2,	%i7
	or	%g7,	0x1C17,	%l5
	sth	%i6,	[%l7 + 0x78]
	membar	0x23
	std	%o4,	[%l7 + 0x18]
	movrlez	%o4,	%l3,	%o0
	fexpand	%f1,	%f12
	wr	%g0,	0x81,	%asi
	stba	%i4,	[%l7 + 0x14] %asi
	move	%xcc,	%i5,	%i0
	fmul8x16al	%f2,	%f14,	%f12
	edge32n	%i3,	%o3,	%i2
	nop
	set	0x4C, %o2
	ldsw	[%l7 + %o2],	%l4
	mulx	%g5,	%o1,	%l6
	addccc	%g2,	%o7,	%l1
	udiv	%g6,	0x0A23,	%l0
	tne	%xcc,	0x6
	wr	%g0,	0x2b,	%asi
	stba	%g4,	[%l7 + 0x30] %asi
	membar	#Sync
	fpsub32	%f0,	%f28,	%f16
	fcmpeq16	%f16,	%f4,	%o6
	fmovsvs	%icc,	%f23,	%f29
	subccc	%i1,	0x0BD2,	%g1
	and	%g3,	%o2,	%i7
	tleu	%icc,	0x2
	mova	%xcc,	%g7,	%l5
	ldd	[%l7 + 0x70],	%i6
	set	0x18, %o4
	prefetcha	[%l7 + %o4] 0x14,	 0x3
	tvc	%xcc,	0x2
	sethi	0x1C31,	%o4
	lduh	[%l7 + 0x40],	%l3
	smulcc	%o5,	0x19EF,	%i4
	fmul8sux16	%f14,	%f16,	%f8
	edge32ln	%o0,	%i0,	%i3
	movl	%icc,	%i5,	%i2
	fmovsn	%xcc,	%f24,	%f22
	fbul	%fcc2,	loop_476
	popc	%o3,	%l4
	ble,a,pt	%icc,	loop_477
	udivx	%g5,	0x0467,	%o1
loop_476:
	tneg	%xcc,	0x6
	udivcc	%g2,	0x0328,	%o7
loop_477:
	movle	%xcc,	%l6,	%g6
	sub	%l0,	0x13A7,	%l1
	fand	%f12,	%f22,	%f2
	alignaddrl	%g4,	%i1,	%o6
	fandnot2	%f6,	%f24,	%f14
	xnorcc	%g3,	%o2,	%i7
	umulcc	%g7,	0x18BF,	%l5
	fmul8ulx16	%f14,	%f30,	%f20
	edge8ln	%g1,	%l2,	%o4
	fpadd32	%f6,	%f20,	%f24
	popc	0x00C5,	%l3
	fmovspos	%icc,	%f25,	%f25
	edge16	%o5,	%i6,	%o0
	addccc	%i4,	0x150F,	%i3
	array16	%i5,	%i0,	%o3
	edge16n	%i2,	%g5,	%o1
	ldsw	[%l7 + 0x14],	%g2
	tge	%icc,	0x2
	sth	%l4,	[%l7 + 0x4A]
	orncc	%o7,	0x05E6,	%l6
	fcmpgt32	%f8,	%f12,	%l0
	call	loop_478
	umul	%g6,	0x1AE5,	%g4
	movrlez	%l1,	%i1,	%o6
	edge32n	%g3,	%i7,	%o2
loop_478:
	umulcc	%g7,	0x038E,	%l5
	edge32	%g1,	%o4,	%l2
	edge32n	%l3,	%o5,	%o0
	subcc	%i4,	%i3,	%i6
	fmovdcc	%xcc,	%f29,	%f31
	movvc	%icc,	%i5,	%o3
	edge16n	%i0,	%g5,	%o1
	movleu	%xcc,	%i2,	%l4
	andn	%o7,	%g2,	%l0
	movrlz	%l6,	%g6,	%l1
	tn	%icc,	0x0
	tgu	%icc,	0x1
	wr	%g0,	0x0c,	%asi
	sta	%f30,	[%l7 + 0x74] %asi
	fbn,a	%fcc0,	loop_479
	taddcctv	%i1,	%o6,	%g3
	fxnor	%f16,	%f28,	%f20
	bl	%xcc,	loop_480
loop_479:
	call	loop_481
	fmovdg	%xcc,	%f2,	%f6
	array32	%i7,	%g4,	%o2
loop_480:
	edge8	%g7,	%g1,	%o4
loop_481:
	fbug	%fcc3,	loop_482
	subcc	%l5,	%l3,	%o5
	tcs	%icc,	0x1
	add	%o0,	%i4,	%i3
loop_482:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovse	%xcc,	%f16,	%f30
	srl	%i6,	0x01,	%i5
	nop
	setx	loop_483,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	tn	%xcc,	0x5
	sra	%l2,	0x18,	%o3
	fabsd	%f0,	%f18
loop_483:
	smulcc	%i0,	0x1A82,	%g5
	sdiv	%o1,	0x03AD,	%l4
	call	loop_484
	fnegs	%f14,	%f22
	flush	%l7 + 0x0C
	fmovscs	%xcc,	%f15,	%f18
loop_484:
	alignaddrl	%i2,	%g2,	%o7
	popc	%l0,	%g6
	wr	%g0,	0x89,	%asi
	sta	%f0,	[%l7 + 0x44] %asi
	fpadd16s	%f31,	%f20,	%f20
	ta	%xcc,	0x0
	srax	%l6,	0x09,	%i1
	movrgz	%l1,	0x39E,	%o6
	fmovdvs	%xcc,	%f25,	%f0
	xnorcc	%i7,	0x1555,	%g4
	ldub	[%l7 + 0x5A],	%o2
	fmovdvs	%xcc,	%f16,	%f23
	fbge	%fcc3,	loop_485
	movneg	%xcc,	%g7,	%g3
	add	%g1,	%o4,	%l5
	fmuld8ulx16	%f23,	%f31,	%f28
loop_485:
	fsrc1s	%f13,	%f14
	udivx	%o5,	0x00C5,	%l3
	bg,a,pn	%xcc,	loop_486
	tgu	%xcc,	0x0
	fones	%f3
	movcs	%xcc,	%i4,	%o0
loop_486:
	fpsub32	%f24,	%f8,	%f22
	fone	%f12
	tcc	%icc,	0x2
	sdivcc	%i6,	0x087F,	%i3
	andcc	%i5,	%o3,	%l2
	movg	%xcc,	%g5,	%i0
	tleu	%xcc,	0x7
	edge16	%l4,	%o1,	%i2
	sdivcc	%g2,	0x0A82,	%o7
	wr	%g0,	0x10,	%asi
	ldsha	[%l7 + 0x7C] %asi,	%g6
	addccc	%l0,	%i1,	%l1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stx	%l6,	[%l7 + 0x18]
	bvs,pt	%icc,	loop_487
	ldx	[%l7 + 0x48],	%i7
	bg	loop_488
	tvs	%xcc,	0x3
loop_487:
	xnorcc	%o6,	0x03F3,	%g4
	movvs	%icc,	%g7,	%g3
loop_488:
	array16	%o2,	%o4,	%g1
	subccc	%o5,	%l3,	%i4
	or	%o0,	%l5,	%i6
	bpos,a	%icc,	loop_489
	movrne	%i5,	0x0C5,	%o3
	fmovdne	%xcc,	%f25,	%f15
	taddcctv	%i3,	%g5,	%i0
loop_489:
	membar	0x45
	edge16ln	%l2,	%o1,	%i2
	fmovsle	%icc,	%f8,	%f18
	fbug,a	%fcc2,	loop_490
	movrgez	%l4,	0x2F8,	%g2
	fbg,a	%fcc3,	loop_491
	addcc	%g6,	%o7,	%l0
loop_490:
	edge32	%l1,	%i1,	%i7
	edge8ln	%l6,	%o6,	%g4
loop_491:
	sdivx	%g3,	0x1AC1,	%o2
	lduh	[%l7 + 0x4C],	%g7
	movre	%o4,	%g1,	%o5
	ta	%xcc,	0x6
	tcs	%icc,	0x0
	andn	%l3,	0x056C,	%i4
	bshuffle	%f6,	%f8,	%f16
	orncc	%l5,	%o0,	%i6
	fba,a	%fcc3,	loop_492
	tle	%icc,	0x1
	fnot2s	%f11,	%f1
	fmovsg	%xcc,	%f25,	%f8
loop_492:
	movcc	%xcc,	%i5,	%i3
	fands	%f20,	%f21,	%f12
	call	loop_493
	brgez	%o3,	loop_494
	edge32	%g5,	%i0,	%l2
	fzeros	%f24
loop_493:
	andn	%i2,	0x1DE7,	%l4
loop_494:
	xnorcc	%g2,	0x1516,	%o1
	sdivx	%g6,	0x0355,	%o7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpackfix	%f4,	%f7
	move	%xcc,	%l0,	%i1
	srax	%i7,	0x04,	%l1
	bpos,a	%xcc,	loop_495
	flush	%l7 + 0x14
	set	0x60, %i1
	ldxa	[%l7 + %i1] 0x81,	%l6
loop_495:
	subccc	%g4,	%o6,	%o2
	edge16l	%g7,	%g3,	%g1
	tle	%icc,	0x5
	movn	%xcc,	%o4,	%l3
	move	%icc,	%i4,	%l5
	fbn	%fcc2,	loop_496
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x04,	%asi
	stxa	%o0,	[%l7 + 0x18] %asi
loop_496:
	edge16n	%i6,	%i5,	%o5
	wr	%g0,	0x5f,	%asi
	stxa	%i3,	[%g0 + 0x0] %asi
	edge32l	%g5,	%o3,	%l2
	pdist	%f0,	%f10,	%f14
	sra	%i0,	%i2,	%g2
	sub	%l4,	%g6,	%o7
	tneg	%icc,	0x5
	umul	%o1,	0x04B2,	%l0
	fmovsl	%icc,	%f11,	%f22
	fbuge	%fcc3,	loop_497
	fexpand	%f12,	%f4
	andcc	%i7,	0x1B81,	%l1
	st	%f19,	[%l7 + 0x34]
loop_497:
	movne	%icc,	%l6,	%i1
	array16	%o6,	%g4,	%g7
	sir	0x1DC3
	tle	%xcc,	0x4
	sdiv	%g3,	0x001E,	%o2
	fcmpgt16	%f20,	%f8,	%g1
	tn	%xcc,	0x5
	edge16n	%l3,	%o4,	%l5
	fpadd16s	%f29,	%f20,	%f20
	stbar
	movvs	%icc,	%o0,	%i6
	xnor	%i5,	%o5,	%i4
	tvc	%xcc,	0x2
	edge32	%i3,	%g5,	%l2
	subc	%i0,	%i2,	%g2
	fmovs	%f6,	%f17
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	setx	loop_498,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fblg,a	%fcc0,	loop_499
	ldx	[%l7 + 0x60],	%o3
	sub	%g6,	%l4,	%o7
loop_498:
	movn	%icc,	%l0,	%i7
loop_499:
	sdiv	%o1,	0x0539,	%l6
	sir	0x1D54
	fcmpd	%fcc0,	%f22,	%f2
	fmovrdne	%l1,	%f16,	%f20
	bleu,pn	%xcc,	loop_500
	sdivx	%o6,	0x17BE,	%i1
	mulscc	%g7,	%g3,	%g4
	tsubcc	%g1,	%o2,	%o4
loop_500:
	fmovsne	%icc,	%f4,	%f24
	set	0x40, %i0
	stwa	%l5,	[%l7 + %i0] 0x2b
	membar	#Sync
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movvc	%icc,	%l3,	%i6
	movrne	%i5,	0x0D5,	%o5
	tn	%xcc,	0x6
	fornot2s	%f27,	%f20,	%f3
	bneg	%xcc,	loop_501
	tcs	%icc,	0x2
	srax	%o0,	0x00,	%i4
	tvc	%icc,	0x3
loop_501:
	movcs	%xcc,	%i3,	%l2
	sdivx	%i0,	0x0C16,	%g5
	fbne	%fcc0,	loop_502
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x40, %g7
	ldsba	[%l7 + %g7] 0x18,	%g2
loop_502:
	nop
	set	0x20, %l5
	lduwa	[%l7 + %l5] 0x14,	%o3
	fmovrdlez	%g6,	%f16,	%f28
	be,a	loop_503
	edge32ln	%i2,	%o7,	%l0
	tleu	%xcc,	0x4
	std	%l4,	[%l7 + 0x78]
loop_503:
	add	%o1,	0x142E,	%i7
	orncc	%l6,	%l1,	%i1
	fmuld8ulx16	%f3,	%f7,	%f6
	subcc	%g7,	%o6,	%g4
	brgez,a	%g1,	loop_504
	fornot1s	%f20,	%f23,	%f0
	addc	%o2,	0x12F7,	%g3
	fornot2s	%f23,	%f27,	%f16
loop_504:
	addcc	%l5,	%l3,	%o4
	bshuffle	%f24,	%f10,	%f26
	sth	%i6,	[%l7 + 0x68]
	xorcc	%o5,	%i5,	%i4
	addccc	%o0,	0x1CEA,	%i3
	taddcc	%i0,	0x088B,	%g5
	fbuge	%fcc0,	loop_505
	faligndata	%f16,	%f30,	%f20
	movne	%xcc,	%l2,	%o3
	addccc	%g6,	0x0B1D,	%g2
loop_505:
	movvc	%icc,	%i2,	%l0
	fcmpgt32	%f28,	%f8,	%o7
	srlx	%l4,	0x18,	%i7
	xor	%l6,	%l1,	%o1
	fandnot1s	%f18,	%f20,	%f9
	fornot2	%f28,	%f8,	%f0
	brlez	%g7,	loop_506
	smulcc	%o6,	0x0442,	%g4
	array16	%i1,	%o2,	%g1
	fbue	%fcc2,	loop_507
loop_506:
	brgz,a	%l5,	loop_508
	srax	%l3,	0x11,	%g3
	tcc	%xcc,	0x3
loop_507:
	fcmpes	%fcc1,	%f31,	%f29
loop_508:
	ldsw	[%l7 + 0x48],	%i6
	movleu	%xcc,	%o4,	%i5
	taddcc	%o5,	%o0,	%i4
	fand	%f20,	%f20,	%f14
	or	%i0,	%i3,	%l2
	alignaddrl	%o3,	%g5,	%g2
	bge,pt	%icc,	loop_509
	movne	%icc,	%i2,	%g6
	or	%l0,	0x0D3D,	%o7
	movge	%xcc,	%l4,	%l6
loop_509:
	srax	%i7,	0x18,	%o1
	fornot1	%f30,	%f30,	%f24
	fbl,a	%fcc2,	loop_510
	taddcctv	%l1,	0x1109,	%o6
	tne	%xcc,	0x1
	tsubcctv	%g4,	%i1,	%o2
loop_510:
	fornot2s	%f19,	%f9,	%f25
	fmovrdne	%g7,	%f4,	%f8
	movn	%xcc,	%g1,	%l5
	alignaddr	%g3,	%i6,	%o4
	taddcctv	%l3,	%o5,	%o0
	bleu,pt	%xcc,	loop_511
	xor	%i4,	%i5,	%i3
	tsubcc	%i0,	%o3,	%l2
	ldsb	[%l7 + 0x72],	%g5
loop_511:
	orcc	%g2,	%i2,	%g6
	fmovspos	%icc,	%f17,	%f19
	wr	%g0,	0x88,	%asi
	sta	%f7,	[%l7 + 0x0C] %asi
	edge32n	%l0,	%l4,	%o7
	array32	%i7,	%o1,	%l1
	sra	%o6,	%l6,	%i1
	ba,a,pt	%xcc,	loop_512
	fands	%f26,	%f30,	%f28
	fand	%f18,	%f28,	%f20
	fmovsvs	%icc,	%f28,	%f11
loop_512:
	fnegd	%f4,	%f10
	mulscc	%g4,	%o2,	%g7
	call	loop_513
	fsrc1s	%f25,	%f9
	sllx	%l5,	0x1F,	%g3
	fbn	%fcc1,	loop_514
loop_513:
	sdivcc	%i6,	0x0E60,	%g1
	movrne	%l3,	0x119,	%o5
	mulscc	%o0,	%i4,	%i5
loop_514:
	nop
	set	0x40, %o3
	lduwa	[%l7 + %o3] 0x88,	%o4
	fpmerge	%f6,	%f16,	%f2
	udiv	%i3,	0x049A,	%i0
	nop
	setx loop_515, %l0, %l1
	jmpl %l1, %o3
	sll	%g5,	0x12,	%g2
	fnegd	%f22,	%f24
	fbl	%fcc3,	loop_516
loop_515:
	umul	%l2,	%i2,	%g6
	ldd	[%l7 + 0x58],	%f24
	edge32	%l4,	%o7,	%l0
loop_516:
	popc	0x0FDA,	%i7
	movrgz	%l1,	%o1,	%o6
	edge32n	%i1,	%l6,	%o2
	movrlez	%g7,	%g4,	%g3
	umul	%i6,	%g1,	%l5
	fbn	%fcc3,	loop_517
	addc	%l3,	%o5,	%i4
	fbue,a	%fcc1,	loop_518
	movg	%icc,	%i5,	%o4
loop_517:
	movne	%icc,	%i3,	%i0
	taddcctv	%o3,	%g5,	%o0
loop_518:
	nop
	setx	loop_519,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	addc	%l2,	%i2,	%g6
	movgu	%xcc,	%g2,	%o7
	fbu	%fcc2,	loop_520
loop_519:
	sub	%l4,	0x150C,	%i7
	fpadd32	%f6,	%f30,	%f12
	fbo	%fcc1,	loop_521
loop_520:
	movrgez	%l1,	0x0F7,	%l0
	movrlz	%o1,	0x30D,	%o6
	edge8	%l6,	%o2,	%i1
loop_521:
	xor	%g7,	%g3,	%g4
	fmovdl	%xcc,	%f0,	%f6
	movleu	%xcc,	%g1,	%i6
	addc	%l5,	%l3,	%o5
	fmovs	%f22,	%f8
	ldd	[%l7 + 0x18],	%f8
	edge32	%i4,	%i5,	%i3
	mova	%xcc,	%o4,	%i0
	and	%o3,	%g5,	%o0
	ldsh	[%l7 + 0x66],	%l2
	tcc	%icc,	0x2
	sub	%g6,	0x0619,	%g2
	subcc	%i2,	%l4,	%i7
	bne,a,pn	%icc,	loop_522
	andn	%o7,	%l1,	%l0
	addc	%o1,	%o6,	%l6
	array16	%o2,	%i1,	%g7
loop_522:
	mulscc	%g4,	%g1,	%i6
	alignaddr	%l5,	%g3,	%o5
	set	0x28, %l6
	lda	[%l7 + %l6] 0x19,	%f13
	movcc	%icc,	%i4,	%i5
	movl	%icc,	%l3,	%i3
	movrne	%i0,	0x24D,	%o3
	add	%o4,	%g5,	%o0
	edge8	%l2,	%g2,	%i2
	te	%icc,	0x3
	tpos	%icc,	0x1
	fbuge	%fcc1,	loop_523
	fmovrslz	%l4,	%f12,	%f6
	tvc	%icc,	0x5
	tvc	%xcc,	0x7
loop_523:
	fmovdcs	%icc,	%f23,	%f24
	fbug	%fcc3,	loop_524
	ldub	[%l7 + 0x6E],	%g6
	movrgez	%i7,	0x319,	%o7
	alignaddr	%l1,	%l0,	%o6
loop_524:
	sdiv	%o1,	0x0664,	%l6
	orn	%i1,	%o2,	%g4
	pdist	%f0,	%f24,	%f24
	fnand	%f16,	%f6,	%f30
	andn	%g1,	%i6,	%l5
	sra	%g3,	0x03,	%o5
	add	%l7,	0x50,	%l6
	wr	%g0,	0x18,	%asi
	casxa	[%l6] 0x18,	%g7,	%i5
	tle	%xcc,	0x7
	fble,a	%fcc0,	loop_525
	edge8	%l3,	%i4,	%i0
	orn	%o3,	0x1608,	%o4
	fornot2	%f30,	%f0,	%f0
loop_525:
	tcs	%icc,	0x5
	edge16	%i3,	%o0,	%l2
	tpos	%icc,	0x4
	be,pt	%icc,	loop_526
	fnot1s	%f22,	%f31
	movne	%icc,	%g2,	%i2
	lduw	[%l7 + 0x30],	%l4
loop_526:
	srlx	%g5,	0x1E,	%i7
	te	%xcc,	0x5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movvc	%icc,	%g6,	%l1
	wr	%g0,	0x89,	%asi
	lduha	[%l7 + 0x64] %asi,	%l0
	movrlz	%o6,	%o7,	%o1
	membar	0x6C
	sir	0x0B11
	fmovsl	%icc,	%f18,	%f20
	movgu	%xcc,	%l6,	%o2
	movge	%xcc,	%g4,	%g1
	bl	loop_527
	fnand	%f12,	%f28,	%f30
	set	0x08, %i5
	ldswa	[%l7 + %i5] 0x88,	%i6
loop_527:
	tge	%xcc,	0x1
	fmovrdlz	%l5,	%f8,	%f24
	fsrc2s	%f10,	%f23
	lduh	[%l7 + 0x70],	%i1
	ldstub	[%l7 + 0x5D],	%o5
	fbu,a	%fcc3,	loop_528
	sethi	0x1EA2,	%g3
	orcc	%i5,	%l3,	%i4
	flush	%l7 + 0x60
loop_528:
	move	%icc,	%i0,	%o3
	be,a	loop_529
	and	%o4,	0x0D88,	%i3
	wr	%g0,	0x80,	%asi
	lduha	[%l7 + 0x6E] %asi,	%o0
loop_529:
	orncc	%g7,	%g2,	%i2
	movrlz	%l4,	0x360,	%l2
	udivcc	%i7,	0x0A36,	%g5
	addccc	%g6,	0x01C2,	%l0
	movrlez	%o6,	%l1,	%o7
	addc	%l6,	%o2,	%g4
	wr	%g0,	0x89,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	popc	0x0192,	%g1
	andn	%i6,	%o1,	%i1
	array8	%o5,	%g3,	%l5
	movpos	%icc,	%l3,	%i4
	taddcctv	%i5,	%i0,	%o4
	subccc	%i3,	0x184C,	%o0
	fmovrde	%g7,	%f12,	%f14
	alignaddrl	%g2,	%i2,	%l4
	movrne	%o3,	0x00D,	%i7
	orn	%g5,	0x17D4,	%l2
	subc	%g6,	0x0C06,	%o6
	fxor	%f28,	%f16,	%f12
	movre	%l0,	0x1ED,	%o7
	fbe	%fcc2,	loop_530
	array32	%l6,	%l1,	%g4
	add	%o2,	%g1,	%o1
	siam	0x3
loop_530:
	movpos	%icc,	%i1,	%i6
	tsubcc	%g3,	%l5,	%o5
	edge8ln	%l3,	%i4,	%i0
	fmovrsgz	%i5,	%f5,	%f2
	fnegd	%f0,	%f6
	sethi	0x081E,	%i3
	std	%f24,	[%l7 + 0x10]
	wr	%g0,	0x18,	%asi
	lduha	[%l7 + 0x2C] %asi,	%o4
	tge	%xcc,	0x7
	brz,a	%g7,	loop_531
	movcc	%xcc,	%g2,	%i2
	fmovsne	%xcc,	%f13,	%f24
	edge32ln	%o0,	%l4,	%i7
loop_531:
	fbl	%fcc3,	loop_532
	xorcc	%g5,	0x0654,	%l2
	for	%f30,	%f24,	%f18
	std	%g6,	[%l7 + 0x70]
loop_532:
	addcc	%o6,	%o3,	%o7
	movle	%icc,	%l0,	%l6
	tg	%xcc,	0x7
	tcs	%xcc,	0x0
	orcc	%g4,	%o2,	%l1
	movg	%icc,	%o1,	%i1
	andncc	%i6,	%g3,	%g1
	set	0x40, %i7
	ldswa	[%l7 + %i7] 0x89,	%o5
	subccc	%l5,	0x0539,	%i4
	fpmerge	%f14,	%f8,	%f8
	fbge	%fcc0,	loop_533
	fors	%f8,	%f3,	%f9
	fmovdvs	%xcc,	%f6,	%f8
	pdist	%f2,	%f6,	%f14
loop_533:
	sra	%i0,	0x19,	%l3
	lduh	[%l7 + 0x3E],	%i3
	edge8n	%o4,	%i5,	%g7
	or	%i2,	%g2,	%o0
	udivx	%l4,	0x0D49,	%i7
	andcc	%l2,	0x0FCA,	%g6
	array8	%g5,	%o3,	%o7
	tl	%icc,	0x3
	fxnors	%f10,	%f9,	%f19
	nop
	setx	loop_534,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fpadd32	%f24,	%f10,	%f2
	membar	0x5C
	fcmpne16	%f6,	%f12,	%o6
loop_534:
	bneg,a,pt	%icc,	loop_535
	edge32ln	%l0,	%g4,	%l6
	movle	%xcc,	%l1,	%o1
	alignaddr	%i1,	%i6,	%o2
loop_535:
	alignaddrl	%g3,	%g1,	%o5
	movgu	%icc,	%l5,	%i0
	tle	%xcc,	0x1
	bleu,a	%xcc,	loop_536
	fbo,a	%fcc2,	loop_537
	xnor	%l3,	%i3,	%i4
	fcmple16	%f4,	%f2,	%i5
loop_536:
	std	%f28,	[%l7 + 0x10]
loop_537:
	sdiv	%g7,	0x0ACC,	%o4
	for	%f12,	%f14,	%f24
	fbue	%fcc3,	loop_538
	tleu	%icc,	0x0
	fnegs	%f22,	%f1
	fbue	%fcc3,	loop_539
loop_538:
	movn	%icc,	%g2,	%i2
	tn	%xcc,	0x4
	wr	%g0,	0x89,	%asi
	lduba	[%l7 + 0x4E] %asi,	%o0
loop_539:
	fbo	%fcc3,	loop_540
	call	loop_541
	fpsub16	%f18,	%f2,	%f14
	ble,a,pn	%icc,	loop_542
loop_540:
	fands	%f0,	%f17,	%f31
loop_541:
	fmovrdlz	%l4,	%f10,	%f26
	tpos	%icc,	0x0
loop_542:
	fornot1	%f10,	%f26,	%f16
	nop
	setx	loop_543,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	tvc	%icc,	0x0
	set	0x60, %g4
	ldswa	[%l7 + %g4] 0x88,	%i7
loop_543:
	sra	%g6,	%l2,	%g5
	movrlz	%o7,	%o6,	%l0
	bg,pt	%icc,	loop_544
	for	%f10,	%f6,	%f18
	flush	%l7 + 0x60
	fmovdneg	%icc,	%f25,	%f22
loop_544:
	orcc	%g4,	%l6,	%l1
	sdivx	%o1,	0x0055,	%i1
	taddcctv	%i6,	0x1236,	%o3
	alignaddrl	%o2,	%g3,	%g1
	udivx	%o5,	0x0EC9,	%l5
	umul	%i0,	0x187B,	%l3
	fcmped	%fcc2,	%f30,	%f30
	fcmpne16	%f0,	%f10,	%i3
	fbue	%fcc1,	loop_545
	fcmple32	%f16,	%f20,	%i4
	fpack16	%f28,	%f27
	fandnot2	%f0,	%f22,	%f4
loop_545:
	tge	%icc,	0x6
	mulx	%g7,	0x0ECD,	%o4
	fbul,a	%fcc3,	loop_546
	sllx	%i5,	%i2,	%o0
	or	%l4,	0x1289,	%i7
	sdivcc	%g6,	0x1A7A,	%g2
loop_546:
	array32	%g5,	%o7,	%o6
	add	%l7,	0x20,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%l0,	%g4
	fxors	%f1,	%f22,	%f22
	fmul8sux16	%f10,	%f26,	%f26
	movgu	%xcc,	%l6,	%l1
	fands	%f8,	%f23,	%f27
	add	%l7,	0x30,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%l2
	casxa	[%l6] %asi,	%l2,	%o1
	fcmple32	%f2,	%f8,	%i1
	lduw	[%l7 + 0x44],	%o3
	tsubcc	%o2,	0x0791,	%g3
	fcmpgt32	%f16,	%f30,	%i6
	wr	%g0,	0x04,	%asi
	swapa	[%l7 + 0x0C] %asi,	%o5
	fornot2	%f2,	%f24,	%f14
	sdiv	%g1,	0x1843,	%l5
	fmovsneg	%icc,	%f12,	%f14
	fbge,a	%fcc2,	loop_547
	brgz,a	%i0,	loop_548
	fba	%fcc3,	loop_549
	mova	%icc,	%l3,	%i3
loop_547:
	nop
	wr	%g0,	0x04,	%asi
	ldsha	[%l7 + 0x56] %asi,	%i4
loop_548:
	bneg,a	loop_550
loop_549:
	tle	%xcc,	0x6
	edge8	%g7,	%i5,	%o4
	tl	%icc,	0x6
loop_550:
	tg	%xcc,	0x6
	movleu	%xcc,	%o0,	%l4
	movrgez	%i7,	0x101,	%i2
	sub	%g6,	%g5,	%o7
	fone	%f24
	udiv	%g2,	0x029A,	%l0
	add	%l7,	0x48,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%o6
	casxa	[%l6] %asi,	%o6,	%l6
	subcc	%l1,	%l2,	%o1
	alignaddr	%g4,	%i1,	%o2
	subc	%g3,	0x1280,	%i6
	sllx	%o5,	%o3,	%g1
	siam	0x1
	sethi	0x01EF,	%l5
	fcmpne32	%f22,	%f16,	%i0
	andncc	%l3,	%i4,	%g7
	tn	%icc,	0x0
	bg,pt	%icc,	loop_551
	popc	0x0A24,	%i3
	tg	%xcc,	0x3
	fbe,a	%fcc3,	loop_552
loop_551:
	prefetch	[%l7 + 0x7C],	 0x2
	fxnor	%f20,	%f18,	%f4
	movn	%icc,	%o4,	%i5
loop_552:
	te	%icc,	0x7
	sra	%l4,	%o0,	%i7
	fmovspos	%xcc,	%f19,	%f7
	sdiv	%i2,	0x0EA5,	%g6
	fmovsneg	%xcc,	%f12,	%f29
	sdiv	%g5,	0x077B,	%o7
	fones	%f14
	movneg	%icc,	%g2,	%l0
	srlx	%l6,	0x07,	%o6
	movpos	%icc,	%l2,	%o1
	fmovrdlz	%l1,	%f4,	%f2
	fmovsg	%xcc,	%f31,	%f11
	wr	%g0,	0x81,	%asi
	lduha	[%l7 + 0x3E] %asi,	%i1
	edge32l	%o2,	%g3,	%g4
	fornot2	%f26,	%f16,	%f6
	st	%f28,	[%l7 + 0x68]
	sdiv	%i6,	0x1851,	%o3
	nop
	setx loop_553, %l0, %l1
	jmpl %l1, %o5
	fornot2	%f16,	%f6,	%f16
	fcmpeq32	%f24,	%f20,	%g1
	edge16ln	%i0,	%l5,	%l3
loop_553:
	fcmpne16	%f22,	%f10,	%i4
	edge32	%i3,	%g7,	%i5
	fmovdvs	%icc,	%f19,	%f17
	movge	%xcc,	%l4,	%o4
	fmovdneg	%xcc,	%f6,	%f8
	stbar
	fzero	%f8
	fbne	%fcc1,	loop_554
	bl	loop_555
	fbug	%fcc0,	loop_556
	movg	%xcc,	%o0,	%i2
loop_554:
	movleu	%icc,	%i7,	%g6
loop_555:
	fmovdcc	%icc,	%f11,	%f12
loop_556:
	tge	%xcc,	0x4
	movvs	%icc,	%o7,	%g5
	fbug	%fcc3,	loop_557
	membar	0x4E
	tneg	%xcc,	0x6
	brgez	%g2,	loop_558
loop_557:
	tne	%xcc,	0x0
	fmovdcc	%xcc,	%f1,	%f3
	array16	%l0,	%l6,	%o6
loop_558:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orncc	%l2,	0x14E9,	%l1
	fpackfix	%f18,	%f30
	fmovrdgez	%i1,	%f0,	%f0
	fpackfix	%f30,	%f15
	edge16ln	%o2,	%o1,	%g3
	fbu,a	%fcc2,	loop_559
	tsubcc	%g4,	%i6,	%o5
	fmul8sux16	%f0,	%f18,	%f12
	movcs	%xcc,	%g1,	%i0
loop_559:
	addccc	%o3,	0x0BE3,	%l3
	wr	%g0,	0x89,	%asi
	lda	[%l7 + 0x28] %asi,	%f4
	tcs	%xcc,	0x0
	fnors	%f20,	%f10,	%f4
	fone	%f24
	movrgz	%i4,	%l5,	%g7
	stx	%i3,	[%l7 + 0x68]
	udivcc	%l4,	0x0D8C,	%o4
	ldsw	[%l7 + 0x54],	%o0
	lduh	[%l7 + 0x58],	%i2
	movpos	%icc,	%i7,	%i5
	tvc	%icc,	0x4
	xor	%g6,	0x0844,	%g5
	std	%f10,	[%l7 + 0x70]
	movre	%o7,	%l0,	%g2
	nop
	setx loop_560, %l0, %l1
	jmpl %l1, %l6
	movl	%xcc,	%l2,	%o6
	ta	%xcc,	0x5
	ldd	[%l7 + 0x18],	%f18
loop_560:
	sub	%i1,	%o2,	%o1
	movrgez	%g3,	%l1,	%g4
	fbn,a	%fcc1,	loop_561
	movrgez	%o5,	0x206,	%g1
	fxnor	%f10,	%f30,	%f0
	edge16ln	%i6,	%i0,	%l3
loop_561:
	orcc	%o3,	%l5,	%g7
	ta	%icc,	0x6
	movn	%xcc,	%i3,	%i4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fzeros	%f10
	siam	0x7
	edge32l	%o4,	%o0,	%i2
	add	%l4,	0x1903,	%i7
	fornot2s	%f27,	%f30,	%f21
	edge8l	%g6,	%g5,	%o7
	bleu	%icc,	loop_562
	edge16ln	%l0,	%g2,	%i5
	fpsub32s	%f27,	%f13,	%f16
	orncc	%l6,	%o6,	%l2
loop_562:
	sllx	%i1,	%o1,	%g3
	bne,a	loop_563
	mulscc	%l1,	0x1BC1,	%o2
	fxnors	%f6,	%f18,	%f7
	movneg	%icc,	%g4,	%o5
loop_563:
	andcc	%g1,	%i6,	%i0
	add	%l7,	0x38,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] %asi,	%l3,	%o3
	wr	%g0,	0x18,	%asi
	ldsba	[%l7 + 0x73] %asi,	%g7
	and	%l5,	%i3,	%o4
	orcc	%i4,	0x19BE,	%i2
	fmovdpos	%icc,	%f5,	%f13
	fmovdgu	%xcc,	%f16,	%f13
	fba,a	%fcc0,	loop_564
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stx	%l4,	[%l7 + 0x20]
	xor	%o0,	%g6,	%g5
loop_564:
	fcmpeq16	%f18,	%f22,	%i7
	subccc	%l0,	0x1C08,	%o7
	movrgz	%i5,	%g2,	%o6
	fnot1	%f30,	%f0
	movrne	%l2,	0x3FE,	%l6
	membar	#Sync
	wr	%g0,	0x16,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	fmovsne	%icc,	%f27,	%f7
	edge8	%i1,	%o1,	%l1
	sllx	%g3,	%o2,	%o5
	fpmerge	%f6,	%f12,	%f12
	tcc	%xcc,	0x6
	sra	%g4,	0x1D,	%g1
	sra	%i0,	%l3,	%i6
	movg	%xcc,	%o3,	%l5
	edge8ln	%g7,	%o4,	%i3
	tne	%xcc,	0x7
	edge16	%i4,	%i2,	%o0
	bn,pt	%icc,	loop_565
	brgz,a	%g6,	loop_566
	add	%g5,	%i7,	%l0
	fmovd	%f14,	%f30
loop_565:
	edge8ln	%l4,	%i5,	%o7
loop_566:
	te	%xcc,	0x1
	andn	%o6,	0x1A72,	%g2
	set	0x7C, %i2
	ldswa	[%l7 + %i2] 0x18,	%l6
	fones	%f1
	st	%f11,	[%l7 + 0x64]
	ta	%icc,	0x0
	move	%xcc,	%i1,	%l2
	st	%f7,	[%l7 + 0x50]
	edge8n	%l1,	%o1,	%o2
	movcs	%xcc,	%o5,	%g3
	fbe,a	%fcc3,	loop_567
	edge8l	%g1,	%i0,	%l3
	sub	%g4,	0x06BB,	%o3
	sdivx	%l5,	0x0224,	%i6
loop_567:
	tle	%icc,	0x5
	movre	%g7,	%i3,	%i4
	fcmpgt16	%f6,	%f12,	%i2
	movrne	%o4,	%g6,	%g5
	ba,a,pn	%icc,	loop_568
	movrne	%o0,	0x3C8,	%i7
	add	%l7,	0x18,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%l4
	casxa	[%l6] %asi,	%l4,	%l0
loop_568:
	bpos	%xcc,	loop_569
	array16	%i5,	%o7,	%o6
	addcc	%g2,	%l6,	%i1
	fbue,a	%fcc0,	loop_570
loop_569:
	umulcc	%l2,	0x0C74,	%o1
	set	0x48, %o1
	swapa	[%l7 + %o1] 0x80,	%l1
loop_570:
	xor	%o2,	0x186A,	%g3
	tneg	%icc,	0x4
	sub	%o5,	0x02BC,	%i0
	udivcc	%l3,	0x0B65,	%g4
	alignaddrl	%o3,	%g1,	%i6
	nop
	set	0x68, %g1
	ldd	[%l7 + %g1],	%f26
	tvs	%icc,	0x6
	bvc,a	%icc,	loop_571
	and	%l5,	0x13C3,	%g7
	xnor	%i3,	0x0E48,	%i2
	array8	%i4,	%o4,	%g5
loop_571:
	fandnot1	%f22,	%f28,	%f28
	array16	%g6,	%i7,	%l4
	fmul8x16al	%f7,	%f6,	%f16
	orncc	%o0,	0x1219,	%l0
	sdivcc	%o7,	0x08A3,	%i5
	array8	%o6,	%g2,	%i1
	tcc	%xcc,	0x3
	sdiv	%l2,	0x0AD5,	%l6
	addcc	%o1,	0x0037,	%l1
	addccc	%o2,	0x1E26,	%g3
	fands	%f28,	%f13,	%f24
	sllx	%o5,	0x0A,	%i0
	wr	%g0,	0xea,	%asi
	stwa	%l3,	[%l7 + 0x30] %asi
	membar	#Sync
	tvc	%xcc,	0x6
	fmovrdlez	%o3,	%f10,	%f0
	udivcc	%g4,	0x0E6F,	%g1
	udivx	%l5,	0x0633,	%i6
	add	%l7,	0x38,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%i3,	%i2
	movgu	%xcc,	%i4,	%g7
	tsubcctv	%o4,	%g6,	%g5
	movg	%icc,	%i7,	%o0
	andncc	%l4,	%l0,	%o7
	movrgz	%o6,	0x303,	%i5
	fmovdvc	%icc,	%f18,	%f22
	addc	%i1,	0x07A6,	%l2
	andcc	%l6,	0x084B,	%o1
	tge	%xcc,	0x4
	or	%g2,	%o2,	%g3
	popc	0x0881,	%l1
	fbn	%fcc1,	loop_572
	edge8l	%o5,	%l3,	%o3
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x5C] %asi,	%i0
loop_572:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbue,a	%fcc0,	loop_573
	brgz,a	%g1,	loop_574
	tg	%icc,	0x4
	subc	%l5,	0x06D1,	%i6
loop_573:
	fnands	%f7,	%f15,	%f27
loop_574:
	brgz,a	%g4,	loop_575
	fbne,a	%fcc1,	loop_576
	andn	%i2,	%i4,	%i3
	sra	%g7,	0x06,	%o4
loop_575:
	srax	%g6,	%i7,	%o0
loop_576:
	fbne,a	%fcc2,	loop_577
	sra	%g5,	0x11,	%l4
	fbule,a	%fcc1,	loop_578
	taddcctv	%o7,	%l0,	%i5
loop_577:
	nop
	set	0x3E, %i3
	ldsha	[%l7 + %i3] 0x81,	%o6
loop_578:
	array8	%i1,	%l6,	%o1
	edge16l	%g2,	%l2,	%o2
	edge16n	%g3,	%o5,	%l3
	sdivx	%l1,	0x11BB,	%i0
	edge16	%g1,	%o3,	%l5
	ldsw	[%l7 + 0x50],	%i6
	srax	%g4,	0x03,	%i2
	addc	%i3,	%i4,	%o4
	brz,a	%g6,	loop_579
	fnand	%f30,	%f18,	%f22
	flush	%l7 + 0x54
	edge32	%i7,	%o0,	%g7
loop_579:
	nop
	set	0x5E, %o5
	ldstub	[%l7 + %o5],	%g5
	fmovdge	%icc,	%f14,	%f31
	nop
	setx loop_580, %l0, %l1
	jmpl %l1, %o7
	mulx	%l4,	%l0,	%i5
	fnot1s	%f21,	%f10
	brz,a	%o6,	loop_581
loop_580:
	ldub	[%l7 + 0x51],	%i1
	tvc	%xcc,	0x3
	edge32	%o1,	%g2,	%l2
loop_581:
	movrne	%l6,	%g3,	%o2
	tcc	%xcc,	0x7
	tn	%xcc,	0x4
	addccc	%l3,	0x0050,	%l1
	subc	%o5,	0x00B4,	%i0
	movpos	%xcc,	%o3,	%g1
	set	0x78, %g5
	stxa	%i6,	[%l7 + %g5] 0x0c
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
	tne	%xcc,	0x4
	subcc	%l5,	0x063C,	%g4
	array16	%i2,	%i3,	%o4
loop_582:
	addcc	%g6,	%i4,	%i7
	brz	%g7,	loop_583
	fmovda	%xcc,	%f8,	%f6
	xorcc	%o0,	%o7,	%g5
	fzeros	%f31
loop_583:
	movg	%icc,	%l0,	%l4
	nop
	setx	loop_584,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	membar	0x35
	tsubcctv	%o6,	%i1,	%o1
	or	%i5,	%l2,	%l6
loop_584:
	movrne	%g2,	0x31D,	%g3
	ldub	[%l7 + 0x28],	%o2
	movgu	%xcc,	%l3,	%l1
	fbu,a	%fcc0,	loop_585
	umulcc	%o5,	%o3,	%g1
	edge32	%i0,	%i6,	%g4
	popc	%l5,	%i2
loop_585:
	sub	%o4,	%i3,	%g6
	fpmerge	%f14,	%f24,	%f30
	xor	%i4,	%g7,	%o0
	tge	%icc,	0x5
	set	0x68, %o0
	stda	%i6,	[%l7 + %o0] 0x10
	fmul8x16	%f31,	%f10,	%f14
	edge16	%o7,	%l0,	%l4
	subc	%o6,	%g5,	%o1
	sethi	0x1563,	%i5
	umul	%i1,	%l6,	%g2
	bcc,pt	%icc,	loop_586
	edge32ln	%l2,	%g3,	%l3
	fmovrde	%l1,	%f30,	%f16
	srl	%o2,	%o3,	%g1
loop_586:
	tle	%xcc,	0x4
	fpadd32s	%f28,	%f27,	%f9
	edge32ln	%i0,	%i6,	%g4
	tcc	%icc,	0x1
	tg	%icc,	0x7
	srax	%o5,	%l5,	%o4
	fxors	%f27,	%f8,	%f10
	movg	%xcc,	%i3,	%g6
	membar	0x38
	fsrc1s	%f22,	%f26
	movcs	%xcc,	%i4,	%g7
	andcc	%o0,	0x1198,	%i2
	movrgz	%o7,	%l0,	%i7
	tne	%xcc,	0x5
	movleu	%icc,	%l4,	%o6
	wr	%g0,	0x81,	%asi
	lduha	[%l7 + 0x1A] %asi,	%g5
	fmovdvc	%icc,	%f7,	%f18
	fmovd	%f16,	%f8
	fnand	%f4,	%f6,	%f10
	andn	%o1,	0x1CBC,	%i1
	ldsw	[%l7 + 0x10],	%i5
	fandnot2s	%f20,	%f24,	%f6
	edge16ln	%g2,	%l6,	%l2
	fbug,a	%fcc3,	loop_587
	te	%icc,	0x4
	edge32	%l3,	%l1,	%o2
	tsubcc	%o3,	0x18B2,	%g3
loop_587:
	fcmpeq32	%f8,	%f0,	%g1
	alignaddr	%i0,	%g4,	%o5
	orcc	%i6,	0x13A7,	%o4
	set	0x40, %i6
	ldda	[%l7 + %i6] 0x2e,	%l4
	movrgez	%g6,	%i3,	%g7
	edge32l	%i4,	%i2,	%o0
	fpadd16s	%f9,	%f30,	%f27
	tcs	%xcc,	0x7
	fmovrslez	%l0,	%f22,	%f31
	bgu,pn	%xcc,	loop_588
	fmovrsgez	%i7,	%f4,	%f8
	set	0x3E, %g2
	lduha	[%l7 + %g2] 0x04,	%l4
loop_588:
	movre	%o7,	%o6,	%o1
	fcmple16	%f12,	%f22,	%i1
	set	0x28, %g3
	ldxa	[%g0 + %g3] 0x20,	%g5
	tn	%xcc,	0x4
	edge32l	%i5,	%g2,	%l2
	alignaddrl	%l3,	%l6,	%o2
	lduh	[%l7 + 0x12],	%o3
	orncc	%l1,	0x13A4,	%g1
	fnand	%f16,	%f10,	%f6
	sll	%g3,	%g4,	%i0
	fmovrde	%i6,	%f2,	%f8
	wr	%g0,	0xe3,	%asi
	ldda	[%l7 + 0x60] %asi,	%o4
	edge32l	%l5,	%g6,	%o4
	fandnot1	%f18,	%f26,	%f2
	fbue	%fcc2,	loop_589
	tvs	%xcc,	0x7
	sdivcc	%i3,	0x0EAA,	%i4
	sra	%i2,	%g7,	%o0
loop_589:
	fcmpd	%fcc2,	%f0,	%f14
	mulx	%i7,	0x00F0,	%l4
	subcc	%o7,	%o6,	%l0
	and	%o1,	0x094F,	%i1
	fbg	%fcc1,	loop_590
	tvs	%xcc,	0x6
	addc	%g5,	%i5,	%g2
	add	%l3,	0x1E1A,	%l6
loop_590:
	fmovspos	%icc,	%f2,	%f5
	tcs	%xcc,	0x7
	srax	%o2,	0x0B,	%o3
	tsubcctv	%l2,	%g1,	%l1
	movn	%icc,	%g4,	%g3
	set	0x11, %l1
	lduba	[%l7 + %l1] 0x19,	%i6
	udivx	%o5,	0x19E5,	%l5
	fbo,a	%fcc2,	loop_591
	fmovsvs	%icc,	%f24,	%f11
	fzeros	%f15
	tgu	%xcc,	0x0
loop_591:
	sdivx	%g6,	0x12F0,	%o4
	movle	%icc,	%i3,	%i4
	sub	%i0,	0x0F74,	%g7
	alignaddr	%o0,	%i2,	%i7
	fbn	%fcc3,	loop_592
	tge	%xcc,	0x7
	edge8	%o7,	%l4,	%l0
	nop
	setx loop_593, %l0, %l1
	jmpl %l1, %o6
loop_592:
	tg	%xcc,	0x5
	fbug	%fcc2,	loop_594
	lduh	[%l7 + 0x6E],	%o1
loop_593:
	udivx	%i1,	0x17D3,	%i5
	brgz,a	%g2,	loop_595
loop_594:
	tvs	%icc,	0x7
	movvc	%xcc,	%g5,	%l6
	fpmerge	%f0,	%f14,	%f16
loop_595:
	fmovsle	%icc,	%f18,	%f2
	srlx	%l3,	%o3,	%o2
	fmovrsne	%g1,	%f0,	%f11
	tvc	%icc,	0x5
	udivcc	%l1,	0x0F48,	%g4
	fbul	%fcc1,	loop_596
	movn	%xcc,	%g3,	%l2
	addccc	%i6,	%o5,	%g6
	fbug	%fcc1,	loop_597
loop_596:
	xnor	%o4,	0x00A3,	%l5
	tle	%xcc,	0x3
	movneg	%xcc,	%i3,	%i0
loop_597:
	siam	0x4
	mulscc	%i4,	0x026B,	%o0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	siam	0x2
	tpos	%xcc,	0x1
	fmovrdgez	%i2,	%f16,	%f22
	orcc	%g7,	%i7,	%l4
	fcmpes	%fcc1,	%f8,	%f16
	wr	%g0,	0x11,	%asi
	ldswa	[%l7 + 0x70] %asi,	%l0
	fsrc1	%f24,	%f4
	tge	%icc,	0x2
	andncc	%o6,	%o7,	%i1
	wr	%g0,	0x2b,	%asi
	stwa	%i5,	[%l7 + 0x50] %asi
	membar	#Sync
	fmovde	%icc,	%f15,	%f9
	subccc	%o1,	%g5,	%l6
	movpos	%icc,	%l3,	%o3
	udivcc	%g2,	0x0198,	%g1
	tcc	%xcc,	0x7
	sub	%o2,	0x11BD,	%g4
	fors	%f26,	%f18,	%f16
	orncc	%g3,	%l1,	%l2
	mova	%icc,	%i6,	%g6
	lduh	[%l7 + 0x78],	%o4
	stw	%l5,	[%l7 + 0x78]
	ldd	[%l7 + 0x50],	%f20
	wr	%g0,	0xe3,	%asi
	ldda	[%l7 + 0x10] %asi,	%i2
	fbule,a	%fcc3,	loop_598
	bn	%icc,	loop_599
	xnorcc	%i0,	%i4,	%o0
	bvc,pn	%icc,	loop_600
loop_598:
	orcc	%i2,	0x10C7,	%g7
loop_599:
	smul	%o5,	0x059D,	%l4
	smulcc	%i7,	%o6,	%l0
loop_600:
	fmovdge	%icc,	%f5,	%f22
	wr	%g0,	0x0c,	%asi
	stba	%o7,	[%l7 + 0x2F] %asi
	move	%icc,	%i5,	%i1
	set	0x5A, %l2
	stba	%g5,	[%l7 + %l2] 0x04
	edge16	%l6,	%l3,	%o1
	xnor	%o3,	%g2,	%o2
	fones	%f27
	mova	%icc,	%g4,	%g1
	fmovrslez	%g3,	%f26,	%f20
	edge32l	%l1,	%l2,	%g6
	brnz,a	%o4,	loop_601
	fone	%f28
	stw	%i6,	[%l7 + 0x34]
	xnorcc	%i3,	0x086D,	%l5
loop_601:
	movle	%xcc,	%i4,	%o0
	tpos	%icc,	0x3
	movrlez	%i2,	%g7,	%o5
	xor	%i0,	%l4,	%i7
	fsrc1s	%f8,	%f12
	srlx	%o6,	%o7,	%l0
	stb	%i1,	[%l7 + 0x72]
	array16	%g5,	%l6,	%l3
	fbue,a	%fcc0,	loop_602
	addc	%o1,	0x0CF2,	%i5
	tvc	%icc,	0x3
	wr	%g0,	0x1e,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
loop_602:
	ldstub	[%l7 + 0x38],	%o3
	std	%o2,	[%l7 + 0x18]
	subcc	%g2,	%g1,	%g4
	fornot1s	%f28,	%f15,	%f18
	srl	%l1,	%g3,	%g6
	movre	%l2,	0x2E8,	%i6
	tsubcc	%i3,	0x11F6,	%l5
	fmovdvs	%icc,	%f13,	%f19
	movleu	%xcc,	%i4,	%o0
	fsrc1s	%f15,	%f0
	tg	%icc,	0x3
	edge8ln	%o4,	%i2,	%g7
	flush	%l7 + 0x3C
	fmovrdne	%i0,	%f12,	%f18
	mulscc	%l4,	0x01AD,	%o5
	ldstub	[%l7 + 0x5D],	%i7
	fbg	%fcc2,	loop_603
	fcmpes	%fcc3,	%f28,	%f29
	edge16l	%o6,	%l0,	%o7
	bcc,a	loop_604
loop_603:
	subccc	%i1,	0x04BC,	%l6
	tleu	%icc,	0x5
	udivx	%g5,	0x0A89,	%l3
loop_604:
	array32	%o1,	%i5,	%o2
	set	0x24, %i4
	sta	%f21,	[%l7 + %i4] 0x10
	tpos	%xcc,	0x1
	edge16l	%g2,	%o3,	%g4
	lduh	[%l7 + 0x12],	%g1
	std	%l0,	[%l7 + 0x10]
	movrlz	%g3,	%l2,	%i6
	fbu	%fcc2,	loop_605
	move	%icc,	%i3,	%g6
	movgu	%xcc,	%l5,	%i4
	orncc	%o4,	0x1BA8,	%i2
loop_605:
	movrlz	%o0,	0x08A,	%i0
	movcs	%xcc,	%l4,	%o5
	sdiv	%i7,	0x1116,	%g7
	fexpand	%f30,	%f18
	fcmpne16	%f14,	%f2,	%o6
	bn,pt	%xcc,	loop_606
	tcc	%icc,	0x1
	tcc	%xcc,	0x1
	bn	loop_607
loop_606:
	swap	[%l7 + 0x58],	%o7
	tneg	%icc,	0x7
	fmuld8ulx16	%f15,	%f30,	%f28
loop_607:
	fble	%fcc2,	loop_608
	fmul8ulx16	%f6,	%f18,	%f24
	subc	%i1,	%l0,	%l6
	movrlez	%l3,	0x1E5,	%g5
loop_608:
	movl	%xcc,	%i5,	%o1
	sra	%o2,	0x1C,	%o3
	edge8l	%g4,	%g1,	%g2
	st	%f11,	[%l7 + 0x68]
	std	%l0,	[%l7 + 0x78]
	bl,a	loop_609
	ldd	[%l7 + 0x18],	%f26
	fmovsn	%xcc,	%f20,	%f3
	fmuld8sux16	%f28,	%f22,	%f2
loop_609:
	fxnors	%f1,	%f19,	%f13
	tneg	%xcc,	0x5
	andn	%g3,	0x07D9,	%i6
	movn	%icc,	%i3,	%g6
	call	loop_610
	sth	%l5,	[%l7 + 0x66]
	fmovrdgz	%i4,	%f0,	%f26
	array8	%o4,	%i2,	%l2
loop_610:
	tge	%icc,	0x6
	edge16n	%o0,	%l4,	%o5
	fbuge,a	%fcc0,	loop_611
	fbne	%fcc3,	loop_612
	movl	%icc,	%i0,	%g7
	subcc	%o6,	0x03F6,	%o7
loop_611:
	edge8	%i7,	%l0,	%i1
loop_612:
	fmovsle	%icc,	%f21,	%f21
	umulcc	%l6,	%l3,	%i5
	sdivcc	%o1,	0x04A3,	%g5
	srlx	%o2,	%g4,	%g1
	movvs	%icc,	%g2,	%o3
	fmovsvc	%icc,	%f5,	%f5
	addcc	%l1,	%g3,	%i3
	movcs	%xcc,	%g6,	%l5
	fcmpne16	%f18,	%f2,	%i6
	or	%o4,	0x0F3D,	%i4
	nop
	setx	loop_613,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fmovdcs	%icc,	%f17,	%f16
	fbg,a	%fcc3,	loop_614
	xnorcc	%l2,	0x18E5,	%o0
loop_613:
	movpos	%xcc,	%l4,	%i2
	set	0x6A, %o7
	ldsha	[%l7 + %o7] 0x80,	%i0
loop_614:
	tgu	%icc,	0x6
	lduw	[%l7 + 0x34],	%g7
	mulscc	%o6,	%o5,	%o7
	fble	%fcc1,	loop_615
	edge8ln	%i7,	%l0,	%i1
	movrgez	%l3,	%l6,	%o1
	tsubcc	%g5,	%o2,	%i5
loop_615:
	movle	%icc,	%g1,	%g4
	mova	%xcc,	%g2,	%o3
	tleu	%xcc,	0x7
	tg	%xcc,	0x7
	or	%l1,	%g3,	%g6
	tsubcctv	%l5,	%i6,	%i3
	bvs,a,pn	%icc,	loop_616
	movcc	%xcc,	%o4,	%i4
	set	0x38, %l3
	stha	%o0,	[%l7 + %l3] 0x80
loop_616:
	nop
	set	0x5B, %l0
	ldsb	[%l7 + %l0],	%l4
	orncc	%i2,	0x0B48,	%l2
	fmovdle	%icc,	%f9,	%f4
	fxnor	%f22,	%f26,	%f14
	tleu	%xcc,	0x4
	st	%f13,	[%l7 + 0x24]
	set	0x78, %g6
	stxa	%g7,	[%l7 + %g6] 0x80
	smul	%o6,	%i0,	%o5
	tgu	%icc,	0x5
	movcc	%xcc,	%i7,	%l0
	sll	%o7,	%i1,	%l3
	orcc	%l6,	0x01FB,	%o1
	tvs	%icc,	0x6
	edge16ln	%g5,	%o2,	%g1
	fpadd32s	%f17,	%f21,	%f4
	sethi	0x11D1,	%g4
	tge	%xcc,	0x2
	edge32l	%i5,	%o3,	%g2
	edge8n	%g3,	%g6,	%l5
	udiv	%i6,	0x16A6,	%l1
	array8	%o4,	%i4,	%i3
	edge8ln	%o0,	%i2,	%l4
	set	0x32, %l4
	ldsha	[%l7 + %l4] 0x0c,	%g7
	nop
	setx	loop_617,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	srl	%l2,	%i0,	%o5
	edge32ln	%o6,	%l0,	%i7
	edge8l	%o7,	%i1,	%l3
loop_617:
	xnor	%l6,	%g5,	%o1
	ta	%xcc,	0x3
	edge32l	%g1,	%g4,	%o2
	sethi	0x19F9,	%o3
	bleu,pn	%xcc,	loop_618
	fcmpgt16	%f28,	%f24,	%i5
	mulscc	%g3,	%g2,	%g6
	tsubcctv	%i6,	%l1,	%l5
loop_618:
	movvs	%xcc,	%i4,	%o4
	subccc	%i3,	%i2,	%o0
	fmovda	%icc,	%f27,	%f17
	fnot1	%f0,	%f20
	movcs	%icc,	%g7,	%l2
	movne	%xcc,	%i0,	%o5
	stbar
	movrne	%o6,	0x2E5,	%l4
	tgu	%xcc,	0x4
	brnz,a	%i7,	loop_619
	tcs	%icc,	0x1
	umulcc	%l0,	%o7,	%i1
	fpmerge	%f31,	%f2,	%f18
loop_619:
	lduw	[%l7 + 0x44],	%l6
	fpadd32s	%f30,	%f9,	%f16
	andncc	%g5,	%l3,	%g1
	wr	%g0,	0x11,	%asi
	lduba	[%l7 + 0x76] %asi,	%g4
	add	%o2,	0x1C5D,	%o1
	array32	%i5,	%g3,	%g2
	tvs	%icc,	0x7
	wr	%g0,	0x89,	%asi
	ldda	[%l7 + 0x40] %asi,	%o2
	movvc	%xcc,	%i6,	%g6
	fmovrsgz	%l1,	%f4,	%f8
	fands	%f26,	%f13,	%f31
	stw	%i4,	[%l7 + 0x54]
	fbule,a	%fcc1,	loop_620
	bg,a	loop_621
	brlz	%o4,	loop_622
	movrne	%i3,	%l5,	%i2
loop_620:
	fmovdge	%icc,	%f31,	%f22
loop_621:
	edge8n	%g7,	%l2,	%i0
loop_622:
	movrne	%o0,	0x097,	%o5
	edge32ln	%l4,	%i7,	%o6
	fxnor	%f2,	%f20,	%f8
	sll	%o7,	0x19,	%i1
	udivx	%l0,	0x0E75,	%l6
	movrlz	%l3,	0x0AB,	%g1
	subccc	%g4,	%o2,	%o1
	swap	[%l7 + 0x2C],	%g5
	movrlez	%g3,	0x111,	%g2
	edge16l	%i5,	%i6,	%g6
	set	0x33, %o2
	stba	%o3,	[%l7 + %o2] 0x22
	membar	#Sync
	fabss	%f30,	%f15
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsl	%icc,	%f11,	%f15
	popc	%i4,	%o4
	fmovdcc	%xcc,	%f27,	%f19
	smul	%i3,	%l1,	%l5
	addc	%i2,	0x01DE,	%g7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movgu	%icc,	%l2,	%o0
	edge16l	%i0,	%l4,	%i7
	smul	%o5,	0x1EC4,	%o6
	tpos	%xcc,	0x1
	orcc	%o7,	0x17E6,	%l0
	tcc	%icc,	0x3
	bgu,a,pt	%icc,	loop_623
	call	loop_624
	fbn	%fcc2,	loop_625
	smulcc	%i1,	0x030E,	%l3
loop_623:
	array32	%g1,	%l6,	%g4
loop_624:
	taddcctv	%o1,	0x1F57,	%g5
loop_625:
	fnot1s	%f21,	%f5
	udivx	%g3,	0x0219,	%o2
	taddcctv	%i5,	%i6,	%g6
	stbar
	fsrc2	%f22,	%f10
	wr	%g0,	0x50,	%asi
	ldxa	[%g0 + 0x30] %asi,	%g2
	wr	%g0,	0xe2,	%asi
	stda	%o2,	[%l7 + 0x30] %asi
	membar	#Sync
	wr	%g0,	0x19,	%asi
	lduha	[%l7 + 0x32] %asi,	%o4
	xnorcc	%i4,	0x1091,	%l1
	fsrc1s	%f5,	%f19
	orcc	%l5,	%i2,	%g7
	te	%icc,	0x3
	ba	loop_626
	fmovrsgz	%i3,	%f14,	%f8
	bg	%icc,	loop_627
	edge32	%o0,	%l2,	%i0
loop_626:
	std	%i6,	[%l7 + 0x68]
	sdivcc	%l4,	0x0874,	%o5
loop_627:
	be,a,pt	%icc,	loop_628
	ldsh	[%l7 + 0x5A],	%o7
	add	%l0,	%o6,	%i1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_628:
	sdivx	%l3,	0x0A77,	%l6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stbar
	array8	%g1,	%g4,	%o1
	add	%l7,	0x68,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%g5
	casxa	[%l6] 0x80,	%g5,	%o2
	fnegd	%f22,	%f20
	tneg	%xcc,	0x4
	sdiv	%g3,	0x083F,	%i5
	movrgez	%i6,	0x091,	%g2
	alignaddr	%g6,	%o4,	%o3
	tl	%icc,	0x6
	membar	0x50
	fbu,a	%fcc3,	loop_629
	fandnot2	%f20,	%f26,	%f6
	fbo	%fcc3,	loop_630
	tl	%icc,	0x5
loop_629:
	edge16ln	%l1,	%l5,	%i2
	tle	%icc,	0x1
loop_630:
	or	%g7,	%i4,	%o0
	udivcc	%i3,	0x0E25,	%i0
	bg	loop_631
	edge8n	%i7,	%l4,	%l2
	fnand	%f20,	%f28,	%f8
	fmovrslz	%o5,	%f25,	%f16
loop_631:
	tsubcc	%o7,	%o6,	%l0
	fmul8x16au	%f24,	%f11,	%f22
	fbl	%fcc1,	loop_632
	xor	%i1,	0x0216,	%l6
	std	%g0,	[%l7 + 0x50]
	wr	%g0,	0x89,	%asi
	ldswa	[%l7 + 0x20] %asi,	%g4
loop_632:
	ba,pn	%xcc,	loop_633
	movleu	%icc,	%o1,	%g5
	fpadd32	%f6,	%f10,	%f10
	umul	%o2,	%g3,	%l3
loop_633:
	nop
	setx loop_634, %l0, %l1
	jmpl %l1, %i6
	fsrc1	%f28,	%f0
	wr	%g0,	0x88,	%asi
	ldswa	[%l7 + 0x14] %asi,	%i5
loop_634:
	fpsub16	%f14,	%f16,	%f24
	flush	%l7 + 0x24
	movneg	%xcc,	%g2,	%o4
	xor	%g6,	%l1,	%l5
	tsubcc	%i2,	0x10DC,	%o3
	te	%xcc,	0x5
	edge16	%i4,	%g7,	%o0
	srlx	%i0,	%i7,	%i3
	fbu,a	%fcc2,	loop_635
	movcs	%xcc,	%l2,	%l4
	orcc	%o7,	0x0AE7,	%o5
	srl	%l0,	0x0E,	%o6
loop_635:
	tgu	%icc,	0x6
	movn	%icc,	%i1,	%l6
	fsrc2	%f20,	%f16
	fone	%f26
	edge16n	%g1,	%o1,	%g4
	edge8l	%o2,	%g5,	%g3
	movg	%xcc,	%i6,	%l3
	fmovsneg	%icc,	%f31,	%f21
	membar	0x40
	fmovsne	%icc,	%f9,	%f11
	fpsub16	%f16,	%f4,	%f12
	subc	%i5,	0x1DF3,	%o4
	sll	%g6,	%g2,	%l1
	mulx	%i2,	%l5,	%i4
	mulx	%o3,	%g7,	%o0
	tn	%xcc,	0x0
	fbn,a	%fcc1,	loop_636
	sethi	0x0702,	%i0
	edge8l	%i3,	%l2,	%l4
	bpos,a	%icc,	loop_637
loop_636:
	bpos,a	%icc,	loop_638
	alignaddrl	%o7,	%i7,	%l0
	tneg	%icc,	0x5
loop_637:
	array16	%o5,	%i1,	%o6
loop_638:
	move	%xcc,	%g1,	%o1
	tpos	%icc,	0x7
	movcs	%xcc,	%l6,	%o2
	brgez,a	%g5,	loop_639
	ba,a,pt	%xcc,	loop_640
	movre	%g3,	0x25D,	%g4
	fcmpgt32	%f12,	%f0,	%i6
loop_639:
	udivx	%i5,	0x0DA2,	%l3
loop_640:
	brgz	%o4,	loop_641
	fmul8x16au	%f2,	%f30,	%f0
	fandnot2	%f30,	%f2,	%f16
	mulscc	%g6,	%l1,	%i2
loop_641:
	add	%g2,	0x12FF,	%l5
	set	0x10, %o6
	ldswa	[%l7 + %o6] 0x19,	%i4
	andn	%o3,	0x0560,	%o0
	tle	%icc,	0x1
	andcc	%i0,	%i3,	%l2
	edge16n	%g7,	%o7,	%l4
	or	%l0,	0x1448,	%i7
	std	%f28,	[%l7 + 0x58]
	fandnot2	%f30,	%f24,	%f28
	sth	%o5,	[%l7 + 0x66]
	sdivcc	%i1,	0x0BCA,	%o6
	andcc	%g1,	%l6,	%o1
	fmovsgu	%icc,	%f26,	%f8
	set	0x62, %o4
	stha	%o2,	[%l7 + %o4] 0x27
	membar	#Sync
	srl	%g5,	0x05,	%g4
	smul	%g3,	%i5,	%i6
	fsrc2	%f14,	%f20
	sra	%l3,	%o4,	%g6
	set	0x74, %i0
	ldswa	[%l7 + %i0] 0x04,	%i2
	fmovscs	%icc,	%f24,	%f13
	alignaddrl	%l1,	%g2,	%l5
	edge8ln	%i4,	%o3,	%i0
	fmovdcc	%xcc,	%f27,	%f5
	edge32	%i3,	%o0,	%g7
	movvc	%icc,	%o7,	%l2
	bvs,pn	%icc,	loop_642
	fbg,a	%fcc2,	loop_643
	be	%xcc,	loop_644
	smulcc	%l0,	0x1CDC,	%i7
loop_642:
	bvs,a,pn	%icc,	loop_645
loop_643:
	fmovsg	%xcc,	%f25,	%f9
loop_644:
	movre	%o5,	%i1,	%l4
	array32	%g1,	%o6,	%o1
loop_645:
	bvc	loop_646
	tsubcc	%l6,	0x1DF3,	%g5
	and	%o2,	0x1539,	%g3
	bvs,a,pt	%xcc,	loop_647
loop_646:
	movvc	%xcc,	%g4,	%i6
	bvc	loop_648
	fmovd	%f2,	%f24
loop_647:
	fmul8x16al	%f26,	%f14,	%f4
	tleu	%icc,	0x5
loop_648:
	tcs	%icc,	0x2
	set	0x70, %g7
	stda	%i4,	[%l7 + %g7] 0x88
	edge32l	%l3,	%o4,	%i2
	andcc	%l1,	0x0344,	%g2
	fmovda	%xcc,	%f6,	%f29
	fbl,a	%fcc1,	loop_649
	udivcc	%g6,	0x08AD,	%i4
	tg	%icc,	0x5
	sra	%o3,	0x15,	%l5
loop_649:
	edge16	%i0,	%o0,	%g7
	wr	%g0,	0x10,	%asi
	ldswa	[%l7 + 0x7C] %asi,	%o7
	and	%i3,	%l0,	%l2
	movrgez	%o5,	%i7,	%l4
	movgu	%xcc,	%i1,	%g1
	fbge,a	%fcc2,	loop_650
	edge8l	%o1,	%l6,	%o6
	fnegs	%f8,	%f18
	tsubcctv	%g5,	0x1140,	%o2
loop_650:
	movvs	%icc,	%g3,	%g4
	fbl,a	%fcc0,	loop_651
	udivx	%i5,	0x1707,	%i6
	movvc	%icc,	%l3,	%o4
	fmovrdlz	%l1,	%f20,	%f10
loop_651:
	brgz	%g2,	loop_652
	movvc	%icc,	%i2,	%i4
	edge8	%o3,	%g6,	%l5
	fmovdleu	%xcc,	%f6,	%f24
loop_652:
	ldsb	[%l7 + 0x45],	%o0
	ldsw	[%l7 + 0x54],	%g7
	addc	%o7,	0x19CA,	%i3
	edge8l	%l0,	%i0,	%l2
	fmovrdlez	%o5,	%f20,	%f12
	umul	%l4,	%i7,	%g1
	fzeros	%f23
	fornot2	%f2,	%f0,	%f14
	movleu	%icc,	%i1,	%l6
	fnands	%f25,	%f24,	%f28
	fbne,a	%fcc0,	loop_653
	sethi	0x03A0,	%o6
	andn	%g5,	%o1,	%g3
	fxnors	%f6,	%f18,	%f25
loop_653:
	fbn,a	%fcc0,	loop_654
	fbul,a	%fcc2,	loop_655
	udivx	%g4,	0x1F25,	%i5
	te	%xcc,	0x6
loop_654:
	brz	%i6,	loop_656
loop_655:
	fbo	%fcc3,	loop_657
	brz,a	%l3,	loop_658
	bn	%icc,	loop_659
loop_656:
	tpos	%xcc,	0x3
loop_657:
	fbne	%fcc2,	loop_660
loop_658:
	and	%o2,	0x0725,	%l1
loop_659:
	movcs	%icc,	%o4,	%i2
	fmul8x16al	%f3,	%f3,	%f14
loop_660:
	ta	%xcc,	0x2
	for	%f6,	%f14,	%f4
	tl	%xcc,	0x3
	umulcc	%i4,	0x1F54,	%o3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udiv	%g2,	0x0180,	%l5
	bcc,a	%xcc,	loop_661
	fble,a	%fcc3,	loop_662
	srl	%o0,	0x13,	%g6
	bpos,pn	%xcc,	loop_663
loop_661:
	movg	%icc,	%o7,	%i3
loop_662:
	umulcc	%g7,	0x1A98,	%i0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_663:
	std	%f20,	[%l7 + 0x78]
	umulcc	%l0,	0x185A,	%o5
	edge16	%l4,	%i7,	%l2
	tsubcc	%g1,	0x0F16,	%l6
	set	0x18, %i1
	stxa	%i1,	[%l7 + %i1] 0xea
	membar	#Sync
	fpadd16s	%f17,	%f15,	%f23
	fbl	%fcc3,	loop_664
	udivcc	%g5,	0x0983,	%o1
	subcc	%g3,	0x06E5,	%g4
	taddcc	%o6,	0x1597,	%i6
loop_664:
	fandnot1s	%f27,	%f5,	%f24
	and	%l3,	%i5,	%l1
	andn	%o2,	%i2,	%o4
	fabss	%f30,	%f19
	xor	%i4,	%o3,	%l5
	alignaddrl	%o0,	%g2,	%o7
	bpos,a,pn	%icc,	loop_665
	alignaddrl	%g6,	%g7,	%i0
	ba,a	%icc,	loop_666
	bn,a	%xcc,	loop_667
loop_665:
	movvs	%xcc,	%l0,	%i3
	or	%l4,	0x05AA,	%i7
loop_666:
	movpos	%xcc,	%o5,	%g1
loop_667:
	array32	%l2,	%l6,	%g5
	bn,pn	%xcc,	loop_668
	tneg	%xcc,	0x3
	fnot1s	%f6,	%f20
	edge16ln	%i1,	%g3,	%g4
loop_668:
	fmovscc	%icc,	%f31,	%f28
	bge,a	loop_669
	edge16	%o6,	%o1,	%l3
	fmovsvs	%icc,	%f29,	%f29
	fand	%f12,	%f18,	%f0
loop_669:
	ldsb	[%l7 + 0x7D],	%i5
	popc	%l1,	%i6
	edge8n	%i2,	%o4,	%i4
	set	0x3B, %l5
	ldstuba	[%l7 + %l5] 0x80,	%o3
	addcc	%o2,	%l5,	%g2
	fmovse	%xcc,	%f7,	%f22
	fmovsleu	%xcc,	%f27,	%f10
	tcs	%xcc,	0x7
	smulcc	%o7,	%o0,	%g6
	srlx	%g7,	%l0,	%i3
	movg	%xcc,	%i0,	%i7
	sdivcc	%l4,	0x0B11,	%o5
	fzero	%f4
	alignaddr	%l2,	%l6,	%g1
	fmovdgu	%xcc,	%f26,	%f9
	movgu	%icc,	%g5,	%g3
	mulx	%g4,	0x0D8F,	%i1
	xnor	%o6,	%o1,	%l3
	or	%l1,	0x08EF,	%i6
	fmovdvc	%xcc,	%f24,	%f23
	set	0x10, %l6
	sta	%f7,	[%l7 + %l6] 0x89
	fxors	%f22,	%f10,	%f8
	sdiv	%i2,	0x1020,	%i5
	fnands	%f21,	%f5,	%f20
	wr	%g0,	0x10,	%asi
	prefetcha	[%l7 + 0x78] %asi,	 0x2
	edge8l	%o3,	%i4,	%o2
	movgu	%xcc,	%l5,	%o7
	tn	%icc,	0x6
	edge16n	%o0,	%g2,	%g6
	fmovdleu	%xcc,	%f15,	%f29
	brz,a	%g7,	loop_670
	std	%f28,	[%l7 + 0x60]
	pdist	%f30,	%f20,	%f28
	tn	%icc,	0x6
loop_670:
	bn	%xcc,	loop_671
	srl	%i3,	%i0,	%i7
	edge16ln	%l0,	%o5,	%l2
	sub	%l6,	0x11EA,	%g1
loop_671:
	tsubcctv	%l4,	%g3,	%g5
	movn	%xcc,	%g4,	%i1
	st	%f7,	[%l7 + 0x40]
	fbuge,a	%fcc1,	loop_672
	orncc	%o6,	%o1,	%l3
	srax	%i6,	%l1,	%i5
	set	0x08, %o3
	ldswa	[%l7 + %o3] 0x10,	%i2
loop_672:
	fabsd	%f0,	%f2
	movre	%o3,	%i4,	%o4
	xor	%o2,	%l5,	%o7
	tg	%icc,	0x6
	tl	%xcc,	0x5
	xnor	%g2,	%g6,	%o0
	andcc	%g7,	0x1A5D,	%i3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x14, %i5
	sta	%f31,	[%l7 + %i5] 0x0c
	addccc	%i0,	0x1ECC,	%l0
	xor	%o5,	%i7,	%l6
	fblg	%fcc2,	loop_673
	edge8n	%l2,	%g1,	%l4
	fbug	%fcc3,	loop_674
	ldstub	[%l7 + 0x18],	%g3
loop_673:
	fba	%fcc3,	loop_675
	alignaddr	%g4,	%i1,	%o6
loop_674:
	ldstub	[%l7 + 0x3A],	%g5
	movcc	%icc,	%o1,	%i6
loop_675:
	nop
	set	0x38, %i7
	prefetch	[%l7 + %i7],	 0x1
	fcmpes	%fcc2,	%f3,	%f4
	edge8ln	%l3,	%i5,	%i2
	movgu	%icc,	%o3,	%l1
	fmovsneg	%xcc,	%f25,	%f9
	nop
	setx	loop_676,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fbge,a	%fcc3,	loop_677
	srlx	%i4,	0x02,	%o2
	wr	%g0,	0x0c,	%asi
	swapa	[%l7 + 0x64] %asi,	%o4
loop_676:
	edge16	%l5,	%g2,	%g6
loop_677:
	bg,pt	%icc,	loop_678
	fnands	%f23,	%f12,	%f30
	edge16l	%o0,	%o7,	%g7
	bcs,a	%xcc,	loop_679
loop_678:
	fmovsn	%xcc,	%f6,	%f31
	movcc	%xcc,	%i0,	%l0
	brgz	%i3,	loop_680
loop_679:
	orncc	%i7,	%o5,	%l6
	fmovdcs	%xcc,	%f0,	%f28
	movrlz	%g1,	0x1E8,	%l4
loop_680:
	bl	loop_681
	edge8l	%g3,	%g4,	%i1
	or	%o6,	0x0B38,	%g5
	addcc	%o1,	%i6,	%l2
loop_681:
	bvs,a	%xcc,	loop_682
	fmovrsgz	%i5,	%f28,	%f4
	movvs	%xcc,	%l3,	%o3
	xor	%l1,	%i4,	%i2
loop_682:
	array32	%o2,	%o4,	%l5
	fpsub16s	%f2,	%f27,	%f20
	movcs	%icc,	%g2,	%o0
	srlx	%o7,	%g6,	%i0
	fmovdcs	%xcc,	%f8,	%f21
	tcc	%xcc,	0x6
	fbn	%fcc3,	loop_683
	tsubcctv	%g7,	0x0804,	%l0
	lduw	[%l7 + 0x28],	%i7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_683:
	udivx	%i3,	0x1A67,	%o5
	edge16n	%l6,	%g1,	%l4
	fbne,a	%fcc3,	loop_684
	fbn,a	%fcc1,	loop_685
	fbu	%fcc3,	loop_686
	sethi	0x07B7,	%g3
loop_684:
	fmul8x16al	%f20,	%f5,	%f2
loop_685:
	fmovse	%xcc,	%f10,	%f2
loop_686:
	fmovdcs	%icc,	%f1,	%f29
	tg	%xcc,	0x1
	orn	%i1,	%g4,	%o6
	fbge	%fcc0,	loop_687
	sethi	0x107E,	%o1
	subcc	%g5,	0x0A07,	%l2
	nop
	setx	loop_688,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_687:
	umulcc	%i5,	0x1886,	%i6
	fpsub32s	%f5,	%f2,	%f22
	bcs,a,pn	%xcc,	loop_689
loop_688:
	fandnot1s	%f22,	%f26,	%f8
	array16	%l3,	%o3,	%l1
	movcs	%xcc,	%i2,	%o2
loop_689:
	mulx	%o4,	%i4,	%l5
	edge8	%g2,	%o0,	%o7
	edge32	%g6,	%g7,	%l0
	tge	%xcc,	0x4
	udivx	%i7,	0x0017,	%i3
	wr	%g0,	0x27,	%asi
	stxa	%o5,	[%l7 + 0x50] %asi
	membar	#Sync
	fands	%f24,	%f24,	%f13
	st	%f10,	[%l7 + 0x60]
	fandnot1s	%f18,	%f17,	%f3
	fones	%f24
	edge16ln	%i0,	%l6,	%g1
	subc	%l4,	%g3,	%i1
	fornot1s	%f21,	%f2,	%f22
	movre	%g4,	0x08E,	%o6
	fmuld8sux16	%f18,	%f6,	%f6
	edge16n	%g5,	%l2,	%o1
	fmovdl	%icc,	%f29,	%f8
	fbuge	%fcc0,	loop_690
	umul	%i5,	0x0FB3,	%i6
	tsubcctv	%l3,	0x0ABA,	%l1
	fsrc2	%f14,	%f6
loop_690:
	array32	%o3,	%i2,	%o2
	bpos,pt	%xcc,	loop_691
	sdivx	%o4,	0x11D2,	%i4
	umulcc	%g2,	0x00EC,	%o0
	orn	%l5,	0x14A6,	%g6
loop_691:
	nop
	wr	%g0,	0xe2,	%asi
	stda	%o6,	[%l7 + 0x18] %asi
	membar	#Sync
	movne	%xcc,	%l0,	%i7
	umul	%i3,	0x1C9C,	%o5
	fandnot1s	%f26,	%f5,	%f9
	fpsub16	%f20,	%f22,	%f2
	edge8ln	%i0,	%l6,	%g7
	brlez	%g1,	loop_692
	movvc	%icc,	%l4,	%i1
	movrlez	%g3,	%o6,	%g5
	subc	%g4,	%l2,	%o1
loop_692:
	tvs	%xcc,	0x7
	tpos	%icc,	0x7
	addcc	%i6,	%i5,	%l3
	membar	0x47
	movvs	%icc,	%o3,	%l1
	movpos	%xcc,	%i2,	%o4
	lduw	[%l7 + 0x40],	%i4
	stw	%o2,	[%l7 + 0x64]
	subcc	%g2,	0x0013,	%o0
	fble,a	%fcc2,	loop_693
	xor	%g6,	%o7,	%l0
	fpack16	%f24,	%f5
	set	0x0, %g4
	ldxa	[%g0 + %g4] 0x20,	%l5
loop_693:
	fcmple32	%f10,	%f12,	%i7
	xor	%i3,	0x1FEB,	%i0
	array32	%l6,	%o5,	%g1
	fpsub16s	%f0,	%f22,	%f11
	fmovs	%f23,	%f8
	umul	%g7,	0x1F56,	%i1
	ldd	[%l7 + 0x08],	%f8
	orn	%g3,	0x1C04,	%o6
	fmovsne	%xcc,	%f6,	%f6
	fxnors	%f4,	%f2,	%f29
	xnor	%l4,	%g5,	%g4
	nop
	set	0x7D, %i2
	ldstub	[%l7 + %i2],	%l2
	set	0x40, %g1
	stda	%f0,	[%l7 + %g1] 0x10
	sll	%o1,	%i5,	%i6
	edge8	%l3,	%l1,	%i2
	alignaddrl	%o4,	%i4,	%o2
	wr	%g0,	0x81,	%asi
	ldsba	[%l7 + 0x3F] %asi,	%o3
	movrgz	%g2,	%o0,	%g6
	fabsd	%f0,	%f6
	ldub	[%l7 + 0x2F],	%l0
	call	loop_694
	fbug,a	%fcc1,	loop_695
	udivcc	%o7,	0x02BF,	%i7
	smulcc	%l5,	%i3,	%l6
loop_694:
	nop
	wr	%g0,	0x19,	%asi
	ldswa	[%l7 + 0x58] %asi,	%o5
loop_695:
	xorcc	%i0,	0x1155,	%g1
	fornot1	%f24,	%f8,	%f14
	tg	%xcc,	0x6
	taddcc	%g7,	0x06DD,	%g3
	fmovdvs	%xcc,	%f24,	%f29
	tpos	%icc,	0x0
	brlez,a	%o6,	loop_696
	fpsub16	%f20,	%f4,	%f20
	mova	%xcc,	%i1,	%g5
	fabss	%f1,	%f27
loop_696:
	fcmpgt32	%f6,	%f2,	%l4
	fbne,a	%fcc0,	loop_697
	tge	%xcc,	0x5
	fmovdge	%icc,	%f3,	%f8
	movre	%l2,	0x053,	%o1
loop_697:
	sllx	%g4,	%i5,	%i6
	mulscc	%l1,	%i2,	%l3
	tg	%icc,	0x0
	addccc	%i4,	0x121D,	%o4
	alignaddr	%o2,	%o3,	%g2
	udiv	%g6,	0x094C,	%o0
	ldsw	[%l7 + 0x2C],	%o7
	sdivcc	%l0,	0x0817,	%i7
	fnor	%f0,	%f4,	%f18
	fcmpne32	%f28,	%f24,	%i3
	edge16	%l5,	%l6,	%i0
	udivx	%g1,	0x1135,	%o5
	orcc	%g7,	0x0A35,	%g3
	movrlez	%o6,	%g5,	%i1
	fmovdne	%icc,	%f1,	%f23
	ldx	[%l7 + 0x20],	%l2
	movne	%icc,	%l4,	%g4
	set	0x3B, %o1
	ldstuba	[%l7 + %o1] 0x89,	%i5
	edge16n	%i6,	%l1,	%i2
	movleu	%xcc,	%l3,	%i4
	nop
	setx	loop_698,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	xorcc	%o4,	0x1D70,	%o2
	fbne	%fcc2,	loop_699
	fabss	%f26,	%f12
loop_698:
	array16	%o1,	%o3,	%g6
	andn	%o0,	%g2,	%o7
loop_699:
	stb	%l0,	[%l7 + 0x20]
	wr	%g0,	0x89,	%asi
	sta	%f18,	[%l7 + 0x0C] %asi
	brlez	%i7,	loop_700
	smul	%i3,	0x0DCE,	%l6
	nop
	setx	loop_701,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	ld	[%l7 + 0x5C],	%f3
loop_700:
	fbul	%fcc0,	loop_702
	pdist	%f6,	%f18,	%f8
loop_701:
	ldsh	[%l7 + 0x52],	%l5
	ta	%xcc,	0x5
loop_702:
	fnegd	%f4,	%f6
	stb	%g1,	[%l7 + 0x50]
	fmovsl	%xcc,	%f25,	%f15
	popc	0x075C,	%i0
	set	0x50, %o5
	ldxa	[%l7 + %o5] 0x14,	%g7
	fones	%f29
	fmul8sux16	%f22,	%f26,	%f0
	popc	%g3,	%o6
	edge16ln	%g5,	%o5,	%i1
	xnor	%l4,	%l2,	%i5
	movrgez	%i6,	0x020,	%l1
	mulx	%i2,	%g4,	%i4
	tgu	%xcc,	0x6
	udiv	%l3,	0x1482,	%o4
	fsrc2	%f2,	%f0
	udivcc	%o2,	0x1028,	%o3
	addccc	%g6,	%o0,	%g2
	tcs	%xcc,	0x2
	edge8ln	%o7,	%o1,	%l0
	ble,pn	%icc,	loop_703
	bg	loop_704
	andn	%i7,	%l6,	%i3
	orncc	%l5,	0x0D6A,	%i0
loop_703:
	fbg,a	%fcc0,	loop_705
loop_704:
	array32	%g1,	%g7,	%g3
	fbule	%fcc1,	loop_706
	ldsh	[%l7 + 0x7E],	%o6
loop_705:
	sdivx	%g5,	0x00CF,	%i1
	add	%l7,	0x50,	%l6
	wr	%g0,	0x11,	%asi
	lda	[%l6] %asi,	%l4
	casa	[%l6] %asi,	%l4,	%l2
loop_706:
	sllx	%i5,	0x1F,	%i6
	set	0x74, %g5
	stwa	%l1,	[%l7 + %g5] 0x15
	brlz	%o5,	loop_707
	nop
	setx	loop_708,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	andn	%i2,	0x138D,	%i4
	tgu	%icc,	0x0
loop_707:
	fmovdpos	%icc,	%f5,	%f19
loop_708:
	orncc	%l3,	%g4,	%o4
	tsubcctv	%o2,	%g6,	%o3
	move	%xcc,	%g2,	%o0
	st	%f16,	[%l7 + 0x38]
	srl	%o7,	%l0,	%o1
	fmovda	%xcc,	%f4,	%f5
	bshuffle	%f16,	%f8,	%f20
	subc	%i7,	%l6,	%i3
	set	0x25, %i3
	stba	%i0,	[%l7 + %i3] 0x81
	addc	%l5,	0x1485,	%g7
	fpadd32	%f22,	%f2,	%f20
	wr	%g0,	0x89,	%asi
	ldswa	[%l7 + 0x64] %asi,	%g3
	set	0x40, %o0
	ldswa	[%l7 + %o0] 0x04,	%g1
	set	0x40, %g2
	stda	%f16,	[%l7 + %g2] 0x0c
	addccc	%g5,	%o6,	%i1
	movvc	%xcc,	%l4,	%l2
	std	%i4,	[%l7 + 0x78]
	movrne	%l1,	0x38F,	%o5
	edge32ln	%i2,	%i4,	%i6
	std	%f2,	[%l7 + 0x48]
	fmovdg	%icc,	%f16,	%f27
	call	loop_709
	fxnor	%f18,	%f4,	%f12
	brgez,a	%g4,	loop_710
	bcs,a	loop_711
loop_709:
	fcmpgt16	%f30,	%f0,	%o4
	tl	%xcc,	0x2
loop_710:
	fcmped	%fcc2,	%f8,	%f8
loop_711:
	sra	%l3,	%g6,	%o3
	movvc	%icc,	%o2,	%o0
	edge8ln	%g2,	%l0,	%o7
	edge32	%i7,	%o1,	%i3
	nop
	setx	loop_712,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	ldsh	[%l7 + 0x2A],	%l6
	wr	%g0,	0x19,	%asi
	lduha	[%l7 + 0x78] %asi,	%l5
loop_712:
	tneg	%xcc,	0x0
	fnegd	%f0,	%f10
	stx	%g7,	[%l7 + 0x28]
	taddcctv	%i0,	%g1,	%g5
	fmovsneg	%xcc,	%f28,	%f14
	fxor	%f22,	%f6,	%f12
	lduw	[%l7 + 0x10],	%g3
	srlx	%i1,	0x1C,	%o6
	edge32l	%l4,	%i5,	%l2
	fmovrdgz	%l1,	%f4,	%f16
	fbg	%fcc1,	loop_713
	tle	%icc,	0x4
	bl,pt	%icc,	loop_714
	sth	%i2,	[%l7 + 0x28]
loop_713:
	fbuge,a	%fcc0,	loop_715
	brlz,a	%o5,	loop_716
loop_714:
	tsubcc	%i6,	0x03C5,	%i4
	fbo	%fcc3,	loop_717
loop_715:
	brlz	%g4,	loop_718
loop_716:
	fcmple16	%f2,	%f2,	%l3
	set	0x58, %i6
	stda	%o4,	[%l7 + %i6] 0x27
	membar	#Sync
loop_717:
	tleu	%icc,	0x5
loop_718:
	fbne	%fcc1,	loop_719
	fpack16	%f4,	%f21
	fmovscc	%xcc,	%f6,	%f5
	umulcc	%g6,	0x1606,	%o2
loop_719:
	xor	%o0,	0x0A1E,	%g2
	te	%xcc,	0x2
	sub	%l0,	%o7,	%i7
	fbule	%fcc1,	loop_720
	brz,a	%o3,	loop_721
	fmovsge	%xcc,	%f23,	%f29
	movvc	%xcc,	%i3,	%o1
loop_720:
	movg	%xcc,	%l5,	%l6
loop_721:
	fbg	%fcc0,	loop_722
	fmul8x16au	%f18,	%f2,	%f8
	fabss	%f21,	%f24
	ldd	[%l7 + 0x50],	%f18
loop_722:
	movn	%icc,	%g7,	%g1
	movge	%xcc,	%i0,	%g3
	addccc	%i1,	%o6,	%g5
	movcc	%icc,	%l4,	%i5
	fpsub32s	%f1,	%f22,	%f21
	tcs	%xcc,	0x6
	fba	%fcc3,	loop_723
	tge	%icc,	0x1
	bneg	loop_724
	fxnors	%f1,	%f0,	%f21
loop_723:
	fbl	%fcc2,	loop_725
	fxnor	%f2,	%f2,	%f10
loop_724:
	fcmpes	%fcc0,	%f29,	%f26
	ta	%xcc,	0x3
loop_725:
	srlx	%l1,	0x02,	%i2
	alignaddrl	%l2,	%o5,	%i6
	fnor	%f20,	%f6,	%f2
	fbe	%fcc2,	loop_726
	te	%icc,	0x1
	edge32	%g4,	%l3,	%o4
	array32	%g6,	%o2,	%o0
loop_726:
	fmovdleu	%icc,	%f10,	%f21
	edge16l	%i4,	%g2,	%o7
	tleu	%xcc,	0x1
	sllx	%l0,	%o3,	%i7
	sdivx	%o1,	0x1A56,	%l5
	fmovs	%f23,	%f6
	sdiv	%l6,	0x0AA8,	%g7
	tn	%xcc,	0x1
	fmul8x16al	%f26,	%f14,	%f30
	fmovsvc	%icc,	%f11,	%f7
	andcc	%i3,	%g1,	%g3
	fmovdvc	%icc,	%f14,	%f25
	set	0x40, %g3
	ldda	[%l7 + %g3] 0x18,	%f16
	subcc	%i1,	0x0F7A,	%i0
	subc	%g5,	0x1830,	%l4
	movcc	%icc,	%o6,	%i5
	movn	%icc,	%l1,	%l2
	sdivx	%o5,	0x1AFA,	%i6
	std	%i2,	[%l7 + 0x38]
	movleu	%icc,	%g4,	%o4
	st	%f28,	[%l7 + 0x5C]
	sllx	%g6,	%o2,	%o0
	wr	%g0,	0x18,	%asi
	ldsha	[%l7 + 0x56] %asi,	%i4
	fmovdcs	%xcc,	%f20,	%f13
	srax	%l3,	%o7,	%g2
	sdivcc	%l0,	0x0762,	%o3
	or	%i7,	%l5,	%o1
	be,a	%xcc,	loop_727
	array8	%g7,	%l6,	%g1
	tcc	%xcc,	0x5
	fexpand	%f22,	%f16
loop_727:
	fmovdl	%icc,	%f22,	%f5
	brlez	%i3,	loop_728
	ba,pt	%xcc,	loop_729
	alignaddr	%i1,	%i0,	%g3
	fbug	%fcc3,	loop_730
loop_728:
	udivx	%g5,	0x1D25,	%o6
loop_729:
	fcmpeq32	%f14,	%f0,	%l4
	fbge	%fcc0,	loop_731
loop_730:
	tcc	%icc,	0x0
	nop
	setx	loop_732,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	tleu	%xcc,	0x3
loop_731:
	array32	%i5,	%l2,	%o5
	addcc	%i6,	0x1586,	%i2
loop_732:
	flush	%l7 + 0x34
	edge8ln	%l1,	%o4,	%g6
	membar	0x77
	movgu	%icc,	%g4,	%o2
	fpadd32s	%f11,	%f7,	%f2
	fxor	%f22,	%f28,	%f18
	fmovsa	%icc,	%f2,	%f20
	and	%i4,	%l3,	%o0
	brgez	%g2,	loop_733
	andcc	%l0,	%o7,	%o3
	array32	%l5,	%i7,	%o1
	movgu	%xcc,	%g7,	%g1
loop_733:
	fbuge,a	%fcc2,	loop_734
	movgu	%xcc,	%l6,	%i3
	fnands	%f31,	%f25,	%f24
	xnorcc	%i0,	0x09CA,	%g3
loop_734:
	addcc	%i1,	%o6,	%l4
	bvs	loop_735
	movl	%xcc,	%g5,	%i5
	fones	%f26
	fmovscs	%xcc,	%f9,	%f8
loop_735:
	bg,a	%xcc,	loop_736
	movvs	%xcc,	%o5,	%i6
	srl	%i2,	0x16,	%l1
	fmovrse	%l2,	%f1,	%f28
loop_736:
	fmovrslez	%g6,	%f11,	%f18
	fpsub16s	%f31,	%f21,	%f22
	addcc	%o4,	%o2,	%g4
	sdivx	%i4,	0x08B7,	%o0
	fmovsne	%xcc,	%f3,	%f27
	fmovrdgez	%g2,	%f10,	%f26
	set	0x7D, %l2
	ldstuba	[%l7 + %l2] 0x11,	%l0
	fmovs	%f12,	%f10
	smulcc	%l3,	0x0F79,	%o3
	fcmple32	%f28,	%f18,	%o7
	bge	loop_737
	bl	loop_738
	sir	0x0CC9
	brnz,a	%l5,	loop_739
loop_737:
	edge32	%i7,	%o1,	%g7
loop_738:
	nop
	wr	%g0,	0x2b,	%asi
	stwa	%l6,	[%l7 + 0x54] %asi
	membar	#Sync
loop_739:
	nop
	nop 	! 	nop 	! 	wr	%g0,	0x40,	%asi ripped by fixASI40.pl ripped by fixASI40.pl
	nop 	! 	nop 	! 	ldxa	[%g0 + 0x348] %asi,	%i3 ripped by fixASI40.pl ripped by fixASI40.pl
	bneg,a,pn	%icc,	loop_740
	tn	%icc,	0x2
	edge16ln	%i0,	%g3,	%g1
	fbn	%fcc1,	loop_741
loop_740:
	fmovsl	%xcc,	%f26,	%f28
	edge32	%o6,	%i1,	%g5
	addccc	%l4,	%i5,	%o5
loop_741:
	edge8	%i6,	%l1,	%i2
	edge32l	%g6,	%l2,	%o2
	tleu	%xcc,	0x6
	set	0x30, %i4
	ldda	[%l7 + %i4] 0xe2,	%o4
	edge16n	%i4,	%o0,	%g4
	fbu	%fcc1,	loop_742
	fmovdpos	%icc,	%f3,	%f4
	fbuge,a	%fcc2,	loop_743
	movvc	%xcc,	%g2,	%l0
loop_742:
	ldx	[%l7 + 0x60],	%l3
	edge32ln	%o7,	%o3,	%l5
loop_743:
	fzero	%f24
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bcc,pn	%xcc,	loop_744
	fmuld8ulx16	%f19,	%f15,	%f8
	fbe	%fcc1,	loop_745
	tpos	%icc,	0x4
loop_744:
	std	%o0,	[%l7 + 0x78]
	movrlez	%i7,	%g7,	%i3
loop_745:
	addc	%l6,	0x036A,	%g3
	subc	%i0,	0x04C0,	%o6
	fmuld8ulx16	%f14,	%f2,	%f8
	edge8ln	%g1,	%g5,	%i1
	taddcc	%i5,	0x1DC9,	%l4
	bne,a	%xcc,	loop_746
	bvs	%icc,	loop_747
	xor	%o5,	0x0694,	%l1
	fble,a	%fcc3,	loop_748
loop_746:
	movcs	%xcc,	%i6,	%i2
loop_747:
	subcc	%g6,	0x06BF,	%l2
loop_748:
	smul	%o4,	0x071A,	%o0
	edge16ln	%g4,	%i4,	%l0
	or	%l3,	%o7,	%g2
	fba,a	%fcc0,	loop_749
	fba,a	%fcc1,	loop_750
	addccc	%o3,	0x16C1,	%l5
	umul	%o1,	%g7,	%i7
loop_749:
	nop
	wr	%g0,	0x89,	%asi
	ldsba	[%l7 + 0x61] %asi,	%i3
loop_750:
	tleu	%icc,	0x3
	sdivcc	%l6,	0x016E,	%i0
	movleu	%xcc,	%g3,	%o6
	edge8n	%g5,	%i1,	%i5
	fpsub32	%f22,	%f10,	%f14
	fmovsle	%xcc,	%f22,	%f27
	fpadd32	%f0,	%f14,	%f28
	xorcc	%l4,	0x0BAA,	%o5
	fcmpd	%fcc2,	%f6,	%f4
	fba	%fcc3,	loop_751
	fmovdge	%xcc,	%f21,	%f22
	taddcctv	%g1,	%l1,	%i6
	set	0x28, %l1
	stba	%g6,	[%l7 + %l1] 0xe2
	membar	#Sync
loop_751:
	edge16l	%l2,	%i2,	%o2
	fmul8ulx16	%f28,	%f12,	%f10
	ba,a	loop_752
	tne	%xcc,	0x4
	movn	%icc,	%o0,	%g4
	andcc	%i4,	0x09F3,	%o4
loop_752:
	std	%f10,	[%l7 + 0x70]
	edge16	%l3,	%l0,	%o7
	brlz	%o3,	loop_753
	movge	%xcc,	%l5,	%o1
	array32	%g2,	%i7,	%g7
	std	%i2,	[%l7 + 0x70]
loop_753:
	stb	%i0,	[%l7 + 0x5F]
	fmovrde	%g3,	%f14,	%f0
	movpos	%icc,	%o6,	%g5
	wr	%g0,	0x80,	%asi
	ldxa	[%l7 + 0x20] %asi,	%l6
	srl	%i1,	0x0F,	%i5
	fexpand	%f2,	%f16
	srlx	%o5,	%g1,	%l1
	or	%l4,	0x0B47,	%g6
	tleu	%icc,	0x6
	membar	0x72
	mulscc	%i6,	%l2,	%o2
	sdivcc	%i2,	0x057D,	%o0
	movg	%icc,	%i4,	%g4
	addccc	%o4,	%l0,	%o7
	fbn,a	%fcc2,	loop_754
	tcc	%xcc,	0x3
	tge	%icc,	0x5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_754:
	sll	%o3,	0x09,	%l3
	movle	%xcc,	%l5,	%g2
	movrgez	%o1,	0x3AC,	%g7
	bleu,a	loop_755
	fnor	%f18,	%f2,	%f14
	movgu	%xcc,	%i3,	%i0
	lduh	[%l7 + 0x24],	%i7
loop_755:
	pdist	%f2,	%f14,	%f22
	wr	%g0,	0x20,	%asi
	ldxa	[%g0 + 0x0] %asi,	%g3
	sub	%o6,	0x0B16,	%l6
	wr	%g0,	0x2b,	%asi
	stda	%i0,	[%l7 + 0x08] %asi
	membar	#Sync
	xnorcc	%i5,	0x0766,	%o5
	array8	%g5,	%l1,	%g1
	edge8	%l4,	%i6,	%l2
	bpos,a,pn	%icc,	loop_756
	fmuld8ulx16	%f4,	%f20,	%f8
	mova	%icc,	%o2,	%i2
	fmovdne	%icc,	%f31,	%f14
loop_756:
	tne	%icc,	0x3
	wr	%g0,	0x80,	%asi
	prefetcha	[%l7 + 0x30] %asi,	 0x1
	bpos,a	loop_757
	andn	%i4,	%g4,	%o4
	wr	%g0,	0x18,	%asi
	sta	%f28,	[%l7 + 0x10] %asi
loop_757:
	lduw	[%l7 + 0x30],	%o0
	flush	%l7 + 0x50
	xorcc	%o7,	%o3,	%l3
	wr	%g0,	0x10,	%asi
	stba	%l0,	[%l7 + 0x71] %asi
	be	%icc,	loop_758
	smulcc	%g2,	%o1,	%g7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tn	%icc,	0x6
loop_758:
	edge16ln	%i3,	%l5,	%i7
	addccc	%i0,	%o6,	%l6
	alignaddr	%g3,	%i5,	%o5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srlx	%g5,	0x16,	%l1
	movre	%i1,	0x00C,	%l4
	movrgez	%g1,	%i6,	%l2
	srax	%i2,	0x06,	%o2
	edge32ln	%g6,	%i4,	%o4
	tgu	%icc,	0x3
	edge16	%o0,	%o7,	%g4
	taddcc	%l3,	%l0,	%g2
	xorcc	%o1,	%g7,	%i3
	fmovrdgz	%l5,	%f14,	%f16
	edge16n	%i7,	%o3,	%o6
	fexpand	%f17,	%f26
	edge8n	%l6,	%i0,	%i5
	fnegs	%f10,	%f14
	set	0x68, %o7
	ldsha	[%l7 + %o7] 0x10,	%o5
	fabsd	%f30,	%f12
	alignaddr	%g3,	%l1,	%i1
	addcc	%g5,	%g1,	%l4
	bvs	%icc,	loop_759
	xor	%l2,	%i6,	%i2
	orcc	%g6,	0x088E,	%o2
	subccc	%o4,	%o0,	%o7
loop_759:
	movrlz	%g4,	0x2E0,	%l3
	fmovrse	%l0,	%f28,	%f10
	ldx	[%l7 + 0x70],	%g2
	sethi	0x0CF8,	%o1
	fands	%f1,	%f6,	%f21
	fand	%f28,	%f6,	%f0
	set	0x70, %l0
	ldda	[%l7 + %l0] 0x24,	%i4
	tg	%icc,	0x0
	fcmpeq16	%f14,	%f20,	%g7
	movn	%xcc,	%i3,	%l5
	fmuld8ulx16	%f29,	%f18,	%f26
	for	%f14,	%f30,	%f20
	mulx	%i7,	0x10E8,	%o6
	xnor	%o3,	%l6,	%i5
	edge32n	%i0,	%o5,	%l1
	bne,pt	%xcc,	loop_760
	movrgez	%g3,	0x2A2,	%i1
	fmovsgu	%icc,	%f18,	%f11
	fmovdl	%icc,	%f22,	%f25
loop_760:
	bleu,pt	%icc,	loop_761
	fnot2	%f16,	%f28
	xor	%g5,	%g1,	%l2
	addccc	%l4,	%i6,	%g6
loop_761:
	prefetch	[%l7 + 0x44],	 0x0
	ldd	[%l7 + 0x78],	%o2
	set	0x110, %l3
	ldxa	[%g0 + %l3] 0x52,	%o4
	andcc	%i2,	0x0D9A,	%o0
	movpos	%icc,	%o7,	%l3
	fors	%f1,	%f0,	%f29
	fmovdl	%icc,	%f11,	%f21
	fmovrdne	%g4,	%f24,	%f0
	alignaddr	%g2,	%o1,	%i4
	subcc	%l0,	0x02F2,	%g7
	edge8ln	%l5,	%i7,	%i3
	fbuge	%fcc3,	loop_762
	movleu	%icc,	%o6,	%l6
	fsrc2	%f6,	%f20
	wr	%g0,	0x81,	%asi
	swapa	[%l7 + 0x24] %asi,	%i5
loop_762:
	stbar
	lduw	[%l7 + 0x10],	%o3
	subccc	%o5,	%l1,	%g3
	fcmped	%fcc2,	%f10,	%f8
	sllx	%i0,	%i1,	%g1
	subcc	%l2,	%g5,	%i6
	edge32n	%g6,	%l4,	%o4
	edge32ln	%o2,	%o0,	%o7
	tg	%icc,	0x7
	movvs	%xcc,	%i2,	%l3
	sdivcc	%g4,	0x10DF,	%g2
	alignaddrl	%i4,	%l0,	%g7
	bge,pt	%icc,	loop_763
	fmul8sux16	%f0,	%f18,	%f14
	sdiv	%l5,	0x10A5,	%i7
	fbule	%fcc3,	loop_764
loop_763:
	bcs	%icc,	loop_765
	movrgez	%o1,	0x0BF,	%o6
	xorcc	%i3,	%i5,	%o3
loop_764:
	nop
	set	0x7A, %l4
	ldsba	[%l7 + %l4] 0x88,	%l6
loop_765:
	sir	0x1CE1
	fbug,a	%fcc2,	loop_766
	fandnot2	%f14,	%f16,	%f4
	bneg,pn	%xcc,	loop_767
	movg	%xcc,	%o5,	%g3
loop_766:
	fbe,a	%fcc2,	loop_768
	fbe	%fcc1,	loop_769
loop_767:
	movn	%icc,	%i0,	%i1
	smul	%l1,	%g1,	%g5
loop_768:
	subc	%i6,	0x163D,	%l2
loop_769:
	fmovrde	%g6,	%f12,	%f26
	tgu	%icc,	0x4
	movcc	%xcc,	%o4,	%l4
	edge32	%o0,	%o2,	%i2
	bpos	%icc,	loop_770
	fbl	%fcc0,	loop_771
	mova	%xcc,	%l3,	%g4
	pdist	%f12,	%f30,	%f24
loop_770:
	flush	%l7 + 0x48
loop_771:
	array8	%g2,	%i4,	%o7
	andn	%g7,	0x1B65,	%l0
	lduw	[%l7 + 0x70],	%l5
	bg,a	%xcc,	loop_772
	fcmpeq16	%f4,	%f26,	%i7
	sra	%o6,	%o1,	%i3
	edge8	%i5,	%l6,	%o3
loop_772:
	fmovdpos	%icc,	%f17,	%f16
	umul	%o5,	%g3,	%i0
	andcc	%i1,	%l1,	%g5
	tle	%icc,	0x7
	andn	%g1,	%i6,	%g6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movgu	%icc,	%o4,	%l4
	sllx	%l2,	0x1C,	%o2
	fone	%f26
	tl	%xcc,	0x7
	ta	%icc,	0x0
	alignaddr	%o0,	%i2,	%l3
	movrlz	%g2,	0x192,	%i4
	edge16n	%o7,	%g7,	%g4
	tge	%xcc,	0x6
	tneg	%icc,	0x6
	tleu	%xcc,	0x3
	fxors	%f27,	%f27,	%f2
	subcc	%l5,	0x04C3,	%i7
	stb	%o6,	[%l7 + 0x71]
	subcc	%l0,	0x131D,	%i3
	addcc	%i5,	%o1,	%o3
	sethi	0x115E,	%l6
	xor	%o5,	%i0,	%i1
	tleu	%xcc,	0x7
	fpackfix	%f12,	%f29
	ldsh	[%l7 + 0x18],	%g3
	fmovde	%icc,	%f31,	%f26
	fsrc1	%f24,	%f18
	set	0x40, %g6
	swapa	[%l7 + %g6] 0x80,	%g5
	or	%g1,	%l1,	%g6
	fbe	%fcc0,	loop_773
	subccc	%o4,	0x1F73,	%i6
	andn	%l2,	%l4,	%o2
	sll	%i2,	%o0,	%g2
loop_773:
	move	%icc,	%l3,	%o7
	bg,a,pn	%xcc,	loop_774
	edge32ln	%g7,	%i4,	%l5
	mulscc	%i7,	%o6,	%g4
	bpos	loop_775
loop_774:
	sll	%l0,	%i3,	%o1
	fbge,a	%fcc3,	loop_776
	fmul8x16	%f21,	%f16,	%f4
loop_775:
	xorcc	%o3,	0x0692,	%l6
	set	0x36, %o2
	ldsha	[%l7 + %o2] 0x89,	%i5
loop_776:
	fpadd32s	%f31,	%f21,	%f16
	movvc	%icc,	%i0,	%o5
	fbu,a	%fcc2,	loop_777
	sub	%i1,	%g5,	%g3
	edge8ln	%l1,	%g1,	%o4
	edge32n	%g6,	%l2,	%l4
loop_777:
	fmovspos	%xcc,	%f19,	%f7
	fmovsge	%icc,	%f3,	%f0
	wr	%g0,	0x10,	%asi
	lduha	[%l7 + 0x38] %asi,	%o2
	tvs	%xcc,	0x1
	movle	%xcc,	%i2,	%o0
	fsrc2s	%f13,	%f16
	fpsub32s	%f4,	%f5,	%f30
	bcc,a	%xcc,	loop_778
	mulscc	%i6,	0x0D9B,	%g2
	tvs	%icc,	0x7
	fnot1	%f14,	%f4
loop_778:
	and	%o7,	0x1911,	%l3
	fmovsle	%xcc,	%f5,	%f4
	edge16	%i4,	%l5,	%i7
	edge8ln	%g7,	%g4,	%o6
	edge8	%i3,	%o1,	%o3
	wr	%g0,	0x88,	%asi
	ldxa	[%l7 + 0x20] %asi,	%l6
	alignaddrl	%l0,	%i5,	%i0
	wr	%g0,	0x10,	%asi
	stwa	%o5,	[%l7 + 0x7C] %asi
	addccc	%i1,	%g5,	%g3
	srlx	%g1,	0x1D,	%o4
	udiv	%l1,	0x04B6,	%g6
	tpos	%icc,	0x0
	fbg	%fcc0,	loop_779
	movneg	%xcc,	%l4,	%l2
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
	edge16n	%i2,	%o2,	%o0
loop_779:
	alignaddrl	%g2,	%o7,	%l3
	sdivx	%i4,	0x0F4C,	%i6
loop_780:
	array32	%l5,	%i7,	%g4
	fornot1s	%f5,	%f30,	%f30
	fmovdle	%xcc,	%f12,	%f3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmpne32	%f6,	%f26,	%g7
	sdiv	%i3,	0x03ED,	%o6
	udiv	%o1,	0x0003,	%l6
	movcs	%icc,	%o3,	%l0
	set	0x18, %o6
	prefetcha	[%l7 + %o6] 0x10,	 0x0
	srl	%o5,	%i1,	%i5
	movn	%icc,	%g3,	%g5
	ba	loop_781
	and	%g1,	%o4,	%l1
	fba,a	%fcc0,	loop_782
	ldd	[%l7 + 0x70],	%f20
loop_781:
	popc	%l4,	%l2
	array16	%i2,	%o2,	%o0
loop_782:
	fbn,a	%fcc0,	loop_783
	movle	%xcc,	%g2,	%o7
	array32	%g6,	%i4,	%l3
	fmovdg	%xcc,	%f11,	%f21
loop_783:
	bcc,a,pn	%xcc,	loop_784
	addcc	%i6,	%l5,	%i7
	sdiv	%g7,	0x1824,	%i3
	bg,a	loop_785
loop_784:
	fands	%f7,	%f29,	%f29
	popc	0x00BC,	%o6
	fmovsn	%icc,	%f17,	%f23
loop_785:
	mulscc	%o1,	0x0E10,	%g4
	movn	%xcc,	%l6,	%l0
	fbn,a	%fcc1,	loop_786
	bcc,a,pn	%icc,	loop_787
	fbul,a	%fcc1,	loop_788
	bn,a	%icc,	loop_789
loop_786:
	umul	%o3,	%o5,	%i0
loop_787:
	tsubcc	%i5,	%g3,	%g5
loop_788:
	ba,a,pt	%xcc,	loop_790
loop_789:
	movvc	%icc,	%g1,	%o4
	fsrc1s	%f29,	%f0
	movvs	%icc,	%l1,	%l4
loop_790:
	movleu	%xcc,	%i1,	%l2
	ldub	[%l7 + 0x64],	%o2
	srlx	%o0,	%i2,	%o7
	tneg	%icc,	0x7
	mulx	%g6,	%i4,	%l3
	faligndata	%f0,	%f24,	%f16
	umulcc	%i6,	0x1ADD,	%l5
	srax	%i7,	0x1B,	%g7
	bshuffle	%f20,	%f18,	%f6
	sdiv	%i3,	0x1C2A,	%g2
	wr	%g0,	0x88,	%asi
	ldsba	[%l7 + 0x1B] %asi,	%o1
	smulcc	%g4,	0x099A,	%l6
	movrgz	%o6,	0x33E,	%o3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ld	[%l7 + 0x1C],	%f16
	fblg	%fcc0,	loop_791
	fcmple16	%f24,	%f2,	%l0
	wr	%g0,	0x0c,	%asi
	stda	%i0,	[%l7 + 0x18] %asi
loop_791:
	edge16n	%o5,	%i5,	%g5
	array8	%g1,	%o4,	%l1
	movge	%xcc,	%l4,	%i1
	edge16	%l2,	%o2,	%o0
	std	%g2,	[%l7 + 0x18]
	fblg	%fcc0,	loop_792
	fbuge	%fcc0,	loop_793
	tle	%xcc,	0x2
	movcs	%icc,	%i2,	%o7
loop_792:
	subcc	%g6,	%i4,	%l3
loop_793:
	fmul8x16al	%f17,	%f9,	%f18
	fxors	%f23,	%f19,	%f16
	edge32	%l5,	%i6,	%i7
	xnorcc	%i3,	0x0C99,	%g7
	ta	%xcc,	0x2
	movre	%o1,	%g4,	%g2
	fbule	%fcc2,	loop_794
	sdivcc	%l6,	0x051B,	%o6
	fmovsneg	%xcc,	%f27,	%f23
	bn	loop_795
loop_794:
	edge8l	%l0,	%o3,	%i0
	edge32l	%i5,	%o5,	%g1
	nop
	set	0x1C, %o4
	ldsw	[%l7 + %o4],	%o4
loop_795:
	for	%f18,	%f20,	%f12
	fxnor	%f8,	%f6,	%f26
	edge8	%l1,	%g5,	%l4
	bleu,a	%icc,	loop_796
	tcs	%xcc,	0x2
	bge,a,pt	%icc,	loop_797
	fmovspos	%icc,	%f12,	%f25
loop_796:
	nop
	add	%l7,	0x38,	%l6
	wr	%g0,	0x04,	%asi
	ldxa	[%l6] %asi,	%l2
	casxa	[%l6] %asi,	%l2,	%i1
loop_797:
	fcmpeq16	%f6,	%f22,	%o2
	fmovsle	%xcc,	%f27,	%f28
	mova	%xcc,	%g3,	%o0
	subc	%o7,	%g6,	%i4
	movrgez	%l3,	0x1FB,	%l5
	sdivx	%i2,	0x0ACD,	%i6
	andn	%i7,	%i3,	%g7
	ta	%xcc,	0x3
	fbue	%fcc2,	loop_798
	brnz	%g4,	loop_799
	edge8	%o1,	%g2,	%l6
	andn	%l0,	%o3,	%o6
loop_798:
	te	%xcc,	0x5
loop_799:
	xnorcc	%i0,	%i5,	%o5
	smul	%g1,	%l1,	%o4
	movrgz	%g5,	%l2,	%i1
	movrgz	%o2,	%l4,	%o0
	ldd	[%l7 + 0x78],	%f16
	fornot1	%f0,	%f26,	%f20
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tne	%xcc,	0x3
	add	%l7,	0x18,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%o7,	%g3
	tgu	%icc,	0x1
	tsubcc	%g6,	0x09EF,	%i4
	fbul,a	%fcc0,	loop_800
	taddcctv	%l3,	%i2,	%l5
	fbu	%fcc2,	loop_801
	fcmps	%fcc2,	%f22,	%f29
loop_800:
	ta	%xcc,	0x4
	movcc	%icc,	%i6,	%i7
loop_801:
	bge,a	loop_802
	fmovsa	%icc,	%f1,	%f29
	ldstub	[%l7 + 0x69],	%i3
	fmovscc	%xcc,	%f8,	%f15
loop_802:
	movcs	%icc,	%g4,	%g7
	fmovrslz	%g2,	%f31,	%f11
	mulx	%l6,	0x1031,	%o1
	ld	[%l7 + 0x68],	%f0
	xorcc	%o3,	%o6,	%l0
	tgu	%icc,	0x0
	faligndata	%f8,	%f30,	%f18
	andncc	%i5,	%i0,	%g1
	wr	%g0,	0x0c,	%asi
	lda	[%l7 + 0x10] %asi,	%f14
	fbuge,a	%fcc0,	loop_803
	xorcc	%o5,	0x1044,	%o4
	orncc	%l1,	%g5,	%i1
	bg,a,pn	%xcc,	loop_804
loop_803:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	lduh	[%l7 + 0x52],	%l2
	movre	%o2,	0x1F1,	%o0
loop_804:
	array32	%l4,	%g3,	%o7
	movrgz	%i4,	0x0A3,	%l3
	sllx	%i2,	%g6,	%l5
	udiv	%i6,	0x0F0C,	%i7
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x5E] %asi,	%g4
	wr	%g0,	0x04,	%asi
	stxa	%i3,	[%l7 + 0x60] %asi
	std	%g2,	[%l7 + 0x68]
	xorcc	%g7,	%o1,	%o3
	sdivcc	%o6,	0x1AF3,	%l0
	fcmple32	%f14,	%f24,	%l6
	fmovsgu	%xcc,	%f20,	%f7
	te	%xcc,	0x4
	ldstub	[%l7 + 0x5E],	%i5
	ba	loop_805
	edge8	%i0,	%o5,	%g1
	andn	%l1,	%o4,	%i1
	fmovrdlez	%g5,	%f0,	%f4
loop_805:
	ta	%icc,	0x6
	tg	%icc,	0x7
	bn	%icc,	loop_806
	membar	0x62
	fmovdvc	%xcc,	%f25,	%f12
	or	%l2,	0x11D0,	%o2
loop_806:
	movre	%l4,	%o0,	%o7
	add	%l7,	0x08,	%l6
	wr	%g0,	0x11,	%asi
	ldxa	[%l6] %asi,	%i4
	casxa	[%l6] 0x11,	%i4,	%g3
	movcc	%icc,	%l3,	%g6
	andcc	%i2,	%l5,	%i7
	srax	%i6,	%i3,	%g4
	subc	%g2,	%o1,	%o3
	nop
	setx	loop_807,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fors	%f31,	%f6,	%f26
	edge16ln	%g7,	%o6,	%l0
	fzero	%f14
loop_807:
	edge32	%l6,	%i5,	%o5
	fpsub16s	%f24,	%f1,	%f2
	fnot2s	%f26,	%f3
	edge32ln	%i0,	%l1,	%o4
	fcmpeq16	%f12,	%f22,	%i1
	movrlz	%g1,	%g5,	%o2
	edge16n	%l2,	%o0,	%o7
	fmovrde	%i4,	%f18,	%f8
	set	0x54, %g7
	ldswa	[%l7 + %g7] 0x14,	%g3
	fpackfix	%f22,	%f7
	tcs	%icc,	0x0
	wr	%g0,	0x22,	%asi
	stha	%l4,	[%l7 + 0x70] %asi
	membar	#Sync
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16l	%l3,	%g6,	%l5
	mova	%xcc,	%i7,	%i6
	brz	%i2,	loop_808
	tneg	%xcc,	0x3
	movcs	%xcc,	%g4,	%i3
	fpsub32	%f14,	%f12,	%f12
loop_808:
	nop
	wr	%g0,	0x80,	%asi
	swapa	[%l7 + 0x60] %asi,	%o1
	movvs	%icc,	%o3,	%g2
	movg	%xcc,	%o6,	%g7
	sdivx	%l6,	0x0E36,	%i5
	st	%f5,	[%l7 + 0x4C]
	tvs	%icc,	0x2
	mulscc	%l0,	0x1142,	%i0
	set	0x44, %i1
	stha	%o5,	[%l7 + %i1] 0x23
	membar	#Sync
	fble,a	%fcc1,	loop_809
	sll	%o4,	%i1,	%g1
	ta	%icc,	0x2
	wr	%g0,	0x23,	%asi
	stxa	%l1,	[%l7 + 0x10] %asi
	membar	#Sync
loop_809:
	nop
	wr	%g0,	0xeb,	%asi
	stda	%o2,	[%l7 + 0x58] %asi
	membar	#Sync
	movge	%xcc,	%g5,	%o0
	movne	%xcc,	%o7,	%i4
	set	0x68, %l5
	swapa	[%l7 + %l5] 0x11,	%l2
	fbne,a	%fcc1,	loop_810
	edge16n	%l4,	%l3,	%g3
	fcmpd	%fcc2,	%f18,	%f10
	movg	%icc,	%g6,	%i7
loop_810:
	movcc	%xcc,	%i6,	%l5
	edge16	%i2,	%i3,	%o1
	xnor	%g4,	%g2,	%o6
	andncc	%o3,	%l6,	%i5
	wr	%g0,	0x2f,	%asi
	stba	%g7,	[%l7 + 0x68] %asi
	membar	#Sync
	fornot1s	%f16,	%f18,	%f20
	fmovsl	%xcc,	%f20,	%f14
	tg	%icc,	0x0
	set	0x78, %i0
	prefetcha	[%l7 + %i0] 0x15,	 0x2
	ldx	[%l7 + 0x58],	%o5
	edge16	%o4,	%l0,	%g1
	add	%i1,	0x1FA7,	%o2
	movne	%icc,	%l1,	%o0
	add	%l7,	0x08,	%l6
	wr	%g0,	0x04,	%asi
	casa	[%l6] 0x04,	%g5,	%i4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orn	%o7,	%l4,	%l2
	set	0x4C, %o3
	stwa	%l3,	[%l7 + %o3] 0x23
	membar	#Sync
	or	%g3,	%i7,	%i6
	andcc	%l5,	%g6,	%i3
	fpackfix	%f0,	%f13
	movle	%icc,	%o1,	%g4
	fmovdcs	%icc,	%f21,	%f29
	movrgez	%i2,	0x15B,	%g2
	fbge,a	%fcc2,	loop_811
	mulscc	%o3,	0x092B,	%l6
	orcc	%i5,	0x112D,	%g7
	mova	%icc,	%o6,	%i0
loop_811:
	movneg	%icc,	%o4,	%l0
	movl	%xcc,	%o5,	%g1
	bne,a	loop_812
	bne,a,pn	%xcc,	loop_813
	tn	%xcc,	0x7
	edge16	%o2,	%i1,	%o0
loop_812:
	andcc	%l1,	0x1B70,	%i4
loop_813:
	fpsub16s	%f2,	%f30,	%f27
	srl	%g5,	%o7,	%l4
	fmovdpos	%icc,	%f2,	%f24
	orcc	%l3,	%l2,	%i7
	udivx	%g3,	0x13C7,	%i6
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
	add	%l5,	%i3,	%o1
	move	%xcc,	%g6,	%g4
	bshuffle	%f4,	%f14,	%f26
loop_814:
	fmovrsgz	%g2,	%f31,	%f20
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orncc	%o3,	0x0BD2,	%l6
	brgz	%i2,	loop_815
	edge8	%g7,	%o6,	%i0
	bge,pn	%icc,	loop_816
	fzero	%f4
loop_815:
	fmovdvs	%icc,	%f0,	%f28
	srl	%i5,	%o4,	%l0
loop_816:
	tneg	%xcc,	0x1
	fandnot2s	%f0,	%f22,	%f2
	movg	%icc,	%o5,	%g1
	sll	%o2,	0x14,	%o0
	edge32	%i1,	%i4,	%g5
	fexpand	%f20,	%f10
	fnot2s	%f29,	%f9
	alignaddr	%l1,	%l4,	%o7
	smulcc	%l2,	0x0638,	%i7
	set	0x40, %l6
	stda	%f0,	[%l7 + %l6] 0x81
	movn	%icc,	%g3,	%l3
	sdivcc	%i6,	0x1612,	%l5
	fbn,a	%fcc2,	loop_817
	bshuffle	%f0,	%f18,	%f4
	movpos	%icc,	%i3,	%g6
	fbl,a	%fcc3,	loop_818
loop_817:
	srlx	%o1,	%g2,	%g4
	sdiv	%o3,	0x1974,	%l6
	bvs	%xcc,	loop_819
loop_818:
	alignaddrl	%i2,	%g7,	%o6
	edge8l	%i5,	%o4,	%i0
	fbe	%fcc1,	loop_820
loop_819:
	tcs	%xcc,	0x7
	fones	%f22
	bvs,pn	%xcc,	loop_821
loop_820:
	movcc	%icc,	%l0,	%g1
	fmovd	%f6,	%f0
	sllx	%o2,	%o0,	%i1
loop_821:
	brgez,a	%o5,	loop_822
	andn	%i4,	0x0C3E,	%g5
	taddcctv	%l1,	0x1EDD,	%l4
	edge32	%l2,	%o7,	%i7
loop_822:
	tcc	%xcc,	0x7
	move	%xcc,	%g3,	%i6
	ldsh	[%l7 + 0x10],	%l5
	andncc	%l3,	%i3,	%o1
	swap	[%l7 + 0x30],	%g6
	bneg	loop_823
	fba	%fcc2,	loop_824
	subccc	%g4,	%g2,	%o3
	tleu	%icc,	0x3
loop_823:
	fmovrdne	%l6,	%f14,	%f6
loop_824:
	lduw	[%l7 + 0x18],	%g7
	tl	%icc,	0x3
	swap	[%l7 + 0x64],	%o6
	swap	[%l7 + 0x14],	%i2
	movrlz	%o4,	0x050,	%i0
	mulscc	%i5,	0x0222,	%l0
	fmovde	%icc,	%f29,	%f2
	tvs	%xcc,	0x4
	faligndata	%f30,	%f18,	%f22
	tcs	%icc,	0x7
	wr	%g0,	0x89,	%asi
	ldswa	[%l7 + 0x30] %asi,	%g1
	bvc,a,pn	%xcc,	loop_825
	call	loop_826
	fmovsne	%xcc,	%f31,	%f4
	addcc	%o2,	0x028F,	%i1
loop_825:
	nop
	set	0x7A, %i7
	ldstuba	[%l7 + %i7] 0x18,	%o5
loop_826:
	move	%icc,	%i4,	%o0
	ldub	[%l7 + 0x26],	%l1
	fcmpne32	%f4,	%f18,	%g5
	ta	%icc,	0x1
	edge16n	%l4,	%l2,	%o7
	subcc	%i7,	0x1479,	%i6
	fbule	%fcc1,	loop_827
	sll	%g3,	0x18,	%l5
	movcc	%xcc,	%i3,	%l3
	tg	%icc,	0x5
loop_827:
	andn	%o1,	0x1A47,	%g6
	bgu,pt	%icc,	loop_828
	sra	%g4,	0x1B,	%g2
	wr	%g0,	0x80,	%asi
	lduwa	[%l7 + 0x48] %asi,	%l6
loop_828:
	bg	%xcc,	loop_829
	movneg	%icc,	%o3,	%o6
	ldx	[%l7 + 0x18],	%g7
	fpsub32s	%f24,	%f29,	%f8
loop_829:
	fcmple16	%f0,	%f20,	%o4
	orcc	%i0,	%i5,	%l0
	add	%i2,	%o2,	%g1
	or	%o5,	%i4,	%i1
	ldub	[%l7 + 0x5B],	%l1
	smul	%g5,	0x1117,	%o0
	edge16l	%l4,	%l2,	%o7
	bl,pt	%xcc,	loop_830
	fmovdge	%xcc,	%f19,	%f0
	movle	%xcc,	%i6,	%i7
	fpadd16	%f2,	%f12,	%f0
loop_830:
	movcs	%xcc,	%g3,	%i3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	popc	0x1472,	%l5
	movle	%icc,	%l3,	%g6
	fornot2	%f2,	%f20,	%f30
	sll	%g4,	0x07,	%o1
	tneg	%icc,	0x5
	andncc	%l6,	%g2,	%o6
	tgu	%icc,	0x2
	bne,a	loop_831
	fmovrdne	%g7,	%f12,	%f18
	sth	%o3,	[%l7 + 0x4C]
	subcc	%o4,	%i0,	%i5
loop_831:
	std	%i2,	[%l7 + 0x10]
	udiv	%l0,	0x1F27,	%g1
	tleu	%xcc,	0x7
	movrgz	%o5,	%i4,	%o2
	sub	%i1,	%g5,	%o0
	mova	%icc,	%l4,	%l1
	st	%f23,	[%l7 + 0x0C]
	fmovrsgez	%l2,	%f26,	%f5
	movleu	%xcc,	%i6,	%i7
	set	0x45, %i5
	lduba	[%l7 + %i5] 0x88,	%g3
	fbl,a	%fcc0,	loop_832
	srax	%i3,	0x0D,	%o7
	movvc	%icc,	%l3,	%l5
	bge,pt	%icc,	loop_833
loop_832:
	fbge	%fcc1,	loop_834
	orcc	%g4,	%o1,	%g6
	set	0x30, %i2
	ldda	[%l7 + %i2] 0x23,	%i6
loop_833:
	xorcc	%g2,	%o6,	%g7
loop_834:
	fmovrslez	%o4,	%f1,	%f15
	movre	%o3,	0x27D,	%i0
	mova	%xcc,	%i2,	%l0
	edge32ln	%i5,	%g1,	%i4
	edge16	%o2,	%o5,	%i1
	tvs	%icc,	0x6
	mulx	%o0,	%g5,	%l1
	array32	%l2,	%i6,	%l4
	ta	%icc,	0x6
	orn	%g3,	%i7,	%o7
	andncc	%i3,	%l3,	%l5
	stb	%o1,	[%l7 + 0x76]
	fxnors	%f26,	%f11,	%f24
	movcs	%xcc,	%g4,	%l6
	stx	%g6,	[%l7 + 0x20]
	nop
	set	0x68, %g1
	lduw	[%l7 + %g1],	%g2
	xnor	%g7,	0x0A90,	%o4
	fmuld8ulx16	%f26,	%f0,	%f6
	lduh	[%l7 + 0x44],	%o6
	fmul8ulx16	%f16,	%f16,	%f4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	smul	%o3,	0x1C0E,	%i2
	fexpand	%f19,	%f14
	fcmpgt16	%f8,	%f30,	%i0
	fpadd32	%f28,	%f4,	%f28
	tpos	%icc,	0x5
	set	0x7A, %o1
	ldstuba	[%l7 + %o1] 0x0c,	%l0
	alignaddrl	%g1,	%i5,	%i4
	edge32l	%o2,	%o5,	%i1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8l	%o0,	%g5,	%l1
	movrlez	%i6,	0x2A5,	%l2
	umulcc	%g3,	%i7,	%l4
	fcmpeq32	%f24,	%f24,	%o7
	fmovsvc	%icc,	%f27,	%f4
	ld	[%l7 + 0x18],	%f29
	movcc	%xcc,	%i3,	%l3
	fpmerge	%f19,	%f23,	%f8
	ta	%icc,	0x3
	movge	%icc,	%l5,	%o1
	sdiv	%g4,	0x1D8C,	%l6
	wr	%g0,	0x4f,	%asi
	stxa	%g2,	[%g0 + 0x0] %asi
	wr	%g0,	0x23,	%asi
	stba	%g7,	[%l7 + 0x3A] %asi
	membar	#Sync
	fbug,a	%fcc0,	loop_835
	andn	%o4,	0x19B4,	%g6
	xnorcc	%o3,	%o6,	%i0
	set	0x70, %g4
	swapa	[%l7 + %g4] 0x0c,	%l0
loop_835:
	addccc	%i2,	%g1,	%i4
	fnegd	%f16,	%f8
	mulscc	%i5,	0x0ECC,	%o5
	fcmpne32	%f28,	%f10,	%i1
	fpsub16s	%f8,	%f24,	%f25
	fmovsvc	%icc,	%f22,	%f12
	fmovsg	%icc,	%f31,	%f4
	movrgez	%o2,	%o0,	%l1
	wr	%g0,	0x10,	%asi
	ldsba	[%l7 + 0x71] %asi,	%g5
	edge32l	%l2,	%i6,	%i7
	fmovrdne	%l4,	%f12,	%f10
	sdiv	%o7,	0x0B50,	%i3
	edge8l	%l3,	%g3,	%o1
	srlx	%g4,	%l5,	%g2
	tl	%icc,	0x7
	movg	%icc,	%l6,	%g7
	popc	0x1A05,	%o4
	fmovsge	%icc,	%f4,	%f17
	fbue	%fcc2,	loop_836
	prefetch	[%l7 + 0x14],	 0x1
	move	%icc,	%o3,	%o6
	fmovrdgez	%i0,	%f4,	%f4
loop_836:
	movrgz	%g6,	0x067,	%i2
	fcmpne16	%f18,	%f8,	%g1
	fbl,a	%fcc2,	loop_837
	add	%i4,	0x087E,	%i5
	edge8ln	%l0,	%o5,	%o2
	edge16n	%o0,	%i1,	%g5
loop_837:
	udivx	%l1,	0x1317,	%i6
	addcc	%i7,	%l2,	%l4
	tvs	%icc,	0x2
	edge32l	%o7,	%i3,	%l3
	ldd	[%l7 + 0x78],	%f0
	andcc	%g3,	0x0809,	%o1
	fmovrse	%l5,	%f29,	%f10
	ldx	[%l7 + 0x70],	%g2
	edge16	%l6,	%g4,	%g7
	prefetch	[%l7 + 0x54],	 0x0
	andcc	%o3,	%o4,	%i0
	stw	%g6,	[%l7 + 0x38]
	call	loop_838
	fmovdvs	%icc,	%f19,	%f14
	movcs	%icc,	%i2,	%g1
	te	%xcc,	0x4
loop_838:
	fnor	%f18,	%f18,	%f28
	tl	%xcc,	0x7
	smul	%i4,	0x06C4,	%o6
	std	%f28,	[%l7 + 0x68]
	fpackfix	%f24,	%f22
	xor	%i5,	%o5,	%o2
	bne	%icc,	loop_839
	mulscc	%o0,	0x0410,	%l0
	fnegs	%f19,	%f31
	edge32	%i1,	%g5,	%l1
loop_839:
	tle	%xcc,	0x6
	brnz,a	%i6,	loop_840
	tpos	%icc,	0x2
	edge8	%l2,	%l4,	%i7
	umul	%i3,	0x060D,	%o7
loop_840:
	movneg	%icc,	%l3,	%g3
	be,a	loop_841
	fpadd32	%f30,	%f10,	%f12
	fbl	%fcc1,	loop_842
	array8	%o1,	%l5,	%l6
loop_841:
	lduw	[%l7 + 0x0C],	%g4
	tpos	%icc,	0x5
loop_842:
	nop
	set	0x5C, %o5
	lduha	[%l7 + %o5] 0x14,	%g7
	alignaddr	%g2,	%o3,	%o4
	lduw	[%l7 + 0x24],	%i0
	sdivx	%i2,	0x1168,	%g6
	fmovdleu	%icc,	%f19,	%f17
	fmovs	%f3,	%f6
	edge32l	%g1,	%o6,	%i4
	movrne	%o5,	%i5,	%o0
	edge8ln	%l0,	%o2,	%i1
	fmovrdne	%g5,	%f20,	%f16
	sdivx	%i6,	0x14E2,	%l1
	fbu	%fcc3,	loop_843
	subccc	%l4,	%i7,	%i3
	tn	%icc,	0x3
	movre	%l2,	0x3C6,	%l3
loop_843:
	fbuge,a	%fcc0,	loop_844
	brlez	%g3,	loop_845
	fmovsle	%xcc,	%f16,	%f21
	bcc	loop_846
loop_844:
	alignaddrl	%o7,	%o1,	%l5
loop_845:
	edge16ln	%g4,	%g7,	%l6
	andncc	%o3,	%g2,	%o4
loop_846:
	fbe	%fcc1,	loop_847
	flush	%l7 + 0x74
	or	%i0,	0x0A69,	%g6
	lduw	[%l7 + 0x60],	%g1
loop_847:
	sub	%o6,	%i2,	%o5
	fba,a	%fcc2,	loop_848
	xorcc	%i4,	0x0F54,	%i5
	movg	%icc,	%l0,	%o0
	or	%o2,	%i1,	%g5
loop_848:
	nop
	wr	%g0,	0x88,	%asi
	ldswa	[%l7 + 0x58] %asi,	%l1
	movpos	%xcc,	%i6,	%i7
	fble,a	%fcc0,	loop_849
	tcc	%icc,	0x0
	movn	%icc,	%l4,	%l2
	fmovrsgez	%i3,	%f12,	%f1
loop_849:
	sra	%g3,	%o7,	%o1
	movneg	%icc,	%l5,	%g4
	sdiv	%l3,	0x0EF4,	%l6
	edge8ln	%g7,	%g2,	%o4
	fmovrde	%o3,	%f14,	%f24
	movneg	%icc,	%g6,	%i0
	fmovdcc	%xcc,	%f14,	%f12
	movrgez	%o6,	0x23C,	%g1
	orcc	%o5,	0x0AC7,	%i4
	brnz	%i5,	loop_850
	movrlz	%l0,	0x29A,	%i2
	fbuge,a	%fcc0,	loop_851
	ta	%xcc,	0x0
loop_850:
	edge8	%o0,	%i1,	%g5
	movge	%xcc,	%l1,	%o2
loop_851:
	fmul8x16au	%f31,	%f9,	%f14
	movge	%xcc,	%i6,	%l4
	te	%icc,	0x0
	movpos	%xcc,	%l2,	%i3
	movleu	%icc,	%g3,	%o7
	fblg	%fcc1,	loop_852
	edge16	%o1,	%i7,	%g4
	movrgez	%l3,	0x095,	%l6
	fmovdne	%xcc,	%f31,	%f0
loop_852:
	and	%l5,	%g2,	%o4
	fmovrdgez	%g7,	%f10,	%f4
	movpos	%icc,	%o3,	%g6
	andcc	%i0,	0x12E4,	%o6
	nop
	setx	loop_853,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	sll	%g1,	%i4,	%i5
	sethi	0x0E1B,	%l0
	tvc	%xcc,	0x7
loop_853:
	bpos,a,pn	%xcc,	loop_854
	ta	%xcc,	0x0
	movg	%icc,	%o5,	%i2
	move	%xcc,	%o0,	%i1
loop_854:
	movleu	%icc,	%l1,	%o2
	fones	%f22
	xorcc	%i6,	%l4,	%l2
	fble	%fcc3,	loop_855
	movrlez	%g5,	0x33B,	%i3
	addccc	%o7,	0x026C,	%o1
	st	%f7,	[%l7 + 0x5C]
loop_855:
	st	%f31,	[%l7 + 0x18]
	fbu	%fcc2,	loop_856
	udiv	%g3,	0x06A6,	%g4
	movre	%i7,	%l6,	%l3
	tl	%xcc,	0x4
loop_856:
	movrlez	%g2,	0x1AC,	%o4
	smulcc	%g7,	0x0EE0,	%l5
	wr	%g0,	0x88,	%asi
	stba	%g6,	[%l7 + 0x2E] %asi
	stb	%i0,	[%l7 + 0x37]
	wr	%g0,	0x80,	%asi
	prefetcha	[%l7 + 0x10] %asi,	 0x0
	fmovsle	%icc,	%f2,	%f8
	movrlez	%o6,	0x328,	%g1
	subccc	%i4,	%l0,	%o5
	mulx	%i5,	0x09A5,	%o0
	movcc	%icc,	%i1,	%l1
	sdiv	%o2,	0x1F56,	%i6
	movre	%l4,	0x172,	%l2
	movneg	%icc,	%g5,	%i2
	tleu	%xcc,	0x1
	stbar
	movrgez	%i3,	0x1C0,	%o7
	sllx	%g3,	%g4,	%i7
	fpadd32	%f22,	%f0,	%f30
	edge8n	%l6,	%l3,	%g2
	orn	%o1,	%o4,	%g7
	and	%g6,	%l5,	%o3
	membar	#Sync
	wr	%g0,	0x17,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	fnor	%f2,	%f24,	%f24
	brz	%o6,	loop_857
	stbar
	fbul,a	%fcc2,	loop_858
	movvc	%icc,	%g1,	%i4
loop_857:
	move	%xcc,	%l0,	%i0
	andcc	%i5,	0x1FB4,	%o0
loop_858:
	fmul8sux16	%f2,	%f16,	%f22
	edge8	%i1,	%o5,	%l1
	smul	%i6,	%l4,	%l2
	srax	%o2,	%g5,	%i2
	ldstub	[%l7 + 0x3B],	%i3
	move	%xcc,	%g3,	%o7
	movgu	%icc,	%i7,	%l6
	fmovrdgz	%g4,	%f2,	%f6
	movgu	%xcc,	%l3,	%g2
	movpos	%icc,	%o4,	%g7
	prefetch	[%l7 + 0x28],	 0x1
	subcc	%g6,	%o1,	%l5
	fbue	%fcc0,	loop_859
	tneg	%xcc,	0x5
	fmovdl	%xcc,	%f30,	%f12
	pdist	%f30,	%f30,	%f16
loop_859:
	subcc	%o6,	%o3,	%i4
	flush	%l7 + 0x5C
	wr	%g0,	0x81,	%asi
	sta	%f22,	[%l7 + 0x6C] %asi
	std	%f6,	[%l7 + 0x30]
	bneg,a	loop_860
	brgez,a	%g1,	loop_861
	movgu	%icc,	%i0,	%l0
	edge8n	%o0,	%i5,	%o5
loop_860:
	add	%i1,	0x1139,	%i6
loop_861:
	brgez,a	%l1,	loop_862
	movrgz	%l2,	0x23F,	%l4
	xor	%o2,	%i2,	%i3
	fbl	%fcc2,	loop_863
loop_862:
	fmovsa	%icc,	%f21,	%f3
	std	%f30,	[%l7 + 0x70]
	tcc	%xcc,	0x7
loop_863:
	fmovdgu	%xcc,	%f25,	%f30
	sll	%g5,	%g3,	%i7
	udivcc	%o7,	0x0649,	%g4
	fmovsn	%xcc,	%f18,	%f31
	brlz	%l3,	loop_864
	subccc	%l6,	%o4,	%g2
	srax	%g7,	0x19,	%g6
	fmul8ulx16	%f8,	%f20,	%f2
loop_864:
	smulcc	%l5,	%o1,	%o3
	edge16n	%o6,	%g1,	%i0
	fmuld8sux16	%f10,	%f24,	%f0
	bgu	loop_865
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	set	0x64, %i3
	ldub	[%l7 + %i3],	%i4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_865:
	movrlz	%l0,	%o0,	%i5
	tneg	%xcc,	0x7
	array8	%i1,	%i6,	%l1
	udivcc	%o5,	0x0B67,	%l4
	movneg	%xcc,	%l2,	%o2
	tsubcc	%i3,	%g5,	%i2
	set	0x08, %g5
	stda	%i6,	[%l7 + %g5] 0x2f
	membar	#Sync
	smul	%g3,	0x13DA,	%g4
	fmovdvc	%xcc,	%f7,	%f12
	xnorcc	%l3,	%o7,	%l6
	movrlz	%g2,	%g7,	%o4
	fzero	%f30
	tvc	%xcc,	0x3
	fmovdpos	%icc,	%f29,	%f14
	fba	%fcc3,	loop_866
	xnor	%g6,	0x081B,	%o1
	fpsub16s	%f11,	%f13,	%f0
	ble,a,pn	%xcc,	loop_867
loop_866:
	for	%f24,	%f24,	%f8
	set	0x0C, %o0
	swapa	[%l7 + %o0] 0x89,	%l5
loop_867:
	subcc	%o6,	%g1,	%o3
	movcc	%icc,	%i4,	%i0
	movcc	%icc,	%o0,	%l0
	set	0x10, %i6
	sta	%f21,	[%l7 + %i6] 0x18
	ld	[%l7 + 0x20],	%f19
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fba,a	%fcc0,	loop_868
	movpos	%icc,	%i5,	%i6
	fxnors	%f22,	%f5,	%f8
	and	%l1,	%i1,	%l4
loop_868:
	sllx	%o5,	0x18,	%l2
	nop
	set	0x60, %g2
	std	%f24,	[%l7 + %g2]
	movre	%o2,	0x2EC,	%g5
	srl	%i3,	0x1F,	%i7
	udivcc	%g3,	0x1935,	%i2
	fbg	%fcc3,	loop_869
	sub	%g4,	%o7,	%l3
	fmovrdgez	%g2,	%f16,	%f14
	move	%icc,	%l6,	%o4
loop_869:
	sdiv	%g6,	0x012D,	%g7
	fmovdvs	%xcc,	%f16,	%f15
	sir	0x0472
	udivcc	%o1,	0x07D9,	%o6
	fnot1s	%f26,	%f11
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8n	%l5,	%o3,	%g1
	movn	%icc,	%i0,	%o0
	movcs	%icc,	%l0,	%i5
	movvs	%icc,	%i4,	%i6
	subccc	%l1,	0x09C0,	%i1
	fmovse	%icc,	%f17,	%f18
	fzeros	%f18
	ldx	[%l7 + 0x18],	%o5
	movre	%l4,	%o2,	%l2
	swap	[%l7 + 0x10],	%g5
	wr	%g0,	0x80,	%asi
	ldsba	[%l7 + 0x78] %asi,	%i7
	te	%icc,	0x4
	fmovd	%f8,	%f26
	ld	[%l7 + 0x2C],	%f7
	tcs	%icc,	0x1
	brlez	%i3,	loop_870
	movvc	%xcc,	%i2,	%g3
	mulx	%o7,	0x0C32,	%l3
	movrgez	%g4,	%l6,	%o4
loop_870:
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
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movle	%icc,	%g2,	%g7
	sdivcc	%g6,	0x14F8,	%o1
loop_871:
	fandnot2	%f10,	%f12,	%f0
	movrne	%l5,	%o3,	%g1
	wr	%g0,	0x11,	%asi
	ldswa	[%l7 + 0x60] %asi,	%o6
	ldub	[%l7 + 0x4C],	%i0
	sllx	%o0,	%l0,	%i4
	movrlez	%i6,	%l1,	%i5
	tcc	%icc,	0x6
	srl	%i1,	0x0D,	%o5
	array32	%l4,	%o2,	%g5
	fmovsleu	%icc,	%f2,	%f2
	movvs	%xcc,	%i7,	%l2
	tge	%icc,	0x7
	fmovscs	%icc,	%f30,	%f22
	tge	%icc,	0x4
	mova	%xcc,	%i2,	%g3
	array16	%o7,	%l3,	%g4
	tn	%icc,	0x5
	array8	%l6,	%i3,	%o4
	std	%f8,	[%l7 + 0x68]
	ldub	[%l7 + 0x5D],	%g7
	fzeros	%f23
	and	%g6,	0x15D6,	%o1
	umulcc	%g2,	%o3,	%l5
	wr	%g0,	0xe3,	%asi
	stha	%o6,	[%l7 + 0x26] %asi
	membar	#Sync
	or	%g1,	%o0,	%l0
	membar	#Sync
	wr	%g0,	0x16,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	xnor	%i0,	%i6,	%i4
	edge16ln	%i5,	%i1,	%o5
	tne	%icc,	0x4
	and	%l4,	0x15A7,	%o2
	membar	0x5D
	fmovdcc	%icc,	%f27,	%f20
	fmovsl	%icc,	%f24,	%f3
	tcc	%icc,	0x0
	sth	%l1,	[%l7 + 0x5C]
	add	%i7,	%g5,	%i2
	fbn,a	%fcc2,	loop_872
	stbar
	andn	%l2,	0x19D9,	%o7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_872:
	movneg	%icc,	%l3,	%g4
	alignaddrl	%l6,	%i3,	%g3
	ldd	[%l7 + 0x40],	%g6
	sllx	%o4,	0x0B,	%g6
	fbul	%fcc0,	loop_873
	movle	%icc,	%o1,	%o3
	bpos,a	loop_874
	fmovdleu	%xcc,	%f8,	%f13
loop_873:
	brgz,a	%l5,	loop_875
	movg	%icc,	%g2,	%o6
loop_874:
	sdivx	%o0,	0x0412,	%g1
	subccc	%i0,	0x03E9,	%i6
loop_875:
	tneg	%xcc,	0x2
	fmovrsgz	%i4,	%f18,	%f4
	movvs	%xcc,	%i5,	%l0
	tge	%icc,	0x5
	ldsw	[%l7 + 0x64],	%o5
	fzero	%f30
	movrgez	%l4,	0x3A4,	%o2
	edge8	%l1,	%i7,	%i1
	addcc	%g5,	%l2,	%o7
	fbn	%fcc0,	loop_876
	edge32	%l3,	%i2,	%g4
	ldx	[%l7 + 0x40],	%l6
	umul	%i3,	0x11A9,	%g3
loop_876:
	subccc	%g7,	%g6,	%o1
	brlz	%o3,	loop_877
	ta	%icc,	0x3
	sethi	0x0405,	%o4
	fmovsne	%icc,	%f13,	%f18
loop_877:
	orcc	%l5,	%g2,	%o6
	fnor	%f24,	%f30,	%f14
	nop
	set	0x40, %l2
	ldd	[%l7 + %l2],	%f20
	set	0x2B, %i4
	lduba	[%l7 + %i4] 0x14,	%o0
	fbule	%fcc3,	loop_878
	tl	%xcc,	0x1
	be	loop_879
	ldd	[%l7 + 0x38],	%g0
loop_878:
	brgez,a	%i6,	loop_880
	stw	%i0,	[%l7 + 0x5C]
loop_879:
	bne,a	loop_881
	bgu,pt	%icc,	loop_882
loop_880:
	fblg,a	%fcc1,	loop_883
	fmovrslez	%i4,	%f28,	%f26
loop_881:
	fmovdcs	%icc,	%f25,	%f5
loop_882:
	movre	%i5,	0x1E1,	%l0
loop_883:
	fbue,a	%fcc2,	loop_884
	and	%o5,	0x048D,	%o2
	movne	%xcc,	%l4,	%i7
	movge	%xcc,	%l1,	%i1
loop_884:
	popc	0x1A1F,	%g5
	fmovrdgez	%o7,	%f20,	%f30
	and	%l3,	0x0C0D,	%i2
	addcc	%g4,	0x0E33,	%l6
	bn,pn	%icc,	loop_885
	movrne	%l2,	%g3,	%g7
	edge32l	%g6,	%o1,	%o3
	edge16n	%o4,	%i3,	%l5
loop_885:
	xnorcc	%g2,	%o0,	%o6
	edge16l	%i6,	%g1,	%i0
	edge8l	%i4,	%i5,	%o5
	xorcc	%o2,	%l4,	%i7
	alignaddrl	%l0,	%l1,	%g5
	bge	%xcc,	loop_886
	stw	%i1,	[%l7 + 0x50]
	bneg,a,pt	%xcc,	loop_887
	mulscc	%l3,	0x0FA7,	%o7
loop_886:
	bg,a,pn	%xcc,	loop_888
	array16	%i2,	%l6,	%l2
loop_887:
	fmovdgu	%xcc,	%f25,	%f19
	mova	%xcc,	%g4,	%g7
loop_888:
	movneg	%xcc,	%g3,	%g6
	bpos	%icc,	loop_889
	ba,pn	%icc,	loop_890
	te	%icc,	0x1
	bcc,a	%icc,	loop_891
loop_889:
	srlx	%o1,	0x13,	%o3
loop_890:
	ldub	[%l7 + 0x6A],	%i3
	brnz	%o4,	loop_892
loop_891:
	movle	%icc,	%g2,	%l5
	edge16n	%o0,	%o6,	%i6
	udivcc	%i0,	0x1AAE,	%g1
loop_892:
	tn	%xcc,	0x0
	edge16ln	%i4,	%o5,	%o2
	movvc	%icc,	%l4,	%i5
	edge32n	%l0,	%i7,	%l1
	smulcc	%i1,	0x081E,	%l3
	fcmple32	%f4,	%f12,	%g5
	array16	%o7,	%i2,	%l6
	popc	0x0DD5,	%l2
	movcs	%icc,	%g7,	%g4
	addc	%g6,	%g3,	%o1
	udivcc	%i3,	0x10BD,	%o4
	bcs,a,pt	%xcc,	loop_893
	orcc	%o3,	0x1593,	%l5
	fmovde	%xcc,	%f3,	%f21
	lduw	[%l7 + 0x48],	%g2
loop_893:
	nop
	set	0x20, %g3
	sta	%f3,	[%l7 + %g3] 0x88
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bcc,pt	%icc,	loop_894
	prefetch	[%l7 + 0x4C],	 0x1
	srl	%o0,	%o6,	%i0
	fcmple16	%f26,	%f24,	%i6
loop_894:
	ldsh	[%l7 + 0x16],	%g1
	ba,a	%icc,	loop_895
	tsubcc	%o5,	%i4,	%o2
	fornot1	%f12,	%f30,	%f4
	smul	%l4,	%i5,	%l0
loop_895:
	sethi	0x1217,	%l1
	mulx	%i7,	0x0411,	%l3
	edge8n	%g5,	%i1,	%o7
	nop
	setx	loop_896,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	addccc	%i2,	0x0759,	%l2
	fbul,a	%fcc2,	loop_897
	brgez	%g7,	loop_898
loop_896:
	bvc	loop_899
	xorcc	%l6,	%g6,	%g4
loop_897:
	fmovsvc	%xcc,	%f12,	%f30
loop_898:
	ta	%icc,	0x6
loop_899:
	stbar
	faligndata	%f26,	%f2,	%f26
	set	0x24, %l1
	sta	%f6,	[%l7 + %l1] 0x89
	alignaddrl	%o1,	%g3,	%o4
	sub	%i3,	%o3,	%g2
	edge16n	%l5,	%o0,	%i0
	taddcctv	%o6,	0x1AF0,	%i6
	alignaddrl	%o5,	%g1,	%o2
	tvs	%icc,	0x1
	and	%l4,	0x1141,	%i4
	edge8n	%l0,	%l1,	%i5
	fzeros	%f31
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	umulcc	%i7,	%g5,	%i1
	fmuld8ulx16	%f21,	%f14,	%f12
	fcmpgt32	%f12,	%f10,	%o7
	fzero	%f28
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	setx loop_900, %l0, %l1
	jmpl %l1, %i2
	stw	%l3,	[%l7 + 0x4C]
	mulx	%l2,	%g7,	%l6
	edge8l	%g6,	%g4,	%g3
loop_900:
	movvc	%icc,	%o4,	%o1
	flush	%l7 + 0x34
	or	%o3,	%i3,	%l5
	membar	0x06
	movge	%xcc,	%o0,	%i0
	ldx	[%l7 + 0x38],	%g2
	addc	%i6,	%o6,	%g1
	tsubcc	%o2,	0x0E3D,	%l4
	fzeros	%f14
	edge16	%o5,	%l0,	%l1
	fbue,a	%fcc0,	loop_901
	edge32n	%i5,	%i4,	%g5
	addcc	%i1,	0x0037,	%i7
	fmovrdgez	%o7,	%f20,	%f8
loop_901:
	fmovrdne	%l3,	%f8,	%f14
	movneg	%icc,	%l2,	%i2
	tvc	%icc,	0x6
	edge8l	%l6,	%g7,	%g6
	fcmpes	%fcc3,	%f18,	%f19
	fpadd32	%f20,	%f26,	%f20
	fbl,a	%fcc1,	loop_902
	array32	%g3,	%o4,	%o1
	movvc	%xcc,	%g4,	%i3
	set	0x3B, %l0
	ldsba	[%l7 + %l0] 0x04,	%l5
loop_902:
	xorcc	%o0,	%o3,	%i0
	movcs	%icc,	%i6,	%o6
	set	0x20, %l3
	lda	[%l7 + %l3] 0x88,	%f5
	srlx	%g2,	%o2,	%g1
	movpos	%icc,	%o5,	%l4
	fcmpne32	%f16,	%f24,	%l0
	wr	%g0,	0x88,	%asi
	lduba	[%l7 + 0x7C] %asi,	%l1
	fbuge,a	%fcc0,	loop_903
	edge8	%i4,	%g5,	%i1
	movn	%icc,	%i7,	%i5
	stb	%l3,	[%l7 + 0x42]
loop_903:
	bleu,a	%icc,	loop_904
	edge16	%o7,	%i2,	%l6
	xnor	%g7,	0x15AE,	%g6
	fbuge,a	%fcc2,	loop_905
loop_904:
	fmovs	%f26,	%f12
	fmovsa	%icc,	%f29,	%f6
	sra	%g3,	0x0D,	%o4
loop_905:
	fmovrdlz	%o1,	%f26,	%f18
	and	%l2,	0x1D8F,	%g4
	fcmpes	%fcc3,	%f19,	%f7
	array32	%i3,	%l5,	%o0
	bcs,a	loop_906
	bneg,a,pt	%icc,	loop_907
	fbue,a	%fcc1,	loop_908
	movpos	%xcc,	%o3,	%i0
loop_906:
	ldstub	[%l7 + 0x4C],	%o6
loop_907:
	movl	%xcc,	%i6,	%o2
loop_908:
	fnand	%f24,	%f20,	%f14
	edge32l	%g2,	%o5,	%g1
	tleu	%icc,	0x7
	movvc	%xcc,	%l0,	%l4
	edge8ln	%i4,	%l1,	%i1
	tgu	%icc,	0x5
	nop
	setx	loop_909,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movvc	%icc,	%i7,	%g5
	edge8ln	%l3,	%o7,	%i2
	subcc	%i5,	0x1392,	%l6
loop_909:
	tcs	%xcc,	0x1
	bcc,a	loop_910
	movvc	%xcc,	%g6,	%g3
	fbe,a	%fcc3,	loop_911
	fmovsg	%icc,	%f19,	%f19
loop_910:
	brz	%o4,	loop_912
	sllx	%g7,	0x0C,	%l2
loop_911:
	fands	%f1,	%f7,	%f14
	subc	%g4,	0x0E4D,	%o1
loop_912:
	movrne	%i3,	%o0,	%l5
	wr	%g0,	0x0c,	%asi
	lduwa	[%l7 + 0x4C] %asi,	%i0
	tsubcc	%o6,	%o3,	%o2
	bleu,a,pn	%xcc,	loop_913
	movrlz	%g2,	0x26D,	%i6
	srax	%o5,	%g1,	%l0
	lduw	[%l7 + 0x24],	%i4
loop_913:
	fbuge	%fcc1,	loop_914
	orncc	%l4,	%l1,	%i1
	set	0x78, %o7
	ldswa	[%l7 + %o7] 0x04,	%g5
loop_914:
	movrlez	%i7,	%o7,	%l3
	xnorcc	%i2,	0x0101,	%l6
	array8	%i5,	%g3,	%o4
	ba,a,pn	%xcc,	loop_915
	edge32	%g7,	%l2,	%g4
	fandnot1	%f18,	%f14,	%f8
	udiv	%o1,	0x0BFA,	%i3
loop_915:
	sdivx	%g6,	0x1621,	%l5
	and	%o0,	0x0E5B,	%i0
	fmul8x16	%f20,	%f12,	%f0
	popc	0x0A4B,	%o3
	movpos	%icc,	%o2,	%g2
	brz,a	%o6,	loop_916
	edge8n	%o5,	%g1,	%l0
	fbne	%fcc2,	loop_917
	andcc	%i4,	0x14F0,	%i6
loop_916:
	udiv	%l4,	0x0908,	%i1
	bcc,a,pt	%xcc,	loop_918
loop_917:
	array16	%g5,	%i7,	%l1
	fmovsl	%icc,	%f2,	%f23
	move	%icc,	%l3,	%i2
loop_918:
	sll	%l6,	0x15,	%o7
	nop
	setx	loop_919,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	sra	%g3,	%i5,	%o4
	movrne	%l2,	0x1F2,	%g4
	addcc	%g7,	%i3,	%o1
loop_919:
	edge16	%g6,	%l5,	%i0
	fnors	%f24,	%f10,	%f3
	fcmped	%fcc0,	%f24,	%f24
	movrlz	%o3,	0x39C,	%o0
	srlx	%o2,	0x1D,	%o6
	edge32n	%o5,	%g1,	%g2
	addcc	%l0,	0x14C1,	%i4
	for	%f30,	%f22,	%f30
	fpmerge	%f15,	%f12,	%f28
	wr	%g0,	0x80,	%asi
	ldda	[%l7 + 0x30] %asi,	%l4
	movle	%icc,	%i6,	%g5
	movrgez	%i1,	0x1C1,	%l1
	movne	%icc,	%l3,	%i7
	ba,pt	%xcc,	loop_920
	te	%icc,	0x3
	taddcctv	%l6,	0x1581,	%o7
	tsubcc	%i2,	0x1B9E,	%i5
loop_920:
	edge8ln	%o4,	%l2,	%g4
	set	0x0F, %g6
	ldsba	[%l7 + %g6] 0x80,	%g3
	fand	%f4,	%f14,	%f12
	taddcc	%i3,	0x0EE2,	%o1
	xorcc	%g6,	0x05E1,	%l5
	movrgez	%g7,	%o3,	%o0
	edge32ln	%i0,	%o6,	%o5
	bvs	loop_921
	brgz	%g1,	loop_922
	stx	%g2,	[%l7 + 0x38]
	sir	0x1C2F
loop_921:
	subcc	%l0,	0x02BD,	%o2
loop_922:
	tpos	%xcc,	0x2
	ldsh	[%l7 + 0x70],	%i4
	ldsw	[%l7 + 0x14],	%l4
	array8	%g5,	%i1,	%l1
	udivx	%i6,	0x08BE,	%l3
	fsrc2s	%f21,	%f1
	tleu	%xcc,	0x1
	movl	%icc,	%l6,	%i7
	bg,a	%xcc,	loop_923
	fbu	%fcc1,	loop_924
	movne	%icc,	%o7,	%i2
	addccc	%o4,	0x1D9A,	%i5
loop_923:
	sdiv	%g4,	0x16E0,	%g3
loop_924:
	alignaddr	%i3,	%o1,	%g6
	sub	%l2,	%l5,	%g7
	edge32n	%o3,	%o0,	%o6
	fpack16	%f16,	%f5
	mova	%xcc,	%i0,	%g1
	fbo,a	%fcc1,	loop_925
	tle	%icc,	0x6
	sdivx	%g2,	0x1B41,	%o5
	fbge	%fcc1,	loop_926
loop_925:
	tcs	%icc,	0x3
	tle	%icc,	0x7
	movrgez	%l0,	0x369,	%i4
loop_926:
	sdiv	%l4,	0x020E,	%o2
	sir	0x0DB0
	popc	0x03F7,	%i1
	membar	0x05
	movvs	%xcc,	%g5,	%i6
	membar	0x6F
	movrlez	%l3,	0x2A2,	%l6
	udiv	%l1,	0x0DBF,	%i7
	addc	%i2,	0x13A5,	%o4
	fnegs	%f3,	%f20
	edge16l	%o7,	%g4,	%g3
	tcs	%xcc,	0x5
	tge	%icc,	0x5
	bvc,a	%xcc,	loop_927
	tcc	%icc,	0x1
	move	%icc,	%i5,	%o1
	fzeros	%f20
loop_927:
	nop
	set	0x40, %o2
	ldda	[%l7 + %o2] 0x0c,	%f0
	set	0x73, %o6
	stba	%i3,	[%l7 + %o6] 0x10
	mova	%xcc,	%l2,	%l5
	fpack16	%f26,	%f18
	movg	%xcc,	%g6,	%o3
	andn	%g7,	0x05C6,	%o6
	fba	%fcc1,	loop_928
	fmovrdlz	%o0,	%f4,	%f16
	std	%f28,	[%l7 + 0x28]
	udiv	%i0,	0x14F1,	%g1
loop_928:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	or	%g2,	0x046D,	%o5
	fmovdvc	%xcc,	%f7,	%f17
	popc	%l0,	%i4
	popc	0x0703,	%o2
	edge32	%i1,	%l4,	%g5
	tl	%xcc,	0x1
	fmovsvc	%icc,	%f26,	%f12
	fmovscs	%xcc,	%f30,	%f0
	bn,a	loop_929
	movleu	%icc,	%l3,	%l6
	umul	%i6,	%l1,	%i7
	umulcc	%i2,	%o4,	%o7
loop_929:
	fmovscs	%xcc,	%f31,	%f29
	addccc	%g4,	%g3,	%o1
	orcc	%i5,	0x1B39,	%i3
	add	%l7,	0x50,	%l6
	wr	%g0,	0x10,	%asi
	casxa	[%l6] %asi,	%l2,	%l5
	tvs	%icc,	0x3
	tcc	%icc,	0x5
	fxor	%f10,	%f22,	%f14
	fmovsvs	%icc,	%f30,	%f13
	te	%xcc,	0x6
	brgz	%o3,	loop_930
	fbul	%fcc2,	loop_931
	alignaddrl	%g7,	%o6,	%o0
	movpos	%xcc,	%g6,	%g1
loop_930:
	tgu	%icc,	0x3
loop_931:
	fmovspos	%xcc,	%f6,	%f12
	call	loop_932
	fbule	%fcc3,	loop_933
	fmovs	%f10,	%f1
	tgu	%xcc,	0x4
loop_932:
	fmovsneg	%icc,	%f27,	%f23
loop_933:
	movg	%xcc,	%g2,	%o5
	movneg	%icc,	%l0,	%i0
	set	0x60, %l4
	lda	[%l7 + %l4] 0x10,	%f15
	edge32	%o2,	%i4,	%i1
	movg	%icc,	%g5,	%l3
	smul	%l6,	0x1976,	%i6
	set	0x2C, %o4
	stwa	%l1,	[%l7 + %o4] 0x2a
	membar	#Sync
	fba	%fcc3,	loop_934
	xorcc	%l4,	%i7,	%o4
	fmovrsne	%o7,	%f5,	%f16
	movge	%xcc,	%i2,	%g3
loop_934:
	popc	%o1,	%g4
	fmovs	%f17,	%f5
	fcmple32	%f14,	%f14,	%i5
	fcmpd	%fcc3,	%f10,	%f4
	bgu	loop_935
	std	%f6,	[%l7 + 0x40]
	lduh	[%l7 + 0x0C],	%l2
	umul	%i3,	0x04C0,	%o3
loop_935:
	array16	%g7,	%o6,	%l5
	movrne	%g6,	0x04B,	%g1
	ldstub	[%l7 + 0x52],	%g2
	fpsub32	%f8,	%f26,	%f20
	fbn,a	%fcc1,	loop_936
	fbu,a	%fcc0,	loop_937
	edge32	%o0,	%o5,	%l0
	ldx	[%l7 + 0x20],	%o2
loop_936:
	flush	%l7 + 0x10
loop_937:
	xnorcc	%i4,	%i1,	%i0
	taddcctv	%l3,	0x0A40,	%g5
	fcmple32	%f16,	%f4,	%i6
	xor	%l6,	0x1D4C,	%l1
	mulscc	%l4,	%o4,	%o7
	fxnor	%f16,	%f6,	%f22
	tg	%xcc,	0x5
	edge16n	%i7,	%g3,	%o1
	sra	%i2,	0x14,	%i5
	movcc	%xcc,	%g4,	%l2
	sdivx	%o3,	0x1CB4,	%i3
	movcs	%icc,	%o6,	%l5
	smul	%g6,	%g7,	%g2
	movgu	%icc,	%g1,	%o0
	tvc	%icc,	0x7
	fbug	%fcc3,	loop_938
	sethi	0x167F,	%l0
	movrlez	%o2,	%i4,	%o5
	fabsd	%f16,	%f30
loop_938:
	prefetch	[%l7 + 0x10],	 0x2
	move	%icc,	%i1,	%i0
	taddcctv	%l3,	0x0C29,	%g5
	tle	%icc,	0x6
	sdiv	%i6,	0x15C9,	%l6
	tvs	%icc,	0x0
	fcmpeq32	%f8,	%f12,	%l1
	edge8l	%l4,	%o7,	%i7
	edge16n	%o4,	%o1,	%i2
	array16	%i5,	%g4,	%l2
	or	%o3,	%i3,	%g3
	subcc	%o6,	%l5,	%g6
	umulcc	%g2,	%g1,	%o0
	subccc	%l0,	%o2,	%g7
	edge32l	%i4,	%o5,	%i1
	tsubcc	%i0,	0x0B77,	%g5
	wr	%g0,	0x0c,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	brz	%l3,	loop_939
	fzeros	%f2
	bl	loop_940
	xnor	%i6,	0x03CE,	%l6
loop_939:
	fmovdne	%icc,	%f3,	%f2
	lduh	[%l7 + 0x48],	%l1
loop_940:
	movre	%o7,	0x0FB,	%l4
	bneg,pt	%icc,	loop_941
	add	%i7,	%o1,	%i2
	bvs,pn	%xcc,	loop_942
	movcc	%icc,	%i5,	%g4
loop_941:
	call	loop_943
	fmovda	%icc,	%f22,	%f19
loop_942:
	edge16n	%o4,	%l2,	%o3
	movl	%xcc,	%i3,	%o6
loop_943:
	fmovsle	%xcc,	%f17,	%f1
	edge16l	%g3,	%g6,	%l5
	fmovrse	%g1,	%f28,	%f20
	fnands	%f19,	%f9,	%f29
	fbne	%fcc0,	loop_944
	te	%xcc,	0x6
	tle	%xcc,	0x2
	ldd	[%l7 + 0x10],	%o0
loop_944:
	bge,a	%xcc,	loop_945
	fpsub32s	%f26,	%f18,	%f13
	array16	%l0,	%o2,	%g2
	tleu	%xcc,	0x3
loop_945:
	bpos,a	loop_946
	ble,a	%icc,	loop_947
	fmovscs	%xcc,	%f26,	%f19
	fexpand	%f14,	%f26
loop_946:
	edge16ln	%i4,	%g7,	%i1
loop_947:
	subc	%o5,	0x0674,	%g5
	fpadd16s	%f30,	%f30,	%f21
	alignaddrl	%i0,	%i6,	%l3
	edge32	%l6,	%o7,	%l1
	fmovdvs	%xcc,	%f2,	%f19
	tsubcctv	%l4,	%i7,	%i2
	fmovdg	%icc,	%f2,	%f24
	wr	%g0,	0x89,	%asi
	ldsba	[%l7 + 0x6A] %asi,	%o1
	faligndata	%f8,	%f22,	%f2
	wr	%g0,	0x80,	%asi
	stwa	%i5,	[%l7 + 0x2C] %asi
	tleu	%xcc,	0x3
	wr	%g0,	0x89,	%asi
	stba	%o4,	[%l7 + 0x60] %asi
	tn	%xcc,	0x5
	subc	%g4,	0x01FE,	%l2
	fmovdleu	%icc,	%f6,	%f3
	movrne	%o3,	%o6,	%i3
	fbl,a	%fcc2,	loop_948
	srlx	%g6,	0x17,	%g3
	wr	%g0,	0x0c,	%asi
	lduwa	[%l7 + 0x64] %asi,	%g1
loop_948:
	fmul8x16au	%f17,	%f30,	%f4
	edge8n	%o0,	%l0,	%o2
	edge16ln	%g2,	%i4,	%l5
	umulcc	%i1,	0x066B,	%g7
	fpadd32s	%f0,	%f10,	%f29
	mulscc	%o5,	%g5,	%i0
	edge8n	%l3,	%i6,	%o7
	move	%xcc,	%l1,	%l6
	subccc	%l4,	0x1A08,	%i7
	stb	%i2,	[%l7 + 0x2E]
	orcc	%i5,	0x0D48,	%o4
	pdist	%f24,	%f30,	%f10
	wr	%g0,	0x18,	%asi
	ldstuba	[%l7 + 0x2E] %asi,	%o1
	fbu,a	%fcc2,	loop_949
	tn	%xcc,	0x6
	tn	%icc,	0x1
	fba	%fcc1,	loop_950
loop_949:
	and	%g4,	%o3,	%l2
	edge32ln	%i3,	%o6,	%g3
	set	0x1C, %g7
	stba	%g1,	[%l7 + %g7] 0x81
loop_950:
	fblg	%fcc2,	loop_951
	tsubcc	%g6,	%l0,	%o0
	fmovsl	%xcc,	%f8,	%f18
	tg	%icc,	0x6
loop_951:
	array16	%o2,	%g2,	%i4
	fmovda	%icc,	%f8,	%f12
	orn	%i1,	0x0974,	%g7
	tneg	%icc,	0x7
	fxor	%f2,	%f22,	%f10
	add	%l7,	0x08,	%l6
	wr	%g0,	0x10,	%asi
	lda	[%l6] %asi,	%o5
	casa	[%l6] %asi,	%o5,	%g5
	edge8	%i0,	%l5,	%i6
	std	%o6,	[%l7 + 0x58]
	tn	%icc,	0x5
	array8	%l3,	%l6,	%l4
	addccc	%i7,	0x017E,	%l1
	fxor	%f10,	%f16,	%f28
	smul	%i2,	0x0C14,	%o4
	fcmpgt32	%f18,	%f30,	%o1
	wr	%g0,	0x11,	%asi
	ldxa	[%l7 + 0x68] %asi,	%i5
	subc	%g4,	0x1281,	%l2
	lduw	[%l7 + 0x5C],	%o3
	movrlz	%i3,	0x2B5,	%o6
	movrlz	%g3,	0x19B,	%g6
	fmovscs	%icc,	%f3,	%f9
	andn	%l0,	%g1,	%o0
	subc	%o2,	%g2,	%i1
	popc	%g7,	%i4
	fnor	%f14,	%f2,	%f14
	mulx	%o5,	0x16A9,	%g5
	ldsw	[%l7 + 0x10],	%i0
	fmovrse	%i6,	%f3,	%f2
	fbn	%fcc3,	loop_952
	edge16ln	%o7,	%l3,	%l5
	stx	%l4,	[%l7 + 0x10]
	call	loop_953
loop_952:
	stbar
	movre	%l6,	0x011,	%l1
	tcc	%xcc,	0x1
loop_953:
	nop
	setx	loop_954,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	edge32	%i2,	%o4,	%o1
	tcc	%xcc,	0x0
	call	loop_955
loop_954:
	fbu	%fcc1,	loop_956
	edge8n	%i5,	%g4,	%l2
	movrne	%i7,	%i3,	%o3
loop_955:
	edge32ln	%o6,	%g3,	%g6
loop_956:
	bvs,a	%icc,	loop_957
	bl,pt	%xcc,	loop_958
	edge32n	%l0,	%o0,	%o2
	bneg,pt	%xcc,	loop_959
loop_957:
	udiv	%g1,	0x1B98,	%g2
loop_958:
	fmovdleu	%icc,	%f28,	%f13
	fmovdcc	%xcc,	%f14,	%f25
loop_959:
	fmovsl	%xcc,	%f5,	%f14
	movvc	%xcc,	%i1,	%g7
	edge16	%o5,	%g5,	%i4
	andn	%i6,	0x059F,	%i0
	movgu	%xcc,	%o7,	%l5
	set	0x7C, %i1
	stha	%l3,	[%l7 + %i1] 0x11
	flush	%l7 + 0x68
	movpos	%xcc,	%l4,	%l6
	movg	%xcc,	%l1,	%i2
	be,a	%xcc,	loop_960
	edge16l	%o1,	%i5,	%o4
	fbule	%fcc1,	loop_961
	addc	%g4,	%i7,	%l2
loop_960:
	nop
	set	0x78, %l5
	lduwa	[%l7 + %l5] 0x88,	%i3
loop_961:
	add	%o3,	%g3,	%g6
	xnor	%o6,	0x009B,	%l0
	wr	%g0,	0x04,	%asi
	ldstuba	[%l7 + 0x60] %asi,	%o2
	tn	%icc,	0x3
	or	%g1,	%o0,	%g2
	andn	%i1,	0x1A09,	%g7
	fbuge,a	%fcc3,	loop_962
	ldd	[%l7 + 0x20],	%o4
	movrgez	%g5,	%i6,	%i0
	srax	%i4,	0x14,	%l5
loop_962:
	std	%f0,	[%l7 + 0x48]
	fpadd32s	%f20,	%f3,	%f24
	alignaddrl	%o7,	%l3,	%l6
	fmovrdne	%l4,	%f8,	%f18
	srlx	%l1,	0x0F,	%o1
	tle	%xcc,	0x0
	fmovsgu	%icc,	%f8,	%f4
	or	%i2,	%i5,	%g4
	sdivx	%i7,	0x0A39,	%o4
	movne	%xcc,	%l2,	%i3
	bn,a	loop_963
	bcc,a,pn	%icc,	loop_964
	tcs	%icc,	0x4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_963:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_964:
	fbe	%fcc0,	loop_965
	fmovdg	%xcc,	%f29,	%f6
	ldd	[%l7 + 0x08],	%g2
	ldd	[%l7 + 0x78],	%o2
loop_965:
	sra	%o6,	0x0A,	%l0
	edge8l	%g6,	%g1,	%o0
	movn	%xcc,	%g2,	%i1
	movvs	%xcc,	%o2,	%g7
	te	%xcc,	0x1
	umul	%o5,	0x120E,	%g5
	fnot1	%f2,	%f28
	tle	%icc,	0x3
	srax	%i6,	0x0C,	%i0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrne	%l5,	%i4,	%o7
	tgu	%xcc,	0x5
	add	%l3,	%l6,	%l4
	andn	%l1,	0x042B,	%i2
	ldd	[%l7 + 0x20],	%i4
	fmovdge	%xcc,	%f11,	%f28
	fcmped	%fcc2,	%f30,	%f18
	bvc,a,pn	%icc,	loop_966
	subccc	%g4,	0x143D,	%o1
	std	%i6,	[%l7 + 0x08]
	fmovrdlez	%o4,	%f30,	%f10
loop_966:
	ld	[%l7 + 0x2C],	%f1
	fbule,a	%fcc2,	loop_967
	subc	%l2,	0x03F0,	%g3
	tneg	%xcc,	0x0
	fmovsg	%xcc,	%f12,	%f17
loop_967:
	sdivx	%o3,	0x0A00,	%i3
	fmovsl	%icc,	%f8,	%f15
	addccc	%l0,	0x1A23,	%o6
	srlx	%g1,	%o0,	%g6
	wr	%g0,	0x04,	%asi
	swapa	[%l7 + 0x14] %asi,	%g2
	fcmpeq16	%f6,	%f12,	%o2
	fble	%fcc0,	loop_968
	sra	%i1,	%o5,	%g7
	fnot2s	%f8,	%f0
	movcs	%icc,	%g5,	%i0
loop_968:
	edge32	%l5,	%i6,	%o7
	xorcc	%l3,	0x017D,	%l6
	mova	%icc,	%l4,	%i4
	bne,a	%xcc,	loop_969
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ble	loop_970
	xor	%l1,	%i5,	%i2
loop_969:
	sethi	0x06ED,	%o1
	subcc	%i7,	0x0963,	%g4
loop_970:
	edge32n	%l2,	%g3,	%o3
	fsrc1s	%f21,	%f24
	taddcc	%i3,	0x06EC,	%l0
	fornot2	%f22,	%f18,	%f8
	srax	%o6,	%o4,	%g1
	srlx	%o0,	%g2,	%g6
	fnors	%f30,	%f27,	%f3
	movg	%xcc,	%i1,	%o2
	movcc	%xcc,	%o5,	%g5
	fbuge,a	%fcc1,	loop_971
	add	%g7,	%i0,	%l5
	addcc	%i6,	%o7,	%l3
	edge8ln	%l4,	%l6,	%l1
loop_971:
	or	%i4,	0x0CBA,	%i2
	fnot1	%f8,	%f14
	alignaddr	%o1,	%i7,	%g4
	orncc	%l2,	%g3,	%i5
	movre	%i3,	0x192,	%o3
	tge	%xcc,	0x7
	movvc	%icc,	%o6,	%l0
	srax	%o4,	%g1,	%g2
	membar	0x75
	addc	%o0,	%g6,	%i1
	fcmple32	%f30,	%f12,	%o2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bl,pn	%xcc,	loop_972
	movrgez	%g5,	%g7,	%o5
	nop
	setx loop_973, %l0, %l1
	jmpl %l1, %i0
	fbe	%fcc0,	loop_974
loop_972:
	fbuge	%fcc1,	loop_975
	tl	%xcc,	0x3
loop_973:
	addc	%l5,	%i6,	%l3
loop_974:
	movvc	%xcc,	%o7,	%l6
loop_975:
	fones	%f30
	be,a,pt	%icc,	loop_976
	fmovsne	%xcc,	%f18,	%f17
	fmovdle	%icc,	%f11,	%f25
	edge16ln	%l1,	%l4,	%i4
loop_976:
	umul	%i2,	%i7,	%o1
	srax	%g4,	%l2,	%i5
	movg	%icc,	%g3,	%o3
	wr	%g0,	0x0c,	%asi
	sta	%f1,	[%l7 + 0x64] %asi
	movcs	%icc,	%o6,	%l0
	fmovda	%icc,	%f8,	%f0
	sdivcc	%i3,	0x07D5,	%o4
	bg	loop_977
	mulscc	%g2,	0x0D2B,	%o0
	andn	%g1,	%g6,	%i1
	fbl,a	%fcc0,	loop_978
loop_977:
	sllx	%o2,	0x09,	%g7
	movre	%o5,	%g5,	%i0
	add	%l7,	0x48,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%l5,	%l3
loop_978:
	xnorcc	%o7,	0x00CE,	%i6
	tcc	%icc,	0x2
	fmovsge	%icc,	%f2,	%f22
	stbar
	lduh	[%l7 + 0x42],	%l1
	fmovsgu	%icc,	%f21,	%f27
	edge8n	%l4,	%l6,	%i4
	edge32	%i7,	%o1,	%i2
	edge16l	%l2,	%i5,	%g4
	array8	%o3,	%o6,	%g3
	wr	%g0,	0x89,	%asi
	ldsha	[%l7 + 0x42] %asi,	%i3
	add	%l0,	%o4,	%o0
	fnot1s	%f30,	%f7
	edge16l	%g1,	%g2,	%i1
	st	%f30,	[%l7 + 0x6C]
	edge32ln	%o2,	%g6,	%g7
	fornot2	%f18,	%f18,	%f4
	sir	0x079F
	alignaddrl	%g5,	%i0,	%o5
	or	%l3,	%l5,	%i6
	srlx	%l1,	0x02,	%o7
	sdivcc	%l4,	0x1D45,	%l6
	edge16l	%i4,	%o1,	%i2
	srlx	%l2,	0x18,	%i5
	array8	%i7,	%o3,	%o6
	bvc,a	%icc,	loop_979
	alignaddrl	%g3,	%g4,	%i3
	alignaddr	%o4,	%l0,	%g1
	fmovsneg	%xcc,	%f29,	%f25
loop_979:
	bneg,pt	%icc,	loop_980
	array16	%g2,	%i1,	%o0
	brlz	%o2,	loop_981
	fmovscs	%xcc,	%f11,	%f26
loop_980:
	xnorcc	%g7,	0x0310,	%g5
	fbe,a	%fcc0,	loop_982
loop_981:
	fbuge,a	%fcc2,	loop_983
	orncc	%g6,	%i0,	%l3
	fmovd	%f20,	%f24
loop_982:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_983:
	fbo,a	%fcc3,	loop_984
	tge	%xcc,	0x0
	tge	%icc,	0x7
	mova	%icc,	%l5,	%i6
loop_984:
	movne	%icc,	%o5,	%l1
	edge16	%l4,	%o7,	%l6
	fmovdpos	%icc,	%f21,	%f14
	fcmpgt32	%f24,	%f8,	%i4
	tle	%icc,	0x1
	xor	%i2,	%o1,	%l2
	bne	%xcc,	loop_985
	alignaddr	%i5,	%o3,	%i7
	mulx	%o6,	0x105E,	%g3
	and	%g4,	0x0294,	%o4
loop_985:
	fsrc2s	%f12,	%f3
	taddcctv	%i3,	%g1,	%g2
	stbar
	smul	%l0,	0x1A87,	%o0
	movpos	%icc,	%o2,	%g7
	brz,a	%i1,	loop_986
	lduh	[%l7 + 0x28],	%g5
	fmuld8ulx16	%f15,	%f27,	%f10
	ldd	[%l7 + 0x10],	%g6
loop_986:
	andncc	%l3,	%i0,	%i6
	subccc	%o5,	%l5,	%l4
	wr	%g0,	0x0c,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	tneg	%icc,	0x3
	fnegs	%f14,	%f11
	bne	loop_987
	fxor	%f20,	%f28,	%f2
	xnor	%o7,	%l1,	%l6
	fmovda	%xcc,	%f25,	%f26
loop_987:
	movvs	%xcc,	%i2,	%o1
	movvc	%icc,	%i4,	%l2
	fmovsa	%icc,	%f24,	%f28
	nop
	setx loop_988, %l0, %l1
	jmpl %l1, %i5
	movre	%o3,	0x1A0,	%i7
	nop
	setx loop_989, %l0, %l1
	jmpl %l1, %g3
	fornot2	%f2,	%f14,	%f10
loop_988:
	umul	%g4,	0x0C68,	%o4
	fblg,a	%fcc1,	loop_990
loop_989:
	fbne,a	%fcc3,	loop_991
	xnor	%i3,	0x14E1,	%o6
	fandnot1	%f28,	%f22,	%f18
loop_990:
	movrlez	%g1,	%l0,	%g2
loop_991:
	smul	%o0,	%o2,	%i1
	tgu	%icc,	0x4
	nop
	set	0x10, %i0
	std	%f20,	[%l7 + %i0]
	fmuld8sux16	%f10,	%f8,	%f22
	sdivx	%g5,	0x1615,	%g7
	edge8ln	%g6,	%i0,	%l3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udivcc	%o5,	0x1CE2,	%l5
	bgu,a	%icc,	loop_992
	andcc	%l4,	0x1488,	%i6
	movcc	%icc,	%o7,	%l1
	movn	%icc,	%i2,	%l6
loop_992:
	fabsd	%f8,	%f4
	movleu	%xcc,	%i4,	%o1
	edge32n	%i5,	%o3,	%i7
	brlez	%g3,	loop_993
	sra	%g4,	%l2,	%o4
	wr	%g0,	0x81,	%asi
	lduha	[%l7 + 0x40] %asi,	%i3
loop_993:
	bn,pt	%icc,	loop_994
	tpos	%xcc,	0x5
	subcc	%g1,	0x0F58,	%o6
	fcmpes	%fcc2,	%f20,	%f22
loop_994:
	bpos	loop_995
	alignaddr	%l0,	%o0,	%g2
	sdivx	%o2,	0x0AF8,	%g5
	nop
	setx	loop_996,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_995:
	stb	%g7,	[%l7 + 0x5A]
	movrne	%g6,	0x20B,	%i1
	stw	%i0,	[%l7 + 0x60]
loop_996:
	movrne	%o5,	%l3,	%l5
	fmovsg	%icc,	%f18,	%f30
	ldsw	[%l7 + 0x60],	%l4
	sdivcc	%i6,	0x1416,	%o7
	subcc	%i2,	%l6,	%l1
	movg	%xcc,	%i4,	%i5
	fnegd	%f20,	%f26
	orcc	%o1,	%i7,	%g3
	or	%g4,	0x188B,	%o3
	movrgez	%o4,	0x3FC,	%l2
	movge	%xcc,	%i3,	%o6
	popc	%g1,	%o0
	fmovsleu	%xcc,	%f22,	%f10
	movvs	%icc,	%g2,	%l0
	array32	%g5,	%o2,	%g7
	movl	%icc,	%g6,	%i1
	tle	%icc,	0x1
	mulx	%i0,	%o5,	%l3
	umul	%l5,	0x145E,	%l4
	mulscc	%o7,	0x0B68,	%i6
	fbuge,a	%fcc1,	loop_997
	fmovsg	%xcc,	%f12,	%f25
	ld	[%l7 + 0x58],	%f18
	tneg	%xcc,	0x3
loop_997:
	or	%i2,	0x10BC,	%l6
	movneg	%xcc,	%l1,	%i5
	umulcc	%o1,	%i7,	%g3
	brlez	%i4,	loop_998
	xnor	%g4,	0x0989,	%o4
	tleu	%xcc,	0x3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_998:
	orncc	%o3,	%i3,	%l2
	movvc	%icc,	%o6,	%o0
	fmovdcs	%icc,	%f19,	%f14
	fmul8x16au	%f26,	%f26,	%f28
	movn	%xcc,	%g1,	%l0
	fcmpeq32	%f26,	%f12,	%g5
	fornot2s	%f31,	%f13,	%f30
	movpos	%icc,	%o2,	%g7
	xor	%g6,	%g2,	%i1
	edge16l	%o5,	%i0,	%l3
	sdivcc	%l5,	0x185A,	%o7
	lduw	[%l7 + 0x50],	%l4
	movre	%i2,	%l6,	%i6
	tneg	%xcc,	0x3
	fmovdgu	%icc,	%f30,	%f8
	prefetch	[%l7 + 0x6C],	 0x0
	sdivx	%l1,	0x1439,	%o1
	edge32n	%i7,	%i5,	%i4
	movre	%g4,	0x16B,	%o4
	sdivcc	%g3,	0x1B82,	%i3
	taddcc	%l2,	%o3,	%o6
	sllx	%o0,	0x0E,	%g1
	set	0x38, %l6
	stba	%g5,	[%l7 + %l6] 0x15
	movrgz	%o2,	%g7,	%g6
	fpsub32s	%f16,	%f12,	%f28
	sir	0x11A2
	fbne,a	%fcc2,	loop_999
	fmovspos	%xcc,	%f3,	%f27
	tg	%xcc,	0x3
	fnot1s	%f5,	%f31
loop_999:
	tge	%xcc,	0x2
	ta	%xcc,	0x6
	tg	%xcc,	0x6
	orcc	%l0,	%i1,	%o5
	fbl	%fcc0,	loop_1000
	array16	%g2,	%l3,	%l5
	fmovdg	%xcc,	%f21,	%f22
	fmovsa	%icc,	%f15,	%f15
loop_1000:
	edge8	%i0,	%o7,	%l4
	fmovda	%icc,	%f7,	%f27
	nop
	set	0x38, %i7
	prefetch	[%l7 + %i7],	 0x3
	fones	%f19
	fmovdpos	%xcc,	%f31,	%f26
	brlz	%i2,	loop_1001
	edge32n	%l6,	%l1,	%i6
	edge8l	%i7,	%o1,	%i5
	orcc	%i4,	%o4,	%g3
loop_1001:
	subccc	%i3,	%g4,	%o3
	udivx	%o6,	0x044C,	%o0
	brgez	%l2,	loop_1002
	bshuffle	%f22,	%f10,	%f16
	wr	%g0,	0x16,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
loop_1002:
	nop
	wr	%g0,	0x89,	%asi
	ldstuba	[%l7 + 0x1F] %asi,	%g5
	or	%g1,	%g7,	%g6
	tneg	%icc,	0x0
	tsubcc	%l0,	0x0D66,	%i1
	movgu	%icc,	%o5,	%o2
	tvs	%xcc,	0x4
	fmuld8ulx16	%f3,	%f27,	%f10
	movvc	%icc,	%g2,	%l3
	fcmple32	%f26,	%f0,	%l5
	fmovsle	%xcc,	%f23,	%f20
	fpadd32	%f8,	%f4,	%f4
	xor	%i0,	0x151B,	%o7
	sra	%i2,	0x1C,	%l6
	fcmpd	%fcc2,	%f24,	%f0
	bgu,a,pn	%icc,	loop_1003
	membar	0x3D
	fmovdvc	%xcc,	%f20,	%f15
	andcc	%l1,	0x19E5,	%l4
loop_1003:
	taddcctv	%i7,	0x1274,	%i6
	sllx	%i5,	0x1D,	%o1
	srlx	%o4,	%i4,	%i3
	tvs	%xcc,	0x7
	movvc	%icc,	%g3,	%g4
	tpos	%xcc,	0x0
	udivcc	%o6,	0x0ADA,	%o0
	fpmerge	%f30,	%f31,	%f22
	fbe	%fcc3,	loop_1004
	addcc	%o3,	%l2,	%g1
	fmovdvc	%icc,	%f17,	%f8
	add	%l7,	0x64,	%l6
	wr	%g0,	0x18,	%asi
	lda	[%l6] %asi,	%g7
	casa	[%l6] %asi,	%g7,	%g5
loop_1004:
	sllx	%l0,	0x0C,	%i1
	smul	%o5,	0x18DB,	%g6
	fcmpne32	%f8,	%f10,	%g2
	or	%o2,	0x1C83,	%l5
	tge	%xcc,	0x4
	fbo	%fcc0,	loop_1005
	add	%i0,	0x0AE7,	%l3
	array8	%o7,	%l6,	%l1
	fpadd32	%f18,	%f8,	%f2
loop_1005:
	sdiv	%l4,	0x0B6B,	%i7
	umulcc	%i6,	0x1667,	%i2
	add	%i5,	0x00CA,	%o1
	and	%o4,	%i3,	%i4
	umul	%g3,	0x0BE0,	%g4
	fbul	%fcc0,	loop_1006
	flush	%l7 + 0x7C
	edge8l	%o0,	%o6,	%l2
	srax	%o3,	%g7,	%g1
loop_1006:
	fmuld8sux16	%f21,	%f1,	%f2
	fmovrslez	%g5,	%f9,	%f18
	fones	%f22
	sdiv	%l0,	0x114F,	%o5
	edge16	%g6,	%g2,	%o2
	edge8	%l5,	%i0,	%l3
	movcs	%icc,	%i1,	%o7
	orn	%l6,	0x03D6,	%l1
	fmovdvc	%icc,	%f11,	%f21
	flush	%l7 + 0x5C
	fones	%f30
	addc	%i7,	0x18D9,	%i6
	edge8n	%i2,	%l4,	%i5
	fnegs	%f14,	%f6
	orncc	%o1,	0x1777,	%o4
	sub	%i4,	0x1C5C,	%g3
	andncc	%i3,	%g4,	%o6
	wr	%g0,	0x0c,	%asi
	lduba	[%l7 + 0x6C] %asi,	%l2
	fbul	%fcc3,	loop_1007
	movcs	%xcc,	%o3,	%o0
	movgu	%icc,	%g7,	%g5
	movgu	%xcc,	%g1,	%o5
loop_1007:
	fcmpd	%fcc1,	%f8,	%f18
	movrlz	%g6,	0x1C6,	%l0
	nop
	setx	loop_1008,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	bge,pn	%xcc,	loop_1009
	prefetch	[%l7 + 0x48],	 0x1
	fmovdvc	%icc,	%f24,	%f27
loop_1008:
	nop
	wr	%g0,	0x80,	%asi
	lduha	[%l7 + 0x08] %asi,	%g2
loop_1009:
	andn	%l5,	%i0,	%o2
	fmovsleu	%icc,	%f22,	%f12
	andn	%l3,	%i1,	%l6
	tle	%icc,	0x5
	tvc	%xcc,	0x1
	sethi	0x04DE,	%o7
	tcs	%icc,	0x2
	sir	0x0F80
	tsubcc	%i7,	%i6,	%i2
	array32	%l4,	%l1,	%o1
	or	%o4,	%i4,	%i5
	move	%xcc,	%g3,	%i3
	fandnot1	%f12,	%f14,	%f8
	tcs	%icc,	0x7
	edge8l	%o6,	%g4,	%l2
	fpack16	%f8,	%f23
	brlz	%o0,	loop_1010
	tne	%xcc,	0x2
	array16	%o3,	%g7,	%g5
	fmovsa	%xcc,	%f26,	%f0
loop_1010:
	fmovs	%f29,	%f9
	sll	%g1,	0x0D,	%o5
	edge32l	%g6,	%g2,	%l5
	edge16ln	%i0,	%l0,	%o2
	taddcctv	%l3,	0x00BF,	%l6
	orcc	%i1,	%o7,	%i6
	fpackfix	%f10,	%f20
	movrlez	%i2,	%i7,	%l1
	orn	%o1,	%l4,	%o4
	sir	0x1FC7
	bshuffle	%f22,	%f20,	%f20
	fbu	%fcc3,	loop_1011
	edge32n	%i5,	%i4,	%i3
	edge8ln	%o6,	%g4,	%g3
	sllx	%l2,	%o0,	%o3
loop_1011:
	fmuld8sux16	%f18,	%f28,	%f24
	tvs	%xcc,	0x3
	tneg	%xcc,	0x5
	array16	%g7,	%g5,	%g1
	movcc	%xcc,	%o5,	%g6
	movl	%xcc,	%l5,	%i0
	prefetch	[%l7 + 0x7C],	 0x1
	fbo	%fcc2,	loop_1012
	te	%icc,	0x7
	fbue	%fcc3,	loop_1013
	for	%f18,	%f10,	%f12
loop_1012:
	movrlez	%l0,	0x05A,	%o2
	sdivx	%g2,	0x1391,	%l6
loop_1013:
	tn	%xcc,	0x7
	fpsub16	%f16,	%f20,	%f16
	bvc,pt	%xcc,	loop_1014
	add	%l3,	0x0C7C,	%i1
	ld	[%l7 + 0x5C],	%f31
	fcmpes	%fcc2,	%f12,	%f8
loop_1014:
	sub	%o7,	0x0EF1,	%i6
	tpos	%icc,	0x1
	membar	0x28
	nop
	set	0x76, %i5
	ldsb	[%l7 + %i5],	%i7
	fzero	%f24
	addcc	%i2,	0x1DB7,	%l1
	movleu	%xcc,	%l4,	%o1
	fsrc2s	%f19,	%f2
	prefetch	[%l7 + 0x20],	 0x1
	tne	%icc,	0x2
	bg,pt	%icc,	loop_1015
	tge	%icc,	0x2
	fpsub16s	%f1,	%f11,	%f25
	movcs	%xcc,	%i5,	%o4
loop_1015:
	movl	%icc,	%i3,	%i4
	membar	0x4B
	tn	%xcc,	0x1
	fmovsneg	%icc,	%f8,	%f19
	edge32ln	%g4,	%o6,	%g3
	orcc	%o0,	%o3,	%l2
	tleu	%xcc,	0x1
	set	0x58, %i2
	ldsha	[%l7 + %i2] 0x15,	%g5
	add	%l7,	0x0C,	%l6
	wr	%g0,	0x04,	%asi
	casa	[%l6] %asi,	%g1,	%g7
	fnegd	%f2,	%f2
	srlx	%o5,	0x15,	%g6
	fmovrde	%l5,	%f8,	%f0
	edge32ln	%l0,	%o2,	%g2
	edge16ln	%l6,	%i0,	%l3
	fandnot1	%f0,	%f4,	%f12
	sth	%o7,	[%l7 + 0x3C]
	fblg	%fcc1,	loop_1016
	fmovdvc	%icc,	%f30,	%f22
	fmul8x16au	%f4,	%f19,	%f10
	movcc	%icc,	%i1,	%i7
loop_1016:
	mova	%icc,	%i2,	%i6
	fpadd32s	%f20,	%f29,	%f8
	tne	%icc,	0x0
	wr	%g0,	0x88,	%asi
	stba	%l1,	[%l7 + 0x1F] %asi
	edge32l	%l4,	%i5,	%o1
	tvc	%xcc,	0x4
	tsubcctv	%i3,	0x0AEC,	%i4
	stbar
	umulcc	%g4,	%o4,	%g3
	edge32l	%o6,	%o3,	%l2
	fble	%fcc1,	loop_1017
	movneg	%xcc,	%g5,	%o0
	bgu,pt	%xcc,	loop_1018
	fxnors	%f28,	%f7,	%f27
loop_1017:
	sll	%g1,	0x0A,	%o5
	srlx	%g6,	0x19,	%g7
loop_1018:
	nop
	add	%l7,	0x30,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%l5,	%o2
	fandnot1	%f12,	%f4,	%f14
	sir	0x0131
	bl,a,pn	%xcc,	loop_1019
	edge16	%l0,	%l6,	%i0
	fmovsa	%xcc,	%f21,	%f6
	movge	%xcc,	%g2,	%l3
loop_1019:
	popc	0x129D,	%o7
	sethi	0x17C7,	%i1
	brgez,a	%i7,	loop_1020
	bvc	loop_1021
	edge8	%i2,	%i6,	%l1
	alignaddr	%l4,	%o1,	%i3
loop_1020:
	fmovsneg	%icc,	%f2,	%f28
loop_1021:
	bvc,pt	%xcc,	loop_1022
	bn,a,pt	%icc,	loop_1023
	fmovrdlz	%i5,	%f8,	%f14
	fbg	%fcc1,	loop_1024
loop_1022:
	fmovsn	%xcc,	%f25,	%f29
loop_1023:
	fors	%f17,	%f14,	%f2
	nop
	setx loop_1025, %l0, %l1
	jmpl %l1, %i4
loop_1024:
	ta	%icc,	0x5
	edge16	%o4,	%g4,	%g3
	array16	%o6,	%o3,	%l2
loop_1025:
	fands	%f8,	%f8,	%f12
	wr	%g0,	0x80,	%asi
	lda	[%l7 + 0x34] %asi,	%f0
	fbu	%fcc0,	loop_1026
	tge	%xcc,	0x3
	be,a	loop_1027
	fmovdcs	%xcc,	%f0,	%f31
loop_1026:
	array16	%g5,	%g1,	%o5
	taddcctv	%g6,	0x1F30,	%g7
loop_1027:
	fpsub16	%f26,	%f0,	%f4
	fbg,a	%fcc3,	loop_1028
	bvs,a,pt	%icc,	loop_1029
	andn	%l5,	0x0B65,	%o2
	nop
	setx	loop_1030,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_1028:
	movcs	%xcc,	%l0,	%l6
loop_1029:
	fmovsleu	%icc,	%f13,	%f19
	fsrc1	%f2,	%f22
loop_1030:
	fbo,a	%fcc2,	loop_1031
	fbe,a	%fcc3,	loop_1032
	faligndata	%f2,	%f20,	%f24
	movl	%xcc,	%i0,	%g2
loop_1031:
	bshuffle	%f16,	%f10,	%f28
loop_1032:
	taddcc	%l3,	0x1B66,	%o0
	tgu	%xcc,	0x1
	edge8l	%i1,	%i7,	%i2
	movpos	%icc,	%o7,	%l1
	tleu	%icc,	0x7
	tcs	%icc,	0x3
	movgu	%icc,	%l4,	%o1
	movrlz	%i6,	%i3,	%i4
	xnor	%i5,	%o4,	%g4
	lduh	[%l7 + 0x44],	%g3
	set	0x2C, %g1
	ldstuba	[%l7 + %g1] 0x18,	%o3
	fmovrsne	%o6,	%f19,	%f8
	sethi	0x1B8B,	%l2
	tcc	%icc,	0x6
	xor	%g1,	0x0C12,	%g5
	udivx	%o5,	0x029C,	%g6
	movneg	%xcc,	%g7,	%o2
	wr	%g0,	0x2b,	%asi
	stwa	%l5,	[%l7 + 0x08] %asi
	membar	#Sync
	edge8	%l0,	%i0,	%l6
	fmovd	%f26,	%f30
	ldsw	[%l7 + 0x0C],	%l3
	fmovsn	%xcc,	%f24,	%f4
	bg,a	loop_1033
	std	%f18,	[%l7 + 0x50]
	taddcc	%g2,	0x10E0,	%o0
	edge16l	%i1,	%i7,	%i2
loop_1033:
	movge	%icc,	%l1,	%o7
	edge16	%l4,	%i6,	%i3
	fbne	%fcc2,	loop_1034
	subc	%i4,	%o1,	%i5
	subcc	%o4,	%g3,	%o3
	edge8l	%o6,	%g4,	%l2
loop_1034:
	ba,pn	%xcc,	loop_1035
	fandnot1	%f30,	%f10,	%f8
	ldub	[%l7 + 0x65],	%g5
	wr	%g0,	0x19,	%asi
	prefetcha	[%l7 + 0x70] %asi,	 0x1
loop_1035:
	tcc	%icc,	0x7
	movle	%xcc,	%g6,	%g1
	edge32	%g7,	%o2,	%l5
	tg	%icc,	0x6
	fbn,a	%fcc2,	loop_1036
	edge32l	%i0,	%l6,	%l3
	sdivx	%l0,	0x0ACC,	%o0
	ble,a	%icc,	loop_1037
loop_1036:
	edge8	%g2,	%i1,	%i2
	fcmple16	%f22,	%f4,	%i7
	edge16n	%o7,	%l4,	%l1
loop_1037:
	fpadd16s	%f13,	%f8,	%f18
	edge16ln	%i3,	%i6,	%o1
	edge16l	%i4,	%i5,	%o4
	sdiv	%o3,	0x027D,	%o6
	nop
	set	0x3C, %o3
	prefetch	[%l7 + %o3],	 0x1
	movrgz	%g3,	0x103,	%l2
	tneg	%xcc,	0x7
	fbul	%fcc0,	loop_1038
	umulcc	%g4,	0x1A3D,	%g5
	te	%xcc,	0x3
	tn	%xcc,	0x2
loop_1038:
	fbge,a	%fcc1,	loop_1039
	prefetch	[%l7 + 0x4C],	 0x2
	sdivcc	%o5,	0x1A94,	%g1
	tg	%xcc,	0x1
loop_1039:
	fmovdleu	%xcc,	%f19,	%f0
	wr	%g0,	0x89,	%asi
	ldsha	[%l7 + 0x38] %asi,	%g6
	fnand	%f30,	%f24,	%f30
	fcmple32	%f16,	%f0,	%o2
	xnor	%g7,	0x0FC4,	%l5
	move	%xcc,	%i0,	%l3
	set	0x40, %g4
	stda	%f16,	[%l7 + %g4] 0x18
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fone	%f16
	tle	%icc,	0x7
	popc	0x0D87,	%l0
	fnor	%f6,	%f0,	%f10
	tvs	%icc,	0x3
	srlx	%l6,	%o0,	%i1
	edge16l	%i2,	%i7,	%g2
	tvc	%xcc,	0x2
	movrlez	%o7,	0x192,	%l4
	edge32n	%l1,	%i3,	%o1
	edge16n	%i4,	%i6,	%i5
	stbar
	wr	%g0,	0x80,	%asi
	lduba	[%l7 + 0x28] %asi,	%o4
	wr	%g0,	0x10,	%asi
	lda	[%l7 + 0x68] %asi,	%f20
	ldub	[%l7 + 0x71],	%o3
	movg	%icc,	%o6,	%g3
	orncc	%l2,	0x0F2A,	%g5
	fbue	%fcc1,	loop_1040
	nop
	setx	loop_1041,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	taddcctv	%g4,	0x0F0B,	%g1
	fnot2s	%f14,	%f31
loop_1040:
	mulscc	%g6,	%o5,	%g7
loop_1041:
	fmovsa	%xcc,	%f11,	%f15
	umulcc	%o2,	%l5,	%l3
	fmovrde	%i0,	%f6,	%f20
	tcs	%xcc,	0x1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x50, %o5
	stxa	%l6,	[%l7 + %o5] 0x11
	edge32	%o0,	%i1,	%i2
	fbe	%fcc2,	loop_1042
	fbule	%fcc1,	loop_1043
	movcs	%xcc,	%l0,	%i7
	array32	%g2,	%l4,	%o7
loop_1042:
	array16	%l1,	%o1,	%i3
loop_1043:
	tl	%xcc,	0x2
	fexpand	%f30,	%f4
	andcc	%i6,	%i5,	%o4
	udivcc	%o3,	0x044D,	%o6
	srlx	%g3,	%i4,	%l2
	movrgz	%g4,	0x3B7,	%g1
	fmul8x16al	%f23,	%f20,	%f12
	xnor	%g5,	%o5,	%g7
	call	loop_1044
	addccc	%o2,	%g6,	%l5
	fmovs	%f8,	%f16
	brnz,a	%l3,	loop_1045
loop_1044:
	movge	%xcc,	%i0,	%o0
	wr	%g0,	0x89,	%asi
	swapa	[%l7 + 0x14] %asi,	%l6
loop_1045:
	siam	0x1
	fcmple16	%f0,	%f20,	%i2
	alignaddr	%l0,	%i1,	%i7
	subc	%l4,	0x0B67,	%o7
	edge32ln	%l1,	%o1,	%g2
	fcmpeq16	%f18,	%f6,	%i3
	movre	%i5,	0x2D2,	%o4
	pdist	%f28,	%f24,	%f0
	set	0x54, %o1
	sta	%f26,	[%l7 + %o1] 0x89
	nop
	setx	loop_1046,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fcmpeq16	%f16,	%f16,	%i6
	fbue,a	%fcc2,	loop_1047
	srlx	%o6,	0x08,	%o3
loop_1046:
	edge32ln	%i4,	%g3,	%g4
	alignaddr	%l2,	%g5,	%g1
loop_1047:
	srl	%o5,	0x16,	%g7
	orncc	%o2,	%g6,	%l5
	fmovsvc	%icc,	%f29,	%f22
	wr	%g0,	0x89,	%asi
	stda	%l2,	[%l7 + 0x30] %asi
	nop
	setx	loop_1048,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	smul	%i0,	0x0805,	%o0
	set	0x40, %g5
	ldda	[%l7 + %g5] 0x2a,	%i2
loop_1048:
	tsubcc	%l0,	0x160E,	%l6
	ldd	[%l7 + 0x18],	%f14
	fones	%f27
	movrgez	%i1,	0x24A,	%i7
	wr	%g0,	0x0c,	%asi
	prefetcha	[%l7 + 0x28] %asi,	 0x1
	add	%l7,	0x20,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%l1,	%o7
	movn	%xcc,	%o1,	%i3
	fornot1	%f30,	%f26,	%f6
	orn	%i5,	%o4,	%i6
	stb	%o6,	[%l7 + 0x26]
	udivcc	%g2,	0x05FF,	%o3
	add	%l7,	0x50,	%l6
	wr	%g0,	0x10,	%asi
	casxa	[%l6] 0x10,	%i4,	%g4
	tne	%xcc,	0x3
	ldsb	[%l7 + 0x32],	%g3
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
	brlz,a	%g5,	loop_1050
	fsrc2s	%f9,	%f18
	subc	%g1,	0x0884,	%o5
loop_1049:
	nop
	set	0x40, %o0
	ldda	[%l7 + %o0] 0x14,	%f0
loop_1050:
	movcs	%xcc,	%g7,	%o2
	fbul	%fcc3,	loop_1051
	ld	[%l7 + 0x40],	%f6
	smulcc	%l2,	%g6,	%l5
	sir	0x0255
loop_1051:
	sdiv	%i0,	0x1470,	%o0
	alignaddr	%l3,	%l0,	%l6
	wr	%g0,	0x0c,	%asi
	ldsha	[%l7 + 0x2E] %asi,	%i2
	movge	%xcc,	%i7,	%i1
	fblg,a	%fcc3,	loop_1052
	movrlz	%l4,	0x093,	%l1
	taddcc	%o1,	0x12E3,	%i3
	or	%i5,	0x0457,	%o4
loop_1052:
	fpsub16	%f18,	%f14,	%f12
	and	%i6,	%o7,	%o6
	std	%o2,	[%l7 + 0x08]
	fbul	%fcc0,	loop_1053
	ldd	[%l7 + 0x28],	%f12
	and	%g2,	0x1E3C,	%g4
	tsubcc	%i4,	%g3,	%g5
loop_1053:
	fcmpne16	%f26,	%f12,	%g1
	edge32l	%o5,	%o2,	%g7
	movrgz	%g6,	0x000,	%l5
	fxors	%f16,	%f29,	%f7
	andncc	%i0,	%l2,	%l3
	wr	%g0,	0x89,	%asi
	lduba	[%l7 + 0x68] %asi,	%l0
	membar	0x21
	tneg	%xcc,	0x0
	edge32n	%l6,	%o0,	%i7
	or	%i1,	0x08B0,	%l4
	ta	%icc,	0x2
	subcc	%l1,	0x050E,	%o1
	fmovde	%icc,	%f12,	%f5
	edge16ln	%i3,	%i2,	%i5
	prefetch	[%l7 + 0x6C],	 0x0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmpeq16	%f24,	%f0,	%o4
	tcc	%icc,	0x3
	brgez,a	%o7,	loop_1054
	movl	%xcc,	%o6,	%i6
	brlez,a	%g2,	loop_1055
	fcmped	%fcc3,	%f2,	%f14
loop_1054:
	bvs,a	%xcc,	loop_1056
	fcmps	%fcc3,	%f5,	%f28
loop_1055:
	fmovdgu	%icc,	%f12,	%f0
	tvc	%xcc,	0x4
loop_1056:
	bg,a,pn	%xcc,	loop_1057
	tsubcctv	%g4,	%i4,	%g3
	edge8ln	%g5,	%o3,	%o5
	for	%f12,	%f30,	%f6
loop_1057:
	te	%xcc,	0x0
	fnot2	%f0,	%f8
	tgu	%icc,	0x7
	movcs	%xcc,	%g1,	%g7
	tneg	%xcc,	0x2
	mulx	%o2,	%g6,	%i0
	edge16	%l2,	%l5,	%l0
	sra	%l3,	%o0,	%l6
	movrgz	%i1,	%i7,	%l1
	taddcctv	%l4,	%i3,	%i2
	tcc	%xcc,	0x5
	wr	%g0,	0x0c,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	fmovsvc	%xcc,	%f5,	%f12
	movle	%icc,	%o1,	%o4
	brgez,a	%o7,	loop_1058
	alignaddr	%i5,	%o6,	%g2
	tgu	%icc,	0x5
	membar	0x11
loop_1058:
	tcc	%xcc,	0x4
	edge16n	%g4,	%i6,	%i4
	fands	%f2,	%f20,	%f29
	wr	%g0,	0x89,	%asi
	ldda	[%l7 + 0x10] %asi,	%g4
	movneg	%xcc,	%g3,	%o3
	flush	%l7 + 0x50
	brlez	%g1,	loop_1059
	umulcc	%o5,	0x1DA8,	%o2
	set	0x0F, %i3
	ldstuba	[%l7 + %i3] 0x0c,	%g6
loop_1059:
	movpos	%xcc,	%i0,	%g7
	movle	%icc,	%l5,	%l0
	ba	loop_1060
	addc	%l2,	%o0,	%l6
	movvc	%xcc,	%l3,	%i1
	bvs	loop_1061
loop_1060:
	ldd	[%l7 + 0x68],	%f8
	sra	%l1,	0x19,	%i7
	edge16n	%l4,	%i2,	%o1
loop_1061:
	udivx	%o4,	0x12D0,	%o7
	nop
	setx loop_1062, %l0, %l1
	jmpl %l1, %i5
	movpos	%icc,	%i3,	%g2
	fnegs	%f14,	%f31
	pdist	%f6,	%f6,	%f16
loop_1062:
	andn	%o6,	%g4,	%i4
	subc	%g5,	0x1C8A,	%g3
	bg,a,pn	%icc,	loop_1063
	edge32l	%o3,	%g1,	%i6
	tl	%xcc,	0x6
	fornot1s	%f1,	%f15,	%f26
loop_1063:
	edge16ln	%o2,	%g6,	%o5
	fpsub32s	%f12,	%f14,	%f29
	fpsub32	%f2,	%f12,	%f26
	fcmple32	%f16,	%f6,	%g7
	sdivx	%i0,	0x0DB0,	%l5
	srlx	%l2,	0x0C,	%o0
	wr	%g0,	0x19,	%asi
	lduha	[%l7 + 0x7C] %asi,	%l6
	fmovdcs	%icc,	%f29,	%f30
	movle	%icc,	%l3,	%l0
	fnor	%f20,	%f8,	%f2
	edge16n	%i1,	%l1,	%l4
	tge	%xcc,	0x5
	set	0x40, %g2
	stda	%f0,	[%l7 + %g2] 0x19
	fcmpes	%fcc1,	%f18,	%f28
	call	loop_1064
	sdiv	%i2,	0x02E2,	%i7
	add	%o1,	0x15C0,	%o4
	stbar
loop_1064:
	fblg	%fcc1,	loop_1065
	fand	%f26,	%f20,	%f28
	sdivcc	%o7,	0x07F6,	%i3
	movl	%icc,	%i5,	%g2
loop_1065:
	fpsub16s	%f21,	%f13,	%f12
	subcc	%o6,	0x19BC,	%i4
	fcmpne16	%f6,	%f24,	%g5
	fcmpgt32	%f16,	%f10,	%g4
	fones	%f7
	udiv	%g3,	0x0EEE,	%o3
	ldsw	[%l7 + 0x18],	%i6
	xorcc	%g1,	0x02DE,	%o2
	movn	%xcc,	%g6,	%o5
	movn	%icc,	%g7,	%i0
	xnorcc	%l2,	0x1A5C,	%o0
	brnz,a	%l6,	loop_1066
	ldsw	[%l7 + 0x10],	%l5
	fmovdvs	%xcc,	%f20,	%f7
	call	loop_1067
loop_1066:
	fpack16	%f20,	%f26
	set	0x208, %i6
	ldxa	[%g0 + %i6] 0x52,	%l3
loop_1067:
	lduw	[%l7 + 0x24],	%i1
	fmovsneg	%icc,	%f11,	%f27
	or	%l0,	%l1,	%l4
	fmovsvc	%icc,	%f9,	%f12
	nop
	setx	loop_1068,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fornot1	%f10,	%f2,	%f18
	or	%i7,	0x198A,	%o1
	ta	%xcc,	0x0
loop_1068:
	mulscc	%o4,	0x1429,	%i2
	edge8l	%o7,	%i5,	%g2
	fmovdleu	%xcc,	%f19,	%f28
	prefetch	[%l7 + 0x0C],	 0x0
	udiv	%i3,	0x1BA7,	%i4
	udiv	%o6,	0x03EF,	%g4
	alignaddr	%g5,	%g3,	%i6
	std	%f0,	[%l7 + 0x30]
	tg	%xcc,	0x0
	movne	%xcc,	%o3,	%o2
	movge	%icc,	%g1,	%g6
	tsubcc	%g7,	0x0B8F,	%o5
	wr	%g0,	0x80,	%asi
	ldda	[%l7 + 0x10] %asi,	%l2
	movre	%i0,	0x02D,	%o0
	orcc	%l6,	%l3,	%i1
	fmovdvc	%icc,	%f11,	%f30
	sth	%l0,	[%l7 + 0x26]
	mulx	%l5,	%l4,	%l1
	brlez	%i7,	loop_1069
	ld	[%l7 + 0x68],	%f3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	move	%xcc,	%o1,	%i2
loop_1069:
	movl	%icc,	%o4,	%i5
	fmovdgu	%xcc,	%f9,	%f1
	movvs	%icc,	%o7,	%i3
	fmovsn	%xcc,	%f29,	%f9
	fba	%fcc2,	loop_1070
	add	%i4,	0x07B1,	%o6
	bn	loop_1071
	subccc	%g2,	%g5,	%g4
loop_1070:
	tne	%icc,	0x0
	sub	%i6,	0x092C,	%g3
loop_1071:
	bpos,pt	%icc,	loop_1072
	sllx	%o2,	%o3,	%g6
	umul	%g7,	%o5,	%g1
	prefetch	[%l7 + 0x50],	 0x1
loop_1072:
	sir	0x00BF
	movle	%icc,	%l2,	%o0
	udivx	%l6,	0x0653,	%l3
	sethi	0x03BD,	%i1
	array8	%i0,	%l5,	%l4
	nop
	set	0x14, %l2
	ldsw	[%l7 + %l2],	%l1
	movvs	%xcc,	%l0,	%o1
	ld	[%l7 + 0x74],	%f7
	udiv	%i7,	0x0D67,	%o4
	srax	%i2,	%i5,	%o7
	array32	%i4,	%i3,	%g2
	xorcc	%o6,	0x0962,	%g5
	add	%l7,	0x60,	%l6
	wr	%g0,	0x10,	%asi
	casa	[%l6] %asi,	%i6,	%g4
	fbug,a	%fcc2,	loop_1073
	srax	%g3,	0x08,	%o2
	set	0x5C, %g3
	lduha	[%l7 + %g3] 0x14,	%o3
loop_1073:
	sra	%g7,	0x1D,	%o5
	movcc	%icc,	%g6,	%g1
	tl	%icc,	0x7
	sdiv	%o0,	0x0459,	%l2
	fsrc2s	%f3,	%f9
	fsrc2s	%f20,	%f23
	edge16n	%l3,	%i1,	%l6
	tsubcc	%i0,	%l4,	%l1
	tsubcctv	%l5,	%o1,	%l0
	te	%xcc,	0x2
	fmovrslz	%o4,	%f6,	%f2
	sra	%i2,	0x0D,	%i7
	std	%f0,	[%l7 + 0x48]
	taddcctv	%i5,	0x119A,	%o7
	tsubcc	%i3,	%g2,	%o6
	alignaddrl	%i4,	%g5,	%g4
	mova	%icc,	%g3,	%o2
	fmovdg	%xcc,	%f30,	%f8
	array8	%o3,	%g7,	%o5
	fmovdn	%icc,	%f15,	%f8
	addccc	%g6,	0x0C83,	%g1
	set	0x6A, %i4
	lduba	[%l7 + %i4] 0x15,	%o0
	edge8	%l2,	%i6,	%i1
	te	%icc,	0x6
	fmovrdgez	%l6,	%f24,	%f28
	xor	%i0,	0x153E,	%l4
	edge16	%l1,	%l5,	%l3
	movre	%l0,	%o4,	%o1
	fsrc1	%f14,	%f30
	bn,a	%xcc,	loop_1074
	fands	%f21,	%f31,	%f6
	wr	%g0,	0x80,	%asi
	prefetcha	[%l7 + 0x10] %asi,	 0x0
loop_1074:
	tsubcc	%i5,	%o7,	%i3
	fpmerge	%f28,	%f10,	%f20
	srl	%g2,	%i2,	%i4
	fbne	%fcc3,	loop_1075
	tleu	%xcc,	0x6
	movrgez	%o6,	0x0C2,	%g5
	array16	%g3,	%o2,	%g4
loop_1075:
	ta	%icc,	0x1
	set	0x71, %l0
	ldsba	[%l7 + %l0] 0x15,	%g7
	fmovrdgez	%o3,	%f14,	%f18
	nop
	setx	loop_1076,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movvs	%xcc,	%g6,	%o5
	sub	%o0,	%l2,	%i6
	fcmpne16	%f4,	%f12,	%i1
loop_1076:
	fbne,a	%fcc2,	loop_1077
	edge16ln	%g1,	%i0,	%l6
	nop
	setx loop_1078, %l0, %l1
	jmpl %l1, %l4
	bge	loop_1079
loop_1077:
	fcmpeq16	%f18,	%f30,	%l1
	tne	%icc,	0x6
loop_1078:
	orncc	%l5,	%l0,	%l3
loop_1079:
	xorcc	%o1,	%o4,	%i7
	fmuld8sux16	%f9,	%f31,	%f20
	brgez,a	%i5,	loop_1080
	sdivcc	%i3,	0x156D,	%g2
	brgz,a	%i2,	loop_1081
	bcs,a	%xcc,	loop_1082
loop_1080:
	movge	%xcc,	%o7,	%i4
	nop
	setx loop_1083, %l0, %l1
	jmpl %l1, %o6
loop_1081:
	move	%xcc,	%g3,	%g5
loop_1082:
	add	%o2,	%g4,	%g7
	tvc	%xcc,	0x1
loop_1083:
	fbue	%fcc3,	loop_1084
	fmovrdlez	%g6,	%f28,	%f18
	sub	%o5,	0x0A99,	%o3
	smul	%o0,	0x075C,	%l2
loop_1084:
	taddcctv	%i6,	0x0C27,	%g1
	movpos	%icc,	%i0,	%l6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsl	%xcc,	%f27,	%f21
	set	0x28, %l1
	lduba	[%l7 + %l1] 0x88,	%i1
	fcmpne16	%f20,	%f0,	%l4
	smul	%l1,	%l5,	%l3
	movvs	%icc,	%o1,	%o4
	tsubcctv	%i7,	0x1B59,	%l0
	membar	0x34
	alignaddrl	%i5,	%i3,	%i2
	and	%o7,	0x1648,	%g2
	fcmpeq32	%f0,	%f14,	%i4
	fcmpd	%fcc0,	%f0,	%f16
	udiv	%o6,	0x015B,	%g5
	bshuffle	%f20,	%f8,	%f26
	fbuge,a	%fcc1,	loop_1085
	xnorcc	%o2,	0x08F1,	%g4
	edge16l	%g3,	%g6,	%g7
	wr	%g0,	0x27,	%asi
	ldda	[%l7 + 0x20] %asi,	%o2
loop_1085:
	orcc	%o5,	0x0330,	%l2
	fcmple16	%f26,	%f0,	%i6
	udiv	%o0,	0x0A86,	%i0
	membar	0x51
	fmul8x16au	%f28,	%f4,	%f26
	movn	%xcc,	%l6,	%g1
	fmovdpos	%icc,	%f20,	%f21
	edge32n	%l4,	%i1,	%l5
	tne	%icc,	0x0
	tne	%icc,	0x1
	nop
	setx	loop_1086,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fandnot1	%f0,	%f10,	%f22
	orn	%l3,	0x11AA,	%o1
	orncc	%l1,	0x05D8,	%i7
loop_1086:
	fmuld8ulx16	%f24,	%f21,	%f0
	fmovdcs	%icc,	%f16,	%f27
	brlz	%o4,	loop_1087
	tne	%icc,	0x0
	fnor	%f26,	%f12,	%f0
	subc	%i5,	0x14F0,	%l0
loop_1087:
	fcmpgt32	%f16,	%f20,	%i3
	fblg,a	%fcc0,	loop_1088
	movg	%icc,	%o7,	%i2
	bge,a	%icc,	loop_1089
	sra	%g2,	0x1E,	%i4
loop_1088:
	xor	%o6,	%o2,	%g5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1089:
	alignaddr	%g4,	%g6,	%g3
	wr	%g0,	0x0c,	%asi
	ldstuba	[%l7 + 0x3D] %asi,	%o3
	fmovsleu	%icc,	%f2,	%f3
	udiv	%g7,	0x1C22,	%l2
	stx	%i6,	[%l7 + 0x08]
	fpadd32s	%f16,	%f8,	%f30
	xnor	%o0,	0x0A58,	%i0
	movvs	%icc,	%l6,	%o5
	stbar
	tl	%icc,	0x3
	fmovdvc	%icc,	%f10,	%f27
	fmovsvs	%xcc,	%f3,	%f21
	srl	%l4,	%g1,	%l5
	subccc	%l3,	0x16D3,	%i1
	tg	%xcc,	0x0
	andncc	%l1,	%i7,	%o4
	nop
	setx loop_1090, %l0, %l1
	jmpl %l1, %o1
	smulcc	%l0,	0x1A46,	%i3
	movrlez	%i5,	%i2,	%g2
	movpos	%xcc,	%o7,	%o6
loop_1090:
	edge16n	%o2,	%g5,	%g4
	movrne	%g6,	0x038,	%g3
	tleu	%xcc,	0x3
	taddcc	%i4,	%g7,	%l2
	wr	%g0,	0x18,	%asi
	lda	[%l7 + 0x1C] %asi,	%f6
	srax	%i6,	%o3,	%i0
	for	%f0,	%f30,	%f2
	fbug,a	%fcc2,	loop_1091
	tpos	%xcc,	0x0
	fmovdle	%xcc,	%f7,	%f29
	ldsb	[%l7 + 0x65],	%l6
loop_1091:
	fxor	%f4,	%f18,	%f6
	movpos	%xcc,	%o5,	%o0
	tl	%icc,	0x2
	fmovrdgz	%g1,	%f22,	%f28
	set	0x48, %l3
	ldstuba	[%l7 + %l3] 0x04,	%l4
	taddcctv	%l5,	%i1,	%l1
	edge32	%l3,	%o4,	%o1
	fmovdne	%icc,	%f19,	%f26
	movpos	%icc,	%l0,	%i7
	xorcc	%i3,	%i2,	%i5
	array16	%g2,	%o7,	%o6
	fpmerge	%f2,	%f30,	%f10
	fnot1	%f2,	%f20
	flush	%l7 + 0x2C
	bneg	%icc,	loop_1092
	fnot2	%f6,	%f4
	ldsb	[%l7 + 0x20],	%o2
	smul	%g5,	%g4,	%g3
loop_1092:
	fmovsneg	%xcc,	%f30,	%f20
	fmovsn	%icc,	%f22,	%f14
	tgu	%xcc,	0x4
	edge16	%i4,	%g7,	%g6
	fmovdle	%icc,	%f18,	%f22
	edge8l	%i6,	%o3,	%l2
	edge16n	%l6,	%o5,	%i0
	movneg	%xcc,	%o0,	%g1
	movrlz	%l5,	0x1B0,	%l4
	addcc	%l1,	0x196C,	%i1
	smulcc	%l3,	%o4,	%l0
	xorcc	%o1,	0x0084,	%i3
	fmovdne	%xcc,	%f26,	%f20
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x80,	%asi
	lduwa	[%l7 + 0x48] %asi,	%i7
	umul	%i5,	%i2,	%o7
	fpsub16s	%f17,	%f31,	%f29
	fbg,a	%fcc3,	loop_1093
	ba,a	loop_1094
	array32	%o6,	%o2,	%g2
	tg	%icc,	0x6
loop_1093:
	xnorcc	%g4,	%g5,	%g3
loop_1094:
	array16	%i4,	%g6,	%g7
	fmovsvs	%xcc,	%f7,	%f21
	movrgz	%o3,	%i6,	%l6
	nop
	setx	loop_1095,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	subccc	%o5,	0x1EDB,	%l2
	tneg	%icc,	0x5
	sra	%o0,	0x08,	%i0
loop_1095:
	sethi	0x0CC4,	%g1
	mova	%icc,	%l5,	%l4
	fmovd	%f24,	%f0
	orn	%l1,	%i1,	%o4
	edge8ln	%l0,	%l3,	%i3
	fcmpeq32	%f8,	%f22,	%o1
	xorcc	%i7,	%i5,	%i2
	tcc	%xcc,	0x4
	fcmped	%fcc0,	%f20,	%f12
	fbg,a	%fcc3,	loop_1096
	membar	0x7C
	fbe,a	%fcc3,	loop_1097
	srax	%o7,	0x14,	%o6
loop_1096:
	fmul8x16al	%f4,	%f3,	%f4
	edge16	%o2,	%g4,	%g2
loop_1097:
	movg	%icc,	%g5,	%i4
	movvs	%icc,	%g6,	%g7
	edge16n	%o3,	%g3,	%i6
	add	%l7,	0x30,	%l6
	wr	%g0,	0x11,	%asi
	ldxa	[%l6] %asi,	%o5
	casxa	[%l6] %asi,	%o5,	%l6
	movgu	%icc,	%l2,	%i0
	sethi	0x025C,	%g1
	fbul,a	%fcc3,	loop_1098
	bcs,a,pn	%icc,	loop_1099
	xnorcc	%l5,	%l4,	%o0
	andn	%i1,	%l1,	%l0
loop_1098:
	orn	%o4,	%l3,	%o1
loop_1099:
	fpack32	%f26,	%f4,	%f10
	xor	%i3,	%i5,	%i7
	sllx	%o7,	%o6,	%o2
	fbg	%fcc1,	loop_1100
	ldub	[%l7 + 0x38],	%g4
	xorcc	%i2,	0x0DCB,	%g5
	fpadd16	%f16,	%f14,	%f24
loop_1100:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tleu	%xcc,	0x7
	fmovdge	%icc,	%f25,	%f31
	fors	%f26,	%f14,	%f19
	tgu	%xcc,	0x0
	fmovsneg	%xcc,	%f13,	%f14
	movge	%icc,	%g2,	%i4
	fble,a	%fcc1,	loop_1101
	fbn	%fcc0,	loop_1102
	fxnors	%f25,	%f9,	%f6
	fsrc2s	%f16,	%f20
loop_1101:
	stbar
loop_1102:
	faligndata	%f10,	%f26,	%f20
	movn	%icc,	%g7,	%o3
	xor	%g6,	0x1BDE,	%i6
	movn	%icc,	%g3,	%l6
	array8	%o5,	%i0,	%l2
	ldsb	[%l7 + 0x0A],	%l5
	srl	%l4,	0x16,	%g1
	brnz	%o0,	loop_1103
	fsrc1s	%f15,	%f26
	fbule	%fcc1,	loop_1104
	tvs	%icc,	0x2
loop_1103:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrdgz	%l1,	%f12,	%f4
loop_1104:
	movvc	%icc,	%l0,	%o4
	wr	%g0,	0x0c,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	array32	%l3,	%i1,	%o1
	movvs	%icc,	%i3,	%i7
	fbl,a	%fcc3,	loop_1105
	fmovrsgez	%o7,	%f7,	%f11
	or	%i5,	0x0295,	%o2
	movrgez	%g4,	0x0CC,	%i2
loop_1105:
	movre	%g5,	%g2,	%o6
	movrgez	%g7,	%o3,	%g6
	andcc	%i6,	%g3,	%l6
	addccc	%i4,	0x1F3D,	%i0
	movrgez	%l2,	0x186,	%l5
	tcs	%xcc,	0x4
	fcmpeq32	%f2,	%f12,	%o5
	movl	%icc,	%l4,	%g1
	taddcc	%l1,	0x16F5,	%o0
	set	0x6D, %o7
	ldsba	[%l7 + %o7] 0x19,	%o4
	stx	%l0,	[%l7 + 0x38]
	fmovrdlz	%i1,	%f6,	%f20
	fmovsa	%xcc,	%f30,	%f18
	array32	%o1,	%i3,	%i7
	nop
	set	0x28, %o2
	stx	%o7,	[%l7 + %o2]
	fcmpeq16	%f22,	%f24,	%i5
	edge8l	%o2,	%g4,	%i2
	addc	%l3,	0x1084,	%g2
	fsrc1	%f22,	%f14
	fzeros	%f22
	ldsw	[%l7 + 0x70],	%o6
	fmovdleu	%xcc,	%f11,	%f12
	stb	%g5,	[%l7 + 0x67]
	movcc	%icc,	%o3,	%g7
	taddcctv	%i6,	0x1A3C,	%g3
	sethi	0x04AB,	%g6
	alignaddr	%i4,	%l6,	%i0
	call	loop_1106
	array16	%l2,	%o5,	%l5
	addccc	%l4,	0x1004,	%l1
	edge32n	%o0,	%g1,	%o4
loop_1106:
	fpsub32	%f26,	%f28,	%f30
	movg	%xcc,	%l0,	%i1
	mulscc	%i3,	0x15E9,	%o1
	bcc,a,pn	%icc,	loop_1107
	array16	%i7,	%i5,	%o7
	move	%icc,	%g4,	%o2
	andn	%l3,	0x04F7,	%i2
loop_1107:
	mulscc	%o6,	0x083E,	%g5
	te	%xcc,	0x5
	movgu	%icc,	%o3,	%g2
	movvs	%xcc,	%g7,	%g3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	setx	loop_1108,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	ba,a,pt	%icc,	loop_1109
	bl,pt	%xcc,	loop_1110
	fbne,a	%fcc0,	loop_1111
loop_1108:
	tleu	%icc,	0x2
loop_1109:
	edge16	%g6,	%i4,	%i6
loop_1110:
	fmovspos	%xcc,	%f27,	%f3
loop_1111:
	mova	%icc,	%l6,	%l2
	movne	%icc,	%i0,	%o5
	bpos,a,pt	%icc,	loop_1112
	edge16l	%l5,	%l4,	%l1
	fandnot2	%f22,	%f20,	%f18
	ldub	[%l7 + 0x2E],	%g1
loop_1112:
	fcmps	%fcc1,	%f6,	%f24
	call	loop_1113
	swap	[%l7 + 0x54],	%o4
	tcc	%icc,	0x6
	fnands	%f4,	%f5,	%f10
loop_1113:
	lduh	[%l7 + 0x18],	%o0
	std	%f12,	[%l7 + 0x58]
	fmovrsgz	%i1,	%f27,	%f24
	fabss	%f0,	%f13
	bvc,pn	%xcc,	loop_1114
	movgu	%icc,	%i3,	%o1
	tl	%xcc,	0x7
	srl	%l0,	%i5,	%o7
loop_1114:
	edge8ln	%g4,	%o2,	%i7
	mova	%xcc,	%l3,	%o6
	fmuld8sux16	%f3,	%f7,	%f14
	flush	%l7 + 0x70
	movcs	%xcc,	%g5,	%o3
	alignaddr	%i2,	%g7,	%g2
	ldd	[%l7 + 0x60],	%g2
	orcc	%g6,	%i4,	%l6
	fmovsne	%xcc,	%f6,	%f17
	fmovse	%xcc,	%f2,	%f24
	movcc	%xcc,	%i6,	%l2
	nop
	setx	loop_1115,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	sllx	%o5,	0x04,	%i0
	fmovdvs	%xcc,	%f31,	%f1
	sllx	%l5,	%l1,	%g1
loop_1115:
	nop
	set	0x72, %g6
	lduha	[%l7 + %g6] 0x81,	%o4
	wr	%g0,	0x18,	%asi
	swapa	[%l7 + 0x58] %asi,	%l4
	fabss	%f2,	%f25
	add	%i1,	0x06BE,	%i3
	tcs	%icc,	0x6
	fbg	%fcc2,	loop_1116
	tge	%xcc,	0x1
	subcc	%o0,	%l0,	%o1
	wr	%g0,	0x11,	%asi
	ldxa	[%l7 + 0x58] %asi,	%i5
loop_1116:
	or	%g4,	%o7,	%o2
	fcmpne16	%f8,	%f16,	%l3
	tvs	%xcc,	0x5
	set	0x10, %l4
	ldda	[%l7 + %l4] 0x15,	%o6
	fmovrslz	%i7,	%f11,	%f0
	fmovspos	%xcc,	%f17,	%f26
	set	0x48, %o6
	ldxa	[%l7 + %o6] 0x04,	%g5
	srl	%o3,	0x1D,	%i2
	subc	%g7,	0x1B96,	%g3
	tsubcctv	%g6,	%i4,	%l6
	fpmerge	%f14,	%f7,	%f16
	edge32n	%i6,	%g2,	%l2
	fxnors	%f19,	%f19,	%f20
	udivx	%i0,	0x17D8,	%o5
	andn	%l5,	%l1,	%g1
	umul	%o4,	%l4,	%i3
	fsrc1s	%f30,	%f10
	wr	%g0,	0x19,	%asi
	lduwa	[%l7 + 0x64] %asi,	%o0
	smul	%l0,	%o1,	%i1
	addc	%i5,	0x0554,	%g4
	tgu	%icc,	0x3
	brnz	%o7,	loop_1117
	edge16l	%l3,	%o6,	%i7
	sllx	%g5,	0x02,	%o3
	fmul8ulx16	%f6,	%f20,	%f22
loop_1117:
	fmovdl	%xcc,	%f12,	%f28
	fbu	%fcc3,	loop_1118
	fors	%f30,	%f23,	%f22
	fsrc2s	%f28,	%f28
	fmul8ulx16	%f24,	%f8,	%f28
loop_1118:
	andcc	%o2,	0x1A8A,	%g7
	edge16	%g3,	%i2,	%g6
	udivx	%l6,	0x01A7,	%i6
	bneg,pt	%icc,	loop_1119
	tcc	%xcc,	0x5
	bvs,a,pn	%xcc,	loop_1120
	sll	%i4,	0x05,	%g2
loop_1119:
	srax	%l2,	%i0,	%o5
	xor	%l5,	%g1,	%l1
loop_1120:
	nop
	add	%l7,	0x10,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%o4
	casxa	[%l6] %asi,	%o4,	%i3
	movgu	%icc,	%o0,	%l4
	set	0x48, %o4
	sta	%f23,	[%l7 + %o4] 0x15
	fnot1s	%f27,	%f2
	fsrc2s	%f1,	%f9
	mulscc	%o1,	%l0,	%i5
	movneg	%icc,	%i1,	%o7
	ldub	[%l7 + 0x24],	%g4
	stx	%o6,	[%l7 + 0x40]
	fsrc2	%f0,	%f0
	bn,pt	%icc,	loop_1121
	edge32ln	%i7,	%l3,	%o3
	ld	[%l7 + 0x10],	%f0
	orn	%o2,	%g7,	%g5
loop_1121:
	fxnor	%f8,	%f16,	%f2
	movrgz	%g3,	0x21C,	%i2
	set	0x10, %i1
	stxa	%l6,	[%l7 + %i1] 0x14
	andcc	%i6,	%g6,	%i4
	fbl,a	%fcc0,	loop_1122
	tle	%icc,	0x5
	nop
	set	0x28, %l5
	std	%f16,	[%l7 + %l5]
	fornot2s	%f29,	%f27,	%f19
loop_1122:
	movle	%xcc,	%g2,	%l2
	edge16l	%i0,	%o5,	%l5
	mulx	%g1,	0x12B9,	%l1
	sub	%o4,	%i3,	%o0
	fmovscc	%xcc,	%f26,	%f28
	sdiv	%o1,	0x0EFE,	%l0
	movrne	%i5,	%l4,	%o7
	fbule,a	%fcc2,	loop_1123
	fcmpgt32	%f12,	%f10,	%i1
	alignaddrl	%o6,	%g4,	%l3
	nop
	set	0x70, %i0
	stx	%i7,	[%l7 + %i0]
loop_1123:
	fors	%f15,	%f28,	%f12
	tcc	%icc,	0x0
	bvs,pn	%xcc,	loop_1124
	tl	%icc,	0x5
	subcc	%o2,	0x0E99,	%o3
	edge8l	%g7,	%g5,	%g3
loop_1124:
	pdist	%f0,	%f4,	%f14
	alignaddrl	%i2,	%i6,	%l6
	fmovrsgz	%g6,	%f19,	%f12
	udiv	%i4,	0x0909,	%l2
	movcs	%icc,	%g2,	%i0
	umul	%o5,	%g1,	%l1
	edge32l	%l5,	%i3,	%o4
	stw	%o0,	[%l7 + 0x10]
	array32	%l0,	%o1,	%l4
	bvs,pn	%xcc,	loop_1125
	fabsd	%f2,	%f0
	movle	%xcc,	%o7,	%i1
	wr	%g0,	0x81,	%asi
	lduba	[%l7 + 0x70] %asi,	%i5
loop_1125:
	nop
	setx	loop_1126,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movrlez	%g4,	0x05C,	%l3
	brgz,a	%i7,	loop_1127
	umul	%o6,	0x0263,	%o3
loop_1126:
	tl	%icc,	0x4
	fbne,a	%fcc0,	loop_1128
loop_1127:
	tvc	%xcc,	0x1
	wr	%g0,	0x10,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
loop_1128:
	popc	%g7,	%o2
	smulcc	%g5,	%g3,	%i2
	mulx	%l6,	0x08B9,	%i6
	popc	0x0EB0,	%i4
	tpos	%icc,	0x4
	fmovrde	%g6,	%f14,	%f14
	be	loop_1129
	ldx	[%l7 + 0x50],	%l2
	tcs	%icc,	0x6
	stbar
loop_1129:
	sdiv	%g2,	0x03DA,	%i0
	fmovdg	%xcc,	%f22,	%f21
	movcc	%xcc,	%g1,	%o5
	add	%l7,	0x28,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] %asi,	%l1,	%i3
	sll	%o4,	%l5,	%l0
	bge,a,pn	%xcc,	loop_1130
	smulcc	%o1,	%l4,	%o0
	set	0x40, %g7
	stda	%f0,	[%l7 + %g7] 0xf0
	membar	#Sync
loop_1130:
	fbo,a	%fcc1,	loop_1131
	orn	%o7,	0x0CA3,	%i5
	movg	%icc,	%i1,	%l3
	srax	%g4,	%i7,	%o6
loop_1131:
	nop
	wr	%g0,	0x04,	%asi
	prefetcha	[%l7 + 0x78] %asi,	 0x2
	std	%f2,	[%l7 + 0x30]
	fnot2	%f26,	%f26
	umul	%o3,	0x0DD0,	%g5
	bcs,pn	%xcc,	loop_1132
	fmovdpos	%icc,	%f24,	%f13
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orcc	%o2,	0x0CB4,	%i2
loop_1132:
	xor	%g3,	0x1FB5,	%i6
	srlx	%i4,	0x19,	%g6
	fmul8x16au	%f5,	%f17,	%f28
	fabss	%f17,	%f29
	edge32n	%l6,	%g2,	%i0
	edge16n	%l2,	%g1,	%l1
	tneg	%xcc,	0x5
	movleu	%xcc,	%i3,	%o4
	fbe,a	%fcc1,	loop_1133
	swap	[%l7 + 0x4C],	%l5
	edge16ln	%l0,	%o1,	%o5
	fbg	%fcc1,	loop_1134
loop_1133:
	udivx	%o0,	0x1AFE,	%o7
	movg	%icc,	%i5,	%i1
	bl,a,pt	%icc,	loop_1135
loop_1134:
	fcmps	%fcc0,	%f20,	%f16
	sth	%l4,	[%l7 + 0x48]
	srlx	%l3,	%i7,	%g4
loop_1135:
	addccc	%g7,	%o6,	%o3
	edge8n	%g5,	%i2,	%g3
	fabss	%f28,	%f3
	fcmpes	%fcc0,	%f31,	%f21
	edge16l	%i6,	%o2,	%g6
	andn	%i4,	0x1539,	%g2
	fones	%f20
	popc	%l6,	%l2
	addcc	%g1,	%i0,	%l1
	sra	%i3,	0x08,	%l5
	fmovrdgz	%o4,	%f2,	%f24
	fpsub16	%f6,	%f20,	%f30
	membar	0x6F
	bvs,pt	%icc,	loop_1136
	edge16l	%o1,	%l0,	%o5
	bge,a,pn	%xcc,	loop_1137
	fmovrse	%o0,	%f31,	%f22
loop_1136:
	membar	0x26
	move	%xcc,	%o7,	%i5
loop_1137:
	bne,a	loop_1138
	tsubcctv	%i1,	%l4,	%l3
	edge16	%g4,	%i7,	%o6
	movneg	%xcc,	%o3,	%g7
loop_1138:
	nop
	set	0x63, %l6
	ldsba	[%l7 + %l6] 0x0c,	%g5
	orncc	%i2,	0x0911,	%g3
	fandnot1s	%f11,	%f28,	%f11
	srlx	%o2,	0x1F,	%i6
	std	%f28,	[%l7 + 0x78]
	fornot1s	%f21,	%f25,	%f3
	fmovsleu	%icc,	%f29,	%f9
	ldub	[%l7 + 0x26],	%i4
	stw	%g2,	[%l7 + 0x48]
	fcmpeq32	%f22,	%f24,	%l6
	nop
	setx	loop_1139,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	tle	%xcc,	0x4
	movpos	%xcc,	%g6,	%g1
	edge8l	%l2,	%i0,	%i3
loop_1139:
	sdivcc	%l5,	0x080D,	%o4
	tge	%icc,	0x4
	stbar
	movrlez	%o1,	%l0,	%o5
	addc	%l1,	0x0FD5,	%o7
	brgz	%o0,	loop_1140
	fand	%f26,	%f22,	%f12
	addccc	%i5,	0x0893,	%i1
	tle	%xcc,	0x0
loop_1140:
	fblg,a	%fcc1,	loop_1141
	mulscc	%l4,	0x1B2C,	%l3
	fpadd32	%f20,	%f16,	%f14
	fxor	%f2,	%f30,	%f12
loop_1141:
	sllx	%i7,	0x1D,	%g4
	set	0x48, %i7
	stxa	%o3,	[%l7 + %i7] 0x80
	sub	%g7,	0x048B,	%g5
	wr	%g0,	0x52,	%asi
	ldxa	[%g0 + 0x208] %asi,	%i2
	lduw	[%l7 + 0x40],	%g3
	smulcc	%o2,	0x1C24,	%i6
	fornot1s	%f21,	%f26,	%f30
	popc	%o6,	%i4
	movvs	%xcc,	%l6,	%g2
	fcmpgt16	%f22,	%f30,	%g1
	fmovsvc	%xcc,	%f3,	%f11
	st	%f18,	[%l7 + 0x70]
	and	%l2,	0x1C6E,	%i0
	movle	%icc,	%i3,	%l5
	taddcc	%g6,	%o1,	%o4
	fbl,a	%fcc3,	loop_1142
	fmovdleu	%icc,	%f18,	%f17
	sir	0x0D4F
	fbul	%fcc3,	loop_1143
loop_1142:
	orcc	%l0,	0x18A0,	%l1
	taddcctv	%o7,	%o5,	%i5
	movneg	%xcc,	%i1,	%l4
loop_1143:
	movvc	%icc,	%o0,	%l3
	fmovdg	%xcc,	%f16,	%f4
	tcc	%icc,	0x7
	fmovd	%f22,	%f16
	add	%l7,	0x20,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] %asi,	%i7,	%g4
	movle	%xcc,	%o3,	%g5
	prefetch	[%l7 + 0x10],	 0x2
	ldd	[%l7 + 0x18],	%f2
	fbuge	%fcc1,	loop_1144
	tge	%xcc,	0x0
	stb	%g7,	[%l7 + 0x65]
	fbue	%fcc1,	loop_1145
loop_1144:
	bge,pn	%xcc,	loop_1146
	fnand	%f24,	%f8,	%f28
	bl,a	%icc,	loop_1147
loop_1145:
	bvs	%icc,	loop_1148
loop_1146:
	fcmpne16	%f2,	%f12,	%i2
	edge32n	%o2,	%i6,	%o6
loop_1147:
	andcc	%i4,	0x1A3B,	%l6
loop_1148:
	srax	%g2,	%g3,	%g1
	call	loop_1149
	fones	%f9
	and	%l2,	%i0,	%i3
	bcc	%xcc,	loop_1150
loop_1149:
	taddcc	%l5,	%o1,	%g6
	fsrc2	%f4,	%f16
	fpsub32	%f20,	%f16,	%f20
loop_1150:
	fmovda	%xcc,	%f8,	%f10
	tg	%xcc,	0x5
	smul	%o4,	%l1,	%o7
	sir	0x0FCC
	fors	%f11,	%f19,	%f15
	fblg	%fcc3,	loop_1151
	fmovdneg	%icc,	%f2,	%f10
	tsubcctv	%o5,	%i5,	%l0
	subc	%l4,	%o0,	%l3
loop_1151:
	movl	%icc,	%i1,	%i7
	fnot1	%f18,	%f10
	fmuld8ulx16	%f25,	%f4,	%f24
	movrgz	%o3,	%g4,	%g5
	movrgz	%g7,	%i2,	%o2
	movne	%xcc,	%o6,	%i6
	set	0x44, %i5
	ldswa	[%l7 + %i5] 0x15,	%i4
	movrgez	%l6,	0x259,	%g3
	movre	%g2,	0x073,	%l2
	fbuge	%fcc3,	loop_1152
	subc	%g1,	%i3,	%i0
	ta	%icc,	0x5
	wr	%g0,	0x80,	%asi
	lduba	[%l7 + 0x3A] %asi,	%o1
loop_1152:
	movgu	%xcc,	%g6,	%o4
	edge16	%l1,	%l5,	%o7
	udiv	%i5,	0x0F7D,	%o5
	lduw	[%l7 + 0x2C],	%l0
	fors	%f2,	%f27,	%f15
	taddcc	%l4,	0x17A4,	%l3
	fmovdcs	%icc,	%f20,	%f15
	bcs	%xcc,	loop_1153
	membar	0x29
	fcmpeq32	%f10,	%f24,	%i1
	taddcctv	%i7,	0x1638,	%o0
loop_1153:
	bcs	%xcc,	loop_1154
	add	%o3,	%g4,	%g7
	fandnot2	%f8,	%f12,	%f18
	fones	%f12
loop_1154:
	nop
	wr	%g0,	0x2b,	%asi
	ldda	[%l7 + 0x10] %asi,	%g4
	movl	%xcc,	%i2,	%o2
	add	%o6,	0x071A,	%i6
	fornot2	%f20,	%f4,	%f24
	tn	%xcc,	0x1
	wr	%g0,	0x88,	%asi
	ldsha	[%l7 + 0x0E] %asi,	%l6
	fpsub16	%f10,	%f0,	%f18
	andncc	%g3,	%g2,	%l2
	tleu	%xcc,	0x0
	lduw	[%l7 + 0x7C],	%g1
	wr	%g0,	0x11,	%asi
	sta	%f28,	[%l7 + 0x08] %asi
	fmovrde	%i4,	%f14,	%f8
	movne	%icc,	%i0,	%i3
	fmovde	%xcc,	%f30,	%f25
	smulcc	%o1,	%o4,	%g6
	sethi	0x113A,	%l5
	fnands	%f19,	%f26,	%f8
	subc	%o7,	0x1825,	%l1
	fsrc2s	%f20,	%f17
	or	%i5,	%l0,	%l4
	sir	0x11DA
	fmovs	%f22,	%f20
	tpos	%icc,	0x4
	std	%f8,	[%l7 + 0x38]
	subcc	%l3,	%i1,	%i7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrne	%o5,	0x145,	%o0
	srl	%g4,	0x0A,	%g7
	fbug,a	%fcc2,	loop_1155
	subccc	%g5,	%o3,	%o2
	tcc	%xcc,	0x0
	tg	%icc,	0x3
loop_1155:
	movl	%icc,	%i2,	%o6
	fpack16	%f2,	%f16
	ta	%icc,	0x0
	movpos	%icc,	%l6,	%i6
	movcs	%icc,	%g3,	%g2
	bge,a	loop_1156
	movre	%l2,	0x1BE,	%g1
	srax	%i4,	0x12,	%i0
	ta	%icc,	0x1
loop_1156:
	edge16ln	%i3,	%o4,	%o1
	movrlez	%l5,	%g6,	%l1
	fbule,a	%fcc3,	loop_1157
	sdivx	%i5,	0x1DD6,	%o7
	movgu	%icc,	%l4,	%l0
	movcs	%icc,	%i1,	%l3
loop_1157:
	nop
	set	0x20, %i2
	ldda	[%l7 + %i2] 0x0c,	%o4
	ld	[%l7 + 0x6C],	%f30
	movre	%i7,	0x3D3,	%g4
	tvc	%icc,	0x1
	tleu	%icc,	0x4
	ldd	[%l7 + 0x30],	%g6
	movge	%xcc,	%g5,	%o3
	andcc	%o0,	%o2,	%i2
	tvs	%xcc,	0x1
	movcs	%icc,	%o6,	%l6
	fpsub32s	%f17,	%f9,	%f19
	movl	%icc,	%i6,	%g2
	fmovdcs	%xcc,	%f21,	%f28
	fabss	%f6,	%f31
	mulscc	%g3,	%l2,	%g1
	array16	%i0,	%i3,	%o4
	movl	%icc,	%o1,	%i4
	movrgez	%g6,	%l1,	%l5
	tle	%xcc,	0x7
	add	%o7,	0x0B1C,	%i5
	fxnors	%f2,	%f5,	%f29
	movvs	%xcc,	%l0,	%l4
	subc	%i1,	%l3,	%i7
	subccc	%g4,	0x016F,	%g7
	nop
	setx loop_1158, %l0, %l1
	jmpl %l1, %g5
	bvs,a,pn	%icc,	loop_1159
	movrne	%o5,	0x0D3,	%o3
	taddcc	%o0,	%i2,	%o2
loop_1158:
	sdivcc	%l6,	0x1B65,	%o6
loop_1159:
	array8	%g2,	%g3,	%l2
	alignaddr	%g1,	%i0,	%i6
	sdivx	%o4,	0x0022,	%o1
	subc	%i3,	0x1857,	%i4
	te	%icc,	0x6
	movleu	%icc,	%l1,	%l5
	movcs	%icc,	%g6,	%o7
	edge32n	%l0,	%i5,	%i1
	fsrc1	%f0,	%f30
	fxor	%f14,	%f10,	%f22
	edge16	%l4,	%i7,	%g4
	sdiv	%g7,	0x0DD2,	%l3
	ldx	[%l7 + 0x20],	%g5
	wr	%g0,	0x89,	%asi
	prefetcha	[%l7 + 0x70] %asi,	 0x2
	movrlez	%o0,	%i2,	%o2
	alignaddr	%o3,	%l6,	%o6
	fmovsn	%icc,	%f10,	%f6
	udivx	%g2,	0x078A,	%l2
	bleu	%icc,	loop_1160
	fxnors	%f27,	%f23,	%f8
	mova	%icc,	%g1,	%i0
	fbo	%fcc1,	loop_1161
loop_1160:
	smulcc	%g3,	%i6,	%o1
	mulscc	%i3,	%i4,	%l1
	add	%l7,	0x30,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%o4
	casxa	[%l6] 0x88,	%o4,	%l5
loop_1161:
	fxor	%f18,	%f8,	%f0
	tcc	%icc,	0x6
	fnands	%f27,	%f3,	%f5
	andcc	%g6,	0x02E2,	%o7
	fpmerge	%f18,	%f22,	%f6
	edge32l	%l0,	%i1,	%i5
	set	0x68, %o3
	ldxa	[%l7 + %o3] 0x14,	%i7
	smulcc	%l4,	0x1890,	%g7
	fbe	%fcc0,	loop_1162
	edge16l	%g4,	%g5,	%l3
	movleu	%icc,	%o5,	%o0
	set	0x3E, %g4
	lduha	[%l7 + %g4] 0x89,	%i2
loop_1162:
	nop
	set	0x60, %g1
	ldsha	[%l7 + %g1] 0x14,	%o2
	taddcctv	%o3,	%l6,	%o6
	movg	%icc,	%g2,	%l2
	tn	%xcc,	0x0
	call	loop_1163
	fmovdleu	%icc,	%f22,	%f7
	tsubcctv	%i0,	%g1,	%g3
	movg	%xcc,	%o1,	%i3
loop_1163:
	nop
	membar	#Sync
	wr	%g0,	0xf1,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	udiv	%i6,	0x1C8B,	%l1
	edge16l	%o4,	%i4,	%g6
	movcs	%xcc,	%l5,	%l0
	movrlz	%i1,	0x09A,	%o7
	edge8ln	%i5,	%i7,	%l4
	set	0x1E, %o5
	stha	%g4,	[%l7 + %o5] 0x10
	fmovscs	%xcc,	%f5,	%f11
	xor	%g5,	0x1F96,	%g7
	movne	%xcc,	%o5,	%o0
	fmovrdgz	%i2,	%f28,	%f16
	edge16n	%l3,	%o2,	%o3
	movrgz	%o6,	%l6,	%g2
	set	0x2C, %o1
	ldswa	[%l7 + %o1] 0x89,	%l2
	ldx	[%l7 + 0x18],	%i0
	tle	%xcc,	0x1
	orn	%g1,	0x07C4,	%o1
	mova	%icc,	%i3,	%i6
	fmul8x16	%f17,	%f10,	%f16
	tge	%xcc,	0x3
	addccc	%g3,	0x0593,	%l1
	movrlez	%o4,	%i4,	%g6
	te	%icc,	0x7
	edge32ln	%l5,	%i1,	%o7
	tcc	%xcc,	0x6
	movvs	%icc,	%l0,	%i5
	xorcc	%i7,	0x1000,	%l4
	subcc	%g5,	%g7,	%g4
	tgu	%xcc,	0x0
	bne,pn	%xcc,	loop_1164
	ldsb	[%l7 + 0x3A],	%o0
	wr	%g0,	0x19,	%asi
	lduha	[%l7 + 0x58] %asi,	%o5
loop_1164:
	nop
	set	0x1B, %o0
	ldstuba	[%l7 + %o0] 0x81,	%i2
	tn	%icc,	0x2
	and	%l3,	%o3,	%o2
	taddcctv	%l6,	0x05B3,	%g2
	fmovdleu	%xcc,	%f3,	%f28
	fnands	%f17,	%f24,	%f25
	movg	%icc,	%o6,	%l2
	sll	%i0,	0x1D,	%g1
	andncc	%i3,	%o1,	%g3
	wr	%g0,	0x11,	%asi
	sta	%f11,	[%l7 + 0x34] %asi
	andn	%i6,	0x0467,	%l1
	bne,a,pn	%xcc,	loop_1165
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bvc,a,pn	%xcc,	loop_1166
	xnor	%i4,	%g6,	%o4
loop_1165:
	nop
	set	0x3E, %i3
	stha	%l5,	[%l7 + %i3] 0x88
loop_1166:
	nop
	wr	%g0,	0xe3,	%asi
	stha	%i1,	[%l7 + 0x1E] %asi
	membar	#Sync
	set	0x0C, %g2
	lda	[%l7 + %g2] 0x0c,	%f22
	pdist	%f30,	%f6,	%f14
	tg	%icc,	0x1
	fbule	%fcc2,	loop_1167
	movrlez	%l0,	0x136,	%i5
	movcs	%xcc,	%o7,	%l4
	set	0x40, %g5
	stda	%f0,	[%l7 + %g5] 0x10
loop_1167:
	nop
	wr	%g0,	0x10,	%asi
	ldstuba	[%l7 + 0x1E] %asi,	%i7
	subccc	%g5,	%g4,	%o0
	fandnot2	%f12,	%f24,	%f8
	set	0x0, %i6
	ldxa	[%g0 + %i6] 0x20,	%g7
	edge32l	%i2,	%l3,	%o3
	edge16ln	%o5,	%l6,	%g2
	wr	%g0,	0x81,	%asi
	stxa	%o6,	[%l7 + 0x48] %asi
	sra	%l2,	%i0,	%g1
	fmovrdlez	%o2,	%f14,	%f28
	brlez	%i3,	loop_1168
	fmovsne	%xcc,	%f30,	%f29
	set	0x4C, %g3
	lduha	[%l7 + %g3] 0x89,	%o1
loop_1168:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orncc	%i6,	0x09FF,	%g3
	bl,a	loop_1169
	movleu	%icc,	%i4,	%g6
	edge8	%l1,	%o4,	%l5
	taddcc	%i1,	%i5,	%o7
loop_1169:
	call	loop_1170
	tcc	%icc,	0x0
	fmovdvs	%xcc,	%f18,	%f26
	tcs	%icc,	0x2
loop_1170:
	movge	%xcc,	%l4,	%l0
	membar	0x23
	subcc	%g5,	0x0C52,	%g4
	edge8n	%i7,	%g7,	%o0
	tvc	%xcc,	0x5
	array16	%i2,	%l3,	%o3
	umulcc	%l6,	%o5,	%o6
	fzeros	%f23
	sdivcc	%g2,	0x0ACF,	%l2
	bn,a,pn	%icc,	loop_1171
	fnegs	%f9,	%f9
	set	0x46, %l2
	stba	%g1,	[%l7 + %l2] 0xea
	membar	#Sync
loop_1171:
	nop
	set	0x7C, %l0
	sta	%f24,	[%l7 + %l0] 0x11
	set	0x18, %i4
	lda	[%l7 + %i4] 0x0c,	%f17
	alignaddr	%i0,	%o2,	%i3
	fxor	%f18,	%f16,	%f4
	fmovdvs	%icc,	%f3,	%f27
	tcc	%icc,	0x1
	or	%o1,	%g3,	%i4
	movcs	%icc,	%i6,	%g6
	te	%xcc,	0x7
	call	loop_1172
	edge32	%l1,	%l5,	%o4
	ta	%xcc,	0x4
	edge32n	%i5,	%o7,	%l4
loop_1172:
	lduw	[%l7 + 0x64],	%i1
	tcs	%icc,	0x4
	edge32	%g5,	%g4,	%i7
	fbo,a	%fcc2,	loop_1173
	bge,a	loop_1174
	umulcc	%g7,	0x0F81,	%o0
	smulcc	%l0,	%i2,	%o3
loop_1173:
	sdivcc	%l3,	0x1864,	%o5
loop_1174:
	fmovspos	%icc,	%f6,	%f23
	orn	%o6,	0x1024,	%l6
	tneg	%icc,	0x0
	tne	%icc,	0x0
	fbo	%fcc0,	loop_1175
	orn	%g2,	%l2,	%g1
	sllx	%o2,	%i3,	%o1
	subccc	%i0,	0x16C0,	%g3
loop_1175:
	movne	%icc,	%i4,	%g6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpsub16s	%f26,	%f10,	%f10
	tn	%icc,	0x2
	tleu	%xcc,	0x7
	brnz	%l1,	loop_1176
	membar	0x1E
	movge	%icc,	%l5,	%i6
	set	0x70, %l3
	lduha	[%l7 + %l3] 0x11,	%i5
loop_1176:
	tn	%xcc,	0x6
	mulscc	%o4,	%l4,	%i1
	mulscc	%o7,	%g5,	%g4
	wr	%g0,	0x2a,	%asi
	ldda	[%l7 + 0x30] %asi,	%i6
	wr	%g0,	0xe3,	%asi
	stba	%g7,	[%l7 + 0x17] %asi
	membar	#Sync
	tvs	%xcc,	0x6
	fbe,a	%fcc3,	loop_1177
	orcc	%o0,	%i2,	%o3
	mulx	%l3,	0x124A,	%o5
	taddcc	%l0,	0x0BD8,	%l6
loop_1177:
	sir	0x01A3
	orncc	%g2,	%l2,	%o6
	tcs	%xcc,	0x1
	ldsw	[%l7 + 0x50],	%o2
	set	0x58, %l1
	prefetcha	[%l7 + %l1] 0x89,	 0x3
	movle	%xcc,	%i3,	%i0
	lduh	[%l7 + 0x76],	%g3
	ldx	[%l7 + 0x70],	%o1
	sdiv	%g6,	0x16AC,	%i4
	fone	%f18
	movn	%icc,	%l1,	%i6
	fzeros	%f12
	fmovd	%f24,	%f30
	alignaddr	%i5,	%o4,	%l4
	orncc	%i1,	0x07EF,	%l5
	fcmpes	%fcc2,	%f1,	%f1
	srax	%o7,	%g5,	%g4
	tge	%xcc,	0x5
	set	0x78, %o7
	ldswa	[%l7 + %o7] 0x15,	%g7
	udiv	%o0,	0x1CB6,	%i2
	tsubcc	%i7,	%o3,	%o5
	nop
	set	0x50, %g6
	sth	%l0,	[%l7 + %g6]
	fbne,a	%fcc2,	loop_1178
	brnz,a	%l6,	loop_1179
	movcs	%icc,	%l3,	%g2
	fnot2s	%f21,	%f24
loop_1178:
	move	%icc,	%o6,	%l2
loop_1179:
	tpos	%icc,	0x4
	fmovdgu	%xcc,	%f0,	%f2
	tl	%xcc,	0x5
	fcmpd	%fcc0,	%f26,	%f4
	fcmps	%fcc2,	%f0,	%f16
	and	%o2,	%i3,	%g1
	stw	%i0,	[%l7 + 0x10]
	sll	%g3,	%o1,	%i4
	fcmpeq32	%f16,	%f0,	%g6
	brnz	%l1,	loop_1180
	fmovscs	%icc,	%f24,	%f22
	fxors	%f1,	%f21,	%f14
	edge32n	%i6,	%o4,	%l4
loop_1180:
	bleu	%icc,	loop_1181
	sra	%i1,	0x1F,	%l5
	ta	%xcc,	0x6
	udiv	%i5,	0x19D7,	%g5
loop_1181:
	fabsd	%f22,	%f18
	ta	%xcc,	0x1
	faligndata	%f6,	%f24,	%f4
	edge32	%o7,	%g4,	%o0
	set	0x58, %l4
	stwa	%i2,	[%l7 + %l4] 0x27
	membar	#Sync
	andcc	%g7,	0x1134,	%i7
	fcmpne16	%f16,	%f4,	%o3
	movge	%xcc,	%l0,	%o5
	edge8l	%l3,	%g2,	%l6
	wr	%g0,	0x89,	%asi
	ldda	[%l7 + 0x70] %asi,	%o6
	fone	%f24
	membar	0x40
	srlx	%o2,	%l2,	%g1
	movrgz	%i3,	%g3,	%o1
	edge8	%i0,	%g6,	%i4
	tneg	%icc,	0x1
	fmovdcs	%xcc,	%f8,	%f18
	fmovdcs	%xcc,	%f22,	%f9
	wr	%g0,	0x11,	%asi
	ldxa	[%l7 + 0x30] %asi,	%i6
	fmovsleu	%icc,	%f27,	%f4
	fmovsleu	%xcc,	%f16,	%f11
	fcmpeq32	%f6,	%f10,	%l1
	bn	%icc,	loop_1182
	stw	%o4,	[%l7 + 0x24]
	fbne	%fcc2,	loop_1183
	mova	%xcc,	%l4,	%l5
loop_1182:
	fmovsne	%icc,	%f21,	%f10
	sdivcc	%i1,	0x0ABA,	%i5
loop_1183:
	edge32n	%o7,	%g5,	%o0
	ta	%xcc,	0x1
	movcc	%xcc,	%i2,	%g4
	fnot1	%f2,	%f10
	edge16n	%g7,	%i7,	%l0
	edge16n	%o3,	%l3,	%g2
	addcc	%l6,	0x1820,	%o5
	add	%o6,	%l2,	%g1
	fbug	%fcc1,	loop_1184
	fmovrdlez	%o2,	%f20,	%f24
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnot1	%f24,	%f18
loop_1184:
	nop
	wr	%g0,	0x10,	%asi
	ldsba	[%l7 + 0x3A] %asi,	%g3
	fcmpeq16	%f10,	%f28,	%i3
	andcc	%o1,	0x144D,	%g6
	fbg	%fcc2,	loop_1185
	movrgz	%i0,	%i6,	%l1
	andn	%i4,	%o4,	%l5
	orncc	%l4,	0x1835,	%i5
loop_1185:
	bcs,a	loop_1186
	movrne	%o7,	%i1,	%g5
	fmul8x16au	%f4,	%f13,	%f24
	tneg	%xcc,	0x2
loop_1186:
	movcc	%icc,	%o0,	%i2
	subcc	%g4,	%g7,	%l0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsw	[%l7 + 0x38],	%i7
	fsrc2	%f0,	%f24
	ba,a,pn	%xcc,	loop_1187
	fcmple16	%f6,	%f14,	%l3
	xorcc	%g2,	%o3,	%o5
	tle	%xcc,	0x3
loop_1187:
	nop
	set	0x40, %o6
	ldda	[%l7 + %o6] 0x10,	%f16
	fandnot2s	%f7,	%f1,	%f21
	taddcctv	%o6,	%l2,	%g1
	fmovsn	%xcc,	%f4,	%f30
	ta	%icc,	0x4
	bge,a,pt	%xcc,	loop_1188
	fcmpes	%fcc2,	%f0,	%f4
	tle	%xcc,	0x5
	bl,pn	%xcc,	loop_1189
loop_1188:
	fpadd16	%f2,	%f30,	%f18
	tl	%icc,	0x1
	fmovsg	%icc,	%f29,	%f23
loop_1189:
	fpsub32s	%f25,	%f2,	%f13
	orn	%l6,	0x0AE8,	%o2
	movrlz	%i3,	0x285,	%o1
	fmul8x16	%f31,	%f12,	%f18
	wr	%g0,	0x10,	%asi
	stha	%g6,	[%l7 + 0x34] %asi
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	or	%g3,	0x04ED,	%i6
	brz	%i0,	loop_1190
	tsubcctv	%l1,	%o4,	%l5
	movrgez	%l4,	0x263,	%i5
	tpos	%xcc,	0x3
loop_1190:
	ldsw	[%l7 + 0x78],	%o7
	tpos	%icc,	0x1
	udivx	%i4,	0x094A,	%i1
	fmovrsne	%g5,	%f30,	%f12
	tg	%xcc,	0x4
	brlez,a	%o0,	loop_1191
	move	%xcc,	%g4,	%i2
	bleu,pt	%icc,	loop_1192
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1191:
	movrne	%l0,	%i7,	%l3
	sll	%g7,	%g2,	%o3
loop_1192:
	movne	%icc,	%o5,	%l2
	fandnot1s	%f8,	%f23,	%f31
	movg	%xcc,	%o6,	%g1
	and	%l6,	0x1EB1,	%o2
	mulx	%i3,	%g6,	%g3
	array32	%o1,	%i0,	%i6
	fcmpes	%fcc1,	%f31,	%f26
	movpos	%xcc,	%o4,	%l5
	fmovsn	%icc,	%f28,	%f12
	wr	%g0,	0x19,	%asi
	swapa	[%l7 + 0x38] %asi,	%l4
	andcc	%l1,	0x03BE,	%o7
	fcmpes	%fcc2,	%f26,	%f13
	movl	%xcc,	%i5,	%i1
	mulx	%g5,	%o0,	%i4
	fsrc2s	%f5,	%f6
	edge8	%g4,	%l0,	%i2
	fmovse	%icc,	%f26,	%f4
	fnot1	%f26,	%f14
	tne	%xcc,	0x0
	fpsub16	%f2,	%f24,	%f6
	ta	%icc,	0x5
	fabss	%f29,	%f16
	tn	%icc,	0x6
	bcs,a,pn	%xcc,	loop_1193
	movleu	%xcc,	%l3,	%i7
	tcs	%xcc,	0x2
	srl	%g2,	0x05,	%o3
loop_1193:
	fbe	%fcc2,	loop_1194
	fmuld8ulx16	%f30,	%f21,	%f18
	udiv	%o5,	0x1478,	%g7
	set	0x69, %o2
	ldstuba	[%l7 + %o2] 0x89,	%o6
loop_1194:
	fmovscs	%xcc,	%f1,	%f14
	fbge,a	%fcc2,	loop_1195
	tne	%icc,	0x2
	mulscc	%l2,	0x03CA,	%g1
	fmovrdne	%l6,	%f8,	%f20
loop_1195:
	movrne	%o2,	%i3,	%g6
	fones	%f3
	wr	%g0,	0x81,	%asi
	lda	[%l7 + 0x5C] %asi,	%f14
	subc	%g3,	%i0,	%i6
	fand	%f20,	%f30,	%f22
	addcc	%o4,	%o1,	%l5
	smulcc	%l4,	0x0B67,	%l1
	fzeros	%f3
	fmovdgu	%xcc,	%f28,	%f22
	fmovrsne	%o7,	%f15,	%f11
	fnot2s	%f19,	%f26
	and	%i5,	0x1476,	%i1
	alignaddrl	%g5,	%o0,	%g4
	movvs	%xcc,	%l0,	%i2
	fpmerge	%f18,	%f20,	%f14
	and	%i4,	%i7,	%g2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdl	%xcc,	%f21,	%f5
	movgu	%icc,	%l3,	%o5
	tsubcc	%g7,	%o6,	%o3
	mova	%icc,	%g1,	%l2
	tle	%xcc,	0x6
	sll	%l6,	0x13,	%i3
	brnz,a	%o2,	loop_1196
	fcmpes	%fcc2,	%f4,	%f27
	fmovdcc	%icc,	%f3,	%f17
	bvc,a	loop_1197
loop_1196:
	alignaddrl	%g3,	%i0,	%i6
	movl	%icc,	%g6,	%o4
	or	%o1,	0x0A2C,	%l5
loop_1197:
	edge16n	%l1,	%l4,	%o7
	movvs	%icc,	%i5,	%i1
	fmovs	%f4,	%f28
	fcmped	%fcc2,	%f28,	%f20
	addc	%g5,	0x0107,	%o0
	ldsb	[%l7 + 0x15],	%g4
	tg	%icc,	0x1
	fpsub32s	%f31,	%f14,	%f19
	membar	0x25
	tge	%xcc,	0x6
	brlz,a	%i2,	loop_1198
	fbule	%fcc2,	loop_1199
	fbne,a	%fcc2,	loop_1200
	move	%xcc,	%i4,	%l0
loop_1198:
	ta	%icc,	0x6
loop_1199:
	tg	%xcc,	0x2
loop_1200:
	tcs	%xcc,	0x7
	tsubcctv	%g2,	0x0DEB,	%i7
	nop
	setx loop_1201, %l0, %l1
	jmpl %l1, %o5
	stx	%l3,	[%l7 + 0x20]
	andcc	%g7,	0x0AAF,	%o3
	edge16	%o6,	%g1,	%l2
loop_1201:
	movcc	%icc,	%i3,	%l6
	fbo	%fcc1,	loop_1202
	sir	0x0EB3
	movrlz	%o2,	%g3,	%i0
	mova	%xcc,	%g6,	%i6
loop_1202:
	sllx	%o4,	0x0B,	%l5
	alignaddr	%o1,	%l4,	%o7
	or	%i5,	0x04B2,	%i1
	xor	%g5,	0x00DB,	%o0
	fnot2	%f2,	%f22
	nop
	setx loop_1203, %l0, %l1
	jmpl %l1, %g4
	ldsb	[%l7 + 0x22],	%l1
	movleu	%xcc,	%i4,	%i2
	fmovdne	%xcc,	%f21,	%f7
loop_1203:
	move	%icc,	%l0,	%i7
	fones	%f15
	edge32ln	%o5,	%g2,	%l3
	movn	%xcc,	%g7,	%o6
	srl	%g1,	0x06,	%o3
	set	0x20, %o4
	stba	%l2,	[%l7 + %o4] 0x04
	xor	%l6,	0x1DB9,	%o2
	umulcc	%i3,	0x1EE3,	%g3
	orn	%i0,	0x1AC3,	%i6
	tneg	%icc,	0x0
	set	0x70, %i1
	prefetcha	[%l7 + %i1] 0x89,	 0x0
	bvs	%icc,	loop_1204
	smul	%g6,	0x127B,	%l5
	sdivx	%l4,	0x17CF,	%o1
	sir	0x1D13
loop_1204:
	fcmpeq16	%f20,	%f14,	%i5
	sra	%o7,	%g5,	%o0
	movg	%icc,	%i1,	%g4
	fpack32	%f8,	%f0,	%f18
	fbo	%fcc1,	loop_1205
	movg	%icc,	%l1,	%i4
	alignaddr	%l0,	%i2,	%o5
	fbul,a	%fcc3,	loop_1206
loop_1205:
	xor	%i7,	0x1378,	%l3
	movg	%icc,	%g7,	%g2
	fbg,a	%fcc0,	loop_1207
loop_1206:
	movrne	%g1,	%o6,	%l2
	fands	%f9,	%f22,	%f17
	mulx	%l6,	0x1575,	%o3
loop_1207:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrne	%o2,	%i3,	%i0
	edge16	%g3,	%o4,	%i6
	tcs	%xcc,	0x7
	fmul8x16	%f3,	%f8,	%f0
	set	0x48, %i0
	lduwa	[%l7 + %i0] 0x19,	%l5
	sll	%g6,	%o1,	%i5
	brz	%l4,	loop_1208
	ld	[%l7 + 0x30],	%f5
	fandnot2	%f14,	%f28,	%f20
	wr	%g0,	0x23,	%asi
	stda	%g4,	[%l7 + 0x68] %asi
	membar	#Sync
loop_1208:
	stbar
	fbul	%fcc1,	loop_1209
	bvs,a	%xcc,	loop_1210
	addcc	%o0,	0x0D72,	%o7
	tl	%xcc,	0x6
loop_1209:
	fmovsl	%icc,	%f12,	%f29
loop_1210:
	fble	%fcc2,	loop_1211
	andcc	%g4,	0x1D87,	%l1
	udivx	%i4,	0x0F4C,	%l0
	set	0x78, %g7
	ldxa	[%l7 + %g7] 0x18,	%i2
loop_1211:
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
	fnot2s	%f6,	%f26
	prefetch	[%l7 + 0x68],	 0x2
	srl	%o5,	0x03,	%i1
loop_1212:
	smulcc	%i7,	%l3,	%g2
	tge	%icc,	0x4
	andcc	%g7,	%o6,	%l2
	movcc	%icc,	%g1,	%l6
	sdiv	%o2,	0x0855,	%o3
	fmovsvc	%xcc,	%f21,	%f12
	fmovdg	%xcc,	%f31,	%f4
	ta	%xcc,	0x7
	ldsb	[%l7 + 0x09],	%i0
	fmovda	%icc,	%f0,	%f2
	edge8ln	%g3,	%o4,	%i3
	mulscc	%l5,	0x1734,	%i6
	fbn,a	%fcc1,	loop_1213
	nop
	set	0x30, %l6
	std	%o0,	[%l7 + %l6]
	fbn,a	%fcc1,	loop_1214
	fcmple16	%f28,	%f6,	%g6
loop_1213:
	fmovrsgez	%i5,	%f24,	%f6
	umul	%g5,	0x138B,	%o0
loop_1214:
	ldx	[%l7 + 0x70],	%o7
	fbule,a	%fcc3,	loop_1215
	fcmps	%fcc1,	%f12,	%f22
	fnor	%f8,	%f20,	%f6
	smul	%g4,	%l4,	%i4
loop_1215:
	fcmps	%fcc2,	%f27,	%f14
	mulscc	%l1,	%l0,	%o5
	taddcctv	%i2,	0x167D,	%i7
	srl	%i1,	0x17,	%l3
	taddcctv	%g2,	0x0014,	%o6
	std	%l2,	[%l7 + 0x08]
	ldx	[%l7 + 0x10],	%g7
	subc	%g1,	%l6,	%o3
	edge16ln	%o2,	%g3,	%i0
	udivx	%o4,	0x1D8B,	%l5
	stbar
	taddcctv	%i6,	%o1,	%g6
	ldsh	[%l7 + 0x2E],	%i3
	sll	%g5,	%o0,	%o7
	sub	%i5,	%l4,	%g4
	fcmpgt32	%f2,	%f26,	%l1
	swap	[%l7 + 0x20],	%l0
	lduh	[%l7 + 0x3E],	%o5
	subc	%i2,	%i4,	%i7
	fpack16	%f30,	%f27
	array16	%i1,	%g2,	%o6
	wr	%g0,	0x81,	%asi
	sta	%f31,	[%l7 + 0x0C] %asi
	swap	[%l7 + 0x18],	%l3
	orcc	%g7,	%g1,	%l6
	nop
	set	0x18, %i7
	std	%f0,	[%l7 + %i7]
	movge	%xcc,	%l2,	%o2
	brnz,a	%g3,	loop_1216
	fbe	%fcc0,	loop_1217
	tneg	%xcc,	0x1
	edge16n	%i0,	%o4,	%o3
loop_1216:
	sllx	%l5,	0x15,	%o1
loop_1217:
	fbu,a	%fcc1,	loop_1218
	sdivx	%g6,	0x0A91,	%i6
	stx	%g5,	[%l7 + 0x78]
	fmovdg	%xcc,	%f16,	%f6
loop_1218:
	fors	%f31,	%f2,	%f25
	fmovrsne	%o0,	%f13,	%f28
	sra	%o7,	0x16,	%i3
	fcmpeq16	%f12,	%f14,	%i5
	srlx	%g4,	0x19,	%l1
	sllx	%l4,	%l0,	%i2
	tne	%icc,	0x3
	taddcc	%o5,	0x0A54,	%i4
	tvs	%icc,	0x4
	tsubcc	%i7,	0x13D7,	%i1
	subcc	%g2,	%o6,	%g7
	fblg	%fcc2,	loop_1219
	subc	%l3,	%l6,	%g1
	orcc	%o2,	%g3,	%i0
	tleu	%icc,	0x7
loop_1219:
	ldsw	[%l7 + 0x1C],	%o4
	wr	%g0,	0x2b,	%asi
	stda	%o2,	[%l7 + 0x08] %asi
	membar	#Sync
	srl	%l2,	0x08,	%o1
	ba,pn	%icc,	loop_1220
	taddcc	%l5,	%i6,	%g6
	orcc	%g5,	%o0,	%i3
	tsubcc	%o7,	%i5,	%l1
loop_1220:
	sdivx	%l4,	0x0318,	%l0
	udivcc	%g4,	0x1DCB,	%o5
	sethi	0x0949,	%i4
	tne	%xcc,	0x3
	membar	0x48
	fpadd16	%f8,	%f16,	%f8
	tpos	%icc,	0x4
	fmovscs	%xcc,	%f23,	%f29
	xor	%i2,	%i7,	%i1
	fpackfix	%f12,	%f18
	st	%f14,	[%l7 + 0x44]
	edge16l	%o6,	%g7,	%g2
	orncc	%l6,	%l3,	%o2
	movvs	%icc,	%g1,	%g3
	fbue	%fcc3,	loop_1221
	brlez,a	%o4,	loop_1222
	movrne	%i0,	0x3C3,	%o3
	brgz	%o1,	loop_1223
loop_1221:
	orcc	%l2,	%i6,	%l5
loop_1222:
	xnorcc	%g6,	%o0,	%g5
	umulcc	%i3,	%i5,	%o7
loop_1223:
	sir	0x1BA2
	std	%f26,	[%l7 + 0x38]
	fcmpeq32	%f30,	%f26,	%l4
	bn,a,pt	%icc,	loop_1224
	fble,a	%fcc2,	loop_1225
	movrgz	%l1,	%g4,	%o5
	wr	%g0,	0x10,	%asi
	stda	%i4,	[%l7 + 0x68] %asi
loop_1224:
	nop
	wr	%g0,	0x11,	%asi
	sta	%f9,	[%l7 + 0x50] %asi
loop_1225:
	ldx	[%l7 + 0x40],	%i2
	fmovsvc	%icc,	%f4,	%f4
	movl	%icc,	%l0,	%i1
	mulscc	%o6,	%g7,	%g2
	ta	%icc,	0x2
	bneg,pn	%icc,	loop_1226
	srlx	%i7,	%l3,	%l6
	bne	%icc,	loop_1227
	sll	%o2,	%g1,	%o4
loop_1226:
	movre	%i0,	%g3,	%o1
	mulscc	%o3,	0x1CA2,	%i6
loop_1227:
	udivcc	%l2,	0x1235,	%g6
	movrgz	%l5,	%o0,	%g5
	orn	%i5,	%o7,	%l4
	wr	%g0,	0x04,	%asi
	lduwa	[%l7 + 0x38] %asi,	%i3
	fmovrsgez	%g4,	%f14,	%f7
	fble	%fcc3,	loop_1228
	sdivx	%o5,	0x1D86,	%l1
	fmovsa	%xcc,	%f27,	%f6
	andcc	%i2,	0x1192,	%i4
loop_1228:
	fcmpd	%fcc1,	%f14,	%f0
	sllx	%i1,	%l0,	%o6
	lduw	[%l7 + 0x6C],	%g7
	movcc	%icc,	%i7,	%g2
	bcc,a,pt	%icc,	loop_1229
	edge8ln	%l3,	%o2,	%l6
	umulcc	%o4,	0x1484,	%i0
	array16	%g3,	%o1,	%o3
loop_1229:
	umulcc	%g1,	0x1B6F,	%l2
	tl	%xcc,	0x6
	fnors	%f15,	%f21,	%f22
	movleu	%icc,	%i6,	%l5
	fsrc1	%f30,	%f14
	smulcc	%o0,	%g6,	%i5
	swap	[%l7 + 0x20],	%o7
	movrgz	%l4,	0x35A,	%g5
	orn	%i3,	%g4,	%o5
	fcmpeq32	%f8,	%f22,	%l1
	movneg	%xcc,	%i4,	%i2
	movl	%xcc,	%l0,	%i1
	swap	[%l7 + 0x50],	%g7
	nop
	set	0x59, %l5
	ldub	[%l7 + %l5],	%i7
	subcc	%o6,	%l3,	%g2
	tsubcctv	%o2,	0x1F4F,	%l6
	subc	%o4,	%g3,	%o1
	tle	%icc,	0x7
	fcmpne16	%f30,	%f24,	%o3
	movre	%g1,	0x1D7,	%l2
	edge8l	%i0,	%l5,	%o0
	taddcctv	%g6,	%i5,	%o7
	movcs	%xcc,	%l4,	%i6
	subc	%g5,	%i3,	%g4
	or	%o5,	0x15D8,	%l1
	set	0x5F, %i2
	ldsba	[%l7 + %i2] 0x19,	%i2
	movle	%icc,	%i4,	%i1
	movge	%icc,	%l0,	%g7
	orcc	%i7,	%l3,	%g2
	sra	%o2,	%l6,	%o4
	siam	0x5
	ldsh	[%l7 + 0x58],	%o6
	tn	%icc,	0x5
	edge32	%g3,	%o1,	%g1
	fbul	%fcc2,	loop_1230
	tn	%xcc,	0x2
	fpmerge	%f6,	%f30,	%f10
	set	0x18, %i5
	ldswa	[%l7 + %i5] 0x88,	%o3
loop_1230:
	mulscc	%l2,	%l5,	%i0
	movg	%icc,	%o0,	%g6
	sllx	%i5,	0x0A,	%l4
	bpos,a	loop_1231
	fbg	%fcc3,	loop_1232
	tsubcc	%i6,	0x13AF,	%o7
	subccc	%i3,	%g4,	%o5
loop_1231:
	bshuffle	%f16,	%f4,	%f4
loop_1232:
	mova	%icc,	%l1,	%i2
	bvc,a	loop_1233
	tcc	%icc,	0x2
	bge	loop_1234
	te	%xcc,	0x7
loop_1233:
	tge	%xcc,	0x4
	set	0x20, %o3
	ldda	[%l7 + %o3] 0xea,	%g4
loop_1234:
	prefetch	[%l7 + 0x6C],	 0x1
	popc	0x147F,	%i4
	fmovdvc	%xcc,	%f22,	%f3
	tcc	%icc,	0x0
	flush	%l7 + 0x34
	addc	%l0,	%i1,	%g7
	tcc	%xcc,	0x2
	fmovdpos	%xcc,	%f5,	%f6
	addcc	%l3,	0x0596,	%i7
	andcc	%o2,	%g2,	%l6
	andn	%o4,	0x155C,	%o6
	edge8n	%g3,	%g1,	%o1
	bpos,a,pt	%xcc,	loop_1235
	fnands	%f20,	%f23,	%f20
	add	%l7,	0x50,	%l6
	wr	%g0,	0x10,	%asi
	lda	[%l6] %asi,	%o3
	casa	[%l6] 0x10,	%o3,	%l5
loop_1235:
	fcmped	%fcc1,	%f26,	%f8
	movgu	%xcc,	%i0,	%l2
	fmovsvs	%icc,	%f29,	%f27
	sub	%g6,	0x1A07,	%o0
	brgz	%l4,	loop_1236
	andncc	%i6,	%i5,	%i3
	wr	%g0,	0x89,	%asi
	lduha	[%l7 + 0x5C] %asi,	%g4
loop_1236:
	lduw	[%l7 + 0x08],	%o7
	tgu	%icc,	0x4
	bgu,a	%xcc,	loop_1237
	fbule,a	%fcc2,	loop_1238
	movre	%o5,	%l1,	%i2
	ldd	[%l7 + 0x40],	%i4
loop_1237:
	tvs	%icc,	0x6
loop_1238:
	nop
	add	%l7,	0x34,	%l6
	wr	%g0,	0x19,	%asi
	lda	[%l6] %asi,	%g5
	casa	[%l6] %asi,	%g5,	%l0
	ldd	[%l7 + 0x20],	%f4
	fone	%f10
	movle	%xcc,	%i1,	%g7
	sethi	0x1B18,	%i7
	alignaddrl	%o2,	%g2,	%l3
	movrlez	%o4,	%o6,	%l6
	subccc	%g1,	%g3,	%o1
	stb	%o3,	[%l7 + 0x31]
	subc	%i0,	0x140A,	%l2
	edge32ln	%l5,	%o0,	%g6
	alignaddr	%l4,	%i5,	%i3
	movg	%xcc,	%i6,	%g4
	fands	%f18,	%f30,	%f16
	movg	%icc,	%o5,	%o7
	bcc,a	%xcc,	loop_1239
	fmovsleu	%icc,	%f5,	%f4
	fmovda	%xcc,	%f25,	%f22
	popc	0x11AB,	%l1
loop_1239:
	fbule	%fcc1,	loop_1240
	fxor	%f28,	%f4,	%f14
	xnor	%i2,	%i4,	%l0
	fbue,a	%fcc2,	loop_1241
loop_1240:
	fandnot1	%f24,	%f22,	%f14
	wr	%g0,	0x11,	%asi
	lduha	[%l7 + 0x30] %asi,	%g5
loop_1241:
	ta	%icc,	0x1
	tcc	%icc,	0x6
	xorcc	%g7,	%i1,	%i7
	fpsub16	%f2,	%f24,	%f16
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	popc	0x188C,	%o2
	fmovdle	%icc,	%f3,	%f6
	fcmpeq16	%f8,	%f8,	%l3
	tcc	%icc,	0x3
	fba	%fcc3,	loop_1242
	fmuld8sux16	%f27,	%f16,	%f10
	umulcc	%o4,	%o6,	%g2
	stb	%l6,	[%l7 + 0x6B]
loop_1242:
	tpos	%xcc,	0x7
	edge32l	%g1,	%g3,	%o3
	movrlez	%o1,	%i0,	%l2
	movle	%xcc,	%o0,	%g6
	mulscc	%l4,	%l5,	%i3
	wr	%g0,	0x88,	%asi
	lduba	[%l7 + 0x4D] %asi,	%i6
	edge8ln	%g4,	%o5,	%i5
	srax	%o7,	0x0D,	%l1
	umul	%i4,	0x11E4,	%l0
	tsubcctv	%i2,	0x0286,	%g5
	fnor	%f8,	%f0,	%f2
	membar	0x27
	nop
	setx	loop_1243,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	srl	%i1,	0x19,	%g7
	mulx	%o2,	%i7,	%l3
	tleu	%xcc,	0x1
loop_1243:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x81,	%asi
	prefetcha	[%l7 + 0x48] %asi,	 0x0
	fmovd	%f8,	%f16
	addccc	%g2,	0x1CE0,	%o6
	taddcc	%g1,	0x118C,	%l6
	subccc	%o3,	%g3,	%i0
	fsrc1s	%f2,	%f28
	add	%o1,	%l2,	%g6
	sllx	%l4,	%l5,	%i3
	lduh	[%l7 + 0x1C],	%i6
	fmovdle	%icc,	%f7,	%f11
	alignaddr	%o0,	%o5,	%i5
	xnor	%o7,	0x1B70,	%l1
	movrgez	%g4,	0x0EF,	%i4
	movcs	%icc,	%i2,	%l0
	wr	%g0,	0x23,	%asi
	ldda	[%l7 + 0x20] %asi,	%g4
	umulcc	%g7,	%o2,	%i1
	fzero	%f28
	fbge	%fcc0,	loop_1244
	srlx	%i7,	%o4,	%g2
	xor	%l3,	%g1,	%o6
	tcc	%icc,	0x0
loop_1244:
	srlx	%l6,	%o3,	%g3
	sub	%o1,	0x001F,	%l2
	addcc	%i0,	0x08F5,	%l4
	movrne	%l5,	0x26A,	%i3
	edge32ln	%g6,	%o0,	%o5
	movl	%xcc,	%i5,	%o7
	tcs	%xcc,	0x5
	sub	%l1,	%g4,	%i6
	sth	%i2,	[%l7 + 0x58]
	fexpand	%f11,	%f0
	fmovdvs	%xcc,	%f9,	%f31
	fba	%fcc2,	loop_1245
	or	%i4,	0x018C,	%g5
	add	%l0,	%o2,	%g7
	sdiv	%i1,	0x1F25,	%o4
loop_1245:
	subccc	%g2,	0x1114,	%i7
	bg	loop_1246
	movrlez	%l3,	0x10A,	%o6
	movvc	%icc,	%l6,	%g1
	nop
	setx	loop_1247,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_1246:
	fba	%fcc3,	loop_1248
	tvc	%xcc,	0x7
	faligndata	%f12,	%f30,	%f6
loop_1247:
	bg,pt	%xcc,	loop_1249
loop_1248:
	fmovsne	%icc,	%f29,	%f18
	set	0x0C, %g4
	ldswa	[%l7 + %g4] 0x04,	%g3
loop_1249:
	fpack16	%f16,	%f23
	tcc	%icc,	0x3
	tvs	%xcc,	0x4
	movl	%xcc,	%o3,	%o1
	movcc	%icc,	%l2,	%l4
	or	%l5,	%i3,	%i0
	tge	%xcc,	0x1
	fmovdneg	%xcc,	%f21,	%f15
	fpmerge	%f23,	%f18,	%f20
	fmovdpos	%xcc,	%f5,	%f7
	edge32n	%o0,	%g6,	%o5
	movrgz	%o7,	%i5,	%g4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movneg	%icc,	%i6,	%l1
	ta	%xcc,	0x0
	edge16n	%i4,	%g5,	%l0
	movre	%i2,	%o2,	%i1
	edge32ln	%g7,	%g2,	%o4
	set	0x70, %g1
	sta	%f15,	[%l7 + %g1] 0x81
	andn	%i7,	0x1D4A,	%l3
	fmovdge	%xcc,	%f14,	%f22
	fmovdcs	%xcc,	%f20,	%f27
	flush	%l7 + 0x60
	fmovrdgz	%o6,	%f4,	%f24
	fexpand	%f11,	%f10
	mulx	%g1,	0x1C3D,	%g3
	xnorcc	%l6,	0x1074,	%o3
	smul	%l2,	%l4,	%l5
	edge8l	%i3,	%o1,	%o0
	andn	%g6,	0x04ED,	%o5
	fbul	%fcc1,	loop_1250
	orn	%o7,	0x1B75,	%i0
	tle	%icc,	0x1
	fmovdneg	%icc,	%f15,	%f1
loop_1250:
	tne	%icc,	0x2
	call	loop_1251
	fornot2	%f0,	%f28,	%f24
	addccc	%g4,	%i6,	%l1
	movneg	%icc,	%i4,	%i5
loop_1251:
	fbu,a	%fcc0,	loop_1252
	sll	%l0,	0x01,	%i2
	movne	%xcc,	%o2,	%g5
	mulx	%i1,	0x1BC2,	%g7
loop_1252:
	sll	%o4,	0x13,	%g2
	fbe	%fcc1,	loop_1253
	fblg	%fcc1,	loop_1254
	fornot2s	%f5,	%f3,	%f20
	fornot2	%f2,	%f30,	%f10
loop_1253:
	udivx	%l3,	0x1BD7,	%o6
loop_1254:
	ldd	[%l7 + 0x68],	%f10
	fbn,a	%fcc0,	loop_1255
	tn	%xcc,	0x7
	edge16	%i7,	%g3,	%g1
	array32	%l6,	%l2,	%l4
loop_1255:
	bl	loop_1256
	tcs	%icc,	0x1
	taddcctv	%o3,	%l5,	%i3
	tleu	%xcc,	0x3
loop_1256:
	addccc	%o1,	%g6,	%o0
	wr	%g0,	0x89,	%asi
	lduwa	[%l7 + 0x20] %asi,	%o7
	siam	0x5
	fornot2s	%f10,	%f24,	%f23
	std	%o4,	[%l7 + 0x78]
	ble,a,pt	%icc,	loop_1257
	xnorcc	%i0,	%i6,	%l1
	bg	loop_1258
	srlx	%i4,	%g4,	%i5
loop_1257:
	add	%l0,	%i2,	%g5
	sub	%o2,	0x07EE,	%i1
loop_1258:
	sdivx	%o4,	0x0FC1,	%g7
	set	0x20, %o5
	ldda	[%l7 + %o5] 0x2f,	%l2
	movvc	%icc,	%g2,	%o6
	fornot2s	%f9,	%f24,	%f6
	edge16n	%i7,	%g3,	%l6
	wr	%g0,	0x81,	%asi
	stwa	%l2,	[%l7 + 0x48] %asi
	andncc	%l4,	%o3,	%g1
	xorcc	%l5,	0x05F4,	%o1
	ldstub	[%l7 + 0x29],	%g6
	fcmpne16	%f16,	%f10,	%o0
	swap	[%l7 + 0x54],	%o7
	fone	%f28
	andncc	%o5,	%i0,	%i6
	xnor	%i3,	%i4,	%l1
	fcmped	%fcc1,	%f24,	%f14
	movcc	%icc,	%g4,	%l0
	fpackfix	%f26,	%f8
	fmovsleu	%xcc,	%f1,	%f23
	movre	%i2,	0x20C,	%i5
	tg	%xcc,	0x0
	edge32l	%o2,	%g5,	%o4
	edge8l	%i1,	%g7,	%g2
	movgu	%xcc,	%o6,	%i7
	fcmpne32	%f22,	%f0,	%g3
	set	0x37, %o1
	ldstuba	[%l7 + %o1] 0x88,	%l3
	tsubcctv	%l6,	%l4,	%l2
	fcmpeq16	%f12,	%f18,	%o3
	ldsh	[%l7 + 0x1E],	%g1
	fsrc1s	%f13,	%f6
	set	0x7A, %i3
	stha	%o1,	[%l7 + %i3] 0x2f
	membar	#Sync
	edge16l	%l5,	%g6,	%o7
	xnorcc	%o0,	0x051F,	%o5
	edge8ln	%i0,	%i6,	%i4
	xorcc	%l1,	0x0160,	%i3
	movrgez	%g4,	%i2,	%i5
	brgez	%o2,	loop_1259
	fmovspos	%icc,	%f31,	%f2
	sethi	0x0596,	%g5
	andncc	%o4,	%l0,	%g7
loop_1259:
	te	%xcc,	0x3
	srl	%g2,	%o6,	%i7
	ldd	[%l7 + 0x08],	%f12
	umul	%i1,	0x1080,	%l3
	tg	%icc,	0x3
	sth	%l6,	[%l7 + 0x62]
	tvc	%xcc,	0x0
	edge32	%l4,	%g3,	%l2
	fbule,a	%fcc0,	loop_1260
	fbge,a	%fcc2,	loop_1261
	fmovsa	%xcc,	%f20,	%f21
	addcc	%o3,	%g1,	%l5
loop_1260:
	nop
	setx	loop_1262,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_1261:
	sdivx	%g6,	0x1D38,	%o1
	udiv	%o0,	0x0C70,	%o5
	flush	%l7 + 0x70
loop_1262:
	movcs	%xcc,	%o7,	%i6
	tvc	%xcc,	0x3
	fbn,a	%fcc1,	loop_1263
	sllx	%i0,	%l1,	%i3
	edge16n	%i4,	%g4,	%i5
	membar	0x64
loop_1263:
	udivcc	%o2,	0x18CD,	%g5
	stw	%o4,	[%l7 + 0x68]
	brgez,a	%i2,	loop_1264
	smul	%g7,	0x18D0,	%l0
	andcc	%o6,	%g2,	%i7
	set	0x44, %o0
	swapa	[%l7 + %o0] 0x89,	%l3
loop_1264:
	edge16	%l6,	%i1,	%l4
	andn	%l2,	%g3,	%o3
	bcs	%xcc,	loop_1265
	st	%f18,	[%l7 + 0x70]
	mulx	%g1,	0x098A,	%g6
	bpos,a	%icc,	loop_1266
loop_1265:
	xnor	%l5,	%o1,	%o5
	movgu	%icc,	%o0,	%i6
	brz	%o7,	loop_1267
loop_1266:
	taddcc	%l1,	0x0AF5,	%i0
	fornot2	%f0,	%f18,	%f4
	sdivcc	%i3,	0x1DA7,	%i4
loop_1267:
	edge16ln	%i5,	%g4,	%o2
	set	0x08, %g5
	stxa	%o4,	[%l7 + %g5] 0x88
	ldub	[%l7 + 0x0B],	%g5
	movrgz	%g7,	0x1DD,	%l0
	subcc	%i2,	0x04D9,	%o6
	array32	%i7,	%g2,	%l6
	fbl,a	%fcc3,	loop_1268
	ble	loop_1269
	fbne	%fcc2,	loop_1270
	move	%icc,	%i1,	%l3
loop_1268:
	or	%l4,	0x05D0,	%g3
loop_1269:
	movn	%xcc,	%l2,	%g1
loop_1270:
	fors	%f16,	%f6,	%f3
	fpsub16s	%f15,	%f11,	%f19
	fmovsn	%xcc,	%f26,	%f22
	movgu	%xcc,	%o3,	%l5
	xnor	%o1,	0x0CB8,	%g6
	addccc	%o5,	0x06A1,	%i6
	fmovsge	%icc,	%f28,	%f25
	movge	%xcc,	%o0,	%l1
	ta	%xcc,	0x7
	mulscc	%o7,	%i0,	%i4
	umulcc	%i5,	0x1A63,	%g4
	ble	%xcc,	loop_1271
	edge16n	%o2,	%o4,	%g5
	movcc	%xcc,	%i3,	%g7
	udiv	%i2,	0x012B,	%l0
loop_1271:
	ldd	[%l7 + 0x78],	%f20
	be,pt	%icc,	loop_1272
	movre	%i7,	%o6,	%g2
	ld	[%l7 + 0x30],	%f25
	fpsub32	%f16,	%f16,	%f2
loop_1272:
	fmovrdlez	%l6,	%f8,	%f30
	xorcc	%l3,	%i1,	%l4
	taddcctv	%l2,	0x0D69,	%g1
	srl	%g3,	0x19,	%o3
	fpadd32	%f14,	%f12,	%f16
	fandnot2	%f4,	%f0,	%f0
	fornot2	%f14,	%f2,	%f26
	wr	%g0,	0x80,	%asi
	stwa	%o1,	[%l7 + 0x40] %asi
	ldstub	[%l7 + 0x4A],	%g6
	fcmpgt32	%f4,	%f24,	%l5
	array8	%o5,	%i6,	%l1
	fbue	%fcc0,	loop_1273
	taddcctv	%o0,	%o7,	%i0
	edge32n	%i4,	%g4,	%i5
	umul	%o2,	%o4,	%g5
loop_1273:
	fbg,a	%fcc2,	loop_1274
	mova	%icc,	%i3,	%i2
	ldx	[%l7 + 0x20],	%g7
	andcc	%l0,	0x0AF4,	%o6
loop_1274:
	nop
	wr	%g0,	0x19,	%asi
	stha	%i7,	[%l7 + 0x2E] %asi
	stbar
	xnorcc	%g2,	0x1C93,	%l3
	ldsh	[%l7 + 0x18],	%l6
	fnegd	%f16,	%f20
	fmovdn	%icc,	%f7,	%f19
	movcs	%xcc,	%i1,	%l4
	tge	%xcc,	0x4
	sdivx	%g1,	0x1DA1,	%g3
	addccc	%l2,	%o3,	%g6
	movre	%l5,	0x1A7,	%o1
	mova	%xcc,	%i6,	%l1
	taddcc	%o0,	0x07FC,	%o5
	fmovdge	%icc,	%f4,	%f3
	tcc	%xcc,	0x7
	tpos	%icc,	0x5
	fbul,a	%fcc1,	loop_1275
	fbl	%fcc1,	loop_1276
	sdivx	%o7,	0x0C10,	%i4
	wr	%g0,	0xeb,	%asi
	stxa	%i0,	[%l7 + 0x68] %asi
	membar	#Sync
loop_1275:
	tne	%icc,	0x2
loop_1276:
	addc	%g4,	0x12EE,	%i5
	srl	%o2,	0x1F,	%o4
	taddcc	%i3,	%i2,	%g5
	movcc	%xcc,	%l0,	%g7
	fcmple16	%f30,	%f6,	%o6
	andncc	%g2,	%i7,	%l6
	fmovd	%f6,	%f8
	fxor	%f8,	%f30,	%f24
	bg,a,pt	%icc,	loop_1277
	srlx	%i1,	0x05,	%l3
	fmovrdlez	%g1,	%f8,	%f24
	sdivx	%g3,	0x1362,	%l4
loop_1277:
	fmovrdlez	%l2,	%f2,	%f16
	stbar
	set	0x1C, %g2
	stha	%o3,	[%l7 + %g2] 0x27
	membar	#Sync
	movn	%xcc,	%l5,	%g6
	move	%xcc,	%o1,	%i6
	fcmpeq32	%f10,	%f28,	%l1
	sll	%o5,	%o7,	%o0
	fbue	%fcc2,	loop_1278
	subccc	%i4,	%i0,	%g4
	orn	%i5,	%o2,	%i3
	tpos	%icc,	0x7
loop_1278:
	alignaddr	%o4,	%g5,	%l0
	set	0x5C, %g3
	swapa	[%l7 + %g3] 0x10,	%g7
	bvc	%icc,	loop_1279
	movrgz	%i2,	0x04A,	%g2
	addcc	%o6,	%i7,	%l6
	popc	%i1,	%l3
loop_1279:
	fbg,a	%fcc2,	loop_1280
	movpos	%xcc,	%g1,	%g3
	fmovdleu	%xcc,	%f20,	%f19
	subccc	%l4,	0x0E6F,	%o3
loop_1280:
	popc	%l5,	%g6
	umulcc	%l2,	0x0626,	%i6
	alignaddr	%l1,	%o1,	%o7
	fbue,a	%fcc3,	loop_1281
	fmovdcc	%xcc,	%f24,	%f28
	addccc	%o0,	%i4,	%o5
	ldsw	[%l7 + 0x40],	%i0
loop_1281:
	movrne	%i5,	0x339,	%g4
	movneg	%xcc,	%o2,	%i3
	fcmpeq16	%f28,	%f20,	%g5
	fpadd32	%f30,	%f2,	%f8
	set	0x08, %l2
	lda	[%l7 + %l2] 0x10,	%f16
	move	%xcc,	%l0,	%g7
	movvs	%icc,	%i2,	%o4
	bvc	%icc,	loop_1282
	edge8ln	%g2,	%i7,	%o6
	sdivx	%l6,	0x1DA5,	%l3
	smul	%g1,	0x1403,	%i1
loop_1282:
	fbne,a	%fcc2,	loop_1283
	fbuge	%fcc0,	loop_1284
	movrne	%l4,	%g3,	%o3
	movrne	%g6,	%l2,	%l5
loop_1283:
	edge8n	%l1,	%i6,	%o1
loop_1284:
	xor	%o7,	0x09AF,	%i4
	taddcc	%o5,	0x0429,	%o0
	fmul8x16al	%f26,	%f11,	%f12
	fsrc1s	%f27,	%f4
	stx	%i5,	[%l7 + 0x48]
	fmul8x16al	%f15,	%f5,	%f16
	sll	%g4,	%o2,	%i3
	tsubcctv	%i0,	%l0,	%g5
	andncc	%g7,	%i2,	%o4
	fandnot1	%f12,	%f10,	%f16
	wr	%g0,	0x19,	%asi
	stwa	%i7,	[%l7 + 0x4C] %asi
	brgez	%o6,	loop_1285
	fbuge,a	%fcc0,	loop_1286
	subccc	%l6,	%g2,	%l3
	fsrc2	%f10,	%f10
loop_1285:
	umul	%g1,	%i1,	%g3
loop_1286:
	udivx	%l4,	0x006C,	%g6
	edge8ln	%o3,	%l2,	%l5
	bl,pn	%icc,	loop_1287
	sll	%i6,	0x01,	%o1
	movrgz	%l1,	0x231,	%i4
	fmovdvc	%xcc,	%f9,	%f6
loop_1287:
	alignaddr	%o5,	%o7,	%o0
	fpadd16s	%f18,	%f13,	%f6
	fxor	%f22,	%f0,	%f22
	edge16n	%i5,	%g4,	%i3
	sethi	0x0BB0,	%i0
	edge16l	%o2,	%l0,	%g5
	fmuld8ulx16	%f24,	%f30,	%f30
	ldsh	[%l7 + 0x74],	%g7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subccc	%i2,	%i7,	%o4
	tneg	%xcc,	0x0
	umul	%l6,	%g2,	%o6
	movrlez	%l3,	0x17F,	%i1
	fone	%f10
	sub	%g3,	0x0D86,	%l4
	xnor	%g6,	%o3,	%l2
	wr	%g0,	0x04,	%asi
	lduwa	[%l7 + 0x18] %asi,	%g1
	umulcc	%l5,	0x0D36,	%o1
	wr	%g0,	0x19,	%asi
	swapa	[%l7 + 0x14] %asi,	%l1
	xnorcc	%i6,	%i4,	%o5
	ta	%icc,	0x6
	tsubcc	%o7,	0x1796,	%o0
	edge16ln	%i5,	%i3,	%i0
	lduw	[%l7 + 0x5C],	%o2
	nop
	setx loop_1288, %l0, %l1
	jmpl %l1, %l0
	tvc	%icc,	0x7
	udiv	%g4,	0x0EE3,	%g5
	taddcctv	%g7,	0x04A5,	%i2
loop_1288:
	fmovdpos	%xcc,	%f30,	%f22
	array8	%o4,	%l6,	%i7
	wr	%g0,	0x0c,	%asi
	swapa	[%l7 + 0x6C] %asi,	%o6
	tg	%xcc,	0x1
	edge8	%l3,	%i1,	%g3
	ble	loop_1289
	movrne	%l4,	%g6,	%o3
	pdist	%f14,	%f0,	%f26
	wr	%g0,	0x10,	%asi
	prefetcha	[%l7 + 0x30] %asi,	 0x0
loop_1289:
	bleu,a,pn	%icc,	loop_1290
	bneg,pt	%xcc,	loop_1291
	edge16ln	%g1,	%g2,	%l5
	wr	%g0,	0x0c,	%asi
	ldda	[%l7 + 0x20] %asi,	%o0
loop_1290:
	fbg,a	%fcc0,	loop_1292
loop_1291:
	edge16ln	%l1,	%i4,	%i6
	nop
	setx	loop_1293,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	sethi	0x166E,	%o5
loop_1292:
	tsubcctv	%o7,	0x021B,	%i5
	fmovdl	%icc,	%f29,	%f19
loop_1293:
	fpsub32	%f2,	%f2,	%f4
	fmovrdgez	%o0,	%f14,	%f28
	movrgez	%i3,	0x058,	%o2
	umul	%i0,	0x10D2,	%g4
	udivx	%l0,	0x0C03,	%g5
	sllx	%i2,	0x0C,	%g7
	bpos,pn	%xcc,	loop_1294
	tcc	%xcc,	0x7
	addc	%o4,	%i7,	%l6
	orn	%o6,	%i1,	%g3
loop_1294:
	call	loop_1295
	sll	%l4,	0x09,	%g6
	movrlz	%l3,	%o3,	%g1
	sllx	%l2,	%l5,	%g2
loop_1295:
	fmovsneg	%icc,	%f28,	%f17
	fmovrdgez	%l1,	%f14,	%f18
	tgu	%xcc,	0x5
	fbu	%fcc2,	loop_1296
	andn	%o1,	%i6,	%o5
	fnegd	%f14,	%f20
	movcc	%xcc,	%i4,	%o7
loop_1296:
	srax	%i5,	0x03,	%o0
	and	%o2,	%i0,	%i3
	te	%xcc,	0x5
	fbne	%fcc1,	loop_1297
	ldsw	[%l7 + 0x78],	%l0
	tn	%icc,	0x1
	set	0x40, %l0
	lduha	[%l7 + %l0] 0x80,	%g4
loop_1297:
	edge16l	%g5,	%i2,	%g7
	edge8ln	%o4,	%i7,	%o6
	sra	%l6,	%g3,	%l4
	subc	%g6,	%i1,	%l3
	smulcc	%g1,	0x09A9,	%l2
	udiv	%o3,	0x0E6C,	%l5
	bneg,a,pt	%xcc,	loop_1298
	edge16ln	%g2,	%o1,	%l1
	array32	%o5,	%i6,	%i4
	tneg	%icc,	0x6
loop_1298:
	nop
	set	0x10, %i6
	swapa	[%l7 + %i6] 0x11,	%o7
	fmovsne	%icc,	%f8,	%f28
	ldx	[%l7 + 0x20],	%o0
	fmul8ulx16	%f20,	%f4,	%f4
	movg	%icc,	%o2,	%i5
	sra	%i0,	%i3,	%g4
	movn	%icc,	%g5,	%l0
	fbo	%fcc0,	loop_1299
	orcc	%g7,	%i2,	%o4
	sdiv	%o6,	0x0142,	%l6
	fpsub32s	%f10,	%f23,	%f9
loop_1299:
	nop
	set	0x2A, %l3
	ldsh	[%l7 + %l3],	%i7
	set	0x5C, %l1
	ldsba	[%l7 + %l1] 0x19,	%l4
	ba,pn	%xcc,	loop_1300
	smulcc	%g3,	0x09EA,	%i1
	srl	%l3,	%g6,	%g1
	sra	%o3,	%l2,	%g2
loop_1300:
	alignaddr	%o1,	%l1,	%l5
	fbue	%fcc1,	loop_1301
	popc	0x1CEC,	%i6
	ld	[%l7 + 0x08],	%f28
	fmovscs	%icc,	%f22,	%f20
loop_1301:
	movcc	%xcc,	%o5,	%i4
	pdist	%f26,	%f0,	%f16
	set	0x0A, %o7
	ldsha	[%l7 + %o7] 0x89,	%o0
	movrgz	%o7,	%o2,	%i5
	popc	%i0,	%i3
	fbl,a	%fcc1,	loop_1302
	faligndata	%f2,	%f16,	%f4
	fmovs	%f4,	%f23
	andcc	%g5,	%l0,	%g4
loop_1302:
	movrgz	%g7,	0x2A7,	%o4
	fnand	%f10,	%f30,	%f0
	fmovdge	%xcc,	%f13,	%f27
	xorcc	%i2,	0x17F6,	%o6
	movre	%l6,	%l4,	%g3
	addc	%i7,	%i1,	%g6
	subcc	%l3,	0x1C8A,	%o3
	bcs	%xcc,	loop_1303
	edge16l	%g1,	%g2,	%l2
	stb	%o1,	[%l7 + 0x3E]
	andncc	%l5,	%i6,	%l1
loop_1303:
	ldx	[%l7 + 0x48],	%o5
	edge32n	%o0,	%i4,	%o2
	movre	%i5,	0x370,	%i0
	movleu	%icc,	%i3,	%g5
	orn	%l0,	%o7,	%g4
	fmul8x16au	%f23,	%f12,	%f30
	set	0x58, %g6
	sta	%f31,	[%l7 + %g6] 0x19
	fornot2s	%f7,	%f12,	%f22
	edge8	%o4,	%g7,	%o6
	movn	%xcc,	%l6,	%i2
	fcmple16	%f2,	%f10,	%l4
	or	%i7,	0x0FDC,	%g3
	tcc	%icc,	0x3
	ba	%icc,	loop_1304
	fcmpne32	%f16,	%f20,	%g6
	addccc	%i1,	%o3,	%l3
	fmovrdlez	%g1,	%f8,	%f2
loop_1304:
	prefetch	[%l7 + 0x28],	 0x1
	fmovsne	%xcc,	%f17,	%f6
	srax	%g2,	%o1,	%l2
	tcs	%xcc,	0x2
	movneg	%icc,	%l5,	%l1
	tsubcc	%i6,	0x1168,	%o5
	and	%o0,	0x0872,	%o2
	fmovspos	%icc,	%f25,	%f15
	ldsh	[%l7 + 0x58],	%i5
	sethi	0x1FFF,	%i0
	fmovsl	%xcc,	%f28,	%f1
	bshuffle	%f24,	%f28,	%f8
	addccc	%i3,	%i4,	%l0
	add	%l7,	0x18,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%o7
	casxa	[%l6] %asi,	%o7,	%g4
	bpos	%icc,	loop_1305
	fpadd32s	%f18,	%f31,	%f5
	fcmped	%fcc3,	%f16,	%f22
	te	%icc,	0x1
loop_1305:
	fbe,a	%fcc2,	loop_1306
	fmovscc	%xcc,	%f4,	%f24
	fmovdvc	%xcc,	%f29,	%f16
	subccc	%g5,	0x15DC,	%g7
loop_1306:
	movvc	%xcc,	%o4,	%l6
	nop
	setx	loop_1307,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	udiv	%i2,	0x0330,	%l4
	alignaddr	%i7,	%o6,	%g6
	tn	%xcc,	0x6
loop_1307:
	fpsub32	%f20,	%f14,	%f6
	fbul,a	%fcc0,	loop_1308
	nop
	set	0x6D, %i4
	ldub	[%l7 + %i4],	%i1
	fnot1	%f22,	%f14
	edge32l	%g3,	%o3,	%g1
loop_1308:
	fexpand	%f24,	%f12
	srl	%l3,	%o1,	%g2
	smul	%l5,	0x16B1,	%l2
	brlez	%l1,	loop_1309
	brgez	%o5,	loop_1310
	lduh	[%l7 + 0x5C],	%i6
	srlx	%o0,	%i5,	%i0
loop_1309:
	edge8l	%i3,	%o2,	%i4
loop_1310:
	fornot2s	%f3,	%f27,	%f31
	movl	%xcc,	%l0,	%o7
	bgu,a,pn	%icc,	loop_1311
	edge8n	%g5,	%g7,	%o4
	movpos	%xcc,	%g4,	%i2
	tg	%xcc,	0x2
loop_1311:
	fbule	%fcc1,	loop_1312
	andcc	%l6,	%l4,	%i7
	fmovs	%f18,	%f0
	edge8n	%g6,	%o6,	%i1
loop_1312:
	move	%xcc,	%g3,	%o3
	udiv	%g1,	0x1FFC,	%l3
	array32	%g2,	%o1,	%l5
	movrgez	%l1,	%l2,	%i6
	fmovsgu	%icc,	%f13,	%f11
	udivcc	%o5,	0x0BB8,	%o0
	fba,a	%fcc2,	loop_1313
	sir	0x14AE
	taddcctv	%i0,	%i3,	%i5
	xnorcc	%i4,	%o2,	%l0
loop_1313:
	array16	%g5,	%g7,	%o4
	bcc	%icc,	loop_1314
	fbl	%fcc1,	loop_1315
	tge	%icc,	0x4
	alignaddr	%o7,	%g4,	%i2
loop_1314:
	edge32n	%l6,	%i7,	%l4
loop_1315:
	edge32	%g6,	%o6,	%g3
	wr	%g0,	0x80,	%asi
	lduha	[%l7 + 0x12] %asi,	%i1
	movrlz	%g1,	%l3,	%o3
	flush	%l7 + 0x4C
	bcs	loop_1316
	srl	%o1,	0x00,	%l5
	faligndata	%f24,	%f12,	%f22
	sllx	%l1,	0x02,	%g2
loop_1316:
	ldd	[%l7 + 0x58],	%i6
	movneg	%icc,	%o5,	%o0
	ta	%xcc,	0x0
	move	%xcc,	%l2,	%i0
	mulx	%i5,	%i4,	%o2
	fpsub16	%f20,	%f18,	%f18
	umulcc	%i3,	0x09C3,	%g5
	wr	%g0,	0x89,	%asi
	ldsba	[%l7 + 0x16] %asi,	%l0
	movre	%o4,	0x224,	%g7
	movleu	%xcc,	%g4,	%o7
	or	%i2,	0x1A35,	%i7
	add	%l7,	0x78,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%l4
	casxa	[%l6] 0x88,	%l4,	%l6
	ldd	[%l7 + 0x68],	%g6
	edge32	%o6,	%g3,	%g1
	ba	%xcc,	loop_1317
	movrgz	%i1,	0x2A8,	%l3
	for	%f28,	%f24,	%f2
	ta	%xcc,	0x0
loop_1317:
	nop
	set	0x20, %o6
	swapa	[%l7 + %o6] 0x04,	%o3
	orncc	%l5,	0x0A19,	%l1
	ba,a	%xcc,	loop_1318
	move	%icc,	%o1,	%g2
	movne	%xcc,	%o5,	%i6
	edge32	%l2,	%i0,	%i5
loop_1318:
	nop
	set	0x5A, %l4
	ldsha	[%l7 + %l4] 0x19,	%i4
	fmovrdgez	%o0,	%f18,	%f4
	xnor	%i3,	%g5,	%o2
	edge16ln	%l0,	%o4,	%g7
	umulcc	%g4,	%i2,	%i7
	tcc	%xcc,	0x7
	mova	%xcc,	%l4,	%o7
	ldd	[%l7 + 0x60],	%i6
	alignaddrl	%g6,	%g3,	%g1
	brlz,a	%o6,	loop_1319
	fnegs	%f11,	%f15
	xorcc	%l3,	0x1550,	%i1
	mova	%icc,	%l5,	%l1
loop_1319:
	fcmpd	%fcc2,	%f16,	%f16
	move	%xcc,	%o3,	%g2
	array8	%o1,	%i6,	%l2
	umulcc	%i0,	%i5,	%o5
	fpadd32s	%f30,	%f28,	%f0
	orcc	%i4,	0x1C9F,	%o0
	tcs	%icc,	0x7
	fbl	%fcc1,	loop_1320
	fmovd	%f6,	%f12
	set	0x28, %o4
	stxa	%g5,	[%g0 + %o4] 0x4f
loop_1320:
	nop
	setx loop_1321, %l0, %l1
	jmpl %l1, %i3
	addcc	%l0,	0x16F5,	%o2
	tleu	%xcc,	0x0
	fmovdcs	%xcc,	%f25,	%f15
loop_1321:
	fble,a	%fcc2,	loop_1322
	sdivcc	%o4,	0x068F,	%g7
	tge	%icc,	0x2
	fmovd	%f16,	%f14
loop_1322:
	sdiv	%g4,	0x12AB,	%i7
	edge8ln	%i2,	%o7,	%l6
	fcmped	%fcc3,	%f8,	%f18
	be	loop_1323
	tcs	%xcc,	0x4
	lduw	[%l7 + 0x60],	%g6
	brlz,a	%g3,	loop_1324
loop_1323:
	swap	[%l7 + 0x5C],	%g1
	sir	0x0159
	orn	%l4,	%o6,	%l3
loop_1324:
	fmovdcc	%icc,	%f27,	%f3
	for	%f4,	%f16,	%f26
	nop
	set	0x38, %o2
	ldsw	[%l7 + %o2],	%i1
	brz	%l5,	loop_1325
	fbul	%fcc3,	loop_1326
	fmovsleu	%icc,	%f15,	%f29
	edge16ln	%o3,	%g2,	%o1
loop_1325:
	fmul8sux16	%f2,	%f6,	%f26
loop_1326:
	edge16l	%l1,	%l2,	%i0
	orn	%i5,	%o5,	%i4
	addc	%o0,	0x1CFD,	%i6
	udiv	%g5,	0x193F,	%i3
	fmovsn	%xcc,	%f10,	%f31
	tcc	%xcc,	0x2
	fcmpeq32	%f8,	%f8,	%l0
	movcc	%xcc,	%o4,	%o2
	stbar
	tcc	%icc,	0x2
	edge8n	%g4,	%i7,	%g7
	tsubcc	%i2,	0x086C,	%l6
	bge,a,pn	%icc,	loop_1327
	fmovrslez	%o7,	%f24,	%f29
	fmovdneg	%icc,	%f16,	%f15
	bvc	%icc,	loop_1328
loop_1327:
	movn	%icc,	%g3,	%g6
	bvc,a	loop_1329
	fnot2	%f0,	%f6
loop_1328:
	bcs,pt	%icc,	loop_1330
	fmovsge	%icc,	%f8,	%f20
loop_1329:
	fand	%f18,	%f8,	%f4
	wr	%g0,	0x80,	%asi
	ldda	[%l7 + 0x70] %asi,	%l4
loop_1330:
	popc	0x0202,	%g1
	edge16l	%l3,	%o6,	%l5
	addccc	%i1,	0x17E2,	%g2
	edge32	%o3,	%o1,	%l1
	fsrc2s	%f6,	%f15
	bleu,a	%xcc,	loop_1331
	edge8	%l2,	%i5,	%o5
	sra	%i0,	0x1E,	%i4
	fandnot1	%f0,	%f28,	%f26
loop_1331:
	udivx	%i6,	0x1C78,	%g5
	smul	%i3,	0x083E,	%l0
	movleu	%icc,	%o4,	%o2
	brnz	%o0,	loop_1332
	movgu	%icc,	%i7,	%g7
	fmovscc	%xcc,	%f26,	%f17
	set	0x1C, %i1
	stha	%g4,	[%l7 + %i1] 0x80
loop_1332:
	sdiv	%i2,	0x0585,	%o7
	wr	%g0,	0x89,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	tvs	%xcc,	0x2
	fpsub32s	%f28,	%f20,	%f28
	andcc	%g3,	0x16C1,	%l6
	sth	%l4,	[%l7 + 0x40]
	movre	%g1,	0x045,	%g6
	movcc	%xcc,	%l3,	%o6
	srlx	%l5,	0x04,	%g2
	tvc	%xcc,	0x2
	sdivcc	%i1,	0x1D70,	%o1
	srax	%o3,	%l1,	%l2
	tneg	%icc,	0x0
	fmovdge	%icc,	%f11,	%f29
	ldstub	[%l7 + 0x74],	%i5
	subc	%o5,	0x1C52,	%i0
	fpadd16	%f0,	%f24,	%f2
	tvs	%icc,	0x4
	bgu	%xcc,	loop_1333
	alignaddrl	%i4,	%i6,	%g5
	fble	%fcc0,	loop_1334
	movleu	%xcc,	%l0,	%o4
loop_1333:
	brgz,a	%i3,	loop_1335
	brz	%o2,	loop_1336
loop_1334:
	ble,a,pt	%xcc,	loop_1337
	udivcc	%o0,	0x0598,	%g7
loop_1335:
	ldsb	[%l7 + 0x3B],	%i7
loop_1336:
	ta	%icc,	0x3
loop_1337:
	movrlz	%g4,	%i2,	%o7
	movrgez	%l6,	0x108,	%l4
	addccc	%g1,	0x1CBC,	%g3
	flush	%l7 + 0x60
	udivx	%g6,	0x1C48,	%o6
	fbl,a	%fcc3,	loop_1338
	edge8n	%l3,	%g2,	%i1
	fnor	%f26,	%f10,	%f6
	mulx	%l5,	0x0CE8,	%o3
loop_1338:
	array16	%l1,	%l2,	%i5
	bvc,pt	%xcc,	loop_1339
	fbul	%fcc1,	loop_1340
	movpos	%icc,	%o5,	%o1
	for	%f18,	%f30,	%f4
loop_1339:
	fcmple32	%f30,	%f20,	%i0
loop_1340:
	fpsub32	%f12,	%f10,	%f4
	edge32n	%i4,	%g5,	%l0
	fpackfix	%f22,	%f30
	fmovdne	%xcc,	%f24,	%f17
	tsubcctv	%i6,	0x18FC,	%i3
	subcc	%o2,	0x03C6,	%o0
	tcc	%xcc,	0x5
	fmovrde	%g7,	%f0,	%f22
	fmovsle	%icc,	%f0,	%f27
	edge8n	%o4,	%i7,	%i2
	fbg,a	%fcc0,	loop_1341
	udiv	%g4,	0x0A4E,	%l6
	wr	%g0,	0x04,	%asi
	ldsha	[%l7 + 0x28] %asi,	%l4
loop_1341:
	array16	%g1,	%g3,	%o7
	brnz,a	%o6,	loop_1342
	sth	%l3,	[%l7 + 0x20]
	edge32ln	%g2,	%i1,	%l5
	add	%l7,	0x20,	%l6
	wr	%g0,	0x0c,	%asi
	lda	[%l6] %asi,	%g6
	casa	[%l6] %asi,	%g6,	%l1
loop_1342:
	membar	0x12
	fmovspos	%xcc,	%f4,	%f20
	fpadd16s	%f13,	%f10,	%f0
	xnor	%l2,	0x0D80,	%o3
	fmovrdne	%o5,	%f20,	%f2
	movle	%icc,	%i5,	%o1
	set	0x54, %g7
	lda	[%l7 + %g7] 0x80,	%f7
	tcc	%xcc,	0x1
	ldsh	[%l7 + 0x44],	%i0
	fsrc1	%f2,	%f22
	movrlez	%i4,	0x302,	%l0
	xnor	%i6,	%g5,	%o2
	ldstub	[%l7 + 0x6E],	%o0
	stbar
	orn	%g7,	%i3,	%o4
	tcs	%xcc,	0x0
	srl	%i2,	%i7,	%l6
	tne	%xcc,	0x3
	taddcctv	%g4,	0x1667,	%g1
	fandnot1	%f28,	%f20,	%f20
	edge32ln	%l4,	%g3,	%o7
	ldub	[%l7 + 0x20],	%o6
	andcc	%l3,	%i1,	%l5
	stbar
	orcc	%g6,	0x0607,	%g2
	movrgez	%l2,	%l1,	%o5
	edge32n	%i5,	%o3,	%i0
	mulx	%o1,	0x04C0,	%i4
	movrlez	%l0,	0x36D,	%g5
	bcc,a,pn	%xcc,	loop_1343
	nop
	set	0x74, %i0
	prefetch	[%l7 + %i0],	 0x2
	fbuge	%fcc2,	loop_1344
	array32	%o2,	%i6,	%g7
loop_1343:
	edge16n	%o0,	%i3,	%i2
	swap	[%l7 + 0x64],	%i7
loop_1344:
	movn	%icc,	%o4,	%l6
	addcc	%g1,	%g4,	%l4
	edge16ln	%o7,	%o6,	%g3
	bneg,a,pt	%xcc,	loop_1345
	sdivx	%l3,	0x0CA0,	%l5
	fmovdvs	%xcc,	%f17,	%f7
	ldd	[%l7 + 0x40],	%f2
loop_1345:
	tgu	%xcc,	0x5
	fbg,a	%fcc3,	loop_1346
	tvs	%xcc,	0x3
	tcs	%xcc,	0x1
	taddcctv	%g6,	%g2,	%i1
loop_1346:
	andn	%l2,	%o5,	%l1
	srl	%i5,	0x0A,	%i0
	ta	%xcc,	0x0
	movrne	%o1,	%o3,	%i4
	mulx	%g5,	0x1810,	%o2
	tl	%xcc,	0x7
	fmovspos	%xcc,	%f3,	%f22
	fnegd	%f8,	%f8
	fmovdcs	%xcc,	%f12,	%f10
	sdivx	%i6,	0x0049,	%g7
	set	0x34, %i7
	ldstuba	[%l7 + %i7] 0x10,	%o0
	subcc	%i3,	%i2,	%l0
	smulcc	%o4,	%l6,	%g1
	mova	%xcc,	%g4,	%l4
	set	0x7C, %l5
	lduwa	[%l7 + %l5] 0x11,	%o7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16ln	%i7,	%o6,	%l3
	addcc	%l5,	0x12D7,	%g6
	set	0x40, %i2
	stda	%f16,	[%l7 + %i2] 0xf8
	membar	#Sync
	bleu	loop_1347
	fmovrdgz	%g3,	%f4,	%f18
	fcmpgt16	%f26,	%f30,	%i1
	movge	%xcc,	%g2,	%o5
loop_1347:
	fmovrsgz	%l1,	%f25,	%f3
	ta	%xcc,	0x6
	wr	%g0,	0x80,	%asi
	lduba	[%l7 + 0x4C] %asi,	%l2
	orncc	%i0,	%o1,	%i5
	or	%o3,	0x0432,	%i4
	ldd	[%l7 + 0x68],	%f20
	brlz,a	%o2,	loop_1348
	bcc,a	%icc,	loop_1349
	fand	%f14,	%f4,	%f6
	be,a,pt	%icc,	loop_1350
loop_1348:
	sth	%g5,	[%l7 + 0x2C]
loop_1349:
	alignaddrl	%i6,	%g7,	%o0
	move	%icc,	%i3,	%l0
loop_1350:
	fexpand	%f22,	%f2
	fbue	%fcc0,	loop_1351
	tne	%icc,	0x1
	movcc	%icc,	%o4,	%l6
	flush	%l7 + 0x38
loop_1351:
	fcmpeq32	%f16,	%f18,	%g1
	edge16ln	%i2,	%l4,	%o7
	fmovdne	%xcc,	%f17,	%f19
	nop
	set	0x7C, %i5
	ldsh	[%l7 + %i5],	%g4
	edge16l	%o6,	%l3,	%i7
	std	%f12,	[%l7 + 0x08]
	subcc	%g6,	%g3,	%i1
	fcmpeq32	%f24,	%f30,	%g2
	sth	%l5,	[%l7 + 0x58]
	srl	%o5,	%l1,	%i0
	fbn,a	%fcc0,	loop_1352
	fmovrde	%l2,	%f10,	%f2
	move	%icc,	%i5,	%o3
	array32	%o1,	%i4,	%o2
loop_1352:
	alignaddr	%i6,	%g7,	%o0
	fbge,a	%fcc1,	loop_1353
	sethi	0x1FF0,	%g5
	fpadd16s	%f13,	%f26,	%f31
	fmovdne	%icc,	%f6,	%f25
loop_1353:
	ta	%icc,	0x2
	fmovsle	%xcc,	%f21,	%f28
	tgu	%icc,	0x3
	movge	%icc,	%i3,	%o4
	tl	%xcc,	0x7
	edge16ln	%l6,	%g1,	%l0
	edge8ln	%i2,	%l4,	%o7
	movcc	%xcc,	%o6,	%l3
	fors	%f5,	%f14,	%f1
	movrlz	%g4,	0x030,	%i7
	andncc	%g6,	%g3,	%g2
	movrne	%i1,	%l5,	%l1
	umulcc	%i0,	%o5,	%l2
	stb	%i5,	[%l7 + 0x72]
	sllx	%o1,	0x0A,	%o3
	movne	%icc,	%i4,	%i6
	array8	%o2,	%o0,	%g7
	subccc	%g5,	%i3,	%o4
	fmovsvs	%xcc,	%f14,	%f0
	edge32n	%g1,	%l6,	%i2
	fmul8x16au	%f11,	%f23,	%f0
	set	0x60, %l6
	lda	[%l7 + %l6] 0x15,	%f30
	ldub	[%l7 + 0x24],	%l0
	sub	%o7,	0x0FDA,	%l4
	movpos	%icc,	%o6,	%g4
	movpos	%xcc,	%i7,	%g6
	bcc,pt	%xcc,	loop_1354
	movvc	%xcc,	%g3,	%l3
	fmovrslz	%i1,	%f7,	%f19
	nop
	setx	loop_1355,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_1354:
	brgz	%g2,	loop_1356
	fmovrdlez	%l1,	%f2,	%f12
	mulscc	%i0,	%o5,	%l2
loop_1355:
	edge16l	%i5,	%o1,	%l5
loop_1356:
	srlx	%i4,	%o3,	%o2
	tsubcc	%i6,	0x0351,	%g7
	ba,a,pn	%xcc,	loop_1357
	nop
	setx	loop_1358,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tl	%xcc,	0x2
	addccc	%g5,	0x0B17,	%i3
loop_1357:
	tneg	%xcc,	0x5
loop_1358:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tle	%icc,	0x4
	movrgez	%o0,	0x134,	%o4
	tcs	%xcc,	0x7
	fmovde	%xcc,	%f4,	%f20
	wr	%g0,	0x2b,	%asi
	stxa	%l6,	[%l7 + 0x78] %asi
	membar	#Sync
	bgu,a,pt	%xcc,	loop_1359
	edge32n	%i2,	%l0,	%g1
	tn	%icc,	0x3
	movge	%icc,	%l4,	%o6
loop_1359:
	sethi	0x0049,	%o7
	subc	%g4,	%g6,	%g3
	srax	%i7,	%i1,	%l3
	ldsw	[%l7 + 0x34],	%g2
	subc	%l1,	%i0,	%o5
	fxnors	%f8,	%f15,	%f25
	fbl	%fcc0,	loop_1360
	tneg	%xcc,	0x7
	udivx	%l2,	0x1117,	%i5
	array8	%o1,	%l5,	%i4
loop_1360:
	nop
	set	0x66, %g4
	stha	%o3,	[%l7 + %g4] 0x2f
	membar	#Sync
	orn	%o2,	%i6,	%g5
	move	%icc,	%i3,	%o0
	movrgez	%g7,	0x29C,	%o4
	stb	%i2,	[%l7 + 0x75]
	edge8ln	%l6,	%l0,	%l4
	fpsub16	%f16,	%f12,	%f2
	tle	%xcc,	0x3
	fcmpgt16	%f8,	%f22,	%o6
	bge	%xcc,	loop_1361
	andcc	%o7,	0x07AC,	%g4
	taddcc	%g1,	0x118D,	%g3
	brlez,a	%g6,	loop_1362
loop_1361:
	swap	[%l7 + 0x48],	%i7
	fandnot1s	%f4,	%f7,	%f24
	bvs	%xcc,	loop_1363
loop_1362:
	fmovdle	%icc,	%f16,	%f11
	fnot2	%f14,	%f6
	fmovdcs	%xcc,	%f24,	%f10
loop_1363:
	fmul8sux16	%f8,	%f30,	%f20
	edge8n	%i1,	%g2,	%l1
	ldsb	[%l7 + 0x55],	%l3
	sll	%i0,	0x17,	%o5
	mova	%icc,	%l2,	%o1
	fbe	%fcc3,	loop_1364
	tgu	%icc,	0x3
	fbug,a	%fcc0,	loop_1365
	xnorcc	%l5,	%i4,	%i5
loop_1364:
	sir	0x0C7E
	orcc	%o2,	%i6,	%o3
loop_1365:
	xnor	%g5,	%o0,	%i3
	fbuge,a	%fcc2,	loop_1366
	fmovs	%f9,	%f7
	movge	%xcc,	%g7,	%o4
	fexpand	%f10,	%f16
loop_1366:
	alignaddr	%l6,	%l0,	%i2
	lduw	[%l7 + 0x4C],	%o6
	brz,a	%o7,	loop_1367
	subc	%l4,	%g4,	%g1
	fbul,a	%fcc2,	loop_1368
	fbule	%fcc3,	loop_1369
loop_1367:
	fandnot1	%f12,	%f6,	%f10
	fabss	%f9,	%f18
loop_1368:
	bvs	loop_1370
loop_1369:
	fmovrsne	%g3,	%f2,	%f29
	addc	%i7,	%i1,	%g6
	taddcctv	%g2,	0x1EBC,	%l1
loop_1370:
	tn	%xcc,	0x5
	fmovsvc	%icc,	%f19,	%f15
	edge32n	%l3,	%i0,	%o5
	tsubcctv	%o1,	0x09E8,	%l2
	fbn	%fcc2,	loop_1371
	movn	%xcc,	%i4,	%i5
	xnor	%l5,	%i6,	%o2
	orncc	%o3,	0x143E,	%g5
loop_1371:
	fsrc1s	%f1,	%f16
	add	%l7,	0x10,	%l6
	wr	%g0,	0x0c,	%asi
	casxa	[%l6] 0x0c,	%o0,	%i3
	lduw	[%l7 + 0x64],	%o4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mulx	%l6,	0x0506,	%l0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldub	[%l7 + 0x0A],	%i2
	xnorcc	%o6,	0x04FD,	%g7
	fmovdne	%icc,	%f24,	%f13
	andcc	%o7,	0x1132,	%l4
	ldd	[%l7 + 0x20],	%f30
	movrlz	%g4,	%g3,	%g1
	fmovscc	%xcc,	%f24,	%f31
	fmovrse	%i7,	%f30,	%f24
	fornot1	%f18,	%f0,	%f2
	fmovda	%xcc,	%f19,	%f28
	sethi	0x0EE0,	%i1
	call	loop_1372
	fpackfix	%f20,	%f9
	xnor	%g6,	0x108A,	%l1
	movn	%xcc,	%g2,	%i0
loop_1372:
	prefetch	[%l7 + 0x44],	 0x0
	fandnot1s	%f24,	%f21,	%f21
	subcc	%l3,	0x00FF,	%o5
	srlx	%o1,	%l2,	%i5
	edge8l	%l5,	%i4,	%i6
	and	%o3,	0x07A8,	%o2
	movneg	%icc,	%g5,	%o0
	tpos	%xcc,	0x7
	movleu	%xcc,	%i3,	%l6
	xor	%o4,	0x00E5,	%i2
	array8	%o6,	%l0,	%g7
	movrgz	%l4,	%o7,	%g3
	fbule	%fcc3,	loop_1373
	mova	%icc,	%g4,	%g1
	fbug	%fcc0,	loop_1374
	movn	%icc,	%i1,	%g6
loop_1373:
	bleu,a,pn	%icc,	loop_1375
	bl	loop_1376
loop_1374:
	movpos	%xcc,	%l1,	%i7
	fpmerge	%f10,	%f11,	%f12
loop_1375:
	ta	%icc,	0x5
loop_1376:
	taddcctv	%g2,	0x189D,	%i0
	fmovse	%icc,	%f31,	%f12
	alignaddr	%l3,	%o1,	%l2
	tne	%icc,	0x2
	edge8n	%o5,	%i5,	%i4
	srlx	%i6,	0x1E,	%o3
	fmovspos	%xcc,	%f11,	%f3
	nop
	setx	loop_1377,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movle	%icc,	%o2,	%g5
	addcc	%l5,	%i3,	%o0
	nop
	setx loop_1378, %l0, %l1
	jmpl %l1, %l6
loop_1377:
	srax	%o4,	%i2,	%l0
	movge	%xcc,	%o6,	%l4
	sra	%o7,	0x14,	%g7
loop_1378:
	tg	%xcc,	0x0
	edge32n	%g3,	%g1,	%g4
	array8	%g6,	%i1,	%l1
	fabsd	%f26,	%f2
	sdivcc	%g2,	0x1963,	%i0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addc	%i7,	0x15A6,	%o1
	prefetch	[%l7 + 0x10],	 0x3
	fones	%f10
	movleu	%xcc,	%l3,	%o5
	set	0x78, %g1
	ldxa	[%l7 + %g1] 0x18,	%l2
	tcc	%xcc,	0x2
	tl	%xcc,	0x1
	std	%f22,	[%l7 + 0x68]
	wr	%g0,	0x81,	%asi
	stda	%i4,	[%l7 + 0x68] %asi
	fcmped	%fcc0,	%f22,	%f26
	flush	%l7 + 0x74
	andncc	%i6,	%i4,	%o3
	movne	%xcc,	%g5,	%o2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdneg	%icc,	%f3,	%f3
	fnegd	%f16,	%f4
	ld	[%l7 + 0x08],	%f22
	tcc	%icc,	0x0
	fcmpgt32	%f22,	%f2,	%l5
	move	%icc,	%i3,	%l6
	movne	%icc,	%o4,	%o0
	udiv	%l0,	0x19D2,	%i2
	fcmpne16	%f24,	%f16,	%l4
	umul	%o7,	0x0FF7,	%g7
	udivcc	%g3,	0x06CF,	%o6
	andcc	%g4,	%g1,	%g6
	srlx	%i1,	0x05,	%g2
	movvs	%icc,	%i0,	%i7
	subccc	%l1,	0x0882,	%l3
	call	loop_1379
	bpos,a,pn	%icc,	loop_1380
	movneg	%xcc,	%o1,	%l2
	edge8n	%o5,	%i6,	%i4
loop_1379:
	bpos,a,pn	%xcc,	loop_1381
loop_1380:
	be,a,pt	%xcc,	loop_1382
	fmul8ulx16	%f4,	%f18,	%f26
	movvs	%xcc,	%i5,	%o3
loop_1381:
	movgu	%icc,	%o2,	%g5
loop_1382:
	ldd	[%l7 + 0x78],	%i2
	movre	%l6,	0x106,	%l5
	fmovda	%xcc,	%f29,	%f14
	bshuffle	%f24,	%f6,	%f28
	addcc	%o0,	%o4,	%l0
	fmovrslz	%l4,	%f15,	%f25
	tge	%icc,	0x1
	sdiv	%o7,	0x1EA7,	%i2
	movrlez	%g7,	0x149,	%g3
	movl	%xcc,	%g4,	%o6
	fmovrse	%g6,	%f28,	%f1
	fnot2s	%f28,	%f22
	edge32l	%g1,	%g2,	%i0
	tcs	%xcc,	0x5
	bn,a,pn	%xcc,	loop_1383
	tle	%xcc,	0x5
	fmovsleu	%icc,	%f8,	%f26
	edge32	%i1,	%i7,	%l3
loop_1383:
	movcs	%xcc,	%l1,	%o1
	fmovsl	%icc,	%f17,	%f11
	te	%xcc,	0x7
	popc	0x0390,	%o5
	udivx	%i6,	0x1CE6,	%l2
	fmovscc	%xcc,	%f13,	%f9
	edge32	%i5,	%o3,	%i4
	fands	%f21,	%f13,	%f19
	edge16ln	%g5,	%i3,	%o2
	ldsw	[%l7 + 0x78],	%l5
	edge8l	%o0,	%l6,	%o4
	tneg	%icc,	0x7
	membar	0x25
	fmovdge	%xcc,	%f18,	%f26
	mulscc	%l4,	%l0,	%o7
	tcc	%xcc,	0x1
	set	0x2C, %o5
	swapa	[%l7 + %o5] 0x89,	%i2
	andn	%g3,	0x0669,	%g7
	sdivx	%g4,	0x16DD,	%o6
	addcc	%g1,	0x00AD,	%g2
	tgu	%xcc,	0x2
	wr	%g0,	0x81,	%asi
	sta	%f10,	[%l7 + 0x7C] %asi
	subcc	%g6,	0x06DD,	%i1
	fmovdn	%icc,	%f4,	%f4
	mulscc	%i0,	0x04F7,	%i7
	wr	%g0,	0x19,	%asi
	ldxa	[%l7 + 0x70] %asi,	%l1
	fcmpgt32	%f14,	%f18,	%l3
	te	%xcc,	0x7
	sra	%o1,	%o5,	%l2
	fxor	%f8,	%f0,	%f14
	edge8l	%i5,	%i6,	%i4
	brnz	%o3,	loop_1384
	fnand	%f26,	%f2,	%f30
	fnot2	%f8,	%f2
	movre	%g5,	%i3,	%l5
loop_1384:
	edge8l	%o0,	%o2,	%o4
	movcs	%xcc,	%l4,	%l6
	edge8	%l0,	%o7,	%g3
	wr	%g0,	0x81,	%asi
	stda	%i2,	[%l7 + 0x70] %asi
	bleu	loop_1385
	fnors	%f11,	%f12,	%f3
	mulx	%g7,	0x1257,	%o6
	popc	%g4,	%g2
loop_1385:
	edge32l	%g1,	%g6,	%i0
	fandnot1s	%f13,	%f3,	%f21
	mova	%icc,	%i7,	%l1
	tn	%xcc,	0x2
	edge8l	%l3,	%o1,	%o5
	movvs	%xcc,	%l2,	%i1
	xnorcc	%i6,	0x19FD,	%i4
	tgu	%xcc,	0x0
	andcc	%i5,	%o3,	%i3
	movre	%g5,	%l5,	%o2
	tvs	%icc,	0x3
	fnand	%f8,	%f22,	%f30
	movne	%icc,	%o0,	%o4
	srax	%l4,	%l6,	%o7
	sdiv	%g3,	0x0DF2,	%l0
	stb	%g7,	[%l7 + 0x08]
	tleu	%xcc,	0x4
	brgz,a	%i2,	loop_1386
	mulscc	%o6,	%g2,	%g4
	fmovrsgez	%g1,	%f31,	%f25
	movrgz	%g6,	0x1D7,	%i7
loop_1386:
	nop
	set	0x50, %o3
	ldswa	[%l7 + %o3] 0x10,	%l1
	andn	%l3,	%o1,	%i0
	movvc	%icc,	%l2,	%i1
	or	%i6,	0x0BF1,	%i4
	set	0x30, %o1
	stba	%o5,	[%l7 + %o1] 0x15
	fors	%f8,	%f11,	%f15
	tneg	%icc,	0x0
	brgez,a	%i5,	loop_1387
	movn	%icc,	%o3,	%i3
	fandnot2	%f2,	%f22,	%f16
	move	%icc,	%l5,	%o2
loop_1387:
	add	%o0,	0x17E3,	%o4
	fbue	%fcc0,	loop_1388
	movleu	%icc,	%l4,	%g5
	bge,a	loop_1389
	ba,a,pn	%icc,	loop_1390
loop_1388:
	andn	%o7,	%g3,	%l6
	edge8l	%g7,	%l0,	%i2
loop_1389:
	movrlez	%o6,	%g2,	%g1
loop_1390:
	movrlz	%g6,	0x1BA,	%i7
	movrgez	%g4,	%l3,	%l1
	srl	%i0,	0x04,	%l2
	subcc	%o1,	%i6,	%i4
	tvc	%icc,	0x3
	fbul	%fcc3,	loop_1391
	addcc	%i1,	%i5,	%o5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bcs,a	loop_1392
loop_1391:
	srl	%o3,	0x17,	%l5
	fpadd16s	%f8,	%f12,	%f22
	fmovsl	%icc,	%f12,	%f4
loop_1392:
	xnorcc	%i3,	0x0F12,	%o2
	fxnors	%f24,	%f23,	%f10
	fandnot2s	%f7,	%f7,	%f25
	stb	%o0,	[%l7 + 0x6D]
	bleu,pn	%icc,	loop_1393
	prefetch	[%l7 + 0x24],	 0x2
	taddcctv	%o4,	%g5,	%o7
	edge16n	%l4,	%l6,	%g7
loop_1393:
	mulscc	%l0,	%g3,	%i2
	edge8n	%g2,	%g1,	%g6
	tg	%icc,	0x0
	subccc	%o6,	0x116D,	%g4
	array8	%i7,	%l3,	%l1
	umulcc	%i0,	%o1,	%i6
	edge32	%l2,	%i4,	%i1
	movge	%xcc,	%o5,	%o3
	subcc	%i5,	%l5,	%o2
	edge8	%i3,	%o4,	%g5
	fcmpgt16	%f30,	%f16,	%o7
	fsrc1s	%f14,	%f24
	tl	%xcc,	0x1
	movle	%xcc,	%l4,	%l6
	orn	%o0,	%l0,	%g7
	ta	%xcc,	0x1
	flush	%l7 + 0x7C
	fpsub16	%f16,	%f16,	%f22
	sra	%i2,	%g2,	%g1
	ldsw	[%l7 + 0x08],	%g3
	fmovsgu	%xcc,	%f21,	%f29
	fpmerge	%f17,	%f9,	%f26
	edge8	%o6,	%g4,	%g6
	ldd	[%l7 + 0x40],	%f22
	array32	%i7,	%l3,	%i0
	sdivx	%o1,	0x01DA,	%l1
	movvs	%icc,	%l2,	%i4
	fmovdle	%icc,	%f10,	%f15
	fsrc1	%f26,	%f0
	fandnot1s	%f8,	%f1,	%f20
	fmovdg	%xcc,	%f29,	%f28
	movne	%icc,	%i6,	%i1
	fmovsl	%icc,	%f0,	%f19
	fmovrse	%o3,	%f3,	%f8
	fmovdgu	%icc,	%f6,	%f20
	edge32ln	%i5,	%o5,	%o2
	faligndata	%f6,	%f12,	%f18
	fmovrsgz	%i3,	%f16,	%f2
	andncc	%o4,	%l5,	%o7
	tsubcctv	%g5,	0x1C12,	%l6
	edge8	%o0,	%l4,	%g7
	movrgz	%i2,	0x223,	%g2
	udiv	%g1,	0x1D5D,	%l0
	movrgez	%g3,	%g4,	%g6
	tgu	%icc,	0x3
	fcmpeq16	%f0,	%f28,	%o6
	bvs,pn	%icc,	loop_1394
	fcmped	%fcc0,	%f24,	%f10
	movvs	%icc,	%l3,	%i0
	wr	%g0,	0xf1,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
loop_1394:
	fmovsne	%icc,	%f12,	%f1
	taddcctv	%o1,	%l1,	%l2
	edge32	%i4,	%i6,	%i1
	movpos	%xcc,	%o3,	%i7
	taddcc	%o5,	0x1C36,	%i5
	fbuge	%fcc3,	loop_1395
	fnegs	%f27,	%f2
	or	%i3,	%o2,	%l5
	srlx	%o7,	%g5,	%o4
loop_1395:
	movge	%xcc,	%o0,	%l4
	fmovrsne	%g7,	%f29,	%f1
	edge32ln	%l6,	%g2,	%g1
	tn	%xcc,	0x6
	tsubcctv	%l0,	0x165A,	%i2
	bpos,pn	%xcc,	loop_1396
	srl	%g3,	0x1F,	%g4
	sethi	0x1CFB,	%g6
	sdivcc	%o6,	0x1CFD,	%l3
loop_1396:
	stbar
	movne	%xcc,	%o1,	%i0
	tne	%icc,	0x5
	fmovdne	%xcc,	%f14,	%f11
	brgz	%l1,	loop_1397
	bshuffle	%f4,	%f12,	%f28
	tcc	%icc,	0x1
	srax	%l2,	%i4,	%i1
loop_1397:
	tvc	%xcc,	0x2
	udiv	%o3,	0x1FCE,	%i7
	bneg,pt	%icc,	loop_1398
	bpos,a,pt	%icc,	loop_1399
	fmul8x16al	%f18,	%f13,	%f30
	movl	%icc,	%i6,	%i5
loop_1398:
	fcmpeq32	%f16,	%f6,	%o5
loop_1399:
	nop
	wr	%g0,	0x88,	%asi
	lduwa	[%l7 + 0x30] %asi,	%i3
	subcc	%l5,	%o2,	%o7
	ba,pt	%xcc,	loop_1400
	alignaddrl	%o4,	%g5,	%l4
	fmovsge	%xcc,	%f9,	%f23
	bneg,pt	%icc,	loop_1401
loop_1400:
	nop
	setx	loop_1402,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	xor	%g7,	0x06A3,	%l6
	edge32l	%g2,	%o0,	%g1
loop_1401:
	movrlez	%l0,	0x017,	%i2
loop_1402:
	bpos,a	%xcc,	loop_1403
	sdiv	%g3,	0x1A95,	%g6
	bleu	loop_1404
	movvs	%icc,	%g4,	%l3
loop_1403:
	fnand	%f20,	%f10,	%f0
	faligndata	%f30,	%f24,	%f0
loop_1404:
	tne	%xcc,	0x3
	tpos	%xcc,	0x5
	edge16	%o1,	%i0,	%o6
	fmovdvs	%icc,	%f17,	%f6
	fmul8x16	%f11,	%f10,	%f2
	fcmpne16	%f12,	%f12,	%l1
	te	%icc,	0x1
	popc	%i4,	%l2
	fpack32	%f20,	%f16,	%f18
	bleu,a	loop_1405
	subccc	%o3,	%i7,	%i1
	bshuffle	%f24,	%f24,	%f8
	smulcc	%i5,	%o5,	%i6
loop_1405:
	nop
	set	0x39, %i3
	stba	%i3,	[%l7 + %i3] 0xeb
	membar	#Sync
	tle	%xcc,	0x6
	bne,a,pn	%xcc,	loop_1406
	edge16l	%l5,	%o7,	%o4
	alignaddrl	%g5,	%l4,	%g7
	std	%f8,	[%l7 + 0x48]
loop_1406:
	tcs	%xcc,	0x5
	edge32ln	%l6,	%g2,	%o0
	smulcc	%o2,	0x1B80,	%g1
	fnors	%f14,	%f25,	%f1
	edge16ln	%l0,	%g3,	%i2
	wr	%g0,	0x19,	%asi
	lduha	[%l7 + 0x2E] %asi,	%g6
	edge32l	%g4,	%o1,	%i0
	movleu	%icc,	%l3,	%l1
	fsrc1s	%f15,	%f20
	brz	%i4,	loop_1407
	movrlez	%o6,	%l2,	%i7
	smulcc	%o3,	%i5,	%o5
	brnz,a	%i1,	loop_1408
loop_1407:
	smulcc	%i3,	%l5,	%i6
	bneg,pn	%xcc,	loop_1409
	mova	%xcc,	%o4,	%o7
loop_1408:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsh	[%l7 + 0x46],	%g5
loop_1409:
	edge32n	%l4,	%l6,	%g7
	fmovdne	%icc,	%f26,	%f22
	fcmpne16	%f12,	%f6,	%g2
	fnot2s	%f24,	%f5
	bpos,a	%xcc,	loop_1410
	mova	%icc,	%o2,	%g1
	fandnot2	%f8,	%f4,	%f30
	sir	0x0A49
loop_1410:
	bn,a,pt	%xcc,	loop_1411
	ldstub	[%l7 + 0x16],	%o0
	sdivx	%g3,	0x13E4,	%l0
	fmovsg	%xcc,	%f20,	%f1
loop_1411:
	subcc	%i2,	%g6,	%o1
	fba	%fcc3,	loop_1412
	edge32ln	%g4,	%i0,	%l1
	movcc	%xcc,	%l3,	%o6
	fcmpne16	%f22,	%f20,	%i4
loop_1412:
	bl,a	%icc,	loop_1413
	edge16n	%l2,	%o3,	%i5
	sra	%o5,	%i1,	%i3
	movn	%icc,	%l5,	%i7
loop_1413:
	std	%i6,	[%l7 + 0x38]
	fbule,a	%fcc3,	loop_1414
	addc	%o7,	%o4,	%g5
	alignaddrl	%l4,	%g7,	%g2
	ld	[%l7 + 0x6C],	%f21
loop_1414:
	umulcc	%o2,	0x0E1F,	%l6
	ldub	[%l7 + 0x55],	%o0
	tsubcctv	%g3,	0x0011,	%g1
	fnands	%f7,	%f17,	%f28
	wr	%g0,	0x2e,	%asi
	ldda	[%l7 + 0x70] %asi,	%l0
	movgu	%icc,	%g6,	%i2
	stw	%o1,	[%l7 + 0x18]
	movvc	%icc,	%g4,	%l1
	sdiv	%i0,	0x0541,	%o6
	mova	%icc,	%i4,	%l2
	tleu	%icc,	0x6
	fbge	%fcc3,	loop_1415
	movrgz	%o3,	0x1EC,	%i5
	movne	%xcc,	%o5,	%i1
	srl	%i3,	%l3,	%l5
loop_1415:
	movne	%icc,	%i6,	%i7
	tsubcctv	%o4,	0x1ABB,	%o7
	fbul	%fcc1,	loop_1416
	tg	%icc,	0x7
	bg	%icc,	loop_1417
	siam	0x1
loop_1416:
	edge16l	%l4,	%g5,	%g7
	tg	%xcc,	0x6
loop_1417:
	xnor	%g2,	0x1271,	%o2
	bgu,pt	%icc,	loop_1418
	ldd	[%l7 + 0x28],	%f12
	fbn	%fcc2,	loop_1419
	srax	%o0,	%g3,	%g1
loop_1418:
	movne	%xcc,	%l6,	%l0
	fnot1s	%f29,	%f17
loop_1419:
	array16	%i2,	%o1,	%g4
	addcc	%l1,	%g6,	%i0
	mova	%icc,	%o6,	%l2
	tsubcctv	%o3,	%i4,	%o5
	edge8n	%i1,	%i5,	%l3
	fbul,a	%fcc1,	loop_1420
	orn	%l5,	%i3,	%i7
	tne	%xcc,	0x6
	popc	%o4,	%o7
loop_1420:
	tneg	%icc,	0x2
	xnorcc	%i6,	%l4,	%g5
	taddcctv	%g7,	0x0B97,	%o2
	subcc	%o0,	0x0BCB,	%g2
	fmovdcc	%icc,	%f18,	%f26
	movcc	%icc,	%g3,	%l6
	fnot2	%f28,	%f0
	orncc	%l0,	0x0768,	%g1
	smul	%o1,	%g4,	%l1
	fmovrsne	%g6,	%f18,	%f3
	movrlez	%i0,	0x158,	%o6
	udivx	%l2,	0x082F,	%o3
	wr	%g0,	0x11,	%asi
	stba	%i4,	[%l7 + 0x1B] %asi
	add	%o5,	%i2,	%i1
	fbul,a	%fcc2,	loop_1421
	std	%f16,	[%l7 + 0x60]
	umulcc	%i5,	0x1ECA,	%l5
	addc	%l3,	0x0632,	%i3
loop_1421:
	movpos	%xcc,	%i7,	%o4
	ldstub	[%l7 + 0x50],	%i6
	wr	%g0,	0x0c,	%asi
	lduwa	[%l7 + 0x7C] %asi,	%o7
	sra	%g5,	%g7,	%l4
	fbg,a	%fcc2,	loop_1422
	edge8n	%o0,	%o2,	%g3
	fbne,a	%fcc0,	loop_1423
	movcs	%icc,	%g2,	%l0
loop_1422:
	bne,pn	%icc,	loop_1424
	nop
	setx	loop_1425,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_1423:
	or	%l6,	%g1,	%g4
	sllx	%o1,	%g6,	%l1
loop_1424:
	bneg,a	%icc,	loop_1426
loop_1425:
	fexpand	%f23,	%f14
	fmovse	%xcc,	%f29,	%f19
	movrlez	%o6,	%l2,	%o3
loop_1426:
	bn,pn	%xcc,	loop_1427
	fbug,a	%fcc3,	loop_1428
	fcmple32	%f24,	%f12,	%i4
	umul	%o5,	%i2,	%i1
loop_1427:
	tneg	%xcc,	0x2
loop_1428:
	sra	%i5,	0x0F,	%i0
	tn	%xcc,	0x0
	lduh	[%l7 + 0x24],	%l5
	brnz	%l3,	loop_1429
	udivx	%i7,	0x0C30,	%o4
	tpos	%xcc,	0x6
	ldsw	[%l7 + 0x0C],	%i6
loop_1429:
	fmul8x16	%f20,	%f16,	%f28
	st	%f18,	[%l7 + 0x2C]
	array32	%i3,	%o7,	%g7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tvc	%xcc,	0x3
	umulcc	%g5,	%o0,	%o2
	be,a,pt	%icc,	loop_1430
	mulscc	%l4,	0x0B8A,	%g3
	alignaddr	%g2,	%l0,	%g1
	sub	%l6,	%o1,	%g6
loop_1430:
	fmovscc	%xcc,	%f27,	%f25
	movrlz	%l1,	0x12A,	%o6
	be,a,pt	%icc,	loop_1431
	sllx	%g4,	%o3,	%i4
	alignaddrl	%l2,	%o5,	%i2
	tge	%icc,	0x2
loop_1431:
	fmovrsgez	%i1,	%f7,	%f15
	udivx	%i5,	0x0C93,	%i0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srax	%l3,	0x09,	%l5
	edge16	%i7,	%o4,	%i3
	add	%i6,	0x0FC7,	%g7
	fmovsleu	%icc,	%f20,	%f11
	fmovse	%xcc,	%f20,	%f29
	movl	%xcc,	%o7,	%g5
	and	%o0,	0x014D,	%l4
	andcc	%g3,	0x09E2,	%o2
	smul	%l0,	%g2,	%l6
	tsubcc	%g1,	0x0DA9,	%g6
	smulcc	%o1,	0x1210,	%o6
	movgu	%xcc,	%g4,	%o3
	tgu	%xcc,	0x4
	orn	%l1,	%l2,	%o5
	fbge	%fcc1,	loop_1432
	fmovsg	%icc,	%f7,	%f21
	fmovsn	%xcc,	%f0,	%f12
	fmovrsgz	%i2,	%f14,	%f8
loop_1432:
	addc	%i1,	0x0873,	%i5
	bge	%xcc,	loop_1433
	movcs	%xcc,	%i0,	%l3
	fbo	%fcc2,	loop_1434
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1433:
	movcc	%icc,	%i4,	%i7
	edge16	%l5,	%i3,	%i6
loop_1434:
	bne	%icc,	loop_1435
	stb	%g7,	[%l7 + 0x7E]
	wr	%g0,	0xe2,	%asi
	stha	%o4,	[%l7 + 0x6E] %asi
	membar	#Sync
loop_1435:
	tvc	%xcc,	0x5
	fbule	%fcc3,	loop_1436
	alignaddr	%g5,	%o0,	%l4
	fmovrdlez	%o7,	%f2,	%f24
	movre	%o2,	0x09E,	%l0
loop_1436:
	udiv	%g2,	0x0F2F,	%g3
	movrne	%g1,	0x3BA,	%g6
	tne	%xcc,	0x6
	umulcc	%o1,	%o6,	%l6
	fmuld8ulx16	%f16,	%f12,	%f6
	st	%f10,	[%l7 + 0x74]
	fnot2	%f14,	%f22
	edge32	%o3,	%l1,	%l2
	brz,a	%o5,	loop_1437
	fmovsne	%xcc,	%f13,	%f6
	alignaddrl	%g4,	%i2,	%i5
	fpsub32s	%f25,	%f28,	%f29
loop_1437:
	be	%icc,	loop_1438
	be	%xcc,	loop_1439
	fblg,a	%fcc1,	loop_1440
	movn	%xcc,	%i1,	%i0
loop_1438:
	umul	%l3,	%i4,	%i7
loop_1439:
	movpos	%icc,	%i3,	%i6
loop_1440:
	fmovrdne	%l5,	%f10,	%f8
	fbuge,a	%fcc1,	loop_1441
	fmovsne	%icc,	%f3,	%f6
	mova	%xcc,	%g7,	%o4
	fpsub32s	%f23,	%f11,	%f31
loop_1441:
	fmovsvs	%icc,	%f7,	%f29
	flush	%l7 + 0x70
	wr	%g0,	0xe3,	%asi
	stwa	%g5,	[%l7 + 0x0C] %asi
	membar	#Sync
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movcs	%icc,	%l4,	%o0
	sra	%o2,	%l0,	%o7
	fands	%f14,	%f19,	%f19
	edge32ln	%g2,	%g3,	%g1
	fpadd32s	%f12,	%f26,	%f27
	bvs	%icc,	loop_1442
	ldsb	[%l7 + 0x63],	%g6
	udiv	%o1,	0x1736,	%o6
	fmovsleu	%icc,	%f3,	%f29
loop_1442:
	tgu	%icc,	0x3
	subc	%l6,	%o3,	%l1
	tcc	%icc,	0x7
	std	%l2,	[%l7 + 0x38]
	edge8l	%g4,	%i2,	%o5
	udiv	%i5,	0x1CB2,	%i1
	fmovdpos	%xcc,	%f27,	%f24
	xor	%i0,	0x05C4,	%i4
	movcs	%icc,	%i7,	%l3
	tl	%xcc,	0x0
	set	0x4E, %o0
	ldsha	[%l7 + %o0] 0x0c,	%i3
	subc	%i6,	%g7,	%l5
	sdiv	%o4,	0x0B5C,	%g5
	tg	%xcc,	0x2
	fbuge,a	%fcc1,	loop_1443
	fpadd16	%f10,	%f22,	%f22
	fones	%f1
	orncc	%l4,	%o2,	%l0
loop_1443:
	tl	%xcc,	0x7
	movre	%o0,	%g2,	%g3
	udivx	%o7,	0x183B,	%g6
	edge32	%g1,	%o6,	%l6
	edge8l	%o1,	%l1,	%l2
	tcc	%icc,	0x6
	orcc	%o3,	0x18E8,	%g4
	subcc	%o5,	%i2,	%i1
	movgu	%icc,	%i5,	%i4
	set	0x70, %g5
	stda	%i0,	[%l7 + %g5] 0x88
	umulcc	%i7,	%i3,	%i6
	wr	%g0,	0x89,	%asi
	stda	%l2,	[%l7 + 0x70] %asi
	tn	%xcc,	0x4
	tcc	%icc,	0x3
	nop
	set	0x20, %g2
	prefetch	[%l7 + %g2],	 0x3
	wr	%g0,	0x80,	%asi
	stha	%l5,	[%l7 + 0x1C] %asi
	ble,a,pt	%xcc,	loop_1444
	bcc,a	loop_1445
	fornot1	%f10,	%f28,	%f4
	udivx	%o4,	0x1077,	%g7
loop_1444:
	xor	%l4,	%o2,	%g5
loop_1445:
	nop
	wr	%g0,	0x19,	%asi
	stha	%o0,	[%l7 + 0x0C] %asi
	umulcc	%g2,	0x0826,	%l0
	udivx	%o7,	0x09EB,	%g3
	addc	%g6,	0x1300,	%g1
	tpos	%icc,	0x6
	movre	%o6,	0x2DC,	%l6
	fmovrse	%l1,	%f20,	%f5
	movvc	%xcc,	%l2,	%o3
	umul	%o1,	%o5,	%g4
	fmovdgu	%xcc,	%f1,	%f12
	subcc	%i2,	%i1,	%i5
	edge8n	%i0,	%i4,	%i7
	movpos	%xcc,	%i6,	%i3
	bne,pn	%icc,	loop_1446
	bvs,a	loop_1447
	movrne	%l3,	%l5,	%o4
	fnot2s	%f7,	%f27
loop_1446:
	sdivx	%l4,	0x08D5,	%o2
loop_1447:
	stw	%g5,	[%l7 + 0x5C]
	orncc	%g7,	0x02A9,	%o0
	movne	%icc,	%g2,	%l0
	andcc	%o7,	0x129F,	%g3
	tcc	%icc,	0x4
	stx	%g6,	[%l7 + 0x38]
	set	0x50, %l2
	stha	%g1,	[%l7 + %l2] 0x0c
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movge	%icc,	%o6,	%l6
	edge8n	%l1,	%l2,	%o1
	movre	%o5,	%o3,	%i2
	xorcc	%i1,	0x11D0,	%g4
	edge16l	%i5,	%i0,	%i4
	wr	%g0,	0x89,	%asi
	ldstuba	[%l7 + 0x2F] %asi,	%i6
	edge16n	%i7,	%i3,	%l3
	movvc	%icc,	%o4,	%l5
	sdivx	%o2,	0x0E1E,	%g5
	movcc	%xcc,	%g7,	%o0
	std	%l4,	[%l7 + 0x30]
	add	%g2,	%o7,	%l0
	subccc	%g3,	%g6,	%o6
	fnot2	%f10,	%f4
	fornot1	%f2,	%f26,	%f6
	fnands	%f23,	%f5,	%f28
	fmovdle	%xcc,	%f6,	%f30
	wr	%g0,	0x80,	%asi
	sta	%f19,	[%l7 + 0x78] %asi
	addc	%l6,	%g1,	%l2
	fbu	%fcc2,	loop_1448
	fors	%f26,	%f24,	%f23
	ta	%icc,	0x4
	bleu	%icc,	loop_1449
loop_1448:
	srl	%l1,	%o1,	%o3
	movrgz	%i2,	%o5,	%i1
	addccc	%i5,	0x07C5,	%g4
loop_1449:
	brlez	%i0,	loop_1450
	udivx	%i4,	0x0708,	%i6
	te	%xcc,	0x7
	tvc	%icc,	0x7
loop_1450:
	subc	%i3,	0x1ACB,	%i7
	edge32l	%l3,	%o4,	%o2
	membar	#Sync
	wr	%g0,	0xf8,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	sra	%l5,	0x09,	%g7
	fmovrdgz	%g5,	%f28,	%f18
	fmovscc	%icc,	%f24,	%f14
	edge8ln	%l4,	%g2,	%o0
	fcmpgt32	%f4,	%f26,	%l0
	tcs	%icc,	0x7
	brgz,a	%g3,	loop_1451
	array32	%o7,	%o6,	%g6
	orncc	%l6,	0x14D4,	%l2
	sll	%l1,	%g1,	%o1
loop_1451:
	bn,a,pn	%icc,	loop_1452
	tsubcctv	%i2,	0x0241,	%o5
	fmovdg	%icc,	%f16,	%f11
	edge16	%o3,	%i5,	%i1
loop_1452:
	tpos	%icc,	0x3
	fmovdvs	%xcc,	%f11,	%f2
	tcc	%xcc,	0x4
	tneg	%xcc,	0x5
	fba,a	%fcc2,	loop_1453
	fexpand	%f24,	%f0
	fpsub16	%f22,	%f26,	%f4
	edge8	%g4,	%i4,	%i6
loop_1453:
	stb	%i0,	[%l7 + 0x0B]
	movneg	%xcc,	%i3,	%l3
	xor	%i7,	%o4,	%o2
	udiv	%g7,	0x14B0,	%g5
	edge8ln	%l5,	%g2,	%o0
	movne	%xcc,	%l4,	%g3
	udivx	%o7,	0x1335,	%o6
	ldstub	[%l7 + 0x25],	%g6
	movneg	%xcc,	%l0,	%l6
	fcmps	%fcc1,	%f19,	%f7
	tg	%xcc,	0x1
	fones	%f17
	mulscc	%l1,	0x0EC4,	%g1
	fbuge,a	%fcc0,	loop_1454
	array16	%l2,	%i2,	%o1
	alignaddr	%o5,	%i5,	%i1
	movle	%icc,	%o3,	%i4
loop_1454:
	fnot2s	%f18,	%f6
	alignaddrl	%g4,	%i6,	%i3
	fmul8sux16	%f10,	%f8,	%f22
	tneg	%xcc,	0x7
	add	%i0,	0x089E,	%l3
	fsrc2	%f28,	%f12
	membar	0x5C
	movgu	%icc,	%o4,	%i7
	fsrc2s	%f15,	%f0
	addc	%g7,	%o2,	%g5
	fmovrslez	%g2,	%f10,	%f3
	ldx	[%l7 + 0x18],	%l5
	te	%icc,	0x5
	movneg	%xcc,	%o0,	%g3
	membar	0x25
	edge16l	%l4,	%o7,	%o6
	ldd	[%l7 + 0x40],	%f20
	bneg,a	loop_1455
	array16	%l0,	%l6,	%g6
	tl	%icc,	0x1
	mova	%icc,	%l1,	%l2
loop_1455:
	ldsh	[%l7 + 0x0C],	%i2
	xorcc	%g1,	0x1AC8,	%o5
	array32	%o1,	%i1,	%i5
	tcs	%xcc,	0x2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	call	loop_1456
	udiv	%i4,	0x1DA7,	%o3
	tleu	%icc,	0x2
	smul	%i6,	0x1A95,	%i3
loop_1456:
	mova	%icc,	%i0,	%g4
	fbug,a	%fcc1,	loop_1457
	fcmpeq16	%f8,	%f22,	%l3
	fblg,a	%fcc3,	loop_1458
	alignaddrl	%o4,	%g7,	%o2
loop_1457:
	andcc	%g5,	0x1BC8,	%g2
	wr	%g0,	0x19,	%asi
	ldsba	[%l7 + 0x24] %asi,	%i7
loop_1458:
	fbu,a	%fcc1,	loop_1459
	taddcc	%o0,	0x154B,	%g3
	tcs	%xcc,	0x7
	smulcc	%l5,	%l4,	%o7
loop_1459:
	fbu	%fcc3,	loop_1460
	sub	%o6,	0x1AB5,	%l6
	ldsh	[%l7 + 0x2A],	%g6
	sdiv	%l1,	0x1F75,	%l0
loop_1460:
	subccc	%i2,	%l2,	%g1
	andncc	%o1,	%o5,	%i5
	fbul,a	%fcc2,	loop_1461
	fmovdl	%icc,	%f13,	%f11
	be,pt	%icc,	loop_1462
	lduh	[%l7 + 0x4C],	%i4
loop_1461:
	fone	%f4
	set	0x50, %l0
	sta	%f29,	[%l7 + %l0] 0x15
loop_1462:
	ta	%icc,	0x2
	fzeros	%f3
	subcc	%o3,	0x0E30,	%i1
	fmovsge	%icc,	%f21,	%f27
	lduw	[%l7 + 0x40],	%i6
	orn	%i0,	0x02CB,	%g4
	fexpand	%f31,	%f4
	edge16	%i3,	%l3,	%g7
	fmovrdgez	%o4,	%f12,	%f22
	ta	%icc,	0x3
	te	%icc,	0x2
	fmovsvs	%icc,	%f24,	%f16
	subccc	%o2,	0x08FE,	%g5
	tge	%xcc,	0x4
	tcc	%xcc,	0x6
	srl	%g2,	0x0A,	%i7
	add	%o0,	0x1DEC,	%l5
	sllx	%g3,	%l4,	%o6
	and	%l6,	0x144A,	%g6
	fmovdne	%xcc,	%f18,	%f29
	stw	%o7,	[%l7 + 0x14]
	set	0x3E, %g3
	lduha	[%l7 + %g3] 0x88,	%l0
	edge16ln	%l1,	%i2,	%g1
	fmovsg	%icc,	%f15,	%f17
	fbu,a	%fcc1,	loop_1463
	sir	0x1B0E
	edge16l	%l2,	%o1,	%o5
	sth	%i5,	[%l7 + 0x5E]
loop_1463:
	mulscc	%i4,	0x1AED,	%o3
	fnot1	%f8,	%f8
	fnands	%f24,	%f9,	%f30
	fxnors	%f10,	%f26,	%f18
	array16	%i6,	%i1,	%i0
	set	0x0, %l3
	stxa	%g4,	[%g0 + %l3] 0x20
	tpos	%xcc,	0x6
	tsubcc	%l3,	%i3,	%g7
	movge	%xcc,	%o2,	%o4
	wr	%g0,	0x04,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	edge8l	%g2,	%i7,	%g5
	bshuffle	%f24,	%f18,	%f4
	movrne	%l5,	0x216,	%o0
	fmul8x16au	%f6,	%f5,	%f24
	wr	%g0,	0x89,	%asi
	ldsha	[%l7 + 0x56] %asi,	%g3
	bne	loop_1464
	ldd	[%l7 + 0x60],	%f16
	bcs	%xcc,	loop_1465
	fpack16	%f8,	%f14
loop_1464:
	fandnot2s	%f27,	%f9,	%f0
	set	0x18, %l1
	ldsba	[%l7 + %l1] 0x15,	%o6
loop_1465:
	sdivcc	%l6,	0x1210,	%l4
	tg	%icc,	0x3
	fmovsneg	%icc,	%f14,	%f20
	sdivx	%g6,	0x1795,	%o7
	sdivx	%l1,	0x0BD7,	%l0
	fmovs	%f9,	%f18
	array32	%g1,	%i2,	%l2
	tpos	%icc,	0x0
	udivx	%o1,	0x0E92,	%i5
	subccc	%i4,	0x0C16,	%o3
	movge	%icc,	%i6,	%i1
	subcc	%o5,	0x12FB,	%g4
	edge16ln	%i0,	%i3,	%l3
	fbug	%fcc3,	loop_1466
	fbue	%fcc2,	loop_1467
	fble	%fcc2,	loop_1468
	fmovdg	%icc,	%f15,	%f6
loop_1466:
	movleu	%icc,	%g7,	%o2
loop_1467:
	fmovsg	%icc,	%f3,	%f31
loop_1468:
	fmovrdgez	%g2,	%f8,	%f4
	fbug	%fcc2,	loop_1469
	subc	%o4,	%g5,	%l5
	stbar
	movl	%icc,	%o0,	%i7
loop_1469:
	ldd	[%l7 + 0x48],	%g2
	sethi	0x05F0,	%o6
	tg	%xcc,	0x5
	array8	%l4,	%g6,	%l6
	sub	%o7,	%l1,	%l0
	mulx	%i2,	0x0B79,	%g1
	lduw	[%l7 + 0x48],	%o1
	lduh	[%l7 + 0x2C],	%l2
	tn	%icc,	0x1
	prefetch	[%l7 + 0x10],	 0x2
	sub	%i4,	%i5,	%i6
	orcc	%o3,	0x11AA,	%i1
	fble	%fcc2,	loop_1470
	fbl,a	%fcc2,	loop_1471
	movrlz	%o5,	%g4,	%i3
	smulcc	%l3,	0x100E,	%i0
loop_1470:
	add	%g7,	%o2,	%g2
loop_1471:
	edge8ln	%o4,	%l5,	%o0
	tleu	%xcc,	0x3
	membar	0x48
	movvc	%icc,	%i7,	%g5
	add	%l7,	0x14,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] %asi,	%g3,	%o6
	edge32ln	%g6,	%l4,	%l6
	set	0x1E, %o7
	lduha	[%l7 + %o7] 0x11,	%o7
	tcs	%xcc,	0x4
	set	0x0C, %i6
	ldswa	[%l7 + %i6] 0x88,	%l0
	udivcc	%i2,	0x0894,	%l1
	sir	0x172B
	ldsw	[%l7 + 0x54],	%g1
	fands	%f10,	%f26,	%f26
	ble,a,pt	%icc,	loop_1472
	ldsb	[%l7 + 0x1F],	%l2
	edge16l	%i4,	%o1,	%i6
	andncc	%i5,	%o3,	%o5
loop_1472:
	movne	%icc,	%i1,	%i3
	nop
	setx	loop_1473,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fmovsleu	%xcc,	%f10,	%f17
	taddcc	%l3,	0x1F8C,	%g4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1473:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x18,	%asi
	ldstuba	[%l7 + 0x3E] %asi,	%g7
	tg	%icc,	0x0
	set	0x60, %g6
	ldda	[%l7 + %g6] 0x04,	%i0
	tge	%icc,	0x2
	bpos,pt	%xcc,	loop_1474
	fmul8x16	%f21,	%f30,	%f4
	fmovdg	%icc,	%f23,	%f7
	fcmpeq32	%f16,	%f0,	%g2
loop_1474:
	xor	%o4,	0x0E79,	%l5
	movleu	%xcc,	%o2,	%i7
	fands	%f16,	%f17,	%f24
	sllx	%o0,	0x0B,	%g3
	movl	%icc,	%g5,	%o6
	tvc	%xcc,	0x7
	movn	%xcc,	%l4,	%g6
	stw	%o7,	[%l7 + 0x6C]
	ldsb	[%l7 + 0x6A],	%l6
	alignaddrl	%l0,	%i2,	%l1
	movn	%icc,	%g1,	%l2
	ldsb	[%l7 + 0x72],	%o1
	set	0x10, %o6
	ldxa	[%l7 + %o6] 0x04,	%i6
	movvc	%icc,	%i4,	%o3
	fcmpne16	%f14,	%f10,	%o5
	set	0x2C, %l4
	ldsha	[%l7 + %l4] 0x15,	%i1
	tne	%xcc,	0x4
	tne	%icc,	0x5
	fmovdcs	%xcc,	%f18,	%f13
	and	%i3,	0x049B,	%l3
	fbue,a	%fcc2,	loop_1475
	fcmpne16	%f0,	%f4,	%i5
	bge,a,pn	%icc,	loop_1476
	ble,pt	%icc,	loop_1477
loop_1475:
	bg,pn	%icc,	loop_1478
	nop
	setx	loop_1479,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_1476:
	udivcc	%g4,	0x1A91,	%i0
loop_1477:
	tn	%icc,	0x7
loop_1478:
	udivx	%g2,	0x05BE,	%g7
loop_1479:
	popc	%o4,	%o2
	be,a,pn	%icc,	loop_1480
	movpos	%icc,	%l5,	%o0
	movge	%icc,	%g3,	%g5
	fmovsl	%icc,	%f26,	%f26
loop_1480:
	udivcc	%i7,	0x1F22,	%l4
	sethi	0x0204,	%o6
	brgz	%o7,	loop_1481
	tg	%xcc,	0x6
	sra	%g6,	%l0,	%i2
	fxors	%f21,	%f4,	%f30
loop_1481:
	bvc	loop_1482
	std	%f4,	[%l7 + 0x10]
	fbuge,a	%fcc0,	loop_1483
	ble,pn	%xcc,	loop_1484
loop_1482:
	edge32ln	%l1,	%l6,	%l2
	ta	%xcc,	0x1
loop_1483:
	fcmple32	%f4,	%f0,	%g1
loop_1484:
	add	%i6,	0x1B5E,	%i4
	fbo,a	%fcc3,	loop_1485
	movrgz	%o3,	0x006,	%o5
	tvs	%xcc,	0x6
	fcmple32	%f16,	%f20,	%i1
loop_1485:
	movvs	%icc,	%i3,	%o1
	fors	%f17,	%f31,	%f9
	fbn	%fcc2,	loop_1486
	edge8l	%l3,	%g4,	%i0
	addc	%i5,	0x087C,	%g2
	edge16	%o4,	%o2,	%l5
loop_1486:
	subcc	%o0,	%g7,	%g5
	alignaddr	%i7,	%l4,	%g3
	prefetch	[%l7 + 0x28],	 0x2
	movvs	%xcc,	%o6,	%g6
	fmul8x16au	%f20,	%f23,	%f20
	bvc,a,pn	%icc,	loop_1487
	tcc	%icc,	0x2
	smulcc	%l0,	%i2,	%o7
	set	0x30, %o4
	ldstuba	[%l7 + %o4] 0x89,	%l1
loop_1487:
	nop
	wr	%g0,	0x11,	%asi
	ldxa	[%l7 + 0x30] %asi,	%l2
	movn	%xcc,	%l6,	%i6
	movvc	%icc,	%i4,	%o3
	tvc	%icc,	0x3
	std	%f6,	[%l7 + 0x58]
	fmovsg	%icc,	%f3,	%f25
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x0c,	%asi
	lduba	[%l7 + 0x3C] %asi,	%o5
	movleu	%xcc,	%g1,	%i3
	fmovdle	%icc,	%f4,	%f6
	movl	%icc,	%i1,	%o1
	fbo,a	%fcc1,	loop_1488
	or	%l3,	0x1CB3,	%g4
	fnegs	%f30,	%f6
	tleu	%icc,	0x6
loop_1488:
	mulscc	%i5,	%i0,	%o4
	fpack32	%f26,	%f16,	%f2
	fmovse	%icc,	%f13,	%f26
	fornot2s	%f27,	%f26,	%f16
	set	0x64, %o2
	stha	%g2,	[%l7 + %o2] 0x89
	movrlz	%l5,	0x1F8,	%o0
	orn	%g7,	%o2,	%g5
	taddcc	%l4,	%i7,	%o6
	movcc	%xcc,	%g6,	%l0
	srlx	%i2,	0x1D,	%g3
	movrlz	%l1,	0x035,	%o7
	brlez,a	%l6,	loop_1489
	subc	%l2,	%i4,	%o3
	fbg,a	%fcc2,	loop_1490
	movne	%xcc,	%o5,	%i6
loop_1489:
	swap	[%l7 + 0x2C],	%g1
	sth	%i1,	[%l7 + 0x0C]
loop_1490:
	sethi	0x07E5,	%o1
	fcmpne16	%f26,	%f12,	%i3
	movleu	%icc,	%l3,	%i5
	subc	%g4,	0x1332,	%i0
	movgu	%xcc,	%g2,	%l5
	fpadd16	%f4,	%f2,	%f28
	fble	%fcc0,	loop_1491
	tcc	%xcc,	0x5
	bneg,a	%xcc,	loop_1492
	add	%o4,	%g7,	%o2
loop_1491:
	fmovrdgez	%o0,	%f2,	%f2
	fcmpgt16	%f14,	%f30,	%l4
loop_1492:
	edge32l	%g5,	%o6,	%g6
	edge32l	%i7,	%i2,	%l0
	tleu	%icc,	0x3
	fxnor	%f18,	%f4,	%f0
	fmovsneg	%icc,	%f0,	%f18
	andcc	%l1,	%g3,	%o7
	movge	%xcc,	%l6,	%l2
	fpack16	%f2,	%f26
	xorcc	%o3,	%o5,	%i4
	tge	%icc,	0x1
	orncc	%i6,	%g1,	%o1
	nop
	setx loop_1493, %l0, %l1
	jmpl %l1, %i1
	edge16l	%i3,	%l3,	%i5
	fcmpd	%fcc1,	%f16,	%f30
	tpos	%xcc,	0x6
loop_1493:
	nop
	set	0x08, %i1
	swapa	[%l7 + %i1] 0x89,	%g4
	subc	%i0,	%g2,	%o4
	sdiv	%g7,	0x0001,	%l5
	udiv	%o2,	0x008C,	%l4
	addcc	%o0,	%g5,	%g6
	fmovscc	%icc,	%f11,	%f4
	movg	%icc,	%i7,	%o6
	movpos	%xcc,	%i2,	%l0
	prefetch	[%l7 + 0x3C],	 0x1
	wr	%g0,	0x81,	%asi
	ldsha	[%l7 + 0x50] %asi,	%l1
	edge16ln	%g3,	%o7,	%l6
	movneg	%xcc,	%l2,	%o5
	fmovdg	%xcc,	%f15,	%f1
	srax	%o3,	0x14,	%i4
	std	%f8,	[%l7 + 0x18]
	bg,pt	%xcc,	loop_1494
	fmovdleu	%icc,	%f20,	%f11
	fmovsne	%icc,	%f0,	%f4
	edge16	%i6,	%o1,	%i1
loop_1494:
	prefetch	[%l7 + 0x68],	 0x0
	udiv	%i3,	0x1196,	%g1
	movcs	%icc,	%i5,	%g4
	edge16l	%i0,	%g2,	%o4
	array32	%l3,	%l5,	%g7
	fbo	%fcc1,	loop_1495
	andncc	%o2,	%l4,	%o0
	movgu	%icc,	%g5,	%g6
	tg	%icc,	0x0
loop_1495:
	movrlz	%i7,	0x026,	%o6
	movgu	%xcc,	%i2,	%l1
	movle	%xcc,	%g3,	%o7
	fmovdl	%xcc,	%f18,	%f16
	tleu	%xcc,	0x2
	bg	loop_1496
	fmovrsgz	%l6,	%f30,	%f20
	tleu	%xcc,	0x2
	flush	%l7 + 0x2C
loop_1496:
	bleu,a	loop_1497
	edge16l	%l2,	%o5,	%l0
	sdivx	%i4,	0x106B,	%o3
	fpsub16	%f10,	%f26,	%f24
loop_1497:
	xnor	%o1,	0x0E4A,	%i1
	movpos	%icc,	%i3,	%i6
	set	0x7E, %g7
	ldsha	[%l7 + %g7] 0x18,	%g1
	movge	%xcc,	%g4,	%i5
	popc	%g2,	%i0
	addccc	%o4,	0x17E1,	%l5
	umul	%g7,	%o2,	%l3
	fzeros	%f0
	ble,a	loop_1498
	ldstub	[%l7 + 0x15],	%o0
	fmovscc	%xcc,	%f18,	%f13
	movle	%icc,	%l4,	%g6
loop_1498:
	tge	%icc,	0x2
	edge8n	%g5,	%i7,	%o6
	movge	%icc,	%l1,	%g3
	fmovs	%f22,	%f11
	sllx	%i2,	0x1B,	%o7
	taddcc	%l2,	%l6,	%o5
	lduh	[%l7 + 0x3C],	%l0
	tn	%xcc,	0x6
	tneg	%xcc,	0x3
	fmovrde	%o3,	%f0,	%f14
	ta	%icc,	0x0
	movneg	%xcc,	%o1,	%i4
	mulx	%i1,	%i3,	%i6
	fbl,a	%fcc1,	loop_1499
	fmovsl	%icc,	%f12,	%f23
	fmovrdlz	%g1,	%f22,	%f30
	fblg,a	%fcc1,	loop_1500
loop_1499:
	fpsub32s	%f28,	%f28,	%f9
	edge16ln	%g4,	%i5,	%g2
	sdiv	%i0,	0x12DC,	%l5
loop_1500:
	fmovsge	%xcc,	%f9,	%f4
	movcc	%icc,	%g7,	%o4
	fbul,a	%fcc0,	loop_1501
	fmuld8sux16	%f17,	%f11,	%f10
	sub	%l3,	0x1F74,	%o0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1501:
	andn	%o2,	%l4,	%g6
	edge16n	%i7,	%g5,	%o6
	movg	%xcc,	%l1,	%i2
	wr	%g0,	0x0c,	%asi
	stda	%g2,	[%l7 + 0x20] %asi
	tvs	%xcc,	0x5
	array16	%l2,	%o7,	%l6
	udiv	%l0,	0x1ACE,	%o3
	bshuffle	%f8,	%f24,	%f16
	call	loop_1502
	movrgz	%o5,	%i4,	%i1
	array16	%i3,	%i6,	%o1
	srlx	%g1,	%i5,	%g2
loop_1502:
	nop
	set	0x40, %i0
	stda	%f0,	[%l7 + %i0] 0xf1
	membar	#Sync
	fmovdle	%xcc,	%f1,	%f21
	bgu,a,pt	%xcc,	loop_1503
	tgu	%xcc,	0x2
	movvs	%xcc,	%i0,	%g4
	array16	%l5,	%o4,	%g7
loop_1503:
	array8	%o0,	%o2,	%l3
	tsubcctv	%g6,	%i7,	%g5
	fmovdg	%xcc,	%f10,	%f13
	wr	%g0,	0x89,	%asi
	swapa	[%l7 + 0x54] %asi,	%o6
	add	%l7,	0x5C,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] %asi,	%l1,	%l4
	lduh	[%l7 + 0x72],	%g3
	fbue,a	%fcc1,	loop_1504
	edge16	%l2,	%o7,	%i2
	movcc	%icc,	%l0,	%l6
	fmovsn	%icc,	%f1,	%f0
loop_1504:
	sub	%o5,	%i4,	%i1
	edge32	%i3,	%i6,	%o1
	wr	%g0,	0x89,	%asi
	sta	%f18,	[%l7 + 0x7C] %asi
	fmovdge	%xcc,	%f4,	%f28
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tneg	%icc,	0x3
	brz,a	%g1,	loop_1505
	fbul,a	%fcc1,	loop_1506
	membar	0x3C
	addcc	%o3,	0x149F,	%i5
loop_1505:
	nop
	setx	loop_1507,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_1506:
	edge32	%g2,	%g4,	%i0
	ldd	[%l7 + 0x08],	%f24
	fcmpeq16	%f6,	%f2,	%l5
loop_1507:
	movgu	%xcc,	%o4,	%o0
	fpack32	%f28,	%f14,	%f24
	move	%xcc,	%o2,	%g7
	orn	%l3,	%i7,	%g5
	movneg	%xcc,	%g6,	%o6
	fabsd	%f14,	%f14
	sll	%l1,	%g3,	%l2
	fmovrdlz	%l4,	%f30,	%f14
	smul	%o7,	0x0ACB,	%l0
	sub	%i2,	%l6,	%i4
	tvs	%icc,	0x7
	andcc	%i1,	0x1CAA,	%i3
	ld	[%l7 + 0x7C],	%f20
	andn	%o5,	0x076E,	%o1
	movg	%icc,	%i6,	%g1
	fcmpes	%fcc0,	%f26,	%f18
	nop
	setx	loop_1508,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	andcc	%o3,	%i5,	%g4
	udiv	%g2,	0x0207,	%i0
	fcmpes	%fcc0,	%f27,	%f13
loop_1508:
	nop
	wr	%g0,	0x04,	%asi
	ldswa	[%l7 + 0x18] %asi,	%l5
	sir	0x0B23
	movrlez	%o0,	0x2B5,	%o2
	ba,a,pt	%xcc,	loop_1509
	array32	%o4,	%g7,	%l3
	fpsub16s	%f24,	%f1,	%f5
	bg,a	loop_1510
loop_1509:
	andcc	%i7,	0x18FC,	%g5
	fbule	%fcc2,	loop_1511
	fbl	%fcc0,	loop_1512
loop_1510:
	brlez	%g6,	loop_1513
	movge	%icc,	%o6,	%l1
loop_1511:
	fxor	%f18,	%f28,	%f16
loop_1512:
	movcc	%xcc,	%l2,	%l4
loop_1513:
	fmovsvc	%icc,	%f8,	%f10
	mulscc	%g3,	0x031F,	%o7
	wr	%g0,	0x0c,	%asi
	lduwa	[%l7 + 0x20] %asi,	%i2
	movrne	%l6,	0x32D,	%i4
	wr	%g0,	0x80,	%asi
	stda	%l0,	[%l7 + 0x58] %asi
	set	0x78, %i4
	ldxa	[%l7 + %i4] 0x04,	%i3
	edge16n	%o5,	%o1,	%i6
	fmovdvc	%icc,	%f30,	%f30
	edge32n	%g1,	%o3,	%i1
	nop
	set	0x08, %l5
	std	%i4,	[%l7 + %l5]
	fsrc2s	%f29,	%f3
	tsubcc	%g2,	0x1454,	%g4
	fmovdne	%icc,	%f6,	%f4
	add	%i0,	0x1F46,	%o0
	edge32l	%o2,	%l5,	%g7
	fmovrdgez	%l3,	%f10,	%f8
	edge16ln	%o4,	%g5,	%i7
	fbn	%fcc0,	loop_1514
	bcc,pn	%xcc,	loop_1515
	brz,a	%o6,	loop_1516
	sdivx	%l1,	0x074A,	%l2
loop_1514:
	smulcc	%g6,	%g3,	%l4
loop_1515:
	movl	%xcc,	%i2,	%o7
loop_1516:
	sth	%l6,	[%l7 + 0x38]
	tvs	%xcc,	0x2
	bshuffle	%f12,	%f22,	%f20
	movrgz	%i4,	0x215,	%i3
	orncc	%l0,	%o5,	%o1
	smulcc	%i6,	0x1D2E,	%g1
	fandnot2s	%f22,	%f15,	%f16
	nop
	set	0x78, %i7
	std	%f6,	[%l7 + %i7]
	fmovsgu	%icc,	%f7,	%f30
	movn	%icc,	%i1,	%i5
	fnot2	%f2,	%f10
	tcs	%icc,	0x0
	set	0x25, %i2
	ldsba	[%l7 + %i2] 0x11,	%o3
	ta	%xcc,	0x5
	movrlz	%g4,	0x136,	%i0
	fmovsgu	%icc,	%f15,	%f26
	addccc	%g2,	%o2,	%l5
	edge8n	%o0,	%l3,	%g7
	te	%icc,	0x2
	sir	0x182B
	fmovdge	%icc,	%f28,	%f11
	edge32n	%o4,	%g5,	%o6
	fcmped	%fcc1,	%f26,	%f30
	xnorcc	%l1,	0x1E7B,	%i7
	set	0x45, %i5
	lduba	[%l7 + %i5] 0x80,	%g6
	xnorcc	%l2,	%g3,	%i2
	fmuld8sux16	%f19,	%f16,	%f24
	fble,a	%fcc0,	loop_1517
	bvc	%icc,	loop_1518
	popc	%o7,	%l4
	fxnors	%f13,	%f16,	%f1
loop_1517:
	fba,a	%fcc3,	loop_1519
loop_1518:
	and	%l6,	%i3,	%i4
	sdiv	%l0,	0x164C,	%o1
	ble,pt	%xcc,	loop_1520
loop_1519:
	sdivcc	%i6,	0x1215,	%g1
	edge16ln	%o5,	%i5,	%o3
	brnz	%g4,	loop_1521
loop_1520:
	addc	%i1,	%i0,	%o2
	set	0x5D, %l6
	ldstuba	[%l7 + %l6] 0x81,	%g2
loop_1521:
	fmuld8ulx16	%f0,	%f7,	%f16
	brgez,a	%l5,	loop_1522
	fmovda	%icc,	%f29,	%f2
	tpos	%xcc,	0x3
	std	%o0,	[%l7 + 0x60]
loop_1522:
	fnegd	%f20,	%f28
	popc	0x062C,	%g7
	fsrc1	%f14,	%f6
	srax	%l3,	%o4,	%g5
	fmovrslz	%o6,	%f30,	%f5
	movcs	%xcc,	%l1,	%g6
	udivx	%i7,	0x15AB,	%g3
	movl	%xcc,	%i2,	%o7
	edge32l	%l4,	%l6,	%l2
	fbl,a	%fcc2,	loop_1523
	movrne	%i4,	%i3,	%l0
	fmovdcc	%icc,	%f0,	%f12
	movn	%icc,	%i6,	%o1
loop_1523:
	fandnot2s	%f10,	%f1,	%f23
	fmul8x16al	%f31,	%f5,	%f22
	fabsd	%f30,	%f6
	fmuld8ulx16	%f4,	%f16,	%f16
	set	0x68, %g1
	swapa	[%l7 + %g1] 0x10,	%o5
	movrne	%i5,	0x332,	%o3
	sdivx	%g1,	0x1F48,	%i1
	mulscc	%g4,	0x02FE,	%i0
	movrgez	%g2,	%l5,	%o2
	sdiv	%g7,	0x19B5,	%l3
	brgz,a	%o4,	loop_1524
	fpack32	%f2,	%f14,	%f6
	ldub	[%l7 + 0x1B],	%o0
	ble,a	loop_1525
loop_1524:
	fands	%f27,	%f27,	%f6
	xorcc	%g5,	0x053F,	%o6
	movrne	%g6,	0x1F5,	%l1
loop_1525:
	sth	%g3,	[%l7 + 0x2E]
	bge,a	loop_1526
	edge8l	%i7,	%o7,	%l4
	fcmpeq16	%f22,	%f28,	%i2
	ldsb	[%l7 + 0x76],	%l6
loop_1526:
	movn	%icc,	%i4,	%l2
	tgu	%icc,	0x0
	brlez,a	%l0,	loop_1527
	movn	%icc,	%i6,	%o1
	taddcc	%i3,	0x16FE,	%o5
	fmul8sux16	%f22,	%f22,	%f2
loop_1527:
	movcc	%xcc,	%i5,	%o3
	sdiv	%g1,	0x1614,	%g4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbule,a	%fcc3,	loop_1528
	movleu	%icc,	%i0,	%g2
	xnorcc	%i1,	%o2,	%l5
	srl	%g7,	%l3,	%o4
loop_1528:
	tpos	%icc,	0x4
	fbu,a	%fcc0,	loop_1529
	sdivx	%g5,	0x0C35,	%o6
	fbe,a	%fcc0,	loop_1530
	tn	%icc,	0x0
loop_1529:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovd	%f10,	%f30
loop_1530:
	movg	%icc,	%o0,	%l1
	movcc	%xcc,	%g6,	%i7
	membar	0x71
	stb	%o7,	[%l7 + 0x77]
	mulx	%g3,	0x0409,	%l4
	tsubcctv	%i2,	0x12C3,	%i4
	movrlz	%l2,	0x282,	%l0
	bneg,pn	%icc,	loop_1531
	movrne	%i6,	0x26F,	%o1
	fornot2	%f12,	%f16,	%f2
	set	0x2F, %g4
	ldstuba	[%l7 + %g4] 0x11,	%i3
loop_1531:
	mova	%icc,	%l6,	%o5
	edge16	%i5,	%o3,	%g4
	addcc	%g1,	%g2,	%i0
	edge8	%o2,	%l5,	%g7
	ldsb	[%l7 + 0x6A],	%i1
	srl	%o4,	%l3,	%o6
	movre	%o0,	%l1,	%g6
	set	0x38, %o3
	lduwa	[%l7 + %o3] 0x04,	%i7
	set	0x11, %o1
	stba	%o7,	[%l7 + %o1] 0x23
	membar	#Sync
	edge32	%g3,	%l4,	%g5
	set	0x108, %i3
	ldxa	[%g0 + %i3] 0x21,	%i4
	fnot1	%f0,	%f14
	fcmpeq16	%f18,	%f4,	%i2
	fnot1	%f26,	%f30
	wr	%g0,	0x88,	%asi
	prefetcha	[%l7 + 0x70] %asi,	 0x1
	bn,pn	%xcc,	loop_1532
	srlx	%l0,	0x11,	%o1
	edge8l	%i3,	%i6,	%o5
	fornot2s	%f30,	%f6,	%f1
loop_1532:
	nop
	wr	%g0,	0x89,	%asi
	ldxa	[%l7 + 0x60] %asi,	%l6
	tg	%xcc,	0x7
	fpadd16	%f16,	%f20,	%f4
	edge8	%o3,	%g4,	%g1
	fnors	%f31,	%f5,	%f14
	edge32n	%g2,	%i0,	%i5
	movrne	%l5,	%g7,	%o2
	andncc	%i1,	%o4,	%l3
	orcc	%o0,	%o6,	%l1
	set	0x50, %o5
	ldswa	[%l7 + %o5] 0x89,	%i7
	bcc,pn	%icc,	loop_1533
	sll	%o7,	0x1B,	%g3
	movrgz	%g6,	%l4,	%g5
	pdist	%f0,	%f28,	%f14
loop_1533:
	nop
	set	0x3E, %g5
	ldsha	[%l7 + %g5] 0x80,	%i4
	or	%l2,	0x1C72,	%i2
	fmovsvs	%xcc,	%f12,	%f8
	movneg	%xcc,	%l0,	%i3
	fbge,a	%fcc1,	loop_1534
	smul	%o1,	0x1B0B,	%o5
	nop
	set	0x64, %g2
	sth	%l6,	[%l7 + %g2]
	bcs	loop_1535
loop_1534:
	edge16l	%o3,	%g4,	%i6
	array8	%g1,	%g2,	%i0
	orn	%i5,	%l5,	%o2
loop_1535:
	alignaddr	%i1,	%o4,	%g7
	stb	%o0,	[%l7 + 0x51]
	st	%f18,	[%l7 + 0x10]
	bne,a	loop_1536
	popc	0x1F41,	%o6
	tsubcctv	%l1,	0x1561,	%i7
	movn	%icc,	%l3,	%g3
loop_1536:
	fmovrdlez	%g6,	%f20,	%f30
	udivx	%l4,	0x07FE,	%g5
	orn	%o7,	%l2,	%i4
	brlz	%l0,	loop_1537
	movl	%xcc,	%i3,	%i2
	orn	%o5,	%l6,	%o3
	be,pt	%icc,	loop_1538
loop_1537:
	ldsh	[%l7 + 0x76],	%g4
	wr	%g0,	0x81,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
loop_1538:
	movvs	%icc,	%i6,	%o1
	fmovda	%xcc,	%f3,	%f10
	set	0x50, %o0
	stxa	%g1,	[%l7 + %o0] 0x2b
	membar	#Sync
	prefetch	[%l7 + 0x2C],	 0x2
	tl	%icc,	0x6
	fmovdn	%xcc,	%f25,	%f16
	movrlez	%i0,	%i5,	%g2
	tge	%icc,	0x6
	wr	%g0,	0x58,	%asi
	ldxa	[%g0 + 0x0] %asi,	%l5
	subc	%i1,	%o2,	%o4
	bgu,a,pn	%xcc,	loop_1539
	movrgz	%o0,	%o6,	%g7
	faligndata	%f14,	%f16,	%f22
	bn,a	loop_1540
loop_1539:
	fpsub16	%f24,	%f0,	%f2
	tneg	%icc,	0x3
	fbe,a	%fcc2,	loop_1541
loop_1540:
	nop
	setx loop_1542, %l0, %l1
	jmpl %l1, %l1
	brlez,a	%l3,	loop_1543
	tne	%icc,	0x5
loop_1541:
	orcc	%g3,	0x1AFD,	%i7
loop_1542:
	fmovd	%f2,	%f22
loop_1543:
	sub	%g6,	0x0828,	%l4
	xnorcc	%o7,	%g5,	%l2
	ta	%xcc,	0x3
	movcc	%icc,	%i4,	%l0
	fpadd32	%f16,	%f28,	%f28
	taddcctv	%i2,	%i3,	%l6
	fandnot1s	%f14,	%f17,	%f20
	wr	%g0,	0x81,	%asi
	ldstuba	[%l7 + 0x47] %asi,	%o5
	edge16n	%g4,	%i6,	%o3
	tn	%icc,	0x6
	be,a	%icc,	loop_1544
	fmovsa	%icc,	%f16,	%f6
	edge32ln	%g1,	%i0,	%i5
	fmovsne	%xcc,	%f26,	%f29
loop_1544:
	array8	%o1,	%g2,	%l5
	bcc,a	%xcc,	loop_1545
	fmovscs	%icc,	%f1,	%f21
	xor	%i1,	0x171A,	%o2
	ldx	[%l7 + 0x10],	%o4
loop_1545:
	membar	0x7A
	movle	%icc,	%o0,	%g7
	fors	%f8,	%f21,	%f19
	ldx	[%l7 + 0x40],	%o6
	tg	%icc,	0x5
	subc	%l1,	%g3,	%i7
	fmuld8sux16	%f30,	%f24,	%f4
	wr	%g0,	0xe3,	%asi
	stda	%g6,	[%l7 + 0x10] %asi
	membar	#Sync
	add	%l7,	0x28,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%l3,	%l4
	sdivcc	%o7,	0x1894,	%g5
	tleu	%icc,	0x1
	fnot2	%f14,	%f24
	fcmps	%fcc3,	%f13,	%f3
	movgu	%xcc,	%i4,	%l0
	tleu	%icc,	0x2
	fmovdvc	%xcc,	%f6,	%f29
	fmovscs	%xcc,	%f1,	%f3
	ldd	[%l7 + 0x70],	%f24
	andn	%l2,	0x09CB,	%i2
	fbl,a	%fcc3,	loop_1546
	stw	%i3,	[%l7 + 0x1C]
	prefetch	[%l7 + 0x48],	 0x1
	ldsb	[%l7 + 0x3D],	%l6
loop_1546:
	udivcc	%g4,	0x0D32,	%o5
	tpos	%xcc,	0x0
	tvc	%xcc,	0x5
	orcc	%i6,	%g1,	%o3
	alignaddrl	%i0,	%o1,	%i5
	sdivx	%l5,	0x054E,	%i1
	fmovdl	%icc,	%f22,	%f15
	set	0x60, %l2
	ldxa	[%l7 + %l2] 0x14,	%g2
	fmovrdne	%o2,	%f4,	%f28
	movleu	%icc,	%o0,	%o4
	tl	%icc,	0x2
	sdivcc	%g7,	0x1482,	%l1
	fcmple16	%f22,	%f18,	%g3
	addccc	%i7,	%g6,	%l3
	ldsb	[%l7 + 0x60],	%o6
	add	%l4,	%o7,	%g5
	fmul8x16	%f9,	%f18,	%f24
	taddcctv	%l0,	0x1E75,	%i4
	set	0x44, %l0
	ldsha	[%l7 + %l0] 0x18,	%i2
	sdivcc	%i3,	0x0070,	%l2
	bshuffle	%f16,	%f16,	%f28
	srlx	%g4,	0x0B,	%o5
	brz	%i6,	loop_1547
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbue,a	%fcc1,	loop_1548
	and	%g1,	0x14AF,	%l6
loop_1547:
	smul	%o3,	0x0906,	%o1
	fabss	%f0,	%f9
loop_1548:
	movrlz	%i0,	%i5,	%l5
	set	0x0A, %g3
	stha	%i1,	[%l7 + %g3] 0x27
	membar	#Sync
	edge8ln	%o2,	%g2,	%o0
	fxnor	%f0,	%f12,	%f26
	sdivx	%g7,	0x18DB,	%o4
	fble	%fcc3,	loop_1549
	tsubcc	%l1,	%i7,	%g6
	fmovrdgez	%g3,	%f22,	%f12
	fmovs	%f2,	%f6
loop_1549:
	fnegd	%f30,	%f10
	tcs	%icc,	0x4
	wr	%g0,	0x19,	%asi
	lda	[%l7 + 0x0C] %asi,	%f26
	fbuge	%fcc1,	loop_1550
	add	%l3,	0x18BA,	%o6
	nop
	setx	loop_1551,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	ldstub	[%l7 + 0x1F],	%o7
loop_1550:
	addc	%g5,	%l4,	%i4
	move	%xcc,	%l0,	%i2
loop_1551:
	move	%icc,	%i3,	%g4
	udivcc	%l2,	0x167A,	%i6
	smul	%o5,	0x1284,	%l6
	edge8n	%o3,	%o1,	%g1
	fmuld8ulx16	%f17,	%f8,	%f14
	fand	%f30,	%f14,	%f28
	addc	%i0,	0x0491,	%i5
	smul	%i1,	0x0104,	%o2
	for	%f10,	%f28,	%f2
	stx	%l5,	[%l7 + 0x20]
	nop
	setx loop_1552, %l0, %l1
	jmpl %l1, %o0
	udiv	%g2,	0x0C17,	%o4
	movvs	%icc,	%l1,	%i7
	tne	%xcc,	0x0
loop_1552:
	nop
	setx	loop_1553,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	orn	%g7,	0x0B18,	%g3
	smul	%g6,	%o6,	%o7
	edge8ln	%l3,	%g5,	%l4
loop_1553:
	ldx	[%l7 + 0x28],	%i4
	xnorcc	%i2,	%l0,	%i3
	fpack32	%f24,	%f10,	%f10
	fbuge	%fcc2,	loop_1554
	sll	%g4,	0x19,	%l2
	bneg,pt	%xcc,	loop_1555
	fsrc1	%f2,	%f8
loop_1554:
	edge16ln	%i6,	%o5,	%o3
	fmovdvc	%xcc,	%f18,	%f26
loop_1555:
	addccc	%o1,	0x05E4,	%g1
	movn	%xcc,	%i0,	%i5
	bne,a,pn	%icc,	loop_1556
	tgu	%xcc,	0x6
	fba,a	%fcc2,	loop_1557
	std	%i6,	[%l7 + 0x60]
loop_1556:
	mulscc	%i1,	%l5,	%o2
	fmovsa	%xcc,	%f21,	%f6
loop_1557:
	fmovrde	%g2,	%f12,	%f8
	tvc	%icc,	0x3
	bneg,a	%xcc,	loop_1558
	fbule	%fcc3,	loop_1559
	fpsub32s	%f14,	%f7,	%f9
	fmovsg	%xcc,	%f30,	%f30
loop_1558:
	nop
	set	0x7D, %l1
	ldsba	[%l7 + %l1] 0x10,	%o4
loop_1559:
	stb	%o0,	[%l7 + 0x52]
	srlx	%i7,	%l1,	%g7
	ldsh	[%l7 + 0x1E],	%g6
	edge32ln	%g3,	%o6,	%l3
	movre	%g5,	0x182,	%o7
	sethi	0x1145,	%l4
	movvs	%icc,	%i4,	%i2
	edge8	%i3,	%l0,	%l2
	fnot1s	%f10,	%f29
	edge16ln	%i6,	%o5,	%o3
	fbn,a	%fcc0,	loop_1560
	tcc	%icc,	0x0
	fnand	%f16,	%f8,	%f24
	tn	%icc,	0x1
loop_1560:
	orncc	%o1,	0x1EB2,	%g1
	tn	%icc,	0x2
	umulcc	%i0,	0x097F,	%g4
	flush	%l7 + 0x64
	add	%l6,	0x141D,	%i5
	st	%f12,	[%l7 + 0x0C]
	array32	%l5,	%o2,	%i1
	movrgez	%g2,	0x291,	%o4
	movrgez	%i7,	0x032,	%o0
	edge8ln	%l1,	%g6,	%g7
	mulx	%o6,	0x041D,	%g3
	fandnot2s	%f20,	%f11,	%f19
	fornot1	%f16,	%f22,	%f14
	movne	%xcc,	%g5,	%l3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x54, %l3
	stba	%o7,	[%l7 + %l3] 0x19
	movvc	%xcc,	%i4,	%i2
	fbe	%fcc0,	loop_1561
	edge8	%l4,	%l0,	%l2
	edge8ln	%i3,	%i6,	%o5
	tcc	%xcc,	0x6
loop_1561:
	srlx	%o3,	0x01,	%g1
	for	%f30,	%f22,	%f12
	te	%icc,	0x7
	smulcc	%i0,	0x0919,	%g4
	fmovd	%f6,	%f20
	fcmple16	%f22,	%f24,	%l6
	movle	%xcc,	%o1,	%i5
	tl	%icc,	0x6
	flush	%l7 + 0x64
	fbo	%fcc3,	loop_1562
	tleu	%icc,	0x2
	movcc	%icc,	%l5,	%i1
	taddcc	%o2,	%o4,	%i7
loop_1562:
	sdivx	%o0,	0x0D60,	%g2
	taddcc	%l1,	%g7,	%o6
	addc	%g3,	0x099E,	%g5
	edge16	%g6,	%l3,	%o7
	srlx	%i2,	%l4,	%l0
	addccc	%i4,	%i3,	%i6
	mulscc	%o5,	%o3,	%l2
	st	%f8,	[%l7 + 0x1C]
	swap	[%l7 + 0x7C],	%g1
	addcc	%i0,	%g4,	%l6
	tl	%icc,	0x4
	movvs	%xcc,	%o1,	%l5
	andcc	%i5,	0x1F7E,	%i1
	movre	%o2,	0x1C7,	%i7
	andn	%o0,	%g2,	%o4
	orncc	%l1,	%o6,	%g3
	edge16	%g7,	%g6,	%g5
	membar	0x62
	sllx	%o7,	0x1B,	%l3
	fba	%fcc1,	loop_1563
	tl	%xcc,	0x3
	fmovsne	%icc,	%f22,	%f21
	fornot2s	%f17,	%f12,	%f13
loop_1563:
	movpos	%xcc,	%i2,	%l0
	sra	%i4,	0x0A,	%i3
	movrlz	%i6,	0x242,	%o5
	fmovse	%xcc,	%f15,	%f10
	xorcc	%o3,	0x16BB,	%l4
	movcc	%icc,	%l2,	%i0
	srax	%g1,	%l6,	%g4
	tne	%xcc,	0x6
	tle	%icc,	0x0
	tvc	%xcc,	0x4
	movleu	%icc,	%o1,	%i5
	fmovsvs	%icc,	%f9,	%f4
	edge16	%i1,	%l5,	%i7
	srlx	%o0,	%g2,	%o4
	edge8ln	%l1,	%o6,	%g3
	fmovsvc	%xcc,	%f17,	%f16
	andcc	%g7,	%g6,	%o2
	wr	%g0,	0x11,	%asi
	ldstuba	[%l7 + 0x1A] %asi,	%g5
	umulcc	%o7,	%i2,	%l3
	fmovsle	%xcc,	%f2,	%f0
	edge8l	%i4,	%l0,	%i6
	sethi	0x1F26,	%o5
	xnorcc	%o3,	%l4,	%i3
	taddcctv	%i0,	0x16A5,	%g1
	orcc	%l6,	0x0EB7,	%g4
	wr	%g0,	0x18,	%asi
	swapa	[%l7 + 0x64] %asi,	%l2
	edge8l	%i5,	%o1,	%i1
	movrne	%l5,	0x225,	%o0
	fone	%f4
	addccc	%i7,	0x12B1,	%g2
	orn	%l1,	0x0459,	%o4
	movvc	%xcc,	%o6,	%g7
	fxnors	%f26,	%f7,	%f1
	fcmpd	%fcc0,	%f22,	%f24
	xnorcc	%g3,	0x193D,	%g6
	edge8ln	%g5,	%o2,	%o7
	fnegd	%f12,	%f14
	fsrc1	%f4,	%f8
	subcc	%l3,	%i2,	%i4
	set	0x14, %i6
	ldswa	[%l7 + %i6] 0x10,	%i6
	movge	%xcc,	%l0,	%o3
	orncc	%l4,	%o5,	%i3
	fcmpeq16	%f28,	%f2,	%i0
	flush	%l7 + 0x10
	edge8	%g1,	%g4,	%l6
	tleu	%xcc,	0x6
	wr	%g0,	0x88,	%asi
	lduha	[%l7 + 0x4C] %asi,	%l2
	movneg	%icc,	%o1,	%i5
	ldsb	[%l7 + 0x0D],	%l5
	movrgz	%i1,	0x0C1,	%i7
	wr	%g0,	0x0c,	%asi
	sta	%f31,	[%l7 + 0x24] %asi
	wr	%g0,	0x11,	%asi
	sta	%f22,	[%l7 + 0x3C] %asi
	tgu	%xcc,	0x5
	movrgez	%o0,	0x3EA,	%l1
	smulcc	%o4,	0x1857,	%g2
	ldd	[%l7 + 0x08],	%g6
	sethi	0x0518,	%g3
	ta	%xcc,	0x6
	orn	%g6,	%o6,	%o2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fxnors	%f0,	%f25,	%f4
	fbl,a	%fcc3,	loop_1564
	ldsh	[%l7 + 0x34],	%o7
	bneg	%xcc,	loop_1565
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1564:
	array16	%g5,	%l3,	%i4
	fone	%f10
loop_1565:
	brlz	%i2,	loop_1566
	tleu	%icc,	0x5
	bgu,a,pt	%xcc,	loop_1567
	fsrc2	%f14,	%f14
loop_1566:
	fble	%fcc0,	loop_1568
	std	%i6,	[%l7 + 0x38]
loop_1567:
	fexpand	%f3,	%f18
	edge8	%l0,	%l4,	%o5
loop_1568:
	fmuld8ulx16	%f18,	%f6,	%f12
	xor	%i3,	0x03F1,	%i0
	fpsub32	%f2,	%f12,	%f30
	tne	%icc,	0x7
	fcmpgt32	%f24,	%f20,	%o3
	edge32l	%g4,	%l6,	%l2
	alignaddr	%o1,	%i5,	%g1
	movrlz	%l5,	0x27D,	%i7
	brz,a	%i1,	loop_1569
	tle	%icc,	0x6
	faligndata	%f24,	%f20,	%f24
	wr	%g0,	0x80,	%asi
	stha	%o0,	[%l7 + 0x74] %asi
loop_1569:
	fxors	%f21,	%f2,	%f10
	add	%l7,	0x70,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%l1,	%g2
	xnor	%o4,	0x1256,	%g3
	mulx	%g7,	%g6,	%o2
	tneg	%icc,	0x4
	taddcc	%o7,	%o6,	%g5
	addcc	%l3,	0x06A8,	%i2
	set	0x60, %o7
	ldsha	[%l7 + %o7] 0x80,	%i4
	fbuge,a	%fcc1,	loop_1570
	tgu	%icc,	0x3
	bge,a	%icc,	loop_1571
	fbug,a	%fcc3,	loop_1572
loop_1570:
	tge	%xcc,	0x7
	edge8n	%i6,	%l4,	%l0
loop_1571:
	brgez	%o5,	loop_1573
loop_1572:
	addcc	%i0,	0x09BF,	%o3
	wr	%g0,	0x04,	%asi
	stha	%i3,	[%l7 + 0x08] %asi
loop_1573:
	flush	%l7 + 0x0C
	brnz	%g4,	loop_1574
	fcmpgt16	%f14,	%f20,	%l2
	udivx	%o1,	0x07D9,	%l6
	smulcc	%g1,	0x08E8,	%l5
loop_1574:
	taddcc	%i7,	%i1,	%o0
	move	%xcc,	%l1,	%g2
	fmovsleu	%icc,	%f4,	%f7
	sir	0x113F
	brlz	%o4,	loop_1575
	edge8l	%i5,	%g3,	%g6
	sub	%o2,	%g7,	%o6
	andn	%g5,	0x026A,	%o7
loop_1575:
	movvc	%icc,	%l3,	%i4
	andcc	%i6,	%i2,	%l0
	fmovdcc	%xcc,	%f10,	%f4
	edge16l	%l4,	%i0,	%o3
	edge16	%i3,	%g4,	%l2
	fnot1s	%f0,	%f2
	fandnot1	%f26,	%f10,	%f16
	srax	%o1,	0x1C,	%l6
	array32	%o5,	%l5,	%i7
	ldstub	[%l7 + 0x5A],	%i1
	xnorcc	%o0,	%l1,	%g2
	fmul8x16	%f7,	%f14,	%f6
	tvc	%icc,	0x1
	tl	%xcc,	0x4
	sub	%o4,	0x059B,	%i5
	umul	%g3,	0x1BC9,	%g1
	sir	0x1DEF
	edge32	%o2,	%g7,	%o6
	add	%g6,	0x00BD,	%g5
	xnorcc	%l3,	%i4,	%o7
	orcc	%i2,	0x183E,	%l0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addcc	%i6,	0x0D58,	%l4
	add	%o3,	%i0,	%g4
	bgu,a	%xcc,	loop_1576
	edge32n	%i3,	%o1,	%l2
	brlez	%o5,	loop_1577
	tleu	%xcc,	0x2
loop_1576:
	fmovsa	%icc,	%f29,	%f30
	fbue	%fcc0,	loop_1578
loop_1577:
	fmovrsne	%l5,	%f31,	%f18
	movneg	%xcc,	%i7,	%i1
	fbu,a	%fcc1,	loop_1579
loop_1578:
	movcc	%icc,	%l6,	%o0
	std	%g2,	[%l7 + 0x18]
	movvs	%xcc,	%o4,	%l1
loop_1579:
	ba,a,pn	%icc,	loop_1580
	movpos	%icc,	%g3,	%g1
	bneg,a	%xcc,	loop_1581
	umulcc	%o2,	%i5,	%g7
loop_1580:
	smul	%o6,	%g6,	%g5
	fnors	%f22,	%f1,	%f23
loop_1581:
	fbule	%fcc1,	loop_1582
	movne	%xcc,	%l3,	%i4
	add	%l7,	0x58,	%l6
	wr	%g0,	0x10,	%asi
	casxa	[%l6] %asi,	%o7,	%i2
loop_1582:
	udivx	%l0,	0x0731,	%i6
	fmovrdlz	%o3,	%f16,	%f20
	fcmpgt32	%f26,	%f2,	%i0
	tge	%xcc,	0x6
	fpsub32	%f2,	%f18,	%f14
	fbul,a	%fcc3,	loop_1583
	edge32l	%g4,	%l4,	%o1
	ldstub	[%l7 + 0x63],	%i3
	tsubcctv	%l2,	%o5,	%i7
loop_1583:
	movne	%icc,	%l5,	%l6
	movcs	%icc,	%i1,	%g2
	umulcc	%o4,	%l1,	%g3
	bge,pt	%icc,	loop_1584
	movvs	%icc,	%g1,	%o0
	movrgez	%i5,	0x19A,	%o2
	fcmpd	%fcc0,	%f6,	%f26
loop_1584:
	sub	%g7,	%g6,	%o6
	tvs	%xcc,	0x2
	lduw	[%l7 + 0x30],	%l3
	tg	%icc,	0x1
	andn	%g5,	%i4,	%o7
	movrlz	%i2,	0x02F,	%l0
	tgu	%icc,	0x3
	fzero	%f4
	edge8	%o3,	%i0,	%g4
	for	%f20,	%f22,	%f30
	brgez,a	%i6,	loop_1585
	ldub	[%l7 + 0x1F],	%o1
	fpadd16s	%f18,	%f22,	%f2
	fmovrsgez	%i3,	%f1,	%f28
loop_1585:
	membar	0x48
	sdivcc	%l2,	0x07F9,	%o5
	wr	%g0,	0x50,	%asi
	ldxa	[%g0 + 0x00] %asi,	%i7
	movneg	%xcc,	%l5,	%l4
	wr	%g0,	0xe3,	%asi
	stxa	%l6,	[%l7 + 0x58] %asi
	membar	#Sync
	sdivx	%g2,	0x0769,	%i1
	fmovdle	%xcc,	%f18,	%f19
	move	%icc,	%l1,	%o4
	tl	%xcc,	0x1
	add	%l7,	0x10,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] %asi,	%g1,	%o0
	fmovdl	%icc,	%f13,	%f10
	movvc	%xcc,	%g3,	%i5
	tn	%xcc,	0x2
	fmovdgu	%xcc,	%f31,	%f8
	xnorcc	%o2,	0x07B9,	%g7
	fble,a	%fcc0,	loop_1586
	tl	%xcc,	0x1
	tg	%icc,	0x4
	sdivcc	%g6,	0x09BE,	%o6
loop_1586:
	nop
	wr	%g0,	0x20,	%asi
	stxa	%g5,	[%g0 + 0x30] %asi
	edge8l	%l3,	%i4,	%o7
	udiv	%i2,	0x1266,	%o3
	orn	%l0,	0x0C8F,	%g4
	movpos	%xcc,	%i6,	%i0
	sir	0x15F2
	wr	%g0,	0x80,	%asi
	ldswa	[%l7 + 0x6C] %asi,	%i3
	fmovdn	%xcc,	%f24,	%f17
	mulx	%l2,	%o5,	%i7
	fbl	%fcc1,	loop_1587
	fand	%f24,	%f0,	%f0
	fornot1s	%f7,	%f11,	%f29
	tneg	%xcc,	0x0
loop_1587:
	tpos	%xcc,	0x1
	fmovsa	%icc,	%f30,	%f15
	nop
	set	0x28, %o6
	prefetch	[%l7 + %o6],	 0x1
	fbu,a	%fcc1,	loop_1588
	stw	%l5,	[%l7 + 0x40]
	subccc	%o1,	%l4,	%g2
	fornot2	%f28,	%f12,	%f22
loop_1588:
	swap	[%l7 + 0x74],	%i1
	fmovrde	%l1,	%f18,	%f14
	movcs	%icc,	%l6,	%g1
	fone	%f24
	tne	%icc,	0x5
	srlx	%o4,	0x1D,	%g3
	swap	[%l7 + 0x28],	%o0
	movvc	%xcc,	%o2,	%i5
	movrgez	%g7,	%g6,	%g5
	sethi	0x0473,	%o6
	xorcc	%i4,	%o7,	%l3
	umul	%i2,	0x0D24,	%l0
	tsubcc	%g4,	0x00A3,	%i6
	xnor	%o3,	0x1A60,	%i0
	bvc,pn	%xcc,	loop_1589
	brnz	%i3,	loop_1590
	movpos	%icc,	%o5,	%l2
	ldx	[%l7 + 0x78],	%l5
loop_1589:
	fmovsleu	%icc,	%f16,	%f9
loop_1590:
	fbl	%fcc0,	loop_1591
	bcs,a	loop_1592
	sethi	0x1D62,	%o1
	tcs	%icc,	0x7
loop_1591:
	nop
	wr	%g0,	0x5f,	%asi
	stxa	%l4,	[%g0 + 0x0] %asi
loop_1592:
	edge16	%g2,	%i1,	%i7
	bgu,a	%xcc,	loop_1593
	array32	%l6,	%l1,	%o4
	fbu	%fcc2,	loop_1594
	fbul	%fcc1,	loop_1595
loop_1593:
	edge32l	%g1,	%o0,	%g3
	movrne	%i5,	%g7,	%o2
loop_1594:
	nop
	set	0x50, %g6
	ldda	[%l7 + %g6] 0x2c,	%g6
loop_1595:
	subc	%g5,	0x00BF,	%o6
	taddcc	%o7,	0x11A0,	%l3
	fxors	%f12,	%f21,	%f0
	bcs	%xcc,	loop_1596
	tsubcctv	%i2,	%i4,	%l0
	edge32n	%i6,	%o3,	%g4
	fmovsne	%xcc,	%f28,	%f10
loop_1596:
	fpsub16s	%f27,	%f30,	%f17
	taddcctv	%i0,	%o5,	%i3
	fmovdcc	%xcc,	%f8,	%f11
	std	%f4,	[%l7 + 0x38]
	fmovrslz	%l2,	%f17,	%f14
	edge8	%o1,	%l4,	%l5
	movge	%icc,	%i1,	%g2
	bl,a	%icc,	loop_1597
	brlez	%i7,	loop_1598
	tvs	%icc,	0x6
	movl	%icc,	%l1,	%l6
loop_1597:
	sll	%o4,	%o0,	%g1
loop_1598:
	tvs	%xcc,	0x4
	edge32ln	%g3,	%g7,	%i5
	wr	%g0,	0x04,	%asi
	lduha	[%l7 + 0x4E] %asi,	%g6
	ldsb	[%l7 + 0x48],	%g5
	fmovsl	%xcc,	%f5,	%f6
	tge	%xcc,	0x2
	ldub	[%l7 + 0x30],	%o2
	fnors	%f19,	%f29,	%f12
	fbu	%fcc0,	loop_1599
	bleu	loop_1600
	array8	%o7,	%o6,	%i2
	ldub	[%l7 + 0x71],	%l3
loop_1599:
	brgz,a	%l0,	loop_1601
loop_1600:
	fbule,a	%fcc2,	loop_1602
	ldsw	[%l7 + 0x38],	%i4
	umulcc	%o3,	0x1D7A,	%g4
loop_1601:
	movcc	%icc,	%i0,	%i6
loop_1602:
	tvc	%icc,	0x1
	sdivx	%i3,	0x0A3B,	%l2
	set	0x40, %o4
	stda	%f16,	[%l7 + %o4] 0xf0
	membar	#Sync
	fmovrsgz	%o5,	%f15,	%f25
	fmovdvc	%xcc,	%f13,	%f17
	movl	%xcc,	%l4,	%o1
	add	%l7,	0x0C,	%l6
	wr	%g0,	0x04,	%asi
	casa	[%l6] 0x04,	%l5,	%i1
	movrgz	%g2,	0x286,	%i7
	srax	%l1,	%o4,	%o0
	wr	%g0,	0x80,	%asi
	lduha	[%l7 + 0x72] %asi,	%g1
	fmul8ulx16	%f4,	%f16,	%f30
	movrlez	%l6,	0x26E,	%g3
	subcc	%g7,	0x0F46,	%i5
	tl	%xcc,	0x1
	srlx	%g5,	%o2,	%o7
	and	%g6,	0x152B,	%o6
	te	%icc,	0x2
	movg	%xcc,	%l3,	%l0
	tcc	%xcc,	0x0
	movleu	%xcc,	%i2,	%i4
	ldsw	[%l7 + 0x48],	%g4
	smulcc	%i0,	%i6,	%i3
	fnegd	%f10,	%f4
	tvc	%xcc,	0x7
	fmovrslz	%o3,	%f9,	%f8
	fmovscc	%icc,	%f7,	%f10
	tvs	%icc,	0x3
	tl	%xcc,	0x1
	udivx	%l2,	0x1F21,	%l4
	fmovdn	%xcc,	%f19,	%f22
	fandnot1	%f8,	%f6,	%f14
	popc	%o5,	%o1
	fmovrdne	%i1,	%f24,	%f30
	movl	%xcc,	%l5,	%g2
	set	0x60, %o2
	lduwa	[%l7 + %o2] 0x0c,	%i7
	movrlez	%o4,	0x053,	%o0
	fzeros	%f6
	fmovdpos	%icc,	%f29,	%f8
	ldd	[%l7 + 0x28],	%g0
	fpsub16s	%f7,	%f31,	%f1
	addc	%l6,	0x0301,	%l1
	taddcctv	%g3,	0x08F4,	%i5
	fsrc2s	%f20,	%f28
	te	%icc,	0x6
	fnegd	%f10,	%f28
	array8	%g5,	%o2,	%o7
	array8	%g6,	%g7,	%o6
	sir	0x1D22
	fble	%fcc2,	loop_1603
	udiv	%l3,	0x1C0D,	%i2
	fmul8x16	%f28,	%f0,	%f8
	tvs	%xcc,	0x4
loop_1603:
	nop
	set	0x34, %l4
	stwa	%i4,	[%l7 + %l4] 0x23
	membar	#Sync
	sdivx	%l0,	0x156B,	%g4
	set	0x5E, %i1
	ldsha	[%l7 + %i1] 0x80,	%i0
	addc	%i3,	%i6,	%l2
	subc	%o3,	%l4,	%o5
	sth	%i1,	[%l7 + 0x5E]
	and	%l5,	0x1EE6,	%o1
	andcc	%i7,	%o4,	%o0
	bpos	%icc,	loop_1604
	sra	%g1,	0x0F,	%l6
	tsubcc	%l1,	%g2,	%g3
	tgu	%icc,	0x1
loop_1604:
	flush	%l7 + 0x08
	edge32ln	%g5,	%o2,	%i5
	fcmped	%fcc2,	%f2,	%f16
	pdist	%f20,	%f16,	%f18
	nop
	setx loop_1605, %l0, %l1
	jmpl %l1, %o7
	sll	%g6,	0x04,	%g7
	sra	%o6,	0x04,	%i2
	umulcc	%i4,	0x08E2,	%l0
loop_1605:
	movl	%icc,	%g4,	%i0
	fmovsvs	%icc,	%f17,	%f1
	bn,a,pn	%xcc,	loop_1606
	bl,a,pt	%icc,	loop_1607
	subc	%i3,	0x0266,	%i6
	fsrc2s	%f13,	%f23
loop_1606:
	ba,a,pt	%xcc,	loop_1608
loop_1607:
	movne	%icc,	%l3,	%o3
	add	%l7,	0x18,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] %asi,	%l2,	%o5
loop_1608:
	udiv	%l4,	0x0D4C,	%i1
	fcmpne32	%f30,	%f6,	%o1
	fmovdg	%icc,	%f23,	%f30
	sub	%i7,	%l5,	%o0
	wr	%g0,	0x80,	%asi
	ldxa	[%l7 + 0x50] %asi,	%o4
	movneg	%icc,	%l6,	%l1
	be,a,pt	%icc,	loop_1609
	movn	%xcc,	%g1,	%g2
	popc	%g5,	%o2
	tsubcc	%i5,	0x185E,	%g3
loop_1609:
	call	loop_1610
	move	%icc,	%o7,	%g7
	nop
	setx loop_1611, %l0, %l1
	jmpl %l1, %o6
	movn	%xcc,	%i2,	%i4
loop_1610:
	nop
	set	0x54, %g7
	lduw	[%l7 + %g7],	%g6
	tsubcctv	%l0,	%i0,	%g4
loop_1611:
	fsrc2s	%f12,	%f29
	add	%l7,	0x50,	%l6
	wr	%g0,	0x0c,	%asi
	casxa	[%l6] 0x0c,	%i6,	%i3
	brlz,a	%o3,	loop_1612
	nop
	setx	loop_1613,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	array32	%l3,	%l2,	%l4
	bgu,a,pn	%icc,	loop_1614
loop_1612:
	fmovspos	%xcc,	%f5,	%f20
loop_1613:
	bpos	%xcc,	loop_1615
	subccc	%o5,	0x09B3,	%o1
loop_1614:
	nop
	wr	%g0,	0x80,	%asi
	lduha	[%l7 + 0x16] %asi,	%i1
loop_1615:
	nop
	set	0x10, %i0
	ldda	[%l7 + %i0] 0x24,	%i6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tl	%xcc,	0x3
	fmovrdgz	%l5,	%f18,	%f2
	tvc	%xcc,	0x6
	fmovrsne	%o4,	%f20,	%f10
	fmovrdlz	%o0,	%f20,	%f8
	subcc	%l6,	0x1030,	%l1
	ble,pn	%icc,	loop_1616
	sll	%g2,	%g5,	%o2
	bcs,a	loop_1617
	tge	%xcc,	0x1
loop_1616:
	edge32n	%i5,	%g1,	%g3
	edge32n	%o7,	%o6,	%g7
loop_1617:
	movle	%icc,	%i2,	%g6
	edge32ln	%i4,	%l0,	%g4
	movle	%xcc,	%i0,	%i6
	add	%o3,	%l3,	%i3
	fbuge,a	%fcc2,	loop_1618
	fcmpd	%fcc0,	%f0,	%f24
	fbu	%fcc0,	loop_1619
	alignaddrl	%l4,	%o5,	%l2
loop_1618:
	ldd	[%l7 + 0x78],	%f24
	stx	%i1,	[%l7 + 0x68]
loop_1619:
	andn	%i7,	0x0614,	%o1
	movrgz	%o4,	%o0,	%l5
	fmovrslez	%l6,	%f18,	%f26
	tvc	%icc,	0x4
	movneg	%xcc,	%l1,	%g5
	sir	0x1A3B
	tleu	%icc,	0x2
	movle	%icc,	%o2,	%i5
	bg,pn	%xcc,	loop_1620
	flush	%l7 + 0x64
	fmovsgu	%icc,	%f20,	%f18
	movcc	%xcc,	%g1,	%g2
loop_1620:
	call	loop_1621
	movcc	%icc,	%o7,	%g3
	movpos	%xcc,	%o6,	%i2
	fors	%f24,	%f18,	%f7
loop_1621:
	add	%g6,	0x00AE,	%g7
	mulx	%i4,	0x1F20,	%l0
	ldd	[%l7 + 0x70],	%f0
	edge32ln	%i0,	%i6,	%o3
	array8	%g4,	%l3,	%l4
	tpos	%xcc,	0x4
	movleu	%icc,	%o5,	%l2
	ldsb	[%l7 + 0x5C],	%i1
	fmovscc	%xcc,	%f20,	%f31
	tpos	%icc,	0x6
	edge16l	%i7,	%i3,	%o1
	tn	%xcc,	0x2
	add	%o0,	%l5,	%l6
	ld	[%l7 + 0x50],	%f1
	edge16ln	%l1,	%o4,	%g5
	movleu	%icc,	%i5,	%o2
	movrlez	%g2,	%g1,	%o7
	swap	[%l7 + 0x60],	%g3
	movvs	%xcc,	%o6,	%i2
	xnorcc	%g7,	%g6,	%i4
	andncc	%i0,	%i6,	%l0
	wr	%g0,	0x80,	%asi
	ldstuba	[%l7 + 0x41] %asi,	%g4
	bvs,a,pt	%icc,	loop_1622
	tn	%icc,	0x3
	fmovdge	%icc,	%f31,	%f28
	wr	%g0,	0x23,	%asi
	stxa	%o3,	[%l7 + 0x70] %asi
	membar	#Sync
loop_1622:
	fpsub16s	%f22,	%f21,	%f26
	edge8n	%l3,	%l4,	%o5
	subc	%l2,	0x006A,	%i7
	tpos	%icc,	0x2
	fnot2	%f6,	%f2
	srl	%i3,	0x05,	%i1
	fmovrdgz	%o1,	%f6,	%f18
	fbl	%fcc2,	loop_1623
	mova	%xcc,	%o0,	%l6
	bvs,pn	%icc,	loop_1624
	fzero	%f30
loop_1623:
	edge16	%l5,	%l1,	%o4
	fsrc2s	%f2,	%f3
loop_1624:
	sdivcc	%g5,	0x1480,	%i5
	movg	%icc,	%g2,	%o2
	edge16	%o7,	%g3,	%o6
	fble,a	%fcc0,	loop_1625
	fcmpne16	%f12,	%f22,	%g1
	movrgz	%i2,	0x0AE,	%g6
	movrlez	%g7,	%i4,	%i6
loop_1625:
	taddcc	%i0,	%g4,	%o3
	ldd	[%l7 + 0x58],	%l2
	andn	%l4,	%l0,	%l2
	flush	%l7 + 0x3C
	fmovd	%f30,	%f6
	fmovsneg	%icc,	%f6,	%f12
	ldstub	[%l7 + 0x3C],	%i7
	sdivx	%o5,	0x0B38,	%i1
	movneg	%xcc,	%o1,	%o0
	std	%f22,	[%l7 + 0x48]
	sth	%i3,	[%l7 + 0x46]
	set	0x3C, %i4
	stwa	%l5,	[%l7 + %i4] 0xeb
	membar	#Sync
	edge16	%l1,	%l6,	%o4
	fpack16	%f24,	%f8
	fpmerge	%f12,	%f17,	%f18
	tpos	%icc,	0x4
	movrlez	%i5,	%g5,	%g2
	fmovrslz	%o2,	%f7,	%f4
	movneg	%xcc,	%g3,	%o6
	fpack32	%f4,	%f18,	%f4
	fbug	%fcc0,	loop_1626
	xor	%o7,	0x10AE,	%g1
	orcc	%g6,	%g7,	%i4
	tne	%xcc,	0x5
loop_1626:
	tcc	%xcc,	0x1
	brlez	%i2,	loop_1627
	movrgz	%i6,	0x2C1,	%i0
	sth	%o3,	[%l7 + 0x6C]
	tcs	%icc,	0x2
loop_1627:
	mulscc	%g4,	%l3,	%l0
	ba,a,pn	%xcc,	loop_1628
	alignaddr	%l4,	%i7,	%l2
	fandnot2	%f16,	%f6,	%f30
	tleu	%xcc,	0x7
loop_1628:
	ta	%xcc,	0x0
	fmovdcs	%icc,	%f0,	%f17
	edge32ln	%o5,	%i1,	%o0
	tl	%xcc,	0x4
	set	0x14, %l5
	sta	%f7,	[%l7 + %l5] 0x89
	sdiv	%i3,	0x0537,	%o1
	andcc	%l5,	0x0F1A,	%l1
	movn	%xcc,	%o4,	%i5
	fmovsge	%xcc,	%f0,	%f21
	fxor	%f6,	%f30,	%f20
	smul	%l6,	0x1F81,	%g2
	edge8	%o2,	%g3,	%o6
	brlez,a	%g5,	loop_1629
	fmuld8sux16	%f13,	%f8,	%f12
	ldsb	[%l7 + 0x75],	%o7
	or	%g1,	0x050D,	%g7
loop_1629:
	sethi	0x035C,	%g6
	movcc	%icc,	%i2,	%i4
	ldstub	[%l7 + 0x1B],	%i0
	movle	%icc,	%i6,	%o3
	fmovrdlez	%g4,	%f8,	%f26
	fand	%f2,	%f20,	%f26
	fpadd16s	%f8,	%f24,	%f10
	move	%xcc,	%l3,	%l0
	mulx	%i7,	%l2,	%o5
	fzeros	%f19
	andcc	%i1,	0x12B4,	%o0
	popc	0x0002,	%l4
	edge8l	%i3,	%o1,	%l5
	smulcc	%l1,	0x1E79,	%o4
	umul	%i5,	0x15BB,	%g2
	movrne	%o2,	%l6,	%o6
	fnot2	%f16,	%f4
	add	%l7,	0x14,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] %asi,	%g3,	%o7
	fmovsl	%icc,	%f27,	%f17
	edge16ln	%g1,	%g7,	%g5
	fcmpgt16	%f8,	%f22,	%i2
	set	0x20, %i2
	ldxa	[%l7 + %i2] 0x14,	%i4
	subccc	%i0,	0x1DA4,	%g6
	udivx	%o3,	0x1F36,	%i6
	sdiv	%g4,	0x0367,	%l0
	bne,a	%icc,	loop_1630
	fnot2s	%f2,	%f8
	movcc	%xcc,	%l3,	%l2
	set	0x14, %i5
	stwa	%o5,	[%l7 + %i5] 0x04
loop_1630:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movleu	%xcc,	%i7,	%o0
	movre	%l4,	%i1,	%i3
	fmul8x16	%f30,	%f14,	%f14
	movrlez	%l5,	0x209,	%o1
	movcc	%xcc,	%o4,	%l1
	taddcc	%i5,	%o2,	%g2
	array8	%o6,	%l6,	%o7
	sethi	0x1756,	%g1
	swap	[%l7 + 0x50],	%g7
	wr	%g0,	0x11,	%asi
	lduwa	[%l7 + 0x4C] %asi,	%g5
	fmovsa	%icc,	%f6,	%f25
	fpsub16s	%f19,	%f22,	%f23
	fmovdg	%xcc,	%f26,	%f25
	wr	%g0,	0x2a,	%asi
	stha	%g3,	[%l7 + 0x6E] %asi
	membar	#Sync
	movrlez	%i4,	%i0,	%g6
	udivcc	%i2,	0x0561,	%i6
	fbul,a	%fcc2,	loop_1631
	umulcc	%g4,	0x1A22,	%o3
	orncc	%l0,	0x0C51,	%l3
	subcc	%o5,	0x0BC0,	%i7
loop_1631:
	fmovda	%icc,	%f22,	%f16
	xnorcc	%l2,	%o0,	%i1
	fexpand	%f26,	%f18
	edge8l	%l4,	%l5,	%i3
	move	%xcc,	%o1,	%o4
	wr	%g0,	0x18,	%asi
	ldxa	[%l7 + 0x08] %asi,	%i5
	tge	%icc,	0x4
	bge,a	loop_1632
	tleu	%xcc,	0x4
	movgu	%icc,	%l1,	%o2
	ta	%xcc,	0x4
loop_1632:
	std	%o6,	[%l7 + 0x78]
	xnorcc	%g2,	0x16A0,	%l6
	fandnot2s	%f13,	%f25,	%f20
	call	loop_1633
	fmovsneg	%icc,	%f21,	%f9
	smulcc	%o7,	%g7,	%g1
	fnot1s	%f19,	%f12
loop_1633:
	edge32n	%g5,	%i4,	%i0
	subcc	%g3,	%g6,	%i6
	tcc	%icc,	0x6
	tg	%icc,	0x0
	tvs	%xcc,	0x1
	fmovdne	%icc,	%f2,	%f15
	std	%g4,	[%l7 + 0x58]
	addccc	%o3,	0x1865,	%i2
	set	0x14, %l6
	stwa	%l0,	[%l7 + %l6] 0x18
	srlx	%o5,	%l3,	%l2
	orn	%i7,	0x11D4,	%o0
	fmovrse	%i1,	%f19,	%f23
	prefetch	[%l7 + 0x68],	 0x1
	movgu	%icc,	%l4,	%i3
	fbu,a	%fcc3,	loop_1634
	smul	%l5,	0x1218,	%o4
	array8	%i5,	%o1,	%o2
	tgu	%xcc,	0x6
loop_1634:
	tvc	%xcc,	0x7
	tcc	%icc,	0x7
	fzeros	%f13
	srl	%l1,	%o6,	%g2
	sllx	%o7,	%l6,	%g7
	fmovrdgez	%g5,	%f2,	%f16
	fnegd	%f30,	%f10
	fmovrdne	%g1,	%f22,	%f8
	srl	%i0,	0x08,	%g3
	edge32n	%i4,	%i6,	%g6
	xorcc	%o3,	0x1E02,	%i2
	ldstub	[%l7 + 0x0B],	%l0
	udivcc	%g4,	0x06A3,	%o5
	movle	%icc,	%l2,	%l3
	stb	%i7,	[%l7 + 0x4A]
	edge32n	%i1,	%o0,	%l4
	edge16ln	%l5,	%i3,	%i5
	xorcc	%o4,	%o1,	%l1
	fmovsne	%icc,	%f6,	%f18
	fpadd16s	%f29,	%f1,	%f8
	brnz,a	%o6,	loop_1635
	edge8ln	%g2,	%o2,	%l6
	bcs	loop_1636
	fmuld8ulx16	%f28,	%f9,	%f4
loop_1635:
	fbu,a	%fcc3,	loop_1637
	alignaddr	%g7,	%o7,	%g5
loop_1636:
	ldsw	[%l7 + 0x28],	%i0
	movvc	%icc,	%g1,	%i4
loop_1637:
	edge16n	%i6,	%g6,	%o3
	movcc	%icc,	%g3,	%l0
	xorcc	%i2,	0x03ED,	%g4
	fbo	%fcc1,	loop_1638
	tvc	%icc,	0x5
	fbul	%fcc1,	loop_1639
	udivx	%o5,	0x067D,	%l2
loop_1638:
	brz,a	%i7,	loop_1640
	nop
	setx loop_1641, %l0, %l1
	jmpl %l1, %l3
loop_1639:
	fornot1	%f16,	%f14,	%f0
	swap	[%l7 + 0x54],	%i1
loop_1640:
	taddcc	%l4,	0x1F5F,	%l5
loop_1641:
	sra	%i3,	0x09,	%o0
	mova	%icc,	%i5,	%o1
	or	%o4,	0x100D,	%l1
	and	%g2,	%o6,	%o2
	fpsub16s	%f12,	%f2,	%f8
	tge	%xcc,	0x3
	addccc	%g7,	0x187A,	%l6
	fbn,a	%fcc3,	loop_1642
	bvc	%xcc,	loop_1643
	andncc	%g5,	%o7,	%i0
	fcmped	%fcc1,	%f12,	%f4
loop_1642:
	add	%g1,	0x1627,	%i4
loop_1643:
	nop
	wr	%g0,	0x88,	%asi
	ldsba	[%l7 + 0x68] %asi,	%i6
	fbn	%fcc1,	loop_1644
	fmovrse	%o3,	%f11,	%f3
	fbn	%fcc3,	loop_1645
	udivcc	%g6,	0x0657,	%l0
loop_1644:
	fmovdne	%xcc,	%f4,	%f29
	fmovdvc	%xcc,	%f20,	%f14
loop_1645:
	nop
	set	0x70, %g1
	stx	%i2,	[%l7 + %g1]
	edge32l	%g4,	%o5,	%g3
	fpadd32	%f16,	%f14,	%f10
	movvs	%icc,	%i7,	%l2
	sdivcc	%l3,	0x1791,	%i1
	fnegs	%f8,	%f25
	fmovsvc	%icc,	%f5,	%f9
	andncc	%l4,	%l5,	%o0
	movrne	%i3,	%o1,	%i5
	sub	%o4,	%g2,	%l1
	subc	%o6,	%g7,	%o2
	fpack32	%f10,	%f10,	%f26
	tgu	%icc,	0x1
	fnor	%f6,	%f8,	%f8
	lduw	[%l7 + 0x4C],	%g5
	add	%o7,	0x0F17,	%i0
	movgu	%xcc,	%l6,	%g1
	movle	%xcc,	%i4,	%o3
	bl	%icc,	loop_1646
	swap	[%l7 + 0x5C],	%i6
	set	0x74, %i7
	ldswa	[%l7 + %i7] 0x10,	%l0
loop_1646:
	fmovsvs	%xcc,	%f11,	%f5
	tleu	%icc,	0x0
	movg	%xcc,	%i2,	%g6
	tvs	%icc,	0x3
	fabsd	%f14,	%f16
	tcc	%icc,	0x6
	wr	%g0,	0x18,	%asi
	swapa	[%l7 + 0x18] %asi,	%o5
	add	%g4,	0x130B,	%g3
	srlx	%l2,	%l3,	%i7
	nop
	setx	loop_1647,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movleu	%icc,	%l4,	%l5
	lduh	[%l7 + 0x38],	%o0
	edge32	%i1,	%i3,	%i5
loop_1647:
	nop
	wr	%g0,	0x24,	%asi
	ldda	[%l7 + 0x70] %asi,	%o0
	tge	%icc,	0x2
	orcc	%o4,	0x16DD,	%l1
	fnot2s	%f3,	%f31
	ldd	[%l7 + 0x30],	%f16
	set	0x2A, %g4
	lduha	[%l7 + %g4] 0x14,	%o6
	tneg	%xcc,	0x5
	edge16n	%g7,	%o2,	%g5
	movn	%icc,	%g2,	%o7
	set	0x5A, %o1
	lduha	[%l7 + %o1] 0x04,	%l6
	mulscc	%i0,	%i4,	%o3
	fbule,a	%fcc0,	loop_1648
	sll	%g1,	0x1F,	%i6
	bpos,pt	%icc,	loop_1649
	fsrc1s	%f20,	%f19
loop_1648:
	ta	%icc,	0x6
	fnot2s	%f3,	%f9
loop_1649:
	prefetch	[%l7 + 0x30],	 0x0
	bge,a	%icc,	loop_1650
	nop
	set	0x28, %i3
	std	%f24,	[%l7 + %i3]
	wr	%g0,	0x18,	%asi
	stba	%l0,	[%l7 + 0x0C] %asi
loop_1650:
	alignaddr	%i2,	%g6,	%g4
	edge16l	%o5,	%g3,	%l3
	movrlez	%l2,	0x2E1,	%l4
	edge8ln	%l5,	%i7,	%i1
	bgu,pt	%icc,	loop_1651
	movpos	%xcc,	%i3,	%i5
	fmovse	%icc,	%f28,	%f28
	tvc	%icc,	0x5
loop_1651:
	movle	%icc,	%o1,	%o4
	taddcctv	%l1,	%o0,	%g7
	orn	%o6,	0x1DF3,	%g5
	tne	%xcc,	0x5
	orncc	%o2,	0x1565,	%o7
	sra	%g2,	0x03,	%i0
	sllx	%l6,	%o3,	%i4
	taddcctv	%g1,	0x1E11,	%l0
	movl	%xcc,	%i6,	%i2
	andcc	%g4,	0x05C2,	%o5
	fmovdcs	%xcc,	%f30,	%f15
	fmul8sux16	%f8,	%f8,	%f28
	set	0x7C, %o5
	lduha	[%l7 + %o5] 0x81,	%g3
	tsubcc	%l3,	0x1E7E,	%g6
	movrgez	%l4,	0x360,	%l2
	set	0x0A, %o3
	stha	%l5,	[%l7 + %o3] 0x81
	sethi	0x1FD4,	%i1
	fmovsle	%xcc,	%f22,	%f5
	fornot1s	%f14,	%f13,	%f21
	fmuld8ulx16	%f21,	%f22,	%f16
	movrne	%i3,	0x050,	%i5
	ldd	[%l7 + 0x48],	%f6
	fcmpeq16	%f14,	%f0,	%o1
	fmovrdgez	%o4,	%f20,	%f14
	movpos	%icc,	%i7,	%l1
	prefetch	[%l7 + 0x18],	 0x3
	xnorcc	%o0,	%g7,	%g5
	te	%icc,	0x1
	fmovdcc	%xcc,	%f22,	%f18
	bvc,pt	%xcc,	loop_1652
	movrlez	%o6,	0x253,	%o7
	membar	#Sync
	set	0x40, %g5
	ldda	[%l7 + %g5] 0x1f,	%f16
loop_1652:
	fmovrslz	%o2,	%f6,	%f13
	fmovrde	%g2,	%f20,	%f4
	udivcc	%i0,	0x08D9,	%l6
	brgz	%o3,	loop_1653
	movrne	%i4,	%l0,	%i6
	movne	%icc,	%i2,	%g4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1653:
	addccc	%o5,	0x129F,	%g3
	ld	[%l7 + 0x60],	%f22
	ta	%icc,	0x7
	movl	%icc,	%g1,	%l3
	xnorcc	%g6,	%l2,	%l4
	wr	%g0,	0x0c,	%asi
	stba	%l5,	[%l7 + 0x0F] %asi
	add	%i3,	%i5,	%o1
	ldsw	[%l7 + 0x60],	%i1
	fmovsa	%icc,	%f27,	%f27
	subcc	%o4,	0x0C2B,	%l1
	fmovdneg	%xcc,	%f29,	%f2
	edge8l	%o0,	%i7,	%g7
	fmovrdne	%o6,	%f14,	%f26
	swap	[%l7 + 0x5C],	%o7
	fcmps	%fcc3,	%f17,	%f16
	sll	%o2,	0x02,	%g5
	movvs	%icc,	%i0,	%g2
	fmovrde	%o3,	%f10,	%f20
	edge8l	%i4,	%l6,	%l0
	fnegd	%f14,	%f2
	movneg	%icc,	%i2,	%i6
	wr	%g0,	0x22,	%asi
	stxa	%o5,	[%l7 + 0x30] %asi
	membar	#Sync
	fxors	%f4,	%f26,	%f4
	ldd	[%l7 + 0x10],	%g2
	sra	%g1,	%g4,	%g6
	orncc	%l2,	%l3,	%l4
	sth	%i3,	[%l7 + 0x3E]
	fpsub32	%f18,	%f4,	%f0
	set	0x68, %g2
	ldxa	[%l7 + %g2] 0x15,	%i5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrdgez	%l5,	%f20,	%f4
	ld	[%l7 + 0x08],	%f5
	be,a,pn	%xcc,	loop_1654
	tvs	%xcc,	0x5
	mova	%xcc,	%i1,	%o4
	fbge,a	%fcc1,	loop_1655
loop_1654:
	stbar
	bn,a	loop_1656
	srax	%l1,	0x0C,	%o1
loop_1655:
	array8	%i7,	%o0,	%g7
	bvc	loop_1657
loop_1656:
	fmovse	%xcc,	%f15,	%f21
	wr	%g0,	0x81,	%asi
	sta	%f17,	[%l7 + 0x34] %asi
loop_1657:
	tn	%icc,	0x7
	fbule	%fcc3,	loop_1658
	mulscc	%o7,	%o2,	%g5
	udiv	%o6,	0x1B13,	%i0
	mulscc	%g2,	0x06D8,	%i4
loop_1658:
	edge8ln	%l6,	%o3,	%i2
	fmovrslez	%i6,	%f25,	%f0
	st	%f27,	[%l7 + 0x4C]
	subc	%l0,	%g3,	%g1
	edge32	%o5,	%g4,	%g6
	set	0x33, %o0
	lduba	[%l7 + %o0] 0x15,	%l3
	subc	%l2,	%l4,	%i5
	array32	%i3,	%i1,	%o4
	edge16l	%l1,	%o1,	%i7
	movcc	%xcc,	%o0,	%l5
	addc	%g7,	0x1CFB,	%o7
	brnz,a	%g5,	loop_1659
	udivcc	%o2,	0x01A2,	%i0
	swap	[%l7 + 0x5C],	%g2
	subc	%o6,	0x1F13,	%i4
loop_1659:
	alignaddr	%o3,	%l6,	%i2
	edge8n	%i6,	%g3,	%g1
	sdivcc	%o5,	0x0DDD,	%g4
	brlz,a	%g6,	loop_1660
	brz,a	%l3,	loop_1661
	ba	%xcc,	loop_1662
	edge32l	%l2,	%l0,	%i5
loop_1660:
	siam	0x5
loop_1661:
	nop
	wr	%g0,	0x89,	%asi
	prefetcha	[%l7 + 0x78] %asi,	 0x0
loop_1662:
	fmovscs	%icc,	%f27,	%f21
	mulscc	%i3,	%o4,	%i1
	smul	%o1,	0x1A01,	%i7
	addccc	%o0,	%l5,	%l1
	and	%g7,	0x0C49,	%g5
	tle	%icc,	0x0
	srl	%o7,	%i0,	%o2
	fbuge,a	%fcc3,	loop_1663
	lduh	[%l7 + 0x74],	%o6
	umul	%g2,	%o3,	%i4
	brlez	%i2,	loop_1664
loop_1663:
	movrlez	%i6,	0x00D,	%l6
	fmovse	%xcc,	%f15,	%f1
	or	%g1,	%g3,	%g4
loop_1664:
	movvs	%icc,	%g6,	%o5
	tl	%xcc,	0x3
	nop
	setx loop_1665, %l0, %l1
	jmpl %l1, %l2
	fmovsn	%icc,	%f9,	%f29
	wr	%g0,	0x80,	%asi
	stwa	%l3,	[%l7 + 0x40] %asi
loop_1665:
	popc	%i5,	%l4
	fmovrde	%i3,	%f0,	%f30
	ta	%xcc,	0x3
	srl	%l0,	0x17,	%o4
	fbuge	%fcc0,	loop_1666
	orn	%o1,	%i7,	%o0
	movrne	%l5,	%l1,	%i1
	for	%f0,	%f20,	%f8
loop_1666:
	sir	0x0476
	edge32n	%g5,	%o7,	%g7
	stbar
	orcc	%o2,	%o6,	%i0
	wr	%g0,	0x88,	%asi
	ldsha	[%l7 + 0x26] %asi,	%g2
	edge32	%i4,	%o3,	%i6
	subccc	%l6,	%i2,	%g1
	add	%g4,	%g6,	%o5
	taddcc	%l2,	0x16D9,	%g3
	umul	%i5,	%l4,	%l3
	fmovsge	%xcc,	%f0,	%f13
	fmovrdgz	%i3,	%f4,	%f8
	fmovscs	%icc,	%f13,	%f11
	set	0x70, %l2
	ldxa	[%l7 + %l2] 0x10,	%l0
	fmuld8ulx16	%f6,	%f20,	%f20
	mova	%icc,	%o1,	%i7
	addcc	%o0,	%o4,	%l5
	edge32l	%i1,	%l1,	%g5
	srax	%o7,	0x19,	%g7
	edge8ln	%o6,	%i0,	%g2
	fandnot1	%f22,	%f10,	%f6
	set	0x1C, %l0
	stwa	%i4,	[%l7 + %l0] 0x0c
	fpack16	%f26,	%f2
	movl	%xcc,	%o3,	%i6
	wr	%g0,	0x88,	%asi
	lduha	[%l7 + 0x08] %asi,	%l6
	lduw	[%l7 + 0x10],	%i2
	fnot2	%f10,	%f4
	movcs	%xcc,	%o2,	%g1
	edge32	%g4,	%g6,	%l2
	tsubcc	%g3,	0x0E5E,	%o5
	addc	%l4,	0x0687,	%l3
	edge32l	%i5,	%i3,	%o1
	edge32l	%l0,	%i7,	%o4
	fzero	%f8
	fornot1s	%f14,	%f12,	%f11
	tsubcctv	%o0,	0x1A59,	%i1
	be,a	loop_1667
	swap	[%l7 + 0x60],	%l1
	movrlz	%l5,	0x2D3,	%o7
	taddcc	%g7,	0x1FEF,	%g5
loop_1667:
	fsrc1	%f4,	%f26
	fmovdle	%xcc,	%f6,	%f5
	tne	%icc,	0x7
	stb	%o6,	[%l7 + 0x22]
	smulcc	%g2,	%i0,	%i4
	fcmpeq16	%f18,	%f4,	%o3
	ldsh	[%l7 + 0x5A],	%l6
	fmovrslz	%i6,	%f1,	%f0
	subccc	%i2,	0x187F,	%g1
	tpos	%icc,	0x6
	stb	%g4,	[%l7 + 0x77]
	bcc	loop_1668
	bcc,a,pn	%icc,	loop_1669
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tcc	%icc,	0x6
loop_1668:
	subccc	%g6,	0x00A2,	%l2
loop_1669:
	xnorcc	%o2,	0x06B2,	%o5
	fmovrsgz	%l4,	%f17,	%f10
	tle	%icc,	0x3
	tsubcctv	%l3,	0x0964,	%g3
	sdivx	%i5,	0x0FBA,	%i3
	ldsw	[%l7 + 0x0C],	%l0
	sdivx	%i7,	0x133C,	%o1
	tneg	%xcc,	0x1
	fcmple16	%f10,	%f12,	%o4
	add	%o0,	%i1,	%l5
	fbue	%fcc3,	loop_1670
	fsrc1	%f2,	%f22
	edge16	%o7,	%g7,	%g5
	tl	%xcc,	0x1
loop_1670:
	or	%l1,	0x044C,	%o6
	bl	loop_1671
	fnor	%f0,	%f8,	%f14
	xnorcc	%g2,	0x0486,	%i0
	std	%f16,	[%l7 + 0x58]
loop_1671:
	edge32n	%i4,	%l6,	%o3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andncc	%i6,	%g1,	%i2
	sub	%g6,	0x198B,	%l2
	movrlez	%g4,	%o5,	%l4
	fors	%f1,	%f2,	%f7
	fmovrde	%l3,	%f18,	%f10
	set	0x40, %l1
	stda	%f0,	[%l7 + %l1] 0x18
	bge,a	loop_1672
	fabss	%f29,	%f3
	sra	%g3,	0x18,	%i5
	fornot2s	%f8,	%f1,	%f11
loop_1672:
	bge,pt	%xcc,	loop_1673
	fpsub32	%f8,	%f22,	%f28
	fba	%fcc1,	loop_1674
	fcmple16	%f28,	%f14,	%i3
loop_1673:
	taddcctv	%l0,	0x063F,	%i7
	movvc	%icc,	%o1,	%o4
loop_1674:
	alignaddr	%o0,	%o2,	%l5
	movcs	%xcc,	%i1,	%g7
	edge32l	%g5,	%l1,	%o6
	movneg	%xcc,	%o7,	%g2
	movre	%i4,	%l6,	%o3
	edge16	%i0,	%i6,	%i2
	fabss	%f7,	%f6
	fnors	%f5,	%f8,	%f21
	set	0x40, %g3
	stda	%f0,	[%l7 + %g3] 0x0c
	fbul	%fcc0,	loop_1675
	ld	[%l7 + 0x6C],	%f17
	bpos,a,pn	%xcc,	loop_1676
	st	%f23,	[%l7 + 0x38]
loop_1675:
	edge16l	%g6,	%l2,	%g4
	std	%g0,	[%l7 + 0x78]
loop_1676:
	fsrc2s	%f15,	%f22
	fbe,a	%fcc1,	loop_1677
	movl	%xcc,	%l4,	%l3
	movpos	%xcc,	%o5,	%g3
	fmovdgu	%xcc,	%f9,	%f10
loop_1677:
	edge8n	%i5,	%l0,	%i3
	call	loop_1678
	movneg	%xcc,	%i7,	%o4
	sethi	0x1D0E,	%o0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1678:
	alignaddrl	%o2,	%o1,	%l5
	prefetch	[%l7 + 0x44],	 0x3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movle	%icc,	%i1,	%g5
	movleu	%icc,	%l1,	%g7
	edge16l	%o7,	%o6,	%i4
	edge32ln	%g2,	%l6,	%o3
	srlx	%i6,	0x09,	%i0
	wr	%g0,	0x11,	%asi
	lduwa	[%l7 + 0x68] %asi,	%g6
	tvs	%icc,	0x7
	sdivcc	%l2,	0x0059,	%g4
	tvs	%icc,	0x6
	movrne	%i2,	%g1,	%l3
	movrlez	%o5,	%l4,	%g3
	ldsw	[%l7 + 0x4C],	%l0
	sub	%i5,	0x1B6D,	%i3
	fxor	%f20,	%f14,	%f0
	edge16ln	%o4,	%i7,	%o2
	smulcc	%o1,	%o0,	%l5
	movre	%i1,	0x33A,	%l1
	movrgz	%g7,	%g5,	%o7
	set	0x60, %l3
	ldda	[%l7 + %l3] 0x27,	%i4
	brlez	%g2,	loop_1679
	srl	%l6,	%o6,	%i6
	array32	%o3,	%i0,	%l2
	tcs	%xcc,	0x4
loop_1679:
	tleu	%xcc,	0x1
	brz,a	%g4,	loop_1680
	mova	%icc,	%i2,	%g1
	movgu	%xcc,	%l3,	%o5
	tleu	%xcc,	0x5
loop_1680:
	addc	%l4,	0x056A,	%g3
	mova	%icc,	%g6,	%i5
	fxors	%f23,	%f29,	%f14
	sll	%i3,	%o4,	%i7
	movrlz	%o2,	0x222,	%o1
	sdiv	%l0,	0x0DB7,	%l5
	xnorcc	%i1,	0x1059,	%o0
	brz	%l1,	loop_1681
	xorcc	%g7,	%g5,	%o7
	ldd	[%l7 + 0x70],	%g2
	xor	%l6,	0x1026,	%i4
loop_1681:
	fmovs	%f6,	%f18
	fpack16	%f6,	%f6
	addcc	%i6,	%o3,	%o6
	movge	%xcc,	%i0,	%g4
	tne	%icc,	0x3
	tcs	%xcc,	0x6
	fbuge	%fcc2,	loop_1682
	fmovdcc	%xcc,	%f23,	%f8
	fmovsn	%xcc,	%f23,	%f30
	fcmpes	%fcc2,	%f0,	%f4
loop_1682:
	bleu	%icc,	loop_1683
	movn	%xcc,	%l2,	%g1
	fmovsg	%xcc,	%f18,	%f24
	tne	%icc,	0x5
loop_1683:
	and	%l3,	%o5,	%i2
	fmovdg	%icc,	%f28,	%f0
	pdist	%f10,	%f28,	%f24
	movneg	%xcc,	%l4,	%g6
	fble	%fcc1,	loop_1684
	bn,a,pn	%icc,	loop_1685
	nop
	setx	loop_1686,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tle	%xcc,	0x2
loop_1684:
	stw	%i5,	[%l7 + 0x38]
loop_1685:
	orcc	%i3,	%g3,	%i7
loop_1686:
	nop
	set	0x210, %i6
	ldxa	[%g0 + %i6] 0x52,	%o2
	edge32ln	%o4,	%l0,	%l5
	fabss	%f6,	%f19
	fble,a	%fcc0,	loop_1687
	movrgez	%o1,	0x0C3,	%i1
	wr	%g0,	0x18,	%asi
	ldswa	[%l7 + 0x60] %asi,	%o0
loop_1687:
	bn,a	loop_1688
	sdivx	%l1,	0x0E7F,	%g5
	sethi	0x11BB,	%o7
	tsubcctv	%g7,	0x021E,	%l6
loop_1688:
	addcc	%g2,	0x011D,	%i4
	fpsub16	%f0,	%f14,	%f0
	mulscc	%o3,	0x049C,	%i6
	sub	%o6,	0x0661,	%i0
	xnor	%l2,	%g1,	%g4
	tsubcctv	%o5,	0x091F,	%l3
	bcs	loop_1689
	std	%l4,	[%l7 + 0x48]
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
loop_1689:
	fcmpd	%fcc3,	%f18,	%f8
	movne	%xcc,	%i2,	%i5
	movcc	%icc,	%i3,	%g3
	addc	%i7,	0x0E07,	%g6
	move	%xcc,	%o4,	%o2
	tn	%icc,	0x0
	tneg	%xcc,	0x1
	movre	%l5,	%o1,	%i1
	movrgez	%l0,	%l1,	%o0
	sub	%o7,	0x188C,	%g7
	tvc	%icc,	0x2
	popc	%l6,	%g5
	wr	%g0,	0x80,	%asi
	lduha	[%l7 + 0x60] %asi,	%i4
	fcmpd	%fcc2,	%f26,	%f14
	addc	%g2,	0x0A38,	%o3
	stbar
	srl	%i6,	%o6,	%l2
	edge32n	%g1,	%g4,	%o5
	fnand	%f2,	%f30,	%f30
	sth	%l3,	[%l7 + 0x22]
	sdiv	%i0,	0x0700,	%i2
	addcc	%l4,	0x16FA,	%i5
	fcmpeq16	%f22,	%f20,	%g3
	orncc	%i7,	%g6,	%i3
	lduw	[%l7 + 0x10],	%o4
	udivcc	%o2,	0x049F,	%l5
	movn	%icc,	%i1,	%o1
	edge32n	%l0,	%o0,	%o7
	orcc	%g7,	0x1EA8,	%l6
	set	0x58, %o6
	stwa	%g5,	[%l7 + %o6] 0x2b
	membar	#Sync
	xnorcc	%i4,	0x0A4E,	%g2
	set	0x78, %g6
	stxa	%o3,	[%l7 + %g6] 0xe2
	membar	#Sync
	sdivcc	%l1,	0x0DEE,	%o6
	add	%l7,	0x10,	%l6
	wr	%g0,	0x10,	%asi
	ldxa	[%l6] %asi,	%i6
	casxa	[%l6] %asi,	%i6,	%l2
	or	%g4,	0x151A,	%g1
	movgu	%xcc,	%o5,	%i0
	edge32n	%l3,	%i2,	%l4
	fmovsle	%icc,	%f13,	%f16
	add	%i5,	0x1F2C,	%g3
	taddcctv	%i7,	0x05F4,	%i3
	wr	%g0,	0x0c,	%asi
	stha	%g6,	[%l7 + 0x14] %asi
	movgu	%xcc,	%o4,	%l5
	fmovrdgz	%o2,	%f8,	%f20
	edge8l	%o1,	%i1,	%l0
	nop
	setx	loop_1690,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tvs	%xcc,	0x7
	fmovsleu	%xcc,	%f20,	%f18
	tsubcc	%o7,	%o0,	%g7
loop_1690:
	sllx	%l6,	0x1F,	%i4
	tpos	%icc,	0x0
	fcmpne16	%f14,	%f30,	%g5
	mova	%xcc,	%g2,	%o3
	addc	%o6,	%l1,	%i6
	movvs	%xcc,	%g4,	%l2
	alignaddr	%o5,	%g1,	%i0
	sdivx	%i2,	0x19D9,	%l3
	call	loop_1691
	sir	0x151A
	movvc	%icc,	%l4,	%g3
	xnor	%i7,	%i5,	%g6
loop_1691:
	srlx	%i3,	0x17,	%o4
	subcc	%o2,	%l5,	%i1
	bgu,a,pn	%xcc,	loop_1692
	sll	%l0,	%o1,	%o7
	movrlez	%o0,	%l6,	%i4
	movpos	%xcc,	%g5,	%g7
loop_1692:
	subc	%o3,	%g2,	%o6
	fmovscc	%icc,	%f9,	%f14
	fmul8sux16	%f16,	%f28,	%f26
	fornot2s	%f13,	%f1,	%f10
	srax	%i6,	0x19,	%l1
	fcmpd	%fcc0,	%f0,	%f28
	fcmpgt32	%f30,	%f30,	%g4
	fbue,a	%fcc1,	loop_1693
	fabss	%f18,	%f5
	wr	%g0,	0x89,	%asi
	lda	[%l7 + 0x1C] %asi,	%f3
loop_1693:
	edge16ln	%l2,	%o5,	%g1
	smulcc	%i2,	0x044D,	%l3
	fnor	%f28,	%f24,	%f20
	bcc,a,pt	%icc,	loop_1694
	udivcc	%i0,	0x0E96,	%g3
	edge8	%l4,	%i5,	%i7
	fabss	%f31,	%f18
loop_1694:
	edge16	%g6,	%o4,	%i3
	set	0x21, %o4
	ldsba	[%l7 + %o4] 0x81,	%l5
	fmovrsne	%o2,	%f3,	%f12
	udivx	%i1,	0x16F7,	%l0
	xorcc	%o7,	0x0955,	%o1
	tcs	%icc,	0x3
	bneg	%xcc,	loop_1695
	fmovde	%icc,	%f18,	%f13
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subc	%o0,	0x1A37,	%i4
loop_1695:
	tcs	%icc,	0x4
	movne	%icc,	%g5,	%g7
	tcc	%xcc,	0x4
	smulcc	%o3,	0x03C0,	%l6
	fornot2s	%f13,	%f31,	%f9
	bl,a,pn	%xcc,	loop_1696
	movn	%icc,	%o6,	%g2
	fbu	%fcc0,	loop_1697
	sdivcc	%l1,	0x17D0,	%i6
loop_1696:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mulscc	%g4,	%o5,	%l2
loop_1697:
	movneg	%icc,	%g1,	%i2
	fmovsne	%xcc,	%f21,	%f22
	fbul,a	%fcc0,	loop_1698
	membar	0x14
	fmovrdlz	%l3,	%f28,	%f24
	fmuld8ulx16	%f13,	%f12,	%f6
loop_1698:
	movge	%xcc,	%i0,	%g3
	bvs	loop_1699
	fble	%fcc3,	loop_1700
	movrne	%l4,	%i7,	%g6
	xorcc	%o4,	0x113F,	%i5
loop_1699:
	array32	%l5,	%i3,	%o2
loop_1700:
	movle	%icc,	%i1,	%o7
	sllx	%l0,	%o0,	%i4
	fbl,a	%fcc1,	loop_1701
	fpadd32s	%f19,	%f14,	%f11
	fcmple32	%f14,	%f0,	%g5
	fmul8sux16	%f0,	%f20,	%f2
loop_1701:
	tn	%xcc,	0x5
	bneg,a,pt	%xcc,	loop_1702
	xorcc	%o1,	0x012E,	%g7
	fxors	%f20,	%f23,	%f1
	fmovsvs	%icc,	%f2,	%f22
loop_1702:
	array32	%l6,	%o3,	%g2
	array32	%o6,	%l1,	%i6
	popc	0x0D4C,	%o5
	wr	%g0,	0x11,	%asi
	stba	%g4,	[%l7 + 0x09] %asi
	movrne	%g1,	%i2,	%l3
	orn	%l2,	0x19C8,	%g3
	movrgz	%i0,	0x066,	%i7
	fmovrdlez	%g6,	%f16,	%f28
	bge,a,pt	%icc,	loop_1703
	movrgez	%l4,	0x204,	%i5
	fmovsleu	%xcc,	%f24,	%f27
	fmovrde	%o4,	%f4,	%f16
loop_1703:
	tpos	%xcc,	0x6
	bne	loop_1704
	fcmpgt32	%f24,	%f12,	%l5
	pdist	%f30,	%f16,	%f20
	fba,a	%fcc1,	loop_1705
loop_1704:
	tg	%xcc,	0x3
	sir	0x058D
	orn	%o2,	%i3,	%o7
loop_1705:
	movne	%icc,	%l0,	%i1
	fbuge	%fcc2,	loop_1706
	tleu	%xcc,	0x2
	set	0x6C, %o2
	stba	%i4,	[%l7 + %o2] 0x14
loop_1706:
	udivx	%g5,	0x0FC2,	%o1
	addccc	%g7,	0x1414,	%l6
	tl	%xcc,	0x3
	movn	%xcc,	%o3,	%g2
	fbu,a	%fcc1,	loop_1707
	nop
	setx loop_1708, %l0, %l1
	jmpl %l1, %o6
	fnands	%f12,	%f29,	%f28
	subc	%l1,	0x0131,	%i6
loop_1707:
	movvc	%xcc,	%o5,	%o0
loop_1708:
	movvs	%icc,	%g4,	%i2
	fpsub32	%f18,	%f6,	%f14
	movrgez	%g1,	0x330,	%l2
	sdivcc	%g3,	0x033C,	%i0
	array16	%i7,	%g6,	%l3
	taddcctv	%i5,	0x1220,	%o4
	fmovdvc	%icc,	%f2,	%f15
	movneg	%xcc,	%l5,	%o2
	movleu	%icc,	%l4,	%i3
	movrne	%o7,	0x0C4,	%l0
	set	0x30, %o7
	ldxa	[%l7 + %o7] 0x81,	%i1
	fmovsl	%xcc,	%f25,	%f24
	brnz,a	%i4,	loop_1709
	brgz,a	%g5,	loop_1710
	and	%o1,	%l6,	%g7
	bl	loop_1711
loop_1709:
	fcmpne16	%f6,	%f28,	%o3
loop_1710:
	mulx	%g2,	0x0EC5,	%l1
	membar	0x59
loop_1711:
	edge32	%o6,	%o5,	%o0
	brlz,a	%i6,	loop_1712
	membar	0x16
	mova	%icc,	%g4,	%g1
	bvc,a,pt	%icc,	loop_1713
loop_1712:
	fandnot1	%f18,	%f10,	%f6
	ldstub	[%l7 + 0x2D],	%l2
	tleu	%xcc,	0x4
loop_1713:
	movn	%icc,	%g3,	%i0
	fmovrdgez	%i7,	%f14,	%f18
	bcs,pt	%xcc,	loop_1714
	bn,a,pt	%xcc,	loop_1715
	nop
	setx	loop_1716,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tvc	%xcc,	0x3
loop_1714:
	tpos	%xcc,	0x5
loop_1715:
	sub	%i2,	%l3,	%i5
loop_1716:
	fbue,a	%fcc3,	loop_1717
	movleu	%icc,	%g6,	%o4
	ld	[%l7 + 0x20],	%f23
	bcs,a,pn	%xcc,	loop_1718
loop_1717:
	smulcc	%l5,	%l4,	%i3
	fmovdle	%xcc,	%f11,	%f18
	brlz,a	%o7,	loop_1719
loop_1718:
	fmovrsne	%o2,	%f20,	%f15
	fbule	%fcc3,	loop_1720
	edge16l	%i1,	%i4,	%g5
loop_1719:
	fpack16	%f14,	%f3
	membar	0x37
loop_1720:
	sub	%l0,	%o1,	%l6
	edge16	%o3,	%g2,	%g7
	edge16ln	%o6,	%l1,	%o5
	tleu	%icc,	0x4
	fcmped	%fcc1,	%f30,	%f4
	fsrc2s	%f15,	%f18
	movrne	%o0,	%g4,	%i6
	movcc	%xcc,	%g1,	%g3
	fmul8x16	%f2,	%f28,	%f26
	fmovsg	%icc,	%f28,	%f0
	call	loop_1721
	sethi	0x0467,	%l2
	std	%i0,	[%l7 + 0x40]
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1721:
	ba,a	loop_1722
	mova	%xcc,	%i7,	%i2
	movg	%icc,	%i5,	%g6
	std	%f30,	[%l7 + 0x28]
loop_1722:
	movl	%xcc,	%l3,	%o4
	smul	%l4,	%l5,	%o7
	brlz,a	%o2,	loop_1723
	or	%i1,	0x0C02,	%i3
	array16	%g5,	%i4,	%o1
	brz,a	%l0,	loop_1724
loop_1723:
	be,a	loop_1725
	tn	%xcc,	0x4
	fandnot1	%f24,	%f16,	%f22
loop_1724:
	bge	%icc,	loop_1726
loop_1725:
	bl,a	%xcc,	loop_1727
	membar	0x04
	orn	%o3,	0x0A5E,	%l6
loop_1726:
	mulscc	%g7,	%g2,	%l1
loop_1727:
	fbu,a	%fcc2,	loop_1728
	brz	%o6,	loop_1729
	umul	%o0,	0x16B6,	%o5
	umul	%i6,	0x0525,	%g4
loop_1728:
	nop
	wr	%g0,	0x10,	%asi
	ldstuba	[%l7 + 0x3B] %asi,	%g1
loop_1729:
	fbo,a	%fcc1,	loop_1730
	addccc	%g3,	0x14A1,	%l2
	orn	%i0,	%i7,	%i2
	tvc	%icc,	0x4
loop_1730:
	brz,a	%g6,	loop_1731
	fmovrsgz	%l3,	%f1,	%f20
	nop
	set	0x70, %i1
	ldsh	[%l7 + %i1],	%i5
	fcmpgt16	%f18,	%f24,	%l4
loop_1731:
	nop
	set	0x54, %g7
	sta	%f1,	[%l7 + %g7] 0x15
	edge16l	%l5,	%o7,	%o2
	edge16	%o4,	%i1,	%i3
	orncc	%i4,	0x14EC,	%o1
	wr	%g0,	0x04,	%asi
	stda	%g4,	[%l7 + 0x18] %asi
	fcmpgt16	%f10,	%f14,	%o3
	fxors	%f8,	%f14,	%f15
	addccc	%l0,	%g7,	%g2
	bn,a	%xcc,	loop_1732
	fmovrdgez	%l6,	%f30,	%f14
	addc	%o6,	%o0,	%l1
	movrgz	%o5,	%i6,	%g1
loop_1732:
	nop
	wr	%g0,	0x11,	%asi
	swapa	[%l7 + 0x7C] %asi,	%g3
	fmovdne	%icc,	%f29,	%f3
	fbl	%fcc1,	loop_1733
	brgez,a	%g4,	loop_1734
	tvc	%xcc,	0x5
	edge32l	%l2,	%i0,	%i7
loop_1733:
	nop
	set	0x40, %i0
	lda	[%l7 + %i0] 0x11,	%f17
loop_1734:
	bleu	%icc,	loop_1735
	movcc	%icc,	%i2,	%l3
	bneg,a	loop_1736
	fmul8ulx16	%f26,	%f2,	%f26
loop_1735:
	fmovsg	%xcc,	%f23,	%f8
	fsrc2s	%f0,	%f30
loop_1736:
	or	%i5,	%l4,	%g6
	sdivcc	%o7,	0x1749,	%l5
	fbue	%fcc1,	loop_1737
	udiv	%o4,	0x14AE,	%o2
	stb	%i1,	[%l7 + 0x74]
	stbar
loop_1737:
	edge8l	%i3,	%o1,	%g5
	andncc	%i4,	%o3,	%g7
	xnorcc	%l0,	%l6,	%g2
	movrlez	%o0,	0x1B5,	%o6
	movrgez	%l1,	%o5,	%i6
	tle	%icc,	0x6
	stx	%g3,	[%l7 + 0x30]
	xorcc	%g4,	%l2,	%i0
	fmovrdgez	%i7,	%f12,	%f20
	andn	%g1,	%i2,	%i5
	tcc	%icc,	0x0
	alignaddr	%l3,	%g6,	%o7
	wr	%g0,	0x04,	%asi
	stda	%l4,	[%l7 + 0x70] %asi
	tle	%xcc,	0x6
	set	0x48, %i4
	lda	[%l7 + %i4] 0x11,	%f29
	sir	0x0D93
	movneg	%xcc,	%o4,	%o2
	movre	%i1,	%l4,	%i3
	fabss	%f25,	%f24
	wr	%g0,	0x89,	%asi
	ldswa	[%l7 + 0x60] %asi,	%g5
	movn	%xcc,	%i4,	%o1
	fmul8x16au	%f15,	%f15,	%f22
	array16	%o3,	%l0,	%l6
	tg	%xcc,	0x0
	tn	%xcc,	0x7
	movrlz	%g2,	0x086,	%g7
	orn	%o0,	0x1D3D,	%o6
	smulcc	%l1,	0x034B,	%i6
	tvc	%icc,	0x2
	ld	[%l7 + 0x4C],	%f0
	bcs	loop_1738
	sethi	0x0C20,	%g3
	movcs	%icc,	%o5,	%l2
	fabss	%f19,	%f11
loop_1738:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbg	%fcc1,	loop_1739
	edge16ln	%i0,	%g4,	%g1
	edge8n	%i7,	%i2,	%i5
	movn	%xcc,	%l3,	%o7
loop_1739:
	tgu	%xcc,	0x3
	udivx	%l5,	0x0573,	%g6
	bvc,pn	%xcc,	loop_1740
	edge32l	%o4,	%o2,	%l4
	wr	%g0,	0x89,	%asi
	lduba	[%l7 + 0x10] %asi,	%i3
loop_1740:
	mulx	%i1,	0x0168,	%i4
	fbug	%fcc3,	loop_1741
	fmovd	%f28,	%f28
	fba,a	%fcc2,	loop_1742
	sethi	0x092C,	%o1
loop_1741:
	nop
	wr	%g0,	0x2f,	%asi
	stda	%o2,	[%l7 + 0x10] %asi
	membar	#Sync
loop_1742:
	tge	%xcc,	0x7
	bn	loop_1743
	ldx	[%l7 + 0x08],	%g5
	edge8ln	%l0,	%l6,	%g2
	siam	0x0
loop_1743:
	nop
	wr	%g0,	0x81,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	ld	[%l7 + 0x50],	%f8
	addccc	%o0,	%o6,	%l1
	sethi	0x0B33,	%i6
	fbg	%fcc3,	loop_1744
	tpos	%xcc,	0x4
	udivcc	%g3,	0x0105,	%o5
	wr	%g0,	0x22,	%asi
	stda	%l2,	[%l7 + 0x78] %asi
	membar	#Sync
loop_1744:
	orcc	%i0,	0x1AE7,	%g4
	fbg	%fcc3,	loop_1745
	fbg	%fcc0,	loop_1746
	fmovsle	%icc,	%f10,	%f16
	fmovdl	%xcc,	%f31,	%f28
loop_1745:
	movpos	%icc,	%g1,	%g7
loop_1746:
	udiv	%i2,	0x1EDF,	%i5
	set	0x1C, %l5
	stba	%l3,	[%l7 + %l5] 0x2b
	membar	#Sync
	ba,a	%xcc,	loop_1747
	sll	%o7,	%i7,	%g6
	movvs	%icc,	%l5,	%o2
	tcs	%icc,	0x7
loop_1747:
	nop
	wr	%g0,	0x10,	%asi
	ldxa	[%l7 + 0x68] %asi,	%l4
	fsrc1s	%f31,	%f30
	sethi	0x0D45,	%i3
	movcc	%icc,	%o4,	%i1
	array32	%i4,	%o3,	%g5
	smul	%o1,	%l0,	%g2
	udivx	%o0,	0x07C9,	%l6
	andncc	%l1,	%o6,	%g3
	addc	%i6,	%l2,	%o5
	lduh	[%l7 + 0x46],	%i0
	mulscc	%g4,	%g7,	%g1
	subccc	%i5,	%i2,	%l3
	wr	%g0,	0x89,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	ldsh	[%l7 + 0x5E],	%o7
	sdivcc	%i7,	0x0CCD,	%g6
	tsubcc	%l5,	%l4,	%o2
	fmovdn	%icc,	%f20,	%f11
	movn	%icc,	%o4,	%i3
	fmuld8sux16	%f29,	%f13,	%f10
	xorcc	%i4,	0x0DD2,	%o3
	taddcctv	%i1,	%g5,	%o1
	sdivx	%g2,	0x086F,	%o0
	fcmpne32	%f20,	%f0,	%l0
	fpack16	%f2,	%f15
	srl	%l6,	0x09,	%l1
	fnot2s	%f20,	%f14
	movneg	%icc,	%o6,	%i6
	std	%l2,	[%l7 + 0x50]
	andn	%o5,	0x1A50,	%i0
	edge16n	%g3,	%g4,	%g1
	ldsb	[%l7 + 0x77],	%g7
	wr	%g0,	0x2a,	%asi
	ldda	[%l7 + 0x20] %asi,	%i4
	fble,a	%fcc0,	loop_1748
	mulx	%i2,	%o7,	%i7
	umul	%l3,	0x1020,	%g6
	fblg,a	%fcc3,	loop_1749
loop_1748:
	movre	%l4,	%o2,	%l5
	array8	%o4,	%i4,	%o3
	bvs	loop_1750
loop_1749:
	tcs	%icc,	0x6
	wr	%g0,	0x89,	%asi
	stwa	%i3,	[%l7 + 0x30] %asi
loop_1750:
	sethi	0x0CAF,	%i1
	smulcc	%g5,	0x044A,	%o1
	or	%o0,	%l0,	%l6
	ble,a	loop_1751
	movpos	%xcc,	%g2,	%o6
	fmovsge	%xcc,	%f2,	%f2
	stx	%l1,	[%l7 + 0x30]
loop_1751:
	edge32	%l2,	%o5,	%i6
	bvs,a,pn	%xcc,	loop_1752
	xnorcc	%g3,	%i0,	%g4
	add	%l7,	0x68,	%l6
	wr	%g0,	0x11,	%asi
	casa	[%l6] %asi,	%g1,	%g7
loop_1752:
	fbule	%fcc3,	loop_1753
	alignaddrl	%i2,	%i5,	%o7
	or	%i7,	0x1CDD,	%g6
	fmovdle	%xcc,	%f14,	%f29
loop_1753:
	array8	%l3,	%l4,	%o2
	fcmpne32	%f6,	%f16,	%l5
	fpack16	%f28,	%f21
	set	0x38, %l4
	ldxa	[%g0 + %l4] 0x20,	%i4
	fcmpne16	%f20,	%f24,	%o3
	edge16n	%i3,	%o4,	%i1
	fmovsne	%xcc,	%f25,	%f8
	bneg,a	loop_1754
	bne,a	loop_1755
	sth	%g5,	[%l7 + 0x48]
	tne	%xcc,	0x6
loop_1754:
	tcc	%xcc,	0x0
loop_1755:
	fmovrsgz	%o0,	%f8,	%f20
	fmovsneg	%icc,	%f9,	%f8
	edge32n	%o1,	%l0,	%g2
	array32	%l6,	%l1,	%o6
	movrlez	%o5,	0x24F,	%l2
	udivcc	%i6,	0x0733,	%i0
	tpos	%icc,	0x2
	fbe	%fcc0,	loop_1756
	and	%g4,	0x00EC,	%g1
	smul	%g7,	0x0C71,	%i2
	sir	0x0B77
loop_1756:
	tneg	%xcc,	0x2
	and	%g3,	%o7,	%i5
	te	%icc,	0x3
	orncc	%i7,	0x10B6,	%l3
	sdiv	%l4,	0x0F66,	%g6
	umul	%l5,	0x1D07,	%o2
	std	%i4,	[%l7 + 0x10]
	set	0x14, %i2
	sta	%f30,	[%l7 + %i2] 0x04
	edge8l	%o3,	%o4,	%i1
	fbo	%fcc3,	loop_1757
	addcc	%i3,	%o0,	%g5
	fmovdleu	%icc,	%f30,	%f18
	fmovdgu	%icc,	%f16,	%f0
loop_1757:
	add	%l0,	0x0471,	%o1
	sdivx	%l6,	0x0FA1,	%g2
	movcs	%xcc,	%o6,	%l1
	fxnors	%f17,	%f10,	%f7
	sll	%l2,	0x01,	%i6
	fmovdpos	%icc,	%f14,	%f24
	wr	%g0,	0x89,	%asi
	ldsha	[%l7 + 0x32] %asi,	%o5
	edge16ln	%i0,	%g4,	%g7
	tg	%xcc,	0x2
	fbug	%fcc0,	loop_1758
	lduh	[%l7 + 0x3E],	%i2
	andcc	%g1,	0x1DDD,	%g3
	edge16	%o7,	%i7,	%l3
loop_1758:
	ta	%xcc,	0x2
	fbul,a	%fcc1,	loop_1759
	fmul8x16	%f22,	%f4,	%f10
	edge32n	%l4,	%g6,	%l5
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
loop_1759:
	sub	%o2,	%i5,	%o3
	wr	%g0,	0x89,	%asi
	swapa	[%l7 + 0x54] %asi,	%i4
loop_1760:
	tsubcctv	%o4,	%i3,	%o0
	mulscc	%i1,	%g5,	%o1
	ldsh	[%l7 + 0x34],	%l0
	umul	%l6,	0x0F38,	%o6
	umul	%l1,	%l2,	%i6
	fcmple32	%f14,	%f10,	%o5
	set	0x7E, %i5
	stba	%g2,	[%l7 + %i5] 0x80
	fcmpd	%fcc0,	%f24,	%f14
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmpd	%fcc1,	%f26,	%f2
	movpos	%xcc,	%g4,	%i0
	wr	%g0,	0x81,	%asi
	stwa	%i2,	[%l7 + 0x70] %asi
	tneg	%icc,	0x7
	movgu	%icc,	%g7,	%g1
	fbne	%fcc0,	loop_1761
	stbar
	fsrc1	%f18,	%f10
	fmovda	%icc,	%f24,	%f26
loop_1761:
	edge32l	%g3,	%i7,	%o7
	udivcc	%l3,	0x1BC2,	%l4
	mova	%xcc,	%g6,	%o2
	edge32n	%l5,	%o3,	%i5
	movrne	%i4,	0x0DE,	%o4
	edge32ln	%o0,	%i1,	%i3
	tle	%xcc,	0x1
	fmovdn	%icc,	%f8,	%f16
	fmovdge	%icc,	%f28,	%f3
	udivx	%o1,	0x08A5,	%g5
	fmovrslez	%l6,	%f3,	%f25
	popc	%o6,	%l0
	movgu	%xcc,	%l2,	%l1
	ldstub	[%l7 + 0x1F],	%i6
	wr	%g0,	0x11,	%asi
	stha	%o5,	[%l7 + 0x1A] %asi
	wr	%g0,	0x04,	%asi
	ldxa	[%l7 + 0x30] %asi,	%g2
	edge16	%g4,	%i0,	%i2
	tcc	%icc,	0x3
	movrgez	%g7,	0x23D,	%g3
	fbul	%fcc0,	loop_1762
	fmovrdne	%i7,	%f30,	%f12
	wr	%g0,	0x19,	%asi
	ldsha	[%l7 + 0x78] %asi,	%o7
loop_1762:
	fnands	%f19,	%f19,	%f27
	call	loop_1763
	fmovscc	%icc,	%f2,	%f11
	wr	%g0,	0x89,	%asi
	stba	%g1,	[%l7 + 0x4A] %asi
loop_1763:
	bvc,a,pt	%icc,	loop_1764
	xnor	%l3,	%g6,	%o2
	tcc	%icc,	0x7
	sir	0x11F9
loop_1764:
	brgez	%l5,	loop_1765
	ldx	[%l7 + 0x68],	%o3
	bcc	%icc,	loop_1766
	edge16n	%l4,	%i4,	%i5
loop_1765:
	nop
	set	0x58, %l6
	ldxa	[%l7 + %l6] 0x88,	%o0
loop_1766:
	edge32l	%i1,	%o4,	%o1
	te	%xcc,	0x6
	addcc	%i3,	0x070B,	%g5
	edge8l	%o6,	%l6,	%l0
	fxor	%f16,	%f0,	%f26
	tvc	%icc,	0x2
	movgu	%xcc,	%l2,	%l1
	fbue,a	%fcc0,	loop_1767
	movn	%xcc,	%o5,	%i6
	fbne	%fcc3,	loop_1768
	flush	%l7 + 0x18
loop_1767:
	sra	%g4,	0x09,	%g2
	andncc	%i2,	%i0,	%g7
loop_1768:
	taddcctv	%g3,	%i7,	%o7
	fcmped	%fcc0,	%f2,	%f12
	fpadd32s	%f1,	%f2,	%f11
	set	0x8, %i7
	ldxa	[%g0 + %i7] 0x21,	%l3
	mova	%icc,	%g6,	%o2
	movg	%xcc,	%g1,	%o3
	fcmpeq32	%f24,	%f2,	%l5
	sub	%l4,	0x0E55,	%i5
	wr	%g0,	0x0c,	%asi
	swapa	[%l7 + 0x38] %asi,	%o0
	movrlez	%i1,	0x3C4,	%i4
	fmovd	%f14,	%f28
	wr	%g0,	0x27,	%asi
	stha	%o4,	[%l7 + 0x6C] %asi
	membar	#Sync
	mova	%icc,	%i3,	%g5
	fmovda	%xcc,	%f3,	%f28
	fcmpne16	%f10,	%f30,	%o6
	fbul,a	%fcc1,	loop_1769
	movne	%xcc,	%o1,	%l6
	edge16	%l0,	%l1,	%l2
	umul	%i6,	%o5,	%g2
loop_1769:
	smulcc	%g4,	%i2,	%i0
	fnot1	%f4,	%f30
	fmul8ulx16	%f6,	%f20,	%f14
	fbn	%fcc0,	loop_1770
	sdivcc	%g7,	0x0C17,	%i7
	movgu	%icc,	%g3,	%l3
	bpos	%icc,	loop_1771
loop_1770:
	edge8n	%o7,	%g6,	%o2
	membar	0x3B
	tcc	%icc,	0x0
loop_1771:
	brgz,a	%g1,	loop_1772
	tpos	%icc,	0x5
	tcc	%xcc,	0x3
	subcc	%l5,	0x04CA,	%o3
loop_1772:
	array8	%l4,	%o0,	%i1
	movre	%i5,	0x27A,	%i4
	fsrc2s	%f3,	%f14
	membar	0x1D
	fcmpeq16	%f30,	%f30,	%o4
	array16	%i3,	%o6,	%g5
	fcmpes	%fcc3,	%f1,	%f11
	fmovdgu	%xcc,	%f27,	%f17
	movrgz	%l6,	%o1,	%l1
	fmul8sux16	%f18,	%f6,	%f0
	edge16ln	%l0,	%l2,	%o5
	addc	%i6,	0x191F,	%g4
	nop
	setx	loop_1773,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fabss	%f7,	%f24
	fmovrdlez	%i2,	%f14,	%f12
	call	loop_1774
loop_1773:
	udivcc	%i0,	0x1358,	%g2
	tneg	%xcc,	0x0
	edge16n	%g7,	%i7,	%l3
loop_1774:
	ldd	[%l7 + 0x40],	%f8
	sra	%o7,	0x1C,	%g3
	tvc	%xcc,	0x6
	membar	0x04
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddrl	%g6,	%g1,	%o2
	movpos	%xcc,	%l5,	%o3
	array32	%o0,	%i1,	%l4
	popc	%i4,	%o4
	tneg	%icc,	0x5
	mulscc	%i5,	%i3,	%g5
	fba,a	%fcc1,	loop_1775
	nop
	setx loop_1776, %l0, %l1
	jmpl %l1, %o6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fandnot2	%f24,	%f8,	%f30
loop_1775:
	fone	%f12
loop_1776:
	move	%xcc,	%l6,	%l1
	te	%xcc,	0x3
	ld	[%l7 + 0x34],	%f26
	andncc	%o1,	%l2,	%l0
	set	0x4A, %g1
	ldsha	[%l7 + %g1] 0x15,	%o5
	udiv	%i6,	0x019E,	%g4
	array8	%i0,	%i2,	%g7
	movrlz	%g2,	0x0CF,	%i7
	bge	loop_1777
	fnot2	%f12,	%f14
	smulcc	%l3,	0x116A,	%o7
	wr	%g0,	0x04,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
loop_1777:
	taddcctv	%g6,	0x1804,	%g1
	bge	%xcc,	loop_1778
	tneg	%xcc,	0x2
	udivcc	%g3,	0x0F6F,	%l5
	fmovda	%icc,	%f5,	%f1
loop_1778:
	or	%o3,	%o2,	%i1
	srl	%o0,	%l4,	%o4
	fmovdg	%icc,	%f10,	%f26
	mulscc	%i4,	%i5,	%g5
	ldd	[%l7 + 0x40],	%i2
	wr	%g0,	0xf9,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
	tle	%icc,	0x3
	fbul,a	%fcc1,	loop_1779
	xnor	%o6,	%l1,	%l6
	edge8ln	%o1,	%l0,	%o5
	udiv	%l2,	0x1A38,	%i6
loop_1779:
	bneg,pt	%icc,	loop_1780
	taddcctv	%i0,	%g4,	%i2
	movpos	%xcc,	%g2,	%g7
	array32	%l3,	%i7,	%g6
loop_1780:
	ld	[%l7 + 0x14],	%f21
	andcc	%g1,	%o7,	%l5
	wr	%g0,	0x10,	%asi
	ldxa	[%l7 + 0x70] %asi,	%o3
	sir	0x082A
	bcc,a	%xcc,	loop_1781
	alignaddr	%g3,	%o2,	%i1
	udivx	%o0,	0x1685,	%o4
	subccc	%l4,	0x0CD8,	%i5
loop_1781:
	ldsw	[%l7 + 0x78],	%i4
	mova	%icc,	%i3,	%g5
	ldx	[%l7 + 0x18],	%l1
	movg	%xcc,	%o6,	%l6
	edge32l	%l0,	%o5,	%l2
	fmovrdne	%o1,	%f14,	%f26
	fxors	%f13,	%f13,	%f16
	umulcc	%i0,	0x13F8,	%g4
	fbge,a	%fcc0,	loop_1782
	sethi	0x0AA2,	%i2
	srl	%i6,	%g2,	%l3
	movleu	%icc,	%i7,	%g7
loop_1782:
	movne	%icc,	%g6,	%g1
	udivx	%l5,	0x14FA,	%o3
	edge16l	%o7,	%o2,	%i1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addcc	%g3,	0x056D,	%o0
	subccc	%o4,	0x0B1A,	%l4
	nop
	setx	loop_1783,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	bvs,pn	%icc,	loop_1784
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ld	[%l7 + 0x68],	%f14
loop_1783:
	ldd	[%l7 + 0x40],	%f6
loop_1784:
	xor	%i5,	%i3,	%g5
	set	0x62, %o1
	ldsha	[%l7 + %o1] 0x18,	%i4
	andcc	%o6,	%l1,	%l0
	bge	%icc,	loop_1785
	addccc	%l6,	%o5,	%l2
	fmovsvs	%xcc,	%f21,	%f29
	movl	%icc,	%i0,	%g4
loop_1785:
	popc	%o1,	%i6
	alignaddr	%g2,	%i2,	%i7
	addc	%g7,	%l3,	%g6
	fands	%f7,	%f17,	%f28
	bneg,a	loop_1786
	array8	%l5,	%g1,	%o7
	subc	%o3,	0x118D,	%o2
	fmovdgu	%xcc,	%f13,	%f30
loop_1786:
	edge8l	%g3,	%o0,	%i1
	smulcc	%l4,	%i5,	%o4
	array8	%i3,	%g5,	%i4
	bl,a,pn	%xcc,	loop_1787
	nop
	setx	loop_1788,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fbuge,a	%fcc2,	loop_1789
	fpadd32s	%f24,	%f17,	%f5
loop_1787:
	srlx	%o6,	0x11,	%l1
loop_1788:
	nop
	wr	%g0,	0x2a,	%asi
	stha	%l0,	[%l7 + 0x62] %asi
	membar	#Sync
loop_1789:
	umulcc	%l6,	0x0CFC,	%l2
	array16	%i0,	%g4,	%o5
	siam	0x7
	movrne	%o1,	0x39E,	%g2
	array8	%i6,	%i2,	%i7
	fones	%f26
	and	%l3,	%g7,	%l5
	fbue,a	%fcc0,	loop_1790
	movgu	%icc,	%g1,	%g6
	fnegs	%f20,	%f6
	sllx	%o7,	%o3,	%o2
loop_1790:
	movneg	%icc,	%g3,	%o0
	movleu	%icc,	%l4,	%i1
	array8	%o4,	%i5,	%g5
	andn	%i4,	0x1580,	%i3
	xnorcc	%o6,	%l0,	%l6
	sdiv	%l2,	0x08DD,	%l1
	fmovdleu	%xcc,	%f1,	%f11
	sth	%i0,	[%l7 + 0x76]
	sllx	%o5,	%g4,	%o1
	te	%xcc,	0x5
	orcc	%i6,	0x0D16,	%g2
	smulcc	%i2,	%i7,	%g7
	bgu	%xcc,	loop_1791
	smul	%l3,	0x056B,	%l5
	fmovsg	%xcc,	%f14,	%f6
	sll	%g1,	0x0C,	%g6
loop_1791:
	fmovrsne	%o7,	%f16,	%f3
	wr	%g0,	0x80,	%asi
	swapa	[%l7 + 0x54] %asi,	%o2
	membar	0x42
	nop
	set	0x28, %g4
	ldd	[%l7 + %g4],	%f18
	fmovspos	%icc,	%f31,	%f31
	movvs	%xcc,	%o3,	%g3
	fbo,a	%fcc3,	loop_1792
	edge32	%o0,	%i1,	%l4
	mova	%icc,	%o4,	%i5
	taddcctv	%i4,	%i3,	%g5
loop_1792:
	alignaddr	%o6,	%l0,	%l6
	edge8l	%l2,	%l1,	%i0
	or	%o5,	%o1,	%g4
	andn	%g2,	%i2,	%i6
	tl	%xcc,	0x5
	movge	%xcc,	%i7,	%l3
	xnor	%l5,	%g7,	%g6
	fnor	%f16,	%f26,	%f24
	bvc,a,pn	%icc,	loop_1793
	move	%xcc,	%o7,	%o2
	sdivx	%o3,	0x1EE3,	%g1
	sdivx	%o0,	0x18E1,	%g3
loop_1793:
	movre	%l4,	0x094,	%i1
	movle	%icc,	%o4,	%i5
	fmovrdgez	%i4,	%f18,	%f30
	nop
	setx	loop_1794,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fmovscc	%icc,	%f25,	%f5
	fmul8x16au	%f29,	%f23,	%f14
	andcc	%i3,	0x030C,	%o6
loop_1794:
	fmuld8sux16	%f27,	%f30,	%f26
	bvc,a	%xcc,	loop_1795
	tl	%icc,	0x4
	fmovscc	%icc,	%f6,	%f21
	udivcc	%g5,	0x0B00,	%l6
loop_1795:
	alignaddr	%l0,	%l1,	%i0
	fmovrdne	%l2,	%f20,	%f16
	fmovdl	%icc,	%f21,	%f6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbg	%fcc0,	loop_1796
	tcs	%xcc,	0x1
	movrne	%o1,	0x102,	%g4
	movleu	%icc,	%g2,	%i2
loop_1796:
	udivx	%i6,	0x166E,	%i7
	fbu,a	%fcc2,	loop_1797
	addcc	%o5,	%l3,	%g7
	ta	%xcc,	0x1
	fmul8x16au	%f0,	%f7,	%f12
loop_1797:
	ldsb	[%l7 + 0x4E],	%l5
	fmovsle	%icc,	%f30,	%f10
	tcc	%icc,	0x4
	tge	%icc,	0x3
	movgu	%xcc,	%g6,	%o2
	fmovsle	%icc,	%f1,	%f22
	fmovde	%icc,	%f8,	%f29
	movl	%xcc,	%o7,	%g1
	array8	%o3,	%g3,	%l4
	edge32ln	%o0,	%o4,	%i1
	ldsw	[%l7 + 0x3C],	%i4
	movle	%icc,	%i3,	%i5
	flush	%l7 + 0x64
	fandnot2s	%f0,	%f4,	%f1
	fbn	%fcc1,	loop_1798
	xnorcc	%g5,	%o6,	%l6
	fmovsge	%xcc,	%f9,	%f7
	edge32n	%l0,	%i0,	%l2
loop_1798:
	fnegs	%f23,	%f21
	bleu,a	%icc,	loop_1799
	fpadd16	%f12,	%f26,	%f14
	alignaddrl	%o1,	%l1,	%g4
	andn	%i2,	0x055E,	%g2
loop_1799:
	be	loop_1800
	fpsub32	%f0,	%f20,	%f8
	edge16l	%i7,	%o5,	%l3
	bne,a,pn	%xcc,	loop_1801
loop_1800:
	edge32n	%i6,	%g7,	%g6
	tsubcctv	%l5,	0x06C5,	%o7
	orn	%g1,	%o3,	%o2
loop_1801:
	ldd	[%l7 + 0x60],	%f2
	nop 	! 	nop 	! 	wr	%g0,	0x40,	%asi ripped by fixASI40.pl ripped by fixASI40.pl
	nop 	! 	nop 	! 	stxa	%l4,	[%g0 + 0x1f0] %asi ripped by fixASI40.pl ripped by fixASI40.pl
	orncc	%o0,	0x01E8,	%g3
	movrgez	%i1,	0x1ED,	%o4
	wr	%g0,	0x89,	%asi
	stwa	%i3,	[%l7 + 0x28] %asi
	fmovdvc	%xcc,	%f23,	%f3
	fble,a	%fcc3,	loop_1802
	membar	0x5B
	andncc	%i5,	%i4,	%o6
	tn	%xcc,	0x7
loop_1802:
	ta	%xcc,	0x6
	fmovrse	%g5,	%f21,	%f12
	tcc	%icc,	0x7
	fnot1s	%f10,	%f6
	fands	%f25,	%f6,	%f22
	be,pt	%icc,	loop_1803
	movre	%l0,	%l6,	%i0
	movgu	%icc,	%o1,	%l2
	srlx	%l1,	0x0F,	%g4
loop_1803:
	movgu	%xcc,	%i2,	%i7
	fmovsne	%xcc,	%f13,	%f8
	set	0x0C, %i3
	stha	%g2,	[%l7 + %i3] 0x15
	popc	%o5,	%l3
	movl	%icc,	%i6,	%g6
	array32	%l5,	%o7,	%g1
	movneg	%icc,	%g7,	%o2
	movrgez	%l4,	%o3,	%g3
	fcmpne32	%f22,	%f24,	%o0
	fcmple32	%f26,	%f10,	%o4
	edge16n	%i3,	%i5,	%i1
	edge8ln	%o6,	%i4,	%l0
	tge	%xcc,	0x4
	movl	%icc,	%g5,	%i0
	array32	%l6,	%o1,	%l2
	tg	%icc,	0x4
	move	%xcc,	%l1,	%i2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrdlez	%i7,	%f16,	%f10
	orncc	%g4,	0x0C88,	%g2
	tsubcctv	%l3,	0x08A9,	%i6
	sdivx	%g6,	0x0B3D,	%l5
	edge32n	%o7,	%o5,	%g7
	umulcc	%g1,	%l4,	%o2
	fbul,a	%fcc1,	loop_1804
	xnor	%o3,	%o0,	%g3
	sdiv	%o4,	0x0A4B,	%i5
	fcmpne16	%f4,	%f12,	%i1
loop_1804:
	orcc	%o6,	0x1304,	%i4
	sub	%i3,	%l0,	%i0
	movn	%icc,	%g5,	%o1
	brz	%l2,	loop_1805
	addcc	%l6,	0x0C8A,	%l1
	subc	%i7,	0x1A5F,	%i2
	smulcc	%g2,	%g4,	%i6
loop_1805:
	andcc	%g6,	0x1AEF,	%l3
	fbul	%fcc3,	loop_1806
	xnorcc	%o7,	0x1523,	%o5
	sdiv	%g7,	0x1291,	%g1
	andn	%l4,	0x060D,	%l5
loop_1806:
	bl	loop_1807
	tg	%icc,	0x3
	brlez,a	%o2,	loop_1808
	udivx	%o0,	0x14F6,	%g3
loop_1807:
	fmovrde	%o4,	%f18,	%f8
	sethi	0x07D0,	%i5
loop_1808:
	fmovrslez	%o3,	%f26,	%f11
	wr	%g0,	0x50,	%asi
	ldxa	[%g0 + 0x18] %asi,	%o6
	tvs	%xcc,	0x3
	srl	%i4,	%i3,	%i1
	subc	%l0,	0x1FDF,	%g5
	fcmpd	%fcc1,	%f20,	%f4
	movrgez	%i0,	0x11E,	%o1
	taddcc	%l2,	%l6,	%i7
	bgu	loop_1809
	fmovdn	%icc,	%f16,	%f9
	andcc	%l1,	0x1502,	%g2
	array8	%g4,	%i6,	%i2
loop_1809:
	movre	%g6,	%l3,	%o7
	fbuge	%fcc1,	loop_1810
	addccc	%o5,	%g7,	%l4
	set	0x53, %o3
	stba	%g1,	[%l7 + %o3] 0x88
loop_1810:
	movpos	%xcc,	%l5,	%o0
	sub	%g3,	%o2,	%o4
	tvs	%xcc,	0x0
	fsrc2s	%f18,	%f2
	umulcc	%o3,	%o6,	%i5
	edge32ln	%i4,	%i1,	%i3
	fandnot2s	%f31,	%f6,	%f16
	tgu	%icc,	0x1
	orncc	%g5,	0x152D,	%l0
	fbge	%fcc1,	loop_1811
	subc	%i0,	0x147F,	%l2
	xnorcc	%l6,	%i7,	%o1
	fmovdle	%icc,	%f31,	%f20
loop_1811:
	or	%g2,	0x0AB9,	%l1
	edge32n	%g4,	%i6,	%g6
	fmovsa	%icc,	%f6,	%f12
	fsrc2s	%f31,	%f23
	bpos,pn	%xcc,	loop_1812
	tvc	%xcc,	0x5
	ba,a,pn	%xcc,	loop_1813
	fmovda	%xcc,	%f11,	%f12
loop_1812:
	sub	%l3,	0x072B,	%i2
	srlx	%o5,	%o7,	%g7
loop_1813:
	bgu,pt	%xcc,	loop_1814
	fmovdl	%xcc,	%f11,	%f9
	fnand	%f28,	%f0,	%f26
	array16	%l4,	%g1,	%l5
loop_1814:
	te	%xcc,	0x2
	fmovrslez	%g3,	%f22,	%f17
	fmovrdgz	%o0,	%f28,	%f24
	tleu	%xcc,	0x0
	wr	%g0,	0x89,	%asi
	lduha	[%l7 + 0x46] %asi,	%o2
	fbg	%fcc0,	loop_1815
	fpadd16	%f6,	%f26,	%f26
	fmovdge	%icc,	%f27,	%f30
	movcs	%icc,	%o4,	%o3
loop_1815:
	movne	%xcc,	%i5,	%i4
	sub	%o6,	%i1,	%i3
	edge8	%l0,	%i0,	%l2
	fmovda	%icc,	%f21,	%f17
	ldstub	[%l7 + 0x40],	%g5
	bg,a,pt	%xcc,	loop_1816
	umul	%i7,	%l6,	%o1
	srlx	%l1,	0x14,	%g4
	orn	%g2,	%g6,	%l3
loop_1816:
	bvs,pt	%xcc,	loop_1817
	array32	%i2,	%i6,	%o7
	mova	%xcc,	%g7,	%o5
	tcs	%xcc,	0x1
loop_1817:
	fabsd	%f18,	%f2
	addcc	%g1,	%l5,	%g3
	bvs,a,pn	%icc,	loop_1818
	tvs	%icc,	0x7
	fbu	%fcc2,	loop_1819
	fmovrdlz	%o0,	%f0,	%f8
loop_1818:
	tleu	%icc,	0x0
	movcc	%xcc,	%o2,	%o4
loop_1819:
	orn	%l4,	0x10AE,	%o3
	addc	%i4,	%o6,	%i5
	subcc	%i1,	0x0862,	%i3
	fmovscc	%icc,	%f15,	%f25
	edge8n	%i0,	%l2,	%l0
	set	0x210, %g5
	ldxa	[%g0 + %g5] 0x52,	%g5
	wr	%g0,	0x2b,	%asi
	stxa	%l6,	[%l7 + 0x48] %asi
	membar	#Sync
	edge32n	%o1,	%l1,	%g4
	move	%icc,	%g2,	%i7
	tg	%icc,	0x4
	ldsb	[%l7 + 0x24],	%l3
	movvs	%xcc,	%i2,	%g6
	fcmpeq16	%f16,	%f14,	%o7
	movneg	%xcc,	%g7,	%o5
	fbue	%fcc0,	loop_1820
	orncc	%g1,	%l5,	%i6
	andn	%o0,	0x007D,	%o2
	alignaddrl	%g3,	%o4,	%l4
loop_1820:
	tneg	%icc,	0x5
	addc	%i4,	%o3,	%i5
	and	%o6,	%i1,	%i3
	tne	%xcc,	0x7
	movl	%icc,	%i0,	%l2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srlx	%g5,	%l6,	%l0
	movrne	%o1,	%l1,	%g2
	edge16l	%g4,	%l3,	%i7
	sllx	%g6,	%i2,	%o7
	nop
	set	0x7E, %o5
	lduh	[%l7 + %o5],	%o5
	fcmple32	%f18,	%f14,	%g1
	movle	%xcc,	%l5,	%i6
	nop
	setx loop_1821, %l0, %l1
	jmpl %l1, %g7
	tg	%icc,	0x2
	fbuge,a	%fcc1,	loop_1822
	fpsub32s	%f12,	%f4,	%f12
loop_1821:
	edge8ln	%o2,	%o0,	%g3
	set	0x18, %o0
	stwa	%l4,	[%l7 + %o0] 0x0c
loop_1822:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdpos	%icc,	%f15,	%f29
	or	%o4,	%i4,	%i5
	andncc	%o3,	%o6,	%i1
	srax	%i0,	0x01,	%i3
	edge8l	%g5,	%l2,	%l6
	mova	%xcc,	%o1,	%l0
	fcmps	%fcc0,	%f7,	%f15
	sdivx	%g2,	0x1B04,	%g4
	srlx	%l3,	%l1,	%g6
	tneg	%icc,	0x1
	fornot1	%f18,	%f26,	%f22
	fandnot1s	%f22,	%f4,	%f8
	fmul8x16	%f24,	%f16,	%f18
	array16	%i7,	%o7,	%o5
	set	0x48, %g2
	stxa	%g1,	[%l7 + %g2] 0x80
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
	movvs	%xcc,	%i2,	%l5
	membar	0x1B
	edge16ln	%i6,	%g7,	%o2
loop_1823:
	nop
	set	0x4A, %l0
	ldsba	[%l7 + %l0] 0x19,	%g3
	edge32n	%o0,	%o4,	%i4
	tcs	%icc,	0x3
	fzeros	%f25
	tne	%icc,	0x4
	srl	%i5,	%l4,	%o3
	call	loop_1824
	sllx	%i1,	0x05,	%i0
	fpsub16s	%f19,	%f14,	%f28
	tsubcctv	%o6,	%i3,	%l2
loop_1824:
	movrgz	%l6,	0x1E5,	%o1
	set	0x40, %l1
	ldda	[%l7 + %l1] 0x10,	%f0
	edge32ln	%l0,	%g5,	%g2
	fexpand	%f5,	%f30
	ta	%xcc,	0x1
	umulcc	%g4,	%l1,	%l3
	nop
	setx	loop_1825,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fbul,a	%fcc0,	loop_1826
	edge16l	%i7,	%g6,	%o5
	fsrc2s	%f13,	%f30
loop_1825:
	movgu	%icc,	%o7,	%g1
loop_1826:
	ld	[%l7 + 0x54],	%f28
	umul	%i2,	%l5,	%i6
	umulcc	%g7,	0x0A6C,	%g3
	swap	[%l7 + 0x68],	%o0
	fble,a	%fcc2,	loop_1827
	xnorcc	%o2,	%i4,	%i5
	bgu,pn	%icc,	loop_1828
	tg	%xcc,	0x3
loop_1827:
	tn	%icc,	0x5
	lduw	[%l7 + 0x78],	%l4
loop_1828:
	movleu	%icc,	%o3,	%o4
	array32	%i1,	%o6,	%i0
	tneg	%icc,	0x1
	pdist	%f16,	%f2,	%f30
	fmovrdgz	%l2,	%f10,	%f4
	edge16n	%l6,	%i3,	%l0
	wr	%g0,	0x89,	%asi
	ldsba	[%l7 + 0x3D] %asi,	%o1
	andcc	%g5,	0x0A6C,	%g4
	sra	%g2,	%l3,	%i7
	movrne	%l1,	0x1FC,	%g6
	fcmped	%fcc2,	%f22,	%f10
	fmovdneg	%xcc,	%f9,	%f31
	movvs	%xcc,	%o5,	%o7
	call	loop_1829
	array8	%g1,	%l5,	%i6
	fmovsleu	%icc,	%f5,	%f21
	stw	%g7,	[%l7 + 0x1C]
loop_1829:
	umulcc	%i2,	0x11FB,	%g3
	wr	%g0,	0x89,	%asi
	ldda	[%l7 + 0x10] %asi,	%o2
	set	0x70, %g3
	ldda	[%l7 + %g3] 0x24,	%o0
	fxors	%f13,	%f9,	%f28
	edge32l	%i5,	%i4,	%l4
	fpadd16	%f14,	%f26,	%f16
	movrgz	%o4,	%i1,	%o3
	bcs,a,pt	%xcc,	loop_1830
	fcmple32	%f12,	%f28,	%o6
	bg,a	loop_1831
	andn	%i0,	%l6,	%i3
loop_1830:
	movrgez	%l2,	%o1,	%g5
	or	%g4,	0x1DA0,	%g2
loop_1831:
	nop
	wr	%g0,	0x89,	%asi
	ldstuba	[%l7 + 0x7D] %asi,	%l3
	tne	%xcc,	0x5
	movg	%icc,	%i7,	%l1
	andncc	%g6,	%o5,	%l0
	set	0x4E, %l2
	stha	%g1,	[%l7 + %l2] 0x11
	nop
	setx	loop_1832,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fandnot2	%f12,	%f26,	%f10
	andncc	%l5,	%o7,	%g7
	tcc	%xcc,	0x1
loop_1832:
	fbne,a	%fcc2,	loop_1833
	ldd	[%l7 + 0x68],	%i2
	fmovsgu	%xcc,	%f0,	%f5
	alignaddr	%g3,	%i6,	%o0
loop_1833:
	movle	%icc,	%o2,	%i5
	mova	%icc,	%l4,	%o4
	tne	%xcc,	0x6
	movle	%icc,	%i4,	%i1
	movrgz	%o6,	%i0,	%o3
	movrlez	%l6,	0x273,	%l2
	movrne	%i3,	0x335,	%g5
	sth	%g4,	[%l7 + 0x10]
	prefetch	[%l7 + 0x4C],	 0x1
	movpos	%icc,	%g2,	%o1
	andncc	%l3,	%l1,	%i7
	tsubcc	%g6,	%o5,	%l0
	array32	%l5,	%o7,	%g7
	sdivcc	%g1,	0x1B7E,	%g3
	edge8n	%i6,	%i2,	%o0
	xor	%i5,	0x03A5,	%l4
	sethi	0x160E,	%o4
	move	%xcc,	%o2,	%i1
	sdivcc	%i4,	0x16E4,	%i0
	andncc	%o3,	%o6,	%l6
	fcmps	%fcc2,	%f22,	%f25
	wr	%g0,	0x88,	%asi
	ldswa	[%l7 + 0x40] %asi,	%l2
	set	0x20, %l3
	ldda	[%l7 + %l3] 0xeb,	%g4
	xnor	%i3,	%g4,	%g2
	edge16ln	%l3,	%o1,	%l1
	tl	%icc,	0x0
	udivx	%g6,	0x192E,	%i7
	tvs	%xcc,	0x4
	bcc,a	%icc,	loop_1834
	flush	%l7 + 0x10
	nop
	setx	loop_1835,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	udivx	%l0,	0x16B7,	%o5
loop_1834:
	array16	%o7,	%g7,	%g1
	bgu,a,pn	%icc,	loop_1836
loop_1835:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldd	[%l7 + 0x30],	%f18
	set	0x4E, %i6
	ldsha	[%l7 + %i6] 0x80,	%g3
loop_1836:
	fbne,a	%fcc0,	loop_1837
	bleu,a	%icc,	loop_1838
	subc	%l5,	%i6,	%o0
	movvc	%xcc,	%i5,	%l4
loop_1837:
	movle	%xcc,	%o4,	%i2
loop_1838:
	lduw	[%l7 + 0x10],	%i1
	andn	%o2,	0x1BF5,	%i4
	fabsd	%f28,	%f2
	taddcc	%i0,	%o3,	%o6
	movrlz	%l2,	0x27D,	%l6
	taddcc	%i3,	0x1C64,	%g4
	srax	%g5,	%g2,	%o1
	taddcc	%l3,	0x0279,	%l1
	ba,a,pn	%icc,	loop_1839
	movneg	%xcc,	%g6,	%i7
	bleu,a	loop_1840
	fmovsvs	%icc,	%f31,	%f30
loop_1839:
	movge	%xcc,	%l0,	%o5
	edge16ln	%g7,	%o7,	%g3
loop_1840:
	fmovsg	%xcc,	%f17,	%f23
	brnz	%g1,	loop_1841
	orcc	%l5,	0x18C7,	%o0
	ldd	[%l7 + 0x40],	%i6
	edge32	%l4,	%i5,	%i2
loop_1841:
	edge32n	%o4,	%i1,	%o2
	bpos,pn	%xcc,	loop_1842
	ldsh	[%l7 + 0x70],	%i0
	fnegs	%f13,	%f2
	movrlez	%o3,	%o6,	%i4
loop_1842:
	smul	%l6,	%l2,	%g4
	edge8l	%g5,	%g2,	%i3
	set	0x40, %g6
	stha	%l3,	[%l7 + %g6] 0x89
	addcc	%o1,	%g6,	%l1
	movrgez	%i7,	%o5,	%l0
	movg	%icc,	%g7,	%o7
	fands	%f13,	%f16,	%f21
	movne	%icc,	%g3,	%l5
	sdivcc	%o0,	0x149A,	%i6
	edge8n	%l4,	%i5,	%i2
	swap	[%l7 + 0x64],	%g1
	set	0x28, %o4
	lda	[%l7 + %o4] 0x19,	%f6
	wr	%g0,	0x04,	%asi
	ldsha	[%l7 + 0x2E] %asi,	%o4
	orn	%i1,	0x1B11,	%i0
	edge32l	%o2,	%o3,	%i4
	fzero	%f22
	tcs	%icc,	0x4
	te	%xcc,	0x4
	taddcctv	%l6,	%l2,	%g4
	movrlez	%g5,	%o6,	%g2
	movneg	%xcc,	%i3,	%l3
	udivx	%o1,	0x00D1,	%l1
	tn	%icc,	0x2
	andcc	%g6,	%o5,	%l0
	fbu	%fcc3,	loop_1843
	pdist	%f20,	%f2,	%f6
	edge16ln	%g7,	%i7,	%o7
	fba,a	%fcc2,	loop_1844
loop_1843:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32ln	%g3,	%o0,	%i6
	set	0x1C, %o2
	swapa	[%l7 + %o2] 0x81,	%l4
loop_1844:
	tge	%xcc,	0x1
	add	%l5,	%i2,	%g1
	andn	%i5,	0x05FE,	%i1
	fmovsneg	%icc,	%f13,	%f6
	andn	%o4,	%o2,	%o3
	srl	%i4,	0x11,	%i0
	fnot1	%f12,	%f26
	add	%l7,	0x50,	%l6
	wr	%g0,	0x18,	%asi
	casa	[%l6] 0x18,	%l2,	%l6
	movgu	%xcc,	%g4,	%g5
	movvc	%xcc,	%o6,	%g2
	orncc	%l3,	0x195D,	%i3
	tcc	%icc,	0x3
	movle	%icc,	%o1,	%l1
	tleu	%icc,	0x3
	fors	%f13,	%f14,	%f8
	taddcctv	%o5,	0x1EA9,	%g6
	subcc	%l0,	0x0D75,	%i7
	umul	%g7,	%g3,	%o7
	addc	%o0,	%i6,	%l4
	fcmpne32	%f28,	%f18,	%i2
	movcs	%xcc,	%g1,	%l5
	or	%i1,	%i5,	%o4
	fmovrse	%o2,	%f9,	%f2
	fmovdpos	%icc,	%f8,	%f12
	andn	%i4,	0x107C,	%i0
	udivx	%l2,	0x16B5,	%o3
	tne	%xcc,	0x2
	movge	%icc,	%l6,	%g5
	fcmpes	%fcc3,	%f29,	%f17
	ldstub	[%l7 + 0x27],	%o6
	add	%g4,	%g2,	%l3
	fabsd	%f26,	%f12
	fbue	%fcc3,	loop_1845
	fmovdleu	%icc,	%f6,	%f28
	sir	0x1F35
	prefetch	[%l7 + 0x24],	 0x1
loop_1845:
	tpos	%xcc,	0x0
	bcc,a,pt	%xcc,	loop_1846
	subc	%i3,	%l1,	%o5
	fmovrsgez	%o1,	%f15,	%f19
	movl	%xcc,	%g6,	%l0
loop_1846:
	nop
	wr	%g0,	0x89,	%asi
	lduha	[%l7 + 0x64] %asi,	%i7
	udivcc	%g3,	0x19CA,	%o7
	fpmerge	%f22,	%f3,	%f28
	fnot1s	%f10,	%f30
	fbl	%fcc1,	loop_1847
	tpos	%icc,	0x6
	movvs	%icc,	%o0,	%g7
	taddcctv	%i6,	%l4,	%i2
loop_1847:
	fbl	%fcc2,	loop_1848
	tpos	%xcc,	0x7
	taddcc	%g1,	%l5,	%i1
	tl	%xcc,	0x0
loop_1848:
	bne,a	%icc,	loop_1849
	tn	%xcc,	0x6
	set	0x58, %o7
	stda	%o4,	[%l7 + %o7] 0x89
loop_1849:
	fmovse	%xcc,	%f28,	%f14
	te	%xcc,	0x2
	ld	[%l7 + 0x3C],	%f22
	array32	%i5,	%o2,	%i0
	addcc	%i4,	0x1B61,	%o3
	set	0x20, %i1
	ldda	[%l7 + %i1] 0x26,	%l2
	subc	%g5,	%l6,	%o6
	sllx	%g2,	0x1F,	%g4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tneg	%icc,	0x2
	orncc	%i3,	0x0AF7,	%l3
	fmovrdgz	%o5,	%f12,	%f10
	fpsub16s	%f25,	%f18,	%f8
	set	0x38, %o6
	swapa	[%l7 + %o6] 0x89,	%o1
	edge8n	%l1,	%l0,	%g6
	pdist	%f16,	%f0,	%f2
	ba,a	loop_1850
	tsubcctv	%g3,	%o7,	%i7
	taddcctv	%g7,	0x0F18,	%o0
	sub	%i6,	%i2,	%l4
loop_1850:
	taddcc	%l5,	%i1,	%o4
	edge8n	%i5,	%o2,	%i0
	bge,pt	%icc,	loop_1851
	udiv	%g1,	0x1DD7,	%i4
	sethi	0x1E46,	%o3
	subccc	%l2,	%g5,	%o6
loop_1851:
	edge8l	%g2,	%g4,	%l6
	fmovsgu	%icc,	%f30,	%f16
	fbu,a	%fcc2,	loop_1852
	fmul8x16al	%f7,	%f9,	%f14
	wr	%g0,	0xea,	%asi
	stda	%i2,	[%l7 + 0x28] %asi
	membar	#Sync
loop_1852:
	movcc	%xcc,	%o5,	%o1
	nop
	setx	loop_1853,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movvs	%xcc,	%l1,	%l0
	bpos,pt	%xcc,	loop_1854
	addccc	%l3,	0x037E,	%g6
loop_1853:
	nop
	set	0x53, %g7
	stba	%o7,	[%l7 + %g7] 0x10
loop_1854:
	mova	%xcc,	%i7,	%g3
	wr	%g0,	0x81,	%asi
	lda	[%l7 + 0x7C] %asi,	%f16
	fbg	%fcc2,	loop_1855
	bl,a	loop_1856
	array16	%g7,	%o0,	%i6
	fpack32	%f20,	%f0,	%f20
loop_1855:
	xorcc	%i2,	%l5,	%i1
loop_1856:
	sub	%l4,	0x0638,	%o4
	sdiv	%o2,	0x12B5,	%i0
	set	0x67, %i0
	lduba	[%l7 + %i0] 0x80,	%i5
	be,a,pt	%icc,	loop_1857
	swap	[%l7 + 0x7C],	%g1
	movcs	%icc,	%o3,	%i4
	te	%icc,	0x0
loop_1857:
	sdivcc	%g5,	0x16BD,	%l2
	srl	%o6,	%g4,	%l6
	edge16l	%i3,	%g2,	%o1
	taddcc	%l1,	%l0,	%o5
	movcc	%xcc,	%g6,	%l3
	bg,a,pt	%icc,	loop_1858
	alignaddrl	%o7,	%i7,	%g7
	bneg,a	%xcc,	loop_1859
	array8	%o0,	%i6,	%g3
loop_1858:
	addcc	%l5,	%i1,	%i2
	edge16ln	%l4,	%o2,	%o4
loop_1859:
	edge16n	%i5,	%g1,	%o3
	tle	%icc,	0x5
	fsrc1s	%f0,	%f25
	smul	%i0,	%g5,	%l2
	array8	%i4,	%g4,	%o6
	movg	%icc,	%i3,	%l6
	fbge,a	%fcc1,	loop_1860
	mova	%xcc,	%g2,	%l1
	smul	%l0,	0x117A,	%o1
	orn	%o5,	0x0A89,	%l3
loop_1860:
	fpsub32	%f16,	%f20,	%f30
	fxnor	%f28,	%f28,	%f16
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fones	%f1
	fbe,a	%fcc1,	loop_1861
	fpack32	%f6,	%f4,	%f12
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32n	%g6,	%i7,	%g7
loop_1861:
	fbuge,a	%fcc0,	loop_1862
	umul	%o7,	0x0630,	%o0
	fabss	%f18,	%f8
	edge32	%g3,	%l5,	%i6
loop_1862:
	subccc	%i1,	%i2,	%o2
	fmovdn	%xcc,	%f10,	%f7
	taddcc	%o4,	0x1F74,	%i5
	fmovspos	%icc,	%f12,	%f30
	subccc	%g1,	0x15AF,	%l4
	tneg	%xcc,	0x3
	sdivcc	%i0,	0x17BF,	%o3
	fmovde	%icc,	%f31,	%f24
	fmovsg	%icc,	%f21,	%f13
	bg,a	loop_1863
	edge8	%l2,	%i4,	%g4
	tn	%xcc,	0x1
	bcc	%icc,	loop_1864
loop_1863:
	edge16n	%o6,	%i3,	%l6
	orcc	%g5,	%l1,	%l0
	ba,a	loop_1865
loop_1864:
	sir	0x0275
	brnz	%o1,	loop_1866
	subcc	%g2,	0x0036,	%o5
loop_1865:
	fpsub32s	%f15,	%f28,	%f28
	nop
	setx	loop_1867,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_1866:
	fcmple16	%f10,	%f2,	%g6
	smulcc	%i7,	0x1A9A,	%g7
	popc	%o7,	%l3
loop_1867:
	nop
	set	0x1E, %l5
	stba	%o0,	[%l7 + %l5] 0x18
	fandnot1s	%f6,	%f9,	%f10
	fmovdg	%icc,	%f29,	%f3
	membar	#Sync
	set	0x40, %i4
	ldda	[%l7 + %i4] 0xf1,	%f0
	movcs	%icc,	%l5,	%g3
	sub	%i1,	%i2,	%i6
	movcs	%icc,	%o4,	%i5
	subcc	%o2,	%g1,	%i0
	fblg,a	%fcc0,	loop_1868
	nop
	setx	loop_1869,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tn	%xcc,	0x5
	fandnot2	%f0,	%f22,	%f24
loop_1868:
	ble,a	loop_1870
loop_1869:
	move	%icc,	%o3,	%l2
	xor	%i4,	%l4,	%o6
	std	%i2,	[%l7 + 0x30]
loop_1870:
	mulx	%g4,	0x1C06,	%l6
	fpsub16s	%f1,	%f21,	%f31
	subcc	%g5,	0x18F5,	%l0
	andcc	%o1,	%l1,	%g2
	stx	%o5,	[%l7 + 0x50]
	edge8l	%g6,	%g7,	%i7
	nop
	setx	loop_1871,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	ldsw	[%l7 + 0x34],	%o7
	sll	%l3,	%l5,	%o0
	edge16	%g3,	%i2,	%i1
loop_1871:
	tle	%xcc,	0x2
	st	%f8,	[%l7 + 0x54]
	xor	%i6,	%o4,	%i5
	lduw	[%l7 + 0x70],	%o2
	brgez,a	%i0,	loop_1872
	movg	%icc,	%g1,	%o3
	xnor	%i4,	0x187B,	%l4
	movge	%xcc,	%l2,	%i3
loop_1872:
	fmovscc	%icc,	%f9,	%f18
	lduh	[%l7 + 0x3C],	%g4
	movvs	%xcc,	%o6,	%l6
	sdiv	%l0,	0x0278,	%g5
	udivcc	%o1,	0x004B,	%g2
	prefetch	[%l7 + 0x44],	 0x2
	fcmpgt32	%f24,	%f4,	%l1
	addc	%g6,	0x0311,	%g7
	movrgez	%i7,	0x1F1,	%o7
	bl,a,pn	%icc,	loop_1873
	array32	%o5,	%l3,	%l5
	movcs	%icc,	%g3,	%i2
	stb	%i1,	[%l7 + 0x3F]
loop_1873:
	ta	%icc,	0x2
	wr	%g0,	0xe3,	%asi
	ldda	[%l7 + 0x60] %asi,	%i6
	fsrc1	%f30,	%f18
	tleu	%xcc,	0x5
	orn	%o4,	0x0CA3,	%i5
	fbne,a	%fcc2,	loop_1874
	fsrc1	%f10,	%f6
	fsrc1	%f26,	%f16
	edge16l	%o0,	%o2,	%g1
loop_1874:
	mulscc	%o3,	0x027B,	%i0
	movge	%xcc,	%l4,	%l2
	ldd	[%l7 + 0x10],	%i2
	umulcc	%i4,	0x0CB3,	%g4
	xnor	%o6,	0x018A,	%l6
	andncc	%l0,	%o1,	%g2
	tvs	%xcc,	0x5
	srax	%g5,	0x06,	%g6
	edge8	%l1,	%i7,	%g7
	std	%f6,	[%l7 + 0x50]
	srax	%o7,	0x16,	%l3
	andncc	%l5,	%o5,	%g3
	srl	%i2,	0x01,	%i1
	sub	%o4,	0x1E35,	%i6
	nop
	set	0x18, %l4
	ldsw	[%l7 + %l4],	%o0
	add	%i5,	0x126C,	%o2
	xorcc	%o3,	0x0EE3,	%g1
	fbl	%fcc1,	loop_1875
	xnorcc	%l4,	%i0,	%i3
	subcc	%l2,	0x0EB1,	%i4
	movg	%icc,	%g4,	%o6
loop_1875:
	sllx	%l0,	%l6,	%g2
	sra	%o1,	%g6,	%g5
	fmovsge	%icc,	%f12,	%f1
	or	%i7,	%g7,	%o7
	set	0x40, %i5
	stxa	%l1,	[%l7 + %i5] 0x22
	membar	#Sync
	movre	%l3,	0x135,	%o5
	xorcc	%l5,	%g3,	%i1
	fmovrsne	%o4,	%f3,	%f0
	movcc	%xcc,	%i2,	%i6
	wr	%g0,	0x89,	%asi
	stba	%o0,	[%l7 + 0x2B] %asi
	stx	%o2,	[%l7 + 0x68]
	movcs	%xcc,	%o3,	%i5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	brnz,a	%l4,	loop_1876
	srlx	%g1,	%i3,	%l2
	tvc	%xcc,	0x0
	movl	%xcc,	%i0,	%g4
loop_1876:
	tle	%icc,	0x5
	movneg	%xcc,	%o6,	%l0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnot2s	%f14,	%f30
	edge16l	%l6,	%i4,	%o1
	sethi	0x0DB0,	%g6
	edge8l	%g2,	%g5,	%i7
	te	%icc,	0x5
	tcc	%icc,	0x6
	pdist	%f24,	%f22,	%f26
	fbu	%fcc1,	loop_1877
	movrlez	%o7,	0x28D,	%g7
	fmovrdgez	%l1,	%f22,	%f10
	brgz	%l3,	loop_1878
loop_1877:
	bcs,a	loop_1879
	movrlz	%o5,	%g3,	%i1
	fmovdgu	%icc,	%f9,	%f28
loop_1878:
	andcc	%l5,	%o4,	%i6
loop_1879:
	tleu	%xcc,	0x7
	udivcc	%o0,	0x0CA0,	%o2
	stbar
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tl	%icc,	0x3
	edge16ln	%i2,	%o3,	%l4
	move	%icc,	%g1,	%i3
	fmovrde	%l2,	%f16,	%f30
	andn	%i0,	%i5,	%g4
	sir	0x0C7C
	movre	%o6,	0x32A,	%l0
	taddcctv	%i4,	0x1D41,	%o1
	fxor	%f0,	%f20,	%f18
	set	0x20, %i2
	swapa	[%l7 + %i2] 0x18,	%l6
	addccc	%g2,	0x15E9,	%g6
	ta	%icc,	0x3
	addccc	%g5,	%i7,	%g7
	fmovs	%f29,	%f19
	fmovsg	%icc,	%f29,	%f7
	edge32n	%l1,	%o7,	%l3
	add	%g3,	%i1,	%o5
	movge	%icc,	%l5,	%i6
	brgez	%o4,	loop_1880
	sllx	%o0,	%i2,	%o3
	edge16l	%l4,	%g1,	%o2
	subc	%i3,	%i0,	%i5
loop_1880:
	sethi	0x0C63,	%g4
	tcs	%xcc,	0x5
	tl	%icc,	0x3
	array8	%l2,	%l0,	%o6
	fmovsne	%icc,	%f27,	%f4
	andn	%i4,	%o1,	%l6
	fmovse	%icc,	%f24,	%f17
	tcs	%icc,	0x2
	tge	%xcc,	0x5
	udivx	%g6,	0x0DFD,	%g5
	fmuld8sux16	%f30,	%f5,	%f30
	srl	%g2,	%g7,	%l1
	array16	%o7,	%i7,	%g3
	ldd	[%l7 + 0x60],	%f16
	st	%f7,	[%l7 + 0x4C]
	xnorcc	%i1,	%l3,	%l5
	tn	%xcc,	0x7
	sdivcc	%i6,	0x0BED,	%o4
	wr	%g0,	0x11,	%asi
	lduha	[%l7 + 0x50] %asi,	%o5
	movrne	%o0,	%o3,	%l4
	fcmpd	%fcc0,	%f16,	%f18
	bvs,a,pn	%xcc,	loop_1881
	fmovsvs	%icc,	%f23,	%f8
	array8	%g1,	%i2,	%o2
	fpsub32s	%f2,	%f22,	%f31
loop_1881:
	tsubcctv	%i3,	0x0B79,	%i0
	tpos	%xcc,	0x6
	tn	%icc,	0x6
	movneg	%xcc,	%g4,	%l2
	mulscc	%l0,	0x0E08,	%o6
	tl	%xcc,	0x4
	lduh	[%l7 + 0x76],	%i5
	movleu	%icc,	%i4,	%l6
	add	%l7,	0x20,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] %asi,	%o1,	%g6
	lduh	[%l7 + 0x34],	%g5
	movl	%xcc,	%g7,	%l1
	udivcc	%g2,	0x1660,	%i7
	tneg	%xcc,	0x6
	mulscc	%g3,	0x01C7,	%i1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbn,a	%fcc3,	loop_1882
	fbl	%fcc0,	loop_1883
	fmovdpos	%xcc,	%f8,	%f17
	te	%icc,	0x2
loop_1882:
	tg	%icc,	0x4
loop_1883:
	fnands	%f31,	%f12,	%f1
	ta	%xcc,	0x2
	umul	%l3,	0x0362,	%o7
	edge32ln	%l5,	%i6,	%o5
	srax	%o4,	%o0,	%o3
	wr	%g0,	0x2f,	%asi
	stda	%g0,	[%l7 + 0x50] %asi
	membar	#Sync
	wr	%g0,	0x20,	%asi
	stxa	%l4,	[%g0 + 0x28] %asi
	srax	%o2,	%i3,	%i0
	fmovse	%icc,	%f13,	%f2
	sdiv	%i2,	0x06C3,	%l2
	movne	%icc,	%l0,	%o6
	tvs	%xcc,	0x5
	fble	%fcc2,	loop_1884
	brgez	%i5,	loop_1885
	movre	%i4,	%g4,	%l6
	fbug	%fcc0,	loop_1886
loop_1884:
	bshuffle	%f16,	%f8,	%f30
loop_1885:
	movcs	%icc,	%o1,	%g5
	tge	%xcc,	0x0
loop_1886:
	stbar
	subcc	%g7,	%g6,	%l1
	ble,a,pt	%xcc,	loop_1887
	movg	%icc,	%i7,	%g2
	sllx	%g3,	0x08,	%l3
	fmovrse	%i1,	%f17,	%f26
loop_1887:
	movrlz	%l5,	0x01B,	%i6
	subc	%o5,	0x02A3,	%o7
	fcmped	%fcc2,	%f6,	%f24
	fmovrsgz	%o0,	%f10,	%f7
	xorcc	%o4,	%g1,	%l4
	fmovdleu	%icc,	%f5,	%f18
	nop
	setx loop_1888, %l0, %l1
	jmpl %l1, %o2
	fmovrslez	%i3,	%f30,	%f2
	wr	%g0,	0x19,	%asi
	sta	%f29,	[%l7 + 0x64] %asi
loop_1888:
	fmovsg	%xcc,	%f25,	%f20
	and	%o3,	0x0F36,	%i2
	flush	%l7 + 0x7C
	add	%l7,	0x50,	%l6
	wr	%g0,	0x10,	%asi
	casxa	[%l6] 0x10,	%i0,	%l0
	fmovdn	%icc,	%f11,	%f15
	tn	%icc,	0x4
	fpsub32s	%f9,	%f5,	%f8
	andcc	%l2,	%i5,	%o6
	tle	%icc,	0x6
	fmovrdlez	%g4,	%f20,	%f12
	edge32n	%l6,	%o1,	%i4
	movcc	%xcc,	%g7,	%g5
	fnegd	%f4,	%f28
	array16	%g6,	%i7,	%l1
	movrlez	%g2,	0x073,	%g3
	ldsb	[%l7 + 0x5D],	%l3
	edge16n	%l5,	%i1,	%o5
	fpsub32	%f24,	%f20,	%f22
	sir	0x1C49
	tle	%xcc,	0x3
	brnz,a	%o7,	loop_1889
	movgu	%icc,	%o0,	%o4
	movgu	%icc,	%i6,	%l4
	fmovdvs	%xcc,	%f26,	%f15
loop_1889:
	nop
	wr	%g0,	0x16,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
	bleu,pt	%xcc,	loop_1890
	fmovsvc	%icc,	%f17,	%f15
	fnot1	%f12,	%f2
	membar	0x52
loop_1890:
	fpmerge	%f15,	%f24,	%f22
	edge32n	%o2,	%i3,	%g1
	ldsh	[%l7 + 0x62],	%i2
	fmovscc	%icc,	%f17,	%f24
	movle	%icc,	%o3,	%l0
	ldub	[%l7 + 0x41],	%l2
	add	%l7,	0x20,	%l6
	wr	%g0,	0x11,	%asi
	ldxa	[%l6] %asi,	%i5
	casxa	[%l6] %asi,	%i5,	%o6
	sll	%g4,	%i0,	%l6
	taddcctv	%i4,	%g7,	%g5
	fmovsg	%icc,	%f4,	%f4
	movrlez	%o1,	%g6,	%l1
	fmovd	%f14,	%f4
	edge32l	%g2,	%i7,	%l3
	fmovde	%icc,	%f17,	%f23
	fmovdge	%icc,	%f11,	%f7
	fpadd32s	%f27,	%f5,	%f7
	umulcc	%l5,	%g3,	%o5
	edge8l	%o7,	%i1,	%o4
	subcc	%i6,	%o0,	%o2
	movn	%icc,	%l4,	%g1
	set	0x60, %i7
	stxa	%i3,	[%l7 + %i7] 0x81
	edge16	%o3,	%i2,	%l2
	set	0x38, %l6
	lduha	[%l7 + %l6] 0x89,	%l0
	fornot1	%f24,	%f18,	%f26
	fnot2s	%f10,	%f27
	fbg	%fcc0,	loop_1891
	lduh	[%l7 + 0x4C],	%o6
	addcc	%i5,	0x1E64,	%g4
	tsubcc	%i0,	0x1A15,	%i4
loop_1891:
	ta	%icc,	0x4
	srl	%g7,	%g5,	%o1
	std	%f24,	[%l7 + 0x40]
	set	0x58, %o1
	lduwa	[%l7 + %o1] 0x18,	%g6
	wr	%g0,	0x88,	%asi
	ldsha	[%l7 + 0x78] %asi,	%l1
	udivx	%l6,	0x0A6B,	%i7
	fmul8x16	%f25,	%f10,	%f12
	std	%l2,	[%l7 + 0x08]
	fmovdn	%xcc,	%f17,	%f6
	umulcc	%g2,	0x0A92,	%l5
	swap	[%l7 + 0x60],	%g3
	fornot1	%f28,	%f6,	%f28
	sllx	%o5,	0x06,	%o7
	tle	%icc,	0x7
	orn	%i1,	0x02F0,	%o4
	wr	%g0,	0x80,	%asi
	ldstuba	[%l7 + 0x5C] %asi,	%o0
	xnorcc	%i6,	%o2,	%l4
	tsubcc	%i3,	%g1,	%i2
	wr	%g0,	0x80,	%asi
	sta	%f16,	[%l7 + 0x78] %asi
	mulscc	%l2,	0x1579,	%l0
	fsrc2	%f14,	%f10
	bg	loop_1892
	taddcc	%o6,	%i5,	%g4
	st	%f18,	[%l7 + 0x60]
	fmovrsgez	%i0,	%f7,	%f10
loop_1892:
	movrgz	%o3,	%i4,	%g5
	prefetch	[%l7 + 0x40],	 0x2
	sllx	%o1,	%g6,	%g7
	fors	%f16,	%f1,	%f1
	sdivcc	%l6,	0x0978,	%l1
	taddcc	%l3,	%g2,	%i7
	sll	%g3,	0x11,	%o5
	std	%f16,	[%l7 + 0x10]
	move	%icc,	%o7,	%l5
	fmovde	%xcc,	%f26,	%f11
	edge16n	%o4,	%i1,	%i6
	movrlz	%o2,	0x0F0,	%l4
	fandnot1	%f28,	%f6,	%f6
	xorcc	%o0,	%g1,	%i3
	umulcc	%i2,	%l0,	%o6
	smul	%i5,	0x13F3,	%g4
	fxnors	%f25,	%f25,	%f21
	fandnot1	%f4,	%f12,	%f2
	addc	%l2,	%i0,	%o3
	tne	%icc,	0x6
	array32	%g5,	%i4,	%o1
	fcmped	%fcc0,	%f10,	%f26
	tpos	%xcc,	0x5
	udivcc	%g7,	0x0330,	%l6
	bne,a	loop_1893
	sir	0x13CE
	movpos	%xcc,	%g6,	%l1
	sir	0x0AA0
loop_1893:
	subcc	%g2,	0x0D67,	%l3
	tleu	%xcc,	0x5
	addccc	%i7,	%g3,	%o7
	movge	%icc,	%l5,	%o5
	sll	%i1,	0x1A,	%i6
	srlx	%o2,	%o4,	%l4
	edge32l	%o0,	%g1,	%i3
	fnot1s	%f28,	%f23
	fpmerge	%f2,	%f17,	%f4
	nop
	set	0x58, %g4
	std	%f0,	[%l7 + %g4]
	edge32n	%i2,	%l0,	%i5
	addccc	%g4,	%l2,	%i0
	sll	%o6,	0x10,	%o3
	movrgz	%g5,	0x32C,	%i4
	fmovse	%icc,	%f23,	%f14
	tpos	%icc,	0x3
	andcc	%g7,	%l6,	%o1
	membar	0x55
	ldx	[%l7 + 0x20],	%l1
	edge16l	%g2,	%g6,	%i7
	bcs,a	loop_1894
	fnot1s	%f11,	%f4
	fmovdn	%xcc,	%f4,	%f8
	fble	%fcc1,	loop_1895
loop_1894:
	andcc	%g3,	0x14CA,	%l3
	move	%xcc,	%o7,	%l5
	sdivcc	%i1,	0x1410,	%i6
loop_1895:
	fcmpgt16	%f8,	%f2,	%o5
	wr	%g0,	0x81,	%asi
	ldsha	[%l7 + 0x10] %asi,	%o4
	add	%o2,	0x0DB3,	%l4
	smulcc	%o0,	%g1,	%i2
	fmovsl	%xcc,	%f29,	%f28
	tleu	%icc,	0x2
	movvs	%xcc,	%l0,	%i5
	srax	%i3,	0x16,	%l2
	movcs	%icc,	%i0,	%o6
	wr	%g0,	0x0c,	%asi
	swapa	[%l7 + 0x70] %asi,	%g4
	wr	%g0,	0x80,	%asi
	ldstuba	[%l7 + 0x2E] %asi,	%g5
	tsubcc	%i4,	%o3,	%g7
	movrlz	%l6,	0x339,	%l1
	subcc	%g2,	%o1,	%i7
	edge16ln	%g3,	%g6,	%l3
	tgu	%xcc,	0x7
	udiv	%o7,	0x12E4,	%i1
	ba,a,pn	%xcc,	loop_1896
	movrlez	%l5,	%i6,	%o4
	bcc	loop_1897
	ba,a	loop_1898
loop_1896:
	brz,a	%o2,	loop_1899
	taddcc	%o5,	0x1044,	%o0
loop_1897:
	sra	%l4,	0x0B,	%g1
loop_1898:
	array32	%l0,	%i2,	%i3
loop_1899:
	fnot2	%f20,	%f28
	mulx	%i5,	0x1C6A,	%i0
	array16	%o6,	%g4,	%g5
	subc	%l2,	%i4,	%g7
	sdiv	%l6,	0x0B42,	%o3
	fornot2s	%f27,	%f14,	%f25
	fpack16	%f12,	%f3
	edge8ln	%g2,	%o1,	%i7
	add	%l1,	0x120F,	%g6
	fcmpd	%fcc0,	%f22,	%f20
	edge16	%l3,	%g3,	%o7
	move	%xcc,	%i1,	%l5
	ta	%icc,	0x5
	swap	[%l7 + 0x64],	%i6
	fors	%f26,	%f19,	%f12
	orcc	%o2,	0x09F1,	%o4
	tgu	%xcc,	0x3
	fmovrsgez	%o5,	%f25,	%f30
	be,a,pt	%xcc,	loop_1900
	st	%f29,	[%l7 + 0x48]
	srlx	%l4,	0x1B,	%o0
	fpsub16	%f24,	%f0,	%f30
loop_1900:
	movrgz	%l0,	%i2,	%g1
	edge8n	%i3,	%i5,	%o6
	tvc	%icc,	0x0
	tgu	%icc,	0x5
	movrgz	%g4,	0x24C,	%i0
	fnors	%f17,	%f13,	%f17
	nop
	setx	loop_1901,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movvc	%xcc,	%g5,	%i4
	xorcc	%l2,	0x1851,	%g7
	fabsd	%f24,	%f0
loop_1901:
	fmovsg	%xcc,	%f15,	%f11
	edge16l	%o3,	%l6,	%o1
	andncc	%i7,	%g2,	%l1
	movrlz	%g6,	0x04C,	%l3
	fmovsvs	%xcc,	%f24,	%f6
	fbe,a	%fcc1,	loop_1902
	movrlz	%g3,	0x11A,	%o7
	fba,a	%fcc0,	loop_1903
	subccc	%l5,	%i6,	%o2
loop_1902:
	bleu	%xcc,	loop_1904
	srax	%o4,	0x0A,	%i1
loop_1903:
	andn	%o5,	%o0,	%l4
	wr	%g0,	0x18,	%asi
	ldsha	[%l7 + 0x44] %asi,	%l0
loop_1904:
	bshuffle	%f20,	%f12,	%f26
	addcc	%g1,	%i2,	%i5
	tne	%xcc,	0x4
	edge32ln	%i3,	%g4,	%i0
	fmovrdgz	%g5,	%f6,	%f12
	xnorcc	%o6,	0x0662,	%l2
	edge16n	%i4,	%o3,	%g7
	fxor	%f30,	%f18,	%f0
	tsubcctv	%o1,	0x01FA,	%l6
	sll	%i7,	0x14,	%g2
	fmovrde	%g6,	%f20,	%f2
	edge8l	%l3,	%g3,	%o7
	tle	%xcc,	0x1
	fsrc2s	%f22,	%f1
	movcs	%xcc,	%l5,	%i6
	sethi	0x0F95,	%o2
	add	%l7,	0x5C,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%o4
	casa	[%l6] %asi,	%o4,	%l1
	movle	%xcc,	%i1,	%o5
	fmul8x16	%f10,	%f12,	%f30
	ta	%xcc,	0x7
	fmovrdne	%o0,	%f0,	%f0
	mova	%icc,	%l0,	%l4
	fnegd	%f30,	%f14
	add	%g1,	0x09B2,	%i2
	fmovrdlez	%i5,	%f10,	%f28
	brgez,a	%i3,	loop_1905
	andcc	%i0,	%g4,	%o6
	membar	0x10
	movrlez	%l2,	0x2C4,	%i4
loop_1905:
	taddcctv	%o3,	%g7,	%g5
	edge32l	%l6,	%i7,	%o1
	tle	%xcc,	0x0
	fbuge,a	%fcc0,	loop_1906
	umulcc	%g2,	0x1536,	%g6
	fmovsge	%xcc,	%f12,	%f1
	srl	%l3,	0x18,	%o7
loop_1906:
	fbu,a	%fcc0,	loop_1907
	array8	%l5,	%g3,	%i6
	te	%icc,	0x5
	movl	%xcc,	%o4,	%l1
loop_1907:
	orn	%i1,	%o5,	%o0
	smul	%o2,	%l4,	%l0
	addc	%i2,	0x1DB8,	%g1
	std	%f24,	[%l7 + 0x68]
	stb	%i5,	[%l7 + 0x17]
	alignaddrl	%i3,	%i0,	%o6
	prefetch	[%l7 + 0x58],	 0x0
	fnors	%f20,	%f15,	%f29
	sdivcc	%g4,	0x08DB,	%i4
	tle	%xcc,	0x3
	wr	%g0,	0x89,	%asi
	ldsba	[%l7 + 0x74] %asi,	%o3
	smul	%g7,	%l2,	%g5
	fmovdl	%icc,	%f29,	%f14
	mulscc	%i7,	%o1,	%g2
	movneg	%icc,	%g6,	%l6
	xorcc	%l3,	%o7,	%l5
	tsubcc	%g3,	%i6,	%l1
	bneg	loop_1908
	xorcc	%o4,	%i1,	%o5
	wr	%g0,	0x18,	%asi
	sta	%f21,	[%l7 + 0x54] %asi
loop_1908:
	fpadd32s	%f11,	%f19,	%f17
	edge16l	%o0,	%l4,	%l0
	edge16l	%o2,	%g1,	%i2
	edge8	%i5,	%i3,	%i0
	std	%f2,	[%l7 + 0x58]
	movg	%icc,	%g4,	%i4
	sllx	%o3,	%o6,	%g7
	fbue	%fcc0,	loop_1909
	fbul,a	%fcc1,	loop_1910
	edge32	%l2,	%i7,	%g5
	fornot1s	%f5,	%f17,	%f14
loop_1909:
	fbg	%fcc0,	loop_1911
loop_1910:
	lduh	[%l7 + 0x16],	%g2
	fmuld8ulx16	%f17,	%f14,	%f14
	fpadd16	%f30,	%f14,	%f8
loop_1911:
	orncc	%g6,	%l6,	%o1
	fmovdneg	%xcc,	%f28,	%f15
	sll	%l3,	%l5,	%g3
	bneg,a	loop_1912
	tgu	%icc,	0x4
	fmovscs	%icc,	%f22,	%f10
	andcc	%i6,	%o7,	%l1
loop_1912:
	fpadd32s	%f12,	%f17,	%f16
	tle	%icc,	0x6
	stx	%o4,	[%l7 + 0x48]
	fbule,a	%fcc3,	loop_1913
	fmovscc	%xcc,	%f30,	%f21
	xnor	%i1,	0x115B,	%o0
	tg	%xcc,	0x4
loop_1913:
	edge32	%l4,	%o5,	%o2
	edge8	%g1,	%l0,	%i2
	alignaddrl	%i5,	%i0,	%i3
	st	%f15,	[%l7 + 0x0C]
	sllx	%i4,	%g4,	%o6
	srl	%g7,	0x08,	%o3
	fmul8x16au	%f7,	%f16,	%f18
	sdivcc	%l2,	0x1DC2,	%g5
	brz,a	%i7,	loop_1914
	fmul8sux16	%f30,	%f22,	%f18
	movrgz	%g2,	0x3BD,	%l6
	tne	%icc,	0x7
loop_1914:
	movl	%icc,	%g6,	%l3
	fcmpeq32	%f4,	%f18,	%l5
	edge8ln	%g3,	%i6,	%o7
	fblg	%fcc2,	loop_1915
	nop
	setx	loop_1916,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fpack32	%f30,	%f4,	%f14
	set	0x78, %i3
	lduwa	[%l7 + %i3] 0x14,	%l1
loop_1915:
	umul	%o4,	0x1A04,	%i1
loop_1916:
	fmovsne	%xcc,	%f26,	%f0
	wr	%g0,	0x10,	%asi
	lda	[%l7 + 0x60] %asi,	%f30
	tgu	%xcc,	0x2
	sethi	0x0EC0,	%o1
	set	0x43, %g1
	ldsba	[%l7 + %g1] 0x14,	%o0
	fnands	%f17,	%f28,	%f4
	fmovrdgz	%o5,	%f14,	%f30
	array8	%o2,	%g1,	%l4
	wr	%g0,	0x80,	%asi
	ldsba	[%l7 + 0x33] %asi,	%i2
	lduw	[%l7 + 0x64],	%l0
	bcs,a,pn	%xcc,	loop_1917
	movvs	%icc,	%i5,	%i0
	fmul8sux16	%f20,	%f20,	%f26
	umul	%i4,	%i3,	%g4
loop_1917:
	xnor	%o6,	0x04C3,	%g7
	subc	%l2,	0x1323,	%o3
	fmovsn	%xcc,	%f17,	%f6
	fmul8sux16	%f10,	%f22,	%f14
	fblg	%fcc0,	loop_1918
	sethi	0x071C,	%i7
	movl	%xcc,	%g5,	%g2
	edge8n	%g6,	%l3,	%l6
loop_1918:
	sdivx	%g3,	0x0D19,	%i6
	subc	%l5,	%l1,	%o7
	flush	%l7 + 0x18
	fcmpne16	%f24,	%f8,	%o4
	fmovrdgz	%o1,	%f10,	%f20
	prefetch	[%l7 + 0x70],	 0x0
	nop
	setx loop_1919, %l0, %l1
	jmpl %l1, %o0
	movvc	%xcc,	%i1,	%o5
	mulscc	%g1,	0x0BEE,	%o2
	movcc	%xcc,	%l4,	%i2
loop_1919:
	ldx	[%l7 + 0x50],	%l0
	sdiv	%i5,	0x1579,	%i4
	edge8	%i0,	%g4,	%i3
	srax	%g7,	%l2,	%o6
	lduw	[%l7 + 0x5C],	%o3
	tcc	%icc,	0x1
	or	%i7,	%g5,	%g6
	fmovscs	%xcc,	%f2,	%f10
	udiv	%g2,	0x1A47,	%l6
	addcc	%l3,	%i6,	%g3
	edge32	%l5,	%o7,	%o4
	fnegs	%f24,	%f22
	nop
	setx	loop_1920,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	umul	%o1,	%l1,	%o0
	addc	%i1,	0x0F15,	%o5
	tvc	%icc,	0x6
loop_1920:
	fbge	%fcc2,	loop_1921
	brlz,a	%g1,	loop_1922
	tvc	%icc,	0x1
	brz	%l4,	loop_1923
loop_1921:
	fnegs	%f29,	%f2
loop_1922:
	brgz	%o2,	loop_1924
	ble,a,pn	%xcc,	loop_1925
loop_1923:
	edge16	%l0,	%i5,	%i4
	umul	%i2,	%i0,	%i3
loop_1924:
	tn	%xcc,	0x5
loop_1925:
	movrgez	%g4,	%l2,	%o6
	fnors	%f26,	%f17,	%f20
	ldsb	[%l7 + 0x31],	%o3
	sir	0x1C8C
	fbl,a	%fcc0,	loop_1926
	stx	%i7,	[%l7 + 0x10]
	lduh	[%l7 + 0x1A],	%g5
	movneg	%xcc,	%g6,	%g2
loop_1926:
	brlez	%g7,	loop_1927
	fmovsl	%xcc,	%f20,	%f2
	fnand	%f10,	%f26,	%f28
	flush	%l7 + 0x14
loop_1927:
	addc	%l6,	%l3,	%g3
	sdiv	%i6,	0x1910,	%l5
	mulx	%o4,	%o1,	%l1
	fcmpd	%fcc3,	%f14,	%f28
	xnorcc	%o0,	%i1,	%o5
	stbar
	sdivcc	%o7,	0x14CF,	%l4
	fmovsvc	%icc,	%f31,	%f30
	umulcc	%o2,	%g1,	%l0
	bneg,pt	%xcc,	loop_1928
	tge	%icc,	0x4
	ldub	[%l7 + 0x5E],	%i4
	stb	%i5,	[%l7 + 0x14]
loop_1928:
	sllx	%i2,	0x06,	%i0
	tne	%xcc,	0x7
	andn	%g4,	0x140A,	%l2
	edge32n	%i3,	%o6,	%o3
	fand	%f24,	%f8,	%f10
	fbe	%fcc0,	loop_1929
	movl	%icc,	%g5,	%g6
	tneg	%icc,	0x7
	array16	%g2,	%g7,	%i7
loop_1929:
	tpos	%icc,	0x0
	movle	%xcc,	%l6,	%l3
	fpadd32s	%f21,	%f2,	%f19
	smul	%g3,	0x0BA8,	%i6
	std	%f18,	[%l7 + 0x28]
	std	%l4,	[%l7 + 0x48]
	fpsub16	%f26,	%f22,	%f24
	movleu	%xcc,	%o1,	%o4
	add	%l1,	%o0,	%o5
	tgu	%icc,	0x7
	addccc	%i1,	%o7,	%l4
	orcc	%o2,	0x18F0,	%l0
	tne	%xcc,	0x5
	array8	%g1,	%i4,	%i5
	edge32ln	%i2,	%g4,	%i0
	wr	%g0,	0x10,	%asi
	ldstuba	[%l7 + 0x4C] %asi,	%i3
	taddcctv	%o6,	%o3,	%g5
	edge32n	%l2,	%g6,	%g7
	movn	%xcc,	%g2,	%i7
	ldsw	[%l7 + 0x34],	%l3
	sdiv	%g3,	0x14A5,	%i6
	set	0x40, %o3
	stda	%f16,	[%l7 + %o3] 0x89
	wr	%g0,	0x89,	%asi
	stda	%l4,	[%l7 + 0x30] %asi
	fmovdle	%icc,	%f27,	%f2
	fmovdge	%xcc,	%f28,	%f10
	tcc	%icc,	0x5
	set	0x40, %g5
	ldda	[%l7 + %g5] 0x89,	%f16
	edge32ln	%o1,	%l6,	%o4
	movneg	%icc,	%o0,	%o5
	array16	%i1,	%l1,	%o7
	for	%f28,	%f20,	%f12
	fbne	%fcc2,	loop_1930
	mulx	%o2,	0x136D,	%l4
	ba,a,pt	%icc,	loop_1931
	tgu	%icc,	0x7
loop_1930:
	bneg,pn	%xcc,	loop_1932
	tn	%xcc,	0x6
loop_1931:
	taddcctv	%g1,	%i4,	%l0
	fsrc2s	%f30,	%f16
loop_1932:
	fble,a	%fcc0,	loop_1933
	edge8n	%i5,	%g4,	%i0
	fcmps	%fcc3,	%f7,	%f18
	movrne	%i3,	%o6,	%i2
loop_1933:
	fones	%f30
	subc	%o3,	0x0409,	%g5
	brgz	%l2,	loop_1934
	bg,a,pt	%xcc,	loop_1935
	sra	%g7,	0x0B,	%g6
	movcc	%icc,	%i7,	%g2
loop_1934:
	array8	%g3,	%i6,	%l5
loop_1935:
	lduw	[%l7 + 0x68],	%l3
	move	%xcc,	%o1,	%l6
	wr	%g0,	0x80,	%asi
	lduha	[%l7 + 0x5A] %asi,	%o4
	andn	%o0,	%i1,	%o5
	fmovrse	%l1,	%f6,	%f12
	std	%f2,	[%l7 + 0x60]
	alignaddrl	%o7,	%l4,	%o2
	membar	0x54
	bn	%icc,	loop_1936
	sir	0x1896
	fcmpd	%fcc0,	%f6,	%f26
	array16	%i4,	%g1,	%i5
loop_1936:
	movne	%icc,	%l0,	%g4
	sub	%i3,	%o6,	%i2
	mova	%xcc,	%o3,	%g5
	fnand	%f18,	%f18,	%f0
	movvs	%xcc,	%l2,	%i0
	fmovd	%f20,	%f4
	fcmple32	%f28,	%f14,	%g6
	tvc	%xcc,	0x7
	alignaddr	%i7,	%g2,	%g3
	ta	%icc,	0x3
	mulx	%g7,	0x1BCC,	%l5
	fabss	%f31,	%f11
	mova	%icc,	%l3,	%o1
	movgu	%icc,	%l6,	%o4
	tg	%icc,	0x1
	movleu	%xcc,	%i6,	%i1
	set	0x60, %o0
	stxa	%o5,	[%l7 + %o0] 0x0c
	fmovspos	%xcc,	%f31,	%f28
	wr	%g0,	0x89,	%asi
	swapa	[%l7 + 0x3C] %asi,	%l1
	array8	%o0,	%o7,	%o2
	set	0x28, %o5
	prefetcha	[%l7 + %o5] 0x14,	 0x1
	fands	%f15,	%f21,	%f31
	addcc	%l4,	%g1,	%l0
	edge8ln	%i5,	%g4,	%i3
	bg,a	%xcc,	loop_1937
	brgz,a	%i2,	loop_1938
	edge16	%o3,	%o6,	%l2
	ta	%xcc,	0x6
loop_1937:
	movcs	%xcc,	%i0,	%g6
loop_1938:
	brlez	%g5,	loop_1939
	bleu,a	%icc,	loop_1940
	taddcctv	%i7,	%g3,	%g2
	lduh	[%l7 + 0x12],	%g7
loop_1939:
	tne	%icc,	0x7
loop_1940:
	tcs	%icc,	0x5
	edge32l	%l5,	%l3,	%o1
	array16	%o4,	%i6,	%l6
	tvc	%icc,	0x4
	movn	%xcc,	%o5,	%i1
	membar	0x2E
	movgu	%xcc,	%o0,	%l1
	brgz	%o7,	loop_1941
	ta	%xcc,	0x0
	lduh	[%l7 + 0x1A],	%o2
	wr	%g0,	0x88,	%asi
	lduba	[%l7 + 0x16] %asi,	%l4
loop_1941:
	fbg,a	%fcc1,	loop_1942
	mova	%icc,	%g1,	%i4
	fsrc2s	%f19,	%f12
	subcc	%i5,	0x150C,	%l0
loop_1942:
	tg	%icc,	0x6
	fandnot2	%f28,	%f20,	%f18
	tne	%icc,	0x3
	bne,a	%xcc,	loop_1943
	udiv	%g4,	0x044A,	%i3
	swap	[%l7 + 0x74],	%o3
	sdiv	%i2,	0x092E,	%o6
loop_1943:
	xnor	%l2,	%g6,	%g5
	movre	%i0,	0x203,	%g3
	fandnot1	%f0,	%f30,	%f20
	fbu,a	%fcc1,	loop_1944
	movneg	%icc,	%g2,	%i7
	taddcctv	%g7,	0x051D,	%l5
	movl	%xcc,	%l3,	%o1
loop_1944:
	movne	%icc,	%i6,	%o4
	fbe,a	%fcc1,	loop_1945
	fornot1s	%f26,	%f12,	%f9
	tl	%xcc,	0x1
	wr	%g0,	0x89,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
loop_1945:
	brnz,a	%o5,	loop_1946
	smulcc	%i1,	%o0,	%l1
	movleu	%xcc,	%o7,	%l6
	fpadd16s	%f2,	%f26,	%f3
loop_1946:
	movrlez	%l4,	0x25E,	%o2
	udivx	%g1,	0x09DC,	%i5
	bgu,pn	%xcc,	loop_1947
	sll	%i4,	%l0,	%i3
	movne	%icc,	%g4,	%o3
	addccc	%o6,	%l2,	%i2
loop_1947:
	movn	%xcc,	%g5,	%i0
	tsubcc	%g3,	0x180D,	%g6
	be	loop_1948
	fandnot1	%f26,	%f24,	%f26
	xor	%g2,	%i7,	%g7
	alignaddrl	%l3,	%o1,	%l5
loop_1948:
	sll	%i6,	%o4,	%o5
	fmovda	%xcc,	%f13,	%f28
	fcmpd	%fcc1,	%f26,	%f0
	fnot2s	%f1,	%f16
	fmovsg	%xcc,	%f16,	%f9
	bgu,pt	%icc,	loop_1949
	fmovrde	%o0,	%f14,	%f6
	nop
	setx	loop_1950,	%l0,	%l1
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
loop_1949:
	fmovdge	%xcc,	%f16,	%f28
	fxor	%f8,	%f22,	%f14
loop_1950:
	faligndata	%f30,	%f4,	%f18
	bvs,a	loop_1951
	swap	[%l7 + 0x34],	%i1
	nop
	setx	loop_1952,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	for	%f2,	%f0,	%f20
loop_1951:
	umulcc	%o7,	0x0BCF,	%l6
	movpos	%xcc,	%l1,	%l4
loop_1952:
	nop
	wr	%g0,	0x80,	%asi
	stxa	%g1,	[%l7 + 0x48] %asi
	andn	%o2,	0x07B1,	%i5
	addc	%l0,	%i3,	%g4
	taddcctv	%i4,	%o6,	%l2
	sll	%o3,	0x04,	%i2
	edge16n	%i0,	%g5,	%g3
	or	%g2,	0x0350,	%g6
	fbn	%fcc2,	loop_1953
	xnorcc	%g7,	0x13E2,	%l3
	fpadd32	%f30,	%f14,	%f2
	xnorcc	%i7,	0x1BD1,	%o1
loop_1953:
	edge32l	%i6,	%l5,	%o4
	movvs	%xcc,	%o0,	%i1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	te	%icc,	0x6
	bleu,a,pn	%xcc,	loop_1954
	bvs,pn	%xcc,	loop_1955
	xorcc	%o7,	%o5,	%l6
	add	%l7,	0x60,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] %asi,	%l4,	%g1
loop_1954:
	mulx	%l1,	%i5,	%o2
loop_1955:
	movge	%icc,	%i3,	%l0
	movgu	%xcc,	%g4,	%i4
	sllx	%l2,	0x0C,	%o3
	orncc	%i2,	%o6,	%i0
	orncc	%g3,	%g2,	%g6
	ldsb	[%l7 + 0x22],	%g7
	fmovda	%xcc,	%f3,	%f14
	umulcc	%g5,	0x1217,	%i7
	fpack32	%f0,	%f10,	%f30
	smulcc	%o1,	%l3,	%l5
	siam	0x2
	ldx	[%l7 + 0x48],	%o4
	bpos,a,pt	%xcc,	loop_1956
	srlx	%i6,	%i1,	%o0
	tl	%xcc,	0x6
	srl	%o5,	0x09,	%o7
loop_1956:
	fxors	%f21,	%f1,	%f20
	fmovsleu	%icc,	%f6,	%f16
	movvc	%icc,	%l4,	%l6
	fmovsn	%xcc,	%f31,	%f21
	wr	%g0,	0x80,	%asi
	sta	%f29,	[%l7 + 0x48] %asi
	bcs,a	loop_1957
	sir	0x0199
	popc	0x08DE,	%l1
	tn	%xcc,	0x0
loop_1957:
	tcs	%xcc,	0x6
	orcc	%g1,	%i5,	%i3
	fbul,a	%fcc1,	loop_1958
	tgu	%xcc,	0x3
	swap	[%l7 + 0x24],	%o2
	mulx	%l0,	%i4,	%l2
loop_1958:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	call	loop_1959
	edge8n	%g4,	%i2,	%o6
	nop
	set	0x3C, %l0
	ldstub	[%l7 + %l0],	%o3
	andn	%g3,	%g2,	%g6
loop_1959:
	fbg,a	%fcc3,	loop_1960
	fmovsg	%icc,	%f20,	%f24
	fbne,a	%fcc0,	loop_1961
	alignaddr	%i0,	%g7,	%i7
loop_1960:
	add	%g5,	%o1,	%l5
	bcc	%xcc,	loop_1962
loop_1961:
	ta	%xcc,	0x6
	fmovsvs	%xcc,	%f1,	%f9
	movcc	%xcc,	%o4,	%i6
loop_1962:
	stw	%i1,	[%l7 + 0x5C]
	subcc	%o0,	0x193D,	%o5
	fandnot1	%f22,	%f22,	%f30
	tcc	%icc,	0x7
	tleu	%xcc,	0x1
	array8	%o7,	%l3,	%l6
	umulcc	%l1,	%l4,	%g1
	fmovrdlez	%i5,	%f8,	%f10
	fmovsvs	%icc,	%f3,	%f27
	membar	0x57
	subccc	%i3,	0x147A,	%o2
	set	0x08, %l1
	stwa	%i4,	[%l7 + %l1] 0x22
	membar	#Sync
	edge8l	%l2,	%g4,	%l0
	fmovrdlz	%o6,	%f0,	%f14
	tn	%xcc,	0x2
	fbl,a	%fcc3,	loop_1963
	fmovspos	%xcc,	%f27,	%f7
	subc	%o3,	0x14FB,	%i2
	fmul8ulx16	%f20,	%f0,	%f8
loop_1963:
	fmovrdgez	%g3,	%f16,	%f8
	fba,a	%fcc1,	loop_1964
	bcs,pt	%icc,	loop_1965
	fbl,a	%fcc0,	loop_1966
	mulscc	%g6,	%i0,	%g7
loop_1964:
	tneg	%xcc,	0x6
loop_1965:
	alignaddrl	%i7,	%g5,	%o1
loop_1966:
	tcs	%xcc,	0x5
	ta	%icc,	0x2
	sir	0x0CE1
	stw	%g2,	[%l7 + 0x58]
	fmovda	%icc,	%f6,	%f8
	tle	%icc,	0x2
	bg,pn	%xcc,	loop_1967
	fmovda	%xcc,	%f15,	%f12
	tvc	%icc,	0x1
	fbg	%fcc2,	loop_1968
loop_1967:
	taddcctv	%l5,	0x03CE,	%o4
	fornot1s	%f2,	%f12,	%f27
	set	0x1E, %g2
	lduha	[%l7 + %g2] 0x80,	%i1
loop_1968:
	ta	%icc,	0x5
	movrne	%o0,	0x1C4,	%o5
	movneg	%icc,	%o7,	%i6
	fornot2	%f2,	%f2,	%f4
	srlx	%l6,	%l3,	%l4
	movcs	%icc,	%l1,	%i5
	fmovdleu	%icc,	%f6,	%f31
	fcmpgt32	%f20,	%f10,	%i3
	tne	%icc,	0x0
	sll	%o2,	0x17,	%i4
	subcc	%g1,	%l2,	%l0
	edge8ln	%o6,	%o3,	%i2
	movcc	%icc,	%g4,	%g3
	fpmerge	%f26,	%f14,	%f18
	fnot1	%f16,	%f2
	fbule,a	%fcc3,	loop_1969
	popc	%i0,	%g7
	tcc	%xcc,	0x3
	edge16n	%i7,	%g6,	%o1
loop_1969:
	orcc	%g2,	%l5,	%g5
	tsubcctv	%i1,	0x14E1,	%o0
	fbn	%fcc3,	loop_1970
	fzeros	%f29
	ldstub	[%l7 + 0x24],	%o4
	fnot1s	%f30,	%f31
loop_1970:
	movg	%icc,	%o7,	%i6
	mulscc	%l6,	%o5,	%l3
	bvc,a,pn	%icc,	loop_1971
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udiv	%l1,	0x0F92,	%i5
	call	loop_1972
loop_1971:
	movl	%icc,	%l4,	%i3
	fornot2s	%f26,	%f8,	%f9
	movne	%xcc,	%o2,	%i4
loop_1972:
	tneg	%icc,	0x0
	movrgz	%g1,	0x102,	%l0
	tge	%xcc,	0x6
	fornot2	%f20,	%f30,	%f16
	fsrc2	%f10,	%f22
	movle	%xcc,	%o6,	%o3
	umulcc	%l2,	0x07A9,	%g4
	orcc	%g3,	%i2,	%g7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsn	%icc,	%f17,	%f5
	tvs	%xcc,	0x1
	tleu	%xcc,	0x5
	sethi	0x076E,	%i7
	subccc	%g6,	%i0,	%g2
	fbu,a	%fcc3,	loop_1973
	fandnot1	%f22,	%f22,	%f30
	array32	%o1,	%g5,	%i1
	movpos	%xcc,	%o0,	%l5
loop_1973:
	fmul8sux16	%f22,	%f16,	%f12
	tcc	%xcc,	0x3
	fmovsgu	%icc,	%f10,	%f9
	sethi	0x17C0,	%o4
	xorcc	%o7,	%l6,	%o5
	set	0x4C, %l2
	sta	%f1,	[%l7 + %l2] 0x81
	st	%f14,	[%l7 + 0x40]
	bgu,pn	%icc,	loop_1974
	tneg	%icc,	0x5
	tne	%icc,	0x0
	fbue,a	%fcc3,	loop_1975
loop_1974:
	taddcc	%l3,	0x0991,	%i6
	fmul8ulx16	%f12,	%f14,	%f12
	edge32n	%l1,	%l4,	%i3
loop_1975:
	movrlez	%o2,	%i4,	%i5
	fmovsvs	%icc,	%f3,	%f28
	fmovdneg	%xcc,	%f26,	%f4
	movge	%xcc,	%l0,	%o6
	membar	#Sync
	wr	%g0,	0x1e,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	taddcc	%g1,	%o3,	%l2
	movrlz	%g3,	%g4,	%g7
	fnor	%f16,	%f20,	%f30
	add	%l7,	0x64,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%i2
	casa	[%l6] %asi,	%i2,	%i7
	taddcctv	%g6,	%i0,	%g2
	movge	%xcc,	%o1,	%g5
	sll	%i1,	0x18,	%o0
	ldd	[%l7 + 0x18],	%o4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x19, %l3
	lduba	[%l7 + %l3] 0x15,	%l5
	taddcctv	%o7,	0x136A,	%l6
	movrlez	%l3,	%i6,	%l1
	fmovsg	%xcc,	%f30,	%f19
	movneg	%xcc,	%l4,	%o5
	fexpand	%f25,	%f6
	brlz,a	%o2,	loop_1976
	ldsb	[%l7 + 0x0D],	%i4
	addccc	%i5,	0x0C79,	%l0
	add	%l7,	0x68,	%l6
	wr	%g0,	0x10,	%asi
	lda	[%l6] %asi,	%o6
	casa	[%l6] 0x10,	%o6,	%i3
loop_1976:
	fmovrse	%o3,	%f16,	%f10
	movrgz	%g1,	0x295,	%g3
	edge16	%l2,	%g4,	%g7
	fpmerge	%f19,	%f11,	%f30
	movrgez	%i7,	%i2,	%i0
	mova	%xcc,	%g6,	%o1
	mulscc	%g5,	%g2,	%o0
	movneg	%icc,	%o4,	%i1
	smulcc	%o7,	0x17E5,	%l6
	movrgez	%l5,	0x3C1,	%l3
	std	%f10,	[%l7 + 0x08]
	orcc	%i6,	0x1851,	%l1
	membar	0x46
	fnot2s	%f31,	%f21
	fbn	%fcc0,	loop_1977
	tne	%icc,	0x1
	andcc	%l4,	0x1321,	%o2
	fmovrsgz	%i4,	%f4,	%f30
loop_1977:
	prefetch	[%l7 + 0x4C],	 0x1
	tge	%xcc,	0x2
	be,a,pt	%icc,	loop_1978
	tvs	%xcc,	0x0
	lduw	[%l7 + 0x20],	%o5
	call	loop_1979
loop_1978:
	mulscc	%l0,	0x11D0,	%o6
	tn	%xcc,	0x3
	fbule,a	%fcc2,	loop_1980
loop_1979:
	edge16	%i5,	%i3,	%g1
	set	0x60, %i6
	lda	[%l7 + %i6] 0x15,	%f29
loop_1980:
	lduh	[%l7 + 0x40],	%g3
	umulcc	%l2,	0x0BF7,	%g4
	edge16n	%g7,	%i7,	%i2
	edge32l	%o3,	%i0,	%o1
	bvc,a,pt	%icc,	loop_1981
	popc	%g6,	%g2
	sllx	%o0,	0x0F,	%g5
	tpos	%xcc,	0x2
loop_1981:
	alignaddr	%o4,	%i1,	%o7
	ldd	[%l7 + 0x20],	%l4
	sllx	%l3,	%i6,	%l1
	fbg	%fcc1,	loop_1982
	tcs	%icc,	0x2
	nop
	setx loop_1983, %l0, %l1
	jmpl %l1, %l6
	fmovrse	%o2,	%f29,	%f10
loop_1982:
	sdiv	%l4,	0x1D05,	%o5
	xnor	%l0,	0x14B0,	%i4
loop_1983:
	fcmped	%fcc3,	%f16,	%f28
	bleu,a,pn	%xcc,	loop_1984
	udivcc	%i5,	0x091B,	%i3
	edge32	%o6,	%g3,	%g1
	tgu	%icc,	0x1
loop_1984:
	movcs	%icc,	%l2,	%g4
	call	loop_1985
	edge32l	%i7,	%g7,	%i2
	subcc	%o3,	%o1,	%g6
	edge32n	%i0,	%g2,	%o0
loop_1985:
	edge16l	%g5,	%i1,	%o7
	fcmped	%fcc1,	%f18,	%f18
	stb	%l5,	[%l7 + 0x32]
	sra	%o4,	0x04,	%i6
	tpos	%xcc,	0x2
	fble	%fcc3,	loop_1986
	tcc	%xcc,	0x0
	and	%l1,	0x139B,	%l3
	fbge	%fcc3,	loop_1987
loop_1986:
	tg	%icc,	0x0
	array16	%o2,	%l6,	%l4
	tneg	%xcc,	0x3
loop_1987:
	andncc	%o5,	%l0,	%i4
	tpos	%icc,	0x0
	fmuld8sux16	%f14,	%f6,	%f30
	xor	%i3,	0x1E96,	%i5
	fpack16	%f30,	%f23
	bcs	loop_1988
	bcs,a,pt	%xcc,	loop_1989
	smul	%g3,	%g1,	%o6
	std	%l2,	[%l7 + 0x50]
loop_1988:
	sll	%i7,	%g7,	%g4
loop_1989:
	movrgez	%o3,	%i2,	%o1
	stbar
	wr	%g0,	0x18,	%asi
	sta	%f20,	[%l7 + 0x24] %asi
	fmovdn	%xcc,	%f18,	%f2
	set	0x28, %g3
	ldswa	[%l7 + %g3] 0x88,	%g6
	fcmpgt32	%f10,	%f4,	%g2
	fpadd32s	%f10,	%f14,	%f25
	sdiv	%i0,	0x134C,	%g5
	fmovdcs	%icc,	%f2,	%f16
	bg,a,pt	%xcc,	loop_1990
	fabss	%f16,	%f12
	srax	%o0,	%i1,	%o7
	subccc	%l5,	0x0FDC,	%i6
loop_1990:
	te	%xcc,	0x4
	nop
	setx	loop_1991,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	andcc	%l1,	0x1811,	%o4
	movne	%icc,	%o2,	%l3
	tvs	%xcc,	0x2
loop_1991:
	orncc	%l6,	0x194A,	%l4
	wr	%g0,	0x18,	%asi
	ldsha	[%l7 + 0x4E] %asi,	%l0
	xor	%o5,	%i4,	%i5
	fba	%fcc2,	loop_1992
	subcc	%g3,	0x1506,	%g1
	membar	0x41
	fbne,a	%fcc1,	loop_1993
loop_1992:
	fmovscs	%xcc,	%f7,	%f11
	taddcctv	%i3,	0x0CFB,	%o6
	tne	%xcc,	0x0
loop_1993:
	fmovrslez	%i7,	%f20,	%f25
	array16	%l2,	%g4,	%g7
	edge8n	%o3,	%i2,	%o1
	movle	%xcc,	%g2,	%i0
	brlz	%g5,	loop_1994
	fmovdcs	%icc,	%f11,	%f27
	movvs	%xcc,	%o0,	%i1
	fandnot2s	%f23,	%f11,	%f25
loop_1994:
	udivcc	%g6,	0x125D,	%l5
	fnot2	%f16,	%f0
	smul	%i6,	0x1998,	%l1
	wr	%g0,	0x89,	%asi
	sta	%f10,	[%l7 + 0x24] %asi
	fcmpgt32	%f0,	%f20,	%o7
	fmovsl	%icc,	%f27,	%f11
	subcc	%o2,	0x180E,	%l3
	be	%xcc,	loop_1995
	umul	%o4,	%l6,	%l4
	fmuld8sux16	%f16,	%f23,	%f14
	sllx	%l0,	0x1C,	%i4
loop_1995:
	bcs,a,pn	%icc,	loop_1996
	tcs	%xcc,	0x2
	sdiv	%i5,	0x1616,	%g3
	edge8	%o5,	%i3,	%g1
loop_1996:
	fmovrslez	%i7,	%f13,	%f30
	faligndata	%f10,	%f26,	%f24
	brgz,a	%o6,	loop_1997
	tne	%xcc,	0x0
	taddcctv	%g4,	%l2,	%g7
	membar	#Sync
	wr	%g0,	0xf9,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
loop_1997:
	bneg,a	%icc,	loop_1998
	move	%xcc,	%o3,	%i2
	movl	%xcc,	%g2,	%i0
	smul	%g5,	0x1C9B,	%o1
loop_1998:
	be,a	loop_1999
	sdiv	%i1,	0x08E8,	%g6
	tle	%xcc,	0x7
	smul	%o0,	%l5,	%l1
loop_1999:
	sdivx	%i6,	0x100B,	%o7
	flush	%l7 + 0x2C
	fmovrdlz	%l3,	%f30,	%f4
	movg	%xcc,	%o2,	%o4
	add	%l7,	0x08,	%l6
	wr	%g0,	0x10,	%asi
	casa	[%l6] 0x10,	%l4,	%l6
	ldd	[%l7 + 0x30],	%f26
	for	%f20,	%f30,	%f16
	bneg,pt	%icc,	loop_2000
	sir	0x0585
	set	0x28, %o4
	ldxa	[%l7 + %o4] 0x88,	%i4
loop_2000:
	fbn,a	%fcc0,	loop_2001
	fmovspos	%xcc,	%f0,	%f24
	fnot2	%f6,	%f4
	fmovdcc	%icc,	%f21,	%f2
loop_2001:
	nop
	set	0x44, %o2
	lduwa	[%l7 + %o2] 0x0c,	%i5
	set	0x5A, %o7
	stha	%g3,	[%l7 + %o7] 0x04
	subc	%o5,	%i3,	%l0
	fmovdvs	%xcc,	%f9,	%f20
	tneg	%xcc,	0x0
	umulcc	%g1,	0x0793,	%i7
	fmovrde	%g4,	%f16,	%f14
	sub	%o6,	0x0306,	%g7
	sllx	%l2,	%o3,	%i2
	sdivcc	%g2,	0x17EE,	%g5
	movne	%icc,	%o1,	%i0
	tpos	%icc,	0x2
	movrlz	%i1,	%g6,	%o0
	fmovdle	%icc,	%f10,	%f0
	sll	%l1,	%l5,	%i6
	orncc	%o7,	0x1A27,	%o2
	fnot2	%f18,	%f4
	brgez,a	%l3,	loop_2002
	sethi	0x0311,	%l4
	fzeros	%f22
	fsrc2	%f4,	%f30
loop_2002:
	fbn	%fcc2,	loop_2003
	andncc	%o4,	%i4,	%l6
	array32	%i5,	%o5,	%i3
	movrne	%l0,	0x38A,	%g1
loop_2003:
	fexpand	%f0,	%f2
	taddcctv	%i7,	%g3,	%o6
	fbule	%fcc3,	loop_2004
	smulcc	%g4,	0x08B3,	%g7
	ta	%xcc,	0x2
	alignaddr	%o3,	%l2,	%g2
loop_2004:
	movge	%icc,	%g5,	%i2
	mova	%xcc,	%o1,	%i0
	fmovrde	%i1,	%f2,	%f30
	edge16l	%o0,	%g6,	%l5
	sra	%i6,	0x1E,	%o7
	orn	%l1,	0x1EA4,	%o2
	fmovdvs	%xcc,	%f17,	%f26
	fbn,a	%fcc2,	loop_2005
	fpackfix	%f6,	%f19
	tcs	%xcc,	0x6
	tleu	%xcc,	0x4
loop_2005:
	umul	%l3,	0x1F34,	%o4
	tg	%xcc,	0x1
	edge16	%i4,	%l4,	%i5
	std	%f4,	[%l7 + 0x70]
	edge8	%l6,	%i3,	%o5
	ta	%xcc,	0x6
	te	%icc,	0x6
	or	%g1,	%i7,	%l0
	sir	0x1D5B
	movn	%xcc,	%o6,	%g4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsg	%xcc,	%f23,	%f28
	addccc	%g3,	%g7,	%l2
	movge	%icc,	%o3,	%g5
	bcs,pn	%xcc,	loop_2006
	tsubcctv	%g2,	0x1FF5,	%i2
	edge16n	%o1,	%i0,	%o0
	xnor	%i1,	0x12CB,	%l5
loop_2006:
	sir	0x16D9
	set	0x20, %i1
	ldda	[%l7 + %i1] 0x80,	%g6
	tsubcctv	%i6,	0x02AA,	%o7
	movrlz	%o2,	%l3,	%l1
	fblg,a	%fcc0,	loop_2007
	tleu	%xcc,	0x5
	fpsub16	%f8,	%f2,	%f4
	tneg	%icc,	0x6
loop_2007:
	sdivx	%o4,	0x1089,	%i4
	sir	0x0F59
	tsubcctv	%l4,	%l6,	%i5
	movrlez	%i3,	0x09D,	%o5
	sdivx	%g1,	0x1996,	%i7
	ta	%xcc,	0x7
	fbg,a	%fcc3,	loop_2008
	xor	%o6,	%l0,	%g4
	wr	%g0,	0x81,	%asi
	lduwa	[%l7 + 0x10] %asi,	%g7
loop_2008:
	fcmpne32	%f18,	%f22,	%g3
	wr	%g0,	0x04,	%asi
	sta	%f4,	[%l7 + 0x7C] %asi
	and	%l2,	0x0F83,	%o3
	subcc	%g5,	0x0997,	%i2
	movrlez	%g2,	0x0CE,	%o1
	sub	%i0,	0x0512,	%i1
	movl	%icc,	%l5,	%g6
	srl	%o0,	%o7,	%i6
	tsubcc	%o2,	0x07F8,	%l1
	add	%l3,	0x1DB1,	%o4
	movpos	%icc,	%i4,	%l6
	fbule	%fcc0,	loop_2009
	movcs	%xcc,	%i5,	%i3
	edge16ln	%l4,	%g1,	%i7
	edge32n	%o6,	%l0,	%o5
loop_2009:
	tn	%xcc,	0x3
	srlx	%g4,	0x0C,	%g7
	andncc	%g3,	%o3,	%l2
	add	%l7,	0x24,	%l6
	wr	%g0,	0x19,	%asi
	casa	[%l6] 0x19,	%i2,	%g2
	taddcctv	%g5,	0x00BD,	%i0
	set	0x2A, %o6
	ldsba	[%l7 + %o6] 0x81,	%i1
	wr	%g0,	0x80,	%asi
	swapa	[%l7 + 0x14] %asi,	%l5
	edge8	%g6,	%o0,	%o7
	fpack32	%f18,	%f22,	%f26
	edge8n	%o1,	%o2,	%i6
	edge8n	%l3,	%l1,	%i4
	add	%l7,	0x10,	%l6
	wr	%g0,	0x18,	%asi
	casxa	[%l6] 0x18,	%o4,	%l6
	bvs,a,pn	%xcc,	loop_2010
	fmovs	%f19,	%f3
	taddcc	%i5,	%i3,	%l4
	fornot1s	%f25,	%f3,	%f20
loop_2010:
	tsubcc	%g1,	%i7,	%l0
	array16	%o5,	%o6,	%g4
	movgu	%xcc,	%g3,	%o3
	edge16ln	%l2,	%i2,	%g2
	fzeros	%f7
	set	0x30, %g7
	ldsha	[%l7 + %g7] 0x88,	%g5
	ldsb	[%l7 + 0x6C],	%g7
	fbu,a	%fcc1,	loop_2011
	sub	%i0,	0x07E9,	%l5
	fbne	%fcc1,	loop_2012
	fmovsn	%icc,	%f20,	%f17
loop_2011:
	movrlez	%i1,	0x2A3,	%o0
	orcc	%o7,	%o1,	%g6
loop_2012:
	movle	%xcc,	%o2,	%l3
	sdivx	%i6,	0x0F41,	%l1
	movrlez	%i4,	0x070,	%l6
	tsubcc	%i5,	%i3,	%o4
	set	0x54, %g6
	stba	%l4,	[%l7 + %g6] 0x89
	edge16l	%g1,	%l0,	%o5
	movne	%icc,	%i7,	%g4
	edge16l	%g3,	%o6,	%o3
	nop
	set	0x5C, %l5
	lduw	[%l7 + %l5],	%l2
	faligndata	%f30,	%f8,	%f14
	fmovsle	%icc,	%f31,	%f14
	fbul	%fcc3,	loop_2013
	ta	%icc,	0x0
	addc	%i2,	0x1658,	%g2
	ld	[%l7 + 0x18],	%f31
loop_2013:
	edge16n	%g5,	%i0,	%l5
	wr	%g0,	0x18,	%asi
	stxa	%g7,	[%l7 + 0x28] %asi
	std	%f24,	[%l7 + 0x70]
	fpmerge	%f15,	%f29,	%f20
	popc	0x0FE3,	%i1
	fbe,a	%fcc0,	loop_2014
	edge8	%o7,	%o1,	%g6
	be,a	%xcc,	loop_2015
	nop
	setx loop_2016, %l0, %l1
	jmpl %l1, %o0
loop_2014:
	sdivcc	%o2,	0x0894,	%l3
	orcc	%l1,	0x16EA,	%i6
loop_2015:
	fandnot1s	%f3,	%f30,	%f20
loop_2016:
	fbug,a	%fcc0,	loop_2017
	fcmpne32	%f2,	%f28,	%i4
	movpos	%icc,	%l6,	%i5
	sll	%o4,	%l4,	%i3
loop_2017:
	pdist	%f20,	%f22,	%f8
	fmovsn	%xcc,	%f6,	%f30
	srlx	%l0,	%g1,	%i7
	fbu	%fcc0,	loop_2018
	orcc	%g4,	%o5,	%o6
	brgez,a	%o3,	loop_2019
	fnegd	%f30,	%f10
loop_2018:
	smul	%g3,	%l2,	%i2
	fpackfix	%f0,	%f12
loop_2019:
	fxor	%f2,	%f2,	%f4
	subccc	%g5,	%i0,	%g2
	edge16n	%g7,	%l5,	%i1
	fmovsvc	%icc,	%f15,	%f31
	smul	%o7,	%g6,	%o0
	wr	%g0,	0x19,	%asi
	ldsha	[%l7 + 0x4A] %asi,	%o2
	fandnot1s	%f24,	%f28,	%f5
	fone	%f4
	udiv	%o1,	0x18C8,	%l1
	udivx	%i6,	0x08F4,	%i4
	lduh	[%l7 + 0x28],	%l3
	nop
	setx	loop_2020,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	array16	%i5,	%o4,	%l4
	fone	%f2
	movcc	%icc,	%l6,	%i3
loop_2020:
	fmul8x16au	%f20,	%f30,	%f16
	taddcctv	%g1,	%i7,	%g4
	ble,pn	%icc,	loop_2021
	addc	%o5,	0x1C8D,	%l0
	array16	%o6,	%g3,	%l2
	set	0x60, %i4
	ldda	[%l7 + %i4] 0x88,	%i2
loop_2021:
	addc	%g5,	0x041F,	%o3
	fnot2	%f18,	%f30
	umul	%i0,	%g7,	%l5
	movrlz	%g2,	%i1,	%o7
	edge16ln	%g6,	%o2,	%o0
	set	0x40, %i0
	stda	%f16,	[%l7 + %i0] 0x88
	bneg	loop_2022
	tcs	%xcc,	0x0
	tsubcc	%o1,	0x1405,	%l1
	wr	%g0,	0x80,	%asi
	stha	%i4,	[%l7 + 0x3C] %asi
loop_2022:
	fmovspos	%xcc,	%f25,	%f7
	set	0x48, %i5
	lduwa	[%l7 + %i5] 0x80,	%l3
	sir	0x0E01
	ta	%xcc,	0x3
	fmul8x16	%f8,	%f0,	%f10
	and	%i6,	0x0870,	%o4
	fmovdl	%icc,	%f24,	%f20
	wr	%g0,	0x11,	%asi
	sta	%f21,	[%l7 + 0x38] %asi
	nop
	set	0x08, %i2
	ldsw	[%l7 + %i2],	%i5
	movg	%icc,	%l6,	%l4
	set	0x08, %l4
	stba	%i3,	[%l7 + %l4] 0x81
	fble,a	%fcc0,	loop_2023
	fmovdg	%xcc,	%f6,	%f6
	edge8l	%i7,	%g4,	%o5
	movcc	%xcc,	%l0,	%g1
loop_2023:
	movge	%icc,	%g3,	%o6
	sra	%i2,	%l2,	%o3
	sdivx	%g5,	0x09D0,	%i0
	srlx	%g7,	%g2,	%i1
	fmovrdgz	%l5,	%f12,	%f6
	add	%l7,	0x40,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%g6,	%o2
	fmovrsgez	%o7,	%f15,	%f13
	andncc	%o0,	%o1,	%l1
	move	%xcc,	%l3,	%i6
	be,pn	%xcc,	loop_2024
	te	%icc,	0x1
	tcc	%icc,	0x5
	tge	%icc,	0x7
loop_2024:
	fmovsl	%icc,	%f26,	%f21
	fbo,a	%fcc0,	loop_2025
	udivx	%o4,	0x0CA3,	%i5
	fexpand	%f25,	%f0
	fxors	%f26,	%f27,	%f14
loop_2025:
	fpack16	%f16,	%f4
	bne	%icc,	loop_2026
	fbul,a	%fcc1,	loop_2027
	alignaddr	%i4,	%l6,	%i3
	subcc	%i7,	0x04CE,	%l4
loop_2026:
	brgz,a	%o5,	loop_2028
loop_2027:
	fpadd32	%f28,	%f28,	%f12
	array16	%l0,	%g1,	%g3
	array8	%o6,	%i2,	%g4
loop_2028:
	ldd	[%l7 + 0x50],	%l2
	ldx	[%l7 + 0x50],	%o3
	taddcc	%i0,	%g7,	%g2
	tge	%xcc,	0x0
	bn,pn	%icc,	loop_2029
	smul	%i1,	%l5,	%g6
	tcs	%icc,	0x4
	bcs,a	%xcc,	loop_2030
loop_2029:
	bn,a	loop_2031
	fbule,a	%fcc2,	loop_2032
	xnor	%g5,	%o7,	%o0
loop_2030:
	movcs	%icc,	%o1,	%l1
loop_2031:
	addccc	%l3,	%i6,	%o2
loop_2032:
	tne	%xcc,	0x2
	and	%i5,	0x1D04,	%o4
	edge16l	%i4,	%l6,	%i7
	movne	%icc,	%l4,	%i3
	tcc	%xcc,	0x2
	fbn,a	%fcc2,	loop_2033
	stx	%l0,	[%l7 + 0x70]
	addcc	%o5,	0x1235,	%g3
	set	0x40, %i7
	ldda	[%l7 + %i7] 0xea,	%g0
loop_2033:
	udivx	%o6,	0x0EDD,	%i2
	fmovdge	%icc,	%f17,	%f21
	sra	%g4,	0x1B,	%l2
	tleu	%xcc,	0x6
	fmovdcs	%icc,	%f17,	%f18
	movge	%xcc,	%o3,	%i0
	fmul8x16al	%f2,	%f18,	%f10
	umulcc	%g2,	0x0C58,	%i1
	fnot2	%f6,	%f6
	fandnot1s	%f20,	%f15,	%f27
	ldx	[%l7 + 0x70],	%l5
	fnot1	%f20,	%f26
	fornot2	%f30,	%f0,	%f0
	fcmps	%fcc3,	%f17,	%f26
	or	%g7,	0x0AD7,	%g5
	fpmerge	%f8,	%f21,	%f0
	andn	%o7,	0x0DCA,	%g6
	movcs	%icc,	%o0,	%l1
	ldsh	[%l7 + 0x0E],	%l3
	tn	%xcc,	0x7
	alignaddr	%i6,	%o2,	%i5
	fornot2	%f24,	%f30,	%f4
	wr	%g0,	0x81,	%asi
	prefetcha	[%l7 + 0x18] %asi,	 0x1
	andncc	%i4,	%l6,	%i7
	movneg	%xcc,	%l4,	%i3
	tvc	%xcc,	0x1
	fbne	%fcc2,	loop_2034
	mulx	%l0,	0x1F2C,	%o5
	fbug,a	%fcc2,	loop_2035
	fmovrsgez	%g3,	%f5,	%f10
loop_2034:
	smulcc	%o4,	%g1,	%i2
	sethi	0x0ABD,	%o6
loop_2035:
	sir	0x17BD
	fandnot2s	%f30,	%f28,	%f21
	nop
	set	0x10, %o1
	lduw	[%l7 + %o1],	%g4
	mulscc	%o3,	%i0,	%g2
	sub	%l2,	%l5,	%g7
	nop
	setx	loop_2036,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fbue,a	%fcc2,	loop_2037
	orncc	%i1,	%g5,	%g6
	tge	%icc,	0x1
loop_2036:
	nop
	wr	%g0,	0x11,	%asi
	prefetcha	[%l7 + 0x78] %asi,	 0x2
loop_2037:
	bcs,a	%icc,	loop_2038
	fandnot2	%f18,	%f26,	%f6
	fmovrsne	%l1,	%f14,	%f0
	addc	%o7,	0x09F5,	%l3
loop_2038:
	array16	%o2,	%i5,	%o1
	andcc	%i4,	0x1323,	%l6
	movneg	%icc,	%i7,	%l4
	tvs	%xcc,	0x2
	fcmped	%fcc2,	%f24,	%f24
	tpos	%xcc,	0x3
	array32	%i6,	%l0,	%o5
	wr	%g0,	0x10,	%asi
	prefetcha	[%l7 + 0x38] %asi,	 0x1
	edge32ln	%g3,	%o4,	%g1
	tcc	%icc,	0x0
	fpackfix	%f6,	%f28
	sir	0x1B93
	nop
	set	0x10, %g4
	ldx	[%l7 + %g4],	%i2
	fmovrsgz	%g4,	%f4,	%f19
	udivcc	%o3,	0x1107,	%i0
	tne	%xcc,	0x7
	ldstub	[%l7 + 0x75],	%g2
	fnot1	%f2,	%f28
	membar	0x24
	movcs	%icc,	%o6,	%l5
	set	0x40, %l6
	stda	%f0,	[%l7 + %l6] 0x89
	movneg	%xcc,	%g7,	%i1
	tle	%xcc,	0x1
	edge32l	%g5,	%g6,	%l2
	ldstub	[%l7 + 0x7B],	%l1
	flush	%l7 + 0x10
	fpadd32s	%f1,	%f4,	%f16
	and	%o0,	0x169A,	%o7
	movvs	%icc,	%l3,	%o2
	fbuge,a	%fcc0,	loop_2039
	movre	%o1,	0x2B7,	%i5
	flush	%l7 + 0x14
	siam	0x5
loop_2039:
	nop
	set	0x08, %i3
	stxa	%l6,	[%l7 + %i3] 0x18
	movle	%xcc,	%i4,	%i7
	movre	%i6,	%l4,	%l0
	fmovsvc	%xcc,	%f7,	%f12
	edge8l	%i3,	%o5,	%o4
	ldstub	[%l7 + 0x11],	%g3
	fmovdpos	%xcc,	%f11,	%f25
	wr	%g0,	0x89,	%asi
	stha	%i2,	[%l7 + 0x5E] %asi
	fble	%fcc2,	loop_2040
	edge32l	%g4,	%o3,	%i0
	fpsub16s	%f29,	%f10,	%f22
	ldsb	[%l7 + 0x4F],	%g2
loop_2040:
	fble	%fcc1,	loop_2041
	orncc	%g1,	0x118B,	%l5
	movl	%xcc,	%g7,	%i1
	for	%f18,	%f30,	%f26
loop_2041:
	umulcc	%g5,	%g6,	%l2
	movne	%xcc,	%o6,	%o0
	ldd	[%l7 + 0x58],	%f26
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	taddcctv	%l1,	0x009C,	%l3
	be	%icc,	loop_2042
	movne	%xcc,	%o7,	%o2
	alignaddr	%i5,	%o1,	%i4
	bn,a,pt	%xcc,	loop_2043
loop_2042:
	movrne	%l6,	0x11D,	%i6
	taddcctv	%i7,	%l4,	%i3
	bn	%xcc,	loop_2044
loop_2043:
	ldd	[%l7 + 0x30],	%o4
	fcmpne32	%f10,	%f2,	%o4
	movrlez	%g3,	0x34F,	%l0
loop_2044:
	stbar
	movrne	%i2,	0x021,	%g4
	ldsb	[%l7 + 0x11],	%i0
	set	0x14, %o3
	ldstuba	[%l7 + %o3] 0x04,	%g2
	set	0x64, %g5
	swapa	[%l7 + %g5] 0x18,	%o3
	movle	%xcc,	%g1,	%g7
	edge8n	%l5,	%i1,	%g6
	fmovdvc	%icc,	%f15,	%f23
	tcc	%icc,	0x7
	fmovrslez	%g5,	%f5,	%f18
	array32	%l2,	%o0,	%o6
	movle	%xcc,	%l3,	%l1
	movcs	%icc,	%o7,	%o2
	tvc	%xcc,	0x5
	brz,a	%i5,	loop_2045
	movne	%xcc,	%o1,	%i4
	fpsub16	%f14,	%f10,	%f18
	sra	%l6,	%i7,	%i6
loop_2045:
	bshuffle	%f8,	%f14,	%f20
	tsubcc	%i3,	%o5,	%l4
	fmovde	%icc,	%f13,	%f3
	xor	%o4,	0x1971,	%g3
	fmul8x16au	%f12,	%f19,	%f18
	xnor	%l0,	%g4,	%i2
	and	%g2,	%o3,	%i0
	fmovscc	%xcc,	%f23,	%f30
	fmovdpos	%xcc,	%f25,	%f31
	sllx	%g7,	0x13,	%l5
	movleu	%xcc,	%i1,	%g1
	addccc	%g5,	%g6,	%l2
	add	%o0,	%o6,	%l1
	alignaddr	%o7,	%o2,	%i5
	fbl	%fcc1,	loop_2046
	te	%xcc,	0x0
	subcc	%l3,	%o1,	%l6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2046:
	st	%f17,	[%l7 + 0x20]
	fzero	%f6
	fzeros	%f9
	fpsub32	%f16,	%f8,	%f2
	alignaddrl	%i4,	%i6,	%i3
	udivcc	%i7,	0x06DA,	%o5
	tl	%xcc,	0x1
	subc	%l4,	%o4,	%l0
	tcs	%icc,	0x3
	nop
	setx	loop_2047,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	stb	%g3,	[%l7 + 0x0D]
	fpadd32s	%f3,	%f9,	%f23
	for	%f22,	%f16,	%f4
loop_2047:
	nop
	wr	%g0,	0x18,	%asi
	lduba	[%l7 + 0x6F] %asi,	%i2
	fpadd16	%f12,	%f28,	%f8
	movcc	%icc,	%g4,	%o3
	bcs,pt	%icc,	loop_2048
	fandnot1s	%f21,	%f23,	%f0
	tcs	%icc,	0x7
	movn	%icc,	%i0,	%g7
loop_2048:
	addccc	%g2,	%i1,	%l5
	xnorcc	%g5,	%g1,	%l2
	subc	%g6,	%o6,	%o0
	fmovdle	%xcc,	%f27,	%f22
	xor	%l1,	0x1129,	%o7
	tne	%icc,	0x6
	fmovrde	%i5,	%f26,	%f0
	udiv	%l3,	0x0CB8,	%o1
	brlz	%l6,	loop_2049
	edge8ln	%i4,	%i6,	%o2
	ldub	[%l7 + 0x5D],	%i3
	movre	%o5,	%l4,	%o4
loop_2049:
	tge	%icc,	0x1
	fmovrsgez	%i7,	%f31,	%f7
	fmovsleu	%icc,	%f26,	%f7
	fornot1	%f4,	%f26,	%f2
	fbule	%fcc3,	loop_2050
	edge32	%g3,	%l0,	%i2
	or	%g4,	%i0,	%o3
	flush	%l7 + 0x48
loop_2050:
	bleu,pt	%icc,	loop_2051
	alignaddrl	%g7,	%g2,	%l5
	sra	%i1,	0x12,	%g5
	wr	%g0,	0x81,	%asi
	lduba	[%l7 + 0x2E] %asi,	%l2
loop_2051:
	stx	%g6,	[%l7 + 0x40]
	xnor	%g1,	%o0,	%o6
	movn	%xcc,	%o7,	%i5
	tpos	%icc,	0x2
	sethi	0x05C6,	%l1
	fmovrsgz	%l3,	%f6,	%f8
	movrlez	%o1,	%l6,	%i4
	fmovdg	%icc,	%f30,	%f11
	fsrc1s	%f16,	%f26
	movrgz	%i6,	%i3,	%o5
	fbule	%fcc2,	loop_2052
	fmul8ulx16	%f0,	%f20,	%f28
	tgu	%xcc,	0x0
	sllx	%o2,	0x12,	%o4
loop_2052:
	tne	%xcc,	0x1
	fmuld8ulx16	%f21,	%f1,	%f4
	edge16l	%l4,	%g3,	%i7
	sub	%i2,	0x1E33,	%g4
	fmovrdgz	%l0,	%f18,	%f8
	fcmple16	%f12,	%f10,	%i0
	array32	%g7,	%o3,	%g2
	siam	0x1
	flush	%l7 + 0x08
	fbg	%fcc2,	loop_2053
	orn	%l5,	%g5,	%l2
	fmul8x16	%f21,	%f4,	%f14
	sll	%i1,	0x1D,	%g1
loop_2053:
	movcs	%icc,	%o0,	%g6
	brlz,a	%o6,	loop_2054
	and	%i5,	0x1DD7,	%l1
	sll	%o7,	0x03,	%o1
	xnor	%l6,	0x1489,	%i4
loop_2054:
	xorcc	%i6,	0x0ACA,	%l3
	smul	%i3,	%o2,	%o4
	movne	%xcc,	%o5,	%g3
	fexpand	%f27,	%f30
	fxors	%f1,	%f11,	%f31
	fmovdpos	%icc,	%f8,	%f29
	tl	%xcc,	0x2
	fmovrdgz	%i7,	%f30,	%f28
	orn	%l4,	0x148B,	%i2
	movpos	%xcc,	%l0,	%i0
	orcc	%g7,	%g4,	%o3
	stw	%g2,	[%l7 + 0x0C]
	fandnot2s	%f29,	%f17,	%f16
	edge8n	%l5,	%g5,	%i1
	bn,a	%xcc,	loop_2055
	udivcc	%g1,	0x0A54,	%o0
	brlz	%g6,	loop_2056
	siam	0x0
loop_2055:
	sub	%o6,	%l2,	%i5
	fsrc1	%f14,	%f12
loop_2056:
	edge16l	%l1,	%o1,	%o7
	edge8l	%l6,	%i6,	%i4
	srl	%i3,	%o2,	%l3
	wr	%g0,	0x10,	%asi
	prefetcha	[%l7 + 0x58] %asi,	 0x1
	movrgz	%g3,	0x34E,	%o4
	edge32ln	%l4,	%i7,	%l0
	array16	%i0,	%i2,	%g7
	edge32n	%g4,	%g2,	%o3
	xnor	%g5,	0x0974,	%i1
	fmovdne	%xcc,	%f19,	%f20
	bg,pt	%xcc,	loop_2057
	nop
	set	0x55, %o0
	ldsb	[%l7 + %o0],	%l5
	orcc	%g1,	0x132A,	%g6
	mova	%icc,	%o0,	%l2
loop_2057:
	udivcc	%i5,	0x09DD,	%l1
	fmovdge	%xcc,	%f10,	%f18
	edge8	%o6,	%o7,	%l6
	umulcc	%i6,	%o1,	%i4
	bn,a	loop_2058
	xor	%i3,	%l3,	%o5
	tsubcc	%o2,	0x0836,	%g3
	movvs	%xcc,	%o4,	%l4
loop_2058:
	xnorcc	%l0,	0x1F9E,	%i7
	fbul,a	%fcc3,	loop_2059
	brgz,a	%i0,	loop_2060
	movrgez	%i2,	%g7,	%g2
	fcmpgt32	%f16,	%f4,	%g4
loop_2059:
	xnor	%g5,	0x1489,	%o3
loop_2060:
	fxnors	%f9,	%f15,	%f10
	sdivcc	%l5,	0x0173,	%i1
	movle	%icc,	%g1,	%o0
	wr	%g0,	0x19,	%asi
	ldstuba	[%l7 + 0x11] %asi,	%l2
	edge8ln	%g6,	%i5,	%l1
	fcmpd	%fcc0,	%f18,	%f18
	fpmerge	%f29,	%f25,	%f12
	ldsh	[%l7 + 0x6A],	%o6
	for	%f28,	%f28,	%f6
	ble,pn	%icc,	loop_2061
	tn	%icc,	0x1
	udiv	%o7,	0x1605,	%l6
	xorcc	%o1,	0x0B5F,	%i6
loop_2061:
	brlz,a	%i4,	loop_2062
	fcmpgt16	%f14,	%f30,	%i3
	srl	%o5,	%o2,	%g3
	tcc	%icc,	0x6
loop_2062:
	alignaddrl	%o4,	%l4,	%l0
	fzero	%f0
	fmovde	%icc,	%f9,	%f25
	sir	0x08EB
	tvc	%icc,	0x7
	mulscc	%i7,	0x167B,	%i0
	movn	%xcc,	%l3,	%g7
	fbl,a	%fcc2,	loop_2063
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andncc	%g2,	%i2,	%g4
	edge16n	%o3,	%g5,	%l5
loop_2063:
	fbu	%fcc1,	loop_2064
	move	%icc,	%i1,	%g1
	fba	%fcc2,	loop_2065
	fmovrsne	%o0,	%f30,	%f19
loop_2064:
	nop
	setx	loop_2066,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movneg	%icc,	%l2,	%i5
loop_2065:
	movle	%xcc,	%g6,	%l1
	bvc,a	loop_2067
loop_2066:
	swap	[%l7 + 0x54],	%o7
	fmovscs	%xcc,	%f9,	%f22
	popc	%o6,	%l6
loop_2067:
	mulscc	%o1,	%i4,	%i3
	swap	[%l7 + 0x68],	%o5
	sllx	%o2,	0x01,	%g3
	bg,pt	%icc,	loop_2068
	subccc	%i6,	%l4,	%o4
	fpack32	%f0,	%f4,	%f30
	tsubcctv	%i7,	%l0,	%l3
loop_2068:
	movgu	%xcc,	%g7,	%i0
	set	0x48, %g1
	prefetcha	[%l7 + %g1] 0x0c,	 0x2
	bcc	%icc,	loop_2069
	fbu,a	%fcc0,	loop_2070
	alignaddr	%g4,	%o3,	%g5
	std	%f2,	[%l7 + 0x40]
loop_2069:
	tle	%xcc,	0x7
loop_2070:
	nop
	set	0x10, %l0
	ldx	[%l7 + %l0],	%l5
	flush	%l7 + 0x10
	xnor	%i2,	%g1,	%i1
	fsrc1s	%f4,	%f2
	tn	%icc,	0x7
	movcc	%icc,	%o0,	%i5
	addc	%g6,	0x1C25,	%l2
	fpsub32	%f8,	%f0,	%f2
	brlz	%l1,	loop_2071
	tgu	%xcc,	0x3
	nop
	setx	loop_2072,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	std	%o6,	[%l7 + 0x40]
loop_2071:
	fnegd	%f2,	%f2
	bl,a	loop_2073
loop_2072:
	flush	%l7 + 0x74
	edge32ln	%l6,	%o1,	%o6
	fcmpne32	%f28,	%f6,	%i4
loop_2073:
	movvs	%xcc,	%i3,	%o5
	fnegd	%f10,	%f10
	bcc,a,pn	%xcc,	loop_2074
	sth	%o2,	[%l7 + 0x60]
	fnot2s	%f27,	%f28
	fors	%f2,	%f0,	%f0
loop_2074:
	xor	%g3,	%i6,	%l4
	fsrc2	%f30,	%f28
	movrlz	%o4,	%l0,	%l3
	edge32	%g7,	%i0,	%g2
	movg	%icc,	%i7,	%g4
	mulscc	%g5,	%o3,	%l5
	umulcc	%i2,	0x1E5F,	%g1
	umulcc	%o0,	%i5,	%i1
	bvs,pn	%xcc,	loop_2075
	addccc	%g6,	%l1,	%o7
	alignaddr	%l6,	%o1,	%l2
	fxors	%f1,	%f22,	%f12
loop_2075:
	nop
	set	0x3C, %o5
	lduba	[%l7 + %o5] 0x15,	%o6
	ldsb	[%l7 + 0x31],	%i3
	lduh	[%l7 + 0x3E],	%i4
	array16	%o5,	%o2,	%g3
	popc	0x1CD4,	%i6
	fmovrsgz	%l4,	%f10,	%f20
	wr	%g0,	0x52,	%asi
	ldxa	[%g0 + 0x110] %asi,	%l0
	nop
	setx	loop_2076,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tsubcc	%l3,	0x08F7,	%g7
	orcc	%i0,	0x0AFB,	%g2
	xorcc	%o4,	%g4,	%g5
loop_2076:
	tsubcctv	%i7,	%o3,	%i2
	fbge,a	%fcc2,	loop_2077
	movle	%icc,	%g1,	%o0
	movl	%xcc,	%i5,	%i1
	add	%l5,	0x08EB,	%l1
loop_2077:
	fmovrdlez	%o7,	%f20,	%f12
	movneg	%icc,	%l6,	%g6
	addcc	%o1,	%o6,	%l2
	fbo,a	%fcc2,	loop_2078
	nop
	set	0x40, %l1
	ldd	[%l7 + %l1],	%f20
	tleu	%icc,	0x7
	movre	%i4,	%i3,	%o5
loop_2078:
	tcc	%icc,	0x6
	tgu	%xcc,	0x7
	fmovrsgez	%o2,	%f10,	%f0
	alignaddr	%i6,	%g3,	%l0
	andcc	%l4,	0x07E6,	%l3
	wr	%g0,	0x80,	%asi
	ldstuba	[%l7 + 0x2F] %asi,	%i0
	sdivx	%g2,	0x1539,	%o4
	fmovspos	%icc,	%f7,	%f24
	fmovdcs	%icc,	%f9,	%f25
	fbuge	%fcc0,	loop_2079
	movrgez	%g4,	%g7,	%g5
	mulscc	%o3,	%i7,	%g1
	nop
	setx	loop_2080,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_2079:
	movrgz	%o0,	0x222,	%i5
	and	%i2,	%l5,	%l1
	stw	%i1,	[%l7 + 0x40]
loop_2080:
	fbuge,a	%fcc2,	loop_2081
	fbl,a	%fcc0,	loop_2082
	fnot1s	%f27,	%f7
	fmovsle	%xcc,	%f11,	%f6
loop_2081:
	nop
	set	0x38, %l2
	ldstuba	[%l7 + %l2] 0x19,	%o7
loop_2082:
	bgu,pt	%icc,	loop_2083
	edge16l	%l6,	%o1,	%g6
	and	%l2,	%o6,	%i4
	bgu,a,pn	%icc,	loop_2084
loop_2083:
	fbug,a	%fcc2,	loop_2085
	taddcc	%o5,	%i3,	%o2
	mulx	%i6,	0x0130,	%l0
loop_2084:
	udivx	%g3,	0x0A66,	%l4
loop_2085:
	andcc	%l3,	%i0,	%o4
	alignaddr	%g2,	%g7,	%g4
	bvs,a,pn	%xcc,	loop_2086
	movcs	%icc,	%g5,	%i7
	or	%o3,	0x0237,	%o0
	smulcc	%i5,	0x1451,	%i2
loop_2086:
	fpmerge	%f28,	%f3,	%f10
	fors	%f11,	%f28,	%f4
	subcc	%l5,	0x1549,	%g1
	or	%i1,	0x173D,	%o7
	movleu	%icc,	%l1,	%o1
	fmovscs	%xcc,	%f24,	%f7
	move	%xcc,	%g6,	%l2
	srlx	%o6,	0x03,	%i4
	subc	%l6,	%o5,	%o2
	bshuffle	%f18,	%f8,	%f18
	tcs	%icc,	0x3
	addc	%i3,	0x1364,	%i6
	flush	%l7 + 0x4C
	movrlz	%l0,	0x314,	%g3
	tn	%icc,	0x5
	movge	%icc,	%l4,	%l3
	fcmpeq32	%f24,	%f20,	%o4
	bgu,a,pn	%icc,	loop_2087
	movne	%icc,	%g2,	%i0
	fcmpne32	%f4,	%f22,	%g4
	fcmpgt16	%f26,	%f22,	%g7
loop_2087:
	array8	%g5,	%o3,	%o0
	orncc	%i5,	%i2,	%l5
	movg	%xcc,	%g1,	%i1
	xor	%i7,	%l1,	%o1
	fandnot1s	%f1,	%f17,	%f7
	array8	%g6,	%l2,	%o7
	fones	%f14
	udivx	%o6,	0x0180,	%l6
	set	0x50, %g2
	ldda	[%l7 + %g2] 0x19,	%i4
	tsubcctv	%o5,	0x05E4,	%o2
	wr	%g0,	0x80,	%asi
	ldswa	[%l7 + 0x3C] %asi,	%i3
	edge16n	%i6,	%l0,	%l4
	movleu	%icc,	%g3,	%o4
	bg,pn	%icc,	loop_2088
	tsubcc	%l3,	0x031A,	%g2
	tcs	%xcc,	0x1
	mulscc	%i0,	0x1155,	%g7
loop_2088:
	addc	%g5,	%o3,	%o0
	movrlz	%g4,	0x1F5,	%i2
	fpack16	%f2,	%f25
	bpos	loop_2089
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsg	%icc,	%f5,	%f30
	wr	%g0,	0x89,	%asi
	stwa	%l5,	[%l7 + 0x48] %asi
loop_2089:
	nop
	set	0x40, %i6
	stda	%f0,	[%l7 + %i6] 0x89
	sdivx	%i5,	0x19B5,	%i1
	mulx	%g1,	%l1,	%o1
	edge8n	%g6,	%i7,	%o7
	edge16l	%o6,	%l6,	%l2
	addccc	%i4,	0x111E,	%o5
	movne	%icc,	%o2,	%i6
	fmovscc	%xcc,	%f1,	%f24
	srlx	%i3,	%l0,	%l4
	std	%f10,	[%l7 + 0x20]
	fcmpne32	%f28,	%f12,	%o4
	fsrc1s	%f19,	%f28
	tne	%icc,	0x7
	fmovdneg	%icc,	%f10,	%f4
	edge8l	%l3,	%g2,	%i0
	fornot1	%f4,	%f0,	%f20
	fabss	%f6,	%f25
	tpos	%icc,	0x5
	alignaddr	%g7,	%g3,	%g5
	membar	0x42
	taddcctv	%o3,	%g4,	%o0
	tne	%xcc,	0x5
	std	%l4,	[%l7 + 0x70]
	wr	%g0,	0x89,	%asi
	ldsha	[%l7 + 0x24] %asi,	%i2
	set	0x52, %l3
	lduha	[%l7 + %l3] 0x10,	%i5
	smul	%i1,	%g1,	%l1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mova	%xcc,	%g6,	%o1
	fxor	%f6,	%f14,	%f24
	set	0x3C, %g3
	stba	%i7,	[%l7 + %g3] 0x15
	fmovspos	%icc,	%f31,	%f8
	tn	%icc,	0x1
	fcmple32	%f18,	%f2,	%o7
	sub	%l6,	%l2,	%i4
	tn	%icc,	0x0
	set	0x6E, %o4
	lduba	[%l7 + %o4] 0x11,	%o6
	udivx	%o5,	0x12C4,	%i6
	orncc	%i3,	0x0214,	%o2
	movcc	%xcc,	%l0,	%o4
	srl	%l3,	0x1E,	%g2
	pdist	%f12,	%f18,	%f12
	set	0x10, %o2
	stda	%l4,	[%l7 + %o2] 0x89
	edge32ln	%g7,	%i0,	%g5
	fmovdn	%icc,	%f31,	%f1
	fandnot1	%f24,	%f14,	%f16
	fpadd32s	%f2,	%f27,	%f0
	tle	%xcc,	0x1
	tl	%icc,	0x0
	wr	%g0,	0x4f,	%asi
	stxa	%o3,	[%g0 + 0x28] %asi
	bgu,a,pt	%xcc,	loop_2090
	and	%g3,	%o0,	%l5
	andncc	%i2,	%i5,	%g4
	orn	%i1,	%g1,	%g6
loop_2090:
	fzero	%f26
	fmovde	%xcc,	%f17,	%f23
	fmovsle	%xcc,	%f8,	%f7
	movn	%xcc,	%o1,	%l1
	and	%i7,	%l6,	%o7
	fmovdleu	%icc,	%f21,	%f29
	fpadd32s	%f15,	%f0,	%f25
	movle	%xcc,	%i4,	%l2
	wr	%g0,	0x89,	%asi
	swapa	[%l7 + 0x20] %asi,	%o5
	fmovrsgez	%i6,	%f8,	%f3
	movleu	%icc,	%o6,	%o2
	fnands	%f4,	%f16,	%f11
	sir	0x046A
	fmovspos	%xcc,	%f7,	%f23
	fbl,a	%fcc1,	loop_2091
	tgu	%xcc,	0x4
	fpackfix	%f28,	%f14
	set	0x7A, %o7
	ldsba	[%l7 + %o7] 0x80,	%l0
loop_2091:
	movge	%icc,	%i3,	%o4
	fbe	%fcc1,	loop_2092
	smul	%g2,	0x10C4,	%l4
	fbuge	%fcc1,	loop_2093
	fnegd	%f6,	%f6
loop_2092:
	fbge	%fcc1,	loop_2094
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2093:
	umulcc	%g7,	%l3,	%i0
	subcc	%g5,	0x02A1,	%o3
loop_2094:
	sir	0x0763
	ldx	[%l7 + 0x48],	%o0
	set	0x2A, %o6
	ldsha	[%l7 + %o6] 0x04,	%l5
	add	%l7,	0x50,	%l6
	wr	%g0,	0x10,	%asi
	casa	[%l6] 0x10,	%i2,	%g3
	fmovs	%f26,	%f14
	swap	[%l7 + 0x18],	%i5
	edge8	%i1,	%g1,	%g4
	movrgez	%g6,	%l1,	%o1
	movgu	%xcc,	%i7,	%o7
	nop
	set	0x68, %g7
	ldd	[%l7 + %g7],	%i4
	te	%xcc,	0x2
	edge8n	%l6,	%o5,	%l2
	fbul	%fcc2,	loop_2095
	bcs,a,pn	%icc,	loop_2096
	sdivcc	%i6,	0x0EAE,	%o2
	andncc	%o6,	%l0,	%o4
loop_2095:
	bneg,a	loop_2097
loop_2096:
	lduw	[%l7 + 0x48],	%i3
	ta	%xcc,	0x5
	movgu	%xcc,	%g2,	%g7
loop_2097:
	array16	%l3,	%l4,	%i0
	fexpand	%f1,	%f14
	fpadd32s	%f20,	%f16,	%f20
	set	0x38, %g6
	stha	%g5,	[%l7 + %g6] 0x14
	fcmpeq32	%f12,	%f28,	%o0
	tvs	%icc,	0x4
	movpos	%xcc,	%o3,	%l5
	fbl,a	%fcc2,	loop_2098
	fpackfix	%f18,	%f21
	wr	%g0,	0x04,	%asi
	lduwa	[%l7 + 0x44] %asi,	%g3
loop_2098:
	te	%icc,	0x4
	set	0x40, %l5
	stha	%i2,	[%l7 + %l5] 0x18
	flush	%l7 + 0x54
	lduw	[%l7 + 0x20],	%i5
	fmovdge	%xcc,	%f2,	%f20
	edge32	%i1,	%g1,	%g6
	wr	%g0,	0x27,	%asi
	stwa	%g4,	[%l7 + 0x60] %asi
	membar	#Sync
	orncc	%l1,	0x1ECE,	%o1
	mulx	%o7,	0x0A8B,	%i4
	fmovrslz	%l6,	%f25,	%f10
	fbug,a	%fcc3,	loop_2099
	fmovd	%f4,	%f10
	movvc	%xcc,	%o5,	%i7
	fornot2	%f12,	%f14,	%f26
loop_2099:
	nop
	set	0x48, %i4
	prefetcha	[%l7 + %i4] 0x04,	 0x1
	edge8n	%l2,	%o2,	%l0
	call	loop_2100
	nop
	setx	loop_2101,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fnands	%f7,	%f18,	%f9
	fbn	%fcc2,	loop_2102
loop_2100:
	fmovrde	%o4,	%f10,	%f8
loop_2101:
	nop
	set	0x10, %i1
	lda	[%l7 + %i1] 0x81,	%f20
loop_2102:
	brlez	%i3,	loop_2103
	orncc	%g2,	%o6,	%g7
	fbg,a	%fcc2,	loop_2104
	edge16ln	%l3,	%i0,	%l4
loop_2103:
	fmovdvc	%xcc,	%f26,	%f0
	be,a	loop_2105
loop_2104:
	array8	%g5,	%o0,	%l5
	fmul8x16	%f10,	%f12,	%f10
	fnot1s	%f26,	%f6
loop_2105:
	nop
	wr	%g0,	0x80,	%asi
	ldswa	[%l7 + 0x2C] %asi,	%o3
	tsubcctv	%g3,	%i5,	%i1
	set	0x44, %i5
	lduwa	[%l7 + %i5] 0x14,	%g1
	edge16n	%g6,	%g4,	%i2
	movcc	%xcc,	%l1,	%o7
	fbule	%fcc3,	loop_2106
	ld	[%l7 + 0x54],	%f5
	bcs,a,pn	%icc,	loop_2107
	stx	%o1,	[%l7 + 0x60]
loop_2106:
	srax	%i4,	0x00,	%l6
	tsubcctv	%i7,	0x1134,	%i6
loop_2107:
	bpos,a	loop_2108
	fnor	%f4,	%f0,	%f16
	array8	%l2,	%o2,	%o5
	fcmps	%fcc3,	%f25,	%f7
loop_2108:
	swap	[%l7 + 0x58],	%o4
	edge32	%l0,	%g2,	%i3
	tg	%xcc,	0x7
	bcs,pt	%icc,	loop_2109
	edge16ln	%g7,	%o6,	%i0
	ble,pn	%icc,	loop_2110
	tge	%icc,	0x3
loop_2109:
	tn	%xcc,	0x4
	lduh	[%l7 + 0x18],	%l4
loop_2110:
	fmovsa	%icc,	%f15,	%f5
	tl	%xcc,	0x3
	std	%l2,	[%l7 + 0x38]
	fnot1	%f30,	%f26
	set	0x20, %i0
	lda	[%l7 + %i0] 0x18,	%f20
	edge8ln	%o0,	%l5,	%o3
	array32	%g3,	%i5,	%i1
	fmovdl	%xcc,	%f26,	%f16
	stb	%g1,	[%l7 + 0x63]
	andcc	%g5,	%g6,	%i2
	alignaddr	%g4,	%l1,	%o1
	fxnor	%f6,	%f2,	%f10
	tge	%xcc,	0x4
	movrlz	%o7,	%l6,	%i4
	mulx	%i6,	0x0EF3,	%l2
	umulcc	%o2,	%i7,	%o4
	edge8l	%l0,	%g2,	%i3
	fmovrdgez	%o5,	%f8,	%f16
	call	loop_2111
	membar	0x68
	movcc	%icc,	%o6,	%g7
	wr	%g0,	0x81,	%asi
	ldswa	[%l7 + 0x60] %asi,	%i0
loop_2111:
	ta	%xcc,	0x5
	edge16ln	%l3,	%l4,	%l5
	subc	%o3,	0x0488,	%g3
	bl,a,pn	%xcc,	loop_2112
	movneg	%icc,	%i5,	%i1
	movne	%xcc,	%o0,	%g1
	edge32n	%g5,	%i2,	%g4
loop_2112:
	add	%l1,	%g6,	%o1
	fmovdneg	%xcc,	%f9,	%f0
	fmuld8ulx16	%f22,	%f7,	%f4
	fornot2	%f14,	%f2,	%f0
	sra	%o7,	%i4,	%i6
	tne	%xcc,	0x0
	ta	%icc,	0x4
	umul	%l6,	%l2,	%o2
	fcmpne32	%f30,	%f22,	%i7
	lduw	[%l7 + 0x28],	%l0
	std	%g2,	[%l7 + 0x38]
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tg	%xcc,	0x6
	tleu	%icc,	0x0
	udivx	%i3,	0x16F1,	%o4
	stx	%o5,	[%l7 + 0x08]
	fpsub32	%f24,	%f0,	%f2
	mulscc	%o6,	0x0C20,	%i0
	movvs	%xcc,	%l3,	%l4
	fpadd16	%f0,	%f28,	%f10
	brnz	%l5,	loop_2113
	fpsub16s	%f2,	%f13,	%f17
	edge32	%o3,	%g7,	%g3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2113:
	ba,pt	%xcc,	loop_2114
	fbule,a	%fcc2,	loop_2115
	edge32n	%i1,	%o0,	%g1
	membar	0x0B
loop_2114:
	fbn,a	%fcc3,	loop_2116
loop_2115:
	orn	%g5,	0x07ED,	%i2
	bshuffle	%f6,	%f16,	%f10
	xnor	%i5,	0x016D,	%l1
loop_2116:
	bleu,pt	%xcc,	loop_2117
	movle	%icc,	%g4,	%g6
	movrlez	%o1,	%o7,	%i6
	mova	%xcc,	%l6,	%i4
loop_2117:
	brgz,a	%l2,	loop_2118
	ldsb	[%l7 + 0x5A],	%o2
	fcmple32	%f22,	%f26,	%l0
	fpadd16	%f22,	%f20,	%f24
loop_2118:
	fpack16	%f12,	%f22
	set	0x16, %l4
	stha	%g2,	[%l7 + %l4] 0x89
	prefetch	[%l7 + 0x3C],	 0x2
	flush	%l7 + 0x18
	movle	%xcc,	%i3,	%o4
	movcs	%xcc,	%o5,	%o6
	tneg	%icc,	0x1
	addcc	%i7,	0x051D,	%i0
	fmovdvc	%xcc,	%f17,	%f4
	smulcc	%l4,	0x09DE,	%l5
	taddcctv	%o3,	%l3,	%g7
	mulscc	%i1,	0x0951,	%g3
	te	%xcc,	0x5
	movle	%xcc,	%o0,	%g5
	edge32n	%i2,	%g1,	%l1
	orn	%g4,	0x0A49,	%i5
	srax	%o1,	%o7,	%i6
	fabsd	%f24,	%f8
	stb	%l6,	[%l7 + 0x69]
	edge32ln	%g6,	%l2,	%o2
	movleu	%xcc,	%i4,	%l0
	fcmps	%fcc0,	%f20,	%f10
	fmovsvc	%icc,	%f31,	%f29
	ba,a	%icc,	loop_2119
	fornot2s	%f10,	%f30,	%f28
	tn	%icc,	0x0
	fnegd	%f16,	%f20
loop_2119:
	bpos,a,pn	%icc,	loop_2120
	movvc	%xcc,	%i3,	%o4
	lduh	[%l7 + 0x46],	%o5
	orn	%o6,	0x0177,	%g2
loop_2120:
	alignaddrl	%i0,	%i7,	%l5
	call	loop_2121
	tcc	%xcc,	0x1
	fmovsl	%xcc,	%f19,	%f22
	movvs	%icc,	%o3,	%l3
loop_2121:
	fbu,a	%fcc3,	loop_2122
	fmovrde	%l4,	%f10,	%f18
	array16	%g7,	%g3,	%i1
	nop
	setx	loop_2123,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_2122:
	prefetch	[%l7 + 0x4C],	 0x0
	fxnor	%f20,	%f6,	%f8
	fbe	%fcc2,	loop_2124
loop_2123:
	fbg,a	%fcc3,	loop_2125
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tpos	%xcc,	0x1
loop_2124:
	fcmpne32	%f26,	%f12,	%o0
loop_2125:
	fandnot1s	%f5,	%f24,	%f28
	bvc,pn	%icc,	loop_2126
	movre	%g5,	%i2,	%g1
	tg	%xcc,	0x5
	movvc	%icc,	%g4,	%i5
loop_2126:
	fpsub16	%f0,	%f26,	%f28
	movne	%icc,	%l1,	%o1
	edge32l	%i6,	%o7,	%l6
	fnot1	%f18,	%f30
	fcmpgt32	%f2,	%f12,	%l2
	fblg	%fcc3,	loop_2127
	edge8n	%o2,	%i4,	%g6
	brlez	%i3,	loop_2128
	membar	0x3D
loop_2127:
	brlz	%o4,	loop_2129
	tle	%xcc,	0x2
loop_2128:
	movg	%icc,	%l0,	%o6
	subccc	%o5,	0x0D4F,	%g2
loop_2129:
	tsubcc	%i0,	%i7,	%l5
	fnot1s	%f7,	%f17
	swap	[%l7 + 0x58],	%l3
	fsrc2	%f10,	%f22
	orncc	%o3,	0x1257,	%g7
	sir	0x1FF3
	movrlz	%l4,	%i1,	%o0
	movge	%xcc,	%g3,	%g5
	fmovsleu	%xcc,	%f22,	%f26
	fxors	%f7,	%f5,	%f12
	xor	%g1,	0x1B29,	%g4
	tle	%xcc,	0x0
	movleu	%xcc,	%i5,	%i2
	smul	%l1,	%i6,	%o7
	fsrc2	%f22,	%f14
	set	0x48, %i2
	stwa	%l6,	[%l7 + %i2] 0x23
	membar	#Sync
	fbne	%fcc0,	loop_2130
	fbl	%fcc2,	loop_2131
	tpos	%icc,	0x7
	membar	0x3B
loop_2130:
	stb	%o1,	[%l7 + 0x3A]
loop_2131:
	add	%o2,	%l2,	%g6
	sub	%i4,	0x054C,	%i3
	sir	0x0E5A
	nop
	setx	loop_2132,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	edge16ln	%l0,	%o4,	%o6
	edge32n	%o5,	%i0,	%i7
	nop
	setx loop_2133, %l0, %l1
	jmpl %l1, %g2
loop_2132:
	tl	%icc,	0x4
	taddcc	%l3,	%o3,	%g7
	fmovrdgz	%l4,	%f30,	%f0
loop_2133:
	nop
	set	0x78, %i7
	ldsw	[%l7 + %i7],	%i1
	fpsub16	%f18,	%f24,	%f2
	sdiv	%l5,	0x0469,	%g3
	fnors	%f31,	%f13,	%f16
	tgu	%icc,	0x3
	umul	%o0,	0x0861,	%g5
	wr	%g0,	0x80,	%asi
	stwa	%g4,	[%l7 + 0x64] %asi
	fzeros	%f25
	sdiv	%g1,	0x1A96,	%i2
	sllx	%l1,	%i6,	%o7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mulscc	%l6,	%o1,	%o2
	fornot2	%f14,	%f16,	%f24
	wr	%g0,	0x80,	%asi
	lda	[%l7 + 0x54] %asi,	%f27
	tle	%xcc,	0x0
	xor	%i5,	0x0DB0,	%g6
	movrlz	%i4,	0x3C1,	%l2
	subcc	%i3,	0x10B4,	%l0
	tgu	%icc,	0x4
	tn	%xcc,	0x6
	edge32n	%o4,	%o6,	%i0
	movrne	%i7,	0x20B,	%o5
	bleu	loop_2134
	stx	%l3,	[%l7 + 0x60]
	orcc	%g2,	%o3,	%g7
	fmovsg	%xcc,	%f12,	%f10
loop_2134:
	movneg	%xcc,	%i1,	%l5
	te	%icc,	0x6
	sdiv	%g3,	0x064D,	%l4
	nop
	setx	loop_2135,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fbu,a	%fcc3,	loop_2136
	fmovdleu	%icc,	%f10,	%f30
	fmovs	%f19,	%f19
loop_2135:
	subcc	%o0,	%g5,	%g1
loop_2136:
	nop
	wr	%g0,	0x89,	%asi
	ldsba	[%l7 + 0x1C] %asi,	%g4
	udivcc	%l1,	0x0AEB,	%i2
	array8	%o7,	%l6,	%i6
	edge32l	%o2,	%i5,	%o1
	srlx	%i4,	0x1C,	%l2
	ldd	[%l7 + 0x50],	%f12
	tg	%icc,	0x6
	tleu	%xcc,	0x5
	orn	%i3,	%l0,	%o4
	fble,a	%fcc2,	loop_2137
	movg	%xcc,	%o6,	%g6
	xnor	%i0,	0x1BB7,	%o5
	fmovsneg	%icc,	%f5,	%f27
loop_2137:
	nop
	set	0x2C, %g4
	sta	%f30,	[%l7 + %g4] 0x18
	xor	%l3,	0x005E,	%i7
	orn	%g2,	%o3,	%g7
	fmovdneg	%xcc,	%f8,	%f28
	edge16	%i1,	%l5,	%l4
	movge	%xcc,	%o0,	%g3
	fpackfix	%f10,	%f8
	array16	%g1,	%g4,	%l1
	fmovsneg	%icc,	%f16,	%f13
	fmovdl	%icc,	%f4,	%f19
	add	%g5,	0x0CDE,	%o7
	edge16ln	%l6,	%i6,	%o2
	udivx	%i5,	0x1559,	%i2
	addcc	%i4,	%o1,	%i3
	wr	%g0,	0x10,	%asi
	ldswa	[%l7 + 0x24] %asi,	%l0
	set	0x38, %o1
	sta	%f9,	[%l7 + %o1] 0x80
	edge16l	%l2,	%o4,	%o6
	add	%g6,	0x1110,	%o5
	stw	%l3,	[%l7 + 0x24]
	tpos	%icc,	0x5
	bgu,a	%xcc,	loop_2138
	mulscc	%i7,	%i0,	%o3
	udivx	%g2,	0x0E0E,	%i1
	movrne	%g7,	0x131,	%l5
loop_2138:
	edge32l	%l4,	%o0,	%g1
	movrlez	%g4,	%g3,	%g5
	bgu,pn	%icc,	loop_2139
	tgu	%icc,	0x1
	tleu	%icc,	0x0
	bge,a,pn	%xcc,	loop_2140
loop_2139:
	edge32n	%l1,	%o7,	%i6
	ta	%icc,	0x2
	fmul8x16au	%f22,	%f31,	%f20
loop_2140:
	andn	%o2,	0x0A54,	%i5
	addc	%l6,	%i2,	%i4
	brgez	%i3,	loop_2141
	fmovsge	%icc,	%f16,	%f18
	addccc	%o1,	%l0,	%l2
	edge16	%o4,	%g6,	%o5
loop_2141:
	tneg	%icc,	0x7
	sdivcc	%l3,	0x1FB5,	%o6
	add	%i7,	%o3,	%g2
	movg	%xcc,	%i0,	%g7
	sdiv	%i1,	0x0D88,	%l5
	fxnors	%f26,	%f26,	%f15
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8n	%l4,	%o0,	%g1
	fcmpes	%fcc2,	%f25,	%f20
	fmuld8sux16	%f25,	%f9,	%f26
	alignaddrl	%g3,	%g5,	%g4
	st	%f20,	[%l7 + 0x5C]
	ta	%xcc,	0x7
	fbn	%fcc3,	loop_2142
	srax	%o7,	0x16,	%l1
	alignaddrl	%i6,	%i5,	%o2
	tgu	%icc,	0x1
loop_2142:
	tl	%xcc,	0x1
	fcmpne16	%f30,	%f18,	%i2
	array32	%i4,	%l6,	%o1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	st	%f15,	[%l7 + 0x54]
	movcs	%icc,	%l0,	%l2
	fmovsa	%icc,	%f1,	%f17
	fmovspos	%icc,	%f22,	%f21
	andcc	%o4,	0x1089,	%g6
	movn	%xcc,	%i3,	%o5
	fmovsge	%icc,	%f30,	%f8
	movre	%l3,	0x3B7,	%i7
	fzero	%f28
	sra	%o6,	%o3,	%g2
	srlx	%g7,	%i0,	%l5
	fpadd32	%f2,	%f10,	%f24
	faligndata	%f18,	%f24,	%f10
	and	%l4,	%o0,	%g1
	fandnot2	%f30,	%f0,	%f14
	nop
	set	0x18, %l6
	std	%f30,	[%l7 + %l6]
	orncc	%g3,	%i1,	%g4
	set	0x28, %o3
	sta	%f1,	[%l7 + %o3] 0x88
	fbue	%fcc1,	loop_2143
	ta	%icc,	0x7
	wr	%g0,	0x81,	%asi
	stxa	%o7,	[%l7 + 0x30] %asi
loop_2143:
	fcmpgt16	%f18,	%f20,	%g5
	subcc	%l1,	0x1F70,	%i5
	fbge	%fcc2,	loop_2144
	bl,a,pn	%xcc,	loop_2145
	popc	0x1958,	%i6
	fpackfix	%f24,	%f24
loop_2144:
	fnand	%f24,	%f10,	%f8
loop_2145:
	brgz	%o2,	loop_2146
	fpsub32	%f28,	%f2,	%f6
	movne	%icc,	%i2,	%l6
	movrgz	%i4,	%o1,	%l2
loop_2146:
	movge	%xcc,	%l0,	%g6
	sll	%i3,	0x1E,	%o4
	fmovrslz	%o5,	%f28,	%f30
	edge8n	%i7,	%o6,	%l3
	sdiv	%o3,	0x13C6,	%g2
	srl	%g7,	0x01,	%i0
	wr	%g0,	0x04,	%asi
	prefetcha	[%l7 + 0x38] %asi,	 0x1
	andncc	%l4,	%o0,	%g3
	tvc	%icc,	0x6
	fnot2	%f2,	%f4
	bpos,pn	%icc,	loop_2147
	sra	%i1,	%g1,	%g4
	alignaddr	%o7,	%l1,	%g5
	fornot2s	%f25,	%f18,	%f15
loop_2147:
	xor	%i5,	%o2,	%i6
	bpos,a	%icc,	loop_2148
	xor	%i2,	0x0FF6,	%i4
	orncc	%l6,	0x1990,	%l2
	brgz,a	%l0,	loop_2149
loop_2148:
	edge32n	%o1,	%g6,	%o4
	movg	%icc,	%i3,	%o5
	udivcc	%i7,	0x025F,	%l3
loop_2149:
	edge32l	%o3,	%g2,	%g7
	sir	0x1D07
	fcmple16	%f14,	%f24,	%o6
	te	%xcc,	0x1
	swap	[%l7 + 0x28],	%i0
	fcmpgt16	%f28,	%f30,	%l5
	movvs	%xcc,	%l4,	%o0
	tvc	%xcc,	0x2
	bneg,a,pt	%xcc,	loop_2150
	edge16n	%i1,	%g1,	%g3
	ldd	[%l7 + 0x28],	%f0
	array16	%g4,	%o7,	%g5
loop_2150:
	alignaddr	%l1,	%o2,	%i6
	edge16n	%i2,	%i4,	%l6
	fmuld8ulx16	%f24,	%f22,	%f18
	tn	%xcc,	0x4
	movn	%xcc,	%i5,	%l2
	tl	%icc,	0x0
	stx	%o1,	[%l7 + 0x28]
	bshuffle	%f6,	%f26,	%f2
	alignaddr	%l0,	%g6,	%o4
	fcmps	%fcc1,	%f21,	%f26
	mulx	%o5,	0x0E3F,	%i3
	tge	%icc,	0x5
	movleu	%icc,	%l3,	%o3
	fmovdg	%icc,	%f24,	%f11
	subccc	%i7,	0x0868,	%g7
	brlz	%g2,	loop_2151
	edge16ln	%i0,	%l5,	%l4
	edge16l	%o6,	%o0,	%i1
	array32	%g3,	%g1,	%o7
loop_2151:
	edge16ln	%g5,	%g4,	%l1
	edge32	%i6,	%i2,	%i4
	tcc	%icc,	0x7
	fmovsg	%xcc,	%f21,	%f17
	movg	%xcc,	%o2,	%l6
	te	%xcc,	0x6
	stbar
	fpadd16	%f12,	%f22,	%f24
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udiv	%i5,	0x0C85,	%o1
	set	0x40, %i3
	ldxa	[%l7 + %i3] 0x80,	%l2
	subc	%l0,	%o4,	%g6
	fcmple16	%f24,	%f6,	%i3
	andcc	%o5,	0x06EC,	%o3
	xnor	%l3,	%g7,	%i7
	sir	0x1ABB
	orcc	%g2,	0x0BC0,	%i0
	fmovsa	%xcc,	%f23,	%f15
	sdiv	%l5,	0x0865,	%o6
	movre	%o0,	%l4,	%i1
	fnors	%f28,	%f21,	%f21
	ba,pt	%xcc,	loop_2152
	edge16l	%g1,	%g3,	%o7
	movrne	%g5,	0x2E4,	%g4
	edge8	%l1,	%i6,	%i4
loop_2152:
	brgz	%o2,	loop_2153
	fbu,a	%fcc3,	loop_2154
	srlx	%l6,	%i2,	%i5
	tneg	%icc,	0x2
loop_2153:
	nop
	wr	%g0,	0x89,	%asi
	swapa	[%l7 + 0x14] %asi,	%l2
loop_2154:
	swap	[%l7 + 0x1C],	%o1
	tg	%icc,	0x4
	movge	%xcc,	%o4,	%l0
	taddcctv	%i3,	0x09E7,	%o5
	fmovdgu	%icc,	%f2,	%f31
	set	0x4B, %o0
	stba	%o3,	[%l7 + %o0] 0x18
	fsrc2	%f6,	%f8
	lduw	[%l7 + 0x0C],	%g6
	movrgez	%l3,	0x223,	%g7
	wr	%g0,	0x89,	%asi
	sta	%f3,	[%l7 + 0x6C] %asi
	fmovdcs	%xcc,	%f9,	%f7
	movne	%icc,	%i7,	%g2
	tl	%icc,	0x1
	subc	%i0,	%l5,	%o6
	fxnors	%f1,	%f21,	%f12
	fcmple32	%f0,	%f18,	%o0
	tle	%xcc,	0x1
	taddcctv	%i1,	0x044E,	%l4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16n	%g3,	%o7,	%g1
	movrlez	%g4,	%g5,	%l1
	tvc	%xcc,	0x6
	array8	%i6,	%i4,	%l6
	add	%o2,	%i5,	%l2
	set	0x40, %g1
	stda	%f16,	[%l7 + %g1] 0xf0
	membar	#Sync
	fsrc2s	%f10,	%f30
	udivx	%o1,	0x18E1,	%i2
	fcmpeq16	%f20,	%f4,	%o4
	fbule,a	%fcc0,	loop_2155
	movl	%xcc,	%i3,	%l0
	movn	%icc,	%o5,	%g6
	umul	%l3,	0x18CF,	%o3
loop_2155:
	ldd	[%l7 + 0x50],	%f30
	fmovdle	%xcc,	%f26,	%f22
	fmovdg	%xcc,	%f2,	%f1
	tneg	%icc,	0x7
	fors	%f25,	%f16,	%f10
	orcc	%i7,	0x1FB4,	%g7
	fmovsge	%xcc,	%f18,	%f2
	brlz	%g2,	loop_2156
	fmovrsne	%l5,	%f8,	%f25
	lduh	[%l7 + 0x1A],	%o6
	srlx	%i0,	%o0,	%i1
loop_2156:
	call	loop_2157
	edge8l	%g3,	%l4,	%g1
	wr	%g0,	0x04,	%asi
	lduba	[%l7 + 0x24] %asi,	%o7
loop_2157:
	movrgez	%g4,	0x160,	%g5
	movvs	%icc,	%l1,	%i4
	brgz	%i6,	loop_2158
	tsubcctv	%o2,	0x04D4,	%i5
	fmul8x16al	%f27,	%f26,	%f2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2158:
	lduh	[%l7 + 0x3C],	%l2
	brgez	%l6,	loop_2159
	fba	%fcc2,	loop_2160
	ldd	[%l7 + 0x28],	%f18
	add	%o1,	%i2,	%i3
loop_2159:
	mova	%xcc,	%l0,	%o4
loop_2160:
	sub	%g6,	%l3,	%o3
	fmovsn	%xcc,	%f11,	%f19
	edge8n	%i7,	%o5,	%g7
	tleu	%icc,	0x6
	fbne	%fcc1,	loop_2161
	fandnot2	%f20,	%f26,	%f20
	bgu	loop_2162
	subcc	%l5,	%o6,	%g2
loop_2161:
	bneg,a	loop_2163
	bneg	loop_2164
loop_2162:
	fmovrse	%i0,	%f11,	%f26
	ble,a,pn	%xcc,	loop_2165
loop_2163:
	andncc	%i1,	%g3,	%l4
loop_2164:
	te	%icc,	0x2
	orcc	%o0,	0x1B80,	%g1
loop_2165:
	fmovde	%icc,	%f27,	%f9
	edge32l	%o7,	%g5,	%g4
	fmovsne	%icc,	%f28,	%f16
	tsubcc	%l1,	0x17F5,	%i4
	bg	%icc,	loop_2166
	taddcctv	%i6,	0x1296,	%i5
	taddcc	%o2,	0x0FD0,	%l2
	subccc	%o1,	0x0EBF,	%l6
loop_2166:
	nop
	set	0x38, %l0
	stda	%i2,	[%l7 + %l0] 0x2f
	membar	#Sync
	movneg	%xcc,	%l0,	%i3
	tvc	%xcc,	0x2
	std	%f20,	[%l7 + 0x68]
	fbe,a	%fcc2,	loop_2167
	movg	%icc,	%g6,	%l3
	movvc	%xcc,	%o4,	%o3
	te	%xcc,	0x1
loop_2167:
	membar	0x65
	srlx	%o5,	0x11,	%i7
	movpos	%xcc,	%g7,	%l5
	tcc	%xcc,	0x2
	srax	%o6,	%g2,	%i1
	call	loop_2168
	bleu	loop_2169
	addcc	%g3,	0x0553,	%l4
	te	%xcc,	0x6
loop_2168:
	movl	%xcc,	%i0,	%g1
loop_2169:
	smul	%o7,	%o0,	%g4
	fbue	%fcc1,	loop_2170
	fmul8ulx16	%f26,	%f24,	%f18
	popc	%g5,	%l1
	tcc	%icc,	0x4
loop_2170:
	taddcctv	%i6,	%i5,	%i4
	flush	%l7 + 0x7C
	srl	%o2,	0x14,	%l2
	set	0x68, %g5
	ldswa	[%l7 + %g5] 0x19,	%o1
	bleu,a	loop_2171
	sub	%l6,	%i2,	%l0
	array8	%i3,	%g6,	%l3
	edge32n	%o4,	%o3,	%i7
loop_2171:
	ld	[%l7 + 0x64],	%f21
	fsrc1s	%f13,	%f17
	wr	%g0,	0x18,	%asi
	lda	[%l7 + 0x2C] %asi,	%f26
	movle	%icc,	%g7,	%o5
	sdivcc	%o6,	0x15E0,	%l5
	movrgz	%i1,	0x30B,	%g2
	xorcc	%l4,	%g3,	%i0
	membar	0x57
	movgu	%icc,	%g1,	%o0
	tcc	%icc,	0x6
	alignaddr	%o7,	%g5,	%g4
	fpadd16	%f20,	%f8,	%f30
	fpackfix	%f22,	%f23
	array16	%i6,	%l1,	%i5
	addc	%i4,	0x1BB4,	%o2
	sub	%l2,	0x07CE,	%l6
	tsubcctv	%i2,	%o1,	%i3
	edge32n	%l0,	%l3,	%g6
	ldx	[%l7 + 0x48],	%o3
	set	0x54, %o5
	lduwa	[%l7 + %o5] 0x19,	%i7
	orcc	%g7,	%o4,	%o6
	fornot1	%f10,	%f18,	%f20
	fmovrde	%l5,	%f2,	%f14
	fmovsle	%xcc,	%f12,	%f8
	wr	%g0,	0x11,	%asi
	ldxa	[%l7 + 0x70] %asi,	%i1
	fornot1	%f26,	%f20,	%f4
	movre	%o5,	%g2,	%l4
	ble,pt	%icc,	loop_2172
	alignaddrl	%i0,	%g1,	%g3
	andncc	%o7,	%o0,	%g4
	orn	%i6,	0x037F,	%g5
loop_2172:
	edge16n	%l1,	%i4,	%o2
	bcs,pt	%xcc,	loop_2173
	sra	%l2,	0x1B,	%l6
	fnot2	%f10,	%f20
	move	%icc,	%i2,	%o1
loop_2173:
	nop
	set	0x43, %l2
	ldub	[%l7 + %l2],	%i3
	udiv	%l0,	0x044F,	%i5
	nop
	set	0x18, %l1
	ldd	[%l7 + %l1],	%g6
	movre	%o3,	0x0F6,	%l3
	ba	%xcc,	loop_2174
	fbn	%fcc0,	loop_2175
	tsubcctv	%i7,	%g7,	%o4
	fbn	%fcc3,	loop_2176
loop_2174:
	ldsb	[%l7 + 0x45],	%l5
loop_2175:
	movrlez	%i1,	0x06F,	%o5
	fnot1s	%f19,	%f24
loop_2176:
	nop
	wr	%g0,	0x0c,	%asi
	ldstuba	[%l7 + 0x3E] %asi,	%o6
	edge32l	%g2,	%l4,	%i0
	stb	%g3,	[%l7 + 0x76]
	movvs	%xcc,	%g1,	%o7
	bgu,a	loop_2177
	bvs	%icc,	loop_2178
	movg	%icc,	%g4,	%i6
	fcmpne16	%f0,	%f2,	%o0
loop_2177:
	nop
	set	0x18, %i6
	stxa	%g5,	[%l7 + %i6] 0x04
loop_2178:
	nop
	wr	%g0,	0x52,	%asi
	stxa	%l1,	[%g0 + 0x208] %asi
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movg	%icc,	%i4,	%o2
	srl	%l2,	0x13,	%i2
	edge8n	%o1,	%i3,	%l0
	ldub	[%l7 + 0x7C],	%l6
	fmovspos	%xcc,	%f16,	%f17
	fbo,a	%fcc3,	loop_2179
	tvc	%xcc,	0x5
	fbe	%fcc1,	loop_2180
	edge16l	%g6,	%i5,	%l3
loop_2179:
	movre	%o3,	%g7,	%o4
	sllx	%i7,	0x1E,	%l5
loop_2180:
	fbu	%fcc2,	loop_2181
	fbu,a	%fcc0,	loop_2182
	tcc	%icc,	0x5
	fandnot2s	%f2,	%f20,	%f30
loop_2181:
	movrne	%o5,	0x192,	%i1
loop_2182:
	bn,a,pt	%xcc,	loop_2183
	edge8ln	%o6,	%g2,	%i0
	sdivcc	%g3,	0x0BE7,	%g1
	tvc	%icc,	0x5
loop_2183:
	andn	%l4,	%o7,	%i6
	nop
	setx	loop_2184,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	mulscc	%g4,	%g5,	%l1
	fones	%f2
	tl	%icc,	0x6
loop_2184:
	orcc	%o0,	%i4,	%o2
	set	0x20, %g2
	lda	[%l7 + %g2] 0x04,	%f9
	fbu	%fcc3,	loop_2185
	udiv	%l2,	0x1126,	%o1
	movrgez	%i3,	0x16D,	%l0
	sdivcc	%i2,	0x1496,	%l6
loop_2185:
	fmovscc	%icc,	%f29,	%f30
	tle	%xcc,	0x4
	srax	%g6,	0x06,	%l3
	fcmps	%fcc0,	%f24,	%f7
	ldsh	[%l7 + 0x20],	%i5
	ldx	[%l7 + 0x28],	%o3
	std	%f2,	[%l7 + 0x28]
	lduw	[%l7 + 0x60],	%o4
	fmovdle	%icc,	%f3,	%f28
	edge16l	%g7,	%i7,	%o5
	or	%l5,	0x1483,	%i1
	fxnor	%f14,	%f14,	%f4
	flush	%l7 + 0x40
	or	%o6,	0x0717,	%g2
	set	0x40, %l3
	stda	%f0,	[%l7 + %l3] 0xf8
	membar	#Sync
	tcs	%icc,	0x4
	umul	%g3,	%i0,	%g1
	lduw	[%l7 + 0x14],	%l4
	fbul	%fcc1,	loop_2186
	fmul8ulx16	%f14,	%f8,	%f28
	fcmpeq32	%f4,	%f2,	%o7
	tg	%icc,	0x7
loop_2186:
	ldsh	[%l7 + 0x6E],	%g4
	taddcctv	%g5,	%l1,	%i6
	fblg,a	%fcc0,	loop_2187
	fmovdvs	%xcc,	%f5,	%f22
	wr	%g0,	0x89,	%asi
	ldswa	[%l7 + 0x24] %asi,	%o0
loop_2187:
	tcc	%icc,	0x3
	movrlez	%o2,	%l2,	%o1
	umul	%i4,	0x0A2E,	%i3
	add	%l0,	0x16A2,	%i2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	swap	[%l7 + 0x30],	%g6
	faligndata	%f4,	%f0,	%f22
	edge32ln	%l6,	%i5,	%o3
	xnor	%l3,	%g7,	%o4
	add	%o5,	0x169D,	%l5
	array8	%i1,	%o6,	%g2
	movpos	%xcc,	%i7,	%g3
	fmovsge	%xcc,	%f17,	%f13
	movrne	%i0,	0x29E,	%g1
	fmovdgu	%icc,	%f27,	%f29
	movg	%icc,	%o7,	%l4
	fcmps	%fcc0,	%f22,	%f20
	nop
	setx	loop_2188,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	and	%g4,	%l1,	%g5
	movg	%icc,	%o0,	%o2
	movrlz	%i6,	0x33F,	%l2
loop_2188:
	orn	%i4,	%o1,	%l0
	and	%i2,	%i3,	%g6
	edge16	%i5,	%l6,	%o3
	movge	%icc,	%g7,	%o4
	sdivx	%o5,	0x014C,	%l3
	addccc	%i1,	0x04CD,	%l5
	fcmple16	%f22,	%f0,	%o6
	fpackfix	%f12,	%f27
	addccc	%g2,	0x0FE8,	%g3
	brlz,a	%i7,	loop_2189
	movrgz	%g1,	0x008,	%i0
	subcc	%l4,	%o7,	%g4
	edge32l	%l1,	%g5,	%o0
loop_2189:
	bvs,a,pn	%icc,	loop_2190
	fpsub16	%f18,	%f2,	%f12
	fnot2	%f30,	%f22
	sdiv	%i6,	0x1047,	%l2
loop_2190:
	orncc	%i4,	0x05C5,	%o2
	andcc	%o1,	0x0338,	%i2
	andn	%i3,	%g6,	%l0
	set	0x68, %o4
	stda	%i4,	[%l7 + %o4] 0xea
	membar	#Sync
	movpos	%icc,	%o3,	%l6
	tsubcctv	%o4,	0x10F4,	%o5
	edge32ln	%l3,	%i1,	%g7
	ble,a	loop_2191
	movpos	%icc,	%l5,	%g2
	bneg,a,pn	%xcc,	loop_2192
	nop
	setx	loop_2193,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_2191:
	fxor	%f4,	%f4,	%f26
	tleu	%xcc,	0x0
loop_2192:
	edge16l	%o6,	%i7,	%g3
loop_2193:
	edge16ln	%g1,	%l4,	%i0
	addccc	%g4,	0x0AEB,	%l1
	addccc	%o7,	%g5,	%o0
	fmovsgu	%xcc,	%f3,	%f16
	sethi	0x189C,	%l2
	fnot2s	%f29,	%f18
	fblg	%fcc2,	loop_2194
	sll	%i6,	0x17,	%i4
	fabsd	%f26,	%f18
	xnorcc	%o1,	0x05EA,	%o2
loop_2194:
	and	%i2,	0x04F9,	%g6
	edge8	%i3,	%l0,	%i5
	xnor	%o3,	0x0B78,	%l6
	set	0x3C, %o2
	ldswa	[%l7 + %o2] 0x89,	%o4
	movrne	%o5,	0x1B9,	%l3
	ldstub	[%l7 + 0x49],	%g7
	orncc	%i1,	%l5,	%g2
	wr	%g0,	0x80,	%asi
	ldswa	[%l7 + 0x5C] %asi,	%i7
	udiv	%g3,	0x022A,	%o6
	edge8	%g1,	%l4,	%g4
	edge8n	%i0,	%l1,	%g5
	lduh	[%l7 + 0x64],	%o0
	add	%o7,	0x1AFD,	%i6
	fmovde	%icc,	%f16,	%f12
	fpadd16	%f28,	%f24,	%f0
	add	%i4,	0x04CB,	%o1
	movleu	%icc,	%l2,	%o2
	sir	0x1F2F
	be,pn	%xcc,	loop_2195
	sra	%g6,	%i2,	%i3
	tpos	%icc,	0x5
	mulx	%i5,	0x069A,	%l0
loop_2195:
	fmovdle	%xcc,	%f30,	%f23
	fblg	%fcc3,	loop_2196
	edge16n	%o3,	%o4,	%o5
	fbo	%fcc0,	loop_2197
	fpsub32	%f14,	%f22,	%f20
loop_2196:
	fmovse	%icc,	%f24,	%f9
	movcc	%icc,	%l6,	%l3
loop_2197:
	movn	%icc,	%i1,	%l5
	prefetch	[%l7 + 0x3C],	 0x2
	array32	%g7,	%i7,	%g2
	or	%o6,	%g1,	%l4
	wr	%g0,	0x10,	%asi
	ldsha	[%l7 + 0x58] %asi,	%g4
	movrlez	%i0,	0x3AE,	%g3
	brlz,a	%g5,	loop_2198
	movrgz	%l1,	%o7,	%o0
	andn	%i6,	%i4,	%o1
	tsubcc	%l2,	0x0522,	%g6
loop_2198:
	nop
	set	0x28, %o7
	stda	%i2,	[%l7 + %o7] 0xe2
	membar	#Sync
	sra	%i3,	0x06,	%o2
	mulx	%l0,	%o3,	%i5
	srax	%o4,	0x18,	%o5
	alignaddrl	%l3,	%i1,	%l6
	bleu,pt	%icc,	loop_2199
	bcs,pn	%icc,	loop_2200
	array32	%l5,	%i7,	%g7
	ldsw	[%l7 + 0x10],	%g2
loop_2199:
	membar	0x0D
loop_2200:
	sir	0x0183
	or	%g1,	0x0CEC,	%l4
	srl	%g4,	0x17,	%i0
	smulcc	%o6,	%g5,	%g3
	subc	%o7,	0x1FEE,	%l1
	edge16n	%o0,	%i6,	%i4
	tsubcctv	%l2,	0x1A76,	%g6
	fbule,a	%fcc1,	loop_2201
	tcs	%xcc,	0x0
	nop
	set	0x25, %g3
	stb	%i2,	[%l7 + %g3]
	taddcctv	%i3,	0x1F8D,	%o1
loop_2201:
	stbar
	andncc	%o2,	%o3,	%i5
	movl	%xcc,	%l0,	%o5
	membar	0x23
	tg	%xcc,	0x2
	fmovdleu	%xcc,	%f25,	%f16
	srlx	%l3,	%i1,	%l6
	fblg	%fcc1,	loop_2202
	for	%f2,	%f8,	%f8
	set	0x5F, %g7
	stba	%l5,	[%l7 + %g7] 0x0c
loop_2202:
	brz,a	%i7,	loop_2203
	movg	%xcc,	%g7,	%o4
	movne	%icc,	%g2,	%g1
	array32	%g4,	%l4,	%i0
loop_2203:
	fbl	%fcc2,	loop_2204
	movne	%icc,	%o6,	%g5
	brlez	%o7,	loop_2205
	fmuld8sux16	%f28,	%f25,	%f6
loop_2204:
	sub	%l1,	%o0,	%i6
	movn	%icc,	%g3,	%l2
loop_2205:
	umulcc	%i4,	%i2,	%i3
	tvc	%icc,	0x5
	fcmpes	%fcc3,	%f10,	%f29
	movrlz	%g6,	%o2,	%o1
	pdist	%f16,	%f4,	%f14
	addccc	%i5,	0x194F,	%l0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbo,a	%fcc3,	loop_2206
	fpadd32s	%f19,	%f11,	%f31
	andn	%o5,	0x1FFC,	%o3
	fnot1s	%f27,	%f28
loop_2206:
	st	%f27,	[%l7 + 0x40]
	edge8n	%i1,	%l6,	%l5
	fmovrsgz	%l3,	%f24,	%f25
	ldsh	[%l7 + 0x08],	%g7
	movvc	%xcc,	%o4,	%i7
	array32	%g2,	%g4,	%g1
	movre	%l4,	%o6,	%i0
	edge32	%o7,	%l1,	%g5
	movre	%o0,	0x1EA,	%i6
	edge8n	%l2,	%g3,	%i4
	tle	%xcc,	0x2
	edge32n	%i3,	%g6,	%o2
	xorcc	%o1,	0x0868,	%i5
	sth	%i2,	[%l7 + 0x5A]
	fmovse	%icc,	%f28,	%f16
	wr	%g0,	0x18,	%asi
	ldsha	[%l7 + 0x36] %asi,	%o5
	sir	0x0A04
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmple16	%f4,	%f30,	%o3
	st	%f10,	[%l7 + 0x44]
	fbg	%fcc0,	loop_2207
	fmovdge	%xcc,	%f9,	%f0
	sra	%i1,	%l0,	%l6
	add	%l7,	0x38,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%l5,	%l3
loop_2207:
	movvc	%icc,	%g7,	%o4
	movleu	%xcc,	%g2,	%i7
	fpsub16s	%f7,	%f6,	%f8
	tcc	%xcc,	0x5
	fcmps	%fcc1,	%f17,	%f24
	fmovdcs	%xcc,	%f16,	%f2
	smulcc	%g4,	0x08D1,	%l4
	fbl,a	%fcc1,	loop_2208
	move	%xcc,	%o6,	%i0
	movvs	%icc,	%g1,	%l1
	udivx	%g5,	0x006F,	%o7
loop_2208:
	stw	%o0,	[%l7 + 0x08]
	sdivcc	%i6,	0x1CDB,	%l2
	or	%i4,	0x1572,	%g3
	fbn	%fcc3,	loop_2209
	xnorcc	%i3,	%g6,	%o1
	fandnot2	%f8,	%f12,	%f24
	tpos	%xcc,	0x7
loop_2209:
	tsubcc	%i5,	0x1EC6,	%i2
	srl	%o2,	0x17,	%o5
	tge	%xcc,	0x2
	movvc	%xcc,	%i1,	%o3
	andcc	%l6,	0x0853,	%l0
	movcs	%icc,	%l5,	%g7
	srlx	%o4,	%g2,	%i7
	orcc	%l3,	0x1A81,	%g4
	fpadd32	%f18,	%f30,	%f12
	addc	%o6,	%l4,	%i0
	fmovsleu	%xcc,	%f14,	%f23
	fsrc2s	%f19,	%f8
	fcmpne16	%f2,	%f14,	%l1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bleu,pn	%xcc,	loop_2210
	fbul	%fcc2,	loop_2211
	fmovsn	%xcc,	%f5,	%f14
	fmovdne	%xcc,	%f24,	%f23
loop_2210:
	stx	%g5,	[%l7 + 0x30]
loop_2211:
	fbul,a	%fcc2,	loop_2212
	fmovsvc	%xcc,	%f1,	%f31
	edge32ln	%g1,	%o7,	%o0
	edge8n	%l2,	%i6,	%g3
loop_2212:
	udivx	%i3,	0x1667,	%g6
	fmovda	%xcc,	%f20,	%f31
	fmovrdgz	%i4,	%f28,	%f12
	fmovrdlz	%i5,	%f26,	%f20
	tsubcc	%i2,	0x105B,	%o2
	movne	%xcc,	%o5,	%o1
	fmovsle	%xcc,	%f19,	%f24
	edge8l	%o3,	%l6,	%i1
	bcc,a,pt	%icc,	loop_2213
	sub	%l5,	%l0,	%g7
	movl	%xcc,	%g2,	%o4
	edge16l	%l3,	%g4,	%i7
loop_2213:
	nop
	set	0x51, %g6
	ldstuba	[%l7 + %g6] 0x81,	%o6
	add	%l7,	0x08,	%l6
	wr	%g0,	0x11,	%asi
	lda	[%l6] %asi,	%i0
	casa	[%l6] %asi,	%i0,	%l1
	array32	%g5,	%l4,	%o7
	bne	loop_2214
	for	%f22,	%f0,	%f18
	array32	%g1,	%l2,	%o0
	wr	%g0,	0x89,	%asi
	stwa	%i6,	[%l7 + 0x14] %asi
loop_2214:
	movrgez	%i3,	%g3,	%g6
	sdivx	%i4,	0x1628,	%i5
	add	%i2,	%o2,	%o1
	set	0x78, %l5
	lduwa	[%l7 + %l5] 0x88,	%o5
	tne	%xcc,	0x4
	set	0x58, %o6
	sta	%f16,	[%l7 + %o6] 0x19
	fbo	%fcc3,	loop_2215
	fmovda	%icc,	%f13,	%f30
	movneg	%icc,	%o3,	%l6
	bleu,pt	%icc,	loop_2216
loop_2215:
	fpsub16s	%f13,	%f8,	%f27
	fbu	%fcc0,	loop_2217
	fmovdl	%xcc,	%f12,	%f29
loop_2216:
	nop
	set	0x28, %i1
	stda	%i0,	[%l7 + %i1] 0x22
	membar	#Sync
loop_2217:
	array32	%l0,	%l5,	%g2
	bneg,pt	%icc,	loop_2218
	movle	%xcc,	%g7,	%l3
	fmovdne	%icc,	%f28,	%f10
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2218:
	fbule	%fcc1,	loop_2219
	fornot2	%f24,	%f14,	%f6
	brnz	%g4,	loop_2220
	movcc	%xcc,	%o4,	%o6
loop_2219:
	tsubcc	%i0,	%l1,	%g5
	srax	%l4,	0x0C,	%o7
loop_2220:
	fone	%f6
	fnot2	%f16,	%f26
	edge8	%i7,	%l2,	%g1
	fsrc1s	%f28,	%f28
	fmovrsgz	%o0,	%f25,	%f25
	movpos	%icc,	%i6,	%i3
	fandnot2	%f10,	%f20,	%f14
	xorcc	%g6,	%g3,	%i4
	fpadd16s	%f16,	%f9,	%f25
	taddcc	%i5,	%i2,	%o1
	fones	%f12
	tgu	%xcc,	0x6
	taddcc	%o2,	0x11AA,	%o5
	fmovrslez	%o3,	%f27,	%f20
	smul	%i1,	0x1F05,	%l0
	orn	%l5,	%g2,	%g7
	fmovsge	%icc,	%f23,	%f1
	bneg	%xcc,	loop_2221
	fmovdg	%xcc,	%f27,	%f11
	sdivcc	%l6,	0x08D6,	%l3
	tcc	%xcc,	0x4
loop_2221:
	andcc	%g4,	0x19CD,	%o6
	edge8l	%i0,	%l1,	%g5
	fcmped	%fcc1,	%f24,	%f12
	bg,a,pt	%xcc,	loop_2222
	bn,a,pn	%icc,	loop_2223
	ta	%icc,	0x0
	tl	%icc,	0x5
loop_2222:
	fmovda	%xcc,	%f4,	%f24
loop_2223:
	ldsb	[%l7 + 0x3A],	%l4
	xnor	%o7,	%i7,	%l2
	bge,a,pn	%xcc,	loop_2224
	fnot1	%f22,	%f22
	movcs	%xcc,	%g1,	%o4
	call	loop_2225
loop_2224:
	edge8	%i6,	%o0,	%g6
	smul	%g3,	%i3,	%i4
	and	%i5,	%o1,	%i2
loop_2225:
	fmovda	%icc,	%f28,	%f16
	udivcc	%o2,	0x18FB,	%o3
	fmovdgu	%xcc,	%f13,	%f1
	edge32	%i1,	%o5,	%l5
	tsubcctv	%g2,	0x064F,	%l0
	fabsd	%f0,	%f4
	flush	%l7 + 0x74
	bne,a	loop_2226
	sdivx	%l6,	0x0679,	%g7
	alignaddrl	%g4,	%l3,	%o6
	ble,a,pt	%icc,	loop_2227
loop_2226:
	fcmpd	%fcc0,	%f30,	%f10
	orn	%l1,	%g5,	%l4
	edge16ln	%i0,	%i7,	%l2
loop_2227:
	movre	%o7,	0x0BE,	%o4
	orn	%g1,	0x1CD7,	%i6
	bvc,a,pn	%xcc,	loop_2228
	edge8ln	%o0,	%g3,	%g6
	bn,a,pt	%icc,	loop_2229
	fbu	%fcc0,	loop_2230
loop_2228:
	edge8ln	%i3,	%i5,	%o1
	brlez,a	%i4,	loop_2231
loop_2229:
	fmovdleu	%icc,	%f2,	%f0
loop_2230:
	tpos	%icc,	0x1
	movrgez	%o2,	0x2B8,	%o3
loop_2231:
	edge8n	%i2,	%i1,	%l5
	sethi	0x0B25,	%o5
	sir	0x0E6C
	sub	%l0,	%l6,	%g7
	bpos,pt	%icc,	loop_2232
	tpos	%xcc,	0x0
	udivx	%g2,	0x01D7,	%g4
	fpack16	%f16,	%f10
loop_2232:
	nop
	set	0x40, %i4
	stda	%f16,	[%l7 + %i4] 0xf1
	membar	#Sync
	fmovrse	%l3,	%f22,	%f16
	edge8l	%o6,	%g5,	%l1
	bvs,pt	%icc,	loop_2233
	fnegd	%f24,	%f22
	fmul8x16	%f4,	%f6,	%f8
	smul	%i0,	0x0443,	%l4
loop_2233:
	fsrc2	%f16,	%f6
	edge16ln	%i7,	%l2,	%o4
	umulcc	%o7,	0x17DB,	%i6
	xnorcc	%g1,	%g3,	%o0
	tn	%xcc,	0x2
	nop
	setx loop_2234, %l0, %l1
	jmpl %l1, %g6
	addc	%i3,	%o1,	%i4
	subccc	%i5,	%o3,	%i2
	edge16ln	%o2,	%l5,	%i1
loop_2234:
	edge8	%l0,	%l6,	%g7
	movrgz	%o5,	0x038,	%g2
	tn	%icc,	0x4
	set	0x3C, %i5
	stwa	%g4,	[%l7 + %i5] 0x18
	mova	%xcc,	%o6,	%g5
	fmovdvs	%xcc,	%f4,	%f1
	fmovrdgz	%l3,	%f14,	%f26
	mulx	%l1,	%l4,	%i7
	bg,a,pt	%xcc,	loop_2235
	edge32l	%l2,	%i0,	%o7
	tpos	%icc,	0x6
	xor	%o4,	%i6,	%g1
loop_2235:
	array32	%g3,	%g6,	%i3
	or	%o1,	%i4,	%o0
	movne	%xcc,	%o3,	%i2
	tcs	%xcc,	0x7
	fpsub32	%f28,	%f6,	%f18
	fors	%f9,	%f25,	%f22
	addccc	%i5,	0x024A,	%o2
	tn	%xcc,	0x7
	ld	[%l7 + 0x60],	%f23
	wr	%g0,	0x4f,	%asi
	ldxa	[%g0 + 0x8] %asi,	%l5
	set	0x54, %l4
	sta	%f7,	[%l7 + %l4] 0x89
	movvs	%icc,	%l0,	%i1
	sdiv	%g7,	0x1A23,	%o5
	membar	0x4E
	srax	%l6,	%g4,	%o6
	movcs	%xcc,	%g2,	%g5
	fmovdcc	%icc,	%f8,	%f14
	andncc	%l1,	%l4,	%i7
	tg	%xcc,	0x0
	movrne	%l3,	0x217,	%l2
	be	%xcc,	loop_2236
	fbl	%fcc1,	loop_2237
	bn,a	loop_2238
	fbue	%fcc0,	loop_2239
loop_2236:
	edge8	%i0,	%o7,	%i6
loop_2237:
	edge16l	%g1,	%o4,	%g6
loop_2238:
	tvc	%icc,	0x7
loop_2239:
	brnz,a	%g3,	loop_2240
	sdivx	%o1,	0x1E76,	%i4
	movrne	%o0,	%i3,	%i2
	xorcc	%o3,	0x0ED2,	%o2
loop_2240:
	edge16n	%i5,	%l5,	%i1
	edge32n	%l0,	%g7,	%l6
	movrgz	%o5,	%o6,	%g2
	set	0x34, %i2
	lduwa	[%l7 + %i2] 0x10,	%g5
	fmuld8ulx16	%f19,	%f4,	%f10
	set	0x7C, %i7
	ldswa	[%l7 + %i7] 0x19,	%l1
	sll	%g4,	0x13,	%l4
	array8	%i7,	%l2,	%l3
	subcc	%o7,	%i0,	%i6
	ld	[%l7 + 0x2C],	%f30
	orn	%o4,	0x0825,	%g1
	fexpand	%f10,	%f14
	brnz	%g3,	loop_2241
	fone	%f2
	movn	%xcc,	%o1,	%i4
	array32	%o0,	%i3,	%g6
loop_2241:
	fors	%f7,	%f5,	%f31
	movcs	%icc,	%i2,	%o2
	wr	%g0,	0x80,	%asi
	stha	%i5,	[%l7 + 0x1A] %asi
	orcc	%l5,	%i1,	%o3
	fmul8sux16	%f28,	%f8,	%f0
	or	%g7,	0x0F58,	%l6
	wr	%g0,	0x19,	%asi
	ldda	[%l7 + 0x10] %asi,	%o4
	popc	%l0,	%o6
	fmovrsne	%g2,	%f0,	%f21
	edge16	%g5,	%g4,	%l4
	brlez,a	%i7,	loop_2242
	edge8ln	%l1,	%l3,	%o7
	sdivcc	%l2,	0x1EBA,	%i0
	mulscc	%i6,	0x1DDF,	%g1
loop_2242:
	andn	%g3,	%o1,	%o4
	subcc	%o0,	%i4,	%i3
	alignaddrl	%g6,	%i2,	%i5
	movn	%xcc,	%l5,	%i1
	prefetch	[%l7 + 0x4C],	 0x3
	fmul8x16au	%f1,	%f7,	%f12
	fornot2s	%f31,	%f9,	%f25
	nop
	set	0x20, %g4
	ldd	[%l7 + %g4],	%o2
	movgu	%icc,	%g7,	%o3
	fpsub32s	%f29,	%f14,	%f8
	umulcc	%l6,	0x176F,	%l0
	sdivx	%o5,	0x1F9B,	%g2
	movrne	%g5,	%g4,	%l4
	umulcc	%i7,	0x0DE2,	%l1
	call	loop_2243
	fand	%f0,	%f16,	%f12
	subc	%l3,	0x0181,	%o6
	set	0x30, %o1
	ldsha	[%l7 + %o1] 0x81,	%o7
loop_2243:
	tne	%xcc,	0x6
	subc	%l2,	0x1265,	%i0
	sethi	0x0326,	%i6
	fpmerge	%f29,	%f25,	%f12
	ldub	[%l7 + 0x0B],	%g1
	bleu,pn	%icc,	loop_2244
	srlx	%o1,	0x03,	%g3
	bge,pn	%xcc,	loop_2245
	tg	%icc,	0x7
loop_2244:
	addcc	%o4,	0x06A8,	%o0
	fmuld8sux16	%f27,	%f0,	%f28
loop_2245:
	fpadd32	%f10,	%f26,	%f20
	orcc	%i3,	%i4,	%g6
	fsrc1	%f6,	%f14
	fones	%f5
	subc	%i5,	0x0656,	%l5
	add	%l7,	0x60,	%l6
	wr	%g0,	0x19,	%asi
	casa	[%l6] %asi,	%i2,	%i1
	bg,pn	%xcc,	loop_2246
	lduh	[%l7 + 0x44],	%o2
	fcmpgt16	%f26,	%f4,	%o3
	bl,a,pt	%xcc,	loop_2247
loop_2246:
	brlez,a	%l6,	loop_2248
	movn	%xcc,	%g7,	%o5
	lduh	[%l7 + 0x54],	%l0
loop_2247:
	movrlz	%g5,	%g2,	%l4
loop_2248:
	edge32	%i7,	%l1,	%g4
	fabsd	%f18,	%f18
	addccc	%o6,	%l3,	%o7
	movre	%i0,	0x14A,	%i6
	sdivx	%g1,	0x061A,	%l2
	fxors	%f16,	%f3,	%f26
	wr	%g0,	0x04,	%asi
	ldsha	[%l7 + 0x08] %asi,	%g3
	fmovdle	%icc,	%f28,	%f26
	fbu	%fcc2,	loop_2249
	srl	%o4,	%o1,	%o0
	wr	%g0,	0x10,	%asi
	ldsba	[%l7 + 0x08] %asi,	%i3
loop_2249:
	edge16	%i4,	%g6,	%l5
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
	subcc	%i2,	%i5,	%o2
	fmovsneg	%xcc,	%f27,	%f25
	orn	%o3,	0x1A99,	%i1
loop_2250:
	nop
	set	0x54, %i0
	lduha	[%l7 + %i0] 0x04,	%l6
	edge32n	%o5,	%g7,	%g5
	fpack16	%f4,	%f0
	edge16ln	%l0,	%l4,	%g2
	umulcc	%l1,	0x1EDA,	%g4
	sth	%i7,	[%l7 + 0x38]
	tne	%icc,	0x3
	movge	%icc,	%l3,	%o6
	movrne	%i0,	%o7,	%i6
	tcs	%icc,	0x7
	fabss	%f8,	%f9
	te	%xcc,	0x4
	edge16	%l2,	%g1,	%g3
	movrgz	%o1,	0x095,	%o0
	fmul8x16	%f17,	%f2,	%f8
	subcc	%i3,	0x1BA2,	%i4
	add	%o4,	0x1001,	%g6
	sub	%i2,	0x111A,	%i5
	movne	%icc,	%o2,	%o3
	movrne	%l5,	%i1,	%o5
	fmuld8ulx16	%f1,	%f10,	%f30
	fcmpne16	%f4,	%f18,	%g7
	sth	%g5,	[%l7 + 0x0E]
	edge16ln	%l0,	%l6,	%l4
	movrlz	%l1,	%g2,	%g4
	sir	0x055F
	movvs	%icc,	%i7,	%o6
	fblg,a	%fcc1,	loop_2251
	fblg	%fcc1,	loop_2252
	fbne	%fcc1,	loop_2253
	fzeros	%f26
loop_2251:
	array16	%i0,	%o7,	%l3
loop_2252:
	xnorcc	%i6,	%g1,	%l2
loop_2253:
	ta	%xcc,	0x2
	movg	%xcc,	%o1,	%g3
	sir	0x0549
	sll	%i3,	0x0A,	%o0
	fmovsvs	%icc,	%f24,	%f28
	tsubcctv	%o4,	%g6,	%i4
	fbue	%fcc1,	loop_2254
	faligndata	%f24,	%f2,	%f20
	smulcc	%i2,	0x0BEB,	%o2
	ta	%xcc,	0x6
loop_2254:
	movge	%icc,	%o3,	%i5
	sllx	%l5,	0x0D,	%i1
	ldx	[%l7 + 0x70],	%g7
	set	0x0D, %o3
	lduba	[%l7 + %o3] 0x89,	%g5
	and	%l0,	%o5,	%l6
	tn	%icc,	0x0
	fbne,a	%fcc1,	loop_2255
	st	%f23,	[%l7 + 0x1C]
	wr	%g0,	0x19,	%asi
	lduha	[%l7 + 0x32] %asi,	%l4
loop_2255:
	fbuge,a	%fcc1,	loop_2256
	edge8n	%g2,	%l1,	%g4
	fsrc2s	%f19,	%f14
	popc	%o6,	%i0
loop_2256:
	nop
	wr	%g0,	0x19,	%asi
	prefetcha	[%l7 + 0x18] %asi,	 0x1
	movne	%xcc,	%l3,	%i7
	wr	%g0,	0x81,	%asi
	lduwa	[%l7 + 0x08] %asi,	%g1
	fbg	%fcc0,	loop_2257
	std	%l2,	[%l7 + 0x60]
	ble	loop_2258
	fbe,a	%fcc1,	loop_2259
loop_2257:
	std	%f26,	[%l7 + 0x58]
	edge32n	%o1,	%g3,	%i6
loop_2258:
	edge32l	%o0,	%i3,	%o4
loop_2259:
	tge	%xcc,	0x4
	fandnot1s	%f13,	%f22,	%f11
	edge16n	%g6,	%i2,	%o2
	udivx	%i4,	0x0691,	%o3
	movleu	%icc,	%i5,	%i1
	taddcc	%l5,	%g7,	%g5
	xnor	%l0,	0x026A,	%o5
	orcc	%l4,	%g2,	%l1
	wr	%g0,	0x04,	%asi
	prefetcha	[%l7 + 0x58] %asi,	 0x2
	nop
	set	0x48, %i3
	ldx	[%l7 + %i3],	%o6
	edge8n	%g4,	%i0,	%l3
	bge	loop_2260
	ldstub	[%l7 + 0x0F],	%i7
	sra	%g1,	0x09,	%l2
	te	%xcc,	0x5
loop_2260:
	udiv	%o7,	0x1480,	%g3
	movrne	%i6,	%o1,	%o0
	set	0x50, %o0
	ldda	[%l7 + %o0] 0x11,	%i2
	edge32n	%g6,	%i2,	%o4
	sra	%o2,	0x0E,	%i4
	fnot2	%f18,	%f30
	orcc	%i5,	0x08DC,	%i1
	fpadd32s	%f11,	%f2,	%f22
	ld	[%l7 + 0x24],	%f8
	edge16ln	%o3,	%g7,	%g5
	tleu	%xcc,	0x4
	udivx	%l5,	0x07A1,	%o5
	sll	%l0,	%l4,	%g2
	andn	%l6,	0x0E69,	%o6
	movrne	%g4,	%i0,	%l3
	fones	%f1
	fmovdleu	%xcc,	%f23,	%f1
	fnor	%f14,	%f26,	%f0
	fpackfix	%f0,	%f5
	nop
	setx	loop_2261,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	subc	%i7,	%l1,	%g1
	srax	%o7,	%g3,	%i6
	fmovdl	%xcc,	%f26,	%f1
loop_2261:
	edge8n	%o1,	%l2,	%i3
	fpmerge	%f31,	%f6,	%f24
	nop
	setx	loop_2262,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	tne	%icc,	0x2
	srl	%g6,	%i2,	%o0
	ble,a	loop_2263
loop_2262:
	xorcc	%o4,	%i4,	%i5
	fcmps	%fcc3,	%f20,	%f10
	call	loop_2264
loop_2263:
	fmovda	%xcc,	%f14,	%f5
	edge16n	%i1,	%o3,	%g7
	movpos	%xcc,	%g5,	%o2
loop_2264:
	tsubcc	%o5,	%l0,	%l5
	edge16l	%g2,	%l4,	%o6
	subc	%g4,	0x0ADB,	%l6
	fmovdvs	%icc,	%f8,	%f5
	movge	%xcc,	%i0,	%i7
	edge16n	%l3,	%l1,	%g1
	mulscc	%g3,	%o7,	%i6
	fmovscs	%icc,	%f3,	%f20
	movrlz	%o1,	0x12B,	%l2
	addccc	%i3,	%i2,	%g6
	tsubcctv	%o4,	%i4,	%i5
	ldub	[%l7 + 0x50],	%i1
	bne,a,pt	%icc,	loop_2265
	fmovrdlez	%o3,	%f4,	%f10
	orcc	%g7,	%g5,	%o0
	fands	%f4,	%f20,	%f24
loop_2265:
	tneg	%xcc,	0x6
	sethi	0x1502,	%o2
	ldsw	[%l7 + 0x08],	%l0
	edge8n	%o5,	%l5,	%l4
	movgu	%icc,	%o6,	%g2
	ldd	[%l7 + 0x18],	%f0
	brgz	%g4,	loop_2266
	sdivcc	%i0,	0x0D5A,	%i7
	bg,a	loop_2267
	srl	%l3,	0x12,	%l6
loop_2266:
	tl	%xcc,	0x6
	subcc	%g1,	%g3,	%o7
loop_2267:
	tg	%xcc,	0x6
	fnot1s	%f8,	%f9
	fcmple16	%f10,	%f0,	%l1
	wr	%g0,	0x2b,	%asi
	stxa	%i6,	[%l7 + 0x50] %asi
	membar	#Sync
	movcc	%icc,	%o1,	%l2
	fzero	%f4
	wr	%g0,	0x19,	%asi
	ldstuba	[%l7 + 0x69] %asi,	%i2
	mova	%icc,	%i3,	%g6
	st	%f31,	[%l7 + 0x4C]
	fbo	%fcc0,	loop_2268
	tpos	%icc,	0x3
	std	%f16,	[%l7 + 0x38]
	subc	%o4,	%i5,	%i1
loop_2268:
	movleu	%xcc,	%o3,	%i4
	movvs	%xcc,	%g7,	%o0
	or	%g5,	%o2,	%l0
	movleu	%icc,	%l5,	%o5
	fmovdl	%xcc,	%f12,	%f16
	fxors	%f15,	%f7,	%f15
	sdivcc	%o6,	0x192F,	%l4
	srlx	%g4,	0x1E,	%g2
	udiv	%i7,	0x0EB0,	%l3
	alignaddrl	%i0,	%l6,	%g1
	fbule	%fcc0,	loop_2269
	fba	%fcc3,	loop_2270
	or	%g3,	%o7,	%i6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2269:
	fmovdle	%xcc,	%f12,	%f31
loop_2270:
	nop
	wr	%g0,	0x80,	%asi
	ldsba	[%l7 + 0x6E] %asi,	%o1
	fmovdpos	%icc,	%f19,	%f10
	ldsh	[%l7 + 0x0E],	%l2
	umul	%l1,	%i3,	%g6
	mulscc	%i2,	0x1D81,	%i5
	mulscc	%i1,	0x1D5B,	%o4
	movn	%icc,	%o3,	%i4
	sra	%o0,	%g5,	%g7
	fcmpeq16	%f22,	%f28,	%o2
	fandnot2	%f2,	%f16,	%f12
	array16	%l0,	%o5,	%o6
	sllx	%l5,	0x11,	%l4
	tne	%xcc,	0x6
	fors	%f28,	%f3,	%f25
	movg	%icc,	%g4,	%i7
	taddcc	%l3,	%g2,	%l6
	fcmpgt16	%f30,	%f26,	%i0
	be,pt	%xcc,	loop_2271
	fmovscc	%icc,	%f0,	%f8
	fmovrse	%g1,	%f3,	%f4
	tvs	%xcc,	0x6
loop_2271:
	fandnot1	%f28,	%f18,	%f0
	wr	%g0,	0x89,	%asi
	stha	%g3,	[%l7 + 0x64] %asi
	fnands	%f1,	%f25,	%f0
	edge32n	%i6,	%o7,	%o1
	brlz	%l2,	loop_2272
	sll	%i3,	0x18,	%g6
	fbug,a	%fcc2,	loop_2273
	or	%i2,	%i5,	%i1
loop_2272:
	tgu	%xcc,	0x2
	tsubcctv	%l1,	0x199F,	%o3
loop_2273:
	fone	%f2
	mulx	%i4,	0x1D9D,	%o4
	membar	0x77
	array8	%o0,	%g7,	%g5
	fzeros	%f23
	ba	%xcc,	loop_2274
	stw	%l0,	[%l7 + 0x34]
	movcc	%icc,	%o2,	%o5
	brz	%o6,	loop_2275
loop_2274:
	movrgez	%l5,	%l4,	%g4
	tvs	%xcc,	0x4
	fcmpne16	%f8,	%f26,	%l3
loop_2275:
	edge8ln	%g2,	%l6,	%i0
	ba	loop_2276
	tvs	%icc,	0x4
	fbe	%fcc3,	loop_2277
	stbar
loop_2276:
	edge8	%g1,	%g3,	%i6
	fba	%fcc1,	loop_2278
loop_2277:
	movn	%icc,	%o7,	%i7
	bleu,pn	%xcc,	loop_2279
	udivcc	%l2,	0x1E25,	%o1
loop_2278:
	edge16l	%g6,	%i3,	%i2
	movrlz	%i5,	0x158,	%i1
loop_2279:
	alignaddrl	%o3,	%l1,	%o4
	tne	%icc,	0x2
	fmul8ulx16	%f16,	%f30,	%f26
	tcs	%xcc,	0x0
	alignaddr	%o0,	%g7,	%g5
	set	0x40, %l6
	stda	%f0,	[%l7 + %l6] 0xf9
	membar	#Sync
	and	%l0,	%o2,	%o5
	ta	%icc,	0x0
	fnot1s	%f22,	%f17
	tgu	%xcc,	0x7
	addccc	%i4,	0x0B10,	%l5
	smul	%o6,	0x05F0,	%l4
	bneg,pn	%icc,	loop_2280
	fbne	%fcc2,	loop_2281
	movpos	%icc,	%g4,	%g2
	sub	%l3,	0x145D,	%i0
loop_2280:
	srl	%l6,	0x10,	%g3
loop_2281:
	subccc	%i6,	0x0137,	%o7
	tcs	%xcc,	0x5
	ldx	[%l7 + 0x28],	%i7
	fmovrdgez	%l2,	%f12,	%f22
	movgu	%icc,	%o1,	%g1
	movrgez	%g6,	%i2,	%i5
	taddcc	%i3,	0x073B,	%o3
	sdivx	%i1,	0x0D03,	%o4
	movpos	%xcc,	%l1,	%g7
	movrlez	%o0,	%l0,	%o2
	bpos,pn	%xcc,	loop_2282
	edge16	%o5,	%i4,	%g5
	tsubcc	%l5,	0x15D3,	%l4
	edge8ln	%o6,	%g4,	%l3
loop_2282:
	edge32l	%i0,	%g2,	%l6
	bn	loop_2283
	bge,pn	%xcc,	loop_2284
	tl	%icc,	0x7
	and	%g3,	%i6,	%i7
loop_2283:
	te	%xcc,	0x4
loop_2284:
	movrgez	%o7,	%l2,	%g1
	fmovs	%f0,	%f3
	array32	%g6,	%i2,	%o1
	movg	%icc,	%i3,	%o3
	fandnot1	%f6,	%f12,	%f14
	set	0x40, %g1
	lduwa	[%l7 + %g1] 0x80,	%i5
	add	%l7,	0x6C,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%o4
	casa	[%l6] %asi,	%o4,	%i1
	movrne	%g7,	%l1,	%o0
	fnot1	%f24,	%f16
	orcc	%o2,	0x0662,	%o5
	movn	%icc,	%i4,	%g5
	popc	0x1518,	%l0
	addccc	%l4,	0x1E14,	%l5
	edge16l	%o6,	%g4,	%l3
	taddcc	%i0,	%g2,	%l6
	nop
	setx	loop_2285,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	alignaddr	%g3,	%i6,	%i7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbe,a	%fcc3,	loop_2286
loop_2285:
	fpadd32s	%f25,	%f29,	%f1
	popc	0x1793,	%l2
	st	%f9,	[%l7 + 0x44]
loop_2286:
	edge16n	%g1,	%g6,	%i2
	fmovrdne	%o1,	%f30,	%f0
	edge32n	%o7,	%o3,	%i3
	fbne,a	%fcc1,	loop_2287
	fpmerge	%f21,	%f28,	%f24
	srax	%i5,	0x06,	%i1
	move	%xcc,	%o4,	%g7
loop_2287:
	fbne	%fcc0,	loop_2288
	udivcc	%l1,	0x0B3E,	%o2
	tcc	%xcc,	0x7
	fsrc2s	%f26,	%f27
loop_2288:
	stb	%o0,	[%l7 + 0x16]
	fbue	%fcc3,	loop_2289
	tle	%icc,	0x0
	brnz	%o5,	loop_2290
	fcmple16	%f0,	%f8,	%g5
loop_2289:
	xnor	%i4,	0x16E9,	%l0
	movl	%xcc,	%l4,	%l5
loop_2290:
	nop
	set	0x1E, %g5
	stha	%g4,	[%l7 + %g5] 0x2a
	membar	#Sync
	fpadd16	%f4,	%f22,	%f26
	sdivx	%l3,	0x04D8,	%o6
	nop
	set	0x58, %o5
	ldsw	[%l7 + %o5],	%g2
	fmovd	%f12,	%f14
	fabsd	%f0,	%f10
	fbul	%fcc1,	loop_2291
	alignaddr	%l6,	%i0,	%g3
	movcc	%icc,	%i7,	%i6
	sll	%g1,	0x1F,	%g6
loop_2291:
	nop
	wr	%g0,	0x89,	%asi
	sta	%f24,	[%l7 + 0x18] %asi
	sllx	%l2,	%o1,	%o7
	brz,a	%o3,	loop_2292
	array32	%i3,	%i5,	%i1
	nop
	set	0x10, %l0
	ldd	[%l7 + %l0],	%o4
	fble,a	%fcc1,	loop_2293
loop_2292:
	fmovsn	%xcc,	%f11,	%f7
	array16	%i2,	%g7,	%o2
	bvc	loop_2294
loop_2293:
	bgu,a,pt	%icc,	loop_2295
	movre	%o0,	0x10A,	%l1
	umul	%g5,	%o5,	%i4
loop_2294:
	taddcc	%l0,	%l4,	%g4
loop_2295:
	movl	%xcc,	%l3,	%o6
	bcs,a,pn	%xcc,	loop_2296
	edge32	%g2,	%l6,	%i0
	addccc	%g3,	0x02ED,	%l5
	sdivcc	%i6,	0x1943,	%i7
loop_2296:
	fcmpeq16	%f0,	%f18,	%g6
	bcc	%icc,	loop_2297
	xnorcc	%l2,	%o1,	%o7
	sra	%o3,	0x1E,	%g1
	fpadd16s	%f9,	%f21,	%f4
loop_2297:
	movn	%icc,	%i3,	%i1
	fmovsge	%icc,	%f17,	%f27
	swap	[%l7 + 0x3C],	%i5
	movvc	%xcc,	%i2,	%g7
	tle	%xcc,	0x2
	set	0x1C, %l2
	lduba	[%l7 + %l2] 0x89,	%o4
	wr	%g0,	0x81,	%asi
	ldxa	[%l7 + 0x40] %asi,	%o2
	smulcc	%l1,	0x0A0B,	%g5
	tvs	%icc,	0x6
	fbu,a	%fcc1,	loop_2298
	tne	%icc,	0x7
	edge8ln	%o0,	%o5,	%i4
	ldd	[%l7 + 0x48],	%l4
loop_2298:
	fblg,a	%fcc2,	loop_2299
	fsrc1	%f12,	%f2
	subccc	%g4,	0x09C1,	%l0
	or	%l3,	0x031C,	%g2
loop_2299:
	fmovsle	%xcc,	%f19,	%f14
	fcmple32	%f30,	%f6,	%l6
	movl	%xcc,	%o6,	%i0
	mulx	%g3,	0x162B,	%l5
	wr	%g0,	0x10,	%asi
	swapa	[%l7 + 0x10] %asi,	%i6
	tsubcctv	%i7,	0x0A3E,	%l2
	fbe,a	%fcc0,	loop_2300
	te	%xcc,	0x1
	subccc	%g6,	%o7,	%o1
	fmovspos	%xcc,	%f30,	%f0
loop_2300:
	fcmpeq32	%f26,	%f18,	%o3
	array16	%i3,	%g1,	%i5
	brgz	%i2,	loop_2301
	bg	loop_2302
	ld	[%l7 + 0x0C],	%f13
	ta	%xcc,	0x3
loop_2301:
	move	%icc,	%g7,	%o4
loop_2302:
	popc	%i1,	%l1
	addccc	%g5,	0x07C5,	%o2
	bcs,a	%icc,	loop_2303
	fmovsne	%xcc,	%f12,	%f18
	tcs	%icc,	0x0
	fcmpes	%fcc0,	%f20,	%f10
loop_2303:
	subccc	%o5,	0x094D,	%i4
	edge32ln	%l4,	%g4,	%l0
	fcmple16	%f0,	%f4,	%o0
	tl	%xcc,	0x3
	movvs	%icc,	%g2,	%l6
	edge32	%o6,	%i0,	%l3
	udiv	%g3,	0x186D,	%l5
	stb	%i7,	[%l7 + 0x1D]
	nop
	set	0x20, %l1
	ldd	[%l7 + %l1],	%f6
	bcc	%icc,	loop_2304
	fmovrslez	%l2,	%f6,	%f16
	smul	%g6,	%o7,	%i6
	subc	%o1,	%i3,	%o3
loop_2304:
	movre	%i5,	0x0FC,	%i2
	fbug	%fcc3,	loop_2305
	orn	%g1,	0x10C2,	%g7
	fmovda	%icc,	%f23,	%f21
	fnot2s	%f10,	%f16
loop_2305:
	bvc,pn	%icc,	loop_2306
	andcc	%i1,	%o4,	%g5
	edge32ln	%o2,	%o5,	%l1
	movrgz	%l4,	0x32B,	%i4
loop_2306:
	xnor	%l0,	%g4,	%o0
	fbe	%fcc0,	loop_2307
	movrgz	%g2,	0x19A,	%o6
	xorcc	%l6,	0x024E,	%l3
	tpos	%xcc,	0x1
loop_2307:
	nop
	add	%l7,	0x58,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%g3,	%i0
	movrlez	%l5,	0x086,	%l2
	tg	%icc,	0x1
	movle	%icc,	%i7,	%g6
	edge16ln	%o7,	%o1,	%i6
	udiv	%i3,	0x02D5,	%i5
	call	loop_2308
	tleu	%icc,	0x4
	fmovdpos	%icc,	%f17,	%f14
	fmovdvc	%icc,	%f3,	%f31
loop_2308:
	umul	%i2,	0x069D,	%o3
	popc	0x0B4E,	%g1
	smulcc	%i1,	%o4,	%g5
	wr	%g0,	0x19,	%asi
	lda	[%l7 + 0x08] %asi,	%f19
	movre	%g7,	0x315,	%o5
	andn	%o2,	%l1,	%i4
	fbn	%fcc0,	loop_2309
	movrgez	%l0,	%g4,	%o0
	fnot1s	%f11,	%f10
	movrlez	%l4,	0x1D6,	%o6
loop_2309:
	swap	[%l7 + 0x0C],	%g2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsl	%xcc,	%f8,	%f0
	sllx	%l3,	%g3,	%l6
	fmovdne	%icc,	%f11,	%f15
	movrlz	%i0,	0x2D7,	%l5
	edge32ln	%l2,	%i7,	%g6
	swap	[%l7 + 0x10],	%o1
	wr	%g0,	0x89,	%asi
	sta	%f19,	[%l7 + 0x78] %asi
	smul	%i6,	%o7,	%i3
	move	%icc,	%i5,	%i2
	fbne,a	%fcc2,	loop_2310
	ta	%icc,	0x3
	subcc	%g1,	%i1,	%o3
	sdivcc	%g5,	0x1D42,	%g7
loop_2310:
	edge16n	%o5,	%o2,	%o4
	bge,pt	%icc,	loop_2311
	fmovsl	%icc,	%f30,	%f5
	srlx	%l1,	0x06,	%l0
	movrlez	%i4,	%g4,	%o0
loop_2311:
	fmovdvs	%xcc,	%f15,	%f0
	wr	%g0,	0x80,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	bshuffle	%f14,	%f18,	%f26
	fmovsge	%icc,	%f12,	%f2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16ln	%l4,	%g2,	%o6
	subc	%g3,	%l3,	%i0
	fmovscc	%xcc,	%f31,	%f31
	fba,a	%fcc2,	loop_2312
	movg	%icc,	%l6,	%l2
	fcmpeq16	%f2,	%f28,	%i7
	taddcc	%g6,	%o1,	%i6
loop_2312:
	subccc	%o7,	%i3,	%l5
	srl	%i2,	%i5,	%i1
	fnor	%f22,	%f16,	%f20
	umulcc	%g1,	0x0310,	%g5
	edge32	%g7,	%o5,	%o3
	membar	#Sync
	wr	%g0,	0x17,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	udiv	%o2,	0x05A5,	%l1
	siam	0x4
	fbul,a	%fcc1,	loop_2313
	edge16ln	%l0,	%i4,	%g4
	movne	%xcc,	%o4,	%o0
	movle	%xcc,	%l4,	%o6
loop_2313:
	udiv	%g2,	0x0FE2,	%l3
	ldstub	[%l7 + 0x50],	%g3
	movrgez	%l6,	0x0C1,	%l2
	movpos	%xcc,	%i0,	%i7
	edge32	%o1,	%g6,	%o7
	udiv	%i3,	0x197B,	%i6
	movre	%l5,	%i5,	%i1
	fpadd16s	%f3,	%f8,	%f20
	sra	%g1,	0x0F,	%g5
	fmovdcs	%icc,	%f13,	%f20
	tvc	%xcc,	0x7
	fcmpes	%fcc3,	%f9,	%f22
	fmovscs	%xcc,	%f2,	%f7
	movcc	%xcc,	%i2,	%g7
	sllx	%o3,	%o5,	%l1
	sub	%l0,	%i4,	%o2
	tleu	%xcc,	0x3
	pdist	%f16,	%f18,	%f8
	andn	%o4,	%g4,	%o0
	srlx	%l4,	%g2,	%o6
	wr	%g0,	0x04,	%asi
	swapa	[%l7 + 0x60] %asi,	%g3
	wr	%g0,	0x0c,	%asi
	stwa	%l3,	[%l7 + 0x64] %asi
	sdiv	%l2,	0x1632,	%l6
	sub	%i7,	0x15D4,	%i0
	sdiv	%g6,	0x1529,	%o7
	fmovsl	%icc,	%f7,	%f28
	lduw	[%l7 + 0x30],	%i3
	addc	%o1,	0x1546,	%i6
	alignaddr	%l5,	%i1,	%i5
	orncc	%g5,	0x032E,	%i2
	brgez,a	%g1,	loop_2314
	subccc	%g7,	0x0741,	%o5
	fbn	%fcc0,	loop_2315
	movcc	%xcc,	%l1,	%o3
loop_2314:
	sdivcc	%l0,	0x086C,	%i4
	sir	0x0447
loop_2315:
	fbul	%fcc1,	loop_2316
	fnand	%f30,	%f12,	%f18
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	smulcc	%o2,	0x1B87,	%g4
loop_2316:
	tcs	%xcc,	0x5
	xorcc	%o0,	0x1BA2,	%l4
	wr	%g0,	0xe3,	%asi
	stha	%g2,	[%l7 + 0x16] %asi
	membar	#Sync
	movne	%icc,	%o6,	%g3
	smul	%o4,	%l2,	%l3
	srax	%l6,	0x02,	%i0
	xnorcc	%g6,	%o7,	%i7
	movg	%xcc,	%o1,	%i6
	andcc	%i3,	%i1,	%i5
	srax	%l5,	%g5,	%g1
	nop
	set	0x70, %g2
	ldstub	[%l7 + %g2],	%i2
	bshuffle	%f24,	%f10,	%f12
	array8	%o5,	%l1,	%o3
	movne	%xcc,	%l0,	%g7
	fpsub32	%f10,	%f22,	%f8
	tsubcc	%i4,	%o2,	%o0
	sdiv	%l4,	0x0577,	%g2
	fbe	%fcc0,	loop_2317
	orcc	%o6,	%g3,	%g4
	array32	%l2,	%l3,	%o4
	fmovsa	%icc,	%f1,	%f2
loop_2317:
	nop
	setx	loop_2318,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	sllx	%l6,	0x09,	%i0
	ldub	[%l7 + 0x19],	%o7
	fbl	%fcc3,	loop_2319
loop_2318:
	brlz,a	%g6,	loop_2320
	udiv	%i7,	0x0CD9,	%i6
	movn	%xcc,	%i3,	%o1
loop_2319:
	fnot1s	%f18,	%f15
loop_2320:
	swap	[%l7 + 0x58],	%i1
	ldub	[%l7 + 0x21],	%i5
	bcs,pt	%xcc,	loop_2321
	fmovrsne	%g5,	%f5,	%f10
	tcs	%xcc,	0x1
	edge8ln	%l5,	%g1,	%o5
loop_2321:
	umulcc	%l1,	0x1705,	%o3
	fpadd16s	%f1,	%f13,	%f5
	movre	%l0,	0x3F6,	%i2
	sir	0x0F26
	edge16	%i4,	%g7,	%o2
	bneg,a	%xcc,	loop_2322
	andncc	%o0,	%l4,	%o6
	fxors	%f16,	%f13,	%f19
	membar	0x00
loop_2322:
	edge8ln	%g2,	%g3,	%g4
	edge32	%l2,	%o4,	%l3
	movneg	%xcc,	%i0,	%o7
	movcs	%icc,	%l6,	%i7
	movneg	%icc,	%g6,	%i3
	tl	%icc,	0x3
	taddcctv	%o1,	%i1,	%i5
	movrlez	%g5,	%i6,	%l5
	mulx	%o5,	%g1,	%l1
	fnot2s	%f5,	%f24
	edge8	%l0,	%o3,	%i4
	xnorcc	%i2,	%o2,	%g7
	tgu	%xcc,	0x2
	umulcc	%l4,	%o6,	%g2
	smulcc	%g3,	%o0,	%g4
	udivcc	%l2,	0x07AC,	%l3
	edge32l	%i0,	%o7,	%o4
	movg	%icc,	%i7,	%l6
	fnors	%f31,	%f1,	%f26
	and	%i3,	0x10F7,	%o1
	wr	%g0,	0x04,	%asi
	prefetcha	[%l7 + 0x48] %asi,	 0x3
	bg,a	loop_2323
	fxnors	%f2,	%f20,	%f13
	sir	0x0BD3
	edge16n	%i1,	%g5,	%i5
loop_2323:
	movleu	%icc,	%i6,	%l5
	fmovrse	%g1,	%f13,	%f8
	fbg,a	%fcc1,	loop_2324
	movrne	%l1,	0x206,	%l0
	fbu	%fcc0,	loop_2325
	fmovsa	%xcc,	%f12,	%f12
loop_2324:
	tne	%xcc,	0x3
	stb	%o3,	[%l7 + 0x1F]
loop_2325:
	orn	%i4,	0x1365,	%i2
	move	%xcc,	%o2,	%o5
	fmovrsgez	%l4,	%f26,	%f28
	fmul8x16au	%f8,	%f12,	%f14
	tneg	%xcc,	0x5
	fmovsl	%xcc,	%f19,	%f2
	te	%xcc,	0x5
	wr	%g0,	0x11,	%asi
	sta	%f7,	[%l7 + 0x40] %asi
	be	%xcc,	loop_2326
	movge	%xcc,	%g7,	%o6
	stb	%g3,	[%l7 + 0x5A]
	fmovdvc	%xcc,	%f26,	%f27
loop_2326:
	tvc	%xcc,	0x0
	alignaddrl	%g2,	%g4,	%l2
	membar	0x2F
	andcc	%l3,	%o0,	%i0
	movcs	%icc,	%o7,	%o4
	bleu	%xcc,	loop_2327
	std	%i6,	[%l7 + 0x78]
	fnegs	%f17,	%f22
	swap	[%l7 + 0x68],	%i3
loop_2327:
	nop
	set	0x28, %i6
	stxa	%i7,	[%l7 + %i6] 0xea
	membar	#Sync
	xnor	%o1,	%g6,	%i1
	faligndata	%f10,	%f8,	%f10
	swap	[%l7 + 0x40],	%g5
	tleu	%icc,	0x6
	fbue,a	%fcc1,	loop_2328
	srl	%i5,	0x1B,	%l5
	fbne,a	%fcc1,	loop_2329
	bcc,pt	%icc,	loop_2330
loop_2328:
	subc	%g1,	0x059C,	%i6
	lduh	[%l7 + 0x7A],	%l0
loop_2329:
	sra	%l1,	%i4,	%o3
loop_2330:
	fone	%f28
	sth	%o2,	[%l7 + 0x6E]
	tne	%icc,	0x0
	addcc	%o5,	0x0858,	%i2
	smul	%l4,	%g7,	%o6
	bne,a,pn	%icc,	loop_2331
	tn	%icc,	0x2
	movgu	%xcc,	%g3,	%g4
	fbg	%fcc1,	loop_2332
loop_2331:
	movle	%icc,	%g2,	%l3
	add	%o0,	%i0,	%l2
	tsubcc	%o7,	0x04DA,	%o4
loop_2332:
	subcc	%l6,	%i7,	%i3
	tle	%icc,	0x1
	ldd	[%l7 + 0x20],	%o0
	sth	%g6,	[%l7 + 0x70]
	udivx	%i1,	0x1654,	%i5
	edge16l	%l5,	%g5,	%i6
	edge16	%g1,	%l1,	%l0
	sll	%o3,	0x11,	%o2
	add	%l7,	0x58,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] %asi,	%i4,	%i2
	call	loop_2333
	movne	%icc,	%o5,	%l4
	fbue	%fcc0,	loop_2334
	andncc	%o6,	%g7,	%g3
loop_2333:
	bvc,a,pn	%icc,	loop_2335
	sdiv	%g4,	0x0B11,	%g2
loop_2334:
	fmovse	%icc,	%f27,	%f4
	array16	%l3,	%i0,	%l2
loop_2335:
	fmovde	%icc,	%f17,	%f4
	array32	%o7,	%o4,	%l6
	umulcc	%i7,	0x062B,	%o0
	nop
	set	0x24, %l3
	stw	%o1,	[%l7 + %l3]
	brgz,a	%g6,	loop_2336
	add	%i3,	%i1,	%i5
	set	0x28, %o4
	stha	%l5,	[%l7 + %o4] 0x80
loop_2336:
	addc	%i6,	%g5,	%g1
	movg	%icc,	%l0,	%l1
	nop
	set	0x7C, %o2
	ldsw	[%l7 + %o2],	%o2
	ld	[%l7 + 0x40],	%f3
	array32	%i4,	%i2,	%o3
	bn,a	%icc,	loop_2337
	sethi	0x08F5,	%l4
	fpack32	%f6,	%f22,	%f18
	fbge	%fcc1,	loop_2338
loop_2337:
	fand	%f24,	%f28,	%f24
	mulscc	%o6,	0x0036,	%g7
	smulcc	%g3,	%g4,	%o5
loop_2338:
	tne	%xcc,	0x1
	fmovrdlez	%g2,	%f28,	%f10
	andn	%i0,	0x0DEB,	%l3
	fcmpgt16	%f8,	%f22,	%o7
	edge16l	%o4,	%l6,	%l2
	umul	%o0,	0x0408,	%i7
	tcc	%xcc,	0x3
	wr	%g0,	0x80,	%asi
	ldxa	[%l7 + 0x58] %asi,	%o1
	udivcc	%g6,	0x1A22,	%i1
	brlez,a	%i5,	loop_2339
	fmul8x16	%f30,	%f10,	%f12
	fbuge	%fcc3,	loop_2340
	movl	%xcc,	%l5,	%i3
loop_2339:
	subccc	%g5,	0x12DC,	%i6
	sdivx	%l0,	0x1B84,	%l1
loop_2340:
	nop
	wr	%g0,	0x10,	%asi
	stba	%g1,	[%l7 + 0x4D] %asi
	tpos	%icc,	0x6
	std	%f10,	[%l7 + 0x28]
	fmovrdgez	%i4,	%f24,	%f20
	movrlz	%i2,	0x022,	%o3
	ta	%icc,	0x7
	tsubcctv	%o2,	0x1B9D,	%l4
	popc	0x0FEE,	%g7
	fzeros	%f1
	fnot1	%f18,	%f0
	tvs	%icc,	0x2
	fbuge	%fcc0,	loop_2341
	mulscc	%g3,	%g4,	%o6
	tsubcctv	%o5,	%g2,	%i0
	movgu	%icc,	%l3,	%o7
loop_2341:
	ble,a	loop_2342
	fmovsleu	%xcc,	%f0,	%f5
	mova	%xcc,	%o4,	%l2
	movneg	%xcc,	%l6,	%i7
loop_2342:
	movrgz	%o0,	0x165,	%o1
	tge	%icc,	0x2
	bvc,a	loop_2343
	fpsub16	%f18,	%f28,	%f12
	fornot2	%f2,	%f12,	%f30
	set	0x18, %o7
	stda	%i0,	[%l7 + %o7] 0x89
loop_2343:
	fmovdge	%icc,	%f25,	%f0
	fmovsne	%xcc,	%f17,	%f13
	movle	%icc,	%g6,	%l5
	set	0x24, %g3
	sta	%f14,	[%l7 + %g3] 0x81
	movvc	%icc,	%i5,	%g5
	edge16ln	%i6,	%l0,	%l1
	tvs	%icc,	0x0
	stx	%g1,	[%l7 + 0x58]
	tsubcctv	%i3,	%i2,	%i4
	wr	%g0,	0x10,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	fmovsne	%icc,	%f23,	%f20
	tgu	%icc,	0x1
	udiv	%o3,	0x1506,	%o2
	mulx	%l4,	0x1F6A,	%g3
	movrne	%g4,	%g7,	%o6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x0c,	%asi
	ldsha	[%l7 + 0x14] %asi,	%o5
	edge8ln	%i0,	%l3,	%g2
	fbg	%fcc2,	loop_2344
	bvc,pt	%xcc,	loop_2345
	sethi	0x09D6,	%o7
	edge8n	%o4,	%l2,	%l6
loop_2344:
	mulx	%i7,	0x008D,	%o1
loop_2345:
	movvc	%icc,	%o0,	%g6
	srl	%l5,	%i5,	%i1
	set	0x60, %g6
	prefetcha	[%l7 + %g6] 0x89,	 0x3
	fble	%fcc0,	loop_2346
	fcmple16	%f0,	%f8,	%i6
	call	loop_2347
	fmovdcc	%xcc,	%f11,	%f25
loop_2346:
	tg	%xcc,	0x5
	fnor	%f0,	%f22,	%f18
loop_2347:
	movneg	%xcc,	%l0,	%g1
	wr	%g0,	0x2a,	%asi
	stxa	%l1,	[%l7 + 0x50] %asi
	membar	#Sync
	edge8ln	%i3,	%i4,	%i2
	xnorcc	%o3,	%o2,	%g3
	movrgz	%l4,	0x26E,	%g4
	fmovsvc	%xcc,	%f16,	%f9
	andncc	%g7,	%o6,	%i0
	udiv	%o5,	0x039A,	%g2
	movne	%xcc,	%l3,	%o4
	fbl,a	%fcc2,	loop_2348
	ldx	[%l7 + 0x68],	%o7
	addccc	%l6,	%l2,	%o1
	tge	%xcc,	0x3
loop_2348:
	fmuld8sux16	%f22,	%f20,	%f24
	tge	%xcc,	0x3
	bn	loop_2349
	bge,a,pt	%icc,	loop_2350
	fmovrsgez	%o0,	%f23,	%f16
	edge8ln	%i7,	%g6,	%l5
loop_2349:
	movneg	%xcc,	%i5,	%g5
loop_2350:
	tcs	%icc,	0x3
	udivx	%i1,	0x1816,	%l0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ba,pn	%icc,	loop_2351
	sdivx	%g1,	0x0362,	%i6
	add	%i3,	0x1F0E,	%i4
	xnor	%i2,	%o3,	%o2
loop_2351:
	addccc	%g3,	0x0A26,	%l1
	mulx	%g4,	%l4,	%g7
	sdivx	%o6,	0x038E,	%o5
	umul	%i0,	0x1089,	%g2
	fpsub16s	%f23,	%f0,	%f3
	call	loop_2352
	fmovrdgz	%l3,	%f8,	%f16
	edge16n	%o7,	%l6,	%l2
	array16	%o1,	%o0,	%o4
loop_2352:
	ldd	[%l7 + 0x48],	%f22
	movrgez	%g6,	0x124,	%l5
	smul	%i7,	%g5,	%i1
	movpos	%xcc,	%l0,	%i5
	srl	%i6,	0x14,	%i3
	orncc	%g1,	%i2,	%i4
	stb	%o2,	[%l7 + 0x63]
	andn	%g3,	0x0BFA,	%l1
	tl	%icc,	0x7
	fnot1	%f0,	%f28
	set	0x48, %g7
	lduha	[%l7 + %g7] 0x04,	%o3
	tsubcc	%g4,	0x117B,	%g7
	bne,a,pt	%icc,	loop_2353
	fcmped	%fcc1,	%f8,	%f8
	fcmps	%fcc3,	%f26,	%f27
	set	0x70, %o6
	sta	%f31,	[%l7 + %o6] 0x11
loop_2353:
	xorcc	%o6,	%o5,	%i0
	andn	%g2,	%l3,	%o7
	edge32	%l4,	%l2,	%l6
	fand	%f30,	%f10,	%f2
	fbo	%fcc2,	loop_2354
	udivcc	%o1,	0x04A9,	%o0
	movcs	%icc,	%g6,	%o4
	brnz	%i7,	loop_2355
loop_2354:
	tleu	%icc,	0x5
	orn	%g5,	0x0FDB,	%l5
	fmul8x16au	%f16,	%f14,	%f30
loop_2355:
	ldsh	[%l7 + 0x60],	%i1
	udivcc	%l0,	0x1299,	%i5
	tle	%xcc,	0x4
	xorcc	%i6,	%i3,	%i2
	movneg	%xcc,	%i4,	%g1
	andcc	%g3,	%o2,	%l1
	fbg	%fcc0,	loop_2356
	edge32l	%o3,	%g4,	%g7
	edge8l	%o5,	%o6,	%i0
	fmovsn	%icc,	%f24,	%f31
loop_2356:
	bge,a,pt	%icc,	loop_2357
	tvc	%xcc,	0x5
	xnorcc	%l3,	0x0645,	%o7
	std	%g2,	[%l7 + 0x40]
loop_2357:
	bcs,a,pt	%icc,	loop_2358
	andncc	%l2,	%l6,	%o1
	set	0x74, %i1
	lduwa	[%l7 + %i1] 0x11,	%l4
loop_2358:
	st	%f30,	[%l7 + 0x58]
	sdivcc	%o0,	0x1D99,	%g6
	edge32	%o4,	%i7,	%l5
	bleu,a	loop_2359
	popc	0x1C44,	%g5
	taddcc	%i1,	0x1380,	%l0
	mova	%xcc,	%i5,	%i6
loop_2359:
	fxors	%f1,	%f5,	%f8
	xnor	%i3,	0x1A1D,	%i2
	andcc	%g1,	0x115B,	%g3
	nop
	set	0x78, %i4
	std	%f24,	[%l7 + %i4]
	tpos	%xcc,	0x1
	fpsub32	%f6,	%f22,	%f16
	tn	%xcc,	0x2
	wr	%g0,	0xf1,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
	tsubcctv	%i4,	0x0DD6,	%l1
	movrgz	%o2,	%g4,	%g7
	siam	0x1
	sethi	0x194A,	%o3
	fmovdg	%icc,	%f23,	%f5
	wr	%g0,	0x2b,	%asi
	stha	%o6,	[%l7 + 0x7C] %asi
	membar	#Sync
	xnorcc	%i0,	0x0644,	%o5
	array8	%l3,	%g2,	%l2
	wr	%g0,	0x04,	%asi
	stha	%o7,	[%l7 + 0x70] %asi
	alignaddrl	%l6,	%l4,	%o1
	tvc	%xcc,	0x6
	tn	%xcc,	0x3
	fmovspos	%icc,	%f25,	%f21
	tg	%xcc,	0x0
	movrlz	%o0,	0x34D,	%o4
	fornot1s	%f19,	%f12,	%f2
	fcmpd	%fcc0,	%f24,	%f10
	ldx	[%l7 + 0x50],	%i7
	andn	%l5,	0x0E34,	%g6
	edge8n	%g5,	%l0,	%i5
	movgu	%xcc,	%i6,	%i1
	fornot2s	%f17,	%f28,	%f22
	edge8	%i2,	%i3,	%g3
	movcc	%icc,	%g1,	%l1
	fble,a	%fcc2,	loop_2360
	bl,a,pn	%xcc,	loop_2361
	tleu	%icc,	0x0
	fmovdgu	%icc,	%f20,	%f11
loop_2360:
	movcc	%xcc,	%i4,	%g4
loop_2361:
	sdivx	%g7,	0x1376,	%o3
	fpadd32s	%f5,	%f5,	%f13
	sdivcc	%o2,	0x119B,	%i0
	bneg,a	%icc,	loop_2362
	bleu,pt	%xcc,	loop_2363
	bn	loop_2364
	tsubcctv	%o6,	%o5,	%l3
loop_2362:
	sethi	0x0582,	%g2
loop_2363:
	tgu	%icc,	0x6
loop_2364:
	edge16	%o7,	%l6,	%l2
	fmovdne	%xcc,	%f8,	%f16
	movrlez	%l4,	0x326,	%o1
	array8	%o4,	%i7,	%o0
	fmul8x16al	%f31,	%f1,	%f22
	fmovse	%icc,	%f27,	%f11
	nop
	set	0x2F, %i5
	stb	%g6,	[%l7 + %i5]
	sub	%g5,	%l5,	%i5
	set	0x40, %l5
	stda	%f0,	[%l7 + %l5] 0x1e
	membar	#Sync
	fpadd16	%f28,	%f26,	%f20
	swap	[%l7 + 0x64],	%i6
	array16	%i1,	%l0,	%i2
	sdiv	%g3,	0x0905,	%i3
	sra	%l1,	%i4,	%g1
	movle	%icc,	%g4,	%o3
	udiv	%g7,	0x1E70,	%i0
	add	%l7,	0x40,	%l6
	wr	%g0,	0x0c,	%asi
	casa	[%l6] 0x0c,	%o6,	%o5
	fandnot1s	%f19,	%f17,	%f31
	fpadd32	%f18,	%f20,	%f24
	edge16l	%l3,	%g2,	%o2
	fmul8x16al	%f28,	%f21,	%f30
	movre	%l6,	0x0B4,	%l2
	fcmpgt32	%f0,	%f22,	%o7
	edge32	%o1,	%o4,	%l4
	set	0x0C, %l4
	lduwa	[%l7 + %l4] 0x0c,	%o0
	ld	[%l7 + 0x70],	%f17
	tvc	%icc,	0x6
	tne	%icc,	0x5
	fbge,a	%fcc0,	loop_2365
	subccc	%g6,	%i7,	%l5
	ta	%icc,	0x0
	edge8l	%i5,	%g5,	%i1
loop_2365:
	tneg	%icc,	0x7
	srl	%l0,	%i6,	%g3
	fpackfix	%f16,	%f30
	orcc	%i2,	0x18CB,	%i3
	udivcc	%l1,	0x1910,	%g1
	movrlez	%g4,	0x02A,	%o3
	brnz	%i4,	loop_2366
	fbo,a	%fcc1,	loop_2367
	fmovsvs	%icc,	%f20,	%f28
	fmovrdlez	%i0,	%f26,	%f14
loop_2366:
	movge	%icc,	%g7,	%o6
loop_2367:
	fmovda	%xcc,	%f9,	%f4
	movcc	%xcc,	%o5,	%g2
	fmuld8ulx16	%f28,	%f31,	%f16
	fcmped	%fcc2,	%f24,	%f16
	fmovdle	%icc,	%f25,	%f0
	wr	%g0,	0x23,	%asi
	stda	%o2,	[%l7 + 0x50] %asi
	membar	#Sync
	array8	%l6,	%l3,	%l2
	fmovdpos	%icc,	%f30,	%f2
	movle	%icc,	%o7,	%o4
	ldsw	[%l7 + 0x28],	%l4
	wr	%g0,	0x19,	%asi
	lda	[%l7 + 0x70] %asi,	%f14
	edge16n	%o0,	%g6,	%o1
	bcc,a	%icc,	loop_2368
	sdivx	%l5,	0x1747,	%i7
	wr	%g0,	0x80,	%asi
	prefetcha	[%l7 + 0x08] %asi,	 0x0
loop_2368:
	tn	%icc,	0x0
	movl	%xcc,	%g5,	%i1
	fpack32	%f0,	%f10,	%f14
	movgu	%xcc,	%l0,	%i6
	umul	%i2,	%i3,	%g3
	fxor	%f18,	%f24,	%f18
	smulcc	%g1,	%g4,	%o3
	udiv	%l1,	0x1DBB,	%i4
	movne	%icc,	%g7,	%i0
	wr	%g0,	0x89,	%asi
	ldda	[%l7 + 0x60] %asi,	%o4
	std	%o6,	[%l7 + 0x38]
	udivcc	%g2,	0x19D5,	%o2
	ld	[%l7 + 0x64],	%f18
	tcc	%xcc,	0x4
	fmovsleu	%icc,	%f7,	%f22
	brz,a	%l6,	loop_2369
	udivcc	%l3,	0x0D08,	%o7
	movrgz	%o4,	0x255,	%l2
	add	%l4,	0x029B,	%g6
loop_2369:
	edge16n	%o1,	%l5,	%i7
	sub	%i5,	0x1DC0,	%o0
	prefetch	[%l7 + 0x78],	 0x1
	udiv	%g5,	0x044C,	%i1
	alignaddr	%l0,	%i2,	%i6
	bge,pn	%xcc,	loop_2370
	ldx	[%l7 + 0x50],	%i3
	bcs,pn	%xcc,	loop_2371
	tn	%xcc,	0x3
loop_2370:
	fmovse	%icc,	%f1,	%f27
	taddcc	%g1,	%g4,	%g3
loop_2371:
	array32	%l1,	%i4,	%o3
	fmovrsne	%i0,	%f27,	%f25
	sra	%g7,	0x1C,	%o6
	movle	%icc,	%g2,	%o5
	subccc	%o2,	0x0ECC,	%l3
	add	%l6,	0x05A4,	%o7
	fbge	%fcc3,	loop_2372
	tpos	%xcc,	0x4
	movg	%icc,	%o4,	%l2
	bleu	loop_2373
loop_2372:
	fmovsgu	%icc,	%f3,	%f3
	subccc	%g6,	0x11A2,	%l4
	fnands	%f30,	%f18,	%f31
loop_2373:
	nop
	wr	%g0,	0x22,	%asi
	ldda	[%l7 + 0x70] %asi,	%o0
	addc	%i7,	%l5,	%i5
	taddcc	%g5,	%o0,	%i1
	ldstub	[%l7 + 0x35],	%l0
	movle	%icc,	%i2,	%i6
	movrlez	%g1,	%i3,	%g3
	fmovscs	%icc,	%f30,	%f3
	fmovdn	%xcc,	%f16,	%f1
	fandnot1	%f16,	%f22,	%f12
	edge16ln	%g4,	%l1,	%o3
	add	%l7,	0x0C,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%i0,	%i4
	movge	%xcc,	%o6,	%g7
	array16	%o5,	%g2,	%l3
	fmovscs	%xcc,	%f17,	%f25
	smulcc	%o2,	%l6,	%o7
	fpadd16	%f12,	%f2,	%f18
	array32	%o4,	%l2,	%g6
	set	0x0E, %i2
	ldstuba	[%l7 + %i2] 0x80,	%l4
	fmovrdne	%o1,	%f14,	%f22
	mulscc	%i7,	0x054E,	%i5
	movrgez	%g5,	0x251,	%l5
	brnz	%i1,	loop_2374
	fbug,a	%fcc3,	loop_2375
	nop
	setx	loop_2376,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	tpos	%xcc,	0x5
loop_2374:
	fbug	%fcc3,	loop_2377
loop_2375:
	movpos	%xcc,	%l0,	%i2
loop_2376:
	edge16	%o0,	%i6,	%i3
	array32	%g1,	%g3,	%l1
loop_2377:
	brlez	%o3,	loop_2378
	srlx	%i0,	0x0B,	%g4
	tl	%icc,	0x6
	edge32ln	%i4,	%o6,	%o5
loop_2378:
	flush	%l7 + 0x20
	srlx	%g7,	0x08,	%g2
	xorcc	%o2,	%l6,	%l3
	array16	%o7,	%l2,	%g6
	ldstub	[%l7 + 0x51],	%o4
	edge16	%l4,	%i7,	%i5
	fbl,a	%fcc2,	loop_2379
	fba	%fcc2,	loop_2380
	bn,a,pn	%icc,	loop_2381
	ld	[%l7 + 0x54],	%f2
loop_2379:
	sll	%o1,	0x07,	%l5
loop_2380:
	andcc	%i1,	%g5,	%i2
loop_2381:
	movrgez	%o0,	0x3AC,	%l0
	edge8	%i6,	%i3,	%g3
	fbg,a	%fcc1,	loop_2382
	fbge	%fcc0,	loop_2383
	fba,a	%fcc1,	loop_2384
	tl	%xcc,	0x1
loop_2382:
	fblg	%fcc2,	loop_2385
loop_2383:
	smul	%g1,	%o3,	%i0
loop_2384:
	edge8ln	%g4,	%l1,	%i4
	sdivx	%o6,	0x0B45,	%g7
loop_2385:
	and	%g2,	%o5,	%o2
	or	%l3,	0x118B,	%l6
	movgu	%xcc,	%o7,	%g6
	smulcc	%o4,	0x14B0,	%l4
	faligndata	%f6,	%f4,	%f20
	array8	%l2,	%i7,	%i5
	subccc	%l5,	%i1,	%g5
	andn	%o1,	0x1FBD,	%i2
	edge32l	%o0,	%i6,	%l0
	andcc	%i3,	%g3,	%g1
	array32	%o3,	%g4,	%l1
	mulx	%i0,	%i4,	%o6
	brlz	%g7,	loop_2386
	tle	%xcc,	0x7
	fpadd32s	%f3,	%f6,	%f19
	or	%o5,	%g2,	%l3
loop_2386:
	tcs	%icc,	0x2
	fmovsgu	%xcc,	%f7,	%f1
	set	0x78, %g4
	lda	[%l7 + %g4] 0x10,	%f21
	subccc	%o2,	%o7,	%g6
	movge	%icc,	%o4,	%l4
	addcc	%l2,	%l6,	%i7
	tl	%icc,	0x4
	edge32l	%i5,	%l5,	%i1
	nop
	set	0x4D, %i7
	ldsb	[%l7 + %i7],	%g5
	movrgz	%i2,	%o1,	%i6
	fxnor	%f18,	%f16,	%f12
	xor	%l0,	0x0B7C,	%i3
	sdiv	%g3,	0x17FC,	%o0
	fmovrslz	%g1,	%f2,	%f8
	fcmpne32	%f0,	%f10,	%g4
	tvs	%icc,	0x0
	edge8	%o3,	%l1,	%i4
	fbul	%fcc0,	loop_2387
	orncc	%i0,	0x1CA6,	%g7
	fmovd	%f24,	%f0
	fbge,a	%fcc2,	loop_2388
loop_2387:
	taddcc	%o5,	%o6,	%l3
	movrgz	%o2,	%o7,	%g6
	set	0x48, %o1
	prefetcha	[%l7 + %o1] 0x11,	 0x3
loop_2388:
	fcmpes	%fcc0,	%f5,	%f4
	fmovrdne	%l4,	%f26,	%f24
	nop
	setx	loop_2389,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	ldx	[%l7 + 0x60],	%g2
	sth	%l6,	[%l7 + 0x0E]
	fmovscc	%xcc,	%f11,	%f16
loop_2389:
	xorcc	%l2,	0x123C,	%i5
	movvs	%icc,	%l5,	%i1
	stw	%g5,	[%l7 + 0x38]
	fmul8sux16	%f6,	%f28,	%f22
	fpack16	%f28,	%f6
	tsubcc	%i7,	%o1,	%i2
	taddcc	%l0,	%i6,	%i3
	smul	%g3,	%g1,	%o0
	movpos	%icc,	%g4,	%l1
	ta	%icc,	0x1
	tg	%icc,	0x5
	tcs	%icc,	0x2
	alignaddr	%i4,	%i0,	%g7
	fnands	%f10,	%f28,	%f17
	mulscc	%o5,	%o6,	%l3
	edge8n	%o2,	%o3,	%g6
	taddcctv	%o4,	0x14AB,	%o7
	stw	%l4,	[%l7 + 0x24]
	bvc,pn	%xcc,	loop_2390
	sdivcc	%l6,	0x0FB9,	%g2
	flush	%l7 + 0x30
	xnorcc	%i5,	0x0D53,	%l2
loop_2390:
	fzero	%f0
	tneg	%icc,	0x0
	sllx	%i1,	%l5,	%g5
	array16	%i7,	%i2,	%o1
	movcc	%icc,	%i6,	%l0
	sethi	0x0E24,	%i3
	fbne,a	%fcc3,	loop_2391
	fcmpeq32	%f30,	%f20,	%g3
	fmovscs	%icc,	%f24,	%f4
	movleu	%xcc,	%o0,	%g4
loop_2391:
	fpadd16	%f16,	%f20,	%f30
	fmovs	%f6,	%f3
	nop
	setx	loop_2392,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	edge16	%g1,	%i4,	%i0
	bvs,pn	%xcc,	loop_2393
	tleu	%icc,	0x2
loop_2392:
	tvc	%icc,	0x3
	te	%xcc,	0x2
loop_2393:
	edge8n	%l1,	%o5,	%o6
	edge16ln	%l3,	%o2,	%o3
	edge8ln	%g7,	%g6,	%o4
	subccc	%l4,	%o7,	%l6
	umul	%i5,	%l2,	%g2
	taddcctv	%i1,	0x1EEA,	%g5
	movge	%icc,	%i7,	%l5
	tl	%xcc,	0x6
	sra	%i2,	0x05,	%i6
	popc	%o1,	%i3
	edge8l	%l0,	%o0,	%g4
	std	%g2,	[%l7 + 0x28]
	xnor	%g1,	0x023A,	%i4
	fnot2s	%f23,	%f27
	lduh	[%l7 + 0x68],	%i0
	swap	[%l7 + 0x3C],	%o5
	fandnot1	%f16,	%f30,	%f20
	subc	%l1,	0x1825,	%o6
	edge32n	%l3,	%o2,	%g7
	sdivcc	%g6,	0x0AD7,	%o3
	xnor	%l4,	%o7,	%o4
	movg	%xcc,	%i5,	%l2
	taddcctv	%l6,	0x01B2,	%g2
	srl	%i1,	0x1D,	%g5
	orn	%i7,	%i2,	%i6
	tvs	%icc,	0x1
	fpadd32s	%f7,	%f16,	%f8
	set	0x28, %i0
	prefetcha	[%l7 + %i0] 0x14,	 0x2
	fpadd16s	%f4,	%f10,	%f6
	udivcc	%i3,	0x1117,	%l0
	movvs	%icc,	%o0,	%l5
	edge16	%g4,	%g3,	%g1
	ldstub	[%l7 + 0x23],	%i4
	membar	0x14
	wr	%g0,	0x89,	%asi
	swapa	[%l7 + 0x5C] %asi,	%i0
	movre	%o5,	0x3FB,	%l1
	movne	%icc,	%l3,	%o2
	orn	%g7,	%g6,	%o3
	ldsw	[%l7 + 0x08],	%l4
	bpos	%icc,	loop_2394
	bge,pn	%xcc,	loop_2395
	movl	%xcc,	%o6,	%o4
	movvs	%icc,	%i5,	%o7
loop_2394:
	fmovrde	%l6,	%f28,	%f20
loop_2395:
	addccc	%l2,	0x035A,	%g2
	ta	%icc,	0x6
	movrlz	%i1,	0x04E,	%g5
	umulcc	%i7,	%i6,	%i2
	fzero	%f26
	array8	%i3,	%o1,	%l0
	taddcc	%o0,	0x0062,	%l5
	fcmpeq16	%f22,	%f20,	%g4
	umulcc	%g3,	0x06C8,	%g1
	movpos	%xcc,	%i0,	%o5
	fmovrsne	%l1,	%f23,	%f8
	edge32l	%i4,	%o2,	%g7
	fmul8x16au	%f13,	%f14,	%f14
	tvs	%xcc,	0x3
	bgu,a	loop_2396
	sub	%l3,	0x070C,	%o3
	movleu	%icc,	%g6,	%l4
	set	0x58, %o3
	ldswa	[%l7 + %o3] 0x14,	%o6
loop_2396:
	fmovse	%xcc,	%f26,	%f21
	fmuld8sux16	%f10,	%f9,	%f0
	orncc	%i5,	%o7,	%l6
	sll	%l2,	0x1D,	%g2
	tg	%icc,	0x0
	prefetch	[%l7 + 0x7C],	 0x1
	udiv	%i1,	0x167B,	%o4
	array16	%g5,	%i6,	%i2
	mulx	%i7,	0x00C6,	%i3
	srl	%l0,	%o0,	%o1
	ldd	[%l7 + 0x48],	%f4
	fcmpd	%fcc1,	%f20,	%f18
	stx	%l5,	[%l7 + 0x58]
	ta	%xcc,	0x6
	fbo	%fcc1,	loop_2397
	subccc	%g3,	%g1,	%g4
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x68] %asi,	%o5
loop_2397:
	fbue,a	%fcc1,	loop_2398
	bneg,pt	%xcc,	loop_2399
	tne	%xcc,	0x6
	movcs	%xcc,	%l1,	%i0
loop_2398:
	orcc	%o2,	%g7,	%l3
loop_2399:
	movvc	%xcc,	%o3,	%i4
	and	%g6,	%o6,	%l4
	addccc	%o7,	0x19D8,	%l6
	xorcc	%i5,	%l2,	%i1
	array32	%o4,	%g5,	%g2
	edge16	%i6,	%i7,	%i3
	fbge,a	%fcc0,	loop_2400
	swap	[%l7 + 0x78],	%l0
	andcc	%i2,	0x117E,	%o1
	movrne	%o0,	0x053,	%g3
loop_2400:
	call	loop_2401
	edge32n	%l5,	%g4,	%g1
	subc	%l1,	%o5,	%i0
	fand	%f0,	%f10,	%f0
loop_2401:
	fble,a	%fcc1,	loop_2402
	xorcc	%g7,	0x1CCB,	%l3
	udivcc	%o3,	0x1829,	%i4
	set	0x2B, %i3
	lduba	[%l7 + %i3] 0x19,	%g6
loop_2402:
	subc	%o6,	0x097B,	%o2
	edge16l	%o7,	%l4,	%i5
	fmovsgu	%icc,	%f12,	%f18
	ba	loop_2403
	fbn,a	%fcc1,	loop_2404
	tl	%icc,	0x7
	stw	%l2,	[%l7 + 0x24]
loop_2403:
	sdivx	%i1,	0x0E2C,	%l6
loop_2404:
	orncc	%o4,	%g5,	%g2
	tcc	%icc,	0x2
	fnand	%f14,	%f18,	%f22
	movle	%icc,	%i6,	%i3
	fmovrslz	%i7,	%f14,	%f30
	umul	%l0,	0x0D16,	%o1
	edge32	%i2,	%g3,	%o0
	tneg	%xcc,	0x2
	fandnot2s	%f16,	%f16,	%f19
	nop
	setx	loop_2405,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	sdiv	%g4,	0x0698,	%l5
	tvs	%icc,	0x4
	fbug,a	%fcc2,	loop_2406
loop_2405:
	mova	%icc,	%g1,	%o5
	fmovscc	%icc,	%f5,	%f11
	subc	%i0,	0x0583,	%g7
loop_2406:
	fpadd32	%f2,	%f10,	%f18
	xnorcc	%l3,	%l1,	%i4
	orn	%o3,	0x07EE,	%o6
	xor	%g6,	%o7,	%l4
	fbue,a	%fcc2,	loop_2407
	brz	%i5,	loop_2408
	fble	%fcc3,	loop_2409
	srl	%l2,	0x1F,	%o2
loop_2407:
	ldub	[%l7 + 0x35],	%i1
loop_2408:
	alignaddr	%o4,	%l6,	%g2
loop_2409:
	ba,a	loop_2410
	tsubcctv	%i6,	0x0D70,	%g5
	bcs,pn	%icc,	loop_2411
	edge8l	%i3,	%i7,	%o1
loop_2410:
	sir	0x0F3F
	orn	%l0,	%i2,	%o0
loop_2411:
	brz,a	%g3,	loop_2412
	nop
	setx loop_2413, %l0, %l1
	jmpl %l1, %l5
	sir	0x0936
	umulcc	%g1,	0x0BD8,	%g4
loop_2412:
	smulcc	%i0,	0x0CE4,	%o5
loop_2413:
	array16	%l3,	%g7,	%i4
	ldd	[%l7 + 0x18],	%o2
	fmovsne	%icc,	%f1,	%f25
	sub	%o6,	0x1A06,	%g6
	fmovsvs	%icc,	%f2,	%f28
	ldstub	[%l7 + 0x46],	%o7
	fbul	%fcc2,	loop_2414
	fornot2	%f2,	%f28,	%f14
	array16	%l1,	%l4,	%l2
	tg	%icc,	0x0
loop_2414:
	be	%xcc,	loop_2415
	bcs,pt	%icc,	loop_2416
	alignaddr	%o2,	%i5,	%i1
	orcc	%l6,	0x12F4,	%o4
loop_2415:
	edge32l	%i6,	%g2,	%i3
loop_2416:
	fmovrsne	%i7,	%f25,	%f8
	brlez,a	%o1,	loop_2417
	umulcc	%g5,	0x1E41,	%i2
	xorcc	%l0,	0x08AA,	%o0
	fmovse	%xcc,	%f13,	%f3
loop_2417:
	nop
	membar	#Sync
	wr	%g0,	0xf1,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	tvs	%icc,	0x2
	fmovrsgez	%g3,	%f22,	%f7
	std	%l4,	[%l7 + 0x40]
	fbue,a	%fcc3,	loop_2418
	ba,pt	%xcc,	loop_2419
	fmovrsgez	%g4,	%f10,	%f21
	edge16l	%i0,	%g1,	%o5
loop_2418:
	movgu	%xcc,	%g7,	%l3
loop_2419:
	sll	%i4,	%o3,	%o6
	fcmple32	%f4,	%f6,	%g6
	fmovsvc	%icc,	%f1,	%f29
	bge,a	loop_2420
	sllx	%l1,	0x0E,	%l4
	edge32l	%o7,	%l2,	%o2
	movvc	%icc,	%i1,	%i5
loop_2420:
	srax	%o4,	0x0D,	%l6
	bne,pn	%xcc,	loop_2421
	fmovsle	%icc,	%f7,	%f9
	ble,a	%icc,	loop_2422
	edge8l	%g2,	%i3,	%i6
loop_2421:
	nop
	wr	%g0,	0x88,	%asi
	stba	%i7,	[%l7 + 0x60] %asi
loop_2422:
	fnegs	%f29,	%f23
	orcc	%g5,	%i2,	%l0
	edge32n	%o0,	%g3,	%o1
	edge8	%g4,	%l5,	%i0
	fcmped	%fcc1,	%f20,	%f14
	and	%o5,	%g7,	%g1
	sra	%l3,	%i4,	%o6
	wr	%g0,	0x11,	%asi
	prefetcha	[%l7 + 0x58] %asi,	 0x1
	mova	%xcc,	%g6,	%l4
	stx	%o7,	[%l7 + 0x10]
	mulscc	%l1,	0x0D2C,	%l2
	fpack16	%f28,	%f7
	fmovrdlz	%i1,	%f30,	%f22
	fmovdleu	%icc,	%f8,	%f18
	movleu	%icc,	%i5,	%o4
	bcs	%icc,	loop_2423
	fmovsn	%xcc,	%f29,	%f10
	alignaddrl	%l6,	%g2,	%i3
	taddcctv	%o2,	0x199C,	%i6
loop_2423:
	nop
	wr	%g0,	0x80,	%asi
	stwa	%i7,	[%l7 + 0x2C] %asi
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fone	%f0
	fcmps	%fcc3,	%f4,	%f17
	fandnot1	%f26,	%f10,	%f16
	brgez	%g5,	loop_2424
	bcc	%icc,	loop_2425
	be,a	%xcc,	loop_2426
	fmovdneg	%xcc,	%f0,	%f5
loop_2424:
	tleu	%xcc,	0x0
loop_2425:
	taddcctv	%i2,	0x0F30,	%o0
loop_2426:
	tn	%icc,	0x4
	nop
	setx	loop_2427,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	brz,a	%l0,	loop_2428
	alignaddr	%o1,	%g3,	%l5
	fble	%fcc2,	loop_2429
loop_2427:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2428:
	sir	0x0B5D
	andn	%g4,	%i0,	%g7
loop_2429:
	umulcc	%o5,	0x1692,	%l3
	edge8l	%i4,	%o6,	%g1
	udivcc	%o3,	0x0821,	%g6
	tpos	%icc,	0x3
	bleu,pn	%xcc,	loop_2430
	edge8	%l4,	%o7,	%l1
	fzeros	%f14
	movrgez	%l2,	%i1,	%o4
loop_2430:
	tsubcc	%l6,	%i5,	%i3
	movl	%icc,	%o2,	%g2
	nop
	setx loop_2431, %l0, %l1
	jmpl %l1, %i6
	std	%i6,	[%l7 + 0x60]
	movcs	%xcc,	%g5,	%o0
	fmovrslz	%l0,	%f26,	%f18
loop_2431:
	array16	%i2,	%o1,	%g3
	bneg,a	loop_2432
	ldx	[%l7 + 0x18],	%g4
	fblg,a	%fcc1,	loop_2433
	taddcc	%i0,	%l5,	%o5
loop_2432:
	fbue	%fcc0,	loop_2434
	mulscc	%l3,	0x0B54,	%i4
loop_2433:
	sra	%g7,	%o6,	%o3
	popc	%g1,	%g6
loop_2434:
	fornot1s	%f21,	%f11,	%f16
	and	%l4,	%l1,	%o7
	tcs	%icc,	0x3
	fornot1	%f14,	%f4,	%f30
	fabsd	%f10,	%f22
	movrgz	%l2,	0x0FC,	%o4
	set	0x40, %o0
	ldswa	[%l7 + %o0] 0x0c,	%l6
	fcmpeq32	%f6,	%f30,	%i1
	wr	%g0,	0x11,	%asi
	ldsha	[%l7 + 0x1C] %asi,	%i5
	andncc	%i3,	%g2,	%o2
	movrne	%i7,	%g5,	%i6
	movl	%icc,	%o0,	%i2
	movvs	%xcc,	%l0,	%g3
	fmovscc	%icc,	%f1,	%f28
	movle	%icc,	%o1,	%g4
	movpos	%icc,	%l5,	%o5
	sth	%l3,	[%l7 + 0x74]
	movpos	%xcc,	%i4,	%g7
	edge32	%i0,	%o3,	%g1
	udiv	%o6,	0x12C1,	%g6
	ldsb	[%l7 + 0x2C],	%l1
	set	0x4C, %l6
	stha	%o7,	[%l7 + %l6] 0x89
	sub	%l4,	0x02AC,	%o4
	tvc	%icc,	0x5
	fands	%f27,	%f19,	%f3
	fmovde	%xcc,	%f10,	%f22
	fmovdge	%icc,	%f21,	%f26
	ld	[%l7 + 0x78],	%f29
	set	0x40, %g5
	stxa	%l6,	[%l7 + %g5] 0x80
	movrgez	%l2,	0x19F,	%i1
	fpadd32s	%f12,	%f22,	%f13
	edge32ln	%i3,	%g2,	%i5
	fmovrslz	%i7,	%f14,	%f8
	array32	%o2,	%g5,	%o0
	fcmps	%fcc0,	%f12,	%f2
	sethi	0x00E5,	%i2
	ld	[%l7 + 0x68],	%f2
	udiv	%i6,	0x1A38,	%l0
	fmovdvs	%icc,	%f3,	%f8
	edge16l	%o1,	%g3,	%g4
	fmovdl	%icc,	%f14,	%f30
	wr	%g0,	0x16,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
	mulx	%l5,	0x171F,	%l3
	orcc	%i4,	0x05D0,	%o5
	ldub	[%l7 + 0x41],	%g7
	fpadd32s	%f6,	%f5,	%f4
	tge	%xcc,	0x1
	fnot1s	%f19,	%f5
	wr	%g0,	0x10,	%asi
	stda	%i0,	[%l7 + 0x38] %asi
	set	0x60, %o5
	ldda	[%l7 + %o5] 0x23,	%o2
	fandnot2	%f6,	%f2,	%f22
	movrne	%g1,	%g6,	%l1
	smul	%o7,	0x0790,	%l4
	movrgz	%o6,	%o4,	%l2
	and	%l6,	%i3,	%g2
	fbl	%fcc3,	loop_2435
	movrgez	%i1,	%i7,	%o2
	movcc	%xcc,	%i5,	%g5
	fnands	%f7,	%f10,	%f24
loop_2435:
	bn,a	%xcc,	loop_2436
	udivcc	%i2,	0x150A,	%i6
	bl,pt	%icc,	loop_2437
	fcmps	%fcc3,	%f26,	%f11
loop_2436:
	sethi	0x13A9,	%l0
	fnot1	%f24,	%f12
loop_2437:
	edge16n	%o0,	%g3,	%o1
	movre	%l5,	%g4,	%l3
	movre	%o5,	%g7,	%i4
	srlx	%o3,	0x1C,	%i0
	bg,a	%icc,	loop_2438
	fmul8x16al	%f4,	%f3,	%f22
	fmovsneg	%icc,	%f26,	%f22
	movrlez	%g1,	%l1,	%g6
loop_2438:
	umulcc	%l4,	0x1102,	%o7
	fcmps	%fcc1,	%f25,	%f20
	fand	%f22,	%f18,	%f8
	std	%o4,	[%l7 + 0x08]
	movrlez	%o6,	0x317,	%l6
	taddcctv	%i3,	%g2,	%l2
	subccc	%i1,	%i7,	%o2
	orncc	%g5,	0x11EE,	%i2
	subcc	%i5,	%l0,	%i6
	tg	%icc,	0x5
	fnors	%f21,	%f15,	%f21
	andncc	%o0,	%o1,	%l5
	ldsw	[%l7 + 0x10],	%g3
	ldsh	[%l7 + 0x48],	%l3
	ldd	[%l7 + 0x48],	%f22
	srax	%g4,	0x1A,	%g7
	tge	%icc,	0x5
	tsubcc	%i4,	0x1A8A,	%o3
	fmovrsgz	%o5,	%f17,	%f12
	edge8l	%i0,	%g1,	%g6
	tn	%xcc,	0x0
	tne	%icc,	0x6
	ldx	[%l7 + 0x08],	%l4
	fmul8sux16	%f8,	%f2,	%f22
	movrlz	%l1,	0x099,	%o7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tsubcctv	%o4,	0x01FE,	%o6
	movgu	%icc,	%i3,	%g2
	movrne	%l2,	%l6,	%i1
	fmovse	%icc,	%f26,	%f26
	mova	%xcc,	%i7,	%g5
	wr	%g0,	0xe3,	%asi
	stha	%o2,	[%l7 + 0x0C] %asi
	membar	#Sync
	nop
	set	0x12, %l0
	ldsh	[%l7 + %l0],	%i5
	tcc	%xcc,	0x1
	fxnor	%f10,	%f26,	%f26
	fcmpgt32	%f26,	%f14,	%i2
	fmovde	%icc,	%f30,	%f31
	fmovrse	%i6,	%f31,	%f26
	umulcc	%o0,	%o1,	%l5
	movvc	%xcc,	%l0,	%l3
	orncc	%g4,	0x10DA,	%g7
	movrne	%i4,	0x204,	%g3
	sdiv	%o3,	0x1516,	%i0
	ld	[%l7 + 0x34],	%f14
	movrlez	%g1,	%g6,	%o5
	bleu,a	%icc,	loop_2439
	fbl,a	%fcc1,	loop_2440
	edge8l	%l4,	%l1,	%o4
	movg	%icc,	%o7,	%i3
loop_2439:
	and	%g2,	%l2,	%l6
loop_2440:
	movgu	%xcc,	%i1,	%i7
	popc	0x051F,	%o6
	taddcctv	%o2,	%i5,	%g5
	fmovsleu	%icc,	%f30,	%f7
	movcs	%icc,	%i6,	%o0
	set	0x60, %l2
	ldsha	[%l7 + %l2] 0x0c,	%i2
	bvc,a,pn	%xcc,	loop_2441
	fnands	%f5,	%f31,	%f27
	tgu	%icc,	0x3
	fba	%fcc2,	loop_2442
loop_2441:
	tpos	%xcc,	0x3
	wr	%g0,	0x18,	%asi
	swapa	[%l7 + 0x74] %asi,	%o1
loop_2442:
	bn,pn	%xcc,	loop_2443
	fnot2	%f14,	%f6
	be,a	loop_2444
	or	%l5,	0x1832,	%l3
loop_2443:
	nop
	wr	%g0,	0x88,	%asi
	ldsba	[%l7 + 0x27] %asi,	%l0
loop_2444:
	tneg	%xcc,	0x2
	fbl,a	%fcc0,	loop_2445
	prefetch	[%l7 + 0x64],	 0x1
	edge8ln	%g7,	%g4,	%i4
	fmovsle	%xcc,	%f24,	%f2
loop_2445:
	fones	%f16
	nop
	set	0x10, %l1
	stx	%o3,	[%l7 + %l1]
	add	%i0,	0x1C6E,	%g3
	sra	%g6,	0x02,	%g1
	movleu	%icc,	%o5,	%l4
	movvc	%icc,	%l1,	%o4
	addccc	%i3,	0x1A0D,	%g2
	subc	%l2,	%l6,	%o7
	bpos,a,pn	%xcc,	loop_2446
	tsubcc	%i7,	0x0D6B,	%i1
	fxnor	%f4,	%f8,	%f12
	srax	%o2,	%o6,	%i5
loop_2446:
	array32	%i6,	%o0,	%g5
	sethi	0x02A0,	%i2
	fmovsne	%icc,	%f13,	%f18
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16	%o1,	%l3,	%l0
	edge8ln	%g7,	%l5,	%g4
	fpadd16	%f8,	%f14,	%f12
	tgu	%icc,	0x7
	tle	%xcc,	0x5
	edge8ln	%i4,	%o3,	%i0
	and	%g3,	%g6,	%o5
	addcc	%g1,	%l4,	%l1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8	%o4,	%g2,	%l2
	fands	%f4,	%f25,	%f24
	movn	%icc,	%l6,	%o7
	fmovscs	%xcc,	%f27,	%f21
	subcc	%i7,	0x1B99,	%i1
	tle	%icc,	0x4
	addcc	%i3,	0x1085,	%o2
	andn	%o6,	0x091C,	%i6
	be,a	loop_2447
	tsubcctv	%i5,	%g5,	%o0
	fblg	%fcc3,	loop_2448
	xorcc	%i2,	%l3,	%l0
loop_2447:
	fxor	%f20,	%f28,	%f4
	membar	0x3E
loop_2448:
	fsrc1	%f28,	%f12
	srl	%o1,	0x06,	%g7
	fpadd16	%f14,	%f10,	%f22
	array8	%l5,	%i4,	%o3
	tle	%icc,	0x3
	orn	%i0,	0x1395,	%g3
	movre	%g6,	%o5,	%g1
	addcc	%g4,	0x1855,	%l4
	fcmpeq32	%f14,	%f2,	%l1
	sdiv	%g2,	0x1056,	%o4
	movpos	%xcc,	%l2,	%o7
	fornot1s	%f12,	%f15,	%f29
	edge32	%i7,	%i1,	%i3
	fpadd32s	%f26,	%f29,	%f3
	sub	%l6,	%o2,	%o6
	andncc	%i6,	%i5,	%o0
	stx	%g5,	[%l7 + 0x70]
	fmovdvs	%xcc,	%f30,	%f10
	sdivx	%l3,	0x1CC1,	%l0
	set	0x10, %g1
	stda	%i2,	[%l7 + %g1] 0x27
	membar	#Sync
	movge	%xcc,	%g7,	%o1
	set	0x40, %i6
	stda	%f16,	[%l7 + %i6] 0x88
	xnorcc	%i4,	%o3,	%l5
	edge8l	%g3,	%i0,	%g6
	xnorcc	%g1,	%o5,	%l4
	sir	0x1045
	set	0x38, %g2
	stxa	%l1,	[%g0 + %g2] 0x4f
	ldsb	[%l7 + 0x31],	%g4
	bl,a,pt	%xcc,	loop_2449
	std	%f10,	[%l7 + 0x10]
	set	0x10, %l3
	prefetcha	[%l7 + %l3] 0x15,	 0x2
loop_2449:
	xnorcc	%l2,	0x1771,	%o7
	taddcc	%i7,	%g2,	%i3
	movne	%xcc,	%i1,	%l6
	fmovdgu	%xcc,	%f11,	%f1
	movvs	%xcc,	%o6,	%i6
	sub	%o2,	0x0D8E,	%i5
	movrne	%o0,	%l3,	%g5
	bleu	loop_2450
	tsubcc	%l0,	0x1C54,	%i2
	tcs	%xcc,	0x1
	pdist	%f4,	%f6,	%f2
loop_2450:
	nop
	set	0x2C, %o2
	sta	%f25,	[%l7 + %o2] 0x19
	fzeros	%f1
	fmovdg	%xcc,	%f8,	%f3
	mova	%icc,	%o1,	%g7
	fbul	%fcc1,	loop_2451
	or	%o3,	0x0D37,	%l5
	umulcc	%g3,	0x1A81,	%i0
	fandnot2	%f6,	%f4,	%f22
loop_2451:
	fbuge	%fcc0,	loop_2452
	fmovdcs	%icc,	%f26,	%f9
	fcmpeq16	%f16,	%f2,	%i4
	movl	%xcc,	%g1,	%o5
loop_2452:
	mulscc	%l4,	%g6,	%l1
	ldstub	[%l7 + 0x24],	%o4
	fmovrsgz	%l2,	%f0,	%f18
	movleu	%icc,	%o7,	%g4
	fble	%fcc3,	loop_2453
	add	%g2,	%i7,	%i3
	set	0x1A, %o7
	stha	%l6,	[%l7 + %o7] 0x04
loop_2453:
	sll	%i1,	%i6,	%o6
	movl	%xcc,	%i5,	%o2
	fornot2	%f20,	%f16,	%f28
	fmovdne	%xcc,	%f16,	%f31
	movl	%xcc,	%l3,	%g5
	fxnor	%f8,	%f24,	%f30
	array16	%o0,	%i2,	%l0
	movneg	%icc,	%g7,	%o3
	addcc	%o1,	%g3,	%i0
	edge8l	%i4,	%g1,	%o5
	movrgez	%l4,	%l5,	%g6
	array32	%o4,	%l1,	%o7
	movg	%icc,	%l2,	%g4
	addcc	%g2,	%i7,	%i3
	bg	loop_2454
	movrne	%i1,	0x17F,	%i6
	subcc	%o6,	0x0A7A,	%l6
	movrlez	%i5,	%l3,	%g5
loop_2454:
	andcc	%o0,	0x05C8,	%o2
	bn,a	%icc,	loop_2455
	alignaddrl	%l0,	%g7,	%i2
	fandnot1	%f4,	%f18,	%f28
	movg	%icc,	%o1,	%o3
loop_2455:
	movn	%xcc,	%g3,	%i0
	or	%g1,	0x0090,	%o5
	fbule,a	%fcc3,	loop_2456
	movneg	%icc,	%i4,	%l4
	tneg	%icc,	0x1
	or	%g6,	%l5,	%o4
loop_2456:
	taddcctv	%l1,	0x0618,	%l2
	tsubcctv	%o7,	%g4,	%g2
	fnot2s	%f21,	%f9
	subc	%i7,	0x16F2,	%i3
	movg	%xcc,	%i6,	%i1
	taddcc	%l6,	0x169F,	%o6
	orn	%i5,	0x04FC,	%g5
	ble,a,pn	%icc,	loop_2457
	tleu	%xcc,	0x1
	fcmped	%fcc0,	%f20,	%f8
	mulx	%o0,	0x10E2,	%l3
loop_2457:
	fpadd32s	%f31,	%f8,	%f14
	movg	%xcc,	%o2,	%g7
	ldsw	[%l7 + 0x4C],	%l0
	fmovs	%f18,	%f17
	sdivx	%o1,	0x01AC,	%o3
	fmovdpos	%xcc,	%f18,	%f0
	sethi	0x09D0,	%g3
	swap	[%l7 + 0x30],	%i2
	alignaddrl	%i0,	%g1,	%i4
	fmovspos	%icc,	%f8,	%f13
	tpos	%icc,	0x4
	movgu	%xcc,	%l4,	%o5
	tge	%icc,	0x5
	brlez	%l5,	loop_2458
	srlx	%g6,	0x07,	%l1
	bn,a,pn	%xcc,	loop_2459
	array16	%l2,	%o7,	%g4
loop_2458:
	fmovdn	%icc,	%f29,	%f25
	fbue,a	%fcc1,	loop_2460
loop_2459:
	tneg	%xcc,	0x6
	add	%o4,	%g2,	%i3
	movcs	%xcc,	%i7,	%i1
loop_2460:
	edge16ln	%i6,	%o6,	%i5
	edge8l	%l6,	%g5,	%l3
	array8	%o0,	%o2,	%l0
	ldsh	[%l7 + 0x66],	%o1
	srax	%o3,	0x14,	%g3
	bgu,a,pn	%xcc,	loop_2461
	movpos	%xcc,	%g7,	%i2
	fcmpd	%fcc2,	%f0,	%f30
	fmovsge	%xcc,	%f19,	%f12
loop_2461:
	fbuge,a	%fcc1,	loop_2462
	fmovsle	%icc,	%f16,	%f3
	be,a	%icc,	loop_2463
	call	loop_2464
loop_2462:
	smulcc	%i0,	0x10A6,	%i4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2463:
	nop
	set	0x78, %g3
	sta	%f1,	[%l7 + %g3] 0x0c
loop_2464:
	tl	%icc,	0x2
	addccc	%l4,	0x0719,	%o5
	srlx	%g1,	0x1E,	%g6
	edge32ln	%l1,	%l2,	%l5
	umulcc	%o7,	0x1A7D,	%o4
	tle	%icc,	0x3
	tsubcctv	%g2,	%g4,	%i3
	bpos,a	%icc,	loop_2465
	addcc	%i1,	%i7,	%i6
	fmovrse	%o6,	%f28,	%f6
	addc	%i5,	0x0775,	%l6
loop_2465:
	mulx	%l3,	%g5,	%o0
	nop
	setx	loop_2466,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fbue,a	%fcc2,	loop_2467
	lduh	[%l7 + 0x42],	%o2
	fmovrdlz	%l0,	%f0,	%f16
loop_2466:
	fbug,a	%fcc1,	loop_2468
loop_2467:
	edge16n	%o3,	%o1,	%g3
	movne	%icc,	%g7,	%i0
	set	0x20, %o4
	lda	[%l7 + %o4] 0x80,	%f3
loop_2468:
	fmovdne	%xcc,	%f21,	%f3
	addc	%i2,	%l4,	%o5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bne,a,pt	%icc,	loop_2469
	sdiv	%i4,	0x13C4,	%g1
	stbar
	fmovdgu	%xcc,	%f11,	%f12
loop_2469:
	tn	%icc,	0x1
	edge8ln	%l1,	%g6,	%l5
	stx	%o7,	[%l7 + 0x58]
	movrlz	%o4,	0x380,	%l2
	movg	%icc,	%g2,	%i3
	movgu	%xcc,	%g4,	%i7
	xorcc	%i1,	0x1FA1,	%i6
	movre	%o6,	%l6,	%i5
	fexpand	%f10,	%f10
	array16	%l3,	%o0,	%g5
	fandnot1	%f2,	%f14,	%f8
	srlx	%l0,	0x19,	%o3
	xorcc	%o1,	%g3,	%g7
	fmovdvc	%icc,	%f23,	%f21
	sdivx	%o2,	0x1EB6,	%i2
	movgu	%icc,	%l4,	%o5
	fmovse	%xcc,	%f24,	%f7
	fcmpgt32	%f8,	%f8,	%i4
	flush	%l7 + 0x08
	bshuffle	%f2,	%f8,	%f14
	fbu,a	%fcc0,	loop_2470
	subccc	%g1,	%i0,	%g6
	fmovsvs	%icc,	%f5,	%f23
	subcc	%l5,	%l1,	%o4
loop_2470:
	mulx	%o7,	0x1323,	%l2
	wr	%g0,	0x89,	%asi
	swapa	[%l7 + 0x70] %asi,	%g2
	add	%i3,	%g4,	%i1
	fmovdge	%icc,	%f17,	%f29
	movge	%icc,	%i7,	%i6
	edge32n	%l6,	%o6,	%l3
	tge	%icc,	0x1
	fpsub16	%f8,	%f16,	%f18
	bvc	loop_2471
	movre	%i5,	0x16E,	%g5
	fmovrsgz	%l0,	%f13,	%f28
	set	0x10, %g7
	sta	%f1,	[%l7 + %g7] 0x18
loop_2471:
	andcc	%o0,	%o3,	%g3
	fbule,a	%fcc2,	loop_2472
	andcc	%o1,	0x10CD,	%g7
	movpos	%icc,	%i2,	%o2
	brlz	%l4,	loop_2473
loop_2472:
	lduh	[%l7 + 0x0C],	%o5
	ld	[%l7 + 0x48],	%f16
	movrgez	%i4,	%g1,	%i0
loop_2473:
	movvc	%icc,	%l5,	%g6
	srax	%l1,	%o7,	%l2
	set	0x40, %o6
	lduwa	[%l7 + %o6] 0x04,	%o4
	andn	%i3,	0x1099,	%g2
	tgu	%xcc,	0x3
	stbar
	movrlz	%g4,	%i1,	%i7
	wr	%g0,	0x88,	%asi
	ldsba	[%l7 + 0x79] %asi,	%l6
	array8	%i6,	%o6,	%l3
	nop
	setx	loop_2474,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	bvs,a	loop_2475
	fmovdl	%icc,	%f31,	%f19
	sub	%g5,	0x0209,	%i5
loop_2474:
	fmovsvs	%xcc,	%f29,	%f17
loop_2475:
	membar	0x45
	umul	%o0,	%o3,	%g3
	fmovdcs	%icc,	%f6,	%f27
	fnor	%f24,	%f16,	%f20
	or	%l0,	%g7,	%o1
	popc	%i2,	%o2
	movrlz	%l4,	0x0BC,	%i4
	umul	%g1,	0x0AD1,	%i0
	bgu	%icc,	loop_2476
	fmovrdne	%l5,	%f16,	%f22
	set	0x17, %i1
	ldsba	[%l7 + %i1] 0x81,	%g6
loop_2476:
	fbge	%fcc0,	loop_2477
	fcmple32	%f22,	%f4,	%o5
	sdiv	%l1,	0x1CC4,	%l2
	sdivcc	%o4,	0x01F3,	%o7
loop_2477:
	tcc	%xcc,	0x7
	lduh	[%l7 + 0x62],	%g2
	fnot1s	%f30,	%f10
	add	%g4,	0x090F,	%i3
	movvs	%icc,	%i7,	%i1
	sub	%l6,	0x09EA,	%o6
	tge	%icc,	0x0
	movpos	%icc,	%l3,	%g5
	sdivcc	%i5,	0x1840,	%o0
	movcs	%xcc,	%i6,	%g3
	or	%l0,	0x1EFE,	%o3
	fxors	%f10,	%f29,	%f0
	smulcc	%g7,	0x0AC7,	%i2
	tg	%xcc,	0x5
	be,pn	%xcc,	loop_2478
	movvs	%icc,	%o2,	%o1
	srlx	%l4,	%g1,	%i0
	fmul8x16au	%f3,	%f23,	%f24
loop_2478:
	fnors	%f0,	%f30,	%f31
	umulcc	%l5,	%g6,	%o5
	fands	%f21,	%f0,	%f14
	fbo,a	%fcc2,	loop_2479
	fmovrslz	%i4,	%f26,	%f31
	fbul	%fcc0,	loop_2480
	fmovse	%xcc,	%f23,	%f25
loop_2479:
	tcc	%icc,	0x6
	mulx	%l1,	%o4,	%o7
loop_2480:
	ldstub	[%l7 + 0x1C],	%l2
	sra	%g4,	%g2,	%i7
	xnor	%i1,	0x1645,	%i3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xorcc	%l6,	%o6,	%l3
	popc	0x0D91,	%g5
	fbg,a	%fcc1,	loop_2481
	fmovrdne	%i5,	%f8,	%f14
	for	%f20,	%f12,	%f8
	tge	%xcc,	0x6
loop_2481:
	bn	%xcc,	loop_2482
	fsrc2	%f30,	%f8
	fmovsvc	%icc,	%f6,	%f24
	wr	%g0,	0x80,	%asi
	stwa	%i6,	[%l7 + 0x64] %asi
loop_2482:
	fzero	%f24
	fpsub16	%f16,	%f0,	%f10
	fmovd	%f6,	%f30
	bne	%xcc,	loop_2483
	edge8	%o0,	%g3,	%o3
	bneg,a	loop_2484
	smul	%g7,	0x0801,	%l0
loop_2483:
	fmovd	%f20,	%f30
	tleu	%xcc,	0x2
loop_2484:
	ld	[%l7 + 0x0C],	%f2
	array32	%o2,	%o1,	%l4
	edge8	%g1,	%i0,	%l5
	subcc	%i2,	0x1A06,	%g6
	udivcc	%i4,	0x157D,	%l1
	ldsb	[%l7 + 0x6E],	%o5
	wr	%g0,	0x88,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	bneg,a,pt	%xcc,	loop_2485
	tsubcc	%o4,	0x0B02,	%l2
	fbuge	%fcc2,	loop_2486
	brnz,a	%o7,	loop_2487
loop_2485:
	brlez,a	%g2,	loop_2488
	ldub	[%l7 + 0x55],	%g4
loop_2486:
	brgz,a	%i1,	loop_2489
loop_2487:
	movrgez	%i7,	%l6,	%o6
loop_2488:
	fandnot1s	%f20,	%f5,	%f20
	edge32ln	%l3,	%g5,	%i5
loop_2489:
	fbuge,a	%fcc1,	loop_2490
	movge	%icc,	%i3,	%o0
	fbu,a	%fcc1,	loop_2491
	sllx	%g3,	%o3,	%i6
loop_2490:
	fcmpne32	%f26,	%f8,	%l0
	fbug	%fcc2,	loop_2492
loop_2491:
	fexpand	%f30,	%f30
	tvs	%xcc,	0x2
	andcc	%o2,	0x0ADA,	%o1
loop_2492:
	bgu	%icc,	loop_2493
	fmovrsgez	%g7,	%f8,	%f26
	movrgz	%g1,	%l4,	%i0
	fmovrsgz	%l5,	%f26,	%f6
loop_2493:
	movpos	%xcc,	%i2,	%i4
	fmovrdlez	%l1,	%f22,	%f0
	ba	loop_2494
	and	%o5,	%o4,	%g6
	orn	%l2,	%o7,	%g4
	array8	%i1,	%g2,	%i7
loop_2494:
	sir	0x1CE0
	fbn	%fcc1,	loop_2495
	fcmps	%fcc3,	%f26,	%f7
	andncc	%o6,	%l6,	%l3
	edge8ln	%i5,	%g5,	%o0
loop_2495:
	array16	%g3,	%i3,	%i6
	sth	%o3,	[%l7 + 0x2C]
	fabsd	%f8,	%f20
	movg	%icc,	%l0,	%o1
	sra	%g7,	%o2,	%l4
	fxnor	%f4,	%f18,	%f10
	add	%g1,	%l5,	%i0
	srl	%i2,	0x0B,	%i4
	set	0x5E, %i4
	lduha	[%l7 + %i4] 0x89,	%o5
	fexpand	%f0,	%f24
	fabss	%f9,	%f8
	tcc	%icc,	0x0
	tleu	%icc,	0x7
	sll	%l1,	%o4,	%g6
	sethi	0x1C5D,	%o7
	fmovsgu	%icc,	%f5,	%f27
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	taddcc	%l2,	0x0CF8,	%i1
	udiv	%g4,	0x17F7,	%i7
	nop
	set	0x4A, %i5
	ldstub	[%l7 + %i5],	%g2
	andcc	%o6,	0x1C53,	%l6
	fbg	%fcc1,	loop_2496
	movcs	%icc,	%i5,	%g5
	tsubcctv	%l3,	%o0,	%i3
	tsubcc	%g3,	0x10DC,	%i6
loop_2496:
	edge8n	%o3,	%l0,	%g7
	alignaddrl	%o2,	%l4,	%o1
	bne,a	%icc,	loop_2497
	fmovsa	%xcc,	%f2,	%f22
	tg	%icc,	0x1
	fnegd	%f16,	%f0
loop_2497:
	siam	0x7
	array16	%g1,	%l5,	%i0
	brgez,a	%i4,	loop_2498
	array8	%o5,	%i2,	%l1
	fandnot2	%f8,	%f4,	%f24
	fmovdg	%icc,	%f19,	%f9
loop_2498:
	stw	%g6,	[%l7 + 0x5C]
	fone	%f18
	orn	%o7,	0x0030,	%o4
	fmovspos	%icc,	%f1,	%f29
	orncc	%i1,	0x0706,	%g4
	tle	%xcc,	0x7
	sll	%i7,	%g2,	%l2
	fbule	%fcc1,	loop_2499
	edge16ln	%l6,	%i5,	%g5
	fmovrsgez	%l3,	%f21,	%f27
	fmovdle	%icc,	%f12,	%f16
loop_2499:
	fpsub16	%f8,	%f10,	%f16
	add	%l7,	0x58,	%l6
	wr	%g0,	0x10,	%asi
	ldxa	[%l6] %asi,	%o0
	casxa	[%l6] %asi,	%o0,	%i3
	subc	%o6,	%i6,	%o3
	alignaddr	%l0,	%g3,	%g7
	fmovde	%xcc,	%f19,	%f29
	tn	%icc,	0x6
	fnands	%f4,	%f5,	%f1
	tne	%xcc,	0x6
	wr	%g0,	0x88,	%asi
	ldsha	[%l7 + 0x38] %asi,	%l4
	fmovsneg	%xcc,	%f9,	%f29
	fmovrdne	%o1,	%f28,	%f18
	membar	0x41
	movvc	%icc,	%g1,	%l5
	fabsd	%f16,	%f22
	fbo,a	%fcc1,	loop_2500
	movrlz	%i0,	%i4,	%o2
	fbl,a	%fcc1,	loop_2501
	edge16	%i2,	%o5,	%l1
loop_2500:
	movleu	%icc,	%g6,	%o7
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
loop_2501:
	fxor	%f28,	%f16,	%f26
	wr	%g0,	0x0c,	%asi
	lduha	[%l7 + 0x12] %asi,	%i1
loop_2502:
	addcc	%o4,	%g4,	%g2
	membar	0x15
	tn	%xcc,	0x6
	fpadd16	%f20,	%f28,	%f10
	fmul8sux16	%f22,	%f20,	%f30
	fpsub32	%f10,	%f6,	%f14
	te	%icc,	0x1
	prefetch	[%l7 + 0x68],	 0x2
	fmul8x16au	%f23,	%f26,	%f20
	ta	%icc,	0x1
	ldsw	[%l7 + 0x38],	%i7
	movcs	%icc,	%l6,	%l2
	ldsh	[%l7 + 0x30],	%i5
	wr	%g0,	0x04,	%asi
	lda	[%l7 + 0x6C] %asi,	%f13
	sdivx	%g5,	0x1B23,	%o0
	srl	%i3,	%l3,	%o6
	brnz	%i6,	loop_2503
	movl	%xcc,	%o3,	%g3
	movrgez	%l0,	%l4,	%o1
	set	0x6E, %g6
	stha	%g7,	[%l7 + %g6] 0x0c
loop_2503:
	tle	%xcc,	0x1
	edge8ln	%l5,	%i0,	%g1
	edge16l	%o2,	%i4,	%o5
	wr	%g0,	0x81,	%asi
	lduba	[%l7 + 0x15] %asi,	%l1
	movrlz	%i2,	%g6,	%o7
	movg	%icc,	%i1,	%g4
	set	0x66, %l4
	stha	%g2,	[%l7 + %l4] 0xe2
	membar	#Sync
	tgu	%xcc,	0x3
	bn,pn	%icc,	loop_2504
	tvc	%xcc,	0x5
	fcmpgt32	%f14,	%f0,	%o4
	movrgez	%l6,	0x3C8,	%i7
loop_2504:
	taddcctv	%l2,	0x1CC9,	%g5
	bvc,a,pt	%icc,	loop_2505
	movge	%icc,	%o0,	%i5
	std	%i2,	[%l7 + 0x28]
	fbule	%fcc3,	loop_2506
loop_2505:
	movgu	%icc,	%l3,	%i6
	subcc	%o3,	0x0179,	%g3
	movcs	%icc,	%o6,	%l4
loop_2506:
	mulx	%o1,	0x11B8,	%g7
	tgu	%xcc,	0x2
	fands	%f22,	%f0,	%f24
	sethi	0x1E42,	%l5
	bn,a,pt	%icc,	loop_2507
	movrne	%i0,	0x2E4,	%l0
	set	0x7C, %l5
	lda	[%l7 + %l5] 0x10,	%f26
loop_2507:
	fnot2	%f4,	%f10
	edge8ln	%o2,	%i4,	%g1
	movcs	%icc,	%l1,	%i2
	membar	0x17
	smulcc	%g6,	%o7,	%o5
	edge16l	%i1,	%g4,	%g2
	sdivx	%o4,	0x085B,	%i7
	tneg	%xcc,	0x6
	tn	%icc,	0x6
	taddcc	%l6,	0x04BE,	%l2
	udivx	%o0,	0x1FBF,	%g5
	fpack32	%f26,	%f14,	%f16
	fpsub32s	%f2,	%f18,	%f3
	tgu	%xcc,	0x0
	te	%icc,	0x6
	and	%i5,	0x04D2,	%l3
	tl	%xcc,	0x2
	tcc	%xcc,	0x5
	movrlz	%i6,	0x3A6,	%i3
	tneg	%xcc,	0x1
	sdivx	%o3,	0x04AD,	%o6
	nop
	setx	loop_2508,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tvs	%xcc,	0x7
	mova	%xcc,	%l4,	%g3
	ldub	[%l7 + 0x13],	%g7
loop_2508:
	movvc	%xcc,	%o1,	%i0
	brz,a	%l5,	loop_2509
	bpos,a	%xcc,	loop_2510
	subcc	%o2,	%l0,	%i4
	tpos	%icc,	0x4
loop_2509:
	fbul	%fcc0,	loop_2511
loop_2510:
	udivcc	%g1,	0x0B8C,	%i2
	edge32l	%l1,	%o7,	%o5
	tvc	%xcc,	0x1
loop_2511:
	fbne	%fcc3,	loop_2512
	bcs	%xcc,	loop_2513
	fpmerge	%f27,	%f18,	%f24
	sub	%g6,	%i1,	%g4
loop_2512:
	orcc	%o4,	%g2,	%l6
loop_2513:
	umul	%l2,	0x1755,	%i7
	fxors	%f9,	%f28,	%f0
	srlx	%g5,	0x18,	%i5
	srl	%l3,	0x0E,	%o0
	movvs	%icc,	%i6,	%o3
	udivx	%i3,	0x0356,	%l4
	fmovdpos	%xcc,	%f24,	%f31
	fsrc1	%f0,	%f0
	fmovscs	%icc,	%f21,	%f16
	wr	%g0,	0xe2,	%asi
	stba	%g3,	[%l7 + 0x48] %asi
	membar	#Sync
	bvc,a,pt	%icc,	loop_2514
	or	%o6,	%g7,	%o1
	sdivcc	%i0,	0x1A73,	%o2
	fnegs	%f17,	%f4
loop_2514:
	fabsd	%f16,	%f14
	fmovrslz	%l0,	%f23,	%f6
	edge32ln	%l5,	%i4,	%g1
	fpsub32s	%f10,	%f0,	%f6
	brnz	%i2,	loop_2515
	movrlez	%l1,	%o7,	%g6
	xor	%o5,	0x0DD7,	%i1
	orncc	%o4,	0x192E,	%g2
loop_2515:
	nop
	set	0x30, %g4
	stda	%g4,	[%l7 + %g4] 0xeb
	membar	#Sync
	popc	%l6,	%i7
	bvc,pn	%xcc,	loop_2516
	fmovsgu	%icc,	%f28,	%f28
	array32	%g5,	%l2,	%i5
	set	0x5C, %i2
	ldswa	[%l7 + %i2] 0x04,	%l3
loop_2516:
	edge32	%o0,	%o3,	%i6
	wr	%g0,	0x27,	%asi
	ldda	[%l7 + 0x40] %asi,	%i2
	edge16	%g3,	%l4,	%o6
	sra	%g7,	%i0,	%o2
	xnor	%o1,	0x11F0,	%l0
	fbu,a	%fcc3,	loop_2517
	xnorcc	%i4,	%g1,	%i2
	fxnor	%f2,	%f10,	%f14
	ta	%xcc,	0x4
loop_2517:
	movvs	%icc,	%l5,	%l1
	edge32n	%o7,	%g6,	%i1
	nop
	setx	loop_2518,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	edge32l	%o5,	%o4,	%g4
	fmovde	%xcc,	%f8,	%f31
	sll	%l6,	0x07,	%i7
loop_2518:
	or	%g5,	0x0486,	%l2
	umul	%g2,	0x0F5B,	%l3
	mulx	%o0,	0x1EF8,	%o3
	fmovsa	%icc,	%f4,	%f10
	wr	%g0,	0x88,	%asi
	lduwa	[%l7 + 0x30] %asi,	%i6
	ldsw	[%l7 + 0x64],	%i3
	edge8	%i5,	%g3,	%l4
	fandnot1s	%f27,	%f1,	%f27
	tleu	%xcc,	0x3
	wr	%g0,	0xe3,	%asi
	stha	%g7,	[%l7 + 0x08] %asi
	membar	#Sync
	edge16n	%i0,	%o6,	%o2
	movrne	%l0,	0x1DF,	%o1
	fbule	%fcc1,	loop_2519
	or	%g1,	%i4,	%l5
	movgu	%icc,	%i2,	%l1
	set	0x14, %o1
	stwa	%g6,	[%l7 + %o1] 0x88
loop_2519:
	fmovsgu	%icc,	%f10,	%f25
	movrne	%i1,	%o5,	%o4
	brgz	%o7,	loop_2520
	smulcc	%g4,	%i7,	%g5
	fbu,a	%fcc1,	loop_2521
	udivx	%l2,	0x19F8,	%g2
loop_2520:
	te	%xcc,	0x4
	fpsub32	%f12,	%f12,	%f6
loop_2521:
	andncc	%l3,	%o0,	%o3
	sub	%l6,	%i3,	%i6
	xor	%g3,	0x1B80,	%i5
	fpsub32	%f24,	%f8,	%f2
	sethi	0x0246,	%g7
	srl	%i0,	%l4,	%o6
	set	0x28, %i0
	stda	%l0,	[%l7 + %i0] 0x89
	tne	%icc,	0x4
	andcc	%o1,	0x16D6,	%o2
	fexpand	%f29,	%f24
	for	%f6,	%f12,	%f8
	bvs	loop_2522
	ld	[%l7 + 0x40],	%f28
	fxors	%f28,	%f26,	%f11
	fcmple16	%f14,	%f24,	%g1
loop_2522:
	fpack32	%f0,	%f10,	%f14
	xnorcc	%i4,	%i2,	%l1
	movl	%icc,	%l5,	%g6
	array32	%o5,	%o4,	%o7
	set	0x58, %i7
	stxa	%i1,	[%l7 + %i7] 0x27
	membar	#Sync
	edge8	%i7,	%g5,	%l2
	xor	%g4,	0x0D0A,	%g2
	edge32n	%o0,	%l3,	%o3
	fnegd	%f20,	%f26
	smulcc	%l6,	0x17B1,	%i6
	te	%xcc,	0x0
	fmovda	%icc,	%f6,	%f21
	fnand	%f28,	%f18,	%f10
	fzeros	%f13
	srax	%i3,	0x0B,	%g3
	ld	[%l7 + 0x54],	%f28
	fmovrsgz	%g7,	%f16,	%f24
	movge	%xcc,	%i5,	%l4
	fnegs	%f9,	%f4
	tvs	%icc,	0x2
	sdiv	%o6,	0x19E3,	%i0
	addc	%l0,	0x0636,	%o2
	orn	%o1,	0x18A4,	%g1
	taddcctv	%i4,	%l1,	%l5
	mulx	%g6,	%i2,	%o5
	brlz,a	%o4,	loop_2523
	srl	%i1,	0x02,	%i7
	fmul8x16au	%f26,	%f11,	%f12
	movrlez	%g5,	%l2,	%o7
loop_2523:
	nop
	wr	%g0,	0x89,	%asi
	ldstuba	[%l7 + 0x40] %asi,	%g2
	edge32n	%o0,	%g4,	%l3
	fmovsl	%icc,	%f12,	%f11
	tcc	%icc,	0x3
	movcc	%xcc,	%o3,	%l6
	membar	0x5C
	fmovrslz	%i3,	%f24,	%f9
	movvs	%xcc,	%i6,	%g3
	sdivcc	%i5,	0x07BA,	%g7
	fxnor	%f16,	%f10,	%f18
	fblg	%fcc1,	loop_2524
	membar	0x77
	fbge	%fcc1,	loop_2525
	fmovdge	%xcc,	%f8,	%f25
loop_2524:
	movrgez	%l4,	0x19A,	%i0
	fcmple16	%f28,	%f26,	%l0
loop_2525:
	fcmpeq16	%f26,	%f6,	%o6
	movrlz	%o2,	0x2B7,	%g1
	udivcc	%i4,	0x1402,	%l1
	edge8n	%l5,	%g6,	%i2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdvc	%xcc,	%f1,	%f19
	movrne	%o5,	%o1,	%o4
	membar	0x6D
	ba	%icc,	loop_2526
	brlz,a	%i1,	loop_2527
	movleu	%icc,	%g5,	%l2
	fnand	%f12,	%f24,	%f10
loop_2526:
	ba	%icc,	loop_2528
loop_2527:
	movrgez	%o7,	0x3E0,	%g2
	umulcc	%o0,	0x0704,	%g4
	umulcc	%i7,	0x1041,	%l3
loop_2528:
	xorcc	%l6,	%i3,	%i6
	std	%o2,	[%l7 + 0x20]
	mova	%xcc,	%g3,	%i5
	set	0x30, %i3
	stda	%l4,	[%l7 + %i3] 0x80
	swap	[%l7 + 0x20],	%i0
	movre	%g7,	0x30B,	%o6
	fmovrsne	%l0,	%f1,	%f7
	movn	%icc,	%g1,	%i4
	set	0x218, %o3
	ldxa	[%g0 + %o3] 0x52,	%o2
	tge	%icc,	0x5
	movge	%xcc,	%l5,	%l1
	fmul8sux16	%f26,	%f8,	%f12
	nop
	setx	loop_2529,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	subc	%g6,	0x06B3,	%i2
	udiv	%o5,	0x1C49,	%o1
	fmovsvc	%icc,	%f7,	%f3
loop_2529:
	fone	%f0
	movvs	%xcc,	%o4,	%g5
	fcmpne16	%f10,	%f26,	%i1
	edge8ln	%o7,	%g2,	%l2
	fmul8x16	%f2,	%f18,	%f24
	fbo,a	%fcc3,	loop_2530
	xnorcc	%o0,	%i7,	%l3
	fxnor	%f26,	%f20,	%f10
	movcs	%xcc,	%l6,	%g4
loop_2530:
	popc	%i6,	%o3
	bl,pn	%xcc,	loop_2531
	movpos	%xcc,	%i3,	%g3
	tne	%icc,	0x7
	fxnor	%f14,	%f16,	%f12
loop_2531:
	fbule,a	%fcc1,	loop_2532
	sth	%i5,	[%l7 + 0x4C]
	fpadd16s	%f21,	%f14,	%f16
	edge8	%l4,	%i0,	%o6
loop_2532:
	fornot2s	%f28,	%f25,	%f9
	edge8n	%g7,	%g1,	%l0
	movle	%icc,	%i4,	%l5
	edge8n	%o2,	%l1,	%g6
	nop
	set	0x7C, %l6
	prefetch	[%l7 + %l6],	 0x2
	udivx	%o5,	0x0F55,	%o1
	fornot2	%f24,	%f30,	%f26
	std	%o4,	[%l7 + 0x28]
	or	%i2,	%i1,	%o7
	fmul8sux16	%f26,	%f4,	%f2
	xorcc	%g2,	%g5,	%l2
	fpadd32s	%f24,	%f27,	%f5
	fmovrse	%i7,	%f0,	%f13
	edge32n	%o0,	%l6,	%l3
	movrlez	%g4,	%i6,	%i3
	fornot1s	%f8,	%f0,	%f2
	fmovspos	%xcc,	%f9,	%f24
	fmovrsgz	%g3,	%f13,	%f12
	prefetch	[%l7 + 0x48],	 0x3
	movle	%xcc,	%o3,	%l4
	nop
	setx loop_2533, %l0, %l1
	jmpl %l1, %i0
	fmovdvc	%xcc,	%f26,	%f30
	mulx	%o6,	%i5,	%g7
	movl	%xcc,	%l0,	%i4
loop_2533:
	tcs	%xcc,	0x6
	fbe,a	%fcc3,	loop_2534
	tn	%xcc,	0x1
	fbule	%fcc0,	loop_2535
	edge32	%l5,	%g1,	%l1
loop_2534:
	fpack32	%f20,	%f10,	%f26
	movl	%xcc,	%o2,	%o5
loop_2535:
	fandnot2s	%f0,	%f13,	%f28
	edge16l	%o1,	%g6,	%i2
	edge8	%o4,	%o7,	%g2
	subccc	%g5,	0x1960,	%i1
	wr	%g0,	0x81,	%asi
	stha	%i7,	[%l7 + 0x62] %asi
	sll	%o0,	%l2,	%l6
	orn	%g4,	0x004D,	%i6
	umul	%l3,	0x1B5B,	%i3
	tsubcctv	%o3,	0x10B8,	%l4
	sethi	0x0A65,	%i0
	nop
	setx	loop_2536,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	taddcc	%g3,	%o6,	%i5
	fmovrdlez	%g7,	%f26,	%f0
	movvc	%xcc,	%i4,	%l5
loop_2536:
	and	%l0,	0x18A9,	%g1
	bvs,a,pn	%xcc,	loop_2537
	subcc	%o2,	0x0C14,	%o5
	movleu	%icc,	%l1,	%g6
	bgu	%xcc,	loop_2538
loop_2537:
	bcc,a,pt	%icc,	loop_2539
	edge8	%o1,	%o4,	%i2
	tvs	%icc,	0x1
loop_2538:
	umul	%o7,	%g2,	%i1
loop_2539:
	fmovdcc	%icc,	%f16,	%f26
	set	0x10, %g5
	lduba	[%l7 + %g5] 0x15,	%g5
	stx	%i7,	[%l7 + 0x60]
	orncc	%l2,	0x03FB,	%l6
	fbg,a	%fcc1,	loop_2540
	movleu	%icc,	%g4,	%o0
	edge8	%l3,	%i6,	%i3
	edge16	%o3,	%l4,	%i0
loop_2540:
	xnorcc	%g3,	%o6,	%g7
	edge32n	%i5,	%i4,	%l5
	fpsub16s	%f5,	%f7,	%f14
	movge	%xcc,	%g1,	%o2
	ldd	[%l7 + 0x78],	%o4
	movrgez	%l0,	%l1,	%g6
	edge8ln	%o4,	%o1,	%i2
	movle	%xcc,	%o7,	%i1
	srlx	%g2,	%g5,	%l2
	srax	%l6,	0x16,	%g4
	xorcc	%o0,	%i7,	%l3
	swap	[%l7 + 0x6C],	%i3
	xnor	%o3,	%i6,	%i0
	wr	%g0,	0x11,	%asi
	sta	%f2,	[%l7 + 0x0C] %asi
	fzero	%f22
	umul	%l4,	%g3,	%g7
	fbn,a	%fcc0,	loop_2541
	fbug	%fcc0,	loop_2542
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orncc	%o6,	%i4,	%i5
loop_2541:
	fnand	%f4,	%f4,	%f22
loop_2542:
	sdiv	%g1,	0x09DE,	%o2
	movcs	%icc,	%o5,	%l0
	fblg	%fcc3,	loop_2543
	movcc	%icc,	%l5,	%g6
	edge8n	%l1,	%o4,	%o1
	movge	%xcc,	%i2,	%o7
loop_2543:
	fones	%f17
	add	%g2,	%g5,	%i1
	xor	%l2,	0x06C5,	%l6
	ldsb	[%l7 + 0x69],	%g4
	fpsub32s	%f24,	%f9,	%f6
	fmovdl	%icc,	%f9,	%f1
	tpos	%icc,	0x7
	set	0x1C, %o0
	ldswa	[%l7 + %o0] 0x0c,	%i7
	ldub	[%l7 + 0x3A],	%l3
	orncc	%i3,	%o3,	%o0
	fmovdl	%icc,	%f5,	%f10
	srlx	%i0,	%i6,	%g3
	srax	%l4,	%o6,	%g7
	bleu	%icc,	loop_2544
	fpsub16	%f0,	%f8,	%f20
	fmovse	%icc,	%f6,	%f7
	subccc	%i5,	0x1383,	%i4
loop_2544:
	fblg,a	%fcc0,	loop_2545
	tvs	%xcc,	0x5
	edge32n	%g1,	%o5,	%l0
	orncc	%l5,	%o2,	%l1
loop_2545:
	stx	%o4,	[%l7 + 0x28]
	stw	%o1,	[%l7 + 0x74]
	movl	%icc,	%g6,	%i2
	taddcctv	%g2,	%g5,	%i1
	or	%l2,	%o7,	%g4
	wr	%g0,	0x27,	%asi
	stba	%i7,	[%l7 + 0x13] %asi
	membar	#Sync
	srlx	%l3,	0x12,	%l6
	std	%f18,	[%l7 + 0x60]
	tpos	%xcc,	0x7
	mulscc	%i3,	%o3,	%o0
	andncc	%i6,	%g3,	%i0
	be,a,pn	%icc,	loop_2546
	edge8ln	%l4,	%o6,	%i5
	move	%xcc,	%g7,	%i4
	fmovrslz	%o5,	%f23,	%f14
loop_2546:
	sdivx	%g1,	0x0B78,	%l0
	bshuffle	%f6,	%f30,	%f12
	udivx	%l5,	0x1D9C,	%o2
	tle	%icc,	0x3
	tle	%icc,	0x2
	bpos,a,pt	%icc,	loop_2547
	brgez,a	%o4,	loop_2548
	movge	%icc,	%l1,	%g6
	tcs	%icc,	0x0
loop_2547:
	sub	%o1,	0x0306,	%i2
loop_2548:
	taddcctv	%g5,	0x1AC2,	%g2
	fmovsl	%icc,	%f9,	%f2
	fmovdcs	%xcc,	%f25,	%f1
	sllx	%l2,	0x12,	%i1
	edge8	%o7,	%i7,	%l3
	fmovsl	%xcc,	%f7,	%f5
	fbue,a	%fcc1,	loop_2549
	edge8	%l6,	%g4,	%i3
	edge8ln	%o3,	%i6,	%o0
	fba,a	%fcc3,	loop_2550
loop_2549:
	movrgz	%g3,	0x215,	%i0
	call	loop_2551
	tgu	%icc,	0x1
loop_2550:
	nop
	set	0x73, %o5
	ldsba	[%l7 + %o5] 0x14,	%o6
loop_2551:
	srlx	%i5,	0x06,	%g7
	ldsw	[%l7 + 0x64],	%i4
	brgz	%l4,	loop_2552
	membar	0x1F
	movgu	%icc,	%o5,	%g1
	srl	%l0,	%o2,	%l5
loop_2552:
	fpadd32s	%f28,	%f0,	%f6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sllx	%o4,	0x1D,	%l1
	ldd	[%l7 + 0x58],	%f0
	bl,a	%icc,	loop_2553
	taddcctv	%o1,	%i2,	%g5
	wr	%g0,	0x80,	%asi
	stha	%g2,	[%l7 + 0x0E] %asi
loop_2553:
	bpos,pn	%icc,	loop_2554
	fnand	%f24,	%f20,	%f16
	orn	%g6,	0x07C8,	%l2
	array32	%i1,	%i7,	%l3
loop_2554:
	udiv	%o7,	0x0B9B,	%g4
	movvc	%xcc,	%i3,	%l6
	fnot2s	%f2,	%f28
	fsrc2	%f16,	%f18
	fpadd32s	%f23,	%f29,	%f16
	tne	%icc,	0x4
	ldsb	[%l7 + 0x78],	%o3
	wr	%g0,	0x89,	%asi
	lduba	[%l7 + 0x41] %asi,	%i6
	edge8l	%g3,	%o0,	%i0
	orn	%i5,	0x0466,	%g7
	movle	%icc,	%i4,	%l4
	tleu	%icc,	0x1
	brgz,a	%o5,	loop_2555
	sra	%o6,	%l0,	%o2
	udivcc	%g1,	0x007E,	%l5
	fmovdge	%icc,	%f23,	%f30
loop_2555:
	addc	%o4,	0x0F93,	%o1
	edge32l	%i2,	%l1,	%g2
	movgu	%icc,	%g6,	%l2
	or	%g5,	%i1,	%l3
	movrlez	%o7,	%g4,	%i3
	fnot2	%f22,	%f30
	fpsub32s	%f1,	%f22,	%f1
	fbne,a	%fcc3,	loop_2556
	fbug,a	%fcc0,	loop_2557
	fpsub16s	%f16,	%f5,	%f2
	fmovsne	%xcc,	%f31,	%f23
loop_2556:
	fnand	%f24,	%f24,	%f18
loop_2557:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	add	%l7,	0x60,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] %asi,	%i7,	%l6
	bneg,a	loop_2558
	ldd	[%l7 + 0x60],	%i6
	smulcc	%g3,	%o0,	%i0
	movre	%i5,	0x191,	%o3
loop_2558:
	fnot2	%f30,	%f20
	tcc	%xcc,	0x4
	edge16ln	%g7,	%i4,	%o5
	nop
	setx	loop_2559,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	ld	[%l7 + 0x58],	%f10
	add	%l7,	0x60,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] %asi,	%l4,	%l0
loop_2559:
	movvs	%icc,	%o2,	%g1
	fbule,a	%fcc3,	loop_2560
	fxnor	%f14,	%f8,	%f28
	edge16	%l5,	%o6,	%o1
	fnot2	%f2,	%f8
loop_2560:
	ldsb	[%l7 + 0x7E],	%o4
	addcc	%l1,	0x0B5B,	%i2
	srlx	%g2,	%l2,	%g5
	bge,a	loop_2561
	bgu,pt	%xcc,	loop_2562
	taddcctv	%i1,	%g6,	%o7
	ba,a,pn	%xcc,	loop_2563
loop_2561:
	xnorcc	%l3,	0x1042,	%i3
loop_2562:
	fand	%f12,	%f28,	%f20
	movrlez	%g4,	0x0E0,	%i7
loop_2563:
	movneg	%xcc,	%i6,	%l6
	sth	%g3,	[%l7 + 0x24]
	fbn	%fcc3,	loop_2564
	nop
	set	0x30, %l2
	ldd	[%l7 + %l2],	%o0
	move	%icc,	%i0,	%o3
	smulcc	%i5,	%g7,	%i4
loop_2564:
	bn	loop_2565
	xor	%o5,	%l4,	%l0
	siam	0x1
	tvs	%xcc,	0x0
loop_2565:
	edge8	%o2,	%g1,	%o6
	brlez,a	%l5,	loop_2566
	flush	%l7 + 0x50
	wr	%g0,	0x88,	%asi
	prefetcha	[%l7 + 0x10] %asi,	 0x1
loop_2566:
	nop
	setx	loop_2567,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	orncc	%o4,	%l1,	%g2
	edge8l	%l2,	%i2,	%g5
	andncc	%g6,	%i1,	%l3
loop_2567:
	fpsub32	%f14,	%f26,	%f18
	tle	%icc,	0x7
	subc	%o7,	0x11C4,	%g4
	or	%i3,	%i6,	%l6
	flush	%l7 + 0x40
	bn	%icc,	loop_2568
	fnot2s	%f7,	%f29
	fbl,a	%fcc2,	loop_2569
	fandnot1s	%f13,	%f29,	%f7
loop_2568:
	smulcc	%g3,	%i7,	%i0
	and	%o3,	%o0,	%g7
loop_2569:
	fbo,a	%fcc3,	loop_2570
	tneg	%xcc,	0x0
	sllx	%i4,	0x14,	%o5
	fand	%f28,	%f6,	%f24
loop_2570:
	xnorcc	%i5,	%l4,	%l0
	smulcc	%o2,	%o6,	%l5
	add	%l7,	0x20,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%o1,	%g1
	add	%o4,	%g2,	%l1
	tvc	%xcc,	0x1
	ldub	[%l7 + 0x35],	%l2
	orncc	%g5,	0x16F5,	%i2
	fsrc1s	%f1,	%f28
	fmovsn	%icc,	%f27,	%f16
	bshuffle	%f20,	%f6,	%f24
	fandnot2	%f18,	%f0,	%f16
	tneg	%xcc,	0x4
	fsrc2s	%f2,	%f30
	movne	%icc,	%i1,	%g6
	andn	%o7,	%g4,	%i3
	movvs	%xcc,	%l3,	%l6
	addccc	%g3,	%i7,	%i0
	std	%i6,	[%l7 + 0x30]
	edge8	%o3,	%g7,	%i4
	edge8ln	%o5,	%o0,	%i5
	srax	%l0,	%l4,	%o6
	fands	%f7,	%f27,	%f16
	fornot1	%f10,	%f10,	%f28
	fands	%f21,	%f9,	%f24
	array8	%o2,	%l5,	%o1
	srl	%o4,	0x1A,	%g2
	movn	%xcc,	%g1,	%l2
	set	0x28, %l1
	ldsba	[%l7 + %l1] 0x11,	%l1
	fbu	%fcc3,	loop_2571
	std	%i2,	[%l7 + 0x20]
	fmovsn	%xcc,	%f13,	%f7
	fmovdcs	%xcc,	%f4,	%f23
loop_2571:
	ldstub	[%l7 + 0x45],	%g5
	sethi	0x1AE3,	%g6
	brlez,a	%i1,	loop_2572
	fbge	%fcc0,	loop_2573
	fbue	%fcc3,	loop_2574
	fxnors	%f12,	%f12,	%f26
loop_2572:
	nop
	set	0x3C, %g1
	lduwa	[%l7 + %g1] 0x81,	%g4
loop_2573:
	xorcc	%o7,	%i3,	%l6
loop_2574:
	add	%g3,	0x1AD5,	%l3
	andncc	%i7,	%i0,	%o3
	stb	%i6,	[%l7 + 0x6B]
	fands	%f15,	%f15,	%f16
	wr	%g0,	0x0c,	%asi
	lda	[%l7 + 0x6C] %asi,	%f1
	fbge	%fcc1,	loop_2575
	orncc	%g7,	%i4,	%o0
	fpsub32	%f12,	%f22,	%f8
	fcmpne32	%f14,	%f16,	%o5
loop_2575:
	fbo	%fcc0,	loop_2576
	sll	%i5,	%l4,	%l0
	brlz	%o2,	loop_2577
	fzero	%f0
loop_2576:
	tg	%icc,	0x7
	ble,pn	%icc,	loop_2578
loop_2577:
	ba,pn	%xcc,	loop_2579
	movleu	%icc,	%l5,	%o6
	fones	%f7
loop_2578:
	edge32l	%o1,	%g2,	%o4
loop_2579:
	movleu	%xcc,	%l2,	%g1
	movne	%icc,	%l1,	%i2
	fbl	%fcc1,	loop_2580
	fmovd	%f20,	%f4
	bg	%xcc,	loop_2581
	subc	%g6,	%i1,	%g4
loop_2580:
	movpos	%xcc,	%g5,	%i3
	fzero	%f20
loop_2581:
	tne	%xcc,	0x1
	tsubcctv	%o7,	0x0730,	%l6
	movrlez	%l3,	%g3,	%i7
	udivcc	%i0,	0x12A2,	%i6
	mova	%icc,	%o3,	%i4
	brnz	%g7,	loop_2582
	xnorcc	%o0,	0x0710,	%i5
	fxors	%f2,	%f26,	%f6
	xnorcc	%l4,	%l0,	%o2
loop_2582:
	fmovrdgez	%l5,	%f6,	%f24
	xor	%o5,	%o6,	%o1
	fbo	%fcc1,	loop_2583
	call	loop_2584
	brgz	%g2,	loop_2585
	te	%xcc,	0x6
loop_2583:
	mulx	%o4,	%g1,	%l2
loop_2584:
	tne	%xcc,	0x5
loop_2585:
	tle	%icc,	0x4
	movne	%icc,	%i2,	%g6
	swap	[%l7 + 0x60],	%i1
	stb	%l1,	[%l7 + 0x33]
	ta	%icc,	0x7
	andn	%g4,	%g5,	%o7
	fmovscc	%icc,	%f29,	%f21
	brgez	%i3,	loop_2586
	movvs	%xcc,	%l3,	%l6
	tge	%xcc,	0x2
	ldstub	[%l7 + 0x1B],	%g3
loop_2586:
	edge16n	%i7,	%i6,	%i0
	fbe	%fcc1,	loop_2587
	edge32ln	%o3,	%i4,	%g7
	movne	%icc,	%i5,	%o0
	wr	%g0,	0x19,	%asi
	lduba	[%l7 + 0x1E] %asi,	%l4
loop_2587:
	tgu	%xcc,	0x3
	fmovdle	%icc,	%f22,	%f10
	subc	%o2,	0x1784,	%l0
	edge32	%o5,	%l5,	%o1
	movleu	%icc,	%g2,	%o6
	brgez,a	%g1,	loop_2588
	array32	%l2,	%i2,	%g6
	ba	loop_2589
	sdivx	%o4,	0x114E,	%l1
loop_2588:
	add	%g4,	0x135B,	%g5
	nop
	setx loop_2590, %l0, %l1
	jmpl %l1, %o7
loop_2589:
	srl	%i3,	0x06,	%i1
	fsrc2	%f10,	%f24
	orn	%l3,	0x0D4E,	%g3
loop_2590:
	addccc	%i7,	0x0D6F,	%i6
	array32	%i0,	%l6,	%o3
	addc	%i4,	%g7,	%i5
	mulscc	%l4,	%o2,	%l0
	std	%f2,	[%l7 + 0x30]
	mulx	%o5,	0x1D5A,	%l5
	edge8n	%o1,	%o0,	%g2
	movcc	%icc,	%o6,	%g1
	movvs	%icc,	%l2,	%i2
	movcs	%icc,	%o4,	%g6
	fpadd32	%f14,	%f22,	%f30
	tvs	%icc,	0x6
	addccc	%g4,	0x1DA1,	%g5
	popc	0x1089,	%o7
	brgez,a	%l1,	loop_2591
	fbu,a	%fcc3,	loop_2592
	fmuld8ulx16	%f16,	%f1,	%f6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2591:
	move	%icc,	%i1,	%l3
loop_2592:
	tcs	%icc,	0x6
	tsubcc	%g3,	0x1D60,	%i3
	sll	%i6,	0x19,	%i0
	orn	%l6,	0x1A92,	%o3
	movrgz	%i7,	%i4,	%g7
	call	loop_2593
	fcmpgt16	%f30,	%f22,	%l4
	fmovsa	%icc,	%f29,	%f1
	bge,a,pt	%xcc,	loop_2594
loop_2593:
	tgu	%xcc,	0x7
	edge8l	%i5,	%l0,	%o2
	fmovdleu	%xcc,	%f19,	%f28
loop_2594:
	subccc	%o5,	0x0F91,	%l5
	tsubcctv	%o1,	0x0616,	%g2
	movneg	%icc,	%o0,	%o6
	fsrc2s	%f8,	%f20
	fmovdcs	%xcc,	%f11,	%f20
	brlez	%g1,	loop_2595
	edge16ln	%i2,	%l2,	%o4
	brlz,a	%g6,	loop_2596
	andn	%g5,	%g4,	%l1
loop_2595:
	umul	%i1,	%l3,	%g3
	srl	%i3,	%o7,	%i0
loop_2596:
	or	%l6,	0x0DE8,	%i6
	tgu	%xcc,	0x4
	array16	%o3,	%i7,	%g7
	movrlz	%i4,	0x155,	%l4
	orn	%l0,	0x0672,	%i5
	sll	%o5,	0x0B,	%l5
	tg	%xcc,	0x3
	sll	%o2,	0x0D,	%o1
	fors	%f8,	%f29,	%f30
	edge32l	%g2,	%o0,	%o6
	edge8n	%i2,	%g1,	%o4
	popc	0x1B73,	%l2
	bn,a	%icc,	loop_2597
	fmovs	%f6,	%f0
	set	0x52, %l0
	stha	%g5,	[%l7 + %l0] 0x27
	membar	#Sync
loop_2597:
	movge	%xcc,	%g4,	%l1
	fornot1	%f16,	%f12,	%f20
	bcs,pn	%xcc,	loop_2598
	fcmps	%fcc3,	%f8,	%f6
	edge16	%i1,	%g6,	%g3
	fmovsvc	%xcc,	%f15,	%f23
loop_2598:
	fandnot1	%f4,	%f16,	%f6
	wr	%g0,	0xe2,	%asi
	stda	%i2,	[%l7 + 0x78] %asi
	membar	#Sync
	bg,a	loop_2599
	fmovrdlz	%o7,	%f4,	%f10
	udivx	%l3,	0x1ACE,	%i0
	fmovrdlz	%l6,	%f14,	%f30
loop_2599:
	orncc	%o3,	%i6,	%g7
	move	%icc,	%i7,	%l4
	bneg,a	loop_2600
	tcc	%xcc,	0x7
	std	%f8,	[%l7 + 0x60]
	udivcc	%i4,	0x0BB6,	%l0
loop_2600:
	stbar
	addc	%i5,	0x14B6,	%o5
	addcc	%l5,	0x1D3C,	%o2
	tl	%xcc,	0x1
	membar	0x46
	xnor	%o1,	0x0C84,	%o0
	orncc	%o6,	0x0A99,	%i2
	wr	%g0,	0x19,	%asi
	ldswa	[%l7 + 0x2C] %asi,	%g2
	fmovsg	%xcc,	%f10,	%f24
	membar	0x58
	fcmple16	%f20,	%f2,	%o4
	brgez	%g1,	loop_2601
	fmovrdlz	%l2,	%f6,	%f12
	movg	%icc,	%g4,	%g5
	movle	%xcc,	%l1,	%i1
loop_2601:
	sdiv	%g3,	0x0907,	%g6
	movge	%icc,	%o7,	%l3
	movgu	%icc,	%i3,	%i0
	brlez	%o3,	loop_2602
	andcc	%i6,	%g7,	%l6
	fxors	%f20,	%f4,	%f5
	addcc	%l4,	0x1F3A,	%i4
loop_2602:
	fmovsne	%icc,	%f30,	%f14
	sir	0x059B
	nop
	setx loop_2603, %l0, %l1
	jmpl %l1, %l0
	ta	%xcc,	0x5
	tcs	%icc,	0x0
	movl	%xcc,	%i5,	%i7
loop_2603:
	stw	%l5,	[%l7 + 0x38]
	sir	0x0412
	edge32l	%o2,	%o5,	%o1
	wr	%g0,	0x18,	%asi
	swapa	[%l7 + 0x58] %asi,	%o0
	fcmpne16	%f8,	%f20,	%i2
	fbug,a	%fcc0,	loop_2604
	tgu	%xcc,	0x2
	movg	%xcc,	%o6,	%g2
	movvs	%icc,	%g1,	%l2
loop_2604:
	swap	[%l7 + 0x4C],	%o4
	mulx	%g5,	0x05C2,	%l1
	set	0x24, %i6
	lduwa	[%l7 + %i6] 0x88,	%i1
	orn	%g4,	0x1A0B,	%g3
	tvc	%icc,	0x4
	srax	%g6,	0x13,	%o7
	bneg,pn	%icc,	loop_2605
	fnegs	%f11,	%f19
	bcc,pn	%icc,	loop_2606
	bl,a,pt	%xcc,	loop_2607
loop_2605:
	fnor	%f10,	%f12,	%f6
	fmovdcs	%icc,	%f30,	%f11
loop_2606:
	ta	%xcc,	0x4
loop_2607:
	swap	[%l7 + 0x20],	%l3
	bshuffle	%f4,	%f18,	%f12
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmuld8sux16	%f3,	%f9,	%f30
	taddcctv	%i3,	0x04A0,	%i0
	edge8n	%o3,	%i6,	%l6
	fnor	%f20,	%f16,	%f22
	bpos,pn	%icc,	loop_2608
	movle	%icc,	%l4,	%g7
	movrlz	%l0,	0x1AE,	%i5
	or	%i4,	%l5,	%i7
loop_2608:
	sdiv	%o2,	0x14BD,	%o1
	brgez	%o5,	loop_2609
	fcmpeq32	%f26,	%f0,	%o0
	fmovsleu	%icc,	%f4,	%f22
	subcc	%o6,	%i2,	%g2
loop_2609:
	udiv	%g1,	0x15A2,	%o4
	fpack32	%f22,	%f0,	%f4
	bcs,a	loop_2610
	orn	%l2,	%g5,	%i1
	fcmpne16	%f0,	%f10,	%g4
	add	%l7,	0x20,	%l6
	wr	%g0,	0x0c,	%asi
	casa	[%l6] %asi,	%g3,	%l1
loop_2610:
	array8	%g6,	%l3,	%o7
	movrlez	%i3,	%i0,	%i6
	nop
	setx	loop_2611,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fbue	%fcc1,	loop_2612
	tn	%xcc,	0x3
	nop
	setx	loop_2613,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_2611:
	fabss	%f9,	%f4
loop_2612:
	fzeros	%f23
	tg	%icc,	0x5
loop_2613:
	xnorcc	%l6,	0x10AC,	%l4
	tleu	%icc,	0x6
	fmovsa	%xcc,	%f25,	%f11
	stb	%g7,	[%l7 + 0x4A]
	tn	%icc,	0x1
	array16	%o3,	%l0,	%i5
	alignaddrl	%l5,	%i4,	%o2
	fmul8x16al	%f15,	%f2,	%f18
	sllx	%o1,	0x1E,	%i7
	mova	%xcc,	%o5,	%o0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdge	%icc,	%f31,	%f18
	andcc	%i2,	%o6,	%g1
	addccc	%g2,	0x0222,	%o4
	edge16	%g5,	%l2,	%g4
	bg	%icc,	loop_2614
	movvc	%xcc,	%g3,	%i1
	edge8ln	%l1,	%l3,	%g6
	fmovrse	%i3,	%f3,	%f19
loop_2614:
	nop
	add	%l7,	0x78,	%l6
	wr	%g0,	0x04,	%asi
	ldxa	[%l6] %asi,	%i0
	casxa	[%l6] 0x04,	%i0,	%i6
	fpack32	%f30,	%f30,	%f22
	subc	%o7,	0x0BF0,	%l6
	bg,pn	%xcc,	loop_2615
	fmovrsgz	%l4,	%f15,	%f22
	movne	%icc,	%g7,	%l0
	fmovrslz	%o3,	%f17,	%f5
loop_2615:
	addcc	%l5,	%i4,	%i5
	ba,pn	%xcc,	loop_2616
	edge32n	%o1,	%i7,	%o5
	fble	%fcc3,	loop_2617
	fble,a	%fcc1,	loop_2618
loop_2616:
	movg	%icc,	%o0,	%o2
	array16	%o6,	%i2,	%g2
loop_2617:
	prefetch	[%l7 + 0x34],	 0x2
loop_2618:
	fbn,a	%fcc3,	loop_2619
	tl	%icc,	0x5
	movrgez	%o4,	0x39A,	%g1
	movne	%icc,	%l2,	%g5
loop_2619:
	subccc	%g3,	%i1,	%l1
	brgz	%l3,	loop_2620
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbl,a	%fcc1,	loop_2621
	movgu	%xcc,	%g4,	%i3
loop_2620:
	be,pt	%icc,	loop_2622
	edge16ln	%i0,	%g6,	%o7
loop_2621:
	sdiv	%i6,	0x173A,	%l4
	sll	%l6,	%l0,	%g7
loop_2622:
	st	%f20,	[%l7 + 0x2C]
	fbne	%fcc2,	loop_2623
	fmovsa	%xcc,	%f28,	%f30
	brgz	%l5,	loop_2624
	fba	%fcc0,	loop_2625
loop_2623:
	fcmpes	%fcc1,	%f15,	%f6
	mulx	%i4,	0x0449,	%i5
loop_2624:
	tvs	%icc,	0x7
loop_2625:
	fblg	%fcc0,	loop_2626
	tneg	%icc,	0x1
	set	0x7C, %l3
	ldswa	[%l7 + %l3] 0x88,	%o3
loop_2626:
	tl	%xcc,	0x5
	edge32ln	%o1,	%i7,	%o0
	bn,a	%icc,	loop_2627
	tneg	%icc,	0x5
	movvs	%icc,	%o5,	%o6
	edge8n	%o2,	%g2,	%i2
loop_2627:
	andcc	%o4,	%l2,	%g5
	ldsw	[%l7 + 0x68],	%g3
	movle	%icc,	%i1,	%l1
	edge32	%g1,	%l3,	%i3
	set	0x78, %o2
	stda	%i0,	[%l7 + %o2] 0x19
	fpmerge	%f23,	%f17,	%f28
	fmovsn	%xcc,	%f13,	%f14
	fpadd32s	%f19,	%f6,	%f30
	udivx	%g4,	0x06DE,	%o7
	be,a	%xcc,	loop_2628
	tvs	%xcc,	0x0
	tneg	%icc,	0x0
	movl	%icc,	%g6,	%i6
loop_2628:
	fmovdvc	%icc,	%f9,	%f24
	fbl,a	%fcc3,	loop_2629
	addccc	%l4,	0x1C67,	%l0
	fpmerge	%f20,	%f31,	%f28
	pdist	%f14,	%f10,	%f6
loop_2629:
	te	%xcc,	0x0
	fbg,a	%fcc3,	loop_2630
	fmovdgu	%xcc,	%f18,	%f11
	edge8	%g7,	%l6,	%i4
	bneg	%icc,	loop_2631
loop_2630:
	fors	%f10,	%f20,	%f0
	fornot2	%f20,	%f2,	%f16
	edge32	%i5,	%o3,	%o1
loop_2631:
	nop
	add	%l7,	0x38,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%i7
	casxa	[%l6] 0x89,	%i7,	%o0
	movgu	%xcc,	%l5,	%o5
	xnor	%o6,	%o2,	%i2
	edge8	%g2,	%o4,	%g5
	movle	%xcc,	%g3,	%l2
	fabsd	%f6,	%f24
	udiv	%l1,	0x0DBF,	%g1
	tcc	%xcc,	0x1
	movn	%icc,	%l3,	%i3
	ta	%xcc,	0x1
	set	0x70, %g2
	stda	%i0,	[%l7 + %g2] 0x0c
	nop
	setx	loop_2632,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tneg	%xcc,	0x3
	set	0x20, %g3
	ldda	[%l7 + %g3] 0x89,	%g4
loop_2632:
	nop
	wr	%g0,	0x81,	%asi
	lduba	[%l7 + 0x27] %asi,	%o7
	orn	%i1,	%g6,	%l4
	tg	%xcc,	0x1
	sdivcc	%i6,	0x083E,	%g7
	fcmpeq16	%f10,	%f18,	%l0
	fabsd	%f10,	%f22
	movrgz	%l6,	0x3B8,	%i4
	udivx	%o3,	0x167E,	%o1
	addccc	%i7,	0x138E,	%o0
	fmovd	%f28,	%f4
	wr	%g0,	0x88,	%asi
	ldsha	[%l7 + 0x78] %asi,	%l5
	subc	%o5,	%o6,	%i5
	umul	%i2,	%o2,	%g2
	brgez	%g5,	loop_2633
	movrne	%o4,	%g3,	%l1
	fpack32	%f0,	%f0,	%f4
	tsubcc	%l2,	%g1,	%l3
loop_2633:
	ldub	[%l7 + 0x6C],	%i3
	sra	%g4,	0x0C,	%o7
	subccc	%i0,	0x14A0,	%g6
	brgez,a	%l4,	loop_2634
	brnz	%i1,	loop_2635
	edge32l	%i6,	%l0,	%l6
	tneg	%xcc,	0x2
loop_2634:
	nop
	wr	%g0,	0x89,	%asi
	stha	%g7,	[%l7 + 0x40] %asi
loop_2635:
	brgez	%o3,	loop_2636
	bneg,a	%xcc,	loop_2637
	xorcc	%o1,	%i7,	%i4
	fxors	%f14,	%f22,	%f3
loop_2636:
	ldub	[%l7 + 0x61],	%l5
loop_2637:
	nop
	set	0x10, %o7
	stxa	%o0,	[%g0 + %o7] 0x20
	set	0x3F, %g7
	lduba	[%l7 + %g7] 0x80,	%o5
	wr	%g0,	0x18,	%asi
	prefetcha	[%l7 + 0x68] %asi,	 0x2
	nop
	setx	loop_2638,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	addccc	%i5,	%o2,	%i2
	fmovsle	%icc,	%f10,	%f17
	set	0x5C, %o4
	sta	%f4,	[%l7 + %o4] 0x19
loop_2638:
	nop
	wr	%g0,	0x81,	%asi
	stda	%g2,	[%l7 + 0x18] %asi
	move	%xcc,	%o4,	%g3
	tleu	%xcc,	0x0
	bg,a	loop_2639
	tle	%xcc,	0x0
	fbg	%fcc0,	loop_2640
	tne	%icc,	0x2
loop_2639:
	fbo	%fcc1,	loop_2641
	movleu	%icc,	%g5,	%l1
loop_2640:
	add	%l2,	0x0637,	%l3
	subcc	%g1,	%g4,	%i3
loop_2641:
	sdiv	%i0,	0x0E52,	%g6
	alignaddrl	%o7,	%l4,	%i1
	movrlez	%l0,	0x39F,	%i6
	sra	%l6,	%g7,	%o1
	srl	%i7,	%o3,	%i4
	edge8	%l5,	%o0,	%o5
	wr	%g0,	0x18,	%asi
	lda	[%l7 + 0x40] %asi,	%f15
	set	0x74, %o6
	lduha	[%l7 + %o6] 0x15,	%i5
	tpos	%icc,	0x3
	sub	%o2,	%i2,	%o6
	tvc	%icc,	0x4
	srl	%o4,	%g2,	%g5
	nop
	set	0x78, %i1
	ldx	[%l7 + %i1],	%l1
	fzeros	%f7
	movneg	%xcc,	%g3,	%l2
	fpadd32s	%f20,	%f7,	%f18
	mulscc	%l3,	%g1,	%g4
	ldsh	[%l7 + 0x0E],	%i3
	nop
	setx	loop_2642,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	ldd	[%l7 + 0x40],	%i0
	sub	%o7,	%g6,	%l4
	taddcctv	%l0,	0x1485,	%i1
loop_2642:
	smulcc	%l6,	%i6,	%g7
	fors	%f22,	%f28,	%f8
	bcc	%icc,	loop_2643
	sdiv	%o1,	0x18F5,	%o3
	movrne	%i4,	0x127,	%i7
	set	0x53, %i4
	ldsba	[%l7 + %i4] 0x88,	%l5
loop_2643:
	nop
	set	0x20, %g6
	sta	%f27,	[%l7 + %g6] 0x0c
	fandnot2	%f2,	%f24,	%f20
	tcc	%xcc,	0x6
	fands	%f3,	%f29,	%f6
	movrlez	%o5,	%i5,	%o2
	sdiv	%i2,	0x0E0E,	%o0
	movrgez	%o4,	0x29B,	%o6
	udivx	%g2,	0x07A0,	%l1
	fbul	%fcc2,	loop_2644
	movn	%icc,	%g5,	%g3
	sdiv	%l3,	0x0A72,	%l2
	sdiv	%g1,	0x0AAE,	%g4
loop_2644:
	udivcc	%i0,	0x0E3C,	%i3
	stbar
	fmovsne	%icc,	%f2,	%f24
	fzero	%f22
	fba,a	%fcc2,	loop_2645
	udiv	%g6,	0x149E,	%o7
	fmovdne	%icc,	%f14,	%f4
	fnors	%f1,	%f1,	%f16
loop_2645:
	edge32n	%l4,	%i1,	%l0
	edge8l	%l6,	%i6,	%g7
	tneg	%xcc,	0x3
	set	0x64, %i5
	lduwa	[%l7 + %i5] 0x19,	%o1
	smulcc	%o3,	0x1DBA,	%i4
	ta	%xcc,	0x0
	fmovsa	%xcc,	%f16,	%f24
	andcc	%i7,	%l5,	%i5
	wr	%g0,	0x04,	%asi
	ldxa	[%l7 + 0x08] %asi,	%o2
	fornot1	%f24,	%f6,	%f10
	prefetch	[%l7 + 0x18],	 0x3
	std	%f10,	[%l7 + 0x08]
	brgz,a	%o5,	loop_2646
	srl	%i2,	%o4,	%o0
	set	0x50, %l5
	ldswa	[%l7 + %l5] 0x19,	%o6
loop_2646:
	fpadd32	%f14,	%f30,	%f26
	andn	%l1,	0x04CF,	%g5
	set	0x21, %l4
	stba	%g2,	[%l7 + %l4] 0x23
	membar	#Sync
	siam	0x1
	subcc	%g3,	%l2,	%l3
	addccc	%g4,	0x164E,	%g1
	taddcc	%i3,	0x069C,	%i0
	brgez	%o7,	loop_2647
	ba,pn	%xcc,	loop_2648
	sub	%l4,	0x05F2,	%i1
	xnor	%l0,	0x073D,	%g6
loop_2647:
	xnor	%l6,	0x1277,	%i6
loop_2648:
	sdiv	%o1,	0x1335,	%g7
	tcc	%xcc,	0x1
	flush	%l7 + 0x70
	tsubcc	%i4,	0x0385,	%i7
	brlez,a	%l5,	loop_2649
	ldd	[%l7 + 0x10],	%i4
	edge32	%o2,	%o3,	%o5
	fpadd32s	%f5,	%f31,	%f9
loop_2649:
	ldsw	[%l7 + 0x3C],	%i2
	srax	%o4,	%o6,	%l1
	fpadd32s	%f2,	%f16,	%f14
	mulx	%o0,	%g5,	%g2
	st	%f5,	[%l7 + 0x0C]
	fandnot1	%f18,	%f28,	%f6
	subccc	%g3,	%l2,	%g4
	wr	%g0,	0x11,	%asi
	ldstuba	[%l7 + 0x58] %asi,	%l3
	orncc	%i3,	%g1,	%i0
	sll	%o7,	%l4,	%i1
	fzero	%f20
	fbule	%fcc3,	loop_2650
	sir	0x03A0
	movl	%icc,	%g6,	%l6
	orn	%i6,	%o1,	%g7
loop_2650:
	movle	%xcc,	%i4,	%l0
	subccc	%l5,	%i5,	%i7
	tl	%icc,	0x3
	fbul,a	%fcc3,	loop_2651
	fbo	%fcc0,	loop_2652
	fble	%fcc0,	loop_2653
	ldd	[%l7 + 0x58],	%o2
loop_2651:
	tleu	%icc,	0x5
loop_2652:
	array16	%o5,	%i2,	%o2
loop_2653:
	movneg	%xcc,	%o4,	%l1
	te	%icc,	0x6
	or	%o0,	%o6,	%g2
	te	%xcc,	0x7
	array8	%g5,	%l2,	%g4
	fbule,a	%fcc1,	loop_2654
	movne	%icc,	%g3,	%l3
	tsubcctv	%i3,	0x010C,	%g1
	edge32	%i0,	%o7,	%l4
loop_2654:
	bge,pn	%xcc,	loop_2655
	edge8n	%g6,	%i1,	%i6
	array16	%o1,	%g7,	%l6
	tleu	%icc,	0x3
loop_2655:
	tsubcctv	%i4,	0x10B7,	%l0
	fbn	%fcc0,	loop_2656
	fxors	%f22,	%f17,	%f7
	addcc	%i5,	0x1BE0,	%l5
	set	0x48, %i2
	lduha	[%l7 + %i2] 0x15,	%i7
loop_2656:
	sllx	%o3,	0x01,	%i2
	umul	%o5,	0x13E2,	%o2
	bg,pt	%icc,	loop_2657
	sdiv	%l1,	0x18C2,	%o4
	brnz	%o0,	loop_2658
	bvs,pt	%icc,	loop_2659
loop_2657:
	tpos	%icc,	0x2
	bneg,pn	%icc,	loop_2660
loop_2658:
	fbne	%fcc2,	loop_2661
loop_2659:
	tsubcc	%o6,	%g2,	%l2
	movre	%g5,	0x3A3,	%g4
loop_2660:
	fmovda	%icc,	%f28,	%f29
loop_2661:
	sdivx	%l3,	0x1DA7,	%g3
	array32	%g1,	%i3,	%o7
	brlz	%i0,	loop_2662
	fba	%fcc0,	loop_2663
	taddcc	%l4,	0x1B80,	%g6
	xor	%i1,	0x02AB,	%o1
loop_2662:
	bvc	loop_2664
loop_2663:
	tle	%xcc,	0x2
	fbg	%fcc1,	loop_2665
	bvc	%icc,	loop_2666
loop_2664:
	movneg	%icc,	%g7,	%l6
	orn	%i6,	0x0F7F,	%l0
loop_2665:
	fbul,a	%fcc3,	loop_2667
loop_2666:
	edge32l	%i4,	%l5,	%i5
	std	%f16,	[%l7 + 0x60]
	fcmpne32	%f30,	%f24,	%o3
loop_2667:
	edge16	%i2,	%i7,	%o5
	fmovsne	%icc,	%f8,	%f26
	sir	0x0A2D
	sdiv	%o2,	0x09E2,	%l1
	set	0x36, %o1
	lduha	[%l7 + %o1] 0x80,	%o0
	stw	%o6,	[%l7 + 0x20]
	ldx	[%l7 + 0x20],	%g2
	edge32ln	%o4,	%l2,	%g4
	tvc	%xcc,	0x4
	fbug,a	%fcc3,	loop_2668
	call	loop_2669
	fmovde	%icc,	%f1,	%f31
	movrne	%g5,	%l3,	%g3
loop_2668:
	edge8l	%g1,	%i3,	%i0
loop_2669:
	fmovsvs	%xcc,	%f6,	%f7
	fmovsg	%icc,	%f13,	%f21
	fpadd32	%f4,	%f18,	%f10
	membar	#Sync
	set	0x40, %g4
	ldda	[%l7 + %g4] 0xf8,	%f0
	movrlz	%l4,	0x2C6,	%g6
	fbul,a	%fcc3,	loop_2670
	fmovse	%xcc,	%f2,	%f14
	wr	%g0,	0x0c,	%asi
	lda	[%l7 + 0x08] %asi,	%f27
loop_2670:
	fmovsge	%icc,	%f5,	%f28
	subcc	%o7,	%i1,	%g7
	std	%f4,	[%l7 + 0x68]
	wr	%g0,	0x04,	%asi
	ldsha	[%l7 + 0x44] %asi,	%l6
	fbn	%fcc3,	loop_2671
	brz,a	%i6,	loop_2672
	sllx	%o1,	%i4,	%l5
	fpackfix	%f16,	%f14
loop_2671:
	orncc	%l0,	%o3,	%i2
loop_2672:
	be	%xcc,	loop_2673
	stw	%i5,	[%l7 + 0x20]
	movcc	%icc,	%o5,	%o2
	tcc	%icc,	0x4
loop_2673:
	bne,pn	%icc,	loop_2674
	sdivcc	%l1,	0x08E1,	%i7
	tne	%xcc,	0x7
	std	%o0,	[%l7 + 0x38]
loop_2674:
	sethi	0x1FE7,	%g2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tle	%xcc,	0x1
	bcs,a,pt	%xcc,	loop_2675
	membar	0x12
	edge16	%o6,	%l2,	%o4
	fandnot1s	%f7,	%f17,	%f26
loop_2675:
	edge8n	%g4,	%g5,	%l3
	mova	%xcc,	%g1,	%g3
	fbuge	%fcc1,	loop_2676
	fbul,a	%fcc1,	loop_2677
	orn	%i3,	0x043B,	%l4
	array8	%i0,	%o7,	%i1
loop_2676:
	tge	%icc,	0x3
loop_2677:
	umulcc	%g7,	%g6,	%l6
	fbue,a	%fcc1,	loop_2678
	edge16	%o1,	%i6,	%l5
	tleu	%icc,	0x3
	udiv	%l0,	0x10ED,	%i4
loop_2678:
	fnand	%f4,	%f24,	%f20
	movl	%xcc,	%i2,	%o3
	fcmple32	%f4,	%f28,	%i5
	andn	%o2,	%l1,	%o5
	fxors	%f7,	%f13,	%f13
	movle	%xcc,	%o0,	%i7
	tsubcctv	%g2,	0x0261,	%o6
	move	%xcc,	%o4,	%l2
	stw	%g4,	[%l7 + 0x7C]
	tne	%xcc,	0x0
	movvc	%xcc,	%g5,	%g1
	tpos	%xcc,	0x2
	edge16ln	%l3,	%i3,	%l4
	sll	%i0,	0x06,	%g3
	fexpand	%f18,	%f22
	sir	0x03C9
	movn	%xcc,	%i1,	%g7
	movrne	%o7,	0x1B2,	%l6
	tpos	%icc,	0x2
	wr	%g0,	0x88,	%asi
	lda	[%l7 + 0x3C] %asi,	%f23
	sdivcc	%g6,	0x116B,	%o1
	be,a	loop_2679
	fmovdcs	%icc,	%f18,	%f23
	srax	%l5,	%i6,	%l0
	movrgz	%i2,	%i4,	%i5
loop_2679:
	te	%icc,	0x1
	edge16l	%o2,	%l1,	%o3
	array32	%o0,	%i7,	%g2
	flush	%l7 + 0x58
	brlz,a	%o6,	loop_2680
	tvc	%icc,	0x3
	fbul	%fcc2,	loop_2681
	udiv	%o4,	0x1EB1,	%l2
loop_2680:
	movvs	%icc,	%g4,	%g5
	edge8ln	%g1,	%l3,	%o5
loop_2681:
	brgez,a	%i3,	loop_2682
	edge32	%l4,	%g3,	%i1
	fmovdle	%icc,	%f25,	%f13
	array16	%g7,	%i0,	%l6
loop_2682:
	brlez,a	%o7,	loop_2683
	or	%o1,	%l5,	%i6
	mulscc	%l0,	0x1034,	%g6
	add	%i4,	0x0F33,	%i5
loop_2683:
	srlx	%o2,	%l1,	%i2
	fmovdge	%icc,	%f19,	%f24
	movne	%xcc,	%o0,	%i7
	movrlz	%g2,	0x04D,	%o3
	wr	%g0,	0x80,	%asi
	swapa	[%l7 + 0x68] %asi,	%o6
	sdivcc	%l2,	0x0F69,	%o4
	fcmpeq16	%f2,	%f6,	%g5
	movne	%icc,	%g1,	%g4
	fmovrslz	%o5,	%f16,	%f31
	wr	%g0,	0x11,	%asi
	lduha	[%l7 + 0x14] %asi,	%i3
	movpos	%xcc,	%l3,	%g3
	fba	%fcc2,	loop_2684
	fcmps	%fcc3,	%f8,	%f8
	sra	%i1,	%g7,	%l4
	lduw	[%l7 + 0x3C],	%l6
loop_2684:
	xnorcc	%o7,	0x1D72,	%i0
	fzeros	%f5
	fones	%f25
	membar	0x30
	fsrc2s	%f15,	%f18
	xor	%l5,	0x0B2A,	%i6
	tl	%xcc,	0x6
	nop
	setx	loop_2685,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	tne	%xcc,	0x4
	tge	%xcc,	0x3
	tle	%xcc,	0x1
loop_2685:
	movre	%l0,	%g6,	%i4
	umulcc	%i5,	%o2,	%o1
	fmovdge	%icc,	%f14,	%f4
	srlx	%l1,	0x1A,	%i2
	array8	%o0,	%i7,	%o3
	fble	%fcc0,	loop_2686
	mova	%icc,	%g2,	%o6
	tl	%icc,	0x2
	xorcc	%o4,	%g5,	%g1
loop_2686:
	or	%g4,	0x0785,	%l2
	fba	%fcc0,	loop_2687
	tsubcc	%i3,	%l3,	%o5
	sll	%i1,	0x1F,	%g7
	edge32n	%l4,	%g3,	%l6
loop_2687:
	movrlz	%i0,	%o7,	%i6
	sir	0x0174
	array32	%l0,	%g6,	%l5
	sdivx	%i5,	0x0219,	%o2
	sll	%i4,	0x0A,	%l1
	siam	0x1
	alignaddrl	%i2,	%o1,	%i7
	tl	%xcc,	0x2
	ldx	[%l7 + 0x08],	%o3
	andncc	%o0,	%g2,	%o4
	addccc	%o6,	0x1BFF,	%g5
	bpos,a,pt	%icc,	loop_2688
	fnot1	%f18,	%f18
	fcmpd	%fcc1,	%f6,	%f26
	edge32	%g1,	%g4,	%i3
loop_2688:
	orcc	%l2,	0x0B44,	%o5
	andncc	%l3,	%g7,	%i1
	movrne	%l4,	0x120,	%l6
	wr	%g0,	0x19,	%asi
	stwa	%i0,	[%l7 + 0x50] %asi
	xor	%o7,	0x19DA,	%g3
	movcc	%xcc,	%l0,	%g6
	sdiv	%i6,	0x1B36,	%l5
	tsubcc	%o2,	0x04C9,	%i4
	movne	%xcc,	%l1,	%i2
	edge32ln	%i5,	%i7,	%o3
	fcmpeq32	%f6,	%f0,	%o1
	movcs	%icc,	%g2,	%o0
	smul	%o6,	%g5,	%o4
	edge8ln	%g1,	%i3,	%l2
	taddcc	%g4,	0x16AC,	%l3
	edge16ln	%o5,	%i1,	%l4
	fmuld8sux16	%f24,	%f2,	%f0
	fpadd32	%f8,	%f8,	%f6
	movrlez	%g7,	%l6,	%i0
	fcmpne32	%f22,	%f4,	%o7
	edge32n	%g3,	%l0,	%i6
	fpmerge	%f8,	%f0,	%f0
	edge16n	%g6,	%l5,	%i4
	add	%o2,	0x1DF5,	%l1
	taddcctv	%i2,	%i5,	%o3
	fabsd	%f0,	%f22
	movvc	%xcc,	%o1,	%g2
	fbn,a	%fcc0,	loop_2689
	movvs	%xcc,	%i7,	%o6
	sir	0x1BF6
	edge32n	%o0,	%g5,	%o4
loop_2689:
	sub	%i3,	%l2,	%g1
	movrgz	%g4,	0x34A,	%l3
	popc	%i1,	%l4
	alignaddrl	%g7,	%o5,	%i0
	and	%o7,	%l6,	%l0
	edge8l	%g3,	%g6,	%i6
	st	%f19,	[%l7 + 0x0C]
	fpsub32	%f8,	%f6,	%f16
	fbl	%fcc3,	loop_2690
	bvs,pt	%icc,	loop_2691
	edge32	%i4,	%l5,	%l1
	movgu	%xcc,	%o2,	%i2
loop_2690:
	mova	%icc,	%o3,	%i5
loop_2691:
	movvc	%icc,	%o1,	%g2
	tleu	%xcc,	0x7
	fandnot1	%f2,	%f16,	%f24
	movvc	%icc,	%o6,	%o0
	fbu	%fcc2,	loop_2692
	lduh	[%l7 + 0x7C],	%i7
	edge16	%o4,	%i3,	%l2
	sllx	%g5,	%g4,	%g1
loop_2692:
	bne	%icc,	loop_2693
	popc	0x106A,	%l3
	alignaddrl	%l4,	%g7,	%i1
	xorcc	%o5,	0x1450,	%o7
loop_2693:
	edge16l	%i0,	%l6,	%g3
	movg	%icc,	%g6,	%i6
	srlx	%i4,	%l5,	%l1
	fpack32	%f18,	%f8,	%f2
	bpos	%icc,	loop_2694
	movle	%icc,	%l0,	%i2
	orcc	%o3,	%i5,	%o2
	sllx	%g2,	0x13,	%o6
loop_2694:
	array8	%o0,	%i7,	%o1
	addc	%i3,	0x0B75,	%o4
	bg,pt	%xcc,	loop_2695
	ble	loop_2696
	fbl,a	%fcc2,	loop_2697
	array8	%l2,	%g4,	%g1
loop_2695:
	edge8	%g5,	%l4,	%l3
loop_2696:
	be,a	%xcc,	loop_2698
loop_2697:
	alignaddr	%g7,	%i1,	%o5
	ta	%icc,	0x3
	movrlez	%i0,	0x12A,	%l6
loop_2698:
	sth	%o7,	[%l7 + 0x4E]
	movrgz	%g3,	0x0A9,	%g6
	taddcctv	%i4,	0x156D,	%i6
	wr	%g0,	0x88,	%asi
	stha	%l1,	[%l7 + 0x4C] %asi
	ldx	[%l7 + 0x58],	%l0
	tleu	%xcc,	0x6
	sra	%l5,	0x01,	%o3
	addccc	%i5,	%i2,	%o2
	fmovdleu	%icc,	%f2,	%f20
	fxors	%f26,	%f26,	%f23
	movg	%xcc,	%o6,	%o0
	orncc	%i7,	%g2,	%o1
	tvs	%icc,	0x0
	sub	%i3,	%l2,	%g4
	taddcc	%o4,	%g1,	%g5
	edge8l	%l4,	%l3,	%g7
	taddcctv	%i1,	0x01BC,	%o5
	subccc	%i0,	0x037C,	%o7
	taddcc	%l6,	0x0F7D,	%g6
	array32	%i4,	%i6,	%g3
	tge	%icc,	0x3
	fbule,a	%fcc2,	loop_2699
	bvc,a	%icc,	loop_2700
	fcmpne32	%f14,	%f6,	%l1
	fnot1s	%f8,	%f5
loop_2699:
	fbule,a	%fcc3,	loop_2701
loop_2700:
	edge8l	%l0,	%l5,	%o3
	movl	%xcc,	%i2,	%i5
	brlez,a	%o6,	loop_2702
loop_2701:
	fmovdge	%icc,	%f28,	%f30
	fba	%fcc2,	loop_2703
	tvc	%icc,	0x3
loop_2702:
	andncc	%o2,	%i7,	%o0
	edge8n	%g2,	%o1,	%l2
loop_2703:
	fpadd16s	%f20,	%f31,	%f29
	membar	0x3E
	fmovdle	%icc,	%f27,	%f11
	alignaddrl	%i3,	%g4,	%g1
	array16	%o4,	%g5,	%l4
	mova	%icc,	%l3,	%i1
	mulx	%g7,	0x1879,	%o5
	sdiv	%o7,	0x1436,	%i0
	call	loop_2704
	nop
	setx	loop_2705,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tcc	%icc,	0x4
	fcmpeq32	%f10,	%f30,	%g6
loop_2704:
	fbge,a	%fcc1,	loop_2706
loop_2705:
	tsubcctv	%l6,	%i4,	%g3
	fbne,a	%fcc1,	loop_2707
	srax	%i6,	0x08,	%l1
loop_2706:
	fpsub32s	%f31,	%f1,	%f2
	fmovsa	%xcc,	%f5,	%f31
loop_2707:
	edge8	%l0,	%o3,	%l5
	movleu	%icc,	%i2,	%o6
	fxnor	%f26,	%f10,	%f22
	andncc	%i5,	%i7,	%o2
	brlz,a	%g2,	loop_2708
	nop
	setx loop_2709, %l0, %l1
	jmpl %l1, %o1
	fmovscs	%xcc,	%f15,	%f0
	ldub	[%l7 + 0x6F],	%o0
loop_2708:
	std	%i2,	[%l7 + 0x68]
loop_2709:
	fnot1	%f8,	%f30
	subc	%l2,	%g4,	%g1
	pdist	%f4,	%f8,	%f6
	add	%g5,	0x1C7B,	%l4
	bvs	%xcc,	loop_2710
	alignaddrl	%o4,	%i1,	%l3
	movleu	%icc,	%g7,	%o7
	xnor	%o5,	0x0507,	%i0
loop_2710:
	fpadd32s	%f14,	%f26,	%f31
	tneg	%icc,	0x1
	nop
	setx	loop_2711,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tg	%icc,	0x7
	edge8ln	%g6,	%i4,	%g3
	movcs	%icc,	%l6,	%i6
loop_2711:
	fmovsvc	%icc,	%f3,	%f29
	sra	%l0,	%l1,	%l5
	edge8	%o3,	%i2,	%o6
	umulcc	%i7,	0x0C84,	%i5
	fmovrse	%o2,	%f14,	%f2
	taddcc	%o1,	%o0,	%g2
	mova	%icc,	%i3,	%l2
	sir	0x1AFA
	brnz,a	%g1,	loop_2712
	fmovdneg	%xcc,	%f13,	%f2
	edge16n	%g4,	%g5,	%l4
	tl	%xcc,	0x2
loop_2712:
	nop
	wr	%g0,	0x80,	%asi
	swapa	[%l7 + 0x70] %asi,	%o4
	fba,a	%fcc3,	loop_2713
	xnor	%l3,	0x1487,	%g7
	tgu	%icc,	0x4
	lduh	[%l7 + 0x6A],	%o7
loop_2713:
	fbe	%fcc3,	loop_2714
	fmovrdne	%i1,	%f16,	%f16
	stb	%o5,	[%l7 + 0x44]
	orcc	%g6,	0x12C7,	%i0
loop_2714:
	sdiv	%g3,	0x0DF6,	%i4
	fandnot2	%f6,	%f28,	%f8
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sll	%l6,	0x10,	%i6
	umulcc	%l0,	%l1,	%o3
	edge32n	%l5,	%i2,	%i7
	edge8ln	%o6,	%i5,	%o1
	sllx	%o2,	%o0,	%i3
	movle	%xcc,	%g2,	%l2
	brlez	%g1,	loop_2715
	array8	%g4,	%l4,	%o4
	fands	%f26,	%f7,	%f8
	fmul8x16al	%f20,	%f14,	%f22
loop_2715:
	movrgez	%l3,	0x2E2,	%g5
	fnot2	%f0,	%f2
	fbge,a	%fcc3,	loop_2716
	bpos,pt	%xcc,	loop_2717
	sir	0x0A50
	bl,a,pn	%icc,	loop_2718
loop_2716:
	fandnot1s	%f27,	%f1,	%f4
loop_2717:
	edge16	%g7,	%o7,	%o5
	ldd	[%l7 + 0x20],	%i0
loop_2718:
	fmovse	%xcc,	%f30,	%f25
	orncc	%i0,	%g3,	%i4
	taddcc	%g6,	%i6,	%l0
	bl	loop_2719
	orcc	%l1,	0x04EE,	%l6
	mulx	%o3,	0x10DD,	%i2
	movl	%xcc,	%i7,	%l5
loop_2719:
	movcs	%icc,	%i5,	%o1
	sra	%o2,	0x0D,	%o0
	fbule	%fcc2,	loop_2720
	udiv	%i3,	0x0945,	%g2
	addcc	%o6,	%g1,	%l2
	fmovsl	%icc,	%f21,	%f0
loop_2720:
	array32	%g4,	%o4,	%l3
	and	%l4,	%g5,	%o7
	movrlez	%g7,	%o5,	%i0
	movn	%icc,	%i1,	%i4
	fabsd	%f16,	%f12
	orncc	%g6,	0x0D87,	%i6
	sra	%l0,	0x14,	%g3
	andcc	%l1,	0x0E92,	%l6
	movleu	%xcc,	%i2,	%i7
	fmovsl	%icc,	%f24,	%f20
	set	0x08, %i7
	stda	%l4,	[%l7 + %i7] 0x88
	mulx	%i5,	%o1,	%o3
	subc	%o2,	%o0,	%g2
	fbn,a	%fcc1,	loop_2721
	ta	%xcc,	0x6
	wr	%g0,	0x18,	%asi
	ldsha	[%l7 + 0x5A] %asi,	%i3
loop_2721:
	edge8	%o6,	%g1,	%l2
	fnegd	%f10,	%f22
	sdivx	%o4,	0x13FE,	%g4
	fmovsl	%icc,	%f19,	%f18
	tge	%icc,	0x2
	wr	%g0,	0x80,	%asi
	stba	%l4,	[%l7 + 0x72] %asi
	tg	%icc,	0x5
	fmovdcs	%icc,	%f2,	%f4
	tsubcc	%l3,	%g5,	%o7
	udivcc	%g7,	0x169B,	%o5
	sllx	%i0,	0x07,	%i1
	movrne	%g6,	0x2F0,	%i6
	edge16ln	%i4,	%g3,	%l1
	and	%l0,	%l6,	%i7
	fmovrdgez	%i2,	%f0,	%f2
	bleu	loop_2722
	movrlez	%l5,	0x1E8,	%i5
	fmul8x16al	%f3,	%f18,	%f0
	fba	%fcc2,	loop_2723
loop_2722:
	mova	%icc,	%o1,	%o2
	edge16n	%o3,	%g2,	%o0
	fmovsne	%xcc,	%f30,	%f10
loop_2723:
	brlz	%i3,	loop_2724
	tcc	%icc,	0x2
	edge32n	%o6,	%g1,	%l2
	fpsub16s	%f4,	%f7,	%f10
loop_2724:
	sth	%g4,	[%l7 + 0x4C]
	te	%xcc,	0x7
	fbu,a	%fcc1,	loop_2725
	fnot1s	%f1,	%f26
	umulcc	%o4,	%l3,	%l4
	movrlez	%g5,	0x15A,	%g7
loop_2725:
	siam	0x1
	tgu	%icc,	0x1
	alignaddrl	%o5,	%o7,	%i0
	edge32	%g6,	%i1,	%i4
	mulscc	%g3,	0x1DA1,	%l1
	srl	%l0,	%l6,	%i7
	movrgz	%i2,	0x221,	%l5
	umul	%i6,	0x1794,	%o1
	fbn,a	%fcc1,	loop_2726
	brgez,a	%i5,	loop_2727
	fbuge	%fcc0,	loop_2728
	sdiv	%o3,	0x028E,	%o2
loop_2726:
	mova	%xcc,	%g2,	%i3
loop_2727:
	subc	%o0,	0x1363,	%g1
loop_2728:
	srl	%o6,	0x1E,	%l2
	fornot1	%f16,	%f10,	%f8
	tneg	%xcc,	0x2
	sllx	%o4,	0x1A,	%l3
	udivx	%g4,	0x156C,	%g5
	fcmple16	%f18,	%f26,	%l4
	sub	%g7,	%o5,	%i0
	subc	%o7,	0x1540,	%g6
	and	%i4,	0x1BB3,	%g3
	fmovscc	%icc,	%f10,	%f8
	fornot1	%f24,	%f20,	%f14
	tcc	%icc,	0x5
	call	loop_2729
	array32	%l1,	%i1,	%l6
	fcmps	%fcc0,	%f12,	%f5
	movpos	%xcc,	%l0,	%i2
loop_2729:
	tne	%icc,	0x2
	ldsh	[%l7 + 0x48],	%l5
	fbne	%fcc0,	loop_2730
	mova	%icc,	%i7,	%i6
	be,a,pt	%xcc,	loop_2731
	sdivcc	%o1,	0x0E36,	%i5
loop_2730:
	mulx	%o3,	0x0397,	%o2
	sdivx	%g2,	0x0F99,	%o0
loop_2731:
	nop
	set	0x2C, %i3
	sta	%f6,	[%l7 + %i3] 0x04
	wr	%g0,	0x88,	%asi
	ldsba	[%l7 + 0x0D] %asi,	%g1
	tsubcc	%o6,	0x10AD,	%l2
	edge16ln	%o4,	%l3,	%g4
	movre	%i3,	0x2CB,	%g5
	fpack16	%f12,	%f23
	edge8ln	%l4,	%g7,	%i0
	fornot2s	%f29,	%f27,	%f18
	edge16	%o7,	%o5,	%g6
	ta	%icc,	0x2
	fpack16	%f4,	%f16
	fornot2s	%f30,	%f5,	%f30
	orn	%i4,	%l1,	%i1
	fbg,a	%fcc1,	loop_2732
	fandnot2s	%f28,	%f21,	%f24
	edge16	%l6,	%l0,	%g3
	set	0x64, %i0
	ldswa	[%l7 + %i0] 0x88,	%i2
loop_2732:
	xorcc	%i7,	%l5,	%i6
	bleu	loop_2733
	bg,a,pt	%xcc,	loop_2734
	mulscc	%o1,	0x0EEF,	%i5
	ldd	[%l7 + 0x48],	%o2
loop_2733:
	fbge,a	%fcc1,	loop_2735
loop_2734:
	udivcc	%g2,	0x0B47,	%o0
	fbe	%fcc3,	loop_2736
	brlz	%g1,	loop_2737
loop_2735:
	andncc	%o2,	%l2,	%o4
	bcs,a	loop_2738
loop_2736:
	fcmps	%fcc0,	%f20,	%f3
loop_2737:
	andncc	%o6,	%l3,	%g4
	xnorcc	%g5,	%i3,	%g7
loop_2738:
	sir	0x091A
	bshuffle	%f8,	%f0,	%f20
	fmovsle	%xcc,	%f0,	%f14
	brgz	%l4,	loop_2739
	movcs	%xcc,	%i0,	%o5
	orn	%g6,	%i4,	%o7
	tgu	%icc,	0x0
loop_2739:
	fmovsg	%xcc,	%f28,	%f14
	addc	%l1,	%i1,	%l0
	fmovdge	%icc,	%f14,	%f28
	array32	%g3,	%i2,	%i7
	sdivcc	%l6,	0x06D6,	%l5
	ta	%xcc,	0x3
	addccc	%i6,	0x192D,	%o1
	nop
	setx loop_2740, %l0, %l1
	jmpl %l1, %o3
	sll	%g2,	0x15,	%o0
	tgu	%xcc,	0x2
	movrgz	%i5,	0x069,	%g1
loop_2740:
	umulcc	%l2,	0x0868,	%o2
	fpsub16s	%f29,	%f0,	%f22
	siam	0x7
	fmovdpos	%icc,	%f13,	%f19
	tvc	%xcc,	0x6
	tl	%icc,	0x3
	wr	%g0,	0x23,	%asi
	stha	%o4,	[%l7 + 0x48] %asi
	membar	#Sync
	movrne	%o6,	0x386,	%l3
	subc	%g5,	0x0936,	%g4
	edge32	%i3,	%l4,	%g7
	srax	%i0,	%g6,	%o5
	fbne,a	%fcc3,	loop_2741
	fbo	%fcc2,	loop_2742
	addcc	%i4,	%l1,	%o7
	ble,a	%icc,	loop_2743
loop_2741:
	orn	%l0,	0x1D96,	%i1
loop_2742:
	sllx	%g3,	0x06,	%i2
	call	loop_2744
loop_2743:
	fmovsl	%icc,	%f20,	%f28
	bl	loop_2745
	stb	%l6,	[%l7 + 0x74]
loop_2744:
	nop
	set	0x20, %o3
	stha	%i7,	[%l7 + %o3] 0x89
loop_2745:
	fbge,a	%fcc0,	loop_2746
	orn	%i6,	%l5,	%o1
	tsubcctv	%g2,	0x0E4E,	%o0
	movrgz	%o3,	%g1,	%i5
loop_2746:
	fpsub16	%f26,	%f28,	%f26
	movle	%icc,	%l2,	%o4
	addccc	%o2,	%l3,	%g5
	fmovrdne	%g4,	%f4,	%f12
	fands	%f28,	%f13,	%f24
	pdist	%f6,	%f28,	%f24
	movge	%icc,	%o6,	%l4
	fxor	%f0,	%f14,	%f16
	fmovdg	%xcc,	%f22,	%f6
	ble	%icc,	loop_2747
	edge16n	%i3,	%i0,	%g7
	edge8ln	%g6,	%i4,	%l1
	movne	%icc,	%o5,	%l0
loop_2747:
	brz,a	%i1,	loop_2748
	movrgez	%o7,	0x036,	%i2
	lduw	[%l7 + 0x40],	%l6
	fmovrse	%g3,	%f7,	%f12
loop_2748:
	addc	%i6,	0x1608,	%i7
	set	0x40, %l6
	stda	%f16,	[%l7 + %l6] 0xf8
	membar	#Sync
	ldsb	[%l7 + 0x2D],	%l5
	fmovrslz	%g2,	%f27,	%f8
	wr	%g0,	0x21,	%asi
	stxa	%o0,	[%g0 + 0x108] %asi
	andncc	%o1,	%o3,	%g1
	sdivx	%l2,	0x01C7,	%o4
	xnorcc	%i5,	0x0F52,	%l3
	set	0x54, %g5
	ldswa	[%l7 + %g5] 0x14,	%g5
	bneg	loop_2749
	fcmped	%fcc3,	%f22,	%f30
	taddcc	%g4,	%o2,	%o6
	be,a	loop_2750
loop_2749:
	array16	%l4,	%i0,	%g7
	umulcc	%g6,	%i3,	%l1
	edge8ln	%o5,	%i4,	%l0
loop_2750:
	edge32n	%i1,	%o7,	%i2
	fmovsl	%xcc,	%f16,	%f20
	move	%xcc,	%l6,	%g3
	addcc	%i6,	%l5,	%g2
	and	%o0,	%i7,	%o1
	movrlz	%o3,	%l2,	%o4
	xor	%i5,	0x04F0,	%g1
	tg	%icc,	0x2
	fxor	%f18,	%f26,	%f16
	fbuge	%fcc1,	loop_2751
	or	%l3,	0x07CF,	%g4
	bgu,pn	%xcc,	loop_2752
	sth	%g5,	[%l7 + 0x36]
loop_2751:
	brgez,a	%o2,	loop_2753
	movcs	%xcc,	%o6,	%i0
loop_2752:
	edge8l	%g7,	%l4,	%g6
	movn	%icc,	%l1,	%o5
loop_2753:
	fmovsvs	%xcc,	%f2,	%f4
	andn	%i4,	0x0FD5,	%l0
	orn	%i3,	0x04D0,	%o7
	movvc	%icc,	%i2,	%i1
	fmovdl	%icc,	%f16,	%f19
	set	0x0C, %o5
	stwa	%l6,	[%l7 + %o5] 0x15
	fpadd16	%f14,	%f10,	%f16
	bn,pt	%xcc,	loop_2754
	tsubcc	%g3,	0x04B0,	%i6
	set	0x50, %l2
	ldda	[%l7 + %l2] 0x18,	%g2
loop_2754:
	fabss	%f30,	%f27
	umulcc	%o0,	0x14DA,	%l5
	fmovse	%xcc,	%f31,	%f16
	fmovsl	%xcc,	%f15,	%f29
	fmovdge	%xcc,	%f22,	%f30
	addc	%i7,	%o3,	%l2
	taddcctv	%o4,	%o1,	%i5
	ldd	[%l7 + 0x18],	%g0
	fmovdneg	%xcc,	%f1,	%f0
	movrgez	%g4,	%g5,	%o2
	wr	%g0,	0x88,	%asi
	prefetcha	[%l7 + 0x50] %asi,	 0x3
	sdiv	%l3,	0x1DF2,	%i0
	edge8l	%g7,	%g6,	%l4
	fnot2s	%f1,	%f23
	fpadd32s	%f24,	%f23,	%f12
	movrlz	%o5,	0x3D2,	%l1
	set	0x6E, %l1
	lduha	[%l7 + %l1] 0x0c,	%l0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movcs	%icc,	%i4,	%i3
	fabss	%f20,	%f20
	edge32l	%i2,	%o7,	%l6
	add	%i1,	0x1287,	%i6
	sub	%g3,	0x074E,	%o0
	tneg	%xcc,	0x2
	movvs	%icc,	%g2,	%i7
	movrlz	%l5,	%l2,	%o3
	orn	%o1,	%o4,	%g1
	srl	%g4,	%g5,	%i5
	tg	%xcc,	0x1
	tgu	%xcc,	0x5
	mulx	%o2,	%l3,	%i0
	brlez	%g7,	loop_2755
	fbul	%fcc0,	loop_2756
	xor	%g6,	%l4,	%o5
	xorcc	%l1,	0x176D,	%o6
loop_2755:
	fxor	%f28,	%f4,	%f2
loop_2756:
	fmovrsgez	%i4,	%f19,	%f5
	tsubcctv	%i3,	0x0E98,	%i2
	movg	%xcc,	%o7,	%l0
	set	0x18, %o0
	prefetcha	[%l7 + %o0] 0x80,	 0x2
	fxnor	%f10,	%f30,	%f20
	tge	%icc,	0x1
	lduh	[%l7 + 0x5E],	%l6
	fmovdle	%xcc,	%f27,	%f18
	smul	%g3,	%i6,	%g2
	orncc	%i7,	%l5,	%l2
	movg	%icc,	%o3,	%o1
	fandnot1s	%f22,	%f3,	%f30
	nop
	setx	loop_2757,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	bge,pt	%xcc,	loop_2758
	tge	%xcc,	0x1
	fnor	%f14,	%f4,	%f22
loop_2757:
	movrlz	%o0,	%g1,	%o4
loop_2758:
	brgz,a	%g4,	loop_2759
	ble,a	loop_2760
	movle	%xcc,	%i5,	%o2
	sra	%g5,	0x04,	%l3
loop_2759:
	xorcc	%g7,	%i0,	%g6
loop_2760:
	movrlz	%l4,	%l1,	%o5
	fpsub32	%f14,	%f26,	%f6
	movl	%icc,	%o6,	%i4
	bcc	%xcc,	loop_2761
	tle	%xcc,	0x1
	lduw	[%l7 + 0x3C],	%i2
	movgu	%xcc,	%i3,	%o7
loop_2761:
	edge32l	%i1,	%l6,	%g3
	fbue,a	%fcc0,	loop_2762
	movcs	%xcc,	%i6,	%l0
	fmovsne	%xcc,	%f18,	%f24
	set	0x1C, %g1
	ldsba	[%l7 + %g1] 0x11,	%i7
loop_2762:
	nop
	set	0x7C, %i6
	stw	%l5,	[%l7 + %i6]
	wr	%g0,	0xea,	%asi
	stwa	%l2,	[%l7 + 0x2C] %asi
	membar	#Sync
	xnorcc	%o3,	0x04D5,	%o1
	tneg	%xcc,	0x6
	fmovrdne	%g2,	%f2,	%f12
	bg,a,pt	%xcc,	loop_2763
	prefetch	[%l7 + 0x7C],	 0x2
	taddcc	%o0,	%o4,	%g1
	fxor	%f2,	%f14,	%f6
loop_2763:
	sdiv	%i5,	0x0D8C,	%g4
	tvc	%xcc,	0x4
	smulcc	%g5,	0x06C9,	%l3
	fornot2	%f14,	%f8,	%f22
	add	%o2,	0x1B43,	%g7
	array32	%g6,	%i0,	%l4
	tl	%xcc,	0x2
	fxor	%f4,	%f26,	%f26
	edge32n	%l1,	%o6,	%o5
	tne	%icc,	0x6
	fcmpeq32	%f26,	%f2,	%i2
	flush	%l7 + 0x2C
	fpack16	%f22,	%f29
	orcc	%i4,	%o7,	%i3
	alignaddr	%i1,	%l6,	%g3
	brlz	%l0,	loop_2764
	brnz	%i6,	loop_2765
	tcc	%icc,	0x1
	move	%xcc,	%i7,	%l5
loop_2764:
	bleu,a,pn	%icc,	loop_2766
loop_2765:
	mulx	%l2,	0x1FE2,	%o1
	fpackfix	%f14,	%f24
	alignaddr	%o3,	%o0,	%o4
loop_2766:
	fmovdgu	%icc,	%f3,	%f25
	fmovsn	%icc,	%f14,	%f22
	tle	%icc,	0x5
	orcc	%g2,	%g1,	%i5
	addc	%g4,	%l3,	%g5
	fabsd	%f16,	%f2
	tg	%icc,	0x3
	alignaddrl	%o2,	%g6,	%g7
	ldsb	[%l7 + 0x65],	%l4
	fmovrslez	%l1,	%f13,	%f6
	fbn,a	%fcc3,	loop_2767
	movl	%xcc,	%o6,	%o5
	wr	%g0,	0x0c,	%asi
	stxa	%i2,	[%l7 + 0x30] %asi
loop_2767:
	andncc	%i4,	%o7,	%i0
	set	0x118, %l0
	nop 	! 	nop 	! 	ldxa	[%g0 + %l0] 0x40,	%i1 ripped by fixASI40.pl ripped by fixASI40.pl
	udivx	%l6,	0x02B1,	%i3
	stbar
	edge32n	%g3,	%l0,	%i6
	udivx	%i7,	0x0FC5,	%l2
	st	%f1,	[%l7 + 0x28]
	orn	%o1,	0x1660,	%o3
	fbul,a	%fcc2,	loop_2768
	membar	0x75
	fmovrdgz	%l5,	%f4,	%f18
	add	%o4,	%g2,	%g1
loop_2768:
	xor	%o0,	%i5,	%g4
	bneg	%icc,	loop_2769
	flush	%l7 + 0x4C
	fmovse	%icc,	%f13,	%f7
	fmovsne	%icc,	%f10,	%f31
loop_2769:
	fmovdle	%xcc,	%f20,	%f20
	mulscc	%g5,	0x1522,	%l3
	fmuld8ulx16	%f8,	%f2,	%f22
	umulcc	%o2,	%g6,	%g7
	array16	%l1,	%o6,	%l4
	edge32ln	%i2,	%i4,	%o7
	fbge	%fcc3,	loop_2770
	fmul8sux16	%f8,	%f30,	%f30
	fmovrdgz	%i0,	%f0,	%f14
	tvc	%icc,	0x4
loop_2770:
	fbue	%fcc2,	loop_2771
	tleu	%xcc,	0x6
	brz	%o5,	loop_2772
	ble,a,pt	%icc,	loop_2773
loop_2771:
	edge8	%l6,	%i3,	%g3
	smulcc	%l0,	0x0EBB,	%i1
loop_2772:
	prefetch	[%l7 + 0x2C],	 0x0
loop_2773:
	fxor	%f24,	%f14,	%f8
	xnorcc	%i6,	0x123E,	%i7
	array16	%o1,	%l2,	%o3
	set	0x1C, %o2
	sta	%f26,	[%l7 + %o2] 0x11
	movrgz	%l5,	%o4,	%g1
	fmovrdne	%g2,	%f2,	%f6
	tg	%icc,	0x0
	edge8	%i5,	%o0,	%g4
	addccc	%l3,	0x085E,	%g5
	mova	%xcc,	%o2,	%g7
	wr	%g0,	0x89,	%asi
	swapa	[%l7 + 0x44] %asi,	%g6
	fcmpne32	%f10,	%f10,	%l1
	umulcc	%o6,	%l4,	%i2
	movneg	%icc,	%o7,	%i0
	fpadd32	%f24,	%f24,	%f14
	tvs	%icc,	0x7
	fornot1	%f30,	%f22,	%f20
	be,a	%icc,	loop_2774
	edge8ln	%i4,	%l6,	%o5
	brnz,a	%i3,	loop_2775
	subc	%l0,	%g3,	%i1
loop_2774:
	fmovrslez	%i7,	%f30,	%f21
	fpmerge	%f27,	%f18,	%f30
loop_2775:
	tle	%icc,	0x7
	fpsub16s	%f23,	%f6,	%f15
	udivx	%i6,	0x05D1,	%o1
	fbg	%fcc3,	loop_2776
	fones	%f31
	tne	%xcc,	0x5
	taddcc	%o3,	%l2,	%o4
loop_2776:
	edge16ln	%g1,	%l5,	%i5
	swap	[%l7 + 0x54],	%o0
	fcmpgt32	%f20,	%f6,	%g2
	tle	%icc,	0x3
	brgez	%l3,	loop_2777
	movrlz	%g5,	%o2,	%g4
	movn	%xcc,	%g6,	%g7
	sethi	0x00BA,	%o6
loop_2777:
	srlx	%l1,	0x0C,	%l4
	edge16ln	%i2,	%o7,	%i0
	fbn	%fcc2,	loop_2778
	fbul	%fcc0,	loop_2779
	fnegs	%f26,	%f22
	fmovse	%icc,	%f26,	%f24
loop_2778:
	subccc	%l6,	0x0751,	%o5
loop_2779:
	array32	%i4,	%l0,	%i3
	udivx	%g3,	0x0412,	%i1
	fmovdl	%xcc,	%f19,	%f17
	tneg	%icc,	0x4
	lduw	[%l7 + 0x44],	%i6
	fblg	%fcc2,	loop_2780
	tg	%icc,	0x5
	edge16l	%i7,	%o1,	%l2
	wr	%g0,	0x18,	%asi
	ldsha	[%l7 + 0x34] %asi,	%o4
loop_2780:
	nop
	add	%l7,	0x10,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] %asi,	%g1,	%l5
	umulcc	%o3,	%o0,	%g2
	fbul	%fcc2,	loop_2781
	srl	%l3,	0x10,	%i5
	movcs	%xcc,	%o2,	%g4
	movg	%icc,	%g6,	%g5
loop_2781:
	fmovdcs	%xcc,	%f28,	%f12
	fnot2s	%f1,	%f12
	movgu	%icc,	%g7,	%o6
	bn	loop_2782
	fnot2s	%f1,	%f12
	nop
	setx loop_2783, %l0, %l1
	jmpl %l1, %l4
	edge16l	%i2,	%o7,	%l1
loop_2782:
	fbg,a	%fcc2,	loop_2784
	movrlez	%l6,	%o5,	%i0
loop_2783:
	tne	%xcc,	0x6
	array32	%l0,	%i4,	%i3
loop_2784:
	tge	%icc,	0x0
	smul	%g3,	%i6,	%i7
	brz,a	%i1,	loop_2785
	movcc	%xcc,	%l2,	%o1
	movcc	%xcc,	%o4,	%g1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2785:
	ta	%icc,	0x6
	fmovde	%xcc,	%f23,	%f17
	addc	%o3,	%o0,	%g2
	srlx	%l3,	%l5,	%i5
	bne	loop_2786
	movvs	%xcc,	%o2,	%g4
	fsrc1s	%f11,	%f8
	wr	%g0,	0x19,	%asi
	ldswa	[%l7 + 0x7C] %asi,	%g5
loop_2786:
	tne	%icc,	0x2
	swap	[%l7 + 0x78],	%g6
	fmovdn	%xcc,	%f4,	%f18
	tleu	%icc,	0x0
	movne	%icc,	%o6,	%l4
	fmovse	%icc,	%f27,	%f5
	movrgz	%i2,	%o7,	%g7
	movge	%icc,	%l1,	%l6
	fmovdpos	%icc,	%f30,	%f2
	fcmpgt32	%f20,	%f22,	%o5
	orn	%i0,	%i4,	%i3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsn	%icc,	%f16,	%f5
	movrlez	%g3,	0x3FE,	%i6
	bneg,pn	%icc,	loop_2787
	andcc	%i7,	%l0,	%i1
	movcc	%icc,	%l2,	%o1
	tge	%xcc,	0x3
loop_2787:
	edge16n	%g1,	%o3,	%o4
	edge8	%g2,	%l3,	%o0
	udivcc	%i5,	0x1B4F,	%o2
	alignaddr	%l5,	%g5,	%g4
	tvc	%xcc,	0x7
	movleu	%xcc,	%g6,	%o6
	addcc	%l4,	0x090C,	%o7
	taddcctv	%i2,	%l1,	%l6
	prefetch	[%l7 + 0x68],	 0x3
	tvs	%xcc,	0x0
	udivx	%o5,	0x17B1,	%i0
	udiv	%i4,	0x17F8,	%i3
	udivcc	%g3,	0x07FC,	%g7
	fpsub16	%f24,	%f4,	%f18
	fnegs	%f15,	%f3
	sir	0x118D
	tge	%icc,	0x0
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x52] %asi,	%i7
	movrlz	%i6,	0x0F3,	%l0
	edge32n	%i1,	%o1,	%l2
	fmovdvc	%icc,	%f10,	%f4
	set	0x40, %g2
	stda	%f0,	[%l7 + %g2] 0x1f
	membar	#Sync
	call	loop_2788
	bne,a	%icc,	loop_2789
	fmovdpos	%xcc,	%f18,	%f3
	fnor	%f12,	%f8,	%f28
loop_2788:
	tleu	%xcc,	0x6
loop_2789:
	movne	%icc,	%o3,	%g1
	sllx	%o4,	0x0A,	%l3
	add	%g2,	0x0D6A,	%i5
	fcmple32	%f16,	%f18,	%o0
	andn	%l5,	0x13A4,	%o2
	fnegd	%f8,	%f4
	wr	%g0,	0x10,	%asi
	lduha	[%l7 + 0x18] %asi,	%g4
	mulx	%g5,	0x1BDA,	%o6
	subccc	%g6,	0x0611,	%l4
	tg	%icc,	0x4
	tsubcc	%i2,	%o7,	%l6
	popc	0x1423,	%l1
	fbuge	%fcc1,	loop_2790
	brlz,a	%i0,	loop_2791
	be	%icc,	loop_2792
	brnz,a	%o5,	loop_2793
loop_2790:
	fmovdvc	%icc,	%f18,	%f26
loop_2791:
	movvc	%icc,	%i4,	%i3
loop_2792:
	movne	%xcc,	%g7,	%g3
loop_2793:
	fmovsleu	%icc,	%f29,	%f22
	tne	%icc,	0x3
	edge32l	%i7,	%l0,	%i1
	edge16ln	%i6,	%o1,	%l2
	lduh	[%l7 + 0x26],	%o3
	xnor	%o4,	0x0268,	%g1
	move	%xcc,	%g2,	%l3
	tvs	%xcc,	0x4
	movvs	%icc,	%i5,	%l5
	subc	%o2,	%g4,	%g5
	array8	%o6,	%o0,	%g6
	edge8l	%l4,	%i2,	%o7
	mova	%xcc,	%l6,	%i0
	fnegd	%f22,	%f28
	fmovdleu	%icc,	%f19,	%f2
	bne,a,pn	%xcc,	loop_2794
	addccc	%o5,	0x1CE1,	%i4
	sth	%i3,	[%l7 + 0x2C]
	tl	%xcc,	0x7
loop_2794:
	fblg	%fcc3,	loop_2795
	and	%l1,	0x1FF8,	%g3
	bvs	%icc,	loop_2796
	xor	%i7,	0x0BA7,	%l0
loop_2795:
	srl	%i1,	0x04,	%g7
	umulcc	%o1,	0x148F,	%l2
loop_2796:
	movrne	%o3,	0x384,	%o4
	umulcc	%g1,	%g2,	%l3
	andncc	%i6,	%i5,	%l5
	sdivx	%o2,	0x1C66,	%g4
	tsubcc	%g5,	0x0715,	%o6
	fmovdvc	%xcc,	%f23,	%f25
	movgu	%icc,	%g6,	%o0
	movge	%icc,	%l4,	%o7
	xorcc	%l6,	0x12D3,	%i2
	tleu	%icc,	0x2
	ta	%icc,	0x2
	subcc	%i0,	0x024C,	%i4
	array16	%o5,	%i3,	%l1
	or	%i7,	0x0510,	%l0
	std	%f24,	[%l7 + 0x10]
	udivcc	%g3,	0x1E7E,	%g7
	nop
	setx	loop_2797,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	array8	%o1,	%l2,	%o3
	edge32l	%o4,	%i1,	%g1
	call	loop_2798
loop_2797:
	fbug	%fcc2,	loop_2799
	tge	%xcc,	0x4
	nop
	setx	loop_2800,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_2798:
	siam	0x2
loop_2799:
	tle	%icc,	0x6
	fcmple32	%f30,	%f22,	%l3
loop_2800:
	movne	%xcc,	%g2,	%i6
	fandnot2s	%f25,	%f24,	%f4
	movrgez	%l5,	%i5,	%g4
	bg,a	%xcc,	loop_2801
	tvs	%icc,	0x2
	fmovrdlez	%g5,	%f4,	%f12
	orncc	%o6,	%g6,	%o2
loop_2801:
	mulx	%o0,	%l4,	%l6
	xnorcc	%o7,	0x02B6,	%i2
	fba,a	%fcc2,	loop_2802
	movrne	%i0,	%i4,	%i3
	sdivcc	%l1,	0x0125,	%i7
	move	%icc,	%o5,	%l0
loop_2802:
	fmovsne	%icc,	%f20,	%f28
	fcmped	%fcc3,	%f20,	%f10
	sllx	%g3,	%o1,	%l2
	xorcc	%g7,	0x0736,	%o4
	fpsub16	%f4,	%f2,	%f0
	fnot1s	%f10,	%f28
	udivx	%i1,	0x1911,	%g1
	bvs,a	%icc,	loop_2803
	stx	%l3,	[%l7 + 0x48]
	tleu	%icc,	0x4
	fnot1	%f26,	%f28
loop_2803:
	fmovscc	%icc,	%f15,	%f28
	edge8n	%o3,	%i6,	%l5
	ldd	[%l7 + 0x48],	%f6
	set	0x10, %g3
	stxa	%i5,	[%l7 + %g3] 0x19
	array8	%g2,	%g5,	%g4
	sethi	0x1FC0,	%o6
	prefetch	[%l7 + 0x20],	 0x0
	ld	[%l7 + 0x28],	%f16
	fsrc2	%f16,	%f20
	tge	%icc,	0x4
	array8	%g6,	%o2,	%o0
	bg,a	loop_2804
	fmovdvc	%xcc,	%f29,	%f23
	umul	%l6,	0x0767,	%l4
	taddcctv	%o7,	0x1A6A,	%i2
loop_2804:
	subcc	%i0,	0x0E9E,	%i3
	tl	%icc,	0x7
	movrne	%i4,	0x172,	%l1
	andncc	%o5,	%l0,	%i7
	fnand	%f8,	%f2,	%f2
	bcs,a,pt	%xcc,	loop_2805
	fmovsleu	%icc,	%f31,	%f13
	fmovrsgez	%o1,	%f12,	%f31
	call	loop_2806
loop_2805:
	fbne	%fcc1,	loop_2807
	fmovdvc	%xcc,	%f13,	%f0
	andncc	%g3,	%l2,	%g7
loop_2806:
	tn	%xcc,	0x6
loop_2807:
	nop
	setx loop_2808, %l0, %l1
	jmpl %l1, %i1
	movleu	%icc,	%o4,	%g1
	subccc	%l3,	0x1D45,	%o3
	xnorcc	%i6,	0x1B6B,	%i5
loop_2808:
	std	%g2,	[%l7 + 0x60]
	edge32ln	%l5,	%g4,	%o6
	tsubcc	%g6,	%g5,	%o0
	sll	%l6,	0x14,	%l4
	movrlez	%o2,	0x378,	%i2
	bshuffle	%f30,	%f20,	%f22
	andn	%o7,	0x0A58,	%i3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fzeros	%f26
	wr	%g0,	0x2a,	%asi
	stxa	%i4,	[%l7 + 0x58] %asi
	membar	#Sync
	fpmerge	%f13,	%f10,	%f8
	and	%l1,	0x1CBD,	%o5
	mova	%icc,	%i0,	%l0
	ta	%xcc,	0x3
	movcs	%icc,	%i7,	%o1
	edge32l	%g3,	%l2,	%i1
	tleu	%xcc,	0x4
	fpmerge	%f23,	%f13,	%f2
	fpsub16s	%f16,	%f7,	%f28
	edge8l	%o4,	%g1,	%g7
	edge32	%o3,	%i6,	%l3
	bn,a,pn	%icc,	loop_2809
	siam	0x5
	nop
	setx	loop_2810,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	addccc	%i5,	%g2,	%l5
loop_2809:
	fpmerge	%f24,	%f27,	%f4
	wr	%g0,	0x19,	%asi
	stba	%g4,	[%l7 + 0x0F] %asi
loop_2810:
	taddcc	%g6,	0x1490,	%o6
	movle	%xcc,	%g5,	%l6
	addcc	%l4,	0x1D69,	%o0
	fpsub32	%f12,	%f18,	%f6
	fand	%f8,	%f2,	%f30
	move	%icc,	%o2,	%i2
	taddcc	%i3,	0x187A,	%i4
	set	0x68, %l3
	lduwa	[%l7 + %l3] 0x0c,	%l1
	sethi	0x1E8C,	%o7
	taddcc	%i0,	0x0BDE,	%o5
	fbue,a	%fcc1,	loop_2811
	fcmple32	%f18,	%f22,	%i7
	bn,a,pt	%xcc,	loop_2812
	tle	%icc,	0x4
loop_2811:
	fornot2	%f0,	%f14,	%f2
	fmovdn	%xcc,	%f7,	%f19
loop_2812:
	tcs	%xcc,	0x1
	edge32ln	%o1,	%g3,	%l0
	udivx	%l2,	0x09D2,	%i1
	array8	%o4,	%g1,	%g7
	movne	%xcc,	%i6,	%o3
	fpackfix	%f10,	%f8
	ble	loop_2813
	edge8n	%l3,	%g2,	%i5
	tsubcctv	%g4,	%l5,	%o6
	movpos	%icc,	%g6,	%g5
loop_2813:
	bl,a,pn	%icc,	loop_2814
	brgz	%l4,	loop_2815
	ldsh	[%l7 + 0x2C],	%l6
	srax	%o0,	%i2,	%i3
loop_2814:
	subc	%i4,	%o2,	%o7
loop_2815:
	edge8n	%i0,	%o5,	%i7
	fandnot2s	%f1,	%f24,	%f6
	sir	0x1A2C
	fmovsvc	%icc,	%f25,	%f9
	tne	%xcc,	0x4
	smulcc	%o1,	0x0D49,	%l1
	swap	[%l7 + 0x64],	%g3
	movne	%icc,	%l0,	%l2
	tvs	%xcc,	0x2
	nop
	setx	loop_2816,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	ta	%icc,	0x4
	wr	%g0,	0x80,	%asi
	prefetcha	[%l7 + 0x48] %asi,	 0x3
loop_2816:
	sir	0x1912
	tsubcc	%o4,	%g7,	%g1
	fmovde	%xcc,	%f24,	%f0
	fmovrsne	%i6,	%f25,	%f8
	movcc	%xcc,	%l3,	%o3
	wr	%g0,	0x1e,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
	mova	%icc,	%g2,	%g4
	xor	%l5,	0x0B9C,	%i5
	sethi	0x11E4,	%g6
	movge	%xcc,	%g5,	%l4
	wr	%g0,	0x04,	%asi
	ldsba	[%l7 + 0x7C] %asi,	%l6
	array8	%o0,	%i2,	%o6
	set	0x18, %g7
	lduwa	[%l7 + %g7] 0x10,	%i4
	brlz,a	%i3,	loop_2817
	tcs	%icc,	0x7
	edge16l	%o2,	%o7,	%i0
	array8	%o5,	%o1,	%i7
loop_2817:
	fcmple16	%f4,	%f20,	%g3
	fbue	%fcc1,	loop_2818
	tne	%xcc,	0x1
	bpos	loop_2819
	and	%l0,	0x13F9,	%l1
loop_2818:
	fbge	%fcc2,	loop_2820
	sllx	%i1,	0x1E,	%o4
loop_2819:
	nop
	set	0x34, %o4
	stw	%g7,	[%l7 + %o4]
	and	%l2,	%g1,	%l3
loop_2820:
	fcmpgt32	%f18,	%f26,	%o3
	tvs	%xcc,	0x0
	bvs	%icc,	loop_2821
	edge32n	%g2,	%g4,	%i6
	wr	%g0,	0x18,	%asi
	ldswa	[%l7 + 0x60] %asi,	%l5
loop_2821:
	popc	0x0104,	%i5
	movleu	%xcc,	%g5,	%l4
	umulcc	%l6,	%o0,	%i2
	wr	%g0,	0x89,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	and	%o6,	0x0FC5,	%i4
	brz	%i3,	loop_2822
	edge32ln	%o2,	%o7,	%i0
	srl	%o5,	%g6,	%o1
	fxors	%f12,	%f13,	%f22
loop_2822:
	fmul8ulx16	%f0,	%f0,	%f24
	edge32l	%i7,	%l0,	%l1
	array32	%g3,	%i1,	%g7
	udivx	%o4,	0x09C4,	%g1
	fblg	%fcc0,	loop_2823
	fmul8x16	%f23,	%f20,	%f24
	fnot1s	%f29,	%f16
	edge16ln	%l2,	%l3,	%g2
loop_2823:
	fbu,a	%fcc0,	loop_2824
	movrgz	%o3,	%i6,	%g4
	mova	%xcc,	%l5,	%i5
	fba	%fcc3,	loop_2825
loop_2824:
	fcmpeq16	%f30,	%f16,	%l4
	andn	%g5,	0x1BB9,	%l6
	wr	%g0,	0x10,	%asi
	ldda	[%l7 + 0x60] %asi,	%i2
loop_2825:
	fnot2	%f26,	%f8
	edge8l	%o0,	%o6,	%i4
	array8	%i3,	%o2,	%o7
	movl	%xcc,	%o5,	%g6
	tgu	%xcc,	0x3
	stw	%i0,	[%l7 + 0x18]
	edge32	%o1,	%l0,	%i7
	movcc	%icc,	%g3,	%i1
	fbg	%fcc1,	loop_2826
	sdivx	%g7,	0x18AD,	%l1
	bl,a	loop_2827
	fnors	%f0,	%f5,	%f23
loop_2826:
	fble	%fcc3,	loop_2828
	fbo,a	%fcc2,	loop_2829
loop_2827:
	sdiv	%o4,	0x00F6,	%l2
	movrlz	%l3,	0x198,	%g1
loop_2828:
	movg	%icc,	%g2,	%i6
loop_2829:
	fmovdcc	%icc,	%f23,	%f27
	ble	%icc,	loop_2830
	fornot1	%f12,	%f30,	%f6
	movneg	%icc,	%o3,	%g4
	movle	%xcc,	%l5,	%l4
loop_2830:
	sdivx	%g5,	0x10E7,	%l6
	membar	#Sync
	wr	%g0,	0xf0,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	or	%i5,	0x0CA0,	%i2
	fzero	%f4
	fandnot2	%f18,	%f10,	%f26
	wr	%g0,	0x89,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	fsrc2s	%f14,	%f15
	fmul8ulx16	%f22,	%f26,	%f12
	movleu	%xcc,	%o6,	%o0
	tneg	%xcc,	0x7
	movre	%i4,	0x053,	%o2
	srlx	%i3,	%o7,	%g6
	array16	%i0,	%o5,	%l0
	movcs	%xcc,	%i7,	%g3
	wr	%g0,	0x80,	%asi
	sta	%f7,	[%l7 + 0x28] %asi
	fmovsge	%icc,	%f26,	%f6
	mulscc	%i1,	%o1,	%g7
	srl	%o4,	%l2,	%l1
	fmovse	%icc,	%f7,	%f30
	sir	0x00C4
	edge32	%g1,	%g2,	%l3
	smulcc	%o3,	0x163B,	%i6
	umul	%l5,	0x1704,	%g4
	tcs	%icc,	0x6
	swap	[%l7 + 0x54],	%l4
	tleu	%icc,	0x0
	movg	%icc,	%g5,	%l6
	fmovsge	%icc,	%f15,	%f16
	fmovsa	%icc,	%f24,	%f12
	subcc	%i2,	%i5,	%o0
	edge16ln	%o6,	%o2,	%i3
	ldx	[%l7 + 0x18],	%o7
	fcmpgt32	%f26,	%f22,	%g6
	movrlez	%i0,	0x2EC,	%i4
	call	loop_2831
	xor	%l0,	%o5,	%i7
	edge8ln	%i1,	%o1,	%g3
	xor	%g7,	0x106D,	%l2
loop_2831:
	bpos	%xcc,	loop_2832
	orn	%o4,	0x0C6F,	%g1
	fbue,a	%fcc1,	loop_2833
	movleu	%xcc,	%l1,	%l3
loop_2832:
	fcmpes	%fcc1,	%f18,	%f31
	orn	%g2,	0x0D38,	%i6
loop_2833:
	tle	%xcc,	0x1
	fmovdn	%xcc,	%f30,	%f22
	tpos	%icc,	0x3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x88,	%asi
	ldswa	[%l7 + 0x50] %asi,	%o3
	set	0x5C, %o7
	lduba	[%l7 + %o7] 0x80,	%g4
	smulcc	%l4,	%l5,	%g5
	set	0x3C, %i1
	ldstuba	[%l7 + %i1] 0x19,	%l6
	bleu,a,pt	%xcc,	loop_2834
	orn	%i5,	0x1DEB,	%o0
	tvs	%icc,	0x2
	tpos	%xcc,	0x6
loop_2834:
	stb	%o6,	[%l7 + 0x3E]
	bne	loop_2835
	tge	%xcc,	0x2
	xor	%i2,	%o2,	%i3
	movre	%g6,	0x118,	%o7
loop_2835:
	popc	0x14D2,	%i4
	brlz,a	%l0,	loop_2836
	brgez	%i0,	loop_2837
	add	%o5,	%i1,	%i7
	fmovsg	%icc,	%f9,	%f22
loop_2836:
	te	%icc,	0x0
loop_2837:
	orn	%g3,	%o1,	%g7
	set	0x4C, %i4
	swapa	[%l7 + %i4] 0x89,	%l2
	movne	%icc,	%o4,	%g1
	fbule,a	%fcc3,	loop_2838
	umul	%l3,	0x0AA1,	%l1
	fmovsa	%xcc,	%f6,	%f31
	subc	%g2,	0x11CD,	%i6
loop_2838:
	tgu	%xcc,	0x2
	fornot1	%f4,	%f2,	%f22
	fmovrdgez	%g4,	%f18,	%f30
	bn	%icc,	loop_2839
	xor	%o3,	0x1924,	%l4
	or	%g5,	0x1DF9,	%l6
	fmul8ulx16	%f20,	%f10,	%f0
loop_2839:
	andncc	%l5,	%i5,	%o6
	bn,pt	%xcc,	loop_2840
	fsrc2	%f12,	%f14
	edge8ln	%o0,	%i2,	%i3
	fmovrde	%g6,	%f18,	%f4
loop_2840:
	tcc	%icc,	0x4
	edge8	%o2,	%o7,	%l0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x78, %g6
	stda	%i4,	[%l7 + %g6] 0x11
	sll	%i0,	%o5,	%i7
	fpsub16s	%f26,	%f0,	%f7
	fones	%f21
	set	0x78, %i5
	lduba	[%l7 + %i5] 0x10,	%i1
	movl	%icc,	%g3,	%g7
	fnegs	%f14,	%f19
	fbg	%fcc3,	loop_2841
	te	%icc,	0x0
	movl	%icc,	%o1,	%l2
	edge8	%g1,	%l3,	%l1
loop_2841:
	bneg,a,pn	%xcc,	loop_2842
	fnot1s	%f5,	%f17
	fmovrdgz	%o4,	%f24,	%f18
	tl	%icc,	0x1
loop_2842:
	xnorcc	%g2,	%i6,	%o3
	sub	%l4,	0x0A51,	%g5
	edge8l	%g4,	%l6,	%i5
	sdivx	%l5,	0x1107,	%o0
	movge	%xcc,	%o6,	%i3
	fmovde	%icc,	%f5,	%f8
	tgu	%xcc,	0x6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subccc	%g6,	%o2,	%i2
	tneg	%icc,	0x7
	fmovse	%xcc,	%f21,	%f26
	movgu	%xcc,	%l0,	%i4
	movl	%icc,	%i0,	%o5
	movcc	%xcc,	%i7,	%i1
	te	%xcc,	0x1
	mulscc	%g3,	%g7,	%o7
	wr	%g0,	0x89,	%asi
	stwa	%l2,	[%l7 + 0x38] %asi
	fbue,a	%fcc2,	loop_2843
	movrgz	%g1,	%o1,	%l1
	fmovdvc	%icc,	%f2,	%f27
	set	0x48, %o6
	stda	%l2,	[%l7 + %o6] 0x27
	membar	#Sync
loop_2843:
	nop
	set	0x24, %l4
	stwa	%o4,	[%l7 + %l4] 0x0c
	tne	%xcc,	0x3
	fmovdgu	%icc,	%f8,	%f14
	smulcc	%g2,	%o3,	%i6
	fxnor	%f14,	%f26,	%f26
	tvc	%xcc,	0x5
	taddcctv	%l4,	0x101C,	%g4
	andn	%l6,	%i5,	%g5
	movge	%icc,	%o0,	%l5
	wr	%g0,	0x80,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	wr	%g0,	0x19,	%asi
	sta	%f19,	[%l7 + 0x34] %asi
	movl	%icc,	%i3,	%o6
	orcc	%g6,	0x0077,	%i2
	tg	%icc,	0x3
	udivx	%l0,	0x158F,	%i4
	sethi	0x124B,	%i0
	brz,a	%o5,	loop_2844
	mulscc	%i7,	0x1C87,	%o2
	taddcc	%g3,	0x057B,	%i1
	fbe	%fcc1,	loop_2845
loop_2844:
	xor	%o7,	0x0F9D,	%l2
	addccc	%g1,	%g7,	%o1
	movgu	%icc,	%l3,	%l1
loop_2845:
	fmuld8sux16	%f0,	%f9,	%f2
	array32	%o4,	%o3,	%g2
	umul	%l4,	%i6,	%l6
	taddcc	%i5,	0x0B51,	%g5
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
	fbu,a	%fcc3,	loop_2847
	brlz,a	%g4,	loop_2848
	fbue,a	%fcc2,	loop_2849
loop_2846:
	fbn	%fcc1,	loop_2850
loop_2847:
	tcs	%icc,	0x7
loop_2848:
	fmul8x16al	%f20,	%f25,	%f4
loop_2849:
	orcc	%o0,	%l5,	%o6
loop_2850:
	membar	0x20
	fxors	%f29,	%f6,	%f29
	set	0x4B, %i2
	ldstuba	[%l7 + %i2] 0x0c,	%i3
	sllx	%i2,	%g6,	%i4
	fmovdne	%icc,	%f20,	%f4
	wr	%g0,	0x0c,	%asi
	swapa	[%l7 + 0x38] %asi,	%i0
	ldstub	[%l7 + 0x70],	%o5
	tge	%xcc,	0x4
	fmovse	%icc,	%f18,	%f20
	brnz,a	%l0,	loop_2851
	mulscc	%i7,	0x155C,	%o2
	fmovrdgz	%i1,	%f8,	%f28
	sll	%g3,	0x07,	%l2
loop_2851:
	fsrc1	%f16,	%f24
	addcc	%g1,	0x1035,	%g7
	bge,a	loop_2852
	ta	%xcc,	0x1
	bneg	loop_2853
	fmovspos	%icc,	%f10,	%f0
loop_2852:
	nop
	wr	%g0,	0x0c,	%asi
	stha	%o1,	[%l7 + 0x3A] %asi
loop_2853:
	orcc	%l3,	0x1568,	%l1
	bne,a,pn	%icc,	loop_2854
	te	%xcc,	0x5
	movg	%xcc,	%o4,	%o3
	bl,a	loop_2855
loop_2854:
	fmovdpos	%xcc,	%f23,	%f10
	tle	%xcc,	0x6
	popc	0x0D2B,	%g2
loop_2855:
	popc	%l4,	%o7
	edge8n	%i6,	%i5,	%g5
	fsrc2s	%f0,	%f18
	swap	[%l7 + 0x6C],	%l6
	set	0x3A, %o1
	stha	%g4,	[%l7 + %o1] 0x89
	edge32	%l5,	%o6,	%i3
	movpos	%icc,	%i2,	%o0
	fpsub32s	%f4,	%f0,	%f13
	sethi	0x0080,	%g6
	lduh	[%l7 + 0x34],	%i4
	be,a,pn	%icc,	loop_2856
	ldsw	[%l7 + 0x7C],	%o5
	fbo,a	%fcc2,	loop_2857
	fmovsg	%icc,	%f29,	%f30
loop_2856:
	fmovrdgz	%i0,	%f0,	%f28
	brlz,a	%i7,	loop_2858
loop_2857:
	fnors	%f18,	%f9,	%f24
	set	0x44, %g4
	ldsha	[%l7 + %g4] 0x18,	%o2
loop_2858:
	movcc	%icc,	%i1,	%g3
	srax	%l2,	0x1D,	%l0
	bne,pn	%xcc,	loop_2859
	sub	%g7,	%o1,	%g1
	or	%l3,	0x0E6F,	%o4
	xnor	%o3,	0x102F,	%g2
loop_2859:
	subc	%l4,	0x08B5,	%l1
	fandnot2	%f6,	%f6,	%f8
	fmovse	%icc,	%f27,	%f20
	tle	%icc,	0x2
	flush	%l7 + 0x24
	addccc	%o7,	%i5,	%g5
	fmovdge	%xcc,	%f21,	%f7
	mova	%xcc,	%l6,	%i6
	fba,a	%fcc1,	loop_2860
	fornot1s	%f24,	%f29,	%f26
	tn	%icc,	0x6
	stbar
loop_2860:
	ble,a,pt	%icc,	loop_2861
	taddcctv	%g4,	%l5,	%o6
	fandnot2s	%f20,	%f7,	%f11
	std	%f2,	[%l7 + 0x48]
loop_2861:
	fcmple32	%f2,	%f2,	%i2
	sdivcc	%o0,	0x114C,	%g6
	bne	%xcc,	loop_2862
	popc	%i3,	%i4
	popc	%i0,	%i7
	srlx	%o5,	%i1,	%g3
loop_2862:
	movpos	%xcc,	%l2,	%o2
	tvc	%icc,	0x4
	wr	%g0,	0x80,	%asi
	ldstuba	[%l7 + 0x22] %asi,	%l0
	wr	%g0,	0x19,	%asi
	stda	%o0,	[%l7 + 0x78] %asi
	bshuffle	%f10,	%f0,	%f6
	prefetch	[%l7 + 0x4C],	 0x3
	udivcc	%g1,	0x0901,	%g7
	mulx	%l3,	%o4,	%o3
	siam	0x5
	std	%f12,	[%l7 + 0x18]
	movpos	%icc,	%g2,	%l1
	movle	%xcc,	%o7,	%l4
	taddcc	%g5,	0x1811,	%i5
	set	0x18, %l5
	sta	%f28,	[%l7 + %l5] 0x0c
	fmovdneg	%xcc,	%f18,	%f4
	taddcc	%l6,	%i6,	%g4
	bgu	%xcc,	loop_2863
	bn,pn	%icc,	loop_2864
	edge8	%l5,	%o6,	%o0
	fmovrslez	%i2,	%f12,	%f22
loop_2863:
	movleu	%icc,	%g6,	%i4
loop_2864:
	smul	%i3,	%i0,	%o5
	fble,a	%fcc3,	loop_2865
	membar	0x4F
	tneg	%xcc,	0x0
	ta	%xcc,	0x0
loop_2865:
	tvc	%icc,	0x7
	movrlez	%i7,	%g3,	%i1
	andcc	%o2,	%l0,	%o1
	wr	%g0,	0x27,	%asi
	ldda	[%l7 + 0x50] %asi,	%l2
	movvc	%xcc,	%g7,	%g1
	fand	%f6,	%f26,	%f18
	srax	%l3,	0x07,	%o3
	fornot1s	%f16,	%f10,	%f19
	stbar
	andncc	%o4,	%g2,	%l1
	fmovrde	%o7,	%f4,	%f26
	array16	%l4,	%g5,	%l6
	alignaddr	%i6,	%i5,	%l5
	movle	%icc,	%o6,	%o0
	fzeros	%f2
	movre	%g4,	0x3D6,	%i2
	taddcctv	%g6,	%i3,	%i4
	movrgez	%o5,	0x3BB,	%i0
	fmovscc	%icc,	%f11,	%f22
	andcc	%i7,	%g3,	%o2
	umul	%l0,	%i1,	%l2
	fmovd	%f4,	%f26
	fnors	%f10,	%f1,	%f28
	udivcc	%o1,	0x1AE0,	%g7
	sethi	0x012A,	%g1
	fmovsn	%xcc,	%f24,	%f27
	set	0x30, %i3
	ldda	[%l7 + %i3] 0xeb,	%l2
	tne	%xcc,	0x0
	sdivx	%o4,	0x0DFE,	%o3
	ldsw	[%l7 + 0x7C],	%g2
	movle	%icc,	%l1,	%o7
	movn	%icc,	%g5,	%l6
	fcmpgt32	%f12,	%f12,	%i6
	fand	%f14,	%f26,	%f14
	sub	%l4,	0x0963,	%i5
	fmuld8sux16	%f28,	%f8,	%f20
	fbug	%fcc1,	loop_2866
	brgez,a	%o6,	loop_2867
	fandnot1s	%f18,	%f11,	%f24
	fcmped	%fcc0,	%f24,	%f26
loop_2866:
	taddcc	%o0,	%g4,	%l5
loop_2867:
	flush	%l7 + 0x64
	edge16	%g6,	%i3,	%i2
	movrgez	%i4,	%i0,	%i7
	swap	[%l7 + 0x3C],	%g3
	nop
	setx loop_2868, %l0, %l1
	jmpl %l1, %o2
	mulx	%l0,	0x1F63,	%o5
	fmovsgu	%icc,	%f17,	%f21
	fpackfix	%f14,	%f14
loop_2868:
	fmuld8sux16	%f14,	%f2,	%f30
	tg	%icc,	0x6
	tpos	%icc,	0x5
	fmovrse	%l2,	%f28,	%f5
	nop
	setx loop_2869, %l0, %l1
	jmpl %l1, %o1
	fbule	%fcc3,	loop_2870
	fblg,a	%fcc2,	loop_2871
	movrlz	%i1,	%g7,	%l3
loop_2869:
	fpackfix	%f12,	%f30
loop_2870:
	array16	%g1,	%o4,	%g2
loop_2871:
	fpsub16s	%f10,	%f22,	%f3
	xor	%o3,	%l1,	%g5
	tcs	%xcc,	0x4
	movge	%icc,	%l6,	%o7
	taddcctv	%i6,	%l4,	%i5
	popc	0x0D6D,	%o0
	fsrc1	%f4,	%f20
	movre	%o6,	0x312,	%l5
	fble	%fcc0,	loop_2872
	fnand	%f22,	%f10,	%f0
	fmovdle	%xcc,	%f7,	%f26
	fmul8x16al	%f17,	%f28,	%f10
loop_2872:
	nop
	set	0x40, %i7
	ldda	[%l7 + %i7] 0x89,	%f16
	tg	%xcc,	0x3
	wr	%g0,	0x10,	%asi
	swapa	[%l7 + 0x54] %asi,	%g6
	fmovde	%icc,	%f4,	%f21
	alignaddrl	%i3,	%i2,	%g4
	fpadd32s	%f27,	%f18,	%f30
	movleu	%xcc,	%i4,	%i0
	fbne	%fcc0,	loop_2873
	ba,pt	%icc,	loop_2874
	tl	%xcc,	0x0
	brz,a	%i7,	loop_2875
loop_2873:
	andn	%o2,	0x1B59,	%l0
loop_2874:
	xnorcc	%o5,	%g3,	%l2
	xnor	%i1,	0x02FC,	%o1
loop_2875:
	subccc	%l3,	%g7,	%g1
	movre	%g2,	0x37A,	%o4
	edge16n	%o3,	%l1,	%g5
	fmovdge	%icc,	%f31,	%f13
	subc	%l6,	0x0E77,	%o7
	wr	%g0,	0x11,	%asi
	lduba	[%l7 + 0x34] %asi,	%i6
	sdiv	%i5,	0x1D7A,	%l4
	stw	%o6,	[%l7 + 0x5C]
	movrgez	%o0,	%l5,	%i3
	fsrc2s	%f25,	%f30
	fmul8x16	%f26,	%f10,	%f14
	membar	#Sync
	set	0x40, %i0
	ldda	[%l7 + %i0] 0x1f,	%f0
	nop
	set	0x1A, %l6
	ldstub	[%l7 + %l6],	%i2
	fsrc2s	%f19,	%f6
	fabsd	%f22,	%f20
	tge	%xcc,	0x4
	array8	%g6,	%i4,	%i0
	set	0x08, %o3
	ldswa	[%l7 + %o3] 0x80,	%g4
	movcs	%xcc,	%i7,	%l0
	srax	%o2,	0x0B,	%g3
	smul	%o5,	0x0C81,	%i1
	fxors	%f9,	%f28,	%f31
	fba,a	%fcc2,	loop_2876
	edge16n	%l2,	%l3,	%o1
	fbo	%fcc3,	loop_2877
	fsrc1	%f0,	%f18
loop_2876:
	movrgz	%g1,	0x0E9,	%g7
	sir	0x0413
loop_2877:
	fmovscc	%icc,	%f6,	%f5
	edge32ln	%g2,	%o3,	%l1
	wr	%g0,	0xe3,	%asi
	stda	%g4,	[%l7 + 0x78] %asi
	membar	#Sync
	fandnot2	%f4,	%f24,	%f22
	tl	%icc,	0x4
	movle	%icc,	%l6,	%o7
	edge32ln	%o4,	%i5,	%l4
	movrgez	%o6,	%o0,	%i6
	tneg	%xcc,	0x4
	wr	%g0,	0x10,	%asi
	ldda	[%l7 + 0x10] %asi,	%i2
	udivcc	%i2,	0x1013,	%l5
	edge8l	%g6,	%i0,	%g4
	move	%icc,	%i4,	%l0
	ldstub	[%l7 + 0x43],	%i7
	mulx	%o2,	0x0519,	%o5
	fpsub32s	%f22,	%f22,	%f24
	set	0x28, %g5
	ldstuba	[%l7 + %g5] 0x0c,	%i1
	fsrc2s	%f3,	%f9
	fzeros	%f19
	edge8ln	%l2,	%l3,	%g3
	movrlez	%o1,	0x0A5,	%g7
	fpmerge	%f31,	%f16,	%f10
	alignaddr	%g2,	%o3,	%g1
	movvs	%icc,	%l1,	%l6
	add	%o7,	0x0386,	%g5
	array8	%i5,	%o4,	%o6
	fsrc1	%f16,	%f16
	bne,a,pt	%xcc,	loop_2878
	array16	%o0,	%l4,	%i3
	xorcc	%i2,	0x1FD0,	%i6
	fandnot2s	%f18,	%f5,	%f12
loop_2878:
	addccc	%g6,	%i0,	%l5
	fmul8x16au	%f22,	%f22,	%f10
	udivx	%g4,	0x1EF3,	%i4
	brz	%i7,	loop_2879
	edge8	%l0,	%o2,	%i1
	fbul,a	%fcc1,	loop_2880
	edge8n	%o5,	%l2,	%g3
loop_2879:
	movrlez	%l3,	%o1,	%g2
	movle	%icc,	%g7,	%g1
loop_2880:
	addcc	%o3,	%l6,	%l1
	move	%icc,	%g5,	%o7
	mulx	%o4,	0x01CA,	%o6
	array32	%i5,	%o0,	%l4
	wr	%g0,	0x89,	%asi
	ldxa	[%l7 + 0x40] %asi,	%i3
	array8	%i6,	%i2,	%g6
	tge	%icc,	0x5
	movne	%icc,	%i0,	%g4
	call	loop_2881
	movleu	%icc,	%l5,	%i4
	fcmpd	%fcc3,	%f30,	%f10
	set	0x60, %l2
	stwa	%l0,	[%l7 + %l2] 0x14
loop_2881:
	nop
	set	0x7F, %l1
	ldsba	[%l7 + %l1] 0x15,	%o2
	fblg,a	%fcc3,	loop_2882
	fmovse	%xcc,	%f22,	%f6
	tsubcctv	%i7,	0x0A17,	%o5
	bleu,a,pn	%xcc,	loop_2883
loop_2882:
	tvc	%xcc,	0x1
	edge16n	%i1,	%g3,	%l2
	movleu	%icc,	%o1,	%l3
loop_2883:
	fcmple16	%f22,	%f30,	%g2
	ba	loop_2884
	or	%g7,	%g1,	%o3
	sir	0x0ABD
	andcc	%l1,	%l6,	%g5
loop_2884:
	tsubcctv	%o7,	%o4,	%i5
	fbne,a	%fcc0,	loop_2885
	tleu	%xcc,	0x0
	sllx	%o6,	%l4,	%o0
	addc	%i6,	0x10A5,	%i3
loop_2885:
	sll	%g6,	%i0,	%g4
	fandnot1s	%f19,	%f19,	%f24
	ldstub	[%l7 + 0x13],	%i2
	fmuld8ulx16	%f24,	%f2,	%f2
	ldsb	[%l7 + 0x6F],	%i4
	srlx	%l5,	%o2,	%l0
	srlx	%o5,	0x01,	%i1
	fnand	%f24,	%f22,	%f26
	orn	%i7,	%l2,	%o1
	mulscc	%l3,	0x0950,	%g3
	fpmerge	%f7,	%f14,	%f4
	tsubcctv	%g2,	%g7,	%g1
	wr	%g0,	0x18,	%asi
	stwa	%l1,	[%l7 + 0x24] %asi
	fpack32	%f24,	%f24,	%f4
	fmovsne	%xcc,	%f2,	%f10
	fxnor	%f16,	%f16,	%f8
	edge8l	%o3,	%l6,	%g5
	wr	%g0,	0x0c,	%asi
	lduwa	[%l7 + 0x14] %asi,	%o4
	edge8l	%o7,	%i5,	%o6
	sdiv	%o0,	0x11B6,	%l4
	edge32ln	%i3,	%g6,	%i0
	movrlz	%i6,	%g4,	%i4
	ta	%icc,	0x5
	fcmps	%fcc2,	%f3,	%f25
	fmovrdlez	%l5,	%f6,	%f24
	fands	%f0,	%f21,	%f5
	brnz	%i2,	loop_2886
	bcs,a	%xcc,	loop_2887
	fmovdl	%xcc,	%f14,	%f14
	tcc	%xcc,	0x3
loop_2886:
	udivcc	%o2,	0x13AC,	%l0
loop_2887:
	nop
	set	0x40, %o5
	stda	%f16,	[%l7 + %o5] 0xf0
	membar	#Sync
	fmovdpos	%xcc,	%f29,	%f10
	xnorcc	%i1,	0x1A88,	%o5
	sth	%i7,	[%l7 + 0x4C]
	edge8l	%o1,	%l3,	%g3
	edge16n	%g2,	%l2,	%g1
	tgu	%icc,	0x6
	edge8ln	%g7,	%o3,	%l1
	bvs,a,pt	%xcc,	loop_2888
	tl	%xcc,	0x1
	tge	%icc,	0x7
	bl,a	%xcc,	loop_2889
loop_2888:
	subcc	%g5,	%o4,	%l6
	brnz,a	%o7,	loop_2890
	ldub	[%l7 + 0x78],	%o6
loop_2889:
	movneg	%icc,	%i5,	%l4
	subcc	%i3,	%g6,	%o0
loop_2890:
	tge	%xcc,	0x1
	fpsub16	%f26,	%f16,	%f24
	brlz	%i6,	loop_2891
	bvs,a,pn	%icc,	loop_2892
	subc	%i0,	%g4,	%l5
	sub	%i2,	%o2,	%l0
loop_2891:
	tle	%icc,	0x5
loop_2892:
	andcc	%i1,	%o5,	%i4
	fandnot2s	%f9,	%f27,	%f1
	and	%o1,	%i7,	%l3
	tsubcc	%g3,	0x03C1,	%l2
	tvs	%icc,	0x1
	add	%g2,	%g1,	%g7
	tg	%xcc,	0x4
	movre	%l1,	%o3,	%o4
	movgu	%icc,	%g5,	%o7
	brgez	%l6,	loop_2893
	edge32n	%o6,	%l4,	%i3
	ldsh	[%l7 + 0x72],	%i5
	nop
	setx loop_2894, %l0, %l1
	jmpl %l1, %o0
loop_2893:
	movg	%xcc,	%g6,	%i0
	fmovdvs	%icc,	%f23,	%f4
	fbule,a	%fcc2,	loop_2895
loop_2894:
	ble,a,pt	%icc,	loop_2896
	fmovdne	%icc,	%f1,	%f8
	edge16n	%g4,	%l5,	%i6
loop_2895:
	fmovsl	%xcc,	%f20,	%f5
loop_2896:
	sdiv	%o2,	0x000D,	%l0
	fbue	%fcc1,	loop_2897
	xorcc	%i2,	%o5,	%i4
	fmovdvs	%icc,	%f0,	%f20
	set	0x78, %g1
	lda	[%l7 + %g1] 0x89,	%f23
loop_2897:
	tge	%xcc,	0x1
	be,a	%icc,	loop_2898
	fnegs	%f17,	%f23
	swap	[%l7 + 0x24],	%o1
	fbug	%fcc1,	loop_2899
loop_2898:
	udivcc	%i7,	0x124E,	%l3
	sll	%i1,	%l2,	%g2
	fxors	%f19,	%f30,	%f27
loop_2899:
	movrlez	%g3,	0x19C,	%g7
	edge32ln	%g1,	%o3,	%o4
	fmovrsgez	%l1,	%f26,	%f31
	fmuld8sux16	%f9,	%f30,	%f4
	fnegd	%f22,	%f30
	sdivcc	%o7,	0x14FA,	%g5
	set	0x60, %i6
	prefetcha	[%l7 + %i6] 0x88,	 0x1
	srl	%l4,	%i3,	%o6
	fblg	%fcc2,	loop_2900
	orncc	%o0,	%i5,	%g6
	fcmple32	%f10,	%f12,	%g4
	smulcc	%i0,	0x0483,	%i6
loop_2900:
	nop
	set	0x54, %l0
	lda	[%l7 + %l0] 0x15,	%f13
	array16	%o2,	%l0,	%l5
	popc	%i2,	%o5
	bcc,pn	%icc,	loop_2901
	fpadd32	%f0,	%f20,	%f22
	movcs	%icc,	%o1,	%i7
	fnot1s	%f11,	%f19
loop_2901:
	fba,a	%fcc2,	loop_2902
	movg	%icc,	%i4,	%l3
	movrgz	%i1,	%g2,	%l2
	fcmpgt16	%f0,	%f16,	%g3
loop_2902:
	array8	%g1,	%g7,	%o4
	subccc	%o3,	0x0A73,	%l1
	bge,pt	%xcc,	loop_2903
	srl	%o7,	0x1A,	%l6
	set	0x2A, %o2
	stha	%l4,	[%l7 + %o2] 0x89
loop_2903:
	edge16ln	%g5,	%o6,	%i3
	movleu	%xcc,	%o0,	%g6
	fbue	%fcc0,	loop_2904
	ldstub	[%l7 + 0x28],	%g4
	movrgez	%i0,	%i6,	%o2
	bpos,a,pn	%xcc,	loop_2905
loop_2904:
	bpos	%xcc,	loop_2906
	movrlez	%l0,	0x172,	%i5
	fbu,a	%fcc1,	loop_2907
loop_2905:
	sdivcc	%i2,	0x1645,	%l5
loop_2906:
	fba	%fcc2,	loop_2908
	fmovsle	%xcc,	%f17,	%f10
loop_2907:
	movrlz	%o1,	%o5,	%i4
	fpmerge	%f21,	%f27,	%f10
loop_2908:
	fbn,a	%fcc1,	loop_2909
	sll	%i7,	0x0D,	%i1
	fpmerge	%f27,	%f25,	%f6
	smulcc	%g2,	0x1DF9,	%l2
loop_2909:
	srax	%l3,	%g1,	%g7
	stw	%g3,	[%l7 + 0x54]
	move	%xcc,	%o3,	%o4
	alignaddr	%l1,	%o7,	%l4
	subc	%g5,	%l6,	%i3
	be	loop_2910
	sdivx	%o0,	0x0526,	%o6
	fmovsl	%icc,	%f2,	%f21
	sdivcc	%g4,	0x0332,	%g6
loop_2910:
	orncc	%i0,	0x06EB,	%i6
	set	0x70, %g2
	ldswa	[%l7 + %g2] 0x18,	%l0
	movle	%icc,	%i5,	%o2
	fble,a	%fcc3,	loop_2911
	ldstub	[%l7 + 0x43],	%i2
	edge16l	%o1,	%o5,	%i4
	edge8n	%l5,	%i7,	%g2
loop_2911:
	te	%icc,	0x5
	tvs	%icc,	0x7
	fsrc2s	%f14,	%f8
	andncc	%i1,	%l3,	%g1
	mova	%icc,	%g7,	%g3
	brlz	%o3,	loop_2912
	fmovrsgz	%o4,	%f3,	%f18
	bcs,pt	%xcc,	loop_2913
	ld	[%l7 + 0x28],	%f2
loop_2912:
	fbue,a	%fcc1,	loop_2914
	swap	[%l7 + 0x1C],	%l1
loop_2913:
	ldsb	[%l7 + 0x55],	%l2
	fands	%f28,	%f30,	%f29
loop_2914:
	fmovdgu	%icc,	%f16,	%f12
	fmovsle	%icc,	%f10,	%f8
	fblg,a	%fcc3,	loop_2915
	fbl,a	%fcc3,	loop_2916
	ldstub	[%l7 + 0x16],	%l4
	fornot1s	%f10,	%f11,	%f19
loop_2915:
	movpos	%xcc,	%g5,	%l6
loop_2916:
	xnorcc	%i3,	0x0E6A,	%o0
	fpackfix	%f12,	%f15
	addccc	%o6,	0x1EEC,	%g4
	tne	%xcc,	0x3
	fmovsle	%icc,	%f27,	%f27
	fmovde	%icc,	%f28,	%f14
	sethi	0x0A07,	%o7
	tge	%icc,	0x6
	tle	%xcc,	0x7
	umul	%i0,	0x07AF,	%g6
	edge32l	%l0,	%i5,	%i6
	orncc	%i2,	0x1D08,	%o1
	andn	%o2,	%i4,	%l5
	fcmpes	%fcc1,	%f31,	%f6
	ba,pn	%icc,	loop_2917
	fmuld8sux16	%f18,	%f23,	%f12
	movre	%i7,	%g2,	%i1
	fands	%f2,	%f5,	%f27
loop_2917:
	bge,a	%icc,	loop_2918
	tvc	%xcc,	0x7
	ldsw	[%l7 + 0x7C],	%l3
	fand	%f4,	%f28,	%f24
loop_2918:
	orn	%g1,	%o5,	%g7
	edge32ln	%o3,	%g3,	%l1
	lduh	[%l7 + 0x3C],	%l2
	bgu,a	loop_2919
	nop
	set	0x10, %g3
	std	%l4,	[%l7 + %g3]
	array32	%o4,	%g5,	%l6
	wr	%g0,	0x24,	%asi
	ldda	[%l7 + 0x10] %asi,	%i2
loop_2919:
	movcc	%icc,	%o6,	%o0
	tneg	%icc,	0x6
	tn	%xcc,	0x6
	move	%xcc,	%g4,	%i0
	movrgz	%o7,	0x24C,	%l0
	andcc	%g6,	%i6,	%i5
	alignaddrl	%o1,	%i2,	%o2
	sub	%l5,	0x13C4,	%i7
	movpos	%icc,	%i4,	%i1
	tgu	%xcc,	0x7
	mulscc	%g2,	0x02A7,	%l3
	or	%o5,	%g1,	%o3
	andn	%g7,	%g3,	%l1
	fmovrdlez	%l4,	%f2,	%f28
	sethi	0x0381,	%l2
	tl	%icc,	0x1
	fone	%f28
	fmovrdlz	%o4,	%f12,	%f16
	udiv	%l6,	0x0AF1,	%i3
	xnorcc	%o6,	0x0D89,	%g5
	edge8n	%o0,	%g4,	%o7
	fmovse	%xcc,	%f0,	%f2
	xnor	%i0,	0x19E5,	%l0
	fblg	%fcc2,	loop_2920
	sdivx	%g6,	0x13A6,	%i6
	fmovdge	%xcc,	%f29,	%f31
	movg	%xcc,	%i5,	%i2
loop_2920:
	fpack32	%f24,	%f30,	%f20
	sll	%o2,	%o1,	%l5
	tvc	%xcc,	0x0
	ldsw	[%l7 + 0x60],	%i4
	alignaddrl	%i1,	%g2,	%l3
	ldub	[%l7 + 0x44],	%i7
	bneg,a	loop_2921
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array8	%o5,	%g1,	%g7
	edge8	%o3,	%l1,	%l4
loop_2921:
	brgez	%g3,	loop_2922
	movrlez	%o4,	0x12D,	%l6
	umul	%l2,	%o6,	%i3
	movcs	%icc,	%o0,	%g4
loop_2922:
	lduw	[%l7 + 0x78],	%o7
	movvc	%xcc,	%i0,	%g5
	wr	%g0,	0x04,	%asi
	stwa	%g6,	[%l7 + 0x28] %asi
	bn	loop_2923
	movgu	%icc,	%l0,	%i6
	sllx	%i2,	0x0B,	%i5
	fbg	%fcc3,	loop_2924
loop_2923:
	tsubcc	%o1,	0x1AFC,	%o2
	mova	%icc,	%i4,	%i1
	fcmpgt32	%f30,	%f22,	%l5
loop_2924:
	taddcc	%g2,	%l3,	%i7
	array32	%g1,	%o5,	%o3
	fmovsgu	%icc,	%f18,	%f11
	movrlez	%l1,	%g7,	%g3
	sll	%o4,	0x0A,	%l4
	lduh	[%l7 + 0x6A],	%l6
	smul	%l2,	%i3,	%o6
	fmovsl	%icc,	%f11,	%f26
	edge32n	%g4,	%o7,	%o0
	smulcc	%i0,	%g5,	%l0
	set	0x20, %o0
	ldsba	[%l7 + %o0] 0x81,	%i6
	movn	%xcc,	%g6,	%i5
	edge32ln	%i2,	%o1,	%i4
	addc	%i1,	%l5,	%g2
	edge16	%l3,	%i7,	%g1
	xnorcc	%o5,	0x116C,	%o2
	udiv	%l1,	0x1EC9,	%o3
	fmovs	%f8,	%f30
	fmovdg	%icc,	%f2,	%f4
	movrgez	%g7,	0x2D1,	%o4
	movleu	%icc,	%l4,	%g3
	fnand	%f10,	%f8,	%f16
	fcmpeq32	%f8,	%f16,	%l6
	fbule	%fcc0,	loop_2925
	xorcc	%i3,	%o6,	%l2
	edge16n	%o7,	%g4,	%i0
	fmovdpos	%icc,	%f5,	%f18
loop_2925:
	udivcc	%g5,	0x0F6F,	%o0
	set	0x0C, %g7
	swapa	[%l7 + %g7] 0x88,	%l0
	st	%f28,	[%l7 + 0x24]
	for	%f10,	%f2,	%f22
	subccc	%i6,	0x1574,	%i5
	xor	%g6,	0x1FE8,	%i2
	fmovrsgz	%o1,	%f14,	%f27
	mulscc	%i4,	%i1,	%g2
	membar	0x15
	fabss	%f15,	%f31
	fmovscs	%xcc,	%f4,	%f21
	bgu,pt	%icc,	loop_2926
	fmovsneg	%xcc,	%f5,	%f10
	fornot1s	%f10,	%f23,	%f13
	mova	%xcc,	%l3,	%i7
loop_2926:
	orncc	%l5,	0x1C9C,	%o5
	fands	%f1,	%f5,	%f31
	movrgz	%g1,	%l1,	%o2
	tneg	%xcc,	0x1
	popc	0x1716,	%o3
	mulx	%o4,	0x0422,	%l4
	fmovdvc	%icc,	%f12,	%f10
	edge16	%g3,	%g7,	%i3
	fmuld8sux16	%f17,	%f29,	%f14
	and	%o6,	%l6,	%o7
	wr	%g0,	0x11,	%asi
	prefetcha	[%l7 + 0x60] %asi,	 0x2
	bcs	loop_2927
	sir	0x027E
	edge16l	%l2,	%g5,	%i0
	bpos,pt	%xcc,	loop_2928
loop_2927:
	movrlez	%l0,	%o0,	%i5
	udiv	%g6,	0x1144,	%i2
	bneg	loop_2929
loop_2928:
	movre	%o1,	0x301,	%i4
	alignaddrl	%i6,	%g2,	%l3
	te	%icc,	0x2
loop_2929:
	fnot1s	%f20,	%f6
	alignaddrl	%i7,	%i1,	%l5
	sdivx	%o5,	0x1AF3,	%g1
	smulcc	%l1,	0x155C,	%o2
	fblg,a	%fcc1,	loop_2930
	tcc	%xcc,	0x2
	tn	%icc,	0x0
	set	0x10, %l3
	ldda	[%l7 + %l3] 0x2b,	%o4
loop_2930:
	edge32ln	%o3,	%g3,	%l4
	sub	%i3,	0x046F,	%o6
	tsubcctv	%l6,	%g7,	%o7
	set	0x30, %o4
	ldda	[%l7 + %o4] 0x22,	%l2
	tcc	%xcc,	0x2
	movn	%xcc,	%g5,	%i0
	smulcc	%l0,	%o0,	%g4
	popc	%i5,	%i2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x88,	%asi
	lduha	[%l7 + 0x20] %asi,	%o1
	xorcc	%g6,	0x01C6,	%i6
	tvc	%xcc,	0x4
	fbule	%fcc1,	loop_2931
	edge32ln	%i4,	%l3,	%i7
	stb	%i1,	[%l7 + 0x43]
	fnegs	%f26,	%f6
loop_2931:
	fbul	%fcc0,	loop_2932
	fblg,a	%fcc3,	loop_2933
	fpadd16s	%f14,	%f30,	%f3
	addcc	%g2,	0x0379,	%l5
loop_2932:
	movrlez	%o5,	0x1B1,	%g1
loop_2933:
	sub	%l1,	0x0A71,	%o4
	mulscc	%o2,	0x0B1D,	%o3
	fsrc1	%f6,	%f24
	umul	%g3,	%l4,	%i3
	move	%xcc,	%l6,	%g7
	fbuge,a	%fcc3,	loop_2934
	array16	%o6,	%l2,	%o7
	ble,pt	%xcc,	loop_2935
	swap	[%l7 + 0x64],	%i0
loop_2934:
	movcs	%icc,	%g5,	%l0
	edge16n	%o0,	%i5,	%i2
loop_2935:
	st	%f5,	[%l7 + 0x48]
	add	%g4,	%g6,	%o1
	umulcc	%i4,	%i6,	%i7
	bg,a,pn	%xcc,	loop_2936
	ble,pn	%xcc,	loop_2937
	addccc	%l3,	%i1,	%g2
	fnot1s	%f12,	%f4
loop_2936:
	fnot2s	%f6,	%f29
loop_2937:
	xnor	%l5,	%o5,	%g1
	bvs,pn	%icc,	loop_2938
	addccc	%l1,	%o4,	%o2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x04,	%asi
	ldxa	[%l7 + 0x58] %asi,	%g3
loop_2938:
	bne,pt	%xcc,	loop_2939
	bneg,a	loop_2940
	orn	%l4,	0x16AE,	%o3
	alignaddr	%i3,	%l6,	%g7
loop_2939:
	movcc	%icc,	%o6,	%o7
loop_2940:
	fnot2	%f22,	%f22
	fbuge	%fcc1,	loop_2941
	fble,a	%fcc0,	loop_2942
	sdivx	%l2,	0x1A72,	%g5
	bne,a,pn	%xcc,	loop_2943
loop_2941:
	movvc	%xcc,	%i0,	%l0
loop_2942:
	movn	%xcc,	%i5,	%i2
	movn	%icc,	%g4,	%g6
loop_2943:
	nop
	wr	%g0,	0x04,	%asi
	stha	%o0,	[%l7 + 0x6E] %asi
	movneg	%xcc,	%o1,	%i6
	fba	%fcc1,	loop_2944
	movge	%icc,	%i7,	%i4
	wr	%g0,	0x81,	%asi
	lduba	[%l7 + 0x32] %asi,	%l3
loop_2944:
	membar	0x1D
	wr	%g0,	0x80,	%asi
	ldstuba	[%l7 + 0x31] %asi,	%g2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xorcc	%l5,	0x0CB1,	%o5
	lduw	[%l7 + 0x14],	%g1
	smul	%l1,	%o4,	%i1
	edge32ln	%o2,	%l4,	%g3
	movleu	%xcc,	%o3,	%i3
	stb	%l6,	[%l7 + 0x6D]
	andcc	%o6,	0x142B,	%o7
	fzeros	%f31
	nop
	set	0x20, %o7
	std	%g6,	[%l7 + %o7]
	add	%l2,	0x1CE2,	%i0
	fmovscs	%icc,	%f14,	%f26
	movcs	%xcc,	%l0,	%g5
	andncc	%i2,	%g4,	%g6
	tgu	%icc,	0x5
	sllx	%i5,	0x03,	%o0
	fmovrdgez	%i6,	%f22,	%f8
	nop
	set	0x20, %i4
	ldx	[%l7 + %i4],	%i7
	sethi	0x0277,	%o1
	sllx	%i4,	%g2,	%l5
	xnorcc	%o5,	%g1,	%l3
	fmovdne	%xcc,	%f1,	%f7
	udiv	%l1,	0x18C1,	%o4
	umul	%o2,	%l4,	%i1
	std	%f16,	[%l7 + 0x68]
	addcc	%g3,	0x0048,	%i3
	tcc	%icc,	0x5
	movg	%xcc,	%o3,	%o6
	tsubcctv	%o7,	%g7,	%l6
	smul	%i0,	0x1268,	%l2
	addcc	%g5,	%l0,	%g4
	edge16l	%g6,	%i2,	%i5
	fpsub32	%f4,	%f2,	%f8
	fcmpes	%fcc2,	%f16,	%f28
	nop
	setx	loop_2945,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	edge16l	%o0,	%i6,	%i7
	addccc	%o1,	%i4,	%g2
	edge16n	%o5,	%g1,	%l5
loop_2945:
	array32	%l1,	%o4,	%l3
	movrne	%l4,	0x0DF,	%o2
	tvs	%icc,	0x4
	edge8ln	%g3,	%i3,	%o3
	sdivcc	%i1,	0x04EF,	%o6
	fmovdl	%icc,	%f24,	%f25
	subccc	%g7,	%o7,	%l6
	ldsh	[%l7 + 0x0E],	%i0
	fpadd32	%f6,	%f0,	%f0
	bcc,a	%icc,	loop_2946
	fbn,a	%fcc0,	loop_2947
	sdivcc	%l2,	0x1479,	%l0
	tleu	%xcc,	0x4
loop_2946:
	tpos	%xcc,	0x0
loop_2947:
	xnorcc	%g5,	%g4,	%g6
	movre	%i2,	%i5,	%i6
	fnot1	%f6,	%f6
	tleu	%icc,	0x4
	tn	%xcc,	0x4
	edge16ln	%i7,	%o1,	%o0
	bshuffle	%f22,	%f20,	%f10
	xnor	%g2,	%i4,	%g1
	tneg	%icc,	0x7
	wr	%g0,	0x2f,	%asi
	stha	%l5,	[%l7 + 0x08] %asi
	membar	#Sync
	sdivx	%l1,	0x036C,	%o4
	fnor	%f26,	%f14,	%f0
	andncc	%l3,	%o5,	%o2
	fmul8x16au	%f2,	%f1,	%f18
	fbule,a	%fcc3,	loop_2948
	udiv	%g3,	0x1485,	%i3
	mulscc	%o3,	%i1,	%o6
	tcc	%icc,	0x0
loop_2948:
	srl	%g7,	0x09,	%o7
	move	%xcc,	%l6,	%i0
	edge32n	%l2,	%l4,	%g5
	orncc	%l0,	%g4,	%i2
	membar	#Sync
	wr	%g0,	0xf1,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	orncc	%g6,	%i5,	%i7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmul8ulx16	%f16,	%f26,	%f28
	fand	%f16,	%f30,	%f28
	xnorcc	%o1,	0x0C56,	%o0
	set	0x40, %i1
	ldda	[%l7 + %i1] 0x18,	%f0
	lduw	[%l7 + 0x40],	%i6
	ldsb	[%l7 + 0x4F],	%i4
	srlx	%g1,	%l5,	%g2
	srax	%o4,	%l1,	%o5
	tsubcctv	%l3,	%o2,	%g3
	tcs	%xcc,	0x3
	wr	%g0,	0x18,	%asi
	ldstuba	[%l7 + 0x5C] %asi,	%o3
	wr	%g0,	0xe2,	%asi
	stha	%i3,	[%l7 + 0x44] %asi
	membar	#Sync
	movcs	%icc,	%o6,	%i1
	fcmpne32	%f8,	%f6,	%g7
	sdivx	%l6,	0x15CC,	%i0
	popc	%l2,	%o7
	tpos	%xcc,	0x6
	sdivx	%l4,	0x061F,	%l0
	te	%icc,	0x3
	fbne	%fcc2,	loop_2949
	tcs	%xcc,	0x3
	fnot1	%f10,	%f16
	subccc	%g4,	%i2,	%g6
loop_2949:
	subccc	%g5,	0x08AF,	%i5
	subcc	%o1,	%i7,	%i6
	or	%o0,	%i4,	%l5
	lduh	[%l7 + 0x12],	%g1
	tvc	%icc,	0x6
	tvs	%xcc,	0x5
	set	0x58, %g6
	sta	%f17,	[%l7 + %g6] 0x04
	movrne	%g2,	0x13D,	%l1
	fba	%fcc1,	loop_2950
	nop
	setx	loop_2951,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fmovdneg	%icc,	%f19,	%f8
	fbge	%fcc1,	loop_2952
loop_2950:
	tle	%xcc,	0x1
loop_2951:
	xorcc	%o5,	0x0568,	%l3
	fmul8ulx16	%f4,	%f26,	%f4
loop_2952:
	srlx	%o2,	%g3,	%o3
	bvc,a	%xcc,	loop_2953
	alignaddr	%o4,	%i3,	%i1
	fbu,a	%fcc1,	loop_2954
	fexpand	%f6,	%f14
loop_2953:
	array8	%o6,	%g7,	%i0
	fsrc2s	%f6,	%f13
loop_2954:
	sub	%l2,	%o7,	%l6
	movvc	%icc,	%l0,	%g4
	alignaddrl	%l4,	%i2,	%g5
	tvs	%icc,	0x5
	tsubcc	%g6,	%o1,	%i5
	fmovrsgez	%i6,	%f28,	%f26
	subc	%i7,	0x0283,	%o0
	bge,a	loop_2955
	fbuge	%fcc0,	loop_2956
	fmovrdne	%i4,	%f16,	%f16
	mulx	%g1,	%l5,	%l1
loop_2955:
	fone	%f4
loop_2956:
	tg	%icc,	0x2
	pdist	%f30,	%f2,	%f24
	edge8l	%g2,	%l3,	%o5
	edge32ln	%g3,	%o3,	%o4
	srlx	%o2,	%i3,	%o6
	udivcc	%g7,	0x093F,	%i0
	fmovrdlez	%l2,	%f12,	%f20
	fbul,a	%fcc0,	loop_2957
	xor	%o7,	%l6,	%l0
	xnorcc	%i1,	%l4,	%i2
	edge8	%g4,	%g6,	%o1
loop_2957:
	fmovsl	%xcc,	%f18,	%f31
	sdiv	%g5,	0x162D,	%i6
	addccc	%i7,	0x11CF,	%i5
	sdiv	%o0,	0x1C8A,	%g1
	fmovdcs	%icc,	%f11,	%f5
	udivcc	%l5,	0x0727,	%i4
	srax	%l1,	0x03,	%l3
	fmul8x16	%f19,	%f18,	%f8
	srl	%g2,	%o5,	%o3
	movl	%xcc,	%g3,	%o2
	movrlz	%i3,	%o6,	%o4
	movrlz	%g7,	0x0A8,	%l2
	brgz	%o7,	loop_2958
	brnz,a	%l6,	loop_2959
	bneg,pt	%icc,	loop_2960
	ldsw	[%l7 + 0x44],	%l0
loop_2958:
	fmul8x16au	%f7,	%f22,	%f8
loop_2959:
	array16	%i1,	%i0,	%l4
loop_2960:
	subccc	%g4,	%i2,	%o1
	ldd	[%l7 + 0x30],	%g6
	edge8ln	%g5,	%i6,	%i5
	fsrc2	%f18,	%f10
	andncc	%o0,	%i7,	%g1
	st	%f20,	[%l7 + 0x50]
	bn	%icc,	loop_2961
	movneg	%icc,	%i4,	%l1
	udiv	%l5,	0x0AA4,	%l3
	xnorcc	%g2,	0x174D,	%o3
loop_2961:
	or	%o5,	%o2,	%g3
	fbug	%fcc1,	loop_2962
	fmovsleu	%icc,	%f9,	%f23
	movrgez	%i3,	%o6,	%o4
	edge32n	%l2,	%g7,	%l6
loop_2962:
	fnand	%f12,	%f16,	%f30
	movn	%icc,	%o7,	%i1
	tleu	%xcc,	0x0
	bgu,a	loop_2963
	movpos	%xcc,	%l0,	%i0
	faligndata	%f0,	%f8,	%f14
	edge16n	%l4,	%g4,	%i2
loop_2963:
	fpsub32	%f28,	%f20,	%f30
	fbne	%fcc2,	loop_2964
	stb	%g6,	[%l7 + 0x77]
	movleu	%icc,	%g5,	%i6
	edge32n	%i5,	%o1,	%i7
loop_2964:
	fmovrdne	%o0,	%f6,	%f4
	add	%i4,	%g1,	%l5
	tsubcc	%l1,	%g2,	%l3
	fornot1s	%f20,	%f24,	%f23
	srax	%o5,	%o2,	%g3
	edge8n	%i3,	%o3,	%o4
	subcc	%o6,	%l2,	%g7
	udivx	%o7,	0x1E30,	%l6
	movneg	%icc,	%i1,	%i0
	edge32n	%l0,	%l4,	%g4
	set	0x1C, %o6
	sta	%f12,	[%l7 + %o6] 0x19
	nop
	set	0x76, %l4
	ldsh	[%l7 + %l4],	%i2
	fmovdne	%xcc,	%f29,	%f29
	movvc	%icc,	%g5,	%i6
	and	%i5,	%g6,	%o1
	add	%i7,	%i4,	%o0
	fmul8x16	%f21,	%f24,	%f22
	sdiv	%g1,	0x19B5,	%l1
	movvs	%icc,	%g2,	%l5
	addc	%o5,	%l3,	%o2
	smul	%g3,	%i3,	%o4
	subcc	%o3,	0x07C3,	%l2
	movcc	%icc,	%g7,	%o6
	set	0x18, %i5
	lda	[%l7 + %i5] 0x80,	%f28
	edge16ln	%o7,	%i1,	%l6
	mova	%xcc,	%i0,	%l0
	fbu,a	%fcc3,	loop_2965
	fpack16	%f22,	%f18
	movre	%g4,	0x285,	%l4
	udiv	%i2,	0x15F7,	%i6
loop_2965:
	fmovrsne	%i5,	%f13,	%f10
	bneg,a,pt	%icc,	loop_2966
	subcc	%g5,	0x1E6D,	%o1
	orncc	%i7,	%i4,	%o0
	membar	#Sync
	set	0x40, %i2
	ldda	[%l7 + %i2] 0xf1,	%f16
loop_2966:
	te	%icc,	0x1
	sll	%g1,	0x14,	%l1
	fnegs	%f31,	%f0
	move	%xcc,	%g6,	%g2
	udiv	%o5,	0x0B8F,	%l5
	andncc	%l3,	%o2,	%i3
	fbuge	%fcc2,	loop_2967
	swap	[%l7 + 0x24],	%g3
	movle	%xcc,	%o4,	%o3
	fmovrslez	%l2,	%f19,	%f15
loop_2967:
	xorcc	%o6,	%g7,	%o7
	tne	%icc,	0x7
	popc	0x1499,	%i1
	fmul8x16au	%f23,	%f23,	%f26
	srlx	%l6,	0x1D,	%i0
	movcc	%icc,	%l0,	%g4
	popc	0x1EA1,	%i2
	fmovdvs	%xcc,	%f9,	%f0
	udivx	%i6,	0x0AB6,	%i5
	set	0x3C, %o1
	swapa	[%l7 + %o1] 0x80,	%l4
	umul	%o1,	0x1202,	%g5
	brlez,a	%i7,	loop_2968
	sra	%i4,	%g1,	%l1
	subc	%o0,	0x107F,	%g6
	edge16l	%o5,	%l5,	%g2
loop_2968:
	nop
	set	0x74, %l5
	lduw	[%l7 + %l5],	%l3
	edge16ln	%o2,	%g3,	%i3
	edge8n	%o3,	%l2,	%o4
	xnorcc	%g7,	0x192F,	%o6
	xnorcc	%i1,	%o7,	%l6
	mova	%xcc,	%l0,	%g4
	taddcctv	%i0,	0x17D8,	%i6
	fornot2	%f4,	%f12,	%f2
	srlx	%i2,	%l4,	%i5
	subc	%o1,	%i7,	%i4
	bl	loop_2969
	fbug,a	%fcc2,	loop_2970
	edge8ln	%g1,	%l1,	%g5
	wr	%g0,	0x88,	%asi
	ldsha	[%l7 + 0x7E] %asi,	%g6
loop_2969:
	or	%o5,	%o0,	%g2
loop_2970:
	fmovdneg	%icc,	%f26,	%f27
	wr	%g0,	0x2b,	%asi
	ldda	[%l7 + 0x30] %asi,	%l4
	fmovsneg	%xcc,	%f21,	%f4
	fmovsvs	%xcc,	%f11,	%f7
	fcmps	%fcc0,	%f5,	%f1
	tge	%icc,	0x0
	fmovsvc	%xcc,	%f7,	%f2
	ldsb	[%l7 + 0x1A],	%o2
	movneg	%xcc,	%g3,	%i3
	mova	%icc,	%o3,	%l3
	tcs	%icc,	0x0
	sethi	0x072D,	%o4
	and	%l2,	%g7,	%o6
	fmovrde	%i1,	%f16,	%f20
	subc	%o7,	0x1618,	%l0
	andn	%l6,	0x1F22,	%g4
	array32	%i0,	%i6,	%i2
	sra	%i5,	0x01,	%o1
	fzeros	%f15
	xorcc	%l4,	%i7,	%g1
	srlx	%l1,	%g5,	%i4
	be,pn	%icc,	loop_2971
	fba	%fcc3,	loop_2972
	movg	%icc,	%o5,	%g6
	fmovdg	%icc,	%f1,	%f4
loop_2971:
	movl	%xcc,	%o0,	%g2
loop_2972:
	addccc	%l5,	0x0ABC,	%g3
	subccc	%i3,	0x1C65,	%o2
	orncc	%l3,	0x10F7,	%o4
	fmovda	%xcc,	%f5,	%f25
	mulscc	%l2,	%o3,	%g7
	tne	%xcc,	0x7
	and	%o6,	%o7,	%l0
	edge16n	%l6,	%g4,	%i1
	te	%xcc,	0x0
	movrgez	%i6,	%i0,	%i2
	fbue,a	%fcc0,	loop_2973
	taddcc	%o1,	%i5,	%i7
	movneg	%xcc,	%g1,	%l1
	fmovspos	%icc,	%f22,	%f8
loop_2973:
	tcs	%icc,	0x6
	fcmpeq32	%f8,	%f20,	%l4
	smul	%g5,	0x11FA,	%i4
	fbne,a	%fcc0,	loop_2974
	bvc,a,pn	%xcc,	loop_2975
	movvs	%icc,	%o5,	%g6
	ta	%icc,	0x5
loop_2974:
	bneg,a,pn	%xcc,	loop_2976
loop_2975:
	nop
	setx	loop_2977,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fsrc1	%f14,	%f20
	fpackfix	%f0,	%f15
loop_2976:
	edge8ln	%o0,	%g2,	%l5
loop_2977:
	fble	%fcc3,	loop_2978
	movvc	%xcc,	%g3,	%i3
	sth	%l3,	[%l7 + 0x38]
	array32	%o2,	%l2,	%o4
loop_2978:
	andncc	%g7,	%o6,	%o7
	xnor	%o3,	%l0,	%g4
	array8	%i1,	%i6,	%i0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdvc	%icc,	%f8,	%f4
	set	0x28, %g4
	stda	%i6,	[%l7 + %g4] 0x2f
	membar	#Sync
	tvs	%xcc,	0x1
	wr	%g0,	0x2b,	%asi
	stda	%i2,	[%l7 + 0x68] %asi
	membar	#Sync
	movrlz	%o1,	%i7,	%g1
	subcc	%i5,	0x0B52,	%l1
	mulscc	%l4,	%g5,	%i4
	sth	%o5,	[%l7 + 0x40]
	be	loop_2979
	edge16n	%o0,	%g2,	%g6
	movrgez	%g3,	0x393,	%i3
	set	0x0, %i7
	stxa	%l5,	[%g0 + %i7] 0x57
loop_2979:
	fbn,a	%fcc2,	loop_2980
	edge16	%l3,	%l2,	%o2
	brgez,a	%g7,	loop_2981
	fmuld8sux16	%f26,	%f20,	%f26
loop_2980:
	nop
	wr	%g0,	0x89,	%asi
	lduha	[%l7 + 0x6C] %asi,	%o6
loop_2981:
	srax	%o7,	%o4,	%l0
	fornot2s	%f6,	%f19,	%f15
	st	%f25,	[%l7 + 0x2C]
	sdiv	%g4,	0x15D4,	%o3
	tl	%icc,	0x5
	fnor	%f6,	%f22,	%f20
	alignaddr	%i1,	%i0,	%l6
	movrne	%i2,	0x3C7,	%i6
	srl	%i7,	%o1,	%g1
	fmul8ulx16	%f12,	%f0,	%f26
	tge	%xcc,	0x0
	fzeros	%f30
	mulx	%i5,	%l4,	%g5
	stbar
	movrne	%l1,	0x1CD,	%o5
	fornot2s	%f7,	%f15,	%f26
	sdiv	%o0,	0x0B02,	%g2
	tpos	%xcc,	0x1
	wr	%g0,	0x22,	%asi
	stxa	%g6,	[%l7 + 0x58] %asi
	membar	#Sync
	brlez	%g3,	loop_2982
	mova	%xcc,	%i4,	%i3
	tcs	%xcc,	0x1
	fmovsge	%icc,	%f4,	%f2
loop_2982:
	movcc	%xcc,	%l5,	%l2
	bne,pn	%xcc,	loop_2983
	fpsub32	%f10,	%f2,	%f0
	brlez,a	%l3,	loop_2984
	movrgez	%o2,	%o6,	%o7
loop_2983:
	nop
	wr	%g0,	0x22,	%asi
	stwa	%o4,	[%l7 + 0x5C] %asi
	membar	#Sync
loop_2984:
	movrne	%g7,	0x1ED,	%l0
	bn,a	%icc,	loop_2985
	edge32	%g4,	%o3,	%i0
	ld	[%l7 + 0x68],	%f18
	array8	%i1,	%l6,	%i6
loop_2985:
	and	%i2,	0x00C4,	%i7
	ldsb	[%l7 + 0x7E],	%g1
	fbo,a	%fcc3,	loop_2986
	fmovrdgz	%i5,	%f10,	%f30
	tge	%icc,	0x6
	fmovsa	%icc,	%f11,	%f3
loop_2986:
	lduh	[%l7 + 0x1A],	%l4
	udivcc	%o1,	0x1035,	%g5
	sdiv	%l1,	0x0523,	%o0
	bvc,pn	%icc,	loop_2987
	brgez	%g2,	loop_2988
	te	%xcc,	0x5
	wr	%g0,	0x0c,	%asi
	lda	[%l7 + 0x48] %asi,	%f24
loop_2987:
	bne,pn	%icc,	loop_2989
loop_2988:
	fba,a	%fcc2,	loop_2990
	te	%xcc,	0x2
	std	%f6,	[%l7 + 0x48]
loop_2989:
	movleu	%icc,	%o5,	%g6
loop_2990:
	fmovdpos	%xcc,	%f8,	%f1
	movne	%icc,	%g3,	%i3
	orcc	%i4,	0x0600,	%l2
	fandnot2	%f20,	%f26,	%f24
	tge	%icc,	0x7
	movrlz	%l3,	%l5,	%o6
	fpadd32s	%f15,	%f21,	%f25
	ble,pn	%xcc,	loop_2991
	move	%xcc,	%o2,	%o4
	siam	0x0
	xnorcc	%o7,	0x1B4B,	%l0
loop_2991:
	call	loop_2992
	fmovse	%icc,	%f9,	%f6
	movrgz	%g4,	%o3,	%g7
	array32	%i1,	%i0,	%i6
loop_2992:
	fands	%f9,	%f14,	%f26
	bge	%xcc,	loop_2993
	fmovsvc	%icc,	%f2,	%f28
	xor	%l6,	0x043B,	%i7
	udivcc	%i2,	0x121E,	%i5
loop_2993:
	bne,a,pt	%icc,	loop_2994
	movvs	%icc,	%g1,	%o1
	stbar
	fmovdvc	%xcc,	%f0,	%f29
loop_2994:
	movpos	%icc,	%l4,	%g5
	fmovsne	%icc,	%f1,	%f31
	fble	%fcc2,	loop_2995
	fbuge	%fcc2,	loop_2996
	fornot2s	%f22,	%f19,	%f29
	movrgez	%l1,	%g2,	%o0
loop_2995:
	fabsd	%f8,	%f18
loop_2996:
	nop
	setx loop_2997, %l0, %l1
	jmpl %l1, %o5
	bleu	%xcc,	loop_2998
	st	%f5,	[%l7 + 0x34]
	sra	%g6,	0x17,	%g3
loop_2997:
	fandnot2s	%f27,	%f3,	%f12
loop_2998:
	xorcc	%i4,	%l2,	%l3
	edge16l	%i3,	%o6,	%l5
	ta	%icc,	0x0
	fmovrsgz	%o4,	%f0,	%f30
	popc	%o2,	%l0
	wr	%g0,	0x81,	%asi
	ldstuba	[%l7 + 0x24] %asi,	%o7
	xorcc	%g4,	%o3,	%g7
	tsubcctv	%i0,	0x0D33,	%i1
	movre	%l6,	%i6,	%i7
	movrgez	%i5,	0x30F,	%g1
	sll	%o1,	%l4,	%g5
	array16	%i2,	%l1,	%g2
	udivx	%o0,	0x003D,	%g6
	fbl	%fcc0,	loop_2999
	movle	%xcc,	%g3,	%o5
	fmovsa	%icc,	%f18,	%f17
	swap	[%l7 + 0x38],	%l2
loop_2999:
	movvs	%icc,	%i4,	%l3
	mova	%icc,	%o6,	%l5
	fmovdneg	%icc,	%f21,	%f24
	fmovsvs	%icc,	%f2,	%f0
	array32	%i3,	%o4,	%o2
	fmovsl	%icc,	%f13,	%f30
	alignaddr	%l0,	%o7,	%o3
	fnegd	%f8,	%f12
	movpos	%xcc,	%g4,	%g7
	udiv	%i1,	0x0FE6,	%i0
	movcs	%icc,	%i6,	%l6
	tle	%icc,	0x2
	bcc,pn	%xcc,	loop_3000
	fzero	%f12
	set	0x48, %i3
	lduwa	[%l7 + %i3] 0x19,	%i5
loop_3000:
	swap	[%l7 + 0x14],	%g1
	lduh	[%l7 + 0x52],	%o1
	fxor	%f20,	%f26,	%f8
	fmul8x16al	%f0,	%f23,	%f6
	fcmpne16	%f0,	%f30,	%i7
	move	%xcc,	%g5,	%i2
	edge32n	%l4,	%g2,	%o0
	fmovsl	%icc,	%f7,	%f22
	fmul8x16au	%f6,	%f30,	%f14
	movg	%icc,	%g6,	%g3
	tvc	%xcc,	0x5
	movl	%xcc,	%o5,	%l2
	ldub	[%l7 + 0x51],	%i4
	fbu,a	%fcc1,	loop_3001
	edge32ln	%l1,	%l3,	%o6
	sir	0x041C
	brgz	%l5,	loop_3002
loop_3001:
	movneg	%icc,	%i3,	%o4
	movrne	%l0,	%o2,	%o7
	wr	%g0,	0x89,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
loop_3002:
	fmovrdgez	%g4,	%f6,	%f28
	bcc	loop_3003
	xorcc	%o3,	%i1,	%i0
	movrgez	%g7,	0x3D6,	%l6
	fmuld8sux16	%f29,	%f1,	%f4
loop_3003:
	bvc	%xcc,	loop_3004
	ldsw	[%l7 + 0x74],	%i5
	fpsub16	%f26,	%f24,	%f22
	taddcc	%i6,	0x17D6,	%o1
loop_3004:
	movn	%xcc,	%g1,	%i7
	set	0x24, %i0
	ldswa	[%l7 + %i0] 0x18,	%i2
	fmovdcc	%xcc,	%f19,	%f1
	fmovsa	%icc,	%f27,	%f0
	fba,a	%fcc3,	loop_3005
	smulcc	%g5,	%l4,	%o0
	fpack32	%f6,	%f0,	%f0
	fxor	%f30,	%f0,	%f0
loop_3005:
	mova	%icc,	%g6,	%g2
	movre	%g3,	%l2,	%o5
	tg	%icc,	0x3
	wr	%g0,	0x81,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	edge16ln	%l1,	%l3,	%i4
	popc	0x0D3E,	%l5
	fmovscc	%xcc,	%f2,	%f9
	set	0x20, %o3
	lduba	[%l7 + %o3] 0x18,	%o6
	fmovda	%xcc,	%f8,	%f26
	edge8ln	%o4,	%l0,	%o2
	sll	%o7,	%g4,	%o3
	add	%l7,	0x18,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%i3
	casa	[%l6] 0x89,	%i3,	%i1
	movrne	%i0,	0x0B7,	%l6
	edge32l	%i5,	%g7,	%o1
	bpos	%xcc,	loop_3006
	fmovrsgz	%i6,	%f1,	%f11
	xorcc	%g1,	0x066A,	%i2
	bge,a,pt	%xcc,	loop_3007
loop_3006:
	sub	%i7,	%g5,	%o0
	ldx	[%l7 + 0x30],	%l4
	tge	%icc,	0x1
loop_3007:
	siam	0x1
	ldstub	[%l7 + 0x3E],	%g6
	fzero	%f12
	addccc	%g2,	0x1114,	%l2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x80,	%asi
	ldstuba	[%l7 + 0x5E] %asi,	%g3
	orncc	%o5,	%l3,	%l1
	fors	%f23,	%f18,	%f30
	bn,a,pt	%icc,	loop_3008
	fpsub16	%f0,	%f28,	%f4
	ba,a,pt	%icc,	loop_3009
	sll	%i4,	0x00,	%l5
loop_3008:
	movgu	%xcc,	%o4,	%o6
	brz,a	%l0,	loop_3010
loop_3009:
	edge32ln	%o7,	%g4,	%o3
	ba	%icc,	loop_3011
	membar	0x60
loop_3010:
	fmovrdgz	%o2,	%f2,	%f6
	edge32ln	%i1,	%i3,	%i0
loop_3011:
	ldub	[%l7 + 0x1D],	%i5
	brgz,a	%g7,	loop_3012
	fmul8sux16	%f26,	%f14,	%f14
	set	0x08, %g5
	swapa	[%l7 + %g5] 0x80,	%l6
loop_3012:
	fpsub32	%f0,	%f22,	%f6
	edge16	%o1,	%g1,	%i6
	st	%f2,	[%l7 + 0x54]
	udiv	%i2,	0x1BAA,	%i7
	andcc	%g5,	%l4,	%g6
	bl,a	%icc,	loop_3013
	tne	%xcc,	0x3
	add	%l7,	0x38,	%l6
	wr	%g0,	0x11,	%asi
	ldxa	[%l6] %asi,	%g2
	casxa	[%l6] 0x11,	%g2,	%o0
loop_3013:
	movpos	%icc,	%l2,	%o5
	umulcc	%g3,	%l1,	%i4
	tsubcctv	%l5,	%o4,	%l3
	membar	0x34
	fmovsvs	%xcc,	%f10,	%f0
	nop
	set	0x70, %l6
	ldsb	[%l7 + %l6],	%l0
	tge	%xcc,	0x1
	set	0x40, %l1
	stda	%f16,	[%l7 + %l1] 0x80
	or	%o7,	%o6,	%o3
	movvs	%xcc,	%o2,	%i1
	sub	%i3,	0x0B1E,	%i0
	nop
	set	0x44, %l2
	ldsw	[%l7 + %l2],	%g4
	bleu,a	loop_3014
	flush	%l7 + 0x60
	brlz	%i5,	loop_3015
	bvs,pn	%icc,	loop_3016
loop_3014:
	bcs,a,pt	%xcc,	loop_3017
	udiv	%g7,	0x02DC,	%l6
loop_3015:
	movrgz	%o1,	%g1,	%i6
loop_3016:
	edge32n	%i2,	%g5,	%i7
loop_3017:
	nop
	wr	%g0,	0x10,	%asi
	ldswa	[%l7 + 0x18] %asi,	%g6
	popc	%l4,	%o0
	add	%l7,	0x18,	%l6
	wr	%g0,	0x19,	%asi
	lda	[%l6] %asi,	%g2
	casa	[%l6] 0x19,	%g2,	%l2
	movre	%g3,	%o5,	%i4
	popc	0x1CAB,	%l1
	fbne,a	%fcc3,	loop_3018
	or	%o4,	0x110C,	%l5
	fandnot1s	%f25,	%f17,	%f25
	array8	%l0,	%l3,	%o7
loop_3018:
	addcc	%o6,	%o3,	%i1
	ba,a,pt	%xcc,	loop_3019
	fmovsgu	%icc,	%f27,	%f29
	bvs,a	loop_3020
	lduw	[%l7 + 0x4C],	%o2
loop_3019:
	xor	%i0,	0x133D,	%i3
	xnor	%g4,	0x0F8B,	%g7
loop_3020:
	taddcctv	%i5,	0x17AD,	%o1
	movre	%l6,	%i6,	%i2
	tcc	%xcc,	0x6
	umul	%g5,	%i7,	%g6
	fbo,a	%fcc3,	loop_3021
	edge32ln	%g1,	%o0,	%g2
	lduh	[%l7 + 0x5E],	%l2
	brlz	%g3,	loop_3022
loop_3021:
	sth	%o5,	[%l7 + 0x48]
	wr	%g0,	0x89,	%asi
	lduha	[%l7 + 0x32] %asi,	%i4
loop_3022:
	nop
	set	0x68, %g1
	prefetcha	[%l7 + %g1] 0x18,	 0x0
	set	0x4C, %o5
	stwa	%o4,	[%l7 + %o5] 0x15
	bneg,a	loop_3023
	andn	%l4,	%l5,	%l3
	movl	%icc,	%l0,	%o6
	fmovrslz	%o3,	%f10,	%f28
loop_3023:
	ba,pn	%icc,	loop_3024
	alignaddrl	%o7,	%i1,	%o2
	fbug	%fcc1,	loop_3025
	fbo,a	%fcc3,	loop_3026
loop_3024:
	or	%i0,	%g4,	%i3
	movne	%xcc,	%i5,	%o1
loop_3025:
	taddcctv	%l6,	%g7,	%i6
loop_3026:
	sdivx	%i2,	0x16F5,	%i7
	movpos	%icc,	%g6,	%g1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tge	%xcc,	0x1
	brgez	%o0,	loop_3027
	stb	%g5,	[%l7 + 0x23]
	sra	%l2,	%g3,	%g2
	tge	%xcc,	0x1
loop_3027:
	be,a,pn	%icc,	loop_3028
	movcc	%xcc,	%o5,	%i4
	bl,a	%xcc,	loop_3029
	st	%f6,	[%l7 + 0x28]
loop_3028:
	addccc	%o4,	0x0378,	%l1
	addcc	%l4,	%l3,	%l5
loop_3029:
	edge8l	%o6,	%l0,	%o7
	edge32n	%i1,	%o2,	%i0
	fcmpne32	%f26,	%f8,	%o3
	tpos	%icc,	0x0
	ta	%xcc,	0x4
	fbg,a	%fcc0,	loop_3030
	movrlez	%i3,	%g4,	%o1
	sra	%l6,	%i5,	%i6
	mova	%xcc,	%g7,	%i2
loop_3030:
	fmovrslz	%g6,	%f0,	%f24
	fmovsa	%icc,	%f18,	%f9
	fbn,a	%fcc2,	loop_3031
	xnorcc	%g1,	0x086D,	%i7
	fpack16	%f28,	%f25
	fble	%fcc0,	loop_3032
loop_3031:
	fble,a	%fcc1,	loop_3033
	fexpand	%f18,	%f16
	andncc	%g5,	%l2,	%o0
loop_3032:
	faligndata	%f6,	%f28,	%f10
loop_3033:
	movl	%icc,	%g3,	%o5
	bneg	loop_3034
	tvs	%xcc,	0x2
	fcmple16	%f4,	%f10,	%g2
	edge16ln	%i4,	%l1,	%l4
loop_3034:
	nop
	wr	%g0,	0x10,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	edge8	%o4,	%l3,	%o6
	tn	%icc,	0x1
	tle	%icc,	0x0
	andncc	%l0,	%o7,	%i1
	wr	%g0,	0x04,	%asi
	ldswa	[%l7 + 0x18] %asi,	%l5
	xnorcc	%o2,	0x046D,	%i0
	nop
	setx	loop_3035,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	array16	%o3,	%i3,	%o1
	edge32n	%l6,	%i5,	%i6
	fpsub16s	%f10,	%f5,	%f13
loop_3035:
	udivx	%g7,	0x0ED5,	%g4
	movcs	%xcc,	%i2,	%g1
	addc	%i7,	0x0BCC,	%g6
	andncc	%g5,	%o0,	%g3
	tneg	%icc,	0x1
	fmovsge	%xcc,	%f23,	%f15
	fand	%f16,	%f28,	%f6
	fbe	%fcc1,	loop_3036
	tcs	%xcc,	0x3
	fpadd32	%f26,	%f14,	%f18
	sdiv	%o5,	0x0AB2,	%l2
loop_3036:
	movgu	%xcc,	%g2,	%i4
	brlz,a	%l1,	loop_3037
	fmovsleu	%xcc,	%f3,	%f24
	srax	%o4,	0x18,	%l4
	fpsub32	%f0,	%f2,	%f0
loop_3037:
	ta	%icc,	0x2
	fmovscs	%xcc,	%f15,	%f23
	tvc	%icc,	0x0
	tleu	%xcc,	0x4
	fpsub32s	%f10,	%f26,	%f27
	tsubcc	%o6,	%l0,	%o7
	fbn,a	%fcc2,	loop_3038
	smulcc	%i1,	%l5,	%l3
	fbge	%fcc0,	loop_3039
	movgu	%icc,	%i0,	%o3
loop_3038:
	fmovd	%f20,	%f22
	movrgz	%i3,	%o2,	%o1
loop_3039:
	taddcctv	%i5,	%i6,	%g7
	taddcctv	%l6,	0x0B44,	%g4
	movneg	%icc,	%g1,	%i2
	fmovsn	%xcc,	%f1,	%f7
	fmovsne	%xcc,	%f17,	%f23
	fnand	%f8,	%f6,	%f4
	taddcc	%i7,	%g5,	%o0
	subccc	%g3,	0x1471,	%o5
	srax	%l2,	%g6,	%i4
	movcs	%xcc,	%g2,	%l1
	prefetch	[%l7 + 0x20],	 0x2
	move	%icc,	%l4,	%o6
	brz	%l0,	loop_3040
	movrlz	%o4,	0x355,	%i1
	subccc	%o7,	%l3,	%i0
	fbn	%fcc1,	loop_3041
loop_3040:
	taddcc	%o3,	0x11AA,	%l5
	edge32n	%i3,	%o1,	%o2
	fcmpes	%fcc0,	%f4,	%f31
loop_3041:
	sub	%i6,	0x09E3,	%g7
	add	%l6,	%g4,	%g1
	movrgz	%i5,	0x07E,	%i2
	sllx	%i7,	0x1E,	%g5
	alignaddrl	%o0,	%g3,	%l2
	sll	%o5,	%i4,	%g6
	tvc	%icc,	0x6
	wr	%g0,	0x04,	%asi
	ldda	[%l7 + 0x20] %asi,	%g2
	addc	%l1,	0x034A,	%l4
	edge8n	%o6,	%o4,	%i1
	array16	%o7,	%l0,	%l3
	fzero	%f2
	fble	%fcc3,	loop_3042
	xnor	%o3,	%i0,	%l5
	addcc	%i3,	0x1A29,	%o2
	edge16l	%o1,	%g7,	%l6
loop_3042:
	add	%i6,	0x16F3,	%g1
	popc	%i5,	%g4
	movrgez	%i2,	0x3EC,	%i7
	fmovda	%xcc,	%f8,	%f6
	fmul8ulx16	%f30,	%f20,	%f10
	brgz,a	%g5,	loop_3043
	andncc	%o0,	%g3,	%l2
	alignaddrl	%i4,	%o5,	%g2
	fabsd	%f12,	%f26
loop_3043:
	ldub	[%l7 + 0x64],	%g6
	fmovsa	%icc,	%f12,	%f11
	brz,a	%l1,	loop_3044
	sll	%l4,	0x03,	%o6
	movcs	%icc,	%o4,	%o7
	addc	%l0,	%l3,	%o3
loop_3044:
	mulx	%i1,	%i0,	%i3
	orn	%l5,	%o1,	%g7
	brgz,a	%o2,	loop_3045
	fpsub32s	%f26,	%f8,	%f26
	popc	%l6,	%i6
	bge	loop_3046
loop_3045:
	andn	%i5,	%g1,	%g4
	brnz,a	%i7,	loop_3047
	mulx	%i2,	0x0070,	%g5
loop_3046:
	ldsh	[%l7 + 0x0E],	%g3
	bcs,a,pt	%icc,	loop_3048
loop_3047:
	bvc	loop_3049
	fmovspos	%icc,	%f1,	%f31
	edge32ln	%o0,	%l2,	%o5
loop_3048:
	ble,pn	%icc,	loop_3050
loop_3049:
	edge8ln	%i4,	%g6,	%g2
	tneg	%xcc,	0x0
	alignaddr	%l4,	%l1,	%o4
loop_3050:
	tge	%xcc,	0x5
	std	%o6,	[%l7 + 0x20]
	tleu	%icc,	0x6
	umul	%o7,	%l0,	%o3
	ld	[%l7 + 0x60],	%f6
	wr	%g0,	0x88,	%asi
	lduwa	[%l7 + 0x0C] %asi,	%i1
	tvs	%xcc,	0x5
	fxnors	%f15,	%f1,	%f1
	fmul8ulx16	%f2,	%f30,	%f8
	bcs,a	%icc,	loop_3051
	fcmpne32	%f22,	%f30,	%i0
	sra	%l3,	%l5,	%i3
	fpmerge	%f6,	%f25,	%f10
loop_3051:
	fmovsg	%icc,	%f14,	%f7
	movcc	%xcc,	%o1,	%g7
	movvc	%xcc,	%o2,	%i6
	fsrc1	%f0,	%f30
	fmovdne	%icc,	%f12,	%f5
	stb	%i5,	[%l7 + 0x30]
	edge16n	%g1,	%l6,	%g4
	fmovrslez	%i7,	%f21,	%f1
	fmul8x16al	%f17,	%f16,	%f28
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fxnors	%f31,	%f19,	%f9
	taddcctv	%i2,	%g3,	%g5
	alignaddrl	%l2,	%o5,	%o0
	movvc	%xcc,	%i4,	%g6
	movrgez	%g2,	%l4,	%o4
	fbul,a	%fcc0,	loop_3052
	edge8l	%l1,	%o7,	%o6
	ldx	[%l7 + 0x18],	%l0
	orncc	%i1,	%o3,	%l3
loop_3052:
	movl	%xcc,	%l5,	%i0
	xor	%i3,	0x015C,	%o1
	subc	%o2,	0x11A4,	%g7
	add	%l7,	0x7C,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%i6
	casa	[%l6] %asi,	%i6,	%i5
	tpos	%xcc,	0x2
	fmul8sux16	%f16,	%f28,	%f10
	set	0x70, %i6
	stxa	%l6,	[%l7 + %i6] 0x19
	addcc	%g4,	%i7,	%g1
	edge8ln	%g3,	%i2,	%g5
	fone	%f0
	call	loop_3053
	fmovdne	%xcc,	%f10,	%f2
	movvc	%icc,	%o5,	%l2
	edge32	%o0,	%i4,	%g6
loop_3053:
	movrlz	%g2,	%l4,	%l1
	edge32n	%o7,	%o6,	%l0
	tneg	%icc,	0x3
	set	0x78, %o2
	ldxa	[%l7 + %o2] 0x18,	%i1
	sll	%o4,	%l3,	%o3
	xnorcc	%i0,	%l5,	%i3
	and	%o2,	0x1121,	%g7
	sllx	%o1,	%i5,	%l6
	fmul8x16al	%f13,	%f27,	%f4
	array16	%i6,	%i7,	%g1
	ble,a	loop_3054
	tne	%icc,	0x6
	and	%g3,	%g4,	%g5
	ldsh	[%l7 + 0x62],	%i2
loop_3054:
	for	%f4,	%f24,	%f10
	tne	%icc,	0x5
	edge8ln	%o5,	%o0,	%l2
	array8	%g6,	%g2,	%l4
	ldub	[%l7 + 0x0B],	%l1
	fmovdn	%xcc,	%f14,	%f28
	move	%icc,	%o7,	%i4
	stx	%l0,	[%l7 + 0x10]
	edge16ln	%o6,	%i1,	%l3
	movrne	%o4,	0x289,	%i0
	bne,pn	%icc,	loop_3055
	movneg	%xcc,	%l5,	%o3
	fmovsne	%icc,	%f13,	%f10
	movg	%icc,	%o2,	%g7
loop_3055:
	movge	%xcc,	%o1,	%i5
	addc	%l6,	%i6,	%i7
	movrlz	%g1,	0x1FC,	%i3
	fpmerge	%f2,	%f23,	%f18
	sra	%g3,	%g4,	%g5
	tn	%icc,	0x4
	bpos	%icc,	loop_3056
	movrne	%i2,	%o0,	%o5
	pdist	%f2,	%f4,	%f4
	set	0x64, %g2
	ldswa	[%l7 + %g2] 0x89,	%l2
loop_3056:
	faligndata	%f12,	%f8,	%f6
	fbue	%fcc0,	loop_3057
	tcc	%icc,	0x6
	orcc	%g2,	0x1420,	%g6
	subccc	%l1,	0x0478,	%o7
loop_3057:
	movneg	%xcc,	%i4,	%l4
	tvc	%icc,	0x5
	sdiv	%l0,	0x03F3,	%i1
	movrgz	%o6,	0x2DD,	%l3
	addc	%o4,	%l5,	%o3
	alignaddr	%o2,	%g7,	%i0
	tl	%icc,	0x2
	addc	%i5,	%l6,	%o1
	ble,a	loop_3058
	edge16l	%i7,	%i6,	%g1
	fmovsa	%xcc,	%f19,	%f29
	movgu	%icc,	%i3,	%g4
loop_3058:
	ldsw	[%l7 + 0x38],	%g5
	srlx	%i2,	%o0,	%o5
	movvc	%xcc,	%l2,	%g3
	movn	%icc,	%g2,	%g6
	movvs	%icc,	%l1,	%i4
	movpos	%xcc,	%o7,	%l4
	brgz,a	%l0,	loop_3059
	fbule,a	%fcc0,	loop_3060
	fmovrdne	%i1,	%f8,	%f16
	fnand	%f0,	%f20,	%f28
loop_3059:
	add	%l3,	0x1245,	%o6
loop_3060:
	tsubcc	%o4,	0x0168,	%o3
	orcc	%o2,	0x1AC4,	%l5
	fmovdle	%xcc,	%f7,	%f26
	tne	%icc,	0x5
	fmovdvc	%icc,	%f5,	%f2
	fmovdgu	%xcc,	%f23,	%f13
	sra	%i0,	0x13,	%g7
	fexpand	%f14,	%f4
	or	%l6,	%o1,	%i5
	wr	%g0,	0x80,	%asi
	ldswa	[%l7 + 0x28] %asi,	%i7
	movleu	%xcc,	%g1,	%i6
	addccc	%g4,	0x0E5F,	%i3
	for	%f18,	%f8,	%f6
	brgez,a	%i2,	loop_3061
	tle	%icc,	0x0
loop_3061:
	nop

	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 0:
!
!	Type l   	: 2753
!	Type x   	: 1278
!	Type cti   	: 3061
!	Type f   	: 4554
!	Type i   	: 13354
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


	EXIT_GOOD	/* test finish  */

/************************************************************************
   Test case data start
 ************************************************************************/
.data
user_data_start:
scratch_area:
.word 0x11A0343A
.word 0x8481F5B1
.word 0xECB05EEB
.word 0xBB683D62
.word 0x02B61DE3
.word 0x3FA3F94E
.word 0x7D018137
.word 0x5D7E28BE
.word 0x92C550EC
.word 0x4163DE3A
.word 0x84388092
.word 0x525CC921
.word 0x7C9807F8
.word 0x7F37A530
.word 0xD3C4600C
.word 0x920AE953
.word 0x408E777B
.word 0x7CCF72BA
.word 0xEE750137
.word 0x7F28521D
.word 0xACD3D280
.word 0xECF7D94F
.word 0xE880D0EB
.word 0x5234EE97
.word 0xC7F496A5
.word 0x945E0B47
.word 0xF9EF0096
.word 0x5E1595C7
.word 0xF6F7A9A0
.word 0xBE0B4199
.word 0xFB018971
.word 0x55EBD964
.word 0xC5AF62C1
.word 0xC97061EC
.word 0x8408C09D
.word 0x7DCD0EAE
.word 0x7EABADC6
.word 0x0865F8AE
.word 0xBF44EA35
.word 0x15C5431C
.word 0x1C2976C9
.word 0x3606D520
.word 0x97CE2311
.word 0xD3E3C214
.word 0xE6E17E00
.word 0xE16B58B1
.word 0xE37A2243
.word 0xB0D5BDE3
.word 0xE721A755
.word 0xBD9E29C6
.word 0x59390F2A
.word 0xF4D1582F
.word 0xB2228726
.word 0x969D408D
.word 0xA2C62677
.word 0x7ACE1F63
.word 0xE5851863
.word 0xCE3EF3C4
.word 0x010FA8CB
.word 0xB0B6CF98
.word 0x172994C2
.word 0x87DAFD92
.word 0xCEB1F071
.word 0x6DC425B0
.end
