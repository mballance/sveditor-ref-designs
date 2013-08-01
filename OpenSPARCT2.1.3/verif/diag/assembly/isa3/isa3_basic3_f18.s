/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: isa3_basic3_f18.s
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
.ident "Using Instruction Hash for Focus :$Id: isa3_basic3_f18.s,v 1.1 2007/05/11 17:22:22 drp Exp $"
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
	setx	0x1446F7689053C939,	%l0,	%l6
	stx	%l6,	[%l7 + 0x0]
	ldx	[%l7 + 0x0],	%fsr
!
! Thread 0 Start
!
main_t0:

	!# Initialize registers ..

	!# Global registers
	set	0x2,	%g1
	set	0x8,	%g2
	set	0x8,	%g3
	set	0x4,	%g4
	set	0x9,	%g5
	set	0x3,	%g6
	set	0x0,	%g7
	!# Input registers
	set	-0x9,	%i0
	set	-0x6,	%i1
	set	-0x7,	%i2
	set	-0xB,	%i3
	set	-0xA,	%i4
	set	-0x5,	%i5
	set	-0x1,	%i6
	set	-0x8,	%i7
	!# Local registers
	set	0x740B06D7,	%l0
	set	0x22EDD739,	%l1
	set	0x6D7E8DAE,	%l2
	set	0x1B33B11F,	%l3
	set	0x2212F75C,	%l4
	set	0x34003301,	%l5
	set	0x33139B5C,	%l6
	!# Output registers
	set	0x0780,	%o0
	set	0x0369,	%o1
	set	-0x070A,	%o2
	set	-0x0610,	%o3
	set	0x1CD8,	%o4
	set	-0x0126,	%o5
	set	0x0EAE,	%o6
	set	-0x05E1,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x6C426DBE11669399)
	INIT_TH_FP_REG(%l7,%f2,0x61FE36E20BC13325)
	INIT_TH_FP_REG(%l7,%f4,0xCB2711DFE81170CF)
	INIT_TH_FP_REG(%l7,%f6,0x6AD348CA08010197)
	INIT_TH_FP_REG(%l7,%f8,0x7372BA6185234CBB)
	INIT_TH_FP_REG(%l7,%f10,0x45D26C825E32FA5A)
	INIT_TH_FP_REG(%l7,%f12,0xA87B6A1723E8AB9E)
	INIT_TH_FP_REG(%l7,%f14,0xE8DE8854C3F44C3E)
	INIT_TH_FP_REG(%l7,%f16,0x4D9021FAA590134A)
	INIT_TH_FP_REG(%l7,%f18,0xA413EEC1767D83F0)
	INIT_TH_FP_REG(%l7,%f20,0xAB5973A0DAC1B2E4)
	INIT_TH_FP_REG(%l7,%f22,0xBD3F3173EBF0B474)
	INIT_TH_FP_REG(%l7,%f24,0xD5C717D9284A35BC)
	INIT_TH_FP_REG(%l7,%f26,0x3F105E31CFBA88C5)
	INIT_TH_FP_REG(%l7,%f28,0x4494827FA8272E47)
	INIT_TH_FP_REG(%l7,%f30,0x96133EE6C7BDF1B0)
	!# Other state
	
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr


	!# Execute Main Diag ..

	fcmped	%fcc3,	%f20,	%f6
	brnz,a	%o4,	loop_1
	movvc	%icc,	%g4,	%i5
	fmovde	%xcc,	%f11,	%f23
	tpos	%xcc,	0x1
loop_1:
	fbue,a	%fcc2,	loop_2
	fmovrde	%l4,	%f8,	%f18
	tcs	%icc,	0x2
	set	0x60, %i4
	ldsha	[%l7 + %i4] 0x80,	%g6
loop_2:
	edge32n	%i4,	%g1,	%i3
	fbul,a	%fcc1,	loop_3
	mulscc	%o3,	%o7,	%l5
	fmovsvs	%icc,	%f19,	%f9
	fbuge,a	%fcc2,	loop_4
loop_3:
	brgez	%l1,	loop_5
	taddcc	%l6,	%i2,	%g2
	edge8	%o5,	%i7,	%g7
loop_4:
	addccc	%g5,	%i6,	%l0
loop_5:
	nop
	wr	%g0,	0x89,	%asi
	ldxa	[%l7 + 0x30] %asi,	%l3
	fmovrsgz	%l2,	%f9,	%f19
	tsubcc	%g3,	0x0BC6,	%o1
	fmovsl	%icc,	%f13,	%f29
	fsrc2	%f30,	%f20
	ldsh	[%l7 + 0x66],	%i1
	fmovdpos	%xcc,	%f5,	%f14
	fmovs	%f27,	%f5
	fnot2s	%f22,	%f21
	bn,a	%icc,	loop_6
	nop
	set	0x28, %o1
	lduh	[%l7 + %o1],	%o0
	fmovsne	%icc,	%f1,	%f29
	udivx	%i0,	0x1AB5,	%o2
loop_6:
	edge16	%o4,	%o6,	%g4
	fandnot2	%f22,	%f4,	%f12
	fnors	%f14,	%f4,	%f11
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array16	%l4,	%g6,	%i5
	alignaddr	%i4,	%i3,	%g1
	andcc	%o7,	0x0D79,	%l5
	move	%icc,	%o3,	%l1
	addccc	%l6,	%i2,	%o5
	tgu	%xcc,	0x5
	tvc	%icc,	0x6
	wr	%g0,	0x81,	%asi
	lduba	[%l7 + 0x58] %asi,	%g2
	fmovdg	%xcc,	%f2,	%f27
	tg	%xcc,	0x4
	movvc	%icc,	%i7,	%g7
	tcc	%icc,	0x5
	array16	%i6,	%g5,	%l3
	movneg	%icc,	%l0,	%g3
	movl	%icc,	%o1,	%l2
	membar	0x48
	sll	%i1,	0x1F,	%i0
	smul	%o2,	%o0,	%o4
	tn	%icc,	0x2
	swap	[%l7 + 0x1C],	%o6
	srlx	%g4,	%g6,	%i5
	fsrc2s	%f29,	%f12
	set	0x58, %i0
	sta	%f16,	[%l7 + %i0] 0x81
	sra	%i4,	0x0A,	%i3
	std	%l4,	[%l7 + 0x28]
	edge8ln	%o7,	%g1,	%o3
	subc	%l1,	%l5,	%i2
	orn	%o5,	%g2,	%i7
	edge8l	%g7,	%i6,	%g5
	sethi	0x0CA6,	%l3
	membar	0x68
	movrgez	%l0,	0x016,	%g3
	smulcc	%o1,	%l2,	%i1
	movre	%l6,	%o2,	%o0
	subc	%o4,	%i0,	%g4
	wr	%g0,	0x88,	%asi
	ldswa	[%l7 + 0x24] %asi,	%o6
	ta	%xcc,	0x4
	brnz	%i5,	loop_7
	fble,a	%fcc1,	loop_8
	sra	%i4,	0x11,	%i3
	fbul	%fcc3,	loop_9
loop_7:
	fmovsgu	%xcc,	%f11,	%f13
loop_8:
	fxnors	%f24,	%f31,	%f11
	movrne	%l4,	%o7,	%g1
loop_9:
	bneg,a,pn	%icc,	loop_10
	tge	%xcc,	0x4
	fpadd16	%f2,	%f24,	%f10
	fmovdvs	%icc,	%f8,	%f20
loop_10:
	movcc	%xcc,	%g6,	%l1
	srax	%l5,	0x09,	%i2
	movrgz	%o5,	0x2FD,	%g2
	wr	%g0,	0x11,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	bvc	%icc,	loop_11
	fsrc2s	%f29,	%f17
	fmovdcc	%xcc,	%f26,	%f2
	movgu	%xcc,	%i7,	%o3
loop_11:
	movrne	%i6,	0x311,	%g7
	edge16l	%g5,	%l0,	%l3
	ldd	[%l7 + 0x60],	%f0
	movleu	%icc,	%o1,	%l2
	taddcc	%g3,	%l6,	%o2
	fmul8x16al	%f19,	%f10,	%f24
	brlez	%o0,	loop_12
	movcs	%xcc,	%i1,	%i0
	edge32n	%g4,	%o6,	%i5
	sra	%o4,	%i3,	%l4
loop_12:
	popc	0x1D5A,	%o7
	te	%xcc,	0x2
	fnand	%f26,	%f0,	%f4
	movcs	%icc,	%i4,	%g1
	move	%icc,	%g6,	%l5
	udivx	%l1,	0x0A85,	%o5
	edge8ln	%g2,	%i2,	%o3
	fxnor	%f6,	%f24,	%f8
	fnegs	%f2,	%f21
	xor	%i6,	%g7,	%g5
	fbuge	%fcc1,	loop_13
	subcc	%l0,	%i7,	%o1
	wr	%g0,	0x80,	%asi
	lduba	[%l7 + 0x65] %asi,	%l2
loop_13:
	movvs	%xcc,	%l3,	%g3
	addcc	%l6,	0x170E,	%o0
	edge8l	%i1,	%o2,	%i0
	tleu	%icc,	0x5
	xnor	%o6,	0x13BA,	%i5
	tvc	%xcc,	0x3
	udiv	%o4,	0x1B30,	%g4
	andn	%l4,	%o7,	%i3
	fmul8x16al	%f12,	%f12,	%f20
	tcc	%xcc,	0x0
	movge	%xcc,	%g1,	%i4
	tle	%icc,	0x7
	wr	%g0,	0x80,	%asi
	lduba	[%l7 + 0x3B] %asi,	%g6
	fmul8x16al	%f11,	%f11,	%f12
	mulscc	%l5,	%l1,	%o5
	add	%l7,	0x20,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] %asi,	%i2,	%o3
	sll	%g2,	%i6,	%g5
	mulx	%l0,	%i7,	%g7
	bvs,pn	%xcc,	loop_14
	ldsh	[%l7 + 0x34],	%o1
	smulcc	%l2,	%l3,	%g3
	movpos	%icc,	%o0,	%l6
loop_14:
	tn	%xcc,	0x1
	udivx	%i1,	0x1CB9,	%i0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	for	%f12,	%f26,	%f10
	tsubcctv	%o2,	%i5,	%o6
	bn,pt	%icc,	loop_15
	fornot2	%f20,	%f24,	%f12
	set	0x26, %o6
	lduha	[%l7 + %o6] 0x89,	%o4
loop_15:
	tcs	%icc,	0x0
	alignaddr	%l4,	%o7,	%g4
	set	0x20, %i7
	stda	%g0,	[%l7 + %i7] 0x80
	sdiv	%i3,	0x105F,	%i4
	tle	%icc,	0x7
	tl	%xcc,	0x7
	tge	%icc,	0x0
	edge8n	%l5,	%l1,	%g6
	or	%i2,	0x1F1A,	%o5
	movneg	%xcc,	%o3,	%i6
	tsubcc	%g2,	%g5,	%l0
	movpos	%xcc,	%g7,	%o1
	fsrc2s	%f8,	%f10
	lduh	[%l7 + 0x44],	%l2
	sra	%l3,	%i7,	%o0
	movvc	%xcc,	%l6,	%g3
	edge8n	%i0,	%i1,	%o2
	fcmpeq16	%f10,	%f22,	%o6
	swap	[%l7 + 0x24],	%i5
	popc	%o4,	%l4
	set	0x40, %i6
	ldda	[%l7 + %i6] 0x88,	%f16
	movcc	%xcc,	%o7,	%g4
	smul	%g1,	0x1382,	%i3
	fnegs	%f26,	%f5
	tvs	%xcc,	0x6
	taddcc	%l5,	0x1496,	%i4
	edge8	%l1,	%i2,	%g6
	smulcc	%o5,	0x07FD,	%o3
	sll	%g2,	0x19,	%i6
	orncc	%l0,	0x146A,	%g5
	tvc	%icc,	0x7
	mulx	%o1,	0x0744,	%l2
	smulcc	%l3,	%g7,	%i7
	movle	%icc,	%l6,	%o0
	edge16n	%g3,	%i0,	%i1
	movrlz	%o6,	0x1FD,	%o2
	tcc	%icc,	0x2
	popc	%i5,	%o4
	set	0x4A, %i2
	ldsba	[%l7 + %i2] 0x19,	%o7
	udiv	%g4,	0x0517,	%g1
	fxors	%f21,	%f26,	%f28
	sethi	0x0C0D,	%l4
	movrgz	%i3,	%i4,	%l1
	xnorcc	%i2,	%l5,	%g6
	wr	%g0,	0x89,	%asi
	stha	%o5,	[%l7 + 0x1E] %asi
	wr	%g0,	0x80,	%asi
	ldsba	[%l7 + 0x77] %asi,	%o3
	sth	%g2,	[%l7 + 0x5E]
	sub	%l0,	0x01C5,	%i6
	mulscc	%o1,	%l2,	%g5
	edge8n	%g7,	%l3,	%i7
	bge,a	%xcc,	loop_16
	movrgez	%o0,	%g3,	%i0
	addccc	%i1,	0x0CFE,	%l6
	fbue	%fcc3,	loop_17
loop_16:
	bge	loop_18
	edge32ln	%o2,	%o6,	%i5
	edge8	%o4,	%g4,	%g1
loop_17:
	bn	%xcc,	loop_19
loop_18:
	bn,a,pn	%icc,	loop_20
	sethi	0x1D98,	%o7
	ta	%xcc,	0x6
loop_19:
	alignaddrl	%i3,	%i4,	%l4
loop_20:
	taddcc	%i2,	%l5,	%l1
	addc	%o5,	%o3,	%g6
	fpackfix	%f14,	%f30
	xnor	%l0,	%i6,	%o1
	srax	%g2,	0x13,	%l2
	fornot1s	%f26,	%f13,	%f19
	fmovrslez	%g5,	%f15,	%f22
	tleu	%icc,	0x5
	movpos	%icc,	%l3,	%g7
	bgu	%xcc,	loop_21
	andncc	%i7,	%o0,	%g3
	membar	0x4B
	movneg	%icc,	%i1,	%l6
loop_21:
	fpmerge	%f26,	%f3,	%f28
	stb	%o2,	[%l7 + 0x15]
	tcs	%icc,	0x7
	movrgz	%o6,	0x282,	%i0
	andncc	%o4,	%i5,	%g1
	bge,a,pn	%xcc,	loop_22
	ba,a,pn	%icc,	loop_23
	and	%o7,	0x1906,	%g4
	nop
	set	0x78, %l3
	ldsw	[%l7 + %l3],	%i3
loop_22:
	fmul8sux16	%f24,	%f10,	%f20
loop_23:
	nop
	set	0x30, %l0
	lduwa	[%l7 + %l0] 0x04,	%l4
	fcmpne32	%f26,	%f6,	%i2
	movrgz	%l5,	%i4,	%l1
	bne,pt	%icc,	loop_24
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbo	%fcc2,	loop_25
	fornot2	%f12,	%f2,	%f20
loop_24:
	fors	%f27,	%f26,	%f25
	bne,pt	%xcc,	loop_26
loop_25:
	xor	%o3,	0x0612,	%o5
	xnorcc	%l0,	%g6,	%o1
	fmovse	%icc,	%f4,	%f9
loop_26:
	fones	%f10
	edge8l	%g2,	%i6,	%l2
	fmul8ulx16	%f18,	%f4,	%f24
	for	%f4,	%f8,	%f6
	sdiv	%g5,	0x1652,	%l3
	tleu	%icc,	0x2
	sth	%g7,	[%l7 + 0x0A]
	alignaddrl	%i7,	%g3,	%i1
	set	0x42, %l6
	ldsha	[%l7 + %l6] 0x18,	%l6
	fnot2	%f10,	%f30
	movn	%icc,	%o2,	%o0
	movrlez	%o6,	%o4,	%i0
	fones	%f16
	edge32l	%g1,	%i5,	%g4
	umul	%i3,	0x0E2A,	%l4
	fbge	%fcc3,	loop_27
	edge32	%o7,	%l5,	%i4
	fand	%f6,	%f6,	%f4
	brnz	%i2,	loop_28
loop_27:
	tgu	%xcc,	0x4
	xnorcc	%l1,	0x1D0A,	%o5
	add	%l7,	0x60,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%o3
	casa	[%l6] %asi,	%o3,	%g6
loop_28:
	subccc	%o1,	%g2,	%l0
	udivcc	%i6,	0x0187,	%g5
	edge32	%l3,	%l2,	%i7
	ta	%xcc,	0x3
	srl	%g3,	%g7,	%i1
	fbule,a	%fcc2,	loop_29
	array32	%o2,	%l6,	%o6
	tsubcc	%o4,	0x1B89,	%i0
	edge8ln	%g1,	%o0,	%g4
loop_29:
	tleu	%icc,	0x3
	srlx	%i3,	0x1B,	%i5
	flush	%l7 + 0x20
	alignaddrl	%o7,	%l4,	%l5
	fnors	%f25,	%f10,	%f18
	fsrc2s	%f7,	%f3
	orn	%i2,	0x06E7,	%i4
	fpsub16s	%f27,	%f10,	%f6
	edge8ln	%l1,	%o3,	%o5
	tpos	%icc,	0x2
	sir	0x1F81
	movgu	%icc,	%g6,	%g2
	smulcc	%o1,	0x08FC,	%l0
	fmovsleu	%xcc,	%f10,	%f9
	tvs	%xcc,	0x4
	edge8l	%i6,	%l3,	%l2
	xnorcc	%g5,	0x02D5,	%i7
	tge	%xcc,	0x3
	alignaddr	%g7,	%g3,	%i1
	tcs	%xcc,	0x3
	set	0x68, %g2
	ldswa	[%l7 + %g2] 0x18,	%l6
	bcs,a	%xcc,	loop_30
	edge8n	%o2,	%o4,	%o6
	array8	%g1,	%o0,	%i0
	movneg	%icc,	%g4,	%i3
loop_30:
	fbo,a	%fcc0,	loop_31
	fmovdn	%icc,	%f11,	%f21
	tne	%icc,	0x6
	orn	%i5,	0x1D9E,	%l4
loop_31:
	edge32ln	%o7,	%l5,	%i4
	sll	%l1,	%i2,	%o3
	movrgez	%o5,	0x313,	%g6
	tvc	%xcc,	0x0
	wr	%g0,	0x89,	%asi
	lda	[%l7 + 0x48] %asi,	%f13
	andcc	%o1,	%g2,	%i6
	edge16l	%l3,	%l0,	%g5
	edge16n	%l2,	%i7,	%g3
	xorcc	%i1,	0x1DAD,	%g7
	xnorcc	%l6,	%o4,	%o6
	tsubcctv	%o2,	0x0557,	%o0
	fbl,a	%fcc2,	loop_32
	orn	%g1,	%i0,	%i3
	and	%g4,	0x1A76,	%i5
	brlz,a	%l4,	loop_33
loop_32:
	sdivx	%o7,	0x0506,	%i4
	bn	%icc,	loop_34
	mulscc	%l5,	0x0A65,	%l1
loop_33:
	bvc,a,pn	%xcc,	loop_35
	fmul8x16	%f5,	%f30,	%f6
loop_34:
	xorcc	%i2,	0x1987,	%o5
	edge8l	%g6,	%o3,	%o1
loop_35:
	movrlz	%i6,	%g2,	%l0
	sll	%l3,	%l2,	%g5
	movre	%g3,	0x2CE,	%i1
	udiv	%i7,	0x02E3,	%l6
	fsrc2s	%f21,	%f23
	set	0x69, %g1
	stba	%o4,	[%l7 + %g1] 0x81
	addccc	%g7,	0x181A,	%o2
	edge8l	%o6,	%g1,	%o0
	xnor	%i3,	%g4,	%i0
	fmovrde	%l4,	%f22,	%f28
	fnand	%f30,	%f16,	%f22
	movvs	%icc,	%o7,	%i4
	movrgz	%l5,	%l1,	%i5
	array16	%i2,	%g6,	%o3
	umul	%o1,	0x1638,	%o5
	bvs	loop_36
	tn	%xcc,	0x2
	tcc	%icc,	0x7
	udivx	%g2,	0x09AA,	%i6
loop_36:
	umul	%l3,	%l0,	%g5
	taddcctv	%g3,	0x180C,	%i1
	fnot1s	%f27,	%f30
	fcmped	%fcc0,	%f30,	%f26
	subc	%i7,	%l6,	%l2
	tl	%xcc,	0x4
	fnot2	%f16,	%f26
	fmovrse	%g7,	%f16,	%f1
	edge8ln	%o2,	%o4,	%g1
	bcs,a	loop_37
	fsrc2s	%f19,	%f27
	te	%xcc,	0x3
	edge8l	%o6,	%i3,	%g4
loop_37:
	tleu	%xcc,	0x4
	movn	%icc,	%i0,	%l4
	ba,a	%xcc,	loop_38
	tvs	%icc,	0x4
	movne	%xcc,	%o7,	%i4
	movrlz	%o0,	0x203,	%l5
loop_38:
	andn	%l1,	0x140A,	%i2
	movvs	%xcc,	%i5,	%g6
	ta	%xcc,	0x7
	tvc	%xcc,	0x4
	sethi	0x189C,	%o3
	tgu	%icc,	0x6
	call	loop_39
	stw	%o1,	[%l7 + 0x44]
	bl,a,pn	%icc,	loop_40
	fmovdle	%icc,	%f7,	%f20
loop_39:
	subcc	%o5,	%g2,	%l3
	bl	loop_41
loop_40:
	tneg	%icc,	0x7
	sth	%i6,	[%l7 + 0x7A]
	smul	%g5,	%g3,	%l0
loop_41:
	movvc	%icc,	%i7,	%l6
	xnorcc	%i1,	0x1C7F,	%g7
	ldsw	[%l7 + 0x10],	%l2
	ta	%xcc,	0x1
	fcmpne16	%f26,	%f16,	%o2
	fpmerge	%f24,	%f0,	%f24
	ldstub	[%l7 + 0x34],	%g1
	ld	[%l7 + 0x6C],	%f18
	set	0x6E, %o2
	ldstuba	[%l7 + %o2] 0x19,	%o4
	edge16ln	%o6,	%i3,	%i0
	taddcc	%g4,	0x1659,	%l4
	bl,a	loop_42
	tgu	%icc,	0x3
	fandnot2s	%f26,	%f1,	%f21
	fmovsge	%icc,	%f15,	%f22
loop_42:
	flush	%l7 + 0x50
	movrlez	%o7,	0x366,	%o0
	brgez,a	%i4,	loop_43
	sethi	0x0418,	%l1
	bpos,a,pn	%xcc,	loop_44
	bcc,pn	%xcc,	loop_45
loop_43:
	smulcc	%i2,	%l5,	%g6
	movl	%icc,	%i5,	%o3
loop_44:
	edge8n	%o5,	%o1,	%l3
loop_45:
	fandnot1s	%f26,	%f4,	%f26
	smulcc	%i6,	0x1641,	%g5
	brgz	%g2,	loop_46
	fandnot1	%f14,	%f12,	%f6
	sdivcc	%l0,	0x0060,	%i7
	xnor	%g3,	0x0B11,	%l6
loop_46:
	fmovrdne	%g7,	%f18,	%f16
	subc	%i1,	%o2,	%g1
	edge16ln	%l2,	%o4,	%o6
	edge8	%i3,	%i0,	%l4
	movrlz	%o7,	%o0,	%g4
	bvc	loop_47
	movrne	%i4,	0x16D,	%l1
	alignaddr	%i2,	%g6,	%i5
	edge16	%l5,	%o5,	%o3
loop_47:
	udiv	%l3,	0x0042,	%o1
	orncc	%g5,	0x080E,	%i6
	sdivcc	%l0,	0x1D42,	%g2
	set	0x14, %l4
	lduwa	[%l7 + %l4] 0x80,	%i7
	set	0x40, %l1
	stxa	%g3,	[%l7 + %l1] 0x88
	siam	0x5
	subc	%l6,	%i1,	%o2
	tle	%icc,	0x7
	smulcc	%g7,	%l2,	%o4
	edge32	%o6,	%g1,	%i0
	and	%i3,	0x0494,	%l4
	movpos	%icc,	%o7,	%g4
	wr	%g0,	0x88,	%asi
	ldsba	[%l7 + 0x5D] %asi,	%i4
	addcc	%o0,	0x0DDE,	%l1
	fmovdleu	%xcc,	%f6,	%f16
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tge	%icc,	0x1
	sra	%i2,	0x0E,	%g6
	pdist	%f24,	%f14,	%f8
	orcc	%i5,	%l5,	%o5
	smul	%o3,	%o1,	%l3
	edge32n	%i6,	%g5,	%g2
	movneg	%xcc,	%i7,	%g3
	stb	%l6,	[%l7 + 0x24]
	edge16n	%i1,	%l0,	%o2
	array32	%l2,	%g7,	%o6
	umulcc	%g1,	0x13E1,	%i0
	edge8ln	%i3,	%l4,	%o4
	edge16n	%o7,	%i4,	%g4
	movrgez	%l1,	0x19E,	%i2
	fmovrsgz	%g6,	%f15,	%f15
	fbug,a	%fcc1,	loop_48
	fmovscc	%xcc,	%f1,	%f23
	ldsb	[%l7 + 0x4C],	%i5
	tvs	%icc,	0x7
loop_48:
	ld	[%l7 + 0x5C],	%f21
	lduh	[%l7 + 0x66],	%l5
	tneg	%xcc,	0x6
	movcc	%xcc,	%o0,	%o5
	udivx	%o3,	0x09CC,	%l3
	tleu	%icc,	0x5
	add	%i6,	%g5,	%g2
	andn	%o1,	0x10AB,	%i7
	alignaddr	%g3,	%i1,	%l6
	sllx	%o2,	0x05,	%l0
	ldstub	[%l7 + 0x57],	%l2
	movg	%xcc,	%o6,	%g7
	ldx	[%l7 + 0x50],	%i0
	edge8n	%g1,	%l4,	%o4
	fmovsleu	%icc,	%f17,	%f22
	sll	%o7,	0x02,	%i4
	brlz,a	%g4,	loop_49
	taddcc	%l1,	0x121D,	%i2
	edge8l	%i3,	%g6,	%l5
	edge32ln	%i5,	%o5,	%o0
loop_49:
	movleu	%icc,	%o3,	%l3
	fxnors	%f15,	%f16,	%f27
	ldsh	[%l7 + 0x64],	%g5
	fmovrslez	%g2,	%f4,	%f12
	fbn,a	%fcc2,	loop_50
	ldsh	[%l7 + 0x5E],	%i6
	edge16n	%i7,	%o1,	%g3
	tsubcc	%i1,	%o2,	%l6
loop_50:
	movrgez	%l2,	%l0,	%g7
	bcs,a,pt	%xcc,	loop_51
	tvs	%xcc,	0x4
	faligndata	%f0,	%f20,	%f2
	fpack32	%f14,	%f2,	%f4
loop_51:
	movrgz	%i0,	%o6,	%g1
	stx	%l4,	[%l7 + 0x50]
	mulscc	%o4,	0x1937,	%i4
	smulcc	%o7,	%l1,	%g4
	wr	%g0,	0x2b,	%asi
	stxa	%i2,	[%l7 + 0x70] %asi
	membar	#Sync
	andcc	%g6,	0x06C9,	%l5
	bcs,pn	%xcc,	loop_52
	ldx	[%l7 + 0x70],	%i5
	fxors	%f1,	%f22,	%f18
	tge	%icc,	0x0
loop_52:
	edge16ln	%i3,	%o0,	%o3
	edge8ln	%l3,	%g5,	%g2
	ta	%xcc,	0x7
	tgu	%icc,	0x7
	tgu	%icc,	0x7
	edge32ln	%i6,	%i7,	%o1
	orn	%o5,	%g3,	%i1
	edge32n	%l6,	%l2,	%o2
	sir	0x16D8
	or	%l0,	%g7,	%i0
	andncc	%o6,	%g1,	%o4
	subcc	%i4,	0x0AB3,	%l4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tvs	%xcc,	0x6
	wr	%g0,	0x89,	%asi
	lduwa	[%l7 + 0x38] %asi,	%l1
	movvc	%xcc,	%o7,	%i2
	bcs	%icc,	loop_53
	fmovdn	%icc,	%f23,	%f9
	umulcc	%g6,	0x0D64,	%l5
	and	%i5,	%i3,	%g4
loop_53:
	tle	%xcc,	0x7
	edge16	%o3,	%l3,	%o0
	add	%g2,	%g5,	%i7
	fbue	%fcc0,	loop_54
	edge8n	%i6,	%o5,	%g3
	bl,a,pt	%icc,	loop_55
	fbul	%fcc1,	loop_56
loop_54:
	array8	%o1,	%i1,	%l2
	bpos,pt	%icc,	loop_57
loop_55:
	movvs	%icc,	%o2,	%l6
loop_56:
	stx	%g7,	[%l7 + 0x58]
	movn	%xcc,	%l0,	%i0
loop_57:
	fbuge,a	%fcc3,	loop_58
	sethi	0x13B0,	%o6
	fbue,a	%fcc1,	loop_59
	srl	%g1,	%o4,	%l4
loop_58:
	andn	%l1,	0x0F37,	%i4
	fpackfix	%f20,	%f4
loop_59:
	fnegd	%f26,	%f6
	sub	%i2,	0x0E3F,	%o7
	ta	%icc,	0x3
	movl	%icc,	%l5,	%i5
	add	%g6,	%i3,	%g4
	wr	%g0,	0x80,	%asi
	ldswa	[%l7 + 0x18] %asi,	%l3
	siam	0x7
	sir	0x08D6
	tge	%icc,	0x1
	nop
	setx loop_60, %l0, %l1
	jmpl %l1, %o0
	tvc	%icc,	0x4
	or	%g2,	%o3,	%g5
	tsubcc	%i6,	%o5,	%g3
loop_60:
	sir	0x116B
	subcc	%o1,	%i7,	%i1
	bge	loop_61
	tcc	%xcc,	0x7
	tcs	%xcc,	0x4
	edge8n	%l2,	%l6,	%g7
loop_61:
	addccc	%o2,	%l0,	%o6
	addc	%g1,	0x12B3,	%i0
	movrgez	%o4,	%l1,	%i4
	movne	%xcc,	%l4,	%o7
	tvc	%xcc,	0x2
	fandnot2s	%f10,	%f9,	%f19
	smul	%l5,	0x0C69,	%i5
	fmovsneg	%icc,	%f7,	%f29
	bcc,a	loop_62
	tne	%icc,	0x3
	array32	%i2,	%g6,	%g4
	fpack16	%f10,	%f0
loop_62:
	stbar
	tsubcctv	%l3,	0x0192,	%i3
	subccc	%g2,	0x148F,	%o0
	membar	0x4D
	fble	%fcc2,	loop_63
	smulcc	%g5,	0x1E2E,	%o3
	movn	%xcc,	%i6,	%g3
	fpack32	%f20,	%f16,	%f6
loop_63:
	sll	%o1,	0x13,	%i7
	fandnot1	%f0,	%f6,	%f4
	edge8n	%i1,	%l2,	%l6
	movg	%xcc,	%g7,	%o5
	edge8n	%o2,	%l0,	%o6
	tge	%xcc,	0x5
	fmovsvc	%icc,	%f19,	%f30
	set	0x24, %o4
	swapa	[%l7 + %o4] 0x88,	%i0
	bgu,a,pn	%xcc,	loop_64
	fmovd	%f6,	%f8
	movpos	%icc,	%g1,	%o4
	bneg,pt	%icc,	loop_65
loop_64:
	fmovsge	%icc,	%f7,	%f5
	ta	%icc,	0x3
	tge	%icc,	0x0
loop_65:
	taddcc	%l1,	0x0C85,	%l4
	fmovdg	%icc,	%f0,	%f2
	subc	%o7,	%i4,	%i5
	brgz,a	%l5,	loop_66
	membar	0x27
	tleu	%xcc,	0x7
	mulx	%g6,	0x027E,	%i2
loop_66:
	movl	%icc,	%g4,	%i3
	alignaddrl	%g2,	%l3,	%g5
	taddcctv	%o3,	0x0971,	%o0
	fand	%f12,	%f8,	%f4
	fmovdleu	%xcc,	%f22,	%f2
	ta	%xcc,	0x1
	ble,pt	%xcc,	loop_67
	fmovscc	%icc,	%f22,	%f7
	tle	%xcc,	0x4
	tcs	%xcc,	0x4
loop_67:
	te	%xcc,	0x0
	ld	[%l7 + 0x40],	%f19
	be,pt	%xcc,	loop_68
	tn	%xcc,	0x2
	bn,a,pn	%xcc,	loop_69
	fmovdneg	%icc,	%f27,	%f21
loop_68:
	srlx	%i6,	0x18,	%g3
	subcc	%o1,	%i7,	%i1
loop_69:
	tgu	%icc,	0x3
	taddcctv	%l2,	0x1648,	%l6
	tn	%xcc,	0x7
	movre	%g7,	%o2,	%l0
	mulx	%o5,	0x00B5,	%o6
	fmovrslez	%g1,	%f28,	%f18
	mova	%icc,	%o4,	%i0
	bpos,pt	%icc,	loop_70
	movrgez	%l4,	%o7,	%l1
	brgez	%i4,	loop_71
	sll	%l5,	%i5,	%g6
loop_70:
	tcc	%icc,	0x0
	bl,a,pn	%xcc,	loop_72
loop_71:
	fbn	%fcc2,	loop_73
	fands	%f20,	%f7,	%f23
	xor	%g4,	0x17CD,	%i3
loop_72:
	xnor	%g2,	%l3,	%g5
loop_73:
	bcc,a,pn	%xcc,	loop_74
	sub	%i2,	0x1839,	%o3
	xnorcc	%i6,	0x19DD,	%o0
	addccc	%g3,	0x1B16,	%i7
loop_74:
	fbue	%fcc2,	loop_75
	fnors	%f6,	%f5,	%f14
	ta	%xcc,	0x3
	and	%i1,	%o1,	%l6
loop_75:
	fmovdpos	%icc,	%f3,	%f22
	set	0x1E, %o7
	lduha	[%l7 + %o7] 0x04,	%l2
	ta	%xcc,	0x7
	fbe	%fcc1,	loop_76
	fexpand	%f22,	%f24
	taddcc	%o2,	%l0,	%o5
	fsrc2s	%f27,	%f5
loop_76:
	nop
	wr	%g0,	0x80,	%asi
	stha	%g7,	[%l7 + 0x4C] %asi
	fbn	%fcc1,	loop_77
	movle	%icc,	%o6,	%g1
	movleu	%xcc,	%i0,	%l4
	bn	loop_78
loop_77:
	edge32l	%o7,	%o4,	%l1
	ta	%xcc,	0x1
	swap	[%l7 + 0x38],	%i4
loop_78:
	be,pt	%icc,	loop_79
	bcc,a,pn	%icc,	loop_80
	tge	%xcc,	0x5
	set	0x18, %g7
	lda	[%l7 + %g7] 0x15,	%f29
loop_79:
	fbl,a	%fcc1,	loop_81
loop_80:
	and	%i5,	0x09E1,	%g6
	movge	%icc,	%l5,	%i3
	popc	0x1895,	%g2
loop_81:
	subcc	%g4,	%g5,	%i2
	movrne	%l3,	0x08E,	%o3
	fmovrdgz	%o0,	%f8,	%f28
	movvs	%xcc,	%i6,	%g3
	sdiv	%i7,	0x13A9,	%i1
	alignaddr	%o1,	%l2,	%l6
	movgu	%icc,	%l0,	%o2
	bgu,pn	%xcc,	loop_82
	fnot1	%f28,	%f4
	nop
	set	0x78, %g3
	ldx	[%l7 + %g3],	%o5
	sllx	%o6,	%g1,	%g7
loop_82:
	ta	%xcc,	0x5
	fmovdneg	%xcc,	%f30,	%f9
	ldub	[%l7 + 0x78],	%i0
	tvs	%xcc,	0x4
	movcs	%icc,	%l4,	%o7
	smul	%l1,	%o4,	%i4
	ldsb	[%l7 + 0x5F],	%i5
	fnors	%f9,	%f14,	%f26
	membar	0x53
	array16	%g6,	%l5,	%i3
	fmovsge	%xcc,	%f4,	%f9
	taddcc	%g4,	%g5,	%g2
	sdivcc	%l3,	0x1D9B,	%i2
	movle	%xcc,	%o0,	%o3
	tneg	%icc,	0x2
	subccc	%g3,	0x17CF,	%i6
	fornot1s	%f20,	%f25,	%f30
	udivx	%i1,	0x0F6F,	%o1
	orcc	%i7,	%l6,	%l2
	sdivx	%o2,	0x18E2,	%o5
	sdiv	%o6,	0x12D6,	%g1
	subccc	%g7,	0x0BAE,	%i0
	movrlz	%l0,	0x2C0,	%o7
	andcc	%l4,	0x1717,	%o4
	srlx	%i4,	%i5,	%g6
	addcc	%l1,	0x061E,	%i3
	movrlez	%l5,	0x0CF,	%g4
	fpmerge	%f25,	%f22,	%f12
	fmovrse	%g5,	%f31,	%f2
	sir	0x0A52
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orncc	%g2,	0x098B,	%i2
	std	%l2,	[%l7 + 0x60]
	fnegs	%f17,	%f12
	add	%o0,	0x0803,	%g3
	wr	%g0,	0x10,	%asi
	lda	[%l7 + 0x40] %asi,	%f12
	smulcc	%i6,	%i1,	%o1
	fmul8x16al	%f20,	%f12,	%f14
	fmovsn	%xcc,	%f14,	%f14
	taddcctv	%o3,	%i7,	%l6
	set	0x20, %g5
	ldda	[%l7 + %g5] 0x23,	%l2
	wr	%g0,	0x18,	%asi
	ldsha	[%l7 + 0x3A] %asi,	%o5
	fmovdn	%xcc,	%f20,	%f10
	movge	%icc,	%o2,	%o6
	ldsw	[%l7 + 0x24],	%g7
	fabss	%f7,	%f29
	edge32n	%g1,	%l0,	%i0
	fmovsvc	%xcc,	%f2,	%f18
	orn	%l4,	0x1AA9,	%o7
	xnorcc	%i4,	0x0E1F,	%i5
	sdivcc	%o4,	0x1279,	%l1
	movne	%icc,	%i3,	%l5
	fmovdn	%icc,	%f23,	%f19
	set	0x2C, %o5
	lda	[%l7 + %o5] 0x88,	%f7
	fmovdvc	%icc,	%f4,	%f30
	wr	%g0,	0x88,	%asi
	ldstuba	[%l7 + 0x20] %asi,	%g4
	fmovrdgz	%g6,	%f10,	%f4
	fxor	%f30,	%f28,	%f16
	movleu	%xcc,	%g2,	%i2
	addc	%g5,	0x1A62,	%l3
	movrgez	%g3,	0x12A,	%i6
	sll	%o0,	%i1,	%o1
	fmovd	%f28,	%f28
	ldd	[%l7 + 0x68],	%f6
	fzero	%f18
	sub	%o3,	%i7,	%l2
	set	0x77, %l2
	lduba	[%l7 + %l2] 0x11,	%o5
	wr	%g0,	0x89,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	movrlez	%o2,	%o6,	%g7
	andncc	%l6,	%g1,	%l0
	ldub	[%l7 + 0x52],	%i0
	or	%o7,	%l4,	%i4
	edge32	%o4,	%i5,	%l1
	fmovrde	%i3,	%f12,	%f14
	udivcc	%g4,	0x1315,	%l5
	fbge,a	%fcc3,	loop_83
	fmovsleu	%xcc,	%f28,	%f10
	fmovse	%xcc,	%f27,	%f21
	edge16	%g2,	%i2,	%g5
loop_83:
	edge32	%g6,	%l3,	%i6
	or	%o0,	%g3,	%o1
	fnegs	%f1,	%f14
	edge16l	%i1,	%o3,	%i7
	fmovd	%f30,	%f24
	set	0x0B, %o0
	ldstuba	[%l7 + %o0] 0x04,	%l2
	bcc,a,pn	%icc,	loop_84
	tcc	%icc,	0x7
	set	0x40, %g4
	ldxa	[%l7 + %g4] 0x89,	%o5
loop_84:
	fnegs	%f23,	%f6
	subc	%o2,	%o6,	%l6
	fbul,a	%fcc0,	loop_85
	edge8n	%g1,	%l0,	%g7
	subc	%i0,	%l4,	%o7
	fpsub32s	%f30,	%f19,	%f4
loop_85:
	tgu	%icc,	0x7
	tn	%xcc,	0x1
	movneg	%icc,	%i4,	%i5
	nop
	setx	loop_86,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tvc	%xcc,	0x7
	add	%l1,	0x00E2,	%i3
	fzeros	%f28
loop_86:
	movcs	%icc,	%o4,	%g4
	wr	%g0,	0x23,	%asi
	ldda	[%l7 + 0x10] %asi,	%g2
	and	%i2,	%l5,	%g6
	set	0x64, %i3
	lda	[%l7 + %i3] 0x14,	%f14
	bcc	loop_87
	fcmple32	%f22,	%f24,	%l3
	fornot2s	%f10,	%f6,	%f3
	bg	%xcc,	loop_88
loop_87:
	andn	%g5,	0x0595,	%i6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	or	%o0,	0x19E5,	%o1
loop_88:
	sub	%g3,	0x1A97,	%i1
	fblg	%fcc1,	loop_89
	srax	%i7,	%o3,	%o5
	movpos	%xcc,	%o2,	%l2
	edge32l	%l6,	%o6,	%l0
loop_89:
	fmovdvc	%icc,	%f0,	%f19
	movrlz	%g1,	%g7,	%i0
	srax	%l4,	0x08,	%i4
	bpos,a,pt	%icc,	loop_90
	edge16ln	%o7,	%l1,	%i3
	fmovs	%f5,	%f11
	addc	%o4,	%i5,	%g2
loop_90:
	mulscc	%i2,	0x147E,	%g4
	edge8	%g6,	%l5,	%l3
	and	%g5,	0x02F9,	%o0
	wr	%g0,	0x89,	%asi
	swapa	[%l7 + 0x24] %asi,	%o1
	set	0x24, %g6
	stwa	%i6,	[%l7 + %g6] 0x23
	membar	#Sync
	tsubcc	%i1,	%g3,	%i7
	umul	%o3,	%o2,	%l2
	ta	%xcc,	0x5
	fblg,a	%fcc2,	loop_91
	brlez,a	%o5,	loop_92
	std	%o6,	[%l7 + 0x58]
	edge16l	%l6,	%g1,	%l0
loop_91:
	nop
	wr	%g0,	0x80,	%asi
	ldswa	[%l7 + 0x38] %asi,	%i0
loop_92:
	subc	%l4,	%g7,	%i4
	wr	%g0,	0x88,	%asi
	ldxa	[%l7 + 0x70] %asi,	%o7
	bg,pn	%xcc,	loop_93
	edge8	%i3,	%o4,	%l1
	fnegd	%f0,	%f14
	fzeros	%f16
loop_93:
	fmovrse	%i5,	%f30,	%f17
	taddcctv	%i2,	%g2,	%g4
	bpos,a,pn	%xcc,	loop_94
	fnot1	%f8,	%f18
	movrne	%g6,	%l5,	%l3
	edge16n	%g5,	%o0,	%i6
loop_94:
	brnz,a	%o1,	loop_95
	movpos	%icc,	%g3,	%i7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpsub32	%f12,	%f2,	%f12
loop_95:
	tvs	%icc,	0x5
	andcc	%o3,	%o2,	%l2
	wr	%g0,	0xf0,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
	edge8l	%o5,	%o6,	%i1
	ldub	[%l7 + 0x2A],	%g1
	set	0x54, %i1
	swapa	[%l7 + %i1] 0x80,	%l0
	move	%icc,	%l6,	%i0
	ldstub	[%l7 + 0x45],	%g7
	movpos	%icc,	%i4,	%o7
	array32	%i3,	%l4,	%l1
	bvc	loop_96
	fpsub16s	%f18,	%f9,	%f14
	stb	%o4,	[%l7 + 0x1C]
	movvc	%icc,	%i2,	%i5
loop_96:
	array16	%g4,	%g6,	%l5
	sdivx	%l3,	0x1F33,	%g2
	nop
	setx	loop_97,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fones	%f11
	movl	%icc,	%o0,	%i6
	set	0x40, %l5
	stda	%f16,	[%l7 + %l5] 0x18
loop_97:
	fmovsge	%icc,	%f10,	%f8
	tgu	%xcc,	0x1
	or	%o1,	%g5,	%i7
	mova	%xcc,	%o3,	%g3
	addcc	%o2,	%o5,	%l2
	fnegd	%f10,	%f16
	fmovsvs	%icc,	%f5,	%f22
	bpos	loop_98
	orncc	%o6,	0x17E2,	%g1
	array8	%i1,	%l6,	%i0
	fbn,a	%fcc1,	loop_99
loop_98:
	bvs,pn	%icc,	loop_100
	edge32ln	%l0,	%i4,	%o7
	wr	%g0,	0x89,	%asi
	ldxa	[%l7 + 0x38] %asi,	%i3
loop_99:
	sdivcc	%g7,	0x0ABB,	%l1
loop_100:
	fmovrse	%l4,	%f7,	%f24
	siam	0x3
	movneg	%icc,	%i2,	%i5
	fmovdcs	%icc,	%f7,	%f0
	edge32l	%o4,	%g4,	%g6
	tsubcc	%l3,	%l5,	%g2
	wr	%g0,	0x19,	%asi
	sta	%f4,	[%l7 + 0x10] %asi
	smul	%o0,	%i6,	%g5
	fsrc2s	%f1,	%f1
	nop
	set	0x08, %i5
	std	%i6,	[%l7 + %i5]
	fble	%fcc3,	loop_101
	ta	%icc,	0x4
	movrgz	%o3,	%o1,	%g3
	alignaddrl	%o2,	%l2,	%o5
loop_101:
	tsubcc	%g1,	0x02B1,	%i1
	sethi	0x0EC0,	%l6
	tvs	%icc,	0x7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	popc	%i0,	%l0
	stx	%o6,	[%l7 + 0x68]
	membar	0x04
	edge8	%o7,	%i3,	%g7
	umul	%i4,	%l1,	%i2
	edge16	%i5,	%l4,	%o4
	movne	%xcc,	%g4,	%l3
	sub	%l5,	0x0FDB,	%g2
	movvc	%icc,	%g6,	%i6
	addcc	%o0,	0x16FC,	%i7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movcs	%xcc,	%o3,	%o1
	edge8l	%g5,	%g3,	%l2
	fmovdvc	%xcc,	%f9,	%f23
	mulx	%o2,	%g1,	%o5
	fpadd32s	%f14,	%f13,	%f30
	edge32ln	%i1,	%i0,	%l6
	udiv	%l0,	0x044A,	%o7
	sdivcc	%o6,	0x1E3B,	%g7
	fbug,a	%fcc0,	loop_102
	tsubcc	%i3,	%l1,	%i2
	srlx	%i4,	0x0F,	%i5
	tg	%xcc,	0x7
loop_102:
	movne	%icc,	%o4,	%l4
	move	%xcc,	%l3,	%g4
	movvc	%icc,	%g2,	%g6
	addc	%i6,	0x1C50,	%o0
	nop
	setx loop_103, %l0, %l1
	jmpl %l1, %l5
	ta	%icc,	0x3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ta	%xcc,	0x3
loop_103:
	te	%xcc,	0x6
	udivx	%i7,	0x01DC,	%o1
	siam	0x6
	lduw	[%l7 + 0x68],	%o3
	edge16n	%g5,	%l2,	%o2
	alignaddrl	%g1,	%o5,	%i1
	array8	%i0,	%l6,	%l0
	udiv	%o7,	0x1085,	%o6
	movvc	%icc,	%g7,	%i3
	fmovrse	%l1,	%f28,	%f9
	fmovrslz	%g3,	%f14,	%f27
	brgez	%i4,	loop_104
	te	%icc,	0x1
	nop
	setx	loop_105,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movle	%xcc,	%i2,	%i5
loop_104:
	move	%icc,	%l4,	%l3
	fmovrse	%o4,	%f4,	%f28
loop_105:
	fbn	%fcc3,	loop_106
	std	%g4,	[%l7 + 0x08]
	fsrc1	%f20,	%f16
	fzero	%f30
loop_106:
	edge32n	%g2,	%i6,	%g6
	movre	%l5,	%i7,	%o1
	pdist	%f6,	%f10,	%f28
	wr	%g0,	0x18,	%asi
	ldsha	[%l7 + 0x76] %asi,	%o0
	fbo	%fcc1,	loop_107
	move	%xcc,	%o3,	%l2
	sir	0x1F48
	mulx	%o2,	%g5,	%g1
loop_107:
	fnot1s	%f13,	%f13
	fxors	%f0,	%f27,	%f7
	fpmerge	%f31,	%f18,	%f20
	brgz,a	%o5,	loop_108
	stbar
	movvs	%xcc,	%i0,	%i1
	set	0x58, %i4
	prefetcha	[%l7 + %i4] 0x11,	 0x2
loop_108:
	sra	%l6,	%o6,	%g7
	andn	%i3,	0x0812,	%l1
	bshuffle	%f18,	%f26,	%f16
	fandnot2s	%f22,	%f28,	%f2
	brz	%g3,	loop_109
	fzeros	%f9
	tcc	%icc,	0x1
	call	loop_110
loop_109:
	subccc	%i4,	0x0A8F,	%o7
	tge	%icc,	0x2
	stbar
loop_110:
	edge8ln	%i2,	%i5,	%l3
	udiv	%l4,	0x15FF,	%g4
	andcc	%o4,	%i6,	%g2
	edge32	%g6,	%l5,	%o1
	te	%icc,	0x1
	movvc	%icc,	%o0,	%o3
	brz	%l2,	loop_111
	fxnor	%f24,	%f12,	%f26
	srax	%i7,	%g5,	%o2
	fmovrdgez	%o5,	%f8,	%f0
loop_111:
	nop
	add	%l7,	0x54,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%i0,	%g1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ble,a,pt	%icc,	loop_112
	fbug,a	%fcc0,	loop_113
	sdivcc	%l0,	0x172D,	%i1
	fors	%f13,	%f30,	%f25
loop_112:
	sdivcc	%o6,	0x05A5,	%l6
loop_113:
	fpsub32	%f24,	%f6,	%f2
	tge	%icc,	0x7
	tvc	%icc,	0x0
	fmuld8sux16	%f31,	%f15,	%f20
	wr	%g0,	0x10,	%asi
	prefetcha	[%l7 + 0x28] %asi,	 0x0
	tcs	%xcc,	0x3
	edge32ln	%l1,	%i3,	%i4
	tl	%xcc,	0x5
	sdivx	%g3,	0x1EEF,	%i2
	nop
	setx	loop_114,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	ldd	[%l7 + 0x58],	%o6
	nop
	setx loop_115, %l0, %l1
	jmpl %l1, %l3
	bcc,pt	%icc,	loop_116
loop_114:
	fbne	%fcc1,	loop_117
	ldstub	[%l7 + 0x2C],	%i5
loop_115:
	sub	%l4,	%o4,	%i6
loop_116:
	tpos	%icc,	0x2
loop_117:
	tne	%icc,	0x1
	te	%xcc,	0x0
	set	0x56, %o3
	ldsba	[%l7 + %o3] 0x89,	%g4
	edge8n	%g6,	%g2,	%l5
	fnegs	%f27,	%f6
	srl	%o1,	0x09,	%o0
	tsubcc	%o3,	0x1287,	%i7
	subccc	%l2,	%g5,	%o5
	fmovdle	%xcc,	%f26,	%f3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movleu	%xcc,	%o2,	%i0
	bshuffle	%f16,	%f16,	%f28
	alignaddrl	%l0,	%g1,	%i1
	mulx	%l6,	%o6,	%l1
	fmovrse	%i3,	%f19,	%f15
	stbar
	wr	%g0,	0x89,	%asi
	lda	[%l7 + 0x64] %asi,	%f23
	fmovsvc	%icc,	%f17,	%f6
	fcmpne32	%f18,	%f30,	%i4
	edge8ln	%g3,	%i2,	%g7
	alignaddr	%l3,	%i5,	%l4
	std	%f30,	[%l7 + 0x58]
	ld	[%l7 + 0x44],	%f13
	fmovscc	%icc,	%f14,	%f21
	umul	%o7,	%i6,	%o4
	set	0x64, %o1
	swapa	[%l7 + %o1] 0x04,	%g4
	brgz	%g6,	loop_118
	fexpand	%f28,	%f24
	set	0x44, %i0
	sta	%f11,	[%l7 + %i0] 0x81
loop_118:
	udivcc	%l5,	0x19E7,	%g2
	fcmple16	%f18,	%f18,	%o1
	tneg	%icc,	0x4
	tne	%icc,	0x2
	udiv	%o0,	0x15F7,	%i7
	sll	%l2,	0x1C,	%g5
	movre	%o3,	%o5,	%i0
	smulcc	%l0,	%g1,	%i1
	movrgz	%l6,	0x0AF,	%o2
	orcc	%o6,	0x1EA5,	%i3
	bvs	%icc,	loop_119
	movrne	%i4,	%g3,	%i2
	edge16	%l1,	%g7,	%i5
	fmul8x16al	%f5,	%f30,	%f12
loop_119:
	movge	%icc,	%l3,	%l4
	array8	%o7,	%i6,	%o4
	movrgz	%g4,	0x379,	%g6
	alignaddrl	%l5,	%o1,	%g2
	wr	%g0,	0x89,	%asi
	prefetcha	[%l7 + 0x20] %asi,	 0x2
	tne	%xcc,	0x1
	fmovdge	%xcc,	%f0,	%f31
	andncc	%l2,	%g5,	%i7
	sll	%o5,	%o3,	%l0
	wr	%g0,	0x17,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
	ta	%xcc,	0x4
	umul	%g1,	%i1,	%i0
	set	0x40, %o6
	stda	%f16,	[%l7 + %o6] 0xf1
	membar	#Sync
	brnz,a	%l6,	loop_120
	bgu,a	%xcc,	loop_121
	fmuld8sux16	%f15,	%f14,	%f2
	fmovrslez	%o6,	%f17,	%f17
loop_120:
	sth	%o2,	[%l7 + 0x38]
loop_121:
	edge32l	%i3,	%i4,	%g3
	edge8n	%l1,	%g7,	%i5
	andn	%l3,	%i2,	%o7
	wr	%g0,	0x19,	%asi
	sta	%f5,	[%l7 + 0x44] %asi
	umulcc	%l4,	0x0BF0,	%i6
	fmovdvs	%icc,	%f25,	%f16
	bvc,a	loop_122
	nop
	setx loop_123, %l0, %l1
	jmpl %l1, %g4
	tsubcc	%o4,	%l5,	%o1
	movneg	%xcc,	%g2,	%g6
loop_122:
	nop
	setx	loop_124,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_123:
	tn	%icc,	0x6
	movrgz	%l2,	%g5,	%o0
	movre	%o5,	%o3,	%i7
loop_124:
	stw	%g1,	[%l7 + 0x10]
	sdivx	%l0,	0x13D5,	%i1
	be	loop_125
	xnorcc	%l6,	%i0,	%o6
	movvs	%icc,	%i3,	%i4
	set	0x30, %i6
	stha	%g3,	[%l7 + %i6] 0x2b
	membar	#Sync
loop_125:
	tle	%icc,	0x1
	udiv	%o2,	0x0772,	%g7
	andncc	%l1,	%i5,	%l3
	ldstub	[%l7 + 0x6A],	%i2
	movle	%icc,	%o7,	%i6
	fmul8ulx16	%f22,	%f30,	%f4
	fpackfix	%f20,	%f1
	tne	%xcc,	0x4
	stb	%g4,	[%l7 + 0x74]
	movcs	%xcc,	%l4,	%o4
	popc	%l5,	%o1
	movg	%xcc,	%g6,	%g2
	fbug,a	%fcc1,	loop_126
	edge8ln	%l2,	%g5,	%o0
	sdiv	%o3,	0x01D3,	%i7
	wr	%g0,	0x19,	%asi
	ldxa	[%l7 + 0x10] %asi,	%g1
loop_126:
	ldsw	[%l7 + 0x50],	%l0
	fmovrslez	%i1,	%f6,	%f16
	membar	#Sync
	set	0x40, %i2
	ldda	[%l7 + %i2] 0xf0,	%f16
	stbar
	fors	%f6,	%f4,	%f4
	movle	%icc,	%l6,	%i0
	edge32n	%o6,	%i3,	%o5
	tleu	%xcc,	0x5
	brlez	%i4,	loop_127
	fmovrdlz	%g3,	%f30,	%f18
	bl,a,pt	%xcc,	loop_128
	tvc	%icc,	0x5
loop_127:
	edge32ln	%o2,	%g7,	%l1
	wr	%g0,	0x0c,	%asi
	prefetcha	[%l7 + 0x48] %asi,	 0x1
loop_128:
	fmovrsgz	%l3,	%f29,	%f15
	set	0x40, %l3
	ldda	[%l7 + %l3] 0x11,	%f0
	taddcctv	%o7,	0x0C84,	%i2
	move	%icc,	%g4,	%i6
	srl	%o4,	%l5,	%l4
	movrgez	%o1,	0x33D,	%g6
	sethi	0x0CB9,	%l2
	fandnot1	%f10,	%f20,	%f20
	sll	%g5,	0x0B,	%g2
	fpadd32s	%f17,	%f7,	%f13
	tvs	%xcc,	0x6
	membar	0x09
	srlx	%o3,	%o0,	%g1
	or	%i7,	0x1A5B,	%i1
	tleu	%icc,	0x5
	fbo	%fcc1,	loop_129
	orncc	%l0,	%i0,	%o6
	udivx	%l6,	0x18B7,	%i3
	movre	%o5,	%g3,	%i4
loop_129:
	sethi	0x0D22,	%o2
	fmovsl	%xcc,	%f23,	%f0
	orn	%l1,	%i5,	%g7
	tl	%icc,	0x6
	edge8l	%l3,	%i2,	%o7
	movg	%xcc,	%i6,	%o4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andn	%g4,	%l5,	%l4
	fmovspos	%icc,	%f29,	%f11
	movl	%xcc,	%o1,	%g6
	edge8	%l2,	%g2,	%g5
	fors	%f26,	%f14,	%f15
	xnorcc	%o0,	%o3,	%i7
	fbne	%fcc2,	loop_130
	fbo	%fcc3,	loop_131
	brgz,a	%i1,	loop_132
	bleu,pn	%icc,	loop_133
loop_130:
	flush	%l7 + 0x0C
loop_131:
	alignaddrl	%l0,	%g1,	%i0
loop_132:
	fcmple16	%f30,	%f0,	%l6
loop_133:
	orcc	%o6,	0x1AD5,	%i3
	nop
	setx	loop_134,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	bleu,a,pn	%xcc,	loop_135
	movge	%xcc,	%g3,	%i4
	fmovdn	%icc,	%f13,	%f27
loop_134:
	nop
	wr	%g0,	0x2b,	%asi
	stba	%o2,	[%l7 + 0x3E] %asi
	membar	#Sync
loop_135:
	sllx	%o5,	%i5,	%g7
	bpos	%xcc,	loop_136
	orcc	%l3,	%l1,	%i2
	addccc	%o7,	%o4,	%i6
	tleu	%xcc,	0x0
loop_136:
	sub	%l5,	0x1FF9,	%g4
	edge16n	%o1,	%g6,	%l2
	fone	%f16
	stx	%g2,	[%l7 + 0x58]
	fpadd16	%f28,	%f26,	%f10
	sdivcc	%g5,	0x1876,	%l4
	fmovsg	%icc,	%f21,	%f19
	fornot1s	%f28,	%f30,	%f26
	fmovsneg	%icc,	%f15,	%f0
	fmovrdlez	%o0,	%f28,	%f30
	sethi	0x14E9,	%i7
	sllx	%i1,	0x0C,	%l0
	ld	[%l7 + 0x48],	%f1
	alignaddr	%g1,	%i0,	%l6
	edge16ln	%o3,	%i3,	%g3
	fandnot1s	%f4,	%f17,	%f26
	fbg	%fcc0,	loop_137
	for	%f4,	%f4,	%f16
	brlz	%i4,	loop_138
	fmovrslez	%o6,	%f17,	%f0
loop_137:
	fnand	%f10,	%f10,	%f20
	fand	%f0,	%f2,	%f16
loop_138:
	tsubcc	%o5,	0x1A08,	%o2
	fble	%fcc0,	loop_139
	fbue	%fcc3,	loop_140
	fsrc1	%f20,	%f8
	edge8n	%i5,	%l3,	%g7
loop_139:
	te	%icc,	0x4
loop_140:
	edge32l	%i2,	%o7,	%o4
	movleu	%icc,	%l1,	%i6
	brnz,a	%g4,	loop_141
	fbue	%fcc3,	loop_142
	movneg	%icc,	%l5,	%g6
	fbg,a	%fcc3,	loop_143
loop_141:
	srlx	%o1,	0x15,	%l2
loop_142:
	bne	%xcc,	loop_144
	udivcc	%g5,	0x1F8F,	%g2
loop_143:
	sdivcc	%o0,	0x1280,	%i7
	subcc	%l4,	0x0B63,	%l0
loop_144:
	tpos	%icc,	0x2
	ldub	[%l7 + 0x5B],	%g1
	movg	%icc,	%i1,	%i0
	orn	%l6,	0x13F4,	%i3
	movvs	%icc,	%o3,	%i4
	fba,a	%fcc3,	loop_145
	addccc	%o6,	0x040B,	%o5
	fnands	%f1,	%f26,	%f20
	fandnot1s	%f15,	%f8,	%f18
loop_145:
	sll	%g3,	%i5,	%o2
	bvs,a,pn	%icc,	loop_146
	popc	0x153A,	%l3
	array32	%i2,	%o7,	%g7
	umulcc	%o4,	%l1,	%i6
loop_146:
	brgz	%l5,	loop_147
	edge32n	%g4,	%g6,	%l2
	fpsub32	%f2,	%f20,	%f2
	movgu	%icc,	%g5,	%o1
loop_147:
	fmul8x16au	%f0,	%f6,	%f20
	move	%icc,	%g2,	%o0
	edge16	%l4,	%l0,	%i7
	edge8n	%g1,	%i0,	%l6
	fmovdleu	%icc,	%f19,	%f24
	bgu,a	%xcc,	loop_148
	popc	0x064E,	%i3
	movl	%icc,	%i1,	%i4
	fabss	%f14,	%f31
loop_148:
	bleu,a	%icc,	loop_149
	srlx	%o3,	%o5,	%g3
	stbar
	tneg	%xcc,	0x6
loop_149:
	fmovdne	%xcc,	%f1,	%f24
	sll	%o6,	0x0B,	%i5
	set	0x58, %l0
	stxa	%l3,	[%l7 + %l0] 0x23
	membar	#Sync
	and	%i2,	%o2,	%o7
	fmovrsgz	%g7,	%f0,	%f1
	sdivx	%l1,	0x10AD,	%i6
	smul	%l5,	%g4,	%o4
	taddcctv	%g6,	%g5,	%o1
	movcc	%icc,	%l2,	%o0
	fmovspos	%xcc,	%f8,	%f7
	fcmped	%fcc3,	%f30,	%f18
	te	%icc,	0x4
	fmovrsgz	%g2,	%f11,	%f3
	membar	0x63
	fpack16	%f30,	%f21
	set	0x0E, %i7
	stba	%l4,	[%l7 + %i7] 0xe2
	membar	#Sync
	smul	%l0,	0x0C8D,	%g1
	fandnot1	%f6,	%f22,	%f18
	fcmple16	%f22,	%f8,	%i0
	fzeros	%f28
	fbug	%fcc2,	loop_150
	fnegd	%f10,	%f10
	edge16l	%i7,	%i3,	%l6
	fcmpne16	%f12,	%f18,	%i1
loop_150:
	and	%o3,	0x026D,	%o5
	or	%i4,	%g3,	%i5
	bleu,pn	%icc,	loop_151
	edge8l	%l3,	%i2,	%o6
	movpos	%icc,	%o7,	%o2
	add	%l7,	0x34,	%l6
	wr	%g0,	0x18,	%asi
	lda	[%l6] %asi,	%g7
	casa	[%l6] 0x18,	%g7,	%l1
loop_151:
	brz,a	%l5,	loop_152
	stx	%i6,	[%l7 + 0x18]
	fmovrse	%o4,	%f13,	%f13
	set	0x15, %l6
	lduba	[%l7 + %l6] 0x11,	%g4
loop_152:
	edge16ln	%g6,	%o1,	%l2
	tl	%icc,	0x0
	andn	%o0,	0x1D6D,	%g2
	ldx	[%l7 + 0x70],	%g5
	orcc	%l0,	0x0D34,	%g1
	fmovrdgz	%l4,	%f24,	%f28
	fmul8x16au	%f9,	%f8,	%f26
	edge16	%i0,	%i3,	%l6
	tle	%xcc,	0x0
	andcc	%i7,	0x1A91,	%o3
	fmul8ulx16	%f24,	%f0,	%f6
	fble	%fcc2,	loop_153
	movn	%xcc,	%i1,	%o5
	bne,pn	%icc,	loop_154
	call	loop_155
loop_153:
	ldsb	[%l7 + 0x61],	%i4
	udivx	%g3,	0x035F,	%l3
loop_154:
	ldd	[%l7 + 0x50],	%f6
loop_155:
	fmul8x16al	%f10,	%f19,	%f2
	fmovrdlez	%i2,	%f22,	%f18
	movre	%o6,	0x371,	%i5
	orcc	%o2,	0x07AE,	%g7
	ta	%xcc,	0x3
	wr	%g0,	0x0c,	%asi
	swapa	[%l7 + 0x24] %asi,	%l1
	edge16l	%o7,	%i6,	%o4
	fpsub32	%f6,	%f22,	%f0
	add	%l5,	%g6,	%g4
	fmul8x16au	%f22,	%f0,	%f20
	popc	%l2,	%o1
	fcmple16	%f10,	%f18,	%o0
	movre	%g2,	%g5,	%g1
	tvs	%icc,	0x3
	fmovdleu	%xcc,	%f27,	%f1
	edge16l	%l4,	%l0,	%i3
	fnot2s	%f31,	%f3
	be,a,pt	%xcc,	loop_156
	fbue,a	%fcc1,	loop_157
	movne	%xcc,	%i0,	%l6
	edge32l	%o3,	%i7,	%i1
loop_156:
	fmovsne	%icc,	%f1,	%f28
loop_157:
	sir	0x0014
	tn	%icc,	0x2
	mulx	%o5,	%g3,	%l3
	edge16n	%i2,	%i4,	%o6
	xor	%o2,	%g7,	%i5
	orn	%o7,	0x0DE3,	%l1
	wr	%g0,	0x18,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	move	%icc,	%o4,	%l5
	subccc	%i6,	0x1F51,	%g4
	fnands	%f27,	%f20,	%f3
	fmul8sux16	%f10,	%f0,	%f6
	fpadd32	%f22,	%f22,	%f12
	edge16n	%g6,	%l2,	%o0
	taddcc	%o1,	0x1BF2,	%g2
	wr	%g0,	0x2a,	%asi
	stxa	%g1,	[%l7 + 0x68] %asi
	membar	#Sync
	fcmpes	%fcc3,	%f2,	%f12
	and	%l4,	%l0,	%g5
	smulcc	%i3,	0x1E79,	%i0
	movrlz	%o3,	0x307,	%l6
	mulscc	%i1,	%i7,	%o5
	edge16l	%g3,	%l3,	%i4
	movrgz	%i2,	%o2,	%o6
	bpos,a,pt	%icc,	loop_158
	bgu,a	loop_159
	tl	%icc,	0x7
	sllx	%i5,	0x03,	%g7
loop_158:
	sra	%l1,	0x08,	%o7
loop_159:
	orcc	%o4,	0x0AFE,	%i6
	movvs	%xcc,	%g4,	%l5
	tn	%icc,	0x7
	movrlez	%l2,	%o0,	%o1
	sdivx	%g6,	0x0473,	%g1
	fblg	%fcc2,	loop_160
	alignaddrl	%g2,	%l0,	%g5
	edge16	%l4,	%i3,	%i0
	wr	%g0,	0x89,	%asi
	ldswa	[%l7 + 0x40] %asi,	%l6
loop_160:
	tne	%icc,	0x1
	tle	%icc,	0x0
	fsrc1s	%f2,	%f2
	add	%l7,	0x74,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%o3
	casa	[%l6] %asi,	%o3,	%i1
	fxnors	%f16,	%f9,	%f18
	add	%o5,	%g3,	%i7
	edge16l	%i4,	%i2,	%o2
	add	%l7,	0x40,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] %asi,	%l3,	%o6
	sll	%g7,	%l1,	%o7
	fpmerge	%f4,	%f29,	%f16
	orncc	%o4,	0x1148,	%i5
	tne	%xcc,	0x3
	movne	%icc,	%g4,	%l5
	movl	%xcc,	%i6,	%o0
	fbn,a	%fcc3,	loop_161
	movge	%icc,	%l2,	%g6
	movn	%icc,	%o1,	%g2
	movge	%xcc,	%g1,	%l0
loop_161:
	sdivcc	%l4,	0x182E,	%i3
	ldub	[%l7 + 0x1F],	%i0
	nop
	setx	loop_162,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	edge8	%l6,	%g5,	%i1
	movpos	%xcc,	%o3,	%g3
	fmovdvs	%xcc,	%f26,	%f23
loop_162:
	smul	%i7,	%o5,	%i4
	movge	%icc,	%i2,	%l3
	subccc	%o2,	%o6,	%g7
	edge8ln	%l1,	%o4,	%o7
	add	%l7,	0x68,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%i5,	%l5
	call	loop_163
	srl	%g4,	%o0,	%i6
	and	%l2,	0x0BB9,	%g6
	edge8ln	%o1,	%g2,	%l0
loop_163:
	edge16n	%l4,	%g1,	%i3
	tsubcc	%l6,	%i0,	%i1
	edge16l	%g5,	%o3,	%g3
	orncc	%o5,	0x1961,	%i7
	tcc	%xcc,	0x3
	set	0x38, %g2
	stwa	%i4,	[%l7 + %g2] 0x89
	fandnot2s	%f17,	%f28,	%f7
	fbule	%fcc0,	loop_164
	sra	%i2,	%l3,	%o6
	array32	%o2,	%l1,	%g7
	edge32n	%o4,	%i5,	%l5
loop_164:
	edge32l	%o7,	%g4,	%o0
	fcmpeq32	%f30,	%f6,	%i6
	movcs	%icc,	%l2,	%g6
	wr	%g0,	0xea,	%asi
	stxa	%g2,	[%l7 + 0x50] %asi
	membar	#Sync
	fbo	%fcc2,	loop_165
	fmovdleu	%xcc,	%f25,	%f30
	sll	%l0,	0x1E,	%l4
	stw	%g1,	[%l7 + 0x70]
loop_165:
	taddcctv	%i3,	%l6,	%o1
	movneg	%icc,	%i0,	%g5
	ba	%icc,	loop_166
	fzero	%f20
	fnot2s	%f0,	%f17
	and	%o3,	0x0B25,	%i1
loop_166:
	edge8l	%g3,	%o5,	%i4
	fbg	%fcc3,	loop_167
	bg	%xcc,	loop_168
	add	%i2,	%i7,	%o6
	fmovrsne	%o2,	%f4,	%f28
loop_167:
	sethi	0x163E,	%l3
loop_168:
	tgu	%xcc,	0x2
	set	0x14, %o2
	lduwa	[%l7 + %o2] 0x80,	%g7
	tvs	%icc,	0x5
	fbn,a	%fcc1,	loop_169
	fexpand	%f24,	%f28
	fnegs	%f4,	%f15
	flush	%l7 + 0x30
loop_169:
	edge32n	%l1,	%i5,	%o4
	sdiv	%o7,	0x010F,	%l5
	fmuld8ulx16	%f0,	%f0,	%f16
	andn	%g4,	%o0,	%i6
	fabss	%f30,	%f15
	fnands	%f20,	%f15,	%f19
	fmul8ulx16	%f24,	%f8,	%f8
	andncc	%l2,	%g2,	%l0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32	%g6,	%l4,	%i3
	fbug,a	%fcc1,	loop_170
	stb	%l6,	[%l7 + 0x1C]
	mulx	%o1,	0x1AD0,	%i0
	bshuffle	%f18,	%f16,	%f26
loop_170:
	bleu,a,pn	%icc,	loop_171
	andncc	%g5,	%o3,	%g1
	sll	%g3,	%i1,	%i4
	tvs	%icc,	0x3
loop_171:
	bvc,pt	%xcc,	loop_172
	tcs	%xcc,	0x7
	ldsh	[%l7 + 0x20],	%i2
	udivx	%o5,	0x1305,	%o6
loop_172:
	bpos	%icc,	loop_173
	swap	[%l7 + 0x38],	%o2
	fpadd16	%f30,	%f14,	%f20
	membar	0x0F
loop_173:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tcc	%xcc,	0x0
	sir	0x1A3E
	sethi	0x1934,	%i7
	fbu	%fcc2,	loop_174
	movneg	%icc,	%g7,	%l1
	fmovsleu	%icc,	%f29,	%f16
	fmovsn	%icc,	%f25,	%f17
loop_174:
	addc	%l3,	%o4,	%i5
	movneg	%xcc,	%l5,	%g4
	fbge	%fcc2,	loop_175
	fandnot1s	%f10,	%f25,	%f11
	array32	%o0,	%o7,	%i6
	fmovrsgz	%l2,	%f28,	%f18
loop_175:
	movrne	%l0,	%g6,	%g2
	or	%l4,	0x0C56,	%i3
	edge16n	%o1,	%i0,	%l6
	sir	0x08E0
	fpack16	%f0,	%f16
	fblg	%fcc1,	loop_176
	tg	%icc,	0x5
	movrgez	%g5,	%g1,	%g3
	movge	%icc,	%i1,	%o3
loop_176:
	edge16n	%i2,	%o5,	%o6
	fornot1s	%f9,	%f16,	%f5
	sra	%o2,	0x05,	%i7
	and	%i4,	0x151D,	%g7
	fnors	%f11,	%f0,	%f17
	edge32ln	%l1,	%o4,	%i5
	mulscc	%l3,	0x0682,	%g4
	andncc	%o0,	%l5,	%i6
	move	%icc,	%l2,	%o7
	andcc	%g6,	%g2,	%l0
	fble,a	%fcc2,	loop_177
	sir	0x0B38
	wr	%g0,	0x0c,	%asi
	prefetcha	[%l7 + 0x68] %asi,	 0x1
loop_177:
	fmovs	%f30,	%f5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	setx	loop_178,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	sub	%o1,	0x08FD,	%i0
	alignaddr	%l6,	%g5,	%g1
	fmovsne	%icc,	%f6,	%f4
loop_178:
	tcs	%xcc,	0x5
	movcc	%icc,	%l4,	%i1
	set	0x20, %l4
	lduwa	[%l7 + %l4] 0x88,	%g3
	addccc	%o3,	%i2,	%o6
	set	0x31, %g1
	stba	%o5,	[%l7 + %g1] 0xe3
	membar	#Sync
	sdiv	%i7,	0x0889,	%i4
	srl	%o2,	0x0A,	%g7
	tvc	%xcc,	0x0
	fpsub32	%f12,	%f26,	%f4
	movvs	%xcc,	%o4,	%i5
	udivx	%l1,	0x0BFF,	%l3
	fcmpeq16	%f22,	%f6,	%g4
	addcc	%o0,	0x0748,	%l5
	orcc	%l2,	0x1EF2,	%o7
	fnot1	%f22,	%f4
	fbue	%fcc1,	loop_179
	fcmple32	%f14,	%f8,	%i6
	tpos	%icc,	0x3
	tl	%icc,	0x5
loop_179:
	fmovsgu	%xcc,	%f15,	%f11
	tcc	%icc,	0x3
	bpos	loop_180
	nop
	setx	loop_181,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	te	%icc,	0x6
	wr	%g0,	0x88,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
loop_180:
	fnot1	%f14,	%f14
loop_181:
	orcc	%g2,	0x141B,	%g6
	umulcc	%i3,	0x1A3C,	%l0
	sir	0x0EE2
	fandnot1s	%f18,	%f28,	%f28
	udivcc	%i0,	0x086D,	%l6
	sub	%g5,	0x041D,	%g1
	movn	%xcc,	%o1,	%i1
	tcs	%xcc,	0x6
	ld	[%l7 + 0x60],	%f30
	tcs	%icc,	0x5
	add	%l7,	0x18,	%l6
	wr	%g0,	0x10,	%asi
	casxa	[%l6] 0x10,	%g3,	%l4
	subcc	%o3,	0x0E46,	%i2
	mulx	%o6,	0x0A28,	%i7
	fba,a	%fcc1,	loop_182
	swap	[%l7 + 0x34],	%o5
	sir	0x0E34
	fnands	%f7,	%f16,	%f31
loop_182:
	sllx	%o2,	0x16,	%g7
	fpsub32	%f10,	%f12,	%f6
	tcc	%xcc,	0x4
	movrne	%o4,	0x0B4,	%i4
	edge32	%i5,	%l1,	%l3
	array32	%o0,	%l5,	%l2
	fcmpne32	%f2,	%f16,	%o7
	movge	%icc,	%i6,	%g2
	tpos	%xcc,	0x2
	fpadd32	%f6,	%f24,	%f10
	add	%g4,	%g6,	%i3
	fcmpeq16	%f16,	%f2,	%l0
	fbl	%fcc0,	loop_183
	sra	%l6,	0x0F,	%g5
	flush	%l7 + 0x68
	wr	%g0,	0x20,	%asi
	ldxa	[%g0 + 0x18] %asi,	%i0
loop_183:
	ldd	[%l7 + 0x20],	%g0
	fpadd32s	%f31,	%f6,	%f15
	movrgz	%i1,	%g3,	%o1
	movre	%o3,	%i2,	%o6
	ldub	[%l7 + 0x2A],	%i7
	bne,a	%xcc,	loop_184
	fandnot1	%f30,	%f8,	%f24
	udiv	%l4,	0x04D7,	%o5
	xnorcc	%g7,	%o2,	%o4
loop_184:
	edge32n	%i5,	%i4,	%l1
	bcs,a,pt	%xcc,	loop_185
	move	%xcc,	%l3,	%o0
	udiv	%l5,	0x0B1F,	%l2
	wr	%g0,	0xeb,	%asi
	stda	%o6,	[%l7 + 0x38] %asi
	membar	#Sync
loop_185:
	xnorcc	%g2,	%g4,	%i6
	udivcc	%g6,	0x00FC,	%i3
	tgu	%xcc,	0x5
	movre	%l6,	%l0,	%g5
	tvc	%icc,	0x0
	tleu	%xcc,	0x2
	fbul	%fcc2,	loop_186
	tle	%icc,	0x2
	add	%i0,	0x14F5,	%i1
	udivcc	%g1,	0x0ADF,	%o1
loop_186:
	bn,a,pt	%xcc,	loop_187
	fmovrde	%o3,	%f16,	%f30
	wr	%g0,	0x19,	%asi
	stda	%i2,	[%l7 + 0x40] %asi
loop_187:
	smulcc	%o6,	%i7,	%g3
	tpos	%icc,	0x2
	array32	%o5,	%g7,	%o2
	udiv	%l4,	0x03F5,	%o4
	fxnor	%f6,	%f2,	%f24
	movrlez	%i5,	%l1,	%l3
	edge32	%i4,	%o0,	%l2
	andcc	%o7,	0x0466,	%g2
	movleu	%xcc,	%l5,	%i6
	tvc	%xcc,	0x3
	edge16l	%g4,	%g6,	%i3
	fabsd	%f2,	%f14
	movrlz	%l0,	0x1DE,	%g5
	sethi	0x00DB,	%i0
	tsubcc	%i1,	%l6,	%g1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movvs	%icc,	%o1,	%o3
	wr	%g0,	0x2f,	%asi
	stwa	%i2,	[%l7 + 0x18] %asi
	membar	#Sync
	sllx	%o6,	0x0C,	%i7
	fabss	%f29,	%f17
	edge32	%o5,	%g7,	%g3
	sethi	0x1A17,	%l4
	tge	%xcc,	0x0
	xor	%o2,	%i5,	%l1
	set	0x74, %l1
	ldsba	[%l7 + %l1] 0x0c,	%o4
	fbl	%fcc2,	loop_188
	movrne	%i4,	%l3,	%o0
	stw	%o7,	[%l7 + 0x3C]
	edge32ln	%g2,	%l5,	%i6
loop_188:
	addccc	%l2,	0x051B,	%g4
	fbn,a	%fcc0,	loop_189
	stb	%i3,	[%l7 + 0x18]
	orcc	%g6,	0x1759,	%l0
	sra	%i0,	0x19,	%i1
loop_189:
	tgu	%xcc,	0x1
	fnot1s	%f16,	%f8
	sir	0x1B03
	fxors	%f11,	%f30,	%f5
	taddcctv	%g5,	0x034A,	%g1
	edge16ln	%l6,	%o3,	%i2
	wr	%g0,	0x18,	%asi
	ldsha	[%l7 + 0x30] %asi,	%o6
	ldstub	[%l7 + 0x6B],	%o1
	tneg	%icc,	0x6
	edge16	%o5,	%i7,	%g3
	xnor	%g7,	0x0DD5,	%o2
	edge16ln	%l4,	%l1,	%i5
	edge32	%o4,	%i4,	%o0
	movgu	%xcc,	%l3,	%g2
	bg,pn	%xcc,	loop_190
	fands	%f22,	%f11,	%f23
	movge	%xcc,	%o7,	%i6
	orcc	%l2,	0x1692,	%g4
loop_190:
	fpack32	%f12,	%f14,	%f24
	fbl,a	%fcc1,	loop_191
	sir	0x115B
	fbe,a	%fcc0,	loop_192
	add	%l5,	0x0CBA,	%i3
loop_191:
	array32	%l0,	%g6,	%i1
	fmovdn	%icc,	%f6,	%f22
loop_192:
	or	%i0,	%g5,	%l6
	sethi	0x09C0,	%g1
	te	%xcc,	0x0
	edge8l	%o3,	%o6,	%i2
	wr	%g0,	0x2f,	%asi
	stwa	%o5,	[%l7 + 0x38] %asi
	membar	#Sync
	brlez	%o1,	loop_193
	tle	%xcc,	0x5
	tne	%icc,	0x5
	set	0x16, %o7
	ldstuba	[%l7 + %o7] 0x11,	%g3
loop_193:
	movle	%icc,	%i7,	%o2
	bl,a,pn	%icc,	loop_194
	fmovscs	%xcc,	%f30,	%f18
	movleu	%icc,	%l4,	%g7
	fmuld8sux16	%f6,	%f18,	%f6
loop_194:
	nop
	wr	%g0,	0x89,	%asi
	ldswa	[%l7 + 0x74] %asi,	%l1
	ldsb	[%l7 + 0x44],	%i5
	alignaddr	%i4,	%o4,	%o0
	fmuld8sux16	%f5,	%f5,	%f8
	set	0x38, %g7
	stda	%g2,	[%l7 + %g7] 0x88
	orcc	%l3,	0x1A13,	%o7
	tleu	%icc,	0x0
	edge8n	%l2,	%i6,	%l5
	bge	%icc,	loop_195
	mulscc	%i3,	%g4,	%l0
	sdivcc	%i1,	0x1091,	%i0
	wr	%g0,	0x80,	%asi
	ldsba	[%l7 + 0x6D] %asi,	%g5
loop_195:
	andncc	%g6,	%g1,	%o3
	fblg	%fcc2,	loop_196
	tn	%xcc,	0x3
	fpsub16s	%f5,	%f18,	%f28
	nop
	setx loop_197, %l0, %l1
	jmpl %l1, %o6
loop_196:
	swap	[%l7 + 0x40],	%l6
	wr	%g0,	0x04,	%asi
	ldda	[%l7 + 0x20] %asi,	%i2
loop_197:
	fpack16	%f14,	%f0
	edge8	%o5,	%g3,	%i7
	tpos	%xcc,	0x1
	membar	0x6F
	tg	%xcc,	0x7
	tsubcctv	%o2,	0x0EA3,	%l4
	orn	%o1,	%g7,	%l1
	fcmpgt32	%f2,	%f20,	%i5
	fmovdgu	%icc,	%f21,	%f16
	set	0x10, %g3
	sta	%f10,	[%l7 + %g3] 0x89
	xor	%o4,	0x1395,	%i4
	wr	%g0,	0x88,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	fmovsne	%xcc,	%f31,	%f25
	fmovrse	%o0,	%f21,	%f1
	tg	%icc,	0x6
	subcc	%l3,	0x0273,	%o7
	ta	%xcc,	0x5
	wr	%g0,	0xeb,	%asi
	ldda	[%l7 + 0x50] %asi,	%l2
	fmovsle	%icc,	%f13,	%f16
	edge16	%g2,	%l5,	%i3
	xnorcc	%g4,	%i6,	%l0
	set	0x3C, %o4
	ldswa	[%l7 + %o4] 0x89,	%i0
	bcs,a	%icc,	loop_198
	bne,pt	%icc,	loop_199
	taddcc	%i1,	0x084F,	%g5
	set	0x4D, %o5
	ldsba	[%l7 + %o5] 0x18,	%g1
loop_198:
	fmovdvc	%xcc,	%f18,	%f1
loop_199:
	srax	%g6,	%o3,	%l6
	membar	#Sync
	set	0x40, %l2
	ldda	[%l7 + %l2] 0xf8,	%f16
	udivcc	%i2,	0x0C37,	%o5
	tl	%xcc,	0x1
	movg	%icc,	%o6,	%i7
	call	loop_200
	edge16	%g3,	%l4,	%o1
	stb	%o2,	[%l7 + 0x20]
	brgz	%l1,	loop_201
loop_200:
	movpos	%icc,	%i5,	%o4
	movcs	%xcc,	%i4,	%g7
	movg	%xcc,	%o0,	%o7
loop_201:
	subccc	%l2,	%g2,	%l5
	popc	%l3,	%g4
	subc	%i6,	0x0ADA,	%i3
	sdiv	%l0,	0x19EA,	%i1
	fmovsn	%icc,	%f27,	%f16
	alignaddr	%g5,	%g1,	%g6
	sethi	0x0E54,	%o3
	lduh	[%l7 + 0x10],	%l6
	ldsh	[%l7 + 0x5A],	%i2
	tneg	%xcc,	0x7
	movrlez	%i0,	%o6,	%o5
	ldsb	[%l7 + 0x5F],	%g3
	tneg	%xcc,	0x4
	udiv	%l4,	0x1359,	%o1
	movge	%xcc,	%i7,	%l1
	srl	%i5,	%o4,	%i4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movcs	%icc,	%o2,	%g7
	wr	%g0,	0x11,	%asi
	sta	%f0,	[%l7 + 0x30] %asi
	fbuge	%fcc3,	loop_202
	ble,pn	%icc,	loop_203
	fbne	%fcc0,	loop_204
	udivcc	%o0,	0x17DF,	%o7
loop_202:
	sdivx	%g2,	0x0A03,	%l2
loop_203:
	alignaddrl	%l5,	%l3,	%g4
loop_204:
	fsrc1	%f22,	%f18
	std	%f28,	[%l7 + 0x60]
	popc	%i3,	%i6
	fpsub32s	%f30,	%f4,	%f13
	movpos	%icc,	%l0,	%i1
	subc	%g5,	0x1DD2,	%g6
	movl	%icc,	%g1,	%o3
	tl	%icc,	0x3
	edge8	%l6,	%i2,	%o6
	smulcc	%i0,	%g3,	%o5
	ldub	[%l7 + 0x7A],	%o1
	brz,a	%l4,	loop_205
	fmul8sux16	%f0,	%f28,	%f4
	sdivx	%i7,	0x013C,	%i5
	sth	%l1,	[%l7 + 0x6C]
loop_205:
	fmovspos	%icc,	%f13,	%f4
	edge16l	%i4,	%o2,	%o4
	fmovrse	%o0,	%f22,	%f1
	movrne	%o7,	0x14D,	%g7
	fbne	%fcc3,	loop_206
	fone	%f6
	movre	%g2,	%l2,	%l3
	stbar
loop_206:
	nop
	set	0x54, %o0
	lda	[%l7 + %o0] 0x15,	%f22
	wr	%g0,	0xe3,	%asi
	stba	%g4,	[%l7 + 0x09] %asi
	membar	#Sync
	subc	%l5,	0x1BBC,	%i6
	tcs	%icc,	0x7
	ldx	[%l7 + 0x58],	%l0
	edge16ln	%i1,	%i3,	%g5
	fcmple16	%f22,	%f26,	%g1
	mova	%xcc,	%o3,	%l6
	set	0x5C, %g4
	ldswa	[%l7 + %g4] 0x0c,	%i2
	ta	%xcc,	0x7
	wr	%g0,	0x89,	%asi
	stxa	%o6,	[%l7 + 0x50] %asi
	movvs	%icc,	%i0,	%g3
	fones	%f1
	tne	%xcc,	0x0
	movrgz	%o5,	0x2B4,	%o1
	fmovdne	%icc,	%f12,	%f27
	xnor	%g6,	0x1D4F,	%l4
	movrgz	%i5,	%i7,	%l1
	fmovdleu	%icc,	%f13,	%f20
	set	0x28, %g5
	ldsba	[%l7 + %g5] 0x19,	%i4
	tgu	%icc,	0x4
	fmovsleu	%xcc,	%f20,	%f8
	tsubcc	%o2,	%o4,	%o7
	addc	%o0,	%g2,	%l2
	fble	%fcc0,	loop_207
	fpack16	%f12,	%f6
	subccc	%l3,	%g4,	%g7
	membar	0x5C
loop_207:
	tneg	%icc,	0x5
	fbo,a	%fcc1,	loop_208
	edge32ln	%i6,	%l5,	%i1
	popc	0x0627,	%l0
	movle	%xcc,	%g5,	%i3
loop_208:
	movvs	%icc,	%o3,	%g1
	movvc	%xcc,	%l6,	%i2
	bshuffle	%f6,	%f10,	%f10
	andn	%i0,	0x0BBA,	%g3
	tsubcc	%o6,	%o1,	%g6
	movrlez	%o5,	%i5,	%i7
	fmovdn	%xcc,	%f26,	%f1
	call	loop_209
	fbuge,a	%fcc2,	loop_210
	subc	%l4,	0x169E,	%l1
	andn	%o2,	0x102C,	%i4
loop_209:
	pdist	%f2,	%f0,	%f0
loop_210:
	edge16l	%o7,	%o0,	%g2
	xorcc	%o4,	0x05A7,	%l2
	fxor	%f16,	%f24,	%f18
	movn	%icc,	%l3,	%g4
	movrlez	%i6,	0x04F,	%g7
	ldsh	[%l7 + 0x62],	%i1
	sethi	0x19C8,	%l5
	fbl,a	%fcc3,	loop_211
	or	%l0,	0x1FB1,	%i3
	brz,a	%g5,	loop_212
	fbue,a	%fcc1,	loop_213
loop_211:
	edge16l	%g1,	%o3,	%l6
	fmovsne	%icc,	%f2,	%f5
loop_212:
	sethi	0x100A,	%i2
loop_213:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpack32	%f16,	%f14,	%f26
	orcc	%g3,	%o6,	%o1
	movleu	%xcc,	%i0,	%g6
	srlx	%i5,	%o5,	%l4
	tl	%xcc,	0x4
	tgu	%xcc,	0x3
	movvc	%xcc,	%i7,	%o2
	ldsb	[%l7 + 0x51],	%l1
	fba,a	%fcc0,	loop_214
	array32	%i4,	%o0,	%g2
	taddcc	%o7,	%l2,	%o4
	stw	%l3,	[%l7 + 0x7C]
loop_214:
	tsubcc	%i6,	0x0FD9,	%g7
	ble	%xcc,	loop_215
	stb	%i1,	[%l7 + 0x3D]
	ldsh	[%l7 + 0x50],	%g4
	bpos	loop_216
loop_215:
	fnand	%f6,	%f0,	%f26
	fmovrsgz	%l5,	%f4,	%f11
	fba,a	%fcc3,	loop_217
loop_216:
	addc	%i3,	0x15B1,	%g5
	tleu	%xcc,	0x6
	movcs	%icc,	%g1,	%o3
loop_217:
	bvc	%icc,	loop_218
	move	%xcc,	%l6,	%i2
	ba	%xcc,	loop_219
	movl	%icc,	%l0,	%o6
loop_218:
	fmovsl	%icc,	%f3,	%f22
	fblg	%fcc0,	loop_220
loop_219:
	fpsub16s	%f9,	%f8,	%f29
	tle	%icc,	0x7
	movneg	%icc,	%o1,	%g3
loop_220:
	bl,a,pt	%icc,	loop_221
	movn	%xcc,	%g6,	%i0
	fmovsgu	%xcc,	%f26,	%f3
	stw	%o5,	[%l7 + 0x58]
loop_221:
	brlez	%l4,	loop_222
	addc	%i7,	0x13AD,	%o2
	fmovrsgz	%l1,	%f28,	%f27
	smulcc	%i4,	%i5,	%o0
loop_222:
	xnor	%o7,	%l2,	%g2
	movg	%icc,	%l3,	%o4
	tcc	%xcc,	0x1
	for	%f2,	%f4,	%f14
	xnorcc	%g7,	0x01DA,	%i6
	nop
	setx loop_223, %l0, %l1
	jmpl %l1, %g4
	fmovspos	%xcc,	%f31,	%f20
	alignaddrl	%i1,	%l5,	%i3
	movneg	%xcc,	%g5,	%o3
loop_223:
	addccc	%g1,	0x1765,	%l6
	addccc	%l0,	0x0380,	%i2
	bgu,pt	%icc,	loop_224
	taddcctv	%o6,	%g3,	%o1
	sdivx	%g6,	0x14CE,	%o5
	movle	%xcc,	%l4,	%i0
loop_224:
	array16	%i7,	%o2,	%i4
	movrgez	%l1,	0x07B,	%i5
	edge32l	%o7,	%l2,	%g2
	smulcc	%o0,	%l3,	%g7
	fmovdn	%xcc,	%f12,	%f13
	edge8n	%i6,	%o4,	%i1
	tpos	%icc,	0x0
	nop
	setx loop_225, %l0, %l1
	jmpl %l1, %g4
	edge16l	%i3,	%g5,	%l5
	edge16n	%o3,	%g1,	%l6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_225:
	fcmple16	%f8,	%f26,	%l0
	fbl	%fcc1,	loop_226
	fbge	%fcc0,	loop_227
	tne	%xcc,	0x7
	move	%xcc,	%o6,	%i2
loop_226:
	fmovsa	%xcc,	%f24,	%f30
loop_227:
	fmovrde	%g3,	%f12,	%f2
	ta	%xcc,	0x7
	fbe	%fcc3,	loop_228
	fmovdleu	%icc,	%f7,	%f16
	popc	0x0EDD,	%g6
	fcmpeq16	%f18,	%f2,	%o1
loop_228:
	edge8	%l4,	%o5,	%i0
	edge16l	%i7,	%i4,	%l1
	edge16	%i5,	%o7,	%l2
	wr	%g0,	0x04,	%asi
	prefetcha	[%l7 + 0x30] %asi,	 0x0
	fmovsvc	%icc,	%f9,	%f0
	set	0x3C, %i3
	ldstuba	[%l7 + %i3] 0x10,	%o0
	set	0x28, %i1
	stda	%o2,	[%l7 + %i1] 0x2f
	membar	#Sync
	sra	%l3,	0x00,	%i6
	std	%o4,	[%l7 + 0x78]
	fmovrsgz	%g7,	%f2,	%f4
	membar	0x7D
	popc	%i1,	%g4
	edge32	%g5,	%i3,	%o3
	ba,a,pn	%icc,	loop_229
	movl	%xcc,	%l5,	%l6
	fble	%fcc2,	loop_230
	fbuge	%fcc0,	loop_231
loop_229:
	for	%f30,	%f24,	%f28
	fmovrsgz	%l0,	%f18,	%f24
loop_230:
	sethi	0x0F19,	%o6
loop_231:
	sth	%i2,	[%l7 + 0x0E]
	bleu,pn	%icc,	loop_232
	brlez	%g1,	loop_233
	movneg	%icc,	%g3,	%g6
	orn	%l4,	%o5,	%o1
loop_232:
	srl	%i0,	%i4,	%l1
loop_233:
	movre	%i7,	0x16D,	%i5
	tvc	%icc,	0x7
	addc	%l2,	0x1D5E,	%o7
	wr	%g0,	0x81,	%asi
	ldswa	[%l7 + 0x14] %asi,	%o0
	xnor	%g2,	%l3,	%o2
	tn	%icc,	0x4
	fxnors	%f20,	%f11,	%f18
	addc	%o4,	0x1288,	%g7
	edge32ln	%i6,	%i1,	%g5
	edge16ln	%i3,	%g4,	%o3
	tvs	%icc,	0x1
	and	%l6,	%l5,	%o6
	umul	%i2,	0x16A8,	%g1
	tneg	%xcc,	0x2
	movl	%icc,	%l0,	%g3
	fmovdge	%icc,	%f16,	%f11
	movvc	%icc,	%l4,	%g6
	add	%l7,	0x58,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%o5,	%o1
	std	%i4,	[%l7 + 0x20]
	membar	0x66
	movrlez	%i0,	0x240,	%i7
	fnands	%f1,	%f30,	%f10
	fxor	%f18,	%f0,	%f30
	andncc	%i5,	%l2,	%o7
	fmovdcc	%icc,	%f9,	%f29
	bge,a,pn	%xcc,	loop_234
	ta	%icc,	0x3
	edge32n	%l1,	%g2,	%o0
	add	%l7,	0x68,	%l6
	wr	%g0,	0x18,	%asi
	casxa	[%l6] %asi,	%l3,	%o2
loop_234:
	xnorcc	%o4,	%i6,	%g7
	fbu,a	%fcc3,	loop_235
	call	loop_236
	fsrc1s	%f16,	%f8
	lduw	[%l7 + 0x0C],	%g5
loop_235:
	nop
	wr	%g0,	0x89,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
loop_236:
	prefetch	[%l7 + 0x58],	 0x2
	movg	%icc,	%i1,	%g4
	movvs	%icc,	%i3,	%l6
	fones	%f20
	array16	%l5,	%o3,	%i2
	bcc,a,pn	%icc,	loop_237
	fcmple16	%f22,	%f24,	%g1
	tleu	%xcc,	0x6
	edge16ln	%l0,	%o6,	%l4
loop_237:
	bge,pn	%icc,	loop_238
	movrlez	%g6,	%g3,	%o1
	fornot2s	%f21,	%f31,	%f11
	fnot1	%f18,	%f8
loop_238:
	addccc	%o5,	0x061F,	%i4
	set	0x68, %g6
	swapa	[%l7 + %g6] 0x89,	%i7
	tne	%xcc,	0x2
	fsrc1	%f20,	%f26
	fbug	%fcc3,	loop_239
	tpos	%xcc,	0x1
	andncc	%i5,	%l2,	%o7
	edge8n	%l1,	%g2,	%o0
loop_239:
	nop
	wr	%g0,	0x89,	%asi
	lduwa	[%l7 + 0x10] %asi,	%l3
	fmovdn	%xcc,	%f30,	%f14
	edge32ln	%o2,	%i0,	%o4
	membar	0x7E
	mulscc	%g7,	0x01E9,	%i6
	add	%i1,	%g4,	%g5
	add	%l7,	0x38,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%l6,	%i3
	sdivx	%o3,	0x1EBD,	%l5
	edge8l	%i2,	%l0,	%g1
	movne	%xcc,	%l4,	%g6
	subccc	%g3,	0x0A5B,	%o1
	tg	%icc,	0x4
	sub	%o6,	0x06BC,	%i4
	edge8l	%i7,	%i5,	%l2
	tcs	%icc,	0x1
	tle	%icc,	0x0
	fzero	%f14
	movle	%xcc,	%o5,	%o7
	ba,pn	%xcc,	loop_240
	fxnors	%f7,	%f19,	%f16
	set	0x18, %i5
	ldxa	[%g0 + %i5] 0x20,	%g2
loop_240:
	fpsub16s	%f22,	%f28,	%f5
	tvc	%xcc,	0x5
	te	%icc,	0x2
	udiv	%l1,	0x1E4C,	%l3
	fbg,a	%fcc2,	loop_241
	sdiv	%o2,	0x193C,	%i0
	taddcctv	%o0,	0x0B8D,	%o4
	bshuffle	%f20,	%f22,	%f30
loop_241:
	movge	%icc,	%i6,	%i1
	srlx	%g4,	%g7,	%g5
	add	%i3,	%l6,	%o3
	movn	%xcc,	%i2,	%l0
	movleu	%xcc,	%l5,	%g1
	move	%icc,	%l4,	%g3
	srl	%o1,	0x18,	%o6
	brnz,a	%i4,	loop_242
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movle	%icc,	%g6,	%i5
	fmovsl	%xcc,	%f12,	%f8
loop_242:
	fcmpd	%fcc2,	%f28,	%f10
	edge32	%i7,	%l2,	%o7
	taddcctv	%g2,	0x0610,	%l1
	fmovs	%f29,	%f13
	stb	%l3,	[%l7 + 0x5F]
	movcs	%icc,	%o2,	%o5
	tpos	%icc,	0x4
	orncc	%o0,	%o4,	%i0
	siam	0x3
	edge16n	%i1,	%g4,	%g7
	fbge	%fcc2,	loop_243
	and	%g5,	0x10D7,	%i6
	set	0x1E, %l5
	lduba	[%l7 + %l5] 0x89,	%l6
loop_243:
	fzero	%f24
	tl	%xcc,	0x1
	te	%xcc,	0x4
	call	loop_244
	tcc	%icc,	0x0
	taddcc	%o3,	0x1A9B,	%i2
	fsrc1s	%f23,	%f15
loop_244:
	tvs	%icc,	0x1
	movle	%xcc,	%l0,	%l5
	sdiv	%i3,	0x09D3,	%g1
	movcs	%xcc,	%l4,	%o1
	movcc	%xcc,	%g3,	%o6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16ln	%i4,	%g6,	%i7
	lduh	[%l7 + 0x70],	%l2
	fmovrslz	%i5,	%f19,	%f28
	fxnors	%f5,	%f19,	%f25
	te	%xcc,	0x6
	array32	%o7,	%l1,	%g2
	sllx	%o2,	0x15,	%l3
	addcc	%o5,	%o4,	%i0
	tle	%xcc,	0x5
	tsubcc	%o0,	0x0FDE,	%g4
	fnegd	%f6,	%f28
	movne	%icc,	%g7,	%g5
	brz,a	%i6,	loop_245
	movleu	%icc,	%i1,	%o3
	or	%i2,	%l6,	%l0
	tleu	%icc,	0x0
loop_245:
	tgu	%icc,	0x6
	add	%l5,	0x011A,	%i3
	sub	%l4,	0x0DC3,	%o1
	orncc	%g1,	%g3,	%o6
	movrgz	%i4,	%g6,	%i7
	add	%l2,	%o7,	%l1
	nop
	setx loop_246, %l0, %l1
	jmpl %l1, %i5
	edge32n	%g2,	%o2,	%o5
	udivx	%o4,	0x0591,	%i0
	sll	%l3,	%g4,	%o0
loop_246:
	bpos	loop_247
	movvc	%icc,	%g5,	%g7
	subcc	%i6,	0x0183,	%o3
	udivcc	%i1,	0x1E9B,	%i2
loop_247:
	edge32	%l6,	%l5,	%l0
	tpos	%xcc,	0x0
	sdiv	%i3,	0x133F,	%o1
	move	%xcc,	%l4,	%g1
	fmovrdgz	%g3,	%f20,	%f14
	fbl	%fcc1,	loop_248
	fmovspos	%xcc,	%f21,	%f29
	fcmpeq16	%f4,	%f14,	%o6
	subc	%g6,	%i4,	%i7
loop_248:
	ldub	[%l7 + 0x76],	%l2
	fmovdpos	%xcc,	%f17,	%f21
	bvs	loop_249
	andn	%l1,	%o7,	%g2
	sdivx	%o2,	0x0DD5,	%o5
	srlx	%i5,	0x1F,	%o4
loop_249:
	fbul	%fcc2,	loop_250
	brlez	%i0,	loop_251
	tn	%icc,	0x0
	addccc	%g4,	%o0,	%g5
loop_250:
	flush	%l7 + 0x28
loop_251:
	ldsb	[%l7 + 0x50],	%g7
	tvs	%xcc,	0x7
	alignaddr	%l3,	%i6,	%o3
	andncc	%i2,	%i1,	%l5
	fcmped	%fcc1,	%f8,	%f14
	tleu	%icc,	0x2
	edge16	%l6,	%l0,	%o1
	fmovdcs	%xcc,	%f24,	%f18
	edge32l	%l4,	%i3,	%g3
	swap	[%l7 + 0x6C],	%g1
	taddcctv	%o6,	%i4,	%g6
	xnor	%i7,	%l1,	%l2
	lduh	[%l7 + 0x56],	%g2
	fmovs	%f0,	%f1
	add	%o7,	%o5,	%o2
	andcc	%i5,	%o4,	%i0
	tsubcc	%o0,	%g5,	%g7
	be,a,pt	%icc,	loop_252
	fbue	%fcc0,	loop_253
	brnz	%g4,	loop_254
	tcc	%xcc,	0x2
loop_252:
	nop
	set	0x40, %o3
	ldda	[%l7 + %o3] 0x19,	%f16
loop_253:
	tpos	%icc,	0x6
loop_254:
	sra	%i6,	%l3,	%i2
	ldd	[%l7 + 0x78],	%f10
	brlez,a	%o3,	loop_255
	sth	%i1,	[%l7 + 0x0E]
	bneg,a	loop_256
	movleu	%xcc,	%l6,	%l0
loop_255:
	edge8n	%o1,	%l5,	%i3
	set	0x74, %o1
	sta	%f0,	[%l7 + %o1] 0x11
loop_256:
	edge16ln	%g3,	%l4,	%o6
	brgez	%g1,	loop_257
	umul	%g6,	%i7,	%i4
	edge32l	%l2,	%l1,	%g2
	fnor	%f18,	%f30,	%f28
loop_257:
	fmovrdgz	%o7,	%f28,	%f12
	orncc	%o2,	0x15AE,	%o5
	movcs	%xcc,	%i5,	%o4
	fmuld8sux16	%f11,	%f20,	%f24
	movrlz	%i0,	%g5,	%o0
	bg,pt	%icc,	loop_258
	edge32ln	%g7,	%i6,	%l3
	fmul8x16	%f8,	%f10,	%f22
	tl	%icc,	0x0
loop_258:
	bcc	loop_259
	movgu	%xcc,	%g4,	%i2
	wr	%g0,	0x0c,	%asi
	lduwa	[%l7 + 0x0C] %asi,	%o3
loop_259:
	array8	%l6,	%l0,	%o1
	fmovdleu	%icc,	%f11,	%f25
	fmovdge	%xcc,	%f26,	%f5
	tn	%icc,	0x3
	edge8l	%i1,	%i3,	%g3
	subccc	%l5,	0x17BA,	%l4
	taddcc	%o6,	0x0D1B,	%g6
	edge8l	%i7,	%i4,	%l2
	edge16	%l1,	%g1,	%g2
	brlz	%o7,	loop_260
	movrgz	%o2,	0x284,	%o5
	movrlz	%o4,	%i0,	%i5
	set	0x3F, %i4
	ldstuba	[%l7 + %i4] 0x19,	%o0
loop_260:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tle	%icc,	0x0
	xnor	%g5,	%i6,	%l3
	umulcc	%g7,	%g4,	%o3
	wr	%g0,	0x18,	%asi
	lduha	[%l7 + 0x72] %asi,	%i2
	edge32ln	%l6,	%l0,	%o1
	movleu	%xcc,	%i3,	%g3
	wr	%g0,	0x0c,	%asi
	ldstuba	[%l7 + 0x79] %asi,	%l5
	alignaddrl	%i1,	%l4,	%o6
	ldsh	[%l7 + 0x1E],	%g6
	movrne	%i4,	%i7,	%l1
	addccc	%g1,	0x0ADB,	%g2
	movvc	%xcc,	%o7,	%l2
	xorcc	%o2,	%o5,	%o4
	fmovse	%xcc,	%f30,	%f6
	fexpand	%f11,	%f12
	fands	%f3,	%f15,	%f17
	movrne	%i0,	0x122,	%i5
	sub	%g5,	0x0C5B,	%i6
	fbule	%fcc0,	loop_261
	fblg	%fcc0,	loop_262
	bvs,pt	%icc,	loop_263
	fmovsneg	%xcc,	%f14,	%f21
loop_261:
	sra	%l3,	%g7,	%o0
loop_262:
	nop
	setx loop_264, %l0, %l1
	jmpl %l1, %g4
loop_263:
	ldsw	[%l7 + 0x08],	%o3
	fmovrse	%i2,	%f3,	%f18
	or	%l6,	%l0,	%o1
loop_264:
	fcmpne16	%f30,	%f24,	%g3
	tvs	%icc,	0x2
	tgu	%icc,	0x4
	movl	%icc,	%l5,	%i3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stx	%l4,	[%l7 + 0x18]
	fmovrslez	%o6,	%f17,	%f24
	tneg	%icc,	0x5
	bgu	loop_265
	tvs	%xcc,	0x2
	xnor	%g6,	0x1D88,	%i4
	bg,a,pn	%xcc,	loop_266
loop_265:
	edge8	%i7,	%i1,	%g1
	fmul8x16	%f4,	%f14,	%f22
	andncc	%l1,	%g2,	%l2
loop_266:
	movrne	%o7,	%o5,	%o2
	swap	[%l7 + 0x14],	%i0
	tge	%xcc,	0x4
	subcc	%i5,	%o4,	%i6
	fcmple16	%f22,	%f26,	%l3
	fnor	%f12,	%f22,	%f0
	addccc	%g5,	0x134D,	%g7
	st	%f30,	[%l7 + 0x20]
	nop
	set	0x62, %o6
	lduh	[%l7 + %o6],	%g4
	tn	%icc,	0x1
	fmovs	%f24,	%f13
	tg	%icc,	0x0
	fnand	%f14,	%f12,	%f16
	edge32	%o3,	%i2,	%o0
	edge8l	%l6,	%o1,	%g3
	movcs	%icc,	%l0,	%i3
	sll	%l4,	0x15,	%l5
	lduh	[%l7 + 0x36],	%g6
	edge32ln	%i4,	%i7,	%o6
	fmovspos	%xcc,	%f17,	%f28
	sir	0x0C25
	fpadd16	%f16,	%f30,	%f10
	nop
	set	0x25, %i6
	ldstub	[%l7 + %i6],	%g1
	movpos	%xcc,	%i1,	%l1
	array16	%g2,	%o7,	%o5
	andn	%l2,	0x1BD9,	%o2
	tcc	%xcc,	0x4
	or	%i5,	%o4,	%i0
	udiv	%l3,	0x1911,	%g5
	fors	%f2,	%f5,	%f5
	fandnot1s	%f23,	%f6,	%f30
	std	%f8,	[%l7 + 0x18]
	te	%xcc,	0x1
	bcc,a,pn	%xcc,	loop_267
	fnands	%f22,	%f8,	%f20
	tvc	%icc,	0x1
	fmovsle	%xcc,	%f30,	%f12
loop_267:
	edge8	%g7,	%g4,	%i6
	movre	%o3,	0x03C,	%i2
	tsubcctv	%o0,	0x04AA,	%o1
	add	%l7,	0x2C,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%l6,	%g3
	fmovsvs	%icc,	%f25,	%f11
	nop
	setx	loop_268,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fbu	%fcc3,	loop_269
	flush	%l7 + 0x30
	tl	%xcc,	0x3
loop_268:
	move	%xcc,	%l0,	%i3
loop_269:
	edge8l	%l5,	%l4,	%g6
	xnor	%i7,	%o6,	%g1
	sdivcc	%i1,	0x1BB8,	%i4
	fpadd16s	%f19,	%f5,	%f14
	fmovsneg	%icc,	%f31,	%f11
	movleu	%icc,	%l1,	%o7
	bl,a	%icc,	loop_270
	bcc,a	loop_271
	brgez	%g2,	loop_272
	edge8l	%o5,	%o2,	%l2
loop_270:
	sub	%o4,	%i0,	%l3
loop_271:
	nop
	setx	loop_273,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_272:
	fbule	%fcc1,	loop_274
	tle	%xcc,	0x2
	fmovscs	%icc,	%f9,	%f23
loop_273:
	fmovsne	%xcc,	%f20,	%f9
loop_274:
	fba	%fcc1,	loop_275
	tl	%icc,	0x0
	movge	%icc,	%g5,	%i5
	fmovdl	%icc,	%f1,	%f17
loop_275:
	te	%icc,	0x4
	addc	%g4,	0x18E8,	%g7
	fmovrsgez	%i6,	%f28,	%f18
	bneg,pt	%icc,	loop_276
	edge8n	%o3,	%i2,	%o0
	fornot2	%f18,	%f10,	%f2
	sll	%l6,	0x12,	%g3
loop_276:
	alignaddr	%l0,	%o1,	%l5
	taddcc	%l4,	0x16C2,	%i3
	andcc	%i7,	%g6,	%o6
	fmul8x16au	%f14,	%f9,	%f12
	sdivx	%i1,	0x1370,	%i4
	bvc,pn	%xcc,	loop_277
	orn	%g1,	%l1,	%g2
	tcs	%xcc,	0x4
	fnot2s	%f4,	%f2
loop_277:
	fmul8x16al	%f14,	%f3,	%f16
	umul	%o5,	%o2,	%o7
	popc	0x0E3A,	%o4
	fbule	%fcc1,	loop_278
	fornot2s	%f12,	%f17,	%f10
	tneg	%icc,	0x6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_278:
	edge8l	%l2,	%i0,	%g5
	fmovspos	%icc,	%f8,	%f30
	fmovrsne	%l3,	%f17,	%f21
	sdiv	%g4,	0x02B6,	%g7
	fmul8x16	%f4,	%f6,	%f26
	movg	%icc,	%i5,	%i6
	fmovsvc	%icc,	%f0,	%f3
	andcc	%o3,	%i2,	%l6
	sub	%g3,	0x0A72,	%o0
	bneg,a	%xcc,	loop_279
	srlx	%l0,	0x07,	%l5
	edge32l	%o1,	%i3,	%l4
	ldsh	[%l7 + 0x16],	%g6
loop_279:
	array8	%o6,	%i7,	%i1
	srl	%i4,	%l1,	%g2
	movneg	%xcc,	%o5,	%g1
	fbe	%fcc0,	loop_280
	movl	%xcc,	%o2,	%o4
	fmul8sux16	%f0,	%f14,	%f18
	swap	[%l7 + 0x1C],	%o7
loop_280:
	tcc	%icc,	0x2
	set	0x36, %i2
	ldsha	[%l7 + %i2] 0x19,	%l2
	fabsd	%f4,	%f26
	te	%icc,	0x0
	bne,a	loop_281
	fblg	%fcc1,	loop_282
	edge8l	%i0,	%g5,	%l3
	brgez	%g7,	loop_283
loop_281:
	bge,a	loop_284
loop_282:
	tgu	%xcc,	0x1
	udivx	%g4,	0x150B,	%i5
loop_283:
	fbuge,a	%fcc3,	loop_285
loop_284:
	subc	%i6,	%i2,	%o3
	swap	[%l7 + 0x30],	%l6
	tsubcc	%o0,	%l0,	%l5
loop_285:
	array32	%g3,	%i3,	%l4
	fble	%fcc2,	loop_286
	nop
	setx	loop_287,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movne	%xcc,	%g6,	%o6
	fcmpd	%fcc0,	%f10,	%f24
loop_286:
	fmovsleu	%xcc,	%f8,	%f4
loop_287:
	orn	%o1,	0x15EE,	%i7
	siam	0x3
	fbuge,a	%fcc0,	loop_288
	fmovscc	%icc,	%f5,	%f24
	fbl	%fcc0,	loop_289
	bcs,a,pn	%xcc,	loop_290
loop_288:
	sdiv	%i1,	0x1799,	%i4
	xorcc	%g2,	%o5,	%g1
loop_289:
	lduw	[%l7 + 0x44],	%l1
loop_290:
	fand	%f24,	%f18,	%f0
	movrlz	%o4,	0x350,	%o7
	set	0x40, %l3
	stda	%f16,	[%l7 + %l3] 0x1f
	membar	#Sync
	fbule	%fcc3,	loop_291
	fandnot2	%f26,	%f16,	%f0
	fcmpeq32	%f22,	%f8,	%l2
	movre	%i0,	%o2,	%l3
loop_291:
	fandnot1s	%f8,	%f19,	%f5
	array32	%g7,	%g4,	%g5
	fornot2	%f12,	%f12,	%f24
	sethi	0x1FDA,	%i5
	edge8l	%i2,	%i6,	%l6
	brgez	%o0,	loop_292
	movge	%xcc,	%o3,	%l5
	tsubcctv	%g3,	0x1E44,	%i3
	movne	%xcc,	%l0,	%l4
loop_292:
	movl	%icc,	%g6,	%o6
	edge32ln	%o1,	%i1,	%i4
	fxnors	%f23,	%f10,	%f5
	ldsw	[%l7 + 0x24],	%g2
	tvs	%xcc,	0x7
	fandnot1s	%f8,	%f31,	%f7
	movpos	%icc,	%i7,	%o5
	fbg	%fcc0,	loop_293
	srlx	%g1,	%l1,	%o4
	ldx	[%l7 + 0x50],	%l2
	tsubcctv	%i0,	%o7,	%o2
loop_293:
	fmovd	%f24,	%f14
	tge	%xcc,	0x6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bcs,a,pt	%icc,	loop_294
	faligndata	%f0,	%f2,	%f30
	xnorcc	%g7,	%g4,	%l3
	fbg,a	%fcc0,	loop_295
loop_294:
	bcc,a	loop_296
	array32	%g5,	%i5,	%i6
	udiv	%l6,	0x1779,	%o0
loop_295:
	alignaddr	%o3,	%l5,	%g3
loop_296:
	subccc	%i3,	%l0,	%l4
	xorcc	%g6,	%i2,	%o1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sllx	%i1,	%o6,	%i4
	subcc	%g2,	%i7,	%g1
	array8	%o5,	%o4,	%l1
	fzeros	%f5
	movg	%icc,	%l2,	%i0
	set	0x18, %i0
	sta	%f29,	[%l7 + %i0] 0x19
	tcs	%icc,	0x6
	fmovdvs	%icc,	%f8,	%f5
	edge16n	%o2,	%g7,	%o7
	addcc	%l3,	0x16E1,	%g5
	tg	%icc,	0x1
	ble,pn	%icc,	loop_297
	move	%icc,	%g4,	%i5
	wr	%g0,	0x88,	%asi
	ldstuba	[%l7 + 0x4A] %asi,	%i6
loop_297:
	andn	%o0,	%o3,	%l5
	set	0x08, %l0
	stda	%g2,	[%l7 + %l0] 0x2a
	membar	#Sync
	orcc	%l6,	%l0,	%l4
	wr	%g0,	0x80,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	stb	%g6,	[%l7 + 0x6C]
	and	%i3,	0x0D14,	%o1
	fmovsleu	%icc,	%f25,	%f3
	tcc	%icc,	0x4
	movne	%xcc,	%i1,	%o6
	nop
	set	0x30, %l6
	stx	%i2,	[%l7 + %l6]
	srax	%g2,	0x16,	%i7
	ba,a	loop_298
	prefetch	[%l7 + 0x18],	 0x3
	movl	%xcc,	%g1,	%o5
	fnors	%f1,	%f24,	%f3
loop_298:
	fmovspos	%xcc,	%f25,	%f31
	brgz,a	%i4,	loop_299
	fmovsa	%icc,	%f3,	%f26
	srlx	%o4,	%l1,	%l2
	add	%o2,	%i0,	%g7
loop_299:
	edge32ln	%l3,	%g5,	%g4
	tvs	%icc,	0x2
	andncc	%i5,	%o7,	%i6
	popc	0x11AA,	%o0
	movre	%o3,	0x291,	%g3
	subc	%l5,	%l6,	%l0
	edge16ln	%l4,	%g6,	%i3
	tn	%icc,	0x2
	udiv	%o1,	0x0836,	%o6
	ble,a	%xcc,	loop_300
	tgu	%xcc,	0x0
	membar	0x64
	movn	%xcc,	%i1,	%i2
loop_300:
	fors	%f9,	%f19,	%f13
	xorcc	%i7,	0x1951,	%g2
	fnors	%f21,	%f4,	%f31
	tsubcc	%g1,	0x1411,	%o5
	andcc	%o4,	%l1,	%l2
	fnors	%f21,	%f26,	%f31
	fnegd	%f10,	%f0
	tgu	%xcc,	0x2
	udivx	%i4,	0x160F,	%o2
	tpos	%xcc,	0x4
	fbul	%fcc2,	loop_301
	edge32ln	%i0,	%l3,	%g5
	edge16ln	%g4,	%i5,	%o7
	sub	%i6,	%g7,	%o3
loop_301:
	umul	%o0,	%g3,	%l5
	tneg	%icc,	0x3
	fexpand	%f2,	%f26
	wr	%g0,	0x19,	%asi
	stba	%l0,	[%l7 + 0x28] %asi
	movcc	%icc,	%l6,	%g6
	bge,pn	%icc,	loop_302
	addc	%i3,	%l4,	%o6
	smulcc	%i1,	0x07F1,	%i2
	move	%icc,	%i7,	%o1
loop_302:
	sdivx	%g1,	0x1075,	%g2
	lduw	[%l7 + 0x1C],	%o5
	movn	%icc,	%o4,	%l2
	ldub	[%l7 + 0x4B],	%l1
	sdivcc	%i4,	0x1474,	%i0
	fbule,a	%fcc3,	loop_303
	andn	%l3,	0x1D09,	%o2
	movrgez	%g5,	%g4,	%i5
	movl	%xcc,	%o7,	%g7
loop_303:
	tpos	%icc,	0x7
	fsrc1	%f12,	%f2
	ta	%xcc,	0x4
	wr	%g0,	0x2a,	%asi
	stha	%i6,	[%l7 + 0x30] %asi
	membar	#Sync
	movre	%o3,	%g3,	%l5
	sth	%o0,	[%l7 + 0x5C]
	udivcc	%l6,	0x093D,	%l0
	tsubcctv	%g6,	%i3,	%l4
	movne	%xcc,	%i1,	%i2
	edge8l	%i7,	%o6,	%g1
	orcc	%g2,	0x0916,	%o1
	wr	%g0,	0x89,	%asi
	stwa	%o4,	[%l7 + 0x70] %asi
	movrlez	%l2,	0x0EC,	%l1
	fmovrdlz	%i4,	%f2,	%f16
	alignaddr	%i0,	%o5,	%l3
	brz	%o2,	loop_304
	movrgez	%g4,	0x13F,	%i5
	tvc	%icc,	0x6
	taddcc	%o7,	%g7,	%i6
loop_304:
	brz	%g5,	loop_305
	ldd	[%l7 + 0x78],	%f26
	edge32ln	%g3,	%o3,	%o0
	bcc,a,pt	%icc,	loop_306
loop_305:
	sir	0x1CBE
	edge16l	%l5,	%l6,	%g6
	sub	%i3,	0x00CC,	%l0
loop_306:
	movl	%icc,	%i1,	%l4
	fornot1s	%f12,	%f5,	%f29
	movrlez	%i7,	%o6,	%g1
	fnot2	%f10,	%f0
	fmovdge	%xcc,	%f15,	%f25
	fandnot2s	%f15,	%f4,	%f29
	edge8n	%g2,	%o1,	%i2
	tpos	%icc,	0x6
	set	0x48, %i7
	prefetcha	[%l7 + %i7] 0x14,	 0x2
	taddcc	%l2,	0x193C,	%l1
	subcc	%i0,	%o5,	%i4
	fsrc1s	%f19,	%f12
	sub	%l3,	%o2,	%i5
	andcc	%o7,	0x1C80,	%g7
	tne	%icc,	0x1
	movvs	%icc,	%i6,	%g5
	fand	%f10,	%f26,	%f30
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tsubcc	%g3,	0x135E,	%g4
	fbn	%fcc1,	loop_307
	ldstub	[%l7 + 0x44],	%o0
	edge8n	%l5,	%o3,	%l6
	tg	%icc,	0x7
loop_307:
	edge8ln	%g6,	%i3,	%l0
	stb	%l4,	[%l7 + 0x11]
	movge	%xcc,	%i1,	%i7
	movrlez	%g1,	0x2B5,	%g2
	orncc	%o6,	%o1,	%o4
	udiv	%i2,	0x1938,	%l1
	edge8	%i0,	%o5,	%l2
	and	%l3,	%o2,	%i4
	fnegs	%f29,	%f27
	fpsub32s	%f24,	%f29,	%f5
	stw	%o7,	[%l7 + 0x08]
	srax	%g7,	%i6,	%i5
	orn	%g5,	0x033C,	%g3
	array32	%g4,	%l5,	%o3
	fabss	%f24,	%f1
	tneg	%xcc,	0x2
	fnands	%f18,	%f1,	%f18
	fbule	%fcc0,	loop_308
	fmovsa	%icc,	%f23,	%f20
	add	%l7,	0x10,	%l6
	wr	%g0,	0x19,	%asi
	casxa	[%l6] %asi,	%l6,	%g6
loop_308:
	array8	%i3,	%l0,	%l4
	membar	#Sync
	set	0x40, %o2
	ldda	[%l7 + %o2] 0x17,	%f16
	membar	0x05
	set	0x4C, %g2
	ldswa	[%l7 + %g2] 0x19,	%o0
	edge16ln	%i7,	%g1,	%i1
	edge8l	%g2,	%o1,	%o4
	edge32n	%i2,	%l1,	%o6
	sra	%o5,	0x01,	%i0
	edge32l	%l3,	%o2,	%i4
	sub	%o7,	%g7,	%l2
	mova	%xcc,	%i6,	%i5
	smulcc	%g5,	0x0757,	%g3
	subcc	%l5,	%g4,	%l6
	addccc	%g6,	%i3,	%o3
	set	0x4C, %l4
	ldswa	[%l7 + %l4] 0x18,	%l4
	fnor	%f6,	%f20,	%f14
	popc	0x109F,	%o0
	movrne	%i7,	0x184,	%l0
	set	0x20, %g1
	stxa	%i1,	[%l7 + %g1] 0x2a
	membar	#Sync
	edge8n	%g1,	%o1,	%o4
	tvs	%icc,	0x3
	fmovde	%icc,	%f3,	%f21
	fmovrdgez	%g2,	%f10,	%f8
	fone	%f22
	popc	0x0F4D,	%l1
	ble,a	%icc,	loop_309
	fmovsneg	%icc,	%f0,	%f16
	edge16ln	%o6,	%o5,	%i2
	umul	%i0,	0x060B,	%o2
loop_309:
	edge16n	%l3,	%i4,	%g7
	addccc	%l2,	0x1456,	%i6
	tne	%xcc,	0x2
	edge32n	%i5,	%g5,	%o7
	tsubcctv	%l5,	0x144E,	%g3
	edge16n	%l6,	%g6,	%i3
	tl	%icc,	0x1
	movge	%icc,	%o3,	%g4
	edge8	%o0,	%l4,	%l0
	fandnot1	%f6,	%f10,	%f30
	andcc	%i7,	0x13EE,	%i1
	taddcctv	%g1,	0x167B,	%o1
	fbne	%fcc3,	loop_310
	brlz	%g2,	loop_311
	movrgez	%l1,	%o6,	%o5
	xorcc	%i2,	0x0C6B,	%o4
loop_310:
	edge16l	%o2,	%l3,	%i4
loop_311:
	tne	%xcc,	0x4
	movn	%xcc,	%i0,	%l2
	edge16	%i6,	%g7,	%g5
	taddcc	%i5,	%l5,	%o7
	xnor	%g3,	0x1AFA,	%l6
	sllx	%g6,	%i3,	%o3
	edge16l	%g4,	%l4,	%l0
	srlx	%o0,	%i7,	%i1
	bl,a	%xcc,	loop_312
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrgz	%o1,	%g1,	%l1
	ldsw	[%l7 + 0x28],	%o6
loop_312:
	fsrc1s	%f10,	%f15
	fornot1s	%f17,	%f3,	%f2
	ble,pt	%icc,	loop_313
	movre	%g2,	0x2D6,	%o5
	fmul8x16al	%f27,	%f21,	%f28
	fmovsg	%icc,	%f19,	%f12
loop_313:
	tle	%xcc,	0x4
	and	%i2,	0x0785,	%o4
	fmovdvc	%xcc,	%f22,	%f12
	ldstub	[%l7 + 0x41],	%l3
	fcmpgt32	%f26,	%f8,	%o2
	fbug	%fcc1,	loop_314
	fmovdgu	%xcc,	%f24,	%f13
	sdiv	%i4,	0x18E8,	%i0
	movrgz	%l2,	%i6,	%g5
loop_314:
	nop
	set	0x18, %l1
	ldsha	[%l7 + %l1] 0x14,	%g7
	andcc	%i5,	0x0C26,	%l5
	sllx	%g3,	0x12,	%l6
	fblg,a	%fcc3,	loop_315
	std	%o6,	[%l7 + 0x68]
	movne	%icc,	%i3,	%o3
	fmovsge	%icc,	%f18,	%f10
loop_315:
	edge8n	%g4,	%l4,	%l0
	movgu	%icc,	%g6,	%o0
	popc	%i1,	%o1
	fnot1s	%f20,	%f27
	sth	%i7,	[%l7 + 0x7A]
	sra	%g1,	%l1,	%o6
	movrgz	%g2,	0x10A,	%i2
	fmovdne	%icc,	%f17,	%f17
	udivx	%o5,	0x1BD4,	%o4
	tle	%icc,	0x0
	movl	%xcc,	%l3,	%o2
	set	0x6C, %o7
	stwa	%i4,	[%l7 + %o7] 0xea
	membar	#Sync
	brgz	%i0,	loop_316
	tgu	%xcc,	0x4
	fmovrdne	%i6,	%f30,	%f0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_316:
	bvc	%xcc,	loop_317
	bge,a	%icc,	loop_318
	edge32n	%l2,	%g7,	%i5
	membar	0x1F
loop_317:
	mulscc	%g5,	0x0815,	%l5
loop_318:
	array8	%g3,	%o7,	%i3
	fmovsl	%xcc,	%f22,	%f20
	orn	%o3,	0x1437,	%g4
	fmovdcc	%icc,	%f11,	%f15
	alignaddrl	%l6,	%l0,	%l4
	addc	%g6,	%o0,	%o1
	wr	%g0,	0x89,	%asi
	stda	%i6,	[%l7 + 0x40] %asi
	fpack32	%f26,	%f6,	%f24
	movleu	%xcc,	%i1,	%l1
	tneg	%icc,	0x5
	tcc	%xcc,	0x2
	andncc	%o6,	%g1,	%g2
	movrlez	%i2,	0x312,	%o4
	edge8	%o5,	%l3,	%o2
	fcmpes	%fcc0,	%f29,	%f6
	fmovdvs	%icc,	%f18,	%f5
	smulcc	%i0,	0x04F2,	%i6
	sll	%l2,	0x05,	%i4
	subc	%i5,	0x18C9,	%g5
	edge16l	%g7,	%l5,	%g3
	fornot2	%f2,	%f22,	%f4
	set	0x2E, %g7
	ldsha	[%l7 + %g7] 0x88,	%o7
	fone	%f24
	bpos,pt	%xcc,	loop_319
	fmovrdne	%i3,	%f24,	%f6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movleu	%xcc,	%g4,	%l6
loop_319:
	or	%l0,	%l4,	%g6
	edge32l	%o0,	%o1,	%o3
	sllx	%i1,	%l1,	%o6
	std	%f6,	[%l7 + 0x18]
	fmovsg	%xcc,	%f8,	%f15
	edge8	%g1,	%g2,	%i2
	sub	%i7,	0x036B,	%o5
	wr	%g0,	0x11,	%asi
	stwa	%l3,	[%l7 + 0x50] %asi
	fnands	%f31,	%f3,	%f23
	nop
	setx	loop_320,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fone	%f30
	sllx	%o4,	%i0,	%o2
	andn	%l2,	%i4,	%i6
loop_320:
	bleu	%icc,	loop_321
	fmovrsgz	%i5,	%f2,	%f17
	fbl,a	%fcc3,	loop_322
	movcc	%xcc,	%g5,	%g7
loop_321:
	be,a,pn	%icc,	loop_323
	sdivcc	%l5,	0x08B8,	%o7
loop_322:
	umulcc	%g3,	%i3,	%l6
	tne	%icc,	0x4
loop_323:
	fmovsa	%icc,	%f7,	%f13
	fmovdleu	%icc,	%f2,	%f19
	sra	%l0,	%g4,	%l4
	srlx	%g6,	0x0D,	%o1
	tsubcctv	%o0,	0x1AA1,	%i1
	fxnor	%f4,	%f30,	%f16
	tvc	%icc,	0x3
	and	%l1,	%o3,	%o6
	and	%g2,	%g1,	%i2
	sdivcc	%i7,	0x1408,	%l3
	movvc	%icc,	%o5,	%i0
	fsrc1s	%f0,	%f14
	ldd	[%l7 + 0x60],	%o2
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x72] %asi,	%o4
	fba	%fcc0,	loop_324
	edge32	%i4,	%l2,	%i5
	fcmpeq16	%f28,	%f26,	%g5
	movcc	%icc,	%g7,	%l5
loop_324:
	tge	%xcc,	0x6
	tvs	%xcc,	0x7
	bl,pt	%icc,	loop_325
	ba,pn	%xcc,	loop_326
	edge32ln	%i6,	%o7,	%g3
	wr	%g0,	0xe3,	%asi
	stha	%i3,	[%l7 + 0x76] %asi
	membar	#Sync
loop_325:
	sdiv	%l6,	0x129B,	%g4
loop_326:
	call	loop_327
	fmul8x16au	%f16,	%f31,	%f22
	udivx	%l4,	0x117F,	%g6
	wr	%g0,	0x22,	%asi
	stxa	%l0,	[%l7 + 0x58] %asi
	membar	#Sync
loop_327:
	or	%o0,	0x018A,	%o1
	fsrc2	%f22,	%f18
	fmovdl	%icc,	%f30,	%f7
	fmovsvs	%xcc,	%f3,	%f27
	set	0x58, %o4
	stxa	%i1,	[%l7 + %o4] 0xe2
	membar	#Sync
	wr	%g0,	0x88,	%asi
	ldstuba	[%l7 + 0x50] %asi,	%l1
	srlx	%o3,	0x10,	%o6
	bcc,a	%xcc,	loop_328
	tgu	%icc,	0x3
	ba,a,pt	%xcc,	loop_329
	tg	%icc,	0x3
loop_328:
	tgu	%xcc,	0x7
	brgez	%g2,	loop_330
loop_329:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tsubcctv	%g1,	%i2,	%i7
	sra	%l3,	%i0,	%o5
loop_330:
	nop
	set	0x8, %o5
	stxa	%o4,	[%g0 + %o5] 0x20
	orn	%i4,	%l2,	%o2
	fmovsa	%icc,	%f22,	%f29
	fsrc1	%f14,	%f8
	set	0x110, %l2
	ldxa	[%g0 + %l2] 0x21,	%i5
	tvc	%icc,	0x3
	ta	%icc,	0x4
	movcc	%xcc,	%g7,	%l5
	movrne	%i6,	0x1CF,	%o7
	bg,a	loop_331
	edge32n	%g5,	%g3,	%l6
	add	%i3,	0x091A,	%g4
	wr	%g0,	0x80,	%asi
	swapa	[%l7 + 0x3C] %asi,	%g6
loop_331:
	fmovrdne	%l0,	%f2,	%f4
	movne	%icc,	%o0,	%o1
	fnot1s	%f0,	%f9
	nop
	setx	loop_332,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	brz	%l4,	loop_333
	orn	%i1,	%l1,	%o3
	addccc	%g2,	0x0DAC,	%g1
loop_332:
	andcc	%o6,	0x0E01,	%i7
loop_333:
	movgu	%xcc,	%i2,	%l3
	xnor	%i0,	0x1952,	%o4
	set	0x50, %o0
	prefetcha	[%l7 + %o0] 0x19,	 0x2
	orcc	%i4,	%l2,	%i5
	fpsub16s	%f18,	%f13,	%f10
	fmovse	%xcc,	%f31,	%f0
	fors	%f6,	%f11,	%f30
	wr	%g0,	0x04,	%asi
	ldstuba	[%l7 + 0x3D] %asi,	%g7
	fornot2s	%f16,	%f21,	%f20
	fcmpne16	%f8,	%f30,	%l5
	prefetch	[%l7 + 0x20],	 0x3
	fnand	%f10,	%f10,	%f28
	andncc	%o2,	%o7,	%i6
	edge32l	%g3,	%l6,	%i3
	brgez,a	%g5,	loop_334
	tvc	%icc,	0x4
	array8	%g4,	%l0,	%o0
	orncc	%g6,	0x08D5,	%o1
loop_334:
	sethi	0x0CDB,	%l4
	fxors	%f4,	%f3,	%f26
	tcc	%icc,	0x3
	addc	%i1,	%l1,	%g2
	fmovsl	%icc,	%f8,	%f16
	sll	%g1,	%o6,	%o3
	set	0x40, %g4
	stda	%f16,	[%l7 + %g4] 0x10
	udivcc	%i7,	0x1E44,	%i2
	fxnor	%f8,	%f4,	%f28
	movne	%xcc,	%i0,	%l3
	movre	%o4,	%o5,	%l2
	tcs	%icc,	0x5
	add	%l7,	0x40,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%i4,	%i5
	set	0x28, %g5
	stda	%g6,	[%l7 + %g5] 0xeb
	membar	#Sync
	fpsub16s	%f4,	%f15,	%f31
	fbuge,a	%fcc2,	loop_335
	tgu	%xcc,	0x1
	udiv	%l5,	0x16CE,	%o2
	addcc	%i6,	0x01E4,	%g3
loop_335:
	tcc	%icc,	0x1
	tneg	%icc,	0x4
	addc	%l6,	0x07B2,	%i3
	orcc	%o7,	0x1E8A,	%g4
	tle	%xcc,	0x5
	addc	%g5,	0x03FC,	%o0
	fpadd32s	%f26,	%f11,	%f6
	fmovdcc	%icc,	%f18,	%f24
	fmovdpos	%xcc,	%f24,	%f28
	srl	%l0,	%g6,	%l4
	swap	[%l7 + 0x50],	%i1
	fbug	%fcc0,	loop_336
	fbul	%fcc3,	loop_337
	movpos	%xcc,	%o1,	%g2
	fnot1s	%f11,	%f29
loop_336:
	edge16l	%g1,	%o6,	%l1
loop_337:
	fmovscc	%icc,	%f7,	%f3
	wr	%g0,	0x89,	%asi
	ldsha	[%l7 + 0x5A] %asi,	%i7
	xorcc	%o3,	0x1BA7,	%i0
	fbul	%fcc2,	loop_338
	fbl,a	%fcc0,	loop_339
	fabss	%f12,	%f26
	ble	loop_340
loop_338:
	te	%icc,	0x7
loop_339:
	fpmerge	%f15,	%f17,	%f20
	movcc	%xcc,	%l3,	%o4
loop_340:
	fnands	%f22,	%f17,	%f11
	srax	%i2,	0x17,	%l2
	tpos	%xcc,	0x5
	tleu	%icc,	0x5
	srax	%i4,	0x1B,	%i5
	bl,pn	%icc,	loop_341
	fsrc1	%f0,	%f4
	fbul,a	%fcc0,	loop_342
	edge16l	%g7,	%o5,	%l5
loop_341:
	nop
	setx loop_343, %l0, %l1
	jmpl %l1, %i6
	taddcc	%g3,	%l6,	%o2
loop_342:
	nop
	wr	%g0,	0x18,	%asi
	ldsha	[%l7 + 0x0C] %asi,	%i3
loop_343:
	movn	%xcc,	%o7,	%g5
	fmovdl	%xcc,	%f13,	%f25
	movvc	%icc,	%o0,	%l0
	fbne	%fcc3,	loop_344
	edge16l	%g4,	%l4,	%g6
	brgz	%o1,	loop_345
	tleu	%xcc,	0x3
loop_344:
	nop
	wr	%g0,	0x18,	%asi
	ldsba	[%l7 + 0x71] %asi,	%g2
loop_345:
	fones	%f13
	fmovrsne	%g1,	%f9,	%f14
	fsrc2	%f0,	%f2
	sll	%i1,	%l1,	%o6
	taddcctv	%i7,	%i0,	%l3
	fcmple16	%f8,	%f2,	%o4
	tvc	%icc,	0x3
	udiv	%i2,	0x1457,	%o3
	tg	%icc,	0x2
	sdiv	%i4,	0x11FE,	%i5
	fmovda	%icc,	%f20,	%f9
	edge16ln	%l2,	%o5,	%l5
	membar	0x0D
	movrne	%i6,	0x2A7,	%g7
	ldsw	[%l7 + 0x5C],	%l6
	ldd	[%l7 + 0x48],	%o2
	tleu	%icc,	0x5
	fxnor	%f28,	%f30,	%f8
	fmovsne	%xcc,	%f30,	%f24
	ta	%xcc,	0x6
	tne	%xcc,	0x5
	tcs	%icc,	0x7
	orcc	%g3,	0x07EE,	%i3
	tleu	%xcc,	0x3
	movge	%icc,	%g5,	%o0
	subc	%l0,	%o7,	%g4
	sethi	0x1003,	%g6
	ldsh	[%l7 + 0x5E],	%o1
	tn	%xcc,	0x6
	edge32ln	%l4,	%g2,	%g1
	movrlz	%i1,	%o6,	%i7
	movrne	%i0,	0x334,	%l3
	tcc	%xcc,	0x0
	movge	%xcc,	%o4,	%l1
	edge8n	%o3,	%i4,	%i5
	sub	%i2,	%l2,	%l5
	edge16n	%i6,	%g7,	%o5
	set	0x20, %g3
	prefetcha	[%l7 + %g3] 0x14,	 0x0
	fnor	%f0,	%f28,	%f30
	movrne	%o2,	%g3,	%i3
	tvs	%xcc,	0x1
	andcc	%o0,	%g5,	%o7
	movrlez	%l0,	0x1EE,	%g4
	wr	%g0,	0x20,	%asi
	stxa	%o1,	[%g0 + 0x18] %asi
	tneg	%xcc,	0x6
	ldd	[%l7 + 0x28],	%f18
	smulcc	%g6,	%g2,	%l4
	udivcc	%g1,	0x1750,	%i1
	fone	%f18
	brlz,a	%i7,	loop_346
	xorcc	%i0,	0x1C2B,	%l3
	wr	%g0,	0xe2,	%asi
	stba	%o4,	[%l7 + 0x6D] %asi
	membar	#Sync
loop_346:
	movle	%xcc,	%o6,	%o3
	set	0x60, %i1
	stba	%l1,	[%l7 + %i1] 0x18
	movrne	%i4,	%i5,	%l2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sllx	%i2,	0x1A,	%l5
	tg	%xcc,	0x7
	edge32l	%g7,	%i6,	%o5
	array32	%o2,	%g3,	%i3
	fmovrdgz	%o0,	%f26,	%f4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	call	loop_347
	movcs	%icc,	%g5,	%o7
	fmovrse	%l6,	%f22,	%f24
	subcc	%g4,	0x09EA,	%l0
loop_347:
	nop
	wr	%g0,	0xea,	%asi
	ldda	[%l7 + 0x60] %asi,	%o0
	sdiv	%g2,	0x1EDE,	%g6
	brgz	%l4,	loop_348
	subc	%i1,	0x18C9,	%i7
	array8	%g1,	%i0,	%l3
	xorcc	%o6,	%o4,	%o3
loop_348:
	tpos	%xcc,	0x7
	fmovsle	%xcc,	%f9,	%f28
	fba	%fcc1,	loop_349
	subccc	%i4,	%l1,	%l2
	fbug	%fcc1,	loop_350
	movrgz	%i2,	0x3B6,	%l5
loop_349:
	fnot1s	%f17,	%f17
	ldub	[%l7 + 0x35],	%i5
loop_350:
	srlx	%i6,	%g7,	%o2
	fnegd	%f28,	%f20
	bgu,pt	%icc,	loop_351
	taddcc	%o5,	%i3,	%o0
	edge32ln	%g3,	%g5,	%o7
	fmovdne	%xcc,	%f18,	%f21
loop_351:
	fcmpgt32	%f10,	%f12,	%g4
	addccc	%l0,	0x0DB2,	%o1
	edge8	%g2,	%l6,	%l4
	fcmpne32	%f4,	%f12,	%g6
	movcs	%icc,	%i7,	%g1
	xor	%i0,	0x16FF,	%l3
	brlz,a	%i1,	loop_352
	mulscc	%o6,	%o3,	%o4
	sir	0x1AB9
	smulcc	%l1,	0x0BA6,	%l2
loop_352:
	movrne	%i2,	0x36B,	%l5
	edge16l	%i5,	%i6,	%g7
	taddcc	%i4,	0x17A0,	%o5
	edge16l	%i3,	%o0,	%o2
	fmovse	%icc,	%f1,	%f8
	subcc	%g5,	%g3,	%o7
	fcmpd	%fcc1,	%f10,	%f30
	edge8n	%g4,	%o1,	%g2
	bpos,pt	%icc,	loop_353
	tg	%xcc,	0x2
	edge8	%l0,	%l4,	%l6
	smul	%i7,	%g1,	%i0
loop_353:
	mulscc	%l3,	%i1,	%g6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsh	[%l7 + 0x26],	%o3
	alignaddrl	%o6,	%o4,	%l1
	edge32ln	%i2,	%l5,	%i5
	taddcc	%l2,	0x1C74,	%g7
	fnand	%f10,	%f28,	%f8
	array16	%i4,	%i6,	%i3
	edge8l	%o5,	%o2,	%g5
	fnands	%f4,	%f12,	%f16
	wr	%g0,	0x80,	%asi
	prefetcha	[%l7 + 0x38] %asi,	 0x2
	bcc,a,pt	%xcc,	loop_354
	or	%o7,	%g3,	%g4
	fsrc1	%f2,	%f16
	movle	%icc,	%g2,	%o1
loop_354:
	smul	%l4,	0x054A,	%l6
	tl	%xcc,	0x6
	orn	%i7,	%l0,	%i0
	andcc	%l3,	0x0E12,	%i1
	array8	%g1,	%g6,	%o6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrgez	%o3,	0x3AD,	%o4
	std	%i2,	[%l7 + 0x08]
	movpos	%icc,	%l5,	%l1
	tneg	%xcc,	0x0
	fbul	%fcc0,	loop_355
	fbge,a	%fcc2,	loop_356
	tg	%icc,	0x0
	membar	0x6E
loop_355:
	bshuffle	%f14,	%f20,	%f4
loop_356:
	movg	%xcc,	%i5,	%g7
	tcc	%xcc,	0x7
	fxnor	%f12,	%f0,	%f4
	add	%l7,	0x0C,	%l6
	wr	%g0,	0x0c,	%asi
	lda	[%l6] %asi,	%i4
	casa	[%l6] %asi,	%i4,	%l2
	tvs	%icc,	0x5
	prefetch	[%l7 + 0x10],	 0x1
	stx	%i6,	[%l7 + 0x78]
	fmul8x16al	%f6,	%f1,	%f20
	set	0x30, %g6
	stwa	%i3,	[%l7 + %g6] 0xeb
	membar	#Sync
	srl	%o5,	%o2,	%g5
	andncc	%o7,	%g3,	%g4
	movcc	%xcc,	%g2,	%o0
	movge	%xcc,	%l4,	%o1
	srlx	%i7,	0x0C,	%l0
	fpmerge	%f9,	%f27,	%f8
	bleu,pn	%icc,	loop_357
	edge8n	%l6,	%i0,	%i1
	fpsub32s	%f17,	%f28,	%f8
	tcs	%icc,	0x2
loop_357:
	sllx	%g1,	0x11,	%g6
	edge32n	%l3,	%o3,	%o4
	fblg,a	%fcc1,	loop_358
	movle	%icc,	%o6,	%i2
	andcc	%l5,	%i5,	%g7
	tsubcctv	%i4,	0x0AC0,	%l1
loop_358:
	xor	%l2,	%i3,	%o5
	bvc	%xcc,	loop_359
	fmovdl	%xcc,	%f6,	%f24
	fmovsgu	%xcc,	%f0,	%f6
	add	%l7,	0x60,	%l6
	wr	%g0,	0x0c,	%asi
	casxa	[%l6] 0x0c,	%i6,	%g5
loop_359:
	fornot1s	%f21,	%f11,	%f29
	alignaddrl	%o7,	%g3,	%o2
	fbule,a	%fcc0,	loop_360
	add	%g4,	0x13EE,	%g2
	and	%l4,	%o1,	%i7
	edge32	%l0,	%l6,	%i0
loop_360:
	nop
	add	%l7,	0x08,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%i1
	casxa	[%l6] %asi,	%i1,	%o0
	srlx	%g6,	0x05,	%g1
	fbe,a	%fcc0,	loop_361
	fmul8x16al	%f31,	%f2,	%f10
	bshuffle	%f4,	%f2,	%f26
	sdivx	%o3,	0x0C14,	%o4
loop_361:
	edge16n	%o6,	%l3,	%i2
	nop
	set	0x61, %i3
	ldstub	[%l7 + %i3],	%l5
	te	%icc,	0x3
	array32	%g7,	%i5,	%i4
	brlz,a	%l1,	loop_362
	smulcc	%l2,	0x0452,	%o5
	brz,a	%i6,	loop_363
	tleu	%icc,	0x5
loop_362:
	membar	0x68
	ldd	[%l7 + 0x38],	%f8
loop_363:
	tneg	%icc,	0x1
	sdivx	%i3,	0x0A10,	%g5
	edge32	%o7,	%g3,	%g4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	brlez,a	%o2,	loop_364
	fabss	%f9,	%f20
	fandnot1s	%f3,	%f7,	%f0
	nop
	set	0x46, %l5
	stb	%l4,	[%l7 + %l5]
loop_364:
	sdiv	%g2,	0x123B,	%o1
	stx	%l0,	[%l7 + 0x48]
	movl	%icc,	%l6,	%i0
	edge16n	%i7,	%i1,	%o0
	ta	%icc,	0x7
	fmovrslz	%g6,	%f0,	%f19
	be,a	%icc,	loop_365
	fcmpeq16	%f0,	%f4,	%o3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tgu	%xcc,	0x5
loop_365:
	tsubcctv	%o4,	0x16A1,	%o6
	alignaddrl	%g1,	%l3,	%l5
	taddcctv	%i2,	%i5,	%i4
	orn	%g7,	0x1BE4,	%l2
	fmovrdgez	%o5,	%f24,	%f30
	sdivcc	%l1,	0x18DD,	%i3
	fmovrsgz	%g5,	%f0,	%f25
	fmovdg	%icc,	%f6,	%f24
	sra	%i6,	0x1B,	%o7
	bneg	loop_366
	addc	%g3,	0x0111,	%o2
	smul	%g4,	0x1465,	%g2
	movcs	%icc,	%o1,	%l0
loop_366:
	alignaddrl	%l4,	%i0,	%l6
	fbule	%fcc0,	loop_367
	orcc	%i7,	%i1,	%o0
	mova	%icc,	%o3,	%o4
	subc	%o6,	0x0DFD,	%g1
loop_367:
	te	%icc,	0x4
	bne,a,pn	%xcc,	loop_368
	tgu	%icc,	0x0
	fbug	%fcc1,	loop_369
	edge16n	%g6,	%l5,	%l3
loop_368:
	tcc	%icc,	0x4
	smul	%i5,	%i2,	%i4
loop_369:
	fmovrsgz	%l2,	%f16,	%f4
	swap	[%l7 + 0x10],	%o5
	fbe	%fcc2,	loop_370
	fmovdneg	%xcc,	%f4,	%f29
	fmovsl	%icc,	%f6,	%f24
	brnz,a	%g7,	loop_371
loop_370:
	orcc	%i3,	0x176E,	%l1
	bg	%xcc,	loop_372
	subcc	%g5,	0x0ED2,	%i6
loop_371:
	xor	%g3,	0x0352,	%o2
	fmovsa	%xcc,	%f11,	%f12
loop_372:
	array16	%g4,	%o7,	%g2
	movcc	%icc,	%o1,	%l0
	add	%l4,	%l6,	%i7
	brgz	%i0,	loop_373
	ba,a,pn	%xcc,	loop_374
	faligndata	%f20,	%f24,	%f28
	alignaddrl	%o0,	%o3,	%i1
loop_373:
	membar	0x07
loop_374:
	edge8ln	%o4,	%o6,	%g1
	udiv	%l5,	0x1EC4,	%l3
	edge16l	%g6,	%i2,	%i4
	umul	%i5,	%l2,	%o5
	fcmpd	%fcc2,	%f0,	%f12
	fnegs	%f23,	%f26
	sllx	%i3,	0x0B,	%l1
	stw	%g5,	[%l7 + 0x44]
	set	0x18, %i5
	swapa	[%l7 + %i5] 0x19,	%i6
	subccc	%g7,	0x06E3,	%g3
	fand	%f26,	%f10,	%f2
	movleu	%icc,	%o2,	%o7
	bcs,pt	%xcc,	loop_375
	or	%g2,	%g4,	%o1
	set	0x40, %o3
	ldda	[%l7 + %o3] 0x88,	%f16
loop_375:
	te	%icc,	0x5
	edge32ln	%l0,	%l6,	%l4
	orncc	%i7,	%i0,	%o0
	fbule	%fcc0,	loop_376
	ldsh	[%l7 + 0x7A],	%i1
	xnorcc	%o4,	%o3,	%g1
	fmovsvs	%xcc,	%f5,	%f8
loop_376:
	ldsb	[%l7 + 0x0C],	%l5
	fmovdle	%xcc,	%f20,	%f28
	membar	0x40
	fmovda	%icc,	%f6,	%f13
	subc	%l3,	0x0F56,	%o6
	movrlz	%g6,	%i2,	%i4
	flush	%l7 + 0x60
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbe	%fcc2,	loop_377
	edge8n	%l2,	%i5,	%i3
	sub	%o5,	%l1,	%g5
	bvs	loop_378
loop_377:
	tsubcc	%i6,	0x17B5,	%g7
	fpadd32s	%f0,	%f9,	%f8
	bcc,pn	%icc,	loop_379
loop_378:
	fmovsneg	%icc,	%f19,	%f30
	fmovsne	%xcc,	%f30,	%f1
	bne,a	%icc,	loop_380
loop_379:
	orcc	%o2,	%o7,	%g3
	tsubcctv	%g2,	0x0537,	%o1
	tl	%icc,	0x2
loop_380:
	bneg,a,pn	%xcc,	loop_381
	srlx	%l0,	0x10,	%l6
	fcmpgt16	%f4,	%f6,	%l4
	ldub	[%l7 + 0x58],	%i7
loop_381:
	alignaddr	%i0,	%g4,	%o0
	fmovsvs	%xcc,	%f1,	%f3
	edge8l	%o4,	%i1,	%g1
	fbuge	%fcc0,	loop_382
	movgu	%xcc,	%o3,	%l3
	lduh	[%l7 + 0x16],	%l5
	edge16l	%o6,	%g6,	%i4
loop_382:
	tg	%icc,	0x4
	umulcc	%i2,	0x1FC0,	%l2
	movneg	%xcc,	%i5,	%i3
	wr	%g0,	0x88,	%asi
	ldswa	[%l7 + 0x1C] %asi,	%l1
	movle	%xcc,	%g5,	%o5
	brlez,a	%i6,	loop_383
	movne	%icc,	%g7,	%o2
	edge8l	%g3,	%o7,	%o1
	srax	%l0,	0x0A,	%l6
loop_383:
	ld	[%l7 + 0x14],	%f5
	fmul8x16	%f0,	%f8,	%f12
	movpos	%icc,	%l4,	%i7
	mova	%xcc,	%i0,	%g2
	fmovdcc	%xcc,	%f0,	%f16
	sdivx	%o0,	0x0CE4,	%o4
	orncc	%i1,	0x198D,	%g1
	sra	%g4,	%o3,	%l3
	movle	%icc,	%o6,	%g6
	tg	%xcc,	0x6
	ta	%icc,	0x7
	edge8l	%i4,	%i2,	%l5
	edge32l	%l2,	%i3,	%l1
	sra	%g5,	%i5,	%o5
	movvc	%icc,	%g7,	%i6
	fbn,a	%fcc2,	loop_384
	pdist	%f12,	%f14,	%f30
	umulcc	%g3,	0x1831,	%o2
	fcmpeq16	%f22,	%f10,	%o1
loop_384:
	lduw	[%l7 + 0x58],	%l0
	edge32	%l6,	%o7,	%i7
	sdivx	%i0,	0x19A1,	%g2
	array8	%o0,	%l4,	%o4
	tneg	%icc,	0x4
	fbl,a	%fcc3,	loop_385
	addccc	%i1,	%g1,	%g4
	umulcc	%l3,	%o3,	%o6
	movge	%xcc,	%g6,	%i4
loop_385:
	nop
	set	0x5C, %i4
	swapa	[%l7 + %i4] 0x89,	%l5
	alignaddrl	%l2,	%i3,	%i2
	srax	%l1,	0x0B,	%i5
	nop
	setx	loop_386,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	swap	[%l7 + 0x34],	%o5
	alignaddrl	%g7,	%g5,	%g3
loop_386:
	fpack16	%f0,	%f28
	movn	%icc,	%i6,	%o2
	edge32ln	%o1,	%l0,	%l6
	ld	[%l7 + 0x0C],	%f0
	xnor	%i7,	%o7,	%i0
	movrne	%o0,	0x288,	%l4
	mulscc	%o4,	0x0A73,	%i1
	tg	%icc,	0x5
	edge32l	%g1,	%g2,	%g4
	sra	%o3,	%l3,	%o6
	subcc	%g6,	0x007C,	%i4
	fone	%f20
	fbul	%fcc1,	loop_387
	fblg,a	%fcc1,	loop_388
	movrgz	%l5,	0x37C,	%i3
	tneg	%icc,	0x2
loop_387:
	sethi	0x16BE,	%i2
loop_388:
	fmovrsgz	%l1,	%f11,	%f15
	fbe,a	%fcc0,	loop_389
	edge8l	%l2,	%o5,	%i5
	sdivx	%g5,	0x18C5,	%g7
	movrgez	%i6,	0x170,	%o2
loop_389:
	xnor	%g3,	%l0,	%o1
	movre	%i7,	0x0AF,	%o7
	sdiv	%l6,	0x02C0,	%i0
	fbue	%fcc3,	loop_390
	tg	%xcc,	0x6
	orcc	%l4,	0x0D0C,	%o4
	fmovdgu	%icc,	%f3,	%f9
loop_390:
	fmovrdne	%i1,	%f28,	%f12
	smul	%o0,	0x0C52,	%g1
	fzero	%f0
	fbne,a	%fcc1,	loop_391
	fpackfix	%f4,	%f28
	xnor	%g2,	%o3,	%g4
	sdivx	%l3,	0x15AC,	%g6
loop_391:
	movrlz	%o6,	0x27B,	%i4
	fmovrdlez	%l5,	%f20,	%f12
	fmovsa	%icc,	%f31,	%f15
	fmul8ulx16	%f24,	%f8,	%f26
	array16	%i3,	%i2,	%l1
	udivcc	%l2,	0x0F9A,	%i5
	sub	%g5,	%o5,	%i6
	bleu	%xcc,	loop_392
	fpackfix	%f30,	%f10
	subcc	%o2,	%g7,	%l0
	tle	%xcc,	0x6
loop_392:
	bgu	loop_393
	mova	%xcc,	%g3,	%i7
	taddcctv	%o7,	0x1424,	%l6
	udiv	%o1,	0x1FD1,	%l4
loop_393:
	brlez,a	%o4,	loop_394
	movn	%xcc,	%i1,	%i0
	bvc,a,pt	%icc,	loop_395
	fzeros	%f18
loop_394:
	brlez,a	%g1,	loop_396
	addc	%o0,	%o3,	%g2
loop_395:
	orn	%g4,	0x1F38,	%g6
	fnors	%f28,	%f20,	%f27
loop_396:
	bneg,a	loop_397
	movrgez	%l3,	%o6,	%i4
	fands	%f7,	%f12,	%f15
	sdiv	%i3,	0x10E0,	%i2
loop_397:
	for	%f8,	%f2,	%f4
	brlz	%l5,	loop_398
	swap	[%l7 + 0x30],	%l2
	movrgz	%i5,	0x276,	%l1
	udivcc	%o5,	0x0958,	%g5
loop_398:
	nop
	set	0x30, %o6
	stxa	%i6,	[%l7 + %o6] 0x89
	sra	%o2,	0x11,	%l0
	bne,a,pn	%xcc,	loop_399
	andcc	%g7,	0x0846,	%g3
	set	0x78, %i6
	ldxa	[%l7 + %i6] 0x10,	%i7
loop_399:
	fpsub16s	%f22,	%f11,	%f15
	alignaddr	%l6,	%o7,	%l4
	fxnors	%f30,	%f2,	%f28
	andcc	%o4,	0x0096,	%o1
	fmovde	%xcc,	%f20,	%f4
	sll	%i1,	%i0,	%o0
	orcc	%o3,	%g2,	%g4
	fmovdcc	%icc,	%f26,	%f4
	fbue,a	%fcc2,	loop_400
	fcmpd	%fcc0,	%f26,	%f26
	tge	%xcc,	0x0
	edge16l	%g1,	%l3,	%o6
loop_400:
	fbg	%fcc2,	loop_401
	edge32n	%i4,	%g6,	%i3
	tneg	%icc,	0x0
	wr	%g0,	0x0c,	%asi
	lduwa	[%l7 + 0x40] %asi,	%l5
loop_401:
	edge32ln	%l2,	%i2,	%i5
	subccc	%o5,	0x123B,	%g5
	wr	%g0,	0x10,	%asi
	ldstuba	[%l7 + 0x7D] %asi,	%l1
	brgez	%i6,	loop_402
	edge16n	%l0,	%o2,	%g7
	std	%f16,	[%l7 + 0x78]
	tleu	%icc,	0x7
loop_402:
	xor	%g3,	0x0DD3,	%l6
	set	0x38, %i2
	stda	%i6,	[%l7 + %i2] 0x80
	xnor	%o7,	0x1BDA,	%o4
	te	%icc,	0x6
	addcc	%o1,	0x16DF,	%l4
	edge8ln	%i1,	%i0,	%o3
	fcmpgt32	%f2,	%f14,	%o0
	movn	%icc,	%g2,	%g4
	wr	%g0,	0x81,	%asi
	lduha	[%l7 + 0x50] %asi,	%l3
	xorcc	%g1,	0x12E5,	%o6
	tne	%xcc,	0x6
	edge32l	%i4,	%g6,	%l5
	edge8	%i3,	%i2,	%l2
	array8	%i5,	%g5,	%l1
	ta	%xcc,	0x1
	tvs	%xcc,	0x3
	udivcc	%i6,	0x0810,	%o5
	fble,a	%fcc3,	loop_403
	bvc,a	%icc,	loop_404
	faligndata	%f16,	%f4,	%f20
	set	0x76, %o1
	stha	%o2,	[%l7 + %o1] 0x04
loop_403:
	fsrc2s	%f21,	%f29
loop_404:
	fbul	%fcc3,	loop_405
	fblg,a	%fcc3,	loop_406
	fpsub32	%f0,	%f10,	%f16
	fbu	%fcc0,	loop_407
loop_405:
	tl	%xcc,	0x6
loop_406:
	movvs	%icc,	%g7,	%l0
	std	%i6,	[%l7 + 0x20]
loop_407:
	addcc	%i7,	0x1FA8,	%o7
	umulcc	%o4,	0x1AFC,	%g3
	tsubcc	%l4,	0x1DB1,	%o1
	edge32ln	%i1,	%i0,	%o0
	brgz	%o3,	loop_408
	tne	%icc,	0x4
	fsrc2s	%f3,	%f28
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_408:
	bvc,a,pt	%icc,	loop_409
	te	%icc,	0x6
	edge16ln	%g4,	%g2,	%l3
	movvs	%icc,	%g1,	%i4
loop_409:
	fabss	%f28,	%f21
	orcc	%g6,	0x0EDB,	%o6
	brgz,a	%i3,	loop_410
	flush	%l7 + 0x34
	udiv	%i2,	0x11CF,	%l5
	tpos	%icc,	0x0
loop_410:
	fsrc2s	%f1,	%f4
	flush	%l7 + 0x14
	array16	%l2,	%g5,	%i5
	subccc	%l1,	%i6,	%o5
	fmovdl	%icc,	%f26,	%f19
	smulcc	%g7,	0x1D2F,	%l0
	orncc	%l6,	%o2,	%o7
	set	0x70, %l3
	stwa	%i7,	[%l7 + %l3] 0x2f
	membar	#Sync
	set	0x6E, %i0
	ldsha	[%l7 + %i0] 0x0c,	%o4
	xor	%l4,	0x0DE9,	%o1
	brlez,a	%g3,	loop_411
	movrlz	%i1,	0x328,	%i0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tle	%xcc,	0x2
loop_411:
	array8	%o3,	%g4,	%o0
	mulx	%l3,	%g2,	%g1
	subccc	%g6,	0x0ABE,	%i4
	fmovdl	%xcc,	%f3,	%f29
	andcc	%o6,	%i2,	%l5
	umulcc	%l2,	%g5,	%i5
	orncc	%i3,	%i6,	%o5
	movrlez	%l1,	0x08C,	%l0
	movleu	%icc,	%l6,	%o2
	fble,a	%fcc2,	loop_412
	movg	%xcc,	%o7,	%g7
	ble,a,pn	%icc,	loop_413
	sub	%i7,	%o4,	%l4
loop_412:
	lduh	[%l7 + 0x42],	%o1
	tvc	%icc,	0x5
loop_413:
	edge32l	%i1,	%g3,	%o3
	edge8ln	%i0,	%g4,	%l3
	sub	%g2,	0x1DD5,	%o0
	set	0x10, %l6
	sta	%f21,	[%l7 + %l6] 0x11
	xnorcc	%g6,	%i4,	%o6
	movre	%g1,	0x3C4,	%i2
	nop
	set	0x58, %l0
	std	%f0,	[%l7 + %l0]
	lduh	[%l7 + 0x32],	%l5
	sra	%l2,	%i5,	%g5
	sllx	%i6,	%i3,	%l1
	sdiv	%o5,	0x022A,	%l6
	fmovdge	%icc,	%f12,	%f31
	and	%l0,	0x1FA7,	%o7
	movpos	%icc,	%o2,	%g7
	movgu	%xcc,	%i7,	%o4
	ldx	[%l7 + 0x60],	%o1
	fands	%f26,	%f31,	%f5
	wr	%g0,	0x80,	%asi
	ldswa	[%l7 + 0x30] %asi,	%i1
	tneg	%xcc,	0x1
	fsrc2	%f30,	%f14
	set	0x2F, %o2
	ldsba	[%l7 + %o2] 0x88,	%l4
	fmuld8sux16	%f24,	%f27,	%f30
	bge,a	%icc,	loop_414
	orncc	%g3,	0x12D8,	%i0
	tvs	%xcc,	0x7
	alignaddrl	%o3,	%l3,	%g4
loop_414:
	orn	%g2,	%o0,	%i4
	fcmple16	%f0,	%f10,	%g6
	fmovda	%icc,	%f22,	%f24
	bn,a	loop_415
	sdivx	%g1,	0x06ED,	%i2
	fbo,a	%fcc2,	loop_416
	movle	%xcc,	%l5,	%o6
loop_415:
	and	%l2,	%i5,	%i6
	udiv	%i3,	0x104D,	%l1
loop_416:
	fcmped	%fcc0,	%f6,	%f8
	add	%l7,	0x20,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] %asi,	%g5,	%l6
	fpadd16	%f18,	%f2,	%f10
	fbug	%fcc0,	loop_417
	movcs	%xcc,	%o5,	%o7
	add	%l7,	0x48,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%l0
	casxa	[%l6] %asi,	%l0,	%o2
loop_417:
	fbue,a	%fcc0,	loop_418
	mulx	%g7,	%o4,	%o1
	array16	%i1,	%i7,	%l4
	nop
	setx	loop_419,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_418:
	tg	%icc,	0x5
	tne	%icc,	0x3
	fmovrde	%i0,	%f12,	%f24
loop_419:
	movne	%icc,	%o3,	%l3
	fpsub32s	%f5,	%f19,	%f17
	bleu,a	%xcc,	loop_420
	movneg	%icc,	%g3,	%g2
	tcs	%icc,	0x3
	brlez,a	%o0,	loop_421
loop_420:
	ldd	[%l7 + 0x30],	%f24
	wr	%g0,	0x81,	%asi
	lduba	[%l7 + 0x38] %asi,	%i4
loop_421:
	movrlz	%g6,	0x31D,	%g1
	array32	%i2,	%l5,	%o6
	fmovsl	%icc,	%f31,	%f26
	and	%l2,	0x1383,	%i5
	bge,pn	%icc,	loop_422
	fbl	%fcc1,	loop_423
	tvc	%icc,	0x4
	fmovdvc	%xcc,	%f19,	%f24
loop_422:
	nop
	wr	%g0,	0xf8,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
loop_423:
	ldsh	[%l7 + 0x72],	%i6
	array32	%g4,	%l1,	%i3
	ldx	[%l7 + 0x18],	%l6
	subcc	%g5,	%o7,	%o5
	movne	%icc,	%o2,	%l0
	or	%o4,	%o1,	%i1
	umul	%g7,	%i7,	%l4
	orncc	%i0,	0x0CAD,	%l3
	fmovsge	%icc,	%f6,	%f1
	orncc	%g3,	0x0007,	%o3
	andncc	%g2,	%o0,	%i4
	taddcctv	%g6,	%g1,	%i2
	bcs	loop_424
	xorcc	%l5,	%l2,	%o6
	xnor	%i6,	0x0F49,	%g4
	tcs	%xcc,	0x3
loop_424:
	taddcctv	%l1,	0x1C52,	%i3
	tle	%icc,	0x4
	bn,a	loop_425
	alignaddr	%l6,	%i5,	%o7
	fmovsleu	%xcc,	%f11,	%f30
	fnegs	%f14,	%f5
loop_425:
	popc	0x0AD9,	%o5
	wr	%g0,	0x04,	%asi
	lduha	[%l7 + 0x5E] %asi,	%o2
	movrne	%l0,	0x150,	%g5
	fmovdvs	%icc,	%f2,	%f2
	tvs	%xcc,	0x4
	xnorcc	%o1,	0x18B2,	%i1
	bvc,a	%xcc,	loop_426
	smul	%o4,	0x009C,	%g7
	udivx	%l4,	0x1B04,	%i7
	subc	%i0,	%g3,	%l3
loop_426:
	bl,a	%xcc,	loop_427
	addc	%o3,	%o0,	%g2
	brz	%g6,	loop_428
	fmul8sux16	%f2,	%f24,	%f22
loop_427:
	fmovrslez	%g1,	%f8,	%f10
	sdivx	%i2,	0x12E0,	%l5
loop_428:
	ba,a	loop_429
	taddcctv	%l2,	%o6,	%i6
	tpos	%icc,	0x6
	nop
	set	0x20, %i7
	lduw	[%l7 + %i7],	%i4
loop_429:
	call	loop_430
	tleu	%icc,	0x3
	fbl	%fcc3,	loop_431
	subc	%g4,	0x1A6A,	%l1
loop_430:
	fba	%fcc0,	loop_432
	bpos	%xcc,	loop_433
loop_431:
	xnor	%i3,	%i5,	%l6
	fpmerge	%f31,	%f1,	%f26
loop_432:
	fandnot1	%f28,	%f26,	%f16
loop_433:
	ldsb	[%l7 + 0x67],	%o5
	fmovrsgez	%o2,	%f22,	%f20
	edge16n	%o7,	%g5,	%o1
	fnot2s	%f6,	%f9
	wr	%g0,	0x21,	%asi
	ldxa	[%g0 + 0x8] %asi,	%l0
	wr	%g0,	0x18,	%asi
	stba	%o4,	[%l7 + 0x77] %asi
	andcc	%i1,	%g7,	%l4
	addcc	%i0,	%i7,	%g3
	bn,a,pt	%icc,	loop_434
	nop
	setx	loop_435,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tpos	%xcc,	0x0
	udiv	%o3,	0x0D9F,	%o0
loop_434:
	tg	%xcc,	0x1
loop_435:
	andncc	%l3,	%g2,	%g6
	andncc	%i2,	%g1,	%l5
	tcc	%xcc,	0x6
	addccc	%o6,	%i6,	%l2
	fpsub32s	%f22,	%f10,	%f29
	set	0x62, %g2
	lduha	[%l7 + %g2] 0x04,	%g4
	wr	%g0,	0x11,	%asi
	sta	%f23,	[%l7 + 0x28] %asi
	addcc	%i4,	%l1,	%i5
	fmovdleu	%icc,	%f20,	%f25
	movcs	%icc,	%l6,	%i3
	ldsw	[%l7 + 0x38],	%o5
	smul	%o2,	0x06FB,	%o7
	fmovrsne	%o1,	%f6,	%f17
	add	%l7,	0x18,	%l6
	wr	%g0,	0x18,	%asi
	casa	[%l6] 0x18,	%l0,	%g5
	nop
	setx loop_436, %l0, %l1
	jmpl %l1, %i1
	taddcc	%g7,	%o4,	%l4
	fsrc2	%f2,	%f8
	tsubcctv	%i7,	%i0,	%g3
loop_436:
	taddcctv	%o3,	%o0,	%g2
	xnor	%l3,	%g6,	%g1
	fpadd16	%f8,	%f28,	%f30
	fmul8x16al	%f8,	%f0,	%f2
	udivcc	%i2,	0x104E,	%o6
	andn	%l5,	0x1A15,	%l2
	sdivx	%g4,	0x0F55,	%i4
	or	%i6,	0x14CE,	%l1
	movrne	%i5,	%l6,	%o5
	fmovsleu	%icc,	%f19,	%f12
	orncc	%i3,	0x01C2,	%o7
	addccc	%o1,	%o2,	%l0
	fornot1s	%f22,	%f29,	%f12
	add	%g5,	0x1330,	%g7
	edge8n	%o4,	%l4,	%i1
	fbu,a	%fcc2,	loop_437
	fcmpeq16	%f30,	%f22,	%i0
	mova	%icc,	%g3,	%i7
	edge8	%o0,	%o3,	%g2
loop_437:
	taddcctv	%g6,	%g1,	%l3
	tcs	%xcc,	0x7
	add	%l7,	0x08,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] %asi,	%i2,	%l5
	movne	%icc,	%l2,	%o6
	movle	%icc,	%g4,	%i4
	fmovrdgz	%i6,	%f16,	%f16
	wr	%g0,	0x11,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	tn	%xcc,	0x1
	udiv	%l1,	0x08D7,	%i5
	movcs	%xcc,	%o5,	%l6
	sllx	%o7,	%o1,	%i3
	srlx	%o2,	%g5,	%g7
	brnz,a	%l0,	loop_438
	fmovdgu	%xcc,	%f9,	%f22
	edge8ln	%l4,	%o4,	%i1
	bne,pt	%icc,	loop_439
loop_438:
	array16	%i0,	%i7,	%g3
	swap	[%l7 + 0x64],	%o3
	umul	%o0,	0x0700,	%g6
loop_439:
	fbne	%fcc1,	loop_440
	mova	%icc,	%g2,	%g1
	fmovd	%f12,	%f18
	taddcctv	%i2,	0x0EC7,	%l5
loop_440:
	edge8ln	%l2,	%o6,	%l3
	fmovsge	%icc,	%f23,	%f4
	fmovrde	%i4,	%f28,	%f8
	tne	%icc,	0x7
	movl	%xcc,	%i6,	%g4
	fnegd	%f16,	%f2
	fcmpne16	%f24,	%f20,	%l1
	edge32	%o5,	%i5,	%l6
	tl	%icc,	0x0
	edge16l	%o1,	%o7,	%i3
	sdivx	%o2,	0x0E70,	%g5
	movne	%xcc,	%g7,	%l4
	wr	%g0,	0xf9,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
	alignaddr	%o4,	%i1,	%i0
	fblg,a	%fcc1,	loop_441
	smul	%i7,	%l0,	%g3
	set	0x1C, %l4
	stwa	%o3,	[%l7 + %l4] 0xeb
	membar	#Sync
loop_441:
	subc	%o0,	0x147E,	%g2
	bn,a,pn	%icc,	loop_442
	array16	%g6,	%i2,	%g1
	fcmps	%fcc3,	%f6,	%f26
	edge16n	%l5,	%l2,	%l3
loop_442:
	movpos	%xcc,	%o6,	%i6
	ldstub	[%l7 + 0x20],	%i4
	taddcc	%g4,	0x0038,	%o5
	bleu,a	%xcc,	loop_443
	fmovdn	%icc,	%f13,	%f29
	ld	[%l7 + 0x54],	%f9
	fnand	%f0,	%f14,	%f14
loop_443:
	fmovdneg	%xcc,	%f13,	%f19
	mulscc	%i5,	%l1,	%l6
	fnot1s	%f31,	%f17
	fsrc2	%f0,	%f0
	movpos	%icc,	%o7,	%i3
	fcmps	%fcc2,	%f2,	%f23
	edge16ln	%o1,	%o2,	%g5
	movn	%xcc,	%l4,	%g7
	ld	[%l7 + 0x68],	%f7
	add	%i1,	0x12E2,	%i0
	tvs	%icc,	0x0
	srlx	%o4,	%i7,	%g3
	set	0x3C, %l1
	stha	%l0,	[%l7 + %l1] 0x2b
	membar	#Sync
	edge8n	%o3,	%o0,	%g6
	subc	%i2,	0x040A,	%g1
	tcc	%xcc,	0x2
	movrlz	%g2,	%l5,	%l2
	brgz	%l3,	loop_444
	sllx	%o6,	%i6,	%g4
	edge8l	%o5,	%i4,	%i5
	movge	%icc,	%l1,	%o7
loop_444:
	bn,pn	%xcc,	loop_445
	movrlez	%l6,	0x197,	%i3
	xorcc	%o1,	%o2,	%l4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_445:
	movrlez	%g5,	0x0FF,	%g7
	xnorcc	%i1,	0x06BE,	%o4
	fmovsge	%xcc,	%f17,	%f28
	fba	%fcc3,	loop_446
	edge32ln	%i0,	%i7,	%l0
	movrgz	%g3,	%o0,	%o3
	sra	%i2,	0x16,	%g1
loop_446:
	tg	%xcc,	0x7
	tne	%icc,	0x2
	fmovdcs	%xcc,	%f5,	%f20
	subcc	%g6,	%g2,	%l5
	srl	%l2,	%o6,	%i6
	xor	%l3,	%g4,	%o5
	xorcc	%i4,	%l1,	%i5
	udivx	%o7,	0x1917,	%l6
	fmovrslz	%i3,	%f14,	%f11
	bl,a	loop_447
	ta	%xcc,	0x7
	udivx	%o1,	0x16F6,	%o2
	fcmpne16	%f26,	%f0,	%l4
loop_447:
	edge32	%g7,	%g5,	%o4
	bcs,a,pn	%xcc,	loop_448
	alignaddrl	%i0,	%i7,	%l0
	xnorcc	%g3,	%o0,	%i1
	addccc	%i2,	0x14D6,	%o3
loop_448:
	fbuge	%fcc0,	loop_449
	stb	%g1,	[%l7 + 0x5F]
	fbuge,a	%fcc1,	loop_450
	fpackfix	%f8,	%f20
loop_449:
	nop
	set	0x60, %g1
	ldda	[%l7 + %g1] 0x27,	%g6
loop_450:
	movn	%xcc,	%l5,	%l2
	umul	%o6,	0x16CA,	%g2
	ld	[%l7 + 0x2C],	%f31
	umulcc	%l3,	%i6,	%o5
	movn	%icc,	%g4,	%l1
	tcs	%icc,	0x3
	edge32ln	%i4,	%o7,	%l6
	fbl,a	%fcc2,	loop_451
	orcc	%i3,	0x0449,	%i5
	movg	%icc,	%o1,	%o2
	srl	%g7,	0x0C,	%l4
loop_451:
	edge8	%g5,	%i0,	%o4
	sdivx	%i7,	0x1D13,	%g3
	wr	%g0,	0x0c,	%asi
	lduha	[%l7 + 0x28] %asi,	%l0
	fmovse	%xcc,	%f26,	%f19
	xnorcc	%i1,	%i2,	%o0
	tn	%xcc,	0x3
	xnor	%g1,	0x116F,	%g6
	fmovrsgz	%l5,	%f4,	%f0
	fandnot2s	%f21,	%f3,	%f20
	tg	%xcc,	0x4
	tne	%icc,	0x1
	xor	%o3,	0x1BA0,	%l2
	orn	%g2,	%l3,	%o6
	tneg	%icc,	0x2
	fbge,a	%fcc2,	loop_452
	udivcc	%i6,	0x0E04,	%o5
	set	0x44, %g7
	swapa	[%l7 + %g7] 0x10,	%l1
loop_452:
	stx	%i4,	[%l7 + 0x08]
	edge8n	%o7,	%g4,	%i3
	tsubcctv	%i5,	%o1,	%o2
	std	%f10,	[%l7 + 0x78]
	add	%l6,	0x094C,	%l4
	fnegd	%f26,	%f24
	fnands	%f21,	%f22,	%f7
	srlx	%g7,	%i0,	%o4
	addc	%i7,	0x137F,	%g3
	movrlz	%l0,	%i1,	%g5
	sra	%o0,	%i2,	%g1
	movrlez	%g6,	0x0F5,	%l5
	srax	%l2,	0x1C,	%o3
	fmovdg	%xcc,	%f24,	%f28
	sethi	0x0ADA,	%g2
	te	%xcc,	0x6
	smul	%o6,	0x06C6,	%i6
	bneg,a	loop_453
	array8	%o5,	%l3,	%i4
	fnot2	%f4,	%f24
	set	0x18, %o4
	lda	[%l7 + %o4] 0x88,	%f11
loop_453:
	faligndata	%f12,	%f28,	%f10
	fone	%f26
	set	0x68, %o7
	ldswa	[%l7 + %o7] 0x10,	%o7
	edge8	%l1,	%g4,	%i3
	movcs	%icc,	%o1,	%i5
	set	0x38, %o5
	prefetcha	[%l7 + %o5] 0x88,	 0x1
	array8	%l6,	%g7,	%i0
	bg	loop_454
	xnor	%o4,	%i7,	%l4
	tvc	%xcc,	0x4
	xnorcc	%g3,	%l0,	%g5
loop_454:
	nop
	wr	%g0,	0x10,	%asi
	ldsha	[%l7 + 0x74] %asi,	%i1
	srlx	%o0,	0x17,	%i2
	fmovrdlz	%g1,	%f22,	%f4
	ldsw	[%l7 + 0x44],	%l5
	addccc	%l2,	0x137F,	%o3
	sub	%g2,	0x002B,	%g6
	mova	%icc,	%i6,	%o6
	edge16l	%l3,	%o5,	%o7
	movrlz	%l1,	0x169,	%g4
	fbuge	%fcc3,	loop_455
	brlz,a	%i4,	loop_456
	tcs	%icc,	0x4
	fcmpne32	%f8,	%f22,	%o1
loop_455:
	nop
	wr	%g0,	0x10,	%asi
	lduha	[%l7 + 0x70] %asi,	%i5
loop_456:
	movneg	%xcc,	%o2,	%i3
	udivcc	%g7,	0x0656,	%i0
	tn	%xcc,	0x3
	edge32ln	%l6,	%i7,	%l4
	movge	%icc,	%g3,	%l0
	fmovdleu	%icc,	%f6,	%f10
	wr	%g0,	0x89,	%asi
	ldsba	[%l7 + 0x65] %asi,	%o4
	ldsw	[%l7 + 0x70],	%g5
	std	%f22,	[%l7 + 0x18]
	xnorcc	%i1,	%o0,	%g1
	fandnot2s	%f7,	%f18,	%f5
	movneg	%xcc,	%i2,	%l2
	sra	%l5,	%o3,	%g2
	movvc	%xcc,	%g6,	%o6
	fmovsa	%xcc,	%f9,	%f28
	fcmps	%fcc0,	%f9,	%f22
	bg,pn	%xcc,	loop_457
	brgez	%i6,	loop_458
	fornot1s	%f9,	%f26,	%f18
	brgez	%l3,	loop_459
loop_457:
	edge32	%o5,	%o7,	%g4
loop_458:
	addcc	%l1,	%o1,	%i4
	fmovrdne	%i5,	%f10,	%f12
loop_459:
	sllx	%i3,	%g7,	%o2
	bg,a	loop_460
	popc	0x1EAE,	%l6
	movvs	%icc,	%i7,	%i0
	fmovd	%f26,	%f26
loop_460:
	addc	%g3,	0x1E39,	%l0
	ld	[%l7 + 0x48],	%f4
	mova	%icc,	%l4,	%o4
	bcs,a	%xcc,	loop_461
	sll	%i1,	%g5,	%g1
	set	0x54, %o0
	ldstuba	[%l7 + %o0] 0x80,	%o0
loop_461:
	edge8n	%i2,	%l2,	%o3
	movgu	%icc,	%l5,	%g2
	tg	%xcc,	0x6
	smulcc	%o6,	0x054B,	%i6
	smulcc	%l3,	0x0631,	%g6
	tle	%icc,	0x6
	bleu	%icc,	loop_462
	fpadd16s	%f16,	%f28,	%f5
	tleu	%xcc,	0x6
	tgu	%icc,	0x5
loop_462:
	andcc	%o7,	%g4,	%l1
	ldd	[%l7 + 0x48],	%f30
	bn,a	loop_463
	fmovrsgez	%o1,	%f12,	%f1
	tne	%icc,	0x2
	fmovrslz	%i4,	%f10,	%f11
loop_463:
	te	%icc,	0x0
	bge,a	loop_464
	movrgez	%o5,	%i5,	%i3
	ldstub	[%l7 + 0x40],	%o2
	movn	%xcc,	%l6,	%g7
loop_464:
	brnz,a	%i7,	loop_465
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array16	%i0,	%g3,	%l0
	tge	%icc,	0x7
loop_465:
	edge8ln	%l4,	%i1,	%g5
	edge8	%g1,	%o4,	%i2
	taddcctv	%o0,	0x0C0E,	%l2
	movrgz	%l5,	%g2,	%o3
	xnor	%o6,	%l3,	%g6
	xnorcc	%i6,	%o7,	%l1
	fmovdneg	%icc,	%f1,	%f11
	wr	%g0,	0x19,	%asi
	ldxa	[%l7 + 0x28] %asi,	%o1
	fcmpgt16	%f0,	%f24,	%i4
	movg	%icc,	%g4,	%o5
	fmovrslz	%i5,	%f22,	%f18
	bleu,a	%xcc,	loop_466
	movrne	%o2,	%l6,	%g7
	fcmpeq32	%f4,	%f10,	%i7
	andcc	%i3,	0x0E50,	%i0
loop_466:
	fmovrdgez	%l0,	%f4,	%f30
	mulscc	%g3,	%l4,	%g5
	fcmple32	%f22,	%f16,	%i1
	wr	%g0,	0x18,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	edge8	%g1,	%o4,	%i2
	addc	%o0,	0x1872,	%l2
	edge32	%l5,	%g2,	%o3
	bg,a	loop_467
	bcc,pt	%icc,	loop_468
	srl	%o6,	0x0B,	%g6
	fmul8sux16	%f4,	%f0,	%f8
loop_467:
	sth	%i6,	[%l7 + 0x12]
loop_468:
	nop
	wr	%g0,	0x2e,	%asi
	ldda	[%l7 + 0x10] %asi,	%l2
	fcmpgt32	%f2,	%f18,	%l1
	tpos	%xcc,	0x3
	orcc	%o7,	%o1,	%g4
	sethi	0x0037,	%i4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bvc,a,pn	%xcc,	loop_469
	movleu	%xcc,	%i5,	%o5
	fxors	%f13,	%f9,	%f17
	stw	%l6,	[%l7 + 0x20]
loop_469:
	brlz	%g7,	loop_470
	fmovsvc	%xcc,	%f24,	%f24
	movn	%xcc,	%o2,	%i3
	brlez	%i0,	loop_471
loop_470:
	fmovdl	%xcc,	%f19,	%f9
	edge8	%i7,	%l0,	%g3
	fbg	%fcc1,	loop_472
loop_471:
	srax	%l4,	%g5,	%g1
	edge16n	%i1,	%i2,	%o4
	andcc	%l2,	%o0,	%g2
loop_472:
	movne	%xcc,	%o3,	%l5
	xor	%g6,	%i6,	%o6
	sra	%l1,	0x10,	%l3
	nop
	set	0x08, %l2
	ldsh	[%l7 + %l2],	%o1
	fmovrsgez	%o7,	%f29,	%f5
	fpadd16	%f10,	%f16,	%f24
	fmovsge	%xcc,	%f1,	%f1
	sub	%i4,	%g4,	%i5
	srlx	%l6,	%o5,	%o2
	wr	%g0,	0x0c,	%asi
	stba	%g7,	[%l7 + 0x25] %asi
	edge32	%i0,	%i3,	%i7
	tgu	%xcc,	0x7
	fpadd16s	%f15,	%f14,	%f19
	fsrc2s	%f18,	%f11
	bcs,a,pn	%icc,	loop_473
	movvc	%xcc,	%l0,	%g3
	tpos	%xcc,	0x2
	fcmple32	%f28,	%f8,	%g5
loop_473:
	xnor	%l4,	%i1,	%i2
	stw	%o4,	[%l7 + 0x2C]
	tneg	%icc,	0x4
	fmovdpos	%xcc,	%f20,	%f6
	movneg	%xcc,	%l2,	%g1
	fmovscc	%icc,	%f8,	%f15
	xnorcc	%o0,	0x1491,	%g2
	stb	%l5,	[%l7 + 0x21]
	sdiv	%g6,	0x1614,	%o3
	andn	%o6,	%l1,	%i6
	popc	0x16CE,	%o1
	edge32	%o7,	%i4,	%l3
	ta	%xcc,	0x6
	mulscc	%i5,	%g4,	%l6
	xnorcc	%o5,	0x04A7,	%o2
	edge8n	%g7,	%i3,	%i0
	sethi	0x0B24,	%i7
	fcmpd	%fcc0,	%f22,	%f20
	membar	0x77
	set	0x5F, %g4
	stba	%l0,	[%l7 + %g4] 0x04
	xnor	%g5,	%g3,	%l4
	movcc	%xcc,	%i1,	%o4
	subccc	%i2,	0x0522,	%l2
	fpadd16	%f12,	%f26,	%f0
	wr	%g0,	0x10,	%asi
	lduha	[%l7 + 0x22] %asi,	%o0
	set	0x27, %g3
	ldsba	[%l7 + %g3] 0x88,	%g2
	movrgez	%g1,	%l5,	%o3
	tleu	%icc,	0x7
	tpos	%icc,	0x4
	fpsub16s	%f0,	%f21,	%f22
	fnands	%f16,	%f18,	%f28
	move	%icc,	%o6,	%l1
	add	%l7,	0x08,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] %asi,	%g6,	%o1
	movrgez	%o7,	%i4,	%i6
	edge32	%i5,	%g4,	%l3
	andn	%o5,	%l6,	%o2
	edge32ln	%i3,	%g7,	%i0
	nop
	setx	loop_474,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	alignaddr	%l0,	%i7,	%g3
	fbge,a	%fcc2,	loop_475
	bn	loop_476
loop_474:
	edge16n	%g5,	%l4,	%i1
	ldub	[%l7 + 0x10],	%i2
loop_475:
	bgu,a,pn	%xcc,	loop_477
loop_476:
	umul	%l2,	%o4,	%o0
	movrgez	%g2,	0x08B,	%g1
	ldsb	[%l7 + 0x08],	%l5
loop_477:
	ta	%xcc,	0x0
	fpadd16s	%f28,	%f11,	%f29
	tsubcc	%o6,	0x10AB,	%o3
	add	%l7,	0x5C,	%l6
	wr	%g0,	0x0c,	%asi
	lda	[%l6] %asi,	%l1
	casa	[%l6] 0x0c,	%l1,	%g6
	subccc	%o7,	0x0A7C,	%i4
	popc	0x0AD7,	%o1
	edge8l	%i5,	%i6,	%l3
	subcc	%g4,	0x1106,	%l6
	tsubcc	%o5,	0x0BE3,	%i3
	wr	%g0,	0xeb,	%asi
	ldda	[%l7 + 0x60] %asi,	%g6
	fmuld8ulx16	%f18,	%f28,	%f12
	add	%i0,	0x00E1,	%o2
	tleu	%icc,	0x7
	sdivx	%i7,	0x0987,	%l0
	wr	%g0,	0x10,	%asi
	lda	[%l7 + 0x0C] %asi,	%f11
	edge16l	%g5,	%g3,	%i1
	fmovrslez	%l4,	%f10,	%f31
	fmovdpos	%xcc,	%f19,	%f19
	wr	%g0,	0x89,	%asi
	ldswa	[%l7 + 0x08] %asi,	%l2
	wr	%g0,	0x88,	%asi
	ldswa	[%l7 + 0x60] %asi,	%i2
	bne	%icc,	loop_478
	add	%o4,	%g2,	%g1
	edge16l	%l5,	%o0,	%o3
	xnor	%o6,	%l1,	%o7
loop_478:
	tl	%xcc,	0x0
	edge8l	%i4,	%o1,	%g6
	or	%i5,	%i6,	%l3
	fpmerge	%f28,	%f28,	%f12
	edge32n	%l6,	%o5,	%i3
	taddcc	%g4,	%i0,	%o2
	edge8l	%g7,	%i7,	%l0
	tcs	%icc,	0x6
	srl	%g5,	0x1B,	%i1
	fones	%f10
	fbn,a	%fcc3,	loop_479
	movleu	%xcc,	%g3,	%l4
	tcs	%xcc,	0x2
	sdivcc	%l2,	0x19B3,	%i2
loop_479:
	movrlez	%o4,	0x0AE,	%g2
	movn	%xcc,	%g1,	%o0
	mulscc	%l5,	0x0039,	%o6
	ta	%xcc,	0x4
	mulx	%o3,	0x0D23,	%o7
	tsubcc	%i4,	0x1977,	%l1
	fand	%f26,	%f22,	%f0
	fsrc2	%f20,	%f20
	xnorcc	%o1,	%g6,	%i6
	tcc	%icc,	0x5
	xor	%l3,	0x1442,	%l6
	wr	%g0,	0x18,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	udivx	%o5,	0x11B1,	%i5
	tvs	%xcc,	0x7
	bge,a	loop_480
	orn	%g4,	%i0,	%i3
	fpadd16	%f6,	%f12,	%f4
	fbge	%fcc3,	loop_481
loop_480:
	tvs	%icc,	0x5
	array8	%o2,	%i7,	%g7
	tge	%xcc,	0x2
loop_481:
	udivcc	%l0,	0x1D3E,	%i1
	addc	%g5,	%g3,	%l4
	mulscc	%i2,	0x097D,	%l2
	std	%f20,	[%l7 + 0x60]
	or	%g2,	%o4,	%g1
	fnors	%f20,	%f28,	%f25
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbule,a	%fcc1,	loop_482
	array32	%l5,	%o6,	%o3
	array16	%o7,	%o0,	%l1
	popc	%o1,	%g6
loop_482:
	popc	%i6,	%i4
	fmul8x16	%f9,	%f12,	%f16
	udivx	%l3,	0x1DBB,	%o5
	sdivcc	%l6,	0x136E,	%i5
	edge32ln	%g4,	%i0,	%o2
	array8	%i7,	%i3,	%g7
	fmovrdne	%i1,	%f14,	%f14
	membar	0x04
	edge8n	%l0,	%g5,	%g3
	bne,a	%icc,	loop_483
	movrgez	%l4,	%i2,	%g2
	ldsw	[%l7 + 0x5C],	%o4
	fpadd32	%f8,	%f8,	%f8
loop_483:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16n	%l2,	%l5,	%o6
	fabss	%f31,	%f1
	tsubcctv	%o3,	0x0CA9,	%o7
	mova	%icc,	%o0,	%l1
	std	%f2,	[%l7 + 0x58]
	movl	%icc,	%g1,	%o1
	sth	%i6,	[%l7 + 0x2E]
	movge	%xcc,	%i4,	%g6
	tne	%xcc,	0x0
	edge16ln	%o5,	%l6,	%i5
	taddcctv	%g4,	%i0,	%l3
	tvs	%xcc,	0x7
	array16	%i7,	%i3,	%o2
	movvc	%icc,	%i1,	%l0
	tn	%xcc,	0x7
	mulscc	%g7,	0x0974,	%g3
	movrlez	%l4,	%g5,	%i2
	tgu	%xcc,	0x0
	fcmple32	%f0,	%f24,	%o4
	edge32ln	%l2,	%l5,	%g2
	fbule	%fcc1,	loop_484
	fmovd	%f0,	%f28
	udivx	%o6,	0x0407,	%o7
	sethi	0x0E28,	%o3
loop_484:
	movvs	%icc,	%l1,	%o0
	edge32l	%g1,	%o1,	%i4
	fmovdg	%xcc,	%f24,	%f5
	fmovdvs	%icc,	%f2,	%f24
	movrne	%g6,	%i6,	%l6
	tsubcc	%i5,	0x082A,	%g4
	movre	%o5,	0x1B4,	%i0
	movne	%xcc,	%l3,	%i7
	edge32ln	%o2,	%i3,	%i1
	ldub	[%l7 + 0x4A],	%g7
	edge32l	%l0,	%l4,	%g5
	smul	%g3,	%o4,	%i2
	std	%l2,	[%l7 + 0x58]
	prefetch	[%l7 + 0x10],	 0x0
	movrne	%l5,	0x035,	%o6
	alignaddrl	%o7,	%g2,	%l1
	sub	%o0,	%g1,	%o3
	srax	%o1,	0x1E,	%i4
	umulcc	%i6,	0x18DF,	%l6
	tneg	%xcc,	0x0
	fandnot1	%f18,	%f18,	%f14
	movcc	%icc,	%i5,	%g6
	smulcc	%g4,	0x077C,	%i0
	sdiv	%l3,	0x0E3A,	%o5
	sllx	%i7,	0x04,	%o2
	call	loop_485
	mulx	%i3,	%i1,	%l0
	movpos	%xcc,	%g7,	%l4
	fbg	%fcc0,	loop_486
loop_485:
	fpsub16	%f8,	%f4,	%f24
	set	0x3E, %i1
	ldsha	[%l7 + %i1] 0x89,	%g3
loop_486:
	fbg,a	%fcc1,	loop_487
	movrgez	%o4,	0x18F,	%g5
	nop
	setx loop_488, %l0, %l1
	jmpl %l1, %l2
	edge16n	%i2,	%o6,	%o7
loop_487:
	sll	%g2,	0x12,	%l1
	bpos,a	loop_489
loop_488:
	xnor	%l5,	%g1,	%o0
	wr	%g0,	0xe3,	%asi
	stda	%o2,	[%l7 + 0x40] %asi
	membar	#Sync
loop_489:
	te	%xcc,	0x7
	fexpand	%f29,	%f26
	and	%o1,	0x1565,	%i4
	brlez	%l6,	loop_490
	smul	%i5,	0x1707,	%g6
	array8	%i6,	%i0,	%l3
	tneg	%icc,	0x7
loop_490:
	xorcc	%g4,	0x0E1A,	%i7
	bne,pt	%icc,	loop_491
	bl,a	%icc,	loop_492
	add	%o5,	%i3,	%i1
	fmovsleu	%xcc,	%f24,	%f13
loop_491:
	nop
	set	0x24, %g6
	lda	[%l7 + %g6] 0x19,	%f11
loop_492:
	fbn,a	%fcc1,	loop_493
	movcs	%xcc,	%o2,	%l0
	bpos,a,pn	%icc,	loop_494
	orncc	%l4,	%g3,	%o4
loop_493:
	fnand	%f6,	%f12,	%f24
	xorcc	%g5,	%g7,	%l2
loop_494:
	edge8ln	%i2,	%o6,	%o7
	movleu	%xcc,	%g2,	%l1
	ldd	[%l7 + 0x68],	%f30
	fpackfix	%f12,	%f28
	set	0x24, %g5
	lda	[%l7 + %g5] 0x88,	%f11
	mulx	%g1,	%l5,	%o0
	add	%l7,	0x70,	%l6
	wr	%g0,	0x11,	%asi
	casa	[%l6] %asi,	%o1,	%i4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32ln	%l6,	%o3,	%g6
	and	%i6,	%i5,	%l3
	taddcc	%g4,	%i7,	%i0
	set	0x50, %i3
	swapa	[%l7 + %i3] 0x04,	%o5
	mulscc	%i1,	%i3,	%o2
	te	%icc,	0x5
	brgez	%l0,	loop_495
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16	%g3,	%l4,	%g5
	fornot2	%f2,	%f28,	%f6
loop_495:
	tcs	%xcc,	0x6
	movvs	%icc,	%o4,	%g7
	bcc	loop_496
	nop
	set	0x68, %i5
	stx	%l2,	[%l7 + %i5]
	movrne	%o6,	0x005,	%o7
	addccc	%i2,	%g2,	%g1
loop_496:
	edge16ln	%l5,	%o0,	%o1
	edge16n	%l1,	%l6,	%i4
	or	%g6,	0x068D,	%o3
	fmovrsgez	%i5,	%f8,	%f30
	brlez,a	%i6,	loop_497
	bn,pn	%icc,	loop_498
	fmovrde	%l3,	%f26,	%f0
	movl	%icc,	%g4,	%i7
loop_497:
	bne,a,pt	%xcc,	loop_499
loop_498:
	fcmpgt32	%f18,	%f28,	%o5
	pdist	%f24,	%f16,	%f28
	fba,a	%fcc1,	loop_500
loop_499:
	sir	0x16B9
	xorcc	%i1,	%i0,	%o2
	movrlez	%i3,	0x101,	%l0
loop_500:
	orncc	%l4,	0x1052,	%g5
	edge8	%o4,	%g7,	%g3
	edge16ln	%o6,	%o7,	%l2
	movleu	%icc,	%g2,	%g1
	bne	loop_501
	umul	%l5,	0x191E,	%i2
	tneg	%xcc,	0x3
	movcs	%icc,	%o0,	%l1
loop_501:
	movne	%xcc,	%o1,	%i4
	fmovsvc	%icc,	%f23,	%f13
	fornot2s	%f3,	%f25,	%f30
	sdivx	%g6,	0x01E7,	%o3
	taddcctv	%i5,	0x1CEE,	%l6
	fmovdn	%xcc,	%f1,	%f14
	fsrc2s	%f10,	%f14
	st	%f31,	[%l7 + 0x18]
	subcc	%i6,	0x0233,	%g4
	ldd	[%l7 + 0x58],	%f24
	movleu	%xcc,	%i7,	%l3
	orcc	%i1,	%o5,	%i0
	movne	%icc,	%o2,	%l0
	movge	%xcc,	%i3,	%g5
	fcmpne32	%f26,	%f24,	%l4
	tne	%xcc,	0x4
	add	%l7,	0x28,	%l6
	wr	%g0,	0x04,	%asi
	ldxa	[%l6] %asi,	%g7
	casxa	[%l6] %asi,	%g7,	%o4
	edge16n	%g3,	%o6,	%l2
	ldsw	[%l7 + 0x38],	%g2
	edge32n	%g1,	%l5,	%i2
	fbo	%fcc3,	loop_502
	sllx	%o7,	%o0,	%l1
	fmovdneg	%icc,	%f9,	%f25
	membar	0x4A
loop_502:
	xor	%o1,	0x1268,	%g6
	tle	%xcc,	0x2
	ble,a	loop_503
	fmovrdlez	%i4,	%f2,	%f6
	srlx	%i5,	0x17,	%l6
	taddcctv	%i6,	0x19F2,	%g4
loop_503:
	add	%i7,	%o3,	%i1
	xnorcc	%l3,	0x16D2,	%o5
	tneg	%icc,	0x4
	xorcc	%o2,	0x0E53,	%i0
	or	%l0,	%g5,	%i3
	movg	%icc,	%l4,	%g7
	fabss	%f10,	%f31
	andncc	%g3,	%o4,	%l2
	fandnot2	%f24,	%f16,	%f0
	add	%o6,	0x08CC,	%g2
	nop
	set	0x4F, %o3
	ldsb	[%l7 + %o3],	%g1
	movg	%icc,	%i2,	%o7
	srl	%l5,	0x1D,	%o0
	fmovsg	%xcc,	%f25,	%f25
	tn	%icc,	0x5
	fbuge	%fcc1,	loop_504
	prefetch	[%l7 + 0x20],	 0x3
	movrgez	%l1,	0x1AB,	%g6
	flush	%l7 + 0x74
loop_504:
	fand	%f0,	%f14,	%f22
	smul	%o1,	0x1765,	%i5
	orn	%l6,	%i4,	%i6
	fmovdneg	%xcc,	%f17,	%f19
	brnz	%g4,	loop_505
	xnor	%i7,	%o3,	%i1
	movleu	%xcc,	%o5,	%o2
	srl	%l3,	%i0,	%g5
loop_505:
	edge8	%l0,	%l4,	%g7
	xnorcc	%i3,	0x1735,	%g3
	movl	%xcc,	%o4,	%l2
	srlx	%o6,	0x15,	%g2
	movpos	%icc,	%g1,	%o7
	movrgez	%l5,	%i2,	%o0
	wr	%g0,	0x89,	%asi
	sta	%f27,	[%l7 + 0x0C] %asi
	srl	%l1,	%o1,	%g6
	fxnor	%f10,	%f16,	%f18
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sll	%i5,	0x07,	%i4
	udiv	%i6,	0x03F4,	%g4
	fands	%f28,	%f6,	%f11
	fmovrdne	%i7,	%f20,	%f26
	movrlz	%l6,	%o3,	%i1
	orncc	%o5,	0x0570,	%l3
	subccc	%o2,	%g5,	%i0
	fble,a	%fcc3,	loop_506
	movneg	%xcc,	%l4,	%l0
	popc	%i3,	%g3
	fpmerge	%f28,	%f3,	%f22
loop_506:
	edge8n	%g7,	%l2,	%o4
	edge8n	%o6,	%g1,	%g2
	movrlz	%o7,	%i2,	%o0
	fmovdpos	%xcc,	%f1,	%f12
	bpos,pt	%xcc,	loop_507
	tvs	%xcc,	0x4
	fands	%f20,	%f25,	%f12
	fmovrdgez	%l5,	%f18,	%f6
loop_507:
	bcc,a,pt	%xcc,	loop_508
	sdivcc	%o1,	0x1995,	%g6
	andn	%i5,	%i4,	%i6
	set	0x70, %l5
	ldsha	[%l7 + %l5] 0x10,	%g4
loop_508:
	edge16	%l1,	%l6,	%o3
	tcc	%xcc,	0x5
	movl	%xcc,	%i1,	%i7
	set	0x2C, %o6
	sta	%f20,	[%l7 + %o6] 0x0c
	xor	%l3,	0x0598,	%o2
	tneg	%xcc,	0x3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovse	%icc,	%f0,	%f15
	fmovsg	%xcc,	%f21,	%f7
	xorcc	%g5,	%i0,	%l4
	edge16n	%o5,	%l0,	%g3
	ldsh	[%l7 + 0x1A],	%i3
	fbug	%fcc0,	loop_509
	bgu	%xcc,	loop_510
	array32	%l2,	%g7,	%o4
	fbl,a	%fcc3,	loop_511
loop_509:
	fmovse	%xcc,	%f21,	%f29
loop_510:
	bcs	%xcc,	loop_512
	edge16	%o6,	%g2,	%o7
loop_511:
	array16	%g1,	%o0,	%i2
	tle	%icc,	0x2
loop_512:
	andcc	%o1,	%l5,	%i5
	andn	%i4,	%g6,	%i6
	fmovrde	%g4,	%f8,	%f2
	bneg,pt	%xcc,	loop_513
	bneg,a,pt	%icc,	loop_514
	addc	%l1,	%l6,	%o3
	movrgz	%i7,	%l3,	%o2
loop_513:
	nop
	set	0x6E, %i4
	lduha	[%l7 + %i4] 0x88,	%g5
loop_514:
	fbue	%fcc3,	loop_515
	nop
	setx loop_516, %l0, %l1
	jmpl %l1, %i0
	movcs	%icc,	%i1,	%o5
	mulscc	%l0,	%l4,	%g3
loop_515:
	movrne	%l2,	%i3,	%g7
loop_516:
	fzero	%f2
	tne	%icc,	0x0
	fnand	%f16,	%f26,	%f6
	srlx	%o4,	%g2,	%o6
	fones	%f26
	array32	%o7,	%o0,	%i2
	edge32ln	%o1,	%l5,	%i5
	ld	[%l7 + 0x20],	%f5
	umulcc	%i4,	0x0310,	%g6
	ldstub	[%l7 + 0x42],	%g1
	tsubcc	%i6,	%l1,	%l6
	fsrc2s	%f22,	%f2
	add	%l7,	0x1C,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] %asi,	%o3,	%i7
	sra	%g4,	0x02,	%l3
	sll	%o2,	%g5,	%i1
	membar	0x38
	bne,a	loop_517
	fbue,a	%fcc1,	loop_518
	movgu	%icc,	%o5,	%l0
	movgu	%icc,	%i0,	%l4
loop_517:
	xor	%g3,	%l2,	%i3
loop_518:
	tcc	%icc,	0x1
	movge	%xcc,	%g7,	%g2
	edge16n	%o6,	%o4,	%o7
	fmuld8ulx16	%f23,	%f26,	%f8
	fcmple16	%f20,	%f12,	%i2
	sra	%o1,	%o0,	%l5
	stbar
	alignaddrl	%i4,	%g6,	%i5
	flush	%l7 + 0x48
	fmovdleu	%xcc,	%f15,	%f7
	tleu	%xcc,	0x7
	std	%g0,	[%l7 + 0x70]
	edge8l	%i6,	%l6,	%l1
	edge32	%o3,	%i7,	%l3
	sllx	%o2,	0x01,	%g4
	ta	%icc,	0x6
	udiv	%i1,	0x0FC9,	%o5
	fble	%fcc2,	loop_519
	bge,a,pn	%icc,	loop_520
	bpos,pt	%xcc,	loop_521
	tn	%icc,	0x3
loop_519:
	movrlz	%l0,	0x1EB,	%g5
loop_520:
	movcs	%icc,	%l4,	%g3
loop_521:
	movcs	%icc,	%l2,	%i3
	edge32ln	%g7,	%g2,	%o6
	fmovsa	%xcc,	%f1,	%f4
	tpos	%xcc,	0x1
	fnands	%f30,	%f9,	%f9
	fpadd32s	%f15,	%f16,	%f21
	fbuge	%fcc3,	loop_522
	addcc	%i0,	0x0D42,	%o7
	brgez	%o4,	loop_523
	movl	%xcc,	%i2,	%o1
loop_522:
	edge32n	%l5,	%o0,	%i4
	ba	loop_524
loop_523:
	tneg	%xcc,	0x2
	ta	%xcc,	0x4
	taddcc	%i5,	0x009B,	%g6
loop_524:
	edge16n	%i6,	%l6,	%g1
	edge8n	%o3,	%i7,	%l3
	tpos	%icc,	0x0
	fbo,a	%fcc3,	loop_525
	membar	0x0B
	tle	%xcc,	0x3
	mova	%xcc,	%l1,	%o2
loop_525:
	tle	%icc,	0x5
	fmovdgu	%xcc,	%f7,	%f0
	movg	%xcc,	%i1,	%g4
	addc	%o5,	%g5,	%l0
	andn	%g3,	%l2,	%l4
	fbge	%fcc3,	loop_526
	bge,a	loop_527
	array32	%g7,	%g2,	%o6
	umul	%i3,	%i0,	%o4
loop_526:
	sethi	0x107F,	%o7
loop_527:
	nop
	set	0x58, %i6
	stx	%o1,	[%l7 + %i6]
	udivx	%i2,	0x0E36,	%l5
	xnor	%i4,	%i5,	%o0
	tsubcc	%g6,	0x07D0,	%l6
	move	%xcc,	%g1,	%i6
	alignaddrl	%i7,	%o3,	%l1
	flush	%l7 + 0x14
	tsubcc	%l3,	%i1,	%g4
	membar	0x74
	fmovd	%f28,	%f12
	sub	%o2,	0x1744,	%o5
	fmul8x16au	%f4,	%f20,	%f28
	bpos,a	loop_528
	smulcc	%l0,	%g5,	%g3
	edge32	%l4,	%l2,	%g7
	udiv	%o6,	0x1225,	%i3
loop_528:
	edge32l	%g2,	%o4,	%o7
	fmovdgu	%icc,	%f13,	%f6
	fbe	%fcc2,	loop_529
	edge16l	%o1,	%i2,	%l5
	fmovdpos	%icc,	%f22,	%f9
	tle	%xcc,	0x3
loop_529:
	movgu	%icc,	%i0,	%i4
	ldd	[%l7 + 0x10],	%i4
	tge	%icc,	0x4
	movrlez	%o0,	%g6,	%l6
	movleu	%icc,	%i6,	%g1
	stb	%o3,	[%l7 + 0x16]
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbe,a	%fcc3,	loop_530
	taddcctv	%i7,	%l3,	%i1
	edge32l	%l1,	%o2,	%o5
	movn	%xcc,	%g4,	%g5
loop_530:
	movrgz	%g3,	%l0,	%l4
	movne	%icc,	%g7,	%o6
	movg	%xcc,	%i3,	%l2
	sll	%g2,	%o7,	%o4
	srl	%i2,	0x00,	%l5
	add	%l7,	0x18,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%o1,	%i4
	movrlz	%i5,	0x03E,	%o0
	movneg	%xcc,	%i0,	%g6
	edge8n	%l6,	%g1,	%i6
	xorcc	%i7,	0x0CCD,	%o3
	andcc	%i1,	%l3,	%o2
	fble,a	%fcc3,	loop_531
	movre	%l1,	%g4,	%o5
	membar	0x55
	andncc	%g5,	%l0,	%l4
loop_531:
	sll	%g7,	%o6,	%i3
	ldsb	[%l7 + 0x5C],	%l2
	udivx	%g2,	0x0294,	%o7
	movne	%xcc,	%o4,	%g3
	fbne	%fcc3,	loop_532
	fnegd	%f0,	%f6
	tg	%xcc,	0x5
	tsubcc	%l5,	0x1CDC,	%o1
loop_532:
	tneg	%xcc,	0x7
	movle	%icc,	%i2,	%i4
	movrne	%o0,	0x132,	%i0
	mova	%icc,	%i5,	%g6
	fpmerge	%f6,	%f17,	%f24
	fmovrdlez	%g1,	%f26,	%f10
	taddcctv	%i6,	0x0540,	%i7
	movn	%xcc,	%l6,	%i1
	movpos	%xcc,	%l3,	%o3
	alignaddrl	%o2,	%g4,	%l1
	fmovdvs	%icc,	%f22,	%f17
	edge32n	%g5,	%o5,	%l4
	fpadd16	%f10,	%f26,	%f10
	movge	%xcc,	%g7,	%o6
	mulscc	%i3,	0x04B3,	%l0
	bne	loop_533
	udivcc	%g2,	0x0125,	%l2
	movrgz	%o4,	%g3,	%o7
	array8	%l5,	%i2,	%i4
loop_533:
	array8	%o1,	%o0,	%i0
	array8	%i5,	%g1,	%i6
	fmovd	%f0,	%f12
	tne	%xcc,	0x6
	fmovrdlez	%i7,	%f26,	%f8
	andn	%l6,	0x12BF,	%i1
	fcmple16	%f20,	%f18,	%l3
	wr	%g0,	0x88,	%asi
	ldsba	[%l7 + 0x4E] %asi,	%g6
	fmul8sux16	%f30,	%f8,	%f20
	udivcc	%o3,	0x0B7D,	%o2
	fcmpes	%fcc3,	%f31,	%f15
	fmovs	%f9,	%f5
	movvc	%icc,	%g4,	%l1
	subc	%g5,	%o5,	%g7
	lduh	[%l7 + 0x6A],	%l4
	ta	%xcc,	0x6
	bpos,pn	%xcc,	loop_534
	sth	%o6,	[%l7 + 0x4C]
	udivcc	%i3,	0x1908,	%g2
	addccc	%l0,	0x1458,	%l2
loop_534:
	tn	%icc,	0x4
	andn	%g3,	0x0088,	%o4
	tle	%icc,	0x4
	mulx	%l5,	0x0AF3,	%i2
	fbne,a	%fcc1,	loop_535
	fnegs	%f29,	%f10
	set	0x10, %o1
	prefetcha	[%l7 + %o1] 0x81,	 0x2
loop_535:
	tg	%icc,	0x1
	swap	[%l7 + 0x20],	%o1
	bleu,a,pn	%icc,	loop_536
	fnegd	%f28,	%f30
	ldd	[%l7 + 0x68],	%f2
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
loop_536:
	movvc	%icc,	%o0,	%i0
	srlx	%i4,	%i5,	%g1
	bcs,a	%xcc,	loop_538
loop_537:
	fcmple16	%f28,	%f8,	%i7
	orncc	%l6,	%i1,	%i6
	move	%icc,	%l3,	%g6
loop_538:
	movg	%xcc,	%o3,	%g4
	fmovdl	%xcc,	%f28,	%f23
	array16	%o2,	%l1,	%o5
	siam	0x1
	xor	%g7,	%l4,	%g5
	bne	loop_539
	andn	%o6,	0x1280,	%g2
	ba,a	loop_540
	fnand	%f4,	%f12,	%f30
loop_539:
	edge8n	%l0,	%l2,	%g3
	movpos	%icc,	%o4,	%i3
loop_540:
	movrlez	%i2,	0x3A8,	%l5
	andncc	%o7,	%o1,	%o0
	movle	%icc,	%i0,	%i4
	set	0x10, %i2
	stda	%g0,	[%l7 + %i2] 0x10
	edge16	%i7,	%i5,	%i1
	alignaddr	%i6,	%l3,	%l6
	tn	%xcc,	0x4
	alignaddrl	%g6,	%o3,	%g4
	mova	%xcc,	%l1,	%o2
	array16	%g7,	%o5,	%g5
	set	0x10, %i0
	lduwa	[%l7 + %i0] 0x80,	%o6
	tsubcctv	%g2,	%l4,	%l0
	subccc	%l2,	0x1EBE,	%g3
	orcc	%o4,	0x0951,	%i3
	for	%f6,	%f22,	%f16
	movgu	%xcc,	%l5,	%o7
	fmul8sux16	%f2,	%f24,	%f22
	tneg	%icc,	0x0
	mulscc	%i2,	0x1759,	%o0
	orn	%o1,	%i0,	%g1
	membar	0x30
	brnz,a	%i4,	loop_541
	brlz	%i5,	loop_542
	ldsh	[%l7 + 0x5A],	%i1
	umul	%i6,	%l3,	%i7
loop_541:
	addc	%g6,	0x12E3,	%o3
loop_542:
	fmovdne	%icc,	%f1,	%f6
	fbg	%fcc1,	loop_543
	tsubcc	%l6,	0x1E33,	%g4
	fmovsvs	%xcc,	%f14,	%f12
	ble,a	loop_544
loop_543:
	st	%f28,	[%l7 + 0x5C]
	std	%l0,	[%l7 + 0x30]
	tne	%icc,	0x1
loop_544:
	and	%o2,	%g7,	%g5
	mulscc	%o5,	%g2,	%o6
	umulcc	%l0,	%l2,	%g3
	ld	[%l7 + 0x24],	%f11
	fxnors	%f30,	%f31,	%f20
	bl,a	%xcc,	loop_545
	fbo	%fcc0,	loop_546
	movne	%icc,	%o4,	%l4
	tvs	%xcc,	0x4
loop_545:
	fmovs	%f15,	%f29
loop_546:
	nop
	set	0x56, %l3
	stha	%l5,	[%l7 + %l3] 0x81
	fandnot2s	%f0,	%f12,	%f3
	andncc	%o7,	%i2,	%o0
	sethi	0x154B,	%o1
	tn	%xcc,	0x5
	tcc	%xcc,	0x6
	tcc	%icc,	0x2
	set	0x13, %l6
	lduba	[%l7 + %l6] 0x14,	%i3
	fone	%f8
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrne	%g1,	%i4,	%i0
	movvs	%icc,	%i1,	%i5
	movrne	%i6,	%i7,	%l3
	wr	%g0,	0x11,	%asi
	stwa	%o3,	[%l7 + 0x70] %asi
	te	%xcc,	0x3
	or	%l6,	%g6,	%g4
	movle	%xcc,	%l1,	%o2
	fandnot1s	%f5,	%f20,	%f15
	umulcc	%g5,	0x18D3,	%g7
	movle	%xcc,	%o5,	%g2
	movpos	%xcc,	%l0,	%l2
	tvc	%icc,	0x4
	fnand	%f28,	%f20,	%f16
	fpack32	%f20,	%f24,	%f18
	array16	%g3,	%o6,	%o4
	edge16l	%l4,	%l5,	%o7
	xor	%i2,	0x10A6,	%o1
	udivcc	%o0,	0x154D,	%g1
	fandnot2	%f28,	%f28,	%f4
	smul	%i3,	%i4,	%i1
	fbuge,a	%fcc0,	loop_547
	movrgz	%i0,	0x2CD,	%i6
	movrlz	%i5,	0x353,	%i7
	edge16	%o3,	%l3,	%l6
loop_547:
	orn	%g4,	%g6,	%l1
	tvs	%icc,	0x6
	bshuffle	%f2,	%f16,	%f30
	fmovrslez	%g5,	%f18,	%f6
	siam	0x1
	fmovsle	%icc,	%f5,	%f4
	fbge,a	%fcc1,	loop_548
	movleu	%xcc,	%g7,	%o5
	mulx	%o2,	0x132E,	%l0
	tvc	%icc,	0x7
loop_548:
	fcmpes	%fcc2,	%f29,	%f0
	fmovrsne	%g2,	%f29,	%f29
	fpack32	%f6,	%f10,	%f10
	movcc	%icc,	%g3,	%l2
	fbuge	%fcc0,	loop_549
	movg	%xcc,	%o4,	%l4
	fbe	%fcc1,	loop_550
	fandnot2	%f8,	%f8,	%f26
loop_549:
	sub	%l5,	0x1173,	%o6
	udivcc	%i2,	0x0518,	%o7
loop_550:
	fornot2	%f18,	%f28,	%f16
	movre	%o1,	0x3B9,	%g1
	sra	%i3,	0x06,	%i4
	siam	0x5
	taddcctv	%o0,	%i0,	%i6
	fbg	%fcc1,	loop_551
	fbge	%fcc2,	loop_552
	array8	%i1,	%i5,	%i7
	xor	%l3,	0x0325,	%o3
loop_551:
	ldsh	[%l7 + 0x10],	%g4
loop_552:
	tvs	%xcc,	0x1
	alignaddr	%g6,	%l1,	%l6
	ldx	[%l7 + 0x60],	%g5
	fnors	%f6,	%f22,	%f9
	smulcc	%o5,	0x10F0,	%g7
	movneg	%icc,	%o2,	%l0
	mulscc	%g2,	0x1721,	%g3
	movl	%xcc,	%l2,	%l4
	movvc	%xcc,	%o4,	%o6
	fbul,a	%fcc1,	loop_553
	movcs	%icc,	%l5,	%i2
	tn	%icc,	0x3
	std	%f12,	[%l7 + 0x08]
loop_553:
	xor	%o7,	0x083A,	%g1
	xnorcc	%o1,	%i3,	%i4
	udivcc	%i0,	0x13FC,	%o0
	movl	%xcc,	%i6,	%i5
	fmovrsgez	%i1,	%f13,	%f15
	subc	%i7,	0x07F7,	%l3
	wr	%g0,	0x89,	%asi
	prefetcha	[%l7 + 0x30] %asi,	 0x1
	stw	%g6,	[%l7 + 0x10]
	edge16ln	%l1,	%l6,	%g4
	sth	%g5,	[%l7 + 0x7C]
	flush	%l7 + 0x28
	ldsh	[%l7 + 0x30],	%g7
	fmovrslez	%o5,	%f18,	%f16
	fmovsl	%xcc,	%f15,	%f31
	tge	%xcc,	0x5
	edge32ln	%l0,	%o2,	%g2
	stbar
	edge8l	%l2,	%g3,	%o4
	fmovsgu	%xcc,	%f26,	%f10
	orncc	%o6,	%l4,	%l5
	movle	%icc,	%o7,	%i2
	subcc	%g1,	%o1,	%i4
	alignaddr	%i0,	%i3,	%i6
	popc	%o0,	%i1
	wr	%g0,	0x22,	%asi
	stwa	%i7,	[%l7 + 0x70] %asi
	membar	#Sync
	or	%i5,	%l3,	%g6
	array32	%l1,	%l6,	%o3
	fmul8sux16	%f10,	%f28,	%f12
	addcc	%g4,	%g7,	%o5
	tvs	%xcc,	0x7
	move	%icc,	%l0,	%o2
	tl	%xcc,	0x2
	fnor	%f6,	%f28,	%f4
	tleu	%xcc,	0x2
	fnot2s	%f11,	%f10
	tleu	%xcc,	0x2
	stw	%g5,	[%l7 + 0x70]
	movleu	%icc,	%g2,	%l2
	movvc	%xcc,	%o4,	%o6
	array16	%l4,	%l5,	%o7
	tvs	%xcc,	0x7
	edge16ln	%i2,	%g3,	%g1
	orn	%i4,	0x18C9,	%i0
	movvc	%xcc,	%o1,	%i3
	smulcc	%i6,	%i1,	%i7
	andcc	%i5,	%l3,	%o0
	fones	%f12
	sethi	0x172E,	%l1
	or	%g6,	%l6,	%g4
	fnand	%f10,	%f24,	%f2
	movle	%xcc,	%g7,	%o3
	fzeros	%f2
	nop
	set	0x60, %o2
	ldd	[%l7 + %o2],	%l0
	movvc	%icc,	%o5,	%o2
	edge16n	%g5,	%g2,	%l2
	bne,a	loop_554
	sethi	0x0985,	%o4
	movne	%icc,	%l4,	%o6
	movpos	%xcc,	%o7,	%l5
loop_554:
	tsubcc	%g3,	0x075F,	%i2
	tleu	%icc,	0x4
	set	0x5C, %l0
	lduha	[%l7 + %l0] 0x81,	%g1
	xorcc	%i0,	0x0A75,	%o1
	stw	%i4,	[%l7 + 0x0C]
	movrlz	%i3,	%i6,	%i1
	edge8	%i7,	%l3,	%i5
	array32	%o0,	%l1,	%l6
	tpos	%icc,	0x0
	movrgz	%g6,	0x187,	%g4
	be,a,pn	%icc,	loop_555
	smulcc	%g7,	0x0BFA,	%o3
	set	0x28, %i7
	stha	%l0,	[%l7 + %i7] 0xeb
	membar	#Sync
loop_555:
	tcs	%xcc,	0x2
	array8	%o2,	%o5,	%g5
	tcs	%icc,	0x3
	movrgz	%g2,	%l2,	%o4
	fcmpes	%fcc0,	%f3,	%f8
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tle	%icc,	0x7
	fnegs	%f19,	%f27
	bneg,a	%icc,	loop_556
	taddcc	%l4,	0x0FB1,	%o6
	xnor	%o7,	0x1F26,	%g3
	fba,a	%fcc2,	loop_557
loop_556:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	smul	%l5,	%g1,	%i2
	tne	%xcc,	0x0
loop_557:
	sdivcc	%o1,	0x10CE,	%i0
	wr	%g0,	0x2f,	%asi
	stxa	%i4,	[%l7 + 0x10] %asi
	membar	#Sync
	edge16l	%i6,	%i1,	%i7
	smulcc	%l3,	%i3,	%o0
	umulcc	%l1,	0x0D0F,	%i5
	tneg	%icc,	0x1
	edge8l	%l6,	%g6,	%g7
	stx	%o3,	[%l7 + 0x70]
	add	%l7,	0x68,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] %asi,	%l0,	%g4
	stbar
	alignaddrl	%o5,	%o2,	%g5
	fsrc1s	%f29,	%f6
	fbue,a	%fcc0,	loop_558
	fornot2	%f24,	%f12,	%f18
	sdivcc	%g2,	0x17C8,	%o4
	fpsub16s	%f26,	%f25,	%f18
loop_558:
	fmovsne	%xcc,	%f16,	%f11
	edge32l	%l2,	%l4,	%o7
	andncc	%g3,	%l5,	%o6
	movcs	%icc,	%g1,	%o1
	edge16	%i0,	%i2,	%i6
	movleu	%xcc,	%i4,	%i1
	udivx	%i7,	0x0333,	%i3
	std	%l2,	[%l7 + 0x78]
	movre	%l1,	%i5,	%o0
	orn	%g6,	%g7,	%l6
	tpos	%xcc,	0x2
	addcc	%o3,	0x1018,	%l0
	subcc	%g4,	0x0EE9,	%o2
	add	%g5,	%o5,	%o4
	bgu	loop_559
	tg	%icc,	0x4
	andncc	%g2,	%l2,	%l4
	fmuld8sux16	%f0,	%f20,	%f14
loop_559:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmul8x16al	%f24,	%f9,	%f30
	ldsb	[%l7 + 0x19],	%g3
	edge16ln	%o7,	%o6,	%l5
	movrlez	%o1,	%i0,	%g1
	fabsd	%f26,	%f14
	fbe	%fcc2,	loop_560
	popc	0x182C,	%i6
	subc	%i4,	%i2,	%i1
	mulx	%i7,	0x0D9E,	%i3
loop_560:
	edge16	%l1,	%l3,	%o0
	and	%i5,	0x0518,	%g7
	movre	%l6,	%g6,	%o3
	fbul,a	%fcc0,	loop_561
	umulcc	%g4,	%l0,	%g5
	or	%o5,	0x199B,	%o4
	fmovse	%icc,	%f8,	%f16
loop_561:
	bg,pn	%icc,	loop_562
	fcmps	%fcc3,	%f24,	%f3
	movleu	%icc,	%o2,	%l2
	edge32ln	%g2,	%l4,	%g3
loop_562:
	fmovrdne	%o7,	%f18,	%f18
	fcmpeq32	%f12,	%f30,	%l5
	mulscc	%o6,	0x1CB4,	%o1
	bvs,pn	%xcc,	loop_563
	fnands	%f14,	%f1,	%f11
	nop
	setx	loop_564,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	addccc	%g1,	0x1F11,	%i0
loop_563:
	movre	%i6,	0x040,	%i4
	pdist	%f14,	%f20,	%f0
loop_564:
	umulcc	%i1,	%i2,	%i3
	edge32	%i7,	%l1,	%o0
	subcc	%i5,	%l3,	%g7
	taddcc	%l6,	0x04BB,	%o3
	fbge	%fcc0,	loop_565
	std	%g6,	[%l7 + 0x30]
	sub	%g4,	0x0675,	%l0
	bvc	%xcc,	loop_566
loop_565:
	fnors	%f11,	%f17,	%f0
	xnorcc	%g5,	0x1823,	%o5
	movvc	%xcc,	%o2,	%o4
loop_566:
	edge8l	%l2,	%g2,	%l4
	fmovrdgz	%o7,	%f18,	%f16
	edge8	%l5,	%g3,	%o6
	fbu	%fcc2,	loop_567
	fble	%fcc2,	loop_568
	fnegs	%f13,	%f7
	srlx	%g1,	0x1A,	%o1
loop_567:
	smul	%i0,	%i4,	%i1
loop_568:
	movpos	%icc,	%i6,	%i3
	taddcc	%i2,	0x016B,	%l1
	edge32	%i7,	%o0,	%l3
	movn	%icc,	%g7,	%l6
	edge16l	%o3,	%g6,	%g4
	fcmpgt16	%f12,	%f12,	%l0
	fsrc2	%f0,	%f16
	fmul8ulx16	%f2,	%f28,	%f0
	wr	%g0,	0x19,	%asi
	stda	%i4,	[%l7 + 0x50] %asi
	fandnot2s	%f7,	%f0,	%f19
	edge32n	%o5,	%g5,	%o4
	sub	%o2,	%g2,	%l2
	bcc,a	loop_569
	brlz	%o7,	loop_570
	pdist	%f4,	%f0,	%f26
	orcc	%l4,	0x07AE,	%g3
loop_569:
	fcmple16	%f22,	%f6,	%l5
loop_570:
	tvc	%icc,	0x0
	alignaddrl	%g1,	%o1,	%o6
	tsubcc	%i4,	0x0183,	%i0
	add	%i1,	0x0F5D,	%i6
	fmovsge	%xcc,	%f28,	%f10
	wr	%g0,	0xe3,	%asi
	stba	%i2,	[%l7 + 0x47] %asi
	membar	#Sync
	edge16n	%l1,	%i3,	%i7
	tpos	%xcc,	0x5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udivcc	%l3,	0x0302,	%g7
	tgu	%icc,	0x0
	fbug	%fcc1,	loop_571
	fand	%f2,	%f28,	%f12
	fpadd32	%f8,	%f30,	%f30
	tvc	%icc,	0x3
loop_571:
	fornot1	%f26,	%f8,	%f16
	fmovse	%xcc,	%f12,	%f28
	ta	%icc,	0x6
	tcc	%icc,	0x2
	sub	%l6,	0x1A3E,	%o3
	tvc	%xcc,	0x1
	sir	0x1656
	set	0x8, %l4
	ldxa	[%g0 + %l4] 0x20,	%g6
	ble,a	%xcc,	loop_572
	bvc,pt	%icc,	loop_573
	st	%f13,	[%l7 + 0x28]
	set	0x18, %g2
	swapa	[%l7 + %g2] 0x19,	%g4
loop_572:
	tge	%icc,	0x6
loop_573:
	nop
	set	0x40, %l1
	stda	%f0,	[%l7 + %l1] 0x18
	swap	[%l7 + 0x38],	%l0
	fmovsle	%xcc,	%f9,	%f14
	fble,a	%fcc2,	loop_574
	move	%xcc,	%i5,	%o5
	subc	%g5,	%o4,	%o0
	movne	%xcc,	%g2,	%l2
loop_574:
	srax	%o7,	%l4,	%g3
	array8	%l5,	%o2,	%o1
	tvs	%icc,	0x1
	addccc	%g1,	0x00E9,	%i4
	stw	%o6,	[%l7 + 0x74]
	ba,pn	%xcc,	loop_575
	fcmple16	%f2,	%f0,	%i0
	fmovdle	%xcc,	%f26,	%f24
	fbule	%fcc0,	loop_576
loop_575:
	fnot2	%f0,	%f30
	edge16ln	%i1,	%i6,	%l1
	tgu	%icc,	0x3
loop_576:
	movrlez	%i3,	%i2,	%i7
	movvc	%icc,	%l3,	%l6
	sdivx	%g7,	0x137B,	%o3
	movg	%xcc,	%g4,	%g6
	sdiv	%l0,	0x1213,	%i5
	fcmpgt16	%f20,	%f26,	%g5
	add	%o4,	0x0479,	%o5
	movvs	%icc,	%o0,	%l2
	addc	%g2,	%o7,	%g3
	orncc	%l5,	%o2,	%o1
	alignaddr	%g1,	%i4,	%l4
	fmovsleu	%icc,	%f8,	%f4
	fandnot2	%f6,	%f18,	%f26
	umulcc	%i0,	0x16BE,	%o6
	tvc	%xcc,	0x3
	orcc	%i1,	%l1,	%i6
	fbug,a	%fcc3,	loop_577
	movrgz	%i3,	0x09D,	%i7
	movrgz	%i2,	%l6,	%l3
	membar	0x29
loop_577:
	fmovrdne	%o3,	%f4,	%f12
	edge16	%g4,	%g7,	%l0
	movle	%icc,	%g6,	%g5
	fzero	%f22
	taddcc	%i5,	%o4,	%o0
	fnand	%f4,	%f18,	%f20
	fandnot1	%f18,	%f6,	%f14
	movgu	%xcc,	%l2,	%o5
	movrlz	%o7,	%g2,	%g3
	fmovrse	%o2,	%f19,	%f16
	or	%o1,	0x1E99,	%l5
	ldstub	[%l7 + 0x48],	%g1
	fmovsneg	%icc,	%f4,	%f29
	srax	%i4,	%l4,	%i0
	mulscc	%i1,	0x090A,	%o6
	subcc	%l1,	%i6,	%i7
	nop
	set	0x0E, %g1
	sth	%i3,	[%l7 + %g1]
	fbuge	%fcc2,	loop_578
	fblg,a	%fcc2,	loop_579
	edge16n	%l6,	%l3,	%o3
	wr	%g0,	0x11,	%asi
	sta	%f27,	[%l7 + 0x60] %asi
loop_578:
	nop
	set	0x14, %o4
	stba	%g4,	[%l7 + %o4] 0x81
loop_579:
	move	%xcc,	%g7,	%l0
	fmovde	%icc,	%f23,	%f18
	fone	%f10
	brlez,a	%g6,	loop_580
	edge8n	%i2,	%g5,	%o4
	alignaddr	%i5,	%o0,	%l2
	wr	%g0,	0x11,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
loop_580:
	fmovsl	%icc,	%f22,	%f24
	alignaddr	%o7,	%o5,	%g3
	movn	%xcc,	%o2,	%g2
	move	%xcc,	%l5,	%o1
	edge8ln	%g1,	%l4,	%i0
	ble,a	%xcc,	loop_581
	ldsh	[%l7 + 0x26],	%i1
	umulcc	%i4,	%l1,	%o6
	fmuld8ulx16	%f14,	%f1,	%f4
loop_581:
	movne	%xcc,	%i6,	%i7
	movcs	%icc,	%l6,	%i3
	be,a	loop_582
	movne	%icc,	%l3,	%o3
	fmovdl	%xcc,	%f17,	%f6
	fnand	%f2,	%f14,	%f28
loop_582:
	movrlez	%g7,	%g4,	%g6
	fbug,a	%fcc1,	loop_583
	mulx	%l0,	0x0B84,	%g5
	taddcc	%o4,	0x1109,	%i5
	fnegd	%f28,	%f16
loop_583:
	bneg,pt	%icc,	loop_584
	addcc	%o0,	0x127B,	%i2
	movgu	%icc,	%l2,	%o7
	fmovdle	%icc,	%f27,	%f12
loop_584:
	stbar
	fornot2	%f28,	%f6,	%f26
	fbul,a	%fcc2,	loop_585
	or	%g3,	%o5,	%o2
	movcs	%icc,	%l5,	%g2
	or	%o1,	%l4,	%g1
loop_585:
	orncc	%i1,	0x0EB2,	%i0
	and	%l1,	%i4,	%i6
	movvc	%icc,	%i7,	%o6
	sir	0x065C
	fbug,a	%fcc1,	loop_586
	tsubcctv	%l6,	%i3,	%l3
	edge8n	%g7,	%g4,	%g6
	sra	%l0,	0x10,	%g5
loop_586:
	brlez	%o4,	loop_587
	tg	%xcc,	0x2
	orn	%o3,	%i5,	%o0
	set	0x1D, %o7
	ldstuba	[%l7 + %o7] 0x80,	%l2
loop_587:
	tvs	%icc,	0x7
	bleu,pn	%icc,	loop_588
	edge16n	%i2,	%g3,	%o5
	wr	%g0,	0x81,	%asi
	sta	%f30,	[%l7 + 0x10] %asi
loop_588:
	fcmpne16	%f28,	%f28,	%o2
	brlz	%l5,	loop_589
	umulcc	%o7,	0x07F1,	%g2
	udiv	%o1,	0x106D,	%l4
	sethi	0x06DC,	%g1
loop_589:
	movg	%xcc,	%i0,	%l1
	srlx	%i4,	0x07,	%i1
	sethi	0x154D,	%i6
	bge,a	loop_590
	fnors	%f21,	%f3,	%f6
	wr	%g0,	0x81,	%asi
	lduba	[%l7 + 0x19] %asi,	%o6
loop_590:
	tneg	%xcc,	0x5
	fmovrsgz	%l6,	%f13,	%f4
	movpos	%xcc,	%i7,	%l3
	ld	[%l7 + 0x0C],	%f2
	mulx	%g7,	0x1200,	%g4
	fbge,a	%fcc2,	loop_591
	mova	%icc,	%i3,	%l0
	tsubcc	%g6,	0x1A97,	%o4
	edge8l	%g5,	%i5,	%o3
loop_591:
	subccc	%o0,	%l2,	%g3
	or	%i2,	0x0989,	%o2
	tg	%xcc,	0x7
	movpos	%xcc,	%o5,	%l5
	ldd	[%l7 + 0x18],	%f4
	fpadd16	%f24,	%f4,	%f14
	fmovsne	%xcc,	%f8,	%f29
	alignaddr	%g2,	%o7,	%l4
	edge16n	%o1,	%i0,	%l1
	popc	0x1C21,	%i4
	fxor	%f26,	%f16,	%f0
	udivcc	%i1,	0x092E,	%i6
	and	%o6,	0x1E0C,	%g1
	fcmple32	%f8,	%f26,	%i7
	addcc	%l3,	%l6,	%g7
	umulcc	%g4,	%i3,	%l0
	xor	%o4,	0x0806,	%g6
	fmovd	%f14,	%f0
	array8	%i5,	%o3,	%o0
	orcc	%l2,	0x10D6,	%g3
	edge16l	%g5,	%i2,	%o2
	xor	%l5,	%g2,	%o5
	subccc	%o7,	%l4,	%o1
	fxor	%f26,	%f14,	%f16
	fpsub16s	%f31,	%f30,	%f15
	fbule,a	%fcc2,	loop_592
	edge32ln	%i0,	%l1,	%i1
	udivcc	%i4,	0x0012,	%i6
	umul	%g1,	%i7,	%l3
loop_592:
	array32	%o6,	%l6,	%g7
	bneg,a	%icc,	loop_593
	or	%i3,	0x09E7,	%g4
	xnorcc	%l0,	%o4,	%i5
	and	%g6,	0x0E2C,	%o0
loop_593:
	taddcc	%l2,	0x1A8A,	%o3
	fone	%f26
	ta	%icc,	0x4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrgez	%g5,	0x2BE,	%g3
	ldd	[%l7 + 0x48],	%f20
	be,pn	%icc,	loop_594
	fbl,a	%fcc3,	loop_595
	alignaddrl	%o2,	%i2,	%l5
	fmovrde	%g2,	%f0,	%f26
loop_594:
	movcs	%xcc,	%o7,	%o5
loop_595:
	lduh	[%l7 + 0x78],	%l4
	ldsw	[%l7 + 0x6C],	%o1
	fmovd	%f16,	%f24
	srax	%l1,	0x02,	%i1
	movne	%icc,	%i4,	%i0
	st	%f22,	[%l7 + 0x24]
	movrlez	%g1,	0x053,	%i7
	fpadd32	%f30,	%f18,	%f10
	movneg	%xcc,	%i6,	%o6
	and	%l3,	0x1933,	%g7
	smul	%l6,	%i3,	%g4
	faligndata	%f16,	%f30,	%f20
	move	%xcc,	%l0,	%i5
	membar	0x54
	edge8ln	%g6,	%o4,	%o0
	bcs,a	%icc,	loop_596
	movrlez	%l2,	0x2E9,	%o3
	fmovrslz	%g5,	%f30,	%f0
	fmovrdlz	%g3,	%f6,	%f28
loop_596:
	tne	%xcc,	0x2
	edge16n	%i2,	%l5,	%o2
	edge8l	%o7,	%g2,	%o5
	fpadd16s	%f9,	%f14,	%f24
	bn	%icc,	loop_597
	array16	%o1,	%l1,	%l4
	fbe,a	%fcc2,	loop_598
	or	%i4,	%i0,	%i1
loop_597:
	bg	%xcc,	loop_599
	movrne	%i7,	0x246,	%g1
loop_598:
	tn	%xcc,	0x7
	fzeros	%f21
loop_599:
	sdivcc	%o6,	0x1139,	%l3
	fble	%fcc1,	loop_600
	ld	[%l7 + 0x70],	%f7
	tg	%xcc,	0x1
	fbule	%fcc1,	loop_601
loop_600:
	fandnot1	%f2,	%f18,	%f26
	srax	%g7,	%l6,	%i3
	set	0x20, %o5
	ldxa	[%g0 + %o5] 0x4f,	%g4
loop_601:
	ldstub	[%l7 + 0x54],	%l0
	umulcc	%i5,	%g6,	%i6
	alignaddr	%o4,	%l2,	%o3
	edge16l	%o0,	%g3,	%g5
	movg	%icc,	%l5,	%o2
	fpack16	%f8,	%f28
	sllx	%i2,	0x13,	%g2
	stx	%o7,	[%l7 + 0x70]
	bleu,a,pn	%icc,	loop_602
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
	edge32l	%o1,	%l1,	%o5
	fsrc1	%f8,	%f28
loop_602:
	movvs	%xcc,	%l4,	%i4
loop_603:
	srax	%i0,	%i1,	%i7
	ldsw	[%l7 + 0x10],	%o6
	movvc	%icc,	%l3,	%g7
	ble,pn	%xcc,	loop_604
	fmovrse	%g1,	%f12,	%f20
	movge	%icc,	%l6,	%g4
	tge	%xcc,	0x3
loop_604:
	ldub	[%l7 + 0x0C],	%i3
	edge8l	%i5,	%l0,	%i6
	set	0x28, %o0
	stwa	%g6,	[%l7 + %o0] 0x2f
	membar	#Sync
	fcmple32	%f14,	%f16,	%l2
	edge32	%o4,	%o0,	%g3
	or	%o3,	0x04E5,	%g5
	movrlez	%o2,	%i2,	%l5
	fexpand	%f21,	%f28
	nop
	setx	loop_605,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	ld	[%l7 + 0x4C],	%f13
	fble,a	%fcc2,	loop_606
	xor	%g2,	0x0153,	%o7
loop_605:
	tvc	%icc,	0x0
	udiv	%l1,	0x1527,	%o5
loop_606:
	stw	%l4,	[%l7 + 0x2C]
	tvs	%xcc,	0x2
	movrlz	%o1,	%i4,	%i0
	fcmped	%fcc3,	%f8,	%f18
	addccc	%i1,	0x0A7C,	%o6
	tcs	%xcc,	0x2
	siam	0x4
	prefetch	[%l7 + 0x24],	 0x2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrne	%l3,	0x3B3,	%g7
	bge,pn	%icc,	loop_607
	fbuge,a	%fcc2,	loop_608
	srl	%g1,	0x04,	%i7
	faligndata	%f6,	%f12,	%f0
loop_607:
	movg	%icc,	%g4,	%i3
loop_608:
	movrne	%i5,	0x2E0,	%l0
	movgu	%xcc,	%i6,	%l6
	tne	%xcc,	0x2
	udivx	%g6,	0x0958,	%o4
	nop
	set	0x40, %l2
	std	%o0,	[%l7 + %l2]
	array16	%g3,	%l2,	%g5
	fbul,a	%fcc1,	loop_609
	tsubcc	%o2,	%o3,	%l5
	array16	%i2,	%o7,	%g2
	tvc	%icc,	0x6
loop_609:
	edge16l	%o5,	%l1,	%l4
	andcc	%o1,	%i4,	%i0
	set	0x20, %g4
	stha	%o6,	[%l7 + %g4] 0x23
	membar	#Sync
	movre	%i1,	%l3,	%g7
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
	sub	%i7,	0x0C3D,	%g1
	wr	%g0,	0x19,	%asi
	lda	[%l7 + 0x64] %asi,	%f12
loop_610:
	fpsub16	%f30,	%f2,	%f14
	fpack16	%f20,	%f16
	edge16ln	%g4,	%i3,	%i5
	movcs	%icc,	%i6,	%l6
	umul	%g6,	0x0975,	%o4
	bge,pn	%xcc,	loop_611
	fpackfix	%f24,	%f2
	fandnot1s	%f25,	%f26,	%f13
	fmovrslz	%l0,	%f16,	%f24
loop_611:
	ldstub	[%l7 + 0x27],	%g3
	movn	%xcc,	%o0,	%g5
	orn	%l2,	%o3,	%l5
	brlz	%i2,	loop_612
	nop
	set	0x19, %g7
	ldsb	[%l7 + %g7],	%o7
	ldub	[%l7 + 0x62],	%g2
	edge32n	%o2,	%l1,	%l4
loop_612:
	brnz,a	%o5,	loop_613
	ldsw	[%l7 + 0x64],	%i4
	udivx	%o1,	0x19EB,	%o6
	fmul8sux16	%f6,	%f4,	%f4
loop_613:
	bge,a	loop_614
	srlx	%i1,	%l3,	%g7
	tn	%icc,	0x4
	fmovse	%xcc,	%f28,	%f20
loop_614:
	tge	%xcc,	0x0
	fornot2	%f0,	%f8,	%f6
	edge32	%i7,	%g1,	%g4
	movpos	%xcc,	%i0,	%i5
	and	%i6,	0x1E85,	%l6
	set	0x40, %g3
	stda	%f16,	[%l7 + %g3] 0x17
	membar	#Sync
	popc	%i3,	%g6
	std	%o4,	[%l7 + 0x68]
	fble	%fcc3,	loop_615
	srl	%g3,	%l0,	%g5
	sub	%o0,	%l2,	%o3
	sdivx	%i2,	0x157B,	%l5
loop_615:
	fsrc1	%f12,	%f10
	or	%o7,	%g2,	%o2
	fbuge,a	%fcc2,	loop_616
	xor	%l4,	%l1,	%o5
	movvs	%xcc,	%o1,	%o6
	tcc	%icc,	0x5
loop_616:
	movcs	%icc,	%i1,	%i4
	swap	[%l7 + 0x58],	%g7
	movn	%icc,	%i7,	%g1
	sll	%g4,	%i0,	%i5
	tneg	%xcc,	0x3
	array32	%l3,	%i6,	%l6
	sdivcc	%g6,	0x0385,	%o4
	nop
	setx loop_617, %l0, %l1
	jmpl %l1, %g3
	bge,pt	%icc,	loop_618
	popc	0x19D5,	%l0
	fmovsneg	%xcc,	%f19,	%f4
loop_617:
	alignaddrl	%i3,	%o0,	%g5
loop_618:
	tvc	%xcc,	0x6
	brlez	%o3,	loop_619
	edge32l	%i2,	%l5,	%l2
	srlx	%g2,	0x16,	%o7
	taddcctv	%o2,	%l1,	%l4
loop_619:
	fmul8x16	%f0,	%f16,	%f12
	movge	%icc,	%o1,	%o5
	wr	%g0,	0x58,	%asi
	ldxa	[%g0 + 0x80] %asi,	%i1
	set	0x14, %i1
	stwa	%o6,	[%l7 + %i1] 0xea
	membar	#Sync
	sethi	0x12BF,	%g7
	fmovrdgz	%i4,	%f20,	%f16
	movrlz	%g1,	%i7,	%i0
	wr	%g0,	0x19,	%asi
	swapa	[%l7 + 0x08] %asi,	%g4
	sdivx	%l3,	0x1D89,	%i5
	fnand	%f4,	%f0,	%f16
	fbue	%fcc2,	loop_620
	edge32	%i6,	%l6,	%o4
	mova	%xcc,	%g6,	%l0
	edge16n	%g3,	%o0,	%g5
loop_620:
	nop
	set	0x20, %g5
	ldswa	[%l7 + %g5] 0x04,	%i3
	edge32	%i2,	%o3,	%l2
	tvc	%xcc,	0x5
	for	%f24,	%f12,	%f10
	ldsh	[%l7 + 0x32],	%g2
	fba	%fcc2,	loop_621
	fmovsa	%xcc,	%f13,	%f25
	tge	%xcc,	0x1
	addcc	%l5,	0x08BC,	%o2
loop_621:
	te	%icc,	0x3
	sub	%l1,	0x1E97,	%l4
	fmovsleu	%icc,	%f26,	%f6
	fpsub16	%f2,	%f4,	%f0
	fbg,a	%fcc0,	loop_622
	movcc	%icc,	%o1,	%o5
	fmovdpos	%icc,	%f25,	%f20
	addc	%o7,	%o6,	%i1
loop_622:
	nop
	set	0x6C, %i3
	swapa	[%l7 + %i3] 0x19,	%g7
	edge8	%i4,	%i7,	%i0
	set	0x50, %g6
	ldsha	[%l7 + %g6] 0x10,	%g1
	addcc	%g4,	%l3,	%i6
	array8	%i5,	%o4,	%g6
	mova	%icc,	%l6,	%g3
	fmovdne	%xcc,	%f10,	%f24
	movrgz	%l0,	0x1A1,	%o0
	alignaddrl	%g5,	%i3,	%o3
	udivcc	%i2,	0x09DA,	%l2
	fpadd32s	%f22,	%f27,	%f29
	fpsub16	%f22,	%f14,	%f22
	wr	%g0,	0x19,	%asi
	sta	%f13,	[%l7 + 0x1C] %asi
	set	0x68, %i5
	prefetcha	[%l7 + %i5] 0x11,	 0x2
	fmovrdlez	%l5,	%f28,	%f0
	edge8n	%l1,	%l4,	%o1
	orncc	%o2,	0x0EF7,	%o7
	brgez,a	%o6,	loop_623
	brgez	%o5,	loop_624
	fpadd16s	%f30,	%f23,	%f0
	fandnot2s	%f20,	%f2,	%f31
loop_623:
	addcc	%i1,	%i4,	%i7
loop_624:
	flush	%l7 + 0x58
	tgu	%xcc,	0x6
	edge32l	%g7,	%g1,	%g4
	set	0x10, %o3
	stxa	%l3,	[%g0 + %o3] 0x21
	add	%i6,	0x0EA8,	%i5
	sdiv	%o4,	0x1096,	%g6
	fandnot2	%f8,	%f2,	%f6
	fnot2	%f10,	%f0
	set	0x30, %l5
	stha	%i0,	[%l7 + %l5] 0x2f
	membar	#Sync
	fbu,a	%fcc1,	loop_625
	movrlez	%l6,	%l0,	%g3
	andn	%g5,	0x090E,	%o0
	movvc	%icc,	%i3,	%i2
loop_625:
	movrlz	%o3,	0x25B,	%l2
	edge32ln	%g2,	%l5,	%l1
	fmuld8ulx16	%f26,	%f0,	%f4
	brlz,a	%l4,	loop_626
	udiv	%o2,	0x0F87,	%o7
	fmovsne	%xcc,	%f26,	%f19
	sth	%o1,	[%l7 + 0x4C]
loop_626:
	edge32n	%o6,	%i1,	%o5
	umulcc	%i7,	0x0551,	%g7
	add	%i4,	0x03E8,	%g1
	tcc	%icc,	0x4
	fcmple16	%f0,	%f12,	%l3
	set	0x76, %i4
	ldstuba	[%l7 + %i4] 0x88,	%i6
	sethi	0x1275,	%g4
	fmovs	%f29,	%f30
	tne	%icc,	0x5
	tsubcctv	%i5,	%o4,	%i0
	set	0x59, %i6
	stba	%l6,	[%l7 + %i6] 0x22
	membar	#Sync
	fpsub32s	%f30,	%f14,	%f16
	sdivx	%g6,	0x0B98,	%l0
	edge32	%g3,	%g5,	%o0
	stbar
	ble,a	loop_627
	tl	%icc,	0x6
	fxor	%f8,	%f18,	%f0
	fmovde	%xcc,	%f19,	%f30
loop_627:
	fmovrdgz	%i2,	%f10,	%f4
	sub	%i3,	0x0750,	%o3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnand	%f8,	%f4,	%f0
	wr	%g0,	0x89,	%asi
	lduwa	[%l7 + 0x34] %asi,	%g2
	movrlz	%l2,	%l1,	%l4
	srl	%l5,	%o7,	%o1
	te	%xcc,	0x0
	bleu,a,pt	%xcc,	loop_628
	smul	%o2,	%i1,	%o6
	subccc	%o5,	0x0B0D,	%i7
	fmovrslez	%g7,	%f25,	%f29
loop_628:
	prefetch	[%l7 + 0x70],	 0x2
	tcc	%xcc,	0x2
	bvs	loop_629
	lduw	[%l7 + 0x24],	%i4
	fmovspos	%icc,	%f31,	%f22
	mova	%icc,	%g1,	%l3
loop_629:
	tsubcc	%i6,	0x05F3,	%g4
	edge16n	%i5,	%o4,	%l6
	umulcc	%g6,	0x1B82,	%i0
	fors	%f4,	%f31,	%f14
	be	%icc,	loop_630
	edge32ln	%l0,	%g3,	%o0
	addcc	%g5,	%i3,	%i2
	bgu,a,pt	%xcc,	loop_631
loop_630:
	fpsub16	%f24,	%f20,	%f20
	fmovde	%xcc,	%f16,	%f11
	udiv	%g2,	0x0728,	%l2
loop_631:
	bvs,pt	%xcc,	loop_632
	bleu	%icc,	loop_633
	fornot1	%f6,	%f6,	%f18
	fnors	%f25,	%f30,	%f19
loop_632:
	movrgz	%o3,	%l4,	%l1
loop_633:
	movrne	%l5,	0x247,	%o1
	fornot1	%f28,	%f14,	%f2
	wr	%g0,	0x2f,	%asi
	stda	%o2,	[%l7 + 0x28] %asi
	membar	#Sync
	fsrc1	%f2,	%f20
	umulcc	%i1,	%o7,	%o6
	nop
	setx	loop_634,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fmovsa	%icc,	%f13,	%f16
	edge32l	%o5,	%g7,	%i7
	array32	%i4,	%g1,	%l3
loop_634:
	fnegd	%f22,	%f2
	set	0x7C, %o6
	lduwa	[%l7 + %o6] 0x18,	%i6
	fpadd16s	%f18,	%f3,	%f9
	movg	%icc,	%i5,	%g4
	fbug	%fcc1,	loop_635
	fmovsneg	%xcc,	%f3,	%f6
	edge32n	%o4,	%l6,	%g6
	bl,a,pn	%icc,	loop_636
loop_635:
	bge	%xcc,	loop_637
	fpsub32	%f24,	%f30,	%f24
	bshuffle	%f4,	%f4,	%f12
loop_636:
	movleu	%icc,	%i0,	%l0
loop_637:
	sub	%g3,	%g5,	%o0
	tne	%xcc,	0x1
	bvs,a,pn	%xcc,	loop_638
	edge16ln	%i3,	%i2,	%g2
	add	%l7,	0x14,	%l6
	wr	%g0,	0x0c,	%asi
	casa	[%l6] 0x0c,	%o3,	%l4
loop_638:
	sdivcc	%l2,	0x05B2,	%l1
	sll	%l5,	0x14,	%o1
	taddcctv	%o2,	0x02C6,	%o7
	array8	%i1,	%o5,	%o6
	fmovsneg	%icc,	%f3,	%f27
	bshuffle	%f8,	%f24,	%f16
	udiv	%i7,	0x1725,	%g7
	fmovsne	%xcc,	%f27,	%f17
	fmovsg	%icc,	%f22,	%f8
	popc	0x0D13,	%i4
	orn	%l3,	%i6,	%g1
	tl	%icc,	0x5
	fmovrde	%i5,	%f18,	%f0
	fmovrse	%g4,	%f19,	%f20
	movrgz	%l6,	%o4,	%g6
	movre	%l0,	%g3,	%g5
	movcs	%icc,	%i0,	%i3
	brlz,a	%o0,	loop_639
	alignaddrl	%i2,	%o3,	%l4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovd	%f16,	%f20
loop_639:
	std	%g2,	[%l7 + 0x58]
	bcs,a,pt	%icc,	loop_640
	movrgz	%l1,	0x130,	%l5
	sub	%l2,	%o2,	%o1
	udivcc	%o7,	0x0AA3,	%i1
loop_640:
	andcc	%o5,	0x17E0,	%i7
	edge8l	%o6,	%g7,	%l3
	wr	%g0,	0x89,	%asi
	lduba	[%l7 + 0x2C] %asi,	%i4
	xor	%i6,	%i5,	%g1
	nop
	set	0x20, %i2
	ldsw	[%l7 + %i2],	%g4
	lduh	[%l7 + 0x0C],	%o4
	fzeros	%f27
	flush	%l7 + 0x08
	edge32n	%g6,	%l0,	%l6
	fandnot2	%f10,	%f4,	%f28
	sll	%g5,	%g3,	%i3
	edge16ln	%o0,	%i2,	%o3
	andn	%i0,	0x16AA,	%l4
	fmul8sux16	%f18,	%f20,	%f26
	tsubcc	%g2,	0x02CA,	%l5
	andn	%l2,	0x010B,	%o2
	andcc	%o1,	0x0F18,	%o7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsa	%xcc,	%f6,	%f29
	nop
	setx	loop_641,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	te	%icc,	0x4
	array8	%i1,	%l1,	%i7
	move	%xcc,	%o5,	%g7
loop_641:
	movrgez	%l3,	%o6,	%i6
	edge8n	%i4,	%i5,	%g1
	movl	%icc,	%o4,	%g6
	bl,a	loop_642
	popc	%l0,	%l6
	tpos	%xcc,	0x5
	set	0x2C, %o1
	stba	%g5,	[%l7 + %o1] 0x22
	membar	#Sync
loop_642:
	taddcctv	%g3,	%i3,	%o0
	smul	%g4,	0x02CC,	%o3
	movg	%icc,	%i2,	%l4
	movgu	%xcc,	%i0,	%g2
	fands	%f30,	%f8,	%f5
	movcs	%icc,	%l2,	%o2
	fcmpne16	%f10,	%f6,	%l5
	fpsub32	%f0,	%f2,	%f28
	fmovsleu	%icc,	%f5,	%f0
	movcs	%xcc,	%o1,	%i1
	fbue,a	%fcc1,	loop_643
	addc	%l1,	%i7,	%o5
	tsubcctv	%o7,	0x00B8,	%g7
	tle	%xcc,	0x6
loop_643:
	umulcc	%o6,	0x0AD7,	%i6
	edge8	%l3,	%i4,	%i5
	fsrc1s	%f7,	%f12
	movne	%xcc,	%g1,	%o4
	edge8ln	%l0,	%l6,	%g6
	tl	%xcc,	0x2
	andcc	%g3,	0x0CEB,	%i3
	sdivcc	%g5,	0x0F45,	%g4
	taddcc	%o3,	0x173A,	%o0
	lduw	[%l7 + 0x1C],	%i2
	prefetch	[%l7 + 0x70],	 0x1
	tleu	%icc,	0x4
	popc	0x0D8E,	%i0
	move	%icc,	%g2,	%l4
	bne,a	loop_644
	edge8l	%o2,	%l5,	%o1
	edge8l	%i1,	%l1,	%l2
	fblg,a	%fcc2,	loop_645
loop_644:
	fba	%fcc0,	loop_646
	addc	%i7,	%o7,	%o5
	fmovscc	%icc,	%f19,	%f15
loop_645:
	movneg	%icc,	%g7,	%o6
loop_646:
	tvc	%xcc,	0x2
	alignaddrl	%l3,	%i6,	%i4
	nop
	setx	loop_647,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	nop
	setx	loop_648,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movvc	%xcc,	%i5,	%o4
	movl	%xcc,	%l0,	%g1
loop_647:
	orcc	%l6,	%g6,	%i3
loop_648:
	nop
	set	0x40, %i0
	stda	%f16,	[%l7 + %i0] 0x18
	popc	0x1589,	%g5
	xorcc	%g3,	0x0225,	%o3
	umulcc	%g4,	%i2,	%i0
	fbl	%fcc1,	loop_649
	tsubcctv	%g2,	0x00F1,	%o0
	andcc	%o2,	0x1A16,	%l5
	srax	%o1,	0x17,	%i1
loop_649:
	edge32n	%l4,	%l2,	%i7
	stb	%l1,	[%l7 + 0x77]
	fmovdneg	%icc,	%f17,	%f31
	mulx	%o7,	0x0B99,	%g7
	sub	%o6,	%o5,	%l3
	ldstub	[%l7 + 0x2A],	%i6
	tn	%icc,	0x5
	bg,a,pt	%icc,	loop_650
	fnegd	%f4,	%f6
	fmovdn	%xcc,	%f2,	%f4
	membar	0x0A
loop_650:
	fand	%f4,	%f14,	%f22
	movrlez	%i4,	%o4,	%i5
	fbug,a	%fcc2,	loop_651
	sllx	%l0,	0x05,	%g1
	fmul8x16al	%f22,	%f16,	%f16
	brgz	%l6,	loop_652
loop_651:
	fble	%fcc2,	loop_653
	tn	%icc,	0x3
	stx	%g6,	[%l7 + 0x68]
loop_652:
	bcc,a,pt	%icc,	loop_654
loop_653:
	tvs	%icc,	0x7
	sra	%g5,	0x03,	%i3
	sdivx	%o3,	0x077B,	%g3
loop_654:
	nop
	set	0x78, %l6
	ldsb	[%l7 + %l6],	%i2
	andn	%g4,	0x0838,	%g2
	fbl,a	%fcc1,	loop_655
	fmovdl	%icc,	%f28,	%f6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movge	%xcc,	%i0,	%o0
loop_655:
	fbule	%fcc3,	loop_656
	fmovrslez	%l5,	%f14,	%f15
	fandnot1s	%f14,	%f9,	%f6
	taddcc	%o1,	0x1407,	%o2
loop_656:
	nop
	setx loop_657, %l0, %l1
	jmpl %l1, %i1
	movvs	%xcc,	%l4,	%l2
	sllx	%l1,	%i7,	%g7
	set	0x30, %o2
	sta	%f17,	[%l7 + %o2] 0x80
loop_657:
	fbne,a	%fcc2,	loop_658
	brlez	%o7,	loop_659
	fcmpgt16	%f16,	%f12,	%o6
	fmovrsgz	%o5,	%f24,	%f23
loop_658:
	nop
	wr	%g0,	0x80,	%asi
	ldswa	[%l7 + 0x60] %asi,	%i6
loop_659:
	fmovdne	%xcc,	%f22,	%f18
	movpos	%xcc,	%i4,	%o4
	tsubcctv	%i5,	0x0278,	%l0
	andn	%l3,	0x0EB8,	%l6
	movrlz	%g1,	0x3BF,	%g6
	edge32n	%g5,	%o3,	%g3
	edge8	%i3,	%g4,	%g2
	umul	%i2,	0x0385,	%o0
	bvs,pn	%icc,	loop_660
	tsubcctv	%i0,	%l5,	%o2
	movrgez	%o1,	%l4,	%i1
	smulcc	%l2,	%l1,	%i7
loop_660:
	movvs	%xcc,	%g7,	%o7
	movg	%icc,	%o6,	%o5
	and	%i6,	0x0F84,	%i4
	fmovdpos	%xcc,	%f26,	%f15
	movle	%icc,	%i5,	%o4
	xnor	%l3,	%l0,	%g1
	sir	0x0640
	set	0x2C, %l0
	sta	%f5,	[%l7 + %l0] 0x89
	tneg	%icc,	0x3
	fandnot2	%f14,	%f14,	%f4
	orn	%l6,	0x0AAF,	%g5
	subc	%g6,	%o3,	%i3
	set	0x56, %l3
	ldsha	[%l7 + %l3] 0x14,	%g4
	set	0x10, %l4
	ldda	[%l7 + %l4] 0xe2,	%g2
	fpadd16s	%f27,	%f15,	%f3
	ble,a	loop_661
	andcc	%i2,	%o0,	%g3
	move	%icc,	%i0,	%o2
	udivx	%l5,	0x0EB2,	%l4
loop_661:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tl	%xcc,	0x4
	udivcc	%o1,	0x0259,	%l2
	subcc	%i1,	0x1896,	%l1
	fmovdge	%icc,	%f15,	%f1
	fands	%f29,	%f24,	%f4
	movrlez	%g7,	%i7,	%o7
	movre	%o6,	%i6,	%o5
	ta	%xcc,	0x1
	bleu,pt	%xcc,	loop_662
	movn	%xcc,	%i4,	%o4
	wr	%g0,	0x88,	%asi
	ldswa	[%l7 + 0x48] %asi,	%i5
loop_662:
	bshuffle	%f28,	%f20,	%f14
	fcmple16	%f0,	%f28,	%l0
	fcmps	%fcc2,	%f30,	%f11
	or	%l3,	%l6,	%g1
	mova	%icc,	%g5,	%g6
	edge32l	%o3,	%g4,	%g2
	wr	%g0,	0x80,	%asi
	stwa	%i3,	[%l7 + 0x78] %asi
	nop
	setx loop_663, %l0, %l1
	jmpl %l1, %o0
	stx	%i2,	[%l7 + 0x58]
	andncc	%g3,	%i0,	%o2
	movl	%xcc,	%l5,	%l4
loop_663:
	edge8n	%l2,	%i1,	%l1
	add	%o1,	%i7,	%o7
	xnor	%o6,	%i6,	%o5
	fnot1	%f22,	%f12
	movne	%icc,	%g7,	%i4
	fbo,a	%fcc2,	loop_664
	addcc	%i5,	%o4,	%l3
	subccc	%l6,	%g1,	%l0
	fmovsneg	%xcc,	%f8,	%f22
loop_664:
	mulx	%g6,	0x1F15,	%g5
	smulcc	%g4,	0x07B1,	%o3
	add	%l7,	0x08,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%i3
	casxa	[%l6] %asi,	%i3,	%o0
	wr	%g0,	0x18,	%asi
	ldstuba	[%l7 + 0x66] %asi,	%g2
	fmovrslez	%g3,	%f19,	%f3
	tl	%xcc,	0x1
	fnegs	%f22,	%f2
	prefetch	[%l7 + 0x30],	 0x2
	add	%l7,	0x78,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%i0,	%o2
	fxor	%f26,	%f6,	%f20
	smul	%i2,	0x1F4D,	%l4
	fnegs	%f4,	%f25
	xnor	%l2,	%l5,	%i1
	wr	%g0,	0x88,	%asi
	lduha	[%l7 + 0x28] %asi,	%o1
	movl	%xcc,	%l1,	%i7
	movne	%icc,	%o6,	%o7
	edge8n	%i6,	%g7,	%o5
	fcmple32	%f12,	%f20,	%i4
	fnot2s	%f26,	%f26
	nop
	setx	loop_665,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	sdiv	%o4,	0x17C0,	%i5
	fone	%f28
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_665:
	sll	%l6,	%g1,	%l0
	fmovde	%xcc,	%f31,	%f23
	subcc	%l3,	%g6,	%g4
	brnz	%g5,	loop_666
	movgu	%xcc,	%o3,	%i3
	smul	%g2,	%o0,	%i0
	fnot2	%f8,	%f24
loop_666:
	movrlez	%g3,	%i2,	%o2
	addccc	%l2,	0x0149,	%l5
	orn	%l4,	%i1,	%o1
	smulcc	%l1,	0x1857,	%i7
	edge16n	%o6,	%o7,	%g7
	tsubcctv	%i6,	%o5,	%i4
	fnot2s	%f17,	%f18
	fone	%f22
	tneg	%xcc,	0x5
	fbu	%fcc3,	loop_667
	sdivx	%o4,	0x0B7C,	%l6
	wr	%g0,	0x81,	%asi
	lduba	[%l7 + 0x1A] %asi,	%i5
loop_667:
	srl	%l0,	%l3,	%g6
	add	%l7,	0x2C,	%l6
	wr	%g0,	0x11,	%asi
	lda	[%l6] %asi,	%g1
	casa	[%l6] %asi,	%g1,	%g4
	fmovdgu	%icc,	%f21,	%f6
	addc	%o3,	%i3,	%g2
	movre	%g5,	0x363,	%i0
	fnot2s	%f11,	%f1
	mulscc	%g3,	0x0634,	%o0
	move	%xcc,	%o2,	%i2
	orn	%l2,	%l4,	%i1
	fmul8sux16	%f24,	%f20,	%f4
	fmovscc	%xcc,	%f17,	%f1
	fsrc2	%f22,	%f6
	move	%xcc,	%l5,	%o1
	subcc	%l1,	%i7,	%o6
	umul	%g7,	0x0D74,	%i6
	srl	%o5,	%o7,	%o4
	tneg	%xcc,	0x1
	stbar
	movrgz	%i4,	0x1A5,	%l6
	fandnot1s	%f15,	%f13,	%f10
	fandnot1s	%f23,	%f17,	%f5
	ta	%icc,	0x7
	edge8l	%i5,	%l0,	%l3
	fmovsl	%icc,	%f29,	%f10
	fmovrdgz	%g6,	%f30,	%f12
	edge32	%g4,	%g1,	%o3
	wr	%g0,	0x81,	%asi
	stha	%g2,	[%l7 + 0x58] %asi
	movne	%icc,	%i3,	%i0
	array32	%g3,	%g5,	%o2
	fmovdgu	%icc,	%f30,	%f1
	edge16n	%i2,	%o0,	%l4
	fmovrslez	%l2,	%f9,	%f16
	movre	%l5,	%i1,	%l1
	set	0x56, %g2
	stba	%i7,	[%l7 + %g2] 0x11
	tneg	%xcc,	0x2
	tsubcc	%o1,	0x18CE,	%o6
	fxor	%f14,	%f6,	%f14
	fsrc1	%f30,	%f22
	fcmpd	%fcc2,	%f10,	%f18
	movre	%g7,	%o5,	%i6
	lduw	[%l7 + 0x48],	%o7
	sllx	%o4,	%l6,	%i4
	bgu	%xcc,	loop_668
	fcmped	%fcc3,	%f10,	%f22
	nop
	set	0x3D, %l1
	ldsb	[%l7 + %l1],	%l0
	fandnot2s	%f11,	%f24,	%f0
loop_668:
	movvc	%xcc,	%i5,	%l3
	sdivx	%g6,	0x19D6,	%g4
	fmovsn	%icc,	%f9,	%f8
	udivcc	%o3,	0x04FE,	%g2
	add	%i3,	%g1,	%g3
	movrlz	%i0,	0x2D2,	%o2
	move	%xcc,	%i2,	%g5
	edge16ln	%o0,	%l2,	%l5
	movgu	%icc,	%i1,	%l4
	set	0x2D, %i7
	lduba	[%l7 + %i7] 0x10,	%l1
	fbl,a	%fcc0,	loop_669
	std	%o0,	[%l7 + 0x08]
	wr	%g0,	0x10,	%asi
	lda	[%l7 + 0x50] %asi,	%f31
loop_669:
	fpadd32s	%f24,	%f30,	%f29
	edge32l	%i7,	%o6,	%g7
	addc	%o5,	0x095E,	%o7
	sdivcc	%i6,	0x024B,	%l6
	fmovrdgz	%i4,	%f16,	%f22
	ta	%xcc,	0x6
	call	loop_670
	nop
	setx	loop_671,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fornot1	%f28,	%f26,	%f22
	nop
	setx	loop_672,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_670:
	fblg,a	%fcc1,	loop_673
loop_671:
	orn	%o4,	0x0142,	%l0
	ldd	[%l7 + 0x08],	%f14
loop_672:
	fabss	%f14,	%f8
loop_673:
	xorcc	%l3,	0x078C,	%g6
	edge32l	%g4,	%i5,	%o3
	tcs	%icc,	0x4
	ble,a	loop_674
	sethi	0x199D,	%i3
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
	edge16n	%g1,	%g3,	%g2
loop_674:
	xnor	%i0,	0x1008,	%i2
	tcs	%xcc,	0x7
loop_675:
	edge8	%g5,	%o0,	%o2
	movcs	%icc,	%l5,	%i1
	sethi	0x042A,	%l4
	ba,a,pn	%icc,	loop_676
	fmovse	%icc,	%f5,	%f30
	fmovrsgez	%l1,	%f8,	%f13
	fmovdge	%icc,	%f1,	%f6
loop_676:
	tleu	%xcc,	0x2
	fsrc2s	%f5,	%f22
	sdivcc	%l2,	0x0F50,	%i7
	fcmpgt16	%f6,	%f0,	%o1
	sdivx	%o6,	0x1D27,	%g7
	movneg	%xcc,	%o5,	%o7
	set	0x29, %g1
	ldstuba	[%l7 + %g1] 0x81,	%i6
	fpadd16s	%f29,	%f29,	%f29
	tleu	%icc,	0x0
	movpos	%icc,	%i4,	%l6
	movneg	%icc,	%o4,	%l0
	std	%g6,	[%l7 + 0x08]
	tgu	%icc,	0x5
	ta	%xcc,	0x6
	tle	%xcc,	0x5
	and	%g4,	%l3,	%i5
	tn	%xcc,	0x3
	edge32l	%o3,	%i3,	%g3
	ld	[%l7 + 0x24],	%f23
	addcc	%g1,	0x092C,	%i0
	umulcc	%i2,	0x1F14,	%g2
	udivx	%g5,	0x1F7B,	%o0
	set	0x28, %o4
	swapa	[%l7 + %o4] 0x80,	%o2
	fmovrsgez	%i1,	%f23,	%f9
	fmovsvs	%xcc,	%f17,	%f23
	sethi	0x088B,	%l4
	movle	%icc,	%l5,	%l1
	membar	0x6A
	movgu	%xcc,	%l2,	%i7
	addc	%o6,	0x106B,	%o1
	movge	%icc,	%o5,	%o7
	brgez,a	%i6,	loop_677
	edge32	%g7,	%i4,	%l6
	fmovdpos	%icc,	%f22,	%f28
	edge8ln	%l0,	%o4,	%g4
loop_677:
	fbe,a	%fcc1,	loop_678
	fmovsge	%xcc,	%f25,	%f11
	add	%l3,	0x0E3B,	%g6
	srax	%i5,	%o3,	%g3
loop_678:
	orcc	%g1,	%i0,	%i2
	srlx	%i3,	0x12,	%g5
	stx	%o0,	[%l7 + 0x38]
	sdivcc	%g2,	0x1BEC,	%o2
	movg	%xcc,	%l4,	%l5
	taddcc	%i1,	0x0811,	%l2
	stb	%i7,	[%l7 + 0x18]
	movgu	%xcc,	%o6,	%o1
	fbl,a	%fcc0,	loop_679
	fcmpes	%fcc3,	%f8,	%f9
	srlx	%l1,	%o5,	%o7
	fmovdvc	%icc,	%f26,	%f19
loop_679:
	edge16l	%i6,	%i4,	%l6
	mulx	%g7,	%o4,	%g4
	set	0x7C, %o5
	lda	[%l7 + %o5] 0x88,	%f25
	set	0x32, %o0
	ldstuba	[%l7 + %o0] 0x04,	%l0
	ldd	[%l7 + 0x78],	%g6
	movrgez	%i5,	%l3,	%g3
	nop
	setx	loop_680,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	taddcc	%g1,	%i0,	%i2
	movge	%icc,	%o3,	%i3
	tsubcc	%o0,	%g2,	%g5
loop_680:
	tle	%xcc,	0x3
	taddcctv	%o2,	%l5,	%i1
	subc	%l2,	0x0003,	%l4
	tcs	%xcc,	0x1
	and	%o6,	%o1,	%l1
	fsrc2	%f8,	%f22
	bne	loop_681
	stb	%o5,	[%l7 + 0x2A]
	fcmpne16	%f6,	%f6,	%i7
	fmovdcc	%icc,	%f23,	%f20
loop_681:
	fabsd	%f24,	%f22
	bneg	loop_682
	fmovsleu	%icc,	%f0,	%f14
	tcc	%icc,	0x1
	mulx	%o7,	0x0952,	%i6
loop_682:
	stb	%i4,	[%l7 + 0x4A]
	movcc	%xcc,	%g7,	%o4
	tleu	%icc,	0x3
	smul	%l6,	0x11DC,	%l0
	fpmerge	%f30,	%f6,	%f30
	fmovdne	%icc,	%f28,	%f21
	xnor	%g6,	0x19EE,	%g4
	bleu	%icc,	loop_683
	flush	%l7 + 0x48
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bn,pn	%icc,	loop_684
loop_683:
	fand	%f8,	%f4,	%f12
	brnz	%l3,	loop_685
	bcs,pn	%xcc,	loop_686
loop_684:
	fmovsne	%icc,	%f15,	%f29
	andcc	%g3,	0x099C,	%g1
loop_685:
	edge8	%i0,	%i5,	%o3
loop_686:
	sdivcc	%i3,	0x03F8,	%o0
	set	0x10, %o7
	stxa	%i2,	[%l7 + %o7] 0x18
	edge8	%g5,	%g2,	%l5
	nop
	set	0x78, %l2
	ldd	[%l7 + %l2],	%f30
	nop
	set	0x38, %g7
	std	%i0,	[%l7 + %g7]
	mulx	%o2,	0x08EA,	%l4
	stx	%l2,	[%l7 + 0x28]
	bcs,a	%icc,	loop_687
	fble,a	%fcc2,	loop_688
	movvs	%icc,	%o1,	%l1
	set	0x64, %g3
	stha	%o5,	[%l7 + %g3] 0x19
loop_687:
	fpadd16	%f0,	%f22,	%f4
loop_688:
	srl	%i7,	%o7,	%o6
	fpack16	%f18,	%f24
	smulcc	%i4,	%g7,	%o4
	edge32n	%l6,	%i6,	%l0
	andcc	%g6,	0x0EAF,	%g4
	fcmple32	%f30,	%f26,	%l3
	brlez,a	%g1,	loop_689
	alignaddrl	%g3,	%i5,	%i0
	edge8	%i3,	%o0,	%o3
	set	0x68, %i1
	swapa	[%l7 + %i1] 0x19,	%i2
loop_689:
	bn,a,pt	%xcc,	loop_690
	alignaddr	%g5,	%g2,	%l5
	set	0x8, %g5
	ldxa	[%g0 + %g5] 0x21,	%i1
loop_690:
	add	%o2,	0x0DB4,	%l2
	array32	%o1,	%l4,	%o5
	subc	%l1,	0x1D2F,	%o7
	fexpand	%f23,	%f0
	umulcc	%o6,	0x0A86,	%i4
	srl	%g7,	0x15,	%o4
	popc	0x1E7F,	%l6
	lduw	[%l7 + 0x0C],	%i7
	udiv	%i6,	0x1AE3,	%l0
	fbul,a	%fcc2,	loop_691
	swap	[%l7 + 0x6C],	%g4
	fmovrdgz	%l3,	%f24,	%f2
	fbg,a	%fcc2,	loop_692
loop_691:
	edge8n	%g1,	%g6,	%i5
	stw	%i0,	[%l7 + 0x2C]
	wr	%g0,	0x18,	%asi
	lduba	[%l7 + 0x74] %asi,	%i3
loop_692:
	movneg	%xcc,	%o0,	%o3
	fmul8sux16	%f0,	%f16,	%f20
	fbg	%fcc1,	loop_693
	fmovdl	%icc,	%f17,	%f5
	edge32ln	%i2,	%g3,	%g5
	move	%icc,	%g2,	%i1
loop_693:
	ta	%icc,	0x2
	movcs	%xcc,	%l5,	%o2
	fpack16	%f2,	%f2
	movrne	%l2,	0x0CE,	%l4
	sub	%o1,	%l1,	%o5
	be,a	%icc,	loop_694
	ldsw	[%l7 + 0x38],	%o7
	xor	%i4,	%o6,	%o4
	movrlez	%g7,	0x108,	%l6
loop_694:
	movrgz	%i6,	%l0,	%g4
	wr	%g0,	0x10,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	ldsh	[%l7 + 0x20],	%l3
	fmovde	%xcc,	%f28,	%f9
	fmovrde	%i7,	%f22,	%f6
	fand	%f0,	%f10,	%f22
	wr	%g0,	0x22,	%asi
	stxa	%g1,	[%l7 + 0x78] %asi
	membar	#Sync
	xnor	%i5,	%i0,	%i3
	bvc	loop_695
	edge16ln	%o0,	%o3,	%i2
	fnors	%f16,	%f2,	%f24
	movrne	%g3,	%g5,	%g2
loop_695:
	te	%xcc,	0x4
	edge32	%g6,	%l5,	%o2
	addc	%i1,	0x02F2,	%l4
	fpsub32s	%f24,	%f5,	%f4
	wr	%g0,	0x23,	%asi
	ldda	[%l7 + 0x70] %asi,	%o0
	xorcc	%l2,	0x14D7,	%o5
	movrgez	%l1,	%i4,	%o7
	movre	%o4,	%o6,	%l6
	udivcc	%i6,	0x0470,	%g7
	movg	%icc,	%l0,	%l3
	nop
	setx loop_696, %l0, %l1
	jmpl %l1, %i7
	array32	%g4,	%i5,	%i0
	nop
	set	0x28, %g4
	ldd	[%l7 + %g4],	%f26
	wr	%g0,	0x80,	%asi
	prefetcha	[%l7 + 0x78] %asi,	 0x2
loop_696:
	tcs	%xcc,	0x2
	edge16n	%i3,	%o3,	%o0
	movrgez	%i2,	%g3,	%g2
	fornot2	%f8,	%f24,	%f2
	set	0x28, %i3
	lduha	[%l7 + %i3] 0x80,	%g6
	tvc	%xcc,	0x2
	move	%icc,	%g5,	%l5
	movrlez	%i1,	0x394,	%l4
	movrlez	%o2,	0x3F6,	%o1
	bcc,a	loop_697
	fnor	%f2,	%f24,	%f24
	nop
	set	0x32, %g6
	ldsh	[%l7 + %g6],	%o5
	fmovrse	%l1,	%f28,	%f20
loop_697:
	fnot2s	%f12,	%f17
	faligndata	%f14,	%f8,	%f0
	movge	%xcc,	%i4,	%l2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xorcc	%o4,	0x14E6,	%o7
	nop
	setx loop_698, %l0, %l1
	jmpl %l1, %o6
	edge16ln	%i6,	%l6,	%g7
	movrlez	%l3,	%l0,	%g4
	set	0x5C, %i5
	stha	%i5,	[%l7 + %i5] 0x27
	membar	#Sync
loop_698:
	stx	%i7,	[%l7 + 0x68]
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16n	%g1,	%i3,	%o3
	ldd	[%l7 + 0x60],	%f2
	fmovrslz	%o0,	%f29,	%f9
	nop
	setx	loop_699,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movrlz	%i0,	0x220,	%g3
	sdiv	%g2,	0x1886,	%i2
	movne	%icc,	%g6,	%l5
loop_699:
	fbue,a	%fcc3,	loop_700
	movrlez	%g5,	%i1,	%o2
	fnands	%f31,	%f25,	%f16
	addc	%l4,	%o1,	%l1
loop_700:
	fone	%f16
	array32	%o5,	%i4,	%l2
	tsubcc	%o7,	0x101E,	%o6
	membar	0x46
	ta	%icc,	0x7
	subc	%i6,	0x1B35,	%l6
	sllx	%g7,	%l3,	%l0
	edge16l	%o4,	%i5,	%i7
	tvc	%xcc,	0x7
	movrne	%g1,	%g4,	%o3
	sdivx	%o0,	0x0F09,	%i0
	subc	%g3,	%i3,	%i2
	fnand	%f12,	%f24,	%f30
	bge,a,pn	%xcc,	loop_701
	xor	%g6,	0x0AC1,	%g2
	array8	%g5,	%l5,	%o2
	orn	%i1,	%o1,	%l4
loop_701:
	nop
	set	0x20, %l5
	ldxa	[%g0 + %l5] 0x4f,	%l1
	wr	%g0,	0x27,	%asi
	ldda	[%l7 + 0x10] %asi,	%i4
	movl	%xcc,	%l2,	%o7
	umulcc	%o6,	%o5,	%l6
	smul	%g7,	0x17C5,	%i6
	sdivcc	%l0,	0x1035,	%o4
	set	0x0C, %i4
	sta	%f10,	[%l7 + %i4] 0x11
	movg	%xcc,	%i5,	%i7
	fbuge,a	%fcc3,	loop_702
	fnand	%f22,	%f10,	%f4
	srax	%g1,	%g4,	%o3
	sll	%o0,	%l3,	%g3
loop_702:
	ldsw	[%l7 + 0x2C],	%i3
	movrgz	%i2,	%i0,	%g2
	addc	%g5,	%l5,	%g6
	fbge	%fcc3,	loop_703
	tcc	%icc,	0x7
	array16	%o2,	%i1,	%l4
	smul	%o1,	0x1785,	%i4
loop_703:
	edge16l	%l2,	%l1,	%o7
	ble,pn	%icc,	loop_704
	array8	%o5,	%o6,	%l6
	fmovrsgez	%i6,	%f11,	%f26
	smul	%g7,	0x0DEF,	%o4
loop_704:
	movvc	%xcc,	%i5,	%l0
	edge8n	%g1,	%i7,	%g4
	movgu	%icc,	%o0,	%o3
	fpackfix	%f20,	%f11
	and	%g3,	0x03E4,	%l3
	set	0x14, %i6
	ldswa	[%l7 + %i6] 0x89,	%i3
	fnands	%f14,	%f20,	%f2
	fmovsn	%xcc,	%f18,	%f8
	tcc	%icc,	0x7
	add	%i2,	%i0,	%g5
	fpadd32	%f20,	%f12,	%f28
	array8	%l5,	%g6,	%g2
	fmovrsgez	%o2,	%f16,	%f16
	orncc	%i1,	%l4,	%o1
	tneg	%icc,	0x3
	edge32ln	%i4,	%l1,	%o7
	movrne	%o5,	%o6,	%l2
	fabss	%f9,	%f22
	fcmped	%fcc0,	%f0,	%f4
	fsrc1s	%f7,	%f19
	stx	%l6,	[%l7 + 0x10]
	ldstub	[%l7 + 0x51],	%i6
	alignaddr	%o4,	%g7,	%l0
	fbu	%fcc1,	loop_705
	tvc	%icc,	0x1
	andcc	%g1,	%i7,	%i5
	bneg,pn	%icc,	loop_706
loop_705:
	alignaddrl	%g4,	%o3,	%g3
	andcc	%o0,	%l3,	%i3
	fmovdvs	%icc,	%f26,	%f0
loop_706:
	movneg	%xcc,	%i0,	%i2
	subc	%g5,	%g6,	%g2
	edge16l	%l5,	%i1,	%l4
	fmovrde	%o1,	%f6,	%f24
	fmovdg	%icc,	%f6,	%f9
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrlez	%o2,	%l1,	%o7
	edge8l	%i4,	%o6,	%o5
	fbe	%fcc2,	loop_707
	fmovdne	%icc,	%f5,	%f6
	te	%xcc,	0x4
	sll	%l6,	%i6,	%l2
loop_707:
	mulscc	%o4,	0x1B9C,	%l0
	fone	%f8
	subccc	%g1,	%i7,	%g7
	set	0x1C, %o3
	stwa	%g4,	[%l7 + %o3] 0x0c
	bneg	%xcc,	loop_708
	fbe	%fcc3,	loop_709
	smulcc	%i5,	0x0754,	%g3
	fpack32	%f20,	%f26,	%f10
loop_708:
	sir	0x02D5
loop_709:
	fbl	%fcc2,	loop_710
	bne,a	%xcc,	loop_711
	movgu	%icc,	%o3,	%o0
	array8	%i3,	%i0,	%i2
loop_710:
	fcmpne32	%f24,	%f24,	%l3
loop_711:
	sll	%g6,	0x1F,	%g2
	movne	%xcc,	%l5,	%g5
	movrlz	%l4,	%i1,	%o1
	subc	%l1,	%o2,	%i4
	bn	%icc,	loop_712
	ta	%icc,	0x2
	orncc	%o7,	0x1E38,	%o5
	add	%l7,	0x60,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] %asi,	%o6,	%i6
loop_712:
	fzero	%f2
	fbul	%fcc0,	loop_713
	xor	%l6,	%l2,	%o4
	tleu	%icc,	0x2
	fbule,a	%fcc1,	loop_714
loop_713:
	tcs	%icc,	0x6
	nop
	set	0x50, %i2
	std	%l0,	[%l7 + %i2]
	fmul8x16al	%f4,	%f18,	%f0
loop_714:
	tl	%icc,	0x0
	fcmpd	%fcc1,	%f14,	%f28
	tgu	%xcc,	0x7
	fmovscc	%xcc,	%f25,	%f5
	taddcctv	%i7,	%g7,	%g1
	umulcc	%i5,	0x1824,	%g4
	nop
	setx	loop_715,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movcc	%xcc,	%g3,	%o0
	fbu	%fcc0,	loop_716
	andn	%i3,	0x1399,	%o3
loop_715:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array8	%i0,	%i2,	%l3
loop_716:
	sub	%g6,	%l5,	%g5
	orn	%l4,	%i1,	%o1
	taddcc	%g2,	0x1E30,	%l1
	movn	%icc,	%i4,	%o2
	stw	%o5,	[%l7 + 0x54]
	fsrc1	%f8,	%f0
	bn,a	loop_717
	fmovdneg	%xcc,	%f0,	%f21
	orcc	%o6,	%o7,	%i6
	fxor	%f26,	%f20,	%f18
loop_717:
	ld	[%l7 + 0x78],	%f31
	array16	%l2,	%l6,	%o4
	fblg,a	%fcc0,	loop_718
	faligndata	%f26,	%f24,	%f10
	subc	%l0,	%g7,	%g1
	edge16l	%i7,	%g4,	%i5
loop_718:
	fxnors	%f16,	%f1,	%f1
	stb	%o0,	[%l7 + 0x79]
	taddcc	%i3,	0x00AB,	%g3
	set	0x7D, %o1
	ldstuba	[%l7 + %o1] 0x80,	%o3
	fnegd	%f10,	%f16
	set	0x28, %i0
	prefetcha	[%l7 + %i0] 0x11,	 0x0
	xnorcc	%i2,	%l3,	%l5
	edge8ln	%g5,	%l4,	%g6
	set	0x5E, %o6
	stba	%i1,	[%l7 + %o6] 0x10
	stbar
	edge32	%g2,	%o1,	%i4
	tpos	%icc,	0x1
	sdivx	%o2,	0x1D6D,	%l1
	wr	%g0,	0x18,	%asi
	ldstuba	[%l7 + 0x44] %asi,	%o6
	fmovrdgez	%o5,	%f30,	%f6
	fpadd32s	%f9,	%f28,	%f28
	fbug,a	%fcc2,	loop_719
	bn	loop_720
	mulx	%i6,	0x0DF5,	%o7
	alignaddrl	%l6,	%o4,	%l2
loop_719:
	sra	%l0,	%g7,	%g1
loop_720:
	tsubcctv	%g4,	0x120C,	%i5
	fpackfix	%f4,	%f1
	taddcc	%i7,	%o0,	%i3
	mova	%icc,	%g3,	%i0
	bvc	loop_721
	fmovdleu	%xcc,	%f29,	%f8
	fmovscc	%icc,	%f13,	%f21
	alignaddrl	%i2,	%o3,	%l3
loop_721:
	tvc	%icc,	0x7
	srlx	%g5,	%l4,	%g6
	ldstub	[%l7 + 0x24],	%i1
	addcc	%g2,	%l5,	%o1
	edge32l	%o2,	%l1,	%i4
	ldd	[%l7 + 0x70],	%f24
	srl	%o5,	%i6,	%o6
	wr	%g0,	0x04,	%asi
	ldsba	[%l7 + 0x16] %asi,	%l6
	movne	%xcc,	%o7,	%o4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovse	%xcc,	%f7,	%f14
	fnor	%f18,	%f22,	%f20
	udivx	%l2,	0x0BB6,	%g7
	movgu	%xcc,	%g1,	%g4
	add	%i5,	%l0,	%o0
	fnors	%f15,	%f28,	%f27
	tn	%icc,	0x2
	stw	%i7,	[%l7 + 0x3C]
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovs	%f13,	%f4
	ldsw	[%l7 + 0x6C],	%i3
	nop
	setx	loop_722,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	udiv	%g3,	0x1229,	%i2
	fbne	%fcc3,	loop_723
	fmovdleu	%icc,	%f30,	%f28
loop_722:
	sllx	%i0,	%o3,	%g5
	ld	[%l7 + 0x1C],	%f12
loop_723:
	fmovsvc	%xcc,	%f12,	%f12
	movneg	%xcc,	%l4,	%g6
	tsubcctv	%i1,	0x017B,	%l3
	fmovrdlz	%l5,	%f10,	%f18
	edge32	%o1,	%g2,	%l1
	sllx	%o2,	0x08,	%i4
	tne	%xcc,	0x4
	call	loop_724
	fmovdcc	%icc,	%f8,	%f4
	tpos	%xcc,	0x4
	movrgz	%i6,	%o6,	%o5
loop_724:
	fnand	%f6,	%f16,	%f2
	smul	%o7,	%o4,	%l2
	tn	%xcc,	0x7
	edge16ln	%g7,	%g1,	%g4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movneg	%xcc,	%l6,	%l0
	movgu	%icc,	%o0,	%i5
	fbl,a	%fcc1,	loop_725
	orncc	%i7,	0x0798,	%g3
	fcmpne16	%f2,	%f2,	%i2
	xnor	%i3,	%i0,	%o3
loop_725:
	edge16n	%l4,	%g6,	%i1
	addcc	%l3,	%g5,	%o1
	fmul8sux16	%f26,	%f22,	%f28
	call	loop_726
	edge8	%g2,	%l1,	%o2
	fmovrdgz	%l5,	%f26,	%f16
	mulx	%i4,	0x0501,	%o6
loop_726:
	addccc	%i6,	%o5,	%o7
	fmovrdne	%o4,	%f6,	%f14
	wr	%g0,	0x20,	%asi
	stxa	%l2,	[%g0 + 0x8] %asi
	add	%g1,	%g7,	%l6
	bneg,a	loop_727
	movl	%icc,	%l0,	%g4
	tle	%xcc,	0x7
	sub	%o0,	%i5,	%i7
loop_727:
	movgu	%icc,	%g3,	%i3
	sdiv	%i0,	0x1E63,	%o3
	popc	%i2,	%l4
	movvs	%xcc,	%i1,	%g6
	popc	0x1FF3,	%g5
	faligndata	%f8,	%f20,	%f24
	tvc	%icc,	0x6
	array8	%o1,	%g2,	%l3
	stbar
	edge32ln	%l1,	%o2,	%i4
	wr	%g0,	0x89,	%asi
	ldsba	[%l7 + 0x09] %asi,	%o6
	umulcc	%i6,	%o5,	%o7
	fnor	%f12,	%f4,	%f2
	srlx	%o4,	%l2,	%g1
	fmovde	%xcc,	%f15,	%f3
	membar	#Sync
	set	0x40, %o2
	ldda	[%l7 + %o2] 0x1f,	%f16
	movneg	%xcc,	%l5,	%g7
	wr	%g0,	0x80,	%asi
	ldswa	[%l7 + 0x14] %asi,	%l6
	movrgz	%g4,	0x22F,	%o0
	edge16l	%l0,	%i5,	%i7
	movleu	%icc,	%i3,	%i0
	andncc	%o3,	%g3,	%l4
	addccc	%i2,	%i1,	%g6
	fmovdvs	%icc,	%f11,	%f31
	movrne	%g5,	%o1,	%g2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32l	%l3,	%o2,	%l1
	edge16l	%i4,	%i6,	%o6
	fandnot2s	%f25,	%f17,	%f4
	stb	%o7,	[%l7 + 0x16]
	fnand	%f8,	%f6,	%f6
	tcc	%icc,	0x4
	set	0x38, %l6
	lduha	[%l7 + %l6] 0x89,	%o4
	orn	%o5,	0x0827,	%l2
	bneg,a	%icc,	loop_728
	fmovsneg	%icc,	%f20,	%f4
	array16	%g1,	%l5,	%l6
	andncc	%g4,	%g7,	%l0
loop_728:
	sll	%i5,	%o0,	%i3
	subccc	%i7,	0x1ADB,	%o3
	tvc	%icc,	0x0
	add	%l7,	0x2C,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%i0
	casa	[%l6] %asi,	%i0,	%g3
	ldsw	[%l7 + 0x2C],	%l4
	umul	%i1,	%g6,	%g5
	fmul8x16al	%f1,	%f13,	%f24
	tcc	%xcc,	0x0
	edge8ln	%i2,	%g2,	%l3
	fpadd16	%f20,	%f24,	%f2
	movrgez	%o1,	0x288,	%l1
	ta	%xcc,	0x3
	fmovdvc	%xcc,	%f15,	%f22
	movvc	%icc,	%o2,	%i4
	bneg,pn	%icc,	loop_729
	tg	%xcc,	0x6
	tn	%icc,	0x7
	edge16n	%i6,	%o6,	%o4
loop_729:
	srl	%o7,	%o5,	%g1
	sdiv	%l2,	0x0624,	%l6
	fmovrse	%g4,	%f20,	%f9
	set	0x40, %l0
	ldda	[%l7 + %l0] 0x04,	%f16
	set	0x40, %l4
	ldda	[%l7 + %l4] 0x2b,	%g6
	array16	%l5,	%i5,	%l0
	orn	%i3,	0x13A2,	%i7
	tvc	%icc,	0x2
	movg	%icc,	%o0,	%i0
	xnor	%g3,	0x1736,	%o3
	addcc	%i1,	0x0E89,	%g6
	wr	%g0,	0x81,	%asi
	ldsba	[%l7 + 0x0F] %asi,	%g5
	set	0x63, %g2
	lduba	[%l7 + %g2] 0x89,	%l4
	movpos	%icc,	%i2,	%g2
	orncc	%o1,	0x0C07,	%l3
	subccc	%l1,	%o2,	%i4
	mova	%icc,	%o6,	%o4
	subccc	%o7,	%o5,	%i6
	nop
	setx loop_730, %l0, %l1
	jmpl %l1, %g1
	sllx	%l6,	%l2,	%g7
	wr	%g0,	0x0c,	%asi
	ldstuba	[%l7 + 0x16] %asi,	%l5
loop_730:
	movl	%xcc,	%i5,	%g4
	subcc	%l0,	%i3,	%o0
	xor	%i0,	%g3,	%i7
	fmovd	%f8,	%f28
	srl	%o3,	0x1E,	%i1
	xnor	%g5,	%g6,	%l4
	orn	%i2,	%g2,	%l3
	ta	%xcc,	0x6
	taddcctv	%o1,	0x1034,	%l1
	fmovrdlz	%o2,	%f2,	%f10
	alignaddrl	%i4,	%o6,	%o7
	movcs	%xcc,	%o5,	%i6
	nop
	set	0x38, %l3
	stx	%o4,	[%l7 + %l3]
	mova	%xcc,	%g1,	%l6
	sdivcc	%g7,	0x19E9,	%l5
	andcc	%i5,	%l2,	%g4
	tl	%icc,	0x7
	mulx	%l0,	0x0DA3,	%o0
	fandnot2s	%f27,	%f13,	%f9
	andcc	%i3,	0x1D52,	%g3
	movrgz	%i0,	0x309,	%o3
	fexpand	%f29,	%f14
	xnorcc	%i7,	%i1,	%g6
	movg	%xcc,	%l4,	%g5
	array8	%g2,	%i2,	%l3
	wr	%g0,	0x04,	%asi
	stba	%l1,	[%l7 + 0x27] %asi
	edge16	%o2,	%o1,	%i4
	array8	%o7,	%o6,	%o5
	std	%i6,	[%l7 + 0x48]
	fmovdcc	%icc,	%f19,	%f1
	movrne	%o4,	%l6,	%g1
	mulscc	%g7,	%i5,	%l2
	andn	%l5,	0x1BC6,	%l0
	edge8l	%g4,	%o0,	%g3
	fmul8x16au	%f2,	%f11,	%f30
	sra	%i3,	0x16,	%i0
	fpmerge	%f25,	%f19,	%f16
	ta	%icc,	0x0
	brz	%o3,	loop_731
	edge32l	%i1,	%g6,	%l4
	xorcc	%g5,	0x0971,	%g2
	siam	0x5
loop_731:
	bvs,pn	%icc,	loop_732
	tcc	%icc,	0x6
	std	%i6,	[%l7 + 0x78]
	bvs,a,pt	%icc,	loop_733
loop_732:
	movleu	%xcc,	%l3,	%i2
	movge	%icc,	%o2,	%o1
	fbl,a	%fcc0,	loop_734
loop_733:
	fmovscs	%icc,	%f6,	%f14
	edge16ln	%l1,	%o7,	%o6
	addccc	%o5,	%i4,	%i6
loop_734:
	tge	%icc,	0x6
	brlz,a	%o4,	loop_735
	tcc	%icc,	0x5
	array32	%g1,	%l6,	%i5
	ta	%xcc,	0x5
loop_735:
	movne	%xcc,	%l2,	%l5
	sll	%l0,	%g4,	%o0
	sdivx	%g3,	0x0A26,	%i3
	brnz,a	%i0,	loop_736
	orncc	%o3,	%g7,	%i1
	tn	%xcc,	0x2
	nop
	setx	loop_737,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_736:
	fpadd32	%f22,	%f2,	%f18
	movpos	%icc,	%l4,	%g6
	fandnot1s	%f6,	%f21,	%f31
loop_737:
	swap	[%l7 + 0x60],	%g2
	fpsub16	%f24,	%f30,	%f16
	fnegs	%f9,	%f8
	fpack32	%f14,	%f0,	%f22
	andn	%i7,	%g5,	%l3
	movvs	%icc,	%o2,	%i2
	addcc	%l1,	%o1,	%o6
	edge8l	%o7,	%o5,	%i6
	sdivx	%i4,	0x1EF6,	%o4
	movrgez	%l6,	0x2CF,	%g1
	tpos	%xcc,	0x1
	movrgez	%l2,	%l5,	%l0
	edge16l	%i5,	%g4,	%g3
	fpsub16s	%f13,	%f21,	%f26
	fpackfix	%f30,	%f0
	movrlz	%o0,	%i3,	%i0
	smul	%o3,	0x187B,	%i1
	edge16n	%g7,	%l4,	%g2
	fpadd16	%f8,	%f6,	%f12
	orcc	%g6,	0x1E3A,	%i7
	movge	%icc,	%l3,	%o2
	fornot1	%f12,	%f6,	%f10
	st	%f2,	[%l7 + 0x24]
	lduw	[%l7 + 0x10],	%i2
	fmovdneg	%xcc,	%f15,	%f0
	movrgz	%g5,	%l1,	%o6
	movpos	%icc,	%o7,	%o5
	xnorcc	%i6,	0x1F17,	%i4
	bvs,pn	%icc,	loop_738
	ldd	[%l7 + 0x08],	%f16
	fsrc2	%f4,	%f6
	edge32ln	%o1,	%l6,	%g1
loop_738:
	ta	%icc,	0x6
	tn	%icc,	0x0
	addc	%o4,	0x03CE,	%l5
	popc	%l2,	%l0
	srlx	%i5,	0x10,	%g4
	fmovdne	%icc,	%f31,	%f24
	movrne	%o0,	0x14C,	%i3
	array8	%i0,	%g3,	%i1
	fcmpd	%fcc3,	%f26,	%f0
	fmovrdne	%o3,	%f10,	%f14
	array32	%l4,	%g7,	%g6
	edge16l	%i7,	%g2,	%l3
	fmovsg	%xcc,	%f17,	%f9
	fpadd32	%f18,	%f10,	%f30
	stbar
	fbuge,a	%fcc3,	loop_739
	ba,a	loop_740
	fmovdne	%xcc,	%f24,	%f25
	edge32ln	%i2,	%g5,	%l1
loop_739:
	movrlz	%o6,	0x066,	%o2
loop_740:
	smulcc	%o5,	%o7,	%i4
	xnorcc	%i6,	%l6,	%o1
	std	%g0,	[%l7 + 0x40]
	edge8ln	%o4,	%l2,	%l5
	fbo,a	%fcc1,	loop_741
	fmovdge	%icc,	%f30,	%f10
	edge32ln	%i5,	%g4,	%o0
	ldsh	[%l7 + 0x2E],	%l0
loop_741:
	andn	%i0,	%i3,	%g3
	smul	%o3,	0x0C53,	%l4
	addccc	%g7,	0x1533,	%g6
	bne,a	%xcc,	loop_742
	array32	%i7,	%i1,	%l3
	stx	%i2,	[%l7 + 0x18]
	array8	%g5,	%l1,	%o6
loop_742:
	tcc	%xcc,	0x0
	sdiv	%o2,	0x05D1,	%o5
	ldstub	[%l7 + 0x61],	%g2
	umul	%i4,	0x1428,	%i6
	fmovde	%icc,	%f15,	%f21
	brgz,a	%o7,	loop_743
	tle	%xcc,	0x2
	tneg	%icc,	0x1
	movn	%xcc,	%l6,	%o1
loop_743:
	fabsd	%f2,	%f18
	fmovdn	%icc,	%f28,	%f12
	fmul8ulx16	%f2,	%f28,	%f2
	ldsw	[%l7 + 0x4C],	%o4
	fornot2	%f8,	%f28,	%f26
	ba,a,pn	%xcc,	loop_744
	sethi	0x090F,	%l2
	array8	%g1,	%i5,	%g4
	siam	0x2
loop_744:
	fmovdcs	%xcc,	%f13,	%f1
	andncc	%o0,	%l5,	%i0
	srlx	%i3,	%g3,	%l0
	bgu,pn	%icc,	loop_745
	fpack16	%f20,	%f9
	fbul,a	%fcc0,	loop_746
	sethi	0x1CB9,	%o3
loop_745:
	fmovsne	%xcc,	%f22,	%f31
	edge8l	%l4,	%g7,	%i7
loop_746:
	fcmpeq16	%f18,	%f30,	%g6
	movpos	%xcc,	%i1,	%l3
	subc	%g5,	%l1,	%i2
	fmovrdlez	%o6,	%f12,	%f30
	sdiv	%o2,	0x1BE4,	%g2
	ba,a,pt	%icc,	loop_747
	fbl	%fcc2,	loop_748
	flush	%l7 + 0x20
	wr	%g0,	0x04,	%asi
	lduha	[%l7 + 0x5C] %asi,	%i4
loop_747:
	andcc	%o5,	%i6,	%l6
loop_748:
	bcc,pt	%xcc,	loop_749
	fmovdneg	%xcc,	%f29,	%f12
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fxnor	%f2,	%f12,	%f14
loop_749:
	fmovsvs	%icc,	%f13,	%f26
	fmovsa	%xcc,	%f11,	%f22
	membar	0x7A
	fpsub16s	%f4,	%f2,	%f7
	fmovde	%xcc,	%f18,	%f17
	move	%xcc,	%o1,	%o4
	movvs	%icc,	%o7,	%g1
	taddcc	%l2,	0x1049,	%g4
	fmul8sux16	%f0,	%f28,	%f12
	wr	%g0,	0x81,	%asi
	ldxa	[%l7 + 0x48] %asi,	%o0
	fba	%fcc2,	loop_750
	fnot1	%f22,	%f8
	fbuge	%fcc2,	loop_751
	movneg	%icc,	%l5,	%i0
loop_750:
	edge16l	%i5,	%g3,	%l0
	movne	%xcc,	%i3,	%o3
loop_751:
	subcc	%g7,	%i7,	%g6
	movle	%icc,	%l4,	%i1
	ta	%xcc,	0x5
	subc	%l3,	%g5,	%l1
	ta	%icc,	0x2
	set	0x36, %i7
	stba	%o6,	[%l7 + %i7] 0xea
	membar	#Sync
	or	%o2,	%g2,	%i4
	addccc	%o5,	0x0116,	%i6
	alignaddr	%l6,	%i2,	%o4
	fbl,a	%fcc0,	loop_752
	brgez,a	%o1,	loop_753
	umulcc	%g1,	%o7,	%l2
	te	%xcc,	0x6
loop_752:
	popc	%o0,	%g4
loop_753:
	nop
	wr	%g0,	0x20,	%asi
	stxa	%l5,	[%g0 + 0x28] %asi
	flush	%l7 + 0x5C
	fbue,a	%fcc2,	loop_754
	movrlz	%i5,	%g3,	%l0
	array32	%i0,	%o3,	%g7
	bge,a	%xcc,	loop_755
loop_754:
	fandnot2s	%f29,	%f27,	%f30
	tneg	%icc,	0x2
	membar	0x74
loop_755:
	fbg,a	%fcc3,	loop_756
	fnand	%f8,	%f22,	%f20
	movne	%icc,	%i7,	%i3
	sub	%g6,	%l4,	%l3
loop_756:
	movrgz	%g5,	0x213,	%i1
	andncc	%o6,	%l1,	%g2
	bcs	loop_757
	umulcc	%i4,	%o5,	%o2
	fmovspos	%icc,	%f31,	%f17
	movvc	%icc,	%i6,	%l6
loop_757:
	fmovrse	%i2,	%f31,	%f14
	fmovrdlz	%o4,	%f12,	%f0
	udivcc	%o1,	0x10BE,	%o7
	fmuld8sux16	%f11,	%f10,	%f10
	fmovrdgez	%l2,	%f0,	%f4
	subcc	%g1,	0x15CE,	%g4
	fmovdvs	%xcc,	%f19,	%f7
	nop
	set	0x7F, %g1
	ldub	[%l7 + %g1],	%l5
	array8	%o0,	%i5,	%l0
	udiv	%i0,	0x0F39,	%o3
	set	0x28, %l1
	prefetcha	[%l7 + %l1] 0x80,	 0x1
	tl	%icc,	0x4
	siam	0x0
	tne	%xcc,	0x5
	set	0x40, %o4
	stda	%f0,	[%l7 + %o4] 0xf9
	membar	#Sync
	array8	%i7,	%g3,	%g6
	movrgez	%l4,	%i3,	%g5
	tneg	%xcc,	0x4
	fmovsvs	%icc,	%f15,	%f25
	fornot1s	%f1,	%f11,	%f12
	alignaddrl	%i1,	%o6,	%l3
	addc	%g2,	%i4,	%o5
	stb	%o2,	[%l7 + 0x0B]
	srl	%l1,	0x14,	%l6
	srax	%i6,	0x1C,	%o4
	lduw	[%l7 + 0x6C],	%i2
	set	0x54, %o0
	lda	[%l7 + %o0] 0x19,	%f29
	andcc	%o1,	%l2,	%g1
	mova	%xcc,	%o7,	%g4
	edge16	%o0,	%l5,	%i5
	tpos	%xcc,	0x6
	andn	%l0,	%o3,	%i0
	popc	%g7,	%g3
	tcc	%xcc,	0x0
	sdivx	%g6,	0x18D5,	%l4
	fpmerge	%f6,	%f10,	%f22
	lduw	[%l7 + 0x5C],	%i3
	orcc	%i7,	0x0ED6,	%g5
	tle	%xcc,	0x6
	fabss	%f11,	%f15
	fmovsvc	%icc,	%f7,	%f6
	sdivcc	%o6,	0x015F,	%l3
	movneg	%icc,	%g2,	%i1
	set	0x0F, %o5
	ldsba	[%l7 + %o5] 0x19,	%i4
	bne	loop_758
	xor	%o2,	0x02D9,	%o5
	fmovs	%f4,	%f2
	popc	%l1,	%i6
loop_758:
	fornot1	%f26,	%f24,	%f22
	srlx	%o4,	%i2,	%l6
	sra	%o1,	%l2,	%g1
	movrne	%g4,	0x394,	%o7
	orncc	%o0,	0x061A,	%i5
	tle	%icc,	0x7
	bg,pn	%icc,	loop_759
	umul	%l0,	%l5,	%i0
	smulcc	%g7,	0x085E,	%o3
	ldub	[%l7 + 0x56],	%g3
loop_759:
	movvs	%xcc,	%g6,	%l4
	sdivcc	%i3,	0x1F87,	%g5
	array16	%o6,	%i7,	%g2
	fmovrsgez	%l3,	%f4,	%f14
	udivx	%i1,	0x0FD3,	%i4
	fors	%f16,	%f12,	%f6
	fpmerge	%f23,	%f14,	%f30
	edge32n	%o5,	%l1,	%i6
	wr	%g0,	0x89,	%asi
	stba	%o2,	[%l7 + 0x21] %asi
	fsrc1	%f12,	%f28
	movleu	%xcc,	%i2,	%l6
	udiv	%o1,	0x00BE,	%o4
	fsrc2s	%f29,	%f19
	orncc	%l2,	%g4,	%g1
	movrlez	%o7,	0x3A6,	%o0
	set	0x10, %o7
	prefetcha	[%l7 + %o7] 0x15,	 0x3
	xorcc	%l0,	0x1702,	%i0
	ldd	[%l7 + 0x08],	%f8
	fbuge	%fcc3,	loop_760
	movle	%xcc,	%l5,	%g7
	andcc	%g3,	%o3,	%g6
	wr	%g0,	0x19,	%asi
	lduha	[%l7 + 0x32] %asi,	%i3
loop_760:
	fpadd32s	%f29,	%f5,	%f31
	fpsub16s	%f17,	%f19,	%f24
	fmovrslez	%l4,	%f27,	%f26
	andncc	%o6,	%i7,	%g5
	set	0x40, %g7
	stda	%f0,	[%l7 + %g7] 0x19
	fcmped	%fcc3,	%f4,	%f20
	tne	%xcc,	0x7
	movrne	%g2,	0x1C8,	%i1
	swap	[%l7 + 0x10],	%l3
	addccc	%o5,	0x1585,	%i4
	set	0x44, %l2
	ldsha	[%l7 + %l2] 0x0c,	%i6
	orcc	%o2,	0x0950,	%l1
	addc	%l6,	0x072D,	%o1
	mulx	%i2,	%o4,	%l2
	membar	0x0C
	fba	%fcc1,	loop_761
	addccc	%g4,	0x0A7B,	%g1
	fbne	%fcc0,	loop_762
	mulscc	%o7,	%i5,	%l0
loop_761:
	sub	%i0,	0x1F24,	%l5
	fandnot2s	%f20,	%f25,	%f18
loop_762:
	tcc	%icc,	0x0
	bvc,a,pn	%icc,	loop_763
	umulcc	%g7,	0x00B9,	%o0
	tl	%icc,	0x4
	fmovrsgez	%o3,	%f27,	%f13
loop_763:
	ta	%icc,	0x5
	andn	%g3,	0x19E2,	%g6
	andcc	%l4,	%o6,	%i3
	fmovdvs	%xcc,	%f30,	%f5
	mova	%xcc,	%g5,	%i7
	wr	%g0,	0x10,	%asi
	lduwa	[%l7 + 0x6C] %asi,	%i1
	fcmple32	%f20,	%f30,	%g2
	movle	%icc,	%o5,	%i4
	fbug,a	%fcc0,	loop_764
	for	%f0,	%f20,	%f2
	fbue,a	%fcc0,	loop_765
	movcs	%icc,	%l3,	%o2
loop_764:
	fmovrdlz	%i6,	%f4,	%f20
	xor	%l1,	0x0317,	%o1
loop_765:
	udivx	%l6,	0x1028,	%o4
	sdivcc	%l2,	0x14C4,	%i2
	movg	%xcc,	%g4,	%g1
	ldsh	[%l7 + 0x54],	%i5
	bn,pn	%icc,	loop_766
	andn	%l0,	0x15B2,	%i0
	bvs,a,pt	%xcc,	loop_767
	sdivx	%o7,	0x10C8,	%g7
loop_766:
	movvc	%icc,	%o0,	%o3
	tne	%icc,	0x6
loop_767:
	fmovrdne	%l5,	%f4,	%f22
	fble	%fcc3,	loop_768
	fbu,a	%fcc3,	loop_769
	sdiv	%g3,	0x0792,	%l4
	fmovrdgez	%o6,	%f20,	%f12
loop_768:
	fbl,a	%fcc0,	loop_770
loop_769:
	movneg	%xcc,	%g6,	%i3
	fmovd	%f6,	%f16
	fnand	%f10,	%f26,	%f2
loop_770:
	mova	%icc,	%i7,	%i1
	membar	#Sync
	wr	%g0,	0xf1,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	srl	%g2,	0x09,	%g5
	alignaddrl	%i4,	%l3,	%o5
	stb	%o2,	[%l7 + 0x7A]
	subc	%l1,	%i6,	%o1
	fpsub16	%f22,	%f18,	%f20
	edge32l	%o4,	%l6,	%i2
	ldsh	[%l7 + 0x4A],	%l2
	nop
	setx loop_771, %l0, %l1
	jmpl %l1, %g4
	movre	%i5,	%l0,	%g1
	wr	%g0,	0x88,	%asi
	ldswa	[%l7 + 0x40] %asi,	%o7
loop_771:
	fpadd32s	%f2,	%f10,	%f7
	add	%l7,	0x5C,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] %asi,	%i0,	%g7
	lduw	[%l7 + 0x1C],	%o3
	fornot2	%f20,	%f8,	%f10
	srl	%o0,	%g3,	%l4
	orn	%o6,	0x1506,	%l5
	fsrc2s	%f28,	%f5
	andcc	%g6,	0x0013,	%i7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xor	%i3,	0x09DC,	%i1
	tle	%icc,	0x1
	sub	%g2,	%i4,	%g5
	set	0x40, %g3
	ldda	[%l7 + %g3] 0x2f,	%l2
	subcc	%o5,	0x182F,	%o2
	tsubcctv	%l1,	0x0ED5,	%i6
	fzeros	%f21
	bne,a,pn	%icc,	loop_772
	udiv	%o1,	0x0077,	%l6
	sub	%i2,	%l2,	%o4
	mova	%icc,	%g4,	%l0
loop_772:
	addccc	%i5,	0x1F7F,	%g1
	fnot1	%f16,	%f18
	wr	%g0,	0xea,	%asi
	stxa	%i0,	[%l7 + 0x20] %asi
	membar	#Sync
	stx	%o7,	[%l7 + 0x58]
	sra	%g7,	%o0,	%o3
	movle	%xcc,	%l4,	%o6
	fmovdneg	%icc,	%f23,	%f25
	fpsub16	%f30,	%f24,	%f24
	array32	%l5,	%g3,	%i7
	srax	%i3,	%g6,	%g2
	and	%i4,	0x1BC2,	%i1
	fmovrsne	%l3,	%f15,	%f2
	fmovsge	%xcc,	%f3,	%f4
	tne	%icc,	0x5
	and	%g5,	0x1F76,	%o2
	movge	%icc,	%o5,	%l1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	prefetch	[%l7 + 0x48],	 0x0
	fandnot2s	%f15,	%f5,	%f12
	fmovscc	%xcc,	%f24,	%f12
	subc	%o1,	0x19E8,	%i6
	smulcc	%i2,	%l2,	%l6
	fmovde	%icc,	%f18,	%f4
	edge8	%o4,	%l0,	%i5
	ldstub	[%l7 + 0x0F],	%g4
	edge32n	%g1,	%o7,	%i0
	popc	0x0883,	%o0
	move	%icc,	%g7,	%l4
	fbu	%fcc2,	loop_773
	tn	%icc,	0x3
	addc	%o6,	%l5,	%g3
	andncc	%o3,	%i3,	%i7
loop_773:
	move	%icc,	%g6,	%i4
	movrgz	%i1,	%g2,	%g5
	or	%l3,	0x1355,	%o2
	fornot1	%f10,	%f0,	%f10
	fmovdne	%icc,	%f1,	%f30
	sra	%l1,	%o5,	%o1
	membar	0x54
	fornot1s	%f10,	%f22,	%f29
	movre	%i2,	%l2,	%i6
	alignaddr	%l6,	%l0,	%i5
	bshuffle	%f6,	%f0,	%f10
	tvs	%xcc,	0x4
	prefetch	[%l7 + 0x54],	 0x2
	addccc	%g4,	0x18EA,	%g1
	edge8n	%o7,	%o4,	%o0
	sub	%i0,	%l4,	%o6
	wr	%g0,	0x24,	%asi
	ldda	[%l7 + 0x70] %asi,	%l4
	edge16n	%g3,	%g7,	%o3
	movvs	%xcc,	%i7,	%i3
	fbge	%fcc0,	loop_774
	sdiv	%i4,	0x100E,	%i1
	movleu	%xcc,	%g6,	%g2
	sll	%g5,	0x0C,	%o2
loop_774:
	tcs	%icc,	0x5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrgz	%l1,	0x116,	%l3
	movvs	%icc,	%o5,	%i2
	taddcctv	%o1,	0x0F31,	%l2
	mulscc	%l6,	0x17A2,	%l0
	fpackfix	%f0,	%f3
	sir	0x0307
	array16	%i5,	%i6,	%g1
	fmovs	%f8,	%f25
	move	%xcc,	%o7,	%g4
	fmovs	%f15,	%f15
	mulx	%o4,	%i0,	%l4
	sll	%o6,	0x05,	%o0
	fcmpne16	%f24,	%f4,	%g3
	xor	%g7,	0x01C4,	%l5
	flush	%l7 + 0x1C
	tsubcc	%o3,	0x117D,	%i7
	stw	%i4,	[%l7 + 0x70]
	set	0x24, %g5
	swapa	[%l7 + %g5] 0x18,	%i1
	wr	%g0,	0x89,	%asi
	lduba	[%l7 + 0x66] %asi,	%i3
	movn	%xcc,	%g2,	%g5
	fbne	%fcc2,	loop_775
	sdivx	%g6,	0x142F,	%o2
	movg	%icc,	%l1,	%l3
	fbe,a	%fcc0,	loop_776
loop_775:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsn	%icc,	%f9,	%f11
	edge32ln	%i2,	%o1,	%l2
loop_776:
	addccc	%l6,	%l0,	%o5
	fbl,a	%fcc3,	loop_777
	fmul8x16	%f18,	%f28,	%f2
	sir	0x1FF1
	fbo	%fcc3,	loop_778
loop_777:
	movge	%icc,	%i6,	%g1
	sll	%i5,	%g4,	%o4
	orn	%o7,	0x0234,	%l4
loop_778:
	fpadd32s	%f11,	%f9,	%f10
	movre	%o6,	%o0,	%g3
	set	0x28, %i1
	sta	%f26,	[%l7 + %i1] 0x11
	wr	%g0,	0x80,	%asi
	stwa	%i0,	[%l7 + 0x28] %asi
	subccc	%g7,	%l5,	%o3
	movgu	%xcc,	%i4,	%i7
	wr	%g0,	0x81,	%asi
	ldswa	[%l7 + 0x74] %asi,	%i1
	fpadd32	%f0,	%f30,	%f18
	edge16ln	%g2,	%g5,	%i3
	srl	%g6,	%o2,	%l3
	edge32l	%l1,	%i2,	%o1
	sdiv	%l6,	0x03C3,	%l2
	fcmpd	%fcc1,	%f0,	%f16
	fbule	%fcc3,	loop_779
	array8	%l0,	%o5,	%i6
	sethi	0x0919,	%i5
	movvc	%icc,	%g1,	%o4
loop_779:
	tl	%icc,	0x2
	fmovse	%icc,	%f4,	%f19
	membar	0x1A
	fpadd32	%f26,	%f12,	%f26
	fbule	%fcc3,	loop_780
	stx	%o7,	[%l7 + 0x60]
	movre	%g4,	%o6,	%o0
	movl	%icc,	%l4,	%g3
loop_780:
	fble	%fcc3,	loop_781
	bneg,a,pn	%icc,	loop_782
	movle	%icc,	%g7,	%l5
	edge8l	%o3,	%i0,	%i7
loop_781:
	fbu,a	%fcc2,	loop_783
loop_782:
	tge	%xcc,	0x1
	addc	%i1,	0x0003,	%i4
	fbne	%fcc0,	loop_784
loop_783:
	xorcc	%g5,	%g2,	%g6
	wr	%g0,	0x04,	%asi
	lda	[%l7 + 0x7C] %asi,	%f15
loop_784:
	srlx	%i3,	0x15,	%l3
	udivx	%o2,	0x1F66,	%l1
	set	0x30, %g4
	ldda	[%l7 + %g4] 0x11,	%o0
	fmul8x16al	%f0,	%f27,	%f4
	smul	%i2,	%l6,	%l0
	fmovsneg	%icc,	%f22,	%f25
	orcc	%o5,	%l2,	%i5
	fmovdcs	%xcc,	%f5,	%f6
	edge32n	%g1,	%i6,	%o7
	movg	%xcc,	%g4,	%o4
	set	0x4B, %g6
	ldsba	[%l7 + %g6] 0x11,	%o0
	fbug	%fcc1,	loop_785
	movgu	%xcc,	%l4,	%o6
	edge16l	%g3,	%g7,	%l5
	addcc	%o3,	0x0B21,	%i7
loop_785:
	fmul8x16al	%f8,	%f4,	%f14
	fcmpgt16	%f20,	%f2,	%i0
	fmul8ulx16	%f12,	%f6,	%f4
	fbuge,a	%fcc3,	loop_786
	fbul,a	%fcc0,	loop_787
	movpos	%icc,	%i1,	%g5
	array32	%i4,	%g2,	%g6
loop_786:
	sll	%l3,	0x16,	%i3
loop_787:
	fpack16	%f10,	%f12
	sll	%o2,	0x1E,	%o1
	fnot1s	%f8,	%f26
	movvc	%xcc,	%l1,	%l6
	ble,pn	%xcc,	loop_788
	movgu	%icc,	%i2,	%o5
	udivx	%l2,	0x11BA,	%l0
	movl	%xcc,	%g1,	%i6
loop_788:
	movle	%xcc,	%i5,	%o7
	fcmpes	%fcc2,	%f21,	%f18
	tsubcctv	%g4,	0x0D9A,	%o4
	fmovsvs	%icc,	%f6,	%f7
	brz	%l4,	loop_789
	edge32l	%o6,	%g3,	%g7
	fzeros	%f27
	fbo	%fcc3,	loop_790
loop_789:
	movre	%o0,	%l5,	%o3
	subccc	%i7,	%i0,	%i1
	fmovrsne	%g5,	%f7,	%f29
loop_790:
	fpack16	%f6,	%f12
	smul	%g2,	%g6,	%l3
	movne	%xcc,	%i3,	%o2
	te	%icc,	0x5
	wr	%g0,	0x04,	%asi
	lduba	[%l7 + 0x53] %asi,	%i4
	fmovrdgz	%o1,	%f14,	%f10
	srl	%l1,	0x1A,	%i2
	fcmple32	%f24,	%f28,	%l6
	array32	%l2,	%l0,	%o5
	edge32ln	%g1,	%i5,	%i6
	movcs	%icc,	%o7,	%o4
	bcc,a	loop_791
	fcmple16	%f0,	%f18,	%g4
	srax	%l4,	%g3,	%o6
	tle	%xcc,	0x2
loop_791:
	bcs,a,pt	%xcc,	loop_792
	andcc	%o0,	%g7,	%o3
	addccc	%i7,	%l5,	%i1
	fbule	%fcc3,	loop_793
loop_792:
	tsubcctv	%g5,	0x1C15,	%i0
	addccc	%g2,	%l3,	%g6
	andncc	%i3,	%o2,	%o1
loop_793:
	udivx	%i4,	0x012D,	%i2
	sra	%l1,	0x1B,	%l6
	fmovsl	%icc,	%f29,	%f15
	fmovs	%f16,	%f25
	fnegs	%f23,	%f18
	movrlez	%l0,	0x080,	%o5
	mova	%icc,	%l2,	%g1
	movcs	%xcc,	%i5,	%i6
	fbge,a	%fcc1,	loop_794
	fones	%f0
	sdiv	%o4,	0x0030,	%g4
	bn	loop_795
loop_794:
	flush	%l7 + 0x14
	movleu	%icc,	%o7,	%g3
	sdiv	%l4,	0x08FF,	%o0
loop_795:
	tcs	%xcc,	0x3
	fbule	%fcc3,	loop_796
	movne	%icc,	%g7,	%o6
	movge	%icc,	%i7,	%o3
	fnand	%f14,	%f16,	%f4
loop_796:
	fornot1	%f18,	%f24,	%f30
	fblg	%fcc3,	loop_797
	fnot2s	%f7,	%f27
	orn	%i1,	0x04FB,	%g5
	fpack32	%f14,	%f10,	%f6
loop_797:
	tge	%icc,	0x3
	te	%xcc,	0x1
	tcs	%xcc,	0x1
	edge8	%i0,	%l5,	%g2
	tle	%icc,	0x0
	alignaddrl	%g6,	%l3,	%o2
	fmuld8ulx16	%f3,	%f8,	%f20
	movcc	%icc,	%o1,	%i3
	orncc	%i2,	%i4,	%l6
	fmovdvc	%xcc,	%f8,	%f12
	fmovrdgez	%l0,	%f12,	%f2
	fmuld8sux16	%f23,	%f4,	%f18
	xor	%l1,	%o5,	%g1
	fmul8x16	%f5,	%f2,	%f10
	xor	%i5,	0x071C,	%i6
	tgu	%xcc,	0x1
	wr	%g0,	0xe3,	%asi
	stha	%o4,	[%l7 + 0x7E] %asi
	membar	#Sync
	movle	%xcc,	%l2,	%g4
	brgez	%o7,	loop_798
	fmovrdlez	%l4,	%f20,	%f30
	fbn	%fcc2,	loop_799
	brgz	%o0,	loop_800
loop_798:
	fnegd	%f22,	%f24
	srl	%g7,	%g3,	%o6
loop_799:
	add	%o3,	0x13B2,	%i7
loop_800:
	fmovdle	%xcc,	%f3,	%f19
	addc	%g5,	0x17B9,	%i0
	fmovdleu	%xcc,	%f0,	%f4
	tg	%icc,	0x7
	movle	%xcc,	%i1,	%g2
	movre	%l5,	%g6,	%l3
	brgez	%o2,	loop_801
	fpsub32s	%f5,	%f9,	%f21
	movleu	%icc,	%i3,	%o1
	bpos,a	%icc,	loop_802
loop_801:
	fmuld8sux16	%f25,	%f16,	%f14
	udiv	%i4,	0x107B,	%i2
	movleu	%icc,	%l6,	%l0
loop_802:
	andncc	%l1,	%g1,	%o5
	tpos	%icc,	0x0
	fbne	%fcc1,	loop_803
	edge32	%i6,	%i5,	%l2
	movcc	%icc,	%o4,	%g4
	tcs	%icc,	0x4
loop_803:
	srl	%l4,	%o7,	%g7
	movre	%o0,	0x2A1,	%o6
	tsubcc	%o3,	%i7,	%g5
	add	%l7,	0x30,	%l6
	wr	%g0,	0x18,	%asi
	ldxa	[%l6] %asi,	%i0
	casxa	[%l6] 0x18,	%i0,	%g3
	edge8	%g2,	%l5,	%g6
	srlx	%i1,	0x1D,	%o2
	lduw	[%l7 + 0x40],	%l3
	stx	%i3,	[%l7 + 0x60]
	xorcc	%o1,	0x06AD,	%i2
	tcs	%xcc,	0x3
	fba,a	%fcc1,	loop_804
	sub	%l6,	%l0,	%l1
	brlez,a	%i4,	loop_805
	movvs	%xcc,	%o5,	%g1
loop_804:
	edge16ln	%i6,	%l2,	%i5
	pdist	%f16,	%f14,	%f26
loop_805:
	fornot2	%f24,	%f10,	%f0
	edge8n	%o4,	%g4,	%o7
	stw	%l4,	[%l7 + 0x38]
	srl	%o0,	0x1C,	%o6
	edge32	%g7,	%i7,	%g5
	bg,pn	%icc,	loop_806
	fmovdge	%xcc,	%f1,	%f5
	brgz	%o3,	loop_807
	taddcc	%g3,	0x1122,	%g2
loop_806:
	udivx	%l5,	0x1201,	%i0
	tn	%xcc,	0x1
loop_807:
	bpos	%xcc,	loop_808
	bcc,pt	%icc,	loop_809
	movgu	%xcc,	%g6,	%o2
	mulx	%i1,	0x0A54,	%i3
loop_808:
	fba,a	%fcc0,	loop_810
loop_809:
	sdiv	%o1,	0x09FF,	%i2
	brnz,a	%l3,	loop_811
	sub	%l0,	%l1,	%l6
loop_810:
	edge32n	%o5,	%i4,	%i6
	udivcc	%l2,	0x0745,	%i5
loop_811:
	xnor	%o4,	%g1,	%g4
	fzeros	%f25
	edge32l	%o7,	%o0,	%l4
	movl	%xcc,	%o6,	%g7
	alignaddr	%g5,	%o3,	%g3
	umul	%g2,	0x14A2,	%i7
	taddcctv	%l5,	0x0F4B,	%g6
	tn	%icc,	0x1
	fmovdn	%icc,	%f12,	%f11
	movn	%icc,	%o2,	%i0
	udivcc	%i1,	0x1F08,	%i3
	fmovdgu	%icc,	%f31,	%f4
	te	%icc,	0x5
	or	%o1,	0x0DF7,	%i2
	fmovde	%icc,	%f21,	%f16
	brlz	%l3,	loop_812
	movrne	%l1,	%l6,	%l0
	fsrc2	%f26,	%f22
	srl	%i4,	%o5,	%l2
loop_812:
	fbge	%fcc1,	loop_813
	movcc	%icc,	%i5,	%o4
	tpos	%icc,	0x3
	prefetch	[%l7 + 0x08],	 0x0
loop_813:
	edge16	%g1,	%i6,	%o7
	and	%o0,	0x03F7,	%l4
	fmul8sux16	%f22,	%f14,	%f18
	fblg	%fcc1,	loop_814
	tl	%xcc,	0x4
	ble,pn	%icc,	loop_815
	xorcc	%g4,	0x1960,	%g7
loop_814:
	tn	%xcc,	0x4
	fabss	%f12,	%f4
loop_815:
	movgu	%icc,	%g5,	%o3
	movcs	%xcc,	%g3,	%g2
	array16	%i7,	%o6,	%g6
	edge32ln	%l5,	%i0,	%i1
	fblg	%fcc1,	loop_816
	edge32	%i3,	%o1,	%o2
	umulcc	%l3,	%i2,	%l6
	nop
	setx	loop_817,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_816:
	xorcc	%l0,	0x0851,	%i4
	prefetch	[%l7 + 0x14],	 0x1
	fcmple32	%f18,	%f28,	%o5
loop_817:
	array16	%l1,	%l2,	%o4
	faligndata	%f30,	%f16,	%f10
	smulcc	%g1,	0x1FDC,	%i5
	subcc	%i6,	0x0420,	%o7
	te	%xcc,	0x4
	tn	%xcc,	0x3
	fornot1	%f6,	%f26,	%f10
	fnors	%f8,	%f8,	%f29
	brnz	%l4,	loop_818
	srax	%o0,	0x0A,	%g4
	mulscc	%g5,	0x16F1,	%g7
	bn,pt	%icc,	loop_819
loop_818:
	array32	%g3,	%o3,	%i7
	srax	%g2,	%o6,	%g6
	fmovdvc	%icc,	%f20,	%f2
loop_819:
	fbul,a	%fcc2,	loop_820
	movrlez	%l5,	0x0EF,	%i0
	edge8	%i3,	%o1,	%i1
	movl	%icc,	%l3,	%i2
loop_820:
	brnz,a	%o2,	loop_821
	popc	%l0,	%i4
	tcs	%xcc,	0x1
	addcc	%o5,	%l1,	%l6
loop_821:
	tvc	%xcc,	0x7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpack32	%f6,	%f30,	%f26
	xnor	%l2,	0x0313,	%o4
	fmovsl	%xcc,	%f23,	%f8
	smulcc	%i5,	0x1406,	%g1
	fmovs	%f15,	%f11
	edge32ln	%i6,	%o7,	%o0
	fmovrsgz	%g4,	%f31,	%f24
	subcc	%l4,	0x0B92,	%g5
	movl	%icc,	%g7,	%o3
	edge8ln	%g3,	%i7,	%o6
	set	0x1F, %i3
	stba	%g6,	[%l7 + %i3] 0x14
	umulcc	%g2,	%l5,	%i3
	tne	%xcc,	0x7
	stbar
	fcmpeq16	%f8,	%f14,	%o1
	andcc	%i0,	%l3,	%i1
	fnot2	%f26,	%f8
	set	0x3C, %l5
	stwa	%o2,	[%l7 + %l5] 0x18
	fmul8x16	%f17,	%f14,	%f0
	subc	%l0,	0x1548,	%i4
	bvc,pt	%xcc,	loop_822
	membar	0x41
	popc	%i2,	%l1
	umulcc	%o5,	0x00D6,	%l6
loop_822:
	fcmpeq16	%f10,	%f18,	%o4
	fmovrslez	%l2,	%f19,	%f14
	fsrc2s	%f0,	%f8
	fcmpd	%fcc1,	%f14,	%f26
	wr	%g0,	0x80,	%asi
	ldsba	[%l7 + 0x51] %asi,	%g1
	subcc	%i5,	%o7,	%i6
	movn	%xcc,	%g4,	%o0
	for	%f4,	%f10,	%f18
	fbg,a	%fcc3,	loop_823
	popc	%g5,	%l4
	srl	%g7,	%g3,	%i7
	udivx	%o3,	0x190D,	%g6
loop_823:
	fcmple16	%f18,	%f4,	%o6
	edge8l	%g2,	%i3,	%l5
	udivcc	%i0,	0x12D0,	%l3
	edge8n	%o1,	%i1,	%l0
	fbo,a	%fcc1,	loop_824
	nop
	setx loop_825, %l0, %l1
	jmpl %l1, %o2
	edge32ln	%i4,	%l1,	%o5
	fmovse	%xcc,	%f8,	%f8
loop_824:
	for	%f6,	%f10,	%f8
loop_825:
	edge16n	%l6,	%o4,	%i2
	fnors	%f12,	%f0,	%f28
	fcmpgt32	%f8,	%f20,	%g1
	fmul8x16	%f9,	%f20,	%f24
	mova	%xcc,	%l2,	%o7
	alignaddrl	%i5,	%g4,	%o0
	wr	%g0,	0x10,	%asi
	ldsha	[%l7 + 0x36] %asi,	%g5
	tsubcctv	%l4,	0x1312,	%g7
	nop
	setx	loop_826,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	ldsh	[%l7 + 0x42],	%g3
	edge32ln	%i7,	%i6,	%o3
	stbar
loop_826:
	edge16l	%o6,	%g6,	%i3
	fmovsne	%icc,	%f16,	%f31
	edge8l	%l5,	%g2,	%i0
	movcs	%icc,	%l3,	%i1
	movvs	%xcc,	%l0,	%o1
	fxnors	%f14,	%f24,	%f21
	srax	%i4,	0x06,	%o2
	mulx	%l1,	0x17A6,	%l6
	fsrc2s	%f19,	%f22
	ldsw	[%l7 + 0x08],	%o5
	array16	%i2,	%o4,	%l2
	tpos	%icc,	0x3
	nop
	set	0x20, %i5
	stw	%o7,	[%l7 + %i5]
	bcs	loop_827
	movge	%xcc,	%g1,	%i5
	bn	loop_828
	andn	%g4,	%g5,	%o0
loop_827:
	tle	%xcc,	0x1
	wr	%g0,	0x19,	%asi
	prefetcha	[%l7 + 0x50] %asi,	 0x3
loop_828:
	nop
	setx	loop_829,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fzeros	%f26
	stbar
	sdivx	%g3,	0x0B7A,	%l4
loop_829:
	fmovrslz	%i7,	%f20,	%f30
	andncc	%i6,	%o3,	%o6
	set	0x38, %i4
	swapa	[%l7 + %i4] 0x11,	%g6
	fandnot1s	%f6,	%f22,	%f20
	udivcc	%i3,	0x022E,	%l5
	movne	%xcc,	%g2,	%l3
	fsrc2s	%f12,	%f3
	fmovdn	%xcc,	%f6,	%f4
	movrgez	%i0,	%i1,	%l0
	edge32ln	%i4,	%o2,	%l1
	sir	0x19DE
	mulscc	%o1,	%o5,	%l6
	andcc	%i2,	%o4,	%l2
	tleu	%icc,	0x1
	movrgez	%g1,	0x081,	%i5
	orn	%g4,	0x15DC,	%g5
	fnors	%f20,	%f3,	%f8
	brlz	%o0,	loop_830
	movre	%o7,	%g7,	%g3
	fcmpgt32	%f18,	%f2,	%i7
	bvs,a,pt	%xcc,	loop_831
loop_830:
	fpack32	%f26,	%f30,	%f8
	lduh	[%l7 + 0x64],	%l4
	sub	%i6,	0x154A,	%o6
loop_831:
	movcs	%icc,	%o3,	%g6
	edge16ln	%l5,	%g2,	%i3
	movpos	%xcc,	%l3,	%i1
	array16	%l0,	%i4,	%i0
	xnor	%l1,	%o1,	%o5
	bneg	%xcc,	loop_832
	srax	%o2,	0x04,	%i2
	wr	%g0,	0x81,	%asi
	stda	%i6,	[%l7 + 0x08] %asi
loop_832:
	fmovrse	%o4,	%f22,	%f20
	addcc	%l2,	0x0A80,	%i5
	fxors	%f1,	%f2,	%f22
	movre	%g4,	%g1,	%o0
	ta	%icc,	0x3
	addccc	%o7,	%g7,	%g3
	for	%f16,	%f8,	%f24
	sdivx	%i7,	0x16E3,	%g5
	bcs,a,pn	%icc,	loop_833
	movcc	%icc,	%l4,	%o6
	tl	%xcc,	0x4
	ldd	[%l7 + 0x68],	%f6
loop_833:
	fcmple16	%f14,	%f2,	%i6
	tne	%icc,	0x7
	fmovse	%xcc,	%f18,	%f23
	xnorcc	%o3,	%g6,	%l5
	bcs,a	%xcc,	loop_834
	movcc	%xcc,	%i3,	%g2
	fpadd32	%f26,	%f20,	%f8
	sub	%l3,	0x1603,	%l0
loop_834:
	addcc	%i4,	0x111D,	%i0
	sir	0x035E
	lduh	[%l7 + 0x56],	%i1
	movcs	%xcc,	%o1,	%o5
	edge8n	%o2,	%i2,	%l1
	bg,a,pn	%xcc,	loop_835
	movgu	%icc,	%l6,	%l2
	popc	0x16D0,	%o4
	membar	0x57
loop_835:
	fmovrslez	%g4,	%f14,	%f6
	movpos	%xcc,	%i5,	%o0
	movne	%xcc,	%g1,	%g7
	taddcctv	%o7,	0x1FCC,	%g3
	tcs	%xcc,	0x0
	edge8n	%i7,	%g5,	%l4
	fmovspos	%icc,	%f10,	%f22
	sdivcc	%o6,	0x098B,	%i6
	ldsh	[%l7 + 0x2E],	%g6
	srl	%l5,	0x0C,	%o3
	stbar
	tn	%xcc,	0x7
	set	0x48, %i6
	lduwa	[%l7 + %i6] 0x19,	%i3
	set	0x70, %i2
	ldswa	[%l7 + %i2] 0x10,	%g2
	set	0x5C, %o1
	sta	%f12,	[%l7 + %o1] 0x10
	bn,a	loop_836
	or	%l0,	%l3,	%i0
	tge	%xcc,	0x5
	brgez,a	%i1,	loop_837
loop_836:
	sdiv	%i4,	0x091C,	%o5
	te	%icc,	0x0
	edge16	%o2,	%o1,	%l1
loop_837:
	taddcc	%l6,	%l2,	%i2
	and	%g4,	%o4,	%o0
	alignaddrl	%i5,	%g1,	%g7
	edge16l	%g3,	%o7,	%i7
	set	0x5E, %o3
	stha	%g5,	[%l7 + %o3] 0x19
	edge8n	%o6,	%i6,	%l4
	tle	%icc,	0x2
	orn	%l5,	0x1B04,	%g6
	set	0x12, %i0
	stba	%o3,	[%l7 + %i0] 0xe2
	membar	#Sync
	stbar
	edge8ln	%i3,	%l0,	%l3
	fnors	%f29,	%f20,	%f14
	addc	%g2,	0x0A1E,	%i0
	xnor	%i4,	0x1EE1,	%i1
	srl	%o5,	0x1D,	%o1
	xor	%o2,	0x1F37,	%l1
	edge32ln	%l2,	%i2,	%g4
	fcmps	%fcc2,	%f17,	%f26
	bge,a,pn	%xcc,	loop_838
	edge32	%o4,	%o0,	%l6
	te	%xcc,	0x0
	andcc	%i5,	0x1961,	%g1
loop_838:
	fone	%f14
	movrlez	%g7,	0x220,	%g3
	movvs	%xcc,	%o7,	%g5
	xnor	%i7,	0x070B,	%o6
	taddcc	%l4,	0x1AEF,	%l5
	sethi	0x1C28,	%i6
	tsubcc	%o3,	0x14CE,	%i3
	sra	%g6,	0x18,	%l3
	orn	%l0,	0x06BE,	%g2
	fmovdcs	%xcc,	%f22,	%f26
	flush	%l7 + 0x30
	stb	%i4,	[%l7 + 0x61]
	siam	0x3
	membar	0x09
	be	loop_839
	tn	%xcc,	0x1
	fbl	%fcc1,	loop_840
	sllx	%i0,	%o5,	%i1
loop_839:
	fcmpeq32	%f8,	%f6,	%o1
	fandnot2s	%f23,	%f17,	%f3
loop_840:
	fbuge	%fcc3,	loop_841
	alignaddrl	%o2,	%l1,	%i2
	fmovdcc	%xcc,	%f27,	%f2
	movleu	%xcc,	%l2,	%g4
loop_841:
	movleu	%icc,	%o0,	%l6
	wr	%g0,	0x19,	%asi
	stwa	%o4,	[%l7 + 0x20] %asi
	movre	%g1,	0x39C,	%i5
	fmovscs	%icc,	%f9,	%f16
	fsrc1	%f0,	%f18
	std	%g2,	[%l7 + 0x50]
	fabss	%f0,	%f19
	sth	%o7,	[%l7 + 0x70]
	set	0x53, %o2
	ldsba	[%l7 + %o2] 0x19,	%g5
	edge16n	%i7,	%o6,	%g7
	fcmpeq16	%f2,	%f22,	%l5
	fmovrslz	%i6,	%f20,	%f4
	fpsub16	%f16,	%f28,	%f6
	lduw	[%l7 + 0x60],	%o3
	fbu	%fcc2,	loop_842
	movrgez	%l4,	%g6,	%l3
	alignaddr	%i3,	%g2,	%i4
	fmovsle	%xcc,	%f15,	%f31
loop_842:
	movrlz	%i0,	0x2D7,	%o5
	fnegd	%f0,	%f4
	fmuld8sux16	%f6,	%f20,	%f26
	set	0x50, %l6
	ldda	[%l7 + %l6] 0x81,	%i0
	addc	%l0,	0x107C,	%o2
	sdivcc	%o1,	0x14A4,	%i2
	brlz,a	%l1,	loop_843
	fandnot2	%f16,	%f30,	%f30
	edge8	%g4,	%l2,	%o0
	fnor	%f14,	%f28,	%f8
loop_843:
	fcmpgt32	%f22,	%f0,	%o4
	alignaddr	%l6,	%g1,	%i5
	tne	%icc,	0x3
	fbl	%fcc3,	loop_844
	stx	%o7,	[%l7 + 0x38]
	add	%l7,	0x50,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%g5
	casxa	[%l6] 0x80,	%g5,	%g3
loop_844:
	nop
	setx	loop_845,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fpadd32s	%f4,	%f24,	%f2
	or	%i7,	0x0478,	%g7
	fbuge,a	%fcc3,	loop_846
loop_845:
	sir	0x1B4F
	fnot2s	%f27,	%f24
	xnor	%o6,	0x079E,	%i6
loop_846:
	edge16	%l5,	%l4,	%g6
	fbul,a	%fcc3,	loop_847
	edge16n	%l3,	%i3,	%o3
	subc	%i4,	0x1C8C,	%g2
	edge32l	%o5,	%i1,	%i0
loop_847:
	nop
	set	0x50, %l0
	lduba	[%l7 + %l0] 0x89,	%l0
	fmovdpos	%icc,	%f23,	%f5
	nop
	setx	loop_848,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	nop
	set	0x4E, %o6
	sth	%o2,	[%l7 + %o6]
	ldstub	[%l7 + 0x41],	%i2
	sdivcc	%l1,	0x1575,	%g4
loop_848:
	stx	%l2,	[%l7 + 0x08]
	fexpand	%f5,	%f10
	fmovrsgz	%o0,	%f7,	%f20
	array16	%o4,	%o1,	%l6
	tle	%icc,	0x4
	st	%f6,	[%l7 + 0x3C]
	fpsub32	%f6,	%f26,	%f18
	nop
	set	0x44, %g2
	ldsb	[%l7 + %g2],	%i5
	fors	%f30,	%f7,	%f19
	fmovd	%f26,	%f4
	movre	%o7,	%g1,	%g3
	edge32n	%i7,	%g5,	%g7
	xnor	%o6,	%l5,	%l4
	nop
	setx	loop_849,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fbuge	%fcc0,	loop_850
	edge32	%g6,	%l3,	%i3
	xor	%i6,	%o3,	%g2
loop_849:
	edge32l	%o5,	%i1,	%i0
loop_850:
	edge16l	%i4,	%l0,	%i2
	movne	%xcc,	%l1,	%o2
	fmovdcc	%xcc,	%f5,	%f22
	edge32	%g4,	%o0,	%o4
	movrgez	%l2,	0x174,	%o1
	stw	%l6,	[%l7 + 0x0C]
	fmovrsgz	%i5,	%f12,	%f11
	edge8	%g1,	%o7,	%i7
	nop
	set	0x1C, %l3
	ldub	[%l7 + %l3],	%g5
	movg	%xcc,	%g3,	%o6
	movneg	%xcc,	%l5,	%g7
	movg	%icc,	%l4,	%g6
	edge8ln	%l3,	%i3,	%o3
	bl,a,pn	%icc,	loop_851
	fcmple32	%f20,	%f12,	%i6
	bshuffle	%f14,	%f16,	%f14
	edge8ln	%g2,	%i1,	%i0
loop_851:
	add	%o5,	0x0F1A,	%l0
	fmovdvs	%xcc,	%f5,	%f20
	fxors	%f21,	%f5,	%f1
	movre	%i4,	0x323,	%i2
	fands	%f19,	%f4,	%f29
	and	%o2,	0x0E74,	%g4
	movrgz	%l1,	0x0A3,	%o4
	movl	%xcc,	%o0,	%o1
	fmovs	%f15,	%f20
	edge32n	%l6,	%l2,	%i5
	stbar
	smulcc	%g1,	%o7,	%g5
	array16	%i7,	%g3,	%o6
	fnors	%f1,	%f30,	%f23
	set	0x7B, %l4
	lduba	[%l7 + %l4] 0x80,	%g7
	smul	%l4,	0x1E13,	%g6
	wr	%g0,	0x80,	%asi
	sta	%f8,	[%l7 + 0x48] %asi
	brgz,a	%l5,	loop_852
	sub	%l3,	%o3,	%i6
	sir	0x0CA7
	edge16	%i3,	%g2,	%i0
loop_852:
	ble,a,pt	%xcc,	loop_853
	sir	0x188A
	fmovspos	%icc,	%f21,	%f17
	fcmple32	%f10,	%f22,	%o5
loop_853:
	ld	[%l7 + 0x58],	%f25
	brgz	%i1,	loop_854
	fpsub32	%f16,	%f6,	%f6
	sir	0x0A1D
	fmovdgu	%icc,	%f21,	%f27
loop_854:
	udivx	%i4,	0x172D,	%i2
	sub	%o2,	%l0,	%l1
	movrlez	%g4,	%o4,	%o1
	edge8n	%l6,	%o0,	%i5
	addc	%g1,	0x0523,	%o7
	tge	%xcc,	0x1
	fpadd16	%f22,	%f30,	%f14
	ldsh	[%l7 + 0x38],	%g5
	membar	#Sync
	set	0x40, %i7
	ldda	[%l7 + %i7] 0x17,	%f0
	bgu,a	loop_855
	fmovrdgez	%i7,	%f8,	%f30
	movleu	%xcc,	%g3,	%l2
	fbge,a	%fcc2,	loop_856
loop_855:
	sdivx	%o6,	0x0134,	%g7
	fbne	%fcc0,	loop_857
	ld	[%l7 + 0x54],	%f0
loop_856:
	fmovrslz	%g6,	%f19,	%f19
	fbo,a	%fcc3,	loop_858
loop_857:
	nop
	set	0x38, %l1
	ldx	[%l7 + %l1],	%l5
	fbo	%fcc1,	loop_859
	pdist	%f22,	%f16,	%f30
loop_858:
	orcc	%l4,	0x0EA0,	%l3
	fors	%f31,	%f11,	%f30
loop_859:
	fnor	%f28,	%f8,	%f16
	set	0x74, %o4
	ldsba	[%l7 + %o4] 0x89,	%i6
	array16	%i3,	%o3,	%i0
	edge32	%g2,	%o5,	%i1
	tle	%icc,	0x5
	edge16ln	%i4,	%o2,	%i2
	mulscc	%l1,	0x1426,	%g4
	taddcc	%l0,	0x180E,	%o4
	fones	%f0
	fcmpgt32	%f24,	%f18,	%o1
	taddcctv	%l6,	%i5,	%o0
	movpos	%icc,	%o7,	%g1
	ldd	[%l7 + 0x08],	%f12
	wr	%g0,	0x04,	%asi
	ldsha	[%l7 + 0x32] %asi,	%i7
	fmovsvs	%xcc,	%f12,	%f5
	wr	%g0,	0x11,	%asi
	lduha	[%l7 + 0x46] %asi,	%g5
	movrgz	%g3,	%o6,	%l2
	srl	%g7,	0x06,	%l5
	tge	%icc,	0x2
	fxnors	%f21,	%f10,	%f3
	ta	%icc,	0x2
	tge	%xcc,	0x2
	wr	%g0,	0x52,	%asi
	ldxa	[%g0 + 0x110] %asi,	%g6
	bl,a	loop_860
	addccc	%l3,	0x134F,	%i6
	bvc,a	loop_861
	fcmpes	%fcc0,	%f30,	%f1
loop_860:
	fcmple16	%f18,	%f22,	%i3
	movneg	%icc,	%l4,	%o3
loop_861:
	fmovsle	%icc,	%f16,	%f29
	movpos	%icc,	%g2,	%o5
	fbe,a	%fcc3,	loop_862
	smulcc	%i0,	0x0377,	%i4
	bvs,a,pt	%icc,	loop_863
	fmul8sux16	%f24,	%f12,	%f20
loop_862:
	umulcc	%i1,	%o2,	%i2
	movpos	%icc,	%l1,	%l0
loop_863:
	mulscc	%g4,	%o1,	%l6
	subcc	%o4,	%i5,	%o0
	popc	0x18FE,	%o7
	fmovrsgez	%i7,	%f2,	%f23
	umul	%g5,	0x09CC,	%g1
	edge8n	%o6,	%l2,	%g3
	wr	%g0,	0x04,	%asi
	stxa	%g7,	[%l7 + 0x58] %asi
	set	0x50, %g1
	sta	%f26,	[%l7 + %g1] 0x19
	movn	%icc,	%l5,	%l3
	movre	%i6,	%i3,	%l4
	umulcc	%g6,	0x19E1,	%g2
	bvs,a	%icc,	loop_864
	fnor	%f24,	%f14,	%f26
	smulcc	%o5,	0x1F7F,	%i0
	set	0x10, %o0
	ldda	[%l7 + %o0] 0xe3,	%i4
loop_864:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsw	[%l7 + 0x30],	%i1
	subcc	%o3,	%i2,	%l1
	bvs,a	loop_865
	sra	%l0,	%o2,	%g4
	movge	%xcc,	%l6,	%o4
	brgez	%o1,	loop_866
loop_865:
	bcs,a,pn	%icc,	loop_867
	movrne	%o0,	0x219,	%o7
	addcc	%i7,	0x11A2,	%i5
loop_866:
	fandnot2	%f20,	%f10,	%f30
loop_867:
	fmul8x16	%f9,	%f30,	%f18
	bcc,pt	%xcc,	loop_868
	movrne	%g1,	0x092,	%o6
	movgu	%icc,	%g5,	%l2
	nop
	set	0x58, %o5
	ldsw	[%l7 + %o5],	%g3
loop_868:
	and	%g7,	%l5,	%l3
	edge32n	%i3,	%l4,	%i6
	fxnors	%f1,	%f27,	%f12
	fcmped	%fcc0,	%f4,	%f0
	tpos	%xcc,	0x1
	membar	0x28
	edge32n	%g2,	%o5,	%i0
	fba	%fcc1,	loop_869
	fmovsvc	%xcc,	%f1,	%f31
	movge	%xcc,	%i4,	%g6
	tgu	%xcc,	0x1
loop_869:
	faligndata	%f2,	%f26,	%f18
	fmovde	%xcc,	%f19,	%f14
	mulx	%i1,	0x1EB4,	%o3
	edge16ln	%l1,	%i2,	%o2
	orn	%l0,	%l6,	%g4
	move	%xcc,	%o1,	%o0
	andn	%o7,	0x18AF,	%i7
	fornot1	%f22,	%f12,	%f18
	andcc	%i5,	%o4,	%g1
	sth	%g5,	[%l7 + 0x3A]
	te	%xcc,	0x1
	nop
	set	0x30, %g7
	ldd	[%l7 + %g7],	%l2
	edge8	%g3,	%o6,	%l5
	smulcc	%l3,	0x0812,	%i3
	tne	%icc,	0x5
	bg,a	loop_870
	fbuge	%fcc0,	loop_871
	fbn	%fcc3,	loop_872
	std	%f16,	[%l7 + 0x78]
loop_870:
	edge16n	%l4,	%g7,	%g2
loop_871:
	fmovrse	%i6,	%f30,	%f22
loop_872:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmps	%fcc2,	%f31,	%f26
	movvs	%icc,	%i0,	%o5
	fbul,a	%fcc1,	loop_873
	srax	%i4,	0x15,	%g6
	subccc	%o3,	0x0D3A,	%l1
	membar	0x06
loop_873:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddrl	%i1,	%i2,	%o2
	stx	%l6,	[%l7 + 0x38]
	mulscc	%g4,	0x0907,	%o1
	stbar
	call	loop_874
	fbue,a	%fcc0,	loop_875
	tle	%xcc,	0x1
	bl,a,pn	%xcc,	loop_876
loop_874:
	array8	%l0,	%o7,	%i7
loop_875:
	ta	%xcc,	0x7
	edge32	%o0,	%o4,	%i5
loop_876:
	bne	loop_877
	movrlez	%g1,	0x3A8,	%g5
	sth	%l2,	[%l7 + 0x32]
	movneg	%xcc,	%g3,	%l5
loop_877:
	bleu,a	loop_878
	stw	%o6,	[%l7 + 0x3C]
	edge16n	%i3,	%l4,	%l3
	fzero	%f26
loop_878:
	bl,a	loop_879
	addccc	%g7,	0x1A77,	%i6
	fmovde	%xcc,	%f23,	%f27
	sllx	%g2,	0x18,	%i0
loop_879:
	mulscc	%o5,	%g6,	%i4
	taddcc	%l1,	0x1BDE,	%i1
	fandnot2	%f12,	%f14,	%f24
	be,a	%xcc,	loop_880
	fnand	%f30,	%f2,	%f10
	taddcctv	%i2,	%o3,	%l6
	tvc	%icc,	0x4
loop_880:
	mulscc	%g4,	0x1E32,	%o1
	tge	%xcc,	0x3
	sir	0x0E62
	for	%f0,	%f26,	%f14
	fmovse	%icc,	%f14,	%f13
	tg	%xcc,	0x3
	move	%icc,	%l0,	%o7
	movle	%icc,	%o2,	%o0
	movre	%o4,	%i7,	%i5
	edge32	%g5,	%g1,	%g3
	brlez	%l5,	loop_881
	ta	%xcc,	0x0
	fbue	%fcc2,	loop_882
	and	%l2,	%i3,	%o6
loop_881:
	mulscc	%l4,	%l3,	%g7
	tvc	%xcc,	0x5
loop_882:
	fmul8ulx16	%f20,	%f6,	%f2
	fxors	%f24,	%f3,	%f20
	addcc	%g2,	%i6,	%o5
	fandnot2s	%f4,	%f24,	%f20
	tcc	%xcc,	0x6
	fmovdne	%xcc,	%f11,	%f24
	sdivx	%i0,	0x1606,	%i4
	edge16	%g6,	%i1,	%i2
	fbul,a	%fcc0,	loop_883
	tpos	%icc,	0x2
	wr	%g0,	0x11,	%asi
	lduba	[%l7 + 0x6E] %asi,	%o3
loop_883:
	fmovsvs	%xcc,	%f12,	%f8
	fmovscs	%xcc,	%f3,	%f12
	tneg	%xcc,	0x4
	wr	%g0,	0x89,	%asi
	lduba	[%l7 + 0x7B] %asi,	%l6
	umul	%l1,	%o1,	%l0
	add	%l7,	0x50,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] %asi,	%o7,	%o2
	fmovda	%icc,	%f25,	%f31
	fbu,a	%fcc0,	loop_884
	orncc	%g4,	%o4,	%i7
	movrgz	%i5,	%g5,	%g1
	movrgz	%g3,	0x0C0,	%o0
loop_884:
	mulx	%l5,	0x0F63,	%l2
	tsubcctv	%o6,	0x041C,	%l4
	fmovrslz	%l3,	%f4,	%f8
	andncc	%g7,	%g2,	%i6
	fmovda	%icc,	%f28,	%f30
	sll	%i3,	%i0,	%o5
	add	%g6,	0x05FF,	%i1
	movrne	%i4,	0x3B2,	%o3
	fxor	%f16,	%f18,	%f24
	edge16l	%i2,	%l1,	%o1
	movrlz	%l0,	0x145,	%l6
	stb	%o2,	[%l7 + 0x50]
	tle	%xcc,	0x7
	tvc	%xcc,	0x5
	brnz,a	%g4,	loop_885
	edge32n	%o4,	%i7,	%o7
	subccc	%g5,	0x0D5A,	%i5
	tvs	%xcc,	0x5
loop_885:
	fcmped	%fcc2,	%f10,	%f14
	edge32l	%g1,	%g3,	%o0
	srax	%l5,	0x06,	%o6
	edge16	%l4,	%l2,	%g7
	array8	%l3,	%g2,	%i6
	udivx	%i3,	0x1787,	%i0
	udivcc	%o5,	0x1E03,	%g6
	movvc	%xcc,	%i1,	%o3
	wr	%g0,	0x21,	%asi
	ldxa	[%g0 + 0x110] %asi,	%i4
	array8	%i2,	%o1,	%l1
	wr	%g0,	0x89,	%asi
	stwa	%l6,	[%l7 + 0x74] %asi
	addcc	%l0,	0x0E70,	%g4
	fmovsne	%xcc,	%f19,	%f6
	tne	%icc,	0x2
	ldub	[%l7 + 0x14],	%o4
	fbul,a	%fcc1,	loop_886
	fmovdleu	%icc,	%f26,	%f26
	fsrc1	%f30,	%f6
	fpsub16	%f6,	%f14,	%f10
loop_886:
	fmovdne	%xcc,	%f8,	%f5
	srl	%o2,	0x0F,	%i7
	fnand	%f16,	%f6,	%f8
	nop
	setx	loop_887,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	sdivx	%o7,	0x19A5,	%i5
	ldx	[%l7 + 0x30],	%g1
	fbue	%fcc0,	loop_888
loop_887:
	movgu	%xcc,	%g5,	%o0
	fabsd	%f2,	%f10
	edge32	%l5,	%o6,	%g3
loop_888:
	sllx	%l4,	%g7,	%l3
	move	%xcc,	%g2,	%l2
	movrlz	%i3,	%i0,	%o5
	brnz,a	%g6,	loop_889
	fxors	%f28,	%f5,	%f27
	tl	%xcc,	0x6
	movre	%i6,	0x3C9,	%o3
loop_889:
	tn	%xcc,	0x0
	call	loop_890
	ldsb	[%l7 + 0x1D],	%i1
	bl,pt	%icc,	loop_891
	fcmpne16	%f22,	%f22,	%i2
loop_890:
	edge16	%i4,	%l1,	%o1
	sdivcc	%l0,	0x05B3,	%g4
loop_891:
	array8	%o4,	%o2,	%l6
	set	0x48, %o7
	stda	%i6,	[%l7 + %o7] 0x19
	st	%f28,	[%l7 + 0x08]
	movcs	%icc,	%i5,	%o7
	orncc	%g5,	0x181F,	%g1
	xor	%o0,	0x10C4,	%o6
	sdivcc	%g3,	0x0ADD,	%l5
	srlx	%g7,	%l4,	%l3
	movle	%xcc,	%g2,	%i3
	fmovsn	%icc,	%f18,	%f14
	tsubcctv	%l2,	0x1F6C,	%o5
	fbge	%fcc0,	loop_892
	fornot2	%f24,	%f26,	%f24
	array32	%i0,	%i6,	%g6
	orcc	%i1,	0x09FD,	%i2
loop_892:
	movge	%xcc,	%i4,	%l1
	ldsw	[%l7 + 0x6C],	%o3
	movleu	%xcc,	%l0,	%o1
	movl	%icc,	%o4,	%g4
	movle	%xcc,	%l6,	%i7
	fandnot1s	%f20,	%f15,	%f4
	fbne	%fcc3,	loop_893
	ldd	[%l7 + 0x40],	%i4
	movleu	%xcc,	%o7,	%o2
	umul	%g5,	0x1A8F,	%g1
loop_893:
	tl	%icc,	0x7
	ldsw	[%l7 + 0x1C],	%o6
	nop
	set	0x7D, %l2
	ldstub	[%l7 + %l2],	%g3
	siam	0x0
	bne	loop_894
	fmul8x16au	%f9,	%f16,	%f6
	addccc	%l5,	%g7,	%l4
	edge8l	%o0,	%g2,	%l3
loop_894:
	fmovsvc	%xcc,	%f19,	%f28
	edge8l	%i3,	%o5,	%l2
	tpos	%icc,	0x3
	fmovscc	%xcc,	%f17,	%f0
	fpsub32	%f4,	%f22,	%f12
	movrgez	%i6,	%g6,	%i0
	edge16ln	%i2,	%i4,	%l1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	add	%i1,	0x1167,	%l0
	fbuge,a	%fcc0,	loop_895
	andn	%o3,	0x00E2,	%o4
	edge16ln	%g4,	%l6,	%o1
	fsrc2s	%f29,	%f7
loop_895:
	movneg	%xcc,	%i5,	%o7
	movrne	%i7,	0x155,	%o2
	fcmpgt32	%f8,	%f22,	%g1
	movrne	%g5,	%g3,	%l5
	fnands	%f3,	%f12,	%f22
	taddcc	%g7,	0x0182,	%o6
	movne	%icc,	%o0,	%g2
	addccc	%l3,	0x1F13,	%i3
	addcc	%l4,	%l2,	%o5
	tg	%icc,	0x1
	brz,a	%g6,	loop_896
	tn	%icc,	0x1
	fmuld8sux16	%f9,	%f15,	%f10
	fmul8x16al	%f14,	%f12,	%f0
loop_896:
	movl	%icc,	%i0,	%i2
	flush	%l7 + 0x30
	array32	%i4,	%l1,	%i6
	edge8	%l0,	%i1,	%o4
	movvc	%icc,	%o3,	%l6
	fpadd16	%f4,	%f20,	%f4
	tg	%xcc,	0x5
	wr	%g0,	0x27,	%asi
	stda	%o0,	[%l7 + 0x68] %asi
	membar	#Sync
	sub	%i5,	0x0DEE,	%g4
	brlz,a	%i7,	loop_897
	movpos	%xcc,	%o7,	%o2
	fors	%f11,	%f24,	%f23
	add	%l7,	0x38,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] %asi,	%g1,	%g3
loop_897:
	pdist	%f22,	%f24,	%f10
	fmovrdne	%g5,	%f22,	%f16
	fpadd16s	%f10,	%f7,	%f20
	te	%xcc,	0x1
	tsubcc	%l5,	0x1AEC,	%o6
	mulx	%g7,	%o0,	%l3
	movpos	%xcc,	%g2,	%i3
	bcc,pn	%xcc,	loop_898
	tge	%xcc,	0x7
	brlez	%l4,	loop_899
	fba,a	%fcc0,	loop_900
loop_898:
	sir	0x12B9
	movn	%xcc,	%l2,	%o5
loop_899:
	lduw	[%l7 + 0x44],	%i0
loop_900:
	andncc	%g6,	%i2,	%l1
	smulcc	%i4,	0x1132,	%l0
	fmovrdgez	%i1,	%f24,	%f28
	fandnot1	%f10,	%f14,	%f0
	fones	%f5
	edge8n	%i6,	%o3,	%o4
	faligndata	%f30,	%f24,	%f28
	fpack16	%f28,	%f23
	fones	%f14
	andncc	%l6,	%i5,	%o1
	tle	%icc,	0x1
	fbg,a	%fcc0,	loop_901
	tsubcc	%g4,	%o7,	%i7
	set	0x30, %g5
	swapa	[%l7 + %g5] 0x11,	%o2
loop_901:
	fmovdge	%icc,	%f0,	%f22
	movpos	%xcc,	%g1,	%g3
	set	0x59, %i1
	stba	%l5,	[%l7 + %i1] 0x11
	sth	%g5,	[%l7 + 0x48]
	set	0x10, %g3
	swapa	[%l7 + %g3] 0x10,	%g7
	tgu	%xcc,	0x6
	set	0x58, %g6
	ldswa	[%l7 + %g6] 0x18,	%o0
	wr	%g0,	0x19,	%asi
	ldswa	[%l7 + 0x18] %asi,	%o6
	tcc	%xcc,	0x6
	fornot1s	%f31,	%f9,	%f5
	fcmple32	%f30,	%f14,	%g2
	or	%i3,	%l3,	%l2
	fxnor	%f14,	%f22,	%f8
	bg,a,pt	%xcc,	loop_902
	fmovdcc	%xcc,	%f9,	%f21
	movleu	%xcc,	%o5,	%i0
	array32	%l4,	%g6,	%i2
loop_902:
	fmovde	%icc,	%f16,	%f22
	ba,a	%icc,	loop_903
	fmovsle	%xcc,	%f26,	%f12
	tg	%icc,	0x3
	mulx	%i4,	%l1,	%i1
loop_903:
	fmovrsgz	%l0,	%f15,	%f19
	movrne	%o3,	%o4,	%i6
	std	%i4,	[%l7 + 0x10]
	movrlez	%l6,	0x3E3,	%g4
	tl	%icc,	0x6
	fmovdvc	%icc,	%f22,	%f27
	tpos	%xcc,	0x2
	wr	%g0,	0x23,	%asi
	stda	%o0,	[%l7 + 0x70] %asi
	membar	#Sync
	alignaddr	%o7,	%o2,	%i7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movneg	%icc,	%g1,	%g3
	sir	0x07FD
	movvs	%icc,	%g5,	%l5
	edge16l	%o0,	%o6,	%g2
	tl	%icc,	0x5
	sdivcc	%g7,	0x11E9,	%l3
	fandnot1	%f20,	%f18,	%f28
	fandnot2s	%f9,	%f31,	%f31
	ldstub	[%l7 + 0x6E],	%i3
	brz,a	%l2,	loop_904
	flush	%l7 + 0x5C
	nop
	setx	loop_905,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	orncc	%o5,	0x05D0,	%i0
loop_904:
	movn	%xcc,	%l4,	%i2
	array16	%i4,	%l1,	%i1
loop_905:
	fbge,a	%fcc3,	loop_906
	fmovde	%icc,	%f26,	%f7
	tcc	%xcc,	0x5
	tge	%icc,	0x5
loop_906:
	movcs	%icc,	%l0,	%o3
	movrlz	%g6,	%o4,	%i6
	mova	%xcc,	%l6,	%i5
	fandnot2s	%f3,	%f20,	%f0
	fpsub32	%f8,	%f0,	%f18
	set	0x2A, %g4
	ldsba	[%l7 + %g4] 0x18,	%g4
	fmul8ulx16	%f8,	%f16,	%f6
	bge	loop_907
	faligndata	%f24,	%f26,	%f20
	brgz	%o1,	loop_908
	fmovsg	%xcc,	%f24,	%f30
loop_907:
	fpackfix	%f28,	%f14
	fxors	%f27,	%f25,	%f25
loop_908:
	ldsw	[%l7 + 0x60],	%o2
	fpackfix	%f14,	%f3
	fcmpd	%fcc2,	%f28,	%f20
	fpsub16	%f28,	%f28,	%f4
	brgz	%i7,	loop_909
	movrlz	%o7,	0x2F5,	%g1
	xor	%g5,	0x012E,	%l5
	fmul8sux16	%f8,	%f22,	%f12
loop_909:
	fba	%fcc2,	loop_910
	alignaddrl	%g3,	%o6,	%g2
	wr	%g0,	0x19,	%asi
	ldsba	[%l7 + 0x41] %asi,	%o0
loop_910:
	stx	%g7,	[%l7 + 0x78]
	edge16	%l3,	%i3,	%o5
	fbl	%fcc0,	loop_911
	movgu	%xcc,	%l2,	%i0
	fpadd32s	%f1,	%f5,	%f16
	movrlz	%l4,	%i2,	%i4
loop_911:
	move	%icc,	%l1,	%l0
	edge32l	%o3,	%i1,	%g6
	mova	%icc,	%i6,	%l6
	or	%o4,	0x1EB6,	%i5
	fandnot1	%f22,	%f30,	%f30
	sdivcc	%o1,	0x0943,	%g4
	set	0x7D, %i3
	lduba	[%l7 + %i3] 0x10,	%i7
	movne	%xcc,	%o7,	%o2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movne	%xcc,	%g5,	%g1
	fmovrdlz	%l5,	%f18,	%f30
	fmovd	%f8,	%f8
	sdivcc	%g3,	0x1070,	%o6
	fones	%f2
	edge8n	%o0,	%g7,	%g2
	fmovscs	%icc,	%f25,	%f21
	ldd	[%l7 + 0x18],	%l2
	bleu	%xcc,	loop_912
	bleu,pt	%icc,	loop_913
	movre	%o5,	%l2,	%i0
	fmovrdne	%i3,	%f8,	%f8
loop_912:
	sll	%l4,	%i2,	%l1
loop_913:
	brlz	%i4,	loop_914
	tvc	%icc,	0x3
	prefetch	[%l7 + 0x5C],	 0x1
	movleu	%icc,	%o3,	%i1
loop_914:
	ble,pn	%icc,	loop_915
	bshuffle	%f14,	%f10,	%f22
	sdivcc	%g6,	0x02B5,	%i6
	stbar
loop_915:
	popc	%l0,	%l6
	orcc	%o4,	%o1,	%i5
	addcc	%g4,	%i7,	%o7
	movre	%g5,	0x087,	%g1
	mulx	%l5,	0x057F,	%g3
	set	0x30, %i5
	stda	%o6,	[%l7 + %i5] 0xeb
	membar	#Sync
	xnor	%o2,	%o0,	%g2
	fbne,a	%fcc3,	loop_916
	array32	%g7,	%o5,	%l3
	fbul	%fcc2,	loop_917
	fbl	%fcc1,	loop_918
loop_916:
	fmovsne	%icc,	%f5,	%f0
	sethi	0x17EE,	%l2
loop_917:
	or	%i3,	0x1321,	%i0
loop_918:
	stw	%l4,	[%l7 + 0x28]
	fmovdne	%icc,	%f18,	%f17
	movvc	%icc,	%l1,	%i2
	edge8ln	%i4,	%i1,	%o3
	fmovdge	%icc,	%f25,	%f9
	fandnot2	%f22,	%f20,	%f20
	tvc	%xcc,	0x6
	edge32l	%g6,	%l0,	%l6
	andn	%i6,	0x0E84,	%o4
	ta	%xcc,	0x2
	bne,a	loop_919
	tge	%icc,	0x7
	tle	%icc,	0x0
	udiv	%o1,	0x0198,	%g4
loop_919:
	fornot2s	%f22,	%f8,	%f22
	fble,a	%fcc3,	loop_920
	smul	%i5,	%i7,	%g5
	fnot2	%f20,	%f28
	fpackfix	%f2,	%f29
loop_920:
	fmul8x16	%f26,	%f18,	%f28
	ba,a,pn	%icc,	loop_921
	sir	0x1E5E
	edge16l	%o7,	%l5,	%g1
	movl	%icc,	%o6,	%o2
loop_921:
	ldd	[%l7 + 0x10],	%g2
	tge	%xcc,	0x5
	tne	%xcc,	0x3
	addc	%g2,	%g7,	%o5
	edge8n	%o0,	%l2,	%l3
	fmovrsgz	%i3,	%f23,	%f22
	sllx	%l4,	%i0,	%l1
	sllx	%i2,	0x17,	%i4
	sth	%i1,	[%l7 + 0x0E]
	fandnot1s	%f26,	%f25,	%f10
	edge16n	%o3,	%l0,	%g6
	ld	[%l7 + 0x28],	%f11
	fmuld8ulx16	%f1,	%f25,	%f6
	fnors	%f18,	%f4,	%f19
	fsrc1s	%f7,	%f25
	wr	%g0,	0x89,	%asi
	ldxa	[%l7 + 0x20] %asi,	%i6
	ldsw	[%l7 + 0x30],	%l6
	edge32ln	%o4,	%o1,	%i5
	addcc	%g4,	0x17BC,	%i7
	te	%xcc,	0x2
	movleu	%icc,	%o7,	%g5
	tgu	%icc,	0x0
	mulx	%g1,	0x09CE,	%o6
	fpadd32s	%f6,	%f22,	%f1
	udivcc	%o2,	0x07A9,	%g3
	set	0x33, %i4
	ldstuba	[%l7 + %i4] 0x11,	%l5
	umulcc	%g7,	%o5,	%g2
	edge32n	%l2,	%l3,	%o0
	fmovs	%f15,	%f5
	lduh	[%l7 + 0x76],	%l4
	ldstub	[%l7 + 0x3D],	%i0
	fabss	%f24,	%f7
	bge,pt	%icc,	loop_922
	movn	%xcc,	%l1,	%i2
	mova	%icc,	%i4,	%i3
	srl	%o3,	0x10,	%i1
loop_922:
	subcc	%l0,	0x14A5,	%i6
	srl	%l6,	0x1B,	%o4
	edge16	%o1,	%i5,	%g6
	add	%l7,	0x7C,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%g4
	casa	[%l6] %asi,	%g4,	%i7
	lduw	[%l7 + 0x54],	%o7
	tle	%icc,	0x4
	taddcctv	%g5,	%g1,	%o2
	taddcctv	%o6,	%g3,	%g7
	stb	%o5,	[%l7 + 0x41]
	tl	%icc,	0x2
	fmovsn	%icc,	%f5,	%f1
	fnot1s	%f4,	%f0
	srlx	%g2,	0x01,	%l2
	taddcctv	%l3,	0x1AA0,	%o0
	fbne,a	%fcc0,	loop_923
	movgu	%xcc,	%l5,	%i0
	orcc	%l1,	%i2,	%i4
	mova	%xcc,	%l4,	%i3
loop_923:
	fmovrslez	%i1,	%f15,	%f25
	tsubcctv	%o3,	0x09C4,	%i6
	xor	%l0,	%l6,	%o4
	ta	%xcc,	0x0
	mulscc	%o1,	%i5,	%g6
	movrne	%i7,	0x2A1,	%o7
	tl	%icc,	0x5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tl	%icc,	0x6
	set	0x10, %i6
	ldxa	[%l7 + %i6] 0x10,	%g4
	sdivx	%g1,	0x11E4,	%o2
	sll	%g5,	%g3,	%o6
	mova	%icc,	%o5,	%g7
	mulscc	%g2,	%l2,	%l3
	tcc	%xcc,	0x2
	fpadd16s	%f13,	%f17,	%f22
	bpos,pn	%icc,	loop_924
	taddcc	%l5,	%i0,	%l1
	fmovrdlez	%o0,	%f4,	%f16
	edge16ln	%i4,	%i2,	%l4
loop_924:
	fnors	%f21,	%f6,	%f13
	brgz	%i3,	loop_925
	fmovsle	%icc,	%f9,	%f9
	sdiv	%i1,	0x0BAA,	%i6
	edge8	%l0,	%o3,	%o4
loop_925:
	orcc	%o1,	0x0501,	%l6
	tgu	%icc,	0x6
	add	%g6,	0x1ADC,	%i5
	tl	%xcc,	0x2
	srax	%i7,	%g4,	%g1
	tg	%xcc,	0x0
	xor	%o2,	0x0226,	%o7
	fornot2	%f18,	%f30,	%f2
	movcc	%xcc,	%g5,	%g3
	brgz,a	%o6,	loop_926
	brgz,a	%o5,	loop_927
	smulcc	%g7,	0x0AC1,	%g2
	fexpand	%f7,	%f24
loop_926:
	mulx	%l3,	%l2,	%l5
loop_927:
	fba	%fcc2,	loop_928
	movrgez	%l1,	0x0FD,	%o0
	taddcctv	%i4,	%i0,	%i2
	fmovsle	%xcc,	%f27,	%f26
loop_928:
	bcc,a,pn	%xcc,	loop_929
	edge8ln	%i3,	%i1,	%i6
	lduh	[%l7 + 0x2E],	%l0
	edge8ln	%l4,	%o4,	%o1
loop_929:
	fmovsleu	%icc,	%f5,	%f28
	wr	%g0,	0x27,	%asi
	stxa	%l6,	[%l7 + 0x50] %asi
	membar	#Sync
	movneg	%xcc,	%o3,	%i5
	fblg,a	%fcc2,	loop_930
	nop
	setx	loop_931,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	sdivcc	%g6,	0x057B,	%i7
	edge8l	%g1,	%g4,	%o2
loop_930:
	stw	%g5,	[%l7 + 0x78]
loop_931:
	brgez,a	%o7,	loop_932
	fpsub32s	%f12,	%f20,	%f4
	bvs,pn	%icc,	loop_933
	srlx	%o6,	0x04,	%g3
loop_932:
	bcs,a,pt	%icc,	loop_934
	edge32n	%g7,	%o5,	%l3
loop_933:
	add	%l2,	0x0346,	%l5
	xnor	%l1,	0x0E57,	%g2
loop_934:
	nop
	wr	%g0,	0x89,	%asi
	ldsba	[%l7 + 0x24] %asi,	%i4
	edge16n	%o0,	%i2,	%i3
	movvc	%xcc,	%i0,	%i1
	udivx	%l0,	0x0FD5,	%i6
	fmovdge	%icc,	%f30,	%f30
	srl	%o4,	0x18,	%l4
	call	loop_935
	fmul8sux16	%f26,	%f24,	%f4
	udiv	%o1,	0x1B30,	%o3
	te	%xcc,	0x2
loop_935:
	movg	%icc,	%i5,	%g6
	move	%xcc,	%l6,	%g1
	alignaddr	%i7,	%g4,	%o2
	udivx	%g5,	0x1FCE,	%o6
	movrgez	%g3,	0x349,	%g7
	addccc	%o5,	%o7,	%l2
	bn,pt	%icc,	loop_936
	membar	0x50
	tneg	%icc,	0x1
	tne	%xcc,	0x6
loop_936:
	fpadd16s	%f12,	%f11,	%f16
	mulx	%l5,	%l3,	%l1
	sra	%g2,	0x15,	%i4
	fzero	%f26
	edge8l	%i2,	%o0,	%i0
	subc	%i3,	0x1D3A,	%l0
	call	loop_937
	alignaddr	%i6,	%i1,	%o4
	fbue	%fcc3,	loop_938
	fbule	%fcc3,	loop_939
loop_937:
	subc	%o1,	0x1AD6,	%l4
	taddcctv	%o3,	%i5,	%g6
loop_938:
	subcc	%g1,	0x0A29,	%i7
loop_939:
	fandnot1	%f2,	%f0,	%f4
	alignaddr	%g4,	%l6,	%g5
	srlx	%o6,	%g3,	%g7
	fpadd32	%f8,	%f0,	%f26
	fmul8ulx16	%f0,	%f12,	%f4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnorcc	%o5,	0x1FBB,	%o7
	tvs	%xcc,	0x7
	movrgez	%o2,	%l2,	%l3
	stx	%l5,	[%l7 + 0x68]
	popc	%l1,	%i4
	fmovrdlz	%i2,	%f18,	%f4
	movrlz	%o0,	0x38F,	%i0
	fbg	%fcc3,	loop_940
	edge32ln	%i3,	%g2,	%i6
	fmovscs	%icc,	%f20,	%f1
	wr	%g0,	0x23,	%asi
	stwa	%i1,	[%l7 + 0x30] %asi
	membar	#Sync
loop_940:
	movrne	%o4,	0x2AF,	%l0
	srax	%l4,	%o1,	%o3
	sra	%g6,	%i5,	%i7
	mova	%xcc,	%g4,	%g1
	tsubcctv	%l6,	%g5,	%g3
	udivcc	%g7,	0x027C,	%o5
	addcc	%o6,	0x1F72,	%o7
	smulcc	%o2,	0x1A37,	%l3
	addc	%l2,	0x0B70,	%l1
	move	%icc,	%i4,	%l5
	ble,a,pt	%xcc,	loop_941
	bvc,a,pt	%xcc,	loop_942
	alignaddrl	%i2,	%i0,	%o0
	movvs	%icc,	%g2,	%i3
loop_941:
	addc	%i6,	0x09F2,	%i1
loop_942:
	edge16l	%l0,	%l4,	%o4
	addccc	%o1,	%g6,	%o3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movge	%icc,	%i7,	%i5
	tl	%icc,	0x0
	movle	%xcc,	%g4,	%l6
	edge8	%g5,	%g3,	%g1
	movn	%xcc,	%g7,	%o5
	sll	%o6,	0x19,	%o2
	mulx	%l3,	0x0FEE,	%l2
	fmovsle	%icc,	%f7,	%f17
	udivx	%o7,	0x0CBA,	%i4
	movcc	%icc,	%l5,	%i2
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
	brgz,a	%i0,	loop_944
	edge32l	%o0,	%l1,	%i3
	sdivcc	%i6,	0x09E3,	%g2
loop_943:
	andn	%l0,	%i1,	%o4
loop_944:
	srax	%o1,	%l4,	%g6
	sdivcc	%o3,	0x1CD9,	%i5
	edge8n	%g4,	%i7,	%l6
	movvc	%icc,	%g5,	%g1
	add	%g7,	%o5,	%g3
	addccc	%o6,	0x19AF,	%l3
	edge16l	%o2,	%l2,	%o7
	fmovdcs	%icc,	%f29,	%f3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tsubcc	%l5,	0x1CB9,	%i2
	edge8ln	%i4,	%o0,	%i0
	fnand	%f14,	%f6,	%f8
	srlx	%i3,	0x15,	%i6
	edge16	%g2,	%l1,	%i1
	wr	%g0,	0x81,	%asi
	lduba	[%l7 + 0x4C] %asi,	%l0
	fpadd16	%f6,	%f28,	%f20
	smulcc	%o1,	%l4,	%o4
	brlez	%o3,	loop_945
	fmovsge	%icc,	%f19,	%f1
	fmovrdgez	%i5,	%f14,	%f26
	movvs	%icc,	%g4,	%i7
loop_945:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array8	%l6,	%g5,	%g6
	stbar
	fblg	%fcc0,	loop_946
	ba,a	loop_947
	edge32ln	%g1,	%g7,	%g3
	ldd	[%l7 + 0x78],	%o6
loop_946:
	tcs	%xcc,	0x4
loop_947:
	move	%xcc,	%l3,	%o2
	sdivcc	%l2,	0x08ED,	%o7
	edge8	%l5,	%o5,	%i4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stx	%i2,	[%l7 + 0x58]
	xnorcc	%o0,	%i0,	%i6
	umulcc	%g2,	0x14C5,	%l1
	mova	%icc,	%i1,	%i3
	set	0x6C, %l5
	lduha	[%l7 + %l5] 0x10,	%o1
	fba	%fcc1,	loop_948
	movrlz	%l0,	%l4,	%o4
	fandnot1s	%f10,	%f10,	%f6
	fbug,a	%fcc2,	loop_949
loop_948:
	fmuld8sux16	%f5,	%f7,	%f12
	alignaddrl	%i5,	%o3,	%i7
	edge8ln	%g4,	%g5,	%l6
loop_949:
	fbl,a	%fcc2,	loop_950
	srl	%g1,	%g7,	%g3
	tle	%xcc,	0x3
	wr	%g0,	0x89,	%asi
	ldsha	[%l7 + 0x22] %asi,	%g6
loop_950:
	xor	%o6,	%l3,	%o2
	be,pt	%xcc,	loop_951
	edge8l	%l2,	%l5,	%o5
	fzero	%f2
	st	%f11,	[%l7 + 0x64]
loop_951:
	flush	%l7 + 0x68
	fpadd16s	%f6,	%f20,	%f10
	andn	%o7,	0x176D,	%i4
	ldx	[%l7 + 0x08],	%i2
	bneg,a	loop_952
	movgu	%xcc,	%o0,	%i6
	edge8ln	%g2,	%i0,	%i1
	addc	%i3,	0x193A,	%l1
loop_952:
	ble,a	loop_953
	ldd	[%l7 + 0x28],	%f16
	tsubcc	%l0,	%l4,	%o4
	std	%f4,	[%l7 + 0x30]
loop_953:
	nop
	set	0x4C, %o1
	stwa	%o1,	[%l7 + %o1] 0x04
	sra	%i5,	0x15,	%i7
	subc	%o3,	%g5,	%l6
	sra	%g4,	0x0C,	%g1
	fandnot1	%f6,	%f24,	%f4
	fmovdne	%xcc,	%f11,	%f26
	fandnot2	%f18,	%f0,	%f22
	sdivx	%g7,	0x00CE,	%g6
	array8	%g3,	%l3,	%o2
	movvs	%xcc,	%l2,	%l5
	alignaddr	%o6,	%o5,	%o7
	wr	%g0,	0x10,	%asi
	sta	%f4,	[%l7 + 0x40] %asi
	smul	%i4,	%o0,	%i6
	te	%icc,	0x2
	nop
	set	0x3C, %o3
	ldsw	[%l7 + %o3],	%g2
	alignaddr	%i2,	%i1,	%i3
	bcc,a,pt	%xcc,	loop_954
	tle	%icc,	0x4
	tge	%icc,	0x3
	udiv	%i0,	0x172F,	%l1
loop_954:
	edge8ln	%l4,	%o4,	%l0
	edge32n	%i5,	%i7,	%o3
	ldd	[%l7 + 0x30],	%g4
	fbo,a	%fcc1,	loop_955
	mulx	%o1,	0x103A,	%l6
	smulcc	%g1,	0x17AC,	%g4
	sll	%g6,	%g7,	%g3
loop_955:
	fnands	%f17,	%f28,	%f28
	alignaddr	%l3,	%l2,	%o2
	andncc	%o6,	%l5,	%o5
	movgu	%icc,	%o7,	%i4
	tneg	%xcc,	0x4
	edge32n	%o0,	%i6,	%g2
	fnors	%f17,	%f11,	%f14
	membar	0x4C
	fmovrsne	%i1,	%f15,	%f29
	tcs	%xcc,	0x2
	fcmple16	%f30,	%f16,	%i3
	stbar
	sdivx	%i2,	0x12EA,	%l1
	movrne	%i0,	0x079,	%o4
	movre	%l0,	%i5,	%i7
	fmovsg	%xcc,	%f29,	%f28
	fbug	%fcc2,	loop_956
	fpsub32	%f8,	%f30,	%f22
	tl	%icc,	0x7
	edge8ln	%l4,	%o3,	%g5
loop_956:
	membar	0x24
	edge32n	%o1,	%l6,	%g1
	sdivx	%g6,	0x13E9,	%g7
	wr	%g0,	0x52,	%asi
	stxa	%g4,	[%g0 + 0x208] %asi
	fmovsl	%icc,	%f19,	%f12
	nop
	set	0x15, %i0
	ldub	[%l7 + %i0],	%g3
	srl	%l3,	0x13,	%o2
	fmovrsne	%o6,	%f25,	%f29
	movcs	%icc,	%l2,	%l5
	srax	%o7,	%i4,	%o5
	orcc	%i6,	0x1EBD,	%g2
	fmovsvs	%xcc,	%f24,	%f10
	mulscc	%o0,	%i1,	%i2
	ta	%xcc,	0x3
	subc	%i3,	0x1546,	%l1
	edge8l	%o4,	%i0,	%i5
	addcc	%l0,	%i7,	%o3
	movleu	%icc,	%l4,	%g5
	sir	0x0AF1
	andncc	%o1,	%g1,	%g6
	fcmpeq32	%f6,	%f22,	%g7
	movre	%g4,	0x04A,	%g3
	ldx	[%l7 + 0x78],	%l6
	array32	%o2,	%o6,	%l3
	fbn	%fcc3,	loop_957
	sir	0x0A89
	fones	%f3
	fcmpes	%fcc3,	%f26,	%f16
loop_957:
	edge8	%l5,	%o7,	%i4
	bcc,a,pt	%icc,	loop_958
	umulcc	%l2,	0x0EEC,	%i6
	tleu	%icc,	0x5
	wr	%g0,	0x10,	%asi
	lduba	[%l7 + 0x63] %asi,	%g2
loop_958:
	movgu	%icc,	%o0,	%o5
	fmovsneg	%xcc,	%f6,	%f8
	movneg	%icc,	%i1,	%i3
	wr	%g0,	0x89,	%asi
	ldswa	[%l7 + 0x1C] %asi,	%i2
	fabss	%f13,	%f22
	fxor	%f12,	%f22,	%f8
	add	%l7,	0x40,	%l6
	wr	%g0,	0x19,	%asi
	casa	[%l6] %asi,	%l1,	%o4
	st	%f29,	[%l7 + 0x4C]
	fsrc1s	%f0,	%f24
	xnorcc	%i5,	0x01AE,	%i0
	fnand	%f16,	%f14,	%f24
	mulx	%l0,	0x0296,	%i7
	edge8l	%l4,	%o3,	%g5
	lduw	[%l7 + 0x0C],	%o1
	te	%xcc,	0x7
	fors	%f27,	%f24,	%f17
	move	%xcc,	%g1,	%g7
	udiv	%g6,	0x0759,	%g4
	movg	%xcc,	%l6,	%o2
	brlez	%o6,	loop_959
	fxor	%f14,	%f10,	%f10
	sub	%l3,	0x0C02,	%l5
	ldx	[%l7 + 0x70],	%o7
loop_959:
	fmovscc	%xcc,	%f0,	%f25
	move	%icc,	%g3,	%l2
	movrlz	%i4,	%i6,	%g2
	xorcc	%o0,	%o5,	%i1
	movge	%icc,	%i2,	%l1
	membar	0x09
	prefetch	[%l7 + 0x78],	 0x2
	bl,a	%xcc,	loop_960
	move	%xcc,	%o4,	%i5
	movleu	%xcc,	%i3,	%i0
	movle	%icc,	%i7,	%l4
loop_960:
	fbn	%fcc0,	loop_961
	edge16l	%l0,	%g5,	%o1
	tcs	%xcc,	0x0
	movrlz	%g1,	%o3,	%g7
loop_961:
	sdivcc	%g4,	0x1949,	%l6
	orcc	%o2,	%o6,	%g6
	fmovrdgez	%l5,	%f28,	%f20
	movne	%icc,	%o7,	%g3
	add	%l2,	0x019E,	%l3
	bl,a	loop_962
	sir	0x16CB
	andncc	%i6,	%g2,	%i4
	movrlz	%o5,	0x1F4,	%i1
loop_962:
	fmul8x16au	%f3,	%f17,	%f16
	sir	0x01E3
	bcc,a	loop_963
	edge32l	%o0,	%l1,	%o4
	edge16n	%i2,	%i3,	%i5
	xnor	%i7,	0x11CD,	%i0
loop_963:
	fbu	%fcc2,	loop_964
	stw	%l0,	[%l7 + 0x60]
	tneg	%xcc,	0x7
	movge	%icc,	%g5,	%o1
loop_964:
	movvs	%icc,	%l4,	%g1
	fornot1	%f20,	%f8,	%f20
	addcc	%g7,	%o3,	%l6
	wr	%g0,	0x0c,	%asi
	ldsha	[%l7 + 0x58] %asi,	%g4
	ldsw	[%l7 + 0x30],	%o6
	edge8ln	%o2,	%l5,	%g6
	nop
	setx	loop_965,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fandnot2	%f10,	%f4,	%f12
	orncc	%g3,	%o7,	%l2
	alignaddrl	%l3,	%i6,	%g2
loop_965:
	fnegd	%f8,	%f10
	edge32l	%o5,	%i1,	%o0
	ldd	[%l7 + 0x20],	%l0
	fmovsleu	%icc,	%f3,	%f9
	bvc	%icc,	loop_966
	fornot2s	%f28,	%f5,	%f2
	swap	[%l7 + 0x1C],	%o4
	fbn,a	%fcc3,	loop_967
loop_966:
	fmovsleu	%icc,	%f13,	%f9
	bcs,pt	%xcc,	loop_968
	alignaddrl	%i4,	%i2,	%i3
loop_967:
	movcc	%xcc,	%i7,	%i0
	tne	%xcc,	0x6
loop_968:
	bg,a,pn	%xcc,	loop_969
	fbo	%fcc3,	loop_970
	sll	%i5,	%g5,	%l0
	srax	%l4,	0x06,	%g1
loop_969:
	mova	%xcc,	%o1,	%g7
loop_970:
	movle	%icc,	%o3,	%g4
	movneg	%xcc,	%o6,	%l6
	edge16l	%o2,	%l5,	%g6
	wr	%g0,	0x18,	%asi
	lda	[%l7 + 0x44] %asi,	%f25
	sdivcc	%g3,	0x0559,	%o7
	or	%l2,	0x0C16,	%i6
	taddcc	%g2,	0x05AB,	%o5
	fabsd	%f20,	%f14
	fbg	%fcc2,	loop_971
	sdivcc	%i1,	0x18C6,	%l3
	or	%o0,	%o4,	%i4
	be	%icc,	loop_972
loop_971:
	andn	%l1,	0x1F75,	%i2
	tcs	%xcc,	0x3
	fmovsgu	%icc,	%f3,	%f3
loop_972:
	fpadd16s	%f30,	%f17,	%f0
	fandnot1	%f24,	%f10,	%f22
	fmovdne	%xcc,	%f11,	%f30
	tge	%xcc,	0x4
	fnot1s	%f4,	%f29
	nop
	setx loop_973, %l0, %l1
	jmpl %l1, %i7
	ba	loop_974
	subccc	%i0,	%i5,	%g5
	wr	%g0,	0xe3,	%asi
	stda	%i2,	[%l7 + 0x48] %asi
	membar	#Sync
loop_973:
	fmovdne	%icc,	%f22,	%f0
loop_974:
	fmul8x16	%f30,	%f24,	%f30
	movn	%icc,	%l4,	%g1
	membar	0x2B
	brlz	%l0,	loop_975
	srl	%o1,	0x0C,	%g7
	te	%icc,	0x0
	fexpand	%f3,	%f30
loop_975:
	and	%g4,	0x002B,	%o6
	fbe,a	%fcc2,	loop_976
	sdivcc	%o3,	0x1E49,	%o2
	ld	[%l7 + 0x1C],	%f3
	edge32l	%l5,	%l6,	%g3
loop_976:
	nop
	setx	loop_977,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fnor	%f4,	%f28,	%f12
	flush	%l7 + 0x64
	edge32ln	%g6,	%l2,	%o7
loop_977:
	movg	%xcc,	%g2,	%i6
	movvc	%icc,	%i1,	%o5
	edge8	%l3,	%o0,	%i4
	fsrc2	%f24,	%f30
	tl	%xcc,	0x6
	add	%l1,	0x04BC,	%o4
	movrgez	%i7,	%i0,	%i2
	srax	%g5,	0x11,	%i3
	subccc	%l4,	%g1,	%i5
	alignaddrl	%o1,	%l0,	%g4
	sdiv	%o6,	0x1D82,	%g7
	movrgez	%o3,	%l5,	%o2
	fexpand	%f20,	%f6
	bneg,a,pn	%xcc,	loop_978
	bl	%xcc,	loop_979
	srlx	%l6,	%g3,	%l2
	ldsh	[%l7 + 0x7A],	%o7
loop_978:
	ldsh	[%l7 + 0x4A],	%g2
loop_979:
	nop
	wr	%g0,	0x11,	%asi
	stwa	%g6,	[%l7 + 0x38] %asi
	set	0x5A, %o2
	ldsha	[%l7 + %o2] 0x15,	%i1
	movrgz	%i6,	%o5,	%l3
	fmovdne	%xcc,	%f4,	%f11
	movne	%xcc,	%o0,	%i4
	fandnot2	%f4,	%f0,	%f8
	sth	%o4,	[%l7 + 0x74]
	subcc	%i7,	%l1,	%i0
	tle	%xcc,	0x5
	add	%g5,	0x09AF,	%i2
	taddcctv	%i3,	%l4,	%g1
	tleu	%xcc,	0x7
	movrgz	%o1,	%l0,	%g4
	sdivx	%i5,	0x1C71,	%o6
	sir	0x0552
	tle	%icc,	0x1
	fbe	%fcc0,	loop_980
	sll	%o3,	%l5,	%g7
	taddcc	%l6,	%g3,	%o2
	movpos	%xcc,	%l2,	%g2
loop_980:
	edge32l	%o7,	%i1,	%g6
	movvc	%icc,	%i6,	%o5
	fpsub32	%f16,	%f2,	%f2
	ta	%icc,	0x6
	fmovsle	%icc,	%f12,	%f12
	fmovrsgez	%l3,	%f25,	%f10
	fbul,a	%fcc3,	loop_981
	fbue	%fcc2,	loop_982
	srl	%i4,	0x10,	%o0
	taddcctv	%i7,	%l1,	%o4
loop_981:
	sethi	0x0B52,	%g5
loop_982:
	nop
	set	0x3C, %l6
	stha	%i0,	[%l7 + %l6] 0x04
	swap	[%l7 + 0x60],	%i2
	orn	%i3,	%g1,	%l4
	tne	%icc,	0x7
	stbar
	wr	%g0,	0x80,	%asi
	lduha	[%l7 + 0x54] %asi,	%l0
	xor	%g4,	0x102C,	%o1
	wr	%g0,	0x23,	%asi
	ldda	[%l7 + 0x10] %asi,	%o6
	and	%i5,	0x1C8D,	%l5
	sra	%o3,	0x04,	%l6
	movgu	%icc,	%g7,	%g3
	te	%xcc,	0x6
	fone	%f0
	fabsd	%f14,	%f10
	mulscc	%l2,	%g2,	%o7
	movneg	%xcc,	%o2,	%i1
	fmovsneg	%xcc,	%f12,	%f22
	tpos	%xcc,	0x5
	bge,pn	%xcc,	loop_983
	taddcc	%g6,	0x102A,	%i6
	edge16ln	%o5,	%i4,	%o0
	stb	%i7,	[%l7 + 0x69]
loop_983:
	nop
	wr	%g0,	0x89,	%asi
	lduba	[%l7 + 0x1F] %asi,	%l1
	movl	%icc,	%l3,	%g5
	bl,pn	%icc,	loop_984
	movl	%xcc,	%o4,	%i2
	nop
	setx	loop_985,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movne	%xcc,	%i0,	%g1
loop_984:
	nop
	wr	%g0,	0x18,	%asi
	lduba	[%l7 + 0x40] %asi,	%l4
loop_985:
	add	%i3,	0x09AC,	%l0
	tsubcc	%o1,	%g4,	%i5
	movvs	%icc,	%o6,	%o3
	fbul,a	%fcc1,	loop_986
	fbe	%fcc0,	loop_987
	array8	%l5,	%l6,	%g7
	srlx	%l2,	0x08,	%g3
loop_986:
	movleu	%icc,	%o7,	%g2
loop_987:
	ldsw	[%l7 + 0x4C],	%o2
	movrne	%i1,	0x314,	%i6
	srl	%o5,	0x01,	%i4
	bcc	loop_988
	fone	%f18
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array16	%o0,	%i7,	%g6
loop_988:
	fmovda	%xcc,	%f15,	%f2
	ldstub	[%l7 + 0x09],	%l1
	sth	%g5,	[%l7 + 0x64]
	taddcc	%o4,	0x0AC5,	%i2
	fpackfix	%f28,	%f19
	fmovs	%f5,	%f4
	tsubcctv	%l3,	0x0667,	%i0
	tsubcc	%g1,	%l4,	%l0
	sdivx	%o1,	0x1818,	%g4
	subccc	%i3,	%o6,	%o3
	brgz	%i5,	loop_989
	tvs	%icc,	0x1
	fble,a	%fcc1,	loop_990
	udiv	%l6,	0x1CDF,	%g7
loop_989:
	fbn,a	%fcc3,	loop_991
	fpadd32s	%f19,	%f18,	%f18
loop_990:
	movcc	%xcc,	%l2,	%l5
	tsubcctv	%o7,	0x1B23,	%g3
loop_991:
	movl	%xcc,	%o2,	%i1
	ble,a,pn	%icc,	loop_992
	fmul8x16au	%f15,	%f29,	%f8
	sethi	0x0D36,	%i6
	movn	%icc,	%g2,	%i4
loop_992:
	udivcc	%o5,	0x01BC,	%i7
	andcc	%o0,	0x14F2,	%g6
	movgu	%xcc,	%g5,	%l1
	fnors	%f15,	%f31,	%f15
	brlez,a	%o4,	loop_993
	lduh	[%l7 + 0x4C],	%i2
	ldsw	[%l7 + 0x68],	%l3
	fxnor	%f10,	%f0,	%f22
loop_993:
	tleu	%icc,	0x2
	fmul8x16	%f25,	%f12,	%f30
	movpos	%xcc,	%i0,	%l4
	movvc	%icc,	%l0,	%o1
	fnegs	%f12,	%f20
	tneg	%icc,	0x0
	set	0x5E, %l0
	stba	%g1,	[%l7 + %l0] 0x2a
	membar	#Sync
	smulcc	%i3,	0x08F7,	%g4
	set	0x50, %i2
	prefetcha	[%l7 + %i2] 0x10,	 0x2
	xorcc	%o3,	%l6,	%i5
	fpadd16	%f8,	%f8,	%f6
	movge	%icc,	%l2,	%g7
	tge	%xcc,	0x4
	fmovsle	%xcc,	%f10,	%f15
	fmovsleu	%icc,	%f31,	%f3
	fzero	%f20
	edge32n	%o7,	%l5,	%g3
	set	0x78, %o6
	ldsha	[%l7 + %o6] 0x88,	%o2
	movgu	%xcc,	%i6,	%g2
	andn	%i4,	0x12E3,	%o5
	call	loop_994
	bcs,a,pn	%icc,	loop_995
	srl	%i1,	0x03,	%i7
	ldsb	[%l7 + 0x14],	%g6
loop_994:
	umulcc	%g5,	0x18A0,	%l1
loop_995:
	stw	%o4,	[%l7 + 0x64]
	andcc	%o0,	0x084F,	%l3
	fmovspos	%xcc,	%f21,	%f13
	edge8n	%i0,	%i2,	%l0
	fandnot2	%f8,	%f10,	%f8
	tl	%xcc,	0x0
	fmovsneg	%xcc,	%f19,	%f11
	edge8n	%o1,	%l4,	%g1
	fmuld8ulx16	%f10,	%f24,	%f30
	tsubcc	%g4,	%i3,	%o3
	movre	%o6,	%i5,	%l6
	fmovse	%xcc,	%f0,	%f16
	brgez	%l2,	loop_996
	sth	%g7,	[%l7 + 0x4A]
	subc	%l5,	0x0B97,	%o7
	tneg	%xcc,	0x2
loop_996:
	movpos	%icc,	%g3,	%i6
	orcc	%o2,	0x0707,	%g2
	xnor	%o5,	0x19BC,	%i1
	nop
	setx loop_997, %l0, %l1
	jmpl %l1, %i4
	fmovrsgez	%i7,	%f12,	%f21
	wr	%g0,	0x04,	%asi
	sta	%f14,	[%l7 + 0x28] %asi
loop_997:
	ble,a,pn	%icc,	loop_998
	movrgz	%g6,	%g5,	%o4
	movle	%icc,	%o0,	%l1
	fbu,a	%fcc0,	loop_999
loop_998:
	addccc	%l3,	%i0,	%l0
	xnorcc	%o1,	0x1E78,	%i2
	movl	%xcc,	%l4,	%g4
loop_999:
	bn,a	%icc,	loop_1000
	udivcc	%g1,	0x0B8E,	%o3
	fnot2	%f8,	%f18
	andncc	%o6,	%i3,	%i5
loop_1000:
	nop
	wr	%g0,	0x80,	%asi
	lduba	[%l7 + 0x28] %asi,	%l6
	movn	%xcc,	%g7,	%l2
	add	%l7,	0x08,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] %asi,	%o7,	%g3
	sth	%i6,	[%l7 + 0x1E]
	subccc	%o2,	0x054F,	%l5
	udivx	%g2,	0x167D,	%o5
	movne	%icc,	%i4,	%i1
	fmovdvs	%icc,	%f7,	%f29
	fmovdcc	%icc,	%f13,	%f28
	fmovdleu	%xcc,	%f15,	%f24
	sllx	%i7,	0x11,	%g5
	ldd	[%l7 + 0x60],	%f2
	taddcctv	%o4,	0x1650,	%g6
	fmovsne	%icc,	%f25,	%f30
	addcc	%o0,	%l1,	%l3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x18,	%asi
	stha	%i0,	[%l7 + 0x28] %asi
	movgu	%xcc,	%o1,	%l0
	ldsw	[%l7 + 0x40],	%i2
	fabsd	%f8,	%f12
	movcc	%icc,	%g4,	%l4
	fbue	%fcc2,	loop_1001
	fmovdge	%xcc,	%f20,	%f19
	set	0x08, %g2
	stxa	%g1,	[%l7 + %g2] 0x10
loop_1001:
	nop
	membar	#Sync
	wr	%g0,	0x16,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	andn	%o6,	0x084A,	%i3
	membar	0x5A
	stbar
	movvs	%icc,	%i5,	%o3
	fblg	%fcc0,	loop_1002
	fbul,a	%fcc0,	loop_1003
	movle	%icc,	%g7,	%l2
	fmovsa	%xcc,	%f4,	%f16
loop_1002:
	sub	%o7,	%g3,	%i6
loop_1003:
	movre	%l6,	%l5,	%o2
	fabss	%f28,	%f22
	membar	0x12
	te	%icc,	0x6
	tn	%xcc,	0x7
	xor	%o5,	0x1063,	%g2
	fzeros	%f23
	fblg	%fcc1,	loop_1004
	fornot1	%f2,	%f6,	%f2
	ldsh	[%l7 + 0x3A],	%i1
	array16	%i7,	%i4,	%o4
loop_1004:
	fmovsvs	%xcc,	%f4,	%f10
	fbg,a	%fcc3,	loop_1005
	edge8n	%g5,	%o0,	%g6
	ldx	[%l7 + 0x40],	%l3
	wr	%g0,	0x04,	%asi
	ldstuba	[%l7 + 0x11] %asi,	%l1
loop_1005:
	sra	%o1,	%i0,	%l0
	popc	0x1376,	%g4
	edge32l	%i2,	%l4,	%g1
	movgu	%xcc,	%o6,	%i3
	udivcc	%i5,	0x1014,	%o3
	sdivx	%g7,	0x110F,	%l2
	movrgz	%o7,	%i6,	%g3
	movvc	%xcc,	%l6,	%l5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tneg	%xcc,	0x5
	tsubcc	%o5,	0x0C8C,	%o2
	movre	%i1,	%g2,	%i4
	tcs	%xcc,	0x5
	ld	[%l7 + 0x54],	%f2
	movl	%icc,	%i7,	%g5
	fble	%fcc2,	loop_1006
	fmovsvc	%xcc,	%f10,	%f16
	fbne,a	%fcc0,	loop_1007
	and	%o0,	%o4,	%g6
loop_1006:
	xor	%l1,	%o1,	%l3
	sdivcc	%i0,	0x19F4,	%l0
loop_1007:
	movle	%xcc,	%g4,	%l4
	movrlez	%i2,	%g1,	%i3
	bcc	loop_1008
	movre	%o6,	0x03C,	%o3
	fbu	%fcc0,	loop_1009
	brlez,a	%i5,	loop_1010
loop_1008:
	andn	%l2,	0x12BE,	%o7
	mulscc	%i6,	0x1356,	%g7
loop_1009:
	lduw	[%l7 + 0x44],	%g3
loop_1010:
	edge8n	%l5,	%o5,	%o2
	nop
	set	0x68, %l3
	std	%i6,	[%l7 + %l3]
	ldd	[%l7 + 0x10],	%g2
	call	loop_1011
	movn	%xcc,	%i1,	%i4
	taddcc	%i7,	%g5,	%o0
	set	0x60, %i7
	lda	[%l7 + %i7] 0x81,	%f22
loop_1011:
	udiv	%o4,	0x0035,	%l1
	subcc	%o1,	0x0EEE,	%g6
	mova	%icc,	%i0,	%l3
	fbul	%fcc3,	loop_1012
	brz,a	%g4,	loop_1013
	taddcc	%l0,	0x13ED,	%i2
	orncc	%l4,	0x0595,	%g1
loop_1012:
	edge8	%o6,	%i3,	%i5
loop_1013:
	movg	%xcc,	%l2,	%o7
	brlz	%o3,	loop_1014
	brlz,a	%g7,	loop_1015
	tvc	%icc,	0x1
	addcc	%i6,	%l5,	%g3
loop_1014:
	nop
	wr	%g0,	0xf9,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
loop_1015:
	nop
	wr	%g0,	0x80,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	movvc	%xcc,	%o2,	%l6
	and	%o5,	%i1,	%i4
	or	%g2,	0x1859,	%g5
	movrlz	%i7,	0x20C,	%o0
	fone	%f4
	sethi	0x07F8,	%l1
	movrgez	%o1,	%g6,	%i0
	ta	%icc,	0x4
	fmovse	%icc,	%f21,	%f10
	sir	0x0F3C
	move	%icc,	%o4,	%l3
	tcs	%xcc,	0x5
	andn	%g4,	%i2,	%l0
	sdivcc	%l4,	0x1490,	%o6
	fsrc1s	%f31,	%f24
	fnand	%f6,	%f14,	%f22
	ble,pt	%icc,	loop_1016
	movrlez	%i3,	0x208,	%g1
	fmovdge	%xcc,	%f20,	%f15
	be,a	%icc,	loop_1017
loop_1016:
	smulcc	%l2,	%i5,	%o3
	orn	%o7,	%g7,	%i6
	fsrc2s	%f16,	%f7
loop_1017:
	edge16	%l5,	%g3,	%l6
	wr	%g0,	0x19,	%asi
	prefetcha	[%l7 + 0x08] %asi,	 0x0
	bge,pt	%xcc,	loop_1018
	xor	%i1,	0x1C54,	%o5
	fnors	%f15,	%f9,	%f29
	bpos	%xcc,	loop_1019
loop_1018:
	andn	%g2,	0x0AB7,	%g5
	add	%i4,	0x00FB,	%o0
	fcmped	%fcc1,	%f26,	%f14
loop_1019:
	sll	%l1,	%o1,	%g6
	sir	0x08D5
	addcc	%i7,	%o4,	%i0
	fbge	%fcc3,	loop_1020
	edge16	%l3,	%i2,	%g4
	st	%f20,	[%l7 + 0x4C]
	tpos	%icc,	0x0
loop_1020:
	fmovdcs	%xcc,	%f23,	%f20
	set	0x0A, %l1
	ldsha	[%l7 + %l1] 0x14,	%l0
	fcmpgt32	%f2,	%f6,	%o6
	subcc	%i3,	0x084B,	%l4
	wr	%g0,	0x11,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	fzeros	%f6
	ld	[%l7 + 0x64],	%f19
	smulcc	%l2,	0x1DEA,	%g1
	bvc,pt	%icc,	loop_1021
	sir	0x057B
	fmul8sux16	%f30,	%f0,	%f0
	fnands	%f30,	%f13,	%f15
loop_1021:
	sdiv	%o3,	0x0910,	%i5
	wr	%g0,	0x04,	%asi
	stha	%g7,	[%l7 + 0x7E] %asi
	xnor	%o7,	0x04C5,	%i6
	or	%l5,	%l6,	%g3
	fors	%f28,	%f4,	%f16
	tvs	%icc,	0x5
	sll	%i1,	0x1E,	%o2
	tpos	%xcc,	0x7
	set	0x20, %o4
	ldswa	[%l7 + %o4] 0x81,	%o5
	tl	%xcc,	0x4
	ba,pn	%xcc,	loop_1022
	fands	%f19,	%f5,	%f3
	wr	%g0,	0x18,	%asi
	lduwa	[%l7 + 0x44] %asi,	%g5
loop_1022:
	nop
	wr	%g0,	0x81,	%asi
	ldxa	[%l7 + 0x28] %asi,	%g2
	set	0x08, %l4
	stha	%i4,	[%l7 + %l4] 0x0c
	ldsw	[%l7 + 0x38],	%o0
	sethi	0x1BA8,	%o1
	sir	0x0F19
	edge8	%l1,	%i7,	%g6
	ld	[%l7 + 0x44],	%f30
	smul	%o4,	0x1F23,	%i0
	stw	%i2,	[%l7 + 0x20]
	brgz	%l3,	loop_1023
	membar	0x05
	andn	%g4,	%l0,	%o6
	or	%l4,	%l2,	%i3
loop_1023:
	movcc	%icc,	%g1,	%o3
	movleu	%xcc,	%i5,	%o7
	bg	%xcc,	loop_1024
	bvc,a,pn	%icc,	loop_1025
	bne,a,pt	%icc,	loop_1026
	fmovde	%icc,	%f16,	%f1
loop_1024:
	fmul8x16	%f16,	%f26,	%f28
loop_1025:
	movleu	%xcc,	%i6,	%l5
loop_1026:
	membar	0x65
	subc	%l6,	%g3,	%i1
	alignaddr	%o2,	%o5,	%g5
	fandnot1s	%f13,	%f0,	%f12
	tgu	%icc,	0x7
	ta	%xcc,	0x3
	bne,a	%icc,	loop_1027
	udivcc	%g2,	0x093A,	%i4
	call	loop_1028
	bl,pt	%xcc,	loop_1029
loop_1027:
	fnot1s	%f20,	%f6
	fnand	%f4,	%f6,	%f6
loop_1028:
	sra	%o0,	0x16,	%o1
loop_1029:
	udivcc	%l1,	0x1373,	%i7
	umul	%g6,	0x0E82,	%o4
	and	%g7,	0x0FB6,	%i0
	membar	#Sync
	wr	%g0,	0x16,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	nop
	set	0x5C, %o0
	ldsw	[%l7 + %o0],	%l3
	xnorcc	%g4,	%l0,	%o6
	fbge,a	%fcc3,	loop_1030
	mulx	%i2,	%l2,	%i3
	tvc	%xcc,	0x1
	fbug	%fcc0,	loop_1031
loop_1030:
	alignaddrl	%l4,	%o3,	%g1
	edge8	%i5,	%i6,	%l5
	tge	%icc,	0x1
loop_1031:
	bpos	%icc,	loop_1032
	fmovsleu	%icc,	%f9,	%f30
	mulx	%o7,	0x0A40,	%g3
	fsrc2	%f12,	%f16
loop_1032:
	array32	%i1,	%l6,	%o5
	movcs	%icc,	%g5,	%o2
	edge16ln	%i4,	%g2,	%o0
	ldstub	[%l7 + 0x7C],	%o1
	addcc	%i7,	0x006D,	%g6
	srax	%l1,	0x0C,	%g7
	movrgez	%o4,	0x043,	%i0
	fmul8ulx16	%f30,	%f20,	%f30
	fmovsa	%icc,	%f13,	%f28
	array32	%g4,	%l3,	%l0
	tcs	%icc,	0x5
	movrlz	%i2,	0x126,	%l2
	fnands	%f18,	%f17,	%f21
	bg	loop_1033
	fcmpes	%fcc1,	%f14,	%f25
	edge8n	%o6,	%i3,	%o3
	sllx	%l4,	0x0F,	%i5
loop_1033:
	tsubcctv	%g1,	0x10AC,	%l5
	edge32ln	%i6,	%o7,	%i1
	movre	%g3,	%o5,	%l6
	fcmpne16	%f8,	%f6,	%o2
	tg	%icc,	0x2
	bneg,a,pn	%xcc,	loop_1034
	movvs	%icc,	%g5,	%g2
	movrlez	%i4,	%o1,	%i7
	movleu	%icc,	%g6,	%l1
loop_1034:
	movcs	%xcc,	%g7,	%o4
	fpsub32s	%f19,	%f30,	%f18
	fandnot2	%f6,	%f10,	%f24
	edge16	%o0,	%g4,	%i0
	tvc	%icc,	0x7
	tsubcctv	%l0,	%l3,	%i2
	smulcc	%o6,	%i3,	%o3
	udiv	%l4,	0x0F57,	%i5
	mulx	%l2,	0x19D2,	%g1
	fmuld8sux16	%f31,	%f17,	%f4
	set	0x1C, %o5
	lda	[%l7 + %o5] 0x19,	%f24
	movre	%l5,	0x363,	%o7
	fpmerge	%f24,	%f22,	%f4
	orcc	%i6,	0x08E3,	%i1
	fmovdleu	%xcc,	%f0,	%f4
	be,pn	%xcc,	loop_1035
	ldx	[%l7 + 0x18],	%g3
	movvc	%icc,	%o5,	%o2
	subccc	%g5,	0x0BDA,	%g2
loop_1035:
	fors	%f17,	%f8,	%f1
	srl	%l6,	0x14,	%i4
	fbue	%fcc1,	loop_1036
	smul	%i7,	0x0E63,	%g6
	sllx	%o1,	0x0C,	%l1
	set	0x8, %g1
	stxa	%g7,	[%g0 + %g1] 0x4f
loop_1036:
	edge32l	%o0,	%o4,	%i0
	wr	%g0,	0x89,	%asi
	ldsha	[%l7 + 0x38] %asi,	%l0
	fcmpd	%fcc2,	%f14,	%f2
	ldstub	[%l7 + 0x3E],	%l3
	alignaddr	%i2,	%o6,	%i3
	udivcc	%g4,	0x114E,	%o3
	movpos	%xcc,	%i5,	%l2
	sra	%g1,	%l5,	%l4
	mulscc	%i6,	%o7,	%g3
	fxnors	%f29,	%f21,	%f7
	tcs	%xcc,	0x0
	sethi	0x05DD,	%i1
	movre	%o2,	0x0DB,	%g5
	fabsd	%f12,	%f8
	addccc	%o5,	%g2,	%l6
	fmovrsgez	%i4,	%f17,	%f16
	tg	%xcc,	0x7
	sll	%g6,	0x05,	%i7
	addcc	%l1,	0x1F79,	%o1
	bn	loop_1037
	fand	%f2,	%f30,	%f8
	set	0x0C, %g7
	lda	[%l7 + %g7] 0x88,	%f9
loop_1037:
	udivcc	%g7,	0x01AD,	%o0
	flush	%l7 + 0x58
	tgu	%icc,	0x0
	fmovsl	%xcc,	%f11,	%f29
	edge32n	%o4,	%l0,	%i0
	swap	[%l7 + 0x14],	%l3
	fbn,a	%fcc1,	loop_1038
	addc	%o6,	%i3,	%g4
	fmovrse	%o3,	%f23,	%f16
	fmovrsgz	%i5,	%f0,	%f9
loop_1038:
	sdivcc	%l2,	0x08B3,	%g1
	fmovsvs	%xcc,	%f18,	%f17
	ldx	[%l7 + 0x48],	%l5
	tsubcc	%l4,	0x0577,	%i6
	fmovrsgez	%o7,	%f31,	%f28
	edge32n	%g3,	%i1,	%i2
	movl	%icc,	%g5,	%o5
	tle	%xcc,	0x6
	movl	%xcc,	%g2,	%l6
	tg	%xcc,	0x0
	set	0x6C, %l2
	lda	[%l7 + %l2] 0x15,	%f30
	lduh	[%l7 + 0x38],	%i4
	bgu,a	loop_1039
	fmovsne	%icc,	%f25,	%f28
	set	0x6D, %o7
	ldsba	[%l7 + %o7] 0x0c,	%g6
loop_1039:
	bgu,pt	%icc,	loop_1040
	movn	%xcc,	%o2,	%l1
	fcmpgt16	%f14,	%f26,	%o1
	fornot1	%f20,	%f18,	%f14
loop_1040:
	fsrc2	%f12,	%f20
	fand	%f18,	%f0,	%f28
	fmovdcs	%xcc,	%f1,	%f27
	udiv	%i7,	0x1377,	%o0
	tgu	%icc,	0x7
	stbar
	tneg	%xcc,	0x0
	fmovsneg	%xcc,	%f30,	%f21
	fmovse	%icc,	%f22,	%f13
	fmovspos	%icc,	%f5,	%f5
	orn	%o4,	%g7,	%l0
	fcmpes	%fcc0,	%f15,	%f4
	movrgz	%i0,	%l3,	%o6
	fbe	%fcc1,	loop_1041
	addccc	%i3,	%g4,	%i5
	wr	%g0,	0x18,	%asi
	ldstuba	[%l7 + 0x09] %asi,	%o3
loop_1041:
	fnands	%f27,	%f10,	%f31
	fmovdpos	%icc,	%f19,	%f12
	fmovdvc	%xcc,	%f27,	%f9
	mulscc	%g1,	0x155D,	%l5
	movneg	%xcc,	%l4,	%i6
	movrlez	%o7,	0x258,	%g3
	fpackfix	%f12,	%f23
	stbar
	set	0x40, %g5
	ldda	[%l7 + %g5] 0x14,	%i0
	taddcctv	%i2,	0x1092,	%g5
	sdivcc	%l2,	0x1A6D,	%o5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andn	%l6,	%g2,	%g6
	array16	%o2,	%l1,	%i4
	brgz	%o1,	loop_1042
	sdiv	%i7,	0x0B67,	%o4
	fbne	%fcc2,	loop_1043
	array8	%o0,	%g7,	%l0
loop_1042:
	fornot1s	%f21,	%f19,	%f8
	movcs	%icc,	%l3,	%o6
loop_1043:
	fmovrslez	%i0,	%f4,	%f7
	orn	%i3,	0x19DF,	%i5
	tsubcctv	%o3,	%g4,	%g1
	bg	loop_1044
	movleu	%icc,	%l5,	%l4
	sra	%i6,	%o7,	%g3
	tne	%icc,	0x7
loop_1044:
	tl	%icc,	0x6
	edge32	%i2,	%i1,	%l2
	ba	loop_1045
	ta	%icc,	0x7
	udivcc	%g5,	0x0A30,	%l6
	movcc	%icc,	%g2,	%o5
loop_1045:
	subccc	%g6,	%l1,	%i4
	fmul8x16	%f8,	%f20,	%f0
	bneg,pt	%xcc,	loop_1046
	srlx	%o1,	%o2,	%o4
	mova	%icc,	%o0,	%g7
	movleu	%xcc,	%l0,	%i7
loop_1046:
	fmovrdlz	%l3,	%f0,	%f20
	tle	%xcc,	0x1
	bpos,pt	%icc,	loop_1047
	fbn	%fcc0,	loop_1048
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bvc,pt	%icc,	loop_1049
loop_1047:
	tne	%icc,	0x4
loop_1048:
	movrgez	%i0,	0x1DC,	%o6
	tpos	%xcc,	0x4
loop_1049:
	movrgz	%i3,	0x0AB,	%o3
	sllx	%i5,	0x14,	%g4
	srax	%g1,	0x1E,	%l4
	addc	%l5,	%o7,	%g3
	taddcc	%i6,	0x14E1,	%i2
	movgu	%icc,	%i1,	%g5
	mulscc	%l2,	0x1761,	%l6
	fmovrsgz	%o5,	%f0,	%f0
	array8	%g6,	%l1,	%g2
	tsubcc	%i4,	%o2,	%o1
	edge16	%o4,	%o0,	%g7
	mulscc	%l0,	%l3,	%i0
	fmovsl	%icc,	%f15,	%f20
	fnor	%f20,	%f20,	%f10
	add	%l7,	0x38,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] %asi,	%o6,	%i3
	taddcctv	%o3,	%i7,	%i5
	mova	%xcc,	%g1,	%g4
	or	%l4,	0x17DF,	%l5
	call	loop_1050
	ba,pn	%icc,	loop_1051
	umulcc	%g3,	0x00C0,	%i6
	orncc	%i2,	%i1,	%g5
loop_1050:
	xnorcc	%l2,	0x1ACE,	%o7
loop_1051:
	srax	%l6,	0x0C,	%g6
	mulx	%l1,	%g2,	%o5
	tle	%xcc,	0x6
	wr	%g0,	0x89,	%asi
	stxa	%o2,	[%l7 + 0x78] %asi
	siam	0x0
	array32	%o1,	%o4,	%o0
	wr	%g0,	0x81,	%asi
	ldstuba	[%l7 + 0x2C] %asi,	%g7
	orcc	%l0,	0x1041,	%l3
	set	0x13, %g3
	stba	%i4,	[%l7 + %g3] 0x89
	sdivcc	%o6,	0x09B0,	%i0
	udivx	%o3,	0x0F0C,	%i3
	fbn,a	%fcc3,	loop_1052
	movvs	%icc,	%i7,	%g1
	stbar
	fmul8ulx16	%f26,	%f30,	%f4
loop_1052:
	tgu	%icc,	0x6
	srax	%i5,	0x19,	%l4
	tsubcctv	%g4,	0x1F8B,	%l5
	xor	%g3,	%i2,	%i6
	alignaddr	%g5,	%l2,	%i1
	edge16	%o7,	%l6,	%g6
	movvs	%icc,	%g2,	%o5
	movpos	%xcc,	%o2,	%l1
	movrlez	%o1,	0x1BC,	%o0
	lduw	[%l7 + 0x6C],	%o4
	tsubcc	%l0,	0x0F31,	%g7
	udivcc	%l3,	0x0A0E,	%o6
	fblg,a	%fcc1,	loop_1053
	prefetch	[%l7 + 0x1C],	 0x3
	brgz	%i4,	loop_1054
	sll	%o3,	%i3,	%i7
loop_1053:
	fba,a	%fcc3,	loop_1055
	edge16l	%g1,	%i5,	%i0
loop_1054:
	movrne	%l4,	%l5,	%g3
	ba,a,pn	%xcc,	loop_1056
loop_1055:
	stx	%g4,	[%l7 + 0x58]
	sll	%i6,	0x13,	%g5
	lduw	[%l7 + 0x30],	%i2
loop_1056:
	fbue	%fcc3,	loop_1057
	sdiv	%i1,	0x125B,	%l2
	sra	%l6,	0x03,	%g6
	fornot1	%f12,	%f22,	%f8
loop_1057:
	edge32ln	%o7,	%o5,	%g2
	sth	%l1,	[%l7 + 0x74]
	movpos	%xcc,	%o1,	%o2
	movle	%icc,	%o0,	%l0
	movcc	%icc,	%o4,	%l3
	srlx	%o6,	%i4,	%o3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orncc	%i3,	%i7,	%g7
	smulcc	%g1,	%i5,	%l4
	sir	0x08A2
	movne	%xcc,	%i0,	%g3
	edge8	%g4,	%i6,	%l5
	brgez,a	%g5,	loop_1058
	st	%f11,	[%l7 + 0x54]
	brgz,a	%i1,	loop_1059
	sra	%l2,	%l6,	%i2
loop_1058:
	movrgz	%g6,	0x2D3,	%o5
	prefetch	[%l7 + 0x44],	 0x3
loop_1059:
	nop
	set	0x20, %g6
	ldswa	[%l7 + %g6] 0x81,	%o7
	tl	%xcc,	0x2
	fors	%f9,	%f17,	%f19
	or	%g2,	%o1,	%l1
	bn,pn	%icc,	loop_1060
	brnz,a	%o2,	loop_1061
	fnot1	%f8,	%f6
	fmovrsgz	%o0,	%f29,	%f28
loop_1060:
	move	%xcc,	%l0,	%l3
loop_1061:
	st	%f12,	[%l7 + 0x2C]
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrsne	%o6,	%f30,	%f4
	fpadd32	%f10,	%f16,	%f28
	sethi	0x1876,	%o4
	bg,a,pn	%icc,	loop_1062
	tne	%xcc,	0x6
	or	%o3,	%i4,	%i3
	movrne	%g7,	0x133,	%g1
loop_1062:
	nop
	set	0x48, %i1
	ldsba	[%l7 + %i1] 0x11,	%i7
	membar	0x73
	wr	%g0,	0x11,	%asi
	prefetcha	[%l7 + 0x58] %asi,	 0x1
	addc	%i0,	%l4,	%g4
	fbue	%fcc0,	loop_1063
	orncc	%i6,	%l5,	%g5
	tpos	%xcc,	0x1
	stx	%i1,	[%l7 + 0x70]
loop_1063:
	edge8ln	%g3,	%l6,	%l2
	bl,a	%xcc,	loop_1064
	popc	%g6,	%o5
	movrgez	%o7,	0x1BD,	%i2
	movcc	%xcc,	%o1,	%l1
loop_1064:
	be,pn	%icc,	loop_1065
	tcc	%icc,	0x5
	fmovspos	%icc,	%f12,	%f10
	tgu	%xcc,	0x6
loop_1065:
	fmovrdgez	%g2,	%f26,	%f18
	array32	%o2,	%o0,	%l3
	fnot2	%f4,	%f24
	fmovsg	%xcc,	%f8,	%f3
	fbo,a	%fcc0,	loop_1066
	sir	0x0F2F
	bgu,a	%xcc,	loop_1067
	tcc	%xcc,	0x2
loop_1066:
	brlz,a	%l0,	loop_1068
	sdiv	%o6,	0x0248,	%o4
loop_1067:
	tg	%xcc,	0x6
	fabss	%f8,	%f12
loop_1068:
	taddcc	%i4,	%o3,	%i3
	bpos,pt	%xcc,	loop_1069
	andn	%g7,	0x0DD4,	%g1
	tsubcctv	%i5,	0x0E2E,	%i7
	fcmped	%fcc0,	%f26,	%f16
loop_1069:
	subc	%i0,	0x11EE,	%l4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	popc	%g4,	%l5
	srax	%i6,	0x0D,	%i1
	fbo,a	%fcc2,	loop_1070
	tle	%xcc,	0x6
	ld	[%l7 + 0x60],	%f29
	sethi	0x0AC4,	%g3
loop_1070:
	tne	%xcc,	0x4
	fbl	%fcc2,	loop_1071
	fmovd	%f28,	%f12
	stbar
	fmovdleu	%icc,	%f5,	%f21
loop_1071:
	bge,pt	%xcc,	loop_1072
	sllx	%g5,	0x01,	%l2
	bgu,a,pt	%xcc,	loop_1073
	fandnot1s	%f8,	%f17,	%f27
loop_1072:
	fmovsne	%icc,	%f16,	%f29
	umulcc	%g6,	%l6,	%o7
loop_1073:
	tleu	%icc,	0x4
	ldd	[%l7 + 0x70],	%i2
	bpos,pn	%xcc,	loop_1074
	fpmerge	%f22,	%f15,	%f24
	tpos	%icc,	0x2
	array16	%o5,	%o1,	%g2
loop_1074:
	tle	%icc,	0x0
	sdivcc	%l1,	0x1443,	%o0
	fmuld8sux16	%f19,	%f24,	%f26
	tge	%xcc,	0x6
	fcmps	%fcc2,	%f5,	%f3
	brlez	%o2,	loop_1075
	bn,a	loop_1076
	movne	%icc,	%l3,	%o6
	or	%o4,	%i4,	%o3
loop_1075:
	fnand	%f0,	%f10,	%f4
loop_1076:
	srl	%l0,	0x1C,	%g7
	taddcctv	%i3,	%g1,	%i5
	array32	%i0,	%i7,	%l4
	sra	%g4,	%i6,	%i1
	tle	%icc,	0x6
	move	%icc,	%l5,	%g3
	alignaddr	%l2,	%g6,	%l6
	std	%g4,	[%l7 + 0x10]
	edge32	%o7,	%o5,	%i2
	fbule	%fcc2,	loop_1077
	edge32l	%o1,	%l1,	%g2
	tcc	%xcc,	0x5
	sir	0x0945
loop_1077:
	movvs	%xcc,	%o0,	%o2
	movcc	%xcc,	%o6,	%l3
	mulscc	%o4,	0x1CFD,	%o3
	fnands	%f13,	%f18,	%f27
	stb	%i4,	[%l7 + 0x5C]
	sdiv	%g7,	0x0B83,	%i3
	fmovsne	%xcc,	%f31,	%f24
	addcc	%g1,	0x1AB9,	%i5
	alignaddrl	%i0,	%i7,	%l4
	ta	%icc,	0x6
	or	%g4,	0x1A25,	%l0
	move	%xcc,	%i1,	%l5
	fnors	%f20,	%f12,	%f13
	edge16l	%g3,	%l2,	%i6
	lduw	[%l7 + 0x08],	%l6
	andncc	%g5,	%o7,	%g6
	flush	%l7 + 0x30
	bl	%xcc,	loop_1078
	membar	0x40
	addcc	%i2,	0x18A6,	%o1
	tsubcctv	%l1,	0x0C8D,	%o5
loop_1078:
	fsrc2s	%f19,	%f0
	orcc	%o0,	%g2,	%o6
	subcc	%l3,	0x010A,	%o4
	brz	%o2,	loop_1079
	ldx	[%l7 + 0x58],	%i4
	fmovdcs	%icc,	%f5,	%f14
	srax	%g7,	%i3,	%g1
loop_1079:
	addc	%i5,	%o3,	%i7
	set	0x3A, %i3
	lduha	[%l7 + %i3] 0x10,	%i0
	te	%icc,	0x1
	fpadd16s	%f3,	%f18,	%f8
	movrlz	%l4,	0x04A,	%l0
	umulcc	%g4,	%i1,	%l5
	fbge	%fcc2,	loop_1080
	fmovsvs	%icc,	%f23,	%f0
	fcmpgt32	%f28,	%f2,	%g3
	movrgez	%l2,	0x2C7,	%i6
loop_1080:
	movpos	%xcc,	%g5,	%l6
	ldd	[%l7 + 0x70],	%f20
	bg	loop_1081
	tpos	%icc,	0x3
	taddcc	%g6,	0x0934,	%o7
	be,a,pt	%icc,	loop_1082
loop_1081:
	movleu	%xcc,	%o1,	%i2
	array32	%o5,	%l1,	%o0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1082:
	udivcc	%o6,	0x1A00,	%l3
	movge	%icc,	%o4,	%g2
	tpos	%icc,	0x7
	nop
	setx	loop_1083,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fbne	%fcc1,	loop_1084
	tcc	%xcc,	0x6
	tleu	%icc,	0x1
loop_1083:
	bleu,a	loop_1085
loop_1084:
	taddcc	%o2,	%g7,	%i4
	smulcc	%i3,	0x1443,	%g1
	prefetch	[%l7 + 0x68],	 0x3
loop_1085:
	fcmpeq16	%f10,	%f0,	%i5
	fmovrslz	%i7,	%f29,	%f17
	fmovdleu	%xcc,	%f13,	%f31
	udiv	%o3,	0x161A,	%l4
	sub	%i0,	0x0406,	%g4
	fmovsge	%icc,	%f1,	%f9
	wr	%g0,	0x10,	%asi
	ldsba	[%l7 + 0x34] %asi,	%i1
	wr	%g0,	0x88,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	be,a	loop_1086
	srl	%l5,	%l0,	%g3
	udiv	%l2,	0x0E1A,	%i6
	brz	%l6,	loop_1087
loop_1086:
	sdivcc	%g5,	0x1310,	%g6
	movl	%icc,	%o1,	%i2
	smulcc	%o5,	0x0289,	%o7
loop_1087:
	sir	0x0F07
	movg	%icc,	%l1,	%o0
	fandnot1s	%f3,	%f4,	%f26
	alignaddr	%o6,	%l3,	%g2
	fpadd32	%f0,	%f4,	%f6
	edge32ln	%o2,	%g7,	%i4
	wr	%g0,	0x89,	%asi
	lda	[%l7 + 0x7C] %asi,	%f19
	edge8ln	%o4,	%i3,	%i5
	bl,pt	%icc,	loop_1088
	fmovdn	%icc,	%f18,	%f1
	sdiv	%i7,	0x1C2E,	%g1
	addcc	%o3,	0x044B,	%l4
loop_1088:
	fmovdpos	%xcc,	%f12,	%f1
	movge	%xcc,	%g4,	%i0
	movgu	%xcc,	%i1,	%l5
	movcc	%icc,	%g3,	%l2
	fmovdgu	%xcc,	%f10,	%f14
	bneg	%xcc,	loop_1089
	fble,a	%fcc2,	loop_1090
	fblg	%fcc3,	loop_1091
	umul	%l0,	0x187A,	%l6
loop_1089:
	fmovsn	%xcc,	%f29,	%f4
loop_1090:
	umulcc	%g5,	0x1E95,	%i6
loop_1091:
	brgz	%o1,	loop_1092
	be,a,pt	%icc,	loop_1093
	udiv	%g6,	0x1A4A,	%o5
	set	0x7C, %g4
	sta	%f3,	[%l7 + %g4] 0x04
loop_1092:
	fsrc1s	%f24,	%f6
loop_1093:
	fmovde	%xcc,	%f12,	%f11
	ldsw	[%l7 + 0x44],	%i2
	mova	%xcc,	%o7,	%o0
	set	0x0, %i5
	stxa	%l1,	[%g0 + %i5] 0x5f
	addc	%o6,	%l3,	%g2
	smul	%o2,	%g7,	%i4
	brgz	%i3,	loop_1094
	fbue	%fcc0,	loop_1095
	brnz	%i5,	loop_1096
	movgu	%xcc,	%o4,	%i7
loop_1094:
	andncc	%g1,	%l4,	%g4
loop_1095:
	prefetch	[%l7 + 0x14],	 0x3
loop_1096:
	nop
	add	%l7,	0x18,	%l6
	wr	%g0,	0x10,	%asi
	casxa	[%l6] 0x10,	%o3,	%i0
	tvs	%icc,	0x5
	add	%l7,	0x7C,	%l6
	wr	%g0,	0x19,	%asi
	casa	[%l6] %asi,	%i1,	%g3
	fmul8ulx16	%f16,	%f8,	%f10
	xnor	%l5,	%l2,	%l0
	fmovrsgez	%g5,	%f25,	%f31
	edge8ln	%l6,	%i6,	%o1
	bge,a,pt	%xcc,	loop_1097
	fmovsge	%icc,	%f29,	%f11
	wr	%g0,	0x0c,	%asi
	stda	%g6,	[%l7 + 0x78] %asi
loop_1097:
	andcc	%i2,	%o7,	%o0
	tvs	%xcc,	0x7
	subccc	%o5,	%l1,	%l3
	move	%xcc,	%o6,	%g2
	fbule	%fcc1,	loop_1098
	movge	%xcc,	%o2,	%i4
	fbl,a	%fcc3,	loop_1099
	stbar
loop_1098:
	edge32n	%i3,	%i5,	%o4
	ldx	[%l7 + 0x38],	%i7
loop_1099:
	movneg	%icc,	%g1,	%l4
	fabsd	%f2,	%f8
	fbo,a	%fcc3,	loop_1100
	tsubcctv	%g4,	0x1463,	%g7
	membar	#Sync
	set	0x40, %i4
	ldda	[%l7 + %i4] 0x1e,	%f16
loop_1100:
	movle	%xcc,	%i0,	%o3
	edge8l	%g3,	%l5,	%i1
	orncc	%l2,	0x1C85,	%l0
	srl	%l6,	%g5,	%o1
	udivcc	%i6,	0x1508,	%g6
	set	0x55, %l5
	stba	%i2,	[%l7 + %l5] 0x14
	andcc	%o7,	%o0,	%l1
	fmovdne	%xcc,	%f16,	%f13
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
	ldsw	[%l7 + 0x10],	%o5
	tl	%xcc,	0x1
	movg	%icc,	%l3,	%g2
loop_1101:
	edge32ln	%o2,	%o6,	%i4
	fnot2	%f22,	%f18
	fmul8ulx16	%f8,	%f24,	%f4
	flush	%l7 + 0x08
	fmovdn	%xcc,	%f9,	%f19
	bcs,pt	%xcc,	loop_1102
	or	%i5,	0x1469,	%i3
	wr	%g0,	0x89,	%asi
	swapa	[%l7 + 0x40] %asi,	%i7
loop_1102:
	edge32l	%o4,	%l4,	%g4
	edge8ln	%g1,	%i0,	%g7
	fmovsl	%xcc,	%f19,	%f26
	subcc	%g3,	0x13DA,	%l5
	std	%i0,	[%l7 + 0x50]
	mulx	%o3,	0x19C0,	%l2
	movre	%l6,	0x3F4,	%l0
	movvs	%xcc,	%g5,	%i6
	edge32l	%o1,	%g6,	%i2
	array8	%o7,	%o0,	%l1
	popc	0x08D0,	%o5
	bpos	%icc,	loop_1103
	siam	0x4
	movvs	%xcc,	%l3,	%g2
	movleu	%icc,	%o2,	%i4
loop_1103:
	sllx	%i5,	%o6,	%i3
	fbg	%fcc0,	loop_1104
	movgu	%icc,	%o4,	%i7
	array16	%g4,	%g1,	%l4
	mova	%xcc,	%i0,	%g7
loop_1104:
	sll	%g3,	0x18,	%i1
	wr	%g0,	0x10,	%asi
	lda	[%l7 + 0x34] %asi,	%f29
	fblg,a	%fcc3,	loop_1105
	edge8ln	%l5,	%l2,	%o3
	movleu	%icc,	%l6,	%l0
	movg	%icc,	%i6,	%g5
loop_1105:
	movle	%xcc,	%g6,	%o1
	sdivcc	%o7,	0x105F,	%o0
	mulx	%l1,	0x10E3,	%i2
	tl	%icc,	0x7
	subccc	%o5,	0x199C,	%g2
	edge16ln	%l3,	%o2,	%i5
	addccc	%i4,	0x1F95,	%i3
	udiv	%o4,	0x16CA,	%i7
	fnegs	%f25,	%f24
	brlz	%o6,	loop_1106
	sth	%g1,	[%l7 + 0x78]
	edge32l	%l4,	%i0,	%g4
	sdivcc	%g7,	0x096B,	%g3
loop_1106:
	subccc	%l5,	%i1,	%o3
	sll	%l6,	0x07,	%l2
	tvs	%xcc,	0x5
	mova	%xcc,	%l0,	%i6
	tsubcc	%g6,	%g5,	%o1
	and	%o0,	0x04E3,	%o7
	sllx	%i2,	0x02,	%l1
	array32	%o5,	%g2,	%l3
	movrgz	%o2,	0x222,	%i4
	movle	%icc,	%i3,	%o4
	subccc	%i5,	0x1840,	%o6
	smul	%g1,	0x18C6,	%l4
	fmovdcs	%icc,	%f28,	%f0
	subccc	%i0,	%g4,	%g7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	pdist	%f10,	%f10,	%f2
	fnands	%f2,	%f13,	%f0
	std	%i6,	[%l7 + 0x08]
	fmovrdlez	%l5,	%f20,	%f12
	bpos,a,pt	%icc,	loop_1107
	fmovdl	%icc,	%f9,	%f26
	mulx	%i1,	0x02F2,	%o3
	fmul8sux16	%f4,	%f4,	%f26
loop_1107:
	umul	%l6,	%l2,	%g3
	fmovrdgez	%l0,	%f30,	%f6
	membar	0x3E
	fornot1s	%f25,	%f29,	%f15
	fmovscc	%xcc,	%f20,	%f5
	tsubcctv	%i6,	0x0AB9,	%g6
	fmovrsne	%o1,	%f7,	%f10
	set	0x1D, %i6
	lduba	[%l7 + %i6] 0x14,	%o0
	fones	%f0
	fmovdcc	%icc,	%f28,	%f26
	movpos	%xcc,	%o7,	%i2
	edge16l	%l1,	%o5,	%g5
	fbe	%fcc0,	loop_1108
	be,a	loop_1109
	movpos	%icc,	%l3,	%g2
	fmovspos	%xcc,	%f1,	%f0
loop_1108:
	smulcc	%i4,	%i3,	%o4
loop_1109:
	ta	%xcc,	0x4
	fcmpgt16	%f14,	%f24,	%i5
	umulcc	%o6,	0x1C77,	%g1
	array16	%l4,	%o2,	%i0
	for	%f14,	%f24,	%f26
	bshuffle	%f22,	%f22,	%f18
	alignaddrl	%g7,	%g4,	%i7
	stb	%i1,	[%l7 + 0x3D]
	fsrc2s	%f13,	%f24
	movgu	%icc,	%l5,	%l6
	add	%l7,	0x30,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%l2
	casxa	[%l6] %asi,	%l2,	%o3
	movvs	%xcc,	%l0,	%g3
	movpos	%xcc,	%i6,	%g6
	fnot1	%f24,	%f12
	tsubcctv	%o0,	%o7,	%o1
	tvs	%xcc,	0x3
	fmovda	%xcc,	%f12,	%f23
	ba	loop_1110
	bne,pt	%icc,	loop_1111
	movrlz	%l1,	%o5,	%i2
	std	%g4,	[%l7 + 0x10]
loop_1110:
	movvs	%icc,	%g2,	%i4
loop_1111:
	fpsub16	%f24,	%f30,	%f16
	membar	#Sync
	set	0x40, %o1
	ldda	[%l7 + %o1] 0xf0,	%f16
	smulcc	%l3,	0x11A8,	%o4
	edge16	%i3,	%o6,	%g1
	movneg	%xcc,	%i5,	%o2
	fcmpne16	%f2,	%f12,	%l4
	fxnors	%f28,	%f3,	%f19
	bvc,pn	%xcc,	loop_1112
	brgez	%i0,	loop_1113
	fmuld8ulx16	%f9,	%f17,	%f2
	tl	%icc,	0x7
loop_1112:
	fornot1s	%f28,	%f7,	%f6
loop_1113:
	movle	%xcc,	%g4,	%i7
	taddcctv	%g7,	%l5,	%i1
	fmovsg	%icc,	%f1,	%f15
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movcc	%icc,	%l2,	%l6
	fmovdcs	%icc,	%f7,	%f25
	array8	%o3,	%l0,	%i6
	edge16	%g3,	%o0,	%g6
	tpos	%xcc,	0x2
	fmovsa	%xcc,	%f0,	%f3
	edge16l	%o1,	%l1,	%o7
	fabsd	%f4,	%f0
	sdivx	%o5,	0x199C,	%i2
	or	%g2,	%i4,	%g5
	fmovdcs	%xcc,	%f13,	%f16
	movrlz	%l3,	%i3,	%o4
	wr	%g0,	0x19,	%asi
	prefetcha	[%l7 + 0x68] %asi,	 0x0
	fnot1	%f16,	%f12
	addc	%g1,	0x098F,	%o2
	tcs	%xcc,	0x4
	array16	%i5,	%i0,	%l4
	set	0x70, %i0
	prefetcha	[%l7 + %i0] 0x88,	 0x2
	move	%icc,	%g4,	%g7
	fcmpgt16	%f30,	%f12,	%i1
	ldub	[%l7 + 0x3C],	%l5
	fandnot1s	%f31,	%f6,	%f7
	stw	%l6,	[%l7 + 0x5C]
	sllx	%o3,	0x04,	%l0
	tn	%xcc,	0x3
	brgez,a	%l2,	loop_1114
	fcmpeq32	%f20,	%f2,	%i6
	sra	%g3,	%g6,	%o0
	udiv	%l1,	0x1DB9,	%o7
loop_1114:
	mova	%xcc,	%o5,	%i2
	movrlz	%g2,	%i4,	%g5
	fmovdcs	%icc,	%f28,	%f25
	smulcc	%o1,	0x0ACF,	%l3
	tsubcctv	%o4,	0x1BA4,	%o6
	taddcc	%i3,	%g1,	%o2
	xorcc	%i0,	0x0861,	%l4
	subc	%i5,	0x1A20,	%g4
	fandnot1	%f12,	%f12,	%f16
	stb	%g7,	[%l7 + 0x66]
	set	0x76, %o3
	lduha	[%l7 + %o3] 0x88,	%i1
	tsubcctv	%i7,	%l5,	%o3
	fpadd32s	%f20,	%f27,	%f26
	andcc	%l6,	%l2,	%i6
	tcs	%icc,	0x3
	edge8ln	%l0,	%g3,	%g6
	ta	%icc,	0x6
	siam	0x5
	udiv	%o0,	0x1F0B,	%l1
	movre	%o5,	0x12B,	%o7
	fmovscc	%icc,	%f9,	%f17
	fbn	%fcc0,	loop_1115
	fbug,a	%fcc1,	loop_1116
	array16	%g2,	%i2,	%g5
	tge	%icc,	0x5
loop_1115:
	nop
	set	0x40, %l6
	stda	%f16,	[%l7 + %l6] 0x18
loop_1116:
	udivcc	%o1,	0x113E,	%i4
	movl	%icc,	%o4,	%o6
	smul	%l3,	0x1198,	%i3
	fandnot1	%f30,	%f28,	%f8
	taddcc	%o2,	%i0,	%l4
	fbu,a	%fcc1,	loop_1117
	bcs	loop_1118
	bgu	loop_1119
	addcc	%g1,	0x0CB5,	%i5
loop_1117:
	tsubcc	%g4,	%g7,	%i7
loop_1118:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1119:
	udiv	%i1,	0x06F8,	%o3
	stw	%l5,	[%l7 + 0x24]
	fmovsgu	%icc,	%f3,	%f23
	movle	%icc,	%l2,	%l6
	sir	0x101B
	movcc	%xcc,	%l0,	%g3
	tl	%icc,	0x6
	subccc	%i6,	%o0,	%l1
	mulx	%g6,	%o7,	%o5
	fmovrsne	%i2,	%f8,	%f27
	array16	%g5,	%g2,	%o1
	fbge,a	%fcc3,	loop_1120
	mulx	%i4,	0x0C4A,	%o4
	udiv	%l3,	0x150F,	%i3
	orn	%o6,	%i0,	%l4
loop_1120:
	fmovsne	%icc,	%f24,	%f19
	fbe	%fcc0,	loop_1121
	tsubcc	%o2,	%i5,	%g4
	fbo,a	%fcc0,	loop_1122
	fpack16	%f18,	%f23
loop_1121:
	sir	0x0423
	fbg,a	%fcc2,	loop_1123
loop_1122:
	nop
	setx loop_1124, %l0, %l1
	jmpl %l1, %g1
	bcc,a,pn	%icc,	loop_1125
	membar	0x5C
loop_1123:
	for	%f4,	%f30,	%f30
loop_1124:
	fzeros	%f17
loop_1125:
	edge8	%g7,	%i7,	%o3
	tg	%xcc,	0x7
	movg	%icc,	%l5,	%i1
	movcc	%icc,	%l2,	%l6
	tle	%xcc,	0x3
	andn	%l0,	%g3,	%i6
	umul	%l1,	%g6,	%o7
	nop
	setx loop_1126, %l0, %l1
	jmpl %l1, %o0
	srax	%o5,	0x18,	%i2
	stb	%g5,	[%l7 + 0x3E]
	subccc	%g2,	0x0A15,	%o1
loop_1126:
	sllx	%i4,	0x18,	%o4
	bpos	loop_1127
	fpack32	%f8,	%f22,	%f24
	movrlz	%l3,	%i3,	%i0
	movrlez	%o6,	%o2,	%i5
loop_1127:
	sdivcc	%g4,	0x07BD,	%l4
	ldd	[%l7 + 0x08],	%f12
	edge32ln	%g1,	%g7,	%i7
	tpos	%icc,	0x6
	sllx	%o3,	0x14,	%l5
	tneg	%xcc,	0x4
	fbue	%fcc2,	loop_1128
	membar	0x54
	and	%i1,	%l2,	%l6
	tg	%xcc,	0x1
loop_1128:
	xnorcc	%l0,	%g3,	%i6
	udivcc	%l1,	0x0951,	%g6
	movrlez	%o0,	0x13A,	%o5
	prefetch	[%l7 + 0x08],	 0x3
	wr	%g0,	0x80,	%asi
	lduba	[%l7 + 0x58] %asi,	%o7
	bge,a,pn	%icc,	loop_1129
	fabss	%f14,	%f23
	ldstub	[%l7 + 0x6F],	%g5
	srl	%g2,	0x11,	%o1
loop_1129:
	sll	%i2,	0x00,	%o4
	pdist	%f24,	%f18,	%f26
	bl	%icc,	loop_1130
	popc	0x04AF,	%l3
	movpos	%icc,	%i4,	%i3
	fbe,a	%fcc2,	loop_1131
loop_1130:
	sethi	0x1E4A,	%o6
	tsubcctv	%o2,	0x1DE4,	%i0
	brz	%g4,	loop_1132
loop_1131:
	edge16ln	%l4,	%i5,	%g7
	sdiv	%g1,	0x00B7,	%i7
	tpos	%icc,	0x4
loop_1132:
	fmovsvs	%icc,	%f22,	%f19
	ldd	[%l7 + 0x68],	%f18
	fmovdcs	%xcc,	%f30,	%f6
	fble,a	%fcc3,	loop_1133
	srl	%l5,	0x01,	%o3
	wr	%g0,	0x10,	%asi
	ldstuba	[%l7 + 0x55] %asi,	%l2
loop_1133:
	alignaddr	%l6,	%l0,	%g3
	movcs	%icc,	%i1,	%l1
	subcc	%i6,	%g6,	%o5
	tcc	%xcc,	0x1
	set	0x1A, %l0
	lduha	[%l7 + %l0] 0x0c,	%o0
	bshuffle	%f22,	%f8,	%f8
	edge8ln	%g5,	%g2,	%o1
	fmovrslez	%o7,	%f8,	%f29
	array32	%i2,	%o4,	%i4
	edge32l	%i3,	%l3,	%o2
	ta	%icc,	0x7
	fpsub32	%f0,	%f8,	%f16
	tpos	%icc,	0x0
	wr	%g0,	0x11,	%asi
	ldstuba	[%l7 + 0x14] %asi,	%i0
	mulscc	%g4,	0x1550,	%l4
	fbu	%fcc2,	loop_1134
	movgu	%xcc,	%o6,	%i5
	tvs	%xcc,	0x7
	movpos	%xcc,	%g7,	%i7
loop_1134:
	fmovspos	%xcc,	%f13,	%f6
	addc	%l5,	%g1,	%o3
	mulscc	%l2,	0x12D5,	%l6
	set	0x2C, %o2
	sta	%f25,	[%l7 + %o2] 0x0c
	tsubcctv	%g3,	0x1A67,	%l0
	taddcctv	%l1,	0x107E,	%i1
	fmovdle	%xcc,	%f4,	%f17
	edge16n	%i6,	%o5,	%o0
	fpadd16	%f6,	%f18,	%f18
	ba,pn	%icc,	loop_1135
	nop
	setx	loop_1136,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	bvs	loop_1137
	edge32n	%g6,	%g2,	%g5
loop_1135:
	addc	%o7,	%o1,	%i2
loop_1136:
	membar	0x2B
loop_1137:
	brnz,a	%o4,	loop_1138
	xorcc	%i4,	%l3,	%o2
	fnor	%f12,	%f30,	%f8
	movcs	%xcc,	%i0,	%i3
loop_1138:
	bne,a	%icc,	loop_1139
	subccc	%g4,	%l4,	%o6
	srl	%i5,	%g7,	%i7
	fbule	%fcc1,	loop_1140
loop_1139:
	movre	%g1,	0x2FA,	%o3
	addccc	%l2,	%l6,	%g3
	mulscc	%l0,	%l1,	%l5
loop_1140:
	udivx	%i1,	0x0B2E,	%o5
	bn,pn	%xcc,	loop_1141
	orncc	%o0,	%i6,	%g2
	fbug,a	%fcc2,	loop_1142
	movneg	%icc,	%g5,	%o7
loop_1141:
	movrlz	%g6,	%i2,	%o1
	fpsub32s	%f27,	%f22,	%f16
loop_1142:
	fbe,a	%fcc0,	loop_1143
	fmovsl	%icc,	%f5,	%f25
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsvc	%xcc,	%f1,	%f10
loop_1143:
	movle	%icc,	%o4,	%i4
	fbug	%fcc1,	loop_1144
	or	%o2,	0x0142,	%i0
	bne,pn	%xcc,	loop_1145
	fsrc1s	%f4,	%f26
loop_1144:
	move	%icc,	%i3,	%g4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1145:
	fnors	%f17,	%f12,	%f18
	movne	%icc,	%l4,	%l3
	ldstub	[%l7 + 0x6D],	%o6
	andncc	%i5,	%i7,	%g7
	nop
	setx	loop_1146,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fmovsa	%icc,	%f28,	%f4
	umulcc	%o3,	0x022C,	%g1
	sir	0x038E
loop_1146:
	siam	0x4
	tn	%xcc,	0x3
	ldsb	[%l7 + 0x3A],	%l2
	for	%f8,	%f0,	%f28
	fcmpgt32	%f18,	%f18,	%g3
	edge8l	%l0,	%l6,	%l1
	fmovdne	%icc,	%f8,	%f29
	fmovdn	%xcc,	%f2,	%f18
	tle	%icc,	0x3
	mova	%icc,	%l5,	%i1
	edge16	%o0,	%o5,	%g2
	andncc	%g5,	%i6,	%g6
	udivx	%i2,	0x0431,	%o1
	tsubcc	%o7,	%o4,	%i4
	lduh	[%l7 + 0x66],	%i0
	movrgez	%o2,	0x2E8,	%g4
	subc	%i3,	0x04A9,	%l4
	add	%l3,	0x0939,	%o6
	move	%icc,	%i7,	%i5
	udivcc	%g7,	0x16C2,	%o3
	ta	%icc,	0x0
	edge8ln	%l2,	%g3,	%l0
	wr	%g0,	0x81,	%asi
	lda	[%l7 + 0x6C] %asi,	%f10
	sdiv	%g1,	0x09BA,	%l6
	call	loop_1147
	sethi	0x072B,	%l1
	fmul8x16	%f21,	%f10,	%f4
	sdivcc	%i1,	0x1F83,	%o0
loop_1147:
	bvc	loop_1148
	fbo,a	%fcc2,	loop_1149
	fors	%f26,	%f0,	%f0
	wr	%g0,	0x11,	%asi
	ldstuba	[%l7 + 0x3C] %asi,	%l5
loop_1148:
	fpackfix	%f28,	%f27
loop_1149:
	edge8ln	%o5,	%g5,	%i6
	andn	%g6,	%i2,	%g2
	sra	%o1,	0x1C,	%o4
	std	%o6,	[%l7 + 0x58]
	fcmps	%fcc2,	%f28,	%f27
	alignaddr	%i0,	%i4,	%g4
	fpadd16	%f16,	%f14,	%f0
	sra	%i3,	%l4,	%o2
	sth	%l3,	[%l7 + 0x24]
	wr	%g0,	0x88,	%asi
	ldswa	[%l7 + 0x50] %asi,	%o6
	movleu	%xcc,	%i5,	%i7
	movneg	%xcc,	%o3,	%g7
	fpsub16s	%f22,	%f0,	%f10
	movvs	%icc,	%l2,	%g3
	edge16ln	%g1,	%l0,	%l6
	te	%icc,	0x5
	std	%l0,	[%l7 + 0x78]
	fbne,a	%fcc0,	loop_1150
	edge8l	%o0,	%l5,	%i1
	movvs	%xcc,	%g5,	%o5
	array32	%i6,	%i2,	%g6
loop_1150:
	fornot2	%f14,	%f10,	%f28
	te	%icc,	0x0
	movn	%xcc,	%g2,	%o4
	call	loop_1151
	movvs	%icc,	%o7,	%i0
	movrlz	%i4,	0x235,	%g4
	popc	0x025A,	%o1
loop_1151:
	udivcc	%l4,	0x0E35,	%o2
	alignaddrl	%l3,	%o6,	%i3
	bgu,pn	%xcc,	loop_1152
	tne	%icc,	0x6
	xnor	%i5,	%o3,	%g7
	fsrc1	%f0,	%f6
loop_1152:
	orncc	%l2,	0x04C5,	%g3
	ldd	[%l7 + 0x48],	%g0
	tneg	%xcc,	0x5
	sra	%l0,	%l6,	%i7
	fbu	%fcc2,	loop_1153
	fmovdcs	%icc,	%f6,	%f12
	addccc	%l1,	%l5,	%i1
	movleu	%xcc,	%g5,	%o0
loop_1153:
	fmovsgu	%xcc,	%f10,	%f27
	andn	%i6,	%i2,	%o5
	array8	%g2,	%g6,	%o7
	xorcc	%i0,	0x078D,	%i4
	ldstub	[%l7 + 0x66],	%g4
	sdivcc	%o1,	0x0B75,	%l4
	tge	%icc,	0x2
	wr	%g0,	0x04,	%asi
	stba	%o2,	[%l7 + 0x5C] %asi
	edge16ln	%o4,	%l3,	%o6
	taddcctv	%i3,	0x1BE9,	%i5
	sub	%g7,	0x1FDE,	%l2
	brgz,a	%g3,	loop_1154
	ta	%xcc,	0x1
	edge8l	%o3,	%l0,	%g1
	movcc	%xcc,	%i7,	%l1
loop_1154:
	tneg	%xcc,	0x4
	srlx	%l6,	0x10,	%l5
	fabss	%f23,	%f28
	andncc	%i1,	%o0,	%i6
	or	%g5,	%o5,	%g2
	tleu	%icc,	0x3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpmerge	%f27,	%f10,	%f16
	movl	%xcc,	%g6,	%i2
	tg	%icc,	0x2
	mova	%xcc,	%o7,	%i0
	fpadd32s	%f12,	%f10,	%f11
	edge8n	%g4,	%o1,	%i4
	sdiv	%l4,	0x1734,	%o2
	movgu	%icc,	%o4,	%o6
	set	0x48, %i2
	sta	%f22,	[%l7 + %i2] 0x89
	fmovrsgez	%l3,	%f1,	%f0
	movg	%icc,	%i3,	%i5
	udivcc	%l2,	0x0956,	%g7
	movleu	%xcc,	%o3,	%g3
	fcmpgt16	%f0,	%f16,	%g1
	edge16n	%l0,	%i7,	%l1
	brgez	%l6,	loop_1155
	prefetch	[%l7 + 0x1C],	 0x0
	xnor	%i1,	%l5,	%o0
	swap	[%l7 + 0x08],	%g5
loop_1155:
	bpos,a,pn	%xcc,	loop_1156
	fmovdpos	%xcc,	%f13,	%f29
	fmovrdgz	%i6,	%f20,	%f2
	alignaddr	%g2,	%g6,	%o5
loop_1156:
	movcc	%icc,	%o7,	%i0
	fpadd16s	%f28,	%f25,	%f28
	tcc	%icc,	0x2
	sdivx	%g4,	0x1530,	%i2
	subccc	%i4,	%o1,	%o2
	fnot2	%f24,	%f6
	xor	%o4,	%l4,	%l3
	fcmped	%fcc2,	%f16,	%f0
	fpsub16	%f4,	%f8,	%f22
	edge32ln	%o6,	%i3,	%i5
	add	%l7,	0x38,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] %asi,	%g7,	%o3
	fcmple32	%f2,	%f22,	%g3
	tvc	%xcc,	0x7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tle	%xcc,	0x0
	te	%icc,	0x3
	fone	%f2
	orcc	%l2,	%g1,	%i7
	edge16	%l1,	%l6,	%i1
	fblg	%fcc2,	loop_1157
	fble	%fcc2,	loop_1158
	sra	%l5,	0x06,	%o0
	fcmped	%fcc2,	%f14,	%f12
loop_1157:
	taddcctv	%g5,	%l0,	%i6
loop_1158:
	srlx	%g6,	0x17,	%g2
	fbge,a	%fcc3,	loop_1159
	orcc	%o5,	0x113C,	%o7
	fmovrdne	%g4,	%f14,	%f16
	mulscc	%i2,	%i0,	%i4
loop_1159:
	fmovrsgz	%o2,	%f11,	%f20
	edge16n	%o1,	%o4,	%l3
	popc	0x10D6,	%o6
	for	%f22,	%f28,	%f12
	wr	%g0,	0x89,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	pdist	%f22,	%f28,	%f8
	tcc	%icc,	0x4
	set	0x69, %g2
	ldstuba	[%l7 + %g2] 0x89,	%l4
	xnor	%i5,	0x1152,	%i3
	alignaddrl	%g7,	%g3,	%l2
	te	%xcc,	0x2
	fmovrdlz	%g1,	%f10,	%f10
	tpos	%icc,	0x1
	fmovrdlez	%i7,	%f2,	%f22
	movvc	%icc,	%l1,	%o3
	xnor	%l6,	0x0D46,	%i1
	taddcctv	%o0,	%l5,	%g5
	bl	loop_1160
	movl	%xcc,	%l0,	%g6
	set	0x40, %o6
	stda	%f0,	[%l7 + %o6] 0x80
loop_1160:
	ble,a	%xcc,	loop_1161
	lduw	[%l7 + 0x5C],	%i6
	fmuld8ulx16	%f8,	%f25,	%f12
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1161:
	tsubcc	%o5,	0x090E,	%g2
	srax	%g4,	0x12,	%i2
	move	%xcc,	%o7,	%i4
	fbuge	%fcc0,	loop_1162
	movn	%icc,	%i0,	%o1
	nop
	setx loop_1163, %l0, %l1
	jmpl %l1, %o2
	fnor	%f4,	%f20,	%f18
loop_1162:
	fbuge	%fcc0,	loop_1164
	srl	%l3,	%o6,	%l4
loop_1163:
	array32	%o4,	%i3,	%g7
	fbe,a	%fcc0,	loop_1165
loop_1164:
	fmovsleu	%icc,	%f17,	%f22
	srax	%i5,	%l2,	%g1
	membar	0x4F
loop_1165:
	edge16ln	%g3,	%i7,	%o3
	mova	%xcc,	%l6,	%l1
	tgu	%icc,	0x1
	fornot1s	%f13,	%f5,	%f14
	udiv	%o0,	0x02A4,	%i1
	bl	%icc,	loop_1166
	fble	%fcc0,	loop_1167
	tge	%icc,	0x7
	sllx	%l5,	%g5,	%l0
loop_1166:
	sra	%i6,	%g6,	%o5
loop_1167:
	tsubcctv	%g2,	0x0845,	%g4
	edge32l	%i2,	%o7,	%i0
	sra	%i4,	0x07,	%o2
	edge32	%o1,	%l3,	%o6
	sll	%l4,	0x13,	%i3
	fcmpne32	%f26,	%f30,	%o4
	movcc	%icc,	%i5,	%l2
	movl	%icc,	%g7,	%g3
	edge8	%i7,	%o3,	%g1
	ta	%icc,	0x4
	umulcc	%l1,	%l6,	%i1
	edge16ln	%l5,	%o0,	%g5
	wr	%g0,	0x89,	%asi
	lda	[%l7 + 0x40] %asi,	%f18
	tvc	%icc,	0x0
	add	%l7,	0x2C,	%l6
	wr	%g0,	0x04,	%asi
	lda	[%l6] %asi,	%l0
	casa	[%l6] %asi,	%l0,	%i6
	fmovscc	%xcc,	%f2,	%f9
	edge32n	%g6,	%g2,	%g4
	set	0x40, %l3
	ldda	[%l7 + %l3] 0x2b,	%i2
	alignaddrl	%o5,	%i0,	%o7
	alignaddrl	%o2,	%o1,	%i4
	fors	%f28,	%f5,	%f17
	sdiv	%l3,	0x0E03,	%o6
	call	loop_1168
	and	%l4,	0x05BF,	%i3
	movge	%xcc,	%o4,	%i5
	ta	%xcc,	0x7
loop_1168:
	fbul	%fcc2,	loop_1169
	tne	%icc,	0x3
	movle	%icc,	%l2,	%g3
	tvs	%xcc,	0x1
loop_1169:
	edge32l	%i7,	%g7,	%o3
	fmovrsne	%l1,	%f13,	%f24
	wr	%g0,	0x89,	%asi
	lda	[%l7 + 0x34] %asi,	%f14
	fbl,a	%fcc0,	loop_1170
	fandnot1s	%f16,	%f18,	%f1
	fone	%f6
	faligndata	%f8,	%f26,	%f6
loop_1170:
	fbuge,a	%fcc3,	loop_1171
	bpos,a,pt	%icc,	loop_1172
	move	%xcc,	%l6,	%g1
	fsrc2	%f16,	%f16
loop_1171:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1172:
	te	%icc,	0x5
	tvs	%xcc,	0x3
	fsrc2	%f30,	%f4
	edge32	%i1,	%o0,	%l5
	andn	%l0,	0x1F28,	%g5
	tgu	%xcc,	0x5
	movleu	%xcc,	%g6,	%g2
	stx	%g4,	[%l7 + 0x30]
	bgu,a	%xcc,	loop_1173
	fmovsneg	%xcc,	%f19,	%f30
	ldx	[%l7 + 0x60],	%i6
	srlx	%o5,	0x05,	%i0
loop_1173:
	nop
	wr	%g0,	0x19,	%asi
	ldstuba	[%l7 + 0x15] %asi,	%o7
	fblg	%fcc2,	loop_1174
	edge32n	%o2,	%i2,	%o1
	flush	%l7 + 0x6C
	movvs	%icc,	%l3,	%i4
loop_1174:
	bneg	loop_1175
	tsubcc	%l4,	0x049D,	%i3
	umul	%o4,	0x1516,	%o6
	fmovscs	%xcc,	%f25,	%f5
loop_1175:
	tpos	%icc,	0x7
	movgu	%xcc,	%i5,	%l2
	fmul8sux16	%f8,	%f4,	%f28
	fbu,a	%fcc3,	loop_1176
	fcmpne32	%f18,	%f0,	%i7
	set	0x23, %l1
	lduba	[%l7 + %l1] 0x18,	%g3
loop_1176:
	movn	%xcc,	%o3,	%g7
	sdivcc	%l6,	0x05C4,	%l1
	alignaddrl	%g1,	%i1,	%l5
	ldx	[%l7 + 0x68],	%o0
	ba,a	%icc,	loop_1177
	fmovsvc	%icc,	%f5,	%f10
	fcmpes	%fcc3,	%f18,	%f1
	tleu	%icc,	0x3
loop_1177:
	edge32n	%l0,	%g5,	%g2
	edge8ln	%g4,	%i6,	%o5
	te	%xcc,	0x6
	andn	%g6,	0x1C99,	%i0
	fba,a	%fcc0,	loop_1178
	fnors	%f26,	%f16,	%f0
	fmovdne	%xcc,	%f8,	%f12
	fmovdne	%xcc,	%f22,	%f6
loop_1178:
	nop
	set	0x54, %i7
	ldstuba	[%l7 + %i7] 0x0c,	%o2
	edge8	%o7,	%i2,	%l3
	fmovsle	%xcc,	%f1,	%f31
	fmul8sux16	%f16,	%f22,	%f18
	brz,a	%o1,	loop_1179
	fmovrslz	%l4,	%f27,	%f15
	tleu	%xcc,	0x6
	ldsw	[%l7 + 0x18],	%i3
loop_1179:
	fexpand	%f16,	%f8
	fmovrslez	%o4,	%f10,	%f19
	udivcc	%o6,	0x1AF2,	%i4
	fsrc2	%f30,	%f4
	nop
	setx	loop_1180,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	edge16l	%l2,	%i7,	%g3
	movcc	%xcc,	%i5,	%g7
	tpos	%icc,	0x3
loop_1180:
	tge	%icc,	0x1
	bvc,a,pt	%icc,	loop_1181
	std	%o2,	[%l7 + 0x08]
	lduh	[%l7 + 0x18],	%l1
	srlx	%l6,	0x18,	%g1
loop_1181:
	fmovrdne	%i1,	%f18,	%f6
	edge32l	%o0,	%l5,	%l0
	edge16	%g5,	%g4,	%i6
	subc	%g2,	0x1236,	%o5
	pdist	%f2,	%f28,	%f10
	fbe,a	%fcc3,	loop_1182
	fmovdcs	%icc,	%f16,	%f11
	add	%i0,	%g6,	%o2
	edge16l	%o7,	%i2,	%l3
loop_1182:
	edge8	%o1,	%l4,	%o4
	bge,a	%xcc,	loop_1183
	fmovdle	%xcc,	%f21,	%f3
	fandnot1	%f28,	%f10,	%f2
	movg	%xcc,	%i3,	%o6
loop_1183:
	tle	%icc,	0x2
	movl	%icc,	%l2,	%i7
	fmovrde	%g3,	%f4,	%f12
	tpos	%icc,	0x7
	fpack32	%f22,	%f4,	%f26
	movvc	%icc,	%i5,	%g7
	andcc	%i4,	%o3,	%l6
	array32	%g1,	%l1,	%o0
	std	%i0,	[%l7 + 0x38]
	movrne	%l0,	%l5,	%g4
	ld	[%l7 + 0x40],	%f24
	mulscc	%i6,	%g5,	%o5
	orcc	%i0,	%g2,	%g6
	tle	%xcc,	0x5
	fmovdn	%icc,	%f15,	%f1
	alignaddr	%o7,	%o2,	%i2
	tle	%xcc,	0x0
	movcs	%icc,	%l3,	%l4
	tsubcc	%o1,	%o4,	%o6
	ble,pn	%xcc,	loop_1184
	array8	%i3,	%l2,	%i7
	nop
	setx	loop_1185,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fcmpeq32	%f2,	%f16,	%i5
loop_1184:
	addccc	%g3,	%i4,	%g7
	movne	%xcc,	%o3,	%l6
loop_1185:
	bvs	loop_1186
	ldsw	[%l7 + 0x44],	%l1
	movcs	%xcc,	%g1,	%i1
	tsubcc	%l0,	0x117A,	%l5
loop_1186:
	andn	%o0,	0x114C,	%g4
	subcc	%i6,	0x045A,	%g5
	nop
	setx	loop_1187,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fandnot1	%f12,	%f0,	%f6
	xor	%o5,	0x1259,	%i0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1187:
	tsubcctv	%g6,	0x01C1,	%o7
	edge8	%o2,	%i2,	%l3
	fpadd32s	%f12,	%f8,	%f27
	edge32l	%g2,	%l4,	%o4
	movrlz	%o1,	0x399,	%o6
	wr	%g0,	0x11,	%asi
	ldswa	[%l7 + 0x58] %asi,	%i3
	movre	%i7,	0x10C,	%i5
	set	0x40, %o4
	stda	%f0,	[%l7 + %o4] 0x11
	srlx	%l2,	0x19,	%i4
	brz	%g7,	loop_1188
	fands	%f17,	%f31,	%f13
	fcmpd	%fcc2,	%f14,	%f14
	udivx	%o3,	0x0AC5,	%l6
loop_1188:
	movl	%xcc,	%g3,	%g1
	movrne	%i1,	0x1E8,	%l1
	bcc,a,pn	%icc,	loop_1189
	edge16ln	%l0,	%o0,	%g4
	ldsw	[%l7 + 0x0C],	%l5
	and	%i6,	0x181D,	%o5
loop_1189:
	nop
	setx loop_1190, %l0, %l1
	jmpl %l1, %g5
	movrgz	%i0,	%o7,	%g6
	sdiv	%i2,	0x0D86,	%o2
	fones	%f26
loop_1190:
	fornot1s	%f10,	%f29,	%f9
	siam	0x4
	fpmerge	%f31,	%f23,	%f0
	fbo	%fcc1,	loop_1191
	ldsw	[%l7 + 0x30],	%g2
	fmovscc	%xcc,	%f25,	%f29
	ldd	[%l7 + 0x78],	%l4
loop_1191:
	taddcc	%l3,	%o4,	%o1
	sethi	0x056A,	%o6
	lduw	[%l7 + 0x6C],	%i7
	ldstub	[%l7 + 0x70],	%i5
	tl	%icc,	0x3
	tvs	%icc,	0x1
	edge16n	%i3,	%l2,	%i4
	fbuge,a	%fcc0,	loop_1192
	fmuld8sux16	%f8,	%f13,	%f6
	tn	%icc,	0x0
	fmovrsgez	%o3,	%f0,	%f29
loop_1192:
	sub	%g7,	%l6,	%g1
	srax	%i1,	0x17,	%l1
	for	%f2,	%f24,	%f6
	xorcc	%l0,	0x04BF,	%g3
	movcc	%xcc,	%g4,	%l5
	edge16	%i6,	%o0,	%g5
	fpsub32	%f24,	%f4,	%f24
	fcmpd	%fcc1,	%f20,	%f14
	membar	#Sync
	set	0x40, %l4
	ldda	[%l7 + %l4] 0xf0,	%f16
	edge8n	%o5,	%i0,	%g6
	tleu	%icc,	0x1
	flush	%l7 + 0x18
	sethi	0x15F1,	%i2
	bshuffle	%f2,	%f10,	%f10
	addccc	%o7,	0x01E2,	%g2
	fones	%f31
	fbn,a	%fcc0,	loop_1193
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsw	[%l7 + 0x70],	%l4
	sir	0x0EFA
loop_1193:
	nop
	set	0x6C, %o0
	ldsba	[%l7 + %o0] 0x11,	%l3
	srl	%o2,	0x0D,	%o1
	fornot2s	%f21,	%f13,	%f22
	movl	%xcc,	%o6,	%i7
	orcc	%i5,	0x1134,	%o4
	std	%l2,	[%l7 + 0x18]
	movl	%icc,	%i4,	%o3
	wr	%g0,	0x81,	%asi
	stba	%g7,	[%l7 + 0x69] %asi
	andcc	%i3,	0x1A0E,	%l6
	sdiv	%g1,	0x0CB7,	%l1
	tne	%xcc,	0x4
	array16	%i1,	%l0,	%g4
	fsrc1	%f4,	%f4
	array16	%l5,	%i6,	%g3
	fmovrdgez	%o0,	%f2,	%f18
	fbul	%fcc2,	loop_1194
	movvs	%icc,	%g5,	%o5
	umul	%g6,	%i0,	%i2
	array32	%g2,	%l4,	%o7
loop_1194:
	nop
	wr	%g0,	0x80,	%asi
	prefetcha	[%l7 + 0x08] %asi,	 0x0
	addc	%o1,	%o6,	%i7
	membar	0x5B
	bcs,a	%xcc,	loop_1195
	edge16n	%o2,	%o4,	%i5
	fpack32	%f20,	%f8,	%f24
	edge32	%i4,	%l2,	%o3
loop_1195:
	tvs	%icc,	0x0
	edge8	%i3,	%g7,	%g1
	fmovdgu	%icc,	%f6,	%f9
	tle	%icc,	0x3
	fmovsneg	%xcc,	%f31,	%f1
	be	%xcc,	loop_1196
	edge16	%l1,	%l6,	%l0
	fbo	%fcc0,	loop_1197
	brz,a	%g4,	loop_1198
loop_1196:
	fzeros	%f20
	and	%i1,	%i6,	%l5
loop_1197:
	tn	%xcc,	0x7
loop_1198:
	tpos	%xcc,	0x2
	movne	%xcc,	%o0,	%g3
	fzero	%f12
	fexpand	%f30,	%f0
	fmovrde	%g5,	%f0,	%f10
	bg,a	loop_1199
	fbul	%fcc2,	loop_1200
	nop
	setx loop_1201, %l0, %l1
	jmpl %l1, %o5
	fpmerge	%f25,	%f6,	%f24
loop_1199:
	fbl,a	%fcc2,	loop_1202
loop_1200:
	tneg	%icc,	0x6
loop_1201:
	srl	%i0,	0x15,	%i2
	xnorcc	%g6,	0x0D82,	%l4
loop_1202:
	smulcc	%g2,	%o7,	%l3
	movneg	%icc,	%o6,	%i7
	fmovsleu	%icc,	%f0,	%f6
	tn	%xcc,	0x2
	fbu	%fcc3,	loop_1203
	fnands	%f6,	%f21,	%f23
	wr	%g0,	0x89,	%asi
	ldswa	[%l7 + 0x34] %asi,	%o1
loop_1203:
	fpadd32s	%f17,	%f10,	%f13
	addc	%o4,	0x1C25,	%i5
	edge16ln	%o2,	%l2,	%i4
	movrgez	%o3,	%g7,	%i3
	bl	loop_1204
	fmovscc	%xcc,	%f27,	%f10
	movvc	%icc,	%g1,	%l6
	mova	%xcc,	%l1,	%l0
loop_1204:
	tcs	%icc,	0x6
	andn	%g4,	%i1,	%i6
	movrgez	%l5,	0x140,	%o0
	fmovrdgz	%g5,	%f30,	%f10
	fmovrslez	%g3,	%f6,	%f23
	array8	%o5,	%i0,	%g6
	fbn	%fcc2,	loop_1205
	fmovrdgz	%i2,	%f2,	%f22
	smulcc	%l4,	%g2,	%o7
	srl	%o6,	%i7,	%l3
loop_1205:
	be,pn	%icc,	loop_1206
	ba,pt	%xcc,	loop_1207
	tl	%icc,	0x2
	fcmple16	%f22,	%f16,	%o1
loop_1206:
	edge8	%i5,	%o4,	%l2
loop_1207:
	sdiv	%i4,	0x1EAC,	%o2
	brgz	%g7,	loop_1208
	movgu	%xcc,	%o3,	%g1
	bleu	%icc,	loop_1209
	sethi	0x1D38,	%l6
loop_1208:
	edge32l	%i3,	%l0,	%g4
	sth	%i1,	[%l7 + 0x34]
loop_1209:
	edge16	%l1,	%i6,	%l5
	edge8	%o0,	%g3,	%o5
	edge16l	%g5,	%g6,	%i0
	set	0x30, %o5
	ldsha	[%l7 + %o5] 0x18,	%i2
	st	%f15,	[%l7 + 0x54]
	umulcc	%g2,	%o7,	%l4
	tne	%xcc,	0x2
	fmovdcs	%icc,	%f2,	%f0
	wr	%g0,	0x89,	%asi
	stxa	%i7,	[%l7 + 0x68] %asi
	tleu	%xcc,	0x7
	std	%l2,	[%l7 + 0x10]
	brlez	%o1,	loop_1210
	alignaddrl	%i5,	%o6,	%o4
	tvs	%xcc,	0x5
	tl	%xcc,	0x2
loop_1210:
	movrgz	%i4,	%o2,	%g7
	fcmps	%fcc3,	%f13,	%f21
	tne	%icc,	0x3
	set	0x40, %g7
	stda	%f0,	[%l7 + %g7] 0x88
	te	%icc,	0x7
	te	%icc,	0x5
	subccc	%o3,	0x1008,	%l2
	fcmpgt16	%f30,	%f12,	%g1
	fornot1	%f22,	%f0,	%f0
	add	%l7,	0x58,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%i3
	casxa	[%l6] 0x80,	%i3,	%l0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	setx loop_1211, %l0, %l1
	jmpl %l1, %g4
	fpack16	%f6,	%f14
	tg	%icc,	0x3
	ld	[%l7 + 0x78],	%f28
loop_1211:
	srl	%l6,	0x10,	%i1
	add	%i6,	0x1448,	%l5
	ble	loop_1212
	popc	%l1,	%g3
	fpadd32s	%f21,	%f22,	%f16
	umulcc	%o0,	%o5,	%g5
loop_1212:
	fbue	%fcc0,	loop_1213
	fbe	%fcc3,	loop_1214
	fsrc2	%f24,	%f18
	umul	%i0,	0x06BE,	%i2
loop_1213:
	subccc	%g6,	%o7,	%l4
loop_1214:
	addccc	%i7,	0x0C88,	%l3
	brlz	%o1,	loop_1215
	bn,a	%xcc,	loop_1216
	fornot2s	%f11,	%f17,	%f4
	fmul8ulx16	%f28,	%f4,	%f0
loop_1215:
	edge8n	%g2,	%i5,	%o4
loop_1216:
	fsrc1s	%f25,	%f12
	popc	%o6,	%i4
	movg	%icc,	%o2,	%g7
	sethi	0x1465,	%o3
	movgu	%icc,	%g1,	%l2
	movcs	%icc,	%i3,	%g4
	movg	%xcc,	%l0,	%i1
	movvc	%icc,	%l6,	%l5
	movl	%xcc,	%i6,	%g3
	nop
	setx loop_1217, %l0, %l1
	jmpl %l1, %o0
	fmovde	%icc,	%f13,	%f19
	array32	%o5,	%l1,	%i0
	edge16	%g5,	%i2,	%o7
loop_1217:
	fmovscs	%xcc,	%f19,	%f23
	xor	%l4,	%g6,	%l3
	movcc	%icc,	%i7,	%o1
	flush	%l7 + 0x0C
	edge32	%g2,	%i5,	%o6
	fmovdvs	%xcc,	%f9,	%f25
	fbule	%fcc0,	loop_1218
	taddcc	%i4,	0x0AF2,	%o2
	fnot1	%f26,	%f18
	faligndata	%f26,	%f4,	%f16
loop_1218:
	xnor	%g7,	%o3,	%o4
	brz	%l2,	loop_1219
	addccc	%g1,	%i3,	%g4
	array8	%i1,	%l0,	%l6
	and	%l5,	0x1F05,	%i6
loop_1219:
	ld	[%l7 + 0x24],	%f12
	fmul8x16au	%f7,	%f20,	%f16
	mova	%icc,	%g3,	%o5
	wr	%g0,	0x11,	%asi
	swapa	[%l7 + 0x54] %asi,	%o0
	edge8ln	%i0,	%g5,	%l1
	fmovdle	%icc,	%f21,	%f10
	add	%l7,	0x20,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%i2,	%l4
	orncc	%o7,	%g6,	%i7
	ldsw	[%l7 + 0x3C],	%o1
	umulcc	%g2,	0x1FAD,	%l3
	fbue	%fcc2,	loop_1220
	edge16	%i5,	%o6,	%i4
	fpsub16	%f18,	%f26,	%f18
	fsrc1s	%f1,	%f27
loop_1220:
	tn	%xcc,	0x1
	bshuffle	%f14,	%f12,	%f16
	te	%xcc,	0x4
	fmovrdgz	%o2,	%f14,	%f4
	fbg,a	%fcc0,	loop_1221
	umulcc	%o3,	0x0BE3,	%o4
	addcc	%l2,	0x00D6,	%g1
	fbuge	%fcc1,	loop_1222
loop_1221:
	movrlez	%g7,	0x247,	%i3
	sir	0x10BE
	edge32l	%g4,	%i1,	%l0
loop_1222:
	fcmpes	%fcc1,	%f3,	%f8
	wr	%g0,	0x11,	%asi
	stxa	%l5,	[%l7 + 0x68] %asi
	bl,a	%icc,	loop_1223
	sir	0x1B9A
	movleu	%xcc,	%l6,	%g3
	fblg,a	%fcc0,	loop_1224
loop_1223:
	move	%icc,	%o5,	%o0
	smul	%i0,	0x0074,	%i6
	umul	%g5,	0x19E3,	%l1
loop_1224:
	te	%xcc,	0x7
	bpos	%icc,	loop_1225
	ldub	[%l7 + 0x55],	%i2
	movne	%icc,	%l4,	%o7
	subccc	%i7,	0x1A8B,	%g6
loop_1225:
	brgz,a	%g2,	loop_1226
	fbule,a	%fcc0,	loop_1227
	fone	%f24
	movne	%xcc,	%l3,	%i5
loop_1226:
	movrgez	%o1,	%o6,	%i4
loop_1227:
	tne	%icc,	0x0
	array8	%o3,	%o2,	%l2
	fmovdne	%xcc,	%f30,	%f8
	movneg	%xcc,	%o4,	%g7
	sllx	%g1,	0x10,	%i3
	tneg	%icc,	0x2
	tleu	%icc,	0x3
	movge	%xcc,	%i1,	%l0
	taddcc	%l5,	0x1B07,	%g4
	bneg,a	loop_1228
	movle	%xcc,	%g3,	%l6
	tl	%xcc,	0x7
	fbg,a	%fcc1,	loop_1229
loop_1228:
	subcc	%o0,	0x00FF,	%o5
	ldub	[%l7 + 0x39],	%i6
	xorcc	%g5,	0x0633,	%i0
loop_1229:
	tn	%icc,	0x2
	fmovdne	%icc,	%f16,	%f8
	movrgz	%l1,	%i2,	%l4
	array32	%i7,	%o7,	%g2
	udiv	%l3,	0x06B2,	%i5
	set	0x42, %l2
	ldsba	[%l7 + %l2] 0x10,	%g6
	xnor	%o1,	%o6,	%o3
	array32	%i4,	%o2,	%o4
	smul	%g7,	0x06C0,	%l2
	array32	%g1,	%i3,	%l0
	tsubcctv	%i1,	0x101B,	%l5
	bne,a,pn	%icc,	loop_1230
	fmovde	%icc,	%f23,	%f13
	fnot2s	%f22,	%f4
	nop
	setx loop_1231, %l0, %l1
	jmpl %l1, %g4
loop_1230:
	fmovrdlz	%g3,	%f14,	%f2
	subc	%o0,	%o5,	%l6
	smulcc	%g5,	0x01EB,	%i6
loop_1231:
	mulx	%l1,	%i0,	%l4
	fmovdvc	%xcc,	%f30,	%f2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fba	%fcc1,	loop_1232
	brnz,a	%i2,	loop_1233
	fand	%f0,	%f20,	%f30
	addcc	%i7,	%o7,	%l3
loop_1232:
	taddcctv	%i5,	%g2,	%o1
loop_1233:
	movgu	%icc,	%o6,	%o3
	bcc,pt	%xcc,	loop_1234
	fmovrsgz	%g6,	%f26,	%f18
	movrne	%i4,	0x2BD,	%o2
	bpos,pn	%xcc,	loop_1235
loop_1234:
	call	loop_1236
	tsubcctv	%o4,	%l2,	%g1
	fones	%f23
loop_1235:
	ta	%xcc,	0x2
loop_1236:
	ldsh	[%l7 + 0x4C],	%g7
	srlx	%i3,	0x00,	%l0
	xorcc	%i1,	%g4,	%g3
	srl	%l5,	%o5,	%l6
	ldub	[%l7 + 0x48],	%g5
	membar	0x74
	udivcc	%i6,	0x0B1C,	%l1
	sdiv	%o0,	0x139F,	%l4
	popc	%i2,	%i0
	movrlz	%i7,	%o7,	%i5
	sdivx	%l3,	0x115C,	%g2
	sub	%o1,	0x0FE4,	%o3
	edge8	%o6,	%i4,	%g6
	tsubcc	%o4,	%l2,	%g1
	fmuld8sux16	%f28,	%f23,	%f26
	movcs	%icc,	%g7,	%i3
	membar	0x13
	movrgez	%l0,	%i1,	%g4
	ldsh	[%l7 + 0x0C],	%o2
	ldsh	[%l7 + 0x10],	%g3
	addc	%o5,	0x09B5,	%l6
	or	%l5,	0x105A,	%g5
	edge32n	%i6,	%o0,	%l4
	tsubcc	%i2,	0x1314,	%i0
	fmovdne	%icc,	%f17,	%f16
	fpack16	%f0,	%f28
	fcmpgt32	%f18,	%f16,	%l1
	nop
	set	0x2E, %o7
	stb	%i7,	[%l7 + %o7]
	tn	%icc,	0x4
	fbug	%fcc2,	loop_1237
	fpadd16	%f4,	%f22,	%f16
	tcs	%icc,	0x1
	edge8n	%i5,	%l3,	%g2
loop_1237:
	subc	%o1,	%o3,	%o6
	edge8l	%o7,	%i4,	%o4
	fmovdgu	%xcc,	%f29,	%f23
	fmovsle	%icc,	%f3,	%f14
	sdiv	%g6,	0x026D,	%g1
	nop
	set	0x37, %g5
	ldub	[%l7 + %g5],	%l2
	srlx	%i3,	0x1B,	%g7
	fmovsne	%xcc,	%f27,	%f14
	fmul8sux16	%f6,	%f28,	%f18
	orncc	%i1,	%l0,	%o2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ble,a,pn	%icc,	loop_1238
	mulscc	%g3,	0x17F8,	%g4
	subcc	%l6,	%l5,	%g5
	andcc	%o5,	0x1776,	%o0
loop_1238:
	tvc	%xcc,	0x3
	sethi	0x132B,	%l4
	udivcc	%i2,	0x0E8A,	%i0
	set	0x18, %g1
	lduwa	[%l7 + %g1] 0x14,	%l1
	ta	%icc,	0x1
	mulscc	%i6,	%i5,	%i7
	movrne	%g2,	%l3,	%o1
	sethi	0x1178,	%o3
	fmovrdgz	%o6,	%f0,	%f28
	addcc	%i4,	%o4,	%o7
	fornot1	%f24,	%f26,	%f30
	umul	%g6,	%l2,	%g1
	edge8ln	%g7,	%i1,	%l0
	popc	0x1414,	%o2
	fpadd16	%f22,	%f6,	%f30
	set	0x10, %g3
	prefetcha	[%l7 + %g3] 0x04,	 0x1
	xnor	%g3,	0x1DC8,	%l6
	for	%f30,	%f6,	%f24
	fxor	%f30,	%f30,	%f26
	andn	%l5,	0x037C,	%g4
	ble,pn	%icc,	loop_1239
	std	%f10,	[%l7 + 0x18]
	fcmpne16	%f20,	%f30,	%g5
	fpsub32s	%f11,	%f30,	%f16
loop_1239:
	array8	%o0,	%o5,	%i2
	fpmerge	%f13,	%f11,	%f28
	sir	0x11FF
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdgu	%icc,	%f20,	%f13
	be,a,pn	%icc,	loop_1240
	mulx	%l4,	%l1,	%i0
	tgu	%icc,	0x5
	fxnor	%f2,	%f24,	%f28
loop_1240:
	tsubcc	%i6,	0x0C60,	%i5
	movrgz	%i7,	%l3,	%o1
	fmovsvs	%xcc,	%f25,	%f19
	ldd	[%l7 + 0x10],	%g2
	srlx	%o6,	0x19,	%i4
	fmovrse	%o3,	%f26,	%f31
	srl	%o4,	0x16,	%g6
	smul	%l2,	%g1,	%o7
	fblg,a	%fcc3,	loop_1241
	tcs	%xcc,	0x4
	ldx	[%l7 + 0x38],	%g7
	std	%f30,	[%l7 + 0x70]
loop_1241:
	edge16ln	%l0,	%i1,	%i3
	bvc,a,pt	%xcc,	loop_1242
	addc	%o2,	%l6,	%g3
	andn	%g4,	%l5,	%g5
	tne	%xcc,	0x6
loop_1242:
	tcc	%icc,	0x5
	tne	%xcc,	0x5
	popc	0x0BD6,	%o0
	fexpand	%f27,	%f20
	tcs	%xcc,	0x5
	array32	%i2,	%o5,	%l1
	swap	[%l7 + 0x20],	%l4
	sll	%i0,	%i6,	%i7
	fand	%f22,	%f12,	%f18
	fmovsvs	%xcc,	%f5,	%f19
	edge16l	%i5,	%l3,	%g2
	set	0x2C, %g6
	ldswa	[%l7 + %g6] 0x10,	%o6
	udivcc	%o1,	0x1F36,	%o3
	wr	%g0,	0x11,	%asi
	ldswa	[%l7 + 0x0C] %asi,	%o4
	edge8	%i4,	%g6,	%l2
	fmul8x16au	%f9,	%f24,	%f16
	movneg	%icc,	%o7,	%g1
	addccc	%g7,	%i1,	%l0
	fbge,a	%fcc0,	loop_1243
	brgz,a	%o2,	loop_1244
	flush	%l7 + 0x5C
	smul	%i3,	0x193F,	%g3
loop_1243:
	st	%f19,	[%l7 + 0x58]
loop_1244:
	tpos	%xcc,	0x1
	movrlez	%g4,	0x2D8,	%l5
	or	%g5,	0x0AC8,	%o0
	movl	%icc,	%l6,	%i2
	edge32n	%o5,	%l4,	%i0
	umul	%l1,	%i6,	%i5
	fxors	%f18,	%f12,	%f13
	prefetch	[%l7 + 0x28],	 0x1
	tvs	%xcc,	0x0
	call	loop_1245
	movcs	%icc,	%l3,	%i7
	set	0x3c0, %i1
	nop 	! 	nop 	! 	ldxa	[%g0 + %i1] 0x40,	%g2 ripped by fixASI40.pl ripped by fixASI40.pl
loop_1245:
	addcc	%o6,	0x066F,	%o3
	addccc	%o4,	0x0F1E,	%o1
	brlz,a	%g6,	loop_1246
	ta	%xcc,	0x3
	sdivx	%l2,	0x0383,	%o7
	brnz	%g1,	loop_1247
loop_1246:
	movle	%xcc,	%g7,	%i4
	array32	%l0,	%o2,	%i1
	movge	%icc,	%g3,	%i3
loop_1247:
	fmovrdgez	%l5,	%f30,	%f26
	fbuge,a	%fcc1,	loop_1248
	umul	%g4,	0x03B0,	%g5
	brgz,a	%l6,	loop_1249
	fone	%f12
loop_1248:
	edge16ln	%o0,	%i2,	%l4
	stbar
loop_1249:
	fpmerge	%f14,	%f15,	%f12
	edge16l	%i0,	%l1,	%o5
	fbuge	%fcc0,	loop_1250
	array32	%i6,	%i5,	%i7
	or	%g2,	%o6,	%l3
	fmuld8sux16	%f31,	%f30,	%f22
loop_1250:
	xor	%o3,	%o1,	%o4
	fmovd	%f4,	%f6
	fexpand	%f10,	%f8
	tsubcc	%l2,	%o7,	%g1
	bne,a,pt	%icc,	loop_1251
	sdivx	%g7,	0x0332,	%i4
	and	%l0,	%g6,	%o2
	flush	%l7 + 0x48
loop_1251:
	movrgez	%g3,	%i3,	%i1
	udiv	%l5,	0x0064,	%g5
	movrgz	%g4,	%o0,	%i2
	te	%icc,	0x1
	movrne	%l4,	%i0,	%l1
	edge32n	%l6,	%o5,	%i5
	fandnot1	%f8,	%f22,	%f22
	fmovsn	%xcc,	%f30,	%f4
	popc	%i7,	%g2
	array8	%o6,	%l3,	%o3
	edge8	%i6,	%o1,	%l2
	tleu	%icc,	0x1
	wr	%g0,	0x81,	%asi
	lda	[%l7 + 0x4C] %asi,	%f9
	edge32	%o7,	%g1,	%g7
	tvc	%xcc,	0x0
	tcs	%xcc,	0x0
	edge32n	%i4,	%o4,	%l0
	set	0x08, %g4
	prefetcha	[%l7 + %g4] 0x80,	 0x3
	orncc	%o2,	0x1D52,	%i3
	set	0x62, %i5
	stha	%i1,	[%l7 + %i5] 0x89
	edge32	%g3,	%l5,	%g5
	set	0x47, %i3
	lduba	[%l7 + %i3] 0x89,	%g4
	edge32l	%i2,	%o0,	%l4
	fba,a	%fcc0,	loop_1252
	add	%l1,	%l6,	%i0
	membar	0x48
	mulscc	%i5,	%i7,	%g2
loop_1252:
	bn,a	loop_1253
	udivcc	%o5,	0x0352,	%o6
	prefetch	[%l7 + 0x70],	 0x3
	edge8ln	%o3,	%l3,	%o1
loop_1253:
	edge16ln	%i6,	%l2,	%o7
	sra	%g1,	%i4,	%g7
	fornot1	%f20,	%f8,	%f26
	tvc	%xcc,	0x6
	umulcc	%l0,	%o4,	%g6
	edge16l	%i3,	%i1,	%g3
	st	%f3,	[%l7 + 0x4C]
	fpadd16	%f10,	%f20,	%f4
	fmovrdgz	%l5,	%f10,	%f12
	add	%l7,	0x70,	%l6
	wr	%g0,	0x19,	%asi
	casa	[%l6] %asi,	%g5,	%o2
	sll	%i2,	%g4,	%l4
	bvc,a	%icc,	loop_1254
	fands	%f28,	%f23,	%f31
	fmovda	%icc,	%f4,	%f10
	tgu	%xcc,	0x4
loop_1254:
	addccc	%l1,	%l6,	%o0
	udivcc	%i5,	0x110E,	%i0
	be,a,pn	%xcc,	loop_1255
	for	%f18,	%f10,	%f26
	movpos	%xcc,	%i7,	%o5
	wr	%g0,	0x27,	%asi
	stwa	%o6,	[%l7 + 0x68] %asi
	membar	#Sync
loop_1255:
	fmovsleu	%icc,	%f28,	%f7
	addcc	%g2,	%l3,	%o1
	tneg	%xcc,	0x1
	fmovdcs	%xcc,	%f30,	%f2
	wr	%g0,	0x2f,	%asi
	stha	%o3,	[%l7 + 0x12] %asi
	membar	#Sync
	brz	%i6,	loop_1256
	movrne	%l2,	0x0A3,	%o7
	edge8	%g1,	%i4,	%g7
	edge16l	%l0,	%o4,	%g6
loop_1256:
	edge16n	%i3,	%g3,	%i1
	movg	%xcc,	%g5,	%l5
	movcc	%xcc,	%o2,	%i2
	wr	%g0,	0x11,	%asi
	ldswa	[%l7 + 0x20] %asi,	%g4
	edge32ln	%l1,	%l6,	%o0
	alignaddr	%i5,	%l4,	%i0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sra	%i7,	%o6,	%o5
	bcc	loop_1257
	fmovrdgz	%l3,	%f6,	%f20
	tvc	%xcc,	0x7
	sra	%g2,	%o1,	%i6
loop_1257:
	fands	%f26,	%f15,	%f9
	set	0x60, %i4
	ldda	[%l7 + %i4] 0x2f,	%o2
	ba,pn	%icc,	loop_1258
	srlx	%o7,	0x0A,	%l2
	tpos	%icc,	0x1
	movne	%xcc,	%i4,	%g7
loop_1258:
	xor	%l0,	0x05F8,	%o4
	ba,a	loop_1259
	movcc	%icc,	%g1,	%g6
	movre	%g3,	0x132,	%i3
	andcc	%g5,	0x0CC0,	%i1
loop_1259:
	mulx	%o2,	0x06AD,	%l5
	fpadd16	%f22,	%f2,	%f30
	popc	0x0836,	%i2
	fpadd16s	%f0,	%f17,	%f25
	fxnor	%f10,	%f8,	%f2
	edge8n	%l1,	%g4,	%o0
	set	0x44, %l5
	sta	%f21,	[%l7 + %l5] 0x19
	mulscc	%i5,	%l4,	%i0
	wr	%g0,	0x19,	%asi
	ldda	[%l7 + 0x40] %asi,	%i6
	subccc	%o6,	0x0A6B,	%l6
	movl	%icc,	%o5,	%g2
	fbg,a	%fcc2,	loop_1260
	movneg	%xcc,	%l3,	%i6
	add	%o3,	%o1,	%o7
	movcs	%xcc,	%i4,	%l2
loop_1260:
	fmovdneg	%icc,	%f25,	%f18
	tvc	%icc,	0x7
	tneg	%icc,	0x7
	fbne	%fcc1,	loop_1261
	sdivx	%l0,	0x0CC7,	%g7
	and	%o4,	%g6,	%g1
	addcc	%i3,	%g3,	%i1
loop_1261:
	fpsub32s	%f1,	%f6,	%f26
	movg	%xcc,	%o2,	%l5
	edge8l	%i2,	%l1,	%g4
	set	0x50, %i6
	stwa	%o0,	[%l7 + %i6] 0x19
	popc	0x168E,	%g5
	edge8l	%i5,	%l4,	%i0
	sllx	%i7,	0x06,	%o6
	udivcc	%o5,	0x0637,	%l6
	bcs	%xcc,	loop_1262
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	umul	%g2,	0x1982,	%i6
	fnegd	%f24,	%f14
loop_1262:
	fbn,a	%fcc3,	loop_1263
	bneg,a	%icc,	loop_1264
	umulcc	%l3,	%o3,	%o1
	srlx	%i4,	%l2,	%o7
loop_1263:
	alignaddrl	%l0,	%g7,	%g6
loop_1264:
	bvs	%xcc,	loop_1265
	tpos	%icc,	0x7
	smulcc	%g1,	0x074F,	%o4
	sethi	0x15A2,	%g3
loop_1265:
	taddcctv	%i3,	0x00EF,	%i1
	tneg	%xcc,	0x5
	set	0x40, %i0
	stda	%o2,	[%l7 + %i0] 0x19
	movrgez	%i2,	%l5,	%g4
	fzeros	%f6
	fxors	%f6,	%f19,	%f5
	umul	%l1,	0x15CD,	%g5
	wr	%g0,	0x19,	%asi
	lduba	[%l7 + 0x1B] %asi,	%i5
	fzero	%f8
	movneg	%xcc,	%o0,	%i0
	fcmpne32	%f8,	%f18,	%i7
	fmovrde	%l4,	%f0,	%f8
	movrlz	%o6,	0x177,	%o5
	fnand	%f16,	%f22,	%f30
	fsrc2	%f14,	%f12
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fabsd	%f6,	%f18
	udivx	%l6,	0x1BD0,	%g2
	tn	%icc,	0x1
	fpadd32	%f12,	%f0,	%f14
	orncc	%i6,	0x1AFF,	%l3
	mova	%xcc,	%o1,	%o3
	tcs	%xcc,	0x2
	tpos	%icc,	0x0
	mulx	%i4,	0x1B4A,	%l2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddrl	%o7,	%l0,	%g6
	fbule,a	%fcc0,	loop_1266
	fmovspos	%xcc,	%f3,	%f26
	sra	%g1,	%g7,	%o4
	fmovde	%icc,	%f18,	%f17
loop_1266:
	fbne	%fcc1,	loop_1267
	fcmpes	%fcc3,	%f18,	%f28
	tne	%xcc,	0x1
	array16	%g3,	%i1,	%o2
loop_1267:
	smul	%i3,	%l5,	%g4
	sllx	%l1,	%i2,	%g5
	bcc,a	loop_1268
	fbul	%fcc1,	loop_1269
	nop
	setx	loop_1270,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tvc	%icc,	0x0
loop_1268:
	sllx	%i5,	%i0,	%i7
loop_1269:
	fmovsn	%icc,	%f28,	%f1
loop_1270:
	subc	%l4,	%o6,	%o5
	set	0x60, %o3
	stda	%i6,	[%l7 + %o3] 0x2b
	membar	#Sync
	set	0x70, %o1
	swapa	[%l7 + %o1] 0x10,	%o0
	movrne	%i6,	%g2,	%o1
	edge32l	%o3,	%i4,	%l2
	tg	%icc,	0x7
	subcc	%o7,	%l0,	%g6
	wr	%g0,	0x89,	%asi
	stda	%g0,	[%l7 + 0x50] %asi
	nop
	setx	loop_1271,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	bvs,a,pn	%icc,	loop_1272
	subc	%g7,	%l3,	%g3
	movg	%icc,	%i1,	%o2
loop_1271:
	edge8ln	%o4,	%i3,	%l5
loop_1272:
	tneg	%icc,	0x5
	sth	%l1,	[%l7 + 0x74]
	fbul,a	%fcc1,	loop_1273
	array16	%i2,	%g5,	%i5
	bl	loop_1274
	xorcc	%i0,	%i7,	%g4
loop_1273:
	movpos	%icc,	%o6,	%l4
	fble	%fcc0,	loop_1275
loop_1274:
	fbuge,a	%fcc2,	loop_1276
	sllx	%o5,	%l6,	%o0
	fbne,a	%fcc0,	loop_1277
loop_1275:
	ble	loop_1278
loop_1276:
	fpsub16	%f16,	%f24,	%f10
	tpos	%icc,	0x6
loop_1277:
	smulcc	%g2,	%i6,	%o3
loop_1278:
	edge8l	%o1,	%i4,	%l2
	set	0x55, %l6
	ldsba	[%l7 + %l6] 0x04,	%o7
	fmovrse	%g6,	%f3,	%f18
	fmovrsgez	%l0,	%f11,	%f2
	fors	%f18,	%f25,	%f16
	tpos	%xcc,	0x1
	fands	%f10,	%f16,	%f10
	set	0x44, %l0
	swapa	[%l7 + %l0] 0x80,	%g1
	movle	%xcc,	%g7,	%l3
	array16	%i1,	%g3,	%o4
	taddcctv	%i3,	0x1E28,	%o2
	smulcc	%l5,	0x1D0B,	%i2
	movpos	%xcc,	%g5,	%i5
	fnands	%f4,	%f1,	%f6
	edge8	%l1,	%i0,	%i7
	fnot1s	%f17,	%f20
	xorcc	%g4,	0x0AFE,	%l4
	xor	%o6,	0x1E5D,	%l6
	ldx	[%l7 + 0x78],	%o0
	fpadd32s	%f29,	%f22,	%f7
	taddcc	%g2,	0x190D,	%i6
	tsubcc	%o3,	0x0F37,	%o5
	fmovdcc	%icc,	%f12,	%f20
	fmovdvc	%icc,	%f3,	%f10
	fblg,a	%fcc2,	loop_1279
	pdist	%f6,	%f12,	%f14
	std	%f2,	[%l7 + 0x58]
	brnz,a	%i4,	loop_1280
loop_1279:
	ldsw	[%l7 + 0x60],	%l2
	orncc	%o7,	%g6,	%l0
	sllx	%g1,	%g7,	%l3
loop_1280:
	fmovrdne	%o1,	%f10,	%f16
	array32	%i1,	%g3,	%i3
	array32	%o2,	%l5,	%i2
	movrlz	%o4,	0x18B,	%g5
	bn,pt	%icc,	loop_1281
	addcc	%l1,	%i0,	%i7
	mova	%xcc,	%g4,	%i5
	bpos	loop_1282
loop_1281:
	bcc,a,pn	%icc,	loop_1283
	fmovdge	%icc,	%f24,	%f19
	fbne	%fcc1,	loop_1284
loop_1282:
	tsubcc	%o6,	%l6,	%l4
loop_1283:
	ble,pn	%icc,	loop_1285
	bgu,pt	%xcc,	loop_1286
loop_1284:
	tvc	%icc,	0x6
	fbo	%fcc2,	loop_1287
loop_1285:
	fmovdvc	%xcc,	%f0,	%f29
loop_1286:
	fzeros	%f3
	xnor	%o0,	%i6,	%g2
loop_1287:
	fmovsa	%icc,	%f21,	%f17
	movne	%xcc,	%o5,	%i4
	tge	%xcc,	0x3
	movneg	%xcc,	%o3,	%l2
	add	%o7,	0x031D,	%l0
	set	0x48, %i2
	lda	[%l7 + %i2] 0x10,	%f30
	edge32ln	%g6,	%g1,	%l3
	subc	%o1,	0x00BF,	%g7
	fandnot2s	%f2,	%f18,	%f2
	bvc,pn	%xcc,	loop_1288
	ble,a	%icc,	loop_1289
	orn	%g3,	%i1,	%i3
	or	%o2,	0x1B03,	%l5
loop_1288:
	sra	%o4,	0x0C,	%i2
loop_1289:
	array32	%l1,	%i0,	%i7
	edge16n	%g4,	%i5,	%o6
	edge32n	%l6,	%g5,	%o0
	ldx	[%l7 + 0x10],	%l4
	tle	%icc,	0x1
	tge	%xcc,	0x5
	st	%f2,	[%l7 + 0x10]
	brgez,a	%g2,	loop_1290
	mova	%xcc,	%o5,	%i4
	fnands	%f22,	%f3,	%f2
	movrlz	%o3,	0x20F,	%l2
loop_1290:
	edge16ln	%i6,	%o7,	%g6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x80,	%asi
	sta	%f25,	[%l7 + 0x34] %asi
	fmovdg	%icc,	%f11,	%f29
	movneg	%xcc,	%l0,	%l3
	umul	%g1,	%o1,	%g7
	movvc	%icc,	%g3,	%i1
	ldd	[%l7 + 0x18],	%o2
	fmovdl	%xcc,	%f27,	%f27
	movleu	%icc,	%l5,	%i3
	addcc	%i2,	0x0CBB,	%l1
	andn	%o4,	%i0,	%g4
	tne	%icc,	0x7
	sir	0x0295
	tn	%icc,	0x7
	tpos	%icc,	0x4
	addc	%i7,	0x1C91,	%o6
	andcc	%i5,	0x0156,	%g5
	brz,a	%o0,	loop_1291
	fbn	%fcc0,	loop_1292
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bn	%icc,	loop_1293
loop_1291:
	fxnors	%f8,	%f2,	%f15
loop_1292:
	fbl	%fcc2,	loop_1294
	bn,a	%icc,	loop_1295
loop_1293:
	movrlez	%l6,	0x223,	%g2
	stx	%o5,	[%l7 + 0x28]
loop_1294:
	std	%f0,	[%l7 + 0x58]
loop_1295:
	movrlez	%i4,	%o3,	%l2
	alignaddrl	%l4,	%i6,	%g6
	nop
	setx loop_1296, %l0, %l1
	jmpl %l1, %l0
	mulscc	%o7,	0x0FBB,	%l3
	wr	%g0,	0x10,	%asi
	stxa	%g1,	[%l7 + 0x60] %asi
loop_1296:
	sll	%o1,	%g3,	%g7
	umulcc	%o2,	0x0E57,	%l5
	brnz,a	%i1,	loop_1297
	sir	0x188B
	wr	%g0,	0x89,	%asi
	sta	%f20,	[%l7 + 0x2C] %asi
loop_1297:
	orn	%i3,	%i2,	%l1
	sdivcc	%o4,	0x14CA,	%i0
	fbuge	%fcc0,	loop_1298
	subc	%g4,	0x0C05,	%o6
	edge32	%i7,	%g5,	%i5
	ldd	[%l7 + 0x28],	%i6
loop_1298:
	bg,a,pn	%xcc,	loop_1299
	fcmpeq32	%f16,	%f30,	%o0
	fmul8sux16	%f4,	%f30,	%f2
	movvs	%xcc,	%g2,	%i4
loop_1299:
	fabss	%f24,	%f24
	fcmpeq32	%f26,	%f30,	%o5
	fmul8ulx16	%f18,	%f10,	%f16
	array32	%o3,	%l2,	%i6
	sdivcc	%l4,	0x0813,	%g6
	nop
	setx loop_1300, %l0, %l1
	jmpl %l1, %l0
	srlx	%l3,	0x1F,	%o7
	umul	%o1,	%g3,	%g1
	fpsub32	%f24,	%f28,	%f2
loop_1300:
	movvc	%icc,	%o2,	%l5
	popc	0x1BBA,	%i1
	tsubcctv	%i3,	0x1178,	%g7
	nop
	setx	loop_1301,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fmovsa	%xcc,	%f2,	%f12
	fbule	%fcc2,	loop_1302
	fandnot1s	%f26,	%f4,	%f28
loop_1301:
	orncc	%l1,	0x0791,	%o4
	fbue,a	%fcc2,	loop_1303
loop_1302:
	fcmpne16	%f24,	%f28,	%i0
	fmovsg	%xcc,	%f7,	%f18
	fones	%f5
loop_1303:
	xor	%g4,	0x124B,	%i2
	andncc	%i7,	%g5,	%i5
	brnz,a	%o6,	loop_1304
	brnz	%o0,	loop_1305
	subc	%l6,	%i4,	%o5
	movn	%icc,	%o3,	%l2
loop_1304:
	movrgez	%g2,	0x2B7,	%l4
loop_1305:
	nop
	add	%l7,	0x50,	%l6
	wr	%g0,	0x11,	%asi
	casxa	[%l6] %asi,	%g6,	%i6
	srl	%l0,	0x0E,	%l3
	addcc	%o1,	0x1AAC,	%g3
	fbule,a	%fcc1,	loop_1306
	fbge,a	%fcc1,	loop_1307
	subc	%o7,	%g1,	%l5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1306:
	edge16ln	%o2,	%i1,	%i3
loop_1307:
	nop
	wr	%g0,	0x04,	%asi
	ldstuba	[%l7 + 0x20] %asi,	%l1
	ldub	[%l7 + 0x77],	%g7
	fcmpeq32	%f22,	%f12,	%i0
	fpsub32s	%f3,	%f27,	%f13
	fmovsvc	%icc,	%f24,	%f5
	std	%f10,	[%l7 + 0x10]
	sdivx	%o4,	0x055B,	%i2
	lduw	[%l7 + 0x70],	%g4
	and	%i7,	%g5,	%o6
	bcs	%xcc,	loop_1308
	mova	%icc,	%i5,	%o0
	fbu,a	%fcc1,	loop_1309
	edge8l	%i4,	%o5,	%l6
loop_1308:
	movgu	%xcc,	%l2,	%o3
	bg	loop_1310
loop_1309:
	tcs	%xcc,	0x4
	fmovdcs	%icc,	%f19,	%f17
	sethi	0x1A2B,	%g2
loop_1310:
	fmovse	%icc,	%f7,	%f23
	edge16	%l4,	%g6,	%i6
	fba,a	%fcc1,	loop_1311
	addc	%l3,	0x01F2,	%l0
	tcc	%icc,	0x7
	fmul8sux16	%f30,	%f6,	%f6
loop_1311:
	nop
	set	0x20, %o2
	swapa	[%l7 + %o2] 0x89,	%g3
	fnot2s	%f16,	%f30
	tle	%icc,	0x5
	movne	%icc,	%o1,	%o7
	fmul8x16al	%f12,	%f11,	%f12
	ldd	[%l7 + 0x50],	%g0
	fba	%fcc2,	loop_1312
	bne,a,pn	%xcc,	loop_1313
	edge8n	%o2,	%i1,	%l5
	movleu	%xcc,	%i3,	%l1
loop_1312:
	tvc	%icc,	0x0
loop_1313:
	tsubcc	%i0,	%o4,	%i2
	tsubcctv	%g7,	0x1587,	%i7
	srax	%g4,	%o6,	%i5
	movle	%xcc,	%g5,	%o0
	fcmpgt32	%f8,	%f10,	%o5
	stw	%i4,	[%l7 + 0x28]
	tsubcc	%l6,	%o3,	%l2
	fornot1s	%f15,	%f4,	%f2
	bl	%xcc,	loop_1314
	edge32	%g2,	%l4,	%g6
	subcc	%l3,	0x1425,	%l0
	srax	%i6,	0x12,	%o1
loop_1314:
	ba,a	%icc,	loop_1315
	tpos	%icc,	0x1
	movre	%g3,	%g1,	%o7
	movcc	%icc,	%o2,	%l5
loop_1315:
	edge16ln	%i3,	%i1,	%l1
	fpsub16	%f0,	%f24,	%f24
	tleu	%icc,	0x1
	pdist	%f14,	%f16,	%f10
	fandnot1s	%f22,	%f14,	%f3
	sdivcc	%i0,	0x11B7,	%o4
	movle	%icc,	%g7,	%i2
	tleu	%xcc,	0x0
	subc	%g4,	0x0894,	%i7
	wr	%g0,	0x10,	%asi
	stda	%i4,	[%l7 + 0x58] %asi
	fornot1s	%f11,	%f30,	%f24
	srax	%g5,	0x03,	%o0
	ldsh	[%l7 + 0x4C],	%o6
	set	0x40, %o6
	stda	%f0,	[%l7 + %o6] 0xf1
	membar	#Sync
	tle	%xcc,	0x1
	bl,a,pt	%icc,	loop_1316
	ldsw	[%l7 + 0x60],	%o5
	ld	[%l7 + 0x2C],	%f0
	movle	%xcc,	%l6,	%i4
loop_1316:
	fmovrdlez	%o3,	%f6,	%f6
	fbug	%fcc1,	loop_1317
	edge8l	%l2,	%g2,	%l4
	tleu	%icc,	0x2
	brgez,a	%g6,	loop_1318
loop_1317:
	sdivx	%l3,	0x16EA,	%i6
	std	%f14,	[%l7 + 0x38]
	fmovscc	%icc,	%f0,	%f24
loop_1318:
	movge	%xcc,	%o1,	%g3
	edge16n	%g1,	%o7,	%l0
	fmovrslz	%l5,	%f24,	%f9
	fmovsvc	%xcc,	%f12,	%f3
	bneg,a	loop_1319
	tneg	%xcc,	0x0
	bvs	loop_1320
	orcc	%o2,	%i3,	%l1
loop_1319:
	for	%f10,	%f18,	%f16
	for	%f24,	%f20,	%f20
loop_1320:
	movneg	%icc,	%i0,	%o4
	wr	%g0,	0x0c,	%asi
	ldsha	[%l7 + 0x2C] %asi,	%i1
	fmovrsgz	%g7,	%f29,	%f18
	udiv	%g4,	0x0768,	%i2
	movgu	%xcc,	%i7,	%i5
	movre	%g5,	%o6,	%o0
	stb	%l6,	[%l7 + 0x7E]
	tleu	%icc,	0x3
	edge32ln	%o5,	%i4,	%o3
	ta	%xcc,	0x2
	ld	[%l7 + 0x4C],	%f9
	bleu	loop_1321
	fmovs	%f22,	%f6
	fzeros	%f1
	movrlz	%g2,	0x2BE,	%l4
loop_1321:
	fands	%f21,	%f21,	%f21
	ldsh	[%l7 + 0x52],	%g6
	fcmps	%fcc1,	%f10,	%f2
	fbge	%fcc0,	loop_1322
	tl	%xcc,	0x6
	movgu	%xcc,	%l2,	%l3
	fmovrdne	%i6,	%f20,	%f28
loop_1322:
	edge16n	%o1,	%g3,	%g1
	fandnot1	%f22,	%f0,	%f28
	wr	%g0,	0x89,	%asi
	ldsha	[%l7 + 0x20] %asi,	%o7
	fbn	%fcc2,	loop_1323
	nop
	setx	loop_1324,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	orcc	%l0,	0x187E,	%l5
	umul	%i3,	%o2,	%i0
loop_1323:
	tcc	%icc,	0x0
loop_1324:
	edge8ln	%l1,	%i1,	%o4
	orn	%g4,	0x135B,	%i2
	fzeros	%f3
	fmovsleu	%xcc,	%f16,	%f10
	orn	%g7,	0x1575,	%i5
	alignaddrl	%i7,	%g5,	%o6
	edge32ln	%l6,	%o5,	%o0
	orncc	%i4,	%o3,	%g2
	movrgz	%l4,	0x056,	%l2
	andcc	%g6,	0x1111,	%l3
	fmovrdgez	%i6,	%f22,	%f0
	fbne,a	%fcc0,	loop_1325
	tvs	%xcc,	0x3
	edge8	%o1,	%g3,	%o7
	std	%f30,	[%l7 + 0x60]
loop_1325:
	fcmpne16	%f26,	%f20,	%g1
	move	%xcc,	%l5,	%l0
	movre	%o2,	0x28D,	%i0
	fbe	%fcc0,	loop_1326
	tg	%icc,	0x5
	orn	%l1,	%i3,	%o4
	ldsb	[%l7 + 0x36],	%i1
loop_1326:
	array16	%i2,	%g7,	%g4
	tne	%icc,	0x0
	and	%i7,	0x1EA0,	%g5
	fmovrsgz	%i5,	%f12,	%f27
	fxnor	%f28,	%f16,	%f14
	alignaddr	%l6,	%o5,	%o0
	orncc	%i4,	%o3,	%o6
	lduh	[%l7 + 0x32],	%l4
	andn	%l2,	%g6,	%l3
	fmovdvs	%xcc,	%f10,	%f4
	set	0x78, %g2
	prefetcha	[%l7 + %g2] 0x14,	 0x3
	edge8	%o1,	%g3,	%o7
	tpos	%icc,	0x5
	movne	%icc,	%g1,	%i6
	edge8n	%l5,	%o2,	%i0
	fcmpeq32	%f14,	%f14,	%l1
	wr	%g0,	0x80,	%asi
	ldsba	[%l7 + 0x48] %asi,	%i3
	fmovrslez	%l0,	%f18,	%f26
	tsubcctv	%i1,	0x0690,	%i2
	swap	[%l7 + 0x44],	%o4
	sdivx	%g4,	0x18D6,	%i7
	ldsb	[%l7 + 0x5D],	%g7
	movn	%icc,	%i5,	%l6
	movcc	%icc,	%o5,	%o0
	sub	%i4,	0x119A,	%g5
	sdiv	%o3,	0x1FD7,	%l4
	stx	%l2,	[%l7 + 0x48]
	fmovd	%f6,	%f28
	tsubcctv	%g6,	0x1E4C,	%l3
	edge8ln	%g2,	%o1,	%g3
	srax	%o7,	0x04,	%g1
	set	0x74, %l1
	ldsha	[%l7 + %l1] 0x80,	%o6
	wr	%g0,	0x10,	%asi
	lduba	[%l7 + 0x10] %asi,	%l5
	ble,pn	%icc,	loop_1327
	move	%xcc,	%i6,	%o2
	andcc	%l1,	0x0545,	%i3
	std	%f0,	[%l7 + 0x78]
loop_1327:
	xnorcc	%i0,	0x194B,	%l0
	fbu	%fcc3,	loop_1328
	fzeros	%f25
	smul	%i2,	0x047A,	%i1
	fmovspos	%icc,	%f28,	%f2
loop_1328:
	orcc	%o4,	%g4,	%g7
	bpos,a,pn	%xcc,	loop_1329
	flush	%l7 + 0x60
	sllx	%i7,	0x0D,	%l6
	movrne	%i5,	0x1BC,	%o0
loop_1329:
	fcmpes	%fcc0,	%f28,	%f19
	nop
	setx	loop_1330,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	bvc,pt	%icc,	loop_1331
	orncc	%i4,	%g5,	%o5
	set	0x40, %i7
	lduwa	[%l7 + %i7] 0x18,	%o3
loop_1330:
	ldsh	[%l7 + 0x30],	%l2
loop_1331:
	edge32	%l4,	%g6,	%g2
	bgu	loop_1332
	sll	%o1,	0x12,	%g3
	udivcc	%o7,	0x0394,	%l3
	movn	%xcc,	%o6,	%l5
loop_1332:
	fba,a	%fcc2,	loop_1333
	fbl	%fcc3,	loop_1334
	movrlz	%i6,	%o2,	%g1
	fpadd16s	%f2,	%f6,	%f13
loop_1333:
	andncc	%i3,	%l1,	%l0
loop_1334:
	taddcctv	%i2,	0x1707,	%i0
	brgz,a	%o4,	loop_1335
	fmovsl	%icc,	%f12,	%f24
	edge32n	%g4,	%g7,	%i1
	bneg,pt	%xcc,	loop_1336
loop_1335:
	movvc	%icc,	%l6,	%i5
	add	%i7,	0x03F4,	%o0
	orncc	%i4,	0x1244,	%g5
loop_1336:
	orcc	%o3,	0x1C37,	%o5
	fabss	%f23,	%f26
	movpos	%xcc,	%l2,	%l4
	sethi	0x1F62,	%g6
	andncc	%g2,	%o1,	%g3
	mulscc	%l3,	%o6,	%o7
	te	%xcc,	0x5
	edge32ln	%i6,	%o2,	%g1
	call	loop_1337
	fpsub32s	%f26,	%f11,	%f24
	movcc	%xcc,	%l5,	%l1
	sethi	0x1126,	%i3
loop_1337:
	tpos	%icc,	0x2
	bl,pn	%icc,	loop_1338
	smul	%l0,	0x09E1,	%i2
	umulcc	%i0,	%g4,	%o4
	sethi	0x0D7A,	%g7
loop_1338:
	fornot2	%f18,	%f10,	%f26
	fabsd	%f16,	%f6
	fpsub16	%f6,	%f20,	%f4
	sth	%l6,	[%l7 + 0x44]
	fcmpgt32	%f6,	%f20,	%i1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdg	%icc,	%f30,	%f17
	edge16n	%i5,	%i7,	%i4
	movrgez	%o0,	0x2E8,	%g5
	tsubcc	%o5,	0x1345,	%o3
	fnand	%f8,	%f8,	%f2
	popc	%l2,	%l4
	st	%f18,	[%l7 + 0x28]
	movre	%g6,	%g2,	%o1
	nop
	setx loop_1339, %l0, %l1
	jmpl %l1, %g3
	umul	%l3,	%o6,	%o7
	movge	%xcc,	%i6,	%g1
	sir	0x12FE
loop_1339:
	bcs,a,pt	%icc,	loop_1340
	sra	%o2,	%l1,	%l5
	bl	%xcc,	loop_1341
	ld	[%l7 + 0x74],	%f2
loop_1340:
	fnot2	%f18,	%f22
	tsubcctv	%i3,	%i2,	%l0
loop_1341:
	fornot1	%f28,	%f6,	%f8
	stb	%i0,	[%l7 + 0x29]
	umul	%g4,	0x1FE9,	%g7
	udivcc	%l6,	0x1559,	%i1
	tcc	%xcc,	0x7
	and	%o4,	%i7,	%i5
	movleu	%xcc,	%i4,	%g5
	bleu,a	%xcc,	loop_1342
	nop
	set	0x68, %o4
	ldub	[%l7 + %o4],	%o0
	fmovsl	%icc,	%f24,	%f24
	edge8ln	%o5,	%o3,	%l2
loop_1342:
	smulcc	%l4,	%g6,	%o1
	add	%g3,	%l3,	%g2
	alignaddr	%o7,	%i6,	%o6
	movl	%xcc,	%g1,	%o2
	fcmpne32	%f10,	%f4,	%l5
	xnorcc	%l1,	%i3,	%l0
	array8	%i0,	%i2,	%g7
	fbl	%fcc0,	loop_1343
	bge,a	%icc,	loop_1344
	stbar
	edge16n	%l6,	%g4,	%i1
loop_1343:
	tcc	%icc,	0x5
loop_1344:
	fcmpgt16	%f18,	%f18,	%i7
	nop
	setx	loop_1345,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	ldsb	[%l7 + 0x32],	%i5
	brlez	%i4,	loop_1346
	and	%o4,	0x1E2F,	%o0
loop_1345:
	ldx	[%l7 + 0x70],	%g5
	fbuge,a	%fcc2,	loop_1347
loop_1346:
	fbn	%fcc3,	loop_1348
	movcc	%icc,	%o5,	%l2
	bcs	loop_1349
loop_1347:
	sdivcc	%o3,	0x1B17,	%l4
loop_1348:
	ta	%icc,	0x0
	movrgez	%g6,	%g3,	%o1
loop_1349:
	subc	%l3,	%o7,	%g2
	srl	%i6,	0x18,	%o6
	fmovdpos	%icc,	%f19,	%f14
	fmovspos	%icc,	%f15,	%f25
	nop
	setx loop_1350, %l0, %l1
	jmpl %l1, %o2
	nop
	setx loop_1351, %l0, %l1
	jmpl %l1, %g1
	andcc	%l1,	0x08A6,	%i3
	edge8	%l5,	%i0,	%i2
loop_1350:
	nop
	wr	%g0,	0x22,	%asi
	stba	%g7,	[%l7 + 0x60] %asi
	membar	#Sync
loop_1351:
	sll	%l0,	0x1D,	%g4
	fpmerge	%f6,	%f13,	%f6
	tcc	%icc,	0x3
	for	%f6,	%f18,	%f20
	xnorcc	%l6,	0x11CB,	%i1
	te	%icc,	0x2
	sra	%i7,	%i5,	%i4
	fmovdne	%icc,	%f22,	%f23
	set	0x6C, %l3
	ldsha	[%l7 + %l3] 0x18,	%o0
	edge16l	%g5,	%o5,	%o4
	ldd	[%l7 + 0x78],	%f10
	fmovse	%xcc,	%f30,	%f5
	fones	%f20
	edge8l	%l2,	%l4,	%o3
	movneg	%xcc,	%g3,	%g6
	edge16	%l3,	%o1,	%g2
	movrlez	%o7,	%i6,	%o2
	movrlz	%g1,	%o6,	%i3
	mulx	%l1,	0x17A4,	%l5
	movcs	%xcc,	%i2,	%i0
	srl	%l0,	0x1B,	%g4
	movl	%xcc,	%g7,	%i1
	membar	0x35
	edge32n	%l6,	%i7,	%i4
	movpos	%xcc,	%o0,	%i5
	tvs	%icc,	0x7
	fmovrsne	%o5,	%f20,	%f29
	move	%xcc,	%g5,	%o4
	ta	%xcc,	0x2
	array8	%l2,	%o3,	%g3
	umulcc	%g6,	0x1054,	%l3
	sra	%l4,	0x17,	%g2
	tl	%xcc,	0x0
	fnand	%f20,	%f0,	%f26
	tcs	%xcc,	0x1
	addc	%o1,	0x066C,	%i6
	fbue	%fcc3,	loop_1352
	ldsh	[%l7 + 0x4C],	%o7
	edge16ln	%o2,	%o6,	%g1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1352:
	movcs	%icc,	%i3,	%l5
	fcmpgt16	%f20,	%f10,	%l1
	xnor	%i0,	%l0,	%i2
	nop
	setx	loop_1353,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	array16	%g7,	%g4,	%i1
	fmovdgu	%xcc,	%f15,	%f28
	sllx	%i7,	0x0A,	%i4
loop_1353:
	brgz	%l6,	loop_1354
	movpos	%icc,	%i5,	%o5
	taddcctv	%g5,	0x1D00,	%o4
	fpmerge	%f4,	%f10,	%f30
loop_1354:
	xnorcc	%o0,	%l2,	%o3
	set	0x20, %l4
	stxa	%g6,	[%l7 + %l4] 0x23
	membar	#Sync
	fcmpgt16	%f14,	%f6,	%g3
	sll	%l4,	%g2,	%l3
	sdivx	%o1,	0x16AF,	%o7
	ta	%icc,	0x5
	mulx	%i6,	0x0C52,	%o2
	movge	%xcc,	%o6,	%i3
	mulscc	%l5,	%l1,	%i0
	fpadd16s	%f12,	%f13,	%f24
	sth	%l0,	[%l7 + 0x2C]
	fble,a	%fcc2,	loop_1355
	tg	%icc,	0x3
	movcs	%icc,	%i2,	%g7
	movleu	%xcc,	%g1,	%i1
loop_1355:
	subc	%i7,	0x150D,	%i4
	addcc	%g4,	%l6,	%i5
	fmovs	%f14,	%f12
	fmovdvc	%icc,	%f0,	%f21
	fpsub16s	%f28,	%f12,	%f27
	udiv	%g5,	0x1F08,	%o5
	bneg	loop_1356
	tle	%icc,	0x1
	wr	%g0,	0x10,	%asi
	lduha	[%l7 + 0x5E] %asi,	%o4
loop_1356:
	lduw	[%l7 + 0x4C],	%o0
	sir	0x0D24
	fmovdvs	%xcc,	%f27,	%f4
	smulcc	%o3,	%g6,	%l2
	be,a,pt	%icc,	loop_1357
	fbuge	%fcc1,	loop_1358
	membar	0x18
	edge16l	%g3,	%g2,	%l4
loop_1357:
	movg	%xcc,	%l3,	%o7
loop_1358:
	fsrc1s	%f27,	%f24
	sdivx	%i6,	0x051A,	%o2
	edge8	%o6,	%o1,	%l5
	edge8	%i3,	%i0,	%l0
	addccc	%i2,	0x117F,	%l1
	alignaddrl	%g7,	%i1,	%g1
	ldsb	[%l7 + 0x26],	%i4
	taddcc	%i7,	%l6,	%i5
	fornot1s	%f4,	%f18,	%f6
	wr	%g0,	0x88,	%asi
	lduwa	[%l7 + 0x14] %asi,	%g5
	fbuge,a	%fcc3,	loop_1359
	sdiv	%o5,	0x1E6C,	%g4
	srl	%o4,	0x0B,	%o0
	edge8l	%o3,	%g6,	%l2
loop_1359:
	movgu	%icc,	%g3,	%l4
	fbl,a	%fcc1,	loop_1360
	tge	%xcc,	0x4
	fble	%fcc0,	loop_1361
	fmovdle	%xcc,	%f10,	%f26
loop_1360:
	nop
	set	0x30, %o0
	swapa	[%l7 + %o0] 0x89,	%l3
loop_1361:
	movneg	%xcc,	%g2,	%o7
	fmovrslz	%o2,	%f7,	%f24
	call	loop_1362
	udivx	%i6,	0x1AE8,	%o6
	brgz,a	%o1,	loop_1363
	tpos	%xcc,	0x5
loop_1362:
	nop
	set	0x3C, %o5
	stba	%i3,	[%l7 + %o5] 0x10
loop_1363:
	andcc	%i0,	0x19C4,	%l5
	fbg	%fcc2,	loop_1364
	andncc	%i2,	%l1,	%g7
	mova	%icc,	%l0,	%g1
	movle	%icc,	%i4,	%i1
loop_1364:
	ldstub	[%l7 + 0x5D],	%l6
	movrne	%i7,	0x13B,	%i5
	fsrc1s	%f25,	%f29
	edge16l	%g5,	%o5,	%o4
	fcmpeq32	%f6,	%f10,	%o0
	orcc	%g4,	0x06A6,	%g6
	tle	%xcc,	0x4
	set	0x12, %g7
	stba	%o3,	[%l7 + %g7] 0x10
	ldx	[%l7 + 0x28],	%g3
	edge32l	%l4,	%l2,	%g2
	movleu	%xcc,	%o7,	%o2
	te	%icc,	0x1
	or	%l3,	%i6,	%o6
	fmovspos	%xcc,	%f0,	%f22
	fpadd16	%f20,	%f8,	%f4
	addcc	%o1,	%i0,	%l5
	sir	0x00EA
	ldub	[%l7 + 0x19],	%i2
	movcc	%icc,	%i3,	%g7
	popc	0x1BE1,	%l1
	fsrc1	%f16,	%f26
	fands	%f19,	%f29,	%f15
	addccc	%g1,	0x0086,	%i4
	sub	%i1,	0x1F94,	%l0
	movn	%xcc,	%l6,	%i7
	tle	%icc,	0x7
	alignaddrl	%i5,	%o5,	%o4
	fmovse	%xcc,	%f9,	%f1
	add	%l7,	0x20,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%o0,	%g4
	wr	%g0,	0x80,	%asi
	prefetcha	[%l7 + 0x68] %asi,	 0x3
	subcc	%g6,	%g3,	%l4
	fbge	%fcc2,	loop_1365
	fbug,a	%fcc3,	loop_1366
	sir	0x08FB
	movge	%icc,	%l2,	%o3
loop_1365:
	bcs	%xcc,	loop_1367
loop_1366:
	array32	%o7,	%o2,	%g2
	fmovdn	%icc,	%f23,	%f22
	move	%icc,	%i6,	%l3
loop_1367:
	and	%o6,	%i0,	%o1
	movre	%i2,	%l5,	%g7
	edge32ln	%l1,	%g1,	%i3
	edge16	%i1,	%l0,	%i4
	tleu	%icc,	0x0
	movgu	%icc,	%l6,	%i7
	addccc	%i5,	%o4,	%o0
	tvs	%xcc,	0x4
	edge32l	%o5,	%g4,	%g5
	movleu	%icc,	%g6,	%l4
	std	%f0,	[%l7 + 0x08]
	fbn,a	%fcc0,	loop_1368
	movn	%icc,	%g3,	%l2
	umulcc	%o7,	%o3,	%g2
	tneg	%xcc,	0x0
loop_1368:
	movre	%i6,	%o2,	%l3
	tvc	%icc,	0x6
	fmovde	%xcc,	%f31,	%f3
	movn	%icc,	%o6,	%i0
	ldd	[%l7 + 0x28],	%i2
	sth	%l5,	[%l7 + 0x58]
	movrlez	%g7,	%l1,	%o1
	set	0x58, %l2
	lduha	[%l7 + %l2] 0x10,	%i3
	brz,a	%i1,	loop_1369
	udivx	%l0,	0x0B97,	%g1
	fabsd	%f8,	%f12
	bvc	%icc,	loop_1370
loop_1369:
	sdiv	%i4,	0x1447,	%l6
	nop
	setx	loop_1371,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fmul8sux16	%f30,	%f18,	%f6
loop_1370:
	nop
	wr	%g0,	0x0c,	%asi
	lduwa	[%l7 + 0x14] %asi,	%i5
loop_1371:
	fble	%fcc2,	loop_1372
	srl	%o4,	%o0,	%i7
	call	loop_1373
	bpos,pn	%xcc,	loop_1374
loop_1372:
	and	%o5,	0x178C,	%g4
	sdiv	%g6,	0x18B1,	%l4
loop_1373:
	lduh	[%l7 + 0x30],	%g3
loop_1374:
	movn	%xcc,	%l2,	%o7
	nop
	setx	loop_1375,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	taddcctv	%g5,	0x1C0B,	%g2
	set	0x0C, %o7
	swapa	[%l7 + %o7] 0x80,	%i6
loop_1375:
	and	%o3,	0x00E9,	%o2
	smulcc	%o6,	0x1B7C,	%i0
	te	%icc,	0x3
	xnor	%i2,	%l5,	%l3
	fmovde	%xcc,	%f6,	%f3
	udivcc	%g7,	0x0FA3,	%l1
	fbl	%fcc2,	loop_1376
	bvc,pn	%xcc,	loop_1377
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ta	%icc,	0x6
loop_1376:
	fmovrse	%i3,	%f14,	%f8
loop_1377:
	sll	%o1,	%l0,	%i1
	edge16ln	%g1,	%i4,	%l6
	movn	%icc,	%i5,	%o4
	sdivx	%i7,	0x0E49,	%o0
	movneg	%icc,	%o5,	%g4
	fbue,a	%fcc2,	loop_1378
	edge32	%l4,	%g6,	%g3
	ldsh	[%l7 + 0x5A],	%o7
	fmovsvs	%xcc,	%f9,	%f1
loop_1378:
	fmovdn	%icc,	%f17,	%f20
	fmovrse	%l2,	%f6,	%f6
	sllx	%g2,	0x02,	%g5
	fbul	%fcc3,	loop_1379
	movneg	%icc,	%i6,	%o3
	sdiv	%o2,	0x1E79,	%o6
	subccc	%i2,	%i0,	%l3
loop_1379:
	edge16ln	%l5,	%g7,	%i3
	wr	%g0,	0x23,	%asi
	stwa	%l1,	[%l7 + 0x2C] %asi
	membar	#Sync
	array16	%o1,	%i1,	%g1
	bneg	%icc,	loop_1380
	fbe,a	%fcc1,	loop_1381
	fxnors	%f9,	%f14,	%f16
	tle	%xcc,	0x7
loop_1380:
	nop
	wr	%g0,	0x11,	%asi
	ldsba	[%l7 + 0x68] %asi,	%i4
loop_1381:
	fands	%f8,	%f20,	%f21
	fmovdleu	%xcc,	%f2,	%f4
	tsubcc	%l0,	0x1457,	%i5
	fpackfix	%f22,	%f3
	fcmpes	%fcc0,	%f30,	%f13
	addccc	%o4,	%l6,	%i7
	umul	%o0,	%g4,	%o5
	nop
	set	0x6F, %g5
	ldub	[%l7 + %g5],	%g6
	tcs	%xcc,	0x1
	sra	%g3,	0x08,	%l4
	fnegd	%f26,	%f12
	umul	%o7,	0x0A2C,	%l2
	tsubcctv	%g2,	0x106B,	%i6
	movn	%icc,	%g5,	%o2
	bge,a,pn	%xcc,	loop_1382
	fmul8ulx16	%f22,	%f2,	%f20
	fands	%f30,	%f31,	%f9
	tge	%icc,	0x1
loop_1382:
	fmovrslz	%o6,	%f5,	%f20
	udivcc	%o3,	0x1112,	%i2
	sdiv	%i0,	0x10E5,	%l5
	orcc	%g7,	%l3,	%i3
	tsubcc	%l1,	0x1E85,	%i1
	flush	%l7 + 0x64
	bcc,pn	%xcc,	loop_1383
	edge16n	%o1,	%i4,	%l0
	movg	%icc,	%i5,	%o4
	movvs	%icc,	%l6,	%g1
loop_1383:
	nop
	set	0x68, %g3
	stxa	%i7,	[%l7 + %g3] 0x15
	ldx	[%l7 + 0x78],	%g4
	sth	%o5,	[%l7 + 0x1A]
	movrne	%g6,	0x24E,	%g3
	fands	%f1,	%f11,	%f6
	fmovsvc	%icc,	%f13,	%f19
	movrgez	%o0,	0x008,	%o7
	sdivcc	%l4,	0x0101,	%l2
	addc	%g2,	0x0333,	%i6
	udivx	%g5,	0x05FC,	%o6
	orcc	%o3,	0x1069,	%i2
	subcc	%i0,	%o2,	%l5
	alignaddr	%g7,	%i3,	%l1
	umul	%l3,	%o1,	%i1
	fbug	%fcc2,	loop_1384
	stw	%i4,	[%l7 + 0x3C]
	taddcc	%i5,	0x0A52,	%l0
	orn	%o4,	0x0C9F,	%g1
loop_1384:
	sub	%l6,	%g4,	%i7
	taddcctv	%o5,	0x1431,	%g3
	ta	%icc,	0x3
	fandnot1s	%f12,	%f13,	%f14
	fcmpne16	%f30,	%f26,	%g6
	movrgz	%o0,	%o7,	%l4
	bcc	loop_1385
	edge32n	%g2,	%l2,	%i6
	fbe,a	%fcc0,	loop_1386
	brlz,a	%o6,	loop_1387
loop_1385:
	tvs	%icc,	0x3
	membar	0x6B
loop_1386:
	xnorcc	%o3,	0x127B,	%g5
loop_1387:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tne	%xcc,	0x3
	tl	%xcc,	0x7
	edge16	%i0,	%o2,	%i2
	addccc	%g7,	0x0E71,	%i3
	fbn,a	%fcc1,	loop_1388
	edge16l	%l5,	%l3,	%l1
	ba,pn	%icc,	loop_1389
	sdivcc	%o1,	0x18F8,	%i1
loop_1388:
	movrlz	%i5,	%i4,	%l0
	ldsh	[%l7 + 0x78],	%g1
loop_1389:
	fandnot2s	%f17,	%f0,	%f6
	movrgz	%l6,	0x18F,	%o4
	edge16ln	%i7,	%o5,	%g3
	fbe,a	%fcc0,	loop_1390
	bvc,pt	%icc,	loop_1391
	fcmple32	%f26,	%f18,	%g6
	tl	%xcc,	0x5
loop_1390:
	movne	%icc,	%g4,	%o0
loop_1391:
	bneg,a	loop_1392
	fmovrse	%l4,	%f30,	%f31
	array32	%o7,	%l2,	%g2
	fmovsgu	%xcc,	%f27,	%f31
loop_1392:
	nop
	wr	%g0,	0x18,	%asi
	lduha	[%l7 + 0x1E] %asi,	%o6
	edge8n	%i6,	%g5,	%i0
	fmovdvs	%xcc,	%f0,	%f27
	srl	%o2,	0x11,	%i2
	bleu,a,pt	%icc,	loop_1393
	fmovsl	%xcc,	%f6,	%f12
	fmovsge	%xcc,	%f16,	%f21
	fmuld8ulx16	%f21,	%f0,	%f14
loop_1393:
	ldsh	[%l7 + 0x18],	%o3
	set	0x40, %g6
	ldda	[%l7 + %g6] 0x27,	%i2
	fmul8x16al	%f15,	%f3,	%f18
	movrne	%g7,	0x2F0,	%l5
	fornot1s	%f19,	%f13,	%f29
	andn	%l1,	0x08D5,	%o1
	move	%xcc,	%i1,	%l3
	bg	%icc,	loop_1394
	mova	%icc,	%i4,	%l0
	set	0x64, %i1
	ldsha	[%l7 + %i1] 0x88,	%i5
loop_1394:
	fbge,a	%fcc0,	loop_1395
	movgu	%xcc,	%g1,	%o4
	brgz,a	%l6,	loop_1396
	srax	%i7,	0x1C,	%o5
loop_1395:
	andn	%g3,	%g6,	%o0
	wr	%g0,	0x80,	%asi
	ldswa	[%l7 + 0x64] %asi,	%g4
loop_1396:
	fmovsge	%icc,	%f27,	%f23
	edge8	%o7,	%l4,	%g2
	edge32n	%l2,	%o6,	%g5
	std	%i6,	[%l7 + 0x38]
	addcc	%i0,	%i2,	%o2
	brlz	%o3,	loop_1397
	andncc	%i3,	%g7,	%l5
	srlx	%l1,	0x14,	%o1
	fmovdge	%icc,	%f20,	%f5
loop_1397:
	ldsb	[%l7 + 0x52],	%l3
	bn,a	loop_1398
	sethi	0x0DF9,	%i1
	movvs	%icc,	%l0,	%i5
	set	0x24, %g4
	ldswa	[%l7 + %g4] 0x88,	%g1
loop_1398:
	xor	%i4,	%l6,	%o4
	umul	%i7,	0x055C,	%o5
	udiv	%g3,	0x1DC4,	%g6
	tcc	%icc,	0x7
	subcc	%g4,	%o7,	%l4
	ble	%xcc,	loop_1399
	bcc,a	loop_1400
	array16	%g2,	%o0,	%l2
	movvs	%icc,	%g5,	%o6
loop_1399:
	fnors	%f27,	%f23,	%f13
loop_1400:
	edge16	%i0,	%i6,	%i2
	nop
	set	0x40, %i5
	stw	%o3,	[%l7 + %i5]
	fbue	%fcc0,	loop_1401
	stb	%i3,	[%l7 + 0x58]
	xnor	%g7,	0x1215,	%o2
	fmovda	%xcc,	%f29,	%f14
loop_1401:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xor	%l5,	0x0308,	%l1
	movneg	%xcc,	%o1,	%i1
	fmovrdgz	%l3,	%f20,	%f24
	fmovsvc	%icc,	%f7,	%f4
	bleu,a	loop_1402
	fbg	%fcc0,	loop_1403
	movl	%xcc,	%l0,	%i5
	sir	0x0C0A
loop_1402:
	nop
	wr	%g0,	0x81,	%asi
	ldsba	[%l7 + 0x7E] %asi,	%i4
loop_1403:
	fmovrsgez	%g1,	%f0,	%f18
	movgu	%icc,	%l6,	%o4
	movrlez	%o5,	%i7,	%g6
	andncc	%g3,	%o7,	%g4
	orncc	%g2,	0x14CF,	%o0
	bvs,a,pn	%icc,	loop_1404
	or	%l4,	%l2,	%o6
	alignaddr	%i0,	%i6,	%g5
	xorcc	%i2,	0x183E,	%i3
loop_1404:
	tgu	%xcc,	0x0
	fbg	%fcc3,	loop_1405
	edge16	%o3,	%o2,	%g7
	be,a	%icc,	loop_1406
	fmovdge	%xcc,	%f6,	%f23
loop_1405:
	fmovrdne	%l5,	%f18,	%f12
	fmovrslz	%o1,	%f24,	%f6
loop_1406:
	orcc	%i1,	%l3,	%l1
	fmovrslez	%l0,	%f26,	%f20
	fble,a	%fcc1,	loop_1407
	tvc	%icc,	0x3
	set	0x78, %i3
	ldsba	[%l7 + %i3] 0x88,	%i4
loop_1407:
	edge16	%i5,	%g1,	%l6
	sdiv	%o5,	0x1ADD,	%o4
	orcc	%i7,	0x1679,	%g3
	bne,a	loop_1408
	orncc	%o7,	%g4,	%g2
	movl	%xcc,	%g6,	%l4
	lduw	[%l7 + 0x7C],	%o0
loop_1408:
	tvs	%icc,	0x6
	bg,a,pt	%xcc,	loop_1409
	sethi	0x0330,	%o6
	udiv	%i0,	0x0DD8,	%i6
	fmovrdlez	%g5,	%f14,	%f2
loop_1409:
	fsrc2s	%f23,	%f27
	movrlez	%i2,	0x06F,	%i3
	tsubcc	%l2,	0x1E9F,	%o2
	fcmpeq16	%f8,	%f4,	%o3
	fnors	%f30,	%f28,	%f7
	fnegd	%f24,	%f24
	orn	%l5,	%g7,	%o1
	fandnot1	%f22,	%f22,	%f30
	fbule,a	%fcc0,	loop_1410
	sethi	0x07C4,	%i1
	fble	%fcc3,	loop_1411
	tcs	%xcc,	0x2
loop_1410:
	ta	%xcc,	0x1
	sdivx	%l1,	0x0EF3,	%l3
loop_1411:
	fandnot1s	%f10,	%f6,	%f23
	fmovsg	%icc,	%f10,	%f10
	fandnot1	%f14,	%f20,	%f18
	smulcc	%i4,	%i5,	%l0
	movcs	%xcc,	%l6,	%o5
	tvs	%xcc,	0x7
	flush	%l7 + 0x40
	subcc	%g1,	%o4,	%i7
	fnot2s	%f24,	%f27
	fmovrdne	%g3,	%f22,	%f6
	ld	[%l7 + 0x48],	%f15
	alignaddrl	%o7,	%g4,	%g6
	sdiv	%g2,	0x0D91,	%l4
	movgu	%xcc,	%o6,	%i0
	fbug	%fcc1,	loop_1412
	fmovrdlez	%o0,	%f26,	%f28
	set	0x40, %g1
	ldda	[%l7 + %g1] 0x18,	%f0
loop_1412:
	or	%i6,	%g5,	%i2
	fmuld8sux16	%f24,	%f11,	%f28
	tcs	%icc,	0x2
	and	%i3,	0x1E1F,	%l2
	srlx	%o2,	%l5,	%o3
	fzero	%f26
	movrlez	%o1,	0x355,	%g7
	movneg	%icc,	%i1,	%l1
	flush	%l7 + 0x28
	movg	%icc,	%i4,	%l3
	movleu	%icc,	%l0,	%l6
	move	%xcc,	%o5,	%i5
	fcmpd	%fcc1,	%f24,	%f8
	movneg	%icc,	%g1,	%o4
	set	0x10, %l5
	ldswa	[%l7 + %l5] 0x18,	%g3
	orcc	%o7,	%i7,	%g4
	edge8	%g2,	%g6,	%l4
	popc	%i0,	%o0
	movre	%o6,	0x2DB,	%i6
	ta	%xcc,	0x5
	brz	%i2,	loop_1413
	fsrc2s	%f19,	%f22
	edge8	%g5,	%i3,	%o2
	orcc	%l5,	%o3,	%o1
loop_1413:
	brnz	%g7,	loop_1414
	fabsd	%f4,	%f10
	ble,a,pn	%icc,	loop_1415
	ba	%xcc,	loop_1416
loop_1414:
	fbul	%fcc0,	loop_1417
	fbn,a	%fcc0,	loop_1418
loop_1415:
	sth	%l2,	[%l7 + 0x5E]
loop_1416:
	be,a	%xcc,	loop_1419
loop_1417:
	udivcc	%i1,	0x08FE,	%l1
loop_1418:
	nop
	set	0x30, %i4
	ldswa	[%l7 + %i4] 0x80,	%l3
loop_1419:
	edge8ln	%l0,	%l6,	%i4
	edge16ln	%o5,	%g1,	%i5
	bgu,pt	%icc,	loop_1420
	tsubcc	%o4,	0x0B09,	%o7
	tleu	%xcc,	0x7
	smulcc	%g3,	0x03FA,	%i7
loop_1420:
	brz,a	%g4,	loop_1421
	fcmpne32	%f0,	%f24,	%g2
	fmul8sux16	%f12,	%f20,	%f30
	udivx	%g6,	0x0F90,	%l4
loop_1421:
	edge8	%i0,	%o6,	%o0
	movcc	%icc,	%i2,	%i6
	orn	%i3,	0x04E9,	%o2
	bvs,pn	%xcc,	loop_1422
	umul	%g5,	%l5,	%o1
	srax	%o3,	%l2,	%g7
	fbne,a	%fcc1,	loop_1423
loop_1422:
	movrne	%i1,	0x311,	%l3
	alignaddr	%l0,	%l6,	%i4
	fnot2s	%f21,	%f25
loop_1423:
	movge	%xcc,	%o5,	%l1
	add	%g1,	%o4,	%o7
	stb	%g3,	[%l7 + 0x23]
	tcs	%icc,	0x0
	fmovsneg	%xcc,	%f1,	%f30
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bgu	loop_1424
	bne	loop_1425
	fbul	%fcc1,	loop_1426
	fmul8x16	%f8,	%f18,	%f0
loop_1424:
	ta	%xcc,	0x7
loop_1425:
	taddcctv	%i5,	0x0ED2,	%i7
loop_1426:
	udiv	%g4,	0x1329,	%g6
	xnor	%l4,	%i0,	%o6
	fblg,a	%fcc0,	loop_1427
	fabsd	%f0,	%f16
	movvc	%icc,	%g2,	%o0
	edge16n	%i2,	%i6,	%o2
loop_1427:
	brz	%g5,	loop_1428
	te	%icc,	0x7
	sra	%l5,	0x1D,	%i3
	edge8l	%o3,	%o1,	%g7
loop_1428:
	nop
	set	0x44, %i0
	sta	%f30,	[%l7 + %i0] 0x15
	tge	%icc,	0x0
	andcc	%i1,	0x14BC,	%l2
	add	%l0,	%l6,	%l3
	tcs	%icc,	0x7
	fbg,a	%fcc2,	loop_1429
	umul	%i4,	%l1,	%o5
	ldstub	[%l7 + 0x77],	%o4
	ble,a	loop_1430
loop_1429:
	or	%o7,	0x0AAF,	%g3
	movre	%i5,	0x2E2,	%g1
	wr	%g0,	0x10,	%asi
	swapa	[%l7 + 0x14] %asi,	%g4
loop_1430:
	addcc	%g6,	0x1AB0,	%i7
	bvs,a	%xcc,	loop_1431
	tpos	%icc,	0x2
	fmovdneg	%icc,	%f19,	%f9
	std	%i0,	[%l7 + 0x28]
loop_1431:
	nop
	wr	%g0,	0x89,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	srl	%l4,	%g2,	%o6
	brlez,a	%o0,	loop_1432
	movcc	%icc,	%i2,	%i6
	wr	%g0,	0x04,	%asi
	stxa	%o2,	[%l7 + 0x68] %asi
loop_1432:
	tg	%icc,	0x6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movre	%g5,	%i3,	%o3
	movcc	%xcc,	%o1,	%l5
	tle	%xcc,	0x7
	sdivcc	%i1,	0x0A56,	%l2
	ta	%icc,	0x0
	movle	%xcc,	%l0,	%g7
	edge32ln	%l3,	%i4,	%l6
	movge	%icc,	%l1,	%o4
	movre	%o5,	0x174,	%g3
	fmovdcs	%icc,	%f16,	%f16
	xor	%o7,	%g1,	%g4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tgu	%icc,	0x5
	prefetch	[%l7 + 0x48],	 0x0
	edge16n	%i5,	%i7,	%i0
	fzero	%f30
	movgu	%icc,	%g6,	%g2
	fornot2s	%f15,	%f31,	%f22
	fmovd	%f0,	%f12
	movre	%o6,	%l4,	%i2
	edge16	%i6,	%o2,	%g5
	fmul8x16	%f30,	%f10,	%f20
	fpack16	%f24,	%f1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddrl	%i3,	%o0,	%o1
	set	0x1C, %i6
	stwa	%l5,	[%l7 + %i6] 0x19
	array8	%o3,	%l2,	%i1
	umul	%g7,	0x0686,	%l3
	smul	%l0,	0x1FFB,	%i4
	fnand	%f14,	%f14,	%f6
	pdist	%f4,	%f14,	%f24
	array16	%l1,	%o4,	%l6
	fpackfix	%f28,	%f6
	edge32	%g3,	%o5,	%g1
	set	0x7C, %o1
	sta	%f7,	[%l7 + %o1] 0x04
	te	%xcc,	0x2
	fbg	%fcc0,	loop_1433
	or	%g4,	0x080B,	%o7
	movl	%xcc,	%i5,	%i7
	srl	%i0,	%g6,	%g2
loop_1433:
	sethi	0x1F85,	%l4
	te	%xcc,	0x6
	fmovrse	%i2,	%f4,	%f9
	fnor	%f8,	%f0,	%f2
	wr	%g0,	0x10,	%asi
	sta	%f10,	[%l7 + 0x64] %asi
	bg,pt	%icc,	loop_1434
	ldstub	[%l7 + 0x40],	%i6
	tcs	%icc,	0x6
	set	0x78, %l6
	ldxa	[%l7 + %l6] 0x19,	%o6
loop_1434:
	ldsh	[%l7 + 0x58],	%o2
	fbue,a	%fcc3,	loop_1435
	ldstub	[%l7 + 0x1F],	%g5
	umulcc	%i3,	%o0,	%o1
	xnor	%o3,	%l5,	%i1
loop_1435:
	brlz,a	%g7,	loop_1436
	movvs	%xcc,	%l3,	%l2
	fsrc1s	%f7,	%f19
	subccc	%l0,	%i4,	%l1
loop_1436:
	edge8ln	%l6,	%o4,	%g3
	call	loop_1437
	fandnot2	%f4,	%f22,	%f30
	edge32n	%o5,	%g1,	%g4
	sllx	%i5,	0x0D,	%o7
loop_1437:
	fmovsneg	%xcc,	%f24,	%f12
	movleu	%icc,	%i0,	%g6
	tvc	%icc,	0x1
	fandnot2	%f14,	%f18,	%f30
	xnorcc	%g2,	%l4,	%i7
	movpos	%xcc,	%i6,	%i2
	fmovsl	%xcc,	%f6,	%f18
	tge	%xcc,	0x6
	fcmpd	%fcc3,	%f0,	%f30
	fmovrdlz	%o6,	%f12,	%f30
	movrne	%g5,	0x031,	%i3
	taddcc	%o2,	%o0,	%o1
	movrlez	%l5,	0x020,	%o3
	te	%xcc,	0x4
	add	%g7,	%i1,	%l3
	fmovdle	%icc,	%f10,	%f31
	std	%f10,	[%l7 + 0x38]
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	add	%l0,	%i4,	%l2
	fmovse	%icc,	%f25,	%f0
	fcmpd	%fcc0,	%f8,	%f30
	addc	%l1,	0x0238,	%l6
	fbe	%fcc0,	loop_1438
	smulcc	%o4,	0x15E1,	%o5
	movl	%xcc,	%g3,	%g4
	nop
	set	0x50, %o3
	stx	%i5,	[%l7 + %o3]
loop_1438:
	fmovsneg	%xcc,	%f8,	%f23
	taddcctv	%g1,	0x19F5,	%i0
	for	%f12,	%f18,	%f28
	ld	[%l7 + 0x50],	%f27
	xnor	%o7,	%g6,	%g2
	movneg	%xcc,	%l4,	%i6
	edge16ln	%i7,	%i2,	%g5
	array32	%o6,	%o2,	%i3
	udiv	%o1,	0x0842,	%o0
	wr	%g0,	0x10,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	movrgz	%o3,	%g7,	%l5
	fbe,a	%fcc3,	loop_1439
	array32	%l3,	%i1,	%i4
	lduh	[%l7 + 0x2E],	%l2
	set	0x6F, %i2
	stba	%l1,	[%l7 + %i2] 0x19
loop_1439:
	edge32ln	%l0,	%o4,	%l6
	udiv	%g3,	0x1B18,	%g4
	array8	%i5,	%g1,	%o5
	smul	%i0,	%g6,	%g2
	movneg	%xcc,	%o7,	%i6
	taddcctv	%i7,	0x0B40,	%l4
	mulscc	%i2,	0x0012,	%g5
	std	%o6,	[%l7 + 0x78]
	brnz,a	%o2,	loop_1440
	orncc	%o1,	0x1B37,	%i3
	addc	%o3,	0x15BB,	%o0
	udiv	%g7,	0x1495,	%l5
loop_1440:
	fbe,a	%fcc1,	loop_1441
	fpsub32s	%f10,	%f31,	%f4
	add	%i1,	0x0183,	%l3
	bg,pn	%xcc,	loop_1442
loop_1441:
	subc	%i4,	0x0768,	%l2
	fmuld8ulx16	%f18,	%f19,	%f4
	mulx	%l1,	0x168C,	%l0
loop_1442:
	edge16	%l6,	%o4,	%g3
	addc	%i5,	%g4,	%o5
	andcc	%g1,	0x01E7,	%g6
	fbo,a	%fcc2,	loop_1443
	brgz,a	%g2,	loop_1444
	movre	%i0,	%o7,	%i7
	ld	[%l7 + 0x70],	%f29
loop_1443:
	sll	%i6,	%l4,	%i2
loop_1444:
	fbule	%fcc3,	loop_1445
	tcc	%xcc,	0x6
	sub	%g5,	0x0322,	%o6
	movn	%xcc,	%o1,	%i3
loop_1445:
	tle	%xcc,	0x6
	fmovdne	%xcc,	%f19,	%f5
	andncc	%o2,	%o3,	%g7
	alignaddr	%l5,	%i1,	%o0
	move	%icc,	%i4,	%l2
	fmovrse	%l1,	%f23,	%f13
	wr	%g0,	0x80,	%asi
	ldsba	[%l7 + 0x3F] %asi,	%l0
	fcmple16	%f24,	%f20,	%l6
	bneg,pn	%icc,	loop_1446
	udivcc	%o4,	0x08C2,	%l3
	set	0x74, %l0
	ldswa	[%l7 + %l0] 0x18,	%g3
loop_1446:
	nop
	wr	%g0,	0x89,	%asi
	ldswa	[%l7 + 0x70] %asi,	%i5
	subc	%g4,	0x05D8,	%o5
	fmovspos	%xcc,	%f31,	%f16
	brlez,a	%g1,	loop_1447
	fbn,a	%fcc0,	loop_1448
	srl	%g2,	0x05,	%g6
	fmovdneg	%icc,	%f5,	%f10
loop_1447:
	sra	%i0,	0x1D,	%o7
loop_1448:
	ta	%icc,	0x4
	wr	%g0,	0x80,	%asi
	ldswa	[%l7 + 0x30] %asi,	%i6
	wr	%g0,	0x2a,	%asi
	stba	%i7,	[%l7 + 0x35] %asi
	membar	#Sync
	fmovrsgez	%l4,	%f12,	%f7
	fcmpes	%fcc1,	%f6,	%f5
	sra	%g5,	0x1B,	%i2
	add	%o6,	0x0505,	%i3
	edge8l	%o1,	%o3,	%g7
	ba,a,pt	%xcc,	loop_1449
	tge	%icc,	0x4
	sub	%o2,	0x1239,	%l5
	fornot2s	%f9,	%f3,	%f19
loop_1449:
	xnor	%i1,	%i4,	%l2
	te	%icc,	0x2
	bvs,a,pt	%xcc,	loop_1450
	edge8	%o0,	%l1,	%l6
	set	0x40, %o6
	stda	%f16,	[%l7 + %o6] 0xf8
	membar	#Sync
loop_1450:
	movle	%icc,	%o4,	%l0
	wr	%g0,	0x80,	%asi
	swapa	[%l7 + 0x40] %asi,	%l3
	set	0x70, %g2
	lda	[%l7 + %g2] 0x14,	%f4
	brz	%i5,	loop_1451
	tcc	%xcc,	0x5
	tg	%xcc,	0x2
	srl	%g4,	0x11,	%o5
loop_1451:
	stbar
	subcc	%g3,	%g2,	%g1
	brgez	%i0,	loop_1452
	brgz,a	%g6,	loop_1453
	movl	%icc,	%o7,	%i6
	edge16ln	%i7,	%l4,	%g5
loop_1452:
	tvc	%icc,	0x4
loop_1453:
	movn	%icc,	%o6,	%i3
	xnorcc	%i2,	0x1A2E,	%o3
	movleu	%xcc,	%g7,	%o2
	siam	0x0
	fbul,a	%fcc2,	loop_1454
	fmovrdlz	%o1,	%f26,	%f16
	edge16l	%i1,	%i4,	%l5
	andcc	%l2,	%l1,	%l6
loop_1454:
	xor	%o4,	0x09EE,	%o0
	movle	%icc,	%l0,	%l3
	array32	%i5,	%g4,	%g3
	fand	%f2,	%f12,	%f12
	mulscc	%o5,	0x0A4A,	%g2
	fornot1	%f18,	%f28,	%f0
	fba	%fcc2,	loop_1455
	array32	%i0,	%g1,	%o7
	orncc	%g6,	%i7,	%i6
	fornot2	%f6,	%f6,	%f8
loop_1455:
	subccc	%g5,	0x1A71,	%o6
	edge16l	%i3,	%l4,	%o3
	edge32	%g7,	%o2,	%i2
	smulcc	%i1,	0x1153,	%i4
	orn	%l5,	0x02CF,	%l2
	wr	%g0,	0x80,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	tg	%icc,	0x4
	sll	%o1,	0x0C,	%l1
	tle	%xcc,	0x5
	st	%f18,	[%l7 + 0x38]
	brnz,a	%l6,	loop_1456
	brlz	%o4,	loop_1457
	te	%xcc,	0x7
	wr	%g0,	0x80,	%asi
	lduwa	[%l7 + 0x74] %asi,	%l0
loop_1456:
	bvs,a,pt	%xcc,	loop_1458
loop_1457:
	subcc	%l3,	0x060C,	%i5
	tn	%xcc,	0x7
	fmovsvs	%xcc,	%f9,	%f28
loop_1458:
	edge8	%o0,	%g3,	%o5
	edge8n	%g4,	%i0,	%g1
	membar	0x0E
	edge8ln	%o7,	%g2,	%g6
	fmul8sux16	%f18,	%f4,	%f28
	taddcctv	%i6,	0x0B19,	%i7
	tsubcc	%o6,	%i3,	%l4
	fbge	%fcc2,	loop_1459
	fnands	%f5,	%f27,	%f24
	tneg	%xcc,	0x3
	fbn	%fcc1,	loop_1460
loop_1459:
	fmovdn	%xcc,	%f16,	%f7
	mulx	%o3,	%g7,	%g5
	xnorcc	%i2,	%o2,	%i1
loop_1460:
	ldsb	[%l7 + 0x19],	%l5
	set	0x78, %l1
	lduwa	[%l7 + %l1] 0x10,	%l2
	andcc	%i4,	0x00BB,	%o1
	ba,a,pn	%xcc,	loop_1461
	move	%xcc,	%l1,	%o4
	wr	%g0,	0x80,	%asi
	ldstuba	[%l7 + 0x4C] %asi,	%l0
loop_1461:
	fandnot2	%f16,	%f26,	%f30
	movvc	%xcc,	%l3,	%i5
	ldsb	[%l7 + 0x5A],	%l6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8l	%o0,	%g3,	%g4
	smul	%o5,	0x0814,	%i0
	sra	%g1,	%o7,	%g6
	set	0x0F, %o2
	ldsba	[%l7 + %o2] 0x11,	%g2
	fpack16	%f6,	%f21
	umul	%i6,	0x1FD4,	%o6
	movl	%xcc,	%i3,	%i7
	sethi	0x1B37,	%o3
	tle	%icc,	0x7
	fbe,a	%fcc2,	loop_1462
	movrgz	%g7,	0x3DB,	%g5
	set	0x40, %o4
	stda	%f0,	[%l7 + %o4] 0x88
loop_1462:
	fmovdvs	%xcc,	%f12,	%f28
	orn	%l4,	0x01C6,	%i2
	sub	%o2,	0x18C1,	%i1
	tn	%icc,	0x0
	movn	%xcc,	%l2,	%l5
	addccc	%i4,	0x15EF,	%o1
	alignaddr	%o4,	%l1,	%l0
	fmovdpos	%icc,	%f24,	%f8
	movneg	%icc,	%l3,	%i5
	popc	%l6,	%g3
	wr	%g0,	0x80,	%asi
	ldstuba	[%l7 + 0x41] %asi,	%g4
	fxor	%f4,	%f6,	%f16
	fmovdn	%xcc,	%f22,	%f6
	movvs	%icc,	%o5,	%i0
	edge32l	%o0,	%g1,	%g6
	te	%icc,	0x5
	edge32	%o7,	%i6,	%g2
	fnands	%f29,	%f25,	%f27
	taddcc	%o6,	0x1812,	%i3
	ldd	[%l7 + 0x28],	%f4
	nop
	set	0x6E, %l3
	stb	%o3,	[%l7 + %l3]
	edge16l	%i7,	%g7,	%g5
	add	%l7,	0x58,	%l6
	wr	%g0,	0x04,	%asi
	casa	[%l6] %asi,	%l4,	%i2
	fmovsneg	%icc,	%f1,	%f14
	addc	%i1,	0x0B54,	%l2
	fnors	%f8,	%f2,	%f21
	fnot2s	%f27,	%f18
	fnors	%f16,	%f12,	%f7
	andcc	%l5,	%i4,	%o1
	edge16	%o4,	%l1,	%o2
	fpadd16	%f10,	%f4,	%f0
	fmovrdlz	%l0,	%f10,	%f4
	tg	%icc,	0x3
	fmovrse	%l3,	%f5,	%f12
	fmovdge	%icc,	%f3,	%f2
	swap	[%l7 + 0x5C],	%i5
	movrlz	%g3,	0x386,	%l6
	ldx	[%l7 + 0x28],	%g4
	fsrc2s	%f20,	%f30
	movre	%o5,	%i0,	%o0
	addccc	%g1,	%g6,	%o7
	set	0x210, %i7
	ldxa	[%g0 + %i7] 0x52,	%g2
	set	0x38, %l4
	stwa	%o6,	[%l7 + %l4] 0x15
	tvc	%xcc,	0x0
	tvc	%icc,	0x0
	udivcc	%i6,	0x06AC,	%o3
	set	0x48, %o5
	stda	%i6,	[%l7 + %o5] 0x18
	ta	%xcc,	0x3
	fmovrdne	%g7,	%f30,	%f6
	ldd	[%l7 + 0x48],	%f4
	sir	0x15A9
	fmovdgu	%xcc,	%f7,	%f2
	orn	%g5,	%i3,	%l4
	mulx	%i2,	%l2,	%l5
	fmovdneg	%icc,	%f3,	%f18
	addccc	%i1,	0x195C,	%i4
	edge32ln	%o4,	%l1,	%o2
	addccc	%o1,	%l0,	%i5
	tn	%icc,	0x4
	edge8l	%l3,	%l6,	%g3
	wr	%g0,	0x2f,	%asi
	stba	%o5,	[%l7 + 0x4C] %asi
	membar	#Sync
	edge16ln	%g4,	%i0,	%o0
	bcc	%icc,	loop_1463
	xnorcc	%g1,	0x0E64,	%g6
	tneg	%xcc,	0x1
	orcc	%o7,	0x03F3,	%o6
loop_1463:
	tge	%xcc,	0x1
	movrgez	%g2,	0x164,	%i6
	nop
	set	0x2D, %o0
	ldsb	[%l7 + %o0],	%i7
	edge32l	%g7,	%o3,	%i3
	udiv	%g5,	0x1517,	%i2
	bcc	%icc,	loop_1464
	fmovsvs	%xcc,	%f24,	%f16
	tn	%icc,	0x5
	fnands	%f18,	%f11,	%f22
loop_1464:
	add	%l4,	0x0790,	%l2
	wr	%g0,	0x0c,	%asi
	sta	%f26,	[%l7 + 0x08] %asi
	mulscc	%i1,	0x055F,	%i4
	movge	%icc,	%o4,	%l5
	movg	%icc,	%l1,	%o1
	movneg	%icc,	%l0,	%i5
	bneg	%xcc,	loop_1465
	edge16	%o2,	%l3,	%l6
	ta	%xcc,	0x3
	lduh	[%l7 + 0x64],	%g3
loop_1465:
	edge32	%o5,	%i0,	%g4
	nop
	setx loop_1466, %l0, %l1
	jmpl %l1, %g1
	tsubcctv	%o0,	0x1F03,	%o7
	fcmped	%fcc2,	%f2,	%f20
	sdiv	%g6,	0x1643,	%o6
loop_1466:
	ldd	[%l7 + 0x38],	%f4
	edge16n	%g2,	%i7,	%i6
	wr	%g0,	0x04,	%asi
	lduwa	[%l7 + 0x1C] %asi,	%g7
	movpos	%icc,	%i3,	%g5
	stbar
	fbne,a	%fcc1,	loop_1467
	edge8l	%i2,	%o3,	%l2
	st	%f22,	[%l7 + 0x1C]
	smul	%i1,	0x022A,	%l4
loop_1467:
	umul	%i4,	%o4,	%l1
	umul	%o1,	%l0,	%l5
	sdivx	%o2,	0x02D3,	%i5
	add	%l3,	0x1AE3,	%l6
	movrgez	%g3,	%o5,	%i0
	fmovsne	%xcc,	%f23,	%f8
	edge32	%g4,	%g1,	%o7
	array8	%g6,	%o6,	%g2
	and	%i7,	%o0,	%g7
	fmovrdgz	%i6,	%f16,	%f14
	fmovsvc	%icc,	%f24,	%f30
	fmovdpos	%icc,	%f17,	%f17
	tsubcc	%g5,	%i2,	%o3
	edge32	%l2,	%i3,	%l4
	tl	%xcc,	0x5
	edge16ln	%i1,	%o4,	%i4
	fcmpne32	%f24,	%f0,	%o1
	set	0x68, %g7
	stda	%l0,	[%l7 + %g7] 0x22
	membar	#Sync
	bg	%xcc,	loop_1468
	movrgez	%l5,	%l1,	%o2
	membar	0x05
	for	%f16,	%f16,	%f22
loop_1468:
	sub	%i5,	%l6,	%g3
	sub	%l3,	%o5,	%i0
	udiv	%g4,	0x18B3,	%g1
	faligndata	%f10,	%f6,	%f16
	fmul8x16	%f2,	%f10,	%f30
	fbne,a	%fcc3,	loop_1469
	movrgez	%o7,	%g6,	%o6
	movvs	%icc,	%i7,	%o0
	tge	%xcc,	0x1
loop_1469:
	fmovscs	%icc,	%f23,	%f12
	sll	%g7,	0x1D,	%i6
	addc	%g2,	0x0E6F,	%g5
	set	0x5C, %o7
	lduwa	[%l7 + %o7] 0x18,	%i2
	set	0x47, %l2
	lduba	[%l7 + %l2] 0x04,	%l2
	sub	%i3,	%o3,	%i1
	movn	%icc,	%l4,	%o4
	edge8n	%o1,	%l0,	%i4
	for	%f22,	%f26,	%f12
	fmovse	%xcc,	%f31,	%f13
	movle	%xcc,	%l1,	%l5
	brz,a	%i5,	loop_1470
	fxnor	%f24,	%f8,	%f14
	xor	%o2,	%l6,	%g3
	fbuge,a	%fcc3,	loop_1471
loop_1470:
	fmovdpos	%icc,	%f8,	%f14
	edge32	%l3,	%o5,	%i0
	edge32	%g4,	%g1,	%o7
loop_1471:
	fpmerge	%f21,	%f6,	%f20
	sdivcc	%g6,	0x03CF,	%o6
	movn	%icc,	%i7,	%o0
	udivcc	%g7,	0x031A,	%i6
	fbul	%fcc3,	loop_1472
	tleu	%icc,	0x2
	set	0x48, %g5
	swapa	[%l7 + %g5] 0x81,	%g2
loop_1472:
	stb	%i2,	[%l7 + 0x59]
	subc	%l2,	%g5,	%i3
	smulcc	%i1,	%o3,	%l4
	bcc,a,pn	%xcc,	loop_1473
	bleu,pn	%xcc,	loop_1474
	taddcc	%o1,	%o4,	%l0
	set	0x28, %g6
	stda	%i4,	[%l7 + %g6] 0x81
loop_1473:
	movrlez	%l1,	0x397,	%i5
loop_1474:
	orcc	%o2,	%l5,	%l6
	fcmpne16	%f12,	%f8,	%g3
	fmovdle	%icc,	%f17,	%f22
	brgz	%o5,	loop_1475
	fcmpeq32	%f30,	%f14,	%l3
	fbge,a	%fcc0,	loop_1476
	fmovsg	%icc,	%f7,	%f22
loop_1475:
	popc	%g4,	%g1
	fmovsleu	%icc,	%f29,	%f15
loop_1476:
	fbne	%fcc1,	loop_1477
	fmovsvs	%xcc,	%f9,	%f17
	array8	%o7,	%g6,	%i0
	srlx	%i7,	0x0B,	%o0
loop_1477:
	xnorcc	%o6,	0x0B51,	%g7
	sth	%g2,	[%l7 + 0x2A]
	sll	%i6,	%i2,	%l2
	movre	%i3,	0x3EC,	%g5
	brnz,a	%i1,	loop_1478
	fmovsge	%icc,	%f19,	%f31
	srax	%l4,	%o1,	%o3
	movl	%icc,	%o4,	%l0
loop_1478:
	fmovsvc	%icc,	%f31,	%f4
	andcc	%l1,	0x0AE9,	%i4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movneg	%icc,	%i5,	%o2
	edge8n	%l5,	%g3,	%o5
	fsrc1s	%f22,	%f22
	movne	%icc,	%l3,	%l6
	fbue,a	%fcc3,	loop_1479
	movre	%g4,	0x063,	%o7
	andncc	%g1,	%i0,	%g6
	call	loop_1480
loop_1479:
	bgu,pt	%xcc,	loop_1481
	fmovscs	%xcc,	%f3,	%f4
	movcs	%xcc,	%o0,	%i7
loop_1480:
	popc	0x0332,	%o6
loop_1481:
	swap	[%l7 + 0x58],	%g2
	bg,pn	%xcc,	loop_1482
	fbg	%fcc1,	loop_1483
	mulx	%g7,	0x15E5,	%i2
	nop
	setx	loop_1484,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_1482:
	tsubcctv	%i6,	0x12A7,	%i3
loop_1483:
	tge	%xcc,	0x4
	taddcc	%l2,	%i1,	%g5
loop_1484:
	fcmps	%fcc1,	%f20,	%f0
	bshuffle	%f22,	%f2,	%f28
	nop
	setx	loop_1485,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	bneg	%xcc,	loop_1486
	tcc	%xcc,	0x7
	or	%l4,	0x1870,	%o1
loop_1485:
	sir	0x19C1
loop_1486:
	movneg	%xcc,	%o3,	%o4
	tcc	%xcc,	0x4
	ta	%xcc,	0x6
	tcc	%icc,	0x4
	st	%f18,	[%l7 + 0x38]
	ldub	[%l7 + 0x11],	%l1
	tvc	%xcc,	0x4
	movneg	%icc,	%l0,	%i5
	edge8	%o2,	%i4,	%g3
	movneg	%xcc,	%o5,	%l5
	edge32ln	%l3,	%g4,	%o7
	taddcctv	%l6,	%g1,	%g6
	udiv	%i0,	0x19D9,	%i7
	fbug,a	%fcc2,	loop_1487
	sllx	%o0,	0x0C,	%o6
	movcs	%icc,	%g2,	%g7
	bneg,pn	%xcc,	loop_1488
loop_1487:
	ta	%xcc,	0x4
	bvs,pn	%icc,	loop_1489
	ldub	[%l7 + 0x4D],	%i2
loop_1488:
	popc	%i6,	%l2
	mulscc	%i3,	%i1,	%l4
loop_1489:
	addc	%g5,	0x101F,	%o3
	subccc	%o4,	%o1,	%l0
	tle	%icc,	0x7
	tge	%xcc,	0x6
	brlz	%i5,	loop_1490
	umulcc	%l1,	0x0314,	%o2
	orncc	%i4,	0x1C6A,	%g3
	fbue	%fcc2,	loop_1491
loop_1490:
	tneg	%icc,	0x6
	tvs	%icc,	0x7
	nop
	setx	loop_1492,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_1491:
	umul	%o5,	%l5,	%l3
	sir	0x0C50
	xor	%o7,	%g4,	%g1
loop_1492:
	udivcc	%g6,	0x1DC1,	%i0
	subc	%l6,	0x1569,	%o0
	be,a,pn	%xcc,	loop_1493
	tcc	%xcc,	0x6
	orncc	%i7,	%o6,	%g2
	or	%g7,	0x0367,	%i2
loop_1493:
	lduw	[%l7 + 0x5C],	%i6
	addcc	%i3,	0x0212,	%l2
	fbn	%fcc2,	loop_1494
	sir	0x16EC
	addc	%l4,	%g5,	%o3
	fmovrde	%o4,	%f2,	%f28
loop_1494:
	fnors	%f29,	%f30,	%f25
	brlez	%o1,	loop_1495
	brlz,a	%i1,	loop_1496
	fmovrdne	%i5,	%f14,	%f26
	edge8	%l1,	%o2,	%i4
loop_1495:
	umulcc	%l0,	%o5,	%g3
loop_1496:
	edge16	%l5,	%l3,	%g4
	movcs	%icc,	%g1,	%o7
	taddcc	%i0,	0x1071,	%l6
	ta	%xcc,	0x3
	bshuffle	%f4,	%f22,	%f30
	fnot1s	%f31,	%f3
	move	%xcc,	%o0,	%g6
	and	%i7,	%g2,	%g7
	movrne	%o6,	0x323,	%i2
	membar	0x2D
	set	0x40, %i1
	ldda	[%l7 + %i1] 0x81,	%f16
	set	0x51, %g3
	stba	%i3,	[%l7 + %g3] 0x22
	membar	#Sync
	udivx	%l2,	0x00F6,	%l4
	movl	%icc,	%g5,	%i6
	fandnot1s	%f27,	%f10,	%f30
	be,pt	%icc,	loop_1497
	addccc	%o3,	%o1,	%i1
	fmovsn	%icc,	%f23,	%f13
	array8	%o4,	%i5,	%l1
loop_1497:
	orcc	%i4,	%l0,	%o2
	sra	%o5,	%g3,	%l5
	array16	%g4,	%l3,	%o7
	edge8l	%g1,	%i0,	%l6
	and	%o0,	%i7,	%g2
	fmovdcc	%icc,	%f21,	%f3
	tcs	%xcc,	0x0
	bn	loop_1498
	movcs	%icc,	%g7,	%g6
	set	0x3A, %g4
	ldsha	[%l7 + %g4] 0x18,	%i2
loop_1498:
	fmovdne	%xcc,	%f5,	%f12
	fbg	%fcc0,	loop_1499
	smul	%i3,	%l2,	%l4
	addc	%o6,	0x133E,	%i6
	set	0x108, %i5
	stxa	%o3,	[%g0 + %i5] 0x21
loop_1499:
	movrlez	%g5,	%i1,	%o1
	edge8n	%o4,	%i5,	%i4
	movrlz	%l1,	%o2,	%o5
	udivcc	%g3,	0x1D9A,	%l5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	smul	%l0,	0x1607,	%l3
	movge	%xcc,	%g4,	%o7
	edge32ln	%g1,	%i0,	%o0
	fmovrse	%i7,	%f10,	%f22
	be,a	%xcc,	loop_1500
	and	%g2,	%g7,	%l6
	fmovsn	%icc,	%f16,	%f14
	movrgez	%i2,	%g6,	%l2
loop_1500:
	andncc	%l4,	%o6,	%i3
	tle	%xcc,	0x0
	sdivx	%i6,	0x1138,	%o3
	bne,a,pt	%icc,	loop_1501
	sll	%g5,	%o1,	%i1
	umulcc	%o4,	0x1FFE,	%i5
	subcc	%i4,	0x19B5,	%o2
loop_1501:
	nop
	set	0x28, %g1
	stha	%o5,	[%l7 + %g1] 0xeb
	membar	#Sync
	bl,a	%icc,	loop_1502
	mulx	%g3,	0x113D,	%l1
	fnot2	%f26,	%f24
	prefetch	[%l7 + 0x70],	 0x1
loop_1502:
	sethi	0x165C,	%l5
	wr	%g0,	0x10,	%asi
	ldswa	[%l7 + 0x60] %asi,	%l3
	movg	%icc,	%l0,	%g4
	nop
	setx	loop_1503,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fba	%fcc3,	loop_1504
	movvc	%xcc,	%o7,	%i0
	fmul8x16	%f16,	%f0,	%f0
loop_1503:
	fpadd32s	%f13,	%f24,	%f11
loop_1504:
	andncc	%g1,	%i7,	%o0
	fcmpeq16	%f16,	%f12,	%g7
	udivcc	%g2,	0x0917,	%i2
	wr	%g0,	0x04,	%asi
	lduba	[%l7 + 0x58] %asi,	%g6
	umulcc	%l2,	%l4,	%o6
	lduh	[%l7 + 0x4C],	%l6
	bneg,a	%icc,	loop_1505
	udivcc	%i3,	0x1F65,	%i6
	fors	%f27,	%f23,	%f10
	array16	%g5,	%o1,	%i1
loop_1505:
	fbge,a	%fcc1,	loop_1506
	movle	%xcc,	%o4,	%o3
	xnorcc	%i4,	0x0809,	%i5
	srax	%o2,	0x01,	%g3
loop_1506:
	nop
	wr	%g0,	0x88,	%asi
	lduha	[%l7 + 0x68] %asi,	%l1
	tcs	%icc,	0x2
	sethi	0x0D77,	%l5
	set	0x110, %i3
	ldxa	[%g0 + %i3] 0x21,	%o5
	fxor	%f12,	%f10,	%f22
	fmovsvc	%xcc,	%f11,	%f25
	movrlz	%l0,	0x079,	%l3
	sllx	%o7,	0x1C,	%i0
	movvc	%xcc,	%g1,	%g4
	stx	%i7,	[%l7 + 0x70]
	subccc	%g7,	0x1D21,	%o0
	bne,a,pn	%xcc,	loop_1507
	sllx	%g2,	0x0A,	%g6
	fmul8x16	%f22,	%f2,	%f22
	move	%icc,	%l2,	%l4
loop_1507:
	tvc	%icc,	0x2
	fnot1s	%f0,	%f15
	taddcctv	%o6,	0x09AB,	%i2
	and	%l6,	0x15EA,	%i6
	wr	%g0,	0x18,	%asi
	swapa	[%l7 + 0x30] %asi,	%g5
	and	%i3,	%o1,	%i1
	xnor	%o3,	%o4,	%i5
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
	andcc	%o2,	0x0A23,	%g3
	sdiv	%l1,	0x14CC,	%l5
	bg,a,pt	%xcc,	loop_1509
loop_1508:
	stx	%i4,	[%l7 + 0x70]
	sir	0x0B31
	tgu	%xcc,	0x1
loop_1509:
	ld	[%l7 + 0x40],	%f6
	sir	0x11E5
	tvs	%icc,	0x1
	edge8l	%l0,	%o5,	%l3
	fmovda	%xcc,	%f31,	%f16
	edge8n	%i0,	%o7,	%g1
	tgu	%xcc,	0x6
	sir	0x0045
	movle	%icc,	%g4,	%i7
	movneg	%icc,	%o0,	%g2
	mulscc	%g7,	%l2,	%l4
	or	%o6,	0x065C,	%i2
	and	%l6,	0x1D92,	%i6
	add	%l7,	0x30,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] %asi,	%g6,	%g5
	add	%o1,	0x1BEA,	%i1
	ldx	[%l7 + 0x08],	%i3
	movn	%icc,	%o4,	%i5
	fcmpne16	%f24,	%f0,	%o2
	nop
	set	0x38, %l5
	stx	%o3,	[%l7 + %l5]
	swap	[%l7 + 0x64],	%l1
	fands	%f6,	%f30,	%f29
	movleu	%icc,	%g3,	%l5
	movle	%xcc,	%i4,	%o5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnor	%f18,	%f6,	%f26
	fbl,a	%fcc2,	loop_1510
	and	%l3,	0x05AD,	%i0
	bge,a,pt	%icc,	loop_1511
	fmovscc	%icc,	%f10,	%f31
loop_1510:
	nop
	wr	%g0,	0x19,	%asi
	lduba	[%l7 + 0x18] %asi,	%o7
loop_1511:
	bgu	loop_1512
	bn,a,pt	%xcc,	loop_1513
	edge8n	%g1,	%l0,	%g4
	fmovs	%f22,	%f19
loop_1512:
	sethi	0x0507,	%o0
loop_1513:
	fnegs	%f22,	%f24
	brlz,a	%i7,	loop_1514
	bg,a	loop_1515
	sdivcc	%g7,	0x0FC8,	%l2
	tge	%icc,	0x3
loop_1514:
	te	%xcc,	0x4
loop_1515:
	sub	%g2,	%l4,	%o6
	fabss	%f30,	%f14
	fmovrsgz	%i2,	%f25,	%f14
	nop
	setx	loop_1516,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	ldstub	[%l7 + 0x25],	%i6
	set	0x340, %i0
	nop 	! 	nop 	! 	ldxa	[%g0 + %i0] 0x40,	%g6 ripped by fixASI40.pl ripped by fixASI40.pl
loop_1516:
	fba,a	%fcc1,	loop_1517
	brlz,a	%l6,	loop_1518
	tvc	%xcc,	0x5
	sdivx	%o1,	0x1F59,	%g5
loop_1517:
	popc	%i3,	%o4
loop_1518:
	subc	%i5,	0x0513,	%o2
	te	%icc,	0x0
	andn	%o3,	0x0A17,	%l1
	movge	%icc,	%i1,	%g3
	fcmps	%fcc3,	%f5,	%f30
	sll	%i4,	0x00,	%l5
	set	0x6A, %i6
	ldstuba	[%l7 + %i6] 0x80,	%l3
	fbo	%fcc3,	loop_1519
	brlez,a	%o5,	loop_1520
	fmovrsne	%o7,	%f10,	%f5
	fmovdpos	%icc,	%f27,	%f26
loop_1519:
	movpos	%icc,	%g1,	%l0
loop_1520:
	bge,pt	%icc,	loop_1521
	movrne	%i0,	0x2E9,	%g4
	fmovscc	%icc,	%f0,	%f25
	tpos	%icc,	0x2
loop_1521:
	tcc	%icc,	0x0
	fbg,a	%fcc0,	loop_1522
	sethi	0x1313,	%o0
	te	%icc,	0x1
	tge	%icc,	0x6
loop_1522:
	fmovsl	%icc,	%f26,	%f3
	edge8	%g7,	%l2,	%i7
	and	%g2,	0x01DF,	%o6
	bvs	loop_1523
	fpadd16	%f16,	%f2,	%f12
	sll	%l4,	0x12,	%i2
	or	%g6,	%l6,	%i6
loop_1523:
	sir	0x181F
	subccc	%o1,	0x1563,	%i3
	movleu	%xcc,	%o4,	%i5
	te	%xcc,	0x2
	umulcc	%g5,	0x02E1,	%o2
	addccc	%o3,	0x180F,	%i1
	movpos	%icc,	%l1,	%i4
	movrgez	%g3,	0x2DB,	%l3
	fbu	%fcc1,	loop_1524
	tsubcctv	%o5,	%l5,	%g1
	wr	%g0,	0x89,	%asi
	lduha	[%l7 + 0x26] %asi,	%o7
loop_1524:
	movle	%xcc,	%l0,	%g4
	bcs,pn	%icc,	loop_1525
	fnot2	%f26,	%f22
	movrlz	%o0,	0x1C2,	%i0
	fmovdvs	%icc,	%f7,	%f23
loop_1525:
	fcmpgt32	%f12,	%f2,	%l2
	fbue	%fcc2,	loop_1526
	brlez,a	%i7,	loop_1527
	ta	%icc,	0x2
	edge8ln	%g7,	%o6,	%g2
loop_1526:
	smulcc	%l4,	0x0DE2,	%g6
loop_1527:
	andn	%i2,	0x140C,	%l6
	edge16n	%o1,	%i3,	%o4
	nop
	set	0x6F, %o1
	ldsb	[%l7 + %o1],	%i6
	set	0x7E, %l6
	stba	%g5,	[%l7 + %l6] 0x2a
	membar	#Sync
	ldub	[%l7 + 0x46],	%i5
	fsrc1	%f30,	%f10
	ba	loop_1528
	movle	%icc,	%o3,	%o2
	smulcc	%i1,	%l1,	%g3
	tsubcc	%i4,	0x1A46,	%l3
loop_1528:
	fmovs	%f2,	%f10
	membar	0x32
	tpos	%icc,	0x7
	movpos	%icc,	%l5,	%o5
	fba,a	%fcc3,	loop_1529
	sll	%g1,	%o7,	%g4
	smul	%o0,	0x1FA8,	%i0
	edge16l	%l2,	%i7,	%l0
loop_1529:
	fbl	%fcc3,	loop_1530
	fnors	%f22,	%f17,	%f15
	fbo	%fcc3,	loop_1531
	movre	%o6,	0x0AB,	%g2
loop_1530:
	nop
	wr	%g0,	0x27,	%asi
	stda	%l4,	[%l7 + 0x08] %asi
	membar	#Sync
loop_1531:
	movre	%g7,	%i2,	%g6
	movleu	%xcc,	%l6,	%i3
	movneg	%icc,	%o4,	%i6
	movcc	%icc,	%o1,	%g5
	movge	%xcc,	%o3,	%i5
	tvc	%icc,	0x5
	edge16l	%i1,	%o2,	%g3
	fbe	%fcc2,	loop_1532
	sra	%l1,	0x19,	%l3
	wr	%g0,	0x11,	%asi
	lduba	[%l7 + 0x39] %asi,	%i4
loop_1532:
	tvc	%xcc,	0x6
	subccc	%o5,	%g1,	%o7
	nop
	setx loop_1533, %l0, %l1
	jmpl %l1, %l5
	subcc	%o0,	0x102E,	%g4
	fmovde	%xcc,	%f17,	%f4
	mova	%xcc,	%l2,	%i0
loop_1533:
	edge32n	%l0,	%o6,	%i7
	subccc	%l4,	%g2,	%g7
	wr	%g0,	0x04,	%asi
	sta	%f20,	[%l7 + 0x18] %asi
	edge32l	%g6,	%i2,	%l6
	bg,pt	%icc,	loop_1534
	edge8n	%o4,	%i3,	%o1
	fbule	%fcc0,	loop_1535
	addcc	%g5,	0x0928,	%o3
loop_1534:
	nop
	setx	loop_1536,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	edge32n	%i5,	%i6,	%i1
loop_1535:
	sdivx	%o2,	0x00D3,	%l1
	sdivcc	%l3,	0x1018,	%i4
loop_1536:
	addc	%o5,	0x0711,	%g3
	fmovrsgz	%g1,	%f4,	%f19
	movgu	%icc,	%l5,	%o7
	movcc	%xcc,	%g4,	%l2
	fmovrsgez	%i0,	%f24,	%f30
	ld	[%l7 + 0x60],	%f10
	fmovrsgez	%l0,	%f4,	%f1
	tsubcctv	%o0,	%o6,	%l4
	mulx	%g2,	%i7,	%g7
	fpadd32	%f20,	%f14,	%f22
	tsubcc	%g6,	0x11CA,	%i2
	tpos	%xcc,	0x6
	edge8ln	%o4,	%l6,	%o1
	fnor	%f16,	%f30,	%f28
	bneg,a,pt	%icc,	loop_1537
	fxnors	%f6,	%f6,	%f12
	edge8n	%g5,	%o3,	%i5
	bge,a	%xcc,	loop_1538
loop_1537:
	fcmpne32	%f4,	%f0,	%i3
	nop
	setx	loop_1539,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	ble,pn	%icc,	loop_1540
loop_1538:
	fmuld8ulx16	%f26,	%f12,	%f8
	fmovdgu	%xcc,	%f8,	%f30
loop_1539:
	fmul8sux16	%f22,	%f20,	%f24
loop_1540:
	fbn	%fcc2,	loop_1541
	orn	%i6,	0x07B3,	%o2
	orncc	%l1,	0x0C34,	%i1
	add	%l7,	0x40,	%l6
	wr	%g0,	0x19,	%asi
	ldxa	[%l6] %asi,	%i4
	casxa	[%l6] 0x19,	%i4,	%l3
loop_1541:
	movvs	%icc,	%g3,	%g1
	tpos	%xcc,	0x4
	smul	%o5,	0x01A9,	%l5
	movre	%g4,	0x13E,	%o7
	bge,a	loop_1542
	ba,pn	%xcc,	loop_1543
	tsubcctv	%l2,	%i0,	%o0
	fnot2	%f16,	%f2
loop_1542:
	move	%icc,	%o6,	%l4
loop_1543:
	fnot1	%f6,	%f10
	movle	%icc,	%l0,	%g2
	tsubcc	%i7,	%g6,	%g7
	smulcc	%o4,	%l6,	%o1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmped	%fcc2,	%f20,	%f2
	sdivcc	%g5,	0x0350,	%i2
	umul	%i5,	%o3,	%i6
	set	0x50, %i4
	ldxa	[%l7 + %i4] 0x11,	%i3
	sra	%o2,	0x1A,	%l1
	tge	%icc,	0x2
	smulcc	%i4,	%i1,	%g3
	umulcc	%g1,	%o5,	%l3
	tge	%icc,	0x3
	subccc	%l5,	%g4,	%o7
	ba	%icc,	loop_1544
	nop
	set	0x24, %o3
	lduh	[%l7 + %o3],	%i0
	edge8	%l2,	%o6,	%l4
	bleu,pn	%xcc,	loop_1545
loop_1544:
	sethi	0x13F4,	%l0
	bvc,a,pt	%xcc,	loop_1546
	fbg,a	%fcc0,	loop_1547
loop_1545:
	taddcctv	%o0,	%g2,	%g6
	fmovrsgz	%g7,	%f28,	%f0
loop_1546:
	bne,a	loop_1548
loop_1547:
	edge32	%o4,	%i7,	%l6
	srax	%o1,	%i2,	%g5
	swap	[%l7 + 0x34],	%i5
loop_1548:
	bl,pn	%icc,	loop_1549
	srl	%o3,	%i6,	%o2
	edge32l	%i3,	%i4,	%l1
	ta	%icc,	0x6
loop_1549:
	edge32l	%i1,	%g3,	%o5
	andcc	%g1,	0x125F,	%l5
	bg,a	loop_1550
	membar	0x65
	popc	0x1DF4,	%l3
	mulscc	%g4,	0x074D,	%o7
loop_1550:
	fbue	%fcc2,	loop_1551
	and	%i0,	%o6,	%l2
	mulx	%l4,	%l0,	%g2
	sra	%g6,	%g7,	%o4
loop_1551:
	stw	%o0,	[%l7 + 0x14]
	bn	%icc,	loop_1552
	tsubcctv	%i7,	%l6,	%o1
	set	0x30, %l0
	stha	%i2,	[%l7 + %l0] 0x19
loop_1552:
	fexpand	%f28,	%f0
	call	loop_1553
	fnot1	%f4,	%f10
	set	0x40, %i2
	stda	%f0,	[%l7 + %i2] 0x17
	membar	#Sync
loop_1553:
	edge8ln	%g5,	%o3,	%i5
	add	%o2,	%i3,	%i6
	orcc	%i4,	0x0A19,	%l1
	stw	%g3,	[%l7 + 0x40]
	movg	%xcc,	%i1,	%g1
	orn	%o5,	%l3,	%l5
	tvs	%icc,	0x1
	edge32l	%o7,	%i0,	%o6
	wr	%g0,	0x19,	%asi
	stwa	%l2,	[%l7 + 0x64] %asi
	fmovscc	%icc,	%f15,	%f24
	bne	loop_1554
	fcmped	%fcc1,	%f4,	%f22
	edge16	%l4,	%l0,	%g2
	subccc	%g6,	%g4,	%g7
loop_1554:
	nop
	wr	%g0,	0x04,	%asi
	ldstuba	[%l7 + 0x5D] %asi,	%o4
	fmovsg	%icc,	%f31,	%f14
	subcc	%i7,	%l6,	%o0
	andcc	%i2,	0x067B,	%o1
	nop
	setx	loop_1555,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tn	%icc,	0x1
	move	%icc,	%o3,	%i5
	movpos	%icc,	%o2,	%g5
loop_1555:
	fbu	%fcc1,	loop_1556
	addccc	%i6,	%i3,	%i4
	sdivcc	%l1,	0x02C7,	%g3
	fnot2	%f14,	%f28
loop_1556:
	std	%i0,	[%l7 + 0x40]
	sth	%o5,	[%l7 + 0x76]
	fors	%f29,	%f4,	%f20
	fmovrdlez	%g1,	%f4,	%f14
	xnorcc	%l3,	0x19D5,	%l5
	udivx	%o7,	0x1E69,	%o6
	srl	%i0,	0x0D,	%l2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addc	%l0,	%l4,	%g2
	edge16ln	%g6,	%g4,	%o4
	fxnors	%f1,	%f2,	%f9
	sllx	%g7,	%l6,	%o0
	fpadd16	%f28,	%f6,	%f26
	fcmpne32	%f24,	%f2,	%i7
	fpsub16	%f20,	%f26,	%f14
	sdivx	%o1,	0x01D6,	%o3
	fmovscs	%xcc,	%f3,	%f31
	fmovdvs	%icc,	%f8,	%f22
	tsubcctv	%i2,	%o2,	%g5
	fmul8x16	%f14,	%f2,	%f20
	edge16	%i6,	%i5,	%i4
	subccc	%i3,	0x07D8,	%g3
	fnegd	%f28,	%f0
	tge	%xcc,	0x2
	fmovrsgz	%i1,	%f6,	%f26
	set	0x16, %g2
	lduba	[%l7 + %g2] 0x89,	%l1
	fmovrsne	%g1,	%f18,	%f24
	ta	%icc,	0x0
	edge16n	%o5,	%l3,	%o7
	edge16l	%o6,	%l5,	%i0
	sdivcc	%l2,	0x03A4,	%l4
	fabss	%f10,	%f29
	mova	%icc,	%l0,	%g6
	alignaddr	%g4,	%g2,	%g7
	fandnot1s	%f21,	%f8,	%f22
	smulcc	%l6,	%o4,	%i7
	edge16l	%o0,	%o3,	%i2
	fxor	%f28,	%f24,	%f24
	fnot1s	%f25,	%f31
	swap	[%l7 + 0x68],	%o1
	movgu	%icc,	%g5,	%i6
	fexpand	%f18,	%f4
	movg	%xcc,	%o2,	%i4
	movrgz	%i5,	0x17A,	%i3
	sll	%i1,	0x1E,	%l1
	orn	%g1,	%o5,	%l3
	umulcc	%g3,	0x03EF,	%o6
	ldstub	[%l7 + 0x1E],	%o7
	nop
	set	0x66, %o6
	ldub	[%l7 + %o6],	%i0
	addccc	%l5,	0x13B2,	%l2
	nop
	setx loop_1557, %l0, %l1
	jmpl %l1, %l4
	and	%g6,	0x0014,	%g4
	movrgz	%l0,	0x0E1,	%g7
	ble	%icc,	loop_1558
loop_1557:
	edge16l	%g2,	%l6,	%o4
	tvc	%icc,	0x2
	smul	%i7,	%o3,	%i2
loop_1558:
	std	%o0,	[%l7 + 0x08]
	movl	%icc,	%g5,	%o1
	srl	%i6,	%i4,	%o2
	fmovd	%f12,	%f2
	mulx	%i5,	0x0621,	%i3
	ta	%xcc,	0x0
	edge32	%i1,	%l1,	%o5
	fsrc1	%f30,	%f28
	fba,a	%fcc1,	loop_1559
	movpos	%icc,	%l3,	%g3
	ldub	[%l7 + 0x14],	%g1
	fnot1	%f30,	%f24
loop_1559:
	ldd	[%l7 + 0x50],	%f0
	movpos	%icc,	%o6,	%i0
	swap	[%l7 + 0x4C],	%o7
	array16	%l2,	%l4,	%g6
	movle	%xcc,	%g4,	%l0
	wr	%g0,	0xeb,	%asi
	stwa	%g7,	[%l7 + 0x3C] %asi
	membar	#Sync
	bvc,pt	%icc,	loop_1560
	addcc	%l5,	%g2,	%o4
	wr	%g0,	0x89,	%asi
	ldsba	[%l7 + 0x19] %asi,	%l6
loop_1560:
	fcmpne16	%f0,	%f10,	%i7
	fmovsn	%xcc,	%f21,	%f20
	ldub	[%l7 + 0x4D],	%o3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stx	%i2,	[%l7 + 0x68]
	edge8n	%o0,	%g5,	%o1
	fmovdcc	%icc,	%f7,	%f3
	mova	%xcc,	%i4,	%i6
	te	%icc,	0x6
	alignaddr	%i5,	%o2,	%i3
	alignaddr	%i1,	%l1,	%l3
	wr	%g0,	0x0c,	%asi
	lda	[%l7 + 0x30] %asi,	%f29
	alignaddr	%o5,	%g3,	%g1
	bcc	loop_1561
	xorcc	%o6,	%i0,	%l2
	fcmpne16	%f4,	%f30,	%o7
	tleu	%icc,	0x3
loop_1561:
	fmovdvs	%icc,	%f2,	%f19
	add	%l4,	%g6,	%g4
	brz,a	%g7,	loop_1562
	ld	[%l7 + 0x44],	%f5
	fmovspos	%xcc,	%f8,	%f15
	ldsw	[%l7 + 0x74],	%l5
loop_1562:
	taddcctv	%g2,	%o4,	%l0
	andcc	%i7,	0x1F47,	%l6
	movvs	%icc,	%i2,	%o3
	fnot1	%f16,	%f18
	smulcc	%g5,	%o1,	%i4
	fxor	%f4,	%f8,	%f10
	movgu	%icc,	%i6,	%i5
	fnegd	%f18,	%f22
	tcs	%xcc,	0x6
	tge	%xcc,	0x3
	andcc	%o0,	0x13C0,	%i3
	mulscc	%o2,	0x0FC3,	%i1
	or	%l3,	0x1365,	%l1
	taddcc	%o5,	%g3,	%g1
	sdivcc	%o6,	0x1FFE,	%l2
	edge32	%o7,	%l4,	%i0
	fornot2	%f20,	%f16,	%f22
	taddcctv	%g4,	%g7,	%l5
	subcc	%g2,	%o4,	%g6
	ba,pn	%xcc,	loop_1563
	edge32l	%l0,	%i7,	%i2
	edge16l	%l6,	%g5,	%o3
	fcmpd	%fcc3,	%f16,	%f28
loop_1563:
	edge16ln	%i4,	%o1,	%i6
	be,a	loop_1564
	fmovsgu	%icc,	%f28,	%f7
	udivcc	%i5,	0x0A55,	%o0
	wr	%g0,	0x22,	%asi
	stda	%o2,	[%l7 + 0x38] %asi
	membar	#Sync
loop_1564:
	te	%xcc,	0x2
	movne	%xcc,	%i3,	%i1
	tcc	%icc,	0x7
	and	%l3,	0x172F,	%o5
	bneg	%icc,	loop_1565
	edge8	%l1,	%g3,	%o6
	edge8l	%g1,	%o7,	%l2
	tgu	%icc,	0x0
loop_1565:
	fmovdn	%xcc,	%f24,	%f3
	popc	%i0,	%g4
	movgu	%xcc,	%g7,	%l4
	udivx	%l5,	0x169B,	%o4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmpd	%fcc2,	%f16,	%f16
	faligndata	%f0,	%f8,	%f28
	movpos	%icc,	%g6,	%g2
	wr	%g0,	0x19,	%asi
	stwa	%i7,	[%l7 + 0x10] %asi
	edge32l	%i2,	%l6,	%g5
	movl	%xcc,	%o3,	%l0
	udiv	%o1,	0x156E,	%i4
	add	%l7,	0x40,	%l6
	wr	%g0,	0x10,	%asi
	lda	[%l6] %asi,	%i5
	casa	[%l6] %asi,	%i5,	%o0
	sra	%o2,	0x02,	%i3
	fandnot2	%f8,	%f12,	%f2
	edge16ln	%i1,	%i6,	%o5
	fbl	%fcc1,	loop_1566
	sir	0x0B26
	bpos,a,pn	%icc,	loop_1567
	brlz,a	%l3,	loop_1568
loop_1566:
	subc	%g3,	0x1859,	%o6
	array16	%l1,	%o7,	%l2
loop_1567:
	movneg	%icc,	%g1,	%i0
loop_1568:
	udiv	%g4,	0x0F23,	%l4
	edge16n	%g7,	%l5,	%g6
	fbo	%fcc3,	loop_1569
	edge8l	%g2,	%i7,	%o4
	sllx	%i2,	0x19,	%l6
	bleu	%xcc,	loop_1570
loop_1569:
	brlz	%o3,	loop_1571
	movne	%icc,	%g5,	%o1
	udivx	%l0,	0x0AEE,	%i5
loop_1570:
	fmul8x16al	%f3,	%f25,	%f12
loop_1571:
	sra	%i4,	0x0C,	%o0
	fabss	%f1,	%f16
	fmovsgu	%icc,	%f18,	%f9
	fbug,a	%fcc2,	loop_1572
	tg	%icc,	0x6
	fble	%fcc0,	loop_1573
	fmovse	%xcc,	%f6,	%f15
loop_1572:
	andn	%i3,	%o2,	%i6
	fmul8sux16	%f18,	%f24,	%f24
loop_1573:
	fble	%fcc2,	loop_1574
	brgez	%o5,	loop_1575
	tgu	%xcc,	0x3
	fxors	%f18,	%f16,	%f20
loop_1574:
	nop
	set	0x40, %l1
	ldda	[%l7 + %l1] 0x19,	%l2
loop_1575:
	bgu,a,pn	%icc,	loop_1576
	edge8ln	%i1,	%o6,	%l1
	tgu	%xcc,	0x1
	edge8l	%g3,	%l2,	%g1
loop_1576:
	fornot1	%f4,	%f18,	%f28
	tgu	%xcc,	0x1
	sub	%i0,	%o7,	%g4
	movneg	%xcc,	%l4,	%l5
	ta	%xcc,	0x7
	orncc	%g6,	0x11E8,	%g7
	xorcc	%i7,	0x14CE,	%g2
	tl	%xcc,	0x0
	xor	%i2,	%o4,	%o3
	fand	%f8,	%f6,	%f30
	tleu	%icc,	0x5
	add	%l6,	%g5,	%l0
	add	%l7,	0x20,	%l6
	wr	%g0,	0x11,	%asi
	casa	[%l6] 0x11,	%o1,	%i5
	andn	%i4,	0x1A5C,	%i3
	wr	%g0,	0x19,	%asi
	stba	%o2,	[%l7 + 0x61] %asi
	fabsd	%f8,	%f8
	wr	%g0,	0x88,	%asi
	swapa	[%l7 + 0x34] %asi,	%i6
	movvs	%icc,	%o5,	%l3
	set	0x40, %o2
	stda	%f0,	[%l7 + %o2] 0x17
	membar	#Sync
	fmovde	%icc,	%f30,	%f10
	tneg	%xcc,	0x3
	tcc	%xcc,	0x1
	flush	%l7 + 0x64
	fornot2s	%f23,	%f13,	%f5
	movge	%xcc,	%o0,	%i1
	stbar
	srax	%l1,	%g3,	%l2
	umul	%o6,	%i0,	%g1
	fmovsg	%icc,	%f18,	%f15
	te	%icc,	0x7
	tle	%xcc,	0x6
	addc	%o7,	0x091A,	%g4
	ba,pt	%icc,	loop_1577
	tl	%icc,	0x5
	fbul,a	%fcc1,	loop_1578
	call	loop_1579
loop_1577:
	movrlz	%l5,	%l4,	%g7
	umul	%g6,	%i7,	%g2
loop_1578:
	movn	%xcc,	%i2,	%o3
loop_1579:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array32	%o4,	%g5,	%l0
	taddcc	%o1,	%i5,	%l6
	alignaddrl	%i3,	%i4,	%o2
	fbe,a	%fcc1,	loop_1580
	fbo	%fcc2,	loop_1581
	bl	loop_1582
	te	%xcc,	0x7
loop_1580:
	mulx	%o5,	%i6,	%o0
loop_1581:
	mulscc	%i1,	0x0ADC,	%l1
loop_1582:
	fones	%f2
	fxnor	%f4,	%f24,	%f14
	mulscc	%l3,	%l2,	%g3
	edge8	%o6,	%g1,	%o7
	umul	%i0,	0x1234,	%g4
	mulx	%l5,	0x07D1,	%g7
	udivx	%l4,	0x0914,	%g6
	fbule	%fcc2,	loop_1583
	fmovsleu	%xcc,	%f14,	%f27
	popc	0x11AC,	%g2
	tneg	%xcc,	0x7
loop_1583:
	udivx	%i2,	0x1701,	%o3
	andncc	%o4,	%i7,	%l0
	fmovrdlz	%o1,	%f4,	%f20
	fpadd16s	%f10,	%f10,	%f29
	smul	%g5,	%i5,	%i3
	brlez	%i4,	loop_1584
	andcc	%o2,	%o5,	%l6
	udivcc	%i6,	0x147B,	%i1
	fbo	%fcc3,	loop_1585
loop_1584:
	fand	%f0,	%f24,	%f18
	mova	%xcc,	%l1,	%l3
	movrgez	%o0,	0x258,	%g3
loop_1585:
	nop
	wr	%g0,	0x80,	%asi
	sta	%f2,	[%l7 + 0x58] %asi
	fbge,a	%fcc1,	loop_1586
	taddcctv	%l2,	%g1,	%o7
	bneg,a,pn	%icc,	loop_1587
	ldsb	[%l7 + 0x41],	%i0
loop_1586:
	brz	%g4,	loop_1588
	edge16l	%o6,	%g7,	%l4
loop_1587:
	udiv	%g6,	0x0AF5,	%l5
	be,pt	%xcc,	loop_1589
loop_1588:
	ldub	[%l7 + 0x53],	%i2
	prefetch	[%l7 + 0x50],	 0x0
	st	%f7,	[%l7 + 0x64]
loop_1589:
	ta	%xcc,	0x1
	set	0x60, %o4
	ldda	[%l7 + %o4] 0x2b,	%g2
	brz	%o4,	loop_1590
	movrgz	%i7,	0x04B,	%o3
	tcc	%icc,	0x3
	edge32n	%l0,	%g5,	%i5
loop_1590:
	ldd	[%l7 + 0x40],	%i2
	fbge,a	%fcc1,	loop_1591
	fmovdn	%xcc,	%f30,	%f13
	movneg	%icc,	%i4,	%o2
	bgu,a,pt	%xcc,	loop_1592
loop_1591:
	fmovdl	%xcc,	%f5,	%f20
	edge16l	%o5,	%l6,	%o1
	tsubcctv	%i1,	0x097C,	%l1
loop_1592:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsl	%icc,	%f18,	%f5
	tvc	%xcc,	0x6
	fmovdcs	%icc,	%f17,	%f12
	flush	%l7 + 0x30
	fbug	%fcc3,	loop_1593
	addcc	%l3,	0x1093,	%o0
	fbug,a	%fcc1,	loop_1594
	tgu	%xcc,	0x2
loop_1593:
	sth	%i6,	[%l7 + 0x36]
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
loop_1594:
	tneg	%xcc,	0x0
	orn	%l2,	%g3,	%g1
	fsrc1s	%f23,	%f16
loop_1595:
	fornot2	%f18,	%f14,	%f10
	fcmpeq16	%f28,	%f26,	%o7
	movvs	%icc,	%g4,	%i0
	fpadd32	%f22,	%f14,	%f6
	movre	%o6,	%l4,	%g7
	addc	%g6,	%l5,	%g2
	edge8ln	%o4,	%i2,	%o3
	orcc	%i7,	0x1B04,	%g5
	movgu	%icc,	%i5,	%i3
	movrgz	%l0,	0x349,	%o2
	be,a	%icc,	loop_1596
	and	%i4,	%l6,	%o1
	mova	%xcc,	%o5,	%l1
	mulscc	%i1,	%o0,	%i6
loop_1596:
	fmul8x16au	%f24,	%f17,	%f2
	fmovde	%icc,	%f24,	%f0
	addccc	%l3,	%l2,	%g1
	fpmerge	%f15,	%f17,	%f24
	fsrc1s	%f31,	%f19
	bne,a	%xcc,	loop_1597
	alignaddrl	%g3,	%g4,	%i0
	xorcc	%o6,	0x0775,	%l4
	movcs	%icc,	%o7,	%g6
loop_1597:
	fsrc2s	%f10,	%f16
	brnz,a	%g7,	loop_1598
	fbule,a	%fcc1,	loop_1599
	movcs	%xcc,	%l5,	%g2
	fands	%f17,	%f29,	%f22
loop_1598:
	fpsub32	%f2,	%f22,	%f4
loop_1599:
	mulscc	%o4,	0x1494,	%i2
	udivcc	%i7,	0x0A66,	%g5
	movg	%xcc,	%o3,	%i3
	orcc	%i5,	%o2,	%i4
	and	%l6,	0x0615,	%o1
	call	loop_1600
	andcc	%l0,	0x0275,	%l1
	bgu,a	%icc,	loop_1601
	ble	%xcc,	loop_1602
loop_1600:
	movrgz	%o5,	0x39A,	%o0
	udivcc	%i1,	0x1ED5,	%i6
loop_1601:
	srl	%l2,	%l3,	%g3
loop_1602:
	tleu	%xcc,	0x3
	nop
	setx	loop_1603,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fpsub16s	%f7,	%f6,	%f29
	edge16l	%g1,	%i0,	%g4
	fmovrsgez	%o6,	%f13,	%f11
loop_1603:
	std	%o6,	[%l7 + 0x38]
	sdiv	%l4,	0x0F51,	%g6
	subcc	%l5,	%g7,	%o4
	movge	%xcc,	%g2,	%i7
	tcs	%xcc,	0x6
	fmovs	%f4,	%f24
	fmovrsne	%g5,	%f1,	%f20
	fbul	%fcc3,	loop_1604
	srlx	%o3,	%i2,	%i3
	edge32l	%i5,	%i4,	%o2
	srlx	%l6,	%o1,	%l1
loop_1604:
	sdiv	%l0,	0x180E,	%o5
	nop
	set	0x08, %i7
	ldd	[%l7 + %i7],	%i0
	tgu	%icc,	0x6
	fcmpes	%fcc0,	%f8,	%f13
	sdiv	%i6,	0x036E,	%o0
	tne	%xcc,	0x3
	edge32	%l2,	%g3,	%g1
	sir	0x108E
	tle	%xcc,	0x6
	edge32n	%i0,	%l3,	%g4
	fnegs	%f13,	%f5
	alignaddr	%o6,	%l4,	%g6
	for	%f16,	%f16,	%f6
	bge	%icc,	loop_1605
	tsubcc	%o7,	0x0BE9,	%l5
	fmovrse	%g7,	%f30,	%f13
	nop
	setx loop_1606, %l0, %l1
	jmpl %l1, %o4
loop_1605:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fandnot1s	%f13,	%f26,	%f27
	edge8l	%i7,	%g2,	%g5
loop_1606:
	for	%f10,	%f6,	%f20
	bpos	%xcc,	loop_1607
	edge32ln	%o3,	%i3,	%i5
	edge16ln	%i2,	%i4,	%l6
	set	0x60, %l3
	ldda	[%l7 + %l3] 0x18,	%o2
loop_1607:
	fmovrsgez	%l1,	%f31,	%f3
	bcs,a,pn	%icc,	loop_1608
	fmovdge	%xcc,	%f11,	%f20
	fnot1	%f30,	%f12
	flush	%l7 + 0x38
loop_1608:
	edge16	%o1,	%l0,	%i1
	tgu	%icc,	0x6
	fmovsle	%xcc,	%f31,	%f31
	tneg	%xcc,	0x5
	movre	%i6,	%o5,	%l2
	subcc	%o0,	%g1,	%i0
	fmovscc	%xcc,	%f8,	%f3
	fmul8sux16	%f20,	%f4,	%f8
	andcc	%g3,	0x0951,	%g4
	fmul8sux16	%f20,	%f2,	%f12
	fmovdcc	%icc,	%f30,	%f21
	be,a,pn	%icc,	loop_1609
	fbge,a	%fcc2,	loop_1610
	array16	%o6,	%l4,	%g6
	wr	%g0,	0x18,	%asi
	prefetcha	[%l7 + 0x68] %asi,	 0x0
loop_1609:
	fbue,a	%fcc3,	loop_1611
loop_1610:
	movre	%o7,	%l5,	%g7
	fmovdn	%icc,	%f5,	%f7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1611:
	ta	%xcc,	0x7
	fcmpne32	%f16,	%f26,	%o4
	subc	%g2,	0x1F78,	%i7
	edge16ln	%o3,	%g5,	%i3
	xorcc	%i2,	%i4,	%l6
	wr	%g0,	0x80,	%asi
	ldstuba	[%l7 + 0x3C] %asi,	%o2
	bvc,a	loop_1612
	edge32n	%i5,	%o1,	%l0
	fcmpne32	%f0,	%f10,	%i1
	fbule,a	%fcc2,	loop_1613
loop_1612:
	and	%l1,	%i6,	%o5
	tgu	%icc,	0x4
	ldsh	[%l7 + 0x42],	%l2
loop_1613:
	fands	%f6,	%f12,	%f10
	fmul8sux16	%f26,	%f8,	%f20
	fmovrsgez	%o0,	%f13,	%f21
	ldx	[%l7 + 0x28],	%i0
	sdiv	%g3,	0x15C9,	%g4
	fmuld8ulx16	%f20,	%f24,	%f4
	stx	%o6,	[%l7 + 0x28]
	movge	%icc,	%l4,	%g1
	brnz,a	%g6,	loop_1614
	tg	%xcc,	0x6
	sra	%o7,	%l3,	%g7
	sdivx	%l5,	0x1F2C,	%o4
loop_1614:
	fmul8sux16	%f30,	%f30,	%f6
	fmovscs	%xcc,	%f13,	%f20
	orn	%i7,	%g2,	%g5
	lduw	[%l7 + 0x20],	%o3
	tsubcctv	%i3,	0x0F99,	%i2
	sdiv	%l6,	0x0AB4,	%o2
	edge32n	%i5,	%o1,	%i4
	ldsw	[%l7 + 0x24],	%i1
	fpsub32s	%f17,	%f28,	%f19
	addcc	%l1,	%l0,	%o5
	edge32l	%i6,	%l2,	%o0
	pdist	%f26,	%f8,	%f16
	smul	%g3,	0x12E7,	%g4
	udivcc	%i0,	0x11B3,	%l4
	ldub	[%l7 + 0x69],	%o6
	taddcctv	%g1,	%o7,	%g6
	fbn,a	%fcc3,	loop_1615
	array16	%g7,	%l5,	%l3
	orncc	%i7,	%o4,	%g5
	edge8n	%g2,	%o3,	%i2
loop_1615:
	fcmpd	%fcc1,	%f4,	%f4
	call	loop_1616
	std	%f4,	[%l7 + 0x40]
	movcc	%xcc,	%l6,	%o2
	subcc	%i3,	0x1496,	%i5
loop_1616:
	andcc	%i4,	0x0EE3,	%o1
	fbug,a	%fcc1,	loop_1617
	bcc,pn	%icc,	loop_1618
	tg	%icc,	0x2
	fexpand	%f12,	%f2
loop_1617:
	lduw	[%l7 + 0x68],	%i1
loop_1618:
	edge16ln	%l0,	%o5,	%i6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x10,	%asi
	lduba	[%l7 + 0x4D] %asi,	%l1
	fsrc2	%f26,	%f24
	tneg	%xcc,	0x6
	tg	%xcc,	0x4
	srl	%l2,	0x17,	%o0
	bneg	%icc,	loop_1619
	tleu	%xcc,	0x0
	st	%f19,	[%l7 + 0x6C]
	xor	%g3,	0x1DB8,	%g4
loop_1619:
	fornot2s	%f1,	%f5,	%f28
	fornot2s	%f14,	%f3,	%f12
	st	%f18,	[%l7 + 0x14]
	addc	%l4,	%o6,	%g1
	movn	%xcc,	%o7,	%g6
	bpos,pn	%icc,	loop_1620
	mova	%xcc,	%i0,	%g7
	wr	%g0,	0x89,	%asi
	stda	%l2,	[%l7 + 0x60] %asi
loop_1620:
	ta	%xcc,	0x3
	mulscc	%i7,	0x0915,	%o4
	wr	%g0,	0x11,	%asi
	prefetcha	[%l7 + 0x60] %asi,	 0x3
	xnor	%g2,	%o3,	%l5
	smul	%i2,	%l6,	%i3
	add	%l7,	0x38,	%l6
	wr	%g0,	0x0c,	%asi
	casxa	[%l6] %asi,	%i5,	%i4
	fone	%f12
	sethi	0x13A1,	%o1
	tsubcctv	%o2,	%l0,	%o5
	srlx	%i6,	0x18,	%i1
	orcc	%l1,	%l2,	%g3
	edge16l	%o0,	%l4,	%o6
	taddcc	%g1,	0x07B5,	%g4
	edge8l	%o7,	%g6,	%g7
	movrlez	%i0,	%l3,	%o4
	edge8	%g5,	%i7,	%g2
	fpadd32s	%f12,	%f4,	%f7
	smulcc	%l5,	%o3,	%l6
	be,pt	%xcc,	loop_1621
	fmovrde	%i3,	%f0,	%f8
	xnorcc	%i2,	%i5,	%o1
	fmuld8ulx16	%f5,	%f24,	%f18
loop_1621:
	siam	0x4
	edge16l	%i4,	%o2,	%l0
	fmovdle	%icc,	%f11,	%f0
	movrgez	%o5,	0x12E,	%i6
	sra	%l1,	%i1,	%l2
	movpos	%xcc,	%o0,	%g3
	ldx	[%l7 + 0x48],	%l4
	wr	%g0,	0x18,	%asi
	ldda	[%l7 + 0x40] %asi,	%o6
	udiv	%g4,	0x090B,	%g1
	addc	%g6,	0x140E,	%o7
	xnorcc	%g7,	0x0FE2,	%i0
	set	0x6C, %o5
	swapa	[%l7 + %o5] 0x0c,	%l3
	tcc	%icc,	0x0
	fcmpgt32	%f24,	%f22,	%o4
	fcmpes	%fcc0,	%f7,	%f13
	fands	%f4,	%f1,	%f31
	fmovdgu	%icc,	%f24,	%f18
	fcmpd	%fcc0,	%f8,	%f8
	and	%i7,	%g2,	%g5
	sethi	0x1AA1,	%l5
	udivcc	%o3,	0x0A4B,	%l6
	movvc	%xcc,	%i3,	%i5
	add	%i2,	%i4,	%o2
	fxor	%f2,	%f12,	%f8
	fmovsne	%icc,	%f9,	%f10
	nop
	setx	loop_1622,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	sir	0x1022
	pdist	%f22,	%f4,	%f12
	movcs	%xcc,	%l0,	%o1
loop_1622:
	brz,a	%o5,	loop_1623
	andcc	%l1,	%i1,	%l2
	alignaddr	%o0,	%i6,	%g3
	fxnor	%f24,	%f0,	%f14
loop_1623:
	fmovscc	%xcc,	%f18,	%f26
	fbn,a	%fcc1,	loop_1624
	fbl	%fcc0,	loop_1625
	sdivx	%l4,	0x191E,	%g4
	movle	%xcc,	%g1,	%g6
loop_1624:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1625:
	tn	%xcc,	0x7
	movrne	%o6,	%g7,	%o7
	edge8	%l3,	%i0,	%o4
	stw	%i7,	[%l7 + 0x28]
	movgu	%icc,	%g5,	%g2
	flush	%l7 + 0x24
	brlz	%l5,	loop_1626
	bcc,a,pn	%xcc,	loop_1627
	fandnot2	%f10,	%f28,	%f14
	add	%l7,	0x40,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] %asi,	%o3,	%i3
loop_1626:
	fmuld8sux16	%f19,	%f15,	%f4
loop_1627:
	popc	%i5,	%l6
	sethi	0x1726,	%i2
	sll	%i4,	%l0,	%o1
	wr	%g0,	0x2f,	%asi
	stha	%o2,	[%l7 + 0x20] %asi
	membar	#Sync
	tg	%icc,	0x3
	movrgz	%o5,	%l1,	%l2
	sllx	%o0,	%i6,	%i1
	stb	%g3,	[%l7 + 0x5D]
	tn	%icc,	0x7
	fornot1s	%f15,	%f30,	%f7
	tl	%xcc,	0x0
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
	fcmple32	%f20,	%f16,	%l4
	ldstub	[%l7 + 0x72],	%g1
	tpos	%xcc,	0x3
loop_1628:
	fmovrde	%g4,	%f2,	%f12
	srax	%o6,	%g7,	%g6
	mulscc	%o7,	%i0,	%l3
	edge16n	%o4,	%g5,	%i7
	addcc	%g2,	%l5,	%i3
	movrne	%o3,	%i5,	%l6
	fexpand	%f27,	%f26
	andncc	%i4,	%l0,	%o1
	set	0x48, %o0
	ldswa	[%l7 + %o0] 0x80,	%i2
	move	%icc,	%o2,	%o5
	nop
	setx loop_1629, %l0, %l1
	jmpl %l1, %l1
	taddcctv	%o0,	%i6,	%i1
	membar	#Sync
	set	0x40, %l4
	ldda	[%l7 + %l4] 0xf9,	%f0
loop_1629:
	membar	0x13
	faligndata	%f6,	%f20,	%f20
	subcc	%g3,	0x1F9F,	%l2
	edge8n	%l4,	%g1,	%g4
	subcc	%g7,	0x069D,	%g6
	sdivcc	%o7,	0x1D03,	%o6
	bgu,a	loop_1630
	stbar
	movcs	%xcc,	%i0,	%o4
	andcc	%l3,	0x0178,	%g5
loop_1630:
	tle	%xcc,	0x6
	bleu,a,pt	%xcc,	loop_1631
	addc	%g2,	0x0043,	%l5
	flush	%l7 + 0x38
	wr	%g0,	0x81,	%asi
	ldsba	[%l7 + 0x5F] %asi,	%i7
loop_1631:
	nop
	wr	%g0,	0x0c,	%asi
	prefetcha	[%l7 + 0x68] %asi,	 0x2
	movgu	%xcc,	%i5,	%o3
	fcmpgt32	%f28,	%f28,	%l6
	bvc	%icc,	loop_1632
	array8	%i4,	%o1,	%l0
	fmovdle	%icc,	%f25,	%f4
	movneg	%icc,	%i2,	%o2
loop_1632:
	sdivx	%o5,	0x1EC0,	%o0
	udivx	%i6,	0x146E,	%l1
	tvc	%icc,	0x7
	mulx	%g3,	0x1575,	%i1
	fors	%f6,	%f13,	%f17
	array32	%l4,	%g1,	%g4
	bcc,pt	%icc,	loop_1633
	movcs	%icc,	%g7,	%l2
	sdiv	%o7,	0x0FD6,	%g6
	fpack32	%f4,	%f22,	%f4
loop_1633:
	edge8n	%o6,	%i0,	%o4
	edge16	%l3,	%g2,	%g5
	bpos,a	loop_1634
	smul	%i7,	%i3,	%i5
	tvc	%icc,	0x6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1634:
	alignaddr	%o3,	%l6,	%l5
	fcmpne16	%f28,	%f0,	%o1
	tvc	%icc,	0x6
	fmovrslez	%i4,	%f24,	%f9
	subc	%i2,	%o2,	%o5
	tl	%icc,	0x4
	ta	%icc,	0x6
	movge	%icc,	%o0,	%l0
	brz,a	%i6,	loop_1635
	addcc	%l1,	0x136F,	%i1
	popc	0x0C70,	%l4
	swap	[%l7 + 0x18],	%g1
loop_1635:
	fcmpne32	%f20,	%f24,	%g4
	addccc	%g3,	0x1B89,	%g7
	tgu	%icc,	0x5
	fzero	%f24
	fmovspos	%icc,	%f26,	%f18
	ta	%icc,	0x2
	wr	%g0,	0x18,	%asi
	lda	[%l7 + 0x7C] %asi,	%f24
	fmovdle	%xcc,	%f4,	%f15
	sethi	0x1853,	%l2
	fmovdle	%icc,	%f28,	%f25
	wr	%g0,	0x11,	%asi
	stha	%g6,	[%l7 + 0x3A] %asi
	edge32n	%o6,	%i0,	%o7
	set	0x19, %o7
	ldsba	[%l7 + %o7] 0x18,	%o4
	orncc	%l3,	%g2,	%g5
	srl	%i7,	0x1C,	%i3
	ldsw	[%l7 + 0x40],	%i5
	movpos	%xcc,	%o3,	%l6
	fpack16	%f16,	%f16
	fcmpgt32	%f4,	%f10,	%l5
	brlez,a	%o1,	loop_1636
	fandnot2	%f4,	%f28,	%f2
	movpos	%icc,	%i2,	%i4
	fmovdpos	%icc,	%f16,	%f1
loop_1636:
	srl	%o5,	0x17,	%o0
	edge32	%o2,	%i6,	%l0
	movl	%xcc,	%l1,	%i1
	orcc	%l4,	%g1,	%g4
	bg	%xcc,	loop_1637
	sir	0x196A
	movrne	%g7,	0x32C,	%g3
	stw	%g6,	[%l7 + 0x78]
loop_1637:
	te	%xcc,	0x0
	udivx	%o6,	0x104C,	%l2
	movl	%icc,	%o7,	%i0
	fmovdle	%xcc,	%f27,	%f2
	orn	%l3,	%g2,	%g5
	and	%i7,	0x080C,	%o4
	movrgz	%i3,	%i5,	%o3
	addcc	%l6,	0x0677,	%l5
	tne	%icc,	0x0
	lduh	[%l7 + 0x4A],	%o1
	and	%i2,	%i4,	%o0
	edge16n	%o5,	%o2,	%l0
	fbne	%fcc2,	loop_1638
	fandnot1	%f10,	%f14,	%f24
	sethi	0x0D23,	%i6
	fcmple16	%f26,	%f30,	%i1
loop_1638:
	brlez	%l1,	loop_1639
	smul	%l4,	0x15C2,	%g1
	tvc	%icc,	0x2
	fbg,a	%fcc1,	loop_1640
loop_1639:
	fmovsvs	%xcc,	%f7,	%f28
	fmovrdlez	%g7,	%f22,	%f8
	lduw	[%l7 + 0x20],	%g3
loop_1640:
	ta	%xcc,	0x1
	fandnot2s	%f16,	%f25,	%f21
	wr	%g0,	0x80,	%asi
	sta	%f10,	[%l7 + 0x6C] %asi
	for	%f20,	%f22,	%f20
	and	%g6,	0x153D,	%g4
	wr	%g0,	0xeb,	%asi
	stha	%l2,	[%l7 + 0x0E] %asi
	membar	#Sync
	fxnors	%f30,	%f10,	%f16
	fandnot1	%f20,	%f12,	%f16
	movrlz	%o6,	0x18A,	%o7
	edge8l	%l3,	%i0,	%g5
	edge16ln	%g2,	%o4,	%i3
	wr	%g0,	0x0c,	%asi
	ldstuba	[%l7 + 0x3A] %asi,	%i5
	wr	%g0,	0xeb,	%asi
	stwa	%i7,	[%l7 + 0x0C] %asi
	membar	#Sync
	brlez,a	%o3,	loop_1641
	fnands	%f0,	%f1,	%f0
	array32	%l6,	%o1,	%l5
	sth	%i2,	[%l7 + 0x28]
loop_1641:
	array8	%i4,	%o5,	%o2
	stb	%o0,	[%l7 + 0x71]
	nop
	setx	loop_1642,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fnot1	%f22,	%f22
	andncc	%l0,	%i6,	%l1
	set	0x1C, %g7
	sta	%f2,	[%l7 + %g7] 0x89
loop_1642:
	ldstub	[%l7 + 0x33],	%i1
	std	%l4,	[%l7 + 0x10]
	xnor	%g1,	%g7,	%g6
	stbar
	tvc	%xcc,	0x5
	taddcc	%g3,	0x0145,	%g4
	umulcc	%o6,	0x1CB2,	%o7
	edge16n	%l2,	%l3,	%i0
	fmovsa	%icc,	%f4,	%f12
	alignaddr	%g5,	%o4,	%i3
	fmovdpos	%icc,	%f6,	%f31
	fmovsneg	%icc,	%f1,	%f12
	fbul,a	%fcc1,	loop_1643
	fcmpeq16	%f28,	%f26,	%g2
	tcc	%icc,	0x7
	fexpand	%f4,	%f24
loop_1643:
	movvs	%xcc,	%i7,	%i5
	sll	%o3,	%l6,	%o1
	fbul	%fcc0,	loop_1644
	fbl,a	%fcc3,	loop_1645
	movl	%icc,	%l5,	%i4
	ld	[%l7 + 0x70],	%f27
loop_1644:
	array8	%i2,	%o2,	%o0
loop_1645:
	srlx	%l0,	0x0E,	%o5
	fbne	%fcc3,	loop_1646
	edge8n	%i6,	%i1,	%l4
	movcc	%icc,	%l1,	%g7
	movg	%icc,	%g1,	%g6
loop_1646:
	fmovsvs	%icc,	%f18,	%f3
	set	0x40, %l2
	stda	%f16,	[%l7 + %l2] 0xf0
	membar	#Sync
	bl,pn	%icc,	loop_1647
	st	%f10,	[%l7 + 0x64]
	fmovs	%f13,	%f2
	tcs	%xcc,	0x7
loop_1647:
	sll	%g3,	0x0A,	%o6
	fpadd16	%f2,	%f12,	%f10
	tl	%xcc,	0x6
	fbule,a	%fcc0,	loop_1648
	bpos,pn	%icc,	loop_1649
	fabsd	%f14,	%f0
	movvc	%icc,	%g4,	%o7
loop_1648:
	sdivx	%l3,	0x0AE6,	%l2
loop_1649:
	fbg,a	%fcc3,	loop_1650
	array8	%g5,	%o4,	%i0
	ldsh	[%l7 + 0x0E],	%g2
	fbul,a	%fcc2,	loop_1651
loop_1650:
	fandnot2	%f22,	%f26,	%f24
	fcmps	%fcc3,	%f21,	%f18
	call	loop_1652
loop_1651:
	taddcc	%i7,	0x1C11,	%i5
	edge16l	%o3,	%l6,	%i3
	mova	%xcc,	%o1,	%l5
loop_1652:
	taddcc	%i4,	%o2,	%o0
	sra	%l0,	%i2,	%i6
	andcc	%i1,	%o5,	%l4
	umul	%g7,	0x1542,	%g1
	fornot1s	%f13,	%f21,	%f12
	call	loop_1653
	edge8l	%g6,	%l1,	%g3
	tgu	%icc,	0x4
	tcc	%xcc,	0x7
loop_1653:
	sra	%o6,	%g4,	%l3
	xnorcc	%o7,	%l2,	%g5
	smulcc	%i0,	0x0CE3,	%g2
	bl,a	%icc,	loop_1654
	umulcc	%o4,	%i5,	%o3
	movgu	%xcc,	%l6,	%i7
	sdivcc	%i3,	0x0679,	%o1
loop_1654:
	edge8l	%l5,	%i4,	%o0
	xor	%o2,	%i2,	%i6
	movgu	%xcc,	%i1,	%o5
	xorcc	%l4,	0x08E3,	%g7
	brlz	%l0,	loop_1655
	srl	%g1,	0x0B,	%g6
	fmovdl	%icc,	%f3,	%f28
	wr	%g0,	0x19,	%asi
	lda	[%l7 + 0x0C] %asi,	%f6
loop_1655:
	edge32n	%l1,	%g3,	%g4
	ldub	[%l7 + 0x38],	%o6
	sub	%o7,	%l3,	%g5
	array8	%i0,	%g2,	%o4
	orn	%l2,	0x1C47,	%i5
	umulcc	%l6,	%i7,	%i3
	fmovsleu	%xcc,	%f24,	%f9
	fmovdne	%xcc,	%f1,	%f15
	alignaddrl	%o1,	%o3,	%l5
	movcs	%icc,	%i4,	%o0
	brnz	%i2,	loop_1656
	tvs	%icc,	0x3
	addcc	%o2,	0x1B08,	%i1
	edge8n	%i6,	%l4,	%g7
loop_1656:
	mulx	%o5,	0x09BE,	%l0
	xnorcc	%g1,	0x09E0,	%g6
	swap	[%l7 + 0x48],	%l1
	sra	%g3,	%g4,	%o7
	fbu,a	%fcc1,	loop_1657
	tcc	%xcc,	0x5
	bne,pn	%icc,	loop_1658
	fmovse	%xcc,	%f29,	%f30
loop_1657:
	sllx	%o6,	%g5,	%l3
	or	%i0,	0x1647,	%g2
loop_1658:
	mova	%icc,	%l2,	%i5
	bpos,a	%icc,	loop_1659
	tle	%icc,	0x7
	fbg,a	%fcc3,	loop_1660
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1659:
	fxors	%f28,	%f2,	%f5
	movpos	%icc,	%o4,	%i7
loop_1660:
	fmovrse	%l6,	%f12,	%f5
	prefetch	[%l7 + 0x1C],	 0x1
	fands	%f11,	%f2,	%f20
	mulx	%i3,	0x0851,	%o1
	fmul8x16	%f2,	%f0,	%f10
	fmovrdne	%l5,	%f26,	%f12
	fmovs	%f15,	%f11
	tcs	%icc,	0x4
	fmovdn	%xcc,	%f20,	%f10
	tcc	%xcc,	0x4
	brlez	%o3,	loop_1661
	movrlez	%i4,	0x1D0,	%o0
	movn	%icc,	%i2,	%i1
	edge16l	%o2,	%l4,	%g7
loop_1661:
	sra	%o5,	%i6,	%g1
	tvc	%xcc,	0x6
	or	%g6,	0x1873,	%l0
	edge32n	%g3,	%g4,	%o7
	fxors	%f31,	%f17,	%f1
	fbge	%fcc0,	loop_1662
	tleu	%xcc,	0x4
	fnand	%f16,	%f30,	%f12
	mova	%xcc,	%l1,	%o6
loop_1662:
	fmovrdne	%g5,	%f10,	%f6
	add	%l3,	%i0,	%l2
	movrlz	%g2,	%o4,	%i5
	bne,a	loop_1663
	fone	%f2
	or	%l6,	0x0317,	%i3
	tcc	%icc,	0x6
loop_1663:
	tg	%icc,	0x2
	udivcc	%o1,	0x1FDB,	%l5
	tne	%icc,	0x7
	movrlez	%i7,	0x2BE,	%i4
	bcs,pt	%icc,	loop_1664
	lduh	[%l7 + 0x24],	%o0
	fors	%f11,	%f14,	%f5
	movgu	%icc,	%o3,	%i2
loop_1664:
	movrlez	%o2,	0x19C,	%i1
	fbn	%fcc2,	loop_1665
	fmovdg	%xcc,	%f10,	%f5
	sethi	0x1902,	%g7
	nop
	setx	loop_1666,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_1665:
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
	fnegd	%f20,	%f20
	edge32	%l4,	%i6,	%o5
loop_1666:
	nop
	set	0x3C, %g5
	swapa	[%l7 + %g5] 0x18,	%g6
loop_1667:
	nop
	set	0x54, %i1
	ldsha	[%l7 + %i1] 0x10,	%l0
	edge32ln	%g3,	%g1,	%g4
	fone	%f2
	movcs	%xcc,	%l1,	%o7
	sub	%o6,	0x177B,	%l3
	sra	%g5,	%i0,	%l2
	fmovdleu	%icc,	%f15,	%f28
	fmovsleu	%icc,	%f17,	%f16
	fnegs	%f27,	%f14
	set	0x0A, %g6
	lduha	[%l7 + %g6] 0x80,	%g2
	alignaddrl	%o4,	%i5,	%i3
	te	%icc,	0x3
	srlx	%l6,	0x0A,	%l5
	subcc	%o1,	0x1AFC,	%i4
	te	%icc,	0x2
	udivcc	%i7,	0x0C47,	%o0
	movpos	%xcc,	%o3,	%i2
	call	loop_1668
	movneg	%xcc,	%o2,	%i1
	fexpand	%f12,	%f6
	movg	%icc,	%l4,	%g7
loop_1668:
	brlez	%i6,	loop_1669
	and	%o5,	%g6,	%g3
	movvs	%xcc,	%l0,	%g4
	andn	%g1,	0x181B,	%l1
loop_1669:
	edge16l	%o7,	%l3,	%o6
	udiv	%i0,	0x17EC,	%g5
	brlz	%l2,	loop_1670
	udiv	%g2,	0x18A9,	%i5
	fmovdne	%xcc,	%f17,	%f13
	edge32	%i3,	%o4,	%l5
loop_1670:
	andcc	%o1,	%i4,	%l6
	nop
	set	0x10, %g3
	ldx	[%l7 + %g3],	%i7
	tn	%xcc,	0x6
	andcc	%o3,	0x1C10,	%i2
	te	%icc,	0x7
	nop
	setx	loop_1671,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	be,a	%icc,	loop_1672
	tn	%icc,	0x5
	te	%xcc,	0x1
loop_1671:
	addcc	%o0,	0x1CB6,	%o2
loop_1672:
	array16	%l4,	%i1,	%i6
	movn	%icc,	%g7,	%g6
	movre	%o5,	%l0,	%g3
	mova	%icc,	%g4,	%g1
	edge16n	%l1,	%l3,	%o6
	fbg,a	%fcc0,	loop_1673
	tleu	%icc,	0x7
	ta	%xcc,	0x5
	tleu	%xcc,	0x3
loop_1673:
	andn	%o7,	0x0DF8,	%g5
	fbo	%fcc0,	loop_1674
	fcmpne32	%f14,	%f2,	%i0
	movle	%xcc,	%g2,	%i5
	tvc	%xcc,	0x1
loop_1674:
	fpsub16	%f12,	%f22,	%f12
	st	%f29,	[%l7 + 0x1C]
	sub	%i3,	0x1FAC,	%o4
	brlez,a	%l5,	loop_1675
	st	%f16,	[%l7 + 0x40]
	xor	%o1,	0x0649,	%l2
	fcmpne16	%f20,	%f22,	%i4
loop_1675:
	bne,a,pn	%icc,	loop_1676
	movl	%icc,	%l6,	%i7
	mulx	%i2,	0x15C6,	%o0
	fmovdne	%icc,	%f10,	%f7
loop_1676:
	sdivcc	%o3,	0x08FA,	%o2
	fornot1	%f22,	%f22,	%f28
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x0A] %asi,	%i1
	fbule	%fcc3,	loop_1677
	array32	%i6,	%l4,	%g6
	taddcctv	%o5,	%g7,	%l0
	udiv	%g4,	0x0659,	%g3
loop_1677:
	fmovdvc	%icc,	%f8,	%f3
	fmovsl	%xcc,	%f19,	%f9
	andcc	%l1,	0x0990,	%g1
	stb	%l3,	[%l7 + 0x61]
	movrne	%o6,	0x1CB,	%o7
	andncc	%g5,	%i0,	%i5
	movpos	%xcc,	%i3,	%o4
	fmovscc	%icc,	%f22,	%f7
	move	%xcc,	%g2,	%l5
	tgu	%xcc,	0x2
	bge	loop_1678
	tvs	%icc,	0x6
	ldd	[%l7 + 0x50],	%o0
	taddcc	%l2,	0x1D2C,	%l6
loop_1678:
	fmovdleu	%icc,	%f12,	%f9
	bg,a	loop_1679
	udivcc	%i4,	0x060D,	%i2
	udivx	%o0,	0x11A8,	%i7
	add	%o3,	0x049C,	%i1
loop_1679:
	fpadd32	%f2,	%f30,	%f30
	udivcc	%i6,	0x0D38,	%l4
	fblg,a	%fcc1,	loop_1680
	fxnor	%f6,	%f24,	%f2
	membar	0x1C
	tcs	%xcc,	0x1
loop_1680:
	bgu,a,pt	%icc,	loop_1681
	fandnot1s	%f12,	%f19,	%f10
	addccc	%o2,	0x135D,	%g6
	array32	%g7,	%o5,	%g4
loop_1681:
	tcs	%icc,	0x4
	add	%l0,	0x13D4,	%g3
	add	%g1,	%l1,	%o6
	ldub	[%l7 + 0x20],	%l3
	fsrc2	%f0,	%f8
	addc	%o7,	%i0,	%i5
	edge8n	%i3,	%o4,	%g2
	fbn	%fcc0,	loop_1682
	fmovsne	%icc,	%f8,	%f19
	umul	%l5,	0x1ADD,	%o1
	xor	%l2,	%l6,	%i4
loop_1682:
	fmovrdgz	%g5,	%f22,	%f22
	sub	%o0,	0x182A,	%i7
	bge,a,pn	%xcc,	loop_1683
	bl,a	%xcc,	loop_1684
	tne	%icc,	0x0
	or	%o3,	0x1847,	%i1
loop_1683:
	fmuld8sux16	%f27,	%f23,	%f12
loop_1684:
	movne	%xcc,	%i2,	%l4
	sdivcc	%o2,	0x1B24,	%g6
	tsubcc	%i6,	0x1257,	%o5
	bne,a	%icc,	loop_1685
	movrlez	%g7,	0x2FB,	%g4
	fcmpes	%fcc2,	%f0,	%f1
	fmovscc	%icc,	%f14,	%f17
loop_1685:
	edge16l	%g3,	%l0,	%g1
	set	0x72, %i5
	ldsha	[%l7 + %i5] 0x89,	%l1
	tvc	%icc,	0x6
	ble,a,pn	%xcc,	loop_1686
	popc	0x088A,	%l3
	taddcctv	%o7,	0x04AD,	%i0
	movcs	%xcc,	%o6,	%i5
loop_1686:
	fmovdcc	%icc,	%f28,	%f9
	ta	%xcc,	0x2
	udivx	%o4,	0x1F75,	%g2
	fnot2	%f30,	%f20
	set	0x60, %g1
	stwa	%i3,	[%l7 + %g1] 0x27
	membar	#Sync
	bgu	loop_1687
	sllx	%o1,	%l2,	%l6
	array16	%l5,	%i4,	%o0
	smul	%g5,	0x0CAD,	%o3
loop_1687:
	andncc	%i1,	%i2,	%i7
	brlz	%o2,	loop_1688
	movleu	%xcc,	%g6,	%i6
	srlx	%l4,	%g7,	%g4
	fzero	%f26
loop_1688:
	movcs	%icc,	%o5,	%g3
	fnegs	%f16,	%f10
	mulscc	%g1,	%l0,	%l1
	array8	%l3,	%i0,	%o7
	wr	%g0,	0x10,	%asi
	lda	[%l7 + 0x1C] %asi,	%f26
	movleu	%xcc,	%o6,	%i5
	edge8n	%g2,	%i3,	%o4
	stw	%o1,	[%l7 + 0x58]
	movneg	%icc,	%l2,	%l5
	movrgz	%i4,	%l6,	%o0
	umulcc	%g5,	0x16BE,	%i1
	fandnot1s	%f21,	%f26,	%f11
	udivcc	%o3,	0x0737,	%i2
	fbge	%fcc1,	loop_1689
	fmovscc	%icc,	%f30,	%f7
	xor	%i7,	0x0677,	%o2
	movleu	%icc,	%g6,	%l4
loop_1689:
	movrgez	%i6,	%g7,	%o5
	bcs,a,pn	%icc,	loop_1690
	subcc	%g3,	0x1D73,	%g1
	membar	0x03
	tneg	%xcc,	0x3
loop_1690:
	fone	%f6
	mulscc	%g4,	0x1330,	%l0
	swap	[%l7 + 0x40],	%l3
	edge8	%i0,	%l1,	%o7
	taddcc	%i5,	0x1BA1,	%o6
	stw	%g2,	[%l7 + 0x7C]
	fmovrdgez	%o4,	%f26,	%f0
	fmuld8ulx16	%f30,	%f12,	%f10
	srl	%i3,	%l2,	%l5
	stbar
	nop
	setx	loop_1691,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	bvc	loop_1692
	orcc	%o1,	0x15CE,	%i4
	fnot2s	%f2,	%f17
loop_1691:
	sll	%o0,	0x08,	%g5
loop_1692:
	fba	%fcc0,	loop_1693
	xor	%i1,	0x012F,	%l6
	fxnor	%f20,	%f22,	%f10
	andcc	%i2,	%o3,	%o2
loop_1693:
	fmovrslez	%g6,	%f10,	%f22
	fmovspos	%icc,	%f15,	%f29
	add	%i7,	0x10FC,	%i6
	fbg	%fcc3,	loop_1694
	fnot2s	%f12,	%f22
	taddcctv	%g7,	0x14C3,	%o5
	or	%g3,	0x0508,	%l4
loop_1694:
	umul	%g4,	0x0DCE,	%g1
	tleu	%icc,	0x2
	sdivx	%l3,	0x13A8,	%i0
	fmovrsne	%l1,	%f2,	%f4
	orncc	%l0,	0x1569,	%o7
	fmovscs	%xcc,	%f12,	%f27
	brnz	%o6,	loop_1695
	brgz,a	%i5,	loop_1696
	tge	%xcc,	0x2
	bg,pn	%icc,	loop_1697
loop_1695:
	mulx	%o4,	0x1D09,	%g2
loop_1696:
	fpmerge	%f18,	%f13,	%f10
	movrgz	%l2,	%i3,	%l5
loop_1697:
	umulcc	%o1,	%o0,	%g5
	xnor	%i4,	%l6,	%i2
	fmovscc	%xcc,	%f8,	%f13
	edge32l	%o3,	%i1,	%o2
	fnegs	%f3,	%f8
	edge32l	%i7,	%g6,	%g7
	array8	%o5,	%g3,	%l4
	add	%g4,	%i6,	%g1
	ldsw	[%l7 + 0x0C],	%i0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mulx	%l1,	%l3,	%o7
	fmovsle	%xcc,	%f4,	%f9
	xnor	%l0,	%o6,	%i5
	bvc,pt	%xcc,	loop_1698
	orn	%o4,	%g2,	%i3
	ba,a,pn	%xcc,	loop_1699
	orncc	%l5,	%o1,	%l2
loop_1698:
	udiv	%g5,	0x1AF5,	%o0
	movg	%xcc,	%l6,	%i2
loop_1699:
	be,a	loop_1700
	movgu	%xcc,	%i4,	%i1
	array32	%o3,	%o2,	%g6
	tne	%xcc,	0x4
loop_1700:
	fpadd32s	%f13,	%f6,	%f9
	movpos	%icc,	%i7,	%g7
	be,pt	%icc,	loop_1701
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrlez	%g3,	0x327,	%l4
	fmovsl	%xcc,	%f26,	%f24
loop_1701:
	tvc	%icc,	0x3
	wr	%g0,	0x0c,	%asi
	ldstuba	[%l7 + 0x30] %asi,	%g4
	brgz	%o5,	loop_1702
	bvs,a	loop_1703
	tsubcc	%i6,	%i0,	%l1
	ldsb	[%l7 + 0x09],	%g1
loop_1702:
	orncc	%l3,	%l0,	%o6
loop_1703:
	movrgz	%o7,	0x123,	%i5
	st	%f10,	[%l7 + 0x0C]
	array32	%g2,	%o4,	%i3
	alignaddrl	%l5,	%l2,	%o1
	alignaddr	%o0,	%g5,	%l6
	movrgz	%i2,	0x0E7,	%i1
	udivx	%o3,	0x118F,	%i4
	array8	%g6,	%o2,	%i7
	movrne	%g7,	0x05C,	%l4
	umul	%g4,	%g3,	%o5
	tg	%xcc,	0x4
	movvs	%icc,	%i6,	%i0
	xorcc	%g1,	%l1,	%l0
	subccc	%l3,	0x023B,	%o7
	fnot1s	%f0,	%f10
	sdivx	%i5,	0x0ADB,	%g2
	sir	0x0016
	fmul8ulx16	%f12,	%f8,	%f26
	movpos	%icc,	%o6,	%i3
	or	%o4,	%l5,	%l2
	mova	%icc,	%o1,	%g5
	bl,a	%icc,	loop_1704
	tle	%icc,	0x3
	te	%icc,	0x1
	fmul8x16au	%f12,	%f6,	%f2
loop_1704:
	edge8	%l6,	%i2,	%i1
	tpos	%xcc,	0x7
	stbar
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	membar	0x48
	movcs	%xcc,	%o3,	%o0
	brlez	%g6,	loop_1705
	edge32	%o2,	%i4,	%i7
	subccc	%g7,	0x06C6,	%g4
	bpos,a,pn	%icc,	loop_1706
loop_1705:
	fbuge,a	%fcc3,	loop_1707
	movge	%icc,	%l4,	%o5
	tne	%xcc,	0x6
loop_1706:
	movg	%xcc,	%i6,	%g3
loop_1707:
	sdivcc	%i0,	0x0666,	%l1
	fandnot1s	%f10,	%f1,	%f31
	movrne	%g1,	0x3B8,	%l3
	ta	%xcc,	0x2
	brgz,a	%l0,	loop_1708
	movne	%xcc,	%o7,	%g2
	ta	%xcc,	0x7
	orn	%o6,	0x0135,	%i5
loop_1708:
	fmul8x16al	%f18,	%f22,	%f10
	edge32	%o4,	%i3,	%l5
	fpadd16	%f4,	%f24,	%f18
	addccc	%o1,	0x1485,	%l2
	brlz,a	%g5,	loop_1709
	udiv	%l6,	0x10C8,	%i2
	edge8l	%i1,	%o3,	%g6
	tpos	%icc,	0x2
loop_1709:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bpos,pn	%icc,	loop_1710
	smul	%o0,	0x1B2C,	%i4
	ld	[%l7 + 0x20],	%f11
	movne	%icc,	%i7,	%o2
loop_1710:
	tsubcc	%g4,	0x1A13,	%g7
	fmovrdlez	%l4,	%f24,	%f12
	fmovda	%xcc,	%f19,	%f26
	bgu,a	loop_1711
	edge16	%i6,	%g3,	%o5
	tl	%xcc,	0x7
	addccc	%l1,	%g1,	%i0
loop_1711:
	edge32	%l3,	%o7,	%g2
	sdivcc	%o6,	0x0F83,	%l0
	movneg	%icc,	%i5,	%i3
	edge8	%l5,	%o1,	%o4
	movleu	%xcc,	%g5,	%l6
	or	%i2,	%l2,	%i1
	andcc	%g6,	%o0,	%o3
	tneg	%xcc,	0x4
	tvs	%icc,	0x0
	ldsb	[%l7 + 0x49],	%i4
	wr	%g0,	0x11,	%asi
	ldda	[%l7 + 0x70] %asi,	%i6
	xor	%g4,	0x1385,	%g7
	brlez	%o2,	loop_1712
	fbuge,a	%fcc3,	loop_1713
	array16	%i6,	%g3,	%l4
	umul	%o5,	%g1,	%l1
loop_1712:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1713:
	std	%f24,	[%l7 + 0x30]
	fcmpne32	%f14,	%f8,	%i0
	tne	%xcc,	0x3
	edge16n	%o7,	%g2,	%l3
	swap	[%l7 + 0x34],	%o6
	brz,a	%l0,	loop_1714
	addc	%i5,	%i3,	%o1
	udivx	%o4,	0x0886,	%l5
	array32	%g5,	%i2,	%l6
loop_1714:
	nop
	add	%l7,	0x7C,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%i1,	%g6
	subccc	%l2,	%o3,	%i4
	fmovdpos	%icc,	%f19,	%f10
	flush	%l7 + 0x48
	edge32	%o0,	%g4,	%i7
	bcc,a	%xcc,	loop_1715
	movne	%xcc,	%o2,	%g7
	edge16l	%g3,	%l4,	%o5
	subc	%i6,	0x0A08,	%g1
loop_1715:
	fcmped	%fcc1,	%f30,	%f12
	fmovdcc	%xcc,	%f31,	%f30
	fnot2	%f12,	%f26
	wr	%g0,	0x81,	%asi
	sta	%f0,	[%l7 + 0x7C] %asi
	bcs,a	%xcc,	loop_1716
	sra	%l1,	0x10,	%i0
	wr	%g0,	0xeb,	%asi
	stda	%o6,	[%l7 + 0x38] %asi
	membar	#Sync
loop_1716:
	bcs	%icc,	loop_1717
	tn	%icc,	0x5
	st	%f23,	[%l7 + 0x24]
	bg,pn	%xcc,	loop_1718
loop_1717:
	popc	%l3,	%o6
	andcc	%l0,	%g2,	%i5
	add	%l7,	0x28,	%l6
	wr	%g0,	0x11,	%asi
	casxa	[%l6] 0x11,	%o1,	%i3
loop_1718:
	sdiv	%l5,	0x0431,	%g5
	addc	%o4,	0x16F1,	%i2
	and	%i1,	0x0711,	%g6
	membar	0x54
	array32	%l2,	%o3,	%i4
	bg,a,pn	%xcc,	loop_1719
	addccc	%l6,	0x1F87,	%o0
	array32	%g4,	%o2,	%g7
	fpadd16s	%f6,	%f30,	%f1
loop_1719:
	tge	%xcc,	0x2
	fxnor	%f2,	%f10,	%f22
	addc	%g3,	%i7,	%o5
	swap	[%l7 + 0x48],	%i6
	movvc	%icc,	%l4,	%l1
	wr	%g0,	0x80,	%asi
	ldswa	[%l7 + 0x54] %asi,	%g1
	sir	0x1A73
	bg,pn	%icc,	loop_1720
	movre	%o7,	%l3,	%o6
	bcc,a,pt	%icc,	loop_1721
	xnorcc	%i0,	0x0BD4,	%l0
loop_1720:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmul8x16au	%f20,	%f4,	%f28
loop_1721:
	fexpand	%f12,	%f20
	movrlez	%g2,	0x0E0,	%o1
	orncc	%i3,	%i5,	%l5
	movle	%xcc,	%g5,	%i2
	sub	%i1,	%o4,	%l2
	edge8ln	%g6,	%o3,	%l6
	fbug	%fcc3,	loop_1722
	sub	%o0,	%i4,	%o2
	membar	0x5D
	brgz	%g7,	loop_1723
loop_1722:
	fbg	%fcc2,	loop_1724
	sra	%g3,	0x05,	%i7
	set	0x2C, %i3
	swapa	[%l7 + %i3] 0x10,	%g4
loop_1723:
	movleu	%xcc,	%o5,	%i6
loop_1724:
	alignaddr	%l1,	%g1,	%l4
	set	0x30, %l5
	prefetcha	[%l7 + %l5] 0x80,	 0x0
	bneg	loop_1725
	edge32ln	%o6,	%i0,	%o7
	set	0x08, %g4
	lda	[%l7 + %g4] 0x19,	%f31
loop_1725:
	taddcctv	%g2,	0x097C,	%l0
	fmovdg	%icc,	%f8,	%f30
	addccc	%o1,	0x1F45,	%i3
	wr	%g0,	0x10,	%asi
	lduha	[%l7 + 0x30] %asi,	%i5
	fmovrdlez	%l5,	%f28,	%f14
	udivcc	%g5,	0x044B,	%i2
	fbe	%fcc3,	loop_1726
	alignaddr	%i1,	%l2,	%o4
	movpos	%xcc,	%g6,	%o3
	mulx	%l6,	%o0,	%o2
loop_1726:
	bpos,pn	%xcc,	loop_1727
	nop
	set	0x21, %i0
	ldstub	[%l7 + %i0],	%g7
	udivx	%g3,	0x1614,	%i4
	wr	%g0,	0x88,	%asi
	ldsba	[%l7 + 0x31] %asi,	%i7
loop_1727:
	edge16l	%g4,	%o5,	%l1
	fnot1s	%f1,	%f9
	be,pt	%icc,	loop_1728
	subcc	%i6,	%l4,	%l3
	smul	%o6,	%g1,	%o7
	fmul8x16au	%f17,	%f8,	%f2
loop_1728:
	tsubcctv	%i0,	0x0C60,	%g2
	srax	%l0,	0x1F,	%o1
	add	%l7,	0x50,	%l6
	wr	%g0,	0x18,	%asi
	lda	[%l6] %asi,	%i3
	casa	[%l6] %asi,	%i3,	%i5
	add	%l7,	0x08,	%l6
	wr	%g0,	0x18,	%asi
	ldxa	[%l6] %asi,	%g5
	casxa	[%l6] %asi,	%g5,	%i2
	tne	%icc,	0x3
	ldub	[%l7 + 0x1E],	%i1
	movcs	%icc,	%l5,	%l2
	srax	%o4,	0x0A,	%o3
	bleu,pt	%icc,	loop_1729
	fbge	%fcc2,	loop_1730
	alignaddr	%g6,	%l6,	%o0
	add	%l7,	0x30,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%g7,	%o2
loop_1729:
	fbug	%fcc0,	loop_1731
loop_1730:
	bneg,a	%xcc,	loop_1732
	ldd	[%l7 + 0x38],	%i4
	fornot1s	%f24,	%f8,	%f24
loop_1731:
	udivcc	%i7,	0x0428,	%g4
loop_1732:
	smul	%o5,	0x0376,	%l1
	fmovdvs	%xcc,	%f29,	%f18
	wr	%g0,	0x2a,	%asi
	stxa	%i6,	[%l7 + 0x38] %asi
	membar	#Sync
	sdivcc	%l4,	0x0CB8,	%g3
	movleu	%xcc,	%l3,	%o6
	alignaddr	%o7,	%g1,	%g2
	fmovscs	%icc,	%f23,	%f13
	movcc	%xcc,	%l0,	%i0
	tvc	%xcc,	0x0
	fcmple16	%f2,	%f4,	%i3
	sra	%i5,	%g5,	%i2
	srl	%o1,	0x1A,	%l5
	wr	%g0,	0x80,	%asi
	ldsba	[%l7 + 0x2E] %asi,	%l2
	alignaddrl	%i1,	%o4,	%o3
	srl	%l6,	%o0,	%g7
	ldstub	[%l7 + 0x66],	%o2
	taddcctv	%i4,	0x1090,	%i7
	bcs,pn	%icc,	loop_1733
	brlez	%g6,	loop_1734
	sethi	0x113B,	%g4
	wr	%g0,	0x2a,	%asi
	stda	%o4,	[%l7 + 0x40] %asi
	membar	#Sync
loop_1733:
	edge8l	%l1,	%l4,	%i6
loop_1734:
	movrgez	%l3,	0x01B,	%o6
	movrlez	%o7,	0x3CB,	%g3
	subccc	%g1,	0x1247,	%l0
	set	0x14, %o1
	lda	[%l7 + %o1] 0x10,	%f16
	fmovrsgez	%i0,	%f29,	%f13
	fmovdvs	%icc,	%f25,	%f8
	taddcctv	%i3,	0x1B3C,	%g2
	fmovdcs	%xcc,	%f20,	%f16
	movrlez	%i5,	0x177,	%i2
	brnz,a	%g5,	loop_1735
	udivcc	%l5,	0x1878,	%l2
	addccc	%o1,	%o4,	%o3
	movpos	%xcc,	%l6,	%o0
loop_1735:
	fmul8x16au	%f22,	%f9,	%f10
	edge32	%g7,	%o2,	%i1
	tvs	%xcc,	0x3
	fmovsne	%icc,	%f31,	%f20
	bge,a,pt	%xcc,	loop_1736
	fmovdvs	%xcc,	%f3,	%f5
	fmovrslz	%i4,	%f7,	%f9
	fcmped	%fcc1,	%f16,	%f4
loop_1736:
	nop
	wr	%g0,	0x19,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	fandnot2	%f22,	%f12,	%f14
	tvc	%xcc,	0x1
	fmovdl	%xcc,	%f30,	%f15
	fnot1	%f0,	%f14
	tge	%xcc,	0x6
	alignaddr	%i7,	%g6,	%g4
	tleu	%xcc,	0x2
	fmovrdlz	%o5,	%f14,	%f24
	andncc	%l1,	%i6,	%l3
	and	%o6,	%o7,	%l4
	fmul8x16	%f16,	%f0,	%f2
	tvc	%xcc,	0x5
	fmovrsgez	%g1,	%f2,	%f5
	ta	%xcc,	0x6
	fmovrdgez	%g3,	%f16,	%f0
	edge32ln	%i0,	%l0,	%i3
	tsubcc	%g2,	%i5,	%i2
	addc	%l5,	0x0A9E,	%g5
	subc	%o1,	%o4,	%o3
	edge16l	%l6,	%l2,	%o0
	edge8	%o2,	%i1,	%g7
	xor	%i7,	%g6,	%g4
	edge8n	%i4,	%l1,	%o5
	sll	%i6,	0x0C,	%o6
	movvs	%xcc,	%o7,	%l3
	fmovsneg	%xcc,	%f17,	%f23
	addcc	%g1,	%g3,	%i0
	movcs	%icc,	%l0,	%l4
	nop
	set	0x70, %i6
	ldd	[%l7 + %i6],	%i2
	orncc	%i5,	0x1E18,	%i2
	taddcctv	%l5,	0x0AF8,	%g2
	tneg	%icc,	0x0
	movcs	%icc,	%o1,	%g5
	wr	%g0,	0x89,	%asi
	ldsha	[%l7 + 0x68] %asi,	%o4
	umul	%l6,	0x1307,	%l2
	edge8n	%o3,	%o0,	%i1
	movgu	%icc,	%g7,	%i7
	popc	%o2,	%g4
	movvc	%icc,	%g6,	%i4
	fnegs	%f3,	%f20
	movle	%xcc,	%o5,	%l1
	ld	[%l7 + 0x18],	%f23
	wr	%g0,	0xf8,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
	brnz	%o6,	loop_1737
	lduh	[%l7 + 0x58],	%o7
	bcs,pt	%icc,	loop_1738
	movn	%xcc,	%l3,	%g1
loop_1737:
	edge32ln	%g3,	%i6,	%i0
	orcc	%l4,	0x0A40,	%i3
loop_1738:
	nop
	set	0x3D, %l6
	lduba	[%l7 + %l6] 0x11,	%l0
	fcmpd	%fcc0,	%f16,	%f4
	tleu	%xcc,	0x1
	fmovsn	%icc,	%f22,	%f11
	subccc	%i2,	0x06F6,	%i5
	mulx	%g2,	%l5,	%o1
	andncc	%g5,	%l6,	%l2
	fornot1	%f18,	%f6,	%f24
	movle	%icc,	%o4,	%o0
	and	%o3,	%i1,	%g7
	te	%xcc,	0x3
	mova	%icc,	%o2,	%i7
	xorcc	%g6,	0x03C9,	%g4
	fmovdneg	%icc,	%f28,	%f31
	xnorcc	%o5,	%l1,	%o6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array8	%o7,	%i4,	%l3
	andncc	%g1,	%g3,	%i0
	sir	0x157A
	fsrc1	%f6,	%f2
	flush	%l7 + 0x2C
	faligndata	%f14,	%f26,	%f0
	srlx	%i6,	%l4,	%i3
	orcc	%i2,	0x183F,	%l0
	andncc	%i5,	%g2,	%o1
	movvc	%xcc,	%l5,	%l6
	array32	%g5,	%o4,	%l2
	ldstub	[%l7 + 0x52],	%o0
	edge32l	%i1,	%g7,	%o2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tcs	%icc,	0x1
	subcc	%o3,	0x00FB,	%i7
	srax	%g4,	0x02,	%g6
	fcmpgt16	%f4,	%f12,	%o5
	edge16	%l1,	%o6,	%o7
	nop
	setx loop_1739, %l0, %l1
	jmpl %l1, %l3
	tgu	%xcc,	0x3
	fmovscc	%xcc,	%f13,	%f22
	fmovrslez	%i4,	%f8,	%f4
loop_1739:
	fnand	%f28,	%f2,	%f24
	addcc	%g1,	0x00EA,	%g3
	tcs	%icc,	0x2
	nop
	setx loop_1740, %l0, %l1
	jmpl %l1, %i6
	movvc	%xcc,	%l4,	%i3
	andcc	%i0,	%l0,	%i5
	edge32l	%g2,	%o1,	%i2
loop_1740:
	sdivcc	%l6,	0x1D8C,	%g5
	wr	%g0,	0x81,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	andncc	%o4,	%l5,	%l2
	mova	%xcc,	%i1,	%o0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tne	%icc,	0x6
	edge16l	%g7,	%o3,	%i7
	ta	%icc,	0x3
	array32	%o2,	%g6,	%o5
	stw	%g4,	[%l7 + 0x24]
	tcc	%icc,	0x7
	tpos	%xcc,	0x5
	umul	%l1,	0x079B,	%o7
	movrlez	%o6,	%l3,	%g1
	ta	%icc,	0x2
	movcs	%xcc,	%g3,	%i4
	fnegs	%f29,	%f19
	movrgez	%i6,	0x340,	%l4
	sir	0x128D
	add	%l7,	0x48,	%l6
	wr	%g0,	0x0c,	%asi
	casxa	[%l6] %asi,	%i3,	%l0
	move	%icc,	%i0,	%g2
	call	loop_1741
	sethi	0x1E6E,	%i5
	fbge	%fcc2,	loop_1742
	fmovscs	%xcc,	%f17,	%f1
loop_1741:
	fpsub16	%f24,	%f4,	%f2
	andn	%i2,	%o1,	%g5
loop_1742:
	nop
	set	0x1A, %i4
	stha	%l6,	[%l7 + %i4] 0x19
	move	%icc,	%o4,	%l2
	orcc	%l5,	0x1080,	%i1
	fmuld8ulx16	%f30,	%f23,	%f4
	xnorcc	%g7,	0x1F0F,	%o3
	ta	%icc,	0x5
	stx	%o0,	[%l7 + 0x60]
	tne	%xcc,	0x2
	sdivx	%i7,	0x1AB8,	%o2
	bn,a,pn	%icc,	loop_1743
	alignaddrl	%o5,	%g4,	%g6
	edge16	%l1,	%o6,	%l3
	fbe	%fcc3,	loop_1744
loop_1743:
	movre	%g1,	%g3,	%o7
	movrgz	%i4,	%i6,	%i3
	tpos	%xcc,	0x7
loop_1744:
	fbo	%fcc1,	loop_1745
	movgu	%xcc,	%l4,	%l0
	fmovscc	%icc,	%f31,	%f30
	andn	%g2,	%i0,	%i2
loop_1745:
	membar	0x77
	bgu,a	loop_1746
	sub	%o1,	0x10CD,	%i5
	mulscc	%l6,	%g5,	%o4
	brlz	%l5,	loop_1747
loop_1746:
	edge16n	%i1,	%g7,	%o3
	set	0x50, %o3
	ldxa	[%l7 + %o3] 0x88,	%o0
loop_1747:
	sethi	0x1CE0,	%i7
	movgu	%icc,	%o2,	%l2
	edge8n	%g4,	%o5,	%g6
	tge	%xcc,	0x4
	srax	%l1,	0x17,	%o6
	fmuld8sux16	%f30,	%f1,	%f8
	brlez,a	%l3,	loop_1748
	movge	%xcc,	%g1,	%g3
	fnot1s	%f13,	%f14
	fblg	%fcc0,	loop_1749
loop_1748:
	bne,a,pt	%icc,	loop_1750
	sir	0x1C89
	edge16	%i4,	%o7,	%i6
loop_1749:
	fmovrsne	%l4,	%f1,	%f4
loop_1750:
	fbn	%fcc0,	loop_1751
	srl	%l0,	0x0C,	%g2
	movvc	%xcc,	%i0,	%i3
	fmovrsgez	%o1,	%f6,	%f9
loop_1751:
	ldub	[%l7 + 0x0B],	%i5
	fcmple16	%f12,	%f26,	%l6
	fornot1s	%f4,	%f2,	%f13
	fands	%f27,	%f13,	%f11
	std	%i2,	[%l7 + 0x78]
	edge32n	%g5,	%l5,	%i1
	orcc	%o4,	%o3,	%o0
	fmul8x16	%f31,	%f26,	%f28
	bge,pn	%xcc,	loop_1752
	prefetch	[%l7 + 0x54],	 0x2
	mova	%icc,	%i7,	%g7
	sra	%o2,	0x06,	%g4
loop_1752:
	ldsb	[%l7 + 0x3D],	%o5
	udiv	%g6,	0x002E,	%l1
	fcmpgt32	%f14,	%f20,	%o6
	tpos	%xcc,	0x4
	fpackfix	%f18,	%f10
	taddcctv	%l2,	0x0AE8,	%g1
	movne	%icc,	%g3,	%i4
	movvs	%xcc,	%l3,	%o7
	udivx	%l4,	0x0735,	%l0
	bshuffle	%f22,	%f10,	%f0
	movrne	%i6,	0x37B,	%i0
	tsubcc	%g2,	0x14FA,	%i3
	taddcc	%o1,	0x09DB,	%i5
	fnors	%f16,	%f27,	%f23
	xnorcc	%l6,	0x0DCA,	%g5
	tn	%icc,	0x2
	prefetch	[%l7 + 0x0C],	 0x0
	array16	%i2,	%l5,	%o4
	call	loop_1753
	edge16l	%o3,	%o0,	%i1
	prefetch	[%l7 + 0x74],	 0x0
	subcc	%i7,	0x1BBF,	%o2
loop_1753:
	tle	%xcc,	0x5
	fnegd	%f28,	%f16
	edge8	%g4,	%g7,	%o5
	fnegs	%f12,	%f27
	set	0x0C, %l0
	ldsba	[%l7 + %l0] 0x10,	%l1
	edge8l	%g6,	%l2,	%g1
	umulcc	%o6,	0x06AD,	%g3
	array32	%i4,	%o7,	%l4
	fbue	%fcc0,	loop_1754
	be,a,pn	%xcc,	loop_1755
	sll	%l0,	0x0F,	%i6
	fmovrdlez	%i0,	%f0,	%f2
loop_1754:
	srax	%g2,	%i3,	%l3
loop_1755:
	fmul8sux16	%f6,	%f6,	%f22
	udivx	%i5,	0x080D,	%o1
	movge	%xcc,	%g5,	%i2
	udivcc	%l5,	0x08CD,	%o4
	movrlz	%l6,	0x1CB,	%o3
	sdiv	%i1,	0x09C7,	%i7
	udivcc	%o0,	0x0276,	%g4
	fmovdcs	%xcc,	%f23,	%f6
	subccc	%o2,	%o5,	%g7
	orncc	%l1,	0x0CF9,	%l2
	edge16ln	%g6,	%g1,	%o6
	sdiv	%i4,	0x1237,	%o7
	movcs	%icc,	%g3,	%l4
	fors	%f19,	%f8,	%f19
	movcs	%xcc,	%i6,	%i0
	edge16ln	%g2,	%i3,	%l3
	fba,a	%fcc0,	loop_1756
	fpsub16	%f14,	%f0,	%f18
	umulcc	%i5,	%o1,	%g5
	fmovrse	%l0,	%f29,	%f7
loop_1756:
	te	%xcc,	0x7
	movgu	%icc,	%i2,	%l5
	membar	#Sync
	set	0x40, %i2
	ldda	[%l7 + %i2] 0x17,	%f16
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8ln	%l6,	%o3,	%o4
	addccc	%i1,	%o0,	%i7
	membar	0x0C
	fmovsn	%icc,	%f5,	%f21
	lduh	[%l7 + 0x4E],	%o2
	tge	%xcc,	0x3
	fcmple32	%f18,	%f6,	%o5
	addccc	%g4,	%g7,	%l2
	fbul	%fcc0,	loop_1757
	edge32n	%g6,	%g1,	%l1
	fba	%fcc2,	loop_1758
	edge8ln	%o6,	%o7,	%i4
loop_1757:
	xnor	%l4,	0x0C95,	%g3
	sir	0x0B33
loop_1758:
	fpsub32s	%f22,	%f31,	%f16
	andcc	%i6,	%g2,	%i0
	tsubcc	%l3,	0x1BDF,	%i3
	andncc	%o1,	%i5,	%l0
	addccc	%i2,	0x0527,	%g5
	fcmpd	%fcc1,	%f10,	%f20
	alignaddrl	%l5,	%o3,	%o4
	fbne	%fcc0,	loop_1759
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
	mulx	%l6,	%i1,	%i7
	edge8	%o0,	%o5,	%o2
loop_1759:
	xor	%g4,	%g7,	%l2
loop_1760:
	fone	%f28
	ble	%xcc,	loop_1761
	fmovrsgz	%g1,	%f16,	%f14
	membar	0x40
	brlz	%g6,	loop_1762
loop_1761:
	nop
	set	0x13, %o6
	stb	%l1,	[%l7 + %o6]
	umul	%o6,	0x144D,	%o7
	edge8	%l4,	%i4,	%g3
loop_1762:
	add	%g2,	0x1BA2,	%i6
	bg	%icc,	loop_1763
	umul	%l3,	%i0,	%o1
	bvc,pn	%icc,	loop_1764
	tcc	%xcc,	0x4
loop_1763:
	fmovdn	%xcc,	%f4,	%f0
	tsubcctv	%i3,	%i5,	%l0
loop_1764:
	sub	%i2,	%g5,	%l5
	be,a	%icc,	loop_1765
	sub	%o3,	%l6,	%o4
	stbar
	movle	%xcc,	%i7,	%o0
loop_1765:
	fmovdne	%icc,	%f2,	%f20
	movvs	%xcc,	%o5,	%i1
	ldsh	[%l7 + 0x44],	%o2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovscs	%icc,	%f3,	%f18
	call	loop_1766
	fbule	%fcc3,	loop_1767
	mova	%icc,	%g4,	%g7
	or	%l2,	%g6,	%l1
loop_1766:
	fbue	%fcc2,	loop_1768
loop_1767:
	orcc	%o6,	0x0220,	%g1
	xor	%l4,	%i4,	%g3
	umulcc	%g2,	%o7,	%i6
loop_1768:
	mova	%xcc,	%i0,	%o1
	ldsb	[%l7 + 0x3E],	%l3
	fbu,a	%fcc0,	loop_1769
	tpos	%icc,	0x2
	fmovscc	%icc,	%f6,	%f3
	move	%xcc,	%i3,	%i5
loop_1769:
	fmovsl	%icc,	%f10,	%f2
	movrne	%i2,	%g5,	%l0
	tcc	%xcc,	0x2
	fnand	%f8,	%f22,	%f8
	smulcc	%l5,	0x16C6,	%l6
	fmovdl	%xcc,	%f8,	%f22
	fmovsneg	%xcc,	%f27,	%f12
	tsubcc	%o3,	0x075B,	%o4
	tne	%xcc,	0x6
	movvc	%xcc,	%i7,	%o0
	edge8n	%i1,	%o5,	%o2
	orncc	%g4,	0x0EA6,	%l2
	wr	%g0,	0x10,	%asi
	lduha	[%l7 + 0x4C] %asi,	%g6
	edge16l	%l1,	%o6,	%g7
	bvs	loop_1770
	prefetch	[%l7 + 0x08],	 0x1
	bgu,a	loop_1771
	fcmpne16	%f28,	%f16,	%g1
loop_1770:
	movne	%xcc,	%l4,	%g3
	fnot1	%f16,	%f8
loop_1771:
	fmovdpos	%xcc,	%f12,	%f13
	sethi	0x1642,	%g2
	orn	%o7,	0x09F6,	%i6
	edge8n	%i4,	%i0,	%o1
	bl	loop_1772
	fsrc2	%f30,	%f8
	xnorcc	%l3,	%i5,	%i2
	movg	%icc,	%g5,	%i3
loop_1772:
	fmovrdgz	%l5,	%f30,	%f30
	ta	%xcc,	0x2
	tle	%xcc,	0x0
	wr	%g0,	0x18,	%asi
	stda	%i6,	[%l7 + 0x68] %asi
	set	0x0C, %l1
	stha	%o3,	[%l7 + %l1] 0xe2
	membar	#Sync
	tvc	%icc,	0x5
	fandnot1s	%f12,	%f26,	%f25
	sdiv	%l0,	0x168B,	%i7
	fmovsvc	%icc,	%f18,	%f22
	movleu	%icc,	%o4,	%o0
	ldstub	[%l7 + 0x10],	%i1
	tleu	%xcc,	0x4
	stb	%o5,	[%l7 + 0x57]
	array32	%g4,	%o2,	%g6
	udivcc	%l2,	0x1F84,	%o6
	sir	0x0397
	movneg	%icc,	%l1,	%g7
	fcmpgt16	%f8,	%f14,	%g1
	movl	%xcc,	%l4,	%g2
	lduw	[%l7 + 0x2C],	%g3
	fmovda	%xcc,	%f20,	%f18
	edge16n	%i6,	%o7,	%i4
	faligndata	%f28,	%f22,	%f8
	umulcc	%i0,	0x05E7,	%l3
	fmovsneg	%xcc,	%f1,	%f25
	alignaddr	%o1,	%i2,	%g5
	edge16n	%i3,	%l5,	%l6
	fnot1	%f22,	%f26
	fbge,a	%fcc2,	loop_1773
	fbl,a	%fcc2,	loop_1774
	tle	%xcc,	0x1
	sllx	%o3,	%l0,	%i7
loop_1773:
	tpos	%xcc,	0x5
loop_1774:
	tsubcctv	%o4,	%o0,	%i5
	xor	%i1,	%o5,	%g4
	fmul8x16au	%f1,	%f5,	%f8
	movcc	%icc,	%o2,	%g6
	ldd	[%l7 + 0x48],	%l2
	orcc	%l1,	0x1FC9,	%g7
	tn	%icc,	0x5
	edge32l	%g1,	%o6,	%l4
	movcc	%icc,	%g3,	%g2
	srlx	%i6,	0x00,	%i4
	xor	%i0,	0x0451,	%o7
	fpadd32	%f10,	%f10,	%f2
	movgu	%xcc,	%o1,	%l3
	set	0x4C, %o2
	sta	%f12,	[%l7 + %o2] 0x89
	xorcc	%g5,	%i2,	%l5
	movvs	%xcc,	%l6,	%o3
	edge32ln	%l0,	%i7,	%o4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpadd32	%f28,	%f4,	%f12
	movge	%xcc,	%o0,	%i3
	orn	%i1,	0x1760,	%i5
	tpos	%icc,	0x6
	edge16	%g4,	%o5,	%o2
	fcmpeq32	%f14,	%f28,	%g6
	movge	%xcc,	%l1,	%l2
	array32	%g1,	%g7,	%l4
	set	0x60, %g2
	stda	%o6,	[%l7 + %g2] 0x04
	membar	0x52
	bcs,pn	%xcc,	loop_1775
	fnot1	%f28,	%f0
	fnegs	%f31,	%f20
	alignaddrl	%g3,	%g2,	%i4
loop_1775:
	orn	%i0,	%i6,	%o1
	brz,a	%o7,	loop_1776
	edge16ln	%l3,	%i2,	%l5
	membar	0x46
	edge8l	%l6,	%g5,	%l0
loop_1776:
	edge16	%o3,	%o4,	%o0
	tcc	%xcc,	0x1
	and	%i7,	%i3,	%i1
	set	0x64, %i7
	stha	%i5,	[%l7 + %i7] 0x81
	subccc	%o5,	0x0BBF,	%o2
	srax	%g6,	0x03,	%g4
	fcmpeq32	%f26,	%f6,	%l1
	fnegd	%f20,	%f12
	fbo	%fcc1,	loop_1777
	mova	%icc,	%g1,	%g7
	fandnot1	%f30,	%f20,	%f18
	movcs	%xcc,	%l4,	%o6
loop_1777:
	fmovsgu	%icc,	%f8,	%f6
	fbl,a	%fcc2,	loop_1778
	movl	%icc,	%g3,	%l2
	bleu,a	loop_1779
	te	%xcc,	0x7
loop_1778:
	fbo	%fcc2,	loop_1780
	fcmpes	%fcc2,	%f24,	%f28
loop_1779:
	srlx	%i4,	0x16,	%i0
	fmovsneg	%xcc,	%f6,	%f6
loop_1780:
	be,a	loop_1781
	stw	%i6,	[%l7 + 0x40]
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	brlez	%g2,	loop_1782
loop_1781:
	tsubcctv	%o1,	0x1B76,	%l3
	sra	%i2,	%l5,	%l6
	nop
	set	0x30, %o4
	ldd	[%l7 + %o4],	%f12
loop_1782:
	movne	%xcc,	%o7,	%l0
	fpmerge	%f15,	%f16,	%f2
	fcmpne16	%f14,	%f8,	%g5
	fnegs	%f7,	%f8
	or	%o3,	0x149B,	%o0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fandnot2s	%f20,	%f27,	%f21
	orncc	%o4,	%i7,	%i3
	edge16n	%i5,	%i1,	%o5
	brlez,a	%o2,	loop_1783
	or	%g6,	%l1,	%g4
	brz	%g7,	loop_1784
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1783:
	fcmpeq32	%f28,	%f26,	%g1
	xnor	%o6,	%g3,	%l2
loop_1784:
	orncc	%l4,	0x1AE0,	%i0
	array8	%i6,	%g2,	%i4
	smul	%o1,	0x0905,	%i2
	brnz	%l5,	loop_1785
	bvc,a	loop_1786
	bvs,a	loop_1787
	subccc	%l3,	0x1CD2,	%o7
loop_1785:
	movrlez	%l0,	%g5,	%o3
loop_1786:
	fmovrsne	%o0,	%f19,	%f30
loop_1787:
	movle	%icc,	%o4,	%l6
	orcc	%i7,	0x058D,	%i3
	and	%i1,	0x1812,	%o5
	movneg	%icc,	%o2,	%i5
	fnot2s	%f19,	%f16
	fcmpeq32	%f20,	%f22,	%g6
	set	0x62, %o5
	ldsha	[%l7 + %o5] 0x80,	%l1
	movne	%xcc,	%g4,	%g7
	srlx	%o6,	0x0C,	%g3
	fmovrdlz	%l2,	%f30,	%f14
	umul	%l4,	0x0702,	%i0
	fors	%f31,	%f0,	%f1
	fands	%f22,	%f18,	%f29
	ldstub	[%l7 + 0x4F],	%g1
	fandnot2s	%f19,	%f21,	%f14
	movge	%xcc,	%g2,	%i4
	movgu	%icc,	%i6,	%i2
	movrlz	%o1,	%l3,	%l5
	udivx	%l0,	0x16C4,	%o7
	fmovsa	%icc,	%f5,	%f13
	tvc	%xcc,	0x0
	fabss	%f21,	%f30
	srlx	%o3,	%g5,	%o4
	bshuffle	%f24,	%f22,	%f8
	fnot2s	%f7,	%f14
	smulcc	%o0,	0x04C1,	%i7
	andcc	%l6,	%i3,	%i1
	andn	%o5,	%i5,	%o2
	array16	%g6,	%l1,	%g7
	xnorcc	%o6,	0x076E,	%g3
	edge16n	%l2,	%g4,	%i0
	set	0x58, %o0
	ldsba	[%l7 + %o0] 0x89,	%l4
	movle	%xcc,	%g1,	%g2
	fabss	%f31,	%f2
	bcc	loop_1788
	edge8n	%i4,	%i6,	%o1
	taddcctv	%i2,	%l3,	%l0
	fmovdvs	%icc,	%f13,	%f16
loop_1788:
	fmovrslez	%l5,	%f7,	%f27
	movgu	%icc,	%o7,	%o3
	edge16l	%g5,	%o4,	%o0
	bne,a,pn	%xcc,	loop_1789
	nop
	set	0x20, %l3
	lduh	[%l7 + %l3],	%l6
	bne,a	%xcc,	loop_1790
	movpos	%icc,	%i7,	%i1
loop_1789:
	edge32	%o5,	%i3,	%o2
	fmovrslz	%g6,	%f18,	%f16
loop_1790:
	movn	%icc,	%l1,	%i5
	fpadd32s	%f23,	%f3,	%f30
	sdiv	%o6,	0x0F3F,	%g7
	subcc	%l2,	%g4,	%i0
	andcc	%g3,	0x0071,	%g1
	bleu	loop_1791
	movre	%g2,	%l4,	%i6
	movrlez	%i4,	%i2,	%l3
	fmovsa	%xcc,	%f10,	%f22
loop_1791:
	edge32	%o1,	%l5,	%l0
	std	%o2,	[%l7 + 0x08]
	edge8n	%o7,	%g5,	%o4
	movge	%icc,	%o0,	%i7
	subc	%i1,	%l6,	%o5
	sllx	%i3,	%o2,	%l1
	tsubcctv	%g6,	%i5,	%g7
	or	%l2,	%o6,	%i0
	movl	%xcc,	%g3,	%g4
	call	loop_1792
	flush	%l7 + 0x4C
	fcmpgt32	%f8,	%f12,	%g2
	fbuge,a	%fcc0,	loop_1793
loop_1792:
	brgez,a	%l4,	loop_1794
	fbn	%fcc0,	loop_1795
	ld	[%l7 + 0x30],	%f16
loop_1793:
	movgu	%xcc,	%g1,	%i4
loop_1794:
	taddcctv	%i6,	0x0E2A,	%l3
loop_1795:
	array32	%o1,	%i2,	%l5
	taddcc	%l0,	0x1EBE,	%o3
	brgez	%o7,	loop_1796
	addcc	%o4,	0x0141,	%g5
	wr	%g0,	0x2c,	%asi
	ldda	[%l7 + 0x50] %asi,	%i6
loop_1796:
	edge32n	%i1,	%l6,	%o5
	movcs	%icc,	%o0,	%i3
	movrne	%o2,	%l1,	%g6
	fmovrsne	%i5,	%f28,	%f30
	fba,a	%fcc1,	loop_1797
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldub	[%l7 + 0x4C],	%l2
	tpos	%icc,	0x5
loop_1797:
	nop
	wr	%g0,	0x89,	%asi
	swapa	[%l7 + 0x08] %asi,	%g7
	fpack32	%f10,	%f26,	%f0
	fmul8x16al	%f9,	%f14,	%f18
	set	0x70, %o7
	ldda	[%l7 + %o7] 0x2a,	%o6
	sdiv	%g3,	0x0181,	%i0
	movrgez	%g4,	0x15B,	%l4
	movrgez	%g1,	%g2,	%i6
	mova	%xcc,	%i4,	%o1
	bl,a	%icc,	loop_1798
	tvc	%xcc,	0x2
	wr	%g0,	0xe3,	%asi
	stha	%i2,	[%l7 + 0x5C] %asi
	membar	#Sync
loop_1798:
	tsubcctv	%l5,	%l3,	%l0
	wr	%g0,	0x23,	%asi
	stba	%o3,	[%l7 + 0x53] %asi
	membar	#Sync
	xorcc	%o7,	%g5,	%i7
	edge8ln	%i1,	%l6,	%o4
	edge16	%o0,	%i3,	%o5
	fpack16	%f26,	%f4
	bleu,a,pt	%icc,	loop_1799
	tpos	%xcc,	0x3
	edge32ln	%o2,	%g6,	%l1
	fpadd16	%f26,	%f20,	%f26
loop_1799:
	edge32ln	%l2,	%g7,	%o6
	stx	%i5,	[%l7 + 0x10]
	smul	%g3,	%g4,	%i0
	ba,pn	%icc,	loop_1800
	sdivx	%l4,	0x0798,	%g2
	bl,a	%xcc,	loop_1801
	bshuffle	%f2,	%f22,	%f24
loop_1800:
	edge32	%g1,	%i4,	%o1
	tne	%icc,	0x0
loop_1801:
	smulcc	%i6,	0x16BA,	%i2
	bge,a	%xcc,	loop_1802
	call	loop_1803
	edge8ln	%l5,	%l3,	%o3
	xnorcc	%o7,	0x1682,	%l0
loop_1802:
	and	%i7,	0x1926,	%g5
loop_1803:
	taddcctv	%i1,	0x020F,	%l6
	fandnot1s	%f7,	%f13,	%f23
	add	%o0,	%o4,	%o5
	andncc	%o2,	%g6,	%l1
	fandnot2	%f14,	%f14,	%f30
	srax	%l2,	0x14,	%g7
	movleu	%xcc,	%i3,	%i5
	fmovrdne	%g3,	%f0,	%f26
	fsrc1	%f24,	%f28
	ld	[%l7 + 0x20],	%f9
	wr	%g0,	0x2a,	%asi
	stba	%o6,	[%l7 + 0x19] %asi
	membar	#Sync
	srlx	%i0,	0x07,	%g4
	udiv	%g2,	0x021A,	%l4
	fpadd32s	%f8,	%f15,	%f24
	tne	%xcc,	0x3
	taddcctv	%g1,	0x1C50,	%o1
	edge16l	%i4,	%i6,	%i2
	bvs,a,pn	%xcc,	loop_1804
	fands	%f19,	%f29,	%f13
	umul	%l3,	0x0F79,	%l5
	brz,a	%o7,	loop_1805
loop_1804:
	fcmpne16	%f26,	%f16,	%o3
	bneg,a	%xcc,	loop_1806
	movre	%i7,	0x0E3,	%l0
loop_1805:
	nop
	set	0x64, %g7
	ldsba	[%l7 + %g7] 0x14,	%i1
loop_1806:
	taddcc	%g5,	0x1A78,	%o0
	fnot1	%f26,	%f8
	fzeros	%f6
	stx	%l6,	[%l7 + 0x48]
	te	%icc,	0x1
	edge8n	%o5,	%o2,	%g6
	movl	%xcc,	%l1,	%o4
	fmovsa	%icc,	%f23,	%f20
	alignaddr	%l2,	%g7,	%i5
	addccc	%g3,	%o6,	%i3
	fble,a	%fcc2,	loop_1807
	subcc	%i0,	%g2,	%g4
	edge8l	%l4,	%o1,	%g1
	andn	%i6,	%i4,	%l3
loop_1807:
	nop
	add	%l7,	0x38,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] %asi,	%l5,	%o7
	smulcc	%o3,	0x0C58,	%i7
	fand	%f0,	%f14,	%f4
	fmovrdlez	%i2,	%f12,	%f30
	sll	%i1,	%g5,	%l0
	fmovdn	%icc,	%f18,	%f6
	fnegs	%f30,	%f27
	movrgez	%o0,	%o5,	%o2
	nop
	set	0x60, %l2
	std	%f2,	[%l7 + %l2]
	fmovdg	%icc,	%f28,	%f12
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stx	%g6,	[%l7 + 0x08]
	bl,a,pt	%icc,	loop_1808
	orn	%l6,	%o4,	%l2
	movrgez	%g7,	%i5,	%l1
	edge16l	%g3,	%i3,	%o6
loop_1808:
	sdivx	%i0,	0x0D83,	%g4
	addc	%l4,	%g2,	%o1
	fble	%fcc3,	loop_1809
	movcs	%xcc,	%i6,	%g1
	tle	%xcc,	0x0
	tg	%xcc,	0x7
loop_1809:
	sra	%l3,	%l5,	%o7
	tpos	%icc,	0x1
	fbne	%fcc0,	loop_1810
	fmovdn	%xcc,	%f20,	%f3
	bn,a	loop_1811
	edge8ln	%i4,	%o3,	%i2
loop_1810:
	fzeros	%f10
	add	%i7,	0x0934,	%g5
loop_1811:
	movcs	%xcc,	%l0,	%i1
	fbu,a	%fcc3,	loop_1812
	alignaddrl	%o5,	%o0,	%g6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fzeros	%f19
loop_1812:
	fnot2s	%f1,	%f5
	fmovdne	%xcc,	%f7,	%f25
	addc	%l6,	0x12EF,	%o4
	movge	%icc,	%o2,	%l2
	movre	%i5,	%g7,	%g3
	movvs	%icc,	%l1,	%o6
	movvs	%icc,	%i3,	%i0
	movcs	%icc,	%l4,	%g2
	smulcc	%g4,	%i6,	%o1
	srlx	%g1,	%l3,	%l5
	subccc	%o7,	%i4,	%i2
	brnz	%i7,	loop_1813
	umulcc	%o3,	%g5,	%l0
	andn	%o5,	0x0E3C,	%o0
	fmovdne	%icc,	%f24,	%f23
loop_1813:
	fpack16	%f22,	%f9
	ldd	[%l7 + 0x78],	%i0
	subccc	%g6,	%l6,	%o2
	wr	%g0,	0x81,	%asi
	lda	[%l7 + 0x68] %asi,	%f8
	sdivx	%l2,	0x04C7,	%i5
	umul	%g7,	0x198E,	%g3
	fsrc2	%f16,	%f18
	movle	%xcc,	%o4,	%l1
	orncc	%o6,	0x1561,	%i0
	edge8n	%l4,	%g2,	%g4
	edge16l	%i6,	%i3,	%g1
	brz,a	%o1,	loop_1814
	fmul8x16al	%f10,	%f6,	%f8
	udiv	%l5,	0x04AE,	%o7
	ldstub	[%l7 + 0x43],	%l3
loop_1814:
	tcc	%xcc,	0x6
	edge8n	%i2,	%i4,	%i7
	fnot2s	%f26,	%f18
	sra	%o3,	0x10,	%g5
	tne	%icc,	0x6
	array8	%l0,	%o5,	%i1
	fxnor	%f14,	%f18,	%f26
	fba	%fcc1,	loop_1815
	subcc	%o0,	%l6,	%g6
	fnegd	%f24,	%f16
	sdivcc	%o2,	0x18B0,	%i5
loop_1815:
	tle	%icc,	0x2
	fandnot1	%f8,	%f20,	%f20
	fmovdne	%xcc,	%f18,	%f3
	orn	%g7,	%l2,	%o4
	swap	[%l7 + 0x3C],	%l1
	umul	%g3,	0x0524,	%o6
	fmovsg	%icc,	%f24,	%f26
	stb	%i0,	[%l7 + 0x21]
	movrgez	%l4,	0x19D,	%g2
	sll	%g4,	%i6,	%g1
	std	%f24,	[%l7 + 0x70]
	tn	%xcc,	0x3
	add	%o1,	0x088D,	%l5
	edge16ln	%o7,	%i3,	%i2
	sir	0x0CDA
	umul	%l3,	%i7,	%o3
	std	%f24,	[%l7 + 0x18]
	wr	%g0,	0x2b,	%asi
	stba	%g5,	[%l7 + 0x5E] %asi
	membar	#Sync
	orncc	%l0,	%o5,	%i1
	movne	%icc,	%o0,	%l6
	fpadd16	%f6,	%f14,	%f30
	fbg,a	%fcc2,	loop_1816
	tg	%icc,	0x6
	andn	%g6,	%o2,	%i4
	wr	%g0,	0x89,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
loop_1816:
	fxnors	%f10,	%f24,	%f30
	tge	%xcc,	0x0
	addc	%g7,	0x043B,	%l2
	edge16n	%i5,	%l1,	%o4
	andcc	%o6,	0x1466,	%i0
	xor	%g3,	%g2,	%g4
	tl	%xcc,	0x3
	set	0x60, %l4
	sta	%f1,	[%l7 + %l4] 0x14
	fmovsvs	%xcc,	%f30,	%f25
	fbo	%fcc0,	loop_1817
	tleu	%xcc,	0x0
	fzeros	%f10
	fbul,a	%fcc3,	loop_1818
loop_1817:
	smul	%i6,	0x1B0E,	%l4
	sethi	0x1A18,	%o1
	movrne	%l5,	0x351,	%o7
loop_1818:
	tn	%xcc,	0x5
	set	0x6A, %i1
	ldstuba	[%l7 + %i1] 0x89,	%g1
	set	0x69, %g6
	lduba	[%l7 + %g6] 0x19,	%i2
	smulcc	%l3,	%i3,	%i7
	sllx	%g5,	0x07,	%l0
	tleu	%icc,	0x5
	mulx	%o3,	0x16FB,	%i1
	fbu	%fcc0,	loop_1819
	sdivx	%o0,	0x009C,	%l6
	andn	%o5,	%g6,	%i4
	stx	%g7,	[%l7 + 0x20]
loop_1819:
	alignaddr	%o2,	%l2,	%i5
	ldsw	[%l7 + 0x24],	%o4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mulx	%l1,	0x1936,	%i0
	array16	%g3,	%o6,	%g4
	fcmpgt16	%f28,	%f26,	%g2
	lduh	[%l7 + 0x18],	%i6
	edge8ln	%o1,	%l4,	%l5
	sir	0x1BBB
	sll	%g1,	0x16,	%i2
	udiv	%l3,	0x1C48,	%o7
	tle	%icc,	0x1
	tleu	%xcc,	0x0
	fpack16	%f30,	%f18
	edge16l	%i3,	%g5,	%i7
	bge,pt	%icc,	loop_1820
	movrlz	%o3,	%i1,	%o0
	addcc	%l0,	0x10EE,	%o5
	tcs	%xcc,	0x3
loop_1820:
	sll	%g6,	%i4,	%g7
	tgu	%xcc,	0x2
	bvc	%icc,	loop_1821
	fmovdne	%xcc,	%f17,	%f24
	sdiv	%o2,	0x03C5,	%l6
	tge	%icc,	0x1
loop_1821:
	bvc,a	%xcc,	loop_1822
	movvs	%xcc,	%i5,	%o4
	popc	%l1,	%i0
	addc	%g3,	%l2,	%g4
loop_1822:
	bgu,pn	%xcc,	loop_1823
	andn	%g2,	0x0658,	%o6
	alignaddr	%i6,	%l4,	%l5
	fmovdcc	%xcc,	%f26,	%f4
loop_1823:
	flush	%l7 + 0x48
	fmovdgu	%icc,	%f25,	%f18
	movl	%xcc,	%g1,	%o1
	movg	%xcc,	%i2,	%l3
	movgu	%icc,	%i3,	%g5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movvc	%xcc,	%i7,	%o3
	brlez,a	%i1,	loop_1824
	array16	%o7,	%o0,	%o5
	bneg,a,pt	%icc,	loop_1825
	tcs	%icc,	0x0
loop_1824:
	fmovdpos	%xcc,	%f27,	%f6
	xorcc	%l0,	%g6,	%i4
loop_1825:
	umul	%g7,	%l6,	%i5
	sethi	0x196B,	%o4
	fmovsl	%xcc,	%f25,	%f25
	sll	%o2,	0x19,	%l1
	movne	%xcc,	%g3,	%i0
	umulcc	%l2,	0x1D3B,	%g2
	fmovdcc	%xcc,	%f17,	%f19
	movrlez	%g4,	0x07E,	%o6
	sub	%i6,	%l5,	%g1
	udivcc	%l4,	0x1760,	%o1
	subcc	%i2,	%i3,	%l3
	tleu	%icc,	0x4
	ldd	[%l7 + 0x28],	%f24
	srax	%g5,	%i7,	%o3
	movge	%xcc,	%o7,	%i1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movneg	%xcc,	%o5,	%l0
	tge	%icc,	0x7
	srax	%o0,	%i4,	%g7
	fexpand	%f2,	%f16
	wr	%g0,	0x81,	%asi
	ldstuba	[%l7 + 0x73] %asi,	%g6
	fnand	%f30,	%f18,	%f14
	sethi	0x1A78,	%l6
	wr	%g0,	0x89,	%asi
	stba	%i5,	[%l7 + 0x3F] %asi
	array16	%o4,	%l1,	%g3
	xor	%i0,	0x0725,	%o2
	edge8n	%g2,	%l2,	%g4
	sir	0x1FFC
	bcs,pt	%icc,	loop_1826
	smulcc	%o6,	%l5,	%i6
	set	0x10, %g5
	ldswa	[%l7 + %g5] 0x15,	%g1
loop_1826:
	tcs	%icc,	0x0
	tpos	%icc,	0x1
	call	loop_1827
	stb	%o1,	[%l7 + 0x7A]
	taddcc	%l4,	0x1719,	%i3
	swap	[%l7 + 0x7C],	%i2
loop_1827:
	mova	%xcc,	%l3,	%i7
	wr	%g0,	0x89,	%asi
	lduba	[%l7 + 0x59] %asi,	%g5
	edge32l	%o7,	%i1,	%o3
	array16	%l0,	%o0,	%o5
	nop
	setx loop_1828, %l0, %l1
	jmpl %l1, %i4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmpne32	%f22,	%f16,	%g6
	wr	%g0,	0x10,	%asi
	stba	%g7,	[%l7 + 0x5A] %asi
loop_1828:
	sll	%l6,	0x03,	%o4
	fornot1s	%f17,	%f20,	%f9
	edge16l	%l1,	%i5,	%i0
	addcc	%g3,	0x1371,	%g2
	edge32	%o2,	%g4,	%o6
	fbne	%fcc3,	loop_1829
	fmul8x16al	%f29,	%f12,	%f6
	tleu	%xcc,	0x2
	fpsub32	%f30,	%f14,	%f14
loop_1829:
	subc	%l2,	0x15F1,	%i6
	movpos	%icc,	%g1,	%o1
	xnorcc	%l5,	%l4,	%i2
	movl	%xcc,	%l3,	%i3
	sub	%i7,	%g5,	%o7
	bpos,a,pt	%xcc,	loop_1830
	edge8ln	%o3,	%l0,	%i1
	add	%l7,	0x68,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%o0
	casxa	[%l6] 0x88,	%o0,	%i4
loop_1830:
	orn	%o5,	0x0C3C,	%g7
	fandnot1s	%f30,	%f22,	%f17
	umul	%g6,	0x1CF4,	%l6
	xnorcc	%o4,	%i5,	%l1
	wr	%g0,	0x04,	%asi
	ldsba	[%l7 + 0x44] %asi,	%i0
	movpos	%xcc,	%g3,	%g2
	tgu	%icc,	0x2
	edge8l	%g4,	%o6,	%o2
	and	%l2,	%g1,	%i6
	sdivx	%o1,	0x1B88,	%l4
	add	%l7,	0x30,	%l6
	wr	%g0,	0x19,	%asi
	casxa	[%l6] 0x19,	%l5,	%i2
	tne	%icc,	0x7
	fandnot2	%f0,	%f2,	%f28
	edge32	%l3,	%i3,	%g5
	set	0x6C, %g3
	stwa	%o7,	[%l7 + %g3] 0x11
	sll	%i7,	0x19,	%o3
	sdivx	%i1,	0x09C4,	%o0
	brlz	%i4,	loop_1831
	swap	[%l7 + 0x28],	%o5
	fbl	%fcc0,	loop_1832
	fandnot1	%f16,	%f12,	%f18
loop_1831:
	fmuld8ulx16	%f12,	%f16,	%f22
	andcc	%l0,	%g6,	%g7
loop_1832:
	edge16ln	%o4,	%l6,	%l1
	fnand	%f10,	%f0,	%f0
	fandnot1	%f8,	%f22,	%f4
	sethi	0x1193,	%i0
	fpsub16	%f2,	%f10,	%f20
	fmovdneg	%xcc,	%f15,	%f18
	nop
	set	0x52, %g1
	ldsh	[%l7 + %g1],	%g3
	tne	%xcc,	0x3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tvc	%xcc,	0x2
	fones	%f11
	sll	%g2,	%g4,	%o6
	popc	0x140C,	%o2
	fbul,a	%fcc3,	loop_1833
	fmovs	%f15,	%f10
	tneg	%icc,	0x7
	taddcc	%l2,	%g1,	%i6
loop_1833:
	edge16n	%o1,	%l4,	%i5
	tge	%xcc,	0x6
	sir	0x0331
	ta	%xcc,	0x3
	wr	%g0,	0x27,	%asi
	stwa	%i2,	[%l7 + 0x34] %asi
	membar	#Sync
	movpos	%icc,	%l5,	%l3
	tn	%icc,	0x6
	move	%xcc,	%g5,	%i3
	xnorcc	%i7,	%o7,	%i1
	fba,a	%fcc1,	loop_1834
	tcs	%icc,	0x3
	bcs,pt	%xcc,	loop_1835
	tle	%icc,	0x3
loop_1834:
	fmovsneg	%xcc,	%f18,	%f10
	fnegs	%f14,	%f17
loop_1835:
	tne	%icc,	0x5
	fmovsgu	%xcc,	%f11,	%f20
	xor	%o0,	0x02FB,	%o3
	edge32l	%i4,	%l0,	%o5
	edge16n	%g7,	%o4,	%l6
	edge32l	%l1,	%i0,	%g3
	udivx	%g6,	0x17D6,	%g2
	umul	%o6,	%o2,	%l2
	sdivx	%g1,	0x0BC2,	%i6
	udivx	%g4,	0x14BA,	%l4
	brgez	%o1,	loop_1836
	subcc	%i2,	%l5,	%l3
	fpadd16s	%f30,	%f16,	%f25
	set	0x40, %i5
	ldsba	[%l7 + %i5] 0x14,	%i5
loop_1836:
	fcmped	%fcc1,	%f0,	%f30
	move	%icc,	%i3,	%i7
	bne,a,pt	%icc,	loop_1837
	mova	%xcc,	%o7,	%g5
	movle	%xcc,	%o0,	%o3
	array32	%i1,	%i4,	%o5
loop_1837:
	array32	%l0,	%g7,	%l6
	tsubcctv	%o4,	0x1B0D,	%i0
	fands	%f1,	%f13,	%f11
	bn,pn	%xcc,	loop_1838
	mulscc	%l1,	0x14DA,	%g6
	movrgz	%g2,	%o6,	%g3
	tsubcctv	%l2,	0x00CD,	%g1
loop_1838:
	nop
	wr	%g0,	0x89,	%asi
	ldswa	[%l7 + 0x38] %asi,	%o2
	ldsh	[%l7 + 0x74],	%i6
	fba,a	%fcc0,	loop_1839
	tle	%icc,	0x2
	sdivx	%g4,	0x1FF1,	%o1
	andcc	%i2,	0x098A,	%l5
loop_1839:
	nop
	set	0x70, %l5
	ldda	[%l7 + %l5] 0xe2,	%l2
	set	0x78, %g4
	ldsha	[%l7 + %g4] 0x04,	%i5
	sllx	%l4,	%i7,	%o7
	fmovsne	%icc,	%f29,	%f3
	mulx	%i3,	0x1737,	%o0
	udivx	%o3,	0x069B,	%i1
	tg	%icc,	0x0
	movge	%icc,	%i4,	%o5
	fba	%fcc3,	loop_1840
	fbo,a	%fcc2,	loop_1841
	edge32l	%l0,	%g7,	%g5
	andncc	%l6,	%i0,	%l1
loop_1840:
	sll	%o4,	0x1F,	%g6
loop_1841:
	tn	%xcc,	0x1
	andncc	%g2,	%g3,	%o6
	srax	%l2,	0x04,	%o2
	fpadd16s	%f28,	%f14,	%f11
	fmovsvc	%icc,	%f22,	%f18
	movn	%xcc,	%i6,	%g1
	wr	%g0,	0xe2,	%asi
	stxa	%o1,	[%l7 + 0x78] %asi
	membar	#Sync
	fnors	%f6,	%f21,	%f14
	tvc	%icc,	0x3
	set	0x70, %i0
	lduha	[%l7 + %i0] 0x11,	%g4
	edge16	%i2,	%l3,	%l5
	fble,a	%fcc0,	loop_1842
	mulx	%i5,	0x174C,	%i7
	fbe,a	%fcc0,	loop_1843
	ble,pn	%icc,	loop_1844
loop_1842:
	tvc	%xcc,	0x6
	ba,a,pn	%xcc,	loop_1845
loop_1843:
	orncc	%l4,	0x1141,	%i3
loop_1844:
	bcs,pt	%xcc,	loop_1846
	fnor	%f30,	%f12,	%f2
loop_1845:
	fsrc1s	%f0,	%f27
	movcs	%icc,	%o0,	%o7
loop_1846:
	tge	%icc,	0x4
	edge16ln	%o3,	%i4,	%o5
	smul	%l0,	%g7,	%g5
	edge32ln	%i1,	%l6,	%i0
	tcc	%icc,	0x2
	wr	%g0,	0x23,	%asi
	stda	%o4,	[%l7 + 0x08] %asi
	membar	#Sync
	movge	%icc,	%l1,	%g6
	popc	0x0B93,	%g2
	set	0x44, %o1
	ldswa	[%l7 + %o1] 0x18,	%g3
	movg	%icc,	%o6,	%o2
	nop
	setx loop_1847, %l0, %l1
	jmpl %l1, %i6
	fbo,a	%fcc1,	loop_1848
	bvc,a,pn	%xcc,	loop_1849
	subccc	%l2,	0x1B48,	%g1
loop_1847:
	edge8	%o1,	%g4,	%l3
loop_1848:
	orcc	%i2,	%l5,	%i5
loop_1849:
	ldsh	[%l7 + 0x56],	%l4
	tsubcctv	%i3,	%o0,	%i7
	fmovspos	%icc,	%f30,	%f16
	fmovsg	%icc,	%f4,	%f11
	srax	%o7,	0x0E,	%o3
	xnorcc	%i4,	%l0,	%g7
	movne	%icc,	%g5,	%i1
	fbug,a	%fcc1,	loop_1850
	bge,a	loop_1851
	fmul8x16	%f15,	%f14,	%f6
	tgu	%xcc,	0x0
loop_1850:
	ldsb	[%l7 + 0x48],	%l6
loop_1851:
	andn	%o5,	0x1352,	%i0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovscs	%icc,	%f18,	%f26
	fmovrse	%o4,	%f13,	%f29
	wr	%g0,	0x10,	%asi
	prefetcha	[%l7 + 0x08] %asi,	 0x1
	taddcc	%g2,	%l1,	%o6
	tge	%icc,	0x4
	fandnot2s	%f19,	%f24,	%f15
	edge32l	%o2,	%g3,	%i6
	movvs	%icc,	%g1,	%o1
	andcc	%g4,	%l2,	%i2
	nop
	set	0x28, %i6
	ldd	[%l7 + %i6],	%f4
	ldsw	[%l7 + 0x10],	%l3
	fbe,a	%fcc1,	loop_1852
	for	%f14,	%f16,	%f10
	fpadd32	%f20,	%f4,	%f28
	edge16l	%i5,	%l5,	%i3
loop_1852:
	lduw	[%l7 + 0x24],	%o0
	fble,a	%fcc0,	loop_1853
	andn	%i7,	%o7,	%l4
	edge32	%i4,	%o3,	%g7
	movn	%xcc,	%g5,	%l0
loop_1853:
	tne	%icc,	0x3
	array8	%l6,	%o5,	%i0
	fcmpgt16	%f22,	%f18,	%i1
	fpadd16	%f18,	%f12,	%f4
	fbul,a	%fcc2,	loop_1854
	orn	%o4,	0x1E67,	%g6
	movleu	%icc,	%l1,	%g2
	fmovse	%xcc,	%f16,	%f19
loop_1854:
	movcs	%icc,	%o6,	%g3
	tg	%icc,	0x6
	membar	0x49
	fcmpeq16	%f22,	%f20,	%o2
	te	%icc,	0x1
	movrgz	%g1,	0x0DE,	%o1
	wr	%g0,	0xea,	%asi
	stxa	%g4,	[%l7 + 0x10] %asi
	membar	#Sync
	tg	%xcc,	0x7
	edge8l	%i6,	%l2,	%i2
	mulscc	%l3,	%i5,	%l5
	subcc	%i3,	%i7,	%o7
	wr	%g0,	0x27,	%asi
	stxa	%o0,	[%l7 + 0x70] %asi
	membar	#Sync
	fbne	%fcc2,	loop_1855
	sub	%l4,	%o3,	%i4
	sethi	0x0783,	%g5
	sdivx	%l0,	0x0A53,	%g7
loop_1855:
	fpack16	%f30,	%f19
	stx	%l6,	[%l7 + 0x78]
	ldd	[%l7 + 0x50],	%i0
	fones	%f20
	fmul8x16au	%f0,	%f21,	%f0
	add	%l7,	0x44,	%l6
	wr	%g0,	0x04,	%asi
	casa	[%l6] 0x04,	%i1,	%o4
	fandnot2	%f6,	%f6,	%f24
	mova	%icc,	%o5,	%g6
	andcc	%g2,	0x1841,	%l1
	movne	%xcc,	%o6,	%g3
	bpos,a,pt	%xcc,	loop_1856
	xnorcc	%o2,	0x1368,	%o1
	ble,pt	%icc,	loop_1857
	fornot1	%f10,	%f12,	%f8
loop_1856:
	subc	%g4,	0x112C,	%i6
	array16	%l2,	%g1,	%l3
loop_1857:
	fblg	%fcc1,	loop_1858
	st	%f22,	[%l7 + 0x14]
	udivx	%i5,	0x009F,	%i2
	add	%l7,	0x2C,	%l6
	wr	%g0,	0x0c,	%asi
	casa	[%l6] 0x0c,	%i3,	%i7
loop_1858:
	nop
	setx	loop_1859,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	udivx	%l5,	0x0CC0,	%o7
	edge16	%l4,	%o3,	%o0
	tleu	%xcc,	0x1
loop_1859:
	edge32n	%i4,	%g5,	%l0
	addccc	%l6,	%i0,	%g7
	add	%l7,	0x60,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] %asi,	%o4,	%o5
	swap	[%l7 + 0x4C],	%i1
	bleu,pn	%icc,	loop_1860
	movcs	%icc,	%g6,	%l1
	addc	%g2,	0x0AF5,	%o6
	fmovsn	%icc,	%f25,	%f19
loop_1860:
	sll	%g3,	%o2,	%o1
	movge	%icc,	%i6,	%l2
	tle	%icc,	0x7
	sra	%g1,	%l3,	%g4
	fpack32	%f26,	%f10,	%f22
	tgu	%xcc,	0x1
	or	%i2,	%i5,	%i7
	te	%xcc,	0x0
	tle	%icc,	0x0
	edge8ln	%i3,	%o7,	%l4
	fornot1	%f10,	%f26,	%f14
	fcmpne16	%f0,	%f6,	%l5
	sdiv	%o3,	0x07E1,	%o0
	mulscc	%g5,	%i4,	%l0
	tcs	%xcc,	0x6
	fmovsg	%icc,	%f29,	%f19
	nop
	setx	loop_1861,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fnot1s	%f28,	%f6
	tsubcc	%l6,	0x1309,	%g7
	brgz	%o4,	loop_1862
loop_1861:
	array8	%o5,	%i1,	%g6
	tcs	%xcc,	0x1
	movrne	%l1,	0x05A,	%g2
loop_1862:
	tg	%icc,	0x2
	udivcc	%o6,	0x0A72,	%g3
	ta	%xcc,	0x1
	set	0x40, %i3
	ldxa	[%l7 + %i3] 0x14,	%i0
	orn	%o2,	%o1,	%l2
	xnor	%g1,	0x1C92,	%i6
	tcs	%xcc,	0x1
	fba,a	%fcc2,	loop_1863
	edge16ln	%g4,	%l3,	%i2
	edge16ln	%i5,	%i3,	%i7
	smulcc	%l4,	0x0544,	%l5
loop_1863:
	and	%o3,	0x0985,	%o7
	movpos	%xcc,	%g5,	%o0
	swap	[%l7 + 0x20],	%i4
	fmovrse	%l6,	%f2,	%f2
	xnor	%l0,	%g7,	%o4
	edge32ln	%o5,	%g6,	%i1
	movcc	%xcc,	%g2,	%o6
	udivx	%l1,	0x1F80,	%i0
	movneg	%icc,	%o2,	%o1
	wr	%g0,	0x2f,	%asi
	stwa	%g3,	[%l7 + 0x2C] %asi
	membar	#Sync
	tn	%icc,	0x1
	tvc	%xcc,	0x2
	ldub	[%l7 + 0x6C],	%g1
	set	0x60, %l6
	stda	%i6,	[%l7 + %l6] 0x2f
	membar	#Sync
	sll	%l2,	0x03,	%g4
	fsrc2s	%f5,	%f27
	fnot2	%f30,	%f18
	tn	%icc,	0x6
	orn	%i2,	%i5,	%i3
	andcc	%l3,	%l4,	%i7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movg	%icc,	%o3,	%l5
	tpos	%icc,	0x3
	brgez	%g5,	loop_1864
	edge16ln	%o7,	%o0,	%l6
	fcmpeq16	%f26,	%f0,	%l0
	smul	%i4,	%o4,	%o5
loop_1864:
	nop
	set	0x78, %o3
	ldsh	[%l7 + %o3],	%g6
	andcc	%i1,	%g7,	%o6
	sllx	%l1,	0x18,	%g2
	fmovrdgz	%i0,	%f12,	%f10
	prefetch	[%l7 + 0x60],	 0x2
	nop
	setx	loop_1865,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fsrc2	%f18,	%f28
	fbe,a	%fcc2,	loop_1866
	brgz,a	%o1,	loop_1867
loop_1865:
	std	%o2,	[%l7 + 0x78]
	fcmpeq32	%f2,	%f22,	%g3
loop_1866:
	movg	%icc,	%g1,	%l2
loop_1867:
	bvs	%xcc,	loop_1868
	movrlz	%g4,	0x171,	%i2
	fxors	%f13,	%f25,	%f19
	udivx	%i5,	0x0898,	%i6
loop_1868:
	movre	%i3,	0x19D,	%l4
	srlx	%l3,	%o3,	%l5
	array16	%i7,	%g5,	%o7
	srlx	%l6,	%o0,	%i4
	tpos	%xcc,	0x5
	sir	0x103C
	add	%l7,	0x68,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%o4
	casxa	[%l6] %asi,	%o4,	%o5
	movne	%xcc,	%g6,	%l0
	movrne	%i1,	%g7,	%l1
	fsrc2	%f8,	%f4
	fmovsn	%xcc,	%f19,	%f2
	edge32	%o6,	%g2,	%o1
	std	%f22,	[%l7 + 0x68]
	movne	%xcc,	%o2,	%g3
	movpos	%xcc,	%i0,	%g1
	fpsub16s	%f29,	%f1,	%f5
	tsubcctv	%g4,	%i2,	%i5
	taddcc	%l2,	0x115D,	%i6
	tne	%icc,	0x6
	brgz,a	%l4,	loop_1869
	movrne	%i3,	0x312,	%o3
	set	0x31, %l0
	ldsba	[%l7 + %l0] 0x10,	%l3
loop_1869:
	fbul,a	%fcc3,	loop_1870
	pdist	%f2,	%f8,	%f20
	fcmple32	%f20,	%f20,	%l5
	movleu	%xcc,	%g5,	%i7
loop_1870:
	umul	%l6,	%o0,	%i4
	sll	%o7,	0x1C,	%o4
	movrlez	%o5,	%g6,	%l0
	brgez	%g7,	loop_1871
	sdivcc	%i1,	0x1317,	%l1
	tg	%xcc,	0x5
	nop
	set	0x42, %i2
	sth	%o6,	[%l7 + %i2]
loop_1871:
	bg,a,pt	%xcc,	loop_1872
	ldd	[%l7 + 0x08],	%g2
	fmovdneg	%icc,	%f29,	%f5
	fnot1s	%f30,	%f23
loop_1872:
	nop
	wr	%g0,	0x19,	%asi
	stba	%o1,	[%l7 + 0x3C] %asi
	fandnot1s	%f1,	%f8,	%f10
	addccc	%o2,	0x0712,	%g3
	addc	%g1,	%g4,	%i0
	tvs	%icc,	0x3
	edge16ln	%i2,	%l2,	%i5
	addcc	%l4,	%i3,	%o3
	stw	%i6,	[%l7 + 0x34]
	fbul,a	%fcc0,	loop_1873
	sra	%l5,	0x1E,	%g5
	movge	%xcc,	%l3,	%l6
	addccc	%i7,	0x18DE,	%i4
loop_1873:
	nop
	wr	%g0,	0x04,	%asi
	ldsba	[%l7 + 0x3F] %asi,	%o0
	andncc	%o4,	%o5,	%o7
	set	0x4C, %o6
	sta	%f23,	[%l7 + %o6] 0x10
	tpos	%xcc,	0x0
	tcs	%icc,	0x0
	taddcctv	%g6,	0x1EC0,	%g7
	fbule,a	%fcc2,	loop_1874
	fbn	%fcc1,	loop_1875
	mova	%xcc,	%i1,	%l1
	subc	%l0,	%g2,	%o6
loop_1874:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1875:
	movvc	%icc,	%o1,	%g3
	movleu	%icc,	%g1,	%o2
	ba,pt	%xcc,	loop_1876
	fble,a	%fcc0,	loop_1877
	movvs	%xcc,	%i0,	%i2
	tneg	%xcc,	0x4
loop_1876:
	fmovrsgez	%g4,	%f7,	%f17
loop_1877:
	fmovdvs	%icc,	%f21,	%f13
	lduw	[%l7 + 0x54],	%i5
	tpos	%xcc,	0x1
	fxnor	%f12,	%f10,	%f10
	xor	%l2,	%l4,	%i3
	addccc	%o3,	%l5,	%i6
	fmovde	%xcc,	%f3,	%f14
	sethi	0x1295,	%g5
	movl	%icc,	%l3,	%l6
	movcs	%xcc,	%i7,	%o0
	udivx	%o4,	0x191E,	%i4
	te	%xcc,	0x6
	fnot1	%f20,	%f24
	fnot1s	%f31,	%f10
	pdist	%f0,	%f8,	%f20
	fcmpeq16	%f14,	%f30,	%o5
	udivcc	%g6,	0x07EF,	%g7
	add	%i1,	0x186A,	%l1
	fandnot1s	%f15,	%f12,	%f9
	brlz,a	%o7,	loop_1878
	orcc	%g2,	%o6,	%l0
	sdiv	%o1,	0x038C,	%g1
	fornot1s	%f21,	%f23,	%f16
loop_1878:
	bvc,pn	%icc,	loop_1879
	edge16l	%o2,	%i0,	%g3
	array16	%i2,	%i5,	%l2
	umulcc	%l4,	%i3,	%o3
loop_1879:
	siam	0x0
	set	0x62, %l1
	ldsha	[%l7 + %l1] 0x10,	%g4
	sethi	0x019B,	%l5
	fnors	%f28,	%f11,	%f27
	fbl	%fcc1,	loop_1880
	movleu	%icc,	%i6,	%l3
	fcmple32	%f24,	%f14,	%g5
	fbge	%fcc0,	loop_1881
loop_1880:
	std	%i6,	[%l7 + 0x70]
	fmovrde	%o0,	%f6,	%f22
	nop
	setx	loop_1882,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_1881:
	te	%xcc,	0x2
	te	%xcc,	0x6
	call	loop_1883
loop_1882:
	tg	%icc,	0x5
	edge8n	%i7,	%i4,	%o4
	tne	%icc,	0x2
loop_1883:
	bvs,a,pt	%xcc,	loop_1884
	umulcc	%o5,	0x0CAB,	%g7
	fmovrsne	%i1,	%f30,	%f18
	fbug,a	%fcc3,	loop_1885
loop_1884:
	taddcctv	%g6,	0x0DFC,	%o7
	addccc	%g2,	0x01DF,	%l1
	addccc	%o6,	%l0,	%g1
loop_1885:
	and	%o1,	0x1DF7,	%o2
	tne	%icc,	0x2
	andncc	%i0,	%i2,	%g3
	array32	%i5,	%l2,	%i3
	orn	%o3,	%l4,	%l5
	te	%xcc,	0x0
	nop
	set	0x74, %i4
	sth	%g4,	[%l7 + %i4]
	bg,pt	%icc,	loop_1886
	fbl	%fcc3,	loop_1887
	tsubcc	%l3,	%i6,	%l6
	movrne	%g5,	0x109,	%i7
loop_1886:
	nop
	add	%l7,	0x58,	%l6
	wr	%g0,	0x04,	%asi
	casxa	[%l6] %asi,	%i4,	%o0
loop_1887:
	tge	%xcc,	0x2
	prefetch	[%l7 + 0x50],	 0x1
	and	%o5,	%o4,	%g7
	movrlz	%g6,	%i1,	%o7
	bvc	loop_1888
	move	%xcc,	%l1,	%g2
	fbule,a	%fcc3,	loop_1889
	fbl,a	%fcc3,	loop_1890
loop_1888:
	orncc	%o6,	%l0,	%g1
	stbar
loop_1889:
	movn	%xcc,	%o1,	%i0
loop_1890:
	edge8ln	%o2,	%i2,	%g3
	nop
	setx loop_1891, %l0, %l1
	jmpl %l1, %i5
	tne	%icc,	0x1
	fnor	%f14,	%f14,	%f12
	movle	%icc,	%l2,	%i3
loop_1891:
	fabsd	%f16,	%f28
	movrlz	%l4,	0x2D2,	%o3
	fpackfix	%f28,	%f4
	for	%f8,	%f22,	%f24
	movpos	%xcc,	%g4,	%l5
	mulx	%l3,	0x03DE,	%l6
	tl	%icc,	0x5
	addcc	%g5,	%i7,	%i6
	movrlz	%o0,	%o5,	%i4
	brnz	%g7,	loop_1892
	fmovsvc	%icc,	%f10,	%f19
	fmovrse	%o4,	%f14,	%f17
	fcmpeq32	%f18,	%f6,	%g6
loop_1892:
	tge	%xcc,	0x2
	tpos	%xcc,	0x1
	stx	%i1,	[%l7 + 0x58]
	orn	%l1,	0x0EC5,	%o7
	array8	%o6,	%g2,	%l0
	set	0x31, %o2
	stba	%g1,	[%l7 + %o2] 0x10
	fmovrslz	%i0,	%f17,	%f17
	set	0x20, %g2
	lda	[%l7 + %g2] 0x0c,	%f13
	fmovrsne	%o1,	%f22,	%f24
	wr	%g0,	0x27,	%asi
	stxa	%i2,	[%l7 + 0x50] %asi
	membar	#Sync
	fmuld8sux16	%f5,	%f6,	%f10
	fmovsne	%xcc,	%f27,	%f20
	movl	%xcc,	%o2,	%i5
	ldd	[%l7 + 0x28],	%f22
	fbug,a	%fcc3,	loop_1893
	tgu	%xcc,	0x7
	nop
	setx loop_1894, %l0, %l1
	jmpl %l1, %g3
	fand	%f16,	%f24,	%f2
loop_1893:
	movg	%icc,	%i3,	%l4
	taddcctv	%l2,	0x03B2,	%o3
loop_1894:
	nop
	set	0x7C, %o4
	stha	%l5,	[%l7 + %o4] 0x18
	edge32l	%l3,	%l6,	%g5
	wr	%g0,	0x11,	%asi
	prefetcha	[%l7 + 0x78] %asi,	 0x3
	alignaddrl	%g4,	%i6,	%o0
	smul	%o5,	0x1977,	%i4
	stx	%o4,	[%l7 + 0x08]
	movgu	%icc,	%g7,	%i1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fone	%f0
	sir	0x0931
	movleu	%xcc,	%l1,	%g6
	andcc	%o7,	0x1787,	%g2
	fandnot2s	%f8,	%f19,	%f23
	movne	%icc,	%l0,	%g1
	fnands	%f8,	%f10,	%f0
	tle	%xcc,	0x0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movge	%xcc,	%o6,	%i0
	fbe	%fcc3,	loop_1895
	stb	%i2,	[%l7 + 0x50]
	addc	%o1,	%i5,	%g3
	bpos,a	%icc,	loop_1896
loop_1895:
	tge	%xcc,	0x5
	lduh	[%l7 + 0x28],	%o2
	tl	%icc,	0x6
loop_1896:
	brlez,a	%i3,	loop_1897
	tleu	%xcc,	0x0
	bg	loop_1898
	nop
	setx loop_1899, %l0, %l1
	jmpl %l1, %l4
loop_1897:
	fmovsle	%icc,	%f14,	%f24
	fnor	%f10,	%f14,	%f28
loop_1898:
	lduw	[%l7 + 0x68],	%o3
loop_1899:
	movl	%icc,	%l5,	%l2
	set	0x78, %i7
	stda	%l2,	[%l7 + %i7] 0x88
	movneg	%xcc,	%g5,	%l6
	bcc,a,pt	%xcc,	loop_1900
	fmovrslz	%i7,	%f9,	%f28
	nop
	setx	loop_1901,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movle	%xcc,	%g4,	%o0
loop_1900:
	fxnors	%f5,	%f7,	%f31
	fbuge	%fcc1,	loop_1902
loop_1901:
	andcc	%i6,	%o5,	%i4
	brnz,a	%g7,	loop_1903
	addccc	%o4,	%i1,	%l1
loop_1902:
	movneg	%xcc,	%g6,	%o7
	fbne	%fcc3,	loop_1904
loop_1903:
	fbu	%fcc3,	loop_1905
	movrlz	%g2,	0x2BC,	%g1
	fmovda	%icc,	%f20,	%f7
loop_1904:
	membar	0x69
loop_1905:
	fones	%f23
	andn	%l0,	0x0FDA,	%o6
	fbuge,a	%fcc2,	loop_1906
	fmovdle	%icc,	%f30,	%f27
	membar	#Sync
	wr	%g0,	0xf1,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
loop_1906:
	fnand	%f8,	%f2,	%f2
	fzeros	%f6
	edge8ln	%i2,	%i0,	%o1
	addc	%g3,	%i5,	%o2
	fmovrdlez	%i3,	%f12,	%f28
	tsubcc	%l4,	%l5,	%o3
	bl	loop_1907
	sll	%l3,	0x07,	%l2
	movrne	%l6,	%g5,	%g4
	set	0x26, %o0
	stha	%i7,	[%l7 + %o0] 0x22
	membar	#Sync
loop_1907:
	nop
	wr	%g0,	0x18,	%asi
	prefetcha	[%l7 + 0x68] %asi,	 0x3
	edge16	%o5,	%i4,	%g7
	wr	%g0,	0x80,	%asi
	ldsba	[%l7 + 0x44] %asi,	%o4
	fmovsvc	%icc,	%f23,	%f20
	tvc	%icc,	0x1
	bl,pn	%xcc,	loop_1908
	fnot2	%f6,	%f24
	smul	%i1,	0x0481,	%l1
	udivx	%i6,	0x1CCC,	%g6
loop_1908:
	std	%f12,	[%l7 + 0x40]
	fmovrdgz	%o7,	%f2,	%f26
	srax	%g1,	%g2,	%o6
	sethi	0x1069,	%i2
	movle	%icc,	%i0,	%l0
	fmovsvc	%xcc,	%f3,	%f16
	wr	%g0,	0x11,	%asi
	ldswa	[%l7 + 0x48] %asi,	%o1
	subcc	%g3,	0x0DDF,	%o2
	array32	%i3,	%i5,	%l4
	edge32	%l5,	%l3,	%o3
	andcc	%l6,	%g5,	%g4
	fmovdvs	%icc,	%f21,	%f19
	tl	%xcc,	0x0
	nop
	setx	loop_1909,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movvc	%xcc,	%l2,	%o0
	brgez	%i7,	loop_1910
	fornot1s	%f22,	%f15,	%f27
loop_1909:
	nop
	set	0x08, %l3
	ldstuba	[%l7 + %l3] 0x89,	%i4
loop_1910:
	tneg	%xcc,	0x4
	movne	%icc,	%g7,	%o4
	movrgez	%i1,	%o5,	%i6
	stw	%g6,	[%l7 + 0x4C]
	xor	%l1,	%g1,	%g2
	tvs	%xcc,	0x3
	orncc	%o7,	0x1179,	%i2
	udivcc	%i0,	0x1B2B,	%l0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	setx	loop_1911,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movcc	%xcc,	%o6,	%o1
	bge,pn	%xcc,	loop_1912
	sth	%g3,	[%l7 + 0x18]
loop_1911:
	fxor	%f8,	%f6,	%f30
	addcc	%o2,	%i3,	%l4
loop_1912:
	tleu	%icc,	0x5
	lduh	[%l7 + 0x4A],	%i5
	srl	%l5,	%l3,	%l6
	fones	%f14
	set	0x36, %o5
	ldsba	[%l7 + %o5] 0x0c,	%g5
	movpos	%xcc,	%o3,	%g4
	set	0x3a0, %g7
	nop 	! 	nop 	! 	ldxa	[%g0 + %g7] 0x40,	%l2 ripped by fixASI40.pl ripped by fixASI40.pl
	mova	%icc,	%o0,	%i7
	fba	%fcc0,	loop_1913
	addcc	%g7,	%i4,	%i1
	tl	%icc,	0x7
	bge,a,pn	%xcc,	loop_1914
loop_1913:
	edge16n	%o5,	%i6,	%o4
	tgu	%icc,	0x1
	set	0x15, %l2
	ldstuba	[%l7 + %l2] 0x11,	%g6
loop_1914:
	fcmpgt16	%f28,	%f8,	%l1
	sub	%g2,	%g1,	%o7
	udivcc	%i2,	0x03EE,	%i0
	bne	loop_1915
	and	%o6,	%l0,	%g3
	fpadd16	%f22,	%f26,	%f16
	ldub	[%l7 + 0x4A],	%o2
loop_1915:
	bleu,pt	%xcc,	loop_1916
	edge32l	%o1,	%l4,	%i3
	fbuge,a	%fcc0,	loop_1917
	sethi	0x0198,	%i5
loop_1916:
	subccc	%l3,	%l6,	%g5
	subcc	%l5,	0x1DC8,	%o3
loop_1917:
	nop
	wr	%g0,	0x10,	%asi
	ldsha	[%l7 + 0x3C] %asi,	%l2
	sdivx	%o0,	0x0D0B,	%g4
	subccc	%g7,	%i4,	%i7
	bn,pt	%xcc,	loop_1918
	fbule	%fcc1,	loop_1919
	movne	%xcc,	%i1,	%o5
	tvs	%icc,	0x4
loop_1918:
	fmul8sux16	%f30,	%f10,	%f0
loop_1919:
	mulx	%i6,	%g6,	%o4
	fmovsg	%icc,	%f11,	%f12
	srax	%g2,	%l1,	%o7
	xor	%g1,	%i0,	%o6
	subccc	%i2,	0x106C,	%l0
	add	%o2,	0x1992,	%o1
	umul	%l4,	0x08B4,	%g3
	mova	%icc,	%i3,	%i5
	brgz,a	%l3,	loop_1920
	edge32ln	%l6,	%g5,	%l5
	sll	%l2,	0x0B,	%o3
	fblg	%fcc3,	loop_1921
loop_1920:
	fmovsl	%icc,	%f21,	%f13
	udiv	%g4,	0x1DC0,	%g7
	srl	%i4,	%i7,	%i1
loop_1921:
	tn	%icc,	0x1
	sll	%o0,	%o5,	%g6
	movvs	%icc,	%i6,	%g2
	movrlez	%l1,	%o7,	%o4
	or	%g1,	0x0E12,	%o6
	subcc	%i0,	0x1C2B,	%l0
	tpos	%icc,	0x7
	xorcc	%o2,	0x1C25,	%o1
	fexpand	%f2,	%f2
	sub	%i2,	%l4,	%i3
	ldub	[%l7 + 0x7D],	%i5
	movgu	%xcc,	%l3,	%g3
	fbe,a	%fcc3,	loop_1922
	movrlz	%g5,	%l5,	%l6
	srlx	%o3,	0x08,	%g4
	srl	%g7,	%l2,	%i7
loop_1922:
	movrgez	%i1,	0x32E,	%i4
	movrgez	%o5,	0x140,	%o0
	sub	%g6,	0x147F,	%i6
	brlez	%l1,	loop_1923
	xor	%o7,	0x0452,	%o4
	edge32n	%g1,	%g2,	%i0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1923:
	umul	%l0,	%o6,	%o2
	fmovdle	%icc,	%f16,	%f2
	addcc	%i2,	%o1,	%l4
	fmovdcc	%icc,	%f5,	%f20
	sra	%i3,	0x03,	%i5
	udivx	%g3,	0x1858,	%l3
	umulcc	%l5,	0x05AC,	%l6
	mulscc	%o3,	0x0B71,	%g5
	fone	%f28
	fxnor	%f24,	%f12,	%f24
	fmovrsne	%g7,	%f3,	%f21
	xnor	%g4,	0x12F3,	%l2
	fnot1s	%f1,	%f2
	movrgz	%i7,	%i1,	%o5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsvs	%xcc,	%f24,	%f8
	movvc	%xcc,	%o0,	%g6
	fzeros	%f31
	edge8n	%i6,	%i4,	%o7
	fmovsneg	%icc,	%f31,	%f7
	movleu	%xcc,	%l1,	%o4
	fmovsvs	%icc,	%f7,	%f7
	ta	%icc,	0x4
	movvc	%icc,	%g1,	%i0
	membar	0x5E
	addc	%l0,	%o6,	%o2
	mulx	%i2,	%o1,	%g2
	popc	%l4,	%i5
	fcmpd	%fcc0,	%f8,	%f6
	ta	%xcc,	0x5
	edge8ln	%i3,	%g3,	%l3
	tvc	%xcc,	0x4
	sethi	0x126B,	%l6
	wr	%g0,	0x19,	%asi
	ldsha	[%l7 + 0x5A] %asi,	%l5
	wr	%g0,	0x88,	%asi
	swapa	[%l7 + 0x58] %asi,	%o3
	set	0x48, %o7
	ldxa	[%l7 + %o7] 0x81,	%g7
	add	%g5,	0x1B46,	%l2
	array16	%i7,	%i1,	%g4
	fmovdn	%icc,	%f0,	%f29
	taddcctv	%o0,	0x0418,	%o5
	movcs	%icc,	%i6,	%g6
	fxnor	%f24,	%f2,	%f14
	fcmple32	%f24,	%f24,	%i4
	tsubcc	%o7,	%o4,	%l1
	wr	%g0,	0x89,	%asi
	ldsba	[%l7 + 0x57] %asi,	%i0
	fmul8sux16	%f20,	%f8,	%f0
	edge16	%g1,	%l0,	%o2
	tle	%icc,	0x4
	stx	%o6,	[%l7 + 0x48]
	stbar
	movleu	%icc,	%i2,	%g2
	orn	%o1,	%l4,	%i5
	sth	%i3,	[%l7 + 0x5A]
	edge8	%g3,	%l3,	%l5
	xor	%o3,	%l6,	%g7
	orcc	%l2,	%g5,	%i7
	add	%l7,	0x58,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%i1,	%g4
	set	0x3E, %l4
	stha	%o5,	[%l7 + %l4] 0x81
	fmovdle	%xcc,	%f18,	%f9
	movrlez	%o0,	0x30E,	%g6
	andn	%i6,	0x069A,	%o7
	sdivx	%o4,	0x1907,	%l1
	tcc	%xcc,	0x1
	bl,a	%icc,	loop_1924
	orncc	%i0,	0x1C3D,	%i4
	and	%l0,	0x0ECC,	%g1
	sethi	0x0769,	%o2
loop_1924:
	tgu	%icc,	0x6
	andn	%o6,	%g2,	%o1
	add	%l7,	0x40,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%i2,	%l4
	edge8	%i3,	%g3,	%l3
	movcc	%icc,	%l5,	%i5
	sllx	%l6,	%g7,	%o3
	edge8n	%l2,	%g5,	%i1
	taddcctv	%i7,	%g4,	%o0
	array16	%g6,	%o5,	%o7
	st	%f14,	[%l7 + 0x44]
	fbule,a	%fcc3,	loop_1925
	addc	%o4,	0x01EA,	%l1
	fmovsg	%xcc,	%f27,	%f11
	bvs,a,pn	%xcc,	loop_1926
loop_1925:
	fbne	%fcc3,	loop_1927
	edge32	%i6,	%i4,	%i0
	fmovsl	%icc,	%f29,	%f16
loop_1926:
	prefetch	[%l7 + 0x40],	 0x3
loop_1927:
	edge32n	%l0,	%o2,	%g1
	edge16ln	%g2,	%o1,	%i2
	tl	%icc,	0x5
	movrne	%o6,	%l4,	%i3
	tl	%icc,	0x1
	orn	%l3,	%g3,	%l5
	fabss	%f6,	%f11
	wr	%g0,	0x19,	%asi
	lduba	[%l7 + 0x6C] %asi,	%l6
	srlx	%g7,	0x1F,	%i5
	pdist	%f6,	%f16,	%f12
	tleu	%icc,	0x0
	movn	%icc,	%o3,	%l2
	fornot2s	%f13,	%f29,	%f22
	fbne,a	%fcc1,	loop_1928
	mulx	%i1,	%i7,	%g5
	edge32n	%o0,	%g6,	%o5
	fors	%f9,	%f10,	%f12
loop_1928:
	nop
	wr	%g0,	0x80,	%asi
	stxa	%o7,	[%l7 + 0x70] %asi
	fbn,a	%fcc0,	loop_1929
	movge	%icc,	%g4,	%l1
	mulscc	%i6,	%i4,	%o4
	ldx	[%l7 + 0x68],	%i0
loop_1929:
	brlz	%l0,	loop_1930
	addcc	%o2,	%g1,	%g2
	movneg	%icc,	%i2,	%o6
	addcc	%o1,	0x1926,	%l4
loop_1930:
	fmovdgu	%xcc,	%f21,	%f13
	ta	%xcc,	0x3
	sethi	0x0C55,	%i3
	xorcc	%l3,	0x1691,	%g3
	fand	%f8,	%f18,	%f26
	tvc	%xcc,	0x1
	movrgz	%l5,	0x2CA,	%l6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fornot2	%f20,	%f20,	%f0
	subc	%i5,	0x06CA,	%o3
	fnand	%f26,	%f26,	%f16
	bge	loop_1931
	bvc	%icc,	loop_1932
	movg	%icc,	%g7,	%l2
	fbue	%fcc2,	loop_1933
loop_1931:
	array32	%i7,	%g5,	%o0
loop_1932:
	udivcc	%i1,	0x16E8,	%o5
	membar	0x08
loop_1933:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addcc	%g6,	0x0FD3,	%g4
	bne,a	loop_1934
	andncc	%l1,	%i6,	%i4
	sdivcc	%o7,	0x1AB1,	%o4
	tg	%xcc,	0x6
loop_1934:
	fmovspos	%xcc,	%f10,	%f29
	movneg	%xcc,	%i0,	%o2
	movre	%g1,	%g2,	%i2
	tge	%icc,	0x3
	std	%f4,	[%l7 + 0x28]
	edge8n	%o6,	%o1,	%l0
	fabsd	%f18,	%f10
	movcc	%icc,	%i3,	%l3
	tvs	%xcc,	0x0
	fbge,a	%fcc2,	loop_1935
	fmovdge	%icc,	%f4,	%f9
	fbe	%fcc3,	loop_1936
	fmovdg	%icc,	%f27,	%f29
loop_1935:
	fcmple16	%f18,	%f28,	%l4
	alignaddr	%g3,	%l6,	%l5
loop_1936:
	movne	%xcc,	%i5,	%g7
	tn	%icc,	0x0
	movpos	%icc,	%o3,	%l2
	stbar
	fba,a	%fcc1,	loop_1937
	membar	0x6D
	wr	%g0,	0x0c,	%asi
	stxa	%i7,	[%l7 + 0x48] %asi
loop_1937:
	fmovdleu	%icc,	%f10,	%f16
	udivx	%o0,	0x06AD,	%i1
	alignaddr	%g5,	%o5,	%g6
	nop
	set	0x50, %g6
	ldstub	[%l7 + %g6],	%l1
	fone	%f0
	swap	[%l7 + 0x6C],	%i6
	fpadd16	%f22,	%f12,	%f4
	fnand	%f18,	%f6,	%f16
	nop
	setx loop_1938, %l0, %l1
	jmpl %l1, %i4
	smulcc	%g4,	%o4,	%i0
	fpack32	%f26,	%f8,	%f8
	fbul,a	%fcc2,	loop_1939
loop_1938:
	tg	%xcc,	0x6
	set	0x63, %g5
	ldstuba	[%l7 + %g5] 0x89,	%o2
loop_1939:
	fzeros	%f13
	fbl	%fcc1,	loop_1940
	fexpand	%f22,	%f16
	addc	%g1,	0x1040,	%g2
	array8	%o7,	%o6,	%o1
loop_1940:
	subccc	%l0,	0x0AE4,	%i2
	nop
	setx	loop_1941,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tcc	%xcc,	0x0
	tn	%icc,	0x4
	call	loop_1942
loop_1941:
	smul	%l3,	%i3,	%g3
	nop
	setx	loop_1943,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fmovsvc	%icc,	%f14,	%f4
loop_1942:
	alignaddrl	%l4,	%l6,	%l5
	subc	%g7,	%o3,	%i5
loop_1943:
	tcc	%xcc,	0x0
	fcmpeq32	%f26,	%f14,	%l2
	sir	0x1C78
	edge8	%i7,	%o0,	%g5
	xnor	%o5,	%g6,	%i1
	faligndata	%f24,	%f2,	%f20
	fpadd32s	%f28,	%f26,	%f3
	array16	%i6,	%l1,	%g4
	fmovdle	%xcc,	%f19,	%f21
	fmovscs	%xcc,	%f17,	%f2
	mova	%icc,	%i4,	%i0
	tsubcc	%o2,	0x0475,	%g1
	tcs	%xcc,	0x1
	array8	%o4,	%o7,	%g2
	edge32	%o1,	%o6,	%l0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x17,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
	sub	%i2,	0x1D3E,	%l3
	movre	%i3,	%g3,	%l4
	srlx	%l6,	0x11,	%l5
	srl	%g7,	0x09,	%i5
	add	%o3,	0x1041,	%l2
	edge32l	%o0,	%i7,	%o5
	wr	%g0,	0x0c,	%asi
	sta	%f27,	[%l7 + 0x74] %asi
	fmovdcs	%xcc,	%f24,	%f27
	sdivcc	%g5,	0x101B,	%i1
	umulcc	%i6,	0x166C,	%l1
	movcs	%xcc,	%g4,	%g6
	edge32	%i0,	%i4,	%o2
	taddcc	%o4,	0x1BB1,	%g1
	subccc	%o7,	0x12DA,	%o1
	brz,a	%o6,	loop_1944
	brnz	%l0,	loop_1945
	tvc	%xcc,	0x5
	bg,a,pn	%xcc,	loop_1946
loop_1944:
	addccc	%i2,	0x15BE,	%g2
loop_1945:
	fpadd16s	%f4,	%f26,	%f25
	stbar
loop_1946:
	for	%f14,	%f14,	%f12
	xorcc	%i3,	%l3,	%l4
	bvc	loop_1947
	fmovrdgz	%l6,	%f20,	%f16
	fmovrsgez	%l5,	%f22,	%f6
	tcc	%icc,	0x0
loop_1947:
	array8	%g7,	%i5,	%g3
	edge16l	%l2,	%o3,	%i7
	srax	%o0,	0x1D,	%o5
	movn	%icc,	%g5,	%i6
	fnegd	%f28,	%f26
	fbug,a	%fcc1,	loop_1948
	fsrc1	%f28,	%f8
	tg	%icc,	0x5
	movvs	%xcc,	%i1,	%g4
loop_1948:
	tcs	%xcc,	0x4
	be,a,pt	%xcc,	loop_1949
	sdiv	%l1,	0x0C46,	%g6
	alignaddrl	%i0,	%i4,	%o2
	edge32	%g1,	%o7,	%o4
loop_1949:
	fcmple32	%f24,	%f26,	%o1
	fmovdn	%icc,	%f4,	%f28
	mova	%xcc,	%o6,	%l0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udiv	%i2,	0x01B4,	%g2
	srax	%l3,	%i3,	%l4
	nop
	set	0x14, %i1
	sth	%l6,	[%l7 + %i1]
	edge16	%g7,	%i5,	%g3
	movrgz	%l5,	%o3,	%i7
	movcs	%icc,	%o0,	%l2
	fmovscs	%xcc,	%f27,	%f14
	taddcctv	%g5,	0x032B,	%o5
	set	0x6C, %g1
	sta	%f26,	[%l7 + %g1] 0x14
	edge32l	%i1,	%i6,	%g4
	movleu	%xcc,	%g6,	%i0
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
	mova	%xcc,	%l1,	%o2
	udivx	%g1,	0x1C39,	%o7
	tsubcc	%i4,	%o4,	%o1
loop_1950:
	fone	%f4
	smul	%l0,	%i2,	%o6
	edge32ln	%l3,	%i3,	%l4
	orncc	%g2,	%g7,	%i5
	tleu	%icc,	0x6
	array8	%g3,	%l6,	%l5
	or	%o3,	0x1929,	%o0
	addc	%l2,	%i7,	%g5
	movcs	%icc,	%o5,	%i1
	movrlez	%g4,	0x269,	%g6
	nop
	setx	loop_1951,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	udivx	%i6,	0x0FDE,	%l1
	fnot1s	%f19,	%f8
	sdiv	%i0,	0x1725,	%o2
loop_1951:
	movle	%xcc,	%g1,	%i4
	ble	%xcc,	loop_1952
	tsubcc	%o4,	0x06E3,	%o1
	sub	%l0,	%i2,	%o6
	array16	%o7,	%i3,	%l4
loop_1952:
	xor	%l3,	0x1FA6,	%g2
	st	%f15,	[%l7 + 0x58]
	fandnot2	%f2,	%f26,	%f18
	movrlz	%i5,	%g7,	%l6
	umulcc	%g3,	%l5,	%o3
	addccc	%o0,	%i7,	%l2
	fmovdvc	%icc,	%f10,	%f5
	movcs	%xcc,	%g5,	%o5
	fxnors	%f13,	%f24,	%f4
	or	%i1,	%g6,	%g4
	bl,pn	%xcc,	loop_1953
	tne	%xcc,	0x6
	tsubcc	%l1,	%i0,	%o2
	set	0x3A, %g3
	stha	%i6,	[%l7 + %g3] 0xea
	membar	#Sync
loop_1953:
	fmovsg	%xcc,	%f28,	%f22
	movpos	%xcc,	%i4,	%o4
	movrgez	%g1,	0x29C,	%o1
	fmovsleu	%xcc,	%f29,	%f5
	taddcc	%i2,	%o6,	%l0
	andn	%o7,	%l4,	%l3
	nop
	setx loop_1954, %l0, %l1
	jmpl %l1, %i3
	tleu	%icc,	0x0
	lduh	[%l7 + 0x2E],	%g2
	fmovsle	%icc,	%f21,	%f17
loop_1954:
	movne	%icc,	%g7,	%l6
	mova	%xcc,	%g3,	%l5
	fcmpd	%fcc3,	%f2,	%f4
	udivcc	%i5,	0x0C0B,	%o0
	fble	%fcc0,	loop_1955
	siam	0x1
	taddcctv	%i7,	0x03BE,	%o3
	fandnot1	%f22,	%f0,	%f16
loop_1955:
	mulscc	%l2,	0x0580,	%o5
	movgu	%icc,	%i1,	%g6
	srl	%g4,	%g5,	%l1
	mulx	%o2,	0x1FF9,	%i6
	set	0x40, %l5
	ldda	[%l7 + %l5] 0x10,	%f16
	edge16n	%i0,	%i4,	%g1
	xorcc	%o1,	%o4,	%o6
	edge32	%i2,	%o7,	%l4
	movl	%xcc,	%l0,	%l3
	fmovdn	%icc,	%f21,	%f2
	flush	%l7 + 0x70
	fnegs	%f22,	%f28
	taddcctv	%i3,	0x0772,	%g2
	wr	%g0,	0x4f,	%asi
	stxa	%l6,	[%g0 + 0x38] %asi
	orncc	%g3,	%g7,	%l5
	fpsub16s	%f27,	%f2,	%f8
	udiv	%i5,	0x02E9,	%i7
	brgz	%o0,	loop_1956
	and	%l2,	0x1F54,	%o3
	xorcc	%i1,	%o5,	%g4
	tne	%xcc,	0x7
loop_1956:
	movvc	%xcc,	%g5,	%g6
	edge8n	%l1,	%o2,	%i6
	movg	%xcc,	%i0,	%i4
	array8	%g1,	%o4,	%o1
	add	%l7,	0x24,	%l6
	wr	%g0,	0x0c,	%asi
	casa	[%l6] 0x0c,	%i2,	%o6
	fmovrsgz	%l4,	%f17,	%f28
	alignaddr	%l0,	%l3,	%i3
	lduw	[%l7 + 0x50],	%g2
	edge32n	%l6,	%g3,	%g7
	tsubcctv	%l5,	0x136E,	%i5
	fmovsa	%icc,	%f8,	%f4
	orn	%i7,	0x096C,	%o0
	fsrc2	%f12,	%f14
	brgz	%o7,	loop_1957
	nop
	setx	loop_1958,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	alignaddr	%o3,	%i1,	%o5
	movrgz	%g4,	0x3B8,	%l2
loop_1957:
	tg	%xcc,	0x1
loop_1958:
	fpack16	%f28,	%f24
	tsubcctv	%g5,	%g6,	%o2
	xorcc	%i6,	%i0,	%i4
	addc	%l1,	0x0C0D,	%g1
	sir	0x06ED
	fmovsgu	%icc,	%f16,	%f6
	fnot2s	%f14,	%f30
	tgu	%xcc,	0x7
	udivx	%o4,	0x09AC,	%o1
	addc	%i2,	%o6,	%l0
	fxnors	%f22,	%f26,	%f9
	sra	%l3,	%i3,	%l4
	movg	%xcc,	%l6,	%g2
	movrlz	%g3,	0x195,	%g7
	brlz	%i5,	loop_1959
	fmovdvs	%xcc,	%f21,	%f23
	xorcc	%i7,	0x1353,	%o0
	srax	%l5,	0x0D,	%o7
loop_1959:
	sub	%i1,	0x1C23,	%o5
	fmovrsgz	%o3,	%f8,	%f15
	xnorcc	%g4,	0x11A1,	%l2
	set	0x5C, %g4
	ldsha	[%l7 + %g4] 0x04,	%g6
	subccc	%g5,	0x16E6,	%i6
	movne	%icc,	%i0,	%o2
	st	%f25,	[%l7 + 0x28]
	fcmple16	%f24,	%f26,	%l1
	fornot2	%f22,	%f4,	%f2
	nop
	setx	loop_1960,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movpos	%icc,	%i4,	%g1
	fmovsleu	%xcc,	%f2,	%f26
	fpack16	%f14,	%f28
loop_1960:
	movl	%icc,	%o4,	%o1
	bneg,a,pt	%icc,	loop_1961
	edge8ln	%i2,	%o6,	%l0
	fpack16	%f28,	%f14
	popc	%l3,	%l4
loop_1961:
	movpos	%icc,	%i3,	%l6
	edge16n	%g3,	%g7,	%i5
	sdivx	%g2,	0x0304,	%i7
	tcc	%icc,	0x2
	sethi	0x06E1,	%o0
	fpack16	%f0,	%f18
	taddcctv	%o7,	%i1,	%o5
	edge8l	%l5,	%g4,	%o3
	movvs	%icc,	%g6,	%l2
	addcc	%g5,	0x0AF8,	%i6
	tn	%xcc,	0x3
	edge16n	%i0,	%o2,	%l1
	tge	%xcc,	0x4
	fcmped	%fcc0,	%f24,	%f26
	tg	%xcc,	0x2
	smulcc	%i4,	%g1,	%o1
	set	0x66, %i5
	ldsha	[%l7 + %i5] 0x88,	%i2
	fmovrslz	%o6,	%f6,	%f16
	xnorcc	%l0,	0x0468,	%o4
	add	%l4,	0x1AA4,	%i3
	fabss	%f24,	%f22
	brz	%l6,	loop_1962
	fnegd	%f16,	%f26
	movl	%icc,	%l3,	%g3
	fnors	%f20,	%f9,	%f28
loop_1962:
	sdiv	%g7,	0x0ED2,	%i5
	bn,pn	%icc,	loop_1963
	fmovdcc	%icc,	%f13,	%f12
	tg	%icc,	0x3
	movneg	%icc,	%g2,	%i7
loop_1963:
	std	%o6,	[%l7 + 0x58]
	popc	0x1896,	%i1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ba,pn	%xcc,	loop_1964
	tne	%xcc,	0x3
	srl	%o0,	0x1D,	%o5
	fzeros	%f30
loop_1964:
	fcmps	%fcc3,	%f23,	%f20
	tsubcctv	%l5,	0x1638,	%o3
	fmovdl	%icc,	%f11,	%f10
	smul	%g4,	0x1031,	%g6
	fzeros	%f5
	fcmpeq16	%f10,	%f16,	%g5
	array32	%l2,	%i6,	%o2
	stb	%i0,	[%l7 + 0x7C]
	movrlz	%i4,	%l1,	%g1
	movrgez	%o1,	0x373,	%i2
	sdivcc	%l0,	0x007F,	%o4
	edge8n	%l4,	%i3,	%l6
	tl	%icc,	0x0
	fmovdle	%icc,	%f13,	%f30
	fmovdcc	%icc,	%f3,	%f29
	membar	0x47
	fnand	%f20,	%f20,	%f24
	or	%o6,	%g3,	%g7
	fmovdvs	%xcc,	%f26,	%f18
	movpos	%icc,	%i5,	%g2
	fbuge,a	%fcc0,	loop_1965
	mova	%icc,	%l3,	%i7
	sdivx	%o7,	0x16BE,	%i1
	fble,a	%fcc2,	loop_1966
loop_1965:
	fbn	%fcc3,	loop_1967
	movrne	%o5,	0x37F,	%o0
	tne	%xcc,	0x3
loop_1966:
	fcmps	%fcc2,	%f31,	%f12
loop_1967:
	umulcc	%o3,	0x0108,	%g4
	movge	%icc,	%l5,	%g5
	ldub	[%l7 + 0x5C],	%l2
	orn	%g6,	0x016E,	%i6
	tneg	%icc,	0x0
	tvs	%icc,	0x4
	fcmpes	%fcc3,	%f2,	%f17
	nop
	setx	loop_1968,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tneg	%icc,	0x3
	lduw	[%l7 + 0x44],	%o2
	tcs	%xcc,	0x5
loop_1968:
	fmovsvc	%icc,	%f9,	%f21
	orn	%i0,	0x0B86,	%i4
	bpos	%xcc,	loop_1969
	fmovdl	%xcc,	%f25,	%f3
	siam	0x6
	wr	%g0,	0x19,	%asi
	ldstuba	[%l7 + 0x40] %asi,	%g1
loop_1969:
	fble,a	%fcc2,	loop_1970
	stbar
	wr	%g0,	0x89,	%asi
	lduba	[%l7 + 0x46] %asi,	%o1
loop_1970:
	array32	%l1,	%l0,	%o4
	fbg,a	%fcc3,	loop_1971
	fpmerge	%f7,	%f18,	%f18
	stb	%i2,	[%l7 + 0x5A]
	fmovrdgz	%i3,	%f12,	%f16
loop_1971:
	fmovdleu	%icc,	%f6,	%f3
	wr	%g0,	0x89,	%asi
	ldsba	[%l7 + 0x3A] %asi,	%l4
	fnands	%f13,	%f8,	%f21
	array32	%o6,	%l6,	%g3
	te	%xcc,	0x3
	and	%g7,	0x0ED1,	%g2
	tn	%xcc,	0x7
	brgez	%l3,	loop_1972
	ldsh	[%l7 + 0x1A],	%i5
	wr	%g0,	0x18,	%asi
	stba	%o7,	[%l7 + 0x57] %asi
loop_1972:
	fcmpes	%fcc1,	%f21,	%f15
	fmovse	%icc,	%f14,	%f31
	fpmerge	%f1,	%f6,	%f10
	addccc	%i1,	%o5,	%o0
	edge16	%o3,	%g4,	%l5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fxors	%f30,	%f6,	%f6
	sra	%i7,	0x12,	%l2
	add	%g5,	0x1756,	%i6
	movle	%xcc,	%o2,	%g6
	movl	%xcc,	%i4,	%i0
	fble,a	%fcc2,	loop_1973
	sdivx	%g1,	0x1BB0,	%o1
	wr	%g0,	0x0c,	%asi
	lduba	[%l7 + 0x72] %asi,	%l0
loop_1973:
	fornot1s	%f18,	%f1,	%f3
	wr	%g0,	0x2b,	%asi
	stwa	%o4,	[%l7 + 0x30] %asi
	membar	#Sync
	sethi	0x07D4,	%i2
	fmovdcs	%icc,	%f5,	%f25
	fones	%f7
	fmovsvs	%icc,	%f29,	%f6
	orn	%l1,	0x13D7,	%i3
	bpos	%icc,	loop_1974
	sra	%o6,	%l6,	%l4
	tsubcc	%g7,	0x0331,	%g2
	andcc	%l3,	%i5,	%o7
loop_1974:
	or	%g3,	0x0CD3,	%i1
	set	0x08, %i0
	lda	[%l7 + %i0] 0x81,	%f0
	addcc	%o5,	%o0,	%o3
	fands	%f10,	%f9,	%f29
	fmovrdlz	%l5,	%f22,	%f12
	tge	%icc,	0x2
	edge8l	%i7,	%g4,	%l2
	bpos,a	%icc,	loop_1975
	fcmpgt16	%f24,	%f22,	%i6
	te	%xcc,	0x5
	tge	%icc,	0x6
loop_1975:
	be	loop_1976
	fmovdgu	%xcc,	%f6,	%f19
	ta	%xcc,	0x0
	fnegs	%f28,	%f8
loop_1976:
	tne	%icc,	0x0
	srlx	%g5,	0x08,	%o2
	movl	%xcc,	%g6,	%i4
	wr	%g0,	0x10,	%asi
	stda	%g0,	[%l7 + 0x48] %asi
	tn	%icc,	0x4
	ta	%icc,	0x7
	fmovdn	%icc,	%f17,	%f1
	call	loop_1977
	brgz,a	%o1,	loop_1978
	fmovrde	%l0,	%f6,	%f18
	lduh	[%l7 + 0x5E],	%i0
loop_1977:
	movge	%xcc,	%o4,	%i2
loop_1978:
	orcc	%l1,	0x181E,	%o6
	alignaddr	%l6,	%l4,	%i3
	srl	%g2,	%l3,	%g7
	bvs,a,pt	%icc,	loop_1979
	smul	%i5,	%o7,	%i1
	movrgez	%o5,	%o0,	%g3
	bcs,a,pn	%xcc,	loop_1980
loop_1979:
	fmovdcc	%icc,	%f8,	%f12
	ta	%xcc,	0x0
	fmovde	%icc,	%f18,	%f6
loop_1980:
	udivcc	%o3,	0x031C,	%l5
	taddcc	%i7,	0x1A40,	%g4
	fblg	%fcc3,	loop_1981
	fnegd	%f8,	%f12
	bneg,a	loop_1982
	array32	%l2,	%i6,	%g5
loop_1981:
	sdivx	%g6,	0x0596,	%o2
	tvs	%xcc,	0x0
loop_1982:
	fzeros	%f30
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sub	%i4,	%o1,	%l0
	fxors	%f15,	%f27,	%f2
	edge32	%i0,	%o4,	%i2
	tneg	%xcc,	0x6
	fmul8sux16	%f6,	%f16,	%f4
	wr	%g0,	0x80,	%asi
	ldswa	[%l7 + 0x40] %asi,	%g1
	fands	%f24,	%f29,	%f31
	edge8n	%l1,	%l6,	%o6
	orcc	%i3,	%l4,	%g2
	sub	%g7,	%l3,	%o7
	move	%icc,	%i1,	%o5
	movvc	%icc,	%o0,	%i5
	nop
	setx	loop_1983,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fmovsne	%icc,	%f21,	%f23
	fmovs	%f15,	%f15
	xorcc	%o3,	0x0445,	%l5
loop_1983:
	alignaddrl	%g3,	%i7,	%l2
	brz	%i6,	loop_1984
	edge16	%g4,	%g6,	%g5
	orncc	%o2,	%o1,	%l0
	edge16l	%i0,	%o4,	%i4
loop_1984:
	addcc	%i2,	0x0AE1,	%g1
	movg	%icc,	%l6,	%o6
	fzeros	%f5
	lduw	[%l7 + 0x4C],	%l1
	brlez,a	%i3,	loop_1985
	bgu,a,pt	%xcc,	loop_1986
	addcc	%g2,	%g7,	%l3
	fpadd32s	%f4,	%f24,	%f14
loop_1985:
	movrgz	%l4,	%i1,	%o7
loop_1986:
	nop
	setx loop_1987, %l0, %l1
	jmpl %l1, %o0
	edge16	%i5,	%o5,	%o3
	udivx	%l5,	0x1498,	%i7
	fmovde	%xcc,	%f11,	%f16
loop_1987:
	membar	0x6A
	srlx	%l2,	%g3,	%i6
	subcc	%g6,	%g5,	%o2
	tvc	%icc,	0x5
	fbuge	%fcc3,	loop_1988
	bn,pn	%xcc,	loop_1989
	bcs,a,pn	%xcc,	loop_1990
	alignaddrl	%o1,	%g4,	%i0
loop_1988:
	fcmpgt16	%f18,	%f26,	%l0
loop_1989:
	fone	%f6
loop_1990:
	bleu,pn	%xcc,	loop_1991
	mulx	%i4,	%i2,	%o4
	umulcc	%g1,	0x110E,	%l6
	popc	%l1,	%i3
loop_1991:
	movl	%xcc,	%g2,	%g7
	mulscc	%o6,	%l4,	%i1
	andn	%o7,	0x14B4,	%l3
	tn	%icc,	0x6
	fone	%f14
	ta	%xcc,	0x1
	fbuge	%fcc2,	loop_1992
	popc	0x1726,	%i5
	bneg,a	loop_1993
	udiv	%o0,	0x04C9,	%o5
loop_1992:
	tl	%icc,	0x6
	sdiv	%o3,	0x15FF,	%l5
loop_1993:
	fbl,a	%fcc1,	loop_1994
	tl	%xcc,	0x6
	mulx	%l2,	0x0B8F,	%g3
	srlx	%i7,	0x1F,	%g6
loop_1994:
	edge8ln	%i6,	%g5,	%o2
	edge16	%o1,	%i0,	%l0
	fcmple16	%f26,	%f2,	%i4
	fpmerge	%f17,	%f0,	%f22
	xnorcc	%g4,	%o4,	%g1
	sra	%l6,	%l1,	%i2
	movrgz	%i3,	0x2EA,	%g2
	movl	%xcc,	%g7,	%l4
	bl	loop_1995
	alignaddr	%o6,	%o7,	%l3
	srax	%i5,	%o0,	%o5
	array16	%i1,	%l5,	%o3
loop_1995:
	bcs,pn	%icc,	loop_1996
	membar	0x72
	fmovde	%icc,	%f26,	%f1
	fbe,a	%fcc3,	loop_1997
loop_1996:
	fmovdcs	%xcc,	%f22,	%f0
	fpack32	%f24,	%f18,	%f16
	tsubcctv	%l2,	%g3,	%g6
loop_1997:
	movpos	%icc,	%i6,	%g5
	edge8ln	%i7,	%o2,	%i0
	be,a,pt	%icc,	loop_1998
	fmuld8sux16	%f5,	%f0,	%f26
	fcmpeq32	%f30,	%f6,	%l0
	wr	%g0,	0x0c,	%asi
	stxa	%i4,	[%l7 + 0x58] %asi
loop_1998:
	nop
	membar	#Sync
	wr	%g0,	0x16,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	umulcc	%g4,	0x1DC9,	%o4
	bpos,pt	%xcc,	loop_1999
	movn	%xcc,	%g1,	%o1
	bvc,pn	%icc,	loop_2000
	ba	%icc,	loop_2001
loop_1999:
	movleu	%xcc,	%l1,	%i2
	movrgz	%l6,	%g2,	%g7
loop_2000:
	tsubcc	%l4,	0x122D,	%o6
loop_2001:
	array8	%o7,	%l3,	%i3
	ldsh	[%l7 + 0x78],	%o0
	fbne,a	%fcc3,	loop_2002
	fbn	%fcc3,	loop_2003
	fmovsvc	%xcc,	%f17,	%f2
	fmovdle	%xcc,	%f23,	%f8
loop_2002:
	fpadd16	%f8,	%f30,	%f18
loop_2003:
	std	%f12,	[%l7 + 0x48]
	andcc	%o5,	%i5,	%i1
	addccc	%o3,	%l5,	%l2
	sdiv	%g3,	0x0E6E,	%g6
	fba,a	%fcc1,	loop_2004
	edge32n	%g5,	%i7,	%o2
	fbul,a	%fcc0,	loop_2005
	movle	%icc,	%i0,	%l0
loop_2004:
	srl	%i6,	%g4,	%i4
	movleu	%icc,	%g1,	%o1
loop_2005:
	fmovdpos	%icc,	%f1,	%f10
	bg,pn	%xcc,	loop_2006
	fsrc1	%f0,	%f6
	brz	%o4,	loop_2007
	tcc	%xcc,	0x5
loop_2006:
	fmovdleu	%xcc,	%f17,	%f13
	edge32	%i2,	%l6,	%g2
loop_2007:
	and	%g7,	%l1,	%o6
	wr	%g0,	0x10,	%asi
	prefetcha	[%l7 + 0x40] %asi,	 0x1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sir	0x0605
	sra	%l3,	%i3,	%l4
	movpos	%xcc,	%o0,	%i5
	brlez	%i1,	loop_2008
	fnot1	%f12,	%f6
	array32	%o5,	%o3,	%l2
	addcc	%l5,	%g6,	%g3
loop_2008:
	movrlz	%g5,	%i7,	%o2
	fxor	%f8,	%f28,	%f22
	fmovdvs	%icc,	%f10,	%f8
	movgu	%xcc,	%l0,	%i0
	movpos	%xcc,	%i6,	%g4
	xor	%i4,	0x033C,	%g1
	bpos,a	loop_2009
	smul	%o1,	0x1032,	%i2
	fmovsge	%icc,	%f24,	%f30
	edge32ln	%o4,	%l6,	%g7
loop_2009:
	andncc	%g2,	%l1,	%o6
	sethi	0x1D81,	%l3
	tle	%icc,	0x3
	set	0x11, %o1
	stba	%o7,	[%l7 + %o1] 0x0c
	fmovsne	%icc,	%f11,	%f1
	tvc	%xcc,	0x1
	xnorcc	%i3,	0x01A8,	%o0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tle	%icc,	0x2
	wr	%g0,	0x80,	%asi
	sta	%f14,	[%l7 + 0x40] %asi
	sra	%l4,	%i1,	%i5
	faligndata	%f18,	%f4,	%f8
	addccc	%o3,	0x04F4,	%o5
	umul	%l2,	%g6,	%l5
	movneg	%icc,	%g3,	%g5
	and	%i7,	%l0,	%i0
	srl	%i6,	%g4,	%i4
	stbar
	srlx	%g1,	0x03,	%o1
	array16	%o2,	%o4,	%l6
	andcc	%i2,	0x1D25,	%g7
	wr	%g0,	0x89,	%asi
	stwa	%l1,	[%l7 + 0x14] %asi
	fbg	%fcc1,	loop_2010
	movrgez	%o6,	%g2,	%l3
	movcc	%xcc,	%i3,	%o0
	set	0x08, %i6
	swapa	[%l7 + %i6] 0x80,	%o7
loop_2010:
	edge16n	%i1,	%l4,	%i5
	tneg	%xcc,	0x1
	wr	%g0,	0x11,	%asi
	stha	%o3,	[%l7 + 0x70] %asi
	movpos	%icc,	%o5,	%l2
	tvc	%xcc,	0x6
	movneg	%xcc,	%l5,	%g3
	sir	0x10BE
	tneg	%xcc,	0x2
	te	%icc,	0x1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddr	%g6,	%g5,	%l0
	ta	%icc,	0x4
	bvc,a,pt	%icc,	loop_2011
	fmovsvs	%xcc,	%f10,	%f3
	tcc	%xcc,	0x7
	fornot1s	%f3,	%f16,	%f2
loop_2011:
	bpos,pt	%icc,	loop_2012
	tgu	%icc,	0x2
	wr	%g0,	0x89,	%asi
	ldswa	[%l7 + 0x74] %asi,	%i7
loop_2012:
	movrgz	%i6,	0x234,	%g4
	movneg	%icc,	%i4,	%g1
	array16	%i0,	%o1,	%o2
	tvc	%xcc,	0x3
	fbn	%fcc3,	loop_2013
	sdiv	%l6,	0x025E,	%i2
	edge32	%g7,	%l1,	%o6
	bgu,pn	%xcc,	loop_2014
loop_2013:
	bneg,a	loop_2015
	tge	%xcc,	0x1
	tgu	%xcc,	0x0
loop_2014:
	movg	%xcc,	%g2,	%l3
loop_2015:
	srl	%i3,	%o0,	%o7
	fmovrsgz	%o4,	%f3,	%f28
	srl	%l4,	%i5,	%o3
	fbu	%fcc1,	loop_2016
	srlx	%i1,	0x09,	%o5
	fmuld8ulx16	%f28,	%f18,	%f24
	brnz	%l5,	loop_2017
loop_2016:
	srax	%l2,	%g6,	%g5
	fcmpeq32	%f12,	%f10,	%g3
	fbl	%fcc0,	loop_2018
loop_2017:
	movneg	%icc,	%l0,	%i6
	ldsb	[%l7 + 0x29],	%i7
	bvs	%icc,	loop_2019
loop_2018:
	tsubcctv	%g4,	0x17E4,	%g1
	movn	%xcc,	%i0,	%o1
	add	%l7,	0x28,	%l6
	wr	%g0,	0x04,	%asi
	lda	[%l6] %asi,	%i4
	casa	[%l6] 0x04,	%i4,	%l6
loop_2019:
	smulcc	%o2,	0x1284,	%g7
	srax	%l1,	%o6,	%g2
	movrgez	%l3,	0x370,	%i3
	bvs,a,pt	%icc,	loop_2020
	fcmpeq32	%f8,	%f4,	%o0
	te	%icc,	0x2
	xor	%i2,	0x1030,	%o7
loop_2020:
	sir	0x15AC
	fandnot2s	%f2,	%f7,	%f7
	tleu	%icc,	0x2
	bneg,a	%icc,	loop_2021
	subccc	%l4,	0x14C3,	%o4
	srl	%o3,	%i1,	%i5
	tsubcctv	%o5,	0x1974,	%l5
loop_2021:
	prefetch	[%l7 + 0x78],	 0x0
	bvs,pn	%xcc,	loop_2022
	tneg	%icc,	0x4
	fba,a	%fcc0,	loop_2023
	movrgz	%l2,	0x0F6,	%g6
loop_2022:
	fmovscc	%icc,	%f13,	%f2
	wr	%g0,	0x11,	%asi
	ldstuba	[%l7 + 0x45] %asi,	%g5
loop_2023:
	movrgez	%g3,	%l0,	%i7
	fmovsge	%xcc,	%f18,	%f6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdl	%xcc,	%f10,	%f0
	tpos	%icc,	0x6
	udivcc	%i6,	0x1457,	%g4
	fmovsgu	%icc,	%f23,	%f29
	andncc	%i0,	%g1,	%o1
	fmovsge	%icc,	%f10,	%f28
	flush	%l7 + 0x4C
	stx	%i4,	[%l7 + 0x68]
	add	%l6,	%g7,	%l1
	fones	%f12
	flush	%l7 + 0x7C
	faligndata	%f28,	%f24,	%f8
	ta	%icc,	0x7
	sethi	0x0472,	%o2
	fbul,a	%fcc0,	loop_2024
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mulscc	%o6,	%l3,	%g2
	wr	%g0,	0x04,	%asi
	ldstuba	[%l7 + 0x3A] %asi,	%o0
loop_2024:
	subcc	%i3,	0x0564,	%o7
	taddcctv	%i2,	0x0851,	%l4
	andn	%o3,	0x1ADE,	%o4
	movvc	%icc,	%i5,	%i1
	movneg	%xcc,	%o5,	%l2
	movg	%icc,	%g6,	%g5
	fsrc2	%f16,	%f16
	movg	%icc,	%g3,	%l5
	fabss	%f5,	%f15
	subc	%l0,	0x11AD,	%i7
	stw	%i6,	[%l7 + 0x78]
	addc	%g4,	%g1,	%o1
	edge8	%i0,	%l6,	%g7
	tcc	%xcc,	0x0
	edge16	%i4,	%o2,	%o6
	ldsh	[%l7 + 0x1A],	%l1
	movre	%l3,	%g2,	%o0
	sra	%i3,	0x17,	%o7
	edge8n	%l4,	%o3,	%i2
	set	0x5C, %i3
	swapa	[%l7 + %i3] 0x81,	%i5
	movleu	%xcc,	%o4,	%o5
	movn	%icc,	%l2,	%i1
	subcc	%g5,	%g3,	%l5
	movrne	%l0,	%g6,	%i6
	tne	%icc,	0x1
	sra	%i7,	0x07,	%g4
	tl	%icc,	0x6
	movrgz	%g1,	%i0,	%l6
	bgu	loop_2025
	fble	%fcc2,	loop_2026
	brz,a	%o1,	loop_2027
	bcs,a,pn	%icc,	loop_2028
loop_2025:
	umulcc	%i4,	0x1473,	%o2
loop_2026:
	andncc	%o6,	%l1,	%g7
loop_2027:
	fone	%f20
loop_2028:
	edge16l	%g2,	%o0,	%i3
	sdivx	%o7,	0x107A,	%l3
	fmovsneg	%icc,	%f0,	%f21
	ldstub	[%l7 + 0x1B],	%l4
	movcc	%xcc,	%o3,	%i5
	fnegs	%f9,	%f29
	tne	%xcc,	0x6
	fmovdvc	%icc,	%f23,	%f18
	movgu	%icc,	%i2,	%o5
	fpmerge	%f12,	%f19,	%f10
	wr	%g0,	0x80,	%asi
	stba	%l2,	[%l7 + 0x68] %asi
	edge8n	%i1,	%o4,	%g3
	fmovsn	%xcc,	%f0,	%f2
	fmovsvc	%icc,	%f24,	%f31
	be	loop_2029
	mulscc	%l5,	%l0,	%g6
	xorcc	%g5,	%i6,	%i7
	movl	%xcc,	%g1,	%g4
loop_2029:
	nop
	setx	loop_2030,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	srlx	%l6,	%o1,	%i4
	movgu	%icc,	%i0,	%o2
	fnor	%f2,	%f26,	%f22
loop_2030:
	ba	%xcc,	loop_2031
	popc	%o6,	%l1
	edge8ln	%g7,	%g2,	%o0
	membar	0x75
loop_2031:
	tsubcctv	%o7,	%l3,	%l4
	fmovd	%f8,	%f6
	sll	%i3,	0x08,	%i5
	sra	%o3,	0x18,	%o5
	movrlz	%i2,	0x01D,	%l2
	movvc	%xcc,	%o4,	%i1
	fpsub32s	%f21,	%f22,	%f7
	movpos	%xcc,	%l5,	%l0
	array32	%g3,	%g5,	%g6
	ldub	[%l7 + 0x60],	%i6
	bvs,a,pn	%xcc,	loop_2032
	umulcc	%g1,	%g4,	%l6
	brz	%i7,	loop_2033
	xnorcc	%i4,	0x099E,	%i0
loop_2032:
	edge32n	%o2,	%o1,	%o6
	stbar
loop_2033:
	nop
	wr	%g0,	0x81,	%asi
	lduwa	[%l7 + 0x28] %asi,	%l1
	fmovsle	%xcc,	%f28,	%f28
	subcc	%g7,	0x0697,	%g2
	bleu,pn	%xcc,	loop_2034
	smulcc	%o0,	%o7,	%l4
	edge32n	%i3,	%l3,	%i5
	ldd	[%l7 + 0x08],	%f10
loop_2034:
	fabss	%f27,	%f20
	fornot1s	%f2,	%f15,	%f1
	move	%xcc,	%o5,	%i2
	fpsub16s	%f15,	%f12,	%f6
	xnorcc	%o3,	%o4,	%i1
	smul	%l2,	0x1CAB,	%l0
	fmovda	%xcc,	%f23,	%f23
	tneg	%xcc,	0x7
	taddcctv	%g3,	%l5,	%g6
	set	0x40, %l6
	ldda	[%l7 + %l6] 0x19,	%f16
	fpack16	%f2,	%f6
	taddcctv	%g5,	%g1,	%i6
	ta	%xcc,	0x0
	sdivcc	%l6,	0x01E4,	%g4
	wr	%g0,	0x0c,	%asi
	ldstuba	[%l7 + 0x72] %asi,	%i7
	movvs	%icc,	%i0,	%o2
	nop
	setx loop_2035, %l0, %l1
	jmpl %l1, %i4
	andcc	%o6,	%o1,	%l1
	wr	%g0,	0x18,	%asi
	ldda	[%l7 + 0x20] %asi,	%g2
loop_2035:
	fbn,a	%fcc0,	loop_2036
	edge8ln	%o0,	%g7,	%l4
	andncc	%i3,	%o7,	%l3
	fmovse	%xcc,	%f8,	%f26
loop_2036:
	fbl,a	%fcc1,	loop_2037
	movn	%xcc,	%o5,	%i2
	mulscc	%o3,	%o4,	%i1
	edge8	%i5,	%l2,	%l0
loop_2037:
	movrgez	%g3,	0x0FA,	%g6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8	%l5,	%g5,	%g1
	movrne	%l6,	0x145,	%g4
	fmovrslz	%i7,	%f23,	%f8
	wr	%g0,	0x80,	%asi
	lduwa	[%l7 + 0x6C] %asi,	%i6
	or	%o2,	%i4,	%i0
	tvs	%icc,	0x3
	movleu	%icc,	%o1,	%o6
	tn	%xcc,	0x1
	ldd	[%l7 + 0x48],	%f24
	siam	0x7
	alignaddr	%g2,	%l1,	%o0
	fmovde	%xcc,	%f17,	%f20
	sethi	0x0CC9,	%l4
	tgu	%icc,	0x0
	movvs	%icc,	%i3,	%o7
	nop
	set	0x34, %l0
	ldsh	[%l7 + %l0],	%l3
	movrlz	%g7,	0x091,	%o5
	tg	%icc,	0x4
	bge,a,pn	%xcc,	loop_2038
	movgu	%xcc,	%i2,	%o4
	fmovsn	%xcc,	%f14,	%f3
	wr	%g0,	0xea,	%asi
	stha	%i1,	[%l7 + 0x28] %asi
	membar	#Sync
loop_2038:
	swap	[%l7 + 0x54],	%i5
	wr	%g0,	0x81,	%asi
	swapa	[%l7 + 0x50] %asi,	%l2
	fpsub32	%f18,	%f18,	%f20
	xor	%l0,	%o3,	%g3
	sdivx	%l5,	0x1327,	%g5
	move	%xcc,	%g1,	%g6
	array32	%l6,	%i7,	%g4
	brlz	%o2,	loop_2039
	fmovrslez	%i4,	%f5,	%f4
	fsrc2s	%f2,	%f7
	tle	%xcc,	0x2
loop_2039:
	edge16ln	%i0,	%o1,	%i6
	nop
	setx	loop_2040,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movpos	%xcc,	%o6,	%g2
	add	%l7,	0x54,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%o0,	%l1
loop_2040:
	fmuld8sux16	%f22,	%f9,	%f16
	fornot1	%f22,	%f14,	%f18
	fmovda	%icc,	%f27,	%f1
	xor	%i3,	0x11FF,	%o7
	movpos	%xcc,	%l3,	%l4
	edge32n	%g7,	%i2,	%o5
	movneg	%xcc,	%i1,	%i5
	xnor	%o4,	%l2,	%o3
	fbu,a	%fcc3,	loop_2041
	array16	%g3,	%l5,	%g5
	set	0x30, %i2
	ldda	[%l7 + %i2] 0x81,	%l0
loop_2041:
	fandnot2s	%f21,	%f28,	%f3
	fmovrslz	%g6,	%f29,	%f16
	movn	%xcc,	%l6,	%i7
	addcc	%g4,	0x02C7,	%o2
	movrne	%i4,	%i0,	%o1
	tg	%icc,	0x1
	fnot1s	%f17,	%f24
	flush	%l7 + 0x40
	fmovdvc	%icc,	%f1,	%f10
	srax	%g1,	0x06,	%o6
	fmuld8ulx16	%f9,	%f1,	%f30
	set	0x78, %o3
	lduha	[%l7 + %o3] 0x10,	%g2
	edge16l	%o0,	%l1,	%i6
	fbl,a	%fcc3,	loop_2042
	tvc	%xcc,	0x7
	andncc	%i3,	%o7,	%l4
	set	0x62, %o6
	stha	%g7,	[%l7 + %o6] 0x27
	membar	#Sync
loop_2042:
	sethi	0x054E,	%l3
	ldsb	[%l7 + 0x27],	%o5
	xnor	%i2,	%i1,	%o4
	udivcc	%i5,	0x0F6A,	%o3
	movcc	%xcc,	%l2,	%l5
	movcc	%xcc,	%g3,	%l0
	addc	%g6,	%l6,	%g5
	movleu	%icc,	%i7,	%g4
	fbug	%fcc2,	loop_2043
	te	%xcc,	0x7
	fornot2	%f30,	%f8,	%f0
	and	%i4,	%o2,	%o1
loop_2043:
	tneg	%icc,	0x6
	fxnors	%f15,	%f6,	%f30
	array8	%g1,	%i0,	%g2
	fnot2s	%f2,	%f22
	fzeros	%f31
	movleu	%icc,	%o0,	%l1
	fmovdleu	%xcc,	%f14,	%f14
	ta	%icc,	0x1
	move	%icc,	%o6,	%i6
	movpos	%icc,	%i3,	%l4
	nop
	setx loop_2044, %l0, %l1
	jmpl %l1, %g7
	fmovsneg	%xcc,	%f20,	%f16
	xnorcc	%o7,	%l3,	%o5
	fcmpne16	%f10,	%f22,	%i2
loop_2044:
	fone	%f12
	fmovdcs	%icc,	%f27,	%f15
	bcs,pt	%icc,	loop_2045
	sdivx	%i1,	0x17D1,	%o4
	ldx	[%l7 + 0x38],	%i5
	fbne,a	%fcc1,	loop_2046
loop_2045:
	tsubcc	%l2,	%l5,	%g3
	fnegd	%f18,	%f24
	fmovrsne	%o3,	%f26,	%f8
loop_2046:
	umulcc	%l0,	%l6,	%g5
	tsubcc	%i7,	%g4,	%i4
	stw	%g6,	[%l7 + 0x2C]
	mova	%icc,	%o2,	%g1
	nop
	setx loop_2047, %l0, %l1
	jmpl %l1, %i0
	movg	%xcc,	%o1,	%g2
	srl	%o0,	%l1,	%o6
	fmovdg	%icc,	%f22,	%f30
loop_2047:
	fpack32	%f20,	%f6,	%f22
	movge	%xcc,	%i3,	%l4
	sub	%i6,	0x1A57,	%g7
	movcc	%xcc,	%l3,	%o5
	fmovsge	%xcc,	%f4,	%f22
	tcs	%icc,	0x5
	movre	%o7,	%i2,	%i1
	or	%i5,	%o4,	%l2
	tcs	%xcc,	0x0
	movrlez	%l5,	%o3,	%g3
	tne	%xcc,	0x2
	movrne	%l0,	0x2E3,	%l6
	movvs	%xcc,	%g5,	%g4
	edge32	%i4,	%g6,	%i7
	bn,a,pn	%xcc,	loop_2048
	tcs	%xcc,	0x6
	fmovs	%f11,	%f12
	wr	%g0,	0x11,	%asi
	stda	%g0,	[%l7 + 0x48] %asi
loop_2048:
	mulscc	%o2,	%i0,	%g2
	fmovdne	%xcc,	%f5,	%f21
	xor	%o1,	%o0,	%o6
	tg	%icc,	0x4
	fmovrslez	%l1,	%f25,	%f21
	srax	%i3,	0x06,	%i6
	srl	%g7,	0x12,	%l4
	edge32ln	%o5,	%o7,	%i2
	sdivcc	%i1,	0x039C,	%i5
	set	0x6A, %l1
	ldsha	[%l7 + %l1] 0x18,	%o4
	fxor	%f10,	%f28,	%f20
	fxors	%f26,	%f5,	%f21
	membar	#Sync
	set	0x40, %i4
	ldda	[%l7 + %i4] 0xf1,	%f16
	fbne	%fcc3,	loop_2049
	fnors	%f20,	%f11,	%f6
	lduh	[%l7 + 0x16],	%l3
	lduw	[%l7 + 0x4C],	%l5
loop_2049:
	movrgez	%l2,	%g3,	%o3
	sllx	%l6,	0x00,	%g5
	umul	%g4,	%i4,	%g6
	sllx	%i7,	0x00,	%l0
	tn	%xcc,	0x0
	flush	%l7 + 0x74
	and	%g1,	%o2,	%i0
	add	%l7,	0x70,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%g2,	%o1
	fbl	%fcc1,	loop_2050
	sub	%o0,	0x1773,	%l1
	srax	%i3,	%i6,	%o6
	ta	%icc,	0x3
loop_2050:
	xnorcc	%g7,	%o5,	%o7
	add	%l7,	0x54,	%l6
	wr	%g0,	0x11,	%asi
	lda	[%l6] %asi,	%l4
	casa	[%l6] 0x11,	%l4,	%i1
	fmul8x16au	%f25,	%f19,	%f0
	ldsw	[%l7 + 0x20],	%i5
	fzeros	%f21
	taddcctv	%i2,	%l3,	%l5
	fmovs	%f14,	%f29
	ta	%icc,	0x6
	wr	%g0,	0x19,	%asi
	sta	%f23,	[%l7 + 0x1C] %asi
	fbe,a	%fcc3,	loop_2051
	edge8ln	%l2,	%o4,	%o3
	sethi	0x0DEE,	%g3
	fcmpne16	%f26,	%f28,	%l6
loop_2051:
	tsubcc	%g5,	%g4,	%g6
	movge	%xcc,	%i4,	%l0
	sth	%i7,	[%l7 + 0x7A]
	edge16l	%g1,	%o2,	%g2
	udivcc	%i0,	0x10F7,	%o1
	udiv	%o0,	0x0D7E,	%l1
	fpadd32	%f28,	%f18,	%f12
	fmovdn	%icc,	%f30,	%f4
	tcs	%icc,	0x1
	call	loop_2052
	fmovrsgz	%i3,	%f3,	%f18
	ldsw	[%l7 + 0x18],	%o6
	fnand	%f28,	%f26,	%f2
loop_2052:
	tpos	%icc,	0x4
	fmovdle	%xcc,	%f6,	%f21
	xorcc	%i6,	%o5,	%o7
	bvs,pn	%icc,	loop_2053
	udivx	%l4,	0x1ED1,	%i1
	taddcc	%g7,	0x1B31,	%i2
	fmovsle	%icc,	%f26,	%f24
loop_2053:
	alignaddrl	%i5,	%l3,	%l2
	fornot2	%f0,	%f26,	%f24
	sra	%o4,	%o3,	%l5
	tvc	%icc,	0x3
	edge16n	%l6,	%g3,	%g5
	stw	%g6,	[%l7 + 0x78]
	fmovrde	%g4,	%f20,	%f24
	smul	%i4,	0x0FF2,	%l0
	fmovrdgz	%i7,	%f24,	%f26
	std	%f16,	[%l7 + 0x58]
	tne	%xcc,	0x5
	edge8ln	%o2,	%g1,	%g2
	bcs,pn	%icc,	loop_2054
	udiv	%i0,	0x1F43,	%o0
	srlx	%o1,	%i3,	%l1
	ldsb	[%l7 + 0x33],	%i6
loop_2054:
	bgu,pt	%xcc,	loop_2055
	brgz	%o5,	loop_2056
	bg	loop_2057
	edge16n	%o6,	%o7,	%i1
loop_2055:
	bcc,pn	%icc,	loop_2058
loop_2056:
	array16	%l4,	%g7,	%i2
loop_2057:
	movvc	%xcc,	%l3,	%l2
	nop
	setx	loop_2059,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_2058:
	te	%xcc,	0x4
	bvc,a,pt	%xcc,	loop_2060
	tneg	%xcc,	0x1
loop_2059:
	umul	%i5,	%o3,	%l5
	fmovde	%icc,	%f28,	%f0
loop_2060:
	std	%f14,	[%l7 + 0x38]
	xnor	%l6,	%o4,	%g3
	xnorcc	%g6,	0x01A5,	%g5
	edge8l	%g4,	%l0,	%i7
	fmovsvc	%xcc,	%f20,	%f18
	xnorcc	%i4,	%o2,	%g1
	wr	%g0,	0x19,	%asi
	lduba	[%l7 + 0x4D] %asi,	%g2
	wr	%g0,	0x0c,	%asi
	ldstuba	[%l7 + 0x37] %asi,	%i0
	srax	%o0,	%i3,	%l1
	movleu	%xcc,	%o1,	%o5
	fmovd	%f16,	%f8
	edge32ln	%o6,	%i6,	%i1
	edge16ln	%o7,	%l4,	%g7
	fmovd	%f26,	%f4
	movgu	%icc,	%l3,	%i2
	edge32	%i5,	%l2,	%o3
	bleu,a	loop_2061
	fmovscc	%icc,	%f0,	%f31
	fnot1s	%f21,	%f29
	sdiv	%l5,	0x0B2D,	%o4
loop_2061:
	ldsh	[%l7 + 0x36],	%g3
	sdiv	%g6,	0x1102,	%l6
	andncc	%g5,	%l0,	%g4
	movg	%icc,	%i4,	%i7
	fbl	%fcc2,	loop_2062
	edge8	%o2,	%g2,	%i0
	edge16n	%g1,	%o0,	%i3
	array16	%o1,	%o5,	%o6
loop_2062:
	fmovdgu	%xcc,	%f6,	%f17
	andncc	%l1,	%i1,	%i6
	sth	%l4,	[%l7 + 0x62]
	or	%o7,	0x0B96,	%g7
	fand	%f26,	%f6,	%f26
	orcc	%l3,	0x17F7,	%i2
	movl	%xcc,	%l2,	%i5
	brz,a	%o3,	loop_2063
	orn	%l5,	%o4,	%g6
	movre	%l6,	%g5,	%l0
	sir	0x1806
loop_2063:
	nop
	wr	%g0,	0x81,	%asi
	lduba	[%l7 + 0x4C] %asi,	%g3
	fmovdn	%icc,	%f10,	%f21
	movre	%g4,	0x3F3,	%i4
	fsrc2	%f12,	%f28
	tsubcctv	%i7,	0x0053,	%o2
	fbe,a	%fcc1,	loop_2064
	edge32ln	%i0,	%g2,	%g1
	fmovdneg	%icc,	%f8,	%f26
	andn	%i3,	0x11FD,	%o1
loop_2064:
	fmul8x16al	%f21,	%f2,	%f18
	ldx	[%l7 + 0x58],	%o5
	array8	%o0,	%o6,	%l1
	subccc	%i6,	%i1,	%l4
	add	%g7,	%o7,	%l3
	sethi	0x1AA5,	%i2
	edge16l	%i5,	%o3,	%l5
	taddcc	%l2,	0x0A15,	%o4
	movcc	%xcc,	%l6,	%g6
	movle	%icc,	%g5,	%l0
	fnors	%f6,	%f1,	%f0
	fcmpgt16	%f26,	%f2,	%g3
	movpos	%xcc,	%g4,	%i7
	fbule	%fcc3,	loop_2065
	fbn,a	%fcc3,	loop_2066
	tvc	%xcc,	0x7
	and	%i4,	0x1EFB,	%i0
loop_2065:
	tcc	%xcc,	0x4
loop_2066:
	tge	%xcc,	0x1
	addccc	%o2,	%g1,	%g2
	mova	%xcc,	%i3,	%o1
	move	%icc,	%o5,	%o0
	fnegs	%f5,	%f22
	sll	%l1,	%o6,	%i1
	fnegs	%f26,	%f3
	fxnors	%f8,	%f26,	%f16
	edge16ln	%l4,	%i6,	%o7
	or	%l3,	0x0EED,	%g7
	movrlez	%i5,	0x087,	%i2
	sub	%o3,	%l5,	%o4
	tsubcc	%l2,	0x0701,	%l6
	subc	%g6,	%g5,	%l0
	fbule	%fcc2,	loop_2067
	fcmpgt32	%f0,	%f4,	%g3
	subc	%i7,	%i4,	%g4
	movre	%i0,	%o2,	%g1
loop_2067:
	tn	%icc,	0x1
	fandnot2s	%f4,	%f12,	%f0
	alignaddrl	%g2,	%i3,	%o5
	fmovd	%f6,	%f14
	tvc	%icc,	0x2
	edge32	%o0,	%l1,	%o6
	movge	%xcc,	%o1,	%l4
	movpos	%xcc,	%i6,	%i1
	movre	%l3,	0x1CD,	%o7
	brlez,a	%i5,	loop_2068
	taddcc	%g7,	%i2,	%l5
	nop
	set	0x27, %g2
	stb	%o3,	[%l7 + %g2]
	fmovrdgez	%l2,	%f30,	%f14
loop_2068:
	alignaddrl	%l6,	%g6,	%o4
	fsrc1s	%f27,	%f23
	te	%icc,	0x5
	fmovsg	%icc,	%f30,	%f10
	bvs	%icc,	loop_2069
	tneg	%xcc,	0x0
	bcc,a,pn	%icc,	loop_2070
	umulcc	%l0,	%g3,	%i7
loop_2069:
	umul	%g5,	0x0D6A,	%g4
	movrgez	%i0,	%o2,	%g1
loop_2070:
	tle	%icc,	0x4
	tge	%xcc,	0x4
	tvs	%xcc,	0x0
	fpmerge	%f17,	%f0,	%f26
	fnand	%f26,	%f10,	%f2
	movvc	%xcc,	%i4,	%i3
	andcc	%g2,	%o5,	%l1
	edge16l	%o6,	%o1,	%o0
	sir	0x0570
	fcmpeq16	%f14,	%f24,	%i6
	edge16l	%i1,	%l4,	%l3
	popc	0x12CC,	%o7
	lduh	[%l7 + 0x58],	%g7
	bl	loop_2071
	fexpand	%f2,	%f8
	movcs	%xcc,	%i2,	%i5
	bne	%xcc,	loop_2072
loop_2071:
	fsrc1	%f20,	%f12
	tge	%icc,	0x4
	be	%icc,	loop_2073
loop_2072:
	sir	0x1F9B
	siam	0x7
	tvs	%icc,	0x3
loop_2073:
	movrlez	%l5,	%o3,	%l2
	fcmple32	%f4,	%f30,	%g6
	subc	%l6,	%o4,	%l0
	bleu,a	loop_2074
	sdivx	%g3,	0x12D6,	%i7
	alignaddr	%g4,	%g5,	%o2
	edge16ln	%g1,	%i0,	%i3
loop_2074:
	movle	%icc,	%i4,	%o5
	fornot1	%f2,	%f24,	%f28
	bgu,pn	%icc,	loop_2075
	movne	%icc,	%g2,	%o6
	andcc	%l1,	0x1F10,	%o1
	bpos,a	%icc,	loop_2076
loop_2075:
	edge32	%o0,	%i1,	%i6
	sra	%l4,	%o7,	%l3
	umulcc	%g7,	%i5,	%l5
loop_2076:
	mulscc	%o3,	%i2,	%g6
	ldub	[%l7 + 0x13],	%l2
	umul	%o4,	0x072B,	%l6
	movn	%xcc,	%g3,	%i7
	movle	%icc,	%l0,	%g4
	wr	%g0,	0x19,	%asi
	ldstuba	[%l7 + 0x0D] %asi,	%o2
	fxors	%f24,	%f1,	%f17
	stb	%g5,	[%l7 + 0x2A]
	fxors	%f12,	%f1,	%f26
	set	0x54, %o2
	stwa	%i0,	[%l7 + %o2] 0x14
	bg,a,pn	%xcc,	loop_2077
	edge8n	%i3,	%g1,	%i4
	bgu,a,pn	%xcc,	loop_2078
	taddcctv	%g2,	%o5,	%l1
loop_2077:
	tsubcc	%o1,	0x176D,	%o0
	xnor	%o6,	0x1F10,	%i6
loop_2078:
	fmovsl	%icc,	%f1,	%f30
	fbule,a	%fcc3,	loop_2079
	tleu	%icc,	0x4
	sdivcc	%i1,	0x0558,	%o7
	lduw	[%l7 + 0x2C],	%l3
loop_2079:
	add	%g7,	0x0388,	%i5
	taddcctv	%l5,	0x07D8,	%l4
	umulcc	%o3,	0x1EA6,	%g6
	tleu	%xcc,	0x3
	movvs	%icc,	%l2,	%i2
	srax	%l6,	%o4,	%g3
	movrne	%i7,	0x081,	%l0
	edge8	%o2,	%g4,	%i0
	ldsw	[%l7 + 0x5C],	%i3
	fbue	%fcc0,	loop_2080
	movge	%xcc,	%g5,	%i4
	fpack16	%f12,	%f19
	and	%g2,	%g1,	%l1
loop_2080:
	siam	0x7
	alignaddr	%o5,	%o0,	%o6
	st	%f27,	[%l7 + 0x28]
	subccc	%i6,	%i1,	%o7
	fpsub16	%f2,	%f22,	%f8
	tgu	%xcc,	0x0
	edge16ln	%o1,	%g7,	%i5
	stbar
	tge	%icc,	0x4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fors	%f22,	%f19,	%f21
	smulcc	%l5,	%l4,	%l3
	tn	%icc,	0x6
	ldx	[%l7 + 0x08],	%o3
	srax	%l2,	0x0B,	%g6
	umulcc	%i2,	%l6,	%g3
	bl,pn	%icc,	loop_2081
	movneg	%xcc,	%o4,	%l0
	membar	0x0A
	movleu	%icc,	%i7,	%o2
loop_2081:
	alignaddrl	%i0,	%i3,	%g5
	movrlez	%i4,	0x010,	%g4
	lduw	[%l7 + 0x20],	%g2
	or	%g1,	0x1C88,	%l1
	fmovsge	%xcc,	%f3,	%f13
	orcc	%o0,	%o5,	%o6
	fbule,a	%fcc0,	loop_2082
	movrlz	%i1,	0x337,	%o7
	movpos	%icc,	%o1,	%i6
	bg,pn	%xcc,	loop_2083
loop_2082:
	movle	%icc,	%g7,	%i5
	movcs	%icc,	%l5,	%l4
	edge8n	%l3,	%o3,	%g6
loop_2083:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sethi	0x00C1,	%l2
	bshuffle	%f22,	%f0,	%f10
	edge32n	%l6,	%i2,	%g3
	tne	%xcc,	0x7
	wr	%g0,	0xea,	%asi
	stda	%o4,	[%l7 + 0x78] %asi
	membar	#Sync
	addcc	%i7,	0x1760,	%l0
	xorcc	%o2,	0x1A81,	%i3
	wr	%g0,	0x58,	%asi
	ldxa	[%g0 + 0x30] %asi,	%g5
	tl	%icc,	0x3
	tsubcc	%i4,	%i0,	%g4
	fmovd	%f28,	%f22
	sdivx	%g2,	0x098D,	%l1
	edge16l	%o0,	%o5,	%o6
	tvs	%icc,	0x2
	fcmpgt32	%f20,	%f8,	%g1
	bne,a	loop_2084
	tvc	%icc,	0x1
	bl,a	%icc,	loop_2085
	ldx	[%l7 + 0x78],	%o7
loop_2084:
	sdivcc	%i1,	0x1487,	%i6
	udivx	%o1,	0x1EFF,	%g7
loop_2085:
	edge32l	%l5,	%l4,	%i5
	te	%xcc,	0x5
	edge8n	%l3,	%g6,	%o3
	fble,a	%fcc1,	loop_2086
	orncc	%l6,	0x0681,	%i2
	std	%f8,	[%l7 + 0x28]
	bvc,a,pt	%icc,	loop_2087
loop_2086:
	fpack16	%f14,	%f24
	andcc	%l2,	0x092C,	%o4
	fcmpeq16	%f20,	%f4,	%i7
loop_2087:
	edge8	%g3,	%o2,	%i3
	stbar
	orn	%l0,	0x02E8,	%i4
	addccc	%i0,	0x1C62,	%g4
	tsubcctv	%g2,	%l1,	%g5
	nop
	setx loop_2088, %l0, %l1
	jmpl %l1, %o0
	sll	%o6,	%g1,	%o7
	taddcctv	%o5,	0x0182,	%i6
	xnor	%o1,	0x1F74,	%g7
loop_2088:
	nop
	set	0x5E, %i7
	ldsha	[%l7 + %i7] 0x10,	%l5
	move	%icc,	%l4,	%i1
	udiv	%l3,	0x0A27,	%i5
	fmovsa	%xcc,	%f14,	%f24
	fcmpne16	%f14,	%f4,	%o3
	movl	%icc,	%g6,	%l6
	movleu	%icc,	%l2,	%o4
	fmul8ulx16	%f24,	%f6,	%f8
	movleu	%xcc,	%i2,	%g3
	fcmple16	%f22,	%f2,	%o2
	fmovdge	%xcc,	%f30,	%f5
	udivx	%i3,	0x1AF1,	%i7
	andcc	%i4,	%i0,	%g4
	brz,a	%g2,	loop_2089
	flush	%l7 + 0x54
	fcmpne32	%f10,	%f20,	%l1
	udivx	%g5,	0x1860,	%l0
loop_2089:
	bne	loop_2090
	movle	%icc,	%o6,	%o0
	edge16n	%o7,	%o5,	%i6
	edge16n	%g1,	%g7,	%o1
loop_2090:
	movrgez	%l4,	%l5,	%i1
	wr	%g0,	0x89,	%asi
	lda	[%l7 + 0x6C] %asi,	%f8
	set	0x40, %o0
	stda	%f0,	[%l7 + %o0] 0x0c
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbge,a	%fcc2,	loop_2091
	bl,a	loop_2092
	alignaddr	%i5,	%l3,	%o3
	movrne	%l6,	%l2,	%g6
loop_2091:
	edge8ln	%i2,	%o4,	%o2
loop_2092:
	movcs	%xcc,	%g3,	%i7
	te	%xcc,	0x0
	sir	0x031E
	fmovdl	%icc,	%f20,	%f14
	fmovdge	%icc,	%f25,	%f15
	fcmpne16	%f2,	%f14,	%i4
	tne	%icc,	0x4
	tsubcctv	%i0,	%g4,	%g2
	fmovd	%f18,	%f28
	udivx	%l1,	0x1FA3,	%i3
	siam	0x0
	edge8ln	%g5,	%o6,	%o0
	movneg	%xcc,	%o7,	%o5
	fmovs	%f30,	%f21
	smul	%l0,	0x0F56,	%i6
	fmovrslz	%g1,	%f6,	%f11
	bgu,a,pn	%icc,	loop_2093
	flush	%l7 + 0x7C
	fcmpeq16	%f16,	%f26,	%o1
	mulscc	%g7,	%l5,	%l4
loop_2093:
	sra	%i1,	0x16,	%i5
	array16	%o3,	%l3,	%l2
	tsubcc	%g6,	0x01EC,	%i2
	fxor	%f14,	%f2,	%f0
	movrne	%l6,	%o2,	%g3
	srlx	%o4,	0x1C,	%i4
	fnegd	%f16,	%f0
	fmovsa	%xcc,	%f6,	%f14
	fmovdleu	%icc,	%f26,	%f20
	fmovs	%f26,	%f2
	sllx	%i7,	0x0C,	%g4
	sdivx	%g2,	0x1C66,	%l1
	ldsh	[%l7 + 0x40],	%i0
	popc	0x0D9E,	%g5
	fmovrsgez	%i3,	%f26,	%f9
	xnor	%o0,	0x1B54,	%o7
	stw	%o6,	[%l7 + 0x24]
	wr	%g0,	0x81,	%asi
	lduwa	[%l7 + 0x20] %asi,	%o5
	prefetch	[%l7 + 0x50],	 0x0
	movle	%xcc,	%l0,	%g1
	bvc,a	%xcc,	loop_2094
	alignaddrl	%o1,	%i6,	%l5
	fmovrsgez	%l4,	%f7,	%f24
	set	0x67, %l3
	ldstuba	[%l7 + %l3] 0x89,	%g7
loop_2094:
	edge32ln	%i5,	%i1,	%l3
	movcs	%icc,	%o3,	%l2
	smul	%g6,	0x1E82,	%l6
	prefetch	[%l7 + 0x60],	 0x2
	or	%i2,	%o2,	%g3
	movrlez	%o4,	0x2B9,	%i4
	edge16l	%i7,	%g4,	%l1
	xorcc	%i0,	%g5,	%g2
	set	0x54, %o5
	lduwa	[%l7 + %o5] 0x14,	%o0
	addccc	%o7,	%i3,	%o5
	fbl,a	%fcc0,	loop_2095
	fnot1s	%f31,	%f2
	tpos	%icc,	0x6
	srax	%l0,	%g1,	%o6
loop_2095:
	mova	%xcc,	%o1,	%l5
	edge16	%i6,	%l4,	%i5
	smul	%g7,	0x02AE,	%i1
	umul	%o3,	%l3,	%l2
	fmovs	%f16,	%f20
	fmovdcc	%xcc,	%f3,	%f16
	movl	%icc,	%l6,	%g6
	ld	[%l7 + 0x74],	%f26
	edge8	%i2,	%g3,	%o2
	fcmpeq32	%f14,	%f0,	%i4
	subc	%o4,	0x1019,	%i7
	wr	%g0,	0x2a,	%asi
	stwa	%g4,	[%l7 + 0x28] %asi
	membar	#Sync
	movvc	%icc,	%l1,	%g5
	umul	%g2,	%i0,	%o0
	fone	%f0
	wr	%g0,	0x89,	%asi
	ldswa	[%l7 + 0x3C] %asi,	%i3
	fornot2s	%f13,	%f5,	%f20
	st	%f12,	[%l7 + 0x48]
	movge	%icc,	%o7,	%o5
	ld	[%l7 + 0x0C],	%f29
	tle	%xcc,	0x7
	fmovdge	%icc,	%f28,	%f2
	and	%g1,	%o6,	%o1
	addcc	%l0,	%l5,	%i6
	bg,a	loop_2096
	fmovdvc	%icc,	%f20,	%f14
	addc	%l4,	%g7,	%i1
	fmovsge	%icc,	%f3,	%f19
loop_2096:
	nop
	wr	%g0,	0x04,	%asi
	ldswa	[%l7 + 0x70] %asi,	%i5
	udivcc	%o3,	0x0802,	%l2
	movle	%xcc,	%l3,	%l6
	tl	%xcc,	0x3
	array16	%i2,	%g3,	%o2
	taddcctv	%g6,	0x1673,	%o4
	set	0x40, %g7
	ldstuba	[%l7 + %g7] 0x81,	%i7
	movn	%xcc,	%i4,	%g4
	ba,a	loop_2097
	edge32ln	%g5,	%g2,	%i0
	edge16	%l1,	%o0,	%o7
	mova	%xcc,	%i3,	%o5
loop_2097:
	srl	%o6,	0x04,	%g1
	sdivx	%o1,	0x192D,	%l0
	tg	%icc,	0x1
	udiv	%l5,	0x0045,	%i6
	udivcc	%l4,	0x153E,	%i1
	fbug,a	%fcc3,	loop_2098
	fmovs	%f19,	%f10
	stbar
	ldsw	[%l7 + 0x64],	%i5
loop_2098:
	nop
	set	0x58, %l2
	stha	%g7,	[%l7 + %l2] 0xe3
	membar	#Sync
	bgu	%icc,	loop_2099
	bg,a	%icc,	loop_2100
	edge8l	%o3,	%l3,	%l6
	bg,a,pn	%xcc,	loop_2101
loop_2099:
	stb	%l2,	[%l7 + 0x58]
loop_2100:
	tgu	%icc,	0x7
	fmovscs	%icc,	%f23,	%f10
loop_2101:
	nop
	set	0x68, %o4
	stda	%g2,	[%l7 + %o4] 0xe3
	membar	#Sync
	mulscc	%i2,	0x13A8,	%g6
	fpsub32s	%f9,	%f2,	%f5
	movge	%xcc,	%o4,	%i7
	fcmpne16	%f10,	%f30,	%i4
	sll	%o2,	%g5,	%g4
	andn	%i0,	0x1F1C,	%l1
	edge8ln	%o0,	%g2,	%i3
	fmovdle	%icc,	%f6,	%f3
	alignaddrl	%o5,	%o7,	%o6
	fornot1	%f6,	%f20,	%f4
	movvs	%icc,	%g1,	%l0
	fmovrdlz	%l5,	%f28,	%f12
	taddcctv	%i6,	%o1,	%l4
	movcs	%xcc,	%i1,	%i5
	sll	%g7,	0x17,	%l3
	wr	%g0,	0x11,	%asi
	lduba	[%l7 + 0x0C] %asi,	%o3
	subccc	%l2,	0x096D,	%l6
	fornot2	%f0,	%f26,	%f12
	movrgz	%g3,	0x0ED,	%g6
	fornot2	%f4,	%f20,	%f8
	set	0x48, %l4
	stda	%i2,	[%l7 + %l4] 0x18
	and	%o4,	%i4,	%i7
	fnegd	%f26,	%f2
	fblg,a	%fcc2,	loop_2102
	edge32n	%o2,	%g4,	%g5
	fmovsleu	%xcc,	%f17,	%f11
	tpos	%icc,	0x0
loop_2102:
	nop
	wr	%g0,	0xe2,	%asi
	stha	%i0,	[%l7 + 0x30] %asi
	membar	#Sync
	edge8l	%l1,	%g2,	%o0
	andncc	%i3,	%o7,	%o5
	edge32l	%o6,	%g1,	%l5
	sdivcc	%i6,	0x1145,	%l0
	movgu	%icc,	%o1,	%i1
	te	%xcc,	0x2
	membar	0x4F
	xorcc	%i5,	0x1B9B,	%g7
	mova	%icc,	%l4,	%o3
	srl	%l3,	0x1A,	%l2
	set	0x2C, %o7
	lduwa	[%l7 + %o7] 0x04,	%l6
	subcc	%g6,	0x0556,	%i2
	srax	%o4,	%g3,	%i7
	array8	%i4,	%g4,	%o2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udivx	%g5,	0x026F,	%i0
	fmovsleu	%xcc,	%f10,	%f30
	fabsd	%f16,	%f24
	movvs	%icc,	%g2,	%o0
	umulcc	%l1,	0x08A2,	%o7
	tgu	%icc,	0x6
	alignaddr	%i3,	%o6,	%g1
	be,a	%xcc,	loop_2103
	movcc	%icc,	%l5,	%o5
	bvc,a,pn	%xcc,	loop_2104
	mova	%icc,	%i6,	%o1
loop_2103:
	ble	loop_2105
	fbul	%fcc2,	loop_2106
loop_2104:
	movle	%icc,	%l0,	%i5
	fandnot1	%f10,	%f18,	%f2
loop_2105:
	fsrc1	%f8,	%f2
loop_2106:
	fcmpeq32	%f14,	%f26,	%g7
	ldsh	[%l7 + 0x40],	%i1
	st	%f3,	[%l7 + 0x50]
	wr	%g0,	0x11,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	fbul,a	%fcc2,	loop_2107
	fmovdn	%xcc,	%f3,	%f1
	sir	0x1AD2
	sdivx	%o3,	0x14DB,	%l3
loop_2107:
	tvc	%xcc,	0x0
	fzeros	%f2
	movcs	%xcc,	%l4,	%l6
	tcs	%xcc,	0x0
	array16	%l2,	%g6,	%i2
	movrgz	%g3,	%i7,	%i4
	wr	%g0,	0x89,	%asi
	stda	%g4,	[%l7 + 0x10] %asi
	edge32	%o2,	%o4,	%g5
	movne	%icc,	%i0,	%g2
	tsubcc	%l1,	%o0,	%o7
	sll	%i3,	0x1C,	%o6
	edge32ln	%g1,	%l5,	%i6
	brgz,a	%o1,	loop_2108
	smulcc	%l0,	%i5,	%g7
	ldsh	[%l7 + 0x24],	%i1
	fmovdl	%icc,	%f10,	%f24
loop_2108:
	movleu	%xcc,	%o3,	%l3
	ldstub	[%l7 + 0x6A],	%o5
	move	%xcc,	%l4,	%l6
	alignaddrl	%l2,	%i2,	%g3
	fbue,a	%fcc1,	loop_2109
	movcs	%xcc,	%g6,	%i4
	stbar
	edge8ln	%i7,	%o2,	%o4
loop_2109:
	bgu,pn	%icc,	loop_2110
	swap	[%l7 + 0x14],	%g5
	set	0x70, %g6
	stxa	%i0,	[%l7 + %g6] 0x81
loop_2110:
	mulx	%g4,	0x1920,	%g2
	mova	%xcc,	%l1,	%o0
	movgu	%xcc,	%i3,	%o7
	movpos	%icc,	%g1,	%l5
	fsrc1	%f8,	%f2
	xnorcc	%i6,	%o1,	%l0
	fcmpes	%fcc3,	%f30,	%f27
	umul	%o6,	0x0D8F,	%g7
	orncc	%i1,	%i5,	%l3
	movle	%xcc,	%o3,	%l4
	subccc	%l6,	%o5,	%l2
	sth	%i2,	[%l7 + 0x24]
	brlez	%g6,	loop_2111
	stx	%g3,	[%l7 + 0x20]
	movle	%icc,	%i7,	%i4
	udivcc	%o4,	0x1D85,	%g5
loop_2111:
	fmovrsgez	%o2,	%f29,	%f24
	fmovrslez	%i0,	%f20,	%f11
	andcc	%g4,	%l1,	%o0
	movvs	%icc,	%i3,	%o7
	sub	%g2,	0x0EA6,	%l5
	fsrc1	%f14,	%f4
	set	0x60, %g5
	ldda	[%l7 + %g5] 0x24,	%g0
	tvs	%xcc,	0x3
	add	%i6,	0x0024,	%o1
	bvc,a	loop_2112
	tcs	%xcc,	0x0
	movne	%icc,	%o6,	%l0
	add	%i1,	0x1F14,	%i5
loop_2112:
	edge32l	%g7,	%l3,	%l4
	sll	%l6,	%o5,	%l2
	sll	%o3,	%g6,	%i2
	bl,a,pn	%xcc,	loop_2113
	fmovdge	%icc,	%f27,	%f23
	bcs,a	loop_2114
	tg	%xcc,	0x5
loop_2113:
	movcs	%xcc,	%i7,	%g3
	add	%l7,	0x68,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%i4,	%g5
loop_2114:
	fba,a	%fcc1,	loop_2115
	movneg	%icc,	%o4,	%i0
	tleu	%xcc,	0x4
	tpos	%xcc,	0x3
loop_2115:
	srlx	%o2,	%g4,	%l1
	fmovdvc	%xcc,	%f15,	%f19
	fmovdvc	%xcc,	%f17,	%f20
	fxnor	%f30,	%f28,	%f20
	xnorcc	%o0,	0x052A,	%o7
	ldx	[%l7 + 0x60],	%i3
	movrgez	%l5,	%g2,	%g1
	orn	%i6,	0x19F9,	%o1
	array32	%l0,	%o6,	%i5
	fbug	%fcc0,	loop_2116
	movne	%icc,	%i1,	%l3
	fone	%f0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2116:
	sll	%g7,	0x19,	%l6
	tsubcc	%o5,	0x03FD,	%l4
	movleu	%icc,	%l2,	%g6
	fcmpne16	%f10,	%f10,	%o3
	andn	%i7,	%g3,	%i2
	sll	%i4,	0x12,	%o4
	sll	%i0,	0x00,	%o2
	tle	%xcc,	0x2
	edge32ln	%g5,	%l1,	%o0
	fcmpd	%fcc3,	%f4,	%f18
	add	%o7,	%i3,	%g4
	fabss	%f6,	%f7
	membar	0x04
	ldsw	[%l7 + 0x44],	%g2
	edge8ln	%l5,	%i6,	%g1
	smulcc	%o1,	%l0,	%o6
	nop
	set	0x28, %i1
	lduh	[%l7 + %i1],	%i5
	udivcc	%i1,	0x1586,	%l3
	array32	%g7,	%o5,	%l4
	bl	%icc,	loop_2117
	edge8l	%l6,	%l2,	%o3
	ldsh	[%l7 + 0x38],	%i7
	set	0x72, %g3
	ldsba	[%l7 + %g3] 0x18,	%g6
loop_2117:
	fpack16	%f30,	%f21
	movrgz	%i2,	0x2F0,	%i4
	edge8ln	%g3,	%o4,	%i0
	addccc	%g5,	%l1,	%o2
	fmovsgu	%icc,	%f1,	%f11
	fmul8x16au	%f4,	%f15,	%f8
	subc	%o0,	%i3,	%g4
	fnot2	%f12,	%f30
	tl	%icc,	0x4
	fmovrsne	%g2,	%f19,	%f25
	subccc	%l5,	%i6,	%g1
	udivcc	%o1,	0x0BD9,	%o7
	fmovsle	%xcc,	%f6,	%f30
	tg	%xcc,	0x0
	tl	%xcc,	0x1
	movle	%icc,	%o6,	%i5
	wr	%g0,	0x88,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	edge32n	%i1,	%l3,	%l0
	set	0x44, %l5
	ldswa	[%l7 + %l5] 0x10,	%g7
	movle	%xcc,	%o5,	%l4
	bne,a,pn	%icc,	loop_2118
	movne	%xcc,	%l2,	%o3
	tl	%xcc,	0x3
	and	%i7,	0x17AE,	%l6
loop_2118:
	subc	%i2,	0x124B,	%i4
	sethi	0x1A27,	%g3
	orn	%o4,	%g6,	%g5
	lduw	[%l7 + 0x4C],	%i0
	wr	%g0,	0x19,	%asi
	ldsba	[%l7 + 0x7E] %asi,	%o2
	ba,a	%icc,	loop_2119
	edge32n	%o0,	%l1,	%g4
	orcc	%i3,	0x199B,	%g2
	fcmps	%fcc0,	%f25,	%f25
loop_2119:
	brgz,a	%l5,	loop_2120
	tle	%icc,	0x3
	srax	%i6,	0x16,	%g1
	movne	%xcc,	%o7,	%o1
loop_2120:
	tvs	%xcc,	0x4
	move	%icc,	%i5,	%o6
	movne	%icc,	%l3,	%i1
	tcs	%xcc,	0x6
	fnands	%f30,	%f6,	%f4
	bl,a,pt	%xcc,	loop_2121
	brz,a	%g7,	loop_2122
	movl	%xcc,	%l0,	%o5
	tsubcc	%l4,	0x07CC,	%l2
loop_2121:
	edge32n	%i7,	%l6,	%i2
loop_2122:
	edge32	%o3,	%i4,	%g3
	xnor	%g6,	0x0C51,	%o4
	srax	%g5,	0x07,	%i0
	wr	%g0,	0x0c,	%asi
	lduwa	[%l7 + 0x44] %asi,	%o0
	udiv	%o2,	0x1C41,	%g4
	fxors	%f26,	%f20,	%f22
	lduw	[%l7 + 0x70],	%l1
	sdivcc	%i3,	0x0C42,	%g2
	tcc	%icc,	0x3
	edge16l	%l5,	%i6,	%g1
	fandnot2s	%f16,	%f2,	%f1
	sllx	%o1,	0x0B,	%o7
	tg	%icc,	0x6
	array32	%o6,	%l3,	%i1
	be	%xcc,	loop_2123
	srl	%g7,	0x1C,	%l0
	movle	%xcc,	%o5,	%l4
	andcc	%l2,	%i7,	%l6
loop_2123:
	and	%i2,	0x1EA8,	%o3
	ldstub	[%l7 + 0x16],	%i4
	tle	%xcc,	0x7
	sll	%g3,	%g6,	%i5
	taddcctv	%g5,	%o4,	%i0
	movvs	%xcc,	%o2,	%o0
	fbule,a	%fcc3,	loop_2124
	edge8	%g4,	%l1,	%i3
	andn	%g2,	0x099A,	%i6
	fabsd	%f6,	%f20
loop_2124:
	movne	%xcc,	%l5,	%g1
	fmul8sux16	%f4,	%f22,	%f30
	ldd	[%l7 + 0x08],	%o6
	std	%f30,	[%l7 + 0x38]
	ldd	[%l7 + 0x18],	%f28
	fmuld8sux16	%f21,	%f17,	%f16
	st	%f18,	[%l7 + 0x5C]
	movle	%icc,	%o1,	%l3
	andn	%o6,	0x1702,	%i1
	movrgez	%l0,	%o5,	%g7
	edge8n	%l2,	%l4,	%l6
	fmovdleu	%icc,	%f28,	%f2
	ldd	[%l7 + 0x10],	%f10
	movn	%xcc,	%i7,	%o3
	stx	%i4,	[%l7 + 0x58]
	call	loop_2125
	edge32n	%i2,	%g6,	%i5
	stbar
	fnot1s	%f14,	%f10
loop_2125:
	tcs	%icc,	0x1
	movre	%g5,	0x16D,	%o4
	fbuge	%fcc2,	loop_2126
	tcs	%xcc,	0x7
	tleu	%xcc,	0x1
	membar	0x03
loop_2126:
	movne	%icc,	%i0,	%o2
	ldsb	[%l7 + 0x12],	%o0
	fba	%fcc0,	loop_2127
	alignaddrl	%g3,	%g4,	%l1
	sethi	0x0BB7,	%g2
	sll	%i3,	%l5,	%g1
loop_2127:
	addccc	%o7,	0x09CC,	%o1
	array32	%l3,	%o6,	%i6
	brlez,a	%i1,	loop_2128
	movneg	%icc,	%o5,	%g7
	fcmpgt16	%f0,	%f4,	%l2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2128:
	xor	%l0,	0x078B,	%l4
	wr	%g0,	0x11,	%asi
	swapa	[%l7 + 0x78] %asi,	%i7
	add	%l7,	0x50,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] %asi,	%l6,	%o3
	mulx	%i4,	%g6,	%i5
	tvs	%icc,	0x3
	brlz,a	%g5,	loop_2129
	fcmple32	%f2,	%f30,	%o4
	fmovs	%f4,	%f9
	fba	%fcc1,	loop_2130
loop_2129:
	be	loop_2131
	fmovdcc	%icc,	%f0,	%f4
	tcc	%icc,	0x0
loop_2130:
	edge32n	%i2,	%o2,	%o0
loop_2131:
	tvs	%icc,	0x7
	fbul,a	%fcc1,	loop_2132
	fmovdge	%icc,	%f8,	%f15
	std	%f16,	[%l7 + 0x40]
	movvc	%xcc,	%i0,	%g4
loop_2132:
	nop
	wr	%g0,	0x11,	%asi
	lduba	[%l7 + 0x76] %asi,	%g3
	fmovrdgz	%l1,	%f30,	%f8
	fand	%f8,	%f8,	%f6
	movn	%xcc,	%g2,	%i3
	edge32l	%g1,	%l5,	%o7
	fornot1s	%f4,	%f7,	%f23
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdiv	%l3,	0x0389,	%o6
	tleu	%xcc,	0x4
	udivcc	%i6,	0x1263,	%i1
	umulcc	%o1,	0x0B1A,	%o5
	xor	%g7,	0x0B35,	%l0
	movvc	%icc,	%l4,	%i7
	set	0x46, %g4
	stha	%l6,	[%l7 + %g4] 0x04
	fbl	%fcc2,	loop_2133
	edge16ln	%o3,	%l2,	%g6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmpeq32	%f14,	%f30,	%i4
loop_2133:
	movg	%xcc,	%i5,	%o4
	fmovrde	%i2,	%f6,	%f16
	movre	%g5,	0x330,	%o2
	fmovsl	%icc,	%f16,	%f1
	alignaddr	%o0,	%i0,	%g4
	fmovdpos	%xcc,	%f15,	%f22
	fnot1s	%f15,	%f7
	fmovdneg	%xcc,	%f25,	%f9
	bneg,a,pn	%icc,	loop_2134
	fmovdg	%xcc,	%f11,	%f15
	or	%l1,	0x1D20,	%g2
	movcs	%icc,	%g3,	%g1
loop_2134:
	fmovd	%f6,	%f22
	tcs	%icc,	0x7
	sdivx	%l5,	0x176D,	%o7
	alignaddr	%l3,	%o6,	%i3
	flush	%l7 + 0x0C
	xor	%i1,	0x06D1,	%i6
	xnor	%o5,	%g7,	%l0
	bl,a,pt	%xcc,	loop_2135
	fnot2s	%f30,	%f14
	andncc	%o1,	%l4,	%l6
	tvc	%icc,	0x2
loop_2135:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movpos	%icc,	%i7,	%o3
	movle	%xcc,	%g6,	%i4
	ldsh	[%l7 + 0x64],	%i5
	umulcc	%o4,	0x1937,	%i2
	edge8l	%g5,	%l2,	%o0
	fmovsle	%xcc,	%f21,	%f3
	xorcc	%o2,	0x01AD,	%i0
	movrgz	%l1,	0x37C,	%g2
	mova	%xcc,	%g4,	%g1
	edge16l	%l5,	%o7,	%l3
	orncc	%o6,	%g3,	%i1
	nop
	setx	loop_2136,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	addcc	%i6,	0x108F,	%i3
	movneg	%icc,	%g7,	%l0
	orcc	%o5,	0x0914,	%o1
loop_2136:
	fmovsle	%icc,	%f3,	%f20
	movcs	%xcc,	%l6,	%i7
	sethi	0x0CD0,	%l4
	set	0x10, %g1
	prefetcha	[%l7 + %g1] 0x19,	 0x3
	movg	%icc,	%i4,	%o3
	prefetch	[%l7 + 0x70],	 0x2
	fcmpeq16	%f30,	%f2,	%i5
	fbge	%fcc2,	loop_2137
	stb	%o4,	[%l7 + 0x6B]
	fpsub32s	%f15,	%f30,	%f18
	fcmpes	%fcc2,	%f22,	%f19
loop_2137:
	tn	%icc,	0x0
	fxnor	%f4,	%f6,	%f8
	edge16	%i2,	%g5,	%o0
	fmovse	%xcc,	%f3,	%f12
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
	mulscc	%l2,	%i0,	%l1
	tvs	%icc,	0x2
	xor	%g2,	%g4,	%g1
loop_2138:
	edge16ln	%o2,	%o7,	%l3
	alignaddrl	%o6,	%l5,	%i1
	edge32l	%g3,	%i3,	%i6
	fbn,a	%fcc1,	loop_2139
	fcmps	%fcc2,	%f24,	%f15
	fcmpgt16	%f16,	%f28,	%l0
	or	%g7,	%o1,	%l6
loop_2139:
	brlez,a	%i7,	loop_2140
	edge8	%l4,	%o5,	%i4
	bvs,a,pt	%xcc,	loop_2141
	sll	%o3,	0x07,	%i5
loop_2140:
	movneg	%icc,	%o4,	%g6
	or	%g5,	0x09EB,	%i2
loop_2141:
	fbo	%fcc1,	loop_2142
	addc	%l2,	0x1EEF,	%o0
	or	%i0,	0x068A,	%l1
	alignaddr	%g2,	%g4,	%g1
loop_2142:
	movl	%icc,	%o2,	%o7
	fsrc2s	%f25,	%f23
	array8	%l3,	%l5,	%o6
	fnor	%f4,	%f18,	%f4
	fble	%fcc1,	loop_2143
	fbge,a	%fcc3,	loop_2144
	nop
	setx	loop_2145,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	brnz	%g3,	loop_2146
loop_2143:
	fcmpd	%fcc0,	%f4,	%f28
loop_2144:
	movgu	%xcc,	%i1,	%i3
loop_2145:
	fand	%f16,	%f26,	%f12
loop_2146:
	edge16	%l0,	%i6,	%o1
	ta	%icc,	0x0
	bpos	%xcc,	loop_2147
	flush	%l7 + 0x54
	subcc	%g7,	%i7,	%l6
	alignaddr	%o5,	%l4,	%o3
loop_2147:
	fxnor	%f26,	%f28,	%f28
	tneg	%icc,	0x1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	add	%l7,	0x40,	%l6
	wr	%g0,	0x11,	%asi
	ldxa	[%l6] %asi,	%i4
	casxa	[%l6] %asi,	%i4,	%o4
	fmovs	%f24,	%f10
	fbl	%fcc0,	loop_2148
	tle	%xcc,	0x3
	movg	%xcc,	%g6,	%g5
	fpack16	%f26,	%f0
loop_2148:
	nop
	add	%l7,	0x50,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%i2,	%i5
	stw	%l2,	[%l7 + 0x6C]
	srax	%i0,	0x09,	%l1
	movre	%g2,	0x341,	%g4
	fsrc1s	%f12,	%f25
	fmovdg	%icc,	%f28,	%f26
	set	0x34, %i0
	sta	%f30,	[%l7 + %i0] 0x81
	std	%f16,	[%l7 + 0x38]
	fmovsvs	%icc,	%f11,	%f10
	movvs	%xcc,	%o0,	%g1
	fpackfix	%f24,	%f10
	xorcc	%o2,	0x1C6D,	%o7
	sdivx	%l3,	0x1820,	%o6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmul8sux16	%f26,	%f12,	%f12
	fsrc1s	%f1,	%f4
	movrne	%l5,	0x28E,	%i1
	popc	0x1529,	%i3
	nop
	set	0x34, %i5
	prefetch	[%l7 + %i5],	 0x3
	srlx	%g3,	%i6,	%l0
	bvs	%xcc,	loop_2149
	tneg	%xcc,	0x3
	faligndata	%f10,	%f18,	%f24
	fbl	%fcc3,	loop_2150
loop_2149:
	nop
	set	0x5C, %i6
	ldsh	[%l7 + %i6],	%g7
	wr	%g0,	0x0c,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
loop_2150:
	edge32ln	%i7,	%l6,	%o1
	fmovdn	%xcc,	%f16,	%f18
	andcc	%l4,	%o3,	%o5
	movvs	%xcc,	%i4,	%o4
	and	%g5,	0x13E2,	%g6
	fmovscs	%xcc,	%f24,	%f10
	fmovrse	%i5,	%f1,	%f18
	fbo,a	%fcc3,	loop_2151
	sdivx	%i2,	0x07A0,	%i0
	fmovrsgez	%l2,	%f30,	%f9
	xnorcc	%g2,	%l1,	%g4
loop_2151:
	ldd	[%l7 + 0x40],	%g0
	tneg	%xcc,	0x0
	lduw	[%l7 + 0x6C],	%o2
	alignaddr	%o7,	%o0,	%l3
	tne	%icc,	0x1
	xor	%l5,	%o6,	%i1
	wr	%g0,	0x18,	%asi
	ldsba	[%l7 + 0x6D] %asi,	%g3
	membar	0x61
	ldd	[%l7 + 0x68],	%f14
	fcmpne16	%f0,	%f24,	%i6
	udiv	%l0,	0x15CB,	%g7
	fblg,a	%fcc3,	loop_2152
	edge8l	%i7,	%l6,	%i3
	tvc	%xcc,	0x0
	edge16l	%o1,	%l4,	%o5
loop_2152:
	nop
	wr	%g0,	0x89,	%asi
	ldda	[%l7 + 0x10] %asi,	%i4
	set	0x10, %i3
	lduwa	[%l7 + %i3] 0x14,	%o3
	ldx	[%l7 + 0x68],	%g5
	siam	0x3
	edge32ln	%o4,	%g6,	%i2
	set	0x40, %l6
	stda	%f16,	[%l7 + %l6] 0x0c
	xor	%i5,	%l2,	%i0
	fmovdge	%icc,	%f28,	%f2
	movne	%icc,	%l1,	%g4
	fmovsleu	%icc,	%f22,	%f18
	sra	%g2,	%g1,	%o2
	fpack32	%f22,	%f14,	%f24
	fcmpeq32	%f30,	%f26,	%o0
	mulx	%o7,	%l3,	%o6
	movrgez	%i1,	0x213,	%l5
	brlz,a	%g3,	loop_2153
	sllx	%l0,	0x11,	%i6
	andcc	%g7,	%l6,	%i7
	sra	%i3,	0x19,	%l4
loop_2153:
	tne	%icc,	0x0
	ble,a	%icc,	loop_2154
	fpadd32	%f0,	%f6,	%f24
	movpos	%icc,	%o5,	%i4
	umulcc	%o1,	0x18FC,	%g5
loop_2154:
	fmovsne	%icc,	%f31,	%f1
	movle	%icc,	%o4,	%g6
	edge8l	%o3,	%i5,	%l2
	bvs,pt	%xcc,	loop_2155
	bvc,a,pt	%icc,	loop_2156
	movcs	%icc,	%i2,	%i0
	movne	%xcc,	%g4,	%l1
loop_2155:
	fmovsvc	%xcc,	%f6,	%f8
loop_2156:
	fmovdgu	%icc,	%f20,	%f18
	movvs	%xcc,	%g2,	%o2
	movre	%o0,	%g1,	%o7
	sir	0x1CEF
	movrgz	%o6,	0x147,	%l3
	mulscc	%i1,	0x13E0,	%l5
	edge8n	%g3,	%i6,	%l0
	sll	%g7,	%l6,	%i7
	movrgz	%l4,	0x10E,	%i3
	sll	%o5,	%i4,	%g5
	tsubcc	%o1,	0x1C8A,	%g6
	taddcctv	%o4,	%o3,	%i5
	call	loop_2157
	xor	%i2,	%i0,	%g4
	fblg	%fcc2,	loop_2158
	andn	%l2,	%l1,	%g2
loop_2157:
	fmul8x16	%f6,	%f12,	%f6
	subccc	%o0,	%o2,	%g1
loop_2158:
	nop
	add	%l7,	0x10,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] %asi,	%o6,	%l3
	popc	%o7,	%l5
	fpsub32	%f14,	%f10,	%f24
	fsrc1s	%f15,	%f6
	wr	%g0,	0x89,	%asi
	ldsha	[%l7 + 0x6E] %asi,	%i1
	bpos	loop_2159
	tne	%icc,	0x1
	fblg	%fcc3,	loop_2160
	fmovrdlez	%i6,	%f12,	%f20
loop_2159:
	fbn,a	%fcc2,	loop_2161
	fmovdn	%icc,	%f23,	%f2
loop_2160:
	xnor	%g3,	%g7,	%l6
	movn	%xcc,	%l0,	%l4
loop_2161:
	orn	%i3,	%o5,	%i7
	smul	%i4,	0x08C1,	%g5
	taddcctv	%o1,	0x0B0F,	%o4
	lduh	[%l7 + 0x58],	%o3
	fnors	%f23,	%f19,	%f30
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdcc	%icc,	%f28,	%f23
	fnors	%f3,	%f17,	%f15
	ldd	[%l7 + 0x78],	%g6
	fpack16	%f22,	%f29
	tleu	%xcc,	0x7
	fpadd16s	%f10,	%f21,	%f2
	fsrc1s	%f13,	%f23
	brlez,a	%i2,	loop_2162
	movl	%icc,	%i0,	%g4
	fcmpeq32	%f2,	%f10,	%i5
	movneg	%xcc,	%l1,	%g2
loop_2162:
	fmovdvs	%xcc,	%f31,	%f28
	fbu,a	%fcc2,	loop_2163
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addcc	%o0,	0x0E57,	%l2
	fcmpd	%fcc3,	%f6,	%f30
loop_2163:
	nop
	set	0x58, %o1
	stwa	%g1,	[%l7 + %o1] 0x80
	set	0x28, %l0
	lduba	[%l7 + %l0] 0x81,	%o2
	tcc	%icc,	0x2
	prefetch	[%l7 + 0x24],	 0x0
	edge8l	%l3,	%o6,	%o7
	wr	%g0,	0x81,	%asi
	ldswa	[%l7 + 0x20] %asi,	%l5
	nop
	set	0x48, %i2
	ldx	[%l7 + %i2],	%i1
	lduw	[%l7 + 0x2C],	%i6
	fand	%f18,	%f20,	%f28
	fpsub16	%f20,	%f28,	%f18
	membar	#Sync
	wr	%g0,	0x1e,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	fmovrsgz	%g3,	%f10,	%f22
	fmovsn	%xcc,	%f13,	%f11
	edge32l	%l6,	%l0,	%l4
	edge8	%i3,	%g7,	%o5
	fmovsgu	%xcc,	%f10,	%f30
	std	%i6,	[%l7 + 0x68]
	array16	%g5,	%i4,	%o4
	edge8l	%o1,	%g6,	%i2
	siam	0x0
	bge	loop_2164
	bleu,a	%xcc,	loop_2165
	sdivx	%i0,	0x0CBE,	%o3
	ldstub	[%l7 + 0x71],	%g4
loop_2164:
	umul	%l1,	%g2,	%o0
loop_2165:
	umul	%i5,	0x0E2A,	%l2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andcc	%o2,	0x1ED8,	%g1
	movpos	%icc,	%o6,	%l3
	fandnot1	%f0,	%f20,	%f14
	bg,a	%xcc,	loop_2166
	fble	%fcc1,	loop_2167
	tle	%xcc,	0x6
	udivcc	%l5,	0x1942,	%i1
loop_2166:
	umul	%i6,	0x15AE,	%o7
loop_2167:
	edge16ln	%l6,	%l0,	%l4
	bvs,a,pn	%icc,	loop_2168
	ta	%icc,	0x3
	bvs,a	%xcc,	loop_2169
	mova	%icc,	%i3,	%g3
loop_2168:
	fcmpeq16	%f20,	%f22,	%o5
	movrne	%g7,	%i7,	%g5
loop_2169:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbug	%fcc2,	loop_2170
	tn	%xcc,	0x3
	array32	%o4,	%o1,	%g6
	xnor	%i2,	%i0,	%o3
loop_2170:
	ta	%icc,	0x3
	xnorcc	%i4,	%g4,	%l1
	brlz	%g2,	loop_2171
	edge32l	%i5,	%l2,	%o2
	fbe,a	%fcc1,	loop_2172
	fmovrdne	%o0,	%f22,	%f10
loop_2171:
	tleu	%icc,	0x3
	tvc	%xcc,	0x5
loop_2172:
	tcs	%icc,	0x5
	fpmerge	%f15,	%f9,	%f10
	tne	%icc,	0x5
	tsubcctv	%g1,	%o6,	%l3
	set	0x5E, %o3
	ldsha	[%l7 + %o3] 0x89,	%l5
	fmovs	%f20,	%f11
	wr	%g0,	0x80,	%asi
	ldsba	[%l7 + 0x3E] %asi,	%i1
	tge	%xcc,	0x3
	movrgz	%i6,	0x0AA,	%l6
	tle	%xcc,	0x4
	fmovsge	%xcc,	%f23,	%f4
	ta	%icc,	0x3
	orcc	%l0,	%o7,	%i3
	stbar
	edge32n	%l4,	%o5,	%g7
	movn	%xcc,	%i7,	%g3
	mova	%xcc,	%o4,	%o1
	movvc	%icc,	%g6,	%g5
	ld	[%l7 + 0x54],	%f23
	umul	%i2,	%o3,	%i4
	udiv	%g4,	0x16DC,	%l1
	fsrc1	%f2,	%f0
	movneg	%icc,	%g2,	%i5
	fzeros	%f6
	or	%l2,	%o2,	%i0
	tgu	%xcc,	0x6
	movne	%xcc,	%o0,	%o6
	fcmpgt16	%f10,	%f26,	%l3
	ba	loop_2173
	edge32l	%g1,	%i1,	%i6
	ldx	[%l7 + 0x38],	%l5
	tle	%xcc,	0x5
loop_2173:
	fcmpeq16	%f6,	%f10,	%l0
	taddcctv	%o7,	%l6,	%i3
	tvc	%icc,	0x2
	sub	%l4,	%g7,	%o5
	or	%i7,	%o4,	%g3
	sth	%o1,	[%l7 + 0x70]
	mulscc	%g6,	0x1406,	%g5
	movcs	%icc,	%o3,	%i4
	umul	%g4,	%i2,	%g2
	set	0x60, %l1
	ldswa	[%l7 + %l1] 0x89,	%i5
	bvc,pn	%xcc,	loop_2174
	mulscc	%l1,	0x1224,	%o2
	membar	0x6C
	popc	%l2,	%i0
loop_2174:
	call	loop_2175
	taddcc	%o6,	%o0,	%l3
	andncc	%g1,	%i1,	%i6
	fxnors	%f11,	%f26,	%f14
loop_2175:
	movcc	%xcc,	%l0,	%o7
	edge16	%l6,	%i3,	%l4
	xor	%l5,	%g7,	%o5
	nop
	setx loop_2176, %l0, %l1
	jmpl %l1, %i7
	edge8	%g3,	%o1,	%g6
	fbne	%fcc0,	loop_2177
	bcs	loop_2178
loop_2176:
	tle	%xcc,	0x7
	fmul8ulx16	%f18,	%f4,	%f8
loop_2177:
	fbule,a	%fcc2,	loop_2179
loop_2178:
	mova	%icc,	%o4,	%g5
	movl	%xcc,	%i4,	%o3
	addcc	%g4,	0x0DF3,	%g2
loop_2179:
	nop
	setx	loop_2180,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	tsubcc	%i2,	%l1,	%o2
	popc	0x1D2F,	%i5
	lduh	[%l7 + 0x66],	%l2
loop_2180:
	add	%i0,	%o6,	%l3
	fmovdge	%icc,	%f23,	%f3
	std	%f22,	[%l7 + 0x78]
	fnor	%f4,	%f10,	%f8
	wr	%g0,	0x10,	%asi
	ldswa	[%l7 + 0x1C] %asi,	%g1
	edge8l	%i1,	%i6,	%l0
	edge16ln	%o0,	%o7,	%i3
	tle	%xcc,	0x2
	fornot1	%f6,	%f2,	%f12
	tgu	%xcc,	0x2
	fmovsgu	%icc,	%f7,	%f24
	movne	%icc,	%l6,	%l5
	fexpand	%f0,	%f30
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	setx loop_2181, %l0, %l1
	jmpl %l1, %l4
	fmovsn	%xcc,	%f0,	%f28
	fmovdneg	%xcc,	%f29,	%f23
	fcmpes	%fcc3,	%f18,	%f14
loop_2181:
	udiv	%g7,	0x126F,	%i7
	ldx	[%l7 + 0x78],	%o5
	andn	%o1,	%g3,	%o4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movleu	%xcc,	%g6,	%g5
	fbule	%fcc0,	loop_2182
	sethi	0x0061,	%i4
	bleu,pn	%xcc,	loop_2183
	fnand	%f0,	%f4,	%f24
loop_2182:
	fmovrdgz	%g4,	%f18,	%f10
	addc	%o3,	0x1AFB,	%g2
loop_2183:
	fnors	%f24,	%f23,	%f10
	movrgz	%i2,	%l1,	%i5
	bcs,pn	%icc,	loop_2184
	xnorcc	%l2,	0x0F10,	%o2
	mulscc	%o6,	%l3,	%i0
	addcc	%i1,	%i6,	%g1
loop_2184:
	sir	0x14DC
	brz	%l0,	loop_2185
	stw	%o7,	[%l7 + 0x14]
	array32	%o0,	%i3,	%l6
	movleu	%icc,	%l5,	%g7
loop_2185:
	membar	0x13
	bge,pn	%icc,	loop_2186
	movvs	%xcc,	%i7,	%o5
	xorcc	%l4,	%o1,	%o4
	movg	%xcc,	%g3,	%g6
loop_2186:
	fmovdcc	%icc,	%f20,	%f9
	mova	%icc,	%i4,	%g4
	movl	%icc,	%g5,	%g2
	sra	%i2,	0x02,	%l1
	movle	%xcc,	%o3,	%l2
	array16	%i5,	%o6,	%o2
	edge16n	%i0,	%i1,	%i6
	fnands	%f25,	%f26,	%f2
	srlx	%l3,	0x09,	%g1
	ble	loop_2187
	fpackfix	%f14,	%f20
	taddcc	%l0,	%o7,	%i3
	srax	%l6,	0x1A,	%l5
loop_2187:
	movg	%xcc,	%g7,	%o0
	edge8ln	%o5,	%l4,	%o1
	smulcc	%i7,	0x0E3B,	%o4
	tle	%xcc,	0x1
	tsubcc	%g3,	0x141E,	%g6
	fornot1s	%f5,	%f26,	%f25
	movle	%icc,	%i4,	%g5
	move	%xcc,	%g2,	%g4
	fmovs	%f16,	%f14
	fmovdge	%xcc,	%f30,	%f29
	sub	%l1,	%i2,	%l2
	edge8l	%i5,	%o3,	%o2
	fpackfix	%f8,	%f9
	fzero	%f24
	sdiv	%o6,	0x0AEE,	%i0
	movcc	%icc,	%i6,	%i1
	mulx	%l3,	0x1BDE,	%g1
	smulcc	%l0,	0x17E1,	%o7
	fmovsle	%icc,	%f10,	%f19
	tsubcctv	%i3,	%l6,	%g7
	bge,pt	%icc,	loop_2188
	srax	%o0,	%o5,	%l5
	brgez,a	%l4,	loop_2189
	and	%i7,	0x17E2,	%o4
loop_2188:
	brgz,a	%o1,	loop_2190
	stw	%g6,	[%l7 + 0x58]
loop_2189:
	tcc	%xcc,	0x2
	fcmpeq16	%f20,	%f8,	%i4
loop_2190:
	tn	%xcc,	0x3
	nop
	setx	loop_2191,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	tvs	%xcc,	0x2
	fmovrslez	%g5,	%f22,	%f22
	fxors	%f13,	%f3,	%f23
loop_2191:
	flush	%l7 + 0x74
	movvc	%xcc,	%g3,	%g4
	edge32ln	%l1,	%i2,	%l2
	set	0x67, %o6
	ldstuba	[%l7 + %o6] 0x80,	%i5
	pdist	%f20,	%f20,	%f14
	edge8l	%o3,	%g2,	%o6
	sdivcc	%o2,	0x1D54,	%i6
	ba,a,pt	%xcc,	loop_2192
	movvs	%icc,	%i1,	%i0
	movcs	%icc,	%g1,	%l0
	xnor	%o7,	0x0A8B,	%l3
loop_2192:
	std	%f10,	[%l7 + 0x10]
	tpos	%icc,	0x5
	fmovdpos	%xcc,	%f1,	%f25
	sdiv	%l6,	0x0AAF,	%g7
	fmovsle	%xcc,	%f26,	%f26
	fabss	%f3,	%f3
	tn	%xcc,	0x4
	tge	%xcc,	0x7
	fbl,a	%fcc2,	loop_2193
	movgu	%xcc,	%i3,	%o5
	xor	%o0,	0x16D7,	%l4
	subcc	%i7,	0x15E3,	%o4
loop_2193:
	nop
	set	0x2C, %g2
	lda	[%l7 + %g2] 0x15,	%f28
	movgu	%xcc,	%l5,	%g6
	fmovsgu	%icc,	%f8,	%f20
	movcc	%icc,	%o1,	%i4
	stw	%g3,	[%l7 + 0x60]
	set	0x0C, %o2
	stwa	%g5,	[%l7 + %o2] 0x88
	edge32	%l1,	%i2,	%l2
	tsubcc	%g4,	0x08CB,	%o3
	or	%g2,	0x119D,	%o6
	sll	%o2,	0x15,	%i6
	fblg,a	%fcc0,	loop_2194
	bgu,pn	%xcc,	loop_2195
	movneg	%xcc,	%i1,	%i0
	nop
	setx	loop_2196,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_2194:
	ba	loop_2197
loop_2195:
	fmovsle	%icc,	%f5,	%f4
	movrlz	%g1,	%l0,	%o7
loop_2196:
	fbue	%fcc3,	loop_2198
loop_2197:
	ldstub	[%l7 + 0x7C],	%i5
	stbar
	stb	%l3,	[%l7 + 0x50]
loop_2198:
	swap	[%l7 + 0x54],	%g7
	fcmpes	%fcc0,	%f7,	%f17
	call	loop_2199
	fmul8x16au	%f21,	%f0,	%f0
	tneg	%xcc,	0x0
	fmovdg	%icc,	%f31,	%f27
loop_2199:
	prefetch	[%l7 + 0x4C],	 0x2
	fpmerge	%f9,	%f10,	%f8
	siam	0x5
	sir	0x1304
	movpos	%icc,	%i3,	%l6
	sllx	%o5,	0x13,	%o0
	fmovrse	%l4,	%f17,	%f20
	fba,a	%fcc1,	loop_2200
	bcs	loop_2201
	sllx	%o4,	%l5,	%g6
	mulscc	%i7,	0x0EF7,	%o1
loop_2200:
	nop
	set	0x54, %i7
	stha	%i4,	[%l7 + %i7] 0x15
loop_2201:
	nop
	wr	%g0,	0xf0,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
	fornot1	%f0,	%f28,	%f30
	fnegs	%f21,	%f4
	brnz	%g3,	loop_2202
	edge8l	%g5,	%i2,	%l2
	subc	%g4,	%l1,	%g2
	stw	%o6,	[%l7 + 0x14]
loop_2202:
	ldsw	[%l7 + 0x58],	%o2
	tcc	%icc,	0x2
	umul	%o3,	0x1E6B,	%i6
	move	%xcc,	%i1,	%g1
	fbug	%fcc2,	loop_2203
	movcs	%xcc,	%i0,	%o7
	array8	%i5,	%l3,	%l0
	fones	%f6
loop_2203:
	tcs	%xcc,	0x3
	wr	%g0,	0x80,	%asi
	stba	%g7,	[%l7 + 0x76] %asi
	array32	%l6,	%o5,	%i3
	bvs	%icc,	loop_2204
	fnegs	%f29,	%f16
	xorcc	%o0,	%o4,	%l5
	bleu	%xcc,	loop_2205
loop_2204:
	bgu,pn	%xcc,	loop_2206
	movg	%icc,	%l4,	%i7
	tge	%icc,	0x3
loop_2205:
	tvs	%icc,	0x2
loop_2206:
	fbg	%fcc3,	loop_2207
	edge8l	%g6,	%o1,	%i4
	fmovsge	%xcc,	%f11,	%f20
	edge32n	%g3,	%g5,	%l2
loop_2207:
	nop
	set	0x72, %i4
	ldub	[%l7 + %i4],	%g4
	st	%f14,	[%l7 + 0x24]
	fba,a	%fcc0,	loop_2208
	tsubcc	%l1,	0x1AA4,	%g2
	fmovda	%icc,	%f27,	%f9
	add	%l7,	0x38,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%o6
	casxa	[%l6] 0x89,	%o6,	%i2
loop_2208:
	fpadd16s	%f21,	%f20,	%f11
	fmovsne	%xcc,	%f31,	%f26
	brgez,a	%o3,	loop_2209
	sethi	0x0527,	%o2
	bvc	loop_2210
	fblg,a	%fcc1,	loop_2211
loop_2209:
	fones	%f7
	xor	%i6,	%g1,	%i0
loop_2210:
	tsubcctv	%i1,	0x01C9,	%i5
loop_2211:
	popc	%l3,	%o7
	array8	%l0,	%l6,	%o5
	alignaddrl	%i3,	%g7,	%o4
	nop
	set	0x10, %o0
	std	%f28,	[%l7 + %o0]
	sra	%o0,	0x0B,	%l5
	umul	%i7,	%l4,	%g6
	addcc	%i4,	%o1,	%g5
	addc	%g3,	0x09D3,	%g4
	andncc	%l1,	%g2,	%l2
	move	%xcc,	%o6,	%o3
	edge16	%i2,	%o2,	%g1
	tne	%icc,	0x4
	sdiv	%i6,	0x0884,	%i1
	edge16n	%i0,	%i5,	%o7
	edge8	%l0,	%l6,	%l3
	fone	%f20
	xorcc	%i3,	%g7,	%o4
	te	%xcc,	0x7
	fcmple16	%f2,	%f6,	%o5
	set	0x6C, %o5
	swapa	[%l7 + %o5] 0x04,	%l5
	smul	%i7,	0x0CE2,	%l4
	fbne,a	%fcc0,	loop_2212
	fbo,a	%fcc0,	loop_2213
	fmovse	%xcc,	%f31,	%f29
	mova	%icc,	%g6,	%o0
loop_2212:
	sethi	0x12B7,	%o1
loop_2213:
	fmovdgu	%xcc,	%f12,	%f16
	fcmpgt16	%f28,	%f2,	%g5
	movge	%icc,	%i4,	%g3
	brnz	%l1,	loop_2214
	add	%g4,	0x019A,	%l2
	sub	%g2,	%o6,	%i2
	edge32	%o2,	%g1,	%o3
loop_2214:
	movle	%xcc,	%i6,	%i0
	edge8n	%i1,	%o7,	%i5
	fandnot2	%f6,	%f26,	%f4
	brz,a	%l6,	loop_2215
	call	loop_2216
	bvc,a	%xcc,	loop_2217
	tcc	%icc,	0x0
loop_2215:
	array16	%l3,	%l0,	%g7
loop_2216:
	tpos	%xcc,	0x0
loop_2217:
	udivcc	%o4,	0x1542,	%i3
	andcc	%o5,	%l5,	%i7
	array32	%l4,	%o0,	%o1
	tsubcc	%g5,	0x1807,	%g6
	xorcc	%g3,	%l1,	%i4
	bvc,a	loop_2218
	edge16	%l2,	%g4,	%o6
	set	0x40, %l3
	ldda	[%l7 + %l3] 0x2a,	%g2
loop_2218:
	edge16l	%i2,	%o2,	%o3
	mova	%icc,	%g1,	%i6
	nop
	set	0x22, %l2
	ldsh	[%l7 + %l2],	%i0
	movl	%icc,	%i1,	%i5
	fpack16	%f10,	%f16
	tsubcctv	%o7,	%l3,	%l6
	sub	%g7,	%l0,	%i3
	sdiv	%o5,	0x0430,	%l5
	set	0x70, %g7
	stxa	%o4,	[%l7 + %g7] 0x2a
	membar	#Sync
	tcs	%icc,	0x3
	wr	%g0,	0xeb,	%asi
	stha	%i7,	[%l7 + 0x72] %asi
	membar	#Sync
	movvc	%icc,	%l4,	%o0
	tleu	%xcc,	0x2
	bleu,pn	%icc,	loop_2219
	movrlez	%o1,	0x3EE,	%g5
	ta	%icc,	0x6
	fmovdleu	%xcc,	%f9,	%f22
loop_2219:
	umul	%g3,	0x1B53,	%g6
	edge32ln	%i4,	%l2,	%l1
	bgu,pt	%xcc,	loop_2220
	fmovrsne	%g4,	%f15,	%f4
	taddcc	%o6,	%i2,	%g2
	umulcc	%o3,	%o2,	%i6
loop_2220:
	sdivx	%g1,	0x1FC3,	%i0
	subcc	%i1,	%i5,	%l3
	fbge,a	%fcc3,	loop_2221
	fmovrsgz	%l6,	%f0,	%f28
	nop
	set	0x6A, %l4
	sth	%o7,	[%l7 + %l4]
	ba	loop_2222
loop_2221:
	edge8n	%g7,	%i3,	%l0
	bpos,a	%xcc,	loop_2223
	umulcc	%o5,	0x0FD5,	%l5
loop_2222:
	fpsub32s	%f11,	%f9,	%f7
	call	loop_2224
loop_2223:
	andncc	%o4,	%l4,	%i7
	movrlz	%o0,	%g5,	%o1
	tvs	%icc,	0x4
loop_2224:
	xnor	%g3,	%i4,	%g6
	fmul8x16	%f6,	%f28,	%f0
	fbn,a	%fcc0,	loop_2225
	addc	%l2,	%g4,	%o6
	ta	%icc,	0x4
	fxnors	%f26,	%f18,	%f31
loop_2225:
	brlez	%l1,	loop_2226
	array16	%i2,	%o3,	%g2
	movg	%xcc,	%o2,	%i6
	wr	%g0,	0x18,	%asi
	sta	%f19,	[%l7 + 0x64] %asi
loop_2226:
	edge8ln	%g1,	%i0,	%i1
	andn	%i5,	%l6,	%l3
	fsrc2s	%f3,	%f27
	fpsub32	%f22,	%f22,	%f16
	edge8n	%g7,	%o7,	%l0
	set	0x40, %o7
	stda	%f16,	[%l7 + %o7] 0x11
	wr	%g0,	0x81,	%asi
	lduba	[%l7 + 0x08] %asi,	%o5
	xor	%l5,	%i3,	%o4
	or	%i7,	0x15E8,	%o0
	edge16	%l4,	%g5,	%g3
	brgz,a	%o1,	loop_2227
	sdivx	%g6,	0x0AFA,	%i4
	movl	%icc,	%g4,	%o6
	set	0x43, %g6
	ldsba	[%l7 + %g6] 0x18,	%l1
loop_2227:
	tn	%icc,	0x4
	fcmpne16	%f0,	%f28,	%i2
	add	%l7,	0x50,	%l6
	wr	%g0,	0x18,	%asi
	ldxa	[%l6] %asi,	%o3
	casxa	[%l6] %asi,	%o3,	%l2
	tpos	%icc,	0x1
	movre	%g2,	0x3E0,	%o2
	edge8ln	%g1,	%i6,	%i1
	addccc	%i5,	%l6,	%i0
	bcc,a	%xcc,	loop_2228
	fmovsneg	%xcc,	%f8,	%f15
	membar	0x17
	fmovdcs	%icc,	%f22,	%f4
loop_2228:
	movvc	%icc,	%l3,	%o7
	popc	%g7,	%o5
	siam	0x0
	udiv	%l5,	0x0E11,	%l0
	sub	%i3,	%o4,	%i7
	fbue	%fcc1,	loop_2229
	orcc	%l4,	0x1630,	%g5
	tle	%xcc,	0x1
	tge	%xcc,	0x3
loop_2229:
	ta	%icc,	0x2
	fbule,a	%fcc1,	loop_2230
	sdivx	%g3,	0x0441,	%o1
	fnors	%f18,	%f8,	%f28
	fzero	%f20
loop_2230:
	move	%icc,	%g6,	%i4
	udivx	%o0,	0x1F27,	%o6
	movne	%icc,	%g4,	%l1
	xor	%i2,	%o3,	%l2
	move	%icc,	%o2,	%g2
	fbn,a	%fcc3,	loop_2231
	array8	%i6,	%g1,	%i5
	movpos	%xcc,	%l6,	%i0
	smul	%l3,	%o7,	%i1
loop_2231:
	lduh	[%l7 + 0x30],	%g7
	taddcc	%o5,	%l5,	%l0
	std	%i2,	[%l7 + 0x50]
	tsubcc	%o4,	%l4,	%g5
	lduh	[%l7 + 0x1C],	%i7
	umul	%g3,	0x0592,	%g6
	movleu	%icc,	%o1,	%i4
	brlz	%o0,	loop_2232
	mulx	%o6,	0x1C97,	%l1
	taddcctv	%i2,	0x01BF,	%o3
	bcs	loop_2233
loop_2232:
	or	%l2,	0x1741,	%o2
	tgu	%icc,	0x0
	move	%icc,	%g4,	%g2
loop_2233:
	orn	%g1,	0x1F71,	%i5
	membar	0x69
	tvc	%icc,	0x2
	fpadd32s	%f14,	%f9,	%f6
	fpsub32	%f14,	%f24,	%f6
	fors	%f14,	%f30,	%f19
	movrgz	%l6,	0x335,	%i6
	movg	%xcc,	%l3,	%o7
	fmovsa	%icc,	%f16,	%f16
	fbo,a	%fcc2,	loop_2234
	nop
	set	0x6C, %g5
	ldsw	[%l7 + %g5],	%i1
	umul	%i0,	%g7,	%o5
	sra	%l5,	%l0,	%o4
loop_2234:
	tcc	%xcc,	0x2
	fmovdg	%xcc,	%f6,	%f0
	wr	%g0,	0x80,	%asi
	stha	%i3,	[%l7 + 0x76] %asi
	wr	%g0,	0x11,	%asi
	lduwa	[%l7 + 0x58] %asi,	%l4
	addc	%g5,	0x1EBC,	%i7
	sdivcc	%g6,	0x14D6,	%i4
	mova	%icc,	%o0,	%o1
	tn	%icc,	0x2
	fbe	%fcc3,	loop_2235
	prefetch	[%l7 + 0x0C],	 0x2
	subcc	%l1,	0x0013,	%o6
	addcc	%i2,	%l2,	%o2
loop_2235:
	fmovdpos	%xcc,	%f7,	%f2
	fands	%f5,	%f21,	%f23
	srax	%g4,	%o3,	%g1
	tl	%xcc,	0x7
	swap	[%l7 + 0x0C],	%i5
	movrgez	%g2,	0x082,	%i6
	wr	%g0,	0x80,	%asi
	prefetcha	[%l7 + 0x10] %asi,	 0x0
	bg	%xcc,	loop_2236
	faligndata	%f0,	%f14,	%f8
	fmovsleu	%xcc,	%f6,	%f28
	movcc	%xcc,	%o7,	%i1
loop_2236:
	sub	%l6,	0x1346,	%g7
	fornot1	%f24,	%f20,	%f12
	swap	[%l7 + 0x68],	%o5
	sll	%l5,	0x1D,	%i0
	fmovsl	%icc,	%f30,	%f9
	brgez	%o4,	loop_2237
	taddcctv	%i3,	%l0,	%g5
	tsubcc	%i7,	%l4,	%g3
	andcc	%g6,	0x0513,	%o0
loop_2237:
	nop
	wr	%g0,	0x04,	%asi
	ldswa	[%l7 + 0x5C] %asi,	%o1
	movge	%icc,	%i4,	%o6
	tle	%icc,	0x0
	move	%icc,	%i2,	%l2
	smulcc	%o2,	%g4,	%l1
	edge32n	%g1,	%o3,	%g2
	popc	0x046F,	%i5
	tneg	%xcc,	0x7
	fcmpeq32	%f6,	%f22,	%i6
	fmovdn	%xcc,	%f12,	%f4
	swap	[%l7 + 0x64],	%l3
	fxor	%f22,	%f20,	%f14
	ldub	[%l7 + 0x3F],	%i1
	andcc	%l6,	0x0BF3,	%g7
	bgu	%icc,	loop_2238
	tsubcctv	%o5,	%o7,	%l5
	udivx	%o4,	0x11EB,	%i3
	umul	%l0,	0x06D0,	%i0
loop_2238:
	udivcc	%i7,	0x0D54,	%g5
	fmul8x16al	%f20,	%f2,	%f16
	movrlez	%l4,	%g6,	%g3
	addcc	%o1,	%i4,	%o6
	sdivx	%o0,	0x02F8,	%l2
	movrgz	%o2,	0x196,	%i2
	fmovsge	%xcc,	%f31,	%f29
	movneg	%xcc,	%l1,	%g1
	movneg	%xcc,	%o3,	%g4
	ldub	[%l7 + 0x69],	%i5
	bgu,a	loop_2239
	taddcc	%i6,	%l3,	%g2
	smulcc	%l6,	0x061F,	%i1
	fmovrdne	%g7,	%f2,	%f26
loop_2239:
	fmovdge	%icc,	%f19,	%f3
	edge8ln	%o7,	%o5,	%l5
	edge8	%o4,	%i3,	%l0
	tvc	%icc,	0x1
	nop
	set	0x08, %i1
	ldd	[%l7 + %i1],	%i6
	fpadd32	%f0,	%f18,	%f10
	tsubcctv	%g5,	0x19B0,	%i0
	sdiv	%g6,	0x02A7,	%g3
	for	%f12,	%f8,	%f22
	movvc	%xcc,	%l4,	%o1
	subcc	%i4,	%o0,	%o6
	smul	%l2,	0x12EB,	%i2
	addc	%l1,	0x1517,	%g1
	movrlez	%o3,	0x074,	%o2
	xnorcc	%g4,	%i5,	%i6
	movle	%xcc,	%l3,	%g2
	fmul8x16au	%f27,	%f4,	%f6
	bne,a	loop_2240
	orn	%i1,	0x15BE,	%g7
	udivcc	%o7,	0x0218,	%l6
	brnz	%l5,	loop_2241
loop_2240:
	bn,a,pn	%icc,	loop_2242
	fabsd	%f26,	%f20
	edge32n	%o4,	%o5,	%i3
loop_2241:
	tle	%xcc,	0x5
loop_2242:
	sll	%l0,	%g5,	%i7
	fcmps	%fcc0,	%f14,	%f14
	movl	%icc,	%i0,	%g3
	fmovdge	%xcc,	%f16,	%f7
	addccc	%g6,	%l4,	%o1
	tpos	%xcc,	0x2
	fmovscs	%xcc,	%f1,	%f22
	movcs	%icc,	%o0,	%i4
	andncc	%l2,	%o6,	%i2
	mulx	%l1,	%g1,	%o3
	fmovdl	%icc,	%f28,	%f10
	movcs	%xcc,	%o2,	%g4
	brlz	%i5,	loop_2243
	fabsd	%f18,	%f24
	ldsb	[%l7 + 0x55],	%i6
	tl	%xcc,	0x1
loop_2243:
	edge16	%g2,	%i1,	%g7
	movre	%o7,	0x0EE,	%l6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array16	%l5,	%l3,	%o5
	movrlz	%i3,	%o4,	%l0
	smul	%g5,	%i7,	%g3
	tcs	%xcc,	0x7
	mova	%xcc,	%g6,	%i0
	tsubcc	%l4,	%o0,	%o1
	orncc	%i4,	%o6,	%l2
	fandnot1s	%f5,	%f0,	%f21
	tcc	%icc,	0x5
	addccc	%l1,	0x183D,	%i2
	udivcc	%o3,	0x183E,	%o2
	movrgz	%g4,	0x166,	%i5
	nop
	setx loop_2244, %l0, %l1
	jmpl %l1, %g1
	st	%f9,	[%l7 + 0x7C]
	fornot2	%f24,	%f4,	%f24
	movne	%xcc,	%g2,	%i1
loop_2244:
	addcc	%i6,	%o7,	%g7
	set	0x2C, %o4
	ldswa	[%l7 + %o4] 0x81,	%l6
	fmovrdne	%l5,	%f26,	%f6
	wr	%g0,	0x89,	%asi
	sta	%f28,	[%l7 + 0x0C] %asi
	wr	%g0,	0x2b,	%asi
	stxa	%l3,	[%l7 + 0x08] %asi
	membar	#Sync
	sub	%i3,	%o4,	%o5
	bvc,pt	%xcc,	loop_2245
	alignaddrl	%l0,	%g5,	%g3
	siam	0x4
	srax	%i7,	%i0,	%g6
loop_2245:
	andncc	%l4,	%o1,	%o0
	xnor	%i4,	0x08F5,	%l2
	edge8	%o6,	%l1,	%i2
	udivcc	%o2,	0x115E,	%o3
	ble	loop_2246
	nop
	setx	loop_2247,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	edge16l	%i5,	%g1,	%g2
	subcc	%g4,	%i1,	%i6
loop_2246:
	andn	%o7,	%g7,	%l6
loop_2247:
	ldstub	[%l7 + 0x7E],	%l3
	fmovdne	%xcc,	%f27,	%f0
	bne	%icc,	loop_2248
	smul	%i3,	0x11EB,	%o4
	te	%xcc,	0x1
	brlz	%l5,	loop_2249
loop_2248:
	tneg	%icc,	0x4
	taddcctv	%l0,	%o5,	%g3
	movg	%xcc,	%i7,	%i0
loop_2249:
	andncc	%g5,	%l4,	%g6
	wr	%g0,	0x22,	%asi
	stwa	%o1,	[%l7 + 0x28] %asi
	membar	#Sync
	addc	%o0,	0x0C78,	%l2
	bpos,pt	%xcc,	loop_2250
	movcs	%xcc,	%i4,	%o6
	fxor	%f4,	%f20,	%f6
	addc	%i2,	%l1,	%o2
loop_2250:
	fmovdgu	%icc,	%f28,	%f19
	fbule,a	%fcc0,	loop_2251
	udiv	%i5,	0x188D,	%o3
	fmovdvs	%xcc,	%f7,	%f10
	taddcc	%g2,	0x0FCC,	%g4
loop_2251:
	fblg	%fcc3,	loop_2252
	fbge,a	%fcc3,	loop_2253
	tvs	%xcc,	0x6
	xorcc	%g1,	%i6,	%o7
loop_2252:
	bleu,a	loop_2254
loop_2253:
	addc	%i1,	0x1CAE,	%l6
	fba	%fcc0,	loop_2255
	fmul8x16al	%f16,	%f16,	%f28
loop_2254:
	fbn	%fcc3,	loop_2256
	edge32n	%l3,	%i3,	%o4
loop_2255:
	nop
	wr	%g0,	0xeb,	%asi
	stba	%l5,	[%l7 + 0x67] %asi
	membar	#Sync
loop_2256:
	movrne	%l0,	%o5,	%g7
	tsubcctv	%g3,	%i0,	%g5
	fornot1	%f26,	%f2,	%f14
	addc	%l4,	0x0AB3,	%i7
	fandnot1	%f28,	%f30,	%f18
	fmovs	%f12,	%f27
	subccc	%o1,	%g6,	%o0
	movneg	%icc,	%i4,	%o6
	movge	%xcc,	%i2,	%l1
	sdivcc	%o2,	0x1295,	%l2
	wr	%g0,	0x89,	%asi
	stba	%i5,	[%l7 + 0x3A] %asi
	ta	%xcc,	0x5
	fand	%f18,	%f0,	%f24
	movrgez	%o3,	0x198,	%g2
	fbuge,a	%fcc1,	loop_2257
	ldx	[%l7 + 0x38],	%g4
	fbe,a	%fcc3,	loop_2258
	fmovscs	%icc,	%f31,	%f6
loop_2257:
	movre	%g1,	0x25E,	%o7
	fbul	%fcc2,	loop_2259
loop_2258:
	andcc	%i1,	0x0F4E,	%i6
	edge32ln	%l3,	%l6,	%i3
	move	%xcc,	%o4,	%l0
loop_2259:
	subccc	%o5,	0x0D75,	%g7
	membar	0x5B
	tl	%xcc,	0x2
	movrgz	%g3,	0x2B6,	%i0
	smulcc	%g5,	0x1E29,	%l5
	wr	%g0,	0x04,	%asi
	ldsha	[%l7 + 0x62] %asi,	%i7
	edge32n	%o1,	%l4,	%o0
	edge16n	%i4,	%o6,	%i2
	movgu	%xcc,	%l1,	%g6
	nop
	setx	loop_2260,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	ta	%icc,	0x0
	fpadd32s	%f25,	%f18,	%f18
	tvs	%xcc,	0x5
loop_2260:
	umulcc	%l2,	%i5,	%o3
	tle	%xcc,	0x6
	wr	%g0,	0x80,	%asi
	prefetcha	[%l7 + 0x10] %asi,	 0x0
	fnot1s	%f16,	%f11
	srlx	%g4,	0x12,	%g1
	movpos	%icc,	%o7,	%g2
	umulcc	%i1,	%i6,	%l6
	bl	loop_2261
	fbu	%fcc3,	loop_2262
	movrne	%l3,	0x0E7,	%i3
	srlx	%l0,	0x0C,	%o4
loop_2261:
	sllx	%o5,	0x17,	%g7
loop_2262:
	movneg	%xcc,	%i0,	%g3
	fbl	%fcc0,	loop_2263
	fbge,a	%fcc0,	loop_2264
	srl	%g5,	%l5,	%o1
	stx	%i7,	[%l7 + 0x50]
loop_2263:
	movle	%icc,	%o0,	%l4
loop_2264:
	fpsub16s	%f23,	%f28,	%f14
	move	%xcc,	%i4,	%i2
	fpadd32	%f16,	%f0,	%f2
	or	%o6,	%l1,	%g6
	array32	%l2,	%o3,	%o2
	movrlez	%i5,	%g1,	%o7
	sub	%g2,	%i1,	%g4
	sllx	%i6,	%l6,	%i3
	fcmped	%fcc0,	%f4,	%f24
	fmovscs	%xcc,	%f6,	%f9
	fzero	%f4
	orn	%l0,	%l3,	%o5
	wr	%g0,	0x19,	%asi
	lduba	[%l7 + 0x51] %asi,	%o4
	sub	%g7,	%g3,	%i0
	fbl,a	%fcc2,	loop_2265
	fbne,a	%fcc0,	loop_2266
	ba	%icc,	loop_2267
	sll	%l5,	%g5,	%i7
loop_2265:
	tvs	%xcc,	0x0
loop_2266:
	sdiv	%o1,	0x00F8,	%o0
loop_2267:
	tle	%xcc,	0x2
	movgu	%xcc,	%l4,	%i2
	fmovrdne	%i4,	%f0,	%f18
	ba,pt	%xcc,	loop_2268
	andcc	%l1,	0x1483,	%o6
	fbg,a	%fcc2,	loop_2269
	bne,pt	%xcc,	loop_2270
loop_2268:
	tgu	%xcc,	0x0
	srax	%g6,	0x13,	%l2
loop_2269:
	tcc	%xcc,	0x1
loop_2270:
	tne	%icc,	0x5
	tvs	%icc,	0x5
	movvs	%xcc,	%o2,	%i5
	fbg,a	%fcc1,	loop_2271
	smulcc	%o3,	%o7,	%g1
	fmul8x16	%f19,	%f24,	%f10
	movle	%icc,	%g2,	%i1
loop_2271:
	nop
	set	0x60, %g3
	ldda	[%l7 + %g3] 0x19,	%g4
	sir	0x101A
	movge	%xcc,	%i6,	%l6
	or	%l0,	%i3,	%o5
	edge8	%l3,	%g7,	%g3
	array16	%i0,	%l5,	%o4
	tle	%icc,	0x6
	move	%xcc,	%g5,	%i7
	subc	%o1,	0x0A2D,	%l4
	fone	%f16
	fpsub16	%f12,	%f0,	%f10
	and	%i2,	%o0,	%i4
	smulcc	%l1,	%g6,	%o6
	wr	%g0,	0x80,	%asi
	lda	[%l7 + 0x0C] %asi,	%f25
	tle	%icc,	0x5
	fsrc2	%f6,	%f14
	ble,pt	%icc,	loop_2272
	movrgez	%o2,	0x235,	%l2
	sllx	%i5,	%o3,	%o7
	movn	%icc,	%g2,	%g1
loop_2272:
	udiv	%i1,	0x0A5B,	%i6
	fandnot1s	%f19,	%f29,	%f11
	srax	%g4,	%l0,	%l6
	fnot1	%f16,	%f4
	movn	%xcc,	%i3,	%l3
	array8	%o5,	%g7,	%i0
	popc	%l5,	%g3
	fmovrdlez	%g5,	%f22,	%f28
	fmovdgu	%xcc,	%f5,	%f28
	wr	%g0,	0x80,	%asi
	ldxa	[%l7 + 0x48] %asi,	%o4
	tvc	%xcc,	0x1
	be,a	loop_2273
	sra	%o1,	0x1B,	%l4
	movge	%xcc,	%i2,	%o0
	andncc	%i7,	%i4,	%g6
loop_2273:
	fnegd	%f20,	%f2
	brgz,a	%l1,	loop_2274
	movne	%icc,	%o2,	%l2
	tneg	%xcc,	0x2
	fba	%fcc3,	loop_2275
loop_2274:
	fmovspos	%xcc,	%f25,	%f25
	fbl	%fcc0,	loop_2276
	tne	%xcc,	0x1
loop_2275:
	bcs	loop_2277
	sub	%o6,	0x0E9B,	%i5
loop_2276:
	taddcc	%o7,	%g2,	%o3
	edge32ln	%g1,	%i6,	%g4
loop_2277:
	tn	%icc,	0x3
	fpack32	%f24,	%f16,	%f2
	xnorcc	%l0,	%l6,	%i1
	brz	%i3,	loop_2278
	ble,a	%icc,	loop_2279
	brlez,a	%l3,	loop_2280
	sdivcc	%o5,	0x1B7A,	%i0
loop_2278:
	nop
	set	0x3C, %l5
	ldsba	[%l7 + %l5] 0x81,	%l5
loop_2279:
	movcc	%icc,	%g7,	%g5
loop_2280:
	nop
	set	0x64, %g4
	sta	%f2,	[%l7 + %g4] 0x11
	fbl	%fcc2,	loop_2281
	stbar
	wr	%g0,	0x11,	%asi
	ldsha	[%l7 + 0x1C] %asi,	%g3
loop_2281:
	umulcc	%o1,	0x0153,	%l4
	set	0x10, %i0
	ldda	[%l7 + %i0] 0xeb,	%i2
	sra	%o0,	0x1B,	%i7
	tl	%icc,	0x6
	ld	[%l7 + 0x38],	%f4
	fpadd32s	%f20,	%f12,	%f20
	ba,a,pn	%xcc,	loop_2282
	andncc	%o4,	%i4,	%l1
	add	%l7,	0x48,	%l6
	wr	%g0,	0x0c,	%asi
	casa	[%l6] %asi,	%g6,	%o2
loop_2282:
	ldsb	[%l7 + 0x57],	%l2
	tleu	%xcc,	0x5
	set	0x36, %g1
	ldsha	[%l7 + %g1] 0x80,	%i5
	fmovsvc	%xcc,	%f17,	%f1
	ldub	[%l7 + 0x64],	%o7
	flush	%l7 + 0x50
	movrgz	%g2,	0x207,	%o6
	ldd	[%l7 + 0x10],	%f10
	ldsb	[%l7 + 0x3D],	%g1
	xnorcc	%i6,	0x12B6,	%o3
	bn,a	loop_2283
	movcs	%icc,	%l0,	%g4
	subc	%l6,	%i3,	%i1
	fpsub32	%f4,	%f18,	%f18
loop_2283:
	bgu,pt	%icc,	loop_2284
	tg	%xcc,	0x5
	tvs	%xcc,	0x7
	sethi	0x07F1,	%o5
loop_2284:
	movne	%icc,	%l3,	%l5
	fabss	%f29,	%f6
	udivcc	%g7,	0x1DE9,	%g5
	brnz,a	%g3,	loop_2285
	add	%o1,	%l4,	%i0
	tl	%icc,	0x6
	xorcc	%i2,	0x0CDD,	%i7
loop_2285:
	fornot1s	%f13,	%f8,	%f10
	andcc	%o4,	%o0,	%l1
	st	%f7,	[%l7 + 0x58]
	fnand	%f6,	%f14,	%f6
	srlx	%i4,	%o2,	%g6
	move	%icc,	%l2,	%i5
	edge8ln	%o7,	%o6,	%g2
	and	%g1,	0x196E,	%i6
	prefetch	[%l7 + 0x24],	 0x2
	fcmps	%fcc1,	%f9,	%f14
	udivcc	%l0,	0x0219,	%g4
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
	set	0x40, %i6
	ldda	[%l7 + %i6] 0x15,	%i6
	fbug	%fcc3,	loop_2286
	fmovsne	%xcc,	%f23,	%f2
	edge16l	%i3,	%i1,	%o3
	subccc	%l3,	%l5,	%g7
loop_2286:
	addcc	%g5,	%g3,	%o5
	tsubcc	%l4,	%o1,	%i0
	movge	%icc,	%i2,	%o4
	udiv	%i7,	0x1C13,	%l1
	wr	%g0,	0x81,	%asi
	stba	%o0,	[%l7 + 0x2B] %asi
	call	loop_2287
	fbo	%fcc1,	loop_2288
	addc	%o2,	%i4,	%l2
	movgu	%icc,	%i5,	%o7
loop_2287:
	flush	%l7 + 0x24
loop_2288:
	flush	%l7 + 0x5C
	movrgz	%o6,	%g6,	%g2
	movl	%xcc,	%g1,	%l0
	edge16ln	%i6,	%g4,	%i3
	fmovda	%icc,	%f29,	%f1
	tneg	%xcc,	0x7
	movleu	%xcc,	%i1,	%l6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x2C, %i3
	lda	[%l7 + %i3] 0x04,	%f30
	fcmpne32	%f0,	%f30,	%l3
	or	%o3,	0x133E,	%l5
	mulx	%g5,	0x187B,	%g7
	xnorcc	%g3,	%l4,	%o1
	andn	%o5,	0x19AC,	%i2
	or	%o4,	0x02A1,	%i7
	taddcctv	%l1,	%i0,	%o0
	brgez	%o2,	loop_2289
	edge8n	%i4,	%l2,	%o7
	fmovdcc	%xcc,	%f0,	%f27
	fnot1s	%f21,	%f29
loop_2289:
	movvc	%xcc,	%o6,	%g6
	subc	%i5,	%g1,	%l0
	fxors	%f4,	%f26,	%f5
	fmovrdlz	%i6,	%f20,	%f0
	movl	%icc,	%g4,	%g2
	ldsw	[%l7 + 0x4C],	%i3
	fble	%fcc0,	loop_2290
	fcmple16	%f10,	%f0,	%i1
	sllx	%l3,	%o3,	%l6
	tleu	%xcc,	0x3
loop_2290:
	taddcc	%g5,	%g7,	%l5
	te	%xcc,	0x4
	movge	%xcc,	%l4,	%o1
	movle	%icc,	%g3,	%o5
	wr	%g0,	0x0c,	%asi
	stwa	%i2,	[%l7 + 0x40] %asi
	fbe	%fcc1,	loop_2291
	bcs,pt	%xcc,	loop_2292
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
	movn	%icc,	%i7,	%l1
loop_2291:
	tsubcctv	%i0,	%o0,	%o4
loop_2292:
	fpsub32s	%f12,	%f11,	%f4
loop_2293:
	bpos,a	%xcc,	loop_2294
	fbu,a	%fcc0,	loop_2295
	edge16l	%o2,	%l2,	%o7
	edge32l	%o6,	%i4,	%g6
loop_2294:
	nop
	set	0x34, %l6
	stwa	%i5,	[%l7 + %l6] 0x10
loop_2295:
	nop
	wr	%g0,	0x89,	%asi
	ldsba	[%l7 + 0x55] %asi,	%l0
	set	0x40, %i5
	stda	%f0,	[%l7 + %i5] 0x18
	udivx	%i6,	0x09A4,	%g4
	movvc	%icc,	%g2,	%i3
	add	%g1,	0x13F5,	%l3
	tvs	%xcc,	0x3
	edge8l	%o3,	%i1,	%l6
	popc	%g7,	%g5
	movneg	%xcc,	%l4,	%l5
	edge32n	%o1,	%g3,	%o5
	subccc	%i2,	%l1,	%i0
	fmovrse	%i7,	%f31,	%f31
	ta	%xcc,	0x5
	udivx	%o4,	0x0BC9,	%o2
	bn	loop_2296
	udiv	%o0,	0x190C,	%l2
	tcs	%icc,	0x3
	stb	%o6,	[%l7 + 0x24]
loop_2296:
	tneg	%icc,	0x7
	tneg	%xcc,	0x7
	orn	%i4,	%o7,	%g6
	wr	%g0,	0x18,	%asi
	ldsha	[%l7 + 0x10] %asi,	%l0
	array16	%i6,	%i5,	%g2
	tcs	%icc,	0x5
	udivx	%g4,	0x0548,	%i3
	udivcc	%l3,	0x0226,	%g1
	movpos	%icc,	%i1,	%o3
	addccc	%g7,	%g5,	%l6
	movrlz	%l4,	0x303,	%l5
	wr	%g0,	0x18,	%asi
	lduba	[%l7 + 0x61] %asi,	%o1
	fcmps	%fcc0,	%f8,	%f21
	tn	%xcc,	0x7
	edge8ln	%g3,	%o5,	%l1
	or	%i2,	0x1A38,	%i7
	movl	%icc,	%o4,	%o2
	brz	%i0,	loop_2297
	fmovdneg	%xcc,	%f27,	%f16
	tgu	%xcc,	0x6
	tne	%xcc,	0x0
loop_2297:
	fcmple16	%f24,	%f0,	%o0
	ldsh	[%l7 + 0x2A],	%o6
	fandnot1	%f20,	%f0,	%f24
	movrne	%i4,	%o7,	%l2
	orncc	%g6,	0x14B9,	%l0
	movrlez	%i6,	%g2,	%i5
	sll	%g4,	%l3,	%i3
	bge,a,pn	%xcc,	loop_2298
	fmovdle	%xcc,	%f18,	%f25
	sdivx	%i1,	0x0E06,	%g1
	movleu	%icc,	%o3,	%g7
loop_2298:
	mulscc	%g5,	0x14B7,	%l6
	edge32ln	%l4,	%l5,	%o1
	bn,a,pt	%xcc,	loop_2299
	edge8ln	%g3,	%o5,	%i2
	movg	%icc,	%i7,	%l1
	movrlz	%o2,	0x09E,	%i0
loop_2299:
	bcs,a,pt	%xcc,	loop_2300
	fmovdcs	%xcc,	%f12,	%f17
	movne	%icc,	%o4,	%o6
	wr	%g0,	0x19,	%asi
	ldsha	[%l7 + 0x12] %asi,	%i4
loop_2300:
	movvc	%xcc,	%o0,	%l2
	lduh	[%l7 + 0x2A],	%g6
	fpadd32	%f10,	%f6,	%f14
	popc	0x117D,	%l0
	fmuld8ulx16	%f30,	%f21,	%f6
	xorcc	%o7,	%g2,	%i6
	addccc	%g4,	%l3,	%i3
	movrgz	%i5,	0x263,	%g1
	tn	%icc,	0x7
	xorcc	%o3,	0x18ED,	%i1
	tvc	%xcc,	0x5
	movrlz	%g7,	%l6,	%g5
	wr	%g0,	0x18,	%asi
	lda	[%l7 + 0x3C] %asi,	%f25
	bvc,pn	%xcc,	loop_2301
	fcmple16	%f12,	%f16,	%l5
	movgu	%icc,	%o1,	%g3
	fba	%fcc0,	loop_2302
loop_2301:
	edge16n	%l4,	%o5,	%i7
	edge32ln	%i2,	%o2,	%l1
	movre	%i0,	0x285,	%o4
loop_2302:
	brgez	%o6,	loop_2303
	fsrc2s	%f26,	%f7
	add	%l7,	0x28,	%l6
	wr	%g0,	0x04,	%asi
	ldxa	[%l6] %asi,	%o0
	casxa	[%l6] 0x04,	%o0,	%l2
loop_2303:
	andcc	%i4,	%g6,	%o7
	edge16ln	%l0,	%i6,	%g4
	srl	%l3,	%g2,	%i3
	add	%i5,	%o3,	%g1
	fandnot1s	%f18,	%f21,	%f28
	subcc	%g7,	%i1,	%g5
	fones	%f24
	edge16l	%l5,	%o1,	%g3
	fmovsle	%icc,	%f31,	%f20
	fmovdneg	%icc,	%f0,	%f12
	fpsub32s	%f15,	%f18,	%f22
	set	0x6F, %o1
	lduba	[%l7 + %o1] 0x15,	%l4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fblg	%fcc1,	loop_2304
	fbul	%fcc3,	loop_2305
	brlez,a	%l6,	loop_2306
	lduh	[%l7 + 0x0E],	%o5
loop_2304:
	tsubcc	%i2,	%i7,	%o2
loop_2305:
	subc	%l1,	0x0FE1,	%o4
loop_2306:
	fmovsl	%icc,	%f11,	%f13
	movpos	%icc,	%i0,	%o0
	sdivcc	%o6,	0x1B73,	%i4
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
	ba,a	%icc,	loop_2308
	movrlz	%g6,	%o7,	%l0
	addcc	%i6,	%l2,	%l3
loop_2307:
	nop
	set	0x2B, %i2
	ldstuba	[%l7 + %i2] 0x80,	%g2
loop_2308:
	bneg	loop_2309
	sethi	0x1D47,	%i3
	add	%g4,	%o3,	%i5
	ldd	[%l7 + 0x38],	%g6
loop_2309:
	andn	%g1,	%g5,	%l5
	fmovrdne	%i1,	%f14,	%f14
	sdiv	%o1,	0x1E7B,	%g3
	movgu	%xcc,	%l6,	%o5
	stx	%l4,	[%l7 + 0x08]
	udivcc	%i2,	0x0E7A,	%i7
	movge	%icc,	%o2,	%o4
	fmovsa	%icc,	%f3,	%f26
	movvc	%icc,	%i0,	%l1
	fbne	%fcc2,	loop_2310
	fbule,a	%fcc2,	loop_2311
	popc	%o6,	%i4
	andcc	%o0,	%o7,	%l0
loop_2310:
	sth	%i6,	[%l7 + 0x2E]
loop_2311:
	ta	%icc,	0x5
	fbuge	%fcc0,	loop_2312
	taddcc	%g6,	%l2,	%g2
	fble,a	%fcc2,	loop_2313
	fnegd	%f8,	%f30
loop_2312:
	fba	%fcc2,	loop_2314
	srax	%l3,	%g4,	%o3
loop_2313:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrlez	%i5,	0x177,	%i3
loop_2314:
	sllx	%g1,	0x1B,	%g7
	fmovrslez	%l5,	%f4,	%f19
	fmovrslez	%g5,	%f19,	%f31
	sethi	0x0FE5,	%o1
	movrgz	%i1,	0x03F,	%l6
	edge8ln	%g3,	%o5,	%i2
	add	%l4,	0x10FE,	%o2
	stbar
	tvs	%xcc,	0x3
	bne,a,pt	%icc,	loop_2315
	call	loop_2316
	edge8n	%o4,	%i0,	%l1
	movn	%icc,	%o6,	%i7
loop_2315:
	edge8	%o0,	%i4,	%o7
loop_2316:
	nop
	add	%l7,	0x54,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%l0
	casa	[%l6] %asi,	%l0,	%g6
	ldd	[%l7 + 0x40],	%f12
	swap	[%l7 + 0x18],	%l2
	sra	%i6,	%g2,	%l3
	bne,pt	%xcc,	loop_2317
	movrlz	%g4,	%o3,	%i3
	tle	%xcc,	0x7
	fmuld8sux16	%f11,	%f2,	%f8
loop_2317:
	andn	%i5,	0x06C3,	%g1
	edge16ln	%g7,	%g5,	%o1
	fexpand	%f26,	%f14
	ldsh	[%l7 + 0x46],	%l5
	subcc	%l6,	0x0034,	%g3
	umulcc	%o5,	%i2,	%i1
	or	%o2,	%o4,	%l4
	popc	%l1,	%o6
	fmovdne	%icc,	%f24,	%f12
	fpsub32s	%f31,	%f28,	%f1
	fnot2	%f10,	%f4
	bgu,a	loop_2318
	edge16ln	%i7,	%o0,	%i0
	movcc	%xcc,	%i4,	%l0
	sdivx	%o7,	0x0577,	%g6
loop_2318:
	fmovsneg	%icc,	%f29,	%f26
	fmovdg	%icc,	%f30,	%f7
	movrgz	%l2,	%g2,	%l3
	wr	%g0,	0xf0,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
	edge32	%g4,	%o3,	%i6
	fbue,a	%fcc2,	loop_2319
	tge	%icc,	0x6
	fmovscs	%xcc,	%f7,	%f1
	addccc	%i3,	0x0E71,	%i5
loop_2319:
	tvs	%icc,	0x7
	sll	%g1,	%g5,	%o1
	alignaddr	%l5,	%g7,	%g3
	flush	%l7 + 0x14
	orncc	%l6,	0x10A6,	%o5
	fsrc2s	%f6,	%f16
	fcmple16	%f6,	%f16,	%i1
	brlz,a	%o2,	loop_2320
	sra	%i2,	%o4,	%l4
	bn,pn	%icc,	loop_2321
	movpos	%icc,	%o6,	%l1
loop_2320:
	tge	%xcc,	0x5
	movl	%xcc,	%i7,	%i0
loop_2321:
	movleu	%icc,	%i4,	%l0
	edge32l	%o0,	%o7,	%l2
	fmul8sux16	%f14,	%f0,	%f10
	tneg	%icc,	0x3
	fzero	%f18
	add	%l7,	0x68,	%l6
	wr	%g0,	0x19,	%asi
	casxa	[%l6] %asi,	%g2,	%l3
	srax	%g4,	0x09,	%o3
	movrlez	%g6,	0x00F,	%i3
	brlez	%i6,	loop_2322
	orncc	%g1,	%i5,	%g5
	add	%l5,	0x0E81,	%o1
	movl	%icc,	%g7,	%g3
loop_2322:
	movl	%xcc,	%l6,	%o5
	edge16l	%i1,	%o2,	%i2
	fbuge	%fcc2,	loop_2323
	ldsw	[%l7 + 0x3C],	%l4
	alignaddr	%o4,	%l1,	%i7
	fmovsg	%icc,	%f24,	%f27
loop_2323:
	edge8l	%o6,	%i0,	%l0
	wr	%g0,	0x80,	%asi
	ldsba	[%l7 + 0x4C] %asi,	%o0
	tgu	%icc,	0x5
	addc	%i4,	%o7,	%g2
	sdivx	%l3,	0x025F,	%g4
	brgz,a	%o3,	loop_2324
	sllx	%g6,	0x1D,	%i3
	ldd	[%l7 + 0x20],	%l2
	array16	%i6,	%g1,	%g5
loop_2324:
	fmovrdlez	%l5,	%f8,	%f4
	fble	%fcc1,	loop_2325
	fblg,a	%fcc1,	loop_2326
	brlz	%i5,	loop_2327
	edge8l	%o1,	%g7,	%l6
loop_2325:
	edge16ln	%o5,	%g3,	%o2
loop_2326:
	bvc,pt	%icc,	loop_2328
loop_2327:
	fmovdle	%xcc,	%f8,	%f28
	or	%i2,	0x1E37,	%i1
	nop
	set	0x10, %o3
	prefetch	[%l7 + %o3],	 0x3
loop_2328:
	nop
	setx	loop_2329,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	sllx	%l4,	0x1D,	%o4
	fcmpne16	%f22,	%f10,	%l1
	edge16	%o6,	%i7,	%l0
loop_2329:
	fmovrdgez	%i0,	%f30,	%f22
	edge32	%o0,	%i4,	%g2
	call	loop_2330
	movrne	%o7,	%l3,	%g4
	umul	%g6,	%o3,	%i3
	fbo,a	%fcc3,	loop_2331
loop_2330:
	movrlz	%l2,	0x24E,	%i6
	movpos	%icc,	%g1,	%l5
	edge32	%i5,	%g5,	%o1
loop_2331:
	orncc	%g7,	0x0655,	%o5
	fnegd	%f14,	%f28
	add	%l7,	0x60,	%l6
	wr	%g0,	0x18,	%asi
	casa	[%l6] %asi,	%l6,	%o2
	movvc	%icc,	%g3,	%i2
	swap	[%l7 + 0x28],	%i1
	andcc	%o4,	0x132A,	%l1
	fmovsvs	%icc,	%f25,	%f15
	array32	%o6,	%i7,	%l0
	fbe	%fcc1,	loop_2332
	xor	%i0,	0x1078,	%o0
	fnot1s	%f2,	%f31
	siam	0x4
loop_2332:
	xnorcc	%l4,	%i4,	%g2
	prefetch	[%l7 + 0x44],	 0x0
	movleu	%xcc,	%l3,	%o7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andcc	%g6,	%g4,	%o3
	xorcc	%l2,	0x1D05,	%i6
	or	%i3,	0x1463,	%g1
	subccc	%l5,	0x1D47,	%i5
	bleu,a	loop_2333
	xnorcc	%o1,	%g5,	%g7
	sdivx	%l6,	0x149C,	%o2
	sdiv	%g3,	0x1866,	%o5
loop_2333:
	movpos	%xcc,	%i2,	%i1
	edge16ln	%l1,	%o6,	%i7
	sll	%l0,	%i0,	%o0
	movneg	%xcc,	%l4,	%o4
	bcs,a,pn	%xcc,	loop_2334
	srlx	%i4,	0x1B,	%g2
	andn	%l3,	%g6,	%o7
	tsubcc	%g4,	0x066D,	%o3
loop_2334:
	fbge	%fcc2,	loop_2335
	tn	%icc,	0x0
	alignaddr	%i6,	%i3,	%l2
	prefetch	[%l7 + 0x30],	 0x0
loop_2335:
	movrlz	%l5,	%i5,	%o1
	fmovdleu	%icc,	%f29,	%f12
	tneg	%xcc,	0x0
	fbe,a	%fcc0,	loop_2336
	fmovsvs	%icc,	%f21,	%f1
	stx	%g1,	[%l7 + 0x20]
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2336:
	ldsh	[%l7 + 0x44],	%g5
	brgez	%g7,	loop_2337
	movrgez	%l6,	%o2,	%g3
	movrlez	%o5,	%i1,	%i2
	fbn	%fcc3,	loop_2338
loop_2337:
	movge	%icc,	%o6,	%i7
	fmovspos	%xcc,	%f3,	%f18
	tsubcctv	%l1,	0x0DAC,	%i0
loop_2338:
	fcmpne32	%f12,	%f4,	%o0
	add	%l7,	0x18,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%l4,	%l0
	edge16n	%i4,	%g2,	%l3
	movleu	%icc,	%g6,	%o4
	movrlz	%o7,	%o3,	%g4
	taddcctv	%i3,	%i6,	%l2
	fmovsg	%icc,	%f9,	%f9
	fmovsvc	%icc,	%f31,	%f15
	mulscc	%l5,	%i5,	%o1
	tvc	%icc,	0x7
	nop
	setx loop_2339, %l0, %l1
	jmpl %l1, %g5
	movrlez	%g1,	0x086,	%l6
	movl	%icc,	%o2,	%g3
	fblg,a	%fcc1,	loop_2340
loop_2339:
	bcs,a,pn	%xcc,	loop_2341
	fpsub32s	%f6,	%f18,	%f8
	xnor	%o5,	%i1,	%g7
loop_2340:
	edge8n	%i2,	%i7,	%l1
loop_2341:
	membar	0x58
	xnorcc	%i0,	%o0,	%l4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sethi	0x04EF,	%l0
	movrne	%o6,	%i4,	%l3
	sethi	0x0705,	%g2
	sll	%g6,	0x1D,	%o4
	movleu	%icc,	%o3,	%o7
	umul	%i3,	0x07F9,	%g4
	edge16	%l2,	%i6,	%l5
	sub	%i5,	%o1,	%g1
	nop
	setx	loop_2342,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	sdiv	%g5,	0x184D,	%l6
	edge32n	%o2,	%o5,	%i1
	mulscc	%g7,	0x0FE9,	%i2
loop_2342:
	ba,pn	%xcc,	loop_2343
	srlx	%g3,	%i7,	%l1
	fabsd	%f14,	%f18
	bn,pn	%xcc,	loop_2344
loop_2343:
	te	%icc,	0x4
	alignaddrl	%i0,	%l4,	%o0
	membar	0x42
loop_2344:
	fbge	%fcc3,	loop_2345
	srax	%o6,	0x0F,	%i4
	fcmped	%fcc1,	%f2,	%f22
	srlx	%l0,	%l3,	%g6
loop_2345:
	tcc	%xcc,	0x0
	fcmpne32	%f30,	%f8,	%g2
	taddcctv	%o4,	0x0127,	%o7
	bl,a,pt	%xcc,	loop_2346
	bpos,a	loop_2347
	edge8	%o3,	%g4,	%l2
	ldsh	[%l7 + 0x62],	%i6
loop_2346:
	subcc	%l5,	%i3,	%o1
loop_2347:
	fmovrslz	%g1,	%f14,	%f9
	xorcc	%g5,	%i5,	%l6
	tl	%icc,	0x2
	wr	%g0,	0x80,	%asi
	ldda	[%l7 + 0x70] %asi,	%o4
	edge32l	%i1,	%o2,	%g7
	wr	%g0,	0x11,	%asi
	sta	%f18,	[%l7 + 0x2C] %asi
	tcs	%xcc,	0x4
	brz,a	%g3,	loop_2348
	st	%f2,	[%l7 + 0x50]
	edge16n	%i7,	%i2,	%l1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2348:
	tsubcctv	%i0,	%l4,	%o0
	edge32n	%o6,	%l0,	%i4
	set	0x40, %l1
	stda	%f16,	[%l7 + %l1] 0xf0
	membar	#Sync
	fpsub16s	%f22,	%f12,	%f9
	movrgz	%g6,	0x1BA,	%l3
	xor	%o4,	%g2,	%o3
	ldub	[%l7 + 0x52],	%g4
	wr	%g0,	0x04,	%asi
	stda	%l2,	[%l7 + 0x40] %asi
	fbug	%fcc0,	loop_2349
	nop
	set	0x30, %o6
	std	%f20,	[%l7 + %o6]
	brlez	%i6,	loop_2350
	xnorcc	%l5,	%i3,	%o7
loop_2349:
	fcmpne16	%f20,	%f8,	%o1
	movcs	%icc,	%g5,	%g1
loop_2350:
	subccc	%i5,	%o5,	%l6
	tsubcctv	%i1,	0x175F,	%o2
	movcs	%xcc,	%g7,	%g3
	addcc	%i7,	0x0E35,	%l1
	edge8n	%i0,	%i2,	%l4
	set	0x50, %g2
	ldda	[%l7 + %g2] 0x10,	%o6
	set	0x6C, %o2
	swapa	[%l7 + %o2] 0x81,	%l0
	fornot1	%f22,	%f12,	%f6
	tleu	%icc,	0x7
	fmovse	%icc,	%f27,	%f16
	brgez,a	%o0,	loop_2351
	taddcctv	%g6,	0x0080,	%l3
	fnor	%f20,	%f26,	%f22
	fmovdcc	%icc,	%f0,	%f3
loop_2351:
	ldub	[%l7 + 0x6B],	%i4
	sra	%g2,	0x08,	%o3
	bvs,a,pn	%xcc,	loop_2352
	fabss	%f16,	%f12
	tleu	%xcc,	0x3
	tpos	%xcc,	0x1
loop_2352:
	addcc	%o4,	0x1235,	%l2
	fcmpeq16	%f2,	%f30,	%g4
	brlz,a	%l5,	loop_2353
	movne	%icc,	%i6,	%o7
	wr	%g0,	0x0c,	%asi
	ldsba	[%l7 + 0x66] %asi,	%i3
loop_2353:
	movle	%xcc,	%g5,	%g1
	bcs,a,pt	%xcc,	loop_2354
	std	%o0,	[%l7 + 0x70]
	umul	%o5,	0x1BAC,	%l6
	ba	loop_2355
loop_2354:
	fcmped	%fcc0,	%f20,	%f16
	addcc	%i1,	0x1576,	%i5
	wr	%g0,	0x19,	%asi
	ldswa	[%l7 + 0x2C] %asi,	%g7
loop_2355:
	fblg,a	%fcc1,	loop_2356
	fabsd	%f30,	%f8
	alignaddrl	%g3,	%o2,	%i7
	movneg	%icc,	%i0,	%l1
loop_2356:
	nop
	wr	%g0,	0x80,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	set	0x0F, %l0
	ldstuba	[%l7 + %l0] 0x88,	%i2
	wr	%g0,	0x10,	%asi
	stxa	%l4,	[%l7 + 0x60] %asi
	array8	%o6,	%o0,	%g6
	edge8	%l0,	%l3,	%g2
	movrlz	%o3,	%i4,	%l2
	orcc	%o4,	0x1615,	%g4
	fbge	%fcc3,	loop_2357
	movrlz	%l5,	%o7,	%i6
	srl	%g5,	0x08,	%g1
	movl	%icc,	%o1,	%i3
loop_2357:
	srlx	%l6,	0x0C,	%o5
	mova	%xcc,	%i5,	%i1
	edge16	%g7,	%g3,	%i7
	movpos	%xcc,	%o2,	%l1
	fxor	%f18,	%f8,	%f14
	tpos	%icc,	0x4
	fmovsle	%icc,	%f30,	%f17
	stbar
	umulcc	%i0,	%i2,	%l4
	nop
	setx loop_2358, %l0, %l1
	jmpl %l1, %o0
	fmovdneg	%xcc,	%f31,	%f14
	orcc	%o6,	0x1212,	%g6
	add	%l3,	%l0,	%g2
loop_2358:
	mova	%icc,	%i4,	%l2
	tneg	%xcc,	0x1
	move	%icc,	%o4,	%g4
	tn	%xcc,	0x7
	array16	%o3,	%o7,	%i6
	mova	%icc,	%l5,	%g5
	array16	%o1,	%i3,	%g1
	mulscc	%l6,	0x01E9,	%i5
	and	%o5,	%i1,	%g3
	sllx	%i7,	0x18,	%o2
	subcc	%l1,	0x174F,	%g7
	tvc	%icc,	0x6
	fbue	%fcc0,	loop_2359
	tcc	%icc,	0x1
	sra	%i0,	0x0E,	%i2
	fors	%f21,	%f11,	%f10
loop_2359:
	movpos	%xcc,	%l4,	%o6
	sdivcc	%o0,	0x1774,	%g6
	fmovdleu	%icc,	%f8,	%f8
	set	0x4C, %i7
	stwa	%l0,	[%l7 + %i7] 0xe3
	membar	#Sync
	fsrc1s	%f20,	%f21
	xnor	%l3,	%g2,	%i4
	fbug,a	%fcc3,	loop_2360
	taddcc	%l2,	0x0D67,	%g4
	stb	%o3,	[%l7 + 0x3C]
	udivcc	%o4,	0x107B,	%i6
loop_2360:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tne	%icc,	0x1
	sub	%l5,	0x0A47,	%g5
	movle	%xcc,	%o1,	%o7
	fmovdleu	%icc,	%f5,	%f10
	smulcc	%i3,	0x1A6A,	%g1
	udivx	%i5,	0x0853,	%l6
	ldsh	[%l7 + 0x32],	%o5
	movgu	%xcc,	%i1,	%i7
	smulcc	%o2,	0x1184,	%g3
	fxnors	%f30,	%f10,	%f16
	brlez	%l1,	loop_2361
	smulcc	%i0,	%i2,	%g7
	ta	%xcc,	0x3
	bgu	loop_2362
loop_2361:
	movrlez	%l4,	%o0,	%g6
	fandnot1	%f10,	%f8,	%f18
	edge32	%o6,	%l3,	%g2
loop_2362:
	tge	%icc,	0x0
	smul	%l0,	0x004E,	%l2
	fcmpeq32	%f24,	%f8,	%g4
	orn	%o3,	%o4,	%i6
	fabsd	%f6,	%f22
	brlz,a	%l5,	loop_2363
	fmovrse	%g5,	%f11,	%f28
	fmovsvs	%xcc,	%f25,	%f10
	edge8n	%i4,	%o1,	%o7
loop_2363:
	movcc	%icc,	%g1,	%i5
	movl	%xcc,	%l6,	%i3
	fmovsg	%xcc,	%f1,	%f12
	umulcc	%o5,	%i7,	%o2
	fpadd16	%f14,	%f2,	%f2
	fmovsvc	%icc,	%f17,	%f5
	edge16ln	%g3,	%l1,	%i0
	edge32	%i1,	%i2,	%l4
	ldd	[%l7 + 0x60],	%f4
	fbu	%fcc2,	loop_2364
	alignaddr	%o0,	%g7,	%g6
	sllx	%o6,	0x1B,	%l3
	fpack16	%f28,	%f13
loop_2364:
	orncc	%l0,	%g2,	%l2
	fnegd	%f4,	%f6
	wr	%g0,	0x81,	%asi
	stxa	%g4,	[%l7 + 0x70] %asi
	set	0x0C, %o0
	ldstuba	[%l7 + %o0] 0x88,	%o4
	tgu	%icc,	0x6
	array8	%o3,	%l5,	%i6
	mova	%icc,	%i4,	%o1
	mulscc	%o7,	0x0F40,	%g1
	alignaddrl	%g5,	%i5,	%i3
	edge16l	%o5,	%i7,	%o2
	movl	%icc,	%g3,	%l6
	tgu	%xcc,	0x5
	movpos	%xcc,	%i0,	%l1
	wr	%g0,	0x0c,	%asi
	lda	[%l7 + 0x68] %asi,	%f16
	movrgz	%i2,	0x326,	%i1
	edge8	%o0,	%g7,	%l4
	fbne	%fcc0,	loop_2365
	array16	%o6,	%g6,	%l0
	fexpand	%f19,	%f6
	fbu,a	%fcc1,	loop_2366
loop_2365:
	movrlz	%g2,	%l3,	%g4
	fmovs	%f3,	%f4
	bcc,pn	%icc,	loop_2367
loop_2366:
	orncc	%o4,	0x18BF,	%o3
	wr	%g0,	0x89,	%asi
	ldsha	[%l7 + 0x22] %asi,	%l5
loop_2367:
	ta	%icc,	0x7
	stw	%l2,	[%l7 + 0x28]
	st	%f0,	[%l7 + 0x2C]
	fmovrdgz	%i6,	%f30,	%f2
	fxnor	%f18,	%f6,	%f18
	array16	%i4,	%o1,	%o7
	wr	%g0,	0x88,	%asi
	ldswa	[%l7 + 0x10] %asi,	%g5
	subc	%i5,	0x0062,	%g1
	fmovdge	%icc,	%f26,	%f16
	subcc	%o5,	%i7,	%i3
	ldub	[%l7 + 0x75],	%o2
	edge16ln	%l6,	%g3,	%i0
	smulcc	%i2,	%i1,	%o0
	set	0x21, %o5
	ldsba	[%l7 + %o5] 0x14,	%l1
	sdiv	%g7,	0x1E25,	%o6
	brnz,a	%l4,	loop_2368
	movn	%icc,	%g6,	%l0
	wr	%g0,	0x89,	%asi
	ldsba	[%l7 + 0x14] %asi,	%g2
loop_2368:
	movneg	%xcc,	%l3,	%o4
	fandnot2	%f24,	%f10,	%f14
	tsubcc	%g4,	%o3,	%l2
	movl	%xcc,	%i6,	%l5
	tleu	%xcc,	0x3
	fpack16	%f2,	%f24
	fmovsle	%icc,	%f30,	%f4
	fmuld8sux16	%f31,	%f29,	%f12
	fcmpeq16	%f16,	%f10,	%o1
	movvc	%xcc,	%i4,	%g5
	wr	%g0,	0x89,	%asi
	ldsba	[%l7 + 0x3A] %asi,	%o7
	movcs	%xcc,	%i5,	%g1
	and	%o5,	0x0D3B,	%i3
	ble,a,pn	%icc,	loop_2369
	fbul	%fcc2,	loop_2370
	ldstub	[%l7 + 0x25],	%o2
	srax	%l6,	0x1E,	%g3
loop_2369:
	andncc	%i7,	%i0,	%i1
loop_2370:
	movvs	%xcc,	%o0,	%l1
	srlx	%i2,	%g7,	%l4
	alignaddrl	%g6,	%l0,	%o6
	edge16ln	%g2,	%l3,	%g4
	edge8	%o3,	%o4,	%l2
	fandnot2s	%f26,	%f17,	%f6
	sll	%l5,	%o1,	%i6
	array16	%g5,	%o7,	%i4
	set	0x10, %l3
	stda	%g0,	[%l7 + %l3] 0x14
	sdivx	%i5,	0x1F14,	%i3
	edge16l	%o5,	%l6,	%g3
	tvs	%icc,	0x3
	nop
	setx loop_2371, %l0, %l1
	jmpl %l1, %i7
	fpsub16s	%f17,	%f24,	%f24
	fcmps	%fcc0,	%f9,	%f6
	andcc	%i0,	0x03B0,	%o2
loop_2371:
	srax	%i1,	0x0E,	%o0
	fmovsa	%icc,	%f5,	%f15
	sdiv	%l1,	0x17F8,	%g7
	set	0x28, %l2
	prefetcha	[%l7 + %l2] 0x11,	 0x0
	fnot1	%f26,	%f4
	fmovda	%xcc,	%f22,	%f18
	set	0x18, %g7
	stda	%g6,	[%l7 + %g7] 0x11
	umulcc	%l0,	%o6,	%l4
	fand	%f20,	%f22,	%f16
	st	%f24,	[%l7 + 0x78]
	movrlz	%l3,	%g2,	%g4
	bpos,a	%icc,	loop_2372
	bcs,a,pt	%icc,	loop_2373
	tsubcc	%o3,	0x1901,	%o4
	fmovda	%icc,	%f1,	%f22
loop_2372:
	edge16n	%l5,	%l2,	%i6
loop_2373:
	edge32	%o1,	%g5,	%i4
	brgez,a	%o7,	loop_2374
	fcmple32	%f12,	%f4,	%i5
	fones	%f24
	movcs	%icc,	%g1,	%o5
loop_2374:
	fcmps	%fcc3,	%f30,	%f28
	fmovscc	%icc,	%f30,	%f12
	set	0x58, %i4
	stba	%i3,	[%l7 + %i4] 0xe2
	membar	#Sync
	xnorcc	%g3,	0x09B5,	%i7
	tvc	%xcc,	0x5
	edge32ln	%i0,	%o2,	%i1
	movleu	%xcc,	%l6,	%l1
	bcs,a,pt	%icc,	loop_2375
	xnorcc	%g7,	%i2,	%o0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mova	%xcc,	%l0,	%g6
loop_2375:
	taddcc	%l4,	%o6,	%g2
	fmovspos	%xcc,	%f12,	%f18
	movg	%icc,	%g4,	%l3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mova	%xcc,	%o3,	%o4
	srax	%l2,	0x03,	%i6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnorcc	%l5,	0x018E,	%o1
	ldstub	[%l7 + 0x7F],	%g5
	fmovscc	%xcc,	%f13,	%f17
	movrgz	%o7,	%i5,	%g1
	te	%icc,	0x0
	tne	%xcc,	0x7
	edge32	%i4,	%o5,	%g3
	bgu	%icc,	loop_2376
	addc	%i3,	%i7,	%i0
	fbul	%fcc3,	loop_2377
	fmovscc	%icc,	%f25,	%f24
loop_2376:
	orn	%i1,	%l6,	%o2
	addccc	%g7,	0x0979,	%i2
loop_2377:
	orn	%l1,	%o0,	%g6
	edge32l	%l4,	%o6,	%l0
	sll	%g2,	%l3,	%o3
	sub	%o4,	0x0BAA,	%l2
	fzeros	%f26
	sllx	%g4,	0x0E,	%l5
	set	0x58, %l4
	stxa	%i6,	[%l7 + %l4] 0x22
	membar	#Sync
	wr	%g0,	0x0c,	%asi
	ldswa	[%l7 + 0x14] %asi,	%o1
	sra	%o7,	0x1D,	%i5
	sub	%g5,	%i4,	%g1
	fxors	%f29,	%f28,	%f23
	fmovdgu	%icc,	%f0,	%f11
	add	%l7,	0x1C,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%o5
	casa	[%l6] 0x89,	%o5,	%g3
	subc	%i7,	0x11D1,	%i0
	fsrc2s	%f11,	%f26
	sir	0x1F06
	sdivcc	%i1,	0x0CA2,	%i3
	array8	%l6,	%g7,	%i2
	faligndata	%f0,	%f30,	%f16
	smul	%o2,	%o0,	%l1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addccc	%l4,	0x0DDA,	%g6
	nop
	set	0x21, %g6
	ldub	[%l7 + %g6],	%l0
	addc	%g2,	%l3,	%o6
	fble	%fcc3,	loop_2378
	movleu	%icc,	%o4,	%o3
	ta	%icc,	0x4
	tgu	%icc,	0x7
loop_2378:
	tgu	%icc,	0x2
	xnor	%l2,	0x1151,	%l5
	movl	%xcc,	%g4,	%o1
	for	%f12,	%f2,	%f28
	fmovrdgez	%i6,	%f6,	%f24
	fcmpeq32	%f10,	%f6,	%o7
	bn,a,pn	%xcc,	loop_2379
	edge8ln	%g5,	%i5,	%i4
	set	0x1C, %o7
	ldstuba	[%l7 + %o7] 0x10,	%o5
loop_2379:
	bcc,a,pt	%xcc,	loop_2380
	tne	%xcc,	0x6
	ta	%icc,	0x6
	stbar
loop_2380:
	subcc	%g3,	0x118D,	%g1
	bvs,pn	%icc,	loop_2381
	umulcc	%i7,	%i0,	%i3
	edge8ln	%l6,	%i1,	%g7
	udiv	%o2,	0x1D05,	%i2
loop_2381:
	tcs	%xcc,	0x6
	sdivcc	%l1,	0x01FA,	%o0
	tneg	%icc,	0x2
	brlez,a	%l4,	loop_2382
	sethi	0x174A,	%g6
	alignaddr	%l0,	%l3,	%o6
	tcs	%icc,	0x7
loop_2382:
	nop
	set	0x5C, %g5
	lda	[%l7 + %g5] 0x15,	%f21
	udiv	%o4,	0x0302,	%g2
	fpsub32	%f18,	%f20,	%f0
	tleu	%icc,	0x1
	sllx	%l2,	%o3,	%l5
	fmovdpos	%xcc,	%f15,	%f10
	movrgez	%o1,	%i6,	%o7
	fmovda	%xcc,	%f17,	%f12
	sethi	0x1F64,	%g4
	fpsub32s	%f30,	%f2,	%f17
	edge16n	%g5,	%i5,	%o5
	tle	%icc,	0x1
	tl	%icc,	0x1
	brz,a	%i4,	loop_2383
	ldub	[%l7 + 0x2C],	%g3
	edge32ln	%i7,	%g1,	%i0
	fand	%f6,	%f0,	%f16
loop_2383:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sub	%i3,	0x10D2,	%i1
	taddcc	%g7,	0x02D8,	%l6
	bcs,pt	%icc,	loop_2384
	be,a,pn	%xcc,	loop_2385
	srlx	%o2,	0x14,	%l1
	movcc	%xcc,	%i2,	%l4
loop_2384:
	tg	%icc,	0x5
loop_2385:
	subccc	%o0,	%l0,	%l3
	ta	%xcc,	0x1
	brnz,a	%o6,	loop_2386
	fmovdvc	%xcc,	%f7,	%f9
	edge8n	%g6,	%g2,	%o4
	fandnot1	%f14,	%f10,	%f20
loop_2386:
	fmovda	%icc,	%f3,	%f11
	movrne	%o3,	%l5,	%l2
	edge8	%o1,	%o7,	%i6
	fmovsa	%xcc,	%f1,	%f11
	ldsb	[%l7 + 0x49],	%g5
	fxnors	%f6,	%f27,	%f16
	tcs	%xcc,	0x2
	tg	%icc,	0x2
	ta	%icc,	0x7
	edge32	%i5,	%o5,	%g4
	ta	%xcc,	0x4
	array8	%g3,	%i7,	%i4
	tge	%icc,	0x6
	fmuld8ulx16	%f2,	%f31,	%f0
	bvs,a,pn	%xcc,	loop_2387
	move	%icc,	%i0,	%g1
	fbug	%fcc3,	loop_2388
	lduw	[%l7 + 0x44],	%i3
loop_2387:
	tl	%xcc,	0x0
	brlz	%g7,	loop_2389
loop_2388:
	tcc	%icc,	0x4
	movn	%xcc,	%i1,	%l6
	fmovd	%f14,	%f30
loop_2389:
	xor	%l1,	0x09D6,	%i2
	tleu	%xcc,	0x6
	set	0x20, %o4
	stda	%l4,	[%l7 + %o4] 0x18
	sethi	0x063A,	%o0
	tpos	%icc,	0x2
	tl	%icc,	0x7
	edge16l	%o2,	%l0,	%l3
	tgu	%icc,	0x1
	fmul8x16	%f16,	%f12,	%f8
	fmovde	%icc,	%f0,	%f25
	movne	%icc,	%g6,	%o6
	or	%g2,	0x13AF,	%o4
	fmovsge	%icc,	%f27,	%f7
	fxors	%f29,	%f6,	%f13
	fbg	%fcc3,	loop_2390
	xorcc	%l5,	0x1ABA,	%l2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sub	%o1,	%o7,	%i6
loop_2390:
	movrne	%o3,	0x039,	%g5
	brnz	%o5,	loop_2391
	edge16l	%i5,	%g4,	%g3
	edge32	%i7,	%i4,	%i0
	sub	%g1,	0x1A9D,	%i3
loop_2391:
	tne	%xcc,	0x1
	fmovdvc	%xcc,	%f25,	%f23
	fsrc2	%f6,	%f8
	fnegd	%f2,	%f16
	movvs	%xcc,	%i1,	%g7
	array8	%l6,	%l1,	%i2
	addc	%l4,	%o2,	%l0
	edge16n	%l3,	%g6,	%o0
	fandnot1	%f16,	%f14,	%f26
	flush	%l7 + 0x74
	movrne	%g2,	%o6,	%o4
	edge16n	%l2,	%o1,	%o7
	movvs	%icc,	%i6,	%l5
	sdiv	%g5,	0x1489,	%o5
	fcmpgt16	%f22,	%f10,	%o3
	xnor	%g4,	0x02F0,	%i5
	fmovrse	%g3,	%f9,	%f6
	addc	%i7,	%i4,	%g1
	tcs	%icc,	0x7
	tsubcctv	%i0,	0x0D57,	%i3
	xor	%g7,	%i1,	%l1
	fcmpne32	%f16,	%f12,	%l6
	tsubcc	%l4,	0x0F32,	%o2
	edge32l	%l0,	%i2,	%g6
	wr	%g0,	0x10,	%asi
	ldsha	[%l7 + 0x74] %asi,	%l3
	subcc	%g2,	%o6,	%o0
	xor	%l2,	0x1711,	%o4
	fmovdg	%icc,	%f13,	%f11
	srax	%o7,	%o1,	%l5
	sra	%i6,	%o5,	%g5
	fmovrse	%g4,	%f22,	%f17
	movn	%icc,	%i5,	%o3
	subc	%g3,	0x1FFC,	%i7
	mulscc	%i4,	%g1,	%i3
	edge32n	%i0,	%g7,	%l1
	add	%i1,	0x00BB,	%l6
	move	%xcc,	%l4,	%o2
	sub	%l0,	0x12EC,	%g6
	bneg,pn	%icc,	loop_2392
	srlx	%l3,	0x08,	%i2
	fands	%f26,	%f21,	%f11
	fnand	%f14,	%f20,	%f8
loop_2392:
	movrgez	%o6,	%o0,	%g2
	umulcc	%l2,	%o7,	%o4
	sll	%o1,	0x05,	%l5
	edge32ln	%o5,	%i6,	%g4
	taddcctv	%g5,	0x17CF,	%o3
	stbar
	fmovrdne	%i5,	%f6,	%f10
	udivcc	%i7,	0x1D5F,	%i4
	movvc	%icc,	%g3,	%i3
	bg	loop_2393
	bcs	%xcc,	loop_2394
	fmovrdlz	%g1,	%f4,	%f22
	std	%f16,	[%l7 + 0x48]
loop_2393:
	fpadd16	%f6,	%f0,	%f20
loop_2394:
	tgu	%xcc,	0x6
	fmovrdgz	%i0,	%f28,	%f8
	edge32	%g7,	%i1,	%l1
	brlez	%l6,	loop_2395
	tsubcctv	%o2,	0x129C,	%l4
	fxor	%f16,	%f16,	%f30
	fmul8sux16	%f14,	%f10,	%f6
loop_2395:
	ble,pn	%xcc,	loop_2396
	edge8ln	%g6,	%l0,	%l3
	edge16	%i2,	%o0,	%g2
	ldsb	[%l7 + 0x11],	%l2
loop_2396:
	fmovsl	%icc,	%f25,	%f4
	fbuge,a	%fcc0,	loop_2397
	movcc	%xcc,	%o7,	%o6
	lduh	[%l7 + 0x7C],	%o1
	sra	%o4,	0x02,	%l5
loop_2397:
	brz,a	%i6,	loop_2398
	and	%o5,	%g4,	%g5
	bn	%xcc,	loop_2399
	andncc	%o3,	%i7,	%i5
loop_2398:
	udivcc	%i4,	0x0BC7,	%g3
	edge32l	%g1,	%i3,	%g7
loop_2399:
	be,pn	%xcc,	loop_2400
	fba	%fcc0,	loop_2401
	fmovdvs	%xcc,	%f7,	%f28
	tgu	%icc,	0x2
loop_2400:
	movne	%icc,	%i0,	%i1
loop_2401:
	alignaddrl	%l6,	%l1,	%o2
	movcs	%xcc,	%g6,	%l0
	fones	%f31
	edge32n	%l3,	%l4,	%o0
	fmovrse	%i2,	%f5,	%f19
	ble,pn	%icc,	loop_2402
	movgu	%xcc,	%g2,	%l2
	sllx	%o6,	0x0F,	%o7
	fblg,a	%fcc1,	loop_2403
loop_2402:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array16	%o1,	%o4,	%i6
	array32	%o5,	%g4,	%l5
loop_2403:
	tge	%icc,	0x4
	subc	%g5,	0x0942,	%i7
	xnorcc	%o3,	0x05EC,	%i4
	fmovdpos	%icc,	%f1,	%f8
	bpos,a,pn	%icc,	loop_2404
	sll	%g3,	%g1,	%i3
	nop
	setx loop_2405, %l0, %l1
	jmpl %l1, %g7
	brlz	%i0,	loop_2406
loop_2404:
	bcs,a,pt	%xcc,	loop_2407
	tvc	%icc,	0x1
loop_2405:
	umul	%i1,	%l6,	%i5
loop_2406:
	fpackfix	%f26,	%f4
loop_2407:
	nop
	set	0x44, %g3
	stwa	%l1,	[%l7 + %g3] 0x88
	umul	%g6,	%o2,	%l0
	tsubcc	%l3,	0x05B1,	%l4
	fmovsvs	%icc,	%f12,	%f6
	faligndata	%f22,	%f14,	%f30
	tg	%xcc,	0x2
	movgu	%xcc,	%i2,	%g2
	bn,a	%icc,	loop_2408
	orcc	%o0,	0x117F,	%l2
	tsubcc	%o7,	0x0DEB,	%o1
	movrlz	%o6,	0x14A,	%i6
loop_2408:
	movpos	%icc,	%o4,	%o5
	brnz	%g4,	loop_2409
	prefetch	[%l7 + 0x10],	 0x2
	ba	%xcc,	loop_2410
	tsubcc	%l5,	0x0775,	%g5
loop_2409:
	movre	%o3,	%i4,	%g3
	sethi	0x1DC2,	%i7
loop_2410:
	tneg	%icc,	0x0
	ldsh	[%l7 + 0x5A],	%i3
	bcc,a,pt	%icc,	loop_2411
	fcmpeq16	%f8,	%f4,	%g1
	fcmpne32	%f2,	%f12,	%i0
	addc	%g7,	%l6,	%i5
loop_2411:
	brz,a	%i1,	loop_2412
	fcmpeq32	%f14,	%f26,	%l1
	alignaddrl	%o2,	%g6,	%l3
	tg	%xcc,	0x0
loop_2412:
	edge32l	%l0,	%i2,	%l4
	add	%l7,	0x10,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%o0
	casa	[%l6] 0x80,	%o0,	%g2
	std	%l2,	[%l7 + 0x50]
	sra	%o1,	0x1E,	%o7
	set	0x34, %l5
	stwa	%i6,	[%l7 + %l5] 0x27
	membar	#Sync
	fmovsa	%icc,	%f13,	%f18
	fmovdleu	%xcc,	%f8,	%f7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tsubcc	%o4,	0x1C2D,	%o5
	fmovdpos	%xcc,	%f0,	%f27
	array16	%o6,	%g4,	%g5
	addccc	%o3,	0x09B8,	%l5
	fcmpeq16	%f6,	%f24,	%g3
	udivx	%i7,	0x1097,	%i3
	movvs	%xcc,	%g1,	%i4
	edge16l	%g7,	%i0,	%l6
	set	0x40, %g4
	ldswa	[%l7 + %g4] 0x15,	%i5
	mulx	%i1,	0x0D90,	%o2
	orcc	%g6,	0x142A,	%l1
	movn	%xcc,	%l3,	%i2
	brlz,a	%l0,	loop_2413
	fand	%f16,	%f22,	%f18
	movrne	%o0,	%l4,	%g2
	fmovrslez	%l2,	%f14,	%f2
loop_2413:
	nop
	set	0x28, %i0
	ldxa	[%l7 + %i0] 0x18,	%o1
	ldsb	[%l7 + 0x40],	%o7
	umulcc	%i6,	0x1BF6,	%o5
	mova	%xcc,	%o6,	%g4
	fblg,a	%fcc1,	loop_2414
	addccc	%g5,	0x0E1E,	%o3
	siam	0x3
	sub	%o4,	%l5,	%i7
loop_2414:
	mulscc	%i3,	0x1172,	%g3
	membar	0x51
	lduh	[%l7 + 0x76],	%g1
	addcc	%g7,	%i0,	%l6
	edge32l	%i5,	%i4,	%i1
	fnegd	%f26,	%f10
	add	%g6,	%o2,	%l1
	tleu	%icc,	0x4
	fcmpne32	%f22,	%f12,	%l3
	prefetch	[%l7 + 0x1C],	 0x2
	brz	%l0,	loop_2415
	edge32ln	%o0,	%i2,	%l4
	orcc	%g2,	%l2,	%o7
	tcc	%icc,	0x5
loop_2415:
	nop
	setx	loop_2416,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movleu	%xcc,	%o1,	%i6
	tleu	%xcc,	0x6
	fbuge,a	%fcc3,	loop_2417
loop_2416:
	tl	%xcc,	0x5
	mulx	%o5,	%o6,	%g5
	movg	%icc,	%g4,	%o3
loop_2417:
	xor	%l5,	%o4,	%i3
	orncc	%g3,	0x1C8B,	%g1
	sir	0x14F0
	sdiv	%g7,	0x13D7,	%i7
	fbn	%fcc2,	loop_2418
	edge16n	%i0,	%i5,	%l6
	fmovrsne	%i4,	%f24,	%f16
	smul	%g6,	%i1,	%o2
loop_2418:
	tgu	%icc,	0x4
	bge	loop_2419
	movvc	%icc,	%l1,	%l3
	movre	%o0,	%l0,	%l4
	edge32n	%g2,	%l2,	%i2
loop_2419:
	alignaddr	%o1,	%o7,	%i6
	sth	%o6,	[%l7 + 0x6A]
	taddcctv	%g5,	0x0B94,	%o5
	fbul	%fcc1,	loop_2420
	fbo,a	%fcc3,	loop_2421
	fmovsg	%xcc,	%f3,	%f14
	edge16ln	%o3,	%g4,	%o4
loop_2420:
	ble	loop_2422
loop_2421:
	tn	%icc,	0x5
	fbul	%fcc3,	loop_2423
	fandnot2s	%f27,	%f28,	%f27
loop_2422:
	fnot2s	%f20,	%f3
	set	0x77, %g1
	stba	%i3,	[%l7 + %g1] 0x2b
	membar	#Sync
loop_2423:
	movne	%xcc,	%g3,	%l5
	srl	%g1,	0x0B,	%i7
	edge16ln	%i0,	%i5,	%l6
	xnor	%i4,	0x1CAB,	%g6
	fmovsneg	%xcc,	%f31,	%f21
	andcc	%i1,	0x1F80,	%g7
	fand	%f0,	%f28,	%f22
	udivcc	%l1,	0x16CF,	%l3
	movvc	%xcc,	%o2,	%l0
	array16	%l4,	%o0,	%g2
	ldx	[%l7 + 0x40],	%i2
	movle	%xcc,	%o1,	%l2
	fmul8x16al	%f12,	%f11,	%f16
	movg	%icc,	%o7,	%i6
	edge32	%o6,	%o5,	%g5
	movrne	%o3,	0x2A4,	%g4
	tl	%icc,	0x6
	fble,a	%fcc0,	loop_2424
	edge8n	%i3,	%o4,	%g3
	sir	0x1578
	brz	%l5,	loop_2425
loop_2424:
	andncc	%i7,	%g1,	%i5
	addcc	%i0,	0x0FC7,	%l6
	fmul8x16	%f27,	%f8,	%f18
loop_2425:
	subc	%g6,	%i1,	%i4
	alignaddr	%l1,	%l3,	%o2
	tne	%xcc,	0x3
	edge8n	%l0,	%g7,	%l4
	orncc	%g2,	0x1496,	%o0
	wr	%g0,	0x18,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	add	%i2,	0x11E4,	%o1
	fornot2s	%f18,	%f3,	%f30
	tge	%xcc,	0x2
	fbu	%fcc1,	loop_2426
	mulscc	%l2,	0x08CC,	%i6
	fmovsgu	%icc,	%f17,	%f21
	tle	%icc,	0x4
loop_2426:
	nop
	set	0x68, %i1
	lda	[%l7 + %i1] 0x88,	%f21
	fornot2s	%f29,	%f19,	%f10
	tpos	%xcc,	0x1
	movre	%o6,	%o7,	%g5
	fandnot1s	%f5,	%f31,	%f27
	fmovse	%xcc,	%f7,	%f14
	fmovsl	%xcc,	%f26,	%f9
	xor	%o5,	%o3,	%i3
	fnors	%f23,	%f17,	%f24
	fmul8x16au	%f28,	%f13,	%f18
	bne,a,pt	%xcc,	loop_2427
	tsubcctv	%g4,	%g3,	%o4
	fcmpne32	%f2,	%f20,	%l5
	fandnot1s	%f20,	%f31,	%f25
loop_2427:
	xnorcc	%g1,	0x086E,	%i5
	subc	%i0,	0x15E6,	%i7
	fpsub16	%f0,	%f12,	%f2
	tle	%xcc,	0x3
	fornot1s	%f10,	%f14,	%f7
	addc	%l6,	0x1BCA,	%g6
	bvc,a,pn	%xcc,	loop_2428
	taddcc	%i4,	0x1C95,	%l1
	movneg	%icc,	%l3,	%o2
	fmovscc	%icc,	%f10,	%f31
loop_2428:
	stb	%l0,	[%l7 + 0x08]
	ldd	[%l7 + 0x78],	%f0
	edge32l	%g7,	%l4,	%g2
	fandnot2	%f24,	%f14,	%f6
	stx	%o0,	[%l7 + 0x40]
	subccc	%i1,	%o1,	%l2
	fxnors	%f19,	%f12,	%f15
	fabss	%f7,	%f22
	edge32ln	%i2,	%o6,	%i6
	addc	%o7,	0x0F1F,	%g5
	fmul8sux16	%f2,	%f22,	%f24
	add	%l7,	0x70,	%l6
	wr	%g0,	0x19,	%asi
	casa	[%l6] %asi,	%o5,	%o3
	fba	%fcc3,	loop_2429
	addc	%i3,	0x0900,	%g4
	fba	%fcc0,	loop_2430
	mulscc	%o4,	0x0D74,	%l5
loop_2429:
	ldub	[%l7 + 0x3F],	%g3
	fbule,a	%fcc2,	loop_2431
loop_2430:
	mulscc	%i5,	%i0,	%g1
	taddcc	%i7,	0x1F57,	%g6
	movg	%xcc,	%i4,	%l6
loop_2431:
	bcs	loop_2432
	andncc	%l3,	%o2,	%l0
	sdiv	%l1,	0x1BF5,	%l4
	movcs	%xcc,	%g7,	%o0
loop_2432:
	fmovdcc	%icc,	%f28,	%f20
	srl	%g2,	0x14,	%i1
	fpsub32	%f16,	%f4,	%f12
	addcc	%o1,	%l2,	%i2
	tle	%icc,	0x5
	tn	%icc,	0x3
	fones	%f5
	alignaddrl	%i6,	%o7,	%o6
	edge8	%o5,	%o3,	%g5
	edge16n	%g4,	%i3,	%o4
	movle	%xcc,	%l5,	%i5
	or	%i0,	0x0DFD,	%g1
	fnot2	%f6,	%f16
	movgu	%icc,	%g3,	%i7
	edge32ln	%i4,	%l6,	%g6
	tvc	%xcc,	0x4
	tsubcctv	%o2,	0x11AE,	%l3
	fexpand	%f20,	%f10
	tn	%icc,	0x7
	ta	%xcc,	0x1
	fcmpeq32	%f20,	%f24,	%l0
	orn	%l4,	%l1,	%g7
	prefetch	[%l7 + 0x20],	 0x2
	array16	%o0,	%g2,	%o1
	set	0x16, %i3
	ldsha	[%l7 + %i3] 0x81,	%l2
	xor	%i2,	%i6,	%i1
	ldsh	[%l7 + 0x3C],	%o6
	movcs	%icc,	%o7,	%o5
	fbug	%fcc1,	loop_2433
	edge8l	%g5,	%g4,	%o3
	srax	%i3,	0x0B,	%l5
	move	%xcc,	%i5,	%o4
loop_2433:
	tneg	%xcc,	0x5
	sub	%g1,	%g3,	%i7
	addccc	%i4,	%l6,	%g6
	fmovdleu	%xcc,	%f30,	%f14
	edge8ln	%i0,	%l3,	%l0
	fcmple32	%f20,	%f14,	%l4
	edge8	%o2,	%g7,	%o0
	sub	%g2,	%o1,	%l1
	tcs	%xcc,	0x3
	movcc	%xcc,	%l2,	%i2
	fbu,a	%fcc3,	loop_2434
	fpadd16s	%f7,	%f24,	%f10
	membar	0x7E
	fbg,a	%fcc0,	loop_2435
loop_2434:
	fnors	%f15,	%f20,	%f6
	movpos	%xcc,	%i6,	%i1
	movg	%xcc,	%o6,	%o7
loop_2435:
	fbne,a	%fcc0,	loop_2436
	fbuge	%fcc1,	loop_2437
	array16	%g5,	%g4,	%o5
	fmovdneg	%xcc,	%f28,	%f27
loop_2436:
	nop
	set	0x70, %i6
	swapa	[%l7 + %i6] 0x18,	%i3
loop_2437:
	andn	%l5,	0x083D,	%o3
	tl	%icc,	0x2
	fbne	%fcc1,	loop_2438
	tle	%xcc,	0x5
	brgz	%o4,	loop_2439
	taddcc	%g1,	%i5,	%g3
loop_2438:
	fmovrsgz	%i7,	%f4,	%f29
	fzero	%f8
loop_2439:
	addccc	%i4,	0x0327,	%g6
	std	%i6,	[%l7 + 0x18]
	movcc	%xcc,	%l3,	%i0
	edge16n	%l0,	%l4,	%o2
	call	loop_2440
	fabss	%f10,	%f27
	fmovsgu	%icc,	%f19,	%f5
	bl,a,pt	%xcc,	loop_2441
loop_2440:
	mova	%xcc,	%o0,	%g2
	srl	%g7,	%l1,	%o1
	ba,a	loop_2442
loop_2441:
	nop
	set	0x65, %l6
	ldsb	[%l7 + %l6],	%i2
	tsubcctv	%l2,	%i1,	%o6
	st	%f6,	[%l7 + 0x60]
loop_2442:
	sdivx	%o7,	0x0A78,	%i6
	movpos	%icc,	%g4,	%o5
	ldx	[%l7 + 0x48],	%g5
	bleu,a,pt	%xcc,	loop_2443
	edge16	%i3,	%l5,	%o4
	fmovdpos	%icc,	%f1,	%f4
	array8	%g1,	%i5,	%g3
loop_2443:
	popc	%i7,	%o3
	movcs	%xcc,	%i4,	%l6
	set	0x44, %o1
	ldstuba	[%l7 + %o1] 0x81,	%l3
	tsubcctv	%g6,	0x15A0,	%l0
	swap	[%l7 + 0x70],	%i0
	fsrc2	%f6,	%f28
	sdivcc	%o2,	0x11CC,	%l4
	bn,pt	%xcc,	loop_2444
	ldstub	[%l7 + 0x19],	%o0
	membar	#Sync
	set	0x40, %i2
	ldda	[%l7 + %i2] 0x16,	%f16
loop_2444:
	fmovsneg	%xcc,	%f24,	%f21
	wr	%g0,	0x88,	%asi
	ldstuba	[%l7 + 0x6F] %asi,	%g7
	movgu	%icc,	%l1,	%o1
	and	%g2,	0x16A7,	%l2
	alignaddr	%i2,	%i1,	%o7
	fblg	%fcc3,	loop_2445
	edge16ln	%i6,	%g4,	%o5
	fabsd	%f0,	%f26
	umulcc	%g5,	%o6,	%l5
loop_2445:
	fcmped	%fcc3,	%f6,	%f22
	movl	%xcc,	%i3,	%g1
	bneg,pn	%icc,	loop_2446
	lduh	[%l7 + 0x5A],	%i5
	taddcc	%o4,	0x08D1,	%i7
	taddcctv	%o3,	0x0116,	%g3
loop_2446:
	nop
	set	0x50, %i5
	sta	%f5,	[%l7 + %i5] 0x04
	edge32l	%l6,	%i4,	%l3
	movvc	%icc,	%l0,	%g6
	brlez	%o2,	loop_2447
	udiv	%l4,	0x190E,	%i0
	subc	%g7,	%l1,	%o0
	edge16n	%g2,	%l2,	%i2
loop_2447:
	fabss	%f9,	%f17
	popc	%o1,	%i1
	fbg,a	%fcc0,	loop_2448
	edge32	%i6,	%g4,	%o7
	tpos	%xcc,	0x0
	tgu	%icc,	0x7
loop_2448:
	andncc	%g5,	%o5,	%l5
	fble	%fcc2,	loop_2449
	edge8l	%o6,	%g1,	%i5
	edge16l	%i3,	%o4,	%o3
	wr	%g0,	0x4f,	%asi
	stxa	%g3,	[%g0 + 0x30] %asi
loop_2449:
	membar	0x42
	edge8ln	%i7,	%i4,	%l6
	subcc	%l3,	0x04A7,	%g6
	te	%xcc,	0x1
	udivcc	%o2,	0x092D,	%l0
	subccc	%l4,	%g7,	%i0
	array8	%o0,	%l1,	%g2
	set	0x46, %l1
	lduba	[%l7 + %l1] 0x88,	%i2
	tleu	%xcc,	0x0
	nop
	set	0x68, %o3
	prefetch	[%l7 + %o3],	 0x0
	array16	%o1,	%l2,	%i6
	pdist	%f20,	%f18,	%f18
	sll	%g4,	%i1,	%g5
	movl	%xcc,	%o5,	%l5
	siam	0x5
	membar	0x49
	edge16n	%o6,	%o7,	%g1
	movre	%i5,	%i3,	%o3
	nop
	set	0x14, %g2
	lduw	[%l7 + %g2],	%o4
	fcmpne32	%f24,	%f24,	%i7
	fblg,a	%fcc3,	loop_2450
	fmovrsgez	%i4,	%f0,	%f3
	fmovsvc	%xcc,	%f20,	%f30
	tge	%icc,	0x2
loop_2450:
	fmovdle	%icc,	%f25,	%f7
	mulx	%l6,	%l3,	%g3
	edge8n	%o2,	%l0,	%g6
	orn	%l4,	0x0579,	%g7
	edge8	%o0,	%l1,	%i0
	sra	%i2,	0x12,	%g2
	popc	0x1227,	%o1
	set	0x34, %o6
	lda	[%l7 + %o6] 0x81,	%f23
	and	%i6,	%l2,	%g4
	edge16	%g5,	%i1,	%l5
	bleu	loop_2451
	fandnot2	%f30,	%f30,	%f6
	bneg,a	loop_2452
	fbuge	%fcc3,	loop_2453
loop_2451:
	sir	0x0023
	fbo,a	%fcc1,	loop_2454
loop_2452:
	fmovdg	%icc,	%f3,	%f24
loop_2453:
	sdivx	%o6,	0x0A66,	%o7
	sllx	%g1,	0x14,	%o5
loop_2454:
	brgez,a	%i5,	loop_2455
	alignaddr	%i3,	%o3,	%i7
	movre	%o4,	0x29D,	%l6
	flush	%l7 + 0x28
loop_2455:
	xor	%l3,	0x1133,	%g3
	sth	%i4,	[%l7 + 0x32]
	ldstub	[%l7 + 0x0D],	%l0
	wr	%g0,	0x18,	%asi
	ldsha	[%l7 + 0x7E] %asi,	%o2
	be,a,pt	%xcc,	loop_2456
	xnor	%l4,	%g7,	%o0
	brlz	%g6,	loop_2457
	tge	%icc,	0x7
loop_2456:
	srlx	%i0,	0x1C,	%l1
	tge	%xcc,	0x7
loop_2457:
	ldsh	[%l7 + 0x70],	%g2
	or	%i2,	%o1,	%l2
	bneg,pt	%xcc,	loop_2458
	brlez	%i6,	loop_2459
	xnor	%g5,	0x07DF,	%g4
	fcmpd	%fcc0,	%f12,	%f18
loop_2458:
	tg	%icc,	0x0
loop_2459:
	stx	%l5,	[%l7 + 0x30]
	stbar
	be,pn	%xcc,	loop_2460
	fornot1s	%f7,	%f9,	%f25
	fsrc1s	%f18,	%f4
	srlx	%i1,	0x05,	%o6
loop_2460:
	sub	%o7,	0x1056,	%g1
	orn	%o5,	%i3,	%o3
	fzeros	%f8
	orcc	%i5,	0x00BD,	%i7
	array16	%o4,	%l3,	%g3
	brgez,a	%i4,	loop_2461
	fmovsa	%xcc,	%f28,	%f12
	edge16l	%l0,	%l6,	%l4
	std	%f28,	[%l7 + 0x58]
loop_2461:
	bpos,a,pn	%icc,	loop_2462
	edge32	%o2,	%o0,	%g7
	fornot1	%f0,	%f30,	%f22
	xorcc	%i0,	0x180E,	%g6
loop_2462:
	xnor	%g2,	%l1,	%i2
	subc	%o1,	0x01E9,	%l2
	ldd	[%l7 + 0x58],	%f2
	smul	%i6,	%g4,	%l5
	array32	%g5,	%i1,	%o7
	udivx	%g1,	0x1A31,	%o5
	tpos	%xcc,	0x1
	fmovdge	%icc,	%f0,	%f11
	movne	%icc,	%o6,	%i3
	sub	%o3,	%i5,	%o4
	sll	%l3,	%i7,	%g3
	flush	%l7 + 0x6C
	movpos	%icc,	%i4,	%l6
	bvc	loop_2463
	edge16l	%l4,	%l0,	%o0
	prefetch	[%l7 + 0x54],	 0x0
	sethi	0x1504,	%o2
loop_2463:
	fmovrdlez	%g7,	%f24,	%f8
	tle	%icc,	0x6
	fnot2s	%f3,	%f27
	addcc	%g6,	%i0,	%l1
	orcc	%g2,	0x1B48,	%i2
	popc	%o1,	%i6
	tgu	%icc,	0x2
	fpadd32s	%f8,	%f30,	%f1
	bge,a	loop_2464
	movre	%l2,	%l5,	%g5
	fmovsle	%icc,	%f11,	%f0
	alignaddrl	%g4,	%i1,	%g1
loop_2464:
	sllx	%o7,	0x19,	%o6
	edge32n	%o5,	%o3,	%i3
	umul	%i5,	0x0F7B,	%l3
	umul	%o4,	%g3,	%i7
	andn	%l6,	0x1C19,	%l4
	fmovrdlz	%l0,	%f12,	%f22
	movge	%icc,	%o0,	%o2
	popc	0x1146,	%i4
	fmovdle	%xcc,	%f21,	%f12
	subc	%g6,	%i0,	%l1
	sub	%g2,	0x1D1E,	%g7
	fmovsg	%xcc,	%f26,	%f2
	fnot1	%f2,	%f30
	tge	%xcc,	0x0
	fmovsl	%xcc,	%f30,	%f5
	tpos	%icc,	0x0
	edge16n	%o1,	%i6,	%l2
	fmovdcc	%xcc,	%f14,	%f8
	tleu	%icc,	0x7
	smulcc	%l5,	%g5,	%g4
	fmovsne	%icc,	%f0,	%f27
	and	%i1,	%i2,	%g1
	fand	%f10,	%f20,	%f2
	fmovs	%f27,	%f8
	fmul8ulx16	%f16,	%f2,	%f14
	fmovsl	%icc,	%f21,	%f16
	movneg	%icc,	%o6,	%o7
	fmovse	%xcc,	%f2,	%f23
	ble,a,pt	%icc,	loop_2465
	bn,pt	%xcc,	loop_2466
	fxors	%f3,	%f30,	%f8
	sllx	%o3,	0x07,	%i3
loop_2465:
	addc	%o5,	0x0A15,	%i5
loop_2466:
	andn	%l3,	0x1E4A,	%g3
	fpsub16	%f12,	%f0,	%f8
	edge16	%o4,	%i7,	%l4
	edge16l	%l0,	%l6,	%o0
	mulx	%o2,	%g6,	%i0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8	%i4,	%l1,	%g2
	add	%l7,	0x7C,	%l6
	wr	%g0,	0x18,	%asi
	lda	[%l6] %asi,	%g7
	casa	[%l6] %asi,	%g7,	%i6
	fmovspos	%xcc,	%f17,	%f29
	fmovdleu	%xcc,	%f26,	%f1
	tvs	%icc,	0x1
	bn,a,pn	%icc,	loop_2467
	andn	%o1,	0x1917,	%l2
	tcc	%xcc,	0x4
	fnand	%f26,	%f30,	%f30
loop_2467:
	fmovdcc	%icc,	%f8,	%f3
	srax	%l5,	0x06,	%g4
	lduw	[%l7 + 0x38],	%i1
	addc	%g5,	0x07F6,	%g1
	fbuge,a	%fcc2,	loop_2468
	std	%i2,	[%l7 + 0x28]
	orncc	%o6,	0x197C,	%o3
	edge32	%i3,	%o7,	%i5
loop_2468:
	nop
	wr	%g0,	0x89,	%asi
	sta	%f31,	[%l7 + 0x5C] %asi
	andncc	%o5,	%l3,	%o4
	udivcc	%i7,	0x0574,	%g3
	taddcctv	%l4,	0x0206,	%l6
	edge16ln	%l0,	%o0,	%o2
	fsrc2s	%f11,	%f3
	fabss	%f10,	%f13
	xnorcc	%g6,	%i0,	%i4
	fmul8x16al	%f8,	%f6,	%f2
	bpos,a,pt	%xcc,	loop_2469
	alignaddrl	%g2,	%l1,	%g7
	mulscc	%o1,	%i6,	%l5
	fnor	%f28,	%f12,	%f26
loop_2469:
	fexpand	%f5,	%f16
	stx	%g4,	[%l7 + 0x18]
	smul	%l2,	%g5,	%i1
	move	%xcc,	%g1,	%o6
	fornot1s	%f31,	%f16,	%f28
	fsrc2	%f8,	%f0
	fcmpne16	%f8,	%f10,	%i2
	fcmped	%fcc1,	%f16,	%f6
	nop
	set	0x08, %o2
	ldd	[%l7 + %o2],	%o2
	movre	%i3,	0x00C,	%i5
	popc	%o5,	%l3
	srax	%o7,	%i7,	%g3
	st	%f22,	[%l7 + 0x38]
	fmovsneg	%icc,	%f29,	%f3
	fmovdcc	%xcc,	%f9,	%f24
	nop
	set	0x4C, %l0
	ldstub	[%l7 + %l0],	%l4
	fmul8x16	%f31,	%f2,	%f22
	srl	%o4,	%l0,	%o0
	tneg	%xcc,	0x0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrne	%o2,	0x196,	%g6
	tne	%icc,	0x6
	bl,a	loop_2470
	sll	%l6,	%i4,	%g2
	move	%xcc,	%i0,	%g7
	prefetch	[%l7 + 0x08],	 0x3
loop_2470:
	fmul8x16au	%f22,	%f28,	%f20
	fcmpd	%fcc1,	%f2,	%f28
	fbne	%fcc2,	loop_2471
	srax	%o1,	0x16,	%i6
	lduw	[%l7 + 0x50],	%l5
	fexpand	%f1,	%f8
loop_2471:
	nop
	wr	%g0,	0x19,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	set	0x4C, %i7
	sta	%f27,	[%l7 + %i7] 0x88
	sdivx	%l1,	0x1361,	%l2
	edge16ln	%g4,	%i1,	%g1
	wr	%g0,	0x19,	%asi
	stba	%g5,	[%l7 + 0x08] %asi
	stb	%i2,	[%l7 + 0x43]
	array16	%o3,	%o6,	%i5
	fble	%fcc1,	loop_2472
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbul	%fcc0,	loop_2473
	ta	%icc,	0x5
loop_2472:
	bvc,a,pt	%xcc,	loop_2474
	subcc	%o5,	0x07D3,	%l3
loop_2473:
	nop
	wr	%g0,	0x81,	%asi
	lduba	[%l7 + 0x47] %asi,	%i3
loop_2474:
	taddcctv	%o7,	%g3,	%i7
	fandnot1	%f22,	%f18,	%f20
	wr	%g0,	0x88,	%asi
	ldstuba	[%l7 + 0x76] %asi,	%o4
	lduh	[%l7 + 0x72],	%l0
	bge,pn	%icc,	loop_2475
	nop
	set	0x70, %o0
	stb	%o0,	[%l7 + %o0]
	movle	%icc,	%l4,	%g6
	subc	%o2,	0x0692,	%i4
loop_2475:
	tleu	%icc,	0x0
	fcmpeq16	%f22,	%f2,	%g2
	ldsb	[%l7 + 0x5D],	%l6
	fmovdleu	%icc,	%f30,	%f26
	addccc	%i0,	0x1219,	%g7
	membar	0x7C
	wr	%g0,	0x2b,	%asi
	stba	%o1,	[%l7 + 0x4C] %asi
	membar	#Sync
	taddcc	%l5,	%i6,	%l2
	movpos	%xcc,	%l1,	%g4
	move	%xcc,	%i1,	%g5
	fmul8x16al	%f0,	%f15,	%f26
	array16	%g1,	%o3,	%o6
	brgz,a	%i2,	loop_2476
	udivx	%o5,	0x1F36,	%l3
	edge8l	%i3,	%i5,	%g3
	orcc	%i7,	%o4,	%l0
loop_2476:
	array8	%o0,	%l4,	%o7
	fcmpd	%fcc1,	%f22,	%f18
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tpos	%xcc,	0x7
	set	0x0, %o5
	stxa	%g6,	[%g0 + %o5] 0x57
	sethi	0x1ECD,	%i4
	udivcc	%o2,	0x0FA5,	%l6
	fbg	%fcc3,	loop_2477
	array16	%g2,	%g7,	%i0
	wr	%g0,	0x0c,	%asi
	stda	%o0,	[%l7 + 0x10] %asi
loop_2477:
	nop
	add	%l7,	0x08,	%l6
	wr	%g0,	0x04,	%asi
	casa	[%l6] 0x04,	%i6,	%l2
	ta	%xcc,	0x3
	umul	%l5,	%g4,	%l1
	fsrc2	%f8,	%f24
	tcs	%xcc,	0x5
	tg	%icc,	0x3
	xnor	%i1,	%g1,	%g5
	fnegd	%f22,	%f14
	wr	%g0,	0x80,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32	%o3,	%i2,	%o6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x89,	%asi
	prefetcha	[%l7 + 0x08] %asi,	 0x2
	bpos,a	loop_2478
	sllx	%i3,	%l3,	%g3
	srax	%i5,	0x0E,	%o4
	taddcctv	%l0,	0x1FC5,	%o0
loop_2478:
	te	%xcc,	0x5
	bg,a	%xcc,	loop_2479
	tle	%xcc,	0x3
	fcmple16	%f16,	%f16,	%i7
	alignaddrl	%l4,	%g6,	%i4
loop_2479:
	bcs,a	loop_2480
	tle	%xcc,	0x7
	movrlez	%o2,	0x3CB,	%l6
	tgu	%icc,	0x0
loop_2480:
	tge	%icc,	0x5
	bvc	loop_2481
	fmovdgu	%xcc,	%f3,	%f25
	edge16	%g2,	%g7,	%i0
	tneg	%xcc,	0x6
loop_2481:
	mulx	%o1,	%o7,	%l2
	movrne	%i6,	%g4,	%l5
	fmovrsgez	%l1,	%f8,	%f31
	popc	0x0877,	%g1
	array32	%i1,	%g5,	%i2
	fmovse	%icc,	%f1,	%f9
	fbn,a	%fcc0,	loop_2482
	smulcc	%o6,	%o3,	%o5
	edge16	%l3,	%i3,	%g3
	movgu	%icc,	%o4,	%i5
loop_2482:
	xorcc	%o0,	%l0,	%i7
	movrne	%g6,	%l4,	%i4
	xor	%l6,	%o2,	%g2
	tsubcc	%g7,	0x0ED5,	%i0
	fmovs	%f24,	%f12
	fmovrsgez	%o1,	%f20,	%f10
	wr	%g0,	0x89,	%asi
	ldda	[%l7 + 0x20] %asi,	%o6
	movneg	%icc,	%l2,	%i6
	edge32l	%g4,	%l1,	%l5
	orn	%i1,	0x0401,	%g1
	movge	%xcc,	%i2,	%o6
	fexpand	%f23,	%f4
	fbue	%fcc1,	loop_2483
	edge32l	%o3,	%o5,	%g5
	mova	%xcc,	%l3,	%g3
	ldub	[%l7 + 0x20],	%i3
loop_2483:
	ldd	[%l7 + 0x78],	%f10
	bl,pn	%xcc,	loop_2484
	fcmpne32	%f18,	%f20,	%i5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fzero	%f16
loop_2484:
	nop
	wr	%g0,	0x80,	%asi
	ldswa	[%l7 + 0x54] %asi,	%o4
	orncc	%o0,	%i7,	%g6
	orncc	%l4,	%l0,	%l6
	fba,a	%fcc3,	loop_2485
	srlx	%i4,	0x0A,	%g2
	tneg	%xcc,	0x1
	lduh	[%l7 + 0x08],	%o2
loop_2485:
	movgu	%xcc,	%i0,	%g7
	edge16ln	%o7,	%o1,	%i6
	fnot1s	%f6,	%f22
	addccc	%l2,	0x1CA4,	%l1
	fmovdgu	%icc,	%f27,	%f5
	xnor	%l5,	0x149C,	%g4
	movre	%i1,	%i2,	%g1
	mulscc	%o6,	%o3,	%g5
	alignaddrl	%l3,	%g3,	%i3
	sethi	0x000B,	%o5
	bne	%icc,	loop_2486
	fnot2	%f18,	%f4
	and	%i5,	%o0,	%o4
	tne	%icc,	0x0
loop_2486:
	addccc	%g6,	0x15A6,	%l4
	fmovscc	%icc,	%f5,	%f9
	ldub	[%l7 + 0x78],	%l0
	add	%i7,	0x0003,	%l6
	wr	%g0,	0x10,	%asi
	ldxa	[%l7 + 0x20] %asi,	%i4
	brgez	%o2,	loop_2487
	movrne	%g2,	0x076,	%g7
	fmul8ulx16	%f4,	%f2,	%f12
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2487:
	fcmps	%fcc0,	%f8,	%f19
	set	0x1C, %l3
	stwa	%o7,	[%l7 + %l3] 0x2f
	membar	#Sync
	movrlz	%o1,	%i6,	%l2
	st	%f19,	[%l7 + 0x7C]
	andncc	%l1,	%i0,	%g4
	edge8l	%i1,	%l5,	%g1
	stx	%o6,	[%l7 + 0x78]
	or	%o3,	%g5,	%l3
	wr	%g0,	0x88,	%asi
	prefetcha	[%l7 + 0x68] %asi,	 0x1
	subc	%i3,	%o5,	%i5
	andn	%i2,	%o0,	%o4
	edge16ln	%l4,	%l0,	%i7
	ba	loop_2488
	prefetch	[%l7 + 0x2C],	 0x0
	fcmpne32	%f8,	%f0,	%l6
	addc	%i4,	%g6,	%o2
loop_2488:
	fbo,a	%fcc2,	loop_2489
	sdivx	%g7,	0x07E7,	%o7
	fbn	%fcc1,	loop_2490
	move	%xcc,	%g2,	%o1
loop_2489:
	brlez,a	%l2,	loop_2491
	popc	%l1,	%i0
loop_2490:
	fbul,a	%fcc2,	loop_2492
	udivcc	%g4,	0x02F7,	%i6
loop_2491:
	fandnot1s	%f6,	%f28,	%f20
	udivx	%l5,	0x05D0,	%g1
loop_2492:
	nop
	wr	%g0,	0x80,	%asi
	stda	%i0,	[%l7 + 0x18] %asi
	edge16n	%o6,	%g5,	%l3
	mulx	%o3,	0x13D9,	%g3
	lduh	[%l7 + 0x68],	%o5
	umulcc	%i5,	%i3,	%o0
	fnot2	%f22,	%f8
	movrlez	%o4,	%i2,	%l0
	tgu	%xcc,	0x0
	orcc	%i7,	%l6,	%l4
	sll	%g6,	0x19,	%i4
	sir	0x17F5
	fmul8x16al	%f5,	%f25,	%f12
	fxors	%f19,	%f18,	%f6
	and	%g7,	%o7,	%o2
	array16	%g2,	%o1,	%l2
	ld	[%l7 + 0x28],	%f15
	lduh	[%l7 + 0x3E],	%l1
	mova	%xcc,	%i0,	%g4
	fornot2	%f24,	%f0,	%f2
	array16	%l5,	%i6,	%i1
	wr	%g0,	0x19,	%asi
	prefetcha	[%l7 + 0x18] %asi,	 0x1
	sir	0x0AE4
	tsubcctv	%g5,	0x1222,	%g1
	call	loop_2493
	stbar
	popc	0x0941,	%l3
	st	%f23,	[%l7 + 0x5C]
loop_2493:
	add	%o3,	%g3,	%o5
	mova	%icc,	%i5,	%i3
	sdiv	%o4,	0x0A53,	%i2
	set	0x4F, %l2
	stba	%o0,	[%l7 + %l2] 0x11
	add	%l7,	0x78,	%l6
	wr	%g0,	0x0c,	%asi
	casxa	[%l6] 0x0c,	%l0,	%i7
	umulcc	%l6,	%l4,	%i4
	wr	%g0,	0x0c,	%asi
	stda	%g6,	[%l7 + 0x28] %asi
	movrlz	%o7,	0x1E1,	%o2
	edge8	%g6,	%o1,	%l2
	subcc	%l1,	%g2,	%g4
	or	%i0,	0x1003,	%i6
	edge32n	%i1,	%o6,	%g5
	fbl	%fcc3,	loop_2494
	umulcc	%l5,	0x1B59,	%l3
	add	%l7,	0x38,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%o3
	casxa	[%l6] 0x80,	%o3,	%g3
loop_2494:
	fcmpes	%fcc0,	%f11,	%f27
	nop
	setx	loop_2495,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movleu	%icc,	%o5,	%g1
	smulcc	%i5,	0x1918,	%i3
	fmovrdlz	%o4,	%f18,	%f20
loop_2495:
	tle	%xcc,	0x1
	fbe	%fcc0,	loop_2496
	fbul	%fcc1,	loop_2497
	alignaddr	%o0,	%i2,	%i7
	tcs	%icc,	0x0
loop_2496:
	brnz	%l0,	loop_2498
loop_2497:
	fbule,a	%fcc2,	loop_2499
	tsubcc	%l6,	%i4,	%l4
	ldsb	[%l7 + 0x69],	%g7
loop_2498:
	nop
	set	0x24, %g7
	ldswa	[%l7 + %g7] 0x88,	%o2
loop_2499:
	fxor	%f24,	%f30,	%f4
	movge	%icc,	%o7,	%o1
	brnz,a	%g6,	loop_2500
	fbe	%fcc1,	loop_2501
	mulscc	%l1,	%l2,	%g4
	fmovsa	%icc,	%f18,	%f16
loop_2500:
	fmovsl	%xcc,	%f6,	%f30
loop_2501:
	nop
	set	0x14, %i4
	swapa	[%l7 + %i4] 0x04,	%g2
	wr	%g0,	0x04,	%asi
	prefetcha	[%l7 + 0x58] %asi,	 0x0
	tsubcc	%i6,	%i1,	%o6
	edge16l	%l5,	%g5,	%l3
	tge	%xcc,	0x3
	movgu	%xcc,	%o3,	%o5
	fands	%f15,	%f20,	%f28
	srax	%g3,	%i5,	%i3
	edge32l	%g1,	%o4,	%i2
	alignaddrl	%i7,	%l0,	%o0
	edge8	%i4,	%l4,	%l6
	orncc	%g7,	%o7,	%o1
	set	0x40, %g6
	stda	%f0,	[%l7 + %g6] 0x0c
	fmovse	%xcc,	%f29,	%f21
	lduh	[%l7 + 0x62],	%g6
	edge32ln	%o2,	%l2,	%l1
	set	0x40, %l4
	stxa	%g4,	[%l7 + %l4] 0x80
	fcmpgt32	%f12,	%f24,	%i0
	addccc	%g2,	%i1,	%o6
	fmovs	%f24,	%f30
	fnot1s	%f17,	%f7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdpos	%icc,	%f3,	%f3
	fxnor	%f4,	%f10,	%f26
	movl	%icc,	%i6,	%l5
	movg	%xcc,	%g5,	%o3
	brlez	%l3,	loop_2502
	alignaddrl	%g3,	%o5,	%i3
	mova	%icc,	%i5,	%g1
	ta	%icc,	0x2
loop_2502:
	membar	0x70
	fcmple16	%f12,	%f12,	%i2
	wr	%g0,	0x80,	%asi
	stha	%i7,	[%l7 + 0x6E] %asi
	fmul8ulx16	%f8,	%f22,	%f28
	tl	%xcc,	0x4
	bg,a,pn	%icc,	loop_2503
	fpsub32s	%f5,	%f2,	%f26
	fmovsleu	%icc,	%f7,	%f21
	fxnors	%f17,	%f0,	%f4
loop_2503:
	ba	loop_2504
	tvc	%icc,	0x5
	umulcc	%o4,	%l0,	%i4
	wr	%g0,	0x0c,	%asi
	ldxa	[%l7 + 0x78] %asi,	%l4
loop_2504:
	movpos	%xcc,	%o0,	%l6
	movcc	%xcc,	%g7,	%o1
	fzero	%f18
	brlz	%g6,	loop_2505
	or	%o7,	0x07CA,	%o2
	subcc	%l1,	0x182D,	%g4
	addcc	%i0,	%g2,	%l2
loop_2505:
	fmovsvc	%icc,	%f6,	%f21
	fmovs	%f17,	%f18
	move	%icc,	%o6,	%i1
	taddcc	%l5,	0x0A8F,	%i6
	smulcc	%o3,	0x02C0,	%l3
	udivx	%g3,	0x0B4B,	%g5
	fbul	%fcc2,	loop_2506
	movgu	%icc,	%o5,	%i3
	bleu	%icc,	loop_2507
	andncc	%i5,	%i2,	%g1
loop_2506:
	addccc	%o4,	0x1B5B,	%l0
	fbg,a	%fcc0,	loop_2508
loop_2507:
	fcmple16	%f22,	%f6,	%i7
	fbo	%fcc2,	loop_2509
	movvc	%icc,	%l4,	%o0
loop_2508:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sethi	0x189D,	%i4
loop_2509:
	edge16n	%g7,	%o1,	%l6
	smulcc	%o7,	%g6,	%o2
	set	0x44, %g5
	lduwa	[%l7 + %g5] 0x88,	%l1
	fpadd16s	%f0,	%f30,	%f23
	edge32	%g4,	%g2,	%l2
	tvs	%icc,	0x6
	ldub	[%l7 + 0x36],	%o6
	fcmpgt32	%f30,	%f20,	%i1
	sdivcc	%i0,	0x12A1,	%i6
	movvs	%icc,	%l5,	%l3
	fpsub32	%f18,	%f30,	%f2
	fmovsa	%icc,	%f5,	%f29
	fpsub32	%f12,	%f20,	%f30
	stbar
	and	%o3,	%g5,	%g3
	fmovrslez	%o5,	%f15,	%f23
	ta	%icc,	0x0
	smul	%i5,	0x1710,	%i3
	te	%xcc,	0x5
	fnot1s	%f1,	%f3
	fmovscc	%icc,	%f10,	%f17
	wr	%g0,	0x2b,	%asi
	stha	%i2,	[%l7 + 0x6A] %asi
	membar	#Sync
	udivcc	%o4,	0x050B,	%g1
	smul	%i7,	%l0,	%o0
	udivcc	%i4,	0x1D59,	%g7
	movrgez	%o1,	%l6,	%o7
	addc	%g6,	0x0519,	%o2
	fmovdleu	%icc,	%f5,	%f16
	srl	%l1,	0x03,	%g4
	movle	%icc,	%g2,	%l4
	array8	%o6,	%l2,	%i0
	movl	%icc,	%i6,	%i1
	xnorcc	%l5,	0x07B2,	%l3
	tcc	%icc,	0x6
	mulx	%o3,	%g3,	%o5
	tleu	%icc,	0x2
	umul	%g5,	%i3,	%i2
	sll	%i5,	%o4,	%i7
	flush	%l7 + 0x28
	fmuld8sux16	%f20,	%f3,	%f28
	edge32	%l0,	%o0,	%i4
	andcc	%g1,	%o1,	%l6
	nop
	setx	loop_2510,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	sir	0x142F
	movg	%xcc,	%o7,	%g6
	umulcc	%o2,	0x01D4,	%l1
loop_2510:
	umul	%g4,	0x0D57,	%g7
	fandnot2s	%f29,	%f3,	%f28
	prefetch	[%l7 + 0x34],	 0x1
	orncc	%g2,	0x1D85,	%l4
	srl	%o6,	0x10,	%i0
	wr	%g0,	0x88,	%asi
	ldsha	[%l7 + 0x48] %asi,	%l2
	set	0x5C, %o4
	swapa	[%l7 + %o4] 0x10,	%i1
	tn	%xcc,	0x4
	fmovrdlez	%i6,	%f2,	%f26
	sethi	0x1AD4,	%l3
	brgez,a	%o3,	loop_2511
	sth	%g3,	[%l7 + 0x3E]
	movre	%l5,	%g5,	%o5
	fmovscc	%xcc,	%f19,	%f7
loop_2511:
	sub	%i2,	%i5,	%i3
	fmovdvc	%icc,	%f29,	%f26
	movgu	%icc,	%o4,	%i7
	movne	%icc,	%l0,	%i4
	sub	%g1,	%o0,	%l6
	movrgz	%o7,	0x06A,	%o1
	set	0x24, %g3
	sta	%f15,	[%l7 + %g3] 0x10
	movl	%icc,	%g6,	%l1
	bleu,a,pt	%icc,	loop_2512
	brlz	%g4,	loop_2513
	fpsub32s	%f16,	%f6,	%f16
	fabss	%f27,	%f1
loop_2512:
	movge	%icc,	%g7,	%o2
loop_2513:
	orn	%g2,	0x1ECE,	%l4
	set	0x18, %o7
	swapa	[%l7 + %o7] 0x80,	%i0
	fmovscc	%icc,	%f10,	%f3
	movcs	%icc,	%l2,	%i1
	nop
	setx	loop_2514,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movrlz	%o6,	%l3,	%o3
	te	%icc,	0x1
	ta	%icc,	0x1
loop_2514:
	te	%icc,	0x7
	move	%xcc,	%g3,	%l5
	bvc,a,pn	%xcc,	loop_2515
	edge16ln	%i6,	%o5,	%i2
	add	%l7,	0x54,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%i5
	casa	[%l6] 0x81,	%i5,	%i3
loop_2515:
	tge	%icc,	0x3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	taddcctv	%o4,	0x09C6,	%i7
	edge16n	%g5,	%i4,	%l0
	brlez	%o0,	loop_2516
	edge8ln	%g1,	%l6,	%o7
	add	%l7,	0x20,	%l6
	wr	%g0,	0x04,	%asi
	ldxa	[%l6] %asi,	%g6
	casxa	[%l6] 0x04,	%g6,	%o1
loop_2516:
	edge32	%l1,	%g7,	%o2
	edge16ln	%g2,	%l4,	%i0
	orncc	%l2,	%g4,	%i1
	xor	%o6,	%l3,	%g3
	ba	loop_2517
	movle	%xcc,	%o3,	%l5
	mova	%xcc,	%i6,	%i2
	taddcctv	%i5,	0x0F91,	%o5
loop_2517:
	xorcc	%o4,	0x0BF3,	%i3
	ldd	[%l7 + 0x50],	%i6
	bge	%icc,	loop_2518
	fpsub32s	%f2,	%f0,	%f20
	fsrc1	%f28,	%f2
	tsubcctv	%i4,	%l0,	%o0
loop_2518:
	edge32l	%g1,	%l6,	%g5
	addcc	%g6,	0x047C,	%o7
	movvs	%icc,	%o1,	%g7
	sra	%o2,	0x11,	%l1
	udivx	%g2,	0x0427,	%i0
	movrne	%l4,	%l2,	%g4
	fbl	%fcc1,	loop_2519
	fones	%f11
	fmovdne	%xcc,	%f27,	%f10
	edge8l	%o6,	%i1,	%l3
loop_2519:
	fpsub32s	%f7,	%f6,	%f18
	edge8ln	%g3,	%l5,	%o3
	fmovsa	%xcc,	%f5,	%f8
	tle	%icc,	0x3
	udiv	%i6,	0x184F,	%i5
	sdivcc	%o5,	0x1DE2,	%i2
	wr	%g0,	0x2b,	%asi
	stwa	%o4,	[%l7 + 0x34] %asi
	membar	#Sync
	fnor	%f12,	%f4,	%f22
	bge,a,pt	%icc,	loop_2520
	addc	%i3,	0x03EE,	%i4
	movge	%icc,	%l0,	%o0
	fmovrdlz	%i7,	%f4,	%f8
loop_2520:
	movvs	%icc,	%l6,	%g5
	xnor	%g1,	0x1A43,	%g6
	fmovrdgez	%o1,	%f8,	%f28
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sra	%g7,	0x05,	%o7
	ldd	[%l7 + 0x48],	%l0
	brgez	%o2,	loop_2521
	addcc	%g2,	%l4,	%i0
	andcc	%g4,	0x121E,	%l2
	sllx	%o6,	0x17,	%i1
loop_2521:
	smulcc	%g3,	0x1A28,	%l5
	fnot1s	%f11,	%f10
	taddcc	%l3,	%i6,	%o3
	tpos	%xcc,	0x4
	movne	%xcc,	%o5,	%i2
	array32	%o4,	%i5,	%i3
	bne,a	loop_2522
	fmovdg	%icc,	%f29,	%f6
	sllx	%i4,	0x0B,	%o0
	membar	0x35
loop_2522:
	ldub	[%l7 + 0x55],	%l0
	movvs	%xcc,	%l6,	%i7
	prefetch	[%l7 + 0x18],	 0x3
	bge	%xcc,	loop_2523
	taddcc	%g1,	%g6,	%g5
	tle	%xcc,	0x3
	mova	%icc,	%g7,	%o1
loop_2523:
	fsrc2	%f12,	%f6
	set	0x34, %g4
	lduha	[%l7 + %g4] 0x88,	%l1
	movcc	%icc,	%o7,	%o2
	srax	%l4,	%g2,	%i0
	taddcctv	%l2,	0x0214,	%g4
	xorcc	%o6,	%i1,	%g3
	sra	%l3,	%l5,	%o3
	fmovsne	%icc,	%f12,	%f28
	taddcctv	%i6,	%i2,	%o5
	array32	%o4,	%i3,	%i5
	andn	%i4,	0x0DAB,	%o0
	xnor	%l0,	0x1B59,	%i7
	stx	%g1,	[%l7 + 0x20]
	udiv	%l6,	0x102B,	%g5
	edge8	%g6,	%g7,	%o1
	tge	%xcc,	0x5
	tsubcc	%o7,	0x1281,	%o2
	fble	%fcc2,	loop_2524
	mulscc	%l4,	%l1,	%i0
	tl	%xcc,	0x3
	and	%l2,	0x1680,	%g4
loop_2524:
	subccc	%o6,	0x0891,	%i1
	addccc	%g2,	0x0D44,	%g3
	or	%l3,	%l5,	%i6
	umul	%o3,	0x11ED,	%o5
	fbg	%fcc1,	loop_2525
	fbl,a	%fcc3,	loop_2526
	orncc	%o4,	0x003A,	%i2
	add	%i3,	%i4,	%o0
loop_2525:
	tn	%xcc,	0x5
loop_2526:
	fmovrse	%i5,	%f8,	%f15
	alignaddrl	%i7,	%l0,	%l6
	fcmpeq32	%f22,	%f24,	%g5
	set	0x48, %l5
	stxa	%g1,	[%l7 + %l5] 0x88
	fmovdvc	%xcc,	%f19,	%f16
	edge32l	%g7,	%o1,	%g6
	edge8	%o7,	%l4,	%l1
	xorcc	%i0,	%l2,	%g4
	andn	%o2,	%o6,	%i1
	edge16	%g2,	%g3,	%l3
	ldub	[%l7 + 0x14],	%l5
	alignaddrl	%o3,	%i6,	%o5
	brnz,a	%o4,	loop_2527
	prefetch	[%l7 + 0x3C],	 0x3
	bvc,a,pn	%icc,	loop_2528
	smul	%i2,	%i4,	%o0
loop_2527:
	ldsw	[%l7 + 0x60],	%i5
	sdivx	%i3,	0x082E,	%i7
loop_2528:
	fmovrsne	%l0,	%f20,	%f26
	wr	%g0,	0x19,	%asi
	lduwa	[%l7 + 0x50] %asi,	%g5
	sdivx	%l6,	0x0412,	%g1
	udivcc	%o1,	0x1731,	%g7
	fmovrdlz	%o7,	%f28,	%f26
	fmul8x16	%f6,	%f0,	%f6
	fbl,a	%fcc3,	loop_2529
	bpos,a	%xcc,	loop_2530
	movcc	%icc,	%l4,	%g6
	ldsh	[%l7 + 0x16],	%i0
loop_2529:
	fcmpne16	%f0,	%f12,	%l2
loop_2530:
	be,pt	%xcc,	loop_2531
	fmuld8ulx16	%f22,	%f6,	%f6
	wr	%g0,	0x04,	%asi
	lduba	[%l7 + 0x44] %asi,	%l1
loop_2531:
	sdivx	%o2,	0x00E6,	%o6
	lduh	[%l7 + 0x52],	%g4
	srlx	%g2,	%i1,	%l3
	fornot2s	%f1,	%f6,	%f27
	fnot2s	%f10,	%f7
	andn	%g3,	%l5,	%i6
	srlx	%o3,	0x11,	%o5
	srlx	%i2,	0x1B,	%o4
	sll	%o0,	%i5,	%i4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x26,	%asi
	ldda	[%l7 + 0x40] %asi,	%i2
	fcmpgt32	%f16,	%f18,	%l0
	tge	%icc,	0x3
	wr	%g0,	0x0c,	%asi
	stha	%g5,	[%l7 + 0x38] %asi
	std	%i6,	[%l7 + 0x50]
	orn	%l6,	%g1,	%o1
	tleu	%xcc,	0x1
	tvc	%icc,	0x6
	edge32ln	%g7,	%l4,	%g6
	subcc	%i0,	%o7,	%l1
	udivcc	%l2,	0x152F,	%o6
	sir	0x1676
	mulscc	%o2,	%g4,	%g2
	fmovs	%f0,	%f18
	edge32l	%l3,	%i1,	%g3
	andncc	%l5,	%i6,	%o5
	umul	%i2,	%o3,	%o4
	fbg	%fcc0,	loop_2532
	prefetch	[%l7 + 0x3C],	 0x0
	smulcc	%o0,	0x0866,	%i5
	andn	%i3,	0x15E6,	%i4
loop_2532:
	bne	loop_2533
	fmovsne	%icc,	%f17,	%f0
	addcc	%l0,	0x1FAA,	%i7
	umulcc	%g5,	%g1,	%l6
loop_2533:
	bpos,a	%icc,	loop_2534
	subcc	%o1,	0x1E35,	%g7
	fmovdne	%xcc,	%f22,	%f0
	movleu	%icc,	%g6,	%l4
loop_2534:
	sir	0x08FE
	edge8l	%i0,	%l1,	%o7
	wr	%g0,	0x0c,	%asi
	stha	%l2,	[%l7 + 0x16] %asi
	add	%l7,	0x78,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%o2
	casxa	[%l6] %asi,	%o2,	%o6
	edge32	%g4,	%g2,	%l3
	edge32	%g3,	%l5,	%i1
	fmovsl	%xcc,	%f28,	%f28
	taddcc	%o5,	0x1B66,	%i2
	ldstub	[%l7 + 0x1E],	%i6
	set	0x6C, %g1
	stwa	%o4,	[%l7 + %g1] 0x19
	swap	[%l7 + 0x1C],	%o3
	fmovdleu	%icc,	%f0,	%f2
	movn	%xcc,	%o0,	%i3
	edge16n	%i5,	%l0,	%i4
	wr	%g0,	0x80,	%asi
	lduha	[%l7 + 0x60] %asi,	%g5
	edge8n	%i7,	%l6,	%o1
	movrlz	%g1,	0x16B,	%g6
	set	0x40, %i1
	stda	%f16,	[%l7 + %i1] 0x18
	wr	%g0,	0x89,	%asi
	stda	%l4,	[%l7 + 0x08] %asi
	srl	%i0,	0x1A,	%g7
	fmovspos	%xcc,	%f25,	%f24
	array32	%l1,	%o7,	%l2
	fbl,a	%fcc1,	loop_2535
	movge	%icc,	%o6,	%o2
	set	0x20, %i3
	stda	%g4,	[%l7 + %i3] 0xeb
	membar	#Sync
loop_2535:
	array32	%l3,	%g2,	%l5
	fbule	%fcc1,	loop_2536
	fnot2	%f22,	%f22
	fcmple16	%f6,	%f0,	%i1
	fmovrdlz	%o5,	%f0,	%f8
loop_2536:
	fcmple32	%f2,	%f6,	%g3
	fmovdvc	%xcc,	%f19,	%f3
	fmovsge	%icc,	%f0,	%f19
	srl	%i2,	%o4,	%i6
	flush	%l7 + 0x10
	array8	%o0,	%i3,	%i5
	fcmped	%fcc3,	%f28,	%f10
	edge16l	%o3,	%i4,	%g5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movle	%icc,	%l0,	%i7
	fcmpne32	%f4,	%f20,	%l6
	bn,a,pt	%icc,	loop_2537
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movl	%icc,	%g1,	%o1
	mova	%icc,	%g6,	%i0
loop_2537:
	nop
	setx	loop_2538,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movvc	%icc,	%g7,	%l1
	fmovspos	%xcc,	%f18,	%f28
	movre	%o7,	0x06D,	%l2
loop_2538:
	udivx	%o6,	0x1F0B,	%l4
	taddcc	%g4,	0x1E72,	%o2
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x5E] %asi,	%l3
	tn	%xcc,	0x4
	movre	%g2,	0x3C9,	%i1
	add	%l5,	0x14E0,	%o5
	fmovsge	%xcc,	%f30,	%f15
	bn,a	%icc,	loop_2539
	taddcc	%i2,	0x0287,	%g3
	st	%f25,	[%l7 + 0x44]
	orncc	%i6,	%o4,	%o0
loop_2539:
	fbue,a	%fcc3,	loop_2540
	movl	%xcc,	%i3,	%i5
	alignaddrl	%o3,	%g5,	%i4
	fpsub16	%f8,	%f12,	%f8
loop_2540:
	stb	%l0,	[%l7 + 0x0B]
	alignaddr	%i7,	%l6,	%o1
	subccc	%g6,	%i0,	%g7
	sethi	0x1779,	%l1
	set	0x10, %i6
	ldxa	[%l7 + %i6] 0x18,	%o7
	taddcctv	%g1,	0x0C69,	%o6
	tcc	%xcc,	0x2
	tcc	%icc,	0x6
	wr	%g0,	0x11,	%asi
	sta	%f9,	[%l7 + 0x4C] %asi
	taddcctv	%l2,	0x1D56,	%g4
	wr	%g0,	0x10,	%asi
	ldswa	[%l7 + 0x44] %asi,	%l4
	bcs,a,pn	%xcc,	loop_2541
	tcs	%icc,	0x6
	bleu,a,pt	%icc,	loop_2542
	tsubcctv	%l3,	0x0F59,	%g2
loop_2541:
	fornot1s	%f9,	%f13,	%f16
	bleu,a	loop_2543
loop_2542:
	bcc,a	loop_2544
	subccc	%o2,	0x12B3,	%i1
	sdivcc	%o5,	0x10B8,	%i2
loop_2543:
	bcs,a,pt	%xcc,	loop_2545
loop_2544:
	fmovrdlez	%g3,	%f10,	%f4
	bn,a	loop_2546
	tleu	%icc,	0x7
loop_2545:
	tne	%icc,	0x7
	tneg	%xcc,	0x0
loop_2546:
	nop
	membar	#Sync
	wr	%g0,	0xf9,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	fors	%f6,	%f28,	%f28
	fpsub32	%f0,	%f20,	%f16
	fmovsneg	%icc,	%f16,	%f27
	sethi	0x0D6C,	%i6
	smulcc	%l5,	%o0,	%i3
	sdiv	%i5,	0x0DC8,	%o3
	orncc	%g5,	%o4,	%i4
	prefetch	[%l7 + 0x0C],	 0x1
	fcmps	%fcc0,	%f8,	%f23
	edge32	%i7,	%l6,	%o1
	fbul,a	%fcc2,	loop_2547
	fbe	%fcc2,	loop_2548
	edge8	%l0,	%g6,	%i0
	taddcctv	%l1,	%g7,	%g1
loop_2547:
	orncc	%o7,	0x191E,	%l2
loop_2548:
	edge32l	%o6,	%g4,	%l3
	subcc	%g2,	0x16E9,	%l4
	udivx	%i1,	0x1F72,	%o5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrne	%o2,	%i2,	%g3
	fnot2s	%f21,	%f12
	add	%l5,	%i6,	%o0
	ba	%xcc,	loop_2549
	smul	%i5,	%i3,	%g5
	andcc	%o3,	0x1CDB,	%i4
	fmuld8sux16	%f16,	%f23,	%f20
loop_2549:
	nop
	set	0x10, %l6
	swapa	[%l7 + %l6] 0x80,	%o4
	edge16l	%i7,	%o1,	%l6
	prefetch	[%l7 + 0x38],	 0x2
	bgu,pt	%icc,	loop_2550
	tgu	%icc,	0x2
	for	%f12,	%f0,	%f10
	bvs	loop_2551
loop_2550:
	subcc	%l0,	0x0B1D,	%g6
	fbo,a	%fcc0,	loop_2552
	fmovrsne	%i0,	%f18,	%f22
loop_2551:
	fmovdcc	%xcc,	%f28,	%f4
	sdiv	%g7,	0x1EA7,	%l1
loop_2552:
	mulscc	%g1,	0x0C24,	%l2
	fcmple32	%f20,	%f0,	%o7
	add	%l7,	0x70,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%g4
	casxa	[%l6] 0x89,	%g4,	%o6
	call	loop_2553
	mulx	%l3,	0x0962,	%l4
	for	%f6,	%f26,	%f14
	fbl,a	%fcc2,	loop_2554
loop_2553:
	ldub	[%l7 + 0x47],	%i1
	edge16ln	%o5,	%o2,	%g2
	sllx	%i2,	0x1D,	%l5
loop_2554:
	edge32	%i6,	%g3,	%i5
	andcc	%i3,	%o0,	%o3
	fmuld8ulx16	%f28,	%f28,	%f2
	movneg	%icc,	%g5,	%o4
	fbn,a	%fcc0,	loop_2555
	bvs,a	loop_2556
	fandnot1	%f0,	%f2,	%f30
	edge32l	%i4,	%i7,	%l6
loop_2555:
	array8	%o1,	%l0,	%i0
loop_2556:
	nop
	wr	%g0,	0x11,	%asi
	ldsba	[%l7 + 0x18] %asi,	%g6
	fmovsneg	%xcc,	%f9,	%f21
	fmovdvc	%icc,	%f20,	%f25
	tsubcctv	%l1,	0x0031,	%g1
	fmovspos	%icc,	%f13,	%f11
	set	0x70, %o1
	ldsha	[%l7 + %o1] 0x0c,	%g7
	wr	%g0,	0x89,	%asi
	stxa	%o7,	[%l7 + 0x78] %asi
	edge16l	%l2,	%g4,	%o6
	tle	%icc,	0x7
	move	%xcc,	%l3,	%l4
	fmovscc	%icc,	%f30,	%f18
	fmovrde	%i1,	%f20,	%f26
	add	%l7,	0x0C,	%l6
	wr	%g0,	0x11,	%asi
	lda	[%l6] %asi,	%o2
	casa	[%l6] %asi,	%o2,	%g2
	taddcc	%o5,	0x07C4,	%i2
	fble,a	%fcc3,	loop_2557
	fmovrdgz	%i6,	%f18,	%f22
	set	0x11, %i0
	stba	%g3,	[%l7 + %i0] 0x18
loop_2557:
	fmovdle	%xcc,	%f31,	%f29
	brlz,a	%i5,	loop_2558
	tsubcc	%l5,	%o0,	%i3
	sdiv	%g5,	0x086F,	%o4
	te	%icc,	0x6
loop_2558:
	alignaddr	%i4,	%o3,	%l6
	fmovde	%xcc,	%f3,	%f19
	ldsw	[%l7 + 0x18],	%o1
	addc	%l0,	%i7,	%g6
	movpos	%icc,	%i0,	%g1
	sll	%l1,	%o7,	%g7
	membar	0x27
	tneg	%icc,	0x6
	brlez,a	%g4,	loop_2559
	fones	%f7
	udiv	%o6,	0x0E71,	%l2
	tcs	%icc,	0x3
loop_2559:
	fnot2	%f16,	%f4
	edge8n	%l4,	%l3,	%o2
	tcs	%xcc,	0x4
	movrne	%g2,	0x17A,	%i1
	fble,a	%fcc1,	loop_2560
	sllx	%o5,	%i6,	%i2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsh	[%l7 + 0x0C],	%i5
loop_2560:
	nop
	set	0x70, %i5
	ldxa	[%l7 + %i5] 0x80,	%g3
	edge32ln	%l5,	%i3,	%g5
	brlz	%o4,	loop_2561
	te	%xcc,	0x7
	movn	%xcc,	%i4,	%o0
	fmovrde	%l6,	%f26,	%f0
loop_2561:
	brlz,a	%o1,	loop_2562
	bneg,a,pn	%icc,	loop_2563
	srax	%l0,	0x18,	%o3
	movrlez	%g6,	0x158,	%i7
loop_2562:
	addcc	%g1,	0x03D5,	%l1
loop_2563:
	mulx	%o7,	%g7,	%g4
	smul	%i0,	0x1063,	%o6
	tleu	%icc,	0x7
	fmovsvs	%icc,	%f25,	%f3
	fmovrsne	%l4,	%f8,	%f8
	set	0x32, %l1
	lduha	[%l7 + %l1] 0x10,	%l2
	fbl,a	%fcc0,	loop_2564
	taddcc	%o2,	%l3,	%i1
	movl	%icc,	%o5,	%g2
	movvc	%icc,	%i6,	%i5
loop_2564:
	nop
	set	0x58, %i2
	ldsh	[%l7 + %i2],	%g3
	sll	%l5,	%i3,	%g5
	stw	%o4,	[%l7 + 0x1C]
	fbge	%fcc0,	loop_2565
	umul	%i2,	%i4,	%l6
	fnot2s	%f8,	%f14
	for	%f0,	%f18,	%f30
loop_2565:
	mulscc	%o1,	0x1254,	%o0
	brz	%l0,	loop_2566
	movle	%icc,	%o3,	%g6
	andn	%i7,	%g1,	%o7
	fmovdpos	%icc,	%f21,	%f16
loop_2566:
	andcc	%l1,	%g4,	%i0
	brgez	%g7,	loop_2567
	fbg,a	%fcc1,	loop_2568
	sll	%o6,	%l4,	%l2
	edge16ln	%o2,	%i1,	%l3
loop_2567:
	bvc,pn	%xcc,	loop_2569
loop_2568:
	nop
	set	0x50, %g2
	ldd	[%l7 + %g2],	%f28
	fpadd16	%f2,	%f30,	%f24
	mova	%xcc,	%g2,	%o5
loop_2569:
	movre	%i6,	%g3,	%i5
	fble,a	%fcc1,	loop_2570
	srax	%l5,	%i3,	%g5
	ldstub	[%l7 + 0x0D],	%i2
	edge32l	%o4,	%i4,	%l6
loop_2570:
	fzero	%f10
	smul	%o1,	%o0,	%l0
	wr	%g0,	0x04,	%asi
	prefetcha	[%l7 + 0x48] %asi,	 0x1
	movleu	%icc,	%o3,	%i7
	edge8	%o7,	%g1,	%g4
	fbule,a	%fcc1,	loop_2571
	fcmpeq32	%f4,	%f14,	%i0
	tvs	%icc,	0x7
	addcc	%g7,	0x174A,	%l1
loop_2571:
	fblg,a	%fcc0,	loop_2572
	fmovspos	%xcc,	%f0,	%f21
	fandnot2s	%f8,	%f13,	%f31
	movl	%icc,	%o6,	%l4
loop_2572:
	ldub	[%l7 + 0x46],	%o2
	tvc	%icc,	0x0
	sra	%i1,	%l2,	%g2
	std	%o4,	[%l7 + 0x38]
	fmovdgu	%xcc,	%f14,	%f27
	andn	%l3,	0x1462,	%g3
	fmovsleu	%icc,	%f0,	%f5
	edge16n	%i5,	%i6,	%i3
	fmovdg	%xcc,	%f5,	%f29
	sllx	%l5,	0x17,	%i2
	movrgez	%g5,	0x270,	%i4
	orn	%o4,	%l6,	%o1
	xorcc	%l0,	%g6,	%o0
	ldub	[%l7 + 0x19],	%i7
	movrlz	%o3,	0x0D4,	%g1
	ldub	[%l7 + 0x50],	%g4
	mulscc	%i0,	%o7,	%g7
	tpos	%icc,	0x2
	fblg	%fcc1,	loop_2573
	edge16ln	%l1,	%l4,	%o6
	fmovrdlz	%i1,	%f18,	%f12
	fmovsvs	%xcc,	%f22,	%f31
loop_2573:
	fbuge,a	%fcc1,	loop_2574
	taddcc	%l2,	%o2,	%g2
	sllx	%l3,	0x03,	%o5
	xor	%g3,	0x0887,	%i5
loop_2574:
	fmovdn	%icc,	%f24,	%f23
	membar	0x53
	fmovdne	%icc,	%f23,	%f31
	set	0x10, %o6
	ldda	[%l7 + %o6] 0x24,	%i2
	set	0x398, %o3
	nop 	! 	nop 	! 	ldxa	[%g0 + %o3] 0x40,	%l5 ripped by fixASI40.pl ripped by fixASI40.pl
	udiv	%i2,	0x066E,	%i6
	sdiv	%i4,	0x0C1A,	%o4
	tvs	%icc,	0x4
	stb	%g5,	[%l7 + 0x53]
	fmovdle	%icc,	%f31,	%f28
	bvc,a	%xcc,	loop_2575
	te	%xcc,	0x7
	fmovdl	%icc,	%f13,	%f3
	sethi	0x0851,	%o1
loop_2575:
	tn	%icc,	0x0
	stbar
	mova	%xcc,	%l6,	%l0
	udiv	%o0,	0x0CBE,	%i7
	fmovdn	%icc,	%f17,	%f0
	smul	%g6,	0x046E,	%g1
	taddcc	%o3,	0x01C7,	%i0
	fmovrdlez	%o7,	%f22,	%f6
	srlx	%g7,	0x16,	%g4
	tvs	%xcc,	0x2
	tn	%xcc,	0x7
	fmovscc	%icc,	%f24,	%f31
	andncc	%l4,	%o6,	%i1
	tleu	%xcc,	0x5
	fornot1	%f30,	%f26,	%f6
	smulcc	%l2,	%l1,	%o2
	fxnors	%f19,	%f4,	%f1
	ldd	[%l7 + 0x08],	%f28
	tsubcctv	%g2,	0x0BC9,	%l3
	fpack16	%f26,	%f24
	fmovrdgz	%o5,	%f2,	%f14
	fzero	%f6
	sdivcc	%g3,	0x1C43,	%i5
	movg	%icc,	%l5,	%i2
	ldsb	[%l7 + 0x5A],	%i3
	fmul8ulx16	%f26,	%f26,	%f8
	addc	%i4,	%i6,	%g5
	mulscc	%o1,	%o4,	%l0
	fblg,a	%fcc3,	loop_2576
	brnz,a	%o0,	loop_2577
	mova	%icc,	%l6,	%i7
	sllx	%g6,	%o3,	%i0
loop_2576:
	edge16	%g1,	%o7,	%g7
loop_2577:
	edge16n	%l4,	%g4,	%o6
	movre	%i1,	0x02B,	%l2
	movg	%icc,	%o2,	%l1
	edge32	%l3,	%g2,	%o5
	orn	%g3,	0x0FBD,	%i5
	tsubcc	%l5,	%i2,	%i3
	umul	%i6,	0x01C7,	%g5
	movrgz	%i4,	0x367,	%o1
	bleu,a	%icc,	loop_2578
	move	%icc,	%l0,	%o4
	brgz	%o0,	loop_2579
	bvs,pn	%icc,	loop_2580
loop_2578:
	mova	%icc,	%i7,	%l6
	ldd	[%l7 + 0x50],	%f10
loop_2579:
	flush	%l7 + 0x2C
loop_2580:
	fpadd32	%f12,	%f28,	%f12
	addccc	%g6,	%i0,	%g1
	tne	%xcc,	0x0
	wr	%g0,	0x0c,	%asi
	prefetcha	[%l7 + 0x40] %asi,	 0x3
	fbne,a	%fcc0,	loop_2581
	fmovsa	%icc,	%f31,	%f3
	tneg	%xcc,	0x7
	std	%g6,	[%l7 + 0x18]
loop_2581:
	tg	%xcc,	0x2
	edge8ln	%l4,	%g4,	%o6
	fbug,a	%fcc2,	loop_2582
	fornot1s	%f6,	%f18,	%f2
	brlz,a	%i1,	loop_2583
	movge	%icc,	%l2,	%o2
loop_2582:
	nop
	set	0x40, %o2
	sta	%f8,	[%l7 + %o2] 0x14
loop_2583:
	nop
	setx	loop_2584,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	brgz,a	%o3,	loop_2585
	andcc	%l3,	0x1E7D,	%l1
	sdivx	%o5,	0x157B,	%g2
loop_2584:
	edge16l	%i5,	%g3,	%i2
loop_2585:
	fbue	%fcc2,	loop_2586
	sdivcc	%l5,	0x1CCE,	%i6
	ldsh	[%l7 + 0x42],	%i3
	addcc	%g5,	%o1,	%l0
loop_2586:
	movgu	%icc,	%i4,	%o0
	fzero	%f2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tleu	%icc,	0x7
	fcmpne32	%f4,	%f26,	%i7
	fbule,a	%fcc1,	loop_2587
	movre	%l6,	0x340,	%o4
	fand	%f18,	%f26,	%f26
	fnegd	%f14,	%f16
loop_2587:
	move	%icc,	%g6,	%g1
	set	0x39, %l0
	lduba	[%l7 + %l0] 0x14,	%o7
	set	0x39, %i7
	stba	%i0,	[%l7 + %i7] 0x23
	membar	#Sync
	fandnot1s	%f13,	%f21,	%f14
	edge32n	%g7,	%g4,	%o6
	brlez	%l4,	loop_2588
	edge16n	%i1,	%o2,	%o3
	udivx	%l3,	0x042D,	%l1
	orn	%l2,	0x189D,	%g2
loop_2588:
	sdiv	%i5,	0x1E95,	%g3
	fmovrslez	%i2,	%f30,	%f22
	fmovdleu	%xcc,	%f7,	%f1
	fble	%fcc3,	loop_2589
	sra	%o5,	%i6,	%l5
	mulx	%g5,	%o1,	%i3
	fnegd	%f28,	%f6
loop_2589:
	ba,pt	%xcc,	loop_2590
	fmovsn	%icc,	%f8,	%f28
	orcc	%l0,	%i4,	%i7
	std	%f24,	[%l7 + 0x50]
loop_2590:
	ld	[%l7 + 0x7C],	%f16
	subcc	%o0,	%o4,	%l6
	xorcc	%g1,	%o7,	%g6
	movrgz	%i0,	0x365,	%g7
	array16	%o6,	%g4,	%l4
	udivcc	%i1,	0x134F,	%o2
	fbuge,a	%fcc1,	loop_2591
	movrlez	%o3,	0x056,	%l1
	set	0x30, %o5
	lduba	[%l7 + %o5] 0x80,	%l2
loop_2591:
	movg	%xcc,	%g2,	%i5
	sra	%l3,	%g3,	%i2
	tgu	%icc,	0x7
	addc	%i6,	0x0700,	%l5
	movneg	%xcc,	%o5,	%o1
	sethi	0x1199,	%i3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srax	%l0,	0x04,	%i4
	movrlz	%g5,	%o0,	%i7
	taddcctv	%l6,	%g1,	%o7
	srlx	%g6,	%o4,	%i0
	edge8	%o6,	%g4,	%g7
	xorcc	%l4,	%i1,	%o2
	movge	%xcc,	%l1,	%l2
	edge16l	%g2,	%i5,	%o3
	andncc	%l3,	%i2,	%g3
	sdiv	%l5,	0x135C,	%o5
	array32	%i6,	%i3,	%l0
	sra	%i4,	%o1,	%o0
	brgez,a	%i7,	loop_2592
	movle	%icc,	%l6,	%g1
	fpadd32	%f30,	%f4,	%f2
	tn	%icc,	0x2
loop_2592:
	alignaddr	%g5,	%g6,	%o4
	movneg	%icc,	%o7,	%o6
	subc	%i0,	%g7,	%l4
	add	%l7,	0x70,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%g4
	casxa	[%l6] 0x81,	%g4,	%i1
	tcc	%icc,	0x6
	fbge	%fcc1,	loop_2593
	tgu	%icc,	0x7
	fandnot2s	%f15,	%f7,	%f30
	subcc	%l1,	%o2,	%l2
loop_2593:
	umul	%i5,	0x0BDE,	%g2
	and	%o3,	%l3,	%g3
	brgez,a	%i2,	loop_2594
	fnors	%f12,	%f27,	%f29
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array8	%l5,	%o5,	%i6
loop_2594:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovd	%f8,	%f16
	movle	%icc,	%l0,	%i4
	movl	%icc,	%i3,	%o0
	or	%i7,	0x1385,	%o1
	subc	%l6,	0x072B,	%g5
	tg	%icc,	0x0
	movl	%xcc,	%g1,	%o4
	nop
	setx loop_2595, %l0, %l1
	jmpl %l1, %g6
	xor	%o7,	0x0ED4,	%o6
	edge8ln	%i0,	%g7,	%l4
	mova	%icc,	%i1,	%l1
loop_2595:
	movneg	%xcc,	%g4,	%o2
	st	%f29,	[%l7 + 0x2C]
	movg	%xcc,	%l2,	%g2
	subcc	%o3,	0x1FCF,	%i5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mova	%icc,	%g3,	%i2
	mulscc	%l5,	0x023F,	%o5
	edge32	%i6,	%l3,	%i4
	movge	%xcc,	%l0,	%i3
	bcs,a,pt	%icc,	loop_2596
	ldd	[%l7 + 0x78],	%i6
	edge16ln	%o0,	%l6,	%o1
	array16	%g1,	%g5,	%o4
loop_2596:
	movne	%icc,	%o7,	%g6
	edge8l	%o6,	%i0,	%g7
	set	0x4C, %o0
	sta	%f11,	[%l7 + %o0] 0x11
	wr	%g0,	0x2f,	%asi
	stba	%i1,	[%l7 + 0x65] %asi
	membar	#Sync
	fmovsvc	%xcc,	%f12,	%f29
	membar	0x6B
	std	%l4,	[%l7 + 0x28]
	wr	%g0,	0xe3,	%asi
	ldda	[%l7 + 0x40] %asi,	%g4
	stw	%o2,	[%l7 + 0x68]
	fnot2	%f24,	%f10
	orn	%l2,	0x1442,	%l1
	fnegd	%f6,	%f0
	sdivcc	%g2,	0x157F,	%o3
	set	0x20, %l3
	stxa	%g3,	[%l7 + %l3] 0x04
	movre	%i5,	%l5,	%i2
	tcc	%icc,	0x6
	edge32ln	%i6,	%o5,	%l3
	xnor	%i4,	0x0F99,	%l0
	ldx	[%l7 + 0x78],	%i3
	tvs	%xcc,	0x5
	orncc	%i7,	%l6,	%o0
	fxor	%f28,	%f10,	%f12
	edge16ln	%g1,	%o1,	%o4
	edge16n	%g5,	%g6,	%o7
	fzero	%f22
	ta	%xcc,	0x6
	mulscc	%i0,	%o6,	%g7
	movrlz	%l4,	%i1,	%g4
	array16	%l2,	%o2,	%l1
	taddcctv	%g2,	%g3,	%o3
	sra	%i5,	0x14,	%i2
	brlz	%i6,	loop_2597
	edge32l	%l5,	%l3,	%i4
	xor	%l0,	0x05A1,	%i3
	movn	%xcc,	%o5,	%l6
loop_2597:
	lduh	[%l7 + 0x6E],	%o0
	smul	%g1,	%o1,	%i7
	sll	%g5,	0x0C,	%o4
	sdivx	%o7,	0x1C2A,	%g6
	smulcc	%i0,	0x146E,	%g7
	subcc	%o6,	0x1E7B,	%i1
	udivcc	%g4,	0x04D1,	%l4
	fblg,a	%fcc0,	loop_2598
	tcs	%xcc,	0x7
	wr	%g0,	0x81,	%asi
	ldsha	[%l7 + 0x3C] %asi,	%l2
loop_2598:
	fmovdvc	%xcc,	%f23,	%f29
	fcmpeq16	%f14,	%f2,	%o2
	ldub	[%l7 + 0x2B],	%l1
	sub	%g3,	%g2,	%i5
	bneg,a,pn	%xcc,	loop_2599
	brnz	%o3,	loop_2600
	fmovsl	%icc,	%f18,	%f21
	fornot1s	%f10,	%f27,	%f10
loop_2599:
	edge8	%i2,	%l5,	%l3
loop_2600:
	smulcc	%i6,	%i4,	%l0
	wr	%g0,	0x80,	%asi
	ldstuba	[%l7 + 0x21] %asi,	%o5
	tvc	%icc,	0x6
	fand	%f20,	%f22,	%f14
	fcmpgt16	%f14,	%f30,	%l6
	orn	%o0,	%i3,	%g1
	movcs	%xcc,	%i7,	%o1
	movrgez	%g5,	0x02E,	%o4
	movge	%xcc,	%o7,	%i0
	subc	%g6,	0x08D3,	%g7
	addcc	%o6,	%g4,	%i1
	tl	%icc,	0x4
	edge16	%l2,	%l4,	%l1
	tsubcctv	%o2,	%g2,	%i5
	stx	%g3,	[%l7 + 0x78]
	tge	%icc,	0x4
	alignaddr	%i2,	%l5,	%o3
	tl	%icc,	0x1
	fcmpeq16	%f8,	%f0,	%i6
	nop
	set	0x78, %g7
	ldd	[%l7 + %g7],	%f18
	smulcc	%l3,	0x187B,	%l0
	membar	0x67
	fpack16	%f0,	%f16
	subccc	%i4,	0x0B08,	%o5
	array16	%o0,	%i3,	%l6
	tvs	%icc,	0x4
	fpsub16s	%f28,	%f13,	%f12
	mulscc	%i7,	0x1C8F,	%o1
	fmovdle	%icc,	%f17,	%f9
	mulscc	%g1,	%g5,	%o4
	membar	0x21
	array32	%o7,	%i0,	%g7
	orn	%g6,	0x16A4,	%g4
	array8	%i1,	%l2,	%o6
	stbar
	brz	%l1,	loop_2601
	fbule,a	%fcc2,	loop_2602
	ldd	[%l7 + 0x58],	%f24
	wr	%g0,	0x88,	%asi
	ldsha	[%l7 + 0x62] %asi,	%l4
loop_2601:
	tcs	%xcc,	0x4
loop_2602:
	and	%o2,	%g2,	%i5
	movpos	%icc,	%i2,	%g3
	nop
	set	0x0A, %i4
	ldsh	[%l7 + %i4],	%o3
	edge32l	%l5,	%l3,	%i6
	movvs	%xcc,	%i4,	%o5
	movne	%xcc,	%o0,	%l0
	fcmpne32	%f28,	%f14,	%i3
	brlz,a	%l6,	loop_2603
	be,a	loop_2604
	fmovsne	%icc,	%f16,	%f29
	wr	%g0,	0x23,	%asi
	ldda	[%l7 + 0x60] %asi,	%o0
loop_2603:
	fble	%fcc3,	loop_2605
loop_2604:
	fmovrsgz	%i7,	%f10,	%f16
	sdivcc	%g5,	0x0FD8,	%o4
	fcmple16	%f6,	%f8,	%g1
loop_2605:
	bpos,a	loop_2606
	tneg	%icc,	0x3
	andcc	%i0,	0x04DE,	%g7
	fmovd	%f14,	%f28
loop_2606:
	bne,a	loop_2607
	fcmpeq16	%f6,	%f22,	%g6
	fmovdcs	%icc,	%f14,	%f8
	fbge,a	%fcc1,	loop_2608
loop_2607:
	orcc	%g4,	0x1DE1,	%i1
	fnor	%f28,	%f4,	%f14
	fpsub16s	%f13,	%f29,	%f1
loop_2608:
	fbg,a	%fcc2,	loop_2609
	stbar
	and	%l2,	0x14D5,	%o7
	fmovrde	%o6,	%f20,	%f4
loop_2609:
	pdist	%f26,	%f14,	%f2
	set	0x78, %l2
	prefetcha	[%l7 + %l2] 0x11,	 0x2
	andncc	%l1,	%o2,	%g2
	fsrc1	%f22,	%f30
	tgu	%icc,	0x7
	movneg	%xcc,	%i2,	%g3
	flush	%l7 + 0x14
	fmovdpos	%icc,	%f13,	%f9
	fpackfix	%f20,	%f19
	lduw	[%l7 + 0x30],	%o3
	ta	%xcc,	0x6
	fbg	%fcc2,	loop_2610
	brlez,a	%l5,	loop_2611
	fmovsvs	%xcc,	%f4,	%f3
	bl,pn	%icc,	loop_2612
loop_2610:
	subc	%i5,	0x1E90,	%i6
loop_2611:
	fxors	%f20,	%f30,	%f15
	movrlez	%i4,	0x2EE,	%l3
loop_2612:
	fmul8sux16	%f24,	%f24,	%f12
	tsubcctv	%o0,	%o5,	%i3
	edge16	%l6,	%l0,	%o1
	edge32ln	%g5,	%o4,	%g1
	sdivcc	%i7,	0x04BC,	%i0
	subcc	%g6,	%g4,	%g7
	fcmpgt32	%f8,	%f4,	%l2
	fmovsvc	%icc,	%f23,	%f0
	fmovrdlz	%i1,	%f0,	%f4
	movpos	%icc,	%o7,	%o6
	umul	%l1,	%o2,	%l4
	stbar
	tgu	%icc,	0x5
	wr	%g0,	0x11,	%asi
	lduha	[%l7 + 0x22] %asi,	%g2
	nop
	set	0x78, %g6
	lduh	[%l7 + %g6],	%i2
	edge32ln	%o3,	%g3,	%i5
	or	%l5,	%i6,	%l3
	set	0x48, %g5
	prefetcha	[%l7 + %g5] 0x0c,	 0x2
	wr	%g0,	0x22,	%asi
	stba	%o5,	[%l7 + 0x0C] %asi
	membar	#Sync
	set	0x3C, %o4
	stha	%o0,	[%l7 + %o4] 0xeb
	membar	#Sync
	sllx	%l6,	0x14,	%l0
	movrne	%i3,	0x010,	%g5
	and	%o1,	%o4,	%g1
	fmovdleu	%xcc,	%f1,	%f5
	movge	%xcc,	%i7,	%g6
	ldd	[%l7 + 0x60],	%g4
	fnot1	%f24,	%f18
	stbar
	movn	%icc,	%g7,	%i0
	call	loop_2613
	membar	0x72
	bneg	%xcc,	loop_2614
	nop
	set	0x50, %l4
	lduw	[%l7 + %l4],	%l2
loop_2613:
	alignaddr	%i1,	%o6,	%o7
	bcc,a,pt	%icc,	loop_2615
loop_2614:
	and	%l1,	0x036B,	%o2
	bcs,a	loop_2616
	std	%l4,	[%l7 + 0x58]
loop_2615:
	fsrc2	%f10,	%f16
	taddcctv	%i2,	%o3,	%g2
loop_2616:
	bleu,pt	%xcc,	loop_2617
	fcmps	%fcc2,	%f31,	%f9
	wr	%g0,	0x2f,	%asi
	stha	%i5,	[%l7 + 0x62] %asi
	membar	#Sync
loop_2617:
	edge8ln	%l5,	%i6,	%l3
	movg	%icc,	%g3,	%o5
	umulcc	%i4,	%l6,	%l0
	bleu	%icc,	loop_2618
	movpos	%xcc,	%o0,	%i3
	fmul8x16al	%f24,	%f24,	%f22
	flush	%l7 + 0x10
loop_2618:
	mulx	%g5,	%o1,	%o4
	brz	%g1,	loop_2619
	taddcctv	%i7,	%g6,	%g4
	fornot2s	%f19,	%f23,	%f19
	movrgez	%i0,	%l2,	%g7
loop_2619:
	fmovrdgez	%o6,	%f26,	%f18
	wr	%g0,	0x89,	%asi
	prefetcha	[%l7 + 0x38] %asi,	 0x2
	fsrc2s	%f2,	%f31
	fsrc2	%f16,	%f6
	alignaddrl	%l1,	%o2,	%l4
	fbuge	%fcc0,	loop_2620
	tvs	%xcc,	0x1
	wr	%g0,	0x80,	%asi
	sta	%f24,	[%l7 + 0x74] %asi
loop_2620:
	brz,a	%i1,	loop_2621
	sdivx	%o3,	0x0F88,	%g2
	fmul8sux16	%f22,	%f20,	%f26
	ta	%icc,	0x6
loop_2621:
	tle	%xcc,	0x2
	flush	%l7 + 0x70
	bpos,a	loop_2622
	movne	%xcc,	%i2,	%l5
	brlez,a	%i6,	loop_2623
	alignaddr	%i5,	%g3,	%o5
loop_2622:
	sethi	0x1754,	%i4
	movg	%xcc,	%l3,	%l6
loop_2623:
	fbg,a	%fcc3,	loop_2624
	std	%f16,	[%l7 + 0x78]
	bn,a	%xcc,	loop_2625
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2624:
	edge32n	%l0,	%o0,	%i3
	set	0x50, %o7
	ldda	[%l7 + %o7] 0x2b,	%g4
loop_2625:
	fxor	%f2,	%f0,	%f8
	umul	%o1,	0x0F73,	%g1
	edge32	%i7,	%g6,	%o4
	flush	%l7 + 0x34
	fand	%f12,	%f24,	%f10
	movcs	%icc,	%i0,	%g4
	fand	%f10,	%f8,	%f20
	addccc	%l2,	0x155E,	%o6
	fmovrsgez	%o7,	%f17,	%f13
	smul	%l1,	%g7,	%o2
	edge32n	%l4,	%i1,	%g2
	subcc	%o3,	%i2,	%i6
	movn	%xcc,	%i5,	%g3
	tg	%xcc,	0x4
	smulcc	%o5,	%l5,	%l3
	edge16l	%l6,	%i4,	%l0
	fnors	%f8,	%f8,	%f18
	ld	[%l7 + 0x28],	%f1
	fbule	%fcc3,	loop_2626
	edge8ln	%i3,	%o0,	%o1
	swap	[%l7 + 0x64],	%g1
	bvs	%xcc,	loop_2627
loop_2626:
	flush	%l7 + 0x74
	movcs	%xcc,	%i7,	%g6
	udiv	%o4,	0x18D7,	%i0
loop_2627:
	brlz,a	%g5,	loop_2628
	mulx	%l2,	0x0C09,	%o6
	edge32l	%g4,	%o7,	%g7
	srl	%o2,	%l1,	%i1
loop_2628:
	subcc	%l4,	0x1E0D,	%g2
	fmovrdgz	%o3,	%f12,	%f22
	add	%l7,	0x18,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%i6
	casxa	[%l6] %asi,	%i6,	%i5
	movleu	%icc,	%g3,	%i2
	set	0x34, %g3
	stha	%l5,	[%l7 + %g3] 0x04
	sra	%l3,	0x15,	%o5
	srl	%i4,	%l0,	%i3
	ble,a,pt	%xcc,	loop_2629
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tsubcc	%o0,	0x1291,	%o1
	tsubcctv	%l6,	0x0A50,	%g1
loop_2629:
	movl	%icc,	%g6,	%o4
	fmovsleu	%xcc,	%f23,	%f3
	set	0x64, %l5
	lda	[%l7 + %l5] 0x04,	%f14
	movrlez	%i7,	0x3D4,	%g5
	fpadd32s	%f19,	%f18,	%f17
	edge8l	%l2,	%i0,	%g4
	fmovrdlez	%o6,	%f28,	%f30
	fxor	%f0,	%f22,	%f20
	taddcctv	%o7,	0x10E6,	%g7
	bgu,a,pt	%icc,	loop_2630
	smul	%o2,	%i1,	%l1
	set	0x78, %g4
	lduha	[%l7 + %g4] 0x18,	%g2
loop_2630:
	movrlez	%o3,	0x25A,	%i6
	fnot1	%f6,	%f22
	for	%f28,	%f12,	%f0
	xorcc	%i5,	%g3,	%l4
	fcmpgt16	%f20,	%f30,	%l5
	nop
	setx	loop_2631,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	bvc,pn	%xcc,	loop_2632
	tpos	%xcc,	0x2
	set	0x68, %i1
	stda	%l2,	[%l7 + %i1] 0x18
loop_2631:
	fcmpgt16	%f14,	%f28,	%o5
loop_2632:
	edge8ln	%i2,	%l0,	%i4
	tvs	%icc,	0x6
	movcs	%icc,	%o0,	%i3
	fmovdleu	%icc,	%f0,	%f30
	set	0x40, %i3
	ldda	[%l7 + %i3] 0x80,	%f16
	add	%l7,	0x50,	%l6
	wr	%g0,	0x11,	%asi
	casxa	[%l6] %asi,	%l6,	%o1
	fbge	%fcc1,	loop_2633
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16	%g6,	%o4,	%g1
	alignaddrl	%i7,	%l2,	%g5
loop_2633:
	fxor	%f18,	%f28,	%f18
	fmovde	%icc,	%f25,	%f10
	wr	%g0,	0x11,	%asi
	stda	%i0,	[%l7 + 0x08] %asi
	fcmpgt16	%f20,	%f16,	%o6
	edge8ln	%o7,	%g7,	%o2
	edge16ln	%i1,	%g4,	%g2
	movpos	%icc,	%l1,	%o3
	movneg	%icc,	%i5,	%g3
	fpsub16s	%f17,	%f29,	%f13
	fornot2s	%f7,	%f20,	%f0
	tleu	%icc,	0x4
	fcmpeq16	%f2,	%f10,	%l4
	nop
	set	0x1C, %g1
	prefetch	[%l7 + %g1],	 0x2
	movrgz	%l5,	0x2C0,	%i6
	move	%icc,	%o5,	%l3
	popc	%l0,	%i2
	array16	%o0,	%i3,	%i4
	fnors	%f25,	%f23,	%f11
	add	%l7,	0x50,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%o1,	%g6
	ld	[%l7 + 0x20],	%f12
	subcc	%o4,	%l6,	%g1
	sdivcc	%i7,	0x0908,	%g5
	edge32ln	%i0,	%l2,	%o7
	orncc	%g7,	%o6,	%o2
	addcc	%g4,	0x0C42,	%i1
	fmovsle	%xcc,	%f7,	%f20
	fabss	%f23,	%f24
	brz,a	%g2,	loop_2634
	sethi	0x1D83,	%o3
	tn	%xcc,	0x4
	array8	%i5,	%g3,	%l1
loop_2634:
	fmul8sux16	%f6,	%f28,	%f18
	orncc	%l5,	%l4,	%i6
	fmovdn	%xcc,	%f18,	%f7
	sll	%l3,	0x17,	%l0
	edge8ln	%o5,	%i2,	%i3
	edge16ln	%i4,	%o1,	%g6
	tvs	%xcc,	0x6
	fpadd16s	%f30,	%f8,	%f22
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	be,a,pt	%xcc,	loop_2635
	fmovdcc	%xcc,	%f14,	%f24
	tne	%icc,	0x3
	subcc	%o4,	%o0,	%l6
loop_2635:
	movvc	%icc,	%i7,	%g5
	orn	%i0,	%g1,	%l2
	fbne	%fcc0,	loop_2636
	mulscc	%o7,	%o6,	%o2
	xnor	%g7,	0x125B,	%i1
	fmovdleu	%icc,	%f29,	%f26
loop_2636:
	nop
	wr	%g0,	0x88,	%asi
	stba	%g4,	[%l7 + 0x6B] %asi
	tsubcctv	%g2,	0x108F,	%i5
	fmovs	%f13,	%f9
	fcmpeq16	%f0,	%f12,	%g3
	te	%xcc,	0x1
	movne	%xcc,	%o3,	%l5
	edge16ln	%l1,	%l4,	%i6
	fmovdvs	%xcc,	%f17,	%f6
	fmovrse	%l3,	%f15,	%f9
	tpos	%xcc,	0x6
	set	0x28, %l6
	lda	[%l7 + %l6] 0x14,	%f29
	umulcc	%l0,	0x0B18,	%o5
	stx	%i2,	[%l7 + 0x30]
	fble,a	%fcc1,	loop_2637
	movne	%icc,	%i4,	%o1
	edge16ln	%g6,	%i3,	%o0
	fbu,a	%fcc0,	loop_2638
loop_2637:
	fbug,a	%fcc0,	loop_2639
	prefetch	[%l7 + 0x20],	 0x1
	and	%l6,	0x0C94,	%i7
loop_2638:
	smulcc	%o4,	0x0E0C,	%g5
loop_2639:
	taddcctv	%g1,	0x1FBC,	%l2
	fba	%fcc1,	loop_2640
	addcc	%i0,	%o7,	%o2
	edge16ln	%g7,	%o6,	%g4
	bcs,a,pt	%xcc,	loop_2641
loop_2640:
	xnor	%i1,	%g2,	%i5
	wr	%g0,	0x19,	%asi
	prefetcha	[%l7 + 0x50] %asi,	 0x1
loop_2641:
	srl	%g3,	%l5,	%l4
	stbar
	fmovrsgez	%l1,	%f28,	%f19
	array16	%l3,	%i6,	%o5
	subcc	%l0,	%i4,	%i2
	fxnor	%f28,	%f20,	%f12
	add	%l7,	0x34,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%o1
	casa	[%l6] %asi,	%o1,	%i3
	fmovrsgz	%g6,	%f0,	%f0
	and	%o0,	%i7,	%l6
	wr	%g0,	0x50,	%asi
	ldxa	[%g0 + 0x00] %asi,	%o4
	movvs	%icc,	%g5,	%l2
	set	0x74, %o1
	stba	%i0,	[%l7 + %o1] 0xea
	membar	#Sync
	alignaddrl	%g1,	%o2,	%g7
	addccc	%o7,	0x17A1,	%g4
	ld	[%l7 + 0x30],	%f27
	movvs	%xcc,	%i1,	%o6
	udivcc	%g2,	0x1006,	%o3
	fnor	%f20,	%f28,	%f10
	movleu	%xcc,	%i5,	%g3
	tl	%xcc,	0x1
	bg,a,pt	%xcc,	loop_2642
	tsubcc	%l4,	0x1D0B,	%l1
	udivx	%l3,	0x16C3,	%i6
	addcc	%o5,	0x1545,	%l5
loop_2642:
	ldsw	[%l7 + 0x70],	%l0
	addccc	%i4,	0x0BBB,	%i2
	or	%i3,	%o1,	%g6
	umulcc	%o0,	0x1657,	%i7
	nop
	set	0x14, %i0
	ldsw	[%l7 + %i0],	%o4
	addcc	%l6,	0x133E,	%l2
	edge16	%g5,	%g1,	%o2
	tg	%xcc,	0x6
	fbn,a	%fcc2,	loop_2643
	movl	%icc,	%i0,	%o7
	stb	%g7,	[%l7 + 0x5C]
	edge32l	%i1,	%o6,	%g2
loop_2643:
	array16	%g4,	%o3,	%g3
	fmovdcs	%xcc,	%f23,	%f7
	tcs	%icc,	0x5
	movre	%l4,	0x3A8,	%i5
	tsubcctv	%l1,	0x18E7,	%i6
	edge8	%o5,	%l3,	%l0
	sdivcc	%i4,	0x184F,	%l5
	fsrc1s	%f28,	%f11
	fble	%fcc2,	loop_2644
	edge32	%i3,	%i2,	%o1
	fcmps	%fcc2,	%f6,	%f29
	nop
	set	0x54, %i6
	ldstub	[%l7 + %i6],	%g6
loop_2644:
	andcc	%o0,	%i7,	%o4
	andncc	%l6,	%l2,	%g5
	srlx	%o2,	0x10,	%g1
	fmovde	%xcc,	%f6,	%f12
	set	0x48, %l1
	stda	%o6,	[%l7 + %l1] 0x0c
	fmovdpos	%xcc,	%f26,	%f30
	prefetch	[%l7 + 0x30],	 0x1
	set	0x66, %i2
	stha	%i0,	[%l7 + %i2] 0x2b
	membar	#Sync
	fbule	%fcc0,	loop_2645
	fbge,a	%fcc0,	loop_2646
	fbne,a	%fcc2,	loop_2647
	fmovdvs	%icc,	%f13,	%f0
loop_2645:
	nop
	wr	%g0,	0x0c,	%asi
	sta	%f25,	[%l7 + 0x20] %asi
loop_2646:
	fmovscc	%icc,	%f19,	%f25
loop_2647:
	addcc	%i1,	%g7,	%o6
	set	0x1B, %g2
	ldstuba	[%l7 + %g2] 0x89,	%g2
	call	loop_2648
	array16	%g4,	%g3,	%l4
	orncc	%i5,	0x0B57,	%l1
	tl	%icc,	0x4
loop_2648:
	tsubcctv	%i6,	0x1820,	%o3
	movn	%icc,	%o5,	%l0
	movrlz	%l3,	%i4,	%i3
	fmovdg	%xcc,	%f23,	%f20
	tvc	%xcc,	0x2
	ldd	[%l7 + 0x58],	%i2
	taddcc	%l5,	0x04BE,	%g6
	edge32n	%o0,	%o1,	%o4
	ta	%icc,	0x3
	tn	%xcc,	0x5
	addc	%i7,	%l2,	%g5
	mulscc	%l6,	%g1,	%o2
	fabss	%f27,	%f7
	mulx	%o7,	0x0604,	%i1
	movle	%icc,	%i0,	%g7
	stb	%g2,	[%l7 + 0x5F]
	ldub	[%l7 + 0x78],	%o6
	edge16n	%g4,	%g3,	%i5
	membar	#Sync
	set	0x40, %i5
	ldda	[%l7 + %i5] 0xf8,	%f0
	movle	%icc,	%l1,	%i6
	te	%xcc,	0x4
	nop
	setx loop_2649, %l0, %l1
	jmpl %l1, %o3
	sdivcc	%o5,	0x1B50,	%l4
	fpack32	%f0,	%f22,	%f2
	fandnot2s	%f0,	%f8,	%f22
loop_2649:
	taddcctv	%l0,	0x0349,	%l3
	xnor	%i4,	%i2,	%l5
	set	0x32, %o3
	stha	%g6,	[%l7 + %o3] 0x19
	brz	%i3,	loop_2650
	fmovsleu	%xcc,	%f16,	%f1
	fmuld8sux16	%f18,	%f4,	%f26
	fcmpes	%fcc0,	%f30,	%f26
loop_2650:
	bvs	%icc,	loop_2651
	nop
	setx	loop_2652,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	stb	%o0,	[%l7 + 0x3A]
	tsubcctv	%o4,	0x022E,	%i7
loop_2651:
	udivx	%o1,	0x195C,	%l2
loop_2652:
	nop
	wr	%g0,	0x0c,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	ldub	[%l7 + 0x1C],	%l6
	orncc	%g1,	0x0424,	%g5
	udivcc	%o7,	0x003A,	%i1
	fpadd32s	%f2,	%f24,	%f12
	nop
	setx loop_2653, %l0, %l1
	jmpl %l1, %i0
	edge8ln	%o2,	%g2,	%g7
	sra	%g4,	0x1B,	%g3
	fnot2	%f8,	%f30
loop_2653:
	ldsw	[%l7 + 0x30],	%i5
	sdivcc	%o6,	0x135C,	%l1
	fpadd16s	%f22,	%f31,	%f25
	wr	%g0,	0x81,	%asi
	ldsba	[%l7 + 0x0D] %asi,	%o3
	movre	%i6,	0x1E8,	%l4
	subc	%l0,	0x1694,	%o5
	andn	%i4,	0x1DFF,	%l3
	fbn	%fcc0,	loop_2654
	udivcc	%i2,	0x062F,	%l5
	pdist	%f10,	%f8,	%f4
	array32	%i3,	%g6,	%o0
loop_2654:
	edge8l	%o4,	%i7,	%o1
	edge16n	%l6,	%g1,	%l2
	bge,pn	%icc,	loop_2655
	movgu	%xcc,	%g5,	%i1
	fmovdgu	%icc,	%f26,	%f11
	call	loop_2656
loop_2655:
	sll	%i0,	0x11,	%o7
	bvc,a	loop_2657
	fandnot1s	%f18,	%f1,	%f14
loop_2656:
	fzeros	%f11
	fbn	%fcc3,	loop_2658
loop_2657:
	bvc	loop_2659
	movcc	%icc,	%o2,	%g7
	wr	%g0,	0x10,	%asi
	ldsha	[%l7 + 0x18] %asi,	%g4
loop_2658:
	tsubcctv	%g2,	0x0BC1,	%i5
loop_2659:
	tsubcc	%g3,	%l1,	%o3
	lduw	[%l7 + 0x30],	%i6
	and	%l4,	%o6,	%o5
	fbule	%fcc0,	loop_2660
	tg	%icc,	0x7
	taddcctv	%i4,	0x10CB,	%l0
	bl,pn	%icc,	loop_2661
loop_2660:
	edge16n	%i2,	%l3,	%l5
	movre	%i3,	0x001,	%g6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2661:
	nop
	set	0x40, %o2
	stda	%f0,	[%l7 + %o2] 0x89
	ldstub	[%l7 + 0x6F],	%o4
	fnor	%f24,	%f22,	%f6
	array16	%o0,	%i7,	%l6
	alignaddr	%o1,	%l2,	%g1
	prefetch	[%l7 + 0x38],	 0x2
	tneg	%xcc,	0x1
	bvc,a	%xcc,	loop_2662
	tsubcctv	%i1,	0x0127,	%i0
	xor	%o7,	%g5,	%o2
	orn	%g4,	%g2,	%g7
loop_2662:
	fmovsge	%xcc,	%f26,	%f24
	ld	[%l7 + 0x10],	%f21
	tcs	%xcc,	0x4
	bgu	%icc,	loop_2663
	movre	%g3,	%l1,	%o3
	stx	%i6,	[%l7 + 0x78]
	srl	%l4,	0x1E,	%i5
loop_2663:
	fmovdge	%xcc,	%f8,	%f6
	tneg	%icc,	0x6
	fnors	%f18,	%f30,	%f29
	set	0x33, %l0
	ldstuba	[%l7 + %l0] 0x11,	%o6
	fsrc2s	%f2,	%f24
	orn	%o5,	0x1F37,	%i4
	addcc	%i2,	0x03AF,	%l3
	fsrc1	%f4,	%f10
	sll	%l0,	0x1B,	%i3
	fmovrsgz	%g6,	%f12,	%f0
	and	%l5,	%o0,	%o4
	ld	[%l7 + 0x74],	%f3
	nop
	set	0x30, %i7
	sth	%l6,	[%l7 + %i7]
	movcc	%icc,	%i7,	%l2
	addcc	%o1,	%g1,	%i1
	tcs	%icc,	0x5
	mulx	%i0,	0x1A5D,	%o7
	subccc	%g5,	0x0BC1,	%g4
	nop
	setx	loop_2664,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	ld	[%l7 + 0x20],	%f11
	set	0x58, %o5
	ldswa	[%l7 + %o5] 0x81,	%o2
loop_2664:
	sllx	%g2,	0x01,	%g3
	membar	0x6B
	edge16	%l1,	%o3,	%g7
	sdivx	%i6,	0x027B,	%i5
	fxnors	%f22,	%f1,	%f30
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movne	%xcc,	%o6,	%o5
	umulcc	%i4,	%l4,	%i2
	fpackfix	%f12,	%f23
	tl	%xcc,	0x5
	tg	%xcc,	0x6
	or	%l0,	0x16E2,	%i3
	tn	%icc,	0x6
	add	%l3,	0x1F97,	%l5
	addcc	%g6,	%o0,	%o4
	udivx	%i7,	0x1FD9,	%l2
	tle	%xcc,	0x4
	subcc	%l6,	%o1,	%g1
	srlx	%i0,	%i1,	%g5
	array16	%g4,	%o7,	%g2
	stb	%o2,	[%l7 + 0x3A]
	fmovdvs	%icc,	%f23,	%f31
	orn	%g3,	%o3,	%g7
	fxor	%f12,	%f8,	%f22
	bcs	%xcc,	loop_2665
	tpos	%icc,	0x7
	sub	%i6,	%i5,	%l1
	fmovse	%xcc,	%f22,	%f18
loop_2665:
	bvs	loop_2666
	fbe	%fcc3,	loop_2667
	edge8l	%o5,	%o6,	%i4
	xnorcc	%l4,	0x0C9C,	%i2
loop_2666:
	fmovsvs	%icc,	%f11,	%f21
loop_2667:
	move	%icc,	%i3,	%l3
	xnor	%l0,	%g6,	%l5
	xorcc	%o4,	0x002B,	%i7
	movne	%icc,	%l2,	%l6
	fors	%f28,	%f9,	%f11
	edge8l	%o1,	%o0,	%i0
	wr	%g0,	0x04,	%asi
	ldsha	[%l7 + 0x4A] %asi,	%i1
	tsubcc	%g5,	%g4,	%g1
	fmuld8sux16	%f23,	%f13,	%f22
	orncc	%g2,	%o7,	%g3
	movrlz	%o2,	0x30E,	%o3
	wr	%g0,	0x2b,	%asi
	stha	%g7,	[%l7 + 0x30] %asi
	membar	#Sync
	fmovsgu	%xcc,	%f15,	%f11
	fbue,a	%fcc1,	loop_2668
	fmovsg	%icc,	%f2,	%f27
	fxors	%f10,	%f14,	%f11
	subcc	%i5,	0x00C1,	%i6
loop_2668:
	tneg	%xcc,	0x5
	sra	%l1,	0x00,	%o5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movn	%xcc,	%o6,	%l4
	sra	%i2,	%i4,	%l3
	fmovsg	%icc,	%f10,	%f10
	move	%xcc,	%i3,	%g6
	swap	[%l7 + 0x28],	%l0
	andcc	%o4,	0x1491,	%l5
	bcc	%xcc,	loop_2669
	fbe,a	%fcc3,	loop_2670
	subccc	%l2,	0x12DE,	%i7
	sub	%l6,	0x1CC0,	%o1
loop_2669:
	nop
	set	0x50, %o6
	std	%i0,	[%l7 + %o6]
loop_2670:
	movleu	%icc,	%i1,	%o0
	edge32l	%g4,	%g1,	%g2
	edge32n	%o7,	%g5,	%o2
	stbar
	brnz	%g3,	loop_2671
	bne	%icc,	loop_2672
	taddcc	%o3,	%i5,	%g7
	orn	%l1,	0x0AE6,	%i6
loop_2671:
	fmovsne	%icc,	%f17,	%f28
loop_2672:
	srax	%o6,	0x14,	%l4
	tleu	%xcc,	0x5
	ldub	[%l7 + 0x27],	%i2
	for	%f18,	%f6,	%f16
	stb	%o5,	[%l7 + 0x36]
	ldd	[%l7 + 0x58],	%f4
	tsubcc	%l3,	0x0E80,	%i4
	nop
	setx loop_2673, %l0, %l1
	jmpl %l1, %i3
	fpsub32s	%f16,	%f21,	%f30
	movre	%l0,	0x208,	%g6
	array32	%o4,	%l5,	%l2
loop_2673:
	sllx	%l6,	0x14,	%i7
	srax	%i0,	0x18,	%i1
	tle	%icc,	0x3
	tl	%icc,	0x1
	fpmerge	%f30,	%f17,	%f24
	alignaddr	%o1,	%o0,	%g4
	umulcc	%g1,	0x1995,	%g2
	edge8l	%o7,	%g5,	%o2
	tn	%xcc,	0x4
	andn	%o3,	%i5,	%g3
	fnot2s	%f24,	%f21
	lduh	[%l7 + 0x7E],	%l1
	tcs	%icc,	0x4
	for	%f18,	%f8,	%f24
	set	0x64, %o0
	sta	%f13,	[%l7 + %o0] 0x19
	tl	%xcc,	0x0
	or	%g7,	%i6,	%l4
	array8	%i2,	%o6,	%o5
	bvc,a	loop_2674
	andncc	%i4,	%i3,	%l0
	tvs	%xcc,	0x4
	edge8ln	%l3,	%g6,	%o4
loop_2674:
	fpadd16s	%f27,	%f30,	%f9
	edge8	%l2,	%l6,	%i7
	brnz	%l5,	loop_2675
	edge32ln	%i1,	%i0,	%o1
	fzero	%f22
	bvs,pn	%xcc,	loop_2676
loop_2675:
	fpackfix	%f10,	%f15
	popc	0x0648,	%g4
	fxnor	%f16,	%f14,	%f0
loop_2676:
	nop
	wr	%g0,	0xe2,	%asi
	stwa	%o0,	[%l7 + 0x60] %asi
	membar	#Sync
	edge32ln	%g1,	%o7,	%g5
	xnor	%g2,	0x1024,	%o2
	edge32	%i5,	%o3,	%l1
	and	%g3,	%g7,	%i6
	orn	%i2,	0x0DD4,	%l4
	alignaddr	%o5,	%i4,	%i3
	tg	%icc,	0x6
	brgz,a	%o6,	loop_2677
	movrlz	%l0,	0x0E3,	%g6
	fmovdleu	%icc,	%f10,	%f29
	fandnot1s	%f15,	%f3,	%f2
loop_2677:
	sub	%l3,	%o4,	%l6
	movre	%l2,	0x32A,	%l5
	std	%f12,	[%l7 + 0x38]
	brnz,a	%i7,	loop_2678
	srax	%i0,	0x06,	%o1
	movleu	%xcc,	%i1,	%o0
	fmovse	%icc,	%f3,	%f12
loop_2678:
	sir	0x16EB
	fmovdcc	%icc,	%f30,	%f29
	set	0x10, %g7
	swapa	[%l7 + %g7] 0x80,	%g4
	movvc	%icc,	%o7,	%g5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tgu	%icc,	0x3
	sllx	%g2,	0x0B,	%o2
	tge	%xcc,	0x3
	ldsh	[%l7 + 0x2A],	%g1
	alignaddrl	%o3,	%i5,	%l1
	xor	%g3,	%g7,	%i6
	tcc	%xcc,	0x0
	lduh	[%l7 + 0x20],	%i2
	movn	%icc,	%l4,	%i4
	fmovdg	%xcc,	%f7,	%f30
	edge32n	%o5,	%o6,	%i3
	array32	%l0,	%g6,	%l3
	movrlez	%l6,	%o4,	%l5
	wr	%g0,	0x18,	%asi
	ldda	[%l7 + 0x30] %asi,	%l2
	srl	%i0,	0x18,	%i7
	mulx	%o1,	%o0,	%i1
	udivx	%o7,	0x0356,	%g4
	stbar
	xorcc	%g2,	0x1204,	%g5
	movrgez	%g1,	%o3,	%i5
	fpackfix	%f4,	%f30
	bshuffle	%f0,	%f28,	%f22
	edge32	%l1,	%o2,	%g7
	movneg	%icc,	%i6,	%g3
	movrlz	%l4,	%i2,	%i4
	sub	%o5,	%o6,	%l0
	add	%g6,	0x0811,	%i3
	fbge	%fcc3,	loop_2679
	mova	%icc,	%l6,	%o4
	movpos	%xcc,	%l5,	%l2
	movvs	%icc,	%l3,	%i0
loop_2679:
	or	%o1,	0x1974,	%o0
	xnorcc	%i7,	0x1AF4,	%o7
	fmovsne	%xcc,	%f29,	%f12
	bl	%icc,	loop_2680
	bg,a,pn	%xcc,	loop_2681
	sll	%i1,	%g4,	%g2
	fxors	%f7,	%f10,	%f4
loop_2680:
	tn	%xcc,	0x1
loop_2681:
	sdivcc	%g1,	0x1D25,	%g5
	bneg	%icc,	loop_2682
	tg	%icc,	0x4
	nop
	set	0x48, %l3
	stx	%o3,	[%l7 + %l3]
	tpos	%icc,	0x3
loop_2682:
	fors	%f13,	%f18,	%f7
	fmovsvs	%xcc,	%f29,	%f7
	bne,a	%icc,	loop_2683
	orncc	%l1,	%o2,	%g7
	srax	%i5,	0x13,	%g3
	edge8	%i6,	%l4,	%i2
loop_2683:
	andn	%i4,	%o6,	%o5
	brgez	%l0,	loop_2684
	fmovrslez	%g6,	%f12,	%f4
	bvs	loop_2685
	bg	loop_2686
loop_2684:
	fbue	%fcc3,	loop_2687
	fbuge	%fcc2,	loop_2688
loop_2685:
	movre	%i3,	%o4,	%l5
loop_2686:
	addc	%l2,	0x1D49,	%l3
loop_2687:
	be,a	loop_2689
loop_2688:
	fbule,a	%fcc1,	loop_2690
	udiv	%i0,	0x133C,	%l6
	fmovsvc	%icc,	%f0,	%f27
loop_2689:
	tl	%icc,	0x2
loop_2690:
	fmovsgu	%icc,	%f14,	%f12
	wr	%g0,	0x19,	%asi
	ldsha	[%l7 + 0x14] %asi,	%o0
	fbge,a	%fcc2,	loop_2691
	fsrc1s	%f22,	%f11
	xnor	%i7,	0x0CC5,	%o1
	or	%o7,	%i1,	%g2
loop_2691:
	brgez	%g1,	loop_2692
	fzero	%f26
	bgu,a	loop_2693
	fbue	%fcc1,	loop_2694
loop_2692:
	and	%g5,	%o3,	%g4
	fnot1s	%f29,	%f15
loop_2693:
	movrgz	%o2,	%g7,	%l1
loop_2694:
	sethi	0x190E,	%i5
	fmovdpos	%xcc,	%f12,	%f21
	wr	%g0,	0x2a,	%asi
	stda	%g2,	[%l7 + 0x48] %asi
	membar	#Sync
	sll	%l4,	%i2,	%i6
	xnor	%i4,	%o6,	%l0
	bn	%xcc,	loop_2695
	std	%o4,	[%l7 + 0x70]
	bvs,pn	%xcc,	loop_2696
	stw	%g6,	[%l7 + 0x54]
loop_2695:
	nop
	wr	%g0,	0x11,	%asi
	ldsha	[%l7 + 0x3E] %asi,	%o4
loop_2696:
	nop
	set	0x08, %i4
	std	%f8,	[%l7 + %i4]
	set	0x08, %g6
	prefetcha	[%l7 + %g6] 0x14,	 0x1
	movneg	%xcc,	%i3,	%l3
	popc	0x0F19,	%i0
	membar	0x48
	movrgz	%l6,	%l2,	%o0
	andncc	%i7,	%o7,	%o1
	edge16n	%i1,	%g2,	%g1
	edge16ln	%g5,	%g4,	%o2
	subcc	%o3,	%l1,	%g7
	umulcc	%i5,	0x0DD5,	%l4
	tgu	%icc,	0x6
	tsubcctv	%g3,	%i2,	%i4
	fbule,a	%fcc1,	loop_2697
	fmovrslez	%o6,	%f20,	%f3
	sethi	0x1C9E,	%l0
	movleu	%icc,	%o5,	%i6
loop_2697:
	alignaddr	%o4,	%l5,	%i3
	membar	0x22
	fblg,a	%fcc2,	loop_2698
	edge16ln	%g6,	%l3,	%l6
	fandnot2s	%f28,	%f1,	%f5
	sllx	%l2,	%i0,	%o0
loop_2698:
	movcc	%icc,	%o7,	%o1
	fmovsvs	%icc,	%f26,	%f21
	edge8n	%i7,	%g2,	%g1
	movneg	%icc,	%i1,	%g5
	mova	%xcc,	%o2,	%o3
	brnz,a	%g4,	loop_2699
	fmovdgu	%icc,	%f12,	%f29
	fmuld8ulx16	%f24,	%f23,	%f2
	alignaddrl	%l1,	%g7,	%l4
loop_2699:
	nop
	wr	%g0,	0xe3,	%asi
	ldda	[%l7 + 0x40] %asi,	%g2
	subcc	%i5,	0x0EA9,	%i4
	fors	%f10,	%f13,	%f4
	edge16l	%o6,	%i2,	%o5
	edge8n	%l0,	%o4,	%i6
	pdist	%f2,	%f26,	%f16
	fmovsl	%xcc,	%f18,	%f5
	sth	%l5,	[%l7 + 0x38]
	movne	%icc,	%i3,	%g6
	subcc	%l6,	0x0FBE,	%l2
	fmovdneg	%xcc,	%f4,	%f11
	fors	%f29,	%f26,	%f16
	tpos	%xcc,	0x6
	ldsb	[%l7 + 0x6E],	%l3
	fcmpd	%fcc2,	%f20,	%f20
	fbue,a	%fcc1,	loop_2700
	fandnot1	%f8,	%f24,	%f6
	fcmpgt32	%f24,	%f28,	%i0
	fnegs	%f18,	%f4
loop_2700:
	fmovrsne	%o7,	%f8,	%f9
	fmovsgu	%xcc,	%f30,	%f8
	fsrc2	%f18,	%f2
	srlx	%o0,	%i7,	%o1
	alignaddr	%g2,	%i1,	%g5
	set	0x74, %l2
	swapa	[%l7 + %l2] 0x80,	%g1
	tcc	%xcc,	0x4
	prefetch	[%l7 + 0x34],	 0x3
	fbe,a	%fcc0,	loop_2701
	movn	%xcc,	%o3,	%o2
	orcc	%g4,	0x1B9E,	%l1
	set	0x44, %g5
	ldswa	[%l7 + %g5] 0x18,	%l4
loop_2701:
	movcc	%xcc,	%g3,	%i5
	tleu	%icc,	0x0
	tsubcc	%i4,	0x0171,	%o6
	ldx	[%l7 + 0x40],	%i2
	wr	%g0,	0x80,	%asi
	ldxa	[%l7 + 0x08] %asi,	%o5
	fexpand	%f6,	%f10
	add	%l7,	0x28,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] %asi,	%g7,	%l0
	addc	%o4,	0x1902,	%i6
	fba,a	%fcc2,	loop_2702
	edge32ln	%i3,	%g6,	%l6
	ld	[%l7 + 0x2C],	%f20
	mulscc	%l2,	0x04C8,	%l3
loop_2702:
	array8	%i0,	%l5,	%o7
	tgu	%icc,	0x0
	fmovsge	%icc,	%f15,	%f7
	move	%xcc,	%o0,	%o1
	edge8	%i7,	%g2,	%g5
	bpos	%xcc,	loop_2703
	stbar
	bg,pn	%icc,	loop_2704
	mulscc	%i1,	0x13F9,	%o3
loop_2703:
	tleu	%xcc,	0x6
	bcs	%xcc,	loop_2705
loop_2704:
	fnot2s	%f0,	%f16
	fmovsle	%xcc,	%f10,	%f4
	fmovdg	%xcc,	%f9,	%f20
loop_2705:
	orn	%o2,	0x0C01,	%g1
	ble,a,pt	%icc,	loop_2706
	stbar
	fpadd32	%f8,	%f4,	%f0
	movle	%icc,	%l1,	%g4
loop_2706:
	nop
	set	0x3E, %o4
	ldsha	[%l7 + %o4] 0x04,	%l4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movne	%icc,	%i5,	%i4
	fmovsvc	%icc,	%f22,	%f3
	fmovsle	%xcc,	%f16,	%f29
	set	0x18, %o7
	lda	[%l7 + %o7] 0x19,	%f30
	mova	%icc,	%g3,	%o6
	smul	%i2,	0x09CC,	%o5
	fcmpeq16	%f10,	%f16,	%g7
	sdivx	%o4,	0x0E27,	%i6
	orcc	%i3,	%g6,	%l6
	sll	%l0,	%l3,	%l2
	movneg	%xcc,	%i0,	%o7
	fnegs	%f12,	%f1
	bpos,a	%icc,	loop_2707
	edge8l	%o0,	%o1,	%i7
	bleu	%icc,	loop_2708
	fmovsg	%xcc,	%f3,	%f20
loop_2707:
	srl	%l5,	0x09,	%g5
	array16	%g2,	%i1,	%o2
loop_2708:
	sllx	%g1,	%o3,	%g4
	movn	%xcc,	%l1,	%l4
	bl	%icc,	loop_2709
	fbue,a	%fcc3,	loop_2710
	fmovrsgez	%i5,	%f13,	%f6
	tsubcctv	%i4,	%g3,	%i2
loop_2709:
	fmovsle	%xcc,	%f26,	%f24
loop_2710:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbge,a	%fcc1,	loop_2711
	fbo,a	%fcc1,	loop_2712
	orncc	%o5,	%o6,	%g7
	std	%f6,	[%l7 + 0x40]
loop_2711:
	bleu,a,pn	%xcc,	loop_2713
loop_2712:
	sub	%o4,	0x08EC,	%i6
	std	%f8,	[%l7 + 0x38]
	fpsub32	%f6,	%f0,	%f26
loop_2713:
	nop
	wr	%g0,	0x18,	%asi
	stda	%g6,	[%l7 + 0x50] %asi
	movpos	%xcc,	%i3,	%l6
	sdiv	%l0,	0x0B84,	%l3
	fbge,a	%fcc2,	loop_2714
	fbge,a	%fcc2,	loop_2715
	edge32	%l2,	%i0,	%o0
	edge32l	%o7,	%i7,	%o1
loop_2714:
	fmovrse	%l5,	%f22,	%f22
loop_2715:
	orn	%g2,	0x0CD7,	%g5
	fmuld8ulx16	%f11,	%f27,	%f0
	tl	%xcc,	0x5
	edge32n	%o2,	%i1,	%g1
	tpos	%xcc,	0x2
	movle	%icc,	%o3,	%l1
	fbuge	%fcc0,	loop_2716
	umul	%g4,	%l4,	%i5
	movg	%icc,	%i4,	%i2
	fmovrsne	%o5,	%f4,	%f23
loop_2716:
	tsubcctv	%g3,	%o6,	%g7
	bshuffle	%f16,	%f20,	%f6
	edge16ln	%o4,	%g6,	%i3
	sethi	0x0A55,	%i6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnot1	%f16,	%f14
	fpack32	%f10,	%f16,	%f2
	fand	%f8,	%f30,	%f10
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x54] %asi,	%l6
	fmovsvs	%xcc,	%f23,	%f0
	fmovdle	%icc,	%f10,	%f6
	fmul8x16au	%f7,	%f1,	%f26
	tne	%icc,	0x6
	fmuld8sux16	%f18,	%f20,	%f26
	edge16n	%l0,	%l3,	%l2
	fmovsvc	%icc,	%f16,	%f25
	fzero	%f18
	fmovde	%xcc,	%f4,	%f30
	fnegs	%f1,	%f19
	sll	%i0,	%o7,	%o0
	ta	%xcc,	0x0
	edge8ln	%i7,	%o1,	%g2
	edge16	%l5,	%o2,	%i1
	udivx	%g5,	0x07F6,	%g1
	set	0x14, %g3
	ldsha	[%l7 + %g3] 0x0c,	%l1
	orncc	%o3,	%g4,	%i5
	fmovrdgez	%i4,	%f22,	%f28
	fba,a	%fcc0,	loop_2717
	edge8ln	%i2,	%l4,	%o5
	sdivcc	%g3,	0x127E,	%o6
	array8	%g7,	%g6,	%o4
loop_2717:
	orncc	%i3,	0x1D64,	%i6
	array8	%l0,	%l6,	%l3
	xnor	%i0,	%o7,	%l2
	movrgz	%i7,	%o1,	%o0
	tsubcctv	%g2,	0x186A,	%l5
	fcmpeq32	%f28,	%f30,	%o2
	sllx	%g5,	0x1D,	%g1
	wr	%g0,	0x23,	%asi
	stda	%l0,	[%l7 + 0x78] %asi
	membar	#Sync
	fbue,a	%fcc0,	loop_2718
	edge8ln	%i1,	%o3,	%i5
	tle	%xcc,	0x2
	edge32n	%i4,	%i2,	%l4
loop_2718:
	fornot1s	%f18,	%f25,	%f4
	ldx	[%l7 + 0x78],	%o5
	fornot1s	%f0,	%f5,	%f15
	movcs	%xcc,	%g4,	%o6
	set	0x10, %l4
	ldxa	[%l7 + %l4] 0x14,	%g7
	membar	0x6E
	srlx	%g3,	0x0E,	%g6
	udivcc	%o4,	0x0DC0,	%i6
	edge8ln	%i3,	%l0,	%l3
	sdivcc	%l6,	0x0E64,	%i0
	and	%o7,	0x00F3,	%i7
	move	%xcc,	%l2,	%o1
	andcc	%g2,	0x1BCB,	%l5
	fabss	%f15,	%f16
	fmovdg	%icc,	%f8,	%f20
	ble,a	loop_2719
	fmovsl	%xcc,	%f21,	%f19
	tvs	%xcc,	0x3
	fandnot1	%f2,	%f30,	%f26
loop_2719:
	fpmerge	%f11,	%f5,	%f26
	umulcc	%o0,	%g5,	%o2
	fbge,a	%fcc1,	loop_2720
	movgu	%icc,	%g1,	%l1
	addc	%i1,	0x1913,	%o3
	fxor	%f0,	%f20,	%f22
loop_2720:
	movl	%xcc,	%i5,	%i2
	ldsh	[%l7 + 0x42],	%i4
	brgz,a	%o5,	loop_2721
	xor	%g4,	%o6,	%l4
	fpadd32s	%f31,	%f10,	%f24
	flush	%l7 + 0x30
loop_2721:
	edge32	%g7,	%g3,	%g6
	xnorcc	%o4,	%i3,	%l0
	bcs,a	loop_2722
	andncc	%i6,	%l3,	%l6
	wr	%g0,	0x11,	%asi
	swapa	[%l7 + 0x64] %asi,	%i0
loop_2722:
	fmovscs	%icc,	%f22,	%f8
	fandnot2s	%f28,	%f15,	%f12
	ta	%icc,	0x0
	movrlz	%i7,	%o7,	%o1
	edge8	%g2,	%l2,	%o0
	movrne	%g5,	0x353,	%l5
	edge32	%g1,	%l1,	%o2
	ble,a,pt	%icc,	loop_2723
	fnor	%f2,	%f20,	%f22
	set	0x4A, %g4
	ldsha	[%l7 + %g4] 0x11,	%o3
loop_2723:
	fands	%f6,	%f20,	%f13
	tsubcc	%i5,	0x134F,	%i1
	movrlez	%i4,	0x0E3,	%i2
	edge32l	%o5,	%o6,	%l4
	sethi	0x06F0,	%g7
	fmovdcs	%xcc,	%f31,	%f14
	stx	%g4,	[%l7 + 0x40]
	movrlz	%g6,	0x14F,	%g3
	fmovd	%f12,	%f28
	array8	%i3,	%o4,	%i6
	tleu	%icc,	0x7
	subccc	%l0,	0x0B66,	%l3
	srax	%l6,	0x06,	%i7
	fpadd32s	%f1,	%f1,	%f2
	array32	%o7,	%i0,	%g2
	fmovspos	%xcc,	%f11,	%f28
	stb	%l2,	[%l7 + 0x35]
	fmovspos	%icc,	%f15,	%f4
	sll	%o0,	0x12,	%g5
	fzero	%f12
	nop
	set	0x58, %i1
	lduh	[%l7 + %i1],	%o1
	edge8ln	%l5,	%g1,	%o2
	move	%icc,	%l1,	%i5
	ldsh	[%l7 + 0x16],	%o3
	umulcc	%i4,	0x1F12,	%i1
	fbne,a	%fcc1,	loop_2724
	tcc	%xcc,	0x3
	movvs	%xcc,	%i2,	%o6
	ldx	[%l7 + 0x38],	%o5
loop_2724:
	fmovscc	%icc,	%f18,	%f24
	fmovdne	%xcc,	%f7,	%f5
	fmovdne	%xcc,	%f5,	%f16
	fble,a	%fcc0,	loop_2725
	fnands	%f24,	%f27,	%f23
	wr	%g0,	0xe2,	%asi
	stha	%l4,	[%l7 + 0x08] %asi
	membar	#Sync
loop_2725:
	movge	%xcc,	%g7,	%g4
	srax	%g3,	%i3,	%g6
	umul	%i6,	%l0,	%o4
	movrgz	%l3,	%l6,	%o7
	tvc	%xcc,	0x3
	tcc	%xcc,	0x2
	sub	%i0,	0x1BF2,	%i7
	bpos,a	loop_2726
	orncc	%l2,	%o0,	%g5
	be,a,pn	%xcc,	loop_2727
	fbge	%fcc0,	loop_2728
loop_2726:
	fmovrslz	%g2,	%f28,	%f15
	tle	%xcc,	0x2
loop_2727:
	brgz,a	%o1,	loop_2729
loop_2728:
	fmovrsgez	%g1,	%f29,	%f26
	sub	%l5,	0x02D5,	%l1
	andn	%i5,	%o3,	%o2
loop_2729:
	fbg	%fcc1,	loop_2730
	edge16l	%i1,	%i4,	%o6
	fbuge,a	%fcc3,	loop_2731
	fpsub16s	%f7,	%f24,	%f13
loop_2730:
	fandnot1s	%f5,	%f3,	%f11
	movl	%icc,	%i2,	%l4
loop_2731:
	swap	[%l7 + 0x7C],	%g7
	sethi	0x051C,	%g4
	fmovdleu	%xcc,	%f16,	%f28
	fandnot1	%f10,	%f8,	%f20
	udivcc	%o5,	0x0966,	%g3
	fabsd	%f2,	%f10
	addcc	%i3,	0x005F,	%i6
	fnot2	%f12,	%f20
	bne,a	%icc,	loop_2732
	fmovdneg	%xcc,	%f30,	%f6
	array8	%l0,	%g6,	%o4
	movrgez	%l3,	0x02F,	%o7
loop_2732:
	fbl	%fcc1,	loop_2733
	fmovdg	%icc,	%f21,	%f25
	sth	%l6,	[%l7 + 0x20]
	tsubcc	%i7,	0x0C40,	%i0
loop_2733:
	faligndata	%f30,	%f26,	%f16
	ldsb	[%l7 + 0x35],	%o0
	tle	%xcc,	0x2
	bvs,a,pt	%icc,	loop_2734
	umulcc	%g5,	0x10CE,	%g2
	tgu	%icc,	0x1
	tgu	%icc,	0x5
loop_2734:
	fbul,a	%fcc0,	loop_2735
	tn	%xcc,	0x1
	set	0x18, %i3
	stxa	%o1,	[%l7 + %i3] 0x23
	membar	#Sync
loop_2735:
	sdiv	%g1,	0x0B53,	%l5
	movrlz	%l2,	%l1,	%o3
	add	%l7,	0x40,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%i5
	casxa	[%l6] 0x88,	%i5,	%i1
	edge32n	%i4,	%o6,	%o2
	smul	%l4,	%i2,	%g7
	pdist	%f22,	%f2,	%f20
	edge8l	%o5,	%g4,	%g3
	fcmpne32	%f6,	%f4,	%i3
	fmovdcc	%icc,	%f10,	%f16
	mulx	%i6,	%g6,	%l0
	fmovdcs	%xcc,	%f10,	%f0
	nop
	setx	loop_2736,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	edge8	%l3,	%o7,	%o4
	edge8ln	%i7,	%i0,	%o0
	fandnot1	%f18,	%f24,	%f20
loop_2736:
	fmovdgu	%xcc,	%f24,	%f15
	ba	%xcc,	loop_2737
	movne	%xcc,	%l6,	%g2
	fxnor	%f16,	%f28,	%f24
	udiv	%o1,	0x1A9A,	%g5
loop_2737:
	brz,a	%l5,	loop_2738
	movrgez	%l2,	%l1,	%o3
	ld	[%l7 + 0x18],	%f6
	sra	%g1,	%i1,	%i4
loop_2738:
	fmul8x16au	%f28,	%f31,	%f6
	fpadd16s	%f26,	%f9,	%f22
	array8	%o6,	%o2,	%l4
	edge16	%i2,	%i5,	%g7
	fandnot2	%f0,	%f12,	%f26
	andcc	%o5,	0x1E35,	%g3
	movrlz	%g4,	%i6,	%i3
	movrgz	%l0,	%l3,	%g6
	fbg	%fcc0,	loop_2739
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fand	%f12,	%f24,	%f2
	edge8ln	%o7,	%o4,	%i7
loop_2739:
	udivx	%o0,	0x07F5,	%i0
	fblg,a	%fcc1,	loop_2740
	subc	%l6,	0x0246,	%g2
	smulcc	%o1,	%g5,	%l5
	set	0x40, %l5
	stda	%f0,	[%l7 + %l5] 0x04
loop_2740:
	fmovde	%icc,	%f9,	%f21
	bvs,pn	%xcc,	loop_2741
	sethi	0x15C5,	%l2
	movrlz	%o3,	0x101,	%l1
	wr	%g0,	0x88,	%asi
	ldswa	[%l7 + 0x20] %asi,	%g1
loop_2741:
	stbar
	movre	%i1,	0x39D,	%o6
	fcmpeq16	%f26,	%f24,	%i4
	wr	%g0,	0x27,	%asi
	stba	%o2,	[%l7 + 0x0F] %asi
	membar	#Sync
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bvs,a	%xcc,	loop_2742
	orn	%i2,	%i5,	%g7
	fbue,a	%fcc2,	loop_2743
	edge16l	%l4,	%o5,	%g4
loop_2742:
	fcmple32	%f4,	%f26,	%g3
	andn	%i6,	%l0,	%l3
loop_2743:
	movrgz	%g6,	%o7,	%o4
	stbar
	srax	%i3,	0x0E,	%i7
	tsubcc	%o0,	0x0931,	%i0
	fands	%f14,	%f21,	%f19
	udivcc	%g2,	0x1B44,	%l6
	std	%f10,	[%l7 + 0x60]
	wr	%g0,	0x89,	%asi
	ldxa	[%l7 + 0x08] %asi,	%g5
	te	%xcc,	0x3
	stbar
	fbn	%fcc1,	loop_2744
	orn	%o1,	%l2,	%l5
	fandnot2s	%f1,	%f31,	%f14
	fpackfix	%f18,	%f8
loop_2744:
	fbuge	%fcc1,	loop_2745
	fbuge,a	%fcc2,	loop_2746
	subc	%l1,	0x0449,	%o3
	brgez	%g1,	loop_2747
loop_2745:
	fcmple16	%f30,	%f24,	%o6
loop_2746:
	bvs,a,pt	%xcc,	loop_2748
	fxor	%f0,	%f24,	%f26
loop_2747:
	fbue,a	%fcc3,	loop_2749
	ble,pt	%xcc,	loop_2750
loop_2748:
	addc	%i4,	%i1,	%o2
	movrlz	%i2,	0x3B5,	%g7
loop_2749:
	nop
	set	0x40, %g1
	lduwa	[%l7 + %g1] 0x14,	%i5
loop_2750:
	nop
	setx loop_2751, %l0, %l1
	jmpl %l1, %o5
	sir	0x0BA8
	udivcc	%g4,	0x137F,	%l4
	fmovsgu	%icc,	%f15,	%f24
loop_2751:
	nop
	membar	#Sync
	set	0x40, %o1
	ldda	[%l7 + %o1] 0x16,	%f16
	fornot1s	%f20,	%f17,	%f6
	orcc	%i6,	%l0,	%g3
	sdivcc	%l3,	0x1F55,	%g6
	srlx	%o7,	%i3,	%i7
	umulcc	%o0,	%i0,	%g2
	srax	%o4,	%l6,	%o1
	subc	%l2,	%g5,	%l1
	udivx	%l5,	0x1243,	%g1
	siam	0x7
	addc	%o6,	%i4,	%i1
	and	%o3,	0x0C23,	%i2
	fxnors	%f27,	%f6,	%f9
	fors	%f24,	%f0,	%f29
	tvc	%xcc,	0x0
	tg	%icc,	0x6
	subccc	%g7,	0x1E51,	%i5
	tvs	%icc,	0x0
	tsubcc	%o2,	0x1BB2,	%o5
	orn	%l4,	0x0ACF,	%g4
	fmovd	%f12,	%f20
	sdivx	%i6,	0x0C6F,	%l0
	mulscc	%l3,	%g6,	%g3
	movrgz	%o7,	0x06C,	%i3
	bgu,pt	%xcc,	loop_2752
	xnor	%i7,	%o0,	%g2
	fmovrdlez	%i0,	%f22,	%f18
	fcmpeq32	%f6,	%f24,	%o4
loop_2752:
	tvc	%xcc,	0x1
	fbo	%fcc0,	loop_2753
	fmovd	%f4,	%f18
	fcmpes	%fcc2,	%f25,	%f14
	movrgez	%l6,	%o1,	%l2
loop_2753:
	tpos	%xcc,	0x6
	mulx	%g5,	0x03BF,	%l1
	sra	%g1,	%o6,	%i4
	addc	%i1,	0x1449,	%o3
	fmovde	%icc,	%f18,	%f3
	fbg,a	%fcc1,	loop_2754
	tn	%xcc,	0x5
	andn	%i2,	%g7,	%i5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2754:
	mova	%xcc,	%o2,	%l5
	umul	%o5,	%l4,	%i6
	be	%xcc,	loop_2755
	subc	%l0,	%l3,	%g4
	sdivx	%g6,	0x079F,	%g3
	bvs,a	loop_2756
loop_2755:
	ta	%icc,	0x6
	fbul,a	%fcc1,	loop_2757
	fmovsne	%xcc,	%f16,	%f28
loop_2756:
	edge8ln	%i3,	%o7,	%o0
	sdivx	%g2,	0x044E,	%i0
loop_2757:
	tsubcc	%o4,	0x07C6,	%i7
	or	%o1,	%l6,	%g5
	smulcc	%l1,	%g1,	%l2
	udiv	%i4,	0x17A3,	%i1
	addc	%o3,	0x1C0B,	%o6
	addc	%g7,	%i2,	%o2
	sdiv	%i5,	0x12C3,	%o5
	fmovrdgz	%l4,	%f8,	%f2
	fandnot1s	%f19,	%f24,	%f3
	edge8	%i6,	%l0,	%l5
	fbg	%fcc3,	loop_2758
	srl	%l3,	0x1D,	%g4
	fmovrdlz	%g3,	%f28,	%f0
	edge8n	%i3,	%o7,	%g6
loop_2758:
	movgu	%icc,	%o0,	%i0
	movrgez	%g2,	%o4,	%i7
	fmovrdgz	%l6,	%f22,	%f0
	edge16	%o1,	%g5,	%g1
	fxors	%f31,	%f25,	%f30
	udiv	%l2,	0x023C,	%i4
	edge32ln	%l1,	%i1,	%o3
	fors	%f27,	%f21,	%f22
	te	%xcc,	0x6
	movg	%icc,	%o6,	%g7
	ldstub	[%l7 + 0x75],	%o2
	fmovrdlz	%i2,	%f16,	%f10
	fbule	%fcc0,	loop_2759
	array8	%o5,	%l4,	%i5
	fsrc2	%f0,	%f26
	bcs	loop_2760
loop_2759:
	smul	%l0,	%i6,	%l3
	andncc	%g4,	%g3,	%i3
	movge	%xcc,	%l5,	%o7
loop_2760:
	fmovrdlz	%g6,	%f18,	%f26
	sethi	0x07B8,	%o0
	subcc	%g2,	0x078D,	%o4
	sdivx	%i0,	0x07D2,	%i7
	fmovrdne	%o1,	%f0,	%f0
	ble	%icc,	loop_2761
	fsrc2	%f6,	%f8
	set	0x40, %i0
	ldda	[%l7 + %i0] 0x04,	%g4
loop_2761:
	smulcc	%g1,	%l2,	%l6
	membar	#Sync
	set	0x40, %l6
	ldda	[%l7 + %l6] 0xf8,	%f16
	sdivcc	%l1,	0x1E1E,	%i1
	fmovsleu	%xcc,	%f30,	%f6
	tneg	%xcc,	0x4
	fbuge,a	%fcc1,	loop_2762
	mulscc	%o3,	%i4,	%o6
	edge16ln	%g7,	%i2,	%o2
	andcc	%o5,	0x1AC8,	%i5
loop_2762:
	fmovrdlz	%l4,	%f22,	%f16
	fnors	%f16,	%f22,	%f4
	orn	%i6,	0x153E,	%l3
	fornot1	%f6,	%f14,	%f20
	fmovrdgz	%g4,	%f18,	%f20
	subc	%g3,	0x1886,	%i3
	tvc	%icc,	0x7
	tvs	%icc,	0x5
	srl	%l5,	0x19,	%l0
	set	0x56, %i6
	ldsba	[%l7 + %i6] 0x18,	%g6
	set	0x48, %l1
	ldswa	[%l7 + %l1] 0x14,	%o7
	fmul8sux16	%f22,	%f30,	%f30
	movrne	%g2,	%o4,	%o0
	fbul	%fcc2,	loop_2763
	add	%i7,	%i0,	%o1
	tl	%xcc,	0x4
	movre	%g5,	0x1FF,	%g1
loop_2763:
	movrgez	%l6,	%l2,	%i1
	membar	#Sync
	set	0x40, %i2
	ldda	[%l7 + %i2] 0xf0,	%f0
	fmuld8sux16	%f15,	%f11,	%f24
	fsrc1s	%f25,	%f1
	fmovspos	%icc,	%f14,	%f29
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movleu	%icc,	%o3,	%i4
	fornot1s	%f22,	%f25,	%f23
	tcc	%icc,	0x1
	sir	0x01A1
	fabss	%f7,	%f21
	sir	0x0B37
	fmovrsgez	%o6,	%f21,	%f8
	tsubcc	%l1,	%g7,	%i2
	fbne,a	%fcc1,	loop_2764
	movcs	%xcc,	%o2,	%i5
	fnot1	%f26,	%f0
	wr	%g0,	0x89,	%asi
	stda	%o4,	[%l7 + 0x40] %asi
loop_2764:
	fmul8sux16	%f6,	%f12,	%f0
	set	0x50, %g2
	ldda	[%l7 + %g2] 0x14,	%i6
	bgu,a	%xcc,	loop_2765
	movgu	%icc,	%l3,	%l4
	srax	%g3,	0x04,	%g4
	fbule	%fcc3,	loop_2766
loop_2765:
	alignaddrl	%l5,	%l0,	%i3
	tle	%xcc,	0x1
	fbu,a	%fcc0,	loop_2767
loop_2766:
	tg	%icc,	0x0
	bg	loop_2768
	fble	%fcc3,	loop_2769
loop_2767:
	fmovdgu	%xcc,	%f13,	%f23
	mova	%icc,	%o7,	%g2
loop_2768:
	mulscc	%o4,	0x087E,	%g6
loop_2769:
	nop
	wr	%g0,	0x18,	%asi
	ldda	[%l7 + 0x30] %asi,	%o0
	udivcc	%i7,	0x1061,	%o1
	srlx	%g5,	0x04,	%i0
	sdivcc	%l6,	0x03A6,	%l2
	sllx	%g1,	0x16,	%i1
	fmovdcc	%xcc,	%f8,	%f2
	fpack16	%f20,	%f24
	orn	%i4,	%o6,	%o3
	movre	%l1,	0x251,	%i2
	movge	%xcc,	%o2,	%i5
	udivx	%g7,	0x0D53,	%i6
	fcmpgt16	%f12,	%f24,	%o5
	movle	%xcc,	%l4,	%g3
	set	0x38, %o3
	ldswa	[%l7 + %o3] 0x88,	%g4
	call	loop_2770
	add	%l5,	0x167D,	%l3
	fmul8x16al	%f14,	%f10,	%f16
	fsrc2s	%f3,	%f25
loop_2770:
	movneg	%icc,	%l0,	%o7
	smul	%g2,	%o4,	%g6
	membar	0x5B
	movrgz	%i3,	0x0BE,	%i7
	ta	%icc,	0x1
	or	%o0,	%o1,	%i0
	nop
	set	0x30, %i5
	ldd	[%l7 + %i5],	%f24
	move	%xcc,	%l6,	%l2
	edge32ln	%g5,	%i1,	%g1
	fmovsvc	%icc,	%f19,	%f24
	orcc	%o6,	%i4,	%o3
	tg	%xcc,	0x6
	umulcc	%l1,	%i2,	%o2
	andn	%g7,	%i6,	%i5
	or	%l4,	0x19D8,	%o5
	udiv	%g3,	0x12FE,	%l5
	fpack32	%f14,	%f20,	%f8
	fandnot2	%f24,	%f18,	%f30
	srlx	%g4,	0x1C,	%l0
	fpadd16s	%f4,	%f2,	%f17
	movrgez	%l3,	0x297,	%o7
	tcc	%icc,	0x5
	fmovdvs	%xcc,	%f4,	%f24
	fcmpne32	%f24,	%f12,	%o4
	fcmpgt32	%f28,	%f4,	%g6
	brgez	%i3,	loop_2771
	orn	%i7,	0x07DB,	%o0
	sllx	%g2,	0x05,	%i0
	umulcc	%l6,	0x0436,	%o1
loop_2771:
	andcc	%l2,	%i1,	%g1
	wr	%g0,	0x88,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	popc	%o6,	%g5
	tl	%xcc,	0x4
	umul	%o3,	%l1,	%i2
	sethi	0x0420,	%i4
	tsubcc	%o2,	%i6,	%g7
	fnot1	%f8,	%f20
	movvc	%xcc,	%i5,	%o5
	array32	%g3,	%l4,	%l5
	bg,pn	%icc,	loop_2772
	smul	%l0,	0x1300,	%l3
	tsubcc	%g4,	%o7,	%g6
	tvc	%icc,	0x6
loop_2772:
	subcc	%o4,	0x1BA2,	%i3
	fmovsle	%xcc,	%f21,	%f22
	bge	%xcc,	loop_2773
	brnz	%o0,	loop_2774
	sethi	0x14BE,	%g2
	bgu,a	%icc,	loop_2775
loop_2773:
	call	loop_2776
loop_2774:
	sethi	0x0046,	%i7
	movg	%icc,	%l6,	%o1
loop_2775:
	fmovrse	%l2,	%f1,	%f21
loop_2776:
	ta	%xcc,	0x6
	ba,pn	%icc,	loop_2777
	movre	%i1,	%i0,	%g1
	fmul8ulx16	%f0,	%f4,	%f0
	orn	%o6,	0x19B0,	%g5
loop_2777:
	movre	%o3,	%i2,	%l1
	fzeros	%f25
	fxors	%f24,	%f26,	%f18
	fmovsn	%icc,	%f30,	%f9
	lduw	[%l7 + 0x10],	%i4
	fmovdgu	%xcc,	%f8,	%f25
	srl	%i6,	0x1C,	%o2
	sdivx	%i5,	0x0456,	%o5
	addc	%g3,	%l4,	%l5
	array32	%l0,	%l3,	%g7
	set	0x110, %o2
	stxa	%g4,	[%g0 + %o2] 0x21
	tvc	%xcc,	0x5
	wr	%g0,	0x23,	%asi
	ldda	[%l7 + 0x10] %asi,	%o6
	umulcc	%o4,	0x0CAA,	%i3
	lduw	[%l7 + 0x6C],	%g6
	xor	%o0,	%g2,	%i7
	fcmple32	%f16,	%f10,	%o1
	edge16n	%l6,	%i1,	%i0
	lduw	[%l7 + 0x14],	%l2
	fmovsn	%xcc,	%f24,	%f24
	edge16ln	%o6,	%g5,	%g1
	umul	%i2,	0x01D0,	%l1
	movcc	%icc,	%o3,	%i6
	movvs	%xcc,	%i4,	%i5
	srlx	%o5,	0x0C,	%o2
	movcc	%icc,	%g3,	%l5
	or	%l0,	%l3,	%g7
	xorcc	%l4,	%o7,	%g4
	tleu	%xcc,	0x7
	movcc	%xcc,	%i3,	%o4
	fornot1s	%f26,	%f19,	%f28
	movrne	%o0,	%g2,	%i7
	fcmpgt32	%f10,	%f8,	%g6
	move	%xcc,	%o1,	%i1
	stbar
	ldd	[%l7 + 0x10],	%f20
	fblg,a	%fcc3,	loop_2778
	bneg,pn	%icc,	loop_2779
	fmovrsne	%l6,	%f7,	%f7
	movle	%icc,	%l2,	%i0
loop_2778:
	move	%icc,	%o6,	%g1
loop_2779:
	xnor	%g5,	0x1EBE,	%i2
	st	%f5,	[%l7 + 0x40]
	edge16n	%o3,	%i6,	%i4
	srax	%l1,	0x13,	%i5
	brz,a	%o5,	loop_2780
	movvs	%icc,	%g3,	%o2
	and	%l5,	%l0,	%l3
	tne	%icc,	0x0
loop_2780:
	movrgez	%g7,	%l4,	%g4
	brnz	%i3,	loop_2781
	bneg,a	%icc,	loop_2782
	edge16l	%o4,	%o0,	%g2
	bgu,a,pt	%xcc,	loop_2783
loop_2781:
	movrgz	%i7,	0x315,	%g6
loop_2782:
	bge,a	loop_2784
	edge8ln	%o1,	%i1,	%o7
loop_2783:
	nop
	wr	%g0,	0x10,	%asi
	ldsba	[%l7 + 0x6E] %asi,	%l6
loop_2784:
	add	%l2,	%o6,	%g1
	ta	%xcc,	0x2
	fandnot2s	%f22,	%f12,	%f4
	fbge,a	%fcc0,	loop_2785
	udivx	%i0,	0x094D,	%g5
	movg	%xcc,	%i2,	%o3
	tvs	%icc,	0x0
loop_2785:
	fnot2s	%f5,	%f9
	edge32l	%i4,	%i6,	%l1
	wr	%g0,	0x22,	%asi
	stba	%i5,	[%l7 + 0x3D] %asi
	membar	#Sync
	andncc	%o5,	%o2,	%l5
	fmovdne	%icc,	%f30,	%f25
	bshuffle	%f16,	%f20,	%f28
	subc	%l0,	0x11CD,	%g3
	orcc	%g7,	0x07D6,	%l4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdle	%icc,	%f2,	%f27
	movrlez	%g4,	0x1FA,	%l3
	and	%i3,	%o0,	%g2
	bvs,a,pn	%icc,	loop_2786
	brlez,a	%i7,	loop_2787
	edge8n	%o4,	%g6,	%i1
	fbug,a	%fcc3,	loop_2788
loop_2786:
	edge32n	%o1,	%l6,	%l2
loop_2787:
	srax	%o6,	0x0D,	%g1
	edge16	%o7,	%i0,	%g5
loop_2788:
	prefetch	[%l7 + 0x74],	 0x0
	ldd	[%l7 + 0x38],	%f18
	fnot2s	%f9,	%f27
	fmovdgu	%icc,	%f12,	%f5
	fbuge,a	%fcc0,	loop_2789
	brgez,a	%o3,	loop_2790
	edge16ln	%i4,	%i2,	%i6
	set	0x60, %l0
	ldda	[%l7 + %l0] 0xea,	%i4
loop_2789:
	movvc	%icc,	%l1,	%o5
loop_2790:
	tvs	%icc,	0x0
	fmovdcs	%icc,	%f23,	%f22
	bn,a,pt	%icc,	loop_2791
	ba	loop_2792
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movn	%xcc,	%o2,	%l0
loop_2791:
	umulcc	%g3,	%g7,	%l5
loop_2792:
	movl	%icc,	%l4,	%g4
	movge	%xcc,	%l3,	%i3
	movrne	%o0,	0x322,	%i7
	bl,pt	%xcc,	loop_2793
	andcc	%o4,	0x0376,	%g6
	std	%g2,	[%l7 + 0x40]
	fnands	%f17,	%f19,	%f15
loop_2793:
	faligndata	%f16,	%f10,	%f30
	bgu,a,pt	%icc,	loop_2794
	tg	%icc,	0x5
	sdivx	%i1,	0x13E1,	%l6
	sir	0x1612
loop_2794:
	movge	%icc,	%l2,	%o6
	edge16l	%g1,	%o1,	%i0
	ldsb	[%l7 + 0x52],	%g5
	subc	%o7,	%o3,	%i4
	wr	%g0,	0x10,	%asi
	swapa	[%l7 + 0x08] %asi,	%i6
	fnors	%f17,	%f18,	%f1
	membar	0x61
	movrlz	%i5,	%i2,	%o5
	sra	%o2,	%l0,	%l1
	fcmpne16	%f6,	%f10,	%g3
	mulscc	%g7,	0x0340,	%l5
	sll	%g4,	0x0C,	%l4
	and	%i3,	%o0,	%l3
	sdivx	%o4,	0x0EBE,	%i7
	set	0x70, %i7
	lduwa	[%l7 + %i7] 0x19,	%g2
	brnz	%g6,	loop_2795
	tleu	%xcc,	0x1
	fpadd32s	%f27,	%f23,	%f20
	edge16	%i1,	%l2,	%o6
loop_2795:
	nop
	set	0x34, %o6
	sta	%f0,	[%l7 + %o6] 0x04
	set	0x48, %o0
	ldsha	[%l7 + %o0] 0x88,	%l6
	fmovrslez	%o1,	%f23,	%f3
	sllx	%i0,	%g5,	%o7
	fcmpgt16	%f0,	%f26,	%g1
	add	%l7,	0x44,	%l6
	wr	%g0,	0x19,	%asi
	casa	[%l6] %asi,	%i4,	%o3
	edge8	%i5,	%i6,	%i2
	flush	%l7 + 0x28
	fbule	%fcc2,	loop_2796
	sdiv	%o2,	0x1B85,	%o5
	edge16n	%l1,	%g3,	%g7
	subccc	%l0,	%l5,	%l4
loop_2796:
	movge	%xcc,	%i3,	%o0
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
	taddcctv	%l3,	0x1EE0,	%o4
	movvc	%xcc,	%g4,	%g2
	edge16l	%g6,	%i1,	%l2
loop_2797:
	brlez	%i7,	loop_2798
	add	%o6,	%o1,	%l6
	array32	%g5,	%o7,	%g1
	movrgz	%i4,	0x06D,	%o3
loop_2798:
	fbuge	%fcc2,	loop_2799
	addcc	%i5,	0x0BC1,	%i6
	movre	%i0,	0x3A2,	%o2
	sdivx	%i2,	0x0943,	%l1
loop_2799:
	stb	%g3,	[%l7 + 0x79]
	ldsw	[%l7 + 0x60],	%o5
	movrne	%l0,	0x1E5,	%g7
	addc	%l4,	0x02DD,	%i3
	fands	%f18,	%f27,	%f10
	movpos	%xcc,	%l5,	%o0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fand	%f26,	%f16,	%f20
	brgz,a	%l3,	loop_2800
	fmul8ulx16	%f12,	%f2,	%f18
	bl,pt	%xcc,	loop_2801
	tvs	%icc,	0x7
loop_2800:
	edge32l	%o4,	%g2,	%g4
	movneg	%icc,	%i1,	%l2
loop_2801:
	movcs	%icc,	%g6,	%o6
	brlz,a	%o1,	loop_2802
	ba	%xcc,	loop_2803
	fmovrslez	%l6,	%f29,	%f6
	add	%i7,	0x099C,	%o7
loop_2802:
	fbl,a	%fcc0,	loop_2804
loop_2803:
	fmovsn	%xcc,	%f25,	%f27
	fbe,a	%fcc2,	loop_2805
	array32	%g5,	%i4,	%g1
loop_2804:
	fzero	%f8
	sdiv	%i5,	0x10E4,	%i6
loop_2805:
	andncc	%i0,	%o3,	%i2
	tl	%xcc,	0x5
	wr	%g0,	0xe3,	%asi
	ldda	[%l7 + 0x60] %asi,	%o2
	bge,a	%icc,	loop_2806
	fblg,a	%fcc2,	loop_2807
	tgu	%icc,	0x7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2806:
	nop
	wr	%g0,	0x80,	%asi
	sta	%f21,	[%l7 + 0x54] %asi
loop_2807:
	tg	%icc,	0x2
	tvc	%icc,	0x7
	add	%l7,	0x2C,	%l6
	wr	%g0,	0x04,	%asi
	casa	[%l6] 0x04,	%l1,	%g3
	movcs	%xcc,	%o5,	%g7
	bcs	%xcc,	loop_2808
	fpsub16	%f4,	%f18,	%f24
	andn	%l4,	%i3,	%l0
	srax	%o0,	0x0F,	%l3
loop_2808:
	fcmpeq32	%f18,	%f0,	%l5
	andcc	%g2,	%o4,	%i1
	fbo	%fcc2,	loop_2809
	xor	%g4,	0x106B,	%g6
	srax	%l2,	0x04,	%o1
	udivx	%o6,	0x048C,	%i7
loop_2809:
	nop
	set	0x68, %o5
	stxa	%l6,	[%l7 + %o5] 0x14
	edge8ln	%g5,	%i4,	%g1
	or	%o7,	0x1E92,	%i5
	set	0x50, %l3
	sta	%f19,	[%l7 + %l3] 0x14
	andcc	%i0,	%o3,	%i6
	fbue	%fcc1,	loop_2810
	fmul8x16al	%f27,	%f17,	%f28
	orncc	%i2,	%o2,	%g3
	fbuge,a	%fcc3,	loop_2811
loop_2810:
	for	%f2,	%f0,	%f20
	fpsub16s	%f20,	%f29,	%f18
	orcc	%l1,	0x0C41,	%o5
loop_2811:
	xnor	%g7,	%i3,	%l4
	fbg,a	%fcc0,	loop_2812
	andcc	%o0,	%l0,	%l5
	bg,pn	%xcc,	loop_2813
	or	%l3,	0x10BA,	%o4
loop_2812:
	taddcc	%i1,	0x04A2,	%g2
	subcc	%g6,	0x12D1,	%l2
loop_2813:
	swap	[%l7 + 0x0C],	%g4
	stw	%o1,	[%l7 + 0x68]
	fmovsl	%xcc,	%f31,	%f9
	membar	0x29
	movvc	%xcc,	%o6,	%i7
	ldsh	[%l7 + 0x24],	%l6
	edge16l	%g5,	%i4,	%o7
	xnorcc	%g1,	0x0F2D,	%i0
	fmuld8sux16	%f4,	%f16,	%f28
	membar	0x21
	udiv	%o3,	0x1B0E,	%i5
	fnor	%f10,	%f20,	%f8
	andcc	%i2,	%o2,	%g3
	alignaddrl	%i6,	%l1,	%g7
	ldx	[%l7 + 0x10],	%o5
	alignaddr	%l4,	%i3,	%o0
	subcc	%l0,	%l3,	%l5
	array8	%i1,	%o4,	%g6
	bcs,a,pn	%xcc,	loop_2814
	fmovsvc	%icc,	%f21,	%f14
	set	0x5C, %g7
	ldswa	[%l7 + %g7] 0x80,	%l2
loop_2814:
	tpos	%icc,	0x3
	sth	%g2,	[%l7 + 0x16]
	alignaddr	%o1,	%o6,	%i7
	stb	%g4,	[%l7 + 0x14]
	fbuge	%fcc0,	loop_2815
	sra	%l6,	0x12,	%i4
	fexpand	%f12,	%f30
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2815:
	udivx	%o7,	0x0A5A,	%g1
	movle	%icc,	%g5,	%o3
	fzero	%f0
	bvs,pn	%xcc,	loop_2816
	udiv	%i0,	0x0802,	%i5
	bcc	loop_2817
	mova	%icc,	%i2,	%o2
loop_2816:
	movrgz	%g3,	0x2C5,	%l1
	movcc	%xcc,	%i6,	%o5
loop_2817:
	edge16n	%g7,	%i3,	%l4
	fmovsgu	%xcc,	%f27,	%f23
	set	0x74, %g6
	ldswa	[%l7 + %g6] 0x81,	%o0
	movrne	%l0,	%l3,	%i1
	fnand	%f4,	%f30,	%f26
	fmovda	%icc,	%f29,	%f3
	movn	%xcc,	%l5,	%o4
	movneg	%icc,	%l2,	%g2
	bne,a,pt	%icc,	loop_2818
	fors	%f30,	%f27,	%f6
	te	%icc,	0x7
	movl	%xcc,	%g6,	%o1
loop_2818:
	tsubcctv	%o6,	0x0D9E,	%i7
	and	%l6,	0x1A85,	%i4
	movg	%xcc,	%g4,	%g1
	fbue	%fcc1,	loop_2819
	edge32n	%o7,	%o3,	%g5
	udivcc	%i5,	0x0C96,	%i0
	srax	%i2,	%o2,	%g3
loop_2819:
	fmovrslz	%i6,	%f9,	%f14
	tvc	%xcc,	0x4
	sir	0x1A79
	addcc	%o5,	%l1,	%g7
	sllx	%l4,	%o0,	%l0
	sdiv	%l3,	0x0213,	%i1
	fornot2s	%f24,	%f30,	%f23
	edge32n	%i3,	%o4,	%l5
	fbge,a	%fcc2,	loop_2820
	fbug	%fcc0,	loop_2821
	fpsub16	%f12,	%f8,	%f30
	fba,a	%fcc3,	loop_2822
loop_2820:
	bneg,pn	%xcc,	loop_2823
loop_2821:
	movn	%icc,	%g2,	%g6
	fcmps	%fcc3,	%f16,	%f9
loop_2822:
	bn,a,pt	%icc,	loop_2824
loop_2823:
	edge16n	%o1,	%o6,	%i7
	fmul8ulx16	%f30,	%f22,	%f8
	andn	%l6,	%l2,	%i4
loop_2824:
	alignaddrl	%g1,	%g4,	%o7
	xnorcc	%o3,	%g5,	%i5
	st	%f29,	[%l7 + 0x54]
	fpackfix	%f18,	%f25
	fxors	%f7,	%f25,	%f25
	tne	%icc,	0x6
	udiv	%i0,	0x1DDF,	%i2
	mulscc	%o2,	0x10B4,	%g3
	tgu	%icc,	0x7
	sethi	0x15EC,	%i6
	tneg	%xcc,	0x4
	edge8l	%o5,	%l1,	%g7
	fornot2	%f24,	%f6,	%f10
	wr	%g0,	0x80,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	fbug	%fcc1,	loop_2825
	fpsub32	%f8,	%f0,	%f30
	sll	%l4,	0x1A,	%o0
	fpsub32	%f30,	%f28,	%f6
loop_2825:
	movvs	%xcc,	%l3,	%l0
	fzeros	%f15
	movcc	%xcc,	%i1,	%i3
	set	0x40, %l2
	stda	%f0,	[%l7 + %l2] 0x1f
	membar	#Sync
	fxors	%f14,	%f17,	%f14
	addc	%l5,	%o4,	%g6
	wr	%g0,	0x89,	%asi
	ldsha	[%l7 + 0x5A] %asi,	%o1
	st	%f17,	[%l7 + 0x7C]
	array8	%o6,	%g2,	%i7
	smul	%l2,	%l6,	%g1
	movle	%xcc,	%i4,	%o7
	fmovrsgz	%g4,	%f17,	%f24
	movrlz	%o3,	0x297,	%g5
	movne	%icc,	%i0,	%i5
	edge32	%i2,	%o2,	%i6
	swap	[%l7 + 0x10],	%o5
	orcc	%g3,	0x0766,	%l1
	orcc	%l4,	0x0877,	%g7
	edge8l	%o0,	%l3,	%l0
	te	%xcc,	0x5
	fmul8x16	%f7,	%f2,	%f10
	tge	%icc,	0x5
	add	%l7,	0x40,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%i1
	casxa	[%l6] 0x81,	%i1,	%l5
	lduw	[%l7 + 0x08],	%i3
	fones	%f12
	array8	%o4,	%o1,	%g6
	fcmped	%fcc2,	%f22,	%f10
	fandnot2	%f12,	%f2,	%f6
	orcc	%g2,	%i7,	%l2
	and	%l6,	0x187D,	%o6
	movre	%i4,	0x00C,	%g1
	wr	%g0,	0x88,	%asi
	stba	%o7,	[%l7 + 0x5E] %asi
	fxors	%f9,	%f17,	%f18
	fmovsle	%xcc,	%f21,	%f18
	umul	%o3,	%g5,	%g4
	andncc	%i0,	%i2,	%o2
	fmovdge	%icc,	%f19,	%f19
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tcs	%icc,	0x6
	fcmpeq16	%f6,	%f4,	%i6
	fmovrdne	%o5,	%f20,	%f16
	fmovscs	%icc,	%f15,	%f5
	fbne	%fcc2,	loop_2826
	fbl,a	%fcc0,	loop_2827
	fmovdg	%xcc,	%f10,	%f10
	andn	%i5,	0x0311,	%l1
loop_2826:
	movvc	%icc,	%l4,	%g3
loop_2827:
	addc	%o0,	0x0DA4,	%g7
	array8	%l0,	%i1,	%l5
	tne	%xcc,	0x3
	tvs	%icc,	0x1
	tsubcc	%i3,	%l3,	%o1
	movvc	%xcc,	%o4,	%g6
	ld	[%l7 + 0x18],	%f26
	stw	%g2,	[%l7 + 0x40]
	fandnot1s	%f3,	%f28,	%f6
	subcc	%i7,	0x1FD5,	%l2
	fmovrde	%l6,	%f10,	%f24
	ldd	[%l7 + 0x28],	%f26
	set	0x58, %g5
	prefetcha	[%l7 + %g5] 0x14,	 0x2
	bge,a	%xcc,	loop_2828
	xorcc	%i4,	0x1B73,	%g1
	ldx	[%l7 + 0x30],	%o7
	sdivx	%o3,	0x1365,	%g5
loop_2828:
	movpos	%icc,	%g4,	%i0
	tvc	%xcc,	0x3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
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
	smul	%o2,	0x1826,	%i2
	edge32l	%i6,	%i5,	%l1
	bneg	loop_2830
loop_2829:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mulx	%l4,	%o5,	%g3
	tpos	%icc,	0x6
loop_2830:
	taddcctv	%g7,	%o0,	%l0
	sdivx	%l5,	0x0A30,	%i1
	for	%f2,	%f22,	%f2
	brgez,a	%l3,	loop_2831
	addcc	%i3,	%o4,	%g6
	movrgez	%o1,	%i7,	%l2
	sub	%l6,	0x0E3A,	%g2
loop_2831:
	tneg	%xcc,	0x0
	fmovdn	%icc,	%f30,	%f14
	edge16ln	%o6,	%g1,	%o7
	taddcc	%o3,	0x0ABB,	%g5
	set	0x32, %o4
	lduha	[%l7 + %o4] 0x15,	%g4
	tle	%icc,	0x2
	movpos	%icc,	%i4,	%o2
	swap	[%l7 + 0x58],	%i2
	and	%i6,	%i0,	%i5
	bge,a,pt	%icc,	loop_2832
	bg,pt	%icc,	loop_2833
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnorcc	%l4,	0x0D14,	%o5
loop_2832:
	fabss	%f2,	%f16
loop_2833:
	tvc	%icc,	0x2
	movneg	%xcc,	%l1,	%g7
	tcc	%xcc,	0x3
	bcc,pt	%xcc,	loop_2834
	edge16ln	%o0,	%l0,	%l5
	move	%icc,	%g3,	%i1
	swap	[%l7 + 0x24],	%l3
loop_2834:
	fnot1s	%f0,	%f17
	faligndata	%f24,	%f8,	%f22
	fmul8sux16	%f18,	%f20,	%f10
	tge	%icc,	0x3
	edge32n	%i3,	%o4,	%g6
	fnors	%f21,	%f24,	%f21
	xorcc	%o1,	%i7,	%l6
	wr	%g0,	0x2a,	%asi
	stwa	%g2,	[%l7 + 0x20] %asi
	membar	#Sync
	and	%o6,	%l2,	%g1
	ldsh	[%l7 + 0x0A],	%o7
	bshuffle	%f6,	%f6,	%f2
	tvc	%xcc,	0x4
	xorcc	%g5,	%g4,	%i4
	bge,a	loop_2835
	movpos	%icc,	%o3,	%o2
	fbul	%fcc2,	loop_2836
	movl	%xcc,	%i2,	%i0
loop_2835:
	edge8l	%i6,	%l4,	%o5
	fornot1	%f30,	%f28,	%f10
loop_2836:
	edge16	%l1,	%i5,	%g7
	fmovsg	%icc,	%f1,	%f19
	bne,a	loop_2837
	array32	%o0,	%l0,	%l5
	edge8	%g3,	%i1,	%i3
	tvs	%xcc,	0x2
loop_2837:
	bl	loop_2838
	be,pn	%icc,	loop_2839
	orncc	%l3,	0x0C82,	%g6
	movpos	%xcc,	%o1,	%o4
loop_2838:
	nop
	set	0x1E, %o7
	stha	%i7,	[%l7 + %o7] 0x10
loop_2839:
	alignaddr	%g2,	%l6,	%l2
	movrgez	%o6,	%g1,	%o7
	srl	%g5,	%i4,	%o3
	bpos,a	%xcc,	loop_2840
	or	%o2,	0x16CF,	%g4
	sra	%i2,	0x04,	%i6
	tpos	%xcc,	0x1
loop_2840:
	tsubcctv	%l4,	0x1554,	%o5
	fnot2s	%f7,	%f6
	tn	%icc,	0x3
	wr	%g0,	0x10,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	xor	%l1,	0x0AB7,	%i0
	addccc	%i5,	0x1912,	%o0
	ldsb	[%l7 + 0x19],	%g7
	movleu	%xcc,	%l5,	%l0
	movrgz	%g3,	0x285,	%i1
	smulcc	%i3,	%l3,	%o1
	fornot1	%f26,	%f16,	%f26
	tvs	%icc,	0x1
	st	%f21,	[%l7 + 0x0C]
	stb	%o4,	[%l7 + 0x64]
	brgez	%g6,	loop_2841
	movg	%icc,	%i7,	%g2
	fbu	%fcc1,	loop_2842
	tgu	%xcc,	0x4
loop_2841:
	fble	%fcc0,	loop_2843
	tge	%xcc,	0x2
loop_2842:
	fxor	%f6,	%f4,	%f0
	udiv	%l2,	0x09CB,	%l6
loop_2843:
	movrgez	%o6,	0x0BA,	%g1
	fmovdl	%icc,	%f15,	%f31
	tle	%icc,	0x4
	ta	%xcc,	0x6
	fnands	%f17,	%f5,	%f25
	edge32	%o7,	%g5,	%o3
	sra	%i4,	0x10,	%g4
	srax	%o2,	0x1E,	%i2
	fpsub32	%f4,	%f18,	%f18
	fnot1s	%f28,	%f6
	movgu	%xcc,	%l4,	%o5
	tleu	%xcc,	0x0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mulx	%i6,	0x0E5F,	%l1
	orn	%i0,	%i5,	%g7
	array32	%l5,	%o0,	%g3
	fnot2	%f22,	%f2
	srlx	%i1,	0x0D,	%i3
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
	fmovdvc	%icc,	%f29,	%f13
	sllx	%l0,	%o1,	%l3
	movcc	%xcc,	%o4,	%g6
loop_2844:
	srlx	%g2,	0x1F,	%l2
	tleu	%icc,	0x7
	ldsb	[%l7 + 0x28],	%i7
	taddcctv	%o6,	0x0A37,	%l6
	fpsub32	%f12,	%f26,	%f18
	tneg	%xcc,	0x5
	fmovd	%f10,	%f24
	fmovsge	%xcc,	%f20,	%f21
	movrgz	%g1,	%g5,	%o7
	wr	%g0,	0x80,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	prefetch	[%l7 + 0x58],	 0x2
	fblg	%fcc0,	loop_2845
	movrgz	%o3,	0x00C,	%i4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddr	%o2,	%g4,	%i2
loop_2845:
	fba,a	%fcc3,	loop_2846
	fxnors	%f14,	%f22,	%f12
	array8	%l4,	%i6,	%l1
	andcc	%o5,	%i0,	%g7
loop_2846:
	nop
	wr	%g0,	0x19,	%asi
	prefetcha	[%l7 + 0x78] %asi,	 0x0
	fble,a	%fcc3,	loop_2847
	fmovdgu	%icc,	%f7,	%f16
	fmovsn	%xcc,	%f21,	%f25
	movn	%xcc,	%i5,	%o0
loop_2847:
	stb	%i1,	[%l7 + 0x65]
	swap	[%l7 + 0x48],	%i3
	fpmerge	%f29,	%f25,	%f24
	movvs	%xcc,	%g3,	%o1
	set	0x38, %i4
	prefetcha	[%l7 + %i4] 0x81,	 0x2
	subccc	%l0,	%o4,	%g6
	fnors	%f7,	%f3,	%f25
	mulscc	%l2,	0x1EFD,	%g2
	edge16n	%o6,	%l6,	%g1
	fandnot2s	%f28,	%f1,	%f4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x80,	%asi
	prefetcha	[%l7 + 0x40] %asi,	 0x3
	fmovrdgez	%g5,	%f24,	%f28
	udivx	%o3,	0x008F,	%i4
	tg	%xcc,	0x3
	edge16l	%o7,	%o2,	%g4
	wr	%g0,	0x80,	%asi
	lduwa	[%l7 + 0x08] %asi,	%i2
	umulcc	%i6,	%l4,	%o5
	wr	%g0,	0x11,	%asi
	stha	%l1,	[%l7 + 0x1C] %asi
	tvs	%icc,	0x7
	fmovda	%xcc,	%f26,	%f6
	srax	%i0,	0x16,	%l5
	wr	%g0,	0x23,	%asi
	stba	%i5,	[%l7 + 0x38] %asi
	membar	#Sync
	tcs	%xcc,	0x5
	fcmpgt16	%f12,	%f30,	%o0
	sllx	%g7,	0x10,	%i1
	sdiv	%i3,	0x12D1,	%o1
	fzeros	%f15
	udivx	%g3,	0x0AFE,	%l3
	movgu	%icc,	%l0,	%o4
	fmovdne	%xcc,	%f18,	%f22
	sll	%g6,	%g2,	%l2
	mulx	%l6,	0x0243,	%g1
	bgu,a	%xcc,	loop_2848
	orcc	%i7,	%o6,	%o3
	andncc	%g5,	%o7,	%i4
	fbul,a	%fcc0,	loop_2849
loop_2848:
	mova	%icc,	%g4,	%i2
	bl	%icc,	loop_2850
	movge	%xcc,	%i6,	%o2
loop_2849:
	movle	%xcc,	%l4,	%o5
	taddcc	%l1,	%i0,	%i5
loop_2850:
	fbe	%fcc2,	loop_2851
	fbue	%fcc0,	loop_2852
	add	%l5,	%o0,	%g7
	edge8n	%i1,	%i3,	%g3
loop_2851:
	movle	%icc,	%l3,	%o1
loop_2852:
	edge32	%o4,	%g6,	%g2
	fxnors	%f21,	%f31,	%f11
	tpos	%icc,	0x5
	andcc	%l0,	%l6,	%l2
	movrgez	%g1,	0x04D,	%o6
	subcc	%o3,	0x0393,	%i7
	flush	%l7 + 0x20
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x40, %l4
	stda	%f16,	[%l7 + %l4] 0x14
	fbug	%fcc0,	loop_2853
	fbn,a	%fcc2,	loop_2854
	movne	%icc,	%o7,	%g5
	andcc	%g4,	0x0997,	%i2
loop_2853:
	fornot2	%f8,	%f20,	%f12
loop_2854:
	mulscc	%i6,	0x00E7,	%o2
	fcmpes	%fcc1,	%f3,	%f30
	fbug,a	%fcc3,	loop_2855
	movpos	%xcc,	%i4,	%l4
	array16	%o5,	%l1,	%i0
	edge32n	%i5,	%o0,	%g7
loop_2855:
	tneg	%xcc,	0x7
	ta	%icc,	0x4
	wr	%g0,	0x27,	%asi
	ldda	[%l7 + 0x20] %asi,	%i0
	movne	%icc,	%i3,	%g3
	fmovscc	%icc,	%f18,	%f14
	xorcc	%l5,	%l3,	%o4
	addc	%o1,	0x152A,	%g2
	tg	%icc,	0x0
	tne	%icc,	0x5
	udivcc	%g6,	0x0EA9,	%l0
	fbg	%fcc0,	loop_2856
	te	%icc,	0x6
	mova	%xcc,	%l2,	%g1
	set	0x32, %g3
	ldsha	[%l7 + %g3] 0x04,	%o6
loop_2856:
	nop
	set	0x48, %g4
	ldsha	[%l7 + %g4] 0x18,	%l6
	fpsub32	%f20,	%f22,	%f20
	fpackfix	%f26,	%f23
	edge32	%o3,	%o7,	%i7
	swap	[%l7 + 0x58],	%g4
	set	0x64, %i3
	stwa	%g5,	[%l7 + %i3] 0x04
	mova	%xcc,	%i6,	%i2
	fmovsne	%icc,	%f4,	%f4
	udivcc	%i4,	0x1D14,	%l4
	and	%o2,	0x0193,	%l1
	movpos	%xcc,	%o5,	%i0
	sethi	0x0C41,	%i5
	movrgz	%o0,	0x200,	%i1
	fmovdleu	%xcc,	%f21,	%f13
	fmovsleu	%icc,	%f6,	%f25
	bgu	loop_2857
	movcc	%icc,	%i3,	%g3
	taddcctv	%l5,	0x0C7C,	%g7
	mulscc	%o4,	0x11F2,	%l3
loop_2857:
	bvs,a	loop_2858
	sethi	0x10B4,	%o1
	stx	%g6,	[%l7 + 0x30]
	lduw	[%l7 + 0x74],	%g2
loop_2858:
	sra	%l0,	%l2,	%g1
	movre	%l6,	%o3,	%o7
	movg	%icc,	%i7,	%o6
	tpos	%icc,	0x7
	wr	%g0,	0x04,	%asi
	stwa	%g4,	[%l7 + 0x70] %asi
	fbge	%fcc1,	loop_2859
	fmul8ulx16	%f20,	%f2,	%f2
	fpackfix	%f16,	%f31
	movrgz	%g5,	%i6,	%i4
loop_2859:
	ldd	[%l7 + 0x68],	%l4
	movvc	%icc,	%o2,	%l1
	addcc	%o5,	%i2,	%i5
	fmovrse	%i0,	%f6,	%f17
	fbo	%fcc0,	loop_2860
	ldstub	[%l7 + 0x2B],	%o0
	smul	%i1,	%i3,	%g3
	set	0x70, %i1
	lduha	[%l7 + %i1] 0x19,	%g7
loop_2860:
	xnor	%o4,	0x0A93,	%l5
	wr	%g0,	0x80,	%asi
	sta	%f0,	[%l7 + 0x0C] %asi
	subccc	%o1,	%g6,	%g2
	fbue,a	%fcc1,	loop_2861
	movvc	%xcc,	%l3,	%l2
	xor	%g1,	0x1C4E,	%l6
	tn	%icc,	0x1
loop_2861:
	fpack16	%f8,	%f4
	andn	%l0,	0x10F2,	%o7
	ldx	[%l7 + 0x38],	%i7
	smulcc	%o6,	0x11E5,	%g4
	ba,pn	%xcc,	loop_2862
	fbne	%fcc1,	loop_2863
	movleu	%xcc,	%o3,	%g5
	fbl,a	%fcc0,	loop_2864
loop_2862:
	fone	%f4
loop_2863:
	fnand	%f12,	%f30,	%f22
	addcc	%i6,	%l4,	%o2
loop_2864:
	srlx	%i4,	0x0B,	%l1
	brnz	%o5,	loop_2865
	tvc	%icc,	0x0
	sra	%i2,	%i0,	%o0
	fmovsgu	%xcc,	%f16,	%f27
loop_2865:
	array8	%i1,	%i3,	%i5
	fmovrsne	%g3,	%f25,	%f13
	sra	%g7,	%l5,	%o4
	brnz	%g6,	loop_2866
	sllx	%o1,	%l3,	%l2
	tge	%icc,	0x7
	addc	%g2,	0x0B40,	%l6
loop_2866:
	add	%l0,	0x10A2,	%g1
	tle	%icc,	0x3
	fmovsneg	%xcc,	%f25,	%f1
	brz,a	%o7,	loop_2867
	array8	%i7,	%o6,	%o3
	fmovrdlz	%g4,	%f28,	%f20
	bpos,pn	%xcc,	loop_2868
loop_2867:
	xor	%g5,	0x1FB4,	%i6
	orcc	%o2,	%i4,	%l1
	srlx	%l4,	%i2,	%o5
loop_2868:
	fzeros	%f10
	umul	%i0,	%i1,	%o0
	sdiv	%i5,	0x0C8A,	%i3
	taddcc	%g7,	%l5,	%o4
	call	loop_2869
	fmovdg	%xcc,	%f6,	%f9
	movge	%icc,	%g6,	%o1
	edge32ln	%l3,	%l2,	%g2
loop_2869:
	srlx	%l6,	0x0F,	%g3
	fble,a	%fcc3,	loop_2870
	edge8	%l0,	%g1,	%i7
	andcc	%o7,	%o3,	%g4
	addc	%o6,	%i6,	%o2
loop_2870:
	tn	%xcc,	0x4
	movcc	%icc,	%g5,	%l1
	subc	%i4,	0x0FB4,	%i2
	set	0x08, %l5
	lduwa	[%l7 + %l5] 0x10,	%o5
	ta	%xcc,	0x0
	fmul8x16	%f6,	%f20,	%f10
	srlx	%l4,	%i0,	%o0
	edge8l	%i1,	%i3,	%g7
	orncc	%l5,	%i5,	%g6
	fbl,a	%fcc1,	loop_2871
	fone	%f28
	fand	%f30,	%f14,	%f2
	tcs	%xcc,	0x6
loop_2871:
	tvs	%xcc,	0x4
	brnz,a	%o1,	loop_2872
	tg	%icc,	0x7
	sdivcc	%l3,	0x1EC0,	%o4
	fandnot2s	%f4,	%f28,	%f19
loop_2872:
	popc	%l2,	%g2
	array8	%l6,	%g3,	%g1
	srax	%l0,	0x15,	%o7
	sth	%o3,	[%l7 + 0x1A]
	tle	%icc,	0x2
	fmovrslz	%i7,	%f0,	%f24
	std	%g4,	[%l7 + 0x18]
	wr	%g0,	0x89,	%asi
	lduwa	[%l7 + 0x40] %asi,	%i6
	fxnors	%f7,	%f10,	%f28
	movvc	%icc,	%o2,	%g5
	fandnot2	%f8,	%f22,	%f20
	udivx	%o6,	0x1BE6,	%l1
	movn	%xcc,	%i4,	%i2
	fpsub16s	%f20,	%f4,	%f3
	fcmpeq32	%f2,	%f20,	%l4
	brgz	%i0,	loop_2873
	fbu	%fcc2,	loop_2874
	sdivx	%o5,	0x1FBB,	%i1
	add	%i3,	0x100F,	%o0
loop_2873:
	movcc	%icc,	%g7,	%l5
loop_2874:
	tge	%xcc,	0x0
	ldub	[%l7 + 0x2D],	%i5
	prefetch	[%l7 + 0x08],	 0x3
	subcc	%o1,	%l3,	%o4
	movle	%xcc,	%g6,	%g2
	edge16	%l2,	%l6,	%g3
	fnand	%f26,	%f4,	%f22
	brlz,a	%g1,	loop_2875
	fbe,a	%fcc1,	loop_2876
	smul	%l0,	%o3,	%i7
	set	0x3c8, %o1
	nop 	! 	nop 	! 	ldxa	[%g0 + %o1] 0x40,	%o7 ripped by fixASI40.pl ripped by fixASI40.pl
loop_2875:
	taddcctv	%g4,	0x0A02,	%i6
loop_2876:
	or	%o2,	0x01C8,	%o6
	alignaddr	%g5,	%l1,	%i2
	fsrc2s	%f17,	%f11
	srl	%i4,	%l4,	%o5
	edge16n	%i1,	%i0,	%i3
	xnor	%g7,	0x008D,	%l5
	flush	%l7 + 0x1C
	alignaddrl	%i5,	%o1,	%l3
	tvs	%xcc,	0x2
	tg	%xcc,	0x0
	brz,a	%o0,	loop_2877
	addcc	%g6,	%o4,	%l2
	ldd	[%l7 + 0x68],	%g2
	fmovsleu	%xcc,	%f13,	%f30
loop_2877:
	tge	%icc,	0x2
	bleu,pn	%icc,	loop_2878
	fpadd32	%f30,	%f6,	%f0
	mulx	%g3,	0x17C8,	%l6
	movn	%icc,	%g1,	%l0
loop_2878:
	taddcctv	%i7,	%o3,	%o7
	lduh	[%l7 + 0x7C],	%g4
	movrne	%o2,	%o6,	%g5
	umulcc	%l1,	0x0581,	%i2
	movge	%xcc,	%i4,	%l4
	fnot2	%f2,	%f18
	set	0x4C, %i0
	sta	%f5,	[%l7 + %i0] 0x80
	fandnot1	%f18,	%f16,	%f16
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andncc	%i6,	%o5,	%i0
	faligndata	%f10,	%f6,	%f18
	membar	0x10
	fmovd	%f2,	%f22
	subcc	%i1,	%g7,	%i3
	fnot2	%f16,	%f20
	sra	%l5,	%o1,	%l3
	movrgz	%i5,	0x270,	%g6
	tvs	%xcc,	0x5
	std	%f12,	[%l7 + 0x78]
	movgu	%icc,	%o4,	%l2
	pdist	%f24,	%f4,	%f26
	ldx	[%l7 + 0x70],	%g2
	movgu	%xcc,	%g3,	%l6
	tcs	%icc,	0x3
	movre	%g1,	%o0,	%i7
	fcmpeq32	%f22,	%f12,	%l0
	srl	%o3,	0x01,	%g4
	movcs	%xcc,	%o2,	%o7
	std	%f22,	[%l7 + 0x18]
	or	%g5,	%o6,	%i2
	ldub	[%l7 + 0x58],	%l1
	array8	%i4,	%l4,	%i6
	tsubcc	%i0,	%o5,	%i1
	smulcc	%g7,	0x0F56,	%l5
	movg	%xcc,	%o1,	%i3
	udiv	%i5,	0x0F4D,	%g6
	fmovsa	%xcc,	%f24,	%f22
	bge,a,pt	%xcc,	loop_2879
	fmovsge	%xcc,	%f13,	%f3
	nop
	setx	loop_2880,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movrlez	%l3,	0x138,	%o4
loop_2879:
	fabss	%f27,	%f17
	fcmpeq32	%f16,	%f22,	%g2
loop_2880:
	nop
	set	0x68, %g1
	ldxa	[%l7 + %g1] 0x88,	%l2
	fmul8x16	%f9,	%f6,	%f12
	edge16n	%g3,	%l6,	%o0
	edge32ln	%i7,	%l0,	%o3
	st	%f29,	[%l7 + 0x70]
	fmovrsgz	%g1,	%f16,	%f6
	fmovdneg	%icc,	%f27,	%f7
	alignaddrl	%g4,	%o7,	%o2
	alignaddrl	%o6,	%g5,	%l1
	fmovsn	%icc,	%f22,	%f24
	wr	%g0,	0x80,	%asi
	lduwa	[%l7 + 0x78] %asi,	%i2
	edge8	%l4,	%i4,	%i6
	brgz	%o5,	loop_2881
	sir	0x1522
	bvc,a,pn	%icc,	loop_2882
	smulcc	%i1,	0x1133,	%i0
loop_2881:
	tsubcc	%l5,	0x1B26,	%g7
	movg	%xcc,	%i3,	%i5
loop_2882:
	sub	%g6,	0x13BB,	%l3
	fmovdne	%xcc,	%f20,	%f10
	andn	%o1,	0x060A,	%o4
	edge32n	%l2,	%g3,	%l6
	fba	%fcc2,	loop_2883
	fbug	%fcc0,	loop_2884
	sub	%o0,	0x1730,	%i7
	bvs	%xcc,	loop_2885
loop_2883:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2884:
	sdivx	%g2,	0x0978,	%o3
	nop
	setx loop_2886, %l0, %l1
	jmpl %l1, %g1
loop_2885:
	array16	%g4,	%l0,	%o7
	edge8l	%o2,	%o6,	%g5
	bleu,a	loop_2887
loop_2886:
	fbn,a	%fcc1,	loop_2888
	flush	%l7 + 0x58
	fmovsge	%icc,	%f26,	%f15
loop_2887:
	array16	%i2,	%l4,	%l1
loop_2888:
	lduw	[%l7 + 0x70],	%i4
	movvs	%xcc,	%i6,	%o5
	addc	%i1,	%l5,	%g7
	addcc	%i3,	%i5,	%g6
	bl,a,pn	%icc,	loop_2889
	fmovdneg	%icc,	%f4,	%f13
	fbug	%fcc2,	loop_2890
	taddcc	%l3,	%i0,	%o4
loop_2889:
	nop
	wr	%g0,	0x11,	%asi
	prefetcha	[%l7 + 0x58] %asi,	 0x0
loop_2890:
	fbule	%fcc1,	loop_2891
	fcmped	%fcc2,	%f4,	%f24
	sdivcc	%g3,	0x146C,	%l2
	xnor	%l6,	%o0,	%g2
loop_2891:
	nop
	wr	%g0,	0x4f,	%asi
	stxa	%i7,	[%g0 + 0x30] %asi
	edge16ln	%o3,	%g4,	%g1
	taddcctv	%l0,	%o2,	%o6
	fabsd	%f28,	%f20
	fmovrde	%g5,	%f0,	%f14
	edge32l	%i2,	%l4,	%l1
	subc	%o7,	0x0D32,	%i4
	array8	%o5,	%i1,	%i6
	fbu	%fcc2,	loop_2892
	orncc	%l5,	%i3,	%i5
	fble	%fcc0,	loop_2893
	fmul8x16al	%f15,	%f2,	%f6
loop_2892:
	subc	%g6,	%g7,	%l3
	alignaddr	%o4,	%i0,	%g3
loop_2893:
	ldsb	[%l7 + 0x1C],	%l2
	subcc	%o1,	0x01F4,	%o0
	lduw	[%l7 + 0x6C],	%g2
	tg	%xcc,	0x1
	bleu,a,pn	%icc,	loop_2894
	fbu,a	%fcc3,	loop_2895
	te	%icc,	0x0
	sdiv	%i7,	0x0E16,	%o3
loop_2894:
	movrgz	%l6,	%g4,	%l0
loop_2895:
	tne	%xcc,	0x0
	set	0x38, %l6
	stha	%o2,	[%l7 + %l6] 0x23
	membar	#Sync
	set	0x40, %i6
	stda	%o6,	[%l7 + %i6] 0x2a
	membar	#Sync
	tne	%xcc,	0x3
	movg	%xcc,	%g1,	%i2
	sllx	%l4,	0x1D,	%g5
	tsubcctv	%l1,	%o7,	%i4
	bneg,a,pt	%icc,	loop_2896
	for	%f6,	%f12,	%f30
	sdiv	%o5,	0x198A,	%i6
	flush	%l7 + 0x34
loop_2896:
	xnor	%l5,	0x0DD3,	%i3
	fnors	%f9,	%f28,	%f18
	subccc	%i1,	%g6,	%i5
	fnor	%f24,	%f4,	%f2
	tle	%icc,	0x2
	fpsub16	%f30,	%f14,	%f30
	taddcc	%l3,	%o4,	%g7
	fble	%fcc0,	loop_2897
	ta	%icc,	0x4
	movl	%xcc,	%i0,	%g3
	fmovsa	%icc,	%f23,	%f28
loop_2897:
	orncc	%l2,	0x0924,	%o1
	subccc	%o0,	0x1BC4,	%i7
	fmul8ulx16	%f22,	%f8,	%f12
	udivx	%g2,	0x1F44,	%o3
	srl	%g4,	%l0,	%l6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbuge	%fcc0,	loop_2898
	prefetch	[%l7 + 0x6C],	 0x1
	fmovrde	%o6,	%f12,	%f18
	sir	0x083A
loop_2898:
	fxor	%f26,	%f24,	%f22
	andn	%o2,	0x07D9,	%i2
	edge16ln	%l4,	%g1,	%l1
	orcc	%o7,	0x01C9,	%i4
	fmovdge	%icc,	%f27,	%f27
	array8	%o5,	%g5,	%i6
	movn	%xcc,	%i3,	%i1
	bne,pn	%icc,	loop_2899
	fxors	%f19,	%f1,	%f0
	wr	%g0,	0x04,	%asi
	stba	%g6,	[%l7 + 0x1E] %asi
loop_2899:
	and	%i5,	0x0C9F,	%l5
	brgez,a	%o4,	loop_2900
	movle	%xcc,	%g7,	%i0
	siam	0x5
	bneg	%icc,	loop_2901
loop_2900:
	xnorcc	%g3,	%l2,	%o1
	nop
	setx loop_2902, %l0, %l1
	jmpl %l1, %o0
	bcs,a,pn	%icc,	loop_2903
loop_2901:
	xnorcc	%i7,	0x1D03,	%l3
	brlez,a	%g2,	loop_2904
loop_2902:
	fmovde	%xcc,	%f20,	%f28
loop_2903:
	nop
	wr	%g0,	0x18,	%asi
	ldxa	[%l7 + 0x30] %asi,	%o3
loop_2904:
	fmovscs	%icc,	%f17,	%f0
	mulscc	%g4,	%l6,	%l0
	movleu	%xcc,	%o2,	%o6
	addc	%i2,	0x03B2,	%g1
	tsubcctv	%l4,	0x1A7C,	%l1
	fbne,a	%fcc0,	loop_2905
	fmovs	%f18,	%f16
	nop
	setx loop_2906, %l0, %l1
	jmpl %l1, %o7
	tle	%xcc,	0x1
loop_2905:
	movrlz	%o5,	%i4,	%g5
	stx	%i3,	[%l7 + 0x70]
loop_2906:
	sdivcc	%i6,	0x0085,	%g6
	alignaddrl	%i1,	%i5,	%o4
	tgu	%icc,	0x2
	fmuld8ulx16	%f11,	%f27,	%f14
	tvc	%xcc,	0x3
	ld	[%l7 + 0x5C],	%f22
	edge8	%g7,	%l5,	%i0
	edge32l	%l2,	%o1,	%o0
	movrgez	%g3,	%i7,	%g2
	subccc	%l3,	0x1ED0,	%o3
	sra	%g4,	0x1D,	%l0
	edge8	%o2,	%l6,	%o6
	tvs	%xcc,	0x5
	udivx	%g1,	0x1658,	%l4
	edge32	%l1,	%o7,	%i2
	flush	%l7 + 0x2C
	tcs	%icc,	0x2
	andn	%i4,	%o5,	%g5
	ldx	[%l7 + 0x40],	%i6
	subccc	%i3,	%i1,	%g6
	set	0x2D, %i2
	lduba	[%l7 + %i2] 0x04,	%i5
	brgez,a	%o4,	loop_2907
	fsrc2	%f18,	%f16
	bne,a	%icc,	loop_2908
	movre	%l5,	%i0,	%g7
loop_2907:
	sub	%l2,	%o1,	%o0
	array16	%g3,	%g2,	%i7
loop_2908:
	tgu	%xcc,	0x0
	set	0x10, %g2
	ldda	[%l7 + %g2] 0x89,	%o2
	fpsub16s	%f4,	%f3,	%f4
	membar	0x5E
	ba,a,pn	%xcc,	loop_2909
	tg	%icc,	0x1
	fone	%f22
	subc	%l3,	%l0,	%o2
loop_2909:
	sdiv	%g4,	0x0965,	%l6
	fnot1s	%f5,	%f4
	brnz	%o6,	loop_2910
	movvc	%icc,	%l4,	%l1
	brlez	%o7,	loop_2911
	fmovscc	%icc,	%f31,	%f24
loop_2910:
	xorcc	%i2,	0x0FFF,	%i4
	alignaddrl	%g1,	%g5,	%o5
loop_2911:
	xor	%i6,	%i3,	%g6
	xor	%i5,	0x0870,	%i1
	fmovdvc	%icc,	%f3,	%f21
	mulscc	%l5,	%i0,	%o4
	fmovrsgez	%g7,	%f9,	%f30
	tcs	%xcc,	0x1
	movre	%l2,	0x005,	%o1
	fnot1	%f26,	%f20
	orn	%g3,	%g2,	%o0
	movvs	%icc,	%i7,	%o3
	movge	%icc,	%l3,	%o2
	ldstub	[%l7 + 0x22],	%g4
	sir	0x0173
	fmovdne	%icc,	%f21,	%f26
	fxnors	%f27,	%f12,	%f21
	orcc	%l6,	%o6,	%l4
	srl	%l1,	0x1C,	%o7
	srlx	%l0,	0x07,	%i2
	sra	%g1,	%i4,	%g5
	edge8l	%o5,	%i6,	%i3
	wr	%g0,	0x19,	%asi
	lduha	[%l7 + 0x52] %asi,	%i5
	popc	0x122D,	%g6
	sub	%l5,	0x1941,	%i1
	set	0x62, %l1
	stha	%o4,	[%l7 + %l1] 0x04
	movcc	%xcc,	%g7,	%i0
	bvc	loop_2912
	fmovdn	%xcc,	%f7,	%f7
	tg	%icc,	0x5
	edge32	%l2,	%g3,	%o1
loop_2912:
	edge32n	%o0,	%i7,	%o3
	fbu	%fcc2,	loop_2913
	alignaddr	%l3,	%g2,	%o2
	srlx	%l6,	0x11,	%g4
	wr	%g0,	0x18,	%asi
	stxa	%o6,	[%l7 + 0x70] %asi
loop_2913:
	mulscc	%l4,	%o7,	%l0
	bgu,a,pt	%xcc,	loop_2914
	stx	%i2,	[%l7 + 0x60]
	array8	%g1,	%l1,	%g5
	xor	%o5,	%i4,	%i3
loop_2914:
	membar	0x15
	te	%xcc,	0x1
	orn	%i6,	0x10D4,	%g6
	tn	%icc,	0x0
	fmovrslz	%l5,	%f19,	%f17
	edge8ln	%i5,	%o4,	%g7
	edge16l	%i0,	%i1,	%l2
	tsubcc	%g3,	%o0,	%i7
	sub	%o1,	%l3,	%o3
	fnors	%f29,	%f28,	%f26
	move	%icc,	%g2,	%l6
	brgz	%o2,	loop_2915
	std	%o6,	[%l7 + 0x48]
	smulcc	%g4,	0x1E02,	%o7
	udivcc	%l4,	0x1472,	%l0
loop_2915:
	movn	%xcc,	%g1,	%i2
	movne	%xcc,	%l1,	%o5
	fsrc2s	%f28,	%f20
	tl	%xcc,	0x3
	edge8l	%i4,	%g5,	%i6
	movrne	%i3,	0x0CA,	%g6
	fmuld8sux16	%f18,	%f21,	%f18
	edge8ln	%i5,	%l5,	%o4
	array32	%i0,	%g7,	%i1
	orncc	%l2,	0x0F18,	%g3
	addcc	%o0,	0x1A21,	%i7
	move	%xcc,	%o1,	%o3
	movgu	%icc,	%g2,	%l6
	movrgez	%l3,	%o6,	%o2
	edge8	%o7,	%g4,	%l4
	xnor	%g1,	%i2,	%l1
	addcc	%l0,	%o5,	%g5
	edge16ln	%i4,	%i6,	%i3
	mulscc	%g6,	%l5,	%i5
	edge16n	%o4,	%g7,	%i0
	movre	%i1,	%g3,	%l2
	movrne	%o0,	0x2C1,	%o1
	movvs	%xcc,	%o3,	%i7
	fpsub16s	%f30,	%f5,	%f7
	brz	%g2,	loop_2916
	fabss	%f11,	%f4
	movleu	%icc,	%l3,	%l6
	fpsub16s	%f6,	%f20,	%f13
loop_2916:
	move	%icc,	%o6,	%o2
	tsubcc	%o7,	0x1392,	%l4
	fble,a	%fcc1,	loop_2917
	edge16n	%g1,	%i2,	%g4
	stb	%l0,	[%l7 + 0x17]
	brlz,a	%l1,	loop_2918
loop_2917:
	te	%icc,	0x5
	movrlez	%o5,	%g5,	%i6
	tg	%icc,	0x3
loop_2918:
	membar	0x47
	fmovsne	%xcc,	%f13,	%f7
	movrne	%i3,	%g6,	%i4
	fmovs	%f27,	%f15
	bleu,a,pn	%xcc,	loop_2919
	nop
	setx loop_2920, %l0, %l1
	jmpl %l1, %l5
	std	%f0,	[%l7 + 0x28]
	set	0x10, %i5
	stda	%i4,	[%l7 + %i5] 0x88
loop_2919:
	array8	%o4,	%g7,	%i1
loop_2920:
	tl	%xcc,	0x0
	prefetch	[%l7 + 0x44],	 0x1
	edge8ln	%g3,	%l2,	%o0
	fmovd	%f22,	%f10
	xnorcc	%o1,	0x048C,	%o3
	sdiv	%i0,	0x0B9A,	%g2
	stx	%i7,	[%l7 + 0x30]
	wr	%g0,	0x0c,	%asi
	stxa	%l6,	[%l7 + 0x50] %asi
	bge,pt	%xcc,	loop_2921
	fpsub16s	%f17,	%f29,	%f24
	movl	%xcc,	%o6,	%o2
	bcc	%xcc,	loop_2922
loop_2921:
	brnz,a	%o7,	loop_2923
	tneg	%xcc,	0x4
	edge32	%l4,	%l3,	%i2
loop_2922:
	movleu	%icc,	%g1,	%g4
loop_2923:
	bcs,a	%icc,	loop_2924
	ldd	[%l7 + 0x28],	%l0
	fmovdn	%icc,	%f2,	%f14
	fbuge,a	%fcc2,	loop_2925
loop_2924:
	stw	%l0,	[%l7 + 0x5C]
	fmovrsgez	%o5,	%f24,	%f29
	subcc	%g5,	0x1A4F,	%i6
loop_2925:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	move	%icc,	%i3,	%i4
	and	%l5,	0x1A50,	%g6
	movne	%icc,	%o4,	%g7
	edge32n	%i5,	%g3,	%i1
	bvc,pn	%xcc,	loop_2926
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bpos,a,pt	%xcc,	loop_2927
	movrgz	%l2,	%o1,	%o0
loop_2926:
	addccc	%o3,	0x1EDF,	%i0
	movg	%icc,	%g2,	%l6
loop_2927:
	edge8	%o6,	%o2,	%o7
	movl	%icc,	%i7,	%l4
	fnegd	%f30,	%f22
	srax	%i2,	%g1,	%g4
	fbue,a	%fcc2,	loop_2928
	movneg	%xcc,	%l1,	%l0
	edge16ln	%o5,	%g5,	%i6
	movge	%icc,	%i3,	%l3
loop_2928:
	fbg,a	%fcc2,	loop_2929
	mulx	%l5,	0x1189,	%g6
	set	0x78, %o3
	ldswa	[%l7 + %o3] 0x10,	%o4
loop_2929:
	array16	%g7,	%i4,	%g3
	fmovdle	%xcc,	%f21,	%f6
	fmovsa	%icc,	%f6,	%f23
	st	%f16,	[%l7 + 0x34]
	set	0x58, %o2
	lda	[%l7 + %o2] 0x15,	%f19
	tsubcctv	%i5,	0x0F7B,	%l2
	fnegs	%f16,	%f27
	brnz,a	%o1,	loop_2930
	tle	%icc,	0x7
	taddcc	%o0,	0x16F1,	%o3
	fmovdneg	%icc,	%f30,	%f22
loop_2930:
	fexpand	%f18,	%f12
	fnot2s	%f27,	%f26
	ldub	[%l7 + 0x08],	%i0
	fnot1s	%f28,	%f19
	add	%g2,	0x0661,	%i1
	fmovsvc	%xcc,	%f8,	%f27
	tneg	%xcc,	0x6
	edge32n	%o6,	%o2,	%o7
	edge32	%i7,	%l4,	%l6
	movge	%icc,	%i2,	%g4
	tneg	%icc,	0x3
	subc	%g1,	%l1,	%o5
	fmovrsne	%l0,	%f20,	%f24
	mulscc	%i6,	0x1F27,	%i3
	tsubcctv	%l3,	0x19E3,	%g5
	fble	%fcc1,	loop_2931
	tgu	%xcc,	0x5
	andn	%l5,	0x1FF9,	%o4
	tle	%xcc,	0x4
loop_2931:
	xnorcc	%g6,	%i4,	%g3
	sub	%g7,	%l2,	%o1
	srlx	%i5,	%o3,	%o0
	tl	%icc,	0x2
	set	0x68, %l0
	swapa	[%l7 + %l0] 0x04,	%g2
	srl	%i1,	%i0,	%o6
	edge8n	%o2,	%o7,	%i7
	sir	0x048A
	subccc	%l6,	0x0F51,	%l4
	fmovrde	%g4,	%f28,	%f8
	fmovscs	%icc,	%f0,	%f27
	fbe,a	%fcc3,	loop_2932
	orn	%i2,	%g1,	%o5
	mova	%xcc,	%l1,	%i6
	movcc	%icc,	%i3,	%l0
loop_2932:
	bcs,pt	%xcc,	loop_2933
	bneg,pt	%xcc,	loop_2934
	edge32n	%g5,	%l3,	%o4
	tcc	%xcc,	0x6
loop_2933:
	fmovrslz	%l5,	%f7,	%f24
loop_2934:
	nop
	setx	loop_2935,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movrgez	%g6,	%g3,	%g7
	fmovscc	%icc,	%f5,	%f7
	movle	%icc,	%i4,	%o1
loop_2935:
	tgu	%icc,	0x5
	taddcctv	%i5,	0x1409,	%l2
	movvs	%xcc,	%o3,	%g2
	udiv	%o0,	0x13FE,	%i1
	alignaddrl	%i0,	%o2,	%o6
	fmovsl	%icc,	%f23,	%f6
	array16	%o7,	%l6,	%i7
	fors	%f4,	%f25,	%f21
	movrgz	%l4,	0x02A,	%i2
	wr	%g0,	0xf8,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
	xorcc	%g1,	0x1D4D,	%o5
	fabss	%f17,	%f20
	ta	%xcc,	0x3
	call	loop_2936
	addc	%l1,	%g4,	%i6
	fcmple32	%f14,	%f10,	%l0
	fbug	%fcc3,	loop_2937
loop_2936:
	array8	%i3,	%l3,	%g5
	srax	%l5,	%g6,	%g3
	ldstub	[%l7 + 0x3A],	%o4
loop_2937:
	fmul8sux16	%f12,	%f20,	%f16
	movleu	%xcc,	%g7,	%o1
	array32	%i4,	%i5,	%l2
	edge16l	%o3,	%o0,	%i1
	sllx	%i0,	%g2,	%o6
	brgz,a	%o2,	loop_2938
	edge32l	%o7,	%i7,	%l4
	sll	%l6,	0x17,	%i2
	tle	%xcc,	0x3
loop_2938:
	tle	%icc,	0x1
	swap	[%l7 + 0x48],	%o5
	movrne	%l1,	%g1,	%g4
	movg	%xcc,	%l0,	%i6
	fmul8x16	%f25,	%f0,	%f12
	bleu,a,pn	%icc,	loop_2939
	udivcc	%l3,	0x0277,	%g5
	movg	%icc,	%i3,	%g6
	tge	%icc,	0x4
loop_2939:
	fmovscc	%xcc,	%f18,	%f26
	xorcc	%l5,	0x16C1,	%g3
	movrgz	%g7,	%o1,	%o4
	tge	%xcc,	0x5
	taddcctv	%i5,	0x091F,	%l2
	fnot1s	%f12,	%f22
	tg	%icc,	0x5
	umul	%i4,	0x03BB,	%o0
	flush	%l7 + 0x74
	sll	%o3,	0x08,	%i0
	fnands	%f2,	%f4,	%f3
	movg	%icc,	%i1,	%g2
	edge16l	%o2,	%o6,	%o7
	tgu	%xcc,	0x7
	ldd	[%l7 + 0x20],	%l4
	movvc	%icc,	%i7,	%l6
	array32	%i2,	%l1,	%o5
	srlx	%g4,	%g1,	%l0
	popc	0x1682,	%i6
	tleu	%icc,	0x6
	subcc	%l3,	%i3,	%g5
	fmovrslz	%g6,	%f5,	%f3
	stw	%l5,	[%l7 + 0x78]
	orcc	%g3,	%g7,	%o1
	fcmpeq32	%f28,	%f10,	%o4
	orn	%l2,	0x1D52,	%i5
	bvs	%icc,	loop_2940
	array8	%i4,	%o0,	%i0
	fpadd32	%f22,	%f4,	%f18
	movg	%xcc,	%i1,	%g2
loop_2940:
	fcmpeq16	%f22,	%f0,	%o3
	array8	%o2,	%o6,	%l4
	movrgz	%i7,	0x3F3,	%o7
	bcc,a	%xcc,	loop_2941
	swap	[%l7 + 0x28],	%i2
	tsubcctv	%l6,	%l1,	%o5
	movle	%xcc,	%g1,	%l0
loop_2941:
	bn	%icc,	loop_2942
	edge8n	%i6,	%l3,	%g4
	fmovdcc	%icc,	%f3,	%f9
	fcmple16	%f22,	%f12,	%g5
loop_2942:
	edge8	%i3,	%g6,	%l5
	alignaddrl	%g3,	%g7,	%o1
	swap	[%l7 + 0x70],	%l2
	tvc	%xcc,	0x6
	set	0x4C, %i7
	ldswa	[%l7 + %i7] 0x14,	%o4
	sub	%i4,	%o0,	%i5
	movrgez	%i1,	0x35A,	%g2
	fbg,a	%fcc3,	loop_2943
	fpsub16s	%f12,	%f25,	%f17
	xorcc	%i0,	%o2,	%o6
	sra	%o3,	%i7,	%o7
loop_2943:
	tl	%xcc,	0x6
	tpos	%icc,	0x5
	movg	%icc,	%i2,	%l6
	mulx	%l4,	0x1A91,	%l1
	set	0x58, %o0
	stha	%g1,	[%l7 + %o0] 0x18
	and	%o5,	%i6,	%l0
	xnor	%l3,	%g5,	%i3
	bcs,a	loop_2944
	movpos	%icc,	%g4,	%l5
	edge8l	%g6,	%g7,	%g3
	fxnors	%f29,	%f13,	%f4
loop_2944:
	srax	%o1,	%l2,	%o4
	fmovsleu	%xcc,	%f23,	%f20
	set	0x08, %o5
	sta	%f24,	[%l7 + %o5] 0x10
	tvs	%xcc,	0x1
	tge	%icc,	0x1
	fnegd	%f12,	%f2
	fone	%f20
	edge32n	%o0,	%i5,	%i4
	prefetch	[%l7 + 0x34],	 0x1
	array16	%i1,	%i0,	%g2
	prefetch	[%l7 + 0x10],	 0x3
	fmovsvc	%xcc,	%f6,	%f1
	sdivx	%o6,	0x03CF,	%o3
	wr	%g0,	0x04,	%asi
	ldsha	[%l7 + 0x48] %asi,	%o2
	smulcc	%i7,	0x02FA,	%i2
	edge32l	%o7,	%l4,	%l6
	taddcctv	%g1,	0x03F5,	%l1
	addc	%o5,	0x11CB,	%i6
	movrlz	%l0,	%l3,	%g5
	srax	%i3,	0x09,	%g4
	xnorcc	%l5,	0x0FD5,	%g7
	xnor	%g3,	0x1C8E,	%o1
	sllx	%g6,	%o4,	%o0
	fmovrdlz	%i5,	%f6,	%f20
	fands	%f7,	%f0,	%f13
	subc	%i4,	%i1,	%l2
	movgu	%icc,	%g2,	%i0
	subc	%o6,	0x0F27,	%o3
	tgu	%xcc,	0x0
	taddcctv	%i7,	%i2,	%o2
	edge32	%l4,	%l6,	%g1
	fnot2	%f0,	%f12
	ldd	[%l7 + 0x38],	%l0
	edge32l	%o5,	%o7,	%i6
	andncc	%l0,	%g5,	%i3
	edge16l	%g4,	%l3,	%l5
	fmovda	%xcc,	%f0,	%f29
	tle	%icc,	0x6
	movge	%xcc,	%g3,	%g7
	nop
	setx	loop_2945,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movle	%icc,	%o1,	%o4
	tcs	%icc,	0x0
	movcs	%icc,	%o0,	%i5
loop_2945:
	edge8	%i4,	%i1,	%l2
	movn	%xcc,	%g6,	%g2
	tvs	%xcc,	0x0
	movneg	%icc,	%o6,	%o3
	srax	%i0,	%i2,	%i7
	nop
	set	0x18, %l3
	std	%l4,	[%l7 + %l3]
	sub	%l6,	0x12D0,	%o2
	edge16n	%l1,	%o5,	%g1
	andcc	%i6,	%o7,	%g5
	tn	%xcc,	0x3
	fmovdgu	%icc,	%f28,	%f0
	fornot1s	%f21,	%f17,	%f17
	fpack16	%f14,	%f7
	fxors	%f4,	%f20,	%f18
	movrgez	%l0,	0x22A,	%g4
	subccc	%i3,	%l3,	%g3
	ld	[%l7 + 0x6C],	%f7
	edge16n	%g7,	%l5,	%o4
	tl	%icc,	0x2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bneg,pn	%xcc,	loop_2946
	xor	%o0,	0x1BA2,	%i5
	smul	%o1,	%i1,	%l2
	andcc	%g6,	%g2,	%i4
loop_2946:
	edge16	%o3,	%i0,	%i2
	wr	%g0,	0x19,	%asi
	ldsha	[%l7 + 0x08] %asi,	%o6
	fmovdg	%icc,	%f13,	%f18
	umul	%i7,	0x1D64,	%l6
	edge16ln	%l4,	%l1,	%o2
	taddcc	%g1,	%i6,	%o7
	fmovdleu	%icc,	%f16,	%f27
	sir	0x198F
	sdivx	%o5,	0x0707,	%g5
	edge32	%g4,	%l0,	%i3
	fnegd	%f28,	%f4
	sll	%g3,	%g7,	%l3
	edge32ln	%o4,	%l5,	%i5
	fzeros	%f8
	fmovsg	%xcc,	%f12,	%f23
	movg	%xcc,	%o0,	%i1
	fcmpeq32	%f28,	%f22,	%l2
	andncc	%g6,	%o1,	%g2
	set	0x60, %o6
	ldda	[%l7 + %o6] 0xe2,	%o2
	wr	%g0,	0x88,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	movrne	%i0,	0x2E7,	%i4
	popc	%i2,	%o6
	fcmpd	%fcc0,	%f0,	%f12
	xorcc	%i7,	%l6,	%l1
	xor	%l4,	0x0182,	%o2
	movrlz	%i6,	%g1,	%o7
	movle	%xcc,	%o5,	%g5
	fxnor	%f18,	%f4,	%f14
	movcs	%icc,	%l0,	%g4
	umulcc	%g3,	%i3,	%g7
	xor	%o4,	%l5,	%l3
	umul	%i5,	0x1E2C,	%i1
	and	%l2,	%g6,	%o0
	edge16	%o1,	%o3,	%g2
	fnot1s	%f29,	%f10
	fbne	%fcc1,	loop_2947
	andncc	%i0,	%i4,	%o6
	fmovsge	%xcc,	%f29,	%f16
	movge	%xcc,	%i7,	%l6
loop_2947:
	bn,a	loop_2948
	edge16n	%i2,	%l1,	%o2
	movneg	%xcc,	%i6,	%l4
	movrgz	%o7,	0x254,	%o5
loop_2948:
	nop
	set	0x58, %g6
	lda	[%l7 + %g6] 0x18,	%f8
	edge16	%g5,	%l0,	%g1
	flush	%l7 + 0x3C
	ldsw	[%l7 + 0x3C],	%g4
	edge8l	%g3,	%i3,	%g7
	nop
	setx	loop_2949,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fbug	%fcc0,	loop_2950
	tpos	%xcc,	0x1
	lduw	[%l7 + 0x6C],	%o4
loop_2949:
	taddcc	%l5,	%l3,	%i1
loop_2950:
	movrgz	%i5,	%l2,	%o0
	fzeros	%f8
	tsubcctv	%o1,	%g6,	%o3
	edge16ln	%i0,	%i4,	%g2
	movl	%icc,	%o6,	%l6
	fmovrsne	%i7,	%f14,	%f8
	andn	%i2,	0x0A46,	%o2
	array16	%i6,	%l1,	%l4
	te	%icc,	0x5
	array8	%o7,	%g5,	%l0
	nop
	setx	loop_2951,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fmovdg	%icc,	%f19,	%f31
	movn	%xcc,	%o5,	%g1
	edge32ln	%g3,	%i3,	%g7
loop_2951:
	edge32n	%g4,	%o4,	%l3
	smulcc	%i1,	%i5,	%l2
	edge32l	%l5,	%o1,	%o0
	movgu	%xcc,	%o3,	%g6
	srl	%i4,	0x01,	%g2
	fmovdcc	%xcc,	%f10,	%f16
	edge32	%o6,	%i0,	%l6
	and	%i7,	0x1887,	%o2
	addccc	%i6,	0x1AE0,	%l1
	andn	%i2,	0x13D7,	%l4
	sll	%g5,	%l0,	%o5
	bneg,a,pn	%xcc,	loop_2952
	movrgez	%g1,	%o7,	%g3
	movrlez	%g7,	%i3,	%o4
	fbue,a	%fcc1,	loop_2953
loop_2952:
	taddcctv	%g4,	0x1F1A,	%i1
	umulcc	%i5,	0x0D1D,	%l2
	edge16ln	%l3,	%l5,	%o1
loop_2953:
	edge16ln	%o0,	%g6,	%i4
	movrgz	%o3,	0x304,	%o6
	umul	%i0,	0x1426,	%g2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srl	%i7,	%o2,	%l6
	orn	%i6,	%l1,	%i2
	umulcc	%g5,	%l0,	%o5
	fmovsn	%icc,	%f22,	%f30
	udivcc	%g1,	0x0446,	%o7
	set	0x0C, %g7
	lduha	[%l7 + %g7] 0x15,	%g3
	fcmpd	%fcc2,	%f2,	%f4
	fcmpeq32	%f12,	%f0,	%g7
	sethi	0x0757,	%i3
	brgez	%l4,	loop_2954
	edge8l	%g4,	%o4,	%i5
	fands	%f5,	%f14,	%f12
	edge16	%l2,	%i1,	%l5
loop_2954:
	fornot1	%f0,	%f18,	%f16
	brnz,a	%l3,	loop_2955
	fornot1	%f18,	%f10,	%f6
	mova	%icc,	%o0,	%o1
	fbne,a	%fcc0,	loop_2956
loop_2955:
	fpsub16s	%f5,	%f14,	%f30
	fmovsl	%xcc,	%f4,	%f14
	fmuld8ulx16	%f3,	%f2,	%f30
loop_2956:
	tl	%xcc,	0x7
	fmovdvs	%xcc,	%f20,	%f19
	orncc	%g6,	%o3,	%o6
	movleu	%xcc,	%i4,	%g2
	fornot2s	%f18,	%f23,	%f6
	bgu	%xcc,	loop_2957
	nop
	setx loop_2958, %l0, %l1
	jmpl %l1, %i7
	nop
	setx loop_2959, %l0, %l1
	jmpl %l1, %i0
	umul	%o2,	%l6,	%i6
loop_2957:
	movleu	%icc,	%l1,	%i2
loop_2958:
	fnegd	%f8,	%f2
loop_2959:
	fsrc1	%f8,	%f18
	umul	%l0,	%o5,	%g1
	fpsub16	%f4,	%f28,	%f20
	brlz	%g5,	loop_2960
	fabsd	%f24,	%f22
	ld	[%l7 + 0x18],	%f17
	orn	%g3,	0x0878,	%g7
loop_2960:
	sdivx	%o7,	0x165C,	%l4
	movl	%icc,	%i3,	%o4
	brlz,a	%g4,	loop_2961
	movneg	%xcc,	%i5,	%i1
	movcc	%icc,	%l5,	%l2
	tsubcc	%o0,	0x0193,	%l3
loop_2961:
	fbule	%fcc0,	loop_2962
	edge8	%g6,	%o3,	%o6
	edge16l	%o1,	%i4,	%i7
	ldsh	[%l7 + 0x3E],	%i0
loop_2962:
	fmovsge	%xcc,	%f3,	%f7
	andn	%o2,	0x07E3,	%l6
	addc	%i6,	%g2,	%i2
	fbne,a	%fcc3,	loop_2963
	tn	%icc,	0x7
	movle	%icc,	%l1,	%o5
	wr	%g0,	0x11,	%asi
	lduha	[%l7 + 0x6A] %asi,	%g1
loop_2963:
	movrne	%l0,	%g5,	%g7
	tl	%xcc,	0x5
	ble,a	%icc,	loop_2964
	edge16l	%o7,	%l4,	%i3
	sra	%g3,	%o4,	%g4
	wr	%g0,	0x11,	%asi
	stwa	%i5,	[%l7 + 0x14] %asi
loop_2964:
	movrne	%l5,	0x0D1,	%l2
	subccc	%o0,	0x1C91,	%l3
	brnz,a	%g6,	loop_2965
	movrgz	%i1,	0x370,	%o3
	add	%l7,	0x5C,	%l6
	wr	%g0,	0x18,	%asi
	lda	[%l6] %asi,	%o1
	casa	[%l6] %asi,	%o1,	%o6
loop_2965:
	movl	%icc,	%i7,	%i4
	sdivcc	%i0,	0x0C25,	%l6
	membar	0x46
	sdiv	%i6,	0x036A,	%o2
	popc	0x0ABC,	%g2
	ldub	[%l7 + 0x3E],	%i2
	fmovsvs	%xcc,	%f5,	%f19
	subc	%o5,	0x1B18,	%g1
	ble,a	%icc,	loop_2966
	fmovdn	%icc,	%f23,	%f24
	fba	%fcc0,	loop_2967
	tn	%xcc,	0x5
loop_2966:
	orn	%l0,	0x1F3E,	%l1
	edge32n	%g7,	%g5,	%l4
loop_2967:
	ldx	[%l7 + 0x38],	%o7
	bgu,a	loop_2968
	taddcctv	%g3,	0x1666,	%o4
	fornot2	%f26,	%f20,	%f18
	movcs	%xcc,	%g4,	%i5
loop_2968:
	prefetch	[%l7 + 0x50],	 0x2
	smul	%l5,	%l2,	%o0
	edge8l	%l3,	%i3,	%g6
	addccc	%i1,	%o3,	%o6
	sll	%i7,	%i4,	%o1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movg	%xcc,	%i0,	%l6
	brgez	%i6,	loop_2969
	fmovsneg	%xcc,	%f19,	%f0
	sdivcc	%o2,	0x18A1,	%g2
	fmovrdlz	%i2,	%f14,	%f10
loop_2969:
	membar	0x13
	movrgez	%g1,	%l0,	%o5
	movne	%xcc,	%l1,	%g7
	movleu	%xcc,	%l4,	%o7
	movrlez	%g5,	0x17D,	%g3
	srax	%o4,	%g4,	%l5
	subcc	%l2,	0x0D6B,	%o0
	edge8l	%i5,	%i3,	%g6
	bvc	loop_2970
	fnor	%f22,	%f4,	%f26
	tsubcc	%i1,	%o3,	%l3
	set	0x0C, %l2
	sta	%f6,	[%l7 + %l2] 0x88
loop_2970:
	tleu	%xcc,	0x5
	brnz,a	%i7,	loop_2971
	xorcc	%i4,	0x007F,	%o6
	sra	%o1,	0x19,	%i0
	for	%f26,	%f20,	%f14
loop_2971:
	or	%i6,	%l6,	%g2
	wr	%g0,	0x80,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	edge8n	%i2,	%g1,	%l0
	fcmpgt32	%f10,	%f14,	%o2
	fmovdvc	%xcc,	%f25,	%f18
	sethi	0x0A9F,	%l1
	nop
	setx loop_2972, %l0, %l1
	jmpl %l1, %o5
	array32	%l4,	%o7,	%g7
	bleu,pt	%icc,	loop_2973
	tsubcctv	%g3,	%o4,	%g4
loop_2972:
	bpos,a	loop_2974
	movpos	%icc,	%g5,	%l2
loop_2973:
	nop
	add	%l7,	0x7C,	%l6
	wr	%g0,	0x0c,	%asi
	casa	[%l6] %asi,	%o0,	%l5
loop_2974:
	nop
	wr	%g0,	0x11,	%asi
	ldsha	[%l7 + 0x1E] %asi,	%i3
	ldd	[%l7 + 0x38],	%g6
	wr	%g0,	0x04,	%asi
	ldsba	[%l7 + 0x0C] %asi,	%i1
	xor	%o3,	0x13F5,	%i5
	bne	loop_2975
	movcs	%icc,	%i7,	%i4
	edge32l	%l3,	%o1,	%i0
	fnot2	%f24,	%f0
loop_2975:
	array8	%o6,	%i6,	%l6
	fmovrdne	%i2,	%f12,	%f26
	movge	%xcc,	%g1,	%l0
	fpack32	%f26,	%f26,	%f18
	edge16ln	%o2,	%l1,	%g2
	alignaddr	%l4,	%o7,	%g7
	sdivx	%g3,	0x159E,	%o4
	ba,pn	%xcc,	loop_2976
	fbuge,a	%fcc3,	loop_2977
	fmovscs	%xcc,	%f4,	%f22
	edge16ln	%g4,	%g5,	%l2
loop_2976:
	nop
	set	0x78, %o4
	sta	%f2,	[%l7 + %o4] 0x15
loop_2977:
	mulscc	%o5,	%o0,	%i3
	fpadd16s	%f0,	%f28,	%f8
	fmovsneg	%icc,	%f7,	%f9
	subcc	%g6,	%l5,	%o3
	tl	%xcc,	0x3
	membar	#Sync
	set	0x40, %g5
	ldda	[%l7 + %g5] 0xf9,	%f16
	stx	%i1,	[%l7 + 0x18]
	fpsub16s	%f3,	%f10,	%f30
	stx	%i5,	[%l7 + 0x30]
	andncc	%i4,	%i7,	%o1
	fmovdleu	%icc,	%f17,	%f17
	fmovrdlz	%i0,	%f18,	%f22
	movcs	%icc,	%o6,	%l3
	edge8l	%l6,	%i6,	%i2
	fbo	%fcc1,	loop_2978
	movleu	%icc,	%l0,	%o2
	wr	%g0,	0x81,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
loop_2978:
	tne	%xcc,	0x0
	fsrc1	%f0,	%f18
	fmovdne	%icc,	%f16,	%f10
	bne,a,pt	%xcc,	loop_2979
	edge32	%l1,	%g2,	%g1
	tvs	%xcc,	0x5
	prefetch	[%l7 + 0x0C],	 0x0
loop_2979:
	nop
	set	0x44, %o7
	lduwa	[%l7 + %o7] 0x89,	%o7
	te	%xcc,	0x5
	and	%l4,	0x066F,	%g3
	movg	%xcc,	%o4,	%g7
	sdiv	%g4,	0x17B9,	%g5
	std	%l2,	[%l7 + 0x38]
	nop
	set	0x30, %l4
	stw	%o5,	[%l7 + %l4]
	bvc	loop_2980
	andn	%i3,	%o0,	%g6
	mova	%icc,	%l5,	%i1
	movneg	%xcc,	%i5,	%o3
loop_2980:
	ldsh	[%l7 + 0x08],	%i4
	fmul8x16	%f4,	%f12,	%f6
	fbuge	%fcc2,	loop_2981
	movn	%icc,	%o1,	%i0
	fmovsle	%xcc,	%f9,	%f10
	fcmpeq32	%f8,	%f6,	%i7
loop_2981:
	sub	%o6,	0x1E03,	%l3
	fcmpne32	%f10,	%f22,	%i6
	umul	%i2,	0x189C,	%l6
	fmovsleu	%xcc,	%f19,	%f13
	fble	%fcc2,	loop_2982
	orcc	%l0,	%l1,	%g2
	fmovdg	%xcc,	%f3,	%f9
	bne,a	%xcc,	loop_2983
loop_2982:
	bpos,a	loop_2984
	edge8l	%g1,	%o2,	%l4
	tcc	%xcc,	0x0
loop_2983:
	udivcc	%o7,	0x0AEB,	%o4
loop_2984:
	movn	%icc,	%g3,	%g7
	edge8ln	%g5,	%l2,	%o5
	fsrc1	%f30,	%f8
	udiv	%g4,	0x1276,	%o0
	movrlz	%g6,	0x10D,	%i3
	ba,pn	%icc,	loop_2985
	tge	%icc,	0x5
	movcs	%xcc,	%i1,	%i5
	fmovdcc	%xcc,	%f28,	%f2
loop_2985:
	mulx	%l5,	0x17CA,	%o3
	bl,a	loop_2986
	ta	%icc,	0x4
	fabsd	%f10,	%f26
	tcs	%xcc,	0x4
loop_2986:
	nop

	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 0:
!
!	Type l   	: 2728
!	Type x   	: 1293
!	Type cti   	: 2986
!	Type f   	: 4471
!	Type i   	: 13522
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


	EXIT_GOOD	/* test finish  */

/************************************************************************
   Test case data start
 ************************************************************************/
.data
user_data_start:
scratch_area:
.word 0xF61F3688
.word 0x158D6494
.word 0x00403F49
.word 0x6C8DE0F5
.word 0x47783B21
.word 0x453EA478
.word 0x1640989B
.word 0xD7E0B18A
.word 0xD27ABC68
.word 0x17784293
.word 0x767E77B0
.word 0x538BDACE
.word 0x90149A16
.word 0x4F9997EC
.word 0xA1A8D0E1
.word 0x8DF31403
.word 0x511F7AC8
.word 0xC926028B
.word 0xDFC7F1D5
.word 0x51E7C06D
.word 0xF1C163D6
.word 0x19540C70
.word 0x50596FC8
.word 0x02B1534E
.word 0x85BF6329
.word 0x2F5C2152
.word 0x17E34CA6
.word 0xD0618236
.word 0x99A7D201
.word 0xA8E25E1D
.word 0x96185976
.word 0xE46E1E90
.word 0x480F292A
.word 0xADABD69F
.word 0x2DAB0C38
.word 0xAD2726B5
.word 0x12FCC1DC
.word 0xC4B1E784
.word 0x40F46695
.word 0xB1852352
.word 0x9C4683CE
.word 0x07FD91C2
.word 0xAE99D755
.word 0x29AA015A
.word 0x02ED9649
.word 0x04EAE2AA
.word 0x9BB7FEC0
.word 0x98250C32
.word 0xBAF134A9
.word 0x1FF8C2B2
.word 0x8045492A
.word 0x1837B4B7
.word 0xA7A121D3
.word 0x760890E2
.word 0xBA1CE942
.word 0x3B299ED3
.word 0x713996DF
.word 0x75B451A1
.word 0xE62FE8D6
.word 0x84E3AF46
.word 0xF5B97C9A
.word 0x19A143A7
.word 0xA1C4F62D
.word 0xACE024BC
.end
