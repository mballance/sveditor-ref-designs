/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: isa3_flushw_fc0.s
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
.ident "FOCUSCASE: focus.pm,v 1.1 2003/04/23 17:53:39 somePerson Exp somePerson $ spc_basic_isa3.pl FOCUS_SEED=190872195"
.ident "BY rg131678 ON Thu Aug 21 09:32:06 CDT 2003"
.ident "Using Instruction Hash for Focus :$Id: isa3_flushw_fc0.s,v 1.3 2007/07/05 22:01:47 drp Exp $"
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

!
! Thread 0 Start
!
main_t0:

	!# Initialize registers ..

	!# Global registers
	set	0x3,	%g1
	set	0xE,	%g2
	set	0x2,	%g3
	set	0xC,	%g4
	set	0x5,	%g5
	set	0xE,	%g6
	set	0x8,	%g7
	!# Input registers
	set	-0x0,	%i0
	set	-0x8,	%i1
	set	-0x1,	%i2
	set	-0x4,	%i3
	set	-0xB,	%i4
	set	-0xC,	%i5
	set	-0xB,	%i6
	set	-0x4,	%i7
	!# Local registers
	set	0x1A06753D,	%l0
	set	0x1293A2F8,	%l1
	set	0x09DCA839,	%l2
	set	0x67BD83DC,	%l3
	set	0x65BF1E99,	%l4
	set	0x33B99902,	%l5
	set	0x778C3DC7,	%l6
	!# Output registers
	set	-0x0663,	%o0
	set	0x01EE,	%o1
	set	-0x19FE,	%o2
	set	0x0496,	%o3
	set	0x0AA0,	%o4
	set	-0x1883,	%o5
	set	-0x097C,	%o6
	set	-0x08F8,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x3CA478EA073309CC)
	INIT_TH_FP_REG(%l7,%f2,0xDE463F934F755101)
	INIT_TH_FP_REG(%l7,%f4,0x1B22C06E598DDA55)
	INIT_TH_FP_REG(%l7,%f6,0x0EAA5B32F8C4D35F)
	INIT_TH_FP_REG(%l7,%f8,0xF86738C4B512B171)
	INIT_TH_FP_REG(%l7,%f10,0x19A81A3FC92D8413)
	INIT_TH_FP_REG(%l7,%f12,0x314AFC1C49669234)
	INIT_TH_FP_REG(%l7,%f14,0x1241C3A4CB580E49)
	INIT_TH_FP_REG(%l7,%f16,0x828EA188DADCD3FC)
	INIT_TH_FP_REG(%l7,%f18,0x5FC1BBD7839228D2)
	INIT_TH_FP_REG(%l7,%f20,0xE2E5140ACA4AFAAB)
	INIT_TH_FP_REG(%l7,%f22,0x4907B5D3DF845D01)
	INIT_TH_FP_REG(%l7,%f24,0x0F658B8096642072)
	INIT_TH_FP_REG(%l7,%f26,0xEE51556CD3E703E1)
	INIT_TH_FP_REG(%l7,%f28,0x4A3B4C1870948DBF)
	INIT_TH_FP_REG(%l7,%f30,0x0185D83EBE0B9DB9)

	!# Execute Main Diag ..

	ldsb	[%l7 + 0x65],	%g2
	set	0x68, %i0
	swapa	[%l7 + %i0] 0x19,	%l1
	for	%f4,	%f14,	%f0
	fbu,a	%fcc0,	loop_1
	fcmped	%fcc0,	%f22,	%f0
	brnz,a	%o2,	loop_2
	xor	%g7,	%l3,	%g4
loop_1:
	nop
	setx loop_3, %l0, %l1
	jmpl %l1, %l6
	movn	%icc,	%l2,	%o3
loop_2:
	bg,a	%icc,	loop_4
	umulcc	%l0,	0x1538,	%i3
loop_3:
	fabsd	%f12,	%f24
	set	0x54, %l3
	ldsha	[%l7 + %l3] 0x81,	%i6
loop_4:
	movvs	%xcc,	%i1,	%i0
	fzero	%f22
	nop
	setx loop_5, %l0, %l1
	jmpl %l1, %g6
	popc	%g3,	%o6
	udivx	%o0,	0x08FF,	%l4
	set	0x1E, %g5
	ldsba	[%l7 + %g5] 0x15,	%o7
loop_5:
	orcc	%g1,	0x11AE,	%i2
	fabsd	%f30,	%f24
	xnor	%o4,	0x0DA3,	%l5
	fnegd	%f10,	%f8
	movrne	%i5,	%g5,	%i4
	fexpand	%f21,	%f26
	fnot1s	%f30,	%f4
	movge	%xcc,	%o1,	%o5
	fmovrsgez	%i7,	%f2,	%f12
	fmul8sux16	%f26,	%f4,	%f24
	movrgez	%l1,	%o2,	%g2
	fornot2s	%f26,	%f19,	%f24
	set	0x5A, %l6
	lduba	[%l7 + %l6] 0x11,	%l3
	mulx	%g7,	%l6,	%l2
	addc	%o3,	%g4,	%i3
	tsubcctv	%l0,	%i1,	%i0
	andcc	%i6,	0x0756,	%g3
	ta	%icc,	0x2
	fcmped	%fcc0,	%f22,	%f8
	move	%icc,	%g6,	%o6
	sdiv	%l4,	0x0C8C,	%o0
	fpsub32	%f18,	%f22,	%f8
	bl,pn	%icc,	loop_6
	tcc	%icc,	0x2
	movrgez	%o7,	%i2,	%g1
	taddcc	%o4,	0x0194,	%l5
loop_6:
	fabsd	%f22,	%f30
	tl	%icc,	0x7
	nop
	setx	loop_7,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fmovscs	%icc,	%f13,	%f5
	mulscc	%g5,	0x0687,	%i4
	movrne	%o1,	0x0F2,	%i5
loop_7:
	mulscc	%o5,	0x0620,	%i7
	membar	0x74
	movl	%icc,	%o2,	%g2
	subcc	%l1,	%l3,	%g7
	bl,a,pt	%icc,	loop_8
	edge32	%l6,	%l2,	%g4
	set	0x58, %i7
	swapa	[%l7 + %i7] 0x80,	%i3
loop_8:
	nop
	set	0x2B, %o1
	ldsba	[%l7 + %o1] 0x18,	%o3
	movl	%icc,	%l0,	%i1
	ldstub	[%l7 + 0x38],	%i6
	edge8n	%i0,	%g6,	%g3
	tne	%xcc,	0x4
	ldsh	[%l7 + 0x2C],	%o6
	brlez,a	%l4,	loop_9
	movgu	%xcc,	%o0,	%o7
	orcc	%i2,	0x1F64,	%g1
	set	0x40, %i3
	ldxa	[%l7 + %i3] 0x19,	%o4
loop_9:
	xnor	%l5,	%i4,	%o1
	fmovrdlz	%g5,	%f22,	%f14
	bpos,pn	%xcc,	loop_10
	brz	%o5,	loop_11
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movn	%xcc,	%i5,	%o2
loop_10:
	orcc	%g2,	0x0985,	%i7
loop_11:
	tpos	%icc,	0x1
	set	0x70, %o7
	swapa	[%l7 + %o7] 0x88,	%l1
	movleu	%icc,	%l3,	%l6
	orn	%g7,	0x0E06,	%l2
	tleu	%icc,	0x6
	fmovdl	%icc,	%f3,	%f2
	sllx	%g4,	0x0C,	%i3
	fnot2s	%f3,	%f11
	ldstub	[%l7 + 0x1A],	%l0
	move	%xcc,	%o3,	%i1
	smulcc	%i0,	0x1FBC,	%g6
	smulcc	%g3,	0x0660,	%o6
	bvc,pt	%icc,	loop_12
	sub	%i6,	0x0E11,	%l4
	flushw
	brz	%o7,	loop_13
loop_12:
	ldstub	[%l7 + 0x7A],	%o0
	srax	%i2,	%g1,	%o4
	xorcc	%i4,	%l5,	%g5
loop_13:
	tvs	%xcc,	0x1
	and	%o1,	0x1E67,	%o5
	fbl,a	%fcc2,	loop_14
	sth	%o2,	[%l7 + 0x5C]
	addc	%i5,	%g2,	%i7
	fexpand	%f17,	%f0
loop_14:
	nop
	wr	%g0,	0x19,	%asi
	sta	%f1,	[%l7 + 0x24] %asi
	addccc	%l1,	%l3,	%l6
	bpos,a	%icc,	loop_15
	fnand	%f18,	%f12,	%f14
	flush	%l7 + 0x24
	tneg	%icc,	0x7
loop_15:
	fmul8ulx16	%f26,	%f0,	%f4
	mova	%icc,	%g7,	%l2
	fcmpne32	%f12,	%f14,	%i3
	set	0x08, %o3
	prefetcha	[%l7 + %o3] 0x11,	 0x3
	fbn,a	%fcc3,	loop_16
	bcc,a	%icc,	loop_17
	srl	%l0,	%o3,	%i0
	srlx	%i1,	0x03,	%g6
loop_16:
	umulcc	%g3,	0x0999,	%o6
loop_17:
	bpos	%icc,	loop_18
	fornot1s	%f8,	%f21,	%f26
	mulx	%i6,	0x07BE,	%l4
	move	%xcc,	%o7,	%i2
loop_18:
	subcc	%g1,	%o0,	%o4
	edge16	%l5,	%i4,	%g5
	fsrc2	%f22,	%f2
	array32	%o1,	%o2,	%o5
	fmovdg	%icc,	%f18,	%f25
	umulcc	%g2,	0x1DEA,	%i5
	fornot2	%f20,	%f30,	%f8
	sll	%l1,	%l3,	%i7
	tn	%icc,	0x5
	sir	0x095F
	movg	%icc,	%g7,	%l6
	brz,a	%i3,	loop_19
	taddcc	%g4,	%l2,	%o3
	bl,a	%icc,	loop_20
	tg	%icc,	0x3
loop_19:
	array32	%i0,	%l0,	%i1
	fnot2s	%f24,	%f11
loop_20:
	movn	%xcc,	%g3,	%o6
	edge32	%i6,	%l4,	%o7
	fnegs	%f30,	%f26
	xnor	%i2,	0x0FB6,	%g6
	bne,pn	%icc,	loop_21
	udivx	%g1,	0x16F0,	%o0
	sllx	%o4,	%i4,	%g5
	movneg	%icc,	%o1,	%o2
loop_21:
	nop
	set	0x1C, %g4
	lduba	[%l7 + %g4] 0x89,	%l5
	membar	0x29
	add	%l7,	0x20,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%o5,	%i5
	edge16ln	%g2,	%l3,	%i7
	fmovspos	%xcc,	%f14,	%f1
	movrne	%l1,	%g7,	%l6
	array8	%g4,	%i3,	%l2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tpos	%xcc,	0x7
	movle	%xcc,	%i0,	%l0
	fble	%fcc1,	loop_22
	movpos	%icc,	%i1,	%o3
	udivx	%g3,	0x02C1,	%i6
	brgz,a	%o6,	loop_23
loop_22:
	ld	[%l7 + 0x08],	%f4
	wr	%g0,	0x11,	%asi
	lduba	[%l7 + 0x2D] %asi,	%l4
loop_23:
	fxor	%f0,	%f4,	%f8
	fmovdcs	%xcc,	%f12,	%f1
	fnot1	%f8,	%f12
	smulcc	%i2,	%o7,	%g1
	stb	%o0,	[%l7 + 0x56]
	fmovdgu	%icc,	%f12,	%f17
	sir	0x04E5
	fandnot2s	%f21,	%f15,	%f29
	wr	%g0,	0x80,	%asi
	sta	%f22,	[%l7 + 0x34] %asi
	fbne,a	%fcc1,	loop_24
	taddcctv	%o4,	%g6,	%g5
	edge8ln	%o1,	%i4,	%o2
	membar	0x4D
loop_24:
	bpos,a,pt	%icc,	loop_25
	alignaddrl	%o5,	%l5,	%g2
	tvc	%icc,	0x0
	movneg	%icc,	%i5,	%i7
loop_25:
	bne,pt	%icc,	loop_26
	fbn	%fcc2,	loop_27
	tsubcc	%l1,	%l3,	%g7
	sethi	0x0C4F,	%l6
loop_26:
	fnor	%f6,	%f6,	%f26
loop_27:
	andn	%i3,	%l2,	%g4
	fornot2s	%f24,	%f12,	%f24
	fornot1s	%f13,	%f8,	%f5
	ldd	[%l7 + 0x70],	%f18
	umulcc	%i0,	%l0,	%o3
	fpadd16	%f24,	%f4,	%f4
	sethi	0x0EF7,	%i1
	stbar
	fmovscs	%xcc,	%f19,	%f24
	brlez,a	%g3,	loop_28
	tne	%xcc,	0x0
	tvs	%icc,	0x3
	flushw
loop_28:
	edge8n	%i6,	%o6,	%i2
	fmovdvc	%xcc,	%f1,	%f20
	set	0x64, %l1
	ldswa	[%l7 + %l1] 0x1c,	%l4
	edge16	%o7,	%o0,	%o4
	fbe,a	%fcc1,	loop_29
	addcc	%g1,	%g5,	%o1
	stx	%g6,	[%l7 + 0x68]
	ldstub	[%l7 + 0x6A],	%o2
loop_29:
	nop
	set	0x40, %o2
	stda	%f0,	[%l7 + %o2] 0x88
	addc	%i4,	%o5,	%l5
	andcc	%g2,	%i5,	%l1
	movvc	%xcc,	%l3,	%g7
	alignaddr	%i7,	%l6,	%i3
	fmovsvc	%xcc,	%f12,	%f17
	fmuld8sux16	%f0,	%f21,	%f20
	set	0x6C, %l2
	lduba	[%l7 + %l2] 0x1d,	%l2
	add	%l7,	0x3C,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%i0
	casa	[%l6] 0x89,	%i0,	%g4
	fbu	%fcc3,	loop_30
	array16	%l0,	%o3,	%i1
	fmovsle	%xcc,	%f10,	%f31
	add	%l7,	0x18,	%l6
	wr	%g0,	0x04,	%asi
	ldxa	[%l6] %asi,	%i6
	casxa	[%l6] 0x04,	%i6,	%o6
loop_30:
	fmovsleu	%xcc,	%f9,	%f18
	add	%l7,	0x28,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] %asi,	%g3,	%i2
	fands	%f27,	%f18,	%f13
	movcc	%xcc,	%l4,	%o0
	nop
	set	0x68, %i4
	prefetch	[%l7 + %i4],	 0x0
	sdivx	%o4,	0x1F82,	%o7
	umulcc	%g1,	%g5,	%o1
	brlz	%g6,	loop_31
	movg	%icc,	%i4,	%o5
	smul	%o2,	0x0DD0,	%g2
	mulscc	%l5,	%l1,	%l3
loop_31:
	andncc	%g7,	%i7,	%l6
	fbug	%fcc1,	loop_32
	fmul8ulx16	%f16,	%f20,	%f20
	movge	%icc,	%i3,	%l2
	fxnors	%f26,	%f4,	%f18
loop_32:
	sir	0x0852
	tne	%icc,	0x1
	andcc	%i5,	%g4,	%l0
	lduh	[%l7 + 0x58],	%o3
	edge16n	%i1,	%i0,	%i6
	tne	%icc,	0x3
	ldstub	[%l7 + 0x5D],	%o6
	xor	%i2,	%g3,	%o0
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x1E] %asi,	%l4
	set	0x30, %o6
	ldda	[%l7 + %o6] 0x2e,	%o6
	tcc	%icc,	0x4
	fand	%f4,	%f10,	%f24
	fbo	%fcc1,	loop_33
	nop
	set	0x45, %i2
	ldstub	[%l7 + %i2],	%o4
	fmovrde	%g5,	%f10,	%f14
	sir	0x154D
loop_33:
	or	%o1,	%g6,	%g1
	movrgez	%i4,	%o2,	%o5
	movne	%xcc,	%l5,	%g2
	edge8ln	%l1,	%g7,	%l3
	movrlz	%i7,	0x26B,	%i3
	movrgez	%l6,	%l2,	%i5
	fblg,a	%fcc2,	loop_34
	fpsub32	%f30,	%f10,	%f26
	fmovscc	%xcc,	%f0,	%f14
	edge32ln	%l0,	%g4,	%o3
loop_34:
	popc	%i1,	%i6
	fmovse	%xcc,	%f30,	%f20
	mova	%icc,	%i0,	%i2
	fmovscs	%icc,	%f11,	%f27
	flushw
	siam	0x2
	pdist	%f26,	%f8,	%f22
	movleu	%xcc,	%o6,	%o0
	lduw	[%l7 + 0x28],	%g3
	set	0x57, %o4
	ldstuba	[%l7 + %o4] 0x18,	%o7
	smulcc	%l4,	%g5,	%o1
	set	0x70, %g6
	stwa	%g6,	[%l7 + %g6] 0x04
	be	loop_35
	edge8ln	%o4,	%i4,	%o2
	nop
	setx loop_36, %l0, %l1
	jmpl %l1, %o5
	fmovrde	%l5,	%f10,	%f8
loop_35:
	fmovdvc	%icc,	%f12,	%f19
	smulcc	%g1,	%g2,	%l1
loop_36:
	movne	%xcc,	%g7,	%l3
	movrgz	%i7,	%i3,	%l2
	srlx	%l6,	0x12,	%l0
	stbar
	edge16n	%g4,	%i5,	%o3
	wr	%g0,	0x19,	%asi
	ldsba	[%l7 + 0x2E] %asi,	%i6
	subc	%i1,	%i2,	%o6
	movne	%icc,	%i0,	%o0
	movpos	%xcc,	%g3,	%l4
	taddcc	%o7,	0x0B05,	%g5
	fbug,a	%fcc1,	loop_37
	andn	%o1,	%g6,	%o4
	bcc,pn	%xcc,	loop_38
	tcc	%xcc,	0x3
loop_37:
	bge,a	%xcc,	loop_39
	tneg	%icc,	0x1
loop_38:
	fcmpne32	%f2,	%f24,	%i4
	siam	0x7
loop_39:
	fbe,a	%fcc0,	loop_40
	movvc	%xcc,	%o2,	%l5
	tl	%icc,	0x0
	set	0x38, %g7
	lduwa	[%l7 + %g7] 0x19,	%o5
loop_40:
	sethi	0x1E09,	%g1
	subccc	%g2,	%g7,	%l3
	edge32	%l1,	%i3,	%i7
	movg	%xcc,	%l6,	%l2
	nop
	setx	loop_41,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	sir	0x0A91
	ldx	[%l7 + 0x70],	%g4
	array16	%i5,	%l0,	%i6
loop_41:
	fmuld8ulx16	%f22,	%f15,	%f10
	wr	%g0,	0x0c,	%asi
	ldsba	[%l7 + 0x51] %asi,	%i1
	movrlez	%i2,	%o3,	%i0
	fzeros	%f1
	fornot2	%f6,	%f10,	%f8
	nop
	setx	loop_42,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fbn	%fcc3,	loop_43
	nop
	setx loop_44, %l0, %l1
	jmpl %l1, %o0
	edge16ln	%o6,	%l4,	%o7
loop_42:
	tg	%xcc,	0x0
loop_43:
	fmovsneg	%xcc,	%f8,	%f18
loop_44:
	and	%g3,	0x1358,	%o1
	fandnot1	%f28,	%f10,	%f16
	wr	%g0,	0x04,	%asi
	stwa	%g6,	[%l7 + 0x60] %asi
	fmovsvc	%icc,	%f3,	%f22
	sth	%g5,	[%l7 + 0x12]
	set	0x20, %i1
	sta	%f10,	[%l7 + %i1] 0x18
	brz	%i4,	loop_45
	fba	%fcc1,	loop_46
	tle	%xcc,	0x6
	fnot2	%f8,	%f26
loop_45:
	tne	%icc,	0x5
loop_46:
	edge8ln	%o4,	%o2,	%o5
	fmovsle	%xcc,	%f18,	%f9
	wr	%g0,	0x81,	%asi
	prefetcha	[%l7 + 0x68] %asi,	 0x2
	fzeros	%f13
	array32	%g1,	%g2,	%g7
	fmovdpos	%xcc,	%f10,	%f27
	tvc	%icc,	0x5
	edge32n	%l3,	%i3,	%i7
	fpackfix	%f30,	%f20
	fnot2s	%f11,	%f28
	wr	%g0,	0x19,	%asi
	lduha	[%l7 + 0x62] %asi,	%l6
	sdiv	%l2,	0x0897,	%g4
	wr	%g0,	0x04,	%asi
	swapa	[%l7 + 0x0C] %asi,	%l1
	movrlz	%i5,	%i6,	%i1
	edge8n	%l0,	%o3,	%i0
	ta	%xcc,	0x6
	edge16l	%i2,	%o6,	%o0
	sethi	0x1E8E,	%o7
	te	%xcc,	0x5
	set	0x20, %l0
	stxa	%l4,	[%l7 + %l0] 0x15
	set	0x60, %g3
	prefetcha	[%l7 + %g3] 0x11,	 0x0
	tpos	%xcc,	0x1
	brz,a	%o1,	loop_47
	tle	%icc,	0x0
	fnor	%f0,	%f14,	%f24
	movleu	%icc,	%g6,	%g5
loop_47:
	andn	%o4,	0x0209,	%o2
	edge8ln	%i4,	%l5,	%o5
	movle	%xcc,	%g1,	%g2
	edge32	%g7,	%l3,	%i3
	movneg	%icc,	%l6,	%l2
	addcc	%g4,	%i7,	%l1
	fcmpgt32	%f12,	%f8,	%i5
	edge16	%i1,	%i6,	%l0
	fbul	%fcc3,	loop_48
	nop
	setx loop_49, %l0, %l1
	jmpl %l1, %i0
	te	%icc,	0x5
	movleu	%xcc,	%i2,	%o6
loop_48:
	edge16n	%o3,	%o0,	%o7
loop_49:
	sir	0x037E
	tleu	%icc,	0x3
	xnor	%l4,	0x06C1,	%o1
	be,pn	%icc,	loop_50
	flush	%l7 + 0x54
	fnegd	%f10,	%f28
	fmovsvc	%icc,	%f31,	%f7
loop_50:
	sdivcc	%g6,	0x198D,	%g3
	ldub	[%l7 + 0x33],	%o4
	fmovde	%icc,	%f3,	%f25
	movrlez	%o2,	%i4,	%l5
	edge32	%g5,	%o5,	%g2
	tge	%icc,	0x2
	subc	%g7,	%g1,	%l3
	edge32ln	%l6,	%i3,	%l2
	sll	%i7,	%g4,	%l1
	tvs	%icc,	0x2
	stx	%i5,	[%l7 + 0x78]
	pdist	%f30,	%f2,	%f6
	fcmpeq32	%f2,	%f8,	%i1
	membar	0x0A
	tvc	%icc,	0x6
	array8	%i6,	%l0,	%i2
	wr	%g0,	0x81,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	fpack16	%f26,	%f23
	movne	%xcc,	%i0,	%o3
	movrgz	%o0,	%o6,	%o7
	st	%f18,	[%l7 + 0x6C]
	fmovs	%f16,	%f23
	orcc	%o1,	0x1AB6,	%g6
	tn	%xcc,	0x5
	fbug,a	%fcc3,	loop_51
	edge32l	%l4,	%g3,	%o2
	edge32	%i4,	%l5,	%g5
	movle	%icc,	%o5,	%g2
loop_51:
	movg	%xcc,	%o4,	%g1
	andn	%l3,	0x0177,	%l6
	umul	%i3,	%l2,	%i7
	orn	%g4,	%g7,	%l1
	edge32n	%i5,	%i6,	%i1
	fmovscc	%xcc,	%f11,	%f25
	movrlez	%i2,	%l0,	%i0
	smulcc	%o3,	0x0271,	%o0
	mulscc	%o6,	%o1,	%o7
	srax	%g6,	%l4,	%o2
	fmul8x16au	%f15,	%f4,	%f24
	wr	%g0,	0x04,	%asi
	swapa	[%l7 + 0x6C] %asi,	%g3
	fcmpgt16	%f6,	%f2,	%i4
	tpos	%xcc,	0x2
	bg,pn	%xcc,	loop_52
	movcs	%xcc,	%l5,	%o5
	set	0x4C, %l5
	sta	%f26,	[%l7 + %l5] 0x80
loop_52:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	and	%g5,	0x065B,	%g2
	tge	%xcc,	0x4
	brz	%o4,	loop_53
	orcc	%l3,	0x108C,	%l6
	set	0x40, %i5
	stba	%g1,	[%l7 + %i5] 0x15
loop_53:
	nop
	wr	%g0,	0x89,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	udivx	%i3,	0x1E12,	%i7
	smul	%l2,	0x0F7F,	%g4
	subccc	%g7,	0x00BA,	%i5
	edge8ln	%l1,	%i1,	%i2
	movg	%icc,	%l0,	%i0
	udiv	%o3,	0x09AD,	%o0
	fmovsgu	%xcc,	%f3,	%f25
	bvs,a	loop_54
	fnor	%f4,	%f14,	%f4
	movpos	%icc,	%o6,	%o1
	set	0x48, %g2
	stba	%o7,	[%l7 + %g2] 0x11
loop_54:
	membar	0x77
	edge8ln	%i6,	%l4,	%o2
	sdivx	%g6,	0x1AE1,	%g3
	ldstub	[%l7 + 0x2B],	%l5
	wr	%g0,	0x80,	%asi
	stba	%i4,	[%l7 + 0x09] %asi
	flush	%l7 + 0x0C
	taddcc	%o5,	%g2,	%g5
	array8	%o4,	%l6,	%g1
	add	%l7,	0x48,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%i3
	casa	[%l6] 0x80,	%i3,	%i7
	srax	%l3,	0x1D,	%g4
	tsubcc	%g7,	%i5,	%l2
	edge32	%l1,	%i2,	%l0
	stb	%i0,	[%l7 + 0x32]
	tvc	%xcc,	0x4
	subc	%o3,	0x0DE2,	%i1
	sllx	%o0,	%o1,	%o7
	movneg	%icc,	%o6,	%l4
	brz	%o2,	loop_55
	tcc	%icc,	0x0
	ldsw	[%l7 + 0x4C],	%g6
	andncc	%g3,	%l5,	%i4
loop_55:
	std	%f24,	[%l7 + 0x60]
	brgez,a	%i6,	loop_56
	bgu,a,pt	%icc,	loop_57
	lduw	[%l7 + 0x54],	%g2
	sir	0x0DE5
loop_56:
	alignaddr	%g5,	%o4,	%o5
loop_57:
	fcmped	%fcc3,	%f18,	%f10
	movrlz	%g1,	%i3,	%i7
	tvc	%icc,	0x3
	call	loop_58
	stbar
	sth	%l3,	[%l7 + 0x18]
	ldsw	[%l7 + 0x78],	%l6
loop_58:
	fxnor	%f30,	%f20,	%f6
	tpos	%xcc,	0x5
	tneg	%xcc,	0x7
	srl	%g7,	%i5,	%g4
	fnors	%f27,	%f18,	%f10
	sub	%l2,	0x00BF,	%l1
	fzero	%f20
	movcc	%xcc,	%l0,	%i2
	andn	%o3,	0x0861,	%i0
	bg	loop_59
	xorcc	%o0,	%o1,	%o7
	edge16n	%i1,	%l4,	%o6
	flush	%l7 + 0x2C
loop_59:
	movge	%xcc,	%o2,	%g3
	fbne,a	%fcc2,	loop_60
	fmovdcc	%icc,	%f6,	%f20
	mulscc	%g6,	0x035C,	%l5
	sll	%i6,	0x0E,	%g2
loop_60:
	bgu,a	loop_61
	stbar
	fxor	%f4,	%f18,	%f18
	bne,a,pt	%xcc,	loop_62
loop_61:
	nop
	setx	loop_63,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	sra	%i4,	%g5,	%o4
	array8	%g1,	%i3,	%o5
loop_62:
	andcc	%l3,	%l6,	%g7
loop_63:
	tge	%icc,	0x3
	set	0x58, %o5
	lda	[%l7 + %o5] 0x0c,	%f9
	sdivcc	%i5,	0x169D,	%g4
	wr	%g0,	0x18,	%asi
	ldsba	[%l7 + 0x29] %asi,	%l2
	tpos	%icc,	0x7
	set	0x53, %i6
	ldstuba	[%l7 + %i6] 0x89,	%l1
	fbu,a	%fcc0,	loop_64
	movn	%icc,	%i7,	%i2
	fmovrsgez	%o3,	%f15,	%f11
	movle	%xcc,	%i0,	%l0
loop_64:
	edge32	%o0,	%o7,	%i1
	mulx	%o1,	0x0506,	%o6
	xor	%l4,	0x1B2D,	%g3
	fandnot1	%f12,	%f0,	%f0
	fnands	%f9,	%f28,	%f10
	add	%g6,	%l5,	%i6
	fcmpgt32	%f8,	%f10,	%g2
	fmovsn	%xcc,	%f31,	%f20
	fmovrdgz	%i4,	%f4,	%f6
	movvs	%icc,	%g5,	%o4
	addcc	%g1,	0x08A9,	%i3
	tpos	%xcc,	0x0
	bn	loop_65
	fornot2s	%f15,	%f11,	%f10
	fmul8x16au	%f20,	%f29,	%f2
	fbuge	%fcc0,	loop_66
loop_65:
	srax	%o5,	0x08,	%l3
	popc	0x0BDC,	%l6
	fmovd	%f20,	%f28
loop_66:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x88,	%asi
	stba	%g7,	[%l7 + 0x21] %asi
	fandnot2s	%f26,	%f26,	%f18
	fnors	%f8,	%f3,	%f19
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	lduh	[%l7 + 0x60],	%i5
	nop
	setx loop_67, %l0, %l1
	jmpl %l1, %o2
	tn	%icc,	0x6
	movg	%icc,	%g4,	%l1
	fcmpeq32	%f4,	%f30,	%l2
loop_67:
	edge32l	%i7,	%o3,	%i0
	sth	%i2,	[%l7 + 0x5A]
	fand	%f8,	%f16,	%f4
	tsubcc	%l0,	%o7,	%o0
	movrne	%i1,	%o6,	%o1
	fmovrdgz	%l4,	%f28,	%f0
	fmovsgu	%icc,	%f17,	%f26
	edge16l	%g3,	%g6,	%l5
	fcmpeq16	%f12,	%f12,	%i6
	xorcc	%g2,	0x1125,	%g5
	fmul8x16au	%f30,	%f14,	%f8
	fzero	%f20
	tne	%icc,	0x6
	fcmpd	%fcc0,	%f16,	%f16
	stbar
	wr	%g0,	0x88,	%asi
	ldxa	[%l7 + 0x10] %asi,	%i4
	srl	%o4,	0x01,	%i3
	fbge,a	%fcc0,	loop_68
	alignaddrl	%o5,	%l3,	%l6
	fornot1	%f26,	%f30,	%f10
	movrgz	%g7,	0x1A2,	%g1
loop_68:
	bcc	%icc,	loop_69
	fcmpgt32	%f2,	%f4,	%o2
	fzeros	%f16
	nop
	setx loop_70, %l0, %l1
	jmpl %l1, %g4
loop_69:
	movrgez	%i5,	0x0FB,	%l1
	prefetch	[%l7 + 0x7C],	 0x1
	tleu	%icc,	0x0
loop_70:
	or	%i7,	%o3,	%i0
	tvc	%icc,	0x5
	sir	0x1230
	fandnot2s	%f21,	%f31,	%f26
	fones	%f3
	movgu	%xcc,	%i2,	%l2
	tcc	%xcc,	0x1
	movneg	%xcc,	%l0,	%o0
	tge	%icc,	0x2
	edge32l	%i1,	%o6,	%o7
	andncc	%o1,	%g3,	%l4
	fcmpne32	%f22,	%f18,	%g6
	fmovrsne	%l5,	%f2,	%f31
	fpadd32s	%f1,	%f9,	%f10
	fmul8x16	%f30,	%f20,	%f16
	fbg,a	%fcc1,	loop_71
	tn	%icc,	0x3
	addcc	%i6,	0x0AEF,	%g2
	orcc	%i4,	%g5,	%i3
loop_71:
	andncc	%o5,	%o4,	%l6
	udivcc	%g7,	0x1662,	%g1
	add	%l7,	0x58,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%o2,	%g4
	edge8l	%i5,	%l3,	%l1
	and	%o3,	0x1F7B,	%i7
	edge16l	%i2,	%l2,	%l0
	fmovsn	%icc,	%f27,	%f31
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movgu	%icc,	%i0,	%i1
	bl,a,pn	%xcc,	loop_72
	ta	%xcc,	0x0
	fmovsne	%icc,	%f20,	%f20
	faligndata	%f14,	%f6,	%f10
loop_72:
	tcs	%xcc,	0x4
	fcmped	%fcc0,	%f0,	%f20
	tcs	%icc,	0x6
	fxnor	%f10,	%f18,	%f28
	fxors	%f4,	%f28,	%f0
	srax	%o6,	0x1F,	%o0
	movvc	%icc,	%o7,	%g3
	fnor	%f20,	%f10,	%f22
	fmovrde	%o1,	%f8,	%f8
	fba,a	%fcc0,	loop_73
	movge	%xcc,	%g6,	%l5
	tcc	%icc,	0x5
	array8	%i6,	%l4,	%g2
loop_73:
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
	fble	%fcc0,	loop_75
	srl	%i4,	0x1D,	%g5
	alignaddrl	%i3,	%o4,	%l6
loop_74:
	stbar
loop_75:
	fpadd16s	%f24,	%f15,	%f1
	brgz,a	%g7,	loop_76
	alignaddrl	%o5,	%o2,	%g4
	tcc	%xcc,	0x5
	fmovsvc	%xcc,	%f18,	%f13
loop_76:
	fmovsgu	%icc,	%f12,	%f2
	edge8n	%i5,	%g1,	%l1
	fmovdl	%xcc,	%f18,	%f13
	orncc	%l3,	0x1E38,	%o3
	set	0x44, %l4
	lda	[%l7 + %l4] 0x1d,	%f5
	fmovsvs	%icc,	%f14,	%f6
	bpos,pt	%xcc,	loop_77
	smul	%i2,	%i7,	%l0
	smul	%l2,	%i0,	%i1
	wr	%g0,	0x80,	%asi
	stwa	%o0,	[%l7 + 0x78] %asi
loop_77:
	fmul8ulx16	%f30,	%f6,	%f0
	add	%o6,	%o7,	%g3
	movrgz	%o1,	0x00D,	%g6
	ta	%icc,	0x1
	movvs	%xcc,	%i6,	%l5
	addcc	%l4,	%i4,	%g2
	andn	%i3,	%g5,	%o4
	fxor	%f4,	%f22,	%f12
	tvc	%xcc,	0x0
	andcc	%g7,	0x1202,	%o5
	movrgz	%l6,	%o2,	%i5
	fxor	%f14,	%f4,	%f2
	fbuge,a	%fcc3,	loop_78
	orn	%g1,	%l1,	%g4
	ba,pt	%icc,	loop_79
	siam	0x2
loop_78:
	smulcc	%o3,	%i2,	%l3
	fbul	%fcc2,	loop_80
loop_79:
	tgu	%xcc,	0x2
	subc	%l0,	%i7,	%i0
	fnands	%f8,	%f10,	%f24
loop_80:
	sdivx	%l2,	0x0C22,	%i1
	fbne,a	%fcc3,	loop_81
	popc	0x0568,	%o6
	membar	0x32
	fsrc2s	%f17,	%f12
loop_81:
	fxnors	%f29,	%f19,	%f16
	flush	%l7 + 0x14
	tgu	%xcc,	0x4
	fornot2s	%f18,	%f15,	%f10
	nop
	set	0x10, %g1
	ldd	[%l7 + %g1],	%f8
	alignaddr	%o7,	%g3,	%o1
	tvs	%xcc,	0x5
	wr	%g0,	0x0c,	%asi
	ldsba	[%l7 + 0x0D] %asi,	%g6
	smulcc	%i6,	0x0C31,	%o0
	fandnot1s	%f11,	%f30,	%f26
	tvc	%icc,	0x2
	taddcc	%l4,	0x0A67,	%l5
	std	%f4,	[%l7 + 0x68]
	tpos	%icc,	0x3
	te	%icc,	0x5
	taddcc	%g2,	%i4,	%i3
	edge8ln	%g5,	%g7,	%o4
	sir	0x1F1A
	movpos	%xcc,	%o5,	%o2
	tcc	%xcc,	0x4
	edge16n	%l6,	%g1,	%l1
	fnegd	%f4,	%f14
	sdivx	%g4,	0x0488,	%o3
	ldx	[%l7 + 0x50],	%i5
	movrgz	%l3,	0x166,	%l0
	wr	%g0,	0x88,	%asi
	lduba	[%l7 + 0x4C] %asi,	%i2
	tneg	%xcc,	0x5
	edge32	%i0,	%l2,	%i1
	bge,a	%xcc,	loop_82
	sth	%i7,	[%l7 + 0x52]
	alignaddr	%o6,	%o7,	%o1
	andncc	%g6,	%g3,	%i6
loop_82:
	fbue,a	%fcc1,	loop_83
	andcc	%l4,	%o0,	%l5
	xorcc	%i4,	0x0F10,	%g2
	nop
	set	0x40, %o0
	ldstub	[%l7 + %o0],	%i3
loop_83:
	xnor	%g5,	%g7,	%o4
	subc	%o5,	%o2,	%g1
	set	0x5E, %i0
	stha	%l6,	[%l7 + %i0] 0x1c
	mova	%icc,	%g4,	%o3
	fmovrdlz	%i5,	%f16,	%f0
	fmovsvs	%xcc,	%f14,	%f24
	movle	%icc,	%l3,	%l0
	fbuge,a	%fcc2,	loop_84
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udivx	%l1,	0x1AA5,	%i2
	tleu	%icc,	0x1
loop_84:
	fmovdpos	%xcc,	%f28,	%f21
	fpsub32	%f24,	%f8,	%f16
	movvs	%icc,	%i0,	%i1
	fzeros	%f26
	fpadd32	%f18,	%f30,	%f10
	tpos	%icc,	0x5
	fmovsne	%icc,	%f17,	%f0
	tleu	%xcc,	0x6
	udivcc	%l2,	0x08BD,	%i7
	sethi	0x16A8,	%o7
	edge8ln	%o6,	%o1,	%g3
	nop
	set	0x40, %g5
	stx	%i6,	[%l7 + %g5]
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnors	%f24,	%f16,	%f20
	flushw
	sethi	0x09B6,	%l4
	movvs	%xcc,	%g6,	%o0
	or	%i4,	0x1751,	%l5
	bge,a,pn	%xcc,	loop_85
	fbge,a	%fcc2,	loop_86
	sra	%g2,	0x17,	%i3
	bpos,pt	%icc,	loop_87
loop_85:
	for	%f12,	%f16,	%f10
loop_86:
	addcc	%g7,	0x11CE,	%o4
	edge8l	%o5,	%g5,	%g1
loop_87:
	edge32l	%o2,	%l6,	%g4
	fmovrse	%o3,	%f24,	%f23
	fbu,a	%fcc3,	loop_88
	movle	%icc,	%l3,	%l0
	stbar
	tleu	%xcc,	0x4
loop_88:
	tcs	%xcc,	0x2
	movgu	%icc,	%l1,	%i2
	set	0x2C, %l6
	lduha	[%l7 + %l6] 0x81,	%i5
	fnors	%f31,	%f26,	%f11
	fmovrse	%i1,	%f30,	%f23
	tne	%icc,	0x4
	tvs	%xcc,	0x1
	tleu	%icc,	0x4
	faligndata	%f8,	%f26,	%f8
	stbar
	movg	%xcc,	%l2,	%i7
	movrgez	%i0,	0x1C3,	%o7
	orncc	%o1,	0x1383,	%g3
	subc	%i6,	%o6,	%l4
	sir	0x0402
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	swap	[%l7 + 0x4C],	%g6
	fmovsvc	%icc,	%f19,	%f9
	sethi	0x0C8E,	%i4
	movrgez	%o0,	%l5,	%i3
	fmovs	%f9,	%f2
	alignaddr	%g2,	%g7,	%o4
	lduh	[%l7 + 0x56],	%g5
	movn	%icc,	%g1,	%o2
	brgez,a	%l6,	loop_89
	udivcc	%g4,	0x07EC,	%o3
	movne	%xcc,	%l3,	%l0
	movcc	%xcc,	%l1,	%i2
loop_89:
	move	%xcc,	%i5,	%i1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrlz	%l2,	%o5,	%i0
	fpsub16s	%f2,	%f30,	%f27
	udivcc	%o7,	0x1DA8,	%o1
	edge8l	%i7,	%i6,	%g3
	sth	%o6,	[%l7 + 0x5E]
	edge8ln	%l4,	%i4,	%o0
	fbule,a	%fcc3,	loop_90
	sra	%g6,	%l5,	%i3
	fzero	%f16
	ldsb	[%l7 + 0x7C],	%g7
loop_90:
	edge32	%g2,	%g5,	%g1
	addcc	%o4,	0x197F,	%o2
	movgu	%xcc,	%g4,	%o3
	movl	%xcc,	%l6,	%l0
	edge16ln	%l1,	%i2,	%l3
	flush	%l7 + 0x1C
	udivx	%i5,	0x03D2,	%i1
	fpsub32	%f2,	%f26,	%f10
	addcc	%l2,	0x1E67,	%i0
	andcc	%o5,	%o1,	%o7
	udiv	%i6,	0x1D13,	%g3
	alignaddr	%o6,	%l4,	%i4
	move	%icc,	%o0,	%i7
	tg	%xcc,	0x2
	popc	0x140D,	%l5
	movvc	%xcc,	%i3,	%g7
	tl	%icc,	0x4
	movrgz	%g6,	0x379,	%g2
	nop
	setx loop_91, %l0, %l1
	jmpl %l1, %g5
	mova	%icc,	%g1,	%o2
	fmul8x16al	%f10,	%f29,	%f22
	movrgz	%o4,	%g4,	%o3
loop_91:
	lduw	[%l7 + 0x0C],	%l6
	xnor	%l1,	0x101A,	%i2
	fnot2s	%f19,	%f10
	movl	%icc,	%l3,	%i5
	edge16l	%l0,	%l2,	%i1
	fpadd32s	%f16,	%f25,	%f3
	sub	%i0,	%o5,	%o1
	andncc	%i6,	%o7,	%g3
	fbue,a	%fcc3,	loop_92
	edge16	%l4,	%o6,	%o0
	nop
	setx	loop_93,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	array8	%i4,	%i7,	%i3
loop_92:
	movre	%l5,	%g6,	%g7
	movrgz	%g2,	0x1F6,	%g1
loop_93:
	tcs	%icc,	0x4
	bcs,a	loop_94
	alignaddrl	%o2,	%g5,	%o4
	fpadd16	%f0,	%f30,	%f18
	fble,a	%fcc0,	loop_95
loop_94:
	st	%f4,	[%l7 + 0x5C]
	fbo,a	%fcc0,	loop_96
	smul	%g4,	0x09A7,	%l6
loop_95:
	andncc	%o3,	%i2,	%l1
	fmovsa	%xcc,	%f17,	%f10
loop_96:
	edge32l	%l3,	%l0,	%i5
	alignaddr	%l2,	%i0,	%o5
	tsubcc	%o1,	%i1,	%o7
	sllx	%i6,	%l4,	%g3
	smulcc	%o0,	0x0BFE,	%o6
	taddcc	%i7,	%i4,	%i3
	fmovdcc	%xcc,	%f11,	%f6
	tn	%xcc,	0x6
	array16	%l5,	%g6,	%g2
	tn	%xcc,	0x7
	fmovrsgez	%g7,	%f15,	%f21
	mulx	%g1,	0x04CF,	%g5
	movrgz	%o2,	%g4,	%o4
	tle	%icc,	0x3
	movvc	%xcc,	%o3,	%i2
	fmul8x16	%f11,	%f30,	%f6
	wr	%g0,	0x80,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	tsubcctv	%l1,	0x19B1,	%l3
	fmovrslz	%l6,	%f12,	%f9
	sub	%l0,	0x1D09,	%i5
	sdivcc	%l2,	0x19DF,	%i0
	fmovscs	%icc,	%f14,	%f17
	movl	%icc,	%o5,	%i1
	umulcc	%o1,	0x05F9,	%o7
	flushw
	set	0x4E, %l3
	ldsha	[%l7 + %l3] 0x1d,	%i6
	ldsw	[%l7 + 0x40],	%g3
	or	%o0,	%o6,	%i7
	edge32n	%l4,	%i4,	%i3
	tcc	%icc,	0x3
	st	%f17,	[%l7 + 0x68]
	sdivcc	%g6,	0x1FA0,	%l5
	tsubcctv	%g7,	%g1,	%g2
	flush	%l7 + 0x7C
	tne	%xcc,	0x5
	fnot2	%f16,	%f24
	edge8n	%g5,	%o2,	%o4
	bge,pt	%icc,	loop_97
	stw	%o3,	[%l7 + 0x6C]
	mulx	%i2,	0x0F04,	%g4
	andncc	%l1,	%l6,	%l0
loop_97:
	nop
	set	0x23, %i7
	lduba	[%l7 + %i7] 0x1d,	%l3
	sub	%i5,	%i0,	%o5
	nop
	setx	loop_98,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	udivx	%i1,	0x0015,	%l2
	xorcc	%o1,	%o7,	%g3
	fmovdne	%xcc,	%f28,	%f2
loop_98:
	subc	%o0,	%i6,	%i7
	alignaddr	%l4,	%i4,	%o6
	alignaddr	%i3,	%g6,	%l5
	fmovdpos	%xcc,	%f31,	%f8
	fandnot2s	%f9,	%f29,	%f3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmped	%fcc3,	%f24,	%f6
	xnor	%g7,	%g1,	%g5
	fpsub32s	%f6,	%f9,	%f18
	nop
	setx loop_99, %l0, %l1
	jmpl %l1, %o2
	fbul	%fcc3,	loop_100
	tvs	%xcc,	0x6
	fmovscs	%icc,	%f22,	%f14
loop_99:
	fornot1	%f2,	%f12,	%f20
loop_100:
	tneg	%icc,	0x6
	set	0x68, %i3
	stwa	%g2,	[%l7 + %i3] 0x14
	orn	%o3,	%i2,	%g4
	flushw
	andncc	%l1,	%l6,	%o4
	xnor	%l3,	%i5,	%i0
	addccc	%o5,	%i1,	%l2
	fbug	%fcc3,	loop_101
	popc	0x0B95,	%o1
	fmovdvc	%icc,	%f31,	%f12
	fsrc1	%f18,	%f24
loop_101:
	fblg	%fcc1,	loop_102
	fmovsvc	%xcc,	%f13,	%f2
	movvs	%icc,	%l0,	%o7
	xor	%o0,	%g3,	%i6
loop_102:
	fmovdneg	%xcc,	%f28,	%f22
	mova	%xcc,	%l4,	%i7
	fbul	%fcc3,	loop_103
	fornot2s	%f13,	%f25,	%f15
	tvs	%xcc,	0x2
	bneg	%xcc,	loop_104
loop_103:
	fmovdvs	%icc,	%f6,	%f6
	flushw
	array8	%o6,	%i4,	%g6
loop_104:
	nop
	set	0x14, %o7
	lduwa	[%l7 + %o7] 0x1c,	%i3
	smulcc	%g7,	0x0DB9,	%l5
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
	andn	%g5,	%o2,	%g2
	set	0x24, %o1
	lduwa	[%l7 + %o1] 0x18,	%o3
loop_105:
	edge16l	%i2,	%g1,	%g4
	tl	%icc,	0x4
	bcc,pt	%icc,	loop_106
	fmovsvs	%xcc,	%f17,	%f18
	fble	%fcc3,	loop_107
	sub	%l6,	%l1,	%o4
loop_106:
	edge32l	%l3,	%i5,	%o5
	ldub	[%l7 + 0x6B],	%i0
loop_107:
	alignaddrl	%l2,	%i1,	%l0
	tsubcc	%o7,	0x0BA3,	%o1
	edge32n	%g3,	%o0,	%l4
	ld	[%l7 + 0x24],	%f19
	xnor	%i7,	0x1BC1,	%i6
	tcs	%xcc,	0x3
	fbl	%fcc3,	loop_108
	srlx	%o6,	%g6,	%i3
	ldd	[%l7 + 0x10],	%i4
	fors	%f22,	%f29,	%f20
loop_108:
	fandnot2	%f26,	%f14,	%f12
	fmovscs	%xcc,	%f22,	%f8
	wr	%g0,	0x04,	%asi
	lduwa	[%l7 + 0x5C] %asi,	%l5
	array8	%g5,	%o2,	%g7
	fpack32	%f22,	%f6,	%f26
	tvc	%icc,	0x7
	movvc	%xcc,	%g2,	%i2
	array16	%g1,	%g4,	%o3
	tpos	%icc,	0x2
	tcc	%xcc,	0x0
	fpadd32	%f12,	%f8,	%f10
	edge8l	%l1,	%o4,	%l3
	mulscc	%l6,	%o5,	%i0
	fbg,a	%fcc1,	loop_109
	edge16n	%l2,	%i1,	%i5
	bg	loop_110
	smul	%l0,	%o1,	%g3
loop_109:
	fsrc2s	%f29,	%f7
	tge	%icc,	0x1
loop_110:
	pdist	%f30,	%f6,	%f24
	prefetch	[%l7 + 0x24],	 0x3
	fnegd	%f14,	%f14
	bn,a	loop_111
	movne	%xcc,	%o7,	%o0
	ldd	[%l7 + 0x20],	%i6
	fmovrslez	%l4,	%f18,	%f10
loop_111:
	addcc	%o6,	0x1C01,	%g6
	fbl,a	%fcc1,	loop_112
	srlx	%i3,	%i6,	%i4
	lduw	[%l7 + 0x68],	%g5
	udiv	%l5,	0x03A7,	%o2
loop_112:
	andncc	%g7,	%i2,	%g1
	movvs	%xcc,	%g4,	%g2
	sllx	%l1,	%o4,	%o3
	fmovrdlz	%l6,	%f28,	%f6
	brlz,a	%l3,	loop_113
	fabsd	%f14,	%f0
	lduw	[%l7 + 0x7C],	%o5
	mulscc	%l2,	0x1CEB,	%i1
loop_113:
	fbg,a	%fcc1,	loop_114
	edge8	%i0,	%i5,	%o1
	brgz	%g3,	loop_115
	edge8ln	%l0,	%o7,	%o0
loop_114:
	udivx	%l4,	0x0F2C,	%i7
	orn	%o6,	0x0AA3,	%g6
loop_115:
	fornot1s	%f8,	%f7,	%f6
	wr	%g0,	0x19,	%asi
	stwa	%i3,	[%l7 + 0x30] %asi
	udiv	%i4,	0x0665,	%g5
	fxors	%f5,	%f2,	%f15
	fxor	%f14,	%f16,	%f28
	bshuffle	%f20,	%f22,	%f2
	move	%icc,	%i6,	%o2
	popc	%g7,	%l5
	edge16ln	%g1,	%i2,	%g4
	mulscc	%l1,	%o4,	%o3
	movvs	%icc,	%g2,	%l6
	andcc	%o5,	0x0F81,	%l2
	tcs	%xcc,	0x0
	movleu	%icc,	%l3,	%i1
	umulcc	%i5,	%i0,	%o1
	mulscc	%g3,	%o7,	%o0
	udivx	%l4,	0x0BC0,	%i7
	array16	%l0,	%g6,	%i3
	xnorcc	%i4,	%o6,	%i6
	sllx	%o2,	%g5,	%l5
	nop
	set	0x24, %o3
	ldsw	[%l7 + %o3],	%g1
	mulx	%i2,	%g4,	%g7
	sllx	%l1,	%o3,	%g2
	udivx	%o4,	0x0DC2,	%o5
	addc	%l6,	0x04CE,	%l3
	sdivx	%l2,	0x00E5,	%i5
	tcs	%icc,	0x0
	movge	%xcc,	%i0,	%i1
	call	loop_116
	fbg,a	%fcc3,	loop_117
	movrgez	%o1,	%o7,	%g3
	movrne	%l4,	%o0,	%i7
loop_116:
	popc	0x13DC,	%g6
loop_117:
	srl	%l0,	%i3,	%i4
	fandnot2	%f2,	%f28,	%f4
	ldd	[%l7 + 0x48],	%o6
	sir	0x19BF
	tcc	%xcc,	0x5
	fxors	%f17,	%f10,	%f11
	movleu	%xcc,	%o2,	%g5
	movneg	%xcc,	%l5,	%i6
	array16	%g1,	%g4,	%i2
	sll	%l1,	0x03,	%g7
	alignaddr	%g2,	%o4,	%o5
	taddcc	%l6,	0x1A81,	%l3
	edge32	%o3,	%i5,	%l2
	nop
	set	0x0A, %g4
	ldstub	[%l7 + %g4],	%i0
	edge32ln	%i1,	%o7,	%o1
	fmovsl	%xcc,	%f6,	%f25
	bcc,a,pt	%xcc,	loop_118
	bvc,a,pt	%xcc,	loop_119
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovspos	%xcc,	%f7,	%f27
loop_118:
	st	%f2,	[%l7 + 0x40]
loop_119:
	nop
	wr	%g0,	0x80,	%asi
	stha	%g3,	[%l7 + 0x56] %asi
	taddcctv	%o0,	0x0D24,	%l4
	fcmpne32	%f6,	%f8,	%i7
	ble,a	%xcc,	loop_120
	alignaddrl	%l0,	%i3,	%g6
	fmovdg	%icc,	%f27,	%f1
	movrlz	%o6,	0x0A6,	%o2
loop_120:
	ldsh	[%l7 + 0x3E],	%g5
	nop
	setx	loop_121,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	edge8	%l5,	%i6,	%g1
	mova	%icc,	%g4,	%i4
	fsrc1	%f24,	%f12
loop_121:
	std	%f8,	[%l7 + 0x48]
	andn	%l1,	%g7,	%g2
	edge16	%o4,	%o5,	%i2
	flushw
	bvs,a	%xcc,	loop_122
	tleu	%xcc,	0x3
	movrgz	%l6,	0x0D2,	%l3
	fbug	%fcc2,	loop_123
loop_122:
	prefetch	[%l7 + 0x18],	 0x3
	lduh	[%l7 + 0x30],	%o3
	bvs,pt	%icc,	loop_124
loop_123:
	fmovrdgez	%l2,	%f12,	%f28
	tneg	%icc,	0x5
	fbul	%fcc2,	loop_125
loop_124:
	fornot1s	%f23,	%f27,	%f3
	taddcctv	%i5,	%i0,	%o7
	orn	%i1,	%g3,	%o0
loop_125:
	bvc,a,pt	%xcc,	loop_126
	ldx	[%l7 + 0x78],	%l4
	set	0x38, %l1
	ldsha	[%l7 + %l1] 0x10,	%o1
loop_126:
	movneg	%xcc,	%i7,	%i3
	fmovdvs	%icc,	%f26,	%f4
	movge	%icc,	%g6,	%l0
	nop
	setx	loop_127,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	array8	%o6,	%o2,	%l5
	xnorcc	%i6,	%g1,	%g4
	andncc	%g5,	%l1,	%g7
loop_127:
	bvc,a,pn	%icc,	loop_128
	xor	%i4,	%o4,	%g2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x88,	%asi
	sta	%f6,	[%l7 + 0x1C] %asi
loop_128:
	nop
	wr	%g0,	0x89,	%asi
	prefetcha	[%l7 + 0x08] %asi,	 0x2
	movrgez	%l6,	%i2,	%o3
	sllx	%l2,	%l3,	%i5
	tgu	%xcc,	0x5
	fsrc1s	%f10,	%f13
	fmovsl	%icc,	%f25,	%f21
	edge32n	%i0,	%o7,	%i1
	tvs	%icc,	0x2
	andn	%o0,	%g3,	%o1
	fbg,a	%fcc2,	loop_129
	movcs	%icc,	%l4,	%i3
	fzero	%f12
	swap	[%l7 + 0x44],	%g6
loop_129:
	array16	%l0,	%i7,	%o6
	fbe	%fcc3,	loop_130
	fone	%f28
	sethi	0x1D87,	%o2
	fbg,a	%fcc3,	loop_131
loop_130:
	tneg	%icc,	0x1
	fpackfix	%f12,	%f22
	alignaddrl	%l5,	%g1,	%g4
loop_131:
	movrlez	%g5,	0x01F,	%i6
	ldub	[%l7 + 0x76],	%g7
	fblg,a	%fcc3,	loop_132
	sir	0x1565
	nop
	set	0x1A, %o2
	ldsh	[%l7 + %o2],	%i4
	tvc	%icc,	0x7
loop_132:
	fnegd	%f18,	%f20
	bneg,a	loop_133
	addc	%o4,	0x13F4,	%g2
	fbule	%fcc0,	loop_134
	movrne	%o5,	%l6,	%l1
loop_133:
	tvs	%xcc,	0x2
	fmovdle	%icc,	%f29,	%f15
loop_134:
	edge16l	%i2,	%l2,	%l3
	fbn	%fcc0,	loop_135
	tg	%xcc,	0x4
	movleu	%icc,	%o3,	%i5
	nop
	set	0x30, %i4
	ldx	[%l7 + %i4],	%o7
loop_135:
	lduh	[%l7 + 0x5E],	%i1
	nop
	setx loop_136, %l0, %l1
	jmpl %l1, %i0
	sllx	%o0,	0x0C,	%g3
	fmovrslz	%l4,	%f23,	%f15
	alignaddrl	%o1,	%g6,	%l0
loop_136:
	sdivx	%i3,	0x09DF,	%i7
	udiv	%o6,	0x0B1D,	%l5
	nop
	setx	loop_137,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fcmpne16	%f4,	%f8,	%o2
	and	%g4,	0x0C02,	%g5
	fcmpeq16	%f30,	%f30,	%i6
loop_137:
	ldd	[%l7 + 0x60],	%f8
	movneg	%xcc,	%g7,	%i4
	andncc	%g1,	%o4,	%o5
	movrne	%l6,	%g2,	%l1
	array16	%i2,	%l2,	%o3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x6C, %l2
	sta	%f16,	[%l7 + %l2] 0x89
	movcc	%xcc,	%l3,	%i5
	stx	%o7,	[%l7 + 0x18]
	sll	%i1,	0x0D,	%o0
	taddcc	%i0,	0x0831,	%l4
	edge32n	%o1,	%g3,	%l0
	subccc	%g6,	0x163B,	%i7
	sir	0x010F
	movl	%xcc,	%i3,	%l5
	smul	%o2,	0x1072,	%o6
	lduh	[%l7 + 0x4E],	%g5
	fcmple32	%f26,	%f24,	%i6
	nop
	setx	loop_138,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fmovrdne	%g7,	%f4,	%f2
	flush	%l7 + 0x2C
	orcc	%i4,	%g4,	%g1
loop_138:
	ldub	[%l7 + 0x37],	%o4
	xorcc	%l6,	0x0D08,	%o5
	fnot1s	%f20,	%f10
	andn	%l1,	%g2,	%l2
	orcc	%i2,	0x0702,	%o3
	fbn,a	%fcc3,	loop_139
	sir	0x1854
	brgez,a	%l3,	loop_140
	andncc	%o7,	%i5,	%i1
loop_139:
	movg	%xcc,	%i0,	%o0
	taddcctv	%l4,	%o1,	%l0
loop_140:
	tn	%icc,	0x0
	wr	%g0,	0x89,	%asi
	lda	[%l7 + 0x44] %asi,	%f14
	add	%l7,	0x1C,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%g3
	casa	[%l6] 0x80,	%g3,	%i7
	udivcc	%g6,	0x1C15,	%l5
	lduh	[%l7 + 0x6C],	%o2
	fcmple32	%f18,	%f16,	%i3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbg,a	%fcc3,	loop_141
	edge32n	%g5,	%i6,	%g7
	flush	%l7 + 0x20
	and	%i4,	%g4,	%g1
loop_141:
	mova	%icc,	%o4,	%l6
	xnor	%o5,	0x168A,	%o6
	sllx	%g2,	0x1A,	%l1
	fsrc2s	%f30,	%f3
	movl	%xcc,	%l2,	%o3
	edge16	%l3,	%o7,	%i5
	fbg	%fcc2,	loop_142
	ldub	[%l7 + 0x73],	%i1
	add	%l7,	0x78,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%i0
	casxa	[%l6] %asi,	%i0,	%o0
loop_142:
	movrgez	%i2,	%l4,	%o1
	std	%f16,	[%l7 + 0x30]
	mova	%xcc,	%l0,	%i7
	movcs	%icc,	%g3,	%g6
	ldd	[%l7 + 0x08],	%f26
	stb	%o2,	[%l7 + 0x6E]
	sll	%l5,	0x09,	%g5
	smul	%i6,	%i3,	%g7
	movl	%icc,	%i4,	%g1
	movpos	%icc,	%g4,	%o4
	move	%icc,	%o5,	%l6
	bneg,a	loop_143
	ble	%icc,	loop_144
	addccc	%o6,	0x1724,	%l1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_143:
	array16	%l2,	%o3,	%l3
loop_144:
	nop
	setx	loop_145,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movrne	%o7,	0x3ED,	%g2
	flushw
	mova	%icc,	%i5,	%i1
loop_145:
	sllx	%i0,	0x08,	%i2
	tvc	%xcc,	0x0
	sdivcc	%l4,	0x017F,	%o1
	fexpand	%f27,	%f16
	fornot2	%f10,	%f20,	%f14
	mova	%icc,	%l0,	%i7
	taddcc	%g3,	%o0,	%o2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tcs	%icc,	0x2
	brlz,a	%l5,	loop_146
	movleu	%xcc,	%g6,	%i6
	sdivcc	%i3,	0x0911,	%g5
	flush	%l7 + 0x40
loop_146:
	tvc	%xcc,	0x4
	tleu	%icc,	0x0
	srl	%g7,	%i4,	%g4
	movcc	%icc,	%g1,	%o4
	wr	%g0,	0x04,	%asi
	ldswa	[%l7 + 0x74] %asi,	%l6
	sllx	%o5,	0x0F,	%l1
	addcc	%l2,	%o6,	%l3
	subc	%o3,	%o7,	%i5
	te	%icc,	0x2
	fbu,a	%fcc2,	loop_147
	tge	%xcc,	0x5
	membar	0x52
	wr	%g0,	0x81,	%asi
	lduwa	[%l7 + 0x40] %asi,	%g2
loop_147:
	fand	%f8,	%f22,	%f2
	bge,a	loop_148
	or	%i1,	0x1D62,	%i0
	srlx	%i2,	%o1,	%l4
	movg	%icc,	%i7,	%g3
loop_148:
	addccc	%l0,	%o0,	%o2
	fmovrdne	%g6,	%f16,	%f8
	addcc	%i6,	%i3,	%g5
	fmovrdne	%g7,	%f6,	%f20
	movgu	%xcc,	%l5,	%i4
	sll	%g4,	%o4,	%l6
	orncc	%g1,	0x19F1,	%o5
	bvc	%xcc,	loop_149
	andn	%l1,	0x0346,	%l2
	set	0x60, %i2
	swapa	[%l7 + %i2] 0x89,	%o6
loop_149:
	edge32l	%l3,	%o3,	%i5
	movrgez	%o7,	0x3E2,	%i1
	fcmple32	%f18,	%f30,	%g2
	movleu	%xcc,	%i0,	%o1
	fbg	%fcc2,	loop_150
	tneg	%icc,	0x3
	tpos	%xcc,	0x3
	fmovsneg	%xcc,	%f15,	%f8
loop_150:
	ba,pt	%xcc,	loop_151
	fmovsl	%xcc,	%f29,	%f23
	ldsw	[%l7 + 0x18],	%l4
	udivcc	%i2,	0x11AC,	%i7
loop_151:
	nop
	set	0x60, %o6
	lda	[%l7 + %o6] 0x88,	%f30
	ble	loop_152
	xnorcc	%l0,	0x1187,	%g3
	edge8n	%o0,	%o2,	%i6
	edge16l	%g6,	%g5,	%i3
loop_152:
	bvs	loop_153
	fbu	%fcc3,	loop_154
	brz,a	%g7,	loop_155
	alignaddr	%i4,	%l5,	%o4
loop_153:
	array16	%l6,	%g1,	%g4
loop_154:
	nop
	wr	%g0,	0x80,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
loop_155:
	tcc	%xcc,	0x4
	ta	%xcc,	0x2
	fsrc2	%f28,	%f10
	fexpand	%f5,	%f30
	fmovsg	%xcc,	%f9,	%f15
	xnor	%l1,	0x193F,	%l2
	tge	%xcc,	0x4
	edge32ln	%o5,	%l3,	%o6
	set	0x30, %g6
	lduwa	[%l7 + %g6] 0x18,	%o3
	alignaddr	%i5,	%i1,	%g2
	wr	%g0,	0x81,	%asi
	ldsha	[%l7 + 0x4A] %asi,	%o7
	fors	%f24,	%f24,	%f1
	edge32ln	%i0,	%l4,	%i2
	edge8	%o1,	%l0,	%g3
	subc	%i7,	0x01D8,	%o0
	movneg	%icc,	%o2,	%i6
	smulcc	%g5,	%g6,	%i3
	tleu	%icc,	0x2
	wr	%g0,	0x18,	%asi
	lda	[%l7 + 0x58] %asi,	%f18
	tne	%icc,	0x4
	addc	%g7,	%l5,	%i4
	ldsb	[%l7 + 0x7B],	%o4
	edge16	%g1,	%g4,	%l1
	bcc,pt	%xcc,	loop_156
	fbuge	%fcc1,	loop_157
	tcc	%icc,	0x0
	set	0x0C, %o4
	sta	%f16,	[%l7 + %o4] 0x10
loop_156:
	fnegd	%f20,	%f26
loop_157:
	edge32ln	%l2,	%l6,	%l3
	fmovrde	%o6,	%f30,	%f20
	fmul8ulx16	%f8,	%f28,	%f20
	bvc,a	loop_158
	umulcc	%o3,	%o5,	%i5
	movrgez	%g2,	%i1,	%o7
	udiv	%l4,	0x066F,	%i0
loop_158:
	faligndata	%f28,	%f4,	%f18
	movrne	%o1,	0x308,	%l0
	srl	%g3,	0x1D,	%i2
	fsrc2s	%f27,	%f4
	tleu	%xcc,	0x7
	brlez	%i7,	loop_159
	tvs	%xcc,	0x1
	tvs	%xcc,	0x5
	fbul,a	%fcc3,	loop_160
loop_159:
	fblg	%fcc0,	loop_161
	fmovrdlz	%o0,	%f24,	%f6
	fornot1s	%f24,	%f23,	%f16
loop_160:
	fandnot2s	%f11,	%f23,	%f17
loop_161:
	edge32l	%i6,	%o2,	%g6
	orn	%g5,	0x0379,	%g7
	fmovs	%f22,	%f13
	fand	%f18,	%f20,	%f14
	fmul8x16al	%f22,	%f27,	%f6
	fcmpeq32	%f18,	%f14,	%l5
	edge32ln	%i3,	%i4,	%o4
	edge16n	%g1,	%l1,	%g4
	sra	%l2,	0x08,	%l6
	addccc	%l3,	%o3,	%o5
	movcs	%icc,	%o6,	%g2
	fmovdvs	%icc,	%f25,	%f3
	movrlz	%i5,	%i1,	%l4
	set	0x40, %g7
	ldda	[%l7 + %g7] 0x11,	%f0
	prefetch	[%l7 + 0x30],	 0x0
	movne	%xcc,	%i0,	%o7
	udiv	%l0,	0x15DB,	%o1
	tl	%icc,	0x2
	smulcc	%i2,	%g3,	%i7
	stbar
	brlez,a	%i6,	loop_162
	edge32n	%o0,	%o2,	%g6
	ldsb	[%l7 + 0x6E],	%g7
	wr	%g0,	0x89,	%asi
	lduha	[%l7 + 0x72] %asi,	%g5
loop_162:
	fblg	%fcc0,	loop_163
	edge32	%i3,	%i4,	%l5
	be,a	%icc,	loop_164
	fmovdleu	%xcc,	%f5,	%f29
loop_163:
	fmovsgu	%xcc,	%f16,	%f0
	bne	loop_165
loop_164:
	movne	%xcc,	%g1,	%o4
	tvs	%xcc,	0x6
	fbul	%fcc3,	loop_166
loop_165:
	fcmpes	%fcc2,	%f23,	%f5
	movvs	%xcc,	%g4,	%l2
	ldsh	[%l7 + 0x18],	%l6
loop_166:
	nop
	set	0x1C, %i1
	lda	[%l7 + %i1] 0x18,	%f19
	sth	%l1,	[%l7 + 0x3A]
	umul	%l3,	%o3,	%o5
	fmovdcs	%icc,	%f12,	%f24
	orcc	%g2,	%o6,	%i1
	edge32ln	%l4,	%i5,	%o7
	array16	%i0,	%l0,	%i2
	movvc	%icc,	%g3,	%i7
	srl	%i6,	0x16,	%o0
	fmovrdgez	%o1,	%f28,	%f22
	or	%g6,	0x03AB,	%g7
	brlez	%o2,	loop_167
	nop
	setx loop_168, %l0, %l1
	jmpl %l1, %i3
	sir	0x1065
	fzero	%f30
loop_167:
	tneg	%icc,	0x0
loop_168:
	edge32l	%i4,	%l5,	%g5
	xnorcc	%o4,	0x0266,	%g4
	srlx	%l2,	%l6,	%g1
	and	%l1,	%l3,	%o5
	addc	%o3,	%o6,	%i1
	edge8ln	%l4,	%i5,	%g2
	fbne	%fcc2,	loop_169
	movle	%icc,	%o7,	%i0
	fmovdleu	%xcc,	%f2,	%f19
	bl,pt	%icc,	loop_170
loop_169:
	mulscc	%l0,	%i2,	%i7
	smulcc	%i6,	0x125E,	%g3
	ldsh	[%l7 + 0x1C],	%o1
loop_170:
	movg	%icc,	%g6,	%o0
	set	0x69, %l0
	ldsba	[%l7 + %l0] 0x15,	%g7
	popc	0x0510,	%o2
	fpsub32s	%f24,	%f15,	%f10
	fors	%f13,	%f17,	%f13
	edge32l	%i4,	%l5,	%i3
	subcc	%g5,	%g4,	%o4
	udivx	%l6,	0x1329,	%g1
	ta	%icc,	0x7
	fblg,a	%fcc0,	loop_171
	xorcc	%l2,	%l3,	%l1
	set	0x78, %g3
	lduwa	[%l7 + %g3] 0x11,	%o5
loop_171:
	fnot2	%f6,	%f8
	bge,pt	%xcc,	loop_172
	move	%xcc,	%o3,	%i1
	ta	%icc,	0x6
	umulcc	%o6,	0x0520,	%i5
loop_172:
	fmovsne	%xcc,	%f16,	%f18
	movrlez	%g2,	0x0DF,	%l4
	fmovdleu	%xcc,	%f28,	%f22
	fand	%f0,	%f16,	%f12
	set	0x40, %i5
	ldda	[%l7 + %i5] 0x19,	%f16
	movn	%xcc,	%o7,	%i0
	andcc	%i2,	%l0,	%i6
	ldx	[%l7 + 0x68],	%g3
	udivx	%o1,	0x175F,	%i7
	membar	0x0E
	fmovdl	%xcc,	%f15,	%f26
	alignaddrl	%o0,	%g6,	%o2
	wr	%g0,	0x19,	%asi
	stba	%i4,	[%l7 + 0x4B] %asi
	orn	%l5,	%i3,	%g7
	smul	%g5,	0x153E,	%o4
	stbar
	fcmpeq16	%f16,	%f8,	%l6
	tcc	%xcc,	0x7
	stw	%g1,	[%l7 + 0x7C]
	tl	%icc,	0x7
	fcmpes	%fcc2,	%f25,	%f17
	sir	0x004A
	movpos	%icc,	%l2,	%g4
	flushw
	udivx	%l3,	0x0FF9,	%o5
	tg	%xcc,	0x4
	tvc	%icc,	0x4
	set	0x2A, %g2
	stha	%o3,	[%l7 + %g2] 0x11
	edge16l	%i1,	%o6,	%i5
	brz	%g2,	loop_173
	bvs,pt	%icc,	loop_174
	fmovrslez	%l4,	%f9,	%f15
	movrlz	%o7,	%l1,	%i2
loop_173:
	tcc	%icc,	0x0
loop_174:
	fbl,a	%fcc3,	loop_175
	tge	%icc,	0x7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movne	%xcc,	%l0,	%i0
loop_175:
	bne,a,pn	%icc,	loop_176
	nop
	setx	loop_177,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	move	%xcc,	%g3,	%i6
	ble,pt	%xcc,	loop_178
loop_176:
	sir	0x12A4
loop_177:
	fornot1	%f2,	%f18,	%f22
	xnorcc	%o1,	0x10DC,	%i7
loop_178:
	nop
	set	0x70, %l5
	stxa	%g6,	[%l7 + %l5] 0x1c
	wr	%g0,	0x10,	%asi
	stha	%o2,	[%l7 + 0x22] %asi
	udivcc	%i4,	0x04C4,	%l5
	taddcc	%o0,	0x0A19,	%i3
	xnorcc	%g7,	0x12CD,	%g5
	movrlz	%l6,	%g1,	%o4
	fnot2s	%f17,	%f31
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmul8sux16	%f8,	%f4,	%f24
	brgz	%l2,	loop_179
	sra	%g4,	%l3,	%o5
	sethi	0x16D6,	%o3
	xnor	%o6,	%i5,	%i1
loop_179:
	tvs	%icc,	0x2
	movl	%xcc,	%l4,	%g2
	fnands	%f4,	%f28,	%f8
	fornot1s	%f9,	%f24,	%f21
	sll	%o7,	%i2,	%l1
	fbge	%fcc0,	loop_180
	lduw	[%l7 + 0x60],	%l0
	fone	%f10
	membar	0x05
loop_180:
	movgu	%icc,	%i0,	%g3
	fbu	%fcc2,	loop_181
	sll	%o1,	%i6,	%g6
	movrlez	%o2,	%i7,	%l5
	fbue,a	%fcc3,	loop_182
loop_181:
	movrlez	%o0,	0x128,	%i4
	tsubcc	%i3,	0x08C2,	%g7
	tg	%xcc,	0x2
loop_182:
	orn	%g5,	0x007D,	%l6
	nop
	setx	loop_183,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fnot1s	%f31,	%f19
	nop
	setx	loop_184,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	edge8n	%o4,	%g1,	%l2
loop_183:
	stw	%g4,	[%l7 + 0x5C]
	sra	%l3,	0x0F,	%o5
loop_184:
	flushw
	fbuge	%fcc3,	loop_185
	ta	%xcc,	0x2
	sdivcc	%o3,	0x0587,	%i5
	movpos	%xcc,	%o6,	%i1
loop_185:
	sdivcc	%l4,	0x0294,	%o7
	sethi	0x0321,	%g2
	ldub	[%l7 + 0x4D],	%l1
	wr	%g0,	0x11,	%asi
	swapa	[%l7 + 0x5C] %asi,	%i2
	mulx	%i0,	0x1B35,	%l0
	fnegs	%f4,	%f1
	edge32l	%g3,	%o1,	%i6
	fmovsneg	%xcc,	%f13,	%f14
	movgu	%icc,	%o2,	%g6
	subcc	%l5,	%i7,	%i4
	movn	%xcc,	%i3,	%g7
	movcc	%icc,	%g5,	%l6
	movpos	%xcc,	%o0,	%g1
	sethi	0x0FB8,	%l2
	fnegs	%f9,	%f22
	fblg	%fcc0,	loop_186
	stbar
	set	0x14, %i6
	ldsha	[%l7 + %i6] 0x14,	%g4
loop_186:
	tvc	%icc,	0x2
	sra	%o4,	0x1D,	%l3
	sdiv	%o5,	0x0941,	%i5
	fmovsvs	%xcc,	%f5,	%f18
	orcc	%o6,	0x11B1,	%o3
	wr	%g0,	0x89,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	edge8ln	%i1,	%o7,	%l4
	subcc	%l1,	%g2,	%i0
	sdiv	%l0,	0x095A,	%i2
	subccc	%g3,	0x0224,	%o1
	fmovrdgez	%i6,	%f18,	%f4
	tge	%icc,	0x0
	ldd	[%l7 + 0x08],	%f10
	membar	0x14
	edge16ln	%g6,	%o2,	%l5
	fbul	%fcc3,	loop_187
	sth	%i7,	[%l7 + 0x24]
	subccc	%i4,	0x1465,	%i3
	sth	%g7,	[%l7 + 0x52]
loop_187:
	xorcc	%g5,	0x1BBA,	%o0
	fsrc2s	%f18,	%f7
	fmovsleu	%icc,	%f24,	%f31
	set	0x30, %o5
	ldda	[%l7 + %o5] 0x04,	%g0
	wr	%g0,	0x04,	%asi
	stba	%l2,	[%l7 + 0x71] %asi
	tle	%icc,	0x3
	fxnors	%f0,	%f18,	%f20
	fnot2	%f4,	%f0
	edge8	%l6,	%o4,	%l3
	fmovrdlz	%g4,	%f24,	%f20
	srax	%i5,	%o6,	%o3
	srlx	%o5,	0x13,	%i1
	subcc	%o7,	%l1,	%l4
	tcc	%xcc,	0x0
	fmovdn	%xcc,	%f12,	%f17
	fbne	%fcc1,	loop_188
	movgu	%xcc,	%i0,	%g2
	fmovrsne	%l0,	%f12,	%f3
	andn	%g3,	0x1167,	%o1
loop_188:
	movrgz	%i2,	%g6,	%o2
	stw	%i6,	[%l7 + 0x38]
	fandnot2	%f0,	%f18,	%f8
	mulscc	%l5,	0x1C4B,	%i7
	tvs	%xcc,	0x1
	edge8l	%i4,	%i3,	%g5
	edge8ln	%g7,	%o0,	%l2
	membar	0x10
	edge32n	%g1,	%l6,	%o4
	xnorcc	%l3,	0x1F3E,	%g4
	tsubcctv	%o6,	0x0B8D,	%o3
	fmovsle	%icc,	%f28,	%f25
	sir	0x1F05
	fmovrdne	%i5,	%f20,	%f18
	movcc	%icc,	%i1,	%o5
	st	%f8,	[%l7 + 0x0C]
	fbg	%fcc3,	loop_189
	movgu	%icc,	%l1,	%o7
	orn	%l4,	0x19B6,	%i0
	tneg	%icc,	0x7
loop_189:
	array16	%g2,	%l0,	%g3
	movrlez	%i2,	%o1,	%o2
	set	0x34, %g1
	stwa	%g6,	[%l7 + %g1] 0x81
	stx	%i6,	[%l7 + 0x30]
	tn	%xcc,	0x1
	set	0x7E, %o0
	lduha	[%l7 + %o0] 0x1d,	%i7
	movne	%xcc,	%l5,	%i3
	movg	%xcc,	%g5,	%i4
	movge	%xcc,	%o0,	%l2
	fmovsleu	%xcc,	%f4,	%f6
	movre	%g1,	%l6,	%g7
	fmovsa	%xcc,	%f20,	%f11
	fnot1s	%f6,	%f9
	srax	%o4,	0x1C,	%l3
	fcmpne16	%f26,	%f14,	%g4
	call	loop_190
	srl	%o3,	%o6,	%i1
	movpos	%xcc,	%i5,	%l1
	fnand	%f22,	%f4,	%f28
loop_190:
	fpsub32s	%f5,	%f9,	%f24
	ta	%xcc,	0x5
	bpos	%icc,	loop_191
	movne	%icc,	%o7,	%l4
	move	%icc,	%o5,	%g2
	set	0x20, %l4
	prefetcha	[%l7 + %l4] 0x11,	 0x1
loop_191:
	tl	%icc,	0x1
	sdivx	%l0,	0x1454,	%g3
	fbule,a	%fcc2,	loop_192
	fnors	%f25,	%f31,	%f2
	sdivcc	%o1,	0x1666,	%o2
	array32	%g6,	%i2,	%i6
loop_192:
	ldub	[%l7 + 0x79],	%i7
	movn	%xcc,	%l5,	%i3
	orn	%g5,	0x135D,	%i4
	membar	0x57
	fnors	%f14,	%f28,	%f12
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movge	%icc,	%o0,	%l2
	bvs,a,pt	%icc,	loop_193
	movleu	%xcc,	%g1,	%g7
	ldsh	[%l7 + 0x6C],	%o4
	ldsb	[%l7 + 0x5B],	%l6
loop_193:
	move	%icc,	%l3,	%g4
	fmul8x16al	%f30,	%f24,	%f26
	brgz	%o3,	loop_194
	movle	%xcc,	%o6,	%i5
	array32	%i1,	%l1,	%l4
	sth	%o5,	[%l7 + 0x62]
loop_194:
	fsrc1s	%f28,	%f12
	tsubcctv	%g2,	0x17C5,	%i0
	fpack32	%f0,	%f12,	%f20
	fsrc1	%f10,	%f0
	wr	%g0,	0x11,	%asi
	ldsha	[%l7 + 0x62] %asi,	%l0
	edge8n	%g3,	%o7,	%o2
	srax	%g6,	0x0B,	%o1
	umul	%i2,	0x116C,	%i7
	subccc	%i6,	%i3,	%l5
	movneg	%xcc,	%i4,	%o0
	xor	%l2,	0x14BF,	%g1
	bl,a	%xcc,	loop_195
	fmovde	%xcc,	%f14,	%f13
	ldd	[%l7 + 0x28],	%g4
	subccc	%o4,	%g7,	%l3
loop_195:
	tgu	%icc,	0x7
	array32	%g4,	%l6,	%o6
	ldstub	[%l7 + 0x2A],	%i5
	tleu	%icc,	0x4
	bvs	%icc,	loop_196
	ldsw	[%l7 + 0x40],	%o3
	tvs	%xcc,	0x0
	sdiv	%i1,	0x1F18,	%l1
loop_196:
	movle	%xcc,	%l4,	%g2
	movrgz	%o5,	%i0,	%l0
	fmovrdne	%g3,	%f8,	%f30
	fcmpgt32	%f30,	%f16,	%o7
	fbe,a	%fcc0,	loop_197
	andncc	%o2,	%o1,	%i2
	mova	%icc,	%g6,	%i7
	move	%icc,	%i6,	%l5
loop_197:
	alignaddr	%i4,	%o0,	%i3
	fcmple16	%f8,	%f14,	%g1
	tneg	%xcc,	0x1
	fandnot1s	%f9,	%f16,	%f14
	edge32	%l2,	%g5,	%o4
	addc	%l3,	%g4,	%g7
	nop
	setx loop_198, %l0, %l1
	jmpl %l1, %o6
	tne	%icc,	0x2
	set	0x50, %i0
	lduwa	[%l7 + %i0] 0x18,	%l6
loop_198:
	movvs	%xcc,	%o3,	%i5
	fmuld8sux16	%f18,	%f10,	%f6
	movle	%xcc,	%l1,	%l4
	or	%g2,	%o5,	%i0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movcc	%icc,	%l0,	%i1
	fpadd32	%f30,	%f24,	%f18
	movrlez	%g3,	0x25C,	%o7
	edge8l	%o2,	%i2,	%g6
	movpos	%icc,	%i7,	%o1
	sethi	0x0D2B,	%l5
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
	fmovdgu	%icc,	%f22,	%f27
	fbu,a	%fcc0,	loop_200
	edge32ln	%i4,	%i6,	%o0
loop_199:
	ta	%xcc,	0x2
	tn	%xcc,	0x3
loop_200:
	smulcc	%g1,	%l2,	%g5
	edge8	%i3,	%l3,	%g4
	fbue,a	%fcc3,	loop_201
	movvc	%xcc,	%g7,	%o6
	fbo	%fcc0,	loop_202
	edge16l	%o4,	%l6,	%o3
loop_201:
	movpos	%xcc,	%l1,	%i5
	fmovda	%xcc,	%f30,	%f9
loop_202:
	srlx	%g2,	%l4,	%o5
	smul	%l0,	%i0,	%i1
	orcc	%g3,	%o2,	%o7
	tge	%xcc,	0x4
	fmovrde	%g6,	%f30,	%f14
	fcmpgt32	%f22,	%f22,	%i2
	addc	%i7,	%o1,	%l5
	fnot1s	%f26,	%f24
	stb	%i6,	[%l7 + 0x70]
	taddcctv	%i4,	%g1,	%o0
	mova	%xcc,	%g5,	%l2
	andncc	%l3,	%i3,	%g4
	fcmps	%fcc2,	%f0,	%f22
	and	%o6,	%g7,	%o4
	add	%o3,	%l6,	%i5
	movg	%icc,	%l1,	%l4
	fmul8x16au	%f29,	%f4,	%f22
	movgu	%icc,	%o5,	%l0
	fbne,a	%fcc0,	loop_203
	fandnot2	%f0,	%f8,	%f14
	taddcc	%g2,	0x0EBE,	%i1
	edge32l	%i0,	%o2,	%o7
loop_203:
	movgu	%xcc,	%g6,	%i2
	fornot2	%f24,	%f8,	%f16
	flush	%l7 + 0x34
	fbug,a	%fcc1,	loop_204
	alignaddr	%g3,	%i7,	%o1
	addcc	%l5,	%i4,	%g1
	membar	0x45
loop_204:
	mulscc	%i6,	0x0FB8,	%g5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpmerge	%f29,	%f25,	%f22
	edge8l	%o0,	%l2,	%l3
	wr	%g0,	0x11,	%asi
	lduwa	[%l7 + 0x64] %asi,	%g4
	brgez,a	%o6,	loop_205
	subc	%g7,	%i3,	%o3
	fmovs	%f30,	%f0
	bge,pt	%icc,	loop_206
loop_205:
	and	%l6,	%o4,	%i5
	fmovrdlz	%l4,	%f30,	%f2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_206:
	fmul8x16au	%f16,	%f8,	%f10
	addccc	%o5,	0x0652,	%l1
	umulcc	%g2,	0x178D,	%l0
	edge16ln	%i0,	%i1,	%o2
	sethi	0x0287,	%g6
	fmul8x16	%f6,	%f14,	%f12
	ldub	[%l7 + 0x1D],	%i2
	set	0x44, %l6
	swapa	[%l7 + %l6] 0x89,	%o7
	set	0x5E, %g5
	lduha	[%l7 + %g5] 0x80,	%i7
	edge16ln	%o1,	%g3,	%l5
	fmovrsgez	%i4,	%f7,	%f29
	fnor	%f0,	%f4,	%f2
	tleu	%icc,	0x4
	be,a,pn	%xcc,	loop_207
	move	%xcc,	%i6,	%g5
	ldd	[%l7 + 0x08],	%f28
	set	0x3C, %l3
	lda	[%l7 + %l3] 0x04,	%f9
loop_207:
	taddcc	%g1,	0x061D,	%o0
	movpos	%xcc,	%l3,	%l2
	smul	%o6,	%g7,	%g4
	tl	%icc,	0x5
	xor	%o3,	%i3,	%o4
	movne	%xcc,	%i5,	%l6
	fbn,a	%fcc0,	loop_208
	bneg,a,pn	%icc,	loop_209
	movrlez	%o5,	%l1,	%g2
	brnz,a	%l4,	loop_210
loop_208:
	tvs	%icc,	0x6
loop_209:
	edge8n	%l0,	%i1,	%i0
	movge	%xcc,	%g6,	%i2
loop_210:
	movrgez	%o2,	0x1A1,	%o7
	array8	%o1,	%i7,	%l5
	ldd	[%l7 + 0x28],	%f10
	sdivx	%g3,	0x13BE,	%i6
	tl	%xcc,	0x7
	mulx	%g5,	%g1,	%o0
	sdivx	%i4,	0x02C6,	%l2
	move	%xcc,	%o6,	%g7
	fmovrsne	%l3,	%f7,	%f22
	lduh	[%l7 + 0x1E],	%o3
	fnot2	%f16,	%f20
	bvs,a,pt	%icc,	loop_211
	edge8ln	%g4,	%o4,	%i5
	taddcctv	%l6,	%i3,	%o5
	tn	%xcc,	0x3
loop_211:
	edge8	%g2,	%l1,	%l0
	array16	%i1,	%i0,	%l4
	movle	%xcc,	%i2,	%o2
	call	loop_212
	srax	%g6,	0x11,	%o1
	movrlez	%i7,	%o7,	%g3
	edge16ln	%l5,	%g5,	%g1
loop_212:
	nop
	set	0x0E, %i7
	stha	%i6,	[%l7 + %i7] 0x1c
	fbn,a	%fcc1,	loop_213
	smul	%i4,	0x0392,	%o0
	membar	0x7D
	bl,a,pt	%xcc,	loop_214
loop_213:
	fandnot2	%f30,	%f20,	%f30
	wr	%g0,	0x18,	%asi
	ldswa	[%l7 + 0x44] %asi,	%o6
loop_214:
	fmovdpos	%xcc,	%f27,	%f5
	tg	%icc,	0x6
	fmovsn	%xcc,	%f3,	%f30
	set	0x48, %o7
	lduha	[%l7 + %o7] 0x18,	%g7
	fbne,a	%fcc2,	loop_215
	ba,a,pn	%xcc,	loop_216
	movrlez	%l2,	%l3,	%o3
	fmuld8sux16	%f31,	%f9,	%f22
loop_215:
	orcc	%g4,	0x1F7C,	%i5
loop_216:
	alignaddr	%o4,	%l6,	%i3
	fcmpd	%fcc3,	%f16,	%f16
	movle	%xcc,	%g2,	%l1
	fornot1s	%f10,	%f2,	%f23
	fbg,a	%fcc2,	loop_217
	bcs,a,pt	%xcc,	loop_218
	fcmpne32	%f16,	%f2,	%l0
	alignaddrl	%o5,	%i1,	%i0
loop_217:
	ta	%icc,	0x5
loop_218:
	array16	%l4,	%o2,	%g6
	wr	%g0,	0x80,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	fmovde	%xcc,	%f12,	%f7
	fpackfix	%f2,	%f18
	fcmped	%fcc3,	%f18,	%f18
	set	0x24, %i3
	lduwa	[%l7 + %i3] 0x14,	%i2
	tge	%xcc,	0x7
	fmovrdlz	%i7,	%f30,	%f0
	fmovdgu	%icc,	%f2,	%f0
	bleu,pn	%icc,	loop_219
	fmovspos	%icc,	%f9,	%f15
	fmovrdgez	%o7,	%f2,	%f14
	fornot2	%f4,	%f0,	%f26
loop_219:
	fbl,a	%fcc0,	loop_220
	bcs,pt	%icc,	loop_221
	addccc	%g3,	%o1,	%l5
	orcc	%g5,	0x1D1F,	%i6
loop_220:
	movrlz	%g1,	%i4,	%o0
loop_221:
	fmovdge	%icc,	%f31,	%f31
	fexpand	%f13,	%f0
	fmovdne	%icc,	%f20,	%f3
	srl	%g7,	%o6,	%l2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x81,	%asi
	ldda	[%l7 + 0x10] %asi,	%o2
	bg,a,pn	%xcc,	loop_222
	brgz,a	%l3,	loop_223
	swap	[%l7 + 0x5C],	%i5
	movvc	%icc,	%g4,	%o4
loop_222:
	addccc	%l6,	%i3,	%l1
loop_223:
	move	%icc,	%g2,	%o5
	fsrc2s	%f23,	%f19
	xor	%l0,	0x134E,	%i1
	addccc	%i0,	0x1F3A,	%o2
	move	%icc,	%g6,	%l4
	std	%f28,	[%l7 + 0x40]
	tge	%xcc,	0x3
	edge16ln	%i2,	%i7,	%o7
	fmovrde	%g3,	%f18,	%f18
	fcmpne16	%f0,	%f30,	%l5
	movrlez	%g5,	0x2CC,	%i6
	smulcc	%g1,	%i4,	%o1
	nop
	setx	loop_224,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fmovrdgez	%g7,	%f22,	%f28
	fmovrdlez	%o6,	%f10,	%f4
	srl	%o0,	%l2,	%o3
loop_224:
	tg	%xcc,	0x2
	edge8n	%i5,	%g4,	%l3
	umul	%o4,	%i3,	%l1
	nop
	setx	loop_225,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	alignaddr	%g2,	%o5,	%l0
	movre	%l6,	%i1,	%o2
	set	0x30, %o1
	ldda	[%l7 + %o1] 0x1c,	%i0
loop_225:
	tle	%icc,	0x0
	ble,a	loop_226
	movrgz	%l4,	0x260,	%i2
	tvc	%icc,	0x2
	orn	%g6,	%o7,	%i7
loop_226:
	fnors	%f24,	%f7,	%f20
	tcs	%xcc,	0x2
	movrgz	%l5,	%g3,	%i6
	sllx	%g5,	0x07,	%g1
	add	%l7,	0x74,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%i4
	casa	[%l6] %asi,	%i4,	%o1
	udivcc	%g7,	0x026E,	%o6
	sdiv	%o0,	0x00D1,	%l2
	sdivcc	%i5,	0x0E42,	%g4
	subccc	%l3,	0x06AF,	%o4
	tpos	%icc,	0x0
	fble,a	%fcc0,	loop_227
	bn,pt	%icc,	loop_228
	sdivcc	%o3,	0x1570,	%l1
	sllx	%g2,	%o5,	%i3
loop_227:
	movpos	%xcc,	%l0,	%i1
loop_228:
	sra	%l6,	%o2,	%l4
	bl	loop_229
	ta	%icc,	0x0
	tpos	%icc,	0x0
	movcc	%xcc,	%i0,	%i2
loop_229:
	tvs	%xcc,	0x7
	movne	%xcc,	%o7,	%g6
	tpos	%xcc,	0x5
	bg,a,pt	%xcc,	loop_230
	fmovrdlez	%l5,	%f4,	%f16
	nop
	setx	loop_231,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	addc	%i7,	%i6,	%g5
loop_230:
	fbue	%fcc3,	loop_232
	tpos	%icc,	0x0
loop_231:
	fmovsne	%icc,	%f3,	%f0
	movrgz	%g1,	%g3,	%o1
loop_232:
	edge8n	%g7,	%o6,	%o0
	movneg	%xcc,	%l2,	%i5
	subc	%i4,	%g4,	%o4
	edge8n	%o3,	%l3,	%g2
	bcs,a	loop_233
	flushw
	set	0x28, %o3
	prefetcha	[%l7 + %o3] 0x04,	 0x0
loop_233:
	xnorcc	%o5,	%i3,	%l0
	fzero	%f10
	movle	%icc,	%l6,	%o2
	fabsd	%f0,	%f2
	udiv	%l4,	0x1B6D,	%i1
	srl	%i2,	0x12,	%o7
	srl	%g6,	%i0,	%i7
	movgu	%xcc,	%l5,	%g5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sub	%i6,	%g3,	%g1
	subccc	%o1,	%o6,	%g7
	array8	%l2,	%o0,	%i5
	bpos,a	%xcc,	loop_234
	movleu	%icc,	%i4,	%g4
	smul	%o3,	%o4,	%g2
	set	0x1E, %g4
	stba	%l3,	[%l7 + %g4] 0x89
loop_234:
	tvs	%xcc,	0x2
	stw	%o5,	[%l7 + 0x74]
	fbn,a	%fcc2,	loop_235
	addc	%i3,	%l1,	%l6
	subcc	%l0,	0x0AF4,	%o2
	ldd	[%l7 + 0x08],	%l4
loop_235:
	ba,a	loop_236
	flushw
	fmovsvc	%icc,	%f12,	%f9
	udiv	%i2,	0x1C28,	%o7
loop_236:
	fmovdvc	%xcc,	%f4,	%f29
	tl	%icc,	0x7
	fabss	%f4,	%f2
	wr	%g0,	0x10,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	fsrc2s	%f12,	%f4
	call	loop_237
	alignaddr	%i1,	%i0,	%i7
	nop
	set	0x68, %o2
	ldx	[%l7 + %o2],	%l5
	fnegd	%f6,	%f4
loop_237:
	brgz,a	%g5,	loop_238
	tvc	%xcc,	0x4
	wr	%g0,	0x89,	%asi
	ldstuba	[%l7 + 0x64] %asi,	%g6
loop_238:
	ldsw	[%l7 + 0x78],	%i6
	nop
	set	0x4F, %i4
	stb	%g1,	[%l7 + %i4]
	fmovrsne	%o1,	%f23,	%f13
	wr	%g0,	0x04,	%asi
	sta	%f15,	[%l7 + 0x4C] %asi
	fmovdneg	%icc,	%f8,	%f22
	wr	%g0,	0x80,	%asi
	lda	[%l7 + 0x50] %asi,	%f20
	lduw	[%l7 + 0x28],	%o6
	addccc	%g7,	%l2,	%g3
	set	0x6C, %l1
	swapa	[%l7 + %l1] 0x88,	%i5
	sub	%i4,	%o0,	%o3
	edge32	%g4,	%o4,	%g2
	movcs	%xcc,	%l3,	%i3
	alignaddr	%l1,	%l6,	%o5
	set	0x40, %i2
	ldda	[%l7 + %i2] 0x1c,	%f16
	movrne	%l0,	0x1A6,	%o2
	set	0x70, %o6
	ldxa	[%l7 + %o6] 0x14,	%i2
	alignaddr	%o7,	%l4,	%i0
	mulscc	%i7,	%i1,	%g5
	srlx	%l5,	0x09,	%g6
	sllx	%g1,	%i6,	%o1
	add	%g7,	0x1B26,	%o6
	tl	%xcc,	0x2
	fcmps	%fcc1,	%f30,	%f1
	edge32ln	%l2,	%g3,	%i4
	taddcc	%i5,	0x0A17,	%o0
	fmul8x16al	%f31,	%f14,	%f20
	edge8ln	%g4,	%o4,	%o3
	addcc	%g2,	%l3,	%l1
	wr	%g0,	0x11,	%asi
	ldsha	[%l7 + 0x6C] %asi,	%l6
	movrgz	%i3,	0x3C4,	%l0
	ta	%icc,	0x2
	movneg	%icc,	%o5,	%i2
	movn	%xcc,	%o2,	%l4
	taddcc	%i0,	%o7,	%i1
	fbne,a	%fcc0,	loop_239
	swap	[%l7 + 0x60],	%g5
	sdivx	%l5,	0x1665,	%g6
	brlez	%i7,	loop_240
loop_239:
	mova	%icc,	%i6,	%o1
	alignaddr	%g7,	%o6,	%l2
	tne	%xcc,	0x3
loop_240:
	edge32n	%g1,	%i4,	%i5
	sethi	0x1E1B,	%o0
	sll	%g3,	0x10,	%o4
	edge16ln	%o3,	%g2,	%l3
	fblg	%fcc0,	loop_241
	edge16	%g4,	%l6,	%i3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	popc	%l1,	%l0
loop_241:
	sll	%i2,	%o2,	%l4
	movrgez	%i0,	%o5,	%i1
	edge16n	%g5,	%o7,	%g6
	movre	%l5,	%i6,	%o1
	sllx	%i7,	%o6,	%g7
	tne	%xcc,	0x1
	fmovsgu	%icc,	%f29,	%f1
	fmovsne	%icc,	%f13,	%f23
	edge8n	%l2,	%i4,	%g1
	add	%i5,	0x00A4,	%o0
	movrne	%g3,	0x031,	%o3
	mova	%icc,	%o4,	%g2
	movcs	%xcc,	%l3,	%g4
	fxors	%f27,	%f18,	%f10
	movneg	%icc,	%l6,	%i3
	umul	%l1,	%l0,	%i2
	addcc	%o2,	%i0,	%o5
	fxor	%f18,	%f4,	%f10
	ldstub	[%l7 + 0x5F],	%i1
	array16	%g5,	%o7,	%g6
	array16	%l4,	%l5,	%i6
	tn	%xcc,	0x7
	tn	%icc,	0x0
	add	%o1,	%o6,	%i7
	andn	%g7,	0x074A,	%i4
	udivx	%l2,	0x0D2F,	%i5
	fmovspos	%icc,	%f25,	%f31
	taddcctv	%o0,	%g1,	%o3
	bge	%icc,	loop_242
	nop
	set	0x36, %g6
	ldsh	[%l7 + %g6],	%o4
	movcc	%icc,	%g2,	%g3
	fmul8x16	%f10,	%f2,	%f24
loop_242:
	popc	%l3,	%g4
	movg	%icc,	%l6,	%l1
	fnegd	%f30,	%f10
	orn	%i3,	0x0C93,	%i2
	orn	%l0,	%o2,	%o5
	wr	%g0,	0x04,	%asi
	sta	%f11,	[%l7 + 0x68] %asi
	fpsub32	%f10,	%f0,	%f30
	orn	%i1,	%i0,	%o7
	set	0x08, %l2
	stba	%g6,	[%l7 + %l2] 0x1d
	taddcc	%l4,	%g5,	%i6
	tneg	%xcc,	0x5
	set	0x60, %g7
	sta	%f12,	[%l7 + %g7] 0x89
	set	0x24, %o4
	swapa	[%l7 + %o4] 0x80,	%o1
	bvs,pn	%xcc,	loop_243
	call	loop_244
	alignaddrl	%o6,	%i7,	%l5
	set	0x5C, %i1
	sta	%f27,	[%l7 + %i1] 0x10
loop_243:
	fmovd	%f28,	%f24
loop_244:
	fcmpes	%fcc3,	%f8,	%f6
	fbug	%fcc2,	loop_245
	tneg	%xcc,	0x7
	fcmple32	%f0,	%f20,	%g7
	fbg	%fcc0,	loop_246
loop_245:
	ta	%icc,	0x0
	fxnors	%f23,	%f22,	%f0
	ld	[%l7 + 0x50],	%f1
loop_246:
	udiv	%l2,	0x0797,	%i4
	array8	%o0,	%i5,	%o3
	tne	%xcc,	0x6
	fmovsvs	%xcc,	%f0,	%f3
	flush	%l7 + 0x50
	fnot1s	%f21,	%f4
	xorcc	%o4,	0x09DE,	%g2
	mulscc	%g3,	%g1,	%g4
	tcc	%icc,	0x7
	subcc	%l6,	%l3,	%i3
	fornot2s	%f1,	%f24,	%f23
	ba,pn	%xcc,	loop_247
	mulscc	%i2,	%l0,	%o2
	addccc	%l1,	%i1,	%i0
	ldd	[%l7 + 0x30],	%o6
loop_247:
	orcc	%g6,	0x0CBB,	%o5
	add	%l7,	0x10,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%l4,	%g5
	move	%icc,	%i6,	%o6
	call	loop_248
	movcc	%icc,	%o1,	%i7
	wr	%g0,	0x10,	%asi
	stwa	%l5,	[%l7 + 0x58] %asi
loop_248:
	movcs	%icc,	%l2,	%i4
	wr	%g0,	0x04,	%asi
	lduba	[%l7 + 0x6E] %asi,	%o0
	fmovsl	%xcc,	%f21,	%f22
	movne	%xcc,	%i5,	%o3
	ldsh	[%l7 + 0x6A],	%g7
	fcmpeq32	%f12,	%f22,	%o4
	fandnot1s	%f24,	%f1,	%f12
	movrlez	%g2,	%g1,	%g4
	tn	%icc,	0x3
	tcs	%icc,	0x2
	movge	%icc,	%l6,	%l3
	smulcc	%g3,	%i2,	%i3
	taddcc	%o2,	0x0347,	%l0
	add	%i1,	%l1,	%o7
	movl	%xcc,	%i0,	%g6
	movvs	%xcc,	%o5,	%g5
	movpos	%icc,	%i6,	%l4
	sir	0x0415
	movne	%icc,	%o6,	%i7
	movle	%icc,	%o1,	%l5
	bvs,a,pt	%xcc,	loop_249
	sethi	0x1B62,	%l2
	taddcctv	%i4,	%o0,	%o3
	edge32l	%g7,	%i5,	%g2
loop_249:
	nop
	wr	%g0,	0x19,	%asi
	stxa	%g1,	[%l7 + 0x70] %asi
	fpackfix	%f0,	%f13
	fmovsa	%icc,	%f7,	%f21
	udivcc	%g4,	0x1261,	%l6
	xnor	%o4,	%l3,	%i2
	tleu	%xcc,	0x2
	fba,a	%fcc0,	loop_250
	array32	%i3,	%g3,	%o2
	fmovrdgez	%l0,	%f8,	%f14
	fands	%f6,	%f13,	%f9
loop_250:
	fmovsg	%icc,	%f31,	%f11
	or	%l1,	0x0837,	%i1
	xnorcc	%o7,	0x19D2,	%i0
	sdivx	%g6,	0x0286,	%o5
	fsrc2s	%f5,	%f8
	fexpand	%f6,	%f14
	smul	%g5,	%l4,	%i6
	taddcctv	%i7,	%o1,	%l5
	wr	%g0,	0x88,	%asi
	stxa	%l2,	[%l7 + 0x50] %asi
	array32	%i4,	%o0,	%o3
	sra	%g7,	%o6,	%i5
	fmovdge	%icc,	%f25,	%f26
	ldd	[%l7 + 0x50],	%g0
	nop
	setx loop_251, %l0, %l1
	jmpl %l1, %g2
	fmovdvs	%icc,	%f21,	%f27
	tleu	%xcc,	0x5
	array8	%g4,	%l6,	%o4
loop_251:
	fbl,a	%fcc1,	loop_252
	sdivx	%i2,	0x0663,	%i3
	subccc	%l3,	0x12D6,	%o2
	tleu	%icc,	0x6
loop_252:
	ldstub	[%l7 + 0x5D],	%g3
	add	%l0,	0x06CA,	%i1
	tsubcctv	%o7,	%l1,	%i0
	mulscc	%o5,	0x0D3D,	%g5
	umulcc	%l4,	0x1709,	%i6
	tne	%xcc,	0x6
	xor	%g6,	0x0875,	%o1
	subccc	%i7,	%l2,	%i4
	brlz,a	%o0,	loop_253
	movvc	%xcc,	%l5,	%g7
	fbe,a	%fcc2,	loop_254
	fbuge	%fcc2,	loop_255
loop_253:
	fba,a	%fcc3,	loop_256
	orncc	%o3,	0x1CC2,	%i5
loop_254:
	tvs	%xcc,	0x4
loop_255:
	fpadd32	%f26,	%f0,	%f16
loop_256:
	fba	%fcc2,	loop_257
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	siam	0x7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_257:
	srlx	%o6,	0x1A,	%g1
	edge32	%g2,	%g4,	%o4
	membar	0x05
	movre	%l6,	0x15D,	%i3
	tleu	%xcc,	0x2
	edge32	%l3,	%o2,	%g3
	edge8ln	%i2,	%i1,	%o7
	andcc	%l1,	0x1C9D,	%l0
	tpos	%icc,	0x0
	fbn,a	%fcc3,	loop_258
	fsrc2	%f0,	%f22
	tsubcctv	%o5,	0x05F5,	%i0
	fmovsneg	%icc,	%f7,	%f21
loop_258:
	fmovse	%icc,	%f26,	%f24
	fcmps	%fcc1,	%f20,	%f5
	brz	%g5,	loop_259
	sdivx	%i6,	0x0973,	%g6
	flush	%l7 + 0x0C
	movn	%icc,	%o1,	%i7
loop_259:
	fabss	%f24,	%f0
	bge,a	%xcc,	loop_260
	taddcctv	%l4,	0x1139,	%i4
	fmovsl	%xcc,	%f29,	%f3
	srl	%l2,	0x07,	%o0
loop_260:
	tl	%xcc,	0x5
	fbuge	%fcc3,	loop_261
	orncc	%g7,	%l5,	%i5
	fmovs	%f30,	%f27
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_261:
	subcc	%o3,	%g1,	%g2
	srax	%o6,	%g4,	%o4
	tvs	%icc,	0x7
	movn	%icc,	%l6,	%i3
	fpsub16	%f14,	%f12,	%f8
	bl,pt	%xcc,	loop_262
	edge8	%l3,	%o2,	%g3
	orn	%i1,	%o7,	%l1
	movcc	%icc,	%i2,	%o5
loop_262:
	movn	%icc,	%l0,	%g5
	fpsub16	%f2,	%f24,	%f26
	fmovdgu	%xcc,	%f25,	%f27
	tgu	%icc,	0x6
	edge16n	%i0,	%i6,	%o1
	movrlz	%i7,	%g6,	%i4
	edge32n	%l2,	%l4,	%g7
	tneg	%icc,	0x0
	edge8n	%o0,	%l5,	%i5
	tleu	%xcc,	0x3
	fmovrsgez	%o3,	%f8,	%f17
	tleu	%xcc,	0x3
	tg	%xcc,	0x1
	fcmpeq16	%f4,	%f4,	%g1
	andn	%o6,	0x1653,	%g2
	tn	%xcc,	0x7
	brz,a	%o4,	loop_263
	tl	%icc,	0x5
	fbn,a	%fcc2,	loop_264
	fbug	%fcc3,	loop_265
loop_263:
	move	%xcc,	%g4,	%i3
	array8	%l3,	%l6,	%g3
loop_264:
	sir	0x014C
loop_265:
	array8	%i1,	%o2,	%o7
	add	%l7,	0x70,	%l6
	wr	%g0,	0x18,	%asi
	casxa	[%l6] %asi,	%i2,	%l1
	mulscc	%o5,	%g5,	%l0
	fxor	%f0,	%f18,	%f8
	addccc	%i0,	0x1605,	%i6
	orncc	%i7,	%o1,	%i4
	tg	%xcc,	0x0
	wr	%g0,	0x80,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	siam	0x2
	set	0x20, %g3
	ldda	[%l7 + %g3] 0x2f,	%l2
	movrne	%l4,	%g7,	%g6
	mulx	%o0,	0x18E8,	%i5
	fbn	%fcc2,	loop_266
	brgez,a	%l5,	loop_267
	fmul8ulx16	%f6,	%f24,	%f26
	umul	%g1,	%o6,	%o3
loop_266:
	alignaddr	%g2,	%o4,	%g4
loop_267:
	tvs	%icc,	0x4
	brnz,a	%l3,	loop_268
	sdiv	%i3,	0x07A2,	%g3
	tcs	%xcc,	0x2
	wr	%g0,	0x89,	%asi
	stxa	%i1,	[%l7 + 0x18] %asi
loop_268:
	orncc	%l6,	0x03E8,	%o2
	subcc	%o7,	0x097E,	%l1
	addc	%o5,	%g5,	%l0
	fnegs	%f12,	%f16
	movn	%icc,	%i2,	%i0
	srlx	%i7,	0x0D,	%o1
	fsrc2	%f12,	%f14
	te	%xcc,	0x6
	bne,pt	%xcc,	loop_269
	fzero	%f24
	smulcc	%i4,	%l2,	%i6
	fmovda	%xcc,	%f28,	%f31
loop_269:
	bl,a	loop_270
	subcc	%l4,	0x1776,	%g7
	array32	%g6,	%o0,	%i5
	stb	%l5,	[%l7 + 0x2B]
loop_270:
	add	%o6,	%g1,	%o3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbne	%fcc3,	loop_271
	fcmpd	%fcc0,	%f8,	%f18
	fmovrse	%g2,	%f19,	%f25
	fmovsleu	%icc,	%f13,	%f4
loop_271:
	edge32l	%o4,	%l3,	%i3
	fmovspos	%xcc,	%f9,	%f9
	sll	%g4,	0x17,	%g3
	fbge,a	%fcc3,	loop_272
	fmovdcc	%icc,	%f25,	%f0
	fmovrdlez	%l6,	%f18,	%f18
	edge32	%i1,	%o2,	%o7
loop_272:
	fmovsne	%xcc,	%f26,	%f18
	bcs,a	%xcc,	loop_273
	smulcc	%l1,	%g5,	%l0
	ldub	[%l7 + 0x5F],	%i2
	ldub	[%l7 + 0x6F],	%o5
loop_273:
	edge16ln	%i7,	%i0,	%i4
	tsubcctv	%l2,	%o1,	%i6
	fone	%f30
	popc	0x1ABE,	%l4
	brlez	%g6,	loop_274
	taddcctv	%g7,	%o0,	%l5
	bcs	loop_275
	xnor	%i5,	0x00BC,	%o6
loop_274:
	andn	%o3,	%g1,	%g2
	sdivx	%l3,	0x1F1C,	%i3
loop_275:
	nop
	add	%l7,	0x2C,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%o4
	casa	[%l6] 0x88,	%o4,	%g3
	udiv	%l6,	0x0473,	%g4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32ln	%o2,	%o7,	%l1
	tne	%icc,	0x6
	addccc	%i1,	%l0,	%i2
	fpadd16s	%f8,	%f7,	%f0
	movge	%xcc,	%g5,	%o5
	or	%i0,	0x0D88,	%i4
	orn	%l2,	0x1BFA,	%o1
	fbuge	%fcc2,	loop_276
	ldsw	[%l7 + 0x1C],	%i6
	movrne	%l4,	0x2D2,	%i7
	movre	%g7,	0x2E9,	%o0
loop_276:
	xorcc	%g6,	0x18B0,	%i5
	tcs	%icc,	0x0
	tsubcc	%l5,	%o3,	%g1
	bpos,a	%icc,	loop_277
	fpadd32s	%f5,	%f18,	%f22
	tcs	%icc,	0x2
	movrlez	%o6,	%g2,	%l3
loop_277:
	xorcc	%o4,	%g3,	%l6
	tvc	%xcc,	0x5
	fmovdneg	%xcc,	%f28,	%f25
	umulcc	%g4,	0x158A,	%i3
	fmovscs	%icc,	%f4,	%f15
	fmovscc	%icc,	%f9,	%f28
	lduh	[%l7 + 0x32],	%o7
	subc	%o2,	0x1253,	%i1
	fbn	%fcc3,	loop_278
	xnorcc	%l1,	0x0566,	%l0
	array16	%i2,	%o5,	%g5
	array32	%i0,	%i4,	%o1
loop_278:
	ldstub	[%l7 + 0x3E],	%i6
	tl	%xcc,	0x0
	movl	%xcc,	%l4,	%i7
	set	0x1E, %l0
	lduba	[%l7 + %l0] 0x81,	%g7
	fbul,a	%fcc0,	loop_279
	fands	%f25,	%f5,	%f24
	orcc	%o0,	%g6,	%i5
	addc	%l2,	0x1234,	%o3
loop_279:
	tg	%xcc,	0x2
	movvs	%xcc,	%g1,	%o6
	edge16ln	%g2,	%l5,	%l3
	fmovsneg	%icc,	%f11,	%f26
	edge32l	%o4,	%g3,	%l6
	mova	%xcc,	%g4,	%i3
	fcmple32	%f14,	%f14,	%o7
	set	0x6C, %g2
	ldstuba	[%l7 + %g2] 0x10,	%o2
	subccc	%l1,	%i1,	%i2
	subcc	%o5,	0x0D46,	%g5
	fmuld8sux16	%f28,	%f30,	%f20
	edge32l	%i0,	%i4,	%l0
	fble	%fcc3,	loop_280
	fnot1	%f24,	%f2
	bvc,a,pt	%icc,	loop_281
	fnegd	%f10,	%f16
loop_280:
	mulx	%o1,	%i6,	%l4
	edge16ln	%i7,	%o0,	%g6
loop_281:
	andncc	%i5,	%g7,	%l2
	tvs	%xcc,	0x5
	sra	%o3,	%o6,	%g1
	umulcc	%l5,	%l3,	%o4
	membar	0x29
	wr	%g0,	0x88,	%asi
	lduba	[%l7 + 0x62] %asi,	%g2
	tne	%xcc,	0x5
	smulcc	%l6,	0x1BF3,	%g3
	bn	loop_282
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orcc	%i3,	%o7,	%g4
	fmovsgu	%icc,	%f24,	%f3
loop_282:
	udivx	%l1,	0x1AA0,	%o2
	alignaddrl	%i1,	%o5,	%g5
	fbne	%fcc0,	loop_283
	andncc	%i2,	%i0,	%l0
	fnot2s	%f31,	%f24
	movrlez	%i4,	0x23B,	%o1
loop_283:
	sethi	0x13F6,	%i6
	xnor	%l4,	0x089D,	%i7
	fcmpeq32	%f26,	%f18,	%o0
	fsrc1s	%f20,	%f9
	ldsb	[%l7 + 0x48],	%i5
	umul	%g6,	0x1C86,	%l2
	fmovsne	%xcc,	%f17,	%f13
	fnegd	%f10,	%f6
	tcc	%xcc,	0x6
	fcmpgt32	%f2,	%f4,	%o3
	taddcc	%o6,	0x052F,	%g7
	tvs	%xcc,	0x3
	lduh	[%l7 + 0x56],	%l5
	ldd	[%l7 + 0x20],	%f20
	subcc	%g1,	%l3,	%g2
	std	%f28,	[%l7 + 0x10]
	set	0x30, %l5
	ldda	[%l7 + %l5] 0x2c,	%o4
	movrgez	%g3,	%i3,	%l6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdivcc	%g4,	0x1576,	%l1
	fbne,a	%fcc2,	loop_284
	fmovsa	%icc,	%f27,	%f11
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	smulcc	%o7,	0x1D89,	%i1
loop_284:
	tne	%xcc,	0x5
	and	%o5,	0x1395,	%g5
	edge16l	%i2,	%o2,	%l0
	brgz,a	%i4,	loop_285
	xnorcc	%o1,	0x0885,	%i6
	andcc	%l4,	%i0,	%o0
	flushw
loop_285:
	umulcc	%i5,	%i7,	%l2
	mova	%icc,	%g6,	%o6
	xnor	%g7,	%l5,	%g1
	fbug,a	%fcc0,	loop_286
	edge32ln	%l3,	%o3,	%g2
	wr	%g0,	0x80,	%asi
	sta	%f11,	[%l7 + 0x08] %asi
loop_286:
	bne,pt	%icc,	loop_287
	fmovd	%f12,	%f28
	movgu	%icc,	%o4,	%g3
	ldd	[%l7 + 0x08],	%f8
loop_287:
	edge8n	%i3,	%g4,	%l6
	edge32n	%o7,	%i1,	%o5
	ble,a,pn	%xcc,	loop_288
	lduw	[%l7 + 0x70],	%g5
	ble,a,pn	%xcc,	loop_289
	addcc	%i2,	0x0BAB,	%o2
loop_288:
	edge32n	%l1,	%l0,	%o1
	fbue,a	%fcc1,	loop_290
loop_289:
	array8	%i6,	%l4,	%i4
	brgz	%i0,	loop_291
	fnegs	%f26,	%f4
loop_290:
	bcs,a	%icc,	loop_292
	movrlez	%i5,	%i7,	%l2
loop_291:
	or	%o0,	0x1FB7,	%g6
	movneg	%icc,	%o6,	%l5
loop_292:
	fba	%fcc1,	loop_293
	fmovrslez	%g7,	%f7,	%f25
	wr	%g0,	0x89,	%asi
	stxa	%g1,	[%l7 + 0x20] %asi
loop_293:
	tcs	%xcc,	0x5
	addc	%o3,	0x0F43,	%l3
	pdist	%f0,	%f14,	%f12
	membar	0x17
	tn	%xcc,	0x0
	xor	%g2,	%g3,	%i3
	tvs	%xcc,	0x4
	ldstub	[%l7 + 0x6D],	%o4
	bvc,pn	%icc,	loop_294
	tleu	%icc,	0x1
	flushw
	fcmped	%fcc1,	%f14,	%f16
loop_294:
	ldd	[%l7 + 0x10],	%f24
	fcmpgt32	%f24,	%f12,	%l6
	movle	%icc,	%g4,	%i1
	fmovspos	%xcc,	%f5,	%f5
	te	%xcc,	0x4
	set	0x4A, %i5
	lduba	[%l7 + %i5] 0x14,	%o7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbue,a	%fcc0,	loop_295
	fcmps	%fcc2,	%f3,	%f6
	udivx	%o5,	0x0666,	%i2
	movpos	%icc,	%g5,	%l1
loop_295:
	sethi	0x05D9,	%o2
	ldstub	[%l7 + 0x25],	%l0
	nop
	setx	loop_296,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fpack32	%f6,	%f6,	%f0
	orcc	%o1,	%i6,	%i4
	movrgz	%l4,	0x044,	%i5
loop_296:
	nop
	setx	loop_297,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fblg	%fcc0,	loop_298
	move	%icc,	%i0,	%i7
	orcc	%l2,	0x1E5B,	%o0
loop_297:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_298:
	tl	%icc,	0x3
	sll	%g6,	%l5,	%g7
	edge16ln	%o6,	%o3,	%l3
	mulx	%g1,	%g3,	%g2
	fexpand	%f26,	%f22
	alignaddrl	%o4,	%l6,	%i3
	bgu,a	%icc,	loop_299
	fexpand	%f1,	%f24
	fpadd16s	%f10,	%f22,	%f24
	sdivx	%i1,	0x1C6C,	%o7
loop_299:
	nop
	add	%l7,	0x34,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%o5,	%g4
	fnand	%f0,	%f8,	%f0
	sra	%i2,	0x18,	%g5
	fnand	%f24,	%f12,	%f4
	mova	%icc,	%o2,	%l0
	array32	%o1,	%l1,	%i6
	tvs	%icc,	0x3
	taddcc	%l4,	0x11CD,	%i5
	tleu	%xcc,	0x4
	fbn,a	%fcc0,	loop_300
	subc	%i0,	%i4,	%l2
	taddcc	%o0,	0x03A0,	%g6
	edge16ln	%l5,	%g7,	%o6
loop_300:
	fsrc1s	%f23,	%f9
	tpos	%icc,	0x4
	ldx	[%l7 + 0x18],	%o3
	fnor	%f8,	%f22,	%f4
	tge	%xcc,	0x0
	orcc	%i7,	0x0A1D,	%l3
	te	%xcc,	0x6
	tneg	%icc,	0x7
	srax	%g3,	%g1,	%o4
	edge16n	%l6,	%g2,	%i1
	edge16n	%i3,	%o5,	%g4
	fandnot1	%f22,	%f22,	%f16
	stbar
	movleu	%icc,	%i2,	%o7
	subccc	%o2,	0x18DC,	%g5
	wr	%g0,	0x10,	%asi
	ldstuba	[%l7 + 0x2F] %asi,	%l0
	sll	%o1,	0x04,	%l1
	brz	%l4,	loop_301
	orncc	%i6,	%i5,	%i0
	movn	%icc,	%l2,	%i4
	tvs	%xcc,	0x1
loop_301:
	fcmpeq16	%f22,	%f18,	%g6
	fmul8x16	%f21,	%f12,	%f28
	movvc	%xcc,	%o0,	%g7
	sdivx	%l5,	0x1C58,	%o6
	fmovsge	%xcc,	%f16,	%f3
	fbule	%fcc3,	loop_302
	tsubcc	%i7,	%l3,	%o3
	fands	%f13,	%f25,	%f9
	st	%f18,	[%l7 + 0x70]
loop_302:
	taddcc	%g1,	0x1348,	%o4
	tvs	%icc,	0x4
	sub	%l6,	%g3,	%g2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sll	%i1,	0x05,	%i3
	fmuld8sux16	%f22,	%f24,	%f0
	ldub	[%l7 + 0x70],	%g4
	ldsb	[%l7 + 0x0C],	%i2
	tsubcctv	%o7,	%o5,	%g5
	faligndata	%f22,	%f18,	%f24
	set	0x34, %i6
	stba	%o2,	[%l7 + %i6] 0x89
	xnor	%o1,	%l1,	%l0
	sir	0x1ABB
	fmovdvs	%icc,	%f0,	%f14
	orcc	%l4,	%i5,	%i0
	fbo	%fcc3,	loop_303
	fmul8x16au	%f11,	%f31,	%f8
	sdivx	%i6,	0x080F,	%i4
	xor	%g6,	%o0,	%l2
loop_303:
	flushw
	movge	%xcc,	%g7,	%o6
	tle	%xcc,	0x6
	stx	%l5,	[%l7 + 0x18]
	movpos	%xcc,	%l3,	%o3
	srl	%g1,	0x16,	%o4
	brgez	%l6,	loop_304
	tvc	%xcc,	0x3
	edge32n	%i7,	%g3,	%g2
	array32	%i1,	%g4,	%i3
loop_304:
	nop
	wr	%g0,	0x89,	%asi
	lda	[%l7 + 0x78] %asi,	%f21
	edge16	%i2,	%o5,	%o7
	tg	%xcc,	0x0
	orcc	%g5,	%o1,	%l1
	set	0x3E, %o5
	lduba	[%l7 + %o5] 0x19,	%l0
	tvs	%icc,	0x4
	brgz,a	%l4,	loop_305
	ldstub	[%l7 + 0x19],	%i5
	subc	%o2,	0x1626,	%i6
	sdivx	%i4,	0x0247,	%i0
loop_305:
	ldd	[%l7 + 0x08],	%f16
	addccc	%o0,	0x1864,	%g6
	sllx	%g7,	%o6,	%l2
	fmovrdgez	%l3,	%f12,	%f24
	sub	%l5,	0x0B4C,	%g1
	tl	%icc,	0x0
	fmul8x16	%f13,	%f20,	%f2
	mova	%xcc,	%o3,	%l6
	movrne	%i7,	0x05A,	%o4
	fcmple32	%f20,	%f20,	%g2
	wr	%g0,	0x88,	%asi
	lduba	[%l7 + 0x6C] %asi,	%g3
	addccc	%g4,	0x0214,	%i1
	sir	0x16F6
	ba,a,pt	%xcc,	loop_306
	be,a,pn	%icc,	loop_307
	movne	%icc,	%i3,	%i2
	movleu	%xcc,	%o7,	%g5
loop_306:
	fmovrslz	%o1,	%f6,	%f15
loop_307:
	te	%icc,	0x4
	membar	0x7A
	sub	%o5,	0x1F49,	%l1
	fmovrsgz	%l0,	%f31,	%f14
	stw	%i5,	[%l7 + 0x24]
	fsrc2s	%f4,	%f20
	fmovrdgez	%l4,	%f28,	%f16
	umul	%i6,	0x0A7D,	%i4
	movre	%i0,	0x02A,	%o0
	sth	%o2,	[%l7 + 0x1E]
	wr	%g0,	0x10,	%asi
	stha	%g6,	[%l7 + 0x0E] %asi
	tcc	%xcc,	0x3
	xnor	%o6,	%g7,	%l3
	edge32l	%l2,	%l5,	%o3
	fmovsl	%xcc,	%f21,	%f13
	or	%l6,	0x1CB9,	%g1
	udivcc	%o4,	0x0AE6,	%i7
	tvs	%icc,	0x2
	bshuffle	%f6,	%f14,	%f4
	tcc	%xcc,	0x6
	fbu	%fcc1,	loop_308
	fnegd	%f8,	%f24
	smul	%g2,	0x1DB2,	%g4
	wr	%g0,	0x89,	%asi
	ldsba	[%l7 + 0x18] %asi,	%g3
loop_308:
	movn	%xcc,	%i3,	%i1
	brlez	%o7,	loop_309
	tpos	%icc,	0x0
	pdist	%f0,	%f30,	%f28
	sethi	0x0F0E,	%g5
loop_309:
	ba,a,pn	%icc,	loop_310
	array16	%o1,	%i2,	%l1
	fabsd	%f12,	%f22
	tpos	%xcc,	0x5
loop_310:
	udivcc	%o5,	0x1325,	%i5
	sdivx	%l4,	0x09E9,	%i6
	fmovdcs	%icc,	%f9,	%f4
	wr	%g0,	0x88,	%asi
	swapa	[%l7 + 0x54] %asi,	%i4
	tne	%icc,	0x3
	ta	%xcc,	0x6
	movrlz	%i0,	%o0,	%o2
	fornot1	%f10,	%f22,	%f22
	bn,a,pn	%xcc,	loop_311
	edge32	%l0,	%g6,	%o6
	brlez,a	%l3,	loop_312
	srlx	%l2,	0x14,	%l5
loop_311:
	fmuld8ulx16	%f27,	%f27,	%f20
	movg	%icc,	%g7,	%l6
loop_312:
	brgz	%o3,	loop_313
	move	%xcc,	%o4,	%g1
	ldub	[%l7 + 0x70],	%g2
	udiv	%g4,	0x18DB,	%g3
loop_313:
	fmul8x16	%f1,	%f0,	%f26
	movleu	%xcc,	%i3,	%i1
	xor	%i7,	%g5,	%o7
	call	loop_314
	fmul8x16	%f21,	%f24,	%f10
	fbuge	%fcc1,	loop_315
	movrne	%i2,	%l1,	%o1
loop_314:
	call	loop_316
	bneg,pt	%icc,	loop_317
loop_315:
	movl	%icc,	%i5,	%l4
	fmovdcc	%icc,	%f22,	%f25
loop_316:
	nop
	wr	%g0,	0x89,	%asi
	ldswa	[%l7 + 0x60] %asi,	%o5
loop_317:
	umulcc	%i6,	%i4,	%i0
	fands	%f25,	%f14,	%f20
	tsubcc	%o2,	%l0,	%o0
	fmovrslez	%g6,	%f27,	%f31
	tgu	%icc,	0x6
	fxnors	%f4,	%f15,	%f8
	udivcc	%o6,	0x177F,	%l2
	srax	%l5,	%g7,	%l6
	smul	%l3,	0x1E14,	%o3
	tleu	%xcc,	0x1
	fands	%f16,	%f17,	%f7
	umul	%g1,	%g2,	%o4
	movge	%xcc,	%g4,	%i3
	subcc	%g3,	0x1993,	%i7
	xorcc	%i1,	0x143A,	%o7
	edge16ln	%i2,	%g5,	%o1
	array16	%l1,	%l4,	%i5
	orcc	%i6,	0x00F8,	%o5
	movleu	%xcc,	%i4,	%i0
	add	%l7,	0x30,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] %asi,	%l0,	%o0
	xor	%g6,	0x1DCE,	%o6
	sdiv	%l2,	0x1445,	%o2
	edge8n	%g7,	%l6,	%l3
	ba,a,pn	%icc,	loop_318
	tcc	%icc,	0x3
	set	0x18, %o0
	stxa	%l5,	[%l7 + %o0] 0x14
loop_318:
	taddcc	%o3,	0x0EB5,	%g2
	set	0x3B, %l4
	stba	%g1,	[%l7 + %l4] 0x0c
	umul	%o4,	0x14BF,	%g4
	fble,a	%fcc1,	loop_319
	ld	[%l7 + 0x54],	%f0
	set	0x20, %i0
	ldxa	[%l7 + %i0] 0x1d,	%i3
loop_319:
	movl	%xcc,	%i7,	%i1
	set	0x78, %g1
	ldswa	[%l7 + %g1] 0x89,	%g3
	edge32ln	%o7,	%i2,	%g5
	taddcctv	%o1,	0x1209,	%l1
	edge32	%l4,	%i6,	%i5
	membar	0x69
	xnorcc	%i4,	%o5,	%l0
	movcs	%icc,	%o0,	%i0
	fmul8x16al	%f16,	%f4,	%f30
	udivx	%g6,	0x0373,	%l2
	fmovsgu	%xcc,	%f24,	%f20
	fbn	%fcc2,	loop_320
	membar	0x11
	andcc	%o2,	%o6,	%l6
	te	%icc,	0x0
loop_320:
	fmovsn	%xcc,	%f8,	%f25
	fmovscc	%xcc,	%f6,	%f31
	ld	[%l7 + 0x40],	%f14
	fmovsvs	%icc,	%f26,	%f8
	popc	0x12CD,	%g7
	subc	%l5,	%l3,	%g2
	edge32l	%o3,	%o4,	%g4
	array16	%g1,	%i7,	%i3
	bgu,pt	%xcc,	loop_321
	fxor	%f24,	%f4,	%f8
	subcc	%i1,	%o7,	%g3
	xnorcc	%i2,	%g5,	%l1
loop_321:
	fornot2s	%f27,	%f8,	%f2
	ldsw	[%l7 + 0x1C],	%l4
	nop
	setx loop_322, %l0, %l1
	jmpl %l1, %i6
	edge8	%i5,	%i4,	%o1
	alignaddr	%l0,	%o0,	%i0
	fmovd	%f12,	%f8
loop_322:
	ld	[%l7 + 0x0C],	%f21
	add	%l7,	0x38,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] %asi,	%g6,	%l2
	fsrc2s	%f11,	%f26
	bg	loop_323
	bcs,pt	%icc,	loop_324
	subc	%o2,	%o6,	%o5
	edge8n	%l6,	%l5,	%g7
loop_323:
	array8	%g2,	%l3,	%o4
loop_324:
	subc	%g4,	%o3,	%g1
	sir	0x0C0B
	tgu	%xcc,	0x7
	fornot2s	%f22,	%f1,	%f2
	set	0x40, %g5
	stda	%f0,	[%l7 + %g5] 0x80
	movre	%i7,	0x1E2,	%i1
	mulscc	%o7,	0x1A18,	%i3
	fbl,a	%fcc2,	loop_325
	fmovscs	%xcc,	%f7,	%f11
	flushw
	brz,a	%i2,	loop_326
loop_325:
	prefetch	[%l7 + 0x34],	 0x1
	taddcctv	%g5,	%l1,	%l4
	fpackfix	%f10,	%f29
loop_326:
	fmovsg	%xcc,	%f16,	%f14
	alignaddrl	%i6,	%i5,	%i4
	move	%icc,	%g3,	%o1
	stbar
	brgez,a	%o0,	loop_327
	fmuld8sux16	%f16,	%f0,	%f18
	mulx	%i0,	0x06C2,	%l0
	udivcc	%g6,	0x02A6,	%l2
loop_327:
	movrgz	%o2,	%o5,	%o6
	fxors	%f30,	%f13,	%f3
	bgu	%xcc,	loop_328
	bge,pt	%xcc,	loop_329
	movleu	%icc,	%l5,	%g7
	wr	%g0,	0xf8,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
loop_328:
	tle	%icc,	0x6
loop_329:
	movpos	%xcc,	%g2,	%l6
	umul	%l3,	0x1859,	%g4
	edge16l	%o4,	%o3,	%i7
	fmovrdgez	%i1,	%f10,	%f2
	tl	%icc,	0x4
	set	0x40, %l3
	ldda	[%l7 + %l3] 0x1e,	%f0
	movrlz	%o7,	0x29A,	%g1
	fbul,a	%fcc1,	loop_330
	xnor	%i2,	%i3,	%l1
	popc	0x1E4A,	%g5
	ldsb	[%l7 + 0x39],	%l4
loop_330:
	tvs	%xcc,	0x7
	addc	%i5,	%i6,	%g3
	sra	%i4,	%o0,	%o1
	sra	%i0,	0x0D,	%l0
	fcmple16	%f28,	%f26,	%l2
	popc	0x1869,	%o2
	orn	%o5,	0x1510,	%o6
	alignaddr	%g6,	%l5,	%g2
	fbl,a	%fcc2,	loop_331
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbne	%fcc0,	loop_332
	ba	%xcc,	loop_333
loop_331:
	edge8ln	%g7,	%l6,	%g4
	movpos	%icc,	%o4,	%l3
loop_332:
	mova	%icc,	%i7,	%o3
loop_333:
	edge32n	%i1,	%o7,	%g1
	mulx	%i2,	0x16DF,	%i3
	wr	%g0,	0x18,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	wr	%g0,	0x80,	%asi
	lduwa	[%l7 + 0x1C] %asi,	%g5
	tvs	%xcc,	0x6
	smulcc	%l1,	0x166F,	%l4
	fxnors	%f30,	%f26,	%f31
	fmovsl	%xcc,	%f13,	%f9
	bg	loop_334
	bne,pt	%icc,	loop_335
	fbn,a	%fcc2,	loop_336
	sll	%i6,	%g3,	%i4
loop_334:
	fbg,a	%fcc2,	loop_337
loop_335:
	tgu	%xcc,	0x3
loop_336:
	fmovsge	%icc,	%f7,	%f26
	edge8	%o0,	%i5,	%i0
loop_337:
	fsrc2	%f26,	%f26
	fandnot2s	%f3,	%f8,	%f21
	fmovsneg	%icc,	%f25,	%f14
	set	0x44, %i7
	lduwa	[%l7 + %i7] 0x19,	%l0
	set	0x0E, %l6
	ldsba	[%l7 + %l6] 0x10,	%l2
	edge32ln	%o1,	%o2,	%o5
	edge32ln	%o6,	%g6,	%g2
	tsubcc	%l5,	0x0B78,	%g7
	movg	%xcc,	%g4,	%o4
	fba,a	%fcc3,	loop_338
	andncc	%l3,	%l6,	%o3
	srax	%i7,	0x1C,	%o7
	tle	%icc,	0x2
loop_338:
	smul	%g1,	%i1,	%i2
	sir	0x0270
	fors	%f29,	%f4,	%f30
	fmovrdlez	%i3,	%f0,	%f24
	movrne	%g5,	0x07C,	%l1
	set	0x30, %i3
	prefetcha	[%l7 + %i3] 0x1c,	 0x3
	fbe,a	%fcc3,	loop_339
	sdivx	%g3,	0x0954,	%l4
	be,a,pt	%icc,	loop_340
	subccc	%i4,	%i5,	%i0
loop_339:
	array8	%o0,	%l2,	%l0
	prefetch	[%l7 + 0x68],	 0x1
loop_340:
	movgu	%icc,	%o1,	%o5
	srl	%o6,	%g6,	%g2
	move	%xcc,	%o2,	%g7
	ldsb	[%l7 + 0x36],	%l5
	sir	0x1F4F
	fpack16	%f20,	%f24
	fsrc2s	%f6,	%f24
	fmul8sux16	%f18,	%f20,	%f28
	subc	%g4,	%o4,	%l6
	movne	%icc,	%l3,	%i7
	movrne	%o7,	0x3D9,	%g1
	wr	%g0,	0x80,	%asi
	lda	[%l7 + 0x74] %asi,	%f23
	fmovdneg	%icc,	%f16,	%f1
	brlz	%i1,	loop_341
	fxors	%f19,	%f22,	%f18
	movneg	%xcc,	%o3,	%i2
	tpos	%icc,	0x5
loop_341:
	bcc	loop_342
	fba	%fcc0,	loop_343
	nop
	setx	loop_344,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	flushw
loop_342:
	bneg,a,pn	%xcc,	loop_345
loop_343:
	st	%f26,	[%l7 + 0x08]
loop_344:
	tne	%icc,	0x3
	edge16ln	%i3,	%l1,	%g5
loop_345:
	tleu	%xcc,	0x6
	movcs	%icc,	%i6,	%g3
	bn,pt	%icc,	loop_346
	fble,a	%fcc3,	loop_347
	movrlz	%l4,	0x064,	%i4
	set	0x40, %o1
	lda	[%l7 + %o1] 0x88,	%f20
loop_346:
	add	%i0,	0x153E,	%o0
loop_347:
	edge32ln	%l2,	%i5,	%o1
	tne	%icc,	0x4
	sdivx	%o5,	0x091C,	%o6
	edge8l	%l0,	%g6,	%g2
	movgu	%icc,	%g7,	%l5
	fmul8x16al	%f5,	%f10,	%f22
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xor	%g4,	%o2,	%l6
	edge32ln	%l3,	%i7,	%o4
	tgu	%icc,	0x0
	brlz,a	%g1,	loop_348
	tcc	%xcc,	0x7
	wr	%g0,	0x80,	%asi
	swapa	[%l7 + 0x60] %asi,	%o7
loop_348:
	brgz,a	%i1,	loop_349
	andn	%i2,	0x0C62,	%o3
	fbge	%fcc3,	loop_350
	fbo	%fcc1,	loop_351
loop_349:
	stw	%l1,	[%l7 + 0x64]
	tvc	%xcc,	0x3
loop_350:
	tleu	%xcc,	0x3
loop_351:
	subcc	%i3,	%g5,	%g3
	mulscc	%i6,	%i4,	%l4
	edge8n	%i0,	%l2,	%o0
	tl	%xcc,	0x5
	xorcc	%i5,	0x1E21,	%o1
	fmovspos	%xcc,	%f16,	%f31
	tg	%icc,	0x7
	tgu	%xcc,	0x4
	brlez	%o6,	loop_352
	sub	%o5,	%g6,	%l0
	nop
	setx	loop_353,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	or	%g2,	%g7,	%g4
loop_352:
	sra	%l5,	0x10,	%l6
	movcc	%icc,	%l3,	%i7
loop_353:
	mulscc	%o4,	%g1,	%o7
	set	0x40, %o7
	stda	%f16,	[%l7 + %o7] 0x10
	fbul	%fcc1,	loop_354
	or	%o2,	0x02AA,	%i1
	fxor	%f26,	%f18,	%f16
	edge32n	%i2,	%l1,	%o3
loop_354:
	brnz,a	%i3,	loop_355
	tle	%icc,	0x1
	tsubcctv	%g5,	%g3,	%i6
	sdivcc	%i4,	0x1118,	%i0
loop_355:
	brlz	%l4,	loop_356
	taddcc	%o0,	%l2,	%o1
	lduh	[%l7 + 0x60],	%i5
	tcc	%xcc,	0x2
loop_356:
	edge16ln	%o6,	%g6,	%o5
	fmovdleu	%xcc,	%f0,	%f18
	addc	%g2,	0x0A9D,	%g7
	movneg	%xcc,	%g4,	%l5
	set	0x46, %g4
	lduba	[%l7 + %g4] 0x04,	%l6
	sdivx	%l3,	0x0727,	%l0
	sra	%i7,	%g1,	%o4
	orn	%o2,	%i1,	%i2
	tne	%xcc,	0x3
	fbue	%fcc3,	loop_357
	udivx	%o7,	0x1ACC,	%o3
	move	%xcc,	%l1,	%i3
	array16	%g3,	%g5,	%i4
loop_357:
	fmovrdlez	%i6,	%f24,	%f26
	fcmpd	%fcc1,	%f18,	%f22
	movn	%xcc,	%l4,	%i0
	movneg	%icc,	%l2,	%o0
	taddcctv	%i5,	%o1,	%o6
	fbge	%fcc0,	loop_358
	smulcc	%g6,	%o5,	%g2
	array32	%g7,	%l5,	%l6
	fmovrsne	%l3,	%f2,	%f2
loop_358:
	ldsh	[%l7 + 0x3C],	%g4
	sub	%l0,	0x0FFD,	%g1
	edge32n	%o4,	%o2,	%i7
	fzero	%f28
	be,a	loop_359
	sdivx	%i1,	0x0E20,	%i2
	sethi	0x057C,	%o3
	movle	%icc,	%l1,	%i3
loop_359:
	fmovda	%xcc,	%f4,	%f14
	ld	[%l7 + 0x50],	%f29
	movrlz	%o7,	%g5,	%g3
	movcs	%icc,	%i6,	%i4
	movrlz	%i0,	0x22E,	%l2
	sdiv	%l4,	0x0CE0,	%i5
	fmul8x16au	%f18,	%f31,	%f30
	fmovspos	%icc,	%f21,	%f12
	siam	0x4
	tneg	%xcc,	0x4
	fmovde	%xcc,	%f1,	%f28
	tl	%xcc,	0x5
	edge16ln	%o0,	%o1,	%o6
	subcc	%g6,	0x13B2,	%g2
	movpos	%xcc,	%g7,	%l5
	xor	%l6,	0x151A,	%l3
	movrlz	%o5,	0x326,	%g4
	fornot2s	%f24,	%f12,	%f2
	add	%l7,	0x20,	%l6
	wr	%g0,	0x10,	%asi
	ldxa	[%l6] %asi,	%g1
	casxa	[%l6] 0x10,	%g1,	%l0
	edge8ln	%o4,	%o2,	%i7
	bvc	%icc,	loop_360
	orncc	%i2,	%o3,	%i1
	mulscc	%i3,	%o7,	%l1
	for	%f26,	%f18,	%f2
loop_360:
	sllx	%g5,	0x07,	%i6
	fmovdleu	%icc,	%f7,	%f23
	set	0x20, %o2
	sta	%f4,	[%l7 + %o2] 0x88
	or	%g3,	0x1D47,	%i4
	xnorcc	%i0,	0x00A1,	%l4
	sethi	0x00B9,	%i5
	fornot1	%f2,	%f8,	%f6
	fpack16	%f8,	%f11
	tsubcctv	%o0,	0x0879,	%l2
	tg	%xcc,	0x2
	fbe	%fcc0,	loop_361
	bpos,a	loop_362
	fbe	%fcc1,	loop_363
	move	%xcc,	%o6,	%g6
loop_361:
	nop
	set	0x74, %i4
	stwa	%o1,	[%l7 + %i4] 0x04
loop_362:
	edge16ln	%g7,	%g2,	%l5
loop_363:
	fba,a	%fcc3,	loop_364
	add	%l6,	%o5,	%g4
	fbul	%fcc2,	loop_365
	fba	%fcc3,	loop_366
loop_364:
	edge8n	%g1,	%l3,	%o4
	movneg	%xcc,	%l0,	%i7
loop_365:
	nop
	wr	%g0,	0x88,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
loop_366:
	edge8n	%i2,	%o2,	%o3
	fxnor	%f12,	%f26,	%f30
	fblg	%fcc1,	loop_367
	fsrc2s	%f21,	%f7
	movcs	%xcc,	%i3,	%i1
	edge8l	%l1,	%o7,	%i6
loop_367:
	mova	%xcc,	%g5,	%i4
	lduh	[%l7 + 0x52],	%g3
	edge8ln	%l4,	%i0,	%o0
	addc	%i5,	0x172D,	%o6
	sdiv	%g6,	0x1BC3,	%o1
	fble,a	%fcc0,	loop_368
	tvc	%icc,	0x5
	srlx	%l2,	0x16,	%g2
	pdist	%f22,	%f14,	%f10
loop_368:
	andcc	%l5,	%g7,	%l6
	lduw	[%l7 + 0x24],	%o5
	fmovdneg	%xcc,	%f1,	%f23
	movg	%icc,	%g1,	%l3
	fmovdvc	%xcc,	%f16,	%f27
	movl	%xcc,	%g4,	%l0
	movrlez	%o4,	%i2,	%i7
	subc	%o2,	0x07F3,	%i3
	fbul	%fcc2,	loop_369
	mulx	%i1,	0x145C,	%o3
	ldub	[%l7 + 0x35],	%l1
	brz,a	%o7,	loop_370
loop_369:
	fbule,a	%fcc2,	loop_371
	edge32	%i6,	%i4,	%g5
	movle	%xcc,	%l4,	%g3
loop_370:
	and	%i0,	0x1B7B,	%i5
loop_371:
	fmovsvc	%icc,	%f30,	%f30
	edge8n	%o6,	%o0,	%g6
	fmovdle	%xcc,	%f11,	%f4
	flushw
	fbl	%fcc0,	loop_372
	edge8	%l2,	%g2,	%l5
	brz	%o1,	loop_373
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_372:
	fors	%f8,	%f4,	%f3
	fmovdvc	%icc,	%f29,	%f8
loop_373:
	fnor	%f2,	%f6,	%f28
	tvc	%xcc,	0x4
	udivx	%g7,	0x1D52,	%o5
	st	%f8,	[%l7 + 0x1C]
	movvc	%xcc,	%g1,	%l6
	fornot1	%f8,	%f18,	%f4
	fbu,a	%fcc1,	loop_374
	tg	%xcc,	0x0
	array32	%l3,	%g4,	%o4
	tsubcc	%l0,	0x1664,	%i2
loop_374:
	umulcc	%o2,	0x16B0,	%i7
	umulcc	%i3,	%i1,	%o3
	fmovs	%f10,	%f16
	edge16l	%o7,	%l1,	%i6
	xnor	%g5,	0x125A,	%l4
	fbl,a	%fcc2,	loop_375
	tpos	%xcc,	0x0
	bl,pn	%xcc,	loop_376
	nop
	setx	loop_377,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_375:
	movre	%i4,	0x150,	%g3
	tcs	%xcc,	0x2
loop_376:
	nop
	wr	%g0,	0x81,	%asi
	stba	%i0,	[%l7 + 0x37] %asi
loop_377:
	sllx	%i5,	0x11,	%o0
	fcmpeq32	%f18,	%f20,	%o6
	wr	%g0,	0x10,	%asi
	lduba	[%l7 + 0x75] %asi,	%l2
	sethi	0x0088,	%g6
	fmovdgu	%xcc,	%f0,	%f31
	array8	%l5,	%o1,	%g2
	sethi	0x1035,	%g7
	set	0x32, %o3
	ldsba	[%l7 + %o3] 0x18,	%o5
	fpack16	%f22,	%f19
	fbule	%fcc2,	loop_378
	fblg	%fcc3,	loop_379
	fble	%fcc0,	loop_380
	ldub	[%l7 + 0x0B],	%l6
loop_378:
	flush	%l7 + 0x6C
loop_379:
	st	%f21,	[%l7 + 0x40]
loop_380:
	srl	%g1,	%l3,	%o4
	srlx	%l0,	0x17,	%i2
	fmovde	%xcc,	%f4,	%f12
	fmovdpos	%xcc,	%f25,	%f0
	add	%o2,	%g4,	%i3
	taddcctv	%i1,	0x1C37,	%i7
	mulscc	%o3,	%o7,	%l1
	sub	%g5,	0x1AE2,	%i6
	umulcc	%l4,	0x0366,	%i4
	array32	%g3,	%i5,	%i0
	fbul,a	%fcc0,	loop_381
	movleu	%icc,	%o0,	%o6
	brz	%g6,	loop_382
	fcmpes	%fcc3,	%f6,	%f23
loop_381:
	movrlez	%l5,	0x24C,	%l2
	edge32	%g2,	%g7,	%o5
loop_382:
	movrlez	%l6,	0x3E5,	%o1
	ble,a,pt	%xcc,	loop_383
	edge16n	%g1,	%o4,	%l0
	fcmped	%fcc2,	%f10,	%f24
	xnor	%l3,	0x1FA0,	%o2
loop_383:
	and	%g4,	%i3,	%i2
	edge8l	%i7,	%o3,	%i1
	bg	loop_384
	edge32n	%l1,	%g5,	%i6
	fcmpd	%fcc1,	%f12,	%f12
	edge32l	%o7,	%i4,	%l4
loop_384:
	fsrc2s	%f0,	%f27
	movcs	%icc,	%g3,	%i5
	bvc,pn	%icc,	loop_385
	sll	%i0,	%o0,	%o6
	edge8	%g6,	%l5,	%l2
	set	0x68, %l1
	prefetcha	[%l7 + %l1] 0x04,	 0x0
loop_385:
	sllx	%g7,	%o5,	%l6
	nop
	set	0x6C, %i2
	stw	%g1,	[%l7 + %i2]
	fcmpgt32	%f14,	%f22,	%o1
	tg	%xcc,	0x7
	subc	%l0,	0x16B5,	%o4
	movcc	%xcc,	%o2,	%l3
	tleu	%xcc,	0x6
	stw	%i3,	[%l7 + 0x34]
	ta	%xcc,	0x5
	fmovde	%icc,	%f10,	%f8
	fmovda	%icc,	%f25,	%f4
	set	0x68, %g6
	swapa	[%l7 + %g6] 0x89,	%i2
	movrne	%g4,	%i7,	%o3
	tneg	%xcc,	0x5
	movcs	%xcc,	%l1,	%i1
	tn	%xcc,	0x0
	popc	0x19FC,	%i6
	wr	%g0,	0x04,	%asi
	ldxa	[%l7 + 0x40] %asi,	%g5
	movgu	%xcc,	%i4,	%o7
	movg	%icc,	%l4,	%g3
	udiv	%i0,	0x1AC1,	%i5
	movvs	%xcc,	%o6,	%o0
	edge16l	%l5,	%l2,	%g2
	set	0x60, %o6
	ldda	[%l7 + %o6] 0x0c,	%g6
	mova	%xcc,	%o5,	%g7
	fblg	%fcc1,	loop_386
	swap	[%l7 + 0x08],	%g1
	ldstub	[%l7 + 0x0C],	%o1
	movge	%icc,	%l6,	%l0
loop_386:
	movneg	%xcc,	%o4,	%l3
	edge16	%o2,	%i3,	%i2
	edge8	%g4,	%i7,	%o3
	movvs	%xcc,	%i1,	%l1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sllx	%i6,	0x08,	%i4
	add	%l7,	0x18,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%g5
	casxa	[%l6] %asi,	%g5,	%l4
	fbule	%fcc1,	loop_387
	fbge,a	%fcc0,	loop_388
	fpadd32	%f6,	%f12,	%f8
	ta	%icc,	0x0
loop_387:
	fxnors	%f5,	%f5,	%f3
loop_388:
	movg	%xcc,	%g3,	%o7
	movrlez	%i5,	0x33F,	%o6
	wr	%g0,	0x89,	%asi
	lduba	[%l7 + 0x31] %asi,	%o0
	movrne	%l5,	%i0,	%g2
	fbl,a	%fcc1,	loop_389
	umulcc	%l2,	%g6,	%g7
	sra	%o5,	0x16,	%o1
	sth	%g1,	[%l7 + 0x3E]
loop_389:
	edge8ln	%l6,	%l0,	%o4
	movneg	%icc,	%l3,	%i3
	movge	%xcc,	%o2,	%i2
	fmuld8sux16	%f20,	%f8,	%f10
	movvs	%icc,	%i7,	%g4
	movrlz	%o3,	0x352,	%l1
	set	0x40, %g7
	ldsba	[%l7 + %g7] 0x80,	%i1
	fmovs	%f23,	%f11
	wr	%g0,	0x04,	%asi
	stha	%i4,	[%l7 + 0x34] %asi
	bleu,pt	%xcc,	loop_390
	fnot2	%f28,	%f12
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tvs	%icc,	0x2
loop_390:
	fnot2s	%f10,	%f22
	tleu	%xcc,	0x0
	wr	%g0,	0x88,	%asi
	stwa	%g5,	[%l7 + 0x4C] %asi
	alignaddr	%l4,	%g3,	%o7
	tg	%icc,	0x0
	movre	%i6,	%i5,	%o6
	membar	0x0F
	movl	%icc,	%o0,	%l5
	tn	%xcc,	0x3
	fbule,a	%fcc2,	loop_391
	array16	%i0,	%l2,	%g6
	stx	%g7,	[%l7 + 0x18]
	fbug	%fcc1,	loop_392
loop_391:
	tgu	%xcc,	0x6
	xorcc	%g2,	0x17E3,	%o5
	tn	%icc,	0x1
loop_392:
	movrgz	%o1,	%l6,	%l0
	alignaddr	%g1,	%l3,	%o4
	fmovsl	%icc,	%f12,	%f16
	movvs	%xcc,	%i3,	%o2
	fmovsvs	%xcc,	%f9,	%f5
	brgz,a	%i7,	loop_393
	movrne	%i2,	0x1E6,	%o3
	ba,a	%xcc,	loop_394
	edge8n	%g4,	%l1,	%i1
loop_393:
	fpadd32	%f4,	%f12,	%f6
	wr	%g0,	0x89,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
loop_394:
	fnot1	%f2,	%f18
	fxnor	%f12,	%f20,	%f22
	fnot1	%f2,	%f18
	addc	%g5,	0x1578,	%i4
	sll	%l4,	0x12,	%o7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movneg	%icc,	%i6,	%i5
	fmovdn	%icc,	%f9,	%f0
	xnor	%o6,	0x0937,	%g3
	taddcc	%o0,	%i0,	%l5
	movrgz	%l2,	0x12A,	%g6
	edge32l	%g2,	%g7,	%o5
	alignaddr	%o1,	%l6,	%l0
	bgu,a,pn	%xcc,	loop_395
	fnot2s	%f14,	%f21
	brgez	%l3,	loop_396
	popc	%o4,	%g1
loop_395:
	movl	%icc,	%o2,	%i3
	movleu	%xcc,	%i7,	%o3
loop_396:
	lduw	[%l7 + 0x60],	%i2
	movge	%xcc,	%g4,	%l1
	subcc	%i1,	0x00B4,	%g5
	orcc	%i4,	%o7,	%l4
	edge8n	%i5,	%i6,	%g3
	fmovrsgz	%o6,	%f25,	%f18
	fcmped	%fcc1,	%f12,	%f24
	ba,a	loop_397
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	smulcc	%i0,	%o0,	%l2
	sllx	%l5,	0x07,	%g2
loop_397:
	tcc	%icc,	0x3
	be,a,pn	%icc,	loop_398
	fors	%f2,	%f23,	%f5
	movne	%xcc,	%g6,	%o5
	brlez	%g7,	loop_399
loop_398:
	smulcc	%l6,	%l0,	%o1
	edge32ln	%l3,	%o4,	%g1
	brlez	%i3,	loop_400
loop_399:
	movvs	%icc,	%i7,	%o2
	fba,a	%fcc0,	loop_401
	edge8n	%i2,	%o3,	%l1
loop_400:
	alignaddr	%g4,	%i1,	%g5
	wr	%g0,	0x04,	%asi
	sta	%f15,	[%l7 + 0x08] %asi
loop_401:
	array32	%i4,	%o7,	%i5
	bn,pn	%icc,	loop_402
	movne	%xcc,	%i6,	%g3
	wr	%g0,	0x89,	%asi
	stxa	%o6,	[%l7 + 0x08] %asi
loop_402:
	tpos	%icc,	0x4
	xnorcc	%l4,	%i0,	%o0
	andn	%l5,	0x066B,	%g2
	alignaddrl	%g6,	%o5,	%l2
	bn,a	%xcc,	loop_403
	bpos,a	loop_404
	for	%f0,	%f8,	%f6
	tcs	%xcc,	0x7
loop_403:
	alignaddrl	%g7,	%l6,	%l0
loop_404:
	tcs	%icc,	0x5
	set	0x3F, %l2
	ldsba	[%l7 + %l2] 0x89,	%l3
	fzeros	%f20
	movne	%icc,	%o4,	%o1
	sdivcc	%g1,	0x1C08,	%i3
	ld	[%l7 + 0x74],	%f13
	edge8n	%i7,	%o2,	%o3
	add	%l7,	0x4C,	%l6
	wr	%g0,	0x19,	%asi
	casa	[%l6] %asi,	%l1,	%i2
	movleu	%icc,	%i1,	%g4
	bleu	loop_405
	fbne	%fcc1,	loop_406
	fmovdvc	%xcc,	%f9,	%f16
	wr	%g0,	0x04,	%asi
	lda	[%l7 + 0x7C] %asi,	%f7
loop_405:
	andn	%i4,	%o7,	%g5
loop_406:
	fpadd32	%f0,	%f2,	%f24
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
	add	%l7,	0x18,	%l6
	wr	%g0,	0x18,	%asi
	lda	[%l6] %asi,	%i6
	casa	[%l6] %asi,	%i6,	%g3
	fmovsa	%xcc,	%f10,	%f0
	fors	%f13,	%f0,	%f5
	fexpand	%f4,	%f10
	edge16	%i5,	%l4,	%i0
	tgu	%icc,	0x4
	fsrc1	%f2,	%f10
	movrne	%o0,	0x1C7,	%l5
	fmovse	%icc,	%f20,	%f17
	array16	%o6,	%g2,	%o5
	movrlz	%l2,	%g6,	%l6
	bn,pn	%icc,	loop_407
	fmovrse	%l0,	%f31,	%f14
	edge16n	%l3,	%g7,	%o1
	tl	%icc,	0x0
loop_407:
	array32	%o4,	%i3,	%g1
	umulcc	%i7,	%o2,	%l1
	andn	%o3,	%i2,	%g4
	nop
	setx	loop_408,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	orn	%i4,	%i1,	%o7
	sllx	%g5,	%g3,	%i5
	andcc	%i6,	%i0,	%o0
loop_408:
	srl	%l4,	%l5,	%o6
	flushw
	subc	%o5,	0x1F79,	%l2
	tpos	%icc,	0x7
	srlx	%g2,	0x13,	%g6
	flushw
	sra	%l0,	0x1F,	%l3
	add	%l7,	0x40,	%l6
	wr	%g0,	0x11,	%asi
	lda	[%l6] %asi,	%g7
	casa	[%l6] 0x11,	%g7,	%o1
	xorcc	%o4,	0x02D3,	%i3
	fbue,a	%fcc1,	loop_409
	tge	%icc,	0x4
	wr	%g0,	0x80,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
loop_409:
	alignaddrl	%g1,	%i7,	%l6
	membar	0x5A
	smul	%l1,	0x0196,	%o2
	ldsh	[%l7 + 0x38],	%i2
	ldd	[%l7 + 0x28],	%g4
	tneg	%icc,	0x5
	movneg	%icc,	%o3,	%i4
	fbne,a	%fcc0,	loop_410
	movrgz	%o7,	%g5,	%i1
	movneg	%icc,	%g3,	%i5
	wr	%g0,	0x04,	%asi
	stha	%i6,	[%l7 + 0x6C] %asi
loop_410:
	edge32n	%i0,	%o0,	%l5
	movpos	%xcc,	%o6,	%o5
	fandnot1	%f14,	%f24,	%f0
	array16	%l4,	%l2,	%g6
	tpos	%icc,	0x1
	tcs	%xcc,	0x7
	bshuffle	%f28,	%f16,	%f18
	fbu,a	%fcc1,	loop_411
	brgz	%g2,	loop_412
	fmovs	%f31,	%f9
	tpos	%xcc,	0x5
loop_411:
	umulcc	%l0,	0x1BEF,	%l3
loop_412:
	fmuld8ulx16	%f21,	%f1,	%f18
	andcc	%g7,	0x1642,	%o4
	ld	[%l7 + 0x48],	%f25
	sub	%o1,	%g1,	%i3
	movcs	%icc,	%l6,	%l1
	fmovdg	%icc,	%f1,	%f18
	fandnot2s	%f30,	%f6,	%f25
	fbne,a	%fcc1,	loop_413
	stw	%i7,	[%l7 + 0x78]
	st	%f10,	[%l7 + 0x78]
	stb	%i2,	[%l7 + 0x6D]
loop_413:
	fcmple16	%f18,	%f30,	%o2
	ldsh	[%l7 + 0x5C],	%o3
	taddcctv	%i4,	%o7,	%g4
	fbu	%fcc1,	loop_414
	fpsub16	%f16,	%f22,	%f10
	alignaddr	%g5,	%i1,	%g3
	tne	%icc,	0x3
loop_414:
	array32	%i6,	%i0,	%o0
	or	%i5,	%l5,	%o6
	edge8ln	%l4,	%l2,	%g6
	edge8l	%g2,	%l0,	%l3
	edge16	%g7,	%o4,	%o5
	alignaddrl	%o1,	%g1,	%i3
	fmovrde	%l1,	%f28,	%f2
	brz	%i7,	loop_415
	edge16ln	%l6,	%i2,	%o3
	mulx	%o2,	0x1ED4,	%i4
	add	%l7,	0x44,	%l6
	wr	%g0,	0x18,	%asi
	casa	[%l6] %asi,	%o7,	%g5
loop_415:
	tvs	%xcc,	0x7
	subcc	%g4,	0x0A8D,	%i1
	alignaddr	%g3,	%i0,	%i6
	fnors	%f11,	%f31,	%f10
	movvc	%icc,	%o0,	%i5
	addc	%l5,	0x0C34,	%l4
	udiv	%l2,	0x130E,	%g6
	nop
	set	0x5C, %i1
	lduw	[%l7 + %i1],	%g2
	set	0x20, %g3
	prefetcha	[%l7 + %g3] 0x89,	 0x1
	membar	0x2C
	ldub	[%l7 + 0x21],	%l3
	add	%l7,	0x3C,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x89,	%l0,	%g7
	wr	%g0,	0x81,	%asi
	stha	%o4,	[%l7 + 0x6C] %asi
	wr	%g0,	0x18,	%asi
	ldsha	[%l7 + 0x7E] %asi,	%o5
	bge,pt	%xcc,	loop_416
	movre	%o1,	0x375,	%g1
	tle	%xcc,	0x5
	fandnot2s	%f17,	%f22,	%f4
loop_416:
	movre	%i3,	0x10B,	%i7
	sethi	0x1741,	%l1
	edge32n	%l6,	%o3,	%i2
	mulx	%o2,	%i4,	%g5
	fbul,a	%fcc0,	loop_417
	fmovsneg	%xcc,	%f29,	%f8
	fbe,a	%fcc0,	loop_418
	tvc	%icc,	0x4
loop_417:
	fxnor	%f14,	%f20,	%f4
	brnz	%g4,	loop_419
loop_418:
	sdiv	%o7,	0x097C,	%i1
	edge32l	%g3,	%i6,	%o0
	ba,pt	%xcc,	loop_420
loop_419:
	array32	%i0,	%i5,	%l5
	movrlez	%l2,	0x035,	%g6
	fmovsge	%xcc,	%f10,	%f11
loop_420:
	ldd	[%l7 + 0x68],	%g2
	orn	%l4,	%o6,	%l0
	smulcc	%l3,	0x026B,	%g7
	stw	%o4,	[%l7 + 0x30]
	smul	%o5,	%o1,	%i3
	tn	%xcc,	0x3
	tn	%xcc,	0x5
	wr	%g0,	0x80,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	ldx	[%l7 + 0x40],	%i7
	fmovdne	%xcc,	%f31,	%f18
	std	%f26,	[%l7 + 0x48]
	movcs	%icc,	%g1,	%l1
	fabss	%f7,	%f4
	fnot2	%f10,	%f26
	add	%l7,	0x48,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%o3,	%l6
	ldub	[%l7 + 0x5C],	%i2
	ldsb	[%l7 + 0x69],	%i4
	flushw
	array16	%o2,	%g5,	%o7
	edge16l	%i1,	%g4,	%i6
	edge32	%o0,	%g3,	%i5
	edge32l	%l5,	%l2,	%i0
	addcc	%g6,	%l4,	%o6
	taddcctv	%l0,	%l3,	%g7
	fmovrdlz	%g2,	%f18,	%f28
	sdivx	%o5,	0x152D,	%o4
	srlx	%o1,	0x08,	%i3
	wr	%g0,	0x81,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	wr	%g0,	0x80,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	movvs	%icc,	%g1,	%l1
	orcc	%i7,	0x05A9,	%o3
	movrlez	%i2,	%i4,	%o2
	add	%l7,	0x0C,	%l6
	wr	%g0,	0x0c,	%asi
	casa	[%l6] %asi,	%l6,	%g5
	alignaddrl	%i1,	%o7,	%g4
	sdivcc	%o0,	0x186D,	%g3
	brnz	%i5,	loop_421
	sdivcc	%i6,	0x0C51,	%l2
	fcmpeq16	%f4,	%f18,	%i0
	set	0x20, %l0
	stwa	%g6,	[%l7 + %l0] 0x10
loop_421:
	xnor	%l5,	%l4,	%o6
	sll	%l3,	%l0,	%g7
	flushw
	wr	%g0,	0x89,	%asi
	stha	%o5,	[%l7 + 0x3A] %asi
	srax	%o4,	%g2,	%i3
	srax	%g1,	%o1,	%i7
	fpackfix	%f8,	%f23
	movgu	%icc,	%l1,	%o3
	fmovrslez	%i4,	%f29,	%f31
	orncc	%i2,	0x0564,	%o2
	sub	%l6,	0x0D21,	%g5
	movg	%xcc,	%i1,	%g4
	edge32ln	%o0,	%g3,	%i5
	umul	%o7,	0x1652,	%l2
	array32	%i6,	%i0,	%l5
	addc	%g6,	0x0180,	%o6
	set	0x78, %g2
	lduwa	[%l7 + %g2] 0x15,	%l4
	edge16ln	%l3,	%l0,	%o5
	add	%g7,	%g2,	%i3
	andncc	%g1,	%o4,	%o1
	umulcc	%i7,	0x09FE,	%l1
	subc	%o3,	%i2,	%o2
	fmovsn	%xcc,	%f8,	%f14
	edge16l	%i4,	%g5,	%i1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpsub32s	%f21,	%f30,	%f1
	udiv	%l6,	0x051C,	%g4
	edge32ln	%g3,	%i5,	%o7
	fmovdg	%icc,	%f29,	%f28
	edge8ln	%l2,	%o0,	%i0
	umul	%i6,	0x05AF,	%g6
	tge	%xcc,	0x3
	fmuld8sux16	%f17,	%f20,	%f6
	fnot1s	%f18,	%f1
	fmovdcc	%icc,	%f3,	%f10
	fsrc1s	%f28,	%f3
	sdivx	%l5,	0x100B,	%o6
	stx	%l3,	[%l7 + 0x20]
	subcc	%l4,	%l0,	%g7
	fmovdcs	%xcc,	%f17,	%f15
	fmovdcc	%xcc,	%f10,	%f19
	add	%l7,	0x7C,	%l6
	wr	%g0,	0x18,	%asi
	lda	[%l6] %asi,	%g2
	casa	[%l6] %asi,	%g2,	%o5
	tle	%icc,	0x5
	membar	0x40
	tpos	%xcc,	0x6
	fxnors	%f7,	%f15,	%f1
	stb	%i3,	[%l7 + 0x7E]
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbul,a	%fcc2,	loop_422
	fbn,a	%fcc3,	loop_423
	subccc	%g1,	0x0543,	%o1
	tvs	%icc,	0x1
loop_422:
	edge8n	%o4,	%i7,	%l1
loop_423:
	brlz	%o3,	loop_424
	edge8n	%i2,	%o2,	%g5
	udivx	%i4,	0x1FCB,	%l6
	sethi	0x0F4C,	%g4
loop_424:
	fblg,a	%fcc0,	loop_425
	popc	%i1,	%i5
	edge16l	%g3,	%l2,	%o0
	add	%o7,	%i6,	%g6
loop_425:
	ta	%xcc,	0x1
	brlz	%l5,	loop_426
	fbe	%fcc1,	loop_427
	sub	%i0,	%l3,	%l4
	movge	%icc,	%o6,	%l0
loop_426:
	popc	%g7,	%o5
loop_427:
	movn	%xcc,	%i3,	%g1
	srax	%g2,	%o1,	%o4
	movrne	%i7,	%l1,	%i2
	andcc	%o2,	%g5,	%i4
	fnand	%f18,	%f0,	%f20
	srl	%l6,	0x05,	%o3
	wr	%g0,	0x89,	%asi
	stba	%g4,	[%l7 + 0x56] %asi
	set	0x4A, %l5
	ldsha	[%l7 + %l5] 0x1d,	%i1
	tl	%xcc,	0x1
	set	0x10, %o4
	ldda	[%l7 + %o4] 0x81,	%g2
	ba	loop_428
	sllx	%i5,	%l2,	%o0
	wr	%g0,	0x18,	%asi
	lduba	[%l7 + 0x6F] %asi,	%i6
loop_428:
	movne	%xcc,	%g6,	%o7
	tg	%xcc,	0x7
	fcmpeq16	%f24,	%f4,	%l5
	bneg	%xcc,	loop_429
	movneg	%icc,	%l3,	%l4
	sra	%o6,	%i0,	%g7
	fmovrsgez	%o5,	%f20,	%f10
loop_429:
	fmovde	%xcc,	%f4,	%f26
	tpos	%xcc,	0x0
	fmul8x16al	%f29,	%f6,	%f14
	fblg	%fcc0,	loop_430
	edge16n	%i3,	%g1,	%g2
	fbu,a	%fcc2,	loop_431
	subc	%l0,	0x1E82,	%o4
loop_430:
	fmul8ulx16	%f30,	%f0,	%f0
	bleu	%icc,	loop_432
loop_431:
	udivcc	%i7,	0x18B6,	%l1
	fornot1s	%f19,	%f20,	%f26
	flush	%l7 + 0x5C
loop_432:
	sethi	0x097D,	%i2
	fmovsle	%icc,	%f6,	%f1
	ldsb	[%l7 + 0x35],	%o2
	fnot2	%f24,	%f14
	andcc	%o1,	0x1326,	%g5
	tsubcc	%i4,	0x0261,	%o3
	fmovrsgez	%g4,	%f11,	%f24
	tl	%xcc,	0x2
	fmovde	%icc,	%f22,	%f21
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	or	%l6,	%i1,	%g3
	edge16ln	%i5,	%l2,	%o0
	brnz,a	%i6,	loop_433
	stbar
	membar	0x39
	fbn,a	%fcc1,	loop_434
loop_433:
	fmovsleu	%icc,	%f9,	%f7
	fsrc2	%f26,	%f6
	tcc	%icc,	0x5
loop_434:
	xnor	%o7,	0x19A5,	%l5
	movrlez	%l3,	%l4,	%g6
	add	%o6,	0x02C0,	%i0
	srax	%g7,	0x02,	%o5
	taddcctv	%g1,	0x1951,	%i3
	orcc	%l0,	0x1657,	%g2
	subcc	%o4,	%l1,	%i2
	nop
	setx	loop_435,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	tcc	%icc,	0x0
	movcc	%icc,	%i7,	%o2
	fzeros	%f23
loop_435:
	ldd	[%l7 + 0x68],	%f22
	ldd	[%l7 + 0x78],	%f18
	edge32	%g5,	%o1,	%i4
	sra	%o3,	0x16,	%l6
	movpos	%icc,	%i1,	%g4
	set	0x40, %i5
	ldda	[%l7 + %i5] 0x88,	%f0
	bl,a	%xcc,	loop_436
	fmovdle	%icc,	%f23,	%f10
	sllx	%i5,	0x1B,	%g3
	fmovrse	%o0,	%f31,	%f9
loop_436:
	movneg	%icc,	%l2,	%o7
	fand	%f20,	%f4,	%f10
	tneg	%xcc,	0x0
	edge8ln	%l5,	%l3,	%i6
	umulcc	%l4,	0x085B,	%g6
	brlez	%o6,	loop_437
	addcc	%g7,	%i0,	%o5
	bne,pt	%icc,	loop_438
	sir	0x0D46
loop_437:
	srlx	%i3,	%l0,	%g2
	fbl	%fcc2,	loop_439
loop_438:
	movrgez	%g1,	%l1,	%o4
	fmovsgu	%xcc,	%f21,	%f15
	sub	%i7,	0x0D7D,	%o2
loop_439:
	movne	%xcc,	%i2,	%o1
	srl	%g5,	0x1C,	%o3
	tgu	%xcc,	0x0
	swap	[%l7 + 0x30],	%l6
	alignaddr	%i1,	%i4,	%i5
	movvc	%xcc,	%g4,	%o0
	edge16ln	%g3,	%l2,	%o7
	xnorcc	%l3,	%i6,	%l4
	edge8l	%l5,	%g6,	%g7
	nop
	set	0x54, %i6
	prefetch	[%l7 + %i6],	 0x2
	udivcc	%i0,	0x1688,	%o6
	addccc	%o5,	%i3,	%l0
	sllx	%g1,	%g2,	%l1
	udivx	%i7,	0x12DD,	%o4
	alignaddrl	%i2,	%o1,	%o2
	movre	%g5,	0x1D2,	%o3
	tneg	%icc,	0x1
	wr	%g0,	0x81,	%asi
	ldswa	[%l7 + 0x5C] %asi,	%l6
	fmovrdlz	%i4,	%f8,	%f12
	smul	%i1,	%g4,	%o0
	tcs	%icc,	0x3
	sir	0x0390
	or	%g3,	0x1ED4,	%l2
	fmovsvc	%xcc,	%f15,	%f4
	sdiv	%i5,	0x15A7,	%o7
	xor	%l3,	%i6,	%l5
	te	%xcc,	0x7
	movl	%icc,	%g6,	%l4
	fpadd16	%f18,	%f26,	%f14
	fbo,a	%fcc2,	loop_440
	udivcc	%g7,	0x0988,	%i0
	bne,a	loop_441
	membar	0x6E
loop_440:
	orcc	%o5,	0x1216,	%i3
	fbule,a	%fcc1,	loop_442
loop_441:
	fabsd	%f8,	%f24
	fbule,a	%fcc2,	loop_443
	ta	%xcc,	0x1
loop_442:
	fcmpd	%fcc3,	%f20,	%f0
	mulx	%o6,	0x1ABB,	%g1
loop_443:
	taddcc	%l0,	0x0D06,	%g2
	mulscc	%l1,	%i7,	%o4
	fmul8x16	%f1,	%f30,	%f22
	fabsd	%f22,	%f10
	mulx	%o1,	%o2,	%i2
	set	0x30, %o0
	ldda	[%l7 + %o0] 0x23,	%o2
	for	%f30,	%f0,	%f8
	movcs	%xcc,	%g5,	%i4
	fmuld8ulx16	%f10,	%f9,	%f8
	alignaddrl	%i1,	%g4,	%l6
	sethi	0x136B,	%o0
	bshuffle	%f26,	%f16,	%f14
	membar	0x19
	movvs	%xcc,	%l2,	%g3
	srl	%i5,	%l3,	%i6
	movvs	%icc,	%o7,	%l5
	wr	%g0,	0x11,	%asi
	lduba	[%l7 + 0x7A] %asi,	%l4
	fornot2	%f28,	%f20,	%f30
	fcmpd	%fcc1,	%f24,	%f20
	fmuld8ulx16	%f19,	%f15,	%f12
	edge16	%g6,	%i0,	%g7
	fbul,a	%fcc3,	loop_444
	alignaddrl	%i3,	%o6,	%o5
	andn	%g1,	%l0,	%l1
	movg	%xcc,	%g2,	%i7
loop_444:
	and	%o1,	%o4,	%i2
	movcc	%xcc,	%o2,	%g5
	tneg	%xcc,	0x3
	fnot2s	%f24,	%f17
	fnegd	%f0,	%f24
	udivx	%i4,	0x1785,	%i1
	addc	%o3,	0x08AC,	%g4
	fbl,a	%fcc1,	loop_445
	nop
	setx loop_446, %l0, %l1
	jmpl %l1, %o0
	fmovd	%f26,	%f0
	edge32n	%l6,	%g3,	%l2
loop_445:
	brlez,a	%l3,	loop_447
loop_446:
	ldx	[%l7 + 0x30],	%i6
	bge,pn	%icc,	loop_448
	fmovrdlz	%i5,	%f24,	%f28
loop_447:
	movrne	%o7,	0x310,	%l4
	ta	%xcc,	0x2
loop_448:
	movle	%xcc,	%g6,	%l5
	tsubcctv	%i0,	0x0F15,	%g7
	sethi	0x0C74,	%o6
	movvs	%xcc,	%o5,	%g1
	set	0x4F, %o5
	lduba	[%l7 + %o5] 0x88,	%l0
	subccc	%i3,	%l1,	%i7
	fandnot1	%f30,	%f14,	%f6
	st	%f26,	[%l7 + 0x58]
	fbn,a	%fcc1,	loop_449
	sdivcc	%o1,	0x0FBC,	%g2
	add	%l7,	0x50,	%l6
	wr	%g0,	0x18,	%asi
	casxa	[%l6] 0x18,	%o4,	%o2
loop_449:
	tn	%xcc,	0x0
	udivx	%g5,	0x0EBC,	%i4
	mulx	%i2,	0x09AC,	%i1
	smulcc	%g4,	0x188A,	%o3
	call	loop_450
	fones	%f14
	tvc	%icc,	0x4
	tge	%xcc,	0x0
loop_450:
	udiv	%o0,	0x1CE5,	%g3
	set	0x14, %i0
	lda	[%l7 + %i0] 0x0c,	%f18
	fcmpgt16	%f28,	%f22,	%l6
	fbe,a	%fcc1,	loop_451
	sub	%l3,	0x1BC6,	%i6
	fmovdvc	%icc,	%f20,	%f10
	addc	%i5,	0x145C,	%o7
loop_451:
	fornot2	%f8,	%f22,	%f6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrdgz	%l4,	%f12,	%f18
	fandnot1	%f28,	%f20,	%f22
	tvs	%xcc,	0x0
	bpos	%icc,	loop_452
	edge16ln	%g6,	%l5,	%i0
	subc	%l2,	%o6,	%o5
	ldsb	[%l7 + 0x4B],	%g1
loop_452:
	nop
	wr	%g0,	0x04,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	brz,a	%l0,	loop_453
	brlz,a	%i3,	loop_454
	fmovdle	%icc,	%f9,	%f17
	sub	%g7,	0x11EA,	%l1
loop_453:
	fmul8sux16	%f2,	%f8,	%f12
loop_454:
	movrlz	%o1,	0x055,	%g2
	wr	%g0,	0x11,	%asi
	ldswa	[%l7 + 0x70] %asi,	%o4
	movrne	%o2,	%g5,	%i7
	set	0x68, %g1
	stxa	%i4,	[%l7 + %g1] 0x04
	xor	%i2,	0x1D3C,	%g4
	subc	%i1,	%o0,	%o3
	move	%xcc,	%l6,	%l3
	fmovsleu	%icc,	%f3,	%f0
	edge32l	%i6,	%i5,	%g3
	flushw
	addcc	%o7,	%g6,	%l5
	ldstub	[%l7 + 0x48],	%l4
	array8	%l2,	%o6,	%o5
	movvs	%xcc,	%i0,	%g1
	add	%i3,	0x09E4,	%g7
	xor	%l1,	%o1,	%g2
	fsrc2s	%f30,	%f12
	set	0x14, %l4
	stwa	%o4,	[%l7 + %l4] 0x15
	fmovde	%icc,	%f13,	%f20
	movneg	%icc,	%o2,	%g5
	tgu	%icc,	0x5
	mulx	%l0,	0x1D14,	%i4
	lduh	[%l7 + 0x54],	%i2
	fsrc1s	%f12,	%f3
	movg	%icc,	%g4,	%i1
	fbuge	%fcc3,	loop_455
	ldx	[%l7 + 0x70],	%o0
	nop
	set	0x28, %g5
	ldd	[%l7 + %g5],	%i6
	tsubcctv	%l6,	0x1EC9,	%l3
loop_455:
	move	%xcc,	%i6,	%o3
	tsubcctv	%g3,	0x006B,	%i5
	fmovde	%xcc,	%f31,	%f26
	swap	[%l7 + 0x58],	%g6
	array8	%o7,	%l5,	%l4
	movne	%xcc,	%l2,	%o6
	nop
	setx loop_456, %l0, %l1
	jmpl %l1, %o5
	fblg,a	%fcc3,	loop_457
	fmovs	%f7,	%f27
	fmovdn	%icc,	%f3,	%f28
loop_456:
	or	%i0,	0x18B0,	%g1
loop_457:
	fsrc1s	%f17,	%f10
	tle	%xcc,	0x1
	srax	%g7,	0x0C,	%i3
	edge16l	%l1,	%o1,	%g2
	tn	%xcc,	0x7
	movvs	%icc,	%o4,	%o2
	udivcc	%l0,	0x0440,	%i4
	orn	%i2,	%g4,	%g5
	andncc	%o0,	%i7,	%i1
	movrlz	%l3,	%i6,	%l6
	ldx	[%l7 + 0x30],	%o3
	addc	%i5,	0x0584,	%g6
	stb	%o7,	[%l7 + 0x5A]
	brnz,a	%g3,	loop_458
	tpos	%icc,	0x3
	movrgez	%l5,	0x24C,	%l4
	srl	%l2,	%o5,	%o6
loop_458:
	xnor	%g1,	%i0,	%i3
	fmovdle	%icc,	%f2,	%f14
	fornot1	%f12,	%f10,	%f18
	ba,a,pt	%xcc,	loop_459
	bvs,a	%icc,	loop_460
	xnor	%g7,	%o1,	%g2
	fpsub16s	%f26,	%f24,	%f26
loop_459:
	movrlez	%o4,	%l1,	%o2
loop_460:
	tg	%icc,	0x1
	sra	%i4,	%l0,	%i2
	movvc	%xcc,	%g5,	%o0
	tn	%icc,	0x1
	smul	%i7,	%g4,	%l3
	fmovrse	%i6,	%f12,	%f22
	fmovdpos	%xcc,	%f21,	%f2
	stb	%l6,	[%l7 + 0x26]
	wr	%g0,	0x18,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	tcc	%xcc,	0x1
	xnor	%i1,	%o3,	%i5
	popc	0x11D3,	%o7
	xor	%g6,	0x1797,	%g3
	edge8n	%l5,	%l2,	%l4
	popc	0x16BA,	%o5
	fcmpgt32	%f2,	%f12,	%g1
	fmovde	%icc,	%f1,	%f12
	smul	%i0,	0x0A87,	%o6
	bleu	loop_461
	edge32l	%g7,	%i3,	%g2
	edge16	%o4,	%l1,	%o1
	fcmpne32	%f12,	%f10,	%i4
loop_461:
	fxors	%f27,	%f15,	%f13
	tpos	%icc,	0x6
	mulx	%l0,	0x1703,	%i2
	wr	%g0,	0x89,	%asi
	stba	%g5,	[%l7 + 0x7F] %asi
	fcmpeq32	%f6,	%f14,	%o0
	fba,a	%fcc0,	loop_462
	tsubcc	%o2,	%g4,	%i7
	movne	%icc,	%l3,	%l6
	addcc	%i1,	%o3,	%i5
loop_462:
	edge32ln	%o7,	%i6,	%g6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	brlz,a	%g3,	loop_463
	movrlez	%l5,	%l2,	%o5
	ldub	[%l7 + 0x6C],	%l4
	tgu	%icc,	0x0
loop_463:
	mova	%xcc,	%i0,	%g1
	move	%icc,	%o6,	%g7
	edge32	%i3,	%o4,	%g2
	fmuld8ulx16	%f20,	%f1,	%f6
	fbg,a	%fcc2,	loop_464
	st	%f30,	[%l7 + 0x14]
	mova	%xcc,	%o1,	%i4
	brgez,a	%l1,	loop_465
loop_464:
	fnot2	%f18,	%f10
	fsrc2	%f18,	%f2
	movvs	%icc,	%l0,	%g5
loop_465:
	array8	%o0,	%i2,	%g4
	ldsw	[%l7 + 0x5C],	%i7
	fmovdl	%icc,	%f21,	%f12
	mulx	%o2,	%l3,	%l6
	fmovda	%xcc,	%f5,	%f17
	ldd	[%l7 + 0x60],	%i0
	fmovspos	%icc,	%f2,	%f18
	fnor	%f20,	%f14,	%f6
	movne	%xcc,	%o3,	%i5
	xorcc	%i6,	%g6,	%o7
	orn	%g3,	0x0547,	%l5
	fxnor	%f30,	%f12,	%f2
	set	0x38, %l3
	ldxa	[%l7 + %l3] 0x10,	%l2
	wr	%g0,	0x88,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	bpos,pt	%xcc,	loop_466
	sdivx	%o5,	0x0E6D,	%i0
	edge32l	%l4,	%g1,	%o6
	ble,pn	%icc,	loop_467
loop_466:
	xnor	%i3,	%g7,	%o4
	fbo	%fcc1,	loop_468
	movcc	%xcc,	%o1,	%g2
loop_467:
	sethi	0x15CB,	%l1
	fbue,a	%fcc0,	loop_469
loop_468:
	fmovrdgz	%l0,	%f14,	%f12
	mova	%icc,	%g5,	%o0
	movle	%icc,	%i4,	%g4
loop_469:
	fbne	%fcc2,	loop_470
	taddcctv	%i7,	%i2,	%o2
	movgu	%xcc,	%l6,	%i1
	bneg,a,pn	%icc,	loop_471
loop_470:
	addcc	%l3,	%o3,	%i6
	fxor	%f24,	%f22,	%f4
	fbul,a	%fcc0,	loop_472
loop_471:
	bne,a,pt	%icc,	loop_473
	edge32	%i5,	%o7,	%g3
	udivcc	%l5,	0x0EE5,	%l2
loop_472:
	sdivx	%o5,	0x1F0A,	%i0
loop_473:
	ldsh	[%l7 + 0x5A],	%g6
	fbge,a	%fcc3,	loop_474
	tvs	%xcc,	0x5
	bleu,a	%xcc,	loop_475
	tn	%xcc,	0x1
loop_474:
	movcc	%icc,	%g1,	%o6
	tne	%xcc,	0x6
loop_475:
	tgu	%icc,	0x6
	subccc	%i3,	%l4,	%o4
	fmul8sux16	%f24,	%f14,	%f24
	sra	%o1,	%g7,	%l1
	addcc	%g2,	0x00E7,	%g5
	fbl	%fcc3,	loop_476
	and	%o0,	%l0,	%i4
	sra	%i7,	0x10,	%i2
	tsubcctv	%g4,	%l6,	%o2
loop_476:
	tcc	%xcc,	0x1
	edge16	%l3,	%o3,	%i1
	brz	%i6,	loop_477
	alignaddr	%o7,	%g3,	%i5
	set	0x45, %i7
	lduba	[%l7 + %i7] 0x14,	%l5
loop_477:
	udivx	%o5,	0x088F,	%i0
	mulx	%g6,	%g1,	%l2
	set	0x14, %i3
	stba	%o6,	[%l7 + %i3] 0x04
	tl	%xcc,	0x0
	bleu,pn	%icc,	loop_478
	bgu,a	loop_479
	movrne	%i3,	%o4,	%o1
	bvs	loop_480
loop_478:
	tsubcctv	%l4,	0x18AC,	%l1
loop_479:
	fbug	%fcc1,	loop_481
	stw	%g2,	[%l7 + 0x68]
loop_480:
	sllx	%g7,	%o0,	%g5
	fbg,a	%fcc2,	loop_482
loop_481:
	edge32l	%i4,	%l0,	%i7
	brlz,a	%i2,	loop_483
	srl	%g4,	%l6,	%o2
loop_482:
	brgez	%o3,	loop_484
	tgu	%xcc,	0x7
loop_483:
	nop
	set	0x7E, %l6
	lduha	[%l7 + %l6] 0x19,	%l3
loop_484:
	membar	0x2E
	sdivx	%i6,	0x1FDF,	%o7
	bl,a,pt	%icc,	loop_485
	sethi	0x1CF3,	%g3
	bcc	loop_486
	movpos	%xcc,	%i1,	%l5
loop_485:
	sra	%o5,	%i0,	%i5
	fpack32	%f20,	%f22,	%f6
loop_486:
	edge8ln	%g1,	%g6,	%o6
	brnz	%i3,	loop_487
	sub	%o4,	0x062A,	%o1
	lduw	[%l7 + 0x28],	%l4
	bg,pt	%icc,	loop_488
loop_487:
	lduw	[%l7 + 0x4C],	%l2
	tn	%icc,	0x3
	xor	%g2,	0x01AB,	%g7
loop_488:
	addccc	%o0,	0x0C09,	%g5
	movrgz	%i4,	%l0,	%i7
	udivx	%i2,	0x1A20,	%g4
	sll	%l1,	%o2,	%o3
	tneg	%icc,	0x0
	wr	%g0,	0x89,	%asi
	stxa	%l6,	[%l7 + 0x70] %asi
	movvc	%xcc,	%l3,	%i6
	ldstub	[%l7 + 0x2F],	%g3
	faligndata	%f8,	%f16,	%f16
	movcc	%xcc,	%o7,	%i1
	andcc	%o5,	%i0,	%i5
	udiv	%l5,	0x1093,	%g6
	movleu	%xcc,	%g1,	%o6
	sethi	0x0B29,	%o4
	orcc	%i3,	0x0711,	%o1
	movrlz	%l2,	0x330,	%g2
	brlez,a	%l4,	loop_489
	brnz,a	%g7,	loop_490
	edge32	%o0,	%g5,	%l0
	andn	%i4,	%i2,	%g4
loop_489:
	tcs	%icc,	0x5
loop_490:
	tsubcctv	%i7,	%o2,	%o3
	movle	%icc,	%l1,	%l3
	tsubcctv	%i6,	%l6,	%o7
	tge	%icc,	0x0
	fexpand	%f26,	%f22
	fnot1	%f30,	%f4
	flushw
	edge16l	%i1,	%o5,	%i0
	tcs	%xcc,	0x0
	fbe,a	%fcc1,	loop_491
	ble,a,pt	%icc,	loop_492
	andn	%i5,	%l5,	%g6
	tge	%xcc,	0x4
loop_491:
	fmovda	%icc,	%f9,	%f4
loop_492:
	xorcc	%g1,	%o6,	%g3
	bl,a,pn	%icc,	loop_493
	sdivcc	%o4,	0x0273,	%i3
	fbl,a	%fcc0,	loop_494
	fnand	%f6,	%f18,	%f16
loop_493:
	fmovscc	%xcc,	%f7,	%f10
	fmovdleu	%xcc,	%f1,	%f14
loop_494:
	srl	%o1,	0x0B,	%g2
	edge16	%l2,	%g7,	%o0
	fmuld8sux16	%f16,	%f21,	%f22
	brlez	%g5,	loop_495
	fxor	%f10,	%f26,	%f16
	mulscc	%l4,	0x0482,	%i4
	taddcc	%i2,	0x1A78,	%l0
loop_495:
	fbl	%fcc2,	loop_496
	nop
	setx	loop_497,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fcmpne16	%f2,	%f18,	%g4
	sdivcc	%o2,	0x09A6,	%i7
loop_496:
	movneg	%icc,	%l1,	%o3
loop_497:
	subcc	%l3,	%i6,	%o7
	umulcc	%l6,	0x07AC,	%o5
	xor	%i1,	%i0,	%l5
	subccc	%g6,	%i5,	%g1
	edge8l	%g3,	%o6,	%i3
	fxnor	%f22,	%f0,	%f30
	edge32n	%o4,	%g2,	%l2
	movl	%icc,	%o1,	%o0
	movle	%icc,	%g7,	%g5
	edge16ln	%l4,	%i4,	%l0
	xnorcc	%g4,	0x17AD,	%o2
	bpos,a,pt	%xcc,	loop_498
	fmovsa	%icc,	%f0,	%f2
	stbar
	ba,pt	%xcc,	loop_499
loop_498:
	array8	%i2,	%l1,	%i7
	fmovsg	%xcc,	%f20,	%f23
	fbule,a	%fcc3,	loop_500
loop_499:
	ta	%xcc,	0x3
	fbg,a	%fcc3,	loop_501
	fmovsvc	%xcc,	%f22,	%f11
loop_500:
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
loop_501:
	fmovdl	%icc,	%f4,	%f17
	fmovdg	%xcc,	%f9,	%f10
	tneg	%xcc,	0x2
	fbn	%fcc2,	loop_502
	tneg	%icc,	0x0
	set	0x28, %o7
	lduha	[%l7 + %o7] 0x14,	%l3
loop_502:
	movcs	%xcc,	%i6,	%o7
	orn	%l6,	%o5,	%o3
	edge16	%i0,	%l5,	%i1
	edge16ln	%i5,	%g1,	%g6
	movrgez	%g3,	%i3,	%o4
	sub	%o6,	0x0B08,	%g2
	wr	%g0,	0x89,	%asi
	lduha	[%l7 + 0x26] %asi,	%l2
	xor	%o1,	%o0,	%g7
	addccc	%g5,	%i4,	%l0
	smulcc	%g4,	%l4,	%o2
	edge32l	%i2,	%i7,	%l1
	fbne,a	%fcc2,	loop_503
	edge8l	%i6,	%l3,	%o7
	movg	%icc,	%o5,	%l6
	fcmpgt32	%f24,	%f6,	%o3
loop_503:
	fxor	%f24,	%f8,	%f8
	orncc	%i0,	%i1,	%i5
	fblg,a	%fcc3,	loop_504
	tsubcc	%g1,	%l5,	%g3
	prefetch	[%l7 + 0x2C],	 0x3
	umulcc	%g6,	%i3,	%o6
loop_504:
	fandnot1	%f8,	%f2,	%f20
	movne	%icc,	%g2,	%l2
	fmovrdlez	%o1,	%f8,	%f30
	te	%icc,	0x3
	set	0x4D, %g4
	stba	%o0,	[%l7 + %g4] 0x1c
	edge16	%g7,	%g5,	%i4
	srlx	%o4,	%l0,	%l4
	movleu	%icc,	%o2,	%g4
	smulcc	%i7,	%i2,	%i6
	orncc	%l3,	%l1,	%o7
	bleu,a,pn	%icc,	loop_505
	tle	%icc,	0x2
	tn	%xcc,	0x0
	brz	%l6,	loop_506
loop_505:
	movneg	%xcc,	%o5,	%o3
	tvc	%xcc,	0x5
	fmovdge	%xcc,	%f25,	%f13
loop_506:
	srlx	%i0,	0x1D,	%i1
	xnorcc	%g1,	0x1919,	%l5
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x5E] %asi,	%g3
	smulcc	%g6,	%i5,	%i3
	tge	%xcc,	0x2
	fmul8ulx16	%f10,	%f8,	%f30
	movre	%g2,	%o6,	%l2
	st	%f16,	[%l7 + 0x24]
	tneg	%xcc,	0x4
	fmovsle	%xcc,	%f6,	%f14
	tge	%icc,	0x6
	te	%xcc,	0x0
	movvs	%icc,	%o0,	%g7
	srlx	%g5,	0x1B,	%o1
	andcc	%i4,	%o4,	%l4
	bcc	loop_507
	andn	%o2,	0x0CDD,	%l0
	wr	%g0,	0x0c,	%asi
	stba	%g4,	[%l7 + 0x29] %asi
loop_507:
	tneg	%xcc,	0x4
	addccc	%i2,	%i6,	%i7
	fnegd	%f22,	%f30
	ldub	[%l7 + 0x2D],	%l3
	fnands	%f31,	%f31,	%f19
	subccc	%o7,	%l6,	%o5
	tl	%xcc,	0x5
	mova	%icc,	%l1,	%o3
	nop
	set	0x08, %o1
	std	%f0,	[%l7 + %o1]
	fmuld8ulx16	%f19,	%f6,	%f16
	bne,a	loop_508
	fpadd32s	%f7,	%f4,	%f0
	addcc	%i0,	%g1,	%i1
	or	%l5,	0x18A9,	%g3
loop_508:
	tle	%icc,	0x7
	taddcc	%g6,	%i3,	%i5
	movgu	%icc,	%o6,	%g2
	xor	%o0,	0x00F3,	%l2
	movrgz	%g7,	0x177,	%o1
	wr	%g0,	0x0c,	%asi
	lduha	[%l7 + 0x08] %asi,	%g5
	movrgez	%o4,	%l4,	%o2
	st	%f11,	[%l7 + 0x7C]
	fmovrdgz	%i4,	%f22,	%f4
	fbne	%fcc1,	loop_509
	fmovdl	%icc,	%f25,	%f27
	edge8	%l0,	%i2,	%g4
	fbne,a	%fcc2,	loop_510
loop_509:
	fones	%f5
	add	%i6,	0x1905,	%l3
	wr	%g0,	0x80,	%asi
	ldda	[%l7 + 0x30] %asi,	%o6
loop_510:
	edge32	%i7,	%l6,	%o5
	fornot1s	%f26,	%f27,	%f4
	wr	%g0,	0x04,	%asi
	ldsha	[%l7 + 0x12] %asi,	%o3
	edge32ln	%i0,	%l1,	%g1
	movcc	%xcc,	%i1,	%g3
	fbuge,a	%fcc1,	loop_511
	brz,a	%l5,	loop_512
	edge32	%g6,	%i3,	%o6
	set	0x38, %o2
	prefetcha	[%l7 + %o2] 0x1d,	 0x2
loop_511:
	movne	%xcc,	%g2,	%l2
loop_512:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	flushw
	fba,a	%fcc2,	loop_513
	srlx	%o0,	%o1,	%g7
	tsubcctv	%g5,	%o4,	%l4
	add	%i4,	0x0123,	%o2
loop_513:
	tle	%icc,	0x7
	movrlez	%i2,	%g4,	%l0
	fmovspos	%icc,	%f16,	%f6
	fbn,a	%fcc0,	loop_514
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xor	%l3,	%i6,	%o7
	tne	%icc,	0x4
loop_514:
	tge	%xcc,	0x1
	fmovdn	%xcc,	%f30,	%f22
	movg	%icc,	%l6,	%i7
	st	%f19,	[%l7 + 0x5C]
	ta	%icc,	0x3
	fbn,a	%fcc3,	loop_515
	ldd	[%l7 + 0x78],	%o2
	fcmpne16	%f22,	%f4,	%i0
	orcc	%o5,	0x1CBC,	%l1
loop_515:
	movrgz	%i1,	0x1F0,	%g3
	array32	%l5,	%g6,	%g1
	bgu	%xcc,	loop_516
	fba	%fcc3,	loop_517
	fmovsvc	%icc,	%f2,	%f11
	tneg	%xcc,	0x3
loop_516:
	edge16n	%i3,	%o6,	%i5
loop_517:
	tvs	%icc,	0x6
	movrgez	%g2,	%l2,	%o0
	wr	%g0,	0x80,	%asi
	stwa	%o1,	[%l7 + 0x58] %asi
	prefetch	[%l7 + 0x1C],	 0x2
	subccc	%g7,	0x1CA7,	%o4
	movvc	%icc,	%g5,	%i4
	stx	%o2,	[%l7 + 0x68]
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpmerge	%f14,	%f14,	%f6
	siam	0x6
	bleu,a,pt	%icc,	loop_518
	tn	%xcc,	0x2
	or	%l4,	%i2,	%g4
	fzeros	%f17
loop_518:
	tcc	%xcc,	0x0
	fbuge,a	%fcc3,	loop_519
	bleu,a,pt	%icc,	loop_520
	edge32l	%l0,	%l3,	%o7
	fbo	%fcc1,	loop_521
loop_519:
	fcmps	%fcc2,	%f29,	%f2
loop_520:
	andncc	%i6,	%i7,	%l6
	movrgez	%o3,	%i0,	%l1
loop_521:
	sub	%i1,	0x0472,	%o5
	brgz,a	%l5,	loop_522
	fcmpeq32	%f10,	%f12,	%g3
	edge8	%g1,	%g6,	%i3
	addcc	%i5,	0x0F65,	%g2
loop_522:
	fmovde	%xcc,	%f17,	%f23
	or	%l2,	0x1089,	%o0
	tpos	%icc,	0x1
	fpack16	%f14,	%f13
	addc	%o6,	%o1,	%g7
	sethi	0x083D,	%g5
	st	%f25,	[%l7 + 0x54]
	wr	%g0,	0x89,	%asi
	lduwa	[%l7 + 0x58] %asi,	%o4
	sllx	%i4,	0x06,	%o2
	addccc	%i2,	%g4,	%l0
	brz	%l4,	loop_523
	movle	%xcc,	%l3,	%i6
	movcc	%icc,	%o7,	%i7
	tvs	%xcc,	0x2
loop_523:
	taddcc	%l6,	0x07F8,	%i0
	bne	loop_524
	movleu	%xcc,	%o3,	%i1
	fbo,a	%fcc3,	loop_525
	udivx	%o5,	0x1BB3,	%l1
loop_524:
	tvs	%xcc,	0x6
	sethi	0x0509,	%l5
loop_525:
	popc	0x13D6,	%g1
	movvs	%xcc,	%g6,	%g3
	movg	%xcc,	%i3,	%g2
	wr	%g0,	0x18,	%asi
	stba	%i5,	[%l7 + 0x37] %asi
	array16	%l2,	%o6,	%o1
	stx	%g7,	[%l7 + 0x48]
	fmovsneg	%icc,	%f29,	%f9
	mulscc	%o0,	%g5,	%i4
	for	%f18,	%f6,	%f22
	fbl,a	%fcc2,	loop_526
	ta	%xcc,	0x4
	tgu	%icc,	0x5
	fmovdvs	%icc,	%f11,	%f20
loop_526:
	addc	%o2,	0x1EA5,	%i2
	fblg	%fcc3,	loop_527
	fxor	%f10,	%f8,	%f30
	ldstub	[%l7 + 0x52],	%o4
	and	%l0,	%l4,	%l3
loop_527:
	tgu	%xcc,	0x6
	xor	%i6,	%g4,	%i7
	srax	%o7,	0x04,	%l6
	movneg	%xcc,	%i0,	%o3
	fmul8ulx16	%f30,	%f10,	%f30
	fmuld8ulx16	%f5,	%f16,	%f4
	fbul,a	%fcc3,	loop_528
	xnorcc	%i1,	0x1F89,	%l1
	fmovdvc	%icc,	%f16,	%f17
	st	%f24,	[%l7 + 0x6C]
loop_528:
	movneg	%icc,	%o5,	%l5
	smulcc	%g6,	0x146A,	%g1
	wr	%g0,	0x0c,	%asi
	ldswa	[%l7 + 0x50] %asi,	%g3
	tsubcc	%i3,	0x1A0E,	%i5
	udivcc	%g2,	0x077C,	%o6
	addcc	%o1,	%g7,	%o0
	ldsh	[%l7 + 0x10],	%g5
	array16	%i4,	%o2,	%i2
	fbge,a	%fcc2,	loop_529
	fmovrdlez	%l2,	%f28,	%f6
	alignaddrl	%o4,	%l4,	%l3
	wr	%g0,	0x19,	%asi
	stba	%i6,	[%l7 + 0x12] %asi
loop_529:
	tcc	%icc,	0x5
	xnorcc	%g4,	0x14FD,	%l0
	movneg	%xcc,	%i7,	%o7
	fnor	%f4,	%f20,	%f10
	fmovdneg	%xcc,	%f25,	%f27
	fbg,a	%fcc0,	loop_530
	call	loop_531
	tvs	%xcc,	0x7
	fzero	%f22
loop_530:
	edge32	%i0,	%o3,	%l6
loop_531:
	movgu	%xcc,	%i1,	%o5
	movle	%icc,	%l1,	%l5
	for	%f26,	%f20,	%f20
	sll	%g1,	%g6,	%g3
	brgez,a	%i3,	loop_532
	fmovsgu	%icc,	%f29,	%f5
	movg	%xcc,	%i5,	%g2
	movn	%icc,	%o6,	%o1
loop_532:
	fsrc2s	%f26,	%f16
	taddcctv	%o0,	%g5,	%g7
	movvc	%xcc,	%o2,	%i4
	and	%l2,	0x01D4,	%o4
	siam	0x0
	fmovdgu	%xcc,	%f16,	%f20
	edge32n	%l4,	%i2,	%i6
	andn	%g4,	%l3,	%i7
	fmovsleu	%xcc,	%f28,	%f28
	smulcc	%o7,	%l0,	%i0
	array16	%l6,	%o3,	%i1
	popc	%o5,	%l1
	udivx	%g1,	0x07B8,	%l5
	tne	%xcc,	0x6
	subcc	%g6,	0x14CB,	%g3
	fone	%f18
	add	%l7,	0x60,	%l6
	wr	%g0,	0x04,	%asi
	casxa	[%l6] 0x04,	%i3,	%i5
	fmovde	%xcc,	%f22,	%f24
	tgu	%icc,	0x5
	movleu	%xcc,	%g2,	%o1
	tg	%xcc,	0x3
	fones	%f22
	movcc	%icc,	%o0,	%o6
	edge32	%g7,	%g5,	%o2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddr	%i4,	%l2,	%l4
	nop
	setx loop_533, %l0, %l1
	jmpl %l1, %i2
	movvs	%xcc,	%i6,	%o4
	fmovsne	%xcc,	%f9,	%f23
	te	%xcc,	0x4
loop_533:
	brlz,a	%l3,	loop_534
	stx	%i7,	[%l7 + 0x60]
	edge8	%g4,	%l0,	%i0
	sdivx	%l6,	0x10F3,	%o7
loop_534:
	fbg,a	%fcc1,	loop_535
	movrlez	%i1,	0x0F3,	%o3
	fxnors	%f26,	%f3,	%f2
	subcc	%l1,	0x181D,	%g1
loop_535:
	tsubcctv	%l5,	%o5,	%g3
	fbg,a	%fcc3,	loop_536
	tneg	%xcc,	0x1
	prefetch	[%l7 + 0x30],	 0x1
	fmovrslz	%g6,	%f9,	%f7
loop_536:
	fxor	%f0,	%f4,	%f20
	edge16ln	%i5,	%i3,	%o1
	tsubcctv	%o0,	%o6,	%g2
	addc	%g7,	%g5,	%i4
	bvc	loop_537
	srl	%l2,	0x1A,	%l4
	add	%l7,	0x0C,	%l6
	wr	%g0,	0x04,	%asi
	lda	[%l6] %asi,	%i2
	casa	[%l6] %asi,	%i2,	%i6
loop_537:
	fands	%f8,	%f29,	%f8
	subccc	%o2,	0x129E,	%l3
	movcs	%icc,	%i7,	%o4
	fble	%fcc2,	loop_538
	bleu,a	%icc,	loop_539
	sir	0x12DE
	udiv	%g4,	0x069B,	%l0
loop_538:
	tgu	%xcc,	0x5
loop_539:
	movneg	%xcc,	%i0,	%o7
	movle	%xcc,	%i1,	%l6
	sdivcc	%o3,	0x0F71,	%g1
	tgu	%icc,	0x3
	fcmpgt16	%f6,	%f22,	%l1
	tleu	%xcc,	0x6
	stbar
	ldsh	[%l7 + 0x2A],	%o5
	tge	%xcc,	0x6
	orn	%l5,	0x1A48,	%g6
	sll	%g3,	%i3,	%i5
	fzeros	%f6
	movle	%icc,	%o0,	%o6
	edge16ln	%g2,	%g7,	%o1
	fnegd	%f0,	%f14
	tpos	%icc,	0x3
	movre	%g5,	0x18D,	%l2
	fone	%f28
	xnor	%l4,	0x0B97,	%i4
	bne	%icc,	loop_540
	bcc,a,pn	%xcc,	loop_541
	fabss	%f1,	%f7
	fmul8x16	%f7,	%f18,	%f14
loop_540:
	nop
	set	0x08, %o3
	ldxa	[%l7 + %o3] 0x88,	%i6
loop_541:
	fbne	%fcc3,	loop_542
	fpsub16	%f4,	%f28,	%f26
	array32	%o2,	%i2,	%i7
	brnz,a	%l3,	loop_543
loop_542:
	movrlez	%g4,	%o4,	%l0
	movcc	%icc,	%o7,	%i1
	fpack16	%f12,	%f24
loop_543:
	tcc	%icc,	0x2
	edge16ln	%l6,	%i0,	%o3
	fnegs	%f29,	%f14
	udivx	%l1,	0x05CE,	%g1
	alignaddr	%l5,	%o5,	%g6
	fmuld8sux16	%f26,	%f10,	%f2
	movrlz	%i3,	%g3,	%i5
	movneg	%icc,	%o0,	%g2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tl	%icc,	0x1
	tneg	%xcc,	0x5
	bge,a,pn	%xcc,	loop_544
	fmovsl	%xcc,	%f1,	%f0
	pdist	%f30,	%f28,	%f10
	fandnot1	%f6,	%f10,	%f4
loop_544:
	tleu	%xcc,	0x3
	fornot2	%f12,	%f24,	%f14
	bleu,a,pt	%xcc,	loop_545
	fsrc2s	%f14,	%f6
	bneg	loop_546
	srlx	%o6,	%g7,	%o1
loop_545:
	popc	%l2,	%g5
	sir	0x1EEF
loop_546:
	umul	%l4,	0x19CC,	%i6
	mulx	%o2,	%i2,	%i7
	wr	%g0,	0x04,	%asi
	stxa	%l3,	[%l7 + 0x70] %asi
	subcc	%g4,	0x07C5,	%o4
	wr	%g0,	0x0c,	%asi
	ldswa	[%l7 + 0x64] %asi,	%i4
	tvc	%xcc,	0x5
	fbe,a	%fcc2,	loop_547
	movcc	%xcc,	%o7,	%l0
	fbne	%fcc2,	loop_548
	fmovsvs	%icc,	%f19,	%f20
loop_547:
	movrlez	%i1,	%l6,	%i0
	ta	%xcc,	0x1
loop_548:
	smul	%o3,	0x1F47,	%l1
	fxor	%f14,	%f4,	%f18
	fble,a	%fcc2,	loop_549
	fsrc2s	%f2,	%f27
	edge16l	%l5,	%o5,	%g6
	andcc	%i3,	%g1,	%i5
loop_549:
	mulscc	%o0,	0x080A,	%g3
	tpos	%icc,	0x1
	udivcc	%g2,	0x1327,	%o6
	sra	%o1,	0x01,	%g7
	edge8	%l2,	%g5,	%i6
	fone	%f0
	sethi	0x0856,	%l4
	fbue	%fcc1,	loop_550
	tvc	%icc,	0x5
	fcmpne16	%f8,	%f22,	%i2
	andn	%o2,	0x1C17,	%i7
loop_550:
	fxors	%f23,	%f21,	%f14
	fpmerge	%f13,	%f0,	%f28
	movrlez	%g4,	0x30E,	%o4
	bpos,pn	%xcc,	loop_551
	edge32l	%l3,	%i4,	%l0
	prefetch	[%l7 + 0x60],	 0x3
	fzeros	%f13
loop_551:
	edge8l	%i1,	%l6,	%o7
	wr	%g0,	0x80,	%asi
	prefetcha	[%l7 + 0x48] %asi,	 0x0
	popc	%l1,	%l5
	stbar
	popc	%o5,	%g6
	tge	%xcc,	0x2
	edge16l	%o3,	%g1,	%i5
	be,a,pt	%xcc,	loop_552
	movvs	%xcc,	%i3,	%o0
	set	0x50, %i4
	stxa	%g3,	[%l7 + %i4] 0x80
loop_552:
	fmovdneg	%icc,	%f25,	%f12
	tsubcctv	%g2,	0x0E8F,	%o1
	sra	%o6,	0x0C,	%g7
	fmovrsgz	%g5,	%f15,	%f5
	taddcctv	%i6,	%l2,	%l4
	fmovsneg	%icc,	%f13,	%f29
	sdivcc	%i2,	0x0C0C,	%i7
	fbe,a	%fcc1,	loop_553
	fbule,a	%fcc0,	loop_554
	flushw
	fcmpne32	%f30,	%f12,	%o2
loop_553:
	tg	%xcc,	0x4
loop_554:
	tn	%xcc,	0x0
	fblg	%fcc1,	loop_555
	tvc	%xcc,	0x4
	movrlz	%o4,	0x11E,	%l3
	edge8n	%g4,	%l0,	%i1
loop_555:
	movrlez	%i4,	0x164,	%l6
	brgz	%o7,	loop_556
	add	%i0,	0x18CF,	%l1
	stw	%o5,	[%l7 + 0x60]
	fbl	%fcc0,	loop_557
loop_556:
	array8	%g6,	%l5,	%o3
	membar	0x2A
	ble,pn	%icc,	loop_558
loop_557:
	fmovdl	%icc,	%f25,	%f4
	te	%xcc,	0x2
	sethi	0x1490,	%i5
loop_558:
	ble,a,pn	%icc,	loop_559
	fmovsle	%icc,	%f2,	%f12
	or	%g1,	%o0,	%i3
	fmovsa	%icc,	%f27,	%f28
loop_559:
	umulcc	%g2,	%o1,	%g3
	wr	%g0,	0x80,	%asi
	stwa	%g7,	[%l7 + 0x74] %asi
	tleu	%icc,	0x5
	tn	%icc,	0x7
	membar	0x16
	wr	%g0,	0x89,	%asi
	lduha	[%l7 + 0x2A] %asi,	%g5
	fnot1s	%f12,	%f21
	fmovs	%f9,	%f8
	movneg	%xcc,	%i6,	%o6
	andcc	%l2,	0x1463,	%i2
	popc	%l4,	%i7
	popc	%o2,	%l3
	addccc	%o4,	0x0C8A,	%g4
	fornot2s	%f22,	%f9,	%f30
	fzero	%f26
	fmovspos	%xcc,	%f0,	%f18
	fmovscc	%icc,	%f23,	%f24
	fmovdne	%xcc,	%f25,	%f15
	fxor	%f16,	%f2,	%f14
	fmovsl	%icc,	%f27,	%f13
	edge16l	%i1,	%i4,	%l0
	alignaddr	%l6,	%i0,	%o7
	fmovrde	%o5,	%f28,	%f22
	nop
	set	0x5E, %l1
	lduh	[%l7 + %l1],	%l1
	alignaddrl	%g6,	%l5,	%i5
	movleu	%icc,	%g1,	%o3
	wr	%g0,	0x19,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	fbul,a	%fcc1,	loop_560
	movrne	%i3,	0x33C,	%o0
	tne	%xcc,	0x1
	stx	%g2,	[%l7 + 0x08]
loop_560:
	mulx	%g3,	0x1ADD,	%g7
	bl,a,pt	%xcc,	loop_561
	ldstub	[%l7 + 0x18],	%o1
	fcmpgt32	%f28,	%f30,	%i6
	fbuge	%fcc0,	loop_562
loop_561:
	subc	%g5,	0x1B49,	%o6
	fmovsgu	%xcc,	%f28,	%f17
	xor	%i2,	0x1A84,	%l4
loop_562:
	udivx	%l2,	0x1392,	%o2
	addc	%l3,	%o4,	%i7
	set	0x60, %g6
	ldxa	[%l7 + %g6] 0x80,	%g4
	fpsub16s	%f24,	%f7,	%f21
	ta	%xcc,	0x3
	nop
	set	0x0C, %i2
	lduw	[%l7 + %i2],	%i1
	brlz	%l0,	loop_563
	addc	%l6,	0x1436,	%i0
	nop
	setx	loop_564,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fxor	%f30,	%f12,	%f4
loop_563:
	edge8	%i4,	%o5,	%l1
	tn	%xcc,	0x1
loop_564:
	sllx	%o7,	0x1E,	%g6
	sllx	%l5,	0x0F,	%g1
	srax	%o3,	0x16,	%i5
	bvc,pn	%icc,	loop_565
	bge	%xcc,	loop_566
	fxnors	%f13,	%f9,	%f5
	smulcc	%i3,	0x1B5C,	%o0
loop_565:
	fpsub16s	%f10,	%f16,	%f21
loop_566:
	fmovrdlez	%g3,	%f16,	%f30
	andn	%g7,	0x0541,	%o1
	movvs	%xcc,	%i6,	%g5
	edge16	%o6,	%i2,	%l4
	nop
	set	0x68, %g7
	lduw	[%l7 + %g7],	%l2
	fmuld8sux16	%f29,	%f10,	%f30
	move	%icc,	%g2,	%l3
	fpadd16s	%f18,	%f24,	%f15
	or	%o4,	0x0890,	%i7
	tneg	%icc,	0x4
	fmovdleu	%icc,	%f7,	%f26
	flushw
	add	%l7,	0x60,	%l6
	wr	%g0,	0x18,	%asi
	casa	[%l6] 0x18,	%o2,	%g4
	stbar
	srlx	%l0,	0x11,	%i1
	umul	%i0,	0x0B85,	%l6
	bn,a	%icc,	loop_567
	sir	0x1163
	movcc	%xcc,	%o5,	%i4
	orcc	%o7,	%l1,	%l5
loop_567:
	fpadd32	%f24,	%f8,	%f28
	subc	%g1,	%g6,	%i5
	srlx	%i3,	%o0,	%g3
	sdivx	%o3,	0x0EAA,	%o1
	fsrc1s	%f18,	%f23
	flushw
	edge16n	%g7,	%i6,	%g5
	faligndata	%f2,	%f22,	%f28
	movle	%xcc,	%i2,	%o6
	orcc	%l4,	0x16F7,	%g2
	nop
	setx	loop_568,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	subccc	%l2,	0x1727,	%l3
	fsrc2	%f0,	%f18
	taddcc	%i7,	0x13E6,	%o2
loop_568:
	tneg	%xcc,	0x1
	fmovrdlez	%o4,	%f18,	%f30
	ld	[%l7 + 0x08],	%f30
	movn	%icc,	%g4,	%l0
	fbge,a	%fcc0,	loop_569
	movneg	%xcc,	%i0,	%i1
	tg	%icc,	0x2
	ldd	[%l7 + 0x20],	%i6
loop_569:
	fble,a	%fcc1,	loop_570
	sllx	%i4,	0x13,	%o7
	fandnot1	%f0,	%f8,	%f16
	fbue,a	%fcc2,	loop_571
loop_570:
	addccc	%o5,	%l1,	%g1
	fbe	%fcc1,	loop_572
	movle	%xcc,	%g6,	%i5
loop_571:
	umul	%l5,	%o0,	%i3
	stw	%o3,	[%l7 + 0x50]
loop_572:
	fmovscs	%xcc,	%f31,	%f18
	addcc	%g3,	0x0668,	%g7
	fornot1	%f24,	%f22,	%f4
	movgu	%icc,	%o1,	%i6
	sub	%i2,	0x0788,	%o6
	smulcc	%g5,	%g2,	%l4
	edge32n	%l2,	%i7,	%o2
	movneg	%xcc,	%l3,	%o4
	ldsw	[%l7 + 0x0C],	%l0
	add	%i0,	0x17F4,	%i1
	sdiv	%l6,	0x1334,	%g4
	andcc	%i4,	%o5,	%o7
	smul	%g1,	%g6,	%i5
	xor	%l1,	%o0,	%i3
	movvs	%icc,	%o3,	%l5
	fcmpes	%fcc0,	%f26,	%f22
	move	%xcc,	%g3,	%g7
	ta	%icc,	0x4
	siam	0x7
	fbn	%fcc2,	loop_573
	srl	%o1,	0x16,	%i2
	movrne	%i6,	0x331,	%g5
	fba	%fcc2,	loop_574
loop_573:
	edge8n	%g2,	%l4,	%l2
	fmovdneg	%xcc,	%f25,	%f20
	smul	%i7,	0x07DC,	%o6
loop_574:
	nop
	setx loop_575, %l0, %l1
	jmpl %l1, %l3
	bn	%icc,	loop_576
	fpadd16	%f4,	%f14,	%f24
	sdiv	%o2,	0x0FE7,	%l0
loop_575:
	bne,a	%icc,	loop_577
loop_576:
	add	%o4,	%i1,	%i0
	fbge,a	%fcc2,	loop_578
	subcc	%g4,	0x0E0A,	%l6
loop_577:
	ld	[%l7 + 0x24],	%f10
	sllx	%o5,	0x10,	%o7
loop_578:
	movpos	%xcc,	%g1,	%g6
	movle	%xcc,	%i4,	%l1
	stw	%i5,	[%l7 + 0x78]
	fmovrde	%i3,	%f26,	%f6
	sdivcc	%o3,	0x042F,	%o0
	bne,pt	%xcc,	loop_579
	fbl,a	%fcc1,	loop_580
	orncc	%g3,	0x18D4,	%l5
	tsubcc	%g7,	0x1E1F,	%i2
loop_579:
	fands	%f9,	%f16,	%f6
loop_580:
	nop
	wr	%g0,	0x10,	%asi
	swapa	[%l7 + 0x54] %asi,	%o1
	tpos	%icc,	0x1
	be,a	loop_581
	ldd	[%l7 + 0x68],	%f24
	ldsw	[%l7 + 0x5C],	%i6
	fmovdvc	%xcc,	%f9,	%f14
loop_581:
	fmovdn	%xcc,	%f11,	%f7
	tge	%xcc,	0x5
	movrgez	%g2,	0x083,	%l4
	add	%g5,	%l2,	%i7
	fmovsa	%xcc,	%f5,	%f26
	brgez	%o6,	loop_582
	movleu	%icc,	%o2,	%l3
	sdivx	%o4,	0x1D29,	%l0
	tcc	%xcc,	0x1
loop_582:
	movle	%xcc,	%i0,	%i1
	ldub	[%l7 + 0x22],	%l6
	tl	%icc,	0x7
	subc	%g4,	0x0511,	%o5
	fnot1s	%f1,	%f19
	movleu	%icc,	%o7,	%g1
	fbul,a	%fcc3,	loop_583
	fmovdne	%xcc,	%f30,	%f7
	fpsub32s	%f30,	%f22,	%f31
	movcc	%icc,	%i4,	%g6
loop_583:
	bge,a,pt	%icc,	loop_584
	bneg,a	%icc,	loop_585
	movgu	%xcc,	%l1,	%i3
	fandnot1	%f26,	%f24,	%f6
loop_584:
	movg	%xcc,	%i5,	%o3
loop_585:
	stbar
	fnands	%f25,	%f18,	%f7
	fmovdvc	%xcc,	%f10,	%f20
	lduw	[%l7 + 0x20],	%g3
	fbg	%fcc3,	loop_586
	tne	%xcc,	0x7
	ldx	[%l7 + 0x10],	%o0
	addccc	%g7,	0x01C7,	%l5
loop_586:
	nop
	set	0x16, %l2
	ldstuba	[%l7 + %l2] 0x19,	%i2
	wr	%g0,	0x88,	%asi
	ldswa	[%l7 + 0x3C] %asi,	%i6
	subcc	%g2,	0x1A26,	%l4
	sir	0x0F2E
	te	%icc,	0x4
	tle	%icc,	0x3
	te	%icc,	0x6
	tne	%icc,	0x0
	xorcc	%o1,	0x1FC1,	%l2
	srax	%g5,	0x16,	%o6
	movneg	%icc,	%o2,	%i7
	brgz,a	%o4,	loop_587
	stb	%l0,	[%l7 + 0x1A]
	movrlez	%i0,	%l3,	%l6
	tle	%xcc,	0x6
loop_587:
	ldx	[%l7 + 0x30],	%i1
	mova	%icc,	%g4,	%o5
	and	%o7,	0x130C,	%i4
	wr	%g0,	0x80,	%asi
	lda	[%l7 + 0x60] %asi,	%f27
	fornot2s	%f16,	%f27,	%f31
	tvs	%icc,	0x4
	andcc	%g6,	0x1EE3,	%g1
	stx	%i3,	[%l7 + 0x30]
	fbg,a	%fcc2,	loop_588
	movn	%xcc,	%l1,	%i5
	orcc	%o3,	%g3,	%g7
	set	0x5C, %i1
	stwa	%o0,	[%l7 + %i1] 0x80
loop_588:
	tg	%xcc,	0x1
	tsubcctv	%l5,	0x1840,	%i6
	udiv	%i2,	0x19F5,	%g2
	umulcc	%l4,	0x186B,	%l2
	nop
	setx loop_589, %l0, %l1
	jmpl %l1, %g5
	ta	%xcc,	0x7
	movg	%xcc,	%o6,	%o2
	siam	0x4
loop_589:
	mova	%icc,	%o1,	%o4
	fand	%f18,	%f2,	%f6
	tcc	%icc,	0x7
	fmovspos	%xcc,	%f26,	%f29
	fbo,a	%fcc3,	loop_590
	call	loop_591
	sethi	0x1D2B,	%i7
	fpadd32	%f22,	%f0,	%f6
loop_590:
	add	%i0,	0x0059,	%l3
loop_591:
	xnorcc	%l0,	0x0CE0,	%l6
	alignaddr	%i1,	%g4,	%o7
	brnz,a	%i4,	loop_592
	sdivcc	%o5,	0x0666,	%g6
	fmovdcc	%xcc,	%f7,	%f14
	movge	%icc,	%g1,	%l1
loop_592:
	brz	%i3,	loop_593
	ld	[%l7 + 0x2C],	%f30
	movgu	%icc,	%o3,	%i5
	ld	[%l7 + 0x50],	%f19
loop_593:
	fmovde	%icc,	%f4,	%f12
	edge16ln	%g3,	%g7,	%o0
	edge8l	%i6,	%l5,	%i2
	fnors	%f0,	%f19,	%f15
	wr	%g0,	0x89,	%asi
	sta	%f1,	[%l7 + 0x10] %asi
	fbg,a	%fcc2,	loop_594
	fmovsg	%xcc,	%f26,	%f18
	fmovscc	%icc,	%f18,	%f13
	xnor	%g2,	0x1154,	%l4
loop_594:
	fcmpne16	%f2,	%f26,	%g5
	sir	0x1B94
	or	%l2,	%o2,	%o6
	fnegs	%f19,	%f17
	fpadd16s	%f29,	%f26,	%f22
	add	%l7,	0x14,	%l6
	wr	%g0,	0x10,	%asi
	lda	[%l6] %asi,	%o4
	casa	[%l6] %asi,	%o4,	%o1
	fmovrslez	%i7,	%f28,	%f17
	nop
	setx	loop_595,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	srl	%i0,	0x11,	%l0
	tl	%icc,	0x7
	movneg	%icc,	%l3,	%l6
loop_595:
	ta	%xcc,	0x0
	ta	%xcc,	0x1
	stb	%i1,	[%l7 + 0x2A]
	fmovrde	%o7,	%f10,	%f8
	bpos,a,pt	%icc,	loop_596
	for	%f20,	%f0,	%f22
	mulx	%g4,	0x0E5F,	%i4
	fmovrdgez	%o5,	%f8,	%f10
loop_596:
	tgu	%xcc,	0x5
	fble	%fcc0,	loop_597
	andncc	%g1,	%l1,	%g6
	brz	%o3,	loop_598
	nop
	setx loop_599, %l0, %l1
	jmpl %l1, %i5
loop_597:
	mulscc	%i3,	%g7,	%o0
	membar	0x38
loop_598:
	xor	%i6,	%l5,	%g3
loop_599:
	sdiv	%g2,	0x1C40,	%i2
	srl	%l4,	0x0B,	%l2
	edge8	%o2,	%o6,	%o4
	movvc	%xcc,	%g5,	%o1
	fbge,a	%fcc3,	loop_600
	fmovrde	%i7,	%f26,	%f28
	add	%l7,	0x18,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] %asi,	%l0,	%l3
loop_600:
	tneg	%icc,	0x7
	xorcc	%l6,	%i1,	%i0
	xnor	%g4,	%o7,	%i4
	sethi	0x00EB,	%g1
	andncc	%o5,	%l1,	%g6
	brgz,a	%o3,	loop_601
	movvc	%icc,	%i5,	%g7
	movre	%i3,	%o0,	%l5
	array16	%g3,	%g2,	%i2
loop_601:
	taddcctv	%l4,	0x1E4C,	%l2
	edge16n	%o2,	%i6,	%o6
	or	%o4,	0x1EB4,	%g5
	sra	%o1,	%l0,	%l3
	taddcctv	%l6,	%i1,	%i7
	tvs	%xcc,	0x0
	mulx	%g4,	%i0,	%o7
	st	%f7,	[%l7 + 0x24]
	movcc	%icc,	%g1,	%i4
	mulscc	%l1,	0x0073,	%o5
	set	0x50, %o6
	lda	[%l7 + %o6] 0x14,	%f24
	brlez,a	%g6,	loop_602
	movre	%i5,	0x137,	%g7
	sethi	0x0860,	%o3
	fmul8x16	%f12,	%f14,	%f30
loop_602:
	movcs	%icc,	%i3,	%o0
	sdiv	%l5,	0x0D4E,	%g2
	edge8n	%i2,	%g3,	%l2
	array16	%o2,	%i6,	%l4
	bneg,a	loop_603
	ld	[%l7 + 0x24],	%f30
	mova	%icc,	%o6,	%o4
	ta	%xcc,	0x7
loop_603:
	mulscc	%g5,	0x1A71,	%o1
	siam	0x5
	tpos	%icc,	0x0
	call	loop_604
	fcmple32	%f22,	%f8,	%l0
	set	0x2A, %l0
	stha	%l3,	[%l7 + %l0] 0x11
loop_604:
	bne,a,pn	%icc,	loop_605
	tl	%xcc,	0x4
	fmovsge	%xcc,	%f26,	%f4
	sir	0x145B
loop_605:
	nop
	set	0x38, %g2
	prefetcha	[%l7 + %g2] 0x1d,	 0x3
	tle	%xcc,	0x5
	popc	0x1C24,	%l6
	tpos	%xcc,	0x5
	call	loop_606
	fmovdgu	%xcc,	%f22,	%f16
	movge	%icc,	%i7,	%i0
	fmovsl	%icc,	%f15,	%f0
loop_606:
	movrgz	%g4,	0x183,	%g1
	fands	%f20,	%f22,	%f23
	ldsw	[%l7 + 0x68],	%o7
	andncc	%l1,	%i4,	%g6
	fzero	%f24
	taddcctv	%i5,	%g7,	%o3
	xor	%i3,	%o5,	%l5
	fbge,a	%fcc3,	loop_607
	tne	%icc,	0x7
	bpos,pn	%icc,	loop_608
	siam	0x3
loop_607:
	edge8n	%o0,	%g2,	%g3
	movvs	%xcc,	%i2,	%l2
loop_608:
	xorcc	%i6,	0x0A51,	%l4
	tvs	%xcc,	0x5
	sir	0x1817
	tg	%icc,	0x4
	tge	%icc,	0x7
	edge32	%o2,	%o6,	%g5
	edge8n	%o4,	%o1,	%l0
	movgu	%icc,	%l3,	%l6
	fcmpeq32	%f12,	%f18,	%i7
	sll	%i0,	%i1,	%g1
	fbne,a	%fcc0,	loop_609
	brlez,a	%o7,	loop_610
	movrgz	%l1,	%g4,	%g6
	tg	%icc,	0x4
loop_609:
	addc	%i5,	%g7,	%o3
loop_610:
	srax	%i4,	0x13,	%i3
	andncc	%o5,	%o0,	%l5
	movl	%xcc,	%g3,	%g2
	tn	%xcc,	0x6
	lduh	[%l7 + 0x1A],	%i2
	movg	%xcc,	%i6,	%l2
	bcs,a	loop_611
	fornot2s	%f22,	%f3,	%f24
	fone	%f18
	fmovrde	%l4,	%f22,	%f10
loop_611:
	fble,a	%fcc3,	loop_612
	and	%o2,	%o6,	%o4
	brnz,a	%g5,	loop_613
	te	%xcc,	0x6
loop_612:
	te	%xcc,	0x0
	prefetch	[%l7 + 0x20],	 0x0
loop_613:
	movle	%icc,	%o1,	%l0
	fmovscc	%icc,	%f9,	%f5
	fmovrslez	%l3,	%f19,	%f18
	fmovrdgez	%i7,	%f16,	%f24
	fcmpd	%fcc0,	%f20,	%f26
	umul	%l6,	0x1ED4,	%i1
	add	%i0,	0x1AC5,	%o7
	xor	%g1,	0x0042,	%g4
	std	%f28,	[%l7 + 0x18]
	add	%l1,	%i5,	%g7
	edge8n	%o3,	%i4,	%i3
	tpos	%icc,	0x1
	fmovdn	%xcc,	%f29,	%f7
	fbug	%fcc1,	loop_614
	sllx	%o5,	0x05,	%g6
	flushw
	stbar
loop_614:
	fmul8x16al	%f31,	%f29,	%f16
	mulx	%l5,	0x15E1,	%g3
	fmovsl	%xcc,	%f4,	%f11
	fmul8x16al	%f22,	%f1,	%f26
	fnor	%f18,	%f30,	%f30
	array16	%g2,	%i2,	%i6
	fabss	%f3,	%f14
	edge32l	%o0,	%l4,	%o2
	sllx	%o6,	0x06,	%o4
	movvs	%icc,	%g5,	%o1
	smulcc	%l0,	0x1BB3,	%l2
	xorcc	%i7,	0x01FB,	%l6
	sdivx	%l3,	0x052B,	%i0
	fmovda	%xcc,	%f21,	%f12
	fbge,a	%fcc3,	loop_615
	edge16l	%o7,	%i1,	%g4
	movneg	%xcc,	%l1,	%g1
	fcmpeq32	%f4,	%f24,	%g7
loop_615:
	addccc	%o3,	%i5,	%i3
	edge32l	%i4,	%o5,	%l5
	movleu	%icc,	%g6,	%g3
	xor	%g2,	%i2,	%i6
	tvs	%xcc,	0x6
	fcmpeq32	%f6,	%f30,	%o0
	fones	%f6
	movrlz	%o2,	0x352,	%l4
	fcmpne32	%f4,	%f20,	%o6
	sdiv	%o4,	0x04B2,	%o1
	edge16ln	%l0,	%g5,	%i7
	addccc	%l6,	0x0079,	%l2
	fmovsle	%xcc,	%f26,	%f2
	nop
	set	0x28, %l5
	ldsh	[%l7 + %l5],	%l3
	bvs,a	loop_616
	xor	%o7,	%i1,	%i0
	fnot2s	%f26,	%f21
	movrne	%l1,	%g4,	%g1
loop_616:
	movrne	%o3,	0x130,	%i5
	fblg	%fcc3,	loop_617
	smulcc	%i3,	%i4,	%g7
	addc	%l5,	%o5,	%g6
	movvs	%xcc,	%g2,	%g3
loop_617:
	bn,a,pn	%xcc,	loop_618
	orn	%i2,	%i6,	%o0
	smulcc	%o2,	0x0674,	%l4
	add	%o6,	0x17B5,	%o1
loop_618:
	fbn	%fcc1,	loop_619
	tpos	%xcc,	0x3
	popc	0x0397,	%o4
	alignaddrl	%g5,	%i7,	%l0
loop_619:
	tleu	%xcc,	0x3
	fnegs	%f28,	%f23
	fbuge,a	%fcc3,	loop_620
	fmovsn	%xcc,	%f10,	%f14
	xorcc	%l2,	0x1062,	%l6
	movg	%icc,	%l3,	%i1
loop_620:
	andncc	%o7,	%l1,	%g4
	fpack16	%f14,	%f27
	tg	%icc,	0x7
	brnz	%i0,	loop_621
	edge8	%o3,	%i5,	%i3
	fsrc1s	%f29,	%f15
	fbuge	%fcc1,	loop_622
loop_621:
	orn	%i4,	0x1F4F,	%g1
	umul	%l5,	0x15A6,	%g7
	sir	0x11EB
loop_622:
	sll	%o5,	%g6,	%g2
	edge8n	%g3,	%i6,	%i2
	srlx	%o0,	%l4,	%o2
	sethi	0x098C,	%o1
	tl	%xcc,	0x7
	brnz,a	%o6,	loop_623
	te	%xcc,	0x6
	movle	%xcc,	%o4,	%i7
	fbule,a	%fcc2,	loop_624
loop_623:
	fcmpes	%fcc0,	%f27,	%f31
	array32	%g5,	%l0,	%l6
	movl	%xcc,	%l2,	%i1
loop_624:
	fbg	%fcc3,	loop_625
	movcs	%xcc,	%l3,	%o7
	tle	%icc,	0x1
	edge8ln	%g4,	%i0,	%o3
loop_625:
	tleu	%icc,	0x6
	movle	%xcc,	%i5,	%l1
	wr	%g0,	0x81,	%asi
	ldsha	[%l7 + 0x3E] %asi,	%i3
	bvs,a,pt	%icc,	loop_626
	movrlz	%g1,	%l5,	%g7
	tcc	%icc,	0x7
	set	0x6E, %o4
	ldsha	[%l7 + %o4] 0x88,	%o5
loop_626:
	tneg	%xcc,	0x4
	wr	%g0,	0x18,	%asi
	stxa	%g6,	[%l7 + 0x68] %asi
	edge8n	%g2,	%i4,	%g3
	addccc	%i6,	0x1810,	%o0
	edge32	%i2,	%o2,	%l4
	edge8l	%o6,	%o4,	%o1
	nop
	set	0x60, %g3
	sth	%g5,	[%l7 + %g3]
	movrgz	%i7,	0x102,	%l0
	fpadd32	%f6,	%f18,	%f18
	tvs	%xcc,	0x7
	edge8	%l6,	%i1,	%l3
	fsrc2s	%f19,	%f25
	sllx	%l2,	%o7,	%g4
	ble,a,pn	%xcc,	loop_627
	srax	%i0,	0x15,	%o3
	addc	%i5,	0x16F8,	%i3
	edge8ln	%g1,	%l5,	%l1
loop_627:
	umulcc	%g7,	%o5,	%g6
	fornot2s	%f11,	%f7,	%f16
	tleu	%xcc,	0x1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbul	%fcc2,	loop_628
	nop
	setx	loop_629,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	for	%f4,	%f24,	%f14
	fmovrse	%g2,	%f22,	%f29
loop_628:
	edge32ln	%i4,	%i6,	%o0
loop_629:
	fsrc2	%f4,	%f16
	movg	%xcc,	%g3,	%o2
	fbn,a	%fcc3,	loop_630
	fmovrdgz	%i2,	%f18,	%f20
	fcmple32	%f0,	%f30,	%l4
	bcs,a	%icc,	loop_631
loop_630:
	fbu	%fcc2,	loop_632
	andn	%o4,	%o6,	%g5
	add	%l7,	0x6C,	%l6
	wr	%g0,	0x19,	%asi
	casa	[%l6] %asi,	%o1,	%i7
loop_631:
	mova	%icc,	%l0,	%i1
loop_632:
	alignaddrl	%l6,	%l2,	%l3
	fmovde	%xcc,	%f29,	%f2
	fands	%f13,	%f26,	%f4
	alignaddrl	%o7,	%g4,	%o3
	wr	%g0,	0x80,	%asi
	lda	[%l7 + 0x08] %asi,	%f5
	fmovrde	%i0,	%f4,	%f0
	fsrc2s	%f24,	%f1
	fbue,a	%fcc0,	loop_633
	movg	%xcc,	%i5,	%i3
	fbue	%fcc0,	loop_634
	flushw
loop_633:
	array8	%g1,	%l1,	%g7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_634:
	array8	%l5,	%o5,	%g6
	array8	%g2,	%i6,	%o0
	movvs	%icc,	%i4,	%o2
	edge8	%g3,	%i2,	%l4
	mulx	%o6,	0x1041,	%o4
	fmovdne	%icc,	%f18,	%f1
	fmovsn	%xcc,	%f20,	%f15
	fcmps	%fcc3,	%f5,	%f1
	movrgz	%o1,	0x3A2,	%i7
	fmovrse	%g5,	%f24,	%f3
	fnand	%f18,	%f10,	%f24
	set	0x20, %i6
	lduha	[%l7 + %i6] 0x88,	%i1
	fmovsg	%xcc,	%f19,	%f29
	tleu	%xcc,	0x3
	wr	%g0,	0x2c,	%asi
	ldda	[%l7 + 0x40] %asi,	%i6
	set	0x19, %o0
	lduba	[%l7 + %o0] 0x10,	%l0
	umul	%l3,	%l2,	%o7
	movre	%o3,	0x0EA,	%i0
	edge16	%i5,	%i3,	%g1
	xnorcc	%l1,	%g7,	%l5
	tl	%xcc,	0x0
	flushw
	tn	%xcc,	0x2
	add	%o5,	%g4,	%g2
	andncc	%g6,	%o0,	%i4
	popc	0x021F,	%i6
	orcc	%g3,	0x0155,	%i2
	set	0x0C, %o5
	ldswa	[%l7 + %o5] 0x1c,	%o2
	array8	%o6,	%o4,	%l4
	fsrc1s	%f2,	%f31
	brz,a	%i7,	loop_635
	fsrc1	%f6,	%f22
	sll	%g5,	0x17,	%o1
	siam	0x7
loop_635:
	fnegs	%f0,	%f8
	ta	%icc,	0x7
	tvs	%icc,	0x2
	edge16l	%l6,	%i1,	%l3
	addc	%l0,	%o7,	%l2
	add	%o3,	0x1B6B,	%i5
	call	loop_636
	fbo,a	%fcc0,	loop_637
	bneg,a,pt	%xcc,	loop_638
	array32	%i3,	%g1,	%i0
loop_636:
	sll	%g7,	%l5,	%l1
loop_637:
	mulx	%g4,	%o5,	%g2
loop_638:
	movn	%xcc,	%g6,	%i4
	srl	%i6,	0x0B,	%o0
	ldx	[%l7 + 0x18],	%i2
	fxors	%f17,	%f6,	%f18
	umul	%g3,	0x1EBA,	%o6
	bn,pt	%xcc,	loop_639
	bneg,a,pt	%icc,	loop_640
	tpos	%icc,	0x3
	orncc	%o2,	%o4,	%l4
loop_639:
	array16	%g5,	%o1,	%i7
loop_640:
	ldsh	[%l7 + 0x58],	%l6
	movcs	%icc,	%l3,	%i1
	orcc	%l0,	0x05F6,	%l2
	or	%o7,	%i5,	%o3
	fpsub16s	%f7,	%f29,	%f3
	xnorcc	%g1,	0x1946,	%i3
	movrne	%g7,	0x0E6,	%i0
	bshuffle	%f24,	%f14,	%f30
	fbule	%fcc2,	loop_641
	srlx	%l5,	0x13,	%l1
	ldsb	[%l7 + 0x38],	%g4
	movgu	%icc,	%g2,	%o5
loop_641:
	movvs	%xcc,	%g6,	%i6
	movvc	%xcc,	%o0,	%i2
	orncc	%i4,	0x0070,	%o6
	orcc	%o2,	%g3,	%l4
	stx	%g5,	[%l7 + 0x40]
	edge32	%o1,	%i7,	%o4
	sll	%l3,	0x06,	%i1
	bn	%icc,	loop_642
	movne	%xcc,	%l6,	%l0
	alignaddr	%l2,	%i5,	%o3
	wr	%g0,	0x0c,	%asi
	lduba	[%l7 + 0x74] %asi,	%o7
loop_642:
	sllx	%i3,	0x11,	%g1
	srlx	%i0,	%g7,	%l5
	ldstub	[%l7 + 0x50],	%l1
	smulcc	%g4,	0x074B,	%g2
	movn	%icc,	%g6,	%o5
	tleu	%xcc,	0x4
	sub	%o0,	0x1CBD,	%i2
	fmovsge	%xcc,	%f23,	%f19
	wr	%g0,	0x80,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	brnz,a	%i4,	loop_643
	movg	%icc,	%i6,	%o6
	fmuld8ulx16	%f2,	%f9,	%f2
	movge	%icc,	%g3,	%l4
loop_643:
	fnot1	%f26,	%f16
	umulcc	%g5,	0x1DC0,	%o1
	movleu	%icc,	%o2,	%i7
	edge32l	%l3,	%o4,	%i1
	srax	%l0,	%l6,	%i5
	array32	%o3,	%o7,	%l2
	stw	%i3,	[%l7 + 0x6C]
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x10, %i5
	prefetcha	[%l7 + %i5] 0x10,	 0x1
	fbug,a	%fcc0,	loop_644
	nop
	setx	loop_645,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movl	%xcc,	%g7,	%l5
	fmovsneg	%xcc,	%f30,	%f12
loop_644:
	movg	%xcc,	%g1,	%l1
loop_645:
	edge32	%g4,	%g6,	%o5
	movle	%icc,	%g2,	%o0
	andcc	%i4,	0x13D1,	%i6
	nop
	setx	loop_646,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movle	%icc,	%o6,	%i2
	edge16n	%g3,	%l4,	%g5
	sllx	%o2,	0x17,	%o1
loop_646:
	nop
	set	0x2C, %g1
	stwa	%l3,	[%l7 + %g1] 0x14
	fmovdleu	%xcc,	%f19,	%f4
	sll	%i7,	0x19,	%i1
	fmovdpos	%xcc,	%f20,	%f8
	fmovdcc	%icc,	%f1,	%f29
	wr	%g0,	0x81,	%asi
	ldsha	[%l7 + 0x50] %asi,	%o4
	srax	%l6,	%i5,	%l0
	set	0x28, %i0
	ldxa	[%l7 + %i0] 0x18,	%o7
	fmovdpos	%xcc,	%f6,	%f23
	udivx	%l2,	0x0423,	%i3
	fmovdle	%icc,	%f27,	%f15
	sdivcc	%i0,	0x1FFD,	%g7
	ta	%icc,	0x2
	fmovrslez	%l5,	%f2,	%f4
	stw	%o3,	[%l7 + 0x58]
	fmovsvc	%xcc,	%f10,	%f17
	fmovde	%xcc,	%f29,	%f24
	movge	%icc,	%l1,	%g1
	bn,a	%icc,	loop_647
	ble,a	%xcc,	loop_648
	alignaddr	%g4,	%g6,	%o5
	sll	%o0,	0x1C,	%i4
loop_647:
	brz,a	%i6,	loop_649
loop_648:
	fnot1	%f28,	%f22
	fnand	%f26,	%f0,	%f8
	fmovdcs	%icc,	%f31,	%f15
loop_649:
	fmuld8sux16	%f12,	%f23,	%f20
	call	loop_650
	sir	0x0691
	smul	%g2,	0x070A,	%i2
	array16	%g3,	%o6,	%l4
loop_650:
	fmovdneg	%xcc,	%f11,	%f14
	edge32n	%o2,	%o1,	%l3
	fornot2s	%f3,	%f20,	%f4
	tvc	%icc,	0x4
	fsrc2	%f0,	%f2
	flush	%l7 + 0x24
	fmovsle	%xcc,	%f4,	%f19
	smul	%g5,	0x1B4E,	%i1
	fmovdn	%icc,	%f25,	%f11
	ldsb	[%l7 + 0x1A],	%i7
	sdiv	%o4,	0x0B1E,	%l6
	ldx	[%l7 + 0x50],	%l0
	fmovsn	%xcc,	%f14,	%f28
	edge32ln	%i5,	%l2,	%i3
	orn	%i0,	%o7,	%g7
	tsubcc	%l5,	0x15D1,	%l1
	fcmpeq16	%f4,	%f4,	%g1
	fxnors	%f18,	%f23,	%f24
	fbge,a	%fcc2,	loop_651
	bneg	loop_652
	fsrc2s	%f2,	%f20
	srlx	%g4,	0x04,	%o3
loop_651:
	tcs	%xcc,	0x1
loop_652:
	movcc	%icc,	%o5,	%o0
	set	0x38, %g5
	stxa	%i4,	[%l7 + %g5] 0x19
	set	0x15, %l3
	lduba	[%l7 + %l3] 0x11,	%i6
	stbar
	fmovdle	%icc,	%f16,	%f9
	movrne	%g6,	0x308,	%g2
	fnegs	%f31,	%f27
	array16	%g3,	%o6,	%l4
	movge	%icc,	%i2,	%o1
	sethi	0x0A87,	%l3
	ta	%icc,	0x3
	brgez	%o2,	loop_653
	ldstub	[%l7 + 0x65],	%g5
	wr	%g0,	0x10,	%asi
	lduwa	[%l7 + 0x54] %asi,	%i7
loop_653:
	nop
	set	0x5C, %l4
	ldsha	[%l7 + %l4] 0x15,	%i1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mova	%icc,	%o4,	%l6
	edge16l	%i5,	%l0,	%l2
	srax	%i0,	0x16,	%o7
	addc	%i3,	%g7,	%l1
	lduw	[%l7 + 0x24],	%l5
	ba,a	loop_654
	tpos	%icc,	0x7
	add	%g1,	%o3,	%o5
	fsrc1s	%f18,	%f12
loop_654:
	edge16	%o0,	%g4,	%i6
	fmovrsgz	%i4,	%f28,	%f2
	tneg	%xcc,	0x1
	std	%f4,	[%l7 + 0x10]
	fbne,a	%fcc2,	loop_655
	alignaddr	%g2,	%g3,	%g6
	sdivcc	%l4,	0x0295,	%o6
	taddcctv	%i2,	0x0A55,	%o1
loop_655:
	fcmpeq32	%f28,	%f12,	%o2
	stb	%l3,	[%l7 + 0x47]
	wr	%g0,	0x04,	%asi
	ldxa	[%l7 + 0x78] %asi,	%i7
	fbl,a	%fcc1,	loop_656
	fmovse	%xcc,	%f1,	%f26
	bcc,a,pn	%xcc,	loop_657
	tsubcctv	%i1,	%o4,	%l6
loop_656:
	brgez,a	%i5,	loop_658
	andcc	%l0,	0x1791,	%g5
loop_657:
	array8	%i0,	%o7,	%i3
	subcc	%g7,	%l2,	%l1
loop_658:
	fcmpd	%fcc3,	%f0,	%f22
	movrgez	%g1,	%l5,	%o3
	edge8l	%o5,	%o0,	%g4
	bgu,a,pt	%xcc,	loop_659
	movre	%i4,	0x09E,	%i6
	be	loop_660
	addccc	%g2,	0x1EBD,	%g3
loop_659:
	fsrc2s	%f20,	%f0
	tsubcc	%l4,	%g6,	%o6
loop_660:
	fmovsvs	%xcc,	%f5,	%f5
	prefetch	[%l7 + 0x60],	 0x0
	orn	%o1,	%i2,	%l3
	edge16	%i7,	%i1,	%o2
	orncc	%l6,	%o4,	%i5
	edge16l	%l0,	%g5,	%i0
	smulcc	%o7,	0x0BA8,	%i3
	movrgz	%l2,	%g7,	%l1
	edge16l	%g1,	%o3,	%o5
	fmovde	%xcc,	%f30,	%f17
	set	0x68, %i7
	lduwa	[%l7 + %i7] 0x1c,	%l5
	flushw
	movge	%xcc,	%g4,	%i4
	wr	%g0,	0x89,	%asi
	ldsba	[%l7 + 0x32] %asi,	%o0
	prefetch	[%l7 + 0x28],	 0x2
	addcc	%i6,	0x0D05,	%g2
	edge32	%l4,	%g3,	%o6
	edge32n	%g6,	%o1,	%l3
	edge8n	%i7,	%i1,	%o2
	fcmpne32	%f18,	%f28,	%i2
	tle	%xcc,	0x1
	ldub	[%l7 + 0x4F],	%l6
	fmovrdlz	%i5,	%f26,	%f16
	movleu	%icc,	%o4,	%l0
	umulcc	%g5,	0x0746,	%i0
	ldd	[%l7 + 0x70],	%o6
	edge16n	%l2,	%i3,	%l1
	set	0x30, %l6
	swapa	[%l7 + %l6] 0x11,	%g1
	srlx	%o3,	%g7,	%o5
	mulx	%g4,	0x17FD,	%l5
	nop
	set	0x1A, %o7
	lduh	[%l7 + %o7],	%o0
	fzeros	%f29
	movrne	%i6,	%g2,	%l4
	call	loop_661
	ldd	[%l7 + 0x50],	%f0
	fbo	%fcc0,	loop_662
	fmovrslz	%i4,	%f19,	%f20
loop_661:
	bvs,pn	%xcc,	loop_663
	smulcc	%g3,	0x1045,	%o6
loop_662:
	fxors	%f30,	%f16,	%f21
	tvs	%xcc,	0x3
loop_663:
	tgu	%xcc,	0x0
	movpos	%icc,	%g6,	%l3
	nop
	set	0x66, %g4
	lduh	[%l7 + %g4],	%i7
	sdivcc	%i1,	0x1EDD,	%o1
	subcc	%o2,	%i2,	%l6
	for	%f22,	%f22,	%f30
	andncc	%o4,	%i5,	%g5
	edge16	%l0,	%o7,	%i0
	alignaddrl	%i3,	%l2,	%l1
	fnegs	%f7,	%f5
	fpackfix	%f18,	%f7
	orn	%g1,	0x080B,	%g7
	movcs	%xcc,	%o3,	%o5
	add	%l7,	0x10,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%l5
	casxa	[%l6] 0x80,	%l5,	%o0
	fmovsge	%xcc,	%f29,	%f31
	xnorcc	%g4,	0x138B,	%i6
	smulcc	%g2,	%i4,	%g3
	fsrc1	%f14,	%f14
	tne	%xcc,	0x2
	fmovsvs	%xcc,	%f13,	%f1
	fandnot2	%f26,	%f2,	%f2
	umulcc	%o6,	0x0417,	%g6
	edge32l	%l3,	%i7,	%i1
	andncc	%l4,	%o1,	%o2
	xnor	%l6,	%i2,	%o4
	edge32n	%g5,	%i5,	%o7
	sra	%i0,	%i3,	%l0
	fmovda	%xcc,	%f2,	%f13
	alignaddr	%l1,	%l2,	%g1
	fandnot2	%f2,	%f8,	%f12
	movrlz	%g7,	0x27B,	%o5
	fzero	%f0
	tcc	%icc,	0x1
	smulcc	%l5,	%o3,	%o0
	mulscc	%i6,	0x094E,	%g4
	taddcc	%i4,	0x0B82,	%g2
	tcc	%icc,	0x1
	orn	%o6,	%g3,	%g6
	brgez,a	%l3,	loop_664
	flush	%l7 + 0x40
	fbl	%fcc0,	loop_665
	brgz,a	%i7,	loop_666
loop_664:
	tvc	%icc,	0x3
	movrgz	%i1,	0x03C,	%l4
loop_665:
	edge8n	%o2,	%l6,	%i2
loop_666:
	srlx	%o1,	0x10,	%o4
	tcc	%icc,	0x4
	sdiv	%i5,	0x056C,	%o7
	edge8n	%i0,	%i3,	%l0
	srax	%l1,	0x0D,	%g5
	fmovsg	%xcc,	%f16,	%f29
	movre	%g1,	0x3D5,	%g7
	movneg	%icc,	%l2,	%o5
	tle	%xcc,	0x4
	sdivcc	%l5,	0x1FDF,	%o0
	wr	%g0,	0x80,	%asi
	stha	%i6,	[%l7 + 0x6C] %asi
	tn	%xcc,	0x3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x10,	%asi
	stha	%o3,	[%l7 + 0x48] %asi
	movrne	%i4,	%g2,	%g4
	call	loop_667
	or	%g3,	0x1F75,	%g6
	xnorcc	%o6,	%l3,	%i7
	xor	%l4,	0x1EEB,	%o2
loop_667:
	nop
	wr	%g0,	0x19,	%asi
	lda	[%l7 + 0x20] %asi,	%f30
	wr	%g0,	0x89,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	tcs	%xcc,	0x3
	smulcc	%l6,	%i1,	%i2
	udiv	%o1,	0x06E0,	%i5
	movleu	%icc,	%o7,	%o4
	fmovrslz	%i3,	%f13,	%f30
	tl	%icc,	0x5
	movrgz	%i0,	0x3B1,	%l0
	fmovsvs	%xcc,	%f1,	%f2
	movn	%icc,	%l1,	%g5
	array8	%g7,	%g1,	%o5
	fzero	%f10
	fbu	%fcc3,	loop_668
	fexpand	%f30,	%f2
	movne	%icc,	%l2,	%l5
	addc	%o0,	0x0B33,	%o3
loop_668:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	popc	%i4,	%g2
	array8	%g4,	%i6,	%g6
	membar	0x39
	fmovdleu	%xcc,	%f10,	%f9
	bge,a,pn	%icc,	loop_669
	tpos	%icc,	0x2
	lduh	[%l7 + 0x66],	%g3
	set	0x29, %i3
	stba	%o6,	[%l7 + %i3] 0x19
loop_669:
	tcs	%xcc,	0x5
	fmovdge	%xcc,	%f14,	%f29
	fmovdl	%xcc,	%f27,	%f18
	tle	%xcc,	0x2
	wr	%g0,	0x10,	%asi
	stxa	%i7,	[%l7 + 0x20] %asi
	array32	%l4,	%l3,	%l6
	andncc	%o2,	%i1,	%o1
	array32	%i2,	%o7,	%o4
	fmovrdlez	%i3,	%f4,	%f24
	ta	%xcc,	0x6
	sethi	0x09F4,	%i0
	edge8	%i5,	%l0,	%g5
	umul	%g7,	0x17FE,	%l1
	fbn	%fcc0,	loop_670
	subc	%g1,	%l2,	%o5
	fmovdneg	%xcc,	%f15,	%f25
	fbg,a	%fcc1,	loop_671
loop_670:
	edge32n	%l5,	%o3,	%i4
	edge32l	%o0,	%g4,	%i6
	array8	%g6,	%g2,	%o6
loop_671:
	tge	%xcc,	0x4
	ldx	[%l7 + 0x58],	%i7
	fpadd32	%f24,	%f28,	%f10
	wr	%g0,	0x81,	%asi
	stwa	%g3,	[%l7 + 0x54] %asi
	movne	%xcc,	%l4,	%l3
	ble,pn	%xcc,	loop_672
	brlez,a	%o2,	loop_673
	fzeros	%f14
	subcc	%l6,	%o1,	%i1
loop_672:
	tvc	%icc,	0x6
loop_673:
	fmovse	%xcc,	%f26,	%f19
	xor	%i2,	%o7,	%i3
	fxors	%f12,	%f16,	%f28
	smulcc	%i0,	0x1829,	%o4
	sra	%l0,	0x11,	%i5
	edge16l	%g5,	%l1,	%g1
	ba,pn	%icc,	loop_674
	fpadd16s	%f15,	%f16,	%f6
	st	%f18,	[%l7 + 0x54]
	tvc	%xcc,	0x0
loop_674:
	fornot1s	%f11,	%f15,	%f27
	fbn	%fcc2,	loop_675
	fbul,a	%fcc0,	loop_676
	tg	%icc,	0x2
	srl	%g7,	%l2,	%l5
loop_675:
	xor	%o3,	0x0CB9,	%i4
loop_676:
	or	%o5,	%g4,	%o0
	array16	%i6,	%g2,	%o6
	fble	%fcc2,	loop_677
	brlez,a	%g6,	loop_678
	fbn,a	%fcc0,	loop_679
	addc	%g3,	0x1796,	%i7
loop_677:
	xorcc	%l3,	%l4,	%o2
loop_678:
	subcc	%l6,	%i1,	%i2
loop_679:
	move	%icc,	%o1,	%i3
	bn,a,pt	%icc,	loop_680
	fmovrsgz	%o7,	%f22,	%f2
	wr	%g0,	0x19,	%asi
	ldswa	[%l7 + 0x5C] %asi,	%o4
loop_680:
	sub	%l0,	%i5,	%g5
	movl	%icc,	%i0,	%g1
	fzeros	%f6
	udivx	%g7,	0x0A73,	%l1
	alignaddrl	%l2,	%l5,	%o3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orncc	%i4,	%g4,	%o0
	addcc	%i6,	%g2,	%o6
	array8	%g6,	%o5,	%g3
	tl	%xcc,	0x2
	fcmpd	%fcc0,	%f14,	%f20
	orn	%l3,	0x0C11,	%l4
	set	0x40, %o1
	stda	%f0,	[%l7 + %o1] 0x19
	tne	%icc,	0x4
	movle	%xcc,	%i7,	%l6
	sdiv	%i1,	0x1740,	%o2
	fba,a	%fcc3,	loop_681
	tvs	%icc,	0x4
	mova	%icc,	%i2,	%i3
	andcc	%o1,	%o7,	%l0
loop_681:
	sdivcc	%o4,	0x06AD,	%g5
	tsubcctv	%i5,	%g1,	%i0
	udiv	%l1,	0x06D1,	%g7
	edge8l	%l5,	%l2,	%o3
	fmovde	%icc,	%f14,	%f24
	array16	%i4,	%g4,	%i6
	movcs	%xcc,	%o0,	%o6
	xnor	%g6,	0x13B1,	%o5
	sub	%g3,	0x00AE,	%g2
	smulcc	%l3,	0x11EF,	%l4
	fcmpne16	%f26,	%f2,	%l6
	tvc	%icc,	0x7
	wr	%g0,	0x89,	%asi
	sta	%f2,	[%l7 + 0x58] %asi
	movvs	%icc,	%i7,	%o2
	fpmerge	%f7,	%f23,	%f30
	movrgz	%i2,	%i1,	%i3
	ba,a	loop_682
	subc	%o1,	0x073B,	%o7
	ldd	[%l7 + 0x58],	%f20
	fcmpne32	%f18,	%f10,	%o4
loop_682:
	tsubcctv	%l0,	%g5,	%g1
	call	loop_683
	subccc	%i0,	0x09BA,	%l1
	srax	%g7,	%i5,	%l5
	fmul8x16al	%f31,	%f5,	%f14
loop_683:
	brgz,a	%o3,	loop_684
	fxnors	%f19,	%f12,	%f15
	tsubcc	%l2,	%i4,	%g4
	edge8n	%i6,	%o6,	%o0
loop_684:
	movne	%xcc,	%o5,	%g6
	sdivx	%g3,	0x08B8,	%l3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	move	%icc,	%l4,	%g2
	fba	%fcc3,	loop_685
	movcs	%xcc,	%i7,	%l6
	add	%i2,	0x1EF9,	%o2
	fmul8x16al	%f13,	%f19,	%f6
loop_685:
	stb	%i1,	[%l7 + 0x65]
	edge16l	%i3,	%o7,	%o4
	fmovsl	%icc,	%f7,	%f28
	addc	%l0,	%g5,	%g1
	movgu	%xcc,	%o1,	%i0
	array16	%g7,	%i5,	%l1
	movrne	%o3,	%l5,	%i4
	edge32ln	%g4,	%l2,	%o6
	movn	%xcc,	%i6,	%o0
	tcc	%xcc,	0x6
	movn	%icc,	%g6,	%g3
	andn	%l3,	0x0A5A,	%o5
	fornot1s	%f21,	%f21,	%f14
	fsrc2s	%f1,	%f8
	ldsb	[%l7 + 0x2A],	%l4
	fpsub16	%f12,	%f2,	%f18
	tcs	%icc,	0x3
	tvs	%icc,	0x6
	fpadd16	%f22,	%f22,	%f20
	tn	%xcc,	0x2
	brgz,a	%g2,	loop_686
	alignaddrl	%i7,	%l6,	%i2
	stb	%i1,	[%l7 + 0x25]
	ld	[%l7 + 0x20],	%f10
loop_686:
	array32	%o2,	%o7,	%o4
	movcs	%xcc,	%l0,	%i3
	movrlez	%g1,	%g5,	%i0
	fmul8ulx16	%f14,	%f18,	%f16
	fmovdn	%xcc,	%f1,	%f25
	sdivx	%o1,	0x033D,	%i5
	move	%icc,	%g7,	%o3
	movrlz	%l5,	%i4,	%l1
	nop
	setx	loop_687,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	alignaddr	%l2,	%o6,	%g4
	bge,pt	%xcc,	loop_688
	xnor	%o0,	0x148B,	%g6
loop_687:
	movleu	%xcc,	%i6,	%g3
	stb	%o5,	[%l7 + 0x2D]
loop_688:
	bleu	loop_689
	movcs	%icc,	%l3,	%l4
	movn	%xcc,	%i7,	%g2
	ta	%icc,	0x3
loop_689:
	bg,a,pn	%icc,	loop_690
	tvc	%icc,	0x4
	fbge,a	%fcc2,	loop_691
	fbe	%fcc0,	loop_692
loop_690:
	tneg	%xcc,	0x1
	fbu	%fcc3,	loop_693
loop_691:
	taddcc	%l6,	0x1C99,	%i2
loop_692:
	xnor	%o2,	0x0616,	%i1
	sir	0x06F0
loop_693:
	nop
	wr	%g0,	0x80,	%asi
	lduwa	[%l7 + 0x18] %asi,	%o4
	sth	%o7,	[%l7 + 0x7A]
	ldd	[%l7 + 0x08],	%i2
	edge16	%l0,	%g5,	%g1
	fmovdg	%xcc,	%f28,	%f8
	srlx	%o1,	%i0,	%g7
	xorcc	%o3,	0x1459,	%l5
	fcmpeq16	%f24,	%f0,	%i5
	orcc	%i4,	%l1,	%o6
	edge32ln	%l2,	%o0,	%g6
	movpos	%icc,	%i6,	%g3
	fmovs	%f14,	%f22
	be	%icc,	loop_694
	brgez,a	%o5,	loop_695
	movvs	%xcc,	%l3,	%l4
	fbuge,a	%fcc0,	loop_696
loop_694:
	andn	%g4,	0x060E,	%g2
loop_695:
	nop
	wr	%g0,	0x19,	%asi
	ldxa	[%l7 + 0x18] %asi,	%l6
loop_696:
	movge	%icc,	%i7,	%o2
	fnot2s	%f4,	%f0
	fbge	%fcc3,	loop_697
	sdivcc	%i1,	0x173F,	%i2
	orn	%o7,	0x12E8,	%i3
	fnot1	%f0,	%f26
loop_697:
	fsrc2	%f6,	%f14
	subccc	%o4,	%g5,	%l0
	andncc	%g1,	%i0,	%o1
	umulcc	%o3,	%l5,	%i5
	fpadd16s	%f19,	%f8,	%f3
	movrlz	%i4,	%g7,	%o6
	nop
	set	0x1D, %o2
	ldub	[%l7 + %o2],	%l2
	fpmerge	%f19,	%f31,	%f2
	nop
	setx	loop_698,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fblg,a	%fcc3,	loop_699
	tne	%icc,	0x7
	fmovrse	%o0,	%f7,	%f19
loop_698:
	andcc	%l1,	0x13F1,	%i6
loop_699:
	flush	%l7 + 0x6C
	fmul8ulx16	%f14,	%f16,	%f24
	be,a,pn	%xcc,	loop_700
	sdivx	%g3,	0x088A,	%g6
	orncc	%o5,	%l4,	%l3
	set	0x78, %i4
	stwa	%g2,	[%l7 + %i4] 0x14
loop_700:
	fmovsn	%icc,	%f16,	%f16
	sll	%l6,	0x13,	%g4
	sll	%o2,	%i7,	%i2
	popc	0x17CE,	%o7
	mulscc	%i1,	%i3,	%g5
	orncc	%l0,	%o4,	%i0
	movvs	%xcc,	%g1,	%o1
	sdivcc	%o3,	0x1AA0,	%l5
	ldd	[%l7 + 0x10],	%i4
	andncc	%i5,	%g7,	%o6
	movrlz	%o0,	0x099,	%l1
	fmovsl	%xcc,	%f22,	%f30
	wr	%g0,	0x10,	%asi
	stwa	%l2,	[%l7 + 0x50] %asi
	add	%g3,	0x037A,	%g6
	stbar
	fpack32	%f10,	%f6,	%f14
	sub	%i6,	0x1974,	%l4
	fmovdgu	%xcc,	%f17,	%f16
	smulcc	%l3,	%o5,	%g2
	fmovdpos	%xcc,	%f21,	%f5
	fcmple16	%f16,	%f18,	%l6
	fmul8ulx16	%f28,	%f12,	%f16
	fble,a	%fcc0,	loop_701
	ldsb	[%l7 + 0x45],	%o2
	membar	0x6B
	movre	%g4,	0x2B3,	%i7
loop_701:
	add	%i2,	0x0AE9,	%i1
	fxnor	%f6,	%f8,	%f16
	fpsub16s	%f0,	%f14,	%f24
	taddcctv	%i3,	%g5,	%l0
	nop
	setx loop_702, %l0, %l1
	jmpl %l1, %o4
	fornot2	%f4,	%f6,	%f26
	edge16	%o7,	%g1,	%o1
	movvc	%xcc,	%i0,	%o3
loop_702:
	orn	%i4,	%i5,	%l5
	smulcc	%o6,	0x16CF,	%o0
	sdivcc	%l1,	0x0E84,	%g7
	movrgez	%g3,	%l2,	%i6
	ldx	[%l7 + 0x68],	%g6
	orncc	%l4,	%l3,	%o5
	xnorcc	%l6,	0x17D5,	%g2
	st	%f23,	[%l7 + 0x38]
	fnot2	%f26,	%f12
	sir	0x0A87
	ta	%xcc,	0x6
	orcc	%o2,	0x0A18,	%i7
	nop
	setx	loop_703,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fbule,a	%fcc3,	loop_704
	edge32	%g4,	%i1,	%i2
	movcs	%xcc,	%i3,	%g5
loop_703:
	movl	%xcc,	%o4,	%o7
loop_704:
	fmovrdlez	%g1,	%f14,	%f14
	edge16l	%o1,	%i0,	%o3
	set	0x30, %o3
	stxa	%i4,	[%l7 + %o3] 0x0c
	addcc	%i5,	%l5,	%o6
	fsrc1	%f0,	%f0
	fcmpne32	%f0,	%f16,	%o0
	lduw	[%l7 + 0x4C],	%l0
	movge	%xcc,	%g7,	%l1
	edge16l	%l2,	%g3,	%i6
	srlx	%g6,	%l4,	%l3
	alignaddr	%l6,	%o5,	%g2
	wr	%g0,	0x0c,	%asi
	lda	[%l7 + 0x30] %asi,	%f2
	ldx	[%l7 + 0x08],	%o2
	smul	%i7,	0x0BDC,	%g4
	fpsub16s	%f25,	%f7,	%f3
	ba,a	loop_705
	flush	%l7 + 0x4C
	sllx	%i2,	%i3,	%g5
	taddcctv	%i1,	0x003C,	%o4
loop_705:
	brz,a	%o7,	loop_706
	fzeros	%f30
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srlx	%g1,	0x1D,	%i0
loop_706:
	sllx	%o3,	0x0D,	%i4
	sdiv	%i5,	0x08D3,	%l5
	popc	0x1876,	%o6
	nop
	setx	loop_707,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fbg	%fcc0,	loop_708
	swap	[%l7 + 0x5C],	%o1
	edge16	%o0,	%l0,	%g7
loop_707:
	ldd	[%l7 + 0x28],	%f16
loop_708:
	taddcctv	%l1,	%g3,	%l2
	fornot2	%f0,	%f18,	%f12
	wr	%g0,	0x89,	%asi
	prefetcha	[%l7 + 0x78] %asi,	 0x1
	mova	%xcc,	%g6,	%l4
	movn	%icc,	%l6,	%o5
	tcc	%xcc,	0x1
	edge16n	%g2,	%o2,	%l3
	movre	%g4,	0x3B1,	%i2
	bpos,a,pn	%icc,	loop_709
	edge32ln	%i3,	%g5,	%i1
	bleu	loop_710
	fcmpne32	%f8,	%f14,	%i7
loop_709:
	addcc	%o7,	0x125D,	%o4
	andcc	%g1,	0x01D7,	%o3
loop_710:
	st	%f9,	[%l7 + 0x28]
	add	%l7,	0x38,	%l6
	wr	%g0,	0x11,	%asi
	casxa	[%l6] 0x11,	%i4,	%i5
	mova	%icc,	%i0,	%l5
	lduw	[%l7 + 0x78],	%o1
	movg	%xcc,	%o6,	%l0
	std	%f10,	[%l7 + 0x08]
	movle	%icc,	%o0,	%g7
	fmovsle	%xcc,	%f26,	%f13
	fpmerge	%f22,	%f19,	%f0
	flushw
	set	0x2C, %g6
	swapa	[%l7 + %g6] 0x81,	%g3
	add	%l2,	0x10EA,	%i6
	sdiv	%g6,	0x0D5B,	%l4
	tsubcc	%l6,	%o5,	%g2
	fbo,a	%fcc3,	loop_711
	movneg	%xcc,	%l1,	%o2
	ta	%xcc,	0x7
	movle	%xcc,	%g4,	%i2
loop_711:
	xor	%l3,	0x0CE6,	%g5
	smul	%i1,	%i7,	%o7
	movg	%xcc,	%o4,	%i3
	move	%xcc,	%g1,	%o3
	edge8	%i5,	%i4,	%l5
	movg	%icc,	%o1,	%i0
	fsrc2	%f10,	%f6
	addcc	%l0,	0x05F3,	%o6
	xnorcc	%o0,	0x123D,	%g3
	fmovdleu	%icc,	%f16,	%f19
	taddcc	%g7,	%l2,	%g6
	wr	%g0,	0x88,	%asi
	ldswa	[%l7 + 0x34] %asi,	%l4
	fmovrsgz	%l6,	%f13,	%f10
	fmovrde	%i6,	%f22,	%f12
	fcmpd	%fcc1,	%f12,	%f24
	ba,a,pn	%xcc,	loop_712
	fmuld8ulx16	%f11,	%f4,	%f6
	tle	%xcc,	0x4
	andncc	%o5,	%l1,	%g2
loop_712:
	movge	%xcc,	%o2,	%i2
	fnot2s	%f4,	%f5
	tgu	%xcc,	0x5
	movvc	%xcc,	%g4,	%l3
	movg	%icc,	%g5,	%i1
	taddcctv	%o7,	0x0198,	%i7
	andcc	%o4,	0x05BF,	%i3
	bg,a	loop_713
	movvs	%xcc,	%g1,	%i5
	movl	%xcc,	%o3,	%l5
	xor	%o1,	0x0E23,	%i4
loop_713:
	orn	%i0,	0x07BC,	%o6
	sub	%l0,	0x17CE,	%o0
	sth	%g7,	[%l7 + 0x70]
	edge8l	%l2,	%g6,	%g3
	edge16ln	%l6,	%i6,	%l4
	movcs	%xcc,	%o5,	%g2
	movge	%xcc,	%l1,	%o2
	fpadd32	%f0,	%f2,	%f14
	edge8n	%g4,	%l3,	%g5
	ldsb	[%l7 + 0x4B],	%i1
	array32	%o7,	%i2,	%i7
	fmuld8sux16	%f8,	%f14,	%f2
	edge8	%o4,	%i3,	%g1
	fbg	%fcc3,	loop_714
	fmovrdgz	%i5,	%f8,	%f4
	bcs,pt	%xcc,	loop_715
	fpadd32	%f10,	%f30,	%f4
loop_714:
	sdiv	%o3,	0x051E,	%l5
	tvc	%xcc,	0x1
loop_715:
	sir	0x0716
	movrlez	%o1,	%i0,	%o6
	edge8n	%i4,	%o0,	%l0
	edge16ln	%g7,	%g6,	%g3
	brnz,a	%l6,	loop_716
	move	%icc,	%i6,	%l2
	movgu	%icc,	%l4,	%o5
	wr	%g0,	0x89,	%asi
	stwa	%g2,	[%l7 + 0x1C] %asi
loop_716:
	fzero	%f16
	movrlz	%o2,	%g4,	%l1
	sll	%g5,	%l3,	%o7
	xorcc	%i1,	0x001F,	%i2
	sethi	0x0EF9,	%o4
	bg,a,pt	%icc,	loop_717
	tsubcc	%i7,	%g1,	%i5
	fbuge	%fcc2,	loop_718
	taddcc	%i3,	0x1C01,	%l5
loop_717:
	fsrc1	%f2,	%f26
	fxnor	%f10,	%f8,	%f24
loop_718:
	srl	%o1,	%i0,	%o3
	xor	%i4,	%o6,	%l0
	tne	%icc,	0x4
	set	0x78, %l1
	ldsba	[%l7 + %l1] 0x19,	%o0
	sll	%g6,	0x1E,	%g7
	xor	%l6,	0x0C23,	%g3
	orn	%i6,	%l4,	%l2
	movrgz	%o5,	0x3C9,	%o2
	movl	%icc,	%g2,	%g4
	ble	%icc,	loop_719
	fmovsleu	%xcc,	%f23,	%f28
	taddcc	%l1,	0x01BA,	%l3
	fmovscc	%icc,	%f3,	%f26
loop_719:
	flushw
	add	%o7,	%g5,	%i2
	be,a	loop_720
	tsubcctv	%o4,	0x012D,	%i7
	udivx	%i1,	0x1916,	%g1
	srax	%i3,	%i5,	%l5
loop_720:
	xor	%i0,	0x1B81,	%o3
	fpsub16s	%f24,	%f4,	%f11
	fmovsvc	%xcc,	%f28,	%f28
	sdiv	%i4,	0x0884,	%o6
	edge16	%l0,	%o0,	%o1
	bl,pn	%xcc,	loop_721
	subcc	%g7,	0x0C0A,	%l6
	tle	%icc,	0x6
	udiv	%g6,	0x1DD2,	%i6
loop_721:
	tle	%icc,	0x5
	movrgz	%l4,	%l2,	%o5
	fpadd32	%f20,	%f4,	%f28
	brlz,a	%o2,	loop_722
	array16	%g2,	%g4,	%g3
	fmovdl	%icc,	%f13,	%f2
	add	%l7,	0x14,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] %asi,	%l1,	%l3
loop_722:
	move	%xcc,	%o7,	%g5
	orn	%i2,	0x0A1E,	%i7
	edge16ln	%i1,	%o4,	%i3
	tpos	%icc,	0x0
	bpos,a,pt	%icc,	loop_723
	fmovdvs	%xcc,	%f11,	%f17
	fbne,a	%fcc3,	loop_724
	nop
	setx	loop_725,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_723:
	movne	%icc,	%g1,	%i5
	brnz,a	%l5,	loop_726
loop_724:
	umul	%i0,	0x0F78,	%o3
loop_725:
	fmovdpos	%xcc,	%f30,	%f21
	bleu	loop_727
loop_726:
	sir	0x1475
	tsubcctv	%i4,	0x1AD7,	%l0
	and	%o6,	%o1,	%o0
loop_727:
	tn	%xcc,	0x6
	movcc	%xcc,	%g7,	%g6
	mova	%icc,	%l6,	%i6
	set	0x28, %g7
	stxa	%l2,	[%l7 + %g7] 0x89
	fmovsn	%icc,	%f2,	%f0
	mulscc	%l4,	0x0189,	%o2
	fabsd	%f18,	%f12
	ta	%icc,	0x4
	fandnot1s	%f3,	%f2,	%f26
	siam	0x5
	srax	%g2,	%g4,	%o5
	add	%g3,	%l3,	%l1
	be,a,pn	%xcc,	loop_728
	xnor	%o7,	0x0C79,	%i2
	movrlez	%g5,	%i7,	%i1
	movre	%o4,	0x039,	%g1
loop_728:
	edge32n	%i3,	%l5,	%i0
	array16	%o3,	%i5,	%i4
	edge16l	%l0,	%o6,	%o0
	tge	%icc,	0x6
	fpsub32s	%f10,	%f31,	%f15
	srax	%g7,	0x14,	%o1
	smul	%g6,	%l6,	%i6
	sdivcc	%l4,	0x1071,	%o2
	fcmpeq32	%f0,	%f30,	%l2
	swap	[%l7 + 0x78],	%g2
	movre	%g4,	%o5,	%l3
	orcc	%l1,	0x0287,	%o7
	ldsb	[%l7 + 0x5A],	%g3
	orn	%i2,	0x126F,	%i7
	sth	%g5,	[%l7 + 0x4C]
	bcs,a	loop_729
	fcmpne32	%f30,	%f0,	%o4
	ldx	[%l7 + 0x08],	%i1
	alignaddrl	%i3,	%l5,	%i0
loop_729:
	alignaddrl	%g1,	%o3,	%i5
	te	%icc,	0x1
	flushw
	set	0x31, %i2
	ldsba	[%l7 + %i2] 0x88,	%i4
	fmovdle	%xcc,	%f24,	%f0
	sir	0x1931
	tpos	%icc,	0x0
	sra	%o6,	0x17,	%l0
	fcmple16	%f28,	%f0,	%g7
	addcc	%o0,	0x1E7A,	%o1
	be	loop_730
	move	%xcc,	%g6,	%l6
	sdivcc	%i6,	0x0AB6,	%l4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_730:
	fmovdl	%icc,	%f20,	%f14
	tge	%xcc,	0x3
	ldsw	[%l7 + 0x78],	%o2
	fexpand	%f12,	%f4
	bl,pn	%icc,	loop_731
	ldsh	[%l7 + 0x12],	%l2
	tcc	%xcc,	0x4
	edge8	%g2,	%g4,	%l3
loop_731:
	alignaddr	%o5,	%l1,	%g3
	srax	%i2,	%i7,	%o7
	tl	%icc,	0x2
	tcs	%xcc,	0x2
	orcc	%o4,	%i1,	%g5
	sll	%i3,	0x1B,	%i0
	sir	0x180C
	edge32l	%l5,	%o3,	%i5
	movvs	%icc,	%g1,	%o6
	flush	%l7 + 0x74
	ldstub	[%l7 + 0x33],	%i4
	mulx	%g7,	%l0,	%o1
	fmul8x16al	%f19,	%f18,	%f4
	bn,pn	%icc,	loop_732
	subccc	%o0,	0x1D28,	%l6
	xnorcc	%g6,	%i6,	%o2
	array32	%l2,	%g2,	%l4
loop_732:
	nop
	set	0x1D, %l2
	ldstub	[%l7 + %l2],	%g4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdn	%icc,	%f16,	%f9
	subcc	%l3,	%l1,	%o5
	array16	%i2,	%g3,	%o7
	subc	%o4,	%i7,	%g5
	mova	%xcc,	%i3,	%i0
	fpack16	%f2,	%f12
	fxors	%f27,	%f3,	%f24
	fmovdgu	%icc,	%f30,	%f1
	subcc	%i1,	%o3,	%i5
	mova	%xcc,	%g1,	%l5
	set	0x40, %o6
	ldswa	[%l7 + %o6] 0x89,	%o6
	wr	%g0,	0x0c,	%asi
	sta	%f16,	[%l7 + 0x7C] %asi
	subccc	%g7,	%l0,	%i4
	andncc	%o0,	%l6,	%g6
	fmovrsne	%i6,	%f7,	%f0
	movg	%xcc,	%o1,	%o2
	edge8ln	%g2,	%l4,	%g4
	add	%l3,	%l1,	%l2
	add	%o5,	%g3,	%i2
	ldsw	[%l7 + 0x68],	%o7
	movrlez	%o4,	0x056,	%i7
	tvs	%xcc,	0x4
	array8	%i3,	%i0,	%g5
	alignaddr	%o3,	%i1,	%g1
	sub	%i5,	0x1464,	%o6
	fmovdvs	%xcc,	%f8,	%f24
	movrne	%l5,	%l0,	%g7
	movneg	%icc,	%o0,	%l6
	movcs	%xcc,	%g6,	%i4
	brgez,a	%i6,	loop_733
	bgu	loop_734
	andncc	%o1,	%o2,	%g2
	fones	%f30
loop_733:
	addcc	%g4,	0x138E,	%l4
loop_734:
	array8	%l3,	%l2,	%l1
	fmovrsgz	%g3,	%f2,	%f14
	fmul8ulx16	%f2,	%f26,	%f14
	sub	%i2,	%o7,	%o5
	nop
	setx	loop_735,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	tl	%xcc,	0x0
	bgu,a	%icc,	loop_736
	sth	%o4,	[%l7 + 0x2C]
loop_735:
	alignaddr	%i7,	%i0,	%g5
	wr	%g0,	0x89,	%asi
	ldstuba	[%l7 + 0x31] %asi,	%o3
loop_736:
	mulx	%i1,	%i3,	%i5
	andncc	%o6,	%l5,	%g1
	tleu	%xcc,	0x2
	sethi	0x1574,	%l0
	set	0x24, %l0
	lduwa	[%l7 + %l0] 0x1c,	%o0
	xor	%l6,	%g7,	%g6
	array32	%i4,	%o1,	%o2
	move	%xcc,	%g2,	%g4
	fcmpeq32	%f10,	%f22,	%l4
	array16	%i6,	%l3,	%l2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16	%l1,	%i2,	%o7
	set	0x43, %g2
	stba	%o5,	[%l7 + %g2] 0x19
	bshuffle	%f0,	%f24,	%f10
	fble,a	%fcc1,	loop_737
	array16	%g3,	%o4,	%i0
	fmovse	%icc,	%f8,	%f12
	flushw
loop_737:
	fones	%f3
	fandnot1	%f14,	%f14,	%f8
	movre	%i7,	%o3,	%i1
	tg	%xcc,	0x7
	sethi	0x0B1C,	%g5
	umul	%i5,	0x0D7A,	%i3
	addcc	%o6,	0x1F87,	%l5
	subc	%l0,	0x1797,	%g1
	brz,a	%o0,	loop_738
	tgu	%xcc,	0x5
	sub	%g7,	0x1FD6,	%l6
	fmovsg	%xcc,	%f23,	%f27
loop_738:
	andcc	%i4,	%g6,	%o2
	and	%g2,	%o1,	%l4
	ta	%xcc,	0x3
	tvs	%icc,	0x7
	xnor	%i6,	%g4,	%l2
	array8	%l1,	%l3,	%i2
	xorcc	%o5,	%g3,	%o7
	sethi	0x0233,	%o4
	wr	%g0,	0x10,	%asi
	ldsha	[%l7 + 0x32] %asi,	%i0
	edge32ln	%o3,	%i7,	%i1
	tgu	%xcc,	0x0
	wr	%g0,	0x89,	%asi
	lduba	[%l7 + 0x54] %asi,	%i5
	fmul8x16	%f9,	%f2,	%f6
	array8	%i3,	%o6,	%l5
	movrlez	%l0,	%g1,	%g5
	subcc	%g7,	%o0,	%l6
	set	0x40, %i1
	stda	%f0,	[%l7 + %i1] 0x04
	movne	%icc,	%i4,	%o2
	stb	%g6,	[%l7 + 0x77]
	edge32ln	%o1,	%l4,	%g2
	wr	%g0,	0x0c,	%asi
	ldxa	[%l7 + 0x60] %asi,	%g4
	orcc	%i6,	0x08CF,	%l2
	fpsub32	%f8,	%f12,	%f28
	fbne	%fcc0,	loop_739
	srl	%l1,	%l3,	%o5
	andn	%i2,	%o7,	%g3
	udiv	%i0,	0x19A1,	%o4
loop_739:
	tcs	%icc,	0x2
	orncc	%i7,	%o3,	%i1
	array32	%i5,	%i3,	%o6
	bneg,a,pt	%icc,	loop_740
	fnot1s	%f25,	%f10
	ldsw	[%l7 + 0x20],	%l5
	sub	%g1,	0x1BBC,	%l0
loop_740:
	nop
	set	0x08, %l5
	ldx	[%l7 + %l5],	%g7
	bcs,a	%icc,	loop_741
	flush	%l7 + 0x08
	fnand	%f10,	%f12,	%f4
	brgz	%g5,	loop_742
loop_741:
	orncc	%o0,	%l6,	%o2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fornot2	%f16,	%f14,	%f28
loop_742:
	bl	%xcc,	loop_743
	sdiv	%g6,	0x08D3,	%o1
	array8	%l4,	%g2,	%i4
	fornot2s	%f23,	%f22,	%f21
loop_743:
	movcc	%icc,	%g4,	%l2
	taddcc	%l1,	%i6,	%l3
	tcc	%icc,	0x5
	umulcc	%o5,	0x1D94,	%o7
	addccc	%i2,	0x0F0D,	%g3
	edge32ln	%i0,	%o4,	%i7
	mova	%xcc,	%i1,	%o3
	sdiv	%i5,	0x02E7,	%i3
	edge32n	%o6,	%l5,	%l0
	movgu	%xcc,	%g1,	%g7
	prefetch	[%l7 + 0x68],	 0x1
	wr	%g0,	0x88,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	fbge	%fcc2,	loop_744
	ldd	[%l7 + 0x28],	%f30
	edge16ln	%o0,	%l6,	%o2
	and	%g6,	0x16B4,	%o1
loop_744:
	taddcctv	%l4,	%g2,	%g5
	sra	%g4,	0x1F,	%i4
	edge16l	%l2,	%i6,	%l1
	fexpand	%f3,	%f8
	movrgz	%l3,	0x002,	%o7
	xor	%i2,	0x1A95,	%g3
	movcs	%xcc,	%i0,	%o5
	fbuge	%fcc1,	loop_745
	fbue,a	%fcc3,	loop_746
	movge	%icc,	%i7,	%i1
	tn	%xcc,	0x6
loop_745:
	nop
	set	0x15, %g3
	ldstub	[%l7 + %g3],	%o3
loop_746:
	ldd	[%l7 + 0x68],	%f6
	movne	%xcc,	%o4,	%i3
	movcs	%xcc,	%i5,	%o6
	tsubcctv	%l0,	%l5,	%g7
	fmuld8sux16	%f28,	%f4,	%f4
	edge16l	%o0,	%g1,	%l6
	udivcc	%o2,	0x0E16,	%g6
	fmovrdlez	%l4,	%f16,	%f26
	movneg	%icc,	%o1,	%g2
	addc	%g4,	0x17B8,	%i4
	movcc	%xcc,	%l2,	%g5
	fmovdn	%xcc,	%f22,	%f23
	taddcc	%i6,	0x1B12,	%l3
	edge16l	%o7,	%i2,	%g3
	mulscc	%i0,	%l1,	%o5
	nop
	setx	loop_747,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	ldx	[%l7 + 0x20],	%i7
	fmul8x16au	%f29,	%f6,	%f10
	edge16	%o3,	%i1,	%o4
loop_747:
	fpadd32s	%f6,	%f0,	%f9
	nop
	setx loop_748, %l0, %l1
	jmpl %l1, %i5
	fornot2s	%f0,	%f0,	%f30
	fmul8ulx16	%f2,	%f16,	%f12
	tge	%icc,	0x5
loop_748:
	bn,a,pn	%icc,	loop_749
	movcs	%xcc,	%i3,	%o6
	movcs	%xcc,	%l0,	%l5
	sir	0x048E
loop_749:
	move	%icc,	%o0,	%g1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sllx	%g7,	0x19,	%o2
	movvs	%xcc,	%l6,	%g6
	fbu,a	%fcc3,	loop_750
	addcc	%l4,	0x1BCA,	%o1
	addc	%g4,	0x09AA,	%g2
	brz,a	%l2,	loop_751
loop_750:
	edge32n	%g5,	%i4,	%l3
	orn	%i6,	%o7,	%i2
	xnor	%i0,	%l1,	%g3
loop_751:
	fbu	%fcc2,	loop_752
	smulcc	%i7,	0x1EB2,	%o3
	sir	0x07CF
	popc	0x06DF,	%i1
loop_752:
	fexpand	%f29,	%f10
	prefetch	[%l7 + 0x18],	 0x1
	taddcctv	%o5,	0x1F90,	%o4
	edge32ln	%i3,	%i5,	%l0
	fmovd	%f8,	%f10
	orn	%o6,	0x045C,	%l5
	nop
	setx	loop_753,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	sdivx	%g1,	0x1DBF,	%g7
	sethi	0x1E8F,	%o0
	fornot1	%f10,	%f16,	%f20
loop_753:
	fbule	%fcc1,	loop_754
	movrne	%o2,	0x366,	%l6
	ldd	[%l7 + 0x08],	%g6
	fmovrsgez	%o1,	%f20,	%f26
loop_754:
	te	%icc,	0x3
	movn	%icc,	%l4,	%g4
	wr	%g0,	0x2f,	%asi
	ldda	[%l7 + 0x70] %asi,	%g2
	edge8	%l2,	%g5,	%l3
	membar	0x64
	movrlez	%i4,	0x229,	%o7
	movg	%icc,	%i6,	%i2
	membar	0x1B
	brz	%i0,	loop_755
	siam	0x1
	sra	%g3,	0x01,	%i7
	fmul8ulx16	%f6,	%f10,	%f12
loop_755:
	ldstub	[%l7 + 0x13],	%o3
	fmul8x16al	%f28,	%f7,	%f28
	set	0x52, %o4
	stba	%i1,	[%l7 + %o4] 0x1d
	brz	%l1,	loop_756
	srl	%o5,	%o4,	%i5
	movrne	%i3,	0x247,	%l0
	for	%f20,	%f10,	%f26
loop_756:
	fbule,a	%fcc0,	loop_757
	fble	%fcc2,	loop_758
	fmovdneg	%xcc,	%f13,	%f22
	membar	0x28
loop_757:
	array16	%o6,	%g1,	%g7
loop_758:
	fmovdcc	%xcc,	%f23,	%f5
	tl	%xcc,	0x7
	stx	%o0,	[%l7 + 0x50]
	tn	%icc,	0x0
	brgez	%o2,	loop_759
	fbg	%fcc0,	loop_760
	brlz,a	%l5,	loop_761
	fmovrslz	%l6,	%f4,	%f21
loop_759:
	fand	%f20,	%f24,	%f18
loop_760:
	movcc	%xcc,	%g6,	%o1
loop_761:
	udiv	%l4,	0x15F0,	%g4
	mulscc	%l2,	%g2,	%l3
	fpadd16s	%f26,	%f8,	%f27
	edge32n	%g5,	%i4,	%o7
	taddcc	%i2,	%i6,	%g3
	wr	%g0,	0x19,	%asi
	lda	[%l7 + 0x38] %asi,	%f20
	fblg	%fcc3,	loop_762
	fmovrdgz	%i7,	%f28,	%f18
	udivcc	%o3,	0x0318,	%i0
	fcmpd	%fcc1,	%f14,	%f8
loop_762:
	edge16n	%l1,	%i1,	%o5
	andn	%i5,	0x1229,	%i3
	fmovrsgez	%o4,	%f0,	%f23
	mova	%xcc,	%l0,	%g1
	sir	0x059F
	tne	%icc,	0x2
	ld	[%l7 + 0x58],	%f18
	siam	0x0
	fones	%f1
	smul	%g7,	%o6,	%o2
	movrlz	%l5,	%o0,	%l6
	movrne	%o1,	%g6,	%g4
	fbge,a	%fcc2,	loop_763
	ldx	[%l7 + 0x10],	%l2
	srax	%l4,	0x16,	%l3
	fones	%f0
loop_763:
	edge32l	%g5,	%i4,	%g2
	mulscc	%i2,	%o7,	%g3
	movrlez	%i6,	0x262,	%o3
	orcc	%i0,	0x059A,	%i7
	tpos	%icc,	0x2
	srax	%l1,	0x1D,	%o5
	tsubcctv	%i5,	0x16DF,	%i3
	ble,a,pn	%icc,	loop_764
	stbar
	and	%o4,	%l0,	%g1
	mulscc	%i1,	0x048B,	%g7
loop_764:
	flushw
	fmul8ulx16	%f26,	%f26,	%f10
	andncc	%o6,	%o2,	%o0
	or	%l5,	%o1,	%g6
	flushw
	fcmpeq16	%f6,	%f30,	%l6
	tsubcctv	%l2,	%l4,	%l3
	taddcctv	%g4,	%g5,	%g2
	taddcc	%i2,	%i4,	%o7
	tne	%xcc,	0x3
	fcmpgt16	%f0,	%f28,	%g3
	brnz,a	%o3,	loop_765
	mova	%icc,	%i0,	%i7
	sll	%l1,	0x1A,	%o5
	fmovsgu	%xcc,	%f9,	%f3
loop_765:
	nop
	wr	%g0,	0x10,	%asi
	sta	%f12,	[%l7 + 0x58] %asi
	edge32ln	%i5,	%i3,	%o4
	sub	%i6,	%l0,	%g1
	fcmpeq32	%f10,	%f8,	%g7
	movneg	%icc,	%o6,	%i1
	be,a	loop_766
	sub	%o2,	0x00AF,	%o0
	tle	%xcc,	0x6
	bl,a,pt	%xcc,	loop_767
loop_766:
	fsrc2	%f30,	%f30
	srax	%o1,	0x11,	%g6
	std	%f6,	[%l7 + 0x18]
loop_767:
	ta	%icc,	0x3
	fmovdn	%icc,	%f25,	%f17
	movgu	%xcc,	%l5,	%l2
	taddcctv	%l4,	0x1BCE,	%l3
	xnorcc	%l6,	0x16E2,	%g5
	nop
	setx loop_768, %l0, %l1
	jmpl %l1, %g2
	movvs	%icc,	%i2,	%g4
	wr	%g0,	0x80,	%asi
	ldswa	[%l7 + 0x1C] %asi,	%i4
loop_768:
	srlx	%g3,	%o7,	%i0
	umul	%o3,	0x08BA,	%i7
	bvs,a,pt	%xcc,	loop_769
	fbu,a	%fcc3,	loop_770
	udiv	%o5,	0x120B,	%l1
	smulcc	%i5,	%i3,	%o4
loop_769:
	fbul	%fcc2,	loop_771
loop_770:
	fpsub32s	%f24,	%f5,	%f16
	fmuld8sux16	%f19,	%f13,	%f16
	fxnor	%f26,	%f14,	%f18
loop_771:
	andn	%i6,	%g1,	%l0
	alignaddr	%g7,	%o6,	%i1
	movvc	%icc,	%o0,	%o1
	ldd	[%l7 + 0x68],	%f6
	alignaddr	%o2,	%l5,	%g6
	wr	%g0,	0x10,	%asi
	ldswa	[%l7 + 0x38] %asi,	%l4
	edge8	%l3,	%l6,	%l2
	array8	%g5,	%i2,	%g4
	umul	%g2,	0x0DFC,	%i4
	set	0x74, %i6
	sta	%f23,	[%l7 + %i6] 0x80
	brgz,a	%o7,	loop_772
	fcmpgt16	%f0,	%f0,	%i0
	membar	0x79
	set	0x24, %o0
	ldsha	[%l7 + %o0] 0x1c,	%o3
loop_772:
	orncc	%g3,	0x00A5,	%i7
	fbo,a	%fcc1,	loop_773
	taddcc	%o5,	0x19FB,	%i5
	umul	%i3,	0x17F1,	%l1
	bcs	loop_774
loop_773:
	fnot2s	%f9,	%f17
	add	%i6,	0x0338,	%g1
	xorcc	%o4,	%l0,	%g7
loop_774:
	fbue,a	%fcc2,	loop_775
	prefetch	[%l7 + 0x38],	 0x3
	edge32ln	%i1,	%o0,	%o6
	sdiv	%o2,	0x0F9D,	%l5
loop_775:
	movvc	%xcc,	%o1,	%g6
	popc	0x1058,	%l3
	fsrc1	%f28,	%f10
	for	%f12,	%f6,	%f24
	mulx	%l4,	0x0D2B,	%l6
	fmuld8sux16	%f10,	%f18,	%f14
	sll	%l2,	%i2,	%g5
	fandnot2	%f30,	%f8,	%f16
	alignaddr	%g2,	%g4,	%o7
	brlz	%i0,	loop_776
	fmovsa	%xcc,	%f1,	%f3
	add	%l7,	0x60,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%o3
	casa	[%l6] %asi,	%o3,	%g3
loop_776:
	ba,pt	%icc,	loop_777
	fmovsleu	%icc,	%f3,	%f24
	fmovdge	%xcc,	%f13,	%f5
	addcc	%i4,	0x1CC0,	%i7
loop_777:
	udivx	%i5,	0x1E5F,	%i3
	fmul8x16	%f13,	%f8,	%f20
	movrne	%l1,	%o5,	%i6
	fmovdle	%icc,	%f20,	%f14
	movle	%xcc,	%g1,	%l0
	nop
	set	0x23, %i5
	stb	%g7,	[%l7 + %i5]
	mulscc	%o4,	0x0E95,	%o0
	addc	%i1,	0x0967,	%o6
	wr	%g0,	0x18,	%asi
	lduwa	[%l7 + 0x18] %asi,	%o2
	andn	%o1,	0x0C69,	%l5
	faligndata	%f26,	%f22,	%f6
	sdiv	%g6,	0x0A74,	%l4
	movg	%icc,	%l6,	%l2
	movne	%xcc,	%l3,	%g5
	srl	%g2,	0x1E,	%g4
	edge8l	%i2,	%i0,	%o7
	siam	0x6
	orn	%g3,	%i4,	%o3
	and	%i7,	%i3,	%l1
	fornot2s	%f27,	%f11,	%f25
	set	0x40, %g1
	ldxa	[%l7 + %g1] 0x81,	%o5
	ldub	[%l7 + 0x31],	%i6
	movne	%icc,	%g1,	%i5
	fbl,a	%fcc3,	loop_778
	tn	%xcc,	0x4
	fmuld8ulx16	%f10,	%f1,	%f14
	orcc	%l0,	0x0128,	%o4
loop_778:
	subccc	%o0,	0x170A,	%g7
	movpos	%icc,	%i1,	%o6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddr	%o2,	%l5,	%o1
	subcc	%g6,	0x1D74,	%l4
	alignaddrl	%l2,	%l3,	%l6
	tvc	%xcc,	0x0
	membar	0x7B
	bg,a,pt	%xcc,	loop_779
	fsrc1	%f12,	%f6
	fpmerge	%f31,	%f4,	%f16
	brlz	%g5,	loop_780
loop_779:
	stb	%g2,	[%l7 + 0x1E]
	edge16	%i2,	%g4,	%i0
	movpos	%icc,	%g3,	%i4
loop_780:
	fmul8ulx16	%f20,	%f20,	%f6
	srl	%o3,	0x0A,	%i7
	fnor	%f18,	%f2,	%f10
	fmul8x16	%f23,	%f14,	%f24
	alignaddrl	%o7,	%i3,	%l1
	fsrc1	%f24,	%f8
	swap	[%l7 + 0x5C],	%o5
	addccc	%g1,	0x0991,	%i5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x16, %o5
	ldsha	[%l7 + %o5] 0x0c,	%l0
	orcc	%i6,	%o4,	%g7
	tsubcc	%i1,	%o0,	%o2
	std	%f18,	[%l7 + 0x58]
	movrlez	%l5,	0x1CD,	%o1
	edge32l	%o6,	%l4,	%g6
	fcmped	%fcc3,	%f24,	%f8
	alignaddrl	%l3,	%l2,	%l6
	movcs	%xcc,	%g5,	%g2
	movne	%xcc,	%i2,	%i0
	ldd	[%l7 + 0x18],	%f18
	movleu	%xcc,	%g4,	%g3
	xorcc	%o3,	0x0906,	%i7
	tcc	%icc,	0x2
	bge,a,pn	%xcc,	loop_781
	fexpand	%f6,	%f4
	fpadd16s	%f4,	%f12,	%f0
	fmovsg	%icc,	%f22,	%f7
loop_781:
	nop
	wr	%g0,	0x88,	%asi
	stxa	%o7,	[%l7 + 0x38] %asi
	movg	%icc,	%i3,	%l1
	bleu,a,pt	%xcc,	loop_782
	andncc	%o5,	%i4,	%g1
	pdist	%f8,	%f22,	%f22
	edge32n	%l0,	%i6,	%o4
loop_782:
	fmovdcs	%xcc,	%f2,	%f21
	subc	%g7,	%i5,	%i1
	sdiv	%o2,	0x1870,	%o0
	nop
	set	0x3A, %i0
	sth	%l5,	[%l7 + %i0]
	movneg	%xcc,	%o1,	%o6
	flushw
	tleu	%icc,	0x0
	stb	%g6,	[%l7 + 0x1C]
	tpos	%xcc,	0x3
	edge16ln	%l4,	%l3,	%l2
	fxors	%f15,	%f8,	%f21
	fzero	%f18
	nop
	set	0x12, %l3
	ldsb	[%l7 + %l3],	%g5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udivx	%l6,	0x0DCF,	%g2
	movgu	%xcc,	%i0,	%g4
	set	0x68, %l4
	ldsha	[%l7 + %l4] 0x1d,	%i2
	srl	%g3,	0x15,	%o3
	edge8l	%o7,	%i7,	%l1
	movg	%xcc,	%i3,	%o5
	fmovrdlez	%i4,	%f30,	%f18
	nop
	setx	loop_783,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	andncc	%g1,	%i6,	%o4
	fbue,a	%fcc0,	loop_784
	fbge	%fcc1,	loop_785
loop_783:
	bneg,a	loop_786
	array32	%l0,	%g7,	%i5
loop_784:
	fmovse	%icc,	%f31,	%f1
loop_785:
	stbar
loop_786:
	movleu	%xcc,	%i1,	%o0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sll	%o2,	0x02,	%o1
	sll	%o6,	%l5,	%l4
	fmovdg	%xcc,	%f10,	%f30
	fcmpgt16	%f2,	%f20,	%l3
	xnorcc	%l2,	%g6,	%g5
	xor	%l6,	0x1E99,	%g2
	ldsw	[%l7 + 0x64],	%g4
	fmovdg	%xcc,	%f21,	%f27
	fmovdvs	%xcc,	%f2,	%f14
	fmovscc	%xcc,	%f0,	%f7
	tgu	%icc,	0x2
	fone	%f28
	alignaddrl	%i2,	%g3,	%i0
	ldstub	[%l7 + 0x51],	%o7
	set	0x78, %i7
	ldsba	[%l7 + %i7] 0x10,	%o3
	wr	%g0,	0x80,	%asi
	stba	%l1,	[%l7 + 0x6E] %asi
	taddcctv	%i3,	%o5,	%i4
	udivcc	%g1,	0x0A75,	%i6
	orcc	%o4,	%i7,	%g7
	movrlez	%i5,	0x1F6,	%l0
	fba	%fcc2,	loop_787
	orncc	%o0,	%o2,	%i1
	addccc	%o6,	0x1C16,	%l5
	lduh	[%l7 + 0x6E],	%o1
loop_787:
	udivcc	%l4,	0x01D1,	%l2
	taddcctv	%l3,	0x1C34,	%g5
	sethi	0x16A4,	%l6
	alignaddr	%g2,	%g4,	%g6
	set	0x50, %g5
	ldda	[%l7 + %g5] 0x27,	%i2
	orcc	%i0,	%o7,	%o3
	fpadd32	%f2,	%f8,	%f18
	bleu,a	loop_788
	udiv	%l1,	0x02C9,	%g3
	srl	%i3,	0x12,	%o5
	call	loop_789
loop_788:
	membar	0x11
	fmovdvc	%xcc,	%f22,	%f25
	fmovdg	%icc,	%f1,	%f29
loop_789:
	edge8	%g1,	%i6,	%i4
	fmovde	%icc,	%f25,	%f26
	brz,a	%i7,	loop_790
	tleu	%icc,	0x5
	bcs,a,pn	%xcc,	loop_791
	movrne	%o4,	0x34B,	%i5
loop_790:
	popc	0x1B5F,	%l0
	fmul8sux16	%f2,	%f20,	%f20
loop_791:
	sll	%g7,	0x08,	%o2
	edge32ln	%o0,	%o6,	%l5
	array32	%i1,	%l4,	%l2
	sethi	0x07E7,	%l3
	move	%xcc,	%o1,	%g5
	brgz	%g2,	loop_792
	flush	%l7 + 0x44
	tn	%xcc,	0x4
	set	0x2D, %o7
	ldstuba	[%l7 + %o7] 0x80,	%l6
loop_792:
	tg	%xcc,	0x6
	smulcc	%g6,	%i2,	%g4
	fnot1s	%f16,	%f5
	movle	%icc,	%i0,	%o7
	movn	%icc,	%l1,	%o3
	tvs	%icc,	0x0
	array32	%i3,	%o5,	%g3
	sub	%g1,	0x0E6E,	%i4
	sra	%i6,	%o4,	%i7
	fbule	%fcc2,	loop_793
	sethi	0x1F36,	%i5
	movvs	%icc,	%l0,	%o2
	stb	%o0,	[%l7 + 0x74]
loop_793:
	fmovsl	%xcc,	%f12,	%f17
	be,pn	%xcc,	loop_794
	tle	%icc,	0x7
	ta	%xcc,	0x3
	fmul8sux16	%f20,	%f2,	%f30
loop_794:
	movgu	%xcc,	%o6,	%l5
	fpsub16s	%f4,	%f19,	%f7
	smul	%i1,	%g7,	%l4
	movvs	%icc,	%l2,	%l3
	popc	%o1,	%g2
	movrgez	%l6,	%g5,	%g6
	movne	%xcc,	%i2,	%i0
	tl	%icc,	0x7
	move	%icc,	%o7,	%g4
	and	%o3,	%i3,	%o5
	sth	%l1,	[%l7 + 0x40]
	move	%icc,	%g1,	%i4
	movn	%xcc,	%i6,	%g3
	edge8	%i7,	%i5,	%l0
	set	0x6B, %g4
	ldstuba	[%l7 + %g4] 0x80,	%o4
	std	%f8,	[%l7 + 0x10]
	fbo	%fcc1,	loop_795
	fmovdg	%icc,	%f21,	%f13
	tgu	%xcc,	0x1
	bneg,pn	%icc,	loop_796
loop_795:
	bshuffle	%f10,	%f8,	%f16
	fbul,a	%fcc2,	loop_797
	fcmpeq32	%f0,	%f18,	%o0
loop_796:
	xnor	%o2,	%o6,	%i1
	fbul	%fcc3,	loop_798
loop_797:
	tsubcctv	%l5,	0x1B42,	%g7
	movre	%l2,	%l3,	%l4
	smulcc	%g2,	%o1,	%g5
loop_798:
	stbar
	srax	%g6,	0x05,	%l6
	movleu	%icc,	%i0,	%o7
	srl	%g4,	0x14,	%o3
	fmovsvc	%xcc,	%f8,	%f27
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbge	%fcc1,	loop_799
	bg,a,pt	%xcc,	loop_800
	edge16	%i3,	%i2,	%l1
	bg,a	loop_801
loop_799:
	movre	%o5,	0x2AA,	%g1
loop_800:
	swap	[%l7 + 0x50],	%i6
	tvs	%icc,	0x7
loop_801:
	alignaddrl	%g3,	%i4,	%i5
	fnot2	%f18,	%f28
	be	%xcc,	loop_802
	bvc	loop_803
	tn	%icc,	0x5
	movleu	%icc,	%i7,	%o4
loop_802:
	swap	[%l7 + 0x78],	%o0
loop_803:
	fmovsvs	%icc,	%f7,	%f2
	for	%f30,	%f22,	%f28
	movg	%xcc,	%l0,	%o6
	movrlez	%i1,	%l5,	%g7
	wr	%g0,	0x81,	%asi
	stha	%o2,	[%l7 + 0x74] %asi
	ld	[%l7 + 0x50],	%f31
	fmovsvs	%icc,	%f16,	%f8
	movpos	%xcc,	%l2,	%l3
	tge	%xcc,	0x5
	taddcc	%g2,	%l4,	%g5
	movrgz	%g6,	%l6,	%i0
	fbule	%fcc0,	loop_804
	movrgz	%o1,	%o7,	%o3
	fmuld8ulx16	%f0,	%f17,	%f26
	nop
	setx loop_805, %l0, %l1
	jmpl %l1, %i3
loop_804:
	bne,a,pt	%icc,	loop_806
	fmul8x16	%f8,	%f20,	%f12
	edge8n	%g4,	%i2,	%l1
loop_805:
	fmovdge	%icc,	%f16,	%f16
loop_806:
	fmovdgu	%xcc,	%f4,	%f19
	sll	%g1,	%o5,	%g3
	addcc	%i4,	%i6,	%i7
	fmovscc	%xcc,	%f21,	%f5
	taddcctv	%i5,	%o4,	%l0
	edge16l	%o0,	%o6,	%l5
	and	%g7,	%o2,	%l2
	movrlez	%l3,	0x35C,	%g2
	set	0x2E, %i3
	stba	%l4,	[%l7 + %i3] 0x89
	fpack16	%f0,	%f22
	fmovrdgez	%g5,	%f8,	%f0
	fcmpes	%fcc0,	%f12,	%f18
	nop
	setx	loop_807,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movl	%icc,	%i1,	%g6
	movrgez	%i0,	%o1,	%l6
	nop
	set	0x20, %l6
	prefetch	[%l7 + %l6],	 0x1
loop_807:
	fcmple32	%f4,	%f8,	%o3
	fbne	%fcc3,	loop_808
	bneg,a	%xcc,	loop_809
	subccc	%i3,	%g4,	%i2
	fxnor	%f30,	%f18,	%f6
loop_808:
	sethi	0x030A,	%o7
loop_809:
	fabsd	%f2,	%f28
	tg	%icc,	0x6
	brlez,a	%g1,	loop_810
	tsubcc	%o5,	%g3,	%l1
	movgu	%xcc,	%i4,	%i7
	membar	0x18
loop_810:
	edge16ln	%i6,	%i5,	%l0
	movvc	%xcc,	%o4,	%o0
	array16	%o6,	%g7,	%o2
	orncc	%l2,	0x198C,	%l5
	udivcc	%g2,	0x0257,	%l3
	movvc	%xcc,	%g5,	%i1
	edge8ln	%g6,	%l4,	%o1
	brgz,a	%l6,	loop_811
	bge,a	%xcc,	loop_812
	bn,a,pn	%xcc,	loop_813
	bleu	loop_814
loop_811:
	sll	%i0,	%o3,	%g4
loop_812:
	movrlez	%i3,	%o7,	%g1
loop_813:
	addcc	%i2,	0x1142,	%o5
loop_814:
	orn	%g3,	0x1D3C,	%l1
	umulcc	%i7,	0x17C5,	%i6
	edge16l	%i4,	%i5,	%o4
	fors	%f17,	%f12,	%f22
	umulcc	%l0,	%o0,	%o6
	std	%f24,	[%l7 + 0x40]
	fnand	%f4,	%f6,	%f10
	fbul	%fcc0,	loop_815
	udivcc	%o2,	0x0473,	%g7
	fmovsg	%icc,	%f24,	%f12
	addc	%l5,	%l2,	%g2
loop_815:
	brlez	%l3,	loop_816
	andcc	%i1,	%g6,	%g5
	set	0x46, %o2
	lduha	[%l7 + %o2] 0x89,	%l4
loop_816:
	brlz,a	%l6,	loop_817
	tleu	%xcc,	0x1
	tneg	%xcc,	0x4
	subccc	%o1,	0x106F,	%i0
loop_817:
	brnz,a	%o3,	loop_818
	edge8ln	%i3,	%g4,	%o7
	andcc	%i2,	0x0CFC,	%o5
	fmovrdlz	%g3,	%f12,	%f30
loop_818:
	tneg	%xcc,	0x4
	xnor	%g1,	%i7,	%l1
	movrlz	%i4,	%i6,	%i5
	edge8ln	%o4,	%l0,	%o6
	alignaddrl	%o0,	%g7,	%o2
	movge	%icc,	%l2,	%l5
	taddcctv	%g2,	%i1,	%l3
	st	%f15,	[%l7 + 0x6C]
	sub	%g5,	0x1D53,	%g6
	movcc	%xcc,	%l4,	%l6
	umulcc	%o1,	%o3,	%i0
	bshuffle	%f24,	%f2,	%f4
	tcs	%xcc,	0x2
	srl	%g4,	0x0D,	%o7
	fbge,a	%fcc3,	loop_819
	fmovdgu	%icc,	%f11,	%f3
	ldsw	[%l7 + 0x2C],	%i3
	or	%o5,	0x15F6,	%i2
loop_819:
	subc	%g1,	0x1E91,	%i7
	popc	0x03F2,	%g3
	bcs,pt	%icc,	loop_820
	edge8l	%l1,	%i4,	%i5
	edge8n	%o4,	%l0,	%o6
	movge	%xcc,	%o0,	%g7
loop_820:
	edge32n	%o2,	%l2,	%l5
	fbue,a	%fcc2,	loop_821
	bcs,pt	%xcc,	loop_822
	movgu	%xcc,	%i6,	%g2
	movrne	%i1,	0x10E,	%g5
loop_821:
	xorcc	%g6,	%l3,	%l6
loop_822:
	addcc	%o1,	%l4,	%o3
	fbl	%fcc3,	loop_823
	udivcc	%g4,	0x0D56,	%o7
	fmovrdgz	%i3,	%f8,	%f28
	movre	%i0,	0x3CE,	%o5
loop_823:
	umul	%i2,	0x0AB8,	%g1
	xnorcc	%i7,	0x17F4,	%g3
	ble,a,pt	%icc,	loop_824
	fpsub32s	%f22,	%f2,	%f26
	tcc	%icc,	0x0
	nop
	setx loop_825, %l0, %l1
	jmpl %l1, %i4
loop_824:
	brlz	%i5,	loop_826
	fbg	%fcc2,	loop_827
	fmovrdne	%l1,	%f4,	%f8
loop_825:
	lduh	[%l7 + 0x22],	%l0
loop_826:
	fmovrdlez	%o4,	%f8,	%f18
loop_827:
	nop
	set	0x48, %i4
	stxa	%o6,	[%l7 + %i4] 0x18
	set	0x36, %o3
	ldsha	[%l7 + %o3] 0x1d,	%o0
	tcc	%xcc,	0x7
	tg	%xcc,	0x6
	fbule,a	%fcc2,	loop_828
	fmovdcc	%icc,	%f31,	%f21
	array16	%g7,	%l2,	%l5
	tgu	%icc,	0x1
loop_828:
	bvs	loop_829
	fnand	%f28,	%f30,	%f4
	fbuge	%fcc2,	loop_830
	edge32n	%o2,	%g2,	%i6
loop_829:
	bgu,a,pn	%xcc,	loop_831
	smul	%i1,	%g6,	%g5
loop_830:
	movneg	%icc,	%l6,	%l3
	sth	%o1,	[%l7 + 0x2A]
loop_831:
	membar	0x08
	fxnors	%f19,	%f3,	%f8
	fmovsle	%xcc,	%f1,	%f21
	sub	%o3,	0x08A0,	%g4
	array32	%l4,	%o7,	%i3
	addc	%i0,	0x075B,	%o5
	sethi	0x09D1,	%i2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrlz	%g1,	0x131,	%g3
	movg	%xcc,	%i4,	%i7
	fmovsl	%icc,	%f29,	%f16
	addc	%i5,	0x07CB,	%l1
	array32	%l0,	%o6,	%o4
	tneg	%xcc,	0x7
	popc	%g7,	%o0
	te	%xcc,	0x4
	edge16n	%l5,	%l2,	%g2
	te	%icc,	0x2
	fcmpeq16	%f24,	%f26,	%i6
	bne,a,pt	%icc,	loop_832
	flush	%l7 + 0x50
	wr	%g0,	0x18,	%asi
	stha	%i1,	[%l7 + 0x66] %asi
loop_832:
	flush	%l7 + 0x38
	sll	%g6,	0x0F,	%g5
	umul	%l6,	0x09FB,	%l3
	te	%xcc,	0x5
	udivcc	%o2,	0x06A5,	%o3
	fone	%f16
	fmovdcs	%xcc,	%f6,	%f23
	fmovscc	%xcc,	%f9,	%f29
	te	%xcc,	0x4
	tg	%xcc,	0x5
	fbug,a	%fcc2,	loop_833
	movvc	%xcc,	%o1,	%g4
	smulcc	%o7,	0x1325,	%l4
	array16	%i0,	%i3,	%i2
loop_833:
	ldd	[%l7 + 0x10],	%g0
	sdivx	%o5,	0x0B36,	%g3
	movpos	%icc,	%i7,	%i5
	wr	%g0,	0x80,	%asi
	ldswa	[%l7 + 0x40] %asi,	%l1
	brnz,a	%l0,	loop_834
	edge32l	%o6,	%i4,	%o4
	fcmpes	%fcc0,	%f24,	%f20
	tvs	%xcc,	0x6
loop_834:
	tge	%xcc,	0x1
	fpsub32	%f22,	%f6,	%f22
	movvs	%xcc,	%g7,	%o0
	fpackfix	%f18,	%f26
	fble,a	%fcc2,	loop_835
	udiv	%l5,	0x1F8D,	%l2
	srlx	%g2,	0x14,	%i1
	subccc	%i6,	%g5,	%g6
loop_835:
	movrlz	%l6,	%o2,	%l3
	fmuld8sux16	%f15,	%f20,	%f4
	popc	%o1,	%o3
	move	%xcc,	%g4,	%o7
	wr	%g0,	0x89,	%asi
	ldxa	[%l7 + 0x38] %asi,	%l4
	tg	%xcc,	0x6
	ldsh	[%l7 + 0x22],	%i0
	fmul8x16al	%f1,	%f1,	%f10
	udivcc	%i3,	0x14F6,	%g1
	sdiv	%o5,	0x1E0A,	%g3
	tvs	%icc,	0x7
	wr	%g0,	0x89,	%asi
	ldsba	[%l7 + 0x6E] %asi,	%i2
	fble,a	%fcc0,	loop_836
	edge16	%i5,	%i7,	%l1
	movvs	%xcc,	%o6,	%l0
	add	%l7,	0x68,	%l6
	wr	%g0,	0x18,	%asi
	casxa	[%l6] %asi,	%o4,	%g7
loop_836:
	nop
	wr	%g0,	0x89,	%asi
	ldxa	[%l7 + 0x10] %asi,	%o0
	movrgz	%l5,	0x235,	%l2
	ldstub	[%l7 + 0x5F],	%i4
	addcc	%i1,	0x0BDB,	%g2
	fbo,a	%fcc0,	loop_837
	call	loop_838
	xnor	%i6,	%g5,	%g6
	fmovdvc	%xcc,	%f13,	%f25
loop_837:
	tvs	%xcc,	0x4
loop_838:
	umulcc	%o2,	%l6,	%l3
	bne,pn	%xcc,	loop_839
	edge16n	%o1,	%o3,	%o7
	udivx	%l4,	0x067F,	%i0
	fbule,a	%fcc1,	loop_840
loop_839:
	movrlz	%i3,	0x2C7,	%g1
	set	0x70, %o1
	stha	%o5,	[%l7 + %o1] 0x1d
loop_840:
	movrlez	%g4,	0x3C4,	%i2
	srax	%g3,	0x16,	%i5
	taddcc	%i7,	%l1,	%o6
	fbg,a	%fcc2,	loop_841
	tg	%icc,	0x4
	tn	%xcc,	0x3
	fmovdl	%xcc,	%f30,	%f2
loop_841:
	edge16l	%l0,	%o4,	%o0
	membar	0x1B
	movcs	%xcc,	%g7,	%l2
	tcs	%xcc,	0x0
	movrne	%l5,	%i4,	%g2
	brgez,a	%i1,	loop_842
	fbg,a	%fcc3,	loop_843
	fbg	%fcc1,	loop_844
	xor	%g5,	%g6,	%i6
loop_842:
	edge8	%l6,	%l3,	%o2
loop_843:
	faligndata	%f30,	%f24,	%f22
loop_844:
	bne,a,pn	%icc,	loop_845
	fmovrdlz	%o3,	%f16,	%f4
	fbule,a	%fcc3,	loop_846
	fmovsleu	%xcc,	%f13,	%f31
loop_845:
	movg	%xcc,	%o1,	%l4
	tpos	%xcc,	0x0
loop_846:
	stb	%i0,	[%l7 + 0x27]
	fcmped	%fcc1,	%f18,	%f2
	fblg,a	%fcc3,	loop_847
	umul	%i3,	%g1,	%o5
	fandnot1	%f24,	%f14,	%f12
	udivcc	%g4,	0x0EF9,	%i2
loop_847:
	srl	%o7,	%i5,	%i7
	taddcc	%g3,	0x04AE,	%o6
	movcs	%icc,	%l0,	%l1
	fbug	%fcc2,	loop_848
	call	loop_849
	movrne	%o4,	%g7,	%o0
	bpos,a	loop_850
loop_848:
	movl	%xcc,	%l2,	%i4
loop_849:
	fmul8x16al	%f7,	%f12,	%f20
	fmovsvc	%xcc,	%f19,	%f2
loop_850:
	edge16ln	%l5,	%i1,	%g5
	movg	%icc,	%g6,	%g2
	andncc	%i6,	%l3,	%o2
	edge32ln	%l6,	%o3,	%o1
	subcc	%i0,	%i3,	%l4
	alignaddr	%o5,	%g1,	%i2
	ble,a,pn	%xcc,	loop_851
	fabss	%f7,	%f27
	tsubcc	%o7,	0x1DD1,	%g4
	mova	%xcc,	%i7,	%g3
loop_851:
	edge8ln	%i5,	%o6,	%l0
	fcmpeq32	%f0,	%f6,	%l1
	set	0x28, %l1
	stha	%g7,	[%l7 + %l1] 0x89
	ba	%xcc,	loop_852
	siam	0x5
	flushw
	fpadd16s	%f15,	%f25,	%f30
loop_852:
	edge32	%o4,	%l2,	%i4
	udivcc	%o0,	0x083A,	%l5
	fmovdne	%xcc,	%f18,	%f22
	fmovdle	%xcc,	%f1,	%f10
	movl	%icc,	%g5,	%i1
	fmovrse	%g2,	%f3,	%f3
	fbe	%fcc3,	loop_853
	edge8n	%i6,	%g6,	%o2
	edge16l	%l3,	%o3,	%l6
	tl	%xcc,	0x7
loop_853:
	nop
	set	0x1F, %g6
	stba	%i0,	[%l7 + %g6] 0x19
	orncc	%i3,	0x1CAC,	%l4
	movvs	%icc,	%o1,	%o5
	movcs	%xcc,	%g1,	%o7
	fnegd	%f6,	%f2
	wr	%g0,	0x04,	%asi
	lduba	[%l7 + 0x77] %asi,	%i2
	fone	%f18
	set	0x7E, %i2
	lduha	[%l7 + %i2] 0x15,	%i7
	udivcc	%g3,	0x0723,	%g4
	fcmpeq32	%f8,	%f20,	%o6
	movcc	%icc,	%i5,	%l1
	movrne	%l0,	0x02C,	%g7
	srl	%l2,	%i4,	%o0
	swap	[%l7 + 0x70],	%o4
	fmovsl	%icc,	%f5,	%f1
	sdivx	%g5,	0x0958,	%l5
	stbar
	edge32ln	%i1,	%g2,	%g6
	subccc	%o2,	%l3,	%i6
	wr	%g0,	0x04,	%asi
	ldda	[%l7 + 0x20] %asi,	%i6
	ldsb	[%l7 + 0x6E],	%o3
	umulcc	%i3,	%l4,	%o1
	bgu,a,pn	%xcc,	loop_854
	array8	%o5,	%g1,	%i0
	brnz,a	%i2,	loop_855
	movleu	%xcc,	%o7,	%g3
loop_854:
	move	%xcc,	%i7,	%g4
	fmovsge	%icc,	%f8,	%f1
loop_855:
	nop
	set	0x5C, %g7
	ldsha	[%l7 + %g7] 0x19,	%i5
	sethi	0x0B04,	%l1
	xorcc	%o6,	%g7,	%l0
	brz,a	%l2,	loop_856
	nop
	set	0x10, %l2
	ldx	[%l7 + %l2],	%i4
	umulcc	%o4,	0x0D64,	%o0
	ba	%xcc,	loop_857
loop_856:
	edge8l	%g5,	%i1,	%g2
	andcc	%g6,	0x15BA,	%l5
	fcmpne16	%f30,	%f14,	%l3
loop_857:
	nop
	set	0x08, %o6
	swapa	[%l7 + %o6] 0x89,	%i6
	popc	0x0D36,	%o2
	addccc	%l6,	0x1735,	%o3
	array32	%i3,	%o1,	%o5
	tle	%icc,	0x7
	fbule	%fcc1,	loop_858
	array16	%l4,	%g1,	%i0
	fmovrdgz	%o7,	%f8,	%f16
	movvs	%xcc,	%g3,	%i7
loop_858:
	stbar
	fzero	%f0
	movn	%icc,	%g4,	%i2
	fmovsle	%xcc,	%f7,	%f3
	orncc	%i5,	%l1,	%o6
	ta	%xcc,	0x7
	tl	%xcc,	0x6
	addc	%l0,	0x1909,	%g7
	fmovda	%icc,	%f15,	%f1
	stb	%l2,	[%l7 + 0x50]
	movpos	%icc,	%i4,	%o4
	umul	%g5,	%o0,	%g2
	wr	%g0,	0x80,	%asi
	ldxa	[%l7 + 0x50] %asi,	%i1
	fnot2	%f4,	%f0
	fxnor	%f14,	%f12,	%f6
	mova	%icc,	%g6,	%l5
	umulcc	%l3,	0x1F90,	%i6
	edge32l	%l6,	%o3,	%o2
	sll	%i3,	%o1,	%l4
	fbule,a	%fcc1,	loop_859
	subccc	%g1,	%i0,	%o5
	bvc,a,pn	%icc,	loop_860
	orn	%g3,	0x18D4,	%i7
loop_859:
	movpos	%icc,	%o7,	%g4
	orn	%i2,	0x0A97,	%l1
loop_860:
	subc	%o6,	0x089F,	%l0
	brlez	%i5,	loop_861
	movre	%l2,	%g7,	%o4
	bge,a,pt	%xcc,	loop_862
	fbne	%fcc1,	loop_863
loop_861:
	for	%f8,	%f20,	%f10
	andn	%g5,	%i4,	%o0
loop_862:
	bl,a,pt	%xcc,	loop_864
loop_863:
	sll	%g2,	0x11,	%i1
	tgu	%xcc,	0x3
	fpadd16	%f28,	%f10,	%f28
loop_864:
	lduw	[%l7 + 0x10],	%l5
	tn	%xcc,	0x0
	fmovdcs	%xcc,	%f14,	%f13
	tsubcc	%l3,	0x1383,	%i6
	tle	%icc,	0x7
	tg	%xcc,	0x0
	bge,a,pn	%xcc,	loop_865
	sra	%g6,	0x0F,	%l6
	fmovsvs	%icc,	%f29,	%f13
	fmovdgu	%xcc,	%f21,	%f19
loop_865:
	fba	%fcc3,	loop_866
	tvc	%icc,	0x4
	edge8l	%o3,	%o2,	%o1
	wr	%g0,	0x88,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
loop_866:
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
	fzeros	%f7
	movrgz	%l4,	0x0F5,	%g1
	fcmpne32	%f4,	%f18,	%i3
	fmovdne	%xcc,	%f12,	%f11
	umulcc	%o5,	%i0,	%i7
	sir	0x02D4
	lduw	[%l7 + 0x14],	%o7
	fbne,a	%fcc1,	loop_867
	fmovde	%icc,	%f3,	%f24
	popc	%g4,	%i2
	fbule	%fcc2,	loop_868
loop_867:
	ldd	[%l7 + 0x38],	%l0
	fbuge	%fcc2,	loop_869
	movvs	%xcc,	%o6,	%g3
loop_868:
	fmovsvc	%xcc,	%f0,	%f4
	edge32ln	%l0,	%l2,	%i5
loop_869:
	sub	%o4,	0x0D12,	%g5
	udivcc	%i4,	0x1016,	%g7
	fnands	%f6,	%f6,	%f10
	movl	%xcc,	%g2,	%i1
	fpsub16	%f28,	%f2,	%f18
	fsrc1s	%f30,	%f16
	tvc	%xcc,	0x0
	movleu	%icc,	%l5,	%l3
	fmovsne	%icc,	%f7,	%f0
	wr	%g0,	0x04,	%asi
	lda	[%l7 + 0x58] %asi,	%f4
	movrne	%o0,	%g6,	%i6
	edge32ln	%o3,	%l6,	%o1
	bvc,a,pt	%icc,	loop_870
	fxnor	%f4,	%f26,	%f0
	subcc	%l4,	0x139A,	%o2
	ldd	[%l7 + 0x70],	%f28
loop_870:
	bl,a	%xcc,	loop_871
	fcmps	%fcc1,	%f28,	%f22
	fornot2	%f26,	%f20,	%f16
	andncc	%i3,	%g1,	%i0
loop_871:
	fbul,a	%fcc0,	loop_872
	nop
	setx	loop_873,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fmovrdlz	%i7,	%f6,	%f20
	addcc	%o7,	0x1FB4,	%g4
loop_872:
	edge32ln	%o5,	%i2,	%l1
loop_873:
	movpos	%icc,	%o6,	%g3
	fblg,a	%fcc0,	loop_874
	fxnors	%f0,	%f30,	%f30
	movge	%xcc,	%l2,	%l0
	and	%o4,	0x12C4,	%g5
loop_874:
	bl,a	loop_875
	xnor	%i4,	%g7,	%i5
	srlx	%i1,	0x10,	%g2
	nop
	set	0x28, %g2
	stx	%l3,	[%l7 + %g2]
loop_875:
	nop
	set	0x6C, %l0
	lduba	[%l7 + %l0] 0x14,	%o0
	fbo,a	%fcc1,	loop_876
	lduw	[%l7 + 0x38],	%g6
	movneg	%xcc,	%l5,	%i6
	movge	%icc,	%o3,	%l6
loop_876:
	bn,pt	%xcc,	loop_877
	fbu,a	%fcc0,	loop_878
	stw	%l4,	[%l7 + 0x10]
	tneg	%xcc,	0x5
loop_877:
	edge8ln	%o2,	%o1,	%g1
loop_878:
	array16	%i0,	%i3,	%o7
	st	%f29,	[%l7 + 0x10]
	movle	%xcc,	%g4,	%o5
	xor	%i7,	0x062B,	%l1
	edge8ln	%i2,	%o6,	%l2
	fbue	%fcc3,	loop_879
	move	%icc,	%l0,	%g3
	sub	%g5,	%i4,	%o4
	fands	%f2,	%f3,	%f13
loop_879:
	edge8	%g7,	%i5,	%i1
	prefetch	[%l7 + 0x74],	 0x3
	edge8	%g2,	%l3,	%g6
	fbue	%fcc2,	loop_880
	fornot2s	%f15,	%f22,	%f25
	movle	%icc,	%l5,	%i6
	or	%o0,	%o3,	%l6
loop_880:
	subcc	%l4,	%o2,	%g1
	fmovrdne	%i0,	%f16,	%f20
	fsrc1	%f28,	%f14
	mulx	%o1,	%i3,	%o7
	andcc	%g4,	%i7,	%l1
	udivcc	%o5,	0x1F47,	%o6
	array32	%l2,	%i2,	%g3
	edge16ln	%l0,	%i4,	%g5
	mulx	%o4,	%g7,	%i1
	edge8n	%g2,	%l3,	%g6
	movvs	%icc,	%i5,	%i6
	tvs	%icc,	0x6
	wr	%g0,	0xf8,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	fbul	%fcc3,	loop_881
	tleu	%icc,	0x6
	array8	%l5,	%o0,	%o3
	wr	%g0,	0x88,	%asi
	sta	%f29,	[%l7 + 0x60] %asi
loop_881:
	fmovdl	%xcc,	%f10,	%f12
	udiv	%l6,	0x1942,	%l4
	std	%f18,	[%l7 + 0x20]
	fbo	%fcc3,	loop_882
	sdivcc	%o2,	0x09AD,	%i0
	set	0x10, %l5
	ldda	[%l7 + %l5] 0x11,	%o0
loop_882:
	bshuffle	%f18,	%f2,	%f22
	bcs,a	%icc,	loop_883
	ldd	[%l7 + 0x30],	%g0
	movleu	%icc,	%o7,	%g4
	fbg,a	%fcc2,	loop_884
loop_883:
	sra	%i3,	0x15,	%l1
	srlx	%i7,	0x0B,	%o6
	wr	%g0,	0x10,	%asi
	lduba	[%l7 + 0x1A] %asi,	%o5
loop_884:
	nop
	add	%l7,	0x20,	%l6
	wr	%g0,	0x10,	%asi
	casxa	[%l6] %asi,	%l2,	%i2
	array16	%g3,	%i4,	%l0
	set	0x0D, %i1
	ldsba	[%l7 + %i1] 0x04,	%o4
	fpackfix	%f0,	%f7
	sdivx	%g5,	0x15D4,	%i1
	umulcc	%g2,	0x1E5E,	%g7
	sllx	%l3,	0x19,	%g6
	subc	%i6,	0x058B,	%l5
	movrlez	%o0,	%o3,	%i5
	movrgz	%l4,	0x022,	%l6
	taddcctv	%o2,	%i0,	%o1
	tsubcc	%o7,	%g4,	%g1
	or	%l1,	%i7,	%o6
	udivx	%o5,	0x13FC,	%l2
	fpmerge	%f6,	%f28,	%f2
	fbu,a	%fcc0,	loop_885
	bne	loop_886
	sll	%i3,	0x12,	%i2
	sra	%i4,	0x17,	%l0
loop_885:
	movvc	%xcc,	%g3,	%o4
loop_886:
	movgu	%icc,	%g5,	%g2
	ldd	[%l7 + 0x60],	%f26
	smul	%g7,	%i1,	%l3
	set	0x2C, %o4
	sta	%f2,	[%l7 + %o4] 0x14
	udivcc	%i6,	0x1C7D,	%l5
	tsubcctv	%g6,	%o0,	%o3
	add	%l4,	0x0697,	%i5
	fornot1s	%f24,	%f0,	%f10
	faligndata	%f8,	%f2,	%f26
	edge16ln	%o2,	%i0,	%o1
	udiv	%l6,	0x0905,	%o7
	tle	%icc,	0x3
	tsubcctv	%g4,	%l1,	%g1
	fmovdvc	%icc,	%f31,	%f17
	fnegs	%f29,	%f17
	add	%l7,	0x48,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%o6,	%i7
	fsrc2	%f14,	%f22
	tvc	%icc,	0x4
	ta	%icc,	0x5
	tne	%xcc,	0x7
	fbg,a	%fcc2,	loop_887
	fmovdvc	%icc,	%f3,	%f17
	movrne	%l2,	%o5,	%i2
	wr	%g0,	0x19,	%asi
	stba	%i4,	[%l7 + 0x1B] %asi
loop_887:
	fcmps	%fcc3,	%f25,	%f0
	andn	%i3,	0x163F,	%l0
	movrgz	%g3,	0x336,	%o4
	tvs	%xcc,	0x1
	movl	%icc,	%g2,	%g7
	fpsub16	%f22,	%f4,	%f6
	movcc	%icc,	%i1,	%g5
	mova	%icc,	%i6,	%l3
	edge8n	%g6,	%l5,	%o0
	movrne	%o3,	%i5,	%o2
	add	%i0,	0x15CE,	%o1
	mulx	%l6,	%o7,	%g4
	add	%l4,	0x0399,	%l1
	smulcc	%o6,	0x13CD,	%i7
	sir	0x03CE
	edge16ln	%g1,	%l2,	%o5
	andn	%i2,	0x1142,	%i4
	movrgez	%i3,	%g3,	%l0
	add	%o4,	%g7,	%i1
	fmovsvc	%icc,	%f25,	%f30
	movn	%xcc,	%g2,	%g5
	fbge,a	%fcc2,	loop_888
	edge16n	%i6,	%g6,	%l3
	edge16	%o0,	%l5,	%i5
	movl	%xcc,	%o3,	%i0
loop_888:
	andn	%o2,	%l6,	%o7
	wr	%g0,	0x89,	%asi
	stwa	%o1,	[%l7 + 0x6C] %asi
	sra	%l4,	0x08,	%g4
	edge32l	%o6,	%i7,	%l1
	brlez,a	%l2,	loop_889
	tgu	%icc,	0x6
	brz	%g1,	loop_890
	be,a	loop_891
loop_889:
	brgez,a	%i2,	loop_892
	edge16l	%i4,	%o5,	%i3
loop_890:
	tn	%icc,	0x0
loop_891:
	fbn	%fcc2,	loop_893
loop_892:
	array32	%l0,	%o4,	%g3
	tgu	%icc,	0x0
	movne	%xcc,	%g7,	%i1
loop_893:
	edge8	%g2,	%g5,	%i6
	fmovsleu	%xcc,	%f0,	%f18
	fandnot2s	%f27,	%f21,	%f21
	fcmpgt32	%f6,	%f0,	%l3
	xorcc	%g6,	%o0,	%l5
	bgu,a	loop_894
	orcc	%i5,	%i0,	%o3
	fornot1	%f2,	%f2,	%f8
	xnor	%o2,	0x1873,	%l6
loop_894:
	fmovrsgez	%o7,	%f27,	%f1
	ta	%xcc,	0x6
	edge8n	%o1,	%g4,	%l4
	smulcc	%i7,	%o6,	%l1
	tg	%xcc,	0x5
	sdiv	%g1,	0x08C4,	%l2
	tsubcc	%i2,	%i4,	%i3
	edge8l	%o5,	%o4,	%g3
	fabss	%f10,	%f18
	tge	%xcc,	0x1
	fmovdvs	%icc,	%f11,	%f3
	movl	%xcc,	%l0,	%i1
	fmovdge	%xcc,	%f27,	%f17
	fcmpne32	%f2,	%f20,	%g7
	or	%g5,	%i6,	%l3
	bcc,a	loop_895
	bshuffle	%f0,	%f12,	%f26
	xor	%g2,	0x1BC9,	%o0
	fpadd16	%f10,	%f30,	%f2
loop_895:
	udivcc	%l5,	0x087E,	%i5
	addcc	%i0,	0x1C1E,	%o3
	movvs	%xcc,	%g6,	%l6
	mulscc	%o2,	0x05A1,	%o7
	set	0x78, %i6
	ldstuba	[%l7 + %i6] 0x81,	%g4
	fabss	%f6,	%f20
	ba,a,pn	%icc,	loop_896
	movge	%xcc,	%l4,	%o1
	bcc,a	%icc,	loop_897
	edge32ln	%i7,	%l1,	%o6
loop_896:
	movcc	%xcc,	%g1,	%i2
	edge8ln	%i4,	%i3,	%o5
loop_897:
	move	%xcc,	%o4,	%g3
	fmovscc	%xcc,	%f28,	%f22
	popc	0x0667,	%l0
	add	%l7,	0x20,	%l6
	wr	%g0,	0x11,	%asi
	lda	[%l6] %asi,	%l2
	casa	[%l6] %asi,	%l2,	%i1
	popc	%g5,	%i6
	addcc	%g7,	%g2,	%o0
	nop
	setx	loop_898,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fmovrdgz	%l3,	%f24,	%f14
	edge16	%l5,	%i0,	%i5
	ldstub	[%l7 + 0x25],	%g6
loop_898:
	nop
	wr	%g0,	0x89,	%asi
	stwa	%l6,	[%l7 + 0x74] %asi
	array32	%o2,	%o3,	%g4
	tg	%icc,	0x4
	movre	%o7,	0x031,	%l4
	smulcc	%o1,	0x1ECF,	%i7
	fands	%f21,	%f22,	%f20
	srax	%o6,	0x0B,	%g1
	fmovsvc	%xcc,	%f0,	%f24
	ta	%icc,	0x6
	move	%icc,	%l1,	%i2
	fbue	%fcc2,	loop_899
	fbue	%fcc3,	loop_900
	xnorcc	%i4,	%i3,	%o4
	subccc	%o5,	%g3,	%l2
loop_899:
	tpos	%icc,	0x0
loop_900:
	orncc	%i1,	0x1846,	%g5
	smulcc	%i6,	%g7,	%g2
	edge8ln	%o0,	%l0,	%l5
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x2A] %asi,	%l3
	nop
	setx	loop_901,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	array16	%i5,	%g6,	%l6
	bpos	loop_902
	sdivcc	%i0,	0x1C00,	%o3
loop_901:
	or	%g4,	0x0E1C,	%o7
	srax	%o2,	%o1,	%i7
loop_902:
	tsubcctv	%o6,	0x1EBF,	%g1
	wr	%g0,	0x0c,	%asi
	stxa	%l4,	[%l7 + 0x68] %asi
	fbue	%fcc3,	loop_903
	tg	%icc,	0x3
	fba	%fcc0,	loop_904
	tn	%xcc,	0x5
loop_903:
	fbul	%fcc2,	loop_905
	udivcc	%i2,	0x0E93,	%i4
loop_904:
	alignaddrl	%l1,	%i3,	%o4
	orncc	%g3,	0x15FF,	%l2
loop_905:
	umulcc	%o5,	%g5,	%i6
	flushw
	set	0x50, %g3
	lduha	[%l7 + %g3] 0x89,	%g7
	nop
	setx loop_906, %l0, %l1
	jmpl %l1, %g2
	xnor	%i1,	%l0,	%o0
	fmovrsne	%l5,	%f30,	%f22
	movcc	%xcc,	%i5,	%l3
loop_906:
	fbule,a	%fcc2,	loop_907
	ldub	[%l7 + 0x5B],	%l6
	tpos	%icc,	0x7
	movl	%xcc,	%i0,	%g6
loop_907:
	brnz	%g4,	loop_908
	fandnot1s	%f4,	%f4,	%f16
	subcc	%o7,	%o3,	%o2
	tpos	%icc,	0x3
loop_908:
	bl,a	%icc,	loop_909
	fxors	%f27,	%f4,	%f8
	sdiv	%o1,	0x0CB8,	%i7
	udiv	%o6,	0x0C7A,	%g1
loop_909:
	fmovd	%f20,	%f14
	edge16	%i2,	%i4,	%l1
	edge32	%l4,	%i3,	%o4
	fmovsle	%xcc,	%f5,	%f30
	set	0x0E, %i5
	lduha	[%l7 + %i5] 0x1c,	%l2
	movvc	%xcc,	%o5,	%g3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andn	%i6,	0x0A81,	%g7
	umulcc	%g5,	%i1,	%l0
	fcmpne16	%f20,	%f30,	%o0
	fmovsle	%xcc,	%f4,	%f14
	movrlz	%g2,	0x077,	%l5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	set	0x56, %g1
	ldub	[%l7 + %g1],	%i5
	bvs	%icc,	loop_910
	movg	%xcc,	%l3,	%l6
	movle	%icc,	%i0,	%g4
	fmovsgu	%xcc,	%f17,	%f18
loop_910:
	nop
	setx	loop_911,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	umul	%o7,	0x13CB,	%g6
	movpos	%xcc,	%o2,	%o1
	srax	%i7,	%o6,	%o3
loop_911:
	bgu,pt	%icc,	loop_912
	taddcc	%i2,	%g1,	%i4
	fbg,a	%fcc3,	loop_913
	tcs	%icc,	0x3
loop_912:
	fandnot1	%f26,	%f10,	%f2
	tgu	%icc,	0x7
loop_913:
	edge32ln	%l1,	%l4,	%i3
	add	%l7,	0x20,	%l6
	wr	%g0,	0x04,	%asi
	casxa	[%l6] 0x04,	%o4,	%l2
	tleu	%xcc,	0x0
	fpsub16s	%f22,	%f8,	%f9
	brgez	%g3,	loop_914
	sethi	0x147A,	%i6
	smulcc	%g7,	0x093C,	%o5
	fornot2s	%f3,	%f19,	%f26
loop_914:
	and	%i1,	0x0971,	%l0
	te	%icc,	0x5
	tn	%icc,	0x6
	movrlz	%o0,	0x1AF,	%g2
	set	0x48, %o5
	stxa	%l5,	[%l7 + %o5] 0x81
	sdivcc	%i5,	0x0A2C,	%l3
	srl	%l6,	%i0,	%g5
	fmuld8ulx16	%f20,	%f15,	%f28
	subc	%o7,	0x1DDC,	%g4
	bleu,pt	%icc,	loop_915
	fblg	%fcc2,	loop_916
	fbo	%fcc0,	loop_917
	bcc	loop_918
loop_915:
	fbu	%fcc0,	loop_919
loop_916:
	alignaddrl	%g6,	%o1,	%i7
loop_917:
	nop
	set	0x28, %o0
	sta	%f11,	[%l7 + %o0] 0x0c
loop_918:
	sdiv	%o2,	0x0370,	%o6
loop_919:
	tpos	%xcc,	0x1
	fmul8x16	%f25,	%f20,	%f14
	wr	%g0,	0x89,	%asi
	stha	%i2,	[%l7 + 0x7A] %asi
	andcc	%o3,	%i4,	%g1
	fzeros	%f20
	tcc	%xcc,	0x7
	srlx	%l4,	0x18,	%i3
	edge8	%l1,	%o4,	%g3
	andcc	%l2,	0x1F21,	%i6
	fnot2s	%f2,	%f16
	wr	%g0,	0x80,	%asi
	ldda	[%l7 + 0x20] %asi,	%g6
	bneg,pn	%icc,	loop_920
	movle	%icc,	%o5,	%i1
	bl,a,pn	%icc,	loop_921
	sdiv	%l0,	0x1AAB,	%g2
loop_920:
	edge16ln	%l5,	%o0,	%l3
	move	%xcc,	%l6,	%i5
loop_921:
	fones	%f1
	edge8ln	%g5,	%i0,	%o7
	mova	%icc,	%g4,	%g6
	fbug,a	%fcc3,	loop_922
	fpmerge	%f24,	%f29,	%f4
	srax	%o1,	0x01,	%o2
	udivcc	%o6,	0x1572,	%i7
loop_922:
	fornot2s	%f21,	%f23,	%f13
	fpsub16	%f14,	%f20,	%f16
	tleu	%xcc,	0x5
	fnot2s	%f0,	%f29
	sra	%i2,	%o3,	%g1
	ble,pn	%icc,	loop_923
	tle	%xcc,	0x7
	sra	%i4,	%l4,	%i3
	movpos	%icc,	%l1,	%o4
loop_923:
	fbue,a	%fcc3,	loop_924
	lduw	[%l7 + 0x54],	%l2
	edge16ln	%g3,	%i6,	%o5
	stx	%i1,	[%l7 + 0x40]
loop_924:
	fbg	%fcc2,	loop_925
	fcmple16	%f2,	%f22,	%g7
	ldsb	[%l7 + 0x4E],	%g2
	fpadd32s	%f24,	%f29,	%f27
loop_925:
	srax	%l0,	0x04,	%l5
	fmovdpos	%xcc,	%f18,	%f5
	fornot1	%f4,	%f16,	%f18
	orn	%o0,	0x0984,	%l3
	srl	%i5,	%l6,	%g5
	fandnot1	%f24,	%f18,	%f8
	alignaddr	%o7,	%i0,	%g6
	udiv	%g4,	0x1E96,	%o1
	bn,pn	%xcc,	loop_926
	bneg	%xcc,	loop_927
	edge8n	%o6,	%o2,	%i2
	add	%o3,	0x0B53,	%i7
loop_926:
	fmovdge	%icc,	%f6,	%f1
loop_927:
	tsubcctv	%i4,	%g1,	%i3
	te	%icc,	0x1
	fors	%f23,	%f29,	%f24
	movvc	%xcc,	%l4,	%l1
	movgu	%icc,	%l2,	%g3
	subccc	%i6,	%o4,	%i1
	sdivx	%g7,	0x082A,	%g2
	xnorcc	%l0,	0x0BD9,	%l5
	udivcc	%o0,	0x15DC,	%o5
	brz,a	%l3,	loop_928
	alignaddr	%i5,	%g5,	%o7
	subc	%i0,	0x03E4,	%l6
	fmovrdgez	%g4,	%f16,	%f4
loop_928:
	orn	%o1,	%o6,	%o2
	tgu	%icc,	0x7
	tl	%xcc,	0x1
	bneg,a	%xcc,	loop_929
	orn	%g6,	0x0E9B,	%o3
	wr	%g0,	0x80,	%asi
	sta	%f7,	[%l7 + 0x34] %asi
loop_929:
	movrgz	%i7,	%i2,	%i4
	orcc	%i3,	%l4,	%l1
	sllx	%l2,	0x04,	%g3
	set	0x68, %i0
	ldxa	[%l7 + %i0] 0x81,	%i6
	fpack16	%f8,	%f5
	subccc	%g1,	%o4,	%g7
	ldd	[%l7 + 0x28],	%g2
	movvs	%xcc,	%i1,	%l0
	sethi	0x1D91,	%l5
	fsrc2s	%f20,	%f16
	fmovrse	%o5,	%f22,	%f22
	sllx	%l3,	0x15,	%o0
	bneg,pn	%icc,	loop_930
	andn	%i5,	%o7,	%g5
	tvs	%xcc,	0x0
	edge16ln	%i0,	%l6,	%o1
loop_930:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16n	%g4,	%o2,	%o6
	fmovsl	%icc,	%f19,	%f31
	stbar
	tgu	%xcc,	0x4
	sir	0x1554
	nop
	setx	loop_931,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movcs	%xcc,	%g6,	%i7
	fpack32	%f24,	%f14,	%f6
	xnorcc	%o3,	%i2,	%i3
loop_931:
	movcc	%xcc,	%i4,	%l4
	membar	0x1C
	alignaddr	%l1,	%l2,	%i6
	fmovrde	%g3,	%f20,	%f16
	umul	%g1,	%o4,	%g7
	membar	0x43
	set	0x7C, %l4
	lda	[%l7 + %l4] 0x89,	%f26
	bvc,a,pt	%icc,	loop_932
	taddcctv	%i1,	0x1D02,	%g2
	wr	%g0,	0x18,	%asi
	lduwa	[%l7 + 0x08] %asi,	%l5
loop_932:
	ldsh	[%l7 + 0x76],	%l0
	fnot1	%f6,	%f14
	fmovscs	%icc,	%f3,	%f25
	bvc,a	%xcc,	loop_933
	xorcc	%l3,	%o0,	%o5
	call	loop_934
	subc	%o7,	0x0F13,	%i5
loop_933:
	movrlez	%g5,	0x143,	%i0
	brgz,a	%o1,	loop_935
loop_934:
	sdivx	%l6,	0x0D60,	%g4
	movrgz	%o2,	%g6,	%i7
	edge32ln	%o3,	%i2,	%o6
loop_935:
	movn	%icc,	%i3,	%i4
	brz	%l1,	loop_936
	movl	%icc,	%l2,	%l4
	alignaddrl	%g3,	%i6,	%o4
	edge16n	%g7,	%g1,	%i1
loop_936:
	udivcc	%g2,	0x0E81,	%l5
	wr	%g0,	0x89,	%asi
	stha	%l0,	[%l7 + 0x48] %asi
	subc	%l3,	%o0,	%o7
	ldx	[%l7 + 0x38],	%i5
	fblg,a	%fcc0,	loop_937
	tle	%xcc,	0x3
	array32	%o5,	%i0,	%o1
	bne,a,pt	%icc,	loop_938
loop_937:
	orn	%l6,	0x10BD,	%g5
	set	0x79, %i7
	lduba	[%l7 + %i7] 0x14,	%o2
loop_938:
	te	%icc,	0x1
	fcmpeq32	%f28,	%f16,	%g6
	set	0x18, %l3
	ldxa	[%l7 + %l3] 0x19,	%i7
	orn	%o3,	0x084C,	%g4
	membar	0x0A
	bn,a	%xcc,	loop_939
	fmovrdlez	%i2,	%f8,	%f28
	smulcc	%i3,	%i4,	%o6
	fmul8sux16	%f0,	%f0,	%f0
loop_939:
	edge16ln	%l1,	%l2,	%g3
	taddcctv	%i6,	0x072F,	%l4
	tcc	%icc,	0x7
	fbug	%fcc1,	loop_940
	fmovrsgez	%o4,	%f1,	%f29
	srax	%g7,	%g1,	%g2
	fpadd32s	%f7,	%f1,	%f19
loop_940:
	edge32ln	%i1,	%l0,	%l3
	move	%icc,	%l5,	%o7
	wr	%g0,	0x80,	%asi
	ldstuba	[%l7 + 0x14] %asi,	%i5
	move	%icc,	%o0,	%i0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdl	%xcc,	%f7,	%f16
	mova	%xcc,	%o5,	%l6
	fmuld8sux16	%f31,	%f28,	%f30
	ta	%xcc,	0x0
	edge16ln	%o1,	%o2,	%g5
	tl	%icc,	0x6
	movgu	%xcc,	%i7,	%g6
	array32	%g4,	%o3,	%i2
	bcc,a	loop_941
	fcmpeq32	%f14,	%f2,	%i3
	or	%i4,	0x039F,	%o6
	set	0x6F, %o7
	ldsba	[%l7 + %o7] 0x14,	%l1
loop_941:
	tsubcc	%l2,	%g3,	%l4
	tneg	%icc,	0x1
	subc	%o4,	0x16B4,	%i6
	bcc,a	%icc,	loop_942
	fblg	%fcc3,	loop_943
	fone	%f6
	edge16	%g7,	%g2,	%i1
loop_942:
	movcc	%icc,	%l0,	%g1
loop_943:
	faligndata	%f24,	%f30,	%f6
	be	%icc,	loop_944
	udiv	%l3,	0x0B70,	%l5
	edge32l	%o7,	%i5,	%o0
	alignaddrl	%i0,	%o5,	%l6
loop_944:
	edge32	%o2,	%g5,	%i7
	udiv	%o1,	0x0A0D,	%g4
	flushw
	wr	%g0,	0x80,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	edge8l	%g6,	%o3,	%i3
	fone	%f14
	tcc	%xcc,	0x6
	pdist	%f10,	%f24,	%f16
	array16	%i2,	%i4,	%o6
	array16	%l2,	%l1,	%g3
	ba,a	%icc,	loop_945
	smulcc	%o4,	%l4,	%g7
	popc	%g2,	%i6
	edge32n	%l0,	%i1,	%l3
loop_945:
	nop
	wr	%g0,	0x11,	%asi
	ldswa	[%l7 + 0x1C] %asi,	%l5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmpd	%fcc3,	%f24,	%f16
	tg	%icc,	0x2
	wr	%g0,	0x10,	%asi
	ldsba	[%l7 + 0x6F] %asi,	%o7
	movvc	%icc,	%i5,	%o0
	array16	%g1,	%o5,	%l6
	bg	%xcc,	loop_946
	addcc	%o2,	0x0A7C,	%g5
	brlez,a	%i7,	loop_947
	membar	0x0E
loop_946:
	swap	[%l7 + 0x08],	%i0
	edge32n	%g4,	%g6,	%o3
loop_947:
	edge16l	%i3,	%o1,	%i2
	fba	%fcc3,	loop_948
	move	%xcc,	%i4,	%o6
	tge	%icc,	0x3
	and	%l1,	0x0A2D,	%l2
loop_948:
	addccc	%o4,	%l4,	%g7
	movrlez	%g3,	0x21E,	%i6
	umulcc	%l0,	%g2,	%i1
	fbule,a	%fcc1,	loop_949
	sub	%l5,	0x044C,	%l3
	stb	%i5,	[%l7 + 0x3C]
	tvs	%xcc,	0x5
loop_949:
	movrgz	%o0,	%g1,	%o5
	sra	%l6,	0x04,	%o7
	array16	%o2,	%i7,	%g5
	fpsub32	%f16,	%f10,	%f22
	tvc	%xcc,	0x6
	edge16	%i0,	%g6,	%g4
	movl	%icc,	%o3,	%o1
	fnor	%f2,	%f22,	%f12
	brnz,a	%i3,	loop_950
	stb	%i4,	[%l7 + 0x36]
	fmovdneg	%icc,	%f25,	%f30
	sll	%i2,	0x03,	%l1
loop_950:
	bvs,a,pn	%icc,	loop_951
	tl	%xcc,	0x0
	umulcc	%o6,	0x0771,	%o4
	tvc	%icc,	0x4
loop_951:
	movgu	%icc,	%l2,	%l4
	fmovdleu	%icc,	%f13,	%f29
	ld	[%l7 + 0x40],	%f9
	fmovrsne	%g3,	%f28,	%f30
	fpsub32s	%f30,	%f17,	%f24
	set	0x0E, %g5
	stba	%i6,	[%l7 + %g5] 0x88
	tleu	%xcc,	0x5
	tge	%icc,	0x5
	edge16ln	%g7,	%l0,	%i1
	tgu	%icc,	0x0
	xnor	%g2,	0x1189,	%l5
	brgez,a	%i5,	loop_952
	ta	%xcc,	0x6
	alignaddr	%l3,	%g1,	%o5
	orn	%o0,	0x15F9,	%o7
loop_952:
	fbu,a	%fcc0,	loop_953
	fbl	%fcc1,	loop_954
	fmovrdgez	%l6,	%f12,	%f8
	edge32l	%i7,	%o2,	%i0
loop_953:
	movleu	%xcc,	%g6,	%g5
loop_954:
	flushw
	orcc	%g4,	%o3,	%i3
	move	%xcc,	%o1,	%i4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrlz	%l1,	0x024,	%o6
	bcs,a,pn	%xcc,	loop_955
	bn,a	loop_956
	membar	0x20
	fmovdl	%xcc,	%f8,	%f21
loop_955:
	bleu,a,pt	%xcc,	loop_957
loop_956:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fxor	%f4,	%f10,	%f2
	tsubcctv	%o4,	0x1A5E,	%l2
loop_957:
	sub	%i2,	0x1089,	%g3
	movne	%icc,	%l4,	%g7
	sdiv	%i6,	0x0480,	%i1
	movcs	%icc,	%g2,	%l0
	tcc	%xcc,	0x2
	fcmpgt32	%f8,	%f10,	%i5
	movl	%xcc,	%l5,	%l3
	fcmps	%fcc1,	%f6,	%f13
	or	%o5,	0x1298,	%g1
	alignaddr	%o7,	%o0,	%i7
	addcc	%l6,	%o2,	%i0
	fble	%fcc1,	loop_958
	tn	%icc,	0x6
	fandnot2	%f20,	%f0,	%f4
	array8	%g5,	%g6,	%o3
loop_958:
	sllx	%i3,	%o1,	%g4
	fnegd	%f18,	%f14
	fmovrdgez	%l1,	%f2,	%f2
	umulcc	%i4,	%o6,	%l2
	movvc	%xcc,	%i2,	%o4
	movge	%icc,	%g3,	%g7
	tsubcc	%i6,	%i1,	%l4
	mova	%xcc,	%l0,	%g2
	bcs	loop_959
	tneg	%icc,	0x0
	srlx	%i5,	0x17,	%l3
	fmovdle	%icc,	%f31,	%f28
loop_959:
	fmul8sux16	%f8,	%f10,	%f4
	umulcc	%o5,	0x0F2E,	%l5
	bn,a,pt	%xcc,	loop_960
	edge32n	%g1,	%o0,	%i7
	fabsd	%f12,	%f24
	edge16ln	%l6,	%o2,	%i0
loop_960:
	xnor	%g5,	0x0905,	%g6
	tl	%icc,	0x0
	movrgez	%o7,	0x2D3,	%i3
	fnot2s	%f28,	%f6
	edge16l	%o3,	%o1,	%g4
	taddcctv	%l1,	%i4,	%o6
	add	%l7,	0x5C,	%l6
	wr	%g0,	0x0c,	%asi
	casa	[%l6] %asi,	%i2,	%l2
	tne	%icc,	0x0
	membar	0x57
	tcs	%icc,	0x0
	fmovscc	%xcc,	%f19,	%f29
	fsrc1s	%f9,	%f2
	set	0x38, %g4
	ldsha	[%l7 + %g4] 0x19,	%g3
	fcmpne32	%f6,	%f28,	%g7
	set	0x7C, %i3
	lduwa	[%l7 + %i3] 0x89,	%o4
	movpos	%icc,	%i6,	%i1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrne	%l4,	%l0,	%g2
	fmovsvs	%xcc,	%f9,	%f27
	call	loop_961
	flushw
	set	0x2B, %l6
	ldstuba	[%l7 + %l6] 0x0c,	%i5
loop_961:
	call	loop_962
	std	%f26,	[%l7 + 0x58]
	brgez	%o5,	loop_963
	tcc	%xcc,	0x0
loop_962:
	movg	%icc,	%l5,	%g1
	edge8	%o0,	%i7,	%l3
loop_963:
	fnands	%f10,	%f23,	%f24
	movleu	%icc,	%l6,	%o2
	orn	%g5,	0x0011,	%i0
	fbo,a	%fcc0,	loop_964
	edge32	%g6,	%o7,	%i3
	fpsub32s	%f7,	%f31,	%f29
	andncc	%o3,	%o1,	%l1
loop_964:
	udivcc	%i4,	0x052B,	%g4
	sth	%i2,	[%l7 + 0x5E]
	move	%xcc,	%l2,	%g3
	fmovdcs	%xcc,	%f20,	%f24
	addcc	%g7,	%o6,	%o4
	movrgez	%i6,	%i1,	%l0
	wr	%g0,	0x89,	%asi
	ldsba	[%l7 + 0x27] %asi,	%g2
	nop
	set	0x2C, %i4
	stw	%i5,	[%l7 + %i4]
	fbule,a	%fcc2,	loop_965
	fmovdpos	%xcc,	%f3,	%f20
	fmul8x16al	%f4,	%f2,	%f0
	for	%f4,	%f0,	%f22
loop_965:
	movl	%icc,	%l4,	%l5
	fcmpgt16	%f6,	%f24,	%o5
	fzero	%f16
	nop
	setx	loop_966,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	addccc	%o0,	%g1,	%i7
	fpadd32s	%f5,	%f24,	%f18
	tl	%icc,	0x1
loop_966:
	nop
	add	%l7,	0x70,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%l3
	casxa	[%l6] %asi,	%l3,	%l6
	ble,a	loop_967
	fblg,a	%fcc0,	loop_968
	or	%o2,	0x035A,	%i0
	brlz	%g6,	loop_969
loop_967:
	alignaddrl	%g5,	%i3,	%o7
loop_968:
	nop
	set	0x30, %o3
	prefetcha	[%l7 + %o3] 0x0c,	 0x0
loop_969:
	fbe	%fcc1,	loop_970
	lduh	[%l7 + 0x54],	%o3
	brgz,a	%i4,	loop_971
	addc	%g4,	0x1183,	%l1
loop_970:
	movne	%xcc,	%l2,	%i2
	fpadd16s	%f17,	%f5,	%f9
loop_971:
	ldx	[%l7 + 0x68],	%g7
	fba,a	%fcc1,	loop_972
	bne,a,pn	%xcc,	loop_973
	edge8l	%o6,	%o4,	%g3
	sdivx	%i1,	0x1DB9,	%l0
loop_972:
	andcc	%i6,	0x0E6E,	%i5
loop_973:
	sdivcc	%l4,	0x0C19,	%l5
	array32	%o5,	%o0,	%g2
	array8	%g1,	%l3,	%i7
	tleu	%icc,	0x5
	taddcctv	%l6,	0x015E,	%i0
	stb	%o2,	[%l7 + 0x36]
	membar	0x55
	sethi	0x14BC,	%g5
	fnot1s	%f21,	%f0
	ta	%xcc,	0x1
	ldstub	[%l7 + 0x13],	%i3
	set	0x10, %o2
	ldxa	[%l7 + %o2] 0x88,	%o7
	fmovsgu	%xcc,	%f12,	%f2
	edge32	%o1,	%g6,	%o3
	fmul8x16al	%f13,	%f6,	%f8
	set	0x0C, %l1
	ldsha	[%l7 + %l1] 0x14,	%i4
	xnor	%l1,	%g4,	%l2
	subcc	%i2,	0x0204,	%g7
	swap	[%l7 + 0x40],	%o4
	fbn	%fcc2,	loop_974
	movg	%icc,	%o6,	%g3
	nop
	set	0x25, %g6
	ldstub	[%l7 + %g6],	%l0
	ldub	[%l7 + 0x5C],	%i1
loop_974:
	flushw
	fmul8ulx16	%f18,	%f20,	%f10
	st	%f11,	[%l7 + 0x48]
	smul	%i5,	0x08B5,	%i6
	nop
	set	0x08, %o1
	ldx	[%l7 + %o1],	%l4
	xorcc	%o5,	0x1C73,	%l5
	array32	%o0,	%g2,	%g1
	fsrc2s	%f29,	%f6
	tg	%icc,	0x3
	array16	%i7,	%l3,	%l6
	tneg	%icc,	0x7
	bg,a	loop_975
	fmovdneg	%icc,	%f12,	%f26
	ldstub	[%l7 + 0x7C],	%i0
	fcmpne32	%f24,	%f28,	%g5
loop_975:
	fmovrdgz	%o2,	%f2,	%f6
	edge8ln	%i3,	%o1,	%o7
	tl	%icc,	0x1
	set	0x7D, %i2
	stba	%o3,	[%l7 + %i2] 0x80
	edge16l	%g6,	%l1,	%g4
	tcs	%xcc,	0x1
	edge16l	%l2,	%i2,	%i4
	fbu,a	%fcc1,	loop_976
	tcs	%icc,	0x1
	ldd	[%l7 + 0x60],	%f20
	wr	%g0,	0x10,	%asi
	ldswa	[%l7 + 0x30] %asi,	%g7
loop_976:
	edge16l	%o6,	%o4,	%l0
	movne	%xcc,	%i1,	%i5
	siam	0x4
	tleu	%xcc,	0x3
	fornot1	%f28,	%f10,	%f22
	fmovrdgz	%g3,	%f14,	%f10
	movne	%icc,	%l4,	%i6
	edge32	%l5,	%o0,	%g2
	tn	%icc,	0x5
	set	0x4C, %g7
	stwa	%g1,	[%l7 + %g7] 0x0c
	fmuld8ulx16	%f21,	%f3,	%f6
	umulcc	%o5,	0x19DE,	%l3
	add	%l7,	0x30,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%i7
	casa	[%l6] %asi,	%i7,	%i0
	set	0x28, %l2
	prefetcha	[%l7 + %l2] 0x80,	 0x2
	sra	%o2,	%g5,	%o1
	fmovrsgz	%o7,	%f28,	%f21
	fmovsvs	%xcc,	%f4,	%f17
	fpadd16	%f18,	%f2,	%f8
	nop
	setx loop_977, %l0, %l1
	jmpl %l1, %o3
	tsubcc	%i3,	0x035D,	%g6
	lduh	[%l7 + 0x3E],	%l1
	andcc	%g4,	0x1A4F,	%i2
loop_977:
	movleu	%icc,	%i4,	%l2
	fbuge,a	%fcc1,	loop_978
	tsubcc	%g7,	%o6,	%o4
	movne	%xcc,	%l0,	%i5
	edge32l	%i1,	%g3,	%i6
loop_978:
	edge16	%l5,	%o0,	%l4
	sra	%g2,	0x14,	%o5
	fpack16	%f24,	%f28
	mulx	%g1,	0x073D,	%l3
	fmovrdne	%i7,	%f30,	%f30
	movrgez	%i0,	%l6,	%g5
	membar	0x6B
	flushw
	movre	%o1,	0x1B6,	%o7
	taddcc	%o2,	0x1149,	%i3
	tcc	%icc,	0x2
	bn,pn	%icc,	loop_979
	fnand	%f20,	%f14,	%f8
	lduw	[%l7 + 0x24],	%o3
	popc	0x0AF6,	%l1
loop_979:
	smulcc	%g4,	0x1FD6,	%i2
	subc	%i4,	%l2,	%g6
	wr	%g0,	0x0c,	%asi
	lduwa	[%l7 + 0x18] %asi,	%o6
	movcc	%xcc,	%o4,	%l0
	fmovsne	%icc,	%f6,	%f0
	fand	%f14,	%f14,	%f14
	fmovrse	%g7,	%f30,	%f31
	edge16	%i1,	%g3,	%i5
	tvc	%icc,	0x1
	wr	%g0,	0x18,	%asi
	lduwa	[%l7 + 0x2C] %asi,	%l5
	edge32n	%o0,	%l4,	%g2
	fmul8x16al	%f14,	%f0,	%f0
	sll	%o5,	%i6,	%l3
	edge8ln	%g1,	%i0,	%l6
	wr	%g0,	0x80,	%asi
	ldda	[%l7 + 0x40] %asi,	%g4
	sdivx	%i7,	0x146E,	%o1
	edge8ln	%o2,	%i3,	%o7
	xor	%o3,	0x0EFA,	%g4
	flushw
	bl,a,pn	%icc,	loop_980
	swap	[%l7 + 0x2C],	%l1
	fbue	%fcc2,	loop_981
	movcs	%icc,	%i4,	%l2
loop_980:
	nop
	set	0x4C, %g2
	ldswa	[%l7 + %g2] 0x19,	%i2
loop_981:
	udivcc	%o6,	0x1585,	%o4
	movgu	%icc,	%g6,	%g7
	edge8ln	%i1,	%g3,	%l0
	sethi	0x0244,	%l5
	fsrc2s	%f9,	%f3
	tn	%icc,	0x3
	fmovrsne	%i5,	%f8,	%f15
	fbg,a	%fcc0,	loop_982
	movne	%icc,	%l4,	%g2
	fbug	%fcc0,	loop_983
	andn	%o5,	%i6,	%o0
loop_982:
	nop
	set	0x50, %o6
	stx	%g1,	[%l7 + %o6]
loop_983:
	nop

	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 0:
!
!	Type l   	: 890
!	Type cti   	: 983
!	Type x   	: 426
!	Type f   	: 1386
!	Type i   	: 4315
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


	EXIT_GOOD	/* test finish  */

/************************************************************************
   Test case data start
 ************************************************************************/
.data
user_data_start:
scratch_area:
.word 0xD6FDAB49
.word 0xE5339C47
.word 0xFB15926F
.word 0x5EB19008
.word 0x1BDCFDA9
.word 0x803E92A5
.word 0x02F24A39
.word 0xAA8168F4
.word 0xA2B5C1D7
.word 0xB74FF079
.word 0x7BF9EB17
.word 0xE5218767
.word 0x3E8BAD19
.word 0x6BF50CE9
.word 0xC5BFBD80
.word 0x6FB4A51B
.word 0xA4E1FB1F
.word 0xE34A9C99
.word 0x57AA80F9
.word 0xFC606804
.word 0xF5C33C55
.word 0x4558DDE4
.word 0x4503A73D
.word 0x338B545E
.word 0xF57C54E0
.word 0x2B4E3788
.word 0x7035D47E
.word 0x8C7E74FD
.word 0xBACB0A44
.word 0xD2141C95
.word 0x68200946
.word 0x1E546A3F
.word 0xDB1C9D22
.word 0x97FB2F1A
.word 0x61A84125
.word 0xA5979872
.word 0xF6294700
.word 0x863CCA1C
.word 0x2660DFBD
.word 0x980CB6A1
.word 0xAB847226
.word 0x20B8A179
.word 0xD859130B
.word 0x7E5EE944
.word 0xAF198799
.word 0x42EAA67C
.word 0xCDCEACBD
.word 0x04F56737
.word 0xB6371747
.word 0xBFF45786
.word 0x8F1DE381
.word 0x1F64F694
.word 0x1D2FB987
.word 0xF7ECE3CB
.word 0xC14E2E36
.word 0x05488F37
.word 0x5E5AA436
.word 0xE5D6C7AB
.word 0xE0B5F572
.word 0xC9B8654C
.word 0x1E92C916
.word 0xF287BDAE
.word 0x8D3C59C9
.word 0x615F6EA6
.end
