/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: isa3_basic3_f6.s
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
.ident "Using Instruction Hash for Focus :$Id: isa3_basic3_f6.s,v 1.1 2007/05/11 17:22:23 drp Exp $"
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
	setx	0x636571567048D83B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x0]
	ldx	[%l7 + 0x0],	%fsr
!
! Thread 0 Start
!
main_t0:

	!# Initialize registers ..

	!# Global registers
	set	0x1,	%g1
	set	0xD,	%g2
	set	0xA,	%g3
	set	0x2,	%g4
	set	0xB,	%g5
	set	0x3,	%g6
	set	0xE,	%g7
	!# Input registers
	set	-0x7,	%i0
	set	-0xE,	%i1
	set	-0x3,	%i2
	set	-0x3,	%i3
	set	-0xC,	%i4
	set	-0x7,	%i5
	set	-0x1,	%i6
	set	-0x0,	%i7
	!# Local registers
	set	0x54FAC358,	%l0
	set	0x137FD263,	%l1
	set	0x3884D623,	%l2
	set	0x5DB2B0B4,	%l3
	set	0x0A1EC2E0,	%l4
	set	0x0256CE84,	%l5
	set	0x345DBE86,	%l6
	!# Output registers
	set	0x0B92,	%o0
	set	-0x1A92,	%o1
	set	-0x0CCA,	%o2
	set	-0x0BCA,	%o3
	set	0x1C38,	%o4
	set	0x0C97,	%o5
	set	-0x02DA,	%o6
	set	-0x1802,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x7705CEF9A744F89E)
	INIT_TH_FP_REG(%l7,%f2,0x5D536808741939F2)
	INIT_TH_FP_REG(%l7,%f4,0xD35464C2A54438A3)
	INIT_TH_FP_REG(%l7,%f6,0x537E996DFCC5C221)
	INIT_TH_FP_REG(%l7,%f8,0x0CAFBA8699BCD732)
	INIT_TH_FP_REG(%l7,%f10,0x8BB0979638E8AFD3)
	INIT_TH_FP_REG(%l7,%f12,0x4AA3023B95AC869B)
	INIT_TH_FP_REG(%l7,%f14,0xE1160FC5B54C3338)
	INIT_TH_FP_REG(%l7,%f16,0x4BBE7BAAF93A360B)
	INIT_TH_FP_REG(%l7,%f18,0xFCC24B4A3DEA9FF6)
	INIT_TH_FP_REG(%l7,%f20,0xF9100E82BA1659DA)
	INIT_TH_FP_REG(%l7,%f22,0xCFE54C75C67903F5)
	INIT_TH_FP_REG(%l7,%f24,0xA3E7016F1C59FE42)
	INIT_TH_FP_REG(%l7,%f26,0x8ED64E5B3E515C70)
	INIT_TH_FP_REG(%l7,%f28,0xD0FEF8244CBEA24A)
	INIT_TH_FP_REG(%l7,%f30,0x2338CEDD282DE63D)
	!# Other state
	
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr


	!# Execute Main Diag ..

	edge16ln	%i3,	%g4,	%i6
	tcc	%xcc,	0x3
	mova	%xcc,	%g3,	%l3
	umulcc	%g7,	0x00F7,	%i1
	set	0x2C, %i7
	lduwa	[%l7 + %i7] 0x89,	%g2
	fbe,a	%fcc2,	loop_1
	mulx	%o7,	%l2,	%l5
	set	0x78, %i2
	ldswa	[%l7 + %i2] 0x19,	%g5
loop_1:
	taddcc	%l6,	%l1,	%o4
	edge16ln	%o1,	%g1,	%i5
	tsubcctv	%l0,	0x188E,	%o3
	set	0x3A, %i3
	ldsba	[%l7 + %i3] 0x04,	%i2
	membar	0x0A
	ta	%icc,	0x7
	st	%f2,	[%l7 + 0x48]
	orncc	%i7,	%o0,	%g6
	fbne,a	%fcc2,	loop_2
	addc	%o6,	0x095C,	%l4
	fands	%f20,	%f19,	%f9
	fcmpd	%fcc1,	%f14,	%f12
loop_2:
	tpos	%icc,	0x6
	fcmple32	%f4,	%f22,	%i4
	te	%icc,	0x0
	edge8	%o2,	%i0,	%i3
	tgu	%xcc,	0x7
	brnz	%g4,	loop_3
	tl	%icc,	0x5
	movrlez	%i6,	0x0B5,	%o5
	fmovdl	%icc,	%f10,	%f27
loop_3:
	edge32ln	%l3,	%g3,	%i1
	xnorcc	%g2,	%g7,	%o7
	movrne	%l2,	%g5,	%l6
	faligndata	%f8,	%f2,	%f26
	brgz,a	%l1,	loop_4
	stw	%l5,	[%l7 + 0x0C]
	bn,pn	%xcc,	loop_5
	bshuffle	%f18,	%f14,	%f22
loop_4:
	bcs,pt	%xcc,	loop_6
	andcc	%o1,	%o4,	%g1
loop_5:
	brnz	%l0,	loop_7
	fpmerge	%f22,	%f24,	%f18
loop_6:
	tvs	%icc,	0x4
	brgz	%o3,	loop_8
loop_7:
	movvs	%xcc,	%i5,	%i2
	siam	0x1
	fpadd16	%f14,	%f12,	%f10
loop_8:
	movn	%xcc,	%o0,	%i7
	wr	%g0,	0x04,	%asi
	lduha	[%l7 + 0x5C] %asi,	%g6
	fbg	%fcc1,	loop_9
	movrlez	%o6,	0x332,	%l4
	ldd	[%l7 + 0x10],	%o2
	edge8l	%i0,	%i4,	%g4
loop_9:
	bleu,a,pt	%icc,	loop_10
	fbo,a	%fcc2,	loop_11
	fpack32	%f28,	%f16,	%f18
	tvs	%icc,	0x3
loop_10:
	fmovsa	%icc,	%f14,	%f22
loop_11:
	subccc	%i6,	0x153F,	%o5
	fbne,a	%fcc1,	loop_12
	addccc	%l3,	0x1A64,	%g3
	alignaddr	%i1,	%g2,	%g7
	fmovrslz	%o7,	%f21,	%f4
loop_12:
	tgu	%icc,	0x0
	umul	%l2,	%i3,	%l6
	edge16l	%l1,	%l5,	%g5
	movneg	%icc,	%o1,	%g1
	movvc	%icc,	%l0,	%o3
	subccc	%o4,	%i5,	%i2
	sra	%o0,	%g6,	%i7
	tpos	%xcc,	0x5
	array8	%o6,	%l4,	%i0
	srl	%o2,	%i4,	%g4
	set	0x78, %o4
	stda	%i6,	[%l7 + %o4] 0x27
	membar	#Sync
	popc	0x0568,	%l3
	fble	%fcc0,	loop_13
	fmovrsne	%o5,	%f13,	%f3
	tvs	%xcc,	0x5
	fand	%f20,	%f6,	%f30
loop_13:
	movre	%g3,	0x1E9,	%i1
	tne	%icc,	0x1
	fandnot2s	%f6,	%f18,	%f25
	udivx	%g2,	0x07D1,	%g7
	bne	loop_14
	fands	%f16,	%f2,	%f28
	sdivx	%o7,	0x119D,	%l2
	bcs,pt	%icc,	loop_15
loop_14:
	mulscc	%l6,	0x03A3,	%i3
	nop
	setx	loop_16,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	sllx	%l5,	%l1,	%g5
loop_15:
	tleu	%xcc,	0x2
	movcs	%icc,	%g1,	%l0
loop_16:
	udiv	%o1,	0x153D,	%o3
	srlx	%i5,	0x09,	%i2
	fandnot2s	%f3,	%f5,	%f0
	fmovde	%xcc,	%f12,	%f20
	tsubcc	%o4,	%o0,	%i7
	fcmped	%fcc1,	%f0,	%f0
	xorcc	%g6,	0x1A40,	%o6
	movvc	%icc,	%l4,	%i0
	std	%f18,	[%l7 + 0x28]
	andncc	%i4,	%g4,	%i6
	edge32	%o2,	%o5,	%g3
	xorcc	%i1,	%g2,	%g7
	fmovsl	%icc,	%f2,	%f0
	edge8n	%o7,	%l2,	%l3
	te	%xcc,	0x6
	alignaddrl	%l6,	%i3,	%l5
	xnorcc	%g5,	0x04F7,	%l1
	set	0x18, %i5
	ldstuba	[%l7 + %i5] 0x89,	%l0
	movrne	%g1,	%o3,	%i5
	wr	%g0,	0x0c,	%asi
	ldsha	[%l7 + 0x6E] %asi,	%o1
	fmuld8sux16	%f6,	%f10,	%f0
	nop
	setx loop_17, %l0, %l1
	jmpl %l1, %i2
	or	%o0,	%i7,	%g6
	ta	%xcc,	0x5
	movcc	%xcc,	%o4,	%l4
loop_17:
	edge8	%i0,	%o6,	%i4
	sdivx	%i6,	0x1401,	%g4
	movpos	%xcc,	%o2,	%g3
	addcc	%o5,	%g2,	%i1
	popc	0x0871,	%g7
	smul	%o7,	%l2,	%l3
	xor	%l6,	0x0D56,	%i3
	fmovsle	%xcc,	%f1,	%f22
	fmul8x16	%f12,	%f20,	%f16
	fbug,a	%fcc3,	loop_18
	fnegs	%f23,	%f1
	fmovscc	%xcc,	%f31,	%f27
	set	0x118, %l5
	nop 	! 	stxa	%l5,	[%g0 + %l5] 0x40 ripped by fixASI40.pl
loop_18:
	fpsub32	%f12,	%f10,	%f22
	movvc	%icc,	%g5,	%l1
	fmovd	%f24,	%f8
	fsrc1	%f12,	%f0
	edge32l	%l0,	%o3,	%g1
	movg	%xcc,	%i5,	%i2
	orn	%o0,	%o1,	%i7
	fbge,a	%fcc0,	loop_19
	srax	%g6,	%l4,	%i0
	tne	%xcc,	0x3
	andncc	%o6,	%i4,	%i6
loop_19:
	nop
	wr	%g0,	0x88,	%asi
	stda	%g4,	[%l7 + 0x18] %asi
	fzeros	%f7
	set	0x68, %o5
	stha	%o2,	[%l7 + %o5] 0x15
	fbul,a	%fcc1,	loop_20
	tpos	%xcc,	0x2
	mulx	%o4,	%o5,	%g3
	tcc	%icc,	0x5
loop_20:
	bn,a	%icc,	loop_21
	mulscc	%g2,	%g7,	%o7
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
loop_21:
	movcc	%xcc,	%l2,	%i1
	edge16n	%l3,	%i3,	%l5
	set	0x74, %g7
	stwa	%l6,	[%l7 + %g7] 0x89
	array16	%g5,	%l1,	%o3
	ldx	[%l7 + 0x68],	%l0
	bg	%xcc,	loop_22
	array32	%i5,	%i2,	%g1
	taddcctv	%o1,	0x148F,	%o0
	edge8ln	%g6,	%l4,	%i7
loop_22:
	edge32n	%o6,	%i0,	%i6
	udivx	%g4,	0x085A,	%o2
	subc	%i4,	0x11A1,	%o5
	nop
	set	0x4F, %i1
	ldsb	[%l7 + %i1],	%g3
	stx	%g2,	[%l7 + 0x48]
	tneg	%xcc,	0x6
	brnz,a	%g7,	loop_23
	udiv	%o4,	0x1EA3,	%o7
	fmovscc	%xcc,	%f8,	%f8
	pdist	%f12,	%f2,	%f12
loop_23:
	addc	%l2,	%i1,	%l3
	fbu,a	%fcc1,	loop_24
	movre	%i3,	%l5,	%l6
	fbo,a	%fcc0,	loop_25
	sdiv	%g5,	0x1997,	%l1
loop_24:
	nop
	set	0x31, %g5
	ldsba	[%l7 + %g5] 0x88,	%o3
loop_25:
	movrne	%i5,	0x184,	%l0
	subcc	%g1,	%o1,	%i2
	lduh	[%l7 + 0x50],	%g6
	bcc,pn	%icc,	loop_26
	sdiv	%l4,	0x0058,	%i7
	tcc	%icc,	0x4
	wr	%g0,	0x89,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
loop_26:
	sllx	%o0,	%o6,	%i0
	tgu	%xcc,	0x1
	taddcctv	%g4,	0x0A89,	%i6
	wr	%g0,	0x80,	%asi
	lda	[%l7 + 0x7C] %asi,	%f12
	brgez,a	%o2,	loop_27
	fmovrdgez	%i4,	%f0,	%f2
	for	%f10,	%f18,	%f0
	movcs	%icc,	%o5,	%g2
loop_27:
	tvc	%xcc,	0x5
	set	0x10, %l2
	lduha	[%l7 + %l2] 0x80,	%g3
	sdivx	%g7,	0x1355,	%o4
	umul	%o7,	0x18BB,	%l2
	fnor	%f0,	%f20,	%f4
	mulscc	%l3,	%i1,	%l5
	sllx	%l6,	0x0A,	%i3
	mulscc	%l1,	%g5,	%o3
	wr	%g0,	0x23,	%asi
	stxa	%l0,	[%l7 + 0x68] %asi
	membar	#Sync
	alignaddr	%g1,	%i5,	%o1
	alignaddrl	%i2,	%l4,	%i7
	tne	%xcc,	0x1
	srl	%g6,	0x03,	%o6
	fbu	%fcc0,	loop_28
	fpsub16s	%f29,	%f29,	%f27
	brgz	%i0,	loop_29
	subccc	%o0,	%i6,	%g4
loop_28:
	prefetch	[%l7 + 0x0C],	 0x0
	popc	0x055A,	%o2
loop_29:
	movleu	%xcc,	%i4,	%o5
	fnot1s	%f27,	%f12
	bn,a	loop_30
	fba,a	%fcc1,	loop_31
	srl	%g2,	0x19,	%g7
	set	0x14, %g2
	stha	%o4,	[%l7 + %g2] 0xea
	membar	#Sync
loop_30:
	nop
	set	0x18, %g6
	lduwa	[%l7 + %g6] 0x10,	%g3
loop_31:
	smul	%o7,	0x1A4A,	%l3
	movrlez	%i1,	%l2,	%l6
	ld	[%l7 + 0x1C],	%f0
	fabss	%f23,	%f23
	addc	%i3,	%l5,	%g5
	bg,pt	%xcc,	loop_32
	fnor	%f4,	%f16,	%f0
	movre	%o3,	0x207,	%l1
	andn	%g1,	%i5,	%l0
loop_32:
	fmovdvc	%icc,	%f21,	%f10
	orncc	%i2,	0x0390,	%o1
	fandnot2s	%f9,	%f31,	%f27
	movne	%icc,	%l4,	%g6
	tcs	%icc,	0x5
	move	%icc,	%o6,	%i7
	ldd	[%l7 + 0x60],	%o0
	edge32l	%i0,	%i6,	%g4
	taddcctv	%i4,	%o5,	%g2
	fbg	%fcc1,	loop_33
	sllx	%g7,	0x1C,	%o4
	fbue	%fcc0,	loop_34
	tpos	%xcc,	0x2
loop_33:
	umul	%o2,	%o7,	%g3
	fbe,a	%fcc3,	loop_35
loop_34:
	sethi	0x03AD,	%i1
	stbar
	movrlez	%l2,	%l3,	%i3
loop_35:
	edge16n	%l5,	%g5,	%o3
	alignaddr	%l1,	%l6,	%g1
	ldd	[%l7 + 0x18],	%l0
	sllx	%i5,	%o1,	%i2
	movrne	%g6,	0x151,	%l4
	ld	[%l7 + 0x38],	%f10
	sir	0x0280
	andn	%i7,	%o0,	%o6
	edge32l	%i6,	%g4,	%i0
	siam	0x2
	fmul8ulx16	%f20,	%f26,	%f20
	wr	%g0,	0x80,	%asi
	ldxa	[%l7 + 0x10] %asi,	%i4
	wr	%g0,	0x19,	%asi
	ldstuba	[%l7 + 0x31] %asi,	%o5
	movneg	%icc,	%g7,	%o4
	udiv	%g2,	0x1D68,	%o2
	sdiv	%g3,	0x19BE,	%i1
	ldd	[%l7 + 0x08],	%f10
	set	0x44, %o3
	ldswa	[%l7 + %o3] 0x18,	%l2
	fornot2s	%f10,	%f9,	%f26
	movvs	%icc,	%l3,	%i3
	fbule,a	%fcc3,	loop_36
	umul	%l5,	0x1294,	%g5
	andn	%o7,	%o3,	%l1
	orn	%l6,	%g1,	%l0
loop_36:
	nop
	wr	%g0,	0x19,	%asi
	swapa	[%l7 + 0x78] %asi,	%o1
	bpos,pn	%xcc,	loop_37
	swap	[%l7 + 0x10],	%i5
	add	%l7,	0x14,	%l6
	wr	%g0,	0x04,	%asi
	lda	[%l6] %asi,	%g6
	casa	[%l6] %asi,	%g6,	%i2
loop_37:
	edge16ln	%l4,	%o0,	%i7
	bgu,a,pn	%xcc,	loop_38
	orncc	%o6,	%g4,	%i0
	edge32l	%i6,	%i4,	%g7
	fbg	%fcc0,	loop_39
loop_38:
	sdivcc	%o5,	0x097A,	%g2
	ta	%icc,	0x3
	lduh	[%l7 + 0x16],	%o2
loop_39:
	edge16l	%g3,	%i1,	%o4
	ld	[%l7 + 0x68],	%f14
	nop
	set	0x42, %l1
	sth	%l2,	[%l7 + %l1]
	fornot1	%f16,	%f10,	%f14
	movrne	%l3,	%i3,	%l5
	sth	%o7,	[%l7 + 0x26]
	fnot1	%f30,	%f4
	set	0x48, %o1
	stxa	%o3,	[%l7 + %o1] 0x11
	edge32l	%g5,	%l6,	%l1
	brnz	%g1,	loop_40
	movrne	%o1,	%l0,	%g6
	set	0x40, %l3
	lduha	[%l7 + %l3] 0x11,	%i5
loop_40:
	nop
	wr	%g0,	0x11,	%asi
	ldsha	[%l7 + 0x74] %asi,	%l4
	tpos	%xcc,	0x7
	fmovsvs	%xcc,	%f14,	%f17
	fbne	%fcc1,	loop_41
	brnz	%o0,	loop_42
	bvs	%icc,	loop_43
	fcmpne16	%f16,	%f14,	%i2
loop_41:
	sll	%i7,	0x03,	%o6
loop_42:
	fcmpgt32	%f26,	%f26,	%i0
loop_43:
	subcc	%g4,	0x15F8,	%i4
	fsrc2s	%f30,	%f10
	wr	%g0,	0x11,	%asi
	lduha	[%l7 + 0x66] %asi,	%i6
	lduh	[%l7 + 0x20],	%o5
	sub	%g2,	0x045D,	%o2
	movrgez	%g3,	0x291,	%g7
	xorcc	%o4,	%i1,	%l2
	movcs	%xcc,	%i3,	%l3
	srlx	%l5,	0x1C,	%o7
	edge8l	%o3,	%g5,	%l1
	movleu	%icc,	%g1,	%l6
	fbn	%fcc0,	loop_44
	andn	%o1,	0x1E9C,	%l0
	ldx	[%l7 + 0x38],	%g6
	udivx	%l4,	0x0139,	%i5
loop_44:
	stw	%o0,	[%l7 + 0x78]
	fnegs	%f8,	%f13
	stbar
	fmul8x16al	%f16,	%f5,	%f22
	nop
	set	0x4C, %i0
	ldsw	[%l7 + %i0],	%i7
	udivcc	%i2,	0x1620,	%o6
	fbule,a	%fcc2,	loop_45
	ta	%icc,	0x7
	array16	%g4,	%i4,	%i6
	movrgz	%o5,	0x30A,	%i0
loop_45:
	taddcctv	%o2,	0x023F,	%g3
	fmul8x16au	%f27,	%f30,	%f10
	movleu	%xcc,	%g2,	%g7
	sllx	%o4,	%i1,	%i3
	orn	%l3,	%l2,	%l5
	mulx	%o7,	0x0E16,	%g5
	fbo,a	%fcc2,	loop_46
	fbue,a	%fcc3,	loop_47
	umulcc	%l1,	%g1,	%o3
	edge32l	%l6,	%o1,	%l0
loop_46:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_47:
	ldx	[%l7 + 0x78],	%g6
	sub	%l4,	0x0150,	%o0
	set	0x11, %g4
	ldsba	[%l7 + %g4] 0x15,	%i5
	movpos	%xcc,	%i2,	%o6
	fblg,a	%fcc3,	loop_48
	ldsw	[%l7 + 0x64],	%g4
	bpos,a	loop_49
	sub	%i4,	0x17CB,	%i6
loop_48:
	fmovrsgz	%i7,	%f19,	%f0
	bl,a	%icc,	loop_50
loop_49:
	subc	%o5,	0x0F10,	%i0
	srax	%o2,	0x0A,	%g3
	edge16ln	%g7,	%g2,	%i1
loop_50:
	nop
	set	0x28, %o2
	stxa	%i3,	[%l7 + %o2] 0x23
	membar	#Sync
	tge	%icc,	0x5
	fmovsne	%xcc,	%f6,	%f12
	fmovse	%xcc,	%f2,	%f16
	array32	%l3,	%o4,	%l5
	fbg,a	%fcc3,	loop_51
	udivx	%l2,	0x0D7C,	%o7
	fmovspos	%xcc,	%f9,	%f1
	andncc	%g5,	%g1,	%l1
loop_51:
	nop
	set	0x40, %o6
	stda	%f0,	[%l7 + %o6] 0x19
	smul	%l6,	%o1,	%o3
	array32	%g6,	%l4,	%o0
	fpsub16s	%f5,	%f17,	%f21
	movgu	%xcc,	%i5,	%l0
	bl,pt	%xcc,	loop_52
	tcc	%icc,	0x3
	xorcc	%i2,	0x08DF,	%g4
	be,a	loop_53
loop_52:
	fmovdvs	%icc,	%f29,	%f15
	udivcc	%o6,	0x15C0,	%i4
	movne	%icc,	%i7,	%i6
loop_53:
	array32	%i0,	%o2,	%o5
	add	%l7,	0x28,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%g7
	casxa	[%l6] %asi,	%g7,	%g3
	fmovsne	%icc,	%f0,	%f4
	edge8ln	%i1,	%i3,	%g2
	sdivcc	%l3,	0x0446,	%l5
	sllx	%o4,	%l2,	%o7
	flush	%l7 + 0x5C
	lduh	[%l7 + 0x72],	%g1
	be,a	loop_54
	std	%g4,	[%l7 + 0x30]
	tsubcctv	%l1,	%l6,	%o3
	umul	%g6,	0x1937,	%o1
loop_54:
	movcc	%xcc,	%o0,	%i5
	fpadd32	%f6,	%f18,	%f6
	fcmped	%fcc1,	%f12,	%f14
	fors	%f16,	%f11,	%f0
	addccc	%l0,	0x03C7,	%l4
	fbge	%fcc1,	loop_55
	stw	%i2,	[%l7 + 0x48]
	wr	%g0,	0x2b,	%asi
	stda	%o6,	[%l7 + 0x18] %asi
	membar	#Sync
loop_55:
	fpack16	%f26,	%f28
	tg	%icc,	0x5
	andncc	%g4,	%i7,	%i4
	edge8ln	%i0,	%i6,	%o5
	prefetch	[%l7 + 0x24],	 0x3
	brz,a	%g7,	loop_56
	sethi	0x0018,	%g3
	movcc	%icc,	%o2,	%i1
	edge8l	%g2,	%i3,	%l5
loop_56:
	tle	%icc,	0x7
	array8	%l3,	%l2,	%o4
	fmovsa	%xcc,	%f21,	%f14
	smul	%o7,	%g1,	%g5
	movgu	%xcc,	%l1,	%l6
	udivcc	%g6,	0x1817,	%o1
	edge32	%o0,	%i5,	%o3
	tg	%xcc,	0x7
	ldub	[%l7 + 0x14],	%l4
	st	%f23,	[%l7 + 0x58]
	bcc,pt	%icc,	loop_57
	sth	%l0,	[%l7 + 0x64]
	tsubcctv	%i2,	%o6,	%g4
	edge8ln	%i7,	%i0,	%i6
loop_57:
	fandnot2	%f20,	%f8,	%f12
	fandnot2	%f16,	%f14,	%f10
	edge32l	%i4,	%o5,	%g7
	mova	%icc,	%g3,	%o2
	tgu	%xcc,	0x4
	subccc	%g2,	0x169F,	%i3
	fmovscc	%xcc,	%f16,	%f2
	call	loop_58
	fmovdcs	%xcc,	%f16,	%f7
	fmovdgu	%icc,	%f2,	%f2
	fbg,a	%fcc2,	loop_59
loop_58:
	smulcc	%i1,	0x0104,	%l5
	edge32l	%l3,	%o4,	%l2
	ba,pn	%xcc,	loop_60
loop_59:
	sub	%g1,	%o7,	%l1
	fmovrslz	%g5,	%f0,	%f13
	sllx	%g6,	0x05,	%l6
loop_60:
	edge16n	%o1,	%o0,	%i5
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
	array16	%l4,	%l0,	%o3
	fmovrsgz	%i2,	%f28,	%f29
	tvs	%xcc,	0x2
loop_61:
	fbu	%fcc1,	loop_62
	sdivx	%o6,	0x0075,	%i7
	fmovsl	%icc,	%f18,	%f15
	brgz	%i0,	loop_63
loop_62:
	fbn,a	%fcc1,	loop_64
	add	%g4,	%i4,	%i6
	movvc	%xcc,	%g7,	%o5
loop_63:
	brlz	%o2,	loop_65
loop_64:
	fmovrde	%g3,	%f16,	%f10
	fmovrsne	%g2,	%f20,	%f2
	fbue,a	%fcc0,	loop_66
loop_65:
	fcmpgt32	%f14,	%f10,	%i3
	sra	%i1,	%l3,	%o4
	add	%l7,	0x40,	%l6
	wr	%g0,	0x19,	%asi
	casxa	[%l6] %asi,	%l2,	%g1
loop_66:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16ln	%o7,	%l1,	%g5
	popc	%g6,	%l5
	fmovscs	%icc,	%f30,	%f7
	subcc	%o1,	%o0,	%l6
	tn	%icc,	0x6
	movle	%xcc,	%l4,	%l0
	taddcctv	%i5,	0x13C4,	%i2
	stbar
	fpsub32s	%f14,	%f0,	%f13
	bvs,a,pn	%icc,	loop_67
	sdiv	%o3,	0x0012,	%o6
	fandnot1	%f4,	%f2,	%f8
	fpsub32	%f20,	%f26,	%f4
loop_67:
	movge	%icc,	%i7,	%i0
	sdivx	%i4,	0x1A6B,	%g4
	std	%f16,	[%l7 + 0x20]
	orn	%i6,	0x0DB1,	%o5
	fbue	%fcc0,	loop_68
	fpack32	%f10,	%f24,	%f22
	fbe	%fcc1,	loop_69
	fbu,a	%fcc0,	loop_70
loop_68:
	udiv	%g7,	0x1365,	%o2
	fabss	%f22,	%f17
loop_69:
	movcs	%xcc,	%g2,	%g3
loop_70:
	fba,a	%fcc0,	loop_71
	edge8ln	%i3,	%l3,	%o4
	subcc	%l2,	0x0AAF,	%g1
	edge32	%o7,	%l1,	%i1
loop_71:
	taddcctv	%g5,	%g6,	%l5
	smul	%o1,	%o0,	%l4
	edge16	%l6,	%l0,	%i2
	sir	0x0911
	udiv	%o3,	0x178F,	%o6
	taddcctv	%i5,	0x01B9,	%i7
	bleu,pt	%icc,	loop_72
	bne,pt	%xcc,	loop_73
	fbo,a	%fcc0,	loop_74
	bne,a,pn	%xcc,	loop_75
loop_72:
	bcs,a	%xcc,	loop_76
loop_73:
	movrne	%i0,	0x273,	%g4
loop_74:
	movl	%icc,	%i6,	%i4
loop_75:
	fbul	%fcc3,	loop_77
loop_76:
	tle	%xcc,	0x2
	movleu	%icc,	%g7,	%o2
	fmovsleu	%xcc,	%f1,	%f10
loop_77:
	umul	%o5,	0x05DB,	%g3
	fsrc2	%f10,	%f6
	sdivcc	%i3,	0x0A04,	%g2
	edge32n	%o4,	%l2,	%g1
	mulx	%l3,	0x0E71,	%o7
	fbuge	%fcc2,	loop_78
	nop
	setx loop_79, %l0, %l1
	jmpl %l1, %l1
	movcc	%xcc,	%g5,	%i1
	fmul8sux16	%f26,	%f10,	%f16
loop_78:
	srlx	%l5,	0x1C,	%g6
loop_79:
	fpack16	%f20,	%f6
	edge8l	%o0,	%l4,	%o1
	wr	%g0,	0x88,	%asi
	swapa	[%l7 + 0x54] %asi,	%l0
	udivcc	%i2,	0x0EC3,	%l6
	edge32ln	%o6,	%i5,	%i7
	umul	%o3,	0x091E,	%i0
	movre	%g4,	0x397,	%i4
	sir	0x0D7E
	edge16l	%g7,	%i6,	%o5
	orcc	%g3,	0x0753,	%o2
	fbul	%fcc2,	loop_80
	alignaddrl	%g2,	%o4,	%l2
	ldub	[%l7 + 0x64],	%i3
	fbg,a	%fcc0,	loop_81
loop_80:
	fbo,a	%fcc2,	loop_82
	be,a	%icc,	loop_83
	movcc	%icc,	%g1,	%o7
loop_81:
	fmovsg	%icc,	%f9,	%f1
loop_82:
	sdivcc	%l3,	0x01ED,	%l1
loop_83:
	edge8	%g5,	%i1,	%l5
	movle	%icc,	%o0,	%g6
	alignaddr	%l4,	%o1,	%l0
	edge16	%l6,	%o6,	%i5
	movvc	%xcc,	%i2,	%i7
	movle	%xcc,	%i0,	%g4
	sll	%o3,	0x08,	%i4
	fmovdleu	%icc,	%f31,	%f7
	bvs,pn	%icc,	loop_84
	bgu,pt	%icc,	loop_85
	fmovdn	%xcc,	%f23,	%f18
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_84:
	tsubcc	%i6,	%g7,	%o5
loop_85:
	move	%xcc,	%o2,	%g3
	fbn	%fcc0,	loop_86
	tcc	%xcc,	0x0
	fmovscc	%xcc,	%f26,	%f25
	array32	%o4,	%g2,	%l2
loop_86:
	faligndata	%f10,	%f30,	%f28
	st	%f19,	[%l7 + 0x30]
	taddcc	%g1,	%o7,	%i3
	fmul8x16	%f11,	%f24,	%f8
	membar	0x29
	std	%l2,	[%l7 + 0x30]
	set	0x30, %o0
	stba	%l1,	[%l7 + %o0] 0x81
	fmovdne	%icc,	%f15,	%f26
	fpadd32s	%f22,	%f22,	%f20
	sethi	0x0372,	%g5
	orn	%l5,	0x1599,	%i1
	nop
	set	0x34, %g1
	ldsw	[%l7 + %g1],	%g6
	xor	%l4,	0x0863,	%o0
	fble	%fcc1,	loop_87
	movleu	%icc,	%l0,	%l6
	smulcc	%o6,	%i5,	%o1
	fpsub16s	%f18,	%f29,	%f27
loop_87:
	mulscc	%i2,	0x1033,	%i0
	fzeros	%f23
	udivx	%g4,	0x0310,	%o3
	edge32	%i7,	%i4,	%g7
	wr	%g0,	0x0c,	%asi
	stha	%o5,	[%l7 + 0x52] %asi
	edge32ln	%o2,	%g3,	%i6
	fnegs	%f1,	%f19
	alignaddrl	%g2,	%l2,	%g1
	wr	%g0,	0x88,	%asi
	prefetcha	[%l7 + 0x20] %asi,	 0x1
	orncc	%o4,	%l3,	%l1
	ble	%icc,	loop_88
	nop
	setx loop_89, %l0, %l1
	jmpl %l1, %g5
	sdivcc	%i3,	0x08C4,	%l5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_88:
	addcc	%g6,	0x16D5,	%i1
loop_89:
	andn	%l4,	0x18AA,	%o0
	xorcc	%l6,	%l0,	%o6
	edge8	%i5,	%o1,	%i0
	fmovdvs	%xcc,	%f31,	%f1
	edge8	%g4,	%i2,	%i7
	movvc	%icc,	%o3,	%i4
	tsubcc	%g7,	0x0B59,	%o5
	tg	%icc,	0x1
	bge,a	%xcc,	loop_90
	move	%xcc,	%g3,	%o2
	fmovrde	%g2,	%f20,	%f14
	fpmerge	%f12,	%f2,	%f14
loop_90:
	bneg	%icc,	loop_91
	mova	%xcc,	%l2,	%g1
	stbar
	fmovrsne	%o7,	%f28,	%f16
loop_91:
	movneg	%xcc,	%o4,	%l3
	bshuffle	%f14,	%f20,	%f30
	movrlez	%i6,	0x0A7,	%l1
	nop
	set	0x5D, %g3
	ldsb	[%l7 + %g3],	%i3
	movrlez	%g5,	%l5,	%g6
	bpos,a,pn	%icc,	loop_92
	tl	%icc,	0x1
	fcmps	%fcc0,	%f26,	%f27
	fnot1s	%f11,	%f25
loop_92:
	fcmpne16	%f6,	%f2,	%l4
	fornot1	%f16,	%f24,	%f26
	bvc	%icc,	loop_93
	fmovdpos	%icc,	%f16,	%f3
	edge32ln	%o0,	%l6,	%i1
	andncc	%o6,	%i5,	%o1
loop_93:
	edge8	%i0,	%g4,	%i2
	xorcc	%i7,	%l0,	%o3
	fabsd	%f8,	%f16
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	taddcctv	%g7,	0x1638,	%o5
	subc	%g3,	0x1E99,	%o2
	andncc	%g2,	%i4,	%g1
	fpadd32s	%f15,	%f22,	%f5
	edge8	%l2,	%o7,	%o4
	movge	%xcc,	%l3,	%l1
	fandnot2	%f18,	%f12,	%f20
	subc	%i3,	0x1648,	%g5
	tvc	%icc,	0x2
	fbl	%fcc2,	loop_94
	bleu,a,pn	%icc,	loop_95
	be,a,pt	%icc,	loop_96
	tcs	%icc,	0x3
loop_94:
	andn	%i6,	0x1A4F,	%g6
loop_95:
	fornot2	%f8,	%f2,	%f28
loop_96:
	sdivcc	%l5,	0x1DE9,	%l4
	bneg,a,pt	%icc,	loop_97
	mulscc	%o0,	%l6,	%o6
	udivcc	%i5,	0x12B9,	%i1
	edge16n	%o1,	%i0,	%i2
loop_97:
	fmovdn	%icc,	%f11,	%f21
	movgu	%xcc,	%i7,	%l0
	fpackfix	%f20,	%f14
	edge16	%o3,	%g7,	%g4
	movrne	%o5,	0x0F2,	%o2
	sra	%g2,	%i4,	%g1
	call	loop_98
	edge8l	%g3,	%o7,	%o4
	xnorcc	%l2,	0x0D72,	%l1
	srlx	%l3,	0x11,	%i3
loop_98:
	movg	%icc,	%g5,	%i6
	fmul8x16	%f3,	%f6,	%f18
	bg,a,pn	%icc,	loop_99
	movleu	%icc,	%l5,	%g6
	fabss	%f4,	%f28
	udivcc	%o0,	0x040A,	%l6
loop_99:
	xnor	%o6,	0x07A9,	%i5
	array32	%l4,	%i1,	%o1
	orcc	%i2,	%i0,	%i7
	tvc	%icc,	0x4
	fcmpgt16	%f20,	%f12,	%l0
	tne	%icc,	0x0
	tne	%xcc,	0x4
	fnegs	%f14,	%f25
	std	%o2,	[%l7 + 0x58]
	stx	%g4,	[%l7 + 0x60]
	fmovsn	%icc,	%f11,	%f7
	bvs,a	loop_100
	brgz	%o5,	loop_101
	orncc	%o2,	%g7,	%i4
	set	0x48, %o7
	stda	%g2,	[%l7 + %o7] 0xea
	membar	#Sync
loop_100:
	fbug,a	%fcc3,	loop_102
loop_101:
	umul	%g3,	%g1,	%o4
	wr	%g0,	0x81,	%asi
	ldxa	[%l7 + 0x58] %asi,	%l2
loop_102:
	fcmpeq16	%f26,	%f0,	%l1
	brz,a	%l3,	loop_103
	movvc	%xcc,	%i3,	%g5
	movneg	%xcc,	%o7,	%i6
	fmovrse	%g6,	%f31,	%f22
loop_103:
	tneg	%icc,	0x1
	set	0x40, %i6
	ldda	[%l7 + %i6] 0x18,	%f0
	addccc	%o0,	0x1E93,	%l5
	sra	%l6,	%i5,	%o6
	edge8	%i1,	%l4,	%i2
	fcmpd	%fcc1,	%f14,	%f18
	taddcctv	%i0,	%o1,	%l0
	tleu	%xcc,	0x2
	fblg,a	%fcc3,	loop_104
	tg	%xcc,	0x2
	fand	%f16,	%f16,	%f16
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_104:
	umulcc	%o3,	0x10FF,	%i7
	edge32n	%g4,	%o5,	%o2
	edge8l	%i4,	%g7,	%g3
	stw	%g1,	[%l7 + 0x58]
	movrne	%g2,	0x38F,	%o4
	tne	%xcc,	0x7
	tne	%icc,	0x0
	fcmped	%fcc2,	%f20,	%f30
	movleu	%icc,	%l2,	%l1
	xor	%i3,	0x007E,	%g5
	tvs	%icc,	0x0
	bg,a	%icc,	loop_105
	fmovdcc	%xcc,	%f3,	%f26
	edge8n	%l3,	%o7,	%i6
	fnegs	%f16,	%f2
loop_105:
	lduw	[%l7 + 0x74],	%o0
	edge8n	%g6,	%l6,	%i5
	fmovrse	%o6,	%f23,	%f5
	bl,pt	%xcc,	loop_106
	movrlz	%i1,	0x154,	%l4
	sethi	0x099D,	%i2
	orcc	%i0,	0x1C12,	%l5
loop_106:
	movn	%xcc,	%o1,	%l0
	set	0x09, %l4
	ldsba	[%l7 + %l4] 0x10,	%o3
	fbl	%fcc0,	loop_107
	umulcc	%g4,	%i7,	%o5
	fornot1	%f6,	%f30,	%f26
	wr	%g0,	0x80,	%asi
	swapa	[%l7 + 0x50] %asi,	%o2
loop_107:
	nop
	wr	%g0,	0x18,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	movrlz	%g7,	0x1A7,	%g3
	orn	%g1,	0x014F,	%g2
	fcmpgt32	%f30,	%f10,	%i4
	fornot2s	%f5,	%f26,	%f25
	ldub	[%l7 + 0x30],	%o4
	movneg	%icc,	%l2,	%l1
	sll	%i3,	%g5,	%o7
	or	%i6,	%l3,	%g6
	edge16l	%o0,	%l6,	%o6
	tne	%xcc,	0x1
	add	%i1,	%i5,	%l4
	bvs,a	loop_108
	umulcc	%i2,	0x184E,	%i0
	movcs	%icc,	%o1,	%l5
	movg	%xcc,	%l0,	%o3
loop_108:
	fnot2s	%f26,	%f28
	array32	%g4,	%o5,	%o2
	te	%icc,	0x5
	brlez	%i7,	loop_109
	addcc	%g7,	0x14F1,	%g3
	or	%g2,	0x1DE0,	%i4
	swap	[%l7 + 0x48],	%o4
loop_109:
	bne,a,pt	%icc,	loop_110
	tneg	%xcc,	0x0
	edge16n	%g1,	%l2,	%l1
	ba,a,pn	%xcc,	loop_111
loop_110:
	fbe,a	%fcc2,	loop_112
	orcc	%g5,	0x0C5F,	%i3
	movcs	%xcc,	%i6,	%o7
loop_111:
	add	%l3,	%o0,	%l6
loop_112:
	umul	%g6,	%o6,	%i5
	udivcc	%l4,	0x1628,	%i1
	sir	0x007D
	tle	%icc,	0x1
	mova	%icc,	%i0,	%o1
	st	%f14,	[%l7 + 0x40]
	fnot1	%f24,	%f12
	andncc	%l5,	%l0,	%o3
	movleu	%icc,	%g4,	%o5
	fbo,a	%fcc2,	loop_113
	movle	%icc,	%i2,	%o2
	fbge	%fcc1,	loop_114
	fmovscc	%xcc,	%f29,	%f23
loop_113:
	andcc	%i7,	%g7,	%g3
	fbug	%fcc2,	loop_115
loop_114:
	bvs	%xcc,	loop_116
	popc	0x0BF0,	%i4
	udiv	%o4,	0x01AD,	%g1
loop_115:
	nop
	set	0x6B, %l0
	ldsba	[%l7 + %l0] 0x88,	%l2
loop_116:
	fnot1s	%f15,	%f7
	subccc	%l1,	0x138C,	%g5
	bge,pn	%xcc,	loop_117
	sir	0x156D
	edge16l	%g2,	%i3,	%i6
	orncc	%l3,	0x1907,	%o0
loop_117:
	movvc	%xcc,	%o7,	%l6
	movrlez	%o6,	0x1EA,	%i5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpsub16	%f18,	%f16,	%f26
	movge	%xcc,	%g6,	%i1
	brlz,a	%l4,	loop_118
	andn	%o1,	0x09BD,	%i0
	te	%xcc,	0x7
	fbge	%fcc0,	loop_119
loop_118:
	tcc	%xcc,	0x3
	movrgez	%l0,	%l5,	%o3
	edge16l	%o5,	%i2,	%o2
loop_119:
	nop
	wr	%g0,	0x80,	%asi
	lda	[%l7 + 0x7C] %asi,	%f12
	edge16ln	%g4,	%i7,	%g3
	edge16n	%i4,	%o4,	%g7
	xnor	%l2,	%l1,	%g5
	flush	%l7 + 0x0C
	srlx	%g2,	0x12,	%g1
	umul	%i3,	%l3,	%o0
	tneg	%icc,	0x0
	fcmps	%fcc0,	%f24,	%f6
	edge16ln	%i6,	%l6,	%o6
	fmovdgu	%xcc,	%f21,	%f11
	fones	%f19
	fmovsne	%xcc,	%f29,	%f27
	movvs	%icc,	%i5,	%g6
	movle	%icc,	%o7,	%i1
	taddcctv	%l4,	0x038E,	%i0
	mulscc	%o1,	%l5,	%l0
	movvc	%xcc,	%o3,	%o5
	wr	%g0,	0x19,	%asi
	ldsba	[%l7 + 0x1A] %asi,	%i2
	membar	0x1E
	edge16l	%o2,	%g4,	%i7
	tne	%xcc,	0x4
	ldsb	[%l7 + 0x5B],	%i4
	movrne	%o4,	%g3,	%g7
	fbue,a	%fcc1,	loop_120
	popc	0x16E6,	%l2
	mova	%xcc,	%g5,	%l1
	ldstub	[%l7 + 0x6B],	%g1
loop_120:
	subccc	%i3,	0x1E43,	%l3
	fmovsvc	%xcc,	%f5,	%f18
	srax	%o0,	%g2,	%l6
	subc	%o6,	0x0A0A,	%i6
	subc	%g6,	0x09F6,	%o7
	lduh	[%l7 + 0x34],	%i5
	fbo	%fcc1,	loop_121
	fand	%f6,	%f18,	%f12
	mova	%xcc,	%i1,	%i0
	movne	%xcc,	%o1,	%l4
loop_121:
	stx	%l0,	[%l7 + 0x10]
	movn	%xcc,	%l5,	%o5
	movl	%icc,	%o3,	%i2
	fpadd32s	%f0,	%f1,	%f13
	fpadd32s	%f10,	%f4,	%f11
	movg	%xcc,	%g4,	%o2
	fone	%f16
	ba,pn	%icc,	loop_122
	fpack16	%f28,	%f7
	brgez,a	%i4,	loop_123
	sdivcc	%o4,	0x0B83,	%g3
loop_122:
	fpackfix	%f14,	%f6
	sll	%g7,	%i7,	%l2
loop_123:
	fands	%f12,	%f29,	%f23
	edge8ln	%l1,	%g5,	%i3
	fmovrde	%g1,	%f2,	%f18
	sll	%o0,	0x0F,	%g2
	fpsub16	%f20,	%f30,	%f14
	fabsd	%f20,	%f22
	fmovscc	%icc,	%f28,	%f11
	array32	%l3,	%o6,	%l6
	xnor	%g6,	0x0E28,	%o7
	srl	%i6,	0x1B,	%i5
	edge8ln	%i0,	%o1,	%l4
	movrgz	%i1,	%l0,	%l5
	smul	%o3,	%i2,	%g4
	movcs	%xcc,	%o2,	%i4
	ldstub	[%l7 + 0x5A],	%o5
	nop
	set	0x08, %i4
	ldd	[%l7 + %i4],	%f14
	andncc	%o4,	%g7,	%g3
	fpmerge	%f21,	%f29,	%f12
	movvc	%xcc,	%l2,	%i7
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
	brlez,a	%g5,	loop_125
	edge32ln	%i3,	%g1,	%o0
	fornot2	%f28,	%f10,	%f30
loop_124:
	brgz,a	%g2,	loop_126
loop_125:
	nop
	setx	loop_127,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fxor	%f2,	%f20,	%f26
	ba,a	loop_128
loop_126:
	tn	%icc,	0x5
loop_127:
	nop
	wr	%g0,	0x81,	%asi
	ldxa	[%l7 + 0x50] %asi,	%l3
loop_128:
	bne,pn	%icc,	loop_129
	or	%l1,	%l6,	%o6
	fmovdcs	%icc,	%f18,	%f0
	movre	%o7,	0x163,	%i6
loop_129:
	taddcc	%g6,	0x18F7,	%i0
	ta	%icc,	0x5
	movleu	%icc,	%o1,	%l4
	taddcc	%i5,	0x1998,	%i1
	tneg	%xcc,	0x0
	fcmps	%fcc0,	%f27,	%f22
	srlx	%l0,	%o3,	%l5
	fandnot2s	%f18,	%f2,	%f18
	movneg	%icc,	%i2,	%g4
	fmovspos	%icc,	%f5,	%f19
	fmovsle	%icc,	%f25,	%f29
	movge	%xcc,	%i4,	%o2
	sub	%o5,	%g7,	%o4
	edge32	%l2,	%g3,	%g5
	stw	%i7,	[%l7 + 0x54]
	udivcc	%i3,	0x0C17,	%o0
	edge32l	%g1,	%g2,	%l1
	brlz,a	%l3,	loop_130
	addcc	%o6,	0x0F76,	%o7
	siam	0x2
	movcc	%xcc,	%l6,	%g6
loop_130:
	nop
	set	0x68, %l6
	ldd	[%l7 + %l6],	%f24
	pdist	%f18,	%f24,	%f24
	movcs	%xcc,	%i0,	%i6
	add	%o1,	%i5,	%l4
	te	%icc,	0x3
	brgz,a	%i1,	loop_131
	tleu	%icc,	0x0
	movrgez	%l0,	0x236,	%l5
	brlz	%o3,	loop_132
loop_131:
	subcc	%i2,	%i4,	%o2
	fmovsg	%xcc,	%f11,	%f1
	alignaddr	%o5,	%g7,	%g4
loop_132:
	umulcc	%o4,	%l2,	%g3
	faligndata	%f6,	%f30,	%f10
	bgu,a,pn	%xcc,	loop_133
	nop
	setx	loop_134,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	add	%i7,	%i3,	%o0
	tg	%icc,	0x2
loop_133:
	tsubcc	%g1,	0x1138,	%g2
loop_134:
	fbul,a	%fcc2,	loop_135
	fabsd	%f24,	%f10
	ldsh	[%l7 + 0x6A],	%l1
	fmovde	%icc,	%f17,	%f21
loop_135:
	move	%icc,	%l3,	%o6
	tn	%icc,	0x2
	fmovrdlez	%g5,	%f30,	%f2
	ldd	[%l7 + 0x70],	%o6
	mulx	%l6,	0x1C1E,	%i0
	fnot2s	%f19,	%f23
	add	%i6,	%o1,	%i5
	set	0x18, %i7
	ldsha	[%l7 + %i7] 0x19,	%g6
	movle	%xcc,	%i1,	%l0
	srax	%l5,	0x1C,	%l4
	edge8ln	%i2,	%i4,	%o2
	set	0x20, %i2
	stda	%o4,	[%l7 + %i2] 0x81
	set	0x46, %o4
	ldstuba	[%l7 + %o4] 0x11,	%o3
	movneg	%xcc,	%g7,	%g4
	movre	%l2,	%g3,	%i7
	move	%icc,	%o4,	%i3
	movleu	%xcc,	%o0,	%g2
	fmuld8sux16	%f16,	%f9,	%f10
	edge8	%g1,	%l3,	%l1
	andn	%g5,	%o6,	%l6
	fmuld8ulx16	%f24,	%f24,	%f28
	movrlz	%o7,	0x393,	%i6
	orn	%i0,	%o1,	%i5
	fornot1s	%f4,	%f17,	%f27
	edge32ln	%g6,	%i1,	%l0
	flush	%l7 + 0x58
	bl,pt	%xcc,	loop_136
	edge32ln	%l5,	%l4,	%i2
	bshuffle	%f28,	%f20,	%f18
	st	%f31,	[%l7 + 0x14]
loop_136:
	lduw	[%l7 + 0x28],	%i4
	xorcc	%o2,	0x0048,	%o3
	fmovsgu	%xcc,	%f19,	%f17
	ta	%xcc,	0x6
	movgu	%xcc,	%o5,	%g4
	tl	%icc,	0x2
	sdivcc	%g7,	0x12F8,	%l2
	ldsh	[%l7 + 0x40],	%i7
	edge8l	%g3,	%i3,	%o0
	tsubcc	%g2,	%o4,	%l3
	tleu	%xcc,	0x2
	smul	%g1,	0x0E9D,	%l1
	srl	%o6,	0x14,	%g5
	fexpand	%f10,	%f12
	smulcc	%l6,	0x0CA4,	%o7
	siam	0x5
	movrgz	%i0,	%o1,	%i5
	std	%f6,	[%l7 + 0x70]
	alignaddr	%i6,	%i1,	%l0
	alignaddrl	%g6,	%l5,	%i2
	fcmped	%fcc0,	%f26,	%f14
	fmovrdgz	%i4,	%f2,	%f10
	fpadd16s	%f7,	%f19,	%f20
	sub	%l4,	%o3,	%o2
	movcs	%icc,	%g4,	%o5
	fxnors	%f26,	%f4,	%f12
	xor	%g7,	0x0A58,	%i7
	fmovsge	%icc,	%f24,	%f29
	edge32n	%g3,	%i3,	%o0
	bvs,pt	%icc,	loop_137
	fmovrdgez	%g2,	%f12,	%f8
	set	0x70, %i3
	swapa	[%l7 + %i3] 0x80,	%o4
loop_137:
	edge8n	%l2,	%g1,	%l3
	alignaddr	%o6,	%g5,	%l1
	orncc	%o7,	0x18F0,	%i0
	and	%o1,	%i5,	%l6
	fmovsvc	%icc,	%f3,	%f11
	bshuffle	%f24,	%f10,	%f14
	stw	%i6,	[%l7 + 0x10]
	movrgez	%l0,	0x212,	%i1
	bcs,a,pn	%icc,	loop_138
	movre	%g6,	0x3F6,	%l5
	nop
	setx loop_139, %l0, %l1
	jmpl %l1, %i2
	brnz	%i4,	loop_140
loop_138:
	fmovdneg	%xcc,	%f27,	%f24
	set	0x44, %l5
	lda	[%l7 + %l5] 0x19,	%f29
loop_139:
	nop
	set	0x6C, %i5
	ldswa	[%l7 + %i5] 0x81,	%l4
loop_140:
	st	%f16,	[%l7 + 0x20]
	fone	%f0
	sth	%o2,	[%l7 + 0x30]
	movrgez	%g4,	0x211,	%o5
	wr	%g0,	0x81,	%asi
	prefetcha	[%l7 + 0x18] %asi,	 0x2
	movre	%g7,	0x192,	%g3
	array8	%i3,	%o0,	%i7
	edge16l	%g2,	%l2,	%g1
	fornot2s	%f11,	%f25,	%f20
	movn	%icc,	%l3,	%o6
	movrgez	%g5,	0x2AF,	%l1
	set	0x37, %o5
	ldstuba	[%l7 + %o5] 0x18,	%o4
	andn	%o7,	0x0FB1,	%i0
	movle	%xcc,	%i5,	%o1
	fmovdpos	%icc,	%f7,	%f9
	umulcc	%l6,	0x1A16,	%l0
	fmovrslez	%i1,	%f15,	%f30
	taddcctv	%i6,	0x1BA6,	%l5
	stw	%g6,	[%l7 + 0x6C]
	fand	%f18,	%f18,	%f26
	edge32l	%i4,	%l4,	%o2
	subc	%i2,	0x0126,	%o5
	tl	%xcc,	0x5
	fcmple32	%f12,	%f6,	%g4
	umul	%o3,	0x0F53,	%g3
	sth	%i3,	[%l7 + 0x6C]
	set	0x40, %i1
	stda	%f16,	[%l7 + %i1] 0x80
	movvs	%xcc,	%o0,	%i7
	bvs,a,pn	%icc,	loop_141
	bne,a	%icc,	loop_142
	orncc	%g7,	0x08F3,	%l2
	stb	%g2,	[%l7 + 0x38]
loop_141:
	array16	%g1,	%l3,	%g5
loop_142:
	movcc	%xcc,	%l1,	%o4
	movge	%xcc,	%o6,	%o7
	addccc	%i0,	0x014D,	%o1
	fmovdcc	%xcc,	%f30,	%f21
	fmovde	%icc,	%f28,	%f2
	edge8n	%i5,	%l0,	%i1
	add	%l7,	0x28,	%l6
	wr	%g0,	0x10,	%asi
	casxa	[%l6] %asi,	%l6,	%l5
	mova	%xcc,	%g6,	%i6
	brz	%i4,	loop_143
	edge16ln	%l4,	%o2,	%i2
	tvc	%icc,	0x0
	edge8	%g4,	%o3,	%o5
loop_143:
	fmul8sux16	%f24,	%f10,	%f30
	srl	%g3,	0x08,	%o0
	ldd	[%l7 + 0x30],	%i2
	fmovse	%icc,	%f26,	%f17
	set	0x5C, %g5
	ldstuba	[%l7 + %g5] 0x80,	%g7
	tpos	%xcc,	0x1
	fpadd32s	%f25,	%f13,	%f0
	tg	%icc,	0x0
	movgu	%xcc,	%i7,	%l2
	bcc,a,pn	%icc,	loop_144
	add	%g1,	%g2,	%g5
	orcc	%l1,	0x0602,	%o4
	fmovrdgz	%o6,	%f24,	%f28
loop_144:
	fmovda	%icc,	%f16,	%f25
	mova	%icc,	%o7,	%l3
	tn	%icc,	0x0
	be,pt	%icc,	loop_145
	sir	0x125F
	sdivcc	%o1,	0x11F0,	%i0
	membar	0x66
loop_145:
	or	%l0,	0x14F3,	%i1
	fbul,a	%fcc1,	loop_146
	edge32	%i5,	%l5,	%g6
	fbo,a	%fcc0,	loop_147
	srlx	%l6,	%i4,	%i6
loop_146:
	fmul8ulx16	%f12,	%f24,	%f4
	tgu	%xcc,	0x7
loop_147:
	tcs	%icc,	0x7
	ldd	[%l7 + 0x10],	%f8
	tle	%xcc,	0x0
	sra	%l4,	0x00,	%o2
	prefetch	[%l7 + 0x5C],	 0x1
	edge16	%g4,	%o3,	%i2
	srlx	%g3,	0x15,	%o0
	mulx	%o5,	0x01DE,	%g7
	xor	%i3,	0x04FE,	%l2
	wr	%g0,	0x0c,	%asi
	lda	[%l7 + 0x58] %asi,	%f22
	brgez	%g1,	loop_148
	move	%xcc,	%g2,	%g5
	xnor	%l1,	0x039C,	%i7
	and	%o6,	%o7,	%o4
loop_148:
	sdivx	%l3,	0x0A6F,	%i0
	tsubcc	%l0,	0x0ED5,	%o1
	lduh	[%l7 + 0x14],	%i5
	set	0x64, %g7
	swapa	[%l7 + %g7] 0x89,	%l5
	stbar
	movrgz	%i1,	%g6,	%l6
	edge8n	%i4,	%i6,	%o2
	add	%l4,	%g4,	%i2
	fandnot2	%f0,	%f12,	%f8
	fcmpne16	%f28,	%f24,	%o3
	andn	%g3,	%o5,	%o0
	fmul8x16au	%f23,	%f12,	%f10
	array32	%g7,	%i3,	%g1
	fmovrsne	%g2,	%f7,	%f28
	set	0x58, %l2
	ldswa	[%l7 + %l2] 0x15,	%l2
	subccc	%g5,	%i7,	%o6
	fcmpeq32	%f2,	%f14,	%l1
	fmovdl	%xcc,	%f17,	%f18
	mulx	%o7,	%o4,	%i0
	std	%f6,	[%l7 + 0x68]
	fnors	%f16,	%f20,	%f12
	orncc	%l3,	0x01F0,	%l0
	edge16ln	%o1,	%i5,	%l5
	set	0x40, %g6
	stda	%f0,	[%l7 + %g6] 0x04
	fcmple32	%f0,	%f12,	%g6
	for	%f16,	%f18,	%f30
	fmovrdgez	%l6,	%f4,	%f18
	sdivx	%i4,	0x0A8B,	%i6
	brgz,a	%i1,	loop_149
	fmovrdlez	%l4,	%f30,	%f2
	orncc	%o2,	%i2,	%o3
	fmovrslez	%g3,	%f7,	%f28
loop_149:
	fands	%f0,	%f6,	%f17
	addccc	%g4,	%o0,	%o5
	sra	%g7,	0x08,	%g1
	fmovrsne	%g2,	%f31,	%f11
	ldub	[%l7 + 0x2D],	%l2
	andn	%g5,	%i3,	%o6
	edge8l	%i7,	%l1,	%o4
	movl	%icc,	%o7,	%i0
	smul	%l3,	%o1,	%i5
	array16	%l5,	%g6,	%l6
	edge16l	%i4,	%l0,	%i1
	array8	%i6,	%o2,	%l4
	edge16	%i2,	%g3,	%g4
	wr	%g0,	0x04,	%asi
	lduha	[%l7 + 0x66] %asi,	%o0
	or	%o5,	0x0E76,	%g7
	ta	%icc,	0x3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x80,	%asi
	ldstuba	[%l7 + 0x0D] %asi,	%g1
	tle	%icc,	0x6
	ba,pt	%icc,	loop_150
	sub	%g2,	0x1BEC,	%o3
	set	0x40, %o3
	stda	%f16,	[%l7 + %o3] 0x04
loop_150:
	edge8n	%g5,	%i3,	%o6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udivcc	%i7,	0x06D4,	%l1
	membar	#Sync
	wr	%g0,	0xf0,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	tge	%xcc,	0x6
	movrne	%o4,	%o7,	%l2
	edge32	%i0,	%l3,	%i5
	move	%xcc,	%o1,	%l5
	fmuld8sux16	%f26,	%f29,	%f28
	fpackfix	%f22,	%f9
	movrgez	%l6,	0x20F,	%i4
	edge8ln	%g6,	%l0,	%i1
	tl	%xcc,	0x6
	array8	%o2,	%i6,	%i2
	xor	%g3,	%l4,	%o0
	nop
	setx loop_151, %l0, %l1
	jmpl %l1, %g4
	fbule,a	%fcc3,	loop_152
	tvs	%icc,	0x3
	edge8l	%g7,	%g1,	%g2
loop_151:
	fmovscs	%icc,	%f8,	%f9
loop_152:
	fcmpgt32	%f20,	%f14,	%o3
	alignaddrl	%o5,	%i3,	%g5
	array8	%o6,	%l1,	%o4
	bpos,a	loop_153
	tneg	%xcc,	0x5
	fbule	%fcc3,	loop_154
	sdivcc	%i7,	0x0D02,	%o7
loop_153:
	st	%f11,	[%l7 + 0x38]
	pdist	%f0,	%f24,	%f8
loop_154:
	edge8n	%i0,	%l3,	%l2
	tg	%xcc,	0x5
	edge16n	%o1,	%i5,	%l6
	tne	%xcc,	0x7
	alignaddrl	%i4,	%l5,	%g6
	te	%xcc,	0x7
	subccc	%i1,	%o2,	%l0
	fmovrdgez	%i6,	%f12,	%f14
	tcc	%icc,	0x5
	tn	%icc,	0x0
	fornot2s	%f14,	%f13,	%f0
	faligndata	%f6,	%f22,	%f4
	umul	%i2,	%l4,	%o0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrlez	%g3,	%g7,	%g4
	bne,pt	%icc,	loop_155
	movcs	%xcc,	%g1,	%g2
	lduw	[%l7 + 0x68],	%o5
	brgez,a	%i3,	loop_156
loop_155:
	fbule,a	%fcc0,	loop_157
	edge16ln	%o3,	%o6,	%l1
	edge8n	%g5,	%o4,	%i7
loop_156:
	movne	%icc,	%o7,	%i0
loop_157:
	fmovs	%f14,	%f16
	fones	%f22
	sir	0x1992
	fbule	%fcc1,	loop_158
	edge8	%l2,	%o1,	%l3
	fxnors	%f15,	%f23,	%f28
	fandnot2s	%f31,	%f13,	%f0
loop_158:
	fnand	%f30,	%f10,	%f24
	fones	%f3
	movrgez	%l6,	0x1CB,	%i5
	movrlz	%l5,	0x2C0,	%g6
	bn,a,pt	%icc,	loop_159
	membar	0x22
	fbn,a	%fcc1,	loop_160
	call	loop_161
loop_159:
	sdiv	%i4,	0x1269,	%o2
	fbu	%fcc0,	loop_162
loop_160:
	ta	%icc,	0x5
loop_161:
	edge16n	%i1,	%i6,	%l0
	subccc	%l4,	0x08D8,	%i2
loop_162:
	xor	%o0,	0x0FB8,	%g7
	fsrc2s	%f3,	%f5
	sir	0x09D5
	tneg	%xcc,	0x3
	ta	%icc,	0x2
	xnorcc	%g3,	%g1,	%g4
	ta	%icc,	0x1
	fbne,a	%fcc1,	loop_163
	fbge,a	%fcc1,	loop_164
	tvc	%xcc,	0x4
	mova	%icc,	%o5,	%i3
loop_163:
	xnor	%g2,	0x055C,	%o6
loop_164:
	fmovdvc	%icc,	%f26,	%f24
	umulcc	%o3,	%g5,	%o4
	edge16n	%i7,	%o7,	%i0
	fmul8x16au	%f25,	%f6,	%f4
	or	%l2,	0x0D99,	%l1
	bgu,a,pn	%icc,	loop_165
	fzeros	%f18
	andn	%l3,	0x1CF3,	%o1
	movrgz	%i5,	0x163,	%l5
loop_165:
	fmovde	%icc,	%f7,	%f6
	xnorcc	%g6,	%i4,	%o2
	bvc,a	loop_166
	fmovs	%f22,	%f31
	movleu	%xcc,	%l6,	%i1
	edge16l	%i6,	%l4,	%l0
loop_166:
	fblg	%fcc1,	loop_167
	fbn,a	%fcc0,	loop_168
	sll	%o0,	0x0C,	%g7
	andncc	%i2,	%g1,	%g4
loop_167:
	bvs,pn	%xcc,	loop_169
loop_168:
	nop
	setx	loop_170,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fone	%f30
	umulcc	%g3,	%o5,	%i3
loop_169:
	stbar
loop_170:
	fmovrsgz	%o6,	%f18,	%f14
	fbge,a	%fcc2,	loop_171
	edge8n	%o3,	%g2,	%o4
	taddcc	%g5,	%o7,	%i0
	bpos	%xcc,	loop_172
loop_171:
	andn	%i7,	0x1E99,	%l1
	addc	%l3,	0x1D36,	%o1
	fmovsg	%xcc,	%f11,	%f1
loop_172:
	sdivcc	%l2,	0x0ED9,	%l5
	fbne	%fcc1,	loop_173
	tsubcc	%g6,	%i4,	%o2
	umulcc	%i5,	%l6,	%i6
	fcmps	%fcc2,	%f5,	%f15
loop_173:
	umul	%i1,	%l0,	%o0
	subccc	%l4,	0x1494,	%i2
	tsubcctv	%g7,	%g1,	%g3
	addccc	%g4,	0x0663,	%i3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andcc	%o5,	%o6,	%g2
	mova	%xcc,	%o4,	%g5
	fpsub16	%f28,	%f18,	%f14
	wr	%g0,	0x19,	%asi
	sta	%f8,	[%l7 + 0x7C] %asi
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tpos	%xcc,	0x1
	mulx	%o3,	0x001D,	%i0
	sra	%i7,	0x14,	%o7
	tcc	%xcc,	0x6
	tvc	%xcc,	0x7
	fpack32	%f4,	%f4,	%f28
	fmovdvs	%icc,	%f12,	%f23
	fpadd32	%f30,	%f16,	%f14
	edge32n	%l3,	%l1,	%o1
	subc	%l2,	%g6,	%l5
	orcc	%i4,	0x1384,	%o2
	umulcc	%i5,	0x09D2,	%l6
	fmovsn	%xcc,	%f27,	%f31
	fmovrse	%i6,	%f3,	%f18
	movrne	%l0,	0x2A5,	%o0
	swap	[%l7 + 0x44],	%i1
	andcc	%i2,	%g7,	%g1
	tvs	%icc,	0x2
	andncc	%g3,	%l4,	%i3
	addc	%g4,	0x1A56,	%o6
	tle	%xcc,	0x2
	set	0x30, %g2
	stda	%g2,	[%l7 + %g2] 0x19
	array8	%o5,	%o4,	%g5
	tpos	%xcc,	0x4
	movge	%xcc,	%o3,	%i0
	nop
	set	0x10, %o1
	std	%f26,	[%l7 + %o1]
	tsubcctv	%o7,	0x1A80,	%i7
	srax	%l3,	0x1D,	%l1
	fornot2	%f14,	%f12,	%f10
	fmovspos	%xcc,	%f4,	%f21
	bpos,a,pn	%xcc,	loop_174
	fbule	%fcc2,	loop_175
	mova	%icc,	%o1,	%l2
	edge8	%g6,	%i4,	%l5
loop_174:
	tl	%icc,	0x0
loop_175:
	udiv	%o2,	0x160F,	%l6
	fmovdne	%xcc,	%f7,	%f22
	orcc	%i6,	%i5,	%l0
	sub	%i1,	%i2,	%o0
	swap	[%l7 + 0x18],	%g1
	or	%g3,	%g7,	%l4
	ldd	[%l7 + 0x28],	%f12
	fsrc1s	%f0,	%f8
	move	%icc,	%i3,	%g4
	bvs,pt	%xcc,	loop_176
	fmovscc	%icc,	%f22,	%f5
	move	%xcc,	%o6,	%g2
	bl,a,pn	%icc,	loop_177
loop_176:
	fxnors	%f7,	%f30,	%f9
	movcc	%icc,	%o5,	%g5
	array16	%o4,	%i0,	%o7
loop_177:
	movre	%o3,	%l3,	%i7
	fmovrse	%o1,	%f13,	%f18
	fbe	%fcc0,	loop_178
	xnorcc	%l2,	0x02D5,	%g6
	membar	0x4A
	fandnot1	%f0,	%f22,	%f18
loop_178:
	stw	%i4,	[%l7 + 0x50]
	fnot1s	%f21,	%f4
	brlz,a	%l5,	loop_179
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	for	%f0,	%f14,	%f12
	tgu	%icc,	0x7
loop_179:
	nop
	setx loop_180, %l0, %l1
	jmpl %l1, %l1
	edge32ln	%o2,	%l6,	%i6
	std	%f14,	[%l7 + 0x48]
	nop
	setx	loop_181,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_180:
	fpsub16s	%f2,	%f12,	%f8
	movg	%xcc,	%l0,	%i5
	tvs	%xcc,	0x3
loop_181:
	tl	%xcc,	0x5
	array16	%i2,	%o0,	%i1
	movn	%icc,	%g1,	%g3
	fcmpgt32	%f14,	%f24,	%g7
	orcc	%l4,	%g4,	%o6
	fbl	%fcc1,	loop_182
	tl	%icc,	0x4
	sdivx	%g2,	0x1E45,	%i3
	tg	%icc,	0x1
loop_182:
	array32	%o5,	%g5,	%i0
	sdiv	%o4,	0x0761,	%o3
	sethi	0x019E,	%l3
	ldsh	[%l7 + 0x26],	%o7
	fbul	%fcc2,	loop_183
	srax	%i7,	%l2,	%g6
	tge	%icc,	0x3
	srl	%i4,	%l5,	%l1
loop_183:
	edge32	%o2,	%l6,	%o1
	fnors	%f11,	%f29,	%f3
	fmovsvc	%xcc,	%f12,	%f20
	movne	%xcc,	%l0,	%i5
	tsubcctv	%i6,	%o0,	%i2
	sth	%i1,	[%l7 + 0x1C]
	wr	%g0,	0x11,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	xorcc	%g3,	0x07A6,	%g7
	tn	%icc,	0x6
	tcc	%xcc,	0x0
	stb	%g1,	[%l7 + 0x38]
	wr	%g0,	0x89,	%asi
	ldxa	[%l7 + 0x60] %asi,	%g4
	edge16ln	%l4,	%o6,	%i3
	movrgz	%g2,	%g5,	%i0
	andn	%o4,	0x19F7,	%o5
	array16	%l3,	%o7,	%o3
	wr	%g0,	0x11,	%asi
	ldsba	[%l7 + 0x18] %asi,	%l2
	fmovscc	%icc,	%f10,	%f7
	edge16ln	%g6,	%i4,	%i7
	movrgz	%l1,	0x324,	%l5
	set	0x78, %l3
	prefetcha	[%l7 + %l3] 0x10,	 0x2
	tcc	%icc,	0x5
	nop
	setx loop_184, %l0, %l1
	jmpl %l1, %o2
	movpos	%xcc,	%l0,	%o1
	fbn,a	%fcc0,	loop_185
	fbne,a	%fcc3,	loop_186
loop_184:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x4C, %i0
	stha	%i5,	[%l7 + %i0] 0x80
loop_185:
	ble,a	%xcc,	loop_187
loop_186:
	edge16n	%o0,	%i2,	%i6
	wr	%g0,	0x88,	%asi
	ldda	[%l7 + 0x40] %asi,	%i0
loop_187:
	fmovdvs	%xcc,	%f4,	%f22
	fcmpne32	%f18,	%f24,	%g7
	xorcc	%g1,	0x1D47,	%g4
	orcc	%g3,	%l4,	%i3
	xnor	%o6,	0x1B75,	%g5
	fmovrde	%i0,	%f24,	%f10
	wr	%g0,	0x88,	%asi
	stwa	%o4,	[%l7 + 0x74] %asi
	fbo,a	%fcc2,	loop_188
	fmovdneg	%xcc,	%f0,	%f7
	tne	%icc,	0x3
	andncc	%g2,	%l3,	%o7
loop_188:
	be,a	loop_189
	tcc	%xcc,	0x1
	smul	%o5,	0x145B,	%o3
	fbu	%fcc2,	loop_190
loop_189:
	movrne	%l2,	%g6,	%i4
	orcc	%l1,	%l5,	%i7
	srlx	%o2,	%l6,	%l0
loop_190:
	tleu	%xcc,	0x6
	fpadd32	%f18,	%f30,	%f6
	orncc	%i5,	0x03CD,	%o1
	fpsub16s	%f3,	%f8,	%f15
	fornot1	%f6,	%f14,	%f6
	array8	%o0,	%i6,	%i2
	srlx	%g7,	%g1,	%i1
	movrgez	%g4,	%l4,	%g3
	array16	%i3,	%o6,	%g5
	sra	%i0,	0x0D,	%o4
	movcs	%icc,	%l3,	%g2
	fandnot1s	%f25,	%f31,	%f9
	bcc	loop_191
	sllx	%o5,	0x18,	%o3
	fpadd16	%f12,	%f12,	%f0
	movrgz	%l2,	0x1E9,	%g6
loop_191:
	add	%i4,	0x1377,	%l1
	sllx	%o7,	0x02,	%l5
	te	%icc,	0x7
	movleu	%xcc,	%o2,	%l6
	subcc	%i7,	%l0,	%o1
	movre	%o0,	%i5,	%i2
	wr	%g0,	0x80,	%asi
	prefetcha	[%l7 + 0x50] %asi,	 0x1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stx	%i6,	[%l7 + 0x18]
	fmovrdlz	%g1,	%f2,	%f12
	tle	%xcc,	0x0
	edge16n	%i1,	%g4,	%l4
	edge8	%g3,	%o6,	%i3
	edge8ln	%g5,	%i0,	%o4
	xorcc	%g2,	0x0342,	%o5
	tcs	%icc,	0x2
	movl	%icc,	%o3,	%l3
	bg,pn	%icc,	loop_192
	fandnot2	%f0,	%f0,	%f26
	fbl,a	%fcc1,	loop_193
	tgu	%xcc,	0x3
loop_192:
	fmovdvs	%xcc,	%f1,	%f6
	movrlz	%g6,	0x091,	%l2
loop_193:
	addcc	%i4,	%o7,	%l5
	movge	%icc,	%l1,	%o2
	nop
	setx	loop_194,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	andncc	%i7,	%l6,	%o1
	fmovdl	%xcc,	%f7,	%f17
	umulcc	%o0,	0x0264,	%i5
loop_194:
	ldsh	[%l7 + 0x1A],	%i2
	fones	%f23
	fnegd	%f18,	%f6
	bvc,a,pn	%icc,	loop_195
	fsrc1s	%f10,	%f26
	fmovsgu	%icc,	%f11,	%f17
	andncc	%g7,	%l0,	%g1
loop_195:
	fmovdne	%xcc,	%f16,	%f2
	fmovrdlz	%i1,	%f16,	%f28
	andn	%g4,	0x17C1,	%l4
	fpsub16	%f22,	%f6,	%f16
	subccc	%g3,	0x11A1,	%i6
	andn	%i3,	%g5,	%o6
	fcmpd	%fcc0,	%f18,	%f20
	fexpand	%f27,	%f2
	fone	%f4
	set	0x14, %l1
	ldsha	[%l7 + %l1] 0x80,	%o4
	sdivcc	%i0,	0x061C,	%g2
	fnot2s	%f9,	%f18
	movrlez	%o3,	0x0D5,	%l3
	sra	%g6,	0x0A,	%l2
	fbge,a	%fcc3,	loop_196
	tcs	%xcc,	0x1
	fbuge	%fcc1,	loop_197
	fpadd16s	%f18,	%f9,	%f27
loop_196:
	xnorcc	%o5,	0x1A0A,	%o7
	ble,a,pt	%xcc,	loop_198
loop_197:
	array16	%l5,	%i4,	%o2
	movpos	%icc,	%l1,	%i7
	nop
	set	0x38, %g4
	std	%i6,	[%l7 + %g4]
loop_198:
	mulscc	%o1,	0x0308,	%o0
	alignaddrl	%i2,	%g7,	%l0
	edge32	%g1,	%i1,	%g4
	fmuld8ulx16	%f8,	%f23,	%f16
	fbul,a	%fcc0,	loop_199
	edge8l	%l4,	%i5,	%g3
	fbo,a	%fcc2,	loop_200
	edge32ln	%i3,	%i6,	%o6
loop_199:
	movl	%icc,	%g5,	%i0
	srl	%o4,	0x1B,	%g2
loop_200:
	fornot2	%f6,	%f22,	%f16
	nop
	set	0x10, %o2
	ldsh	[%l7 + %o2],	%o3
	bpos,a,pn	%icc,	loop_201
	fand	%f6,	%f26,	%f12
	fand	%f22,	%f2,	%f12
	set	0x68, %o6
	prefetcha	[%l7 + %o6] 0x10,	 0x1
loop_201:
	nop
	wr	%g0,	0x10,	%asi
	ldsha	[%l7 + 0x64] %asi,	%l2
	smul	%g6,	0x1BC3,	%o7
	array32	%o5,	%i4,	%o2
	wr	%g0,	0x0c,	%asi
	ldsha	[%l7 + 0x30] %asi,	%l5
	alignaddrl	%i7,	%l6,	%o1
	sethi	0x1E9A,	%o0
	set	0x20, %g1
	lduwa	[%l7 + %g1] 0x10,	%i2
	movrlz	%l1,	0x3E5,	%l0
	te	%xcc,	0x2
	fpsub32	%f24,	%f30,	%f14
	set	0x54, %g3
	stwa	%g1,	[%l7 + %g3] 0x04
	umul	%g7,	%i1,	%g4
	fmovdne	%xcc,	%f2,	%f9
	wr	%g0,	0x89,	%asi
	lduba	[%l7 + 0x19] %asi,	%l4
	fxnor	%f10,	%f8,	%f22
	bleu,a	%icc,	loop_202
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tvs	%icc,	0x0
	pdist	%f18,	%f0,	%f16
loop_202:
	edge8n	%i5,	%i3,	%i6
	fmovrdlz	%o6,	%f4,	%f0
	fnors	%f28,	%f28,	%f21
	bneg,a,pn	%xcc,	loop_203
	fmovdcs	%icc,	%f20,	%f23
	movn	%icc,	%g5,	%i0
	sub	%o4,	0x08EC,	%g2
loop_203:
	bg,pn	%icc,	loop_204
	sdivx	%o3,	0x1A8E,	%l3
	bneg,a	loop_205
	umulcc	%l2,	0x0F69,	%g3
loop_204:
	fpmerge	%f26,	%f14,	%f6
	fmovscc	%xcc,	%f12,	%f9
loop_205:
	xnor	%g6,	0x13F9,	%o7
	fbue	%fcc2,	loop_206
	fbge,a	%fcc3,	loop_207
	sir	0x0FAD
	movpos	%xcc,	%o5,	%i4
loop_206:
	nop
	set	0x3A, %o7
	lduha	[%l7 + %o7] 0x80,	%o2
loop_207:
	bshuffle	%f26,	%f24,	%f0
	tne	%xcc,	0x3
	brlez,a	%i7,	loop_208
	array16	%l5,	%o1,	%l6
	movcs	%xcc,	%o0,	%l1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_208:
	sub	%l0,	0x0CE9,	%g1
	movcs	%xcc,	%g7,	%i1
	movn	%xcc,	%g4,	%i2
	sdivx	%i5,	0x001A,	%l4
	fpadd32s	%f30,	%f16,	%f9
	fmul8x16	%f17,	%f10,	%f30
	fpackfix	%f18,	%f12
	fmovrsgez	%i3,	%f27,	%f14
	wr	%g0,	0xeb,	%asi
	stha	%i6,	[%l7 + 0x12] %asi
	membar	#Sync
	add	%o6,	%i0,	%g5
	nop
	set	0x10, %i6
	ldx	[%l7 + %i6],	%g2
	subccc	%o3,	0x00C1,	%l3
	fmovdpos	%icc,	%f19,	%f13
	fmovscc	%xcc,	%f30,	%f23
	std	%o4,	[%l7 + 0x70]
	tle	%icc,	0x5
	wr	%g0,	0x2b,	%asi
	stxa	%g3,	[%l7 + 0x18] %asi
	membar	#Sync
	orcc	%l2,	0x0A83,	%o7
	sra	%g6,	%o5,	%o2
	fbule	%fcc0,	loop_209
	udivx	%i4,	0x0F91,	%l5
	subcc	%o1,	0x102C,	%i7
	add	%l7,	0x44,	%l6
	wr	%g0,	0x18,	%asi
	casa	[%l6] %asi,	%o0,	%l1
loop_209:
	tleu	%xcc,	0x4
	udivx	%l6,	0x0CDD,	%g1
	fone	%f10
	edge32ln	%g7,	%i1,	%l0
	fnot1	%f12,	%f14
	bn	%xcc,	loop_210
	subccc	%i2,	%i5,	%g4
	tle	%icc,	0x2
	andcc	%i3,	0x1934,	%i6
loop_210:
	udiv	%l4,	0x0A5D,	%o6
	fsrc2s	%f11,	%f20
	add	%i0,	0x1E78,	%g5
	set	0x13, %o0
	stba	%o3,	[%l7 + %o0] 0x2f
	membar	#Sync
	tne	%xcc,	0x3
	fmovrslz	%l3,	%f20,	%f23
	fble	%fcc0,	loop_211
	array16	%o4,	%g3,	%l2
	edge16n	%o7,	%g2,	%o5
	mulscc	%g6,	%o2,	%i4
loop_211:
	movpos	%xcc,	%o1,	%l5
	movg	%icc,	%o0,	%l1
	addccc	%i7,	%l6,	%g1
	te	%xcc,	0x0
	fcmped	%fcc2,	%f2,	%f28
	fblg,a	%fcc0,	loop_212
	move	%xcc,	%i1,	%g7
	ldsb	[%l7 + 0x0D],	%l0
	pdist	%f6,	%f0,	%f26
loop_212:
	srl	%i5,	%i2,	%g4
	bleu,pt	%icc,	loop_213
	movvs	%icc,	%i6,	%l4
	orcc	%o6,	%i0,	%i3
	wr	%g0,	0x89,	%asi
	lduha	[%l7 + 0x56] %asi,	%o3
loop_213:
	srax	%g5,	%l3,	%g3
	edge32n	%l2,	%o4,	%g2
	sra	%o5,	0x0B,	%o7
	edge32ln	%o2,	%i4,	%o1
	fmovrdgez	%l5,	%f18,	%f2
	andcc	%o0,	0x0F81,	%g6
	set	0x00, %l4
	ldxa	[%g0 + %l4] 0x50,	%i7
	umulcc	%l1,	%g1,	%l6
	xorcc	%g7,	%l0,	%i1
	movge	%xcc,	%i5,	%i2
	sub	%g4,	%i6,	%o6
	alignaddr	%l4,	%i0,	%o3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addcc	%i3,	0x0726,	%l3
	edge8ln	%g3,	%g5,	%o4
	movrne	%g2,	0x231,	%l2
	udiv	%o5,	0x08CD,	%o7
	movrlz	%i4,	%o1,	%o2
	udivx	%o0,	0x1C52,	%l5
	ldsb	[%l7 + 0x45],	%i7
	flush	%l7 + 0x48
	alignaddr	%g6,	%l1,	%g1
	fbg,a	%fcc3,	loop_214
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddr	%g7,	%l0,	%l6
	umulcc	%i1,	%i2,	%i5
loop_214:
	brlez	%g4,	loop_215
	movrgez	%i6,	0x158,	%o6
	tgu	%icc,	0x3
	xor	%i0,	0x1DD3,	%l4
loop_215:
	add	%i3,	%o3,	%l3
	set	0x2E, %i4
	ldstuba	[%l7 + %i4] 0x89,	%g5
	tcc	%xcc,	0x2
	xnorcc	%o4,	%g2,	%g3
	stx	%l2,	[%l7 + 0x40]
	sdivcc	%o7,	0x1E7D,	%i4
	fbule	%fcc2,	loop_216
	fpadd16	%f14,	%f28,	%f26
	edge16ln	%o5,	%o2,	%o1
	tne	%xcc,	0x0
loop_216:
	bg	%icc,	loop_217
	fmovrsne	%o0,	%f5,	%f3
	edge8	%i7,	%g6,	%l1
	tneg	%xcc,	0x6
loop_217:
	or	%l5,	0x13BA,	%g1
	smulcc	%l0,	%l6,	%g7
	umul	%i1,	0x1EC3,	%i5
	edge8	%g4,	%i6,	%i2
	edge8l	%o6,	%l4,	%i0
	movrlez	%i3,	%o3,	%l3
	umul	%g5,	0x0FD8,	%o4
	set	0x75, %l0
	ldsba	[%l7 + %l0] 0x10,	%g2
	fnot2s	%f16,	%f14
	edge32	%g3,	%o7,	%l2
	mulx	%i4,	0x00DA,	%o2
	tpos	%icc,	0x5
	fmovsn	%xcc,	%f2,	%f30
	movrgz	%o5,	%o0,	%o1
	sllx	%g6,	0x10,	%l1
	udivx	%l5,	0x01FD,	%g1
	fnot2s	%f16,	%f30
	movrgz	%i7,	%l0,	%l6
	fbo	%fcc3,	loop_218
	edge32l	%i1,	%g7,	%i5
	andncc	%i6,	%i2,	%g4
	sir	0x19ED
loop_218:
	fand	%f24,	%f14,	%f4
	sllx	%o6,	0x00,	%i0
	fnot2s	%f30,	%f18
	movgu	%icc,	%l4,	%o3
	tvc	%icc,	0x1
	movne	%icc,	%l3,	%g5
	fmovrslz	%i3,	%f23,	%f11
	add	%o4,	%g3,	%g2
	fblg,a	%fcc0,	loop_219
	xnorcc	%l2,	0x12B7,	%o7
	fmovdneg	%icc,	%f15,	%f2
	bgu,a	%xcc,	loop_220
loop_219:
	tsubcctv	%o2,	%o5,	%o0
	or	%o1,	%g6,	%i4
	bcc,pn	%xcc,	loop_221
loop_220:
	xnor	%l1,	%l5,	%g1
	wr	%g0,	0x81,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
loop_221:
	st	%f30,	[%l7 + 0x54]
	tcc	%icc,	0x0
	sra	%i7,	%l0,	%i1
	fbuge	%fcc0,	loop_222
	bgu,a,pt	%xcc,	loop_223
	edge8ln	%g7,	%i5,	%l6
	array16	%i6,	%i2,	%g4
loop_222:
	sth	%i0,	[%l7 + 0x32]
loop_223:
	addc	%l4,	0x016D,	%o3
	nop
	setx loop_224, %l0, %l1
	jmpl %l1, %l3
	movl	%icc,	%g5,	%i3
	fbuge,a	%fcc0,	loop_225
	movrgez	%o6,	0x020,	%g3
loop_224:
	sub	%g2,	%o4,	%o7
	sllx	%o2,	0x02,	%o5
loop_225:
	orcc	%l2,	%o0,	%g6
	movg	%icc,	%i4,	%l1
	movl	%icc,	%l5,	%g1
	fpackfix	%f6,	%f6
	fpsub16s	%f4,	%f27,	%f14
	tsubcctv	%o1,	0x12BA,	%l0
	array16	%i7,	%g7,	%i5
	movneg	%xcc,	%i1,	%l6
	bvc	%icc,	loop_226
	fmovdl	%xcc,	%f4,	%f6
	bge,pt	%icc,	loop_227
	xorcc	%i2,	%g4,	%i0
loop_226:
	orncc	%i6,	0x1714,	%o3
	movvs	%icc,	%l4,	%g5
loop_227:
	edge32ln	%i3,	%l3,	%o6
	fmovsne	%icc,	%f17,	%f1
	movn	%icc,	%g3,	%o4
	fpadd32s	%f15,	%f0,	%f29
	tleu	%xcc,	0x1
	movrlz	%g2,	0x2C3,	%o7
	movpos	%xcc,	%o5,	%o2
	nop
	setx	loop_228,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	alignaddr	%o0,	%l2,	%g6
	edge16	%i4,	%l1,	%g1
	udivcc	%l5,	0x1129,	%o1
loop_228:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsw	[%l7 + 0x2C],	%l0
	fones	%f25
	movrgz	%i7,	0x0A5,	%i5
	fmovsge	%xcc,	%f22,	%f5
	mova	%icc,	%g7,	%i1
	ldub	[%l7 + 0x53],	%l6
	fpadd16s	%f12,	%f6,	%f19
	tcs	%xcc,	0x7
	fandnot2s	%f25,	%f22,	%f25
	membar	0x7F
	fpsub16	%f6,	%f2,	%f16
	tge	%icc,	0x0
	fcmpgt32	%f4,	%f10,	%i2
	sdiv	%i0,	0x1E38,	%g4
	movrlez	%o3,	0x3DB,	%l4
	movgu	%icc,	%g5,	%i3
	fmovrslz	%i6,	%f6,	%f26
	sllx	%l3,	0x0A,	%o6
	tvc	%icc,	0x6
	xor	%o4,	%g2,	%g3
	sth	%o7,	[%l7 + 0x30]
	and	%o5,	%o2,	%o0
	nop
	setx	loop_229,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fmul8sux16	%f6,	%f6,	%f8
	edge8ln	%g6,	%i4,	%l1
	fbule,a	%fcc1,	loop_230
loop_229:
	add	%g1,	%l5,	%o1
	sra	%l0,	%l2,	%i7
	smul	%g7,	%i1,	%l6
loop_230:
	tsubcc	%i2,	%i5,	%g4
	std	%o2,	[%l7 + 0x40]
	fbu	%fcc2,	loop_231
	tl	%xcc,	0x5
	set	0x0C, %i7
	swapa	[%l7 + %i7] 0x89,	%i0
loop_231:
	movre	%g5,	%l4,	%i3
	movrne	%i6,	0x043,	%l3
	fblg,a	%fcc1,	loop_232
	tl	%xcc,	0x7
	xnorcc	%o6,	%o4,	%g3
	wr	%g0,	0x11,	%asi
	ldda	[%l7 + 0x70] %asi,	%g2
loop_232:
	tl	%xcc,	0x6
	xor	%o7,	%o2,	%o5
	wr	%g0,	0x80,	%asi
	lduba	[%l7 + 0x6B] %asi,	%g6
	nop
	set	0x30, %i2
	ldsw	[%l7 + %i2],	%o0
	edge32l	%l1,	%g1,	%i4
	fmovdneg	%xcc,	%f20,	%f30
	fnors	%f22,	%f12,	%f31
	fmovdg	%icc,	%f13,	%f23
	swap	[%l7 + 0x68],	%l5
	ldsw	[%l7 + 0x34],	%l0
	edge32n	%o1,	%l2,	%g7
	mova	%xcc,	%i7,	%i1
	fbo	%fcc3,	loop_233
	sdiv	%l6,	0x1D00,	%i5
	fbge	%fcc3,	loop_234
	movvc	%xcc,	%g4,	%i2
loop_233:
	ta	%xcc,	0x4
	movg	%xcc,	%o3,	%g5
loop_234:
	movneg	%icc,	%l4,	%i0
	subcc	%i3,	0x1175,	%i6
	wr	%g0,	0x80,	%asi
	prefetcha	[%l7 + 0x50] %asi,	 0x0
	fexpand	%f1,	%f30
	fbo	%fcc2,	loop_235
	fbge,a	%fcc0,	loop_236
	srl	%l3,	0x01,	%o4
	te	%xcc,	0x7
loop_235:
	tvc	%icc,	0x7
loop_236:
	srax	%g3,	0x0C,	%o7
	ldd	[%l7 + 0x40],	%f16
	movrlz	%o2,	%o5,	%g2
	brlz	%g6,	loop_237
	taddcc	%l1,	%o0,	%i4
	movrgez	%g1,	%l0,	%o1
	mulscc	%l5,	%g7,	%i7
loop_237:
	movge	%icc,	%i1,	%l2
	fandnot1	%f22,	%f10,	%f12
	brgez,a	%i5,	loop_238
	udiv	%l6,	0x1174,	%g4
	std	%f20,	[%l7 + 0x78]
	prefetch	[%l7 + 0x38],	 0x3
loop_238:
	fbge	%fcc1,	loop_239
	bge,pn	%xcc,	loop_240
	fmovd	%f10,	%f0
	fmovrse	%i2,	%f3,	%f7
loop_239:
	nop
	setx	loop_241,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_240:
	srl	%o3,	%g5,	%i0
	sll	%l4,	0x17,	%i3
	array8	%i6,	%o6,	%o4
loop_241:
	fsrc2	%f28,	%f20
	andn	%l3,	0x096A,	%g3
	ldx	[%l7 + 0x70],	%o7
	fnot2	%f4,	%f8
	fble,a	%fcc2,	loop_242
	movle	%xcc,	%o5,	%o2
	sir	0x0776
	bg	%xcc,	loop_243
loop_242:
	brgz	%g6,	loop_244
	edge16	%g2,	%o0,	%l1
	movg	%icc,	%i4,	%l0
loop_243:
	edge8ln	%g1,	%o1,	%g7
loop_244:
	fornot2s	%f15,	%f4,	%f30
	brlz	%i7,	loop_245
	udiv	%i1,	0x0636,	%l5
	movleu	%xcc,	%l2,	%l6
	tcc	%xcc,	0x4
loop_245:
	nop
	wr	%g0,	0x80,	%asi
	lduba	[%l7 + 0x7D] %asi,	%g4
	fpmerge	%f16,	%f5,	%f20
	tsubcc	%i2,	0x12AA,	%i5
	movneg	%icc,	%o3,	%g5
	subccc	%l4,	%i3,	%i6
	movrgez	%o6,	0x078,	%o4
	fnor	%f24,	%f26,	%f14
	movl	%xcc,	%i0,	%g3
	movge	%icc,	%l3,	%o5
	sra	%o7,	%o2,	%g6
	addc	%g2,	0x05F6,	%o0
	tg	%xcc,	0x3
	movvs	%xcc,	%i4,	%l1
	fmuld8ulx16	%f6,	%f7,	%f0
	membar	0x47
	movn	%icc,	%g1,	%l0
	ldub	[%l7 + 0x64],	%o1
	wr	%g0,	0x52,	%asi
	ldxa	[%g0 + 0x218] %asi,	%i7
	bne	%icc,	loop_246
	stx	%i1,	[%l7 + 0x78]
	sub	%g7,	0x09C9,	%l2
	tvc	%xcc,	0x5
loop_246:
	edge16l	%l6,	%g4,	%l5
	mulx	%i5,	0x0CCB,	%o3
	movrlez	%i2,	0x3EA,	%l4
	fble,a	%fcc1,	loop_247
	edge32ln	%g5,	%i6,	%i3
	fmuld8ulx16	%f24,	%f24,	%f10
	movpos	%icc,	%o4,	%o6
loop_247:
	movrgez	%g3,	0x11A,	%i0
	set	0x10, %l6
	stha	%l3,	[%l7 + %l6] 0x19
	fpadd32s	%f30,	%f10,	%f13
	tleu	%xcc,	0x7
	xorcc	%o7,	%o5,	%g6
	fone	%f12
	tcc	%icc,	0x6
	tcs	%xcc,	0x4
	te	%icc,	0x0
	movg	%icc,	%g2,	%o2
	tg	%xcc,	0x6
	fbne	%fcc2,	loop_248
	tleu	%xcc,	0x4
	tvs	%icc,	0x0
	nop
	setx	loop_249,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_248:
	fmovrsne	%i4,	%f14,	%f5
	srlx	%o0,	0x0D,	%l1
	array32	%l0,	%g1,	%i7
loop_249:
	movrne	%i1,	0x25A,	%o1
	tvs	%icc,	0x7
	bpos,pt	%xcc,	loop_250
	movge	%xcc,	%l2,	%l6
	movg	%xcc,	%g4,	%g7
	fmovrsgez	%i5,	%f25,	%f6
loop_250:
	ldstub	[%l7 + 0x2B],	%l5
	orncc	%i2,	%l4,	%o3
	mova	%xcc,	%g5,	%i6
	bpos,a,pt	%icc,	loop_251
	fabss	%f5,	%f13
	set	0x40, %o4
	stda	%f16,	[%l7 + %o4] 0xf0
	membar	#Sync
loop_251:
	movge	%icc,	%i3,	%o6
	bshuffle	%f22,	%f0,	%f18
	tvc	%icc,	0x1
	fbne	%fcc2,	loop_252
	movrgez	%o4,	%g3,	%i0
	fornot1	%f6,	%f18,	%f28
	ldx	[%l7 + 0x10],	%l3
loop_252:
	movrgz	%o7,	0x0FB,	%g6
	fsrc2	%f12,	%f8
	bg,a	loop_253
	fmovdl	%icc,	%f15,	%f27
	stb	%o5,	[%l7 + 0x3A]
	tne	%xcc,	0x0
loop_253:
	movn	%icc,	%g2,	%i4
	orn	%o2,	%o0,	%l1
	mulscc	%l0,	0x0E0C,	%i7
	and	%i1,	0x12ED,	%g1
	movge	%xcc,	%l2,	%l6
	orncc	%g4,	0x0FDA,	%g7
	set	0x30, %i3
	ldxa	[%g0 + %i3] 0x58,	%i5
	movne	%icc,	%o1,	%l5
	udiv	%i2,	0x0789,	%o3
	ta	%icc,	0x6
	fble	%fcc3,	loop_254
	edge8l	%g5,	%i6,	%l4
	sllx	%i3,	%o4,	%o6
	sra	%g3,	%i0,	%o7
loop_254:
	fmovdleu	%xcc,	%f21,	%f20
	std	%f18,	[%l7 + 0x68]
	bcc	%icc,	loop_255
	fblg	%fcc2,	loop_256
	tcc	%icc,	0x5
	sub	%g6,	0x0377,	%l3
loop_255:
	sdivx	%o5,	0x152E,	%g2
loop_256:
	edge32l	%i4,	%o0,	%l1
	edge32l	%o2,	%l0,	%i1
	edge8	%i7,	%l2,	%g1
	movrne	%g4,	%l6,	%i5
	fandnot1s	%f8,	%f15,	%f31
	alignaddr	%g7,	%l5,	%o1
	addc	%i2,	%o3,	%g5
	movre	%l4,	%i3,	%i6
	fxnor	%f28,	%f30,	%f26
	sllx	%o4,	%g3,	%o6
	fbule	%fcc1,	loop_257
	popc	0x12CF,	%o7
	addc	%g6,	0x0DDB,	%l3
	udivcc	%o5,	0x02B6,	%i0
loop_257:
	andcc	%g2,	%o0,	%l1
	alignaddrl	%o2,	%i4,	%l0
	array32	%i7,	%i1,	%g1
	movgu	%icc,	%g4,	%l6
	ldsh	[%l7 + 0x26],	%i5
	nop
	setx	loop_258,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fmovdg	%icc,	%f20,	%f14
	fbul,a	%fcc1,	loop_259
	tsubcctv	%l2,	0x0E44,	%g7
loop_258:
	fmovdne	%xcc,	%f4,	%f10
	tgu	%xcc,	0x4
loop_259:
	call	loop_260
	udivx	%l5,	0x0F9D,	%i2
	movrne	%o3,	%o1,	%l4
	tcc	%icc,	0x1
loop_260:
	fmovd	%f16,	%f14
	tge	%xcc,	0x3
	movleu	%xcc,	%i3,	%g5
	alignaddr	%o4,	%g3,	%i6
	fand	%f14,	%f24,	%f22
	fmovsvs	%icc,	%f12,	%f7
	fpsub32	%f28,	%f18,	%f22
	sethi	0x0E1A,	%o6
	fcmps	%fcc1,	%f21,	%f20
	fbue,a	%fcc3,	loop_261
	tcs	%icc,	0x1
	orcc	%g6,	%o7,	%l3
	movrgez	%i0,	0x180,	%o5
loop_261:
	subcc	%g2,	%o0,	%o2
	xnorcc	%i4,	%l1,	%i7
	fbn	%fcc1,	loop_262
	bvs,a,pn	%xcc,	loop_263
	fpsub32s	%f0,	%f2,	%f30
	set	0x40, %i5
	stda	%i0,	[%l7 + %i5] 0xea
	membar	#Sync
loop_262:
	te	%xcc,	0x0
loop_263:
	fpsub16	%f0,	%f4,	%f18
	fornot2	%f20,	%f4,	%f0
	addccc	%l0,	%g4,	%g1
	smul	%l6,	0x16D2,	%l2
	fand	%f2,	%f24,	%f12
	tgu	%icc,	0x4
	tneg	%xcc,	0x1
	movcs	%icc,	%i5,	%l5
	set	0x7C, %l5
	ldsha	[%l7 + %l5] 0x18,	%g7
	bcs,pt	%xcc,	loop_264
	fmovdn	%icc,	%f9,	%f29
	call	loop_265
	tsubcctv	%i2,	0x16C6,	%o3
loop_264:
	sll	%o1,	0x06,	%i3
	edge16n	%g5,	%l4,	%o4
loop_265:
	fba	%fcc3,	loop_266
	fbule	%fcc1,	loop_267
	fpadd32s	%f30,	%f19,	%f15
	brlz,a	%g3,	loop_268
loop_266:
	fmovde	%xcc,	%f14,	%f26
loop_267:
	srl	%i6,	0x18,	%g6
	orn	%o7,	0x0165,	%o6
loop_268:
	nop
	set	0x76, %o5
	lduba	[%l7 + %o5] 0x14,	%l3
	sdiv	%o5,	0x1183,	%i0
	tl	%icc,	0x3
	fbne	%fcc1,	loop_269
	edge8l	%g2,	%o2,	%o0
	sir	0x068A
	ta	%xcc,	0x4
loop_269:
	bvs	%xcc,	loop_270
	brnz,a	%i4,	loop_271
	add	%l1,	0x150E,	%i1
	fpsub16s	%f9,	%f25,	%f0
loop_270:
	tsubcc	%i7,	%l0,	%g4
loop_271:
	movleu	%icc,	%l6,	%l2
	tne	%icc,	0x3
	ldsh	[%l7 + 0x68],	%i5
	fmovsge	%icc,	%f23,	%f24
	fsrc2	%f20,	%f24
	edge8n	%g1,	%g7,	%i2
	fcmpeq16	%f28,	%f0,	%o3
	subcc	%o1,	0x1770,	%i3
	wr	%g0,	0x19,	%asi
	lduha	[%l7 + 0x42] %asi,	%g5
	ld	[%l7 + 0x50],	%f12
	movre	%l4,	0x03F,	%o4
	fmovs	%f4,	%f12
	addccc	%g3,	0x03B2,	%l5
	fsrc1	%f8,	%f18
	smul	%i6,	%g6,	%o6
	edge8n	%l3,	%o5,	%o7
	taddcc	%i0,	0x0758,	%o2
	subc	%o0,	%g2,	%i4
	edge8n	%i1,	%i7,	%l1
	umulcc	%g4,	0x0A03,	%l0
	add	%l2,	%i5,	%g1
	subccc	%l6,	0x16DA,	%g7
	movrne	%o3,	%i2,	%o1
	taddcc	%g5,	%i3,	%l4
	tpos	%icc,	0x4
	movge	%xcc,	%g3,	%l5
	tcc	%xcc,	0x4
	fpmerge	%f13,	%f13,	%f16
	tneg	%xcc,	0x1
	nop
	set	0x4A, %i1
	ldstub	[%l7 + %i1],	%o4
	sub	%i6,	%g6,	%l3
	bpos,a,pn	%icc,	loop_272
	ble,pn	%icc,	loop_273
	edge8n	%o6,	%o7,	%o5
	fbge	%fcc2,	loop_274
loop_272:
	addc	%i0,	0x0574,	%o2
loop_273:
	brnz	%o0,	loop_275
	ldd	[%l7 + 0x38],	%g2
loop_274:
	fbo,a	%fcc3,	loop_276
	fmovrdgz	%i1,	%f4,	%f12
loop_275:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fandnot2s	%f27,	%f24,	%f30
loop_276:
	movn	%icc,	%i7,	%i4
	bg,a,pn	%xcc,	loop_277
	xor	%l1,	%g4,	%l2
	set	0x58, %g5
	stda	%i4,	[%l7 + %g5] 0xe3
	membar	#Sync
loop_277:
	smul	%l0,	%g1,	%l6
	movn	%icc,	%g7,	%o3
	be	loop_278
	addccc	%i2,	0x020F,	%o1
	subc	%g5,	%i3,	%g3
	stbar
loop_278:
	alignaddr	%l5,	%o4,	%i6
	fxnor	%f18,	%f20,	%f0
	fmovse	%icc,	%f22,	%f7
	fbg,a	%fcc2,	loop_279
	fcmpne32	%f26,	%f28,	%g6
	srl	%l3,	0x13,	%o6
	mova	%icc,	%o7,	%o5
loop_279:
	nop
	setx	loop_280,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	tl	%xcc,	0x2
	movvc	%xcc,	%l4,	%i0
	fbule,a	%fcc2,	loop_281
loop_280:
	sll	%o2,	0x16,	%o0
	add	%l7,	0x40,	%l6
	wr	%g0,	0x04,	%asi
	casxa	[%l6] %asi,	%i1,	%i7
loop_281:
	fmovdneg	%xcc,	%f20,	%f22
	srax	%i4,	%l1,	%g4
	be	%icc,	loop_282
	andn	%g2,	%i5,	%l2
	orn	%g1,	%l6,	%g7
	edge32	%l0,	%o3,	%o1
loop_282:
	xorcc	%g5,	%i3,	%i2
	tcs	%icc,	0x7
	movvc	%icc,	%l5,	%o4
	fba	%fcc0,	loop_283
	fornot1	%f8,	%f16,	%f24
	subccc	%i6,	0x0A20,	%g3
	xorcc	%g6,	0x0280,	%o6
loop_283:
	tgu	%xcc,	0x3
	sll	%l3,	0x06,	%o7
	nop
	setx loop_284, %l0, %l1
	jmpl %l1, %o5
	addcc	%l4,	0x04D7,	%i0
	wr	%g0,	0x04,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
loop_284:
	edge32n	%o2,	%o0,	%i7
	movl	%xcc,	%i1,	%i4
	xnor	%g4,	%l1,	%g2
	ble	%icc,	loop_285
	umulcc	%l2,	0x0714,	%i5
	sdivx	%g1,	0x0589,	%l6
	brgz	%g7,	loop_286
loop_285:
	fmovsgu	%icc,	%f5,	%f29
	movg	%icc,	%l0,	%o1
	sir	0x1BBA
loop_286:
	nop
	setx loop_287, %l0, %l1
	jmpl %l1, %o3
	andncc	%g5,	%i3,	%l5
	mulscc	%o4,	0x133D,	%i6
	movrlez	%i2,	0x340,	%g3
loop_287:
	bleu	loop_288
	addc	%g6,	0x09D9,	%l3
	alignaddr	%o7,	%o5,	%o6
	or	%i0,	0x16F6,	%o2
loop_288:
	fandnot2	%f18,	%f22,	%f16
	tgu	%icc,	0x3
	edge32	%l4,	%i7,	%i1
	fpadd32s	%f31,	%f11,	%f13
	bge,a,pt	%xcc,	loop_289
	tg	%icc,	0x6
	addcc	%o0,	0x18DA,	%i4
	fand	%f4,	%f10,	%f22
loop_289:
	fbe	%fcc1,	loop_290
	fmovsn	%icc,	%f13,	%f30
	bpos,a	%icc,	loop_291
	subccc	%g4,	0x0B4F,	%g2
loop_290:
	ldsw	[%l7 + 0x50],	%l1
	fbuge,a	%fcc0,	loop_292
loop_291:
	fbo,a	%fcc2,	loop_293
	mulx	%l2,	%g1,	%i5
	lduw	[%l7 + 0x70],	%g7
loop_292:
	ldx	[%l7 + 0x08],	%l0
loop_293:
	fmovrsne	%l6,	%f9,	%f12
	nop
	set	0x4B, %l2
	ldsb	[%l7 + %l2],	%o3
	edge32	%g5,	%o1,	%l5
	mulx	%o4,	%i6,	%i3
	fbul,a	%fcc0,	loop_294
	sdiv	%i2,	0x16BF,	%g3
	tne	%xcc,	0x7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_294:
	tvs	%icc,	0x5
	fmovsvc	%icc,	%f0,	%f8
	fbuge,a	%fcc3,	loop_295
	tgu	%xcc,	0x1
	fmovdcs	%icc,	%f22,	%f24
	tle	%icc,	0x4
loop_295:
	movle	%icc,	%g6,	%l3
	wr	%g0,	0x04,	%asi
	stxa	%o7,	[%l7 + 0x20] %asi
	movleu	%xcc,	%o6,	%o5
	wr	%g0,	0xe2,	%asi
	stha	%o2,	[%l7 + 0x22] %asi
	membar	#Sync
	fabss	%f6,	%f17
	sllx	%i0,	0x14,	%i7
	movleu	%icc,	%l4,	%o0
	fmul8x16	%f18,	%f4,	%f30
	add	%i4,	0x0E49,	%i1
	brz	%g4,	loop_296
	fmovsvc	%icc,	%f15,	%f19
	set	0x60, %g7
	stha	%g2,	[%l7 + %g7] 0xe2
	membar	#Sync
loop_296:
	fmovdgu	%xcc,	%f4,	%f17
	subcc	%l1,	0x19AA,	%g1
	xorcc	%i5,	0x1115,	%l2
	fmovsleu	%icc,	%f16,	%f0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bgu,a,pt	%xcc,	loop_297
	edge32	%g7,	%l0,	%l6
	array8	%g5,	%o3,	%o1
	xnorcc	%o4,	0x06FE,	%l5
loop_297:
	srlx	%i3,	%i6,	%i2
	bgu,pn	%xcc,	loop_298
	fblg	%fcc1,	loop_299
	movre	%g3,	0x13C,	%g6
	fsrc2	%f20,	%f4
loop_298:
	fornot1	%f28,	%f8,	%f26
loop_299:
	fpack16	%f16,	%f31
	tle	%icc,	0x4
	tge	%xcc,	0x0
	fmovsneg	%icc,	%f27,	%f0
	tvs	%xcc,	0x6
	movcc	%icc,	%l3,	%o7
	brgz,a	%o6,	loop_300
	ldd	[%l7 + 0x08],	%f4
	tge	%xcc,	0x0
	ldsw	[%l7 + 0x58],	%o2
loop_300:
	movg	%icc,	%i0,	%o5
	wr	%g0,	0x80,	%asi
	lduha	[%l7 + 0x0C] %asi,	%i7
	stw	%l4,	[%l7 + 0x30]
	nop
	setx	loop_301,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	subcc	%o0,	%i1,	%g4
	tvc	%xcc,	0x1
	set	0x24, %g6
	sta	%f3,	[%l7 + %g6] 0x14
loop_301:
	movne	%icc,	%i4,	%l1
	ba,a,pn	%icc,	loop_302
	andcc	%g2,	%g1,	%i5
	bgu,a	%icc,	loop_303
	udivcc	%l2,	0x069D,	%g7
loop_302:
	fble	%fcc3,	loop_304
	fbug,a	%fcc3,	loop_305
loop_303:
	movpos	%xcc,	%l6,	%g5
	sra	%l0,	%o3,	%o1
loop_304:
	nop
	wr	%g0,	0x89,	%asi
	ldxa	[%l7 + 0x70] %asi,	%l5
loop_305:
	bpos	loop_306
	ble,a	loop_307
	fones	%f12
	tcs	%xcc,	0x4
loop_306:
	xor	%i3,	0x163F,	%i6
loop_307:
	edge32ln	%o4,	%g3,	%i2
	edge8n	%g6,	%o7,	%o6
	tvc	%icc,	0x5
	fmovrsgez	%o2,	%f8,	%f12
	andncc	%l3,	%o5,	%i0
	add	%i7,	%l4,	%i1
	alignaddr	%o0,	%g4,	%l1
	addccc	%g2,	0x0AAC,	%g1
	mova	%xcc,	%i4,	%i5
	taddcc	%g7,	%l2,	%g5
	wr	%g0,	0x27,	%asi
	stba	%l0,	[%l7 + 0x35] %asi
	membar	#Sync
	sdiv	%o3,	0x06C5,	%l6
	fmovsge	%icc,	%f15,	%f17
	orncc	%o1,	0x0107,	%i3
	wr	%g0,	0x80,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	movrne	%i6,	%l5,	%g3
	add	%l7,	0x10,	%l6
	wr	%g0,	0x0c,	%asi
	ldxa	[%l6] %asi,	%i2
	casxa	[%l6] %asi,	%i2,	%g6
	fornot2	%f26,	%f0,	%f20
	edge32ln	%o4,	%o6,	%o2
	movrlez	%o7,	0x0A0,	%o5
	movl	%xcc,	%i0,	%l3
	addcc	%i7,	%l4,	%i1
	addc	%g4,	%l1,	%g2
	fmovdvs	%icc,	%f4,	%f13
	fmovdcs	%xcc,	%f3,	%f13
	nop
	setx	loop_308,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	addc	%g1,	0x0D54,	%o0
	udivx	%i5,	0x107E,	%i4
	ta	%xcc,	0x7
loop_308:
	umulcc	%g7,	%g5,	%l2
	sdivx	%o3,	0x012E,	%l0
	tvs	%xcc,	0x2
	edge16n	%o1,	%l6,	%i3
	tleu	%xcc,	0x6
	andn	%i6,	%l5,	%g3
	brgz,a	%i2,	loop_309
	ldsb	[%l7 + 0x3D],	%o4
	fandnot2s	%f13,	%f12,	%f17
	srax	%o6,	%g6,	%o2
loop_309:
	subccc	%o5,	%o7,	%l3
	fpsub16s	%f8,	%f16,	%f6
	edge16n	%i0,	%l4,	%i7
	fpsub32s	%f10,	%f2,	%f3
	edge16ln	%i1,	%g4,	%g2
	tg	%icc,	0x2
	tg	%icc,	0x6
	andn	%l1,	0x1619,	%o0
	tleu	%icc,	0x7
	fmovde	%icc,	%f17,	%f25
	fbuge	%fcc3,	loop_310
	orncc	%g1,	0x0990,	%i4
	fmul8x16al	%f27,	%f6,	%f10
	fmul8x16	%f9,	%f26,	%f24
loop_310:
	swap	[%l7 + 0x44],	%i5
	tvc	%icc,	0x3
	subccc	%g5,	0x0153,	%g7
	mulscc	%o3,	%l2,	%o1
	edge8l	%l6,	%i3,	%i6
	smulcc	%l5,	%l0,	%g3
	fbul,a	%fcc3,	loop_311
	movcs	%xcc,	%o4,	%i2
	movl	%xcc,	%g6,	%o2
	std	%o6,	[%l7 + 0x38]
loop_311:
	xorcc	%o7,	%l3,	%i0
	fbug,a	%fcc0,	loop_312
	addcc	%o5,	%l4,	%i1
	fpadd16	%f16,	%f10,	%f14
	fxors	%f0,	%f16,	%f27
loop_312:
	membar	0x76
	edge32n	%i7,	%g2,	%l1
	movcs	%icc,	%o0,	%g1
	add	%i4,	%g4,	%i5
	wr	%g0,	0x52,	%asi
	ldxa	[%g0 + 0x218] %asi,	%g7
	movge	%xcc,	%g5,	%o3
	set	0x5E, %o3
	lduha	[%l7 + %o3] 0x19,	%o1
	alignaddrl	%l2,	%l6,	%i3
	fmovdl	%icc,	%f0,	%f26
	edge32l	%i6,	%l0,	%l5
	fmovdgu	%xcc,	%f9,	%f25
	fbo,a	%fcc3,	loop_313
	fmovse	%xcc,	%f28,	%f12
	subccc	%g3,	0x069B,	%i2
	fmovsneg	%icc,	%f18,	%f26
loop_313:
	movg	%icc,	%g6,	%o2
	tg	%xcc,	0x4
	fpadd32s	%f5,	%f21,	%f28
	te	%xcc,	0x0
	tle	%icc,	0x4
	fnand	%f4,	%f20,	%f22
	fornot1	%f28,	%f10,	%f8
	fxor	%f12,	%f10,	%f18
	tneg	%icc,	0x4
	tneg	%xcc,	0x4
	udiv	%o6,	0x1077,	%o4
	move	%xcc,	%l3,	%i0
	movne	%icc,	%o5,	%l4
	fbul	%fcc0,	loop_314
	subccc	%o7,	%i7,	%i1
	fmul8sux16	%f6,	%f0,	%f10
	tcc	%icc,	0x0
loop_314:
	bneg	%xcc,	loop_315
	fmul8x16	%f0,	%f18,	%f18
	fbl,a	%fcc2,	loop_316
	movge	%icc,	%g2,	%o0
loop_315:
	movge	%icc,	%l1,	%i4
	edge32n	%g4,	%i5,	%g1
loop_316:
	taddcctv	%g7,	0x102A,	%g5
	stx	%o3,	[%l7 + 0x50]
	wr	%g0,	0x2b,	%asi
	stha	%l2,	[%l7 + 0x26] %asi
	membar	#Sync
	sllx	%l6,	0x0B,	%o1
	fsrc1s	%f27,	%f28
	set	0x16, %g2
	ldsba	[%l7 + %g2] 0x88,	%i3
	tn	%xcc,	0x0
	alignaddr	%l0,	%l5,	%g3
	smul	%i2,	0x1CD9,	%g6
	xnor	%i6,	%o6,	%o2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbg	%fcc1,	loop_317
	fmul8x16al	%f28,	%f25,	%f8
	fnegs	%f4,	%f17
	tsubcctv	%l3,	0x1FCC,	%i0
loop_317:
	fpadd16s	%f25,	%f12,	%f22
	subcc	%o4,	%o5,	%l4
	edge16ln	%i7,	%i1,	%g2
	set	0x2A, %o1
	ldsha	[%l7 + %o1] 0x81,	%o7
	add	%l1,	%i4,	%g4
	srax	%o0,	%g1,	%i5
	fmovdn	%xcc,	%f30,	%f4
	edge8ln	%g5,	%g7,	%l2
	movgu	%xcc,	%o3,	%l6
	movrgez	%i3,	%o1,	%l5
	taddcc	%g3,	%i2,	%l0
	fmovdvc	%xcc,	%f5,	%f5
	add	%i6,	0x1C9C,	%o6
	tn	%xcc,	0x2
	wr	%g0,	0x04,	%asi
	ldsha	[%l7 + 0x2E] %asi,	%g6
	movrgz	%l3,	%i0,	%o2
	mova	%icc,	%o5,	%o4
	bg,a	loop_318
	be,a,pt	%xcc,	loop_319
	movrne	%i7,	%i1,	%l4
	xor	%o7,	%g2,	%l1
loop_318:
	movne	%icc,	%i4,	%g4
loop_319:
	bge,pt	%icc,	loop_320
	prefetch	[%l7 + 0x38],	 0x3
	movne	%xcc,	%o0,	%g1
	lduh	[%l7 + 0x34],	%g5
loop_320:
	ldx	[%l7 + 0x28],	%i5
	taddcc	%l2,	0x08D0,	%o3
	set	0x70, %i0
	swapa	[%l7 + %i0] 0x10,	%l6
	alignaddrl	%i3,	%o1,	%g7
	faligndata	%f4,	%f2,	%f20
	movre	%g3,	%l5,	%i2
	fmovdcc	%icc,	%f9,	%f12
	fmovscc	%icc,	%f4,	%f14
	fxor	%f22,	%f26,	%f4
	array8	%i6,	%l0,	%o6
	swap	[%l7 + 0x7C],	%g6
	array16	%l3,	%o2,	%i0
	fmovsvs	%icc,	%f28,	%f13
	tle	%xcc,	0x2
	umulcc	%o5,	0x15B4,	%o4
	sllx	%i7,	%l4,	%o7
	fnot2	%f4,	%f12
	brnz,a	%i1,	loop_321
	addc	%l1,	%i4,	%g2
	movn	%icc,	%g4,	%o0
	fmovdleu	%icc,	%f20,	%f19
loop_321:
	brnz	%g1,	loop_322
	orn	%i5,	0x16E3,	%l2
	fmovsn	%icc,	%f12,	%f8
	nop
	setx	loop_323,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_322:
	sethi	0x1E10,	%o3
	set	0x14, %l3
	stha	%g5,	[%l7 + %l3] 0x14
loop_323:
	umulcc	%i3,	0x15CA,	%o1
	fxnors	%f27,	%f7,	%f30
	ta	%icc,	0x5
	fmovrde	%l6,	%f10,	%f24
	brgz,a	%g3,	loop_324
	fmuld8sux16	%f16,	%f0,	%f24
	sub	%g7,	0x0CDB,	%l5
	set	0x22, %l1
	lduha	[%l7 + %l1] 0x18,	%i2
loop_324:
	xor	%l0,	%o6,	%i6
	wr	%g0,	0x1f,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
	mulx	%l3,	%g6,	%i0
	fmovsneg	%xcc,	%f6,	%f25
	srlx	%o2,	%o4,	%o5
	alignaddr	%l4,	%i7,	%i1
	tpos	%icc,	0x1
	movvs	%xcc,	%o7,	%i4
	srax	%g2,	0x07,	%l1
	tcs	%icc,	0x6
	fbn	%fcc0,	loop_325
	sdiv	%g4,	0x15BA,	%g1
	tne	%xcc,	0x6
	udivcc	%o0,	0x041C,	%l2
loop_325:
	brz,a	%i5,	loop_326
	fbu	%fcc3,	loop_327
	tge	%xcc,	0x2
	movrgz	%g5,	0x176,	%i3
loop_326:
	movpos	%xcc,	%o1,	%l6
loop_327:
	tcc	%xcc,	0x6
	addccc	%g3,	%g7,	%l5
	fmovrslz	%o3,	%f27,	%f26
	edge16n	%i2,	%l0,	%i6
	fxor	%f6,	%f30,	%f24
	udiv	%o6,	0x19CF,	%g6
	mova	%xcc,	%i0,	%l3
	edge16l	%o4,	%o5,	%o2
	wr	%g0,	0x10,	%asi
	ldsba	[%l7 + 0x0E] %asi,	%i7
	sub	%l4,	0x095C,	%i1
	fmovsgu	%icc,	%f23,	%f2
	fblg	%fcc1,	loop_328
	array8	%o7,	%i4,	%l1
	brlz,a	%g2,	loop_329
	srl	%g1,	0x1E,	%g4
loop_328:
	brgz	%l2,	loop_330
	fmovdvs	%xcc,	%f29,	%f2
loop_329:
	tneg	%icc,	0x4
	alignaddrl	%o0,	%g5,	%i5
loop_330:
	tl	%xcc,	0x6
	st	%f13,	[%l7 + 0x38]
	fones	%f7
	fmovsneg	%xcc,	%f12,	%f24
	tge	%icc,	0x5
	popc	0x13D3,	%i3
	sethi	0x130D,	%l6
	and	%o1,	0x0B23,	%g3
	srlx	%g7,	%l5,	%i2
	fpadd16	%f6,	%f24,	%f30
	fmovsvs	%xcc,	%f13,	%f22
	srax	%o3,	%l0,	%i6
	tne	%xcc,	0x1
	move	%xcc,	%g6,	%o6
	set	0x32, %o2
	stha	%i0,	[%l7 + %o2] 0x22
	membar	#Sync
	edge8l	%l3,	%o4,	%o5
	wr	%g0,	0x81,	%asi
	sta	%f9,	[%l7 + 0x34] %asi
	tn	%icc,	0x1
	fcmpgt32	%f6,	%f20,	%i7
	umul	%l4,	%o2,	%o7
	tneg	%xcc,	0x4
	bcc,a,pt	%xcc,	loop_331
	bleu,a,pn	%xcc,	loop_332
	fmovdg	%icc,	%f29,	%f25
	fmovdleu	%icc,	%f9,	%f12
loop_331:
	fble,a	%fcc2,	loop_333
loop_332:
	movvs	%xcc,	%i1,	%i4
	edge16ln	%g2,	%l1,	%g1
	set	0x70, %g4
	lduwa	[%l7 + %g4] 0x89,	%g4
loop_333:
	subc	%l2,	%g5,	%i5
	membar	0x1B
	movg	%xcc,	%o0,	%l6
	taddcctv	%o1,	0x1B0F,	%g3
	tn	%xcc,	0x1
	set	0x61, %o6
	lduba	[%l7 + %o6] 0x15,	%i3
	fcmpes	%fcc1,	%f28,	%f13
	alignaddrl	%l5,	%i2,	%o3
	fands	%f6,	%f14,	%f10
	wr	%g0,	0x2a,	%asi
	ldda	[%l7 + 0x30] %asi,	%l0
	tsubcctv	%g7,	0x05A1,	%i6
	set	0x40, %g1
	prefetcha	[%l7 + %g1] 0x10,	 0x3
	sdivcc	%g6,	0x1054,	%l3
	and	%i0,	0x15A9,	%o5
	addccc	%o4,	%i7,	%o2
	bg,pn	%icc,	loop_334
	ldsh	[%l7 + 0x12],	%o7
	orncc	%i1,	%l4,	%g2
	subccc	%l1,	%g1,	%i4
loop_334:
	and	%g4,	0x1EE8,	%l2
	edge32ln	%g5,	%o0,	%l6
	sir	0x1840
	movneg	%icc,	%i5,	%g3
	fmovsa	%xcc,	%f2,	%f3
	umul	%i3,	0x1E7E,	%l5
	sir	0x131D
	fabss	%f17,	%f17
	array16	%i2,	%o3,	%l0
	xorcc	%g7,	%o1,	%o6
	fmul8x16	%f17,	%f10,	%f0
	xnor	%g6,	%i6,	%i0
	set	0x30, %g3
	stwa	%l3,	[%l7 + %g3] 0x10
	mulscc	%o4,	%i7,	%o5
	fxors	%f3,	%f12,	%f14
	udiv	%o7,	0x1E15,	%o2
	orcc	%l4,	0x07AD,	%i1
	wr	%g0,	0x88,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	fabss	%f24,	%f23
	set	0x3C, %o7
	lduwa	[%l7 + %o7] 0x88,	%g2
	andcc	%g1,	%l1,	%i4
	mova	%xcc,	%g4,	%l2
	move	%xcc,	%g5,	%o0
	smulcc	%l6,	0x116E,	%g3
	fabss	%f5,	%f12
	movcc	%xcc,	%i3,	%i5
	fmovdneg	%xcc,	%f27,	%f10
	stb	%l5,	[%l7 + 0x2C]
	subcc	%i2,	0x1ACB,	%l0
	move	%icc,	%g7,	%o1
	movre	%o3,	0x27C,	%g6
	alignaddrl	%o6,	%i0,	%i6
	subcc	%o4,	%i7,	%o5
	smulcc	%l3,	0x11F6,	%o7
	nop
	set	0x60, %i6
	stx	%l4,	[%l7 + %i6]
	smul	%i1,	%o2,	%g2
	brgz	%l1,	loop_335
	edge8n	%g1,	%g4,	%i4
	std	%g4,	[%l7 + 0x30]
	umul	%l2,	%o0,	%l6
loop_335:
	fmovsl	%xcc,	%f3,	%f31
	st	%f10,	[%l7 + 0x10]
	fbuge,a	%fcc1,	loop_336
	fba,a	%fcc3,	loop_337
	fmovdge	%xcc,	%f22,	%f15
	stb	%i3,	[%l7 + 0x20]
loop_336:
	subccc	%g3,	%l5,	%i2
loop_337:
	fabss	%f4,	%f5
	fmuld8sux16	%f22,	%f9,	%f12
	nop
	setx	loop_338,	%l0,	%l1
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
	array16	%i5,	%l0,	%o1
	movg	%xcc,	%g7,	%o3
loop_338:
	xnor	%o6,	0x0CCB,	%i0
	fbe,a	%fcc2,	loop_339
	fmovdcs	%icc,	%f18,	%f23
	movre	%i6,	0x1D1,	%g6
	movrlz	%o4,	0x2AF,	%o5
loop_339:
	nop
	set	0x10, %l4
	stwa	%l3,	[%l7 + %l4] 0x88
	fbl	%fcc3,	loop_340
	tvs	%xcc,	0x1
	fbue,a	%fcc3,	loop_341
	srlx	%i7,	%l4,	%o7
loop_340:
	smulcc	%i1,	0x0AB2,	%o2
	movrlez	%l1,	%g2,	%g4
loop_341:
	movgu	%xcc,	%g1,	%g5
	wr	%g0,	0x04,	%asi
	lduwa	[%l7 + 0x54] %asi,	%i4
	edge16ln	%o0,	%l2,	%i3
	fcmpd	%fcc2,	%f10,	%f18
	sub	%g3,	%l5,	%i2
	andn	%i5,	0x0A4D,	%l6
	fmul8sux16	%f18,	%f28,	%f8
	add	%l0,	0x1B13,	%g7
	std	%f16,	[%l7 + 0x58]
	wr	%g0,	0x10,	%asi
	prefetcha	[%l7 + 0x60] %asi,	 0x3
	wr	%g0,	0xf0,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	membar	0x4B
	fone	%f8
	ble,pt	%icc,	loop_342
	subcc	%o6,	0x0B0E,	%i0
	add	%l7,	0x68,	%l6
	wr	%g0,	0x11,	%asi
	casxa	[%l6] %asi,	%o3,	%i6
loop_342:
	movgu	%xcc,	%g6,	%o4
	mova	%xcc,	%o5,	%l3
	fcmpne16	%f0,	%f2,	%l4
	fone	%f24
	edge32ln	%i7,	%o7,	%o2
	movrgz	%i1,	%g2,	%l1
	sdivcc	%g4,	0x1B22,	%g5
	array32	%g1,	%i4,	%o0
	udivcc	%l2,	0x1A27,	%g3
	movle	%xcc,	%i3,	%i2
	be,pt	%xcc,	loop_343
	srax	%i5,	%l6,	%l0
	sethi	0x00C7,	%l5
	wr	%g0,	0xf8,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
loop_343:
	fcmpgt32	%f6,	%f2,	%g7
	fcmpd	%fcc2,	%f20,	%f6
	andncc	%o1,	%o6,	%o3
	set	0x14, %o0
	swapa	[%l7 + %o0] 0x0c,	%i6
	tneg	%icc,	0x2
	fmovsn	%xcc,	%f22,	%f21
	lduw	[%l7 + 0x60],	%i0
	taddcctv	%o4,	0x1DBA,	%g6
	movpos	%icc,	%l3,	%o5
	bcs	%icc,	loop_344
	ta	%icc,	0x1
	movne	%xcc,	%i7,	%l4
	edge8ln	%o7,	%o2,	%i1
loop_344:
	fbge	%fcc1,	loop_345
	fnot1s	%f21,	%f10
	edge8n	%g2,	%l1,	%g5
	tn	%icc,	0x5
loop_345:
	umul	%g4,	0x19A1,	%i4
	tne	%xcc,	0x4
	movrgez	%g1,	%l2,	%g3
	set	0x10, %l0
	stxa	%i3,	[%l7 + %l0] 0x81
	sub	%o0,	%i5,	%l6
	set	0x40, %i7
	stda	%f0,	[%l7 + %i7] 0x0c
	fandnot2s	%f3,	%f14,	%f22
	fornot2s	%f4,	%f21,	%f25
	alignaddrl	%i2,	%l0,	%g7
	orcc	%l5,	%o6,	%o3
	ta	%icc,	0x0
	fmovdne	%xcc,	%f25,	%f5
	fcmps	%fcc1,	%f2,	%f27
	xnorcc	%i6,	0x141C,	%i0
	smul	%o4,	%o1,	%l3
	movl	%xcc,	%o5,	%i7
	fxor	%f6,	%f6,	%f22
	taddcctv	%g6,	0x0473,	%o7
	fbul,a	%fcc3,	loop_346
	fands	%f12,	%f26,	%f20
	set	0x2E, %i2
	ldstuba	[%l7 + %i2] 0x11,	%o2
loop_346:
	xnor	%l4,	%i1,	%g2
	lduw	[%l7 + 0x40],	%l1
	movre	%g4,	0x21D,	%g5
	brgz	%g1,	loop_347
	array16	%i4,	%l2,	%i3
	sll	%g3,	%o0,	%i5
	udiv	%l6,	0x19EA,	%i2
loop_347:
	andn	%l0,	%l5,	%g7
	fnegs	%f18,	%f2
	tleu	%icc,	0x1
	fmuld8sux16	%f3,	%f25,	%f28
	fmovrdgz	%o3,	%f10,	%f10
	xnor	%i6,	%i0,	%o4
	ba	%xcc,	loop_348
	movre	%o6,	0x019,	%o1
	orncc	%l3,	%i7,	%o5
	fbul	%fcc1,	loop_349
loop_348:
	bgu,pn	%xcc,	loop_350
	xor	%g6,	0x09CC,	%o7
	edge16ln	%o2,	%i1,	%l4
loop_349:
	srax	%g2,	0x18,	%g4
loop_350:
	fmovsl	%xcc,	%f13,	%f24
	fbn	%fcc3,	loop_351
	sub	%g5,	0x096D,	%l1
	movl	%icc,	%i4,	%l2
	fornot2	%f30,	%f24,	%f26
loop_351:
	tn	%icc,	0x1
	movg	%xcc,	%g1,	%i3
	smul	%o0,	0x1268,	%g3
	tne	%icc,	0x5
	xnor	%l6,	0x16AD,	%i5
	udivcc	%l0,	0x0CDC,	%i2
	swap	[%l7 + 0x2C],	%g7
	orncc	%o3,	%l5,	%i0
	ldstub	[%l7 + 0x53],	%o4
	fmovrdgez	%o6,	%f28,	%f8
	add	%l7,	0x30,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] %asi,	%o1,	%l3
	fmovdcc	%xcc,	%f9,	%f9
	edge16ln	%i7,	%o5,	%g6
	tne	%xcc,	0x6
	ble,a	loop_352
	popc	0x00E3,	%o7
	ble,a	%icc,	loop_353
	lduw	[%l7 + 0x1C],	%i6
loop_352:
	brgz	%o2,	loop_354
	te	%xcc,	0x0
loop_353:
	edge8	%i1,	%g2,	%l4
	tg	%xcc,	0x3
loop_354:
	andcc	%g4,	0x0A77,	%g5
	wr	%g0,	0x88,	%asi
	lduba	[%l7 + 0x6A] %asi,	%l1
	fmovrdgz	%i4,	%f26,	%f4
	tle	%xcc,	0x1
	xnor	%g1,	%i3,	%o0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrne	%g3,	0x000,	%l6
	udivx	%l2,	0x0E8E,	%i5
	membar	0x04
	bleu,pn	%icc,	loop_355
	smulcc	%l0,	%i2,	%o3
	stw	%l5,	[%l7 + 0x10]
	fba,a	%fcc1,	loop_356
loop_355:
	fnand	%f14,	%f18,	%f22
	wr	%g0,	0x04,	%asi
	stha	%g7,	[%l7 + 0x5A] %asi
loop_356:
	brlez,a	%i0,	loop_357
	sub	%o4,	%o1,	%l3
	edge32l	%o6,	%i7,	%g6
	brz,a	%o7,	loop_358
loop_357:
	std	%f12,	[%l7 + 0x58]
	stbar
	andn	%i6,	0x0CDF,	%o5
loop_358:
	fbne	%fcc0,	loop_359
	smulcc	%i1,	%o2,	%l4
	ld	[%l7 + 0x78],	%f24
	fornot1	%f2,	%f14,	%f10
loop_359:
	sdivx	%g4,	0x1C71,	%g5
	subcc	%g2,	%l1,	%g1
	bge	%icc,	loop_360
	edge8l	%i3,	%i4,	%o0
	edge16n	%g3,	%l6,	%l2
	umulcc	%i5,	%i2,	%o3
loop_360:
	tvs	%xcc,	0x2
	bleu	%xcc,	loop_361
	xnorcc	%l0,	%g7,	%i0
	movre	%l5,	0x2EC,	%o1
	bvc,a	%icc,	loop_362
loop_361:
	orncc	%o4,	%l3,	%i7
	tcs	%icc,	0x4
	xnorcc	%g6,	%o6,	%i6
loop_362:
	movge	%icc,	%o5,	%o7
	fmovsvs	%icc,	%f31,	%f21
	fbuge,a	%fcc1,	loop_363
	sdivx	%i1,	0x100C,	%l4
	bne,pt	%xcc,	loop_364
	fbu	%fcc0,	loop_365
loop_363:
	fandnot1	%f28,	%f20,	%f28
	alignaddr	%o2,	%g5,	%g2
loop_364:
	fmovsne	%icc,	%f18,	%f28
loop_365:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bpos	%icc,	loop_366
	movrgz	%l1,	0x1B8,	%g1
	orn	%g4,	0x12AF,	%i3
	add	%l7,	0x58,	%l6
	wr	%g0,	0x0c,	%asi
	lda	[%l6] %asi,	%o0
	casa	[%l6] %asi,	%o0,	%g3
loop_366:
	sra	%l6,	%l2,	%i4
	wr	%g0,	0x22,	%asi
	stha	%i5,	[%l7 + 0x40] %asi
	membar	#Sync
	edge8n	%i2,	%l0,	%o3
	bvs,a	loop_367
	edge32ln	%g7,	%i0,	%o1
	sub	%l5,	0x019E,	%o4
	bvc	%icc,	loop_368
loop_367:
	fnot2	%f24,	%f4
	fornot2s	%f17,	%f21,	%f18
	wr	%g0,	0x19,	%asi
	prefetcha	[%l7 + 0x28] %asi,	 0x1
loop_368:
	nop
	set	0x74, %l6
	swapa	[%l7 + %l6] 0x18,	%l3
	tcs	%icc,	0x7
	set	0x38, %o4
	ldxa	[%l7 + %o4] 0x88,	%o6
	orcc	%i6,	%g6,	%o7
	udiv	%i1,	0x0BD2,	%o5
	fmovrslez	%o2,	%f1,	%f18
	bn,a,pn	%icc,	loop_369
	fornot1	%f20,	%f10,	%f14
	sdivx	%l4,	0x1219,	%g5
	ta	%icc,	0x2
loop_369:
	stbar
	movleu	%icc,	%l1,	%g1
	fblg,a	%fcc0,	loop_370
	fpmerge	%f3,	%f9,	%f14
	sdivx	%g2,	0x111D,	%i3
	fpsub16s	%f27,	%f10,	%f23
loop_370:
	popc	%g4,	%o0
	array16	%l6,	%g3,	%i4
	fmovs	%f5,	%f25
	movvs	%icc,	%l2,	%i2
	wr	%g0,	0x5f,	%asi
	stxa	%i5,	[%g0 + 0x0] %asi
	movpos	%icc,	%o3,	%l0
	flush	%l7 + 0x2C
	addc	%i0,	%o1,	%g7
	xor	%l5,	0x0AB5,	%o4
	xor	%i7,	%o6,	%l3
	fmovdcc	%xcc,	%f23,	%f16
	xor	%i6,	%o7,	%i1
	orncc	%g6,	%o5,	%o2
	be	%xcc,	loop_371
	fmovdcc	%icc,	%f8,	%f21
	addcc	%l4,	0x0B94,	%g5
	wr	%g0,	0x10,	%asi
	swapa	[%l7 + 0x6C] %asi,	%g1
loop_371:
	fmovscc	%icc,	%f26,	%f11
	sub	%l1,	%g2,	%g4
	mova	%xcc,	%o0,	%i3
	ta	%xcc,	0x6
	alignaddr	%l6,	%g3,	%i4
	movvs	%xcc,	%i2,	%i5
	fmovscc	%icc,	%f20,	%f23
	fmovsgu	%xcc,	%f18,	%f31
	sdivcc	%l2,	0x1D14,	%l0
	fmul8x16au	%f23,	%f30,	%f14
	fandnot2s	%f31,	%f21,	%f24
	fmovdpos	%icc,	%f10,	%f8
	fcmpd	%fcc0,	%f22,	%f18
	tsubcctv	%o3,	0x1FF3,	%i0
	addcc	%g7,	%o1,	%l5
	fmovsneg	%xcc,	%f20,	%f12
	sdivx	%o4,	0x0089,	%o6
	fmovsvs	%xcc,	%f4,	%f31
	fnot2s	%f18,	%f26
	fpsub16	%f0,	%f22,	%f14
	move	%xcc,	%l3,	%i6
	move	%icc,	%o7,	%i1
	subc	%g6,	%i7,	%o5
	taddcc	%l4,	0x1280,	%g5
	fpsub16	%f12,	%f28,	%f14
	tne	%icc,	0x2
	mova	%xcc,	%o2,	%l1
	array16	%g2,	%g4,	%o0
	fpsub16s	%f16,	%f15,	%f9
	tsubcc	%g1,	0x1048,	%i3
	membar	#Sync
	wr	%g0,	0xf1,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	movrlez	%g3,	0x15B,	%l6
	and	%i4,	0x02C5,	%i5
	tneg	%xcc,	0x2
	set	0x0A, %i3
	stha	%l2,	[%l7 + %i3] 0x0c
	sll	%l0,	%o3,	%i0
	mulscc	%g7,	0x170D,	%i2
	movrlez	%o1,	%l5,	%o4
	edge16n	%o6,	%l3,	%o7
	edge8l	%i1,	%g6,	%i6
	fmovda	%icc,	%f8,	%f17
	orncc	%o5,	%i7,	%g5
	tne	%icc,	0x1
	sllx	%l4,	%o2,	%l1
	stbar
	movcc	%icc,	%g4,	%g2
	fmovrde	%g1,	%f6,	%f30
	movn	%icc,	%o0,	%g3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x61, %i5
	ldstuba	[%l7 + %i5] 0x11,	%l6
	sdivx	%i3,	0x1C67,	%i5
	bpos,pn	%icc,	loop_372
	bcc,pn	%xcc,	loop_373
	sll	%l2,	0x04,	%i4
	srl	%l0,	%o3,	%i0
loop_372:
	fnot2s	%f0,	%f7
loop_373:
	nop
	set	0x38, %l5
	ldstuba	[%l7 + %l5] 0x04,	%g7
	fmovsle	%icc,	%f27,	%f28
	tne	%icc,	0x6
	edge16l	%o1,	%l5,	%o4
	sethi	0x1AAF,	%o6
	fbn	%fcc0,	loop_374
	edge8l	%l3,	%o7,	%i2
	edge16l	%i1,	%i6,	%g6
	bvc,a	%icc,	loop_375
loop_374:
	movrlz	%o5,	%i7,	%g5
	umulcc	%l4,	0x192C,	%l1
	fmovrslez	%o2,	%f5,	%f18
loop_375:
	for	%f20,	%f10,	%f12
	membar	0x4C
	fmovsvc	%xcc,	%f5,	%f5
	andn	%g4,	0x1E1D,	%g2
	smul	%o0,	0x1CB7,	%g1
	movrgez	%g3,	0x2F5,	%l6
	edge8	%i5,	%i3,	%i4
	bvc	%icc,	loop_376
	fbu	%fcc1,	loop_377
	orcc	%l0,	%o3,	%l2
	fpack16	%f8,	%f25
loop_376:
	andncc	%i0,	%o1,	%g7
loop_377:
	subcc	%l5,	%o4,	%o6
	and	%o7,	%l3,	%i1
	movrlz	%i6,	%g6,	%i2
	fmovde	%icc,	%f26,	%f31
	or	%i7,	0x09A9,	%o5
	alignaddr	%g5,	%l4,	%l1
	fnor	%f20,	%f10,	%f0
	fmuld8sux16	%f26,	%f25,	%f12
	fcmpeq16	%f26,	%f12,	%g4
	movcc	%icc,	%g2,	%o2
	addccc	%o0,	0x1CD1,	%g1
	membar	0x2B
	siam	0x5
	set	0x64, %i4
	lda	[%l7 + %i4] 0x11,	%f26
	mulscc	%g3,	0x164F,	%l6
	fandnot2	%f8,	%f12,	%f18
	set	0x34, %o5
	swapa	[%l7 + %o5] 0x18,	%i3
	bg	%icc,	loop_378
	array16	%i5,	%l0,	%i4
	fbl	%fcc3,	loop_379
	srl	%l2,	%o3,	%i0
loop_378:
	movrlez	%o1,	%l5,	%g7
	movrgz	%o6,	0x32B,	%o4
loop_379:
	bleu	%icc,	loop_380
	fmovda	%xcc,	%f15,	%f14
	or	%l3,	%i1,	%o7
	movge	%xcc,	%i6,	%i2
loop_380:
	udiv	%g6,	0x192C,	%i7
	fpsub16s	%f16,	%f13,	%f29
	movn	%icc,	%o5,	%l4
	bleu	loop_381
	edge32	%l1,	%g4,	%g5
	tgu	%xcc,	0x5
	umul	%o2,	%o0,	%g1
loop_381:
	fexpand	%f28,	%f0
	fbge	%fcc2,	loop_382
	fbu	%fcc2,	loop_383
	movl	%icc,	%g3,	%l6
	bvc,a,pt	%icc,	loop_384
loop_382:
	alignaddr	%g2,	%i5,	%l0
loop_383:
	fbg,a	%fcc3,	loop_385
	tleu	%icc,	0x7
loop_384:
	te	%icc,	0x5
	fbne,a	%fcc2,	loop_386
loop_385:
	xorcc	%i3,	%l2,	%i4
	and	%o3,	0x046A,	%i0
	fnot2	%f24,	%f28
loop_386:
	flush	%l7 + 0x58
	fpack32	%f30,	%f24,	%f10
	xnorcc	%o1,	0x0F3F,	%l5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdcs	%icc,	%f7,	%f24
	udivx	%g7,	0x1578,	%o4
	stb	%o6,	[%l7 + 0x11]
	fbo,a	%fcc1,	loop_387
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fandnot1s	%f20,	%f3,	%f30
	fexpand	%f0,	%f24
loop_387:
	orn	%l3,	0x1797,	%i1
	alignaddr	%i6,	%o7,	%i2
	fexpand	%f8,	%f18
	fandnot1s	%f2,	%f23,	%f30
	popc	0x1DC9,	%i7
	movn	%icc,	%g6,	%o5
	fmovdle	%xcc,	%f3,	%f30
	sll	%l1,	%l4,	%g5
	fsrc2s	%f26,	%f13
	fmovrslez	%o2,	%f24,	%f4
	taddcc	%g4,	0x10DA,	%o0
	call	loop_388
	udivx	%g3,	0x18FD,	%l6
	fbo,a	%fcc2,	loop_389
	and	%g2,	0x0500,	%i5
loop_388:
	bpos,pt	%icc,	loop_390
	fabsd	%f24,	%f24
loop_389:
	swap	[%l7 + 0x58],	%g1
	array32	%l0,	%l2,	%i4
loop_390:
	fbule	%fcc3,	loop_391
	edge16	%o3,	%i0,	%o1
	faligndata	%f18,	%f0,	%f4
	tleu	%icc,	0x6
loop_391:
	and	%l5,	0x0735,	%i3
	tge	%xcc,	0x0
	ble,pt	%xcc,	loop_392
	movne	%icc,	%g7,	%o4
	fnegs	%f18,	%f20
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_392:
	fba,a	%fcc0,	loop_393
	fmuld8ulx16	%f24,	%f27,	%f26
	andn	%o6,	%i1,	%l3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_393:
	fbue,a	%fcc1,	loop_394
	movpos	%xcc,	%i6,	%o7
	popc	0x0A0F,	%i7
	udivcc	%i2,	0x1263,	%g6
loop_394:
	taddcctv	%o5,	0x1D33,	%l1
	array8	%l4,	%g5,	%o2
	fmovrslez	%g4,	%f5,	%f21
	fpsub32	%f24,	%f2,	%f12
	flush	%l7 + 0x70
	fbuge	%fcc0,	loop_395
	sdivcc	%g3,	0x0517,	%l6
	ldsh	[%l7 + 0x6E],	%o0
	fbue,a	%fcc0,	loop_396
loop_395:
	ldx	[%l7 + 0x68],	%g2
	bge,pn	%icc,	loop_397
	tgu	%xcc,	0x3
loop_396:
	fmovrdgz	%g1,	%f30,	%f6
	movcc	%icc,	%i5,	%l0
loop_397:
	nop
	add	%l7,	0x10,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%l2
	casa	[%l6] %asi,	%l2,	%o3
	std	%i4,	[%l7 + 0x20]
	edge32n	%o1,	%l5,	%i3
	fxnor	%f4,	%f26,	%f20
	srlx	%i0,	%g7,	%o6
	subcc	%i1,	0x068E,	%l3
	tgu	%xcc,	0x4
	wr	%g0,	0x89,	%asi
	swapa	[%l7 + 0x14] %asi,	%o4
	fpadd16	%f2,	%f0,	%f6
	fmovdcc	%xcc,	%f27,	%f1
	subc	%i6,	0x0CF9,	%o7
	membar	0x4D
	fbo	%fcc2,	loop_398
	fexpand	%f7,	%f20
	bge,a	%icc,	loop_399
	bvc,a,pt	%icc,	loop_400
loop_398:
	membar	0x6F
	edge8n	%i7,	%g6,	%i2
loop_399:
	fmovspos	%icc,	%f23,	%f6
loop_400:
	fbl,a	%fcc0,	loop_401
	add	%l1,	%o5,	%g5
	brgez	%o2,	loop_402
	movneg	%icc,	%g4,	%g3
loop_401:
	umulcc	%l4,	%l6,	%g2
	movvc	%icc,	%g1,	%i5
loop_402:
	addccc	%o0,	%l0,	%l2
	tgu	%xcc,	0x6
	brnz	%o3,	loop_403
	fsrc1	%f0,	%f20
	fmovrdlz	%o1,	%f30,	%f2
	fmovda	%xcc,	%f3,	%f23
loop_403:
	udivx	%l5,	0x191D,	%i3
	stx	%i0,	[%l7 + 0x68]
	fabsd	%f2,	%f8
	fmovdl	%xcc,	%f11,	%f15
	tne	%icc,	0x2
	fxor	%f10,	%f18,	%f10
	movrlz	%g7,	0x317,	%i4
	xorcc	%o6,	%i1,	%l3
	add	%o4,	0x1F91,	%i6
	udivcc	%o7,	0x0108,	%g6
	movrgz	%i7,	%i2,	%o5
	wr	%g0,	0x11,	%asi
	ldswa	[%l7 + 0x4C] %asi,	%g5
	wr	%g0,	0x81,	%asi
	ldswa	[%l7 + 0x4C] %asi,	%l1
	movrgz	%g4,	0x1CD,	%g3
	fmovspos	%icc,	%f1,	%f28
	srl	%o2,	%l6,	%l4
	movrgez	%g1,	0x243,	%g2
	movcc	%xcc,	%i5,	%l0
	tcc	%xcc,	0x4
	set	0x28, %i1
	stda	%l2,	[%l7 + %i1] 0x18
	srlx	%o3,	%o0,	%l5
	edge32	%o1,	%i3,	%g7
	wr	%g0,	0x80,	%asi
	sta	%f16,	[%l7 + 0x70] %asi
	fpackfix	%f22,	%f12
	mulscc	%i4,	%i0,	%i1
	edge32n	%o6,	%o4,	%l3
	movpos	%icc,	%o7,	%g6
	fabsd	%f14,	%f20
	ta	%xcc,	0x2
	addc	%i7,	%i6,	%o5
	edge8ln	%i2,	%g5,	%l1
	fmovrde	%g3,	%f26,	%f14
	wr	%g0,	0x23,	%asi
	ldda	[%l7 + 0x10] %asi,	%o2
	fzeros	%f11
	tle	%icc,	0x3
	movle	%xcc,	%g4,	%l4
	bge	loop_404
	ta	%icc,	0x4
	fbul	%fcc1,	loop_405
	subc	%l6,	0x11B9,	%g2
loop_404:
	subc	%g1,	0x1CB4,	%l0
	fcmpne16	%f6,	%f28,	%i5
loop_405:
	movvs	%icc,	%o3,	%l2
	fpsub16s	%f14,	%f9,	%f1
	taddcctv	%l5,	0x1220,	%o0
	fmovs	%f20,	%f14
	wr	%g0,	0x11,	%asi
	prefetcha	[%l7 + 0x10] %asi,	 0x1
	movl	%icc,	%i3,	%g7
	edge16ln	%i0,	%i4,	%o6
	umul	%i1,	0x0839,	%o4
	edge8l	%o7,	%l3,	%g6
	bvs,pt	%xcc,	loop_406
	bcs,a,pn	%xcc,	loop_407
	nop
	setx	loop_408,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tl	%icc,	0x4
loop_406:
	mova	%xcc,	%i7,	%o5
loop_407:
	tcs	%xcc,	0x5
loop_408:
	movl	%icc,	%i6,	%i2
	brz	%l1,	loop_409
	fble,a	%fcc1,	loop_410
	movrgez	%g5,	%o2,	%g3
	srax	%g4,	0x05,	%l6
loop_409:
	andn	%g2,	%g1,	%l4
loop_410:
	addc	%i5,	0x16F8,	%o3
	mulscc	%l2,	0x0251,	%l5
	edge32n	%o0,	%l0,	%i3
	movneg	%icc,	%o1,	%g7
	movcc	%icc,	%i4,	%i0
	tsubcc	%o6,	0x01C1,	%o4
	alignaddr	%i1,	%o7,	%l3
	tpos	%icc,	0x7
	sra	%i7,	0x12,	%g6
	movrlez	%i6,	0x0C3,	%o5
	fzeros	%f14
	sethi	0x0291,	%l1
	subcc	%i2,	%g5,	%g3
	bcc,a	%icc,	loop_411
	tcs	%xcc,	0x4
	sll	%o2,	0x03,	%l6
	mova	%xcc,	%g2,	%g4
loop_411:
	tsubcc	%g1,	0x170F,	%i5
	fmuld8sux16	%f10,	%f16,	%f12
	fcmpd	%fcc1,	%f16,	%f28
	brgez,a	%o3,	loop_412
	movgu	%xcc,	%l4,	%l5
	edge8n	%o0,	%l2,	%i3
	umul	%o1,	%l0,	%i4
loop_412:
	fbl	%fcc0,	loop_413
	fble	%fcc1,	loop_414
	stb	%g7,	[%l7 + 0x26]
	fbug	%fcc3,	loop_415
loop_413:
	fmovsvs	%xcc,	%f3,	%f17
loop_414:
	pdist	%f26,	%f24,	%f22
	movpos	%icc,	%i0,	%o6
loop_415:
	movneg	%xcc,	%i1,	%o4
	fmovrdlez	%o7,	%f20,	%f0
	wr	%g0,	0x19,	%asi
	prefetcha	[%l7 + 0x68] %asi,	 0x2
	bl,a	%icc,	loop_416
	movrne	%l3,	0x35D,	%g6
	movcs	%xcc,	%o5,	%l1
	fmovsvc	%xcc,	%f31,	%f3
loop_416:
	nop
	setx	loop_417,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tl	%icc,	0x5
	movrlz	%i2,	%i6,	%g3
	movg	%icc,	%o2,	%l6
loop_417:
	movrgez	%g2,	0x170,	%g5
	move	%xcc,	%g4,	%i5
	subccc	%g1,	%o3,	%l5
	wr	%g0,	0x0c,	%asi
	stha	%l4,	[%l7 + 0x54] %asi
	fnot1s	%f20,	%f16
	taddcc	%o0,	%l2,	%o1
	lduw	[%l7 + 0x24],	%i3
	orncc	%i4,	0x13EB,	%g7
	te	%icc,	0x4
	movpos	%icc,	%l0,	%i0
	fmovdleu	%xcc,	%f1,	%f17
	fcmple32	%f20,	%f30,	%o6
	bpos	%icc,	loop_418
	edge8l	%o4,	%i1,	%i7
	subccc	%o7,	%l3,	%o5
	udivcc	%l1,	0x16D6,	%i2
loop_418:
	bg,a,pn	%xcc,	loop_419
	bg	%xcc,	loop_420
	edge16n	%g6,	%g3,	%o2
	edge8n	%i6,	%l6,	%g5
loop_419:
	fmul8x16	%f28,	%f30,	%f20
loop_420:
	nop
	set	0x79, %l2
	ldstuba	[%l7 + %l2] 0x18,	%g4
	stbar
	fble	%fcc0,	loop_421
	movrlz	%g2,	%i5,	%g1
	move	%icc,	%l5,	%o3
	fnegs	%f27,	%f23
loop_421:
	smul	%l4,	%o0,	%l2
	movg	%icc,	%o1,	%i4
	wr	%g0,	0x22,	%asi
	stba	%g7,	[%l7 + 0x7B] %asi
	membar	#Sync
	orcc	%l0,	0x13BE,	%i0
	tgu	%xcc,	0x1
	movpos	%icc,	%o6,	%o4
	wr	%g0,	0x0c,	%asi
	ldsha	[%l7 + 0x1E] %asi,	%i3
	movg	%icc,	%i7,	%o7
	udiv	%l3,	0x1AEC,	%i1
	fmovdvs	%xcc,	%f15,	%f2
	movg	%icc,	%o5,	%l1
	fornot1	%f22,	%f2,	%f10
	edge16	%i2,	%g3,	%o2
	alignaddr	%i6,	%g6,	%l6
	std	%f20,	[%l7 + 0x70]
	tn	%icc,	0x6
	sub	%g4,	0x0EEB,	%g5
	movrlz	%i5,	%g1,	%g2
	ba,a	%xcc,	loop_422
	ldub	[%l7 + 0x4E],	%o3
	sdiv	%l5,	0x1281,	%l4
	edge32n	%l2,	%o0,	%i4
loop_422:
	movrgez	%g7,	%l0,	%i0
	andn	%o1,	0x0204,	%o6
	xnorcc	%o4,	0x16A9,	%i3
	fpsub32s	%f20,	%f12,	%f8
	fmovs	%f11,	%f9
	swap	[%l7 + 0x3C],	%o7
	xnorcc	%i7,	%l3,	%o5
	orncc	%l1,	%i2,	%g3
	orn	%i1,	%o2,	%i6
	edge16ln	%g6,	%g4,	%l6
	movrgz	%i5,	%g5,	%g2
	edge16n	%g1,	%o3,	%l5
	fcmple16	%f24,	%f2,	%l4
	fmovrdlz	%o0,	%f8,	%f24
	ldstub	[%l7 + 0x6F],	%i4
	fmovrsgz	%g7,	%f27,	%f12
	movrlz	%l2,	0x25B,	%l0
	umulcc	%i0,	%o1,	%o6
	tcs	%icc,	0x0
	fxnors	%f19,	%f0,	%f21
	fpadd16s	%f20,	%f18,	%f9
	orncc	%o4,	%i3,	%i7
	umul	%o7,	%l3,	%l1
	fand	%f4,	%f14,	%f14
	xor	%i2,	0x1B00,	%g3
	subcc	%i1,	%o5,	%i6
	alignaddrl	%o2,	%g4,	%g6
	umulcc	%l6,	0x0A10,	%i5
	lduh	[%l7 + 0x12],	%g5
	edge8ln	%g1,	%o3,	%g2
	movrlez	%l5,	%o0,	%i4
	movg	%xcc,	%l4,	%l2
	movneg	%icc,	%g7,	%l0
	wr	%g0,	0x88,	%asi
	ldxa	[%l7 + 0x08] %asi,	%o1
	tsubcctv	%i0,	%o6,	%i3
	andcc	%i7,	%o7,	%l3
	array8	%o4,	%l1,	%g3
	fmovsa	%icc,	%f23,	%f21
	smul	%i1,	%o5,	%i6
	sll	%o2,	%i2,	%g6
	srl	%g4,	%i5,	%l6
	sdivx	%g5,	0x190F,	%g1
	wr	%g0,	0x89,	%asi
	ldsha	[%l7 + 0x0A] %asi,	%g2
	ldub	[%l7 + 0x74],	%o3
	stb	%o0,	[%l7 + 0x62]
	edge16n	%i4,	%l4,	%l5
	fmuld8sux16	%f13,	%f0,	%f16
	bneg,a,pn	%xcc,	loop_423
	brlez	%l2,	loop_424
	fmovrdne	%l0,	%f20,	%f10
	ta	%icc,	0x6
loop_423:
	bleu,a,pn	%xcc,	loop_425
loop_424:
	sub	%g7,	0x0F6F,	%i0
	ldsb	[%l7 + 0x1D],	%o6
	set	0x28, %g5
	ldswa	[%l7 + %g5] 0x11,	%i3
loop_425:
	alignaddrl	%o1,	%o7,	%i7
	nop
	setx	loop_426,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	xorcc	%o4,	0x15A8,	%l1
	fzero	%f14
	xor	%g3,	%i1,	%o5
loop_426:
	movvc	%xcc,	%l3,	%o2
	bn,pn	%icc,	loop_427
	fblg,a	%fcc0,	loop_428
	fandnot1	%f8,	%f26,	%f16
	sdivx	%i6,	0x0319,	%i2
loop_427:
	fpadd16	%f12,	%f6,	%f24
loop_428:
	sdivcc	%g4,	0x057B,	%i5
	brz	%l6,	loop_429
	movrlez	%g6,	%g5,	%g2
	movrlez	%g1,	0x0C1,	%o0
	sdiv	%i4,	0x122F,	%o3
loop_429:
	fbul,a	%fcc1,	loop_430
	sth	%l5,	[%l7 + 0x2A]
	fmovrslz	%l2,	%f16,	%f29
	xnor	%l0,	0x1D21,	%l4
loop_430:
	ldsw	[%l7 + 0x5C],	%i0
	movle	%xcc,	%o6,	%i3
	tcc	%xcc,	0x1
	stbar
	fbg,a	%fcc3,	loop_431
	udiv	%o1,	0x18EC,	%g7
	sll	%i7,	0x1A,	%o7
	and	%l1,	0x1190,	%o4
loop_431:
	srl	%g3,	0x00,	%o5
	sll	%i1,	0x18,	%o2
	set	0x44, %g7
	lduwa	[%l7 + %g7] 0x89,	%i6
	membar	0x18
	fpadd32	%f8,	%f2,	%f10
	fbule	%fcc3,	loop_432
	addc	%l3,	0x17C2,	%i2
	movg	%xcc,	%i5,	%g4
	subcc	%l6,	%g6,	%g5
loop_432:
	tsubcc	%g2,	0x0D85,	%g1
	xnor	%o0,	%o3,	%l5
	stx	%l2,	[%l7 + 0x48]
	fbul	%fcc0,	loop_433
	stx	%i4,	[%l7 + 0x10]
	fmovdg	%xcc,	%f15,	%f30
	pdist	%f22,	%f14,	%f14
loop_433:
	srlx	%l0,	%l4,	%o6
	alignaddrl	%i0,	%o1,	%g7
	movl	%icc,	%i7,	%o7
	orn	%l1,	0x1488,	%o4
	andcc	%i3,	%o5,	%g3
	movrlez	%o2,	0x1E2,	%i6
	fmovrslez	%l3,	%f1,	%f27
	fmovrdlez	%i1,	%f18,	%f20
	fmovdgu	%xcc,	%f29,	%f11
	orncc	%i5,	0x142F,	%i2
	fble	%fcc1,	loop_434
	movcc	%icc,	%l6,	%g4
	swap	[%l7 + 0x08],	%g5
	fcmps	%fcc0,	%f20,	%f16
loop_434:
	fcmple16	%f20,	%f2,	%g2
	fmovdn	%xcc,	%f2,	%f19
	fbne,a	%fcc1,	loop_435
	subccc	%g6,	%g1,	%o3
	tvc	%icc,	0x0
	umulcc	%o0,	0x00C8,	%l2
loop_435:
	addc	%i4,	0x1D62,	%l5
	fbuge,a	%fcc3,	loop_436
	fxor	%f0,	%f6,	%f16
	fmovrdlz	%l0,	%f2,	%f28
	and	%l4,	0x1013,	%o6
loop_436:
	edge8	%i0,	%g7,	%i7
	brz,a	%o1,	loop_437
	fmovrdlez	%l1,	%f8,	%f24
	orn	%o4,	%o7,	%i3
	lduh	[%l7 + 0x0C],	%g3
loop_437:
	edge8l	%o5,	%o2,	%i6
	edge16l	%l3,	%i1,	%i2
	fmuld8sux16	%f23,	%f3,	%f4
	fmul8sux16	%f30,	%f14,	%f12
	edge16ln	%i5,	%g4,	%l6
	fcmpeq16	%f16,	%f0,	%g2
	movn	%xcc,	%g5,	%g6
	fmovdvs	%xcc,	%f23,	%f9
	ld	[%l7 + 0x5C],	%f24
	alignaddr	%o3,	%o0,	%g1
	edge8l	%i4,	%l2,	%l5
	fxors	%f6,	%f19,	%f26
	bgu,a	loop_438
	fmovrsgez	%l0,	%f26,	%f19
	tle	%icc,	0x6
	andcc	%l4,	0x133D,	%i0
loop_438:
	ldd	[%l7 + 0x10],	%f26
	set	0x70, %g6
	stxa	%g7,	[%l7 + %g6] 0x88
	fand	%f30,	%f4,	%f28
	movre	%o6,	%o1,	%l1
	ldub	[%l7 + 0x31],	%i7
	movrlez	%o7,	0x3AE,	%i3
	fpadd16	%f6,	%f28,	%f6
	edge16n	%g3,	%o5,	%o4
	bleu,pn	%icc,	loop_439
	umulcc	%o2,	%i6,	%l3
	nop
	set	0x1E, %g2
	sth	%i2,	[%l7 + %g2]
	alignaddrl	%i1,	%g4,	%l6
loop_439:
	movg	%icc,	%g2,	%i5
	edge16n	%g5,	%o3,	%o0
	ba,a,pt	%xcc,	loop_440
	array8	%g6,	%i4,	%g1
	sethi	0x0434,	%l5
	bpos,pn	%icc,	loop_441
loop_440:
	fbn,a	%fcc2,	loop_442
	array16	%l0,	%l2,	%i0
	fcmps	%fcc0,	%f8,	%f1
loop_441:
	tvs	%xcc,	0x0
loop_442:
	tne	%xcc,	0x4
	edge32	%l4,	%g7,	%o6
	fmovscc	%xcc,	%f7,	%f24
	sub	%l1,	0x0B10,	%i7
	fands	%f25,	%f1,	%f15
	be,a,pn	%icc,	loop_443
	udivcc	%o1,	0x04C3,	%o7
	andncc	%i3,	%g3,	%o5
	andcc	%o2,	0x17EF,	%o4
loop_443:
	tsubcctv	%l3,	%i6,	%i2
	tne	%xcc,	0x0
	ldub	[%l7 + 0x56],	%i1
	fcmpeq16	%f24,	%f26,	%l6
	fmovsleu	%icc,	%f29,	%f26
	movcs	%xcc,	%g2,	%i5
	wr	%g0,	0x18,	%asi
	lduba	[%l7 + 0x7E] %asi,	%g5
	subccc	%g4,	%o0,	%g6
	set	0x40, %o3
	ldda	[%l7 + %o3] 0x10,	%f0
	edge8	%o3,	%g1,	%l5
	addcc	%i4,	%l2,	%i0
	bshuffle	%f10,	%f4,	%f12
	movgu	%icc,	%l0,	%l4
	fsrc2	%f14,	%f28
	wr	%g0,	0x81,	%asi
	ldsba	[%l7 + 0x6F] %asi,	%o6
	bge,a,pn	%xcc,	loop_444
	sdiv	%l1,	0x1867,	%g7
	set	0x28, %i0
	lda	[%l7 + %i0] 0x14,	%f3
loop_444:
	nop
	wr	%g0,	0x80,	%asi
	lduha	[%l7 + 0x08] %asi,	%i7
	srlx	%o7,	%i3,	%o1
	st	%f22,	[%l7 + 0x4C]
	fnot2	%f18,	%f22
	movrlz	%g3,	0x0B4,	%o5
	tsubcctv	%o4,	%l3,	%o2
	fmovdcc	%icc,	%f27,	%f29
	fmovs	%f20,	%f9
	tn	%icc,	0x1
	fbne	%fcc3,	loop_445
	tg	%xcc,	0x0
	stbar
	movvc	%icc,	%i2,	%i6
loop_445:
	movre	%i1,	%g2,	%l6
	nop
	setx	loop_446,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fnot1s	%f27,	%f26
	set	0x28, %l3
	ldxa	[%l7 + %l3] 0x04,	%g5
loop_446:
	nop
	set	0x40, %l1
	ldda	[%l7 + %l1] 0x19,	%g4
	ldd	[%l7 + 0x30],	%f14
	sub	%i5,	%g6,	%o3
	edge8n	%o0,	%g1,	%l5
	fbe	%fcc0,	loop_447
	tge	%icc,	0x4
	set	0x50, %o2
	ldda	[%l7 + %o2] 0x04,	%i4
loop_447:
	sdivcc	%l2,	0x0FE5,	%i0
	and	%l0,	%o6,	%l4
	edge8	%l1,	%g7,	%o7
	edge32	%i7,	%o1,	%i3
	fbne,a	%fcc1,	loop_448
	te	%xcc,	0x6
	fmovspos	%xcc,	%f20,	%f22
	fbug,a	%fcc0,	loop_449
loop_448:
	smul	%o5,	0x092B,	%o4
	bvc	%xcc,	loop_450
	edge16	%g3,	%o2,	%i2
loop_449:
	movcs	%xcc,	%l3,	%i1
	fcmpgt32	%f18,	%f2,	%g2
loop_450:
	and	%l6,	0x0439,	%g5
	set	0x66, %g4
	lduba	[%l7 + %g4] 0x89,	%g4
	sth	%i6,	[%l7 + 0x22]
	orn	%g6,	0x09E0,	%i5
	sllx	%o0,	%g1,	%l5
	sll	%o3,	%l2,	%i0
	subc	%i4,	%o6,	%l0
	fmovsvs	%xcc,	%f21,	%f7
	fpsub16	%f6,	%f18,	%f8
	fmul8sux16	%f2,	%f18,	%f2
	movre	%l1,	%l4,	%o7
	edge8ln	%g7,	%o1,	%i3
	ble,a,pn	%icc,	loop_451
	sdivx	%o5,	0x0435,	%i7
	alignaddrl	%o4,	%g3,	%i2
	movvs	%xcc,	%l3,	%o2
loop_451:
	ba,a,pn	%icc,	loop_452
	addccc	%g2,	%l6,	%g5
	wr	%g0,	0x10,	%asi
	lda	[%l7 + 0x4C] %asi,	%f31
loop_452:
	edge16n	%g4,	%i1,	%g6
	movrgez	%i5,	%i6,	%o0
	fbge	%fcc0,	loop_453
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbge,a	%fcc2,	loop_454
	movvs	%xcc,	%l5,	%g1
loop_453:
	te	%xcc,	0x0
	tgu	%icc,	0x3
loop_454:
	mulx	%o3,	%l2,	%i4
	xnor	%o6,	%l0,	%i0
	nop
	setx	loop_455,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	edge16ln	%l1,	%o7,	%l4
	set	0x46, %o1
	lduha	[%l7 + %o1] 0x0c,	%o1
loop_455:
	udiv	%g7,	0x1963,	%o5
	srlx	%i3,	0x15,	%i7
	fbe,a	%fcc2,	loop_456
	orncc	%g3,	%o4,	%i2
	fnot2s	%f13,	%f16
	bn,a	loop_457
loop_456:
	srlx	%l3,	%g2,	%l6
	stbar
	fbne	%fcc0,	loop_458
loop_457:
	movne	%xcc,	%g5,	%o2
	addccc	%g4,	%i1,	%g6
	fcmpd	%fcc2,	%f6,	%f14
loop_458:
	nop
	add	%l7,	0x78,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%i6
	casxa	[%l6] %asi,	%i6,	%i5
	brlez	%l5,	loop_459
	movrlz	%o0,	%g1,	%l2
	stw	%i4,	[%l7 + 0x0C]
	tle	%xcc,	0x2
loop_459:
	edge8	%o3,	%l0,	%o6
	lduw	[%l7 + 0x34],	%i0
	srlx	%o7,	0x0F,	%l4
	fmovrslz	%o1,	%f28,	%f25
	pdist	%f6,	%f8,	%f14
	movrlz	%g7,	%o5,	%i3
	xnorcc	%i7,	0x1675,	%g3
	tsubcctv	%o4,	0x1E19,	%l1
	for	%f10,	%f6,	%f2
	fpack32	%f10,	%f20,	%f4
	fpack16	%f8,	%f30
	fmovdle	%xcc,	%f14,	%f4
	tsubcctv	%l3,	%i2,	%l6
	stbar
	ta	%xcc,	0x6
	xnorcc	%g2,	0x0A66,	%o2
	fpadd32	%f14,	%f12,	%f22
	fmovrslz	%g4,	%f29,	%f20
	add	%l7,	0x08,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%i1
	casxa	[%l6] 0x81,	%i1,	%g6
	sra	%i6,	0x16,	%i5
	stbar
	smul	%l5,	0x04EF,	%g5
	edge8n	%o0,	%l2,	%g1
	srl	%o3,	0x1D,	%i4
	set	0x44, %o6
	ldsha	[%l7 + %o6] 0x80,	%o6
	st	%f5,	[%l7 + 0x64]
	wr	%g0,	0x81,	%asi
	stda	%i0,	[%l7 + 0x30] %asi
	add	%l7,	0x68,	%l6
	wr	%g0,	0x10,	%asi
	lda	[%l6] %asi,	%l0
	casa	[%l6] %asi,	%l0,	%l4
	mova	%icc,	%o7,	%g7
	movne	%icc,	%o5,	%o1
	call	loop_460
	smul	%i7,	0x069D,	%g3
	edge8ln	%o4,	%l1,	%l3
	fbuge,a	%fcc3,	loop_461
loop_460:
	smul	%i3,	%l6,	%i2
	movg	%xcc,	%g2,	%g4
	xnor	%o2,	%g6,	%i6
loop_461:
	tn	%icc,	0x4
	subccc	%i5,	%l5,	%g5
	fblg	%fcc3,	loop_462
	move	%xcc,	%o0,	%l2
	fpsub16s	%f12,	%f12,	%f21
	fmovsleu	%icc,	%f22,	%f4
loop_462:
	fbl,a	%fcc2,	loop_463
	fexpand	%f27,	%f12
	nop
	setx	loop_464,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fmovrse	%i1,	%f11,	%f19
loop_463:
	andncc	%g1,	%i4,	%o6
	tcs	%icc,	0x6
loop_464:
	tleu	%icc,	0x5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andcc	%i0,	%l0,	%o3
	fmovdge	%xcc,	%f5,	%f16
	wr	%g0,	0x88,	%asi
	stha	%l4,	[%l7 + 0x2A] %asi
	or	%o7,	%o5,	%g7
	array16	%o1,	%i7,	%g3
	for	%f24,	%f24,	%f30
	fnot2s	%f22,	%f26
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x14] %asi,	%o4
	fbug	%fcc3,	loop_465
	add	%l3,	0x04FC,	%i3
	udivcc	%l1,	0x0D05,	%i2
	bge,a	%xcc,	loop_466
loop_465:
	ldstub	[%l7 + 0x55],	%l6
	edge16	%g4,	%g2,	%o2
	fmovd	%f24,	%f30
loop_466:
	ble	loop_467
	fmovsleu	%xcc,	%f31,	%f13
	edge32	%g6,	%i6,	%l5
	orncc	%g5,	%o0,	%i5
loop_467:
	tgu	%icc,	0x4
	subc	%i1,	0x0C00,	%g1
	bcs,a	%icc,	loop_468
	membar	0x3F
	fcmps	%fcc3,	%f22,	%f18
	alignaddrl	%l2,	%i4,	%o6
loop_468:
	te	%icc,	0x0
	bgu,a,pn	%xcc,	loop_469
	edge32l	%i0,	%o3,	%l0
	set	0x70, %g3
	ldda	[%l7 + %g3] 0x80,	%o6
loop_469:
	nop
	wr	%g0,	0x11,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	edge32l	%o5,	%g7,	%l4
	edge8	%i7,	%o1,	%o4
	orncc	%g3,	0x0E3D,	%l3
	fmovsle	%xcc,	%f12,	%f30
	alignaddr	%i3,	%l1,	%i2
	movvs	%icc,	%g4,	%l6
	srlx	%o2,	%g2,	%i6
	movrgez	%l5,	0x1E4,	%g6
	ble	loop_470
	array32	%o0,	%i5,	%i1
	move	%xcc,	%g1,	%g5
	movcc	%xcc,	%i4,	%o6
loop_470:
	mulx	%l2,	0x14C0,	%i0
	ldsh	[%l7 + 0x66],	%o3
	sllx	%l0,	0x19,	%o7
	swap	[%l7 + 0x24],	%o5
	edge8ln	%g7,	%l4,	%o1
	movne	%xcc,	%i7,	%o4
	fnegs	%f2,	%f21
	fmovrsgz	%l3,	%f19,	%f7
	movrgez	%g3,	%l1,	%i2
	and	%g4,	0x09EC,	%l6
	fmovsge	%icc,	%f21,	%f15
	fmovsge	%xcc,	%f7,	%f18
	fbo,a	%fcc0,	loop_471
	ldsh	[%l7 + 0x54],	%o2
	nop
	setx loop_472, %l0, %l1
	jmpl %l1, %i3
	nop
	setx	loop_473,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_471:
	andcc	%g2,	%i6,	%l5
	stbar
loop_472:
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
loop_473:
	edge8ln	%o0,	%g6,	%i5
	fmuld8ulx16	%f23,	%f10,	%f20
	andncc	%i1,	%g5,	%g1
loop_474:
	edge32l	%i4,	%o6,	%i0
	movrlz	%l2,	%o3,	%l0
	fmovda	%xcc,	%f20,	%f4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddr	%o5,	%o7,	%g7
	srax	%l4,	%i7,	%o1
	fands	%f15,	%f9,	%f0
	edge32n	%o4,	%l3,	%g3
	fpsub16s	%f3,	%f9,	%f7
	fsrc1s	%f17,	%f6
	bpos,a,pn	%xcc,	loop_475
	orn	%l1,	%i2,	%l6
	edge8l	%o2,	%i3,	%g4
	fmovdle	%xcc,	%f3,	%f17
loop_475:
	st	%f23,	[%l7 + 0x58]
	edge32l	%g2,	%l5,	%i6
	set	0x60, %g1
	lduwa	[%l7 + %g1] 0x19,	%o0
	tcs	%xcc,	0x1
	movne	%icc,	%g6,	%i1
	bcs,pt	%icc,	loop_476
	xorcc	%i5,	%g5,	%i4
	set	0x48, %o7
	ldsha	[%l7 + %o7] 0x80,	%o6
loop_476:
	edge16n	%i0,	%l2,	%g1
	sdiv	%o3,	0x13E3,	%o5
	fbo	%fcc3,	loop_477
	udivcc	%l0,	0x0BB6,	%o7
	movvc	%xcc,	%l4,	%g7
	array32	%o1,	%o4,	%i7
loop_477:
	membar	0x42
	brlz	%l3,	loop_478
	fnot2s	%f27,	%f6
	udivx	%l1,	0x0A89,	%i2
	fcmpgt16	%f12,	%f26,	%l6
loop_478:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbe	%fcc2,	loop_479
	brlz,a	%o2,	loop_480
	lduh	[%l7 + 0x66],	%i3
	set	0x29, %l4
	stba	%g4,	[%l7 + %l4] 0x04
loop_479:
	movneg	%xcc,	%g3,	%g2
loop_480:
	andn	%i6,	%o0,	%l5
	membar	#Sync
	wr	%g0,	0xf0,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	smul	%g6,	%i1,	%g5
	swap	[%l7 + 0x40],	%i4
	mova	%xcc,	%o6,	%i0
	edge8l	%i5,	%l2,	%o3
	fmovsne	%xcc,	%f5,	%f15
	fnot1	%f8,	%f6
	fmovdg	%icc,	%f15,	%f18
	edge8n	%g1,	%o5,	%l0
	te	%icc,	0x0
	brgz,a	%o7,	loop_481
	fmul8sux16	%f10,	%f18,	%f8
	tsubcctv	%g7,	0x1430,	%l4
	fcmpne32	%f0,	%f16,	%o1
loop_481:
	sdivcc	%i7,	0x047D,	%o4
	movl	%xcc,	%l3,	%i2
	fpsub16s	%f31,	%f16,	%f22
	fabss	%f20,	%f17
	alignaddrl	%l6,	%l1,	%o2
	srax	%g4,	0x1E,	%g3
	andn	%i3,	0x1557,	%i6
	ta	%icc,	0x6
	and	%g2,	0x11F8,	%o0
	edge32n	%g6,	%i1,	%g5
	popc	%l5,	%i4
	movvc	%icc,	%i0,	%i5
	orncc	%l2,	0x104B,	%o6
	taddcctv	%g1,	0x1A96,	%o3
	tcs	%xcc,	0x1
	orncc	%o5,	%o7,	%l0
	movre	%l4,	%g7,	%i7
	nop
	setx	loop_482,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	popc	%o1,	%l3
	movcs	%icc,	%i2,	%o4
	movre	%l1,	0x341,	%l6
loop_482:
	mova	%xcc,	%g4,	%g3
	fsrc2s	%f9,	%f15
	ldd	[%l7 + 0x60],	%f16
	wr	%g0,	0x88,	%asi
	ldswa	[%l7 + 0x14] %asi,	%o2
	set	0x78, %o0
	stda	%i2,	[%l7 + %o0] 0x15
	bgu,a,pt	%icc,	loop_483
	tpos	%icc,	0x3
	tneg	%icc,	0x5
	movrlz	%g2,	0x046,	%o0
loop_483:
	xor	%i6,	0x0535,	%i1
	movrgez	%g6,	%l5,	%i4
	edge32l	%i0,	%i5,	%g5
	movg	%xcc,	%o6,	%g1
	movrlez	%o3,	%o5,	%l2
	tg	%icc,	0x4
	sdivx	%l0,	0x09FD,	%l4
	nop
	setx loop_484, %l0, %l1
	jmpl %l1, %g7
	bne,a,pn	%xcc,	loop_485
	mulscc	%i7,	%o1,	%l3
	brgz,a	%o7,	loop_486
loop_484:
	movcs	%xcc,	%i2,	%o4
loop_485:
	fbue	%fcc2,	loop_487
	fcmple16	%f20,	%f14,	%l6
loop_486:
	andncc	%l1,	%g3,	%o2
	fcmple32	%f24,	%f30,	%g4
loop_487:
	movrgez	%i3,	%g2,	%o0
	tsubcctv	%i6,	0x0C13,	%g6
	alignaddr	%l5,	%i1,	%i0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	faligndata	%f26,	%f6,	%f30
	tn	%icc,	0x5
	srax	%i4,	%i5,	%g5
	fand	%f22,	%f8,	%f18
	edge8l	%o6,	%g1,	%o3
	tneg	%xcc,	0x7
	bcs,a	loop_488
	udivcc	%o5,	0x1EA1,	%l0
	fcmple32	%f8,	%f16,	%l2
	movn	%icc,	%l4,	%g7
loop_488:
	subcc	%o1,	0x10DC,	%l3
	set	0x6D, %l0
	ldstuba	[%l7 + %l0] 0x19,	%i7
	fxnors	%f0,	%f27,	%f3
	movg	%xcc,	%i2,	%o7
	edge8n	%o4,	%l1,	%l6
	xorcc	%g3,	0x0495,	%g4
	fmovsn	%icc,	%f22,	%f27
	subccc	%i3,	0x08F2,	%o2
	wr	%g0,	0x1e,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
	smulcc	%o0,	0x1236,	%g2
	fcmpne32	%f22,	%f14,	%i6
	movneg	%xcc,	%g6,	%l5
	flush	%l7 + 0x54
	udiv	%i0,	0x05D9,	%i1
	sethi	0x1BDB,	%i5
	orn	%i4,	0x1CBD,	%g5
	mova	%xcc,	%o6,	%g1
	sllx	%o3,	0x1E,	%l0
	fmovdneg	%icc,	%f9,	%f30
	wr	%g0,	0x80,	%asi
	stba	%l2,	[%l7 + 0x61] %asi
	tvc	%xcc,	0x5
	edge8n	%l4,	%g7,	%o1
	tgu	%xcc,	0x2
	move	%xcc,	%l3,	%o5
	faligndata	%f4,	%f0,	%f6
	st	%f14,	[%l7 + 0x44]
	wr	%g0,	0xea,	%asi
	stba	%i7,	[%l7 + 0x73] %asi
	membar	#Sync
	tge	%icc,	0x7
	addc	%i2,	0x0EAB,	%o4
	movl	%xcc,	%o7,	%l6
	movcc	%xcc,	%g3,	%g4
	xnorcc	%i3,	0x1CFA,	%l1
	fmovsvs	%xcc,	%f11,	%f16
	ldd	[%l7 + 0x50],	%f26
	fcmpne32	%f24,	%f2,	%o2
	membar	0x3F
	bcs,a	%icc,	loop_489
	brgz	%g2,	loop_490
	xor	%i6,	%o0,	%l5
	fmovsg	%icc,	%f13,	%f12
loop_489:
	movpos	%icc,	%g6,	%i0
loop_490:
	xor	%i1,	%i5,	%i4
	tleu	%icc,	0x7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdivcc	%o6,	0x0A33,	%g1
	movgu	%icc,	%o3,	%l0
	edge16n	%l2,	%g5,	%g7
	movcc	%xcc,	%o1,	%l4
	ble,pn	%xcc,	loop_491
	move	%icc,	%o5,	%i7
	edge16	%l3,	%o4,	%i2
	ldd	[%l7 + 0x68],	%i6
loop_491:
	bvs,pn	%xcc,	loop_492
	fnot2s	%f13,	%f23
	wr	%g0,	0x19,	%asi
	ldsba	[%l7 + 0x61] %asi,	%o7
loop_492:
	sll	%g4,	%g3,	%l1
	movne	%xcc,	%i3,	%o2
	movrgz	%g2,	%o0,	%l5
	ble,a,pt	%xcc,	loop_493
	movn	%xcc,	%i6,	%i0
	alignaddr	%g6,	%i1,	%i5
	ldsh	[%l7 + 0x50],	%i4
loop_493:
	tvs	%xcc,	0x6
	fmovdle	%xcc,	%f10,	%f23
	movcs	%xcc,	%o6,	%g1
	fzero	%f16
	tn	%xcc,	0x2
	set	0x24, %i7
	swapa	[%l7 + %i7] 0x89,	%l0
	mulx	%l2,	%o3,	%g5
	smul	%o1,	%l4,	%g7
	umulcc	%i7,	%o5,	%l3
	fabss	%f2,	%f30
	fpsub32	%f16,	%f12,	%f8
	fxor	%f20,	%f16,	%f14
	brgez,a	%o4,	loop_494
	movneg	%icc,	%i2,	%l6
	fmovdl	%xcc,	%f17,	%f21
	subcc	%g4,	%g3,	%o7
loop_494:
	sir	0x0F09
	tg	%xcc,	0x5
	fmovsle	%xcc,	%f15,	%f10
	umulcc	%i3,	%l1,	%g2
	array8	%o2,	%l5,	%i6
	edge16	%i0,	%o0,	%g6
	edge16ln	%i5,	%i4,	%i1
	movrgez	%o6,	%l0,	%l2
	siam	0x6
	set	0x40, %i6
	stda	%f16,	[%l7 + %i6] 0x89
	fnands	%f28,	%f8,	%f30
	membar	#Sync
	wr	%g0,	0xf0,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	fmovdg	%xcc,	%f18,	%f3
	fpsub16	%f26,	%f28,	%f20
	fands	%f8,	%f27,	%f16
	stbar
	sra	%g1,	%o3,	%g5
	sdivcc	%l4,	0x12A6,	%o1
	wr	%g0,	0x89,	%asi
	stda	%i6,	[%l7 + 0x40] %asi
	edge8ln	%o5,	%l3,	%g7
	tleu	%icc,	0x2
	movgu	%xcc,	%o4,	%i2
	fors	%f4,	%f11,	%f10
	udivx	%l6,	0x1719,	%g4
	edge16l	%o7,	%i3,	%l1
	bne,pn	%icc,	loop_495
	tcc	%xcc,	0x2
	udiv	%g3,	0x05E0,	%g2
	umul	%l5,	%o2,	%i0
loop_495:
	tn	%xcc,	0x3
	subccc	%i6,	0x14E2,	%g6
	fands	%f13,	%f21,	%f5
	set	0x50, %i2
	ldda	[%l7 + %i2] 0x88,	%i4
	edge32n	%i4,	%i1,	%o0
	edge8	%l0,	%o6,	%g1
	movl	%xcc,	%l2,	%g5
	andcc	%o3,	%l4,	%i7
	brlez	%o1,	loop_496
	addc	%l3,	%o5,	%g7
	sll	%o4,	0x05,	%i2
	and	%l6,	%o7,	%i3
loop_496:
	brnz	%g4,	loop_497
	mulscc	%l1,	%g2,	%l5
	set	0x44, %l6
	swapa	[%l7 + %l6] 0x11,	%g3
loop_497:
	xnorcc	%o2,	0x0E13,	%i6
	ldsb	[%l7 + 0x78],	%i0
	tgu	%xcc,	0x2
	edge16ln	%i5,	%g6,	%i1
	fbuge	%fcc3,	loop_498
	movrlez	%o0,	%i4,	%l0
	brgez,a	%g1,	loop_499
	fmovdvc	%xcc,	%f8,	%f24
loop_498:
	movvs	%xcc,	%o6,	%g5
	sllx	%l2,	%o3,	%i7
loop_499:
	array8	%o1,	%l3,	%l4
	fcmpgt16	%f0,	%f16,	%o5
	nop
	set	0x2C, %i3
	prefetch	[%l7 + %i3],	 0x2
	edge8l	%o4,	%g7,	%l6
	fands	%f5,	%f29,	%f5
	fmovdgu	%icc,	%f13,	%f6
	movg	%icc,	%o7,	%i2
	array16	%g4,	%l1,	%i3
	tgu	%icc,	0x4
	subc	%g2,	0x1E4D,	%g3
	sdivx	%l5,	0x1329,	%o2
	tle	%icc,	0x5
	fsrc2s	%f28,	%f18
	swap	[%l7 + 0x0C],	%i0
	fnands	%f12,	%f17,	%f2
	fbul	%fcc1,	loop_500
	array32	%i6,	%i5,	%i1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrlz	%g6,	0x1D9,	%o0
loop_500:
	bgu,a	%icc,	loop_501
	tcs	%icc,	0x7
	fbge,a	%fcc0,	loop_502
	lduh	[%l7 + 0x12],	%l0
loop_501:
	movl	%icc,	%g1,	%i4
	tne	%icc,	0x5
loop_502:
	andn	%g5,	%l2,	%o3
	bshuffle	%f18,	%f28,	%f14
	movre	%i7,	0x307,	%o6
	edge8ln	%l3,	%l4,	%o1
	set	0x50, %o4
	swapa	[%l7 + %o4] 0x19,	%o4
	fnot1s	%f3,	%f26
	set	0x10, %i5
	sta	%f21,	[%l7 + %i5] 0x0c
	brlz,a	%g7,	loop_503
	sra	%o5,	%l6,	%o7
	bg,a,pt	%icc,	loop_504
	fmovdgu	%icc,	%f1,	%f28
loop_503:
	be	loop_505
	movpos	%xcc,	%i2,	%g4
loop_504:
	fcmpes	%fcc2,	%f21,	%f23
	fnand	%f22,	%f0,	%f30
loop_505:
	nop
	set	0x2C, %i4
	ldsha	[%l7 + %i4] 0x18,	%i3
	ldsw	[%l7 + 0x10],	%l1
	movre	%g3,	%l5,	%o2
	popc	%i0,	%i6
	tle	%xcc,	0x0
	wr	%g0,	0x11,	%asi
	ldsha	[%l7 + 0x6A] %asi,	%i5
	sra	%g2,	%i1,	%g6
	fpadd32s	%f20,	%f1,	%f12
	fxors	%f23,	%f12,	%f28
	bcs,a,pt	%xcc,	loop_506
	edge32n	%l0,	%o0,	%i4
	sdivx	%g5,	0x1E4E,	%g1
	movn	%icc,	%l2,	%i7
loop_506:
	movneg	%xcc,	%o6,	%l3
	fsrc1	%f28,	%f16
	orcc	%o3,	0x045A,	%o1
	umulcc	%l4,	0x1FF5,	%o4
	fbn	%fcc1,	loop_507
	ldsh	[%l7 + 0x50],	%g7
	xor	%o5,	0x1BED,	%o7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_507:
	movgu	%xcc,	%l6,	%g4
	orncc	%i3,	0x0DA5,	%i2
	ldd	[%l7 + 0x50],	%l0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdneg	%icc,	%f27,	%f10
	sethi	0x0F08,	%g3
	tle	%xcc,	0x6
	fmovrdne	%o2,	%f2,	%f4
	movg	%icc,	%i0,	%l5
	edge32	%i6,	%g2,	%i5
	set	0x42, %l5
	ldsba	[%l7 + %l5] 0x81,	%g6
	movgu	%xcc,	%l0,	%o0
	alignaddr	%i1,	%i4,	%g5
	set	0x50, %o5
	ldda	[%l7 + %o5] 0x2c,	%l2
	wr	%g0,	0xea,	%asi
	stha	%g1,	[%l7 + 0x5C] %asi
	membar	#Sync
	fmovdl	%xcc,	%f21,	%f20
	ld	[%l7 + 0x14],	%f23
	sra	%i7,	%l3,	%o3
	fandnot1s	%f8,	%f21,	%f12
	ldsb	[%l7 + 0x7F],	%o1
	bvs,a	loop_508
	sra	%l4,	0x08,	%o6
	sllx	%g7,	%o4,	%o5
	set	0x0E, %i1
	lduha	[%l7 + %i1] 0x14,	%l6
loop_508:
	addccc	%o7,	%g4,	%i3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mova	%icc,	%i2,	%l1
	fmovsne	%icc,	%f27,	%f23
	bleu	loop_509
	fsrc1s	%f22,	%f13
	brlez	%o2,	loop_510
	sra	%i0,	0x0B,	%g3
loop_509:
	fmovdl	%xcc,	%f22,	%f7
	subc	%l5,	0x0F2C,	%i6
loop_510:
	fmovsgu	%icc,	%f8,	%f11
	edge8l	%i5,	%g6,	%g2
	sethi	0x022A,	%o0
	movle	%xcc,	%l0,	%i1
	tgu	%icc,	0x0
	fmovsa	%xcc,	%f2,	%f22
	movrlz	%i4,	%l2,	%g1
	sdivcc	%g5,	0x0497,	%i7
	fble,a	%fcc0,	loop_511
	ldd	[%l7 + 0x30],	%o2
	srl	%l3,	0x05,	%l4
	fblg,a	%fcc0,	loop_512
loop_511:
	fandnot1	%f8,	%f12,	%f30
	movneg	%xcc,	%o1,	%g7
	tge	%icc,	0x1
loop_512:
	nop
	set	0x78, %l2
	std	%o4,	[%l7 + %l2]
	udivcc	%o6,	0x03D4,	%l6
	movleu	%xcc,	%o5,	%g4
	sll	%o7,	%i2,	%i3
	subcc	%l1,	0x0F05,	%o2
	edge8ln	%i0,	%g3,	%l5
	movvc	%xcc,	%i5,	%i6
	movn	%xcc,	%g6,	%g2
	fmul8x16	%f25,	%f12,	%f30
	membar	#Sync
	wr	%g0,	0xf0,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	brgz	%o0,	loop_513
	fbug	%fcc0,	loop_514
	sub	%i1,	0x01A6,	%i4
	fcmped	%fcc3,	%f6,	%f16
loop_513:
	prefetch	[%l7 + 0x6C],	 0x2
loop_514:
	edge8ln	%l0,	%g1,	%g5
	addcc	%l2,	0x0E8A,	%o3
	ldstub	[%l7 + 0x27],	%i7
	mulx	%l4,	%o1,	%l3
	fandnot2s	%f6,	%f8,	%f0
	fpadd16	%f26,	%f28,	%f20
	taddcc	%g7,	0x0092,	%o4
	edge16n	%o6,	%l6,	%g4
	fmovrdgez	%o7,	%f30,	%f6
	ldub	[%l7 + 0x4A],	%i2
	tl	%xcc,	0x2
	tvc	%xcc,	0x3
	movne	%icc,	%o5,	%l1
	fbn,a	%fcc3,	loop_515
	fmuld8ulx16	%f23,	%f9,	%f16
	taddcctv	%i3,	%i0,	%o2
	tle	%xcc,	0x3
loop_515:
	udivx	%g3,	0x05A7,	%l5
	tpos	%xcc,	0x5
	tgu	%icc,	0x7
	fmovsn	%xcc,	%f0,	%f30
	andn	%i6,	0x07B7,	%i5
	ldsb	[%l7 + 0x09],	%g2
	edge8n	%o0,	%i1,	%i4
	edge32n	%l0,	%g6,	%g5
	addcc	%l2,	%g1,	%o3
	andcc	%i7,	%o1,	%l3
	tneg	%icc,	0x0
	brgez,a	%l4,	loop_516
	sdiv	%g7,	0x1FD7,	%o6
	nop
	setx	loop_517,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movcs	%xcc,	%o4,	%g4
loop_516:
	sdivcc	%o7,	0x0A7C,	%i2
	ba,pt	%xcc,	loop_518
loop_517:
	bpos,a,pn	%icc,	loop_519
	xnor	%l6,	0x0162,	%l1
	srl	%o5,	%i0,	%i3
loop_518:
	movcc	%icc,	%o2,	%l5
loop_519:
	fsrc1s	%f21,	%f21
	ldsh	[%l7 + 0x46],	%i6
	fcmpeq16	%f4,	%f12,	%i5
	mova	%icc,	%g2,	%g3
	fnot1	%f30,	%f20
	fmovsne	%xcc,	%f31,	%f31
	fmovspos	%icc,	%f17,	%f20
	srl	%o0,	0x1D,	%i4
	bpos,pt	%icc,	loop_520
	xor	%i1,	0x1E48,	%g6
	alignaddrl	%l0,	%g5,	%l2
	edge8l	%o3,	%g1,	%i7
loop_520:
	andcc	%l3,	0x170B,	%o1
	or	%g7,	0x0D03,	%l4
	for	%f2,	%f8,	%f26
	tgu	%icc,	0x5
	orncc	%o6,	0x00A4,	%o4
	fbg	%fcc3,	loop_521
	sll	%g4,	0x1C,	%i2
	set	0x4C, %g5
	ldsha	[%l7 + %g5] 0x89,	%o7
loop_521:
	ldstub	[%l7 + 0x08],	%l6
	tsubcc	%o5,	0x02B7,	%i0
	orncc	%i3,	0x1694,	%l1
	ldsw	[%l7 + 0x68],	%l5
	xorcc	%o2,	0x1A5D,	%i6
	srax	%i5,	0x01,	%g2
	tle	%xcc,	0x1
	wr	%g0,	0x81,	%asi
	ldswa	[%l7 + 0x68] %asi,	%g3
	fpadd32	%f8,	%f24,	%f12
	xnorcc	%o0,	0x0751,	%i4
	tne	%xcc,	0x2
	fones	%f26
	movrne	%i1,	%g6,	%l0
	sllx	%g5,	0x15,	%l2
	fmovsle	%xcc,	%f13,	%f16
	addc	%o3,	%g1,	%i7
	tg	%xcc,	0x2
	fmovscs	%icc,	%f11,	%f12
	tl	%xcc,	0x2
	edge8n	%l3,	%o1,	%l4
	subcc	%g7,	%o6,	%o4
	movre	%i2,	%o7,	%g4
	wr	%g0,	0x10,	%asi
	swapa	[%l7 + 0x78] %asi,	%o5
	fcmpgt32	%f4,	%f26,	%l6
	movrlz	%i0,	0x36A,	%i3
	bgu,a	loop_522
	fandnot2	%f18,	%f20,	%f8
	sir	0x1FCE
	movneg	%icc,	%l5,	%o2
loop_522:
	fpadd32s	%f2,	%f31,	%f9
	fzeros	%f7
	edge8n	%l1,	%i5,	%i6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	brlz,a	%g3,	loop_523
	sra	%o0,	%g2,	%i1
	udivcc	%i4,	0x1558,	%l0
	sllx	%g6,	0x09,	%g5
loop_523:
	orncc	%o3,	0x03E1,	%l2
	move	%icc,	%g1,	%i7
	srlx	%o1,	%l3,	%g7
	fcmpes	%fcc0,	%f16,	%f11
	sra	%o6,	%l4,	%o4
	tle	%icc,	0x1
	sdivx	%i2,	0x050F,	%g4
	fmovspos	%icc,	%f11,	%f31
	alignaddr	%o5,	%l6,	%o7
	fnor	%f30,	%f8,	%f22
	fnegd	%f6,	%f16
	fnor	%f30,	%f8,	%f4
	tsubcctv	%i0,	0x1901,	%l5
	fmovdle	%xcc,	%f2,	%f21
	movl	%icc,	%i3,	%l1
	edge16	%i5,	%i6,	%g3
	move	%xcc,	%o2,	%g2
	edge32n	%i1,	%o0,	%i4
	fbo	%fcc2,	loop_524
	edge16l	%g6,	%g5,	%o3
	bvc,a	%xcc,	loop_525
	edge32ln	%l2,	%g1,	%i7
loop_524:
	nop
	set	0x08, %g7
	lduha	[%l7 + %g7] 0x0c,	%o1
loop_525:
	movvc	%icc,	%l0,	%g7
	movrgz	%o6,	%l4,	%l3
	stbar
	bne	loop_526
	fands	%f27,	%f17,	%f31
	fsrc1s	%f28,	%f9
	fmovrsne	%o4,	%f9,	%f31
loop_526:
	bne	loop_527
	edge8	%g4,	%o5,	%l6
	bg,a,pn	%icc,	loop_528
	fsrc1s	%f24,	%f26
loop_527:
	edge16n	%i2,	%o7,	%i0
	movrlez	%l5,	%i3,	%l1
loop_528:
	nop
	wr	%g0,	0x04,	%asi
	lduwa	[%l7 + 0x18] %asi,	%i6
	xnorcc	%g3,	%i5,	%g2
	ld	[%l7 + 0x3C],	%f10
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovda	%icc,	%f16,	%f9
	subc	%i1,	0x1071,	%o2
	set	0x48, %g6
	swapa	[%l7 + %g6] 0x80,	%i4
	umul	%g6,	0x07F4,	%o0
	mulx	%o3,	0x1A9C,	%l2
	add	%g5,	%i7,	%g1
	brnz,a	%o1,	loop_529
	sdivx	%l0,	0x0C57,	%o6
	edge16	%l4,	%g7,	%l3
	st	%f19,	[%l7 + 0x70]
loop_529:
	alignaddr	%o4,	%o5,	%g4
	orncc	%i2,	%o7,	%l6
	bne	%xcc,	loop_530
	bne	%icc,	loop_531
	tneg	%xcc,	0x5
	movrlz	%l5,	0x107,	%i0
loop_530:
	nop
	set	0x1E, %g2
	lduha	[%l7 + %g2] 0x18,	%i3
loop_531:
	sdivx	%l1,	0x1CD6,	%g3
	fxnors	%f7,	%f2,	%f27
	fbug	%fcc0,	loop_532
	andncc	%i6,	%i5,	%i1
	movrlez	%g2,	0x1A3,	%o2
	sll	%i4,	0x0E,	%o0
loop_532:
	movrlz	%o3,	0x336,	%l2
	array8	%g6,	%i7,	%g1
	tsubcctv	%o1,	%g5,	%o6
	xnor	%l0,	0x0518,	%l4
	sll	%l3,	%g7,	%o4
	te	%xcc,	0x2
	movvc	%icc,	%g4,	%i2
	srlx	%o5,	0x09,	%o7
	fornot2s	%f20,	%f7,	%f20
	fpack32	%f8,	%f20,	%f16
	edge32l	%l6,	%i0,	%l5
	nop
	setx loop_533, %l0, %l1
	jmpl %l1, %i3
	nop
	setx	loop_534,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movre	%l1,	0x124,	%i6
	set	0x78, %o3
	stda	%g2,	[%l7 + %o3] 0x14
loop_533:
	nop
	wr	%g0,	0x89,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
loop_534:
	nop
	wr	%g0,	0x18,	%asi
	stha	%i1,	[%l7 + 0x30] %asi
	fmovdvs	%xcc,	%f10,	%f24
	udivcc	%g2,	0x003B,	%o2
	fmovdcs	%icc,	%f12,	%f10
	bne,pn	%xcc,	loop_535
	mulscc	%i5,	0x0448,	%i4
	lduw	[%l7 + 0x3C],	%o0
	fbuge	%fcc0,	loop_536
loop_535:
	stbar
	movgu	%icc,	%l2,	%g6
	wr	%g0,	0x19,	%asi
	sta	%f4,	[%l7 + 0x24] %asi
loop_536:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srl	%o3,	%g1,	%o1
	set	0x28, %i0
	prefetcha	[%l7 + %i0] 0x0c,	 0x2
	wr	%g0,	0xe2,	%asi
	stda	%o6,	[%l7 + 0x50] %asi
	membar	#Sync
	popc	0x1910,	%l0
	taddcctv	%i7,	%l3,	%l4
	sll	%o4,	%g7,	%g4
	movvc	%icc,	%i2,	%o5
	bg,a	loop_537
	fxnors	%f7,	%f12,	%f6
	edge8n	%l6,	%o7,	%i0
	set	0x13, %l1
	lduba	[%l7 + %l1] 0x11,	%l5
loop_537:
	movcs	%icc,	%i3,	%l1
	nop
	setx	loop_538,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fornot2	%f26,	%f12,	%f16
	fmovdneg	%xcc,	%f9,	%f28
	movgu	%icc,	%g3,	%i6
loop_538:
	bneg,pn	%xcc,	loop_539
	fcmpes	%fcc1,	%f31,	%f16
	fmovsg	%xcc,	%f21,	%f3
	brgz,a	%i1,	loop_540
loop_539:
	sdiv	%o2,	0x0212,	%g2
	ble,a,pn	%icc,	loop_541
	fbue	%fcc2,	loop_542
loop_540:
	tvc	%xcc,	0x7
	edge8ln	%i4,	%o0,	%l2
loop_541:
	nop
	wr	%g0,	0xe3,	%asi
	stda	%i4,	[%l7 + 0x38] %asi
	membar	#Sync
loop_542:
	fmovrsne	%o3,	%f6,	%f16
	sdivcc	%g1,	0x1028,	%g6
	add	%g5,	0x1B0F,	%o6
	stbar
	edge16	%o1,	%i7,	%l0
	smul	%l3,	%o4,	%g7
	tle	%xcc,	0x5
	alignaddr	%l4,	%g4,	%o5
	fmul8x16au	%f29,	%f15,	%f12
	bcc,a	%xcc,	loop_543
	movre	%i2,	0x288,	%l6
	wr	%g0,	0x10,	%asi
	stha	%i0,	[%l7 + 0x42] %asi
loop_543:
	fble	%fcc1,	loop_544
	fmovrslez	%o7,	%f23,	%f12
	smulcc	%l5,	%l1,	%i3
	tcc	%icc,	0x7
loop_544:
	movge	%icc,	%g3,	%i1
	srl	%o2,	%g2,	%i6
	movne	%icc,	%i4,	%o0
	wr	%g0,	0xf8,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
	edge16ln	%i5,	%l2,	%g1
	movle	%xcc,	%g6,	%g5
	ta	%icc,	0x7
	edge16ln	%o6,	%o1,	%o3
	udivx	%i7,	0x1B65,	%l0
	sethi	0x00C9,	%l3
	tn	%icc,	0x0
	fbu	%fcc1,	loop_545
	fmul8ulx16	%f16,	%f8,	%f4
	movge	%xcc,	%o4,	%g7
	movcc	%xcc,	%g4,	%l4
loop_545:
	movl	%xcc,	%i2,	%o5
	movl	%xcc,	%l6,	%o7
	prefetch	[%l7 + 0x48],	 0x3
	fmovdcc	%icc,	%f23,	%f10
	movneg	%xcc,	%i0,	%l5
	srlx	%i3,	0x14,	%l1
	brnz	%i1,	loop_546
	edge16	%o2,	%g2,	%g3
	taddcc	%i6,	%o0,	%i5
	and	%i4,	%l2,	%g1
loop_546:
	fpsub16s	%f6,	%f29,	%f0
	alignaddr	%g5,	%g6,	%o6
	movleu	%icc,	%o3,	%o1
	fbule	%fcc3,	loop_547
	tg	%icc,	0x2
	fnot1s	%f27,	%f12
	mulscc	%l0,	0x1EB8,	%i7
loop_547:
	nop
	set	0x12, %l3
	stba	%o4,	[%l7 + %l3] 0x0c
	fornot1s	%f25,	%f30,	%f5
	alignaddr	%l3,	%g7,	%l4
	popc	0x0F6F,	%i2
	be,a,pt	%icc,	loop_548
	edge16l	%o5,	%l6,	%g4
	array32	%o7,	%i0,	%i3
	fbuge	%fcc0,	loop_549
loop_548:
	sdivcc	%l5,	0x049B,	%l1
	alignaddr	%i1,	%o2,	%g3
	umulcc	%g2,	0x1D09,	%i6
loop_549:
	andncc	%i5,	%i4,	%o0
	fcmpes	%fcc0,	%f1,	%f12
	subccc	%g1,	%g5,	%l2
	sdivx	%g6,	0x1B5C,	%o3
	fmovrsgez	%o6,	%f2,	%f11
	tne	%icc,	0x5
	umulcc	%o1,	%i7,	%o4
	membar	0x7B
	tneg	%icc,	0x7
	umulcc	%l0,	0x18FC,	%l3
	fmovdvc	%icc,	%f18,	%f7
	call	loop_550
	ba,a,pt	%xcc,	loop_551
	edge32ln	%g7,	%i2,	%o5
	nop
	setx	loop_552,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_550:
	umul	%l6,	%l4,	%g4
loop_551:
	brgz,a	%o7,	loop_553
	addcc	%i3,	%i0,	%l5
loop_552:
	bpos	loop_554
	bvc,pt	%xcc,	loop_555
loop_553:
	orcc	%l1,	0x08D7,	%o2
	movvs	%xcc,	%g3,	%g2
loop_554:
	edge8ln	%i6,	%i1,	%i5
loop_555:
	movg	%xcc,	%o0,	%g1
	edge8ln	%g5,	%i4,	%g6
	tn	%icc,	0x2
	movvs	%icc,	%l2,	%o6
	movvs	%icc,	%o1,	%i7
	fpackfix	%f6,	%f30
	edge32ln	%o3,	%l0,	%l3
	udivcc	%g7,	0x1A4C,	%i2
	array16	%o5,	%l6,	%o4
	faligndata	%f18,	%f8,	%f6
	sdiv	%g4,	0x0CF6,	%o7
	flush	%l7 + 0x4C
	movvs	%xcc,	%l4,	%i0
	array16	%i3,	%l5,	%o2
	umulcc	%g3,	0x1099,	%l1
	fbne,a	%fcc2,	loop_556
	array8	%i6,	%i1,	%i5
	brlez	%g2,	loop_557
	srlx	%g1,	0x08,	%o0
loop_556:
	movge	%xcc,	%g5,	%i4
	fmovrse	%l2,	%f29,	%f22
loop_557:
	ldsw	[%l7 + 0x64],	%g6
	fmovdcc	%icc,	%f14,	%f23
	fbe	%fcc1,	loop_558
	ld	[%l7 + 0x68],	%f28
	fnors	%f31,	%f12,	%f19
	edge32	%o6,	%o1,	%o3
loop_558:
	tcs	%xcc,	0x2
	fbl,a	%fcc1,	loop_559
	fexpand	%f28,	%f8
	movre	%i7,	0x00F,	%l0
	movrgz	%l3,	%i2,	%g7
loop_559:
	popc	0x0534,	%o5
	fmuld8sux16	%f4,	%f11,	%f18
	alignaddr	%o4,	%g4,	%l6
	brnz	%o7,	loop_560
	edge8l	%i0,	%l4,	%i3
	umulcc	%l5,	%g3,	%o2
	movre	%i6,	0x2BD,	%l1
loop_560:
	edge32	%i1,	%i5,	%g1
	sub	%o0,	%g2,	%g5
	array8	%l2,	%i4,	%o6
	udiv	%g6,	0x1014,	%o3
	xnor	%i7,	0x16AE,	%o1
	movcc	%xcc,	%l0,	%l3
	tg	%icc,	0x0
	movle	%xcc,	%g7,	%o5
	mulx	%o4,	0x15BF,	%i2
	subcc	%l6,	%g4,	%o7
	wr	%g0,	0x89,	%asi
	lduba	[%l7 + 0x57] %asi,	%i0
	sra	%i3,	%l4,	%l5
	tsubcc	%g3,	0x0FDC,	%o2
	brgez	%l1,	loop_561
	tcs	%icc,	0x0
	fmovdneg	%xcc,	%f12,	%f26
	ldd	[%l7 + 0x70],	%i6
loop_561:
	movne	%icc,	%i5,	%g1
	edge16ln	%i1,	%o0,	%g5
	te	%icc,	0x4
	alignaddrl	%l2,	%g2,	%o6
	addc	%i4,	%g6,	%o3
	smulcc	%o1,	0x174B,	%l0
	fbue	%fcc2,	loop_562
	tsubcctv	%l3,	0x11D1,	%i7
	movrlez	%g7,	0x314,	%o5
	andn	%i2,	0x1AA2,	%l6
loop_562:
	sra	%o4,	0x0B,	%o7
	bneg,a,pn	%xcc,	loop_563
	fbg	%fcc3,	loop_564
	fmovsneg	%xcc,	%f6,	%f4
	fmovrdgez	%g4,	%f12,	%f20
loop_563:
	fmovsgu	%icc,	%f28,	%f12
loop_564:
	xnor	%i0,	0x029C,	%l4
	bcc,pn	%icc,	loop_565
	subcc	%i3,	%l5,	%o2
	fpsub32	%f0,	%f10,	%f10
	fcmped	%fcc0,	%f10,	%f2
loop_565:
	addcc	%g3,	0x1601,	%l1
	xor	%i5,	0x074B,	%i6
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
	tsubcc	%g1,	%o0,	%i1
	movvc	%xcc,	%l2,	%g2
	brgz	%g5,	loop_567
loop_566:
	fbo,a	%fcc1,	loop_568
	fble	%fcc2,	loop_569
	fcmpne16	%f14,	%f14,	%o6
loop_567:
	tleu	%xcc,	0x4
loop_568:
	bcs	loop_570
loop_569:
	bge	loop_571
	andcc	%i4,	0x08E0,	%g6
	movg	%icc,	%o1,	%o3
loop_570:
	addcc	%l3,	0x071C,	%l0
loop_571:
	array8	%g7,	%i7,	%i2
	ta	%icc,	0x1
	xorcc	%l6,	0x0353,	%o4
	subccc	%o7,	%g4,	%i0
	fnor	%f8,	%f0,	%f10
	edge32	%l4,	%i3,	%l5
	movgu	%icc,	%o5,	%g3
	fmuld8ulx16	%f20,	%f2,	%f10
	udivx	%l1,	0x18B6,	%i5
	brnz,a	%o2,	loop_572
	nop
	setx	loop_573,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fbue	%fcc1,	loop_574
	fxors	%f8,	%f25,	%f17
loop_572:
	subcc	%i6,	%g1,	%i1
loop_573:
	ldd	[%l7 + 0x20],	%f4
loop_574:
	movpos	%xcc,	%o0,	%l2
	fnegs	%f18,	%f0
	sethi	0x120B,	%g2
	movrlez	%g5,	%i4,	%g6
	andncc	%o1,	%o6,	%o3
	edge16	%l0,	%l3,	%i7
	movcc	%xcc,	%g7,	%i2
	fmovsge	%xcc,	%f31,	%f6
	wr	%g0,	0x11,	%asi
	stwa	%l6,	[%l7 + 0x58] %asi
	udivx	%o7,	0x090F,	%g4
	movgu	%xcc,	%i0,	%o4
	brlz,a	%l4,	loop_575
	mova	%xcc,	%i3,	%o5
	movne	%icc,	%l5,	%g3
	popc	0x0DE0,	%l1
loop_575:
	movre	%i5,	%i6,	%g1
	fbe,a	%fcc2,	loop_576
	fmovrdgez	%o2,	%f16,	%f0
	fornot1	%f6,	%f18,	%f0
	set	0x71, %g4
	ldstuba	[%l7 + %g4] 0x80,	%i1
loop_576:
	movpos	%xcc,	%l2,	%g2
	ldx	[%l7 + 0x08],	%o0
	edge8n	%g5,	%i4,	%g6
	brnz,a	%o6,	loop_577
	fpadd16	%f10,	%f10,	%f26
	stw	%o3,	[%l7 + 0x78]
	bn,pn	%xcc,	loop_578
loop_577:
	mulscc	%l0,	%l3,	%o1
	lduw	[%l7 + 0x5C],	%i7
	edge8l	%g7,	%i2,	%o7
loop_578:
	sub	%l6,	0x0021,	%i0
	subc	%o4,	%l4,	%i3
	taddcc	%o5,	0x0C0C,	%l5
	smulcc	%g3,	%g4,	%l1
	tvs	%xcc,	0x7
	fbg,a	%fcc0,	loop_579
	fbe,a	%fcc1,	loop_580
	taddcctv	%i6,	%g1,	%o2
	andn	%i5,	%l2,	%g2
loop_579:
	movrne	%o0,	%i1,	%i4
loop_580:
	fmovsg	%icc,	%f29,	%f7
	sdivcc	%g6,	0x0E5B,	%g5
	fba,a	%fcc0,	loop_581
	lduh	[%l7 + 0x08],	%o6
	fmovsvc	%icc,	%f21,	%f18
	fmovsge	%xcc,	%f4,	%f19
loop_581:
	fpadd16	%f24,	%f26,	%f4
	ldstub	[%l7 + 0x09],	%l0
	movrgz	%l3,	%o3,	%o1
	array16	%i7,	%i2,	%g7
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
	ldd	[%l7 + 0x20],	%i6
	sll	%o7,	0x06,	%o4
	fmovdg	%xcc,	%f10,	%f31
loop_582:
	movrgz	%i0,	%i3,	%o5
	nop
	setx loop_583, %l0, %l1
	jmpl %l1, %l5
	fornot1s	%f6,	%f2,	%f7
	edge8n	%l4,	%g4,	%l1
	fbne,a	%fcc0,	loop_584
loop_583:
	fmovsvc	%icc,	%f20,	%f11
	movcs	%xcc,	%g3,	%i6
	movne	%xcc,	%o2,	%i5
loop_584:
	andncc	%g1,	%l2,	%o0
	xnorcc	%i1,	0x11D9,	%g2
	fmul8x16	%f11,	%f18,	%f8
	edge16l	%g6,	%g5,	%o6
	edge16ln	%l0,	%i4,	%o3
	fnor	%f16,	%f2,	%f10
	tge	%xcc,	0x6
	orncc	%o1,	0x11D9,	%l3
	sdivx	%i7,	0x0156,	%i2
	edge8	%g7,	%o7,	%o4
	fbuge,a	%fcc0,	loop_585
	sdiv	%i0,	0x0CB0,	%i3
	lduw	[%l7 + 0x7C],	%o5
	lduw	[%l7 + 0x14],	%l6
loop_585:
	srlx	%l5,	%l4,	%l1
	tg	%icc,	0x3
	movn	%icc,	%g4,	%g3
	sir	0x0C5F
	fmovdn	%xcc,	%f12,	%f21
	edge32	%i6,	%i5,	%o2
	ldd	[%l7 + 0x28],	%l2
	fcmpes	%fcc0,	%f30,	%f9
	nop
	setx	loop_586,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movvs	%icc,	%o0,	%i1
	add	%l7,	0x68,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%g2
	casa	[%l6] %asi,	%g2,	%g1
loop_586:
	nop
	set	0x53, %o1
	stba	%g5,	[%l7 + %o1] 0x19
	ldd	[%l7 + 0x10],	%g6
	set	0x78, %o2
	stda	%l0,	[%l7 + %o2] 0x22
	membar	#Sync
	smul	%o6,	0x1DE8,	%i4
	bl,pt	%xcc,	loop_587
	movcc	%xcc,	%o3,	%l3
	tcs	%xcc,	0x5
	movgu	%xcc,	%o1,	%i2
loop_587:
	umulcc	%i7,	0x0AA8,	%o7
	tvc	%icc,	0x3
	flush	%l7 + 0x4C
	tvs	%icc,	0x2
	ldd	[%l7 + 0x60],	%f4
	tsubcc	%g7,	0x07C7,	%i0
	fmul8sux16	%f8,	%f20,	%f28
	fmovrsgez	%o4,	%f8,	%f14
	fmovsa	%icc,	%f22,	%f29
	fmovda	%icc,	%f31,	%f11
	orncc	%i3,	%l6,	%o5
	fmovrdgz	%l4,	%f4,	%f4
	tleu	%icc,	0x5
	fmovsg	%xcc,	%f29,	%f19
	fnand	%f10,	%f12,	%f0
	fpadd32s	%f29,	%f27,	%f13
	movg	%xcc,	%l5,	%l1
	ldstub	[%l7 + 0x31],	%g3
	alignaddrl	%g4,	%i6,	%o2
	tcc	%icc,	0x3
	bge	%xcc,	loop_588
	movrne	%l2,	0x3FF,	%o0
	movgu	%xcc,	%i1,	%i5
	alignaddr	%g2,	%g5,	%g6
loop_588:
	xnorcc	%l0,	0x11A4,	%o6
	sdivcc	%g1,	0x19D4,	%o3
	bcs,a,pn	%xcc,	loop_589
	tgu	%icc,	0x0
	brlz,a	%i4,	loop_590
	sdivcc	%l3,	0x1852,	%i2
loop_589:
	udivx	%i7,	0x175C,	%o1
	xorcc	%o7,	0x01CF,	%i0
loop_590:
	fnor	%f12,	%f8,	%f10
	stb	%g7,	[%l7 + 0x16]
	or	%i3,	%l6,	%o5
	edge16	%o4,	%l4,	%l5
	fmovsn	%xcc,	%f30,	%f30
	wr	%g0,	0x11,	%asi
	prefetcha	[%l7 + 0x08] %asi,	 0x3
	fcmpgt32	%f8,	%f26,	%g4
	fnot2s	%f30,	%f21
	fpackfix	%f30,	%f16
	sethi	0x11E1,	%g3
	fmovda	%icc,	%f7,	%f5
	edge16l	%o2,	%i6,	%l2
	std	%f10,	[%l7 + 0x40]
	fmovdcs	%icc,	%f31,	%f6
	tgu	%icc,	0x6
	subc	%i1,	%i5,	%o0
	wr	%g0,	0xe2,	%asi
	stha	%g5,	[%l7 + 0x54] %asi
	membar	#Sync
	tcc	%icc,	0x0
	set	0x6B, %g3
	stba	%g6,	[%l7 + %g3] 0x04
	array16	%l0,	%g2,	%g1
	movvs	%icc,	%o3,	%i4
	fblg,a	%fcc2,	loop_591
	movn	%icc,	%l3,	%i2
	fbue,a	%fcc2,	loop_592
	orcc	%o6,	%i7,	%o7
loop_591:
	fbue	%fcc0,	loop_593
	movrgz	%o1,	0x36F,	%g7
loop_592:
	bleu,pn	%icc,	loop_594
	edge8	%i3,	%i0,	%l6
loop_593:
	fbe	%fcc3,	loop_595
	tneg	%xcc,	0x2
loop_594:
	nop
	set	0x74, %g1
	lda	[%l7 + %g1] 0x04,	%f23
loop_595:
	pdist	%f24,	%f4,	%f0
	bn,a	%icc,	loop_596
	edge32ln	%o5,	%o4,	%l4
	srlx	%l1,	%l5,	%g4
	bgu,pt	%icc,	loop_597
loop_596:
	smul	%g3,	%i6,	%o2
	fnegs	%f2,	%f19
	umul	%l2,	%i5,	%o0
loop_597:
	fmovd	%f8,	%f0
	xnor	%i1,	%g6,	%l0
	fcmpeq16	%f18,	%f22,	%g5
	srl	%g1,	%o3,	%i4
	add	%l7,	0x30,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%g2
	casxa	[%l6] 0x89,	%g2,	%l3
	mova	%icc,	%i2,	%i7
	nop
	set	0x5C, %o6
	stw	%o6,	[%l7 + %o6]
	fnegs	%f21,	%f1
	array32	%o7,	%o1,	%i3
	fnand	%f6,	%f8,	%f8
	sub	%g7,	%i0,	%l6
	fnot1s	%f20,	%f25
	orcc	%o4,	%o5,	%l1
	nop
	set	0x63, %o7
	ldub	[%l7 + %o7],	%l5
	fbu	%fcc1,	loop_598
	edge16l	%g4,	%l4,	%i6
	movrgz	%g3,	%l2,	%i5
	movrgez	%o2,	0x06D,	%o0
loop_598:
	movrne	%i1,	%g6,	%l0
	umul	%g5,	%g1,	%o3
	fmovsle	%xcc,	%f25,	%f17
	fnands	%f24,	%f13,	%f27
	nop
	setx	loop_599,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	udivx	%i4,	0x1D3D,	%l3
	fmuld8sux16	%f26,	%f8,	%f12
	movrlz	%g2,	%i7,	%i2
loop_599:
	fba,a	%fcc3,	loop_600
	fmovsneg	%icc,	%f20,	%f12
	fmovrse	%o7,	%f10,	%f13
	fxnor	%f12,	%f18,	%f28
loop_600:
	taddcctv	%o1,	%o6,	%g7
	edge32l	%i0,	%l6,	%i3
	xnorcc	%o5,	%o4,	%l5
	movvc	%icc,	%l1,	%g4
	addcc	%l4,	%g3,	%i6
	brlz,a	%l2,	loop_601
	stx	%o2,	[%l7 + 0x78]
	array32	%i5,	%o0,	%g6
	mulscc	%i1,	%l0,	%g5
loop_601:
	srl	%g1,	0x0A,	%i4
	sllx	%l3,	0x11,	%g2
	fmovsgu	%icc,	%f13,	%f19
	fmovsne	%xcc,	%f13,	%f22
	nop
	setx	loop_602,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fornot2s	%f4,	%f10,	%f23
	fpsub16s	%f20,	%f8,	%f2
	fpadd16	%f24,	%f6,	%f8
loop_602:
	edge8	%i7,	%i2,	%o3
	be	loop_603
	srlx	%o1,	%o6,	%o7
	stw	%i0,	[%l7 + 0x70]
	tg	%icc,	0x6
loop_603:
	addccc	%g7,	0x1710,	%l6
	fcmpes	%fcc3,	%f9,	%f17
	edge16l	%i3,	%o5,	%o4
	sdivcc	%l1,	0x1F34,	%l5
	bshuffle	%f22,	%f10,	%f22
	edge8ln	%g4,	%g3,	%i6
	edge32ln	%l2,	%o2,	%l4
	taddcc	%o0,	%g6,	%i1
	swap	[%l7 + 0x14],	%l0
	st	%f12,	[%l7 + 0x74]
	fmovsg	%icc,	%f8,	%f16
	bgu,a	%icc,	loop_604
	udivcc	%g5,	0x12CB,	%g1
	bgu,pn	%icc,	loop_605
	fbn	%fcc3,	loop_606
loop_604:
	tsubcctv	%i4,	%i5,	%l3
	andncc	%g2,	%i2,	%o3
loop_605:
	ldstub	[%l7 + 0x52],	%o1
loop_606:
	nop
	set	0x24, %o0
	ldsba	[%l7 + %o0] 0x15,	%i7
	fnot2s	%f19,	%f15
	edge32ln	%o6,	%o7,	%g7
	edge32	%l6,	%i0,	%i3
	or	%o4,	0x0E5C,	%o5
	movne	%xcc,	%l1,	%g4
	fmovdg	%icc,	%f12,	%f23
	sllx	%g3,	%i6,	%l2
	movvc	%xcc,	%o2,	%l5
	movg	%xcc,	%l4,	%g6
	fble	%fcc1,	loop_607
	edge16n	%i1,	%l0,	%o0
	sethi	0x0AB6,	%g1
	sdiv	%i4,	0x15CC,	%g5
loop_607:
	prefetch	[%l7 + 0x1C],	 0x0
	fmovsgu	%xcc,	%f24,	%f28
	subccc	%l3,	%i5,	%i2
	bvs,pn	%icc,	loop_608
	tn	%icc,	0x7
	sir	0x1A04
	fbe,a	%fcc1,	loop_609
loop_608:
	flush	%l7 + 0x6C
	edge16l	%o3,	%g2,	%i7
	movvc	%xcc,	%o1,	%o7
loop_609:
	edge16	%o6,	%g7,	%l6
	mulscc	%i0,	0x1289,	%i3
	movrlz	%o5,	0x065,	%o4
	sra	%g4,	0x09,	%l1
	sethi	0x0A4E,	%i6
	brgz,a	%g3,	loop_610
	tcs	%icc,	0x1
	fxnors	%f30,	%f15,	%f14
	fcmpd	%fcc3,	%f18,	%f8
loop_610:
	nop
	wr	%g0,	0x10,	%asi
	stwa	%l2,	[%l7 + 0x34] %asi
	wr	%g0,	0x18,	%asi
	ldstuba	[%l7 + 0x78] %asi,	%o2
	andncc	%l5,	%l4,	%i1
	tvs	%icc,	0x1
	sllx	%g6,	%o0,	%l0
	sll	%i4,	0x03,	%g5
	fcmpd	%fcc2,	%f4,	%f14
	wr	%g0,	0x89,	%asi
	stda	%l2,	[%l7 + 0x68] %asi
	edge16ln	%g1,	%i2,	%i5
	nop
	set	0x58, %l0
	prefetch	[%l7 + %l0],	 0x0
	fcmple16	%f10,	%f12,	%o3
	set	0x40, %i7
	ldda	[%l7 + %i7] 0x80,	%f0
	bpos,a	%xcc,	loop_611
	array8	%g2,	%i7,	%o7
	bneg,a,pn	%icc,	loop_612
	fmovdcc	%icc,	%f13,	%f9
loop_611:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x4C, %i6
	lduha	[%l7 + %i6] 0x04,	%o1
loop_612:
	array8	%o6,	%l6,	%g7
	movg	%xcc,	%i0,	%o5
	movleu	%icc,	%i3,	%g4
	andn	%l1,	0x14B4,	%i6
	edge8l	%g3,	%l2,	%o4
	tsubcctv	%l5,	0x1129,	%l4
	array16	%o2,	%g6,	%o0
	fmovrde	%l0,	%f26,	%f24
	xnorcc	%i1,	%i4,	%l3
	taddcc	%g5,	%i2,	%g1
	movgu	%icc,	%o3,	%i5
	ta	%xcc,	0x0
	orcc	%g2,	%i7,	%o1
	std	%o6,	[%l7 + 0x30]
	or	%o7,	0x1EFA,	%l6
	te	%icc,	0x1
	te	%icc,	0x2
	bl,pt	%icc,	loop_613
	ldub	[%l7 + 0x3D],	%i0
	fpsub32	%f22,	%f22,	%f6
	fnot1	%f30,	%f14
loop_613:
	bl	loop_614
	tl	%xcc,	0x0
	addcc	%o5,	%g7,	%g4
	fnor	%f14,	%f20,	%f30
loop_614:
	tvs	%icc,	0x5
	tsubcc	%i3,	%i6,	%g3
	bvc,pt	%icc,	loop_615
	fmovspos	%icc,	%f3,	%f17
	addccc	%l1,	%l2,	%l5
	edge16n	%l4,	%o2,	%g6
loop_615:
	subccc	%o0,	0x1A26,	%o4
	fnor	%f10,	%f16,	%f20
	fbe	%fcc1,	loop_616
	fzero	%f14
	xnorcc	%i1,	0x07F8,	%i4
	subc	%l0,	%g5,	%i2
loop_616:
	nop
	wr	%g0,	0x88,	%asi
	ldda	[%l7 + 0x10] %asi,	%l2
	mova	%xcc,	%g1,	%i5
	movneg	%xcc,	%o3,	%g2
	udivx	%o1,	0x1914,	%o6
	fmovsle	%icc,	%f8,	%f1
	tge	%icc,	0x5
	srlx	%i7,	%o7,	%i0
	movl	%xcc,	%l6,	%g7
	te	%icc,	0x6
	membar	#Sync
	wr	%g0,	0xf1,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	sth	%o5,	[%l7 + 0x5E]
	fbn,a	%fcc2,	loop_617
	movl	%xcc,	%g4,	%i6
	fbg	%fcc2,	loop_618
	movneg	%icc,	%i3,	%g3
loop_617:
	tle	%xcc,	0x1
	fpmerge	%f29,	%f30,	%f16
loop_618:
	brnz,a	%l1,	loop_619
	movrlez	%l2,	%l5,	%l4
	andn	%o2,	%o0,	%g6
	movrlz	%o4,	%i1,	%l0
loop_619:
	siam	0x2
	xnor	%i4,	0x1CAE,	%g5
	ldx	[%l7 + 0x60],	%l3
	fblg	%fcc3,	loop_620
	sub	%g1,	%i5,	%i2
	alignaddr	%o3,	%o1,	%o6
	mulscc	%i7,	%g2,	%i0
loop_620:
	addcc	%l6,	0x1ED6,	%g7
	bg,a	loop_621
	fmovsn	%icc,	%f22,	%f12
	fbo,a	%fcc0,	loop_622
	fmovsvs	%xcc,	%f2,	%f14
loop_621:
	srlx	%o7,	0x0C,	%g4
	fcmple32	%f2,	%f12,	%o5
loop_622:
	movl	%xcc,	%i6,	%g3
	movn	%xcc,	%i3,	%l2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrlez	%l5,	%l1,	%l4
	fmul8x16	%f1,	%f10,	%f18
	ld	[%l7 + 0x6C],	%f24
	andn	%o0,	%g6,	%o4
	xnor	%i1,	0x16D2,	%o2
	edge16l	%l0,	%i4,	%g5
	brgez,a	%g1,	loop_623
	udivcc	%i5,	0x0E3E,	%l3
	wr	%g0,	0x19,	%asi
	lda	[%l7 + 0x2C] %asi,	%f15
loop_623:
	edge32l	%o3,	%o1,	%o6
	srax	%i2,	%i7,	%i0
	fzero	%f24
	fmovse	%icc,	%f19,	%f4
	brlez	%l6,	loop_624
	edge32ln	%g7,	%g2,	%g4
	fbuge	%fcc1,	loop_625
	tle	%icc,	0x5
loop_624:
	nop
	setx loop_626, %l0, %l1
	jmpl %l1, %o7
	ld	[%l7 + 0x1C],	%f30
loop_625:
	nop
	set	0x7F, %l4
	stb	%i6,	[%l7 + %l4]
	edge32	%o5,	%g3,	%i3
loop_626:
	ta	%icc,	0x0
	wr	%g0,	0x04,	%asi
	stda	%l2,	[%l7 + 0x08] %asi
	edge16n	%l5,	%l4,	%l1
	fbul,a	%fcc3,	loop_627
	ld	[%l7 + 0x50],	%f13
	tsubcc	%g6,	0x0A21,	%o0
	srax	%i1,	0x03,	%o4
loop_627:
	edge16ln	%o2,	%i4,	%g5
	tneg	%xcc,	0x5
	wr	%g0,	0x80,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	edge32ln	%g1,	%l0,	%l3
	andn	%i5,	%o1,	%o3
	bcc	loop_628
	srl	%o6,	0x09,	%i2
	tge	%xcc,	0x7
	fbl,a	%fcc3,	loop_629
loop_628:
	edge16ln	%i7,	%i0,	%g7
	fpadd32	%f8,	%f10,	%f8
	nop
	setx	loop_630,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_629:
	fandnot1	%f22,	%f20,	%f12
	ta	%xcc,	0x3
	sub	%l6,	0x070C,	%g4
loop_630:
	fmovdleu	%icc,	%f25,	%f27
	fcmpne16	%f0,	%f16,	%g2
	subcc	%i6,	0x0143,	%o7
	te	%xcc,	0x4
	movge	%xcc,	%o5,	%g3
	fpsub32s	%f7,	%f28,	%f19
	xor	%i3,	%l5,	%l2
	movg	%icc,	%l1,	%l4
	fmovdn	%icc,	%f12,	%f9
	sll	%o0,	0x06,	%g6
	smulcc	%i1,	%o2,	%o4
	membar	0x04
	brnz,a	%i4,	loop_631
	bne	loop_632
	std	%f24,	[%l7 + 0x58]
	edge8	%g5,	%l0,	%l3
loop_631:
	tl	%icc,	0x2
loop_632:
	sdivx	%g1,	0x1147,	%i5
	movrne	%o3,	%o1,	%i2
	umul	%o6,	0x1C70,	%i0
	wr	%g0,	0x80,	%asi
	stwa	%i7,	[%l7 + 0x74] %asi
	fmovdneg	%xcc,	%f3,	%f15
	lduh	[%l7 + 0x2C],	%g7
	movrne	%l6,	0x085,	%g2
	swap	[%l7 + 0x78],	%g4
	fcmpgt16	%f0,	%f24,	%o7
	movcs	%icc,	%o5,	%i6
	fornot2s	%f20,	%f31,	%f6
	fxnors	%f4,	%f18,	%f11
	fmovsa	%icc,	%f13,	%f6
	movgu	%xcc,	%i3,	%l5
	movrgez	%l2,	%g3,	%l4
	srax	%o0,	%g6,	%l1
	std	%f28,	[%l7 + 0x28]
	fpadd16s	%f14,	%f10,	%f19
	movvs	%xcc,	%i1,	%o2
	fpsub32	%f28,	%f16,	%f30
	movrlz	%i4,	0x150,	%o4
	sdivx	%l0,	0x11D5,	%g5
	brgez,a	%g1,	loop_633
	sub	%i5,	0x18B3,	%l3
	movvs	%xcc,	%o3,	%o1
	fbl	%fcc3,	loop_634
loop_633:
	fbe	%fcc1,	loop_635
	fba	%fcc2,	loop_636
	stbar
loop_634:
	tsubcctv	%i2,	0x004E,	%i0
loop_635:
	mulx	%o6,	%i7,	%l6
loop_636:
	nop
	set	0x40, %l6
	ldda	[%l7 + %l6] 0x81,	%f0
	add	%l7,	0x78,	%l6
	wr	%g0,	0x18,	%asi
	ldxa	[%l6] %asi,	%g2
	casxa	[%l6] 0x18,	%g2,	%g7
	edge8n	%g4,	%o7,	%o5
	edge8l	%i6,	%l5,	%i3
	fbul,a	%fcc2,	loop_637
	tn	%icc,	0x7
	bneg	loop_638
	mulscc	%l2,	0x08B5,	%g3
loop_637:
	ldd	[%l7 + 0x70],	%f14
	fpmerge	%f0,	%f5,	%f22
loop_638:
	smulcc	%o0,	0x033D,	%l4
	array16	%g6,	%i1,	%l1
	addc	%i4,	0x0870,	%o4
	srlx	%l0,	%g5,	%o2
	set	0x7C, %i3
	lduwa	[%l7 + %i3] 0x19,	%g1
	set	0x40, %i2
	stda	%f16,	[%l7 + %i2] 0x89
	movn	%xcc,	%l3,	%o3
	srl	%i5,	0x15,	%i2
	wr	%g0,	0x19,	%asi
	stha	%o1,	[%l7 + 0x12] %asi
	fcmpne32	%f12,	%f20,	%o6
	sethi	0x19DC,	%i7
	bneg	loop_639
	mova	%xcc,	%i0,	%g2
	tgu	%icc,	0x1
	subc	%g7,	%g4,	%o7
loop_639:
	movpos	%xcc,	%l6,	%i6
	brgz	%l5,	loop_640
	fpadd16s	%f4,	%f28,	%f19
	andncc	%o5,	%i3,	%g3
	bgu,a	loop_641
loop_640:
	call	loop_642
	udivx	%o0,	0x04E9,	%l4
	faligndata	%f24,	%f16,	%f30
loop_641:
	fzeros	%f1
loop_642:
	st	%f4,	[%l7 + 0x0C]
	edge32	%l2,	%g6,	%l1
	movn	%xcc,	%i1,	%o4
	movrgez	%i4,	%l0,	%o2
	smul	%g5,	%g1,	%o3
	fxor	%f8,	%f22,	%f30
	wr	%g0,	0x89,	%asi
	ldswa	[%l7 + 0x34] %asi,	%i5
	xnor	%i2,	0x126E,	%l3
	edge8ln	%o1,	%i7,	%i0
	nop
	setx loop_643, %l0, %l1
	jmpl %l1, %g2
	fmul8x16	%f10,	%f4,	%f12
	fnand	%f18,	%f6,	%f20
	movcc	%xcc,	%o6,	%g7
loop_643:
	movpos	%icc,	%o7,	%l6
	fornot1	%f12,	%f22,	%f8
	sra	%i6,	0x08,	%l5
	fsrc1s	%f18,	%f8
	fnot2s	%f30,	%f10
	fbo,a	%fcc3,	loop_644
	faligndata	%f8,	%f30,	%f16
	lduw	[%l7 + 0x68],	%o5
	fmovdpos	%xcc,	%f28,	%f8
loop_644:
	movge	%icc,	%g4,	%i3
	umulcc	%g3,	%o0,	%l4
	te	%xcc,	0x0
	sllx	%l2,	0x1A,	%l1
	smulcc	%g6,	%i1,	%o4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	umulcc	%i4,	0x0120,	%o2
	fand	%f20,	%f20,	%f0
	fmovrsgz	%l0,	%f29,	%f3
	fbe	%fcc2,	loop_645
	andn	%g5,	%g1,	%i5
	fand	%f12,	%f24,	%f14
	bge	loop_646
loop_645:
	tne	%xcc,	0x5
	wr	%g0,	0x11,	%asi
	stda	%o2,	[%l7 + 0x08] %asi
loop_646:
	subc	%i2,	%l3,	%o1
	set	0x1D, %o4
	ldstuba	[%l7 + %o4] 0x19,	%i0
	fbule	%fcc2,	loop_647
	movrgez	%i7,	%g2,	%o6
	ldub	[%l7 + 0x77],	%g7
	fpmerge	%f5,	%f21,	%f8
loop_647:
	edge8l	%l6,	%i6,	%o7
	fmovrslez	%o5,	%f4,	%f29
	bcc,a	%xcc,	loop_648
	fabss	%f31,	%f31
	fmovdpos	%icc,	%f18,	%f13
	move	%icc,	%g4,	%l5
loop_648:
	xnorcc	%i3,	%g3,	%l4
	andcc	%l2,	0x0F61,	%o0
	tge	%xcc,	0x1
	fmovscs	%icc,	%f10,	%f23
	edge32	%l1,	%i1,	%o4
	movrgz	%g6,	%i4,	%l0
	tgu	%xcc,	0x6
	edge16l	%g5,	%g1,	%o2
	xorcc	%o3,	0x02E7,	%i5
	bshuffle	%f30,	%f2,	%f6
	tgu	%icc,	0x5
	nop
	set	0x42, %i4
	stb	%l3,	[%l7 + %i4]
	edge8	%o1,	%i0,	%i7
	add	%l7,	0x48,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%g2
	casa	[%l6] %asi,	%g2,	%i2
	orncc	%g7,	0x1CF6,	%l6
	fmovscs	%xcc,	%f10,	%f8
	xnor	%i6,	%o7,	%o6
	edge32ln	%o5,	%g4,	%l5
	tl	%xcc,	0x3
	stbar
	fmovdgu	%xcc,	%f4,	%f0
	fmovdne	%icc,	%f18,	%f14
	movcs	%xcc,	%i3,	%g3
	wr	%g0,	0x0c,	%asi
	lduba	[%l7 + 0x4D] %asi,	%l4
	or	%o0,	%l1,	%i1
	bcc,pt	%icc,	loop_649
	fbule	%fcc2,	loop_650
	nop
	set	0x5C, %i5
	stw	%o4,	[%l7 + %i5]
	tneg	%xcc,	0x7
loop_649:
	brz,a	%l2,	loop_651
loop_650:
	orn	%i4,	0x0506,	%g6
	fbue	%fcc1,	loop_652
	subc	%l0,	%g1,	%g5
loop_651:
	sir	0x12AE
	ta	%icc,	0x4
loop_652:
	sll	%o2,	0x0D,	%i5
	sethi	0x17BE,	%o3
	set	0x38, %l5
	ldxa	[%l7 + %l5] 0x15,	%l3
	subc	%i0,	%o1,	%i7
	tneg	%icc,	0x6
	fcmpgt32	%f12,	%f14,	%i2
	bne	loop_653
	brgz	%g2,	loop_654
	fmovrdlz	%l6,	%f26,	%f12
	xnor	%i6,	0x0519,	%o7
loop_653:
	movrgez	%g7,	%o6,	%o5
loop_654:
	mulx	%g4,	%i3,	%g3
	sdivx	%l5,	0x00E8,	%o0
	sra	%l1,	0x01,	%l4
	sdivx	%o4,	0x16B2,	%l2
	set	0x70, %i1
	ldda	[%l7 + %i1] 0x04,	%i4
	tg	%xcc,	0x6
	xnorcc	%g6,	0x0F49,	%l0
	fones	%f0
	tsubcctv	%g1,	%g5,	%o2
	orcc	%i1,	0x0B13,	%o3
	fmovs	%f16,	%f9
	edge16ln	%l3,	%i5,	%i0
	sdiv	%i7,	0x0639,	%i2
	for	%f8,	%f28,	%f30
	andn	%o1,	0x0F73,	%g2
	tneg	%icc,	0x1
	fone	%f6
	wr	%g0,	0xe2,	%asi
	stxa	%l6,	[%l7 + 0x20] %asi
	membar	#Sync
	movcc	%icc,	%i6,	%g7
	set	0x7A, %o5
	lduha	[%l7 + %o5] 0x18,	%o6
	ldd	[%l7 + 0x70],	%o6
	movge	%icc,	%o5,	%i3
	fmovrse	%g3,	%f10,	%f19
	tvc	%xcc,	0x6
	fmovd	%f10,	%f10
	movleu	%icc,	%g4,	%l5
	andn	%o0,	0x0B73,	%l4
	mulx	%l1,	0x00A3,	%o4
	array16	%i4,	%l2,	%g6
	edge32n	%g1,	%l0,	%g5
	movrgz	%o2,	%o3,	%l3
	tcs	%icc,	0x4
	call	loop_655
	fbu,a	%fcc0,	loop_656
	fbule	%fcc2,	loop_657
	fmuld8sux16	%f15,	%f1,	%f16
loop_655:
	tpos	%xcc,	0x3
loop_656:
	movn	%icc,	%i5,	%i1
loop_657:
	tg	%xcc,	0x5
	fmovdgu	%xcc,	%f0,	%f27
	fmovrse	%i0,	%f18,	%f27
	edge32	%i7,	%i2,	%o1
	sdivcc	%g2,	0x19A3,	%i6
	fmovdl	%xcc,	%f3,	%f19
	andn	%g7,	%l6,	%o6
	addc	%o7,	%i3,	%g3
	fmovsvs	%xcc,	%f17,	%f21
	fpsub32	%f2,	%f8,	%f2
	movvc	%icc,	%g4,	%l5
	fpsub16	%f14,	%f24,	%f30
	wr	%g0,	0x58,	%asi
	ldxa	[%g0 + 0x0] %asi,	%o5
	ldstub	[%l7 + 0x71],	%o0
	ldsw	[%l7 + 0x08],	%l1
	tle	%xcc,	0x6
	brgez,a	%l4,	loop_658
	movneg	%xcc,	%i4,	%l2
	edge32	%g6,	%g1,	%o4
	tne	%xcc,	0x5
loop_658:
	srl	%g5,	%o2,	%o3
	movpos	%xcc,	%l0,	%l3
	tl	%icc,	0x7
	xnor	%i1,	%i5,	%i7
	add	%l7,	0x10,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%i2
	casa	[%l6] %asi,	%i2,	%i0
	tge	%xcc,	0x1
	fnegs	%f2,	%f30
	set	0x20, %g5
	lda	[%l7 + %g5] 0x11,	%f31
	xor	%o1,	0x0E88,	%i6
	nop
	setx loop_659, %l0, %l1
	jmpl %l1, %g2
	movneg	%icc,	%l6,	%g7
	fcmpeq32	%f2,	%f6,	%o7
	movre	%i3,	0x2A4,	%o6
loop_659:
	addcc	%g3,	0x1F15,	%l5
	te	%icc,	0x3
	tpos	%xcc,	0x5
	addccc	%g4,	0x00BA,	%o0
	xnorcc	%l1,	0x0234,	%l4
	ld	[%l7 + 0x58],	%f5
	tgu	%icc,	0x7
	add	%i4,	%l2,	%g6
	fmovsn	%xcc,	%f0,	%f1
	edge32ln	%o5,	%o4,	%g5
	fmovdcc	%xcc,	%f5,	%f9
	andcc	%o2,	0x07EA,	%g1
	brnz	%l0,	loop_660
	fmovdl	%icc,	%f31,	%f20
	fmovde	%icc,	%f11,	%f5
	tvc	%xcc,	0x3
loop_660:
	tne	%xcc,	0x3
	mova	%icc,	%o3,	%i1
	be,a	loop_661
	fmovspos	%icc,	%f25,	%f20
	taddcc	%l3,	%i7,	%i2
	fnot2s	%f26,	%f17
loop_661:
	fmovdg	%icc,	%f28,	%f8
	bneg,a	%xcc,	loop_662
	ble,a	%icc,	loop_663
	subc	%i0,	%i5,	%i6
	alignaddr	%g2,	%l6,	%g7
loop_662:
	nop
	membar	#Sync
	set	0x40, %l2
	ldda	[%l7 + %l2] 0xf9,	%f16
loop_663:
	movrgz	%o7,	0x33C,	%o1
	stb	%o6,	[%l7 + 0x46]
	edge16ln	%i3,	%l5,	%g4
	wr	%g0,	0x81,	%asi
	lduba	[%l7 + 0x37] %asi,	%o0
	xorcc	%l1,	0x00B2,	%g3
	fmovs	%f3,	%f31
	fba,a	%fcc3,	loop_664
	tne	%xcc,	0x7
	subc	%i4,	%l4,	%g6
	edge16ln	%l2,	%o5,	%g5
loop_664:
	nop
	wr	%g0,	0x89,	%asi
	stha	%o2,	[%l7 + 0x46] %asi
	brlez	%g1,	loop_665
	movn	%icc,	%l0,	%o4
	bvc,pn	%icc,	loop_666
	fcmpgt32	%f14,	%f0,	%o3
loop_665:
	fmovd	%f0,	%f4
	movvc	%xcc,	%i1,	%i7
loop_666:
	fexpand	%f24,	%f6
	edge8l	%l3,	%i2,	%i5
	sir	0x0E21
	fornot2s	%f15,	%f14,	%f30
	add	%l7,	0x08,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%i6
	casxa	[%l6] %asi,	%i6,	%i0
	membar	0x37
	fmovda	%xcc,	%f29,	%f12
	orncc	%g2,	%g7,	%o7
	brgez	%l6,	loop_667
	edge16n	%o6,	%o1,	%l5
	fbge	%fcc1,	loop_668
	brlz,a	%g4,	loop_669
loop_667:
	stbar
	fmovdvc	%icc,	%f26,	%f27
loop_668:
	fexpand	%f1,	%f4
loop_669:
	tne	%xcc,	0x5
	fmovscs	%icc,	%f17,	%f13
	stb	%i3,	[%l7 + 0x40]
	movgu	%xcc,	%o0,	%g3
	movneg	%icc,	%i4,	%l1
	fsrc2s	%f14,	%f5
	fmovda	%xcc,	%f19,	%f23
	fones	%f4
	fbug,a	%fcc0,	loop_670
	nop
	set	0x41, %g6
	ldub	[%l7 + %g6],	%g6
	edge8ln	%l2,	%o5,	%l4
	addccc	%o2,	0x1C5F,	%g1
loop_670:
	fsrc1	%f26,	%f18
	or	%l0,	%g5,	%o3
	movn	%icc,	%o4,	%i1
	alignaddrl	%i7,	%l3,	%i5
	popc	0x198F,	%i2
	tn	%xcc,	0x6
	sdivcc	%i0,	0x0F80,	%g2
	movl	%icc,	%g7,	%o7
	nop
	setx	loop_671,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	call	loop_672
	sra	%l6,	0x0D,	%o6
	edge32	%o1,	%i6,	%l5
loop_671:
	brnz,a	%i3,	loop_673
loop_672:
	sethi	0x1B35,	%o0
	xnorcc	%g3,	0x1099,	%i4
	tcs	%icc,	0x5
loop_673:
	fba,a	%fcc2,	loop_674
	movcs	%icc,	%l1,	%g4
	fmovdne	%xcc,	%f18,	%f4
	alignaddrl	%g6,	%l2,	%l4
loop_674:
	movcs	%icc,	%o2,	%g1
	orcc	%o5,	0x122F,	%l0
	fmovsa	%xcc,	%f18,	%f14
	edge32ln	%o3,	%o4,	%i1
	sllx	%g5,	%l3,	%i5
	andncc	%i7,	%i0,	%g2
	fsrc1	%f18,	%f14
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnorcc	%i2,	0x128C,	%o7
	fmul8x16al	%f24,	%f11,	%f6
	tg	%xcc,	0x4
	movneg	%icc,	%g7,	%o6
	move	%xcc,	%o1,	%i6
	tsubcctv	%l5,	0x1F9E,	%i3
	umul	%l6,	%o0,	%g3
	fpadd16s	%f31,	%f7,	%f15
	orncc	%l1,	%i4,	%g6
	fmovrdgez	%l2,	%f12,	%f22
	fzeros	%f6
	fblg,a	%fcc3,	loop_675
	ldx	[%l7 + 0x60],	%g4
	tcc	%icc,	0x2
	movcc	%icc,	%o2,	%g1
loop_675:
	edge8ln	%l4,	%l0,	%o5
	movcs	%xcc,	%o4,	%i1
	taddcctv	%g5,	%l3,	%o3
	sra	%i5,	%i0,	%i7
	fsrc2s	%f15,	%f0
	set	0x08, %g2
	prefetcha	[%l7 + %g2] 0x11,	 0x3
	fcmple16	%f24,	%f8,	%o7
	fxnors	%f11,	%f17,	%f22
	fmovrdne	%g2,	%f18,	%f24
	movneg	%xcc,	%o6,	%o1
	fpsub32	%f18,	%f0,	%f12
	movgu	%xcc,	%g7,	%l5
	wr	%g0,	0x04,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	edge16	%i3,	%l6,	%o0
	std	%f30,	[%l7 + 0x10]
	membar	0x7F
	set	0x68, %g7
	swapa	[%l7 + %g7] 0x88,	%g3
	bcs	loop_676
	fmovdne	%icc,	%f4,	%f5
	popc	%i6,	%i4
	smulcc	%g6,	%l2,	%l1
loop_676:
	edge32l	%g4,	%g1,	%o2
	orncc	%l4,	0x002D,	%o5
	fbne,a	%fcc2,	loop_677
	te	%icc,	0x7
	movre	%o4,	0x2E5,	%i1
	srlx	%l0,	0x07,	%g5
loop_677:
	movvc	%icc,	%o3,	%l3
	udiv	%i0,	0x0118,	%i5
	andncc	%i2,	%o7,	%i7
	popc	%g2,	%o6
	popc	0x0C36,	%g7
	ldub	[%l7 + 0x69],	%l5
	tneg	%icc,	0x2
	edge8	%o1,	%l6,	%i3
	xnorcc	%g3,	%i6,	%o0
	st	%f14,	[%l7 + 0x48]
	movl	%icc,	%g6,	%l2
	and	%i4,	%g4,	%g1
	fmovsneg	%icc,	%f18,	%f29
	umul	%o2,	%l4,	%o5
	fzero	%f18
	srl	%o4,	0x1C,	%i1
	brnz,a	%l1,	loop_678
	addcc	%g5,	%o3,	%l3
	movrlez	%i0,	%l0,	%i5
	edge8n	%o7,	%i7,	%g2
loop_678:
	movpos	%xcc,	%o6,	%g7
	movcs	%icc,	%i2,	%l5
	st	%f25,	[%l7 + 0x14]
	tge	%icc,	0x6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpsub32s	%f18,	%f13,	%f6
	fmovrslz	%o1,	%f3,	%f3
	srax	%i3,	0x0B,	%l6
	movn	%icc,	%i6,	%o0
	fmovse	%icc,	%f11,	%f28
	bleu,pn	%icc,	loop_679
	array16	%g6,	%g3,	%l2
	tcs	%xcc,	0x5
	xor	%g4,	%g1,	%o2
loop_679:
	smulcc	%l4,	%i4,	%o4
	set	0x8, %i0
	ldxa	[%g0 + %i0] 0x20,	%i1
	srax	%o5,	%l1,	%g5
	sdivx	%l3,	0x0B16,	%i0
	popc	0x170A,	%o3
	fmovscc	%xcc,	%f24,	%f18
	for	%f6,	%f6,	%f0
	wr	%g0,	0xea,	%asi
	stha	%l0,	[%l7 + 0x72] %asi
	membar	#Sync
	lduh	[%l7 + 0x74],	%i5
	tcs	%icc,	0x1
	or	%i7,	0x0824,	%g2
	fmovse	%xcc,	%f20,	%f28
	wr	%g0,	0x2a,	%asi
	ldda	[%l7 + 0x70] %asi,	%o6
	smulcc	%g7,	%o6,	%l5
	andncc	%o1,	%i2,	%l6
	popc	0x17E7,	%i6
	movge	%icc,	%o0,	%g6
	tvc	%xcc,	0x2
	tvs	%xcc,	0x5
	movge	%xcc,	%g3,	%l2
	tsubcctv	%g4,	0x0940,	%i3
	fmul8x16al	%f29,	%f3,	%f24
	edge8n	%g1,	%l4,	%o2
	andcc	%i4,	%o4,	%i1
	array8	%l1,	%o5,	%g5
	sethi	0x1CA6,	%i0
	andcc	%o3,	0x058E,	%l0
	fpsub32s	%f5,	%f2,	%f20
	fmovrdne	%i5,	%f12,	%f20
	te	%icc,	0x1
	fba	%fcc3,	loop_680
	srlx	%i7,	%l3,	%o7
	wr	%g0,	0x89,	%asi
	ldsha	[%l7 + 0x4E] %asi,	%g7
loop_680:
	fnand	%f14,	%f10,	%f20
	tle	%xcc,	0x0
	fornot2s	%f29,	%f15,	%f22
	fnands	%f23,	%f6,	%f28
	edge16	%o6,	%g2,	%o1
	srl	%i2,	0x0D,	%l6
	and	%i6,	%l5,	%o0
	movrlz	%g6,	0x342,	%l2
	edge8ln	%g3,	%i3,	%g4
	brgez,a	%g1,	loop_681
	fmuld8ulx16	%f20,	%f31,	%f24
	ta	%xcc,	0x6
	umul	%o2,	0x14BB,	%l4
loop_681:
	add	%o4,	0x007D,	%i4
	subccc	%l1,	0x1315,	%i1
	orcc	%o5,	%i0,	%o3
	fzero	%f10
	xorcc	%g5,	0x121D,	%l0
	brlez,a	%i7,	loop_682
	te	%xcc,	0x6
	movge	%xcc,	%i5,	%l3
	fornot2	%f4,	%f26,	%f26
loop_682:
	movrgz	%o7,	%o6,	%g2
	bcc,a	loop_683
	sub	%o1,	0x19D6,	%i2
	tleu	%xcc,	0x2
	bneg,pt	%icc,	loop_684
loop_683:
	fmovsne	%xcc,	%f23,	%f21
	sdiv	%g7,	0x0A38,	%i6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_684:
	fones	%f6
	fpackfix	%f0,	%f7
	te	%xcc,	0x3
	udivx	%l6,	0x1C53,	%l5
	fmovdvs	%icc,	%f15,	%f6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	be	%icc,	loop_685
	bleu,a	%xcc,	loop_686
	fble,a	%fcc2,	loop_687
	movn	%icc,	%o0,	%g6
loop_685:
	and	%l2,	0x1AA2,	%i3
loop_686:
	subc	%g3,	%g1,	%g4
loop_687:
	movle	%xcc,	%l4,	%o4
	edge8ln	%o2,	%l1,	%i1
	sra	%o5,	0x0A,	%i0
	sll	%i4,	%o3,	%g5
	movgu	%icc,	%i7,	%i5
	edge8n	%l0,	%o7,	%o6
	fbe,a	%fcc0,	loop_688
	fmovrdgez	%g2,	%f28,	%f2
	movge	%icc,	%o1,	%l3
	fornot2	%f6,	%f16,	%f16
loop_688:
	fmovdne	%icc,	%f5,	%f14
	edge8l	%g7,	%i2,	%l6
	movvs	%xcc,	%i6,	%o0
	edge16n	%l5,	%g6,	%i3
	fblg,a	%fcc0,	loop_689
	fnegd	%f10,	%f0
	fmovdcs	%xcc,	%f29,	%f14
	movrgez	%l2,	%g3,	%g1
loop_689:
	movl	%xcc,	%g4,	%l4
	sllx	%o4,	%l1,	%o2
	tge	%xcc,	0x5
	movpos	%icc,	%o5,	%i0
	edge32l	%i4,	%i1,	%g5
	andncc	%o3,	%i7,	%l0
	array16	%o7,	%i5,	%o6
	set	0x70, %l1
	lduwa	[%l7 + %l1] 0x04,	%g2
	fexpand	%f18,	%f4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movvs	%icc,	%o1,	%l3
	fcmpne16	%f30,	%f22,	%i2
	sdivcc	%g7,	0x10B3,	%l6
	subcc	%i6,	%o0,	%l5
	sub	%i3,	%l2,	%g3
	tsubcctv	%g1,	%g4,	%g6
	fpadd32	%f4,	%f2,	%f18
	fmovsge	%xcc,	%f11,	%f20
	set	0x74, %l3
	ldswa	[%l7 + %l3] 0x0c,	%l4
	fsrc1	%f10,	%f28
	bgu	%icc,	loop_690
	fmovsneg	%xcc,	%f9,	%f30
	fsrc1	%f28,	%f10
	fmovdg	%icc,	%f29,	%f28
loop_690:
	popc	0x194C,	%o4
	tcc	%icc,	0x4
	movl	%xcc,	%o2,	%l1
	wr	%g0,	0x19,	%asi
	ldswa	[%l7 + 0x20] %asi,	%i0
	edge8l	%i4,	%o5,	%g5
	addcc	%o3,	0x044E,	%i7
	bneg	%xcc,	loop_691
	edge16ln	%i1,	%o7,	%l0
	fnands	%f9,	%f1,	%f2
	wr	%g0,	0x89,	%asi
	ldsba	[%l7 + 0x1C] %asi,	%o6
loop_691:
	bcc,a,pn	%xcc,	loop_692
	addccc	%i5,	%o1,	%g2
	sub	%i2,	%g7,	%l6
	ba,pt	%xcc,	loop_693
loop_692:
	movge	%icc,	%l3,	%o0
	edge32l	%i6,	%l5,	%l2
	brnz,a	%g3,	loop_694
loop_693:
	brgez,a	%g1,	loop_695
	brgez,a	%i3,	loop_696
	movrgz	%g6,	%g4,	%o4
loop_694:
	sth	%l4,	[%l7 + 0x56]
loop_695:
	movle	%xcc,	%l1,	%o2
loop_696:
	ldd	[%l7 + 0x28],	%f26
	fxors	%f6,	%f14,	%f28
	movvs	%icc,	%i0,	%i4
	faligndata	%f4,	%f12,	%f2
	fmovsneg	%icc,	%f2,	%f26
	fbuge,a	%fcc0,	loop_697
	tcc	%icc,	0x1
	umul	%o5,	%g5,	%i7
	edge32	%o3,	%i1,	%o7
loop_697:
	fba	%fcc3,	loop_698
	tcc	%icc,	0x6
	fmovrsgz	%o6,	%f19,	%f2
	set	0x18, %o3
	ldswa	[%l7 + %o3] 0x04,	%i5
loop_698:
	fmovrslez	%o1,	%f19,	%f23
	add	%l7,	0x0C,	%l6
	wr	%g0,	0x0c,	%asi
	lda	[%l6] %asi,	%l0
	casa	[%l6] 0x0c,	%l0,	%i2
	udivcc	%g7,	0x1BF5,	%g2
	sra	%l6,	0x1A,	%l3
	tcs	%icc,	0x2
	set	0x60, %g4
	lda	[%l7 + %g4] 0x80,	%f13
	tcc	%icc,	0x7
	tcc	%xcc,	0x6
	membar	#Sync
	wr	%g0,	0x16,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	fabsd	%f18,	%f18
	fnegs	%f15,	%f19
	srlx	%o0,	0x1E,	%i6
	udivcc	%l5,	0x0E27,	%l2
	movge	%xcc,	%g1,	%g3
	fones	%f7
	add	%l7,	0x68,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%i3,	%g6
	fbn,a	%fcc3,	loop_699
	movrlez	%g4,	%o4,	%l1
	fmovs	%f14,	%f5
	fors	%f6,	%f23,	%f18
loop_699:
	taddcc	%o2,	%l4,	%i0
	smulcc	%o5,	0x0DAB,	%i4
	fmovsvs	%icc,	%f2,	%f22
	fbuge,a	%fcc3,	loop_700
	fabsd	%f12,	%f20
	fblg	%fcc0,	loop_701
	movleu	%icc,	%i7,	%g5
loop_700:
	xorcc	%o3,	%o7,	%o6
	mulscc	%i1,	%o1,	%l0
loop_701:
	std	%f30,	[%l7 + 0x28]
	bne,pn	%icc,	loop_702
	bvs	loop_703
	sir	0x0CB0
	movrgz	%i2,	%g7,	%g2
loop_702:
	brlz	%l6,	loop_704
loop_703:
	ldsb	[%l7 + 0x38],	%l3
	array32	%o0,	%i5,	%i6
	st	%f15,	[%l7 + 0x7C]
loop_704:
	edge32n	%l2,	%l5,	%g3
	fmovrsgz	%i3,	%f2,	%f12
	ble,a,pn	%xcc,	loop_705
	sethi	0x1DE4,	%g6
	fcmped	%fcc0,	%f20,	%f10
	ldstub	[%l7 + 0x31],	%g4
loop_705:
	subcc	%g1,	%o4,	%o2
	ldsw	[%l7 + 0x38],	%l1
	fsrc1s	%f23,	%f29
	smulcc	%i0,	%l4,	%i4
	fble	%fcc2,	loop_706
	bg,a	%xcc,	loop_707
	ldsh	[%l7 + 0x50],	%o5
	movge	%xcc,	%i7,	%o3
loop_706:
	brgz	%g5,	loop_708
loop_707:
	andcc	%o6,	%o7,	%o1
	edge8l	%i1,	%l0,	%g7
	fpadd16s	%f13,	%f1,	%f30
loop_708:
	umul	%i2,	0x0142,	%l6
	movl	%xcc,	%l3,	%g2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16l	%o0,	%i6,	%i5
	tgu	%icc,	0x0
	ta	%icc,	0x7
	andcc	%l5,	0x0217,	%l2
	and	%g3,	%g6,	%g4
	tsubcctv	%g1,	0x1AF0,	%i3
	fandnot2	%f4,	%f28,	%f4
	movneg	%xcc,	%o4,	%o2
	te	%xcc,	0x0
	ble,a,pt	%icc,	loop_709
	bgu,a	loop_710
	xor	%i0,	%l1,	%i4
	ble	loop_711
loop_709:
	movvc	%xcc,	%o5,	%l4
loop_710:
	tle	%icc,	0x5
	tge	%icc,	0x0
loop_711:
	ldstub	[%l7 + 0x79],	%i7
	bvs,a,pt	%xcc,	loop_712
	fbule,a	%fcc1,	loop_713
	membar	0x2D
	for	%f22,	%f20,	%f4
loop_712:
	brz,a	%g5,	loop_714
loop_713:
	popc	%o3,	%o6
	set	0x70, %o1
	prefetcha	[%l7 + %o1] 0x81,	 0x3
loop_714:
	mulx	%i1,	%l0,	%g7
	movgu	%xcc,	%i2,	%l6
	stx	%o7,	[%l7 + 0x48]
	set	0x24, %g3
	sta	%f16,	[%l7 + %g3] 0x80
	fcmped	%fcc0,	%f12,	%f4
	fmul8sux16	%f26,	%f16,	%f16
	stb	%g2,	[%l7 + 0x7A]
	edge16l	%l3,	%i6,	%o0
	brz	%i5,	loop_715
	array16	%l5,	%l2,	%g3
	movle	%xcc,	%g4,	%g1
	fbn,a	%fcc2,	loop_716
loop_715:
	fbue,a	%fcc2,	loop_717
	sll	%i3,	0x13,	%g6
	mova	%xcc,	%o4,	%o2
loop_716:
	array8	%i0,	%i4,	%o5
loop_717:
	fbug	%fcc1,	loop_718
	xnor	%l4,	%l1,	%i7
	edge32ln	%o3,	%o6,	%g5
	edge8ln	%o1,	%i1,	%g7
loop_718:
	bn,a,pn	%icc,	loop_719
	add	%i2,	%l6,	%l0
	wr	%g0,	0x89,	%asi
	ldswa	[%l7 + 0x14] %asi,	%o7
loop_719:
	movl	%xcc,	%l3,	%g2
	movrne	%o0,	%i6,	%l5
	fcmped	%fcc3,	%f28,	%f16
	udiv	%i5,	0x14E3,	%g3
	tsubcc	%g4,	0x0411,	%g1
	ta	%icc,	0x0
	fmovdg	%xcc,	%f25,	%f23
	fmovsvc	%xcc,	%f8,	%f1
	fba	%fcc0,	loop_720
	edge32ln	%l2,	%g6,	%o4
	movpos	%icc,	%i3,	%i0
	set	0x40, %g1
	stda	%f16,	[%l7 + %g1] 0xf8
	membar	#Sync
loop_720:
	bvc	%xcc,	loop_721
	fandnot1	%f26,	%f16,	%f16
	taddcc	%o2,	0x1F8F,	%o5
	addc	%l4,	%i4,	%l1
loop_721:
	nop
	set	0x40, %o6
	ldda	[%l7 + %o6] 0x04,	%f16
	orn	%o3,	0x17FC,	%o6
	stb	%i7,	[%l7 + 0x2A]
	umulcc	%g5,	%o1,	%g7
	edge8ln	%i2,	%i1,	%l6
	nop
	set	0x40, %o2
	std	%f4,	[%l7 + %o2]
	set	0x6C, %o7
	ldswa	[%l7 + %o7] 0x19,	%l0
	fmovd	%f4,	%f24
	ldx	[%l7 + 0x78],	%l3
	tl	%icc,	0x0
	tn	%xcc,	0x3
	brlz,a	%g2,	loop_722
	movneg	%icc,	%o0,	%i6
	set	0x08, %o0
	stwa	%o7,	[%l7 + %o0] 0x2f
	membar	#Sync
loop_722:
	fexpand	%f23,	%f4
	movne	%icc,	%l5,	%i5
	array16	%g3,	%g1,	%g4
	sdiv	%g6,	0x157C,	%o4
	sethi	0x0316,	%l2
	fandnot2	%f22,	%f10,	%f22
	movrgz	%i3,	0x3A1,	%o2
	bne	loop_723
	sdivcc	%o5,	0x13B1,	%i0
	orn	%i4,	%l4,	%o3
	be,a,pn	%icc,	loop_724
loop_723:
	tgu	%xcc,	0x1
	movrne	%l1,	0x14F,	%i7
	xor	%g5,	0x1B04,	%o6
loop_724:
	nop
	wr	%g0,	0x80,	%asi
	ldxa	[%l7 + 0x10] %asi,	%g7
	ld	[%l7 + 0x14],	%f8
	or	%i2,	%o1,	%i1
	std	%l0,	[%l7 + 0x10]
	array8	%l6,	%g2,	%l3
	bl,pt	%xcc,	loop_725
	movcc	%icc,	%o0,	%i6
	fbug	%fcc0,	loop_726
	movrne	%l5,	%i5,	%g3
loop_725:
	fmul8x16al	%f11,	%f29,	%f12
	set	0x40, %l0
	ldda	[%l7 + %l0] 0x81,	%f0
loop_726:
	bvc	%xcc,	loop_727
	brlez,a	%g1,	loop_728
	srax	%o7,	0x05,	%g4
	edge32	%o4,	%g6,	%l2
loop_727:
	bge,pt	%xcc,	loop_729
loop_728:
	movcc	%icc,	%o2,	%i3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xorcc	%o5,	%i4,	%i0
loop_729:
	orncc	%o3,	0x0A0C,	%l1
	movrlez	%i7,	%l4,	%o6
	edge16l	%g5,	%g7,	%i2
	orncc	%i1,	%o1,	%l0
	set	0x7C, %i6
	stha	%g2,	[%l7 + %i6] 0x11
	edge16l	%l6,	%l3,	%i6
	be,pn	%xcc,	loop_730
	tsubcc	%l5,	%o0,	%i5
	bcc,a,pn	%icc,	loop_731
	xnorcc	%g1,	0x07FF,	%g3
loop_730:
	smulcc	%o7,	%g4,	%o4
	fmovdgu	%xcc,	%f31,	%f3
loop_731:
	movpos	%xcc,	%g6,	%l2
	umulcc	%o2,	%i3,	%i4
	fmovsl	%xcc,	%f19,	%f16
	call	loop_732
	bvs,a	loop_733
	std	%o4,	[%l7 + 0x70]
	tvs	%xcc,	0x2
loop_732:
	std	%o2,	[%l7 + 0x20]
loop_733:
	andn	%l1,	0x0DDC,	%i7
	and	%i0,	%l4,	%g5
	edge16ln	%o6,	%i2,	%i1
	tcs	%xcc,	0x1
	wr	%g0,	0x10,	%asi
	ldxa	[%l7 + 0x10] %asi,	%g7
	taddcc	%l0,	%o1,	%l6
	tvc	%icc,	0x4
	andcc	%g2,	0x14BC,	%l3
	fmovdvc	%icc,	%f17,	%f10
	fandnot2s	%f15,	%f5,	%f19
	tn	%icc,	0x1
	tne	%xcc,	0x6
	addccc	%l5,	0x071C,	%o0
	xnor	%i6,	0x0C42,	%g1
	fnot1	%f26,	%f24
	fornot2	%f26,	%f24,	%f16
	movgu	%xcc,	%g3,	%o7
	tcc	%icc,	0x5
	taddcctv	%i5,	0x0ED8,	%g4
	ldd	[%l7 + 0x50],	%f22
	sra	%g6,	%l2,	%o2
	call	loop_734
	tpos	%icc,	0x3
	wr	%g0,	0x80,	%asi
	lduha	[%l7 + 0x08] %asi,	%i3
loop_734:
	movle	%xcc,	%o4,	%i4
	subccc	%o5,	%l1,	%i7
	be,pn	%icc,	loop_735
	tgu	%icc,	0x4
	edge8l	%i0,	%o3,	%l4
	fmovdcs	%xcc,	%f17,	%f12
loop_735:
	edge8n	%o6,	%i2,	%g5
	orcc	%i1,	0x00C4,	%g7
	movrgz	%o1,	0x272,	%l6
	xor	%g2,	%l0,	%l3
	edge8l	%l5,	%o0,	%i6
	fblg	%fcc1,	loop_736
	ldstub	[%l7 + 0x73],	%g3
	stb	%g1,	[%l7 + 0x5A]
	tpos	%xcc,	0x7
loop_736:
	fcmpgt32	%f4,	%f6,	%i5
	ldub	[%l7 + 0x3C],	%g4
	popc	%o7,	%l2
	movle	%icc,	%o2,	%i3
	addcc	%g6,	%i4,	%o4
	umulcc	%l1,	%i7,	%i0
	orncc	%o3,	%l4,	%o5
	nop
	set	0x12, %l4
	lduh	[%l7 + %l4],	%i2
	fone	%f4
	alignaddrl	%g5,	%i1,	%g7
	sll	%o6,	0x14,	%l6
	xorcc	%o1,	%l0,	%g2
	edge16	%l5,	%o0,	%i6
	sir	0x121A
	set	0x61, %i7
	stba	%l3,	[%l7 + %i7] 0xe3
	membar	#Sync
	fmovsvs	%icc,	%f2,	%f17
	umul	%g3,	%g1,	%i5
	smul	%g4,	0x0B35,	%o7
	brlez,a	%o2,	loop_737
	movne	%icc,	%l2,	%i3
	fnors	%f21,	%f10,	%f6
	sir	0x1FCB
loop_737:
	sdivcc	%i4,	0x07A0,	%o4
	movge	%xcc,	%g6,	%i7
	membar	#Sync
	set	0x40, %i3
	ldda	[%l7 + %i3] 0xf0,	%f16
	fbu	%fcc3,	loop_738
	fexpand	%f10,	%f16
	brgz	%l1,	loop_739
	and	%o3,	%i0,	%l4
loop_738:
	fcmped	%fcc1,	%f10,	%f24
	fnors	%f19,	%f5,	%f18
loop_739:
	movl	%xcc,	%o5,	%g5
	tsubcctv	%i1,	0x1387,	%i2
	subc	%o6,	0x0453,	%g7
	sra	%o1,	%l6,	%l0
	xnorcc	%l5,	%g2,	%i6
	movn	%xcc,	%l3,	%g3
	tcc	%icc,	0x0
	fpadd16s	%f13,	%f8,	%f10
	movrlez	%o0,	0x215,	%g1
	for	%f18,	%f6,	%f22
	set	0x54, %l6
	stwa	%g4,	[%l7 + %l6] 0xe2
	membar	#Sync
	addc	%i5,	%o2,	%o7
	tvs	%icc,	0x4
	brgz,a	%l2,	loop_740
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mova	%xcc,	%i3,	%o4
	nop
	set	0x12, %o4
	sth	%g6,	[%l7 + %o4]
loop_740:
	srl	%i7,	%l1,	%i4
	orn	%i0,	0x1442,	%o3
	tg	%icc,	0x4
	movre	%l4,	0x0E8,	%g5
	membar	0x47
	fmul8sux16	%f6,	%f18,	%f0
	movgu	%icc,	%i1,	%i2
	ldsw	[%l7 + 0x74],	%o5
	edge32	%o6,	%g7,	%o1
	ld	[%l7 + 0x3C],	%f0
	tle	%icc,	0x0
	stb	%l6,	[%l7 + 0x08]
	movrgez	%l5,	%g2,	%l0
	andcc	%i6,	0x0370,	%g3
	wr	%g0,	0x80,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	wr	%g0,	0x22,	%asi
	stxa	%l3,	[%l7 + 0x48] %asi
	membar	#Sync
	fblg	%fcc2,	loop_741
	fmovdvs	%xcc,	%f23,	%f15
	set	0x40, %i4
	swapa	[%l7 + %i4] 0x81,	%g1
loop_741:
	smulcc	%o0,	0x13E0,	%g4
	movpos	%icc,	%i5,	%o7
	ta	%icc,	0x7
	fmovsvs	%xcc,	%f24,	%f18
	udivx	%l2,	0x142E,	%i3
	movcc	%icc,	%o2,	%g6
	xorcc	%i7,	%o4,	%i4
	subcc	%l1,	%i0,	%l4
	sir	0x0A3C
	fornot1s	%f4,	%f23,	%f2
	bshuffle	%f26,	%f4,	%f8
	fmul8x16	%f2,	%f20,	%f28
	andn	%g5,	%i1,	%i2
	movrlez	%o3,	0x1CB,	%o5
	tcs	%xcc,	0x5
	fbn	%fcc1,	loop_742
	fmovspos	%xcc,	%f28,	%f0
	fmovscs	%xcc,	%f3,	%f3
	sub	%o6,	0x0239,	%g7
loop_742:
	fbo	%fcc3,	loop_743
	add	%o1,	0x18AB,	%l5
	fnors	%f9,	%f4,	%f30
	tsubcctv	%g2,	0x18D1,	%l6
loop_743:
	mova	%xcc,	%l0,	%g3
	fcmple32	%f0,	%f22,	%l3
	movle	%icc,	%i6,	%g1
	tvc	%xcc,	0x7
	tsubcc	%g4,	%o0,	%i5
	fzeros	%f19
	fbu,a	%fcc0,	loop_744
	ba,a,pt	%xcc,	loop_745
	movleu	%icc,	%o7,	%l2
	fcmpd	%fcc1,	%f12,	%f14
loop_744:
	subcc	%o2,	0x0E39,	%g6
loop_745:
	nop
	set	0x50, %i5
	prefetcha	[%l7 + %i5] 0x80,	 0x0
	movvc	%xcc,	%i7,	%o4
	tneg	%icc,	0x5
	fpmerge	%f28,	%f16,	%f16
	tg	%xcc,	0x2
	stb	%i4,	[%l7 + 0x5F]
	andcc	%l1,	%l4,	%i0
	wr	%g0,	0x18,	%asi
	sta	%f19,	[%l7 + 0x7C] %asi
	xnor	%i1,	%i2,	%g5
	add	%o5,	0x0987,	%o6
	sdiv	%o3,	0x136F,	%o1
	sll	%g7,	%l5,	%l6
	udiv	%g2,	0x0E18,	%g3
	set	0x10, %i2
	stda	%l0,	[%l7 + %i2] 0x2b
	membar	#Sync
	brnz,a	%l3,	loop_746
	fmovrdlz	%i6,	%f18,	%f26
	fbuge	%fcc3,	loop_747
	brgz,a	%g1,	loop_748
loop_746:
	udivcc	%g4,	0x0DEB,	%o0
	orcc	%o7,	%i5,	%l2
loop_747:
	tvc	%xcc,	0x5
loop_748:
	fmovrse	%o2,	%f15,	%f6
	sethi	0x01E8,	%i3
	orcc	%i7,	0x16D4,	%g6
	array8	%o4,	%l1,	%l4
	fbuge,a	%fcc3,	loop_749
	fmovrsne	%i0,	%f27,	%f1
	andcc	%i4,	%i2,	%i1
	edge8n	%o5,	%g5,	%o3
loop_749:
	movvc	%icc,	%o6,	%o1
	taddcctv	%l5,	%l6,	%g2
	xnorcc	%g7,	%g3,	%l0
	sethi	0x164D,	%i6
	fone	%f22
	tle	%icc,	0x1
	fnand	%f22,	%f30,	%f6
	fmovrdne	%l3,	%f14,	%f22
	array16	%g4,	%o0,	%o7
	bne,a,pt	%icc,	loop_750
	sdivx	%i5,	0x00A1,	%l2
	fnegs	%f10,	%f4
	array8	%g1,	%i3,	%i7
loop_750:
	nop
	set	0x08, %l5
	ldswa	[%l7 + %l5] 0x80,	%g6
	set	0x1D, %o5
	stba	%o2,	[%l7 + %o5] 0x80
	tneg	%xcc,	0x0
	be,a,pn	%xcc,	loop_751
	movvc	%icc,	%l1,	%o4
	fmovscs	%xcc,	%f0,	%f17
	bleu	loop_752
loop_751:
	bneg,a,pn	%icc,	loop_753
	fmovdne	%xcc,	%f31,	%f24
	movvc	%icc,	%i0,	%l4
loop_752:
	nop
	setx	loop_754,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_753:
	sdivx	%i2,	0x1A29,	%i1
	udiv	%o5,	0x0B0D,	%g5
	movrlez	%i4,	0x0C7,	%o6
loop_754:
	andcc	%o3,	0x132F,	%o1
	movn	%xcc,	%l6,	%g2
	movneg	%icc,	%g7,	%l5
	bge,pt	%icc,	loop_755
	call	loop_756
	movge	%xcc,	%g3,	%l0
	fbne,a	%fcc0,	loop_757
loop_755:
	lduw	[%l7 + 0x70],	%l3
loop_756:
	brgez,a	%g4,	loop_758
	movne	%xcc,	%i6,	%o7
loop_757:
	bne,pt	%xcc,	loop_759
	brlz	%o0,	loop_760
loop_758:
	bshuffle	%f12,	%f24,	%f4
	srax	%l2,	%g1,	%i5
loop_759:
	fxors	%f24,	%f18,	%f30
loop_760:
	tvs	%xcc,	0x5
	movgu	%icc,	%i3,	%g6
	taddcctv	%i7,	%o2,	%l1
	movvs	%xcc,	%i0,	%l4
	movleu	%xcc,	%o4,	%i2
	array16	%i1,	%g5,	%o5
	bn,a,pt	%xcc,	loop_761
	fabss	%f30,	%f4
	movrlz	%o6,	0x322,	%o3
	movrgez	%o1,	0x143,	%l6
loop_761:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdivcc	%g2,	0x0197,	%g7
	fmul8x16al	%f14,	%f17,	%f14
	membar	0x5B
	array8	%i4,	%g3,	%l5
	fpadd32	%f20,	%f20,	%f12
	edge8n	%l3,	%g4,	%l0
	tl	%icc,	0x1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdgu	%icc,	%f13,	%f31
	taddcctv	%i6,	%o0,	%o7
	nop
	setx loop_762, %l0, %l1
	jmpl %l1, %g1
	edge32l	%i5,	%l2,	%i3
	sllx	%i7,	0x05,	%g6
	fmovsne	%icc,	%f6,	%f3
loop_762:
	fnegd	%f28,	%f6
	fmul8x16au	%f3,	%f2,	%f0
	tn	%xcc,	0x0
	movvc	%icc,	%o2,	%i0
	add	%l4,	%l1,	%o4
	movcs	%icc,	%i2,	%g5
	siam	0x2
	movne	%xcc,	%o5,	%i1
	tvs	%xcc,	0x3
	stx	%o3,	[%l7 + 0x68]
	smul	%o6,	%o1,	%g2
	subc	%g7,	%l6,	%i4
	movneg	%icc,	%g3,	%l5
	fmovrslez	%l3,	%f18,	%f18
	set	0x08, %g5
	stda	%l0,	[%l7 + %g5] 0x15
	set	0x18, %i1
	prefetcha	[%l7 + %i1] 0x88,	 0x3
	bcc,a	%icc,	loop_763
	tne	%icc,	0x0
	xorcc	%o0,	%o7,	%g1
	tvc	%icc,	0x7
loop_763:
	fmovrslz	%g4,	%f10,	%f13
	tpos	%xcc,	0x7
	nop
	setx	loop_764,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movn	%xcc,	%l2,	%i3
	srl	%i5,	0x08,	%g6
	movvs	%xcc,	%i7,	%o2
loop_764:
	move	%icc,	%l4,	%i0
	movpos	%icc,	%o4,	%i2
	ldstub	[%l7 + 0x25],	%l1
	movleu	%icc,	%g5,	%o5
	fcmpgt32	%f4,	%f28,	%i1
	fpadd32	%f26,	%f24,	%f24
	st	%f6,	[%l7 + 0x7C]
	edge32	%o3,	%o6,	%o1
	srlx	%g2,	%g7,	%i4
	smulcc	%g3,	%l6,	%l5
	tsubcctv	%l3,	%l0,	%i6
	brgz,a	%o0,	loop_765
	orcc	%g1,	%g4,	%l2
	orcc	%o7,	0x110C,	%i5
	fpack32	%f26,	%f24,	%f8
loop_765:
	tneg	%xcc,	0x3
	sll	%i3,	%i7,	%g6
	sdiv	%o2,	0x14A9,	%l4
	array16	%i0,	%o4,	%l1
	nop
	setx	loop_766,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	bpos,a,pt	%xcc,	loop_767
	sth	%i2,	[%l7 + 0x7A]
	movneg	%icc,	%g5,	%i1
loop_766:
	mova	%icc,	%o3,	%o5
loop_767:
	alignaddr	%o1,	%o6,	%g7
	tsubcc	%i4,	%g2,	%l6
	movrlez	%l5,	%l3,	%l0
	sub	%i6,	%g3,	%g1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbo	%fcc0,	loop_768
	fmovspos	%icc,	%f18,	%f27
	fmovsg	%icc,	%f23,	%f3
	fmovde	%xcc,	%f18,	%f21
loop_768:
	srlx	%g4,	0x13,	%l2
	mulscc	%o0,	%o7,	%i5
	edge16n	%i3,	%i7,	%g6
	smulcc	%l4,	%i0,	%o4
	movn	%xcc,	%o2,	%i2
	movle	%icc,	%l1,	%g5
	xorcc	%i1,	%o5,	%o3
	movge	%xcc,	%o6,	%g7
	fpackfix	%f12,	%f28
	set	0x38, %g6
	sta	%f17,	[%l7 + %g6] 0x11
	set	0x7A, %l2
	stba	%o1,	[%l7 + %l2] 0x89
	lduh	[%l7 + 0x24],	%i4
	lduh	[%l7 + 0x64],	%g2
	movvc	%icc,	%l6,	%l5
	brlz	%l0,	loop_769
	ldsb	[%l7 + 0x26],	%i6
	movge	%icc,	%g3,	%l3
	fmul8ulx16	%f28,	%f8,	%f20
loop_769:
	fmovrsgez	%g1,	%f18,	%f7
	movre	%g4,	%o0,	%o7
	tsubcctv	%l2,	%i5,	%i7
	tsubcc	%g6,	0x15DE,	%i3
	and	%i0,	0x1B5C,	%o4
	subcc	%l4,	%o2,	%i2
	fmovdle	%xcc,	%f8,	%f13
	add	%g5,	%l1,	%i1
	fones	%f29
	movrlz	%o5,	%o6,	%g7
	movvc	%xcc,	%o1,	%i4
	udivcc	%g2,	0x16CB,	%l6
	sdivx	%l5,	0x041C,	%l0
	tn	%xcc,	0x1
	nop
	set	0x28, %g7
	stw	%o3,	[%l7 + %g7]
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movl	%xcc,	%i6,	%l3
	movpos	%xcc,	%g3,	%g4
	swap	[%l7 + 0x44],	%o0
	subc	%g1,	0x1FF4,	%o7
	edge32l	%l2,	%i5,	%g6
	smul	%i3,	0x0E12,	%i0
	fpsub32s	%f0,	%f0,	%f4
	edge32ln	%i7,	%l4,	%o2
	tvs	%xcc,	0x4
	be,a	loop_770
	movg	%xcc,	%i2,	%o4
	fmovscc	%xcc,	%f4,	%f29
	tcc	%icc,	0x1
loop_770:
	stbar
	fmovdn	%icc,	%f16,	%f20
	fmovs	%f8,	%f9
	sdivcc	%g5,	0x069D,	%l1
	edge32l	%i1,	%o5,	%g7
	wr	%g0,	0x04,	%asi
	swapa	[%l7 + 0x08] %asi,	%o1
	smul	%i4,	0x03CE,	%g2
	mulscc	%l6,	%l5,	%o6
	bn,a,pt	%xcc,	loop_771
	tg	%icc,	0x0
	sir	0x04A1
	udivcc	%o3,	0x0E29,	%l0
loop_771:
	fmovse	%icc,	%f4,	%f23
	fmovrdlez	%i6,	%f30,	%f12
	tge	%icc,	0x3
	fandnot1	%f2,	%f12,	%f30
	move	%xcc,	%g3,	%g4
	movrgz	%o0,	%g1,	%o7
	edge16	%l2,	%i5,	%l3
	fone	%f10
	movrgez	%g6,	%i0,	%i3
	sra	%i7,	0x0B,	%l4
	xnorcc	%i2,	%o4,	%o2
	edge8	%l1,	%g5,	%i1
	tvc	%xcc,	0x0
	bl,a,pt	%xcc,	loop_772
	fbule	%fcc3,	loop_773
	membar	0x2E
	edge8n	%o5,	%g7,	%i4
loop_772:
	fbul	%fcc3,	loop_774
loop_773:
	edge16n	%o1,	%l6,	%g2
	flush	%l7 + 0x5C
	orcc	%l5,	%o6,	%l0
loop_774:
	sra	%o3,	0x17,	%g3
	flush	%l7 + 0x34
	edge16ln	%i6,	%g4,	%o0
	add	%l7,	0x5C,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%g1
	casa	[%l6] %asi,	%g1,	%l2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bneg	loop_775
	fbne	%fcc1,	loop_776
	ldsb	[%l7 + 0x67],	%i5
	fnot1	%f8,	%f4
loop_775:
	fmul8x16al	%f23,	%f28,	%f16
loop_776:
	fmovd	%f30,	%f20
	bcc	%xcc,	loop_777
	udivcc	%o7,	0x1B8C,	%l3
	fmovsg	%icc,	%f19,	%f14
	fones	%f28
loop_777:
	brnz,a	%g6,	loop_778
	tvs	%icc,	0x7
	array16	%i0,	%i7,	%i3
	movn	%icc,	%l4,	%o4
loop_778:
	sdivcc	%o2,	0x1203,	%i2
	edge32l	%l1,	%i1,	%g5
	bneg,pn	%icc,	loop_779
	smulcc	%o5,	0x0052,	%g7
	add	%o1,	0x1D64,	%i4
	mova	%xcc,	%g2,	%l5
loop_779:
	addc	%o6,	0x020D,	%l0
	fpsub16	%f0,	%f10,	%f26
	andn	%o3,	0x0ACA,	%g3
	alignaddrl	%i6,	%g4,	%l6
	set	0x58, %g2
	ldxa	[%l7 + %g2] 0x88,	%g1
	fpadd32s	%f13,	%f22,	%f29
	alignaddrl	%l2,	%i5,	%o7
	sdivcc	%o0,	0x16F1,	%l3
	tl	%xcc,	0x1
	umul	%i0,	%g6,	%i3
	smulcc	%i7,	%l4,	%o4
	set	0x44, %i0
	ldsha	[%l7 + %i0] 0x10,	%i2
	fornot2	%f10,	%f14,	%f30
	ba,a	loop_780
	andcc	%l1,	%i1,	%g5
	fmovsne	%xcc,	%f3,	%f4
	fcmped	%fcc1,	%f20,	%f24
loop_780:
	st	%f2,	[%l7 + 0x3C]
	movn	%icc,	%o5,	%o2
	edge16n	%o1,	%g7,	%i4
	fbl	%fcc1,	loop_781
	fxor	%f26,	%f26,	%f18
	sllx	%l5,	0x13,	%o6
	movne	%icc,	%l0,	%g2
loop_781:
	nop
	wr	%g0,	0x89,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	tl	%xcc,	0x1
	tge	%icc,	0x5
	flush	%l7 + 0x6C
	tvc	%xcc,	0x0
	fcmpeq32	%f12,	%f24,	%g3
	fxnor	%f30,	%f10,	%f28
	fpadd32	%f16,	%f30,	%f30
	array16	%o3,	%i6,	%l6
	tl	%icc,	0x7
	fmul8ulx16	%f26,	%f10,	%f16
	xnorcc	%g4,	%l2,	%g1
	bcc,a,pn	%icc,	loop_782
	tn	%icc,	0x0
	tcc	%xcc,	0x7
	umul	%o7,	%i5,	%l3
loop_782:
	movpos	%icc,	%o0,	%g6
	set	0x38, %l1
	stha	%i0,	[%l7 + %l1] 0x81
	faligndata	%f8,	%f6,	%f8
	edge16l	%i3,	%i7,	%l4
	movcc	%icc,	%o4,	%i2
	tleu	%xcc,	0x3
	movg	%icc,	%i1,	%l1
	edge32ln	%g5,	%o5,	%o2
	orncc	%g7,	0x05EE,	%i4
	sra	%l5,	0x12,	%o1
	fmovscs	%icc,	%f20,	%f2
	fmovrde	%l0,	%f10,	%f26
	fmovsvc	%xcc,	%f29,	%f7
	fnot1	%f24,	%f26
	fcmped	%fcc3,	%f22,	%f0
	movrgez	%g2,	0x3D4,	%o6
	xnorcc	%o3,	%g3,	%i6
	xnor	%g4,	0x04C5,	%l6
	fmovrslez	%g1,	%f18,	%f18
	nop
	set	0x18, %l3
	ldd	[%l7 + %l3],	%f30
	tne	%xcc,	0x0
	srax	%l2,	0x09,	%o7
	orncc	%l3,	%o0,	%g6
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x36] %asi,	%i0
	fmovsle	%icc,	%f20,	%f24
	fands	%f6,	%f9,	%f29
	edge16l	%i3,	%i5,	%l4
	stb	%o4,	[%l7 + 0x7B]
	tpos	%icc,	0x5
	edge32	%i7,	%i1,	%i2
	move	%icc,	%l1,	%g5
	fblg,a	%fcc0,	loop_783
	orn	%o5,	%o2,	%i4
	umul	%g7,	0x0FA9,	%l5
	subcc	%l0,	0x05A9,	%g2
loop_783:
	nop
	add	%l7,	0x38,	%l6
	wr	%g0,	0x19,	%asi
	ldxa	[%l6] %asi,	%o1
	casxa	[%l6] 0x19,	%o1,	%o6
	addc	%g3,	0x0B33,	%o3
	ldd	[%l7 + 0x68],	%i6
	pdist	%f10,	%f10,	%f8
	sth	%l6,	[%l7 + 0x34]
	sth	%g1,	[%l7 + 0x36]
	sub	%g4,	0x0904,	%o7
	movne	%xcc,	%l2,	%o0
	addcc	%l3,	%i0,	%g6
	xorcc	%i5,	0x1A27,	%i3
	orncc	%o4,	%l4,	%i1
	fnands	%f28,	%f28,	%f25
	fcmpes	%fcc0,	%f29,	%f26
	brz,a	%i7,	loop_784
	fandnot1	%f6,	%f0,	%f10
	sll	%l1,	%g5,	%i2
	fpsub32s	%f11,	%f17,	%f23
loop_784:
	smulcc	%o5,	%i4,	%g7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ta	%icc,	0x3
	udivx	%o2,	0x0936,	%l0
	movvs	%xcc,	%l5,	%o1
	srlx	%o6,	0x0E,	%g3
	fornot2s	%f4,	%f30,	%f31
	fnors	%f8,	%f14,	%f29
	alignaddr	%o3,	%g2,	%i6
	stbar
	smul	%g1,	0x02A2,	%l6
	fbul	%fcc0,	loop_785
	ldub	[%l7 + 0x10],	%g4
	move	%xcc,	%o7,	%l2
	movgu	%icc,	%o0,	%l3
loop_785:
	mova	%icc,	%i0,	%i5
	fmovsge	%xcc,	%f19,	%f2
	xorcc	%g6,	%o4,	%i3
	tcs	%icc,	0x5
	mova	%icc,	%l4,	%i7
	brlez,a	%i1,	loop_786
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
	brgz	%g5,	loop_788
	brz,a	%l1,	loop_789
loop_786:
	call	loop_790
loop_787:
	edge8ln	%o5,	%i2,	%g7
loop_788:
	orn	%o2,	%l0,	%i4
loop_789:
	movne	%xcc,	%o1,	%l5
loop_790:
	smulcc	%o6,	0x13FA,	%g3
	bcc,a	loop_791
	xnor	%o3,	%i6,	%g2
	st	%f13,	[%l7 + 0x0C]
	nop
	set	0x70, %o3
	lduw	[%l7 + %o3],	%g1
loop_791:
	fmovdcc	%xcc,	%f13,	%f10
	brlez	%g4,	loop_792
	swap	[%l7 + 0x34],	%l6
	fble,a	%fcc2,	loop_793
	fmul8sux16	%f10,	%f4,	%f2
loop_792:
	fsrc1s	%f31,	%f10
	fbo	%fcc2,	loop_794
loop_793:
	fba,a	%fcc0,	loop_795
	edge8	%o7,	%l2,	%l3
	edge8n	%o0,	%i5,	%g6
loop_794:
	fpadd16	%f12,	%f4,	%f14
loop_795:
	array32	%i0,	%o4,	%l4
	add	%l7,	0x38,	%l6
	wr	%g0,	0x18,	%asi
	lda	[%l6] %asi,	%i3
	casa	[%l6] %asi,	%i3,	%i1
	nop
	setx	loop_796,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movvc	%xcc,	%i7,	%g5
	edge32n	%o5,	%l1,	%g7
	fexpand	%f19,	%f4
loop_796:
	taddcc	%i2,	0x0E7F,	%l0
	tn	%icc,	0x5
	tleu	%icc,	0x1
	stbar
	sethi	0x111E,	%o2
	fpsub16s	%f25,	%f5,	%f15
	edge8ln	%o1,	%i4,	%l5
	add	%o6,	%g3,	%o3
	bneg,a,pn	%xcc,	loop_797
	smulcc	%g2,	%g1,	%g4
	fpack32	%f2,	%f10,	%f16
	movne	%icc,	%l6,	%i6
loop_797:
	movrlz	%o7,	0x1BD,	%l2
	add	%l7,	0x0C,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%l3
	casa	[%l6] %asi,	%l3,	%i5
	edge16l	%g6,	%o0,	%i0
	ldstub	[%l7 + 0x20],	%l4
	set	0x42, %o1
	ldsba	[%l7 + %o1] 0x10,	%i3
	fsrc1	%f12,	%f6
	edge32ln	%i1,	%i7,	%o4
	ldsb	[%l7 + 0x60],	%o5
	movl	%icc,	%g5,	%g7
	andcc	%l1,	%l0,	%o2
	umul	%i2,	%o1,	%i4
	fmovrde	%l5,	%f28,	%f20
	and	%o6,	%o3,	%g3
	fexpand	%f28,	%f26
	orn	%g2,	0x15E7,	%g1
	prefetch	[%l7 + 0x70],	 0x0
	andn	%g4,	%l6,	%o7
	fmovdn	%icc,	%f16,	%f27
	ldx	[%l7 + 0x60],	%i6
	xnorcc	%l2,	0x07FA,	%l3
	nop
	setx loop_798, %l0, %l1
	jmpl %l1, %g6
	tvc	%xcc,	0x2
	xnor	%i5,	%i0,	%l4
	alignaddrl	%o0,	%i3,	%i1
loop_798:
	orncc	%i7,	0x04D8,	%o4
	movge	%icc,	%g5,	%o5
	wr	%g0,	0x88,	%asi
	lduwa	[%l7 + 0x7C] %asi,	%g7
	movrgz	%l1,	0x1F2,	%l0
	fexpand	%f3,	%f0
	bgu,a,pn	%xcc,	loop_799
	sub	%i2,	%o2,	%o1
	tn	%icc,	0x0
	set	0x72, %g4
	lduha	[%l7 + %g4] 0x11,	%i4
loop_799:
	or	%o6,	0x12CF,	%l5
	fbl,a	%fcc3,	loop_800
	tvc	%xcc,	0x2
	sllx	%o3,	%g2,	%g3
	bl,pn	%xcc,	loop_801
loop_800:
	fbge	%fcc3,	loop_802
	fble,a	%fcc1,	loop_803
	brlz,a	%g4,	loop_804
loop_801:
	fmovdneg	%xcc,	%f18,	%f10
loop_802:
	orncc	%g1,	%o7,	%l6
loop_803:
	nop
	setx	loop_805,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_804:
	orn	%i6,	0x139D,	%l3
	fbg	%fcc3,	loop_806
	bg,a	loop_807
loop_805:
	sir	0x0DAF
	set	0x48, %g3
	ldswa	[%l7 + %g3] 0x0c,	%l2
loop_806:
	andcc	%i5,	0x0122,	%g6
loop_807:
	subcc	%l4,	0x0950,	%o0
	tcs	%xcc,	0x1
	movgu	%icc,	%i0,	%i1
	movrgz	%i3,	%i7,	%g5
	fmovsleu	%xcc,	%f21,	%f3
	brlez	%o4,	loop_808
	xorcc	%o5,	0x0F22,	%l1
	fone	%f16
	mulx	%g7,	0x0E90,	%l0
loop_808:
	tg	%xcc,	0x2
	te	%xcc,	0x1
	tsubcc	%i2,	%o1,	%i4
	movgu	%icc,	%o6,	%l5
	move	%icc,	%o2,	%g2
	tcc	%icc,	0x6
	sub	%o3,	0x1BFF,	%g3
	movpos	%xcc,	%g1,	%g4
	bn,pt	%icc,	loop_809
	movrlez	%o7,	%l6,	%i6
	ldd	[%l7 + 0x20],	%l2
	movne	%xcc,	%i5,	%l3
loop_809:
	fmovsgu	%xcc,	%f0,	%f23
	fmovdneg	%icc,	%f14,	%f16
	movrlz	%g6,	0x3C7,	%o0
	edge32n	%i0,	%l4,	%i1
	fcmpeq16	%f26,	%f12,	%i7
	fmul8x16	%f2,	%f12,	%f26
	taddcc	%i3,	0x1E9F,	%g5
	srax	%o5,	0x04,	%l1
	taddcc	%g7,	0x0A35,	%l0
	movneg	%icc,	%o4,	%i2
	xnor	%o1,	%o6,	%i4
	std	%l4,	[%l7 + 0x58]
	tpos	%xcc,	0x0
	fcmped	%fcc2,	%f28,	%f6
	tle	%xcc,	0x7
	fnot1	%f24,	%f12
	fornot2s	%f3,	%f19,	%f18
	sir	0x0D17
	tle	%xcc,	0x6
	fbo,a	%fcc0,	loop_810
	tcc	%xcc,	0x3
	bcs,a	%xcc,	loop_811
	bcs,a,pn	%xcc,	loop_812
loop_810:
	ld	[%l7 + 0x30],	%f20
	addc	%o2,	0x0DC9,	%o3
loop_811:
	and	%g2,	%g3,	%g1
loop_812:
	or	%g4,	0x091C,	%o7
	umul	%i6,	%l6,	%l2
	udivcc	%i5,	0x1E88,	%g6
	edge8n	%l3,	%o0,	%i0
	fmovda	%icc,	%f22,	%f24
	tsubcctv	%l4,	0x056F,	%i7
	fmovrdne	%i3,	%f0,	%f10
	fzeros	%f15
	fmovdge	%xcc,	%f10,	%f14
	addccc	%i1,	0x1CAD,	%o5
	bl,a,pn	%xcc,	loop_813
	fmovse	%xcc,	%f2,	%f20
	tl	%xcc,	0x7
	sra	%g5,	%l1,	%l0
loop_813:
	fmovdl	%xcc,	%f23,	%f0
	taddcc	%o4,	%i2,	%o1
	taddcc	%g7,	0x01CE,	%o6
	wr	%g0,	0x0c,	%asi
	ldstuba	[%l7 + 0x30] %asi,	%i4
	fmovsa	%icc,	%f21,	%f14
	brgez,a	%o2,	loop_814
	edge8	%l5,	%g2,	%g3
	movrlez	%g1,	0x3DF,	%g4
	ld	[%l7 + 0x50],	%f28
loop_814:
	fbue,a	%fcc2,	loop_815
	fmovdpos	%xcc,	%f21,	%f16
	bl,a,pt	%icc,	loop_816
	edge16ln	%o3,	%o7,	%i6
loop_815:
	fornot2s	%f22,	%f26,	%f6
	ld	[%l7 + 0x64],	%f24
loop_816:
	fcmple32	%f28,	%f18,	%l6
	udivx	%l2,	0x1CC0,	%i5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8n	%g6,	%l3,	%i0
	stb	%l4,	[%l7 + 0x61]
	fmovdvc	%icc,	%f27,	%f9
	andn	%o0,	0x0752,	%i7
	tvs	%xcc,	0x2
	movge	%icc,	%i1,	%i3
	bl,a	loop_817
	fabss	%f3,	%f21
	bvc	%xcc,	loop_818
	sll	%o5,	0x1B,	%l1
loop_817:
	bvc,a	loop_819
	andncc	%l0,	%o4,	%g5
loop_818:
	sra	%i2,	%g7,	%o1
	orcc	%o6,	0x16B2,	%o2
loop_819:
	andn	%i4,	%g2,	%l5
	fmul8x16	%f23,	%f6,	%f0
	fmovrse	%g3,	%f12,	%f19
	set	0x0D, %g1
	lduba	[%l7 + %g1] 0x11,	%g1
	umulcc	%g4,	0x046B,	%o7
	xorcc	%i6,	%l6,	%l2
	fmovscc	%icc,	%f11,	%f14
	fble	%fcc0,	loop_820
	movl	%icc,	%i5,	%g6
	srax	%o3,	0x0F,	%i0
	or	%l4,	%l3,	%o0
loop_820:
	edge32l	%i7,	%i3,	%i1
	movrlz	%l1,	0x392,	%l0
	orcc	%o4,	%o5,	%i2
	edge32l	%g5,	%g7,	%o6
	or	%o2,	0x090F,	%i4
	array32	%g2,	%o1,	%g3
	ta	%icc,	0x5
	bgu	%xcc,	loop_821
	tsubcctv	%l5,	0x027D,	%g1
	edge16ln	%g4,	%o7,	%i6
	xnor	%l2,	%i5,	%l6
loop_821:
	mova	%xcc,	%g6,	%o3
	ldx	[%l7 + 0x30],	%i0
	fmovrse	%l4,	%f29,	%f8
	fbuge	%fcc2,	loop_822
	movge	%xcc,	%o0,	%i7
	srax	%l3,	0x1A,	%i3
	fmovse	%icc,	%f24,	%f13
loop_822:
	tvs	%icc,	0x0
	fbge,a	%fcc3,	loop_823
	sdiv	%i1,	0x03D2,	%l1
	orncc	%o4,	0x04CD,	%l0
	tn	%xcc,	0x0
loop_823:
	ble	%icc,	loop_824
	fmovspos	%xcc,	%f5,	%f5
	tleu	%icc,	0x4
	tn	%xcc,	0x4
loop_824:
	stw	%i2,	[%l7 + 0x30]
	fcmpne32	%f0,	%f24,	%g5
	udiv	%g7,	0x1C1D,	%o6
	sdiv	%o5,	0x1936,	%o2
	orncc	%i4,	%g2,	%g3
	smulcc	%l5,	%o1,	%g1
	fpsub32s	%f6,	%f19,	%f11
	set	0x34, %o6
	lduwa	[%l7 + %o6] 0x80,	%g4
	movrne	%i6,	%o7,	%i5
	stw	%l2,	[%l7 + 0x44]
	movrlez	%g6,	0x0C3,	%l6
	fpack16	%f30,	%f24
	fmul8sux16	%f24,	%f0,	%f22
	fmovsgu	%icc,	%f2,	%f5
	ldstub	[%l7 + 0x11],	%o3
	tle	%icc,	0x5
	fpmerge	%f16,	%f9,	%f8
	smulcc	%l4,	0x0158,	%o0
	edge8	%i0,	%i7,	%l3
	andn	%i3,	0x0F1E,	%i1
	movcs	%icc,	%l1,	%l0
	movleu	%icc,	%o4,	%g5
	fsrc1s	%f2,	%f4
	ldub	[%l7 + 0x23],	%g7
	tvs	%icc,	0x6
	fxnors	%f24,	%f11,	%f25
	movge	%icc,	%i2,	%o5
	stw	%o6,	[%l7 + 0x68]
	ldd	[%l7 + 0x48],	%f26
	movg	%icc,	%i4,	%o2
	edge16n	%g3,	%l5,	%o1
	tg	%xcc,	0x3
	orn	%g1,	%g2,	%g4
	brnz	%i6,	loop_825
	fmovrsgz	%o7,	%f2,	%f14
	orcc	%i5,	%g6,	%l6
	movneg	%xcc,	%l2,	%o3
loop_825:
	add	%l4,	0x1616,	%i0
	set	0x18, %o7
	swapa	[%l7 + %o7] 0x89,	%o0
	wr	%g0,	0x04,	%asi
	sta	%f26,	[%l7 + 0x6C] %asi
	edge32n	%l3,	%i3,	%i7
	move	%icc,	%l1,	%l0
	tne	%icc,	0x3
	bg	loop_826
	movne	%icc,	%i1,	%o4
	lduh	[%l7 + 0x12],	%g5
	fmovrdlez	%g7,	%f4,	%f20
loop_826:
	fpsub32s	%f7,	%f12,	%f7
	wr	%g0,	0x80,	%asi
	ldsba	[%l7 + 0x4B] %asi,	%o5
	fpadd16s	%f8,	%f18,	%f26
	stx	%i2,	[%l7 + 0x48]
	movrgz	%o6,	%o2,	%g3
	tge	%xcc,	0x5
	tcs	%xcc,	0x5
	orcc	%l5,	%i4,	%g1
	edge32ln	%o1,	%g4,	%g2
	mova	%icc,	%o7,	%i5
	movle	%icc,	%g6,	%i6
	lduw	[%l7 + 0x18],	%l6
	movg	%icc,	%o3,	%l4
	edge16n	%l2,	%i0,	%l3
	ba,pt	%xcc,	loop_827
	srl	%o0,	0x1C,	%i7
	fbl,a	%fcc0,	loop_828
	fbn,a	%fcc0,	loop_829
loop_827:
	tgu	%xcc,	0x4
	movpos	%xcc,	%i3,	%l1
loop_828:
	fble,a	%fcc1,	loop_830
loop_829:
	fbg	%fcc0,	loop_831
	sdivx	%l0,	0x0EC6,	%i1
	movleu	%icc,	%g5,	%o4
loop_830:
	xnorcc	%g7,	0x0331,	%i2
loop_831:
	fmovsneg	%icc,	%f6,	%f26
	fbule	%fcc0,	loop_832
	sllx	%o5,	0x14,	%o6
	edge8	%g3,	%l5,	%o2
	fmul8ulx16	%f30,	%f18,	%f26
loop_832:
	sdivx	%i4,	0x0463,	%o1
	ldub	[%l7 + 0x70],	%g1
	udivx	%g4,	0x0F3D,	%o7
	tgu	%icc,	0x5
	smulcc	%g2,	%g6,	%i5
	srlx	%i6,	%o3,	%l4
	bleu,a,pn	%icc,	loop_833
	sethi	0x16DC,	%l6
	fexpand	%f10,	%f22
	movleu	%icc,	%i0,	%l3
loop_833:
	udivx	%l2,	0x12D7,	%o0
	fmovse	%icc,	%f8,	%f5
	fbu	%fcc1,	loop_834
	fxors	%f2,	%f19,	%f3
	mulscc	%i7,	0x10E8,	%i3
	edge8n	%l1,	%l0,	%i1
loop_834:
	stx	%g5,	[%l7 + 0x20]
	fcmps	%fcc2,	%f12,	%f18
	nop
	set	0x18, %o2
	stx	%o4,	[%l7 + %o2]
	umul	%g7,	0x0A28,	%o5
	lduh	[%l7 + 0x48],	%i2
	tn	%xcc,	0x2
	fblg	%fcc1,	loop_835
	fbg,a	%fcc3,	loop_836
	tleu	%icc,	0x5
	fornot2	%f4,	%f8,	%f8
loop_835:
	brz	%g3,	loop_837
loop_836:
	fand	%f22,	%f12,	%f14
	be,pt	%xcc,	loop_838
	flush	%l7 + 0x14
loop_837:
	movpos	%xcc,	%l5,	%o2
	fpsub16s	%f22,	%f23,	%f7
loop_838:
	movcc	%xcc,	%o6,	%i4
	fmovsg	%icc,	%f15,	%f21
	xnorcc	%g1,	0x1BD5,	%g4
	brgez,a	%o1,	loop_839
	udivx	%o7,	0x00F7,	%g6
	orn	%i5,	%g2,	%i6
	edge8l	%o3,	%l4,	%i0
loop_839:
	bg	%icc,	loop_840
	sdivx	%l6,	0x1EC8,	%l2
	movrlez	%l3,	0x296,	%o0
	fandnot2	%f2,	%f30,	%f26
loop_840:
	alignaddr	%i7,	%i3,	%l1
	tl	%xcc,	0x7
	orn	%i1,	0x0F12,	%g5
	fbo,a	%fcc2,	loop_841
	or	%o4,	0x1954,	%g7
	movg	%xcc,	%o5,	%i2
	fornot2s	%f2,	%f12,	%f2
loop_841:
	orncc	%l0,	%g3,	%o2
	fcmpgt16	%f28,	%f30,	%o6
	movle	%xcc,	%l5,	%g1
	ba	loop_842
	fmovrdlz	%i4,	%f18,	%f30
	xnorcc	%o1,	%o7,	%g4
	fnot1s	%f13,	%f6
loop_842:
	fmovda	%xcc,	%f9,	%f19
	fbue	%fcc1,	loop_843
	mulscc	%g6,	%g2,	%i6
	fcmple32	%f6,	%f16,	%i5
	edge16l	%l4,	%i0,	%o3
loop_843:
	fbule	%fcc1,	loop_844
	lduh	[%l7 + 0x6C],	%l2
	membar	0x66
	umulcc	%l6,	0x033B,	%o0
loop_844:
	fmovdleu	%xcc,	%f23,	%f6
	fcmpne32	%f26,	%f28,	%l3
	udivcc	%i3,	0x0E14,	%i7
	movge	%icc,	%i1,	%l1
	tvs	%xcc,	0x3
	brlz	%o4,	loop_845
	udivcc	%g7,	0x1A0D,	%o5
	smul	%g5,	%i2,	%l0
	tne	%icc,	0x1
loop_845:
	sra	%g3,	0x02,	%o6
	bshuffle	%f16,	%f12,	%f12
	addc	%o2,	%g1,	%i4
	sra	%l5,	%o7,	%o1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bl	loop_846
	fmul8x16au	%f24,	%f8,	%f8
	movn	%xcc,	%g6,	%g2
	sdiv	%g4,	0x0B31,	%i5
loop_846:
	fands	%f25,	%f29,	%f5
	tn	%xcc,	0x6
	srlx	%l4,	%i0,	%o3
	sdivcc	%i6,	0x0724,	%l2
	set	0x4B, %l0
	ldsba	[%l7 + %l0] 0x04,	%o0
	tsubcc	%l3,	%i3,	%l6
	fbug,a	%fcc3,	loop_847
	orncc	%i1,	0x0402,	%l1
	lduw	[%l7 + 0x68],	%i7
	sll	%g7,	0x0F,	%o4
loop_847:
	edge8l	%g5,	%i2,	%l0
	sir	0x157B
	smul	%o5,	%g3,	%o6
	fcmpgt16	%f20,	%f22,	%o2
	move	%icc,	%i4,	%l5
	tgu	%icc,	0x4
	movrgez	%o7,	%g1,	%g6
	movg	%icc,	%o1,	%g4
	andcc	%g2,	0x1008,	%l4
	sllx	%i0,	0x17,	%i5
	wr	%g0,	0x88,	%asi
	stha	%i6,	[%l7 + 0x16] %asi
	bcs,a	%xcc,	loop_848
	taddcctv	%l2,	0x19F4,	%o3
	fxnor	%f24,	%f28,	%f30
	ldub	[%l7 + 0x7C],	%l3
loop_848:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movge	%icc,	%o0,	%i3
	stw	%l6,	[%l7 + 0x0C]
	fandnot2s	%f26,	%f17,	%f21
	smulcc	%l1,	%i7,	%g7
	movrne	%i1,	%g5,	%o4
	movn	%xcc,	%i2,	%l0
	fzero	%f10
	bvs,pn	%xcc,	loop_849
	fmul8x16al	%f15,	%f23,	%f20
	set	0x0C, %i6
	lduwa	[%l7 + %i6] 0x89,	%o5
loop_849:
	movpos	%xcc,	%g3,	%o2
	subccc	%i4,	%o6,	%o7
	fpadd32s	%f22,	%f15,	%f19
	move	%xcc,	%l5,	%g1
	membar	0x6C
	addc	%o1,	0x1328,	%g6
	edge8n	%g4,	%l4,	%g2
	nop
	set	0x25, %l4
	ldstub	[%l7 + %l4],	%i5
	fmovdne	%xcc,	%f11,	%f7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bneg,pn	%xcc,	loop_850
	edge8l	%i0,	%l2,	%i6
	tpos	%icc,	0x5
	movvs	%xcc,	%o3,	%o0
loop_850:
	sllx	%i3,	%l6,	%l3
	fbul,a	%fcc3,	loop_851
	orcc	%l1,	0x0AF5,	%i7
	udiv	%i1,	0x10F9,	%g5
	edge32n	%g7,	%i2,	%l0
loop_851:
	fcmpgt16	%f4,	%f12,	%o4
	set	0x70, %i7
	stxa	%g3,	[%l7 + %i7] 0x89
	fmovdl	%icc,	%f18,	%f2
	fblg,a	%fcc3,	loop_852
	andn	%o2,	%i4,	%o5
	xorcc	%o7,	0x1178,	%l5
	ldub	[%l7 + 0x72],	%o6
loop_852:
	nop
	set	0x48, %o0
	stha	%o1,	[%l7 + %o0] 0x27
	membar	#Sync
	movrlez	%g1,	%g4,	%g6
	fpack16	%f4,	%f28
	bneg,a,pn	%icc,	loop_853
	nop
	setx	loop_854,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fbg,a	%fcc3,	loop_855
	taddcctv	%l4,	0x172D,	%i5
loop_853:
	nop
	set	0x40, %i3
	stda	%f16,	[%l7 + %i3] 0x15
loop_854:
	sth	%g2,	[%l7 + 0x4E]
loop_855:
	bl	%icc,	loop_856
	orn	%i0,	0x1484,	%l2
	tle	%xcc,	0x2
	edge8	%o3,	%o0,	%i3
loop_856:
	fmovdle	%xcc,	%f26,	%f18
	fbe,a	%fcc0,	loop_857
	array32	%i6,	%l6,	%l3
	prefetch	[%l7 + 0x64],	 0x3
	tneg	%icc,	0x2
loop_857:
	fbul,a	%fcc3,	loop_858
	fcmpeq32	%f14,	%f2,	%l1
	edge16	%i1,	%i7,	%g5
	sdivx	%g7,	0x19AA,	%l0
loop_858:
	fnot2	%f4,	%f10
	wr	%g0,	0x89,	%asi
	stba	%o4,	[%l7 + 0x49] %asi
	nop
	set	0x10, %o4
	ldx	[%l7 + %o4],	%g3
	andn	%i2,	%i4,	%o2
	fand	%f24,	%f10,	%f4
	brlez,a	%o5,	loop_859
	udivcc	%o7,	0x08C0,	%l5
	sdivcc	%o1,	0x12A6,	%o6
	tvs	%xcc,	0x1
loop_859:
	udivx	%g4,	0x0F94,	%g1
	movle	%xcc,	%g6,	%l4
	taddcc	%i5,	0x0EBE,	%g2
	fbu	%fcc3,	loop_860
	xnorcc	%l2,	0x0160,	%i0
	membar	0x64
	edge16	%o3,	%i3,	%o0
loop_860:
	bcc,a,pn	%icc,	loop_861
	fones	%f17
	ldsw	[%l7 + 0x64],	%l6
	set	0x20, %l6
	stxa	%l3,	[%l7 + %l6] 0x0c
loop_861:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fandnot2	%f16,	%f2,	%f0
	sll	%i6,	%l1,	%i7
	fpackfix	%f0,	%f12
	wr	%g0,	0x27,	%asi
	stxa	%g5,	[%l7 + 0x20] %asi
	membar	#Sync
	popc	0x1A06,	%g7
	fornot2	%f2,	%f0,	%f16
	add	%l7,	0x24,	%l6
	wr	%g0,	0x04,	%asi
	casa	[%l6] 0x04,	%l0,	%o4
	ble	%icc,	loop_862
	tcc	%icc,	0x1
	andncc	%i1,	%i2,	%g3
	set	0x4A, %i4
	ldsba	[%l7 + %i4] 0x80,	%i4
loop_862:
	bgu,a,pt	%xcc,	loop_863
	fcmpeq16	%f26,	%f12,	%o2
	fcmps	%fcc1,	%f17,	%f1
	ldsw	[%l7 + 0x50],	%o7
loop_863:
	array16	%o5,	%o1,	%l5
	swap	[%l7 + 0x70],	%o6
	tle	%xcc,	0x1
	fbn	%fcc1,	loop_864
	tge	%icc,	0x6
	fbo,a	%fcc1,	loop_865
	ldd	[%l7 + 0x10],	%g0
loop_864:
	mulx	%g4,	0x1EDE,	%l4
	ta	%xcc,	0x1
loop_865:
	movcc	%icc,	%i5,	%g2
	smulcc	%l2,	0x00E0,	%i0
	set	0x40, %i5
	ldda	[%l7 + %i5] 0x80,	%f16
	subc	%o3,	0x14F9,	%i3
	bgu,pn	%icc,	loop_866
	ldsw	[%l7 + 0x48],	%g6
	umul	%l6,	0x04EB,	%o0
	fmovsleu	%icc,	%f25,	%f7
loop_866:
	tne	%icc,	0x1
	movcc	%icc,	%l3,	%i6
	std	%f18,	[%l7 + 0x60]
	tgu	%xcc,	0x6
	fnot1s	%f27,	%f11
	fbn,a	%fcc2,	loop_867
	fornot2s	%f28,	%f30,	%f3
	fnegd	%f16,	%f22
	fmovdpos	%xcc,	%f14,	%f30
loop_867:
	srax	%l1,	0x19,	%i7
	fmovse	%icc,	%f12,	%f1
	fnot1s	%f24,	%f13
	tge	%xcc,	0x7
	swap	[%l7 + 0x6C],	%g7
	fandnot1s	%f26,	%f18,	%f29
	brlz	%l0,	loop_868
	ld	[%l7 + 0x7C],	%f3
	fpadd32	%f22,	%f0,	%f14
	tg	%xcc,	0x6
loop_868:
	sethi	0x1B12,	%o4
	tge	%xcc,	0x4
	tvs	%icc,	0x0
	movvc	%xcc,	%g5,	%i1
	fnegs	%f26,	%f23
	fnegs	%f21,	%f11
	fbl,a	%fcc3,	loop_869
	bcc,a	%icc,	loop_870
	andcc	%i2,	%g3,	%i4
	fpmerge	%f22,	%f11,	%f4
loop_869:
	srl	%o2,	0x16,	%o5
loop_870:
	fand	%f28,	%f20,	%f30
	wr	%g0,	0x88,	%asi
	stwa	%o1,	[%l7 + 0x78] %asi
	fmovdgu	%icc,	%f0,	%f28
	lduw	[%l7 + 0x48],	%o7
	fmovrdlz	%l5,	%f26,	%f26
	tleu	%icc,	0x4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdcs	%icc,	%f4,	%f28
	movvc	%xcc,	%g1,	%g4
	tgu	%icc,	0x2
	tne	%icc,	0x4
	call	loop_871
	bpos,a,pt	%icc,	loop_872
	movle	%xcc,	%o6,	%l4
	and	%g2,	%l2,	%i0
loop_871:
	nop
	wr	%g0,	0x0c,	%asi
	ldxa	[%l7 + 0x30] %asi,	%o3
loop_872:
	add	%i3,	0x00DC,	%i5
	tne	%xcc,	0x0
	brgez	%l6,	loop_873
	brnz	%g6,	loop_874
	srax	%l3,	0x02,	%i6
	movrgez	%o0,	0x31E,	%l1
loop_873:
	movcs	%xcc,	%i7,	%l0
loop_874:
	fble,a	%fcc3,	loop_875
	mulx	%g7,	0x0692,	%g5
	movpos	%icc,	%i1,	%i2
	subc	%o4,	0x0D45,	%g3
loop_875:
	movle	%xcc,	%i4,	%o5
	srax	%o1,	%o2,	%o7
	movrne	%g1,	%g4,	%l5
	tle	%xcc,	0x1
	fcmpgt16	%f2,	%f8,	%o6
	fmovrsgez	%g2,	%f30,	%f16
	movrne	%l4,	%l2,	%i0
	fcmpes	%fcc0,	%f8,	%f25
	fbe,a	%fcc0,	loop_876
	ldsw	[%l7 + 0x54],	%i3
	brlz,a	%o3,	loop_877
	fbge,a	%fcc3,	loop_878
loop_876:
	xnorcc	%l6,	%g6,	%l3
	add	%i6,	%i5,	%l1
loop_877:
	xnor	%o0,	0x078D,	%l0
loop_878:
	sdivx	%i7,	0x0669,	%g5
	te	%icc,	0x7
	tn	%icc,	0x2
	array32	%g7,	%i1,	%o4
	fcmpeq32	%f20,	%f12,	%i2
	sll	%g3,	%i4,	%o1
	tsubcc	%o5,	0x1DD6,	%o2
	bge	%xcc,	loop_879
	orn	%o7,	0x1AFE,	%g1
	edge8n	%g4,	%o6,	%l5
	bvs,pn	%icc,	loop_880
loop_879:
	mulscc	%g2,	0x0C64,	%l2
	andncc	%l4,	%i0,	%o3
	tvc	%xcc,	0x3
loop_880:
	tgu	%icc,	0x2
	edge8n	%i3,	%l6,	%g6
	tsubcc	%i6,	0x0423,	%i5
	add	%l7,	0x58,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] %asi,	%l1,	%l3
	tleu	%icc,	0x6
	fmovdleu	%icc,	%f7,	%f7
	popc	0x0BAF,	%l0
	fpsub16	%f2,	%f26,	%f10
	smulcc	%o0,	%i7,	%g5
	fmovd	%f20,	%f14
	edge32	%i1,	%g7,	%i2
	movpos	%xcc,	%g3,	%o4
	stb	%o1,	[%l7 + 0x25]
	tpos	%xcc,	0x1
	fxnors	%f4,	%f0,	%f13
	tleu	%xcc,	0x2
	sdiv	%o5,	0x0711,	%i4
	add	%l7,	0x0C,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%o7
	casa	[%l6] 0x80,	%o7,	%o2
	movn	%icc,	%g1,	%g4
	addccc	%o6,	%l5,	%g2
	xorcc	%l2,	%i0,	%l4
	flush	%l7 + 0x1C
	orncc	%i3,	0x0DE7,	%l6
	bcs,pt	%icc,	loop_881
	edge32l	%g6,	%i6,	%i5
	tgu	%xcc,	0x6
	fxnor	%f22,	%f16,	%f10
loop_881:
	nop
	wr	%g0,	0x80,	%asi
	stwa	%o3,	[%l7 + 0x54] %asi
	fabss	%f2,	%f12
	sub	%l3,	0x0B83,	%l1
	movle	%icc,	%l0,	%o0
	tcc	%xcc,	0x7
	andcc	%g5,	%i1,	%i7
	movrgz	%g7,	%i2,	%o4
	edge32ln	%o1,	%g3,	%o5
	tle	%xcc,	0x3
	fnegd	%f16,	%f2
	edge32n	%o7,	%o2,	%g1
	fcmped	%fcc0,	%f6,	%f0
	sdivx	%g4,	0x1FEA,	%i4
	ldub	[%l7 + 0x4D],	%o6
	movge	%icc,	%l5,	%g2
	lduh	[%l7 + 0x0E],	%i0
	edge16n	%l2,	%l4,	%l6
	taddcc	%g6,	%i3,	%i5
	brlz,a	%o3,	loop_882
	fmovdcs	%xcc,	%f13,	%f23
	bleu,a,pt	%xcc,	loop_883
	tn	%xcc,	0x7
loop_882:
	sll	%i6,	0x1A,	%l1
	fmovsn	%icc,	%f16,	%f14
loop_883:
	nop
	wr	%g0,	0x10,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	sub	%l0,	0x0A24,	%o0
	movg	%icc,	%g5,	%i1
	andcc	%i7,	%g7,	%l3
	fsrc2	%f14,	%f20
	sth	%o4,	[%l7 + 0x56]
	wr	%g0,	0x0c,	%asi
	lduba	[%l7 + 0x21] %asi,	%i2
	nop
	setx	loop_884,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fmul8ulx16	%f4,	%f10,	%f10
	bleu	loop_885
	subcc	%o1,	%g3,	%o7
loop_884:
	srlx	%o2,	%g1,	%o5
	fpadd32	%f16,	%f4,	%f20
loop_885:
	fba,a	%fcc1,	loop_886
	bg	loop_887
	tleu	%icc,	0x2
	fmovscc	%icc,	%f26,	%f30
loop_886:
	movcs	%icc,	%g4,	%o6
loop_887:
	prefetch	[%l7 + 0x10],	 0x1
	movn	%icc,	%l5,	%i4
	orncc	%i0,	0x1DE9,	%l2
	movneg	%xcc,	%g2,	%l6
	fpsub16	%f20,	%f12,	%f18
	andncc	%l4,	%g6,	%i3
	brnz,a	%i5,	loop_888
	and	%i6,	0x0348,	%l1
	lduh	[%l7 + 0x7A],	%o3
	udivx	%o0,	0x165C,	%g5
loop_888:
	fbge	%fcc2,	loop_889
	edge16	%i1,	%i7,	%l0
	membar	0x14
	movl	%icc,	%g7,	%o4
loop_889:
	sir	0x08A9
	edge16	%i2,	%o1,	%g3
	edge8	%o7,	%o2,	%g1
	bshuffle	%f20,	%f4,	%f10
	sdivcc	%o5,	0x15D1,	%l3
	bvc,a	%icc,	loop_890
	udiv	%o6,	0x16EA,	%l5
	movvs	%xcc,	%g4,	%i4
	ldx	[%l7 + 0x58],	%l2
loop_890:
	xnorcc	%g2,	%l6,	%l4
	fnand	%f2,	%f22,	%f18
	set	0x40, %l5
	stda	%f0,	[%l7 + %l5] 0x0c
	popc	0x0F6B,	%g6
	udiv	%i3,	0x02DD,	%i0
	ta	%xcc,	0x6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sth	%i6,	[%l7 + 0x7E]
	tl	%xcc,	0x7
	edge32ln	%l1,	%i5,	%o3
	stx	%o0,	[%l7 + 0x70]
	fxor	%f20,	%f0,	%f0
	xor	%g5,	0x1B49,	%i1
	tl	%icc,	0x5
	sethi	0x1FCC,	%i7
	fmovs	%f15,	%f25
	edge8	%l0,	%g7,	%i2
	alignaddr	%o1,	%g3,	%o7
	tsubcc	%o2,	%o4,	%g1
	fzeros	%f13
	flush	%l7 + 0x60
	subcc	%o5,	%l3,	%o6
	tsubcctv	%g4,	0x1D53,	%l5
	xor	%l2,	%i4,	%l6
	bvc,a	loop_891
	fmovdleu	%xcc,	%f0,	%f6
	wr	%g0,	0x0c,	%asi
	lduwa	[%l7 + 0x44] %asi,	%g2
loop_891:
	brlz	%g6,	loop_892
	edge32ln	%l4,	%i0,	%i3
	sdivcc	%i6,	0x0915,	%l1
	edge8ln	%i5,	%o0,	%o3
loop_892:
	movneg	%icc,	%g5,	%i7
	array32	%l0,	%i1,	%i2
	bneg,a,pn	%icc,	loop_893
	sdiv	%g7,	0x03A6,	%g3
	fmovrslez	%o1,	%f19,	%f27
	fmovrdgz	%o7,	%f4,	%f2
loop_893:
	umul	%o4,	0x1D48,	%o2
	taddcc	%g1,	%o5,	%l3
	brgez	%g4,	loop_894
	bcs,pn	%icc,	loop_895
	fmovdcc	%xcc,	%f24,	%f13
	movleu	%icc,	%l5,	%l2
loop_894:
	movge	%icc,	%o6,	%l6
loop_895:
	xor	%g2,	0x1967,	%i4
	xnor	%l4,	0x0BB0,	%i0
	fmul8x16	%f28,	%f2,	%f2
	fnegs	%f12,	%f25
	movvc	%icc,	%i3,	%g6
	fone	%f18
	edge8	%l1,	%i6,	%i5
	movcs	%xcc,	%o3,	%o0
	or	%g5,	%i7,	%i1
	set	0x4F, %i2
	ldstuba	[%l7 + %i2] 0x18,	%l0
	movleu	%icc,	%i2,	%g7
	bcc,a,pn	%xcc,	loop_896
	array32	%o1,	%g3,	%o4
	fmovda	%icc,	%f30,	%f11
	fmovrdgz	%o7,	%f16,	%f24
loop_896:
	popc	0x10E0,	%g1
	fmovse	%icc,	%f31,	%f10
	bg,a,pn	%xcc,	loop_897
	fbu,a	%fcc0,	loop_898
	bleu,a,pn	%xcc,	loop_899
	andn	%o5,	0x1597,	%l3
loop_897:
	tcs	%icc,	0x5
loop_898:
	edge16l	%g4,	%o2,	%l5
loop_899:
	movge	%xcc,	%o6,	%l2
	and	%l6,	%g2,	%i4
	fmul8sux16	%f0,	%f20,	%f10
	membar	0x31
	taddcctv	%i0,	%i3,	%g6
	movcs	%xcc,	%l4,	%l1
	ta	%icc,	0x0
	ldd	[%l7 + 0x18],	%f30
	subccc	%i6,	0x0CB5,	%i5
	sdivcc	%o0,	0x101A,	%g5
	movvs	%xcc,	%i7,	%o3
	fmovrdgez	%l0,	%f20,	%f0
	fmovdcs	%icc,	%f13,	%f30
	fmovsle	%icc,	%f26,	%f2
	umulcc	%i2,	%i1,	%g7
	movge	%icc,	%g3,	%o1
	ble	loop_900
	mova	%xcc,	%o7,	%g1
	tn	%xcc,	0x5
	fands	%f27,	%f28,	%f0
loop_900:
	membar	0x7D
	edge32ln	%o5,	%o4,	%g4
	tne	%icc,	0x3
	fmovdvc	%icc,	%f14,	%f20
	udivcc	%l3,	0x0DB0,	%o2
	fmovdvc	%icc,	%f22,	%f14
	fmovsn	%xcc,	%f31,	%f4
	fmovdvc	%icc,	%f24,	%f31
	movvs	%xcc,	%o6,	%l2
	movcs	%icc,	%l5,	%g2
	udivcc	%l6,	0x1D7F,	%i0
	sdiv	%i4,	0x0EDE,	%g6
	movcc	%icc,	%l4,	%l1
	stx	%i3,	[%l7 + 0x28]
	nop
	set	0x20, %o5
	ldd	[%l7 + %o5],	%i4
	subccc	%i6,	%o0,	%g5
	bne	loop_901
	edge32l	%i7,	%o3,	%i2
	stx	%l0,	[%l7 + 0x78]
	tleu	%xcc,	0x2
loop_901:
	sdivx	%g7,	0x163D,	%g3
	st	%f19,	[%l7 + 0x70]
	fmovse	%xcc,	%f5,	%f17
	sir	0x1BAA
	movrlez	%o1,	0x163,	%o7
	wr	%g0,	0x80,	%asi
	stda	%g0,	[%l7 + 0x60] %asi
	prefetch	[%l7 + 0x78],	 0x0
	edge8	%o5,	%i1,	%o4
	movn	%icc,	%g4,	%l3
	fmovrse	%o6,	%f27,	%f3
	smulcc	%l2,	0x1A70,	%l5
	flush	%l7 + 0x28
	ldsb	[%l7 + 0x6C],	%o2
	popc	0x15EC,	%g2
	move	%xcc,	%l6,	%i0
	bcs	%icc,	loop_902
	ldd	[%l7 + 0x70],	%i4
	edge32n	%l4,	%g6,	%l1
	movl	%xcc,	%i3,	%i5
loop_902:
	membar	0x34
	edge16n	%i6,	%o0,	%g5
	edge32	%i7,	%o3,	%i2
	tle	%icc,	0x2
	orn	%l0,	0x1194,	%g7
	fmovsg	%xcc,	%f2,	%f18
	std	%f8,	[%l7 + 0x28]
	movrgez	%o1,	0x04A,	%g3
	brnz	%o7,	loop_903
	edge16n	%g1,	%o5,	%i1
	fmovsl	%xcc,	%f26,	%f13
	wr	%g0,	0x22,	%asi
	stha	%g4,	[%l7 + 0x24] %asi
	membar	#Sync
loop_903:
	add	%o4,	0x123B,	%l3
	movleu	%xcc,	%l2,	%o6
	tcs	%xcc,	0x7
	ldd	[%l7 + 0x10],	%f6
	fcmple16	%f28,	%f14,	%o2
	bg,pt	%icc,	loop_904
	movrlez	%l5,	%l6,	%i0
	movrlez	%i4,	%g2,	%g6
	fnegs	%f20,	%f14
loop_904:
	fcmpeq32	%f10,	%f18,	%l4
	ldx	[%l7 + 0x60],	%i3
	tcc	%icc,	0x2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsb	[%l7 + 0x46],	%i5
	udivcc	%i6,	0x1B63,	%o0
	stw	%g5,	[%l7 + 0x2C]
	ldub	[%l7 + 0x5B],	%l1
	move	%xcc,	%o3,	%i2
	stbar
	fmovdcs	%icc,	%f12,	%f3
	movrlez	%l0,	0x0D3,	%g7
	subccc	%o1,	%i7,	%o7
	movpos	%xcc,	%g3,	%g1
	fmovrde	%i1,	%f22,	%f20
	srax	%g4,	%o4,	%o5
	andcc	%l3,	0x0764,	%o6
	fmovsa	%xcc,	%f17,	%f18
	fpsub32s	%f4,	%f24,	%f24
	fones	%f6
	wr	%g0,	0x18,	%asi
	ldsha	[%l7 + 0x18] %asi,	%o2
	mova	%xcc,	%l5,	%l2
	ldsw	[%l7 + 0x78],	%i0
	fbug,a	%fcc0,	loop_905
	edge8l	%i4,	%g2,	%l6
	tg	%xcc,	0x0
	fxnors	%f17,	%f27,	%f18
loop_905:
	fba	%fcc1,	loop_906
	xnorcc	%l4,	0x1885,	%g6
	wr	%g0,	0x11,	%asi
	lda	[%l7 + 0x48] %asi,	%f0
loop_906:
	nop
	add	%l7,	0x58,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%i5
	casxa	[%l6] %asi,	%i5,	%i3
	fcmpes	%fcc1,	%f28,	%f17
	ldub	[%l7 + 0x2F],	%i6
	add	%o0,	%l1,	%o3
	movrgez	%i2,	0x214,	%l0
	movneg	%icc,	%g7,	%o1
	smul	%i7,	%o7,	%g3
	fbe	%fcc2,	loop_907
	edge16ln	%g5,	%g1,	%i1
	brlz	%o4,	loop_908
	fsrc1s	%f3,	%f6
loop_907:
	fmovdcs	%icc,	%f31,	%f16
	srax	%o5,	0x00,	%g4
loop_908:
	fcmpes	%fcc1,	%f2,	%f3
	movrlez	%o6,	0x2F3,	%l3
	wr	%g0,	0x10,	%asi
	sta	%f29,	[%l7 + 0x28] %asi
	membar	0x5D
	addc	%l5,	0x054F,	%o2
	mova	%xcc,	%l2,	%i4
	movvc	%icc,	%g2,	%l6
	fble,a	%fcc1,	loop_909
	orncc	%l4,	%i0,	%i5
	set	0x1C, %g5
	stwa	%g6,	[%l7 + %g5] 0x23
	membar	#Sync
loop_909:
	ldsh	[%l7 + 0x32],	%i3
	bcc	%icc,	loop_910
	fnors	%f2,	%f28,	%f15
	fmovse	%xcc,	%f29,	%f25
	sir	0x19DB
loop_910:
	edge32n	%i6,	%o0,	%l1
	flush	%l7 + 0x6C
	fcmpeq32	%f26,	%f24,	%i2
	add	%o3,	%g7,	%o1
	fbg	%fcc3,	loop_911
	subcc	%l0,	0x198E,	%o7
	sra	%i7,	%g5,	%g1
	taddcctv	%i1,	0x1207,	%g3
loop_911:
	tne	%icc,	0x3
	wr	%g0,	0x18,	%asi
	stxa	%o4,	[%l7 + 0x60] %asi
	add	%o5,	%o6,	%l3
	ldub	[%l7 + 0x6C],	%l5
	movcc	%xcc,	%o2,	%g4
	movrlz	%l2,	%i4,	%l6
	lduw	[%l7 + 0x5C],	%l4
	xorcc	%g2,	%i5,	%i0
	edge32n	%i3,	%i6,	%o0
	tcc	%xcc,	0x6
	umulcc	%l1,	%i2,	%o3
	fbl	%fcc0,	loop_912
	addcc	%g7,	0x1F93,	%o1
	tneg	%xcc,	0x1
	fandnot1	%f10,	%f16,	%f30
loop_912:
	edge8	%g6,	%o7,	%l0
	fand	%f2,	%f20,	%f6
	sdiv	%i7,	0x10CE,	%g5
	or	%g1,	0x0765,	%i1
	sub	%g3,	0x00FE,	%o5
	movn	%icc,	%o6,	%o4
	addccc	%l5,	%o2,	%l3
	orn	%g4,	%i4,	%l2
	xor	%l6,	0x0AC2,	%g2
	fnor	%f10,	%f4,	%f20
	sdivcc	%i5,	0x1BD6,	%l4
	orcc	%i0,	%i3,	%i6
	smul	%o0,	%i2,	%o3
	sllx	%g7,	%l1,	%o1
	fzeros	%f11
	movpos	%icc,	%o7,	%g6
	ldub	[%l7 + 0x5C],	%l0
	edge16n	%i7,	%g1,	%i1
	movneg	%xcc,	%g3,	%g5
	smulcc	%o5,	%o6,	%l5
	addcc	%o4,	0x12D6,	%l3
	movvc	%icc,	%g4,	%i4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tle	%xcc,	0x0
	fmovde	%icc,	%f2,	%f23
	prefetch	[%l7 + 0x10],	 0x1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fandnot2s	%f14,	%f12,	%f1
	tgu	%icc,	0x2
	edge32l	%l2,	%l6,	%o2
	fcmpgt32	%f22,	%f22,	%g2
	sllx	%l4,	%i5,	%i3
	fmovrdlez	%i0,	%f20,	%f10
	nop
	set	0x0C, %g6
	ldsb	[%l7 + %g6],	%i6
	udivcc	%i2,	0x1617,	%o0
	brgez	%g7,	loop_913
	edge32n	%o3,	%o1,	%o7
	fpadd32	%f30,	%f6,	%f14
	fmovdge	%xcc,	%f13,	%f8
loop_913:
	bne	%xcc,	loop_914
	sra	%l1,	%g6,	%i7
	fbo,a	%fcc3,	loop_915
	be,a,pn	%icc,	loop_916
loop_914:
	udivx	%l0,	0x0FFB,	%g1
	tsubcctv	%g3,	%g5,	%i1
loop_915:
	fmovscs	%icc,	%f31,	%f23
loop_916:
	fmovse	%icc,	%f12,	%f17
	movrgz	%o5,	0x3E4,	%o6
	tsubcc	%l5,	%l3,	%g4
	wr	%g0,	0x10,	%asi
	lda	[%l7 + 0x1C] %asi,	%f19
	umul	%i4,	0x0B46,	%l2
	stbar
	wr	%g0,	0x0c,	%asi
	ldsba	[%l7 + 0x7C] %asi,	%l6
	xnorcc	%o2,	0x19DE,	%g2
	sdivx	%o4,	0x1E88,	%i5
	edge32n	%i3,	%i0,	%i6
	fcmpeq32	%f26,	%f6,	%i2
	mulx	%l4,	%g7,	%o0
	taddcc	%o1,	0x0F32,	%o3
	edge8	%l1,	%g6,	%i7
	fxnor	%f30,	%f16,	%f6
	ldx	[%l7 + 0x48],	%l0
	fmovdcs	%xcc,	%f13,	%f18
	edge8n	%g1,	%g3,	%o7
	fmovrse	%i1,	%f1,	%f0
	tne	%icc,	0x6
	tleu	%icc,	0x5
	movvc	%xcc,	%g5,	%o5
	fbge	%fcc3,	loop_917
	movleu	%xcc,	%o6,	%l5
	array32	%l3,	%i4,	%l2
	brgz	%g4,	loop_918
loop_917:
	fmovrsgz	%o2,	%f5,	%f10
	edge32l	%l6,	%g2,	%o4
	fmovdgu	%icc,	%f24,	%f18
loop_918:
	fmovsleu	%icc,	%f2,	%f15
	tvs	%icc,	0x1
	addc	%i5,	%i3,	%i0
	fmovrsne	%i2,	%f31,	%f31
	andn	%l4,	0x0ED1,	%i6
	movpos	%xcc,	%g7,	%o0
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
	ldd	[%l7 + 0x58],	%o0
	movleu	%icc,	%o3,	%l1
	bn	%xcc,	loop_920
loop_919:
	movcs	%xcc,	%i7,	%g6
	movcc	%icc,	%l0,	%g3
	call	loop_921
loop_920:
	brgz,a	%o7,	loop_922
	addc	%g1,	%g5,	%o5
	nop
	set	0x42, %l2
	ldsh	[%l7 + %l2],	%o6
loop_921:
	fmovdpos	%xcc,	%f20,	%f14
loop_922:
	fpsub32s	%f13,	%f2,	%f11
	movvs	%icc,	%i1,	%l3
	orncc	%l5,	0x1EE4,	%i4
	xnor	%l2,	%g4,	%o2
	stx	%l6,	[%l7 + 0x60]
	sdivcc	%o4,	0x076F,	%i5
	edge8n	%g2,	%i0,	%i2
	fmovrsgz	%l4,	%f4,	%f2
	fble	%fcc2,	loop_923
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fblg,a	%fcc2,	loop_924
	st	%f27,	[%l7 + 0x44]
loop_923:
	bge,a,pt	%xcc,	loop_925
	fbu	%fcc2,	loop_926
loop_924:
	tpos	%xcc,	0x6
	bleu,a,pt	%xcc,	loop_927
loop_925:
	movn	%icc,	%i6,	%g7
loop_926:
	fmuld8sux16	%f10,	%f13,	%f14
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_927:
	nop
	set	0x14, %g7
	stwa	%o0,	[%l7 + %g7] 0x11
	sll	%i3,	%o3,	%l1
	fbug	%fcc2,	loop_928
	nop
	setx	loop_929,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	xnorcc	%o1,	%g6,	%i7
	nop
	setx	loop_930,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_928:
	ta	%icc,	0x1
loop_929:
	fandnot2	%f0,	%f2,	%f10
	and	%l0,	%g3,	%g1
loop_930:
	ta	%icc,	0x5
	tle	%xcc,	0x3
	fandnot2	%f30,	%f22,	%f2
	fornot1s	%f30,	%f1,	%f28
	nop
	setx	loop_931,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movge	%xcc,	%o7,	%o5
	fmovdcc	%icc,	%f16,	%f19
	wr	%g0,	0x11,	%asi
	ldxa	[%l7 + 0x48] %asi,	%o6
loop_931:
	fnot1s	%f10,	%f28
	fbule,a	%fcc1,	loop_932
	udivcc	%g5,	0x0EBC,	%i1
	brgz,a	%l3,	loop_933
	movg	%icc,	%l5,	%i4
loop_932:
	movne	%xcc,	%l2,	%o2
	smul	%l6,	%o4,	%g4
loop_933:
	faligndata	%f24,	%f16,	%f8
	tge	%xcc,	0x3
	umul	%g2,	0x1ED2,	%i5
	tcs	%xcc,	0x6
	smulcc	%i0,	0x0EED,	%l4
	fnot2s	%f6,	%f8
	movl	%icc,	%i6,	%g7
	edge8n	%i2,	%o0,	%i3
	fbu	%fcc3,	loop_934
	tgu	%icc,	0x4
	bpos	%xcc,	loop_935
	orn	%o3,	0x168D,	%l1
loop_934:
	fmovrde	%g6,	%f20,	%f14
	st	%f21,	[%l7 + 0x50]
loop_935:
	udivcc	%i7,	0x1C66,	%l0
	fpadd32s	%f17,	%f28,	%f9
	edge16ln	%g3,	%g1,	%o7
	ldstub	[%l7 + 0x19],	%o1
	stw	%o5,	[%l7 + 0x7C]
	brgz	%g5,	loop_936
	tpos	%icc,	0x4
	subccc	%i1,	%l3,	%o6
	fmovda	%xcc,	%f15,	%f21
loop_936:
	sra	%l5,	0x1F,	%i4
	edge8ln	%o2,	%l2,	%o4
	fpadd16	%f20,	%f0,	%f6
	movpos	%xcc,	%l6,	%g2
	tgu	%xcc,	0x2
	fpackfix	%f16,	%f24
	addc	%i5,	0x152B,	%g4
	add	%l7,	0x20,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%i0
	casxa	[%l6] %asi,	%i0,	%i6
	bpos,a,pt	%xcc,	loop_937
	movre	%l4,	0x06B,	%i2
	fmul8x16	%f17,	%f28,	%f0
	set	0x30, %i1
	sta	%f29,	[%l7 + %i1] 0x89
loop_937:
	tgu	%xcc,	0x7
	movrgez	%g7,	%o0,	%i3
	fbo	%fcc3,	loop_938
	tvc	%xcc,	0x0
	std	%f6,	[%l7 + 0x68]
	sdivx	%l1,	0x100B,	%g6
loop_938:
	lduh	[%l7 + 0x28],	%o3
	bneg	loop_939
	array8	%l0,	%i7,	%g3
	sub	%o7,	%o1,	%g1
	xor	%o5,	%g5,	%l3
loop_939:
	udivx	%i1,	0x1DEC,	%o6
	edge16	%i4,	%l5,	%o2
	wr	%g0,	0x27,	%asi
	stwa	%l2,	[%l7 + 0x70] %asi
	membar	#Sync
	tge	%xcc,	0x0
	fmovscc	%icc,	%f6,	%f6
	fmuld8ulx16	%f19,	%f13,	%f22
	tleu	%icc,	0x5
	tl	%icc,	0x2
	fmovrsne	%l6,	%f8,	%f18
	wr	%g0,	0x10,	%asi
	ldstuba	[%l7 + 0x46] %asi,	%o4
	movneg	%icc,	%g2,	%i5
	tpos	%xcc,	0x5
	tpos	%icc,	0x3
	bg,a,pn	%icc,	loop_940
	sdivcc	%g4,	0x0615,	%i6
	tneg	%xcc,	0x5
	tvs	%icc,	0x6
loop_940:
	tsubcc	%l4,	%i2,	%g7
	tgu	%xcc,	0x3
	taddcctv	%o0,	0x0F37,	%i0
	fand	%f2,	%f0,	%f14
	xor	%l1,	%g6,	%o3
	xnorcc	%i3,	0x0E81,	%i7
	fpadd16s	%f9,	%f8,	%f1
	fpackfix	%f26,	%f2
	andncc	%g3,	%o7,	%o1
	te	%icc,	0x2
	fba,a	%fcc0,	loop_941
	fcmpne32	%f0,	%f2,	%g1
	tne	%icc,	0x0
	edge32n	%o5,	%g5,	%l0
loop_941:
	fmovrdgz	%l3,	%f16,	%f22
	fmovsle	%icc,	%f21,	%f24
	fmovdl	%xcc,	%f27,	%f8
	edge32ln	%o6,	%i1,	%l5
	andn	%i4,	%l2,	%o2
	tcs	%xcc,	0x7
	fandnot2	%f30,	%f26,	%f12
	fmovdpos	%xcc,	%f7,	%f29
	srlx	%l6,	0x16,	%g2
	movrlez	%i5,	%o4,	%i6
	movl	%icc,	%g4,	%i2
	movre	%l4,	0x178,	%o0
	tpos	%xcc,	0x4
	movn	%xcc,	%g7,	%l1
	swap	[%l7 + 0x78],	%i0
	tg	%icc,	0x0
	st	%f30,	[%l7 + 0x34]
	movcs	%xcc,	%g6,	%i3
	tcs	%icc,	0x4
	fsrc2	%f6,	%f24
	fble	%fcc2,	loop_942
	edge8l	%o3,	%i7,	%o7
	wr	%g0,	0x18,	%asi
	swapa	[%l7 + 0x20] %asi,	%g3
loop_942:
	andn	%g1,	%o5,	%g5
	fmovdvs	%icc,	%f25,	%f7
	tl	%icc,	0x6
	edge32ln	%l0,	%l3,	%o6
	fmovdg	%xcc,	%f24,	%f7
	fpadd16s	%f10,	%f23,	%f10
	movvc	%icc,	%o1,	%l5
	fones	%f3
	wr	%g0,	0x89,	%asi
	stxa	%i1,	[%l7 + 0x40] %asi
	add	%i4,	0x085F,	%o2
	fmovrsgz	%l2,	%f23,	%f8
	siam	0x6
	edge8ln	%l6,	%g2,	%i5
	fzero	%f14
	alignaddrl	%i6,	%o4,	%g4
	call	loop_943
	flush	%l7 + 0x1C
	bneg,a,pt	%icc,	loop_944
	fbe	%fcc3,	loop_945
loop_943:
	sll	%l4,	0x1B,	%i2
	edge16n	%g7,	%l1,	%i0
loop_944:
	fmovdge	%icc,	%f28,	%f29
loop_945:
	tcc	%xcc,	0x6
	tn	%xcc,	0x5
	sll	%o0,	%g6,	%o3
	udivcc	%i7,	0x027F,	%i3
	fnands	%f12,	%f24,	%f29
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpadd32	%f22,	%f18,	%f14
	ldx	[%l7 + 0x58],	%g3
	xorcc	%g1,	0x1637,	%o5
	fmovdl	%icc,	%f14,	%f16
	edge32l	%o7,	%g5,	%l0
	taddcc	%l3,	%o6,	%o1
	bl,a,pn	%icc,	loop_946
	ldd	[%l7 + 0x68],	%l4
	edge32ln	%i4,	%o2,	%i1
	fbu	%fcc1,	loop_947
loop_946:
	xnor	%l2,	0x0D9F,	%l6
	move	%icc,	%i5,	%i6
	fmovrdgz	%o4,	%f28,	%f10
loop_947:
	fbul	%fcc1,	loop_948
	tn	%icc,	0x6
	lduw	[%l7 + 0x24],	%g4
	ldsb	[%l7 + 0x0A],	%g2
loop_948:
	fbuge,a	%fcc3,	loop_949
	stx	%i2,	[%l7 + 0x58]
	popc	0x0E04,	%g7
	ta	%xcc,	0x5
loop_949:
	nop
	set	0x4C, %g2
	swapa	[%l7 + %g2] 0x04,	%l4
	movrgez	%l1,	%o0,	%i0
	subcc	%g6,	%i7,	%o3
	movvs	%icc,	%i3,	%g3
	sllx	%g1,	%o7,	%o5
	tsubcctv	%l0,	0x10AA,	%l3
	set	0x34, %l1
	lda	[%l7 + %l1] 0x15,	%f6
	brlez	%o6,	loop_950
	movrne	%o1,	%l5,	%g5
	movrgez	%o2,	0x372,	%i4
	brnz	%i1,	loop_951
loop_950:
	fpadd16s	%f28,	%f7,	%f25
	andncc	%l2,	%i5,	%l6
	orcc	%i6,	%g4,	%o4
loop_951:
	fandnot1s	%f11,	%f7,	%f6
	set	0x20, %l3
	stwa	%i2,	[%l7 + %l3] 0x14
	tle	%icc,	0x3
	movrlz	%g7,	%l4,	%g2
	edge16n	%l1,	%i0,	%o0
	fornot1	%f10,	%f24,	%f24
	bleu,pt	%icc,	loop_952
	edge8	%i7,	%o3,	%i3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x88,	%asi
	stha	%g3,	[%l7 + 0x14] %asi
loop_952:
	xnorcc	%g6,	0x097A,	%o7
	move	%xcc,	%o5,	%l0
	movleu	%xcc,	%g1,	%l3
	movg	%icc,	%o1,	%o6
	addc	%l5,	%o2,	%i4
	nop
	setx loop_953, %l0, %l1
	jmpl %l1, %i1
	edge16	%l2,	%i5,	%l6
	tg	%xcc,	0x3
	ldsb	[%l7 + 0x42],	%g5
loop_953:
	edge8n	%g4,	%o4,	%i2
	bge	%icc,	loop_954
	add	%g7,	0x017F,	%i6
	array32	%g2,	%l4,	%l1
	xor	%i0,	0x035C,	%i7
loop_954:
	fmovsn	%icc,	%f26,	%f27
	set	0x50, %o3
	ldsha	[%l7 + %o3] 0x0c,	%o0
	movl	%icc,	%i3,	%o3
	sdivx	%g6,	0x0E6A,	%g3
	movneg	%icc,	%o7,	%o5
	fmovd	%f6,	%f20
	set	0x68, %o1
	prefetcha	[%l7 + %o1] 0x10,	 0x1
	edge8	%l0,	%o1,	%o6
	fmovde	%xcc,	%f4,	%f10
	edge16	%l5,	%l3,	%o2
	ldub	[%l7 + 0x27],	%i1
	movre	%l2,	0x243,	%i4
	tvs	%icc,	0x1
	ldsw	[%l7 + 0x1C],	%l6
	tl	%xcc,	0x2
	fmovdleu	%xcc,	%f10,	%f2
	andn	%g5,	0x1D31,	%i5
	popc	0x03F1,	%g4
	alignaddrl	%i2,	%g7,	%i6
	tsubcctv	%o4,	0x05F1,	%l4
	subcc	%g2,	%l1,	%i7
	movrlz	%o0,	%i0,	%o3
	movleu	%icc,	%i3,	%g6
	add	%g3,	%o7,	%g1
	alignaddr	%l0,	%o5,	%o6
	sllx	%l5,	0x1D,	%o1
	ldd	[%l7 + 0x60],	%l2
	tcs	%xcc,	0x6
	set	0x77, %g4
	stba	%i1,	[%l7 + %g4] 0x2a
	membar	#Sync
	stbar
	stbar
	xnor	%o2,	0x0370,	%l2
	tl	%icc,	0x3
	edge32ln	%i4,	%g5,	%l6
	fmul8ulx16	%f26,	%f14,	%f22
	tneg	%xcc,	0x4
	pdist	%f14,	%f14,	%f0
	brlz	%i5,	loop_955
	mulscc	%i2,	%g4,	%g7
	edge8n	%o4,	%i6,	%g2
	mulscc	%l4,	0x0199,	%l1
loop_955:
	smul	%o0,	%i0,	%o3
	movrne	%i7,	%g6,	%g3
	addccc	%i3,	0x0C2F,	%g1
	ldx	[%l7 + 0x40],	%o7
	sub	%l0,	0x0980,	%o5
	ldx	[%l7 + 0x78],	%l5
	fcmps	%fcc3,	%f10,	%f10
	fbne,a	%fcc3,	loop_956
	fcmple32	%f20,	%f24,	%o6
	fmul8ulx16	%f30,	%f22,	%f28
	fbge	%fcc2,	loop_957
loop_956:
	tsubcctv	%l3,	0x00D6,	%o1
	tn	%icc,	0x1
	edge8l	%o2,	%l2,	%i1
loop_957:
	add	%g5,	%l6,	%i5
	srlx	%i2,	0x00,	%i4
	edge16l	%g4,	%o4,	%g7
	tvs	%xcc,	0x1
	ble,a,pn	%xcc,	loop_958
	fcmpne16	%f10,	%f2,	%i6
	fbue,a	%fcc2,	loop_959
	addcc	%g2,	%l1,	%o0
loop_958:
	array32	%i0,	%l4,	%i7
	fbo,a	%fcc2,	loop_960
loop_959:
	fmovscs	%xcc,	%f15,	%f21
	andcc	%o3,	0x0629,	%g6
	xorcc	%g3,	0x1846,	%g1
loop_960:
	edge8n	%o7,	%i3,	%l0
	fmovs	%f22,	%f13
	addc	%o5,	0x0DEB,	%o6
	stw	%l3,	[%l7 + 0x6C]
	ldsw	[%l7 + 0x5C],	%o1
	orn	%l5,	0x1631,	%l2
	fcmpgt16	%f20,	%f6,	%o2
	alignaddrl	%i1,	%g5,	%l6
	subc	%i2,	%i5,	%g4
	sub	%o4,	%i4,	%g7
	flush	%l7 + 0x68
	edge16l	%i6,	%l1,	%g2
	addcc	%o0,	%l4,	%i0
	movne	%icc,	%i7,	%o3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8n	%g6,	%g1,	%g3
	fba,a	%fcc3,	loop_961
	movpos	%icc,	%i3,	%o7
	edge32l	%o5,	%l0,	%o6
	xnor	%o1,	0x1E62,	%l3
loop_961:
	movrgez	%l5,	0x35E,	%l2
	tvc	%icc,	0x3
	movn	%icc,	%i1,	%g5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrsgz	%l6,	%f20,	%f30
	addccc	%o2,	0x07A7,	%i5
	movge	%icc,	%i2,	%o4
	fmovsl	%icc,	%f31,	%f10
	ldd	[%l7 + 0x18],	%g4
	ta	%icc,	0x5
	wr	%g0,	0x81,	%asi
	swapa	[%l7 + 0x4C] %asi,	%i4
	sdivx	%g7,	0x1929,	%l1
	movgu	%icc,	%i6,	%o0
	fmovrsgz	%g2,	%f14,	%f29
	fnand	%f0,	%f28,	%f24
	udivcc	%l4,	0x0753,	%i7
	movcc	%icc,	%o3,	%i0
	mova	%icc,	%g6,	%g3
	movvc	%icc,	%i3,	%o7
	andncc	%g1,	%l0,	%o5
	fbu,a	%fcc0,	loop_962
	addcc	%o6,	%l3,	%l5
	fmovdcc	%icc,	%f8,	%f19
	set	0x10, %i0
	swapa	[%l7 + %i0] 0x81,	%o1
loop_962:
	fmovsneg	%icc,	%f17,	%f2
	std	%f14,	[%l7 + 0x50]
	edge16	%l2,	%g5,	%l6
	udivx	%i1,	0x070E,	%i5
	movvs	%icc,	%o2,	%o4
	sdiv	%g4,	0x078C,	%i4
	ldsb	[%l7 + 0x3C],	%g7
	ldsh	[%l7 + 0x58],	%i2
	fmovdgu	%icc,	%f5,	%f25
	taddcc	%i6,	%l1,	%g2
	tvc	%icc,	0x3
	fabsd	%f16,	%f20
	nop
	setx	loop_963,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	andcc	%l4,	0x1894,	%i7
	subccc	%o3,	%o0,	%g6
	flush	%l7 + 0x58
loop_963:
	fbg,a	%fcc3,	loop_964
	fpadd16s	%f4,	%f7,	%f28
	subc	%i0,	0x18AD,	%i3
	srax	%g3,	%o7,	%l0
loop_964:
	mulx	%g1,	0x0253,	%o5
	edge8	%l3,	%o6,	%l5
	fsrc1	%f6,	%f22
	udivcc	%l2,	0x1A61,	%g5
	fcmple16	%f16,	%f22,	%o1
	fsrc1s	%f31,	%f13
	mulscc	%l6,	0x136E,	%i1
	flush	%l7 + 0x68
	fpackfix	%f16,	%f9
	movn	%icc,	%o2,	%i5
	addccc	%o4,	0x034B,	%i4
	fmovse	%icc,	%f5,	%f3
	tpos	%icc,	0x2
	set	0x30, %g3
	ldxa	[%l7 + %g3] 0x19,	%g7
	ldsh	[%l7 + 0x52],	%i2
	alignaddrl	%i6,	%l1,	%g4
	ba,a	%icc,	loop_965
	bcs	loop_966
	fmovsl	%xcc,	%f28,	%f1
	array32	%g2,	%i7,	%l4
loop_965:
	fmovdcs	%icc,	%f2,	%f23
loop_966:
	ldd	[%l7 + 0x18],	%o0
	tsubcctv	%o3,	%i0,	%g6
	fbl	%fcc0,	loop_967
	bge,a	%xcc,	loop_968
	and	%i3,	0x1928,	%o7
	lduw	[%l7 + 0x24],	%g3
loop_967:
	orn	%l0,	%o5,	%l3
loop_968:
	fmovdcc	%icc,	%f15,	%f31
	add	%g1,	0x1E69,	%l5
	be,pn	%icc,	loop_969
	membar	0x3F
	fmovrde	%l2,	%f20,	%f8
	xorcc	%o6,	0x1018,	%o1
loop_969:
	tn	%xcc,	0x0
	edge32	%l6,	%i1,	%o2
	fblg,a	%fcc0,	loop_970
	ta	%icc,	0x2
	tgu	%icc,	0x2
	mova	%icc,	%g5,	%i5
loop_970:
	fbe	%fcc2,	loop_971
	mulscc	%i4,	0x08CC,	%g7
	movn	%icc,	%i2,	%i6
	call	loop_972
loop_971:
	sub	%l1,	0x1CDD,	%g4
	addccc	%g2,	0x1463,	%o4
	tvs	%xcc,	0x6
loop_972:
	ldsw	[%l7 + 0x6C],	%l4
	fnand	%f20,	%f12,	%f6
	addccc	%o0,	0x1C9B,	%i7
	array8	%i0,	%o3,	%i3
	fpack16	%f16,	%f6
	subcc	%g6,	0x1F14,	%g3
	andncc	%o7,	%o5,	%l3
	mulscc	%g1,	%l5,	%l0
	tvc	%xcc,	0x4
	movrlez	%o6,	0x2B7,	%o1
	nop
	setx	loop_973,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fmovrdne	%l6,	%f30,	%f28
	fornot2	%f30,	%f26,	%f2
	subc	%l2,	0x011E,	%o2
loop_973:
	tge	%xcc,	0x7
	edge32ln	%g5,	%i5,	%i4
	tn	%xcc,	0x7
	movgu	%icc,	%i1,	%g7
	movrgez	%i2,	0x36E,	%l1
	movne	%icc,	%i6,	%g2
	nop
	setx	loop_974,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	ldd	[%l7 + 0x20],	%g4
	movrgz	%o4,	%l4,	%o0
	tle	%icc,	0x2
loop_974:
	bleu,a	loop_975
	orn	%i7,	0x021F,	%o3
	fnegs	%f30,	%f4
	fmovsle	%icc,	%f2,	%f5
loop_975:
	movre	%i3,	%g6,	%i0
	tleu	%xcc,	0x7
	brlez	%o7,	loop_976
	or	%g3,	%o5,	%l3
	wr	%g0,	0x10,	%asi
	stha	%g1,	[%l7 + 0x38] %asi
loop_976:
	membar	0x16
	fbge	%fcc2,	loop_977
	tgu	%xcc,	0x4
	edge16n	%l5,	%o6,	%l0
	tg	%icc,	0x2
loop_977:
	fexpand	%f13,	%f14
	flush	%l7 + 0x10
	orn	%l6,	0x0B1C,	%o1
	ldsw	[%l7 + 0x30],	%l2
	xorcc	%g5,	%i5,	%o2
	call	loop_978
	fnegs	%f13,	%f22
	bge,a,pt	%icc,	loop_979
	edge16n	%i4,	%i1,	%g7
loop_978:
	movrgez	%l1,	0x035,	%i6
	fbu,a	%fcc3,	loop_980
loop_979:
	edge8l	%g2,	%i2,	%g4
	fnegd	%f12,	%f4
	bleu,a,pn	%icc,	loop_981
loop_980:
	fbg	%fcc3,	loop_982
	sub	%o4,	%l4,	%i7
	edge32l	%o3,	%o0,	%i3
loop_981:
	tcs	%icc,	0x7
loop_982:
	xnor	%i0,	0x004A,	%o7
	fbul,a	%fcc0,	loop_983
	edge8ln	%g6,	%o5,	%l3
	srax	%g1,	0x07,	%l5
	fone	%f28
loop_983:
	nop
	wr	%g0,	0xea,	%asi
	ldda	[%l7 + 0x40] %asi,	%g2
	fpack32	%f4,	%f18,	%f8
	movre	%o6,	%l0,	%l6
	ld	[%l7 + 0x1C],	%f11
	lduw	[%l7 + 0x1C],	%o1
	fbne	%fcc0,	loop_984
	sir	0x17B6
	fmovdneg	%xcc,	%f8,	%f25
	fcmpgt32	%f20,	%f12,	%l2
loop_984:
	ldd	[%l7 + 0x38],	%g4
	fnands	%f17,	%f0,	%f15
	fmovdl	%icc,	%f26,	%f28
	edge16n	%i5,	%o2,	%i4
	addc	%g7,	0x03B9,	%i1
	fmovscc	%xcc,	%f24,	%f2
	fsrc1	%f2,	%f10
	orcc	%l1,	0x1022,	%i6
	bcs,pt	%xcc,	loop_985
	udiv	%g2,	0x1012,	%g4
	ldstub	[%l7 + 0x17],	%o4
	tcs	%xcc,	0x1
loop_985:
	fsrc2s	%f18,	%f13
	fbug	%fcc1,	loop_986
	tl	%xcc,	0x3
	fmul8x16al	%f16,	%f23,	%f20
	movge	%icc,	%i2,	%l4
loop_986:
	mova	%icc,	%o3,	%i7
	fnot2s	%f21,	%f24
	wr	%g0,	0x04,	%asi
	stba	%i3,	[%l7 + 0x54] %asi
	ldd	[%l7 + 0x48],	%i0
	set	0x70, %o6
	lduha	[%l7 + %o6] 0x11,	%o0
	fcmpeq16	%f10,	%f2,	%g6
	fnands	%f28,	%f20,	%f14
	fmovrdlez	%o5,	%f8,	%f6
	fcmple32	%f18,	%f8,	%l3
	fmovrdne	%g1,	%f12,	%f22
	smul	%l5,	%o7,	%g3
	udivx	%o6,	0x085E,	%l0
	fmovdvs	%xcc,	%f4,	%f30
	ldd	[%l7 + 0x10],	%i6
	tcc	%xcc,	0x3
	tsubcctv	%o1,	0x1C1A,	%g5
	prefetch	[%l7 + 0x1C],	 0x2
	siam	0x7
	tsubcc	%i5,	%o2,	%i4
	or	%l2,	0x0C5B,	%i1
	fmovdleu	%xcc,	%f5,	%f24
	set	0x2C, %g1
	lduwa	[%l7 + %g1] 0x0c,	%g7
	fbge	%fcc0,	loop_987
	and	%l1,	0x1119,	%g2
	or	%i6,	0x07AF,	%o4
	movvc	%xcc,	%i2,	%g4
loop_987:
	tvs	%xcc,	0x3
	fmovdge	%xcc,	%f25,	%f17
	wr	%g0,	0x0c,	%asi
	ldxa	[%l7 + 0x60] %asi,	%l4
	edge8n	%i7,	%o3,	%i3
	edge32	%i0,	%g6,	%o0
	call	loop_988
	umul	%l3,	0x180F,	%g1
	addcc	%o5,	%o7,	%g3
	tneg	%icc,	0x2
loop_988:
	fcmps	%fcc3,	%f16,	%f30
	udiv	%o6,	0x1EAE,	%l5
	fpackfix	%f12,	%f14
	fmovsvc	%icc,	%f9,	%f4
	fmul8x16al	%f29,	%f0,	%f16
	udivcc	%l0,	0x1A98,	%o1
	addcc	%l6,	0x0264,	%g5
	subcc	%i5,	0x0B38,	%i4
	ta	%xcc,	0x2
	wr	%g0,	0x80,	%asi
	ldsba	[%l7 + 0x13] %asi,	%l2
	bge,pt	%xcc,	loop_989
	sdiv	%o2,	0x0F2A,	%i1
	movgu	%icc,	%g7,	%l1
	movrlz	%g2,	%i6,	%i2
loop_989:
	xorcc	%o4,	0x003A,	%l4
	array32	%i7,	%g4,	%o3
	bshuffle	%f30,	%f10,	%f10
	sdiv	%i3,	0x1BE6,	%g6
	sra	%i0,	0x1B,	%o0
	smul	%l3,	0x1ADD,	%g1
	fbue,a	%fcc3,	loop_990
	sethi	0x1DBE,	%o5
	bvs,a,pn	%icc,	loop_991
	brlz,a	%o7,	loop_992
loop_990:
	lduh	[%l7 + 0x5C],	%o6
	sethi	0x04E9,	%g3
loop_991:
	tsubcc	%l0,	%l5,	%l6
loop_992:
	edge16l	%g5,	%i5,	%o1
	fmovdcs	%xcc,	%f10,	%f7
	tle	%icc,	0x2
	srax	%i4,	0x00,	%l2
	edge8l	%o2,	%i1,	%l1
	movle	%icc,	%g2,	%i6
	sll	%i2,	0x10,	%g7
	xnor	%o4,	0x1F24,	%l4
	edge32l	%g4,	%o3,	%i3
	movgu	%icc,	%g6,	%i0
	fcmpeq32	%f12,	%f20,	%o0
	xorcc	%l3,	%g1,	%o5
	fmovs	%f14,	%f14
	array16	%o7,	%o6,	%g3
	fbne,a	%fcc3,	loop_993
	tl	%icc,	0x7
	fnors	%f10,	%f14,	%f26
	fbg	%fcc2,	loop_994
loop_993:
	fcmple16	%f0,	%f28,	%i7
	wr	%g0,	0x89,	%asi
	ldswa	[%l7 + 0x70] %asi,	%l5
loop_994:
	tn	%xcc,	0x0
	fmovrdlez	%l6,	%f16,	%f22
	addc	%g5,	0x01CD,	%l0
	movrlez	%i5,	0x049,	%i4
	membar	0x0C
	andcc	%o1,	0x15C5,	%l2
	movvs	%icc,	%o2,	%i1
	srl	%l1,	0x0D,	%i6
	fcmpeq16	%f14,	%f30,	%i2
	swap	[%l7 + 0x24],	%g7
	fexpand	%f30,	%f18
	edge8ln	%g2,	%l4,	%o4
	sra	%g4,	%i3,	%g6
	std	%f18,	[%l7 + 0x50]
	sll	%o3,	%o0,	%l3
	sll	%i0,	%g1,	%o5
	tl	%xcc,	0x3
	edge8ln	%o7,	%g3,	%o6
	popc	%l5,	%i7
	move	%icc,	%g5,	%l6
	ldsb	[%l7 + 0x79],	%l0
	fandnot1s	%f1,	%f14,	%f26
	sllx	%i5,	%i4,	%o1
	movgu	%icc,	%o2,	%i1
	prefetch	[%l7 + 0x14],	 0x3
	fnot1	%f30,	%f2
	set	0x48, %o2
	stba	%l1,	[%l7 + %o2] 0x88
	set	0x30, %l0
	ldda	[%l7 + %l0] 0x0c,	%l2
	xorcc	%i6,	0x1680,	%i2
	fmovrde	%g7,	%f30,	%f26
	smulcc	%g2,	0x19CA,	%o4
	bneg,pn	%icc,	loop_995
	bn,a	%xcc,	loop_996
	fpsub16	%f24,	%f30,	%f6
	umulcc	%g4,	%l4,	%i3
loop_995:
	movneg	%icc,	%g6,	%o3
loop_996:
	edge32	%l3,	%o0,	%g1
	bvc,pt	%xcc,	loop_997
	bge,a	loop_998
	mulscc	%o5,	0x11E8,	%o7
	movneg	%icc,	%g3,	%o6
loop_997:
	tcs	%icc,	0x4
loop_998:
	srl	%l5,	%i7,	%g5
	edge32l	%l6,	%l0,	%i0
	movrgz	%i4,	%o1,	%o2
	tl	%xcc,	0x5
	bleu	%xcc,	loop_999
	mulx	%i1,	0x0D42,	%l1
	movrgez	%i5,	%i6,	%i2
	movrlz	%l2,	0x261,	%g7
loop_999:
	alignaddr	%o4,	%g2,	%g4
	fmovscc	%xcc,	%f30,	%f18
	addcc	%l4,	0x07A4,	%g6
	mulx	%o3,	%i3,	%l3
	srl	%o0,	%o5,	%g1
	udiv	%g3,	0x102D,	%o6
	smulcc	%o7,	%l5,	%g5
	movrlz	%l6,	%i7,	%i0
	fmovse	%xcc,	%f4,	%f7
	sub	%i4,	0x0D44,	%l0
	movgu	%icc,	%o1,	%o2
	xnor	%i1,	%i5,	%i6
	udivcc	%l1,	0x0971,	%i2
	smul	%g7,	0x0962,	%l2
	movvs	%icc,	%o4,	%g4
	fbne	%fcc0,	loop_1000
	array16	%l4,	%g6,	%o3
	faligndata	%f18,	%f2,	%f6
	set	0x66, %i6
	stha	%i3,	[%l7 + %i6] 0x15
loop_1000:
	te	%xcc,	0x2
	tsubcc	%l3,	%g2,	%o5
	bpos,a,pn	%xcc,	loop_1001
	fnor	%f10,	%f8,	%f8
	wr	%g0,	0x2b,	%asi
	ldda	[%l7 + 0x70] %asi,	%o0
loop_1001:
	movg	%icc,	%g1,	%g3
	fmul8x16	%f22,	%f6,	%f20
	lduw	[%l7 + 0x54],	%o6
	movrgez	%o7,	%l5,	%g5
	tgu	%icc,	0x7
	wr	%g0,	0x81,	%asi
	sta	%f12,	[%l7 + 0x24] %asi
	set	0x18, %l4
	stda	%i6,	[%l7 + %l4] 0x2b
	membar	#Sync
	tn	%icc,	0x4
	edge32ln	%i0,	%i7,	%l0
	or	%o1,	0x04D7,	%i4
	sllx	%i1,	0x0D,	%o2
	sll	%i5,	%l1,	%i2
	movleu	%icc,	%i6,	%g7
	sdiv	%o4,	0x137B,	%l2
	move	%xcc,	%g4,	%g6
	mulscc	%l4,	%i3,	%l3
	edge8n	%g2,	%o3,	%o0
	movre	%o5,	0x252,	%g3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpack16	%f16,	%f1
	brz	%o6,	loop_1002
	nop
	set	0x28, %o7
	ldsw	[%l7 + %o7],	%o7
	fnegs	%f9,	%f8
	wr	%g0,	0x80,	%asi
	prefetcha	[%l7 + 0x58] %asi,	 0x1
loop_1002:
	nop
	wr	%g0,	0x10,	%asi
	ldsha	[%l7 + 0x3C] %asi,	%g5
	bvs,a	loop_1003
	tvs	%icc,	0x4
	edge16n	%l6,	%g1,	%i7
	membar	0x00
loop_1003:
	fbule,a	%fcc0,	loop_1004
	bgu,pt	%icc,	loop_1005
	edge32n	%i0,	%l0,	%i4
	movcc	%xcc,	%i1,	%o2
loop_1004:
	nop
	setx	loop_1006,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_1005:
	edge8ln	%i5,	%l1,	%o1
	edge16	%i6,	%g7,	%o4
	subccc	%l2,	%g4,	%g6
loop_1006:
	movneg	%xcc,	%i2,	%l4
	nop
	setx	loop_1007,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fmovdleu	%icc,	%f16,	%f28
	ldd	[%l7 + 0x58],	%f10
	fexpand	%f5,	%f28
loop_1007:
	fblg,a	%fcc3,	loop_1008
	edge8n	%i3,	%l3,	%o3
	edge8	%g2,	%o5,	%o0
	edge32n	%g3,	%o6,	%l5
loop_1008:
	std	%o6,	[%l7 + 0x10]
	movcc	%icc,	%g5,	%l6
	movpos	%icc,	%g1,	%i0
	andncc	%l0,	%i7,	%i1
	udiv	%i4,	0x1CED,	%o2
	tvs	%xcc,	0x3
	andn	%i5,	0x0B5C,	%o1
	tg	%icc,	0x7
	edge8l	%l1,	%g7,	%i6
	brgz,a	%l2,	loop_1009
	fbl,a	%fcc2,	loop_1010
	and	%g4,	%g6,	%i2
	smulcc	%o4,	%l4,	%i3
loop_1009:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1010:
	addc	%l3,	%o3,	%g2
	subcc	%o5,	%g3,	%o0
	edge16ln	%o6,	%l5,	%g5
	movgu	%icc,	%o7,	%l6
	tvs	%icc,	0x2
	xnorcc	%g1,	%i0,	%i7
	swap	[%l7 + 0x10],	%i1
	fmovdcc	%xcc,	%f28,	%f23
	movcc	%icc,	%i4,	%l0
	movcs	%icc,	%i5,	%o1
	edge16	%o2,	%g7,	%l1
	srlx	%l2,	%i6,	%g4
	edge32n	%i2,	%g6,	%o4
	tleu	%icc,	0x7
	fmovda	%icc,	%f15,	%f21
	edge8	%l4,	%i3,	%l3
	fpadd32	%f12,	%f24,	%f20
	siam	0x4
	edge8	%g2,	%o3,	%o5
	add	%o0,	%o6,	%l5
	sir	0x06C5
	sra	%g3,	%o7,	%g5
	set	0x40, %o0
	ldda	[%l7 + %o0] 0x2e,	%i6
	edge8n	%i0,	%g1,	%i1
	fbge	%fcc3,	loop_1011
	te	%xcc,	0x0
	tne	%icc,	0x7
	array32	%i7,	%l0,	%i4
loop_1011:
	umul	%o1,	%o2,	%g7
	fmovrdne	%l1,	%f20,	%f22
	and	%i5,	0x127C,	%i6
	sdivx	%g4,	0x11DC,	%i2
	edge32ln	%g6,	%o4,	%l2
	movgu	%icc,	%l4,	%i3
	tvs	%xcc,	0x3
	orcc	%l3,	0x0F96,	%g2
	subc	%o5,	%o3,	%o0
	pdist	%f8,	%f26,	%f22
	ba	%xcc,	loop_1012
	srl	%o6,	%l5,	%o7
	fblg	%fcc0,	loop_1013
	movrgez	%g3,	0x0B3,	%g5
loop_1012:
	fxnors	%f9,	%f10,	%f4
	alignaddrl	%i0,	%g1,	%l6
loop_1013:
	ta	%icc,	0x3
	lduh	[%l7 + 0x5E],	%i7
	movg	%xcc,	%l0,	%i1
	orn	%o1,	%o2,	%g7
	fcmpne32	%f0,	%f18,	%i4
	srl	%i5,	%i6,	%g4
	move	%icc,	%i2,	%g6
	prefetch	[%l7 + 0x24],	 0x1
	tn	%icc,	0x6
	move	%icc,	%o4,	%l1
	fmovd	%f24,	%f18
	movrlez	%l2,	0x328,	%l4
	fandnot1	%f14,	%f2,	%f20
	set	0x4A, %i7
	stha	%l3,	[%l7 + %i7] 0x80
	edge32	%g2,	%i3,	%o3
	set	0x78, %o4
	sta	%f25,	[%l7 + %o4] 0x14
	and	%o5,	%o0,	%o6
	andncc	%l5,	%g3,	%g5
	orcc	%i0,	%o7,	%g1
	ble,a,pn	%xcc,	loop_1014
	movcc	%xcc,	%i7,	%l0
	edge32l	%l6,	%o1,	%i1
	movrgez	%o2,	0x038,	%i4
loop_1014:
	call	loop_1015
	fmuld8ulx16	%f15,	%f22,	%f22
	movre	%i5,	%g7,	%g4
	fpsub32	%f26,	%f14,	%f8
loop_1015:
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
	umulcc	%i6,	%g6,	%o4
	srax	%i2,	%l2,	%l4
	movg	%xcc,	%l3,	%g2
loop_1016:
	fbuge,a	%fcc3,	loop_1017
	fpsub32s	%f17,	%f27,	%f8
	subcc	%i3,	0x1FC8,	%o3
	swap	[%l7 + 0x34],	%l1
loop_1017:
	pdist	%f16,	%f20,	%f10
	wr	%g0,	0x18,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	movvc	%xcc,	%o0,	%o6
	tgu	%icc,	0x7
	sdivx	%l5,	0x1E57,	%o5
	fmovsgu	%icc,	%f21,	%f8
	tvc	%icc,	0x4
	addc	%g3,	0x1E36,	%g5
	srax	%o7,	%i0,	%g1
	umul	%i7,	%l6,	%l0
	fnegs	%f7,	%f11
	nop
	setx	loop_1018,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fcmpes	%fcc1,	%f5,	%f12
	fmovdvs	%icc,	%f7,	%f22
	mulscc	%o1,	0x0EB5,	%o2
loop_1018:
	edge8n	%i1,	%i4,	%g7
	addcc	%i5,	%i6,	%g6
	fpack32	%f24,	%f22,	%f12
	fbue	%fcc2,	loop_1019
	faligndata	%f18,	%f26,	%f24
	fpack32	%f22,	%f2,	%f24
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1019:
	fmovrsne	%o4,	%f30,	%f5
	sdiv	%g4,	0x1480,	%l2
	edge16	%i2,	%l3,	%g2
	movre	%l4,	%i3,	%o3
	sllx	%l1,	%o0,	%l5
	srax	%o6,	%o5,	%g5
	fpmerge	%f24,	%f14,	%f10
	xor	%o7,	0x15B9,	%g3
	wr	%g0,	0x81,	%asi
	ldsba	[%l7 + 0x7C] %asi,	%i0
	stb	%g1,	[%l7 + 0x43]
	edge16ln	%i7,	%l0,	%l6
	wr	%g0,	0x80,	%asi
	prefetcha	[%l7 + 0x40] %asi,	 0x0
	srl	%i1,	0x1E,	%i4
	edge32l	%o1,	%i5,	%g7
	fbul,a	%fcc1,	loop_1020
	alignaddr	%g6,	%i6,	%g4
	fmovsa	%xcc,	%f12,	%f5
	movleu	%xcc,	%o4,	%l2
loop_1020:
	movneg	%xcc,	%i2,	%l3
	move	%icc,	%g2,	%l4
	movre	%i3,	0x2DE,	%l1
	addccc	%o0,	%l5,	%o3
	bcc,a	%icc,	loop_1021
	umul	%o6,	%g5,	%o5
	xor	%g3,	0x1266,	%o7
	sdiv	%i0,	0x1B35,	%g1
loop_1021:
	flush	%l7 + 0x68
	fmovdn	%xcc,	%f0,	%f7
	sdivx	%l0,	0x0099,	%i7
	edge16l	%l6,	%o2,	%i1
	add	%i4,	0x1383,	%o1
	sdiv	%i5,	0x0B20,	%g7
	movn	%icc,	%g6,	%i6
	fmul8sux16	%f4,	%f0,	%f12
	fsrc1	%f6,	%f28
	tneg	%xcc,	0x6
	add	%g4,	0x1F90,	%l2
	fxnors	%f29,	%f0,	%f12
	prefetch	[%l7 + 0x28],	 0x3
	taddcc	%i2,	0x063A,	%l3
	fmovrdlez	%g2,	%f2,	%f24
	add	%l7,	0x10,	%l6
	wr	%g0,	0x19,	%asi
	casa	[%l6] 0x19,	%o4,	%l4
	array16	%l1,	%o0,	%l5
	call	loop_1022
	bvs,pn	%icc,	loop_1023
	tn	%icc,	0x7
	umulcc	%o3,	0x1778,	%i3
loop_1022:
	movl	%xcc,	%o6,	%g5
loop_1023:
	fmovsneg	%xcc,	%f31,	%f9
	fornot2	%f22,	%f30,	%f6
	fcmpgt32	%f14,	%f22,	%o5
	mova	%xcc,	%g3,	%o7
	umul	%g1,	%l0,	%i7
	edge32l	%i0,	%o2,	%l6
	movre	%i4,	0x155,	%i1
	taddcc	%i5,	%o1,	%g7
	fpadd32s	%f0,	%f2,	%f19
	ba	%icc,	loop_1024
	srl	%g6,	0x17,	%i6
	fmovdneg	%icc,	%f8,	%f1
	movpos	%icc,	%g4,	%l2
loop_1024:
	st	%f12,	[%l7 + 0x14]
	andcc	%i2,	0x0EB2,	%l3
	sdivcc	%o4,	0x1BB5,	%l4
	wr	%g0,	0x18,	%asi
	lduba	[%l7 + 0x3E] %asi,	%l1
	fpsub32s	%f14,	%f4,	%f18
	sllx	%o0,	0x03,	%l5
	fmovdpos	%icc,	%f4,	%f30
	fornot1s	%f12,	%f19,	%f5
	tcs	%icc,	0x6
	set	0x48, %i3
	ldsba	[%l7 + %i3] 0x11,	%g2
	ta	%icc,	0x7
	fmovsneg	%xcc,	%f31,	%f16
	bg,a	%icc,	loop_1025
	lduh	[%l7 + 0x6E],	%i3
	fpadd32s	%f24,	%f10,	%f22
	nop
	setx	loop_1026,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_1025:
	movleu	%icc,	%o3,	%o6
	fbul,a	%fcc1,	loop_1027
	movrgz	%g5,	%g3,	%o5
loop_1026:
	fzero	%f22
	tvs	%icc,	0x7
loop_1027:
	lduw	[%l7 + 0x70],	%g1
	fmovdpos	%xcc,	%f1,	%f23
	array16	%o7,	%l0,	%i0
	fnot2s	%f3,	%f10
	fmovd	%f10,	%f12
	stb	%i7,	[%l7 + 0x19]
	taddcctv	%o2,	%i4,	%l6
	sth	%i1,	[%l7 + 0x3E]
	subccc	%i5,	%o1,	%g6
	bpos,a,pt	%xcc,	loop_1028
	edge16ln	%g7,	%i6,	%g4
	srl	%l2,	%l3,	%i2
	tneg	%icc,	0x5
loop_1028:
	st	%f15,	[%l7 + 0x30]
	fmovscs	%icc,	%f17,	%f25
	bvc,pn	%xcc,	loop_1029
	edge8n	%l4,	%o4,	%l1
	fmul8ulx16	%f24,	%f18,	%f20
	movl	%icc,	%o0,	%g2
loop_1029:
	fbug	%fcc2,	loop_1030
	tg	%icc,	0x0
	set	0x40, %l6
	ldda	[%l7 + %l6] 0x88,	%f16
loop_1030:
	move	%icc,	%l5,	%i3
	tge	%xcc,	0x2
	edge8l	%o3,	%g5,	%o6
	subc	%o5,	%g3,	%o7
	mulscc	%l0,	0x061C,	%i0
	set	0x08, %i5
	ldxa	[%l7 + %i5] 0x10,	%i7
	ble	%icc,	loop_1031
	fmul8sux16	%f14,	%f2,	%f22
	addccc	%g1,	%o2,	%l6
	fpsub16s	%f8,	%f5,	%f18
loop_1031:
	ldsb	[%l7 + 0x29],	%i1
	srax	%i4,	0x0B,	%i5
	fbue,a	%fcc3,	loop_1032
	fbue,a	%fcc1,	loop_1033
	fbo,a	%fcc1,	loop_1034
	bne,a,pt	%xcc,	loop_1035
loop_1032:
	movn	%icc,	%g6,	%o1
loop_1033:
	nop
	set	0x44, %l5
	stwa	%g7,	[%l7 + %l5] 0x2b
	membar	#Sync
loop_1034:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1035:
	subcc	%g4,	%l2,	%l3
	fxnor	%f26,	%f10,	%f14
	tg	%xcc,	0x3
	movg	%xcc,	%i2,	%l4
	fcmps	%fcc0,	%f5,	%f13
	xor	%i6,	0x1ED0,	%l1
	tge	%xcc,	0x7
	fmovrsne	%o4,	%f10,	%f10
	sir	0x0FA9
	fcmpgt16	%f8,	%f30,	%g2
	membar	0x45
	sra	%l5,	0x18,	%i3
	edge8	%o3,	%o0,	%o6
	tg	%icc,	0x2
	brgz,a	%g5,	loop_1036
	subccc	%o5,	%o7,	%l0
	fpsub32s	%f7,	%f27,	%f8
	wr	%g0,	0x04,	%asi
	prefetcha	[%l7 + 0x48] %asi,	 0x2
loop_1036:
	edge8n	%g3,	%i7,	%o2
	alignaddrl	%l6,	%g1,	%i1
	add	%l7,	0x40,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%i4,	%g6
	flush	%l7 + 0x70
	ldstub	[%l7 + 0x0C],	%i5
	fnot1s	%f11,	%f31
	fone	%f20
	fbuge,a	%fcc0,	loop_1037
	tneg	%icc,	0x3
	tpos	%xcc,	0x4
	udivx	%g7,	0x09E9,	%g4
loop_1037:
	movvc	%icc,	%o1,	%l3
	and	%i2,	%l2,	%i6
	fmovrsne	%l1,	%f21,	%f26
	fcmple16	%f2,	%f20,	%l4
	edge8	%o4,	%l5,	%i3
	sllx	%g2,	%o0,	%o6
	wr	%g0,	0x10,	%asi
	lduha	[%l7 + 0x2C] %asi,	%g5
	xnor	%o3,	0x1FA2,	%o7
	udiv	%l0,	0x1C88,	%i0
	alignaddr	%o5,	%i7,	%g3
	orcc	%l6,	0x0D37,	%o2
	fsrc2	%f10,	%f4
	edge32	%i1,	%i4,	%g1
	udivx	%g6,	0x188A,	%g7
	fnor	%f30,	%f30,	%f4
	movrgez	%g4,	%i5,	%o1
	movleu	%icc,	%i2,	%l3
	fmovsa	%icc,	%f27,	%f15
	brgez	%i6,	loop_1038
	orncc	%l2,	%l4,	%l1
	nop
	setx	loop_1039,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fcmpgt32	%f28,	%f0,	%l5
loop_1038:
	sdivcc	%o4,	0x1718,	%i3
	movne	%xcc,	%o0,	%g2
loop_1039:
	movrlez	%o6,	%o3,	%g5
	xnorcc	%o7,	0x0109,	%l0
	brgz,a	%o5,	loop_1040
	movrgez	%i7,	%i0,	%l6
	fmovsl	%icc,	%f2,	%f28
	sir	0x0485
loop_1040:
	bge,a,pt	%xcc,	loop_1041
	mulx	%g3,	0x0A57,	%o2
	tleu	%icc,	0x4
	add	%i1,	%i4,	%g1
loop_1041:
	srlx	%g6,	%g7,	%i5
	popc	0x0B32,	%o1
	fcmple32	%f16,	%f0,	%g4
	fexpand	%f1,	%f14
	fmovrslz	%i2,	%f28,	%f11
	movge	%xcc,	%l3,	%i6
	ldsb	[%l7 + 0x64],	%l4
	popc	0x057F,	%l2
	fbn	%fcc3,	loop_1042
	fmul8x16al	%f22,	%f22,	%f8
	fmovdge	%icc,	%f1,	%f23
	movrlz	%l5,	%l1,	%i3
loop_1042:
	taddcctv	%o0,	%g2,	%o6
	bcc,pt	%xcc,	loop_1043
	fbule	%fcc0,	loop_1044
	movvs	%icc,	%o4,	%o3
	movle	%xcc,	%o7,	%l0
loop_1043:
	fmovde	%xcc,	%f14,	%f23
loop_1044:
	movleu	%icc,	%o5,	%g5
	andncc	%i0,	%i7,	%l6
	fnegd	%f28,	%f0
	fmovdn	%icc,	%f20,	%f0
	movrne	%o2,	0x006,	%i1
	movne	%xcc,	%i4,	%g1
	nop
	setx	loop_1045,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fmovsvc	%xcc,	%f2,	%f30
	nop
	set	0x4C, %i4
	prefetch	[%l7 + %i4],	 0x2
	sdivx	%g3,	0x16F7,	%g7
loop_1045:
	fbne,a	%fcc1,	loop_1046
	fornot1s	%f9,	%f28,	%f24
	xor	%i5,	%g6,	%o1
	ldd	[%l7 + 0x40],	%f4
loop_1046:
	fcmpd	%fcc0,	%f6,	%f28
	ldd	[%l7 + 0x38],	%f24
	movl	%xcc,	%i2,	%g4
	movn	%icc,	%l3,	%l4
	edge32l	%i6,	%l5,	%l1
	fbuge	%fcc3,	loop_1047
	tn	%icc,	0x4
	std	%i2,	[%l7 + 0x20]
	fmovscs	%icc,	%f2,	%f20
loop_1047:
	fbge,a	%fcc1,	loop_1048
	fbl,a	%fcc2,	loop_1049
	fmovscc	%icc,	%f20,	%f21
	edge32n	%l2,	%o0,	%o6
loop_1048:
	movvs	%icc,	%g2,	%o3
loop_1049:
	array32	%o7,	%l0,	%o5
	srax	%g5,	0x1A,	%o4
	edge8ln	%i0,	%l6,	%o2
	udiv	%i7,	0x1A65,	%i4
	be	%icc,	loop_1050
	ldsb	[%l7 + 0x3F],	%g1
	ta	%icc,	0x7
	movleu	%xcc,	%g3,	%g7
loop_1050:
	fnor	%f6,	%f28,	%f20
	set	0x2C, %o5
	stwa	%i1,	[%l7 + %o5] 0x04
	fbul,a	%fcc0,	loop_1051
	sllx	%g6,	0x1E,	%o1
	smulcc	%i2,	0x0C8D,	%i5
	wr	%g0,	0x89,	%asi
	stda	%g4,	[%l7 + 0x28] %asi
loop_1051:
	movl	%xcc,	%l4,	%l3
	orn	%i6,	0x0DD8,	%l1
	andcc	%i3,	0x17F6,	%l5
	fbuge,a	%fcc1,	loop_1052
	tleu	%icc,	0x0
	fmovrsne	%o0,	%f24,	%f15
	nop
	set	0x18, %g5
	stx	%l2,	[%l7 + %g5]
loop_1052:
	bneg,a	loop_1053
	movvs	%icc,	%o6,	%g2
	mova	%icc,	%o3,	%l0
	movn	%icc,	%o5,	%o7
loop_1053:
	bcc,a	%xcc,	loop_1054
	edge32ln	%g5,	%o4,	%i0
	smul	%l6,	0x0920,	%o2
	fcmpeq16	%f6,	%f4,	%i7
loop_1054:
	fandnot1s	%f1,	%f0,	%f18
	edge8	%i4,	%g1,	%g3
	set	0x28, %g6
	sta	%f24,	[%l7 + %g6] 0x0c
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16	%g7,	%i1,	%g6
	tvs	%icc,	0x1
	fbo,a	%fcc3,	loop_1055
	tcc	%icc,	0x7
	xor	%i2,	%o1,	%i5
	movrlez	%g4,	0x20D,	%l3
loop_1055:
	andncc	%l4,	%i6,	%i3
	fcmpeq32	%f18,	%f20,	%l5
	fmovdn	%icc,	%f28,	%f24
	fbne,a	%fcc2,	loop_1056
	udivx	%o0,	0x0B6B,	%l2
	fone	%f22
	xor	%l1,	0x1FD2,	%g2
loop_1056:
	fmovsl	%icc,	%f14,	%f3
	tvs	%icc,	0x5
	movvs	%icc,	%o3,	%o6
	fones	%f13
	sdivcc	%o5,	0x1DDD,	%o7
	array32	%g5,	%o4,	%l0
	fpadd32	%f6,	%f2,	%f18
	fands	%f2,	%f8,	%f26
	faligndata	%f14,	%f24,	%f4
	fcmps	%fcc1,	%f12,	%f29
	movrgz	%i0,	0x076,	%l6
	ldd	[%l7 + 0x58],	%o2
	tneg	%icc,	0x7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movpos	%icc,	%i4,	%i7
	edge8	%g3,	%g1,	%g7
	sub	%i1,	0x0C78,	%i2
	sra	%o1,	0x1E,	%i5
	udivcc	%g6,	0x004F,	%g4
	tvc	%xcc,	0x7
	tg	%icc,	0x5
	andcc	%l4,	%i6,	%l3
	nop
	set	0x60, %i2
	ldd	[%l7 + %i2],	%l4
	movcs	%icc,	%i3,	%o0
	bn	%xcc,	loop_1057
	ld	[%l7 + 0x48],	%f31
	movvs	%xcc,	%l2,	%l1
	tle	%icc,	0x2
loop_1057:
	movcs	%xcc,	%o3,	%g2
	tleu	%xcc,	0x1
	fmovdgu	%icc,	%f24,	%f17
	alignaddrl	%o6,	%o5,	%g5
	fmovdne	%icc,	%f27,	%f22
	fors	%f22,	%f1,	%f29
	swap	[%l7 + 0x0C],	%o4
	movrlz	%l0,	%i0,	%l6
	mulscc	%o7,	0x1FDE,	%o2
	tsubcctv	%i4,	0x114A,	%i7
	nop
	setx	loop_1058,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	add	%g3,	%g7,	%g1
	alignaddrl	%i2,	%i1,	%o1
	set	0x52, %g7
	ldstuba	[%l7 + %g7] 0x81,	%g6
loop_1058:
	fzeros	%f16
	fmovdvs	%icc,	%f26,	%f30
	lduw	[%l7 + 0x54],	%g4
	tsubcctv	%i5,	%i6,	%l3
	add	%l5,	%i3,	%l4
	movvc	%icc,	%o0,	%l2
	mulx	%l1,	0x06D8,	%g2
	edge8	%o3,	%o5,	%g5
	bg,a,pt	%icc,	loop_1059
	taddcc	%o6,	%l0,	%o4
	xnor	%l6,	%o7,	%i0
	sth	%o2,	[%l7 + 0x14]
loop_1059:
	fands	%f13,	%f16,	%f26
	edge8l	%i4,	%g3,	%i7
	fbn,a	%fcc3,	loop_1060
	flush	%l7 + 0x18
	mulscc	%g1,	%i2,	%i1
	tn	%icc,	0x4
loop_1060:
	bpos,a,pt	%xcc,	loop_1061
	bcs,a	%icc,	loop_1062
	addc	%g7,	%g6,	%o1
	sethi	0x0E2F,	%i5
loop_1061:
	umul	%i6,	0x0F8D,	%l3
loop_1062:
	fabss	%f12,	%f26
	edge16l	%l5,	%i3,	%l4
	ba,a	loop_1063
	edge32n	%o0,	%g4,	%l2
	subccc	%g2,	%l1,	%o3
	sdivcc	%o5,	0x0606,	%o6
loop_1063:
	fmovrsgz	%g5,	%f22,	%f5
	movcc	%xcc,	%o4,	%l6
	tneg	%icc,	0x7
	membar	#Sync
	wr	%g0,	0x16,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	fmovrdlez	%o7,	%f22,	%f10
	edge32n	%i0,	%l0,	%i4
	bge,pt	%xcc,	loop_1064
	smulcc	%g3,	0x0653,	%o2
	edge16ln	%g1,	%i2,	%i7
	movleu	%xcc,	%g7,	%i1
loop_1064:
	andncc	%g6,	%o1,	%i6
	membar	0x11
	tsubcc	%l3,	%i5,	%i3
	fands	%f8,	%f3,	%f4
	array32	%l5,	%l4,	%g4
	movcc	%icc,	%l2,	%g2
	array32	%o0,	%l1,	%o3
	movpos	%xcc,	%o6,	%o5
	movleu	%icc,	%o4,	%l6
	fbule,a	%fcc1,	loop_1065
	movleu	%icc,	%g5,	%o7
	popc	0x11FC,	%i0
	alignaddrl	%i4,	%g3,	%o2
loop_1065:
	ldd	[%l7 + 0x40],	%f12
	addc	%l0,	0x0A92,	%i2
	add	%g1,	%i7,	%g7
	ldsh	[%l7 + 0x50],	%g6
	udiv	%o1,	0x1B10,	%i1
	fmuld8sux16	%f13,	%f20,	%f0
	movcc	%xcc,	%i6,	%i5
	tgu	%xcc,	0x0
	tpos	%xcc,	0x7
	taddcctv	%l3,	%i3,	%l5
	fmovdvs	%xcc,	%f10,	%f3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bne,pt	%icc,	loop_1066
	movcs	%icc,	%g4,	%l4
	array32	%g2,	%l2,	%l1
	bvs,a,pt	%icc,	loop_1067
loop_1066:
	xnor	%o3,	0x0A48,	%o0
	wr	%g0,	0x27,	%asi
	stba	%o6,	[%l7 + 0x79] %asi
	membar	#Sync
loop_1067:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsleu	%icc,	%f18,	%f18
	ble	loop_1068
	fmovdpos	%icc,	%f15,	%f3
	bgu,a	loop_1069
	edge8n	%o5,	%l6,	%g5
loop_1068:
	fmovsle	%xcc,	%f12,	%f5
	tg	%xcc,	0x1
loop_1069:
	bg	loop_1070
	smul	%o7,	0x1BBD,	%i0
	umulcc	%o4,	0x01BC,	%g3
	tcc	%icc,	0x4
loop_1070:
	move	%xcc,	%o2,	%l0
	addc	%i2,	0x15EF,	%g1
	umulcc	%i4,	0x0B99,	%g7
	wr	%g0,	0x27,	%asi
	stha	%i7,	[%l7 + 0x0E] %asi
	membar	#Sync
	tl	%xcc,	0x3
	fcmple16	%f30,	%f28,	%g6
	udivx	%i1,	0x0050,	%o1
	fpsub32s	%f14,	%f23,	%f18
	alignaddr	%i6,	%l3,	%i3
	movcs	%icc,	%l5,	%i5
	orcc	%l4,	0x0C58,	%g2
	or	%g4,	%l1,	%o3
	swap	[%l7 + 0x30],	%l2
	udiv	%o0,	0x1EF5,	%o5
	ldd	[%l7 + 0x38],	%f10
	ldsw	[%l7 + 0x20],	%l6
	sir	0x121C
	fbo,a	%fcc0,	loop_1071
	nop
	setx loop_1072, %l0, %l1
	jmpl %l1, %o6
	movrlez	%g5,	0x24E,	%o7
	nop
	set	0x64, %l2
	lduh	[%l7 + %l2],	%o4
loop_1071:
	orcc	%g3,	%o2,	%l0
loop_1072:
	movrlez	%i0,	0x274,	%g1
	fnand	%f12,	%f2,	%f20
	fmul8x16al	%f7,	%f1,	%f20
	tcc	%xcc,	0x6
	wr	%g0,	0x19,	%asi
	lduba	[%l7 + 0x3F] %asi,	%i2
	fpadd16	%f26,	%f30,	%f26
	set	0x40, %g2
	stda	%f0,	[%l7 + %g2] 0xf0
	membar	#Sync
	add	%l7,	0x68,	%l6
	wr	%g0,	0x11,	%asi
	lda	[%l6] %asi,	%g7
	casa	[%l6] 0x11,	%g7,	%i4
	fbn,a	%fcc1,	loop_1073
	fbug,a	%fcc1,	loop_1074
	movvc	%icc,	%i7,	%g6
	tneg	%icc,	0x2
loop_1073:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1074:
	sethi	0x1FE6,	%i1
	wr	%g0,	0x11,	%asi
	ldswa	[%l7 + 0x34] %asi,	%i6
	fpsub16s	%f1,	%f6,	%f25
	fbg,a	%fcc0,	loop_1075
	fbne	%fcc1,	loop_1076
	edge32	%o1,	%l3,	%l5
	nop
	set	0x64, %l1
	ldsw	[%l7 + %l1],	%i5
loop_1075:
	fzeros	%f3
loop_1076:
	swap	[%l7 + 0x38],	%l4
	tneg	%icc,	0x7
	movrlez	%g2,	0x1CA,	%g4
	fnands	%f25,	%f17,	%f18
	orn	%l1,	%o3,	%l2
	srlx	%i3,	0x10,	%o0
	fnot1	%f0,	%f30
	movneg	%icc,	%l6,	%o5
	andn	%o6,	0x19BD,	%g5
	movre	%o4,	%g3,	%o2
	edge32n	%o7,	%i0,	%g1
	bcs,pt	%xcc,	loop_1077
	fble	%fcc1,	loop_1078
	bne,a,pt	%icc,	loop_1079
	udiv	%i2,	0x044C,	%g7
loop_1077:
	fandnot1s	%f1,	%f15,	%f6
loop_1078:
	alignaddrl	%i4,	%l0,	%i7
loop_1079:
	orncc	%g6,	0x1EC6,	%i6
	bvs,a,pt	%xcc,	loop_1080
	ld	[%l7 + 0x58],	%f5
	movleu	%xcc,	%i1,	%o1
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x7C] %asi,	%l3
loop_1080:
	movcs	%icc,	%i5,	%l5
	bcc,a	%icc,	loop_1081
	fmovsvc	%xcc,	%f26,	%f26
	bl,pt	%xcc,	loop_1082
	fbu	%fcc1,	loop_1083
loop_1081:
	tg	%icc,	0x2
	tleu	%icc,	0x5
loop_1082:
	array8	%g2,	%l4,	%l1
loop_1083:
	nop
	set	0x5F, %i1
	ldsba	[%l7 + %i1] 0x04,	%g4
	bge,a,pn	%xcc,	loop_1084
	alignaddrl	%o3,	%l2,	%i3
	sdivx	%l6,	0x11A6,	%o0
	set	0x38, %o3
	prefetcha	[%l7 + %o3] 0x81,	 0x2
loop_1084:
	tg	%xcc,	0x6
	tgu	%icc,	0x2
	sdiv	%o6,	0x1256,	%g5
	fmovdcs	%xcc,	%f6,	%f12
	move	%icc,	%o4,	%g3
	tn	%xcc,	0x7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tvs	%xcc,	0x2
	bpos	%xcc,	loop_1085
	ldsh	[%l7 + 0x3C],	%o7
	edge8n	%o2,	%g1,	%i2
	movvs	%icc,	%i0,	%i4
loop_1085:
	fbne	%fcc0,	loop_1086
	faligndata	%f22,	%f2,	%f28
	bvs,a	loop_1087
	sllx	%l0,	0x0E,	%i7
loop_1086:
	tgu	%xcc,	0x6
	addcc	%g7,	%g6,	%i1
loop_1087:
	nop
	wr	%g0,	0x80,	%asi
	ldxa	[%l7 + 0x28] %asi,	%i6
	sir	0x1CF7
	fmovs	%f25,	%f16
	fpsub32	%f0,	%f8,	%f26
	sll	%o1,	0x1F,	%i5
	fpsub32	%f18,	%f14,	%f12
	fnot1	%f26,	%f6
	bcs,a,pn	%xcc,	loop_1088
	alignaddrl	%l5,	%l3,	%g2
	or	%l1,	%l4,	%g4
	array32	%l2,	%o3,	%i3
loop_1088:
	movvc	%xcc,	%o0,	%o5
	xnorcc	%l6,	0x0007,	%o6
	edge8ln	%g5,	%o4,	%g3
	edge32n	%o2,	%o7,	%g1
	bn,a	%xcc,	loop_1089
	fmovsvs	%xcc,	%f3,	%f31
	addcc	%i2,	%i4,	%l0
	ldx	[%l7 + 0x18],	%i7
loop_1089:
	addc	%i0,	0x0874,	%g7
	wr	%g0,	0x89,	%asi
	stha	%i1,	[%l7 + 0x28] %asi
	edge32ln	%i6,	%g6,	%o1
	movrlz	%l5,	%i5,	%g2
	sdivcc	%l1,	0x14D6,	%l4
	nop
	set	0x48, %o1
	std	%f30,	[%l7 + %o1]
	fpsub16s	%f26,	%f19,	%f26
	sra	%l3,	%g4,	%o3
	tne	%icc,	0x1
	set	0x08, %g4
	sta	%f17,	[%l7 + %g4] 0x88
	fpsub32s	%f0,	%f4,	%f8
	movgu	%icc,	%l2,	%o0
	edge8l	%o5,	%l6,	%o6
	fabss	%f24,	%f3
	umul	%i3,	%g5,	%g3
	tcs	%icc,	0x3
	edge8l	%o2,	%o4,	%g1
	andncc	%o7,	%i4,	%l0
	fnors	%f16,	%f28,	%f10
	sll	%i2,	0x02,	%i7
	udivcc	%i0,	0x11B6,	%i1
	srlx	%i6,	%g6,	%o1
	bne	%icc,	loop_1090
	sdivx	%l5,	0x0AC3,	%i5
	srlx	%g7,	0x12,	%g2
	bgu,a	%icc,	loop_1091
loop_1090:
	movre	%l4,	0x0A8,	%l3
	array16	%l1,	%g4,	%l2
	fbug,a	%fcc3,	loop_1092
loop_1091:
	tleu	%icc,	0x2
	tn	%icc,	0x1
	tl	%icc,	0x0
loop_1092:
	addcc	%o0,	%o5,	%o3
	smulcc	%l6,	%o6,	%g5
	sdiv	%g3,	0x13A5,	%i3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x19,	%asi
	lduha	[%l7 + 0x3E] %asi,	%o4
	fcmple16	%f8,	%f30,	%g1
	add	%l7,	0x38,	%l6
	wr	%g0,	0x0c,	%asi
	casxa	[%l6] %asi,	%o2,	%i4
	set	0x08, %i0
	prefetcha	[%l7 + %i0] 0x0c,	 0x3
	xorcc	%i2,	%l0,	%i0
	and	%i1,	0x0B7B,	%i6
	smulcc	%i7,	%o1,	%g6
	fpadd16	%f28,	%f16,	%f0
	tvs	%xcc,	0x2
	movrlz	%l5,	%g7,	%i5
	tvc	%icc,	0x3
	fpackfix	%f28,	%f30
	sll	%l4,	0x11,	%g2
	brlez	%l1,	loop_1093
	tcc	%icc,	0x1
	bl,pn	%xcc,	loop_1094
	tge	%icc,	0x7
loop_1093:
	tn	%icc,	0x6
	tcs	%icc,	0x3
loop_1094:
	orcc	%g4,	%l2,	%o0
	movcc	%icc,	%o5,	%o3
	fmovsa	%xcc,	%f7,	%f4
	movcc	%icc,	%l3,	%l6
	wr	%g0,	0x89,	%asi
	stda	%o6,	[%l7 + 0x48] %asi
	ldub	[%l7 + 0x1B],	%g5
	sethi	0x00DC,	%g3
	fcmpeq32	%f4,	%f16,	%o4
	tge	%xcc,	0x5
	alignaddrl	%g1,	%i3,	%o2
	bcc	loop_1095
	edge32l	%i4,	%i2,	%o7
	addcc	%l0,	0x0403,	%i1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1095:
	tvc	%xcc,	0x2
	movvc	%xcc,	%i6,	%i0
	movrgez	%i7,	%o1,	%l5
	array16	%g6,	%i5,	%g7
	smulcc	%l4,	0x1EF6,	%g2
	srl	%l1,	0x08,	%l2
	taddcc	%g4,	%o5,	%o3
	andcc	%o0,	%l6,	%l3
	edge16n	%g5,	%g3,	%o6
	movcc	%icc,	%o4,	%i3
	set	0x60, %l3
	stxa	%o2,	[%l7 + %l3] 0x15
	bge,pn	%xcc,	loop_1096
	fmovrdgez	%i4,	%f18,	%f28
	alignaddr	%g1,	%o7,	%l0
	addc	%i1,	0x0D88,	%i2
loop_1096:
	fnands	%f25,	%f11,	%f19
	xorcc	%i6,	%i0,	%o1
	movrne	%l5,	%i7,	%g6
	orn	%g7,	%i5,	%g2
	ld	[%l7 + 0x10],	%f26
	andn	%l1,	0x0F99,	%l4
	addcc	%g4,	0x1AD3,	%l2
	sdiv	%o5,	0x1210,	%o0
	movne	%icc,	%o3,	%l6
	fbe	%fcc3,	loop_1097
	orncc	%l3,	%g5,	%o6
	membar	0x61
	edge32l	%g3,	%i3,	%o4
loop_1097:
	fbug	%fcc3,	loop_1098
	ta	%xcc,	0x3
	smul	%i4,	%o2,	%o7
	xnorcc	%g1,	%l0,	%i2
loop_1098:
	udiv	%i6,	0x0C46,	%i1
	fmuld8ulx16	%f10,	%f24,	%f30
	fmovsvs	%icc,	%f30,	%f11
	flush	%l7 + 0x6C
	sra	%o1,	0x19,	%l5
	wr	%g0,	0x81,	%asi
	stha	%i7,	[%l7 + 0x58] %asi
	sllx	%i0,	%g6,	%i5
	add	%l7,	0x68,	%l6
	wr	%g0,	0x18,	%asi
	casxa	[%l6] %asi,	%g2,	%g7
	edge8n	%l1,	%l4,	%g4
	movpos	%xcc,	%l2,	%o5
	addcc	%o0,	0x13EF,	%l6
	xnorcc	%o3,	0x03A0,	%l3
	addcc	%g5,	0x0E58,	%g3
	tvs	%xcc,	0x6
	set	0x68, %g3
	stxa	%i3,	[%l7 + %g3] 0x27
	membar	#Sync
	brz	%o6,	loop_1099
	sub	%o4,	0x0FB0,	%i4
	sub	%o2,	%o7,	%g1
	sdivcc	%i2,	0x01A8,	%i6
loop_1099:
	movcc	%icc,	%i1,	%o1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	membar	0x58
	fmovde	%xcc,	%f20,	%f14
	xnor	%l5,	%i7,	%i0
	fpsub32s	%f0,	%f10,	%f21
	fexpand	%f8,	%f10
	brlz,a	%l0,	loop_1100
	edge16	%g6,	%g2,	%g7
	fandnot2s	%f23,	%f15,	%f31
	edge32n	%l1,	%i5,	%l4
loop_1100:
	sllx	%l2,	0x0C,	%o5
	brgez,a	%o0,	loop_1101
	sub	%g4,	%o3,	%l3
	umul	%g5,	0x1A46,	%l6
	movrlez	%g3,	%o6,	%i3
loop_1101:
	bn,a,pn	%xcc,	loop_1102
	fmovdvc	%icc,	%f28,	%f11
	array32	%o4,	%o2,	%o7
	siam	0x3
loop_1102:
	fmovdn	%icc,	%f25,	%f21
	bl,a,pn	%icc,	loop_1103
	alignaddr	%g1,	%i2,	%i4
	mulx	%i1,	0x1426,	%o1
	movrlz	%i6,	%l5,	%i0
loop_1103:
	fmovrslz	%l0,	%f26,	%f20
	fnot1s	%f20,	%f18
	addcc	%g6,	%i7,	%g2
	movpos	%icc,	%l1,	%g7
	xorcc	%i5,	0x0643,	%l2
	fpadd16s	%f23,	%f25,	%f13
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array8	%l4,	%o5,	%o0
	popc	%o3,	%g4
	mulscc	%g5,	0x0D59,	%l3
	fornot1s	%f0,	%f25,	%f11
	movle	%icc,	%g3,	%l6
	edge32ln	%o6,	%o4,	%o2
	wr	%g0,	0x19,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	edge32n	%o7,	%g1,	%i2
	bg,a,pn	%icc,	loop_1104
	fsrc2s	%f20,	%f5
	fmovdleu	%xcc,	%f9,	%f12
	ldsw	[%l7 + 0x6C],	%i4
loop_1104:
	subc	%i1,	0x0F2A,	%o1
	fmovsl	%xcc,	%f11,	%f31
	ba,a,pn	%icc,	loop_1105
	te	%icc,	0x6
	movn	%icc,	%i3,	%i6
	tleu	%icc,	0x4
loop_1105:
	nop
	wr	%g0,	0x88,	%asi
	ldstuba	[%l7 + 0x0A] %asi,	%l5
	srlx	%l0,	%i0,	%i7
	std	%g2,	[%l7 + 0x40]
	wr	%g0,	0x88,	%asi
	sta	%f19,	[%l7 + 0x30] %asi
	movle	%icc,	%l1,	%g6
	fmuld8sux16	%f17,	%f5,	%f30
	tpos	%xcc,	0x7
	call	loop_1106
	movleu	%icc,	%i5,	%g7
	fbg,a	%fcc2,	loop_1107
	tpos	%icc,	0x4
loop_1106:
	tgu	%xcc,	0x7
	tleu	%xcc,	0x4
loop_1107:
	fmul8ulx16	%f28,	%f16,	%f16
	fmovdvc	%icc,	%f24,	%f26
	fmovrdgz	%l2,	%f30,	%f2
	brgez	%l4,	loop_1108
	edge8ln	%o0,	%o5,	%o3
	bne	loop_1109
	tneg	%xcc,	0x4
loop_1108:
	fpack16	%f16,	%f29
	bge,a,pt	%xcc,	loop_1110
loop_1109:
	subcc	%g4,	0x1514,	%l3
	edge8n	%g3,	%l6,	%g5
	sdivx	%o6,	0x0188,	%o4
loop_1110:
	movcs	%xcc,	%o2,	%o7
	tleu	%icc,	0x7
	fcmple32	%f4,	%f2,	%i2
	alignaddr	%g1,	%i4,	%o1
	ble	%icc,	loop_1111
	fmovrsgz	%i1,	%f24,	%f19
	add	%i6,	0x18C4,	%i3
	ldx	[%l7 + 0x30],	%l0
loop_1111:
	edge32l	%l5,	%i0,	%i7
	membar	0x7E
	fands	%f10,	%f17,	%f31
	edge32l	%l1,	%g6,	%g2
	fandnot1s	%f20,	%f3,	%f5
	sethi	0x049A,	%i5
	movleu	%xcc,	%g7,	%l4
	movpos	%icc,	%l2,	%o0
	subc	%o5,	%g4,	%l3
	add	%g3,	0x0978,	%l6
	sethi	0x067A,	%o3
	set	0x7C, %o6
	stha	%g5,	[%l7 + %o6] 0x0c
	edge32n	%o4,	%o6,	%o7
	fbne,a	%fcc2,	loop_1112
	brlez	%o2,	loop_1113
	edge16	%i2,	%g1,	%o1
	call	loop_1114
loop_1112:
	fmovdg	%icc,	%f9,	%f12
loop_1113:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnegs	%f10,	%f26
loop_1114:
	fmovsge	%icc,	%f5,	%f24
	for	%f8,	%f4,	%f30
	srl	%i1,	0x01,	%i6
	bpos,a	loop_1115
	ldx	[%l7 + 0x18],	%i3
	fnot2	%f20,	%f12
	bpos,a,pn	%xcc,	loop_1116
loop_1115:
	add	%i4,	0x05BF,	%l5
	wr	%g0,	0x89,	%asi
	swapa	[%l7 + 0x0C] %asi,	%i0
loop_1116:
	addc	%i7,	0x020F,	%l0
	fmovscs	%xcc,	%f25,	%f24
	tsubcctv	%l1,	0x0D03,	%g2
	andcc	%i5,	%g6,	%l4
	nop
	set	0x08, %o2
	std	%f16,	[%l7 + %o2]
	bne,a	%icc,	loop_1117
	fmovde	%xcc,	%f8,	%f25
	movl	%icc,	%g7,	%o0
	tvs	%icc,	0x3
loop_1117:
	fbu	%fcc1,	loop_1118
	addccc	%o5,	0x1BF1,	%g4
	sir	0x1ED9
	fmul8x16al	%f4,	%f5,	%f20
loop_1118:
	mulscc	%l2,	0x03FB,	%l3
	fxor	%f0,	%f26,	%f2
	membar	0x6A
	fmovdle	%icc,	%f30,	%f10
	andncc	%g3,	%l6,	%o3
	edge8n	%o4,	%g5,	%o7
	sethi	0x1B32,	%o6
	wr	%g0,	0xea,	%asi
	stwa	%o2,	[%l7 + 0x2C] %asi
	membar	#Sync
	set	0x6C, %l0
	swapa	[%l7 + %l0] 0x80,	%g1
	sub	%o1,	0x152B,	%i2
	fcmpgt32	%f6,	%f10,	%i1
	tcs	%xcc,	0x4
	wr	%g0,	0x18,	%asi
	stba	%i3,	[%l7 + 0x7C] %asi
	nop
	setx	loop_1119,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	udivx	%i4,	0x1FE2,	%l5
	mulx	%i6,	%i7,	%i0
	tn	%icc,	0x6
loop_1119:
	te	%xcc,	0x4
	sra	%l0,	0x1E,	%g2
	fmovda	%xcc,	%f22,	%f17
	stw	%l1,	[%l7 + 0x74]
	sll	%i5,	0x0A,	%l4
	subc	%g7,	%g6,	%o5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbug,a	%fcc2,	loop_1120
	ble	loop_1121
	edge8n	%g4,	%o0,	%l3
	fpadd32	%f18,	%f2,	%f20
loop_1120:
	bneg,a	loop_1122
loop_1121:
	fmovdle	%icc,	%f23,	%f5
	orn	%g3,	%l2,	%l6
	alignaddr	%o4,	%g5,	%o3
loop_1122:
	bl,a	loop_1123
	edge8n	%o6,	%o7,	%g1
	tgu	%xcc,	0x2
	fmovdcs	%xcc,	%f15,	%f7
loop_1123:
	edge8n	%o2,	%o1,	%i1
	array32	%i3,	%i2,	%i4
	taddcctv	%l5,	%i7,	%i0
	te	%xcc,	0x0
	edge16l	%i6,	%l0,	%l1
	xnor	%g2,	%i5,	%g7
	bn	loop_1124
	orncc	%l4,	0x081E,	%g6
	ldsw	[%l7 + 0x40],	%g4
	fnegd	%f10,	%f0
loop_1124:
	movn	%icc,	%o5,	%o0
	fmuld8sux16	%f4,	%f5,	%f14
	edge8l	%l3,	%l2,	%g3
	ldstub	[%l7 + 0x08],	%l6
	array16	%o4,	%g5,	%o3
	nop
	setx	loop_1125,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	ldx	[%l7 + 0x28],	%o7
	movcs	%xcc,	%o6,	%o2
	fmovrdlz	%o1,	%f20,	%f18
loop_1125:
	movvs	%xcc,	%g1,	%i1
	tsubcctv	%i2,	0x0109,	%i4
	srlx	%i3,	%i7,	%i0
	tvc	%xcc,	0x7
	andncc	%i6,	%l0,	%l1
	tge	%xcc,	0x3
	fcmpgt32	%f8,	%f8,	%l5
	prefetch	[%l7 + 0x74],	 0x1
	add	%l7,	0x48,	%l6
	wr	%g0,	0x11,	%asi
	ldxa	[%l6] %asi,	%g2
	casxa	[%l6] 0x11,	%g2,	%i5
	sdiv	%l4,	0x13B4,	%g6
	subcc	%g7,	%o5,	%o0
	srax	%l3,	%l2,	%g4
	andn	%g3,	%o4,	%l6
	udiv	%o3,	0x1EA6,	%g5
	tleu	%xcc,	0x5
	fbul,a	%fcc0,	loop_1126
	umulcc	%o7,	%o2,	%o6
	xor	%o1,	%i1,	%g1
	tcs	%icc,	0x0
loop_1126:
	nop
	set	0x56, %i6
	ldsha	[%l7 + %i6] 0x80,	%i2
	srlx	%i3,	%i7,	%i0
	fbne	%fcc0,	loop_1127
	sra	%i6,	%l0,	%i4
	sra	%l1,	%l5,	%i5
	nop
	setx	loop_1128,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_1127:
	xorcc	%g2,	%l4,	%g7
	bcc,a,pt	%xcc,	loop_1129
	alignaddr	%o5,	%g6,	%o0
loop_1128:
	subcc	%l3,	%l2,	%g3
	bcs,a,pn	%xcc,	loop_1130
loop_1129:
	andcc	%g4,	0x1C6F,	%l6
	pdist	%f30,	%f22,	%f20
	fmovdvc	%xcc,	%f4,	%f9
loop_1130:
	fone	%f6
	edge8	%o4,	%o3,	%g5
	stbar
	tsubcc	%o7,	%o2,	%o1
	alignaddr	%i1,	%o6,	%g1
	movrgez	%i3,	%i2,	%i7
	prefetch	[%l7 + 0x4C],	 0x2
	bgu,a	loop_1131
	fblg,a	%fcc2,	loop_1132
	brz,a	%i0,	loop_1133
	bl	loop_1134
loop_1131:
	tcs	%xcc,	0x1
loop_1132:
	ldstub	[%l7 + 0x3B],	%i6
loop_1133:
	edge16n	%i4,	%l0,	%l1
loop_1134:
	tpos	%icc,	0x7
	fmovdcc	%xcc,	%f16,	%f12
	fnegs	%f18,	%f24
	subcc	%l5,	%g2,	%l4
	bge	loop_1135
	tneg	%icc,	0x5
	tge	%icc,	0x4
	fsrc1	%f16,	%f2
loop_1135:
	ldd	[%l7 + 0x38],	%i4
	sub	%o5,	0x11DF,	%g6
	wr	%g0,	0x10,	%asi
	lduha	[%l7 + 0x4A] %asi,	%g7
	fandnot2s	%f14,	%f28,	%f27
	bgu	loop_1136
	udivx	%o0,	0x1E4A,	%l3
	wr	%g0,	0x80,	%asi
	lduwa	[%l7 + 0x54] %asi,	%g3
loop_1136:
	movrgez	%g4,	%l2,	%o4
	andn	%l6,	%g5,	%o3
	edge16ln	%o2,	%o1,	%i1
	sethi	0x0825,	%o6
	brgz,a	%o7,	loop_1137
	move	%xcc,	%i3,	%i2
	fzero	%f20
	movneg	%icc,	%i7,	%g1
loop_1137:
	bg,pt	%icc,	loop_1138
	smulcc	%i0,	%i6,	%i4
	andcc	%l0,	%l1,	%g2
	tcs	%xcc,	0x4
loop_1138:
	tvc	%icc,	0x5
	fbug	%fcc0,	loop_1139
	movrlz	%l4,	0x308,	%i5
	fblg	%fcc3,	loop_1140
	tneg	%xcc,	0x5
loop_1139:
	stx	%l5,	[%l7 + 0x28]
	tvs	%xcc,	0x7
loop_1140:
	xnor	%o5,	0x09D9,	%g6
	ldsw	[%l7 + 0x2C],	%g7
	fpsub32	%f0,	%f22,	%f20
	sll	%o0,	0x0E,	%l3
	edge16l	%g4,	%g3,	%l2
	te	%icc,	0x2
	wr	%g0,	0x88,	%asi
	prefetcha	[%l7 + 0x10] %asi,	 0x1
	tle	%xcc,	0x5
	nop
	setx	loop_1141,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fandnot1s	%f16,	%f14,	%f8
	mulx	%l6,	%g5,	%o3
	fmovrsne	%o2,	%f22,	%f23
loop_1141:
	sllx	%o1,	0x02,	%i1
	tvs	%xcc,	0x1
	tne	%icc,	0x0
	ta	%xcc,	0x4
	be,pt	%icc,	loop_1142
	std	%f4,	[%l7 + 0x70]
	movn	%xcc,	%o7,	%i3
	tcc	%xcc,	0x2
loop_1142:
	fbu	%fcc2,	loop_1143
	fandnot2s	%f9,	%f23,	%f21
	array32	%o6,	%i7,	%g1
	fcmps	%fcc1,	%f15,	%f23
loop_1143:
	movne	%xcc,	%i2,	%i6
	siam	0x6
	or	%i4,	%l0,	%l1
	movrlez	%g2,	0x009,	%l4
	movg	%icc,	%i0,	%i5
	tpos	%xcc,	0x0
	umul	%l5,	0x10E0,	%g6
	membar	0x1F
	movge	%icc,	%g7,	%o0
	brgz	%o5,	loop_1144
	siam	0x7
	edge32n	%g4,	%g3,	%l3
	nop
	setx loop_1145, %l0, %l1
	jmpl %l1, %o4
loop_1144:
	alignaddrl	%l2,	%g5,	%l6
	te	%icc,	0x1
	sllx	%o3,	0x1E,	%o2
loop_1145:
	xorcc	%i1,	0x1D8F,	%o7
	sll	%o1,	0x00,	%o6
	edge16ln	%i7,	%g1,	%i2
	smul	%i3,	%i4,	%l0
	fcmps	%fcc2,	%f13,	%f31
	add	%l1,	0x1CBD,	%i6
	set	0x74, %g1
	stwa	%g2,	[%l7 + %g1] 0x80
	edge32l	%l4,	%i0,	%i5
	fzeros	%f28
	alignaddrl	%l5,	%g7,	%g6
	ldsw	[%l7 + 0x68],	%o0
	fnand	%f6,	%f16,	%f18
	fnegd	%f14,	%f22
	alignaddr	%g4,	%g3,	%l3
	or	%o4,	0x0992,	%l2
	xnor	%o5,	0x1008,	%l6
	sub	%o3,	0x1300,	%o2
	fmovdg	%icc,	%f28,	%f1
	ldstub	[%l7 + 0x6B],	%i1
	andcc	%g5,	0x103C,	%o7
	fmovdgu	%xcc,	%f24,	%f17
	fmovdl	%xcc,	%f5,	%f24
	sir	0x148A
	fmuld8sux16	%f2,	%f3,	%f12
	movcc	%icc,	%o1,	%o6
	bvs	loop_1146
	movneg	%xcc,	%i7,	%i2
	edge16n	%i3,	%g1,	%i4
	array16	%l0,	%i6,	%l1
loop_1146:
	tne	%icc,	0x5
	wr	%g0,	0x89,	%asi
	stwa	%l4,	[%l7 + 0x2C] %asi
	call	loop_1147
	alignaddrl	%g2,	%i5,	%i0
	sdiv	%l5,	0x1791,	%g6
	subc	%o0,	0x16A8,	%g4
loop_1147:
	sdivcc	%g3,	0x076A,	%g7
	ldsb	[%l7 + 0x77],	%l3
	udivx	%l2,	0x1F89,	%o4
	sdivx	%o5,	0x0F65,	%o3
	andn	%o2,	0x06B0,	%l6
	andncc	%i1,	%g5,	%o1
	set	0x44, %l4
	sta	%f19,	[%l7 + %l4] 0x15
	edge32l	%o6,	%o7,	%i7
	nop
	setx	loop_1148,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	edge32l	%i2,	%g1,	%i4
	ldsw	[%l7 + 0x3C],	%l0
	tneg	%icc,	0x3
loop_1148:
	udivx	%i3,	0x17C2,	%l1
	edge32	%i6,	%g2,	%i5
	fbne,a	%fcc3,	loop_1149
	bg	%xcc,	loop_1150
	edge16	%l4,	%i0,	%g6
	bge,pn	%icc,	loop_1151
loop_1149:
	sllx	%o0,	%g4,	%g3
loop_1150:
	tcc	%icc,	0x2
	fbn,a	%fcc3,	loop_1152
loop_1151:
	membar	0x4A
	sir	0x0D17
	xorcc	%g7,	0x1806,	%l5
loop_1152:
	nop
	setx	loop_1153,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movpos	%icc,	%l3,	%o4
	fbl,a	%fcc3,	loop_1154
	edge16ln	%l2,	%o3,	%o5
loop_1153:
	fcmpeq32	%f24,	%f22,	%l6
	tgu	%icc,	0x1
loop_1154:
	movrne	%o2,	%i1,	%o1
	sir	0x0177
	fandnot2s	%f9,	%f8,	%f15
	fmovdneg	%xcc,	%f23,	%f22
	movpos	%icc,	%o6,	%g5
	fcmpeq16	%f22,	%f30,	%i7
	nop
	setx loop_1155, %l0, %l1
	jmpl %l1, %i2
	edge16l	%g1,	%o7,	%l0
	bg	loop_1156
	alignaddrl	%i4,	%i3,	%i6
loop_1155:
	brgz,a	%g2,	loop_1157
	smulcc	%l1,	%l4,	%i5
loop_1156:
	membar	0x45
	subccc	%g6,	%o0,	%g4
loop_1157:
	sethi	0x0623,	%i0
	tcs	%icc,	0x0
	fmovscs	%xcc,	%f9,	%f19
	and	%g7,	%g3,	%l3
	wr	%g0,	0x11,	%asi
	swapa	[%l7 + 0x4C] %asi,	%o4
	st	%f2,	[%l7 + 0x64]
	movne	%icc,	%l2,	%l5
	edge16ln	%o5,	%l6,	%o3
	membar	#Sync
	set	0x40, %o0
	ldda	[%l7 + %o0] 0xf8,	%f0
	sll	%i1,	0x17,	%o2
	fmovrsgez	%o6,	%f7,	%f31
	fnot2s	%f20,	%f21
	andn	%g5,	%i7,	%i2
	st	%f7,	[%l7 + 0x14]
	fors	%f28,	%f23,	%f31
	fbuge	%fcc0,	loop_1158
	fmovrslz	%g1,	%f0,	%f28
	movrlz	%o7,	0x171,	%l0
	subccc	%i4,	0x1970,	%o1
loop_1158:
	tn	%xcc,	0x5
	set	0x25, %i7
	ldstuba	[%l7 + %i7] 0x89,	%i3
	movvs	%xcc,	%i6,	%l1
	array32	%g2,	%l4,	%g6
	edge32l	%i5,	%o0,	%g4
	fpackfix	%f22,	%f28
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32l	%g7,	%i0,	%l3
	tl	%icc,	0x2
	fnegd	%f28,	%f0
	fbu,a	%fcc2,	loop_1159
	ldub	[%l7 + 0x28],	%g3
	membar	0x5D
	orcc	%l2,	%o4,	%o5
loop_1159:
	nop
	add	%l7,	0x28,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] %asi,	%l6,	%o3
	srlx	%i1,	0x1A,	%o2
	fandnot2	%f6,	%f16,	%f22
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8n	%l5,	%o6,	%g5
	fmovrslez	%i7,	%f21,	%f14
	tsubcctv	%i2,	0x0A7F,	%g1
	fmovdn	%xcc,	%f19,	%f16
	tvs	%xcc,	0x4
	fbug	%fcc3,	loop_1160
	movge	%xcc,	%l0,	%o7
	tleu	%xcc,	0x2
	tle	%xcc,	0x7
loop_1160:
	xorcc	%i4,	%i3,	%o1
	fmovdle	%icc,	%f13,	%f13
	fmovda	%icc,	%f18,	%f17
	sll	%l1,	%g2,	%i6
	subcc	%g6,	%i5,	%o0
	movl	%icc,	%g4,	%g7
	ld	[%l7 + 0x34],	%f21
	movpos	%xcc,	%l4,	%l3
	set	0x08, %o7
	stba	%i0,	[%l7 + %o7] 0x10
	sdiv	%l2,	0x0CCB,	%g3
	alignaddrl	%o4,	%o5,	%l6
	edge8ln	%i1,	%o2,	%l5
	fblg	%fcc2,	loop_1161
	tsubcctv	%o6,	0x1AE3,	%g5
	te	%xcc,	0x7
	membar	0x4C
loop_1161:
	tcs	%icc,	0x7
	fxnors	%f8,	%f22,	%f0
	fnegs	%f23,	%f3
	movne	%icc,	%i7,	%o3
	edge32l	%g1,	%l0,	%i2
	ta	%icc,	0x1
	fmovrse	%o7,	%f2,	%f6
	call	loop_1162
	fcmpd	%fcc3,	%f8,	%f4
	te	%xcc,	0x3
	bvc,a	%icc,	loop_1163
loop_1162:
	sllx	%i4,	0x0A,	%i3
	fnegd	%f16,	%f22
	orncc	%l1,	%o1,	%i6
loop_1163:
	tvs	%icc,	0x4
	fmovdcs	%icc,	%f26,	%f12
	addcc	%g6,	0x0735,	%i5
	tcs	%icc,	0x7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movg	%xcc,	%g2,	%o0
	fmovdvs	%icc,	%f5,	%f9
	tcc	%icc,	0x1
	sdivx	%g7,	0x04D4,	%g4
	ble,pn	%icc,	loop_1164
	alignaddr	%l3,	%i0,	%l2
	bg,a	loop_1165
	udivcc	%g3,	0x12D7,	%l4
loop_1164:
	orcc	%o4,	%l6,	%o5
	movrlz	%i1,	%o2,	%l5
loop_1165:
	edge8n	%o6,	%g5,	%o3
	movne	%xcc,	%i7,	%l0
	mulscc	%g1,	%i2,	%o7
	tsubcctv	%i3,	0x146E,	%l1
	fpmerge	%f28,	%f19,	%f16
	fbo,a	%fcc3,	loop_1166
	subccc	%o1,	0x1394,	%i6
	fpadd16s	%f24,	%f17,	%f20
	orcc	%i4,	0x117D,	%i5
loop_1166:
	fpsub32	%f30,	%f26,	%f30
	movpos	%xcc,	%g6,	%g2
	brz,a	%o0,	loop_1167
	fmovs	%f8,	%f8
	mulscc	%g4,	%g7,	%i0
	fbne,a	%fcc0,	loop_1168
loop_1167:
	fmovrdgez	%l3,	%f0,	%f18
	fble,a	%fcc0,	loop_1169
	addccc	%g3,	%l4,	%o4
loop_1168:
	movcs	%icc,	%l6,	%o5
	std	%l2,	[%l7 + 0x48]
loop_1169:
	tvc	%xcc,	0x0
	movcc	%xcc,	%o2,	%l5
	srlx	%o6,	0x0A,	%i1
	fbu	%fcc0,	loop_1170
	movre	%o3,	0x159,	%i7
	udiv	%g5,	0x0423,	%g1
	sub	%i2,	%o7,	%l0
loop_1170:
	orn	%i3,	0x1520,	%l1
	wr	%g0,	0x0c,	%asi
	lduba	[%l7 + 0x67] %asi,	%i6
	edge16ln	%i4,	%o1,	%g6
	ble	loop_1171
	or	%i5,	0x1A22,	%o0
	subccc	%g2,	0x06E5,	%g4
	set	0x10, %i3
	stda	%i0,	[%l7 + %i3] 0xea
	membar	#Sync
loop_1171:
	bcc,a,pt	%icc,	loop_1172
	taddcctv	%l3,	0x1B5B,	%g3
	fmovs	%f23,	%f12
	fmovdge	%xcc,	%f24,	%f26
loop_1172:
	edge32ln	%l4,	%o4,	%l6
	fpadd16	%f16,	%f22,	%f4
	tl	%icc,	0x7
	mulscc	%o5,	%l2,	%g7
	wr	%g0,	0x22,	%asi
	ldda	[%l7 + 0x70] %asi,	%l4
	edge32n	%o6,	%o2,	%o3
	nop
	setx	loop_1173,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	srlx	%i1,	0x19,	%g5
	andncc	%i7,	%g1,	%i2
	array8	%l0,	%i3,	%o7
loop_1173:
	sir	0x077B
	fnands	%f27,	%f23,	%f25
	edge8l	%l1,	%i4,	%o1
	movvc	%icc,	%g6,	%i5
	move	%xcc,	%i6,	%o0
	ble,pt	%icc,	loop_1174
	bcs,a	loop_1175
	movvs	%xcc,	%g4,	%g2
	taddcc	%i0,	0x1029,	%g3
loop_1174:
	stw	%l4,	[%l7 + 0x58]
loop_1175:
	movrgz	%o4,	0x3D3,	%l6
	edge8ln	%l3,	%o5,	%l2
	ta	%icc,	0x2
	edge8	%g7,	%l5,	%o6
	fnands	%f1,	%f9,	%f5
	sllx	%o3,	0x04,	%o2
	andn	%i1,	%g5,	%i7
	bcc,a,pn	%xcc,	loop_1176
	movrgez	%i2,	%g1,	%l0
	tcc	%xcc,	0x4
	stbar
loop_1176:
	membar	0x05
	movre	%o7,	0x21C,	%l1
	fmovsg	%icc,	%f3,	%f29
	fandnot2s	%f4,	%f11,	%f29
	prefetch	[%l7 + 0x64],	 0x2
	fpack16	%f12,	%f8
	fpsub32s	%f23,	%f24,	%f24
	xor	%i3,	%i4,	%o1
	fsrc1s	%f22,	%f20
	fmovrdlz	%i5,	%f26,	%f24
	array32	%i6,	%g6,	%g4
	te	%icc,	0x2
	fbg,a	%fcc1,	loop_1177
	membar	0x38
	edge16	%o0,	%i0,	%g2
	bne,pt	%xcc,	loop_1178
loop_1177:
	addccc	%l4,	%g3,	%l6
	umulcc	%l3,	%o5,	%o4
	edge32ln	%g7,	%l5,	%o6
loop_1178:
	nop
	set	0x14, %o4
	ldswa	[%l7 + %o4] 0x88,	%o3
	fmovsg	%xcc,	%f12,	%f18
	tvs	%xcc,	0x2
	lduw	[%l7 + 0x18],	%l2
	movcc	%icc,	%o2,	%i1
	edge32	%g5,	%i2,	%g1
	subcc	%i7,	0x0A00,	%l0
	tgu	%xcc,	0x5
	taddcc	%l1,	%o7,	%i3
	fmovdleu	%icc,	%f27,	%f21
	tpos	%icc,	0x4
	bn,pt	%icc,	loop_1179
	sdiv	%o1,	0x1DA5,	%i4
	tvs	%xcc,	0x7
	fmovsle	%icc,	%f6,	%f28
loop_1179:
	fmovdg	%icc,	%f31,	%f5
	fbn,a	%fcc1,	loop_1180
	movrlez	%i6,	0x387,	%i5
	stbar
	mulx	%g6,	0x00DC,	%o0
loop_1180:
	movl	%xcc,	%i0,	%g4
	prefetch	[%l7 + 0x0C],	 0x1
	tvs	%xcc,	0x3
	orcc	%l4,	%g2,	%l6
	faligndata	%f2,	%f28,	%f16
	movpos	%icc,	%l3,	%g3
	movge	%icc,	%o4,	%g7
	sir	0x03B4
	fbo,a	%fcc3,	loop_1181
	fmovdvc	%icc,	%f1,	%f27
	array16	%l5,	%o5,	%o6
	fbule	%fcc3,	loop_1182
loop_1181:
	fmovsvs	%xcc,	%f11,	%f27
	movn	%xcc,	%o3,	%l2
	prefetch	[%l7 + 0x20],	 0x0
loop_1182:
	bpos,a	%xcc,	loop_1183
	sllx	%i1,	%o2,	%g5
	edge16l	%g1,	%i2,	%i7
	fmovrdne	%l1,	%f20,	%f10
loop_1183:
	edge16	%o7,	%l0,	%o1
	fmovscs	%xcc,	%f6,	%f9
	sethi	0x03BA,	%i4
	fbg	%fcc2,	loop_1184
	and	%i3,	%i6,	%g6
	ba,a	loop_1185
	tpos	%icc,	0x5
loop_1184:
	fpadd16	%f20,	%f24,	%f8
	fbuge	%fcc2,	loop_1186
loop_1185:
	movvc	%icc,	%i5,	%o0
	xor	%i0,	0x1F22,	%g4
	movrgez	%l4,	%g2,	%l6
loop_1186:
	nop
	wr	%g0,	0x80,	%asi
	ldstuba	[%l7 + 0x4F] %asi,	%l3
	fnot1	%f24,	%f18
	movvc	%xcc,	%g3,	%g7
	fnand	%f12,	%f2,	%f4
	mulx	%o4,	0x1231,	%l5
	brz	%o5,	loop_1187
	fpackfix	%f18,	%f18
	fmovrslez	%o3,	%f21,	%f21
	tsubcc	%l2,	%o6,	%o2
loop_1187:
	taddcc	%i1,	%g5,	%i2
	edge16l	%i7,	%l1,	%g1
	fmovdvs	%icc,	%f10,	%f19
	fmovsvs	%icc,	%f8,	%f4
	swap	[%l7 + 0x4C],	%l0
	brlez	%o1,	loop_1188
	xor	%i4,	%i3,	%o7
	fmovsn	%icc,	%f21,	%f10
	mova	%xcc,	%g6,	%i6
loop_1188:
	sra	%o0,	0x0B,	%i0
	smul	%i5,	0x10AA,	%g4
	fmuld8sux16	%f14,	%f8,	%f0
	xorcc	%g2,	%l4,	%l6
	smul	%l3,	%g3,	%o4
	movl	%icc,	%l5,	%g7
	fnands	%f15,	%f1,	%f3
	fpadd32	%f24,	%f12,	%f12
	udivx	%o3,	0x0EC8,	%o5
	fsrc2	%f20,	%f26
	sethi	0x089F,	%l2
	te	%xcc,	0x4
	orn	%o2,	0x173A,	%i1
	subccc	%g5,	0x1C4C,	%o6
	tg	%icc,	0x6
	tsubcc	%i7,	0x0169,	%l1
	fxors	%f20,	%f20,	%f3
	edge16n	%i2,	%g1,	%l0
	add	%i4,	%o1,	%i3
	movle	%xcc,	%o7,	%i6
	fmovrde	%g6,	%f12,	%f8
	tvc	%xcc,	0x1
	srlx	%i0,	0x0C,	%o0
	movg	%xcc,	%g4,	%i5
	array8	%g2,	%l6,	%l4
	bgu,a,pt	%icc,	loop_1189
	fzeros	%f28
	fpadd32	%f4,	%f2,	%f0
	movleu	%xcc,	%g3,	%l3
loop_1189:
	xorcc	%o4,	%l5,	%o3
	array16	%o5,	%l2,	%g7
	fcmpeq16	%f12,	%f26,	%o2
	fnegd	%f22,	%f20
	bgu,a	loop_1190
	umul	%g5,	0x1DBD,	%i1
	sdivcc	%i7,	0x1B9D,	%o6
	smulcc	%l1,	%i2,	%g1
loop_1190:
	tg	%xcc,	0x3
	udivx	%i4,	0x0EF4,	%l0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16l	%o1,	%o7,	%i6
	tsubcctv	%g6,	0x14BE,	%i3
	orcc	%o0,	0x031A,	%g4
	srax	%i0,	0x03,	%g2
	udiv	%i5,	0x0C88,	%l4
	sdivx	%l6,	0x1077,	%l3
	movcs	%icc,	%o4,	%l5
	tneg	%icc,	0x0
	tcc	%icc,	0x7
	fpsub16s	%f24,	%f25,	%f14
	fba,a	%fcc0,	loop_1191
	fmovdg	%xcc,	%f25,	%f19
	siam	0x7
	tle	%xcc,	0x2
loop_1191:
	fmovsvs	%xcc,	%f25,	%f28
	fexpand	%f31,	%f26
	xnor	%g3,	%o3,	%l2
	tvs	%xcc,	0x5
	mulx	%g7,	%o5,	%o2
	edge8n	%g5,	%i7,	%i1
	movcs	%icc,	%o6,	%i2
	fzeros	%f2
	sll	%g1,	%i4,	%l1
	edge8n	%l0,	%o1,	%o7
	wr	%g0,	0x0c,	%asi
	lduha	[%l7 + 0x40] %asi,	%i6
	fbue,a	%fcc0,	loop_1192
	popc	0x117A,	%g6
	set	0x28, %i5
	lduwa	[%l7 + %i5] 0x15,	%i3
loop_1192:
	movneg	%icc,	%g4,	%o0
	st	%f29,	[%l7 + 0x08]
	movgu	%icc,	%i0,	%g2
	edge8l	%l4,	%i5,	%l6
	fnegd	%f18,	%f22
	bl,a,pt	%icc,	loop_1193
	orncc	%o4,	%l5,	%l3
	ta	%icc,	0x2
	edge32l	%g3,	%l2,	%g7
loop_1193:
	andn	%o3,	0x0011,	%o2
	fabsd	%f28,	%f14
	sub	%o5,	0x1821,	%i7
	edge32	%g5,	%i1,	%i2
	movleu	%icc,	%o6,	%g1
	subc	%i4,	0x1F74,	%l0
	fmuld8ulx16	%f19,	%f0,	%f2
	std	%f30,	[%l7 + 0x60]
	edge8l	%o1,	%o7,	%l1
	tsubcc	%g6,	0x179C,	%i3
	andcc	%i6,	0x0ACD,	%o0
	taddcctv	%g4,	%i0,	%g2
	movvc	%xcc,	%l4,	%l6
	edge8ln	%o4,	%l5,	%i5
	bcc,a	loop_1194
	tneg	%icc,	0x5
	array8	%g3,	%l3,	%g7
	movle	%icc,	%l2,	%o3
loop_1194:
	addc	%o5,	%o2,	%i7
	brgz,a	%i1,	loop_1195
	movg	%icc,	%g5,	%o6
	tvc	%xcc,	0x0
	fmovdgu	%xcc,	%f24,	%f28
loop_1195:
	stb	%i2,	[%l7 + 0x66]
	xorcc	%g1,	0x0446,	%i4
	bleu,pn	%icc,	loop_1196
	tg	%icc,	0x2
	fbule	%fcc1,	loop_1197
	ble,a,pn	%xcc,	loop_1198
loop_1196:
	sdivcc	%o1,	0x1479,	%l0
	sub	%o7,	%l1,	%g6
loop_1197:
	edge16ln	%i6,	%i3,	%o0
loop_1198:
	bvc,a,pt	%xcc,	loop_1199
	fmovdvc	%icc,	%f27,	%f4
	fandnot2s	%f9,	%f17,	%f7
	fcmpne32	%f0,	%f16,	%i0
loop_1199:
	ldstub	[%l7 + 0x20],	%g2
	orcc	%l4,	0x021B,	%g4
	tvs	%icc,	0x5
	lduw	[%l7 + 0x48],	%l6
	sdivx	%l5,	0x0622,	%o4
	fmovdle	%icc,	%f25,	%f30
	movrgez	%g3,	%i5,	%g7
	tvs	%xcc,	0x5
	fbu,a	%fcc3,	loop_1200
	sllx	%l2,	%l3,	%o3
	ldstub	[%l7 + 0x11],	%o2
	andcc	%o5,	0x165B,	%i7
loop_1200:
	fble,a	%fcc1,	loop_1201
	addc	%g5,	%o6,	%i2
	movn	%icc,	%g1,	%i4
	and	%o1,	%l0,	%o7
loop_1201:
	nop
	set	0x34, %l5
	ldstuba	[%l7 + %l5] 0x89,	%i1
	ble,a	%xcc,	loop_1202
	srax	%g6,	0x09,	%i6
	movrgez	%l1,	0x10F,	%i3
	fpack32	%f6,	%f14,	%f28
loop_1202:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andn	%i0,	0x0824,	%o0
	stx	%g2,	[%l7 + 0x50]
	addccc	%l4,	%l6,	%l5
	udivcc	%g4,	0x059B,	%g3
	movrlez	%o4,	0x348,	%g7
	fcmps	%fcc0,	%f24,	%f26
	tn	%xcc,	0x4
	tcc	%icc,	0x0
	brlez	%i5,	loop_1203
	fpadd16	%f20,	%f30,	%f28
	fbuge	%fcc3,	loop_1204
	fmovde	%xcc,	%f8,	%f11
loop_1203:
	edge16	%l3,	%o3,	%o2
	fbue,a	%fcc0,	loop_1205
loop_1204:
	array32	%l2,	%o5,	%i7
	wr	%g0,	0x11,	%asi
	lduba	[%l7 + 0x4F] %asi,	%g5
loop_1205:
	nop
	set	0x50, %l6
	ldsha	[%l7 + %l6] 0x80,	%o6
	udivx	%i2,	0x1EEE,	%g1
	fmovdneg	%xcc,	%f11,	%f24
	add	%l7,	0x70,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%i4
	casxa	[%l6] %asi,	%i4,	%l0
	nop
	setx	loop_1206,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fandnot1	%f18,	%f14,	%f20
	fbue	%fcc2,	loop_1207
	orncc	%o7,	%o1,	%i1
loop_1206:
	bvc,pn	%icc,	loop_1208
	xnorcc	%g6,	%i6,	%l1
loop_1207:
	bpos,a	loop_1209
	edge32n	%i3,	%i0,	%g2
loop_1208:
	movle	%icc,	%l4,	%o0
	edge8	%l5,	%g4,	%l6
loop_1209:
	mulx	%o4,	%g3,	%g7
	fxors	%f3,	%f7,	%f8
	tle	%icc,	0x4
	addcc	%l3,	%i5,	%o3
	movneg	%icc,	%l2,	%o2
	stbar
	fbg	%fcc2,	loop_1210
	udiv	%o5,	0x1275,	%g5
	movrgz	%o6,	%i7,	%g1
	bvs,a,pn	%icc,	loop_1211
loop_1210:
	fmovsl	%xcc,	%f24,	%f11
	fbge,a	%fcc2,	loop_1212
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1211:
	be,a	loop_1213
	sllx	%i2,	%i4,	%l0
loop_1212:
	mova	%xcc,	%o7,	%o1
	edge8	%g6,	%i6,	%i1
loop_1213:
	ldsh	[%l7 + 0x3A],	%l1
	fpack16	%f20,	%f11
	mova	%xcc,	%i3,	%i0
	bg	loop_1214
	ldsw	[%l7 + 0x70],	%l4
	taddcc	%g2,	%l5,	%g4
	movne	%xcc,	%l6,	%o0
loop_1214:
	fpmerge	%f6,	%f29,	%f22
	fmovde	%icc,	%f22,	%f14
	tpos	%xcc,	0x5
	movleu	%xcc,	%g3,	%g7
	movrlez	%l3,	0x206,	%o4
	tpos	%icc,	0x3
	add	%o3,	%i5,	%l2
	movne	%icc,	%o2,	%g5
	movcs	%icc,	%o5,	%o6
	set	0x40, %o5
	stwa	%g1,	[%l7 + %o5] 0x89
	fmovdleu	%icc,	%f13,	%f6
	brlz	%i7,	loop_1215
	alignaddrl	%i2,	%l0,	%i4
	movleu	%xcc,	%o1,	%g6
	nop
	set	0x5C, %i4
	stw	%i6,	[%l7 + %i4]
loop_1215:
	tpos	%xcc,	0x7
	bgu,a,pt	%xcc,	loop_1216
	fbne	%fcc1,	loop_1217
	fors	%f2,	%f31,	%f8
	edge8n	%i1,	%o7,	%l1
loop_1216:
	orncc	%i3,	%i0,	%g2
loop_1217:
	fpmerge	%f15,	%f7,	%f20
	orncc	%l5,	0x1D5C,	%l4
	set	0x38, %g5
	stha	%l6,	[%l7 + %g5] 0xe2
	membar	#Sync
	taddcctv	%o0,	0x10C7,	%g3
	fbue	%fcc1,	loop_1218
	edge32	%g7,	%g4,	%o4
	fble,a	%fcc0,	loop_1219
	subccc	%o3,	0x071B,	%i5
loop_1218:
	tle	%icc,	0x0
	smulcc	%l3,	%o2,	%g5
loop_1219:
	fmovrdlez	%o5,	%f16,	%f18
	movleu	%xcc,	%l2,	%o6
	movgu	%xcc,	%g1,	%i2
	fmovsg	%icc,	%f14,	%f7
	tcs	%xcc,	0x3
	movn	%icc,	%i7,	%l0
	movvs	%xcc,	%o1,	%g6
	movne	%icc,	%i6,	%i4
	addc	%i1,	0x0FDD,	%o7
	srax	%i3,	0x1C,	%i0
	sdivcc	%g2,	0x0EA9,	%l5
	set	0x45, %i2
	ldstuba	[%l7 + %i2] 0x18,	%l1
	fbuge,a	%fcc1,	loop_1220
	srlx	%l6,	%l4,	%g3
	orncc	%o0,	%g4,	%o4
	brnz	%g7,	loop_1221
loop_1220:
	bpos,a	%xcc,	loop_1222
	fmovrdlez	%o3,	%f8,	%f16
	membar	0x1F
loop_1221:
	bcs	%xcc,	loop_1223
loop_1222:
	fpadd32	%f8,	%f20,	%f30
	te	%icc,	0x3
	tl	%icc,	0x4
loop_1223:
	fpadd32s	%f8,	%f27,	%f20
	wr	%g0,	0x89,	%asi
	prefetcha	[%l7 + 0x38] %asi,	 0x0
	sllx	%o2,	0x16,	%i5
	mova	%icc,	%g5,	%o5
	tg	%icc,	0x2
	andcc	%o6,	%g1,	%l2
	movleu	%icc,	%i2,	%i7
	fxors	%f5,	%f28,	%f27
	sth	%l0,	[%l7 + 0x74]
	fmuld8sux16	%f14,	%f8,	%f6
	ld	[%l7 + 0x7C],	%f12
	fbue	%fcc3,	loop_1224
	fornot2	%f24,	%f10,	%f2
	tneg	%xcc,	0x0
	srl	%o1,	%i6,	%i4
loop_1224:
	fornot1s	%f21,	%f23,	%f31
	udivcc	%g6,	0x0F25,	%i1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovscs	%icc,	%f18,	%f20
	srax	%i3,	%o7,	%i0
	ld	[%l7 + 0x5C],	%f28
	faligndata	%f28,	%f10,	%f8
	movgu	%xcc,	%g2,	%l5
	fsrc1	%f28,	%f10
	ta	%xcc,	0x0
	sub	%l6,	0x14DD,	%l4
	bvs,a	loop_1225
	tg	%icc,	0x0
	and	%l1,	%g3,	%o0
	udiv	%g4,	0x0AD7,	%o4
loop_1225:
	edge32	%o3,	%l3,	%g7
	movrne	%o2,	0x207,	%i5
	fmovrdgz	%o5,	%f24,	%f30
	sethi	0x0784,	%o6
	xor	%g5,	0x1111,	%g1
	fmovdn	%icc,	%f11,	%f7
	fones	%f2
	fornot2	%f2,	%f4,	%f30
	movrlez	%i2,	%l2,	%l0
	wr	%g0,	0x80,	%asi
	lduha	[%l7 + 0x62] %asi,	%o1
	orn	%i7,	0x09E9,	%i4
	alignaddr	%g6,	%i1,	%i3
	fcmple16	%f22,	%f4,	%o7
	nop
	set	0x18, %g7
	stx	%i6,	[%l7 + %g7]
	tge	%icc,	0x6
	fpmerge	%f20,	%f11,	%f22
	movle	%xcc,	%i0,	%g2
	lduh	[%l7 + 0x30],	%l6
	bn	loop_1226
	fsrc1	%f0,	%f20
	fbn,a	%fcc1,	loop_1227
	sll	%l4,	%l1,	%l5
loop_1226:
	sdivcc	%o0,	0x1996,	%g3
	fmovsg	%icc,	%f1,	%f25
loop_1227:
	umulcc	%o4,	%o3,	%g4
	fmovrdgez	%l3,	%f16,	%f12
	subc	%o2,	0x1C2B,	%g7
	bpos	%xcc,	loop_1228
	tl	%icc,	0x7
	or	%i5,	0x1559,	%o6
	brgez,a	%o5,	loop_1229
loop_1228:
	fpack32	%f10,	%f10,	%f2
	movgu	%icc,	%g5,	%i2
	addcc	%l2,	%g1,	%o1
loop_1229:
	fmovsgu	%xcc,	%f31,	%f18
	nop
	setx	loop_1230,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	tpos	%icc,	0x7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andcc	%l0,	%i4,	%g6
loop_1230:
	sethi	0x04B2,	%i7
	fzeros	%f5
	andn	%i1,	%o7,	%i3
	tvc	%xcc,	0x2
	ta	%icc,	0x3
	xnorcc	%i6,	0x12EC,	%i0
	srax	%g2,	0x15,	%l4
	xorcc	%l1,	%l6,	%o0
	edge16n	%g3,	%l5,	%o4
	ldstub	[%l7 + 0x73],	%o3
	bge,a	%xcc,	loop_1231
	tcs	%icc,	0x3
	tge	%xcc,	0x4
	edge16n	%g4,	%o2,	%l3
loop_1231:
	tsubcc	%i5,	%g7,	%o6
	bl,a	%icc,	loop_1232
	movleu	%icc,	%o5,	%i2
	nop
	setx	loop_1233,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	taddcctv	%l2,	0x0B99,	%g1
loop_1232:
	srl	%o1,	0x04,	%g5
	sdivcc	%l0,	0x118E,	%g6
loop_1233:
	movrgz	%i7,	%i4,	%i1
	ldsh	[%l7 + 0x3E],	%o7
	sdiv	%i3,	0x1049,	%i0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mulx	%g2,	%i6,	%l1
	set	0x30, %g6
	lduwa	[%l7 + %g6] 0x10,	%l4
	srl	%l6,	%g3,	%l5
	xor	%o4,	%o0,	%g4
	tl	%icc,	0x0
	edge32l	%o2,	%o3,	%i5
	fbue	%fcc3,	loop_1234
	sethi	0x0153,	%l3
	mulx	%o6,	%o5,	%g7
	sir	0x1F4F
loop_1234:
	edge8n	%l2,	%i2,	%g1
	tl	%xcc,	0x6
	movrgz	%o1,	%g5,	%g6
	movre	%i7,	%l0,	%i1
	fbl,a	%fcc1,	loop_1235
	subcc	%o7,	0x06AC,	%i3
	fmul8x16au	%f24,	%f26,	%f12
	xor	%i0,	0x1997,	%i4
loop_1235:
	edge16l	%g2,	%l1,	%l4
	fbg	%fcc2,	loop_1236
	swap	[%l7 + 0x20],	%l6
	tgu	%icc,	0x7
	sir	0x0A9A
loop_1236:
	bneg	%xcc,	loop_1237
	move	%icc,	%i6,	%g3
	movrne	%l5,	0x0A8,	%o0
	tl	%xcc,	0x4
loop_1237:
	nop
	set	0x40, %g2
	stda	%f0,	[%l7 + %g2] 0x11
	bcs,a,pn	%icc,	loop_1238
	movrgez	%g4,	%o4,	%o2
	fmovsleu	%xcc,	%f5,	%f14
	mulx	%i5,	0x1088,	%o3
loop_1238:
	alignaddrl	%l3,	%o5,	%g7
	movl	%icc,	%l2,	%i2
	fcmps	%fcc2,	%f27,	%f16
	edge32ln	%o6,	%g1,	%g5
	movrgez	%o1,	0x0C7,	%g6
	array8	%i7,	%l0,	%i1
	fpmerge	%f14,	%f23,	%f0
	edge8ln	%i3,	%i0,	%o7
	ldstub	[%l7 + 0x67],	%i4
	set	0x6C, %l1
	swapa	[%l7 + %l1] 0x88,	%g2
	tg	%xcc,	0x5
	lduh	[%l7 + 0x50],	%l1
	fcmpgt16	%f4,	%f8,	%l4
	movrlz	%l6,	%i6,	%l5
	sdivx	%o0,	0x03FA,	%g4
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
	mulx	%g3,	%o2,	%o4
	edge8l	%o3,	%i5,	%l3
	brlz	%o5,	loop_1239
	orn	%l2,	0x0384,	%g7
	xnorcc	%i2,	0x0B9D,	%g1
	tvs	%icc,	0x4
loop_1239:
	xor	%o6,	%g5,	%o1
	movneg	%xcc,	%g6,	%i7
	fzeros	%f11
	fcmpeq32	%f4,	%f6,	%l0
	movge	%icc,	%i3,	%i0
	mova	%xcc,	%o7,	%i4
	movgu	%icc,	%g2,	%l1
	std	%f30,	[%l7 + 0x08]
	xorcc	%l4,	%i1,	%l6
	array8	%i6,	%l5,	%o0
	edge32n	%g3,	%g4,	%o2
	sdivx	%o3,	0x1FFE,	%i5
	fmovrdlez	%o4,	%f12,	%f4
	stw	%l3,	[%l7 + 0x40]
	edge8l	%l2,	%g7,	%o5
	tg	%xcc,	0x5
	taddcctv	%i2,	%o6,	%g1
	fpack32	%f30,	%f14,	%f28
	srlx	%o1,	0x04,	%g5
	fmovscs	%icc,	%f7,	%f11
	edge32l	%g6,	%i7,	%l0
	fbue,a	%fcc0,	loop_1240
	add	%i3,	0x1A4D,	%i0
	fpsub32s	%f13,	%f15,	%f28
	membar	0x33
loop_1240:
	fnot2s	%f6,	%f8
	tvc	%icc,	0x6
	edge8ln	%i4,	%g2,	%l1
	fzero	%f24
	wr	%g0,	0x19,	%asi
	lduwa	[%l7 + 0x3C] %asi,	%l4
	tvc	%xcc,	0x5
	set	0x18, %i1
	lda	[%l7 + %i1] 0x0c,	%f8
	fbue	%fcc0,	loop_1241
	movle	%icc,	%i1,	%o7
	edge16l	%i6,	%l6,	%o0
	fnegs	%f28,	%f0
loop_1241:
	fcmpd	%fcc1,	%f20,	%f28
	fbl	%fcc0,	loop_1242
	lduw	[%l7 + 0x4C],	%l5
	fmovsgu	%icc,	%f6,	%f23
	fble	%fcc3,	loop_1243
loop_1242:
	tsubcctv	%g3,	0x07B8,	%g4
	lduw	[%l7 + 0x10],	%o3
	movre	%o2,	%o4,	%l3
loop_1243:
	edge16ln	%l2,	%g7,	%i5
	bne,pn	%icc,	loop_1244
	movneg	%icc,	%o5,	%i2
	fba,a	%fcc0,	loop_1245
	brlez	%o6,	loop_1246
loop_1244:
	smulcc	%o1,	0x03C3,	%g1
	addcc	%g5,	%g6,	%l0
loop_1245:
	fornot1	%f10,	%f22,	%f30
loop_1246:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdiv	%i3,	0x0528,	%i7
	fmovd	%f12,	%f24
	or	%i4,	%i0,	%l1
	movpos	%xcc,	%l4,	%i1
	fbn,a	%fcc3,	loop_1247
	fbu,a	%fcc0,	loop_1248
	taddcctv	%g2,	%o7,	%l6
	movrgez	%o0,	0x145,	%l5
loop_1247:
	nop
	set	0x70, %o3
	swapa	[%l7 + %o3] 0x80,	%i6
loop_1248:
	stb	%g3,	[%l7 + 0x1A]
	movrgz	%g4,	%o2,	%o3
	subccc	%o4,	%l2,	%g7
	tge	%xcc,	0x0
	tsubcc	%i5,	%o5,	%l3
	stx	%i2,	[%l7 + 0x48]
	fblg	%fcc1,	loop_1249
	move	%xcc,	%o1,	%o6
	tvs	%icc,	0x3
	bvc	%xcc,	loop_1250
loop_1249:
	fmovsge	%icc,	%f20,	%f2
	movvs	%xcc,	%g1,	%g6
	addc	%l0,	%g5,	%i7
loop_1250:
	xor	%i4,	0x08B8,	%i3
	movle	%icc,	%l1,	%l4
	alignaddr	%i1,	%g2,	%o7
	and	%l6,	0x122A,	%i0
	fmovdcs	%xcc,	%f5,	%f7
	alignaddrl	%o0,	%l5,	%i6
	xorcc	%g3,	%g4,	%o3
	tvc	%xcc,	0x5
	wr	%g0,	0x23,	%asi
	stha	%o2,	[%l7 + 0x70] %asi
	membar	#Sync
	wr	%g0,	0x10,	%asi
	prefetcha	[%l7 + 0x60] %asi,	 0x2
	edge8n	%g7,	%l2,	%i5
	tneg	%icc,	0x2
	fandnot2	%f28,	%f26,	%f0
	ldx	[%l7 + 0x18],	%l3
	sllx	%o5,	0x11,	%o1
	srl	%i2,	0x02,	%o6
	movg	%icc,	%g6,	%g1
	xorcc	%g5,	0x0410,	%i7
	andncc	%i4,	%i3,	%l0
	andn	%l1,	0x0E7E,	%l4
	tvs	%icc,	0x2
	sllx	%i1,	0x1A,	%o7
	fornot2s	%f7,	%f10,	%f0
	fbul	%fcc3,	loop_1251
	movl	%icc,	%g2,	%l6
	fbo,a	%fcc0,	loop_1252
	lduh	[%l7 + 0x78],	%o0
loop_1251:
	brnz,a	%i0,	loop_1253
	fmovde	%xcc,	%f15,	%f17
loop_1252:
	andncc	%i6,	%l5,	%g3
	mulscc	%g4,	%o3,	%o2
loop_1253:
	nop
	setx	loop_1254,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	move	%icc,	%o4,	%l2
	addc	%i5,	%l3,	%o5
	andncc	%o1,	%g7,	%i2
loop_1254:
	fbule,a	%fcc0,	loop_1255
	fcmpne16	%f14,	%f2,	%o6
	srlx	%g1,	%g6,	%i7
	prefetch	[%l7 + 0x18],	 0x1
loop_1255:
	sll	%i4,	%i3,	%g5
	fornot2s	%f8,	%f2,	%f2
	nop
	set	0x40, %o1
	sth	%l0,	[%l7 + %o1]
	bl	%icc,	loop_1256
	fpsub16s	%f0,	%f10,	%f23
	bcs,a,pn	%icc,	loop_1257
	movge	%icc,	%l1,	%l4
loop_1256:
	movne	%xcc,	%o7,	%g2
	bcc,a	loop_1258
loop_1257:
	fmul8x16au	%f16,	%f20,	%f22
	tcc	%icc,	0x4
	sdivcc	%i1,	0x133D,	%l6
loop_1258:
	andcc	%i0,	%i6,	%o0
	pdist	%f10,	%f22,	%f6
	tcs	%icc,	0x2
	mulscc	%g3,	0x05DD,	%l5
	sdivcc	%o3,	0x0F08,	%o2
	fandnot1	%f26,	%f18,	%f26
	andcc	%g4,	%l2,	%i5
	brgz	%l3,	loop_1259
	movleu	%icc,	%o4,	%o5
	movrne	%g7,	%o1,	%o6
	nop
	setx	loop_1260,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_1259:
	movge	%icc,	%g1,	%g6
	wr	%g0,	0x23,	%asi
	stxa	%i7,	[%l7 + 0x08] %asi
	membar	#Sync
loop_1260:
	tvc	%icc,	0x3
	ldsw	[%l7 + 0x1C],	%i4
	stx	%i2,	[%l7 + 0x50]
	smulcc	%g5,	%l0,	%i3
	fors	%f24,	%f25,	%f20
	edge32n	%l4,	%l1,	%g2
	movle	%xcc,	%o7,	%i1
	tge	%xcc,	0x0
	edge8	%i0,	%i6,	%o0
	andcc	%l6,	0x0939,	%g3
	add	%l7,	0x0C,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%l5
	casa	[%l6] %asi,	%l5,	%o3
	fexpand	%f2,	%f10
	ldd	[%l7 + 0x28],	%f22
	sllx	%g4,	%o2,	%i5
	xor	%l2,	0x0526,	%l3
	alignaddr	%o4,	%o5,	%g7
	stx	%o1,	[%l7 + 0x48]
	xnor	%o6,	%g1,	%g6
	fmovscc	%xcc,	%f21,	%f21
	mulx	%i7,	0x0F90,	%i2
	fblg	%fcc3,	loop_1261
	fabsd	%f26,	%f30
	set	0x40, %l2
	ldda	[%l7 + %l2] 0x15,	%f16
loop_1261:
	fbge	%fcc3,	loop_1262
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srl	%i4,	%l0,	%g5
	edge8ln	%l4,	%l1,	%g2
loop_1262:
	fmovdvs	%xcc,	%f1,	%f11
	and	%o7,	%i3,	%i1
	fbuge,a	%fcc2,	loop_1263
	subcc	%i0,	%i6,	%o0
	bvc	loop_1264
	ta	%xcc,	0x6
loop_1263:
	fbul	%fcc1,	loop_1265
	orn	%l6,	%l5,	%o3
loop_1264:
	edge16	%g4,	%o2,	%i5
	lduh	[%l7 + 0x78],	%g3
loop_1265:
	srax	%l2,	%o4,	%o5
	ldx	[%l7 + 0x60],	%g7
	wr	%g0,	0x11,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	brgz	%o1,	loop_1266
	ldub	[%l7 + 0x3E],	%o6
	edge16	%l3,	%g1,	%i7
	sub	%i2,	0x06A7,	%g6
loop_1266:
	fmovdgu	%xcc,	%f2,	%f5
	movvc	%xcc,	%l0,	%i4
	movrgez	%g5,	0x1E0,	%l4
	fnot1	%f20,	%f30
	movrgez	%l1,	%o7,	%g2
	taddcc	%i3,	0x052D,	%i0
	addc	%i6,	0x03D3,	%i1
	fmovdpos	%icc,	%f3,	%f20
	set	0x08, %i0
	swapa	[%l7 + %i0] 0x18,	%o0
	xnorcc	%l5,	0x146D,	%l6
	fsrc2s	%f5,	%f22
	orcc	%o3,	0x1C12,	%o2
	smulcc	%i5,	0x0FC2,	%g4
	std	%g2,	[%l7 + 0x68]
	lduw	[%l7 + 0x10],	%l2
	movvc	%icc,	%o4,	%o5
	stx	%o1,	[%l7 + 0x10]
	wr	%g0,	0x04,	%asi
	ldda	[%l7 + 0x70] %asi,	%g6
	fcmpes	%fcc1,	%f20,	%f30
	or	%o6,	%g1,	%i7
	subcc	%l3,	%i2,	%l0
	fexpand	%f1,	%f10
	stx	%g6,	[%l7 + 0x70]
	fmovdl	%xcc,	%f4,	%f6
	fmovda	%icc,	%f12,	%f29
	set	0x40, %g4
	stda	%f0,	[%l7 + %g4] 0x88
	movcc	%icc,	%g5,	%i4
	tleu	%icc,	0x0
	wr	%g0,	0x11,	%asi
	lduha	[%l7 + 0x36] %asi,	%l4
	orn	%l1,	%o7,	%i3
	ta	%icc,	0x1
	fmovrdlz	%g2,	%f18,	%f12
	array16	%i6,	%i1,	%o0
	fpackfix	%f28,	%f12
	swap	[%l7 + 0x3C],	%l5
	movcc	%icc,	%i0,	%o3
	fmul8x16al	%f12,	%f23,	%f26
	fbl,a	%fcc3,	loop_1267
	movg	%xcc,	%o2,	%l6
	swap	[%l7 + 0x78],	%i5
	wr	%g0,	0x1e,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
loop_1267:
	movpos	%xcc,	%g4,	%g3
	movle	%xcc,	%o4,	%o5
	brnz,a	%l2,	loop_1268
	andncc	%o1,	%o6,	%g1
	mova	%icc,	%i7,	%g7
	bge	%icc,	loop_1269
loop_1268:
	fcmple32	%f22,	%f30,	%i2
	bg	%xcc,	loop_1270
	subcc	%l0,	0x1360,	%l3
loop_1269:
	movn	%icc,	%g5,	%g6
	sdivx	%l4,	0x0278,	%i4
loop_1270:
	andn	%l1,	%o7,	%g2
	tpos	%icc,	0x6
	fornot2s	%f31,	%f9,	%f11
	tne	%xcc,	0x3
	xnorcc	%i3,	0x18DD,	%i1
	udivcc	%i6,	0x1A14,	%o0
	tcs	%icc,	0x1
	tcc	%xcc,	0x0
	subc	%i0,	%o3,	%o2
	ba	loop_1271
	fmovscc	%icc,	%f2,	%f3
	mova	%xcc,	%l5,	%l6
	tg	%icc,	0x4
loop_1271:
	fcmpgt16	%f20,	%f0,	%i5
	movgu	%icc,	%g4,	%o4
	addccc	%o5,	%g3,	%l2
	alignaddrl	%o1,	%g1,	%o6
	udiv	%i7,	0x14A2,	%g7
	tcc	%xcc,	0x2
	brgz,a	%l0,	loop_1272
	ldstub	[%l7 + 0x4A],	%i2
	ldd	[%l7 + 0x08],	%f20
	srl	%g5,	%l3,	%g6
loop_1272:
	tl	%icc,	0x7
	sethi	0x0A5D,	%l4
	move	%icc,	%i4,	%l1
	mova	%icc,	%o7,	%g2
	fexpand	%f5,	%f0
	srlx	%i1,	0x02,	%i3
	fbul	%fcc0,	loop_1273
	tsubcc	%o0,	%i0,	%o3
	umul	%o2,	%l5,	%l6
	edge16	%i5,	%i6,	%o4
loop_1273:
	nop
	setx loop_1274, %l0, %l1
	jmpl %l1, %o5
	alignaddrl	%g4,	%l2,	%g3
	edge8n	%o1,	%g1,	%o6
	fmovdpos	%icc,	%f25,	%f8
loop_1274:
	fbu,a	%fcc2,	loop_1275
	tsubcc	%i7,	0x0CE8,	%l0
	nop
	setx	loop_1276,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	edge32l	%g7,	%g5,	%l3
loop_1275:
	fmovsa	%icc,	%f28,	%f30
	tcs	%xcc,	0x2
loop_1276:
	sdiv	%i2,	0x02D7,	%g6
	fmovrdgez	%i4,	%f22,	%f30
	fmovdne	%xcc,	%f13,	%f0
	fbu,a	%fcc0,	loop_1277
	array8	%l1,	%l4,	%g2
	edge32l	%o7,	%i3,	%o0
	fmovrdlez	%i0,	%f30,	%f20
loop_1277:
	fmovda	%xcc,	%f31,	%f12
	smulcc	%o3,	%o2,	%l5
	orn	%l6,	0x08CD,	%i1
	bl,pt	%xcc,	loop_1278
	ld	[%l7 + 0x60],	%f30
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tcc	%icc,	0x7
loop_1278:
	movcc	%icc,	%i5,	%o4
	xor	%i6,	%g4,	%o5
	movre	%l2,	0x111,	%o1
	or	%g1,	0x17FA,	%o6
	fandnot2	%f30,	%f22,	%f26
	tne	%icc,	0x4
	andncc	%g3,	%i7,	%l0
	subc	%g7,	0x1B36,	%g5
	bge,a,pt	%icc,	loop_1279
	tneg	%xcc,	0x7
	xnorcc	%l3,	0x0126,	%i2
	mova	%xcc,	%g6,	%l1
loop_1279:
	fbl	%fcc0,	loop_1280
	bcc,a	loop_1281
	std	%f24,	[%l7 + 0x38]
	taddcc	%l4,	0x1768,	%i4
loop_1280:
	bneg,pn	%xcc,	loop_1282
loop_1281:
	fpadd32s	%f13,	%f12,	%f17
	movneg	%icc,	%o7,	%g2
	membar	0x76
loop_1282:
	andcc	%i3,	%o0,	%i0
	fpadd16	%f10,	%f22,	%f2
	fxnor	%f10,	%f26,	%f4
	movrgez	%o3,	0x000,	%l5
	move	%xcc,	%l6,	%i1
	fbul	%fcc2,	loop_1283
	fbuge,a	%fcc0,	loop_1284
	fnegs	%f15,	%f18
	and	%o2,	0x07DC,	%i5
loop_1283:
	nop
	wr	%g0,	0x10,	%asi
	lduha	[%l7 + 0x70] %asi,	%o4
loop_1284:
	umulcc	%g4,	%i6,	%l2
	xor	%o5,	0x0816,	%g1
	te	%xcc,	0x0
	sdivcc	%o6,	0x006C,	%o1
	fbug,a	%fcc3,	loop_1285
	tne	%xcc,	0x5
	or	%i7,	0x18F6,	%l0
	movrlz	%g3,	%g5,	%l3
loop_1285:
	ld	[%l7 + 0x30],	%f3
	bleu,a	%icc,	loop_1286
	orcc	%i2,	%g6,	%l1
	wr	%g0,	0x81,	%asi
	prefetcha	[%l7 + 0x28] %asi,	 0x2
loop_1286:
	array32	%i4,	%g7,	%o7
	xorcc	%g2,	%o0,	%i3
	brgz,a	%i0,	loop_1287
	srlx	%o3,	%l6,	%l5
	movvs	%xcc,	%i1,	%o2
	fmovrsgez	%i5,	%f23,	%f14
loop_1287:
	ble,pn	%icc,	loop_1288
	movcs	%xcc,	%o4,	%i6
	umul	%g4,	%o5,	%l2
	fmovrsgz	%g1,	%f23,	%f9
loop_1288:
	stx	%o6,	[%l7 + 0x10]
	set	0x40, %l3
	ldda	[%l7 + %l3] 0x18,	%f0
	fcmpne32	%f4,	%f8,	%o1
	movrgz	%l0,	%g3,	%i7
	sdivcc	%g5,	0x1715,	%l3
	fmovdl	%xcc,	%f17,	%f14
	xnor	%g6,	%i2,	%l1
	umul	%l4,	%g7,	%o7
	udiv	%i4,	0x1C78,	%g2
	fmuld8sux16	%f30,	%f22,	%f8
	subcc	%o0,	%i3,	%i0
	movrlz	%o3,	%l6,	%l5
	fone	%f8
	alignaddrl	%i1,	%o2,	%o4
	swap	[%l7 + 0x08],	%i5
	ldub	[%l7 + 0x59],	%i6
	wr	%g0,	0xe2,	%asi
	stba	%g4,	[%l7 + 0x44] %asi
	membar	#Sync
	sra	%o5,	%g1,	%o6
	fmovdneg	%xcc,	%f4,	%f7
	fblg,a	%fcc1,	loop_1289
	fpadd16s	%f25,	%f10,	%f21
	tge	%xcc,	0x5
	subc	%l2,	%o1,	%g3
loop_1289:
	tpos	%xcc,	0x5
	set	0x20, %o6
	ldda	[%l7 + %o6] 0x2c,	%l0
	be,pn	%xcc,	loop_1290
	ldsh	[%l7 + 0x1A],	%g5
	fmovse	%xcc,	%f2,	%f20
	edge8	%i7,	%l3,	%i2
loop_1290:
	movrlez	%g6,	%l1,	%l4
	orn	%o7,	0x00D1,	%i4
	set	0x18, %g3
	ldsha	[%l7 + %g3] 0x11,	%g7
	edge32ln	%o0,	%g2,	%i0
	sra	%o3,	0x05,	%i3
	add	%l7,	0x18,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] %asi,	%l6,	%i1
	mulscc	%o2,	%o4,	%i5
	alignaddr	%l5,	%i6,	%o5
	fnot2s	%f4,	%f16
	fbne,a	%fcc2,	loop_1291
	tpos	%xcc,	0x6
	set	0x18, %o2
	ldxa	[%l7 + %o2] 0x15,	%g1
loop_1291:
	nop
	wr	%g0,	0x89,	%asi
	sta	%f30,	[%l7 + 0x48] %asi
	fmovsn	%xcc,	%f25,	%f20
	fmovrdgez	%o6,	%f28,	%f22
	wr	%g0,	0x89,	%asi
	stwa	%l2,	[%l7 + 0x4C] %asi
	orn	%o1,	0x0DB3,	%g3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fones	%f0
	andncc	%l0,	%g4,	%i7
	movg	%icc,	%g5,	%l3
	umul	%g6,	%i2,	%l4
	addc	%o7,	0x0225,	%l1
	edge16ln	%g7,	%o0,	%g2
	fmovsge	%xcc,	%f2,	%f16
	fornot1s	%f14,	%f22,	%f20
	fmovrdgz	%i0,	%f6,	%f30
	fbuge,a	%fcc0,	loop_1292
	fnor	%f4,	%f26,	%f10
	wr	%g0,	0x88,	%asi
	lduha	[%l7 + 0x5E] %asi,	%i4
loop_1292:
	fblg	%fcc0,	loop_1293
	mulscc	%i3,	0x12F7,	%o3
	fornot2	%f4,	%f2,	%f30
	set	0x50, %l0
	prefetcha	[%l7 + %l0] 0x81,	 0x3
loop_1293:
	tge	%icc,	0x3
	wr	%g0,	0x89,	%asi
	ldsha	[%l7 + 0x1E] %asi,	%o2
	edge8n	%o4,	%i5,	%l5
	sub	%i6,	0x14C2,	%i1
	srlx	%g1,	%o6,	%l2
	call	loop_1294
	udiv	%o1,	0x1747,	%o5
	array8	%g3,	%g4,	%i7
	udiv	%l0,	0x0641,	%l3
loop_1294:
	fpsub32	%f0,	%f26,	%f30
	fmovrdgz	%g5,	%f18,	%f14
	fandnot1s	%f22,	%f11,	%f17
	fmovrsne	%g6,	%f14,	%f22
	te	%icc,	0x1
	sdivcc	%i2,	0x1013,	%l4
	fmovrsgez	%o7,	%f27,	%f21
	edge16ln	%g7,	%o0,	%l1
	swap	[%l7 + 0x64],	%g2
	membar	0x50
	andncc	%i0,	%i3,	%i4
	movne	%icc,	%o3,	%o2
	array16	%o4,	%i5,	%l6
	srlx	%i6,	%i1,	%l5
	sethi	0x166F,	%g1
	taddcc	%o6,	%o1,	%l2
	alignaddrl	%o5,	%g3,	%i7
	set	0x44, %i6
	ldstuba	[%l7 + %i6] 0x89,	%l0
	srax	%l3,	0x0B,	%g5
	sll	%g6,	0x14,	%g4
	call	loop_1295
	st	%f28,	[%l7 + 0x44]
	edge32n	%i2,	%l4,	%g7
	movgu	%xcc,	%o7,	%o0
loop_1295:
	movvs	%icc,	%g2,	%l1
	udivcc	%i3,	0x12A7,	%i0
	mova	%xcc,	%i4,	%o2
	bcc,pn	%xcc,	loop_1296
	smulcc	%o3,	%o4,	%l6
	nop
	setx	loop_1297,	%l0,	%l1
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
loop_1296:
	andncc	%i5,	%i6,	%i1
	be,a	loop_1298
loop_1297:
	be,pn	%xcc,	loop_1299
	tvc	%icc,	0x6
	mulscc	%g1,	%l5,	%o1
loop_1298:
	ba,a,pn	%xcc,	loop_1300
loop_1299:
	prefetch	[%l7 + 0x14],	 0x2
	fpmerge	%f9,	%f14,	%f12
	edge32	%l2,	%o6,	%g3
loop_1300:
	fbug,a	%fcc2,	loop_1301
	movcs	%icc,	%o5,	%l0
	movvc	%icc,	%l3,	%g5
	bneg,pt	%xcc,	loop_1302
loop_1301:
	fmovrdgz	%i7,	%f10,	%f6
	fnot1	%f10,	%f2
	movrne	%g4,	%g6,	%l4
loop_1302:
	edge16n	%i2,	%o7,	%o0
	movcc	%xcc,	%g2,	%g7
	mulscc	%l1,	0x1E92,	%i0
	xnor	%i3,	%o2,	%o3
	tgu	%xcc,	0x0
	fcmpgt32	%f22,	%f2,	%i4
	movleu	%icc,	%l6,	%o4
	ld	[%l7 + 0x14],	%f6
	movge	%icc,	%i6,	%i5
	udiv	%i1,	0x046F,	%g1
	bcc	%icc,	loop_1303
	fpadd16	%f8,	%f24,	%f20
	edge8l	%o1,	%l2,	%o6
	fmovd	%f4,	%f10
loop_1303:
	fble,a	%fcc2,	loop_1304
	movg	%xcc,	%l5,	%o5
	tgu	%icc,	0x7
	move	%xcc,	%g3,	%l3
loop_1304:
	nop
	setx	loop_1305,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	addcc	%l0,	%g5,	%i7
	bpos,pt	%xcc,	loop_1306
	xnor	%g6,	%l4,	%g4
loop_1305:
	taddcctv	%i2,	0x0517,	%o0
	fnegd	%f16,	%f0
loop_1306:
	nop
	set	0x4C, %g1
	lda	[%l7 + %g1] 0x89,	%f4
	sethi	0x023A,	%g2
	fmovrdgez	%g7,	%f14,	%f26
	addc	%o7,	%i0,	%i3
	sth	%o2,	[%l7 + 0x08]
	movg	%icc,	%l1,	%o3
	tsubcctv	%l6,	0x1F18,	%i4
	std	%i6,	[%l7 + 0x78]
	fandnot1s	%f7,	%f21,	%f30
	tsubcc	%i5,	0x0D37,	%i1
	ble,pt	%xcc,	loop_1307
	tneg	%xcc,	0x2
	movpos	%icc,	%o4,	%g1
	tl	%xcc,	0x6
loop_1307:
	nop
	set	0x54, %o0
	lduha	[%l7 + %o0] 0x14,	%l2
	bl,pn	%xcc,	loop_1308
	mulx	%o1,	0x18A4,	%l5
	ldub	[%l7 + 0x30],	%o5
	movleu	%xcc,	%g3,	%l3
loop_1308:
	fmovdge	%icc,	%f10,	%f20
	fblg	%fcc0,	loop_1309
	ld	[%l7 + 0x4C],	%f3
	edge16	%l0,	%g5,	%o6
	andn	%i7,	%l4,	%g6
loop_1309:
	tvc	%icc,	0x2
	fsrc2s	%f10,	%f25
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	faligndata	%f8,	%f12,	%f14
	fmovdne	%icc,	%f7,	%f22
	andncc	%g4,	%o0,	%g2
	tn	%xcc,	0x6
	fxnor	%f8,	%f14,	%f14
	movle	%xcc,	%i2,	%g7
	mova	%xcc,	%i0,	%o7
	fpadd32	%f26,	%f28,	%f20
	taddcc	%i3,	%l1,	%o3
	tcc	%xcc,	0x0
	fbuge,a	%fcc1,	loop_1310
	add	%o2,	0x0805,	%i4
	or	%i6,	0x074E,	%i5
	xor	%l6,	0x0019,	%i1
loop_1310:
	brgz,a	%g1,	loop_1311
	brgez,a	%l2,	loop_1312
	fand	%f8,	%f22,	%f12
	sra	%o1,	%l5,	%o4
loop_1311:
	fbul	%fcc2,	loop_1313
loop_1312:
	ta	%icc,	0x4
	xorcc	%o5,	%l3,	%l0
	bneg,pt	%icc,	loop_1314
loop_1313:
	andncc	%g3,	%o6,	%g5
	fbe	%fcc0,	loop_1315
	movvc	%xcc,	%l4,	%g6
loop_1314:
	nop
	set	0x20, %l4
	ldda	[%l7 + %l4] 0x15,	%i6
loop_1315:
	fbug,a	%fcc0,	loop_1316
	bcc,pn	%icc,	loop_1317
	fornot2s	%f30,	%f20,	%f21
	bpos	%xcc,	loop_1318
loop_1316:
	movn	%icc,	%o0,	%g4
loop_1317:
	mulx	%g2,	%g7,	%i0
	mova	%icc,	%o7,	%i3
loop_1318:
	bg,a	loop_1319
	alignaddr	%l1,	%i2,	%o2
	subccc	%o3,	%i4,	%i6
	fmuld8sux16	%f15,	%f3,	%f14
loop_1319:
	sll	%i5,	0x12,	%i1
	movl	%icc,	%l6,	%l2
	tne	%icc,	0x2
	movg	%xcc,	%o1,	%g1
	tneg	%icc,	0x6
	movpos	%xcc,	%l5,	%o4
	andcc	%o5,	%l3,	%l0
	fnot1s	%f20,	%f9
	movrlz	%o6,	0x09B,	%g5
	orncc	%g3,	0x0C19,	%g6
	te	%xcc,	0x6
	srax	%i7,	%l4,	%g4
	edge8ln	%g2,	%o0,	%g7
	bn,pt	%xcc,	loop_1320
	orncc	%o7,	%i0,	%l1
	bvs,a	%icc,	loop_1321
	mulx	%i2,	0x1356,	%i3
loop_1320:
	array32	%o3,	%i4,	%i6
	taddcc	%i5,	0x0F64,	%i1
loop_1321:
	movne	%icc,	%o2,	%l6
	fcmpne16	%f30,	%f20,	%o1
	bvc,a	loop_1322
	movrlez	%g1,	0x16B,	%l2
	set	0x2C, %i7
	swapa	[%l7 + %i7] 0x19,	%o4
loop_1322:
	tleu	%xcc,	0x1
	orn	%l5,	%o5,	%l0
	edge16l	%o6,	%g5,	%l3
	fbe	%fcc0,	loop_1323
	or	%g6,	0x0A1B,	%g3
	edge8l	%i7,	%l4,	%g4
	alignaddrl	%g2,	%g7,	%o0
loop_1323:
	ta	%xcc,	0x4
	movcc	%icc,	%i0,	%o7
	bneg,a	loop_1324
	tgu	%icc,	0x4
	ldstub	[%l7 + 0x20],	%l1
	movre	%i3,	0x21C,	%i2
loop_1324:
	tle	%icc,	0x6
	fcmple16	%f18,	%f2,	%o3
	sra	%i6,	%i4,	%i1
	tg	%icc,	0x5
	brgz	%i5,	loop_1325
	fxor	%f6,	%f4,	%f22
	sllx	%o2,	0x14,	%l6
	fmovrdgez	%o1,	%f12,	%f28
loop_1325:
	std	%f24,	[%l7 + 0x28]
	tge	%icc,	0x1
	srax	%l2,	%g1,	%l5
	brlz	%o4,	loop_1326
	bcc,a,pn	%icc,	loop_1327
	movpos	%icc,	%o5,	%o6
	nop
	setx loop_1328, %l0, %l1
	jmpl %l1, %g5
loop_1326:
	tg	%xcc,	0x4
loop_1327:
	ta	%icc,	0x4
	umul	%l0,	%g6,	%l3
loop_1328:
	fmul8ulx16	%f30,	%f28,	%f26
	tcs	%icc,	0x3
	movle	%xcc,	%i7,	%l4
	fcmpeq16	%f16,	%f4,	%g3
	movg	%icc,	%g4,	%g2
	set	0x30, %o7
	swapa	[%l7 + %o7] 0x80,	%o0
	orncc	%g7,	%o7,	%l1
	tg	%icc,	0x1
	movn	%icc,	%i0,	%i2
	mulx	%o3,	%i6,	%i3
	ldsw	[%l7 + 0x64],	%i4
	sth	%i1,	[%l7 + 0x4A]
	movleu	%xcc,	%o2,	%l6
	add	%l7,	0x30,	%l6
	wr	%g0,	0x18,	%asi
	ldxa	[%l6] %asi,	%o1
	casxa	[%l6] %asi,	%o1,	%i5
	srlx	%g1,	%l5,	%l2
	fandnot1	%f18,	%f4,	%f22
	udivx	%o4,	0x04A1,	%o5
	ldsb	[%l7 + 0x51],	%g5
	te	%icc,	0x1
	movrgz	%o6,	0x360,	%g6
	movge	%icc,	%l3,	%l0
	fmul8x16	%f19,	%f14,	%f6
	tneg	%icc,	0x1
	tg	%xcc,	0x7
	fbe	%fcc0,	loop_1329
	mulx	%i7,	0x0E2A,	%g3
	tpos	%icc,	0x5
	tn	%xcc,	0x1
loop_1329:
	sdivcc	%g4,	0x0E5F,	%l4
	sra	%g2,	%o0,	%o7
	taddcc	%l1,	%g7,	%i2
	fbn,a	%fcc0,	loop_1330
	edge32	%o3,	%i6,	%i3
	fblg	%fcc3,	loop_1331
	srl	%i4,	0x0C,	%i1
loop_1330:
	subcc	%i0,	%o2,	%l6
	fbule	%fcc0,	loop_1332
loop_1331:
	ta	%xcc,	0x2
	sethi	0x0F55,	%i5
	set	0x64, %i3
	lda	[%l7 + %i3] 0x88,	%f18
loop_1332:
	sethi	0x09AA,	%o1
	subcc	%g1,	0x0E16,	%l2
	fbug,a	%fcc2,	loop_1333
	fbule	%fcc1,	loop_1334
	array32	%l5,	%o5,	%o4
	fpmerge	%f13,	%f5,	%f28
loop_1333:
	pdist	%f22,	%f12,	%f4
loop_1334:
	mulscc	%o6,	%g6,	%g5
	xorcc	%l3,	%i7,	%l0
	smulcc	%g3,	0x17F7,	%g4
	fmovdge	%icc,	%f2,	%f13
	umulcc	%l4,	%g2,	%o0
	movrgz	%l1,	0x396,	%g7
	movl	%icc,	%i2,	%o3
	fmovsgu	%icc,	%f19,	%f10
	std	%o6,	[%l7 + 0x60]
	orcc	%i3,	%i4,	%i6
	alignaddrl	%i1,	%i0,	%l6
	tsubcc	%o2,	%i5,	%o1
	tpos	%xcc,	0x6
	edge16	%g1,	%l5,	%l2
	fnand	%f10,	%f4,	%f6
	set	0x78, %i5
	lda	[%l7 + %i5] 0x11,	%f17
	orcc	%o5,	%o6,	%g6
	set	0x20, %l5
	stda	%o4,	[%l7 + %l5] 0xeb
	membar	#Sync
	array8	%g5,	%i7,	%l0
	mova	%xcc,	%g3,	%l3
	bpos,a	loop_1335
	sll	%g4,	0x02,	%l4
	addcc	%o0,	%g2,	%g7
	fmovrdgez	%i2,	%f28,	%f16
loop_1335:
	movrlez	%l1,	0x06A,	%o3
	movgu	%icc,	%i3,	%o7
	edge32l	%i6,	%i1,	%i4
	array16	%l6,	%o2,	%i5
	udiv	%i0,	0x0B49,	%g1
	movleu	%xcc,	%l5,	%o1
	tleu	%icc,	0x4
	tpos	%xcc,	0x2
	ta	%xcc,	0x7
	tleu	%xcc,	0x7
	sllx	%o5,	%o6,	%g6
	fbn	%fcc3,	loop_1336
	bgu,pn	%xcc,	loop_1337
	ldsw	[%l7 + 0x18],	%l2
	nop
	setx	loop_1338,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_1336:
	fxnor	%f10,	%f10,	%f2
loop_1337:
	fmovrdlez	%o4,	%f22,	%f6
	mova	%icc,	%g5,	%i7
loop_1338:
	movneg	%icc,	%l0,	%l3
	addcc	%g3,	%g4,	%l4
	mulx	%g2,	0x0D50,	%o0
	edge32l	%i2,	%g7,	%o3
	edge32l	%l1,	%i3,	%i6
	movcs	%xcc,	%o7,	%i1
	ldsh	[%l7 + 0x54],	%l6
	pdist	%f12,	%f28,	%f10
	and	%i4,	%i5,	%o2
	movrgz	%i0,	%g1,	%o1
	addccc	%o5,	%o6,	%g6
	edge32l	%l2,	%o4,	%g5
	movvc	%icc,	%i7,	%l0
	tne	%icc,	0x3
	bn,a,pn	%xcc,	loop_1339
	bge,pn	%xcc,	loop_1340
	xnorcc	%l3,	0x14A6,	%g3
	sdivx	%g4,	0x149D,	%l4
loop_1339:
	fornot1s	%f19,	%f31,	%f25
loop_1340:
	fmovdvs	%icc,	%f17,	%f22
	fpackfix	%f2,	%f11
	alignaddr	%g2,	%l5,	%i2
	smul	%o0,	0x1857,	%g7
	bvc	%xcc,	loop_1341
	addc	%o3,	%i3,	%l1
	movg	%icc,	%o7,	%i1
	wr	%g0,	0x89,	%asi
	prefetcha	[%l7 + 0x60] %asi,	 0x1
loop_1341:
	subc	%i6,	%i5,	%o2
	set	0x60, %o4
	stda	%i0,	[%l7 + %o4] 0x10
	movleu	%xcc,	%i4,	%o1
	add	%o5,	%g1,	%o6
	udivcc	%g6,	0x16A5,	%l2
	fandnot1s	%f19,	%f13,	%f18
	set	0x50, %l6
	sta	%f24,	[%l7 + %l6] 0x0c
	sir	0x13B1
	wr	%g0,	0x80,	%asi
	sta	%f26,	[%l7 + 0x44] %asi
	smul	%o4,	0x0017,	%i7
	fexpand	%f15,	%f8
	orcc	%g5,	0x0730,	%l3
	movle	%icc,	%l0,	%g4
	fpsub32s	%f5,	%f12,	%f29
	udivcc	%l4,	0x1E54,	%g2
	movcs	%xcc,	%g3,	%l5
	smul	%i2,	0x1F8F,	%o0
	mulscc	%g7,	%i3,	%o3
	srlx	%l1,	%o7,	%l6
	movre	%i6,	0x313,	%i1
	mulscc	%i5,	0x0091,	%o2
	tsubcctv	%i0,	%i4,	%o1
	movvc	%xcc,	%o5,	%o6
	fbo	%fcc0,	loop_1342
	fcmpd	%fcc1,	%f8,	%f14
	sllx	%g6,	0x0B,	%g1
	fnot2	%f26,	%f26
loop_1342:
	fmovdvs	%xcc,	%f2,	%f31
	tgu	%xcc,	0x0
	tcs	%icc,	0x5
	srax	%o4,	%l2,	%g5
	sub	%l3,	0x0D17,	%l0
	sra	%i7,	0x10,	%l4
	udiv	%g2,	0x0DDE,	%g4
	fpack16	%f0,	%f27
	sub	%g3,	%l5,	%i2
	swap	[%l7 + 0x40],	%g7
	fpack32	%f10,	%f2,	%f14
	bcc	%xcc,	loop_1343
	sdivx	%i3,	0x1EAA,	%o0
	fmovsvs	%icc,	%f21,	%f26
	fbge,a	%fcc1,	loop_1344
loop_1343:
	te	%xcc,	0x4
	fpadd32s	%f19,	%f3,	%f30
	edge8	%l1,	%o3,	%l6
loop_1344:
	fexpand	%f13,	%f28
	set	0x52, %i4
	stha	%i6,	[%l7 + %i4] 0x2f
	membar	#Sync
	movcs	%icc,	%i1,	%i5
	fmul8ulx16	%f10,	%f12,	%f10
	alignaddrl	%o7,	%o2,	%i0
	tvs	%icc,	0x2
	fmovdne	%xcc,	%f31,	%f5
	mulx	%o1,	%i4,	%o5
	edge16l	%g6,	%g1,	%o6
	edge16l	%o4,	%g5,	%l3
	movre	%l2,	%i7,	%l4
	sra	%g2,	%l0,	%g4
	movvc	%icc,	%l5,	%i2
	bgu,a	loop_1345
	bvs,a	loop_1346
	bcs	loop_1347
	array16	%g7,	%i3,	%g3
loop_1345:
	nop
	set	0x1C, %o5
	lda	[%l7 + %o5] 0x89,	%f24
loop_1346:
	fmovdne	%icc,	%f15,	%f23
loop_1347:
	nop
	set	0x30, %g5
	lduw	[%l7 + %g5],	%l1
	wr	%g0,	0x89,	%asi
	stba	%o3,	[%l7 + 0x67] %asi
	fba,a	%fcc0,	loop_1348
	edge32n	%l6,	%o0,	%i6
	mulscc	%i5,	%o7,	%o2
	fnegs	%f16,	%f12
loop_1348:
	fsrc2s	%f24,	%f2
	add	%l7,	0x08,	%l6
	wr	%g0,	0x04,	%asi
	ldxa	[%l6] %asi,	%i0
	casxa	[%l6] 0x04,	%i0,	%i1
	fandnot1s	%f10,	%f13,	%f28
	mova	%icc,	%o1,	%o5
	alignaddrl	%i4,	%g1,	%o6
	subc	%o4,	0x10A3,	%g6
	or	%l3,	%l2,	%i7
	xor	%l4,	0x0910,	%g5
	wr	%g0,	0x80,	%asi
	ldxa	[%l7 + 0x18] %asi,	%g2
	taddcc	%l0,	0x12C0,	%g4
	wr	%g0,	0x0c,	%asi
	lduwa	[%l7 + 0x20] %asi,	%l5
	edge16n	%g7,	%i3,	%g3
	bvc,a	%icc,	loop_1349
	tneg	%icc,	0x7
	popc	%l1,	%i2
	movpos	%xcc,	%l6,	%o3
loop_1349:
	andncc	%i6,	%i5,	%o7
	membar	#Sync
	set	0x40, %g7
	ldda	[%l7 + %g7] 0x17,	%f16
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bgu,a	%xcc,	loop_1350
	fpsub16	%f26,	%f0,	%f2
	taddcctv	%o2,	0x1C74,	%o0
	tle	%icc,	0x2
loop_1350:
	fnor	%f26,	%f20,	%f18
	movleu	%xcc,	%i0,	%o1
	bvc	%xcc,	loop_1351
	udiv	%i1,	0x1033,	%o5
	set	0x2C, %i2
	sta	%f15,	[%l7 + %i2] 0x15
loop_1351:
	edge16ln	%g1,	%o6,	%o4
	fbg,a	%fcc1,	loop_1352
	edge32ln	%i4,	%g6,	%l3
	ble	loop_1353
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1352:
	sdivcc	%l2,	0x1CF2,	%l4
	stb	%g5,	[%l7 + 0x3D]
loop_1353:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srax	%g2,	%l0,	%g4
	array8	%l5,	%g7,	%i7
	tvc	%icc,	0x7
	std	%g2,	[%l7 + 0x40]
	movleu	%xcc,	%l1,	%i3
	movg	%xcc,	%i2,	%l6
	edge32l	%o3,	%i5,	%o7
	sdivcc	%i6,	0x0004,	%o2
	brgz	%o0,	loop_1354
	fxnors	%f23,	%f8,	%f14
	udivx	%i0,	0x0D85,	%o1
	bleu	loop_1355
loop_1354:
	array8	%i1,	%o5,	%g1
	edge8	%o6,	%o4,	%g6
	tne	%xcc,	0x2
loop_1355:
	andn	%i4,	%l3,	%l4
	ldstub	[%l7 + 0x7B],	%g5
	std	%f18,	[%l7 + 0x58]
	edge16ln	%g2,	%l0,	%l2
	movvc	%xcc,	%g4,	%g7
	brgz	%i7,	loop_1356
	ta	%xcc,	0x5
	fmovspos	%xcc,	%f29,	%f8
	movneg	%icc,	%g3,	%l1
loop_1356:
	addccc	%l5,	%i3,	%i2
	sdivx	%l6,	0x1C24,	%i5
	ldstub	[%l7 + 0x73],	%o3
	ba	%icc,	loop_1357
	tcc	%icc,	0x6
	orncc	%i6,	0x0BB0,	%o2
	nop
	setx loop_1358, %l0, %l1
	jmpl %l1, %o7
loop_1357:
	edge8n	%o0,	%i0,	%o1
	addccc	%i1,	0x1B26,	%g1
	flush	%l7 + 0x20
loop_1358:
	for	%f4,	%f28,	%f12
	fsrc1	%f26,	%f8
	movcc	%xcc,	%o5,	%o6
	movleu	%icc,	%o4,	%i4
	brlez	%l3,	loop_1359
	bgu,pn	%xcc,	loop_1360
	edge32	%g6,	%g5,	%l4
	movvs	%xcc,	%g2,	%l2
loop_1359:
	taddcc	%g4,	0x104F,	%g7
loop_1360:
	fba,a	%fcc0,	loop_1361
	sra	%l0,	0x19,	%i7
	nop
	set	0x20, %g6
	ldd	[%l7 + %g6],	%f24
	edge16l	%l1,	%l5,	%g3
loop_1361:
	movg	%icc,	%i3,	%l6
	fandnot2s	%f30,	%f30,	%f13
	fpackfix	%f2,	%f6
	edge32ln	%i2,	%o3,	%i6
	tneg	%xcc,	0x6
	bn	%icc,	loop_1362
	tneg	%icc,	0x6
	bne,a,pn	%icc,	loop_1363
	tvc	%icc,	0x2
loop_1362:
	xorcc	%o2,	0x0D9B,	%o7
	taddcc	%i5,	%o0,	%o1
loop_1363:
	tl	%icc,	0x7
	movl	%icc,	%i1,	%g1
	edge32l	%o5,	%o6,	%i0
	membar	0x0E
	bg,a,pt	%icc,	loop_1364
	fone	%f24
	array16	%i4,	%l3,	%g6
	fbul	%fcc3,	loop_1365
loop_1364:
	ta	%icc,	0x6
	set	0x21, %g2
	ldstuba	[%l7 + %g2] 0x88,	%o4
loop_1365:
	ldd	[%l7 + 0x78],	%g4
	fnor	%f30,	%f30,	%f8
	movpos	%icc,	%l4,	%l2
	fnot2	%f14,	%f28
	alignaddrl	%g2,	%g7,	%l0
	tneg	%icc,	0x7
	sdivx	%i7,	0x0283,	%l1
	orncc	%l5,	0x15AE,	%g3
	fmovse	%xcc,	%f14,	%f25
	movpos	%icc,	%g4,	%i3
	edge32ln	%i2,	%l6,	%i6
	fxnors	%f1,	%f5,	%f25
	ld	[%l7 + 0x08],	%f18
	movcs	%xcc,	%o2,	%o3
	brgez	%o7,	loop_1366
	movre	%i5,	%o1,	%i1
	movrlz	%g1,	0x0C4,	%o0
	set	0x1A, %l1
	ldstuba	[%l7 + %l1] 0x0c,	%o5
loop_1366:
	fabsd	%f2,	%f22
	movpos	%icc,	%o6,	%i4
	fmul8x16	%f7,	%f18,	%f0
	addccc	%i0,	%g6,	%l3
	tgu	%xcc,	0x5
	set	0x7B, %i1
	stba	%g5,	[%l7 + %i1] 0x14
	sra	%o4,	0x04,	%l4
	wr	%g0,	0x04,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	fand	%f16,	%f12,	%f26
	xnorcc	%g2,	0x0A3A,	%l2
	movre	%l0,	%g7,	%l1
	subc	%i7,	0x0B37,	%g3
	sll	%g4,	0x04,	%l5
	tl	%xcc,	0x5
	addc	%i3,	0x0D51,	%l6
	ta	%icc,	0x6
	edge8ln	%i6,	%i2,	%o2
	movrlez	%o3,	%o7,	%o1
	srlx	%i1,	0x17,	%g1
	fmovdcs	%xcc,	%f14,	%f16
	fmovdge	%xcc,	%f14,	%f14
	faligndata	%f4,	%f12,	%f22
	stb	%o0,	[%l7 + 0x46]
	movvs	%icc,	%i5,	%o6
	orncc	%i4,	%o5,	%g6
	movrgz	%i0,	%l3,	%o4
	tvs	%icc,	0x4
	bcc,a	%icc,	loop_1367
	movcs	%xcc,	%l4,	%g5
	bn,pt	%xcc,	loop_1368
	tl	%icc,	0x1
loop_1367:
	movvs	%icc,	%l2,	%l0
	nop
	setx	loop_1369,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_1368:
	tleu	%xcc,	0x2
	swap	[%l7 + 0x3C],	%g2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1369:
	nop
	set	0x0B, %o1
	stba	%l1,	[%l7 + %o1] 0x15
	addcc	%g7,	%g3,	%i7
	fbuge	%fcc3,	loop_1370
	tl	%icc,	0x2
	std	%l4,	[%l7 + 0x08]
	nop
	setx	loop_1371,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_1370:
	nop
	setx	loop_1372,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	ldstub	[%l7 + 0x78],	%g4
	nop
	setx	loop_1373,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_1371:
	mova	%icc,	%l6,	%i6
loop_1372:
	movcs	%xcc,	%i2,	%o2
	fcmpes	%fcc3,	%f15,	%f5
loop_1373:
	xorcc	%o3,	%i3,	%o7
	fmovdne	%xcc,	%f13,	%f29
	edge16l	%i1,	%g1,	%o0
	fmul8ulx16	%f16,	%f8,	%f4
	orncc	%o1,	%i5,	%o6
	movcc	%icc,	%i4,	%o5
	fmovdg	%icc,	%f9,	%f13
	ta	%icc,	0x5
	array8	%g6,	%l3,	%o4
	or	%l4,	0x096A,	%g5
	tneg	%icc,	0x2
	orcc	%i0,	0x14E8,	%l0
	bshuffle	%f18,	%f8,	%f8
	tgu	%xcc,	0x7
	wr	%g0,	0x19,	%asi
	lduwa	[%l7 + 0x38] %asi,	%g2
	brgez	%l2,	loop_1374
	xnor	%g7,	%g3,	%i7
	tg	%xcc,	0x2
	array8	%l5,	%l1,	%l6
loop_1374:
	bgu,a,pt	%xcc,	loop_1375
	smul	%g4,	%i2,	%o2
	fsrc1	%f0,	%f14
	ldub	[%l7 + 0x6E],	%o3
loop_1375:
	popc	%i6,	%i3
	smul	%o7,	0x0539,	%g1
	ldstub	[%l7 + 0x71],	%i1
	tne	%icc,	0x2
	fmovsg	%icc,	%f8,	%f14
	movrlez	%o0,	0x1FD,	%o1
	movleu	%xcc,	%o6,	%i4
	sub	%o5,	%g6,	%i5
	sub	%l3,	%o4,	%g5
	addccc	%l4,	%l0,	%g2
	fpsub16s	%f6,	%f0,	%f5
	fbule	%fcc1,	loop_1376
	bcc	%xcc,	loop_1377
	andncc	%i0,	%l2,	%g7
	fmovdg	%icc,	%f1,	%f25
loop_1376:
	bvc,pt	%icc,	loop_1378
loop_1377:
	tgu	%icc,	0x5
	fones	%f18
	fbul,a	%fcc1,	loop_1379
loop_1378:
	smulcc	%i7,	0x07E4,	%l5
	tne	%xcc,	0x3
	subcc	%l1,	%l6,	%g3
loop_1379:
	nop
	set	0x64, %o3
	lduwa	[%l7 + %o3] 0x88,	%g4
	mova	%icc,	%o2,	%i2
	brz	%i6,	loop_1380
	lduw	[%l7 + 0x74],	%i3
	prefetch	[%l7 + 0x74],	 0x2
	umulcc	%o7,	0x1F9B,	%g1
loop_1380:
	tneg	%xcc,	0x4
	prefetch	[%l7 + 0x70],	 0x2
	brnz,a	%i1,	loop_1381
	for	%f26,	%f30,	%f8
	sdiv	%o3,	0x0586,	%o1
	movrlez	%o6,	%i4,	%o5
loop_1381:
	andcc	%g6,	%o0,	%l3
	andncc	%i5,	%o4,	%g5
	stbar
	movvc	%xcc,	%l0,	%g2
	for	%f12,	%f4,	%f6
	ldsw	[%l7 + 0x0C],	%i0
	sir	0x1A2B
	xorcc	%l4,	%l2,	%g7
	subc	%l5,	%l1,	%i7
	xnorcc	%l6,	0x0189,	%g3
	addcc	%g4,	%i2,	%o2
	fbu	%fcc1,	loop_1382
	fmovse	%icc,	%f26,	%f0
	movcc	%xcc,	%i6,	%i3
	fmovdvc	%icc,	%f22,	%f11
loop_1382:
	fpsub16	%f20,	%f6,	%f10
	movn	%xcc,	%o7,	%i1
	subccc	%g1,	%o1,	%o3
	tleu	%icc,	0x5
	xnorcc	%o6,	%i4,	%g6
	fbue,a	%fcc2,	loop_1383
	sub	%o0,	0x0BA8,	%l3
	tl	%icc,	0x1
	addcc	%o5,	%o4,	%i5
loop_1383:
	sth	%g5,	[%l7 + 0x72]
	bvs,a,pn	%xcc,	loop_1384
	tle	%xcc,	0x3
	movg	%xcc,	%l0,	%g2
	movrne	%i0,	0x2AB,	%l4
loop_1384:
	te	%xcc,	0x4
	fsrc1s	%f30,	%f10
	movrne	%g7,	%l5,	%l2
	fzero	%f24
	fpack32	%f24,	%f10,	%f24
	movrlez	%l1,	0x010,	%l6
	fand	%f24,	%f8,	%f28
	movle	%xcc,	%g3,	%g4
	add	%l7,	0x50,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] %asi,	%i2,	%i7
	movleu	%xcc,	%o2,	%i6
	fsrc1s	%f18,	%f12
	andncc	%i3,	%i1,	%g1
	addcc	%o7,	%o1,	%o3
	fmovspos	%xcc,	%f6,	%f24
	fmovdleu	%xcc,	%f17,	%f27
	mova	%icc,	%o6,	%g6
	movrgz	%o0,	%l3,	%i4
	edge16n	%o4,	%o5,	%i5
	fcmpd	%fcc1,	%f22,	%f0
	set	0x20, %i0
	stxa	%l0,	[%l7 + %i0] 0x2f
	membar	#Sync
	alignaddrl	%g2,	%g5,	%l4
	subcc	%i0,	0x039C,	%l5
	or	%l2,	%g7,	%l1
	wr	%g0,	0xea,	%asi
	stba	%g3,	[%l7 + 0x56] %asi
	membar	#Sync
	fmovrslz	%l6,	%f7,	%f28
	edge32	%g4,	%i7,	%o2
	tgu	%xcc,	0x1
	movrlez	%i2,	0x21D,	%i3
	bl,a,pn	%icc,	loop_1385
	movrne	%i6,	0x30B,	%g1
	fxor	%f30,	%f12,	%f24
	movg	%icc,	%i1,	%o7
loop_1385:
	te	%xcc,	0x7
	stw	%o3,	[%l7 + 0x38]
	sir	0x1755
	fbu,a	%fcc1,	loop_1386
	movneg	%xcc,	%o1,	%o6
	udivcc	%g6,	0x1D12,	%o0
	sllx	%l3,	0x01,	%i4
loop_1386:
	tsubcctv	%o5,	%o4,	%l0
	edge16ln	%g2,	%i5,	%g5
	umul	%i0,	%l5,	%l4
	bcc,a,pt	%icc,	loop_1387
	fandnot1	%f0,	%f4,	%f4
	fpadd32	%f14,	%f30,	%f0
	orn	%l2,	%g7,	%l1
loop_1387:
	fblg	%fcc1,	loop_1388
	fand	%f10,	%f28,	%f14
	bvc	%icc,	loop_1389
	movrne	%g3,	%g4,	%i7
loop_1388:
	addccc	%o2,	0x095A,	%l6
	tsubcc	%i2,	0x10CE,	%i3
loop_1389:
	or	%i6,	%i1,	%g1
	tsubcctv	%o7,	0x16B9,	%o1
	fzero	%f22
	tgu	%xcc,	0x6
	tvs	%xcc,	0x6
	edge8ln	%o6,	%g6,	%o0
	taddcctv	%o3,	0x1720,	%i4
	bcs,a,pt	%icc,	loop_1390
	xnor	%o5,	%l3,	%o4
	orcc	%l0,	0x1702,	%g2
	fbg,a	%fcc3,	loop_1391
loop_1390:
	andcc	%g5,	0x1490,	%i5
	set	0x6C, %l2
	lda	[%l7 + %l2] 0x89,	%f1
loop_1391:
	tle	%xcc,	0x5
	edge8ln	%i0,	%l5,	%l4
	fmovdgu	%xcc,	%f13,	%f24
	fornot1	%f16,	%f8,	%f22
	flush	%l7 + 0x24
	tl	%xcc,	0x6
	movrne	%g7,	0x1AD,	%l1
	sub	%l2,	%g4,	%g3
	edge8l	%o2,	%i7,	%l6
	fmovrdgz	%i3,	%f24,	%f20
	wr	%g0,	0x80,	%asi
	lda	[%l7 + 0x7C] %asi,	%f6
	tpos	%icc,	0x2
	tvs	%xcc,	0x6
	srax	%i2,	0x0B,	%i1
	tneg	%xcc,	0x6
	ldsh	[%l7 + 0x38],	%g1
	bpos,pt	%xcc,	loop_1392
	lduw	[%l7 + 0x64],	%o7
	tneg	%xcc,	0x5
	mova	%icc,	%i6,	%o6
loop_1392:
	prefetch	[%l7 + 0x3C],	 0x0
	edge32l	%g6,	%o0,	%o1
	fcmpes	%fcc0,	%f13,	%f20
	move	%icc,	%o3,	%i4
	sra	%o5,	%l3,	%l0
	pdist	%f30,	%f8,	%f16
	taddcctv	%g2,	0x0D94,	%g5
	fones	%f28
	movre	%i5,	%i0,	%o4
	array8	%l5,	%g7,	%l1
	andcc	%l2,	0x04A2,	%g4
	mova	%xcc,	%l4,	%o2
	faligndata	%f14,	%f2,	%f30
	fnegs	%f4,	%f11
	edge32l	%i7,	%g3,	%l6
	nop
	set	0x48, %l3
	stb	%i3,	[%l7 + %l3]
	sethi	0x03D5,	%i2
	ta	%xcc,	0x7
	fxors	%f20,	%f20,	%f14
	fors	%f4,	%f29,	%f7
	fbn	%fcc2,	loop_1393
	subcc	%i1,	0x1C8B,	%o7
	fnot2s	%f14,	%f28
	bge,a,pt	%icc,	loop_1394
loop_1393:
	fba,a	%fcc2,	loop_1395
	movne	%xcc,	%g1,	%o6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1394:
	orn	%g6,	%o0,	%i6
loop_1395:
	orcc	%o1,	%i4,	%o3
	orn	%l3,	0x1F7E,	%l0
	fmovrse	%o5,	%f10,	%f14
	addccc	%g5,	0x0D08,	%i5
	and	%g2,	0x106F,	%o4
	tgu	%xcc,	0x1
	edge8ln	%l5,	%g7,	%i0
	edge32ln	%l2,	%g4,	%l1
	tge	%icc,	0x6
	fmul8x16	%f28,	%f18,	%f28
	brlez,a	%o2,	loop_1396
	sub	%i7,	0x074F,	%l4
	lduw	[%l7 + 0x10],	%l6
	sllx	%i3,	0x0A,	%g3
loop_1396:
	brnz	%i2,	loop_1397
	movge	%icc,	%o7,	%g1
	smul	%i1,	%g6,	%o0
	bpos,a,pt	%icc,	loop_1398
loop_1397:
	te	%icc,	0x3
	fmovsvc	%xcc,	%f16,	%f1
	array16	%i6,	%o6,	%i4
loop_1398:
	fmovsge	%xcc,	%f22,	%f21
	wr	%g0,	0x18,	%asi
	lda	[%l7 + 0x7C] %asi,	%f8
	flush	%l7 + 0x68
	subccc	%o1,	%o3,	%l3
	sth	%o5,	[%l7 + 0x74]
	subccc	%l0,	%g5,	%i5
	movvs	%xcc,	%o4,	%g2
	bcs	%icc,	loop_1399
	add	%l5,	%g7,	%l2
	movrne	%i0,	0x362,	%g4
	movleu	%icc,	%o2,	%i7
loop_1399:
	edge16ln	%l4,	%l1,	%i3
	movge	%xcc,	%l6,	%i2
	srax	%o7,	0x0D,	%g1
	andncc	%g3,	%i1,	%g6
	orn	%i6,	0x0768,	%o0
	stb	%o6,	[%l7 + 0x09]
	fbe,a	%fcc3,	loop_1400
	smulcc	%o1,	%i4,	%o3
	subcc	%l3,	%o5,	%g5
	fbuge	%fcc1,	loop_1401
loop_1400:
	movl	%icc,	%i5,	%l0
	fmovde	%xcc,	%f26,	%f12
	fbu	%fcc3,	loop_1402
loop_1401:
	tne	%xcc,	0x6
	sll	%o4,	0x19,	%l5
	fbul	%fcc2,	loop_1403
loop_1402:
	fpsub16s	%f29,	%f29,	%f15
	movrlez	%g7,	%g2,	%l2
	movne	%xcc,	%g4,	%o2
loop_1403:
	movcs	%xcc,	%i0,	%i7
	andncc	%l4,	%l1,	%i3
	alignaddrl	%i2,	%l6,	%o7
	array16	%g3,	%i1,	%g6
	taddcc	%i6,	%o0,	%o6
	edge16l	%g1,	%i4,	%o1
	movcs	%icc,	%l3,	%o5
	ldstub	[%l7 + 0x7E],	%o3
	fbe,a	%fcc0,	loop_1404
	movrlez	%i5,	0x0A6,	%g5
	fnot2s	%f17,	%f14
	edge32l	%l0,	%l5,	%o4
loop_1404:
	sth	%g7,	[%l7 + 0x2E]
	flush	%l7 + 0x4C
	ldstub	[%l7 + 0x2A],	%l2
	sethi	0x13FB,	%g4
	bne,pt	%icc,	loop_1405
	xorcc	%g2,	%i0,	%o2
	tgu	%xcc,	0x1
	smulcc	%l4,	%l1,	%i7
loop_1405:
	movne	%icc,	%i2,	%l6
	tvc	%icc,	0x7
	fsrc1s	%f8,	%f6
	ldstub	[%l7 + 0x7A],	%o7
	movre	%i3,	0x1B6,	%i1
	set	0x58, %g4
	stxa	%g6,	[%l7 + %g4] 0xe2
	membar	#Sync
	fmovrslz	%g3,	%f17,	%f2
	edge16ln	%i6,	%o6,	%o0
	udivcc	%i4,	0x1DEB,	%o1
	edge32l	%l3,	%g1,	%o5
	umulcc	%i5,	%o3,	%l0
	mulx	%g5,	%o4,	%l5
	srl	%g7,	0x14,	%g4
	nop
	setx	loop_1406,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	edge16ln	%l2,	%i0,	%o2
	bcs,pt	%xcc,	loop_1407
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1406:
	ld	[%l7 + 0x24],	%f0
	bvs,a,pt	%xcc,	loop_1408
loop_1407:
	xnor	%g2,	%l4,	%l1
	edge16l	%i7,	%l6,	%o7
	subc	%i2,	0x0B53,	%i3
loop_1408:
	smul	%i1,	0x1ACD,	%g6
	mulx	%i6,	%o6,	%o0
	ba,a,pt	%xcc,	loop_1409
	taddcctv	%g3,	0x0744,	%o1
	tg	%icc,	0x7
	movvc	%xcc,	%l3,	%g1
loop_1409:
	edge8l	%i4,	%o5,	%o3
	sub	%l0,	0x0B06,	%g5
	srlx	%i5,	0x1D,	%l5
	bn,a,pn	%icc,	loop_1410
	tl	%xcc,	0x0
	movleu	%xcc,	%o4,	%g7
	fmovsleu	%xcc,	%f24,	%f13
loop_1410:
	nop
	wr	%g0,	0x80,	%asi
	ldxa	[%l7 + 0x20] %asi,	%g4
	set	0x54, %g3
	stwa	%l2,	[%l7 + %g3] 0x2b
	membar	#Sync
	addc	%i0,	0x1B1D,	%g2
	bge	loop_1411
	fbue,a	%fcc0,	loop_1412
	tcs	%icc,	0x2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1411:
	taddcc	%o2,	%l4,	%i7
loop_1412:
	tle	%xcc,	0x0
	fpack32	%f4,	%f22,	%f18
	fpsub32	%f6,	%f30,	%f8
	wr	%g0,	0x80,	%asi
	lda	[%l7 + 0x28] %asi,	%f5
	sllx	%l1,	0x04,	%o7
	stw	%l6,	[%l7 + 0x28]
	fmovdneg	%icc,	%f26,	%f14
	sethi	0x12BD,	%i2
	xorcc	%i3,	0x1252,	%i1
	alignaddrl	%i6,	%g6,	%o6
	ldsh	[%l7 + 0x2E],	%o0
	ldstub	[%l7 + 0x6E],	%o1
	subccc	%l3,	0x14D8,	%g1
	movcs	%icc,	%g3,	%o5
	st	%f23,	[%l7 + 0x6C]
	std	%i4,	[%l7 + 0x58]
	wr	%g0,	0x88,	%asi
	lda	[%l7 + 0x54] %asi,	%f16
	ldsb	[%l7 + 0x2C],	%o3
	edge32ln	%g5,	%l0,	%l5
	subc	%i5,	%g7,	%o4
	fmul8sux16	%f28,	%f20,	%f16
	fmovrsgz	%g4,	%f28,	%f16
	xnorcc	%l2,	%i0,	%o2
	sub	%l4,	%i7,	%g2
	addccc	%l1,	0x03CF,	%o7
	prefetch	[%l7 + 0x74],	 0x0
	movcs	%xcc,	%i2,	%l6
	fbule,a	%fcc2,	loop_1413
	movrne	%i1,	0x035,	%i3
	fabss	%f3,	%f12
	ld	[%l7 + 0x64],	%f27
loop_1413:
	srax	%i6,	%g6,	%o6
	fcmple32	%f24,	%f6,	%o0
	fnot1s	%f22,	%f7
	array32	%l3,	%g1,	%o1
	bcs	%xcc,	loop_1414
	fble,a	%fcc2,	loop_1415
	movg	%icc,	%g3,	%o5
	siam	0x6
loop_1414:
	fbl,a	%fcc2,	loop_1416
loop_1415:
	edge32n	%o3,	%g5,	%l0
	movrlz	%l5,	%i5,	%i4
	sdivx	%o4,	0x1602,	%g4
loop_1416:
	tvs	%xcc,	0x7
	tpos	%xcc,	0x1
	udiv	%g7,	0x06C6,	%i0
	sllx	%o2,	0x0D,	%l2
	fnot1s	%f11,	%f1
	edge16l	%l4,	%g2,	%l1
	nop
	setx	loop_1417,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	array32	%i7,	%o7,	%i2
	srl	%i1,	%l6,	%i6
	tvs	%xcc,	0x3
loop_1417:
	fpsub16s	%f5,	%f3,	%f3
	fbue,a	%fcc1,	loop_1418
	bcc,a,pn	%xcc,	loop_1419
	xor	%i3,	%o6,	%o0
	movrne	%l3,	%g6,	%o1
loop_1418:
	edge32n	%g1,	%o5,	%o3
loop_1419:
	array32	%g3,	%l0,	%l5
	tsubcctv	%i5,	0x1E0E,	%g5
	movg	%xcc,	%i4,	%g4
	movneg	%icc,	%g7,	%o4
	smul	%i0,	%o2,	%l2
	fnegd	%f6,	%f8
	addcc	%g2,	%l4,	%l1
	fsrc2	%f22,	%f8
	array32	%i7,	%i2,	%o7
	movcs	%icc,	%i1,	%i6
	set	0x70, %o2
	ldstuba	[%l7 + %o2] 0x80,	%l6
	membar	0x32
	wr	%g0,	0x0c,	%asi
	stda	%i2,	[%l7 + 0x28] %asi
	fmovsle	%icc,	%f10,	%f27
	smul	%o6,	0x0A18,	%o0
	xnorcc	%l3,	%o1,	%g6
	st	%f17,	[%l7 + 0x50]
	fmovsgu	%icc,	%f9,	%f2
	movvs	%icc,	%o5,	%g1
	lduh	[%l7 + 0x70],	%g3
	movle	%icc,	%l0,	%l5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tvs	%xcc,	0x2
	sdiv	%i5,	0x1686,	%o3
	subc	%g5,	0x1F1D,	%i4
	move	%icc,	%g7,	%o4
	smulcc	%i0,	%o2,	%g4
	set	0x38, %l0
	stha	%l2,	[%l7 + %l0] 0x88
	taddcc	%g2,	%l1,	%l4
	bleu,a,pn	%xcc,	loop_1420
	movleu	%xcc,	%i2,	%o7
	fmovda	%icc,	%f0,	%f11
	array16	%i7,	%i1,	%i6
loop_1420:
	addcc	%i3,	0x074A,	%l6
	fandnot2	%f12,	%f12,	%f18
	fzero	%f16
	swap	[%l7 + 0x40],	%o6
	xnorcc	%o0,	%l3,	%g6
	fmovdcc	%xcc,	%f31,	%f9
	mulx	%o5,	%o1,	%g1
	ldsh	[%l7 + 0x46],	%g3
	alignaddrl	%l0,	%i5,	%l5
	brgez	%g5,	loop_1421
	fpsub32s	%f25,	%f26,	%f7
	fbu	%fcc3,	loop_1422
	fmovda	%icc,	%f28,	%f15
loop_1421:
	sra	%o3,	%i4,	%g7
	subccc	%o4,	0x05D6,	%o2
loop_1422:
	ld	[%l7 + 0x48],	%f4
	udivcc	%i0,	0x1162,	%l2
	tl	%icc,	0x1
	movcs	%xcc,	%g4,	%g2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udivcc	%l4,	0x1B96,	%i2
	te	%icc,	0x1
	xnorcc	%o7,	0x052C,	%i7
	fba	%fcc2,	loop_1423
	subcc	%l1,	0x0A10,	%i6
	fnegd	%f26,	%f2
	fcmpes	%fcc3,	%f19,	%f8
loop_1423:
	nop
	set	0x2C, %i6
	ldswa	[%l7 + %i6] 0x14,	%i1
	fbne,a	%fcc3,	loop_1424
	movn	%xcc,	%l6,	%i3
	sra	%o0,	%l3,	%o6
	fxor	%f14,	%f22,	%f6
loop_1424:
	move	%icc,	%g6,	%o1
	move	%xcc,	%o5,	%g3
	movgu	%xcc,	%g1,	%i5
	sdivcc	%l0,	0x04FB,	%l5
	fmovdne	%xcc,	%f11,	%f23
	sra	%g5,	%o3,	%g7
	movl	%xcc,	%i4,	%o4
	movge	%icc,	%i0,	%o2
	wr	%g0,	0x11,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	movge	%xcc,	%l2,	%g2
	sdivx	%l4,	0x0D04,	%i2
	movne	%icc,	%o7,	%i7
	andncc	%l1,	%i6,	%g4
	fbug	%fcc1,	loop_1425
	udiv	%i1,	0x1BEF,	%i3
	siam	0x6
	fmovdvs	%icc,	%f6,	%f18
loop_1425:
	ldsw	[%l7 + 0x4C],	%o0
	bg,pn	%xcc,	loop_1426
	fmovrsgez	%l6,	%f18,	%f20
	movcs	%icc,	%o6,	%g6
	std	%f14,	[%l7 + 0x38]
loop_1426:
	udivcc	%l3,	0x080A,	%o1
	sdiv	%g3,	0x1BD3,	%g1
	edge32n	%i5,	%o5,	%l0
	tgu	%icc,	0x1
	fmovrsgez	%l5,	%f4,	%f30
	ba	%xcc,	loop_1427
	edge16n	%g5,	%o3,	%i4
	addc	%o4,	0x0AA2,	%g7
	call	loop_1428
loop_1427:
	srax	%o2,	%l2,	%g2
	orncc	%l4,	0x0137,	%i0
	xnorcc	%o7,	0x19FA,	%i2
loop_1428:
	fmovdvc	%icc,	%f16,	%f15
	pdist	%f12,	%f28,	%f10
	smul	%l1,	%i6,	%i7
	move	%icc,	%g4,	%i1
	smulcc	%i3,	%l6,	%o6
	edge8	%g6,	%o0,	%o1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbug,a	%fcc2,	loop_1429
	array8	%g3,	%g1,	%i5
	fcmpeq16	%f24,	%f26,	%o5
	fmovscc	%xcc,	%f20,	%f30
loop_1429:
	nop
	wr	%g0,	0x88,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	fand	%f24,	%f8,	%f6
	wr	%g0,	0x11,	%asi
	ldswa	[%l7 + 0x24] %asi,	%l0
	fcmpeq16	%f16,	%f0,	%l5
	srax	%g5,	0x1A,	%o3
	bl	%icc,	loop_1430
	fbule	%fcc0,	loop_1431
	movvs	%xcc,	%l3,	%o4
	movcs	%xcc,	%i4,	%o2
loop_1430:
	fcmpne16	%f14,	%f0,	%l2
loop_1431:
	sethi	0x1847,	%g2
	sub	%l4,	%g7,	%i0
	addccc	%i2,	0x0FBB,	%l1
	fbuge,a	%fcc3,	loop_1432
	fba	%fcc0,	loop_1433
	mova	%xcc,	%i6,	%o7
	fcmpeq16	%f14,	%f26,	%g4
loop_1432:
	nop
	set	0x16, %o6
	stba	%i1,	[%l7 + %o6] 0x11
loop_1433:
	tleu	%icc,	0x4
	tvc	%icc,	0x5
	sdivcc	%i7,	0x1311,	%l6
	xnor	%i3,	0x0E23,	%g6
	stx	%o6,	[%l7 + 0x40]
	sub	%o1,	%o0,	%g3
	alignaddr	%i5,	%g1,	%o5
	movrlez	%l0,	0x1CC,	%g5
	addccc	%o3,	%l5,	%o4
	tleu	%xcc,	0x6
	edge16l	%l3,	%o2,	%l2
	movrlz	%i4,	%g2,	%g7
	fmovsgu	%icc,	%f31,	%f26
	tge	%icc,	0x6
	edge8ln	%i0,	%l4,	%i2
	ta	%icc,	0x5
	ldd	[%l7 + 0x50],	%l0
	wr	%g0,	0x89,	%asi
	lduba	[%l7 + 0x75] %asi,	%o7
	ldsb	[%l7 + 0x5F],	%i6
	edge8	%g4,	%i7,	%l6
	tne	%icc,	0x0
	sra	%i1,	0x06,	%i3
	fpadd16	%f10,	%f16,	%f22
	orn	%g6,	%o6,	%o0
	popc	0x06AD,	%o1
	andcc	%g3,	0x0B42,	%g1
	tcs	%xcc,	0x3
	movrlez	%i5,	%o5,	%g5
	wr	%g0,	0x88,	%asi
	ldxa	[%l7 + 0x28] %asi,	%o3
	stb	%l0,	[%l7 + 0x65]
	mulx	%o4,	%l5,	%l3
	fcmpne16	%f10,	%f16,	%o2
	set	0x18, %g1
	sta	%f1,	[%l7 + %g1] 0x89
	movrlz	%l2,	0x07E,	%i4
	brgez	%g2,	loop_1434
	movrlez	%g7,	%i0,	%l4
	fbn,a	%fcc1,	loop_1435
	edge16l	%l1,	%i2,	%o7
loop_1434:
	xorcc	%i6,	0x1E73,	%i7
	fcmps	%fcc2,	%f15,	%f3
loop_1435:
	fmovsleu	%xcc,	%f15,	%f20
	lduw	[%l7 + 0x64],	%l6
	brgez,a	%g4,	loop_1436
	subc	%i1,	0x1017,	%g6
	movcc	%xcc,	%o6,	%i3
	xorcc	%o0,	0x0AD8,	%g3
loop_1436:
	xnorcc	%o1,	%g1,	%i5
	movle	%xcc,	%g5,	%o3
	set	0x58, %l4
	stxa	%o5,	[%l7 + %l4] 0x89
	xor	%o4,	0x1864,	%l0
	array8	%l3,	%l5,	%o2
	st	%f3,	[%l7 + 0x78]
	set	0x78, %i7
	stda	%l2,	[%l7 + %i7] 0x04
	orn	%g2,	%g7,	%i4
	movpos	%xcc,	%i0,	%l1
	fble	%fcc3,	loop_1437
	movleu	%icc,	%i2,	%o7
	andncc	%l4,	%i6,	%l6
	lduw	[%l7 + 0x40],	%g4
loop_1437:
	fmovdgu	%icc,	%f8,	%f7
	tsubcc	%i7,	0x0924,	%g6
	sllx	%o6,	0x18,	%i3
	edge16l	%i1,	%o0,	%g3
	wr	%g0,	0x04,	%asi
	lda	[%l7 + 0x38] %asi,	%f10
	mova	%icc,	%g1,	%i5
	tgu	%icc,	0x5
	taddcc	%o1,	%o3,	%g5
	fmovsne	%xcc,	%f31,	%f14
	movge	%xcc,	%o5,	%l0
	fbue	%fcc0,	loop_1438
	movvs	%icc,	%l3,	%l5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovspos	%xcc,	%f3,	%f26
loop_1438:
	bcs	loop_1439
	movcc	%icc,	%o4,	%o2
	wr	%g0,	0x0c,	%asi
	sta	%f18,	[%l7 + 0x44] %asi
loop_1439:
	nop
	set	0x16, %o7
	ldsha	[%l7 + %o7] 0x11,	%l2
	ldsw	[%l7 + 0x14],	%g7
	popc	0x0499,	%i4
	subcc	%i0,	%l1,	%i2
	fmul8x16	%f25,	%f30,	%f8
	movle	%icc,	%o7,	%g2
	fmuld8sux16	%f24,	%f15,	%f6
	fba,a	%fcc3,	loop_1440
	fmovsvc	%icc,	%f28,	%f27
	fmul8sux16	%f16,	%f10,	%f8
	tn	%xcc,	0x0
loop_1440:
	fmovdn	%icc,	%f17,	%f13
	fbn,a	%fcc0,	loop_1441
	fbge	%fcc2,	loop_1442
	call	loop_1443
	sllx	%i6,	%l4,	%l6
loop_1441:
	movrlz	%g4,	%g6,	%o6
loop_1442:
	xorcc	%i3,	%i1,	%o0
loop_1443:
	nop
	wr	%g0,	0x89,	%asi
	prefetcha	[%l7 + 0x38] %asi,	 0x0
	movneg	%icc,	%i7,	%g1
	movrlez	%i5,	%o3,	%g5
	fpackfix	%f30,	%f8
	edge32n	%o5,	%o1,	%l3
	array8	%l5,	%o4,	%l0
	taddcc	%o2,	%l2,	%i4
	umul	%g7,	%l1,	%i2
	fbuge	%fcc1,	loop_1444
	std	%i0,	[%l7 + 0x70]
	xorcc	%o7,	%i6,	%l4
	membar	0x41
loop_1444:
	orn	%g2,	0x0390,	%l6
	subc	%g6,	%g4,	%o6
	tl	%icc,	0x7
	nop
	setx	loop_1445,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	alignaddr	%i3,	%o0,	%i1
	and	%g3,	%g1,	%i5
	tsubcc	%o3,	%g5,	%i7
loop_1445:
	taddcctv	%o5,	%o1,	%l5
	mova	%icc,	%l3,	%l0
	fmovrsgz	%o2,	%f22,	%f19
	set	0x54, %o0
	sta	%f28,	[%l7 + %o0] 0x81
	be	%icc,	loop_1446
	tcs	%xcc,	0x3
	wr	%g0,	0x04,	%asi
	prefetcha	[%l7 + 0x78] %asi,	 0x2
loop_1446:
	fmovsge	%icc,	%f20,	%f21
	fba,a	%fcc2,	loop_1447
	fmovdneg	%icc,	%f25,	%f27
	fbe,a	%fcc2,	loop_1448
	tgu	%icc,	0x4
loop_1447:
	tleu	%xcc,	0x6
	andcc	%l2,	%i4,	%l1
loop_1448:
	movrlez	%g7,	%i0,	%o7
	tgu	%icc,	0x6
	sdiv	%i2,	0x1387,	%l4
	movpos	%icc,	%i6,	%g2
	wr	%g0,	0x18,	%asi
	sta	%f13,	[%l7 + 0x54] %asi
	fmovdcc	%icc,	%f22,	%f29
	fandnot1s	%f14,	%f22,	%f31
	orncc	%l6,	%g4,	%g6
	fbe,a	%fcc2,	loop_1449
	smulcc	%o6,	0x0D12,	%i3
	array16	%i1,	%g3,	%g1
	edge16n	%i5,	%o0,	%g5
loop_1449:
	movleu	%icc,	%o3,	%i7
	orn	%o1,	%l5,	%l3
	movle	%xcc,	%l0,	%o2
	movge	%icc,	%o5,	%o4
	wr	%g0,	0x10,	%asi
	ldsba	[%l7 + 0x26] %asi,	%i4
	mova	%icc,	%l1,	%g7
	tpos	%icc,	0x6
	bg	loop_1450
	srax	%l2,	0x14,	%i0
	std	%o6,	[%l7 + 0x08]
	edge16l	%i2,	%l4,	%i6
loop_1450:
	edge8	%g2,	%l6,	%g4
	stw	%g6,	[%l7 + 0x70]
	smulcc	%i3,	%o6,	%g3
	bn,a,pt	%icc,	loop_1451
	movrgez	%g1,	%i1,	%o0
	fmul8x16al	%f28,	%f31,	%f10
	fbg	%fcc0,	loop_1452
loop_1451:
	sir	0x0F06
	movgu	%icc,	%i5,	%o3
	orncc	%g5,	0x0E9D,	%o1
loop_1452:
	fbule,a	%fcc0,	loop_1453
	edge16	%l5,	%l3,	%i7
	tleu	%icc,	0x6
	fmovdpos	%icc,	%f18,	%f15
loop_1453:
	fcmpes	%fcc1,	%f14,	%f15
	movg	%xcc,	%o2,	%l0
	alignaddrl	%o5,	%i4,	%o4
	fcmple32	%f14,	%f14,	%g7
	bleu,a,pt	%icc,	loop_1454
	fba	%fcc0,	loop_1455
	tneg	%xcc,	0x3
	smul	%l2,	0x192C,	%l1
loop_1454:
	udivcc	%i0,	0x036B,	%i2
loop_1455:
	fmovdvs	%icc,	%f31,	%f11
	alignaddrl	%o7,	%l4,	%g2
	smul	%l6,	0x075B,	%g4
	movgu	%icc,	%g6,	%i3
	tl	%xcc,	0x1
	movrlz	%o6,	0x1A1,	%i6
	fmovsvc	%icc,	%f30,	%f24
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udivcc	%g1,	0x1A1B,	%g3
	mulx	%o0,	0x0C4D,	%i5
	movneg	%icc,	%i1,	%o3
	movne	%xcc,	%o1,	%l5
	set	0x60, %i5
	prefetcha	[%l7 + %i5] 0x0c,	 0x1
	tgu	%xcc,	0x3
	or	%l3,	%i7,	%o2
	fzero	%f0
	movvc	%icc,	%o5,	%i4
	bshuffle	%f2,	%f14,	%f10
	movvc	%xcc,	%l0,	%o4
	srax	%g7,	0x0C,	%l2
	te	%xcc,	0x1
	set	0x50, %l5
	ldxa	[%l7 + %l5] 0x14,	%l1
	movne	%xcc,	%i2,	%o7
	fbue	%fcc2,	loop_1456
	taddcctv	%l4,	0x01F6,	%i0
	sll	%l6,	0x1B,	%g4
	tne	%icc,	0x6
loop_1456:
	sub	%g2,	%g6,	%i3
	movg	%xcc,	%i6,	%o6
	fnand	%f20,	%f20,	%f18
	movrgez	%g3,	0x030,	%o0
	edge8n	%i5,	%i1,	%g1
	stb	%o1,	[%l7 + 0x33]
	tvs	%xcc,	0x7
	mova	%icc,	%o3,	%g5
	fmovsge	%icc,	%f1,	%f28
	edge16l	%l5,	%i7,	%l3
	fabss	%f5,	%f16
	sdivx	%o5,	0x1892,	%o2
	stw	%l0,	[%l7 + 0x5C]
	addccc	%i4,	0x1C9C,	%o4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16l	%l2,	%g7,	%i2
	popc	%l1,	%o7
	andcc	%l4,	0x1247,	%i0
	movg	%xcc,	%l6,	%g4
	set	0x3C, %i3
	ldstuba	[%l7 + %i3] 0x10,	%g2
	bn,a,pn	%icc,	loop_1457
	edge32l	%g6,	%i6,	%i3
	fmovsvs	%icc,	%f1,	%f13
	set	0x70, %o4
	stxa	%g3,	[%l7 + %o4] 0x04
loop_1457:
	brnz,a	%o0,	loop_1458
	fbg,a	%fcc3,	loop_1459
	xor	%i5,	%i1,	%o6
	fcmpeq16	%f18,	%f18,	%g1
loop_1458:
	taddcc	%o1,	0x052B,	%g5
loop_1459:
	fblg,a	%fcc1,	loop_1460
	edge8l	%l5,	%o3,	%l3
	mulx	%i7,	0x1969,	%o5
	fbo	%fcc0,	loop_1461
loop_1460:
	fbul,a	%fcc3,	loop_1462
	fxors	%f12,	%f22,	%f16
	fblg,a	%fcc0,	loop_1463
loop_1461:
	orcc	%l0,	%o2,	%i4
loop_1462:
	fbue,a	%fcc3,	loop_1464
	fmovsleu	%xcc,	%f22,	%f14
loop_1463:
	fbge,a	%fcc2,	loop_1465
	membar	0x2E
loop_1464:
	bvc,a	loop_1466
	andn	%o4,	%g7,	%l2
loop_1465:
	movl	%icc,	%l1,	%i2
	movrlez	%l4,	%o7,	%l6
loop_1466:
	brz	%g4,	loop_1467
	tge	%xcc,	0x5
	ba	%xcc,	loop_1468
	ldd	[%l7 + 0x18],	%g2
loop_1467:
	ble,a,pt	%xcc,	loop_1469
	movle	%icc,	%g6,	%i6
loop_1468:
	or	%i0,	%g3,	%i3
	fba,a	%fcc1,	loop_1470
loop_1469:
	edge8n	%i5,	%o0,	%i1
	set	0x74, %l6
	sta	%f27,	[%l7 + %l6] 0x15
loop_1470:
	orcc	%o6,	0x069E,	%o1
	tleu	%xcc,	0x2
	sub	%g1,	0x1EDA,	%g5
	tle	%xcc,	0x4
	array8	%l5,	%l3,	%o3
	ldsh	[%l7 + 0x74],	%i7
	set	0x78, %i4
	ldswa	[%l7 + %i4] 0x11,	%o5
	move	%xcc,	%o2,	%i4
	xnorcc	%l0,	%o4,	%l2
	subc	%l1,	0x10DA,	%g7
	orn	%l4,	0x1270,	%o7
	fmul8x16au	%f9,	%f2,	%f4
	edge32n	%l6,	%i2,	%g2
	smul	%g6,	%i6,	%g4
	tcc	%icc,	0x6
	andncc	%i0,	%i3,	%i5
	edge32l	%o0,	%i1,	%g3
	edge8l	%o1,	%g1,	%g5
	tleu	%icc,	0x5
	fxnor	%f22,	%f4,	%f0
	fcmpgt32	%f18,	%f22,	%o6
	fpsub32	%f24,	%f24,	%f2
	subcc	%l5,	0x1B37,	%l3
	fpackfix	%f28,	%f30
	movpos	%icc,	%i7,	%o3
	udivx	%o2,	0x0AB2,	%o5
	tcs	%xcc,	0x6
	fors	%f16,	%f23,	%f16
	fpadd32	%f4,	%f2,	%f20
	or	%l0,	0x053C,	%i4
	array32	%o4,	%l2,	%g7
	addcc	%l1,	%l4,	%l6
	tg	%icc,	0x3
	udivcc	%i2,	0x0701,	%g2
	or	%g6,	0x08A3,	%i6
	movrne	%g4,	0x0A0,	%o7
	tg	%icc,	0x0
	ta	%xcc,	0x5
	tne	%icc,	0x0
	alignaddr	%i0,	%i5,	%i3
	movre	%i1,	0x208,	%o0
	tsubcctv	%o1,	%g1,	%g3
	fornot2	%f12,	%f24,	%f0
	edge8ln	%o6,	%l5,	%g5
	fors	%f22,	%f4,	%f0
	sdivx	%i7,	0x0B89,	%l3
	fmovda	%xcc,	%f4,	%f8
	edge8n	%o3,	%o5,	%l0
	tleu	%icc,	0x5
	set	0x5C, %g5
	lduwa	[%l7 + %g5] 0x14,	%o2
	prefetch	[%l7 + 0x10],	 0x1
	ble,a	%icc,	loop_1471
	or	%i4,	%l2,	%o4
	fmovdcs	%icc,	%f16,	%f16
	move	%icc,	%l1,	%g7
loop_1471:
	fcmpeq32	%f10,	%f16,	%l6
	fcmpd	%fcc2,	%f8,	%f24
	sdivx	%i2,	0x1995,	%g2
	xnor	%g6,	%i6,	%g4
	xnorcc	%l4,	%o7,	%i0
	sll	%i3,	0x10,	%i5
	brz	%o0,	loop_1472
	subccc	%i1,	%g1,	%g3
	edge8n	%o6,	%o1,	%l5
	fnot2s	%f26,	%f1
loop_1472:
	faligndata	%f12,	%f24,	%f28
	brnz,a	%i7,	loop_1473
	xorcc	%l3,	0x1513,	%g5
	popc	%o5,	%l0
	tn	%icc,	0x7
loop_1473:
	move	%icc,	%o3,	%i4
	fmovsgu	%xcc,	%f19,	%f8
	movneg	%xcc,	%l2,	%o2
	add	%l7,	0x68,	%l6
	wr	%g0,	0x10,	%asi
	casxa	[%l6] 0x10,	%l1,	%g7
	sdivcc	%o4,	0x0F8F,	%i2
	array16	%l6,	%g2,	%i6
	brgez,a	%g6,	loop_1474
	and	%l4,	%o7,	%i0
	brlz,a	%i3,	loop_1475
	sub	%i5,	0x12B4,	%g4
loop_1474:
	fmul8x16	%f4,	%f8,	%f6
	tvc	%icc,	0x2
loop_1475:
	tvs	%icc,	0x4
	fcmpes	%fcc2,	%f30,	%f24
	fmul8sux16	%f30,	%f0,	%f26
	bn,a	%xcc,	loop_1476
	udivx	%o0,	0x0810,	%i1
	movre	%g3,	%o6,	%o1
	alignaddr	%l5,	%i7,	%l3
loop_1476:
	nop
	wr	%g0,	0x80,	%asi
	lduba	[%l7 + 0x26] %asi,	%g5
	movgu	%icc,	%g1,	%l0
	fxnor	%f14,	%f10,	%f26
	array32	%o3,	%o5,	%i4
	array32	%l2,	%l1,	%g7
	sllx	%o2,	%o4,	%i2
	movle	%icc,	%g2,	%l6
	movge	%icc,	%g6,	%l4
	movvc	%icc,	%o7,	%i0
	orcc	%i6,	%i5,	%i3
	fcmpes	%fcc1,	%f22,	%f26
	fmovrdlez	%o0,	%f28,	%f8
	stb	%g4,	[%l7 + 0x53]
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bvc,a	%xcc,	loop_1477
	mulscc	%i1,	0x1B18,	%g3
	fbul	%fcc3,	loop_1478
	ldsb	[%l7 + 0x0B],	%o1
loop_1477:
	fnot2	%f0,	%f16
	fmovrdgez	%o6,	%f6,	%f2
loop_1478:
	st	%f2,	[%l7 + 0x3C]
	add	%l7,	0x2C,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%i7
	casa	[%l6] 0x89,	%i7,	%l5
	wr	%g0,	0x19,	%asi
	swapa	[%l7 + 0x5C] %asi,	%l3
	tvc	%icc,	0x0
	bge,a	loop_1479
	sir	0x0260
	subccc	%g5,	0x13DF,	%l0
	orcc	%o3,	%o5,	%g1
loop_1479:
	udivx	%l2,	0x13F4,	%i4
	sllx	%l1,	0x17,	%o2
	tneg	%icc,	0x7
	bg,a	loop_1480
	tpos	%icc,	0x1
	fornot2	%f24,	%f0,	%f14
	movgu	%xcc,	%g7,	%o4
loop_1480:
	fmovsl	%icc,	%f22,	%f28
	ldd	[%l7 + 0x30],	%i2
	movle	%xcc,	%g2,	%g6
	fmovdcc	%icc,	%f17,	%f1
	fnot2s	%f19,	%f25
	fblg,a	%fcc2,	loop_1481
	fmovrdne	%l6,	%f12,	%f18
	alignaddr	%l4,	%i0,	%i6
	nop
	set	0x58, %g7
	std	%o6,	[%l7 + %g7]
loop_1481:
	bshuffle	%f0,	%f30,	%f22
	movleu	%xcc,	%i3,	%o0
	addc	%g4,	0x030E,	%i1
	fmovdneg	%icc,	%f7,	%f29
	tneg	%xcc,	0x6
	be,pt	%xcc,	loop_1482
	taddcc	%g3,	0x0FE9,	%i5
	tneg	%xcc,	0x0
	edge8n	%o1,	%o6,	%i7
loop_1482:
	fmovrsne	%l5,	%f27,	%f7
	fba	%fcc3,	loop_1483
	fnor	%f8,	%f14,	%f16
	bge	loop_1484
	fabss	%f6,	%f1
loop_1483:
	srl	%l3,	0x19,	%g5
	edge8	%o3,	%l0,	%o5
loop_1484:
	ta	%icc,	0x3
	xorcc	%l2,	%i4,	%g1
	edge32ln	%l1,	%o2,	%o4
	fmovdle	%xcc,	%f3,	%f30
	xorcc	%g7,	0x1C5B,	%i2
	movre	%g6,	0x3E2,	%g2
	fnands	%f1,	%f27,	%f3
	fors	%f27,	%f15,	%f21
	edge32	%l4,	%l6,	%i6
	fpack32	%f12,	%f20,	%f28
	sll	%i0,	%o7,	%o0
	lduh	[%l7 + 0x36],	%i3
	ld	[%l7 + 0x4C],	%f6
	andn	%i1,	0x0334,	%g4
	fmovse	%icc,	%f1,	%f9
	smul	%g3,	%o1,	%i5
	xnorcc	%o6,	%i7,	%l5
	tleu	%icc,	0x2
	stbar
	wr	%g0,	0x80,	%asi
	stda	%g4,	[%l7 + 0x28] %asi
	fornot1	%f30,	%f4,	%f10
	tg	%xcc,	0x4
	edge16n	%l3,	%o3,	%o5
	fmovrdlez	%l0,	%f0,	%f12
	sdiv	%i4,	0x0B89,	%g1
	fnor	%f24,	%f20,	%f22
	fcmpd	%fcc2,	%f8,	%f2
	xnor	%l2,	%l1,	%o4
	subc	%o2,	%g7,	%i2
	tle	%icc,	0x4
	udivcc	%g6,	0x12F8,	%g2
	ta	%xcc,	0x0
	xnorcc	%l6,	0x0F11,	%l4
	movvs	%icc,	%i6,	%o7
	subc	%o0,	%i0,	%i3
	andncc	%g4,	%i1,	%g3
	membar	0x79
	mulscc	%i5,	%o1,	%i7
	edge8n	%l5,	%g5,	%l3
	movneg	%xcc,	%o3,	%o6
	movgu	%icc,	%l0,	%i4
	tle	%xcc,	0x0
	stx	%g1,	[%l7 + 0x10]
	mulscc	%l2,	%o5,	%l1
	sdiv	%o4,	0x0DD4,	%g7
	sra	%o2,	0x14,	%i2
	movcc	%icc,	%g6,	%l6
	orcc	%g2,	%l4,	%i6
	mulx	%o7,	%o0,	%i3
	be,a,pt	%icc,	loop_1485
	smulcc	%g4,	0x0DBB,	%i1
	udivx	%g3,	0x0C97,	%i0
	xnor	%o1,	0x08D0,	%i7
loop_1485:
	stbar
	brgez,a	%i5,	loop_1486
	fzero	%f24
	movrne	%l5,	%l3,	%o3
	edge8l	%g5,	%o6,	%l0
loop_1486:
	movrgez	%i4,	%g1,	%o5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tle	%icc,	0x5
	addcc	%l2,	%o4,	%l1
	movge	%xcc,	%g7,	%o2
	and	%g6,	%i2,	%l6
	movvs	%xcc,	%l4,	%g2
	edge8n	%i6,	%o7,	%o0
	array16	%i3,	%g4,	%g3
	fxors	%f5,	%f11,	%f14
	brnz,a	%i0,	loop_1487
	edge32ln	%o1,	%i1,	%i5
	fornot1s	%f5,	%f10,	%f24
	fmovdne	%xcc,	%f6,	%f8
loop_1487:
	sdivx	%i7,	0x0E1F,	%l3
	movre	%o3,	0x200,	%g5
	brz	%o6,	loop_1488
	fbul	%fcc2,	loop_1489
	fcmpne16	%f0,	%f16,	%l5
	wr	%g0,	0x2a,	%asi
	stda	%l0,	[%l7 + 0x48] %asi
	membar	#Sync
loop_1488:
	fpsub16s	%f31,	%f6,	%f21
loop_1489:
	tge	%xcc,	0x0
	set	0x50, %o5
	stda	%g0,	[%l7 + %o5] 0x10
	fnands	%f29,	%f13,	%f5
	wr	%g0,	0x18,	%asi
	ldswa	[%l7 + 0x44] %asi,	%i4
	fmovsne	%xcc,	%f1,	%f13
	movrlez	%o5,	%l2,	%o4
	sdivx	%g7,	0x0C1B,	%o2
	fornot2	%f10,	%f18,	%f10
	addc	%l1,	0x1B48,	%g6
	brlez	%l6,	loop_1490
	xor	%l4,	%g2,	%i6
	movvc	%xcc,	%o7,	%i2
	set	0x5E, %g6
	lduha	[%l7 + %g6] 0x10,	%o0
loop_1490:
	tn	%icc,	0x4
	edge8	%i3,	%g4,	%g3
	xnor	%i0,	%o1,	%i1
	faligndata	%f16,	%f0,	%f8
	tvc	%xcc,	0x2
	flush	%l7 + 0x30
	subcc	%i5,	0x108B,	%l3
	movneg	%xcc,	%o3,	%g5
	fzero	%f24
	brgez	%o6,	loop_1491
	movrgz	%l5,	0x1FC,	%i7
	ldsb	[%l7 + 0x73],	%l0
	fmovsne	%icc,	%f24,	%f17
loop_1491:
	fmovsvc	%icc,	%f11,	%f11
	xorcc	%g1,	%i4,	%o5
	movneg	%xcc,	%o4,	%l2
	tcs	%xcc,	0x3
	set	0x54, %g2
	ldswa	[%l7 + %g2] 0x04,	%g7
	set	0x1C, %l1
	lda	[%l7 + %l1] 0x19,	%f20
	fcmpne16	%f2,	%f14,	%o2
	movgu	%icc,	%g6,	%l1
	fbn,a	%fcc1,	loop_1492
	fba	%fcc3,	loop_1493
	mulx	%l4,	%l6,	%i6
	xnorcc	%o7,	0x1932,	%i2
loop_1492:
	fmovdleu	%xcc,	%f8,	%f29
loop_1493:
	mova	%icc,	%g2,	%i3
	set	0x64, %i1
	lda	[%l7 + %i1] 0x14,	%f12
	add	%l7,	0x28,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%o0,	%g4
	move	%icc,	%i0,	%g3
	andncc	%o1,	%i1,	%i5
	or	%o3,	%l3,	%g5
	fbule	%fcc1,	loop_1494
	fnor	%f14,	%f4,	%f30
	xnor	%o6,	0x1D27,	%i7
	tpos	%icc,	0x0
loop_1494:
	ta	%icc,	0x5
	ba,pn	%icc,	loop_1495
	edge8ln	%l0,	%g1,	%l5
	wr	%g0,	0x2b,	%asi
	stwa	%i4,	[%l7 + 0x28] %asi
	membar	#Sync
loop_1495:
	bgu,pt	%icc,	loop_1496
	tcc	%icc,	0x3
	fmul8x16al	%f21,	%f17,	%f8
	set	0x36, %o1
	stha	%o4,	[%l7 + %o1] 0x23
	membar	#Sync
loop_1496:
	andncc	%l2,	%g7,	%o5
	alignaddr	%g6,	%l1,	%o2
	tne	%icc,	0x7
	tg	%xcc,	0x0
	taddcc	%l4,	%i6,	%l6
	mulx	%i2,	%g2,	%i3
	movrlz	%o0,	0x17D,	%o7
	edge16l	%i0,	%g3,	%g4
	sir	0x0530
	movrlez	%i1,	0x11B,	%i5
	udivcc	%o1,	0x0795,	%l3
	fble,a	%fcc1,	loop_1497
	fbule	%fcc3,	loop_1498
	edge8n	%g5,	%o3,	%o6
	movge	%icc,	%i7,	%l0
loop_1497:
	fbge	%fcc3,	loop_1499
loop_1498:
	fmovsgu	%xcc,	%f30,	%f30
	fzeros	%f26
	fmovrdlez	%l5,	%f30,	%f10
loop_1499:
	edge32n	%g1,	%i4,	%o4
	sub	%g7,	0x07D1,	%l2
	umul	%g6,	0x1719,	%o5
	ldd	[%l7 + 0x20],	%f16
	bpos,a	loop_1500
	siam	0x1
	fmul8x16au	%f17,	%f19,	%f14
	movl	%icc,	%o2,	%l1
loop_1500:
	sth	%l4,	[%l7 + 0x7E]
	movle	%xcc,	%l6,	%i6
	fmovrdgez	%g2,	%f8,	%f18
	srlx	%i3,	%i2,	%o0
	mulscc	%i0,	0x0450,	%g3
	smulcc	%o7,	%g4,	%i5
	tl	%icc,	0x3
	ldx	[%l7 + 0x20],	%i1
	tgu	%icc,	0x4
	srlx	%o1,	0x07,	%l3
	tvc	%xcc,	0x5
	xnorcc	%o3,	0x14DB,	%o6
	sub	%g5,	%l0,	%i7
	sdivx	%l5,	0x1FC2,	%i4
	srax	%o4,	0x0D,	%g7
	fpsub16s	%f3,	%f9,	%f24
	fmovda	%icc,	%f10,	%f15
	umul	%g1,	0x02F4,	%l2
	fmovrse	%g6,	%f7,	%f14
	fmovde	%icc,	%f28,	%f20
	mulx	%o5,	%l1,	%l4
	edge8ln	%o2,	%l6,	%i6
	tgu	%xcc,	0x7
	fblg,a	%fcc0,	loop_1501
	taddcc	%i3,	0x15FB,	%i2
	add	%o0,	0x159A,	%g2
	fabss	%f26,	%f4
loop_1501:
	xnorcc	%i0,	%g3,	%o7
	movl	%xcc,	%g4,	%i1
	edge16n	%o1,	%i5,	%l3
	tne	%xcc,	0x6
	fbg	%fcc3,	loop_1502
	xor	%o3,	0x0132,	%o6
	fmovsgu	%xcc,	%f3,	%f29
	set	0x16, %i2
	ldsha	[%l7 + %i2] 0x10,	%g5
loop_1502:
	brgz	%i7,	loop_1503
	bleu,a	%icc,	loop_1504
	fmovsa	%xcc,	%f31,	%f21
	edge8ln	%l0,	%i4,	%l5
loop_1503:
	fmovrdne	%g7,	%f26,	%f10
loop_1504:
	movrne	%g1,	0x2D7,	%l2
	movre	%g6,	0x0CD,	%o5
	sra	%o4,	0x0E,	%l1
	tl	%xcc,	0x7
	mulx	%o2,	0x0516,	%l4
	std	%f2,	[%l7 + 0x48]
	addcc	%l6,	%i3,	%i2
	movpos	%icc,	%o0,	%i6
	mulscc	%i0,	0x0CE1,	%g3
	fbo	%fcc1,	loop_1505
	srax	%g2,	%o7,	%g4
	addcc	%o1,	%i1,	%i5
	mulx	%o3,	0x0F40,	%o6
loop_1505:
	ldsh	[%l7 + 0x28],	%l3
	fmul8x16	%f28,	%f2,	%f18
	set	0x40, %i0
	stda	%f16,	[%l7 + %i0] 0x80
	for	%f12,	%f4,	%f24
	bshuffle	%f16,	%f12,	%f2
	stw	%i7,	[%l7 + 0x5C]
	sethi	0x1445,	%l0
	move	%icc,	%i4,	%l5
	movrlz	%g5,	0x3D2,	%g7
	nop
	setx	loop_1506,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	edge32n	%l2,	%g1,	%g6
	xnorcc	%o4,	%l1,	%o5
	fands	%f16,	%f22,	%f0
loop_1506:
	addc	%o2,	0x0AC4,	%l4
	movre	%i3,	0x19D,	%i2
	movcc	%icc,	%o0,	%i6
	wr	%g0,	0x04,	%asi
	ldsba	[%l7 + 0x0E] %asi,	%i0
	orcc	%l6,	%g3,	%g2
	fmovsvc	%xcc,	%f6,	%f24
	smulcc	%o7,	%o1,	%i1
	andncc	%i5,	%g4,	%o6
	udivx	%o3,	0x1EEB,	%i7
	edge16l	%l3,	%i4,	%l5
	subccc	%l0,	%g5,	%g7
	fsrc2	%f20,	%f10
	stx	%g1,	[%l7 + 0x20]
	edge16n	%g6,	%l2,	%l1
	fxor	%f10,	%f4,	%f22
	fabss	%f8,	%f9
	tne	%icc,	0x2
	addccc	%o5,	0x0423,	%o2
	movcs	%xcc,	%l4,	%o4
	addcc	%i2,	0x10C1,	%i3
	fmovdneg	%icc,	%f27,	%f21
	stb	%i6,	[%l7 + 0x44]
	xnorcc	%o0,	0x0663,	%i0
	set	0x7C, %o3
	lduha	[%l7 + %o3] 0x14,	%l6
	edge16	%g3,	%g2,	%o7
	fbue,a	%fcc0,	loop_1507
	movrgz	%o1,	%i5,	%i1
	tne	%icc,	0x1
	mova	%icc,	%g4,	%o6
loop_1507:
	fble	%fcc2,	loop_1508
	fcmpes	%fcc1,	%f10,	%f2
	fpadd16s	%f17,	%f12,	%f26
	edge8ln	%o3,	%l3,	%i4
loop_1508:
	tvs	%icc,	0x6
	edge8n	%l5,	%i7,	%l0
	set	0x40, %l3
	stda	%f0,	[%l7 + %l3] 0xf9
	membar	#Sync
	sth	%g7,	[%l7 + 0x46]
	set	0x54, %l2
	ldsba	[%l7 + %l2] 0x10,	%g5
	edge16l	%g1,	%g6,	%l2
	tsubcc	%l1,	%o5,	%o2
	fornot1s	%f21,	%f19,	%f19
	set	0x18, %g4
	stxa	%o4,	[%l7 + %g4] 0x2b
	membar	#Sync
	edge16n	%l4,	%i3,	%i6
	tl	%icc,	0x4
	mulscc	%o0,	0x01A6,	%i0
	edge8	%i2,	%g3,	%l6
	membar	0x4D
	alignaddr	%o7,	%g2,	%o1
	movrlez	%i1,	0x398,	%i5
	bvs,a	%icc,	loop_1509
	fbule	%fcc1,	loop_1510
	mova	%icc,	%g4,	%o3
	fmovdcs	%icc,	%f6,	%f7
loop_1509:
	and	%l3,	0x1F01,	%o6
loop_1510:
	edge8	%i4,	%i7,	%l5
	tvc	%xcc,	0x3
	array16	%l0,	%g5,	%g7
	udivcc	%g1,	0x0D8F,	%l2
	fandnot1	%f6,	%f28,	%f20
	subc	%l1,	0x17D5,	%g6
	fnot2	%f12,	%f6
	mulscc	%o5,	%o4,	%l4
	fbge,a	%fcc2,	loop_1511
	brgz,a	%i3,	loop_1512
	fandnot2s	%f24,	%f5,	%f21
	fpadd16	%f26,	%f16,	%f16
loop_1511:
	fsrc2	%f8,	%f24
loop_1512:
	sdiv	%i6,	0x0A24,	%o2
	ldsh	[%l7 + 0x12],	%i0
	movgu	%icc,	%o0,	%i2
	nop
	setx loop_1513, %l0, %l1
	jmpl %l1, %g3
	tg	%xcc,	0x5
	edge32ln	%l6,	%g2,	%o1
	ldd	[%l7 + 0x78],	%o6
loop_1513:
	tneg	%xcc,	0x0
	bgu,pt	%xcc,	loop_1514
	fpadd32s	%f25,	%f23,	%f26
	sub	%i5,	%i1,	%g4
	movpos	%icc,	%l3,	%o3
loop_1514:
	fmovdl	%xcc,	%f0,	%f23
	movneg	%xcc,	%o6,	%i7
	orn	%l5,	0x1822,	%l0
	sll	%i4,	%g5,	%g7
	xor	%g1,	%l2,	%g6
	fpmerge	%f6,	%f7,	%f2
	array32	%o5,	%l1,	%l4
	movneg	%icc,	%i3,	%o4
	tl	%icc,	0x3
	set	0x1C, %o2
	sta	%f14,	[%l7 + %o2] 0x10
	set	0x0C, %g3
	stwa	%o2,	[%l7 + %g3] 0x89
	and	%i0,	0x1D71,	%o0
	fmovsneg	%icc,	%f16,	%f1
	fmovsn	%xcc,	%f20,	%f12
	subcc	%i6,	0x198B,	%i2
	fandnot1s	%f2,	%f9,	%f11
	bne,pn	%icc,	loop_1515
	sra	%l6,	%g2,	%o1
	tneg	%icc,	0x1
	tn	%icc,	0x1
loop_1515:
	srl	%g3,	0x03,	%i5
	movn	%xcc,	%o7,	%i1
	movvc	%xcc,	%l3,	%g4
	tsubcc	%o3,	0x08AA,	%o6
	wr	%g0,	0x89,	%asi
	lda	[%l7 + 0x7C] %asi,	%f14
	edge8n	%l5,	%l0,	%i7
	fmovdge	%icc,	%f31,	%f30
	xnor	%i4,	%g7,	%g1
	smulcc	%l2,	%g6,	%g5
	alignaddr	%l1,	%o5,	%i3
	ldsw	[%l7 + 0x30],	%l4
	brgz,a	%o4,	loop_1516
	edge16	%i0,	%o2,	%o0
	fmovs	%f24,	%f31
	sethi	0x154C,	%i6
loop_1516:
	movneg	%icc,	%i2,	%g2
	or	%o1,	0x111C,	%l6
	edge16n	%g3,	%i5,	%i1
	fpadd32s	%f16,	%f27,	%f23
	movpos	%icc,	%o7,	%l3
	mova	%xcc,	%g4,	%o6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movleu	%xcc,	%o3,	%l5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32l	%i7,	%i4,	%g7
	edge8n	%g1,	%l0,	%l2
	fmovsvs	%xcc,	%f19,	%f29
	addcc	%g6,	%l1,	%o5
	fpadd32s	%f10,	%f0,	%f30
	movleu	%icc,	%g5,	%i3
	set	0x24, %l0
	ldsha	[%l7 + %l0] 0x10,	%o4
	bvc,a,pn	%xcc,	loop_1517
	sllx	%i0,	0x09,	%l4
	movge	%icc,	%o2,	%i6
	fzero	%f6
loop_1517:
	ldstub	[%l7 + 0x6D],	%i2
	mulscc	%g2,	%o1,	%o0
	membar	0x58
	movvc	%xcc,	%l6,	%g3
	brlz	%i5,	loop_1518
	bne	loop_1519
	alignaddr	%o7,	%l3,	%g4
	tcc	%icc,	0x3
loop_1518:
	sethi	0x047C,	%o6
loop_1519:
	fbo,a	%fcc0,	loop_1520
	movl	%icc,	%i1,	%o3
	st	%f5,	[%l7 + 0x74]
	fpadd16	%f20,	%f24,	%f6
loop_1520:
	fsrc1	%f20,	%f20
	ldstub	[%l7 + 0x53],	%i7
	sdivx	%l5,	0x13BE,	%g7
	movrgez	%i4,	%l0,	%l2
	udivx	%g6,	0x04E7,	%g1
	fcmple16	%f12,	%f18,	%o5
	srax	%g5,	%i3,	%o4
	fcmple16	%f12,	%f6,	%l1
	fmovrdlez	%i0,	%f2,	%f24
	ba	loop_1521
	fmovrdne	%o2,	%f12,	%f24
	bcc,a,pn	%xcc,	loop_1522
	mova	%xcc,	%i6,	%i2
loop_1521:
	orncc	%g2,	%l4,	%o0
	sdiv	%o1,	0x0B64,	%l6
loop_1522:
	sra	%i5,	0x1F,	%o7
	ta	%icc,	0x4
	set	0x69, %i6
	ldstuba	[%l7 + %i6] 0x81,	%l3
	stw	%g3,	[%l7 + 0x40]
	subcc	%g4,	0x1064,	%o6
	std	%i0,	[%l7 + 0x20]
	fmovdvc	%icc,	%f12,	%f19
	mulscc	%i7,	0x0C22,	%l5
	udivcc	%g7,	0x11EF,	%o3
	umul	%i4,	%l0,	%g6
	fmovdgu	%xcc,	%f21,	%f3
	tsubcctv	%l2,	%o5,	%g5
	xorcc	%g1,	0x0BA5,	%o4
	call	loop_1523
	mulscc	%l1,	0x1CCA,	%i0
	fzeros	%f9
	tsubcctv	%o2,	%i6,	%i3
loop_1523:
	fxors	%f25,	%f27,	%f12
	tvs	%xcc,	0x3
	movneg	%xcc,	%i2,	%l4
	fcmpne16	%f28,	%f22,	%o0
	brlez	%o1,	loop_1524
	tneg	%xcc,	0x1
	tge	%icc,	0x0
	ldx	[%l7 + 0x28],	%l6
loop_1524:
	fbn,a	%fcc0,	loop_1525
	fbu,a	%fcc1,	loop_1526
	fbo,a	%fcc3,	loop_1527
	fbo,a	%fcc1,	loop_1528
loop_1525:
	movl	%xcc,	%g2,	%i5
loop_1526:
	fmul8ulx16	%f16,	%f2,	%f4
loop_1527:
	nop
	set	0x3C, %o6
	ldswa	[%l7 + %o6] 0x0c,	%o7
loop_1528:
	sdiv	%l3,	0x1D90,	%g4
	lduw	[%l7 + 0x3C],	%o6
	xnorcc	%i1,	%i7,	%l5
	edge16ln	%g7,	%o3,	%g3
	mova	%icc,	%i4,	%l0
	fbu,a	%fcc3,	loop_1529
	orncc	%g6,	0x1D50,	%o5
	movge	%icc,	%g5,	%g1
	bpos,a	%xcc,	loop_1530
loop_1529:
	xnorcc	%o4,	0x1781,	%l2
	edge8	%i0,	%o2,	%i6
	fbul	%fcc0,	loop_1531
loop_1530:
	fbul	%fcc1,	loop_1532
	fmovsn	%icc,	%f24,	%f26
	sdiv	%i3,	0x1D81,	%l1
loop_1531:
	tvc	%xcc,	0x4
loop_1532:
	tpos	%xcc,	0x2
	ldub	[%l7 + 0x50],	%l4
	smulcc	%o0,	0x184A,	%o1
	fmovsneg	%icc,	%f17,	%f1
	array32	%l6,	%i2,	%g2
	edge8l	%i5,	%l3,	%o7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tge	%xcc,	0x3
	xnor	%o6,	0x00B4,	%i1
	edge32	%i7,	%l5,	%g7
	wr	%g0,	0x04,	%asi
	swapa	[%l7 + 0x1C] %asi,	%o3
	call	loop_1533
	fmovscs	%xcc,	%f1,	%f7
	edge16l	%g4,	%i4,	%g3
	fmovrdgez	%l0,	%f14,	%f4
loop_1533:
	fcmple16	%f10,	%f4,	%o5
	edge8ln	%g5,	%g6,	%g1
	tn	%icc,	0x4
	add	%o4,	%i0,	%o2
	movpos	%xcc,	%l2,	%i6
	set	0x48, %g1
	prefetcha	[%l7 + %g1] 0x11,	 0x0
	andcc	%l4,	%l1,	%o0
	movl	%xcc,	%o1,	%i2
	tleu	%xcc,	0x2
	edge16	%l6,	%i5,	%g2
	addccc	%l3,	0x0F1F,	%o7
	umul	%i1,	0x1D6B,	%i7
	edge32n	%o6,	%l5,	%g7
	fmovscc	%icc,	%f21,	%f7
	fmovd	%f22,	%f0
	edge16l	%o3,	%g4,	%g3
	alignaddrl	%i4,	%o5,	%l0
	membar	0x19
	add	%g5,	0x0C3D,	%g1
	ldsb	[%l7 + 0x55],	%g6
	set	0x10, %l4
	ldda	[%l7 + %l4] 0x81,	%i0
	wr	%g0,	0x89,	%asi
	stxa	%o4,	[%l7 + 0x68] %asi
	swap	[%l7 + 0x08],	%l2
	orncc	%i6,	%o2,	%i3
	fmovrdlz	%l4,	%f10,	%f6
	ta	%xcc,	0x3
	flush	%l7 + 0x44
	mulx	%o0,	0x106D,	%l1
	edge32ln	%i2,	%o1,	%i5
	srax	%g2,	0x0B,	%l6
	movrgz	%o7,	0x33C,	%i1
	smulcc	%i7,	0x0C8F,	%l3
	umul	%o6,	0x0707,	%g7
	xor	%o3,	0x06F2,	%l5
	fmovs	%f16,	%f8
	fmovsneg	%xcc,	%f27,	%f10
	fbl	%fcc3,	loop_1534
	array8	%g4,	%g3,	%i4
	tneg	%icc,	0x7
	udiv	%o5,	0x03B8,	%g5
loop_1534:
	nop
	add	%l7,	0x30,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%g1
	casxa	[%l6] 0x88,	%g1,	%g6
	wr	%g0,	0x11,	%asi
	swapa	[%l7 + 0x74] %asi,	%l0
	wr	%g0,	0x89,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	nop
	set	0x70, %o7
	std	%o4,	[%l7 + %o7]
	set	0x54, %o0
	lduha	[%l7 + %o0] 0x89,	%l2
	sethi	0x0857,	%i6
	fbul,a	%fcc1,	loop_1535
	fbe,a	%fcc2,	loop_1536
	tvc	%xcc,	0x6
	nop
	setx	loop_1537,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_1535:
	sub	%i0,	0x1B62,	%i3
loop_1536:
	movleu	%xcc,	%o2,	%o0
	fble	%fcc0,	loop_1538
loop_1537:
	fbne,a	%fcc1,	loop_1539
	bshuffle	%f28,	%f10,	%f22
	tleu	%xcc,	0x1
loop_1538:
	fnor	%f6,	%f8,	%f8
loop_1539:
	andcc	%l1,	%i2,	%o1
	array32	%i5,	%g2,	%l4
	nop
	setx	loop_1540,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	edge16	%o7,	%l6,	%i7
	swap	[%l7 + 0x54],	%l3
	array8	%o6,	%i1,	%g7
loop_1540:
	fcmpne32	%f10,	%f24,	%o3
	wr	%g0,	0x5f,	%asi
	stxa	%l5,	[%g0 + 0x0] %asi
	movneg	%icc,	%g4,	%g3
	tge	%xcc,	0x1
	wr	%g0,	0x80,	%asi
	ldswa	[%l7 + 0x58] %asi,	%i4
	fbue	%fcc3,	loop_1541
	or	%g5,	0x0CA9,	%o5
	fexpand	%f15,	%f10
	mulx	%g6,	0x19AB,	%g1
loop_1541:
	nop
	setx loop_1542, %l0, %l1
	jmpl %l1, %l0
	brgez,a	%o4,	loop_1543
	movl	%xcc,	%l2,	%i6
	fbge,a	%fcc3,	loop_1544
loop_1542:
	subc	%i3,	0x1506,	%i0
loop_1543:
	fbue,a	%fcc0,	loop_1545
	xorcc	%o2,	%o0,	%l1
loop_1544:
	fblg	%fcc1,	loop_1546
	edge32ln	%o1,	%i5,	%i2
loop_1545:
	brgz	%g2,	loop_1547
	fornot2	%f10,	%f24,	%f8
loop_1546:
	fmovrsgz	%l4,	%f10,	%f2
	fba,a	%fcc1,	loop_1548
loop_1547:
	array32	%l6,	%o7,	%i7
	sethi	0x1DF4,	%l3
	fbu	%fcc2,	loop_1549
loop_1548:
	fbg,a	%fcc3,	loop_1550
	udiv	%o6,	0x0F3A,	%g7
	fpackfix	%f18,	%f26
loop_1549:
	tpos	%xcc,	0x5
loop_1550:
	mova	%xcc,	%o3,	%i1
	edge8	%g4,	%g3,	%i4
	fmul8x16	%f23,	%f26,	%f30
	fcmpeq16	%f6,	%f6,	%g5
	sub	%o5,	%g6,	%g1
	movrgez	%l0,	0x315,	%l5
	st	%f18,	[%l7 + 0x54]
	andncc	%o4,	%l2,	%i6
	andn	%i0,	0x0946,	%i3
	fmovdneg	%icc,	%f25,	%f30
	pdist	%f16,	%f10,	%f30
	array8	%o0,	%o2,	%o1
	lduh	[%l7 + 0x6A],	%l1
	te	%xcc,	0x7
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
	edge8ln	%i2,	%i5,	%g2
	tleu	%xcc,	0x4
	smulcc	%l6,	0x0B8C,	%o7
loop_1551:
	nop
	set	0x14, %i5
	lda	[%l7 + %i5] 0x89,	%f24
	sub	%l4,	%i7,	%l3
	fpsub16s	%f26,	%f15,	%f6
	tsubcctv	%g7,	0x1F3F,	%o3
	fmovrsgz	%i1,	%f5,	%f28
	movrgz	%g4,	%g3,	%o6
	wr	%g0,	0x04,	%asi
	stxa	%g5,	[%l7 + 0x60] %asi
	mulscc	%i4,	%o5,	%g6
	fpmerge	%f4,	%f1,	%f4
	movcc	%icc,	%l0,	%l5
	subcc	%g1,	0x19C5,	%o4
	fbe,a	%fcc3,	loop_1552
	tpos	%xcc,	0x1
	movrlz	%l2,	%i6,	%i0
	andn	%o0,	0x1C16,	%i3
loop_1552:
	tvs	%icc,	0x6
	fbne	%fcc1,	loop_1553
	brgez,a	%o1,	loop_1554
	fnegd	%f22,	%f4
	edge32ln	%o2,	%l1,	%i2
loop_1553:
	move	%xcc,	%g2,	%l6
loop_1554:
	nop
	wr	%g0,	0x10,	%asi
	prefetcha	[%l7 + 0x08] %asi,	 0x0
	and	%i5,	0x04D7,	%i7
	stw	%l3,	[%l7 + 0x7C]
	taddcc	%l4,	%g7,	%i1
	edge8	%o3,	%g4,	%g3
	fmovsg	%icc,	%f30,	%f21
	movne	%icc,	%g5,	%o6
	srlx	%o5,	0x01,	%i4
	nop
	set	0x6E, %l5
	ldsh	[%l7 + %l5],	%g6
	tcc	%icc,	0x6
	andcc	%l5,	0x01E5,	%l0
	edge8l	%o4,	%g1,	%l2
	movl	%icc,	%i6,	%o0
	set	0x66, %i7
	stha	%i3,	[%l7 + %i7] 0x23
	membar	#Sync
	srl	%o1,	%i0,	%l1
	fsrc2	%f14,	%f4
	movrlz	%o2,	0x37A,	%i2
	srl	%l6,	0x06,	%g2
	orn	%i5,	%o7,	%i7
	movn	%xcc,	%l3,	%l4
	stb	%g7,	[%l7 + 0x51]
	fba,a	%fcc3,	loop_1555
	xor	%o3,	%g4,	%i1
	edge16n	%g3,	%g5,	%o5
	set	0x48, %o4
	stda	%i4,	[%l7 + %o4] 0xea
	membar	#Sync
loop_1555:
	fblg	%fcc0,	loop_1556
	umul	%o6,	0x1AE5,	%g6
	fnor	%f2,	%f28,	%f24
	brlz,a	%l0,	loop_1557
loop_1556:
	fmul8x16au	%f17,	%f29,	%f16
	smul	%l5,	%g1,	%l2
	fbge	%fcc3,	loop_1558
loop_1557:
	tl	%icc,	0x2
	tn	%xcc,	0x7
	bvc,pt	%xcc,	loop_1559
loop_1558:
	fpadd32s	%f1,	%f10,	%f23
	lduh	[%l7 + 0x22],	%o4
	srax	%o0,	%i3,	%o1
loop_1559:
	xorcc	%i6,	0x1CA3,	%i0
	sub	%l1,	%i2,	%o2
	orn	%g2,	0x1939,	%l6
	bvc,a	%icc,	loop_1560
	fmovscs	%xcc,	%f1,	%f19
	fmovde	%icc,	%f26,	%f14
	xnor	%o7,	0x1869,	%i7
loop_1560:
	xnor	%i5,	%l4,	%g7
	tsubcctv	%o3,	%g4,	%i1
	edge8	%l3,	%g5,	%g3
	fbge,a	%fcc1,	loop_1561
	fmuld8ulx16	%f26,	%f14,	%f4
	fornot1s	%f11,	%f28,	%f14
	wr	%g0,	0x16,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
loop_1561:
	udivx	%o5,	0x123C,	%i4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmpes	%fcc0,	%f7,	%f25
	bneg,pt	%xcc,	loop_1562
	std	%f4,	[%l7 + 0x10]
	movleu	%icc,	%g6,	%l0
	tl	%icc,	0x6
loop_1562:
	udivx	%l5,	0x0C9F,	%o6
	ldx	[%l7 + 0x68],	%g1
	flush	%l7 + 0x0C
	xnor	%o4,	%l2,	%i3
	sir	0x0A21
	sra	%o0,	0x12,	%o1
	orn	%i6,	0x09D2,	%l1
	movl	%icc,	%i0,	%i2
	fmovdcc	%xcc,	%f4,	%f9
	movrlez	%g2,	%l6,	%o2
	movrgz	%i7,	0x1B9,	%i5
	fmovsa	%xcc,	%f26,	%f3
	fmovrdgez	%o7,	%f6,	%f16
	tleu	%xcc,	0x3
	movrne	%l4,	%g7,	%o3
	tsubcc	%i1,	0x0996,	%g4
	tcs	%xcc,	0x0
	wr	%g0,	0x80,	%asi
	lduha	[%l7 + 0x78] %asi,	%l3
	addc	%g3,	%g5,	%o5
	edge8	%i4,	%g6,	%l0
	fnors	%f2,	%f13,	%f8
	movneg	%icc,	%l5,	%o6
	ta	%xcc,	0x3
	ldd	[%l7 + 0x08],	%o4
	brnz	%g1,	loop_1563
	edge8n	%i3,	%o0,	%o1
	movpos	%xcc,	%l2,	%l1
	set	0x14, %l6
	sta	%f26,	[%l7 + %l6] 0x88
loop_1563:
	fba,a	%fcc0,	loop_1564
	movcc	%xcc,	%i6,	%i2
	fbe	%fcc0,	loop_1565
	fxor	%f8,	%f16,	%f4
loop_1564:
	mova	%xcc,	%i0,	%g2
	movvc	%xcc,	%l6,	%o2
loop_1565:
	movle	%icc,	%i7,	%o7
	addc	%i5,	%l4,	%g7
	movne	%xcc,	%i1,	%g4
	fmovrdlez	%o3,	%f10,	%f2
	fmovsgu	%xcc,	%f22,	%f5
	te	%icc,	0x3
	bcs,a	loop_1566
	xnor	%l3,	%g5,	%o5
	set	0x1C, %i4
	stha	%g3,	[%l7 + %i4] 0x10
loop_1566:
	nop
	wr	%g0,	0x88,	%asi
	lduwa	[%l7 + 0x5C] %asi,	%i4
	sdiv	%g6,	0x0E5F,	%l5
	stb	%l0,	[%l7 + 0x33]
	fmovdcc	%xcc,	%f25,	%f1
	edge32ln	%o4,	%o6,	%i3
	brz	%g1,	loop_1567
	movcc	%xcc,	%o0,	%l2
	fmovdvc	%icc,	%f7,	%f5
	umul	%l1,	0x04DB,	%o1
loop_1567:
	edge8l	%i6,	%i2,	%i0
	fmovsvs	%xcc,	%f9,	%f31
	tsubcc	%l6,	%g2,	%o2
	ble,a,pt	%icc,	loop_1568
	fornot2	%f10,	%f30,	%f2
	tge	%icc,	0x0
	flush	%l7 + 0x54
loop_1568:
	fnands	%f13,	%f12,	%f7
	te	%xcc,	0x5
	movrlz	%o7,	%i7,	%i5
	std	%g6,	[%l7 + 0x48]
	ble,a	loop_1569
	edge16ln	%i1,	%g4,	%o3
	flush	%l7 + 0x0C
	bgu,a	loop_1570
loop_1569:
	sra	%l4,	0x01,	%l3
	ldsh	[%l7 + 0x5C],	%g5
	sir	0x1DEA
loop_1570:
	ldx	[%l7 + 0x78],	%g3
	movcc	%icc,	%i4,	%g6
	te	%xcc,	0x5
	mulscc	%o5,	%l5,	%o4
	edge32l	%o6,	%l0,	%g1
	fabsd	%f20,	%f0
	srax	%i3,	%o0,	%l1
	fcmpeq16	%f26,	%f28,	%l2
	tge	%xcc,	0x3
	udivcc	%o1,	0x18EE,	%i6
	stb	%i0,	[%l7 + 0x4E]
	ld	[%l7 + 0x4C],	%f1
	tneg	%icc,	0x0
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x58] %asi,	%l6
	set	0x54, %i3
	stha	%g2,	[%l7 + %i3] 0x18
	fmovse	%icc,	%f25,	%f3
	fmovsle	%xcc,	%f12,	%f26
	wr	%g0,	0x18,	%asi
	stda	%o2,	[%l7 + 0x78] %asi
	bge	loop_1571
	fmovrse	%i2,	%f22,	%f7
	edge32l	%i7,	%i5,	%o7
	fbue,a	%fcc0,	loop_1572
loop_1571:
	fmovdcc	%xcc,	%f4,	%f18
	alignaddr	%i1,	%g7,	%g4
	fmovsvs	%icc,	%f31,	%f9
loop_1572:
	fbe,a	%fcc1,	loop_1573
	orncc	%o3,	0x1D40,	%l3
	taddcctv	%g5,	0x029B,	%l4
	fsrc2s	%f20,	%f29
loop_1573:
	tcc	%icc,	0x6
	andn	%i4,	%g6,	%g3
	xnorcc	%o5,	%o4,	%o6
	array8	%l0,	%l5,	%i3
	fmovdgu	%xcc,	%f16,	%f24
	array8	%o0,	%g1,	%l2
	fcmple32	%f6,	%f6,	%o1
	movcc	%xcc,	%l1,	%i0
	ta	%icc,	0x6
	movrne	%i6,	%l6,	%g2
	subccc	%i2,	0x044E,	%i7
	fmovsg	%xcc,	%f28,	%f5
	fbn	%fcc1,	loop_1574
	fmovrdne	%i5,	%f8,	%f26
	add	%l7,	0x54,	%l6
	wr	%g0,	0x0c,	%asi
	lda	[%l6] %asi,	%o2
	casa	[%l6] %asi,	%o2,	%o7
loop_1574:
	stx	%g7,	[%l7 + 0x48]
	fmovdge	%icc,	%f29,	%f22
	edge16l	%g4,	%i1,	%o3
	bcc	loop_1575
	lduw	[%l7 + 0x64],	%g5
	faligndata	%f0,	%f12,	%f0
	bpos,a,pn	%icc,	loop_1576
loop_1575:
	brz,a	%l3,	loop_1577
	srax	%i4,	%l4,	%g3
	fones	%f13
loop_1576:
	ldsh	[%l7 + 0x26],	%g6
loop_1577:
	movl	%xcc,	%o4,	%o5
	ldx	[%l7 + 0x38],	%l0
	andcc	%o6,	0x06A8,	%l5
	fmuld8ulx16	%f25,	%f15,	%f30
	movrne	%o0,	%g1,	%i3
	edge8ln	%o1,	%l1,	%l2
	xnor	%i0,	0x14C7,	%l6
	xnor	%g2,	0x1513,	%i2
	mova	%xcc,	%i7,	%i6
	fcmple32	%f2,	%f16,	%o2
	movrlez	%i5,	%g7,	%g4
	fbl,a	%fcc2,	loop_1578
	fmovdn	%icc,	%f10,	%f17
	movpos	%xcc,	%i1,	%o7
	addccc	%g5,	0x031C,	%l3
loop_1578:
	array16	%i4,	%o3,	%l4
	fandnot1s	%f19,	%f7,	%f11
	wr	%g0,	0x81,	%asi
	swapa	[%l7 + 0x74] %asi,	%g6
	bn	loop_1579
	srlx	%g3,	0x0C,	%o4
	edge16	%o5,	%o6,	%l0
	bn,pt	%xcc,	loop_1580
loop_1579:
	mova	%icc,	%o0,	%g1
	fmovrde	%l5,	%f6,	%f14
	movne	%icc,	%i3,	%o1
loop_1580:
	std	%l2,	[%l7 + 0x48]
	mova	%xcc,	%l1,	%l6
	movrlez	%g2,	%i2,	%i7
	xnor	%i0,	0x134D,	%i6
	fands	%f1,	%f8,	%f19
	movg	%xcc,	%i5,	%g7
	fmovrse	%g4,	%f16,	%f7
	movleu	%icc,	%o2,	%i1
	nop
	set	0x3E, %g5
	ldub	[%l7 + %g5],	%g5
	tl	%icc,	0x2
	fsrc2	%f4,	%f4
	fcmpeq16	%f2,	%f24,	%o7
	fbug	%fcc3,	loop_1581
	alignaddrl	%l3,	%i4,	%o3
	wr	%g0,	0x81,	%asi
	stha	%l4,	[%l7 + 0x48] %asi
loop_1581:
	fmovscc	%xcc,	%f4,	%f27
	fmovrslz	%g6,	%f23,	%f0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8	%o4,	%g3,	%o6
	nop
	setx	loop_1582,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	bg,a,pt	%xcc,	loop_1583
	fbo	%fcc1,	loop_1584
	taddcc	%o5,	%o0,	%g1
loop_1582:
	ba	loop_1585
loop_1583:
	edge8l	%l5,	%l0,	%i3
loop_1584:
	fmovdgu	%xcc,	%f4,	%f28
	fmul8ulx16	%f0,	%f4,	%f30
loop_1585:
	fmovsa	%icc,	%f21,	%f21
	fzero	%f24
	fornot1s	%f22,	%f16,	%f16
	wr	%g0,	0xe3,	%asi
	stha	%o1,	[%l7 + 0x08] %asi
	membar	#Sync
	stb	%l1,	[%l7 + 0x2A]
	fcmpd	%fcc3,	%f30,	%f0
	wr	%g0,	0x81,	%asi
	lduha	[%l7 + 0x12] %asi,	%l6
	bne	loop_1586
	tleu	%icc,	0x5
	wr	%g0,	0x5f,	%asi
	stxa	%g2,	[%g0 + 0x0] %asi
loop_1586:
	orncc	%i2,	0x0845,	%i7
	movrgz	%l2,	0x150,	%i0
	movre	%i5,	%g7,	%g4
	tsubcc	%o2,	0x1756,	%i6
	fcmpgt32	%f16,	%f20,	%g5
	subc	%o7,	0x08A2,	%l3
	nop
	set	0x38, %o5
	ldsw	[%l7 + %o5],	%i4
	popc	%o3,	%l4
	srl	%g6,	0x10,	%i1
	fcmpgt16	%f4,	%f8,	%o4
	fnot1s	%f13,	%f5
	xnorcc	%g3,	%o6,	%o0
	movpos	%icc,	%g1,	%l5
	smul	%l0,	0x1E18,	%i3
	umul	%o1,	0x1E37,	%o5
	fnors	%f20,	%f3,	%f18
	sub	%l6,	%g2,	%l1
	wr	%g0,	0x04,	%asi
	stha	%i7,	[%l7 + 0x6C] %asi
	movge	%icc,	%i2,	%i0
	fpack32	%f26,	%f24,	%f8
	tvs	%icc,	0x4
	nop
	setx	loop_1587,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fblg	%fcc0,	loop_1588
	fmovda	%xcc,	%f7,	%f2
	tsubcctv	%l2,	0x023B,	%g7
loop_1587:
	sdivx	%i5,	0x1C34,	%o2
loop_1588:
	edge16l	%i6,	%g5,	%o7
	array8	%g4,	%i4,	%o3
	fmovrdgez	%l3,	%f10,	%f2
	srl	%g6,	0x0D,	%l4
	wr	%g0,	0x88,	%asi
	ldda	[%l7 + 0x40] %asi,	%i0
	edge16l	%o4,	%g3,	%o6
	movge	%icc,	%g1,	%o0
	fcmpne32	%f12,	%f20,	%l5
	edge16	%l0,	%i3,	%o1
	be,pn	%icc,	loop_1589
	smulcc	%l6,	0x11C6,	%g2
	sth	%l1,	[%l7 + 0x24]
	set	0x2C, %g6
	stha	%o5,	[%l7 + %g6] 0x89
loop_1589:
	orncc	%i2,	%i7,	%l2
	fmul8ulx16	%f18,	%f2,	%f10
	umul	%i0,	%i5,	%g7
	ldd	[%l7 + 0x60],	%i6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tcc	%icc,	0x4
	sub	%o2,	0x04F3,	%o7
	set	0x5C, %g7
	ldswa	[%l7 + %g7] 0x0c,	%g4
	edge16n	%g5,	%o3,	%l3
	fcmpes	%fcc0,	%f22,	%f22
	fmovsleu	%icc,	%f25,	%f11
	fones	%f23
	set	0x38, %g2
	stda	%i4,	[%l7 + %g2] 0x04
	movvs	%xcc,	%l4,	%i1
	movcs	%xcc,	%o4,	%g6
	fpmerge	%f18,	%f21,	%f4
	fmovsgu	%icc,	%f28,	%f30
	movvs	%icc,	%g3,	%o6
	alignaddr	%o0,	%g1,	%l5
	tsubcctv	%i3,	0x134D,	%o1
	stbar
	srl	%l6,	%l0,	%l1
	edge16n	%g2,	%i2,	%i7
	fabsd	%f10,	%f16
	movneg	%xcc,	%l2,	%o5
	smul	%i5,	0x074F,	%g7
	edge8	%i0,	%o2,	%i6
	andcc	%g4,	%g5,	%o3
	wr	%g0,	0x2b,	%asi
	stwa	%l3,	[%l7 + 0x68] %asi
	membar	#Sync
	fbul,a	%fcc2,	loop_1590
	fbn,a	%fcc3,	loop_1591
	edge16n	%i4,	%l4,	%o7
	fba,a	%fcc2,	loop_1592
loop_1590:
	addcc	%i1,	%g6,	%g3
loop_1591:
	fblg	%fcc2,	loop_1593
	movle	%xcc,	%o6,	%o4
loop_1592:
	movrgez	%g1,	%l5,	%o0
	nop
	setx	loop_1594,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_1593:
	fxnor	%f6,	%f18,	%f16
	fnot1	%f10,	%f28
	movrlez	%o1,	%i3,	%l0
loop_1594:
	sth	%l1,	[%l7 + 0x32]
	umul	%g2,	0x1553,	%l6
	move	%xcc,	%i7,	%l2
	wr	%g0,	0x18,	%asi
	ldsha	[%l7 + 0x7A] %asi,	%o5
	wr	%g0,	0x89,	%asi
	ldswa	[%l7 + 0x0C] %asi,	%i5
	tneg	%icc,	0x0
	andn	%g7,	%i0,	%o2
	fpack32	%f12,	%f22,	%f12
	fbule	%fcc0,	loop_1595
	srax	%i2,	%i6,	%g5
	set	0x54, %l1
	ldsha	[%l7 + %l1] 0x10,	%g4
loop_1595:
	sub	%o3,	%i4,	%l3
	wr	%g0,	0x10,	%asi
	lda	[%l7 + 0x64] %asi,	%f22
	or	%o7,	0x111B,	%l4
	bneg,a	loop_1596
	bgu,pn	%xcc,	loop_1597
	ldub	[%l7 + 0x14],	%g6
	sll	%i1,	0x0C,	%o6
loop_1596:
	nop
	wr	%g0,	0x80,	%asi
	lduha	[%l7 + 0x56] %asi,	%o4
loop_1597:
	subcc	%g3,	%g1,	%o0
	edge16ln	%o1,	%l5,	%i3
	nop
	set	0x48, %o1
	ldd	[%l7 + %o1],	%f30
	swap	[%l7 + 0x44],	%l1
	fbug	%fcc3,	loop_1598
	umulcc	%l0,	%g2,	%i7
	movcs	%icc,	%l6,	%l2
	edge8	%o5,	%g7,	%i5
loop_1598:
	bne,a	%icc,	loop_1599
	tneg	%xcc,	0x7
	edge32ln	%o2,	%i0,	%i6
	umulcc	%g5,	%i2,	%o3
loop_1599:
	fxors	%f16,	%f10,	%f10
	mulx	%i4,	0x1B63,	%g4
	fone	%f24
	fmovdl	%xcc,	%f10,	%f3
	array16	%l3,	%l4,	%o7
	bleu,pn	%xcc,	loop_1600
	tl	%xcc,	0x6
	sdiv	%g6,	0x07B3,	%i1
	alignaddrl	%o6,	%o4,	%g3
loop_1600:
	tcc	%xcc,	0x4
	srl	%o0,	0x14,	%g1
	fpadd32s	%f13,	%f18,	%f10
	tvs	%icc,	0x3
	edge16ln	%l5,	%o1,	%l1
	xnor	%i3,	%g2,	%i7
	fmovsg	%xcc,	%f9,	%f7
	wr	%g0,	0x0c,	%asi
	ldsba	[%l7 + 0x29] %asi,	%l6
	ldsh	[%l7 + 0x58],	%l2
	bne,a,pt	%xcc,	loop_1601
	nop
	setx loop_1602, %l0, %l1
	jmpl %l1, %o5
	orcc	%g7,	0x099B,	%l0
	addccc	%i5,	%o2,	%i6
loop_1601:
	or	%g5,	%i2,	%i0
loop_1602:
	movn	%icc,	%o3,	%i4
	edge16l	%l3,	%g4,	%l4
	fnor	%f22,	%f8,	%f16
	set	0x58, %i2
	lda	[%l7 + %i2] 0x04,	%f14
	tgu	%xcc,	0x5
	membar	0x2E
	fmovdvc	%xcc,	%f24,	%f16
	edge32ln	%o7,	%i1,	%o6
	sllx	%g6,	0x14,	%g3
	subcc	%o0,	%o4,	%l5
	fbo,a	%fcc0,	loop_1603
	tn	%icc,	0x1
	fmovsle	%xcc,	%f19,	%f20
	sethi	0x12CA,	%g1
loop_1603:
	nop
	wr	%g0,	0x0c,	%asi
	swapa	[%l7 + 0x54] %asi,	%l1
	brz	%i3,	loop_1604
	fba	%fcc3,	loop_1605
	movneg	%icc,	%g2,	%i7
	umulcc	%o1,	%l2,	%o5
loop_1604:
	edge32n	%g7,	%l6,	%i5
loop_1605:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array16	%l0,	%o2,	%g5
	fnors	%f28,	%f19,	%f27
	andn	%i6,	0x107E,	%i2
	movgu	%xcc,	%o3,	%i0
	nop
	setx loop_1606, %l0, %l1
	jmpl %l1, %i4
	tpos	%xcc,	0x1
	fsrc2s	%f28,	%f12
	andn	%g4,	%l3,	%o7
loop_1606:
	movvs	%icc,	%l4,	%o6
	ldd	[%l7 + 0x70],	%f6
	tg	%icc,	0x1
	tl	%icc,	0x1
	add	%l7,	0x60,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%g6,	%i1
	smul	%o0,	%o4,	%l5
	tsubcc	%g3,	%l1,	%g1
	fmul8x16au	%f29,	%f3,	%f26
	fbul	%fcc2,	loop_1607
	sra	%g2,	%i7,	%o1
	edge32l	%i3,	%l2,	%g7
	movgu	%icc,	%o5,	%i5
loop_1607:
	fmovdcs	%icc,	%f21,	%f20
	orncc	%l6,	0x0D44,	%o2
	sub	%g5,	%l0,	%i2
	bcs	%icc,	loop_1608
	movrgez	%i6,	0x206,	%i0
	smulcc	%i4,	0x1EF1,	%o3
	bleu,pn	%xcc,	loop_1609
loop_1608:
	movpos	%xcc,	%g4,	%l3
	tcc	%icc,	0x2
	movrne	%o7,	%l4,	%o6
loop_1609:
	nop
	setx loop_1610, %l0, %l1
	jmpl %l1, %g6
	bl,pn	%icc,	loop_1611
	tne	%icc,	0x0
	tn	%xcc,	0x1
loop_1610:
	movleu	%xcc,	%o0,	%o4
loop_1611:
	array32	%i1,	%l5,	%l1
	xnor	%g3,	%g1,	%g2
	addcc	%i7,	0x1619,	%o1
	fble,a	%fcc3,	loop_1612
	movvs	%icc,	%l2,	%g7
	movne	%icc,	%i3,	%o5
	umul	%l6,	0x0ABB,	%i5
loop_1612:
	srlx	%o2,	0x06,	%l0
	bvs	%icc,	loop_1613
	fmovsl	%icc,	%f29,	%f20
	xor	%g5,	%i2,	%i0
	movrlez	%i6,	0x02E,	%i4
loop_1613:
	swap	[%l7 + 0x34],	%g4
	edge16n	%l3,	%o7,	%o3
	mova	%icc,	%o6,	%l4
	set	0x6A, %i0
	lduba	[%l7 + %i0] 0x19,	%o0
	xnorcc	%o4,	%g6,	%i1
	fmovdneg	%xcc,	%f27,	%f23
	nop
	setx	loop_1614,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	mova	%icc,	%l5,	%g3
	tne	%xcc,	0x2
	sir	0x038C
loop_1614:
	movpos	%xcc,	%l1,	%g2
	fmovdcs	%icc,	%f26,	%f25
	movcc	%icc,	%g1,	%o1
	lduw	[%l7 + 0x50],	%l2
	movrgez	%i7,	0x33D,	%g7
	fornot2s	%f1,	%f13,	%f5
	te	%xcc,	0x5
	udivcc	%o5,	0x077A,	%l6
	ba,a	loop_1615
	fcmple16	%f4,	%f28,	%i5
	tge	%icc,	0x7
	orcc	%o2,	0x0EC2,	%l0
loop_1615:
	tg	%xcc,	0x5
	subc	%i3,	%g5,	%i2
	bleu,a,pt	%icc,	loop_1616
	fmovdg	%icc,	%f7,	%f24
	tcs	%icc,	0x3
	brgz	%i0,	loop_1617
loop_1616:
	fnot2s	%f2,	%f0
	movge	%xcc,	%i4,	%g4
	array32	%i6,	%o7,	%o3
loop_1617:
	movrgz	%l3,	0x078,	%o6
	fbue,a	%fcc0,	loop_1618
	andn	%l4,	%o4,	%o0
	taddcc	%g6,	0x0153,	%l5
	fbu	%fcc2,	loop_1619
loop_1618:
	prefetch	[%l7 + 0x58],	 0x1
	fxnors	%f18,	%f13,	%f18
	orn	%g3,	0x0E14,	%l1
loop_1619:
	fmovdvc	%xcc,	%f16,	%f25
	fornot2s	%f6,	%f22,	%f2
	fxnors	%f8,	%f30,	%f23
	edge16	%i1,	%g2,	%o1
	mova	%xcc,	%l2,	%i7
	tpos	%xcc,	0x7
	fbl,a	%fcc0,	loop_1620
	fors	%f30,	%f14,	%f22
	fcmpes	%fcc0,	%f4,	%f7
	set	0x16, %o3
	ldsha	[%l7 + %o3] 0x0c,	%g1
loop_1620:
	fmovdpos	%icc,	%f7,	%f14
	wr	%g0,	0x04,	%asi
	ldstuba	[%l7 + 0x7C] %asi,	%g7
	fcmple16	%f10,	%f6,	%l6
	fxors	%f4,	%f16,	%f0
	srax	%i5,	0x12,	%o5
	addcc	%l0,	%i3,	%g5
	brgz,a	%i2,	loop_1621
	tle	%xcc,	0x3
	set	0x70, %l3
	prefetcha	[%l7 + %l3] 0x19,	 0x2
loop_1621:
	fmovsneg	%xcc,	%f12,	%f5
	add	%l7,	0x70,	%l6
	wr	%g0,	0x11,	%asi
	ldxa	[%l6] %asi,	%i0
	casxa	[%l6] 0x11,	%i0,	%i4
	bge,pt	%icc,	loop_1622
	fpsub16	%f0,	%f16,	%f26
	fmovsneg	%xcc,	%f5,	%f30
	edge32n	%i6,	%g4,	%o3
loop_1622:
	sir	0x1406
	sra	%o7,	0x1F,	%o6
	bge,a,pn	%xcc,	loop_1623
	bne	%icc,	loop_1624
	movrlez	%l4,	0x35D,	%l3
	tneg	%icc,	0x3
loop_1623:
	or	%o4,	0x1E8C,	%g6
loop_1624:
	taddcctv	%o0,	0x0C89,	%l5
	wr	%g0,	0x81,	%asi
	ldswa	[%l7 + 0x58] %asi,	%l1
	movl	%xcc,	%g3,	%i1
	ldsh	[%l7 + 0x5A],	%g2
	taddcc	%l2,	0x03E2,	%i7
	sra	%o1,	%g1,	%g7
	fbu,a	%fcc0,	loop_1625
	subcc	%l6,	0x1846,	%i5
	brgez,a	%l0,	loop_1626
	fble	%fcc3,	loop_1627
loop_1625:
	orn	%o5,	0x02EC,	%g5
	fpadd16	%f18,	%f4,	%f12
loop_1626:
	movge	%xcc,	%i3,	%i2
loop_1627:
	array8	%o2,	%i4,	%i0
	ta	%icc,	0x6
	xnor	%g4,	%i6,	%o3
	fmovdvs	%icc,	%f9,	%f27
	fpack32	%f28,	%f30,	%f12
	ta	%xcc,	0x4
	fzeros	%f26
	tg	%xcc,	0x3
	membar	0x79
	fbule	%fcc0,	loop_1628
	fcmpgt16	%f14,	%f22,	%o6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tsubcctv	%l4,	0x1A17,	%l3
loop_1628:
	movn	%icc,	%o7,	%g6
	wr	%g0,	0x0c,	%asi
	sta	%f9,	[%l7 + 0x38] %asi
	fsrc2s	%f25,	%f11
	edge16n	%o4,	%o0,	%l5
	fpsub16	%f22,	%f12,	%f22
	movvs	%icc,	%l1,	%g3
	fmovrse	%g2,	%f18,	%f23
	fandnot1s	%f2,	%f31,	%f26
	array32	%i1,	%l2,	%o1
	addccc	%i7,	%g1,	%g7
	fpack16	%f24,	%f9
	array16	%l6,	%l0,	%i5
	tleu	%xcc,	0x1
	be,pt	%xcc,	loop_1629
	srlx	%o5,	%i3,	%g5
	srax	%o2,	%i2,	%i0
	fandnot1s	%f7,	%f6,	%f4
loop_1629:
	nop
	wr	%g0,	0x04,	%asi
	lduwa	[%l7 + 0x7C] %asi,	%i4
	taddcc	%i6,	0x180A,	%o3
	udiv	%o6,	0x074F,	%g4
	wr	%g0,	0xea,	%asi
	stha	%l4,	[%l7 + 0x30] %asi
	membar	#Sync
	taddcc	%l3,	%g6,	%o7
	call	loop_1630
	bleu,pt	%xcc,	loop_1631
	andn	%o0,	0x1802,	%o4
	edge16ln	%l5,	%l1,	%g3
loop_1630:
	mulx	%g2,	%l2,	%i1
loop_1631:
	tcc	%icc,	0x5
	udivx	%o1,	0x0A56,	%g1
	add	%l7,	0x7C,	%l6
	wr	%g0,	0x18,	%asi
	lda	[%l6] %asi,	%g7
	casa	[%l6] %asi,	%g7,	%l6
	fbo,a	%fcc0,	loop_1632
	tcs	%xcc,	0x1
	movvc	%icc,	%l0,	%i7
	movg	%xcc,	%i5,	%i3
loop_1632:
	orncc	%o5,	%g5,	%i2
	fble,a	%fcc1,	loop_1633
	subccc	%i0,	0x0225,	%i4
	nop
	setx	loop_1634,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fbo	%fcc2,	loop_1635
loop_1633:
	fsrc2s	%f20,	%f22
	brgez,a	%o2,	loop_1636
loop_1634:
	pdist	%f10,	%f6,	%f26
loop_1635:
	sdivcc	%o3,	0x0E44,	%o6
	ld	[%l7 + 0x0C],	%f29
loop_1636:
	fbg,a	%fcc0,	loop_1637
	subcc	%i6,	%l4,	%l3
	tcs	%xcc,	0x1
	wr	%g0,	0x10,	%asi
	ldsha	[%l7 + 0x72] %asi,	%g4
loop_1637:
	movrgz	%g6,	%o0,	%o7
	fmovdvc	%icc,	%f25,	%f21
	fmovdvc	%xcc,	%f14,	%f18
	xnorcc	%l5,	%o4,	%g3
	tsubcctv	%g2,	0x1945,	%l2
	tleu	%icc,	0x1
	orcc	%l1,	%i1,	%g1
	bcc,pn	%xcc,	loop_1638
	movcs	%icc,	%o1,	%g7
	xor	%l6,	%l0,	%i7
	fmovscs	%icc,	%f27,	%f11
loop_1638:
	fsrc2s	%f11,	%f12
	set	0x60, %i1
	stda	%i4,	[%l7 + %i1] 0xea
	membar	#Sync
	movrlz	%o5,	%i3,	%i2
	brgez,a	%g5,	loop_1639
	bleu,pt	%icc,	loop_1640
	ldsw	[%l7 + 0x38],	%i0
	fnands	%f6,	%f13,	%f1
loop_1639:
	ta	%icc,	0x6
loop_1640:
	bn,a	loop_1641
	brgez	%i4,	loop_1642
	st	%f31,	[%l7 + 0x78]
	movleu	%xcc,	%o2,	%o6
loop_1641:
	srl	%o3,	%l4,	%i6
loop_1642:
	fpsub32	%f30,	%f16,	%f22
	fmovdn	%icc,	%f17,	%f3
	subccc	%g4,	0x0683,	%g6
	edge16	%l3,	%o0,	%o7
	movle	%icc,	%l5,	%o4
	fmovdgu	%xcc,	%f30,	%f21
	movne	%xcc,	%g2,	%l2
	movvs	%icc,	%g3,	%i1
	stb	%l1,	[%l7 + 0x7A]
	xor	%g1,	%o1,	%g7
	fmovrsgz	%l6,	%f9,	%f18
	subccc	%i7,	0x1112,	%i5
	subccc	%l0,	0x1F15,	%o5
	fcmped	%fcc2,	%f4,	%f8
	edge8ln	%i3,	%i2,	%i0
	edge32l	%g5,	%o2,	%o6
	movg	%icc,	%o3,	%l4
	fnot2s	%f9,	%f2
	fnor	%f4,	%f22,	%f8
	orcc	%i6,	%g4,	%g6
	fmovrsgz	%i4,	%f7,	%f30
	tcs	%icc,	0x3
	movne	%xcc,	%l3,	%o7
	sdiv	%l5,	0x12EC,	%o4
	subc	%o0,	0x1B85,	%l2
	movcs	%icc,	%g3,	%i1
	subcc	%g2,	%g1,	%o1
	fpadd32	%f16,	%f16,	%f16
	fmovsgu	%xcc,	%f20,	%f14
	ta	%icc,	0x7
	bvc	loop_1643
	tge	%xcc,	0x0
	fmovrsgez	%l1,	%f4,	%f0
	tpos	%xcc,	0x5
loop_1643:
	ldstub	[%l7 + 0x5C],	%g7
	fmovsvc	%icc,	%f31,	%f13
	sth	%l6,	[%l7 + 0x20]
	nop
	set	0x70, %l2
	ldd	[%l7 + %l2],	%f6
	move	%xcc,	%i5,	%i7
	set	0x6C, %o2
	stha	%l0,	[%l7 + %o2] 0xeb
	membar	#Sync
	udivcc	%i3,	0x0DC5,	%i2
	nop
	setx loop_1644, %l0, %l1
	jmpl %l1, %i0
	fmovsge	%icc,	%f14,	%f11
	fmovdleu	%xcc,	%f14,	%f18
	membar	0x31
loop_1644:
	fbge,a	%fcc2,	loop_1645
	sir	0x111B
	array8	%o5,	%o2,	%g5
	movvs	%xcc,	%o6,	%l4
loop_1645:
	andcc	%o3,	%g4,	%g6
	fba	%fcc0,	loop_1646
	edge16ln	%i4,	%l3,	%i6
	mova	%xcc,	%l5,	%o7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1646:
	fpsub32s	%f0,	%f29,	%f6
	ta	%xcc,	0x7
	tpos	%icc,	0x5
	xor	%o0,	%o4,	%l2
	nop
	set	0x28, %g3
	ldx	[%l7 + %g3],	%g3
	and	%g2,	0x0ECC,	%i1
	umul	%o1,	%l1,	%g7
	fmovsle	%xcc,	%f19,	%f16
	fbuge	%fcc3,	loop_1647
	fmovdcc	%icc,	%f4,	%f20
	umulcc	%l6,	0x14F5,	%i5
	add	%g1,	0x1359,	%l0
loop_1647:
	movvs	%icc,	%i3,	%i7
	sdivx	%i2,	0x1549,	%i0
	fxnors	%f1,	%f31,	%f18
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ta	%icc,	0x7
	array16	%o2,	%o5,	%g5
	smulcc	%o6,	0x0AB9,	%l4
	bvs	%icc,	loop_1648
	bvc,a,pn	%icc,	loop_1649
	tg	%xcc,	0x0
	tcc	%icc,	0x5
loop_1648:
	subc	%g4,	0x120E,	%o3
loop_1649:
	movg	%icc,	%g6,	%i4
	xnor	%i6,	%l3,	%l5
	addcc	%o7,	0x0372,	%o0
	xorcc	%o4,	0x0553,	%g3
	xnor	%g2,	0x0463,	%i1
	fbg,a	%fcc2,	loop_1650
	bneg,a	loop_1651
	sdivx	%l2,	0x167A,	%o1
	udiv	%l1,	0x010D,	%l6
loop_1650:
	orn	%g7,	0x02F1,	%g1
loop_1651:
	sdivx	%i5,	0x10A2,	%i3
	be,a,pt	%icc,	loop_1652
	umulcc	%i7,	0x1B10,	%i2
	tle	%xcc,	0x7
	sethi	0x1C65,	%i0
loop_1652:
	fpsub16	%f18,	%f14,	%f18
	fnot1s	%f0,	%f2
	orncc	%o2,	%o5,	%l0
	tle	%xcc,	0x2
	nop
	setx	loop_1653,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fmovsg	%icc,	%f11,	%f17
	xor	%g5,	%l4,	%o6
	fpadd16	%f0,	%f26,	%f8
loop_1653:
	fcmpne16	%f6,	%f30,	%g4
	edge32	%o3,	%i4,	%i6
	set	0x14, %l0
	ldswa	[%l7 + %l0] 0x11,	%g6
	brlz,a	%l5,	loop_1654
	fexpand	%f23,	%f14
	movcs	%xcc,	%o7,	%l3
	fmovscs	%icc,	%f27,	%f14
loop_1654:
	fmovse	%icc,	%f29,	%f29
	andncc	%o4,	%g3,	%o0
	set	0x40, %i6
	ldda	[%l7 + %i6] 0x04,	%f0
	ldsh	[%l7 + 0x5E],	%g2
	fornot2s	%f11,	%f15,	%f5
	brz,a	%i1,	loop_1655
	srl	%l2,	0x1B,	%o1
	set	0x7C, %g4
	lduwa	[%l7 + %g4] 0x80,	%l1
loop_1655:
	ldstub	[%l7 + 0x4E],	%g7
	fexpand	%f22,	%f26
	ldx	[%l7 + 0x20],	%l6
	st	%f3,	[%l7 + 0x7C]
	te	%xcc,	0x6
	andn	%i5,	%i3,	%g1
	movrne	%i2,	0x044,	%i0
	tne	%icc,	0x6
	ldub	[%l7 + 0x0A],	%o2
	fnands	%f5,	%f23,	%f12
	movcc	%icc,	%o5,	%l0
	bcc,pn	%xcc,	loop_1656
	ldx	[%l7 + 0x30],	%g5
	addc	%i7,	%l4,	%o6
	srlx	%o3,	%i4,	%g4
loop_1656:
	taddcc	%g6,	0x0853,	%i6
	add	%l5,	%o7,	%l3
	brlz	%g3,	loop_1657
	sub	%o0,	0x0FAA,	%o4
	wr	%g0,	0x2f,	%asi
	stba	%i1,	[%l7 + 0x23] %asi
	membar	#Sync
loop_1657:
	edge32	%l2,	%g2,	%o1
	fmovdne	%icc,	%f15,	%f21
	set	0x3E, %o6
	ldsha	[%l7 + %o6] 0x14,	%l1
	fmovsa	%icc,	%f1,	%f8
	fpmerge	%f18,	%f14,	%f4
	udivx	%g7,	0x0864,	%i5
	movrlez	%i3,	0x12D,	%l6
	te	%xcc,	0x7
	array8	%i2,	%g1,	%o2
	sll	%i0,	%l0,	%g5
	sir	0x1BAB
	andn	%i7,	%l4,	%o6
	subc	%o5,	0x0433,	%i4
	umul	%g4,	%o3,	%i6
	fnors	%f24,	%f13,	%f15
	fmovda	%xcc,	%f16,	%f24
	fnot2s	%f11,	%f18
	umulcc	%l5,	%g6,	%o7
	bvc	%xcc,	loop_1658
	fmovrslz	%g3,	%f17,	%f24
	tleu	%xcc,	0x6
	fbe,a	%fcc1,	loop_1659
loop_1658:
	fcmple16	%f28,	%f2,	%l3
	set	0x68, %g1
	swapa	[%l7 + %g1] 0x88,	%o0
loop_1659:
	tvc	%xcc,	0x6
	fmovdneg	%xcc,	%f21,	%f2
	fpsub32	%f22,	%f4,	%f14
	taddcctv	%i1,	0x09FE,	%o4
	ldsw	[%l7 + 0x70],	%l2
	mulx	%o1,	%l1,	%g2
	brlez,a	%g7,	loop_1660
	addc	%i3,	0x0832,	%l6
	tge	%xcc,	0x0
	bg,a	%icc,	loop_1661
loop_1660:
	fmovdcc	%xcc,	%f18,	%f29
	fmovrse	%i2,	%f21,	%f22
	or	%i5,	0x1799,	%g1
loop_1661:
	tsubcc	%o2,	0x0C68,	%l0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsne	%icc,	%f29,	%f19
	wr	%g0,	0x18,	%asi
	lduba	[%l7 + 0x68] %asi,	%i0
	sdiv	%g5,	0x085B,	%i7
	fcmpgt32	%f18,	%f12,	%l4
	fsrc1	%f22,	%f6
	fcmpne32	%f10,	%f12,	%o5
	bcc,pt	%xcc,	loop_1662
	tsubcc	%i4,	%o6,	%o3
	wr	%g0,	0x0c,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
loop_1662:
	fmuld8ulx16	%f18,	%f6,	%f22
	fmovdleu	%xcc,	%f11,	%f2
	tleu	%icc,	0x5
	mulscc	%i6,	0x0C34,	%g4
	tsubcctv	%g6,	%o7,	%l5
	and	%g3,	0x1DA0,	%l3
	fmovsne	%icc,	%f3,	%f11
	fbu,a	%fcc0,	loop_1663
	stx	%i1,	[%l7 + 0x50]
	srax	%o0,	0x0F,	%o4
	movvc	%icc,	%o1,	%l2
loop_1663:
	fmovrdgez	%g2,	%f30,	%f24
	nop
	setx loop_1664, %l0, %l1
	jmpl %l1, %g7
	fnegd	%f24,	%f10
	fpadd16	%f14,	%f30,	%f24
	tneg	%xcc,	0x3
loop_1664:
	brgz	%l1,	loop_1665
	nop
	setx	loop_1666,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fexpand	%f1,	%f0
	udivx	%i3,	0x127A,	%i2
loop_1665:
	movrne	%i5,	0x087,	%g1
loop_1666:
	nop
	wr	%g0,	0x89,	%asi
	ldswa	[%l7 + 0x18] %asi,	%l6
	umulcc	%o2,	%l0,	%g5
	fmovsvc	%xcc,	%f14,	%f20
	sdivcc	%i7,	0x0EBD,	%l4
	movrgz	%o5,	0x3A2,	%i4
	brz	%i0,	loop_1667
	edge32ln	%o3,	%o6,	%g4
	orn	%g6,	%i6,	%l5
	fornot2	%f22,	%f20,	%f14
loop_1667:
	edge16n	%o7,	%g3,	%l3
	fnot2	%f10,	%f16
	set	0x68, %l4
	prefetcha	[%l7 + %l4] 0x81,	 0x1
	fmovrsgz	%o0,	%f3,	%f29
	brlez,a	%o1,	loop_1668
	movcs	%icc,	%l2,	%g2
	bg	%xcc,	loop_1669
	movg	%icc,	%o4,	%l1
loop_1668:
	edge32	%i3,	%g7,	%i5
	fmovd	%f18,	%f12
loop_1669:
	array32	%g1,	%l6,	%o2
	tsubcc	%l0,	%i2,	%i7
	edge32	%l4,	%g5,	%o5
	and	%i0,	0x0A6E,	%i4
	fmovdneg	%icc,	%f11,	%f15
	call	loop_1670
	st	%f1,	[%l7 + 0x58]
	ldub	[%l7 + 0x4A],	%o6
	tsubcctv	%g4,	%g6,	%o3
loop_1670:
	movre	%i6,	0x247,	%o7
	ldx	[%l7 + 0x08],	%l5
	movg	%xcc,	%g3,	%i1
	fcmpgt32	%f2,	%f24,	%o0
	tleu	%xcc,	0x5
	bvc,a	%icc,	loop_1671
	movcc	%icc,	%l3,	%o1
	udivx	%l2,	0x0EA5,	%o4
	subc	%l1,	%i3,	%g2
loop_1671:
	fmovd	%f6,	%f2
	fcmpeq16	%f4,	%f28,	%i5
	sdivcc	%g1,	0x150A,	%l6
	fnegd	%f24,	%f22
	fmovda	%icc,	%f4,	%f18
	for	%f0,	%f8,	%f18
	fba	%fcc3,	loop_1672
	edge32ln	%o2,	%g7,	%l0
	faligndata	%f16,	%f26,	%f26
	set	0x4E, %o0
	ldsha	[%l7 + %o0] 0x15,	%i2
loop_1672:
	sethi	0x1ACF,	%i7
	wr	%g0,	0x52,	%asi
	ldxa	[%g0 + 0x210] %asi,	%l4
	array16	%o5,	%i0,	%i4
	fxors	%f24,	%f24,	%f26
	fcmps	%fcc2,	%f4,	%f1
	tvs	%icc,	0x0
	taddcc	%o6,	0x103D,	%g5
	fornot2	%f26,	%f20,	%f24
	subc	%g4,	0x03D0,	%o3
	movn	%icc,	%g6,	%i6
	wr	%g0,	0x88,	%asi
	prefetcha	[%l7 + 0x78] %asi,	 0x3
	fmovdn	%xcc,	%f0,	%f19
	movrne	%o7,	0x385,	%g3
	movleu	%icc,	%i1,	%l3
	brnz	%o0,	loop_1673
	andcc	%l2,	%o4,	%l1
	popc	%o1,	%g2
	fmovda	%xcc,	%f5,	%f13
loop_1673:
	fmovda	%icc,	%f1,	%f13
	fcmpne32	%f0,	%f4,	%i3
	ld	[%l7 + 0x50],	%f16
	add	%l7,	0x70,	%l6
	wr	%g0,	0x11,	%asi
	ldxa	[%l6] %asi,	%i5
	casxa	[%l6] %asi,	%i5,	%l6
	fornot2	%f20,	%f12,	%f30
	movvc	%icc,	%g1,	%o2
	sethi	0x1065,	%l0
	stx	%i2,	[%l7 + 0x28]
	sllx	%g7,	0x13,	%i7
	fbuge	%fcc3,	loop_1674
	movle	%xcc,	%o5,	%i0
	movcc	%xcc,	%i4,	%o6
	fba	%fcc0,	loop_1675
loop_1674:
	taddcctv	%g5,	0x1C16,	%l4
	edge32n	%g4,	%o3,	%i6
	subccc	%g6,	0x0C6E,	%o7
loop_1675:
	fsrc2s	%f1,	%f22
	subc	%g3,	%l5,	%i1
	mulx	%l3,	0x1A19,	%o0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	brnz	%o4,	loop_1676
	srl	%l1,	%l2,	%o1
	umulcc	%g2,	0x1236,	%i3
	tcc	%icc,	0x6
loop_1676:
	array32	%i5,	%l6,	%o2
	edge8	%l0,	%g1,	%i2
	xnor	%i7,	%g7,	%i0
	edge8n	%i4,	%o6,	%g5
	fbe	%fcc3,	loop_1677
	sllx	%o5,	0x00,	%l4
	movvc	%xcc,	%g4,	%i6
	mova	%icc,	%o3,	%o7
loop_1677:
	fnot2s	%f3,	%f23
	udivcc	%g3,	0x060C,	%g6
	movneg	%icc,	%i1,	%l5
	movrlz	%l3,	%o0,	%o4
	movrlz	%l2,	%o1,	%l1
	addc	%i3,	0x10EE,	%g2
	set	0x40, %i5
	stxa	%l6,	[%l7 + %i5] 0xea
	membar	#Sync
	fbe,a	%fcc0,	loop_1678
	tl	%icc,	0x0
	ta	%icc,	0x4
	udiv	%i5,	0x1C6B,	%o2
loop_1678:
	fnor	%f24,	%f16,	%f16
	and	%g1,	0x0DD3,	%l0
	or	%i7,	0x1A86,	%i2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x89,	%asi
	lduwa	[%l7 + 0x20] %asi,	%i0
	sdivcc	%g7,	0x0169,	%o6
	fpsub32	%f20,	%f14,	%f24
	set	0x48, %l5
	lda	[%l7 + %l5] 0x10,	%f19
	movg	%xcc,	%g5,	%i4
	brlz	%l4,	loop_1679
	movcs	%icc,	%g4,	%o5
	movrlz	%o3,	%i6,	%o7
	movre	%g6,	%g3,	%i1
loop_1679:
	movrgez	%l3,	%o0,	%l5
	set	0x3C, %o7
	ldswa	[%l7 + %o7] 0x04,	%o4
	fpadd32	%f20,	%f30,	%f24
	fbul,a	%fcc0,	loop_1680
	std	%o0,	[%l7 + 0x38]
	prefetch	[%l7 + 0x30],	 0x2
	movrne	%l1,	0x190,	%l2
loop_1680:
	udivcc	%i3,	0x0EF9,	%l6
	fmovdn	%icc,	%f23,	%f5
	nop
	setx	loop_1681,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	or	%g2,	0x19FD,	%i5
	fand	%f18,	%f16,	%f18
	fpadd16	%f24,	%f14,	%f22
loop_1681:
	fnors	%f21,	%f15,	%f25
	umulcc	%o2,	0x0D49,	%g1
	wr	%g0,	0x18,	%asi
	stba	%i7,	[%l7 + 0x46] %asi
	fmovrdne	%l0,	%f18,	%f26
	fmovspos	%xcc,	%f24,	%f1
	std	%f4,	[%l7 + 0x08]
	fcmps	%fcc3,	%f23,	%f16
	udivx	%i2,	0x0324,	%i0
	fbul,a	%fcc1,	loop_1682
	tsubcc	%g7,	%o6,	%g5
	movrgez	%i4,	0x220,	%l4
	tgu	%xcc,	0x0
loop_1682:
	fbuge,a	%fcc1,	loop_1683
	sll	%o5,	0x1F,	%o3
	fmovsge	%icc,	%f8,	%f18
	sra	%i6,	%o7,	%g6
loop_1683:
	or	%g4,	0x1D07,	%g3
	brz,a	%l3,	loop_1684
	tge	%xcc,	0x3
	movrlez	%i1,	0x2CE,	%l5
	fmovdleu	%xcc,	%f11,	%f19
loop_1684:
	nop
	set	0x56, %i7
	ldstuba	[%l7 + %i7] 0x80,	%o0
	movneg	%xcc,	%o1,	%l1
	tne	%xcc,	0x7
	tcs	%icc,	0x1
	edge8n	%o4,	%l2,	%i3
	andcc	%l6,	%g2,	%i5
	movle	%icc,	%g1,	%o2
	fmovsleu	%icc,	%f17,	%f1
	fmovsne	%xcc,	%f9,	%f7
	nop
	setx loop_1685, %l0, %l1
	jmpl %l1, %i7
	tvs	%icc,	0x6
	add	%l7,	0x2C,	%l6
	wr	%g0,	0x0c,	%asi
	casa	[%l6] 0x0c,	%i2,	%i0
loop_1685:
	fmovrsgez	%g7,	%f8,	%f28
	addccc	%o6,	%l0,	%i4
	mulscc	%l4,	0x1FBC,	%g5
	alignaddr	%o3,	%i6,	%o5
	edge16n	%o7,	%g6,	%g4
	prefetch	[%l7 + 0x68],	 0x2
	movne	%icc,	%l3,	%g3
	fmul8x16au	%f10,	%f5,	%f26
	nop
	setx	loop_1686,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	mulscc	%l5,	%i1,	%o0
	taddcc	%o1,	0x1F4B,	%o4
	edge16n	%l2,	%i3,	%l1
loop_1686:
	nop
	wr	%g0,	0x89,	%asi
	ldsba	[%l7 + 0x56] %asi,	%l6
	bvc	%xcc,	loop_1687
	ldsh	[%l7 + 0x28],	%g2
	fpsub32	%f6,	%f24,	%f30
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1687:
	fbul,a	%fcc3,	loop_1688
	brnz,a	%i5,	loop_1689
	tvc	%xcc,	0x7
	smul	%o2,	0x0F45,	%g1
loop_1688:
	fxor	%f6,	%f4,	%f14
loop_1689:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmpgt32	%f0,	%f10,	%i7
	set	0x1F, %o4
	ldsba	[%l7 + %o4] 0x18,	%i0
	tneg	%icc,	0x2
	andncc	%g7,	%o6,	%i2
	movrgz	%i4,	0x016,	%l4
	movrgez	%l0,	0x3B7,	%g5
	membar	0x74
	bge,a,pn	%xcc,	loop_1690
	udiv	%i6,	0x1192,	%o5
	movle	%icc,	%o3,	%o7
	fmovsg	%xcc,	%f10,	%f1
loop_1690:
	sdivcc	%g6,	0x1F9C,	%g4
	array32	%l3,	%l5,	%g3
	bshuffle	%f20,	%f4,	%f20
	swap	[%l7 + 0x20],	%i1
	movpos	%xcc,	%o0,	%o4
	tvs	%xcc,	0x0
	fsrc1s	%f21,	%f14
	edge8	%l2,	%o1,	%i3
	fpadd32	%f12,	%f20,	%f8
	fmovrde	%l6,	%f6,	%f20
	movneg	%xcc,	%g2,	%l1
	andcc	%o2,	0x1879,	%i5
	sll	%i7,	%i0,	%g1
	movcc	%xcc,	%g7,	%o6
	ldd	[%l7 + 0x10],	%f30
	fbule	%fcc2,	loop_1691
	fble,a	%fcc2,	loop_1692
	fpadd32	%f14,	%f8,	%f6
	ldx	[%l7 + 0x30],	%i4
loop_1691:
	fmovdcc	%xcc,	%f21,	%f31
loop_1692:
	nop
	set	0x40, %i4
	stda	%f16,	[%l7 + %i4] 0x16
	membar	#Sync
	mulscc	%l4,	%i2,	%l0
	movl	%xcc,	%g5,	%i6
	wr	%g0,	0x80,	%asi
	ldswa	[%l7 + 0x44] %asi,	%o3
	addc	%o5,	%g6,	%o7
	movvc	%icc,	%l3,	%g4
	fpsub32s	%f13,	%f8,	%f16
	mulx	%g3,	%l5,	%o0
	umulcc	%o4,	0x14A6,	%i1
	tgu	%icc,	0x5
	membar	0x3C
	sllx	%o1,	0x19,	%l2
	fnegd	%f28,	%f28
	subcc	%l6,	0x16F5,	%g2
	alignaddrl	%l1,	%o2,	%i5
	nop
	setx loop_1693, %l0, %l1
	jmpl %l1, %i3
	edge8ln	%i7,	%g1,	%i0
	udivx	%g7,	0x0F79,	%i4
	stbar
loop_1693:
	fpadd32s	%f28,	%f28,	%f29
	and	%o6,	0x0C88,	%l4
	srlx	%i2,	%g5,	%i6
	xor	%l0,	%o3,	%o5
	call	loop_1694
	fone	%f4
	ldd	[%l7 + 0x58],	%g6
	movcc	%icc,	%o7,	%g4
loop_1694:
	movn	%icc,	%g3,	%l5
	tvs	%xcc,	0x0
	wr	%g0,	0x81,	%asi
	lduwa	[%l7 + 0x10] %asi,	%l3
	addc	%o0,	0x0557,	%i1
	alignaddr	%o4,	%l2,	%o1
	bne,a	loop_1695
	fmovrde	%g2,	%f16,	%f24
	fmovdcs	%xcc,	%f25,	%f6
	wr	%g0,	0x27,	%asi
	stda	%l0,	[%l7 + 0x18] %asi
	membar	#Sync
loop_1695:
	srax	%l6,	%o2,	%i5
	sdivx	%i7,	0x17C8,	%g1
	fcmpd	%fcc3,	%f16,	%f20
	subccc	%i3,	%g7,	%i0
	fsrc2	%f26,	%f2
	brlez,a	%o6,	loop_1696
	fmovdcs	%icc,	%f6,	%f6
	fbuge,a	%fcc1,	loop_1697
	srlx	%l4,	0x0C,	%i4
loop_1696:
	andcc	%g5,	0x1AB3,	%i6
	tge	%icc,	0x2
loop_1697:
	std	%i2,	[%l7 + 0x50]
	smulcc	%o3,	0x01A2,	%o5
	fbule	%fcc1,	loop_1698
	array8	%g6,	%o7,	%g4
	ta	%xcc,	0x6
	andncc	%g3,	%l5,	%l3
loop_1698:
	be	%icc,	loop_1699
	te	%xcc,	0x2
	movleu	%icc,	%o0,	%l0
	subc	%i1,	0x12B5,	%l2
loop_1699:
	subc	%o4,	%g2,	%l1
	wr	%g0,	0x89,	%asi
	stda	%o0,	[%l7 + 0x28] %asi
	srax	%l6,	%o2,	%i7
	taddcctv	%g1,	0x1234,	%i3
	sdiv	%i5,	0x13A7,	%g7
	ldsb	[%l7 + 0x73],	%o6
	and	%i0,	0x05E8,	%i4
	taddcc	%l4,	0x1E9F,	%g5
	bl,a,pn	%xcc,	loop_1700
	movrgez	%i6,	%i2,	%o3
	tsubcctv	%o5,	0x1E67,	%g6
	sdivcc	%o7,	0x0BA1,	%g3
loop_1700:
	nop
	add	%l7,	0x58,	%l6
	wr	%g0,	0x10,	%asi
	casa	[%l6] %asi,	%l5,	%g4
	fcmpgt16	%f26,	%f30,	%o0
	fmuld8sux16	%f30,	%f31,	%f26
	fcmpeq16	%f0,	%f26,	%l3
	ldd	[%l7 + 0x60],	%i0
	movre	%l2,	0x296,	%o4
	movn	%xcc,	%l0,	%l1
	fxor	%f8,	%f26,	%f8
	sra	%o1,	0x1D,	%g2
	sdivx	%l6,	0x0FDE,	%o2
	set	0x40, %l6
	stda	%f16,	[%l7 + %l6] 0x80
	pdist	%f8,	%f28,	%f24
	membar	0x19
	wr	%g0,	0x19,	%asi
	lduba	[%l7 + 0x62] %asi,	%i7
	membar	#Sync
	set	0x40, %g5
	ldda	[%l7 + %g5] 0x17,	%f16
	fba,a	%fcc3,	loop_1701
	xor	%g1,	0x1C4A,	%i3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movleu	%xcc,	%g7,	%i5
loop_1701:
	tleu	%icc,	0x6
	brlez	%i0,	loop_1702
	umul	%i4,	0x1CDE,	%o6
	movre	%g5,	%i6,	%i2
	edge8n	%o3,	%o5,	%l4
loop_1702:
	orncc	%o7,	%g6,	%l5
	movcc	%icc,	%g3,	%o0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ble,a	%xcc,	loop_1703
	sra	%g4,	%l3,	%l2
	be,a	%icc,	loop_1704
	membar	0x44
loop_1703:
	edge8n	%i1,	%o4,	%l1
	edge16	%l0,	%g2,	%l6
loop_1704:
	movre	%o2,	0x147,	%i7
	tvs	%xcc,	0x0
	movrgez	%g1,	%o1,	%g7
	wr	%g0,	0x81,	%asi
	lduwa	[%l7 + 0x78] %asi,	%i3
	fabss	%f4,	%f31
	bcs,a	%xcc,	loop_1705
	alignaddrl	%i5,	%i4,	%o6
	fcmpgt32	%f24,	%f24,	%g5
	brlez,a	%i6,	loop_1706
loop_1705:
	addc	%i2,	0x0764,	%o3
	alignaddrl	%i0,	%l4,	%o5
	sra	%o7,	0x11,	%l5
loop_1706:
	fmovsvs	%xcc,	%f22,	%f8
	fmovrdne	%g3,	%f0,	%f30
	stbar
	fands	%f30,	%f1,	%f25
	addc	%o0,	%g6,	%g4
	edge16n	%l3,	%l2,	%o4
	fmul8x16	%f13,	%f6,	%f22
	movrgez	%l1,	%l0,	%g2
	wr	%g0,	0x0c,	%asi
	sta	%f21,	[%l7 + 0x38] %asi
	nop
	setx	loop_1707,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	sir	0x0FC7
	edge8ln	%l6,	%o2,	%i1
	edge16ln	%g1,	%o1,	%g7
loop_1707:
	movleu	%xcc,	%i3,	%i7
	xnor	%i4,	%i5,	%o6
	fmovdvs	%icc,	%f7,	%f0
	bge,a,pn	%icc,	loop_1708
	fbo,a	%fcc3,	loop_1709
	fpsub16s	%f6,	%f7,	%f27
	subcc	%i6,	0x1694,	%g5
loop_1708:
	fbo	%fcc1,	loop_1710
loop_1709:
	addc	%i2,	0x19CD,	%o3
	fpsub16s	%f14,	%f10,	%f29
	srax	%l4,	0x15,	%o5
loop_1710:
	sra	%i0,	%l5,	%g3
	addcc	%o0,	0x0D01,	%o7
	array16	%g4,	%l3,	%l2
	ble,a	%xcc,	loop_1711
	bne,a,pt	%icc,	loop_1712
	fmovs	%f6,	%f25
	wr	%g0,	0x89,	%asi
	lduha	[%l7 + 0x48] %asi,	%g6
loop_1711:
	fbul,a	%fcc1,	loop_1713
loop_1712:
	fxor	%f8,	%f8,	%f0
	taddcc	%l1,	0x182F,	%o4
	mulscc	%g2,	0x18C9,	%l6
loop_1713:
	fcmpne32	%f18,	%f8,	%l0
	fones	%f7
	fmovsleu	%icc,	%f11,	%f19
	umulcc	%i1,	%g1,	%o2
	xor	%o1,	0x0568,	%i3
	membar	#Sync
	wr	%g0,	0x17,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	fmovsvc	%icc,	%f6,	%f30
	bgu,pn	%xcc,	loop_1714
	bne	loop_1715
	tneg	%icc,	0x2
	array8	%g7,	%i7,	%i4
loop_1714:
	fbn,a	%fcc1,	loop_1716
loop_1715:
	movrgez	%o6,	%i5,	%i6
	edge8ln	%i2,	%o3,	%l4
	tpos	%xcc,	0x7
loop_1716:
	ta	%xcc,	0x1
	call	loop_1717
	mova	%icc,	%o5,	%g5
	array16	%l5,	%i0,	%o0
	fandnot2	%f16,	%f30,	%f18
loop_1717:
	movcc	%xcc,	%g3,	%g4
	movpos	%icc,	%l3,	%o7
	fsrc1s	%f21,	%f9
	smulcc	%l2,	0x0B8C,	%g6
	tle	%xcc,	0x7
	wr	%g0,	0x2b,	%asi
	stxa	%o4,	[%l7 + 0x48] %asi
	membar	#Sync
	nop
	set	0x58, %o5
	ldd	[%l7 + %o5],	%f8
	be	loop_1718
	sll	%l1,	0x1B,	%l6
	mulscc	%l0,	0x1216,	%g2
	udivx	%i1,	0x1E71,	%o2
loop_1718:
	nop
	set	0x1C, %g6
	sta	%f29,	[%l7 + %g6] 0x80
	bcs,a	loop_1719
	popc	0x11E4,	%o1
	alignaddr	%g1,	%g7,	%i3
	mulscc	%i4,	0x19B4,	%i7
loop_1719:
	brz	%i5,	loop_1720
	movrne	%i6,	%o6,	%i2
	fpmerge	%f24,	%f30,	%f24
	fpadd16	%f24,	%f4,	%f28
loop_1720:
	stw	%l4,	[%l7 + 0x2C]
	st	%f15,	[%l7 + 0x60]
	tgu	%xcc,	0x1
	fnot2s	%f14,	%f18
	srax	%o3,	0x00,	%o5
	fnand	%f20,	%f8,	%f24
	edge8n	%g5,	%i0,	%o0
	alignaddrl	%l5,	%g3,	%g4
	nop
	set	0x48, %i3
	prefetch	[%l7 + %i3],	 0x3
	set	0x10, %g2
	ldxa	[%l7 + %g2] 0x19,	%o7
	tle	%xcc,	0x0
	bn,a,pn	%icc,	loop_1721
	fbo,a	%fcc0,	loop_1722
	addccc	%l3,	%g6,	%l2
	ble,a	%xcc,	loop_1723
loop_1721:
	bleu,pt	%icc,	loop_1724
loop_1722:
	fcmpne16	%f18,	%f26,	%l1
	tcs	%icc,	0x7
loop_1723:
	edge8n	%o4,	%l6,	%l0
loop_1724:
	fbn,a	%fcc0,	loop_1725
	movrlz	%g2,	0x1C3,	%i1
	fxors	%f26,	%f4,	%f0
	subc	%o2,	%g1,	%g7
loop_1725:
	edge32l	%o1,	%i4,	%i7
	andn	%i5,	0x18DB,	%i6
	fone	%f6
	te	%icc,	0x5
	addc	%i3,	%o6,	%l4
	wr	%g0,	0x80,	%asi
	ldstuba	[%l7 + 0x75] %asi,	%i2
	fbe,a	%fcc1,	loop_1726
	subc	%o3,	%o5,	%g5
	udivx	%o0,	0x028E,	%i0
	edge16	%g3,	%g4,	%o7
loop_1726:
	bneg,a	loop_1727
	movl	%icc,	%l5,	%l3
	srlx	%l2,	0x02,	%l1
	xnor	%o4,	0x1A99,	%l6
loop_1727:
	tneg	%icc,	0x5
	tsubcc	%g6,	%g2,	%i1
	stx	%o2,	[%l7 + 0x30]
	be,a	loop_1728
	or	%l0,	0x04F7,	%g7
	brnz,a	%g1,	loop_1729
	bgu,a	loop_1730
loop_1728:
	addccc	%i4,	0x1993,	%i7
	bne,pn	%xcc,	loop_1731
loop_1729:
	te	%xcc,	0x0
loop_1730:
	movrlez	%o1,	0x389,	%i6
	wr	%g0,	0x88,	%asi
	swapa	[%l7 + 0x4C] %asi,	%i3
loop_1731:
	addcc	%o6,	0x09F0,	%i5
	fbne,a	%fcc1,	loop_1732
	subc	%l4,	%o3,	%i2
	xnor	%g5,	%o0,	%i0
	popc	0x11B5,	%o5
loop_1732:
	orn	%g4,	0x1061,	%g3
	fmovsvc	%xcc,	%f4,	%f20
	bn,a,pn	%xcc,	loop_1733
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movneg	%icc,	%l5,	%l3
	sethi	0x1E83,	%o7
loop_1733:
	nop
	wr	%g0,	0x89,	%asi
	ldsha	[%l7 + 0x48] %asi,	%l2
	movleu	%icc,	%l1,	%l6
	fbu	%fcc3,	loop_1734
	fsrc2s	%f25,	%f26
	fbn,a	%fcc2,	loop_1735
	flush	%l7 + 0x78
loop_1734:
	edge16l	%o4,	%g2,	%g6
	tn	%xcc,	0x6
loop_1735:
	array16	%i1,	%o2,	%l0
	call	loop_1736
	movleu	%xcc,	%g1,	%i4
	movrgz	%g7,	0x2C8,	%o1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1736:
	bpos	%xcc,	loop_1737
	movle	%xcc,	%i6,	%i7
	mova	%icc,	%i3,	%o6
	fmul8x16al	%f23,	%f8,	%f12
loop_1737:
	nop
	wr	%g0,	0x80,	%asi
	prefetcha	[%l7 + 0x48] %asi,	 0x2
	fmovsge	%xcc,	%f24,	%f19
	movvs	%icc,	%i5,	%i2
	tle	%icc,	0x5
	set	0x4C, %l1
	sta	%f9,	[%l7 + %l1] 0x14
	tsubcc	%g5,	%o0,	%o3
	mulx	%o5,	0x02A3,	%g4
	movvc	%icc,	%i0,	%l5
	fmuld8ulx16	%f0,	%f19,	%f24
	wr	%g0,	0x04,	%asi
	lduha	[%l7 + 0x36] %asi,	%l3
	ble	%xcc,	loop_1738
	andn	%g3,	0x0D78,	%l2
	sub	%l1,	%l6,	%o4
	stw	%g2,	[%l7 + 0x28]
loop_1738:
	alignaddr	%g6,	%o7,	%i1
	array8	%l0,	%o2,	%i4
	tcs	%xcc,	0x6
	fcmpne16	%f26,	%f6,	%g1
	tvs	%xcc,	0x5
	movrlez	%o1,	%i6,	%i7
	addcc	%g7,	0x168D,	%i3
	srlx	%o6,	%l4,	%i5
	movvs	%icc,	%i2,	%g5
	edge32ln	%o0,	%o5,	%o3
	tge	%icc,	0x2
	ta	%icc,	0x5
	movrlz	%g4,	0x36B,	%l5
	movrne	%l3,	0x20D,	%i0
	bne	loop_1739
	movl	%xcc,	%g3,	%l2
	fmovscc	%icc,	%f9,	%f15
	tge	%icc,	0x7
loop_1739:
	sdivx	%l6,	0x1277,	%o4
	bvs,pn	%xcc,	loop_1740
	tvc	%xcc,	0x3
	sub	%l1,	0x1593,	%g6
	nop
	setx loop_1741, %l0, %l1
	jmpl %l1, %o7
loop_1740:
	add	%i1,	0x030D,	%g2
	lduw	[%l7 + 0x18],	%l0
	movne	%icc,	%i4,	%o2
loop_1741:
	taddcctv	%g1,	0x09FD,	%o1
	andn	%i6,	0x1380,	%i7
	membar	0x5D
	popc	0x19CC,	%i3
	tvs	%xcc,	0x2
	mova	%xcc,	%o6,	%g7
	movg	%icc,	%l4,	%i2
	tl	%xcc,	0x0
	tne	%xcc,	0x2
	fmovrslz	%i5,	%f20,	%f10
	bgu,a,pn	%icc,	loop_1742
	fmovdgu	%icc,	%f11,	%f10
	ble,a	%icc,	loop_1743
	fcmpne16	%f26,	%f2,	%g5
loop_1742:
	lduw	[%l7 + 0x08],	%o5
	andcc	%o0,	0x1E94,	%g4
loop_1743:
	bcc,a	%xcc,	loop_1744
	sll	%l5,	0x1D,	%o3
	wr	%g0,	0xe3,	%asi
	stxa	%i0,	[%l7 + 0x70] %asi
	membar	#Sync
loop_1744:
	fpsub32s	%f5,	%f4,	%f25
	stw	%g3,	[%l7 + 0x28]
	add	%l7,	0x0C,	%l6
	wr	%g0,	0x11,	%asi
	casa	[%l6] %asi,	%l3,	%l2
	taddcctv	%l6,	0x0575,	%l1
	fble	%fcc0,	loop_1745
	tgu	%icc,	0x5
	wr	%g0,	0x17,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
loop_1745:
	ld	[%l7 + 0x3C],	%f3
	bcc	loop_1746
	fmovsn	%icc,	%f5,	%f17
	ld	[%l7 + 0x50],	%f7
	bvc,a,pn	%icc,	loop_1747
loop_1746:
	mulx	%g6,	0x19EC,	%o4
	fnand	%f28,	%f4,	%f2
	fone	%f24
loop_1747:
	fnot1s	%f30,	%f12
	srax	%i1,	0x15,	%o7
	tle	%xcc,	0x4
	fmovsgu	%xcc,	%f25,	%f18
	fornot2s	%f18,	%f3,	%f12
	movrgz	%l0,	%g2,	%i4
	edge8n	%g1,	%o2,	%i6
	fandnot2	%f26,	%f24,	%f22
	tvc	%icc,	0x0
	movl	%xcc,	%o1,	%i7
	xor	%o6,	%g7,	%i3
	xnor	%i2,	0x1883,	%l4
	sir	0x1945
	bleu,a	loop_1748
	movcc	%icc,	%i5,	%o5
	set	0x7F, %o1
	stba	%o0,	[%l7 + %o1] 0x0c
loop_1748:
	movg	%xcc,	%g4,	%g5
	movvc	%xcc,	%o3,	%l5
	tg	%icc,	0x5
	edge16ln	%i0,	%l3,	%g3
	mulx	%l2,	%l6,	%l1
	movrne	%o4,	0x156,	%i1
	tneg	%icc,	0x6
	sllx	%o7,	%g6,	%l0
	array16	%g2,	%i4,	%o2
	bgu	%icc,	loop_1749
	fbne	%fcc1,	loop_1750
	udivcc	%i6,	0x11F5,	%g1
	mulx	%o1,	0x09A1,	%i7
loop_1749:
	add	%g7,	0x1843,	%i3
loop_1750:
	for	%f10,	%f10,	%f10
	brgez	%o6,	loop_1751
	umulcc	%i2,	0x0F61,	%l4
	umulcc	%o5,	0x1EB5,	%o0
	fmovsl	%icc,	%f31,	%f10
loop_1751:
	mulscc	%i5,	%g5,	%g4
	move	%xcc,	%l5,	%i0
	andn	%l3,	%g3,	%o3
	edge16l	%l6,	%l1,	%o4
	prefetch	[%l7 + 0x24],	 0x0
	sra	%i1,	0x08,	%o7
	sll	%g6,	%l0,	%l2
	stw	%g2,	[%l7 + 0x30]
	fmovdg	%icc,	%f28,	%f26
	smulcc	%i4,	0x1097,	%i6
	fcmpeq16	%f4,	%f14,	%g1
	fzeros	%f19
	subcc	%o1,	0x092C,	%i7
	fmovdle	%xcc,	%f3,	%f23
	andn	%o2,	0x1E5D,	%g7
	te	%icc,	0x0
	fcmpne16	%f24,	%f14,	%i3
	fbue,a	%fcc0,	loop_1752
	call	loop_1753
	movcs	%xcc,	%i2,	%o6
	fmovsne	%icc,	%f14,	%f13
loop_1752:
	tsubcc	%o5,	0x1068,	%o0
loop_1753:
	sllx	%i5,	%l4,	%g5
	fble	%fcc0,	loop_1754
	sra	%g4,	%i0,	%l3
	fmul8sux16	%f22,	%f12,	%f16
	tn	%xcc,	0x6
loop_1754:
	taddcctv	%l5,	0x1872,	%g3
	add	%l7,	0x08,	%l6
	wr	%g0,	0x0c,	%asi
	casxa	[%l6] %asi,	%l6,	%l1
	sth	%o4,	[%l7 + 0x0E]
	fsrc2s	%f21,	%f19
	siam	0x0
	andn	%i1,	0x0316,	%o3
	ldsh	[%l7 + 0x12],	%g6
	tg	%icc,	0x6
	wr	%g0,	0x0c,	%asi
	ldsba	[%l7 + 0x62] %asi,	%l0
	edge8ln	%o7,	%l2,	%i4
	edge16ln	%i6,	%g1,	%g2
	array32	%i7,	%o1,	%g7
	movgu	%icc,	%i3,	%i2
	mova	%icc,	%o2,	%o5
	membar	0x2A
	fcmpeq32	%f8,	%f22,	%o6
	fpadd16	%f4,	%f6,	%f2
	edge32n	%o0,	%i5,	%g5
	wr	%g0,	0x04,	%asi
	ldstuba	[%l7 + 0x30] %asi,	%l4
	bshuffle	%f26,	%f4,	%f10
	or	%i0,	%l3,	%g4
	pdist	%f0,	%f18,	%f28
	addc	%l5,	0x180D,	%g3
	fnand	%f10,	%f14,	%f12
	fbo	%fcc3,	loop_1755
	srl	%l1,	%l6,	%i1
	movge	%icc,	%o4,	%o3
	fmovdvc	%xcc,	%f24,	%f9
loop_1755:
	xnorcc	%l0,	%g6,	%o7
	fmul8x16au	%f2,	%f13,	%f28
	fnegs	%f4,	%f21
	set	0x40, %i2
	ldda	[%l7 + %i2] 0x89,	%f0
	and	%i4,	0x1270,	%i6
	umul	%g1,	0x1924,	%g2
	fnot2s	%f18,	%f27
	movg	%xcc,	%l2,	%o1
	wr	%g0,	0x2f,	%asi
	stha	%i7,	[%l7 + 0x50] %asi
	membar	#Sync
	movge	%icc,	%g7,	%i2
	fand	%f28,	%f16,	%f8
	andn	%o2,	0x1380,	%i3
	udiv	%o5,	0x12FF,	%o0
	membar	0x46
	ldsh	[%l7 + 0x36],	%o6
	fcmpeq32	%f0,	%f14,	%i5
	fexpand	%f24,	%f22
	movrlz	%g5,	0x38B,	%l4
	stb	%l3,	[%l7 + 0x4D]
	movpos	%icc,	%i0,	%g4
	tge	%xcc,	0x2
	sdivx	%g3,	0x0C7E,	%l5
	ldd	[%l7 + 0x18],	%f18
	sdivx	%l1,	0x1635,	%l6
	sdiv	%i1,	0x016A,	%o3
	subc	%l0,	%o4,	%o7
	stbar
	edge16n	%i4,	%i6,	%g6
	movn	%xcc,	%g2,	%l2
	nop
	set	0x40, %i0
	stw	%g1,	[%l7 + %i0]
	fandnot1	%f26,	%f4,	%f20
	fmovdgu	%xcc,	%f2,	%f0
	xor	%i7,	0x09BE,	%g7
	tpos	%xcc,	0x4
	fmovd	%f28,	%f26
	fcmpd	%fcc3,	%f24,	%f30
	udivx	%i2,	0x0AA6,	%o2
	fmovrdlz	%i3,	%f22,	%f24
	bcc,a	loop_1756
	fnand	%f14,	%f12,	%f10
	umul	%o5,	0x1D11,	%o1
	wr	%g0,	0x89,	%asi
	lduba	[%l7 + 0x26] %asi,	%o6
loop_1756:
	andn	%o0,	%g5,	%l4
	wr	%g0,	0x0c,	%asi
	prefetcha	[%l7 + 0x78] %asi,	 0x0
	ldstub	[%l7 + 0x6B],	%i0
	sra	%g4,	%g3,	%i5
	movcc	%xcc,	%l5,	%l6
	andncc	%l1,	%o3,	%i1
	fmovdvs	%icc,	%f11,	%f0
	udiv	%l0,	0x060A,	%o7
	stbar
	fmovdvc	%xcc,	%f17,	%f11
	fmuld8sux16	%f23,	%f25,	%f28
	srlx	%o4,	%i6,	%i4
	movvs	%icc,	%g6,	%l2
	fpack32	%f2,	%f0,	%f10
	std	%g0,	[%l7 + 0x58]
	edge32	%g2,	%g7,	%i7
	movne	%icc,	%i2,	%i3
	fxors	%f12,	%f4,	%f19
	mulscc	%o5,	0x1AFF,	%o2
	fmovdcs	%icc,	%f1,	%f26
	tcc	%icc,	0x0
	fands	%f9,	%f24,	%f28
	udiv	%o6,	0x1842,	%o1
	wr	%g0,	0x10,	%asi
	ldsha	[%l7 + 0x30] %asi,	%o0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpadd32	%f2,	%f28,	%f14
	edge8ln	%g5,	%l3,	%i0
	tneg	%icc,	0x1
	fnot2s	%f12,	%f14
	movcc	%icc,	%l4,	%g3
	fandnot2	%f28,	%f16,	%f12
	addccc	%g4,	%l5,	%i5
	sdivcc	%l6,	0x101C,	%l1
	sdiv	%i1,	0x18E5,	%o3
	add	%o7,	%o4,	%l0
	ldd	[%l7 + 0x08],	%f6
	fbge,a	%fcc0,	loop_1757
	edge8l	%i4,	%i6,	%l2
	set	0x1F, %g7
	stba	%g1,	[%l7 + %g7] 0x15
loop_1757:
	and	%g6,	%g7,	%g2
	sir	0x0DF3
	movrlez	%i7,	%i2,	%o5
	fmovsleu	%xcc,	%f6,	%f17
	fble,a	%fcc2,	loop_1758
	bge	%icc,	loop_1759
	and	%i3,	0x0904,	%o6
	array16	%o1,	%o2,	%g5
loop_1758:
	array8	%o0,	%i0,	%l3
loop_1759:
	lduw	[%l7 + 0x44],	%l4
	bne,a,pn	%icc,	loop_1760
	tvc	%xcc,	0x1
	fblg,a	%fcc2,	loop_1761
	fbul,a	%fcc1,	loop_1762
loop_1760:
	fone	%f16
	fnot2s	%f20,	%f28
loop_1761:
	fmovsleu	%xcc,	%f6,	%f21
loop_1762:
	fxnors	%f27,	%f19,	%f27
	tneg	%icc,	0x5
	wr	%g0,	0x22,	%asi
	ldda	[%l7 + 0x10] %asi,	%g2
	movrlz	%g4,	%l5,	%l6
	movgu	%icc,	%l1,	%i1
	alignaddrl	%o3,	%i5,	%o4
	orn	%o7,	%i4,	%l0
	sdivx	%l2,	0x1AD4,	%g1
	fcmpes	%fcc1,	%f28,	%f15
	fmovdleu	%xcc,	%f9,	%f18
	nop
	set	0x70, %l3
	sth	%g6,	[%l7 + %l3]
	edge32n	%g7,	%i6,	%g2
	add	%i2,	0x11F4,	%o5
	fmovdcs	%icc,	%f15,	%f17
	set	0x08, %i1
	ldsha	[%l7 + %i1] 0x14,	%i7
	tcs	%xcc,	0x2
	edge16	%o6,	%i3,	%o2
	fmovdl	%icc,	%f27,	%f11
	subc	%g5,	0x03B9,	%o1
	nop
	set	0x14, %o3
	sth	%i0,	[%l7 + %o3]
	xorcc	%o0,	%l4,	%l3
	ld	[%l7 + 0x10],	%f16
	smul	%g4,	0x1CD9,	%l5
	sdiv	%l6,	0x0A40,	%l1
	movge	%xcc,	%i1,	%g3
	movcc	%icc,	%i5,	%o4
	wr	%g0,	0x89,	%asi
	stba	%o3,	[%l7 + 0x7E] %asi
	tsubcctv	%o7,	0x04D0,	%l0
	tn	%icc,	0x3
	umulcc	%l2,	%g1,	%i4
	tcc	%xcc,	0x2
	andncc	%g6,	%i6,	%g2
	wr	%g0,	0x2a,	%asi
	stxa	%g7,	[%l7 + 0x60] %asi
	membar	#Sync
	lduh	[%l7 + 0x3C],	%i2
	fmovdcs	%icc,	%f7,	%f30
	fxor	%f0,	%f16,	%f26
	popc	0x1B32,	%o5
	fcmpgt32	%f28,	%f24,	%i7
	movge	%icc,	%i3,	%o6
	pdist	%f12,	%f0,	%f12
	udiv	%g5,	0x1829,	%o1
	bleu,a,pn	%xcc,	loop_1763
	fornot2	%f28,	%f0,	%f22
	movleu	%icc,	%i0,	%o2
	umul	%l4,	%o0,	%l3
loop_1763:
	fpadd16	%f26,	%f10,	%f8
	udivcc	%g4,	0x1712,	%l5
	fmovrslz	%l6,	%f28,	%f9
	movrlz	%i1,	%g3,	%l1
	or	%i5,	%o4,	%o3
	umul	%o7,	0x1807,	%l2
	fmovsa	%icc,	%f5,	%f11
	tl	%icc,	0x1
	fblg,a	%fcc0,	loop_1764
	orncc	%l0,	%i4,	%g6
	fandnot1	%f28,	%f4,	%f12
	set	0x30, %l2
	ldda	[%l7 + %l2] 0x2f,	%i6
loop_1764:
	fmovrsne	%g2,	%f12,	%f29
	fcmpgt16	%f20,	%f18,	%g1
	sdiv	%i2,	0x0169,	%g7
	edge8ln	%i7,	%i3,	%o6
	ldd	[%l7 + 0x18],	%f16
	edge8n	%o5,	%o1,	%i0
	sethi	0x1629,	%g5
	wr	%g0,	0x11,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	sir	0x1151
	move	%xcc,	%o2,	%o0
	fxor	%f0,	%f26,	%f12
	alignaddrl	%l3,	%g4,	%l4
	move	%icc,	%l5,	%i1
	xorcc	%l6,	%g3,	%i5
	tsubcc	%o4,	0x1B17,	%l1
	xnorcc	%o7,	0x1B1F,	%o3
	edge16n	%l2,	%i4,	%l0
	fmovrdgz	%i6,	%f26,	%f24
	membar	#Sync
	set	0x40, %g3
	ldda	[%l7 + %g3] 0xf0,	%f16
	edge16n	%g2,	%g1,	%i2
	edge8l	%g6,	%g7,	%i7
	tleu	%xcc,	0x2
	tvs	%icc,	0x4
	movne	%icc,	%i3,	%o5
	edge8ln	%o6,	%o1,	%g5
	fmovdn	%icc,	%f11,	%f5
	movgu	%icc,	%i0,	%o2
	movg	%xcc,	%o0,	%l3
	fcmpes	%fcc1,	%f8,	%f7
	movgu	%xcc,	%g4,	%l4
	alignaddrl	%i1,	%l6,	%l5
	umul	%i5,	0x1CDC,	%o4
	fmovdgu	%xcc,	%f4,	%f20
	or	%l1,	%g3,	%o7
	fpadd16s	%f30,	%f18,	%f20
	bgu	loop_1765
	edge16n	%o3,	%i4,	%l2
	xor	%l0,	%g2,	%g1
	fsrc2	%f14,	%f20
loop_1765:
	nop
	add	%l7,	0x70,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%i6,	%i2
	srl	%g7,	%i7,	%g6
	mova	%xcc,	%i3,	%o5
	smulcc	%o1,	0x0591,	%o6
	udiv	%i0,	0x0897,	%o2
	or	%g5,	%o0,	%g4
	fbl,a	%fcc2,	loop_1766
	edge16l	%l4,	%i1,	%l3
	xorcc	%l5,	%i5,	%o4
	fmovrdlez	%l1,	%f18,	%f12
loop_1766:
	fmovdne	%icc,	%f8,	%f2
	ldsw	[%l7 + 0x68],	%g3
	fmul8sux16	%f20,	%f28,	%f28
	tleu	%icc,	0x0
	srlx	%o7,	%l6,	%o3
	movgu	%icc,	%l2,	%i4
	bcc,a,pt	%xcc,	loop_1767
	fbg	%fcc3,	loop_1768
	movrlz	%g2,	%l0,	%i6
	srlx	%g1,	%g7,	%i7
loop_1767:
	orn	%g6,	0x1E4C,	%i3
loop_1768:
	umul	%i2,	0x00D1,	%o5
	taddcc	%o6,	0x05F8,	%o1
	tgu	%icc,	0x7
	fmovrdlz	%i0,	%f10,	%f6
	fnand	%f30,	%f2,	%f26
	fmovdleu	%icc,	%f14,	%f8
	fmovrsgez	%g5,	%f18,	%f16
	ldsb	[%l7 + 0x15],	%o2
	edge8	%o0,	%l4,	%i1
	prefetch	[%l7 + 0x64],	 0x1
	fmovrdlz	%l3,	%f10,	%f4
	fpadd16s	%f29,	%f15,	%f13
	sllx	%g4,	%l5,	%o4
	set	0x58, %o2
	stda	%i4,	[%l7 + %o2] 0x81
	udivx	%l1,	0x19F0,	%g3
	bcc,a	%xcc,	loop_1769
	andcc	%l6,	0x1F9F,	%o3
	std	%f0,	[%l7 + 0x78]
	subcc	%o7,	0x1E4E,	%l2
loop_1769:
	fxnors	%f31,	%f0,	%f18
	fmul8sux16	%f2,	%f6,	%f10
	fnor	%f16,	%f20,	%f12
	movle	%xcc,	%g2,	%i4
	fnor	%f14,	%f14,	%f28
	srl	%i6,	%g1,	%g7
	tge	%xcc,	0x7
	edge8l	%i7,	%l0,	%i3
	movl	%xcc,	%g6,	%o5
	move	%icc,	%i2,	%o6
	array16	%i0,	%g5,	%o1
	fmovsneg	%icc,	%f6,	%f20
	movneg	%xcc,	%o0,	%l4
	bn,a,pn	%icc,	loop_1770
	fmovs	%f20,	%f18
	fbuge,a	%fcc1,	loop_1771
	sllx	%o2,	%l3,	%i1
loop_1770:
	array32	%g4,	%l5,	%i5
	fcmpgt16	%f14,	%f20,	%o4
loop_1771:
	fblg	%fcc1,	loop_1772
	tl	%icc,	0x5
	movneg	%icc,	%l1,	%g3
	fmovsvs	%xcc,	%f19,	%f13
loop_1772:
	movne	%icc,	%l6,	%o3
	add	%l2,	0x1872,	%o7
	edge32n	%i4,	%i6,	%g1
	membar	0x31
	bleu,a,pn	%xcc,	loop_1773
	movn	%xcc,	%g7,	%g2
	stx	%l0,	[%l7 + 0x48]
	fmovrslez	%i7,	%f5,	%f16
loop_1773:
	fbug,a	%fcc3,	loop_1774
	addc	%g6,	0x1E1B,	%i3
	nop
	setx loop_1775, %l0, %l1
	jmpl %l1, %o5
	edge32	%i2,	%o6,	%g5
loop_1774:
	fmul8sux16	%f18,	%f10,	%f10
	bshuffle	%f26,	%f20,	%f18
loop_1775:
	array16	%i0,	%o0,	%l4
	subcc	%o2,	%o1,	%i1
	taddcc	%g4,	%l5,	%l3
	wr	%g0,	0xea,	%asi
	stba	%i5,	[%l7 + 0x0F] %asi
	membar	#Sync
	taddcc	%o4,	0x1202,	%l1
	fbn,a	%fcc2,	loop_1776
	brlez	%g3,	loop_1777
	movrgz	%l6,	0x117,	%l2
	add	%o3,	0x1A75,	%i4
loop_1776:
	bge,a,pn	%icc,	loop_1778
loop_1777:
	xorcc	%o7,	%i6,	%g7
	mulx	%g2,	%g1,	%i7
	movge	%icc,	%l0,	%i3
loop_1778:
	fcmpgt16	%f8,	%f8,	%o5
	or	%i2,	%g6,	%g5
	tne	%xcc,	0x3
	and	%o6,	%o0,	%l4
	stx	%o2,	[%l7 + 0x48]
	fmovdn	%icc,	%f9,	%f19
	movrlez	%i0,	0x0B6,	%o1
	fbg	%fcc1,	loop_1779
	flush	%l7 + 0x48
	srax	%g4,	0x06,	%i1
	alignaddrl	%l5,	%l3,	%o4
loop_1779:
	fbuge	%fcc3,	loop_1780
	fornot1	%f8,	%f28,	%f0
	andncc	%l1,	%g3,	%i5
	wr	%g0,	0x89,	%asi
	stxa	%l6,	[%l7 + 0x28] %asi
loop_1780:
	lduh	[%l7 + 0x1A],	%o3
	mova	%xcc,	%l2,	%i4
	tsubcc	%i6,	0x1A65,	%o7
	movvs	%icc,	%g7,	%g2
	movpos	%xcc,	%g1,	%l0
	mova	%icc,	%i3,	%o5
	wr	%g0,	0x50,	%asi
	ldxa	[%g0 + 0x18] %asi,	%i2
	tleu	%xcc,	0x2
	movl	%icc,	%g6,	%i7
	ldx	[%l7 + 0x30],	%o6
	lduh	[%l7 + 0x14],	%g5
	tpos	%icc,	0x6
	sra	%o0,	0x0D,	%o2
	tge	%icc,	0x2
	or	%l4,	0x1C43,	%i0
	fandnot1s	%f7,	%f9,	%f9
	srl	%g4,	0x1C,	%o1
	tcc	%xcc,	0x4
	fnor	%f20,	%f18,	%f22
	fbo,a	%fcc3,	loop_1781
	fmovsleu	%xcc,	%f31,	%f14
	movrgz	%i1,	%l3,	%l5
	tleu	%icc,	0x3
loop_1781:
	edge8ln	%l1,	%o4,	%i5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tn	%icc,	0x6
	brgz,a	%g3,	loop_1782
	tsubcctv	%l6,	%l2,	%i4
	movrgez	%i6,	0x2B5,	%o3
	fandnot2	%f24,	%f26,	%f22
loop_1782:
	fbl,a	%fcc2,	loop_1783
	movn	%xcc,	%g7,	%g2
	tleu	%icc,	0x4
	xnorcc	%g1,	%l0,	%i3
loop_1783:
	fbo	%fcc1,	loop_1784
	movgu	%icc,	%o7,	%i2
	move	%icc,	%o5,	%g6
	xor	%o6,	%g5,	%i7
loop_1784:
	fmovrslz	%o0,	%f19,	%f17
	fpackfix	%f24,	%f19
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xorcc	%o2,	0x03DD,	%i0
	ldsb	[%l7 + 0x44],	%g4
	popc	%o1,	%i1
	bge,a	%icc,	loop_1785
	brgez,a	%l4,	loop_1786
	alignaddr	%l3,	%l5,	%o4
	addccc	%i5,	0x192D,	%l1
loop_1785:
	array8	%g3,	%l6,	%l2
loop_1786:
	brgez,a	%i4,	loop_1787
	mova	%icc,	%o3,	%i6
	tpos	%icc,	0x3
	movrgz	%g2,	%g7,	%l0
loop_1787:
	fbn,a	%fcc2,	loop_1788
	fbu	%fcc1,	loop_1789
	fors	%f11,	%f31,	%f17
	set	0x110, %l0
	stxa	%i3,	[%g0 + %l0] 0x21
loop_1788:
	movne	%icc,	%o7,	%i2
loop_1789:
	ble,pt	%xcc,	loop_1790
	fmovdg	%icc,	%f22,	%f25
	subcc	%g1,	0x1981,	%o5
	nop
	set	0x18, %i6
	std	%f28,	[%l7 + %i6]
loop_1790:
	fcmpne16	%f30,	%f28,	%o6
	subc	%g5,	0x1F12,	%g6
	edge16ln	%o0,	%o2,	%i0
	edge32ln	%g4,	%o1,	%i7
	edge16n	%l4,	%i1,	%l3
	sethi	0x07B0,	%o4
	srax	%l5,	%l1,	%i5
	set	0x61, %g4
	stba	%g3,	[%l7 + %g4] 0x88
	fbe	%fcc3,	loop_1791
	brlz,a	%l6,	loop_1792
	addc	%i4,	0x1D48,	%l2
	fble,a	%fcc1,	loop_1793
loop_1791:
	membar	0x43
loop_1792:
	tpos	%xcc,	0x1
	orcc	%i6,	0x0ED8,	%g2
loop_1793:
	fmovsn	%icc,	%f15,	%f23
	tn	%xcc,	0x2
	sethi	0x1E3B,	%o3
	srl	%l0,	0x1B,	%g7
	smul	%o7,	0x0033,	%i3
	brz	%g1,	loop_1794
	fmovdvc	%icc,	%f1,	%f28
	movvc	%icc,	%i2,	%o6
	udiv	%g5,	0x0316,	%g6
loop_1794:
	taddcc	%o5,	%o0,	%i0
	tle	%icc,	0x6
	tle	%icc,	0x1
	edge32ln	%g4,	%o2,	%i7
	edge32l	%l4,	%i1,	%o1
	fandnot2s	%f13,	%f9,	%f31
	movrgz	%l3,	%l5,	%o4
	movrgz	%i5,	0x076,	%l1
	fandnot1s	%f4,	%f21,	%f0
	udivx	%g3,	0x1D59,	%l6
	srl	%l2,	0x05,	%i6
	edge8	%i4,	%o3,	%g2
	orn	%g7,	%o7,	%i3
	movne	%xcc,	%g1,	%i2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnot2	%f16,	%f8
	fbg,a	%fcc2,	loop_1795
	popc	0x1271,	%o6
	taddcctv	%l0,	0x0D79,	%g5
	popc	%o5,	%g6
loop_1795:
	movvs	%icc,	%i0,	%g4
	udivcc	%o0,	0x0D18,	%o2
	tle	%xcc,	0x0
	fbule	%fcc2,	loop_1796
	tgu	%xcc,	0x6
	set	0x0C, %g1
	lduba	[%l7 + %g1] 0x04,	%i7
loop_1796:
	fnegd	%f6,	%f22
	srlx	%l4,	%i1,	%l3
	xorcc	%o1,	0x1B38,	%o4
	fnands	%f3,	%f17,	%f30
	fpsub32	%f16,	%f10,	%f14
	umul	%l5,	%l1,	%g3
	fornot2s	%f12,	%f9,	%f25
	fmovdvs	%icc,	%f24,	%f6
	movg	%xcc,	%i5,	%l6
	fors	%f17,	%f11,	%f27
	addc	%l2,	0x0E41,	%i4
	fbne	%fcc3,	loop_1797
	taddcctv	%o3,	%i6,	%g7
	movvs	%icc,	%o7,	%g2
	subc	%i3,	0x1420,	%i2
loop_1797:
	edge16ln	%g1,	%o6,	%l0
	fmovdleu	%xcc,	%f1,	%f31
	bn,a	loop_1798
	sra	%o5,	%g5,	%i0
	fnand	%f28,	%f24,	%f12
	bneg,a,pt	%xcc,	loop_1799
loop_1798:
	tn	%icc,	0x3
	subc	%g6,	0x1193,	%o0
	udivcc	%g4,	0x0633,	%i7
loop_1799:
	bgu,a	loop_1800
	pdist	%f2,	%f2,	%f0
	popc	0x0674,	%o2
	edge16l	%l4,	%i1,	%l3
loop_1800:
	nop
	setx	loop_1801,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	sdivcc	%o1,	0x0E2D,	%l5
	srlx	%o4,	%g3,	%l1
	set	0x78, %o6
	stxa	%l6,	[%l7 + %o6] 0x89
loop_1801:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnot2	%f8,	%f14
	fabsd	%f14,	%f28
	fmovdneg	%icc,	%f29,	%f18
	sdivcc	%i5,	0x1D80,	%l2
	subcc	%i4,	0x0BF9,	%o3
	fmovs	%f17,	%f24
	add	%l7,	0x3C,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%i6
	casa	[%l6] 0x88,	%i6,	%g7
	ba	%icc,	loop_1802
	movrgz	%g2,	0x2D9,	%o7
	edge8ln	%i3,	%i2,	%g1
	sethi	0x1178,	%l0
loop_1802:
	movg	%xcc,	%o6,	%o5
	smulcc	%i0,	%g6,	%o0
	movpos	%xcc,	%g4,	%i7
	movg	%xcc,	%o2,	%g5
	fornot1	%f16,	%f4,	%f18
	sth	%i1,	[%l7 + 0x68]
	movl	%icc,	%l3,	%l4
	tpos	%xcc,	0x7
	movrgez	%l5,	%o1,	%g3
	bpos,a,pt	%icc,	loop_1803
	alignaddr	%l1,	%l6,	%o4
	fabss	%f13,	%f26
	tpos	%xcc,	0x1
loop_1803:
	fcmpgt16	%f26,	%f8,	%i5
	addc	%i4,	0x02BF,	%l2
	fba,a	%fcc0,	loop_1804
	movn	%icc,	%o3,	%i6
	fornot2	%f6,	%f18,	%f16
	edge16n	%g2,	%g7,	%o7
loop_1804:
	fornot1	%f0,	%f30,	%f18
	fornot1	%f10,	%f20,	%f4
	movcs	%icc,	%i2,	%g1
	fmovsl	%xcc,	%f9,	%f28
	sdiv	%i3,	0x1A44,	%o6
	ldd	[%l7 + 0x10],	%l0
	movneg	%icc,	%i0,	%g6
	taddcctv	%o5,	0x1C30,	%g4
	mova	%icc,	%i7,	%o0
	edge8	%g5,	%o2,	%i1
	edge32ln	%l4,	%l5,	%l3
	nop
	set	0x60, %l4
	stx	%g3,	[%l7 + %l4]
	fbug,a	%fcc1,	loop_1805
	mulx	%o1,	0x17B0,	%l6
	sth	%l1,	[%l7 + 0x6C]
	brz	%o4,	loop_1806
loop_1805:
	nop
	set	0x2A, %i5
	ldsh	[%l7 + %i5],	%i4
	movne	%xcc,	%i5,	%o3
	movcc	%icc,	%l2,	%g2
loop_1806:
	fcmpd	%fcc1,	%f24,	%f2
	srlx	%i6,	0x04,	%o7
	addc	%i2,	0x100C,	%g1
	fandnot1s	%f9,	%f13,	%f9
	fpsub32s	%f31,	%f31,	%f25
	flush	%l7 + 0x7C
	movrgz	%i3,	%g7,	%o6
	fexpand	%f22,	%f0
	movn	%xcc,	%l0,	%i0
	tvs	%icc,	0x6
	subcc	%g6,	%g4,	%o5
	movgu	%icc,	%i7,	%g5
	movgu	%xcc,	%o2,	%i1
	set	0x10, %l5
	ldxa	[%g0 + %l5] 0x4f,	%l4
	tneg	%icc,	0x3
	sethi	0x06D5,	%o0
	fsrc1	%f10,	%f16
	array16	%l3,	%l5,	%o1
	fmovrsne	%l6,	%f3,	%f10
	movcc	%icc,	%l1,	%o4
	edge32ln	%i4,	%i5,	%g3
	array8	%o3,	%l2,	%g2
	subccc	%i6,	0x1126,	%o7
	movrgz	%i2,	0x28D,	%i3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdg	%icc,	%f31,	%f19
	fandnot2	%f20,	%f26,	%f24
	fpack32	%f18,	%f4,	%f16
	edge16	%g1,	%o6,	%l0
	udivcc	%g7,	0x0FCE,	%g6
	flush	%l7 + 0x10
	xnorcc	%i0,	%o5,	%i7
	taddcctv	%g4,	0x0BBC,	%g5
	fmovdne	%xcc,	%f25,	%f29
	fcmpne32	%f6,	%f30,	%o2
	sdivx	%l4,	0x1D6D,	%i1
	edge16n	%o0,	%l3,	%l5
	fornot1s	%f12,	%f12,	%f9
	mova	%xcc,	%o1,	%l6
	fcmple16	%f30,	%f12,	%o4
	bl	%icc,	loop_1807
	sra	%l1,	%i4,	%g3
	fmovsa	%icc,	%f23,	%f0
	move	%icc,	%i5,	%l2
loop_1807:
	smulcc	%o3,	0x018F,	%g2
	bleu,a,pn	%xcc,	loop_1808
	fnot2	%f12,	%f26
	edge8l	%i6,	%i2,	%i3
	udivx	%g1,	0x0586,	%o6
loop_1808:
	edge32l	%o7,	%g7,	%l0
	edge8	%i0,	%o5,	%i7
	tle	%icc,	0x4
	sdivcc	%g4,	0x1471,	%g5
	edge8	%o2,	%g6,	%l4
	wr	%g0,	0x88,	%asi
	ldsba	[%l7 + 0x12] %asi,	%i1
	fmovsne	%xcc,	%f29,	%f15
	fmovsvs	%icc,	%f0,	%f5
	movge	%icc,	%o0,	%l5
	fornot2	%f12,	%f22,	%f16
	set	0x70, %o0
	lduha	[%l7 + %o0] 0x19,	%l3
	fmovrslez	%o1,	%f12,	%f31
	fmul8x16au	%f27,	%f14,	%f24
	movleu	%xcc,	%o4,	%l1
	taddcctv	%l6,	0x18D6,	%g3
	movle	%xcc,	%i4,	%i5
	tpos	%icc,	0x3
	movrne	%l2,	%o3,	%i6
	xnor	%g2,	%i3,	%i2
	mova	%icc,	%g1,	%o7
	fpadd16s	%f7,	%f16,	%f21
	fblg	%fcc1,	loop_1809
	movrgez	%g7,	%l0,	%i0
	sth	%o6,	[%l7 + 0x1E]
	tleu	%xcc,	0x5
loop_1809:
	movrgz	%i7,	0x100,	%g4
	sll	%o5,	0x1B,	%g5
	udiv	%g6,	0x1021,	%o2
	ldstub	[%l7 + 0x24],	%l4
	ld	[%l7 + 0x20],	%f11
	brgez	%i1,	loop_1810
	bgu,a,pt	%icc,	loop_1811
	udiv	%l5,	0x16CA,	%l3
	mulscc	%o0,	%o1,	%o4
loop_1810:
	udiv	%l1,	0x066D,	%l6
loop_1811:
	edge32	%g3,	%i5,	%l2
	stbar
	sub	%i4,	%o3,	%g2
	smulcc	%i3,	%i6,	%g1
	xnor	%i2,	%g7,	%o7
	movne	%icc,	%i0,	%o6
	brgz	%i7,	loop_1812
	bgu,a	%xcc,	loop_1813
	fandnot1s	%f29,	%f30,	%f15
	fbul	%fcc2,	loop_1814
loop_1812:
	nop
	setx	loop_1815,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_1813:
	fmovda	%icc,	%f22,	%f2
	edge16	%l0,	%o5,	%g5
loop_1814:
	mova	%xcc,	%g4,	%g6
loop_1815:
	srax	%o2,	0x08,	%l4
	movrgez	%i1,	%l3,	%o0
	movgu	%xcc,	%l5,	%o1
	edge8	%l1,	%o4,	%g3
	movrgez	%i5,	0x285,	%l6
	ble,a,pt	%icc,	loop_1816
	nop
	setx	loop_1817,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	popc	%l2,	%i4
	srl	%o3,	0x1A,	%i3
loop_1816:
	fmovdleu	%icc,	%f21,	%f8
loop_1817:
	sllx	%g2,	0x17,	%g1
	fbug	%fcc0,	loop_1818
	array16	%i2,	%g7,	%o7
	tvs	%icc,	0x2
	stb	%i6,	[%l7 + 0x7D]
loop_1818:
	nop
	set	0x26, %i7
	ldsha	[%l7 + %i7] 0x81,	%o6
	sub	%i7,	%l0,	%i0
	fba,a	%fcc1,	loop_1819
	movle	%icc,	%o5,	%g5
	alignaddr	%g4,	%g6,	%o2
	popc	%i1,	%l4
loop_1819:
	movl	%icc,	%o0,	%l5
	brlez	%l3,	loop_1820
	mulscc	%l1,	%o4,	%o1
	array16	%g3,	%l6,	%i5
	set	0x30, %o7
	stxa	%l2,	[%g0 + %o7] 0x20
loop_1820:
	tge	%xcc,	0x2
	bg,a	%xcc,	loop_1821
	taddcctv	%o3,	%i4,	%g2
	subc	%i3,	0x191C,	%g1
	bcs	loop_1822
loop_1821:
	ldx	[%l7 + 0x20],	%i2
	edge32n	%o7,	%g7,	%o6
	tpos	%xcc,	0x5
loop_1822:
	and	%i7,	%l0,	%i0
	ldsh	[%l7 + 0x32],	%i6
	fpack32	%f26,	%f26,	%f0
	fmovsle	%icc,	%f10,	%f13
	movre	%o5,	0x1EA,	%g5
	lduw	[%l7 + 0x68],	%g4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xor	%g6,	%i1,	%o2
	fsrc2	%f30,	%f26
	fmovdcc	%icc,	%f22,	%f7
	fcmpgt16	%f4,	%f20,	%l4
	xorcc	%l5,	0x16E9,	%o0
	movre	%l1,	0x29B,	%o4
	movrlz	%o1,	0x3FE,	%l3
	sll	%g3,	0x0D,	%i5
	pdist	%f20,	%f20,	%f22
	ldd	[%l7 + 0x20],	%f0
	be	%xcc,	loop_1823
	udiv	%l2,	0x081E,	%l6
	srax	%o3,	%g2,	%i4
	array16	%i3,	%g1,	%i2
loop_1823:
	sdiv	%o7,	0x10C5,	%o6
	sdivx	%i7,	0x1CCA,	%l0
	fxors	%f6,	%f1,	%f2
	tvc	%xcc,	0x3
	array32	%g7,	%i0,	%o5
	fpack32	%f12,	%f28,	%f6
	fnot1	%f8,	%f20
	movre	%i6,	0x0AA,	%g5
	fmovrse	%g4,	%f26,	%f2
	edge8	%i1,	%o2,	%l4
	ldub	[%l7 + 0x14],	%g6
	tneg	%icc,	0x3
	fmovrdlz	%o0,	%f2,	%f6
	orcc	%l1,	0x0D31,	%l5
	or	%o4,	%l3,	%o1
	movrlz	%i5,	%l2,	%l6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tleu	%xcc,	0x2
	movrgz	%o3,	%g2,	%g3
	umul	%i3,	0x1EB4,	%g1
	mova	%icc,	%i2,	%i4
	call	loop_1824
	srl	%o6,	%o7,	%l0
	sdivcc	%g7,	0x0F8B,	%i0
	movle	%icc,	%o5,	%i7
loop_1824:
	fmovdn	%icc,	%f26,	%f4
	array16	%i6,	%g5,	%i1
	fpmerge	%f29,	%f25,	%f24
	fpadd32s	%f10,	%f17,	%f19
	sll	%o2,	0x09,	%l4
	and	%g4,	0x1399,	%g6
	tn	%xcc,	0x0
	fmovdvs	%icc,	%f27,	%f3
	fmovsge	%xcc,	%f24,	%f8
	movvs	%xcc,	%o0,	%l1
	set	0x40, %i4
	lda	[%l7 + %i4] 0x0c,	%f9
	movrne	%o4,	0x27F,	%l5
	edge32n	%o1,	%l3,	%l2
	udivx	%l6,	0x0BCF,	%i5
	fbue,a	%fcc2,	loop_1825
	move	%icc,	%g2,	%g3
	fnands	%f20,	%f17,	%f28
	movgu	%icc,	%o3,	%g1
loop_1825:
	nop
	set	0x0E, %l6
	ldstuba	[%l7 + %l6] 0x89,	%i3
	movleu	%icc,	%i4,	%i2
	movpos	%xcc,	%o6,	%l0
	ldstub	[%l7 + 0x64],	%g7
	ldub	[%l7 + 0x30],	%o7
	fmovsn	%icc,	%f16,	%f18
	fmovdleu	%xcc,	%f24,	%f5
	fandnot2	%f28,	%f26,	%f6
	fbuge	%fcc0,	loop_1826
	tl	%xcc,	0x6
	nop
	set	0x23, %o4
	ldub	[%l7 + %o4],	%o5
	edge32ln	%i7,	%i0,	%i6
loop_1826:
	movrgz	%i1,	%g5,	%o2
	orncc	%l4,	0x1A34,	%g6
	umulcc	%g4,	%l1,	%o0
	fmovse	%icc,	%f10,	%f11
	add	%l5,	%o4,	%o1
	sdivx	%l3,	0x1C5D,	%l6
	bvc,pn	%xcc,	loop_1827
	tn	%icc,	0x3
	brgz	%i5,	loop_1828
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1827:
	nop
	wr	%g0,	0x19,	%asi
	prefetcha	[%l7 + 0x60] %asi,	 0x0
loop_1828:
	movge	%icc,	%g2,	%o3
	fbge	%fcc0,	loop_1829
	fmovdvs	%xcc,	%f10,	%f24
	wr	%g0,	0x89,	%asi
	ldstuba	[%l7 + 0x65] %asi,	%g3
loop_1829:
	bgu,a,pn	%xcc,	loop_1830
	edge16n	%g1,	%i3,	%i4
	movneg	%xcc,	%i2,	%l0
	wr	%g0,	0x81,	%asi
	lduwa	[%l7 + 0x70] %asi,	%g7
loop_1830:
	fmovdge	%icc,	%f21,	%f9
	tne	%xcc,	0x4
	fbug,a	%fcc3,	loop_1831
	fmovse	%icc,	%f29,	%f31
	flush	%l7 + 0x30
	fcmpne32	%f12,	%f30,	%o7
loop_1831:
	membar	0x33
	addc	%o5,	%i7,	%o6
	movrlez	%i6,	0x3AF,	%i0
	bneg,a,pn	%xcc,	loop_1832
	array8	%g5,	%o2,	%l4
	brlez	%i1,	loop_1833
	addcc	%g6,	0x08E5,	%l1
loop_1832:
	tneg	%icc,	0x6
	xorcc	%g4,	%o0,	%l5
loop_1833:
	ta	%xcc,	0x7
	tpos	%icc,	0x5
	tgu	%icc,	0x7
	subc	%o1,	0x07AA,	%l3
	add	%l7,	0x78,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] %asi,	%l6,	%o4
	fmovrdgz	%i5,	%f14,	%f28
	add	%l7,	0x74,	%l6
	wr	%g0,	0x04,	%asi
	casa	[%l6] %asi,	%l2,	%g2
	movrgz	%o3,	%g1,	%i3
	taddcc	%i4,	0x0700,	%g3
	tne	%xcc,	0x7
	addcc	%i2,	%l0,	%o7
	movrgz	%g7,	%i7,	%o5
	andncc	%o6,	%i6,	%i0
	brz	%o2,	loop_1834
	edge32l	%l4,	%g5,	%g6
	fmovdgu	%icc,	%f19,	%f17
	tsubcc	%i1,	%l1,	%o0
loop_1834:
	movg	%icc,	%l5,	%o1
	fornot2s	%f1,	%f26,	%f10
	udiv	%l3,	0x1149,	%l6
	tsubcc	%o4,	0x09F8,	%i5
	movre	%g4,	%l2,	%o3
	sethi	0x1DA0,	%g1
	fpadd32	%f10,	%f12,	%f28
	fbne,a	%fcc2,	loop_1835
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
	orncc	%g2,	%i4,	%i3
	fmovdvs	%xcc,	%f27,	%f16
loop_1835:
	movneg	%xcc,	%g3,	%l0
loop_1836:
	movrlz	%o7,	0x29E,	%i2
	be,a	%xcc,	loop_1837
	ldsw	[%l7 + 0x2C],	%g7
	fandnot1	%f14,	%f14,	%f22
	membar	0x03
loop_1837:
	edge32	%i7,	%o6,	%o5
	fmovrdlz	%i6,	%f14,	%f28
	fnot1s	%f17,	%f10
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdpos	%icc,	%f23,	%f21
	movgu	%xcc,	%o2,	%i0
	movpos	%icc,	%l4,	%g5
	fmul8ulx16	%f2,	%f8,	%f12
	fnor	%f30,	%f8,	%f20
	movvc	%icc,	%i1,	%g6
	add	%l7,	0x70,	%l6
	wr	%g0,	0x19,	%asi
	casa	[%l6] 0x19,	%l1,	%o0
	movg	%xcc,	%o1,	%l5
	movvc	%xcc,	%l6,	%l3
	edge16l	%o4,	%i5,	%l2
	fbn	%fcc2,	loop_1838
	tsubcc	%o3,	%g1,	%g4
	movrlez	%i4,	0x06A,	%i3
	te	%xcc,	0x5
loop_1838:
	fbuge,a	%fcc2,	loop_1839
	movrgez	%g3,	%g2,	%l0
	bcs	%icc,	loop_1840
	be	%xcc,	loop_1841
loop_1839:
	srlx	%i2,	0x08,	%g7
	mulx	%o7,	0x1EC5,	%o6
loop_1840:
	fmul8x16au	%f6,	%f24,	%f30
loop_1841:
	fones	%f22
	std	%i6,	[%l7 + 0x40]
	bn,a,pn	%icc,	loop_1842
	fsrc2s	%f30,	%f7
	sethi	0x0F05,	%i6
	fmovdvc	%icc,	%f2,	%f1
loop_1842:
	movrlez	%o5,	%o2,	%i0
	movn	%xcc,	%l4,	%g5
	popc	%g6,	%i1
	fmuld8ulx16	%f17,	%f29,	%f0
	fbule	%fcc3,	loop_1843
	xorcc	%l1,	0x10C1,	%o0
	array32	%o1,	%l5,	%l3
	tsubcc	%o4,	%l6,	%l2
loop_1843:
	orncc	%o3,	%i5,	%g1
	ble	%xcc,	loop_1844
	array8	%i4,	%i3,	%g3
	edge8n	%g2,	%l0,	%g4
	edge8l	%g7,	%i2,	%o6
loop_1844:
	membar	0x6B
	tpos	%icc,	0x5
	fsrc2	%f26,	%f30
	tl	%xcc,	0x3
	orncc	%o7,	0x04ED,	%i6
	fbuge	%fcc2,	loop_1845
	xnor	%o5,	%i7,	%i0
	mova	%icc,	%o2,	%l4
	tl	%xcc,	0x2
loop_1845:
	brlez	%g6,	loop_1846
	fmovsne	%xcc,	%f30,	%f8
	orn	%i1,	0x1A35,	%l1
	wr	%g0,	0x19,	%asi
	ldsha	[%l7 + 0x3A] %asi,	%g5
loop_1846:
	nop
	wr	%g0,	0x89,	%asi
	stda	%o0,	[%l7 + 0x28] %asi
	tcc	%icc,	0x0
	edge8n	%l5,	%o1,	%l3
	fmul8x16	%f12,	%f0,	%f26
	edge32ln	%l6,	%l2,	%o3
	tvc	%icc,	0x1
	srl	%o4,	%g1,	%i5
	sra	%i4,	0x19,	%i3
	fmovdpos	%icc,	%f17,	%f6
	edge32ln	%g2,	%l0,	%g4
	fblg	%fcc0,	loop_1847
	edge32l	%g3,	%i2,	%g7
	bshuffle	%f2,	%f14,	%f24
	set	0x67, %o5
	ldsba	[%l7 + %o5] 0x04,	%o7
loop_1847:
	fsrc1s	%f3,	%f22
	edge16n	%i6,	%o5,	%o6
	xnor	%i0,	%o2,	%l4
	alignaddr	%i7,	%i1,	%l1
	ldsh	[%l7 + 0x7E],	%g5
	fpsub32	%f24,	%f28,	%f4
	fand	%f16,	%f28,	%f16
	ldstub	[%l7 + 0x16],	%g6
	bshuffle	%f30,	%f6,	%f14
	xorcc	%l5,	%o0,	%l3
	edge16	%o1,	%l6,	%l2
	be,a,pt	%xcc,	loop_1848
	fmul8x16	%f1,	%f6,	%f22
	bleu	%icc,	loop_1849
	umulcc	%o3,	%g1,	%i5
loop_1848:
	nop
	set	0x08, %g5
	swapa	[%l7 + %g5] 0x10,	%i4
loop_1849:
	array8	%i3,	%g2,	%l0
	fsrc2s	%f15,	%f3
	movl	%icc,	%o4,	%g4
	fba	%fcc3,	loop_1850
	bvc,pt	%icc,	loop_1851
	pdist	%f18,	%f18,	%f8
	ldsw	[%l7 + 0x74],	%i2
loop_1850:
	edge8ln	%g7,	%o7,	%g3
loop_1851:
	fsrc1	%f16,	%f4
	edge16	%o5,	%o6,	%i6
	ba	%xcc,	loop_1852
	fbuge,a	%fcc0,	loop_1853
	movg	%icc,	%o2,	%l4
	fmul8sux16	%f4,	%f2,	%f10
loop_1852:
	ta	%icc,	0x6
loop_1853:
	edge8n	%i7,	%i0,	%l1
	array32	%g5,	%i1,	%l5
	addcc	%o0,	%l3,	%g6
	tn	%icc,	0x3
	fcmpgt16	%f10,	%f28,	%o1
	add	%l7,	0x28,	%l6
	wr	%g0,	0x11,	%asi
	casxa	[%l6] %asi,	%l6,	%o3
	brgz	%l2,	loop_1854
	fcmpes	%fcc1,	%f30,	%f9
	movre	%i5,	%g1,	%i3
	fcmpne32	%f16,	%f24,	%i4
loop_1854:
	fmovdn	%xcc,	%f14,	%f15
	movre	%g2,	%l0,	%g4
	set	0x40, %i3
	stda	%f16,	[%l7 + %i3] 0xf0
	membar	#Sync
	mova	%xcc,	%o4,	%g7
	add	%l7,	0x20,	%l6
	wr	%g0,	0x04,	%asi
	lda	[%l6] %asi,	%o7
	casa	[%l6] 0x04,	%o7,	%g3
	tgu	%icc,	0x4
	movrgz	%o5,	0x2A8,	%o6
	fmovsneg	%icc,	%f30,	%f4
	fpadd16	%f10,	%f26,	%f4
	sdivx	%i2,	0x120C,	%i6
	bshuffle	%f16,	%f22,	%f20
	brgez	%o2,	loop_1855
	movrlez	%l4,	0x134,	%i7
	ble	%icc,	loop_1856
	fbo	%fcc1,	loop_1857
loop_1855:
	fmovsl	%xcc,	%f16,	%f31
	xnorcc	%l1,	%i0,	%i1
loop_1856:
	fmovrdne	%g5,	%f30,	%f8
loop_1857:
	bg,a	%icc,	loop_1858
	addc	%l5,	%l3,	%o0
	smulcc	%o1,	%g6,	%l6
	edge32l	%l2,	%i5,	%g1
loop_1858:
	movrgez	%i3,	0x091,	%i4
	stw	%g2,	[%l7 + 0x14]
	fmovdneg	%icc,	%f27,	%f24
	fba	%fcc3,	loop_1859
	addccc	%l0,	%g4,	%o3
	add	%l7,	0x30,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] %asi,	%g7,	%o7
loop_1859:
	nop
	set	0x30, %g6
	stxa	%g3,	[%l7 + %g6] 0x88
	movneg	%xcc,	%o4,	%o5
	fbul	%fcc2,	loop_1860
	addc	%o6,	%i2,	%i6
	fone	%f20
	smul	%o2,	0x00E6,	%l4
loop_1860:
	taddcctv	%l1,	%i0,	%i1
	sth	%i7,	[%l7 + 0x58]
	movpos	%icc,	%l5,	%l3
	sub	%o0,	0x1210,	%o1
	be,pt	%icc,	loop_1861
	ta	%xcc,	0x3
	udivcc	%g6,	0x0091,	%g5
	movrne	%l2,	%i5,	%g1
loop_1861:
	xor	%i3,	0x1CF7,	%l6
	fcmped	%fcc2,	%f4,	%f16
	movl	%xcc,	%g2,	%l0
	alignaddr	%g4,	%o3,	%g7
	set	0x30, %l1
	ldsha	[%l7 + %l1] 0x89,	%o7
	alignaddr	%i4,	%o4,	%o5
	subccc	%o6,	0x1065,	%g3
	brgz	%i2,	loop_1862
	or	%o2,	0x172E,	%i6
	edge32ln	%l1,	%i0,	%i1
	udivx	%i7,	0x1E7A,	%l4
loop_1862:
	move	%xcc,	%l5,	%l3
	sethi	0x0237,	%o1
	movrlz	%o0,	%g6,	%g5
	sir	0x0A73
	fmovrde	%i5,	%f24,	%f28
	tl	%xcc,	0x7
	tneg	%icc,	0x6
	edge32l	%l2,	%i3,	%l6
	movneg	%icc,	%g1,	%g2
	move	%xcc,	%g4,	%o3
	stw	%g7,	[%l7 + 0x7C]
	movleu	%icc,	%l0,	%i4
	movrne	%o7,	0x1AC,	%o5
	xorcc	%o6,	0x0A02,	%o4
	fbul,a	%fcc3,	loop_1863
	smul	%g3,	0x0D32,	%o2
	tn	%icc,	0x2
	fbuge	%fcc3,	loop_1864
loop_1863:
	andn	%i6,	0x123B,	%l1
	subcc	%i0,	%i1,	%i2
	sll	%i7,	%l5,	%l3
loop_1864:
	mulscc	%l4,	0x0BBC,	%o0
	mulx	%g6,	0x1A03,	%g5
	umul	%i5,	0x1735,	%l2
	bge,pt	%icc,	loop_1865
	edge16l	%i3,	%l6,	%o1
	and	%g2,	0x0A16,	%g1
	fnors	%f10,	%f1,	%f24
loop_1865:
	nop
	set	0x18, %o1
	swapa	[%l7 + %o1] 0x89,	%g4
	taddcctv	%g7,	%l0,	%i4
	tgu	%icc,	0x5
	bleu,pt	%icc,	loop_1866
	edge8n	%o3,	%o5,	%o6
	brgez,a	%o7,	loop_1867
	move	%icc,	%o4,	%g3
loop_1866:
	movcc	%icc,	%o2,	%l1
	andn	%i0,	%i6,	%i1
loop_1867:
	udiv	%i7,	0x0E16,	%i2
	fmovsa	%xcc,	%f23,	%f27
	movg	%icc,	%l5,	%l4
	movneg	%icc,	%l3,	%o0
	udivx	%g5,	0x0E51,	%g6
	movrlz	%l2,	0x2C3,	%i3
	brnz	%i5,	loop_1868
	sir	0x1125
	fnot1	%f26,	%f14
	fmovrse	%l6,	%f30,	%f28
loop_1868:
	brlz	%o1,	loop_1869
	movneg	%icc,	%g2,	%g1
	movrlz	%g7,	%g4,	%l0
	fbul	%fcc1,	loop_1870
loop_1869:
	fornot2s	%f18,	%f1,	%f31
	tne	%icc,	0x3
	orcc	%i4,	%o5,	%o6
loop_1870:
	fmovsg	%icc,	%f28,	%f5
	popc	%o7,	%o3
	sir	0x0323
	tpos	%icc,	0x7
	orncc	%o4,	%o2,	%l1
	fmovda	%xcc,	%f5,	%f16
	tl	%xcc,	0x4
	fbe	%fcc3,	loop_1871
	fbn,a	%fcc3,	loop_1872
	tvs	%icc,	0x7
	fnegs	%f12,	%f18
loop_1871:
	nop
	set	0x70, %i2
	stda	%g2,	[%l7 + %i2] 0x18
loop_1872:
	fmovdne	%icc,	%f31,	%f16
	ldstub	[%l7 + 0x3D],	%i0
	tvc	%xcc,	0x2
	xorcc	%i1,	0x158E,	%i6
	addcc	%i2,	0x114D,	%i7
	movrlz	%l4,	%l5,	%o0
	popc	0x059F,	%g5
	xnorcc	%l3,	%g6,	%i3
	brnz	%i5,	loop_1873
	sra	%l6,	%o1,	%g2
	bgu,a	%xcc,	loop_1874
	xnor	%l2,	0x1B2A,	%g1
loop_1873:
	movpos	%icc,	%g4,	%l0
	orn	%i4,	0x1FA5,	%g7
loop_1874:
	movne	%icc,	%o5,	%o7
	mova	%icc,	%o6,	%o3
	stx	%o4,	[%l7 + 0x28]
	udiv	%l1,	0x1E9B,	%g3
	fmovdg	%icc,	%f30,	%f7
	taddcctv	%i0,	%i1,	%o2
	fbl,a	%fcc2,	loop_1875
	fmuld8sux16	%f13,	%f23,	%f16
	edge8ln	%i6,	%i2,	%l4
	membar	#Sync
	set	0x40, %i0
	ldda	[%l7 + %i0] 0x1f,	%f16
loop_1875:
	taddcc	%l5,	%i7,	%g5
	fmovdgu	%xcc,	%f21,	%f11
	array32	%l3,	%g6,	%i3
	edge16l	%i5,	%o0,	%o1
	set	0x30, %g2
	ldda	[%l7 + %g2] 0x2e,	%i6
	fzero	%f2
	fnot1s	%f19,	%f26
	alignaddr	%l2,	%g2,	%g4
	fabsd	%f18,	%f16
	andncc	%l0,	%g1,	%i4
	orncc	%o5,	0x10EA,	%g7
	fzero	%f4
	umul	%o7,	%o6,	%o4
	movg	%icc,	%l1,	%g3
	tl	%xcc,	0x2
	tpos	%xcc,	0x5
	tn	%icc,	0x6
	edge16l	%i0,	%o3,	%o2
	movg	%icc,	%i1,	%i6
	fbue,a	%fcc2,	loop_1876
	edge8n	%i2,	%l5,	%i7
	stw	%l4,	[%l7 + 0x78]
	edge32l	%l3,	%g5,	%i3
loop_1876:
	fmovrdlz	%g6,	%f14,	%f20
	be,a,pt	%icc,	loop_1877
	tvc	%icc,	0x0
	tge	%xcc,	0x5
	ldub	[%l7 + 0x2A],	%o0
loop_1877:
	ldx	[%l7 + 0x28],	%i5
	fcmped	%fcc3,	%f24,	%f12
	tpos	%icc,	0x6
	fmuld8ulx16	%f16,	%f12,	%f30
	fmovsgu	%xcc,	%f6,	%f7
	xorcc	%l6,	0x0FE8,	%o1
	edge8	%l2,	%g2,	%g4
	movne	%xcc,	%g1,	%i4
	udivcc	%l0,	0x0E19,	%o5
	fbul,a	%fcc0,	loop_1878
	fcmple16	%f16,	%f26,	%g7
	ldd	[%l7 + 0x38],	%o6
	edge8ln	%o7,	%o4,	%g3
loop_1878:
	srax	%i0,	%o3,	%l1
	array32	%o2,	%i6,	%i1
	fzero	%f0
	movrgez	%l5,	%i2,	%i7
	fmovdg	%xcc,	%f12,	%f30
	popc	0x06F4,	%l4
	edge8ln	%g5,	%l3,	%i3
	movvs	%icc,	%o0,	%i5
	movneg	%xcc,	%g6,	%o1
	sllx	%l6,	%g2,	%l2
	movrgez	%g1,	%g4,	%i4
	fmovdneg	%icc,	%f13,	%f0
	nop
	setx loop_1879, %l0, %l1
	jmpl %l1, %l0
	edge32l	%o5,	%o6,	%o7
	movvc	%icc,	%g7,	%g3
	umulcc	%o4,	%i0,	%o3
loop_1879:
	fcmpgt16	%f2,	%f10,	%o2
	fcmpgt16	%f30,	%f2,	%i6
	movre	%l1,	0x33C,	%i1
	movcc	%icc,	%l5,	%i7
	brz	%l4,	loop_1880
	movrne	%i2,	0x114,	%l3
	ldx	[%l7 + 0x58],	%i3
	andcc	%g5,	%o0,	%i5
loop_1880:
	movrlz	%o1,	%g6,	%l6
	tl	%xcc,	0x2
	fzeros	%f9
	movrlez	%l2,	0x1C4,	%g2
	te	%icc,	0x4
	movrlz	%g1,	0x238,	%g4
	tpos	%icc,	0x6
	sra	%i4,	%o5,	%l0
	movne	%xcc,	%o7,	%o6
	fblg	%fcc0,	loop_1881
	fcmped	%fcc1,	%f6,	%f6
	fcmpes	%fcc0,	%f31,	%f2
	sethi	0x06FA,	%g7
loop_1881:
	udiv	%o4,	0x0662,	%i0
	umulcc	%g3,	%o3,	%i6
	orncc	%o2,	0x13B5,	%i1
	fmovdne	%icc,	%f25,	%f7
	tg	%xcc,	0x2
	umul	%l5,	0x064B,	%i7
	fxor	%f14,	%f30,	%f24
	umulcc	%l4,	%l1,	%l3
	udiv	%i3,	0x00A4,	%i2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array32	%o0,	%i5,	%o1
	set	0x34, %g7
	lduwa	[%l7 + %g7] 0x88,	%g5
	movrgez	%l6,	%l2,	%g2
	subcc	%g1,	0x0464,	%g4
	membar	0x5B
	fmovsl	%icc,	%f20,	%f4
	movrlez	%g6,	0x13A,	%i4
	edge8l	%o5,	%o7,	%o6
	array8	%g7,	%o4,	%l0
	std	%g2,	[%l7 + 0x60]
	stx	%i0,	[%l7 + 0x50]
	std	%i6,	[%l7 + 0x40]
	movre	%o3,	0x2F3,	%i1
	addccc	%o2,	0x0EDD,	%l5
	srl	%i7,	%l1,	%l4
	te	%xcc,	0x1
	popc	%l3,	%i3
	movvc	%xcc,	%o0,	%i5
	fcmple32	%f10,	%f8,	%i2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fsrc2	%f6,	%f18
	nop
	setx	loop_1882,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	edge8ln	%g5,	%l6,	%l2
	movvs	%icc,	%g2,	%g1
	xnor	%g4,	0x027A,	%o1
loop_1882:
	fcmple16	%f20,	%f28,	%g6
	sra	%o5,	%i4,	%o6
	tg	%xcc,	0x1
	for	%f8,	%f14,	%f26
	xorcc	%o7,	%o4,	%g7
	sllx	%g3,	0x1C,	%l0
	fnot2s	%f15,	%f16
	bpos	%xcc,	loop_1883
	tn	%icc,	0x1
	tleu	%icc,	0x5
	srl	%i6,	%o3,	%i0
loop_1883:
	edge32	%i1,	%o2,	%l5
	fxnor	%f14,	%f18,	%f28
	edge32n	%i7,	%l1,	%l3
	smul	%i3,	%o0,	%l4
	fmovrdlz	%i2,	%f24,	%f2
	te	%icc,	0x1
	fmovdl	%xcc,	%f5,	%f0
	sdiv	%i5,	0x16D5,	%l6
	tcs	%xcc,	0x0
	tgu	%icc,	0x2
	fmovscs	%xcc,	%f29,	%f8
	movn	%icc,	%g5,	%g2
	and	%g1,	0x068B,	%g4
	fbne	%fcc1,	loop_1884
	fmovsvc	%xcc,	%f0,	%f11
	stx	%o1,	[%l7 + 0x08]
	fors	%f9,	%f23,	%f5
loop_1884:
	brlez	%g6,	loop_1885
	fandnot1	%f20,	%f30,	%f20
	add	%l7,	0x2C,	%l6
	wr	%g0,	0x11,	%asi
	lda	[%l6] %asi,	%l2
	casa	[%l6] 0x11,	%l2,	%i4
loop_1885:
	fmovsvs	%icc,	%f22,	%f22
	addcc	%o5,	%o6,	%o4
	xorcc	%g7,	0x1949,	%g3
	movgu	%xcc,	%l0,	%o7
	movcs	%xcc,	%i6,	%o3
	fnegs	%f9,	%f7
	tgu	%xcc,	0x6
	wr	%g0,	0x89,	%asi
	lduha	[%l7 + 0x1C] %asi,	%i1
	fmovsle	%xcc,	%f17,	%f13
	orcc	%i0,	%o2,	%l5
	movrgz	%l1,	%l3,	%i3
	edge8n	%i7,	%l4,	%o0
	andncc	%i2,	%l6,	%g5
	te	%icc,	0x3
	movrgz	%i5,	0x2C2,	%g2
	fmovsvs	%icc,	%f13,	%f11
	tl	%xcc,	0x5
	set	0x2D, %i1
	ldsba	[%l7 + %i1] 0x04,	%g1
	tg	%icc,	0x7
	ldd	[%l7 + 0x58],	%g4
	umulcc	%o1,	0x01F1,	%g6
	movcc	%icc,	%i4,	%o5
	fmovdpos	%icc,	%f0,	%f6
	nop
	setx	loop_1886,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fbge	%fcc0,	loop_1887
	edge16n	%l2,	%o4,	%g7
	nop
	setx	loop_1888,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_1886:
	edge8l	%o6,	%g3,	%o7
loop_1887:
	tleu	%icc,	0x6
	sdivx	%l0,	0x0861,	%o3
loop_1888:
	srl	%i1,	%i0,	%o2
	bgu,a	%xcc,	loop_1889
	fbul,a	%fcc3,	loop_1890
	fors	%f0,	%f15,	%f26
	sra	%i6,	0x08,	%l1
loop_1889:
	move	%icc,	%l3,	%i3
loop_1890:
	fmul8ulx16	%f18,	%f16,	%f22
	fornot2s	%f17,	%f9,	%f8
	bgu,a,pn	%icc,	loop_1891
	movg	%icc,	%i7,	%l5
	nop
	setx loop_1892, %l0, %l1
	jmpl %l1, %o0
	subcc	%l4,	%l6,	%g5
loop_1891:
	edge8n	%i5,	%g2,	%g1
	movre	%i2,	%g4,	%o1
loop_1892:
	tneg	%xcc,	0x7
	taddcctv	%i4,	%g6,	%l2
	fbug,a	%fcc1,	loop_1893
	fone	%f6
	movrgz	%o4,	%g7,	%o5
	swap	[%l7 + 0x38],	%o6
loop_1893:
	fnegs	%f4,	%f5
	tcc	%xcc,	0x7
	fbule	%fcc0,	loop_1894
	addccc	%g3,	0x072F,	%l0
	edge16ln	%o3,	%o7,	%i1
	andcc	%o2,	%i0,	%i6
loop_1894:
	movre	%l1,	0x297,	%l3
	movleu	%icc,	%i7,	%i3
	fmovse	%icc,	%f3,	%f18
	movcc	%xcc,	%o0,	%l5
	nop
	setx	loop_1895,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	bleu,a	%xcc,	loop_1896
	addcc	%l6,	0x0DC2,	%l4
	and	%i5,	%g2,	%g5
loop_1895:
	fpadd16	%f14,	%f0,	%f12
loop_1896:
	move	%icc,	%i2,	%g1
	stbar
	tleu	%icc,	0x7
	ldd	[%l7 + 0x18],	%f6
	fpadd32s	%f7,	%f24,	%f15
	edge16ln	%g4,	%o1,	%i4
	fmovsn	%icc,	%f17,	%f0
	movl	%xcc,	%g6,	%l2
	taddcctv	%g7,	%o4,	%o5
	bvs,pn	%icc,	loop_1897
	fands	%f27,	%f23,	%f26
	mova	%icc,	%g3,	%o6
	brnz	%o3,	loop_1898
loop_1897:
	tn	%xcc,	0x4
	fba	%fcc2,	loop_1899
	add	%o7,	%l0,	%i1
loop_1898:
	sra	%i0,	0x1F,	%o2
	udivx	%l1,	0x128C,	%i6
loop_1899:
	tsubcctv	%l3,	%i3,	%i7
	fandnot1s	%f7,	%f3,	%f24
	sdivcc	%o0,	0x0AF1,	%l5
	tleu	%icc,	0x1
	ldsh	[%l7 + 0x0E],	%l4
	nop
	set	0x4C, %l3
	lduh	[%l7 + %l3],	%i5
	ldub	[%l7 + 0x5D],	%l6
	and	%g5,	%g2,	%i2
	faligndata	%f20,	%f22,	%f14
	bvs,pn	%icc,	loop_1900
	fcmpeq16	%f12,	%f28,	%g4
	bn,pt	%xcc,	loop_1901
	ba,pn	%icc,	loop_1902
loop_1900:
	mulx	%o1,	0x0F54,	%i4
	fmovrdgz	%g1,	%f20,	%f4
loop_1901:
	addc	%l2,	0x0A41,	%g7
loop_1902:
	tl	%icc,	0x7
	fxnors	%f19,	%f19,	%f18
	fbuge,a	%fcc2,	loop_1903
	srlx	%o4,	0x02,	%g6
	fcmpes	%fcc0,	%f19,	%f11
	sir	0x195F
loop_1903:
	movcc	%icc,	%g3,	%o6
	bl	loop_1904
	edge16n	%o5,	%o3,	%l0
	set	0x29, %l2
	stba	%o7,	[%l7 + %l2] 0x15
loop_1904:
	prefetch	[%l7 + 0x68],	 0x0
	nop
	set	0x60, %o3
	std	%i0,	[%l7 + %o3]
	xnor	%o2,	%i1,	%i6
	movle	%xcc,	%l3,	%l1
	add	%l7,	0x6C,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%i7
	casa	[%l6] %asi,	%i7,	%o0
	xnorcc	%i3,	%l5,	%i5
	udivx	%l4,	0x1F6C,	%l6
	ldstub	[%l7 + 0x54],	%g5
	fpack16	%f30,	%f2
	tneg	%xcc,	0x2
	wr	%g0,	0x22,	%asi
	stha	%i2,	[%l7 + 0x66] %asi
	membar	#Sync
	fpadd16s	%f11,	%f30,	%f22
	fbu	%fcc3,	loop_1905
	tneg	%xcc,	0x1
	movge	%xcc,	%g4,	%o1
	fpsub32s	%f5,	%f29,	%f17
loop_1905:
	andn	%g2,	%g1,	%i4
	fcmpgt32	%f0,	%f0,	%l2
	stw	%g7,	[%l7 + 0x0C]
	array32	%o4,	%g3,	%o6
	bvc,a,pn	%xcc,	loop_1906
	te	%xcc,	0x2
	tn	%icc,	0x6
	tleu	%xcc,	0x5
loop_1906:
	fbge,a	%fcc3,	loop_1907
	movrlez	%o5,	0x028,	%o3
	fmul8x16	%f1,	%f8,	%f18
	nop
	setx	loop_1908,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_1907:
	stx	%l0,	[%l7 + 0x20]
	fbl	%fcc2,	loop_1909
	faligndata	%f30,	%f8,	%f6
loop_1908:
	fandnot1	%f14,	%f0,	%f10
	orncc	%g6,	0x13F8,	%o7
loop_1909:
	fcmpne32	%f14,	%f8,	%o2
	edge8n	%i0,	%i6,	%i1
	alignaddrl	%l1,	%l3,	%i7
	smul	%o0,	0x0A7E,	%i3
	set	0x10, %o2
	ldswa	[%l7 + %o2] 0x04,	%l5
	wr	%g0,	0x10,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	stbar
	fmovrsgez	%l4,	%f30,	%f28
	addc	%i5,	%g5,	%l6
	movleu	%xcc,	%g4,	%o1
	sethi	0x1683,	%g2
	movrgez	%g1,	%i4,	%i2
	nop
	setx loop_1910, %l0, %l1
	jmpl %l1, %l2
	tneg	%icc,	0x3
	call	loop_1911
	alignaddr	%g7,	%o4,	%g3
loop_1910:
	edge32l	%o6,	%o3,	%l0
	fsrc2	%f6,	%f2
loop_1911:
	tvc	%xcc,	0x6
	tvs	%xcc,	0x4
	srax	%g6,	%o7,	%o5
	fcmps	%fcc1,	%f13,	%f17
	addccc	%i0,	0x0E6C,	%i6
	umul	%o2,	0x1F48,	%i1
	tne	%icc,	0x0
	sdivx	%l1,	0x0A8F,	%i7
	movvs	%icc,	%o0,	%i3
	bcc	%icc,	loop_1912
	fbn,a	%fcc3,	loop_1913
	taddcc	%l3,	%l4,	%l5
	sir	0x0B76
loop_1912:
	nop
	setx	loop_1914,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_1913:
	ld	[%l7 + 0x58],	%f5
	fmovdneg	%xcc,	%f31,	%f8
	sir	0x13EC
loop_1914:
	fbe	%fcc2,	loop_1915
	fmovdcc	%xcc,	%f13,	%f12
	movrlz	%i5,	%g5,	%g4
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x46] %asi,	%o1
loop_1915:
	and	%g2,	%l6,	%g1
	movvs	%xcc,	%i2,	%i4
	movneg	%xcc,	%g7,	%l2
	edge16ln	%o4,	%g3,	%o6
	taddcctv	%l0,	%o3,	%g6
	orncc	%o7,	0x0820,	%o5
	fmovdle	%xcc,	%f13,	%f29
	edge8n	%i6,	%o2,	%i0
	fbne	%fcc3,	loop_1916
	tneg	%xcc,	0x3
	subc	%l1,	0x0849,	%i1
	sllx	%o0,	0x1B,	%i3
loop_1916:
	bg	%xcc,	loop_1917
	lduw	[%l7 + 0x20],	%i7
	fbg	%fcc0,	loop_1918
	fmovdvc	%xcc,	%f6,	%f18
loop_1917:
	nop
	set	0x62, %g3
	lduha	[%l7 + %g3] 0x80,	%l4
loop_1918:
	edge16n	%l3,	%i5,	%l5
	andncc	%g5,	%g4,	%o1
	sir	0x0BA4
	ldub	[%l7 + 0x48],	%l6
	xorcc	%g1,	%g2,	%i4
	tge	%xcc,	0x2
	ldsw	[%l7 + 0x0C],	%i2
	fbg,a	%fcc3,	loop_1919
	movneg	%xcc,	%l2,	%g7
	array32	%g3,	%o6,	%l0
	tgu	%xcc,	0x4
loop_1919:
	bneg	loop_1920
	fmovrslz	%o4,	%f1,	%f8
	movpos	%xcc,	%g6,	%o7
	movpos	%icc,	%o3,	%o5
loop_1920:
	movre	%o2,	0x2BF,	%i6
	umul	%l1,	%i0,	%o0
	tneg	%icc,	0x0
	udivcc	%i3,	0x1EBC,	%i7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sll	%l4,	0x04,	%l3
	fnands	%f0,	%f24,	%f20
	stx	%i5,	[%l7 + 0x40]
	tleu	%xcc,	0x0
	srl	%i1,	%l5,	%g4
	bgu,a,pn	%xcc,	loop_1921
	andn	%g5,	%o1,	%g1
	tsubcc	%l6,	0x0AB2,	%i4
	umul	%g2,	0x0DB6,	%l2
loop_1921:
	subcc	%g7,	0x1B5B,	%i2
	umulcc	%g3,	0x100D,	%o6
	movre	%o4,	0x019,	%g6
	tvc	%icc,	0x2
	fsrc2	%f12,	%f30
	umulcc	%o7,	0x1CC4,	%o3
	ldx	[%l7 + 0x28],	%l0
	fmovdge	%xcc,	%f27,	%f19
	fmovrde	%o2,	%f16,	%f6
	wr	%g0,	0x04,	%asi
	lduwa	[%l7 + 0x6C] %asi,	%o5
	udiv	%i6,	0x0120,	%l1
	udiv	%i0,	0x143C,	%o0
	set	0x0, %l0
	stxa	%i3,	[%g0 + %l0] 0x20
	fmovspos	%xcc,	%f31,	%f23
	movpos	%xcc,	%i7,	%l4
	bvc,pt	%xcc,	loop_1922
	fpack32	%f14,	%f22,	%f8
	edge32ln	%l3,	%i1,	%i5
	tg	%icc,	0x3
loop_1922:
	lduw	[%l7 + 0x24],	%g4
	ta	%xcc,	0x6
	movvs	%icc,	%l5,	%o1
	tn	%xcc,	0x3
	bcc,pt	%xcc,	loop_1923
	xnorcc	%g1,	0x019D,	%g5
	array16	%l6,	%g2,	%i4
	tsubcctv	%l2,	0x1A53,	%g7
loop_1923:
	fmovdpos	%xcc,	%f24,	%f22
	popc	0x0C63,	%g3
	fmovdleu	%icc,	%f0,	%f23
	tcc	%icc,	0x4
	edge16l	%o6,	%o4,	%g6
	sethi	0x08DB,	%o7
	fpmerge	%f29,	%f18,	%f8
	edge16l	%i2,	%o3,	%o2
	tl	%xcc,	0x1
	movre	%o5,	0x1D9,	%i6
	fmovdvc	%icc,	%f21,	%f20
	fmovdge	%icc,	%f25,	%f25
	tsubcc	%l1,	0x11DC,	%i0
	alignaddrl	%l0,	%o0,	%i7
	fornot1s	%f27,	%f21,	%f20
	udivx	%i3,	0x0E8C,	%l3
	ba,pt	%xcc,	loop_1924
	fmovrsne	%l4,	%f6,	%f31
	fpsub32	%f0,	%f10,	%f2
	tpos	%icc,	0x1
loop_1924:
	fabss	%f27,	%f24
	movg	%xcc,	%i5,	%g4
	edge8ln	%l5,	%i1,	%g1
	movrlez	%g5,	%l6,	%o1
	set	0x40, %g4
	stda	%f0,	[%l7 + %g4] 0x17
	membar	#Sync
	fpsub16	%f14,	%f18,	%f2
	movre	%i4,	0x1DC,	%l2
	fand	%f18,	%f2,	%f22
	wr	%g0,	0x89,	%asi
	lda	[%l7 + 0x08] %asi,	%f26
	ldsb	[%l7 + 0x42],	%g7
	tne	%xcc,	0x6
	movl	%xcc,	%g3,	%g2
	fmovs	%f0,	%f26
	fsrc1	%f28,	%f16
	movn	%icc,	%o6,	%o4
	fbul	%fcc3,	loop_1925
	bne,a,pt	%xcc,	loop_1926
	fpsub16s	%f3,	%f17,	%f21
	fmovsge	%icc,	%f20,	%f4
loop_1925:
	sdivcc	%g6,	0x009B,	%o7
loop_1926:
	nop
	set	0x40, %i6
	ldda	[%l7 + %i6] 0x04,	%f0
	fmovrslz	%i2,	%f4,	%f20
	addccc	%o3,	%o5,	%o2
	movge	%icc,	%i6,	%i0
	tsubcc	%l1,	%l0,	%i7
	orn	%i3,	0x13AE,	%o0
	edge32	%l3,	%l4,	%i5
	brgz,a	%l5,	loop_1927
	std	%f30,	[%l7 + 0x68]
	fmovdgu	%icc,	%f15,	%f15
	set	0x28, %o6
	stda	%g4,	[%l7 + %o6] 0x0c
loop_1927:
	ba	loop_1928
	subcc	%g1,	%i1,	%g5
	movneg	%icc,	%l6,	%o1
	taddcctv	%l2,	0x15C7,	%i4
loop_1928:
	fmovdleu	%icc,	%f20,	%f7
	popc	%g7,	%g3
	movvs	%xcc,	%o6,	%g2
	fabss	%f22,	%f31
	ldsw	[%l7 + 0x20],	%g6
	fmuld8sux16	%f7,	%f30,	%f28
	subcc	%o4,	0x13D3,	%i2
	subc	%o3,	0x1680,	%o5
	bneg,a	%icc,	loop_1929
	movne	%xcc,	%o2,	%i6
	set	0x3C, %g1
	ldswa	[%l7 + %g1] 0x89,	%o7
loop_1929:
	fbo	%fcc3,	loop_1930
	membar	0x33
	tvs	%icc,	0x2
	movvc	%icc,	%i0,	%l0
loop_1930:
	add	%l1,	%i3,	%o0
	ta	%xcc,	0x2
	sdivx	%l3,	0x167F,	%i7
	sra	%l4,	0x1F,	%l5
	movne	%xcc,	%i5,	%g1
	membar	0x23
	umul	%g4,	0x05B8,	%g5
	tvs	%xcc,	0x7
	fpsub32	%f26,	%f22,	%f24
	movg	%xcc,	%i1,	%l6
	stbar
	edge32l	%o1,	%l2,	%g7
	fmul8sux16	%f16,	%f2,	%f26
	movcc	%xcc,	%i4,	%o6
	fbe,a	%fcc1,	loop_1931
	membar	0x15
	te	%xcc,	0x7
	fmovrsgz	%g2,	%f9,	%f8
loop_1931:
	fornot1s	%f22,	%f13,	%f23
	smulcc	%g6,	0x0263,	%g3
	sth	%i2,	[%l7 + 0x72]
	sra	%o4,	%o3,	%o5
	addccc	%i6,	%o2,	%o7
	fcmpeq32	%f28,	%f18,	%l0
	mulx	%l1,	0x1CCB,	%i0
	xnorcc	%i3,	%l3,	%i7
	fcmpne16	%f30,	%f16,	%l4
	subcc	%l5,	%i5,	%o0
	movrgez	%g4,	0x2CA,	%g5
	fzero	%f30
	membar	0x01
	tsubcctv	%i1,	0x1775,	%g1
	bn	loop_1932
	movrne	%l6,	0x295,	%l2
	ldx	[%l7 + 0x78],	%g7
	edge8n	%o1,	%o6,	%i4
loop_1932:
	brlz,a	%g6,	loop_1933
	ldd	[%l7 + 0x38],	%g2
	fbul	%fcc2,	loop_1934
	fmovsneg	%icc,	%f12,	%f10
loop_1933:
	fxnors	%f31,	%f10,	%f27
	sir	0x0628
loop_1934:
	ldub	[%l7 + 0x24],	%i2
	fmovdvc	%icc,	%f25,	%f3
	bleu	%xcc,	loop_1935
	fmovspos	%icc,	%f20,	%f25
	popc	%g2,	%o3
	edge16ln	%o4,	%o5,	%i6
loop_1935:
	nop
	set	0x78, %l4
	stda	%o6,	[%l7 + %l4] 0xeb
	membar	#Sync
	lduh	[%l7 + 0x3A],	%o2
	edge8ln	%l0,	%i0,	%i3
	fnot2	%f18,	%f8
	tg	%xcc,	0x7
	movl	%icc,	%l1,	%i7
	bge,a	loop_1936
	fmovd	%f4,	%f20
	addc	%l3,	0x1F75,	%l5
	movn	%xcc,	%l4,	%o0
loop_1936:
	ldsb	[%l7 + 0x6C],	%i5
	sir	0x027E
	nop
	set	0x10, %i5
	std	%f2,	[%l7 + %i5]
	array16	%g5,	%g4,	%g1
	fabsd	%f30,	%f4
	sethi	0x0F68,	%i1
	edge16n	%l2,	%l6,	%g7
	tg	%xcc,	0x2
	wr	%g0,	0x2a,	%asi
	stda	%o6,	[%l7 + 0x30] %asi
	membar	#Sync
	movge	%xcc,	%o1,	%g6
	brgz	%i4,	loop_1937
	movrlz	%i2,	0x3F8,	%g3
	andncc	%o3,	%o4,	%o5
	xnor	%g2,	0x0020,	%i6
loop_1937:
	subcc	%o7,	%o2,	%i0
	edge32	%l0,	%i3,	%l1
	be	loop_1938
	ta	%xcc,	0x7
	movn	%icc,	%i7,	%l3
	fcmpeq16	%f6,	%f18,	%l4
loop_1938:
	fcmpgt32	%f0,	%f28,	%o0
	fbu,a	%fcc2,	loop_1939
	sll	%i5,	0x1A,	%l5
	membar	0x14
	ta	%xcc,	0x5
loop_1939:
	te	%icc,	0x6
	membar	0x4A
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tg	%icc,	0x0
	edge32ln	%g5,	%g4,	%g1
	fpack16	%f0,	%f31
	tleu	%icc,	0x1
	fones	%f28
	fxor	%f0,	%f30,	%f8
	edge32ln	%l2,	%l6,	%g7
	movgu	%xcc,	%o6,	%o1
	ta	%icc,	0x3
	fbue	%fcc3,	loop_1940
	fzero	%f2
	movn	%icc,	%g6,	%i1
	orncc	%i4,	%i2,	%g3
loop_1940:
	addccc	%o4,	%o3,	%g2
	subccc	%o5,	%i6,	%o7
	wr	%g0,	0x04,	%asi
	prefetcha	[%l7 + 0x58] %asi,	 0x0
	add	%i0,	%l0,	%i3
	or	%l1,	0x109C,	%l3
	andn	%i7,	%o0,	%i5
	move	%xcc,	%l4,	%g5
	orncc	%g4,	0x0E7D,	%l5
	brlz,a	%l2,	loop_1941
	sethi	0x1577,	%l6
	tne	%icc,	0x7
	wr	%g0,	0x18,	%asi
	lduba	[%l7 + 0x58] %asi,	%g7
loop_1941:
	tl	%icc,	0x5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srax	%o6,	0x09,	%o1
	set	0x42, %l5
	ldstuba	[%l7 + %l5] 0x80,	%g1
	edge8ln	%i1,	%i4,	%g6
	array32	%i2,	%g3,	%o4
	addccc	%g2,	0x0DE9,	%o5
	ldd	[%l7 + 0x60],	%f8
	call	loop_1942
	movrgz	%o3,	%o7,	%i6
	lduw	[%l7 + 0x14],	%i0
	sdivcc	%l0,	0x1F1E,	%o2
loop_1942:
	edge8ln	%i3,	%l1,	%i7
	mulx	%o0,	0x1243,	%l3
	tgu	%icc,	0x3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bge,a,pt	%xcc,	loop_1943
	membar	0x31
	fmovsle	%icc,	%f6,	%f28
	movrgz	%l4,	0x2CE,	%g5
loop_1943:
	fmovrdgez	%i5,	%f2,	%f30
	fmovdvs	%xcc,	%f17,	%f24
	fmul8x16al	%f11,	%f30,	%f20
	fbul	%fcc0,	loop_1944
	fmovrsgz	%g4,	%f6,	%f24
	tsubcctv	%l2,	0x03CA,	%l6
	fbne	%fcc0,	loop_1945
loop_1944:
	movl	%xcc,	%g7,	%o6
	movneg	%icc,	%o1,	%l5
	movn	%xcc,	%i1,	%g1
loop_1945:
	fmovrdlez	%g6,	%f6,	%f16
	fbg,a	%fcc1,	loop_1946
	add	%i4,	%i2,	%g3
	fzero	%f12
	sll	%o4,	0x0E,	%g2
loop_1946:
	brz,a	%o5,	loop_1947
	nop
	setx loop_1948, %l0, %l1
	jmpl %l1, %o7
	udiv	%o3,	0x0109,	%i6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1947:
	srlx	%i0,	0x17,	%l0
loop_1948:
	nop
	setx	loop_1949,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movn	%icc,	%i3,	%o2
	edge8n	%l1,	%i7,	%o0
	alignaddr	%l3,	%g5,	%i5
loop_1949:
	fcmpne32	%f22,	%f10,	%l4
	set	0x328, %o0
	nop 	! 	nop 	! 	ldxa	[%g0 + %o0] 0x40,	%l2 ripped by fixASI40.pl ripped by fixASI40.pl
	popc	%l6,	%g4
	movge	%icc,	%g7,	%o6
	orncc	%l5,	%i1,	%g1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x60, %i7
	swapa	[%l7 + %i7] 0x80,	%g6
	fnot1s	%f27,	%f16
	tn	%icc,	0x4
	xorcc	%i4,	0x182E,	%o1
	pdist	%f28,	%f24,	%f6
	edge8l	%g3,	%i2,	%o4
	movrlz	%o5,	%o7,	%o3
	umul	%i6,	%i0,	%g2
	set	0x4C, %o7
	stha	%i3,	[%l7 + %o7] 0xea
	membar	#Sync
	fxnors	%f12,	%f28,	%f28
	taddcctv	%l0,	%l1,	%i7
	popc	%o0,	%o2
	fblg,a	%fcc0,	loop_1950
	fmovdvs	%icc,	%f8,	%f9
	edge32	%g5,	%l3,	%l4
	sub	%i5,	0x1944,	%l2
loop_1950:
	sllx	%g4,	0x11,	%g7
	movne	%icc,	%l6,	%o6
	edge16ln	%l5,	%i1,	%g6
	edge8n	%i4,	%o1,	%g1
	orncc	%i2,	%g3,	%o4
	swap	[%l7 + 0x7C],	%o5
	tcc	%icc,	0x7
	fandnot1s	%f2,	%f24,	%f23
	ldsh	[%l7 + 0x44],	%o3
	tge	%icc,	0x1
	bcc,a,pt	%xcc,	loop_1951
	addc	%o7,	0x1196,	%i6
	xnorcc	%g2,	0x1439,	%i3
	set	0x48, %l6
	sta	%f17,	[%l7 + %l6] 0x88
loop_1951:
	fxor	%f26,	%f22,	%f4
	bg,a,pt	%icc,	loop_1952
	nop
	set	0x7E, %i4
	lduh	[%l7 + %i4],	%i0
	fnot1s	%f15,	%f16
	fandnot2s	%f24,	%f15,	%f5
loop_1952:
	movle	%xcc,	%l0,	%l1
	xor	%i7,	%o0,	%o2
	fmovscs	%icc,	%f20,	%f5
	sub	%l3,	0x16A8,	%l4
	fble,a	%fcc1,	loop_1953
	array16	%i5,	%g5,	%l2
	movl	%icc,	%g4,	%l6
	addc	%g7,	0x16AB,	%l5
loop_1953:
	nop
	wr	%g0,	0x80,	%asi
	ldsba	[%l7 + 0x17] %asi,	%o6
	fnand	%f4,	%f14,	%f16
	wr	%g0,	0xeb,	%asi
	stha	%g6,	[%l7 + 0x36] %asi
	membar	#Sync
	fmovdg	%icc,	%f28,	%f18
	lduw	[%l7 + 0x6C],	%i1
	movvc	%xcc,	%i4,	%g1
	tneg	%xcc,	0x4
	fmovdvs	%xcc,	%f7,	%f12
	fmovdge	%icc,	%f8,	%f6
	movvc	%icc,	%o1,	%g3
	andn	%i2,	0x1634,	%o5
	tcs	%xcc,	0x7
	fcmps	%fcc1,	%f17,	%f18
	tpos	%xcc,	0x3
	tsubcctv	%o4,	%o3,	%o7
	fmovdle	%icc,	%f11,	%f20
	movle	%xcc,	%g2,	%i3
	edge8ln	%i6,	%l0,	%l1
	bpos,pt	%xcc,	loop_1954
	addcc	%i7,	0x0902,	%i0
	ldub	[%l7 + 0x11],	%o0
	tsubcc	%o2,	%l3,	%i5
loop_1954:
	bg,a,pt	%xcc,	loop_1955
	bneg	%icc,	loop_1956
	mulscc	%g5,	%l4,	%l2
	tsubcc	%g4,	0x105C,	%l6
loop_1955:
	tsubcc	%g7,	0x08FC,	%o6
loop_1956:
	ldstub	[%l7 + 0x71],	%g6
	movne	%xcc,	%l5,	%i4
	edge16ln	%g1,	%i1,	%o1
	fornot1s	%f7,	%f5,	%f7
	andcc	%i2,	%o5,	%o4
	fmovdg	%xcc,	%f1,	%f18
	sll	%o3,	%o7,	%g3
	orcc	%i3,	0x1AA2,	%i6
	bvc,a,pt	%icc,	loop_1957
	andncc	%g2,	%l1,	%i7
	movcs	%xcc,	%i0,	%o0
	nop
	set	0x18, %o5
	stx	%o2,	[%l7 + %o5]
loop_1957:
	tvc	%icc,	0x4
	fexpand	%f31,	%f30
	ldsh	[%l7 + 0x1C],	%l0
	fnegd	%f2,	%f16
	umulcc	%i5,	0x02A9,	%g5
	ldx	[%l7 + 0x10],	%l3
	mulscc	%l4,	0x194D,	%l2
	xnor	%l6,	%g7,	%o6
	st	%f22,	[%l7 + 0x64]
	fmovsleu	%icc,	%f29,	%f22
	sll	%g6,	0x0F,	%l5
	fones	%f31
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	set	0x10, %o4
	std	%i4,	[%l7 + %o4]
	tleu	%xcc,	0x7
	te	%xcc,	0x4
	sllx	%g4,	0x17,	%i1
	xor	%g1,	0x1C8C,	%i2
	fpack16	%f22,	%f14
	add	%o5,	%o4,	%o1
	set	0x36, %g5
	ldsha	[%l7 + %g5] 0x89,	%o7
	fones	%f11
	add	%g3,	%i3,	%o3
	fandnot2s	%f25,	%f1,	%f24
	edge32ln	%g2,	%i6,	%i7
	sub	%l1,	0x05DE,	%i0
	movvc	%xcc,	%o2,	%o0
	srax	%l0,	%i5,	%l3
	fmovsneg	%xcc,	%f19,	%f13
	edge8l	%g5,	%l2,	%l6
	movrlz	%g7,	0x059,	%l4
	addcc	%o6,	0x08A0,	%g6
	fpmerge	%f30,	%f13,	%f18
	siam	0x3
	fmovspos	%xcc,	%f4,	%f1
	brgez	%i4,	loop_1958
	ldsh	[%l7 + 0x68],	%l5
	udivcc	%i1,	0x13A2,	%g1
	edge16l	%i2,	%g4,	%o4
loop_1958:
	tne	%xcc,	0x7
	fcmped	%fcc2,	%f14,	%f4
	or	%o1,	%o7,	%o5
	sir	0x1B28
	ldd	[%l7 + 0x38],	%f18
	sdivx	%g3,	0x1F6F,	%i3
	movne	%xcc,	%o3,	%g2
	bn	%xcc,	loop_1959
	movneg	%xcc,	%i6,	%l1
	smulcc	%i0,	0x028E,	%o2
	bgu,a,pt	%icc,	loop_1960
loop_1959:
	stx	%o0,	[%l7 + 0x58]
	tgu	%xcc,	0x3
	wr	%g0,	0x22,	%asi
	stxa	%l0,	[%l7 + 0x18] %asi
	membar	#Sync
loop_1960:
	tgu	%icc,	0x3
	addc	%i7,	%i5,	%g5
	fmovrsne	%l3,	%f7,	%f2
	fmovs	%f18,	%f15
	siam	0x6
	sdiv	%l2,	0x13B8,	%g7
	movrgz	%l6,	0x086,	%o6
	edge8ln	%g6,	%l4,	%l5
	set	0x10, %i3
	lduwa	[%l7 + %i3] 0x19,	%i1
	movle	%xcc,	%g1,	%i4
	fxors	%f1,	%f6,	%f25
	edge8	%i2,	%g4,	%o4
	brz,a	%o1,	loop_1961
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmple16	%f24,	%f2,	%o7
	nop
	setx	loop_1962,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_1961:
	stx	%g3,	[%l7 + 0x60]
	popc	0x0E10,	%i3
	ba	loop_1963
loop_1962:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldstub	[%l7 + 0x55],	%o3
	sllx	%g2,	%i6,	%o5
loop_1963:
	fble,a	%fcc0,	loop_1964
	movre	%i0,	0x088,	%l1
	wr	%g0,	0x80,	%asi
	lda	[%l7 + 0x58] %asi,	%f31
loop_1964:
	edge16	%o0,	%o2,	%l0
	xorcc	%i5,	0x029B,	%g5
	subc	%i7,	0x1DBB,	%l2
	sllx	%g7,	%l6,	%l3
	ta	%icc,	0x4
	ld	[%l7 + 0x40],	%f26
	fcmps	%fcc1,	%f12,	%f19
	movpos	%xcc,	%g6,	%l4
	srlx	%l5,	0x19,	%i1
	ldd	[%l7 + 0x28],	%o6
	ldd	[%l7 + 0x10],	%f26
	wr	%g0,	0x80,	%asi
	sta	%f18,	[%l7 + 0x1C] %asi
	srlx	%g1,	%i2,	%i4
	sir	0x07CD
	stbar
	fnegs	%f9,	%f11
	movl	%icc,	%g4,	%o4
	edge8l	%o1,	%g3,	%i3
	edge8n	%o3,	%g2,	%i6
	fandnot2	%f2,	%f10,	%f6
	be,pt	%xcc,	loop_1965
	fsrc1	%f2,	%f4
	fpadd32	%f4,	%f0,	%f12
	edge16n	%o5,	%i0,	%o7
loop_1965:
	edge16n	%o0,	%o2,	%l0
	fmovsleu	%icc,	%f6,	%f19
	edge16l	%i5,	%l1,	%g5
	srlx	%l2,	%i7,	%g7
	fcmpes	%fcc2,	%f17,	%f12
	tne	%icc,	0x1
	taddcc	%l6,	%g6,	%l4
	fcmpeq16	%f30,	%f8,	%l5
	nop
	set	0x20, %g6
	ldsw	[%l7 + %g6],	%i1
	wr	%g0,	0x81,	%asi
	ldstuba	[%l7 + 0x33] %asi,	%o6
	fmovrsne	%l3,	%f19,	%f6
	edge8	%g1,	%i2,	%i4
	movre	%o4,	0x26E,	%o1
	sub	%g3,	%i3,	%o3
	sll	%g2,	%i6,	%g4
	flush	%l7 + 0x18
	fbe,a	%fcc3,	loop_1966
	array32	%o5,	%o7,	%o0
	ldstub	[%l7 + 0x2B],	%o2
	bcs,a	%icc,	loop_1967
loop_1966:
	brnz	%i0,	loop_1968
	tle	%xcc,	0x2
	edge32n	%i5,	%l1,	%l0
loop_1967:
	edge32n	%g5,	%l2,	%g7
loop_1968:
	movge	%xcc,	%l6,	%i7
	prefetch	[%l7 + 0x54],	 0x1
	tn	%icc,	0x4
	smul	%g6,	%l4,	%i1
	ldx	[%l7 + 0x68],	%o6
	udivcc	%l3,	0x0DF6,	%l5
	fnot2s	%f20,	%f21
	st	%f2,	[%l7 + 0x78]
	fmovdvs	%icc,	%f7,	%f15
	movg	%xcc,	%g1,	%i4
	edge16l	%o4,	%o1,	%i2
	set	0x72, %l1
	lduha	[%l7 + %l1] 0x11,	%g3
	wr	%g0,	0x18,	%asi
	stda	%o2,	[%l7 + 0x48] %asi
	bvs	loop_1969
	bgu	loop_1970
	tn	%icc,	0x2
	fcmpne32	%f10,	%f24,	%i3
loop_1969:
	udiv	%g2,	0x1503,	%g4
loop_1970:
	move	%icc,	%i6,	%o5
	wr	%g0,	0x88,	%asi
	prefetcha	[%l7 + 0x50] %asi,	 0x3
	movcc	%icc,	%o0,	%o2
	nop
	setx	loop_1971,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fornot2s	%f28,	%f6,	%f15
	movcs	%xcc,	%i5,	%l1
	fcmps	%fcc0,	%f22,	%f2
loop_1971:
	andn	%i0,	%l0,	%g5
	udiv	%g7,	0x1829,	%l6
	set	0x10, %o1
	ldda	[%l7 + %o1] 0x10,	%i6
	tcc	%icc,	0x5
	sdiv	%l2,	0x0344,	%l4
	mulscc	%g6,	0x1881,	%i1
	array8	%l3,	%o6,	%l5
	edge32n	%i4,	%o4,	%o1
	sll	%i2,	%g1,	%o3
	movneg	%xcc,	%i3,	%g3
	movre	%g4,	%g2,	%o5
	wr	%g0,	0x88,	%asi
	stha	%o7,	[%l7 + 0x2C] %asi
	orn	%i6,	%o2,	%i5
	sdivcc	%l1,	0x1B8C,	%o0
	set	0x76, %i0
	ldstuba	[%l7 + %i0] 0x81,	%l0
	umulcc	%g5,	0x18F9,	%g7
	tcc	%xcc,	0x1
	sir	0x1141
	bvc,a,pt	%xcc,	loop_1972
	fpmerge	%f4,	%f9,	%f4
	movrlez	%l6,	0x060,	%i7
	movrlez	%l2,	0x3DB,	%l4
loop_1972:
	alignaddr	%g6,	%i0,	%i1
	tn	%xcc,	0x1
	edge32l	%l3,	%l5,	%i4
	be,a,pn	%icc,	loop_1973
	edge32	%o4,	%o1,	%i2
	popc	0x11A0,	%g1
	udivx	%o6,	0x0D5F,	%i3
loop_1973:
	bvc	loop_1974
	fble	%fcc2,	loop_1975
	xnor	%g3,	0x16FD,	%o3
	fcmpgt32	%f6,	%f24,	%g4
loop_1974:
	smul	%g2,	0x144B,	%o5
loop_1975:
	movvc	%icc,	%o7,	%o2
	udivx	%i5,	0x0DBE,	%i6
	alignaddr	%o0,	%l0,	%g5
	fmovrde	%g7,	%f10,	%f12
	tvc	%icc,	0x6
	edge8n	%l6,	%l1,	%i7
	movleu	%icc,	%l2,	%l4
	tvs	%xcc,	0x0
	edge8l	%g6,	%i0,	%l3
	fxnors	%f28,	%f2,	%f2
	tpos	%xcc,	0x4
	fmovrdlz	%l5,	%f0,	%f6
	be,a,pt	%icc,	loop_1976
	tneg	%icc,	0x2
	edge16ln	%i1,	%i4,	%o4
	movcs	%icc,	%o1,	%i2
loop_1976:
	fcmpgt16	%f18,	%f8,	%o6
	wr	%g0,	0x80,	%asi
	lduha	[%l7 + 0x14] %asi,	%i3
	movneg	%xcc,	%g3,	%g1
	fmovrdgz	%o3,	%f8,	%f10
	fmovdg	%icc,	%f8,	%f7
	bg,pt	%xcc,	loop_1977
	fcmpne16	%f16,	%f28,	%g2
	andncc	%g4,	%o5,	%o2
	mulscc	%i5,	0x1B8A,	%o7
loop_1977:
	fmovsgu	%xcc,	%f24,	%f27
	set	0x38, %g2
	sta	%f7,	[%l7 + %g2] 0x0c
	udiv	%i6,	0x16E6,	%l0
	taddcctv	%o0,	0x1EE6,	%g5
	sub	%l6,	%g7,	%i7
	movrne	%l2,	%l4,	%l1
	fbe	%fcc1,	loop_1978
	movvs	%icc,	%i0,	%g6
	fbule	%fcc1,	loop_1979
	fmovrsne	%l5,	%f19,	%f23
loop_1978:
	mulx	%l3,	%i1,	%i4
	fbg	%fcc0,	loop_1980
loop_1979:
	edge16ln	%o4,	%i2,	%o6
	movle	%xcc,	%o1,	%g3
	fone	%f10
loop_1980:
	udivcc	%g1,	0x0812,	%i3
	tneg	%icc,	0x4
	edge16	%g2,	%g4,	%o3
	fmul8x16	%f0,	%f16,	%f20
	brlz,a	%o5,	loop_1981
	srlx	%o2,	0x04,	%o7
	smul	%i5,	%i6,	%o0
	alignaddr	%l0,	%g5,	%g7
loop_1981:
	edge16ln	%l6,	%l2,	%l4
	tge	%xcc,	0x0
	bpos,a,pt	%xcc,	loop_1982
	tneg	%icc,	0x1
	bl,pt	%icc,	loop_1983
	tg	%xcc,	0x0
loop_1982:
	subc	%i7,	0x100A,	%i0
	movrlz	%l1,	0x255,	%g6
loop_1983:
	std	%f22,	[%l7 + 0x78]
	taddcc	%l3,	%l5,	%i4
	fmovdne	%xcc,	%f7,	%f16
	taddcctv	%i1,	%i2,	%o6
	bcc,a,pn	%xcc,	loop_1984
	fcmpd	%fcc2,	%f14,	%f26
	fcmpd	%fcc2,	%f2,	%f24
	andcc	%o4,	0x1460,	%o1
loop_1984:
	siam	0x1
	subcc	%g1,	%g3,	%i3
	call	loop_1985
	sra	%g4,	%o3,	%o5
	fble	%fcc0,	loop_1986
	array8	%o2,	%g2,	%i5
loop_1985:
	movleu	%icc,	%i6,	%o0
	fcmpgt16	%f20,	%f26,	%o7
loop_1986:
	srax	%g5,	0x0A,	%l0
	movle	%xcc,	%g7,	%l2
	movrgez	%l4,	%l6,	%i0
	set	0x40, %g7
	stda	%f0,	[%l7 + %g7] 0x81
	tneg	%xcc,	0x2
	sethi	0x1CD5,	%l1
	st	%f8,	[%l7 + 0x58]
	subcc	%i7,	0x15E0,	%g6
	movleu	%xcc,	%l5,	%i4
	fbne	%fcc3,	loop_1987
	orcc	%i1,	%l3,	%o6
	sdiv	%i2,	0x1640,	%o4
	movrne	%o1,	%g1,	%i3
loop_1987:
	fmovsa	%icc,	%f24,	%f6
	movne	%icc,	%g3,	%g4
	tvc	%icc,	0x7
	fbug	%fcc1,	loop_1988
	bl,a	loop_1989
	movvc	%icc,	%o5,	%o2
	stx	%o3,	[%l7 + 0x78]
loop_1988:
	ldsw	[%l7 + 0x44],	%i5
loop_1989:
	add	%i6,	0x0463,	%g2
	fmovsg	%icc,	%f2,	%f11
	fmovscc	%icc,	%f22,	%f30
	wr	%g0,	0x18,	%asi
	prefetcha	[%l7 + 0x10] %asi,	 0x1
	addc	%g5,	%l0,	%o7
	bg	%icc,	loop_1990
	movrgez	%l2,	0x024,	%l4
	tgu	%icc,	0x1
	orcc	%l6,	0x1EA9,	%i0
loop_1990:
	te	%icc,	0x3
	tgu	%xcc,	0x0
	stw	%l1,	[%l7 + 0x38]
	move	%xcc,	%g7,	%i7
	movge	%icc,	%l5,	%g6
	fblg,a	%fcc3,	loop_1991
	fmovscc	%xcc,	%f24,	%f28
	ldstub	[%l7 + 0x46],	%i4
	fandnot1s	%f28,	%f18,	%f11
loop_1991:
	movrlz	%l3,	0x372,	%i1
	tpos	%icc,	0x4
	ldd	[%l7 + 0x18],	%o6
	xorcc	%i2,	%o4,	%g1
	bcs,pt	%xcc,	loop_1992
	movre	%o1,	0x234,	%i3
	ta	%icc,	0x1
	umulcc	%g4,	%o5,	%o2
loop_1992:
	nop
	wr	%g0,	0x19,	%asi
	stba	%g3,	[%l7 + 0x6D] %asi
	ldd	[%l7 + 0x68],	%i4
	wr	%g0,	0x04,	%asi
	lduha	[%l7 + 0x4A] %asi,	%i6
	subccc	%g2,	%o0,	%o3
	fba,a	%fcc2,	loop_1993
	andncc	%l0,	%g5,	%o7
	faligndata	%f26,	%f6,	%f26
	tne	%xcc,	0x0
loop_1993:
	smul	%l4,	%l2,	%l6
	mova	%xcc,	%l1,	%i0
	fpadd16s	%f19,	%f17,	%f19
	andncc	%i7,	%g7,	%l5
	smul	%i4,	%l3,	%i1
	brlez	%g6,	loop_1994
	or	%o6,	0x1948,	%i2
	sethi	0x1E22,	%g1
	fbul,a	%fcc1,	loop_1995
loop_1994:
	mulscc	%o4,	%i3,	%g4
	wr	%g0,	0x89,	%asi
	prefetcha	[%l7 + 0x10] %asi,	 0x1
loop_1995:
	fbul,a	%fcc2,	loop_1996
	pdist	%f28,	%f28,	%f30
	fmovdcc	%icc,	%f8,	%f25
	xor	%o1,	0x0B99,	%o2
loop_1996:
	ba	loop_1997
	tpos	%xcc,	0x3
	wr	%g0,	0x88,	%asi
	lduha	[%l7 + 0x6C] %asi,	%g3
loop_1997:
	fmovdne	%xcc,	%f30,	%f25
	fmovs	%f19,	%f22
	udivcc	%i6,	0x15CC,	%i5
	fmul8x16au	%f20,	%f19,	%f6
	sllx	%o0,	%o3,	%l0
	andncc	%g5,	%g2,	%l4
	bshuffle	%f0,	%f20,	%f8
	edge16	%l2,	%o7,	%l1
	umulcc	%i0,	%i7,	%g7
	fcmpd	%fcc0,	%f8,	%f28
	edge16n	%l5,	%i4,	%l3
	fxor	%f6,	%f14,	%f14
	fpadd32s	%f22,	%f12,	%f31
	taddcctv	%i1,	0x0F01,	%l6
	orcc	%o6,	%g6,	%i2
	stbar
	alignaddrl	%g1,	%i3,	%g4
	movvs	%icc,	%o4,	%o1
	fcmped	%fcc1,	%f8,	%f6
	std	%f6,	[%l7 + 0x78]
	move	%xcc,	%o5,	%o2
	fpmerge	%f26,	%f9,	%f26
	sdiv	%g3,	0x041E,	%i5
	srlx	%o0,	%i6,	%o3
	fornot2	%f10,	%f20,	%f22
	fmovrdgz	%l0,	%f30,	%f10
	udiv	%g2,	0x0ECD,	%g5
	stx	%l4,	[%l7 + 0x48]
	edge32	%l2,	%o7,	%l1
	tcs	%icc,	0x0
	fpmerge	%f2,	%f0,	%f2
	mova	%xcc,	%i7,	%i0
	fmuld8ulx16	%f15,	%f27,	%f2
	ta	%icc,	0x1
	taddcctv	%l5,	0x1CE2,	%g7
	fmovsl	%icc,	%f8,	%f29
	array8	%l3,	%i1,	%i4
	udiv	%o6,	0x1B96,	%l6
	tn	%icc,	0x3
	mova	%icc,	%i2,	%g6
	movge	%xcc,	%i3,	%g4
	edge16n	%o4,	%o1,	%g1
	taddcctv	%o5,	0x0035,	%g3
	mulx	%i5,	%o2,	%i6
	stx	%o0,	[%l7 + 0x40]
	tvs	%icc,	0x4
	fones	%f29
	addc	%o3,	0x10A4,	%l0
	fmul8ulx16	%f18,	%f28,	%f14
	fble,a	%fcc0,	loop_1998
	udivcc	%g5,	0x1854,	%l4
	umulcc	%l2,	0x0D31,	%o7
	tne	%icc,	0x1
loop_1998:
	fxnors	%f3,	%f7,	%f30
	wr	%g0,	0x80,	%asi
	lda	[%l7 + 0x3C] %asi,	%f24
	fands	%f31,	%f8,	%f21
	addc	%g2,	0x163A,	%i7
	fxors	%f13,	%f26,	%f23
	ldx	[%l7 + 0x68],	%i0
	taddcc	%l1,	%g7,	%l3
	movrlez	%i1,	0x39C,	%l5
	bcs,pt	%icc,	loop_1999
	fmovrde	%i4,	%f10,	%f10
	fcmpne32	%f8,	%f30,	%l6
	fcmple32	%f2,	%f6,	%o6
loop_1999:
	movne	%xcc,	%g6,	%i3
	fbge	%fcc3,	loop_2000
	sra	%g4,	%i2,	%o1
	edge8ln	%g1,	%o5,	%g3
	add	%l7,	0x78,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%o4,	%o2
loop_2000:
	array8	%i5,	%o0,	%i6
	xnorcc	%l0,	0x1532,	%o3
	fzero	%f2
	orncc	%g5,	0x1061,	%l4
	ldd	[%l7 + 0x48],	%o6
	set	0x20, %i2
	ldstuba	[%l7 + %i2] 0x88,	%g2
	addcc	%i7,	0x1265,	%l2
	fpack32	%f10,	%f18,	%f16
	brlz	%i0,	loop_2001
	movpos	%icc,	%l1,	%l3
	fnot1s	%f27,	%f11
	set	0x56, %i1
	ldsha	[%l7 + %i1] 0x15,	%i1
loop_2001:
	edge8ln	%g7,	%i4,	%l6
	tl	%icc,	0x3
	movvc	%icc,	%l5,	%g6
	fbne	%fcc0,	loop_2002
	fmul8sux16	%f4,	%f6,	%f26
	movl	%icc,	%o6,	%g4
	mulx	%i2,	0x0BB4,	%o1
loop_2002:
	bcc,a,pn	%icc,	loop_2003
	tvs	%xcc,	0x5
	movvc	%icc,	%g1,	%o5
	edge32n	%g3,	%i3,	%o2
loop_2003:
	fand	%f18,	%f12,	%f14
	or	%i5,	%o4,	%o0
	membar	#Sync
	set	0x40, %l2
	ldda	[%l7 + %l2] 0xf1,	%f0
	fmovsvs	%xcc,	%f17,	%f12
	fnand	%f12,	%f6,	%f18
	sra	%l0,	0x17,	%i6
	fmovdne	%icc,	%f29,	%f27
	mova	%xcc,	%g5,	%l4
	set	0x08, %o3
	lduba	[%l7 + %o3] 0x11,	%o7
	tvc	%icc,	0x3
	set	0x08, %l3
	stxa	%g2,	[%l7 + %l3] 0x22
	membar	#Sync
	bgu,pt	%xcc,	loop_2004
	te	%xcc,	0x0
	tpos	%icc,	0x4
	tge	%xcc,	0x1
loop_2004:
	nop
	set	0x7C, %o2
	prefetch	[%l7 + %o2],	 0x0
	lduh	[%l7 + 0x12],	%o3
	move	%xcc,	%l2,	%i0
	addcc	%l1,	0x00FB,	%i7
	orcc	%l3,	0x1CF7,	%i1
	std	%f18,	[%l7 + 0x28]
	fmovde	%icc,	%f12,	%f6
	wr	%g0,	0xeb,	%asi
	stxa	%g7,	[%l7 + 0x58] %asi
	membar	#Sync
	movle	%icc,	%i4,	%l5
	edge8l	%g6,	%l6,	%g4
	wr	%g0,	0x19,	%asi
	prefetcha	[%l7 + 0x10] %asi,	 0x2
	bpos	loop_2005
	fpsub16s	%f24,	%f23,	%f24
	sethi	0x1141,	%o1
	wr	%g0,	0x2f,	%asi
	ldda	[%l7 + 0x60] %asi,	%g0
loop_2005:
	movl	%icc,	%o5,	%i2
	xor	%g3,	0x0F06,	%o2
	brgz,a	%i5,	loop_2006
	fble	%fcc0,	loop_2007
	movcc	%icc,	%o4,	%i3
	orcc	%l0,	%o0,	%g5
loop_2006:
	fbge	%fcc2,	loop_2008
loop_2007:
	stx	%i6,	[%l7 + 0x40]
	xorcc	%l4,	0x076F,	%o7
	std	%f12,	[%l7 + 0x70]
loop_2008:
	brgz,a	%o3,	loop_2009
	edge8	%l2,	%g2,	%i0
	nop
	setx	loop_2010,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tsubcctv	%l1,	%l3,	%i7
loop_2009:
	movle	%xcc,	%g7,	%i1
	movle	%xcc,	%l5,	%g6
loop_2010:
	fors	%f13,	%f7,	%f28
	bcc,a,pt	%xcc,	loop_2011
	movle	%icc,	%i4,	%l6
	subcc	%o6,	0x16DC,	%g4
	srlx	%o1,	%o5,	%i2
loop_2011:
	edge8l	%g3,	%o2,	%i5
	fabss	%f9,	%f30
	membar	0x56
	fmovrde	%g1,	%f14,	%f18
	fpadd16	%f14,	%f30,	%f14
	fxor	%f14,	%f20,	%f24
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
	fnors	%f27,	%f18,	%f12
	edge16ln	%i3,	%l0,	%o4
	add	%o0,	%g5,	%l4
loop_2012:
	fcmps	%fcc2,	%f22,	%f25
	set	0x40, %l0
	ldda	[%l7 + %l0] 0x11,	%f0
	fcmped	%fcc3,	%f18,	%f28
	fone	%f2
	subcc	%o7,	0x1CE7,	%i6
	ld	[%l7 + 0x54],	%f18
	movn	%icc,	%l2,	%o3
	brz	%g2,	loop_2013
	subc	%i0,	0x0D58,	%l1
	orn	%i7,	0x04E9,	%g7
	andn	%l3,	%i1,	%l5
loop_2013:
	nop
	set	0x58, %g3
	prefetch	[%l7 + %g3],	 0x3
	fmovrdne	%g6,	%f14,	%f24
	ld	[%l7 + 0x78],	%f27
	tpos	%xcc,	0x6
	andn	%i4,	0x0EC8,	%o6
	edge8	%g4,	%l6,	%o1
	prefetch	[%l7 + 0x64],	 0x1
	fbue,a	%fcc2,	loop_2014
	tsubcctv	%o5,	%g3,	%o2
	udiv	%i5,	0x094B,	%i2
	smulcc	%g1,	%l0,	%o4
loop_2014:
	movre	%i3,	%o0,	%l4
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
	brgez,a	%g5,	loop_2016
	fmovrslez	%i6,	%f9,	%f13
	movgu	%icc,	%o7,	%l2
loop_2015:
	ble	loop_2017
loop_2016:
	sub	%g2,	%o3,	%l1
	fbo,a	%fcc2,	loop_2018
	fpmerge	%f25,	%f15,	%f10
loop_2017:
	addc	%i7,	%i0,	%l3
	xnorcc	%g7,	0x19F9,	%l5
loop_2018:
	and	%i1,	%g6,	%i4
	bcs,a	%icc,	loop_2019
	tl	%icc,	0x7
	fsrc1	%f26,	%f2
	andncc	%g4,	%l6,	%o6
loop_2019:
	sdivcc	%o1,	0x0A0F,	%g3
	st	%f31,	[%l7 + 0x6C]
	ldstub	[%l7 + 0x1A],	%o5
	srlx	%o2,	0x15,	%i5
	movrlz	%g1,	%l0,	%i2
	sll	%o4,	%o0,	%i3
	fbo,a	%fcc3,	loop_2020
	edge8ln	%l4,	%g5,	%o7
	movrlz	%i6,	0x113,	%g2
	tvc	%xcc,	0x6
loop_2020:
	tl	%icc,	0x1
	smulcc	%o3,	%l1,	%l2
	xorcc	%i7,	%l3,	%g7
	fmovrdne	%i0,	%f8,	%f10
	fblg,a	%fcc3,	loop_2021
	add	%l5,	0x04A3,	%i1
	tl	%xcc,	0x3
	edge32l	%i4,	%g6,	%g4
loop_2021:
	call	loop_2022
	movg	%xcc,	%l6,	%o6
	fcmpne32	%f2,	%f0,	%o1
	umul	%o5,	0x1BD0,	%g3
loop_2022:
	bpos,a,pn	%xcc,	loop_2023
	ta	%icc,	0x1
	st	%f13,	[%l7 + 0x20]
	fcmped	%fcc3,	%f28,	%f0
loop_2023:
	movcs	%xcc,	%i5,	%o2
	brz	%g1,	loop_2024
	fmovdne	%icc,	%f19,	%f30
	sir	0x13C5
	fsrc1s	%f28,	%f10
loop_2024:
	fmovscc	%icc,	%f1,	%f2
	movl	%xcc,	%i2,	%l0
	wr	%g0,	0x18,	%asi
	ldsha	[%l7 + 0x60] %asi,	%o4
	wr	%g0,	0x04,	%asi
	lda	[%l7 + 0x0C] %asi,	%f8
	bleu	loop_2025
	movcs	%xcc,	%i3,	%l4
	ldsh	[%l7 + 0x18],	%o0
	sethi	0x1B5E,	%g5
loop_2025:
	tg	%xcc,	0x3
	fmovd	%f14,	%f2
	fmovda	%icc,	%f26,	%f10
	ldub	[%l7 + 0x30],	%o7
	membar	0x2A
	fbg,a	%fcc1,	loop_2026
	umulcc	%g2,	0x0B0F,	%o3
	fmovs	%f11,	%f21
	set	0x60, %g4
	ldswa	[%l7 + %g4] 0x18,	%l1
loop_2026:
	edge32l	%i6,	%i7,	%l2
	sllx	%l3,	%g7,	%l5
	fmovsvs	%icc,	%f5,	%f20
	bpos,a	loop_2027
	edge16ln	%i1,	%i4,	%g6
	tneg	%xcc,	0x1
	movrlez	%i0,	0x162,	%l6
loop_2027:
	srl	%g4,	0x06,	%o1
	ba,a	%icc,	loop_2028
	movl	%xcc,	%o5,	%o6
	fcmpne16	%f8,	%f28,	%g3
	fnor	%f0,	%f22,	%f22
loop_2028:
	nop
	set	0x72, %o6
	lduba	[%l7 + %o6] 0x81,	%o2
	tvc	%xcc,	0x7
	bl,pt	%icc,	loop_2029
	ldd	[%l7 + 0x50],	%g0
	orcc	%i5,	0x1438,	%l0
	fnegs	%f10,	%f6
loop_2029:
	siam	0x6
	umulcc	%i2,	0x1CAA,	%i3
	umulcc	%o4,	0x0F51,	%l4
	edge8	%g5,	%o7,	%g2
	addc	%o3,	%o0,	%l1
	tvs	%xcc,	0x4
	fmovrdne	%i7,	%f30,	%f2
	fmovd	%f4,	%f16
	brz	%l2,	loop_2030
	fcmpes	%fcc0,	%f11,	%f7
	taddcctv	%l3,	%g7,	%l5
	fxor	%f24,	%f14,	%f18
loop_2030:
	srax	%i1,	0x1B,	%i4
	bg,a,pn	%xcc,	loop_2031
	movl	%xcc,	%g6,	%i0
	edge32	%l6,	%g4,	%o1
	ldx	[%l7 + 0x40],	%i6
loop_2031:
	subcc	%o6,	%g3,	%o2
	sllx	%o5,	0x01,	%g1
	movg	%xcc,	%l0,	%i5
	brgez	%i2,	loop_2032
	tvs	%xcc,	0x3
	addccc	%o4,	0x0013,	%l4
	movrlez	%i3,	%g5,	%g2
loop_2032:
	movne	%icc,	%o7,	%o3
	stbar
	fbul,a	%fcc2,	loop_2033
	fbue,a	%fcc3,	loop_2034
	movpos	%icc,	%o0,	%l1
	movl	%icc,	%i7,	%l2
loop_2033:
	fbg,a	%fcc1,	loop_2035
loop_2034:
	and	%l3,	0x13EA,	%g7
	edge32	%l5,	%i4,	%i1
	fba	%fcc0,	loop_2036
loop_2035:
	sethi	0x11D1,	%i0
	brlz,a	%g6,	loop_2037
	smulcc	%g4,	%o1,	%l6
loop_2036:
	nop
	setx	loop_2038,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fmovsle	%icc,	%f21,	%f20
loop_2037:
	movle	%xcc,	%i6,	%g3
	fmovdge	%icc,	%f8,	%f7
loop_2038:
	ba,pt	%icc,	loop_2039
	sdivcc	%o2,	0x0B7C,	%o6
	array16	%o5,	%g1,	%i5
	fnors	%f2,	%f22,	%f26
loop_2039:
	and	%l0,	%i2,	%o4
	tgu	%xcc,	0x2
	fmovda	%icc,	%f15,	%f27
	movrlz	%i3,	0x11B,	%g5
	srl	%g2,	%o7,	%o3
	bg,a,pn	%icc,	loop_2040
	xnor	%l4,	%o0,	%i7
	movle	%xcc,	%l1,	%l2
	wr	%g0,	0x0c,	%asi
	ldsha	[%l7 + 0x08] %asi,	%g7
loop_2040:
	tn	%icc,	0x6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andncc	%l5,	%l3,	%i1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	brz,a	%i0,	loop_2041
	fmovd	%f4,	%f6
	andn	%i4,	%g4,	%o1
	set	0x16, %i6
	ldsba	[%l7 + %i6] 0x15,	%l6
loop_2041:
	smulcc	%i6,	0x11F4,	%g6
	wr	%g0,	0x11,	%asi
	swapa	[%l7 + 0x44] %asi,	%g3
	fmovrdne	%o2,	%f8,	%f14
	tneg	%icc,	0x2
	tge	%icc,	0x2
	stw	%o5,	[%l7 + 0x28]
	tgu	%icc,	0x5
	fnegs	%f29,	%f3
	brgez	%o6,	loop_2042
	fpsub32	%f10,	%f16,	%f12
	add	%i5,	%l0,	%i2
	edge8	%g1,	%i3,	%g5
loop_2042:
	fmovdle	%xcc,	%f4,	%f14
	edge8ln	%g2,	%o4,	%o3
	alignaddrl	%l4,	%o7,	%i7
	udiv	%l1,	0x0DEE,	%l2
	ld	[%l7 + 0x54],	%f8
	sth	%o0,	[%l7 + 0x6A]
	movneg	%icc,	%g7,	%l5
	membar	0x1F
	fmovde	%xcc,	%f15,	%f0
	addc	%i1,	0x08E4,	%l3
	tle	%icc,	0x4
	srl	%i0,	%g4,	%i4
	smulcc	%l6,	0x0652,	%o1
	ldsw	[%l7 + 0x0C],	%i6
	srl	%g3,	%o2,	%o5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tgu	%xcc,	0x7
	addccc	%o6,	0x0DE3,	%i5
	movre	%g6,	%i2,	%l0
	movvc	%xcc,	%g1,	%i3
	tn	%xcc,	0x1
	fmovrdlez	%g2,	%f26,	%f12
	brgez,a	%o4,	loop_2043
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmpgt32	%f12,	%f20,	%g5
	wr	%g0,	0x04,	%asi
	stha	%l4,	[%l7 + 0x3A] %asi
loop_2043:
	fpackfix	%f28,	%f16
	bge,a	loop_2044
	movrne	%o7,	0x3E9,	%i7
	array8	%o3,	%l2,	%l1
	fsrc2	%f18,	%f2
loop_2044:
	fbue,a	%fcc2,	loop_2045
	fmovsl	%icc,	%f21,	%f17
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdne	%xcc,	%f21,	%f16
loop_2045:
	andcc	%o0,	0x1AF6,	%l5
	ldd	[%l7 + 0x40],	%i0
	add	%l7,	0x6C,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] %asi,	%l3,	%i0
	movre	%g7,	0x2B6,	%i4
	or	%l6,	%o1,	%i6
	add	%g3,	%g4,	%o5
	fmovs	%f19,	%f4
	fsrc1s	%f7,	%f11
	fpackfix	%f14,	%f31
	sdiv	%o6,	0x16EA,	%i5
	mulscc	%g6,	%i2,	%o2
	addcc	%g1,	0x1000,	%l0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movvs	%icc,	%i3,	%o4
	fnot1	%f10,	%f22
	sth	%g5,	[%l7 + 0x40]
	brgz	%l4,	loop_2046
	ba	%xcc,	loop_2047
	tge	%icc,	0x6
	tcs	%xcc,	0x7
loop_2046:
	ba,a,pt	%icc,	loop_2048
loop_2047:
	alignaddr	%o7,	%g2,	%i7
	for	%f28,	%f28,	%f22
	set	0x4E, %l4
	ldsha	[%l7 + %l4] 0x80,	%o3
loop_2048:
	fpadd32	%f26,	%f2,	%f14
	siam	0x0
	bcs,a,pt	%xcc,	loop_2049
	sra	%l1,	0x0A,	%l2
	wr	%g0,	0x11,	%asi
	ldxa	[%l7 + 0x20] %asi,	%l5
loop_2049:
	ta	%xcc,	0x0
	fnegs	%f3,	%f14
	fbu	%fcc2,	loop_2050
	tsubcctv	%i1,	%o0,	%l3
	fnegs	%f7,	%f30
	movcs	%icc,	%g7,	%i0
loop_2050:
	smul	%l6,	0x1873,	%o1
	orcc	%i4,	0x1168,	%i6
	fbe,a	%fcc0,	loop_2051
	movre	%g3,	%o5,	%o6
	stbar
	mova	%xcc,	%g4,	%g6
loop_2051:
	ld	[%l7 + 0x28],	%f23
	tleu	%xcc,	0x6
	bcc,a	%icc,	loop_2052
	umul	%i5,	0x0868,	%i2
	ba,a,pt	%icc,	loop_2053
	nop
	setx	loop_2054,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_2052:
	tne	%icc,	0x4
	prefetch	[%l7 + 0x34],	 0x2
loop_2053:
	orn	%g1,	%l0,	%o2
loop_2054:
	edge8ln	%i3,	%g5,	%l4
	srl	%o4,	%o7,	%i7
	fmovda	%icc,	%f17,	%f8
	tle	%icc,	0x5
	ta	%xcc,	0x1
	fxor	%f28,	%f8,	%f24
	edge32n	%g2,	%o3,	%l2
	mulx	%l1,	%i1,	%o0
	movre	%l3,	%l5,	%g7
	wr	%g0,	0x2b,	%asi
	stda	%i0,	[%l7 + 0x78] %asi
	membar	#Sync
	tcs	%icc,	0x1
	subcc	%l6,	0x1E88,	%i4
	fmovdne	%xcc,	%f12,	%f10
	fnot1	%f28,	%f22
	fmovrsgz	%o1,	%f29,	%f9
	fmovdneg	%icc,	%f16,	%f15
	umul	%g3,	%o5,	%i6
	fmovspos	%icc,	%f10,	%f24
	movrgz	%o6,	0x241,	%g4
	xorcc	%i5,	%i2,	%g6
	popc	%l0,	%o2
	movre	%g1,	%g5,	%l4
	fmovsne	%xcc,	%f17,	%f16
	fnegs	%f7,	%f4
	bge,a	%icc,	loop_2055
	tcs	%xcc,	0x4
	edge8n	%o4,	%o7,	%i3
	array8	%i7,	%o3,	%g2
loop_2055:
	fxnor	%f4,	%f22,	%f16
	fmovsg	%icc,	%f13,	%f29
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrne	%l2,	%l1,	%o0
	edge16ln	%i1,	%l3,	%g7
	tl	%xcc,	0x0
	sra	%l5,	%i0,	%l6
	smulcc	%i4,	%o1,	%g3
	fmul8sux16	%f22,	%f6,	%f20
	fba	%fcc0,	loop_2056
	ble,pn	%icc,	loop_2057
	sdivcc	%i6,	0x1280,	%o5
	std	%o6,	[%l7 + 0x10]
loop_2056:
	addccc	%i5,	%g4,	%i2
loop_2057:
	or	%l0,	%o2,	%g6
	andncc	%g1,	%g5,	%o4
	xorcc	%l4,	0x0DA0,	%i3
	ble,a	loop_2058
	fpsub16s	%f14,	%f1,	%f31
	fpsub16	%f28,	%f28,	%f28
	sdivx	%i7,	0x187F,	%o7
loop_2058:
	array16	%g2,	%o3,	%l1
	tn	%xcc,	0x7
	popc	%o0,	%l2
	fbug	%fcc2,	loop_2059
	fmovda	%icc,	%f27,	%f30
	fmovscs	%xcc,	%f29,	%f1
	st	%f5,	[%l7 + 0x58]
loop_2059:
	pdist	%f10,	%f8,	%f30
	edge16l	%i1,	%l3,	%l5
	tsubcctv	%g7,	%l6,	%i0
	tleu	%xcc,	0x4
	alignaddr	%i4,	%g3,	%o1
	edge8l	%i6,	%o5,	%o6
	set	0x4C, %i5
	ldsha	[%l7 + %i5] 0x04,	%i5
	nop
	setx	loop_2060,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	ldsw	[%l7 + 0x50],	%g4
	fmovrslz	%i2,	%f16,	%f16
	fbo,a	%fcc0,	loop_2061
loop_2060:
	addc	%l0,	%g6,	%g1
	edge8n	%o2,	%g5,	%l4
	fpsub16s	%f5,	%f12,	%f17
loop_2061:
	xor	%o4,	%i7,	%o7
	edge16n	%g2,	%o3,	%l1
	bl,a	loop_2062
	tn	%xcc,	0x4
	tpos	%icc,	0x3
	fpadd16	%f12,	%f24,	%f12
loop_2062:
	fxor	%f0,	%f4,	%f6
	sth	%o0,	[%l7 + 0x20]
	srlx	%i3,	%l2,	%l3
	edge16l	%l5,	%g7,	%l6
	tcs	%icc,	0x7
	bvs,a,pt	%icc,	loop_2063
	and	%i1,	%i0,	%i4
	edge32	%g3,	%i6,	%o1
	fornot2s	%f18,	%f2,	%f1
loop_2063:
	nop
	set	0x6C, %g1
	stha	%o5,	[%l7 + %g1] 0xeb
	membar	#Sync
	xor	%i5,	%g4,	%o6
	orncc	%i2,	0x0809,	%g6
	fmovdcs	%icc,	%f15,	%f2
	fnegs	%f21,	%f6
	fblg	%fcc1,	loop_2064
	bcc	loop_2065
	fsrc2	%f30,	%f8
	movrne	%g1,	%o2,	%g5
loop_2064:
	xnorcc	%l0,	%o4,	%i7
loop_2065:
	brlz,a	%l4,	loop_2066
	tg	%xcc,	0x7
	fbne,a	%fcc2,	loop_2067
	mova	%icc,	%g2,	%o7
loop_2066:
	fcmpne32	%f20,	%f18,	%l1
	fsrc1s	%f5,	%f1
loop_2067:
	udivx	%o3,	0x0C1A,	%o0
	umul	%l2,	%i3,	%l3
	wr	%g0,	0x19,	%asi
	stwa	%l5,	[%l7 + 0x30] %asi
	tpos	%xcc,	0x1
	sdivx	%g7,	0x14C8,	%l6
	movcc	%icc,	%i0,	%i1
	fmovrslez	%g3,	%f20,	%f18
	brgez,a	%i4,	loop_2068
	tl	%xcc,	0x4
	orncc	%o1,	%i6,	%o5
	sdiv	%g4,	0x1740,	%o6
loop_2068:
	sir	0x1409
	wr	%g0,	0x81,	%asi
	lduba	[%l7 + 0x09] %asi,	%i2
	sir	0x078A
	fxor	%f14,	%f22,	%f2
	membar	0x41
	ldd	[%l7 + 0x50],	%f6
	wr	%g0,	0x11,	%asi
	lduha	[%l7 + 0x2A] %asi,	%g6
	ble,a	loop_2069
	fbug	%fcc0,	loop_2070
	fexpand	%f16,	%f6
	edge8	%i5,	%o2,	%g5
loop_2069:
	edge16ln	%g1,	%o4,	%i7
loop_2070:
	brlz,a	%l0,	loop_2071
	tsubcctv	%g2,	0x1019,	%l4
	fnors	%f1,	%f8,	%f13
	fmovrdgz	%l1,	%f2,	%f28
loop_2071:
	andn	%o7,	%o3,	%o0
	array8	%i3,	%l3,	%l5
	bn,pt	%xcc,	loop_2072
	fxnors	%f14,	%f14,	%f20
	udivx	%g7,	0x0FEA,	%l2
	tvs	%xcc,	0x0
loop_2072:
	udiv	%l6,	0x1B7B,	%i1
	fxors	%f12,	%f1,	%f18
	fmovda	%xcc,	%f16,	%f29
	umul	%g3,	0x0E5F,	%i4
	fnors	%f25,	%f22,	%f5
	fbue	%fcc1,	loop_2073
	fmovdl	%xcc,	%f14,	%f17
	movg	%icc,	%i0,	%o1
	fpsub16s	%f1,	%f11,	%f8
loop_2073:
	movn	%icc,	%i6,	%o5
	movrlz	%o6,	%g4,	%g6
	tleu	%icc,	0x6
	fornot1	%f18,	%f30,	%f28
	fmovsne	%icc,	%f24,	%f29
	tsubcctv	%i5,	0x1A72,	%o2
	movrlz	%i2,	%g1,	%o4
	fmovdleu	%icc,	%f14,	%f25
	movleu	%icc,	%g5,	%l0
	movvs	%xcc,	%i7,	%g2
	xnor	%l1,	%o7,	%o3
	fpsub32s	%f23,	%f29,	%f10
	membar	0x6B
	tn	%icc,	0x4
	edge32n	%l4,	%o0,	%i3
	sdivx	%l3,	0x1642,	%g7
	alignaddr	%l2,	%l6,	%l5
	fbul	%fcc3,	loop_2074
	ldx	[%l7 + 0x10],	%g3
	add	%l7,	0x50,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%i1,	%i0
loop_2074:
	brlez	%o1,	loop_2075
	fbo	%fcc2,	loop_2076
	fbl,a	%fcc2,	loop_2077
	tge	%xcc,	0x2
loop_2075:
	srlx	%i4,	%o5,	%i6
loop_2076:
	fmuld8ulx16	%f11,	%f13,	%f22
loop_2077:
	sub	%o6,	0x1419,	%g4
	fabss	%f5,	%f29
	alignaddr	%g6,	%o2,	%i2
	fnors	%f0,	%f26,	%f5
	alignaddrl	%g1,	%i5,	%g5
	fmovsg	%xcc,	%f25,	%f25
	and	%l0,	0x135C,	%o4
	lduw	[%l7 + 0x7C],	%g2
	movcc	%icc,	%i7,	%o7
	fbul,a	%fcc1,	loop_2078
	stw	%o3,	[%l7 + 0x70]
	mulscc	%l4,	0x1D98,	%o0
	smulcc	%i3,	0x12C7,	%l3
loop_2078:
	edge8n	%l1,	%g7,	%l2
	nop
	setx	loop_2079,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movgu	%xcc,	%l5,	%l6
	sir	0x0FBF
	edge32	%i1,	%i0,	%o1
loop_2079:
	bleu,a,pt	%icc,	loop_2080
	umul	%g3,	%i4,	%i6
	tgu	%icc,	0x2
	swap	[%l7 + 0x0C],	%o5
loop_2080:
	subccc	%g4,	%g6,	%o2
	and	%o6,	%i2,	%i5
	tg	%xcc,	0x4
	edge16n	%g5,	%g1,	%o4
	sra	%l0,	0x0C,	%i7
	umulcc	%g2,	%o3,	%l4
	add	%l7,	0x10,	%l6
	wr	%g0,	0x10,	%asi
	casxa	[%l6] %asi,	%o7,	%o0
	sll	%l3,	0x15,	%i3
	bcc,a,pt	%icc,	loop_2081
	taddcctv	%g7,	%l2,	%l5
	fandnot2	%f24,	%f8,	%f16
	nop
	setx	loop_2082,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_2081:
	edge8n	%l6,	%i1,	%l1
	movcs	%icc,	%o1,	%i0
	fxors	%f21,	%f4,	%f27
loop_2082:
	tge	%xcc,	0x7
	wr	%g0,	0x19,	%asi
	stda	%i4,	[%l7 + 0x30] %asi
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbug,a	%fcc3,	loop_2083
	bl,a,pt	%xcc,	loop_2084
	lduw	[%l7 + 0x18],	%g3
	fandnot2s	%f15,	%f5,	%f17
loop_2083:
	fzero	%f26
loop_2084:
	fmovdcs	%xcc,	%f23,	%f25
	fmovrslez	%o5,	%f14,	%f12
	fpsub32s	%f11,	%f25,	%f11
	fcmpes	%fcc1,	%f20,	%f29
	fmovscs	%icc,	%f24,	%f17
	flush	%l7 + 0x3C
	fpsub16	%f22,	%f12,	%f0
	tl	%icc,	0x7
	bvs	%xcc,	loop_2085
	tvs	%xcc,	0x6
	move	%xcc,	%g4,	%i6
	andncc	%o2,	%g6,	%o6
loop_2085:
	fpack32	%f16,	%f26,	%f26
	te	%icc,	0x4
	ldsb	[%l7 + 0x16],	%i5
	st	%f3,	[%l7 + 0x10]
	fcmped	%fcc3,	%f18,	%f8
	andcc	%g5,	0x130E,	%g1
	swap	[%l7 + 0x48],	%i2
	tvc	%icc,	0x1
	sllx	%o4,	0x1A,	%i7
	fmovsvc	%icc,	%f14,	%f1
	tl	%xcc,	0x1
	stw	%l0,	[%l7 + 0x0C]
	edge16l	%g2,	%o3,	%l4
	fpadd32s	%f14,	%f24,	%f9
	bcs	loop_2086
	movvc	%icc,	%o0,	%o7
	fpadd32	%f8,	%f8,	%f28
	swap	[%l7 + 0x74],	%l3
loop_2086:
	array8	%g7,	%l2,	%l5
	tleu	%icc,	0x7
	movrne	%i3,	%i1,	%l6
	tne	%icc,	0x0
	addccc	%l1,	%o1,	%i0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addcc	%g3,	0x1E00,	%i4
	ldsw	[%l7 + 0x5C],	%o5
	fnot1s	%f20,	%f15
	fbue	%fcc0,	loop_2087
	fmovsne	%xcc,	%f29,	%f15
	and	%g4,	%i6,	%o2
	be	%icc,	loop_2088
loop_2087:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldx	[%l7 + 0x28],	%o6
	or	%i5,	%g6,	%g5
loop_2088:
	andncc	%i2,	%o4,	%i7
	movgu	%xcc,	%l0,	%g2
	wr	%g0,	0x81,	%asi
	lduha	[%l7 + 0x72] %asi,	%o3
	mulscc	%l4,	%g1,	%o0
	xnorcc	%l3,	0x135F,	%g7
	orcc	%o7,	%l5,	%l2
	edge8ln	%i1,	%i3,	%l1
	popc	%l6,	%i0
	ta	%icc,	0x5
	fbule,a	%fcc2,	loop_2089
	tle	%icc,	0x7
	xnorcc	%o1,	%i4,	%o5
	fble	%fcc2,	loop_2090
loop_2089:
	movrlez	%g4,	%i6,	%g3
	fblg,a	%fcc2,	loop_2091
	fbu,a	%fcc1,	loop_2092
loop_2090:
	udivx	%o6,	0x0489,	%o2
	movvs	%icc,	%g6,	%i5
loop_2091:
	edge16	%g5,	%i2,	%o4
loop_2092:
	nop
	set	0x08, %l5
	ldsb	[%l7 + %l5],	%i7
	srlx	%g2,	0x03,	%o3
	fbe,a	%fcc3,	loop_2093
	andn	%l4,	0x0B17,	%l0
	te	%icc,	0x2
	srax	%g1,	0x05,	%o0
loop_2093:
	movre	%l3,	0x100,	%g7
	add	%l7,	0x34,	%l6
	wr	%g0,	0x19,	%asi
	lda	[%l6] %asi,	%o7
	casa	[%l6] %asi,	%o7,	%l2
	fsrc2	%f20,	%f12
	tl	%xcc,	0x4
	fpsub32	%f18,	%f4,	%f30
	movcs	%icc,	%l5,	%i1
	bn,a	loop_2094
	edge32ln	%i3,	%l6,	%l1
	ldsw	[%l7 + 0x58],	%i0
	fmovdcc	%xcc,	%f8,	%f16
loop_2094:
	udivcc	%o1,	0x1019,	%i4
	tcs	%icc,	0x5
	movcs	%icc,	%o5,	%g4
	edge16	%i6,	%o6,	%g3
	nop
	setx	loop_2095,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movn	%xcc,	%g6,	%o2
	tleu	%xcc,	0x4
	fnand	%f6,	%f2,	%f12
loop_2095:
	srax	%g5,	0x09,	%i2
	fblg	%fcc1,	loop_2096
	st	%f16,	[%l7 + 0x08]
	movn	%xcc,	%i5,	%i7
	bg,a	%xcc,	loop_2097
loop_2096:
	array8	%g2,	%o3,	%l4
	sethi	0x05CC,	%l0
	xorcc	%g1,	%o4,	%l3
loop_2097:
	and	%o0,	%o7,	%l2
	array16	%g7,	%l5,	%i3
	fabss	%f16,	%f6
	fmovse	%icc,	%f24,	%f24
	taddcctv	%l6,	%i1,	%i0
	tvc	%xcc,	0x6
	ldd	[%l7 + 0x08],	%f10
	edge8ln	%l1,	%o1,	%i4
	mova	%icc,	%o5,	%g4
	bgu,pt	%icc,	loop_2098
	tle	%xcc,	0x2
	tvc	%icc,	0x7
	orcc	%i6,	0x1166,	%o6
loop_2098:
	nop
	set	0x0A, %i7
	lduba	[%l7 + %i7] 0x10,	%g3
	fmovsn	%xcc,	%f28,	%f11
	fbo,a	%fcc2,	loop_2099
	fmuld8sux16	%f16,	%f25,	%f22
	bge,a,pn	%xcc,	loop_2100
	fxors	%f27,	%f10,	%f14
loop_2099:
	xnor	%g6,	%o2,	%i2
	faligndata	%f22,	%f18,	%f12
loop_2100:
	movrne	%i5,	%g5,	%i7
	fmovsg	%xcc,	%f30,	%f22
	srax	%o3,	0x04,	%l4
	tge	%icc,	0x3
	wr	%g0,	0x18,	%asi
	stxa	%g2,	[%l7 + 0x30] %asi
	fnegd	%f20,	%f14
	sub	%l0,	0x0ED7,	%o4
	edge8ln	%l3,	%g1,	%o7
	fornot1	%f26,	%f28,	%f22
	srax	%l2,	0x1D,	%o0
	fmuld8ulx16	%f19,	%f13,	%f14
	array8	%g7,	%l5,	%i3
	addccc	%l6,	%i0,	%i1
	set	0x38, %o0
	ldxa	[%g0 + %o0] 0x4f,	%o1
	addcc	%l1,	0x10D3,	%i4
	set	0x73, %o7
	lduba	[%l7 + %o7] 0x10,	%o5
	wr	%g0,	0x81,	%asi
	ldstuba	[%l7 + 0x6B] %asi,	%g4
	edge32l	%o6,	%g3,	%g6
	subcc	%o2,	0x0080,	%i6
	subc	%i5,	0x063A,	%g5
	fcmpeq16	%f24,	%f30,	%i7
	fcmpne32	%f20,	%f30,	%o3
	addccc	%l4,	%g2,	%l0
	add	%i2,	0x0956,	%l3
	set	0x50, %l6
	ldda	[%l7 + %l6] 0x81,	%g0
	set	0x3A, %i4
	stba	%o7,	[%l7 + %i4] 0x18
	ldstub	[%l7 + 0x0B],	%o4
	lduw	[%l7 + 0x40],	%o0
	wr	%g0,	0x04,	%asi
	ldstuba	[%l7 + 0x46] %asi,	%g7
	taddcc	%l5,	%l2,	%l6
	movre	%i3,	0x391,	%i0
	or	%o1,	0x1900,	%l1
	movg	%icc,	%i4,	%o5
	fmovsvc	%xcc,	%f29,	%f0
	tsubcctv	%g4,	%i1,	%o6
	stb	%g6,	[%l7 + 0x21]
	movrlez	%g3,	%i6,	%i5
	sdivx	%o2,	0x05E1,	%g5
	set	0x40, %o5
	prefetcha	[%l7 + %o5] 0x10,	 0x3
	smulcc	%o3,	%g2,	%l4
	ble	%xcc,	loop_2101
	movcc	%xcc,	%l0,	%i2
	array16	%l3,	%g1,	%o4
	tge	%xcc,	0x4
loop_2101:
	edge32n	%o7,	%g7,	%l5
	udivx	%l2,	0x0A37,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l7 + 0x60] %asi,	%o0
	movrlz	%i3,	%i0,	%l1
	sra	%i4,	0x07,	%o5
	edge16n	%o1,	%g4,	%o6
	siam	0x5
	tleu	%icc,	0x3
	be,a	%xcc,	loop_2102
	array16	%i1,	%g6,	%i6
	bpos,pn	%xcc,	loop_2103
	edge8ln	%g3,	%i5,	%o2
loop_2102:
	nop
	wr	%g0,	0x04,	%asi
	ldsha	[%l7 + 0x28] %asi,	%i7
loop_2103:
	fmovsne	%xcc,	%f4,	%f13
	movgu	%xcc,	%g5,	%g2
	tvs	%icc,	0x7
	tsubcctv	%l4,	0x01DF,	%o3
	add	%l7,	0x2C,	%l6
	wr	%g0,	0x11,	%asi
	lda	[%l6] %asi,	%l0
	casa	[%l6] %asi,	%l0,	%l3
	xor	%g1,	%i2,	%o4
	pdist	%f8,	%f2,	%f20
	edge16	%g7,	%l5,	%l2
	movg	%icc,	%l6,	%o7
	tle	%icc,	0x0
	subcc	%o0,	0x1934,	%i3
	subc	%l1,	%i0,	%o5
	sdiv	%o1,	0x1C61,	%i4
	fabsd	%f16,	%f26
	subcc	%o6,	0x078A,	%g4
	array8	%g6,	%i6,	%i1
	sub	%i5,	0x1D0B,	%g3
	fandnot2	%f30,	%f10,	%f22
	sdivx	%i7,	0x0AB4,	%g5
	array32	%g2,	%o2,	%l4
	tg	%xcc,	0x7
	fmovrsgez	%l0,	%f9,	%f0
	fnand	%f10,	%f24,	%f26
	movleu	%xcc,	%o3,	%g1
	fmovsle	%xcc,	%f18,	%f4
	tge	%xcc,	0x6
	fnot2	%f16,	%f30
	movcs	%xcc,	%l3,	%i2
	brz	%o4,	loop_2104
	sdivx	%l5,	0x07BD,	%g7
	subcc	%l6,	0x199E,	%l2
	mulscc	%o7,	%i3,	%o0
loop_2104:
	nop
	setx	loop_2105,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fpsub32s	%f16,	%f8,	%f25
	tne	%icc,	0x7
	fbule,a	%fcc2,	loop_2106
loop_2105:
	nop
	set	0x52, %g5
	sth	%l1,	[%l7 + %g5]
	movcc	%icc,	%i0,	%o1
	fpack32	%f6,	%f4,	%f22
loop_2106:
	fpsub32	%f28,	%f4,	%f20
	fbule,a	%fcc2,	loop_2107
	fmovrdlz	%i4,	%f0,	%f10
	bcs,a	loop_2108
	mulscc	%o5,	%g4,	%g6
loop_2107:
	bn	loop_2109
	fmovdvs	%xcc,	%f28,	%f20
loop_2108:
	array16	%i6,	%i1,	%o6
	movrgez	%g3,	0x120,	%i7
loop_2109:
	fbul	%fcc2,	loop_2110
	ldd	[%l7 + 0x78],	%f6
	sethi	0x0CA0,	%g5
	bvs	loop_2111
loop_2110:
	ldx	[%l7 + 0x50],	%g2
	sdiv	%i5,	0x0372,	%l4
	st	%f13,	[%l7 + 0x60]
loop_2111:
	fbn,a	%fcc3,	loop_2112
	ldx	[%l7 + 0x30],	%l0
	movn	%xcc,	%o3,	%o2
	movrgz	%g1,	0x205,	%i2
loop_2112:
	te	%xcc,	0x0
	flush	%l7 + 0x20
	ldub	[%l7 + 0x25],	%l3
	fmovrsgz	%l5,	%f3,	%f30
	fbul	%fcc0,	loop_2113
	andcc	%g7,	0x09A1,	%l6
	movgu	%icc,	%l2,	%o4
	ta	%xcc,	0x6
loop_2113:
	fnot1	%f20,	%f24
	fble	%fcc2,	loop_2114
	sll	%i3,	0x11,	%o7
	edge32l	%o0,	%l1,	%i0
	fandnot1s	%f8,	%f19,	%f27
loop_2114:
	movvs	%icc,	%o1,	%o5
	pdist	%f18,	%f14,	%f4
	set	0x50, %o4
	ldxa	[%l7 + %o4] 0x0c,	%g4
	orncc	%i4,	0x064D,	%g6
	fcmpes	%fcc1,	%f1,	%f9
	xnorcc	%i6,	%o6,	%i1
	movrlz	%g3,	%i7,	%g5
	orn	%i5,	0x13AD,	%l4
	umulcc	%g2,	0x1DCF,	%o3
	andncc	%l0,	%g1,	%o2
	sir	0x15E8
	movl	%icc,	%i2,	%l5
	tge	%icc,	0x5
	umul	%l3,	0x0D15,	%g7
	bgu,a,pn	%icc,	loop_2115
	orcc	%l2,	%l6,	%o4
	prefetch	[%l7 + 0x5C],	 0x1
	edge16	%i3,	%o0,	%l1
loop_2115:
	brlez,a	%o7,	loop_2116
	andn	%o1,	0x0017,	%o5
	udivcc	%g4,	0x162F,	%i0
	orn	%i4,	%i6,	%o6
loop_2116:
	fmovdpos	%xcc,	%f21,	%f20
	subccc	%i1,	0x168C,	%g6
	bneg,pt	%xcc,	loop_2117
	movrgez	%i7,	%g5,	%i5
	movl	%icc,	%l4,	%g3
	bcs,pn	%xcc,	loop_2118
loop_2117:
	addc	%o3,	%l0,	%g1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andncc	%g2,	%i2,	%l5
loop_2118:
	addccc	%o2,	%g7,	%l3
	fmovscc	%icc,	%f8,	%f14
	ble,pt	%icc,	loop_2119
	xorcc	%l6,	%l2,	%i3
	add	%o0,	%l1,	%o7
	movcs	%xcc,	%o1,	%o4
loop_2119:
	smulcc	%g4,	0x0394,	%i0
	fmovdn	%icc,	%f26,	%f23
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tge	%icc,	0x7
	ba,pn	%xcc,	loop_2120
	subccc	%i4,	%i6,	%o5
	set	0x18, %g6
	ldstuba	[%l7 + %g6] 0x0c,	%i1
loop_2120:
	orn	%o6,	0x0883,	%i7
	smul	%g6,	0x00E1,	%i5
	pdist	%f0,	%f16,	%f26
	stbar
	sra	%l4,	%g3,	%o3
	alignaddrl	%l0,	%g1,	%g2
	andn	%g5,	%i2,	%o2
	set	0x40, %l1
	prefetcha	[%l7 + %l1] 0x89,	 0x0
	tvc	%xcc,	0x7
	brgz,a	%l5,	loop_2121
	tsubcctv	%l3,	%l2,	%l6
	wr	%g0,	0x18,	%asi
	stba	%o0,	[%l7 + 0x58] %asi
loop_2121:
	movl	%icc,	%i3,	%l1
	fnot2s	%f27,	%f5
	edge32l	%o7,	%o1,	%g4
	tl	%icc,	0x2
	orn	%i0,	0x1E95,	%i4
	edge32n	%o4,	%i6,	%i1
	fmovdcc	%icc,	%f6,	%f24
	xor	%o6,	0x1BB5,	%i7
	fble,a	%fcc3,	loop_2122
	fmovsg	%xcc,	%f9,	%f4
	addccc	%o5,	%i5,	%l4
	fbe	%fcc2,	loop_2123
loop_2122:
	fmovd	%f16,	%f2
	movre	%g3,	%g6,	%l0
	bvc,a	%xcc,	loop_2124
loop_2123:
	sir	0x0A31
	fbu	%fcc3,	loop_2125
	sll	%o3,	%g2,	%g5
loop_2124:
	addcc	%g1,	0x152B,	%i2
	smulcc	%g7,	0x00A2,	%o2
loop_2125:
	fsrc1	%f10,	%f8
	edge32	%l5,	%l3,	%l6
	add	%l7,	0x50,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%o0
	casa	[%l6] %asi,	%o0,	%i3
	move	%xcc,	%l1,	%l2
	fands	%f6,	%f23,	%f27
	fmovdvc	%icc,	%f31,	%f17
	xor	%o7,	0x1C74,	%o1
	addccc	%i0,	%i4,	%g4
	brz	%i6,	loop_2126
	tleu	%xcc,	0x1
	ldsb	[%l7 + 0x08],	%o4
	taddcc	%i1,	%o6,	%o5
loop_2126:
	nop
	set	0x44, %i3
	swapa	[%l7 + %i3] 0x19,	%i5
	movneg	%xcc,	%i7,	%l4
	sllx	%g6,	%g3,	%o3
	be,pt	%xcc,	loop_2127
	fbuge,a	%fcc3,	loop_2128
	movrlz	%l0,	%g2,	%g1
	fbue	%fcc1,	loop_2129
loop_2127:
	andn	%g5,	0x0002,	%i2
loop_2128:
	edge16n	%g7,	%l5,	%o2
	stb	%l3,	[%l7 + 0x25]
loop_2129:
	edge32	%l6,	%i3,	%l1
	andn	%l2,	%o7,	%o1
	set	0x38, %o1
	ldsba	[%l7 + %o1] 0x15,	%o0
	udivcc	%i0,	0x0953,	%g4
	srl	%i4,	0x07,	%o4
	movvc	%icc,	%i6,	%i1
	fbe	%fcc3,	loop_2130
	udivx	%o6,	0x1657,	%i5
	movneg	%xcc,	%o5,	%l4
	xor	%i7,	%g3,	%g6
loop_2130:
	fmovrdgez	%o3,	%f28,	%f18
	tcs	%icc,	0x3
	movre	%g2,	%l0,	%g5
	bg,a	loop_2131
	sllx	%g1,	0x0D,	%g7
	fbug,a	%fcc1,	loop_2132
	tvs	%icc,	0x0
loop_2131:
	orncc	%l5,	0x1BD3,	%i2
	ldd	[%l7 + 0x18],	%l2
loop_2132:
	movvs	%xcc,	%l6,	%o2
	andncc	%i3,	%l2,	%l1
	fbo	%fcc2,	loop_2133
	movleu	%xcc,	%o7,	%o1
	set	0x70, %g2
	swapa	[%l7 + %g2] 0x04,	%o0
loop_2133:
	fmovsvc	%xcc,	%f13,	%f9
	ba	%xcc,	loop_2134
	bcs,a	loop_2135
	srax	%i0,	%i4,	%o4
	taddcctv	%g4,	0x0123,	%i6
loop_2134:
	array32	%i1,	%i5,	%o5
loop_2135:
	nop
	set	0x60, %i0
	stda	%l4,	[%l7 + %i0] 0x80
	nop
	setx	loop_2136,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fcmple32	%f6,	%f8,	%o6
	alignaddr	%g3,	%i7,	%o3
	ldstub	[%l7 + 0x4A],	%g6
loop_2136:
	taddcc	%g2,	0x1CC3,	%g5
	fmovde	%icc,	%f21,	%f31
	andncc	%l0,	%g7,	%g1
	bvc,a	%icc,	loop_2137
	fornot2	%f10,	%f20,	%f16
	call	loop_2138
	fbue,a	%fcc0,	loop_2139
loop_2137:
	xorcc	%i2,	%l5,	%l6
	taddcc	%l3,	0x0ACF,	%i3
loop_2138:
	ldsh	[%l7 + 0x22],	%o2
loop_2139:
	sdiv	%l2,	0x0937,	%o7
	taddcctv	%o1,	0x0F35,	%o0
	move	%icc,	%l1,	%i0
	andncc	%i4,	%g4,	%o4
	edge8ln	%i1,	%i6,	%i5
	fmovs	%f23,	%f15
	srax	%l4,	0x03,	%o6
	fmovdcc	%icc,	%f14,	%f9
	std	%o4,	[%l7 + 0x30]
	faligndata	%f18,	%f22,	%f18
	tge	%icc,	0x3
	fmovsl	%icc,	%f29,	%f31
	tneg	%xcc,	0x0
	fornot1s	%f0,	%f29,	%f21
	tcc	%icc,	0x1
	bleu,a	loop_2140
	subcc	%i7,	%g3,	%o3
	fcmple16	%f6,	%f28,	%g2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2140:
	umul	%g6,	0x0E68,	%g5
	tgu	%xcc,	0x2
	mova	%icc,	%l0,	%g7
	fbo	%fcc3,	loop_2141
	edge8n	%i2,	%g1,	%l6
	movge	%xcc,	%l5,	%i3
	addc	%o2,	%l2,	%o7
loop_2141:
	ldx	[%l7 + 0x10],	%o1
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
	membar	0x18
	tvs	%xcc,	0x0
	alignaddr	%o0,	%l3,	%i0
	swap	[%l7 + 0x4C],	%l1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x81,	%asi
	ldswa	[%l7 + 0x7C] %asi,	%g4
	fbul,a	%fcc3,	loop_2142
	ta	%icc,	0x5
	movcc	%icc,	%i4,	%o4
	fbu	%fcc0,	loop_2143
loop_2142:
	addc	%i1,	0x1DAA,	%i6
	wr	%g0,	0x80,	%asi
	sta	%f6,	[%l7 + 0x38] %asi
loop_2143:
	array16	%i5,	%o6,	%o5
	taddcc	%l4,	%g3,	%i7
	popc	%g2,	%o3
	edge16n	%g6,	%g5,	%g7
	movre	%l0,	0x04B,	%g1
	fmovdcs	%icc,	%f28,	%f7
	fornot2	%f0,	%f24,	%f18
	addccc	%l6,	0x1667,	%i2
	fnot1	%f0,	%f18
	sdivx	%i3,	0x0F22,	%o2
	movvs	%icc,	%l2,	%l5
	fmuld8sux16	%f3,	%f11,	%f24
	fabsd	%f18,	%f12
	tcs	%icc,	0x3
	sll	%o1,	0x0E,	%o7
	fbu,a	%fcc0,	loop_2144
	movrlz	%o0,	0x20D,	%l3
	nop
	setx	loop_2145,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	andncc	%i0,	%g4,	%i4
loop_2144:
	fpsub32	%f4,	%f10,	%f6
	wr	%g0,	0x80,	%asi
	ldsba	[%l7 + 0x0A] %asi,	%o4
loop_2145:
	fmovrdlz	%i1,	%f12,	%f8
	fbule,a	%fcc0,	loop_2146
	tl	%xcc,	0x6
	tpos	%icc,	0x4
	fzeros	%f10
loop_2146:
	mulx	%l1,	0x190E,	%i6
	fmovsvc	%icc,	%f22,	%f0
	movcc	%xcc,	%o6,	%o5
	fmovscc	%xcc,	%f4,	%f2
	xnorcc	%l4,	%i5,	%g3
	tl	%xcc,	0x6
	for	%f8,	%f16,	%f12
	movcc	%xcc,	%i7,	%o3
	edge8	%g2,	%g5,	%g7
	subcc	%l0,	%g6,	%l6
	movn	%xcc,	%g1,	%i3
	ld	[%l7 + 0x6C],	%f30
	fpsub32	%f16,	%f20,	%f24
	tpos	%xcc,	0x1
	fbu,a	%fcc1,	loop_2147
	fmovrse	%o2,	%f16,	%f18
	sdiv	%i2,	0x1983,	%l2
	tl	%xcc,	0x7
loop_2147:
	nop
	wr	%g0,	0x10,	%asi
	sta	%f1,	[%l7 + 0x34] %asi
	tneg	%icc,	0x6
	movgu	%xcc,	%l5,	%o1
	udivcc	%o7,	0x01D4,	%l3
	ldsw	[%l7 + 0x5C],	%i0
	fbue,a	%fcc3,	loop_2148
	sdiv	%g4,	0x0FD6,	%i4
	fand	%f18,	%f16,	%f24
	smul	%o0,	0x1670,	%o4
loop_2148:
	sub	%l1,	0x0872,	%i6
	movn	%xcc,	%i1,	%o6
	wr	%g0,	0x0c,	%asi
	lda	[%l7 + 0x24] %asi,	%f28
	wr	%g0,	0x19,	%asi
	lduwa	[%l7 + 0x1C] %asi,	%o5
	tpos	%icc,	0x7
	fnegs	%f7,	%f19
	fnor	%f4,	%f18,	%f20
	sethi	0x05C9,	%i5
	fmovrdgz	%l4,	%f24,	%f24
	fexpand	%f28,	%f8
	ldsh	[%l7 + 0x72],	%g3
	addcc	%i7,	%g2,	%g5
	ta	%icc,	0x1
	or	%o3,	0x0DB4,	%l0
	andcc	%g7,	0x01A2,	%g6
	fblg,a	%fcc0,	loop_2149
	fandnot1s	%f26,	%f21,	%f4
	fxnor	%f26,	%f26,	%f8
	bgu,a	loop_2150
loop_2149:
	sub	%l6,	%g1,	%i3
	sethi	0x1069,	%o2
	fsrc1s	%f10,	%f27
loop_2150:
	movvs	%xcc,	%l2,	%l5
	fmovrsgz	%i2,	%f12,	%f13
	fnors	%f30,	%f29,	%f28
	ldsb	[%l7 + 0x36],	%o1
	fnot1s	%f27,	%f2
	tcc	%icc,	0x5
	sllx	%o7,	%i0,	%l3
	tgu	%xcc,	0x2
	fmovde	%icc,	%f11,	%f17
	edge32l	%i4,	%o0,	%o4
	st	%f7,	[%l7 + 0x20]
	andn	%l1,	%g4,	%i6
	fmovsvs	%xcc,	%f22,	%f5
	wr	%g0,	0x81,	%asi
	ldxa	[%l7 + 0x30] %asi,	%i1
	movvs	%xcc,	%o5,	%o6
	nop
	setx	loop_2151,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	ldsb	[%l7 + 0x74],	%i5
	edge32	%g3,	%i7,	%g2
	tvc	%icc,	0x7
loop_2151:
	fbug,a	%fcc3,	loop_2152
	fnegd	%f0,	%f24
	fmovdpos	%icc,	%f31,	%f11
	subcc	%l4,	0x1773,	%g5
loop_2152:
	movn	%icc,	%o3,	%g7
	fsrc1s	%f20,	%f27
	bvs,a,pt	%icc,	loop_2153
	movneg	%xcc,	%l0,	%l6
	udivcc	%g1,	0x1D1C,	%g6
	movrlez	%o2,	%l2,	%l5
loop_2153:
	fmovrsne	%i3,	%f28,	%f27
	tg	%icc,	0x4
	udiv	%i2,	0x048C,	%o1
	fornot2	%f8,	%f12,	%f26
	fsrc1s	%f10,	%f27
	sir	0x1DB0
	fmovrsgz	%o7,	%f10,	%f30
	fbug,a	%fcc1,	loop_2154
	fbuge,a	%fcc3,	loop_2155
	bleu,pt	%xcc,	loop_2156
	sub	%i0,	%i4,	%l3
loop_2154:
	sir	0x1EAE
loop_2155:
	fxnor	%f2,	%f2,	%f2
loop_2156:
	tvs	%xcc,	0x0
	fsrc2	%f14,	%f30
	fmovdg	%xcc,	%f25,	%f2
	fmovda	%xcc,	%f18,	%f19
	fxnor	%f28,	%f2,	%f12
	pdist	%f6,	%f12,	%f12
	membar	0x14
	fbl,a	%fcc1,	loop_2157
	ldd	[%l7 + 0x38],	%f4
	fmul8sux16	%f2,	%f8,	%f2
	ba,pt	%xcc,	loop_2158
loop_2157:
	ld	[%l7 + 0x08],	%f8
	brlz,a	%o0,	loop_2159
	udivx	%l1,	0x19C1,	%o4
loop_2158:
	xor	%g4,	0x1172,	%i1
	andn	%i6,	%o5,	%o6
loop_2159:
	brlz	%g3,	loop_2160
	fbul	%fcc3,	loop_2161
	brz,a	%i5,	loop_2162
	movneg	%icc,	%g2,	%i7
loop_2160:
	edge8ln	%l4,	%g5,	%o3
loop_2161:
	edge32l	%l0,	%g7,	%g1
loop_2162:
	edge32n	%l6,	%g6,	%l2
	mulx	%l5,	%i3,	%o2
	movrlez	%i2,	%o1,	%o7
	wr	%g0,	0x23,	%asi
	stxa	%i4,	[%l7 + 0x78] %asi
	membar	#Sync
	tleu	%icc,	0x3
	udivx	%l3,	0x023A,	%o0
	edge32ln	%l1,	%i0,	%g4
	tgu	%xcc,	0x2
	movcc	%xcc,	%o4,	%i6
	or	%i1,	%o5,	%o6
	bg,a,pn	%icc,	loop_2163
	fxor	%f6,	%f30,	%f30
	set	0x40, %i2
	swapa	[%l7 + %i2] 0x18,	%g3
loop_2163:
	fxnor	%f8,	%f12,	%f24
	lduh	[%l7 + 0x72],	%g2
	movg	%xcc,	%i5,	%i7
	swap	[%l7 + 0x70],	%g5
	fba	%fcc3,	loop_2164
	move	%xcc,	%o3,	%l0
	stw	%g7,	[%l7 + 0x14]
	smulcc	%l4,	%l6,	%g6
loop_2164:
	fmovsl	%icc,	%f5,	%f3
	tneg	%xcc,	0x1
	edge32	%l2,	%l5,	%i3
	udivcc	%g1,	0x051E,	%o2
	movrne	%i2,	0x3CA,	%o1
	edge8l	%o7,	%i4,	%o0
	fmovrslz	%l1,	%f6,	%f9
	edge32	%l3,	%g4,	%i0
	fmovdvc	%icc,	%f18,	%f8
	movcc	%icc,	%o4,	%i1
	array8	%i6,	%o5,	%g3
	fmovdge	%xcc,	%f28,	%f11
	be,a,pn	%icc,	loop_2165
	movpos	%xcc,	%o6,	%i5
	tvs	%icc,	0x5
	sdivcc	%g2,	0x110B,	%g5
loop_2165:
	fnot1s	%f29,	%f14
	tpos	%icc,	0x5
	set	0x50, %i1
	lduwa	[%l7 + %i1] 0x14,	%o3
	brgez	%i7,	loop_2166
	movn	%xcc,	%l0,	%g7
	bcc	%xcc,	loop_2167
	movrgez	%l4,	%g6,	%l2
loop_2166:
	movle	%icc,	%l5,	%l6
	brnz,a	%i3,	loop_2168
loop_2167:
	brnz,a	%o2,	loop_2169
	brz	%i2,	loop_2170
	orcc	%o1,	0x100E,	%g1
loop_2168:
	movvc	%xcc,	%o7,	%i4
loop_2169:
	tsubcc	%l1,	%o0,	%l3
loop_2170:
	edge32	%i0,	%g4,	%o4
	xnor	%i1,	0x0323,	%i6
	srl	%o5,	0x1E,	%g3
	umulcc	%o6,	0x1879,	%i5
	fexpand	%f22,	%f24
	sra	%g2,	%o3,	%g5
	edge8n	%i7,	%l0,	%l4
	add	%g7,	0x011E,	%g6
	bcs,a,pn	%xcc,	loop_2171
	fmovdcs	%xcc,	%f22,	%f15
	be,a	%icc,	loop_2172
	fabss	%f17,	%f13
loop_2171:
	std	%l4,	[%l7 + 0x48]
	fmovdneg	%icc,	%f28,	%f14
loop_2172:
	udiv	%l2,	0x14FC,	%i3
	or	%l6,	0x10E2,	%i2
	wr	%g0,	0x19,	%asi
	ldswa	[%l7 + 0x28] %asi,	%o1
	brgez	%g1,	loop_2173
	fcmpd	%fcc3,	%f8,	%f24
	andn	%o7,	0x10DB,	%i4
	fmovsg	%xcc,	%f2,	%f14
loop_2173:
	fbug,a	%fcc0,	loop_2174
	fmovdvs	%icc,	%f20,	%f7
	fnot2s	%f26,	%f13
	sethi	0x0F6E,	%o2
loop_2174:
	movrne	%o0,	0x0C0,	%l1
	fzero	%f10
	fmovrsgz	%l3,	%f0,	%f30
	movn	%icc,	%i0,	%o4
	subccc	%g4,	0x1FE0,	%i6
	fba	%fcc0,	loop_2175
	addcc	%o5,	%g3,	%i1
	alignaddrl	%i5,	%g2,	%o3
	nop
	setx loop_2176, %l0, %l1
	jmpl %l1, %g5
loop_2175:
	orncc	%i7,	0x0D8F,	%l0
	fmovrsne	%l4,	%f14,	%f27
	ta	%icc,	0x1
loop_2176:
	tpos	%xcc,	0x3
	set	0x2A, %g7
	stha	%g7,	[%l7 + %g7] 0x0c
	lduw	[%l7 + 0x1C],	%o6
	fbue	%fcc1,	loop_2177
	fmovsvs	%icc,	%f18,	%f6
	sllx	%l5,	0x0F,	%l2
	move	%icc,	%i3,	%l6
loop_2177:
	fblg,a	%fcc1,	loop_2178
	udivcc	%g6,	0x06F3,	%o1
	alignaddrl	%i2,	%g1,	%o7
	movg	%icc,	%o2,	%i4
loop_2178:
	edge16ln	%l1,	%l3,	%o0
	edge16l	%o4,	%g4,	%i6
	fbug,a	%fcc3,	loop_2179
	stx	%i0,	[%l7 + 0x40]
	add	%g3,	%o5,	%i5
	xnor	%g2,	%i1,	%o3
loop_2179:
	fandnot2s	%f25,	%f2,	%f1
	subc	%g5,	%i7,	%l4
	fmovse	%xcc,	%f18,	%f26
	sllx	%l0,	%o6,	%l5
	orn	%g7,	%i3,	%l6
	taddcc	%l2,	%g6,	%o1
	movvc	%icc,	%g1,	%o7
	ldsb	[%l7 + 0x4E],	%o2
	smulcc	%i4,	%l1,	%l3
	ldsh	[%l7 + 0x3E],	%i2
	fmovspos	%xcc,	%f28,	%f3
	sdiv	%o4,	0x0238,	%o0
	movrgez	%i6,	0x23F,	%g4
	tl	%icc,	0x7
	bl,a	loop_2180
	fmuld8ulx16	%f26,	%f5,	%f0
	move	%xcc,	%i0,	%o5
	movre	%g3,	%g2,	%i5
loop_2180:
	movcs	%xcc,	%i1,	%o3
	tgu	%xcc,	0x1
	movrgez	%g5,	%l4,	%i7
	st	%f20,	[%l7 + 0x70]
	brnz,a	%l0,	loop_2181
	udiv	%l5,	0x1BEF,	%g7
	bpos	loop_2182
	sdiv	%i3,	0x152A,	%l6
loop_2181:
	fone	%f18
	ble,pt	%icc,	loop_2183
loop_2182:
	movge	%xcc,	%o6,	%g6
	wr	%g0,	0x80,	%asi
	lda	[%l7 + 0x40] %asi,	%f21
loop_2183:
	or	%o1,	0x1C85,	%g1
	movrne	%o7,	%l2,	%o2
	addc	%i4,	0x139C,	%l3
	st	%f28,	[%l7 + 0x54]
	sra	%i2,	%o4,	%l1
	wr	%g0,	0x80,	%asi
	swapa	[%l7 + 0x58] %asi,	%o0
	taddcc	%i6,	%g4,	%i0
	ldsb	[%l7 + 0x0F],	%o5
	fmovs	%f28,	%f13
	fmovsne	%icc,	%f11,	%f26
	tg	%icc,	0x2
	wr	%g0,	0x89,	%asi
	lduha	[%l7 + 0x6E] %asi,	%g2
	ld	[%l7 + 0x7C],	%f29
	te	%xcc,	0x3
	fmovdpos	%xcc,	%f31,	%f28
	set	0x38, %l2
	ldxa	[%g0 + %l2] 0x4f,	%i5
	sra	%i1,	0x07,	%g3
	fblg,a	%fcc2,	loop_2184
	ldsb	[%l7 + 0x67],	%o3
	nop
	setx loop_2185, %l0, %l1
	jmpl %l1, %l4
	orncc	%i7,	%g5,	%l0
loop_2184:
	ta	%icc,	0x5
	andcc	%g7,	%l5,	%l6
loop_2185:
	lduh	[%l7 + 0x58],	%o6
	mova	%icc,	%i3,	%o1
	edge8l	%g6,	%o7,	%l2
	fnegs	%f14,	%f26
	tsubcctv	%g1,	0x08C0,	%i4
	fmovdle	%xcc,	%f25,	%f13
	ld	[%l7 + 0x60],	%f3
	bgu,a	loop_2186
	movcc	%icc,	%o2,	%l3
	and	%o4,	%i2,	%o0
	fmovsneg	%icc,	%f7,	%f27
loop_2186:
	popc	%i6,	%g4
	subccc	%i0,	%o5,	%l1
	movl	%xcc,	%i5,	%i1
	fbue,a	%fcc2,	loop_2187
	bleu,pn	%xcc,	loop_2188
	movrne	%g2,	%o3,	%g3
	fmul8ulx16	%f2,	%f6,	%f8
loop_2187:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2188:
	bleu	loop_2189
	nop
	set	0x2C, %o3
	ldub	[%l7 + %o3],	%i7
	movge	%icc,	%g5,	%l0
	edge32l	%l4,	%l5,	%g7
loop_2189:
	membar	0x45
	movre	%o6,	%i3,	%l6
	fornot2	%f14,	%f8,	%f26
	tn	%icc,	0x1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bge,a,pn	%xcc,	loop_2190
	tvc	%xcc,	0x4
	wr	%g0,	0x80,	%asi
	ldda	[%l7 + 0x60] %asi,	%g6
loop_2190:
	movneg	%xcc,	%o7,	%l2
	mulscc	%g1,	0x0E77,	%i4
	fmovdvc	%xcc,	%f7,	%f5
	fmovrdne	%o2,	%f16,	%f30
	and	%o1,	0x07DF,	%l3
	edge16	%o4,	%o0,	%i2
	faligndata	%f10,	%f24,	%f10
	mova	%icc,	%g4,	%i6
	fmovdg	%icc,	%f11,	%f25
	fmovrslz	%o5,	%f10,	%f13
	fexpand	%f19,	%f8
	fpadd32	%f0,	%f4,	%f8
	fbue,a	%fcc0,	loop_2191
	for	%f6,	%f0,	%f28
	xnor	%l1,	%i0,	%i5
	fbg,a	%fcc1,	loop_2192
loop_2191:
	fxors	%f9,	%f20,	%f11
	fblg	%fcc3,	loop_2193
	std	%i0,	[%l7 + 0x20]
loop_2192:
	tvc	%icc,	0x4
	mulscc	%o3,	0x1990,	%g3
loop_2193:
	fmovse	%icc,	%f28,	%f29
	edge8ln	%g2,	%i7,	%l0
	movvc	%icc,	%l4,	%g5
	umul	%l5,	0x02DF,	%o6
	movneg	%icc,	%i3,	%g7
	andncc	%g6,	%o7,	%l2
	fbg	%fcc0,	loop_2194
	bleu,a	%xcc,	loop_2195
	tg	%xcc,	0x3
	edge32n	%g1,	%l6,	%i4
loop_2194:
	stw	%o2,	[%l7 + 0x54]
loop_2195:
	tcc	%icc,	0x7
	movrlez	%o1,	0x206,	%o4
	edge16	%l3,	%i2,	%g4
	orncc	%o0,	0x114F,	%i6
	edge32n	%o5,	%l1,	%i5
	set	0x38, %l3
	prefetcha	[%l7 + %l3] 0x18,	 0x0
	xorcc	%o3,	%g3,	%g2
	fmovdg	%icc,	%f2,	%f21
	udiv	%i7,	0x0D30,	%l0
	movre	%i1,	%g5,	%l5
	flush	%l7 + 0x0C
	fnegs	%f25,	%f29
	udiv	%o6,	0x049C,	%l4
	fmovsneg	%icc,	%f9,	%f31
	edge8	%i3,	%g6,	%o7
	udiv	%l2,	0x0B8C,	%g7
	fmovrdlz	%g1,	%f16,	%f2
	movcc	%xcc,	%l6,	%o2
	tn	%xcc,	0x2
	mulscc	%i4,	0x1F14,	%o4
	orncc	%l3,	0x0D82,	%i2
	fcmpes	%fcc1,	%f30,	%f6
	stbar
	faligndata	%f2,	%f10,	%f4
	fxnor	%f8,	%f20,	%f24
	popc	%o1,	%g4
	movneg	%icc,	%i6,	%o0
	fbo,a	%fcc0,	loop_2196
	array32	%l1,	%i5,	%i0
	fbe,a	%fcc0,	loop_2197
	ldub	[%l7 + 0x10],	%o5
loop_2196:
	edge32	%o3,	%g3,	%g2
	ble,a,pt	%xcc,	loop_2198
loop_2197:
	movge	%icc,	%i7,	%i1
	movpos	%icc,	%g5,	%l0
	movre	%o6,	0x300,	%l4
loop_2198:
	subcc	%l5,	%g6,	%i3
	wr	%g0,	0x81,	%asi
	ldswa	[%l7 + 0x5C] %asi,	%o7
	movre	%g7,	%l2,	%l6
	stbar
	tge	%xcc,	0x3
	edge32	%g1,	%o2,	%o4
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
	alignaddrl	%i4,	%i2,	%l3
	tg	%xcc,	0x6
	fcmpd	%fcc0,	%f14,	%f12
loop_2199:
	mova	%icc,	%g4,	%i6
	edge16n	%o0,	%l1,	%o1
	wr	%g0,	0x89,	%asi
	sta	%f28,	[%l7 + 0x6C] %asi
	edge16l	%i0,	%o5,	%i5
	movl	%xcc,	%g3,	%g2
	fmovsg	%icc,	%f7,	%f22
	xor	%o3,	0x05DB,	%i7
	fbu,a	%fcc0,	loop_2200
	fble,a	%fcc1,	loop_2201
	tg	%xcc,	0x2
	for	%f14,	%f16,	%f10
loop_2200:
	movge	%icc,	%i1,	%g5
loop_2201:
	edge32	%o6,	%l0,	%l4
	sllx	%g6,	%i3,	%l5
	orncc	%o7,	0x06CD,	%g7
	set	0x78, %l0
	ldswa	[%l7 + %l0] 0x81,	%l6
	prefetch	[%l7 + 0x40],	 0x0
	bge,a	loop_2202
	mulscc	%g1,	%l2,	%o4
	and	%o2,	%i2,	%l3
	or	%g4,	%i4,	%i6
loop_2202:
	nop
	set	0x75, %g3
	ldsb	[%l7 + %g3],	%l1
	smulcc	%o1,	%i0,	%o0
	fcmpne16	%f16,	%f30,	%i5
	movrne	%g3,	%o5,	%g2
	set	0x68, %g4
	lda	[%l7 + %g4] 0x81,	%f28
	srax	%o3,	0x0F,	%i7
	movcc	%xcc,	%g5,	%i1
	mulx	%l0,	0x1952,	%o6
	taddcctv	%g6,	%i3,	%l4
	bleu,pt	%icc,	loop_2203
	popc	%l5,	%o7
	tsubcctv	%l6,	0x02AE,	%g1
	te	%xcc,	0x7
loop_2203:
	fbe,a	%fcc0,	loop_2204
	fmovsg	%icc,	%f2,	%f11
	edge32n	%g7,	%l2,	%o4
	te	%icc,	0x1
loop_2204:
	tvc	%icc,	0x4
	fbul,a	%fcc0,	loop_2205
	mulx	%i2,	%l3,	%o2
	sdiv	%i4,	0x0187,	%i6
	brlz	%g4,	loop_2206
loop_2205:
	tcc	%icc,	0x6
	movpos	%xcc,	%l1,	%o1
	tvc	%icc,	0x3
loop_2206:
	array32	%i0,	%o0,	%g3
	bpos,a	%icc,	loop_2207
	edge32n	%i5,	%o5,	%o3
	bge,a,pt	%xcc,	loop_2208
	tle	%xcc,	0x4
loop_2207:
	fcmple16	%f2,	%f12,	%i7
	fmul8x16	%f28,	%f12,	%f10
loop_2208:
	tcs	%xcc,	0x3
	fbuge,a	%fcc0,	loop_2209
	addccc	%g2,	%g5,	%l0
	tleu	%xcc,	0x7
	bgu,a,pt	%xcc,	loop_2210
loop_2209:
	fcmple32	%f14,	%f0,	%i1
	tsubcctv	%g6,	0x12A3,	%o6
	srl	%l4,	0x07,	%i3
loop_2210:
	movgu	%xcc,	%l5,	%l6
	stx	%g1,	[%l7 + 0x70]
	edge8l	%o7,	%g7,	%o4
	set	0x08, %o2
	stda	%i2,	[%l7 + %o2] 0x2a
	membar	#Sync
	tsubcc	%l3,	0x0068,	%l2
	movgu	%icc,	%i4,	%i6
	movgu	%xcc,	%g4,	%l1
	edge32l	%o1,	%i0,	%o2
	smulcc	%g3,	%o0,	%o5
	fmovdgu	%xcc,	%f19,	%f2
	for	%f26,	%f6,	%f30
	fmovdn	%icc,	%f29,	%f5
	fmovrdlz	%o3,	%f20,	%f6
	fnands	%f29,	%f6,	%f8
	subcc	%i5,	0x1E99,	%g2
	fands	%f4,	%f9,	%f11
	addcc	%i7,	%g5,	%l0
	fbl,a	%fcc2,	loop_2211
	fmovdleu	%icc,	%f22,	%f9
	udivcc	%g6,	0x0E2D,	%o6
	udivx	%i1,	0x065A,	%i3
loop_2211:
	nop
	setx loop_2212, %l0, %l1
	jmpl %l1, %l5
	udivcc	%l6,	0x0B89,	%g1
	sir	0x084C
	fmul8sux16	%f2,	%f28,	%f30
loop_2212:
	movre	%l4,	0x1EC,	%o7
	popc	%o4,	%i2
	bge,pt	%icc,	loop_2213
	add	%g7,	%l3,	%l2
	movcc	%icc,	%i4,	%i6
	xorcc	%g4,	0x1659,	%l1
loop_2213:
	nop
	set	0x68, %i6
	stwa	%o1,	[%l7 + %i6] 0xeb
	membar	#Sync
	tg	%xcc,	0x7
	fcmpeq32	%f8,	%f20,	%o2
	fmovsa	%icc,	%f9,	%f19
	edge8n	%g3,	%i0,	%o5
	faligndata	%f28,	%f16,	%f4
	andcc	%o0,	0x12E5,	%i5
	fnot1	%f6,	%f6
	call	loop_2214
	fmovspos	%xcc,	%f30,	%f2
	bpos	loop_2215
	addcc	%o3,	%i7,	%g5
loop_2214:
	ldub	[%l7 + 0x1D],	%g2
	ldd	[%l7 + 0x30],	%f4
loop_2215:
	fmovrdlz	%l0,	%f28,	%f0
	flush	%l7 + 0x48
	prefetch	[%l7 + 0x0C],	 0x3
	srlx	%g6,	%o6,	%i1
	std	%l4,	[%l7 + 0x18]
	fmovrdlez	%l6,	%f12,	%f8
	set	0x61, %l4
	ldsba	[%l7 + %l4] 0x19,	%i3
	wr	%g0,	0x52,	%asi
	ldxa	[%g0 + 0x218] %asi,	%l4
	and	%g1,	0x0E7B,	%o4
	flush	%l7 + 0x70
	brgz	%i2,	loop_2216
	taddcc	%g7,	0x1DBB,	%l3
	orn	%l2,	%i4,	%o7
	bpos,pn	%icc,	loop_2217
loop_2216:
	edge16	%g4,	%i6,	%o1
	wr	%g0,	0x11,	%asi
	stha	%o2,	[%l7 + 0x76] %asi
loop_2217:
	fnor	%f16,	%f0,	%f8
	fcmpeq32	%f8,	%f14,	%l1
	fnot2	%f20,	%f8
	fblg	%fcc0,	loop_2218
	xnorcc	%g3,	0x14F5,	%i0
	pdist	%f10,	%f12,	%f20
	movpos	%xcc,	%o0,	%o5
loop_2218:
	nop
	wr	%g0,	0x19,	%asi
	lduha	[%l7 + 0x42] %asi,	%o3
	movvs	%xcc,	%i5,	%i7
	fmovsa	%xcc,	%f11,	%f28
	movrgz	%g5,	%g2,	%l0
	fbule	%fcc0,	loop_2219
	tsubcc	%g6,	%i1,	%l5
	edge16n	%o6,	%l6,	%i3
	xnorcc	%l4,	%g1,	%i2
loop_2219:
	andncc	%g7,	%o4,	%l2
	fands	%f21,	%f25,	%f9
	set	0x7A, %o6
	ldsha	[%l7 + %o6] 0x80,	%l3
	xnor	%i4,	0x07C7,	%o7
	orn	%g4,	0x0C8C,	%i6
	tsubcctv	%o1,	%l1,	%g3
	fpadd32	%f14,	%f20,	%f16
	udivcc	%o2,	0x186B,	%o0
	tn	%icc,	0x3
	fzeros	%f19
	fbuge,a	%fcc1,	loop_2220
	movl	%icc,	%i0,	%o3
	tvs	%icc,	0x3
	subcc	%o5,	%i7,	%i5
loop_2220:
	tvc	%icc,	0x1
	xor	%g5,	0x11AD,	%l0
	sra	%g6,	0x07,	%i1
	edge16n	%l5,	%g2,	%l6
	fmul8x16au	%f16,	%f13,	%f16
	fmul8x16	%f0,	%f26,	%f14
	movcs	%xcc,	%i3,	%o6
	brlz,a	%g1,	loop_2221
	edge32	%l4,	%g7,	%o4
	call	loop_2222
	te	%icc,	0x5
loop_2221:
	movvc	%icc,	%l2,	%i2
	movvc	%icc,	%i4,	%o7
loop_2222:
	bcs,pt	%xcc,	loop_2223
	te	%icc,	0x4
	tge	%xcc,	0x3
	edge32	%l3,	%i6,	%g4
loop_2223:
	orn	%l1,	%o1,	%g3
	fnegs	%f31,	%f23
	mulx	%o0,	%i0,	%o2
	subc	%o3,	%i7,	%o5
	swap	[%l7 + 0x24],	%i5
	movl	%icc,	%g5,	%l0
	fandnot2	%f22,	%f16,	%f10
	xnorcc	%g6,	0x0B24,	%l5
	fmovsa	%icc,	%f9,	%f19
	movpos	%xcc,	%i1,	%g2
	udiv	%i3,	0x0170,	%o6
	membar	#Sync
	set	0x40, %g1
	ldda	[%l7 + %g1] 0xf8,	%f0
	edge32ln	%g1,	%l6,	%g7
	movrne	%l4,	0x23D,	%o4
	add	%l2,	%i2,	%i4
	smulcc	%o7,	%i6,	%l3
	fnegd	%f28,	%f2
	fcmpgt32	%f10,	%f8,	%l1
	brgez	%g4,	loop_2224
	movne	%icc,	%g3,	%o1
	movvc	%icc,	%o0,	%i0
	fmovrslez	%o3,	%f24,	%f25
loop_2224:
	te	%xcc,	0x2
	ldd	[%l7 + 0x60],	%o2
	edge8n	%o5,	%i5,	%i7
	fble	%fcc2,	loop_2225
	subc	%l0,	0x1FD8,	%g6
	taddcc	%g5,	%l5,	%i1
	tneg	%xcc,	0x6
loop_2225:
	st	%f20,	[%l7 + 0x60]
	umulcc	%g2,	0x0DFD,	%o6
	pdist	%f0,	%f2,	%f22
	fone	%f28
	tle	%xcc,	0x5
	set	0x57, %l5
	stba	%i3,	[%l7 + %l5] 0x0c
	alignaddrl	%g1,	%l6,	%l4
	tneg	%xcc,	0x6
	movrlz	%g7,	0x0B3,	%l2
	add	%l7,	0x78,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%o4,	%i2
	bge,a,pn	%icc,	loop_2226
	sdivx	%i4,	0x1FB1,	%o7
	fxor	%f4,	%f2,	%f22
	brz,a	%l3,	loop_2227
loop_2226:
	sdivcc	%i6,	0x1B8A,	%l1
	add	%l7,	0x70,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%g4
	casxa	[%l6] 0x89,	%g4,	%o1
loop_2227:
	bcc,a,pn	%xcc,	loop_2228
	fpmerge	%f5,	%f27,	%f22
	fnot1	%f22,	%f14
	bcc	loop_2229
loop_2228:
	sub	%g3,	0x027C,	%o0
	fmovda	%icc,	%f26,	%f17
	stw	%o3,	[%l7 + 0x78]
loop_2229:
	orcc	%o2,	0x0661,	%o5
	bneg,a,pt	%xcc,	loop_2230
	orncc	%i0,	%i7,	%i5
	edge32l	%g6,	%l0,	%g5
	fcmped	%fcc0,	%f22,	%f0
loop_2230:
	alignaddr	%i1,	%g2,	%o6
	fmovrdgez	%l5,	%f24,	%f18
	fbge,a	%fcc0,	loop_2231
	fmovde	%xcc,	%f31,	%f28
	movrgz	%i3,	0x295,	%g1
	fpack16	%f10,	%f13
loop_2231:
	fmovse	%xcc,	%f26,	%f9
	bneg,a	loop_2232
	bg,pn	%xcc,	loop_2233
	tcs	%icc,	0x1
	wr	%g0,	0x80,	%asi
	lduba	[%l7 + 0x75] %asi,	%l4
loop_2232:
	stw	%l6,	[%l7 + 0x28]
loop_2233:
	nop
	set	0x28, %i7
	std	%f26,	[%l7 + %i7]
	movpos	%xcc,	%l2,	%g7
	fmovdle	%icc,	%f23,	%f15
	add	%l7,	0x60,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%o4
	casxa	[%l6] 0x80,	%o4,	%i4
	mova	%xcc,	%o7,	%l3
	fmovrslez	%i2,	%f30,	%f6
	sir	0x143B
	fbuge	%fcc3,	loop_2234
	bcs,a	%icc,	loop_2235
	edge32n	%l1,	%i6,	%o1
	sethi	0x123E,	%g3
loop_2234:
	fnot1	%f10,	%f10
loop_2235:
	fors	%f0,	%f30,	%f6
	sir	0x17DC
	st	%f15,	[%l7 + 0x50]
	bvc,a,pt	%icc,	loop_2236
	fmovsne	%icc,	%f29,	%f7
	udiv	%o0,	0x07FD,	%o3
	tn	%xcc,	0x5
loop_2236:
	smul	%o2,	%g4,	%o5
	movne	%xcc,	%i0,	%i5
	movn	%icc,	%i7,	%l0
	fmovsvs	%xcc,	%f14,	%f9
	tcc	%icc,	0x2
	array16	%g5,	%g6,	%g2
	sethi	0x1246,	%o6
	fmovsvs	%icc,	%f0,	%f11
	udiv	%i1,	0x026B,	%i3
	tne	%xcc,	0x0
	brlez,a	%g1,	loop_2237
	subccc	%l4,	%l6,	%l2
	tne	%xcc,	0x5
	ldx	[%l7 + 0x08],	%g7
loop_2237:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpsub32	%f8,	%f12,	%f20
	smul	%l5,	0x1878,	%o4
	orncc	%i4,	0x0363,	%o7
	umul	%l3,	%i2,	%l1
	tgu	%icc,	0x3
	fmovdgu	%icc,	%f10,	%f10
	fnot2	%f22,	%f6
	fpadd32s	%f0,	%f22,	%f22
	addcc	%o1,	%g3,	%o0
	ldsw	[%l7 + 0x60],	%o3
	fba,a	%fcc3,	loop_2238
	andn	%i6,	0x1248,	%o2
	edge16	%o5,	%g4,	%i5
	siam	0x5
loop_2238:
	bcs,a	%icc,	loop_2239
	sir	0x166B
	movpos	%icc,	%i7,	%i0
	tg	%xcc,	0x4
loop_2239:
	edge32n	%l0,	%g5,	%g2
	fmovscs	%xcc,	%f9,	%f9
	edge8l	%o6,	%i1,	%i3
	stb	%g6,	[%l7 + 0x40]
	fpadd16s	%f22,	%f2,	%f10
	movvc	%xcc,	%g1,	%l4
	and	%l2,	%g7,	%l6
	addccc	%l5,	0x0871,	%i4
	movrgz	%o7,	0x38B,	%o4
	tleu	%icc,	0x3
	bpos	loop_2240
	andncc	%l3,	%l1,	%o1
	fmul8ulx16	%f6,	%f16,	%f30
	fble,a	%fcc2,	loop_2241
loop_2240:
	tcc	%icc,	0x1
	std	%f2,	[%l7 + 0x20]
	fsrc1s	%f12,	%f4
loop_2241:
	fmul8x16	%f2,	%f16,	%f24
	tn	%xcc,	0x2
	fmovsleu	%icc,	%f4,	%f7
	udiv	%g3,	0x116B,	%i2
	fxors	%f13,	%f24,	%f6
	addccc	%o3,	%o0,	%o2
	ta	%icc,	0x1
	edge8ln	%i6,	%o5,	%i5
	xnorcc	%g4,	%i7,	%i0
	bcs,pt	%icc,	loop_2242
	fpsub16	%f4,	%f0,	%f6
	fbn,a	%fcc0,	loop_2243
	fmovsleu	%xcc,	%f22,	%f13
loop_2242:
	nop
	add	%l7,	0x58,	%l6
	wr	%g0,	0x19,	%asi
	ldxa	[%l6] %asi,	%l0
	casxa	[%l6] %asi,	%l0,	%g5
loop_2243:
	array16	%g2,	%o6,	%i1
	fcmpeq32	%f12,	%f0,	%i3
	sth	%g6,	[%l7 + 0x32]
	brlez,a	%g1,	loop_2244
	xor	%l2,	0x1DB6,	%l4
	movrlz	%g7,	%l6,	%i4
	or	%l5,	0x1222,	%o4
loop_2244:
	addcc	%l3,	%l1,	%o7
	edge16l	%g3,	%i2,	%o1
	fbul,a	%fcc2,	loop_2245
	orcc	%o3,	0x1A30,	%o0
	tvc	%icc,	0x1
	movrlez	%o2,	0x13C,	%o5
loop_2245:
	fxnor	%f0,	%f30,	%f16
	mulx	%i5,	%g4,	%i6
	fmovrslz	%i7,	%f18,	%f8
	set	0x48, %i5
	ldxa	[%l7 + %i5] 0x04,	%i0
	fmovsa	%icc,	%f25,	%f28
	fsrc2s	%f27,	%f12
	bg	%icc,	loop_2246
	edge32ln	%g5,	%l0,	%g2
	edge32l	%o6,	%i1,	%g6
	movcc	%icc,	%g1,	%i3
loop_2246:
	sra	%l2,	%l4,	%g7
	fand	%f14,	%f4,	%f2
	lduw	[%l7 + 0x20],	%l6
	bge,pn	%xcc,	loop_2247
	srlx	%l5,	%i4,	%o4
	edge8ln	%l1,	%l3,	%g3
	ldsb	[%l7 + 0x28],	%i2
loop_2247:
	umul	%o1,	%o7,	%o3
	fcmpgt32	%f2,	%f22,	%o2
	edge8n	%o0,	%o5,	%i5
	tcs	%icc,	0x3
	wr	%g0,	0x80,	%asi
	lduwa	[%l7 + 0x74] %asi,	%i6
	udiv	%g4,	0x0013,	%i0
	movrgz	%i7,	%g5,	%l0
	wr	%g0,	0x89,	%asi
	ldstuba	[%l7 + 0x65] %asi,	%o6
	fmovrdne	%g2,	%f28,	%f2
	fmovsgu	%icc,	%f12,	%f27
	set	0x58, %o0
	ldxa	[%l7 + %o0] 0x89,	%g6
	fpack16	%f18,	%f13
	set	0x6C, %o7
	stwa	%i1,	[%l7 + %o7] 0x11
	addc	%i3,	%l2,	%g1
	fbne,a	%fcc3,	loop_2248
	bg,pn	%icc,	loop_2249
	edge8	%l4,	%l6,	%g7
	tpos	%xcc,	0x0
loop_2248:
	mulscc	%i4,	0x1E62,	%l5
loop_2249:
	taddcctv	%o4,	%l1,	%l3
	udivx	%i2,	0x09F0,	%o1
	bleu	loop_2250
	ldstub	[%l7 + 0x25],	%o7
	movvs	%icc,	%o3,	%o2
	swap	[%l7 + 0x58],	%o0
loop_2250:
	sdiv	%o5,	0x1077,	%i5
	tvs	%xcc,	0x1
	fmovspos	%xcc,	%f26,	%f13
	sllx	%g3,	%g4,	%i0
	fble	%fcc2,	loop_2251
	faligndata	%f22,	%f16,	%f10
	fpadd32	%f24,	%f2,	%f22
	te	%xcc,	0x0
loop_2251:
	move	%icc,	%i6,	%g5
	movrne	%i7,	0x09C,	%l0
	movvc	%xcc,	%o6,	%g6
	nop
	set	0x58, %l6
	lduw	[%l7 + %l6],	%i1
	fsrc1s	%f2,	%f29
	tleu	%xcc,	0x7
	subccc	%i3,	%g2,	%l2
	bg,a,pn	%xcc,	loop_2252
	fxor	%f4,	%f18,	%f12
	edge8l	%l4,	%g1,	%g7
	fand	%f30,	%f2,	%f14
loop_2252:
	and	%l6,	0x03F2,	%l5
	fbug,a	%fcc0,	loop_2253
	tn	%icc,	0x0
	tvs	%xcc,	0x6
	prefetch	[%l7 + 0x4C],	 0x0
loop_2253:
	movl	%icc,	%i4,	%l1
	add	%o4,	%l3,	%o1
	fnand	%f26,	%f12,	%f2
	fcmple16	%f30,	%f16,	%i2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tvc	%icc,	0x2
	move	%xcc,	%o3,	%o2
	movne	%icc,	%o0,	%o7
	fmovde	%xcc,	%f0,	%f15
	movrne	%i5,	0x163,	%g3
	sethi	0x1FC6,	%o5
	swap	[%l7 + 0x64],	%g4
	movge	%xcc,	%i6,	%g5
	popc	0x0717,	%i7
	wr	%g0,	0x18,	%asi
	ldstuba	[%l7 + 0x5B] %asi,	%i0
	ldx	[%l7 + 0x18],	%l0
	movgu	%icc,	%g6,	%o6
	tsubcctv	%i3,	0x1B0A,	%i1
	wr	%g0,	0x18,	%asi
	ldsba	[%l7 + 0x17] %asi,	%l2
	xor	%l4,	%g1,	%g2
	orcc	%g7,	0x00BC,	%l5
	subcc	%l6,	%l1,	%i4
	movcs	%xcc,	%o4,	%l3
	bgu,pn	%xcc,	loop_2254
	udivx	%o1,	0x1CDE,	%o3
	umulcc	%i2,	%o2,	%o7
	edge16	%i5,	%g3,	%o5
loop_2254:
	nop
	set	0x40, %i4
	stda	%f16,	[%l7 + %i4] 0x10
	stb	%o0,	[%l7 + 0x0F]
	bneg,pt	%icc,	loop_2255
	andcc	%g4,	%i6,	%g5
	ldd	[%l7 + 0x48],	%f28
	te	%icc,	0x7
loop_2255:
	movrgz	%i7,	0x251,	%l0
	brz	%g6,	loop_2256
	movneg	%xcc,	%o6,	%i3
	popc	%i0,	%l2
	fmuld8ulx16	%f3,	%f3,	%f12
loop_2256:
	andn	%i1,	%g1,	%g2
	fmovrse	%l4,	%f21,	%f26
	popc	%l5,	%g7
	fmovdneg	%xcc,	%f2,	%f2
	brlez	%l6,	loop_2257
	fandnot2	%f12,	%f26,	%f0
	srax	%l1,	0x00,	%o4
	orcc	%i4,	0x19E6,	%o1
loop_2257:
	edge32ln	%o3,	%i2,	%o2
	fmovrslez	%o7,	%f16,	%f10
	movg	%xcc,	%l3,	%g3
	tleu	%xcc,	0x3
	edge32ln	%i5,	%o5,	%o0
	fpadd32	%f2,	%f26,	%f14
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrse	%g4,	%f4,	%f17
	fbn	%fcc2,	loop_2258
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16	%g5,	%i6,	%i7
	fpsub32	%f0,	%f4,	%f0
loop_2258:
	edge16n	%l0,	%o6,	%i3
	edge32ln	%i0,	%g6,	%i1
	te	%xcc,	0x6
	stbar
	mulscc	%g1,	0x05C3,	%l2
	subcc	%l4,	0x1695,	%g2
	wr	%g0,	0x89,	%asi
	stwa	%l5,	[%l7 + 0x6C] %asi
	xorcc	%g7,	0x09C0,	%l6
	stbar
	fands	%f22,	%f16,	%f17
	stbar
	array16	%o4,	%i4,	%l1
	fmovdpos	%xcc,	%f3,	%f20
	srl	%o1,	%i2,	%o2
	srax	%o7,	%o3,	%g3
	tneg	%icc,	0x7
	fcmpne16	%f2,	%f28,	%l3
	tgu	%icc,	0x2
	fmovsle	%icc,	%f9,	%f3
	ldsh	[%l7 + 0x48],	%o5
	edge16n	%i5,	%o0,	%g4
	fble,a	%fcc3,	loop_2259
	andcc	%g5,	%i6,	%i7
	movgu	%icc,	%o6,	%i3
	sll	%i0,	0x11,	%g6
loop_2259:
	subcc	%l0,	%g1,	%l2
	movvs	%xcc,	%l4,	%g2
	bpos	loop_2260
	addccc	%l5,	0x1150,	%i1
	taddcc	%l6,	%g7,	%i4
	fmovrslz	%l1,	%f12,	%f28
loop_2260:
	xnor	%o4,	0x1627,	%i2
	wr	%g0,	0x89,	%asi
	lduba	[%l7 + 0x4B] %asi,	%o1
	fandnot1	%f10,	%f8,	%f30
	srax	%o7,	%o2,	%o3
	fbge,a	%fcc0,	loop_2261
	sdivx	%l3,	0x00F9,	%o5
	orn	%i5,	0x1AFF,	%o0
	tne	%icc,	0x5
loop_2261:
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
	nop
	set	0x10, %g5
	stx	%g4,	[%l7 + %g5]
	movne	%xcc,	%g3,	%i6
	nop
	setx loop_2263, %l0, %l1
	jmpl %l1, %i7
loop_2262:
	brgez,a	%g5,	loop_2264
	orn	%o6,	%i0,	%g6
	alignaddrl	%i3,	%g1,	%l0
loop_2263:
	fornot2s	%f6,	%f26,	%f20
loop_2264:
	nop
	set	0x3C, %o5
	ldswa	[%l7 + %o5] 0x81,	%l2
	wr	%g0,	0x18,	%asi
	lduha	[%l7 + 0x74] %asi,	%l4
	fcmpes	%fcc3,	%f23,	%f15
	fnegd	%f26,	%f24
	andcc	%l5,	0x1410,	%i1
	or	%l6,	%g7,	%g2
	subcc	%l1,	0x011D,	%o4
	wr	%g0,	0x04,	%asi
	stxa	%i4,	[%l7 + 0x18] %asi
	bne,a	%icc,	loop_2265
	fmovrdne	%i2,	%f10,	%f30
	movre	%o1,	0x1F6,	%o7
	tgu	%xcc,	0x0
loop_2265:
	orn	%o2,	%o3,	%l3
	fpack16	%f0,	%f5
	sra	%i5,	0x0C,	%o0
	movle	%icc,	%g4,	%g3
	edge16l	%o5,	%i6,	%i7
	stb	%o6,	[%l7 + 0x47]
	fmovse	%icc,	%f18,	%f2
	tcc	%xcc,	0x3
	fcmpeq16	%f30,	%f4,	%g5
	udivx	%g6,	0x0C8F,	%i0
	alignaddr	%g1,	%l0,	%l2
	alignaddrl	%l4,	%i3,	%i1
	fmovdpos	%icc,	%f14,	%f14
	movcc	%xcc,	%l5,	%l6
	movcc	%xcc,	%g7,	%g2
	smul	%l1,	0x0203,	%i4
	alignaddrl	%i2,	%o1,	%o7
	movvs	%icc,	%o2,	%o3
	addc	%o4,	0x1323,	%l3
	sdiv	%o0,	0x0121,	%g4
	movvs	%icc,	%g3,	%o5
	fmovsl	%icc,	%f4,	%f8
	lduw	[%l7 + 0x18],	%i5
	membar	0x6F
	fmuld8sux16	%f30,	%f31,	%f20
	fbue	%fcc2,	loop_2266
	fbl,a	%fcc3,	loop_2267
	ta	%xcc,	0x2
	fmovdge	%icc,	%f15,	%f30
loop_2266:
	be,a,pn	%icc,	loop_2268
loop_2267:
	ld	[%l7 + 0x70],	%f24
	addccc	%i6,	%i7,	%g5
	tne	%icc,	0x5
loop_2268:
	udiv	%g6,	0x1476,	%i0
	fpadd16s	%f13,	%f22,	%f5
	mulscc	%g1,	%o6,	%l2
	movvs	%icc,	%l4,	%l0
	ldub	[%l7 + 0x74],	%i3
	fnegd	%f0,	%f14
	stbar
	fbule	%fcc0,	loop_2269
	tcc	%icc,	0x2
	mulscc	%l5,	0x19CE,	%l6
	fandnot2	%f6,	%f16,	%f24
loop_2269:
	or	%i1,	0x0D26,	%g7
	wr	%g0,	0x88,	%asi
	prefetcha	[%l7 + 0x38] %asi,	 0x0
	sir	0x1A62
	fmovdcc	%xcc,	%f30,	%f9
	add	%l7,	0x2C,	%l6
	wr	%g0,	0x18,	%asi
	lda	[%l6] %asi,	%i4
	casa	[%l6] %asi,	%i4,	%l1
	fpack32	%f20,	%f14,	%f26
	fmovrslez	%o1,	%f10,	%f1
	sethi	0x1003,	%o7
	movvs	%icc,	%i2,	%o2
	srlx	%o3,	%l3,	%o4
	tsubcc	%g4,	%g3,	%o5
	and	%o0,	%i6,	%i7
	movgu	%xcc,	%i5,	%g5
	set	0x63, %o4
	stba	%g6,	[%l7 + %o4] 0x0c
	subccc	%i0,	%o6,	%g1
	add	%l2,	0x122F,	%l0
	add	%l7,	0x18,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%i3,	%l4
	tcs	%xcc,	0x4
	udiv	%l6,	0x1BA9,	%i1
	xnorcc	%g7,	0x1C06,	%l5
	fnands	%f30,	%f23,	%f10
	addccc	%i4,	0x17F5,	%l1
	fxors	%f28,	%f12,	%f7
	smulcc	%o1,	0x07CE,	%o7
	fandnot2s	%f21,	%f8,	%f3
	fcmpes	%fcc0,	%f28,	%f6
	edge8ln	%g2,	%o2,	%i2
	ldstub	[%l7 + 0x44],	%o3
	xnorcc	%l3,	0x0E34,	%g4
	std	%f14,	[%l7 + 0x58]
	fbul,a	%fcc3,	loop_2270
	fmovrdlez	%g3,	%f6,	%f14
	wr	%g0,	0x89,	%asi
	ldstuba	[%l7 + 0x3C] %asi,	%o5
loop_2270:
	bpos,a	loop_2271
	fxors	%f12,	%f26,	%f29
	mulx	%o4,	%i6,	%i7
	bleu	loop_2272
loop_2271:
	umulcc	%o0,	%i5,	%g5
	orncc	%g6,	%o6,	%g1
	fpsub32	%f28,	%f24,	%f4
loop_2272:
	fmovs	%f21,	%f15
	movcc	%icc,	%i0,	%l2
	fzeros	%f14
	tpos	%icc,	0x5
	fbuge,a	%fcc0,	loop_2273
	fba	%fcc2,	loop_2274
	edge32l	%i3,	%l0,	%l4
	orcc	%l6,	0x11F7,	%g7
loop_2273:
	umul	%l5,	%i1,	%l1
loop_2274:
	ld	[%l7 + 0x0C],	%f26
	bpos,pn	%xcc,	loop_2275
	fsrc1	%f20,	%f4
	movvc	%xcc,	%o1,	%i4
	fmovscs	%xcc,	%f21,	%f12
loop_2275:
	taddcc	%g2,	%o7,	%o2
	sdivcc	%o3,	0x1BA3,	%l3
	tn	%xcc,	0x3
	fbl,a	%fcc3,	loop_2276
	subccc	%i2,	0x121D,	%g4
	fcmple16	%f12,	%f18,	%o5
	fmovrsgez	%g3,	%f8,	%f21
loop_2276:
	sth	%o4,	[%l7 + 0x7C]
	add	%l7,	0x30,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%i6
	casxa	[%l6] %asi,	%i6,	%o0
	fandnot2s	%f18,	%f14,	%f23
	fbne	%fcc2,	loop_2277
	orcc	%i7,	%g5,	%g6
	fnot2s	%f3,	%f25
	be	%xcc,	loop_2278
loop_2277:
	sll	%o6,	0x0A,	%g1
	fmul8sux16	%f2,	%f0,	%f18
	edge32l	%i5,	%l2,	%i0
loop_2278:
	be,a	%xcc,	loop_2279
	tg	%xcc,	0x7
	sir	0x12AF
	fandnot2	%f16,	%f14,	%f12
loop_2279:
	nop
	set	0x14, %l1
	sth	%i3,	[%l7 + %l1]
	fmovdgu	%xcc,	%f11,	%f26
	fzeros	%f23
	array16	%l0,	%l4,	%g7
	bcc	loop_2280
	orncc	%l6,	%i1,	%l1
	wr	%g0,	0x89,	%asi
	stwa	%o1,	[%l7 + 0x6C] %asi
loop_2280:
	fmovscs	%icc,	%f8,	%f8
	fbule,a	%fcc3,	loop_2281
	fcmped	%fcc3,	%f28,	%f22
	fnor	%f12,	%f4,	%f26
	wr	%g0,	0x89,	%asi
	lduha	[%l7 + 0x5A] %asi,	%l5
loop_2281:
	movn	%xcc,	%i4,	%g2
	fbo,a	%fcc1,	loop_2282
	mulx	%o2,	%o3,	%o7
	brnz	%l3,	loop_2283
	tneg	%xcc,	0x5
loop_2282:
	xnor	%g4,	%i2,	%g3
	movneg	%icc,	%o4,	%i6
loop_2283:
	umulcc	%o0,	0x05AC,	%i7
	udivx	%g5,	0x04FC,	%g6
	sethi	0x1564,	%o5
	edge32l	%o6,	%i5,	%l2
	fandnot1	%f2,	%f10,	%f6
	fnot1s	%f6,	%f0
	nop
	set	0x50, %g6
	std	%i0,	[%l7 + %g6]
	fmovrdne	%g1,	%f14,	%f26
	ldsh	[%l7 + 0x56],	%l0
	umul	%l4,	%i3,	%g7
	taddcctv	%i1,	%l1,	%o1
	edge32l	%l6,	%l5,	%i4
	tcc	%xcc,	0x0
	fblg	%fcc2,	loop_2284
	xnorcc	%g2,	0x12DB,	%o2
	fpmerge	%f21,	%f16,	%f2
	ta	%icc,	0x3
loop_2284:
	subcc	%o3,	%l3,	%o7
	andn	%i2,	0x12A9,	%g4
	udivx	%o4,	0x00F5,	%g3
	xnorcc	%i6,	%o0,	%i7
	membar	0x63
	sll	%g5,	0x13,	%g6
	sethi	0x0B55,	%o5
	umulcc	%i5,	0x0FA6,	%o6
	movrlez	%i0,	0x2BE,	%g1
	umul	%l0,	0x156B,	%l4
	movrgz	%i3,	%l2,	%i1
	bn	loop_2285
	fmovrsgz	%l1,	%f23,	%f14
	add	%o1,	0x02D9,	%g7
	move	%xcc,	%l6,	%l5
loop_2285:
	xnorcc	%i4,	%g2,	%o3
	movneg	%icc,	%l3,	%o2
	tneg	%xcc,	0x5
	fpackfix	%f30,	%f8
	brnz	%i2,	loop_2286
	nop
	setx	loop_2287,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fbul,a	%fcc2,	loop_2288
	fmovscs	%icc,	%f31,	%f13
loop_2286:
	sdiv	%o7,	0x1E54,	%o4
loop_2287:
	movle	%xcc,	%g4,	%i6
loop_2288:
	xnor	%g3,	0x1CB5,	%i7
	tl	%xcc,	0x3
	andcc	%o0,	%g5,	%o5
	ldx	[%l7 + 0x10],	%i5
	wr	%g0,	0xeb,	%asi
	stda	%o6,	[%l7 + 0x50] %asi
	membar	#Sync
	fpsub16	%f16,	%f26,	%f28
	edge32	%i0,	%g1,	%l0
	movcs	%xcc,	%l4,	%i3
	udivcc	%l2,	0x12E9,	%i1
	std	%f24,	[%l7 + 0x50]
	sir	0x1D0B
	tcs	%xcc,	0x3
	fmovrslez	%g6,	%f30,	%f21
	movvc	%xcc,	%l1,	%o1
	sdiv	%g7,	0x0B93,	%l5
	movcs	%xcc,	%l6,	%g2
	wr	%g0,	0x80,	%asi
	ldswa	[%l7 + 0x58] %asi,	%i4
	brz,a	%l3,	loop_2289
	tsubcc	%o2,	%i2,	%o3
	fmovsle	%icc,	%f6,	%f26
	sdivx	%o4,	0x11B4,	%o7
loop_2289:
	movrgz	%g4,	%g3,	%i6
	wr	%g0,	0x88,	%asi
	ldsba	[%l7 + 0x2A] %asi,	%o0
	bn	loop_2290
	movre	%g5,	%o5,	%i5
	fxnors	%f31,	%f16,	%f28
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2290:
	fnor	%f12,	%f6,	%f16
	movrlz	%i7,	0x0F3,	%o6
	brgez	%g1,	loop_2291
	fnand	%f28,	%f8,	%f22
	fmovsgu	%xcc,	%f30,	%f24
	movrgz	%l0,	%l4,	%i0
loop_2291:
	ta	%icc,	0x3
	fzero	%f22
	taddcc	%i3,	%i1,	%l2
	tn	%icc,	0x7
	sll	%g6,	0x17,	%l1
	ldsb	[%l7 + 0x0E],	%g7
	ld	[%l7 + 0x0C],	%f26
	tcs	%icc,	0x7
	movleu	%xcc,	%l5,	%o1
	addccc	%g2,	%i4,	%l3
	bcc,a,pt	%icc,	loop_2292
	bshuffle	%f30,	%f6,	%f26
	edge16	%o2,	%l6,	%o3
	andcc	%o4,	%o7,	%i2
loop_2292:
	fmovrdgez	%g4,	%f30,	%f20
	edge32ln	%g3,	%i6,	%g5
	udivx	%o0,	0x0526,	%o5
	fbue	%fcc1,	loop_2293
	swap	[%l7 + 0x18],	%i7
	udivx	%o6,	0x1073,	%i5
	tg	%xcc,	0x3
loop_2293:
	stb	%l0,	[%l7 + 0x4A]
	fbo	%fcc1,	loop_2294
	ble,pt	%xcc,	loop_2295
	orncc	%g1,	%l4,	%i0
	taddcc	%i3,	0x0820,	%i1
loop_2294:
	mova	%icc,	%l2,	%g6
loop_2295:
	movre	%g7,	%l5,	%o1
	addc	%l1,	0x00D5,	%i4
	fpadd16s	%f12,	%f16,	%f18
	movcc	%xcc,	%l3,	%g2
	sra	%l6,	%o3,	%o4
	ldd	[%l7 + 0x48],	%o2
	fmovdpos	%xcc,	%f21,	%f13
	fmovdne	%xcc,	%f15,	%f30
	wr	%g0,	0x88,	%asi
	ldstuba	[%l7 + 0x7F] %asi,	%i2
	fornot2s	%f26,	%f18,	%f2
	edge32l	%g4,	%g3,	%i6
	movrlez	%g5,	0x0F7,	%o0
	tne	%xcc,	0x6
	movvs	%xcc,	%o7,	%i7
	sir	0x06BF
	movge	%icc,	%o5,	%o6
	fmovd	%f18,	%f10
	fmovdgu	%icc,	%f21,	%f1
	movleu	%icc,	%l0,	%i5
	fmul8x16al	%f10,	%f24,	%f8
	fbu	%fcc1,	loop_2296
	tn	%icc,	0x5
	ld	[%l7 + 0x4C],	%f23
	fmovde	%icc,	%f28,	%f11
loop_2296:
	ta	%xcc,	0x0
	addcc	%g1,	0x1D31,	%l4
	fbule,a	%fcc1,	loop_2297
	fmovsg	%xcc,	%f3,	%f4
	movpos	%icc,	%i3,	%i1
	orn	%i0,	0x1FCF,	%l2
loop_2297:
	andcc	%g6,	%l5,	%o1
	fmul8x16al	%f25,	%f30,	%f16
	sub	%g7,	0x1817,	%i4
	fxors	%f9,	%f13,	%f27
	sllx	%l1,	%g2,	%l6
	ble,pn	%xcc,	loop_2298
	movcc	%icc,	%o3,	%l3
	ble	loop_2299
	ta	%xcc,	0x4
loop_2298:
	bvc,a	loop_2300
	andncc	%o4,	%o2,	%i2
loop_2299:
	brgz,a	%g3,	loop_2301
	fsrc1	%f10,	%f10
loop_2300:
	nop
	wr	%g0,	0x19,	%asi
	stwa	%i6,	[%l7 + 0x0C] %asi
loop_2301:
	subccc	%g4,	%o0,	%o7
	movl	%icc,	%g5,	%o5
	sdivcc	%i7,	0x05C2,	%o6
	fmul8x16al	%f30,	%f31,	%f10
	fmovsle	%xcc,	%f18,	%f4
	fbne,a	%fcc0,	loop_2302
	tvc	%icc,	0x3
	membar	0x3E
	sra	%i5,	0x01,	%l0
loop_2302:
	movpos	%icc,	%g1,	%i3
	add	%l7,	0x78,	%l6
	wr	%g0,	0x04,	%asi
	casxa	[%l6] 0x04,	%l4,	%i0
	tsubcc	%i1,	0x0FAC,	%l2
	st	%f25,	[%l7 + 0x34]
	ldsh	[%l7 + 0x72],	%g6
	xorcc	%o1,	%l5,	%i4
	movre	%l1,	%g7,	%g2
	fmovdle	%icc,	%f28,	%f21
	edge32l	%l6,	%l3,	%o4
	tge	%icc,	0x3
	bne	%icc,	loop_2303
	movre	%o3,	0x2DE,	%i2
	addc	%o2,	0x1F23,	%i6
	fbl	%fcc3,	loop_2304
loop_2303:
	fpadd16s	%f2,	%f19,	%f15
	movcs	%icc,	%g4,	%g3
	fabss	%f8,	%f31
loop_2304:
	fbo	%fcc1,	loop_2305
	stb	%o7,	[%l7 + 0x13]
	fmovrde	%g5,	%f18,	%f14
	tge	%icc,	0x1
loop_2305:
	movg	%icc,	%o0,	%o5
	fmovdvc	%icc,	%f9,	%f25
	taddcc	%o6,	%i7,	%l0
	wr	%g0,	0x10,	%asi
	ldstuba	[%l7 + 0x2B] %asi,	%g1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fands	%f25,	%f5,	%f8
	tg	%icc,	0x0
	fbl,a	%fcc3,	loop_2306
	ldub	[%l7 + 0x1F],	%i5
	set	0x74, %i3
	ldstuba	[%l7 + %i3] 0x80,	%i3
loop_2306:
	fnegd	%f24,	%f14
	tsubcctv	%i0,	%i1,	%l2
	edge8	%g6,	%o1,	%l4
	lduw	[%l7 + 0x58],	%l5
	sethi	0x0D4E,	%i4
	fcmpes	%fcc2,	%f14,	%f30
	stx	%g7,	[%l7 + 0x70]
	flush	%l7 + 0x7C
	edge32ln	%l1,	%g2,	%l3
	movl	%icc,	%o4,	%l6
	fbuge	%fcc3,	loop_2307
	fnot2s	%f9,	%f12
	wr	%g0,	0x11,	%asi
	lda	[%l7 + 0x40] %asi,	%f16
loop_2307:
	movn	%xcc,	%o3,	%o2
	subccc	%i2,	%i6,	%g4
	wr	%g0,	0x89,	%asi
	ldda	[%l7 + 0x30] %asi,	%g2
	udivx	%o7,	0x02CD,	%g5
	fmovdne	%icc,	%f18,	%f27
	pdist	%f24,	%f28,	%f20
	subccc	%o5,	0x11A9,	%o6
	nop
	setx loop_2308, %l0, %l1
	jmpl %l1, %o0
	stw	%i7,	[%l7 + 0x74]
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tpos	%xcc,	0x5
loop_2308:
	smulcc	%l0,	0x19B5,	%g1
	fnand	%f10,	%f12,	%f8
	fbl,a	%fcc0,	loop_2309
	array8	%i3,	%i5,	%i1
	edge8	%i0,	%g6,	%o1
	fbu,a	%fcc1,	loop_2310
loop_2309:
	fmovs	%f5,	%f15
	tl	%xcc,	0x0
	stb	%l2,	[%l7 + 0x20]
loop_2310:
	fmovdg	%icc,	%f8,	%f6
	fmovrsne	%l4,	%f12,	%f16
	sllx	%l5,	0x1B,	%g7
	xnorcc	%l1,	0x16EE,	%g2
	subc	%l3,	0x11F2,	%o4
	tcc	%xcc,	0x4
	andn	%l6,	%i4,	%o3
	bneg	loop_2311
	ta	%xcc,	0x7
	fbge	%fcc3,	loop_2312
	umul	%o2,	%i6,	%g4
loop_2311:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	be	loop_2313
loop_2312:
	tvc	%icc,	0x3
	movgu	%xcc,	%i2,	%g3
	fmovde	%xcc,	%f26,	%f17
loop_2313:
	ldsh	[%l7 + 0x38],	%o7
	wr	%g0,	0x18,	%asi
	lduwa	[%l7 + 0x2C] %asi,	%o5
	sra	%o6,	%g5,	%o0
	bg,a,pt	%xcc,	loop_2314
	mulx	%l0,	0x061B,	%g1
	bne,pt	%xcc,	loop_2315
	edge16l	%i7,	%i5,	%i3
loop_2314:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movcc	%icc,	%i1,	%i0
loop_2315:
	ldd	[%l7 + 0x48],	%g6
	fmovrdlz	%o1,	%f2,	%f26
	ta	%xcc,	0x1
	fornot2	%f24,	%f12,	%f6
	fbne	%fcc1,	loop_2316
	addc	%l2,	%l4,	%l5
	andncc	%l1,	%g7,	%l3
	ble,pt	%icc,	loop_2317
loop_2316:
	movvs	%icc,	%g2,	%o4
	prefetch	[%l7 + 0x30],	 0x2
	sll	%i4,	0x0F,	%l6
loop_2317:
	movleu	%icc,	%o2,	%i6
	brgez,a	%g4,	loop_2318
	tcc	%xcc,	0x6
	fmul8x16	%f18,	%f20,	%f4
	sir	0x0846
loop_2318:
	umul	%o3,	0x0F4C,	%i2
	flush	%l7 + 0x10
	edge32l	%o7,	%g3,	%o5
	andn	%g5,	%o0,	%l0
	fxor	%f28,	%f16,	%f20
	fbu	%fcc2,	loop_2319
	membar	0x39
	movge	%icc,	%g1,	%o6
	fmovscc	%icc,	%f28,	%f12
loop_2319:
	bn,a	%xcc,	loop_2320
	movgu	%icc,	%i7,	%i3
	movrlz	%i1,	0x329,	%i5
	fmovsne	%xcc,	%f28,	%f6
loop_2320:
	fmovda	%xcc,	%f2,	%f15
	orcc	%g6,	0x1CE2,	%i0
	mulx	%o1,	0x0F92,	%l4
	nop
	setx loop_2321, %l0, %l1
	jmpl %l1, %l5
	fmovdle	%xcc,	%f24,	%f0
	fbue	%fcc3,	loop_2322
	movvs	%xcc,	%l1,	%g7
loop_2321:
	edge32ln	%l3,	%g2,	%o4
	orncc	%i4,	%l6,	%o2
loop_2322:
	movrne	%l2,	%g4,	%i6
	edge32ln	%i2,	%o7,	%g3
	siam	0x6
	umul	%o5,	%g5,	%o3
	mulx	%o0,	%l0,	%g1
	sra	%i7,	%o6,	%i1
	wr	%g0,	0x89,	%asi
	lduba	[%l7 + 0x14] %asi,	%i5
	tsubcctv	%i3,	0x0188,	%i0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srlx	%o1,	%l4,	%g6
	bvs,a,pn	%xcc,	loop_2323
	fpackfix	%f16,	%f31
	edge32	%l5,	%l1,	%g7
	subc	%g2,	0x18C2,	%l3
loop_2323:
	addcc	%o4,	0x1A13,	%i4
	fmovdn	%icc,	%f21,	%f31
	tge	%xcc,	0x6
	smul	%l6,	0x1B02,	%o2
	fbne,a	%fcc2,	loop_2324
	fmovscs	%xcc,	%f15,	%f17
	tvc	%icc,	0x7
	wr	%g0,	0x80,	%asi
	ldswa	[%l7 + 0x0C] %asi,	%g4
loop_2324:
	array8	%i6,	%i2,	%l2
	set	0x68, %o1
	lduba	[%l7 + %o1] 0x88,	%g3
	movne	%xcc,	%o5,	%o7
	andn	%o3,	0x1F50,	%g5
	mova	%xcc,	%o0,	%l0
	fmovscc	%xcc,	%f22,	%f15
	fbule	%fcc2,	loop_2325
	sth	%g1,	[%l7 + 0x0C]
	movneg	%xcc,	%o6,	%i1
	nop
	setx	loop_2326,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_2325:
	movvc	%xcc,	%i5,	%i7
	nop
	set	0x76, %g2
	ldsb	[%l7 + %g2],	%i0
	fpack32	%f6,	%f4,	%f4
loop_2326:
	sllx	%i3,	0x1A,	%o1
	fmovspos	%icc,	%f26,	%f16
	addc	%l4,	%l5,	%g6
	fabsd	%f22,	%f20
	tsubcctv	%l1,	0x1AFF,	%g2
	move	%xcc,	%g7,	%o4
	addccc	%l3,	0x098E,	%l6
	wr	%g0,	0xe3,	%asi
	stba	%o2,	[%l7 + 0x2D] %asi
	membar	#Sync
	movre	%i4,	%i6,	%i2
	ldub	[%l7 + 0x6D],	%l2
	smul	%g3,	%o5,	%g4
	ldsw	[%l7 + 0x08],	%o3
	prefetch	[%l7 + 0x5C],	 0x3
	srlx	%g5,	0x04,	%o7
	srax	%l0,	0x0C,	%o0
	fbu	%fcc0,	loop_2327
	edge32ln	%o6,	%g1,	%i5
	fabsd	%f4,	%f18
	srax	%i7,	0x0A,	%i0
loop_2327:
	subcc	%i3,	0x1E75,	%i1
	subcc	%l4,	0x1F33,	%o1
	movg	%icc,	%g6,	%l1
	fnors	%f2,	%f25,	%f11
	fbne,a	%fcc2,	loop_2328
	fmovscs	%icc,	%f27,	%f22
	edge32l	%l5,	%g2,	%g7
	xorcc	%o4,	%l6,	%l3
loop_2328:
	fmovsvs	%xcc,	%f9,	%f13
	edge16l	%i4,	%i6,	%o2
	edge16	%i2,	%g3,	%o5
	edge16l	%l2,	%g4,	%g5
	fblg,a	%fcc3,	loop_2329
	or	%o7,	%o3,	%l0
	taddcc	%o0,	%o6,	%g1
	srlx	%i7,	0x16,	%i0
loop_2329:
	tgu	%xcc,	0x2
	fmovsne	%icc,	%f31,	%f22
	fbg,a	%fcc0,	loop_2330
	for	%f6,	%f4,	%f4
	srlx	%i3,	%i5,	%l4
	movl	%icc,	%o1,	%g6
loop_2330:
	brlez,a	%i1,	loop_2331
	fbuge	%fcc0,	loop_2332
	movcs	%xcc,	%l5,	%g2
	array16	%l1,	%o4,	%g7
loop_2331:
	st	%f6,	[%l7 + 0x28]
loop_2332:
	or	%l3,	0x0ED0,	%l6
	xnor	%i6,	%o2,	%i4
	brz,a	%i2,	loop_2333
	edge32n	%g3,	%o5,	%g4
	fbn,a	%fcc0,	loop_2334
	fblg,a	%fcc1,	loop_2335
loop_2333:
	array16	%g5,	%o7,	%l2
	fmovse	%icc,	%f4,	%f29
loop_2334:
	membar	0x76
loop_2335:
	sll	%o3,	%o0,	%l0
	movrne	%g1,	0x0BA,	%o6
	wr	%g0,	0x2b,	%asi
	stwa	%i7,	[%l7 + 0x20] %asi
	membar	#Sync
	smul	%i0,	%i3,	%i5
	bne,a	loop_2336
	addc	%o1,	0x0ADE,	%g6
	edge16ln	%i1,	%l5,	%l4
	subccc	%g2,	%o4,	%g7
loop_2336:
	srax	%l3,	0x1A,	%l6
	movgu	%icc,	%i6,	%l1
	movneg	%icc,	%i4,	%i2
	fmovrse	%g3,	%f10,	%f27
	wr	%g0,	0x81,	%asi
	lduwa	[%l7 + 0x50] %asi,	%o2
	movneg	%xcc,	%g4,	%o5
	sub	%g5,	0x1378,	%l2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	umulcc	%o7,	0x1BE5,	%o3
	fands	%f14,	%f30,	%f10
	fpsub16s	%f7,	%f19,	%f7
	mulscc	%o0,	%g1,	%l0
	movcc	%icc,	%i7,	%i0
	fbn,a	%fcc1,	loop_2337
	ta	%icc,	0x3
	fmovsg	%xcc,	%f2,	%f31
	mulx	%i3,	0x04B1,	%o6
loop_2337:
	udivcc	%o1,	0x1187,	%g6
	tsubcc	%i1,	0x06ED,	%i5
	orcc	%l5,	0x10E4,	%l4
	alignaddr	%g2,	%g7,	%l3
	andcc	%l6,	0x0C75,	%i6
	movvs	%xcc,	%o4,	%l1
	mulx	%i2,	0x0718,	%i4
	subccc	%g3,	0x08BC,	%o2
	addccc	%o5,	%g5,	%l2
	tg	%xcc,	0x1
	add	%g4,	%o7,	%o0
	xnor	%g1,	%l0,	%i7
	movn	%icc,	%i0,	%i3
	movpos	%xcc,	%o3,	%o6
	bleu,pn	%xcc,	loop_2338
	popc	%o1,	%g6
	fexpand	%f18,	%f6
	alignaddr	%i5,	%l5,	%i1
loop_2338:
	fbul,a	%fcc2,	loop_2339
	fornot2s	%f5,	%f17,	%f1
	fornot2	%f26,	%f10,	%f16
	set	0x60, %i0
	stxa	%l4,	[%l7 + %i0] 0x2f
	membar	#Sync
loop_2339:
	nop
	add	%l7,	0x60,	%l6
	wr	%g0,	0x11,	%asi
	ldxa	[%l6] %asi,	%g7
	casxa	[%l6] 0x11,	%g7,	%l3
	xnor	%g2,	%i6,	%l6
	edge16n	%l1,	%i2,	%i4
	sdivx	%g3,	0x0478,	%o2
	taddcc	%o4,	%o5,	%l2
	fmovse	%xcc,	%f15,	%f22
	mulx	%g5,	%g4,	%o0
	ldsw	[%l7 + 0x38],	%g1
	bne,a,pt	%icc,	loop_2340
	srax	%o7,	%l0,	%i0
	edge8l	%i7,	%o3,	%o6
	tvs	%icc,	0x0
loop_2340:
	brgez,a	%o1,	loop_2341
	movcc	%icc,	%i3,	%g6
	movre	%l5,	%i5,	%l4
	stb	%i1,	[%l7 + 0x63]
loop_2341:
	te	%xcc,	0x0
	fpadd16	%f16,	%f14,	%f4
	tneg	%icc,	0x7
	sdivcc	%g7,	0x013D,	%g2
	membar	0x2F
	fandnot1	%f20,	%f4,	%f6
	udivcc	%i6,	0x1338,	%l3
	movn	%icc,	%l6,	%i2
	array32	%i4,	%g3,	%o2
	tcc	%xcc,	0x5
	fbuge,a	%fcc0,	loop_2342
	ba,pn	%xcc,	loop_2343
	flush	%l7 + 0x48
	nop
	setx	loop_2344,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_2342:
	edge8n	%o4,	%o5,	%l1
loop_2343:
	fmovdle	%icc,	%f12,	%f25
	set	0x40, %i1
	stda	%f16,	[%l7 + %i1] 0x88
loop_2344:
	edge16ln	%l2,	%g5,	%g4
	smul	%o0,	%g1,	%l0
	fmovscc	%icc,	%f3,	%f16
	fsrc1	%f12,	%f26
	edge32l	%i0,	%i7,	%o7
	subcc	%o6,	%o1,	%o3
	fmovrdlz	%i3,	%f20,	%f0
	fpadd32	%f28,	%f14,	%f30
	fmuld8sux16	%f2,	%f8,	%f2
	array8	%l5,	%i5,	%l4
	fpack32	%f2,	%f8,	%f22
	be	%icc,	loop_2345
	ble,a,pn	%xcc,	loop_2346
	tne	%icc,	0x3
	movg	%xcc,	%g6,	%g7
loop_2345:
	move	%xcc,	%i1,	%i6
loop_2346:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	set	0x20, %g7
	ldd	[%l7 + %g7],	%f0
	taddcctv	%l3,	0x11B5,	%g2
	sll	%l6,	0x1D,	%i2
	fbuge,a	%fcc1,	loop_2347
	edge32ln	%g3,	%o2,	%o4
	movle	%xcc,	%i4,	%o5
	fmovrdlez	%l1,	%f0,	%f8
loop_2347:
	smul	%g5,	0x00A2,	%l2
	movgu	%xcc,	%o0,	%g1
	mulx	%g4,	0x0421,	%l0
	smulcc	%i0,	%i7,	%o6
	fabsd	%f20,	%f16
	and	%o7,	%o3,	%i3
	tle	%xcc,	0x6
	addc	%l5,	%o1,	%l4
	tvs	%xcc,	0x6
	fcmpgt16	%f10,	%f26,	%i5
	bgu	%xcc,	loop_2348
	ba,pn	%xcc,	loop_2349
	fbu	%fcc1,	loop_2350
	array32	%g7,	%i1,	%i6
loop_2348:
	sllx	%l3,	0x03,	%g2
loop_2349:
	fmovscs	%icc,	%f12,	%f0
loop_2350:
	subccc	%l6,	%g6,	%g3
	bcs,a,pn	%xcc,	loop_2351
	movvc	%icc,	%i2,	%o4
	movrgez	%i4,	%o5,	%o2
	set	0x2C, %l2
	stwa	%l1,	[%l7 + %l2] 0x04
loop_2351:
	fnands	%f17,	%f17,	%f3
	fcmped	%fcc3,	%f2,	%f0
	fbne	%fcc1,	loop_2352
	tl	%xcc,	0x1
	lduh	[%l7 + 0x70],	%l2
	edge32n	%g5,	%o0,	%g4
loop_2352:
	fnand	%f20,	%f20,	%f26
	edge32n	%l0,	%i0,	%g1
	sethi	0x038E,	%o6
	stx	%i7,	[%l7 + 0x18]
	ldx	[%l7 + 0x58],	%o7
	fpack16	%f20,	%f0
	movrlz	%i3,	%l5,	%o1
	mulx	%o3,	0x12AA,	%i5
	taddcctv	%l4,	%g7,	%i6
	fmovsge	%xcc,	%f16,	%f16
	movn	%icc,	%i1,	%l3
	fmovscc	%icc,	%f28,	%f9
	movgu	%icc,	%l6,	%g6
	fmovscs	%icc,	%f21,	%f18
	lduw	[%l7 + 0x74],	%g3
	fmovrdlez	%i2,	%f24,	%f6
	tneg	%xcc,	0x5
	srl	%g2,	0x1F,	%o4
	set	0x0C, %i2
	ldswa	[%l7 + %i2] 0x19,	%o5
	tvs	%icc,	0x6
	fsrc1s	%f18,	%f6
	array8	%o2,	%l1,	%l2
	fmovsneg	%xcc,	%f24,	%f11
	bl	loop_2353
	orcc	%g5,	%i4,	%g4
	bl,a,pt	%icc,	loop_2354
	brlz,a	%o0,	loop_2355
loop_2353:
	fmovsvs	%xcc,	%f9,	%f1
	ldsw	[%l7 + 0x3C],	%i0
loop_2354:
	movn	%icc,	%l0,	%g1
loop_2355:
	mulx	%o6,	0x0724,	%o7
	sethi	0x0B25,	%i3
	sdivcc	%i7,	0x0ADF,	%l5
	fmovd	%f20,	%f24
	edge16l	%o3,	%o1,	%i5
	udivx	%l4,	0x1633,	%i6
	add	%l7,	0x50,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] %asi,	%i1,	%g7
	sdivx	%l3,	0x1C13,	%l6
	edge16l	%g3,	%i2,	%g6
	fornot1s	%f18,	%f16,	%f21
	fmovrsne	%o4,	%f31,	%f8
	ta	%icc,	0x6
	wr	%g0,	0xf1,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
	fmovspos	%xcc,	%f27,	%f12
	umul	%o5,	0x1B3C,	%g2
	fbe	%fcc3,	loop_2356
	alignaddr	%o2,	%l2,	%l1
	array16	%g5,	%g4,	%i4
	fbne,a	%fcc3,	loop_2357
loop_2356:
	fmovrsgz	%i0,	%f1,	%f14
	fands	%f26,	%f13,	%f21
	fmovrsne	%l0,	%f11,	%f28
loop_2357:
	ble,a	%icc,	loop_2358
	fandnot2s	%f16,	%f9,	%f15
	xorcc	%o0,	0x0E9E,	%g1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2358:
	edge8n	%o6,	%o7,	%i7
	andncc	%i3,	%l5,	%o1
	edge16n	%i5,	%l4,	%i6
	ldsw	[%l7 + 0x0C],	%i1
	movvs	%icc,	%g7,	%o3
	fsrc2s	%f4,	%f19
	udiv	%l6,	0x173E,	%g3
	fbul,a	%fcc1,	loop_2359
	brlz	%l3,	loop_2360
	sethi	0x04EF,	%g6
	fmovrdne	%o4,	%f18,	%f12
loop_2359:
	addccc	%o5,	0x1CCB,	%g2
loop_2360:
	bvc,pt	%xcc,	loop_2361
	sdivx	%o2,	0x1B53,	%i2
	bleu	loop_2362
	xorcc	%l2,	%g5,	%g4
loop_2361:
	bg,a	loop_2363
	mulscc	%l1,	0x0119,	%i4
loop_2362:
	alignaddrl	%l0,	%i0,	%g1
	wr	%g0,	0x27,	%asi
	stda	%o0,	[%l7 + 0x10] %asi
	membar	#Sync
loop_2363:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ble	%icc,	loop_2364
	movn	%icc,	%o6,	%o7
	mulx	%i7,	0x017B,	%l5
	te	%xcc,	0x2
loop_2364:
	fcmple32	%f30,	%f20,	%o1
	orcc	%i5,	0x04AB,	%i3
	andn	%i6,	%i1,	%l4
	fmovdvc	%icc,	%f21,	%f11
	bvs,a	%xcc,	loop_2365
	membar	0x27
	movle	%icc,	%o3,	%g7
	tneg	%xcc,	0x3
loop_2365:
	udivx	%l6,	0x0493,	%l3
	bvs,a	%xcc,	loop_2366
	movneg	%icc,	%g6,	%o4
	sethi	0x06D8,	%o5
	edge8l	%g2,	%g3,	%o2
loop_2366:
	brlz	%l2,	loop_2367
	orncc	%g5,	%i2,	%l1
	movle	%icc,	%g4,	%i4
	subc	%i0,	0x0BB8,	%l0
loop_2367:
	tcs	%icc,	0x7
	fmovdgu	%icc,	%f4,	%f30
	bne,a,pn	%icc,	loop_2368
	fand	%f2,	%f0,	%f30
	edge8n	%g1,	%o0,	%o7
	fpack32	%f2,	%f14,	%f22
loop_2368:
	std	%o6,	[%l7 + 0x28]
	array16	%i7,	%l5,	%o1
	sir	0x0690
	fmovrdgz	%i3,	%f0,	%f24
	taddcc	%i5,	0x04BA,	%i1
	array32	%l4,	%i6,	%g7
	umul	%l6,	0x0081,	%o3
	mova	%xcc,	%l3,	%g6
	fcmple32	%f22,	%f16,	%o4
	sdivcc	%o5,	0x01D8,	%g3
	fmovdpos	%icc,	%f10,	%f5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tg	%xcc,	0x7
	mulx	%g2,	0x1657,	%o2
	subc	%l2,	%g5,	%l1
	sdiv	%g4,	0x09EB,	%i4
	brgz	%i2,	loop_2369
	orcc	%l0,	%i0,	%o0
	for	%f14,	%f10,	%f2
	tleu	%icc,	0x3
loop_2369:
	add	%o7,	0x194E,	%g1
	movn	%icc,	%i7,	%l5
	st	%f21,	[%l7 + 0x6C]
	edge16ln	%o6,	%i3,	%o1
	movrlez	%i1,	%i5,	%l4
	movl	%icc,	%i6,	%g7
	fble	%fcc3,	loop_2370
	tn	%xcc,	0x6
	sdiv	%o3,	0x1EF2,	%l3
	srlx	%g6,	%l6,	%o5
loop_2370:
	std	%f10,	[%l7 + 0x30]
	fornot1s	%f0,	%f3,	%f1
	fmuld8sux16	%f11,	%f0,	%f20
	udivx	%o4,	0x1530,	%g2
	fzeros	%f26
	edge32l	%o2,	%g3,	%g5
	andcc	%l2,	%g4,	%i4
	fnegs	%f18,	%f11
	brz,a	%l1,	loop_2371
	brlz	%i2,	loop_2372
	movcc	%icc,	%i0,	%o0
	udiv	%o7,	0x19C7,	%l0
loop_2371:
	tneg	%xcc,	0x6
loop_2372:
	fcmpne32	%f26,	%f6,	%g1
	sdivcc	%l5,	0x0E9D,	%o6
	set	0x80, %o3
	ldxa	[%g0 + %o3] 0x58,	%i3
	membar	#Sync
	wr	%g0,	0xf9,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	bcs,pn	%icc,	loop_2373
	andcc	%i7,	0x15C9,	%o1
	array16	%i1,	%i5,	%l4
	movneg	%xcc,	%g7,	%i6
loop_2373:
	movrgz	%l3,	%g6,	%o3
	tge	%xcc,	0x1
	and	%l6,	0x1B79,	%o5
	set	0x6E, %l3
	ldsha	[%l7 + %l3] 0x81,	%o4
	tl	%icc,	0x6
	std	%f10,	[%l7 + 0x20]
	addcc	%g2,	%g3,	%g5
	udivcc	%o2,	0x1FB5,	%l2
	fmovdcc	%xcc,	%f2,	%f3
	edge8	%i4,	%l1,	%i2
	stw	%g4,	[%l7 + 0x44]
	wr	%g0,	0x81,	%asi
	ldstuba	[%l7 + 0x68] %asi,	%o0
	membar	0x45
	movpos	%xcc,	%o7,	%l0
	sra	%g1,	0x1D,	%i0
	wr	%g0,	0x11,	%asi
	stba	%l5,	[%l7 + 0x48] %asi
	fmovdle	%icc,	%f28,	%f29
	smul	%i3,	%o6,	%o1
	movvs	%xcc,	%i1,	%i5
	mova	%icc,	%l4,	%g7
	fmovrdne	%i6,	%f16,	%f26
	movgu	%icc,	%l3,	%i7
	edge8	%o3,	%l6,	%g6
	stb	%o4,	[%l7 + 0x0E]
	tneg	%icc,	0x2
	wr	%g0,	0xf8,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
	fmovsgu	%icc,	%f8,	%f23
	membar	0x08
	taddcc	%o5,	0x090B,	%g2
	movgu	%xcc,	%g3,	%g5
	alignaddrl	%o2,	%l2,	%i4
	fsrc2s	%f16,	%f23
	subcc	%l1,	0x0991,	%i2
	mulx	%o0,	0x1685,	%g4
	tn	%icc,	0x7
	fmovs	%f0,	%f7
	tleu	%xcc,	0x7
	fxors	%f23,	%f7,	%f18
	tcc	%xcc,	0x5
	fmovrdgez	%o7,	%f24,	%f4
	fmovdge	%xcc,	%f30,	%f4
	fmovsne	%xcc,	%f21,	%f0
	fnand	%f4,	%f14,	%f8
	sll	%l0,	%g1,	%l5
	fbge	%fcc2,	loop_2374
	ldd	[%l7 + 0x10],	%i2
	edge32l	%i0,	%o6,	%i1
	bg,pt	%icc,	loop_2375
loop_2374:
	std	%f10,	[%l7 + 0x68]
	mulscc	%o1,	%i5,	%l4
	wr	%g0,	0x19,	%asi
	ldstuba	[%l7 + 0x32] %asi,	%g7
loop_2375:
	orn	%l3,	0x1682,	%i6
	nop
	set	0x5C, %l0
	sth	%i7,	[%l7 + %l0]
	membar	0x16
	alignaddrl	%o3,	%l6,	%o4
	movl	%xcc,	%o5,	%g6
	andcc	%g2,	0x1953,	%g3
	fpackfix	%f0,	%f6
	fands	%f22,	%f12,	%f15
	movge	%xcc,	%o2,	%l2
	subc	%g5,	0x0042,	%l1
	movrlez	%i4,	0x338,	%i2
	taddcctv	%o0,	0x1F36,	%o7
	taddcc	%g4,	0x1F45,	%g1
	fmovdleu	%xcc,	%f28,	%f29
	sdiv	%l5,	0x16E4,	%l0
	edge8	%i3,	%i0,	%i1
	edge32ln	%o1,	%o6,	%i5
	subccc	%g7,	%l4,	%l3
	movpos	%xcc,	%i7,	%i6
	fcmped	%fcc0,	%f12,	%f28
	for	%f14,	%f10,	%f10
	tge	%icc,	0x3
	fcmple16	%f24,	%f24,	%o3
	wr	%g0,	0x04,	%asi
	ldstuba	[%l7 + 0x7C] %asi,	%o4
	popc	0x106C,	%l6
	call	loop_2376
	ble	loop_2377
	array16	%g6,	%g2,	%o5
	tne	%icc,	0x6
loop_2376:
	andncc	%g3,	%l2,	%g5
loop_2377:
	fbue	%fcc3,	loop_2378
	or	%o2,	0x0A94,	%l1
	ta	%icc,	0x6
	movge	%icc,	%i2,	%i4
loop_2378:
	fcmpgt32	%f24,	%f8,	%o0
	movrne	%o7,	0x1F8,	%g4
	fmovsg	%icc,	%f31,	%f23
	ldsw	[%l7 + 0x64],	%l5
	mova	%icc,	%l0,	%g1
	fmovsne	%icc,	%f13,	%f14
	mova	%icc,	%i0,	%i1
	umul	%o1,	%i3,	%o6
	movn	%xcc,	%g7,	%l4
	srlx	%l3,	%i5,	%i7
	sdivx	%i6,	0x1E18,	%o3
	movrne	%l6,	0x04C,	%g6
	smulcc	%g2,	%o4,	%o5
	swap	[%l7 + 0x0C],	%g3
	pdist	%f6,	%f22,	%f14
	edge16n	%g5,	%o2,	%l2
	movleu	%xcc,	%i2,	%l1
	bpos,a	%xcc,	loop_2379
	fornot1s	%f24,	%f15,	%f21
	tne	%icc,	0x2
	udiv	%o0,	0x0FDD,	%i4
loop_2379:
	ldsb	[%l7 + 0x2C],	%o7
	sdiv	%g4,	0x0EEB,	%l5
	edge8n	%g1,	%i0,	%i1
	fpsub16s	%f22,	%f1,	%f27
	pdist	%f8,	%f2,	%f14
	movleu	%xcc,	%o1,	%i3
	andn	%l0,	0x1918,	%g7
	movcc	%icc,	%o6,	%l3
	orcc	%i5,	0x1C8A,	%l4
	movcs	%icc,	%i6,	%o3
	udiv	%i7,	0x0CFF,	%l6
	fors	%f7,	%f12,	%f9
	fmovsne	%xcc,	%f10,	%f1
	subc	%g6,	%g2,	%o4
	subc	%o5,	0x1247,	%g5
	edge16n	%o2,	%l2,	%i2
	movrlez	%g3,	0x194,	%l1
	andncc	%o0,	%i4,	%g4
	fcmple16	%f24,	%f30,	%l5
	wr	%g0,	0x23,	%asi
	stda	%o6,	[%l7 + 0x70] %asi
	membar	#Sync
	fpackfix	%f14,	%f2
	fbo,a	%fcc3,	loop_2380
	subcc	%g1,	0x178B,	%i0
	swap	[%l7 + 0x28],	%o1
	wr	%g0,	0x89,	%asi
	lda	[%l7 + 0x7C] %asi,	%f28
loop_2380:
	edge16ln	%i3,	%i1,	%l0
	fxnor	%f22,	%f10,	%f22
	udivcc	%g7,	0x032F,	%o6
	fmovdgu	%icc,	%f23,	%f2
	fmovrslz	%l3,	%f14,	%f27
	taddcc	%i5,	%l4,	%o3
	fxor	%f30,	%f28,	%f20
	umul	%i7,	0x0B77,	%i6
	udiv	%g6,	0x0936,	%g2
	add	%l6,	0x1DE3,	%o4
	orcc	%g5,	%o5,	%l2
	std	%i2,	[%l7 + 0x28]
	movle	%xcc,	%g3,	%l1
	tcs	%icc,	0x2
	tcs	%icc,	0x7
	fblg	%fcc3,	loop_2381
	movge	%xcc,	%o0,	%o2
	tn	%xcc,	0x4
	sra	%g4,	%i4,	%o7
loop_2381:
	edge8l	%l5,	%i0,	%o1
	ldstub	[%l7 + 0x1A],	%g1
	movrgz	%i1,	%i3,	%l0
	umulcc	%g7,	0x1D40,	%l3
	ba,a,pt	%icc,	loop_2382
	movcs	%icc,	%o6,	%l4
	sll	%i5,	0x04,	%i7
	array8	%o3,	%i6,	%g6
loop_2382:
	movvc	%xcc,	%g2,	%l6
	fpadd16s	%f22,	%f3,	%f23
	xor	%o4,	0x0D72,	%o5
	and	%l2,	0x115D,	%g5
	nop
	setx loop_2383, %l0, %l1
	jmpl %l1, %g3
	movle	%icc,	%i2,	%l1
	tvs	%icc,	0x6
	taddcctv	%o0,	0x1027,	%g4
loop_2383:
	mulx	%o2,	%o7,	%i4
	fandnot1s	%f1,	%f16,	%f9
	edge16ln	%i0,	%l5,	%g1
	taddcc	%i1,	0x016E,	%i3
	nop
	setx loop_2384, %l0, %l1
	jmpl %l1, %o1
	or	%g7,	0x05FB,	%l3
	tleu	%icc,	0x6
	udivx	%l0,	0x06E1,	%l4
loop_2384:
	orcc	%o6,	0x1646,	%i5
	edge8ln	%o3,	%i7,	%g6
	fpadd32s	%f5,	%f4,	%f16
	sll	%g2,	0x08,	%i6
	movpos	%icc,	%l6,	%o5
	ble,pt	%icc,	loop_2385
	andn	%o4,	%g5,	%l2
	fnot2	%f22,	%f30
	tsubcc	%g3,	0x0D79,	%i2
loop_2385:
	be,pn	%icc,	loop_2386
	movvs	%icc,	%o0,	%l1
	sub	%g4,	0x049B,	%o7
	movneg	%icc,	%o2,	%i4
loop_2386:
	xorcc	%l5,	%i0,	%g1
	movre	%i1,	0x225,	%o1
	ldd	[%l7 + 0x78],	%i2
	bne	loop_2387
	edge8n	%g7,	%l3,	%l0
	fmovdg	%xcc,	%f16,	%f12
	smulcc	%l4,	0x1AFD,	%o6
loop_2387:
	edge16n	%i5,	%o3,	%g6
	fnot1	%f28,	%f8
	siam	0x5
	tne	%xcc,	0x4
	bshuffle	%f8,	%f12,	%f18
	wr	%g0,	0x19,	%asi
	ldswa	[%l7 + 0x64] %asi,	%i7
	fnot2	%f14,	%f6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	umulcc	%i6,	%l6,	%g2
	call	loop_2388
	orn	%o5,	%o4,	%g5
	movgu	%icc,	%g3,	%l2
	tpos	%icc,	0x6
loop_2388:
	tge	%icc,	0x7
	edge16ln	%i2,	%l1,	%g4
	bleu	%xcc,	loop_2389
	array16	%o7,	%o0,	%o2
	fnegd	%f18,	%f8
	fand	%f4,	%f12,	%f16
loop_2389:
	movrgz	%l5,	%i4,	%i0
	smulcc	%i1,	%g1,	%i3
	ldd	[%l7 + 0x10],	%f14
	move	%xcc,	%g7,	%o1
	xorcc	%l0,	%l4,	%o6
	call	loop_2390
	fmovrdlez	%l3,	%f16,	%f22
	sethi	0x1D62,	%o3
	movrlz	%g6,	%i5,	%i6
loop_2390:
	ldstub	[%l7 + 0x6F],	%i7
	te	%xcc,	0x7
	fmovrdgz	%g2,	%f0,	%f30
	edge8l	%l6,	%o5,	%g5
	bge	%icc,	loop_2391
	fcmped	%fcc0,	%f18,	%f28
	movleu	%icc,	%o4,	%l2
	wr	%g0,	0x89,	%asi
	lduha	[%l7 + 0x54] %asi,	%g3
loop_2391:
	brgez	%i2,	loop_2392
	fnands	%f19,	%f13,	%f6
	movrgez	%g4,	%o7,	%o0
	fbg,a	%fcc3,	loop_2393
loop_2392:
	tsubcctv	%l1,	0x17D2,	%l5
	tleu	%xcc,	0x0
	move	%icc,	%i4,	%i0
loop_2393:
	edge8ln	%i1,	%o2,	%g1
	movge	%xcc,	%g7,	%i3
	addcc	%o1,	%l0,	%l4
	swap	[%l7 + 0x48],	%o6
	fpadd16s	%f29,	%f24,	%f7
	popc	0x1FE4,	%l3
	fmovdne	%icc,	%f17,	%f9
	sethi	0x167C,	%o3
	udivcc	%i5,	0x0E8E,	%g6
	tneg	%icc,	0x4
	add	%l7,	0x70,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%i7
	casxa	[%l6] 0x80,	%i7,	%g2
	te	%xcc,	0x7
	tge	%xcc,	0x7
	movrgez	%l6,	%o5,	%i6
	xor	%o4,	0x161F,	%g5
	ldd	[%l7 + 0x18],	%f30
	addcc	%l2,	%i2,	%g4
	edge16l	%o7,	%o0,	%g3
	or	%l5,	%l1,	%i0
	xnor	%i1,	0x0904,	%o2
	fbne,a	%fcc2,	loop_2394
	mulx	%i4,	0x1628,	%g7
	edge32n	%i3,	%o1,	%g1
	and	%l0,	%l4,	%l3
loop_2394:
	popc	%o3,	%i5
	movne	%icc,	%g6,	%i7
	fpack32	%f2,	%f2,	%f12
	array16	%o6,	%l6,	%g2
	umul	%o5,	0x0E1D,	%o4
	fnot1	%f30,	%f4
	tgu	%icc,	0x5
	ldsw	[%l7 + 0x30],	%i6
	fsrc2s	%f12,	%f5
	nop
	setx	loop_2395,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tvs	%xcc,	0x4
	addcc	%l2,	%i2,	%g4
	movrne	%g5,	0x2AD,	%o7
loop_2395:
	subccc	%o0,	0x14F6,	%g3
	fmovrsne	%l1,	%f10,	%f9
	edge32l	%l5,	%i0,	%i1
	fpsub32	%f30,	%f18,	%f18
	brlz	%i4,	loop_2396
	tn	%xcc,	0x4
	sir	0x0D42
	nop
	setx loop_2397, %l0, %l1
	jmpl %l1, %g7
loop_2396:
	fbug,a	%fcc3,	loop_2398
	or	%o2,	%o1,	%g1
	subcc	%i3,	0x13EF,	%l0
loop_2397:
	nop
	set	0x30, %g4
	ldda	[%l7 + %g4] 0x2f,	%l2
loop_2398:
	fcmpd	%fcc3,	%f8,	%f26
	tge	%icc,	0x7
	bn	loop_2399
	ta	%icc,	0x3
	set	0x58, %o2
	swapa	[%l7 + %o2] 0x04,	%o3
loop_2399:
	fnegs	%f6,	%f24
	fornot2s	%f23,	%f2,	%f16
	flush	%l7 + 0x48
	udiv	%l4,	0x0836,	%i5
	tleu	%icc,	0x3
	flush	%l7 + 0x64
	fmovsvs	%xcc,	%f22,	%f22
	nop
	setx	loop_2400,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fmovsne	%xcc,	%f17,	%f16
	sll	%i7,	%o6,	%g6
	bvs,a,pn	%icc,	loop_2401
loop_2400:
	fbg,a	%fcc3,	loop_2402
	fsrc2s	%f30,	%f27
	lduh	[%l7 + 0x1C],	%g2
loop_2401:
	tvc	%icc,	0x0
loop_2402:
	fmovsa	%xcc,	%f1,	%f29
	array16	%l6,	%o5,	%i6
	tpos	%icc,	0x0
	addcc	%o4,	%l2,	%i2
	array8	%g4,	%g5,	%o7
	bpos	%icc,	loop_2403
	bne,a	loop_2404
	tge	%icc,	0x4
	fmovsne	%xcc,	%f18,	%f12
loop_2403:
	subccc	%g3,	%l1,	%l5
loop_2404:
	edge8ln	%i0,	%i1,	%o0
	fmovsgu	%xcc,	%f14,	%f4
	wr	%g0,	0x88,	%asi
	ldstuba	[%l7 + 0x4A] %asi,	%g7
	set	0x54, %i6
	lda	[%l7 + %i6] 0x81,	%f4
	sethi	0x1A39,	%i4
	sethi	0x19D3,	%o1
	bge,a,pt	%icc,	loop_2405
	movcc	%xcc,	%o2,	%i3
	bcc	%icc,	loop_2406
	ldd	[%l7 + 0x60],	%f28
loop_2405:
	movrne	%l0,	%g1,	%o3
	tne	%icc,	0x4
loop_2406:
	fpsub32s	%f6,	%f31,	%f8
	fone	%f10
	fbuge	%fcc3,	loop_2407
	fpack16	%f26,	%f31
	udivx	%l3,	0x199B,	%l4
	set	0x61, %g3
	lduba	[%l7 + %g3] 0x04,	%i7
loop_2407:
	subc	%i5,	%o6,	%g2
	fmovrsne	%g6,	%f22,	%f4
	mulscc	%o5,	0x0747,	%i6
	bl	%xcc,	loop_2408
	ld	[%l7 + 0x0C],	%f13
	tge	%icc,	0x6
	brlez,a	%l6,	loop_2409
loop_2408:
	fcmpgt32	%f10,	%f18,	%o4
	tneg	%icc,	0x1
	or	%i2,	%g4,	%l2
loop_2409:
	array8	%o7,	%g3,	%l1
	umul	%g5,	%l5,	%i1
	movg	%icc,	%i0,	%o0
	fbug	%fcc0,	loop_2410
	fnot2s	%f2,	%f28
	sub	%i4,	0x1E5B,	%g7
	udivcc	%o1,	0x1E8A,	%o2
loop_2410:
	sdivx	%i3,	0x0DF8,	%g1
	udiv	%l0,	0x0969,	%o3
	movne	%icc,	%l4,	%l3
	set	0x220, %l4
	ldxa	[%g0 + %l4] 0x52,	%i5
	srax	%o6,	0x0B,	%g2
	subccc	%g6,	%o5,	%i7
	sll	%i6,	0x0F,	%o4
	fornot1	%f6,	%f14,	%f12
	tle	%icc,	0x4
	edge16n	%i2,	%g4,	%l2
	fblg,a	%fcc2,	loop_2411
	fmovrsgez	%o7,	%f13,	%f15
	subc	%l6,	%l1,	%g3
	stw	%l5,	[%l7 + 0x0C]
loop_2411:
	fbg	%fcc0,	loop_2412
	movg	%icc,	%i1,	%i0
	alignaddrl	%g5,	%o0,	%g7
	edge32n	%o1,	%i4,	%i3
loop_2412:
	fmovsneg	%icc,	%f29,	%f1
	wr	%g0,	0x80,	%asi
	lduba	[%l7 + 0x49] %asi,	%o2
	fpadd32	%f20,	%f8,	%f20
	mova	%xcc,	%g1,	%l0
	tl	%icc,	0x2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbuge,a	%fcc2,	loop_2413
	movne	%xcc,	%l4,	%o3
	tge	%icc,	0x5
	bge	loop_2414
loop_2413:
	fors	%f3,	%f15,	%f3
	fmovspos	%icc,	%f17,	%f1
	array8	%i5,	%l3,	%g2
loop_2414:
	orn	%g6,	%o5,	%i7
	movrgez	%o6,	%o4,	%i6
	fbul	%fcc0,	loop_2415
	alignaddrl	%g4,	%i2,	%l2
	tleu	%icc,	0x5
	tge	%xcc,	0x0
loop_2415:
	movrgz	%l6,	0x175,	%o7
	movrlez	%g3,	0x0D5,	%l5
	tge	%xcc,	0x0
	movleu	%icc,	%l1,	%i1
	brgz	%i0,	loop_2416
	udivcc	%o0,	0x0B94,	%g7
	or	%g5,	0x1101,	%o1
	bcs,pn	%xcc,	loop_2417
loop_2416:
	fbl,a	%fcc1,	loop_2418
	movl	%xcc,	%i4,	%o2
	smul	%i3,	%l0,	%l4
loop_2417:
	movrgez	%o3,	%i5,	%l3
loop_2418:
	fsrc2s	%f8,	%f26
	sdiv	%g2,	0x1046,	%g6
	fmovsn	%icc,	%f27,	%f10
	mova	%xcc,	%o5,	%g1
	pdist	%f20,	%f18,	%f30
	wr	%g0,	0x0c,	%asi
	lduwa	[%l7 + 0x3C] %asi,	%o6
	edge16ln	%o4,	%i7,	%g4
	orncc	%i2,	0x1D1D,	%i6
	fmovsge	%xcc,	%f24,	%f22
	fmovs	%f25,	%f6
	taddcc	%l2,	0x0C58,	%o7
	lduw	[%l7 + 0x20],	%g3
	add	%l7,	0x40,	%l6
	wr	%g0,	0x19,	%asi
	casxa	[%l6] %asi,	%l6,	%l1
	movpos	%icc,	%l5,	%i1
	add	%l7,	0x50,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%o0
	casa	[%l6] 0x80,	%o0,	%i0
	movl	%icc,	%g5,	%g7
	mova	%xcc,	%o1,	%i4
	movgu	%xcc,	%o2,	%i3
	bg,a	loop_2419
	movn	%icc,	%l4,	%l0
	fsrc1	%f20,	%f0
	array8	%i5,	%l3,	%g2
loop_2419:
	swap	[%l7 + 0x30],	%o3
	taddcctv	%o5,	0x0DD2,	%g6
	edge32ln	%g1,	%o6,	%i7
	addcc	%o4,	0x17CC,	%g4
	brlz,a	%i6,	loop_2420
	nop
	set	0x18, %o6
	stw	%l2,	[%l7 + %o6]
	set	0x1C, %l5
	lda	[%l7 + %l5] 0x15,	%f7
loop_2420:
	andcc	%o7,	%g3,	%i2
	tleu	%icc,	0x2
	tne	%icc,	0x3
	orn	%l1,	0x0066,	%l5
	movg	%icc,	%l6,	%i1
	edge32ln	%i0,	%g5,	%g7
	edge8n	%o1,	%i4,	%o0
	addcc	%o2,	%i3,	%l4
	fbule,a	%fcc0,	loop_2421
	fcmpd	%fcc3,	%f6,	%f30
	fmovsg	%icc,	%f11,	%f24
	udiv	%i5,	0x1C48,	%l3
loop_2421:
	nop
	wr	%g0,	0x18,	%asi
	lduba	[%l7 + 0x40] %asi,	%g2
	edge16	%l0,	%o3,	%g6
	edge8l	%g1,	%o5,	%o6
	andn	%i7,	%o4,	%i6
	movg	%xcc,	%l2,	%g4
	ldsb	[%l7 + 0x32],	%g3
	set	0x16, %g1
	stha	%o7,	[%l7 + %g1] 0x19
	mova	%xcc,	%i2,	%l1
	fnands	%f17,	%f28,	%f21
	mulx	%l6,	0x092B,	%l5
	wr	%g0,	0x81,	%asi
	stxa	%i1,	[%l7 + 0x18] %asi
	fmovrdgez	%i0,	%f6,	%f8
	fpadd32s	%f3,	%f17,	%f27
	edge32ln	%g7,	%o1,	%g5
	for	%f2,	%f24,	%f10
	brnz	%i4,	loop_2422
	call	loop_2423
	bn	loop_2424
	andncc	%o0,	%o2,	%i3
loop_2422:
	nop
	add	%l7,	0x5C,	%l6
	wr	%g0,	0x11,	%asi
	lda	[%l6] %asi,	%l4
	casa	[%l6] %asi,	%l4,	%i5
loop_2423:
	fones	%f29
loop_2424:
	array8	%g2,	%l0,	%l3
	mova	%icc,	%g6,	%g1
	fnot2s	%f30,	%f5
	umul	%o5,	%o3,	%o6
	popc	%o4,	%i6
	brlez	%l2,	loop_2425
	tcc	%xcc,	0x4
	edge16l	%g4,	%g3,	%o7
	wr	%g0,	0x2b,	%asi
	stda	%i2,	[%l7 + 0x38] %asi
	membar	#Sync
loop_2425:
	prefetch	[%l7 + 0x44],	 0x0
	array16	%l1,	%i7,	%l6
	be,a,pn	%icc,	loop_2426
	fmovscc	%icc,	%f11,	%f26
	umulcc	%i1,	0x0198,	%l5
	edge16n	%i0,	%g7,	%g5
loop_2426:
	fmovdneg	%xcc,	%f14,	%f3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpsub32s	%f3,	%f23,	%f23
	tcc	%icc,	0x6
	ble,a	loop_2427
	fbn,a	%fcc2,	loop_2428
	fcmps	%fcc3,	%f10,	%f10
	fmovdg	%xcc,	%f25,	%f12
loop_2427:
	nop
	wr	%g0,	0x80,	%asi
	lduba	[%l7 + 0x57] %asi,	%i4
loop_2428:
	fmovrsgz	%o1,	%f3,	%f6
	movrlz	%o0,	%i3,	%l4
	bcs	loop_2429
	fbu,a	%fcc3,	loop_2430
	xnor	%i5,	%o2,	%l0
	movvs	%icc,	%l3,	%g6
loop_2429:
	nop
	wr	%g0,	0x10,	%asi
	stha	%g2,	[%l7 + 0x30] %asi
loop_2430:
	srlx	%o5,	%o3,	%g1
	brgez	%o4,	loop_2431
	array8	%o6,	%i6,	%l2
	edge8ln	%g3,	%g4,	%i2
	edge8l	%l1,	%i7,	%o7
loop_2431:
	movge	%xcc,	%i1,	%l5
	ldx	[%l7 + 0x30],	%i0
	edge8ln	%g7,	%g5,	%i4
	mulscc	%o1,	0x1589,	%o0
	std	%f0,	[%l7 + 0x30]
	mulscc	%l6,	0x1793,	%i3
	array16	%i5,	%l4,	%l0
	tsubcctv	%o2,	%l3,	%g6
	fpack16	%f26,	%f0
	ba	loop_2432
	mulx	%o5,	0x014D,	%g2
	fbg	%fcc0,	loop_2433
	mova	%icc,	%o3,	%o4
loop_2432:
	stx	%g1,	[%l7 + 0x08]
	ldx	[%l7 + 0x78],	%o6
loop_2433:
	movpos	%xcc,	%i6,	%g3
	stx	%g4,	[%l7 + 0x28]
	mulx	%l2,	%i2,	%l1
	xorcc	%i7,	0x0B6F,	%o7
	fpsub32	%f0,	%f18,	%f28
	udiv	%l5,	0x1D43,	%i1
	addccc	%i0,	0x0AF7,	%g7
	array32	%g5,	%i4,	%o1
	orncc	%o0,	0x0E6C,	%i3
	xnor	%l6,	0x0FEE,	%i5
	orcc	%l4,	%l0,	%l3
	and	%g6,	0x000E,	%o2
	edge32n	%o5,	%o3,	%o4
	for	%f28,	%f2,	%f8
	srl	%g2,	%g1,	%i6
	movrne	%g3,	0x212,	%o6
	edge8l	%l2,	%i2,	%g4
	srlx	%l1,	%o7,	%l5
	sra	%i7,	0x18,	%i0
	fmovspos	%xcc,	%f20,	%f28
	bshuffle	%f0,	%f4,	%f0
	fpadd32	%f20,	%f20,	%f30
	srl	%i1,	%g7,	%i4
	movleu	%xcc,	%g5,	%o0
	andcc	%o1,	%l6,	%i5
	set	0x36, %i7
	ldstuba	[%l7 + %i7] 0x19,	%i3
	stb	%l4,	[%l7 + 0x73]
	fcmple16	%f2,	%f16,	%l0
	bne,a	%icc,	loop_2434
	fmovdg	%icc,	%f8,	%f6
	tvs	%icc,	0x3
	andncc	%g6,	%o2,	%l3
loop_2434:
	stx	%o5,	[%l7 + 0x40]
	wr	%g0,	0x18,	%asi
	lduba	[%l7 + 0x72] %asi,	%o4
	tg	%icc,	0x3
	tneg	%icc,	0x1
	addc	%o3,	%g1,	%g2
	movrgz	%g3,	%i6,	%o6
	sir	0x0871
	popc	0x0E09,	%i2
	array32	%g4,	%l1,	%o7
	tgu	%icc,	0x1
	mulx	%l2,	%i7,	%i0
	add	%i1,	%l5,	%g7
	fpack16	%f28,	%f25
	smul	%g5,	0x1937,	%i4
	edge8l	%o1,	%l6,	%i5
	bn	%xcc,	loop_2435
	fpsub16	%f26,	%f30,	%f10
	ld	[%l7 + 0x1C],	%f13
	movl	%xcc,	%i3,	%o0
loop_2435:
	brlez	%l4,	loop_2436
	ldstub	[%l7 + 0x14],	%l0
	xorcc	%g6,	0x029D,	%o2
	alignaddr	%l3,	%o4,	%o5
loop_2436:
	movrne	%g1,	0x3DF,	%g2
	array16	%g3,	%o3,	%i6
	tpos	%icc,	0x7
	movne	%icc,	%o6,	%g4
	edge16n	%l1,	%o7,	%i2
	edge32l	%l2,	%i0,	%i1
	or	%i7,	%g7,	%l5
	sll	%i4,	%g5,	%l6
	ldub	[%l7 + 0x17],	%o1
	umul	%i3,	0x1BFA,	%i5
	stw	%o0,	[%l7 + 0x10]
	add	%l7,	0x40,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%l0,	%g6
	fors	%f4,	%f4,	%f22
	fmovrde	%o2,	%f4,	%f26
	fmovdle	%xcc,	%f10,	%f5
	faligndata	%f0,	%f12,	%f24
	movvc	%icc,	%l4,	%o4
	tgu	%xcc,	0x4
	fmovdvc	%icc,	%f26,	%f16
	srl	%o5,	0x12,	%l3
	tsubcc	%g1,	%g3,	%g2
	std	%f22,	[%l7 + 0x10]
	bcs	loop_2437
	movrlez	%o3,	0x1B5,	%i6
	fmovdge	%icc,	%f18,	%f26
	movrgz	%g4,	%o6,	%o7
loop_2437:
	movre	%i2,	%l2,	%l1
	bl,pt	%icc,	loop_2438
	bpos,a,pn	%xcc,	loop_2439
	ldstub	[%l7 + 0x67],	%i1
	movl	%icc,	%i7,	%i0
loop_2438:
	edge32n	%l5,	%g7,	%i4
loop_2439:
	movvc	%icc,	%l6,	%g5
	fcmps	%fcc2,	%f6,	%f28
	tl	%icc,	0x2
	fmovdle	%icc,	%f6,	%f24
	tl	%icc,	0x6
	fbne,a	%fcc1,	loop_2440
	movre	%o1,	%i5,	%o0
	fbu	%fcc0,	loop_2441
	fbule	%fcc2,	loop_2442
loop_2440:
	or	%l0,	%g6,	%i3
	taddcctv	%o2,	%l4,	%o5
loop_2441:
	fones	%f8
loop_2442:
	alignaddr	%o4,	%l3,	%g1
	tgu	%xcc,	0x0
	fmovrsgez	%g3,	%f21,	%f4
	movpos	%xcc,	%g2,	%i6
	ldsb	[%l7 + 0x7D],	%g4
	brlz,a	%o6,	loop_2443
	movn	%icc,	%o3,	%o7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x22, %o0
	stha	%i2,	[%l7 + %o0] 0xe3
	membar	#Sync
loop_2443:
	tg	%xcc,	0x5
	movn	%xcc,	%l1,	%l2
	edge8ln	%i1,	%i0,	%i7
	popc	%l5,	%i4
	tneg	%icc,	0x7
	wr	%g0,	0x11,	%asi
	ldsba	[%l7 + 0x1B] %asi,	%g7
	movgu	%icc,	%l6,	%g5
	edge32l	%i5,	%o0,	%l0
	sllx	%g6,	%o1,	%i3
	movre	%o2,	%o5,	%l4
	tsubcctv	%l3,	%g1,	%g3
	udiv	%o4,	0x174A,	%g2
	subccc	%i6,	%g4,	%o6
	fmul8ulx16	%f12,	%f14,	%f24
	fmovsne	%xcc,	%f5,	%f5
	fnot1s	%f25,	%f7
	array32	%o7,	%o3,	%l1
	taddcctv	%i2,	0x16CD,	%i1
	set	0x08, %i5
	sta	%f9,	[%l7 + %i5] 0x10
	std	%f24,	[%l7 + 0x50]
	sir	0x1498
	movrne	%l2,	0x389,	%i7
	fpmerge	%f17,	%f11,	%f12
	movg	%xcc,	%i0,	%l5
	te	%xcc,	0x1
	bneg	%icc,	loop_2444
	andn	%i4,	0x072A,	%g7
	fcmpes	%fcc3,	%f22,	%f31
	fbge,a	%fcc1,	loop_2445
loop_2444:
	movne	%xcc,	%g5,	%l6
	swap	[%l7 + 0x5C],	%o0
	brnz	%i5,	loop_2446
loop_2445:
	srlx	%g6,	%l0,	%i3
	movl	%icc,	%o2,	%o1
	and	%o5,	%l4,	%g1
loop_2446:
	fandnot2	%f30,	%f16,	%f0
	array32	%l3,	%g3,	%o4
	tne	%xcc,	0x5
	fba,a	%fcc3,	loop_2447
	edge8	%g2,	%g4,	%i6
	fcmpne16	%f0,	%f4,	%o6
	fbne,a	%fcc2,	loop_2448
loop_2447:
	membar	0x2C
	movre	%o3,	%o7,	%l1
	edge16l	%i2,	%l2,	%i7
loop_2448:
	udivx	%i1,	0x1A58,	%i0
	edge8ln	%i4,	%g7,	%g5
	movleu	%xcc,	%l6,	%o0
	srlx	%l5,	%g6,	%l0
	alignaddr	%i3,	%i5,	%o1
	movgu	%xcc,	%o2,	%o5
	fmovdg	%xcc,	%f22,	%f18
	fcmpgt16	%f4,	%f30,	%l4
	movvc	%icc,	%g1,	%l3
	st	%f31,	[%l7 + 0x44]
	mova	%icc,	%o4,	%g2
	brz	%g3,	loop_2449
	tneg	%xcc,	0x3
	orn	%i6,	%g4,	%o3
	tl	%xcc,	0x1
loop_2449:
	movrlz	%o6,	0x3D6,	%o7
	add	%l1,	%l2,	%i7
	tvc	%icc,	0x5
	ldd	[%l7 + 0x68],	%f14
	fmovsvc	%xcc,	%f16,	%f5
	edge32n	%i1,	%i0,	%i4
	fpadd32	%f18,	%f28,	%f22
	te	%icc,	0x2
	wr	%g0,	0xeb,	%asi
	ldda	[%l7 + 0x40] %asi,	%i2
	bge,a	loop_2450
	bleu,pt	%icc,	loop_2451
	fmuld8ulx16	%f6,	%f0,	%f12
	fnot1s	%f16,	%f4
loop_2450:
	sdiv	%g5,	0x0639,	%l6
loop_2451:
	movcs	%xcc,	%o0,	%l5
	fexpand	%f16,	%f18
	srlx	%g7,	%l0,	%i3
	array32	%i5,	%g6,	%o1
	fmovsleu	%icc,	%f8,	%f19
	tne	%xcc,	0x7
	movl	%xcc,	%o5,	%o2
	orn	%g1,	0x1FDA,	%l3
	sdivx	%l4,	0x0125,	%g2
	tsubcctv	%o4,	%i6,	%g4
	fbue,a	%fcc3,	loop_2452
	edge32ln	%o3,	%g3,	%o7
	fmuld8ulx16	%f5,	%f8,	%f16
	edge16l	%o6,	%l1,	%i7
loop_2452:
	nop
	add	%l7,	0x38,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%l2
	casa	[%l6] %asi,	%l2,	%i0
	sll	%i4,	%i1,	%g5
	sethi	0x1FCF,	%i2
	andncc	%l6,	%o0,	%g7
	edge32ln	%l5,	%i3,	%l0
	set	0x60, %o7
	ldxa	[%l7 + %o7] 0x19,	%g6
	fnegs	%f21,	%f11
	movne	%icc,	%i5,	%o5
	tsubcc	%o2,	0x12A6,	%o1
	lduh	[%l7 + 0x70],	%g1
	fornot2	%f26,	%f0,	%f2
	movl	%icc,	%l3,	%g2
	fcmpes	%fcc0,	%f29,	%f10
	taddcctv	%o4,	%i6,	%g4
	tcc	%icc,	0x0
	bpos	loop_2453
	mova	%xcc,	%l4,	%g3
	fmovdleu	%icc,	%f8,	%f24
	brlz	%o7,	loop_2454
loop_2453:
	orncc	%o3,	%o6,	%l1
	movpos	%icc,	%i7,	%i0
	wr	%g0,	0x19,	%asi
	lduwa	[%l7 + 0x20] %asi,	%i4
loop_2454:
	bgu,a	%icc,	loop_2455
	movrlz	%i1,	%g5,	%i2
	edge16n	%l6,	%l2,	%g7
	fbue,a	%fcc0,	loop_2456
loop_2455:
	ldd	[%l7 + 0x38],	%f14
	tgu	%icc,	0x7
	wr	%g0,	0x19,	%asi
	lduha	[%l7 + 0x34] %asi,	%o0
loop_2456:
	edge8l	%i3,	%l5,	%l0
	tgu	%icc,	0x7
	wr	%g0,	0x80,	%asi
	stha	%i5,	[%l7 + 0x60] %asi
	fnot2s	%f15,	%f27
	sethi	0x0EC1,	%o5
	sll	%o2,	0x04,	%g6
	membar	0x39
	tne	%xcc,	0x6
	array8	%g1,	%l3,	%g2
	array16	%o4,	%i6,	%o1
	fmovd	%f14,	%f26
	fbue,a	%fcc0,	loop_2457
	ldd	[%l7 + 0x18],	%l4
	bpos	loop_2458
	ld	[%l7 + 0x7C],	%f15
loop_2457:
	tsubcctv	%g3,	0x0081,	%g4
	lduh	[%l7 + 0x74],	%o7
loop_2458:
	edge8	%o6,	%l1,	%o3
	fmovdvc	%icc,	%f26,	%f14
	fcmped	%fcc3,	%f18,	%f6
	tle	%icc,	0x0
	andcc	%i7,	0x0269,	%i0
	brnz	%i4,	loop_2459
	edge8n	%g5,	%i2,	%l6
	edge32	%l2,	%g7,	%i1
	fmovse	%xcc,	%f31,	%f1
loop_2459:
	tgu	%icc,	0x7
	edge16	%o0,	%i3,	%l5
	fmovrdgz	%l0,	%f8,	%f10
	movrgz	%o5,	0x142,	%o2
	orncc	%g6,	%g1,	%l3
	umul	%i5,	0x10BD,	%g2
	udivx	%i6,	0x16C5,	%o4
	alignaddr	%o1,	%g3,	%g4
	set	0x42, %i4
	ldsha	[%l7 + %i4] 0x88,	%l4
	tsubcctv	%o6,	0x0DE4,	%l1
	movrlz	%o7,	%o3,	%i7
	fands	%f17,	%f13,	%f7
	edge32n	%i4,	%i0,	%i2
	edge16n	%l6,	%g5,	%g7
	tge	%icc,	0x0
	fpsub32	%f18,	%f18,	%f8
	fmovsg	%xcc,	%f23,	%f11
	smul	%i1,	%l2,	%i3
	andcc	%o0,	%l0,	%l5
	fone	%f18
	fnand	%f26,	%f30,	%f14
	set	0x18, %g5
	stxa	%o5,	[%g0 + %g5] 0x20
	sra	%g6,	%g1,	%l3
	movvc	%icc,	%i5,	%o2
	movcs	%xcc,	%i6,	%o4
	edge8	%o1,	%g3,	%g2
	fbge,a	%fcc2,	loop_2460
	fbu,a	%fcc0,	loop_2461
	fpack16	%f30,	%f0
	fmul8sux16	%f14,	%f2,	%f0
loop_2460:
	sth	%g4,	[%l7 + 0x26]
loop_2461:
	fmovdle	%icc,	%f7,	%f24
	movl	%icc,	%l4,	%l1
	ldsw	[%l7 + 0x14],	%o7
	bleu	loop_2462
	edge32	%o6,	%i7,	%o3
	fnegs	%f0,	%f22
	nop
	setx	loop_2463,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_2462:
	movvs	%icc,	%i0,	%i2
	array16	%i4,	%l6,	%g7
	fbge	%fcc1,	loop_2464
loop_2463:
	fble,a	%fcc2,	loop_2465
	movl	%icc,	%i1,	%g5
	addcc	%l2,	%o0,	%i3
loop_2464:
	fnors	%f6,	%f4,	%f14
loop_2465:
	fbl,a	%fcc3,	loop_2466
	tcs	%icc,	0x2
	set	0x5E, %o5
	lduha	[%l7 + %o5] 0x81,	%l0
loop_2466:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andn	%o5,	%g6,	%l5
	set	0x0B, %l6
	ldstuba	[%l7 + %l6] 0x88,	%l3
	fxors	%f0,	%f31,	%f8
	subc	%i5,	0x05C7,	%o2
	addc	%g1,	%i6,	%o4
	edge32l	%g3,	%g2,	%g4
	taddcc	%o1,	%l4,	%o7
	tgu	%xcc,	0x7
	orncc	%o6,	%l1,	%o3
	subccc	%i7,	%i0,	%i2
	bl,a	%icc,	loop_2467
	tsubcctv	%l6,	%i4,	%g7
	edge8ln	%g5,	%i1,	%l2
	membar	#Sync
	set	0x40, %l1
	ldda	[%l7 + %l1] 0x16,	%f0
loop_2467:
	ba,a	loop_2468
	fpsub32	%f12,	%f30,	%f16
	tgu	%icc,	0x6
	wr	%g0,	0x19,	%asi
	stba	%o0,	[%l7 + 0x4D] %asi
loop_2468:
	xnor	%i3,	%l0,	%o5
	tle	%xcc,	0x6
	brgez,a	%l5,	loop_2469
	movvc	%icc,	%l3,	%i5
	movne	%icc,	%o2,	%g6
	lduw	[%l7 + 0x24],	%i6
loop_2469:
	fmovrsgz	%o4,	%f9,	%f29
	bneg,a,pn	%icc,	loop_2470
	mulx	%g1,	%g3,	%g4
	subccc	%o1,	%g2,	%l4
	edge16ln	%o6,	%o7,	%l1
loop_2470:
	taddcctv	%o3,	%i0,	%i7
	stw	%i2,	[%l7 + 0x38]
	nop
	setx	loop_2471,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movgu	%xcc,	%i4,	%g7
	movn	%xcc,	%g5,	%l6
	lduh	[%l7 + 0x0C],	%l2
loop_2471:
	bneg	loop_2472
	movrlz	%o0,	%i1,	%i3
	edge8l	%o5,	%l0,	%l3
	fones	%f21
loop_2472:
	fmul8x16	%f2,	%f20,	%f6
	fcmpes	%fcc1,	%f25,	%f23
	fmovrdlz	%i5,	%f24,	%f0
	sth	%l5,	[%l7 + 0x48]
	movne	%xcc,	%g6,	%o2
	srlx	%i6,	%g1,	%g3
	tpos	%icc,	0x7
	fmovrsne	%g4,	%f30,	%f6
	fabsd	%f26,	%f30
	bge	%icc,	loop_2473
	tpos	%icc,	0x1
	fxnor	%f24,	%f0,	%f22
	movcc	%xcc,	%o4,	%o1
loop_2473:
	nop
	wr	%g0,	0x0c,	%asi
	stba	%g2,	[%l7 + 0x5E] %asi
	movrlz	%l4,	%o6,	%o7
	bcs,pt	%xcc,	loop_2474
	tsubcctv	%o3,	%l1,	%i0
	wr	%g0,	0x88,	%asi
	lda	[%l7 + 0x24] %asi,	%f23
loop_2474:
	tsubcc	%i7,	%i2,	%g7
	wr	%g0,	0x2b,	%asi
	stwa	%g5,	[%l7 + 0x38] %asi
	membar	#Sync
	fxnors	%f4,	%f15,	%f3
	smul	%l6,	0x1D82,	%l2
	ldub	[%l7 + 0x7D],	%i4
	call	loop_2475
	fmovd	%f14,	%f26
	fmul8x16	%f5,	%f24,	%f16
	fornot2	%f14,	%f30,	%f14
loop_2475:
	ldd	[%l7 + 0x20],	%f28
	fornot2s	%f15,	%f17,	%f0
	stb	%o0,	[%l7 + 0x34]
	tne	%xcc,	0x7
	movge	%xcc,	%i3,	%o5
	ldsw	[%l7 + 0x1C],	%i1
	swap	[%l7 + 0x3C],	%l3
	alignaddr	%l0,	%l5,	%i5
	or	%g6,	0x1B68,	%o2
	bcs,a	%xcc,	loop_2476
	edge8ln	%i6,	%g1,	%g4
	edge16	%o4,	%g3,	%g2
	edge16	%l4,	%o1,	%o6
loop_2476:
	fpsub32s	%f23,	%f13,	%f11
	nop
	setx loop_2477, %l0, %l1
	jmpl %l1, %o3
	fnor	%f16,	%f14,	%f26
	udivx	%l1,	0x00F8,	%o7
	std	%f12,	[%l7 + 0x20]
loop_2477:
	fbue,a	%fcc3,	loop_2478
	orn	%i7,	0x0CD2,	%i0
	tvs	%xcc,	0x2
	sra	%i2,	0x1F,	%g7
loop_2478:
	srax	%l6,	%l2,	%i4
	fbug	%fcc2,	loop_2479
	edge16l	%o0,	%i3,	%g5
	fand	%f8,	%f30,	%f4
	stb	%i1,	[%l7 + 0x22]
loop_2479:
	mulscc	%l3,	%l0,	%o5
	fmul8x16	%f16,	%f26,	%f18
	sra	%i5,	0x17,	%l5
	fmovscs	%icc,	%f18,	%f18
	alignaddr	%g6,	%o2,	%g1
	bl,pn	%xcc,	loop_2480
	xor	%g4,	0x12F4,	%i6
	edge8n	%o4,	%g2,	%l4
	and	%o1,	%o6,	%g3
loop_2480:
	fnegs	%f13,	%f3
	movg	%xcc,	%o3,	%l1
	fmuld8sux16	%f15,	%f17,	%f22
	movge	%xcc,	%o7,	%i7
	wr	%g0,	0x18,	%asi
	sta	%f28,	[%l7 + 0x70] %asi
	fcmpne16	%f12,	%f22,	%i2
	andcc	%g7,	%l6,	%l2
	movleu	%xcc,	%i0,	%o0
	set	0x50, %g6
	stda	%i2,	[%l7 + %g6] 0x04
	popc	%i4,	%g5
	nop
	setx loop_2481, %l0, %l1
	jmpl %l1, %l3
	fbuge	%fcc1,	loop_2482
	movrgz	%l0,	%i1,	%i5
	lduw	[%l7 + 0x38],	%o5
loop_2481:
	fornot1	%f22,	%f12,	%f6
loop_2482:
	bn,a,pn	%icc,	loop_2483
	movleu	%xcc,	%l5,	%g6
	xor	%g1,	%g4,	%o2
	xor	%i6,	%o4,	%g2
loop_2483:
	and	%o1,	0x01D9,	%l4
	subccc	%g3,	0x15C7,	%o3
	wr	%g0,	0x81,	%asi
	ldsba	[%l7 + 0x46] %asi,	%l1
	fmovsle	%icc,	%f2,	%f0
	tsubcc	%o7,	0x097E,	%o6
	popc	0x18DA,	%i2
	srl	%i7,	0x04,	%l6
	movrgz	%l2,	%g7,	%o0
	movrlz	%i3,	0x157,	%i4
	edge32n	%g5,	%i0,	%l0
	movn	%icc,	%i1,	%i5
	sdiv	%l3,	0x0242,	%l5
	srlx	%g6,	0x13,	%g1
	fbg	%fcc3,	loop_2484
	fbu	%fcc3,	loop_2485
	fmovsa	%icc,	%f21,	%f13
	edge32n	%o5,	%g4,	%o2
loop_2484:
	fcmple16	%f12,	%f16,	%i6
loop_2485:
	srlx	%o4,	%o1,	%g2
	andcc	%g3,	%o3,	%l1
	movvc	%icc,	%o7,	%l4
	xnorcc	%i2,	%i7,	%o6
	umul	%l2,	0x080A,	%g7
	fpsub16s	%f23,	%f7,	%f30
	taddcc	%l6,	0x0E86,	%o0
	edge32	%i4,	%i3,	%g5
	add	%i0,	%l0,	%i5
	ta	%xcc,	0x5
	wr	%g0,	0x88,	%asi
	sta	%f4,	[%l7 + 0x18] %asi
	fbu,a	%fcc3,	loop_2486
	move	%xcc,	%l3,	%l5
	set	0x1C, %o4
	lda	[%l7 + %o4] 0x80,	%f28
loop_2486:
	movg	%xcc,	%i1,	%g1
	membar	0x18
	wr	%g0,	0x19,	%asi
	stda	%g6,	[%l7 + 0x30] %asi
	srl	%o5,	%g4,	%i6
	st	%f12,	[%l7 + 0x58]
	addc	%o4,	%o2,	%o1
	flush	%l7 + 0x30
	subccc	%g2,	0x042C,	%o3
	fmovrslz	%g3,	%f5,	%f4
	edge32n	%o7,	%l4,	%l1
	bpos,a	%icc,	loop_2487
	fbu	%fcc2,	loop_2488
	movn	%xcc,	%i7,	%o6
	sra	%i2,	%g7,	%l2
loop_2487:
	fands	%f21,	%f17,	%f27
loop_2488:
	nop
	wr	%g0,	0x88,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	sub	%l6,	%i4,	%i3
	fcmple16	%f14,	%f2,	%g5
	fmovsg	%xcc,	%f11,	%f24
	nop
	setx loop_2489, %l0, %l1
	jmpl %l1, %i0
	fmovdvc	%xcc,	%f16,	%f0
	fmovrde	%o0,	%f14,	%f8
	fmovrde	%l0,	%f18,	%f6
loop_2489:
	array32	%i5,	%l3,	%i1
	tl	%xcc,	0x3
	movg	%icc,	%g1,	%g6
	movcc	%icc,	%l5,	%g4
	tle	%xcc,	0x2
	subcc	%o5,	%o4,	%i6
	sir	0x0D36
	bcc,a	loop_2490
	movrne	%o2,	%g2,	%o3
	fbuge	%fcc2,	loop_2491
	tgu	%xcc,	0x6
loop_2490:
	tsubcc	%o1,	%g3,	%o7
	te	%icc,	0x0
loop_2491:
	bne,pn	%xcc,	loop_2492
	sll	%l1,	0x14,	%l4
	bg	%xcc,	loop_2493
	fcmpne16	%f2,	%f30,	%o6
loop_2492:
	movne	%xcc,	%i2,	%g7
	movcc	%icc,	%i7,	%l6
loop_2493:
	fxnor	%f20,	%f12,	%f26
	nop
	setx loop_2494, %l0, %l1
	jmpl %l1, %l2
	fbo,a	%fcc2,	loop_2495
	movvs	%icc,	%i4,	%g5
	st	%f23,	[%l7 + 0x44]
loop_2494:
	movl	%xcc,	%i0,	%o0
loop_2495:
	bneg	loop_2496
	ldsb	[%l7 + 0x4B],	%l0
	movcc	%icc,	%i5,	%i3
	fcmpgt32	%f28,	%f2,	%l3
loop_2496:
	movrgez	%i1,	%g1,	%l5
	subcc	%g6,	0x0821,	%o5
	call	loop_2497
	movrgz	%g4,	%i6,	%o2
	wr	%g0,	0x89,	%asi
	swapa	[%l7 + 0x34] %asi,	%g2
loop_2497:
	fmovscs	%icc,	%f14,	%f19
	subccc	%o4,	0x0304,	%o3
	fba,a	%fcc2,	loop_2498
	bvc	loop_2499
	array16	%g3,	%o1,	%l1
	xorcc	%o7,	0x1089,	%o6
loop_2498:
	fcmps	%fcc0,	%f11,	%f29
loop_2499:
	fmovd	%f10,	%f20
	edge8n	%l4,	%i2,	%i7
	fnegs	%f7,	%f3
	tsubcctv	%g7,	0x1EE1,	%l6
	movge	%icc,	%i4,	%l2
	and	%g5,	%o0,	%l0
	taddcctv	%i0,	0x0EC0,	%i5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addcc	%i3,	0x1250,	%l3
	tge	%icc,	0x6
	movrgez	%g1,	0x1CC,	%l5
	tvc	%xcc,	0x5
	movrgez	%i1,	%o5,	%g6
	fmovscc	%icc,	%f26,	%f9
	wr	%g0,	0x88,	%asi
	ldstuba	[%l7 + 0x7D] %asi,	%g4
	fxnor	%f18,	%f4,	%f8
	addc	%i6,	0x1CA5,	%o2
	udivx	%o4,	0x0FF3,	%g2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subc	%o3,	0x09ED,	%g3
	array8	%l1,	%o7,	%o1
	add	%l7,	0x08,	%l6
	wr	%g0,	0x10,	%asi
	casxa	[%l6] 0x10,	%l4,	%o6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x88,	%asi
	lduha	[%l7 + 0x3A] %asi,	%i2
	fbule,a	%fcc3,	loop_2500
	nop
	setx	loop_2501,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fandnot1	%f6,	%f12,	%f16
	fmovscc	%icc,	%f22,	%f30
loop_2500:
	edge8ln	%i7,	%g7,	%l6
loop_2501:
	nop
	set	0x38, %o1
	stha	%l2,	[%l7 + %o1] 0x0c
	sra	%g5,	0x0B,	%o0
	tne	%xcc,	0x1
	wr	%g0,	0x04,	%asi
	ldxa	[%l7 + 0x20] %asi,	%l0
	mulscc	%i4,	0x0183,	%i0
	tsubcc	%i5,	0x04BE,	%i3
	sdivcc	%l3,	0x10A7,	%g1
	fsrc2	%f22,	%f26
	subccc	%l5,	%o5,	%g6
	fmovrdgz	%i1,	%f28,	%f2
	fornot2s	%f8,	%f2,	%f12
	set	0x60, %g2
	ldda	[%l7 + %g2] 0x2c,	%i6
	fmovsge	%xcc,	%f13,	%f3
	orcc	%o2,	%g4,	%g2
	tneg	%xcc,	0x3
	edge32ln	%o4,	%o3,	%g3
	array32	%o7,	%o1,	%l4
	srlx	%o6,	%i2,	%i7
	alignaddrl	%l1,	%g7,	%l6
	edge16l	%l2,	%o0,	%g5
	ld	[%l7 + 0x64],	%f22
	srl	%i4,	%i0,	%l0
	brgz,a	%i5,	loop_2502
	orcc	%i3,	%g1,	%l5
	fandnot2s	%f30,	%f10,	%f27
	fbuge	%fcc2,	loop_2503
loop_2502:
	mova	%icc,	%o5,	%l3
	fcmpgt16	%f0,	%f10,	%i1
	fcmpgt16	%f4,	%f24,	%i6
loop_2503:
	fpadd32s	%f20,	%f30,	%f19
	subcc	%g6,	%o2,	%g4
	wr	%g0,	0x80,	%asi
	ldswa	[%l7 + 0x44] %asi,	%g2
	array16	%o3,	%g3,	%o7
	membar	#Sync
	wr	%g0,	0x17,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	movrlez	%o1,	%o4,	%l4
	fcmpeq32	%f10,	%f10,	%o6
	fmovrde	%i7,	%f18,	%f8
	addc	%i2,	0x1CB9,	%g7
	tneg	%icc,	0x7
	fnegs	%f18,	%f28
	movcs	%icc,	%l1,	%l6
	brlz,a	%l2,	loop_2504
	edge16	%o0,	%i4,	%g5
	edge8	%l0,	%i0,	%i3
	edge8n	%g1,	%i5,	%o5
loop_2504:
	subc	%l3,	%i1,	%i6
	mulscc	%g6,	%o2,	%l5
	fmuld8ulx16	%f8,	%f21,	%f20
	ldd	[%l7 + 0x60],	%g4
	edge16n	%g2,	%g3,	%o7
	tleu	%xcc,	0x6
	movl	%xcc,	%o1,	%o3
	or	%l4,	%o4,	%o6
	ta	%icc,	0x5
	srax	%i7,	0x1D,	%i2
	set	0x40, %i3
	stxa	%g7,	[%l7 + %i3] 0x81
	movl	%icc,	%l6,	%l2
	fpadd16s	%f6,	%f15,	%f17
	membar	0x40
	edge32ln	%l1,	%i4,	%g5
	andcc	%l0,	0x0761,	%o0
	or	%i0,	%i3,	%i5
	edge16n	%g1,	%o5,	%l3
	fornot1	%f0,	%f6,	%f20
	movvs	%xcc,	%i6,	%i1
	nop
	setx	loop_2505,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	addc	%g6,	%l5,	%g4
	ldsb	[%l7 + 0x3C],	%o2
	fmovrslez	%g2,	%f20,	%f10
loop_2505:
	subcc	%o7,	%g3,	%o3
	wr	%g0,	0xe2,	%asi
	stxa	%o1,	[%l7 + 0x78] %asi
	membar	#Sync
	stb	%o4,	[%l7 + 0x31]
	fble,a	%fcc3,	loop_2506
	fmovdcc	%xcc,	%f6,	%f6
	edge16ln	%l4,	%i7,	%o6
	fzeros	%f1
loop_2506:
	stbar
	wr	%g0,	0x11,	%asi
	stha	%i2,	[%l7 + 0x2E] %asi
	movneg	%xcc,	%g7,	%l6
	movrgez	%l2,	0x126,	%l1
	sethi	0x0085,	%g5
	xnor	%l0,	%o0,	%i4
	nop
	setx	loop_2507,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movrlez	%i3,	%i0,	%i5
	fpsub16	%f2,	%f6,	%f12
	addccc	%g1,	%o5,	%i6
loop_2507:
	edge8l	%l3,	%i1,	%l5
	nop
	setx	loop_2508,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	stbar
	edge8l	%g4,	%o2,	%g6
	fmovrde	%g2,	%f26,	%f2
loop_2508:
	srl	%g3,	0x15,	%o3
	bshuffle	%f24,	%f20,	%f8
	fmovsgu	%xcc,	%f5,	%f14
	popc	0x0AE7,	%o1
	fcmpeq16	%f20,	%f20,	%o4
	brz	%o7,	loop_2509
	sll	%l4,	%i7,	%o6
	fmovdcs	%icc,	%f25,	%f14
	edge32n	%i2,	%g7,	%l6
loop_2509:
	movneg	%xcc,	%l1,	%g5
	fors	%f6,	%f15,	%f7
	fmovscc	%icc,	%f31,	%f15
	srlx	%l0,	%o0,	%l2
	addcc	%i4,	0x029A,	%i0
	fmovsge	%xcc,	%f31,	%f10
	wr	%g0,	0x0c,	%asi
	stxa	%i5,	[%l7 + 0x08] %asi
	subc	%i3,	%o5,	%i6
	andcc	%g1,	%l3,	%i1
	fpack32	%f22,	%f12,	%f26
	movrgez	%l5,	0x1EA,	%g4
	fmovrde	%g6,	%f20,	%f4
	movrlz	%o2,	%g2,	%o3
	udiv	%o1,	0x13AA,	%o4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	std	%f24,	[%l7 + 0x10]
	fexpand	%f17,	%f10
	andn	%g3,	0x1274,	%o7
	tge	%xcc,	0x4
	fmovrdlz	%l4,	%f16,	%f14
	mulscc	%i7,	0x10E2,	%o6
	ldx	[%l7 + 0x78],	%g7
	movcs	%icc,	%l6,	%l1
	movcc	%icc,	%g5,	%l0
	fpadd32	%f6,	%f16,	%f0
	wr	%g0,	0x80,	%asi
	sta	%f31,	[%l7 + 0x7C] %asi
	srax	%i2,	0x1A,	%l2
	sll	%i4,	0x13,	%i0
	tn	%xcc,	0x5
	fmovdgu	%icc,	%f23,	%f2
	edge16n	%o0,	%i3,	%o5
	edge16ln	%i6,	%i5,	%l3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addc	%i1,	0x0C1D,	%l5
	fabss	%f18,	%f26
	prefetch	[%l7 + 0x24],	 0x0
	bpos,a	loop_2510
	umul	%g4,	%g1,	%o2
	wr	%g0,	0x80,	%asi
	stda	%g6,	[%l7 + 0x70] %asi
loop_2510:
	addccc	%o3,	%g2,	%o1
	smulcc	%g3,	0x0853,	%o4
	array32	%l4,	%i7,	%o7
	fcmps	%fcc3,	%f13,	%f19
	fmul8ulx16	%f2,	%f30,	%f6
	fmovdleu	%icc,	%f13,	%f27
	lduh	[%l7 + 0x26],	%g7
	tleu	%icc,	0x6
	fmovsneg	%xcc,	%f0,	%f25
	srax	%l6,	0x1D,	%o6
	andcc	%l1,	0x0EA3,	%l0
	array8	%i2,	%l2,	%g5
	edge16	%i4,	%o0,	%i3
	edge8n	%i0,	%i6,	%i5
	movle	%xcc,	%o5,	%i1
	fbl	%fcc0,	loop_2511
	fone	%f28
	bge,a,pt	%icc,	loop_2512
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2511:
	fmul8x16al	%f18,	%f7,	%f12
	fmovspos	%icc,	%f25,	%f18
loop_2512:
	orn	%l5,	0x0F35,	%g4
	fbg	%fcc2,	loop_2513
	edge16l	%g1,	%l3,	%o2
	fmovs	%f6,	%f17
	movleu	%icc,	%g6,	%o3
loop_2513:
	nop
	set	0x20, %i1
	stda	%o0,	[%l7 + %i1] 0xe2
	membar	#Sync
	andncc	%g2,	%g3,	%l4
	edge8ln	%i7,	%o7,	%g7
	tgu	%icc,	0x7
	edge32ln	%l6,	%o6,	%l1
	alignaddrl	%l0,	%i2,	%o4
	movne	%xcc,	%l2,	%g5
	sdivcc	%i4,	0x046C,	%i3
	tge	%xcc,	0x6
	fands	%f20,	%f25,	%f19
	movne	%xcc,	%o0,	%i0
	fmovdleu	%icc,	%f8,	%f18
	fmovsneg	%xcc,	%f4,	%f8
	fornot2s	%f5,	%f7,	%f11
	fnot2	%f14,	%f8
	sdiv	%i5,	0x1206,	%i6
	addcc	%o5,	0x1B53,	%i1
	tsubcctv	%l5,	%g4,	%g1
	fmovdpos	%icc,	%f30,	%f30
	bleu,a	%xcc,	loop_2514
	mulx	%l3,	0x0208,	%o2
	bgu,pt	%xcc,	loop_2515
	movneg	%xcc,	%o3,	%g6
loop_2514:
	nop
	wr	%g0,	0x80,	%asi
	ldsba	[%l7 + 0x53] %asi,	%o1
loop_2515:
	fmovrsgz	%g2,	%f2,	%f5
	movge	%xcc,	%g3,	%i7
	sdivx	%l4,	0x14BB,	%o7
	stb	%g7,	[%l7 + 0x2B]
	bcc,a,pn	%xcc,	loop_2516
	array32	%l6,	%o6,	%l0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	prefetch	[%l7 + 0x38],	 0x2
loop_2516:
	fcmpeq32	%f16,	%f16,	%l1
	brz,a	%i2,	loop_2517
	edge32ln	%o4,	%g5,	%l2
	bvs,pt	%xcc,	loop_2518
	addcc	%i4,	%i3,	%o0
loop_2517:
	nop
	set	0x74, %g7
	ldsb	[%l7 + %g7],	%i0
	tge	%icc,	0x4
loop_2518:
	fnot2s	%f21,	%f30
	fxnor	%f18,	%f4,	%f18
	ta	%icc,	0x7
	fbn,a	%fcc1,	loop_2519
	movvc	%icc,	%i5,	%o5
	or	%i6,	0x175E,	%l5
	ta	%icc,	0x2
loop_2519:
	addcc	%i1,	0x121A,	%g1
	tle	%icc,	0x4
	mova	%icc,	%l3,	%g4
	add	%l7,	0x28,	%l6
	wr	%g0,	0x04,	%asi
	casxa	[%l6] 0x04,	%o2,	%g6
	ldd	[%l7 + 0x38],	%f10
	movn	%xcc,	%o1,	%g2
	edge32n	%o3,	%g3,	%l4
	tl	%icc,	0x0
	tleu	%xcc,	0x4
	subc	%o7,	0x11E3,	%g7
	edge32	%l6,	%o6,	%l0
	edge16	%i7,	%l1,	%o4
	nop
	set	0x50, %l2
	ldd	[%l7 + %l2],	%g4
	std	%i2,	[%l7 + 0x28]
	tleu	%icc,	0x2
	prefetch	[%l7 + 0x34],	 0x2
	udiv	%i4,	0x161B,	%l2
	mulscc	%o0,	%i3,	%i0
	stbar
	sethi	0x199F,	%o5
	wr	%g0,	0x20,	%asi
	ldxa	[%g0 + 0x20] %asi,	%i6
	smulcc	%i5,	%l5,	%i1
	tge	%icc,	0x5
	movvc	%xcc,	%g1,	%g4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	brlez	%o2,	loop_2520
	fabss	%f0,	%f11
	brnz,a	%l3,	loop_2521
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2520:
	fbo,a	%fcc2,	loop_2522
	ldd	[%l7 + 0x60],	%f14
loop_2521:
	orncc	%o1,	0x1A14,	%g6
	tsubcctv	%o3,	0x074A,	%g2
loop_2522:
	membar	0x1B
	xnorcc	%g3,	%l4,	%o7
	movg	%xcc,	%l6,	%o6
	ldd	[%l7 + 0x10],	%f30
	edge32n	%l0,	%g7,	%i7
	fcmpne32	%f28,	%f18,	%l1
	ble	%xcc,	loop_2523
	taddcc	%g5,	%o4,	%i4
	movgu	%xcc,	%i2,	%l2
	fmovsle	%icc,	%f22,	%f31
loop_2523:
	addccc	%o0,	0x197A,	%i0
	sll	%i3,	0x0A,	%i6
	fmovdvs	%xcc,	%f14,	%f7
	tl	%icc,	0x2
	wr	%g0,	0x11,	%asi
	ldxa	[%l7 + 0x70] %asi,	%o5
	fmovdl	%icc,	%f26,	%f1
	udivx	%l5,	0x05C2,	%i5
	tl	%icc,	0x3
	alignaddrl	%g1,	%g4,	%i1
	fnand	%f12,	%f28,	%f30
	edge8	%l3,	%o2,	%o1
	wr	%g0,	0x89,	%asi
	ldstuba	[%l7 + 0x40] %asi,	%g6
	bn	%icc,	loop_2524
	tsubcc	%o3,	0x0D5A,	%g2
	tleu	%icc,	0x4
	add	%l4,	0x0873,	%g3
loop_2524:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdcs	%icc,	%f7,	%f2
	fmovdneg	%xcc,	%f28,	%f6
	sub	%l6,	0x0D44,	%o7
	edge8l	%o6,	%g7,	%l0
	fmovdcc	%icc,	%f16,	%f1
	and	%i7,	0x1789,	%l1
	set	0x10, %i2
	ldda	[%l7 + %i2] 0x2b,	%g4
	set	0x40, %i0
	stda	%f16,	[%l7 + %i0] 0xf8
	membar	#Sync
	tle	%xcc,	0x3
	srl	%o4,	%i2,	%i4
	movle	%icc,	%o0,	%l2
	movcs	%icc,	%i3,	%i6
	smulcc	%o5,	0x117B,	%i0
	edge32ln	%l5,	%i5,	%g1
	fbuge	%fcc3,	loop_2525
	tleu	%xcc,	0x7
	movvs	%xcc,	%i1,	%l3
	for	%f8,	%f12,	%f22
loop_2525:
	siam	0x4
	wr	%g0,	0x10,	%asi
	ldsba	[%l7 + 0x18] %asi,	%g4
	srax	%o2,	%g6,	%o1
	edge8	%g2,	%o3,	%l4
	fmovsvs	%xcc,	%f17,	%f4
	fmovse	%xcc,	%f17,	%f1
	ldstub	[%l7 + 0x56],	%l6
	tcs	%icc,	0x2
	set	0x48, %l3
	lda	[%l7 + %l3] 0x15,	%f5
	subccc	%g3,	0x1023,	%o6
	movge	%icc,	%o7,	%g7
	movne	%xcc,	%l0,	%i7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andncc	%l1,	%g5,	%o4
	sllx	%i2,	%i4,	%l2
	udiv	%i3,	0x119F,	%i6
	fmovspos	%icc,	%f16,	%f14
	orn	%o5,	%o0,	%l5
	fble	%fcc3,	loop_2526
	bg,pt	%xcc,	loop_2527
	fones	%f14
	ldx	[%l7 + 0x20],	%i0
loop_2526:
	fmovdcs	%icc,	%f0,	%f8
loop_2527:
	fba	%fcc3,	loop_2528
	fpmerge	%f9,	%f30,	%f18
	and	%i5,	0x0A18,	%g1
	array8	%l3,	%i1,	%g4
loop_2528:
	sra	%o2,	0x08,	%g6
	srl	%o1,	0x09,	%g2
	te	%xcc,	0x3
	fcmpd	%fcc3,	%f22,	%f24
	taddcc	%l4,	0x1641,	%l6
	add	%l7,	0x28,	%l6
	wr	%g0,	0x10,	%asi
	casxa	[%l6] 0x10,	%o3,	%o6
	or	%g3,	%o7,	%l0
	tle	%icc,	0x4
	srlx	%i7,	%l1,	%g7
	set	0x30, %l0
	stxa	%o4,	[%l7 + %l0] 0x04
	edge8n	%i2,	%i4,	%g5
	edge16n	%l2,	%i6,	%i3
	fcmpes	%fcc2,	%f31,	%f10
	fnor	%f18,	%f20,	%f18
	fpmerge	%f25,	%f15,	%f20
	or	%o5,	%l5,	%o0
	addc	%i5,	%i0,	%l3
	array16	%g1,	%i1,	%o2
	fandnot2	%f30,	%f0,	%f8
	stb	%g4,	[%l7 + 0x71]
	srlx	%g6,	%o1,	%l4
	fmovdpos	%xcc,	%f20,	%f29
	sll	%g2,	%o3,	%l6
	fzero	%f26
	umul	%g3,	0x12BD,	%o6
	fbl	%fcc0,	loop_2529
	brlz	%o7,	loop_2530
	tcs	%icc,	0x5
	tsubcc	%l0,	0x0DCD,	%i7
loop_2529:
	mova	%xcc,	%g7,	%l1
loop_2530:
	taddcc	%o4,	%i4,	%g5
	move	%icc,	%i2,	%i6
	fsrc2	%f22,	%f16
	taddcctv	%l2,	%o5,	%l5
	fmovsvc	%icc,	%f25,	%f13
	smulcc	%i3,	0x123F,	%o0
	bne,a	%xcc,	loop_2531
	xorcc	%i0,	%i5,	%g1
	pdist	%f18,	%f18,	%f20
	edge8l	%i1,	%l3,	%o2
loop_2531:
	fcmple16	%f14,	%f12,	%g4
	edge8n	%g6,	%l4,	%o1
	tvc	%xcc,	0x6
	movrne	%o3,	0x2C9,	%l6
	ldub	[%l7 + 0x3C],	%g2
	sdivcc	%o6,	0x0351,	%g3
	fornot1	%f28,	%f0,	%f0
	fand	%f30,	%f2,	%f2
	subc	%l0,	0x12DE,	%i7
	alignaddrl	%o7,	%g7,	%o4
	umul	%l1,	0x1EEA,	%i4
	taddcc	%g5,	0x09D4,	%i6
	orncc	%l2,	0x04E3,	%i2
	wr	%g0,	0x89,	%asi
	lda	[%l7 + 0x20] %asi,	%f10
	umul	%l5,	0x0F37,	%i3
	bl	%icc,	loop_2532
	tle	%xcc,	0x6
	fmovdneg	%xcc,	%f6,	%f5
	fmovrsgz	%o0,	%f1,	%f15
loop_2532:
	fmuld8ulx16	%f14,	%f20,	%f20
	addccc	%o5,	0x1EA1,	%i5
	edge8	%i0,	%g1,	%i1
	edge16ln	%o2,	%l3,	%g6
	fbne	%fcc3,	loop_2533
	fmovsne	%xcc,	%f4,	%f12
	popc	0x110F,	%g4
	tne	%icc,	0x2
loop_2533:
	fandnot2s	%f5,	%f9,	%f21
	bcs,pt	%icc,	loop_2534
	tgu	%xcc,	0x7
	bcs,a,pn	%icc,	loop_2535
	mulx	%l4,	0x08A4,	%o1
loop_2534:
	edge32	%o3,	%g2,	%o6
	sllx	%l6,	%l0,	%g3
loop_2535:
	fmovrdne	%o7,	%f14,	%f16
	set	0x10, %g4
	stda	%g6,	[%l7 + %g4] 0x81
	movvc	%xcc,	%o4,	%l1
	tgu	%xcc,	0x7
	tcc	%icc,	0x5
	movgu	%xcc,	%i7,	%g5
	popc	%i6,	%i4
	tcc	%xcc,	0x5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbo	%fcc0,	loop_2536
	fmovdcs	%icc,	%f19,	%f9
	fnegs	%f18,	%f19
	edge16ln	%l2,	%l5,	%i3
loop_2536:
	umul	%i2,	%o5,	%i5
	edge32l	%o0,	%g1,	%i0
	tn	%icc,	0x0
	mulscc	%o2,	0x007C,	%i1
	fmovrdlez	%l3,	%f22,	%f28
	fsrc1	%f6,	%f10
	sdivx	%g4,	0x1651,	%g6
	ldsb	[%l7 + 0x38],	%l4
	sllx	%o1,	0x1C,	%o3
	movleu	%icc,	%g2,	%l6
	edge32ln	%l0,	%o6,	%g3
	ta	%icc,	0x4
	tvc	%icc,	0x2
	andn	%g7,	0x00F3,	%o7
	fbl	%fcc0,	loop_2537
	fmovrsgez	%l1,	%f10,	%f18
	sra	%o4,	0x03,	%g5
	fnot1	%f26,	%f12
loop_2537:
	fmovsgu	%icc,	%f5,	%f26
	udiv	%i6,	0x18E9,	%i4
	bgu,a,pt	%icc,	loop_2538
	fpadd32	%f12,	%f16,	%f0
	tne	%xcc,	0x0
	tneg	%icc,	0x1
loop_2538:
	te	%xcc,	0x5
	fmovdgu	%xcc,	%f0,	%f14
	add	%l2,	%i7,	%i3
	smulcc	%i2,	%o5,	%l5
	fbule	%fcc3,	loop_2539
	fbule	%fcc1,	loop_2540
	andn	%i5,	0x0AD1,	%o0
	fors	%f21,	%f14,	%f26
loop_2539:
	nop
	set	0x56, %o3
	lduha	[%l7 + %o3] 0x80,	%i0
loop_2540:
	ldsb	[%l7 + 0x7A],	%o2
	taddcc	%i1,	%l3,	%g1
	xnorcc	%g6,	0x0BA7,	%g4
	edge8	%o1,	%o3,	%l4
	subcc	%g2,	0x12F8,	%l0
	fmovsle	%icc,	%f22,	%f21
	brz,a	%o6,	loop_2541
	brgz,a	%l6,	loop_2542
	sth	%g7,	[%l7 + 0x0C]
	edge16	%g3,	%l1,	%o7
loop_2541:
	fbu	%fcc1,	loop_2543
loop_2542:
	udivx	%o4,	0x0FF3,	%g5
	move	%icc,	%i4,	%i6
	fbn,a	%fcc2,	loop_2544
loop_2543:
	movgu	%xcc,	%i7,	%i3
	fcmps	%fcc3,	%f8,	%f10
	movneg	%icc,	%l2,	%o5
loop_2544:
	sub	%i2,	%l5,	%o0
	call	loop_2545
	movrlz	%i0,	%o2,	%i5
	fsrc1	%f28,	%f6
	edge8ln	%i1,	%g1,	%l3
loop_2545:
	movrgez	%g6,	0x347,	%g4
	fcmps	%fcc0,	%f12,	%f7
	fblg	%fcc2,	loop_2546
	xor	%o1,	0x0B4D,	%l4
	orcc	%o3,	0x1961,	%l0
	siam	0x0
loop_2546:
	bleu,a	loop_2547
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tcc	%icc,	0x0
	sll	%g2,	%l6,	%o6
loop_2547:
	bvs,a	%xcc,	loop_2548
	fexpand	%f20,	%f10
	fandnot1	%f14,	%f14,	%f24
	fmuld8ulx16	%f5,	%f20,	%f22
loop_2548:
	movg	%icc,	%g3,	%l1
	wr	%g0,	0x89,	%asi
	sta	%f17,	[%l7 + 0x28] %asi
	brgez,a	%g7,	loop_2549
	fmovdne	%icc,	%f9,	%f19
	or	%o4,	%o7,	%i4
	ldsb	[%l7 + 0x2D],	%g5
loop_2549:
	fmovsa	%xcc,	%f3,	%f22
	fsrc2s	%f27,	%f15
	fmul8x16	%f2,	%f2,	%f8
	fbu	%fcc2,	loop_2550
	stbar
	prefetch	[%l7 + 0x54],	 0x1
	andcc	%i7,	%i6,	%l2
loop_2550:
	movrlez	%o5,	%i2,	%l5
	edge16l	%i3,	%i0,	%o2
	umulcc	%i5,	0x0C35,	%i1
	alignaddrl	%g1,	%o0,	%g6
	srl	%g4,	%o1,	%l4
	xnor	%l3,	0x1BD8,	%l0
	std	%f10,	[%l7 + 0x18]
	ta	%icc,	0x3
	srax	%g2,	%l6,	%o3
	brnz	%g3,	loop_2551
	fsrc2	%f0,	%f28
	srlx	%l1,	0x0F,	%o6
	umul	%o4,	0x1E79,	%o7
loop_2551:
	movrgez	%i4,	%g7,	%g5
	sdivcc	%i7,	0x1451,	%i6
	fbne,a	%fcc1,	loop_2552
	std	%f22,	[%l7 + 0x28]
	array16	%l2,	%o5,	%l5
	xorcc	%i2,	%i0,	%o2
loop_2552:
	tg	%icc,	0x2
	movleu	%xcc,	%i5,	%i3
	fnot1	%f18,	%f30
	movcs	%icc,	%i1,	%g1
	st	%f9,	[%l7 + 0x7C]
	sdivcc	%o0,	0x1C9C,	%g6
	array16	%g4,	%o1,	%l3
	movleu	%xcc,	%l4,	%g2
	st	%f2,	[%l7 + 0x2C]
	addc	%l6,	0x1942,	%o3
	fxnors	%f7,	%f12,	%f22
	fbg,a	%fcc3,	loop_2553
	umulcc	%l0,	%g3,	%o6
	movrlz	%l1,	%o4,	%o7
	movcs	%xcc,	%i4,	%g7
loop_2553:
	edge8	%i7,	%g5,	%i6
	movne	%xcc,	%o5,	%l2
	tgu	%icc,	0x5
	movg	%xcc,	%i2,	%i0
	fmul8sux16	%f30,	%f12,	%f12
	edge8n	%o2,	%i5,	%i3
	fxors	%f29,	%f7,	%f26
	tleu	%xcc,	0x1
	srax	%l5,	0x0C,	%i1
	movgu	%icc,	%g1,	%o0
	siam	0x7
	xnorcc	%g4,	%g6,	%l3
	fbl,a	%fcc2,	loop_2554
	movl	%icc,	%o1,	%g2
	edge16ln	%l6,	%o3,	%l0
	edge32n	%g3,	%l4,	%l1
loop_2554:
	sllx	%o4,	%o6,	%o7
	movgu	%xcc,	%g7,	%i4
	brlez	%i7,	loop_2555
	mulscc	%i6,	0x1FFD,	%g5
	sll	%o5,	%l2,	%i2
	fnors	%f20,	%f22,	%f0
loop_2555:
	edge16n	%i0,	%o2,	%i3
	mova	%icc,	%i5,	%i1
	ldd	[%l7 + 0x20],	%f28
	set	0x3C, %i6
	stha	%l5,	[%l7 + %i6] 0x0c
	fpadd16	%f6,	%f4,	%f10
	movrne	%g1,	0x08E,	%g4
	fnot2	%f6,	%f26
	edge8l	%o0,	%g6,	%l3
	movn	%xcc,	%g2,	%l6
	edge16	%o3,	%l0,	%g3
	srlx	%l4,	%l1,	%o1
	fones	%f22
	add	%l7,	0x60,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%o4,	%o6
	srlx	%o7,	0x01,	%g7
	orncc	%i7,	0x11E6,	%i6
	sethi	0x150D,	%g5
	bneg,pn	%icc,	loop_2556
	tcc	%icc,	0x5
	wr	%g0,	0x80,	%asi
	ldsba	[%l7 + 0x27] %asi,	%o5
loop_2556:
	fmul8x16al	%f1,	%f0,	%f30
	ldsw	[%l7 + 0x28],	%l2
	fmul8x16	%f17,	%f6,	%f2
	fnegs	%f18,	%f23
	subcc	%i2,	0x0EF0,	%i0
	fsrc2s	%f11,	%f10
	orcc	%i4,	%o2,	%i3
	sth	%i5,	[%l7 + 0x24]
	fmovdvs	%xcc,	%f13,	%f22
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x89,	%asi
	lduba	[%l7 + 0x26] %asi,	%l5
	edge32	%i1,	%g1,	%o0
	bn,pn	%xcc,	loop_2557
	fmovrde	%g4,	%f4,	%f22
	addc	%g6,	0x1C49,	%l3
	edge32l	%l6,	%g2,	%l0
loop_2557:
	fbl	%fcc0,	loop_2558
	edge32	%o3,	%g3,	%l4
	popc	%o1,	%o4
	edge32ln	%o6,	%l1,	%g7
loop_2558:
	and	%i7,	0x1964,	%i6
	move	%xcc,	%o7,	%g5
	fmovsle	%icc,	%f16,	%f17
	srlx	%l2,	%o5,	%i0
	prefetch	[%l7 + 0x34],	 0x0
	fpackfix	%f2,	%f10
	fcmpes	%fcc3,	%f31,	%f8
	fmul8x16al	%f0,	%f2,	%f22
	fnors	%f26,	%f8,	%f15
	brz	%i4,	loop_2559
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bn	loop_2560
	fmovrdgz	%o2,	%f12,	%f14
loop_2559:
	subcc	%i3,	%i2,	%i5
	set	0x2A, %g3
	lduha	[%l7 + %g3] 0x18,	%l5
loop_2560:
	umul	%i1,	%o0,	%g1
	movle	%xcc,	%g6,	%g4
	fmovrde	%l6,	%f28,	%f6
	fmovrdne	%g2,	%f10,	%f12
	nop
	set	0x58, %o2
	stx	%l0,	[%l7 + %o2]
	sll	%o3,	%l3,	%g3
	tgu	%icc,	0x4
	fors	%f26,	%f27,	%f18
	movrgez	%l4,	%o1,	%o6
	tgu	%xcc,	0x2
	call	loop_2561
	udiv	%l1,	0x098D,	%o4
	add	%l7,	0x08,	%l6
	wr	%g0,	0x0c,	%asi
	lda	[%l6] %asi,	%g7
	casa	[%l6] 0x0c,	%g7,	%i6
loop_2561:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x20, %l4
	stda	%o6,	[%l7 + %l4] 0x11
	mova	%icc,	%g5,	%l2
	movrgez	%o5,	0x096,	%i0
	fnand	%f30,	%f8,	%f26
	tn	%icc,	0x7
	edge32ln	%i4,	%i7,	%i3
	ldd	[%l7 + 0x30],	%o2
	edge16	%i2,	%i5,	%l5
	fpadd32	%f16,	%f22,	%f28
	edge32ln	%o0,	%g1,	%g6
	srlx	%i1,	%g4,	%g2
	fbule,a	%fcc1,	loop_2562
	bleu	%icc,	loop_2563
	tgu	%icc,	0x4
	udiv	%l0,	0x1C0F,	%o3
loop_2562:
	movrne	%l3,	0x245,	%l6
loop_2563:
	tneg	%xcc,	0x2
	mulx	%g3,	0x1C1D,	%o1
	ldd	[%l7 + 0x10],	%f16
	srlx	%l4,	%l1,	%o4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srax	%o6,	%i6,	%o7
	fcmpeq32	%f10,	%f4,	%g5
	movgu	%xcc,	%l2,	%g7
	st	%f18,	[%l7 + 0x18]
	orn	%i0,	0x104A,	%o5
	andncc	%i4,	%i7,	%o2
	st	%f1,	[%l7 + 0x30]
	set	0x36, %o6
	ldsba	[%l7 + %o6] 0x80,	%i2
	set	0x6C, %g1
	sta	%f3,	[%l7 + %g1] 0x15
	xorcc	%i5,	0x1646,	%l5
	fpsub16	%f4,	%f4,	%f2
	fandnot2	%f22,	%f4,	%f26
	taddcctv	%o0,	%i3,	%g6
	sethi	0x141F,	%i1
	sub	%g1,	%g4,	%l0
	tpos	%xcc,	0x0
	fmovdvs	%xcc,	%f6,	%f24
	addcc	%o3,	0x0723,	%g2
	tl	%xcc,	0x1
	fmovrdgz	%l6,	%f26,	%f24
	wr	%g0,	0x5f,	%asi
	stxa	%g3,	[%g0 + 0x0] %asi
	sll	%o1,	0x08,	%l4
	membar	0x4F
	taddcctv	%l1,	0x1340,	%l3
	fmovsge	%icc,	%f18,	%f19
	sllx	%o6,	%i6,	%o4
	fmovrsgez	%o7,	%f5,	%f8
	popc	%l2,	%g5
	xorcc	%i0,	0x18F1,	%g7
	nop
	setx	loop_2564,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	xnorcc	%o5,	%i7,	%i4
	orn	%i2,	0x07C9,	%i5
	addc	%l5,	0x098C,	%o2
loop_2564:
	brnz,a	%o0,	loop_2565
	fxors	%f2,	%f11,	%f10
	brnz	%i3,	loop_2566
	fpadd16s	%f7,	%f11,	%f13
loop_2565:
	fones	%f6
	bcs	loop_2567
loop_2566:
	orncc	%i1,	0x0B6A,	%g1
	movleu	%xcc,	%g4,	%g6
	st	%f21,	[%l7 + 0x1C]
loop_2567:
	edge16n	%l0,	%g2,	%l6
	xnor	%o3,	%o1,	%g3
	fmovsvc	%xcc,	%f16,	%f8
	fmul8x16au	%f7,	%f8,	%f26
	nop
	set	0x10, %i7
	ldx	[%l7 + %i7],	%l1
	xnor	%l4,	%o6,	%i6
	srl	%o4,	0x0F,	%l3
	fble,a	%fcc1,	loop_2568
	movg	%icc,	%l2,	%o7
	fmovdn	%icc,	%f7,	%f5
	ta	%icc,	0x1
loop_2568:
	movge	%icc,	%i0,	%g5
	tleu	%icc,	0x2
	movrgez	%o5,	0x109,	%i7
	movn	%xcc,	%i4,	%g7
	udivcc	%i5,	0x1FD3,	%l5
	udivx	%i2,	0x008D,	%o2
	add	%o0,	%i1,	%i3
	and	%g1,	0x16FB,	%g6
	sdivx	%l0,	0x0856,	%g2
	udiv	%g4,	0x0644,	%o3
	edge16l	%o1,	%g3,	%l6
	fmovsleu	%icc,	%f8,	%f4
	andcc	%l4,	0x0354,	%l1
	srax	%i6,	%o6,	%l3
	tg	%xcc,	0x4
	tge	%icc,	0x7
	add	%l7,	0x5C,	%l6
	wr	%g0,	0x19,	%asi
	casa	[%l6] %asi,	%l2,	%o7
	ldsw	[%l7 + 0x2C],	%o4
	fmovdleu	%icc,	%f13,	%f25
	movrgz	%i0,	%g5,	%o5
	alignaddrl	%i7,	%g7,	%i5
	alignaddr	%i4,	%i2,	%l5
	fnot2s	%f19,	%f5
	subcc	%o2,	%o0,	%i3
	ldd	[%l7 + 0x50],	%f10
	array32	%i1,	%g6,	%g1
	xnorcc	%l0,	%g4,	%g2
	bg,a,pt	%xcc,	loop_2569
	fornot1	%f30,	%f24,	%f18
	xnorcc	%o3,	%g3,	%o1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2569:
	fcmpeq16	%f16,	%f4,	%l4
	xor	%l1,	%l6,	%o6
	udivcc	%i6,	0x1EF2,	%l3
	fmovdleu	%icc,	%f22,	%f15
	tleu	%xcc,	0x0
	tpos	%xcc,	0x3
	tpos	%icc,	0x7
	wr	%g0,	0x04,	%asi
	swapa	[%l7 + 0x24] %asi,	%l2
	fmul8x16	%f18,	%f28,	%f28
	sll	%o7,	%o4,	%g5
	orn	%i0,	%o5,	%i7
	tneg	%icc,	0x7
	fbge	%fcc0,	loop_2570
	movrne	%i5,	%i4,	%i2
	fbuge	%fcc3,	loop_2571
	tcs	%icc,	0x6
loop_2570:
	tgu	%icc,	0x1
	movle	%icc,	%l5,	%g7
loop_2571:
	brgz,a	%o0,	loop_2572
	movrne	%i3,	%i1,	%o2
	nop
	setx loop_2573, %l0, %l1
	jmpl %l1, %g6
	fpsub32s	%f27,	%f15,	%f29
loop_2572:
	nop
	set	0x4E, %l5
	ldsba	[%l7 + %l5] 0x15,	%l0
loop_2573:
	and	%g4,	%g2,	%g1
	ta	%icc,	0x4
	fmovsne	%xcc,	%f10,	%f25
	tcc	%icc,	0x4
	fbg,a	%fcc0,	loop_2574
	movcs	%xcc,	%o3,	%g3
	bn	loop_2575
	srl	%o1,	0x10,	%l1
loop_2574:
	alignaddr	%l6,	%o6,	%i6
	prefetch	[%l7 + 0x70],	 0x1
loop_2575:
	sra	%l4,	%l2,	%l3
	fmovrsgz	%o7,	%f25,	%f11
	fbn	%fcc0,	loop_2576
	ta	%icc,	0x1
	addc	%o4,	%i0,	%g5
	fmul8ulx16	%f22,	%f18,	%f30
loop_2576:
	ldd	[%l7 + 0x28],	%f26
	smul	%o5,	%i7,	%i5
	movgu	%icc,	%i2,	%l5
	ldsw	[%l7 + 0x74],	%i4
	ldsb	[%l7 + 0x2A],	%o0
	movcs	%xcc,	%i3,	%g7
	andncc	%o2,	%i1,	%g6
	fmul8ulx16	%f18,	%f12,	%f16
	te	%icc,	0x3
	fpsub32	%f22,	%f28,	%f10
	popc	%l0,	%g2
	edge8	%g4,	%g1,	%o3
	fbl,a	%fcc3,	loop_2577
	movvc	%icc,	%g3,	%l1
	stbar
	tvs	%icc,	0x4
loop_2577:
	nop
	set	0x38, %o0
	ldstuba	[%l7 + %o0] 0x04,	%o1
	edge16	%o6,	%l6,	%i6
	fpsub16s	%f6,	%f13,	%f31
	sll	%l2,	0x00,	%l4
	nop
	set	0x12, %o7
	lduh	[%l7 + %o7],	%o7
	tneg	%icc,	0x3
	smul	%l3,	0x1ED9,	%o4
	movpos	%icc,	%g5,	%o5
	call	loop_2578
	movvs	%icc,	%i0,	%i5
	srlx	%i2,	%i7,	%l5
	tsubcc	%i4,	%o0,	%g7
loop_2578:
	edge8	%o2,	%i1,	%i3
	tpos	%xcc,	0x4
	sub	%l0,	%g2,	%g4
	fmul8x16	%f30,	%f20,	%f28
	std	%f12,	[%l7 + 0x30]
	sub	%g1,	%g6,	%g3
	ldstub	[%l7 + 0x44],	%l1
	fsrc2	%f20,	%f16
	stb	%o1,	[%l7 + 0x4D]
	xnor	%o6,	%l6,	%i6
	umulcc	%l2,	%l4,	%o3
	sra	%l3,	%o7,	%o4
	movge	%xcc,	%g5,	%o5
	fzeros	%f0
	tl	%xcc,	0x0
	xnorcc	%i0,	%i5,	%i2
	brlez,a	%i7,	loop_2579
	fmovd	%f10,	%f12
	fone	%f22
	fornot2	%f2,	%f22,	%f28
loop_2579:
	fcmple16	%f26,	%f20,	%l5
	ldd	[%l7 + 0x38],	%f12
	ldstub	[%l7 + 0x68],	%o0
	ldstub	[%l7 + 0x4A],	%i4
	fpsub16	%f22,	%f20,	%f16
	set	0x39, %i5
	lduba	[%l7 + %i5] 0x14,	%o2
	mova	%icc,	%g7,	%i3
	movge	%icc,	%l0,	%g2
	edge16	%i1,	%g1,	%g6
	fnot2	%f16,	%f12
	fmuld8ulx16	%f2,	%f8,	%f18
	edge16ln	%g4,	%l1,	%o1
	wr	%g0,	0x10,	%asi
	stda	%g2,	[%l7 + 0x60] %asi
	sub	%l6,	%o6,	%l2
	edge16	%i6,	%l4,	%o3
	fcmpgt16	%f30,	%f22,	%o7
	ba,a,pt	%icc,	loop_2580
	addcc	%o4,	%l3,	%o5
	fabsd	%f22,	%f2
	subc	%g5,	%i0,	%i2
loop_2580:
	xor	%i7,	0x123B,	%i5
	tneg	%icc,	0x1
	edge32n	%o0,	%l5,	%o2
	set	0x24, %g5
	ldswa	[%l7 + %g5] 0x19,	%i4
	bn,pn	%xcc,	loop_2581
	fbu	%fcc1,	loop_2582
	swap	[%l7 + 0x08],	%i3
	tneg	%icc,	0x7
loop_2581:
	xnorcc	%g7,	%g2,	%i1
loop_2582:
	sub	%l0,	0x17AF,	%g1
	fmovdn	%icc,	%f18,	%f12
	fmovdl	%icc,	%f20,	%f5
	stbar
	be,pt	%xcc,	loop_2583
	fpmerge	%f8,	%f15,	%f12
	and	%g6,	%l1,	%g4
	fandnot1s	%f7,	%f12,	%f27
loop_2583:
	nop
	setx loop_2584, %l0, %l1
	jmpl %l1, %g3
	tpos	%xcc,	0x1
	fcmpd	%fcc0,	%f30,	%f10
	edge16ln	%l6,	%o6,	%o1
loop_2584:
	srl	%i6,	%l4,	%l2
	andn	%o7,	0x0C0D,	%o3
	ba	loop_2585
	and	%l3,	%o4,	%g5
	orn	%o5,	0x0799,	%i0
	move	%xcc,	%i7,	%i5
loop_2585:
	sdivx	%o0,	0x15F6,	%i2
	add	%o2,	%i4,	%i3
	sir	0x0B2D
	orncc	%g7,	%g2,	%i1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movvc	%xcc,	%l0,	%l5
	fmovdvs	%xcc,	%f11,	%f6
	sra	%g6,	%g1,	%g4
	sll	%l1,	0x13,	%g3
	tsubcctv	%o6,	%o1,	%l6
	fandnot1	%f8,	%f8,	%f14
	ldsh	[%l7 + 0x56],	%i6
	fmovrde	%l2,	%f10,	%f28
	movle	%icc,	%l4,	%o3
	movle	%icc,	%o7,	%o4
	sdiv	%l3,	0x15D4,	%g5
	bcs	%icc,	loop_2586
	fpadd16	%f6,	%f28,	%f26
	udivcc	%i0,	0x0089,	%i7
	edge32	%i5,	%o0,	%o5
loop_2586:
	fcmps	%fcc3,	%f24,	%f21
	lduh	[%l7 + 0x64],	%o2
	movpos	%xcc,	%i2,	%i3
	ldd	[%l7 + 0x38],	%g6
	sir	0x0570
	movvs	%icc,	%g2,	%i4
	edge8ln	%l0,	%i1,	%g6
	movcc	%icc,	%l5,	%g1
	subccc	%l1,	%g4,	%o6
	smul	%o1,	%l6,	%g3
	xnor	%l2,	%l4,	%i6
	fmovrdlez	%o3,	%f22,	%f14
	movrgz	%o7,	0x179,	%o4
	edge32n	%g5,	%i0,	%i7
	tvc	%xcc,	0x1
	fbge,a	%fcc1,	loop_2587
	fxor	%f10,	%f28,	%f2
	fand	%f30,	%f30,	%f6
	tgu	%xcc,	0x1
loop_2587:
	movcs	%xcc,	%i5,	%o0
	fsrc2s	%f21,	%f0
	stw	%l3,	[%l7 + 0x10]
	fmovdle	%icc,	%f1,	%f12
	tn	%icc,	0x3
	subcc	%o5,	%o2,	%i2
	call	loop_2588
	be,a,pt	%xcc,	loop_2589
	prefetch	[%l7 + 0x0C],	 0x3
	stw	%g7,	[%l7 + 0x64]
loop_2588:
	subccc	%i3,	0x0954,	%i4
loop_2589:
	edge16	%l0,	%g2,	%i1
	srax	%g6,	%l5,	%g1
	sdivx	%g4,	0x0560,	%o6
	fmovdpos	%icc,	%f31,	%f27
	fornot2s	%f5,	%f26,	%f5
	smul	%o1,	%l1,	%g3
	sdiv	%l6,	0x1C6C,	%l2
	edge8l	%l4,	%i6,	%o3
	sub	%o4,	%g5,	%i0
	ldsw	[%l7 + 0x70],	%i7
	set	0x1A, %i4
	ldsba	[%l7 + %i4] 0x15,	%o7
	edge16l	%o0,	%l3,	%i5
	xnor	%o2,	%o5,	%i2
	fbuge,a	%fcc1,	loop_2590
	andcc	%i3,	0x06D5,	%i4
	fmovdcc	%xcc,	%f30,	%f8
	bg,pt	%xcc,	loop_2591
loop_2590:
	tsubcc	%g7,	0x09DB,	%g2
	sdivcc	%i1,	0x046A,	%l0
	edge32ln	%l5,	%g1,	%g6
loop_2591:
	edge32	%g4,	%o1,	%o6
	movcc	%icc,	%l1,	%l6
	udiv	%g3,	0x017E,	%l4
	alignaddr	%i6,	%l2,	%o4
	movleu	%icc,	%g5,	%o3
	smulcc	%i7,	%o7,	%o0
	smul	%l3,	0x0195,	%i0
	fbue,a	%fcc1,	loop_2592
	brlez,a	%i5,	loop_2593
	sub	%o5,	%o2,	%i3
	movgu	%xcc,	%i2,	%g7
loop_2592:
	movl	%xcc,	%i4,	%i1
loop_2593:
	sdivx	%l0,	0x034C,	%l5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movre	%g2,	0x057,	%g6
	srlx	%g4,	%g1,	%o1
	udivx	%l1,	0x12BC,	%l6
	srax	%o6,	%l4,	%i6
	fcmpne32	%f30,	%f26,	%g3
	fbe,a	%fcc0,	loop_2594
	fbge	%fcc1,	loop_2595
	fmovdgu	%icc,	%f26,	%f26
	nop
	set	0x26, %o5
	lduh	[%l7 + %o5],	%o4
loop_2594:
	orcc	%l2,	0x1649,	%o3
loop_2595:
	nop
	setx	loop_2596,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	faligndata	%f26,	%f10,	%f18
	nop
	set	0x14, %l1
	lduh	[%l7 + %l1],	%g5
	xnor	%i7,	%o0,	%o7
loop_2596:
	movrlz	%l3,	%i5,	%i0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ba,a,pt	%icc,	loop_2597
	movl	%icc,	%o2,	%o5
	srlx	%i2,	%i3,	%g7
	ta	%icc,	0x3
loop_2597:
	fmovdpos	%xcc,	%f2,	%f13
	fmuld8ulx16	%f22,	%f14,	%f28
	fnot2	%f20,	%f10
	add	%i4,	%i1,	%l5
	movn	%icc,	%l0,	%g6
	movge	%icc,	%g4,	%g2
	andncc	%o1,	%l1,	%g1
	wr	%g0,	0x1e,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
	edge16	%l6,	%o6,	%i6
	fmovrse	%l4,	%f7,	%f29
	std	%o4,	[%l7 + 0x08]
	fbg	%fcc1,	loop_2598
	sra	%g3,	0x08,	%l2
	fcmple16	%f6,	%f30,	%g5
	tvc	%xcc,	0x1
loop_2598:
	nop
	set	0x28, %g6
	stx	%i7,	[%l7 + %g6]
	movle	%xcc,	%o3,	%o0
	movne	%icc,	%o7,	%i5
	edge32ln	%i0,	%l3,	%o2
	fbue	%fcc3,	loop_2599
	movpos	%icc,	%o5,	%i2
	umulcc	%i3,	0x18BD,	%i4
	flush	%l7 + 0x1C
loop_2599:
	movgu	%icc,	%g7,	%i1
	fexpand	%f9,	%f26
	smulcc	%l5,	%g6,	%l0
	fmul8x16au	%f9,	%f14,	%f6
	udivcc	%g2,	0x1255,	%o1
	nop
	set	0x37, %o4
	ldub	[%l7 + %o4],	%g4
	nop
	set	0x6C, %o1
	stw	%g1,	[%l7 + %o1]
	xor	%l6,	%l1,	%o6
	srl	%i6,	%l4,	%o4
	taddcc	%l2,	%g3,	%i7
	bg,a	loop_2600
	sll	%o3,	0x0E,	%o0
	fmovrsne	%o7,	%f3,	%f25
	fmovdne	%xcc,	%f5,	%f16
loop_2600:
	fnot1	%f4,	%f20
	bgu,a,pt	%icc,	loop_2601
	fmovdl	%icc,	%f0,	%f20
	tl	%xcc,	0x2
	bleu	%xcc,	loop_2602
loop_2601:
	bvc,pt	%xcc,	loop_2603
	bpos,a	%icc,	loop_2604
	fmovscs	%xcc,	%f5,	%f25
loop_2602:
	fmovdvs	%icc,	%f9,	%f17
loop_2603:
	fxor	%f14,	%f0,	%f26
loop_2604:
	ble	loop_2605
	array16	%g5,	%i0,	%i5
	bn,pn	%xcc,	loop_2606
	fbge	%fcc3,	loop_2607
loop_2605:
	fmovsneg	%xcc,	%f26,	%f28
	movgu	%xcc,	%o2,	%l3
loop_2606:
	udivcc	%o5,	0x1EF2,	%i3
loop_2607:
	movge	%xcc,	%i2,	%i4
	sdivcc	%i1,	0x19DA,	%l5
	lduw	[%l7 + 0x50],	%g6
	movvs	%xcc,	%l0,	%g2
	andcc	%o1,	%g7,	%g4
	sdivcc	%g1,	0x146A,	%l1
	movcc	%xcc,	%o6,	%l6
	fmovsvs	%xcc,	%f17,	%f26
	tsubcc	%l4,	%i6,	%o4
	fbu	%fcc2,	loop_2608
	andn	%l2,	0x0080,	%g3
	movne	%xcc,	%o3,	%i7
	sll	%o0,	%g5,	%i0
loop_2608:
	edge16n	%i5,	%o7,	%o2
	andncc	%o5,	%i3,	%i2
	xnor	%i4,	%l3,	%i1
	fpackfix	%f4,	%f26
	xnorcc	%g6,	%l5,	%l0
	wr	%g0,	0x80,	%asi
	lduha	[%l7 + 0x22] %asi,	%o1
	fmovrsgez	%g2,	%f18,	%f19
	movleu	%icc,	%g7,	%g4
	sllx	%l1,	0x1E,	%o6
	tvs	%xcc,	0x2
	addc	%l6,	%g1,	%i6
	orn	%o4,	%l2,	%l4
	fandnot2s	%f28,	%f8,	%f5
	array8	%g3,	%o3,	%o0
	movvs	%xcc,	%g5,	%i0
	set	0x73, %g2
	ldstuba	[%l7 + %g2] 0x88,	%i7
	nop
	setx	loop_2609,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movneg	%xcc,	%o7,	%i5
	edge8ln	%o5,	%o2,	%i2
	sll	%i3,	0x1E,	%l3
loop_2609:
	fnot1s	%f5,	%f6
	taddcctv	%i1,	%i4,	%l5
	ldd	[%l7 + 0x38],	%g6
	edge32n	%o1,	%l0,	%g7
	brz,a	%g4,	loop_2610
	movrgez	%l1,	0x160,	%g2
	tneg	%xcc,	0x6
	fbul,a	%fcc2,	loop_2611
loop_2610:
	edge8	%l6,	%g1,	%i6
	edge32n	%o6,	%l2,	%o4
	movl	%icc,	%l4,	%g3
loop_2611:
	tn	%icc,	0x0
	brnz,a	%o3,	loop_2612
	andn	%o0,	0x1165,	%g5
	sethi	0x0FE7,	%i0
	sub	%o7,	%i7,	%i5
loop_2612:
	tg	%icc,	0x1
	edge8n	%o5,	%o2,	%i3
	fmovrsne	%i2,	%f6,	%f24
	fpackfix	%f4,	%f23
	tne	%icc,	0x1
	addcc	%l3,	0x0023,	%i4
	xor	%i1,	%l5,	%o1
	andcc	%g6,	0x1D0D,	%g7
	stb	%g4,	[%l7 + 0x57]
	or	%l0,	%l1,	%g2
	movrgez	%l6,	%i6,	%g1
	sdivcc	%o6,	0x134E,	%o4
	tvs	%icc,	0x3
	fbo	%fcc3,	loop_2613
	fmovsgu	%icc,	%f10,	%f19
	tvc	%xcc,	0x7
	and	%l4,	%g3,	%o3
loop_2613:
	xorcc	%l2,	0x06AB,	%o0
	movcc	%xcc,	%g5,	%i0
	fmovscs	%xcc,	%f26,	%f0
	movvc	%xcc,	%o7,	%i7
	fmul8ulx16	%f12,	%f4,	%f26
	fbl	%fcc1,	loop_2614
	tne	%xcc,	0x6
	sdivx	%o5,	0x1D50,	%o2
	fmovrse	%i3,	%f10,	%f14
loop_2614:
	xor	%i5,	%i2,	%i4
	xnorcc	%l3,	0x1A13,	%i1
	sir	0x09DD
	fmovsvs	%xcc,	%f3,	%f29
	movcs	%icc,	%o1,	%l5
	fbn,a	%fcc0,	loop_2615
	subcc	%g6,	%g7,	%l0
	bpos,a,pt	%xcc,	loop_2616
	tleu	%xcc,	0x1
loop_2615:
	udivcc	%g4,	0x0DCD,	%g2
	fnot2s	%f26,	%f23
loop_2616:
	fsrc1s	%f0,	%f7
	tg	%xcc,	0x2
	tcs	%xcc,	0x2
	subc	%l6,	0x0B08,	%i6
	ble,pn	%xcc,	loop_2617
	nop
	set	0x6E, %l6
	lduh	[%l7 + %l6],	%l1
	st	%f22,	[%l7 + 0x7C]
	wr	%g0,	0x0c,	%asi
	lduha	[%l7 + 0x0E] %asi,	%g1
loop_2617:
	fpsub16s	%f1,	%f4,	%f20
	fpadd16s	%f8,	%f3,	%f27
	fmovrslz	%o6,	%f13,	%f23
	ta	%xcc,	0x3
	add	%l4,	%o4,	%g3
	nop
	setx	loop_2618,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fbue,a	%fcc2,	loop_2619
	tleu	%icc,	0x2
	fmovse	%icc,	%f2,	%f13
loop_2618:
	sethi	0x1CB2,	%l2
loop_2619:
	membar	0x22
	wr	%g0,	0x80,	%asi
	lda	[%l7 + 0x74] %asi,	%f25
	movleu	%icc,	%o3,	%g5
	edge16ln	%i0,	%o0,	%o7
	add	%i7,	0x1AC7,	%o2
	movrgz	%i3,	%o5,	%i5
	bshuffle	%f4,	%f10,	%f10
	edge16n	%i4,	%l3,	%i2
	bn,a,pn	%icc,	loop_2620
	sdivx	%o1,	0x163B,	%i1
	andn	%g6,	0x188A,	%g7
	set	0x58, %i3
	lduwa	[%l7 + %i3] 0x11,	%l0
loop_2620:
	fnot2s	%f2,	%f9
	brlz	%l5,	loop_2621
	fzero	%f24
	tcs	%icc,	0x6
	ldsb	[%l7 + 0x0D],	%g4
loop_2621:
	bneg	%icc,	loop_2622
	fmovrse	%l6,	%f22,	%f28
	te	%xcc,	0x6
	subccc	%i6,	%g2,	%g1
loop_2622:
	taddcc	%l1,	0x0910,	%o6
	wr	%g0,	0x89,	%asi
	stxa	%o4,	[%l7 + 0x08] %asi
	orncc	%g3,	%l2,	%l4
	fbg	%fcc1,	loop_2623
	fmovrdlz	%g5,	%f10,	%f16
	fmovrslez	%i0,	%f1,	%f5
	taddcctv	%o0,	%o7,	%o3
loop_2623:
	movgu	%xcc,	%i7,	%i3
	ldsw	[%l7 + 0x58],	%o5
	edge16	%i5,	%i4,	%o2
	movge	%xcc,	%i2,	%o1
	fmovrslez	%i1,	%f15,	%f17
	alignaddrl	%l3,	%g6,	%g7
	smul	%l5,	0x12CE,	%g4
	for	%f20,	%f30,	%f0
	array16	%l0,	%i6,	%g2
	bne,pn	%icc,	loop_2624
	movrlez	%g1,	0x201,	%l1
	nop
	setx	loop_2625,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fmovs	%f18,	%f18
loop_2624:
	tge	%xcc,	0x6
	sdiv	%o6,	0x15FD,	%o4
loop_2625:
	nop
	wr	%g0,	0x80,	%asi
	ldda	[%l7 + 0x30] %asi,	%i6
	movcc	%xcc,	%g3,	%l2
	udiv	%g5,	0x1F2E,	%i0
	sdiv	%o0,	0x0DF4,	%o7
	sub	%o3,	0x04FD,	%i7
	brgz	%l4,	loop_2626
	fmovsgu	%xcc,	%f20,	%f2
	movvc	%icc,	%o5,	%i5
	fmovsleu	%xcc,	%f29,	%f18
loop_2626:
	addcc	%i4,	0x1C01,	%i3
	fmovdge	%icc,	%f17,	%f15
	wr	%g0,	0x0c,	%asi
	ldswa	[%l7 + 0x4C] %asi,	%o2
	umul	%i2,	%o1,	%i1
	xnor	%l3,	0x1BB4,	%g6
	prefetch	[%l7 + 0x3C],	 0x1
	sir	0x075A
	nop
	setx	loop_2627,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fcmpes	%fcc2,	%f21,	%f12
	sub	%g7,	%l5,	%l0
	array8	%g4,	%i6,	%g1
loop_2627:
	fmovrse	%l1,	%f11,	%f17
	fmovdleu	%icc,	%f6,	%f29
	and	%g2,	%o4,	%l6
	fbe	%fcc2,	loop_2628
	nop
	setx	loop_2629,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	te	%xcc,	0x6
	alignaddr	%o6,	%l2,	%g5
loop_2628:
	tg	%icc,	0x6
loop_2629:
	fand	%f0,	%f20,	%f30
	fmovdcc	%icc,	%f28,	%f10
	taddcctv	%g3,	%i0,	%o0
	set	0x18, %i1
	stxa	%o3,	[%l7 + %i1] 0xe2
	membar	#Sync
	srl	%i7,	%o7,	%o5
	fpsub32	%f20,	%f2,	%f18
	movvs	%icc,	%l4,	%i5
	tgu	%xcc,	0x4
	xor	%i4,	0x0001,	%o2
	fone	%f28
	fpack16	%f26,	%f8
	fandnot1	%f12,	%f20,	%f22
	ldx	[%l7 + 0x50],	%i3
	array8	%o1,	%i2,	%l3
	srl	%i1,	0x13,	%g7
	tge	%icc,	0x0
	movcs	%icc,	%l5,	%g6
	movre	%l0,	0x1F3,	%i6
	sth	%g1,	[%l7 + 0x64]
	movrlez	%g4,	0x32F,	%g2
	edge32ln	%l1,	%l6,	%o6
	wr	%g0,	0x80,	%asi
	sta	%f19,	[%l7 + 0x68] %asi
	bshuffle	%f24,	%f10,	%f20
	move	%icc,	%l2,	%o4
	array8	%g3,	%g5,	%o0
	orn	%o3,	0x0C9B,	%i0
	movvc	%icc,	%o7,	%o5
	sethi	0x0B65,	%i7
	fmovs	%f25,	%f10
	fabsd	%f14,	%f10
	fsrc1	%f6,	%f14
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
	movrlz	%l4,	%i4,	%i5
	move	%xcc,	%i3,	%o1
	sir	0x1E12
loop_2630:
	orcc	%o2,	%i2,	%l3
	movcs	%xcc,	%g7,	%i1
	fandnot1	%f30,	%f4,	%f10
	movcs	%icc,	%l5,	%g6
	ta	%xcc,	0x6
	movl	%icc,	%i6,	%l0
	flush	%l7 + 0x48
	wr	%g0,	0x0c,	%asi
	sta	%f27,	[%l7 + 0x1C] %asi
	umulcc	%g1,	0x1218,	%g2
	fmovrdlz	%g4,	%f28,	%f4
	tg	%xcc,	0x5
	alignaddr	%l1,	%o6,	%l2
	movrgez	%o4,	0x04B,	%l6
	sdivcc	%g3,	0x0982,	%o0
	edge16ln	%g5,	%o3,	%i0
	bn	%xcc,	loop_2631
	tcs	%icc,	0x5
	fcmpne32	%f18,	%f16,	%o7
	fmovrdlz	%i7,	%f26,	%f2
loop_2631:
	tvs	%xcc,	0x2
	sdivcc	%o5,	0x0F3F,	%l4
	edge8ln	%i5,	%i4,	%o1
	edge32ln	%o2,	%i2,	%l3
	fpackfix	%f14,	%f26
	fcmpgt32	%f4,	%f12,	%g7
	movge	%xcc,	%i1,	%l5
	tg	%xcc,	0x2
	set	0x40, %g7
	stda	%f0,	[%l7 + %g7] 0x19
	fnegs	%f23,	%f28
	movrne	%g6,	0x27C,	%i3
	addcc	%l0,	%g1,	%g2
	fcmple32	%f2,	%f24,	%i6
	popc	%l1,	%o6
	fnot2s	%f22,	%f3
	fmul8x16au	%f15,	%f11,	%f10
	lduh	[%l7 + 0x2E],	%l2
	xor	%g4,	%o4,	%g3
	subcc	%o0,	%g5,	%l6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addccc	%o3,	%o7,	%i7
	nop
	setx	loop_2632,	%l0,	%l1
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
	stbar
	ldx	[%l7 + 0x48],	%o5
loop_2632:
	fmuld8sux16	%f28,	%f4,	%f4
	movre	%l4,	0x146,	%i0
	fnands	%f31,	%f10,	%f19
	fblg,a	%fcc2,	loop_2633
	sethi	0x0F26,	%i4
	lduw	[%l7 + 0x60],	%o1
	xnorcc	%i5,	%i2,	%o2
loop_2633:
	sth	%l3,	[%l7 + 0x54]
	edge32	%g7,	%i1,	%l5
	movle	%icc,	%g6,	%i3
	tvs	%xcc,	0x5
	edge8n	%l0,	%g2,	%g1
	brlez	%l1,	loop_2634
	udiv	%i6,	0x18BE,	%l2
	nop
	setx	loop_2635,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	edge32l	%o6,	%g4,	%o4
loop_2634:
	fpmerge	%f4,	%f17,	%f4
	edge32ln	%o0,	%g3,	%g5
loop_2635:
	nop
	set	0x08, %l2
	swapa	[%l7 + %l2] 0x81,	%l6
	xorcc	%o7,	%i7,	%o5
	tcc	%icc,	0x3
	fandnot2	%f28,	%f10,	%f4
	movne	%icc,	%o3,	%l4
	fcmped	%fcc3,	%f26,	%f28
	xnor	%i0,	0x1517,	%i4
	edge32n	%o1,	%i2,	%i5
	movl	%xcc,	%l3,	%o2
	mova	%icc,	%i1,	%l5
	fmovrslez	%g6,	%f22,	%f31
	orncc	%g7,	%l0,	%i3
	fmovrsne	%g1,	%f13,	%f24
	xorcc	%g2,	%l1,	%i6
	srlx	%l2,	0x0C,	%o6
	and	%o4,	0x0FD3,	%o0
	fble,a	%fcc0,	loop_2636
	ldx	[%l7 + 0x38],	%g3
	flush	%l7 + 0x08
	fornot2s	%f27,	%f22,	%f18
loop_2636:
	sdivx	%g4,	0x1144,	%l6
	fmovrdgez	%o7,	%f26,	%f24
	movne	%xcc,	%i7,	%g5
	fmovsa	%icc,	%f13,	%f20
	xorcc	%o3,	0x145E,	%l4
	andncc	%o5,	%i0,	%o1
	bgu	%icc,	loop_2637
	movcc	%xcc,	%i4,	%i2
	tsubcc	%i5,	0x022E,	%o2
	fbe,a	%fcc2,	loop_2638
loop_2637:
	edge8ln	%l3,	%i1,	%l5
	movcc	%xcc,	%g7,	%l0
	bshuffle	%f22,	%f22,	%f20
loop_2638:
	ba	%icc,	loop_2639
	tg	%xcc,	0x4
	fsrc2	%f24,	%f30
	stw	%i3,	[%l7 + 0x30]
loop_2639:
	edge32ln	%g1,	%g6,	%g2
	fsrc1	%f20,	%f16
	fpackfix	%f24,	%f30
	fbe,a	%fcc0,	loop_2640
	edge16l	%l1,	%i6,	%l2
	fandnot1	%f26,	%f20,	%f24
	movpos	%xcc,	%o4,	%o6
loop_2640:
	tl	%icc,	0x4
	subc	%g3,	0x06AF,	%o0
	fbu,a	%fcc2,	loop_2641
	fandnot2s	%f10,	%f11,	%f28
	movrgez	%g4,	%o7,	%i7
	tsubcc	%g5,	0x1431,	%l6
loop_2641:
	umul	%l4,	%o3,	%i0
	bcs,a,pn	%xcc,	loop_2642
	smulcc	%o1,	0x0D36,	%o5
	and	%i4,	0x1D3E,	%i5
	edge16ln	%o2,	%i2,	%l3
loop_2642:
	fmuld8ulx16	%f21,	%f16,	%f2
	fmovdcs	%icc,	%f23,	%f31
	fmovsvc	%xcc,	%f23,	%f8
	mulscc	%i1,	0x11D1,	%l5
	fblg,a	%fcc0,	loop_2643
	fmovsne	%icc,	%f30,	%f22
	movneg	%xcc,	%g7,	%i3
	alignaddrl	%g1,	%g6,	%g2
loop_2643:
	subccc	%l0,	%i6,	%l2
	fmul8x16	%f25,	%f10,	%f30
	fmovda	%xcc,	%f0,	%f12
	ldd	[%l7 + 0x38],	%o4
	brlez,a	%l1,	loop_2644
	fexpand	%f28,	%f16
	add	%o6,	0x0383,	%o0
	fcmpgt16	%f26,	%f22,	%g4
loop_2644:
	movneg	%xcc,	%g3,	%i7
	edge16	%o7,	%g5,	%l4
	edge16l	%o3,	%i0,	%o1
	fexpand	%f6,	%f6
	fcmpes	%fcc1,	%f29,	%f24
	bvs,a	loop_2645
	sdivcc	%l6,	0x190B,	%i4
	fornot2	%f4,	%f24,	%f18
	nop
	set	0x08, %i2
	ldx	[%l7 + %i2],	%o5
loop_2645:
	stw	%i5,	[%l7 + 0x58]
	ldd	[%l7 + 0x68],	%i2
	tn	%icc,	0x4
	fmul8x16	%f2,	%f0,	%f12
	edge32	%o2,	%i1,	%l3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fsrc1s	%f24,	%f2
	fcmple32	%f26,	%f22,	%g7
	movl	%xcc,	%l5,	%i3
	mova	%icc,	%g6,	%g1
	sir	0x06ED
	set	0x38, %l3
	lduba	[%l7 + %l3] 0x15,	%g2
	fble,a	%fcc2,	loop_2646
	fmovspos	%icc,	%f4,	%f28
	tneg	%icc,	0x3
	fmovrslez	%i6,	%f7,	%f17
loop_2646:
	edge8ln	%l2,	%l0,	%o4
	movcc	%xcc,	%l1,	%o0
	edge8n	%o6,	%g3,	%i7
	bgu	%icc,	loop_2647
	tsubcctv	%g4,	%o7,	%l4
	edge16n	%g5,	%i0,	%o1
	fcmps	%fcc2,	%f22,	%f10
loop_2647:
	fbug,a	%fcc3,	loop_2648
	edge8ln	%l6,	%i4,	%o3
	alignaddr	%o5,	%i2,	%i5
	fbo	%fcc0,	loop_2649
loop_2648:
	edge16n	%o2,	%l3,	%i1
	lduh	[%l7 + 0x1E],	%g7
	fsrc2s	%f14,	%f7
loop_2649:
	array32	%l5,	%g6,	%i3
	subc	%g2,	%i6,	%g1
	movcs	%xcc,	%l2,	%l0
	tgu	%icc,	0x3
	fmovsneg	%xcc,	%f30,	%f31
	membar	#Sync
	set	0x40, %l0
	ldda	[%l7 + %l0] 0xf0,	%f0
	movleu	%icc,	%l1,	%o4
	set	0x10, %g4
	stwa	%o6,	[%l7 + %g4] 0x89
	wr	%g0,	0x80,	%asi
	prefetcha	[%l7 + 0x20] %asi,	 0x0
	movne	%icc,	%i7,	%g3
	fpsub16s	%f5,	%f6,	%f23
	bne,a,pn	%icc,	loop_2650
	fsrc2s	%f2,	%f29
	fmovrse	%g4,	%f18,	%f6
	movn	%icc,	%o7,	%l4
loop_2650:
	nop
	wr	%g0,	0x80,	%asi
	swapa	[%l7 + 0x54] %asi,	%g5
	fmovdge	%icc,	%f12,	%f22
	srlx	%o1,	0x1C,	%l6
	bneg	%icc,	loop_2651
	fcmpgt32	%f22,	%f2,	%i4
	fmovrdne	%i0,	%f0,	%f8
	sir	0x1DBE
loop_2651:
	and	%o5,	%o3,	%i5
	bl,pn	%xcc,	loop_2652
	xor	%o2,	0x000C,	%i2
	edge8ln	%l3,	%g7,	%i1
	edge32l	%g6,	%i3,	%l5
loop_2652:
	brnz,a	%g2,	loop_2653
	addc	%g1,	%l2,	%i6
	srax	%l0,	0x04,	%o4
	membar	0x12
loop_2653:
	fpsub16s	%f1,	%f17,	%f20
	wr	%g0,	0x10,	%asi
	lda	[%l7 + 0x74] %asi,	%f15
	udivx	%l1,	0x0116,	%o6
	srl	%o0,	%i7,	%g3
	set	0x50, %o3
	prefetcha	[%l7 + %o3] 0x81,	 0x0
	be,pn	%icc,	loop_2654
	udivcc	%l4,	0x1382,	%g4
	movre	%g5,	0x25A,	%o1
	fmuld8ulx16	%f22,	%f4,	%f16
loop_2654:
	movrgez	%i4,	0x215,	%i0
	tvs	%xcc,	0x6
	popc	0x1244,	%l6
	be	%xcc,	loop_2655
	lduh	[%l7 + 0x48],	%o3
	fmovsl	%icc,	%f1,	%f22
	brlz,a	%i5,	loop_2656
loop_2655:
	fmovspos	%icc,	%f14,	%f7
	sub	%o5,	0x1E94,	%o2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2656:
	fmovrdgz	%l3,	%f12,	%f14
	movpos	%xcc,	%i2,	%i1
	set	0x08, %i0
	prefetcha	[%l7 + %i0] 0x89,	 0x3
	edge8n	%g6,	%l5,	%i3
	tl	%icc,	0x5
	fbo	%fcc1,	loop_2657
	sethi	0x1C77,	%g2
	movneg	%icc,	%l2,	%g1
	fmovdvs	%xcc,	%f2,	%f25
loop_2657:
	nop
	set	0x08, %i6
	lduwa	[%l7 + %i6] 0x10,	%l0
	movrlz	%o4,	0x2FF,	%l1
	movne	%xcc,	%o6,	%i6
	bge	%xcc,	loop_2658
	udiv	%o0,	0x0602,	%i7
	fcmped	%fcc2,	%f30,	%f28
	fbne	%fcc2,	loop_2659
loop_2658:
	fcmpeq32	%f0,	%f22,	%g3
	addc	%l4,	0x0857,	%g4
	sir	0x0D3A
loop_2659:
	movne	%xcc,	%g5,	%o1
	alignaddrl	%o7,	%i0,	%i4
	wr	%g0,	0x88,	%asi
	lduba	[%l7 + 0x4A] %asi,	%l6
	movcs	%icc,	%o3,	%i5
	addc	%o5,	%l3,	%o2
	orcc	%i1,	%g7,	%g6
	set	0x10, %o2
	prefetcha	[%l7 + %o2] 0x0c,	 0x3
	movg	%icc,	%i3,	%g2
	fpsub32s	%f7,	%f22,	%f7
	fbu,a	%fcc0,	loop_2660
	fpack32	%f30,	%f12,	%f0
	st	%f12,	[%l7 + 0x54]
	fmul8sux16	%f14,	%f4,	%f6
loop_2660:
	or	%i2,	%l2,	%g1
	fmovsneg	%icc,	%f11,	%f27
	wr	%g0,	0x80,	%asi
	lduwa	[%l7 + 0x3C] %asi,	%o4
	smulcc	%l0,	0x08E6,	%l1
	fexpand	%f18,	%f16
	movrlz	%o6,	0x131,	%i6
	fnand	%f6,	%f14,	%f28
	nop
	setx	loop_2661,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fmovdpos	%xcc,	%f15,	%f15
	tvs	%xcc,	0x7
	sir	0x01AB
loop_2661:
	st	%f15,	[%l7 + 0x58]
	fbo,a	%fcc3,	loop_2662
	taddcctv	%o0,	%i7,	%g3
	sdivx	%g4,	0x0E5F,	%l4
	subcc	%g5,	0x0B61,	%o1
loop_2662:
	fnot1s	%f21,	%f1
	xnor	%o7,	%i4,	%i0
	set	0x0, %l4
	stxa	%l6,	[%g0 + %l4] 0x57
	fsrc1s	%f8,	%f16
	nop
	set	0x7E, %o6
	lduh	[%l7 + %o6],	%i5
	fbu,a	%fcc3,	loop_2663
	andcc	%o3,	0x11C3,	%o5
	taddcctv	%l3,	%i1,	%g7
	edge32l	%o2,	%g6,	%i3
loop_2663:
	movrlz	%l5,	%i2,	%g2
	std	%g0,	[%l7 + 0x28]
	xorcc	%o4,	%l0,	%l1
	sra	%o6,	0x1F,	%i6
	fble,a	%fcc0,	loop_2664
	tcc	%icc,	0x5
	edge16n	%l2,	%i7,	%g3
	movrgz	%o0,	%g4,	%l4
loop_2664:
	fbe,a	%fcc1,	loop_2665
	addc	%g5,	%o1,	%i4
	edge16	%i0,	%o7,	%i5
	sllx	%l6,	%o5,	%o3
loop_2665:
	movre	%l3,	%i1,	%g7
	umul	%g6,	%o2,	%i3
	alignaddr	%i2,	%g2,	%g1
	movrlez	%o4,	0x267,	%l5
	wr	%g0,	0x89,	%asi
	stxa	%l1,	[%l7 + 0x48] %asi
	fxnors	%f17,	%f2,	%f25
	edge8l	%o6,	%i6,	%l0
	fbl,a	%fcc2,	loop_2666
	sll	%i7,	0x05,	%g3
	wr	%g0,	0x80,	%asi
	ldsba	[%l7 + 0x51] %asi,	%l2
loop_2666:
	taddcctv	%g4,	%o0,	%g5
	xnor	%o1,	0x0D33,	%i4
	udivx	%l4,	0x0BB5,	%i0
	movle	%xcc,	%o7,	%l6
	movg	%icc,	%o5,	%o3
	udiv	%i5,	0x11CA,	%i1
	addc	%g7,	%g6,	%l3
	ld	[%l7 + 0x40],	%f8
	movge	%icc,	%o2,	%i2
	fbge,a	%fcc2,	loop_2667
	fbn	%fcc0,	loop_2668
	fpadd16	%f10,	%f28,	%f20
	movpos	%xcc,	%i3,	%g2
loop_2667:
	tpos	%icc,	0x5
loop_2668:
	andn	%g1,	%o4,	%l1
	andcc	%o6,	0x1F82,	%l5
	bn	loop_2669
	sdiv	%l0,	0x045E,	%i6
	xnorcc	%i7,	0x011B,	%l2
	ldx	[%l7 + 0x18],	%g4
loop_2669:
	subccc	%g3,	0x0179,	%o0
	sth	%g5,	[%l7 + 0x78]
	wr	%g0,	0x89,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	movn	%icc,	%i4,	%o1
	brgz	%l4,	loop_2670
	edge16	%o7,	%l6,	%i0
	edge8ln	%o3,	%o5,	%i5
	te	%icc,	0x7
loop_2670:
	movrlez	%g7,	%g6,	%i1
	fmovsgu	%icc,	%f23,	%f12
	taddcc	%l3,	0x0342,	%o2
	fmovrse	%i3,	%f11,	%f7
	sllx	%i2,	0x0E,	%g2
	set	0x08, %g1
	lduha	[%l7 + %g1] 0x18,	%g1
	be,a,pn	%icc,	loop_2671
	sub	%o4,	%l1,	%l5
	sub	%l0,	0x0684,	%o6
	fbg	%fcc0,	loop_2672
loop_2671:
	xnor	%i7,	0x0C89,	%i6
	movrgz	%g4,	0x1B0,	%g3
	tg	%icc,	0x0
loop_2672:
	movvc	%xcc,	%l2,	%o0
	tneg	%xcc,	0x2
	tsubcctv	%i4,	0x1CD8,	%o1
	brlz,a	%g5,	loop_2673
	fcmpes	%fcc2,	%f16,	%f22
	nop
	set	0x68, %g3
	stw	%o7,	[%l7 + %g3]
	tneg	%icc,	0x6
loop_2673:
	movrgez	%l4,	%i0,	%l6
	fmovsg	%icc,	%f22,	%f22
	st	%f25,	[%l7 + 0x4C]
	set	0x70, %i7
	ldda	[%l7 + %i7] 0x11,	%o2
	brz	%o5,	loop_2674
	fmul8x16al	%f26,	%f7,	%f10
	tcs	%xcc,	0x2
	edge16n	%g7,	%g6,	%i1
loop_2674:
	fcmpd	%fcc2,	%f4,	%f16
	movrlez	%i5,	0x16D,	%o2
	ldsw	[%l7 + 0x6C],	%i3
	tsubcctv	%i2,	%g2,	%l3
	tleu	%icc,	0x0
	movvc	%xcc,	%o4,	%l1
	alignaddrl	%g1,	%l5,	%o6
	brz,a	%l0,	loop_2675
	fcmpeq32	%f26,	%f2,	%i7
	std	%i6,	[%l7 + 0x08]
	fbl,a	%fcc1,	loop_2676
loop_2675:
	edge8	%g4,	%g3,	%l2
	move	%xcc,	%o0,	%i4
	edge16	%o1,	%g5,	%l4
loop_2676:
	bvs,a,pn	%xcc,	loop_2677
	edge16	%i0,	%o7,	%l6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldub	[%l7 + 0x10],	%o3
loop_2677:
	movn	%icc,	%o5,	%g7
	movrgz	%i1,	0x20C,	%i5
	bcc,pt	%icc,	loop_2678
	tleu	%xcc,	0x5
	fnegd	%f30,	%f6
	fxnor	%f12,	%f6,	%f8
loop_2678:
	movg	%icc,	%g6,	%o2
	fpadd32s	%f16,	%f17,	%f7
	fmovdl	%icc,	%f30,	%f25
	te	%icc,	0x6
	fmovsgu	%icc,	%f2,	%f6
	edge8n	%i2,	%g2,	%i3
	fcmpgt32	%f12,	%f24,	%o4
	fmovdcs	%icc,	%f27,	%f16
	sdiv	%l3,	0x160A,	%g1
	fcmple16	%f6,	%f4,	%l5
	fbe,a	%fcc2,	loop_2679
	lduw	[%l7 + 0x28],	%l1
	edge8l	%l0,	%i7,	%i6
	wr	%g0,	0x19,	%asi
	stwa	%g4,	[%l7 + 0x6C] %asi
loop_2679:
	edge32l	%o6,	%l2,	%g3
	bn,pn	%xcc,	loop_2680
	movrne	%i4,	%o1,	%o0
	brlez	%l4,	loop_2681
	movcs	%icc,	%g5,	%i0
loop_2680:
	tcc	%xcc,	0x6
	sdiv	%o7,	0x1EEA,	%l6
loop_2681:
	movcs	%icc,	%o5,	%o3
	sdiv	%g7,	0x099A,	%i1
	movcc	%xcc,	%i5,	%o2
	set	0x08, %l5
	prefetcha	[%l7 + %l5] 0x0c,	 0x2
	udiv	%g2,	0x19A1,	%i3
	edge16ln	%g6,	%l3,	%o4
	movrlz	%g1,	%l5,	%l1
	for	%f14,	%f8,	%f2
	bshuffle	%f8,	%f28,	%f24
	fcmpd	%fcc2,	%f4,	%f18
	fpack32	%f0,	%f10,	%f0
	add	%l7,	0x30,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%i7,	%l0
	nop
	setx	loop_2682,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fbe,a	%fcc1,	loop_2683
	srax	%i6,	%g4,	%l2
	taddcctv	%g3,	%i4,	%o6
loop_2682:
	smul	%o0,	%l4,	%o1
loop_2683:
	nop
	set	0x4B, %o7
	stba	%g5,	[%l7 + %o7] 0x14
	fmovrslez	%o7,	%f24,	%f21
	set	0x37, %i5
	ldsba	[%l7 + %i5] 0x0c,	%l6
	ldstub	[%l7 + 0x0B],	%i0
	pdist	%f22,	%f16,	%f24
	sll	%o5,	0x0B,	%o3
	movrlz	%i1,	%i5,	%o2
	edge8ln	%g7,	%i2,	%i3
	fbe,a	%fcc3,	loop_2684
	srax	%g2,	0x19,	%g6
	sdivx	%o4,	0x195C,	%l3
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
loop_2684:
	tge	%xcc,	0x2
	edge16ln	%g1,	%l1,	%i7
	fones	%f10
loop_2685:
	movrgz	%l0,	0x3FF,	%i6
	sir	0x104C
	nop
	set	0x62, %g5
	ldub	[%l7 + %g5],	%l5
	movl	%icc,	%l2,	%g3
	ldsb	[%l7 + 0x5D],	%i4
	fmovsa	%xcc,	%f14,	%f31
	movcc	%icc,	%g4,	%o6
	fcmpes	%fcc0,	%f19,	%f31
	andn	%o0,	%l4,	%g5
	or	%o7,	%l6,	%o1
	fbule	%fcc0,	loop_2686
	fbg,a	%fcc2,	loop_2687
	fornot2	%f12,	%f10,	%f26
	movrlez	%i0,	0x303,	%o5
loop_2686:
	subc	%o3,	0x16BC,	%i1
loop_2687:
	taddcc	%o2,	%i5,	%i2
	set	0x54, %o0
	ldsha	[%l7 + %o0] 0x89,	%g7
	sethi	0x08EA,	%i3
	fpsub32s	%f6,	%f25,	%f28
	fcmpd	%fcc3,	%f18,	%f18
	fmovrslz	%g6,	%f16,	%f2
	xorcc	%g2,	%o4,	%g1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8n	%l3,	%l1,	%i7
	edge32l	%l0,	%l5,	%i6
	fmovsne	%icc,	%f13,	%f11
	sethi	0x0416,	%l2
	tsubcctv	%g3,	%i4,	%o6
	fnot2	%f10,	%f30
	nop
	setx	loop_2688,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tpos	%xcc,	0x4
	alignaddr	%o0,	%l4,	%g5
	edge16n	%g4,	%o7,	%l6
loop_2688:
	ta	%xcc,	0x4
	nop
	setx	loop_2689,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fbne,a	%fcc0,	loop_2690
	movcc	%icc,	%o1,	%i0
	tvs	%xcc,	0x1
loop_2689:
	lduw	[%l7 + 0x50],	%o5
loop_2690:
	ldd	[%l7 + 0x28],	%f0
	movrne	%i1,	0x2C8,	%o2
	sub	%o3,	%i2,	%g7
	movn	%xcc,	%i3,	%g6
	tg	%icc,	0x3
	bvc,a,pn	%icc,	loop_2691
	srlx	%g2,	0x1D,	%o4
	bcc,a	%icc,	loop_2692
	ble	loop_2693
loop_2691:
	sdiv	%i5,	0x1C34,	%l3
	tneg	%icc,	0x5
loop_2692:
	movrgez	%g1,	0x1FD,	%i7
loop_2693:
	te	%icc,	0x1
	nop
	setx loop_2694, %l0, %l1
	jmpl %l1, %l0
	popc	0x09B3,	%l5
	subc	%i6,	%l2,	%g3
	fornot1	%f12,	%f28,	%f24
loop_2694:
	srlx	%l1,	0x06,	%i4
	fmovdg	%icc,	%f3,	%f2
	move	%icc,	%o0,	%l4
	tne	%icc,	0x6
	membar	0x46
	tcc	%xcc,	0x4
	fandnot1	%f30,	%f12,	%f12
	set	0x190, %i4
	nop 	! 	stxa	%g5,	[%g0 + %i4] 0x40 ripped by fixASI40.pl
	flush	%l7 + 0x44
	edge8n	%o6,	%o7,	%l6
	movvs	%icc,	%g4,	%i0
	fbe,a	%fcc2,	loop_2695
	edge32l	%o1,	%o5,	%o2
	subccc	%i1,	%i2,	%g7
	fmovsn	%xcc,	%f23,	%f31
loop_2695:
	sub	%o3,	0x02E7,	%i3
	fbule,a	%fcc1,	loop_2696
	brlez,a	%g2,	loop_2697
	edge16l	%o4,	%g6,	%l3
	bleu,a,pn	%xcc,	loop_2698
loop_2696:
	tneg	%icc,	0x3
loop_2697:
	or	%i5,	%i7,	%g1
	fornot1s	%f15,	%f13,	%f19
loop_2698:
	nop
	set	0x60, %l1
	ldda	[%l7 + %l1] 0xe2,	%l4
	tn	%xcc,	0x3
	array32	%l0,	%i6,	%l2
	ldstub	[%l7 + 0x13],	%g3
	fsrc1s	%f4,	%f22
	tvc	%icc,	0x7
	edge16	%l1,	%i4,	%o0
	fzeros	%f6
	fmovscs	%icc,	%f5,	%f14
	fandnot2	%f8,	%f20,	%f2
	popc	%l4,	%g5
	wr	%g0,	0x89,	%asi
	ldda	[%l7 + 0x70] %asi,	%o6
	sethi	0x1E07,	%o6
	swap	[%l7 + 0x74],	%l6
	movneg	%icc,	%i0,	%o1
	be	loop_2699
	alignaddrl	%g4,	%o5,	%o2
	fpack16	%f28,	%f3
	fbu,a	%fcc1,	loop_2700
loop_2699:
	sdiv	%i1,	0x17EF,	%i2
	mulscc	%o3,	0x1F21,	%g7
	xorcc	%g2,	0x018F,	%o4
loop_2700:
	sdivcc	%g6,	0x17AE,	%l3
	add	%i5,	0x09EF,	%i7
	bcs	loop_2701
	bcc	%icc,	loop_2702
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
	ble,pn	%xcc,	loop_2704
loop_2701:
	fcmpne32	%f26,	%f16,	%g1
loop_2702:
	bvc,pt	%xcc,	loop_2705
loop_2703:
	fmovdvs	%xcc,	%f24,	%f0
loop_2704:
	tleu	%xcc,	0x3
	array8	%l5,	%i3,	%l0
loop_2705:
	fcmpd	%fcc0,	%f18,	%f20
	sir	0x1853
	addc	%i6,	%g3,	%l2
	movvs	%xcc,	%i4,	%o0
	sdivx	%l1,	0x1C2D,	%g5
	add	%o7,	%l4,	%l6
	udiv	%i0,	0x11AC,	%o1
	ldsw	[%l7 + 0x5C],	%o6
	fblg,a	%fcc3,	loop_2706
	and	%g4,	0x1EE1,	%o2
	taddcctv	%o5,	0x05C1,	%i1
	subccc	%o3,	%g7,	%i2
loop_2706:
	bshuffle	%f20,	%f14,	%f18
	tsubcc	%g2,	0x10F7,	%g6
	array8	%l3,	%i5,	%i7
	xor	%o4,	0x06CE,	%g1
	tsubcc	%i3,	%l5,	%i6
	andncc	%l0,	%g3,	%l2
	fsrc2	%f10,	%f20
	fbug	%fcc2,	loop_2707
	nop
	setx loop_2708, %l0, %l1
	jmpl %l1, %i4
	edge8ln	%o0,	%l1,	%g5
	sra	%o7,	%l6,	%i0
loop_2707:
	and	%o1,	0x0A14,	%o6
loop_2708:
	bgu,pt	%icc,	loop_2709
	addccc	%g4,	%o2,	%l4
	tl	%icc,	0x0
	be,a	loop_2710
loop_2709:
	fxnors	%f2,	%f19,	%f14
	movvc	%xcc,	%o5,	%i1
	te	%icc,	0x6
loop_2710:
	tgu	%icc,	0x2
	sllx	%g7,	%i2,	%g2
	smulcc	%g6,	0x05BC,	%o3
	mulx	%i5,	%l3,	%i7
	umulcc	%g1,	0x055E,	%i3
	srlx	%l5,	%i6,	%o4
	fexpand	%f4,	%f24
	fpsub16	%f4,	%f18,	%f12
	addc	%g3,	0x1C87,	%l2
	sdivcc	%l0,	0x0C6F,	%i4
	fmul8x16al	%f24,	%f15,	%f10
	fandnot1s	%f10,	%f31,	%f17
	sir	0x0157
	wr	%g0,	0x88,	%asi
	ldstuba	[%l7 + 0x4D] %asi,	%o0
	fmovs	%f10,	%f26
	movvc	%xcc,	%g5,	%l1
	popc	%l6,	%o7
	mova	%icc,	%o1,	%o6
	udivcc	%i0,	0x0D91,	%g4
	sth	%o2,	[%l7 + 0x4A]
	fsrc2s	%f20,	%f0
	edge32l	%o5,	%l4,	%i1
	tle	%xcc,	0x1
	bge	%xcc,	loop_2711
	tleu	%xcc,	0x3
	edge8	%g7,	%g2,	%i2
	set	0x54, %g6
	ldsha	[%l7 + %g6] 0x11,	%o3
loop_2711:
	ldd	[%l7 + 0x28],	%g6
	ta	%icc,	0x0
	addc	%l3,	0x1EBF,	%i5
	srlx	%i7,	%g1,	%i3
	array8	%i6,	%l5,	%o4
	fmovsneg	%xcc,	%f20,	%f10
	fbug	%fcc0,	loop_2712
	movrne	%l2,	0x11B,	%g3
	fmovrdlez	%i4,	%f8,	%f0
	wr	%g0,	0x18,	%asi
	swapa	[%l7 + 0x28] %asi,	%l0
loop_2712:
	ldsw	[%l7 + 0x28],	%g5
	fcmpgt32	%f20,	%f2,	%l1
	bcc,pn	%xcc,	loop_2713
	ldub	[%l7 + 0x3C],	%o0
	fbue,a	%fcc2,	loop_2714
	fxnor	%f30,	%f20,	%f22
loop_2713:
	movgu	%icc,	%l6,	%o1
	fandnot2	%f10,	%f4,	%f26
loop_2714:
	fmovrsgez	%o6,	%f14,	%f5
	sethi	0x0723,	%o7
	te	%xcc,	0x4
	or	%g4,	%o2,	%i0
	fnot2s	%f30,	%f31
	sir	0x0BC4
	array32	%o5,	%l4,	%i1
	udivx	%g7,	0x0C9E,	%i2
	ble,a,pn	%icc,	loop_2715
	udivx	%o3,	0x13BF,	%g2
	udiv	%l3,	0x0E89,	%i5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2715:
	udivcc	%i7,	0x045A,	%g6
	fba	%fcc0,	loop_2716
	movn	%icc,	%g1,	%i6
	orcc	%l5,	0x1F0B,	%i3
	add	%l2,	0x015F,	%o4
loop_2716:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrlz	%g3,	%i4,	%l0
	fmovde	%xcc,	%f25,	%f18
	fmovdcs	%icc,	%f13,	%f9
	fmovsa	%icc,	%f18,	%f14
	fcmple32	%f16,	%f16,	%g5
	alignaddr	%o0,	%l6,	%l1
	tgu	%xcc,	0x3
	fmul8x16	%f11,	%f12,	%f2
	add	%l7,	0x4C,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%o1,	%o7
	fones	%f29
	andn	%o6,	%g4,	%i0
	pdist	%f18,	%f26,	%f30
	siam	0x5
	fmovse	%icc,	%f0,	%f9
	sub	%o5,	%l4,	%o2
	siam	0x4
	add	%l7,	0x10,	%l6
	wr	%g0,	0x18,	%asi
	lda	[%l6] %asi,	%i1
	casa	[%l6] 0x18,	%i1,	%i2
	tne	%xcc,	0x7
	fblg	%fcc2,	loop_2717
	edge16l	%o3,	%g2,	%g7
	edge32l	%i5,	%i7,	%l3
	bneg,a	loop_2718
loop_2717:
	fbge	%fcc1,	loop_2719
	subccc	%g1,	0x0666,	%i6
	fsrc2	%f26,	%f2
loop_2718:
	nop
	setx	loop_2720,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_2719:
	brgez,a	%l5,	loop_2721
	tg	%icc,	0x5
	brlz,a	%i3,	loop_2722
loop_2720:
	fbg	%fcc3,	loop_2723
loop_2721:
	tle	%xcc,	0x3
	tge	%xcc,	0x0
loop_2722:
	tl	%icc,	0x7
loop_2723:
	fmuld8ulx16	%f14,	%f14,	%f12
	srl	%g6,	0x15,	%o4
	sdivx	%l2,	0x1DE8,	%i4
	bge,pt	%xcc,	loop_2724
	tne	%xcc,	0x1
	xor	%l0,	%g3,	%o0
	fmovrdlz	%l6,	%f18,	%f22
loop_2724:
	alignaddr	%g5,	%l1,	%o7
	fnand	%f20,	%f20,	%f28
	umul	%o1,	%g4,	%o6
	edge8ln	%i0,	%o5,	%l4
	tl	%icc,	0x6
	movl	%xcc,	%i1,	%o2
	movrgez	%o3,	0x201,	%g2
	edge32n	%g7,	%i2,	%i7
	mulscc	%i5,	0x1BF7,	%g1
	movre	%i6,	%l3,	%i3
	movrgez	%g6,	0x04F,	%l5
	nop
	setx	loop_2725,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tl	%icc,	0x3
	tleu	%icc,	0x3
	movpos	%icc,	%l2,	%i4
loop_2725:
	bpos,a,pn	%xcc,	loop_2726
	tleu	%icc,	0x4
	movpos	%xcc,	%l0,	%g3
	mulscc	%o0,	%o4,	%l6
loop_2726:
	tpos	%icc,	0x2
	xnor	%l1,	0x07DC,	%o7
	and	%o1,	0x1288,	%g5
	nop
	set	0x44, %o5
	ldsw	[%l7 + %o5],	%g4
	fmovrsgez	%i0,	%f25,	%f9
	fbo,a	%fcc1,	loop_2727
	brz,a	%o5,	loop_2728
	be	loop_2729
	add	%o6,	%l4,	%o2
loop_2727:
	srl	%o3,	0x13,	%i1
loop_2728:
	movgu	%xcc,	%g2,	%g7
loop_2729:
	smul	%i2,	0x139B,	%i5
	wr	%g0,	0x23,	%asi
	stxa	%i7,	[%l7 + 0x28] %asi
	membar	#Sync
	subcc	%g1,	%i6,	%l3
	fbn	%fcc1,	loop_2730
	srlx	%g6,	%l5,	%l2
	bn,pn	%xcc,	loop_2731
	and	%i3,	0x0033,	%i4
loop_2730:
	nop
	set	0x72, %o1
	ldsha	[%l7 + %o1] 0x89,	%l0
loop_2731:
	taddcctv	%g3,	%o4,	%o0
	subcc	%l1,	0x0E7A,	%l6
	alignaddr	%o7,	%o1,	%g4
	udivx	%i0,	0x12FB,	%g5
	sub	%o5,	%l4,	%o2
	membar	0x5A
	tcs	%xcc,	0x0
	fmovrsgez	%o3,	%f2,	%f6
	brnz	%o6,	loop_2732
	addcc	%i1,	%g2,	%g7
	smulcc	%i2,	%i5,	%g1
	edge16	%i6,	%i7,	%g6
loop_2732:
	swap	[%l7 + 0x40],	%l5
	fzeros	%f9
	nop
	setx	loop_2733,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	siam	0x3
	or	%l3,	0x1CA1,	%l2
	xor	%i3,	0x17CB,	%l0
loop_2733:
	swap	[%l7 + 0x7C],	%i4
	nop
	set	0x48, %o4
	std	%f8,	[%l7 + %o4]
	fcmpeq16	%f6,	%f18,	%o4
	set	0x28, %g2
	ldswa	[%l7 + %g2] 0x88,	%o0
	fpadd32	%f28,	%f0,	%f16
	ldx	[%l7 + 0x70],	%g3
	movrgz	%l1,	%o7,	%o1
	tn	%icc,	0x5
	fmovdvs	%xcc,	%f25,	%f27
	fbn,a	%fcc2,	loop_2734
	alignaddrl	%g4,	%i0,	%l6
	edge8	%g5,	%l4,	%o5
	movrlez	%o3,	%o6,	%i1
loop_2734:
	array32	%g2,	%g7,	%o2
	movrgez	%i2,	0x1D4,	%i5
	mova	%xcc,	%i6,	%i7
	fnot1s	%f28,	%f10
	mova	%xcc,	%g1,	%g6
	array32	%l3,	%l2,	%l5
	move	%icc,	%l0,	%i3
	fnot2s	%f4,	%f30
	tsubcc	%i4,	%o0,	%g3
	movneg	%xcc,	%o4,	%o7
	array8	%o1,	%g4,	%l1
	fornot1	%f14,	%f26,	%f24
	sdiv	%i0,	0x1327,	%l6
	fandnot2s	%f0,	%f15,	%f6
	tge	%icc,	0x5
	fbge,a	%fcc0,	loop_2735
	fornot2	%f30,	%f24,	%f26
	mulscc	%g5,	0x1D8D,	%o5
	orn	%l4,	0x06D3,	%o6
loop_2735:
	mulx	%o3,	%i1,	%g2
	tleu	%icc,	0x4
	nop
	setx loop_2736, %l0, %l1
	jmpl %l1, %g7
	movneg	%xcc,	%i2,	%i5
	edge8l	%i6,	%i7,	%o2
	stw	%g1,	[%l7 + 0x64]
loop_2736:
	movvs	%xcc,	%l3,	%g6
	sdivcc	%l2,	0x1B75,	%l0
	movvc	%icc,	%i3,	%i4
	array32	%l5,	%g3,	%o4
	ta	%xcc,	0x1
	st	%f5,	[%l7 + 0x14]
	fbne	%fcc0,	loop_2737
	fnors	%f1,	%f10,	%f22
	fmovsneg	%xcc,	%f11,	%f20
	sll	%o0,	0x0A,	%o1
loop_2737:
	addcc	%g4,	%o7,	%l1
	lduh	[%l7 + 0x6C],	%i0
	fmovdvc	%icc,	%f13,	%f9
	fpadd16s	%f11,	%f26,	%f4
	set	0x09, %l6
	ldsba	[%l7 + %l6] 0x15,	%l6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srl	%g5,	%l4,	%o6
	fmovrslz	%o5,	%f24,	%f21
	tne	%xcc,	0x5
	taddcctv	%o3,	%g2,	%i1
	fandnot1s	%f1,	%f13,	%f19
	sethi	0x0644,	%i2
	movne	%xcc,	%g7,	%i5
	edge32l	%i7,	%o2,	%g1
	fmovs	%f3,	%f8
	wr	%g0,	0x89,	%asi
	lduwa	[%l7 + 0x68] %asi,	%l3
	fmovrslz	%g6,	%f23,	%f31
	srax	%l2,	%l0,	%i6
	tcc	%xcc,	0x6
	fornot2	%f14,	%f12,	%f12
	mova	%icc,	%i4,	%i3
	for	%f28,	%f26,	%f10
	ldub	[%l7 + 0x0B],	%g3
	sub	%l5,	%o0,	%o4
	fmul8ulx16	%f2,	%f0,	%f16
	mova	%xcc,	%o1,	%g4
	tleu	%icc,	0x3
	movpos	%xcc,	%l1,	%o7
	xnor	%l6,	0x1D45,	%i0
	array8	%g5,	%l4,	%o5
	movpos	%icc,	%o6,	%o3
	fbge,a	%fcc2,	loop_2738
	movcc	%xcc,	%i1,	%g2
	edge32ln	%i2,	%i5,	%g7
	fmovsle	%icc,	%f24,	%f1
loop_2738:
	bn,pn	%icc,	loop_2739
	fbne	%fcc2,	loop_2740
	edge32	%i7,	%g1,	%l3
	movrlz	%g6,	0x106,	%o2
loop_2739:
	sllx	%l0,	%l2,	%i6
loop_2740:
	fbue	%fcc1,	loop_2741
	array16	%i3,	%i4,	%g3
	bpos,a	%xcc,	loop_2742
	movge	%icc,	%l5,	%o0
loop_2741:
	movvc	%xcc,	%o4,	%o1
	lduh	[%l7 + 0x24],	%g4
loop_2742:
	sth	%o7,	[%l7 + 0x3C]
	mulx	%l1,	%i0,	%g5
	fbn	%fcc2,	loop_2743
	fpack32	%f22,	%f14,	%f8
	movl	%xcc,	%l4,	%l6
	stbar
loop_2743:
	fmul8x16au	%f4,	%f17,	%f26
	lduw	[%l7 + 0x50],	%o6
	wr	%g0,	0x89,	%asi
	lduwa	[%l7 + 0x6C] %asi,	%o5
	sir	0x1BD3
	addc	%o3,	%i1,	%g2
	edge16n	%i2,	%i5,	%i7
	movcc	%xcc,	%g7,	%l3
	movl	%icc,	%g6,	%g1
	subccc	%l0,	%l2,	%i6
	movrgz	%i3,	0x26A,	%i4
	bleu,pn	%xcc,	loop_2744
	stw	%o2,	[%l7 + 0x64]
	xor	%g3,	%l5,	%o0
	call	loop_2745
loop_2744:
	sdivx	%o1,	0x012C,	%o4
	taddcc	%g4,	%l1,	%i0
	fbge,a	%fcc2,	loop_2746
loop_2745:
	smul	%o7,	%g5,	%l6
	edge8	%o6,	%l4,	%o3
	fmovs	%f16,	%f3
loop_2746:
	andncc	%i1,	%g2,	%o5
	fmul8ulx16	%f20,	%f0,	%f20
	taddcc	%i2,	0x0755,	%i7
	fble,a	%fcc1,	loop_2747
	std	%f12,	[%l7 + 0x68]
	st	%f8,	[%l7 + 0x1C]
	fmovdvs	%icc,	%f11,	%f15
loop_2747:
	array32	%g7,	%l3,	%i5
	udivcc	%g1,	0x0C76,	%l0
	fpadd32s	%f20,	%f19,	%f11
	bleu,a,pt	%icc,	loop_2748
	fpsub16	%f2,	%f8,	%f24
	add	%g6,	0x13D2,	%l2
	fandnot1	%f28,	%f26,	%f20
loop_2748:
	tl	%xcc,	0x1
	andncc	%i3,	%i4,	%o2
	nop
	set	0x08, %i3
	ldd	[%l7 + %i3],	%f4
	array32	%g3,	%l5,	%o0
	edge8l	%o1,	%i6,	%o4
	movcs	%icc,	%l1,	%i0
	movrne	%g4,	%g5,	%o7
	movcc	%xcc,	%l6,	%o6
	sra	%o3,	%i1,	%g2
	fmovrde	%o5,	%f12,	%f2
	movleu	%icc,	%i2,	%i7
	fnand	%f8,	%f0,	%f16
	fandnot2s	%f4,	%f9,	%f27
	tpos	%xcc,	0x0
	fsrc1	%f4,	%f24
	fmovsgu	%icc,	%f18,	%f7
	fmovsn	%icc,	%f9,	%f10
	fbg,a	%fcc0,	loop_2749
	fble	%fcc0,	loop_2750
	fcmple32	%f24,	%f12,	%g7
	fmovsvc	%xcc,	%f8,	%f19
loop_2749:
	tne	%xcc,	0x4
loop_2750:
	fmovdgu	%icc,	%f30,	%f25
	tleu	%xcc,	0x7
	xorcc	%l4,	0x0846,	%l3
	fbul	%fcc1,	loop_2751
	tg	%xcc,	0x1
	fandnot2s	%f15,	%f14,	%f14
	orcc	%i5,	%g1,	%g6
loop_2751:
	bpos,a	%icc,	loop_2752
	prefetch	[%l7 + 0x3C],	 0x1
	taddcc	%l0,	%i3,	%i4
	sir	0x0FE4
loop_2752:
	fabss	%f3,	%f29
	umul	%l2,	0x1C71,	%o2
	tle	%xcc,	0x6
	set	0x08, %g7
	stda	%l4,	[%l7 + %g7] 0x14
	udivcc	%o0,	0x1842,	%o1
	sll	%g3,	0x16,	%o4
	stb	%l1,	[%l7 + 0x4F]
	bn,a	%xcc,	loop_2753
	udiv	%i6,	0x0321,	%g4
	tneg	%icc,	0x2
	nop
	setx	loop_2754,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_2753:
	ld	[%l7 + 0x54],	%f13
	udivcc	%i0,	0x02D5,	%o7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2754:
	taddcctv	%g5,	%o6,	%l6
	brlz	%i1,	loop_2755
	fba	%fcc2,	loop_2756
	sll	%g2,	0x1D,	%o3
	fmovdl	%xcc,	%f2,	%f7
loop_2755:
	subcc	%o5,	0x06A2,	%i2
loop_2756:
	movcc	%xcc,	%i7,	%g7
	stw	%l3,	[%l7 + 0x58]
	movneg	%icc,	%i5,	%l4
	xnorcc	%g6,	%l0,	%g1
	mulscc	%i3,	0x0A42,	%i4
	edge16l	%l2,	%l5,	%o0
	udiv	%o2,	0x0DC7,	%o1
	addccc	%o4,	%l1,	%i6
	xnorcc	%g3,	%g4,	%o7
	fble,a	%fcc2,	loop_2757
	nop
	setx loop_2758, %l0, %l1
	jmpl %l1, %i0
	fcmpd	%fcc3,	%f28,	%f28
	bvc,pn	%icc,	loop_2759
loop_2757:
	andcc	%o6,	0x1399,	%g5
loop_2758:
	sub	%l6,	0x0106,	%i1
	tn	%xcc,	0x7
loop_2759:
	fnegd	%f16,	%f24
	edge16n	%g2,	%o5,	%o3
	tle	%icc,	0x1
	fmovrdlez	%i2,	%f22,	%f24
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tgu	%icc,	0x5
	prefetch	[%l7 + 0x08],	 0x1
	add	%i7,	0x015C,	%l3
	fmovdvs	%xcc,	%f23,	%f28
	fmovdn	%xcc,	%f24,	%f14
	set	0x28, %i1
	ldswa	[%l7 + %i1] 0x80,	%g7
	orncc	%i5,	0x12E8,	%g6
	fcmps	%fcc0,	%f15,	%f22
	bl	loop_2760
	tle	%xcc,	0x7
	call	loop_2761
	fmovrde	%l0,	%f18,	%f10
loop_2760:
	array16	%g1,	%l4,	%i4
	fmovsvs	%xcc,	%f25,	%f16
loop_2761:
	fcmpne32	%f0,	%f2,	%i3
	movg	%xcc,	%l2,	%o0
	bpos,a	%icc,	loop_2762
	fnors	%f18,	%f31,	%f17
	udivx	%l5,	0x172B,	%o2
	fbne,a	%fcc0,	loop_2763
loop_2762:
	nop
	setx	loop_2764,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movleu	%xcc,	%o1,	%l1
	st	%f19,	[%l7 + 0x0C]
loop_2763:
	movne	%xcc,	%i6,	%g3
loop_2764:
	add	%o4,	0x0AAB,	%o7
	tpos	%icc,	0x1
	andncc	%i0,	%g4,	%g5
	movleu	%icc,	%l6,	%i1
	tgu	%xcc,	0x5
	fble,a	%fcc3,	loop_2765
	smulcc	%g2,	%o6,	%o3
	movcc	%icc,	%i2,	%i7
	edge32n	%o5,	%g7,	%i5
loop_2765:
	tl	%icc,	0x0
	sdivcc	%g6,	0x0C99,	%l0
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
	taddcc	%l3,	%l4,	%g1
	fmul8x16al	%f19,	%f17,	%f20
	umulcc	%i3,	%i4,	%l2
loop_2766:
	movg	%icc,	%o0,	%l5
	udivcc	%o2,	0x0600,	%o1
	movle	%xcc,	%i6,	%l1
	orncc	%g3,	0x1ACF,	%o4
	srax	%o7,	%i0,	%g4
	ble	loop_2767
	and	%l6,	%g5,	%g2
	subcc	%o6,	0x1F61,	%o3
	tg	%xcc,	0x6
loop_2767:
	nop
	set	0x47, %i2
	ldsba	[%l7 + %i2] 0x11,	%i1
	orcc	%i2,	%i7,	%g7
	st	%f24,	[%l7 + 0x64]
	sdiv	%o5,	0x04B7,	%g6
	movpos	%icc,	%i5,	%l0
	fxnors	%f29,	%f8,	%f24
	mulscc	%l3,	0x05DE,	%g1
	fmovsneg	%icc,	%f7,	%f16
	stb	%i3,	[%l7 + 0x1D]
	ldub	[%l7 + 0x68],	%l4
	fmovrsgez	%i4,	%f12,	%f30
	nop
	setx	loop_2768,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	srlx	%o0,	0x1D,	%l5
	for	%f12,	%f0,	%f14
	fmovsn	%icc,	%f17,	%f28
loop_2768:
	fbo,a	%fcc3,	loop_2769
	st	%f28,	[%l7 + 0x78]
	tl	%xcc,	0x3
	bleu	loop_2770
loop_2769:
	fmovrdgez	%l2,	%f20,	%f16
	andcc	%o1,	0x18D4,	%o2
	andn	%l1,	0x176E,	%g3
loop_2770:
	movrlez	%o4,	0x219,	%o7
	movcc	%icc,	%i6,	%i0
	tne	%icc,	0x5
	stx	%g4,	[%l7 + 0x30]
	wr	%g0,	0x89,	%asi
	sta	%f16,	[%l7 + 0x1C] %asi
	set	0x52, %l3
	ldstuba	[%l7 + %l3] 0x89,	%l6
	wr	%g0,	0x88,	%asi
	ldsha	[%l7 + 0x1C] %asi,	%g2
	wr	%g0,	0x11,	%asi
	sta	%f20,	[%l7 + 0x78] %asi
	fnors	%f4,	%f22,	%f3
	ldsb	[%l7 + 0x42],	%o6
	bcs	loop_2771
	fmovdvc	%icc,	%f17,	%f19
	sir	0x17F6
	array8	%g5,	%o3,	%i1
loop_2771:
	udiv	%i2,	0x08D1,	%g7
	array32	%o5,	%i7,	%g6
	umul	%l0,	%l3,	%i5
	subccc	%i3,	%l4,	%i4
	st	%f0,	[%l7 + 0x60]
	subc	%g1,	0x0FF0,	%o0
	andn	%l2,	%l5,	%o1
	and	%l1,	%o2,	%g3
	set	0x59, %l0
	ldsba	[%l7 + %l0] 0x04,	%o4
	bl,a	%xcc,	loop_2772
	fmovrse	%o7,	%f13,	%f13
	set	0x40, %l2
	ldda	[%l7 + %l2] 0x14,	%f16
loop_2772:
	edge8l	%i6,	%i0,	%l6
	tvs	%xcc,	0x4
	brz	%g2,	loop_2773
	movne	%icc,	%o6,	%g4
	movpos	%xcc,	%g5,	%o3
	sir	0x02A3
loop_2773:
	srlx	%i1,	%i2,	%o5
	fmovrslez	%g7,	%f25,	%f20
	wr	%g0,	0x88,	%asi
	swapa	[%l7 + 0x3C] %asi,	%g6
	fmovsa	%icc,	%f2,	%f19
	fbge	%fcc3,	loop_2774
	pdist	%f6,	%f24,	%f2
	movre	%l0,	%i7,	%l3
	bn,pn	%icc,	loop_2775
loop_2774:
	fmovdcc	%xcc,	%f2,	%f26
	fpsub16s	%f21,	%f18,	%f21
	fbge,a	%fcc0,	loop_2776
loop_2775:
	fcmpd	%fcc0,	%f6,	%f14
	fmovrslz	%i5,	%f17,	%f3
	sub	%i3,	0x153B,	%i4
loop_2776:
	be,pt	%icc,	loop_2777
	movrlez	%l4,	%o0,	%g1
	nop
	setx	loop_2778,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	brgez	%l2,	loop_2779
loop_2777:
	stb	%o1,	[%l7 + 0x22]
	fbge,a	%fcc2,	loop_2780
loop_2778:
	tge	%icc,	0x1
loop_2779:
	fandnot1s	%f12,	%f28,	%f5
	ldub	[%l7 + 0x71],	%l5
loop_2780:
	fands	%f0,	%f2,	%f6
	fbule,a	%fcc0,	loop_2781
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbne,a	%fcc1,	loop_2782
	tleu	%icc,	0x6
loop_2781:
	sub	%l1,	0x08B3,	%o2
	fmovsvs	%xcc,	%f6,	%f15
loop_2782:
	sdivx	%g3,	0x17A3,	%o4
	fnors	%f23,	%f11,	%f27
	call	loop_2783
	movvc	%icc,	%o7,	%i0
	fmovda	%icc,	%f17,	%f30
	movle	%icc,	%l6,	%g2
loop_2783:
	fmul8x16au	%f27,	%f0,	%f12
	alignaddrl	%o6,	%g4,	%g5
	fands	%f17,	%f26,	%f9
	tsubcc	%i6,	%i1,	%o3
	popc	%i2,	%g7
	movrne	%o5,	%l0,	%i7
	tsubcctv	%l3,	%g6,	%i5
	movne	%icc,	%i3,	%i4
	movvc	%icc,	%l4,	%o0
	fcmpgt16	%f0,	%f24,	%g1
	tvs	%icc,	0x4
	fblg,a	%fcc1,	loop_2784
	tsubcc	%o1,	0x0D6F,	%l5
	movvc	%icc,	%l2,	%o2
	movrgz	%g3,	0x2FB,	%o4
loop_2784:
	te	%icc,	0x1
	fmovdcc	%xcc,	%f29,	%f14
	fnegs	%f9,	%f13
	sth	%o7,	[%l7 + 0x0C]
	bgu,a	loop_2785
	movne	%icc,	%i0,	%l6
	fmovrdlz	%g2,	%f4,	%f30
	movcc	%icc,	%l1,	%g4
loop_2785:
	movgu	%xcc,	%g5,	%o6
	set	0x68, %g4
	sta	%f24,	[%l7 + %g4] 0x15
	tneg	%xcc,	0x3
	std	%i6,	[%l7 + 0x60]
	sth	%i1,	[%l7 + 0x54]
	movcs	%icc,	%o3,	%g7
	lduw	[%l7 + 0x20],	%i2
	fmovscc	%icc,	%f11,	%f31
	ta	%icc,	0x1
	sdiv	%o5,	0x0752,	%i7
	fornot1	%f4,	%f24,	%f12
	andncc	%l3,	%g6,	%i5
	movpos	%icc,	%l0,	%i3
	faligndata	%f26,	%f18,	%f22
	srlx	%l4,	0x0A,	%i4
	tsubcctv	%g1,	%o0,	%o1
	tge	%xcc,	0x7
	tvs	%xcc,	0x1
	tsubcc	%l5,	%o2,	%g3
	brgz	%o4,	loop_2786
	fexpand	%f19,	%f6
	edge8ln	%l2,	%o7,	%l6
	tvs	%icc,	0x2
loop_2786:
	nop
	set	0x41, %o3
	ldsba	[%l7 + %o3] 0x14,	%i0
	ldsb	[%l7 + 0x4E],	%l1
	movcs	%xcc,	%g2,	%g5
	set	0x40, %i6
	stha	%o6,	[%l7 + %i6] 0xe2
	membar	#Sync
	fmovdg	%xcc,	%f22,	%f15
	andcc	%i6,	%i1,	%g4
	movgu	%xcc,	%o3,	%i2
	fxor	%f10,	%f8,	%f14
	sdivx	%o5,	0x0DA0,	%g7
	ldd	[%l7 + 0x10],	%f16
	set	0x70, %i0
	stda	%l2,	[%l7 + %i0] 0xeb
	membar	#Sync
	wr	%g0,	0x18,	%asi
	lduwa	[%l7 + 0x60] %asi,	%g6
	srlx	%i5,	0x15,	%l0
	movg	%icc,	%i7,	%l4
	fpadd32s	%f11,	%f3,	%f31
	xnor	%i3,	0x0CBD,	%g1
	fba,a	%fcc1,	loop_2787
	movge	%xcc,	%i4,	%o0
	fmovdvc	%xcc,	%f16,	%f6
	xnor	%l5,	0x1D4C,	%o2
loop_2787:
	fmovda	%xcc,	%f18,	%f21
	fbl	%fcc3,	loop_2788
	tvs	%icc,	0x1
	fbne,a	%fcc0,	loop_2789
	st	%f23,	[%l7 + 0x78]
loop_2788:
	sdiv	%g3,	0x170B,	%o4
	subc	%o1,	0x0637,	%o7
loop_2789:
	tn	%icc,	0x5
	tcs	%xcc,	0x3
	tne	%icc,	0x6
	fornot1	%f22,	%f2,	%f30
	tn	%xcc,	0x0
	siam	0x6
	fornot2s	%f1,	%f22,	%f2
	tleu	%xcc,	0x1
	bpos	loop_2790
	tne	%xcc,	0x2
	bcc,pt	%icc,	loop_2791
	fpadd32	%f4,	%f14,	%f24
loop_2790:
	movleu	%xcc,	%l6,	%l2
	umulcc	%l1,	%i0,	%g2
loop_2791:
	stbar
	movre	%o6,	%i6,	%g5
	fmovrslez	%i1,	%f8,	%f20
	movg	%icc,	%g4,	%o3
	tvs	%icc,	0x0
	edge32ln	%i2,	%g7,	%o5
	movpos	%icc,	%l3,	%g6
	umulcc	%l0,	0x0F00,	%i5
	xorcc	%i7,	%i3,	%g1
	movpos	%icc,	%l4,	%i4
	ldd	[%l7 + 0x38],	%l4
	fandnot2s	%f21,	%f7,	%f30
	fmovdgu	%icc,	%f21,	%f20
	fpsub16	%f18,	%f24,	%f26
	umul	%o0,	0x1B89,	%g3
	st	%f8,	[%l7 + 0x64]
	fmovrdgez	%o2,	%f24,	%f22
	flush	%l7 + 0x4C
	array32	%o4,	%o1,	%o7
	array16	%l6,	%l1,	%l2
	andncc	%g2,	%o6,	%i6
	ble,a	%icc,	loop_2792
	tneg	%xcc,	0x3
	edge32	%i0,	%i1,	%g4
	srax	%o3,	%g5,	%g7
loop_2792:
	bne,a,pt	%xcc,	loop_2793
	srl	%i2,	%l3,	%o5
	membar	0x4C
	fmovrdgez	%l0,	%f6,	%f6
loop_2793:
	addc	%i5,	%i7,	%i3
	movl	%xcc,	%g1,	%l4
	fmul8x16al	%f9,	%f9,	%f8
	movrgez	%g6,	0x035,	%l5
	subccc	%i4,	%o0,	%g3
	orcc	%o2,	0x0E24,	%o1
	wr	%g0,	0x88,	%asi
	lduha	[%l7 + 0x46] %asi,	%o4
	bg,a	%icc,	loop_2794
	edge32n	%o7,	%l1,	%l6
	fcmpes	%fcc2,	%f9,	%f14
	fmovrsgz	%l2,	%f23,	%f23
loop_2794:
	xor	%o6,	0x059F,	%i6
	movre	%g2,	%i1,	%i0
	movg	%icc,	%g4,	%o3
	movre	%g5,	%i2,	%g7
	orn	%o5,	%l0,	%l3
	tcs	%icc,	0x2
	umulcc	%i7,	%i5,	%i3
	subc	%l4,	%g6,	%l5
	srlx	%i4,	%g1,	%g3
	bcc,a	%icc,	loop_2795
	umul	%o0,	0x0FD0,	%o2
	fand	%f18,	%f8,	%f6
	fnot2s	%f17,	%f31
loop_2795:
	lduh	[%l7 + 0x10],	%o1
	xorcc	%o7,	0x1FE9,	%o4
	tne	%icc,	0x5
	tn	%icc,	0x7
	tvs	%icc,	0x2
	for	%f16,	%f0,	%f6
	fpadd16s	%f9,	%f8,	%f26
	andncc	%l1,	%l2,	%l6
	fmovrse	%o6,	%f16,	%f12
	be,a	loop_2796
	movrgez	%i6,	%i1,	%i0
	tcs	%icc,	0x6
	fpadd32s	%f10,	%f5,	%f26
loop_2796:
	fors	%f21,	%f8,	%f22
	edge8n	%g4,	%o3,	%g2
	fmul8x16al	%f1,	%f2,	%f22
	edge32	%i2,	%g5,	%o5
	fbne,a	%fcc0,	loop_2797
	te	%xcc,	0x0
	tleu	%xcc,	0x6
	xnorcc	%g7,	%l3,	%l0
loop_2797:
	fba,a	%fcc0,	loop_2798
	subcc	%i7,	%i3,	%i5
	udivx	%g6,	0x0ACC,	%l5
	tvc	%xcc,	0x1
loop_2798:
	bcc,a,pt	%xcc,	loop_2799
	edge32ln	%l4,	%i4,	%g3
	membar	0x41
	brlz,a	%g1,	loop_2800
loop_2799:
	edge16ln	%o2,	%o0,	%o7
	movrlz	%o1,	0x2D4,	%o4
	movpos	%xcc,	%l1,	%l2
loop_2800:
	brz,a	%l6,	loop_2801
	or	%o6,	%i1,	%i6
	movvc	%icc,	%g4,	%o3
	fandnot2	%f2,	%f20,	%f24
loop_2801:
	bvc,pt	%xcc,	loop_2802
	fpadd16s	%f26,	%f9,	%f0
	movvc	%icc,	%i0,	%g2
	array32	%i2,	%g5,	%o5
loop_2802:
	fcmple16	%f18,	%f28,	%g7
	stw	%l3,	[%l7 + 0x50]
	set	0x20, %o2
	ldda	[%l7 + %o2] 0x2b,	%l0
	fpsub32s	%f7,	%f16,	%f9
	movrgz	%i3,	%i5,	%i7
	wr	%g0,	0x27,	%asi
	stha	%g6,	[%l7 + 0x38] %asi
	membar	#Sync
	fmovdg	%icc,	%f1,	%f24
	xnor	%l5,	0x0664,	%i4
	tsubcctv	%l4,	0x1B18,	%g3
	movrlez	%g1,	%o2,	%o0
	fpmerge	%f8,	%f10,	%f6
	edge32ln	%o1,	%o7,	%o4
	fcmpgt32	%f0,	%f10,	%l2
	subcc	%l6,	0x1832,	%l1
	tn	%xcc,	0x0
	movvs	%icc,	%i1,	%o6
	nop
	set	0x72, %l4
	sth	%i6,	[%l7 + %l4]
	fbl	%fcc1,	loop_2803
	tl	%icc,	0x2
	tgu	%icc,	0x0
	edge8l	%o3,	%g4,	%i0
loop_2803:
	fbge,a	%fcc2,	loop_2804
	bvc,a,pt	%xcc,	loop_2805
	fandnot2	%f10,	%f28,	%f28
	movre	%g2,	0x004,	%g5
loop_2804:
	brnz	%o5,	loop_2806
loop_2805:
	sdivx	%i2,	0x0F01,	%g7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ld	[%l7 + 0x0C],	%f26
loop_2806:
	fcmpeq32	%f18,	%f26,	%l0
	brgz,a	%l3,	loop_2807
	udiv	%i3,	0x011A,	%i5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	taddcctv	%i7,	%l5,	%g6
loop_2807:
	andn	%l4,	0x14A1,	%g3
	array8	%i4,	%o2,	%g1
	smulcc	%o0,	%o7,	%o1
	sub	%l2,	0x1BF5,	%l6
	srl	%l1,	0x1D,	%i1
	movg	%icc,	%o6,	%o4
	array16	%o3,	%i6,	%i0
	movrne	%g2,	%g5,	%o5
	orcc	%g4,	%g7,	%i2
	movvc	%xcc,	%l3,	%i3
	call	loop_2808
	sir	0x1A6C
	bg	loop_2809
	fornot2	%f4,	%f30,	%f8
loop_2808:
	nop
	wr	%g0,	0x10,	%asi
	stba	%l0,	[%l7 + 0x20] %asi
loop_2809:
	nop
	set	0x26, %g1
	lduba	[%l7 + %g1] 0x0c,	%i5
	fpadd32s	%f10,	%f29,	%f8
	fcmped	%fcc1,	%f2,	%f28
	fnot1	%f8,	%f8
	fnand	%f14,	%f20,	%f20
	subccc	%l5,	0x05E1,	%g6
	swap	[%l7 + 0x48],	%i7
	brz,a	%l4,	loop_2810
	fmovde	%icc,	%f24,	%f8
	tsubcctv	%g3,	0x176C,	%o2
	tsubcc	%g1,	%i4,	%o0
loop_2810:
	edge8ln	%o7,	%o1,	%l6
	popc	%l2,	%l1
	movre	%o6,	0x39C,	%i1
	nop
	setx loop_2811, %l0, %l1
	jmpl %l1, %o4
	subc	%o3,	0x17A0,	%i0
	subccc	%i6,	0x1E5A,	%g5
	smulcc	%g2,	%g4,	%o5
loop_2811:
	edge32	%g7,	%i2,	%l3
	fmovsleu	%xcc,	%f7,	%f22
	fmovsa	%icc,	%f9,	%f18
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbu,a	%fcc2,	loop_2812
	fbuge	%fcc3,	loop_2813
	fmovsneg	%icc,	%f20,	%f9
	movcc	%icc,	%l0,	%i3
loop_2812:
	ldd	[%l7 + 0x58],	%f20
loop_2813:
	edge16n	%l5,	%g6,	%i7
	edge32l	%l4,	%g3,	%o2
	edge8ln	%g1,	%i4,	%i5
	movg	%icc,	%o0,	%o1
	fmovspos	%icc,	%f25,	%f24
	fmovrdlez	%o7,	%f26,	%f14
	wr	%g0,	0x27,	%asi
	stxa	%l6,	[%l7 + 0x28] %asi
	membar	#Sync
	movge	%xcc,	%l1,	%o6
	fmovs	%f10,	%f26
	fpadd16	%f20,	%f26,	%f24
	movleu	%icc,	%l2,	%o4
	ldsw	[%l7 + 0x44],	%o3
	movne	%icc,	%i0,	%i6
	fcmpgt32	%f28,	%f22,	%g5
	bvc,a	loop_2814
	fbn	%fcc0,	loop_2815
	movre	%i1,	%g4,	%o5
	sub	%g7,	%i2,	%g2
loop_2814:
	tpos	%xcc,	0x7
loop_2815:
	smul	%l0,	0x14B2,	%l3
	fabsd	%f26,	%f24
	movgu	%icc,	%l5,	%i3
	array16	%i7,	%l4,	%g6
	fmovrdlez	%g3,	%f4,	%f20
	fpsub16	%f16,	%f30,	%f2
	movvs	%icc,	%g1,	%o2
	fmovsg	%icc,	%f14,	%f6
	tpos	%icc,	0x3
	addccc	%i5,	%o0,	%o1
	fcmpne32	%f22,	%f20,	%i4
	fnot1s	%f30,	%f4
	srax	%o7,	%l1,	%o6
	edge32n	%l6,	%o4,	%l2
	tn	%icc,	0x7
	te	%icc,	0x5
	ldub	[%l7 + 0x2E],	%i0
	lduw	[%l7 + 0x58],	%i6
	sir	0x1B22
	tle	%icc,	0x6
	fmul8sux16	%f16,	%f24,	%f10
	smulcc	%o3,	%g5,	%g4
	ldstub	[%l7 + 0x19],	%i1
	set	0x35, %g3
	lduba	[%l7 + %g3] 0x14,	%o5
	fmul8ulx16	%f10,	%f14,	%f14
	udivcc	%g7,	0x0ECF,	%g2
	movge	%icc,	%i2,	%l0
	umul	%l5,	0x0810,	%i3
	umulcc	%i7,	0x06F2,	%l3
	alignaddr	%l4,	%g6,	%g3
	membar	0x65
	taddcc	%o2,	0x157D,	%i5
	array32	%o0,	%g1,	%i4
	addcc	%o7,	%l1,	%o6
	sub	%o1,	0x1917,	%o4
	tge	%icc,	0x3
	movvc	%icc,	%l6,	%l2
	bgu,pn	%icc,	loop_2816
	ta	%icc,	0x3
	fexpand	%f10,	%f24
	fmovdg	%icc,	%f22,	%f15
loop_2816:
	fmovdle	%xcc,	%f11,	%f14
	movvs	%icc,	%i0,	%o3
	alignaddr	%i6,	%g5,	%i1
	faligndata	%f18,	%f4,	%f16
	movrgez	%o5,	%g7,	%g2
	addccc	%g4,	%l0,	%i2
	fmul8ulx16	%f14,	%f26,	%f26
	edge32	%i3,	%i7,	%l3
	edge16	%l4,	%l5,	%g6
	set	0x34, %o6
	stwa	%o2,	[%l7 + %o6] 0xe2
	membar	#Sync
	edge16l	%g3,	%o0,	%i5
	sth	%i4,	[%l7 + 0x34]
	tpos	%xcc,	0x2
	add	%l7,	0x78,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] %asi,	%o7,	%l1
	ldsh	[%l7 + 0x7A],	%g1
	wr	%g0,	0xf9,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
	std	%f28,	[%l7 + 0x20]
	tgu	%xcc,	0x2
	or	%o6,	0x10C9,	%o4
	siam	0x4
	movcc	%xcc,	%l6,	%l2
	fpsub32s	%f8,	%f7,	%f10
	fmovdcs	%icc,	%f13,	%f2
	or	%o1,	0x09BF,	%o3
	orcc	%i6,	%g5,	%i1
	nop
	setx	loop_2817,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	orn	%i0,	%o5,	%g2
	fmul8ulx16	%f8,	%f28,	%f24
	array8	%g7,	%g4,	%l0
loop_2817:
	movg	%icc,	%i3,	%i7
	fmovscc	%xcc,	%f12,	%f0
	wr	%g0,	0x23,	%asi
	ldda	[%l7 + 0x10] %asi,	%i2
	fpmerge	%f24,	%f6,	%f26
	tg	%icc,	0x7
	prefetch	[%l7 + 0x14],	 0x1
	edge8l	%l3,	%l4,	%g6
	movne	%icc,	%l5,	%o2
	tge	%xcc,	0x4
	fmovspos	%icc,	%f9,	%f29
	srax	%o0,	0x00,	%i5
	tsubcc	%i4,	0x0345,	%o7
	andn	%g3,	0x1775,	%g1
	srlx	%o6,	0x08,	%l1
	sethi	0x1B83,	%l6
	srl	%o4,	%o1,	%l2
	movrne	%o3,	%i6,	%g5
	ldx	[%l7 + 0x38],	%i0
	movg	%icc,	%o5,	%i1
	popc	%g7,	%g2
	array16	%l0,	%g4,	%i3
	fpsub16	%f4,	%f16,	%f12
	edge8n	%i7,	%i2,	%l3
	mulx	%l4,	0x0F95,	%g6
	te	%icc,	0x5
	bcc,a	%xcc,	loop_2818
	mulx	%l5,	%o0,	%i5
	bg,a,pt	%xcc,	loop_2819
	fba	%fcc3,	loop_2820
loop_2818:
	add	%i4,	0x0E48,	%o2
	array32	%g3,	%g1,	%o6
loop_2819:
	nop
	add	%l7,	0x10,	%l6
	wr	%g0,	0x19,	%asi
	ldxa	[%l6] %asi,	%l1
	casxa	[%l6] 0x19,	%l1,	%o7
loop_2820:
	fones	%f9
	sra	%l6,	0x12,	%o1
	or	%l2,	%o3,	%o4
	movcc	%icc,	%i6,	%g5
	sra	%o5,	%i0,	%i1
	te	%xcc,	0x1
	wr	%g0,	0x27,	%asi
	stxa	%g2,	[%l7 + 0x38] %asi
	membar	#Sync
	popc	0x073A,	%g7
	fbn	%fcc2,	loop_2821
	move	%xcc,	%g4,	%i3
	fmovdcc	%icc,	%f1,	%f12
	tgu	%xcc,	0x7
loop_2821:
	edge8ln	%i7,	%l0,	%i2
	andn	%l3,	0x007F,	%l4
	edge8n	%g6,	%l5,	%i5
	edge32	%i4,	%o0,	%o2
	fmovdl	%xcc,	%f6,	%f2
	tvs	%icc,	0x6
	edge32n	%g3,	%g1,	%o6
	edge8n	%l1,	%l6,	%o7
	subc	%l2,	0x191B,	%o1
	srl	%o3,	0x0B,	%o4
	bvc,a,pn	%icc,	loop_2822
	edge16	%g5,	%i6,	%o5
	fbug,a	%fcc3,	loop_2823
	movge	%icc,	%i0,	%g2
loop_2822:
	or	%g7,	%i1,	%g4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2823:
	tleu	%icc,	0x4
	mova	%icc,	%i3,	%i7
	movrlz	%l0,	0x23F,	%i2
	andn	%l3,	0x0451,	%l4
	andncc	%g6,	%i5,	%i4
	array8	%o0,	%l5,	%g3
	fbl	%fcc2,	loop_2824
	fmovda	%icc,	%f0,	%f31
	fmovdcs	%icc,	%f0,	%f13
	subccc	%g1,	%o2,	%l1
loop_2824:
	udivx	%l6,	0x13A5,	%o7
	fcmpeq32	%f20,	%f26,	%o6
	udiv	%o1,	0x0B66,	%o3
	nop
	setx loop_2825, %l0, %l1
	jmpl %l1, %o4
	fbg,a	%fcc0,	loop_2826
	fones	%f0
	edge8ln	%l2,	%i6,	%g5
loop_2825:
	fsrc2	%f26,	%f30
loop_2826:
	nop
	wr	%g0,	0x0c,	%asi
	lduba	[%l7 + 0x09] %asi,	%o5
	edge8	%i0,	%g7,	%g2
	fmovdleu	%xcc,	%f14,	%f27
	nop
	setx loop_2827, %l0, %l1
	jmpl %l1, %i1
	mova	%xcc,	%g4,	%i7
	xor	%i3,	%l0,	%i2
	udiv	%l3,	0x00E1,	%l4
loop_2827:
	ba,pt	%xcc,	loop_2828
	brnz,a	%i5,	loop_2829
	or	%g6,	%i4,	%l5
	xnor	%o0,	0x0537,	%g3
loop_2828:
	edge16n	%o2,	%g1,	%l1
loop_2829:
	tg	%icc,	0x6
	fxnor	%f26,	%f6,	%f20
	fmovrsgz	%l6,	%f16,	%f23
	fmovsgu	%xcc,	%f11,	%f1
	bgu	loop_2830
	move	%icc,	%o7,	%o6
	fabsd	%f30,	%f30
	bpos,a	%icc,	loop_2831
loop_2830:
	fmovdg	%xcc,	%f19,	%f21
	wr	%g0,	0x18,	%asi
	lduba	[%l7 + 0x65] %asi,	%o1
loop_2831:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmpgt32	%f6,	%f18,	%o3
	tleu	%xcc,	0x0
	fbe	%fcc1,	loop_2832
	fbe	%fcc1,	loop_2833
	udivcc	%o4,	0x1FE6,	%i6
	fbl	%fcc1,	loop_2834
loop_2832:
	fcmps	%fcc0,	%f0,	%f29
loop_2833:
	subccc	%g5,	%l2,	%i0
	edge32n	%g7,	%g2,	%i1
loop_2834:
	tcc	%xcc,	0x4
	fbuge,a	%fcc2,	loop_2835
	sll	%o5,	0x1F,	%g4
	edge32n	%i3,	%l0,	%i7
	wr	%g0,	0x89,	%asi
	stwa	%l3,	[%l7 + 0x48] %asi
loop_2835:
	fmovrdgez	%i2,	%f18,	%f22
	subc	%l4,	%i5,	%g6
	fblg,a	%fcc0,	loop_2836
	movrlz	%l5,	%i4,	%g3
	umul	%o2,	%g1,	%l1
	tcc	%xcc,	0x5
loop_2836:
	nop
	wr	%g0,	0x89,	%asi
	prefetcha	[%l7 + 0x08] %asi,	 0x1
	add	%l7,	0x70,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] %asi,	%o7,	%o6
	fbne	%fcc1,	loop_2837
	tne	%xcc,	0x7
	fpsub16	%f30,	%f0,	%f4
	fbge,a	%fcc2,	loop_2838
loop_2837:
	fcmpne16	%f2,	%f28,	%o0
	tsubcctv	%o3,	%o4,	%i6
	mova	%xcc,	%g5,	%l2
loop_2838:
	andncc	%i0,	%o1,	%g2
	wr	%g0,	0x10,	%asi
	stba	%g7,	[%l7 + 0x6E] %asi
	srlx	%i1,	%g4,	%o5
	fmul8ulx16	%f2,	%f6,	%f30
	movre	%i3,	%i7,	%l3
	ldd	[%l7 + 0x60],	%f30
	tneg	%xcc,	0x2
	fxnors	%f23,	%f27,	%f27
	sub	%i2,	0x1422,	%l0
	fbuge,a	%fcc0,	loop_2839
	brgz,a	%l4,	loop_2840
	fmovrde	%g6,	%f24,	%f26
	fmovsl	%icc,	%f6,	%f15
loop_2839:
	fones	%f31
loop_2840:
	add	%l5,	0x0514,	%i4
	tvc	%xcc,	0x4
	tsubcctv	%g3,	%i5,	%o2
	edge8ln	%l1,	%l6,	%o7
	taddcc	%g1,	%o6,	%o0
	srl	%o3,	%o4,	%i6
	bg,a,pn	%icc,	loop_2841
	move	%xcc,	%g5,	%l2
	movrgez	%o1,	%g2,	%i0
	sllx	%g7,	%i1,	%o5
loop_2841:
	movle	%xcc,	%i3,	%g4
	be	%xcc,	loop_2842
	edge32ln	%l3,	%i2,	%l0
	fbue	%fcc0,	loop_2843
	tvc	%icc,	0x3
loop_2842:
	brlez,a	%i7,	loop_2844
	udivx	%l4,	0x0CF9,	%g6
loop_2843:
	tg	%xcc,	0x7
	ldstub	[%l7 + 0x74],	%i4
loop_2844:
	mulx	%g3,	%i5,	%o2
	andn	%l1,	0x126C,	%l6
	fmul8x16al	%f13,	%f18,	%f16
	or	%o7,	0x000E,	%g1
	bvs,a	%xcc,	loop_2845
	xnorcc	%l5,	0x136C,	%o6
	movneg	%icc,	%o3,	%o4
	fbuge,a	%fcc3,	loop_2846
loop_2845:
	fmovdle	%icc,	%f11,	%f8
	fabss	%f5,	%f16
	ldx	[%l7 + 0x60],	%i6
loop_2846:
	addc	%g5,	0x1CBE,	%l2
	edge32ln	%o1,	%g2,	%i0
	fandnot2	%f16,	%f16,	%f16
	fmovsle	%icc,	%f23,	%f9
	tge	%xcc,	0x2
	ble,pn	%xcc,	loop_2847
	fabss	%f0,	%f29
	mulx	%g7,	0x0F64,	%i1
	wr	%g0,	0x10,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
loop_2847:
	ldub	[%l7 + 0x3A],	%o0
	edge32ln	%o5,	%i3,	%l3
	stb	%i2,	[%l7 + 0x29]
	stx	%g4,	[%l7 + 0x20]
	edge16ln	%i7,	%l4,	%g6
	smulcc	%l0,	0x187A,	%g3
	sub	%i5,	%o2,	%l1
	andn	%i4,	0x151A,	%o7
	tge	%icc,	0x2
	edge8	%l6,	%l5,	%g1
	fmovsneg	%icc,	%f24,	%f6
	bpos,a	loop_2848
	tg	%icc,	0x5
	array16	%o3,	%o4,	%o6
	fpadd32s	%f29,	%f30,	%f3
loop_2848:
	array16	%i6,	%g5,	%o1
	sdivx	%g2,	0x03F7,	%i0
	set	0x51, %l5
	lduba	[%l7 + %l5] 0x18,	%g7
	smulcc	%l2,	0x0204,	%o0
	nop
	setx	loop_2849,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	move	%xcc,	%o5,	%i1
	bshuffle	%f20,	%f12,	%f16
	fmovsvs	%xcc,	%f30,	%f9
loop_2849:
	brz,a	%i3,	loop_2850
	fmovsvs	%xcc,	%f3,	%f10
	edge32n	%l3,	%i2,	%g4
	movneg	%xcc,	%l4,	%i7
loop_2850:
	andcc	%g6,	%g3,	%l0
	tpos	%xcc,	0x2
	add	%l7,	0x6C,	%l6
	wr	%g0,	0x10,	%asi
	casa	[%l6] %asi,	%i5,	%l1
	fmovdn	%xcc,	%f18,	%f28
	subccc	%i4,	%o7,	%o2
	sdivx	%l5,	0x08BD,	%l6
	tcs	%xcc,	0x5
	tl	%icc,	0x4
	smulcc	%g1,	%o4,	%o6
	movg	%icc,	%i6,	%g5
	movle	%xcc,	%o3,	%o1
	ldsh	[%l7 + 0x4C],	%g2
	tpos	%xcc,	0x3
	bg,pt	%xcc,	loop_2851
	movle	%icc,	%i0,	%g7
	lduw	[%l7 + 0x70],	%l2
	movne	%icc,	%o0,	%o5
loop_2851:
	brgz	%i3,	loop_2852
	ldd	[%l7 + 0x70],	%i0
	fsrc1s	%f18,	%f18
	udiv	%i2,	0x1F6D,	%g4
loop_2852:
	taddcc	%l4,	%i7,	%g6
	pdist	%f4,	%f18,	%f2
	ldstub	[%l7 + 0x6A],	%g3
	wr	%g0,	0x19,	%asi
	ldsba	[%l7 + 0x60] %asi,	%l3
	fpmerge	%f11,	%f8,	%f4
	ba	loop_2853
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
	umulcc	%i5,	0x1E11,	%l1
loop_2853:
	ta	%xcc,	0x0
	sll	%l0,	0x1F,	%o7
	tge	%icc,	0x2
	udiv	%i4,	0x1E08,	%l5
	sll	%l6,	0x0A,	%o2
	orcc	%o4,	0x0799,	%g1
	brgz,a	%o6,	loop_2854
	sth	%g5,	[%l7 + 0x30]
	tle	%xcc,	0x7
	mova	%xcc,	%o3,	%i6
loop_2854:
	edge32	%o1,	%g2,	%i0
	movge	%icc,	%l2,	%o0
	subcc	%o5,	0x1373,	%i3
	tgu	%xcc,	0x7
	subc	%g7,	0x11BF,	%i1
	fbuge,a	%fcc1,	loop_2855
	ldd	[%l7 + 0x20],	%f26
	fmovs	%f15,	%f21
	bcs,pt	%icc,	loop_2856
loop_2855:
	tvc	%icc,	0x7
	fmovdgu	%xcc,	%f30,	%f18
	fmovrdlz	%i2,	%f16,	%f8
loop_2856:
	array8	%l4,	%i7,	%g6
	edge8n	%g4,	%l3,	%g3
	udivx	%l1,	0x0754,	%l0
	fpack32	%f30,	%f30,	%f6
	edge8n	%i5,	%i4,	%l5
	fmovrdne	%l6,	%f10,	%f22
	fbue,a	%fcc3,	loop_2857
	prefetch	[%l7 + 0x6C],	 0x2
	edge16ln	%o7,	%o2,	%o4
	add	%o6,	0x17BE,	%g1
loop_2857:
	fmovdleu	%icc,	%f5,	%f28
	sir	0x18B6
	fble,a	%fcc1,	loop_2858
	fbne	%fcc0,	loop_2859
	mulscc	%o3,	0x0F09,	%i6
	udiv	%o1,	0x1746,	%g2
loop_2858:
	nop
	set	0x38, %o7
	stha	%g5,	[%l7 + %o7] 0x89
loop_2859:
	tsubcctv	%i0,	%o0,	%o5
	srlx	%l2,	%i3,	%i1
	fmovrde	%g7,	%f8,	%f30
	fmovde	%icc,	%f20,	%f19
	edge16ln	%l4,	%i2,	%g6
	edge16ln	%g4,	%i7,	%g3
	for	%f10,	%f8,	%f4
	umul	%l3,	0x0517,	%l0
	fnot2	%f22,	%f14
	movrlez	%l1,	0x262,	%i4
	sdivx	%l5,	0x1EAE,	%l6
	tge	%icc,	0x3
	tge	%xcc,	0x5
	array16	%i5,	%o7,	%o4
	movre	%o6,	0x044,	%o2
	addc	%g1,	0x104A,	%i6
	bvs,a,pt	%icc,	loop_2860
	orcc	%o1,	0x14F7,	%g2
	orn	%g5,	%o3,	%i0
	add	%l7,	0x78,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%o5
	casxa	[%l6] %asi,	%o5,	%o0
loop_2860:
	udivx	%i3,	0x0706,	%i1
	nop
	set	0x30, %i7
	ldx	[%l7 + %i7],	%l2
	smulcc	%l4,	0x05C4,	%g7
	add	%l7,	0x24,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] %asi,	%i2,	%g6
	and	%i7,	%g3,	%g4
	bgu,a,pt	%icc,	loop_2861
	movre	%l0,	%l1,	%l3
	ldd	[%l7 + 0x70],	%f12
	tvs	%icc,	0x2
loop_2861:
	mulx	%i4,	%l6,	%i5
	fornot1	%f16,	%f22,	%f16
	ldx	[%l7 + 0x20],	%o7
	ldd	[%l7 + 0x08],	%f10
	set	0x15, %g5
	stba	%o4,	[%l7 + %g5] 0x2a
	membar	#Sync
	stx	%o6,	[%l7 + 0x50]
	xorcc	%l5,	0x0BF0,	%g1
	fcmpgt16	%f10,	%f6,	%o2
	edge32n	%o1,	%g2,	%i6
	tgu	%xcc,	0x6
	xor	%g5,	%o3,	%o5
	movrgz	%o0,	0x3A1,	%i0
	bge	loop_2862
	taddcctv	%i3,	0x0AE8,	%l2
	edge32	%l4,	%g7,	%i1
	smulcc	%i2,	0x0253,	%i7
loop_2862:
	fbge	%fcc1,	loop_2863
	subccc	%g3,	%g4,	%g6
	set	0x08, %i5
	stxa	%l0,	[%l7 + %i5] 0x10
loop_2863:
	array16	%l3,	%i4,	%l6
	ldsw	[%l7 + 0x54],	%l1
	edge8l	%o7,	%i5,	%o4
	tle	%icc,	0x2
	movneg	%xcc,	%l5,	%g1
	andn	%o2,	0x1FE8,	%o1
	andn	%g2,	0x19DE,	%o6
	movneg	%xcc,	%g5,	%i6
	fmovda	%icc,	%f16,	%f13
	ba,a	loop_2864
	sethi	0x0BC1,	%o5
	fmovsne	%xcc,	%f25,	%f4
	mova	%xcc,	%o3,	%o0
loop_2864:
	sll	%i3,	0x01,	%i0
	sllx	%l4,	0x1C,	%l2
	tneg	%xcc,	0x2
	tsubcc	%i1,	%i2,	%g7
	sth	%g3,	[%l7 + 0x44]
	tvs	%icc,	0x5
	tg	%icc,	0x3
	fpadd16s	%f3,	%f11,	%f22
	tcs	%icc,	0x0
	fbo,a	%fcc1,	loop_2865
	sethi	0x19D3,	%g4
	popc	%i7,	%g6
	te	%xcc,	0x7
loop_2865:
	srax	%l3,	%l0,	%l6
	tsubcc	%i4,	%o7,	%l1
	movrlez	%o4,	0x0CC,	%l5
	fmovsvc	%icc,	%f27,	%f12
	set	0x6C, %o0
	lduwa	[%l7 + %o0] 0x18,	%g1
	fpsub16s	%f0,	%f28,	%f28
	fmovdcs	%icc,	%f23,	%f9
	fbug	%fcc1,	loop_2866
	bge,a	%xcc,	loop_2867
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpack32	%f12,	%f16,	%f4
loop_2866:
	andncc	%i5,	%o1,	%o2
loop_2867:
	edge32l	%o6,	%g2,	%g5
	andncc	%i6,	%o5,	%o0
	bleu,a	%xcc,	loop_2868
	te	%icc,	0x4
	edge8l	%i3,	%o3,	%l4
	srlx	%l2,	0x1B,	%i1
loop_2868:
	bpos,a,pt	%icc,	loop_2869
	fmovdvs	%xcc,	%f22,	%f16
	movle	%icc,	%i2,	%g7
	orcc	%g3,	%g4,	%i7
loop_2869:
	movre	%g6,	0x327,	%l3
	st	%f9,	[%l7 + 0x20]
	sll	%i0,	0x1D,	%l6
	sub	%i4,	%l0,	%l1
	bn,a	loop_2870
	movrlez	%o4,	%o7,	%l5
	fbuge,a	%fcc3,	loop_2871
	fxor	%f4,	%f30,	%f24
loop_2870:
	fmul8ulx16	%f26,	%f18,	%f10
	movrlz	%i5,	%o1,	%o2
loop_2871:
	andncc	%g1,	%o6,	%g2
	te	%icc,	0x4
	wr	%g0,	0xe2,	%asi
	stha	%i6,	[%l7 + 0x7C] %asi
	membar	#Sync
	tcs	%icc,	0x2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	add	%l7,	0x50,	%l6
	wr	%g0,	0x19,	%asi
	casa	[%l6] 0x19,	%o5,	%o0
	stx	%i3,	[%l7 + 0x70]
	sra	%g5,	%o3,	%l2
	tneg	%xcc,	0x5
	sdivcc	%i1,	0x1B9A,	%l4
	fmovrsgz	%i2,	%f23,	%f26
	tsubcctv	%g7,	%g3,	%i7
	ta	%xcc,	0x1
	edge32n	%g6,	%g4,	%l3
	tle	%xcc,	0x6
	fnot1s	%f26,	%f29
	udivx	%i0,	0x1CC4,	%l6
	sllx	%i4,	0x0C,	%l0
	tcs	%xcc,	0x0
	edge32l	%l1,	%o4,	%o7
	alignaddr	%l5,	%o1,	%o2
	nop
	setx	loop_2872,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movvc	%xcc,	%i5,	%o6
	edge32ln	%g1,	%g2,	%i6
	tpos	%xcc,	0x6
loop_2872:
	popc	0x0B62,	%o5
	addcc	%i3,	%g5,	%o0
	brgz,a	%l2,	loop_2873
	movle	%icc,	%o3,	%i1
	std	%i2,	[%l7 + 0x78]
	edge32l	%l4,	%g3,	%i7
loop_2873:
	nop
	setx	loop_2874,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	nop
	setx	loop_2875,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	ba,pt	%xcc,	loop_2876
	movpos	%xcc,	%g6,	%g4
loop_2874:
	movge	%xcc,	%l3,	%i0
loop_2875:
	sra	%g7,	%i4,	%l0
loop_2876:
	fcmpes	%fcc0,	%f28,	%f31
	swap	[%l7 + 0x2C],	%l6
	brlz,a	%o4,	loop_2877
	fbl,a	%fcc0,	loop_2878
	brgz,a	%o7,	loop_2879
	fmovdcc	%icc,	%f28,	%f8
loop_2877:
	array8	%l5,	%o1,	%o2
loop_2878:
	fpack32	%f0,	%f30,	%f14
loop_2879:
	fmovsvs	%icc,	%f28,	%f1
	fmovdleu	%icc,	%f21,	%f26
	bleu,pt	%icc,	loop_2880
	bvs,a,pt	%xcc,	loop_2881
	mova	%xcc,	%i5,	%o6
	alignaddr	%l1,	%g1,	%i6
loop_2880:
	bne,a,pn	%icc,	loop_2882
loop_2881:
	sethi	0x07BE,	%o5
	fnors	%f16,	%f9,	%f20
	xor	%g2,	%i3,	%g5
loop_2882:
	fble,a	%fcc3,	loop_2883
	st	%f4,	[%l7 + 0x44]
	bneg	loop_2884
	array8	%o0,	%l2,	%o3
loop_2883:
	sub	%i1,	0x17B2,	%i2
	edge32n	%l4,	%i7,	%g3
loop_2884:
	tsubcctv	%g4,	%l3,	%g6
	stw	%i0,	[%l7 + 0x1C]
	sir	0x0FDE
	fbne	%fcc0,	loop_2885
	fpack16	%f8,	%f16
	xnor	%g7,	0x16AD,	%l0
	tle	%icc,	0x4
loop_2885:
	brlez	%l6,	loop_2886
	udivcc	%o4,	0x1C28,	%i4
	edge8n	%o7,	%l5,	%o1
	udivx	%o2,	0x155A,	%o6
loop_2886:
	fmovdne	%icc,	%f27,	%f7
	movcs	%icc,	%l1,	%g1
	fmovsvs	%xcc,	%f14,	%f1
	fmul8x16	%f16,	%f24,	%f14
	edge16l	%i5,	%o5,	%g2
	edge16n	%i3,	%g5,	%i6
	edge32l	%l2,	%o0,	%i1
	addc	%o3,	%l4,	%i2
	andncc	%i7,	%g3,	%g4
	fmovrslez	%l3,	%f25,	%f3
	fpadd32s	%f9,	%f9,	%f31
	swap	[%l7 + 0x70],	%i0
	fmovdleu	%xcc,	%f13,	%f15
	ld	[%l7 + 0x78],	%f25
	addcc	%g6,	%g7,	%l0
	fbg,a	%fcc3,	loop_2887
	or	%l6,	0x19D9,	%o4
	fmul8sux16	%f2,	%f8,	%f16
	edge32	%i4,	%l5,	%o7
loop_2887:
	fcmpeq32	%f14,	%f4,	%o1
	tne	%icc,	0x4
	fmovsneg	%xcc,	%f15,	%f5
	tn	%icc,	0x6
	addc	%o2,	0x1671,	%o6
	fba,a	%fcc1,	loop_2888
	fcmple32	%f4,	%f12,	%l1
	fcmple32	%f6,	%f18,	%g1
	edge16n	%i5,	%o5,	%g2
loop_2888:
	fsrc1	%f10,	%f0
	fors	%f4,	%f16,	%f8
	fmovrdgez	%g5,	%f8,	%f6
	tn	%icc,	0x7
	movvs	%icc,	%i6,	%i3
	ldd	[%l7 + 0x60],	%l2
	sra	%i1,	0x06,	%o0
	array8	%l4,	%i2,	%o3
	fands	%f1,	%f0,	%f9
	edge8n	%i7,	%g3,	%g4
	prefetch	[%l7 + 0x2C],	 0x3
	brlz	%l3,	loop_2889
	ta	%xcc,	0x3
	fcmped	%fcc0,	%f10,	%f16
	edge8ln	%g6,	%i0,	%g7
loop_2889:
	sethi	0x11F6,	%l6
	array16	%o4,	%l0,	%i4
	fmovdpos	%xcc,	%f15,	%f21
	sdivcc	%o7,	0x13F3,	%o1
	array8	%l5,	%o2,	%o6
	movg	%xcc,	%g1,	%l1
	sub	%o5,	0x10E9,	%g2
	set	0x0A, %i4
	lduha	[%l7 + %i4] 0x11,	%i5
	fmovdgu	%icc,	%f23,	%f26
	edge16l	%g5,	%i3,	%l2
	srlx	%i1,	%o0,	%l4
	tpos	%xcc,	0x5
	movl	%xcc,	%i6,	%o3
	tle	%icc,	0x2
	and	%i2,	0x0690,	%i7
	bg	%icc,	loop_2890
	membar	0x54
	nop
	setx loop_2891, %l0, %l1
	jmpl %l1, %g3
	movvs	%xcc,	%l3,	%g4
loop_2890:
	fnor	%f28,	%f24,	%f24
	mulscc	%g6,	%i0,	%g7
loop_2891:
	fmovdne	%icc,	%f10,	%f3
	fmovdcs	%icc,	%f6,	%f8
	smulcc	%l6,	%o4,	%i4
	fmovrsgez	%o7,	%f9,	%f8
	movrgez	%l0,	%o1,	%l5
	movg	%icc,	%o2,	%g1
	tn	%xcc,	0x4
	nop
	set	0x4C, %l1
	lduw	[%l7 + %l1],	%o6
	fmovdn	%xcc,	%f18,	%f9
	fmovsgu	%icc,	%f25,	%f11
	fones	%f21
	smulcc	%l1,	%g2,	%o5
	lduw	[%l7 + 0x44],	%g5
	lduw	[%l7 + 0x3C],	%i5
	movvs	%icc,	%l2,	%i3
	tgu	%icc,	0x2
	popc	0x0325,	%o0
	prefetch	[%l7 + 0x18],	 0x3
	tvs	%icc,	0x5
	smulcc	%i1,	0x18D9,	%i6
	set	0x78, %g6
	lda	[%l7 + %g6] 0x11,	%f8
	andcc	%o3,	%l4,	%i7
	tpos	%xcc,	0x4
	array32	%i2,	%l3,	%g3
	andncc	%g6,	%i0,	%g4
	set	0x0F, %o5
	ldsba	[%l7 + %o5] 0x80,	%g7
	alignaddr	%l6,	%o4,	%i4
	subc	%o7,	%o1,	%l5
	sra	%l0,	%g1,	%o2
	set	0x58, %o4
	stda	%l0,	[%l7 + %o4] 0xe2
	membar	#Sync
	movvs	%icc,	%g2,	%o6
	fmovdne	%icc,	%f22,	%f22
	mulscc	%g5,	%o5,	%i5
	xor	%i3,	0x02DC,	%o0
	movre	%i1,	0x1F2,	%l2
	swap	[%l7 + 0x1C],	%o3
	nop
	setx	loop_2892,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	ta	%icc,	0x0
	edge8	%l4,	%i7,	%i2
	fmovdgu	%xcc,	%f9,	%f10
loop_2892:
	fmovdcs	%icc,	%f25,	%f31
	fmovsgu	%icc,	%f13,	%f6
	fxnors	%f30,	%f28,	%f15
	fmovde	%icc,	%f29,	%f1
	set	0x48, %g2
	lduba	[%l7 + %g2] 0x14,	%l3
	sll	%g3,	0x02,	%i6
	set	0x54, %l6
	lduha	[%l7 + %l6] 0x10,	%i0
	movleu	%xcc,	%g6,	%g4
	brz	%l6,	loop_2893
	array16	%o4,	%i4,	%g7
	add	%o1,	%l5,	%o7
	set	0x0, %i3
	stxa	%l0,	[%g0 + %i3] 0x20
loop_2893:
	fones	%f23
	edge32ln	%o2,	%l1,	%g2
	fsrc1s	%f29,	%f20
	taddcc	%o6,	%g5,	%g1
	swap	[%l7 + 0x54],	%i5
	smulcc	%o5,	0x02A7,	%o0
	alignaddrl	%i1,	%l2,	%i3
	ba,a	loop_2894
	xorcc	%o3,	%l4,	%i2
	call	loop_2895
	taddcctv	%i7,	%l3,	%g3
loop_2894:
	fmovrsgez	%i0,	%f10,	%f12
	orcc	%i6,	%g6,	%l6
loop_2895:
	orn	%g4,	%i4,	%g7
	andncc	%o1,	%l5,	%o4
	tpos	%xcc,	0x4
	sub	%o7,	0x1B72,	%o2
	fmovse	%icc,	%f15,	%f9
	fpadd16s	%f30,	%f18,	%f11
	fmovrdne	%l0,	%f6,	%f10
	edge16ln	%l1,	%o6,	%g5
	srl	%g1,	0x18,	%g2
	tleu	%xcc,	0x7
	tleu	%icc,	0x2
	udiv	%i5,	0x18EB,	%o0
	movg	%icc,	%i1,	%o5
	siam	0x3
	fpsub32s	%f11,	%f9,	%f4
	fblg,a	%fcc1,	loop_2896
	srlx	%l2,	%o3,	%l4
	tge	%xcc,	0x7
	wr	%g0,	0x88,	%asi
	ldsha	[%l7 + 0x30] %asi,	%i3
loop_2896:
	umulcc	%i2,	0x0F71,	%l3
	fmovsn	%icc,	%f12,	%f21
	and	%g3,	0x10A8,	%i0
	array16	%i7,	%g6,	%i6
	orncc	%l6,	%g4,	%i4
	fmovrdgez	%g7,	%f28,	%f12
	movcc	%xcc,	%l5,	%o1
	flush	%l7 + 0x60
	edge8	%o7,	%o4,	%o2
	te	%xcc,	0x2
	movl	%icc,	%l0,	%o6
	edge8	%l1,	%g5,	%g1
	std	%f24,	[%l7 + 0x18]
	brnz	%g2,	loop_2897
	nop
	setx	loop_2898,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	smulcc	%o0,	0x114F,	%i5
	movne	%icc,	%i1,	%l2
loop_2897:
	subcc	%o5,	%o3,	%i3
loop_2898:
	edge32	%i2,	%l4,	%g3
	bneg,a	%icc,	loop_2899
	fors	%f29,	%f31,	%f17
	nop
	setx	loop_2900,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movg	%xcc,	%l3,	%i7
loop_2899:
	fbo,a	%fcc0,	loop_2901
	edge16l	%i0,	%i6,	%l6
loop_2900:
	movle	%xcc,	%g6,	%i4
	edge16ln	%g4,	%l5,	%g7
loop_2901:
	srlx	%o1,	0x0A,	%o4
	edge32l	%o2,	%l0,	%o7
	nop
	setx loop_2902, %l0, %l1
	jmpl %l1, %l1
	addccc	%o6,	0x08C3,	%g1
	fbu,a	%fcc0,	loop_2903
	bvc	%icc,	loop_2904
loop_2902:
	srlx	%g5,	0x1C,	%o0
	flush	%l7 + 0x4C
loop_2903:
	edge32l	%g2,	%i5,	%l2
loop_2904:
	tneg	%xcc,	0x2
	addc	%i1,	0x1224,	%o3
	edge8n	%i3,	%o5,	%l4
	brgez	%g3,	loop_2905
	array16	%i2,	%l3,	%i0
	brgez,a	%i7,	loop_2906
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2905:
	fand	%f20,	%f30,	%f6
	tn	%icc,	0x3
loop_2906:
	brgz	%l6,	loop_2907
	fbn	%fcc0,	loop_2908
	nop
	set	0x0A, %o1
	ldstub	[%l7 + %o1],	%i6
	te	%xcc,	0x0
loop_2907:
	bleu,pn	%xcc,	loop_2909
loop_2908:
	xor	%i4,	0x1A94,	%g6
	add	%l5,	%g4,	%g7
	tneg	%xcc,	0x7
loop_2909:
	movgu	%icc,	%o1,	%o2
	fsrc1s	%f28,	%f26
	movg	%icc,	%o4,	%o7
	umulcc	%l0,	%o6,	%l1
	stbar
	bleu	loop_2910
	addc	%g1,	%o0,	%g2
	sllx	%i5,	%g5,	%i1
	sllx	%o3,	0x00,	%i3
loop_2910:
	fmovdcc	%xcc,	%f11,	%f11
	movrgez	%l2,	%l4,	%o5
	array8	%i2,	%l3,	%i0
	tsubcctv	%g3,	%l6,	%i6
	fbge	%fcc1,	loop_2911
	sdivx	%i7,	0x1624,	%i4
	sth	%g6,	[%l7 + 0x46]
	fmovdg	%xcc,	%f21,	%f20
loop_2911:
	movrgez	%g4,	0x289,	%g7
	movn	%xcc,	%l5,	%o1
	add	%o4,	0x01FC,	%o7
	move	%icc,	%o2,	%o6
	fbuge	%fcc2,	loop_2912
	and	%l0,	0x1EDB,	%l1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tsubcctv	%o0,	%g2,	%i5
loop_2912:
	brlz,a	%g1,	loop_2913
	xnor	%i1,	0x078E,	%o3
	fand	%f12,	%f24,	%f26
	sllx	%g5,	%l2,	%l4
loop_2913:
	nop
	wr	%g0,	0x80,	%asi
	stda	%o4,	[%l7 + 0x30] %asi
	fpsub16	%f0,	%f0,	%f6
	tcc	%xcc,	0x5
	fbne	%fcc2,	loop_2914
	fpsub32	%f22,	%f28,	%f20
	wr	%g0,	0x19,	%asi
	lda	[%l7 + 0x50] %asi,	%f21
loop_2914:
	fbuge,a	%fcc2,	loop_2915
	fmovdg	%xcc,	%f4,	%f14
	stw	%i2,	[%l7 + 0x30]
	move	%icc,	%i3,	%l3
loop_2915:
	nop
	set	0x10, %g7
	ldxa	[%l7 + %g7] 0x10,	%g3
	brgz	%i0,	loop_2916
	taddcc	%i6,	%i7,	%i4
	edge16l	%g6,	%l6,	%g4
	edge32n	%g7,	%l5,	%o4
loop_2916:
	edge32	%o1,	%o7,	%o6
	umul	%o2,	%l1,	%o0
	bgu,pt	%icc,	loop_2917
	nop
	set	0x73, %i1
	ldub	[%l7 + %i1],	%g2
	te	%icc,	0x7
	ta	%xcc,	0x0
loop_2917:
	fcmpgt16	%f18,	%f16,	%l0
	alignaddrl	%g1,	%i5,	%o3
	fcmped	%fcc1,	%f2,	%f22
	move	%xcc,	%i1,	%l2
	add	%l7,	0x60,	%l6
	wr	%g0,	0x19,	%asi
	lda	[%l6] %asi,	%g5
	casa	[%l6] %asi,	%g5,	%l4
	array16	%i2,	%o5,	%i3
	tleu	%icc,	0x2
	nop
	set	0x4F, %l3
	stb	%g3,	[%l7 + %l3]
	tpos	%xcc,	0x6
	andn	%l3,	0x0D7C,	%i0
	fmovdleu	%xcc,	%f10,	%f23
	edge8n	%i6,	%i4,	%g6
	array32	%i7,	%g4,	%g7
	tpos	%xcc,	0x1
	fmovsn	%xcc,	%f13,	%f13
	tcs	%xcc,	0x1
	popc	0x181A,	%l5
	movle	%xcc,	%o4,	%o1
	ldx	[%l7 + 0x70],	%l6
	bcs,pn	%icc,	loop_2918
	tvc	%icc,	0x6
	fmovsne	%icc,	%f5,	%f5
	tcs	%icc,	0x0
loop_2918:
	mulx	%o6,	0x0DC7,	%o7
	movrne	%l1,	%o2,	%o0
	edge16ln	%l0,	%g2,	%i5
	fmovdleu	%icc,	%f4,	%f3
	udiv	%g1,	0x1A1F,	%i1
	ldsw	[%l7 + 0x6C],	%o3
	or	%l2,	%l4,	%g5
	prefetch	[%l7 + 0x70],	 0x2
	tleu	%xcc,	0x6
	tvc	%icc,	0x2
	edge16l	%o5,	%i2,	%g3
	tne	%icc,	0x6
	sll	%l3,	%i0,	%i3
	wr	%g0,	0x80,	%asi
	sta	%f5,	[%l7 + 0x40] %asi
	tn	%xcc,	0x0
	subcc	%i4,	0x0554,	%g6
	ta	%xcc,	0x4
	sub	%i7,	%g4,	%i6
	xorcc	%g7,	0x0548,	%o4
	fornot1s	%f23,	%f18,	%f3
	fsrc2	%f26,	%f4
	lduh	[%l7 + 0x46],	%l5
	tle	%xcc,	0x3
	fmovdcs	%xcc,	%f20,	%f28
	alignaddrl	%o1,	%o6,	%l6
	fmovdpos	%xcc,	%f18,	%f28
	and	%o7,	%o2,	%l1
	movg	%icc,	%l0,	%o0
	edge16l	%i5,	%g1,	%g2
	udivcc	%i1,	0x1EC3,	%o3
	orcc	%l2,	%g5,	%l4
	wr	%g0,	0x10,	%asi
	ldswa	[%l7 + 0x60] %asi,	%i2
	fpadd32s	%f16,	%f14,	%f20
	bpos	loop_2919
	umul	%g3,	%o5,	%i0
	nop
	setx	loop_2920,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	subccc	%i3,	0x1604,	%i4
loop_2919:
	sdivcc	%g6,	0x1FD0,	%l3
	sll	%g4,	0x07,	%i7
loop_2920:
	fmovsle	%xcc,	%f24,	%f14
	orncc	%i6,	%g7,	%o4
	movg	%icc,	%o1,	%l5
	alignaddr	%l6,	%o6,	%o7
	fornot2	%f6,	%f14,	%f12
	movge	%icc,	%l1,	%l0
	ble,pn	%xcc,	loop_2921
	ldsb	[%l7 + 0x09],	%o2
	movrgez	%o0,	%g1,	%i5
	add	%l7,	0x60,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%g2,	%i1
loop_2921:
	tvs	%xcc,	0x3
	bn	loop_2922
	membar	0x5A
	bcc	loop_2923
	tpos	%xcc,	0x1
loop_2922:
	fbul,a	%fcc0,	loop_2924
	movn	%icc,	%l2,	%o3
loop_2923:
	tvc	%icc,	0x0
	fpack16	%f10,	%f20
loop_2924:
	ldd	[%l7 + 0x48],	%g4
	set	0x30, %l0
	stda	%l4,	[%l7 + %l0] 0xe3
	membar	#Sync
	brnz	%i2,	loop_2925
	bvs,a	%xcc,	loop_2926
	subccc	%o5,	0x1697,	%g3
	bn,a,pt	%icc,	loop_2927
loop_2925:
	taddcc	%i0,	%i4,	%i3
loop_2926:
	fzeros	%f25
	ldd	[%l7 + 0x68],	%f2
loop_2927:
	fnor	%f24,	%f18,	%f30
	bge,a	%icc,	loop_2928
	fbue,a	%fcc3,	loop_2929
	fandnot1	%f6,	%f30,	%f20
	tneg	%xcc,	0x1
loop_2928:
	tne	%icc,	0x6
loop_2929:
	fone	%f16
	subcc	%g6,	%l3,	%i7
	movl	%icc,	%g4,	%i6
	fpadd32s	%f11,	%f5,	%f29
	movne	%xcc,	%g7,	%o1
	alignaddr	%o4,	%l5,	%l6
	mova	%icc,	%o7,	%o6
	sir	0x12AE
	movl	%xcc,	%l0,	%l1
	add	%o0,	0x1A2D,	%o2
	addc	%g1,	%g2,	%i5
	srax	%i1,	0x11,	%o3
	ldd	[%l7 + 0x58],	%l2
	taddcc	%g5,	0x1CDF,	%i2
	edge8l	%l4,	%g3,	%o5
	addccc	%i4,	%i0,	%g6
	fmovdne	%xcc,	%f5,	%f2
	fbue,a	%fcc2,	loop_2930
	edge16ln	%l3,	%i3,	%i7
	ldsb	[%l7 + 0x6E],	%i6
	edge8ln	%g4,	%o1,	%g7
loop_2930:
	andcc	%o4,	%l6,	%l5
	bneg	%xcc,	loop_2931
	fnors	%f18,	%f6,	%f28
	and	%o7,	%l0,	%l1
	movge	%icc,	%o0,	%o6
loop_2931:
	fxor	%f6,	%f24,	%f8
	fabsd	%f30,	%f24
	ta	%icc,	0x7
	edge32ln	%g1,	%o2,	%i5
	movrne	%g2,	0x350,	%i1
	bleu,a,pt	%xcc,	loop_2932
	mulx	%l2,	%g5,	%o3
	movn	%xcc,	%i2,	%g3
	stb	%l4,	[%l7 + 0x56]
loop_2932:
	bvc,pt	%xcc,	loop_2933
	fmovdl	%icc,	%f24,	%f31
	te	%icc,	0x2
	movleu	%icc,	%o5,	%i4
loop_2933:
	addccc	%g6,	%l3,	%i3
	bl	%icc,	loop_2934
	fbu,a	%fcc1,	loop_2935
	tpos	%xcc,	0x2
	sethi	0x1621,	%i0
loop_2934:
	fmovdcc	%xcc,	%f22,	%f13
loop_2935:
	fmovda	%xcc,	%f1,	%f17
	tn	%icc,	0x7
	bg	%icc,	loop_2936
	ldd	[%l7 + 0x20],	%f0
	tcs	%xcc,	0x4
	srax	%i7,	0x08,	%i6
loop_2936:
	bl,a,pt	%icc,	loop_2937
	edge8	%g4,	%g7,	%o1
	movvc	%xcc,	%o4,	%l5
	fabsd	%f20,	%f22
loop_2937:
	fcmpes	%fcc1,	%f18,	%f20
	tvc	%xcc,	0x7
	ble,pn	%icc,	loop_2938
	edge8	%o7,	%l6,	%l1
	fnot1s	%f31,	%f3
	and	%o0,	%l0,	%o6
loop_2938:
	movrlez	%g1,	0x169,	%i5
	edge16l	%g2,	%i1,	%o2
	tg	%xcc,	0x2
	bvs	%icc,	loop_2939
	udivx	%g5,	0x07A4,	%l2
	movleu	%xcc,	%i2,	%o3
	fmovsge	%xcc,	%f28,	%f29
loop_2939:
	umul	%g3,	%l4,	%o5
	movge	%xcc,	%i4,	%g6
	movcs	%icc,	%i3,	%l3
	fnot1	%f4,	%f26
	fmovdvc	%xcc,	%f12,	%f2
	fmovsvs	%icc,	%f23,	%f16
	andncc	%i7,	%i0,	%i6
	mulscc	%g7,	0x0D27,	%o1
	fmovdvs	%icc,	%f21,	%f6
	tge	%icc,	0x3
	brgez,a	%g4,	loop_2940
	andn	%o4,	%l5,	%l6
	fmovsge	%xcc,	%f30,	%f24
	fmul8ulx16	%f28,	%f14,	%f18
loop_2940:
	nop
	set	0x40, %i2
	stxa	%l1,	[%l7 + %i2] 0x80
	movrgez	%o7,	%o0,	%l0
	bpos,pn	%icc,	loop_2941
	movl	%xcc,	%g1,	%i5
	lduw	[%l7 + 0x38],	%g2
	tcs	%xcc,	0x7
loop_2941:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mulx	%o6,	%i1,	%o2
	st	%f19,	[%l7 + 0x64]
	brz,a	%g5,	loop_2942
	ba,pt	%xcc,	loop_2943
	fmovsn	%icc,	%f22,	%f24
	bvc	%xcc,	loop_2944
loop_2942:
	bg,a	%xcc,	loop_2945
loop_2943:
	taddcc	%i2,	0x1F68,	%o3
	edge32	%g3,	%l2,	%o5
loop_2944:
	taddcctv	%i4,	0x02DD,	%g6
loop_2945:
	mova	%xcc,	%l4,	%i3
	bleu,a	%xcc,	loop_2946
	ldx	[%l7 + 0x18],	%i7
	fcmpgt16	%f4,	%f24,	%l3
	brlz,a	%i0,	loop_2947
loop_2946:
	fbge,a	%fcc0,	loop_2948
	fmovde	%icc,	%f15,	%f30
	ldsb	[%l7 + 0x50],	%i6
loop_2947:
	edge8l	%o1,	%g4,	%g7
loop_2948:
	orn	%o4,	%l5,	%l6
	and	%o7,	%l1,	%l0
	udivcc	%g1,	0x12CE,	%i5
	edge8	%g2,	%o6,	%i1
	nop
	set	0x28, %g4
	ldsw	[%l7 + %g4],	%o0
	addcc	%g5,	0x1DCF,	%i2
	fmovrsne	%o3,	%f0,	%f6
	set	0x7E, %l2
	ldsha	[%l7 + %l2] 0x80,	%g3
	bge,a	loop_2949
	sll	%o2,	0x17,	%o5
	pdist	%f10,	%f20,	%f18
	movn	%xcc,	%i4,	%g6
loop_2949:
	orcc	%l4,	%l2,	%i3
	movneg	%xcc,	%l3,	%i7
	nop
	setx	loop_2950,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	andcc	%i6,	0x0DD1,	%i0
	brnz,a	%o1,	loop_2951
	movrlz	%g7,	0x00F,	%o4
loop_2950:
	ldub	[%l7 + 0x61],	%l5
	and	%g4,	%o7,	%l1
loop_2951:
	movge	%xcc,	%l0,	%g1
	fzero	%f30
	udivcc	%i5,	0x02D3,	%l6
	fmovsgu	%xcc,	%f3,	%f15
	fbug,a	%fcc2,	loop_2952
	bg	loop_2953
	fmovs	%f11,	%f21
	andcc	%o6,	0x1AD0,	%i1
loop_2952:
	tleu	%xcc,	0x1
loop_2953:
	fmovrsne	%o0,	%f31,	%f28
	fpsub16	%f8,	%f14,	%f6
	addcc	%g5,	0x06C2,	%g2
	movneg	%icc,	%o3,	%i2
	siam	0x4
	fbg	%fcc2,	loop_2954
	bl,a,pt	%icc,	loop_2955
	fmovdne	%icc,	%f28,	%f22
	alignaddrl	%g3,	%o5,	%i4
loop_2954:
	fmovdne	%xcc,	%f25,	%f7
loop_2955:
	tn	%icc,	0x3
	fmuld8ulx16	%f19,	%f1,	%f28
	stx	%g6,	[%l7 + 0x30]
	sdiv	%o2,	0x1772,	%l4
	mulscc	%i3,	%l3,	%l2
	fmovsvc	%icc,	%f14,	%f19
	ba	%icc,	loop_2956
	andcc	%i6,	%i7,	%o1
	udiv	%i0,	0x0386,	%g7
	alignaddr	%o4,	%g4,	%o7
loop_2956:
	movge	%xcc,	%l1,	%l0
	mulscc	%g1,	0x138C,	%i5
	te	%xcc,	0x0
	udiv	%l5,	0x044D,	%o6
	fnegs	%f25,	%f22
	umulcc	%i1,	%o0,	%g5
	bvc,a,pt	%icc,	loop_2957
	bge,pt	%xcc,	loop_2958
	sethi	0x0B45,	%g2
	fbule,a	%fcc0,	loop_2959
loop_2957:
	xnor	%l6,	0x18A0,	%i2
loop_2958:
	movrgez	%g3,	%o3,	%o5
	fabss	%f22,	%f14
loop_2959:
	fble	%fcc3,	loop_2960
	membar	0x34
	srl	%i4,	0x17,	%o2
	movrlz	%g6,	0x11C,	%i3
loop_2960:
	brlz	%l3,	loop_2961
	fzero	%f18
	tcs	%icc,	0x5
	xnorcc	%l2,	0x0B5B,	%i6
loop_2961:
	edge8n	%l4,	%i7,	%o1
	fmovrsgz	%i0,	%f27,	%f24
	stx	%o4,	[%l7 + 0x08]
	fmovdl	%icc,	%f25,	%f30
	fsrc1	%f12,	%f20
	wr	%g0,	0xeb,	%asi
	stha	%g4,	[%l7 + 0x20] %asi
	membar	#Sync
	fmovrdgz	%o7,	%f28,	%f24
	tvs	%icc,	0x6
	smulcc	%l1,	0x1FCE,	%g7
	andncc	%g1,	%i5,	%l0
	edge32l	%o6,	%i1,	%l5
	edge16	%o0,	%g2,	%g5
	lduw	[%l7 + 0x10],	%l6
	stbar
	tne	%icc,	0x1
	te	%xcc,	0x4
	movrgez	%g3,	%i2,	%o5
	edge16l	%i4,	%o3,	%o2
	or	%g6,	%i3,	%l2
	brlez,a	%l3,	loop_2962
	fcmpd	%fcc1,	%f30,	%f12
	edge8ln	%l4,	%i7,	%o1
	array32	%i0,	%o4,	%g4
loop_2962:
	fbul	%fcc2,	loop_2963
	fnand	%f2,	%f6,	%f0
	fmovdg	%icc,	%f3,	%f0
	tsubcc	%i6,	0x1BA3,	%l1
loop_2963:
	orcc	%o7,	%g1,	%g7
	srl	%i5,	0x19,	%o6
	bn,pt	%icc,	loop_2964
	prefetch	[%l7 + 0x3C],	 0x3
	edge32l	%i1,	%l5,	%l0
	tle	%icc,	0x5
loop_2964:
	movcc	%icc,	%g2,	%g5
	ldx	[%l7 + 0x30],	%o0
	movgu	%xcc,	%g3,	%i2
	xor	%o5,	0x118E,	%l6
	sir	0x0B88
	edge8	%o3,	%i4,	%g6
	mulscc	%i3,	%l2,	%o2
	membar	0x4B
	fones	%f21
	fbn,a	%fcc0,	loop_2965
	stb	%l3,	[%l7 + 0x08]
	tvs	%icc,	0x5
	movvc	%xcc,	%l4,	%o1
loop_2965:
	bneg,a,pn	%icc,	loop_2966
	bcs,a	%icc,	loop_2967
	tleu	%xcc,	0x3
	alignaddr	%i0,	%i7,	%o4
loop_2966:
	ba,pn	%icc,	loop_2968
loop_2967:
	fpack32	%f28,	%f4,	%f6
	tleu	%xcc,	0x1
	fmul8sux16	%f20,	%f2,	%f24
loop_2968:
	nop
	wr	%g0,	0x88,	%asi
	ldda	[%l7 + 0x10] %asi,	%g4
	movleu	%xcc,	%l1,	%i6
	movpos	%xcc,	%o7,	%g1
	tle	%icc,	0x0
	fsrc1	%f18,	%f0
	set	0x60, %o3
	prefetcha	[%l7 + %o3] 0x10,	 0x0
	orcc	%i5,	%i1,	%o6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovspos	%icc,	%f25,	%f0
	fbge	%fcc0,	loop_2969
	xorcc	%l5,	%g2,	%l0
	movrlez	%g5,	0x1B4,	%g3
	fxnors	%f22,	%f26,	%f27
loop_2969:
	fxor	%f16,	%f20,	%f10
	edge32ln	%i2,	%o0,	%l6
	edge32	%o5,	%i4,	%o3
	bcc,a,pt	%icc,	loop_2970
	movl	%xcc,	%g6,	%i3
	fbg,a	%fcc1,	loop_2971
	edge32n	%l2,	%o2,	%l4
loop_2970:
	subcc	%l3,	0x0D94,	%o1
	movrlez	%i0,	0x3EE,	%o4
loop_2971:
	edge16l	%g4,	%l1,	%i7
	orcc	%i6,	%g1,	%g7
	movg	%icc,	%o7,	%i1
	fxnors	%f0,	%f30,	%f7
	bl,pt	%icc,	loop_2972
	tle	%xcc,	0x6
	set	0x2C, %i0
	swapa	[%l7 + %i0] 0x19,	%o6
loop_2972:
	membar	0x2B
	xorcc	%i5,	0x12BD,	%g2
	fmovsvc	%icc,	%f2,	%f2
	edge8n	%l0,	%l5,	%g5
	fsrc1	%f10,	%f30
	bcc,pn	%icc,	loop_2973
	tpos	%xcc,	0x3
	array8	%i2,	%g3,	%l6
	tvc	%xcc,	0x7
loop_2973:
	subc	%o0,	0x1CD3,	%i4
	tpos	%xcc,	0x0
	or	%o3,	%g6,	%i3
	movcc	%icc,	%o5,	%l2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tgu	%icc,	0x6
	st	%f25,	[%l7 + 0x1C]
	ba	loop_2974
	fbn,a	%fcc0,	loop_2975
	fbo,a	%fcc0,	loop_2976
	fmovdleu	%icc,	%f21,	%f29
loop_2974:
	fba,a	%fcc3,	loop_2977
loop_2975:
	sdivcc	%l4,	0x0A88,	%o2
loop_2976:
	sdivx	%o1,	0x0715,	%i0
	fones	%f17
loop_2977:
	sub	%l3,	%g4,	%l1
	umulcc	%i7,	%i6,	%g1
	st	%f31,	[%l7 + 0x50]
	subc	%g7,	0x03D8,	%o4
	srlx	%o7,	%o6,	%i1
	subcc	%g2,	%l0,	%l5
	mulx	%g5,	%i5,	%g3
	nop
	set	0x25, %o2
	ldstub	[%l7 + %o2],	%i2
	fsrc1	%f16,	%f12
	edge16n	%l6,	%i4,	%o3
	te	%icc,	0x3
	movre	%g6,	0x3FF,	%i3
	tge	%xcc,	0x1
	tcs	%icc,	0x3
	movrne	%o0,	0x1E8,	%l2
	movleu	%xcc,	%o5,	%l4
	xor	%o2,	0x1316,	%i0
	ble	loop_2978
	std	%o0,	[%l7 + 0x10]
	fbu,a	%fcc1,	loop_2979
	fnor	%f6,	%f4,	%f18
loop_2978:
	fnot2s	%f22,	%f13
	movrgez	%g4,	0x0E2,	%l1
loop_2979:
	nop
	setx loop_2980, %l0, %l1
	jmpl %l1, %i7
	pdist	%f18,	%f8,	%f6
	sub	%i6,	0x0F28,	%g1
	addcc	%l3,	%o4,	%o7
loop_2980:
	xnorcc	%o6,	0x02E6,	%g7
	edge16l	%i1,	%g2,	%l5
	fpadd16s	%f28,	%f15,	%f16
	fabsd	%f18,	%f18
	tpos	%icc,	0x2
	movrne	%g5,	%l0,	%i5
	tgu	%xcc,	0x7
	fone	%f6
	tcs	%icc,	0x7
	edge16n	%i2,	%g3,	%l6
	fones	%f22
	bn,a,pt	%icc,	loop_2981
	bg,a	loop_2982
	fnot1	%f2,	%f26
	brlez,a	%i4,	loop_2983
loop_2981:
	edge32	%g6,	%i3,	%o3
loop_2982:
	edge8l	%o0,	%l2,	%o5
	swap	[%l7 + 0x64],	%l4
loop_2983:
	fors	%f30,	%f3,	%f15
	tle	%xcc,	0x0
	fornot2	%f16,	%f10,	%f30
	fpsub16	%f14,	%f20,	%f6
	edge32l	%i0,	%o1,	%g4
	edge32	%l1,	%o2,	%i6
	ta	%icc,	0x4
	fmovda	%icc,	%f30,	%f14
	tgu	%icc,	0x3
	fpsub16s	%f28,	%f21,	%f16
	movle	%xcc,	%i7,	%l3
	fpadd32s	%f2,	%f2,	%f18
	addcc	%o4,	%o7,	%o6
	edge8	%g7,	%i1,	%g2
	movre	%l5,	0x0B2,	%g5
	subcc	%l0,	%g1,	%i2
	edge16l	%g3,	%l6,	%i4
	wr	%g0,	0xe3,	%asi
	stwa	%g6,	[%l7 + 0x1C] %asi
	membar	#Sync
	flush	%l7 + 0x68
	fbe	%fcc1,	loop_2984
	fmul8sux16	%f26,	%f26,	%f20
	tl	%icc,	0x7
	brz	%i5,	loop_2985
loop_2984:
	fpadd32s	%f23,	%f20,	%f2
	movrgz	%o3,	0x1E6,	%i3
	movleu	%icc,	%l2,	%o5
loop_2985:
	udiv	%o0,	0x0CF7,	%l4
	ldd	[%l7 + 0x20],	%o0
	fpsub16	%f30,	%f0,	%f28
	set	0x50, %i6
	swapa	[%l7 + %i6] 0x89,	%g4
	movne	%icc,	%l1,	%o2
	nop
	setx	loop_2986,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fbe	%fcc3,	loop_2987
	sllx	%i6,	%i7,	%i0
	fexpand	%f5,	%f26
loop_2986:
	movrlz	%l3,	%o4,	%o7
loop_2987:
	movrgez	%o6,	0x05D,	%g7
	bn,pn	%xcc,	loop_2988
	taddcctv	%i1,	0x06D4,	%l5
	stbar
	sdivcc	%g5,	0x1D83,	%g2
loop_2988:
	tsubcctv	%g1,	%i2,	%l0
	taddcc	%g3,	0x0CE0,	%l6
	sethi	0x1CA8,	%g6
	movg	%icc,	%i4,	%i5
	tle	%icc,	0x6
	edge8	%o3,	%l2,	%o5
	ldsh	[%l7 + 0x30],	%i3
	fbu,a	%fcc2,	loop_2989
	orncc	%o0,	%o1,	%l4
	set	0x40, %g1
	lda	[%l7 + %g1] 0x89,	%f24
loop_2989:
	nop
	membar	#Sync
	set	0x40, %g3
	ldda	[%l7 + %g3] 0xf0,	%f16
	ta	%xcc,	0x4
	tne	%xcc,	0x6
	array8	%l1,	%g4,	%i6
	edge32n	%o2,	%i7,	%i0
	fexpand	%f18,	%f28
	fnors	%f22,	%f18,	%f15
	ldsb	[%l7 + 0x4C],	%o4
	edge16n	%o7,	%l3,	%g7
	tvs	%icc,	0x1
	fxor	%f30,	%f10,	%f28
	srl	%o6,	0x09,	%i1
	tsubcctv	%l5,	%g2,	%g5
	array32	%g1,	%l0,	%g3
	fbl	%fcc2,	loop_2990
	tpos	%xcc,	0x1
	sdivx	%l6,	0x0440,	%i2
	movvs	%icc,	%g6,	%i4
loop_2990:
	movrne	%i5,	%l2,	%o5
	addccc	%o3,	0x1004,	%o0
	udivx	%i3,	0x12E3,	%o1
	movpos	%icc,	%l1,	%g4
	orcc	%i6,	%o2,	%i7
	alignaddrl	%i0,	%l4,	%o7
	movn	%xcc,	%o4,	%g7
	fones	%f16
	umul	%o6,	%i1,	%l5
	set	0x1A, %o6
	lduba	[%l7 + %o6] 0x19,	%l3
	tvc	%icc,	0x1
	tpos	%icc,	0x3
	mulscc	%g2,	%g1,	%g5
	subc	%l0,	%l6,	%i2
	bpos,a	%icc,	loop_2991
	fmovdle	%xcc,	%f29,	%f4
	brlz	%g3,	loop_2992
	umul	%i4,	%g6,	%i5
loop_2991:
	fbul,a	%fcc3,	loop_2993
	move	%icc,	%o5,	%l2
loop_2992:
	prefetch	[%l7 + 0x4C],	 0x3
	set	0x24, %l4
	lda	[%l7 + %l4] 0x18,	%f4
loop_2993:
	fpadd16	%f6,	%f2,	%f8
	tvs	%xcc,	0x1
	move	%icc,	%o0,	%o3
	fmovdleu	%icc,	%f30,	%f23
	bgu,pn	%icc,	loop_2994
	tg	%xcc,	0x4
	subcc	%o1,	0x0A82,	%l1
	tl	%xcc,	0x2
loop_2994:
	fblg,a	%fcc0,	loop_2995
	movcs	%icc,	%i3,	%g4
	movrlz	%o2,	%i6,	%i7
	fcmpeq16	%f4,	%f26,	%i0
loop_2995:
	fmovdvc	%icc,	%f9,	%f6
	wr	%g0,	0x18,	%asi
	prefetcha	[%l7 + 0x78] %asi,	 0x1
	tge	%xcc,	0x7
	movrne	%l4,	0x21F,	%g7
	movre	%o4,	0x1A2,	%o6
	flush	%l7 + 0x34
	bge	loop_2996
	andcc	%l5,	0x0419,	%l3
	fsrc1	%f28,	%f0
	tpos	%xcc,	0x5
loop_2996:
	bvs,a,pt	%icc,	loop_2997
	nop
	setx	loop_2998,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	ble	%icc,	loop_2999
	ldsb	[%l7 + 0x5D],	%g2
loop_2997:
	movl	%icc,	%i1,	%g5
loop_2998:
	sll	%g1,	0x03,	%l0
loop_2999:
	brnz	%i2,	loop_3000
	fxor	%f24,	%f0,	%f12
	fsrc1s	%f3,	%f7
	popc	%l6,	%g3
loop_3000:
	nop
	wr	%g0,	0x11,	%asi
	ldda	[%l7 + 0x40] %asi,	%i4
	movrlez	%g6,	%i5,	%l2
	bshuffle	%f4,	%f10,	%f22
	array32	%o5,	%o3,	%o1
	sdivx	%l1,	0x0523,	%o0
	alignaddr	%g4,	%o2,	%i6
	fmovrdlz	%i3,	%f30,	%f2
	tsubcc	%i0,	0x0C5F,	%o7
	bneg,a,pt	%icc,	loop_3001
	sll	%i7,	%g7,	%o4
	add	%l7,	0x50,	%l6
	wr	%g0,	0x10,	%asi
	ldxa	[%l6] %asi,	%o6
	casxa	[%l6] %asi,	%o6,	%l4
loop_3001:
	sllx	%l3,	%g2,	%l5
	movcs	%icc,	%g5,	%g1
	fmovsl	%xcc,	%f28,	%f12
	ldsw	[%l7 + 0x24],	%l0
	fmuld8sux16	%f16,	%f15,	%f2
	membar	0x7A
	tle	%icc,	0x2
	tn	%icc,	0x1
	wr	%g0,	0x88,	%asi
	prefetcha	[%l7 + 0x60] %asi,	 0x2
	tsubcctv	%l6,	%g3,	%i1
	udivx	%i4,	0x09CC,	%i5
	fornot2	%f30,	%f4,	%f18
	brz	%l2,	loop_3002
	tsubcc	%o5,	0x1B0D,	%o3
	fmovs	%f18,	%f18
	fmovdge	%xcc,	%f31,	%f21
loop_3002:
	andcc	%o1,	0x0D9E,	%l1
	sth	%g6,	[%l7 + 0x08]
	orcc	%g4,	0x0940,	%o0
	fmovrdlez	%i6,	%f28,	%f28
	fpsub32s	%f9,	%f17,	%f11
	fmovrdlez	%i3,	%f30,	%f22
	wr	%g0,	0x81,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	taddcctv	%o2,	%o7,	%i7
	swap	[%l7 + 0x18],	%i0
	smulcc	%o4,	%g7,	%o6
	tl	%xcc,	0x6
	movneg	%xcc,	%l3,	%l4
	fbule	%fcc0,	loop_3003
	fcmps	%fcc2,	%f30,	%f25
	fxors	%f24,	%f14,	%f8
	movrgez	%g2,	%g5,	%g1
loop_3003:
	movvs	%icc,	%l5,	%l0
	add	%i2,	%g3,	%l6
	fornot1s	%f15,	%f7,	%f2
	array16	%i1,	%i4,	%i5
	edge32ln	%l2,	%o5,	%o3
	nop
	set	0x30, %l5
	std	%l0,	[%l7 + %l5]
	edge16ln	%o1,	%g4,	%g6
	movneg	%xcc,	%o0,	%i6
	movl	%icc,	%i3,	%o2
	std	%o6,	[%l7 + 0x38]
	fmovdle	%xcc,	%f18,	%f9
	set	0x40, %i7
	stda	%f0,	[%l7 + %i7] 0xf9
	membar	#Sync
	add	%i7,	%i0,	%o4
	nop
	setx	loop_3004,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movle	%xcc,	%o6,	%l3
	set	0x70, %o7
	sta	%f4,	[%l7 + %o7] 0x81
loop_3004:
	nop
	wr	%g0,	0x89,	%asi
	ldsha	[%l7 + 0x66] %asi,	%l4
	addcc	%g2,	0x18FA,	%g5
	andncc	%g1,	%g7,	%l5
	movne	%xcc,	%l0,	%g3
	nop
	set	0x7E, %i5
	ldstub	[%l7 + %i5],	%i2
	fba,a	%fcc1,	loop_3005
	umulcc	%l6,	%i1,	%i4
	nop
	setx	loop_3006,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fbo,a	%fcc2,	loop_3007
loop_3005:
	edge32n	%i5,	%l2,	%o5
	andcc	%o3,	%o1,	%g4
loop_3006:
	fmovdge	%xcc,	%f3,	%f29
loop_3007:
	fmovdvs	%xcc,	%f14,	%f2
	array8	%l1,	%g6,	%o0
	movpos	%icc,	%i6,	%i3
	edge16	%o2,	%o7,	%i7
	set	0x34, %g5
	stba	%o4,	[%l7 + %g5] 0x88
	movcc	%icc,	%o6,	%i0
	srl	%l3,	0x00,	%g2
	fmovrdlez	%l4,	%f8,	%f6
	edge8n	%g5,	%g7,	%g1
	bn,a	%icc,	loop_3008
	bne	loop_3009
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsne	%xcc,	%f5,	%f28
loop_3008:
	tvc	%icc,	0x7
loop_3009:
	fpsub32s	%f23,	%f6,	%f14
	orncc	%l0,	%l5,	%g3
	edge8ln	%l6,	%i1,	%i4
	xorcc	%i5,	%i2,	%o5
	bne	loop_3010
	fmul8x16	%f1,	%f24,	%f6
	xnor	%l2,	%o1,	%o3
	fmovsvc	%xcc,	%f13,	%f16
loop_3010:
	movneg	%icc,	%g4,	%g6
	subc	%l1,	%o0,	%i3
	tgu	%icc,	0x0
	sll	%o2,	%i6,	%o7
	set	0x78, %o0
	stda	%i6,	[%l7 + %o0] 0x2b
	membar	#Sync
	xnorcc	%o6,	0x1346,	%i0
	tle	%icc,	0x5
	fmovdleu	%xcc,	%f7,	%f9
	alignaddrl	%l3,	%o4,	%l4
	fabsd	%f12,	%f10
	fcmpd	%fcc2,	%f24,	%f12
	fbne,a	%fcc1,	loop_3011
	fmovdvs	%xcc,	%f19,	%f3
	edge16ln	%g2,	%g5,	%g1
	mulscc	%l0,	%l5,	%g7
loop_3011:
	edge16l	%g3,	%i1,	%i4
	tcc	%icc,	0x7
	fmovsneg	%xcc,	%f4,	%f14
	fmovs	%f28,	%f29
	set	0x70, %l1
	prefetcha	[%l7 + %l1] 0x04,	 0x2
	fsrc2	%f2,	%f16
	stb	%i2,	[%l7 + 0x77]
	fbn,a	%fcc1,	loop_3012
	udivx	%i5,	0x1500,	%o5
	movrgez	%o1,	0x2A7,	%l2
	tneg	%xcc,	0x6
loop_3012:
	movl	%icc,	%o3,	%g4
	edge8ln	%g6,	%l1,	%i3
	bg	loop_3013
	edge8l	%o0,	%i6,	%o7
	fmovdle	%icc,	%f1,	%f4
	udiv	%o2,	0x0968,	%i7
loop_3013:
	ldub	[%l7 + 0x6E],	%i0
	or	%o6,	%l3,	%o4
	subc	%g2,	0x0BCC,	%l4
	wr	%g0,	0x22,	%asi
	stha	%g1,	[%l7 + 0x32] %asi
	membar	#Sync
	membar	0x1B
	ta	%xcc,	0x2
	fands	%f12,	%f13,	%f30
	brgez	%l0,	loop_3014
	bge,pn	%xcc,	loop_3015
	umul	%l5,	%g5,	%g3
	movrgz	%g7,	%i1,	%i4
loop_3014:
	nop
	set	0x40, %g6
	swapa	[%l7 + %g6] 0x89,	%i2
loop_3015:
	edge8n	%l6,	%i5,	%o5
	movpos	%icc,	%l2,	%o1
	orncc	%g4,	0x11BC,	%o3
	fbe	%fcc0,	loop_3016
	edge16ln	%g6,	%i3,	%o0
	bpos	loop_3017
	fbge	%fcc1,	loop_3018
loop_3016:
	ba,a,pt	%xcc,	loop_3019
	umul	%l1,	0x1252,	%i6
loop_3017:
	orcc	%o7,	0x062A,	%o2
loop_3018:
	fmovsvc	%xcc,	%f31,	%f19
loop_3019:
	fbo	%fcc0,	loop_3020
	movrne	%i7,	%i0,	%l3
	fmovde	%icc,	%f20,	%f11
	fxnor	%f4,	%f22,	%f24
loop_3020:
	ldd	[%l7 + 0x10],	%f18
	brz,a	%o6,	loop_3021
	movrne	%g2,	%l4,	%o4
	ldsb	[%l7 + 0x44],	%l0
	fbul,a	%fcc1,	loop_3022
loop_3021:
	fmovrsgez	%g1,	%f9,	%f15
	fbn,a	%fcc1,	loop_3023
	mova	%xcc,	%g5,	%g3
loop_3022:
	array32	%l5,	%i1,	%g7
	fsrc1	%f4,	%f4
loop_3023:
	tg	%icc,	0x4
	fmovscc	%xcc,	%f11,	%f19
	edge16	%i2,	%l6,	%i4
	ba	%icc,	loop_3024
	edge16n	%i5,	%o5,	%l2
	edge8l	%o1,	%g4,	%o3
	fbg	%fcc1,	loop_3025
loop_3024:
	andncc	%i3,	%g6,	%l1
	flush	%l7 + 0x68
	bvs	%icc,	loop_3026
loop_3025:
	movg	%icc,	%i6,	%o7
	brgez,a	%o0,	loop_3027
	faligndata	%f28,	%f20,	%f28
loop_3026:
	movre	%i7,	%i0,	%o2
	brlz	%o6,	loop_3028
loop_3027:
	orncc	%g2,	%l3,	%l4
	set	0x30, %o5
	stha	%o4,	[%l7 + %o5] 0x2f
	membar	#Sync
loop_3028:
	nop
	set	0x75, %o4
	ldsba	[%l7 + %o4] 0x18,	%l0
	movg	%xcc,	%g5,	%g1
	ldx	[%l7 + 0x48],	%g3
	brlz,a	%l5,	loop_3029
	edge32ln	%i1,	%g7,	%i2
	tge	%icc,	0x1
	edge16n	%l6,	%i5,	%o5
loop_3029:
	fmul8x16au	%f22,	%f0,	%f20
	edge16	%i4,	%l2,	%o1
	addccc	%g4,	0x0D4A,	%o3
	fnot2s	%f18,	%f8
	array32	%i3,	%g6,	%i6
	tcc	%icc,	0x0
	fsrc1	%f12,	%f20
	sdiv	%l1,	0x18ED,	%o0
	xor	%i7,	%i0,	%o7
	mulx	%o6,	%g2,	%l3
	fand	%f10,	%f26,	%f10
	fmovsge	%icc,	%f30,	%f18
	or	%l4,	%o2,	%l0
	ldsb	[%l7 + 0x51],	%g5
	std	%f30,	[%l7 + 0x48]
	or	%g1,	%g3,	%l5
	movle	%icc,	%i1,	%o4
	fzero	%f22
	edge16	%g7,	%i2,	%l6
	fcmpne16	%f22,	%f12,	%i5
	addc	%o5,	%l2,	%o1
	set	0x60, %i4
	ldxa	[%l7 + %i4] 0x18,	%g4
	edge32n	%i4,	%i3,	%o3
	edge32	%g6,	%i6,	%o0
	fcmpeq32	%f0,	%f18,	%i7
	bneg,a	loop_3030
	udiv	%l1,	0x154A,	%o7
	ldstub	[%l7 + 0x2D],	%i0
	fcmps	%fcc1,	%f12,	%f25
loop_3030:
	movl	%icc,	%g2,	%l3
	sdivcc	%o6,	0x0054,	%o2
	te	%icc,	0x3
	brlz	%l0,	loop_3031
	umulcc	%l4,	%g1,	%g3
	fmovdl	%xcc,	%f10,	%f15
	addcc	%l5,	0x01D7,	%g5
loop_3031:
	fble,a	%fcc0,	loop_3032
	fcmpne16	%f2,	%f24,	%i1
	set	0x48, %l6
	prefetcha	[%l7 + %l6] 0x89,	 0x0
loop_3032:
	fmovrdlez	%o4,	%f14,	%f28
	fbn	%fcc3,	loop_3033
	subc	%i2,	%i5,	%l6
	addc	%o5,	0x0269,	%o1
	srax	%g4,	%i4,	%i3
loop_3033:
	fcmps	%fcc3,	%f1,	%f4
	sth	%o3,	[%l7 + 0x7C]
	alignaddr	%g6,	%l2,	%o0
	movle	%icc,	%i6,	%i7
	movvs	%xcc,	%l1,	%i0
	movrlez	%g2,	0x32C,	%o7
	tne	%xcc,	0x1
	tl	%xcc,	0x3
	be,pn	%xcc,	loop_3034
	tge	%xcc,	0x7
	tcs	%xcc,	0x4
	mova	%icc,	%l3,	%o2
loop_3034:
	movgu	%xcc,	%o6,	%l4
	movgu	%xcc,	%l0,	%g3
	mulx	%g1,	0x1D9E,	%l5
	bneg	%icc,	loop_3035
	movrlz	%g5,	%i1,	%o4
	smulcc	%i2,	0x03A3,	%i5
	prefetch	[%l7 + 0x08],	 0x3
loop_3035:
	nop
	add	%l7,	0x78,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%g7
	casa	[%l6] 0x89,	%g7,	%l6
	sllx	%o5,	0x04,	%g4
	stx	%i4,	[%l7 + 0x38]
	movvc	%icc,	%o1,	%i3
	fmovrdne	%o3,	%f28,	%f2
	edge32	%l2,	%o0,	%g6
	fmovrdne	%i7,	%f26,	%f18
	udivcc	%i6,	0x06A2,	%l1
	fsrc1	%f14,	%f2
	bl,pn	%icc,	loop_3036
	movrlez	%g2,	0x29B,	%i0
	fmul8x16al	%f17,	%f22,	%f20
	fmovrsne	%o7,	%f9,	%f5
loop_3036:
	nop
	set	0x30, %i3
	ldsha	[%l7 + %i3] 0x89,	%o2
	sll	%o6,	0x0F,	%l3
	movcc	%icc,	%l0,	%g3
	set	0x64, %g2
	lduwa	[%l7 + %g2] 0x18,	%g1
	movrgz	%l5,	%l4,	%i1
	edge32n	%g5,	%i2,	%i5
	movrgez	%g7,	%l6,	%o4
	fmovdge	%xcc,	%f30,	%f21
	fmovsn	%xcc,	%f20,	%f0
	tl	%icc,	0x1
	bg	loop_3037
	move	%xcc,	%o5,	%i4
	taddcctv	%g4,	%i3,	%o3
	popc	%l2,	%o1
loop_3037:
	fnor	%f6,	%f2,	%f20
	sth	%g6,	[%l7 + 0x1C]
	tn	%xcc,	0x6
	movrlz	%i7,	0x3AD,	%o0
	set	0x0C, %g7
	stha	%l1,	[%l7 + %g7] 0x81
	bl,pn	%xcc,	loop_3038
	ldsb	[%l7 + 0x7B],	%i6
	movne	%icc,	%g2,	%o7
	array16	%o2,	%i0,	%l3
loop_3038:
	fpadd32	%f22,	%f18,	%f6
	movvs	%icc,	%l0,	%g3
	bneg,a,pt	%icc,	loop_3039
	edge32	%g1,	%o6,	%l4
	fpack16	%f24,	%f1
	ldd	[%l7 + 0x48],	%f4
loop_3039:
	nop
	set	0x28, %o1
	ldsba	[%l7 + %o1] 0x80,	%i1
	fmul8x16	%f12,	%f2,	%f26
	fcmple32	%f0,	%f12,	%g5
	tsubcctv	%l5,	0x037C,	%i5
	sir	0x13D6
	edge16	%g7,	%i2,	%o4
	tvc	%xcc,	0x4
	movpos	%xcc,	%l6,	%o5
	lduw	[%l7 + 0x5C],	%g4
	ldstub	[%l7 + 0x59],	%i4
	tg	%icc,	0x5
	wr	%g0,	0x10,	%asi
	stwa	%i3,	[%l7 + 0x7C] %asi
	edge8ln	%o3,	%o1,	%g6
	orncc	%l2,	0x151B,	%o0
	wr	%g0,	0x89,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	tl	%xcc,	0x7
	smul	%l1,	0x164B,	%i7
	subccc	%g2,	%o7,	%i6
	move	%xcc,	%o2,	%l3
	sdiv	%i0,	0x1624,	%l0
	movrlez	%g3,	0x28B,	%g1
	tleu	%icc,	0x1
	array16	%o6,	%l4,	%i1
	prefetch	[%l7 + 0x20],	 0x2
	brgz	%g5,	loop_3040
	edge32n	%i5,	%g7,	%l5
	fmovsa	%xcc,	%f10,	%f6
	edge16n	%i2,	%l6,	%o4
loop_3040:
	tvc	%icc,	0x2
	set	0x5E, %i1
	ldstuba	[%l7 + %i1] 0x89,	%o5
	alignaddrl	%i4,	%i3,	%g4
	be,a,pt	%xcc,	loop_3041
	movrne	%o3,	0x10C,	%o1
	edge32	%l2,	%o0,	%l1
	fnot2	%f6,	%f24
loop_3041:
	movvc	%icc,	%g6,	%g2
	edge16n	%i7,	%i6,	%o7
	sra	%l3,	%i0,	%o2
	bn,pn	%icc,	loop_3042
	fmovdge	%icc,	%f30,	%f13
	tpos	%icc,	0x3
	sra	%g3,	0x11,	%l0
loop_3042:
	alignaddrl	%g1,	%l4,	%o6
	sdiv	%i1,	0x1B70,	%i5
	prefetch	[%l7 + 0x50],	 0x3
	tgu	%xcc,	0x0
	sllx	%g7,	0x1A,	%l5
	tn	%xcc,	0x5
	addc	%i2,	%l6,	%o4
	umul	%o5,	0x0E37,	%g5
	sdiv	%i3,	0x1667,	%g4
	bvs,pn	%xcc,	loop_3043
	orncc	%i4,	%o1,	%o3
	sethi	0x0643,	%l2
	smulcc	%l1,	%o0,	%g6
loop_3043:
	movle	%icc,	%g2,	%i7
	movn	%icc,	%o7,	%i6
	mova	%icc,	%l3,	%i0
	fmovsle	%xcc,	%f12,	%f4
	edge8n	%o2,	%g3,	%l0
	set	0x38, %l3
	lduha	[%l7 + %l3] 0x89,	%g1
	xnorcc	%o6,	0x05B1,	%l4
	fones	%f21
	movl	%icc,	%i1,	%i5
	set	0x30, %i2
	ldda	[%l7 + %i2] 0x18,	%l4
	flush	%l7 + 0x54
	tg	%xcc,	0x4
	wr	%g0,	0x88,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	fcmped	%fcc1,	%f28,	%f28
	wr	%g0,	0x18,	%asi
	ldsba	[%l7 + 0x6B] %asi,	%i2
	movrgez	%l6,	%o4,	%o5
	subc	%g5,	0x0DF9,	%i3
	sllx	%g7,	%i4,	%o1
	taddcctv	%o3,	%g4,	%l2
	xnor	%o0,	%g6,	%g2
	movrgez	%l1,	0x21E,	%i7
	sdivcc	%o7,	0x1622,	%i6
	movle	%icc,	%l3,	%o2
	movrgz	%i0,	%l0,	%g1
	edge32ln	%o6,	%g3,	%l4
	wr	%g0,	0x10,	%asi
	ldstuba	[%l7 + 0x2D] %asi,	%i5
	fone	%f2
	orcc	%l5,	0x1C36,	%i2
	set	0x50, %l0
	lda	[%l7 + %l0] 0x11,	%f22
	tl	%xcc,	0x6
	tne	%xcc,	0x5
	movrgez	%l6,	0x09B,	%o4
	edge32	%i1,	%o5,	%i3
	andcc	%g5,	%i4,	%g7
	fnand	%f12,	%f26,	%f0
	taddcc	%o1,	0x1EAB,	%o3
	udiv	%l2,	0x1153,	%g4
	fmovdneg	%xcc,	%f27,	%f28
	mova	%xcc,	%o0,	%g6
	subccc	%g2,	%i7,	%l1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdleu	%xcc,	%f18,	%f24
	addccc	%i6,	0x0DFB,	%l3
	fbuge,a	%fcc3,	loop_3044
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movg	%xcc,	%o2,	%i0
	orncc	%o7,	0x0225,	%g1
loop_3044:
	andncc	%l0,	%o6,	%g3
	taddcc	%l4,	0x1CA3,	%l5
	fmovdcc	%icc,	%f23,	%f1
	andn	%i2,	%l6,	%o4
	umulcc	%i5,	0x03A7,	%i1
	edge32ln	%o5,	%i3,	%i4
	prefetch	[%l7 + 0x30],	 0x0
	brgz,a	%g5,	loop_3045
	tcc	%xcc,	0x7
	bgu,a,pt	%xcc,	loop_3046
	udiv	%g7,	0x07B5,	%o3
loop_3045:
	tsubcctv	%o1,	0x0B6B,	%g4
	edge16ln	%l2,	%g6,	%g2
loop_3046:
	movrne	%i7,	0x161,	%l1
	alignaddr	%i6,	%l3,	%o0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8l	%i0,	%o7,	%o2
	addcc	%g1,	%o6,	%l0
	andn	%l4,	%g3,	%l5
	srlx	%l6,	0x16,	%i2
	lduw	[%l7 + 0x24],	%o4
	fbule	%fcc3,	loop_3047
	mulscc	%i1,	0x02CE,	%i5
	ldsb	[%l7 + 0x65],	%o5
	fxors	%f29,	%f25,	%f27
loop_3047:
	nop
	set	0x48, %g4
	lduha	[%l7 + %g4] 0x81,	%i4
	movg	%xcc,	%i3,	%g5
	add	%g7,	0x11FB,	%o3
	sub	%g4,	%o1,	%l2
	and	%g2,	%g6,	%l1
	fone	%f4
	movl	%xcc,	%i6,	%l3
	fmovrsgez	%i7,	%f10,	%f28
	edge8ln	%i0,	%o7,	%o0
	tsubcctv	%o2,	%o6,	%g1
	alignaddr	%l0,	%g3,	%l5
	sdivx	%l4,	0x07A9,	%l6
	movpos	%xcc,	%i2,	%o4
	membar	0x60
	fmovrslz	%i5,	%f29,	%f19
	udivcc	%o5,	0x0015,	%i4
	xnorcc	%i3,	%i1,	%g5
	fpsub16	%f4,	%f20,	%f18
	nop
	setx loop_3048, %l0, %l1
	jmpl %l1, %o3
	ldx	[%l7 + 0x70],	%g7
	srl	%o1,	0x18,	%l2
	fmovrsgz	%g2,	%f17,	%f17
loop_3048:
	subc	%g6,	%g4,	%l1
	te	%icc,	0x4
	movpos	%xcc,	%l3,	%i6
	st	%f9,	[%l7 + 0x08]
	ba,pt	%xcc,	loop_3049
	orn	%i7,	0x0BCE,	%i0
	fandnot1s	%f8,	%f9,	%f31
	flush	%l7 + 0x3C
loop_3049:
	edge32ln	%o7,	%o0,	%o2
	movleu	%icc,	%o6,	%l0
	srl	%g3,	%g1,	%l4
	tpos	%icc,	0x6
	bneg,pt	%icc,	loop_3050
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x18,	%asi
	prefetcha	[%l7 + 0x48] %asi,	 0x3
loop_3050:
	andncc	%i2,	%l5,	%o4
	sdivx	%i5,	0x0221,	%i4
	alignaddrl	%i3,	%o5,	%g5
	or	%o3,	0x0293,	%g7
	udivcc	%i1,	0x0064,	%l2
	brgez,a	%g2,	loop_3051
	edge16	%g6,	%g4,	%o1
	fmovrde	%l1,	%f26,	%f24
	array8	%l3,	%i6,	%i0
loop_3051:
	tsubcctv	%o7,	%o0,	%i7
	movvs	%xcc,	%o2,	%o6
	fbug	%fcc0,	loop_3052
	udiv	%g3,	0x144F,	%g1
	edge32n	%l4,	%l6,	%i2
	array8	%l0,	%l5,	%o4
loop_3052:
	tsubcctv	%i4,	%i3,	%i5
	membar	0x3E
	tcc	%xcc,	0x4
	movrgz	%g5,	0x03A,	%o5
	movneg	%xcc,	%o3,	%i1
	fbge	%fcc2,	loop_3053
	ldsw	[%l7 + 0x28],	%g7
	movrgez	%g2,	0x016,	%l2
	edge8n	%g6,	%g4,	%o1
loop_3053:
	fbug,a	%fcc0,	loop_3054
	fbule	%fcc1,	loop_3055
	edge32n	%l1,	%i6,	%l3
	tne	%xcc,	0x2
loop_3054:
	bvs	loop_3056
loop_3055:
	tvs	%icc,	0x0
	edge32l	%i0,	%o7,	%o0
	wr	%g0,	0x89,	%asi
	stha	%o2,	[%l7 + 0x5C] %asi
loop_3056:
	sll	%o6,	%g3,	%g1
	sdivx	%i7,	0x14A2,	%l4
	srlx	%l6,	%l0,	%i2
	subc	%o4,	%i4,	%l5
	umul	%i3,	0x14B6,	%g5
	set	0x45, %l2
	ldstuba	[%l7 + %l2] 0x89,	%i5
	bvc	loop_3057
	bpos,pt	%icc,	loop_3058
	mova	%icc,	%o3,	%o5
	edge16l	%i1,	%g7,	%l2
loop_3057:
	nop
	wr	%g0,	0x80,	%asi
	ldswa	[%l7 + 0x4C] %asi,	%g6
loop_3058:
	fmovdneg	%icc,	%f26,	%f2
	fmovsle	%xcc,	%f17,	%f6
	addccc	%g4,	%g2,	%o1
	smulcc	%i6,	0x1BE0,	%l3
	fmovdvs	%xcc,	%f2,	%f6
	andcc	%l1,	0x1CF1,	%i0
	mulx	%o7,	0x160F,	%o2
	xnor	%o6,	%o0,	%g1
	popc	%g3,	%i7
	fbge,a	%fcc2,	loop_3059
	xor	%l6,	0x0189,	%l4
	movre	%i2,	%l0,	%o4
	movg	%icc,	%i4,	%i3
loop_3059:
	movrgz	%l5,	%i5,	%o3
	membar	#Sync
	wr	%g0,	0xf8,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	movrgez	%g5,	0x3E6,	%i1
	tsubcc	%o5,	%g7,	%l2
	sdiv	%g4,	0x019E,	%g2
	xorcc	%g6,	0x0EBC,	%i6
	fmovdn	%xcc,	%f28,	%f6
	orn	%o1,	0x1EBE,	%l1
	tne	%xcc,	0x4
	tneg	%icc,	0x5
	edge8n	%i0,	%l3,	%o2
	fmovdcs	%icc,	%f17,	%f7
	sdiv	%o7,	0x1B96,	%o6
	sdivcc	%g1,	0x06D3,	%o0
	fblg	%fcc0,	loop_3060
	brlez,a	%i7,	loop_3061
	fmovrdne	%g3,	%f16,	%f30
	fbu,a	%fcc2,	loop_3062
loop_3060:
	sll	%l4,	%l6,	%l0
loop_3061:
	xor	%i2,	0x04CB,	%i4
	tvs	%xcc,	0x1
loop_3062:
	subc	%o4,	0x1DE8,	%i3
	tleu	%xcc,	0x3
	edge8l	%l5,	%i5,	%g5
	movleu	%icc,	%i1,	%o5
	movpos	%xcc,	%g7,	%l2
	set	0x36, %i0
	stba	%g4,	[%l7 + %i0] 0x18
	set	0x1F, %o3
	ldsba	[%l7 + %o3] 0x15,	%g2
	addc	%o3,	0x1BAF,	%g6
	tg	%icc,	0x4
	movgu	%xcc,	%o1,	%l1
	set	0x64, %o2
	ldsha	[%l7 + %o2] 0x04,	%i0
	edge16l	%l3,	%i6,	%o2
	stx	%o7,	[%l7 + 0x48]
	fmovs	%f25,	%f20
	fmovdpos	%icc,	%f6,	%f23
	movneg	%xcc,	%o6,	%o0
	tle	%xcc,	0x4
	movn	%icc,	%g1,	%g3
	fble,a	%fcc1,	loop_3063
	fbe,a	%fcc2,	loop_3064
	tn	%icc,	0x0
	fbule	%fcc0,	loop_3065
loop_3063:
	ta	%xcc,	0x2
loop_3064:
	fcmpne16	%f14,	%f18,	%i7
	fmovrse	%l4,	%f25,	%f31
loop_3065:
	sra	%l6,	0x1E,	%l0
	fandnot2s	%f9,	%f30,	%f29
	st	%f26,	[%l7 + 0x54]
	fmovdgu	%xcc,	%f24,	%f29
	tge	%xcc,	0x3
	tvs	%icc,	0x1
	fcmpne16	%f14,	%f2,	%i4
	bcs,a,pt	%icc,	loop_3066
	movge	%icc,	%o4,	%i2
	fbul,a	%fcc0,	loop_3067
	fmovsne	%icc,	%f26,	%f15
loop_3066:
	nop
	set	0x48, %i6
	lduha	[%l7 + %i6] 0x19,	%i3
loop_3067:
	movl	%xcc,	%i5,	%l5
	sth	%g5,	[%l7 + 0x7C]
	for	%f8,	%f24,	%f2
	xor	%o5,	%g7,	%i1
	tcc	%xcc,	0x7
	edge32l	%l2,	%g2,	%o3
	fxnors	%f28,	%f27,	%f12
	tpos	%icc,	0x2
	tsubcctv	%g6,	%o1,	%l1
	fmuld8sux16	%f7,	%f2,	%f12
	tne	%icc,	0x6
	add	%l7,	0x60,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%i0
	casxa	[%l6] %asi,	%i0,	%l3
	movpos	%xcc,	%g4,	%i6
	fpack16	%f18,	%f18
	fabss	%f25,	%f7
	wr	%g0,	0x19,	%asi
	ldsha	[%l7 + 0x4E] %asi,	%o2
	edge32ln	%o6,	%o0,	%g1
	set	0x0A, %g3
	ldsba	[%l7 + %g3] 0x80,	%g3
	ldub	[%l7 + 0x28],	%o7
	movrlez	%l4,	%l6,	%l0
	set	0x78, %g1
	ldswa	[%l7 + %g1] 0x18,	%i4
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 0:
!
!	Type l   	: 2789
!	Type cti   	: 3067
!	Type x   	: 1245
!	Type f   	: 4530
!	Type i   	: 13369
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


	EXIT_GOOD	/* test finish  */

/************************************************************************
   Test case data start
 ************************************************************************/
.data
user_data_start:
scratch_area:
.word 0x0C6FA55A
.word 0xBC7B7CE1
.word 0xE665F812
.word 0xA738659A
.word 0x8B362C5B
.word 0xBA0C0ECA
.word 0x206378B7
.word 0xFD2A6756
.word 0xC2F2853F
.word 0x5B6CABA2
.word 0x818731F8
.word 0x4D72DAA5
.word 0x014A2B5E
.word 0x23BDA7A3
.word 0x30E5E902
.word 0x0469780A
.word 0x99B0343B
.word 0x14636ED0
.word 0xB7555AB3
.word 0xCF4C4CA6
.word 0x201112EE
.word 0xF953E4F9
.word 0xE0E1BEF3
.word 0xD3230F8F
.word 0x23B378E6
.word 0xFFBFCC08
.word 0x6E582324
.word 0x8C0032B4
.word 0x48C4F6C8
.word 0x6C4B4C11
.word 0x8F2430CD
.word 0xC010D682
.word 0xA2570769
.word 0xC47D493E
.word 0x55499A96
.word 0x7627B100
.word 0x5990DAB4
.word 0x45789507
.word 0xD9B5456D
.word 0x0DDAFA76
.word 0x354A2EBB
.word 0x4C848558
.word 0x2DFDD3DF
.word 0xC742634B
.word 0x455D4261
.word 0xECC71E9E
.word 0xD81E1908
.word 0x8212CEC8
.word 0x7AE84834
.word 0x654E01BE
.word 0xBDE2569E
.word 0xB07C52E4
.word 0x19726158
.word 0x630AACA1
.word 0xA5864E79
.word 0x48B614D1
.word 0xCF32173D
.word 0xDFD48081
.word 0xD12EFDE8
.word 0x7211BBCA
.word 0xA4C16316
.word 0x3B2053F0
.word 0x802E45DA
.word 0x36A914E9
.end
