/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: isa3_basic3_f2.s
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
.ident "Using Instruction Hash for Focus :$Id: isa3_basic3_f2.s,v 1.1 2007/05/11 17:22:22 drp Exp $"
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
	setx	0x99F4642D1046A690,	%l0,	%l6
	stx	%l6,	[%l7 + 0x0]
	ldx	[%l7 + 0x0],	%fsr
!
! Thread 0 Start
!
main_t0:

	!# Initialize registers ..

	!# Global registers
	set	0x3,	%g1
	set	0xF,	%g2
	set	0x6,	%g3
	set	0x1,	%g4
	set	0xD,	%g5
	set	0x3,	%g6
	set	0xD,	%g7
	!# Input registers
	set	-0x9,	%i0
	set	-0xD,	%i1
	set	-0x9,	%i2
	set	-0xD,	%i3
	set	-0x5,	%i4
	set	-0x6,	%i5
	set	-0xB,	%i6
	set	-0x8,	%i7
	!# Local registers
	set	0x67D06F87,	%l0
	set	0x0D5CF41B,	%l1
	set	0x615F0387,	%l2
	set	0x5EA9023C,	%l3
	set	0x4B96F8F6,	%l4
	set	0x46D79D71,	%l5
	set	0x24438BBD,	%l6
	!# Output registers
	set	0x0EC3,	%o0
	set	-0x1CEF,	%o1
	set	-0x162F,	%o2
	set	-0x0034,	%o3
	set	-0x1463,	%o4
	set	0x1D75,	%o5
	set	-0x0E72,	%o6
	set	-0x142B,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x3450EFA3C74728BF)
	INIT_TH_FP_REG(%l7,%f2,0x7AFE34F94FADD363)
	INIT_TH_FP_REG(%l7,%f4,0x10E291AAE608576B)
	INIT_TH_FP_REG(%l7,%f6,0x7CD4834E0D9F58F5)
	INIT_TH_FP_REG(%l7,%f8,0xA07CC4CF4DB4E2A6)
	INIT_TH_FP_REG(%l7,%f10,0x4C4A3163B57222E9)
	INIT_TH_FP_REG(%l7,%f12,0x65C824FF54876C7E)
	INIT_TH_FP_REG(%l7,%f14,0x5DDF7B03C2C9684E)
	INIT_TH_FP_REG(%l7,%f16,0xBCD18146FF07A14D)
	INIT_TH_FP_REG(%l7,%f18,0x5A888956FAC4581E)
	INIT_TH_FP_REG(%l7,%f20,0xD92D5D97399D0B4F)
	INIT_TH_FP_REG(%l7,%f22,0xCAFC490647B9A2D6)
	INIT_TH_FP_REG(%l7,%f24,0x6D494CB59056150A)
	INIT_TH_FP_REG(%l7,%f26,0xF1A83600460C0074)
	INIT_TH_FP_REG(%l7,%f28,0x56DB8CB0C0530D96)
	INIT_TH_FP_REG(%l7,%f30,0xAE0AA2EBD21437EF)
	!# Other state
	
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x669, 	%hsys_tick_cmpr


	!# Execute Main Diag ..

	movg	%icc,	%l5,	%i7
	bneg,a,pn	%xcc,	loop_1
	fpadd16s	%f16,	%f8,	%f30
	orncc	%g2,	0x1F89,	%l3
	bvs	loop_2
loop_1:
	fmul8x16al	%f26,	%f16,	%f20
	movpos	%icc,	%o2,	%o7
	add	%l2,	0x05A0,	%l1
loop_2:
	movge	%icc,	%i5,	%o5
	orncc	%o3,	0x140E,	%o1
	fnot2s	%f9,	%f24
	movre	%i3,	%l4,	%l0
	fmovde	%icc,	%f5,	%f28
	smul	%g4,	%o6,	%i2
	bne	%xcc,	loop_3
	orn	%g3,	%o4,	%i1
	xnorcc	%g6,	0x0A5D,	%i0
	fmul8sux16	%f22,	%f22,	%f30
loop_3:
	movrgez	%i4,	0x03A,	%l6
	bne	%icc,	loop_4
	sethi	0x0978,	%g1
	srax	%g5,	%i6,	%o0
	ta	%xcc,	0x6
loop_4:
	movpos	%xcc,	%l5,	%i7
	orn	%g2,	0x151E,	%l3
	mulscc	%g7,	0x0AF1,	%o2
	fmovrdgz	%l2,	%f24,	%f6
	and	%l1,	%i5,	%o7
	fcmpeq16	%f8,	%f16,	%o5
	fbo,a	%fcc2,	loop_5
	array8	%o1,	%i3,	%l4
	ldsw	[%l7 + 0x30],	%l0
	fnot1s	%f25,	%f11
loop_5:
	fblg,a	%fcc2,	loop_6
	tn	%xcc,	0x6
	xorcc	%o3,	%o6,	%i2
	edge32ln	%g3,	%g4,	%i1
loop_6:
	ldsh	[%l7 + 0x3A],	%o4
	stx	%g6,	[%l7 + 0x68]
	fpadd16	%f4,	%f6,	%f16
	alignaddr	%i0,	%i4,	%l6
	fpadd16s	%f9,	%f14,	%f7
	sra	%g1,	%i6,	%o0
	movre	%l5,	%i7,	%g2
	edge8ln	%g5,	%g7,	%l3
	brlez	%l2,	loop_7
	fmul8x16	%f8,	%f14,	%f28
	prefetch	[%l7 + 0x2C],	 0x0
	edge8n	%l1,	%i5,	%o7
loop_7:
	edge8ln	%o2,	%o5,	%o1
	prefetch	[%l7 + 0x48],	 0x2
	set	0x40, %l5
	prefetcha	[%l7 + %l5] 0x18,	 0x1
	fnor	%f22,	%f20,	%f28
	alignaddr	%l0,	%o3,	%o6
	movne	%icc,	%i2,	%g3
	wr	%g0,	0x88,	%asi
	stda	%i2,	[%l7 + 0x50] %asi
	tvc	%icc,	0x5
	fbg	%fcc3,	loop_8
	andcc	%g4,	%o4,	%i1
	edge16ln	%i0,	%i4,	%l6
	fpsub32s	%f21,	%f27,	%f19
loop_8:
	tneg	%xcc,	0x7
	addc	%g1,	%i6,	%o0
	fblg,a	%fcc2,	loop_9
	movrgz	%l5,	0x218,	%i7
	swap	[%l7 + 0x28],	%g6
	mova	%xcc,	%g2,	%g7
loop_9:
	nop
	set	0x69, %g7
	ldsba	[%l7 + %g7] 0x81,	%g5
	wr	%g0,	0xe2,	%asi
	stda	%l2,	[%l7 + 0x58] %asi
	membar	#Sync
	fbo,a	%fcc3,	loop_10
	taddcc	%l1,	0x04E7,	%l3
	xor	%o7,	0x1CA6,	%o2
	fbge,a	%fcc3,	loop_11
loop_10:
	fcmpeq16	%f12,	%f28,	%o5
	fbue,a	%fcc2,	loop_12
	flush	%l7 + 0x4C
loop_11:
	edge32	%i5,	%l4,	%l0
	fmovrsne	%o1,	%f4,	%f9
loop_12:
	tge	%icc,	0x2
	fmovrde	%o6,	%f14,	%f0
	tsubcctv	%i2,	0x05F5,	%g3
	bge,pt	%icc,	loop_13
	bgu,a,pn	%icc,	loop_14
	fnot1s	%f8,	%f12
	tpos	%icc,	0x5
loop_13:
	smul	%i3,	%g4,	%o3
loop_14:
	orncc	%o4,	%i0,	%i4
	addc	%l6,	0x05D4,	%g1
	fbg	%fcc2,	loop_15
	bcs,a	%icc,	loop_16
	bgu,a,pt	%xcc,	loop_17
	movneg	%xcc,	%i1,	%i6
loop_15:
	nop
	set	0x18, %l3
	lda	[%l7 + %l3] 0x10,	%f2
loop_16:
	movneg	%icc,	%o0,	%i7
loop_17:
	fcmpeq32	%f26,	%f16,	%g6
	tl	%icc,	0x6
	sdiv	%l5,	0x01E5,	%g7
	fmovrslez	%g5,	%f13,	%f29
	movrlz	%g2,	%l2,	%l1
	fmovsge	%icc,	%f8,	%f19
	fpadd16s	%f28,	%f15,	%f15
	set	0x5E, %l6
	ldsba	[%l7 + %l6] 0x89,	%o7
	orn	%o2,	0x0008,	%l3
	movrgz	%o5,	%l4,	%l0
	wr	%g0,	0x88,	%asi
	ldsba	[%l7 + 0x23] %asi,	%i5
	set	0x70, %l0
	lda	[%l7 + %l0] 0x04,	%f14
	fbn,a	%fcc0,	loop_18
	taddcctv	%o1,	%o6,	%i2
	set	0x38, %i5
	stxa	%g3,	[%l7 + %i5] 0xeb
	membar	#Sync
loop_18:
	nop
	wr	%g0,	0x18,	%asi
	stda	%g4,	[%l7 + 0x18] %asi
	fcmpgt32	%f14,	%f0,	%o3
	nop
	setx	loop_19,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	for	%f14,	%f16,	%f26
	bn	%icc,	loop_20
	xor	%i3,	%o4,	%i4
loop_19:
	movrgez	%i0,	0x13C,	%l6
	fmovdcs	%xcc,	%f9,	%f7
loop_20:
	nop
	wr	%g0,	0xea,	%asi
	stha	%i1,	[%l7 + 0x2E] %asi
	membar	#Sync
	edge32ln	%g1,	%i6,	%i7
	orcc	%g6,	0x15CF,	%o0
	nop
	setx	loop_21,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	smulcc	%g7,	%l5,	%g5
	or	%l2,	0x122E,	%g2
	xnorcc	%o7,	%o2,	%l3
loop_21:
	mulscc	%l1,	0x1E4B,	%l4
	tn	%xcc,	0x7
	set	0x32, %g1
	stba	%o5,	[%l7 + %g1] 0x2a
	membar	#Sync
	sra	%i5,	%o1,	%l0
	ldsb	[%l7 + 0x2C],	%o6
	movl	%icc,	%g3,	%g4
	pdist	%f18,	%f22,	%f6
	mulx	%o3,	0x09D1,	%i2
	faligndata	%f20,	%f10,	%f18
	tleu	%xcc,	0x6
	fbge	%fcc1,	loop_22
	fpadd32s	%f9,	%f13,	%f26
	andcc	%i3,	%o4,	%i0
	fmovspos	%icc,	%f27,	%f23
loop_22:
	stw	%i4,	[%l7 + 0x68]
	wr	%g0,	0x18,	%asi
	ldda	[%l7 + 0x60] %asi,	%i0
	fnors	%f30,	%f4,	%f13
	ldsb	[%l7 + 0x6E],	%l6
	srl	%g1,	%i7,	%i6
	fmovdneg	%xcc,	%f17,	%f26
	fmovrdlz	%o0,	%f8,	%f8
	mulx	%g6,	%g7,	%l5
	sllx	%g5,	%g2,	%o7
	tl	%icc,	0x7
	alignaddr	%l2,	%l3,	%l1
	bleu,pt	%xcc,	loop_23
	xnor	%o2,	0x03FC,	%o5
	sdivx	%i5,	0x172B,	%o1
	tvs	%icc,	0x6
loop_23:
	fmovsg	%icc,	%f21,	%f30
	add	%l7,	0x38,	%l6
	wr	%g0,	0x11,	%asi
	lda	[%l6] %asi,	%l4
	casa	[%l6] %asi,	%l4,	%o6
	udivx	%l0,	0x0ECC,	%g3
	movge	%icc,	%g4,	%o3
	fmovdcc	%icc,	%f26,	%f26
	fmovrdgez	%i2,	%f26,	%f24
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x88,	%asi
	ldsha	[%l7 + 0x38] %asi,	%o4
	umul	%i3,	%i4,	%i0
	movneg	%xcc,	%i1,	%g1
	taddcctv	%i7,	0x0E07,	%l6
	taddcc	%i6,	0x19C2,	%o0
	bn,a	%xcc,	loop_24
	subccc	%g6,	0x0F21,	%l5
	bneg	loop_25
	addcc	%g5,	%g2,	%o7
loop_24:
	sra	%g7,	%l2,	%l3
	wr	%g0,	0x22,	%asi
	stba	%l1,	[%l7 + 0x2B] %asi
	membar	#Sync
loop_25:
	movgu	%icc,	%o5,	%i5
	bne	loop_26
	fmovrdlz	%o1,	%f22,	%f20
	fmovdg	%icc,	%f4,	%f27
	movrlz	%o2,	%o6,	%l4
loop_26:
	tge	%icc,	0x1
	subc	%g3,	%l0,	%g4
	fbo,a	%fcc3,	loop_27
	edge16ln	%o3,	%i2,	%o4
	bne	%icc,	loop_28
	addccc	%i4,	%i0,	%i3
loop_27:
	tne	%icc,	0x4
	fmovsneg	%icc,	%f7,	%f26
loop_28:
	tvs	%icc,	0x0
	ldsw	[%l7 + 0x68],	%i1
	fmul8x16al	%f21,	%f6,	%f16
	set	0x45, %i2
	lduba	[%l7 + %i2] 0x0c,	%g1
	fnot1s	%f12,	%f30
	movre	%l6,	%i7,	%o0
	xnor	%g6,	%i6,	%l5
	ldd	[%l7 + 0x78],	%g2
	tvs	%xcc,	0x2
	orn	%o7,	0x18C3,	%g7
	orcc	%g5,	%l2,	%l1
	movge	%icc,	%l3,	%o5
	tleu	%xcc,	0x1
	srl	%i5,	%o1,	%o6
	wr	%g0,	0x89,	%asi
	ldswa	[%l7 + 0x74] %asi,	%l4
	edge32l	%g3,	%l0,	%o2
	for	%f6,	%f12,	%f8
	tvc	%icc,	0x7
	brgz	%g4,	loop_29
	movge	%icc,	%i2,	%o3
	fmovrdgz	%o4,	%f0,	%f20
	edge32n	%i0,	%i4,	%i3
loop_29:
	fmovsleu	%xcc,	%f23,	%f24
	mulscc	%g1,	%i1,	%l6
	stb	%o0,	[%l7 + 0x7E]
	subc	%i7,	0x0793,	%i6
	array8	%g6,	%g2,	%l5
	fbo,a	%fcc2,	loop_30
	sub	%g7,	0x1415,	%g5
	tge	%xcc,	0x0
	fmovde	%icc,	%f28,	%f27
loop_30:
	fnot2	%f26,	%f26
	tcc	%icc,	0x4
	fcmpeq32	%f14,	%f30,	%l2
	set	0x30, %l1
	ldda	[%l7 + %l1] 0x2a,	%o6
	fmovdpos	%xcc,	%f15,	%f19
	srlx	%l3,	%o5,	%l1
	array16	%i5,	%o6,	%o1
	udivx	%l4,	0x0F07,	%g3
	add	%l7,	0x38,	%l6
	wr	%g0,	0x18,	%asi
	casxa	[%l6] 0x18,	%o2,	%l0
	subcc	%g4,	%i2,	%o3
	bleu	%icc,	loop_31
	fmovsn	%xcc,	%f9,	%f12
	wr	%g0,	0x04,	%asi
	prefetcha	[%l7 + 0x68] %asi,	 0x3
loop_31:
	andn	%i4,	0x0C77,	%i0
	xor	%i3,	%i1,	%l6
	fmovsvs	%xcc,	%f7,	%f30
	fones	%f13
	wr	%g0,	0x81,	%asi
	lduwa	[%l7 + 0x44] %asi,	%g1
	subc	%o0,	0x18D8,	%i7
	edge32n	%i6,	%g6,	%l5
	sdivx	%g2,	0x135D,	%g7
	wr	%g0,	0x89,	%asi
	swapa	[%l7 + 0x2C] %asi,	%g5
	umul	%o7,	0x092D,	%l2
	movre	%o5,	%l3,	%i5
	movne	%xcc,	%o6,	%l1
	or	%o1,	0x0847,	%g3
	movrlz	%l4,	%l0,	%g4
	nop
	setx	loop_32,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	nop
	setx	loop_33,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	taddcctv	%o2,	0x022B,	%i2
	wr	%g0,	0x81,	%asi
	ldswa	[%l7 + 0x74] %asi,	%o3
loop_32:
	array16	%o4,	%i4,	%i3
loop_33:
	tvs	%icc,	0x5
	std	%i0,	[%l7 + 0x20]
	fmovdvc	%icc,	%f0,	%f17
	tsubcc	%i0,	0x10DE,	%g1
	brlez,a	%o0,	loop_34
	fmovscs	%xcc,	%f20,	%f3
	fmovsn	%xcc,	%f16,	%f20
	fornot2	%f2,	%f30,	%f20
loop_34:
	fmovdvs	%icc,	%f25,	%f10
	tvs	%xcc,	0x3
	movgu	%icc,	%l6,	%i7
	tl	%icc,	0x1
	addccc	%i6,	%g6,	%l5
	tge	%xcc,	0x6
	smulcc	%g7,	%g2,	%o7
	udiv	%l2,	0x1F1A,	%g5
	ba,a	loop_35
	xorcc	%l3,	0x1EAE,	%o5
	tcc	%icc,	0x4
	alignaddrl	%i5,	%l1,	%o6
loop_35:
	bgu	%xcc,	loop_36
	tgu	%icc,	0x7
	fmul8ulx16	%f2,	%f10,	%f12
	orncc	%g3,	%o1,	%l4
loop_36:
	stx	%g4,	[%l7 + 0x28]
	mulscc	%l0,	%o2,	%o3
	movle	%xcc,	%i2,	%o4
	movneg	%icc,	%i4,	%i1
	tcs	%xcc,	0x4
	movcc	%xcc,	%i3,	%i0
	bgu,a,pn	%icc,	loop_37
	sra	%g1,	0x16,	%o0
	move	%icc,	%i7,	%l6
	fblg	%fcc2,	loop_38
loop_37:
	fnot1s	%f10,	%f21
	popc	0x0B3D,	%g6
	set	0x78, %i6
	stda	%l4,	[%l7 + %i6] 0x2b
	membar	#Sync
loop_38:
	edge32	%i6,	%g2,	%g7
	sra	%o7,	0x1F,	%l2
	taddcc	%l3,	0x0718,	%o5
	movrlz	%g5,	0x021,	%l1
	xorcc	%o6,	0x0880,	%g3
	sub	%o1,	%i5,	%g4
	sub	%l0,	0x0705,	%o2
	movcs	%xcc,	%o3,	%l4
	fbug,a	%fcc0,	loop_39
	and	%i2,	0x0B9D,	%o4
	smulcc	%i4,	0x0352,	%i1
	sdiv	%i0,	0x1576,	%i3
loop_39:
	bl,pn	%icc,	loop_40
	movcs	%icc,	%o0,	%i7
	movre	%l6,	%g6,	%g1
	udiv	%l5,	0x00F2,	%g2
loop_40:
	fbo,a	%fcc3,	loop_41
	movrgz	%g7,	0x3C2,	%i6
	bg,a	loop_42
	udivx	%o7,	0x12CB,	%l3
loop_41:
	smul	%l2,	%o5,	%l1
	bpos	loop_43
loop_42:
	fcmpgt16	%f30,	%f10,	%o6
	tneg	%xcc,	0x2
	add	%l7,	0x70,	%l6
	wr	%g0,	0x11,	%asi
	ldxa	[%l6] %asi,	%g5
	casxa	[%l6] %asi,	%g5,	%o1
loop_43:
	fbul	%fcc0,	loop_44
	fcmpeq16	%f28,	%f10,	%g3
	mulscc	%g4,	0x0B0C,	%l0
	edge8n	%o2,	%o3,	%l4
loop_44:
	fmovdneg	%icc,	%f3,	%f0
	addc	%i2,	0x1DC6,	%i5
	popc	0x1876,	%i4
	tg	%xcc,	0x5
	subcc	%o4,	%i1,	%i3
	smulcc	%o0,	0x05AE,	%i7
	fcmpgt32	%f10,	%f10,	%i0
	fornot2s	%f23,	%f5,	%f8
	array8	%g6,	%l6,	%g1
	edge8l	%l5,	%g2,	%i6
	fzero	%f18
	wr	%g0,	0x22,	%asi
	stxa	%g7,	[%l7 + 0x30] %asi
	membar	#Sync
	taddcc	%l3,	0x15C1,	%o7
	tgu	%xcc,	0x5
	edge16n	%o5,	%l2,	%o6
	tl	%icc,	0x6
	addccc	%l1,	%g5,	%o1
	nop
	set	0x58, %o7
	sth	%g4,	[%l7 + %o7]
	subc	%g3,	%l0,	%o2
	fnot1	%f24,	%f22
	array32	%o3,	%l4,	%i2
	array16	%i5,	%o4,	%i1
	xorcc	%i3,	%o0,	%i7
	andcc	%i0,	%g6,	%i4
	ldstub	[%l7 + 0x63],	%l6
	sethi	0x0F84,	%g1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16n	%g2,	%i6,	%l5
	taddcc	%l3,	0x14C8,	%o7
	nop
	set	0x74, %i0
	ldsh	[%l7 + %i0],	%o5
	tleu	%xcc,	0x6
	set	0x6C, %o5
	lduwa	[%l7 + %o5] 0x04,	%g7
	wr	%g0,	0x89,	%asi
	lduha	[%l7 + 0x66] %asi,	%l2
	movleu	%xcc,	%o6,	%l1
	set	0x40, %i7
	ldda	[%l7 + %i7] 0x80,	%f16
	stw	%g5,	[%l7 + 0x5C]
	udivx	%o1,	0x020B,	%g4
	movgu	%icc,	%l0,	%g3
	lduw	[%l7 + 0x6C],	%o3
	edge16ln	%l4,	%i2,	%i5
	fornot1	%f30,	%f22,	%f24
	set	0x2C, %o0
	ldsba	[%l7 + %o0] 0x10,	%o2
	edge16ln	%i1,	%i3,	%o4
	edge32n	%i7,	%o0,	%i0
	bcs,a	%xcc,	loop_45
	bn	loop_46
	movrgz	%g6,	%i4,	%l6
	or	%g1,	0x1651,	%g2
loop_45:
	mulx	%i6,	0x1C32,	%l3
loop_46:
	ld	[%l7 + 0x70],	%f17
	udivcc	%o7,	0x0FE3,	%l5
	mova	%xcc,	%g7,	%l2
	add	%l7,	0x08,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%o5
	casxa	[%l6] 0x88,	%o5,	%o6
	fones	%f24
	tneg	%xcc,	0x2
	fmovrdgz	%g5,	%f22,	%f16
	andcc	%l1,	%g4,	%l0
	or	%o1,	0x1A59,	%g3
	set	0x70, %o3
	stxa	%o3,	[%l7 + %o3] 0x18
	tvc	%xcc,	0x4
	bpos,pt	%icc,	loop_47
	movrlez	%i2,	0x21A,	%i5
	sth	%o2,	[%l7 + 0x42]
	movgu	%xcc,	%i1,	%i3
loop_47:
	fcmpne16	%f4,	%f18,	%o4
	te	%icc,	0x7
	ldd	[%l7 + 0x48],	%f24
	array8	%l4,	%o0,	%i0
	movrgez	%i7,	0x169,	%g6
	fcmpd	%fcc3,	%f18,	%f2
	addc	%l6,	%g1,	%g2
	te	%icc,	0x7
	fmovrdlez	%i4,	%f6,	%f14
	fmovde	%icc,	%f14,	%f6
	movneg	%xcc,	%l3,	%i6
	smul	%l5,	0x0A7E,	%g7
	umulcc	%o7,	0x0FF0,	%o5
	fmovscc	%icc,	%f17,	%f19
	udiv	%l2,	0x02E8,	%g5
	fors	%f14,	%f8,	%f20
	tneg	%xcc,	0x4
	xnor	%o6,	%l1,	%g4
	movneg	%icc,	%o1,	%g3
	ldub	[%l7 + 0x6B],	%o3
	movvc	%xcc,	%l0,	%i5
	ta	%icc,	0x0
	fcmple16	%f30,	%f14,	%i2
	mulscc	%i1,	0x0EE6,	%o2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tne	%xcc,	0x4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	taddcctv	%i3,	%o4,	%o0
	fmovdleu	%icc,	%f13,	%f13
	wr	%g0,	0x11,	%asi
	prefetcha	[%l7 + 0x38] %asi,	 0x2
	bne,a	loop_48
	fmovsne	%xcc,	%f22,	%f26
	fbuge,a	%fcc0,	loop_49
	ldub	[%l7 + 0x17],	%i7
loop_48:
	andcc	%l4,	0x078C,	%l6
	taddcctv	%g6,	0x046F,	%g1
loop_49:
	smul	%i4,	0x103A,	%l3
	nop
	setx	loop_50,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fpsub32s	%f26,	%f23,	%f19
	fcmpne32	%f10,	%f24,	%i6
	fnot1s	%f4,	%f7
loop_50:
	addcc	%g2,	%g7,	%l5
	fmovsle	%xcc,	%f26,	%f31
	popc	0x13FD,	%o7
	tsubcc	%l2,	0x0A35,	%o5
	fpsub16s	%f6,	%f12,	%f31
	fmovrdne	%o6,	%f26,	%f4
	tcc	%xcc,	0x2
	udivx	%g5,	0x0A4C,	%g4
	umulcc	%o1,	0x13B6,	%g3
	sll	%l1,	%o3,	%i5
	andn	%i2,	0x1E9A,	%l0
	or	%o2,	%i3,	%o4
	movrgz	%o0,	0x14A,	%i1
	fmovsle	%icc,	%f3,	%f8
	addc	%i0,	%l4,	%i7
	sra	%g6,	0x12,	%g1
	fnands	%f15,	%f23,	%f29
	udivx	%i4,	0x16B1,	%l6
	flush	%l7 + 0x5C
	edge8	%i6,	%l3,	%g7
	brlez	%g2,	loop_51
	ldstub	[%l7 + 0x58],	%l5
	popc	0x118C,	%o7
	fnand	%f24,	%f28,	%f8
loop_51:
	bleu,pn	%icc,	loop_52
	xnor	%l2,	%o6,	%o5
	and	%g4,	0x018F,	%g5
	fmuld8sux16	%f12,	%f1,	%f0
loop_52:
	orcc	%o1,	0x0C06,	%l1
	and	%o3,	0x0367,	%g3
	bl,a,pt	%icc,	loop_53
	movvc	%icc,	%i2,	%i5
	ldsh	[%l7 + 0x56],	%o2
	fandnot1s	%f24,	%f22,	%f27
loop_53:
	std	%i2,	[%l7 + 0x30]
	movrlz	%o4,	%o0,	%l0
	fmul8ulx16	%f16,	%f4,	%f24
	fsrc1	%f4,	%f22
	edge16l	%i1,	%l4,	%i0
	tg	%icc,	0x1
	nop
	setx	loop_54,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	udiv	%i7,	0x0A78,	%g1
	movne	%icc,	%i4,	%g6
	stb	%l6,	[%l7 + 0x08]
loop_54:
	tg	%xcc,	0x2
	edge16ln	%l3,	%g7,	%i6
	movneg	%icc,	%g2,	%o7
	set	0x58, %i3
	stxa	%l2,	[%l7 + %i3] 0x10
	fmovs	%f7,	%f3
	fmovsleu	%xcc,	%f16,	%f21
	edge32n	%l5,	%o6,	%g4
	wr	%g0,	0x88,	%asi
	lduha	[%l7 + 0x68] %asi,	%o5
	fmovrdlz	%g5,	%f10,	%f18
	movrgz	%o1,	%l1,	%o3
	addcc	%g3,	0x0AC3,	%i5
	taddcc	%o2,	%i3,	%i2
	flush	%l7 + 0x68
	andn	%o0,	0x04D6,	%o4
	sdiv	%l0,	0x16CF,	%i1
	bvs,pt	%icc,	loop_55
	tgu	%xcc,	0x1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldx	[%l7 + 0x68],	%l4
loop_55:
	nop
	wr	%g0,	0x10,	%asi
	ldstuba	[%l7 + 0x3D] %asi,	%i0
	xor	%i7,	%i4,	%g1
	brlz	%g6,	loop_56
	fmovrdlz	%l6,	%f16,	%f18
	tsubcctv	%l3,	0x0B4C,	%i6
	srl	%g2,	0x14,	%o7
loop_56:
	array32	%l2,	%g7,	%o6
	movgu	%icc,	%l5,	%o5
	fmovsvs	%icc,	%f12,	%f7
	edge8l	%g4,	%o1,	%g5
	wr	%g0,	0x04,	%asi
	lduwa	[%l7 + 0x64] %asi,	%o3
	array8	%l1,	%i5,	%o2
	lduw	[%l7 + 0x14],	%g3
	fandnot1	%f8,	%f16,	%f30
	add	%i2,	%i3,	%o4
	tneg	%xcc,	0x6
	addc	%o0,	0x13FB,	%i1
	array16	%l4,	%l0,	%i7
	add	%l7,	0x18,	%l6
	wr	%g0,	0x10,	%asi
	casxa	[%l6] %asi,	%i0,	%i4
	tpos	%icc,	0x1
	sdiv	%g6,	0x1375,	%l6
	movne	%xcc,	%l3,	%g1
	sdivx	%g2,	0x0006,	%i6
	add	%o7,	0x067F,	%l2
	move	%xcc,	%g7,	%o6
	fba	%fcc3,	loop_57
	edge8	%l5,	%g4,	%o1
	srax	%g5,	0x14,	%o5
	swap	[%l7 + 0x54],	%o3
loop_57:
	sdiv	%i5,	0x176E,	%o2
	andncc	%g3,	%l1,	%i3
	fand	%f0,	%f16,	%f22
	edge16ln	%i2,	%o0,	%i1
	fblg	%fcc2,	loop_58
	lduh	[%l7 + 0x7E],	%l4
	umul	%l0,	0x0CE5,	%i7
	edge32l	%o4,	%i0,	%i4
loop_58:
	movge	%icc,	%g6,	%l3
	smulcc	%g1,	%g2,	%l6
	movrlez	%i6,	0x265,	%l2
	stb	%o7,	[%l7 + 0x14]
	flush	%l7 + 0x08
	fbul	%fcc0,	loop_59
	movrlz	%o6,	0x0C8,	%l5
	fpsub32	%f6,	%f28,	%f2
	set	0x37, %g3
	stba	%g7,	[%l7 + %g3] 0x11
loop_59:
	tsubcc	%g4,	%o1,	%o5
	movl	%icc,	%g5,	%o3
	ba	loop_60
	membar	0x39
	brnz,a	%o2,	loop_61
	movrlz	%g3,	%i5,	%l1
loop_60:
	std	%f4,	[%l7 + 0x10]
	xnor	%i2,	0x0BCE,	%o0
loop_61:
	nop
	set	0x38, %g5
	stha	%i3,	[%l7 + %g5] 0x27
	membar	#Sync
	fmovdcc	%icc,	%f8,	%f31
	addccc	%l4,	0x067D,	%l0
	fzero	%f12
	wr	%g0,	0x81,	%asi
	lda	[%l7 + 0x44] %asi,	%f22
	fmovrde	%i7,	%f26,	%f10
	umulcc	%o4,	0x15D5,	%i1
	tpos	%xcc,	0x6
	tne	%icc,	0x4
	set	0x54, %o4
	lduwa	[%l7 + %o4] 0x0c,	%i4
	andncc	%i0,	%g6,	%l3
	fmovrde	%g2,	%f24,	%f16
	fcmps	%fcc2,	%f0,	%f0
	edge16	%l6,	%g1,	%l2
	fbule	%fcc3,	loop_62
	addccc	%o7,	0x1A59,	%i6
	call	loop_63
	tl	%xcc,	0x1
loop_62:
	tn	%icc,	0x5
	xorcc	%l5,	0x055A,	%g7
loop_63:
	tg	%icc,	0x6
	bl,a,pt	%xcc,	loop_64
	bge	loop_65
	std	%f12,	[%l7 + 0x60]
	fsrc2	%f10,	%f24
loop_64:
	movrgz	%g4,	0x110,	%o6
loop_65:
	fbu,a	%fcc3,	loop_66
	srax	%o5,	0x1F,	%g5
	movrgez	%o3,	%o1,	%g3
	bvc,a,pn	%xcc,	loop_67
loop_66:
	movcc	%xcc,	%i5,	%l1
	set	0x44, %o6
	stha	%o2,	[%l7 + %o6] 0x11
loop_67:
	nop
	wr	%g0,	0x10,	%asi
	stba	%i2,	[%l7 + 0x59] %asi
	fbe,a	%fcc1,	loop_68
	brz	%o0,	loop_69
	edge32ln	%i3,	%l4,	%i7
	tvs	%icc,	0x1
loop_68:
	bge	%xcc,	loop_70
loop_69:
	edge8n	%l0,	%i1,	%o4
	smul	%i4,	0x170C,	%g6
	sll	%l3,	0x0E,	%g2
loop_70:
	lduh	[%l7 + 0x14],	%i0
	fble,a	%fcc0,	loop_71
	udiv	%l6,	0x1DC2,	%g1
	fcmpne16	%f10,	%f12,	%o7
	tsubcctv	%i6,	0x1C63,	%l2
loop_71:
	tpos	%xcc,	0x2
	bgu,a,pn	%xcc,	loop_72
	taddcc	%g7,	0x01BF,	%l5
	fmovsg	%xcc,	%f14,	%f4
	smulcc	%g4,	0x1289,	%o6
loop_72:
	srlx	%o5,	0x0C,	%o3
	fsrc2	%f18,	%f12
	alignaddr	%g5,	%o1,	%g3
	fornot2s	%f9,	%f19,	%f0
	bpos	loop_73
	ldsh	[%l7 + 0x08],	%l1
	taddcctv	%i5,	0x0FB6,	%o2
	addccc	%i2,	%i3,	%l4
loop_73:
	fandnot1	%f26,	%f18,	%f10
	movleu	%icc,	%o0,	%l0
	tsubcc	%i1,	%i7,	%o4
	sdiv	%i4,	0x0EE2,	%l3
	set	0x64, %g2
	sta	%f5,	[%l7 + %g2] 0x81
	alignaddr	%g6,	%i0,	%l6
	movrlz	%g2,	0x098,	%o7
	movrgez	%g1,	%i6,	%g7
	subccc	%l5,	%g4,	%l2
	srax	%o6,	0x08,	%o5
	edge32ln	%g5,	%o1,	%o3
	alignaddr	%g3,	%i5,	%o2
	xor	%l1,	%i2,	%l4
	fpadd16	%f16,	%f18,	%f18
	andn	%o0,	%l0,	%i1
	pdist	%f6,	%f4,	%f26
	brz,a	%i7,	loop_74
	smulcc	%o4,	0x0293,	%i3
	bge,pn	%icc,	loop_75
	fcmps	%fcc0,	%f22,	%f17
loop_74:
	fmovdle	%icc,	%f23,	%f16
	edge8n	%i4,	%g6,	%l3
loop_75:
	bn,pt	%icc,	loop_76
	edge32n	%l6,	%g2,	%i0
	tleu	%xcc,	0x6
	wr	%g0,	0x19,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
loop_76:
	tne	%xcc,	0x3
	orn	%g1,	0x1F55,	%i6
	movcs	%xcc,	%g7,	%l5
	tvc	%xcc,	0x2
	orcc	%o7,	%g4,	%l2
	sethi	0x1DD6,	%o5
	tleu	%icc,	0x6
	edge8l	%g5,	%o1,	%o6
	srax	%g3,	%i5,	%o3
	movvc	%icc,	%o2,	%i2
	movrgz	%l4,	%o0,	%l1
	array16	%l0,	%i1,	%o4
	smul	%i3,	%i7,	%g6
	fmovsl	%xcc,	%f11,	%f27
	fmovsl	%xcc,	%f21,	%f11
	te	%xcc,	0x7
	set	0x6E, %l4
	lduba	[%l7 + %l4] 0x80,	%i4
	tgu	%icc,	0x0
	edge16ln	%l6,	%g2,	%i0
	fmovrslz	%g1,	%f19,	%f28
	brlz	%l3,	loop_77
	move	%icc,	%i6,	%l5
	movle	%xcc,	%o7,	%g7
	set	0x0D, %i4
	ldstuba	[%l7 + %i4] 0x80,	%g4
loop_77:
	ld	[%l7 + 0x28],	%f30
	fnot2s	%f29,	%f31
	array32	%o5,	%g5,	%o1
	fnor	%f26,	%f0,	%f12
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbn,a	%fcc3,	loop_78
	orcc	%o6,	0x1AD0,	%l2
	fmovrdgz	%g3,	%f12,	%f10
	tsubcc	%o3,	0x064B,	%o2
loop_78:
	umul	%i2,	%l4,	%o0
	tge	%xcc,	0x0
	fnand	%f26,	%f12,	%f22
	fnegd	%f12,	%f14
	movl	%xcc,	%l1,	%i5
	alignaddr	%i1,	%o4,	%i3
	fmovsvc	%icc,	%f18,	%f4
	fbg	%fcc3,	loop_79
	smul	%l0,	0x1FF2,	%g6
	mulx	%i7,	%l6,	%g2
	nop
	set	0x2C, %o1
	sth	%i0,	[%l7 + %o1]
loop_79:
	tsubcctv	%g1,	0x1CA7,	%l3
	sdiv	%i6,	0x1E18,	%i4
	tn	%icc,	0x3
	fbn,a	%fcc2,	loop_80
	tg	%xcc,	0x4
	xnor	%l5,	0x1DDA,	%g7
	fnand	%f0,	%f26,	%f0
loop_80:
	pdist	%f6,	%f24,	%f12
	fmovsneg	%xcc,	%f15,	%f15
	fbl	%fcc0,	loop_81
	fbge	%fcc3,	loop_82
	fandnot2	%f24,	%f30,	%f0
	tgu	%xcc,	0x5
loop_81:
	movneg	%xcc,	%o7,	%g4
loop_82:
	movne	%xcc,	%o5,	%g5
	edge8n	%o6,	%l2,	%g3
	fmovdpos	%icc,	%f25,	%f3
	mova	%xcc,	%o1,	%o2
	wr	%g0,	0x11,	%asi
	lduwa	[%l7 + 0x08] %asi,	%o3
	addccc	%l4,	0x1166,	%i2
	fand	%f14,	%f10,	%f18
	wr	%g0,	0x0c,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	xnor	%l1,	%o0,	%i5
	mulx	%i1,	%i3,	%l0
	fxnor	%f20,	%f24,	%f10
	siam	0x1
	set	0x64, %g4
	ldswa	[%l7 + %g4] 0x19,	%o4
	andn	%g6,	%i7,	%g2
	fblg,a	%fcc0,	loop_83
	ldstub	[%l7 + 0x71],	%l6
	fexpand	%f6,	%f8
	tge	%xcc,	0x7
loop_83:
	addcc	%i0,	%g1,	%i6
	sub	%l3,	%i4,	%g7
	bpos,a	loop_84
	bneg	loop_85
	mulscc	%o7,	0x05B0,	%l5
	movcc	%xcc,	%o5,	%g4
loop_84:
	fbu,a	%fcc2,	loop_86
loop_85:
	fabss	%f4,	%f2
	fcmpne16	%f14,	%f28,	%o6
	edge32ln	%l2,	%g5,	%g3
loop_86:
	tneg	%xcc,	0x4
	addcc	%o1,	0x10F3,	%o2
	set	0x78, %o2
	ldxa	[%l7 + %o2] 0x15,	%o3
	fmovsa	%xcc,	%f3,	%f15
	te	%icc,	0x0
	umulcc	%l4,	0x1571,	%i2
	movpos	%xcc,	%l1,	%o0
	fcmps	%fcc0,	%f8,	%f1
	tgu	%xcc,	0x0
	or	%i5,	0x11E1,	%i1
	taddcc	%l0,	%o4,	%i3
	ldsh	[%l7 + 0x46],	%i7
	wr	%g0,	0x11,	%asi
	lduha	[%l7 + 0x2C] %asi,	%g6
	stbar
	sethi	0x0B2D,	%g2
	addc	%l6,	%g1,	%i0
	be,pt	%xcc,	loop_87
	and	%l3,	%i4,	%i6
	te	%icc,	0x4
	swap	[%l7 + 0x70],	%o7
loop_87:
	edge16l	%g7,	%o5,	%g4
	sra	%o6,	%l5,	%l2
	andncc	%g3,	%g5,	%o1
	udivx	%o2,	0x1B86,	%l4
	move	%icc,	%i2,	%l1
	movleu	%xcc,	%o0,	%i5
	bshuffle	%f26,	%f2,	%f4
	bpos,pn	%xcc,	loop_88
	movn	%xcc,	%i1,	%o3
	movge	%icc,	%l0,	%o4
	movrlez	%i3,	%i7,	%g2
loop_88:
	movl	%icc,	%g6,	%g1
	fbg	%fcc3,	loop_89
	move	%xcc,	%i0,	%l6
	fxnors	%f14,	%f7,	%f30
	flush	%l7 + 0x68
loop_89:
	smul	%l3,	0x0A1A,	%i6
	movn	%icc,	%i4,	%o7
	edge8n	%g7,	%g4,	%o5
	nop
	setx	loop_90,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fcmpgt16	%f28,	%f2,	%o6
	fandnot2s	%f19,	%f17,	%f2
	fmovsleu	%xcc,	%f17,	%f30
loop_90:
	fsrc1s	%f16,	%f8
	nop
	setx	loop_91,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	bleu,a,pn	%icc,	loop_92
	sdiv	%l5,	0x1EAC,	%g3
	bvs,a,pt	%icc,	loop_93
loop_91:
	nop
	setx	loop_94,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_92:
	fornot2s	%f27,	%f13,	%f8
	fmovdvc	%xcc,	%f24,	%f5
loop_93:
	ldub	[%l7 + 0x30],	%g5
loop_94:
	nop
	set	0x4C, %i1
	ldswa	[%l7 + %i1] 0x80,	%o1
	add	%l2,	%l4,	%o2
	alignaddrl	%i2,	%o0,	%l1
	fmuld8ulx16	%f30,	%f3,	%f2
	movvc	%xcc,	%i1,	%i5
	fornot2s	%f26,	%f17,	%f7
	edge8ln	%l0,	%o3,	%o4
	umulcc	%i3,	0x0E0A,	%i7
	mulscc	%g6,	%g1,	%g2
	bcc,a	loop_95
	fnegd	%f12,	%f22
	std	%f12,	[%l7 + 0x50]
	fbue,a	%fcc1,	loop_96
loop_95:
	movrgz	%l6,	%l3,	%i0
	sdivx	%i6,	0x0D92,	%i4
	movpos	%icc,	%o7,	%g4
loop_96:
	fpadd32	%f6,	%f14,	%f20
	movcc	%icc,	%g7,	%o6
	fmovrsgez	%o5,	%f12,	%f17
	subcc	%l5,	%g5,	%g3
	fandnot1s	%f10,	%f23,	%f3
	edge32l	%l2,	%o1,	%l4
	fbul,a	%fcc2,	loop_97
	movle	%xcc,	%o2,	%i2
	fpack32	%f2,	%f2,	%f8
	mulscc	%l1,	0x1714,	%o0
loop_97:
	nop
	wr	%g0,	0x19,	%asi
	ldstuba	[%l7 + 0x40] %asi,	%i5
	wr	%g0,	0x10,	%asi
	lduha	[%l7 + 0x08] %asi,	%l0
	nop
	setx loop_98, %l0, %l1
	jmpl %l1, %i1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srax	%o3,	0x0C,	%o4
	xnorcc	%i7,	0x14E7,	%g6
loop_98:
	nop
	wr	%g0,	0x80,	%asi
	lduba	[%l7 + 0x45] %asi,	%i3
	popc	0x126F,	%g2
	fcmpne32	%f18,	%f30,	%l6
	fcmpeq16	%f28,	%f20,	%g1
	ldd	[%l7 + 0x78],	%f4
	movrgez	%i0,	%i6,	%i4
	udiv	%o7,	0x047F,	%g4
	array32	%l3,	%o6,	%g7
	membar	0x4E
	fmovsge	%xcc,	%f6,	%f19
	movn	%icc,	%l5,	%o5
	udivcc	%g5,	0x0987,	%l2
	sethi	0x1DB1,	%o1
	tl	%xcc,	0x3
	tne	%xcc,	0x0
	tn	%icc,	0x7
	tn	%xcc,	0x4
	fsrc2s	%f28,	%f15
	movvs	%icc,	%g3,	%o2
	movgu	%xcc,	%l4,	%i2
	fmovsneg	%xcc,	%f14,	%f30
	swap	[%l7 + 0x54],	%o0
	movle	%icc,	%i5,	%l0
	umulcc	%l1,	%o3,	%o4
	addccc	%i1,	%i7,	%i3
	tne	%xcc,	0x7
	fcmped	%fcc1,	%f18,	%f12
	movleu	%icc,	%g2,	%g6
	set	0x78, %l2
	swapa	[%l7 + %l2] 0x10,	%g1
	tsubcc	%l6,	%i0,	%i6
	udiv	%i4,	0x01A9,	%o7
	fxnors	%f4,	%f8,	%f26
	fmovsl	%xcc,	%f28,	%f16
	fble,a	%fcc2,	loop_99
	fcmpes	%fcc1,	%f19,	%f4
	wr	%g0,	0x89,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
loop_99:
	swap	[%l7 + 0x58],	%l3
	andncc	%o6,	%g4,	%g7
	tsubcctv	%o5,	%l5,	%l2
	edge8ln	%o1,	%g3,	%g5
	st	%f29,	[%l7 + 0x10]
	sll	%l4,	%o2,	%o0
	tsubcctv	%i2,	0x0B51,	%i5
	taddcctv	%l0,	0x023F,	%l1
	movleu	%icc,	%o4,	%o3
	edge32	%i1,	%i7,	%i3
	sdiv	%g6,	0x0F7C,	%g1
	fands	%f28,	%f14,	%f5
	edge8ln	%g2,	%l6,	%i6
	ldd	[%l7 + 0x40],	%f14
	movre	%i4,	%o7,	%i0
	movge	%icc,	%l3,	%o6
	and	%g7,	0x196F,	%o5
	fmovrsgez	%l5,	%f6,	%f17
	edge16ln	%g4,	%o1,	%l2
	bleu,pt	%icc,	loop_100
	movrgez	%g5,	%l4,	%g3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x10,	%asi
	swapa	[%l7 + 0x78] %asi,	%o2
loop_100:
	faligndata	%f18,	%f0,	%f8
	movrgz	%i2,	%o0,	%l0
	brnz	%l1,	loop_101
	movrlez	%o4,	%i5,	%i1
	movn	%icc,	%i7,	%o3
	sir	0x1B53
loop_101:
	nop
	set	0x54, %g6
	lduba	[%l7 + %g6] 0x18,	%i3
	tsubcctv	%g6,	0x0A1B,	%g1
	tneg	%icc,	0x4
	movrgez	%g2,	0x36E,	%l6
	fmovrslz	%i4,	%f29,	%f11
	fand	%f28,	%f26,	%f28
	tgu	%xcc,	0x3
	nop
	setx loop_102, %l0, %l1
	jmpl %l1, %i6
	edge32n	%o7,	%i0,	%l3
	set	0x44, %g7
	ldstuba	[%l7 + %g7] 0x81,	%o6
loop_102:
	fpadd32	%f12,	%f20,	%f6
	faligndata	%f14,	%f0,	%f4
	fmovsvc	%icc,	%f26,	%f19
	andcc	%o5,	0x015F,	%g7
	fnot1s	%f20,	%f23
	edge8n	%l5,	%o1,	%g4
	fpsub16s	%f3,	%f27,	%f31
	swap	[%l7 + 0x38],	%g5
	ble,a	loop_103
	fones	%f29
	movrgz	%l2,	0x2AB,	%l4
	move	%icc,	%o2,	%g3
loop_103:
	addc	%i2,	%l0,	%o0
	bgu	loop_104
	movge	%xcc,	%o4,	%i5
	flush	%l7 + 0x40
	fbule	%fcc1,	loop_105
loop_104:
	brlez,a	%i1,	loop_106
	tle	%xcc,	0x1
	andncc	%l1,	%i7,	%o3
loop_105:
	te	%icc,	0x3
loop_106:
	bl	%icc,	loop_107
	orcc	%g6,	0x15AF,	%i3
	movge	%xcc,	%g2,	%l6
	movpos	%icc,	%i4,	%g1
loop_107:
	alignaddrl	%i6,	%i0,	%l3
	movgu	%icc,	%o6,	%o5
	fmovdle	%icc,	%f11,	%f19
	fmovdleu	%xcc,	%f17,	%f27
	movrlez	%o7,	%l5,	%o1
	ldx	[%l7 + 0x38],	%g7
	movcs	%icc,	%g5,	%l2
	fbul,a	%fcc3,	loop_108
	bg,a,pn	%icc,	loop_109
	mulscc	%g4,	%o2,	%g3
	ldx	[%l7 + 0x58],	%l4
loop_108:
	orn	%i2,	%l0,	%o0
loop_109:
	nop
	wr	%g0,	0x19,	%asi
	lda	[%l7 + 0x3C] %asi,	%f6
	brlz,a	%i5,	loop_110
	taddcc	%o4,	%l1,	%i7
	brgez,a	%i1,	loop_111
	umul	%o3,	%g6,	%g2
loop_110:
	fbul,a	%fcc2,	loop_112
	movrgez	%l6,	0x0A0,	%i4
loop_111:
	fcmpes	%fcc3,	%f17,	%f20
	movrgz	%i3,	0x379,	%i6
loop_112:
	subc	%g1,	0x0FD6,	%l3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subcc	%o6,	0x177F,	%o5
	sub	%o7,	%i0,	%l5
	fmovsleu	%icc,	%f4,	%f14
	fmovdne	%icc,	%f14,	%f5
	sub	%o1,	0x013D,	%g5
	membar	0x45
	movpos	%xcc,	%l2,	%g4
	ld	[%l7 + 0x54],	%f1
	tge	%xcc,	0x1
	edge8ln	%o2,	%g3,	%g7
	movre	%i2,	0x08A,	%l4
	fcmpne32	%f2,	%f10,	%o0
	flush	%l7 + 0x50
	set	0x6E, %l3
	stha	%l0,	[%l7 + %l3] 0x19
	fxnor	%f6,	%f6,	%f2
	set	0x54, %l6
	lda	[%l7 + %l6] 0x88,	%f5
	fmovsn	%icc,	%f23,	%f3
	tle	%icc,	0x6
	movrgz	%o4,	%l1,	%i7
	fbn,a	%fcc0,	loop_113
	fpadd16	%f22,	%f12,	%f22
	smulcc	%i1,	0x1E67,	%i5
	edge8l	%g6,	%o3,	%g2
loop_113:
	movcc	%icc,	%l6,	%i3
	fcmped	%fcc2,	%f16,	%f14
	ta	%icc,	0x0
	subccc	%i6,	0x1029,	%i4
	xnorcc	%g1,	0x1D16,	%l3
	tne	%xcc,	0x3
	tleu	%icc,	0x2
	prefetch	[%l7 + 0x14],	 0x3
	set	0x44, %l0
	sta	%f4,	[%l7 + %l0] 0x14
	andcc	%o6,	%o7,	%i0
	wr	%g0,	0x80,	%asi
	lda	[%l7 + 0x14] %asi,	%f15
	bvs,a,pn	%icc,	loop_114
	addccc	%l5,	0x1C75,	%o1
	xorcc	%g5,	%o5,	%l2
	tle	%icc,	0x6
loop_114:
	edge8ln	%o2,	%g3,	%g4
	fsrc2	%f4,	%f28
	udivx	%i2,	0x06FD,	%l4
	sethi	0x01BB,	%g7
	addccc	%o0,	%o4,	%l0
	srlx	%i7,	%l1,	%i5
	movre	%i1,	0x067,	%o3
	pdist	%f20,	%f30,	%f26
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mova	%icc,	%g2,	%g6
	wr	%g0,	0x10,	%asi
	ldsha	[%l7 + 0x10] %asi,	%l6
	fandnot1s	%f9,	%f30,	%f23
	edge32n	%i6,	%i3,	%g1
	tvs	%icc,	0x4
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
	set	0x50, %i5
	swapa	[%l7 + %i5] 0x80,	%l3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsge	%xcc,	%f9,	%f20
	mulx	%o6,	0x0CB8,	%o7
	or	%i0,	%i4,	%o1
	brz	%l5,	loop_115
	fmovdvc	%icc,	%f3,	%f2
	movrlez	%g5,	%l2,	%o5
	nop
	setx loop_116, %l0, %l1
	jmpl %l1, %o2
loop_115:
	bneg,a	loop_117
	tcc	%icc,	0x7
	udiv	%g4,	0x0862,	%g3
loop_116:
	movpos	%icc,	%i2,	%g7
loop_117:
	faligndata	%f30,	%f6,	%f6
	sir	0x0C09
	addccc	%o0,	0x1FE2,	%l4
	edge8l	%l0,	%o4,	%l1
	ld	[%l7 + 0x3C],	%f30
	call	loop_118
	fmovrsne	%i5,	%f0,	%f12
	array8	%i1,	%o3,	%g2
	te	%icc,	0x0
loop_118:
	edge8	%i7,	%l6,	%g6
	wr	%g0,	0x80,	%asi
	swapa	[%l7 + 0x28] %asi,	%i3
	tcs	%icc,	0x2
	fmovdg	%xcc,	%f27,	%f24
	fbo	%fcc3,	loop_119
	bcs,a	loop_120
	andncc	%i6,	%g1,	%o6
	fpsub32s	%f11,	%f12,	%f13
loop_119:
	andn	%o7,	0x09AA,	%i0
loop_120:
	fnegd	%f18,	%f28
	set	0x08, %g1
	ldxa	[%l7 + %g1] 0x0c,	%i4
	fsrc1	%f18,	%f30
	movgu	%icc,	%o1,	%l5
	alignaddrl	%g5,	%l2,	%l3
	array32	%o2,	%g4,	%g3
	tg	%xcc,	0x3
	popc	%i2,	%g7
	membar	#Sync
	set	0x40, %i2
	ldda	[%l7 + %i2] 0x1f,	%f0
	fbul	%fcc2,	loop_121
	xnorcc	%o5,	%l4,	%o0
	prefetch	[%l7 + 0x30],	 0x0
	xor	%o4,	0x156D,	%l1
loop_121:
	udivx	%l0,	0x146A,	%i5
	tcc	%xcc,	0x1
	movle	%icc,	%i1,	%g2
	fmovdle	%icc,	%f18,	%f21
	edge32ln	%o3,	%l6,	%g6
	fbne	%fcc1,	loop_122
	brgz	%i7,	loop_123
	bg,a	%xcc,	loop_124
	orncc	%i6,	%g1,	%i3
loop_122:
	fbu,a	%fcc2,	loop_125
loop_123:
	be,a	loop_126
loop_124:
	alignaddrl	%o6,	%i0,	%o7
	movn	%icc,	%i4,	%l5
loop_125:
	edge32ln	%g5,	%o1,	%l2
loop_126:
	std	%f2,	[%l7 + 0x20]
	tneg	%xcc,	0x7
	add	%o2,	%g4,	%g3
	set	0x40, %l5
	ldda	[%l7 + %l5] 0x04,	%f16
	fbo,a	%fcc3,	loop_127
	movle	%icc,	%l3,	%i2
	xorcc	%g7,	%l4,	%o0
	set	0x1d0, %l1
	nop 	! 	nop 	! 	ldxa	[%g0 + %l1] 0x40,	%o4 ripped by fixASI40.pl ripped by fixASI40.pl
loop_127:
	edge16n	%o5,	%l1,	%i5
	orn	%l0,	%g2,	%i1
	tcs	%xcc,	0x5
	movge	%icc,	%o3,	%g6
	fbu,a	%fcc0,	loop_128
	sra	%i7,	0x0D,	%i6
	xnorcc	%g1,	0x143F,	%i3
	fbule	%fcc2,	loop_129
loop_128:
	srax	%l6,	%o6,	%i0
	movg	%icc,	%i4,	%l5
	taddcc	%o7,	%o1,	%l2
loop_129:
	fble	%fcc3,	loop_130
	srax	%o2,	%g4,	%g5
	fandnot1	%f6,	%f16,	%f24
	tcs	%icc,	0x6
loop_130:
	fble,a	%fcc3,	loop_131
	movl	%xcc,	%g3,	%i2
	taddcc	%l3,	%l4,	%o0
	move	%icc,	%o4,	%g7
loop_131:
	mova	%icc,	%l1,	%o5
	sllx	%i5,	%g2,	%i1
	subccc	%l0,	0x0981,	%o3
	fmovsge	%xcc,	%f0,	%f24
	fbne	%fcc2,	loop_132
	udiv	%i7,	0x1F41,	%i6
	addccc	%g6,	0x0DC7,	%i3
	tle	%xcc,	0x2
loop_132:
	brz	%l6,	loop_133
	alignaddr	%o6,	%i0,	%i4
	add	%l7,	0x40,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%l5
	casa	[%l6] 0x89,	%l5,	%g1
loop_133:
	movg	%icc,	%o1,	%l2
	sra	%o7,	%g4,	%o2
	movg	%icc,	%g3,	%i2
	udivcc	%l3,	0x0934,	%g5
	movvc	%icc,	%l4,	%o4
	tn	%icc,	0x7
	xnorcc	%o0,	0x075E,	%g7
	sllx	%l1,	0x07,	%i5
	movpos	%icc,	%o5,	%g2
	subcc	%l0,	0x01A3,	%i1
	ldsb	[%l7 + 0x78],	%o3
	add	%i6,	%g6,	%i7
	sll	%l6,	%o6,	%i0
	tleu	%xcc,	0x5
	tsubcctv	%i4,	%l5,	%g1
	bne	%icc,	loop_134
	umulcc	%o1,	0x04EB,	%l2
	array8	%o7,	%g4,	%i3
	stw	%o2,	[%l7 + 0x38]
loop_134:
	fba	%fcc0,	loop_135
	fsrc1	%f22,	%f26
	subc	%i2,	0x1AFF,	%l3
	addccc	%g5,	%g3,	%l4
loop_135:
	movgu	%xcc,	%o4,	%g7
	fmovrslz	%l1,	%f13,	%f29
	add	%l7,	0x30,	%l6
	wr	%g0,	0x19,	%asi
	ldxa	[%l6] %asi,	%o0
	casxa	[%l6] 0x19,	%o0,	%i5
	udivcc	%g2,	0x1781,	%o5
	membar	0x50
	fandnot1s	%f4,	%f11,	%f30
	sub	%i1,	%o3,	%l0
	tvs	%xcc,	0x7
	tsubcc	%i6,	0x0F36,	%g6
	fmovrdlez	%i7,	%f8,	%f0
	ldx	[%l7 + 0x30],	%o6
	movcs	%icc,	%l6,	%i4
	srlx	%l5,	%i0,	%g1
	alignaddr	%o1,	%o7,	%g4
	add	%l7,	0x78,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] %asi,	%l2,	%o2
	tpos	%xcc,	0x0
	fmovrde	%i3,	%f18,	%f6
	edge32ln	%i2,	%l3,	%g5
	taddcctv	%g3,	%o4,	%g7
	lduw	[%l7 + 0x78],	%l1
	sir	0x1D2E
	umulcc	%l4,	%o0,	%i5
	movpos	%icc,	%o5,	%g2
	andcc	%o3,	0x0A73,	%l0
	sdivcc	%i6,	0x0A64,	%i1
	fands	%f22,	%f19,	%f2
	fcmpes	%fcc3,	%f9,	%f22
	movrne	%g6,	0x0EC,	%o6
	fors	%f28,	%f7,	%f16
	fmovdvc	%icc,	%f4,	%f24
	fcmpd	%fcc1,	%f12,	%f18
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stw	%l6,	[%l7 + 0x68]
	bneg	%xcc,	loop_136
	faligndata	%f12,	%f30,	%f0
	tn	%xcc,	0x5
	fmovdleu	%icc,	%f25,	%f2
loop_136:
	fba	%fcc1,	loop_137
	tn	%xcc,	0x3
	brlez	%i7,	loop_138
	add	%l5,	%i4,	%i0
loop_137:
	fsrc2s	%f10,	%f12
	bgu,a	%icc,	loop_139
loop_138:
	smul	%o1,	%o7,	%g1
	srlx	%g4,	%o2,	%i3
	andcc	%l2,	0x1629,	%i2
loop_139:
	fabsd	%f6,	%f0
	fmovdcs	%icc,	%f23,	%f29
	fpadd32s	%f10,	%f7,	%f9
	bcc,a	loop_140
	mulscc	%g5,	0x0CAF,	%l3
	taddcc	%g3,	%o4,	%l1
	std	%f30,	[%l7 + 0x10]
loop_140:
	srl	%g7,	%l4,	%i5
	te	%xcc,	0x2
	subc	%o5,	0x17B1,	%o0
	subccc	%o3,	%g2,	%l0
	bge,a	%icc,	loop_141
	ble,a	%icc,	loop_142
	add	%i1,	%g6,	%o6
	andcc	%l6,	0x0E57,	%i7
loop_141:
	movre	%i6,	%i4,	%i0
loop_142:
	xor	%o1,	0x17B8,	%l5
	add	%g1,	%g4,	%o2
	or	%o7,	%l2,	%i2
	fpsub32	%f22,	%f14,	%f2
	brgz,a	%g5,	loop_143
	tleu	%xcc,	0x2
	wr	%g0,	0x10,	%asi
	ldstuba	[%l7 + 0x46] %asi,	%l3
loop_143:
	subc	%i3,	0x1767,	%g3
	movgu	%xcc,	%l1,	%o4
	fbue	%fcc0,	loop_144
	tge	%icc,	0x4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movl	%xcc,	%l4,	%g7
loop_144:
	st	%f29,	[%l7 + 0x60]
	srl	%o5,	%i5,	%o0
	tneg	%xcc,	0x1
	fbue	%fcc0,	loop_145
	sllx	%g2,	0x08,	%o3
	array16	%l0,	%g6,	%i1
	fornot1	%f0,	%f4,	%f18
loop_145:
	fxor	%f8,	%f30,	%f14
	alignaddr	%o6,	%i7,	%i6
	srax	%i4,	0x09,	%l6
	nop
	set	0x38, %i6
	prefetch	[%l7 + %i6],	 0x2
	stx	%o1,	[%l7 + 0x68]
	edge32	%l5,	%g1,	%g4
	tl	%icc,	0x1
	set	0x20, %o7
	prefetcha	[%l7 + %o7] 0x10,	 0x3
	stx	%i0,	[%l7 + 0x40]
	fxnor	%f10,	%f18,	%f20
	fba,a	%fcc2,	loop_146
	fbuge	%fcc1,	loop_147
	udivcc	%o7,	0x0BCF,	%l2
	edge8n	%i2,	%l3,	%i3
loop_146:
	movrlez	%g3,	0x34B,	%l1
loop_147:
	fpadd16	%f16,	%f24,	%f0
	te	%xcc,	0x6
	fbn	%fcc1,	loop_148
	addc	%g5,	%l4,	%g7
	smul	%o5,	0x0A0B,	%i5
	orn	%o0,	0x143F,	%o4
loop_148:
	movl	%icc,	%o3,	%g2
	fnors	%f24,	%f5,	%f0
	edge32n	%l0,	%g6,	%i1
	fbo,a	%fcc1,	loop_149
	fbue	%fcc2,	loop_150
	movg	%xcc,	%i7,	%o6
	array32	%i4,	%i6,	%l6
loop_149:
	brnz,a	%l5,	loop_151
loop_150:
	bneg,a,pt	%xcc,	loop_152
	popc	0x1C93,	%g1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_151:
	flush	%l7 + 0x08
loop_152:
	movcc	%icc,	%o1,	%o2
	set	0x40, %o5
	stda	%f0,	[%l7 + %o5] 0x1e
	membar	#Sync
	tne	%icc,	0x2
	membar	#Sync
	set	0x40, %i0
	ldda	[%l7 + %i0] 0xf0,	%f16
	bne,pn	%xcc,	loop_153
	xorcc	%i0,	0x091E,	%o7
	fmul8x16au	%f29,	%f4,	%f14
	siam	0x2
loop_153:
	tne	%xcc,	0x2
	fcmpne16	%f6,	%f24,	%g4
	ldx	[%l7 + 0x08],	%i2
	movneg	%icc,	%l3,	%i3
	edge8l	%l2,	%l1,	%g3
	tl	%icc,	0x6
	membar	0x38
	wr	%g0,	0x80,	%asi
	ldsba	[%l7 + 0x6C] %asi,	%l4
	subcc	%g5,	%g7,	%o5
	tcc	%xcc,	0x3
	andn	%i5,	0x11EA,	%o4
	ba,a	loop_154
	ldx	[%l7 + 0x28],	%o3
	movrlez	%o0,	0x0B8,	%g2
	tsubcctv	%l0,	0x041B,	%g6
loop_154:
	ldsw	[%l7 + 0x14],	%i1
	orcc	%o6,	%i7,	%i6
	movne	%xcc,	%i4,	%l5
	edge8n	%g1,	%o1,	%l6
	wr	%g0,	0x04,	%asi
	sta	%f9,	[%l7 + 0x18] %asi
	fmovde	%icc,	%f16,	%f19
	tpos	%xcc,	0x4
	tle	%xcc,	0x4
	xnorcc	%i0,	%o7,	%g4
	umul	%i2,	0x1184,	%o2
	tgu	%icc,	0x2
	fmovdvs	%icc,	%f9,	%f0
	fmovdle	%xcc,	%f11,	%f12
	tgu	%xcc,	0x5
	fbul	%fcc3,	loop_155
	fmovrdlz	%i3,	%f26,	%f8
	wr	%g0,	0x11,	%asi
	ldswa	[%l7 + 0x1C] %asi,	%l3
loop_155:
	tvc	%xcc,	0x6
	tn	%xcc,	0x2
	udivcc	%l2,	0x0D66,	%g3
	tge	%icc,	0x4
	array8	%l4,	%l1,	%g7
	movrlz	%o5,	%g5,	%o4
	tn	%icc,	0x6
	xnor	%i5,	0x0375,	%o3
	fsrc2s	%f20,	%f12
	sll	%o0,	0x10,	%l0
	andcc	%g6,	%i1,	%g2
	movcc	%xcc,	%i7,	%o6
	stw	%i6,	[%l7 + 0x64]
	fmovd	%f10,	%f0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sir	0x0AB3
	umul	%l5,	%g1,	%i4
	movrne	%l6,	0x1AD,	%o1
	nop
	setx loop_156, %l0, %l1
	jmpl %l1, %o7
	udivx	%g4,	0x0C25,	%i0
	alignaddrl	%o2,	%i2,	%i3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_156:
	movne	%icc,	%l3,	%g3
	fpadd16	%f28,	%f18,	%f22
	tcs	%xcc,	0x5
	ldd	[%l7 + 0x38],	%f22
	sub	%l4,	0x0677,	%l2
	wr	%g0,	0xea,	%asi
	stha	%l1,	[%l7 + 0x66] %asi
	membar	#Sync
	edge32ln	%g7,	%o5,	%g5
	addccc	%i5,	%o4,	%o3
	movn	%xcc,	%l0,	%o0
	fmovdpos	%icc,	%f7,	%f2
	tvs	%icc,	0x2
	edge32	%g6,	%g2,	%i1
	edge16ln	%i7,	%o6,	%i6
	movpos	%xcc,	%g1,	%l5
	addcc	%l6,	0x0867,	%o1
	movg	%xcc,	%i4,	%g4
	fbul	%fcc2,	loop_157
	smul	%o7,	%i0,	%o2
	membar	0x3C
	sra	%i2,	%i3,	%l3
loop_157:
	bvs,pn	%xcc,	loop_158
	fors	%f20,	%f10,	%f19
	nop
	set	0x20, %o0
	sth	%l4,	[%l7 + %o0]
	movleu	%icc,	%g3,	%l2
loop_158:
	fmovrdlz	%g7,	%f2,	%f28
	tsubcctv	%l1,	%g5,	%o5
	brgez	%o4,	loop_159
	fnor	%f10,	%f0,	%f10
	tgu	%xcc,	0x3
	st	%f27,	[%l7 + 0x10]
loop_159:
	movl	%xcc,	%o3,	%l0
	brlz	%o0,	loop_160
	ldsw	[%l7 + 0x78],	%g6
	edge16	%i5,	%i1,	%i7
	set	0x79, %o3
	ldstuba	[%l7 + %o3] 0x10,	%o6
loop_160:
	sdivx	%i6,	0x0107,	%g1
	fexpand	%f28,	%f30
	fbl	%fcc2,	loop_161
	addccc	%l5,	0x123D,	%l6
	lduw	[%l7 + 0x74],	%o1
	andcc	%g2,	%g4,	%i4
loop_161:
	tsubcctv	%i0,	%o2,	%o7
	fzeros	%f27
	mulscc	%i2,	%i3,	%l3
	brlez	%l4,	loop_162
	fornot2	%f22,	%f6,	%f0
	movre	%g3,	%l2,	%g7
	umulcc	%g5,	0x1124,	%o5
loop_162:
	fble	%fcc3,	loop_163
	tsubcctv	%o4,	0x11DF,	%o3
	fpadd16	%f14,	%f28,	%f12
	sir	0x100E
loop_163:
	stb	%l1,	[%l7 + 0x1E]
	fblg	%fcc1,	loop_164
	fbn,a	%fcc0,	loop_165
	edge16l	%o0,	%l0,	%i5
	membar	0x15
loop_164:
	bcc,a	%xcc,	loop_166
loop_165:
	sdivcc	%i1,	0x0274,	%i7
	fbl	%fcc1,	loop_167
	stbar
loop_166:
	bge	loop_168
	fxnors	%f31,	%f4,	%f0
loop_167:
	mulx	%g6,	0x15B2,	%o6
	tvs	%xcc,	0x7
loop_168:
	subcc	%i6,	%g1,	%l6
	xnorcc	%o1,	%g2,	%l5
	fmovdleu	%xcc,	%f29,	%f27
	tvs	%icc,	0x7
	udivcc	%i4,	0x0B98,	%g4
	and	%o2,	%i0,	%i2
	ba,a,pt	%icc,	loop_169
	fpack32	%f4,	%f0,	%f14
	set	0x1E, %i3
	ldsha	[%l7 + %i3] 0x89,	%i3
loop_169:
	ble,a	%xcc,	loop_170
	edge32ln	%l3,	%o7,	%l4
	movge	%icc,	%l2,	%g7
	brz	%g3,	loop_171
loop_170:
	edge32n	%o5,	%g5,	%o3
	tleu	%icc,	0x5
	srax	%o4,	%o0,	%l1
loop_171:
	smul	%l0,	0x0B2C,	%i5
	fnors	%f20,	%f22,	%f3
	andcc	%i7,	0x048C,	%i1
	fmovrde	%o6,	%f26,	%f20
	mova	%xcc,	%i6,	%g1
	sethi	0x17F3,	%l6
	mulx	%g6,	0x04CD,	%o1
	fxors	%f16,	%f15,	%f21
	sdivx	%l5,	0x18C0,	%g2
	edge8n	%i4,	%g4,	%i0
	fmovsa	%icc,	%f4,	%f15
	wr	%g0,	0x0c,	%asi
	lda	[%l7 + 0x60] %asi,	%f25
	popc	0x0B8E,	%i2
	edge8n	%i3,	%o2,	%l3
	taddcctv	%o7,	0x1792,	%l4
	fmovrslz	%l2,	%f22,	%f16
	tcc	%xcc,	0x1
	edge8ln	%g3,	%o5,	%g5
	udiv	%o3,	0x0A24,	%g7
	movcc	%xcc,	%o4,	%l1
	movpos	%xcc,	%l0,	%i5
	movg	%icc,	%o0,	%i1
	taddcc	%i7,	0x08E9,	%i6
	edge16l	%o6,	%g1,	%l6
	bvc,a	%icc,	loop_172
	fbge	%fcc2,	loop_173
	fpadd16s	%f1,	%f3,	%f21
	be,pn	%xcc,	loop_174
loop_172:
	movpos	%xcc,	%g6,	%l5
loop_173:
	fmovsn	%xcc,	%f8,	%f23
	fcmpeq32	%f24,	%f16,	%o1
loop_174:
	edge16n	%i4,	%g2,	%i0
	fmovsg	%icc,	%f9,	%f30
	fmuld8sux16	%f14,	%f27,	%f26
	fmovsge	%icc,	%f5,	%f28
	nop
	setx	loop_175,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fmovrdlez	%i2,	%f14,	%f26
	nop
	setx	loop_176,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	nop
	setx loop_177, %l0, %l1
	jmpl %l1, %i3
loop_175:
	lduw	[%l7 + 0x30],	%o2
	fandnot2s	%f0,	%f8,	%f5
loop_176:
	fbg,a	%fcc1,	loop_178
loop_177:
	tsubcc	%l3,	%g4,	%o7
	be,a	loop_179
	movle	%xcc,	%l4,	%l2
loop_178:
	orncc	%g3,	0x054A,	%g5
	ldd	[%l7 + 0x28],	%f26
loop_179:
	tsubcctv	%o3,	%g7,	%o5
	set	0x40, %i7
	stda	%f0,	[%l7 + %i7] 0x17
	membar	#Sync
	bne,pn	%icc,	loop_180
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x80,	%asi
	stha	%o4,	[%l7 + 0x38] %asi
loop_180:
	nop
	wr	%g0,	0x89,	%asi
	stwa	%l1,	[%l7 + 0x14] %asi
	movre	%l0,	%o0,	%i5
	fpsub32	%f20,	%f18,	%f6
	fmovsleu	%xcc,	%f28,	%f7
	fmovrdgez	%i1,	%f24,	%f30
	movrgz	%i6,	%o6,	%g1
	tge	%icc,	0x3
	add	%l7,	0x10,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%i7,	%l6
	xnorcc	%g6,	0x1FCC,	%o1
	ble,a,pt	%xcc,	loop_181
	movg	%xcc,	%l5,	%i4
	fbge	%fcc2,	loop_182
	subcc	%g2,	%i0,	%i3
loop_181:
	sdiv	%o2,	0x1B8F,	%i2
	tgu	%icc,	0x3
loop_182:
	tvc	%xcc,	0x1
	fnand	%f22,	%f24,	%f8
	bge,a,pn	%xcc,	loop_183
	tle	%icc,	0x0
	fbl	%fcc3,	loop_184
	mova	%icc,	%l3,	%o7
loop_183:
	bcc	%icc,	loop_185
	umulcc	%l4,	%g4,	%l2
loop_184:
	fmovspos	%xcc,	%f13,	%f13
	movg	%icc,	%g3,	%o3
loop_185:
	st	%f16,	[%l7 + 0x40]
	fone	%f8
	bl	loop_186
	andcc	%g7,	0x0999,	%o5
	flush	%l7 + 0x58
	bg,a,pt	%icc,	loop_187
loop_186:
	tcc	%icc,	0x6
	tvc	%icc,	0x0
	fbul,a	%fcc2,	loop_188
loop_187:
	fmovrdlz	%g5,	%f26,	%f18
	alignaddrl	%l1,	%l0,	%o4
	fpadd32	%f2,	%f0,	%f10
loop_188:
	fble,a	%fcc0,	loop_189
	fmovrslez	%i5,	%f12,	%f17
	edge32n	%i1,	%i6,	%o6
	movne	%xcc,	%o0,	%g1
loop_189:
	edge16	%l6,	%g6,	%o1
	brz	%i7,	loop_190
	fsrc1	%f28,	%f26
	mulscc	%i4,	0x11F6,	%l5
	edge16l	%i0,	%i3,	%o2
loop_190:
	udivx	%i2,	0x1C8E,	%l3
	xor	%o7,	%g2,	%l4
	fmul8x16au	%f1,	%f16,	%f18
	ba,a	%icc,	loop_191
	movl	%icc,	%l2,	%g4
	fpadd16s	%f5,	%f20,	%f4
	addccc	%o3,	%g7,	%o5
loop_191:
	sdivx	%g3,	0x1F63,	%l1
	movle	%xcc,	%l0,	%o4
	fmovdl	%xcc,	%f6,	%f30
	brlz,a	%g5,	loop_192
	bcs,pt	%xcc,	loop_193
	fcmpeq16	%f22,	%f10,	%i1
	edge32	%i6,	%i5,	%o0
loop_192:
	mova	%xcc,	%g1,	%l6
loop_193:
	ld	[%l7 + 0x78],	%f19
	wr	%g0,	0x88,	%asi
	stxa	%o6,	[%l7 + 0x20] %asi
	tsubcc	%g6,	0x0264,	%o1
	wr	%g0,	0x10,	%asi
	ldxa	[%l7 + 0x78] %asi,	%i4
	taddcctv	%i7,	0x1A85,	%i0
	orcc	%i3,	%l5,	%i2
	fnors	%f14,	%f9,	%f7
	wr	%g0,	0x18,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	subccc	%l3,	%o7,	%g2
	fmovdcs	%icc,	%f11,	%f12
	sub	%l4,	%l2,	%o2
	tvc	%icc,	0x5
	std	%f2,	[%l7 + 0x60]
	sdivx	%o3,	0x1F02,	%g7
	wr	%g0,	0x1e,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
	udiv	%g4,	0x0C1A,	%g3
	movrgez	%l1,	0x186,	%o5
	alignaddr	%l0,	%o4,	%i1
	tn	%icc,	0x6
	edge8l	%g5,	%i5,	%o0
	fmovsge	%icc,	%f31,	%f28
	srax	%i6,	0x11,	%l6
	movcs	%icc,	%g1,	%o6
	movrlz	%o1,	0x124,	%g6
	fbg	%fcc3,	loop_194
	bshuffle	%f12,	%f12,	%f12
	stbar
	movrgz	%i4,	%i0,	%i3
loop_194:
	edge32n	%i7,	%l5,	%l3
	fmovsn	%xcc,	%f7,	%f29
	fmovdl	%icc,	%f23,	%f8
	ldd	[%l7 + 0x10],	%i2
	lduw	[%l7 + 0x24],	%o7
	nop
	setx loop_195, %l0, %l1
	jmpl %l1, %g2
	mulx	%l2,	%l4,	%o3
	tgu	%icc,	0x6
	wr	%g0,	0xf9,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
loop_195:
	movle	%icc,	%o2,	%g7
	edge32ln	%g4,	%g3,	%l1
	te	%icc,	0x1
	subc	%l0,	%o4,	%i1
	movl	%icc,	%g5,	%i5
	subc	%o5,	%i6,	%l6
	fnands	%f23,	%f21,	%f7
	fmovsg	%icc,	%f18,	%f8
	movrlz	%o0,	%o6,	%g1
	movl	%icc,	%o1,	%i4
	ldd	[%l7 + 0x28],	%f6
	taddcctv	%i0,	0x085A,	%i3
	set	0x38, %g3
	ldswa	[%l7 + %g3] 0x88,	%g6
	movl	%xcc,	%l5,	%l3
	set	0x38, %o4
	stha	%i7,	[%l7 + %o4] 0x80
	brgz,a	%i2,	loop_196
	fcmpgt16	%f4,	%f2,	%o7
	addc	%g2,	%l4,	%o3
	fmovrslz	%o2,	%f11,	%f1
loop_196:
	udivx	%g7,	0x0ABA,	%g4
	movrlz	%g3,	%l2,	%l1
	subcc	%o4,	%l0,	%i1
	fmovscs	%xcc,	%f1,	%f29
	bne	%xcc,	loop_197
	udivx	%g5,	0x0785,	%i5
	taddcctv	%o5,	0x14F8,	%i6
	srax	%l6,	0x1C,	%o6
loop_197:
	ldstub	[%l7 + 0x5F],	%o0
	and	%o1,	0x0576,	%g1
	move	%icc,	%i0,	%i3
	fmovsa	%icc,	%f31,	%f24
	fcmpeq16	%f28,	%f10,	%g6
	brlez	%l5,	loop_198
	fmovrslz	%l3,	%f19,	%f21
	addc	%i4,	%i7,	%o7
	movrlz	%i2,	%l4,	%g2
loop_198:
	fandnot2s	%f22,	%f7,	%f13
	sdivcc	%o3,	0x128A,	%o2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	taddcc	%g4,	%g3,	%g7
	smul	%l1,	0x1577,	%o4
	fmovsne	%icc,	%f4,	%f3
	edge16l	%l0,	%i1,	%l2
	movrlez	%g5,	0x0D7,	%i5
	movl	%xcc,	%o5,	%l6
	movcc	%icc,	%o6,	%o0
	tneg	%xcc,	0x7
	bcs,a,pn	%icc,	loop_199
	ldsh	[%l7 + 0x34],	%o1
	bcc,pn	%icc,	loop_200
	srax	%i6,	%i0,	%g1
loop_199:
	movg	%icc,	%i3,	%g6
	brz	%l5,	loop_201
loop_200:
	sllx	%l3,	0x01,	%i7
	addcc	%o7,	%i2,	%l4
	prefetch	[%l7 + 0x30],	 0x0
loop_201:
	nop
	setx loop_202, %l0, %l1
	jmpl %l1, %g2
	subc	%i4,	%o2,	%o3
	alignaddr	%g3,	%g4,	%l1
	fmovdpos	%icc,	%f10,	%f15
loop_202:
	fbue,a	%fcc0,	loop_203
	nop
	set	0x34, %g5
	prefetch	[%l7 + %g5],	 0x1
	stbar
	tl	%icc,	0x3
loop_203:
	edge32l	%g7,	%o4,	%i1
	edge16n	%l0,	%g5,	%l2
	edge32l	%o5,	%i5,	%o6
	edge32n	%l6,	%o1,	%i6
	fabss	%f0,	%f25
	te	%xcc,	0x4
	alignaddrl	%o0,	%i0,	%i3
	fmovdcs	%xcc,	%f31,	%f28
	swap	[%l7 + 0x7C],	%g1
	fxnors	%f5,	%f13,	%f17
	bpos	%xcc,	loop_204
	faligndata	%f20,	%f10,	%f22
	ba	loop_205
	alignaddr	%g6,	%l5,	%i7
loop_204:
	udivx	%o7,	0x135E,	%i2
	fpsub16s	%f3,	%f30,	%f30
loop_205:
	membar	0x4B
	or	%l4,	%l3,	%i4
	edge16ln	%o2,	%g2,	%o3
	fmul8x16al	%f21,	%f2,	%f10
	fbne,a	%fcc3,	loop_206
	movneg	%xcc,	%g4,	%g3
	edge8ln	%l1,	%o4,	%i1
	stbar
loop_206:
	edge8	%l0,	%g7,	%l2
	lduw	[%l7 + 0x0C],	%g5
	ldsw	[%l7 + 0x70],	%o5
	fandnot1	%f26,	%f2,	%f16
	sdivx	%o6,	0x1F5E,	%i5
	movrlz	%o1,	0x09B,	%l6
	fands	%f17,	%f26,	%f30
	ldsw	[%l7 + 0x7C],	%o0
	te	%icc,	0x5
	fpsub32s	%f1,	%f24,	%f21
	movcc	%xcc,	%i6,	%i3
	fnot2s	%f8,	%f17
	movrgez	%i0,	%g6,	%g1
	edge16l	%i7,	%o7,	%i2
	or	%l5,	0x126C,	%l4
	fcmpeq32	%f4,	%f6,	%i4
	udiv	%o2,	0x0372,	%g2
	fnors	%f3,	%f16,	%f20
	wr	%g0,	0x1f,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
	fcmped	%fcc2,	%f8,	%f28
	fbg,a	%fcc2,	loop_207
	orncc	%l3,	%g4,	%g3
	tpos	%xcc,	0x1
	wr	%g0,	0x89,	%asi
	ldswa	[%l7 + 0x50] %asi,	%l1
loop_207:
	alignaddr	%o4,	%i1,	%o3
	fmovdcc	%xcc,	%f8,	%f24
	addccc	%g7,	%l0,	%l2
	fblg	%fcc3,	loop_208
	tgu	%icc,	0x1
	fmovsvc	%xcc,	%f17,	%f27
	movge	%xcc,	%o5,	%o6
loop_208:
	fnor	%f22,	%f30,	%f22
	edge32n	%i5,	%o1,	%g5
	tg	%icc,	0x0
	movvs	%icc,	%o0,	%l6
	fcmpd	%fcc2,	%f10,	%f28
	bvs,a	%icc,	loop_209
	fmovscc	%icc,	%f5,	%f12
	movrgez	%i6,	0x12E,	%i3
	edge32ln	%i0,	%g6,	%i7
loop_209:
	movgu	%icc,	%o7,	%g1
	ldd	[%l7 + 0x58],	%l4
	udivx	%i2,	0x0B0E,	%l4
	fmovsgu	%icc,	%f30,	%f29
	sll	%o2,	0x14,	%i4
	andn	%l3,	%g4,	%g2
	sra	%g3,	%l1,	%o4
	xorcc	%i1,	0x06A1,	%o3
	fpadd32s	%f4,	%f28,	%f30
	wr	%g0,	0x04,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	xnor	%g7,	%l2,	%o5
	edge8l	%o6,	%i5,	%l0
	edge32ln	%g5,	%o0,	%l6
	fpack32	%f20,	%f6,	%f24
	tneg	%xcc,	0x6
	mulscc	%o1,	%i3,	%i0
	set	0x0E, %g2
	ldsha	[%l7 + %g2] 0x15,	%i6
	tvs	%icc,	0x1
	brnz	%i7,	loop_210
	tsubcc	%o7,	0x12BA,	%g6
	movge	%icc,	%g1,	%l5
	movleu	%xcc,	%l4,	%o2
loop_210:
	edge8l	%i2,	%i4,	%l3
	edge32ln	%g2,	%g4,	%g3
	addc	%o4,	0x008C,	%l1
	sdiv	%i1,	0x10C5,	%o3
	popc	0x1FF6,	%l2
	fpackfix	%f16,	%f3
	fone	%f0
	orcc	%g7,	%o6,	%i5
	fmovsle	%icc,	%f1,	%f21
	sdivx	%o5,	0x1CAF,	%l0
	orn	%o0,	%l6,	%o1
	tgu	%icc,	0x3
	fbne	%fcc0,	loop_211
	subccc	%g5,	0x04D9,	%i0
	ldd	[%l7 + 0x38],	%i6
	tsubcc	%i7,	0x06D5,	%o7
loop_211:
	movg	%xcc,	%i3,	%g1
	edge32	%l5,	%g6,	%o2
	array16	%l4,	%i2,	%i4
	add	%l7,	0x38,	%l6
	wr	%g0,	0x0c,	%asi
	casxa	[%l6] 0x0c,	%g2,	%g4
	st	%f12,	[%l7 + 0x68]
	sll	%l3,	0x14,	%o4
	fmovsgu	%xcc,	%f30,	%f19
	call	loop_212
	edge16n	%g3,	%i1,	%l1
	fmovspos	%xcc,	%f12,	%f18
	addcc	%l2,	%g7,	%o3
loop_212:
	sub	%o6,	0x0BD7,	%i5
	movrlez	%l0,	0x394,	%o5
	srax	%l6,	0x1E,	%o1
	bg	loop_213
	fmovsg	%icc,	%f2,	%f26
	srax	%g5,	0x08,	%i0
	swap	[%l7 + 0x7C],	%i6
loop_213:
	sllx	%i7,	%o0,	%i3
	swap	[%l7 + 0x50],	%g1
	movneg	%xcc,	%o7,	%l5
	edge8n	%g6,	%l4,	%o2
	add	%i2,	0x0EFB,	%i4
	ldsb	[%l7 + 0x15],	%g4
	sub	%g2,	0x0BB8,	%l3
	edge32l	%g3,	%o4,	%i1
	edge16ln	%l2,	%g7,	%l1
	movg	%icc,	%o6,	%o3
	fmul8ulx16	%f10,	%f12,	%f20
	movne	%xcc,	%i5,	%l0
	wr	%g0,	0x57,	%asi
	stxa	%l6,	[%g0 + 0x0] %asi
	fnor	%f14,	%f30,	%f8
	and	%o1,	%g5,	%i0
	fxor	%f22,	%f18,	%f10
	movrlz	%i6,	0x000,	%o5
	fbuge,a	%fcc3,	loop_214
	fblg,a	%fcc0,	loop_215
	edge32n	%o0,	%i3,	%i7
	ld	[%l7 + 0x2C],	%f9
loop_214:
	tvs	%xcc,	0x6
loop_215:
	srl	%g1,	%l5,	%o7
	fmovrsne	%g6,	%f7,	%f9
	be,a	%xcc,	loop_216
	fnor	%f24,	%f18,	%f10
	edge32	%o2,	%i2,	%i4
	tge	%icc,	0x2
loop_216:
	mulscc	%l4,	%g2,	%g4
	movrne	%l3,	%o4,	%i1
	fornot1s	%f18,	%f27,	%f4
	movre	%l2,	%g7,	%l1
	sth	%o6,	[%l7 + 0x5A]
	add	%o3,	0x0496,	%g3
	array8	%i5,	%l0,	%o1
	bcs,a,pt	%icc,	loop_217
	movleu	%icc,	%l6,	%i0
	andn	%i6,	0x06E8,	%g5
	ldd	[%l7 + 0x60],	%f30
loop_217:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array8	%o5,	%o0,	%i3
	edge8	%g1,	%i7,	%l5
	sub	%g6,	%o2,	%i2
	wr	%g0,	0x81,	%asi
	ldda	[%l7 + 0x30] %asi,	%i4
	fandnot1s	%f27,	%f28,	%f21
	wr	%g0,	0x18,	%asi
	swapa	[%l7 + 0x20] %asi,	%l4
	fornot1s	%f27,	%f4,	%f7
	umul	%g2,	%o7,	%l3
	wr	%g0,	0x89,	%asi
	stda	%o4,	[%l7 + 0x58] %asi
	fsrc1s	%f12,	%f23
	tneg	%icc,	0x4
	call	loop_218
	udiv	%i1,	0x1F80,	%l2
	movrgz	%g4,	0x2C3,	%l1
	addc	%o6,	0x0A54,	%o3
loop_218:
	tle	%xcc,	0x6
	movg	%xcc,	%g7,	%g3
	movpos	%xcc,	%l0,	%o1
	tge	%xcc,	0x1
	tvs	%icc,	0x7
	tle	%icc,	0x7
	movrlz	%i5,	%l6,	%i6
	movrne	%g5,	%o5,	%o0
	sethi	0x0EC4,	%i0
	bleu	%icc,	loop_219
	fmul8x16al	%f19,	%f11,	%f30
	edge8l	%i3,	%i7,	%l5
	fmul8ulx16	%f18,	%f2,	%f24
loop_219:
	array32	%g6,	%o2,	%g1
	udivx	%i2,	0x1BCA,	%i4
	movne	%icc,	%g2,	%o7
	edge8n	%l4,	%o4,	%i1
	set	0x68, %l4
	stha	%l2,	[%l7 + %l4] 0x10
	fzero	%f8
	wr	%g0,	0x2f,	%asi
	stwa	%l3,	[%l7 + 0x54] %asi
	membar	#Sync
	edge8	%l1,	%g4,	%o6
	set	0x08, %i4
	swapa	[%l7 + %i4] 0x19,	%o3
	edge32l	%g3,	%g7,	%l0
	fmovs	%f18,	%f22
	fmovs	%f12,	%f18
	wr	%g0,	0x80,	%asi
	ldswa	[%l7 + 0x7C] %asi,	%i5
	te	%icc,	0x3
	ldstub	[%l7 + 0x45],	%o1
	sll	%l6,	%i6,	%g5
	or	%o0,	0x0118,	%i0
	movrlez	%o5,	0x07D,	%i3
	nop
	setx loop_220, %l0, %l1
	jmpl %l1, %i7
	orn	%g6,	0x118C,	%o2
	tvc	%xcc,	0x2
	fandnot2s	%f13,	%f17,	%f16
loop_220:
	sra	%l5,	%g1,	%i4
	movcc	%xcc,	%i2,	%o7
	set	0x54, %o6
	lduwa	[%l7 + %o6] 0x10,	%g2
	movrgz	%l4,	%i1,	%o4
	sdiv	%l3,	0x1EB1,	%l1
	brlez,a	%l2,	loop_221
	tl	%xcc,	0x2
	set	0x50, %g4
	stda	%g4,	[%l7 + %g4] 0x10
loop_221:
	sra	%o3,	0x0D,	%g3
	movne	%icc,	%o6,	%l0
	orn	%i5,	%o1,	%l6
	movleu	%icc,	%g7,	%i6
	orncc	%g5,	0x1507,	%i0
	movneg	%xcc,	%o0,	%i3
	tgu	%xcc,	0x3
	xorcc	%o5,	0x0F20,	%i7
	srax	%g6,	%l5,	%o2
	wr	%g0,	0x0c,	%asi
	ldxa	[%l7 + 0x20] %asi,	%g1
	wr	%g0,	0x27,	%asi
	stba	%i4,	[%l7 + 0x3E] %asi
	membar	#Sync
	sdivx	%o7,	0x0E35,	%g2
	alignaddr	%l4,	%i2,	%i1
	fmuld8sux16	%f11,	%f21,	%f26
	ldstub	[%l7 + 0x45],	%o4
	and	%l3,	0x0C74,	%l1
	fbue	%fcc3,	loop_222
	fnegs	%f24,	%f12
	tpos	%xcc,	0x4
	udivx	%l2,	0x0852,	%g4
loop_222:
	subccc	%o3,	%o6,	%l0
	set	0x74, %o1
	swapa	[%l7 + %o1] 0x89,	%i5
	movrgz	%g3,	%l6,	%o1
	xnor	%i6,	%g7,	%i0
	movneg	%xcc,	%g5,	%i3
	ldsb	[%l7 + 0x64],	%o0
	tleu	%icc,	0x5
	edge8l	%o5,	%i7,	%l5
	fands	%f15,	%f21,	%f21
	fandnot1	%f8,	%f24,	%f4
	ta	%icc,	0x0
	sth	%g6,	[%l7 + 0x16]
	movrgez	%g1,	0x00F,	%i4
	movcc	%xcc,	%o2,	%o7
	set	0x48, %o2
	ldxa	[%l7 + %o2] 0x11,	%l4
	nop
	set	0x61, %l2
	ldstub	[%l7 + %l2],	%i2
	xorcc	%g2,	0x14B3,	%i1
	wr	%g0,	0x81,	%asi
	ldswa	[%l7 + 0x0C] %asi,	%l3
	fba	%fcc1,	loop_223
	addcc	%o4,	%l1,	%g4
	fnot1s	%f15,	%f29
	movrgez	%o3,	0x20D,	%l2
loop_223:
	mova	%icc,	%l0,	%o6
	bpos,a,pt	%icc,	loop_224
	fnors	%f26,	%f28,	%f18
	wr	%g0,	0x89,	%asi
	ldsba	[%l7 + 0x78] %asi,	%i5
loop_224:
	orncc	%g3,	%o1,	%i6
	flush	%l7 + 0x74
	fbne,a	%fcc0,	loop_225
	fbul	%fcc2,	loop_226
	bneg,a,pn	%icc,	loop_227
	movg	%xcc,	%g7,	%i0
loop_225:
	mova	%icc,	%g5,	%l6
loop_226:
	sdivx	%o0,	0x0AB3,	%i3
loop_227:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fexpand	%f9,	%f4
	tsubcctv	%o5,	%l5,	%i7
	tcc	%icc,	0x3
	movneg	%xcc,	%g1,	%g6
	movrne	%o2,	0x363,	%o7
	or	%i4,	%l4,	%i2
	orncc	%i1,	%l3,	%g2
	sllx	%o4,	0x07,	%l1
	add	%l7,	0x40,	%l6
	wr	%g0,	0x18,	%asi
	lda	[%l6] %asi,	%g4
	casa	[%l6] 0x18,	%g4,	%o3
	edge8ln	%l2,	%l0,	%o6
	fcmpeq16	%f20,	%f18,	%g3
	set	0x54, %i1
	stba	%i5,	[%l7 + %i1] 0xeb
	membar	#Sync
	fmovdgu	%icc,	%f7,	%f18
	bneg,a,pt	%icc,	loop_228
	sll	%o1,	%i6,	%i0
	std	%g4,	[%l7 + 0x20]
	tvc	%icc,	0x5
loop_228:
	umulcc	%l6,	%g7,	%i3
	tneg	%xcc,	0x7
	srl	%o0,	0x19,	%l5
	addccc	%i7,	%o5,	%g6
	fbule,a	%fcc0,	loop_229
	movgu	%icc,	%g1,	%o2
	stw	%i4,	[%l7 + 0x34]
	alignaddr	%l4,	%o7,	%i1
loop_229:
	sir	0x1908
	nop
	setx loop_230, %l0, %l1
	jmpl %l1, %i2
	nop
	setx	loop_231,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fbul,a	%fcc0,	loop_232
	movrgez	%g2,	0x00E,	%l3
loop_230:
	subc	%l1,	%g4,	%o4
loop_231:
	udiv	%l2,	0x155E,	%l0
loop_232:
	fcmpes	%fcc3,	%f2,	%f0
	xor	%o3,	%o6,	%g3
	set	0x14, %g7
	stwa	%i5,	[%l7 + %g7] 0x15
	edge8	%o1,	%i6,	%i0
	fble	%fcc3,	loop_233
	andncc	%l6,	%g5,	%i3
	edge8l	%o0,	%l5,	%g7
	wr	%g0,	0x89,	%asi
	lda	[%l7 + 0x08] %asi,	%f16
loop_233:
	fmovscs	%xcc,	%f28,	%f19
	set	0x10, %g6
	ldswa	[%l7 + %g6] 0x18,	%i7
	brlez	%o5,	loop_234
	bn,pn	%xcc,	loop_235
	fpsub16	%f0,	%f6,	%f30
	tcc	%xcc,	0x3
loop_234:
	bvs,a,pn	%xcc,	loop_236
loop_235:
	std	%g6,	[%l7 + 0x48]
	edge8	%o2,	%g1,	%l4
	fmul8sux16	%f16,	%f22,	%f20
loop_236:
	movre	%i4,	0x36E,	%i1
	brlz,a	%o7,	loop_237
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8l	%g2,	%i2,	%l3
	sra	%l1,	0x0E,	%g4
loop_237:
	nop
	set	0x40, %l3
	stda	%o4,	[%l7 + %l3] 0xe3
	membar	#Sync
	alignaddrl	%l0,	%o3,	%o6
	srlx	%l2,	0x0E,	%i5
	fsrc2	%f18,	%f28
	edge16	%g3,	%i6,	%i0
	sllx	%o1,	%l6,	%g5
	fornot2	%f26,	%f28,	%f4
	srl	%i3,	0x16,	%o0
	bn	%xcc,	loop_238
	xnorcc	%l5,	0x18C3,	%i7
	edge16l	%g7,	%g6,	%o5
	xnorcc	%g1,	%l4,	%i4
loop_238:
	edge16l	%i1,	%o7,	%g2
	fsrc2s	%f14,	%f1
	andncc	%i2,	%l3,	%o2
	brlz,a	%g4,	loop_239
	xor	%o4,	0x0810,	%l0
	bg,pt	%icc,	loop_240
	fmovdneg	%xcc,	%f29,	%f18
loop_239:
	fornot2	%f22,	%f16,	%f26
	fors	%f6,	%f1,	%f8
loop_240:
	xnor	%l1,	%o6,	%l2
	fbn,a	%fcc2,	loop_241
	smulcc	%o3,	0x1F53,	%g3
	call	loop_242
	fxnor	%f18,	%f8,	%f12
loop_241:
	fbul	%fcc3,	loop_243
	mulscc	%i5,	%i6,	%o1
loop_242:
	orncc	%l6,	0x0336,	%g5
	prefetch	[%l7 + 0x64],	 0x3
loop_243:
	fornot1	%f24,	%f26,	%f30
	edge8	%i0,	%i3,	%o0
	edge16n	%i7,	%g7,	%g6
	fcmpne16	%f12,	%f2,	%l5
	fmul8x16al	%f9,	%f14,	%f12
	tle	%icc,	0x0
	bneg,a,pn	%xcc,	loop_244
	fandnot2s	%f4,	%f7,	%f14
	andncc	%o5,	%l4,	%g1
	brlez,a	%i4,	loop_245
loop_244:
	tvc	%icc,	0x1
	sth	%o7,	[%l7 + 0x74]
	xorcc	%i1,	%i2,	%l3
loop_245:
	fbn	%fcc3,	loop_246
	movl	%icc,	%o2,	%g2
	ta	%icc,	0x1
	tgu	%xcc,	0x4
loop_246:
	movgu	%xcc,	%g4,	%l0
	nop
	setx	loop_247,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	edge16ln	%l1,	%o6,	%l2
	lduw	[%l7 + 0x64],	%o3
	taddcc	%g3,	%i5,	%i6
loop_247:
	fmovs	%f10,	%f0
	srax	%o1,	%l6,	%g5
	tcc	%icc,	0x2
	orncc	%o4,	0x010D,	%i0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
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
	subcc	%o0,	0x1814,	%i3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	and	%i7,	%g6,	%g7
loop_248:
	fmul8ulx16	%f8,	%f6,	%f28
	edge8ln	%o5,	%l5,	%g1
	alignaddr	%l4,	%i4,	%i1
	fpsub32s	%f16,	%f2,	%f27
	andcc	%o7,	%i2,	%o2
	tne	%icc,	0x2
	movcc	%icc,	%g2,	%g4
	fbne	%fcc1,	loop_249
	smulcc	%l0,	%l1,	%l3
	edge32l	%l2,	%o6,	%o3
	fpadd32s	%f4,	%f21,	%f6
loop_249:
	fpack32	%f0,	%f4,	%f28
	stbar
	movle	%icc,	%i5,	%g3
	membar	0x15
	mova	%xcc,	%o1,	%l6
	movn	%icc,	%i6,	%g5
	movle	%xcc,	%o4,	%i0
	edge8ln	%i3,	%o0,	%g6
	wr	%g0,	0x2b,	%asi
	stha	%i7,	[%l7 + 0x26] %asi
	membar	#Sync
	fmul8x16au	%f29,	%f29,	%f28
	st	%f20,	[%l7 + 0x30]
	sir	0x0B37
	bn,pt	%xcc,	loop_250
	bleu,a	loop_251
	fmul8x16au	%f17,	%f20,	%f8
	fmovrsgez	%g7,	%f0,	%f0
loop_250:
	and	%l5,	0x0923,	%g1
loop_251:
	fmovrde	%l4,	%f4,	%f18
	array8	%o5,	%i1,	%o7
	fmuld8ulx16	%f17,	%f13,	%f30
	umul	%i2,	%o2,	%i4
	smulcc	%g2,	0x1727,	%g4
	stx	%l1,	[%l7 + 0x20]
	wr	%g0,	0x80,	%asi
	lduha	[%l7 + 0x60] %asi,	%l0
	sethi	0x0EA0,	%l2
	popc	0x18E0,	%o6
	taddcc	%o3,	%l3,	%i5
	umulcc	%o1,	0x068E,	%g3
	set	0x51, %l6
	lduba	[%l7 + %l6] 0x14,	%l6
	fmovrslez	%i6,	%f3,	%f26
	fabss	%f1,	%f1
	alignaddr	%g5,	%i0,	%i3
	edge32l	%o0,	%g6,	%i7
	wr	%g0,	0x89,	%asi
	stda	%o4,	[%l7 + 0x58] %asi
	fble	%fcc1,	loop_252
	edge32l	%g7,	%g1,	%l5
	move	%xcc,	%o5,	%l4
	set	0x6C, %l0
	sta	%f12,	[%l7 + %l0] 0x14
loop_252:
	fsrc2	%f14,	%f28
	wr	%g0,	0x52,	%asi
	stxa	%o7,	[%g0 + 0x120] %asi
	set	0x24, %i5
	ldsha	[%l7 + %i5] 0x14,	%i1
	smul	%i2,	%i4,	%o2
	set	0x40, %g1
	ldda	[%l7 + %g1] 0x81,	%f0
	sdiv	%g2,	0x18A2,	%l1
	movne	%icc,	%g4,	%l2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bl,pt	%icc,	loop_253
	fble,a	%fcc2,	loop_254
	movrlz	%o6,	%o3,	%l0
	fmovsgu	%xcc,	%f14,	%f30
loop_253:
	movgu	%icc,	%l3,	%o1
loop_254:
	sethi	0x12ED,	%i5
	xorcc	%l6,	%i6,	%g5
	movrne	%g3,	0x1D0,	%i3
	fmovd	%f0,	%f30
	sth	%i0,	[%l7 + 0x1C]
	fandnot1s	%f3,	%f5,	%f16
	stbar
	fbu,a	%fcc3,	loop_255
	sethi	0x1A58,	%o0
	wr	%g0,	0x04,	%asi
	ldswa	[%l7 + 0x28] %asi,	%i7
loop_255:
	movgu	%xcc,	%g6,	%o4
	fmovsg	%xcc,	%f31,	%f28
	udiv	%g7,	0x018D,	%g1
	set	0x1E, %i2
	stba	%l5,	[%l7 + %i2] 0x11
	movrne	%l4,	0x125,	%o7
	subcc	%o5,	%i1,	%i2
	sethi	0x1CE1,	%i4
	movrlz	%g2,	0x00C,	%l1
	brgz,a	%g4,	loop_256
	fmul8ulx16	%f14,	%f10,	%f0
	movle	%icc,	%l2,	%o6
	movne	%icc,	%o2,	%l0
loop_256:
	fzero	%f28
	add	%o3,	%l3,	%o1
	taddcctv	%l6,	0x0AF6,	%i6
	set	0x70, %l1
	stda	%g4,	[%l7 + %l1] 0x0c
	sdiv	%g3,	0x0646,	%i5
	sdivcc	%i0,	0x1B9C,	%o0
	orcc	%i7,	0x0C9E,	%i3
	srax	%o4,	%g7,	%g6
	te	%icc,	0x5
	fbue	%fcc0,	loop_257
	movneg	%xcc,	%l5,	%l4
	fnot2s	%f24,	%f13
	fpadd16s	%f31,	%f8,	%f22
loop_257:
	edge32	%g1,	%o7,	%o5
	orcc	%i1,	%i2,	%g2
	te	%icc,	0x1
	fbu	%fcc3,	loop_258
	tsubcctv	%i4,	0x11A1,	%g4
	addccc	%l2,	0x0691,	%o6
	srax	%l1,	0x09,	%o2
loop_258:
	movre	%l0,	0x34F,	%o3
	edge16	%l3,	%o1,	%i6
	edge32	%g5,	%g3,	%i5
	set	0x6E, %i6
	stha	%i0,	[%l7 + %i6] 0x11
	sllx	%o0,	0x0C,	%l6
	fcmpes	%fcc0,	%f21,	%f5
	st	%f7,	[%l7 + 0x24]
	tle	%xcc,	0x7
	bvc,a	loop_259
	fbn	%fcc3,	loop_260
	alignaddrl	%i7,	%o4,	%g7
	ld	[%l7 + 0x70],	%f8
loop_259:
	ldd	[%l7 + 0x40],	%g6
loop_260:
	tg	%xcc,	0x7
	movne	%xcc,	%i3,	%l5
	ldsw	[%l7 + 0x70],	%l4
	movrlz	%g1,	%o7,	%i1
	fble	%fcc0,	loop_261
	fxor	%f8,	%f16,	%f18
	add	%l7,	0x28,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] %asi,	%o5,	%g2
loop_261:
	umulcc	%i4,	0x158F,	%i2
	or	%l2,	0x0545,	%o6
	movre	%l1,	0x31C,	%o2
	movre	%g4,	%o3,	%l0
	set	0x4C, %o7
	ldsha	[%l7 + %o7] 0x89,	%l3
	fnegd	%f6,	%f12
	ldsw	[%l7 + 0x48],	%i6
	movrgez	%o1,	%g5,	%g3
	add	%i0,	%o0,	%i5
	lduh	[%l7 + 0x40],	%i7
	lduh	[%l7 + 0x5E],	%o4
	tneg	%xcc,	0x3
	fornot2	%f18,	%f18,	%f28
	andn	%l6,	%g6,	%i3
	edge16ln	%g7,	%l5,	%l4
	sir	0x03AE
	movgu	%icc,	%o7,	%g1
	movne	%icc,	%i1,	%o5
	te	%xcc,	0x6
	sll	%g2,	0x16,	%i4
	edge16	%l2,	%o6,	%l1
	set	0x70, %o5
	stxa	%i2,	[%l7 + %o5] 0x2a
	membar	#Sync
	fmovrsgez	%g4,	%f16,	%f10
	fmovdleu	%xcc,	%f3,	%f2
	movre	%o2,	0x01E,	%l0
	tpos	%xcc,	0x4
	fandnot1	%f22,	%f22,	%f12
	membar	0x3B
	fnor	%f24,	%f12,	%f26
	add	%o3,	%i6,	%o1
	srax	%g5,	%l3,	%i0
	tcc	%icc,	0x1
	bgu,a,pn	%icc,	loop_262
	bge	%xcc,	loop_263
	movrlez	%g3,	0x39C,	%o0
	movgu	%icc,	%i5,	%i7
loop_262:
	fbn	%fcc1,	loop_264
loop_263:
	andcc	%l6,	0x1C58,	%g6
	movrne	%i3,	0x2A6,	%g7
	sra	%l5,	0x0F,	%o4
loop_264:
	edge16n	%o7,	%l4,	%g1
	tcc	%icc,	0x6
	fbo	%fcc3,	loop_265
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srl	%i1,	0x08,	%o5
	alignaddrl	%g2,	%l2,	%i4
loop_265:
	brnz	%o6,	loop_266
	movrlez	%i2,	0x010,	%g4
	fmovsne	%icc,	%f23,	%f16
	fbuge,a	%fcc0,	loop_267
loop_266:
	movrgz	%l1,	%l0,	%o3
	fcmpgt16	%f22,	%f28,	%i6
	smul	%o2,	0x09FF,	%o1
loop_267:
	fone	%f16
	nop
	set	0x72, %i0
	lduh	[%l7 + %i0],	%l3
	sdiv	%i0,	0x185F,	%g3
	tn	%xcc,	0x1
	tne	%xcc,	0x0
	edge8l	%o0,	%i5,	%i7
	tleu	%icc,	0x2
	fcmpes	%fcc2,	%f17,	%f13
	fmovsl	%xcc,	%f19,	%f16
	movneg	%xcc,	%g5,	%l6
	brz	%g6,	loop_268
	udivx	%g7,	0x03EE,	%i3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	add	%l7,	0x38,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%l5
	casxa	[%l6] 0x88,	%l5,	%o4
loop_268:
	array8	%l4,	%g1,	%o7
	movgu	%xcc,	%i1,	%o5
	fblg,a	%fcc3,	loop_269
	fabsd	%f12,	%f6
	subccc	%g2,	%l2,	%o6
	fmovde	%icc,	%f20,	%f23
loop_269:
	for	%f16,	%f4,	%f2
	movneg	%xcc,	%i4,	%i2
	tpos	%icc,	0x7
	array16	%g4,	%l0,	%l1
	tg	%xcc,	0x1
	brlz,a	%i6,	loop_270
	sdivcc	%o2,	0x09A7,	%o1
	smulcc	%l3,	%o3,	%i0
	fmovdg	%xcc,	%f9,	%f19
loop_270:
	tpos	%icc,	0x3
	fnot1s	%f27,	%f17
	edge8n	%g3,	%i5,	%o0
	brlez	%g5,	loop_271
	sethi	0x0332,	%i7
	movre	%g6,	0x29C,	%g7
	edge16l	%l6,	%i3,	%l5
loop_271:
	udiv	%l4,	0x1B2B,	%g1
	mulx	%o4,	0x1C07,	%o7
	tsubcctv	%o5,	0x0B26,	%i1
	xorcc	%g2,	%l2,	%i4
	movcc	%icc,	%i2,	%g4
	be,a,pt	%xcc,	loop_272
	bleu,pn	%icc,	loop_273
	taddcc	%o6,	%l0,	%l1
	fnot1s	%f15,	%f9
loop_272:
	tcc	%icc,	0x7
loop_273:
	fbg	%fcc1,	loop_274
	ta	%xcc,	0x7
	te	%xcc,	0x7
	edge16n	%i6,	%o2,	%o1
loop_274:
	and	%l3,	0x0779,	%i0
	fbu	%fcc3,	loop_275
	tpos	%xcc,	0x6
	fmovrde	%g3,	%f26,	%f26
	sdivcc	%i5,	0x0CDC,	%o0
loop_275:
	bpos,a,pt	%xcc,	loop_276
	array16	%o3,	%i7,	%g6
	umulcc	%g5,	0x0095,	%g7
	alignaddrl	%l6,	%l5,	%i3
loop_276:
	edge8	%g1,	%o4,	%o7
	tne	%xcc,	0x0
	fbl	%fcc2,	loop_277
	and	%l4,	%i1,	%o5
	tne	%icc,	0x4
	for	%f20,	%f4,	%f12
loop_277:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tgu	%xcc,	0x1
	fpackfix	%f0,	%f23
	mulscc	%l2,	0x0749,	%g2
	fmovse	%xcc,	%f8,	%f12
	set	0x74, %o0
	stwa	%i4,	[%l7 + %o0] 0x27
	membar	#Sync
	swap	[%l7 + 0x18],	%i2
	or	%o6,	0x0105,	%g4
	edge32n	%l0,	%l1,	%o2
	fabsd	%f20,	%f14
	movne	%xcc,	%o1,	%l3
	movge	%icc,	%i6,	%i0
	bne,a	loop_278
	movne	%xcc,	%g3,	%o0
	tsubcctv	%o3,	0x0FA7,	%i5
	fbge,a	%fcc3,	loop_279
loop_278:
	fmovsl	%icc,	%f10,	%f15
	orncc	%g6,	0x1570,	%i7
	fbg	%fcc1,	loop_280
loop_279:
	movrne	%g7,	%l6,	%l5
	movrlz	%g5,	%i3,	%o4
	srlx	%g1,	%o7,	%i1
loop_280:
	movgu	%icc,	%o5,	%l2
	fbul	%fcc2,	loop_281
	tneg	%xcc,	0x2
	flush	%l7 + 0x68
	fnot2	%f24,	%f12
loop_281:
	fble	%fcc3,	loop_282
	movcs	%icc,	%g2,	%i4
	movneg	%xcc,	%i2,	%o6
	fbuge,a	%fcc3,	loop_283
loop_282:
	tvc	%icc,	0x6
	fandnot1s	%f12,	%f1,	%f18
	fcmpeq32	%f26,	%f28,	%g4
loop_283:
	orcc	%l4,	%l1,	%o2
	tsubcctv	%o1,	%l0,	%i6
	ldsb	[%l7 + 0x1F],	%i0
	andcc	%g3,	%l3,	%o3
	nop
	setx	loop_284,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	smulcc	%o0,	%g6,	%i7
	srlx	%g7,	0x13,	%l6
	edge32	%i5,	%g5,	%i3
loop_284:
	tvc	%icc,	0x2
	nop
	setx	loop_285,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	brz	%l5,	loop_286
	edge16	%g1,	%o4,	%i1
	nop
	setx	loop_287,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_285:
	fandnot1s	%f26,	%f29,	%f9
loop_286:
	tle	%xcc,	0x6
	sdivcc	%o5,	0x0D24,	%o7
loop_287:
	tcs	%xcc,	0x6
	tleu	%xcc,	0x0
	fone	%f18
	orcc	%l2,	0x0876,	%i4
	movvc	%xcc,	%i2,	%g2
	stbar
	addccc	%g4,	%l4,	%l1
	edge8l	%o2,	%o6,	%o1
	movvs	%icc,	%l0,	%i0
	fpadd32	%f16,	%f24,	%f16
	movg	%xcc,	%i6,	%g3
	movgu	%xcc,	%o3,	%o0
	subcc	%g6,	%l3,	%g7
	fmovrdne	%i7,	%f12,	%f12
	umulcc	%i5,	%g5,	%i3
	andncc	%l6,	%g1,	%o4
	tsubcctv	%i1,	0x0661,	%l5
	fnegd	%f8,	%f10
	fbg,a	%fcc1,	loop_288
	fmul8x16al	%f3,	%f20,	%f26
	wr	%g0,	0x0c,	%asi
	ldsba	[%l7 + 0x77] %asi,	%o5
loop_288:
	andcc	%l2,	%o7,	%i4
	fxnor	%f30,	%f4,	%f2
	membar	0x5A
	fnands	%f18,	%f11,	%f5
	smul	%i2,	0x173C,	%g2
	fmul8x16al	%f14,	%f12,	%f30
	bvs	loop_289
	movvc	%xcc,	%g4,	%l1
	addcc	%o2,	%l4,	%o1
	bge,a	%xcc,	loop_290
loop_289:
	fmovdvs	%xcc,	%f23,	%f15
	movre	%o6,	0x394,	%i0
	fmovdne	%xcc,	%f8,	%f8
loop_290:
	movne	%icc,	%l0,	%i6
	fmuld8ulx16	%f3,	%f7,	%f18
	fnot2	%f20,	%f0
	edge16ln	%o3,	%o0,	%g3
	fone	%f4
	addcc	%g6,	%l3,	%g7
	movrlez	%i7,	%g5,	%i3
	fandnot2	%f0,	%f0,	%f4
	tgu	%icc,	0x2
	tvc	%xcc,	0x2
	and	%i5,	%g1,	%o4
	fcmpd	%fcc1,	%f6,	%f0
	fmovrdne	%i1,	%f24,	%f20
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orn	%l5,	%o5,	%l6
	fands	%f7,	%f22,	%f5
	fpadd32	%f20,	%f12,	%f30
	udiv	%o7,	0x0D31,	%i4
	prefetch	[%l7 + 0x5C],	 0x3
	movre	%l2,	%g2,	%i2
	edge16ln	%g4,	%l1,	%o2
	mulscc	%o1,	0x1006,	%l4
	bleu	loop_291
	taddcctv	%o6,	%i0,	%i6
	fble	%fcc1,	loop_292
	ba,pn	%xcc,	loop_293
loop_291:
	fbo	%fcc2,	loop_294
	movn	%icc,	%o3,	%o0
loop_292:
	bg,a,pt	%icc,	loop_295
loop_293:
	fmovrde	%l0,	%f6,	%f4
loop_294:
	fmovsvs	%xcc,	%f0,	%f5
	fbu,a	%fcc2,	loop_296
loop_295:
	subc	%g3,	0x05C2,	%g6
	bcc,a,pt	%icc,	loop_297
	flush	%l7 + 0x4C
loop_296:
	call	loop_298
	fmovrsne	%g7,	%f31,	%f8
loop_297:
	tsubcc	%l3,	%i7,	%i3
	fornot2	%f12,	%f20,	%f0
loop_298:
	fmul8ulx16	%f4,	%f8,	%f20
	fcmpne32	%f22,	%f18,	%g5
	ta	%icc,	0x6
	movle	%xcc,	%i5,	%g1
	edge16n	%o4,	%i1,	%l5
	tsubcc	%o5,	%l6,	%i4
	movcc	%xcc,	%l2,	%o7
	srax	%i2,	%g4,	%g2
	fbuge	%fcc3,	loop_299
	bcs,a,pt	%xcc,	loop_300
	movn	%xcc,	%l1,	%o2
	alignaddrl	%o1,	%l4,	%i0
loop_299:
	std	%f14,	[%l7 + 0x38]
loop_300:
	fmovdvs	%xcc,	%f6,	%f19
	ldsh	[%l7 + 0x44],	%i6
	sir	0x0C81
	subc	%o3,	0x1F01,	%o6
	movrgez	%o0,	0x2A7,	%g3
	fcmpd	%fcc3,	%f30,	%f28
	taddcctv	%g6,	%l0,	%g7
	array16	%i7,	%l3,	%g5
	edge32ln	%i5,	%g1,	%o4
	tcs	%xcc,	0x1
	fpadd32	%f28,	%f30,	%f2
	sdiv	%i1,	0x1B47,	%l5
	fbo,a	%fcc0,	loop_301
	ldsh	[%l7 + 0x16],	%i3
	te	%xcc,	0x5
	movrne	%l6,	%o5,	%l2
loop_301:
	ldx	[%l7 + 0x10],	%i4
	be	%icc,	loop_302
	tgu	%xcc,	0x3
	tsubcc	%i2,	0x0833,	%g4
	addc	%o7,	%g2,	%l1
loop_302:
	nop
	set	0x40, %o3
	lduwa	[%l7 + %o3] 0x80,	%o1
	and	%l4,	%o2,	%i6
	movl	%xcc,	%o3,	%i0
	fornot2	%f8,	%f8,	%f10
	sub	%o0,	%o6,	%g6
	ldsh	[%l7 + 0x18],	%g3
	fmovd	%f8,	%f16
	umulcc	%l0,	0x1127,	%g7
	sdiv	%i7,	0x0D1A,	%g5
	stbar
	fmovrdne	%i5,	%f24,	%f14
	tcc	%icc,	0x6
	movcs	%icc,	%l3,	%o4
	tvc	%xcc,	0x1
	fmovdl	%xcc,	%f16,	%f1
	tsubcctv	%g1,	0x061F,	%l5
	bgu,a,pn	%icc,	loop_303
	subc	%i1,	0x0490,	%i3
	movre	%o5,	0x24A,	%l6
	tgu	%xcc,	0x0
loop_303:
	mulscc	%i4,	%l2,	%i2
	movrlez	%g4,	%g2,	%o7
	fbo	%fcc0,	loop_304
	swap	[%l7 + 0x18],	%o1
	udivcc	%l4,	0x0F01,	%o2
	edge16ln	%i6,	%o3,	%i0
loop_304:
	fmul8ulx16	%f12,	%f22,	%f26
	brgez,a	%l1,	loop_305
	alignaddrl	%o6,	%g6,	%g3
	tgu	%icc,	0x2
	or	%l0,	%g7,	%i7
loop_305:
	andncc	%g5,	%i5,	%o0
	fbne,a	%fcc2,	loop_306
	fbne	%fcc2,	loop_307
	movl	%xcc,	%l3,	%o4
	membar	0x26
loop_306:
	fandnot1s	%f15,	%f25,	%f10
loop_307:
	bleu,a	loop_308
	movrgz	%l5,	%g1,	%i3
	fmovdneg	%icc,	%f1,	%f6
	addcc	%o5,	%i1,	%i4
loop_308:
	movneg	%icc,	%l6,	%i2
	mulx	%l2,	%g4,	%o7
	sir	0x1D2A
	set	0x40, %l5
	ldswa	[%l7 + %l5] 0x04,	%g2
	fbul,a	%fcc1,	loop_309
	umul	%o1,	0x14B9,	%l4
	fsrc1	%f26,	%f10
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_309:
	nop
	wr	%g0,	0x81,	%asi
	sta	%f14,	[%l7 + 0x40] %asi
	siam	0x4
	fcmps	%fcc3,	%f28,	%f19
	mulx	%o2,	%o3,	%i6
	fornot2	%f28,	%f28,	%f2
	orn	%l1,	0x0195,	%i0
	fcmpgt32	%f16,	%f24,	%o6
	set	0x22, %i3
	lduba	[%l7 + %i3] 0x89,	%g3
	bcc,a	loop_310
	array16	%l0,	%g7,	%g6
	sll	%g5,	%i5,	%o0
	movrgz	%i7,	0x1FE,	%o4
loop_310:
	faligndata	%f2,	%f18,	%f10
	fnot2s	%f27,	%f6
	membar	0x2D
	srl	%l5,	%l3,	%g1
	tn	%icc,	0x0
	st	%f1,	[%l7 + 0x38]
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x0C] %asi,	%o5
	fbuge	%fcc3,	loop_311
	fmovdle	%xcc,	%f31,	%f4
	te	%icc,	0x7
	bneg,pn	%xcc,	loop_312
loop_311:
	tle	%xcc,	0x4
	tl	%xcc,	0x0
	array32	%i3,	%i4,	%l6
loop_312:
	nop
	wr	%g0,	0x19,	%asi
	ldstuba	[%l7 + 0x3D] %asi,	%i1
	fmovsvs	%icc,	%f11,	%f12
	fmovdcc	%icc,	%f29,	%f10
	movle	%xcc,	%l2,	%i2
	orcc	%g4,	%g2,	%o1
	fmul8x16	%f31,	%f8,	%f4
	udivcc	%l4,	0x1B0F,	%o2
	fnor	%f30,	%f0,	%f0
	stw	%o3,	[%l7 + 0x10]
	tn	%icc,	0x1
	umul	%o7,	%i6,	%l1
	tsubcctv	%o6,	0x064E,	%i0
	sethi	0x0749,	%l0
	membar	0x28
	fmovdg	%icc,	%f28,	%f20
	ldd	[%l7 + 0x78],	%f22
	set	0x54, %g3
	lda	[%l7 + %g3] 0x14,	%f4
	set	0x50, %o4
	lduwa	[%l7 + %o4] 0x10,	%g3
	bcc,pt	%icc,	loop_313
	edge8ln	%g6,	%g5,	%i5
	subccc	%g7,	0x1CD3,	%i7
	addcc	%o4,	%o0,	%l5
loop_313:
	edge16n	%g1,	%o5,	%l3
	stb	%i4,	[%l7 + 0x0D]
	flush	%l7 + 0x1C
	fbu,a	%fcc0,	loop_314
	fors	%f8,	%f28,	%f1
	sdiv	%l6,	0x1785,	%i3
	fmul8x16al	%f16,	%f10,	%f20
loop_314:
	nop
	setx	loop_315,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	smul	%l2,	0x0454,	%i2
	tsubcc	%g4,	0x0646,	%i1
	sir	0x03B5
loop_315:
	mulscc	%g2,	0x17E7,	%o1
	sllx	%l4,	0x03,	%o3
	alignaddrl	%o7,	%o2,	%i6
	bvc	loop_316
	sll	%o6,	0x1F,	%l1
	andncc	%l0,	%g3,	%g6
	fmovde	%xcc,	%f6,	%f13
loop_316:
	taddcctv	%i0,	0x04DA,	%g5
	fcmpeq32	%f4,	%f16,	%g7
	subc	%i7,	0x125F,	%i5
	fnot2	%f16,	%f24
	sdiv	%o0,	0x1C79,	%o4
	movleu	%icc,	%g1,	%l5
	bn,pn	%xcc,	loop_317
	subccc	%o5,	0x017F,	%l3
	movneg	%xcc,	%i4,	%l6
	fmovdle	%icc,	%f5,	%f13
loop_317:
	movne	%icc,	%i3,	%l2
	add	%g4,	%i2,	%i1
	sdivx	%g2,	0x131F,	%o1
	tvs	%xcc,	0x6
	sll	%o3,	%l4,	%o2
	fmovdvs	%xcc,	%f4,	%f29
	edge32	%o7,	%i6,	%o6
	wr	%g0,	0x19,	%asi
	ldxa	[%l7 + 0x30] %asi,	%l0
	movre	%g3,	0x2EC,	%l1
	bvs,pn	%icc,	loop_318
	orcc	%g6,	%g5,	%g7
	tsubcctv	%i7,	0x0ADB,	%i0
	and	%i5,	0x1ECD,	%o4
loop_318:
	fpackfix	%f18,	%f25
	andncc	%g1,	%l5,	%o0
	edge8n	%l3,	%o5,	%i4
	movn	%icc,	%i3,	%l6
	brgz	%l2,	loop_319
	fmovrdgz	%g4,	%f12,	%f0
	pdist	%f20,	%f6,	%f10
	movrgz	%i2,	%g2,	%o1
loop_319:
	move	%xcc,	%o3,	%i1
	umul	%o2,	0x058D,	%l4
	movcs	%icc,	%i6,	%o7
	fpadd32	%f18,	%f16,	%f12
	tsubcc	%l0,	0x0CB3,	%g3
	fpadd16s	%f10,	%f18,	%f4
	orn	%o6,	0x17D4,	%l1
	nop
	set	0x42, %i7
	ldsh	[%l7 + %i7],	%g6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8l	%g5,	%i7,	%i0
	bn,pn	%icc,	loop_320
	fzeros	%f6
	andcc	%i5,	0x15BF,	%g7
	tvs	%xcc,	0x5
loop_320:
	movne	%icc,	%g1,	%l5
	fmovrsgz	%o4,	%f16,	%f24
	array32	%o0,	%l3,	%o5
	fors	%f23,	%f16,	%f11
	fbl	%fcc1,	loop_321
	edge32ln	%i3,	%l6,	%i4
	alignaddrl	%g4,	%l2,	%i2
	fbuge,a	%fcc3,	loop_322
loop_321:
	tsubcctv	%o1,	0x0955,	%o3
	fxnors	%f12,	%f30,	%f14
	fmovsvs	%icc,	%f4,	%f15
loop_322:
	nop
	wr	%g0,	0x19,	%asi
	ldsha	[%l7 + 0x4E] %asi,	%g2
	fornot2s	%f30,	%f4,	%f9
	fcmpeq32	%f22,	%f12,	%o2
	umulcc	%i1,	%l4,	%i6
	move	%icc,	%l0,	%o7
	array32	%g3,	%l1,	%g6
	fmovrdlez	%g5,	%f0,	%f2
	edge8ln	%i7,	%i0,	%i5
	set	0x1A, %g5
	lduha	[%l7 + %g5] 0x89,	%o6
	bne,a,pn	%icc,	loop_323
	fornot2s	%f12,	%f9,	%f19
	movne	%icc,	%g1,	%l5
	edge16n	%o4,	%g7,	%o0
loop_323:
	fsrc1s	%f14,	%f28
	movrlez	%l3,	%i3,	%l6
	brlez,a	%o5,	loop_324
	fbue,a	%fcc2,	loop_325
	taddcctv	%i4,	%l2,	%g4
	movpos	%icc,	%i2,	%o1
loop_324:
	stb	%o3,	[%l7 + 0x2D]
loop_325:
	nop
	set	0x58, %l4
	ldsw	[%l7 + %l4],	%o2
	movcc	%xcc,	%g2,	%l4
	bshuffle	%f2,	%f10,	%f8
	sllx	%i6,	0x19,	%i1
	tl	%icc,	0x2
	fmovspos	%icc,	%f15,	%f20
	wr	%g0,	0x0c,	%asi
	sta	%f18,	[%l7 + 0x44] %asi
	fpadd16s	%f11,	%f7,	%f31
	movcs	%xcc,	%l0,	%o7
	movl	%icc,	%l1,	%g6
	wr	%g0,	0x2f,	%asi
	stxa	%g5,	[%l7 + 0x28] %asi
	membar	#Sync
	fzeros	%f7
	movre	%g3,	0x25D,	%i0
	subc	%i7,	%i5,	%g1
	fmovdleu	%icc,	%f2,	%f9
	fbn	%fcc0,	loop_326
	bleu,a	loop_327
	tsubcctv	%o6,	%l5,	%g7
	edge16l	%o4,	%o0,	%l3
loop_326:
	addc	%l6,	%o5,	%i4
loop_327:
	movcs	%icc,	%l2,	%i3
	movleu	%xcc,	%i2,	%o1
	tge	%icc,	0x7
	movne	%xcc,	%o3,	%g4
	sllx	%o2,	%g2,	%l4
	wr	%g0,	0x89,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	call	loop_328
	edge16	%i6,	%i1,	%l0
	fcmpeq16	%f2,	%f28,	%l1
	fmovscc	%xcc,	%f21,	%f9
loop_328:
	movvc	%icc,	%o7,	%g5
	xorcc	%g6,	%i0,	%g3
	movleu	%xcc,	%i5,	%i7
	fxnor	%f12,	%f24,	%f30
	xor	%g1,	0x0A6F,	%o6
	alignaddrl	%g7,	%l5,	%o0
	andcc	%l3,	0x1C84,	%o4
	fcmpne32	%f24,	%f20,	%o5
	tvc	%icc,	0x3
	sdivx	%l6,	0x18AA,	%l2
	sub	%i4,	%i3,	%i2
	xnor	%o3,	0x0AD5,	%o1
	subccc	%o2,	%g4,	%l4
	movneg	%icc,	%g2,	%i6
	tvs	%xcc,	0x7
	set	0x60, %g2
	lda	[%l7 + %g2] 0x14,	%f19
	fba	%fcc1,	loop_329
	fmovrdne	%i1,	%f6,	%f22
	tge	%icc,	0x6
	fmovrsne	%l1,	%f15,	%f13
loop_329:
	fmul8ulx16	%f22,	%f22,	%f14
	tn	%icc,	0x7
	and	%o7,	%g5,	%l0
	wr	%g0,	0x4f,	%asi
	ldxa	[%g0 + 0x0] %asi,	%i0
	movn	%xcc,	%g3,	%g6
	bvs	%icc,	loop_330
	fbo	%fcc1,	loop_331
	tsubcc	%i7,	%i5,	%g1
	bcs,pt	%icc,	loop_332
loop_330:
	swap	[%l7 + 0x28],	%g7
loop_331:
	tleu	%xcc,	0x3
	fbn,a	%fcc1,	loop_333
loop_332:
	fbne	%fcc0,	loop_334
	tsubcctv	%o6,	0x1E65,	%l5
	movre	%l3,	0x0D8,	%o0
loop_333:
	addc	%o4,	0x1144,	%o5
loop_334:
	fmovrde	%l2,	%f20,	%f12
	fones	%f18
	xorcc	%i4,	%l6,	%i2
	fbn,a	%fcc0,	loop_335
	smulcc	%i3,	%o3,	%o1
	popc	%g4,	%l4
	edge8n	%g2,	%i6,	%i1
loop_335:
	nop
	set	0x20, %i4
	stda	%o2,	[%l7 + %i4] 0x2f
	membar	#Sync
	xnor	%l1,	%g5,	%o7
	bvs	%xcc,	loop_336
	or	%i0,	%l0,	%g3
	fone	%f4
	te	%xcc,	0x3
loop_336:
	tsubcctv	%i7,	0x01EB,	%i5
	ldsw	[%l7 + 0x40],	%g6
	edge32	%g7,	%o6,	%l5
	edge8l	%l3,	%g1,	%o4
	tgu	%icc,	0x7
	tcc	%xcc,	0x7
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
	fmovdcc	%xcc,	%f12,	%f5
	movpos	%xcc,	%o5,	%l2
	ldsh	[%l7 + 0x64],	%i4
loop_337:
	fble	%fcc0,	loop_338
	ldub	[%l7 + 0x30],	%o0
	movrlz	%i2,	%i3,	%l6
	fnot2s	%f20,	%f29
loop_338:
	or	%o3,	%o1,	%l4
	fcmple16	%f20,	%f22,	%g4
	bneg,a	loop_339
	fmovscc	%icc,	%f28,	%f15
	and	%i6,	0x0AAF,	%g2
	fcmple32	%f22,	%f26,	%i1
loop_339:
	movrne	%o2,	0x3EC,	%l1
	brgz	%o7,	loop_340
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
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrslz	%i0,	%f23,	%f0
loop_340:
	array16	%l0,	%g3,	%g5
loop_341:
	tleu	%xcc,	0x5
	xnor	%i7,	0x13F9,	%i5
	std	%f28,	[%l7 + 0x40]
	bg,a,pn	%xcc,	loop_342
	fandnot1s	%f26,	%f29,	%f17
	udivcc	%g6,	0x134E,	%g7
	srl	%o6,	%l5,	%g1
loop_342:
	fmovsleu	%xcc,	%f4,	%f8
	nop
	set	0x78, %g4
	std	%l2,	[%l7 + %g4]
	fcmple16	%f10,	%f20,	%o5
	bgu,a	%xcc,	loop_343
	ld	[%l7 + 0x08],	%f19
	edge32l	%o4,	%i4,	%o0
	movcc	%xcc,	%i2,	%i3
loop_343:
	sra	%l6,	%l2,	%o1
	fxnor	%f4,	%f6,	%f0
	movre	%l4,	%o3,	%g4
	tcs	%icc,	0x0
	fmovrdgz	%i6,	%f4,	%f24
	fsrc1	%f28,	%f22
	mova	%xcc,	%i1,	%g2
	nop
	set	0x48, %o1
	lduh	[%l7 + %o1],	%o2
	movvc	%icc,	%o7,	%l1
	tgu	%icc,	0x3
	fmovdleu	%xcc,	%f14,	%f18
	te	%xcc,	0x7
	fmovrdlez	%l0,	%f28,	%f0
	movle	%icc,	%i0,	%g3
	movrgz	%g5,	%i7,	%g6
	udiv	%g7,	0x13BA,	%o6
	bleu	loop_344
	mulx	%l5,	%i5,	%l3
	fmul8ulx16	%f6,	%f6,	%f26
	addcc	%o5,	%o4,	%g1
loop_344:
	ldd	[%l7 + 0x78],	%f30
	edge32	%i4,	%i2,	%o0
	orcc	%l6,	0x1329,	%l2
	edge32	%o1,	%l4,	%o3
	tpos	%xcc,	0x1
	fmovsl	%xcc,	%f7,	%f17
	movvc	%xcc,	%i3,	%i6
	addccc	%i1,	%g2,	%g4
	std	%f20,	[%l7 + 0x78]
	fbg	%fcc2,	loop_345
	brgz	%o2,	loop_346
	fmovsne	%xcc,	%f26,	%f20
	tcs	%xcc,	0x1
loop_345:
	orncc	%l1,	0x0985,	%l0
loop_346:
	subccc	%o7,	%g3,	%g5
	fmovrsgz	%i7,	%f17,	%f18
	movrlz	%i0,	%g6,	%o6
	fbn	%fcc3,	loop_347
	addccc	%l5,	%i5,	%g7
	fzeros	%f18
	std	%o4,	[%l7 + 0x50]
loop_347:
	fmovdg	%xcc,	%f16,	%f21
	fbne,a	%fcc3,	loop_348
	fmovrdgez	%o4,	%f26,	%f24
	movneg	%icc,	%l3,	%g1
	umul	%i2,	%o0,	%i4
loop_348:
	sethi	0x0B65,	%l2
	movrne	%l6,	%o1,	%l4
	set	0x28, %o2
	stwa	%o3,	[%l7 + %o2] 0xea
	membar	#Sync
	tsubcc	%i3,	%i6,	%i1
	fbge	%fcc0,	loop_349
	edge32ln	%g2,	%o2,	%l1
	fbe,a	%fcc3,	loop_350
	fbule,a	%fcc0,	loop_351
loop_349:
	edge16	%g4,	%l0,	%g3
	fmovdcc	%icc,	%f8,	%f31
loop_350:
	sdivx	%g5,	0x1D7C,	%o7
loop_351:
	tcc	%xcc,	0x2
	mova	%xcc,	%i7,	%i0
	edge8l	%g6,	%l5,	%o6
	movn	%xcc,	%i5,	%o5
	fcmpeq32	%f18,	%f30,	%o4
	set	0x6E, %l2
	stha	%g7,	[%l7 + %l2] 0x81
	movl	%icc,	%l3,	%i2
	tne	%xcc,	0x3
	srl	%g1,	%i4,	%o0
	fbg	%fcc3,	loop_352
	fmul8x16	%f14,	%f8,	%f28
	bshuffle	%f16,	%f26,	%f0
	fbne,a	%fcc2,	loop_353
loop_352:
	and	%l2,	%o1,	%l6
	orcc	%l4,	0x118E,	%o3
	fnot2	%f12,	%f14
loop_353:
	move	%xcc,	%i3,	%i6
	udiv	%g2,	0x0F0D,	%o2
	fmul8x16al	%f21,	%f11,	%f18
	ldstub	[%l7 + 0x21],	%l1
	orncc	%i1,	0x03BE,	%l0
	siam	0x5
	fxors	%f27,	%f1,	%f28
	tvs	%icc,	0x3
	fmovrsne	%g3,	%f28,	%f15
	ta	%icc,	0x6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tvs	%icc,	0x2
	movrne	%g4,	%g5,	%i7
	lduw	[%l7 + 0x7C],	%i0
	andn	%o7,	%l5,	%g6
	edge16l	%o6,	%o5,	%o4
	fmovrdgez	%g7,	%f2,	%f26
	bcs,a	%xcc,	loop_354
	std	%f24,	[%l7 + 0x70]
	fxors	%f0,	%f20,	%f24
	andcc	%l3,	%i5,	%g1
loop_354:
	stw	%i4,	[%l7 + 0x54]
	fmovdvc	%icc,	%f5,	%f7
	bneg,pt	%xcc,	loop_355
	sth	%o0,	[%l7 + 0x2E]
	xorcc	%l2,	0x1745,	%o1
	sdiv	%l6,	0x06B8,	%l4
loop_355:
	sdiv	%i2,	0x0E50,	%o3
	sub	%i3,	0x09EE,	%g2
	tcs	%xcc,	0x6
	andcc	%i6,	%o2,	%l1
	tne	%icc,	0x3
	fpadd16	%f22,	%f12,	%f2
	fbne,a	%fcc2,	loop_356
	fbue	%fcc0,	loop_357
	movge	%xcc,	%i1,	%g3
	movge	%icc,	%g4,	%l0
loop_356:
	andn	%g5,	0x16B4,	%i0
loop_357:
	call	loop_358
	fxnor	%f8,	%f12,	%f2
	bgu,a,pt	%xcc,	loop_359
	edge8ln	%i7,	%l5,	%g6
loop_358:
	alignaddr	%o6,	%o5,	%o7
	movrne	%o4,	%g7,	%i5
loop_359:
	ta	%xcc,	0x7
	andcc	%g1,	%l3,	%i4
	xorcc	%l2,	0x0F0E,	%o1
	srax	%o0,	%l4,	%i2
	movl	%icc,	%o3,	%l6
	tg	%icc,	0x4
	movvc	%icc,	%i3,	%g2
	brlez,a	%o2,	loop_360
	umulcc	%l1,	0x1B77,	%i1
	fmovspos	%xcc,	%f14,	%f11
	movneg	%xcc,	%g3,	%i6
loop_360:
	edge32n	%l0,	%g5,	%g4
	fcmpne32	%f28,	%f22,	%i0
	fmovsle	%icc,	%f25,	%f13
	ba,a,pt	%icc,	loop_361
	fpack32	%f28,	%f18,	%f0
	tle	%xcc,	0x0
	wr	%g0,	0x22,	%asi
	stwa	%i7,	[%l7 + 0x30] %asi
	membar	#Sync
loop_361:
	edge32n	%l5,	%g6,	%o6
	siam	0x7
	add	%o5,	0x04FE,	%o4
	fbne,a	%fcc0,	loop_362
	mova	%xcc,	%o7,	%g7
	fandnot2	%f8,	%f16,	%f2
	fmovdne	%icc,	%f23,	%f22
loop_362:
	fbug,a	%fcc3,	loop_363
	std	%g0,	[%l7 + 0x50]
	fcmped	%fcc2,	%f14,	%f0
	wr	%g0,	0x19,	%asi
	ldsba	[%l7 + 0x0F] %asi,	%i5
loop_363:
	nop
	membar	#Sync
	wr	%g0,	0x1f,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	or	%l3,	%l2,	%i4
	edge8ln	%o1,	%l4,	%i2
	tvs	%xcc,	0x4
	set	0x54, %o6
	lda	[%l7 + %o6] 0x15,	%f15
	set	0x44, %g7
	swapa	[%l7 + %g7] 0x80,	%o0
	stw	%o3,	[%l7 + 0x70]
	fornot2s	%f26,	%f20,	%f31
	membar	#Sync
	wr	%g0,	0x1f,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	xorcc	%l6,	0x1BBF,	%i3
	ld	[%l7 + 0x38],	%f21
	fbg	%fcc2,	loop_364
	tcc	%xcc,	0x2
	stbar
	or	%g2,	%o2,	%l1
loop_364:
	xorcc	%g3,	0x0676,	%i6
	fmovdg	%xcc,	%f12,	%f20
	bge	loop_365
	tge	%icc,	0x0
	orn	%l0,	0x0F81,	%i1
	tg	%xcc,	0x5
loop_365:
	taddcctv	%g4,	0x0DDE,	%g5
	tn	%xcc,	0x7
	or	%i0,	%i7,	%l5
	call	loop_366
	bg,a,pn	%icc,	loop_367
	fmovd	%f18,	%f4
	prefetch	[%l7 + 0x54],	 0x0
loop_366:
	sdivx	%o6,	0x0009,	%g6
loop_367:
	fmovspos	%xcc,	%f11,	%f5
	edge8l	%o4,	%o7,	%g7
	bvs,pt	%icc,	loop_368
	fexpand	%f7,	%f30
	taddcc	%o5,	%i5,	%g1
	fabss	%f9,	%f14
loop_368:
	fabss	%f10,	%f14
	andcc	%l3,	0x0315,	%l2
	add	%i4,	%l4,	%o1
	wr	%g0,	0x10,	%asi
	stxa	%i2,	[%l7 + 0x48] %asi
	ldstub	[%l7 + 0x5D],	%o0
	srl	%o3,	%i3,	%g2
	move	%xcc,	%l6,	%l1
	nop
	setx	loop_369,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fmovde	%icc,	%f3,	%f11
	popc	0x0D88,	%o2
	ld	[%l7 + 0x68],	%f28
loop_369:
	tl	%icc,	0x5
	movl	%icc,	%g3,	%l0
	movne	%icc,	%i1,	%i6
	movvc	%xcc,	%g4,	%i0
	orcc	%i7,	0x0457,	%g5
	taddcc	%o6,	%l5,	%o4
	sdivx	%o7,	0x071C,	%g7
	fcmpeq32	%f30,	%f18,	%o5
	fbg	%fcc1,	loop_370
	ldx	[%l7 + 0x60],	%g6
	set	0x40, %i1
	stda	%f16,	[%l7 + %i1] 0x18
loop_370:
	movcs	%icc,	%i5,	%l3
	movpos	%icc,	%l2,	%i4
	add	%l7,	0x6C,	%l6
	wr	%g0,	0x0c,	%asi
	casa	[%l6] 0x0c,	%l4,	%o1
	smulcc	%g1,	%o0,	%i2
	array32	%i3,	%g2,	%o3
	fbl	%fcc1,	loop_371
	movg	%icc,	%l1,	%l6
	fbug,a	%fcc3,	loop_372
	sth	%o2,	[%l7 + 0x78]
loop_371:
	sth	%g3,	[%l7 + 0x20]
	be	%icc,	loop_373
loop_372:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpackfix	%f24,	%f13
	fpadd16s	%f25,	%f12,	%f10
loop_373:
	fmul8x16	%f2,	%f16,	%f26
	fmovse	%icc,	%f24,	%f12
	add	%l0,	%i6,	%i1
	movne	%icc,	%i0,	%g4
	fmovsne	%xcc,	%f18,	%f16
	edge32ln	%i7,	%o6,	%g5
	edge16ln	%o4,	%l5,	%o7
	subccc	%o5,	0x1D1A,	%g6
	movrne	%g7,	%i5,	%l3
	tge	%icc,	0x0
	ldx	[%l7 + 0x30],	%i4
	fcmpeq32	%f24,	%f14,	%l2
	tsubcctv	%l4,	0x1834,	%g1
	movvc	%icc,	%o0,	%o1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	umulcc	%i3,	%i2,	%g2
	fnegs	%f29,	%f8
	movle	%xcc,	%l1,	%o3
	brlez,a	%l6,	loop_374
	array32	%g3,	%o2,	%i6
	smulcc	%i1,	0x0FC4,	%l0
	fzeros	%f18
loop_374:
	edge32n	%g4,	%i0,	%i7
	movl	%icc,	%g5,	%o4
	for	%f28,	%f4,	%f16
	lduh	[%l7 + 0x16],	%l5
	tsubcc	%o6,	0x006E,	%o5
	subccc	%g6,	0x0766,	%o7
	movgu	%icc,	%g7,	%i5
	movvc	%icc,	%l3,	%i4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	te	%xcc,	0x6
	bg,a	%xcc,	loop_375
	fandnot2s	%f25,	%f17,	%f17
	sub	%l2,	%g1,	%l4
	fcmpes	%fcc3,	%f5,	%f23
loop_375:
	fcmped	%fcc3,	%f18,	%f4
	wr	%g0,	0x04,	%asi
	prefetcha	[%l7 + 0x78] %asi,	 0x2
	ld	[%l7 + 0x1C],	%f25
	tle	%icc,	0x2
	udivx	%o1,	0x17B5,	%i2
	fmuld8ulx16	%f21,	%f19,	%f28
	edge32	%i3,	%g2,	%o3
	ldd	[%l7 + 0x50],	%l0
	fandnot1s	%f4,	%f15,	%f15
	set	0x28, %g6
	ldsha	[%l7 + %g6] 0x81,	%g3
	edge8l	%l6,	%o2,	%i6
	subc	%l0,	%g4,	%i0
	or	%i7,	0x1AA4,	%g5
	andncc	%i1,	%l5,	%o4
	nop
	set	0x56, %l6
	ldsb	[%l7 + %l6],	%o5
	udivcc	%o6,	0x0BEA,	%g6
	subccc	%g7,	%i5,	%l3
	movrlz	%i4,	%l2,	%o7
	tsubcc	%l4,	0x00E3,	%o0
	fexpand	%f19,	%f22
	movrlez	%g1,	%o1,	%i2
	edge32n	%g2,	%i3,	%l1
	fblg,a	%fcc3,	loop_376
	array16	%g3,	%l6,	%o2
	bvc,a,pn	%icc,	loop_377
	fbne	%fcc2,	loop_378
loop_376:
	fmovsa	%xcc,	%f2,	%f18
	udivx	%o3,	0x1B6C,	%i6
loop_377:
	sllx	%g4,	0x13,	%l0
loop_378:
	fornot2s	%f17,	%f21,	%f16
	taddcctv	%i7,	0x1D7A,	%g5
	nop
	set	0x4A, %l3
	ldsb	[%l7 + %l3],	%i0
	fxors	%f30,	%f11,	%f7
	bgu,a	%icc,	loop_379
	brz	%i1,	loop_380
	fmovse	%xcc,	%f10,	%f1
	movre	%l5,	%o4,	%o5
loop_379:
	sethi	0x1F29,	%o6
loop_380:
	stx	%g7,	[%l7 + 0x38]
	lduw	[%l7 + 0x3C],	%i5
	andn	%l3,	%g6,	%i4
	sethi	0x08BE,	%o7
	xorcc	%l4,	0x15CE,	%o0
	fpackfix	%f0,	%f4
	sdivx	%l2,	0x1D33,	%o1
	movleu	%icc,	%i2,	%g2
	fmovdne	%xcc,	%f6,	%f28
	movl	%xcc,	%g1,	%i3
	movcs	%xcc,	%l1,	%l6
	movgu	%icc,	%o2,	%o3
	fmovscc	%xcc,	%f11,	%f10
	movleu	%icc,	%i6,	%g3
	array8	%g4,	%l0,	%i7
	tgu	%icc,	0x6
	ld	[%l7 + 0x14],	%f13
	umulcc	%i0,	%g5,	%i1
	mulscc	%o4,	%o5,	%l5
	membar	0x68
	wr	%g0,	0x80,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	ldd	[%l7 + 0x60],	%f0
	tn	%xcc,	0x7
	movrne	%o6,	0x1C7,	%g7
	fabss	%f30,	%f1
	fmovdle	%icc,	%f2,	%f21
	fbge,a	%fcc0,	loop_381
	edge32n	%l3,	%g6,	%i5
	fmovrslez	%i4,	%f12,	%f6
	fnand	%f10,	%f26,	%f6
loop_381:
	andncc	%l4,	%o7,	%o0
	srl	%o1,	%l2,	%g2
	ta	%xcc,	0x5
	or	%g1,	0x1484,	%i2
	sdivcc	%l1,	0x1456,	%i3
	set	0x6C, %l0
	swapa	[%l7 + %l0] 0x0c,	%l6
	movcc	%xcc,	%o3,	%i6
	tgu	%icc,	0x0
	stw	%o2,	[%l7 + 0x78]
	movre	%g3,	0x174,	%l0
	wr	%g0,	0x10,	%asi
	stda	%g4,	[%l7 + 0x58] %asi
	wr	%g0,	0x11,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	brnz	%i0,	loop_382
	edge16ln	%g5,	%i7,	%o4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmul8ulx16	%f6,	%f6,	%f2
loop_382:
	tcc	%xcc,	0x1
	movvc	%icc,	%o5,	%i1
	fmovd	%f14,	%f6
	wr	%g0,	0x04,	%asi
	lduwa	[%l7 + 0x1C] %asi,	%l5
	srl	%g7,	0x16,	%o6
	popc	%g6,	%i5
	ldub	[%l7 + 0x36],	%i4
	movrlz	%l3,	%l4,	%o7
	movrlez	%o1,	%o0,	%l2
	fmovsge	%icc,	%f10,	%f22
	tle	%xcc,	0x6
	add	%g2,	%i2,	%l1
	pdist	%f28,	%f22,	%f18
	movpos	%icc,	%g1,	%i3
	tvc	%xcc,	0x4
	edge16ln	%l6,	%o3,	%i6
	sllx	%o2,	0x1C,	%l0
	fornot1	%f12,	%f16,	%f16
	fmul8x16au	%f14,	%f22,	%f12
	sethi	0x1FD2,	%g3
	edge32	%i0,	%g5,	%g4
	fcmpd	%fcc3,	%f0,	%f18
	bne,pt	%xcc,	loop_383
	fnot2	%f8,	%f26
	movle	%xcc,	%o4,	%o5
	fxors	%f9,	%f9,	%f19
loop_383:
	edge32l	%i7,	%i1,	%g7
	fors	%f22,	%f1,	%f21
	sdivx	%o6,	0x011C,	%l5
	wr	%g0,	0x10,	%asi
	ldswa	[%l7 + 0x40] %asi,	%g6
	std	%i4,	[%l7 + 0x70]
	nop
	set	0x44, %g1
	stb	%l3,	[%l7 + %g1]
	alignaddr	%l4,	%i4,	%o7
	udivx	%o0,	0x097C,	%l2
	edge16n	%o1,	%i2,	%l1
	wr	%g0,	0x10,	%asi
	prefetcha	[%l7 + 0x20] %asi,	 0x1
	fbg,a	%fcc3,	loop_384
	or	%i3,	0x0BA8,	%l6
	std	%g0,	[%l7 + 0x10]
	fmovrdgez	%o3,	%f6,	%f0
loop_384:
	fmovdg	%xcc,	%f17,	%f14
	set	0x50, %i2
	prefetcha	[%l7 + %i2] 0x15,	 0x2
	udivx	%l0,	0x05AB,	%g3
	bpos,a,pt	%icc,	loop_385
	movneg	%xcc,	%i0,	%g5
	fone	%f8
	movre	%o2,	%g4,	%o5
loop_385:
	fnot2s	%f1,	%f19
	tg	%xcc,	0x0
	fbue,a	%fcc0,	loop_386
	tn	%xcc,	0x0
	andcc	%i7,	0x1F12,	%i1
	fmul8x16al	%f18,	%f27,	%f8
loop_386:
	fmovde	%icc,	%f18,	%f25
	umul	%g7,	0x15DD,	%o6
	ta	%icc,	0x2
	ldd	[%l7 + 0x48],	%f8
	move	%xcc,	%l5,	%o4
	ble	%icc,	loop_387
	fnot1	%f2,	%f10
	alignaddr	%i5,	%l3,	%g6
	set	0x7E, %i5
	ldstuba	[%l7 + %i5] 0x81,	%i4
loop_387:
	tge	%xcc,	0x5
	orncc	%l4,	%o7,	%o0
	tcs	%xcc,	0x0
	nop
	setx loop_388, %l0, %l1
	jmpl %l1, %o1
	tleu	%xcc,	0x3
	nop
	setx	loop_389,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	array16	%l2,	%i2,	%l1
loop_388:
	movg	%icc,	%g2,	%l6
	bn,pt	%icc,	loop_390
loop_389:
	bg,a	loop_391
	st	%f14,	[%l7 + 0x54]
	smulcc	%g1,	%i3,	%o3
loop_390:
	popc	%l0,	%g3
loop_391:
	sth	%i0,	[%l7 + 0x1C]
	movrlz	%i6,	%o2,	%g5
	edge8	%g4,	%o5,	%i7
	te	%xcc,	0x6
	movleu	%icc,	%g7,	%o6
	bgu,pt	%icc,	loop_392
	array32	%l5,	%i1,	%o4
	or	%l3,	%g6,	%i4
	edge8n	%l4,	%o7,	%o0
loop_392:
	sethi	0x093E,	%o1
	movleu	%xcc,	%i5,	%l2
	addccc	%l1,	0x0F9A,	%g2
	membar	0x1D
	srax	%i2,	%l6,	%i3
	edge8n	%g1,	%l0,	%o3
	set	0x60, %i6
	sta	%f19,	[%l7 + %i6] 0x0c
	array16	%g3,	%i0,	%i6
	fnor	%f30,	%f2,	%f18
	ldub	[%l7 + 0x14],	%g5
	add	%g4,	%o2,	%o5
	set	0x2C, %l1
	sta	%f2,	[%l7 + %l1] 0x15
	edge16	%g7,	%i7,	%o6
	movge	%icc,	%i1,	%l5
	stbar
	flush	%l7 + 0x50
	fmovs	%f6,	%f2
	movrlz	%l3,	%o4,	%i4
	alignaddrl	%g6,	%l4,	%o7
	fpadd16s	%f16,	%f3,	%f30
	brnz,a	%o1,	loop_393
	xnorcc	%o0,	0x009F,	%l2
	movl	%xcc,	%l1,	%g2
	fmovsleu	%icc,	%f6,	%f17
loop_393:
	array16	%i5,	%l6,	%i2
	movn	%xcc,	%g1,	%l0
	tleu	%xcc,	0x4
	sub	%i3,	0x0281,	%o3
	tvs	%icc,	0x6
	fbul,a	%fcc1,	loop_394
	tg	%xcc,	0x3
	fbe,a	%fcc1,	loop_395
	bge,a	loop_396
loop_394:
	tg	%icc,	0x2
	fmovrsgz	%i0,	%f14,	%f26
loop_395:
	stw	%i6,	[%l7 + 0x58]
loop_396:
	bgu,a,pt	%xcc,	loop_397
	bn	%xcc,	loop_398
	movcs	%icc,	%g5,	%g3
	sdivx	%g4,	0x039E,	%o5
loop_397:
	srl	%g7,	%i7,	%o6
loop_398:
	movge	%xcc,	%i1,	%o2
	orn	%l3,	0x0462,	%l5
	andcc	%i4,	0x17C0,	%g6
	fbn	%fcc3,	loop_399
	srax	%o4,	%l4,	%o1
	fnot2s	%f12,	%f6
	tcs	%icc,	0x7
loop_399:
	ldx	[%l7 + 0x50],	%o0
	smul	%o7,	0x0C90,	%l1
	fmovd	%f12,	%f16
	sethi	0x152F,	%g2
	tsubcc	%i5,	%l2,	%i2
	alignaddr	%g1,	%l6,	%i3
	membar	0x07
	andcc	%l0,	%o3,	%i6
	wr	%g0,	0x89,	%asi
	stwa	%g5,	[%l7 + 0x2C] %asi
	prefetch	[%l7 + 0x74],	 0x1
	movrlz	%g3,	%g4,	%o5
	ba	loop_400
	alignaddr	%i0,	%g7,	%i7
	orn	%o6,	%o2,	%i1
	set	0x24, %o7
	ldsha	[%l7 + %o7] 0x04,	%l5
loop_400:
	addcc	%i4,	0x142F,	%l3
	fble	%fcc0,	loop_401
	fxors	%f7,	%f16,	%f16
	umulcc	%o4,	%l4,	%o1
	fmovsge	%icc,	%f22,	%f8
loop_401:
	edge16ln	%g6,	%o7,	%l1
	fbge,a	%fcc0,	loop_402
	tcc	%xcc,	0x3
	fbo,a	%fcc0,	loop_403
	fmovse	%icc,	%f27,	%f26
loop_402:
	bne,a	loop_404
	sllx	%g2,	0x14,	%o0
loop_403:
	ldd	[%l7 + 0x70],	%i4
	wr	%g0,	0x0c,	%asi
	prefetcha	[%l7 + 0x78] %asi,	 0x3
loop_404:
	nop
	wr	%g0,	0x10,	%asi
	lduba	[%l7 + 0x4F] %asi,	%l2
	fbe,a	%fcc0,	loop_405
	nop
	setx loop_406, %l0, %l1
	jmpl %l1, %l6
	taddcctv	%g1,	%i3,	%l0
	fabsd	%f30,	%f6
loop_405:
	xor	%i6,	0x0C8A,	%o3
loop_406:
	tpos	%icc,	0x7
	movvs	%xcc,	%g5,	%g4
	fmovsle	%xcc,	%f18,	%f22
	srl	%g3,	%o5,	%i0
	mulscc	%g7,	0x1CD1,	%o6
	xor	%i7,	%i1,	%l5
	addc	%o2,	0x0DCA,	%i4
	movne	%xcc,	%l3,	%o4
	tvs	%icc,	0x3
	movrgez	%o1,	%l4,	%o7
	bcc	loop_407
	udivcc	%g6,	0x0600,	%l1
	fnot2s	%f4,	%f26
	fmovsvs	%xcc,	%f21,	%f0
loop_407:
	andn	%g2,	0x0E4F,	%o0
	fbg,a	%fcc1,	loop_408
	movl	%xcc,	%i2,	%i5
	movrgz	%l6,	0x085,	%g1
	bvs,pt	%xcc,	loop_409
loop_408:
	udiv	%l2,	0x0BC0,	%i3
	fmovdcs	%icc,	%f25,	%f5
	edge32n	%i6,	%l0,	%o3
loop_409:
	sdivcc	%g5,	0x1865,	%g4
	and	%o5,	%i0,	%g7
	fmovrsgz	%g3,	%f10,	%f22
	fpsub32	%f16,	%f26,	%f30
	udivcc	%i7,	0x060C,	%i1
	swap	[%l7 + 0x14],	%l5
	te	%xcc,	0x0
	edge16l	%o2,	%i4,	%o6
	fpsub16s	%f2,	%f28,	%f19
	alignaddrl	%l3,	%o1,	%l4
	fcmpne32	%f14,	%f30,	%o4
	addccc	%o7,	0x0048,	%l1
	bgu	%xcc,	loop_410
	ldsw	[%l7 + 0x6C],	%g2
	fpadd16s	%f5,	%f10,	%f0
	brlez,a	%g6,	loop_411
loop_410:
	ldx	[%l7 + 0x30],	%o0
	xor	%i2,	%l6,	%i5
	faligndata	%f20,	%f20,	%f14
loop_411:
	ld	[%l7 + 0x48],	%f19
	movrlz	%l2,	0x2B5,	%i3
	subcc	%i6,	%g1,	%l0
	xor	%g5,	0x07C7,	%g4
	movn	%xcc,	%o5,	%o3
	movl	%xcc,	%i0,	%g3
	fbn,a	%fcc3,	loop_412
	mova	%xcc,	%i7,	%i1
	fexpand	%f9,	%f6
	fnot2s	%f24,	%f19
loop_412:
	nop
	wr	%g0,	0x18,	%asi
	stba	%g7,	[%l7 + 0x62] %asi
	popc	0x15B6,	%o2
	edge16n	%l5,	%i4,	%o6
	fmovrslz	%l3,	%f27,	%f4
	tsubcc	%l4,	0x0AE5,	%o1
	fpackfix	%f20,	%f0
	xor	%o4,	0x1819,	%o7
	movcc	%icc,	%g2,	%l1
	fcmpeq16	%f2,	%f28,	%o0
	movvc	%xcc,	%i2,	%g6
	tsubcctv	%l6,	%i5,	%i3
	fnot1	%f4,	%f4
	edge32n	%l2,	%g1,	%l0
	fbul	%fcc1,	loop_413
	udiv	%g5,	0x17B4,	%g4
	array32	%i6,	%o5,	%i0
	sethi	0x0C56,	%o3
loop_413:
	tle	%icc,	0x4
	bneg,pt	%icc,	loop_414
	movrlz	%i7,	0x39C,	%g3
	tgu	%icc,	0x3
	movrgz	%g7,	%i1,	%o2
loop_414:
	tneg	%xcc,	0x5
	wr	%g0,	0x19,	%asi
	stda	%i4,	[%l7 + 0x78] %asi
	fnot1s	%f18,	%f31
	udivx	%o6,	0x1E09,	%l5
	edge32	%l4,	%l3,	%o1
	bl,a	%icc,	loop_415
	sub	%o4,	0x110E,	%o7
	nop
	setx loop_416, %l0, %l1
	jmpl %l1, %l1
	xorcc	%o0,	%i2,	%g2
loop_415:
	movvs	%xcc,	%l6,	%i5
	be,pn	%icc,	loop_417
loop_416:
	bge,a,pn	%xcc,	loop_418
	tneg	%icc,	0x4
	call	loop_419
loop_417:
	andncc	%g6,	%l2,	%g1
loop_418:
	tl	%xcc,	0x1
	srlx	%l0,	0x15,	%i3
loop_419:
	edge32	%g5,	%i6,	%o5
	fmovrdne	%g4,	%f28,	%f10
	and	%i0,	%i7,	%o3
	movvs	%icc,	%g3,	%g7
	fcmpeq32	%f18,	%f0,	%i1
	pdist	%f18,	%f18,	%f16
	ba	loop_420
	fnegs	%f21,	%f20
	fbule,a	%fcc0,	loop_421
	movn	%xcc,	%i4,	%o6
loop_420:
	addcc	%l5,	%o2,	%l3
	tg	%xcc,	0x5
loop_421:
	movrne	%o1,	%l4,	%o4
	movl	%xcc,	%o7,	%l1
	fmovrsne	%i2,	%f17,	%f1
	andncc	%o0,	%g2,	%i5
	edge8ln	%l6,	%g6,	%g1
	fmuld8ulx16	%f11,	%f24,	%f22
	sub	%l2,	%l0,	%i3
	ta	%xcc,	0x0
	membar	0x60
	tn	%xcc,	0x3
	fabsd	%f16,	%f4
	array16	%i6,	%g5,	%g4
	fmovsvc	%icc,	%f4,	%f30
	popc	%o5,	%i7
	fcmpeq32	%f2,	%f6,	%i0
	fsrc1	%f30,	%f8
	alignaddr	%o3,	%g3,	%i1
	fbe,a	%fcc1,	loop_422
	bneg,pn	%icc,	loop_423
	srlx	%i4,	%g7,	%l5
	movpos	%xcc,	%o2,	%l3
loop_422:
	nop
	set	0x31, %o5
	ldstub	[%l7 + %o5],	%o1
loop_423:
	fbge	%fcc1,	loop_424
	edge32n	%l4,	%o6,	%o4
	movn	%xcc,	%o7,	%l1
	edge8ln	%o0,	%g2,	%i5
loop_424:
	andn	%l6,	%g6,	%i2
	movne	%icc,	%l2,	%l0
	bn	%xcc,	loop_425
	brlez	%i3,	loop_426
	movle	%xcc,	%i6,	%g5
	edge32ln	%g1,	%g4,	%o5
loop_425:
	movrgez	%i0,	0x36C,	%i7
loop_426:
	subc	%g3,	0x10D9,	%i1
	fbl,a	%fcc2,	loop_427
	brgez,a	%o3,	loop_428
	movl	%icc,	%i4,	%l5
	tne	%xcc,	0x0
loop_427:
	srl	%o2,	%g7,	%o1
loop_428:
	srlx	%l4,	0x1B,	%l3
	movgu	%icc,	%o6,	%o7
	sll	%o4,	0x0D,	%o0
	bcc,pn	%xcc,	loop_429
	fones	%f1
	edge8n	%l1,	%g2,	%i5
	stbar
loop_429:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrlez	%g6,	%l6,	%i2
	xor	%l2,	%i3,	%i6
	addc	%l0,	%g1,	%g4
	set	0x26, %i0
	lduha	[%l7 + %i0] 0x04,	%o5
	sllx	%i0,	0x14,	%i7
	stw	%g5,	[%l7 + 0x7C]
	movcs	%xcc,	%i1,	%g3
	xorcc	%i4,	%l5,	%o2
	fmovda	%icc,	%f30,	%f6
	orn	%o3,	%g7,	%l4
	srax	%l3,	%o6,	%o7
	wr	%g0,	0x04,	%asi
	ldsba	[%l7 + 0x1D] %asi,	%o4
	xnorcc	%o0,	0x033B,	%o1
	smul	%g2,	0x1C09,	%l1
	alignaddr	%g6,	%i5,	%l6
	srl	%l2,	%i3,	%i6
	sra	%i2,	0x1B,	%l0
	sdivcc	%g4,	0x0E3B,	%o5
	movge	%xcc,	%i0,	%g1
	subc	%i7,	%i1,	%g5
	fpadd32s	%f22,	%f28,	%f21
	movvs	%icc,	%i4,	%l5
	or	%g3,	%o2,	%o3
	xor	%g7,	%l4,	%l3
	movpos	%xcc,	%o7,	%o4
	fmovdgu	%icc,	%f16,	%f2
	tpos	%icc,	0x1
	addccc	%o6,	0x0046,	%o0
	edge16	%o1,	%g2,	%g6
	fpackfix	%f20,	%f8
	mulscc	%i5,	0x0D78,	%l6
	addc	%l2,	0x1A92,	%l1
	edge32	%i3,	%i2,	%i6
	fble	%fcc1,	loop_430
	mulscc	%l0,	%g4,	%i0
	movl	%xcc,	%g1,	%o5
	fornot2s	%f24,	%f30,	%f8
loop_430:
	movvs	%icc,	%i1,	%g5
	tvs	%icc,	0x5
	ldstub	[%l7 + 0x50],	%i4
	fbuge	%fcc2,	loop_431
	movle	%icc,	%i7,	%l5
	fbe	%fcc0,	loop_432
	tne	%icc,	0x3
loop_431:
	subccc	%g3,	%o2,	%o3
	andn	%l4,	0x1F7E,	%g7
loop_432:
	fxor	%f2,	%f28,	%f30
	movrlez	%l3,	0x29B,	%o4
	fcmps	%fcc2,	%f9,	%f18
	sth	%o7,	[%l7 + 0x22]
	fors	%f16,	%f22,	%f9
	movl	%xcc,	%o6,	%o1
	fmovrdne	%o0,	%f10,	%f4
	fzero	%f16
	fpadd16	%f4,	%f6,	%f26
	wr	%g0,	0x88,	%asi
	lda	[%l7 + 0x4C] %asi,	%f14
	brz,a	%g6,	loop_433
	tpos	%xcc,	0x5
	udivx	%i5,	0x1769,	%l6
	ta	%icc,	0x3
loop_433:
	fmovsn	%xcc,	%f13,	%f20
	fcmpgt16	%f18,	%f18,	%l2
	tpos	%xcc,	0x2
	mulx	%g2,	%l1,	%i3
	umul	%i6,	0x06EB,	%l0
	fandnot2	%f6,	%f6,	%f8
	movn	%icc,	%g4,	%i2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sethi	0x11C4,	%i0
	movrlz	%g1,	%o5,	%i1
	popc	0x0CD8,	%g5
	movl	%icc,	%i4,	%l5
	umulcc	%i7,	%g3,	%o2
	movrlz	%o3,	0x2E8,	%l4
	popc	0x1296,	%g7
	ldd	[%l7 + 0x18],	%f20
	fbule	%fcc2,	loop_434
	movg	%xcc,	%o4,	%l3
	fbue	%fcc1,	loop_435
	sdivx	%o7,	0x1B94,	%o6
loop_434:
	sethi	0x1F2F,	%o1
	fcmpeq32	%f26,	%f2,	%o0
loop_435:
	ldx	[%l7 + 0x68],	%g6
	fpsub32	%f26,	%f10,	%f6
	edge32l	%l6,	%i5,	%g2
	edge8	%l2,	%i3,	%l1
	ldd	[%l7 + 0x38],	%i6
	subcc	%g4,	%i2,	%i0
	sir	0x09BA
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fand	%f16,	%f8,	%f24
	fmovrde	%l0,	%f2,	%f24
	ldsb	[%l7 + 0x12],	%g1
	fbug	%fcc3,	loop_436
	srax	%o5,	%i1,	%i4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8	%l5,	%g5,	%i7
loop_436:
	add	%g3,	0x0216,	%o2
	bne,a,pn	%icc,	loop_437
	movrlz	%l4,	%g7,	%o3
	fpsub32s	%f1,	%f2,	%f28
	wr	%g0,	0x04,	%asi
	lduba	[%l7 + 0x39] %asi,	%o4
loop_437:
	fmovdne	%icc,	%f14,	%f25
	flush	%l7 + 0x38
	add	%l7,	0x38,	%l6
	wr	%g0,	0x18,	%asi
	casxa	[%l6] %asi,	%l3,	%o6
	udivcc	%o7,	0x04CC,	%o0
	fand	%f22,	%f26,	%f2
	fpack16	%f12,	%f20
	movrlez	%o1,	%l6,	%i5
	fxnor	%f8,	%f2,	%f20
	xor	%g2,	0x1C7F,	%l2
	addcc	%i3,	%g6,	%i6
	wr	%g0,	0x80,	%asi
	ldxa	[%l7 + 0x10] %asi,	%l1
	fmovsgu	%icc,	%f24,	%f5
	and	%i2,	%i0,	%g4
	fbul,a	%fcc3,	loop_438
	xnorcc	%g1,	%o5,	%i1
	set	0x4C, %o0
	stha	%i4,	[%l7 + %o0] 0x19
loop_438:
	bge,a	%icc,	loop_439
	tsubcc	%l5,	%g5,	%l0
	sdivcc	%g3,	0x14D6,	%i7
	fbuge	%fcc1,	loop_440
loop_439:
	edge16l	%o2,	%g7,	%o3
	movrlz	%o4,	0x376,	%l4
	tsubcctv	%l3,	0x0940,	%o7
loop_440:
	fbne,a	%fcc2,	loop_441
	sdivcc	%o6,	0x0987,	%o0
	fmovdvs	%icc,	%f14,	%f18
	popc	0x0297,	%o1
loop_441:
	fbug	%fcc2,	loop_442
	sir	0x04AB
	tgu	%icc,	0x6
	bge	%xcc,	loop_443
loop_442:
	movg	%icc,	%l6,	%i5
	xnorcc	%g2,	%i3,	%l2
	movrgez	%i6,	0x0E8,	%l1
loop_443:
	nop
	set	0x56, %o3
	lduha	[%l7 + %o3] 0x80,	%i2
	fbne	%fcc1,	loop_444
	bvs	%icc,	loop_445
	fmovsleu	%xcc,	%f17,	%f19
	prefetch	[%l7 + 0x20],	 0x1
loop_444:
	movne	%icc,	%i0,	%g4
loop_445:
	tsubcctv	%g1,	0x0506,	%o5
	tsubcctv	%g6,	%i1,	%i4
	edge32n	%g5,	%l0,	%g3
	brz	%l5,	loop_446
	edge32ln	%o2,	%g7,	%i7
	bpos,a	loop_447
	mulx	%o4,	0x042C,	%l4
loop_446:
	udivcc	%o3,	0x0510,	%o7
	movvc	%xcc,	%o6,	%o0
loop_447:
	sub	%o1,	%l6,	%i5
	bneg,a	%icc,	loop_448
	move	%xcc,	%g2,	%l3
	movcc	%icc,	%l2,	%i6
	st	%f25,	[%l7 + 0x30]
loop_448:
	movpos	%icc,	%i3,	%l1
	set	0x34, %i3
	swapa	[%l7 + %i3] 0x88,	%i2
	set	0x2E, %g3
	stha	%g4,	[%l7 + %g3] 0x2b
	membar	#Sync
	tne	%xcc,	0x6
	fblg	%fcc1,	loop_449
	movne	%xcc,	%i0,	%g1
	set	0x40, %o4
	stda	%f16,	[%l7 + %o4] 0x14
loop_449:
	mulx	%o5,	%i1,	%i4
	tleu	%xcc,	0x0
	nop
	setx	loop_450,	%l0,	%l1
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
	movvc	%xcc,	%g6,	%g5
	array8	%l0,	%l5,	%o2
loop_450:
	membar	0x05
	mulscc	%g3,	0x1572,	%i7
	taddcc	%g7,	0x1546,	%o4
	fcmple16	%f18,	%f24,	%l4
	umulcc	%o7,	0x0D38,	%o6
	move	%xcc,	%o3,	%o1
	taddcc	%l6,	%i5,	%o0
	tcs	%xcc,	0x2
	fmovscs	%icc,	%f19,	%f15
	edge32n	%l3,	%l2,	%g2
	bgu,a	%icc,	loop_451
	addccc	%i6,	0x06F5,	%i3
	popc	%l1,	%g4
	be,pt	%xcc,	loop_452
loop_451:
	tgu	%icc,	0x1
	call	loop_453
	fmovdcs	%xcc,	%f9,	%f14
loop_452:
	swap	[%l7 + 0x08],	%i2
	edge32n	%g1,	%o5,	%i0
loop_453:
	nop
	add	%l7,	0x5C,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%i4
	casa	[%l6] 0x80,	%i4,	%i1
	mulscc	%g6,	%l0,	%l5
	tgu	%icc,	0x6
	fand	%f26,	%f12,	%f4
	nop
	setx loop_454, %l0, %l1
	jmpl %l1, %g5
	fmovdle	%icc,	%f8,	%f4
	taddcctv	%g3,	0x10B8,	%i7
	tne	%xcc,	0x4
loop_454:
	bvc,a,pn	%icc,	loop_455
	tge	%xcc,	0x3
	ble,a,pt	%icc,	loop_456
	fpack32	%f12,	%f0,	%f2
loop_455:
	fxor	%f18,	%f6,	%f6
	add	%l7,	0x10,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%g7
	casxa	[%l6] 0x80,	%g7,	%o2
loop_456:
	orncc	%l4,	%o7,	%o6
	add	%l7,	0x48,	%l6
	wr	%g0,	0x10,	%asi
	casxa	[%l6] 0x10,	%o3,	%o4
	fsrc2	%f10,	%f4
	fba,a	%fcc3,	loop_457
	fornot2s	%f5,	%f2,	%f26
	movleu	%xcc,	%o1,	%l6
	or	%o0,	%l3,	%i5
loop_457:
	alignaddr	%g2,	%i6,	%l2
	ba,a,pn	%icc,	loop_458
	fbuge	%fcc1,	loop_459
	movn	%xcc,	%l1,	%i3
	xorcc	%g4,	%i2,	%g1
loop_458:
	nop
	set	0x40, %l5
	stda	%f16,	[%l7 + %l5] 0x1e
	membar	#Sync
loop_459:
	movneg	%icc,	%o5,	%i4
	bpos	%icc,	loop_460
	fsrc1	%f14,	%f14
	fmovdcs	%icc,	%f5,	%f0
	fmovrdne	%i1,	%f20,	%f0
loop_460:
	subccc	%g6,	0x19B3,	%l0
	movvs	%icc,	%i0,	%l5
	tcc	%xcc,	0x4
	fcmpes	%fcc1,	%f0,	%f4
	sll	%g5,	0x11,	%g3
	mulscc	%i7,	%g7,	%l4
	fbule,a	%fcc3,	loop_461
	fmovdg	%icc,	%f27,	%f7
	sra	%o2,	0x1F,	%o7
	fcmpne16	%f8,	%f12,	%o3
loop_461:
	lduw	[%l7 + 0x4C],	%o4
	fblg	%fcc0,	loop_462
	addcc	%o1,	0x0571,	%o6
	movneg	%xcc,	%l6,	%o0
	stbar
loop_462:
	fabsd	%f26,	%f2
	fble	%fcc2,	loop_463
	udiv	%l3,	0x12E7,	%i5
	popc	%i6,	%g2
	add	%l2,	%l1,	%i3
loop_463:
	udiv	%i2,	0x1894,	%g4
	alignaddrl	%g1,	%i4,	%o5
	andcc	%i1,	0x16BE,	%g6
	fble	%fcc3,	loop_464
	movne	%icc,	%i0,	%l0
	sllx	%l5,	0x1B,	%g3
	fbug,a	%fcc2,	loop_465
loop_464:
	bshuffle	%f12,	%f28,	%f26
	fmovscc	%xcc,	%f3,	%f8
	movvs	%xcc,	%g5,	%i7
loop_465:
	nop
	set	0x40, %g5
	stda	%f0,	[%l7 + %g5] 0x81
	sdivcc	%g7,	0x0F70,	%l4
	tcc	%xcc,	0x1
	taddcctv	%o2,	0x0D72,	%o7
	fmovsg	%xcc,	%f17,	%f18
	fpack32	%f20,	%f8,	%f22
	tsubcc	%o3,	0x135B,	%o4
	fabsd	%f6,	%f12
	fbne,a	%fcc2,	loop_466
	movrgz	%o1,	%o6,	%l6
	tleu	%icc,	0x4
	be,a,pn	%xcc,	loop_467
loop_466:
	movrlz	%l3,	%i5,	%i6
	or	%g2,	%l2,	%l1
	andcc	%i3,	0x1490,	%o0
loop_467:
	nop
	set	0x40, %l4
	prefetcha	[%l7 + %l4] 0x19,	 0x2
	fmovspos	%icc,	%f10,	%f15
	or	%i2,	0x0644,	%i4
	movcs	%xcc,	%o5,	%g1
	wr	%g0,	0x88,	%asi
	lda	[%l7 + 0x54] %asi,	%f24
	movre	%g6,	0x23E,	%i0
	mulx	%i1,	%l5,	%l0
	edge16l	%g5,	%g3,	%g7
	edge32ln	%l4,	%o2,	%o7
	fmovsneg	%icc,	%f20,	%f17
	sdiv	%o3,	0x030E,	%o4
	tpos	%icc,	0x6
	fmovdne	%icc,	%f22,	%f31
	fbul,a	%fcc3,	loop_468
	edge32	%o1,	%o6,	%i7
	movne	%xcc,	%l6,	%l3
	srl	%i5,	0x18,	%g2
loop_468:
	nop
	wr	%g0,	0x89,	%asi
	lduha	[%l7 + 0x46] %asi,	%l2
	udivx	%l1,	0x1E89,	%i3
	fmovrde	%o0,	%f22,	%f22
	add	%l7,	0x58,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] %asi,	%i6,	%g4
	sll	%i2,	0x06,	%o5
	orncc	%i4,	0x0541,	%g6
	stx	%i0,	[%l7 + 0x48]
	movl	%xcc,	%i1,	%l5
	fexpand	%f18,	%f12
	sdiv	%g1,	0x0990,	%g5
	fcmps	%fcc1,	%f17,	%f20
	edge8n	%l0,	%g3,	%l4
	movneg	%icc,	%o2,	%g7
	tneg	%icc,	0x6
	array32	%o3,	%o7,	%o4
	movrlz	%o6,	0x057,	%o1
	wr	%g0,	0x18,	%asi
	sta	%f8,	[%l7 + 0x30] %asi
	fmovrsgz	%i7,	%f15,	%f25
	srax	%l3,	%l6,	%i5
	fmovdpos	%icc,	%f24,	%f7
	movge	%icc,	%l2,	%g2
	movn	%icc,	%i3,	%l1
	fmovspos	%xcc,	%f9,	%f12
	for	%f18,	%f8,	%f30
	array16	%o0,	%i6,	%g4
	movn	%icc,	%i2,	%o5
	tvs	%icc,	0x0
	set	0x44, %g2
	ldsba	[%l7 + %g2] 0x80,	%g6
	stx	%i4,	[%l7 + 0x38]
	xnor	%i1,	0x1A4F,	%l5
	fpadd16s	%f4,	%f21,	%f1
	nop
	setx	loop_469,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movrlz	%i0,	0x0B3,	%g1
	movrgez	%l0,	%g5,	%g3
	add	%l7,	0x3C,	%l6
	wr	%g0,	0x18,	%asi
	casa	[%l6] %asi,	%l4,	%o2
loop_469:
	sll	%o3,	%g7,	%o4
	srl	%o6,	%o1,	%o7
	fpsub32	%f16,	%f24,	%f10
	tl	%icc,	0x7
	edge32ln	%l3,	%l6,	%i5
	edge8l	%i7,	%g2,	%i3
	edge32l	%l1,	%l2,	%i6
	edge8ln	%o0,	%g4,	%o5
	st	%f2,	[%l7 + 0x6C]
	be,a,pt	%icc,	loop_470
	stb	%i2,	[%l7 + 0x77]
	xor	%g6,	0x084B,	%i4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_470:
	fbne	%fcc3,	loop_471
	movleu	%xcc,	%l5,	%i1
	array8	%g1,	%i0,	%l0
	orcc	%g3,	0x00AB,	%l4
loop_471:
	fbu,a	%fcc3,	loop_472
	ba	loop_473
	movpos	%icc,	%g5,	%o2
	srlx	%o3,	0x08,	%o4
loop_472:
	fblg	%fcc3,	loop_474
loop_473:
	fmovdcc	%xcc,	%f14,	%f24
	ble	loop_475
	tcc	%xcc,	0x5
loop_474:
	fble,a	%fcc1,	loop_476
	tn	%icc,	0x1
loop_475:
	fmovdneg	%icc,	%f27,	%f5
	stx	%o6,	[%l7 + 0x68]
loop_476:
	subccc	%g7,	%o1,	%o7
	bne,a,pt	%xcc,	loop_477
	fabss	%f22,	%f10
	set	0x50, %i7
	stda	%i6,	[%l7 + %i7] 0x23
	membar	#Sync
loop_477:
	array16	%i5,	%l3,	%g2
	tl	%icc,	0x7
	fmovsn	%icc,	%f2,	%f25
	fbule,a	%fcc3,	loop_478
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tgu	%icc,	0x4
	fmovrse	%i3,	%f16,	%f21
loop_478:
	nop
	set	0x6F, %i4
	ldstuba	[%l7 + %i4] 0x11,	%l1
	sra	%i7,	0x09,	%i6
	udivcc	%l2,	0x1610,	%g4
	movneg	%xcc,	%o0,	%i2
	fmovdge	%xcc,	%f4,	%f25
	movgu	%xcc,	%o5,	%g6
	ba	loop_479
	orcc	%i4,	0x1D02,	%i1
	andncc	%l5,	%g1,	%l0
	andcc	%i0,	0x120E,	%g3
loop_479:
	edge16l	%g5,	%l4,	%o3
	array16	%o4,	%o2,	%o6
	lduh	[%l7 + 0x0E],	%o1
	srlx	%g7,	%o7,	%i5
	alignaddrl	%l6,	%l3,	%g2
	set	0x40, %o1
	ldda	[%l7 + %o1] 0x89,	%f16
	sub	%l1,	%i7,	%i3
	movre	%i6,	%l2,	%g4
	umulcc	%i2,	0x1A1D,	%o5
	sdivx	%g6,	0x1EB3,	%o0
	tle	%xcc,	0x1
	smul	%i4,	0x0C64,	%l5
	fbe,a	%fcc0,	loop_480
	sdiv	%g1,	0x0DFA,	%l0
	movcc	%xcc,	%i1,	%i0
	fandnot2	%f22,	%f18,	%f16
loop_480:
	edge8ln	%g3,	%l4,	%g5
	ldub	[%l7 + 0x5E],	%o4
	movg	%icc,	%o3,	%o2
	and	%o6,	%o1,	%g7
	sdiv	%i5,	0x1D1D,	%o7
	bvs,pt	%xcc,	loop_481
	movgu	%icc,	%l3,	%l6
	fsrc1s	%f15,	%f17
	membar	0x30
loop_481:
	movrlez	%g2,	%i7,	%l1
	nop
	set	0x66, %g4
	ldstub	[%l7 + %g4],	%i6
	subccc	%i3,	0x039D,	%g4
	fandnot1	%f6,	%f4,	%f24
	ble	loop_482
	umul	%i2,	0x0392,	%l2
	bvs,a	%icc,	loop_483
	bgu,pn	%icc,	loop_484
loop_482:
	edge16n	%g6,	%o5,	%o0
	tleu	%icc,	0x7
loop_483:
	array16	%l5,	%i4,	%l0
loop_484:
	orncc	%i1,	0x1C50,	%g1
	smul	%g3,	%i0,	%g5
	taddcctv	%o4,	0x11AD,	%l4
	bgu,a,pt	%icc,	loop_485
	ldsw	[%l7 + 0x14],	%o3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsh	[%l7 + 0x50],	%o2
loop_485:
	fmul8x16al	%f11,	%f28,	%f8
	orncc	%o1,	0x022E,	%g7
	wr	%g0,	0x04,	%asi
	stba	%i5,	[%l7 + 0x78] %asi
	xnor	%o6,	%o7,	%l3
	fcmpes	%fcc2,	%f28,	%f26
	movrgez	%l6,	%g2,	%l1
	ldx	[%l7 + 0x50],	%i7
	bge,a,pt	%xcc,	loop_486
	prefetch	[%l7 + 0x30],	 0x2
	bleu,a	loop_487
	fsrc2	%f2,	%f20
loop_486:
	umulcc	%i3,	0x106D,	%i6
	bn,pn	%icc,	loop_488
loop_487:
	and	%i2,	%l2,	%g4
	edge8	%g6,	%o0,	%o5
	sra	%i4,	0x1F,	%l0
loop_488:
	movpos	%xcc,	%l5,	%g1
	fmul8x16al	%f13,	%f8,	%f26
	fcmped	%fcc0,	%f12,	%f20
	subccc	%g3,	0x1C46,	%i0
	subccc	%i1,	%o4,	%g5
	fxors	%f10,	%f14,	%f2
	wr	%g0,	0xf0,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
	fbo	%fcc0,	loop_489
	edge32n	%l4,	%o3,	%o2
	bneg,pt	%icc,	loop_490
	sdivx	%o1,	0x01AE,	%g7
loop_489:
	fpack16	%f28,	%f4
	set	0x68, %o2
	stha	%i5,	[%l7 + %o2] 0x22
	membar	#Sync
loop_490:
	add	%o6,	0x020D,	%l3
	andcc	%o7,	0x0579,	%g2
	andn	%l6,	%l1,	%i7
	bn,pt	%xcc,	loop_491
	subcc	%i3,	%i6,	%i2
	movrne	%l2,	%g6,	%g4
	bvc,a	%icc,	loop_492
loop_491:
	tle	%xcc,	0x1
	fcmpeq32	%f2,	%f24,	%o0
	bvc,a,pt	%xcc,	loop_493
loop_492:
	ta	%xcc,	0x3
	subccc	%o5,	%i4,	%l5
	te	%icc,	0x5
loop_493:
	move	%xcc,	%l0,	%g3
	swap	[%l7 + 0x3C],	%g1
	tgu	%icc,	0x1
	fmul8sux16	%f4,	%f14,	%f2
	fbule	%fcc0,	loop_494
	brnz	%i1,	loop_495
	bvc,a,pt	%icc,	loop_496
	st	%f12,	[%l7 + 0x1C]
loop_494:
	tvs	%xcc,	0x2
loop_495:
	ld	[%l7 + 0x58],	%f17
loop_496:
	movvs	%xcc,	%o4,	%i0
	std	%f28,	[%l7 + 0x08]
	bneg,pn	%icc,	loop_497
	edge16n	%l4,	%o3,	%o2
	fmovrsne	%o1,	%f2,	%f28
	ba,a	%xcc,	loop_498
loop_497:
	brlz,a	%g7,	loop_499
	and	%g5,	0x166A,	%o6
	movleu	%xcc,	%l3,	%i5
loop_498:
	movrlez	%g2,	%o7,	%l6
loop_499:
	fnot1s	%f2,	%f17
	tsubcctv	%l1,	0x0EA4,	%i3
	tg	%icc,	0x3
	ldstub	[%l7 + 0x0C],	%i7
	ldd	[%l7 + 0x48],	%i2
	fmovdvc	%icc,	%f10,	%f18
	bpos,pn	%icc,	loop_500
	movrgz	%i6,	%l2,	%g6
	movrlez	%g4,	%o0,	%i4
	movgu	%xcc,	%l5,	%l0
loop_500:
	array8	%o5,	%g3,	%g1
	fmovsg	%xcc,	%f27,	%f24
	udivcc	%i1,	0x169C,	%o4
	fornot1s	%f1,	%f18,	%f7
	ldsh	[%l7 + 0x64],	%l4
	fmovscs	%icc,	%f19,	%f2
	ba	%xcc,	loop_501
	srax	%i0,	%o2,	%o3
	and	%o1,	0x0E45,	%g7
	ta	%icc,	0x5
loop_501:
	udivx	%o6,	0x021A,	%g5
	movcs	%icc,	%i5,	%g2
	array8	%l3,	%o7,	%l6
	tcc	%xcc,	0x3
	wr	%g0,	0x89,	%asi
	stxa	%i3,	[%l7 + 0x38] %asi
	movneg	%icc,	%i7,	%i2
	brgez,a	%i6,	loop_502
	fmuld8sux16	%f20,	%f16,	%f8
	brlez	%l2,	loop_503
	tsubcctv	%g6,	%g4,	%o0
loop_502:
	tgu	%icc,	0x1
	taddcc	%i4,	0x147D,	%l5
loop_503:
	fmovs	%f11,	%f16
	bne	loop_504
	membar	0x4E
	sdiv	%l1,	0x19F7,	%o5
	edge8l	%l0,	%g3,	%g1
loop_504:
	fmul8x16al	%f28,	%f18,	%f24
	fmovsg	%icc,	%f29,	%f22
	ldsw	[%l7 + 0x3C],	%i1
	movrgz	%l4,	0x0D4,	%i0
	movn	%icc,	%o2,	%o3
	srl	%o1,	0x16,	%o4
	alignaddrl	%g7,	%o6,	%i5
	bcs	%icc,	loop_505
	fbe,a	%fcc0,	loop_506
	ta	%xcc,	0x2
	fmovdge	%icc,	%f30,	%f30
loop_505:
	tneg	%icc,	0x5
loop_506:
	srax	%g2,	%l3,	%g5
	sra	%o7,	%i3,	%i7
	fmovscc	%xcc,	%f28,	%f16
	fnands	%f12,	%f10,	%f15
	movgu	%xcc,	%i2,	%i6
	sll	%l2,	%l6,	%g4
	bne,a,pt	%icc,	loop_507
	fbne,a	%fcc1,	loop_508
	sdiv	%o0,	0x1187,	%g6
	array16	%i4,	%l5,	%o5
loop_507:
	ldd	[%l7 + 0x50],	%l0
loop_508:
	movg	%icc,	%g3,	%l1
	alignaddrl	%g1,	%i1,	%l4
	srl	%i0,	%o3,	%o1
	tvs	%icc,	0x0
	taddcc	%o2,	0x04BE,	%g7
	orcc	%o4,	0x0312,	%i5
	set	0x08, %l2
	prefetcha	[%l7 + %l2] 0x10,	 0x1
	edge8l	%l3,	%g5,	%o6
	udiv	%o7,	0x0959,	%i7
	sethi	0x1948,	%i3
	fnand	%f20,	%f10,	%f2
	fornot1	%f16,	%f0,	%f10
	fmul8x16al	%f22,	%f20,	%f2
	srlx	%i6,	0x11,	%i2
	and	%l6,	%l2,	%o0
	set	0x41, %o6
	ldstuba	[%l7 + %o6] 0x80,	%g4
	st	%f18,	[%l7 + 0x14]
	orncc	%i4,	0x1C44,	%l5
	stw	%o5,	[%l7 + 0x74]
	bg,a	loop_509
	be	loop_510
	movgu	%icc,	%g6,	%l0
	wr	%g0,	0x89,	%asi
	lduha	[%l7 + 0x6E] %asi,	%l1
loop_509:
	nop
	setx	loop_511,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_510:
	array32	%g3,	%i1,	%l4
	tneg	%icc,	0x4
	movpos	%xcc,	%i0,	%o3
loop_511:
	fmovsl	%xcc,	%f26,	%f5
	andcc	%o1,	0x1C14,	%g1
	ba,a,pt	%icc,	loop_512
	array32	%g7,	%o4,	%i5
	fors	%f12,	%f6,	%f13
	fands	%f15,	%f21,	%f6
loop_512:
	movvs	%icc,	%g2,	%o2
	fbu	%fcc1,	loop_513
	tneg	%icc,	0x3
	udivcc	%l3,	0x060C,	%o6
	nop
	set	0x68, %i1
	stw	%o7,	[%l7 + %i1]
loop_513:
	ldsh	[%l7 + 0x74],	%i7
	fbug,a	%fcc2,	loop_514
	bne	loop_515
	fmovse	%xcc,	%f25,	%f22
	fnegs	%f31,	%f25
loop_514:
	ldsb	[%l7 + 0x23],	%g5
loop_515:
	orn	%i3,	0x109A,	%i2
	fmovdgu	%icc,	%f3,	%f8
	xor	%i6,	0x1D1C,	%l6
	edge8n	%l2,	%o0,	%g4
	subc	%l5,	0x0414,	%i4
	xor	%o5,	0x0240,	%g6
	fmovrsne	%l0,	%f29,	%f13
	set	0x40, %g6
	ldda	[%l7 + %g6] 0x80,	%l0
	fcmpeq32	%f12,	%f14,	%i1
	fmovrslez	%g3,	%f25,	%f0
	array8	%i0,	%l4,	%o3
	addc	%o1,	0x186C,	%g7
	nop
	setx loop_516, %l0, %l1
	jmpl %l1, %g1
	brlez	%o4,	loop_517
	sub	%i5,	0x0112,	%o2
	mulx	%l3,	0x0BE5,	%g2
loop_516:
	array8	%o6,	%o7,	%g5
loop_517:
	sth	%i7,	[%l7 + 0x7C]
	edge8ln	%i3,	%i2,	%i6
	wr	%g0,	0x10,	%asi
	prefetcha	[%l7 + 0x60] %asi,	 0x0
	xnor	%l2,	%o0,	%l5
	fnot2	%f26,	%f14
	xor	%g4,	%i4,	%g6
	fcmpne32	%f26,	%f6,	%l0
	fone	%f8
	fornot1s	%f28,	%f20,	%f7
	bvc,a	%xcc,	loop_518
	stb	%o5,	[%l7 + 0x7E]
	set	0x50, %g7
	stda	%i0,	[%l7 + %g7] 0x23
	membar	#Sync
loop_518:
	fbl,a	%fcc3,	loop_519
	movvc	%icc,	%l1,	%g3
	movrne	%i0,	0x064,	%o3
	fbe	%fcc2,	loop_520
loop_519:
	add	%o1,	0x1FC1,	%g7
	tn	%xcc,	0x5
	tcc	%xcc,	0x4
loop_520:
	nop
	set	0x40, %l6
	stda	%f16,	[%l7 + %l6] 0x15
	addccc	%l4,	%o4,	%g1
	andncc	%i5,	%o2,	%g2
	fandnot1s	%f20,	%f6,	%f2
	sll	%l3,	%o6,	%o7
	orcc	%i7,	0x1FEF,	%g5
	fmovse	%icc,	%f16,	%f24
	fnot1	%f12,	%f2
	membar	0x54
	movle	%xcc,	%i2,	%i6
	fsrc1s	%f24,	%f19
	fcmple16	%f26,	%f24,	%i3
	srl	%l6,	%l2,	%o0
	movvs	%xcc,	%l5,	%g4
	bge	loop_521
	fmovscc	%xcc,	%f17,	%f0
	srax	%g6,	%l0,	%o5
	movre	%i4,	%i1,	%l1
loop_521:
	fnot1	%f24,	%f28
	addcc	%g3,	%o3,	%o1
	subccc	%g7,	%l4,	%i0
	tle	%icc,	0x2
	membar	0x2F
	udivcc	%g1,	0x1D1A,	%i5
	wr	%g0,	0x81,	%asi
	ldsba	[%l7 + 0x5C] %asi,	%o4
	wr	%g0,	0x11,	%asi
	swapa	[%l7 + 0x10] %asi,	%g2
	fxnor	%f12,	%f8,	%f12
	nop
	set	0x40, %l0
	stw	%l3,	[%l7 + %l0]
	movge	%xcc,	%o2,	%o6
	orn	%o7,	%g5,	%i7
	movpos	%icc,	%i2,	%i3
	fmovsleu	%xcc,	%f11,	%f20
	sth	%l6,	[%l7 + 0x3E]
	alignaddr	%i6,	%l2,	%o0
	stx	%g4,	[%l7 + 0x18]
	addc	%g6,	%l5,	%o5
	bshuffle	%f0,	%f18,	%f4
	movrlz	%i4,	0x25F,	%i1
	wr	%g0,	0x88,	%asi
	lduha	[%l7 + 0x5E] %asi,	%l1
	fmovsg	%xcc,	%f16,	%f6
	array32	%l0,	%g3,	%o1
	udiv	%g7,	0x152F,	%o3
	ta	%xcc,	0x6
	tsubcctv	%i0,	0x04AE,	%l4
	xnorcc	%g1,	%i5,	%g2
	movre	%l3,	%o4,	%o6
	tg	%xcc,	0x2
	tsubcc	%o7,	0x10B5,	%o2
	add	%l7,	0x50,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%i7,	%i2
	fbuge,a	%fcc2,	loop_522
	addccc	%g5,	0x06FE,	%i3
	fabss	%f18,	%f24
	bpos,a,pt	%icc,	loop_523
loop_522:
	fmovdneg	%icc,	%f15,	%f6
	mulx	%i6,	0x0A0A,	%l2
	sll	%o0,	%l6,	%g4
loop_523:
	brgz,a	%l5,	loop_524
	edge16n	%o5,	%g6,	%i1
	fmovda	%xcc,	%f10,	%f5
	edge16l	%i4,	%l1,	%g3
loop_524:
	subccc	%o1,	0x044B,	%l0
	ldd	[%l7 + 0x08],	%o2
	sll	%g7,	%i0,	%g1
	sdivcc	%l4,	0x171B,	%i5
	xnorcc	%g2,	0x04E4,	%l3
	wr	%g0,	0x11,	%asi
	stxa	%o6,	[%l7 + 0x38] %asi
	move	%xcc,	%o7,	%o4
	edge8	%i7,	%i2,	%g5
	fpadd32	%f26,	%f10,	%f14
	fones	%f25
	tl	%xcc,	0x4
	fxnor	%f18,	%f2,	%f18
	movvc	%xcc,	%i3,	%i6
	srax	%o2,	0x1B,	%o0
	set	0x40, %g1
	stha	%l2,	[%l7 + %g1] 0x80
	wr	%g0,	0xeb,	%asi
	stba	%g4,	[%l7 + 0x33] %asi
	membar	#Sync
	array32	%l6,	%o5,	%g6
	fmovdn	%icc,	%f11,	%f30
	sethi	0x1CCB,	%i1
	edge32ln	%l5,	%l1,	%i4
	mulscc	%g3,	0x0C09,	%l0
	taddcc	%o3,	0x0E7A,	%o1
	bleu,pt	%xcc,	loop_525
	fmuld8ulx16	%f8,	%f14,	%f20
	tcc	%xcc,	0x2
	stbar
loop_525:
	tneg	%icc,	0x1
	bvs,a,pt	%xcc,	loop_526
	edge8l	%g7,	%g1,	%l4
	fmovdl	%xcc,	%f21,	%f0
	srl	%i5,	0x18,	%i0
loop_526:
	bvc	%icc,	loop_527
	srl	%l3,	0x09,	%o6
	movre	%g2,	0x117,	%o4
	orn	%i7,	0x0932,	%o7
loop_527:
	fandnot2	%f8,	%f24,	%f4
	ldsw	[%l7 + 0x48],	%g5
	fxnor	%f14,	%f14,	%f4
	set	0x3E, %l3
	ldsba	[%l7 + %l3] 0x10,	%i3
	fors	%f25,	%f16,	%f23
	movre	%i2,	%i6,	%o0
	and	%o2,	0x1C95,	%l2
	set	0x58, %i2
	stda	%i6,	[%l7 + %i2] 0x04
	mova	%icc,	%o5,	%g6
	fpsub16	%f4,	%f2,	%f6
	bpos,a	loop_528
	orncc	%i1,	0x0DFF,	%g4
	subc	%l1,	0x0649,	%l5
	fbu	%fcc2,	loop_529
loop_528:
	tg	%xcc,	0x5
	movg	%icc,	%i4,	%l0
	fmovd	%f12,	%f24
loop_529:
	sdiv	%o3,	0x1741,	%o1
	bcs,pn	%icc,	loop_530
	tle	%icc,	0x3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16	%g7,	%g3,	%g1
loop_530:
	udivcc	%i5,	0x0947,	%l4
	edge32n	%i0,	%o6,	%l3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmple32	%f8,	%f14,	%g2
	srlx	%i7,	0x0D,	%o7
	tgu	%icc,	0x0
	fpadd16s	%f2,	%f31,	%f31
	fbge	%fcc3,	loop_531
	fpack16	%f20,	%f16
	fmovrsgez	%g5,	%f21,	%f14
	flush	%l7 + 0x24
loop_531:
	alignaddrl	%i3,	%o4,	%i2
	movleu	%icc,	%i6,	%o0
	sethi	0x0851,	%l2
	wr	%g0,	0xea,	%asi
	stwa	%l6,	[%l7 + 0x24] %asi
	membar	#Sync
	movgu	%xcc,	%o2,	%g6
	fmovsne	%icc,	%f22,	%f1
	membar	0x04
	fbge	%fcc1,	loop_532
	fmovsvs	%xcc,	%f23,	%f12
	nop
	set	0x14, %i5
	ldstub	[%l7 + %i5],	%i1
	fxors	%f28,	%f6,	%f11
loop_532:
	movne	%xcc,	%o5,	%g4
	wr	%g0,	0x89,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	edge32ln	%l1,	%l5,	%i4
	ba,a,pn	%xcc,	loop_533
	nop
	setx	loop_534,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fcmpeq16	%f8,	%f4,	%o3
	fpack32	%f24,	%f0,	%f12
loop_533:
	array16	%l0,	%o1,	%g3
loop_534:
	fors	%f8,	%f10,	%f22
	popc	0x19D8,	%g1
	sdivcc	%g7,	0x0724,	%l4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fand	%f20,	%f24,	%f22
	add	%l7,	0x08,	%l6
	wr	%g0,	0x19,	%asi
	ldxa	[%l6] %asi,	%i5
	casxa	[%l6] %asi,	%i5,	%i0
	tsubcctv	%l3,	0x0C01,	%o6
	fbl,a	%fcc0,	loop_535
	mulscc	%g2,	%i7,	%g5
	fmovdvs	%icc,	%f6,	%f13
	fbule	%fcc2,	loop_536
loop_535:
	tsubcctv	%o7,	0x1CC1,	%i3
	taddcc	%i2,	0x1029,	%i6
	sth	%o0,	[%l7 + 0x36]
loop_536:
	tvc	%icc,	0x7
	tpos	%icc,	0x4
	brz	%o4,	loop_537
	edge8n	%l6,	%l2,	%o2
	movvs	%xcc,	%i1,	%g6
	tn	%icc,	0x1
loop_537:
	ldsh	[%l7 + 0x4A],	%g4
	edge8ln	%l1,	%l5,	%o5
	movn	%xcc,	%o3,	%i4
	movvc	%xcc,	%o1,	%g3
	edge16n	%l0,	%g7,	%l4
	bcs,pt	%xcc,	loop_538
	tn	%icc,	0x3
	fbne	%fcc3,	loop_539
	movneg	%icc,	%g1,	%i0
loop_538:
	srlx	%l3,	%o6,	%g2
	edge32	%i5,	%g5,	%i7
loop_539:
	nop
	set	0x64, %i6
	swapa	[%l7 + %i6] 0x89,	%o7
	tne	%xcc,	0x3
	subcc	%i2,	%i3,	%o0
	sdivx	%i6,	0x140A,	%o4
	xorcc	%l6,	%l2,	%o2
	movl	%icc,	%g6,	%i1
	subc	%l1,	0x1C5D,	%l5
	set	0x30, %l1
	stda	%o4,	[%l7 + %l1] 0x2a
	membar	#Sync
	movneg	%icc,	%g4,	%o3
	fmovsne	%xcc,	%f25,	%f25
	set	0x40, %o7
	stda	%f0,	[%l7 + %o7] 0x0c
	xorcc	%i4,	%g3,	%l0
	sra	%o1,	%g7,	%g1
	sethi	0x1E68,	%l4
	andn	%l3,	0x000C,	%i0
	add	%o6,	0x0BD1,	%i5
	membar	0x4D
	edge32n	%g5,	%g2,	%i7
	fcmple16	%f0,	%f6,	%i2
	flush	%l7 + 0x50
	fbge,a	%fcc1,	loop_540
	tle	%xcc,	0x5
	set	0x1C, %i0
	lduwa	[%l7 + %i0] 0x14,	%i3
loop_540:
	edge32l	%o0,	%o7,	%o4
	fexpand	%f23,	%f2
	brz,a	%l6,	loop_541
	tneg	%icc,	0x3
	fmovde	%icc,	%f7,	%f6
	fmovrse	%l2,	%f13,	%f5
loop_541:
	smulcc	%i6,	%o2,	%g6
	fbe,a	%fcc1,	loop_542
	tge	%icc,	0x0
	edge16	%i1,	%l1,	%o5
	edge16l	%l5,	%g4,	%i4
loop_542:
	fpsub32	%f22,	%f12,	%f18
	movleu	%xcc,	%o3,	%l0
	movl	%xcc,	%g3,	%o1
	tg	%xcc,	0x6
	tsubcc	%g7,	0x0B8D,	%g1
	fmovscc	%xcc,	%f26,	%f9
	fxor	%f22,	%f8,	%f14
	ldsh	[%l7 + 0x7E],	%l3
	tsubcc	%i0,	0x0337,	%o6
	stbar
	st	%f21,	[%l7 + 0x44]
	movg	%xcc,	%l4,	%g5
	edge32n	%i5,	%g2,	%i7
	movrgz	%i2,	%o0,	%i3
	array16	%o7,	%o4,	%l6
	ba,a	loop_543
	fbe	%fcc3,	loop_544
	addccc	%i6,	%o2,	%g6
	andncc	%i1,	%l1,	%o5
loop_543:
	smulcc	%l5,	0x1943,	%l2
loop_544:
	nop
	setx	loop_545,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fmovrslez	%g4,	%f16,	%f8
	bn	%icc,	loop_546
	call	loop_547
loop_545:
	sub	%o3,	%i4,	%g3
	bge,a,pn	%xcc,	loop_548
loop_546:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_547:
	brgez,a	%o1,	loop_549
	tcs	%xcc,	0x0
loop_548:
	ta	%icc,	0x2
	addc	%g7,	%g1,	%l3
loop_549:
	fexpand	%f1,	%f24
	fzeros	%f22
	sdiv	%i0,	0x0275,	%o6
	bleu	%icc,	loop_550
	fcmpd	%fcc2,	%f2,	%f8
	set	0x28, %o5
	lda	[%l7 + %o5] 0x80,	%f7
loop_550:
	fandnot2s	%f7,	%f1,	%f27
	tvs	%xcc,	0x3
	ldstub	[%l7 + 0x20],	%l0
	fzeros	%f15
	umul	%l4,	%i5,	%g5
	sir	0x045A
	mulscc	%g2,	0x0D4E,	%i2
	set	0x46, %o3
	ldsba	[%l7 + %o3] 0x88,	%i7
	movl	%icc,	%i3,	%o7
	taddcc	%o0,	0x0227,	%o4
	fmul8ulx16	%f18,	%f28,	%f22
	bneg	%icc,	loop_551
	movrne	%i6,	%o2,	%l6
	fmovsneg	%xcc,	%f13,	%f30
	subcc	%g6,	%i1,	%o5
loop_551:
	call	loop_552
	bvs,a,pt	%icc,	loop_553
	srl	%l5,	0x05,	%l2
	movneg	%xcc,	%g4,	%l1
loop_552:
	sdivcc	%o3,	0x188B,	%g3
loop_553:
	sdivcc	%o1,	0x0707,	%g7
	fmul8ulx16	%f14,	%f0,	%f20
	andcc	%g1,	%i4,	%l3
	edge16ln	%o6,	%l0,	%l4
	fpadd32s	%f6,	%f6,	%f13
	flush	%l7 + 0x14
	ble,pt	%xcc,	loop_554
	tne	%icc,	0x1
	std	%i4,	[%l7 + 0x18]
	tge	%icc,	0x7
loop_554:
	movvs	%xcc,	%g5,	%i0
	umul	%i2,	0x0D99,	%i7
	wr	%g0,	0x88,	%asi
	lduwa	[%l7 + 0x78] %asi,	%g2
	set	0x2A, %o0
	lduha	[%l7 + %o0] 0x04,	%i3
	ldd	[%l7 + 0x28],	%f22
	fnegd	%f18,	%f24
	movre	%o0,	%o4,	%o7
	alignaddrl	%i6,	%l6,	%g6
	flush	%l7 + 0x18
	mulscc	%o2,	0x15F2,	%o5
	tleu	%xcc,	0x4
	brlez	%i1,	loop_555
	ld	[%l7 + 0x44],	%f1
	set	0x40, %g3
	stda	%f0,	[%l7 + %g3] 0x10
loop_555:
	membar	0x76
	edge16l	%l5,	%l2,	%g4
	set	0x7C, %o4
	ldstuba	[%l7 + %o4] 0x11,	%o3
	tsubcctv	%g3,	0x0998,	%o1
	stx	%l1,	[%l7 + 0x18]
	orcc	%g1,	%i4,	%g7
	wr	%g0,	0x18,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	mova	%xcc,	%o6,	%l0
	edge32	%l4,	%i5,	%g5
	movl	%xcc,	%l3,	%i0
	add	%i2,	0x03DD,	%i7
	orn	%g2,	%i3,	%o0
	fand	%f2,	%f0,	%f4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x74, %l5
	swapa	[%l7 + %l5] 0x89,	%o4
	edge16	%i6,	%o7,	%l6
	fpsub32s	%f2,	%f15,	%f13
	edge16l	%g6,	%o2,	%o5
	edge16n	%l5,	%l2,	%i1
	edge8n	%g4,	%o3,	%g3
	fbl	%fcc2,	loop_556
	brgez,a	%o1,	loop_557
	fblg,a	%fcc3,	loop_558
	fabss	%f29,	%f26
loop_556:
	edge8	%g1,	%l1,	%i4
loop_557:
	fbu	%fcc1,	loop_559
loop_558:
	udivcc	%o6,	0x0BC2,	%l0
	tg	%xcc,	0x6
	fmovrdgz	%g7,	%f14,	%f24
loop_559:
	andn	%l4,	%i5,	%g5
	edge16l	%i0,	%i2,	%i7
	movne	%icc,	%l3,	%i3
	stb	%g2,	[%l7 + 0x26]
	membar	0x49
	xor	%o0,	%i6,	%o4
	call	loop_560
	sllx	%o7,	0x1B,	%g6
	orncc	%o2,	%o5,	%l6
	tcc	%xcc,	0x6
loop_560:
	fbu,a	%fcc1,	loop_561
	tn	%icc,	0x4
	set	0x68, %g5
	stxa	%l2,	[%l7 + %g5] 0x04
loop_561:
	tsubcc	%i1,	%g4,	%l5
	wr	%g0,	0x11,	%asi
	stxa	%o3,	[%l7 + 0x60] %asi
	brgz	%o1,	loop_562
	fpadd16s	%f27,	%f18,	%f6
	brnz,a	%g1,	loop_563
	edge8	%l1,	%g3,	%i4
loop_562:
	addc	%l0,	0x06C9,	%g7
	edge32	%o6,	%l4,	%g5
loop_563:
	move	%icc,	%i0,	%i5
	edge8	%i7,	%i2,	%i3
	or	%l3,	0x1D92,	%g2
	fxors	%f22,	%f19,	%f18
	lduh	[%l7 + 0x3C],	%i6
	brlz	%o0,	loop_564
	addccc	%o7,	0x10F5,	%o4
	edge32n	%o2,	%o5,	%g6
	sra	%l2,	%l6,	%i1
loop_564:
	fabsd	%f2,	%f10
	tcc	%icc,	0x3
	fmuld8sux16	%f11,	%f21,	%f24
	fandnot1	%f14,	%f30,	%f24
	orcc	%l5,	%g4,	%o3
	movne	%xcc,	%g1,	%l1
	sub	%o1,	%g3,	%l0
	smulcc	%i4,	0x1F6A,	%o6
	fbo	%fcc1,	loop_565
	tleu	%xcc,	0x4
	movpos	%icc,	%l4,	%g5
	array16	%g7,	%i5,	%i0
loop_565:
	orncc	%i7,	%i2,	%l3
	sdivcc	%i3,	0x1A5E,	%g2
	bvs,a	%xcc,	loop_566
	prefetch	[%l7 + 0x44],	 0x2
	fpack16	%f14,	%f9
	tg	%xcc,	0x1
loop_566:
	fpadd32	%f28,	%f22,	%f30
	move	%icc,	%i6,	%o7
	tle	%icc,	0x4
	mova	%xcc,	%o0,	%o4
	nop
	set	0x30, %l4
	stw	%o2,	[%l7 + %l4]
	taddcc	%o5,	%g6,	%l2
	udivx	%i1,	0x06A6,	%l5
	wr	%g0,	0x11,	%asi
	swapa	[%l7 + 0x60] %asi,	%g4
	wr	%g0,	0x27,	%asi
	stba	%l6,	[%l7 + 0x6F] %asi
	membar	#Sync
	umul	%g1,	0x06AC,	%l1
	bneg,a,pt	%icc,	loop_567
	brlz	%o3,	loop_568
	fmuld8sux16	%f11,	%f0,	%f16
	movg	%icc,	%o1,	%l0
loop_567:
	membar	0x1B
loop_568:
	movvs	%icc,	%i4,	%g3
	sth	%o6,	[%l7 + 0x3C]
	edge32n	%g5,	%l4,	%i5
	tneg	%icc,	0x4
	alignaddr	%g7,	%i7,	%i2
	movvc	%xcc,	%l3,	%i3
	fnot2	%f22,	%f4
	fmovde	%icc,	%f15,	%f9
	lduh	[%l7 + 0x74],	%g2
	fbne	%fcc1,	loop_569
	fcmple32	%f10,	%f20,	%i0
	movneg	%xcc,	%o7,	%o0
	sra	%o4,	0x04,	%i6
loop_569:
	fbn,a	%fcc3,	loop_570
	sethi	0x02C1,	%o5
	fmovrslez	%g6,	%f12,	%f0
	fbn,a	%fcc1,	loop_571
loop_570:
	edge8l	%l2,	%o2,	%i1
	orncc	%g4,	%l6,	%g1
	wr	%g0,	0x04,	%asi
	lduha	[%l7 + 0x5A] %asi,	%l5
loop_571:
	tleu	%xcc,	0x1
	fand	%f22,	%f16,	%f20
	bvc,a	loop_572
	array32	%l1,	%o1,	%o3
	fmul8x16au	%f15,	%f11,	%f2
	fblg,a	%fcc2,	loop_573
loop_572:
	edge32n	%i4,	%l0,	%g3
	fpsub16	%f16,	%f18,	%f14
	fornot1	%f4,	%f2,	%f22
loop_573:
	orn	%o6,	%g5,	%l4
	fxors	%f26,	%f3,	%f28
	srax	%g7,	0x04,	%i7
	set	0x50, %g2
	ldswa	[%l7 + %g2] 0x04,	%i5
	brgez,a	%i2,	loop_574
	fsrc1s	%f30,	%f13
	fmovspos	%icc,	%f8,	%f20
	fmovrdlez	%l3,	%f18,	%f30
loop_574:
	nop
	wr	%g0,	0x11,	%asi
	ldsha	[%l7 + 0x40] %asi,	%i3
	flush	%l7 + 0x7C
	udiv	%g2,	0x14A4,	%o7
	sll	%o0,	%i0,	%i6
	xorcc	%o4,	%g6,	%l2
	fmovsl	%xcc,	%f2,	%f6
	addcc	%o2,	%i1,	%o5
	xor	%l6,	%g4,	%l5
	fbge,a	%fcc1,	loop_575
	fmovdvs	%icc,	%f27,	%f15
	smul	%g1,	%l1,	%o3
	tleu	%icc,	0x3
loop_575:
	move	%icc,	%o1,	%i4
	sdivcc	%l0,	0x057E,	%o6
	set	0x80, %i3
	ldxa	[%g0 + %i3] 0x58,	%g5
	movl	%xcc,	%g3,	%l4
	tneg	%xcc,	0x5
	sdivcc	%i7,	0x1871,	%g7
	udivx	%i5,	0x0179,	%l3
	udiv	%i3,	0x1689,	%i2
	fcmpgt32	%f6,	%f4,	%g2
	fbuge	%fcc0,	loop_576
	edge8n	%o7,	%o0,	%i0
	fmovrsgez	%o4,	%f28,	%f19
	sub	%g6,	%i6,	%l2
loop_576:
	mulx	%i1,	0x101C,	%o2
	edge16ln	%o5,	%l6,	%g4
	edge16n	%g1,	%l1,	%l5
	movneg	%xcc,	%o1,	%i4
	sdivcc	%o3,	0x1D0C,	%l0
	addcc	%g5,	0x1858,	%o6
	brgez	%g3,	loop_577
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8l	%l4,	%g7,	%i5
	sth	%i7,	[%l7 + 0x22]
loop_577:
	xnor	%l3,	%i3,	%i2
	array32	%g2,	%o0,	%i0
	fbug	%fcc0,	loop_578
	srlx	%o4,	0x01,	%o7
	umul	%i6,	%g6,	%l2
	edge8n	%o2,	%i1,	%l6
loop_578:
	udivx	%o5,	0x0F05,	%g4
	mulx	%g1,	%l5,	%o1
	fmovsne	%icc,	%f1,	%f8
	fmuld8ulx16	%f1,	%f9,	%f14
	set	0x38, %i4
	ldswa	[%l7 + %i4] 0x11,	%i4
	udivx	%l1,	0x0921,	%o3
	srax	%l0,	%g5,	%g3
	set	0x6C, %i7
	swapa	[%l7 + %i7] 0x89,	%o6
	wr	%g0,	0x10,	%asi
	lduwa	[%l7 + 0x7C] %asi,	%g7
	lduh	[%l7 + 0x5E],	%l4
	popc	0x0759,	%i5
	fmovrsne	%l3,	%f17,	%f24
	fbe,a	%fcc2,	loop_579
	fnor	%f22,	%f6,	%f22
	set	0x76, %g4
	ldstuba	[%l7 + %g4] 0x89,	%i3
loop_579:
	nop
	set	0x20, %o1
	lduwa	[%l7 + %o1] 0x88,	%i2
	udiv	%i7,	0x14E7,	%g2
	edge32n	%i0,	%o0,	%o7
	movge	%icc,	%i6,	%o4
	fmovrse	%g6,	%f15,	%f26
	fmovrdne	%l2,	%f18,	%f8
	sub	%o2,	0x1308,	%i1
	add	%o5,	0x1188,	%g4
	edge8n	%g1,	%l6,	%l5
	edge8ln	%i4,	%o1,	%l1
	nop
	setx loop_580, %l0, %l1
	jmpl %l1, %o3
	fmovsl	%icc,	%f14,	%f18
	fbg,a	%fcc3,	loop_581
	edge8	%g5,	%g3,	%o6
loop_580:
	subc	%l0,	%g7,	%l4
	brgz,a	%i5,	loop_582
loop_581:
	edge16l	%l3,	%i2,	%i3
	fmovspos	%icc,	%f18,	%f30
	edge8n	%i7,	%i0,	%g2
loop_582:
	alignaddr	%o0,	%o7,	%o4
	set	0x70, %l2
	sta	%f5,	[%l7 + %l2] 0x0c
	fnot2s	%f8,	%f10
	ldsw	[%l7 + 0x78],	%g6
	array32	%i6,	%l2,	%i1
	ldd	[%l7 + 0x10],	%o4
	bn,a	%xcc,	loop_583
	tle	%xcc,	0x5
	set	0x20, %o6
	sta	%f12,	[%l7 + %o6] 0x81
loop_583:
	fmovs	%f30,	%f1
	fmovrsne	%g4,	%f14,	%f31
	fmovrdgez	%g1,	%f30,	%f22
	movcc	%xcc,	%l6,	%o2
	fbn	%fcc0,	loop_584
	std	%f16,	[%l7 + 0x60]
	for	%f30,	%f16,	%f20
	edge8l	%l5,	%i4,	%l1
loop_584:
	nop
	set	0x52, %i1
	stba	%o3,	[%l7 + %i1] 0x2b
	membar	#Sync
	fba	%fcc0,	loop_585
	fmovdcc	%xcc,	%f12,	%f11
	xorcc	%o1,	%g3,	%o6
	array32	%l0,	%g7,	%l4
loop_585:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdg	%icc,	%f0,	%f10
	fcmpeq32	%f26,	%f20,	%i5
	set	0x28, %g6
	sta	%f21,	[%l7 + %g6] 0x88
	edge16ln	%g5,	%i2,	%l3
	srlx	%i3,	0x03,	%i0
	fpsub32s	%f22,	%f2,	%f12
	umul	%i7,	%g2,	%o0
	fmovda	%xcc,	%f14,	%f28
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	std	%f2,	[%l7 + 0x70]
	sdiv	%o4,	0x1E8A,	%g6
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
	array32	%o7,	%i6,	%l2
	addccc	%o5,	%g4,	%g1
	fmuld8ulx16	%f19,	%f31,	%f18
loop_586:
	te	%xcc,	0x2
	edge16ln	%l6,	%i1,	%o2
	bvs,pn	%xcc,	loop_587
	fmovdpos	%icc,	%f16,	%f7
	smul	%l5,	%i4,	%l1
	xorcc	%o3,	%g3,	%o1
loop_587:
	alignaddr	%o6,	%l0,	%g7
	fornot1s	%f27,	%f31,	%f6
	ldstub	[%l7 + 0x0B],	%i5
	membar	0x03
	fpmerge	%f20,	%f28,	%f2
	movge	%xcc,	%g5,	%l4
	movle	%xcc,	%l3,	%i2
	bg	loop_588
	popc	%i3,	%i7
	or	%g2,	0x0D71,	%i0
	fmovsge	%icc,	%f8,	%f8
loop_588:
	move	%icc,	%o4,	%g6
	bne	loop_589
	xorcc	%o0,	0x1F5B,	%o7
	orncc	%i6,	%l2,	%g4
	movcs	%icc,	%g1,	%l6
loop_589:
	movvs	%xcc,	%o5,	%o2
	fnegs	%f28,	%f13
	tvs	%xcc,	0x1
	udiv	%l5,	0x0D9E,	%i1
	subc	%l1,	%o3,	%i4
	taddcc	%g3,	%o1,	%o6
	array16	%l0,	%g7,	%g5
	nop
	set	0x2F, %o2
	ldstub	[%l7 + %o2],	%i5
	umul	%l3,	0x0F70,	%l4
	set	0x08, %l6
	stda	%i2,	[%l7 + %l6] 0x2b
	membar	#Sync
	fcmple32	%f18,	%f30,	%i3
	fcmple16	%f10,	%f18,	%g2
	movpos	%xcc,	%i7,	%i0
	udivcc	%o4,	0x03A3,	%o0
	ldd	[%l7 + 0x60],	%f20
	movcc	%xcc,	%g6,	%i6
	array8	%o7,	%g4,	%g1
	tge	%xcc,	0x0
	tneg	%xcc,	0x7
	sethi	0x02E2,	%l2
	tleu	%icc,	0x1
	sub	%o5,	%l6,	%l5
	movleu	%icc,	%o2,	%l1
	subcc	%i1,	0x08CE,	%i4
	bge,a,pt	%xcc,	loop_590
	fmovs	%f27,	%f18
	addc	%o3,	0x15FE,	%g3
	tsubcc	%o1,	%o6,	%g7
loop_590:
	edge16n	%g5,	%l0,	%i5
	ld	[%l7 + 0x68],	%f18
	and	%l4,	%i2,	%l3
	movvs	%icc,	%g2,	%i3
	fornot1	%f24,	%f30,	%f20
	brgez	%i0,	loop_591
	xor	%o4,	%o0,	%i7
	tsubcc	%i6,	%g6,	%o7
	and	%g1,	0x1D85,	%g4
loop_591:
	subc	%o5,	0x0B4D,	%l6
	umulcc	%l2,	%o2,	%l1
	andncc	%l5,	%i4,	%o3
	movcs	%icc,	%g3,	%i1
	ba,a	%xcc,	loop_592
	smulcc	%o6,	0x0CDC,	%o1
	fble,a	%fcc1,	loop_593
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_592:
	movpos	%xcc,	%g5,	%l0
	fmovdneg	%icc,	%f19,	%f9
loop_593:
	nop
	wr	%g0,	0x89,	%asi
	lda	[%l7 + 0x28] %asi,	%f21
	fsrc1	%f24,	%f10
	prefetch	[%l7 + 0x6C],	 0x0
	tn	%xcc,	0x3
	subc	%g7,	%l4,	%i5
	set	0x70, %g7
	lduwa	[%l7 + %g7] 0x80,	%l3
	fcmpne32	%f22,	%f14,	%i2
	ldx	[%l7 + 0x50],	%i3
	movrgez	%i0,	%o4,	%o0
	udivx	%g2,	0x09FE,	%i7
	set	0x58, %l0
	ldsha	[%l7 + %l0] 0x11,	%g6
	fnegd	%f14,	%f30
	sll	%o7,	%i6,	%g1
	movrne	%o5,	%l6,	%l2
	fones	%f7
	stb	%o2,	[%l7 + 0x57]
	tsubcc	%g4,	0x0C62,	%l1
	nop
	setx loop_594, %l0, %l1
	jmpl %l1, %l5
	fmovrdlz	%o3,	%f28,	%f14
	brgz	%g3,	loop_595
	brgez	%i1,	loop_596
loop_594:
	ba,a,pt	%xcc,	loop_597
	tcs	%icc,	0x1
loop_595:
	fones	%f20
loop_596:
	fmovscs	%icc,	%f13,	%f13
loop_597:
	fmovdvc	%icc,	%f3,	%f7
	brgez,a	%i4,	loop_598
	fmovrslez	%o1,	%f29,	%f4
	subc	%o6,	%g5,	%g7
	wr	%g0,	0x89,	%asi
	swapa	[%l7 + 0x64] %asi,	%l0
loop_598:
	edge32l	%l4,	%i5,	%l3
	for	%f10,	%f2,	%f28
	fmovdvs	%icc,	%f21,	%f9
	fmovrdlez	%i3,	%f10,	%f10
	smul	%i2,	0x1236,	%i0
	fcmpeq32	%f10,	%f30,	%o0
	fblg,a	%fcc3,	loop_599
	bge,a	%icc,	loop_600
	bcs,a,pn	%xcc,	loop_601
	mulscc	%g2,	0x1FD4,	%o4
loop_599:
	taddcc	%i7,	0x1D4C,	%g6
loop_600:
	fmovdpos	%xcc,	%f12,	%f25
loop_601:
	brz	%i6,	loop_602
	move	%xcc,	%o7,	%g1
	movrlz	%o5,	%l6,	%l2
	movvc	%icc,	%o2,	%l1
loop_602:
	nop
	wr	%g0,	0x11,	%asi
	prefetcha	[%l7 + 0x50] %asi,	 0x1
	fnors	%f5,	%f13,	%f12
	fmuld8sux16	%f0,	%f12,	%f28
	andn	%g4,	%o3,	%g3
	alignaddrl	%i4,	%i1,	%o1
	fblg,a	%fcc1,	loop_603
	be,a,pt	%icc,	loop_604
	tleu	%xcc,	0x3
	fandnot1s	%f19,	%f31,	%f26
loop_603:
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
loop_604:
	sdivcc	%g5,	0x0442,	%g7
	udivx	%l0,	0x03B1,	%l4
	wr	%g0,	0x50,	%asi
	ldxa	[%g0 + 0x30] %asi,	%o6
loop_605:
	fandnot1s	%f29,	%f24,	%f24
	srax	%i5,	0x0B,	%i3
	ldd	[%l7 + 0x40],	%i2
	set	0x20, %g1
	ldda	[%l7 + %g1] 0x2f,	%i0
	set	0x70, %l3
	ldda	[%l7 + %l3] 0x22,	%l2
	sir	0x1FFB
	edge8ln	%g2,	%o4,	%i7
	tvs	%icc,	0x7
	tleu	%icc,	0x6
	sub	%o0,	%i6,	%g6
	tg	%icc,	0x1
	movrgez	%o7,	%o5,	%l6
	bvc,a,pn	%icc,	loop_606
	movvs	%xcc,	%l2,	%o2
	wr	%g0,	0x19,	%asi
	sta	%f3,	[%l7 + 0x64] %asi
loop_606:
	nop
	set	0x28, %i5
	ldsb	[%l7 + %i5],	%l1
	te	%xcc,	0x4
	udivx	%l5,	0x0AFF,	%g4
	subccc	%o3,	0x0489,	%g1
	addc	%g3,	%i4,	%o1
	subccc	%g5,	0x04CD,	%i1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movvs	%icc,	%g7,	%l0
	brnz,a	%l4,	loop_607
	mulx	%i5,	%o6,	%i3
	popc	%i0,	%i2
	sllx	%l3,	%g2,	%o4
loop_607:
	tcc	%icc,	0x5
	fmovrslz	%i7,	%f31,	%f12
	edge16	%i6,	%o0,	%g6
	siam	0x6
	fmovd	%f26,	%f22
	set	0x0C, %i6
	sta	%f24,	[%l7 + %i6] 0x11
	sth	%o5,	[%l7 + 0x12]
	set	0x30, %l1
	lda	[%l7 + %l1] 0x04,	%f15
	sllx	%o7,	0x1B,	%l6
	stx	%l2,	[%l7 + 0x38]
	udiv	%o2,	0x1300,	%l1
	movrgz	%l5,	%g4,	%o3
	movg	%xcc,	%g1,	%i4
	edge16ln	%g3,	%o1,	%g5
	fmovdcc	%xcc,	%f6,	%f12
	flush	%l7 + 0x6C
	sth	%g7,	[%l7 + 0x2A]
	movg	%xcc,	%l0,	%l4
	array32	%i1,	%i5,	%i3
	smulcc	%i0,	%o6,	%l3
	fcmped	%fcc3,	%f10,	%f28
	bleu,a,pt	%icc,	loop_608
	fors	%f31,	%f18,	%f30
	orncc	%i2,	%g2,	%o4
	fpsub16	%f4,	%f4,	%f20
loop_608:
	bn,pn	%xcc,	loop_609
	edge16ln	%i7,	%i6,	%g6
	fandnot1	%f14,	%f12,	%f22
	fble	%fcc0,	loop_610
loop_609:
	fmovdvs	%icc,	%f19,	%f26
	orn	%o5,	%o7,	%o0
	bg	%icc,	loop_611
loop_610:
	fbn,a	%fcc1,	loop_612
	tcc	%icc,	0x7
	fbule,a	%fcc1,	loop_613
loop_611:
	tge	%xcc,	0x5
loop_612:
	add	%l2,	0x1CEE,	%o2
	subc	%l6,	0x057C,	%l5
loop_613:
	udiv	%l1,	0x0F63,	%o3
	tge	%icc,	0x7
	brlz	%g1,	loop_614
	fmovsle	%xcc,	%f25,	%f27
	or	%g4,	0x021A,	%g3
	sllx	%o1,	%g5,	%g7
loop_614:
	ld	[%l7 + 0x20],	%f23
	ldstub	[%l7 + 0x35],	%i4
	wr	%g0,	0x81,	%asi
	lda	[%l7 + 0x5C] %asi,	%f21
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x68, %i2
	stwa	%l0,	[%l7 + %i2] 0x18
	movle	%xcc,	%l4,	%i1
	set	0x4C, %o7
	lda	[%l7 + %o7] 0x15,	%f22
	for	%f16,	%f6,	%f16
	fbug,a	%fcc3,	loop_615
	edge16ln	%i3,	%i5,	%i0
	movgu	%icc,	%o6,	%l3
	fcmpes	%fcc1,	%f14,	%f25
loop_615:
	tl	%xcc,	0x4
	wr	%g0,	0x0c,	%asi
	lda	[%l7 + 0x44] %asi,	%f5
	movrlz	%g2,	%o4,	%i2
	bne,a,pt	%xcc,	loop_616
	addc	%i7,	%i6,	%o5
	tg	%xcc,	0x0
	andcc	%o7,	%g6,	%o0
loop_616:
	bn	%xcc,	loop_617
	movgu	%icc,	%o2,	%l2
	and	%l6,	%l1,	%l5
	edge8	%g1,	%g4,	%o3
loop_617:
	nop
	setx loop_618, %l0, %l1
	jmpl %l1, %o1
	swap	[%l7 + 0x58],	%g5
	fbne	%fcc3,	loop_619
	fble	%fcc2,	loop_620
loop_618:
	tgu	%icc,	0x6
	movneg	%icc,	%g3,	%i4
loop_619:
	movg	%icc,	%l0,	%l4
loop_620:
	movgu	%icc,	%g7,	%i3
	array32	%i5,	%i1,	%i0
	bleu,pn	%xcc,	loop_621
	pdist	%f18,	%f0,	%f20
	tcs	%xcc,	0x3
	wr	%g0,	0x80,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
loop_621:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	st	%f29,	[%l7 + 0x34]
	edge32l	%l3,	%o6,	%o4
	fandnot1	%f22,	%f14,	%f10
	fones	%f12
	bvc,pt	%icc,	loop_622
	fba,a	%fcc2,	loop_623
	movrlz	%i2,	0x1F2,	%g2
	fornot1	%f8,	%f16,	%f6
loop_622:
	umulcc	%i6,	0x13DB,	%o5
loop_623:
	std	%f20,	[%l7 + 0x60]
	movl	%icc,	%i7,	%g6
	andn	%o7,	%o2,	%l2
	movgu	%icc,	%o0,	%l6
	edge16n	%l5,	%l1,	%g1
	movle	%icc,	%o3,	%g4
	movcc	%xcc,	%g5,	%o1
	array8	%g3,	%l0,	%i4
	fbne	%fcc2,	loop_624
	srax	%g7,	0x01,	%l4
	fmovdg	%xcc,	%f21,	%f16
	tsubcctv	%i3,	%i5,	%i1
loop_624:
	subccc	%i0,	%o6,	%l3
	fbe,a	%fcc3,	loop_625
	edge32l	%o4,	%i2,	%g2
	fbl	%fcc3,	loop_626
	fpack16	%f6,	%f28
loop_625:
	fnors	%f9,	%f8,	%f17
	mova	%xcc,	%o5,	%i7
loop_626:
	tgu	%icc,	0x7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnot1	%f0,	%f10
	tle	%icc,	0x7
	bneg	%icc,	loop_627
	tcc	%icc,	0x0
	bgu,a	%xcc,	loop_628
	movrne	%i6,	0x30A,	%o7
loop_627:
	mulscc	%o2,	%l2,	%g6
	tn	%xcc,	0x0
loop_628:
	mova	%xcc,	%l6,	%l5
	fcmpes	%fcc2,	%f13,	%f21
	tsubcctv	%o0,	%l1,	%o3
	smulcc	%g1,	0x16EE,	%g4
	orcc	%o1,	%g3,	%l0
	sdivx	%g5,	0x1DFF,	%g7
	movn	%xcc,	%i4,	%l4
	edge32ln	%i5,	%i3,	%i0
	fnot1	%f30,	%f2
	fmovdge	%xcc,	%f30,	%f10
	mulscc	%o6,	0x16FF,	%i1
	brz,a	%o4,	loop_629
	or	%l3,	0x0E74,	%g2
	bg,pn	%xcc,	loop_630
	fcmpd	%fcc0,	%f2,	%f22
loop_629:
	nop
	add	%l7,	0x78,	%l6
	wr	%g0,	0x04,	%asi
	casxa	[%l6] 0x04,	%i2,	%o5
loop_630:
	tn	%icc,	0x1
	movrlez	%i6,	0x10F,	%i7
	fnands	%f31,	%f27,	%f2
	add	%l7,	0x14,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%o7
	casa	[%l6] %asi,	%o7,	%l2
	tsubcctv	%g6,	0x1375,	%l6
	wr	%g0,	0x0c,	%asi
	lduwa	[%l7 + 0x4C] %asi,	%o2
	fornot1	%f14,	%f20,	%f18
	fbe	%fcc3,	loop_631
	fnegd	%f18,	%f14
	nop
	setx	loop_632,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fbge	%fcc3,	loop_633
loop_631:
	addc	%o0,	%l5,	%l1
	mulx	%g1,	0x0C2D,	%g4
loop_632:
	umul	%o3,	%g3,	%l0
loop_633:
	smul	%g5,	%g7,	%i4
	fmovrde	%l4,	%f30,	%f18
	set	0x6F, %o5
	ldstuba	[%l7 + %o5] 0x80,	%o1
	movgu	%icc,	%i5,	%i3
	edge32ln	%i0,	%o6,	%o4
	movrgz	%l3,	0x2A6,	%g2
	be,a	%xcc,	loop_634
	srlx	%i2,	0x17,	%o5
	movrgez	%i6,	%i1,	%o7
	fmovrdgez	%i7,	%f30,	%f0
loop_634:
	fpmerge	%f24,	%f13,	%f16
	fmovsneg	%xcc,	%f6,	%f29
	lduw	[%l7 + 0x60],	%g6
	alignaddrl	%l6,	%l2,	%o2
	fpackfix	%f20,	%f7
	movcs	%icc,	%o0,	%l5
	membar	0x23
	bn,pt	%xcc,	loop_635
	movvs	%icc,	%l1,	%g1
	mulx	%o3,	%g4,	%l0
	movre	%g5,	%g3,	%g7
loop_635:
	fcmpne16	%f18,	%f14,	%l4
	ta	%icc,	0x7
	or	%o1,	0x194A,	%i4
	edge8	%i3,	%i5,	%i0
	brlz,a	%o6,	loop_636
	taddcc	%o4,	0x0738,	%l3
	bcc	loop_637
	orn	%i2,	%g2,	%o5
loop_636:
	movrgz	%i6,	0x2E5,	%o7
	movrne	%i7,	%i1,	%g6
loop_637:
	bl,a	%xcc,	loop_638
	subc	%l6,	%o2,	%o0
	set	0x30, %i0
	ldxa	[%g0 + %i0] 0x20,	%l2
loop_638:
	std	%l0,	[%l7 + 0x40]
	bgu,a	%xcc,	loop_639
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movleu	%xcc,	%l5,	%g1
	udiv	%o3,	0x1D01,	%g4
loop_639:
	nop
	set	0x3C, %o0
	swapa	[%l7 + %o0] 0x89,	%l0
	wr	%g0,	0x0c,	%asi
	ldxa	[%l7 + 0x60] %asi,	%g3
	xorcc	%g5,	%g7,	%l4
	tneg	%xcc,	0x2
	add	%l7,	0x08,	%l6
	wr	%g0,	0x11,	%asi
	casxa	[%l6] %asi,	%o1,	%i3
	wr	%g0,	0x88,	%asi
	ldsha	[%l7 + 0x3A] %asi,	%i4
	movl	%xcc,	%i5,	%o6
	movneg	%icc,	%i0,	%l3
	subc	%i2,	%g2,	%o5
	movrgz	%i6,	%o4,	%i7
	ldsh	[%l7 + 0x42],	%i1
	tcs	%icc,	0x5
	fpadd32s	%f27,	%f21,	%f17
	subcc	%o7,	0x0134,	%l6
	andn	%o2,	%g6,	%l2
	move	%icc,	%l1,	%l5
	ldub	[%l7 + 0x7A],	%o0
	movle	%xcc,	%g1,	%o3
	addc	%l0,	0x039D,	%g4
	fmovdneg	%xcc,	%f22,	%f0
	bcs,a	loop_640
	movvs	%xcc,	%g3,	%g5
	array16	%l4,	%g7,	%o1
	fnot1	%f14,	%f22
loop_640:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movre	%i4,	0x122,	%i5
	fnors	%f8,	%f28,	%f12
	movrne	%i3,	%o6,	%i0
	andn	%i2,	0x1EFF,	%l3
	edge32n	%o5,	%i6,	%o4
	tvc	%xcc,	0x4
	fpadd32s	%f22,	%f3,	%f30
	movcc	%xcc,	%g2,	%i1
	edge8ln	%i7,	%o7,	%o2
	fmovdg	%icc,	%f27,	%f5
	fpsub16	%f8,	%f4,	%f12
	movge	%xcc,	%g6,	%l2
	edge32	%l6,	%l1,	%o0
	brnz	%g1,	loop_641
	movre	%l5,	0x2C4,	%l0
	brlz	%g4,	loop_642
	array8	%g3,	%g5,	%o3
loop_641:
	ble,pn	%icc,	loop_643
	bvc,a	%icc,	loop_644
loop_642:
	sllx	%g7,	%o1,	%l4
	xor	%i4,	0x0E8F,	%i3
loop_643:
	fone	%f18
loop_644:
	taddcc	%i5,	0x0BF7,	%i0
	fornot1	%f22,	%f30,	%f16
	or	%o6,	%i2,	%l3
	array8	%o5,	%o4,	%i6
	tsubcctv	%g2,	%i1,	%o7
	udivx	%i7,	0x04C1,	%g6
	set	0x34, %o3
	lda	[%l7 + %o3] 0x18,	%f0
	fandnot2	%f16,	%f28,	%f10
	ldsb	[%l7 + 0x4B],	%l2
	edge16n	%o2,	%l6,	%o0
	orn	%g1,	%l5,	%l1
	brlez,a	%g4,	loop_645
	tcc	%xcc,	0x7
	alignaddr	%g3,	%g5,	%o3
	bcc,a,pn	%icc,	loop_646
loop_645:
	fbne	%fcc2,	loop_647
	taddcc	%l0,	%o1,	%g7
	andcc	%i4,	0x11EC,	%i3
loop_646:
	movg	%xcc,	%l4,	%i5
loop_647:
	srl	%i0,	%i2,	%o6
	tgu	%icc,	0x6
	brnz	%o5,	loop_648
	fmovrdlez	%o4,	%f30,	%f4
	alignaddr	%l3,	%g2,	%i1
	fmovdl	%xcc,	%f16,	%f22
loop_648:
	nop
	set	0x40, %o4
	stda	%f0,	[%l7 + %o4] 0xf0
	membar	#Sync
	array32	%o7,	%i6,	%g6
	wr	%g0,	0x22,	%asi
	ldda	[%l7 + 0x30] %asi,	%l2
	fmovse	%icc,	%f18,	%f5
	fbe	%fcc3,	loop_649
	movle	%icc,	%i7,	%o2
	te	%icc,	0x7
	fbne,a	%fcc2,	loop_650
loop_649:
	alignaddr	%l6,	%o0,	%g1
	std	%l0,	[%l7 + 0x50]
	movge	%icc,	%g4,	%g3
loop_650:
	fbo	%fcc3,	loop_651
	tgu	%xcc,	0x3
	subcc	%l5,	%g5,	%l0
	mova	%icc,	%o3,	%g7
loop_651:
	tvc	%icc,	0x7
	tn	%icc,	0x0
	edge8l	%i4,	%o1,	%i3
	ldsh	[%l7 + 0x6C],	%i5
	ldub	[%l7 + 0x52],	%i0
	ldsw	[%l7 + 0x68],	%l4
	tleu	%icc,	0x0
	smulcc	%o6,	0x09BD,	%i2
	udivx	%o5,	0x09EB,	%l3
	movrgz	%o4,	%i1,	%o7
	edge8ln	%g2,	%g6,	%i6
	or	%i7,	0x0B00,	%o2
	set	0x6B, %l5
	stba	%l2,	[%l7 + %l5] 0x27
	membar	#Sync
	srlx	%l6,	%o0,	%l1
	fmovrsne	%g4,	%f21,	%f30
	fands	%f29,	%f20,	%f18
	stbar
	alignaddrl	%g3,	%l5,	%g5
	edge8	%l0,	%g1,	%o3
	orn	%g7,	0x1FC6,	%i4
	edge16n	%i3,	%o1,	%i0
	mulx	%i5,	0x1D1A,	%l4
	movgu	%icc,	%o6,	%o5
	tsubcctv	%l3,	%o4,	%i1
	fxors	%f24,	%f0,	%f14
	fmovdl	%icc,	%f30,	%f6
	fpsub32s	%f20,	%f26,	%f25
	fbule	%fcc2,	loop_652
	fbule,a	%fcc1,	loop_653
	tcc	%xcc,	0x0
	swap	[%l7 + 0x20],	%i2
loop_652:
	tgu	%icc,	0x0
loop_653:
	edge32n	%o7,	%g2,	%g6
	movvs	%icc,	%i7,	%o2
	bn,a,pn	%xcc,	loop_654
	fmovs	%f15,	%f15
	movne	%icc,	%i6,	%l2
	orcc	%l6,	%o0,	%l1
loop_654:
	tpos	%xcc,	0x7
	fbue	%fcc0,	loop_655
	ta	%xcc,	0x1
	fzero	%f14
	fors	%f16,	%f17,	%f25
loop_655:
	edge8	%g3,	%g4,	%g5
	movl	%xcc,	%l5,	%g1
	sub	%l0,	%o3,	%g7
	fblg,a	%fcc2,	loop_656
	bne,a,pt	%xcc,	loop_657
	tg	%icc,	0x2
	edge16	%i4,	%i3,	%o1
loop_656:
	edge8ln	%i5,	%l4,	%i0
loop_657:
	bg	%xcc,	loop_658
	fandnot1s	%f23,	%f1,	%f14
	sethi	0x0C59,	%o5
	addcc	%o6,	%o4,	%i1
loop_658:
	taddcctv	%i2,	0x0D37,	%o7
	fbn,a	%fcc1,	loop_659
	fmovsge	%icc,	%f26,	%f10
	tge	%icc,	0x7
	xnorcc	%l3,	%g6,	%i7
loop_659:
	fornot1s	%f28,	%f13,	%f28
	ta	%xcc,	0x5
	sub	%o2,	0x19D3,	%g2
	bshuffle	%f2,	%f26,	%f24
	fmovdleu	%icc,	%f15,	%f21
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x5C] %asi,	%i6
	call	loop_660
	fcmple16	%f8,	%f6,	%l6
	stb	%o0,	[%l7 + 0x0A]
	fsrc2	%f8,	%f30
loop_660:
	ldd	[%l7 + 0x18],	%l2
	brgz	%l1,	loop_661
	fcmpne32	%f24,	%f28,	%g3
	tge	%icc,	0x3
	add	%l7,	0x28,	%l6
	wr	%g0,	0x19,	%asi
	casxa	[%l6] 0x19,	%g4,	%g5
loop_661:
	nop
	wr	%g0,	0x23,	%asi
	stda	%g0,	[%l7 + 0x08] %asi
	membar	#Sync
	set	0x2C, %g3
	ldsha	[%l7 + %g3] 0x19,	%l0
	sdivx	%l5,	0x14DE,	%g7
	tsubcctv	%o3,	0x1132,	%i4
	tcc	%xcc,	0x4
	fornot2	%f12,	%f8,	%f30
	sub	%o1,	0x1BBB,	%i5
	fmul8x16	%f13,	%f10,	%f24
	movvc	%xcc,	%i3,	%l4
	edge16ln	%o5,	%i0,	%o4
	movne	%xcc,	%o6,	%i1
	fmuld8ulx16	%f24,	%f26,	%f22
	alignaddrl	%i2,	%l3,	%o7
	sll	%i7,	%g6,	%o2
	movne	%icc,	%g2,	%i6
	tleu	%icc,	0x0
	mulscc	%l6,	%o0,	%l2
	movvs	%xcc,	%l1,	%g3
	sllx	%g5,	%g1,	%l0
	fandnot1	%f30,	%f8,	%f20
	movvc	%icc,	%g4,	%l5
	fmovrse	%g7,	%f22,	%f25
	edge32l	%i4,	%o1,	%i5
	ble,pn	%xcc,	loop_662
	umulcc	%o3,	0x154E,	%i3
	taddcctv	%l4,	%o5,	%i0
	fpadd16	%f26,	%f24,	%f14
loop_662:
	std	%o6,	[%l7 + 0x78]
	wr	%g0,	0x80,	%asi
	ldsba	[%l7 + 0x30] %asi,	%o4
	udiv	%i1,	0x0E8B,	%i2
	movpos	%xcc,	%o7,	%l3
	movrgz	%i7,	%g6,	%g2
	tleu	%icc,	0x3
	fmovdgu	%icc,	%f15,	%f10
	tle	%xcc,	0x0
	edge16	%o2,	%l6,	%i6
	or	%l2,	0x0EA5,	%o0
	fmovse	%icc,	%f22,	%f9
	ldsh	[%l7 + 0x24],	%g3
	fbge,a	%fcc0,	loop_663
	addc	%l1,	0x05AE,	%g5
	movvs	%icc,	%g1,	%l0
	fmovs	%f28,	%f26
loop_663:
	edge32n	%l5,	%g7,	%i4
	xor	%g4,	%o1,	%o3
	tgu	%icc,	0x2
	movrgz	%i5,	%i3,	%l4
	ldd	[%l7 + 0x08],	%o4
	srlx	%o6,	0x09,	%i0
	fbge	%fcc3,	loop_664
	tsubcc	%o4,	%i1,	%i2
	sub	%o7,	0x191D,	%i7
	edge8n	%g6,	%g2,	%o2
loop_664:
	subccc	%l3,	0x0E6A,	%i6
	tneg	%icc,	0x5
	fbul	%fcc1,	loop_665
	fmovrdlz	%l6,	%f22,	%f10
	bn	%icc,	loop_666
	sll	%o0,	%l2,	%l1
loop_665:
	srax	%g5,	0x0B,	%g3
	fmovdvc	%icc,	%f20,	%f4
loop_666:
	fbue,a	%fcc0,	loop_667
	sllx	%g1,	%l5,	%g7
	sub	%i4,	%l0,	%g4
	taddcc	%o1,	0x07C5,	%o3
loop_667:
	array8	%i3,	%l4,	%o5
	tneg	%xcc,	0x1
	fmovsgu	%xcc,	%f7,	%f27
	movge	%xcc,	%o6,	%i5
	ldx	[%l7 + 0x58],	%i0
	fmovrdne	%o4,	%f22,	%f4
	brnz	%i1,	loop_668
	mulscc	%o7,	%i2,	%g6
	fbul	%fcc3,	loop_669
	xor	%g2,	0x141B,	%o2
loop_668:
	ldsh	[%l7 + 0x1E],	%l3
	movle	%xcc,	%i7,	%i6
loop_669:
	smul	%l6,	0x12F4,	%l2
	mova	%icc,	%o0,	%l1
	movle	%xcc,	%g5,	%g1
	fpadd32	%f28,	%f10,	%f16
	orcc	%l5,	%g7,	%i4
	wr	%g0,	0x89,	%asi
	ldswa	[%l7 + 0x3C] %asi,	%l0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x28, %g5
	ldsba	[%l7 + %g5] 0x14,	%g4
	movpos	%icc,	%g3,	%o1
	alignaddr	%i3,	%l4,	%o5
	fbg	%fcc1,	loop_670
	brgez	%o6,	loop_671
	movne	%icc,	%i5,	%o3
	srl	%i0,	%i1,	%o7
loop_670:
	tsubcc	%o4,	0x00F5,	%g6
loop_671:
	fpmerge	%f14,	%f25,	%f12
	ble	%icc,	loop_672
	tle	%xcc,	0x3
	move	%icc,	%g2,	%o2
	add	%l3,	0x1EC9,	%i7
loop_672:
	mulx	%i2,	%i6,	%l6
	fmovrdlez	%l2,	%f14,	%f18
	wr	%g0,	0x89,	%asi
	stxa	%o0,	[%l7 + 0x58] %asi
	xorcc	%l1,	0x08D4,	%g5
	ldsw	[%l7 + 0x44],	%g1
	ldx	[%l7 + 0x48],	%l5
	fmovdg	%xcc,	%f10,	%f4
	fmovsge	%xcc,	%f7,	%f13
	sdiv	%g7,	0x002D,	%i4
	brgz,a	%l0,	loop_673
	bn,pt	%xcc,	loop_674
	srl	%g4,	%o1,	%i3
	tsubcctv	%l4,	%o5,	%g3
loop_673:
	taddcctv	%o6,	0x198E,	%i5
loop_674:
	tpos	%icc,	0x6
	wr	%g0,	0x88,	%asi
	stda	%i0,	[%l7 + 0x08] %asi
	array32	%i1,	%o7,	%o4
	tpos	%icc,	0x5
	std	%f14,	[%l7 + 0x28]
	orcc	%g6,	0x0861,	%o3
	edge32n	%g2,	%o2,	%i7
	edge32	%l3,	%i6,	%i2
	movn	%xcc,	%l2,	%o0
	umul	%l6,	%g5,	%g1
	fmovsleu	%icc,	%f25,	%f25
	udiv	%l5,	0x1C27,	%l1
	wr	%g0,	0x89,	%asi
	sta	%f25,	[%l7 + 0x64] %asi
	orcc	%g7,	%i4,	%g4
	sll	%o1,	0x02,	%l0
	fnot1s	%f1,	%f13
	array8	%i3,	%o5,	%l4
	edge32l	%g3,	%i5,	%o6
	fabsd	%f18,	%f6
	fbul,a	%fcc3,	loop_675
	edge16l	%i0,	%o7,	%i1
	sethi	0x004B,	%g6
	orn	%o4,	%o3,	%g2
loop_675:
	brlz,a	%o2,	loop_676
	fmovdvc	%icc,	%f20,	%f3
	xorcc	%l3,	0x186F,	%i6
	fmovsleu	%icc,	%f30,	%f23
loop_676:
	fbne	%fcc0,	loop_677
	udivx	%i7,	0x19AC,	%l2
	edge32	%i2,	%o0,	%l6
	fmovdvs	%xcc,	%f9,	%f24
loop_677:
	xorcc	%g5,	%g1,	%l5
	tvs	%icc,	0x0
	fpadd32s	%f29,	%f18,	%f9
	fors	%f22,	%f6,	%f21
	udiv	%l1,	0x0B44,	%g7
	and	%g4,	0x1F18,	%o1
	edge32	%i4,	%l0,	%o5
	subc	%i3,	%g3,	%i5
	ldsh	[%l7 + 0x3C],	%o6
	wr	%g0,	0x80,	%asi
	sta	%f14,	[%l7 + 0x1C] %asi
	tcs	%xcc,	0x4
	movrne	%l4,	%o7,	%i0
	and	%g6,	%i1,	%o3
	addccc	%o4,	%g2,	%l3
	fbul,a	%fcc2,	loop_678
	addcc	%i6,	0x0BB1,	%i7
	tn	%xcc,	0x0
	siam	0x5
loop_678:
	fpmerge	%f29,	%f0,	%f14
	fandnot2	%f20,	%f14,	%f18
	nop
	setx	loop_679,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	mova	%icc,	%l2,	%o2
	brlz,a	%o0,	loop_680
	membar	0x70
loop_679:
	movge	%xcc,	%l6,	%g5
	movne	%xcc,	%g1,	%i2
loop_680:
	mulx	%l1,	%l5,	%g7
	set	0x49, %g2
	ldsba	[%l7 + %g2] 0x19,	%g4
	subc	%o1,	0x0809,	%l0
	nop
	setx	loop_681,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	ldx	[%l7 + 0x30],	%o5
	stw	%i4,	[%l7 + 0x78]
	fpadd32s	%f7,	%f21,	%f29
loop_681:
	prefetch	[%l7 + 0x38],	 0x0
	tneg	%xcc,	0x3
	fmovrdgz	%i3,	%f6,	%f10
	fmovse	%icc,	%f17,	%f5
	brgez,a	%i5,	loop_682
	lduh	[%l7 + 0x6A],	%g3
	srlx	%l4,	0x03,	%o7
	fmul8ulx16	%f26,	%f4,	%f12
loop_682:
	tleu	%icc,	0x5
	sll	%o6,	%i0,	%g6
	edge32	%o3,	%i1,	%o4
	ldd	[%l7 + 0x18],	%f10
	tl	%xcc,	0x3
	move	%xcc,	%g2,	%i6
	fmovsl	%xcc,	%f8,	%f31
	fmovsvc	%icc,	%f29,	%f28
	movge	%xcc,	%l3,	%l2
	fbug	%fcc3,	loop_683
	xnor	%o2,	%i7,	%l6
	bvc	%icc,	loop_684
	fcmple32	%f16,	%f14,	%g5
loop_683:
	fabsd	%f6,	%f18
	set	0x20, %i3
	stda	%g0,	[%l7 + %i3] 0x14
loop_684:
	srax	%i2,	%l1,	%o0
	or	%g7,	0x1DD5,	%g4
	set	0x14, %l4
	ldsba	[%l7 + %l4] 0x81,	%o1
	movge	%icc,	%l0,	%o5
	call	loop_685
	tcc	%icc,	0x0
	wr	%g0,	0x2b,	%asi
	stwa	%i4,	[%l7 + 0x1C] %asi
	membar	#Sync
loop_685:
	fpsub16s	%f31,	%f17,	%f4
	movrlez	%i3,	0x19E,	%l5
	alignaddr	%i5,	%g3,	%o7
	bge,a,pt	%xcc,	loop_686
	sdivcc	%l4,	0x1D8F,	%o6
	fbne,a	%fcc2,	loop_687
	movrlz	%g6,	%i0,	%i1
loop_686:
	bpos,a,pn	%icc,	loop_688
	movrne	%o3,	%g2,	%i6
loop_687:
	movcc	%icc,	%l3,	%l2
	tn	%xcc,	0x0
loop_688:
	movge	%icc,	%o4,	%i7
	fmovdn	%icc,	%f14,	%f9
	wr	%g0,	0x23,	%asi
	stha	%l6,	[%l7 + 0x66] %asi
	membar	#Sync
	and	%o2,	%g5,	%g1
	tpos	%xcc,	0x5
	set	0x0C, %i4
	sta	%f2,	[%l7 + %i4] 0x89
	andn	%i2,	%l1,	%o0
	array16	%g4,	%o1,	%l0
	sth	%g7,	[%l7 + 0x6C]
	srl	%o5,	%i4,	%l5
	fcmps	%fcc1,	%f13,	%f4
	nop
	set	0x58, %g4
	std	%i4,	[%l7 + %g4]
	wr	%g0,	0x11,	%asi
	sta	%f6,	[%l7 + 0x38] %asi
	wr	%g0,	0x10,	%asi
	ldswa	[%l7 + 0x1C] %asi,	%g3
	movrlez	%i3,	0x051,	%l4
	fmovrse	%o7,	%f14,	%f25
	brnz	%g6,	loop_689
	orn	%o6,	%i0,	%o3
	fcmpd	%fcc2,	%f6,	%f8
	umul	%i1,	0x1EAC,	%g2
loop_689:
	sll	%l3,	%l2,	%i6
	movrne	%i7,	%l6,	%o4
	xorcc	%g5,	0x00A8,	%o2
	fandnot1	%f12,	%f14,	%f16
	add	%l7,	0x78,	%l6
	wr	%g0,	0x11,	%asi
	casxa	[%l6] %asi,	%i2,	%g1
	movrgz	%l1,	0x053,	%g4
	movrlez	%o1,	0x0D5,	%o0
	tne	%icc,	0x6
	orn	%g7,	%l0,	%i4
	fbug	%fcc1,	loop_690
	edge16n	%o5,	%i5,	%l5
	tne	%xcc,	0x3
	tle	%xcc,	0x1
loop_690:
	nop
	wr	%g0,	0x22,	%asi
	stda	%g2,	[%l7 + 0x28] %asi
	membar	#Sync
	addcc	%l4,	0x16F6,	%i3
	mulscc	%o7,	0x010E,	%g6
	tl	%icc,	0x6
	fandnot2s	%f25,	%f0,	%f24
	fmovdleu	%icc,	%f29,	%f19
	edge8n	%i0,	%o3,	%i1
	sir	0x086A
	te	%xcc,	0x3
	brlez	%o6,	loop_691
	fmovdleu	%icc,	%f6,	%f4
	edge32ln	%l3,	%l2,	%g2
	alignaddr	%i7,	%l6,	%o4
loop_691:
	nop
	setx	loop_692,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movgu	%xcc,	%i6,	%g5
	edge32ln	%o2,	%i2,	%g1
	fbge,a	%fcc0,	loop_693
loop_692:
	sllx	%l1,	0x0E,	%o1
	fandnot1	%f28,	%f10,	%f24
	tsubcc	%g4,	%g7,	%o0
loop_693:
	edge16n	%l0,	%i4,	%o5
	pdist	%f4,	%f8,	%f16
	fbuge	%fcc2,	loop_694
	movvc	%icc,	%l5,	%i5
	bvc,a,pt	%xcc,	loop_695
	edge32ln	%g3,	%i3,	%l4
loop_694:
	fcmpd	%fcc2,	%f22,	%f12
	movrgez	%o7,	%i0,	%g6
loop_695:
	bpos,pn	%xcc,	loop_696
	movrne	%i1,	%o6,	%o3
	movrlez	%l2,	0x1C8,	%g2
	tvc	%icc,	0x2
loop_696:
	array32	%l3,	%i7,	%l6
	orn	%i6,	%g5,	%o4
	be,a,pn	%xcc,	loop_697
	add	%o2,	%g1,	%i2
	fmovse	%icc,	%f1,	%f6
	add	%o1,	%l1,	%g4
loop_697:
	edge32l	%o0,	%l0,	%i4
	udivcc	%g7,	0x050A,	%o5
	ld	[%l7 + 0x28],	%f29
	fmovdl	%icc,	%f18,	%f8
	lduh	[%l7 + 0x0A],	%i5
	ldsw	[%l7 + 0x24],	%g3
	fandnot2	%f28,	%f16,	%f26
	fcmps	%fcc0,	%f4,	%f18
	udivcc	%i3,	0x0CF7,	%l4
	movvc	%xcc,	%o7,	%l5
	udivx	%i0,	0x1A76,	%i1
	tneg	%icc,	0x7
	umul	%o6,	%o3,	%l2
	edge8ln	%g2,	%l3,	%g6
	movcs	%icc,	%l6,	%i6
	subc	%g5,	%i7,	%o4
	fandnot1s	%f17,	%f13,	%f19
	fbu	%fcc1,	loop_698
	bvc	%icc,	loop_699
	fmovsl	%icc,	%f9,	%f11
	udiv	%g1,	0x0D4C,	%o2
loop_698:
	and	%o1,	%i2,	%g4
loop_699:
	popc	0x0FF8,	%o0
	nop
	setx	loop_700,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tsubcctv	%l1,	%l0,	%i4
	edge8l	%o5,	%i5,	%g3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_700:
	alignaddr	%i3,	%g7,	%l4
	movvc	%icc,	%l5,	%i0
	fpadd16s	%f18,	%f0,	%f28
	addccc	%o7,	0x0A5A,	%o6
	fbg,a	%fcc2,	loop_701
	fnegd	%f4,	%f8
	udivcc	%i1,	0x182C,	%l2
	te	%icc,	0x0
loop_701:
	nop
	wr	%g0,	0x80,	%asi
	ldda	[%l7 + 0x20] %asi,	%o2
	ldsw	[%l7 + 0x14],	%l3
	taddcctv	%g6,	%l6,	%i6
	bg,a,pn	%icc,	loop_702
	ldx	[%l7 + 0x08],	%g5
	subc	%g2,	%i7,	%o4
	fmovsleu	%icc,	%f19,	%f25
loop_702:
	sdivcc	%g1,	0x039E,	%o2
	mulx	%o1,	0x0191,	%g4
	orncc	%i2,	%l1,	%l0
	array8	%i4,	%o0,	%o5
	fmovsleu	%icc,	%f26,	%f18
	orn	%g3,	%i3,	%g7
	fmovrsgz	%l4,	%f3,	%f10
	tgu	%xcc,	0x3
	fmul8ulx16	%f28,	%f30,	%f30
	movg	%icc,	%l5,	%i5
	andncc	%o7,	%i0,	%o6
	movrlz	%l2,	0x157,	%o3
	edge16l	%l3,	%g6,	%l6
	siam	0x2
	tneg	%icc,	0x0
	set	0x30, %i7
	stda	%i6,	[%l7 + %i7] 0x14
	sll	%i1,	0x03,	%g5
	fpackfix	%f24,	%f13
	set	0x74, %o1
	lduba	[%l7 + %o1] 0x89,	%g2
	membar	#Sync
	set	0x40, %o6
	ldda	[%l7 + %o6] 0xf9,	%f16
	bg,a,pn	%icc,	loop_703
	fzero	%f10
	tl	%xcc,	0x7
	fmovsge	%icc,	%f7,	%f13
loop_703:
	nop
	set	0x75, %i1
	stba	%o4,	[%l7 + %i1] 0x88
	edge32	%i7,	%o2,	%g1
	movneg	%icc,	%o1,	%g4
	bvs	%icc,	loop_704
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sub	%l1,	%l0,	%i4
	wr	%g0,	0x0c,	%asi
	ldswa	[%l7 + 0x5C] %asi,	%o0
loop_704:
	fmovrdgez	%o5,	%f6,	%f22
	bn,a	%icc,	loop_705
	tpos	%icc,	0x3
	umul	%g3,	%i3,	%i2
	fmovsleu	%xcc,	%f22,	%f28
loop_705:
	fbule,a	%fcc2,	loop_706
	fmul8sux16	%f0,	%f20,	%f14
	alignaddr	%l4,	%l5,	%g7
	movleu	%icc,	%o7,	%i5
loop_706:
	smulcc	%o6,	0x1574,	%i0
	movvc	%xcc,	%o3,	%l3
	sll	%g6,	%l6,	%i6
	bn,a	loop_707
	edge8	%i1,	%g5,	%l2
	movrlz	%g2,	0x1E4,	%o4
	fors	%f26,	%f31,	%f27
loop_707:
	nop
	set	0x33, %g6
	ldstuba	[%l7 + %g6] 0x0c,	%i7
	wr	%g0,	0x80,	%asi
	lda	[%l7 + 0x7C] %asi,	%f6
	fcmple16	%f22,	%f28,	%o2
	tne	%icc,	0x5
	xnor	%o1,	0x05D9,	%g1
	brlz	%g4,	loop_708
	sdivx	%l1,	0x0184,	%l0
	membar	0x4B
	tge	%icc,	0x6
loop_708:
	bvs,a,pt	%icc,	loop_709
	edge8ln	%o0,	%i4,	%o5
	udivcc	%g3,	0x035D,	%i3
	fbug,a	%fcc3,	loop_710
loop_709:
	fmovdvs	%icc,	%f4,	%f20
	fandnot1s	%f4,	%f27,	%f9
	bn	%xcc,	loop_711
loop_710:
	movg	%xcc,	%l4,	%l5
	ld	[%l7 + 0x2C],	%f8
	fmovdvc	%xcc,	%f4,	%f23
loop_711:
	addcc	%g7,	0x09C8,	%o7
	std	%i2,	[%l7 + 0x70]
	fbu	%fcc3,	loop_712
	edge16	%i5,	%i0,	%o3
	addc	%l3,	0x172F,	%o6
	array16	%l6,	%g6,	%i6
loop_712:
	fbg,a	%fcc0,	loop_713
	taddcc	%i1,	%g5,	%l2
	array32	%g2,	%o4,	%o2
	addcc	%i7,	0x00D1,	%o1
loop_713:
	edge32	%g4,	%l1,	%g1
	fpsub16s	%f14,	%f23,	%f10
	fbg,a	%fcc0,	loop_714
	udivx	%l0,	0x0A85,	%o0
	movne	%xcc,	%i4,	%g3
	edge8l	%i3,	%l4,	%o5
loop_714:
	edge32ln	%g7,	%l5,	%o7
	sll	%i5,	%i2,	%o3
	ldsw	[%l7 + 0x50],	%l3
	tn	%xcc,	0x1
	move	%xcc,	%o6,	%l6
	alignaddrl	%g6,	%i6,	%i0
	ldsh	[%l7 + 0x74],	%g5
	xor	%i1,	0x128D,	%l2
	std	%o4,	[%l7 + 0x20]
	fmovse	%icc,	%f7,	%f0
	fmovsvc	%icc,	%f23,	%f26
	fbule,a	%fcc1,	loop_715
	movvc	%icc,	%o2,	%i7
	set	0x20, %o2
	ldstuba	[%l7 + %o2] 0x88,	%o1
loop_715:
	array16	%g2,	%l1,	%g4
	edge16ln	%l0,	%o0,	%i4
	movvs	%xcc,	%g1,	%i3
	edge32ln	%g3,	%o5,	%l4
	edge8ln	%g7,	%l5,	%o7
	te	%icc,	0x4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	brlz	%i5,	loop_716
	movneg	%xcc,	%o3,	%l3
	alignaddr	%i2,	%o6,	%g6
	set	0x12, %l2
	ldsha	[%l7 + %l2] 0x80,	%i6
loop_716:
	fmovdneg	%xcc,	%f10,	%f5
	fmovs	%f26,	%f0
	fornot1	%f12,	%f28,	%f18
	fmovsle	%xcc,	%f2,	%f2
	movre	%i0,	0x0DC,	%l6
	wr	%g0,	0x17,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
	movge	%xcc,	%g5,	%l2
	fnegs	%f31,	%f30
	st	%f23,	[%l7 + 0x7C]
	fmovsle	%icc,	%f21,	%f10
	edge16l	%i1,	%o2,	%o4
	wr	%g0,	0x89,	%asi
	ldstuba	[%l7 + 0x15] %asi,	%o1
	fexpand	%f0,	%f6
	edge32n	%i7,	%l1,	%g4
	fmovsl	%xcc,	%f4,	%f12
	movl	%icc,	%g2,	%o0
	fsrc1	%f8,	%f24
	movge	%xcc,	%l0,	%i4
	ble,a	%xcc,	loop_717
	fzero	%f18
	andcc	%g1,	%i3,	%g3
	xnor	%l4,	%g7,	%o5
loop_717:
	udivcc	%o7,	0x0959,	%i5
	fmuld8sux16	%f20,	%f6,	%f4
	srax	%l5,	0x0B,	%o3
	fmovsg	%xcc,	%f20,	%f14
	alignaddr	%l3,	%o6,	%g6
	xnorcc	%i2,	0x0865,	%i6
	ble,a	%xcc,	loop_718
	fmovrsne	%i0,	%f13,	%f8
	add	%l7,	0x78,	%l6
	wr	%g0,	0x19,	%asi
	casa	[%l6] 0x19,	%l6,	%g5
loop_718:
	swap	[%l7 + 0x54],	%l2
	sra	%i1,	%o4,	%o1
	srax	%i7,	%l1,	%o2
	fexpand	%f30,	%f18
	ba,pn	%icc,	loop_719
	taddcc	%g4,	%o0,	%l0
	movcc	%xcc,	%g2,	%i4
	movrlez	%g1,	0x0D3,	%i3
loop_719:
	mova	%icc,	%l4,	%g3
	movg	%icc,	%g7,	%o7
	fmovrdlez	%o5,	%f12,	%f14
	udivcc	%l5,	0x0EF7,	%i5
	sdivcc	%l3,	0x182A,	%o6
	bgu,a	%icc,	loop_720
	stx	%o3,	[%l7 + 0x18]
	fble,a	%fcc1,	loop_721
	stb	%g6,	[%l7 + 0x61]
loop_720:
	array32	%i2,	%i0,	%l6
	fnot2	%f10,	%f20
loop_721:
	taddcc	%i6,	0x1B6D,	%l2
	xor	%g5,	0x11AB,	%i1
	lduw	[%l7 + 0x7C],	%o1
	fexpand	%f27,	%f18
	fornot2s	%f13,	%f12,	%f5
	movl	%xcc,	%o4,	%i7
	udivcc	%o2,	0x0FB9,	%l1
	addc	%o0,	%g4,	%g2
	or	%i4,	0x17EC,	%g1
	bg,pt	%xcc,	loop_722
	movn	%icc,	%i3,	%l4
	tvs	%xcc,	0x7
	srax	%g3,	0x07,	%g7
loop_722:
	call	loop_723
	orncc	%l0,	0x1E83,	%o7
	movge	%icc,	%l5,	%i5
	movge	%xcc,	%l3,	%o6
loop_723:
	fmovsge	%icc,	%f15,	%f26
	brlez,a	%o3,	loop_724
	movrlz	%o5,	0x163,	%g6
	tvs	%icc,	0x4
	edge32ln	%i0,	%i2,	%i6
loop_724:
	fmovdvc	%xcc,	%f1,	%f19
	wr	%g0,	0x11,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	sdivx	%l2,	0x1C13,	%l6
	wr	%g0,	0x89,	%asi
	ldsba	[%l7 + 0x08] %asi,	%i1
	alignaddrl	%g5,	%o4,	%i7
	tsubcc	%o1,	%l1,	%o2
	popc	0x1F06,	%o0
	bcs,a,pt	%icc,	loop_725
	fmovdgu	%xcc,	%f24,	%f0
	stb	%g4,	[%l7 + 0x36]
	fmovdneg	%xcc,	%f24,	%f31
loop_725:
	fornot2	%f0,	%f16,	%f14
	edge8	%g2,	%i4,	%g1
	fnegs	%f9,	%f23
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bpos	%xcc,	loop_726
	fmovsvc	%icc,	%f10,	%f24
	fmovrsne	%i3,	%f22,	%f29
	sll	%g3,	%l4,	%g7
loop_726:
	fmovsn	%icc,	%f28,	%f27
	edge8l	%l0,	%o7,	%l5
	movvc	%xcc,	%i5,	%l3
	tpos	%icc,	0x7
	edge32	%o3,	%o6,	%g6
	fmovscc	%icc,	%f28,	%f16
	array8	%o5,	%i2,	%i0
	addcc	%l2,	%l6,	%i6
	fpsub32	%f16,	%f28,	%f2
	movrgez	%i1,	%g5,	%i7
	smul	%o4,	0x17FA,	%l1
	tne	%icc,	0x0
	array8	%o1,	%o2,	%g4
	fcmpgt32	%f12,	%f24,	%o0
	bne,a	loop_727
	udivcc	%g2,	0x1D17,	%g1
	andcc	%i3,	0x1A99,	%i4
	fmuld8sux16	%f31,	%f29,	%f0
loop_727:
	fandnot2	%f20,	%f2,	%f16
	fbug,a	%fcc3,	loop_728
	movrgz	%l4,	0x03B,	%g7
	movne	%xcc,	%l0,	%o7
	movrlez	%l5,	0x2EF,	%i5
loop_728:
	taddcctv	%g3,	0x0D4E,	%o3
	edge32ln	%o6,	%g6,	%o5
	bg,a,pn	%xcc,	loop_729
	movle	%xcc,	%i2,	%i0
	movvc	%xcc,	%l2,	%l6
	movge	%xcc,	%i6,	%l3
loop_729:
	tcc	%xcc,	0x0
	tleu	%icc,	0x2
	fmovd	%f12,	%f20
	fmovsneg	%xcc,	%f24,	%f0
	movrlz	%g5,	0x186,	%i7
	subc	%i1,	%o4,	%l1
	movn	%icc,	%o1,	%o2
	ldx	[%l7 + 0x48],	%o0
	brgez,a	%g4,	loop_730
	umul	%g2,	%g1,	%i4
	tne	%xcc,	0x0
	fandnot2	%f18,	%f12,	%f24
loop_730:
	fmovdl	%xcc,	%f24,	%f11
	lduh	[%l7 + 0x74],	%i3
	fcmpes	%fcc1,	%f31,	%f20
	sdivx	%l4,	0x1F37,	%g7
	fbn,a	%fcc2,	loop_731
	sir	0x0B39
	movre	%l0,	%o7,	%i5
	fmovspos	%icc,	%f5,	%f26
loop_731:
	orcc	%l5,	%g3,	%o6
	subcc	%g6,	0x19FA,	%o5
	array16	%o3,	%i2,	%l2
	andcc	%i0,	%l6,	%i6
	mova	%icc,	%l3,	%g5
	edge8l	%i7,	%i1,	%l1
	fmovsneg	%xcc,	%f22,	%f7
	ldd	[%l7 + 0x68],	%o0
	fcmpne32	%f0,	%f0,	%o2
	fmovrslz	%o0,	%f16,	%f1
	swap	[%l7 + 0x20],	%g4
	srax	%o4,	0x0C,	%g2
	ldsw	[%l7 + 0x6C],	%g1
	fmul8x16al	%f0,	%f21,	%f20
	fxnor	%f0,	%f12,	%f18
	xnor	%i4,	0x0494,	%i3
	fpsub32	%f0,	%f14,	%f20
	bvc	%xcc,	loop_732
	sth	%l4,	[%l7 + 0x3A]
	fcmpes	%fcc1,	%f3,	%f1
	fmovrdlez	%g7,	%f30,	%f0
loop_732:
	fmovdn	%icc,	%f25,	%f19
	smul	%l0,	%o7,	%i5
	wr	%g0,	0x80,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	udivx	%g3,	0x03E9,	%o6
	fmovrdlez	%g6,	%f6,	%f22
	tneg	%icc,	0x7
	movvc	%icc,	%o5,	%o3
	fmovrsne	%l5,	%f17,	%f14
	array8	%i2,	%l2,	%l6
	edge8ln	%i0,	%l3,	%i6
	flush	%l7 + 0x58
	ldstub	[%l7 + 0x1C],	%g5
	fmovspos	%xcc,	%f13,	%f19
	tpos	%xcc,	0x4
	tge	%xcc,	0x5
	movge	%xcc,	%i1,	%i7
	fpadd16s	%f10,	%f24,	%f30
	sllx	%l1,	%o2,	%o1
	or	%o0,	0x0325,	%o4
	fmovdpos	%xcc,	%f13,	%f2
	movre	%g4,	0x178,	%g2
	stb	%g1,	[%l7 + 0x66]
	fpsub16	%f18,	%f0,	%f4
	tcs	%xcc,	0x6
	wr	%g0,	0x19,	%asi
	ldda	[%l7 + 0x30] %asi,	%i2
	array32	%l4,	%g7,	%i4
	fbu,a	%fcc3,	loop_733
	fcmpne16	%f14,	%f16,	%o7
	array8	%i5,	%g3,	%o6
	fbuge,a	%fcc0,	loop_734
loop_733:
	xor	%g6,	%o5,	%o3
	movle	%icc,	%l0,	%i2
	edge8ln	%l5,	%l6,	%i0
loop_734:
	mova	%icc,	%l3,	%i6
	fbo	%fcc2,	loop_735
	popc	%g5,	%i1
	fblg,a	%fcc3,	loop_736
	addcc	%i7,	0x09E0,	%l1
loop_735:
	array32	%l2,	%o1,	%o2
	or	%o4,	0x14E1,	%o0
loop_736:
	stw	%g2,	[%l7 + 0x34]
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
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrsne	%g4,	%f18,	%f26
	fmovsvs	%icc,	%f7,	%f31
	taddcctv	%g1,	0x01EB,	%i3
	andncc	%l4,	%g7,	%i4
	fbne,a	%fcc1,	loop_737
	fmovrsgz	%i5,	%f13,	%f14
	addccc	%o7,	0x00B4,	%g3
	tcs	%xcc,	0x4
loop_737:
	alignaddrl	%o6,	%g6,	%o5
	fpackfix	%f16,	%f21
	edge32	%o3,	%i2,	%l5
	ld	[%l7 + 0x18],	%f9
	fmuld8ulx16	%f22,	%f4,	%f18
	stw	%l6,	[%l7 + 0x0C]
	prefetch	[%l7 + 0x78],	 0x2
	edge16ln	%l0,	%i0,	%i6
	fcmple32	%f14,	%f16,	%g5
	tge	%xcc,	0x1
	brgez	%i1,	loop_738
	array32	%i7,	%l1,	%l2
	sub	%o1,	%l3,	%o2
	movneg	%xcc,	%o0,	%g2
loop_738:
	sll	%o4,	0x1D,	%g1
	std	%f24,	[%l7 + 0x70]
	fbge	%fcc2,	loop_739
	movrlz	%g4,	0x3EC,	%i3
	set	0x50, %l6
	prefetcha	[%l7 + %l6] 0x88,	 0x0
loop_739:
	taddcc	%l4,	0x14F1,	%i4
	fmovdvc	%xcc,	%f26,	%f17
	movleu	%icc,	%o7,	%g3
	fmovsvs	%xcc,	%f13,	%f0
	sdivcc	%i5,	0x0AF6,	%o6
	fnegs	%f6,	%f4
	nop
	setx loop_740, %l0, %l1
	jmpl %l1, %g6
	alignaddr	%o3,	%o5,	%l5
	movrlz	%l6,	0x3A4,	%l0
	fones	%f20
loop_740:
	subc	%i2,	0x171E,	%i6
	fpsub16	%f30,	%f6,	%f18
	and	%i0,	0x015B,	%i1
	fbn,a	%fcc3,	loop_741
	movleu	%icc,	%g5,	%l1
	fone	%f4
	fbge	%fcc0,	loop_742
loop_741:
	and	%i7,	%o1,	%l3
	bvc,a	%icc,	loop_743
	array32	%l2,	%o0,	%g2
loop_742:
	srax	%o2,	%o4,	%g1
	edge16ln	%g4,	%g7,	%l4
loop_743:
	fmuld8sux16	%f22,	%f24,	%f0
	call	loop_744
	fandnot2s	%f25,	%f26,	%f2
	fpadd32s	%f7,	%f10,	%f7
	xorcc	%i4,	0x05CA,	%i3
loop_744:
	std	%f6,	[%l7 + 0x78]
	xor	%o7,	0x06A3,	%i5
	array32	%o6,	%g6,	%g3
	xnorcc	%o5,	%o3,	%l6
	brnz,a	%l0,	loop_745
	ld	[%l7 + 0x60],	%f30
	movpos	%icc,	%l5,	%i2
	wr	%g0,	0x10,	%asi
	lduba	[%l7 + 0x2D] %asi,	%i0
loop_745:
	nop
	add	%l7,	0x40,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%i1
	casa	[%l6] %asi,	%i1,	%g5
	tvs	%xcc,	0x5
	smulcc	%i6,	%i7,	%o1
	tg	%xcc,	0x5
	fba,a	%fcc0,	loop_746
	tleu	%xcc,	0x1
	tcs	%icc,	0x7
	fand	%f4,	%f0,	%f4
loop_746:
	addc	%l1,	%l3,	%l2
	movne	%icc,	%o0,	%o2
	movneg	%xcc,	%g2,	%g1
	fmovdgu	%icc,	%f20,	%f1
	fmovscc	%xcc,	%f27,	%f17
	be	%xcc,	loop_747
	movrgez	%g4,	0x363,	%o4
	fbu,a	%fcc0,	loop_748
	be,pt	%icc,	loop_749
loop_747:
	edge32ln	%g7,	%i4,	%l4
	ldsh	[%l7 + 0x3C],	%o7
loop_748:
	taddcc	%i3,	%o6,	%i5
loop_749:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrsgez	%g3,	%f10,	%f14
	tvc	%icc,	0x4
	fexpand	%f16,	%f12
	tsubcctv	%g6,	%o5,	%o3
	array16	%l0,	%l5,	%i2
	sdivx	%l6,	0x06AE,	%i1
	movleu	%icc,	%g5,	%i0
	xnorcc	%i7,	%i6,	%o1
	or	%l1,	%l2,	%l3
	ta	%icc,	0x0
	edge32l	%o0,	%g2,	%g1
	fmovdvs	%xcc,	%f2,	%f11
	fmovdle	%icc,	%f20,	%f22
	or	%g4,	%o4,	%g7
	fmovsge	%xcc,	%f4,	%f19
	bgu,pt	%icc,	loop_750
	udivcc	%i4,	0x0B6F,	%o2
	fnot2	%f10,	%f6
	addccc	%l4,	%i3,	%o6
loop_750:
	for	%f20,	%f30,	%f4
	fbo	%fcc2,	loop_751
	xorcc	%o7,	0x0465,	%g3
	sll	%i5,	0x18,	%o5
	fones	%f19
loop_751:
	tge	%icc,	0x6
	edge32n	%o3,	%l0,	%l5
	movvs	%xcc,	%i2,	%l6
	edge16ln	%i1,	%g6,	%g5
	fble	%fcc2,	loop_752
	fmovs	%f18,	%f3
	tneg	%icc,	0x6
	fmovdn	%icc,	%f1,	%f29
loop_752:
	nop
	wr	%g0,	0x88,	%asi
	swapa	[%l7 + 0x10] %asi,	%i7
	sllx	%i6,	%i0,	%o1
	movge	%xcc,	%l1,	%l3
	swap	[%l7 + 0x64],	%l2
	brgz,a	%g2,	loop_753
	nop
	setx loop_754, %l0, %l1
	jmpl %l1, %o0
	fbu,a	%fcc2,	loop_755
	subcc	%g4,	%g1,	%g7
loop_753:
	sub	%i4,	%o2,	%o4
loop_754:
	fmovrdgz	%l4,	%f16,	%f24
loop_755:
	tleu	%xcc,	0x3
	movne	%xcc,	%i3,	%o6
	brgz	%g3,	loop_756
	xnorcc	%i5,	0x0EFB,	%o7
	movvc	%icc,	%o5,	%o3
	movvs	%xcc,	%l5,	%l0
loop_756:
	tpos	%icc,	0x7
	fmovdn	%icc,	%f6,	%f13
	ba,a,pt	%icc,	loop_757
	brlez	%l6,	loop_758
	fbge,a	%fcc2,	loop_759
	ld	[%l7 + 0x1C],	%f3
loop_757:
	bne	%xcc,	loop_760
loop_758:
	srlx	%i2,	%i1,	%g5
loop_759:
	fmovdge	%xcc,	%f8,	%f16
	fbge,a	%fcc3,	loop_761
loop_760:
	edge32n	%g6,	%i7,	%i0
	movrlez	%o1,	%l1,	%l3
	array8	%l2,	%g2,	%o0
loop_761:
	tneg	%icc,	0x4
	movpos	%xcc,	%i6,	%g4
	ta	%icc,	0x1
	tleu	%icc,	0x5
	movrgz	%g7,	%i4,	%o2
	andcc	%o4,	%l4,	%g1
	set	0x5F, %l0
	stba	%i3,	[%l7 + %l0] 0x2a
	membar	#Sync
	fba	%fcc3,	loop_762
	addcc	%g3,	%i5,	%o6
	udiv	%o7,	0x0D6F,	%o3
	tgu	%xcc,	0x3
loop_762:
	alignaddrl	%o5,	%l0,	%l6
	fmovsge	%xcc,	%f21,	%f6
	smulcc	%l5,	0x0681,	%i2
	wr	%g0,	0x89,	%asi
	stda	%g4,	[%l7 + 0x38] %asi
	tvs	%icc,	0x2
	mova	%icc,	%i1,	%g6
	set	0x08, %g7
	stxa	%i0,	[%l7 + %g7] 0x2b
	membar	#Sync
	taddcc	%i7,	0x0C97,	%l1
	orncc	%l3,	%o1,	%l2
	movrlez	%g2,	0x1E0,	%i6
	edge16ln	%g4,	%g7,	%i4
	popc	0x063A,	%o0
	fblg	%fcc0,	loop_763
	orncc	%o4,	0x108A,	%o2
	mulx	%l4,	0x059B,	%g1
	fsrc2s	%f2,	%f2
loop_763:
	ldsh	[%l7 + 0x28],	%g3
	tcc	%xcc,	0x5
	orn	%i3,	%i5,	%o6
	sllx	%o3,	%o5,	%o7
	brgez	%l6,	loop_764
	sll	%l0,	0x0A,	%l5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andcc	%i2,	%i1,	%g6
loop_764:
	fmul8ulx16	%f30,	%f18,	%f6
	movvc	%icc,	%g5,	%i0
	andcc	%i7,	0x0377,	%l1
	nop
	setx loop_765, %l0, %l1
	jmpl %l1, %l3
	sub	%l2,	0x16D5,	%g2
	tpos	%xcc,	0x6
	tge	%icc,	0x2
loop_765:
	or	%o1,	%g4,	%i6
	st	%f4,	[%l7 + 0x38]
	orn	%i4,	0x1D9D,	%o0
	fmovdvs	%icc,	%f5,	%f2
	fba,a	%fcc2,	loop_766
	movre	%g7,	0x35E,	%o2
	movl	%xcc,	%o4,	%l4
	movre	%g3,	%g1,	%i3
loop_766:
	fmul8x16	%f12,	%f26,	%f24
	tne	%icc,	0x4
	tle	%icc,	0x5
	tle	%xcc,	0x4
	andn	%i5,	%o3,	%o5
	movle	%xcc,	%o7,	%l6
	movpos	%xcc,	%l0,	%o6
	movn	%icc,	%l5,	%i1
	movvs	%icc,	%g6,	%g5
	mova	%xcc,	%i2,	%i0
	movg	%icc,	%i7,	%l1
	fabss	%f2,	%f17
	wr	%g0,	0x89,	%asi
	sta	%f26,	[%l7 + 0x40] %asi
	bg	loop_767
	fmovsleu	%xcc,	%f19,	%f14
	movrne	%l3,	%l2,	%o1
	tn	%icc,	0x3
loop_767:
	fandnot1	%f30,	%f18,	%f8
	udiv	%g2,	0x1EC4,	%g4
	wr	%g0,	0x04,	%asi
	lduwa	[%l7 + 0x2C] %asi,	%i4
	subccc	%i6,	%o0,	%o2
	bcs,pn	%xcc,	loop_768
	fxnor	%f24,	%f18,	%f4
	srax	%o4,	%l4,	%g3
	edge16	%g7,	%i3,	%i5
loop_768:
	bl,a,pn	%xcc,	loop_769
	edge8ln	%g1,	%o3,	%o5
	movrne	%l6,	0x077,	%o7
	fmovda	%xcc,	%f9,	%f12
loop_769:
	sdiv	%o6,	0x1CFA,	%l5
	mulscc	%l0,	%i1,	%g5
	tvs	%xcc,	0x7
	or	%i2,	%i0,	%g6
	fmovdneg	%icc,	%f26,	%f13
	sdivcc	%i7,	0x0D3B,	%l1
	sll	%l3,	%l2,	%g2
	tpos	%xcc,	0x7
	st	%f13,	[%l7 + 0x24]
	fmovdn	%xcc,	%f18,	%f9
	be,a,pn	%icc,	loop_770
	ldd	[%l7 + 0x38],	%f4
	orncc	%g4,	0x1455,	%o1
	movpos	%icc,	%i6,	%i4
loop_770:
	orn	%o2,	0x10B6,	%o4
	sir	0x048D
	tleu	%icc,	0x1
	tleu	%icc,	0x6
	udivx	%l4,	0x1D78,	%g3
	smul	%g7,	0x1AEF,	%o0
	fmovdl	%icc,	%f13,	%f21
	smulcc	%i3,	0x09B6,	%g1
	tcc	%icc,	0x5
	tneg	%xcc,	0x5
	movrlez	%o3,	0x0BE,	%o5
	edge16n	%i5,	%l6,	%o7
	tg	%icc,	0x3
	set	0x46, %l3
	ldsha	[%l7 + %l3] 0x0c,	%o6
	sth	%l5,	[%l7 + 0x60]
	movneg	%xcc,	%i1,	%l0
	tvs	%xcc,	0x3
	tle	%icc,	0x4
	wr	%g0,	0x18,	%asi
	ldswa	[%l7 + 0x40] %asi,	%g5
	bshuffle	%f26,	%f24,	%f30
	fabsd	%f6,	%f10
	fmovdn	%icc,	%f19,	%f11
	smul	%i2,	%g6,	%i7
	mulx	%l1,	%l3,	%i0
	sdiv	%l2,	0x16AF,	%g2
	tg	%xcc,	0x6
	ldd	[%l7 + 0x18],	%g4
	nop
	set	0x40, %g1
	stx	%i6,	[%l7 + %g1]
	tsubcc	%o1,	0x1DCC,	%i4
	ta	%icc,	0x4
	addcc	%o2,	%l4,	%g3
	sllx	%g7,	%o0,	%o4
	fbe,a	%fcc0,	loop_771
	fmuld8sux16	%f13,	%f15,	%f4
	brz	%g1,	loop_772
	tvc	%xcc,	0x1
loop_771:
	nop
	set	0x18, %i6
	stda	%o2,	[%l7 + %i6] 0xe3
	membar	#Sync
loop_772:
	array16	%i3,	%o5,	%l6
	brgez	%i5,	loop_773
	umulcc	%o7,	0x01F8,	%o6
	membar	0x0B
	movneg	%xcc,	%l5,	%i1
loop_773:
	ldub	[%l7 + 0x28],	%l0
	bg	%icc,	loop_774
	lduh	[%l7 + 0x16],	%g5
	tvc	%icc,	0x2
	movrgez	%g6,	0x293,	%i7
loop_774:
	fmovrslz	%i2,	%f10,	%f4
	movle	%xcc,	%l1,	%l3
	sub	%l2,	%g2,	%i0
	brgez	%i6,	loop_775
	fbug,a	%fcc1,	loop_776
	brnz,a	%g4,	loop_777
	movre	%o1,	%i4,	%l4
loop_775:
	array32	%o2,	%g3,	%g7
loop_776:
	fbule	%fcc1,	loop_778
loop_777:
	xnor	%o0,	%o4,	%g1
	bgu,pn	%icc,	loop_779
	fand	%f0,	%f8,	%f20
loop_778:
	movvc	%icc,	%o3,	%i3
	tsubcctv	%o5,	0x03AE,	%i5
loop_779:
	nop
	set	0x20, %i5
	ldda	[%l7 + %i5] 0x22,	%o6
	fmovsvc	%icc,	%f23,	%f23
	tgu	%icc,	0x4
	fmovrsgez	%l6,	%f17,	%f4
	bvc	loop_780
	brz	%o6,	loop_781
	tvs	%xcc,	0x4
	srlx	%l5,	%l0,	%i1
loop_780:
	edge16ln	%g6,	%g5,	%i2
loop_781:
	fbn	%fcc0,	loop_782
	fble	%fcc2,	loop_783
	srax	%i7,	0x08,	%l3
	fmul8sux16	%f10,	%f20,	%f18
loop_782:
	movrlz	%l2,	%g2,	%l1
loop_783:
	nop
	set	0x0C, %i2
	lduwa	[%l7 + %i2] 0x15,	%i0
	fandnot2s	%f20,	%f8,	%f14
	movre	%g4,	0x107,	%o1
	ldx	[%l7 + 0x10],	%i4
	fbue,a	%fcc2,	loop_784
	fornot1	%f26,	%f18,	%f2
	movrlz	%l4,	0x315,	%i6
	sllx	%o2,	0x1F,	%g3
loop_784:
	xor	%g7,	0x1C5F,	%o4
	sdivx	%o0,	0x17A2,	%o3
	movne	%icc,	%g1,	%o5
	bgu,pn	%icc,	loop_785
	tcs	%xcc,	0x5
	subcc	%i3,	%o7,	%l6
	taddcctv	%o6,	%l5,	%l0
loop_785:
	fmovrsgz	%i5,	%f13,	%f4
	fcmpeq32	%f0,	%f4,	%i1
	fbl	%fcc1,	loop_786
	movvs	%xcc,	%g6,	%g5
	tle	%icc,	0x3
	movl	%icc,	%i2,	%i7
loop_786:
	edge16ln	%l3,	%g2,	%l1
	tsubcc	%l2,	%i0,	%o1
	taddcc	%i4,	0x1D0F,	%g4
	nop
	set	0x6E, %l1
	lduh	[%l7 + %l1],	%i6
	fcmpd	%fcc3,	%f20,	%f18
	fbne,a	%fcc3,	loop_787
	prefetch	[%l7 + 0x34],	 0x0
	wr	%g0,	0x18,	%asi
	sta	%f18,	[%l7 + 0x08] %asi
loop_787:
	ldsh	[%l7 + 0x44],	%l4
	orn	%o2,	%g3,	%o4
	fbn,a	%fcc1,	loop_788
	movrgez	%o0,	0x3AD,	%g7
	udivx	%g1,	0x12E5,	%o5
	srl	%i3,	%o7,	%o3
loop_788:
	stx	%o6,	[%l7 + 0x28]
	mulx	%l6,	0x0A1C,	%l0
	fmovdpos	%icc,	%f6,	%f10
	fbuge,a	%fcc3,	loop_789
	udiv	%i5,	0x115B,	%i1
	sdivcc	%l5,	0x141F,	%g6
	popc	0x05A3,	%g5
loop_789:
	prefetch	[%l7 + 0x4C],	 0x2
	movrlez	%i2,	%l3,	%i7
	fabss	%f13,	%f3
	udivx	%g2,	0x1252,	%l2
	ldstub	[%l7 + 0x15],	%l1
	fbug,a	%fcc3,	loop_790
	fmuld8ulx16	%f5,	%f7,	%f20
	tge	%xcc,	0x4
	movgu	%xcc,	%i0,	%i4
loop_790:
	std	%g4,	[%l7 + 0x28]
	fmovd	%f22,	%f10
	mulx	%o1,	%l4,	%o2
	fnors	%f25,	%f24,	%f31
	fcmpd	%fcc2,	%f6,	%f22
	tpos	%icc,	0x2
	and	%i6,	%o4,	%g3
	bg,a,pn	%xcc,	loop_791
	movcc	%icc,	%o0,	%g7
	bne,a	%xcc,	loop_792
	ldsb	[%l7 + 0x68],	%o5
loop_791:
	fandnot2	%f6,	%f10,	%f22
	edge32n	%i3,	%g1,	%o3
loop_792:
	tle	%icc,	0x7
	ldub	[%l7 + 0x40],	%o7
	nop
	setx	loop_793,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	bg,a	loop_794
	tsubcc	%l6,	0x0EA8,	%l0
	tpos	%xcc,	0x4
loop_793:
	movpos	%xcc,	%i5,	%o6
loop_794:
	array8	%i1,	%l5,	%g6
	fpack16	%f12,	%f19
	subcc	%i2,	0x0D8A,	%l3
	bl	loop_795
	tl	%xcc,	0x3
	smulcc	%i7,	%g5,	%g2
	umul	%l2,	0x0FE3,	%l1
loop_795:
	fnot2s	%f25,	%f28
	fbne	%fcc0,	loop_796
	movpos	%xcc,	%i4,	%i0
	wr	%g0,	0x19,	%asi
	ldsba	[%l7 + 0x47] %asi,	%o1
loop_796:
	alignaddr	%l4,	%o2,	%i6
	set	0x78, %o7
	stda	%o4,	[%l7 + %o7] 0x2f
	membar	#Sync
	fbn,a	%fcc1,	loop_797
	fnors	%f19,	%f0,	%f7
	umulcc	%g3,	%g4,	%o0
	fmovsn	%xcc,	%f31,	%f27
loop_797:
	movgu	%icc,	%g7,	%o5
	umulcc	%i3,	0x1E77,	%g1
	umul	%o3,	%l6,	%o7
	umul	%i5,	0x0A64,	%l0
	fmovdcc	%xcc,	%f10,	%f21
	fble	%fcc0,	loop_798
	sdivcc	%o6,	0x1AD9,	%l5
	bge,a,pt	%xcc,	loop_799
	fbug	%fcc2,	loop_800
loop_798:
	brlz,a	%i1,	loop_801
	fcmpeq32	%f12,	%f10,	%g6
loop_799:
	movpos	%icc,	%i2,	%l3
loop_800:
	movrgez	%i7,	0x3F1,	%g5
loop_801:
	tge	%xcc,	0x7
	sir	0x13BB
	fble,a	%fcc2,	loop_802
	fmovsa	%icc,	%f11,	%f18
	andn	%l2,	%l1,	%g2
	nop
	set	0x74, %o5
	lduw	[%l7 + %o5],	%i0
loop_802:
	nop
	wr	%g0,	0x89,	%asi
	stha	%o1,	[%l7 + 0x0E] %asi
	alignaddrl	%l4,	%o2,	%i4
	sethi	0x1652,	%i6
	bl,a	loop_803
	stbar
	tne	%xcc,	0x2
	movvc	%xcc,	%o4,	%g4
loop_803:
	tcs	%icc,	0x6
	sllx	%o0,	0x0D,	%g7
	fbn,a	%fcc0,	loop_804
	movrlez	%o5,	%i3,	%g1
	addccc	%g3,	0x10C7,	%l6
	ble,a,pn	%xcc,	loop_805
loop_804:
	sll	%o3,	0x0E,	%o7
	alignaddrl	%l0,	%o6,	%i5
	bge,pn	%xcc,	loop_806
loop_805:
	fbn	%fcc3,	loop_807
	movrlz	%l5,	0x075,	%i1
	or	%i2,	%g6,	%i7
loop_806:
	lduh	[%l7 + 0x24],	%l3
loop_807:
	tneg	%xcc,	0x5
	sir	0x1FAB
	fmovd	%f20,	%f30
	edge32ln	%l2,	%l1,	%g5
	ldd	[%l7 + 0x68],	%i0
	brgez	%o1,	loop_808
	edge32n	%g2,	%l4,	%i4
	bpos,a,pn	%icc,	loop_809
	subcc	%o2,	%i6,	%o4
loop_808:
	fmovsne	%icc,	%f21,	%f30
	for	%f24,	%f8,	%f16
loop_809:
	ld	[%l7 + 0x14],	%f28
	set	0x6A, %o0
	lduha	[%l7 + %o0] 0x19,	%g4
	fpack16	%f20,	%f10
	bleu,a,pt	%icc,	loop_810
	sllx	%o0,	%o5,	%i3
	tge	%icc,	0x6
	fmovrslz	%g1,	%f12,	%f7
loop_810:
	fbe	%fcc3,	loop_811
	movle	%xcc,	%g7,	%l6
	bvs,a,pn	%xcc,	loop_812
	fbug	%fcc2,	loop_813
loop_811:
	fmovdvs	%xcc,	%f26,	%f15
	subcc	%o3,	0x0CC4,	%g3
loop_812:
	sdiv	%l0,	0x0216,	%o7
loop_813:
	movcc	%icc,	%o6,	%i5
	ldsh	[%l7 + 0x08],	%l5
	bne,a	loop_814
	fzeros	%f20
	sllx	%i1,	0x18,	%g6
	movn	%xcc,	%i7,	%i2
loop_814:
	fnot1s	%f18,	%f29
	fcmple32	%f18,	%f2,	%l3
	movl	%xcc,	%l2,	%l1
	brlz	%g5,	loop_815
	bl	%icc,	loop_816
	fcmpd	%fcc2,	%f26,	%f26
	fmovdgu	%xcc,	%f26,	%f14
loop_815:
	bn	loop_817
loop_816:
	bcc,pt	%xcc,	loop_818
	edge8	%o1,	%i0,	%l4
	fandnot2	%f2,	%f22,	%f4
loop_817:
	smul	%i4,	0x0C2E,	%o2
loop_818:
	bvc,a	loop_819
	fmovrde	%i6,	%f6,	%f20
	fbne	%fcc3,	loop_820
	xorcc	%o4,	0x0D74,	%g2
loop_819:
	udiv	%g4,	0x08AA,	%o5
	movleu	%icc,	%i3,	%g1
loop_820:
	fxor	%f20,	%f22,	%f28
	fpadd32	%f4,	%f2,	%f24
	ta	%icc,	0x6
	lduh	[%l7 + 0x58],	%g7
	xnor	%o0,	0x1468,	%o3
	set	0x60, %o3
	ldxa	[%l7 + %o3] 0x80,	%g3
	wr	%g0,	0x89,	%asi
	sta	%f10,	[%l7 + 0x54] %asi
	popc	0x04EA,	%l6
	tge	%icc,	0x4
	fbn	%fcc0,	loop_821
	nop
	setx	loop_822,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	sllx	%o7,	0x0D,	%o6
	fbe,a	%fcc3,	loop_823
loop_821:
	fxnors	%f19,	%f28,	%f0
loop_822:
	xor	%i5,	%l5,	%i1
	bvc,a,pn	%xcc,	loop_824
loop_823:
	fmovscc	%icc,	%f10,	%f20
	fcmpes	%fcc2,	%f6,	%f13
	srlx	%l0,	%i7,	%i2
loop_824:
	ba,pn	%xcc,	loop_825
	xorcc	%g6,	0x1B44,	%l3
	subcc	%l2,	0x1DF6,	%g5
	tsubcc	%o1,	0x071D,	%l1
loop_825:
	tcs	%icc,	0x3
	addccc	%i0,	%l4,	%i4
	movleu	%xcc,	%o2,	%o4
	set	0x10, %o4
	lda	[%l7 + %o4] 0x18,	%f31
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	setx	loop_826,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	subcc	%g2,	0x11C0,	%i6
	xnorcc	%g4,	%i3,	%g1
	fsrc1s	%f2,	%f15
loop_826:
	popc	0x0F74,	%o5
	tg	%icc,	0x4
	movrlez	%g7,	0x2C3,	%o3
	brgez	%g3,	loop_827
	fmovrdgz	%l6,	%f6,	%f28
	movrgz	%o0,	0x14F,	%o7
	taddcctv	%i5,	%l5,	%i1
loop_827:
	fmovdn	%icc,	%f26,	%f0
	brlez	%l0,	loop_828
	movrlez	%i7,	%o6,	%i2
	tcs	%xcc,	0x7
	addcc	%l3,	0x1A66,	%g6
loop_828:
	udivx	%l2,	0x0FA9,	%o1
	fandnot2s	%f22,	%f26,	%f11
	membar	0x57
	movrlez	%l1,	0x2C5,	%g5
	tcs	%icc,	0x1
	sdivcc	%i0,	0x1F5E,	%i4
	set	0x28, %i0
	stxa	%l4,	[%l7 + %i0] 0x10
	umul	%o4,	0x0733,	%o2
	movcc	%icc,	%g2,	%g4
	tl	%xcc,	0x5
	add	%l7,	0x08,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%i3
	casa	[%l6] %asi,	%i3,	%i6
	subc	%g1,	%o5,	%o3
	ldsw	[%l7 + 0x38],	%g7
	bvs	loop_829
	bge,a	loop_830
	fbo	%fcc1,	loop_831
	tsubcctv	%l6,	%o0,	%g3
loop_829:
	add	%o7,	%l5,	%i5
loop_830:
	sdiv	%i1,	0x0D05,	%i7
loop_831:
	sdiv	%l0,	0x0695,	%i2
	movrgz	%o6,	%g6,	%l3
	bge,a	loop_832
	movrlz	%o1,	%l2,	%l1
	membar	0x26
	movvc	%icc,	%g5,	%i0
loop_832:
	ldstub	[%l7 + 0x3B],	%i4
	tge	%xcc,	0x5
	fmuld8ulx16	%f16,	%f31,	%f24
	movrne	%l4,	0x3E1,	%o4
	sllx	%g2,	0x00,	%g4
	fmuld8ulx16	%f7,	%f24,	%f22
	fmovse	%icc,	%f3,	%f27
	fmovrslez	%o2,	%f22,	%f23
	sll	%i3,	%g1,	%i6
	fcmple32	%f22,	%f30,	%o3
	wr	%g0,	0x81,	%asi
	sta	%f14,	[%l7 + 0x68] %asi
	bge,a,pt	%icc,	loop_833
	sir	0x0364
	array8	%o5,	%l6,	%g7
	bne,pn	%xcc,	loop_834
loop_833:
	bn,a,pn	%icc,	loop_835
	fmul8x16au	%f22,	%f14,	%f0
	movrlez	%o0,	0x287,	%o7
loop_834:
	fmovsvs	%icc,	%f14,	%f11
loop_835:
	nop
	set	0x52, %l5
	stha	%g3,	[%l7 + %l5] 0x04
	tneg	%icc,	0x5
	taddcc	%i5,	%i1,	%l5
	fone	%f22
	fmovdvc	%icc,	%f15,	%f18
	fbe,a	%fcc0,	loop_836
	fbug	%fcc2,	loop_837
	mova	%xcc,	%l0,	%i2
	fmovspos	%xcc,	%f23,	%f26
loop_836:
	andn	%i7,	%o6,	%l3
loop_837:
	fbge,a	%fcc1,	loop_838
	fbne,a	%fcc0,	loop_839
	sub	%g6,	%l2,	%l1
	andncc	%g5,	%o1,	%i0
loop_838:
	array32	%i4,	%o4,	%g2
loop_839:
	subcc	%l4,	%o2,	%g4
	bg,pt	%icc,	loop_840
	ba,a,pn	%icc,	loop_841
	movn	%icc,	%i3,	%g1
	sra	%i6,	0x07,	%o5
loop_840:
	orncc	%l6,	%g7,	%o3
loop_841:
	addccc	%o0,	%g3,	%o7
	wr	%g0,	0x18,	%asi
	ldswa	[%l7 + 0x70] %asi,	%i5
	tle	%icc,	0x3
	fmovrsgez	%l5,	%f16,	%f19
	tneg	%xcc,	0x3
	membar	0x54
	fsrc2	%f10,	%f4
	fmovsa	%xcc,	%f0,	%f15
	flush	%l7 + 0x78
	ta	%xcc,	0x0
	nop
	setx	loop_842,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fmovdcc	%icc,	%f2,	%f1
	fmovs	%f11,	%f2
	udiv	%i1,	0x0289,	%l0
loop_842:
	sdiv	%i7,	0x083C,	%o6
	srl	%l3,	0x19,	%g6
	add	%i2,	%l1,	%l2
	tg	%icc,	0x0
	nop
	set	0x20, %g5
	ldstub	[%l7 + %g5],	%g5
	siam	0x7
	fmovsvs	%icc,	%f17,	%f12
	fbug,a	%fcc1,	loop_843
	fmovdcs	%xcc,	%f4,	%f15
	fmuld8ulx16	%f29,	%f25,	%f2
	set	0x38, %g3
	stha	%i0,	[%l7 + %g3] 0xe3
	membar	#Sync
loop_843:
	fbg	%fcc0,	loop_844
	movneg	%icc,	%i4,	%o1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sethi	0x0709,	%o4
loop_844:
	xnor	%g2,	%l4,	%g4
	movgu	%icc,	%o2,	%i3
	sllx	%g1,	0x14,	%o5
	udivcc	%l6,	0x1805,	%g7
	edge32n	%i6,	%o0,	%g3
	movg	%xcc,	%o3,	%o7
	fmovsg	%xcc,	%f17,	%f23
	bg,a,pn	%icc,	loop_845
	movn	%xcc,	%i5,	%i1
	edge8n	%l0,	%l5,	%i7
	movge	%icc,	%l3,	%g6
loop_845:
	fpackfix	%f10,	%f27
	bleu,a,pn	%xcc,	loop_846
	srlx	%i2,	%l1,	%l2
	orn	%g5,	%i0,	%i4
	fabss	%f18,	%f8
loop_846:
	nop
	set	0x70, %g2
	std	%o6,	[%l7 + %g2]
	movleu	%icc,	%o1,	%g2
	lduh	[%l7 + 0x58],	%l4
	smulcc	%g4,	0x1FFC,	%o4
	array16	%o2,	%g1,	%o5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x2a,	%asi
	stha	%l6,	[%l7 + 0x22] %asi
	membar	#Sync
	tleu	%xcc,	0x5
	call	loop_847
	brgz,a	%i3,	loop_848
	fmovscc	%icc,	%f11,	%f27
	movg	%xcc,	%g7,	%o0
loop_847:
	movne	%xcc,	%g3,	%o3
loop_848:
	array32	%o7,	%i5,	%i6
	edge16	%l0,	%i1,	%i7
	movn	%xcc,	%l3,	%g6
	tvc	%xcc,	0x5
	bge	%icc,	loop_849
	fpsub32	%f6,	%f16,	%f6
	wr	%g0,	0xe2,	%asi
	stda	%i2,	[%l7 + 0x38] %asi
	membar	#Sync
loop_849:
	and	%l1,	%l5,	%l2
	bvc,pt	%icc,	loop_850
	fmovrse	%i0,	%f22,	%f9
	fpmerge	%f0,	%f14,	%f14
	wr	%g0,	0x10,	%asi
	lda	[%l7 + 0x38] %asi,	%f11
loop_850:
	addccc	%i4,	%g5,	%o6
	umulcc	%o1,	0x061F,	%l4
	array32	%g4,	%o4,	%g2
	tleu	%xcc,	0x4
	swap	[%l7 + 0x2C],	%g1
	prefetch	[%l7 + 0x74],	 0x1
	brgez	%o2,	loop_851
	fmovde	%icc,	%f22,	%f20
	orcc	%l6,	%i3,	%g7
	addc	%o0,	%g3,	%o3
loop_851:
	std	%o4,	[%l7 + 0x38]
	tle	%xcc,	0x3
	tge	%xcc,	0x0
	movgu	%xcc,	%o7,	%i6
	smulcc	%l0,	0x15BB,	%i1
	wr	%g0,	0x04,	%asi
	swapa	[%l7 + 0x54] %asi,	%i5
	tvs	%xcc,	0x0
	movpos	%xcc,	%i7,	%g6
	bge,pt	%xcc,	loop_852
	brgz	%l3,	loop_853
	srax	%i2,	%l1,	%l2
	fmovdleu	%icc,	%f28,	%f13
loop_852:
	fxnors	%f6,	%f1,	%f0
loop_853:
	xnorcc	%i0,	%l5,	%g5
	fands	%f23,	%f0,	%f20
	sdiv	%o6,	0x0F87,	%i4
	fbule,a	%fcc1,	loop_854
	fbule	%fcc1,	loop_855
	fbge,a	%fcc2,	loop_856
	movgu	%icc,	%l4,	%o1
loop_854:
	sdivx	%o4,	0x0108,	%g4
loop_855:
	stw	%g1,	[%l7 + 0x18]
loop_856:
	tl	%icc,	0x6
	fandnot1	%f20,	%f2,	%f18
	wr	%g0,	0x11,	%asi
	sta	%f5,	[%l7 + 0x38] %asi
	tne	%xcc,	0x1
	fbg	%fcc2,	loop_857
	bcc	loop_858
	movrne	%o2,	0x307,	%g2
	nop
	setx loop_859, %l0, %l1
	jmpl %l1, %i3
loop_857:
	and	%g7,	%l6,	%g3
loop_858:
	fmovrslz	%o3,	%f20,	%f12
	mulscc	%o0,	0x0BC7,	%o7
loop_859:
	std	%f24,	[%l7 + 0x20]
	set	0x6E, %l4
	ldstuba	[%l7 + %l4] 0x18,	%o5
	sllx	%l0,	0x1D,	%i6
	tpos	%xcc,	0x4
	subcc	%i1,	0x04BF,	%i7
	bne,pn	%icc,	loop_860
	edge16	%g6,	%l3,	%i5
	movcs	%xcc,	%l1,	%i2
	andcc	%i0,	0x1C97,	%l5
loop_860:
	umulcc	%l2,	%g5,	%i4
	fnot1	%f16,	%f6
	tvs	%xcc,	0x1
	subccc	%o6,	0x1960,	%o1
	sethi	0x0A39,	%l4
	or	%g4,	%g1,	%o2
	edge32n	%o4,	%i3,	%g7
	fmovspos	%xcc,	%f19,	%f21
	call	loop_861
	ldd	[%l7 + 0x50],	%i6
	bg,a	%icc,	loop_862
	fnands	%f24,	%f10,	%f7
loop_861:
	srlx	%g2,	%o3,	%g3
	fmovspos	%xcc,	%f9,	%f7
loop_862:
	bl	loop_863
	mulx	%o0,	0x029A,	%o7
	tge	%xcc,	0x1
	alignaddrl	%o5,	%i6,	%l0
loop_863:
	sra	%i1,	%i7,	%l3
	sethi	0x16A1,	%i5
	addcc	%g6,	%i2,	%l1
	fmovrdgez	%i0,	%f28,	%f6
	movge	%icc,	%l5,	%g5
	fmovsle	%xcc,	%f30,	%f0
	popc	%l2,	%o6
	taddcctv	%o1,	0x1523,	%l4
	movrlz	%i4,	0x367,	%g1
	taddcc	%o2,	0x03A6,	%g4
	ldsw	[%l7 + 0x14],	%i3
	movneg	%xcc,	%g7,	%l6
	fbul,a	%fcc0,	loop_864
	std	%f22,	[%l7 + 0x30]
	movle	%icc,	%o4,	%o3
	umulcc	%g2,	%o0,	%o7
loop_864:
	tsubcc	%o5,	0x0A31,	%i6
	wr	%g0,	0x1e,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
	array8	%l0,	%i1,	%g3
	orcc	%l3,	%i7,	%g6
	mulx	%i2,	%l1,	%i5
	fmovdge	%icc,	%f13,	%f3
	add	%i0,	0x0C86,	%l5
	fmovsvc	%icc,	%f14,	%f19
	subcc	%l2,	%g5,	%o6
	set	0x68, %i4
	prefetcha	[%l7 + %i4] 0x81,	 0x3
	xorcc	%l4,	%i4,	%g1
	st	%f26,	[%l7 + 0x18]
	fble	%fcc2,	loop_865
	addc	%g4,	%i3,	%o2
	tvs	%icc,	0x3
	subccc	%l6,	%o4,	%g7
loop_865:
	ta	%icc,	0x2
	edge16n	%o3,	%o0,	%g2
	nop
	setx	loop_866,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fbg	%fcc3,	loop_867
	movneg	%xcc,	%o5,	%o7
	edge32n	%l0,	%i6,	%g3
loop_866:
	movn	%icc,	%l3,	%i1
loop_867:
	ldsh	[%l7 + 0x66],	%i7
	addcc	%g6,	0x0EDE,	%l1
	sir	0x15FD
	wr	%g0,	0x0c,	%asi
	swapa	[%l7 + 0x1C] %asi,	%i5
	tne	%icc,	0x0
	set	0x18, %g4
	ldxa	[%l7 + %g4] 0x80,	%i0
	add	%l5,	0x118D,	%l2
	ldsb	[%l7 + 0x1D],	%g5
	subcc	%i2,	0x1C8B,	%o1
	edge8ln	%o6,	%i4,	%l4
	move	%xcc,	%g4,	%g1
	fmovsvc	%icc,	%f10,	%f19
	popc	0x17CA,	%o2
	or	%i3,	0x1A53,	%o4
	sethi	0x1C70,	%l6
	fpack32	%f4,	%f30,	%f30
	movvs	%xcc,	%g7,	%o3
	set	0x09, %i3
	lduba	[%l7 + %i3] 0x89,	%g2
	fmovdneg	%icc,	%f28,	%f6
	fblg	%fcc3,	loop_868
	movrgz	%o0,	0x1E7,	%o5
	srlx	%l0,	0x09,	%i6
	bg,a,pt	%icc,	loop_869
loop_868:
	movre	%g3,	0x3B4,	%l3
	edge32	%i1,	%o7,	%g6
	ldub	[%l7 + 0x14],	%i7
loop_869:
	andcc	%l1,	%i0,	%l5
	fxnor	%f0,	%f24,	%f16
	bleu,a	%icc,	loop_870
	faligndata	%f16,	%f30,	%f22
	tge	%icc,	0x0
	tvc	%xcc,	0x7
loop_870:
	edge32ln	%l2,	%i5,	%g5
	fmovrsgz	%i2,	%f9,	%f14
	movg	%xcc,	%o1,	%o6
	edge16n	%l4,	%g4,	%g1
	tgu	%icc,	0x5
	fzeros	%f18
	xorcc	%o2,	0x1457,	%i4
	umul	%i3,	0x079A,	%o4
	popc	%l6,	%g7
	set	0x10, %i7
	ldswa	[%l7 + %i7] 0x14,	%o3
	fbge	%fcc2,	loop_871
	fcmpd	%fcc3,	%f26,	%f14
	movn	%icc,	%o0,	%g2
	fzeros	%f24
loop_871:
	movge	%xcc,	%l0,	%i6
	orn	%g3,	%o5,	%i1
	movrgez	%l3,	0x053,	%g6
	udiv	%o7,	0x19E6,	%l1
	movle	%icc,	%i7,	%l5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tneg	%xcc,	0x6
	fnegs	%f15,	%f27
	tneg	%xcc,	0x6
	brgez	%l2,	loop_872
	andncc	%i5,	%i0,	%i2
	movneg	%icc,	%g5,	%o1
	movl	%icc,	%l4,	%g4
loop_872:
	subcc	%o6,	%o2,	%g1
	wr	%g0,	0x11,	%asi
	ldsha	[%l7 + 0x4C] %asi,	%i4
	tsubcc	%i3,	%o4,	%g7
	fmovrde	%l6,	%f30,	%f6
	fmovsg	%icc,	%f25,	%f20
	fmovdvc	%xcc,	%f5,	%f4
	bneg,a	%icc,	loop_873
	fbne,a	%fcc0,	loop_874
	addcc	%o3,	0x173D,	%o0
	fmovdge	%xcc,	%f23,	%f2
loop_873:
	tcs	%icc,	0x4
loop_874:
	movleu	%xcc,	%l0,	%g2
	edge8l	%i6,	%o5,	%i1
	udivx	%g3,	0x03DF,	%g6
	fmovrse	%l3,	%f19,	%f6
	edge8l	%o7,	%l1,	%l5
	alignaddr	%i7,	%l2,	%i5
	movn	%xcc,	%i2,	%g5
	fbu,a	%fcc1,	loop_875
	brlz,a	%o1,	loop_876
	sll	%l4,	%i0,	%o6
	tpos	%icc,	0x1
loop_875:
	edge16n	%o2,	%g1,	%i4
loop_876:
	movcs	%icc,	%i3,	%g4
	add	%l7,	0x20,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%o4
	casxa	[%l6] %asi,	%o4,	%g7
	movrlez	%l6,	%o3,	%l0
	stw	%o0,	[%l7 + 0x38]
	tl	%xcc,	0x4
	fmovdle	%icc,	%f16,	%f24
	ldstub	[%l7 + 0x7A],	%g2
	ta	%xcc,	0x5
	sra	%i6,	%o5,	%g3
	movcs	%icc,	%i1,	%l3
	fbuge	%fcc1,	loop_877
	subc	%o7,	%l1,	%l5
	movge	%xcc,	%i7,	%l2
	and	%g6,	%i5,	%i2
loop_877:
	fcmpeq16	%f28,	%f12,	%g5
	alignaddrl	%l4,	%i0,	%o6
	edge16n	%o2,	%g1,	%i4
	srax	%i3,	%g4,	%o1
	movrne	%o4,	0x294,	%l6
	movleu	%xcc,	%g7,	%l0
	subcc	%o3,	0x090D,	%g2
	fbge	%fcc3,	loop_878
	movrlz	%i6,	0x2EC,	%o5
	umulcc	%o0,	%g3,	%l3
	wr	%g0,	0x2a,	%asi
	stda	%o6,	[%l7 + 0x28] %asi
	membar	#Sync
loop_878:
	alignaddr	%l1,	%i1,	%l5
	fxors	%f26,	%f31,	%f6
	fxnor	%f18,	%f30,	%f12
	mova	%icc,	%l2,	%g6
	wr	%g0,	0x23,	%asi
	stxa	%i5,	[%l7 + 0x70] %asi
	membar	#Sync
	tsubcc	%i7,	%g5,	%i2
	bne,a,pn	%icc,	loop_879
	fbul	%fcc1,	loop_880
	te	%icc,	0x4
	bleu	%icc,	loop_881
loop_879:
	tpos	%xcc,	0x2
loop_880:
	sub	%l4,	0x1453,	%o6
	subcc	%o2,	%g1,	%i0
loop_881:
	movre	%i4,	0x233,	%g4
	fpsub32s	%f8,	%f4,	%f7
	fmovrsgz	%o1,	%f29,	%f30
	membar	0x0D
	ldsb	[%l7 + 0x0F],	%i3
	bgu,a,pn	%xcc,	loop_882
	ldsw	[%l7 + 0x68],	%o4
	xnorcc	%l6,	%g7,	%o3
	orcc	%l0,	%g2,	%o5
loop_882:
	bneg,a,pn	%xcc,	loop_883
	fmovdleu	%icc,	%f9,	%f8
	add	%i6,	%g3,	%l3
	tsubcc	%o7,	0x0DDB,	%o0
loop_883:
	nop
	setx loop_884, %l0, %l1
	jmpl %l1, %i1
	fbul	%fcc0,	loop_885
	edge32n	%l5,	%l1,	%l2
	bl,pt	%icc,	loop_886
loop_884:
	brgz	%g6,	loop_887
loop_885:
	movrgez	%i5,	0x18F,	%i7
	xnorcc	%i2,	%g5,	%o6
loop_886:
	bge,a	%icc,	loop_888
loop_887:
	sll	%o2,	%l4,	%g1
	stw	%i4,	[%l7 + 0x0C]
	movpos	%icc,	%i0,	%o1
loop_888:
	fpadd16	%f10,	%f2,	%f30
	brlz,a	%i3,	loop_889
	tne	%icc,	0x4
	fmovdcc	%xcc,	%f7,	%f4
	sdivcc	%g4,	0x0C74,	%o4
loop_889:
	sdivx	%g7,	0x13D1,	%l6
	edge16n	%l0,	%o3,	%o5
	ble,pn	%icc,	loop_890
	bvc,a,pt	%icc,	loop_891
	bvs	loop_892
	tge	%icc,	0x4
loop_890:
	orncc	%g2,	0x1B94,	%g3
loop_891:
	fxor	%f0,	%f18,	%f22
loop_892:
	fpsub32s	%f17,	%f11,	%f8
	wr	%g0,	0xea,	%asi
	stha	%i6,	[%l7 + 0x1C] %asi
	membar	#Sync
	alignaddrl	%l3,	%o0,	%i1
	add	%l7,	0x34,	%l6
	wr	%g0,	0x18,	%asi
	lda	[%l6] %asi,	%o7
	casa	[%l6] 0x18,	%o7,	%l1
	orncc	%l2,	0x09C8,	%l5
	sir	0x03FD
	fbne	%fcc3,	loop_893
	fpadd16s	%f10,	%f9,	%f11
	fcmpes	%fcc0,	%f1,	%f27
	add	%g6,	%i7,	%i5
loop_893:
	andncc	%g5,	%o6,	%i2
	srl	%o2,	%g1,	%l4
	taddcc	%i0,	%i4,	%i3
	fnot2	%f4,	%f26
	wr	%g0,	0x17,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
	orncc	%o1,	0x0372,	%g4
	bg,a,pt	%xcc,	loop_894
	mova	%xcc,	%o4,	%l6
	movpos	%icc,	%g7,	%o3
	bshuffle	%f28,	%f14,	%f18
loop_894:
	bgu,pt	%xcc,	loop_895
	umulcc	%o5,	0x0A5D,	%l0
	stw	%g2,	[%l7 + 0x5C]
	sll	%i6,	0x16,	%l3
loop_895:
	nop
	set	0x30, %o1
	lduwa	[%l7 + %o1] 0x14,	%g3
	ta	%xcc,	0x1
	fcmple16	%f14,	%f6,	%o0
	fand	%f18,	%f14,	%f22
	array8	%i1,	%o7,	%l2
	movrlez	%l5,	%g6,	%l1
	tgu	%icc,	0x3
	movrgez	%i5,	0x38A,	%i7
	movrne	%g5,	0x2EF,	%i2
	edge16l	%o2,	%g1,	%o6
	set	0x4C, %o6
	lda	[%l7 + %o6] 0x0c,	%f5
	array32	%i0,	%l4,	%i4
	ldd	[%l7 + 0x50],	%o0
	array8	%i3,	%o4,	%g4
	ldub	[%l7 + 0x48],	%g7
	edge8n	%o3,	%o5,	%l6
	fbo,a	%fcc0,	loop_896
	srlx	%g2,	0x05,	%l0
	fba	%fcc3,	loop_897
	tpos	%xcc,	0x5
loop_896:
	fcmped	%fcc2,	%f18,	%f6
	or	%l3,	%g3,	%o0
loop_897:
	edge16n	%i1,	%o7,	%i6
	fnand	%f24,	%f6,	%f24
	siam	0x2
	fcmpd	%fcc2,	%f20,	%f24
	movrgz	%l2,	0x0FC,	%l5
	add	%l7,	0x58,	%l6
	wr	%g0,	0x19,	%asi
	ldxa	[%l6] %asi,	%l1
	casxa	[%l6] 0x19,	%l1,	%i5
	movrgz	%i7,	0x095,	%g6
	xnorcc	%g5,	%o2,	%g1
	nop
	setx	loop_898,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fmovdneg	%icc,	%f29,	%f5
	or	%o6,	%i0,	%i2
	fcmpgt16	%f6,	%f18,	%i4
loop_898:
	sethi	0x060D,	%o1
	movrgz	%i3,	0x31E,	%l4
	alignaddr	%g4,	%g7,	%o4
	andncc	%o5,	%o3,	%g2
	fcmple32	%f10,	%f22,	%l0
	addcc	%l6,	%g3,	%l3
	fcmpd	%fcc1,	%f6,	%f16
	orn	%o0,	%o7,	%i1
	fnand	%f28,	%f2,	%f12
	movl	%icc,	%i6,	%l2
	fpack32	%f30,	%f2,	%f26
	alignaddr	%l1,	%l5,	%i7
	ldx	[%l7 + 0x70],	%i5
	edge32ln	%g5,	%o2,	%g6
	add	%l7,	0x30,	%l6
	wr	%g0,	0x10,	%asi
	ldxa	[%l6] %asi,	%o6
	casxa	[%l6] %asi,	%o6,	%g1
	fandnot1	%f30,	%f18,	%f18
	andncc	%i0,	%i2,	%i4
	fmul8x16al	%f13,	%f3,	%f28
	prefetch	[%l7 + 0x14],	 0x1
	fpack16	%f4,	%f17
	fnor	%f18,	%f24,	%f14
	bvs,a,pt	%xcc,	loop_899
	movgu	%icc,	%i3,	%o1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x80,	%asi
	ldsba	[%l7 + 0x0E] %asi,	%l4
loop_899:
	fmuld8ulx16	%f13,	%f18,	%f30
	andcc	%g4,	%o4,	%g7
	subc	%o5,	0x1D08,	%g2
	tne	%xcc,	0x1
	ble	%xcc,	loop_900
	sethi	0x1600,	%l0
	set	0x7A, %g6
	stha	%o3,	[%l7 + %g6] 0x27
	membar	#Sync
loop_900:
	array16	%l6,	%g3,	%l3
	movvc	%icc,	%o7,	%i1
	or	%i6,	0x178A,	%l2
	ta	%xcc,	0x5
	ble,a,pn	%icc,	loop_901
	edge16n	%o0,	%l5,	%l1
	movne	%icc,	%i5,	%g5
	movrgez	%o2,	%g6,	%o6
loop_901:
	std	%f18,	[%l7 + 0x50]
	siam	0x7
	lduh	[%l7 + 0x6E],	%i7
	sethi	0x0681,	%g1
	fones	%f0
	sll	%i0,	%i4,	%i2
	fmovdvs	%icc,	%f0,	%f15
	andcc	%o1,	%i3,	%l4
	addc	%o4,	%g7,	%o5
	fcmpeq16	%f4,	%f4,	%g2
	edge8	%l0,	%o3,	%g4
	xor	%g3,	%l6,	%l3
	andcc	%o7,	0x0910,	%i6
	fmul8ulx16	%f14,	%f6,	%f4
	nop
	set	0x60, %i1
	lduh	[%l7 + %i1],	%i1
	fmovsvs	%icc,	%f11,	%f24
	xorcc	%l2,	0x0A78,	%l5
	nop
	set	0x70, %o2
	ldx	[%l7 + %o2],	%o0
	movle	%icc,	%l1,	%g5
	nop
	set	0x42, %l6
	lduh	[%l7 + %l6],	%o2
	fmovsleu	%icc,	%f26,	%f31
	movcs	%xcc,	%i5,	%g6
	array16	%o6,	%g1,	%i7
	fbu	%fcc2,	loop_902
	bl,a	%xcc,	loop_903
	bgu,a,pt	%xcc,	loop_904
	movrlz	%i4,	%i2,	%i0
loop_902:
	umulcc	%i3,	%o1,	%l4
loop_903:
	orcc	%g7,	0x0B69,	%o4
loop_904:
	movn	%icc,	%g2,	%l0
	fpadd16s	%f8,	%f0,	%f19
	brz,a	%o5,	loop_905
	prefetch	[%l7 + 0x38],	 0x1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andn	%o3,	0x0356,	%g3
loop_905:
	movle	%icc,	%l6,	%g4
	sdivcc	%o7,	0x14EB,	%i6
	orncc	%i1,	0x0C6D,	%l3
	movne	%xcc,	%l2,	%o0
	fmovsge	%icc,	%f9,	%f10
	sll	%l1,	0x16,	%l5
	fmul8x16au	%f21,	%f20,	%f2
	fmovdleu	%icc,	%f10,	%f10
	bl,a	%icc,	loop_906
	movge	%icc,	%o2,	%i5
	move	%xcc,	%g5,	%g6
	fmovdge	%xcc,	%f23,	%f8
loop_906:
	srax	%g1,	0x16,	%i7
	or	%i4,	%i2,	%o6
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
	tneg	%xcc,	0x3
	fmovdle	%xcc,	%f0,	%f30
	edge16l	%i0,	%i3,	%l4
loop_907:
	nop
	wr	%g0,	0x27,	%asi
	stha	%o1,	[%l7 + 0x34] %asi
	membar	#Sync
	set	0x7C, %l2
	stwa	%g7,	[%l7 + %l2] 0x19
	te	%xcc,	0x7
	popc	0x1FA4,	%g2
	movle	%xcc,	%l0,	%o5
	movcc	%icc,	%o3,	%g3
	stx	%o4,	[%l7 + 0x70]
	movle	%icc,	%g4,	%l6
	mova	%xcc,	%i6,	%o7
	be,pt	%xcc,	loop_908
	movleu	%icc,	%l3,	%l2
	movneg	%xcc,	%i1,	%o0
	tl	%icc,	0x2
loop_908:
	fbuge	%fcc3,	loop_909
	andncc	%l5,	%o2,	%l1
	fmovsvs	%xcc,	%f21,	%f18
	array16	%g5,	%i5,	%g6
loop_909:
	ldd	[%l7 + 0x10],	%f2
	edge32n	%i7,	%g1,	%i4
	addcc	%i2,	%i0,	%o6
	subc	%i3,	%o1,	%g7
	fornot1s	%f0,	%f27,	%f26
	tl	%xcc,	0x0
	udivx	%g2,	0x03A5,	%l4
	stx	%l0,	[%l7 + 0x38]
	swap	[%l7 + 0x2C],	%o5
	bcc,pn	%xcc,	loop_910
	xorcc	%o3,	0x1D5C,	%g3
	andn	%o4,	%l6,	%g4
	edge16ln	%i6,	%l3,	%l2
loop_910:
	fand	%f0,	%f30,	%f8
	movle	%icc,	%i1,	%o7
	set	0x0F, %g7
	lduba	[%l7 + %g7] 0x88,	%o0
	fmovdcs	%xcc,	%f24,	%f23
	and	%l5,	0x1CD8,	%o2
	fandnot1s	%f13,	%f30,	%f14
	add	%l7,	0x7C,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%g5
	casa	[%l6] %asi,	%g5,	%l1
	edge8l	%g6,	%i5,	%g1
	xorcc	%i7,	%i2,	%i4
	subccc	%o6,	%i0,	%i3
	fzero	%f6
	ldsh	[%l7 + 0x1E],	%o1
	bg,a,pt	%icc,	loop_911
	fmovsne	%xcc,	%f10,	%f25
	movl	%xcc,	%g2,	%l4
	sdivx	%l0,	0x0DF3,	%g7
loop_911:
	fmovdcc	%icc,	%f23,	%f21
	fsrc2	%f18,	%f26
	membar	0x03
	ble,pn	%icc,	loop_912
	bge,a	%xcc,	loop_913
	fnot1s	%f29,	%f19
	andncc	%o3,	%o5,	%g3
loop_912:
	fone	%f12
loop_913:
	sra	%l6,	0x0E,	%g4
	tpos	%xcc,	0x4
	fmovrde	%i6,	%f24,	%f12
	ld	[%l7 + 0x74],	%f3
	udivx	%l3,	0x1DB2,	%o4
	umulcc	%i1,	0x165C,	%l2
	fmovspos	%icc,	%f8,	%f25
	fpadd16	%f16,	%f26,	%f8
	movcs	%icc,	%o7,	%l5
	membar	0x6C
	tg	%icc,	0x0
	set	0x64, %l3
	ldswa	[%l7 + %l3] 0x80,	%o2
	edge32l	%o0,	%g5,	%g6
	fpsub32	%f14,	%f2,	%f16
	fsrc1	%f16,	%f20
	orn	%i5,	%l1,	%g1
	subc	%i2,	0x02B8,	%i4
	fmovsgu	%icc,	%f11,	%f12
	movne	%xcc,	%i7,	%i0
	ldd	[%l7 + 0x20],	%f20
	fmovdvs	%icc,	%f25,	%f26
	tsubcc	%o6,	%o1,	%g2
	tne	%xcc,	0x4
	array16	%i3,	%l0,	%l4
	subccc	%o3,	%o5,	%g3
	fand	%f24,	%f22,	%f26
	fbuge	%fcc2,	loop_914
	array8	%g7,	%g4,	%l6
	tvc	%icc,	0x5
	fnand	%f20,	%f28,	%f6
loop_914:
	array32	%l3,	%o4,	%i1
	tg	%icc,	0x5
	alignaddrl	%l2,	%i6,	%l5
	brlez	%o7,	loop_915
	ldsw	[%l7 + 0x30],	%o2
	subccc	%o0,	%g6,	%g5
	wr	%g0,	0x80,	%asi
	prefetcha	[%l7 + 0x38] %asi,	 0x0
loop_915:
	edge16n	%g1,	%l1,	%i4
	tcs	%icc,	0x7
	ba,pn	%icc,	loop_916
	xnorcc	%i7,	%i0,	%o6
	lduw	[%l7 + 0x70],	%i2
	bshuffle	%f14,	%f14,	%f24
loop_916:
	call	loop_917
	ldub	[%l7 + 0x71],	%o1
	popc	%i3,	%l0
	addccc	%g2,	0x1EB0,	%l4
loop_917:
	addcc	%o3,	0x1F50,	%g3
	fmovsge	%icc,	%f24,	%f28
	fnot1	%f4,	%f18
	fmovrslz	%g7,	%f29,	%f6
	bl	%icc,	loop_918
	movrgez	%g4,	0x030,	%o5
	edge32n	%l6,	%o4,	%l3
	edge16ln	%l2,	%i1,	%i6
loop_918:
	addc	%l5,	0x1821,	%o7
	be,pn	%icc,	loop_919
	tn	%icc,	0x0
	stx	%o2,	[%l7 + 0x08]
	fnot2s	%f19,	%f7
loop_919:
	srlx	%o0,	%g5,	%g6
	set	0x70, %l0
	ldswa	[%l7 + %l0] 0x0c,	%i5
	fnegd	%f8,	%f12
	wr	%g0,	0x88,	%asi
	stxa	%g1,	[%l7 + 0x68] %asi
	fabss	%f20,	%f0
	movrgez	%l1,	%i7,	%i4
	st	%f28,	[%l7 + 0x08]
	fbu,a	%fcc0,	loop_920
	or	%o6,	%i0,	%o1
	fbg,a	%fcc2,	loop_921
	or	%i3,	%l0,	%g2
loop_920:
	subccc	%i2,	0x19CC,	%l4
	ldub	[%l7 + 0x3D],	%o3
loop_921:
	fbe,a	%fcc0,	loop_922
	tl	%icc,	0x2
	bvs	loop_923
	bgu,pt	%icc,	loop_924
loop_922:
	stx	%g7,	[%l7 + 0x78]
	fands	%f17,	%f12,	%f9
loop_923:
	edge8ln	%g3,	%o5,	%g4
loop_924:
	fmovdpos	%icc,	%f12,	%f21
	fand	%f6,	%f22,	%f2
	sdiv	%o4,	0x18E2,	%l6
	movge	%icc,	%l3,	%l2
	brgz	%i1,	loop_925
	movneg	%icc,	%l5,	%o7
	addc	%i6,	%o0,	%o2
	brlez	%g5,	loop_926
loop_925:
	movle	%xcc,	%g6,	%g1
	tg	%xcc,	0x3
	movrne	%i5,	%i7,	%l1
loop_926:
	orn	%o6,	%i0,	%o1
	fandnot2	%f28,	%f8,	%f8
	udivx	%i3,	0x0F50,	%i4
	fmovrdlz	%l0,	%f8,	%f6
	fmovs	%f27,	%f0
	be,pt	%icc,	loop_927
	mulscc	%g2,	%l4,	%o3
	andncc	%g7,	%i2,	%o5
	edge32n	%g4,	%o4,	%l6
loop_927:
	movneg	%xcc,	%g3,	%l3
	or	%i1,	%l2,	%l5
	fmul8ulx16	%f12,	%f26,	%f6
	sllx	%i6,	0x09,	%o7
	srlx	%o2,	0x16,	%g5
	addccc	%g6,	0x0271,	%o0
	sllx	%i5,	%i7,	%g1
	movvs	%icc,	%l1,	%i0
	edge8ln	%o6,	%i3,	%i4
	tleu	%icc,	0x5
	bg,pn	%icc,	loop_928
	fmul8x16	%f19,	%f16,	%f16
	smulcc	%o1,	%g2,	%l0
	nop
	set	0x19, %i6
	ldub	[%l7 + %i6],	%l4
loop_928:
	srlx	%o3,	0x1E,	%g7
	fnand	%f2,	%f6,	%f20
	fone	%f0
	fmovdn	%xcc,	%f17,	%f16
	movrlz	%o5,	%i2,	%o4
	movneg	%xcc,	%g4,	%g3
	edge32ln	%l3,	%l6,	%i1
	fblg,a	%fcc3,	loop_929
	sllx	%l2,	0x12,	%l5
	tleu	%icc,	0x2
	smulcc	%i6,	%o2,	%o7
loop_929:
	fmovsvs	%icc,	%f11,	%f2
	set	0x58, %g1
	stda	%g4,	[%l7 + %g1] 0x81
	fnors	%f17,	%f31,	%f8
	wr	%g0,	0x10,	%asi
	ldxa	[%l7 + 0x70] %asi,	%g6
	fcmpne16	%f26,	%f22,	%o0
	wr	%g0,	0x22,	%asi
	stba	%i5,	[%l7 + 0x23] %asi
	membar	#Sync
	mulscc	%i7,	0x03D7,	%g1
	fones	%f13
	array16	%i0,	%l1,	%o6
	fbn	%fcc3,	loop_930
	edge16l	%i3,	%o1,	%g2
	stb	%i4,	[%l7 + 0x31]
	movcc	%icc,	%l0,	%o3
loop_930:
	movrne	%g7,	%o5,	%i2
	fbug	%fcc3,	loop_931
	fabss	%f30,	%f11
	movcc	%icc,	%o4,	%l4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_931:
	fsrc1	%f8,	%f8
	bge,a	loop_932
	prefetch	[%l7 + 0x1C],	 0x2
	tg	%xcc,	0x4
	fmovrdlz	%g4,	%f8,	%f0
loop_932:
	sth	%l3,	[%l7 + 0x08]
	fmovrslz	%g3,	%f9,	%f3
	edge16	%i1,	%l2,	%l6
	movn	%icc,	%l5,	%o2
	movrgez	%o7,	0x1B5,	%g5
	fandnot1	%f28,	%f30,	%f24
	tg	%icc,	0x6
	brgz,a	%i6,	loop_933
	bcc,pn	%icc,	loop_934
	srl	%g6,	%i5,	%o0
	bvs,a	%xcc,	loop_935
loop_933:
	move	%icc,	%i7,	%g1
loop_934:
	fba,a	%fcc2,	loop_936
	movcs	%xcc,	%i0,	%o6
loop_935:
	stw	%i3,	[%l7 + 0x4C]
	ldx	[%l7 + 0x20],	%l1
loop_936:
	fmovde	%icc,	%f13,	%f6
	xorcc	%g2,	%i4,	%l0
	add	%l7,	0x3C,	%l6
	wr	%g0,	0x19,	%asi
	casa	[%l6] %asi,	%o3,	%g7
	xorcc	%o5,	%o1,	%i2
	mova	%icc,	%l4,	%g4
	edge32l	%l3,	%o4,	%g3
	edge8n	%i1,	%l2,	%l6
	umul	%l5,	%o7,	%g5
	edge16l	%i6,	%o2,	%i5
	srlx	%g6,	%o0,	%g1
	fxors	%f4,	%f12,	%f3
	edge16	%i0,	%i7,	%o6
	sdivx	%l1,	0x0179,	%g2
	fands	%f0,	%f20,	%f9
	set	0x50, %i2
	prefetcha	[%l7 + %i2] 0x80,	 0x1
	movn	%icc,	%i3,	%o3
	movn	%icc,	%l0,	%o5
	fand	%f22,	%f26,	%f10
	pdist	%f28,	%f16,	%f22
	fbe,a	%fcc2,	loop_937
	edge8ln	%g7,	%o1,	%i2
	tg	%icc,	0x1
	movrlez	%l4,	%g4,	%o4
loop_937:
	edge8	%l3,	%g3,	%i1
	siam	0x7
	tgu	%icc,	0x4
	smul	%l2,	0x1C34,	%l5
	ldd	[%l7 + 0x28],	%i6
	addcc	%o7,	%g5,	%o2
	xnor	%i6,	%i5,	%g6
	edge32ln	%g1,	%i0,	%i7
	brgez,a	%o0,	loop_938
	srax	%l1,	0x0B,	%o6
	fmovsne	%xcc,	%f5,	%f29
	fnands	%f17,	%f3,	%f24
loop_938:
	nop
	wr	%g0,	0x80,	%asi
	ldswa	[%l7 + 0x0C] %asi,	%i4
	bne	loop_939
	smulcc	%i3,	%g2,	%l0
	fbule,a	%fcc2,	loop_940
	fmovrsne	%o3,	%f27,	%f31
loop_939:
	edge32n	%o5,	%o1,	%i2
	fcmple16	%f10,	%f16,	%g7
loop_940:
	movle	%icc,	%l4,	%g4
	fmovsleu	%xcc,	%f12,	%f26
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x2D, %l1
	stba	%l3,	[%l7 + %l1] 0xea
	membar	#Sync
	fbul,a	%fcc3,	loop_941
	movneg	%xcc,	%g3,	%i1
	tcs	%icc,	0x7
	xorcc	%l2,	0x0347,	%o4
loop_941:
	tle	%xcc,	0x3
	or	%l5,	%l6,	%o7
	fbul	%fcc2,	loop_942
	te	%xcc,	0x5
	st	%f5,	[%l7 + 0x3C]
	pdist	%f28,	%f16,	%f22
loop_942:
	fbue	%fcc0,	loop_943
	tpos	%icc,	0x0
	std	%g4,	[%l7 + 0x68]
	tpos	%icc,	0x7
loop_943:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movvs	%icc,	%o2,	%i6
	array16	%i5,	%g6,	%i0
	fble	%fcc2,	loop_944
	srax	%g1,	0x1E,	%o0
	sdivcc	%l1,	0x192D,	%o6
	fmovspos	%icc,	%f29,	%f24
loop_944:
	array8	%i7,	%i4,	%g2
	ldsw	[%l7 + 0x54],	%l0
	udivcc	%o3,	0x0ECC,	%o5
	alignaddr	%i3,	%i2,	%g7
	edge32l	%o1,	%g4,	%l3
	sdivcc	%g3,	0x0830,	%i1
	ldsw	[%l7 + 0x4C],	%l2
	srax	%l4,	0x1A,	%o4
	fmovda	%xcc,	%f14,	%f22
	fbul	%fcc3,	loop_945
	fmovde	%icc,	%f26,	%f28
	array8	%l6,	%o7,	%g5
	alignaddrl	%l5,	%o2,	%i6
loop_945:
	nop
	set	0x44, %o7
	stwa	%i5,	[%l7 + %o7] 0x88
	fmovrsne	%i0,	%f10,	%f22
	movvs	%icc,	%g6,	%g1
	set	0x73, %i5
	stba	%o0,	[%l7 + %i5] 0xe3
	membar	#Sync
	tgu	%xcc,	0x6
	subc	%o6,	0x000C,	%i7
	fmovs	%f9,	%f20
	fornot1s	%f2,	%f11,	%f9
	nop 	! 	nop 	! 	wr	%g0,	0x40,	%asi ripped by fixASI40.pl ripped by fixASI40.pl
	nop 	! 	nop 	! 	stxa	%i4,	[%g0 + 0x3b8] %asi ripped by fixASI40.pl ripped by fixASI40.pl
	fsrc2s	%f12,	%f30
	or	%l1,	0x11A7,	%g2
	fmovdcs	%xcc,	%f30,	%f11
	set	0x62, %o5
	ldstuba	[%l7 + %o5] 0x19,	%o3
	fsrc2	%f26,	%f6
	fbne	%fcc1,	loop_946
	fnand	%f6,	%f4,	%f12
	edge32n	%l0,	%i3,	%o5
	orcc	%i2,	0x106D,	%g7
loop_946:
	mulscc	%o1,	%l3,	%g3
	fmovspos	%icc,	%f9,	%f9
	fble,a	%fcc3,	loop_947
	orncc	%i1,	%g4,	%l4
	te	%xcc,	0x1
	movleu	%icc,	%l2,	%l6
loop_947:
	array32	%o4,	%g5,	%o7
	set	0x11, %o0
	stba	%o2,	[%l7 + %o0] 0x89
	wr	%g0,	0x11,	%asi
	stwa	%i6,	[%l7 + 0x2C] %asi
	lduh	[%l7 + 0x66],	%i5
	ta	%icc,	0x0
	edge16ln	%i0,	%g6,	%g1
	fbul,a	%fcc3,	loop_948
	taddcc	%o0,	%o6,	%i7
	bneg,a	loop_949
	ldd	[%l7 + 0x58],	%i4
loop_948:
	sdivcc	%l5,	0x1130,	%l1
	fmovsneg	%xcc,	%f0,	%f0
loop_949:
	mulx	%o3,	0x0118,	%l0
	fbo,a	%fcc3,	loop_950
	movne	%xcc,	%g2,	%o5
	array16	%i2,	%i3,	%o1
	movpos	%icc,	%l3,	%g3
loop_950:
	srax	%i1,	0x1E,	%g7
	movneg	%xcc,	%g4,	%l2
	sdivcc	%l4,	0x1366,	%l6
	sdivx	%o4,	0x08B1,	%g5
	sdivcc	%o2,	0x175C,	%o7
	srl	%i6,	%i0,	%i5
	movvs	%icc,	%g6,	%g1
	ldd	[%l7 + 0x78],	%o0
	tge	%xcc,	0x4
	alignaddrl	%o6,	%i4,	%i7
	sll	%l5,	%o3,	%l1
	subcc	%g2,	0x1845,	%l0
	movl	%icc,	%o5,	%i3
	brz	%i2,	loop_951
	popc	0x047B,	%l3
	tgu	%xcc,	0x5
	srl	%g3,	%i1,	%o1
loop_951:
	fnor	%f0,	%f20,	%f10
	orn	%g7,	%l2,	%g4
	bneg	%xcc,	loop_952
	fbule	%fcc2,	loop_953
	edge16ln	%l6,	%o4,	%g5
	udivcc	%o2,	0x1771,	%l4
loop_952:
	sub	%i6,	0x0622,	%o7
loop_953:
	pdist	%f22,	%f16,	%f20
	fmovdvs	%icc,	%f27,	%f9
	edge32l	%i5,	%i0,	%g6
	fbule	%fcc1,	loop_954
	fnors	%f24,	%f7,	%f19
	bcc,a,pn	%xcc,	loop_955
	brlz,a	%o0,	loop_956
loop_954:
	tvc	%icc,	0x7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_955:
	bleu	loop_957
loop_956:
	umul	%g1,	0x17FF,	%o6
	fnegd	%f14,	%f26
	fcmple16	%f16,	%f18,	%i4
loop_957:
	edge16ln	%i7,	%o3,	%l5
	fmovrsgez	%g2,	%f8,	%f3
	fornot2	%f20,	%f12,	%f22
	popc	0x127C,	%l1
	umulcc	%l0,	%o5,	%i2
	addc	%i3,	%g3,	%i1
	movrgez	%l3,	%g7,	%l2
	subccc	%g4,	0x06BC,	%l6
	st	%f29,	[%l7 + 0x0C]
	fble	%fcc3,	loop_958
	prefetch	[%l7 + 0x6C],	 0x2
	fmovdne	%xcc,	%f17,	%f28
	fnor	%f4,	%f2,	%f28
loop_958:
	umul	%o1,	0x1778,	%o4
	fpack32	%f24,	%f24,	%f2
	tcs	%icc,	0x5
	xorcc	%g5,	%l4,	%i6
	sir	0x10CF
	udiv	%o7,	0x107F,	%o2
	fmuld8sux16	%f23,	%f9,	%f20
	fsrc1s	%f25,	%f24
	bne,pt	%xcc,	loop_959
	fnor	%f6,	%f10,	%f24
	tne	%icc,	0x6
	andncc	%i0,	%i5,	%g6
loop_959:
	movrlz	%o0,	0x210,	%g1
	wr	%g0,	0x11,	%asi
	ldsba	[%l7 + 0x1C] %asi,	%i4
	taddcc	%o6,	0x03F4,	%o3
	fbu,a	%fcc3,	loop_960
	fmovscc	%xcc,	%f0,	%f12
	mova	%icc,	%i7,	%g2
	sethi	0x015A,	%l1
loop_960:
	mova	%icc,	%l0,	%l5
	fcmple16	%f12,	%f10,	%o5
	movrlz	%i2,	0x33A,	%g3
	fpackfix	%f6,	%f29
	xnor	%i3,	%i1,	%g7
	tneg	%xcc,	0x5
	membar	0x0C
	ta	%icc,	0x6
	fbe	%fcc3,	loop_961
	fbu,a	%fcc2,	loop_962
	addcc	%l2,	0x126E,	%l3
	edge16ln	%l6,	%g4,	%o1
loop_961:
	movne	%icc,	%o4,	%l4
loop_962:
	nop
	wr	%g0,	0x89,	%asi
	ldstuba	[%l7 + 0x27] %asi,	%i6
	edge16l	%o7,	%o2,	%i0
	orcc	%g5,	0x12E4,	%g6
	srlx	%o0,	0x0D,	%g1
	alignaddrl	%i4,	%i5,	%o6
	sub	%o3,	%g2,	%l1
	tl	%xcc,	0x2
	movne	%icc,	%l0,	%l5
	tge	%icc,	0x0
	fmovsa	%xcc,	%f31,	%f23
	array32	%i7,	%i2,	%g3
	tsubcc	%o5,	%i3,	%g7
	edge16l	%l2,	%i1,	%l6
	fblg,a	%fcc1,	loop_963
	stw	%l3,	[%l7 + 0x20]
	edge32l	%g4,	%o1,	%o4
	brlz,a	%i6,	loop_964
loop_963:
	fmovrsgez	%o7,	%f9,	%f18
	umul	%o2,	%i0,	%g5
	edge8l	%l4,	%o0,	%g6
loop_964:
	prefetch	[%l7 + 0x6C],	 0x2
	sir	0x1BA1
	tvs	%icc,	0x4
	fmovdne	%xcc,	%f4,	%f16
	addc	%i4,	0x0D62,	%i5
	addccc	%o6,	%o3,	%g1
	smul	%l1,	0x093B,	%l0
	fmovrdne	%l5,	%f10,	%f18
	subccc	%g2,	%i2,	%g3
	movle	%icc,	%i7,	%o5
	edge32ln	%i3,	%l2,	%i1
	tsubcc	%g7,	0x158A,	%l6
	and	%g4,	0x093E,	%l3
	set	0x20, %o4
	ldda	[%l7 + %o4] 0x14,	%o0
	fornot1s	%f17,	%f24,	%f4
	fandnot2	%f28,	%f14,	%f12
	movrlez	%o4,	0x18D,	%i6
	bl,a,pt	%xcc,	loop_965
	fmovdcs	%icc,	%f12,	%f30
	fandnot1	%f10,	%f6,	%f2
	movl	%xcc,	%o2,	%i0
loop_965:
	ldx	[%l7 + 0x68],	%o7
	bvc,a,pn	%xcc,	loop_966
	fmovdn	%xcc,	%f31,	%f30
	fnegs	%f8,	%f20
	membar	0x51
loop_966:
	fmovdle	%icc,	%f14,	%f27
	tle	%xcc,	0x4
	movvc	%icc,	%l4,	%o0
	alignaddr	%g6,	%i4,	%i5
	nop
	setx loop_967, %l0, %l1
	jmpl %l1, %o6
	srax	%g5,	0x1A,	%g1
	movrlez	%o3,	%l0,	%l5
	movle	%xcc,	%g2,	%l1
loop_967:
	tsubcc	%g3,	0x005A,	%i2
	edge32l	%i7,	%o5,	%i3
	fmovsleu	%icc,	%f20,	%f0
	tcc	%icc,	0x0
	tleu	%xcc,	0x2
	fmovrsne	%i1,	%f13,	%f8
	nop
	set	0x79, %i0
	ldub	[%l7 + %i0],	%l2
	fmul8ulx16	%f4,	%f2,	%f30
	movleu	%xcc,	%l6,	%g7
	orcc	%g4,	%o1,	%o4
	ta	%icc,	0x4
	ldd	[%l7 + 0x70],	%i6
	te	%icc,	0x2
	fmovse	%xcc,	%f15,	%f23
	taddcc	%o2,	0x1C91,	%l3
	fmovsa	%icc,	%f3,	%f19
	edge32l	%o7,	%i0,	%o0
	bvs,pn	%icc,	loop_968
	edge32n	%g6,	%i4,	%l4
	move	%icc,	%i5,	%g5
	ldd	[%l7 + 0x18],	%g0
loop_968:
	fmovdl	%xcc,	%f18,	%f30
	tleu	%xcc,	0x4
	srl	%o3,	%l0,	%l5
	movpos	%xcc,	%o6,	%l1
	srax	%g2,	0x04,	%i2
	orcc	%g3,	%o5,	%i7
	set	0x76, %l5
	ldsha	[%l7 + %l5] 0x80,	%i1
	smulcc	%i3,	0x1FF7,	%l2
	set	0x40, %g5
	stda	%f0,	[%l7 + %g5] 0x18
	subcc	%g7,	0x0D89,	%l6
	fbg,a	%fcc3,	loop_969
	edge8	%o1,	%o4,	%i6
	udivcc	%o2,	0x0CC2,	%l3
	array32	%g4,	%i0,	%o7
loop_969:
	movcs	%icc,	%o0,	%i4
	tne	%icc,	0x7
	swap	[%l7 + 0x68],	%g6
	mulx	%i5,	%g5,	%g1
	ta	%icc,	0x1
	tcc	%icc,	0x1
	fbge,a	%fcc0,	loop_970
	sll	%l4,	%o3,	%l5
	edge32n	%l0,	%o6,	%l1
	add	%l7,	0x70,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] %asi,	%i2,	%g3
loop_970:
	edge32	%g2,	%o5,	%i7
	tvc	%icc,	0x5
	tn	%icc,	0x3
	fnegs	%f27,	%f3
	array32	%i3,	%i1,	%g7
	sethi	0x18F8,	%l6
	umul	%o1,	%o4,	%i6
	movl	%icc,	%o2,	%l2
	fmovdg	%xcc,	%f4,	%f23
	bpos	%icc,	loop_971
	brgz	%g4,	loop_972
	smul	%i0,	%o7,	%o0
	tle	%xcc,	0x6
loop_971:
	fpackfix	%f0,	%f10
loop_972:
	movrgz	%i4,	0x041,	%l3
	fmovsne	%icc,	%f8,	%f11
	fpsub16s	%f12,	%f16,	%f17
	be,a	%icc,	loop_973
	fbo,a	%fcc2,	loop_974
	fexpand	%f15,	%f16
	movvc	%xcc,	%g6,	%i5
loop_973:
	fcmpd	%fcc0,	%f26,	%f14
loop_974:
	sth	%g1,	[%l7 + 0x40]
	fmovrdlz	%l4,	%f26,	%f12
	alignaddrl	%o3,	%g5,	%l5
	ldd	[%l7 + 0x58],	%f2
	bne	%xcc,	loop_975
	movgu	%xcc,	%o6,	%l1
	fmovd	%f28,	%f16
	bvc	%icc,	loop_976
loop_975:
	tle	%xcc,	0x4
	movleu	%xcc,	%l0,	%g3
	edge16ln	%i2,	%o5,	%g2
loop_976:
	edge32l	%i3,	%i7,	%g7
	std	%i6,	[%l7 + 0x78]
	fmul8sux16	%f30,	%f18,	%f4
	ba,pt	%icc,	loop_977
	sll	%i1,	%o4,	%i6
	orcc	%o1,	0x1DD4,	%l2
	tg	%xcc,	0x3
loop_977:
	movrlz	%o2,	%i0,	%o7
	edge32ln	%g4,	%i4,	%l3
	srlx	%g6,	0x19,	%i5
	orcc	%g1,	%l4,	%o0
	srax	%g5,	0x11,	%o3
	tvs	%xcc,	0x1
	nop
	set	0x38, %o3
	lduw	[%l7 + %o3],	%l5
	addc	%l1,	%l0,	%g3
	movvs	%xcc,	%i2,	%o6
	edge16	%g2,	%i3,	%o5
	wr	%g0,	0x19,	%asi
	prefetcha	[%l7 + 0x48] %asi,	 0x3
	sll	%i7,	%i1,	%l6
	movneg	%icc,	%i6,	%o4
	bne,pt	%icc,	loop_978
	addcc	%o1,	0x05CB,	%o2
	fbuge	%fcc2,	loop_979
	movleu	%icc,	%i0,	%o7
loop_978:
	mulx	%g4,	%l2,	%l3
	set	0x08, %g3
	ldxa	[%l7 + %g3] 0x81,	%g6
loop_979:
	xnorcc	%i4,	0x13B3,	%i5
	fnot1	%f0,	%f26
	tn	%icc,	0x0
	subcc	%g1,	0x0A33,	%o0
	mulscc	%l4,	0x0FCC,	%g5
	udivcc	%l5,	0x1C81,	%o3
	tsubcctv	%l1,	%l0,	%i2
	be	loop_980
	fmul8sux16	%f22,	%f20,	%f18
	fbu	%fcc0,	loop_981
	taddcc	%g3,	%g2,	%o6
loop_980:
	fbe,a	%fcc0,	loop_982
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_981:
	sdivcc	%o5,	0x0E92,	%i3
	lduw	[%l7 + 0x10],	%g7
loop_982:
	and	%i1,	%i7,	%i6
	tpos	%icc,	0x4
	fandnot2	%f20,	%f2,	%f24
	move	%icc,	%l6,	%o1
	te	%icc,	0x0
	fbe,a	%fcc0,	loop_983
	subc	%o2,	0x1614,	%o4
	ldub	[%l7 + 0x60],	%i0
	sir	0x069B
loop_983:
	fmovdge	%xcc,	%f10,	%f23
	udivx	%o7,	0x11AC,	%g4
	sub	%l2,	0x0B4E,	%g6
	tcs	%xcc,	0x6
	tgu	%xcc,	0x2
	edge16l	%l3,	%i5,	%g1
	smul	%o0,	0x0DE0,	%l4
	stx	%i4,	[%l7 + 0x18]
	fble,a	%fcc1,	loop_984
	fzero	%f24
	fbne	%fcc3,	loop_985
	movle	%xcc,	%g5,	%l5
loop_984:
	movneg	%xcc,	%o3,	%l1
	wr	%g0,	0x04,	%asi
	stba	%i2,	[%l7 + 0x6F] %asi
loop_985:
	fones	%f21
	brz,a	%l0,	loop_986
	movneg	%xcc,	%g2,	%o6
	fmovrsgez	%g3,	%f16,	%f27
	fcmpne16	%f0,	%f0,	%o5
loop_986:
	tne	%icc,	0x6
	bleu	%xcc,	loop_987
	ldsw	[%l7 + 0x0C],	%g7
	set	0x54, %g2
	swapa	[%l7 + %g2] 0x81,	%i1
loop_987:
	fbul,a	%fcc3,	loop_988
	bvc,pt	%xcc,	loop_989
	srl	%i3,	0x10,	%i7
	addc	%i6,	%l6,	%o2
loop_988:
	array32	%o1,	%i0,	%o4
loop_989:
	andn	%g4,	%o7,	%g6
	andcc	%l3,	0x144F,	%l2
	movleu	%xcc,	%g1,	%o0
	brgez,a	%l4,	loop_990
	tcc	%xcc,	0x1
	set	0x0C, %i4
	stwa	%i4,	[%l7 + %i4] 0x14
loop_990:
	flush	%l7 + 0x20
	addccc	%i5,	%l5,	%o3
	addccc	%l1,	%g5,	%l0
	tsubcc	%i2,	%o6,	%g2
	fpsub16	%f30,	%f26,	%f26
	sdivcc	%o5,	0x06F6,	%g7
	tneg	%xcc,	0x2
	movn	%xcc,	%g3,	%i3
	orncc	%i7,	0x1295,	%i6
	edge32	%i1,	%l6,	%o1
	nop
	setx loop_991, %l0, %l1
	jmpl %l1, %o2
	fpadd32s	%f8,	%f0,	%f28
	fbl	%fcc1,	loop_992
	andn	%o4,	%i0,	%g4
loop_991:
	swap	[%l7 + 0x38],	%g6
	bgu,a	%icc,	loop_993
loop_992:
	movrlez	%l3,	%o7,	%g1
	ldx	[%l7 + 0x48],	%l2
	tne	%xcc,	0x1
loop_993:
	fmovrsgez	%l4,	%f2,	%f20
	movle	%icc,	%i4,	%o0
	addc	%l5,	0x138F,	%o3
	edge8	%i5,	%l1,	%l0
	tsubcctv	%i2,	0x0A30,	%o6
	fmovspos	%icc,	%f29,	%f28
	movrgez	%g5,	%o5,	%g7
	wr	%g0,	0xe3,	%asi
	stba	%g3,	[%l7 + 0x24] %asi
	membar	#Sync
	stx	%g2,	[%l7 + 0x20]
	st	%f22,	[%l7 + 0x40]
	sethi	0x067C,	%i7
	sllx	%i6,	%i3,	%i1
	fmovdpos	%xcc,	%f6,	%f9
	movrne	%l6,	%o2,	%o4
	bvc	%xcc,	loop_994
	brgz	%i0,	loop_995
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ble,a	loop_996
loop_994:
	srlx	%o1,	0x09,	%g6
loop_995:
	bge,pt	%xcc,	loop_997
	movrlez	%l3,	%o7,	%g4
loop_996:
	fmovrde	%l2,	%f26,	%f24
	fbl,a	%fcc2,	loop_998
loop_997:
	sll	%l4,	%i4,	%o0
	set	0x28, %g4
	lduha	[%l7 + %g4] 0x10,	%g1
loop_998:
	edge16l	%o3,	%i5,	%l5
	alignaddr	%l1,	%i2,	%l0
	edge8l	%o6,	%o5,	%g7
	fmovdpos	%icc,	%f30,	%f16
	ta	%icc,	0x3
	movle	%xcc,	%g5,	%g3
	fmuld8sux16	%f10,	%f31,	%f2
	movrlz	%i7,	0x33D,	%i6
	movcs	%xcc,	%g2,	%i3
	bpos,a,pt	%icc,	loop_999
	fsrc2	%f30,	%f30
	orncc	%i1,	%l6,	%o4
	bpos,pn	%xcc,	loop_1000
loop_999:
	movcs	%icc,	%i0,	%o2
	nop
	set	0x24, %l4
	lduw	[%l7 + %l4],	%o1
	orcc	%l3,	0x0820,	%o7
loop_1000:
	fone	%f22
	sth	%g6,	[%l7 + 0x1C]
	fmovdneg	%icc,	%f25,	%f11
	fbule	%fcc2,	loop_1001
	sll	%g4,	%l4,	%l2
	fornot1s	%f0,	%f18,	%f7
	mulx	%o0,	%i4,	%g1
loop_1001:
	orncc	%o3,	0x18D2,	%i5
	fbul	%fcc0,	loop_1002
	fandnot1s	%f5,	%f25,	%f24
	tsubcc	%l5,	%i2,	%l0
	add	%l1,	%o5,	%g7
loop_1002:
	movre	%g5,	0x055,	%g3
	st	%f11,	[%l7 + 0x64]
	set	0x48, %i3
	stxa	%o6,	[%l7 + %i3] 0x80
	subcc	%i7,	0x168D,	%i6
	edge8	%i3,	%g2,	%l6
	membar	0x30
	st	%f17,	[%l7 + 0x18]
	wr	%g0,	0x2b,	%asi
	ldda	[%l7 + 0x60] %asi,	%i0
	movpos	%xcc,	%i0,	%o2
	fcmpgt16	%f12,	%f12,	%o4
	movg	%xcc,	%o1,	%l3
	fmovrdlz	%g6,	%f2,	%f18
	bn,pt	%icc,	loop_1003
	tcc	%xcc,	0x5
	fcmpgt16	%f24,	%f24,	%g4
	fbuge	%fcc2,	loop_1004
loop_1003:
	array8	%l4,	%l2,	%o7
	fmovspos	%xcc,	%f5,	%f4
	smul	%i4,	%o0,	%o3
loop_1004:
	prefetch	[%l7 + 0x44],	 0x0
	bgu,pt	%xcc,	loop_1005
	movg	%xcc,	%i5,	%l5
	smulcc	%g1,	%i2,	%l0
	set	0x40, %o1
	ldda	[%l7 + %o1] 0x0c,	%f0
loop_1005:
	edge32l	%l1,	%o5,	%g7
	tl	%xcc,	0x2
	tvc	%xcc,	0x2
	taddcctv	%g5,	%o6,	%i7
	tg	%icc,	0x4
	alignaddrl	%g3,	%i6,	%i3
	srl	%g2,	0x0C,	%i1
	fmovsle	%xcc,	%f1,	%f10
	fmovdvc	%icc,	%f13,	%f13
	add	%l7,	0x68,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%i0,	%l6
	array16	%o2,	%o1,	%l3
	addcc	%g6,	%o4,	%g4
	edge32ln	%l4,	%l2,	%i4
	smulcc	%o7,	0x1CA7,	%o0
	srl	%i5,	0x03,	%l5
	bg,a	loop_1006
	umul	%o3,	0x1E43,	%i2
	prefetch	[%l7 + 0x30],	 0x3
	orn	%l0,	0x1E14,	%g1
loop_1006:
	movrgz	%o5,	0x17E,	%g7
	udivcc	%l1,	0x07C9,	%g5
	bpos,pn	%xcc,	loop_1007
	addc	%o6,	0x04BD,	%i7
	add	%l7,	0x54,	%l6
	wr	%g0,	0x18,	%asi
	lda	[%l6] %asi,	%g3
	casa	[%l6] 0x18,	%g3,	%i3
loop_1007:
	fpsub16	%f26,	%f8,	%f0
	fsrc2	%f26,	%f20
	umulcc	%g2,	0x04BB,	%i6
	ble	%xcc,	loop_1008
	bvs,a,pt	%xcc,	loop_1009
	fmovsge	%xcc,	%f28,	%f7
	xor	%i1,	0x0AA0,	%i0
loop_1008:
	fandnot1	%f10,	%f10,	%f12
loop_1009:
	nop
	set	0x50, %i7
	stha	%o2,	[%l7 + %i7] 0x0c
	addc	%l6,	%l3,	%o1
	movre	%g6,	%o4,	%l4
	add	%g4,	%i4,	%o7
	smulcc	%o0,	0x0ADC,	%l2
	array32	%i5,	%l5,	%o3
	bg,pn	%icc,	loop_1010
	fbu	%fcc2,	loop_1011
	mova	%xcc,	%i2,	%l0
	mova	%xcc,	%g1,	%g7
loop_1010:
	bneg,a,pn	%xcc,	loop_1012
loop_1011:
	fzeros	%f11
	std	%f28,	[%l7 + 0x70]
	edge16	%o5,	%g5,	%l1
loop_1012:
	subccc	%i7,	0x099A,	%o6
	movvs	%xcc,	%i3,	%g2
	sllx	%i6,	0x07,	%i1
	movrlz	%i0,	%o2,	%l6
	udivx	%l3,	0x0AAD,	%g3
	sdivcc	%o1,	0x17FF,	%o4
	nop
	set	0x0C, %o6
	ldsw	[%l7 + %o6],	%g6
	wr	%g0,	0x11,	%asi
	lduha	[%l7 + 0x0A] %asi,	%l4
	fmul8ulx16	%f8,	%f10,	%f4
	mulx	%i4,	0x0E5A,	%o7
	tcs	%xcc,	0x3
	fpadd16s	%f8,	%f30,	%f19
	fmovdle	%icc,	%f17,	%f15
	nop
	setx loop_1013, %l0, %l1
	jmpl %l1, %g4
	edge16n	%l2,	%i5,	%l5
	sub	%o0,	0x187A,	%i2
	array16	%o3,	%l0,	%g1
loop_1013:
	fpadd32	%f28,	%f0,	%f22
	fmovrsgez	%o5,	%f5,	%f12
	fmovsge	%xcc,	%f18,	%f31
	fmovspos	%xcc,	%f19,	%f25
	taddcctv	%g7,	%l1,	%i7
	set	0x50, %g6
	lduwa	[%l7 + %g6] 0x04,	%g5
	array8	%o6,	%g2,	%i6
	set	0x78, %i1
	stda	%i0,	[%l7 + %i1] 0x81
	fxors	%f14,	%f0,	%f14
	subccc	%i3,	0x09FD,	%i0
	wr	%g0,	0x81,	%asi
	ldsba	[%l7 + 0x5A] %asi,	%o2
	bvs,a,pt	%xcc,	loop_1014
	tle	%icc,	0x0
	edge16n	%l3,	%l6,	%g3
	smulcc	%o1,	%o4,	%l4
loop_1014:
	movl	%xcc,	%i4,	%g6
	edge32	%g4,	%l2,	%i5
	set	0x6A, %l6
	ldsha	[%l7 + %l6] 0x19,	%o7
	addcc	%l5,	0x0DE4,	%i2
	mulx	%o3,	0x0687,	%l0
	tne	%xcc,	0x5
	xnorcc	%g1,	0x13A5,	%o0
	edge16	%g7,	%l1,	%o5
	popc	%g5,	%o6
	bleu,a,pn	%xcc,	loop_1015
	tvs	%xcc,	0x4
	sra	%g2,	%i7,	%i6
	array32	%i1,	%i0,	%i3
loop_1015:
	move	%icc,	%l3,	%o2
	bpos	loop_1016
	tn	%icc,	0x2
	subcc	%l6,	0x0CFB,	%g3
	udivcc	%o1,	0x08EE,	%o4
loop_1016:
	nop
	set	0x28, %l2
	swapa	[%l7 + %l2] 0x81,	%l4
	fcmpes	%fcc3,	%f25,	%f4
	fnands	%f27,	%f12,	%f3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sllx	%g6,	%i4,	%g4
	brz,a	%l2,	loop_1017
	sdiv	%i5,	0x07B1,	%o7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stx	%l5,	[%l7 + 0x60]
loop_1017:
	swap	[%l7 + 0x18],	%i2
	movrlz	%l0,	0x20D,	%o3
	brlz,a	%o0,	loop_1018
	movleu	%icc,	%g7,	%g1
	bl,pt	%xcc,	loop_1019
	movcs	%xcc,	%l1,	%g5
loop_1018:
	movcs	%icc,	%o5,	%g2
	srax	%o6,	0x02,	%i7
loop_1019:
	smulcc	%i6,	0x0041,	%i0
	orn	%i3,	0x0BEE,	%l3
	movneg	%xcc,	%i1,	%o2
	edge8n	%l6,	%g3,	%o4
	fzeros	%f29
	andn	%o1,	%l4,	%i4
	andncc	%g6,	%g4,	%i5
	fabsd	%f18,	%f18
	fmovdvc	%xcc,	%f28,	%f25
	sdivcc	%l2,	0x0B98,	%o7
	set	0x4C, %g7
	lduwa	[%l7 + %g7] 0x88,	%i2
	popc	%l5,	%o3
	mulx	%o0,	%l0,	%g7
	movl	%xcc,	%g1,	%g5
	ldd	[%l7 + 0x20],	%l0
	fmovsg	%xcc,	%f15,	%f6
	popc	%g2,	%o6
	movvc	%xcc,	%o5,	%i6
	ld	[%l7 + 0x2C],	%f10
	subcc	%i7,	%i3,	%i0
	fand	%f2,	%f26,	%f18
	fnor	%f30,	%f28,	%f12
	udivx	%i1,	0x1E3C,	%o2
	wr	%g0,	0x80,	%asi
	ldsba	[%l7 + 0x74] %asi,	%l3
	edge8l	%l6,	%o4,	%g3
	sra	%l4,	%i4,	%o1
	bg,pn	%icc,	loop_1020
	ta	%xcc,	0x1
	fcmple16	%f8,	%f28,	%g6
	fmovspos	%xcc,	%f9,	%f31
loop_1020:
	movn	%xcc,	%i5,	%l2
	alignaddrl	%o7,	%i2,	%l5
	fmovrdne	%g4,	%f22,	%f14
	orcc	%o3,	%l0,	%g7
	edge32	%o0,	%g5,	%g1
	sra	%l1,	0x13,	%o6
	add	%l7,	0x1C,	%l6
	wr	%g0,	0x18,	%asi
	lda	[%l6] %asi,	%o5
	casa	[%l6] %asi,	%o5,	%g2
	popc	0x1710,	%i7
	sdivx	%i6,	0x1ECE,	%i3
	addccc	%i0,	%i1,	%o2
	fmovsn	%xcc,	%f0,	%f5
	set	0x3C, %o2
	swapa	[%l7 + %o2] 0x89,	%l6
	array32	%l3,	%o4,	%g3
	tl	%xcc,	0x0
	fpadd32s	%f23,	%f26,	%f18
	smulcc	%i4,	%l4,	%g6
	edge8n	%i5,	%o1,	%o7
	fblg,a	%fcc1,	loop_1021
	edge8	%i2,	%l5,	%l2
	movl	%xcc,	%o3,	%g4
	fmovrsgz	%g7,	%f14,	%f5
loop_1021:
	fbug,a	%fcc3,	loop_1022
	fpadd32	%f10,	%f18,	%f14
	srl	%l0,	0x0B,	%g5
	bvs	%icc,	loop_1023
loop_1022:
	orcc	%o0,	%l1,	%g1
	add	%o6,	0x1740,	%g2
	tl	%xcc,	0x5
loop_1023:
	bcs,a,pn	%xcc,	loop_1024
	tne	%icc,	0x4
	fmovsl	%icc,	%f14,	%f10
	edge8ln	%o5,	%i7,	%i6
loop_1024:
	sdivx	%i3,	0x1348,	%i0
	fmovsgu	%icc,	%f8,	%f21
	te	%icc,	0x3
	sethi	0x0C6D,	%o2
	edge8	%l6,	%i1,	%o4
	movneg	%icc,	%l3,	%i4
	alignaddr	%l4,	%g6,	%i5
	tneg	%icc,	0x7
	set	0x50, %l3
	swapa	[%l7 + %l3] 0x89,	%o1
	fornot1s	%f4,	%f10,	%f19
	edge32n	%g3,	%i2,	%o7
	array16	%l2,	%o3,	%l5
	brlz,a	%g7,	loop_1025
	tgu	%icc,	0x2
	sethi	0x08D0,	%g4
	fabss	%f22,	%f1
loop_1025:
	umulcc	%g5,	0x1BBF,	%o0
	ldsb	[%l7 + 0x0F],	%l1
	udivcc	%l0,	0x1001,	%o6
	edge8l	%g1,	%g2,	%i7
	wr	%g0,	0x04,	%asi
	stba	%i6,	[%l7 + 0x70] %asi
	edge16n	%i3,	%i0,	%o2
	tcc	%icc,	0x3
	tleu	%icc,	0x4
	movl	%xcc,	%l6,	%o5
	edge32ln	%i1,	%o4,	%i4
	subccc	%l3,	0x0C60,	%l4
	umul	%g6,	%i5,	%o1
	umul	%i2,	%g3,	%l2
	fpadd32s	%f26,	%f4,	%f1
	fbule	%fcc3,	loop_1026
	fpack16	%f0,	%f11
	and	%o7,	0x15AE,	%o3
	tne	%icc,	0x0
loop_1026:
	tcc	%xcc,	0x3
	movneg	%icc,	%l5,	%g4
	set	0x58, %l0
	stda	%g6,	[%l7 + %l0] 0x23
	membar	#Sync
	fexpand	%f6,	%f18
	movgu	%xcc,	%g5,	%o0
	udivcc	%l0,	0x0C58,	%o6
	movl	%icc,	%l1,	%g2
	movvc	%xcc,	%i7,	%g1
	brlez	%i6,	loop_1027
	movrne	%i3,	0x32D,	%o2
	movg	%xcc,	%l6,	%o5
	edge8n	%i0,	%i1,	%o4
loop_1027:
	fxnor	%f18,	%f30,	%f4
	fornot1	%f30,	%f2,	%f8
	fmovrslez	%i4,	%f15,	%f19
	wr	%g0,	0x19,	%asi
	swapa	[%l7 + 0x44] %asi,	%l3
	bvs,a,pn	%icc,	loop_1028
	smul	%g6,	%i5,	%l4
	fbge	%fcc0,	loop_1029
	movpos	%xcc,	%i2,	%g3
loop_1028:
	fmovdn	%icc,	%f9,	%f30
	fmovdcs	%icc,	%f6,	%f4
loop_1029:
	fpsub32s	%f28,	%f24,	%f26
	udiv	%o1,	0x1881,	%o7
	edge16l	%o3,	%l5,	%g4
	tvc	%icc,	0x3
	std	%g6,	[%l7 + 0x10]
	fmovsneg	%icc,	%f5,	%f19
	fmul8x16au	%f12,	%f26,	%f8
	fbul,a	%fcc1,	loop_1030
	tn	%icc,	0x7
	fpsub16	%f22,	%f18,	%f18
	fand	%f18,	%f28,	%f12
loop_1030:
	fmul8ulx16	%f8,	%f20,	%f20
	alignaddr	%l2,	%g5,	%l0
	tgu	%icc,	0x1
	ble	%xcc,	loop_1031
	tcc	%icc,	0x2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32ln	%o6,	%l1,	%o0
loop_1031:
	fpadd32s	%f4,	%f3,	%f26
	fxnor	%f6,	%f24,	%f14
	xorcc	%g2,	0x0250,	%g1
	smul	%i7,	%i6,	%i3
	fbn	%fcc2,	loop_1032
	bn,a,pt	%xcc,	loop_1033
	fbe,a	%fcc2,	loop_1034
	st	%f24,	[%l7 + 0x54]
loop_1032:
	udivcc	%o2,	0x0FD4,	%l6
loop_1033:
	fmovdn	%icc,	%f20,	%f4
loop_1034:
	mulscc	%o5,	%i1,	%i0
	movneg	%icc,	%i4,	%l3
	fmovdneg	%icc,	%f14,	%f19
	add	%l7,	0x48,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] %asi,	%o4,	%i5
	tl	%xcc,	0x1
	fmovdgu	%xcc,	%f18,	%f2
	orcc	%g6,	0x1113,	%i2
	sir	0x10DC
	wr	%g0,	0x88,	%asi
	ldswa	[%l7 + 0x34] %asi,	%l4
	array16	%o1,	%g3,	%o7
	orcc	%l5,	%o3,	%g7
	add	%l7,	0x18,	%l6
	wr	%g0,	0x18,	%asi
	casxa	[%l6] 0x18,	%g4,	%g5
	fmul8x16	%f16,	%f28,	%f8
	fandnot2	%f12,	%f30,	%f16
	fba,a	%fcc1,	loop_1035
	tvs	%icc,	0x4
	fmovsg	%xcc,	%f4,	%f13
	fmovrsgez	%l2,	%f19,	%f29
loop_1035:
	udivcc	%l0,	0x052D,	%o6
	movre	%o0,	0x054,	%l1
	edge8l	%g2,	%i7,	%i6
	movrgz	%g1,	0x0C2,	%i3
	edge32ln	%o2,	%o5,	%l6
	array32	%i1,	%i4,	%i0
	taddcctv	%l3,	%o4,	%g6
	fxor	%f20,	%f16,	%f0
	array32	%i2,	%l4,	%i5
	fbe	%fcc2,	loop_1036
	movg	%xcc,	%g3,	%o7
	bcc,a	loop_1037
	fandnot1s	%f2,	%f10,	%f12
loop_1036:
	umul	%l5,	0x17B8,	%o1
	fcmpeq16	%f14,	%f12,	%g7
loop_1037:
	fmovsgu	%xcc,	%f22,	%f13
	fbn,a	%fcc3,	loop_1038
	edge8l	%g4,	%o3,	%g5
	tneg	%xcc,	0x0
	alignaddr	%l2,	%o6,	%o0
loop_1038:
	fandnot2	%f0,	%f12,	%f28
	std	%f0,	[%l7 + 0x60]
	alignaddrl	%l1,	%l0,	%i7
	sir	0x0989
	srax	%g2,	%g1,	%i6
	udivcc	%i3,	0x160D,	%o2
	fmovrsgz	%o5,	%f21,	%f23
	movcc	%icc,	%i1,	%i4
	movvs	%icc,	%i0,	%l3
	wr	%g0,	0x2a,	%asi
	stba	%o4,	[%l7 + 0x0C] %asi
	membar	#Sync
	fmul8ulx16	%f4,	%f6,	%f22
	fmovdl	%xcc,	%f9,	%f4
	movcc	%icc,	%g6,	%l6
	fones	%f24
	subccc	%l4,	0x0B5C,	%i5
	fmul8x16	%f10,	%f14,	%f2
	orn	%g3,	0x0225,	%o7
	flush	%l7 + 0x70
	bgu,pn	%xcc,	loop_1039
	fzeros	%f20
	bl,pn	%xcc,	loop_1040
	movcc	%xcc,	%i2,	%o1
loop_1039:
	sdivx	%l5,	0x04A6,	%g4
	andcc	%o3,	%g7,	%g5
loop_1040:
	fmuld8sux16	%f20,	%f28,	%f22
	ble,a	loop_1041
	mova	%xcc,	%o6,	%o0
	wr	%g0,	0x2a,	%asi
	stxa	%l2,	[%l7 + 0x10] %asi
	membar	#Sync
loop_1041:
	srax	%l1,	0x06,	%i7
	fbul	%fcc0,	loop_1042
	bshuffle	%f12,	%f4,	%f14
	fmovrdlez	%g2,	%f16,	%f30
	edge8n	%g1,	%l0,	%i6
loop_1042:
	fmovsn	%xcc,	%f29,	%f9
	array16	%o2,	%o5,	%i1
	fnot2s	%f26,	%f13
	fmovdn	%xcc,	%f25,	%f24
	xnor	%i4,	%i0,	%l3
	membar	0x42
	fbug,a	%fcc0,	loop_1043
	xnorcc	%i3,	0x0932,	%g6
	orncc	%l6,	0x0CF2,	%l4
	ta	%icc,	0x6
loop_1043:
	fble	%fcc2,	loop_1044
	edge16n	%o4,	%i5,	%o7
	udivcc	%i2,	0x1793,	%g3
	subc	%o1,	%l5,	%o3
loop_1044:
	movl	%icc,	%g7,	%g4
	set	0x44, %g1
	stha	%g5,	[%l7 + %g1] 0x19
	mulx	%o0,	%o6,	%l2
	move	%xcc,	%i7,	%l1
	tle	%xcc,	0x2
	movvc	%xcc,	%g2,	%g1
	fble	%fcc0,	loop_1045
	fmuld8ulx16	%f11,	%f13,	%f14
	movneg	%xcc,	%l0,	%i6
	tl	%xcc,	0x0
loop_1045:
	movl	%xcc,	%o5,	%o2
	fcmpd	%fcc3,	%f22,	%f24
	edge8l	%i4,	%i0,	%l3
	edge16l	%i3,	%i1,	%g6
	fbge,a	%fcc2,	loop_1046
	bne,pt	%icc,	loop_1047
	stw	%l6,	[%l7 + 0x64]
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1046:
	edge32n	%o4,	%l4,	%o7
loop_1047:
	tg	%xcc,	0x6
	bcs,pt	%xcc,	loop_1048
	tge	%xcc,	0x6
	tcs	%xcc,	0x4
	bpos	%icc,	loop_1049
loop_1048:
	brlz,a	%i2,	loop_1050
	fbge,a	%fcc1,	loop_1051
	xor	%i5,	0x1163,	%g3
loop_1049:
	tvc	%xcc,	0x3
loop_1050:
	movpos	%icc,	%l5,	%o1
loop_1051:
	ldstub	[%l7 + 0x3D],	%g7
	fandnot1	%f26,	%f22,	%f4
	tge	%xcc,	0x5
	wr	%g0,	0x11,	%asi
	lda	[%l7 + 0x3C] %asi,	%f3
	fmovspos	%icc,	%f1,	%f15
	array8	%g4,	%g5,	%o3
	edge16n	%o0,	%o6,	%i7
	alignaddr	%l2,	%g2,	%l1
	sra	%l0,	0x04,	%g1
	set	0x40, %i6
	ldda	[%l7 + %i6] 0x04,	%f16
	brlez	%i6,	loop_1052
	sdivcc	%o2,	0x14A5,	%i4
	fnors	%f26,	%f28,	%f22
	addccc	%i0,	%l3,	%i3
loop_1052:
	array8	%o5,	%i1,	%l6
	nop
	setx loop_1053, %l0, %l1
	jmpl %l1, %g6
	xorcc	%l4,	%o4,	%i2
	brnz,a	%i5,	loop_1054
	tleu	%icc,	0x4
loop_1053:
	umul	%o7,	0x0DB4,	%l5
	fpadd32	%f6,	%f10,	%f22
loop_1054:
	ldd	[%l7 + 0x78],	%f16
	sdivx	%o1,	0x017A,	%g3
	andn	%g7,	%g5,	%g4
	fmovspos	%icc,	%f16,	%f24
	set	0x30, %i2
	stda	%o2,	[%l7 + %i2] 0x27
	membar	#Sync
	fandnot2s	%f8,	%f27,	%f22
	fmovsne	%xcc,	%f17,	%f18
	sub	%o0,	%o6,	%i7
	addc	%g2,	0x079D,	%l2
	tsubcc	%l0,	0x1FBB,	%l1
	xnor	%i6,	%o2,	%i4
	andncc	%i0,	%l3,	%g1
	edge16	%i3,	%i1,	%o5
	fmovrdgz	%l6,	%f8,	%f4
	fmovsge	%xcc,	%f2,	%f22
	addc	%g6,	0x08E0,	%o4
	sll	%l4,	%i5,	%i2
	orcc	%o7,	0x016A,	%l5
	fmovrsne	%o1,	%f25,	%f14
	movrlez	%g3,	0x10A,	%g5
	tne	%icc,	0x2
	swap	[%l7 + 0x54],	%g4
	set	0x54, %l1
	swapa	[%l7 + %l1] 0x0c,	%o3
	membar	#Sync
	set	0x40, %i5
	ldda	[%l7 + %i5] 0xf1,	%f0
	fmovsneg	%icc,	%f15,	%f13
	fbul	%fcc3,	loop_1055
	popc	%o0,	%o6
	edge16ln	%g7,	%g2,	%i7
	tn	%icc,	0x4
loop_1055:
	movge	%xcc,	%l2,	%l1
	srl	%l0,	%o2,	%i4
	brgz,a	%i0,	loop_1056
	edge32n	%l3,	%g1,	%i3
	bvc	%xcc,	loop_1057
	subccc	%i6,	0x1B53,	%i1
loop_1056:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subcc	%l6,	%o5,	%o4
loop_1057:
	tvs	%icc,	0x4
	edge8ln	%g6,	%i5,	%i2
	andncc	%l4,	%l5,	%o7
	andcc	%o1,	%g5,	%g4
	movcs	%icc,	%o3,	%g3
	fmovdne	%icc,	%f2,	%f28
	umul	%o0,	%o6,	%g7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xor	%i7,	0x17DC,	%g2
	bge,a,pn	%icc,	loop_1058
	fnot1s	%f15,	%f28
	umul	%l1,	%l0,	%o2
	edge8	%l2,	%i0,	%l3
loop_1058:
	nop
	wr	%g0,	0x89,	%asi
	lduha	[%l7 + 0x0E] %asi,	%i4
	subc	%i3,	0x199B,	%i6
	tgu	%icc,	0x3
	sdivcc	%g1,	0x1FDD,	%l6
	edge8	%o5,	%i1,	%o4
	fble	%fcc3,	loop_1059
	movpos	%xcc,	%g6,	%i5
	swap	[%l7 + 0x6C],	%l4
	fpsub32	%f0,	%f8,	%f18
loop_1059:
	edge8ln	%l5,	%o7,	%i2
	movn	%icc,	%o1,	%g4
	fmovrsne	%o3,	%f9,	%f31
	movn	%icc,	%g5,	%o0
	fmovrdlez	%o6,	%f26,	%f10
	movg	%icc,	%g7,	%g3
	fmovdneg	%xcc,	%f18,	%f19
	tcc	%icc,	0x3
	fmovdleu	%xcc,	%f27,	%f15
	subccc	%g2,	%l1,	%i7
	bneg	loop_1060
	fnands	%f18,	%f8,	%f2
	wr	%g0,	0x04,	%asi
	stha	%l0,	[%l7 + 0x68] %asi
loop_1060:
	edge16l	%l2,	%o2,	%l3
	tleu	%xcc,	0x3
	ta	%icc,	0x6
	fblg	%fcc1,	loop_1061
	edge32ln	%i0,	%i4,	%i3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tg	%icc,	0x7
loop_1061:
	ldstub	[%l7 + 0x0B],	%i6
	tsubcc	%l6,	%o5,	%i1
	xor	%g1,	0x0132,	%g6
	fpsub16	%f8,	%f14,	%f2
	sllx	%o4,	%l4,	%i5
	brz	%o7,	loop_1062
	edge16ln	%l5,	%o1,	%g4
	wr	%g0,	0x2f,	%asi
	ldda	[%l7 + 0x30] %asi,	%o2
loop_1062:
	ba	loop_1063
	ble,a,pt	%xcc,	loop_1064
	fsrc1	%f4,	%f22
	array32	%g5,	%i2,	%o6
loop_1063:
	tle	%xcc,	0x7
loop_1064:
	movneg	%xcc,	%g7,	%o0
	fmovsleu	%icc,	%f9,	%f16
	xnorcc	%g2,	%l1,	%g3
	tpos	%icc,	0x6
	subcc	%i7,	0x1269,	%l0
	wr	%g0,	0x88,	%asi
	ldstuba	[%l7 + 0x6D] %asi,	%o2
	tvc	%icc,	0x4
	bl	loop_1065
	tpos	%xcc,	0x3
	array8	%l2,	%l3,	%i0
	sll	%i4,	0x09,	%i3
loop_1065:
	movrgz	%l6,	0x181,	%o5
	wr	%g0,	0x04,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	fmovrdlez	%i1,	%f6,	%f6
	add	%l7,	0x68,	%l6
	wr	%g0,	0x10,	%asi
	ldxa	[%l6] %asi,	%i6
	casxa	[%l6] %asi,	%i6,	%g6
	bpos,pn	%icc,	loop_1066
	bleu,pt	%icc,	loop_1067
	fbu	%fcc0,	loop_1068
	mova	%icc,	%g1,	%o4
loop_1066:
	nop
	set	0x58, %o7
	std	%f0,	[%l7 + %o7]
loop_1067:
	fandnot2s	%f11,	%f2,	%f22
loop_1068:
	movrlz	%l4,	%o7,	%i5
	fbn	%fcc0,	loop_1069
	fmovsleu	%xcc,	%f25,	%f20
	fble	%fcc0,	loop_1070
	tne	%xcc,	0x5
loop_1069:
	taddcctv	%o1,	%g4,	%l5
	bgu,pn	%xcc,	loop_1071
loop_1070:
	fbge,a	%fcc1,	loop_1072
	movneg	%xcc,	%g5,	%o3
	fmovrdgz	%i2,	%f12,	%f14
loop_1071:
	fba,a	%fcc0,	loop_1073
loop_1072:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrlez	%o6,	0x1B6,	%o0
	orncc	%g2,	%g7,	%g3
loop_1073:
	and	%l1,	%i7,	%o2
	set	0x64, %o0
	lduwa	[%l7 + %o0] 0x04,	%l2
	subccc	%l0,	%i0,	%i4
	movn	%icc,	%l3,	%l6
	set	0x28, %o4
	stda	%o4,	[%l7 + %o4] 0x89
	tcc	%xcc,	0x2
	fmovrdgez	%i1,	%f18,	%f22
	movle	%xcc,	%i6,	%g6
	taddcctv	%i3,	0x0FF6,	%g1
	udivx	%o4,	0x0FC1,	%l4
	nop
	set	0x10, %o5
	ldd	[%l7 + %o5],	%f26
	mova	%icc,	%o7,	%o1
	wr	%g0,	0x0c,	%asi
	stba	%i5,	[%l7 + 0x14] %asi
	andcc	%l5,	%g4,	%o3
	fbge,a	%fcc1,	loop_1074
	edge32l	%g5,	%i2,	%o0
	brnz	%g2,	loop_1075
	movg	%icc,	%g7,	%g3
loop_1074:
	array32	%l1,	%o6,	%i7
	tl	%xcc,	0x5
loop_1075:
	edge32ln	%o2,	%l0,	%l2
	bneg	%icc,	loop_1076
	movcs	%xcc,	%i0,	%i4
	andn	%l3,	0x0B96,	%l6
	lduh	[%l7 + 0x3A],	%o5
loop_1076:
	tne	%icc,	0x1
	edge8ln	%i6,	%g6,	%i3
	orncc	%i1,	0x031B,	%o4
	smul	%g1,	%l4,	%o1
	srl	%i5,	%o7,	%l5
	mulx	%g4,	%o3,	%i2
	fandnot1	%f20,	%f28,	%f30
	addccc	%g5,	0x075E,	%o0
	addccc	%g2,	%g3,	%l1
	ba,a,pn	%xcc,	loop_1077
	fones	%f23
	wr	%g0,	0x80,	%asi
	ldxa	[%l7 + 0x60] %asi,	%g7
loop_1077:
	tcc	%xcc,	0x7
	edge16ln	%i7,	%o2,	%o6
	movpos	%icc,	%l2,	%i0
	array32	%i4,	%l3,	%l6
	tvs	%xcc,	0x1
	fmovd	%f2,	%f10
	brnz	%o5,	loop_1078
	movl	%xcc,	%i6,	%g6
	udivcc	%l0,	0x14B8,	%i1
	wr	%g0,	0x18,	%asi
	ldsha	[%l7 + 0x1E] %asi,	%i3
loop_1078:
	brlz	%o4,	loop_1079
	xor	%g1,	%o1,	%i5
	fmovsvs	%xcc,	%f8,	%f24
	move	%icc,	%l4,	%l5
loop_1079:
	movne	%icc,	%o7,	%o3
	fpsub32s	%f21,	%f30,	%f30
	mulx	%i2,	0x1C59,	%g4
	te	%icc,	0x6
	andncc	%g5,	%g2,	%g3
	andncc	%o0,	%l1,	%g7
	fbug,a	%fcc0,	loop_1080
	ldub	[%l7 + 0x7F],	%i7
	edge16n	%o2,	%o6,	%l2
	tcc	%xcc,	0x6
loop_1080:
	movl	%xcc,	%i0,	%i4
	fbule,a	%fcc1,	loop_1081
	movn	%xcc,	%l6,	%o5
	tgu	%icc,	0x5
	smulcc	%l3,	%g6,	%i6
loop_1081:
	fandnot2s	%f20,	%f19,	%f3
	edge32ln	%i1,	%l0,	%i3
	flush	%l7 + 0x60
	fors	%f3,	%f23,	%f16
	fcmple16	%f20,	%f10,	%o4
	xnorcc	%o1,	0x19CC,	%g1
	set	0x5C, %l5
	ldsha	[%l7 + %l5] 0x10,	%l4
	movrlz	%i5,	%o7,	%o3
	bneg,pn	%icc,	loop_1082
	tle	%icc,	0x1
	fbug,a	%fcc2,	loop_1083
	fbl,a	%fcc3,	loop_1084
loop_1082:
	taddcctv	%l5,	%i2,	%g5
	xor	%g4,	0x015C,	%g2
loop_1083:
	edge32l	%g3,	%l1,	%g7
loop_1084:
	fbl	%fcc2,	loop_1085
	sub	%o0,	%o2,	%o6
	fbu,a	%fcc3,	loop_1086
	srax	%i7,	%l2,	%i0
loop_1085:
	fmovde	%icc,	%f25,	%f16
	set	0x30, %i0
	ldda	[%l7 + %i0] 0x27,	%i6
loop_1086:
	ta	%icc,	0x7
	umul	%o5,	0x1652,	%i4
	fnot2	%f28,	%f14
	srlx	%l3,	0x15,	%i6
	ble	loop_1087
	tge	%xcc,	0x4
	movvc	%xcc,	%i1,	%l0
	alignaddr	%g6,	%i3,	%o1
loop_1087:
	udiv	%g1,	0x1811,	%o4
	tvc	%icc,	0x4
	andncc	%i5,	%o7,	%o3
	be	%icc,	loop_1088
	sdivx	%l4,	0x0D8D,	%l5
	fxors	%f19,	%f31,	%f3
	tsubcc	%i2,	0x12D5,	%g5
loop_1088:
	fble	%fcc1,	loop_1089
	tcs	%icc,	0x2
	sllx	%g4,	%g2,	%l1
	movrne	%g7,	%o0,	%o2
loop_1089:
	bneg,a	%icc,	loop_1090
	nop
	setx	loop_1091,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	bg,a,pt	%xcc,	loop_1092
	smulcc	%g3,	%o6,	%i7
loop_1090:
	xnorcc	%l2,	%i0,	%l6
loop_1091:
	membar	0x11
loop_1092:
	bpos,a	loop_1093
	tneg	%xcc,	0x2
	fbul,a	%fcc0,	loop_1094
	andncc	%i4,	%o5,	%i6
loop_1093:
	movrgez	%l3,	%i1,	%l0
	ba	loop_1095
loop_1094:
	ble	%xcc,	loop_1096
	orn	%g6,	%i3,	%g1
	nop
	set	0x50, %g5
	std	%f14,	[%l7 + %g5]
loop_1095:
	andncc	%o4,	%o1,	%o7
loop_1096:
	fcmple16	%f28,	%f10,	%o3
	wr	%g0,	0x80,	%asi
	ldxa	[%l7 + 0x20] %asi,	%l4
	popc	0x186A,	%i5
	edge8	%l5,	%i2,	%g5
	tcs	%icc,	0x0
	bshuffle	%f8,	%f26,	%f30
	fmovdneg	%xcc,	%f1,	%f10
	mulx	%g2,	%g4,	%l1
	umulcc	%g7,	0x043C,	%o0
	movpos	%xcc,	%g3,	%o2
	movrgz	%o6,	%i7,	%i0
	fnands	%f23,	%f18,	%f29
	swap	[%l7 + 0x70],	%l6
	edge32l	%i4,	%o5,	%i6
	subccc	%l3,	%i1,	%l2
	tn	%icc,	0x3
	popc	%l0,	%g6
	brlz	%i3,	loop_1097
	fmovrsne	%o4,	%f14,	%f3
	fornot1	%f22,	%f20,	%f16
	tl	%icc,	0x0
loop_1097:
	movle	%xcc,	%g1,	%o1
	fands	%f31,	%f24,	%f12
	movne	%icc,	%o7,	%o3
	taddcctv	%i5,	0x092E,	%l4
	brlz,a	%i2,	loop_1098
	or	%l5,	0x1A2C,	%g5
	tn	%icc,	0x3
	array16	%g4,	%g2,	%l1
loop_1098:
	movge	%xcc,	%g7,	%g3
	fbg	%fcc3,	loop_1099
	sethi	0x0693,	%o2
	brlez	%o0,	loop_1100
	sdiv	%o6,	0x016E,	%i0
loop_1099:
	xnor	%i7,	%l6,	%i4
	membar	0x24
loop_1100:
	subccc	%o5,	%l3,	%i1
	tsubcc	%i6,	%l2,	%g6
	movrgz	%l0,	0x2CB,	%i3
	set	0x70, %o3
	prefetcha	[%l7 + %o3] 0x89,	 0x1
	fandnot2s	%f14,	%f8,	%f6
	tleu	%xcc,	0x3
	mova	%xcc,	%o4,	%o1
	te	%xcc,	0x1
	edge16ln	%o3,	%i5,	%l4
	bleu	loop_1101
	or	%o7,	0x13AC,	%i2
	sll	%g5,	0x07,	%l5
	movrne	%g4,	%l1,	%g2
loop_1101:
	edge32l	%g7,	%g3,	%o2
	fnot1s	%f28,	%f12
	srl	%o6,	%o0,	%i0
	movrgez	%i7,	%l6,	%o5
	edge32n	%i4,	%l3,	%i1
	sra	%i6,	%l2,	%l0
	movcs	%xcc,	%i3,	%g1
	std	%f8,	[%l7 + 0x70]
	array8	%o4,	%g6,	%o1
	fmuld8sux16	%f18,	%f27,	%f12
	movneg	%icc,	%i5,	%o3
	tvs	%icc,	0x3
	andncc	%o7,	%l4,	%g5
	fpsub16	%f2,	%f30,	%f6
	edge32l	%i2,	%l5,	%l1
	set	0x58, %g2
	ldswa	[%l7 + %g2] 0x15,	%g2
	addccc	%g7,	0x1526,	%g4
	or	%g3,	%o2,	%o0
	bge,a,pn	%xcc,	loop_1102
	addccc	%i0,	0x1548,	%i7
	bcc,a,pn	%xcc,	loop_1103
	edge8	%o6,	%l6,	%o5
loop_1102:
	alignaddr	%l3,	%i1,	%i4
	fnot1s	%f1,	%f10
loop_1103:
	edge32	%i6,	%l2,	%l0
	tcc	%icc,	0x5
	mulscc	%i3,	%g1,	%o4
	mulscc	%o1,	0x0553,	%i5
	wr	%g0,	0x88,	%asi
	ldstuba	[%l7 + 0x10] %asi,	%g6
	fmovdg	%icc,	%f12,	%f25
	addcc	%o3,	0x00F0,	%l4
	membar	0x14
	add	%l7,	0x54,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%o7
	casa	[%l6] 0x89,	%o7,	%i2
	xnor	%l5,	%l1,	%g2
	udiv	%g5,	0x0F56,	%g4
	fornot2	%f16,	%f22,	%f4
	movvc	%xcc,	%g3,	%g7
	sll	%o0,	0x01,	%o2
	andcc	%i0,	0x0EB7,	%i7
	mova	%xcc,	%l6,	%o5
	udiv	%l3,	0x0D4A,	%i1
	edge32	%o6,	%i4,	%l2
	sub	%l0,	0x162F,	%i3
	movgu	%icc,	%g1,	%o4
	tle	%icc,	0x3
	sdivx	%i6,	0x0296,	%o1
	fbo	%fcc0,	loop_1104
	mulscc	%g6,	0x087C,	%o3
	wr	%g0,	0x18,	%asi
	ldstuba	[%l7 + 0x4B] %asi,	%l4
loop_1104:
	fcmpeq32	%f16,	%f8,	%o7
	subc	%i2,	0x0D09,	%i5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sethi	0x159E,	%l5
	fbug,a	%fcc0,	loop_1105
	faligndata	%f8,	%f18,	%f14
	tg	%icc,	0x2
	movcs	%xcc,	%g2,	%g5
loop_1105:
	movcs	%xcc,	%g4,	%l1
	fbn	%fcc2,	loop_1106
	movre	%g3,	%g7,	%o0
	taddcc	%i0,	0x01F5,	%i7
	nop
	set	0x40, %i4
	ldx	[%l7 + %i4],	%o2
loop_1106:
	mulscc	%o5,	%l6,	%i1
	array8	%l3,	%o6,	%i4
	wr	%g0,	0x81,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	tvs	%xcc,	0x2
	fnors	%f19,	%f17,	%f31
	movpos	%icc,	%l2,	%l0
	movvs	%icc,	%g1,	%o4
	tcs	%icc,	0x1
	fornot1	%f0,	%f24,	%f28
	fabsd	%f14,	%f22
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fandnot2	%f22,	%f6,	%f8
	movge	%xcc,	%i6,	%i3
	popc	%g6,	%o3
	udivcc	%o1,	0x0AC6,	%l4
	fmovscc	%icc,	%f10,	%f21
	mulx	%i2,	0x1497,	%o7
	edge16n	%i5,	%g2,	%g5
	taddcctv	%l5,	%l1,	%g3
	edge32	%g4,	%o0,	%i0
	fnand	%f2,	%f0,	%f28
	edge16ln	%g7,	%i7,	%o5
	bleu,a,pn	%xcc,	loop_1107
	brnz	%l6,	loop_1108
	move	%icc,	%i1,	%l3
	nop
	setx loop_1109, %l0, %l1
	jmpl %l1, %o2
loop_1107:
	sethi	0x03AC,	%i4
loop_1108:
	ldsb	[%l7 + 0x6B],	%o6
	fzeros	%f26
loop_1109:
	edge16ln	%l2,	%g1,	%o4
	fmuld8ulx16	%f26,	%f28,	%f18
	sethi	0x0349,	%l0
	udivx	%i3,	0x1915,	%i6
	sub	%o3,	%g6,	%l4
	fba,a	%fcc2,	loop_1110
	fbo	%fcc1,	loop_1111
	sra	%o1,	0x0C,	%o7
	sdivcc	%i5,	0x12B4,	%i2
loop_1110:
	and	%g2,	%g5,	%l1
loop_1111:
	andn	%l5,	%g3,	%o0
	tneg	%icc,	0x1
	movrlz	%g4,	0x213,	%i0
	wr	%g0,	0x19,	%asi
	sta	%f18,	[%l7 + 0x2C] %asi
	smulcc	%i7,	0x1AA2,	%o5
	fzeros	%f21
	edge8n	%l6,	%g7,	%l3
	nop
	set	0x60, %g4
	std	%o2,	[%l7 + %g4]
	tgu	%icc,	0x4
	edge32l	%i1,	%o6,	%l2
	fone	%f2
	fmovsleu	%xcc,	%f25,	%f12
	bvc,a,pn	%xcc,	loop_1112
	stw	%g1,	[%l7 + 0x44]
	array32	%i4,	%o4,	%i3
	edge8ln	%i6,	%l0,	%g6
loop_1112:
	andcc	%l4,	0x15EE,	%o3
	movrlez	%o7,	%o1,	%i5
	fmovrsgez	%g2,	%f22,	%f4
	movg	%xcc,	%g5,	%i2
	be,pn	%icc,	loop_1113
	array8	%l5,	%l1,	%g3
	edge8n	%o0,	%g4,	%i7
	edge8	%o5,	%l6,	%i0
loop_1113:
	movle	%xcc,	%g7,	%o2
	edge32n	%l3,	%o6,	%l2
	tg	%xcc,	0x6
	fone	%f28
	ldsw	[%l7 + 0x18],	%g1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdiv	%i4,	0x1E1D,	%i1
	fmovscc	%icc,	%f6,	%f22
	te	%xcc,	0x3
	alignaddr	%i3,	%i6,	%o4
	movne	%xcc,	%g6,	%l0
	fmovsvc	%xcc,	%f22,	%f19
	swap	[%l7 + 0x28],	%o3
	ble,a,pn	%icc,	loop_1114
	andncc	%o7,	%l4,	%o1
	fors	%f10,	%f8,	%f31
	tsubcctv	%i5,	%g2,	%g5
loop_1114:
	edge32n	%l5,	%l1,	%g3
	wr	%g0,	0x80,	%asi
	lduba	[%l7 + 0x2B] %asi,	%i2
	alignaddr	%g4,	%i7,	%o0
	movn	%xcc,	%l6,	%o5
	fpadd16	%f24,	%f6,	%f30
	membar	0x14
	brgez	%g7,	loop_1115
	ble,a	loop_1116
	movpos	%icc,	%i0,	%l3
	tne	%icc,	0x0
loop_1115:
	fone	%f26
loop_1116:
	tn	%icc,	0x7
	movg	%xcc,	%o2,	%l2
	wr	%g0,	0x04,	%asi
	prefetcha	[%l7 + 0x28] %asi,	 0x3
	fbu,a	%fcc1,	loop_1117
	brgz	%i4,	loop_1118
	swap	[%l7 + 0x64],	%i1
	fbul	%fcc0,	loop_1119
loop_1117:
	fmovsleu	%icc,	%f12,	%f30
loop_1118:
	nop
	set	0x38, %g3
	stda	%i2,	[%l7 + %g3] 0xe2
	membar	#Sync
loop_1119:
	xorcc	%g1,	%i6,	%o4
	fbe	%fcc0,	loop_1120
	movcs	%icc,	%g6,	%l0
	move	%xcc,	%o7,	%o3
	addcc	%o1,	0x05D3,	%l4
loop_1120:
	tneg	%icc,	0x7
	tvc	%xcc,	0x3
	sdiv	%g2,	0x0718,	%g5
	movge	%icc,	%l5,	%l1
	array16	%g3,	%i2,	%g4
	edge8ln	%i5,	%o0,	%l6
	subccc	%i7,	%g7,	%i0
	fxors	%f30,	%f20,	%f2
	fornot1	%f24,	%f4,	%f14
	fcmpne16	%f10,	%f20,	%o5
	fpack16	%f0,	%f28
	fbue,a	%fcc2,	loop_1121
	movre	%l3,	0x043,	%o2
	edge8n	%o6,	%i4,	%l2
	fcmple16	%f4,	%f10,	%i3
loop_1121:
	edge32l	%i1,	%i6,	%g1
	array32	%g6,	%o4,	%o7
	ldd	[%l7 + 0x20],	%f18
	popc	%o3,	%o1
	edge8n	%l0,	%l4,	%g5
	umul	%l5,	0x1020,	%g2
	or	%g3,	0x1A09,	%l1
	fnot1	%f24,	%f8
	sll	%i2,	0x06,	%g4
	set	0x18, %l4
	stda	%i4,	[%l7 + %l4] 0x14
	and	%o0,	0x1CBB,	%l6
	fmovrde	%i7,	%f16,	%f26
	fmovsvs	%icc,	%f9,	%f18
	movge	%xcc,	%g7,	%i0
	tleu	%icc,	0x4
	fands	%f5,	%f18,	%f9
	sdiv	%o5,	0x1905,	%o2
	umul	%o6,	%i4,	%l3
	addccc	%l2,	0x16A3,	%i1
	addcc	%i6,	0x12C4,	%g1
	and	%i3,	%o4,	%o7
	fandnot2s	%f29,	%f19,	%f12
	fmovrde	%o3,	%f22,	%f14
	fmovrdlez	%g6,	%f26,	%f26
	ba	%xcc,	loop_1122
	stx	%o1,	[%l7 + 0x60]
	sra	%l4,	0x11,	%l0
	fcmpd	%fcc3,	%f2,	%f30
loop_1122:
	movvc	%xcc,	%g5,	%l5
	movcc	%xcc,	%g3,	%g2
	sdiv	%l1,	0x02EF,	%i2
	bn,pt	%xcc,	loop_1123
	fmuld8ulx16	%f11,	%f16,	%f16
	edge8l	%i5,	%g4,	%o0
	fxnors	%f26,	%f19,	%f13
loop_1123:
	fba,a	%fcc3,	loop_1124
	tne	%icc,	0x3
	andcc	%i7,	0x0101,	%l6
	tneg	%xcc,	0x2
loop_1124:
	udivcc	%i0,	0x13BB,	%g7
	movneg	%xcc,	%o2,	%o5
	bpos,pn	%xcc,	loop_1125
	fbe,a	%fcc1,	loop_1126
	fcmpeq16	%f2,	%f10,	%o6
	tle	%xcc,	0x2
loop_1125:
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
loop_1126:
	fmovdvc	%icc,	%f6,	%f27
	addcc	%l3,	0x089C,	%i4
	sub	%l2,	0x133F,	%i6
loop_1127:
	xnorcc	%g1,	%i1,	%i3
	fsrc2s	%f3,	%f22
	udivcc	%o4,	0x17DA,	%o7
	addcc	%o3,	0x1410,	%o1
	fsrc2	%f18,	%f30
	sth	%l4,	[%l7 + 0x60]
	smulcc	%l0,	%g6,	%l5
	or	%g5,	0x1B32,	%g3
	fmovdn	%xcc,	%f17,	%f6
	andn	%l1,	0x0DDF,	%g2
	umulcc	%i2,	0x0647,	%g4
	mova	%xcc,	%i5,	%i7
	fmovsgu	%icc,	%f22,	%f5
	addc	%l6,	%i0,	%g7
	movleu	%xcc,	%o2,	%o0
	add	%l7,	0x6C,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%o5
	casa	[%l6] 0x80,	%o5,	%l3
	fpack32	%f2,	%f16,	%f10
	addcc	%i4,	%l2,	%o6
	sub	%i6,	%i1,	%g1
	movrgez	%o4,	0x3A0,	%o7
	tpos	%xcc,	0x4
	fands	%f21,	%f6,	%f11
	movg	%xcc,	%o3,	%i3
	srlx	%o1,	%l0,	%g6
	bvc	loop_1128
	bvc,a,pn	%icc,	loop_1129
	subccc	%l5,	%g5,	%l4
	movvs	%xcc,	%g3,	%g2
loop_1128:
	alignaddrl	%l1,	%i2,	%g4
loop_1129:
	fba	%fcc2,	loop_1130
	ldstub	[%l7 + 0x6B],	%i5
	fmovscs	%icc,	%f15,	%f15
	movl	%xcc,	%i7,	%l6
loop_1130:
	movrgz	%i0,	%g7,	%o0
	movrgez	%o5,	%o2,	%i4
	add	%l7,	0x40,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] %asi,	%l2,	%o6
	fmovdge	%xcc,	%f29,	%f1
	edge32l	%l3,	%i1,	%g1
	movge	%xcc,	%i6,	%o4
	array16	%o3,	%i3,	%o1
	sllx	%l0,	0x09,	%o7
	movcs	%icc,	%l5,	%g5
	fabss	%f14,	%f28
	tle	%icc,	0x5
	nop
	setx	loop_1131,	%l0,	%l1
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
	movrlez	%g6,	0x3B7,	%l4
	edge8l	%g2,	%g3,	%i2
loop_1131:
	mulx	%l1,	%g4,	%i5
	movne	%xcc,	%i7,	%i0
	edge32ln	%g7,	%o0,	%o5
	movrgz	%o2,	%l6,	%l2
	movre	%i4,	0x344,	%l3
	taddcc	%o6,	0x15A6,	%g1
	sir	0x0BE4
	fpadd32	%f4,	%f12,	%f20
	srl	%i1,	%o4,	%o3
	fands	%f17,	%f26,	%f23
	fpadd32s	%f27,	%f30,	%f7
	andcc	%i3,	%o1,	%l0
	fmovdle	%xcc,	%f30,	%f2
	array32	%o7,	%i6,	%g5
	fmovrdgz	%g6,	%f6,	%f6
	bn,a,pn	%icc,	loop_1132
	taddcc	%l4,	%l5,	%g3
	fnegs	%f6,	%f30
	fsrc2s	%f1,	%f22
loop_1132:
	movvs	%icc,	%g2,	%l1
	mulscc	%i2,	0x06B0,	%i5
	movneg	%icc,	%g4,	%i7
	array8	%g7,	%o0,	%i0
	fmovdg	%xcc,	%f29,	%f1
	bcc,a,pn	%icc,	loop_1133
	fmovsle	%icc,	%f7,	%f18
	ldx	[%l7 + 0x40],	%o2
	bgu,a	%icc,	loop_1134
loop_1133:
	tcs	%xcc,	0x2
	stbar
	nop
	setx	loop_1135,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_1134:
	fbg,a	%fcc0,	loop_1136
	tleu	%xcc,	0x6
	ldd	[%l7 + 0x20],	%f12
loop_1135:
	fandnot2s	%f30,	%f20,	%f10
loop_1136:
	fbu	%fcc2,	loop_1137
	fmovdn	%icc,	%f11,	%f27
	fone	%f20
	fmovscs	%icc,	%f23,	%f5
loop_1137:
	subc	%l6,	%o5,	%l2
	sra	%l3,	0x19,	%i4
	udivx	%g1,	0x0DE9,	%o6
	tvc	%xcc,	0x6
	fcmple16	%f4,	%f8,	%i1
	edge32l	%o4,	%o3,	%o1
	fmuld8sux16	%f29,	%f21,	%f18
	array32	%l0,	%i3,	%i6
	sll	%o7,	%g5,	%g6
	fmovsgu	%icc,	%f25,	%f19
	fbo	%fcc1,	loop_1138
	movpos	%icc,	%l4,	%l5
	edge16	%g3,	%g2,	%i2
	lduw	[%l7 + 0x64],	%i5
loop_1138:
	movge	%xcc,	%g4,	%i7
	tsubcc	%l1,	0x0F47,	%o0
	bshuffle	%f30,	%f8,	%f10
	wr	%g0,	0x80,	%asi
	lda	[%l7 + 0x7C] %asi,	%f26
	nop
	set	0x38, %o1
	ldsb	[%l7 + %o1],	%i0
	fpmerge	%f17,	%f5,	%f20
	edge32l	%g7,	%o2,	%o5
	and	%l6,	%l2,	%i4
	srax	%g1,	%l3,	%o6
	ta	%xcc,	0x7
	array32	%o4,	%i1,	%o3
	ldx	[%l7 + 0x08],	%l0
	sdivx	%i3,	0x10E4,	%i6
	orncc	%o1,	0x1906,	%o7
	fblg	%fcc0,	loop_1139
	fpadd16	%f6,	%f24,	%f6
	edge32n	%g5,	%g6,	%l5
	bne,pt	%xcc,	loop_1140
loop_1139:
	fmovscc	%xcc,	%f6,	%f9
	umulcc	%l4,	0x02B8,	%g3
	fbe,a	%fcc2,	loop_1141
loop_1140:
	ba,a,pt	%xcc,	loop_1142
	bgu,a,pn	%icc,	loop_1143
	bgu,a,pt	%xcc,	loop_1144
loop_1141:
	fbe	%fcc3,	loop_1145
loop_1142:
	bl	%xcc,	loop_1146
loop_1143:
	fble	%fcc3,	loop_1147
loop_1144:
	tvs	%xcc,	0x1
loop_1145:
	fmovs	%f13,	%f23
loop_1146:
	fmovsneg	%icc,	%f22,	%f18
loop_1147:
	sir	0x1B1C
	edge32l	%i2,	%i5,	%g4
	tcc	%xcc,	0x7
	taddcc	%g2,	%i7,	%o0
	fnot1s	%f17,	%f25
	movrgz	%l1,	0x00D,	%g7
	mulx	%i0,	%o2,	%o5
	bg,a	loop_1148
	add	%l2,	%l6,	%g1
	movne	%xcc,	%i4,	%l3
	movn	%xcc,	%o6,	%o4
loop_1148:
	tn	%xcc,	0x4
	fornot2s	%f29,	%f5,	%f29
	fmovrslez	%i1,	%f9,	%f12
	wr	%g0,	0x80,	%asi
	sta	%f13,	[%l7 + 0x74] %asi
	wr	%g0,	0x88,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	tvs	%xcc,	0x2
	taddcctv	%o3,	%i3,	%l0
	and	%o1,	0x1637,	%i6
	movrlz	%g5,	0x00E,	%g6
	add	%l5,	0x133D,	%l4
	srax	%g3,	0x0E,	%o7
	fnot1	%f10,	%f10
	xnor	%i5,	%g4,	%g2
	tvs	%icc,	0x7
	srax	%i7,	0x13,	%o0
	bneg,a	%icc,	loop_1149
	fcmpeq16	%f14,	%f8,	%i2
	movrlz	%g7,	0x00D,	%l1
	fornot1s	%f24,	%f14,	%f1
loop_1149:
	mulx	%o2,	%i0,	%o5
	mulscc	%l6,	0x0ED6,	%g1
	tpos	%icc,	0x0
	srlx	%l2,	%i4,	%l3
	movge	%icc,	%o4,	%o6
	fmovspos	%xcc,	%f30,	%f20
	srlx	%o3,	0x1A,	%i3
	bcs,pt	%icc,	loop_1150
	tpos	%icc,	0x7
	bshuffle	%f6,	%f22,	%f6
	tge	%icc,	0x6
loop_1150:
	alignaddrl	%i1,	%l0,	%i6
	fandnot1	%f22,	%f28,	%f6
	tleu	%icc,	0x3
	movvc	%icc,	%o1,	%g5
	set	0x44, %i7
	stwa	%g6,	[%l7 + %i7] 0x14
	srlx	%l5,	0x0E,	%g3
	tl	%icc,	0x4
	add	%l7,	0x44,	%l6
	wr	%g0,	0x19,	%asi
	lda	[%l6] %asi,	%o7
	casa	[%l6] 0x19,	%o7,	%i5
	tpos	%xcc,	0x4
	fmovdcc	%icc,	%f9,	%f11
	fbug,a	%fcc2,	loop_1151
	fbug	%fcc0,	loop_1152
	ldx	[%l7 + 0x58],	%l4
	fbul	%fcc1,	loop_1153
loop_1151:
	srl	%g2,	0x1E,	%i7
loop_1152:
	edge32ln	%o0,	%i2,	%g4
	fbo,a	%fcc0,	loop_1154
loop_1153:
	movvs	%icc,	%g7,	%o2
	smul	%i0,	0x1A4F,	%o5
	prefetch	[%l7 + 0x70],	 0x0
loop_1154:
	ldsh	[%l7 + 0x34],	%l6
	tg	%xcc,	0x6
	brlez,a	%g1,	loop_1155
	swap	[%l7 + 0x74],	%l1
	bvc,a	loop_1156
	fnand	%f0,	%f10,	%f26
loop_1155:
	nop
	wr	%g0,	0x88,	%asi
	lduha	[%l7 + 0x68] %asi,	%i4
loop_1156:
	alignaddrl	%l2,	%l3,	%o6
	orcc	%o3,	%i3,	%o4
	subc	%l0,	%i6,	%o1
	srax	%i1,	%g6,	%g5
	fnors	%f30,	%f23,	%f13
	array8	%g3,	%o7,	%i5
	movre	%l5,	%l4,	%i7
	fbl	%fcc2,	loop_1157
	tleu	%icc,	0x7
	umulcc	%g2,	%o0,	%i2
	bn	%xcc,	loop_1158
loop_1157:
	tsubcc	%g7,	%g4,	%i0
	tne	%icc,	0x2
	fbue,a	%fcc1,	loop_1159
loop_1158:
	fandnot2	%f24,	%f14,	%f26
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bvc	%xcc,	loop_1160
loop_1159:
	movcs	%xcc,	%o5,	%l6
	tneg	%icc,	0x2
	or	%o2,	%g1,	%l1
loop_1160:
	nop
	setx loop_1161, %l0, %l1
	jmpl %l1, %i4
	fones	%f8
	xor	%l2,	0x0E18,	%o6
	tle	%icc,	0x4
loop_1161:
	srax	%l3,	0x00,	%i3
	edge8	%o3,	%o4,	%l0
	fmovrsgez	%o1,	%f26,	%f4
	st	%f7,	[%l7 + 0x1C]
	fxors	%f27,	%f26,	%f13
	sdivcc	%i6,	0x1084,	%g6
	brgz,a	%i1,	loop_1162
	andncc	%g3,	%g5,	%i5
	bgu	%icc,	loop_1163
	ba,a	%xcc,	loop_1164
loop_1162:
	tcs	%icc,	0x1
	brlz	%l5,	loop_1165
loop_1163:
	pdist	%f26,	%f8,	%f16
loop_1164:
	andcc	%l4,	%i7,	%o7
	be,a,pt	%xcc,	loop_1166
loop_1165:
	fandnot1	%f12,	%f18,	%f12
	addccc	%o0,	0x1F9E,	%g2
	fone	%f12
loop_1166:
	brgz,a	%i2,	loop_1167
	ta	%icc,	0x3
	addccc	%g7,	0x1120,	%i0
	movre	%o5,	%l6,	%g4
loop_1167:
	nop
	set	0x70, %i3
	ldda	[%l7 + %i3] 0x27,	%g0
	orcc	%o2,	%i4,	%l2
	srlx	%o6,	%l1,	%l3
	bvc	loop_1168
	fxnors	%f30,	%f5,	%f19
	ta	%xcc,	0x7
	bl	%xcc,	loop_1169
loop_1168:
	fpadd32s	%f10,	%f18,	%f22
	fpsub32s	%f29,	%f19,	%f24
	fbe,a	%fcc1,	loop_1170
loop_1169:
	tsubcc	%o3,	%i3,	%l0
	stx	%o1,	[%l7 + 0x48]
	fmovda	%icc,	%f14,	%f18
loop_1170:
	sdivcc	%o4,	0x092C,	%i6
	xnorcc	%i1,	%g3,	%g5
	smul	%g6,	%i5,	%l5
	fbge,a	%fcc0,	loop_1171
	bcc,a,pn	%xcc,	loop_1172
	fcmpes	%fcc3,	%f19,	%f17
	tvc	%icc,	0x3
loop_1171:
	brlz,a	%i7,	loop_1173
loop_1172:
	umulcc	%l4,	0x0C0D,	%o0
	tge	%icc,	0x3
	bpos,a	%icc,	loop_1174
loop_1173:
	movrlez	%o7,	%i2,	%g7
	set	0x38, %o6
	lduba	[%l7 + %o6] 0x04,	%i0
loop_1174:
	bleu,a,pt	%xcc,	loop_1175
	smul	%g2,	%l6,	%g4
	movleu	%icc,	%o5,	%o2
	tg	%xcc,	0x1
loop_1175:
	ldstub	[%l7 + 0x25],	%g1
	srl	%l2,	0x12,	%o6
	orn	%i4,	%l3,	%o3
	movne	%icc,	%i3,	%l0
	subcc	%l1,	%o4,	%o1
	movrgez	%i1,	0x14C,	%g3
	movrgz	%g5,	0x2B0,	%i6
	movcc	%xcc,	%i5,	%g6
	udivcc	%l5,	0x1BD2,	%i7
	set	0x7C, %g6
	ldsha	[%l7 + %g6] 0x15,	%o0
	fbue,a	%fcc1,	loop_1176
	ble	%xcc,	loop_1177
	edge16n	%l4,	%o7,	%i2
	sdivcc	%g7,	0x1AD6,	%i0
loop_1176:
	fmovdl	%icc,	%f8,	%f27
loop_1177:
	taddcctv	%l6,	0x10D8,	%g2
	stx	%g4,	[%l7 + 0x40]
	fpack32	%f4,	%f12,	%f26
	movvc	%icc,	%o2,	%o5
	tgu	%icc,	0x2
	umul	%g1,	0x0380,	%l2
	set	0x29, %i1
	stba	%i4,	[%l7 + %i1] 0x14
	subcc	%o6,	%l3,	%i3
	edge32n	%l0,	%l1,	%o3
	fandnot2	%f30,	%f22,	%f24
	bne,a	%xcc,	loop_1178
	andn	%o4,	%i1,	%o1
	movne	%icc,	%g5,	%i6
	edge16l	%g3,	%g6,	%i5
loop_1178:
	umulcc	%i7,	0x0685,	%l5
	smulcc	%o0,	0x10E5,	%l4
	fmovscs	%xcc,	%f26,	%f26
	ble,a	loop_1179
	xor	%o7,	0x190E,	%i2
	movrgez	%i0,	%l6,	%g2
	movpos	%xcc,	%g4,	%o2
loop_1179:
	tg	%icc,	0x2
	edge32n	%o5,	%g1,	%l2
	fmuld8sux16	%f12,	%f2,	%f0
	edge16l	%g7,	%i4,	%l3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ta	%icc,	0x2
	sdivx	%o6,	0x0DDC,	%i3
	fmul8x16au	%f6,	%f12,	%f10
	udivx	%l1,	0x155E,	%l0
	fmovrslez	%o4,	%f13,	%f30
	andncc	%o3,	%o1,	%g5
	edge8ln	%i6,	%i1,	%g6
	movleu	%xcc,	%g3,	%i7
	popc	0x1D24,	%l5
	fbl	%fcc2,	loop_1180
	xor	%o0,	%l4,	%i5
	fmovdvc	%xcc,	%f20,	%f28
	pdist	%f26,	%f26,	%f30
loop_1180:
	nop
	setx	loop_1181,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fbo,a	%fcc2,	loop_1182
	add	%o7,	0x1E8F,	%i2
	fbge	%fcc2,	loop_1183
loop_1181:
	andn	%l6,	%i0,	%g2
loop_1182:
	movrlez	%o2,	0x0C8,	%o5
	fmovspos	%xcc,	%f27,	%f17
loop_1183:
	tgu	%xcc,	0x0
	fnors	%f26,	%f25,	%f29
	bcs	loop_1184
	fmul8x16	%f29,	%f6,	%f24
	alignaddrl	%g1,	%l2,	%g4
	orcc	%i4,	0x1870,	%l3
loop_1184:
	nop
	wr	%g0,	0x11,	%asi
	stwa	%o6,	[%l7 + 0x18] %asi
	movcc	%xcc,	%g7,	%l1
	edge8	%l0,	%o4,	%i3
	array16	%o1,	%o3,	%i6
	stbar
	and	%g5,	0x0AE1,	%i1
	tle	%icc,	0x0
	std	%f6,	[%l7 + 0x68]
	movne	%xcc,	%g3,	%i7
	wr	%g0,	0x80,	%asi
	stha	%g6,	[%l7 + 0x24] %asi
	and	%l5,	%l4,	%o0
	mova	%icc,	%o7,	%i5
	wr	%g0,	0x89,	%asi
	sta	%f17,	[%l7 + 0x60] %asi
	fcmpes	%fcc2,	%f9,	%f26
	orcc	%i2,	0x15FE,	%l6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tne	%xcc,	0x1
	sdiv	%g2,	0x1310,	%i0
	movrgez	%o2,	%g1,	%l2
	movpos	%icc,	%g4,	%o5
	fmul8ulx16	%f2,	%f30,	%f0
	sethi	0x0511,	%i4
	bpos,a,pt	%xcc,	loop_1185
	subcc	%o6,	0x165B,	%l3
	fbule	%fcc1,	loop_1186
	bg	%icc,	loop_1187
loop_1185:
	fmovdl	%icc,	%f6,	%f7
	sdiv	%l1,	0x1C55,	%g7
loop_1186:
	tpos	%icc,	0x7
loop_1187:
	udivcc	%o4,	0x0660,	%i3
	fornot2s	%f13,	%f31,	%f22
	sth	%o1,	[%l7 + 0x14]
	umul	%o3,	%l0,	%i6
	edge32	%g5,	%g3,	%i7
	fbg,a	%fcc3,	loop_1188
	movvs	%icc,	%g6,	%i1
	mulscc	%l5,	0x0A80,	%o0
	fmovrdgz	%l4,	%f16,	%f28
loop_1188:
	xorcc	%i5,	%o7,	%l6
	nop
	setx loop_1189, %l0, %l1
	jmpl %l1, %g2
	sra	%i0,	%o2,	%i2
	sra	%l2,	%g1,	%o5
	umul	%i4,	0x02EF,	%g4
loop_1189:
	subccc	%o6,	%l3,	%l1
	sethi	0x1E6F,	%g7
	set	0x6F, %l6
	lduba	[%l7 + %l6] 0x80,	%o4
	fands	%f1,	%f16,	%f3
	xnorcc	%i3,	0x1CC4,	%o1
	array8	%o3,	%i6,	%g5
	ta	%xcc,	0x5
	sub	%l0,	0x1DDD,	%g3
	movre	%g6,	%i1,	%i7
	edge16ln	%l5,	%o0,	%i5
	tn	%icc,	0x5
	ba,a,pt	%xcc,	loop_1190
	movrlz	%l4,	%l6,	%g2
	tvs	%xcc,	0x1
	alignaddrl	%o7,	%o2,	%i2
loop_1190:
	fmovd	%f24,	%f24
	add	%l7,	0x38,	%l6
	wr	%g0,	0x04,	%asi
	ldxa	[%l6] %asi,	%l2
	casxa	[%l6] 0x04,	%l2,	%g1
	addccc	%i0,	%o5,	%i4
	edge16n	%g4,	%l3,	%l1
	orcc	%o6,	%o4,	%i3
	tneg	%xcc,	0x0
	fmovsg	%icc,	%f22,	%f31
	add	%g7,	0x165F,	%o3
	fnand	%f22,	%f24,	%f6
	wr	%g0,	0x89,	%asi
	swapa	[%l7 + 0x14] %asi,	%i6
	sll	%g5,	%o1,	%l0
	fmovdvc	%icc,	%f30,	%f28
	and	%g6,	0x11D9,	%i1
	movg	%icc,	%g3,	%i7
	bvs	loop_1191
	add	%o0,	0x0F53,	%i5
	edge8n	%l4,	%l5,	%g2
	taddcctv	%l6,	0x0B2E,	%o2
loop_1191:
	taddcc	%o7,	%l2,	%i2
	tvc	%xcc,	0x1
	add	%g1,	%i0,	%i4
	fpadd32	%f30,	%f24,	%f12
	orncc	%o5,	%g4,	%l1
	udiv	%o6,	0x05C1,	%o4
	set	0x38, %l2
	prefetcha	[%l7 + %l2] 0x19,	 0x0
	srl	%l3,	%g7,	%o3
	fandnot2s	%f0,	%f27,	%f9
	smulcc	%i6,	0x0532,	%g5
	add	%o1,	0x0115,	%l0
	std	%g6,	[%l7 + 0x50]
	sth	%g3,	[%l7 + 0x1C]
	fba,a	%fcc1,	loop_1192
	tvs	%xcc,	0x4
	lduh	[%l7 + 0x42],	%i7
	set	0x50, %g7
	ldswa	[%l7 + %g7] 0x19,	%i1
loop_1192:
	fmovdl	%icc,	%f31,	%f18
	fmovrslz	%o0,	%f1,	%f0
	andn	%l4,	0x1EC1,	%l5
	fmovsleu	%icc,	%f9,	%f16
	movn	%xcc,	%g2,	%l6
	sth	%i5,	[%l7 + 0x1C]
	ld	[%l7 + 0x7C],	%f11
	mova	%xcc,	%o7,	%o2
	taddcctv	%l2,	%g1,	%i0
	sir	0x09F6
	fxnors	%f18,	%f24,	%f20
	subcc	%i2,	0x03CD,	%o5
	fmuld8sux16	%f11,	%f28,	%f10
	tvc	%xcc,	0x6
	srl	%g4,	0x11,	%i4
	wr	%g0,	0x10,	%asi
	lduba	[%l7 + 0x0F] %asi,	%l1
	alignaddr	%o4,	%i3,	%l3
	tleu	%xcc,	0x4
	movgu	%icc,	%g7,	%o3
	fnand	%f8,	%f20,	%f26
	fmovdcc	%icc,	%f19,	%f17
	alignaddrl	%i6,	%g5,	%o1
	brgz,a	%o6,	loop_1193
	stb	%l0,	[%l7 + 0x58]
	orn	%g6,	0x1173,	%i7
	movpos	%icc,	%g3,	%i1
loop_1193:
	edge16n	%o0,	%l5,	%g2
	fxnor	%f22,	%f14,	%f10
	taddcc	%l4,	0x1949,	%l6
	brlz,a	%o7,	loop_1194
	fbg,a	%fcc0,	loop_1195
	andn	%i5,	%o2,	%g1
	alignaddrl	%i0,	%l2,	%o5
loop_1194:
	xnor	%i2,	%g4,	%l1
loop_1195:
	xorcc	%i4,	0x1F19,	%o4
	wr	%g0,	0x20,	%asi
	ldxa	[%g0 + 0x0] %asi,	%i3
	mulscc	%l3,	%o3,	%i6
	fmovspos	%icc,	%f19,	%f15
	fmuld8ulx16	%f2,	%f1,	%f2
	edge16	%g7,	%g5,	%o6
	ta	%icc,	0x2
	tcs	%icc,	0x6
	andn	%l0,	0x069B,	%o1
	tpos	%xcc,	0x0
	wr	%g0,	0x0c,	%asi
	prefetcha	[%l7 + 0x60] %asi,	 0x3
	fmovdvc	%icc,	%f5,	%f1
	fpadd32	%f24,	%f0,	%f12
	fmovdvc	%icc,	%f14,	%f27
	bge,a	loop_1196
	bn	loop_1197
	fmul8ulx16	%f2,	%f12,	%f26
	movge	%xcc,	%g3,	%i7
loop_1196:
	movpos	%xcc,	%o0,	%l5
loop_1197:
	bge	loop_1198
	membar	0x5A
	faligndata	%f30,	%f24,	%f30
	call	loop_1199
loop_1198:
	sdivx	%i1,	0x1BAC,	%l4
	tsubcc	%g2,	0x0945,	%l6
	tvc	%icc,	0x0
loop_1199:
	movrlez	%o7,	0x398,	%i5
	xor	%o2,	0x043F,	%i0
	mova	%icc,	%l2,	%g1
	fbe,a	%fcc3,	loop_1200
	tge	%xcc,	0x3
	lduw	[%l7 + 0x2C],	%i2
	fbl	%fcc3,	loop_1201
loop_1200:
	udivx	%o5,	0x1E55,	%g4
	edge32l	%l1,	%o4,	%i4
	fbu	%fcc2,	loop_1202
loop_1201:
	stx	%i3,	[%l7 + 0x70]
	alignaddr	%o3,	%l3,	%i6
	edge16ln	%g5,	%g7,	%l0
loop_1202:
	sdivcc	%o6,	0x0A53,	%g6
	brlz,a	%o1,	loop_1203
	be	%xcc,	loop_1204
	nop
	setx loop_1205, %l0, %l1
	jmpl %l1, %g3
	movcs	%xcc,	%i7,	%l5
loop_1203:
	subc	%i1,	%o0,	%g2
loop_1204:
	srl	%l6,	%o7,	%i5
loop_1205:
	fmovdle	%icc,	%f9,	%f15
	set	0x25, %l3
	stba	%l4,	[%l7 + %l3] 0xeb
	membar	#Sync
	fpack32	%f22,	%f26,	%f0
	movneg	%xcc,	%i0,	%o2
	edge32	%g1,	%i2,	%l2
	tg	%xcc,	0x3
	fmovrsgz	%g4,	%f16,	%f23
	movl	%icc,	%o5,	%o4
	tge	%icc,	0x2
	fcmpes	%fcc2,	%f9,	%f23
	fmovdpos	%icc,	%f23,	%f20
	fbu	%fcc1,	loop_1206
	srl	%i4,	0x18,	%l1
	fnot2s	%f23,	%f7
	sdivcc	%i3,	0x035D,	%l3
loop_1206:
	movle	%xcc,	%o3,	%g5
	srax	%g7,	0x02,	%i6
	set	0x1C, %o2
	sta	%f4,	[%l7 + %o2] 0x19
	wr	%g0,	0x18,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	fbg	%fcc3,	loop_1207
	movre	%l0,	%o6,	%o1
	swap	[%l7 + 0x24],	%g3
	fblg	%fcc3,	loop_1208
loop_1207:
	movvc	%icc,	%i7,	%g6
	tneg	%xcc,	0x0
	tge	%icc,	0x6
loop_1208:
	fnands	%f25,	%f8,	%f24
	udivx	%l5,	0x1703,	%i1
	movle	%xcc,	%o0,	%l6
	fbu,a	%fcc1,	loop_1209
	subcc	%o7,	0x1BC2,	%i5
	movleu	%xcc,	%l4,	%i0
	movpos	%xcc,	%o2,	%g2
loop_1209:
	fsrc2	%f30,	%f12
	movgu	%icc,	%i2,	%l2
	mulscc	%g1,	%o5,	%g4
	udivcc	%i4,	0x1903,	%o4
	movrne	%i3,	%l3,	%o3
	tleu	%icc,	0x3
	fzeros	%f19
	fbg,a	%fcc1,	loop_1210
	fcmpgt16	%f26,	%f6,	%l1
	movvc	%icc,	%g5,	%i6
	fbne,a	%fcc3,	loop_1211
loop_1210:
	fbue,a	%fcc1,	loop_1212
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpack16	%f26,	%f27
loop_1211:
	fpsub16s	%f23,	%f11,	%f23
loop_1212:
	tneg	%xcc,	0x1
	sdivx	%l0,	0x03DF,	%g7
	fmovdle	%xcc,	%f30,	%f22
	movn	%icc,	%o6,	%g3
	fxnor	%f14,	%f28,	%f2
	taddcctv	%i7,	0x0886,	%g6
	edge8ln	%l5,	%o1,	%i1
	movrne	%l6,	0x336,	%o7
	ble,a,pt	%icc,	loop_1213
	smul	%o0,	%i5,	%i0
	umul	%o2,	%g2,	%i2
	movrgz	%l2,	0x2F3,	%l4
loop_1213:
	ldd	[%l7 + 0x18],	%f16
	nop
	setx	loop_1214,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fnegs	%f22,	%f30
	fmovrdne	%g1,	%f6,	%f24
	orcc	%o5,	%i4,	%g4
loop_1214:
	tne	%xcc,	0x3
	tvs	%icc,	0x0
	fbul	%fcc2,	loop_1215
	edge32ln	%i3,	%l3,	%o3
	edge8n	%o4,	%g5,	%i6
	movleu	%icc,	%l0,	%g7
loop_1215:
	fmuld8ulx16	%f18,	%f27,	%f22
	fnot2s	%f6,	%f11
	te	%xcc,	0x3
	fmovdl	%xcc,	%f0,	%f1
	addc	%l1,	%g3,	%o6
	fmuld8sux16	%f11,	%f17,	%f10
	addc	%g6,	0x0A1D,	%l5
	array16	%i7,	%i1,	%o1
	mova	%icc,	%o7,	%l6
	subcc	%o0,	0x1137,	%i5
	fbo,a	%fcc3,	loop_1216
	sra	%i0,	0x16,	%g2
	udivcc	%i2,	0x1E39,	%l2
	popc	%o2,	%g1
loop_1216:
	tcc	%xcc,	0x5
	subccc	%l4,	%i4,	%o5
	sethi	0x135E,	%g4
	wr	%g0,	0x0c,	%asi
	stba	%l3,	[%l7 + 0x62] %asi
	fmuld8ulx16	%f27,	%f12,	%f8
	udivcc	%o3,	0x1E63,	%i3
	tl	%xcc,	0x6
	fbge,a	%fcc0,	loop_1217
	add	%o4,	%g5,	%i6
	xor	%l0,	%g7,	%g3
	edge32ln	%o6,	%g6,	%l5
loop_1217:
	fexpand	%f20,	%f30
	sdivcc	%l1,	0x0A7C,	%i7
	sll	%i1,	%o1,	%o7
	wr	%g0,	0x88,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	movle	%icc,	%o0,	%i5
	std	%f22,	[%l7 + 0x30]
	edge32ln	%l6,	%i0,	%i2
	prefetch	[%l7 + 0x18],	 0x1
	or	%g2,	0x13CE,	%l2
	tg	%xcc,	0x3
	fcmpeq16	%f2,	%f18,	%o2
	sir	0x106A
	bge,a,pt	%icc,	loop_1218
	movgu	%xcc,	%l4,	%g1
	wr	%g0,	0x23,	%asi
	stwa	%o5,	[%l7 + 0x5C] %asi
	membar	#Sync
loop_1218:
	movpos	%xcc,	%i4,	%g4
	srlx	%l3,	%o3,	%i3
	edge16	%g5,	%i6,	%o4
	set	0x7C, %g1
	lduwa	[%l7 + %g1] 0x11,	%l0
	fmovsvs	%xcc,	%f20,	%f28
	bvs,a	loop_1219
	fbn	%fcc3,	loop_1220
	bge,a,pn	%icc,	loop_1221
	tg	%icc,	0x3
loop_1219:
	edge8n	%g7,	%o6,	%g3
loop_1220:
	fmul8ulx16	%f22,	%f26,	%f14
loop_1221:
	ble,pt	%xcc,	loop_1222
	bgu,pt	%xcc,	loop_1223
	movvc	%xcc,	%l5,	%g6
	ldd	[%l7 + 0x48],	%f4
loop_1222:
	sdivcc	%l1,	0x0FE1,	%i7
loop_1223:
	for	%f4,	%f2,	%f0
	fcmpne16	%f6,	%f24,	%i1
	edge32l	%o7,	%o1,	%o0
	movleu	%xcc,	%i5,	%i0
	bgu	%xcc,	loop_1224
	tne	%icc,	0x1
	be,a	%xcc,	loop_1225
	te	%icc,	0x2
loop_1224:
	edge8l	%l6,	%i2,	%l2
	srlx	%o2,	%l4,	%g1
loop_1225:
	nop
	wr	%g0,	0xe2,	%asi
	stha	%g2,	[%l7 + 0x6E] %asi
	membar	#Sync
	popc	0x1D2F,	%o5
	be,a	%icc,	loop_1226
	edge32	%i4,	%l3,	%o3
	membar	0x44
	movge	%xcc,	%g4,	%i3
loop_1226:
	tneg	%icc,	0x1
	edge8n	%g5,	%i6,	%l0
	brlz,a	%g7,	loop_1227
	sllx	%o6,	0x08,	%o4
	movcs	%icc,	%g3,	%g6
	te	%icc,	0x7
loop_1227:
	fbge,a	%fcc2,	loop_1228
	movre	%l1,	%i7,	%l5
	mulx	%o7,	0x13E4,	%o1
	fmovrdlez	%i1,	%f28,	%f26
loop_1228:
	tsubcc	%o0,	0x163F,	%i5
	fmovdl	%icc,	%f18,	%f13
	edge8	%l6,	%i2,	%i0
	sra	%o2,	0x0C,	%l4
	fexpand	%f21,	%f16
	mova	%icc,	%l2,	%g1
	nop
	set	0x28, %l0
	std	%f8,	[%l7 + %l0]
	fmovrslez	%o5,	%f1,	%f17
	tvs	%icc,	0x6
	movneg	%xcc,	%i4,	%g2
	tleu	%icc,	0x3
	tne	%icc,	0x7
	sir	0x1E37
	umul	%l3,	%o3,	%i3
	movg	%icc,	%g5,	%i6
	fcmpeq16	%f20,	%f10,	%l0
	fabss	%f18,	%f11
	fnot2	%f16,	%f10
	fmovdn	%xcc,	%f28,	%f3
	edge8l	%g7,	%o6,	%g4
	fpack32	%f0,	%f14,	%f24
	movge	%icc,	%g3,	%g6
	udivx	%o4,	0x1E67,	%i7
	fcmpgt16	%f30,	%f16,	%l5
	sir	0x0B7F
	fmovsvc	%icc,	%f10,	%f30
	tle	%icc,	0x6
	edge16l	%l1,	%o1,	%o7
	fmovdne	%xcc,	%f6,	%f4
	pdist	%f12,	%f8,	%f14
	tcc	%xcc,	0x2
	orn	%i1,	0x0D06,	%o0
	and	%i5,	0x1E8D,	%i2
	sub	%i0,	%o2,	%l6
	addccc	%l2,	%l4,	%g1
	fmovspos	%icc,	%f4,	%f11
	be,a	%icc,	loop_1229
	srlx	%o5,	0x1B,	%g2
	ldstub	[%l7 + 0x61],	%l3
	alignaddrl	%o3,	%i3,	%i4
loop_1229:
	fmovsle	%icc,	%f0,	%f25
	mulx	%i6,	0x0C68,	%g5
	addccc	%g7,	0x1D88,	%l0
	edge8n	%g4,	%g3,	%g6
	sdivx	%o6,	0x0A1C,	%i7
	tn	%icc,	0x5
	fbge,a	%fcc3,	loop_1230
	bpos	loop_1231
	xnorcc	%o4,	0x094C,	%l5
	fzero	%f12
loop_1230:
	sdivx	%l1,	0x1219,	%o7
loop_1231:
	fpack16	%f6,	%f16
	subc	%o1,	0x0545,	%i1
	sdivcc	%i5,	0x01E1,	%i2
	orncc	%o0,	0x03E2,	%o2
	mulx	%i0,	%l2,	%l6
	fabss	%f8,	%f13
	fmovdgu	%xcc,	%f18,	%f2
	sll	%l4,	%o5,	%g2
	wr	%g0,	0x88,	%asi
	ldda	[%l7 + 0x70] %asi,	%g0
	popc	%o3,	%l3
	subccc	%i4,	%i6,	%g5
	subcc	%i3,	0x0815,	%l0
	fpsub16	%f16,	%f20,	%f6
	fbge	%fcc1,	loop_1232
	fnand	%f22,	%f18,	%f6
	bvc	%xcc,	loop_1233
	edge8l	%g4,	%g7,	%g6
loop_1232:
	fcmpne32	%f16,	%f24,	%g3
	movcs	%xcc,	%i7,	%o6
loop_1233:
	bcc	loop_1234
	pdist	%f24,	%f6,	%f30
	andn	%o4,	0x1ECF,	%l5
	set	0x40, %i2
	stda	%f0,	[%l7 + %i2] 0xf9
	membar	#Sync
loop_1234:
	mulx	%o7,	0x167A,	%l1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32l	%i1,	%i5,	%o1
	movge	%icc,	%i2,	%o0
	andcc	%o2,	0x1813,	%l2
	fbne	%fcc0,	loop_1235
	sdivx	%i0,	0x0151,	%l4
	ldsw	[%l7 + 0x40],	%l6
	movcc	%xcc,	%g2,	%g1
loop_1235:
	movrne	%o3,	%o5,	%i4
	srl	%l3,	0x1E,	%g5
	std	%f28,	[%l7 + 0x30]
	movrlz	%i6,	0x07A,	%i3
	ldd	[%l7 + 0x30],	%f4
	orn	%l0,	%g7,	%g4
	tl	%xcc,	0x4
	add	%l7,	0x60,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%g3
	casxa	[%l6] 0x89,	%g3,	%i7
	udiv	%g6,	0x14FF,	%o6
	movvc	%icc,	%o4,	%l5
	or	%l1,	0x1EF7,	%i1
	sir	0x034A
	movcs	%icc,	%o7,	%o1
	fbe	%fcc3,	loop_1236
	umulcc	%i5,	%i2,	%o2
	fbn,a	%fcc0,	loop_1237
	taddcctv	%l2,	0x0E36,	%i0
loop_1236:
	ba,pt	%icc,	loop_1238
	fbe,a	%fcc3,	loop_1239
loop_1237:
	fnor	%f20,	%f6,	%f30
	fmovse	%icc,	%f23,	%f19
loop_1238:
	udiv	%l4,	0x103D,	%o0
loop_1239:
	array16	%g2,	%l6,	%o3
	fmovrdgz	%o5,	%f8,	%f8
	srax	%g1,	%i4,	%g5
	nop
	setx	loop_1240,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	addccc	%i6,	0x11B9,	%i3
	srax	%l3,	%l0,	%g7
	taddcc	%g3,	%g4,	%g6
loop_1240:
	movcs	%icc,	%o6,	%o4
	movle	%icc,	%i7,	%l1
	tl	%icc,	0x0
	sir	0x12EE
	fbne	%fcc0,	loop_1241
	edge16l	%l5,	%i1,	%o1
	movre	%i5,	0x08A,	%o7
	fnegd	%f20,	%f30
loop_1241:
	tsubcc	%o2,	0x1169,	%i2
	edge8n	%l2,	%i0,	%o0
	set	0x0C, %l1
	swapa	[%l7 + %l1] 0x0c,	%g2
	srax	%l6,	0x0D,	%o3
	fmul8ulx16	%f28,	%f12,	%f30
	fmovsne	%icc,	%f10,	%f11
	wr	%g0,	0x2f,	%asi
	stda	%o4,	[%l7 + 0x50] %asi
	membar	#Sync
	fbue,a	%fcc3,	loop_1242
	prefetch	[%l7 + 0x6C],	 0x3
	bge	loop_1243
	xorcc	%l4,	%i4,	%g1
loop_1242:
	fnands	%f3,	%f11,	%f28
	subcc	%g5,	0x063B,	%i6
loop_1243:
	fnot1s	%f15,	%f6
	fpadd16s	%f28,	%f0,	%f13
	fmovrsgez	%i3,	%f7,	%f1
	edge32n	%l0,	%g7,	%l3
	subccc	%g4,	0x05FE,	%g6
	alignaddrl	%g3,	%o4,	%i7
	fmovdle	%xcc,	%f8,	%f9
	bge,pn	%icc,	loop_1244
	alignaddr	%l1,	%o6,	%i1
	andcc	%l5,	0x1A94,	%i5
	popc	%o7,	%o1
loop_1244:
	xor	%o2,	0x0CEB,	%l2
	call	loop_1245
	udivcc	%i0,	0x0F5F,	%i2
	fba,a	%fcc2,	loop_1246
	edge32l	%o0,	%l6,	%o3
loop_1245:
	fbn	%fcc0,	loop_1247
	ldsh	[%l7 + 0x50],	%o5
loop_1246:
	fmovdne	%xcc,	%f27,	%f4
	or	%l4,	0x0328,	%i4
loop_1247:
	srlx	%g2,	%g1,	%i6
	srlx	%g5,	0x1B,	%i3
	tg	%icc,	0x3
	fzeros	%f6
	for	%f14,	%f16,	%f26
	umulcc	%l0,	%g7,	%l3
	st	%f27,	[%l7 + 0x0C]
	taddcctv	%g4,	0x1DF1,	%g3
	fba	%fcc0,	loop_1248
	orncc	%o4,	0x02CF,	%i7
	edge32n	%l1,	%o6,	%g6
	mulx	%i1,	%i5,	%l5
loop_1248:
	fnot2s	%f21,	%f23
	lduw	[%l7 + 0x10],	%o7
	sub	%o1,	%o2,	%l2
	fba,a	%fcc1,	loop_1249
	edge32ln	%i0,	%o0,	%i2
	add	%l7,	0x2C,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%o3
	casa	[%l6] %asi,	%o3,	%o5
loop_1249:
	xor	%l4,	%i4,	%l6
	bcc,a	%xcc,	loop_1250
	brgz	%g1,	loop_1251
	sethi	0x0EC0,	%g2
	movg	%icc,	%i6,	%i3
loop_1250:
	mulscc	%g5,	0x0A8D,	%l0
loop_1251:
	fpmerge	%f11,	%f23,	%f20
	fmovse	%xcc,	%f6,	%f4
	fmovrslz	%g7,	%f31,	%f19
	addcc	%g4,	%g3,	%o4
	ldx	[%l7 + 0x48],	%l3
	brlez	%i7,	loop_1252
	fxnors	%f0,	%f7,	%f12
	array8	%l1,	%o6,	%g6
	orn	%i1,	%l5,	%i5
loop_1252:
	prefetch	[%l7 + 0x60],	 0x3
	smul	%o1,	0x1F21,	%o7
	bg,a	loop_1253
	fornot2s	%f26,	%f17,	%f9
	wr	%g0,	0x5f,	%asi
	stxa	%l2,	[%g0 + 0x0] %asi
loop_1253:
	fzero	%f14
	edge16ln	%o2,	%o0,	%i2
	movn	%xcc,	%o3,	%i0
	tsubcctv	%o5,	0x0DAE,	%i4
	movrlez	%l6,	0x16A,	%g1
	movl	%xcc,	%g2,	%l4
	fble	%fcc1,	loop_1254
	fmovsneg	%xcc,	%f25,	%f21
	tn	%icc,	0x5
	stx	%i3,	[%l7 + 0x68]
loop_1254:
	taddcctv	%i6,	0x1314,	%g5
	fpadd32s	%f19,	%f12,	%f0
	fbu	%fcc2,	loop_1255
	tne	%xcc,	0x7
	andn	%g7,	0x0D7C,	%l0
	edge8	%g3,	%g4,	%o4
loop_1255:
	udivx	%l3,	0x0765,	%i7
	fpsub16	%f8,	%f28,	%f22
	fsrc1	%f4,	%f0
	fmuld8ulx16	%f24,	%f20,	%f6
	udivcc	%o6,	0x0097,	%g6
	tg	%xcc,	0x7
	add	%l7,	0x40,	%l6
	wr	%g0,	0x04,	%asi
	lda	[%l6] %asi,	%l1
	casa	[%l6] 0x04,	%l1,	%l5
	tsubcc	%i1,	0x0191,	%i5
	srax	%o7,	%l2,	%o2
	ld	[%l7 + 0x10],	%f5
	srax	%o1,	%o0,	%o3
	set	0x46, %i5
	ldsba	[%l7 + %i5] 0x04,	%i0
	brlz	%i2,	loop_1256
	tge	%icc,	0x7
	taddcctv	%i4,	%l6,	%g1
	sub	%g2,	%o5,	%l4
loop_1256:
	and	%i6,	0x1823,	%i3
	fmovscc	%xcc,	%f23,	%f30
	fcmpeq16	%f20,	%f0,	%g5
	sub	%g7,	%g3,	%g4
	ta	%xcc,	0x5
	edge16n	%o4,	%l0,	%i7
	brlez	%l3,	loop_1257
	movgu	%xcc,	%g6,	%o6
	movre	%l1,	0x2FA,	%i1
	bl	loop_1258
loop_1257:
	array16	%l5,	%o7,	%l2
	alignaddrl	%i5,	%o2,	%o1
	fpsub16s	%f0,	%f9,	%f23
loop_1258:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8n	%o3,	%o0,	%i0
	movre	%i4,	0x1F0,	%i2
	tcc	%icc,	0x7
	srlx	%l6,	%g1,	%o5
	movcc	%xcc,	%g2,	%i6
	subccc	%i3,	%l4,	%g5
	tl	%xcc,	0x5
	set	0x2C, %i6
	ldsha	[%l7 + %i6] 0x80,	%g3
	wr	%g0,	0x10,	%asi
	stda	%g4,	[%l7 + 0x38] %asi
	fmovsvc	%xcc,	%f23,	%f31
	fmovdleu	%xcc,	%f12,	%f11
	fcmpne32	%f0,	%f6,	%o4
	array8	%g7,	%l0,	%i7
	umul	%g6,	%o6,	%l1
	fbge,a	%fcc0,	loop_1259
	move	%icc,	%i1,	%l5
	tle	%icc,	0x3
	xnor	%l3,	0x04B7,	%l2
loop_1259:
	popc	0x03C7,	%i5
	fmovdn	%icc,	%f14,	%f10
	orcc	%o7,	0x16CB,	%o2
	xnorcc	%o3,	%o1,	%i0
	subcc	%i4,	%o0,	%i2
	edge32	%g1,	%l6,	%o5
	taddcctv	%g2,	0x13F1,	%i3
	tgu	%icc,	0x1
	sub	%i6,	%l4,	%g3
	sub	%g5,	%g4,	%o4
	tpos	%icc,	0x6
	tgu	%xcc,	0x4
	fxor	%f26,	%f26,	%f24
	movleu	%xcc,	%g7,	%l0
	movne	%icc,	%i7,	%g6
	tge	%xcc,	0x2
	popc	%o6,	%l1
	movle	%icc,	%l5,	%i1
	fmovda	%icc,	%f11,	%f21
	ta	%icc,	0x0
	membar	0x28
	tle	%xcc,	0x7
	fbul,a	%fcc1,	loop_1260
	sll	%l3,	%l2,	%o7
	udivx	%o2,	0x0734,	%o3
	tsubcc	%i5,	0x008B,	%o1
loop_1260:
	mulx	%i0,	0x0817,	%o0
	edge8	%i4,	%i2,	%l6
	ba,a	loop_1261
	edge32l	%o5,	%g1,	%i3
	edge8n	%g2,	%l4,	%i6
	brnz	%g5,	loop_1262
loop_1261:
	andcc	%g3,	0x117E,	%g4
	fcmpgt32	%f4,	%f6,	%o4
	xorcc	%l0,	%g7,	%i7
loop_1262:
	fnot1	%f26,	%f14
	ldx	[%l7 + 0x10],	%o6
	edge16l	%l1,	%l5,	%g6
	fblg,a	%fcc2,	loop_1263
	tvs	%icc,	0x4
	orcc	%i1,	%l3,	%l2
	movne	%icc,	%o2,	%o7
loop_1263:
	tleu	%xcc,	0x1
	addc	%i5,	%o1,	%o3
	tvc	%xcc,	0x7
	array8	%o0,	%i0,	%i4
	prefetch	[%l7 + 0x68],	 0x3
	edge32l	%l6,	%o5,	%i2
	add	%l7,	0x14,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%g1
	casa	[%l6] %asi,	%g1,	%i3
	edge16	%l4,	%g2,	%i6
	sethi	0x07BC,	%g3
	for	%f10,	%f2,	%f8
	xorcc	%g4,	0x0DE1,	%g5
	subcc	%o4,	0x0DE2,	%l0
	prefetch	[%l7 + 0x24],	 0x3
	add	%i7,	%g7,	%o6
	movcc	%icc,	%l5,	%g6
	sll	%l1,	0x0E,	%i1
	fmovrdne	%l2,	%f6,	%f30
	fba,a	%fcc2,	loop_1264
	tle	%xcc,	0x0
	fmovdl	%xcc,	%f30,	%f9
	membar	0x2A
loop_1264:
	alignaddrl	%o2,	%o7,	%l3
	edge32ln	%i5,	%o1,	%o3
	array8	%i0,	%i4,	%l6
	srlx	%o5,	0x04,	%i2
	fxors	%f17,	%f5,	%f10
	ldsw	[%l7 + 0x34],	%g1
	movrgez	%i3,	%l4,	%g2
	be	loop_1265
	edge8n	%o0,	%i6,	%g3
	sub	%g4,	0x1E65,	%g5
	wr	%g0,	0xf9,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
loop_1265:
	umulcc	%o4,	0x0B42,	%l0
	ldsw	[%l7 + 0x34],	%g7
	fcmpne32	%f22,	%f6,	%o6
	movgu	%icc,	%l5,	%i7
	movpos	%xcc,	%g6,	%l1
	orn	%l2,	%o2,	%o7
	ld	[%l7 + 0x70],	%f20
	pdist	%f0,	%f24,	%f8
	addcc	%l3,	0x0725,	%i1
	movrgz	%o1,	%i5,	%o3
	movvc	%xcc,	%i4,	%l6
	bge	%xcc,	loop_1266
	tgu	%icc,	0x1
	taddcctv	%o5,	0x135B,	%i0
	smul	%i2,	0x1387,	%g1
loop_1266:
	fbe,a	%fcc0,	loop_1267
	fbug	%fcc2,	loop_1268
	tle	%xcc,	0x3
	fmul8x16al	%f2,	%f3,	%f8
loop_1267:
	bgu,a,pt	%xcc,	loop_1269
loop_1268:
	movrne	%l4,	0x042,	%i3
	fmul8sux16	%f30,	%f12,	%f18
	orncc	%g2,	0x0804,	%o0
loop_1269:
	membar	0x77
	tvc	%xcc,	0x4
	fmovdleu	%xcc,	%f24,	%f23
	popc	0x0A01,	%g3
	fmovrsgez	%i6,	%f27,	%f5
	and	%g4,	%o4,	%l0
	sdivcc	%g5,	0x1879,	%g7
	movg	%xcc,	%l5,	%i7
	movn	%icc,	%o6,	%l1
	fblg,a	%fcc0,	loop_1270
	orcc	%l2,	0x139B,	%g6
	fornot1	%f24,	%f8,	%f8
	fcmpeq16	%f12,	%f0,	%o7
loop_1270:
	tvc	%icc,	0x1
	movn	%icc,	%o2,	%l3
	fxnor	%f4,	%f6,	%f14
	move	%xcc,	%i1,	%o1
	orcc	%i5,	%o3,	%i4
	ldstub	[%l7 + 0x38],	%o5
	movcc	%icc,	%l6,	%i0
	tgu	%xcc,	0x4
	orncc	%g1,	0x0631,	%l4
	movcc	%xcc,	%i3,	%i2
	fmovrsgz	%g2,	%f7,	%f2
	brgez	%o0,	loop_1271
	fmovscc	%xcc,	%f10,	%f14
	bneg,a,pt	%icc,	loop_1272
	fornot1s	%f12,	%f16,	%f11
loop_1271:
	orncc	%i6,	%g3,	%g4
	edge8n	%o4,	%g5,	%l0
loop_1272:
	mova	%xcc,	%g7,	%i7
	tsubcctv	%o6,	%l5,	%l2
	tgu	%icc,	0x6
	movgu	%xcc,	%g6,	%l1
	addcc	%o2,	0x0363,	%l3
	movg	%xcc,	%i1,	%o1
	tpos	%icc,	0x1
	movge	%icc,	%o7,	%o3
	srax	%i5,	%o5,	%i4
	fmovdvc	%icc,	%f18,	%f30
	fcmpne32	%f24,	%f10,	%l6
	call	loop_1273
	fbue	%fcc0,	loop_1274
	fandnot2	%f8,	%f16,	%f22
	wr	%g0,	0xe2,	%asi
	stha	%i0,	[%l7 + 0x7E] %asi
	membar	#Sync
loop_1273:
	movrne	%l4,	0x15B,	%g1
loop_1274:
	bpos,pt	%xcc,	loop_1275
	movrgez	%i3,	%g2,	%i2
	array8	%o0,	%i6,	%g4
	fmovrdlz	%o4,	%f4,	%f22
loop_1275:
	movrlez	%g3,	0x1F4,	%g5
	sdivx	%g7,	0x16EF,	%l0
	orn	%i7,	%l5,	%o6
	movpos	%icc,	%g6,	%l1
	move	%icc,	%o2,	%l2
	movgu	%xcc,	%l3,	%o1
	fpadd16s	%f2,	%f23,	%f21
	set	0x1C, %o7
	stwa	%i1,	[%l7 + %o7] 0x22
	membar	#Sync
	umul	%o3,	%i5,	%o5
	fmovdgu	%xcc,	%f29,	%f23
	fbule,a	%fcc1,	loop_1276
	fornot1	%f28,	%f18,	%f12
	tgu	%xcc,	0x7
	move	%xcc,	%o7,	%i4
loop_1276:
	movg	%icc,	%i0,	%l6
	fbn	%fcc3,	loop_1277
	add	%l4,	%g1,	%g2
	nop
	setx loop_1278, %l0, %l1
	jmpl %l1, %i3
	xor	%i2,	%o0,	%g4
loop_1277:
	andncc	%i6,	%g3,	%o4
	movpos	%icc,	%g7,	%g5
loop_1278:
	fmovsle	%icc,	%f27,	%f18
	fmovscs	%icc,	%f4,	%f27
	bneg	%icc,	loop_1279
	flush	%l7 + 0x70
	fmovrdne	%l0,	%f8,	%f30
	umul	%i7,	0x1619,	%l5
loop_1279:
	movrne	%g6,	%o6,	%o2
	bgu	%icc,	loop_1280
	mova	%icc,	%l2,	%l3
	te	%xcc,	0x2
	addc	%l1,	%i1,	%o1
loop_1280:
	sra	%i5,	0x14,	%o5
	set	0x50, %o4
	ldda	[%l7 + %o4] 0x19,	%o6
	movg	%icc,	%i4,	%i0
	tge	%xcc,	0x1
	bn,a,pn	%icc,	loop_1281
	andn	%l6,	%l4,	%g1
	fmovrsne	%g2,	%f1,	%f17
	movrlz	%i3,	%o3,	%o0
loop_1281:
	tpos	%icc,	0x0
	movgu	%icc,	%i2,	%i6
	tsubcctv	%g3,	0x05E2,	%g4
	tne	%icc,	0x2
	movrlz	%o4,	0x11E,	%g5
	wr	%g0,	0x10,	%asi
	lduha	[%l7 + 0x08] %asi,	%g7
	tle	%xcc,	0x2
	udivcc	%l0,	0x0021,	%l5
	fmovsle	%icc,	%f29,	%f8
	edge32ln	%i7,	%o6,	%o2
	movleu	%icc,	%l2,	%g6
	srlx	%l1,	%i1,	%o1
	sdivx	%l3,	0x1481,	%i5
	wr	%g0,	0x89,	%asi
	stda	%o4,	[%l7 + 0x40] %asi
	srlx	%i4,	%o7,	%l6
	alignaddr	%i0,	%l4,	%g2
	nop
	setx	loop_1282,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	edge16l	%i3,	%g1,	%o0
	set	0x38, %o0
	swapa	[%l7 + %o0] 0x89,	%o3
loop_1282:
	nop
	wr	%g0,	0x89,	%asi
	prefetcha	[%l7 + 0x40] %asi,	 0x3
	popc	%i2,	%g4
	tgu	%icc,	0x4
	fmovsvs	%xcc,	%f4,	%f15
	set	0x60, %o5
	lda	[%l7 + %o5] 0x81,	%f10
	movvs	%xcc,	%g3,	%g5
	bvs,a	%xcc,	loop_1283
	addccc	%o4,	0x0B02,	%g7
	sethi	0x0EE4,	%l5
	fnot1	%f14,	%f22
loop_1283:
	udiv	%l0,	0x15A7,	%i7
	movg	%icc,	%o2,	%l2
	prefetch	[%l7 + 0x24],	 0x2
	andn	%g6,	%o6,	%l1
	movne	%xcc,	%o1,	%i1
	fpadd16	%f28,	%f16,	%f8
	call	loop_1284
	movg	%icc,	%i5,	%o5
	mova	%icc,	%l3,	%i4
	set	0x0A, %l5
	ldsha	[%l7 + %l5] 0x88,	%l6
loop_1284:
	fbn	%fcc0,	loop_1285
	udivcc	%o7,	0x1055,	%i0
	std	%g2,	[%l7 + 0x78]
	tne	%xcc,	0x4
loop_1285:
	fandnot2	%f24,	%f28,	%f0
	orncc	%i3,	0x1921,	%l4
	movvc	%xcc,	%o0,	%o3
	bvs,a	loop_1286
	movrne	%i6,	0x293,	%i2
	nop
	setx loop_1287, %l0, %l1
	jmpl %l1, %g1
	brgez	%g3,	loop_1288
loop_1286:
	fblg,a	%fcc3,	loop_1289
	nop
	setx	loop_1290,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_1287:
	movl	%xcc,	%g5,	%o4
loop_1288:
	nop
	setx	loop_1291,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_1289:
	fmovspos	%xcc,	%f16,	%f12
loop_1290:
	fbo,a	%fcc2,	loop_1292
	mova	%icc,	%g4,	%g7
loop_1291:
	fnegs	%f18,	%f30
	ldub	[%l7 + 0x1F],	%l0
loop_1292:
	movvc	%icc,	%i7,	%o2
	fzeros	%f3
	fbne,a	%fcc1,	loop_1293
	subcc	%l2,	%g6,	%l5
	fcmpne16	%f16,	%f18,	%l1
	set	0x14, %i0
	sta	%f31,	[%l7 + %i0] 0x11
loop_1293:
	ldd	[%l7 + 0x30],	%f30
	movl	%icc,	%o6,	%i1
	fbuge,a	%fcc0,	loop_1294
	andcc	%o1,	%o5,	%i5
	fandnot1s	%f27,	%f23,	%f17
	movcs	%icc,	%i4,	%l6
loop_1294:
	taddcc	%l3,	%o7,	%g2
	fmovdl	%icc,	%f30,	%f24
	tl	%icc,	0x6
	add	%l7,	0x68,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%i0
	casa	[%l6] 0x88,	%i0,	%l4
	orncc	%i3,	%o0,	%o3
	or	%i6,	%g1,	%i2
	nop
	setx	loop_1295,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fbuge	%fcc2,	loop_1296
	sra	%g3,	0x05,	%g5
	sdiv	%g4,	0x186D,	%o4
loop_1295:
	move	%xcc,	%g7,	%i7
loop_1296:
	tle	%xcc,	0x0
	alignaddrl	%o2,	%l2,	%l0
	brlez	%g6,	loop_1297
	taddcctv	%l5,	%l1,	%i1
	subccc	%o1,	0x048E,	%o5
	tne	%xcc,	0x0
loop_1297:
	fbule,a	%fcc3,	loop_1298
	taddcc	%i5,	0x1440,	%i4
	call	loop_1299
	ta	%icc,	0x4
loop_1298:
	sub	%o6,	%l3,	%l6
	fpack32	%f26,	%f14,	%f28
loop_1299:
	bpos,a,pt	%xcc,	loop_1300
	tpos	%xcc,	0x3
	fmovdge	%icc,	%f0,	%f4
	fblg,a	%fcc0,	loop_1301
loop_1300:
	nop
	setx	loop_1302,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movrgez	%g2,	%i0,	%o7
	orncc	%l4,	0x1B6D,	%i3
loop_1301:
	array16	%o3,	%o0,	%i6
loop_1302:
	nop
	wr	%g0,	0x18,	%asi
	lduha	[%l7 + 0x7E] %asi,	%g1
	movg	%xcc,	%g3,	%g5
	ble,pt	%icc,	loop_1303
	movrgz	%g4,	%o4,	%g7
	array16	%i7,	%o2,	%l2
	sdiv	%l0,	0x18AC,	%i2
loop_1303:
	fmovdg	%icc,	%f26,	%f11
	fbu	%fcc3,	loop_1304
	fnor	%f20,	%f24,	%f16
	smul	%g6,	%l5,	%l1
	fcmpeq16	%f2,	%f18,	%i1
loop_1304:
	call	loop_1305
	ldd	[%l7 + 0x40],	%f22
	udiv	%o5,	0x1D70,	%o1
	srax	%i5,	0x1D,	%i4
loop_1305:
	fmovrsgz	%o6,	%f27,	%f5
	movrgez	%l6,	0x152,	%l3
	bvc,a,pt	%xcc,	loop_1306
	umulcc	%i0,	0x1ADD,	%g2
	fbug,a	%fcc2,	loop_1307
	tl	%icc,	0x6
loop_1306:
	tle	%xcc,	0x1
	movleu	%icc,	%l4,	%i3
loop_1307:
	sllx	%o7,	0x08,	%o3
	fmovdl	%icc,	%f14,	%f15
	fpsub16	%f16,	%f6,	%f6
	ldstub	[%l7 + 0x5D],	%o0
	sll	%i6,	0x04,	%g3
	orcc	%g1,	0x177F,	%g4
	te	%icc,	0x7
	ta	%xcc,	0x5
	andn	%o4,	%g7,	%i7
	subc	%g5,	0x02B4,	%o2
	tpos	%icc,	0x6
	addc	%l2,	%l0,	%i2
	wr	%g0,	0x11,	%asi
	prefetcha	[%l7 + 0x20] %asi,	 0x2
	xnor	%g6,	0x06C9,	%l1
	fabss	%f14,	%f14
	array32	%i1,	%o5,	%i5
	fpack16	%f8,	%f7
	sll	%o1,	0x10,	%o6
	fnors	%f4,	%f11,	%f5
	andn	%l6,	%l3,	%i0
	edge8	%g2,	%i4,	%l4
	sdiv	%i3,	0x1317,	%o7
	tn	%icc,	0x4
	fbo,a	%fcc3,	loop_1308
	fbo	%fcc1,	loop_1309
	movg	%xcc,	%o3,	%i6
	tleu	%xcc,	0x3
loop_1308:
	fmovsl	%xcc,	%f5,	%f16
loop_1309:
	andncc	%g3,	%o0,	%g1
	bleu,a	%icc,	loop_1310
	sll	%g4,	0x1F,	%g7
	be	loop_1311
	addcc	%i7,	0x022A,	%o4
loop_1310:
	umul	%g5,	%l2,	%o2
	orn	%i2,	%l5,	%g6
loop_1311:
	edge32l	%l0,	%i1,	%l1
	call	loop_1312
	stb	%o5,	[%l7 + 0x5F]
	tne	%xcc,	0x5
	fmovrsgz	%i5,	%f18,	%f23
loop_1312:
	addc	%o6,	0x1738,	%l6
	fbu	%fcc3,	loop_1313
	bgu,a	%xcc,	loop_1314
	fmovsn	%icc,	%f13,	%f20
	fcmple16	%f16,	%f16,	%l3
loop_1313:
	srlx	%o1,	0x0B,	%g2
loop_1314:
	fmovdg	%icc,	%f17,	%f5
	movgu	%icc,	%i0,	%i4
	fmovdg	%xcc,	%f13,	%f2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ble	loop_1315
	ldsh	[%l7 + 0x78],	%l4
	nop
	setx loop_1316, %l0, %l1
	jmpl %l1, %i3
	move	%icc,	%o7,	%i6
loop_1315:
	tleu	%xcc,	0x7
	fmovspos	%xcc,	%f20,	%f19
loop_1316:
	edge8l	%g3,	%o0,	%g1
	sdivcc	%g4,	0x00AA,	%g7
	mulscc	%o3,	%o4,	%g5
	te	%icc,	0x6
	fpsub32s	%f10,	%f25,	%f2
	fmovrsgez	%l2,	%f2,	%f7
	fcmps	%fcc1,	%f2,	%f27
	std	%f0,	[%l7 + 0x20]
	movleu	%xcc,	%o2,	%i7
	fmovsle	%icc,	%f13,	%f30
	fpmerge	%f3,	%f14,	%f0
	alignaddr	%i2,	%l5,	%g6
	te	%xcc,	0x5
	stx	%l0,	[%l7 + 0x08]
	bleu,a,pn	%icc,	loop_1317
	tle	%icc,	0x4
	fcmpgt32	%f2,	%f10,	%l1
	tcc	%icc,	0x2
loop_1317:
	movvs	%xcc,	%o5,	%i1
	nop
	setx	loop_1318,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	subc	%i5,	%o6,	%l6
	fpadd16	%f22,	%f12,	%f14
	edge16ln	%l3,	%g2,	%i0
loop_1318:
	bshuffle	%f6,	%f10,	%f6
	bvc,a,pn	%xcc,	loop_1319
	fmovrdlez	%i4,	%f10,	%f2
	umul	%l4,	0x0C43,	%i3
	fmuld8sux16	%f7,	%f22,	%f6
loop_1319:
	movcc	%icc,	%o7,	%i6
	sllx	%o1,	0x0D,	%g3
	fmovrdlez	%g1,	%f2,	%f20
	taddcctv	%o0,	0x17E9,	%g7
	edge16	%g4,	%o3,	%g5
	fbug	%fcc2,	loop_1320
	smulcc	%l2,	%o2,	%i7
	membar	0x60
	nop
	set	0x3C, %g5
	lduw	[%l7 + %g5],	%i2
loop_1320:
	edge16l	%o4,	%g6,	%l5
	tcc	%xcc,	0x1
	te	%icc,	0x1
	tn	%icc,	0x5
	movne	%xcc,	%l0,	%l1
	fmovrslz	%o5,	%f25,	%f8
	std	%f24,	[%l7 + 0x78]
	movl	%xcc,	%i1,	%o6
	tneg	%xcc,	0x1
	lduw	[%l7 + 0x34],	%l6
	sethi	0x0C31,	%i5
	subccc	%g2,	%l3,	%i4
	set	0x55, %g2
	lduba	[%l7 + %g2] 0x19,	%i0
	fabss	%f3,	%f8
	tn	%icc,	0x5
	flush	%l7 + 0x38
	fmovdne	%icc,	%f20,	%f19
	nop
	set	0x70, %i4
	prefetch	[%l7 + %i4],	 0x1
	edge8	%i3,	%o7,	%i6
	tvc	%icc,	0x4
	movl	%xcc,	%l4,	%o1
	fmul8x16au	%f13,	%f22,	%f18
	nop
	set	0x60, %o3
	ldd	[%l7 + %o3],	%g2
	fnot2	%f2,	%f26
	tleu	%xcc,	0x7
	for	%f26,	%f26,	%f6
	fpsub16s	%f22,	%f26,	%f20
	st	%f3,	[%l7 + 0x10]
	st	%f30,	[%l7 + 0x6C]
	fcmpne16	%f14,	%f14,	%o0
	ldub	[%l7 + 0x54],	%g7
	edge32ln	%g1,	%g4,	%g5
	movneg	%icc,	%l2,	%o3
	udiv	%o2,	0x10C3,	%i2
	fmovspos	%icc,	%f21,	%f22
	sethi	0x085A,	%o4
	fmovda	%xcc,	%f23,	%f11
	fnegd	%f18,	%f20
	smulcc	%i7,	%l5,	%g6
	popc	%l0,	%o5
	movrlez	%l1,	%i1,	%o6
	movrgz	%i5,	0x003,	%g2
	mova	%xcc,	%l3,	%l6
	andncc	%i4,	%i3,	%i0
	subcc	%o7,	%i6,	%l4
	bneg	%xcc,	loop_1321
	fandnot1s	%f4,	%f17,	%f4
	fbug,a	%fcc0,	loop_1322
	nop
	setx	loop_1323,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_1321:
	or	%g3,	0x001C,	%o1
	sub	%o0,	%g7,	%g4
loop_1322:
	movrne	%g1,	0x01A,	%l2
loop_1323:
	brlez,a	%g5,	loop_1324
	stw	%o2,	[%l7 + 0x18]
	ba,a	loop_1325
	tge	%xcc,	0x2
loop_1324:
	fmovsgu	%icc,	%f23,	%f11
	wr	%g0,	0x0c,	%asi
	ldsba	[%l7 + 0x34] %asi,	%o3
loop_1325:
	ldd	[%l7 + 0x78],	%f24
	movre	%i2,	%i7,	%l5
	brgez	%g6,	loop_1326
	movvs	%icc,	%o4,	%l0
	and	%o5,	0x09D8,	%i1
	movgu	%xcc,	%l1,	%o6
loop_1326:
	sdiv	%i5,	0x0C11,	%g2
	fone	%f26
	movvc	%xcc,	%l6,	%i4
	movrlez	%l3,	%i3,	%i0
	movneg	%xcc,	%i6,	%o7
	tle	%icc,	0x2
	set	0x60, %g3
	swapa	[%l7 + %g3] 0x88,	%g3
	wr	%g0,	0x89,	%asi
	sta	%f27,	[%l7 + 0x28] %asi
	srax	%o1,	0x19,	%o0
	wr	%g0,	0xeb,	%asi
	stda	%l4,	[%l7 + 0x70] %asi
	membar	#Sync
	movvc	%icc,	%g4,	%g1
	edge16	%l2,	%g5,	%o2
	movleu	%icc,	%g7,	%i2
	fbne,a	%fcc3,	loop_1327
	edge8ln	%o3,	%l5,	%i7
	andcc	%o4,	%l0,	%g6
	brnz	%o5,	loop_1328
loop_1327:
	movcs	%xcc,	%l1,	%i1
	addc	%i5,	%g2,	%l6
	edge32l	%o6,	%i4,	%l3
loop_1328:
	andn	%i0,	0x10C8,	%i3
	tl	%icc,	0x3
	fmovsge	%xcc,	%f1,	%f9
	srlx	%i6,	0x1A,	%o7
	edge16l	%o1,	%g3,	%o0
	tpos	%xcc,	0x0
	add	%l7,	0x48,	%l6
	wr	%g0,	0x10,	%asi
	ldxa	[%l6] %asi,	%g4
	casxa	[%l6] %asi,	%g4,	%l4
	taddcc	%g1,	%g5,	%l2
	fbne	%fcc3,	loop_1329
	stx	%g7,	[%l7 + 0x18]
	edge16l	%i2,	%o3,	%l5
	set	0x26, %l4
	ldsba	[%l7 + %l4] 0x0c,	%o2
loop_1329:
	edge32n	%o4,	%l0,	%i7
	movrlz	%g6,	0x20A,	%o5
	sll	%l1,	%i5,	%g2
	wr	%g0,	0x18,	%asi
	lduba	[%l7 + 0x14] %asi,	%l6
	sir	0x11ED
	movne	%xcc,	%o6,	%i1
	fmovrdlez	%i4,	%f6,	%f28
	bcc,a,pt	%xcc,	loop_1330
	udivx	%i0,	0x1249,	%l3
	set	0x1C, %g4
	sta	%f11,	[%l7 + %g4] 0x19
loop_1330:
	array16	%i3,	%o7,	%i6
	tgu	%icc,	0x4
	movrlez	%g3,	%o1,	%g4
	srl	%o0,	%l4,	%g5
	fmovrsgez	%g1,	%f18,	%f30
	movgu	%xcc,	%g7,	%l2
	movl	%icc,	%i2,	%l5
	sll	%o2,	%o4,	%l0
	fbg,a	%fcc0,	loop_1331
	tcs	%xcc,	0x3
	umul	%o3,	%i7,	%o5
	fpadd16s	%f23,	%f11,	%f7
loop_1331:
	andn	%g6,	%l1,	%i5
	udivx	%l6,	0x1C18,	%g2
	wr	%g0,	0x21,	%asi
	stxa	%o6,	[%g0 + 0x8] %asi
	tgu	%icc,	0x1
	brgz	%i1,	loop_1332
	ldub	[%l7 + 0x15],	%i4
	movre	%l3,	%i3,	%o7
	add	%i6,	%i0,	%g3
loop_1332:
	nop
	setx loop_1333, %l0, %l1
	jmpl %l1, %g4
	edge8	%o0,	%o1,	%l4
	xor	%g5,	%g1,	%g7
	fbo,a	%fcc2,	loop_1334
loop_1333:
	fone	%f10
	tleu	%icc,	0x7
	sub	%l2,	0x1EB4,	%l5
loop_1334:
	fmovdvs	%icc,	%f14,	%f18
	fmovdle	%xcc,	%f20,	%f3
	alignaddr	%o2,	%o4,	%l0
	tgu	%icc,	0x7
	brlz	%o3,	loop_1335
	srl	%i2,	0x17,	%o5
	movg	%icc,	%i7,	%g6
	fpack32	%f30,	%f2,	%f12
loop_1335:
	sdivcc	%l1,	0x1079,	%i5
	udivx	%g2,	0x1F08,	%o6
	fmuld8sux16	%f21,	%f3,	%f2
	edge32	%l6,	%i4,	%i1
	call	loop_1336
	ldx	[%l7 + 0x50],	%i3
	tcc	%xcc,	0x7
	subccc	%o7,	%i6,	%i0
loop_1336:
	fpmerge	%f9,	%f16,	%f28
	alignaddrl	%l3,	%g4,	%o0
	flush	%l7 + 0x54
	fornot1	%f0,	%f22,	%f20
	edge8n	%o1,	%l4,	%g5
	sdiv	%g3,	0x1AAB,	%g7
	add	%l7,	0x20,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%l2
	casxa	[%l6] %asi,	%l2,	%g1
	fmovdg	%icc,	%f24,	%f22
	mulx	%l5,	%o2,	%o4
	fbge	%fcc0,	loop_1337
	tneg	%icc,	0x7
	movleu	%icc,	%l0,	%o3
	add	%l7,	0x10,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] %asi,	%o5,	%i2
loop_1337:
	tne	%xcc,	0x0
	movne	%icc,	%i7,	%g6
	srax	%i5,	%l1,	%o6
	sllx	%g2,	%i4,	%l6
	udiv	%i1,	0x09F7,	%o7
	tvc	%icc,	0x4
	fabsd	%f18,	%f26
	fmovsg	%xcc,	%f8,	%f24
	fbuge	%fcc1,	loop_1338
	orcc	%i6,	0x199D,	%i3
	edge32ln	%i0,	%g4,	%l3
	ba	loop_1339
loop_1338:
	tne	%icc,	0x5
	ba,pn	%xcc,	loop_1340
	andcc	%o1,	0x0CB8,	%l4
loop_1339:
	edge8	%g5,	%g3,	%o0
	sethi	0x1C0E,	%g7
loop_1340:
	edge16l	%g1,	%l5,	%l2
	stx	%o4,	[%l7 + 0x78]
	fones	%f15
	movrne	%l0,	%o2,	%o3
	ld	[%l7 + 0x78],	%f10
	fbul	%fcc3,	loop_1341
	tvc	%xcc,	0x4
	movge	%icc,	%o5,	%i7
	andcc	%i2,	0x1F99,	%i5
loop_1341:
	xor	%l1,	%g6,	%g2
	array8	%o6,	%i4,	%i1
	call	loop_1342
	stw	%l6,	[%l7 + 0x70]
	movl	%xcc,	%i6,	%i3
	xorcc	%o7,	%g4,	%i0
loop_1342:
	bcc,pt	%icc,	loop_1343
	fbl	%fcc3,	loop_1344
	tvc	%xcc,	0x0
	srlx	%l3,	0x1F,	%o1
loop_1343:
	te	%icc,	0x0
loop_1344:
	xnorcc	%g5,	0x0FF5,	%g3
	bvs,a	loop_1345
	mulx	%o0,	%l4,	%g7
	fbne	%fcc1,	loop_1346
	ldstub	[%l7 + 0x77],	%g1
loop_1345:
	nop
	set	0x56, %o1
	ldstuba	[%l7 + %o1] 0x89,	%l2
loop_1346:
	fsrc2	%f2,	%f8
	movgu	%icc,	%o4,	%l0
	addcc	%o2,	%o3,	%o5
	addcc	%i7,	0x1434,	%i2
	edge8	%i5,	%l1,	%l5
	fpadd16s	%f25,	%f16,	%f9
	movre	%g6,	0x19C,	%g2
	bpos,a,pn	%xcc,	loop_1347
	brlez	%i4,	loop_1348
	fmovscc	%icc,	%f26,	%f0
	edge32	%o6,	%l6,	%i6
loop_1347:
	bleu,pn	%icc,	loop_1349
loop_1348:
	movg	%icc,	%i3,	%o7
	be,pn	%icc,	loop_1350
	bshuffle	%f18,	%f6,	%f28
loop_1349:
	ldd	[%l7 + 0x70],	%f4
	edge16	%i1,	%i0,	%l3
loop_1350:
	fands	%f26,	%f3,	%f11
	bge,a	loop_1351
	bcs,a,pt	%xcc,	loop_1352
	fmovscc	%xcc,	%f16,	%f10
	array32	%o1,	%g4,	%g3
loop_1351:
	fmovrdne	%g5,	%f14,	%f8
loop_1352:
	bl,a,pn	%xcc,	loop_1353
	movrlez	%o0,	0x2A3,	%l4
	fmovrsgez	%g7,	%f26,	%f4
	bl,a	%icc,	loop_1354
loop_1353:
	brz,a	%l2,	loop_1355
	taddcctv	%o4,	%l0,	%o2
	lduh	[%l7 + 0x36],	%o3
loop_1354:
	tcc	%xcc,	0x2
loop_1355:
	tn	%icc,	0x1
	set	0x13, %i3
	ldstuba	[%l7 + %i3] 0x10,	%g1
	movvs	%xcc,	%i7,	%i2
	srax	%i5,	%l1,	%l5
	edge32	%g6,	%g2,	%o5
	movre	%i4,	%o6,	%i6
	tsubcc	%i3,	%o7,	%i1
	movpos	%icc,	%i0,	%l6
	fbuge	%fcc3,	loop_1356
	edge8n	%o1,	%l3,	%g3
	edge32n	%g5,	%g4,	%o0
	bge	loop_1357
loop_1356:
	bgu,a	loop_1358
	movvs	%xcc,	%g7,	%l4
	fnands	%f29,	%f31,	%f5
loop_1357:
	or	%l2,	0x164F,	%o4
loop_1358:
	nop
	wr	%g0,	0x88,	%asi
	ldsha	[%l7 + 0x52] %asi,	%o2
	fbg,a	%fcc1,	loop_1359
	movpos	%xcc,	%o3,	%g1
	fnegs	%f18,	%f20
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1359:
	nop
	set	0x4C, %i7
	sth	%i7,	[%l7 + %i7]
	wr	%g0,	0x89,	%asi
	stda	%i2,	[%l7 + 0x30] %asi
	fcmpes	%fcc3,	%f25,	%f15
	udivx	%i5,	0x094C,	%l0
	ldub	[%l7 + 0x56],	%l1
	subcc	%l5,	0x08D8,	%g2
	wr	%g0,	0x88,	%asi
	lda	[%l7 + 0x74] %asi,	%f26
	bcs,a	loop_1360
	edge16n	%o5,	%i4,	%o6
	movcc	%xcc,	%g6,	%i3
	edge8	%o7,	%i6,	%i1
loop_1360:
	fmovdvs	%icc,	%f1,	%f19
	edge8l	%i0,	%l6,	%l3
	xnorcc	%o1,	%g3,	%g4
	add	%o0,	%g7,	%l4
	mulx	%g5,	%l2,	%o4
	movre	%o3,	0x38D,	%g1
	fmovse	%xcc,	%f23,	%f9
	fmovda	%icc,	%f6,	%f12
	sra	%i7,	0x08,	%i2
	array32	%o2,	%l0,	%i5
	fand	%f20,	%f16,	%f14
	movvc	%icc,	%l1,	%l5
	tvs	%icc,	0x6
	andcc	%g2,	0x1704,	%i4
	edge8n	%o5,	%g6,	%i3
	ta	%xcc,	0x1
	sir	0x0A23
	fnot2s	%f5,	%f26
	brgz	%o6,	loop_1361
	fnot2s	%f10,	%f7
	wr	%g0,	0xf1,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
loop_1361:
	taddcc	%o7,	0x06D0,	%i1
	fbo	%fcc1,	loop_1362
	edge16n	%i6,	%i0,	%l3
	xor	%o1,	0x046F,	%l6
	tn	%icc,	0x0
loop_1362:
	mulscc	%g4,	%g3,	%o0
	movneg	%icc,	%g7,	%l4
	fmovsa	%xcc,	%f31,	%f19
	nop
	set	0x50, %g6
	prefetch	[%l7 + %g6],	 0x1
	edge8n	%l2,	%g5,	%o3
	movle	%icc,	%o4,	%i7
	tcc	%xcc,	0x2
	tvs	%xcc,	0x3
	std	%f22,	[%l7 + 0x20]
	fmovdle	%xcc,	%f27,	%f25
	xnor	%g1,	%o2,	%l0
	umulcc	%i5,	%i2,	%l5
	fbule	%fcc2,	loop_1363
	sdiv	%g2,	0x16F9,	%i4
	sth	%l1,	[%l7 + 0x78]
	wr	%g0,	0x81,	%asi
	ldsha	[%l7 + 0x50] %asi,	%g6
loop_1363:
	te	%xcc,	0x6
	nop
	setx	loop_1364,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movge	%icc,	%o5,	%o6
	alignaddrl	%i3,	%i1,	%i6
	movl	%xcc,	%o7,	%l3
loop_1364:
	srl	%o1,	%l6,	%g4
	fmovda	%xcc,	%f13,	%f5
	brgz	%g3,	loop_1365
	bge,a,pt	%icc,	loop_1366
	fpsub32s	%f14,	%f17,	%f13
	fbl	%fcc0,	loop_1367
loop_1365:
	movl	%icc,	%i0,	%o0
loop_1366:
	fmovrslz	%g7,	%f31,	%f27
	sethi	0x0E49,	%l4
loop_1367:
	movle	%icc,	%g5,	%o3
	st	%f31,	[%l7 + 0x58]
	fba,a	%fcc1,	loop_1368
	ble,a	loop_1369
	edge16n	%o4,	%i7,	%l2
	prefetch	[%l7 + 0x14],	 0x0
loop_1368:
	fmovrdlez	%g1,	%f10,	%f22
loop_1369:
	ldsb	[%l7 + 0x67],	%l0
	fmovsge	%icc,	%f7,	%f3
	fsrc1	%f12,	%f4
	sll	%i5,	0x0A,	%i2
	tl	%xcc,	0x3
	mulscc	%o2,	0x0759,	%l5
	taddcctv	%g2,	%l1,	%i4
	move	%xcc,	%o5,	%g6
	fpmerge	%f30,	%f14,	%f14
	std	%f10,	[%l7 + 0x10]
	set	0x10, %o6
	lduwa	[%l7 + %o6] 0x88,	%i3
	tvc	%xcc,	0x1
	subccc	%o6,	%i6,	%o7
	te	%xcc,	0x3
	fbuge	%fcc0,	loop_1370
	fmovscc	%xcc,	%f2,	%f14
	set	0x70, %l6
	stwa	%i1,	[%l7 + %l6] 0x19
loop_1370:
	smulcc	%l3,	0x056A,	%l6
	brgez,a	%o1,	loop_1371
	srlx	%g4,	%i0,	%g3
	stb	%o0,	[%l7 + 0x11]
	srlx	%g7,	0x0E,	%g5
loop_1371:
	taddcctv	%l4,	0x0E8B,	%o3
	fnot2s	%f19,	%f7
	bg,a	%icc,	loop_1372
	fmovd	%f0,	%f24
	fbue	%fcc2,	loop_1373
	xor	%i7,	0x1827,	%l2
loop_1372:
	nop
	set	0x2C, %i1
	lduha	[%l7 + %i1] 0x88,	%o4
loop_1373:
	edge32ln	%l0,	%g1,	%i5
	movre	%o2,	%i2,	%g2
	fpsub32	%f22,	%f0,	%f14
	nop
	setx loop_1374, %l0, %l1
	jmpl %l1, %l5
	udivcc	%i4,	0x1818,	%o5
	andncc	%l1,	%i3,	%g6
	array16	%o6,	%o7,	%i1
loop_1374:
	tvs	%icc,	0x1
	movl	%xcc,	%i6,	%l6
	tvc	%icc,	0x5
	wr	%g0,	0x0c,	%asi
	sta	%f20,	[%l7 + 0x1C] %asi
	movvs	%xcc,	%o1,	%l3
	or	%g4,	0x0176,	%i0
	fandnot2	%f14,	%f24,	%f14
	smulcc	%o0,	0x0121,	%g3
	movcc	%xcc,	%g7,	%g5
	fbug	%fcc2,	loop_1375
	brnz	%o3,	loop_1376
	fmul8x16au	%f13,	%f26,	%f2
	fba,a	%fcc3,	loop_1377
loop_1375:
	te	%xcc,	0x0
loop_1376:
	tvc	%icc,	0x4
	set	0x40, %g7
	ldda	[%l7 + %g7] 0x81,	%f0
loop_1377:
	fsrc2	%f18,	%f22
	fsrc1s	%f3,	%f6
	set	0x20, %l2
	stxa	%i7,	[%l7 + %l2] 0x10
	orcc	%l2,	0x0C9C,	%o4
	set	0x70, %o2
	lduha	[%l7 + %o2] 0x15,	%l0
	fmovsleu	%xcc,	%f29,	%f25
	movvc	%xcc,	%g1,	%i5
	fpsub32	%f10,	%f6,	%f14
	ba,a,pt	%icc,	loop_1378
	edge16n	%l4,	%o2,	%i2
	edge16n	%l5,	%i4,	%o5
	sdivx	%l1,	0x127F,	%g2
loop_1378:
	movrne	%g6,	%i3,	%o6
	bvs,pn	%icc,	loop_1379
	stx	%o7,	[%l7 + 0x10]
	swap	[%l7 + 0x44],	%i6
	wr	%g0,	0x04,	%asi
	lduwa	[%l7 + 0x28] %asi,	%l6
loop_1379:
	fbul,a	%fcc3,	loop_1380
	bge,a,pt	%xcc,	loop_1381
	tvs	%icc,	0x1
	fmovd	%f22,	%f10
loop_1380:
	fands	%f4,	%f9,	%f21
loop_1381:
	movg	%xcc,	%o1,	%i1
	srl	%g4,	0x10,	%i0
	sub	%l3,	%o0,	%g3
	set	0x4A, %g1
	stba	%g5,	[%l7 + %g1] 0x81
	tcc	%icc,	0x1
	array16	%o3,	%i7,	%l2
	brlez	%o4,	loop_1382
	edge16ln	%l0,	%g7,	%i5
	set	0x76, %l0
	stha	%l4,	[%l7 + %l0] 0xeb
	membar	#Sync
loop_1382:
	fbn,a	%fcc0,	loop_1383
	movne	%icc,	%g1,	%o2
	fmul8x16au	%f16,	%f13,	%f16
	smulcc	%l5,	%i2,	%o5
loop_1383:
	udivcc	%l1,	0x1A22,	%i4
	std	%g6,	[%l7 + 0x40]
	sdiv	%i3,	0x0748,	%o6
	edge32	%g2,	%i6,	%o7
	bgu,a,pn	%icc,	loop_1384
	udiv	%o1,	0x0AB1,	%l6
	alignaddrl	%i1,	%i0,	%l3
	fcmple32	%f20,	%f30,	%o0
loop_1384:
	nop
	wr	%g0,	0x2f,	%asi
	stha	%g3,	[%l7 + 0x3E] %asi
	membar	#Sync
	bleu,pt	%icc,	loop_1385
	orncc	%g4,	0x0DB1,	%g5
	fxor	%f24,	%f10,	%f2
	subc	%i7,	0x12D3,	%l2
loop_1385:
	udiv	%o3,	0x13F3,	%o4
	tg	%icc,	0x5
	edge16ln	%l0,	%i5,	%g7
	edge32	%l4,	%o2,	%l5
	wr	%g0,	0x81,	%asi
	ldstuba	[%l7 + 0x09] %asi,	%i2
	add	%l7,	0x4C,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%g1
	casa	[%l6] 0x81,	%g1,	%l1
	wr	%g0,	0x04,	%asi
	lduha	[%l7 + 0x48] %asi,	%o5
	umul	%g6,	%i4,	%o6
	fones	%f11
	fblg	%fcc1,	loop_1386
	stw	%i3,	[%l7 + 0x14]
	addcc	%g2,	%i6,	%o7
	udiv	%o1,	0x0DCD,	%l6
loop_1386:
	fbug	%fcc1,	loop_1387
	array8	%i0,	%i1,	%o0
	fbl,a	%fcc0,	loop_1388
	smulcc	%l3,	0x0F56,	%g3
loop_1387:
	nop
	wr	%g0,	0xe3,	%asi
	stwa	%g5,	[%l7 + 0x2C] %asi
	membar	#Sync
loop_1388:
	umulcc	%i7,	%g4,	%l2
	srax	%o3,	0x0C,	%l0
	fmovscs	%icc,	%f27,	%f18
	fsrc1	%f0,	%f30
	tcs	%xcc,	0x1
	xorcc	%i5,	%g7,	%o4
	movne	%xcc,	%o2,	%l5
	tg	%xcc,	0x2
	ble,pn	%icc,	loop_1389
	bg,a	loop_1390
	be,a	%xcc,	loop_1391
	edge8ln	%l4,	%g1,	%i2
loop_1389:
	fmovdl	%xcc,	%f30,	%f28
loop_1390:
	movrgz	%l1,	0x14C,	%o5
loop_1391:
	movrgez	%g6,	0x142,	%o6
	tle	%xcc,	0x0
	fbg,a	%fcc0,	loop_1392
	lduw	[%l7 + 0x20],	%i3
	tsubcc	%g2,	%i4,	%i6
	smulcc	%o1,	%l6,	%i0
loop_1392:
	movneg	%xcc,	%i1,	%o7
	wr	%g0,	0xea,	%asi
	stda	%l2,	[%l7 + 0x60] %asi
	membar	#Sync
	edge8ln	%g3,	%o0,	%g5
	srax	%i7,	0x07,	%g4
	call	loop_1393
	sdivcc	%o3,	0x0AB2,	%l2
	tvc	%icc,	0x6
	tg	%icc,	0x1
loop_1393:
	edge32n	%l0,	%i5,	%g7
	wr	%g0,	0x2f,	%asi
	stwa	%o2,	[%l7 + 0x7C] %asi
	membar	#Sync
	set	0x18, %i2
	prefetcha	[%l7 + %i2] 0x88,	 0x2
	movgu	%xcc,	%l5,	%g1
	set	0x40, %l1
	lduha	[%l7 + %l1] 0x18,	%l4
	fcmpeq16	%f4,	%f30,	%i2
	movcc	%xcc,	%l1,	%g6
	movleu	%icc,	%o5,	%i3
	udivcc	%o6,	0x0398,	%g2
	bg,a	%xcc,	loop_1394
	andcc	%i6,	%o1,	%l6
	umulcc	%i0,	0x0F2B,	%i4
	fmovrdgz	%i1,	%f8,	%f6
loop_1394:
	fpadd32	%f6,	%f4,	%f24
	fmovsle	%xcc,	%f3,	%f10
	movg	%icc,	%o7,	%g3
	fcmped	%fcc0,	%f24,	%f14
	fmovsg	%xcc,	%f28,	%f7
	edge16	%o0,	%g5,	%i7
	edge16	%l3,	%g4,	%l2
	ldd	[%l7 + 0x68],	%f26
	fmul8x16al	%f25,	%f15,	%f28
	tle	%xcc,	0x6
	tpos	%xcc,	0x3
	srlx	%o3,	0x0A,	%i5
	umulcc	%g7,	%l0,	%o4
	alignaddrl	%o2,	%l5,	%g1
	or	%l4,	0x0FEE,	%l1
	fmovrse	%g6,	%f13,	%f2
	set	0x44, %l3
	lduwa	[%l7 + %l3] 0x04,	%i2
	movgu	%icc,	%i3,	%o5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnors	%f7,	%f29,	%f6
	fbug,a	%fcc0,	loop_1395
	movpos	%xcc,	%o6,	%i6
	edge8n	%o1,	%g2,	%l6
	set	0x19, %i6
	ldstuba	[%l7 + %i6] 0x11,	%i0
loop_1395:
	tle	%icc,	0x2
	fbul	%fcc2,	loop_1396
	edge16	%i1,	%i4,	%o7
	lduh	[%l7 + 0x4A],	%o0
	movvc	%xcc,	%g5,	%g3
loop_1396:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bcc,a,pn	%icc,	loop_1397
	movvc	%xcc,	%i7,	%g4
	addccc	%l3,	%l2,	%o3
	orncc	%g7,	%l0,	%i5
loop_1397:
	sllx	%o2,	%l5,	%g1
	alignaddrl	%l4,	%l1,	%g6
	sdivx	%i2,	0x14FD,	%i3
	fbu	%fcc2,	loop_1398
	udivcc	%o4,	0x0F54,	%o5
	edge16ln	%o6,	%i6,	%g2
	movle	%xcc,	%l6,	%i0
loop_1398:
	subc	%o1,	0x15E3,	%i1
	udivx	%i4,	0x1584,	%o7
	fmovsa	%icc,	%f21,	%f1
	fbu	%fcc2,	loop_1399
	fpsub16s	%f9,	%f0,	%f30
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subccc	%g5,	0x09EA,	%o0
loop_1399:
	sdivx	%g3,	0x1296,	%i7
	set	0x40, %i5
	ldda	[%l7 + %i5] 0x81,	%f16
	movcs	%xcc,	%l3,	%g4
	fmovsl	%xcc,	%f8,	%f5
	fpadd32	%f20,	%f10,	%f26
	fnot2s	%f6,	%f4
	fcmpeq32	%f12,	%f20,	%o3
	fmovsgu	%xcc,	%f3,	%f9
	tvs	%icc,	0x5
	udivcc	%l2,	0x026F,	%l0
	sethi	0x0178,	%i5
	ld	[%l7 + 0x58],	%f1
	fone	%f10
	sllx	%o2,	0x19,	%g7
	nop
	set	0x20, %o4
	ldx	[%l7 + %o4],	%g1
	fpsub16s	%f13,	%f2,	%f3
	fands	%f11,	%f17,	%f26
	tleu	%xcc,	0x7
	tge	%xcc,	0x1
	edge32ln	%l4,	%l1,	%g6
	movrlz	%l5,	%i2,	%o4
	fzeros	%f21
	tvs	%icc,	0x2
	tne	%xcc,	0x5
	addc	%i3,	%o5,	%o6
	fandnot2	%f28,	%f26,	%f6
	subccc	%g2,	%i6,	%l6
	edge32ln	%i0,	%i1,	%i4
	set	0x40, %o0
	stwa	%o7,	[%l7 + %o0] 0xe2
	membar	#Sync
	andcc	%g5,	0x0336,	%o1
	edge8n	%g3,	%i7,	%l3
	xorcc	%g4,	%o0,	%o3
	fnegd	%f6,	%f22
	fpsub16	%f12,	%f28,	%f20
	movrgz	%l0,	0x2E9,	%l2
	movn	%icc,	%o2,	%i5
	add	%g1,	0x0999,	%g7
	fpack32	%f14,	%f10,	%f2
	set	0x42, %o5
	stba	%l4,	[%l7 + %o5] 0x18
	fones	%f29
	sll	%g6,	%l1,	%i2
	move	%icc,	%l5,	%i3
	tneg	%icc,	0x6
	andncc	%o5,	%o6,	%o4
	edge8ln	%g2,	%i6,	%l6
	sdivx	%i1,	0x0CB3,	%i0
	add	%o7,	%i4,	%o1
	udivx	%g5,	0x0451,	%g3
	tn	%icc,	0x1
	fmovdle	%xcc,	%f27,	%f28
	fblg,a	%fcc1,	loop_1400
	taddcc	%l3,	%i7,	%o0
	stbar
	edge16l	%g4,	%l0,	%l2
loop_1400:
	nop
	setx	loop_1401,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	edge8l	%o3,	%i5,	%o2
	lduh	[%l7 + 0x08],	%g7
	or	%g1,	0x16D3,	%g6
loop_1401:
	fone	%f10
	subcc	%l4,	%i2,	%l5
	movcc	%xcc,	%l1,	%o5
	subc	%o6,	0x0272,	%i3
	ld	[%l7 + 0x10],	%f24
	subccc	%g2,	%i6,	%o4
	wr	%g0,	0x57,	%asi
	stxa	%i1,	[%g0 + 0x0] %asi
	fbe	%fcc1,	loop_1402
	movg	%icc,	%i0,	%l6
	umul	%i4,	%o1,	%g5
	fmovrse	%g3,	%f18,	%f23
loop_1402:
	fbuge,a	%fcc0,	loop_1403
	fmovdneg	%icc,	%f30,	%f14
	edge32l	%l3,	%i7,	%o7
	edge8l	%g4,	%o0,	%l0
loop_1403:
	edge8l	%o3,	%i5,	%l2
	fand	%f24,	%f16,	%f16
	fpmerge	%f8,	%f23,	%f6
	movcc	%icc,	%g7,	%o2
	fmul8ulx16	%f22,	%f12,	%f18
	and	%g6,	%g1,	%i2
	movvs	%xcc,	%l4,	%l1
	brlez	%o5,	loop_1404
	fbe	%fcc1,	loop_1405
	fbu,a	%fcc0,	loop_1406
	alignaddrl	%l5,	%i3,	%o6
loop_1404:
	tle	%icc,	0x4
loop_1405:
	fandnot1s	%f19,	%f12,	%f13
loop_1406:
	addcc	%g2,	0x0264,	%i6
	fnot2	%f8,	%f20
	fcmpgt16	%f20,	%f6,	%i1
	wr	%g0,	0x04,	%asi
	ldxa	[%l7 + 0x40] %asi,	%i0
	fbne	%fcc0,	loop_1407
	movle	%xcc,	%o4,	%i4
	array16	%o1,	%g5,	%g3
	tcc	%icc,	0x5
loop_1407:
	srl	%l3,	%l6,	%o7
	fpadd32s	%f24,	%f29,	%f29
	tneg	%icc,	0x1
	movrgez	%g4,	%i7,	%l0
	set	0x58, %l5
	lduha	[%l7 + %l5] 0x0c,	%o0
	tne	%icc,	0x6
	fmovspos	%xcc,	%f21,	%f8
	fsrc2	%f24,	%f18
	fmovsge	%icc,	%f9,	%f16
	andn	%i5,	%l2,	%g7
	fzeros	%f6
	xnorcc	%o3,	%o2,	%g1
	sdiv	%g6,	0x15EF,	%i2
	addcc	%l1,	%o5,	%l4
	fsrc2s	%f5,	%f30
	addccc	%l5,	%o6,	%i3
	srl	%g2,	%i1,	%i0
	sub	%i6,	0x17C7,	%i4
	fba,a	%fcc3,	loop_1408
	lduw	[%l7 + 0x5C],	%o1
	ldsw	[%l7 + 0x6C],	%g5
	udivx	%o4,	0x17CD,	%l3
loop_1408:
	andncc	%g3,	%l6,	%o7
	movrgez	%i7,	0x087,	%g4
	set	0x60, %i0
	ldsba	[%l7 + %i0] 0x0c,	%l0
	xnorcc	%i5,	0x0466,	%l2
	smulcc	%g7,	%o0,	%o2
	wr	%g0,	0x0c,	%asi
	stwa	%o3,	[%l7 + 0x74] %asi
	bne,a,pt	%icc,	loop_1409
	movrgz	%g6,	0x2D1,	%i2
	addcc	%l1,	0x00F6,	%o5
	fbn	%fcc2,	loop_1410
loop_1409:
	fbuge	%fcc2,	loop_1411
	be,a	loop_1412
	fmovdg	%xcc,	%f24,	%f26
loop_1410:
	fmovrdlez	%l4,	%f28,	%f26
loop_1411:
	ba,a	loop_1413
loop_1412:
	fornot2	%f2,	%f20,	%f14
	fmovrde	%g1,	%f16,	%f12
	fbg	%fcc1,	loop_1414
loop_1413:
	tgu	%icc,	0x1
	addcc	%o6,	0x0D3A,	%l5
	movneg	%xcc,	%g2,	%i3
loop_1414:
	edge16n	%i0,	%i6,	%i1
	prefetch	[%l7 + 0x1C],	 0x1
	edge32	%i4,	%o1,	%g5
	fcmple16	%f16,	%f2,	%o4
	sub	%g3,	%l3,	%l6
	sll	%o7,	0x01,	%i7
	orcc	%l0,	%g4,	%l2
	sethi	0x084C,	%i5
	te	%xcc,	0x2
	array32	%o0,	%o2,	%g7
	pdist	%f0,	%f28,	%f2
	umulcc	%o3,	0x1DF4,	%i2
	bleu,a	%xcc,	loop_1415
	srax	%g6,	0x0D,	%o5
	ba	loop_1416
	bgu	%xcc,	loop_1417
loop_1415:
	movne	%icc,	%l1,	%l4
	fpsub32s	%f19,	%f4,	%f25
loop_1416:
	array8	%o6,	%g1,	%g2
loop_1417:
	nop
	wr	%g0,	0xeb,	%asi
	stda	%i2,	[%l7 + 0x50] %asi
	membar	#Sync
	tle	%xcc,	0x3
	addcc	%i0,	%l5,	%i6
	ba	loop_1418
	fandnot2	%f8,	%f18,	%f14
	addccc	%i1,	%o1,	%i4
	sub	%g5,	0x13C7,	%g3
loop_1418:
	bleu,a	loop_1419
	tsubcc	%l3,	%o4,	%l6
	tleu	%xcc,	0x7
	add	%l7,	0x58,	%l6
	wr	%g0,	0x0c,	%asi
	casxa	[%l6] %asi,	%i7,	%o7
loop_1419:
	sdivcc	%g4,	0x06C8,	%l0
	wr	%g0,	0x23,	%asi
	stha	%i5,	[%l7 + 0x12] %asi
	membar	#Sync
	edge32l	%l2,	%o0,	%g7
	xnor	%o2,	0x15D1,	%o3
	fbe,a	%fcc1,	loop_1420
	fors	%f12,	%f6,	%f31
	fcmpne32	%f30,	%f0,	%i2
	fpadd16	%f4,	%f10,	%f22
loop_1420:
	edge8	%g6,	%l1,	%l4
	sdiv	%o6,	0x144A,	%g1
	wr	%g0,	0x11,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	alignaddr	%g2,	%o5,	%i3
	xnorcc	%i0,	0x0831,	%l5
	subccc	%i1,	%i6,	%o1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bge,pt	%icc,	loop_1421
	movcc	%xcc,	%i4,	%g3
	edge8	%l3,	%o4,	%l6
	nop
	set	0x48, %o7
	std	%f2,	[%l7 + %o7]
loop_1421:
	swap	[%l7 + 0x40],	%i7
	smul	%o7,	%g5,	%l0
	bvc,pt	%icc,	loop_1422
	andn	%i5,	%l2,	%g4
	edge8n	%g7,	%o2,	%o3
	fmul8sux16	%f8,	%f6,	%f10
loop_1422:
	ldd	[%l7 + 0x08],	%o0
	tcc	%xcc,	0x1
	orcc	%i2,	%g6,	%l4
	sdivx	%o6,	0x1EC8,	%g1
	edge16ln	%l1,	%g2,	%o5
	movleu	%xcc,	%i0,	%i3
	bn,a	%xcc,	loop_1423
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdiv	%i1,	0x1715,	%l5
	lduh	[%l7 + 0x3A],	%i6
loop_1423:
	tcs	%icc,	0x0
	movrgez	%o1,	%i4,	%l3
	tgu	%xcc,	0x5
	wr	%g0,	0x10,	%asi
	sta	%f29,	[%l7 + 0x40] %asi
	umulcc	%o4,	0x1610,	%g3
	smul	%i7,	%o7,	%l6
	brlez	%g5,	loop_1424
	sth	%i5,	[%l7 + 0x1A]
	edge32	%l0,	%l2,	%g7
	movgu	%xcc,	%o2,	%o3
loop_1424:
	alignaddr	%g4,	%o0,	%g6
	fmovrsgez	%i2,	%f16,	%f11
	tsubcc	%o6,	%l4,	%l1
	xor	%g1,	%g2,	%o5
	fbuge	%fcc1,	loop_1425
	fbne	%fcc2,	loop_1426
	subc	%i3,	%i0,	%l5
	array16	%i1,	%i6,	%o1
loop_1425:
	ldstub	[%l7 + 0x1D],	%l3
loop_1426:
	fzeros	%f0
	bpos,a	%icc,	loop_1427
	nop
	set	0x30, %g2
	std	%f24,	[%l7 + %g2]
	fzeros	%f31
	st	%f3,	[%l7 + 0x20]
loop_1427:
	edge8l	%i4,	%o4,	%g3
	fbo,a	%fcc1,	loop_1428
	orncc	%o7,	%i7,	%g5
	fandnot1	%f28,	%f8,	%f4
	movcc	%icc,	%i5,	%l6
loop_1428:
	std	%l0,	[%l7 + 0x30]
	subccc	%g7,	0x11B7,	%l2
	fones	%f14
	fpadd16s	%f0,	%f31,	%f31
	bge	%xcc,	loop_1429
	tleu	%icc,	0x1
	srlx	%o2,	%o3,	%o0
	fmul8x16al	%f18,	%f26,	%f28
loop_1429:
	fbo	%fcc1,	loop_1430
	fabss	%f26,	%f30
	fmovspos	%icc,	%f31,	%f30
	udiv	%g4,	0x15CB,	%i2
loop_1430:
	ba,a,pt	%icc,	loop_1431
	ldub	[%l7 + 0x66],	%g6
	tneg	%xcc,	0x1
	set	0x36, %i4
	ldsha	[%l7 + %i4] 0x89,	%o6
loop_1431:
	sra	%l1,	0x1F,	%g1
	bneg	%xcc,	loop_1432
	subc	%g2,	0x040D,	%l4
	movleu	%icc,	%o5,	%i0
	fmovsa	%xcc,	%f11,	%f20
loop_1432:
	stb	%l5,	[%l7 + 0x75]
	fmovdgu	%xcc,	%f31,	%f22
	fcmple16	%f16,	%f10,	%i1
	sra	%i6,	%o1,	%i3
	fnot2s	%f8,	%f13
	edge8	%l3,	%o4,	%i4
	ldsb	[%l7 + 0x74],	%o7
	edge16	%i7,	%g3,	%i5
	umulcc	%l6,	%g5,	%l0
	movpos	%xcc,	%l2,	%o2
	fnor	%f26,	%f18,	%f26
	fcmpne32	%f22,	%f10,	%o3
	udivx	%g7,	0x0C85,	%g4
	mulscc	%o0,	%g6,	%i2
	movcs	%xcc,	%o6,	%l1
	fmovdpos	%xcc,	%f0,	%f24
	sth	%g2,	[%l7 + 0x6A]
	edge8l	%g1,	%l4,	%o5
	movne	%xcc,	%l5,	%i0
	fmovrdgez	%i1,	%f6,	%f20
	andncc	%o1,	%i3,	%l3
	sra	%i6,	%i4,	%o7
	sdivcc	%i7,	0x0B78,	%o4
	xnor	%i5,	%l6,	%g3
	fcmpeq32	%f8,	%f12,	%l0
	smul	%g5,	0x058B,	%o2
	tne	%xcc,	0x4
	movcc	%icc,	%o3,	%g7
	subcc	%g4,	0x1824,	%o0
	sllx	%l2,	0x00,	%g6
	subccc	%o6,	0x072E,	%l1
	fabss	%f24,	%f14
	bneg	%icc,	loop_1433
	movleu	%icc,	%i2,	%g2
	addc	%l4,	0x03FB,	%o5
	fmul8sux16	%f22,	%f6,	%f4
loop_1433:
	ldsw	[%l7 + 0x7C],	%l5
	fornot1	%f22,	%f20,	%f12
	fpadd16	%f22,	%f6,	%f24
	or	%g1,	%i1,	%o1
	stb	%i0,	[%l7 + 0x1A]
	brlz,a	%i3,	loop_1434
	fmovdcs	%icc,	%f0,	%f24
	tvs	%xcc,	0x3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1434:
	fnegd	%f4,	%f10
	fand	%f2,	%f26,	%f0
	xnorcc	%i6,	%i4,	%o7
	edge8	%i7,	%o4,	%l3
	edge8l	%l6,	%i5,	%l0
	fnand	%f22,	%f2,	%f24
	fbug,a	%fcc1,	loop_1435
	edge32l	%g5,	%o2,	%g3
	fcmple16	%f14,	%f0,	%o3
	mova	%icc,	%g7,	%g4
loop_1435:
	or	%o0,	%l2,	%o6
	fpadd32	%f8,	%f10,	%f16
	srax	%g6,	0x09,	%i2
	edge16n	%g2,	%l4,	%l1
	fmovrsgez	%o5,	%f14,	%f7
	edge16ln	%l5,	%g1,	%i1
	fbl	%fcc0,	loop_1436
	sllx	%i0,	%o1,	%i3
	orncc	%i6,	0x106F,	%i4
	movrlez	%i7,	0x3EF,	%o4
loop_1436:
	nop
	set	0x74, %g5
	swapa	[%l7 + %g5] 0x80,	%l3
	taddcc	%o7,	%l6,	%l0
	movre	%g5,	%o2,	%i5
	fmuld8ulx16	%f28,	%f23,	%f0
	wr	%g0,	0x81,	%asi
	lda	[%l7 + 0x64] %asi,	%f24
	edge16l	%g3,	%g7,	%o3
	tpos	%icc,	0x0
	tcc	%icc,	0x3
	wr	%g0,	0x04,	%asi
	ldda	[%l7 + 0x10] %asi,	%o0
	popc	0x1C2D,	%l2
	sdivcc	%o6,	0x0691,	%g6
	ld	[%l7 + 0x14],	%f30
	ldsw	[%l7 + 0x34],	%g4
	alignaddr	%i2,	%l4,	%l1
	fmovsn	%xcc,	%f3,	%f6
	addccc	%o5,	0x0A94,	%g2
	addc	%l5,	%i1,	%g1
	tge	%icc,	0x4
	movrgez	%i0,	%o1,	%i3
	xnor	%i4,	0x179D,	%i7
	fbuge,a	%fcc3,	loop_1437
	movl	%icc,	%o4,	%l3
	tle	%icc,	0x3
	subc	%i6,	%l6,	%o7
loop_1437:
	orncc	%l0,	0x0FFB,	%o2
	tn	%xcc,	0x5
	movne	%icc,	%i5,	%g5
	fnand	%f2,	%f10,	%f24
	nop
	setx	loop_1438,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fnor	%f10,	%f6,	%f22
	fmul8x16au	%f14,	%f9,	%f26
	edge8	%g3,	%o3,	%o0
loop_1438:
	nop
	set	0x3C, %o3
	ldstuba	[%l7 + %o3] 0x88,	%g7
	edge16	%l2,	%o6,	%g4
	tneg	%icc,	0x1
	array8	%g6,	%i2,	%l1
	wr	%g0,	0x88,	%asi
	ldda	[%l7 + 0x10] %asi,	%l4
	lduw	[%l7 + 0x7C],	%o5
	call	loop_1439
	alignaddr	%g2,	%l5,	%g1
	udivx	%i1,	0x1C67,	%o1
	fbl,a	%fcc2,	loop_1440
loop_1439:
	sdivx	%i3,	0x1241,	%i4
	edge32ln	%i0,	%o4,	%i7
	movn	%icc,	%l3,	%i6
loop_1440:
	subcc	%o7,	%l0,	%l6
	movne	%xcc,	%o2,	%g5
	movne	%icc,	%g3,	%i5
	and	%o3,	%g7,	%o0
	fornot2s	%f20,	%f9,	%f9
	tne	%xcc,	0x2
	fands	%f18,	%f23,	%f28
	bvc	loop_1441
	taddcc	%o6,	%g4,	%g6
	tsubcc	%i2,	0x0008,	%l1
	fmovsne	%icc,	%f8,	%f24
loop_1441:
	xnor	%l4,	0x15ED,	%o5
	tleu	%icc,	0x7
	bvc,pt	%xcc,	loop_1442
	fnands	%f30,	%f12,	%f13
	swap	[%l7 + 0x6C],	%g2
	movneg	%xcc,	%l5,	%g1
loop_1442:
	fmovdneg	%icc,	%f24,	%f18
	movvs	%icc,	%l2,	%i1
	fpadd32s	%f5,	%f2,	%f25
	membar	#Sync
	set	0x40, %g3
	ldda	[%l7 + %g3] 0xf8,	%f0
	st	%f16,	[%l7 + 0x38]
	addcc	%o1,	0x0624,	%i3
	movcc	%xcc,	%i4,	%i0
	movg	%icc,	%i7,	%l3
	ldsb	[%l7 + 0x61],	%i6
	ldstub	[%l7 + 0x7E],	%o4
	sdivcc	%o7,	0x155C,	%l0
	prefetch	[%l7 + 0x3C],	 0x1
	tn	%xcc,	0x2
	fandnot1	%f14,	%f6,	%f16
	sir	0x00B3
	fsrc1s	%f12,	%f31
	fcmps	%fcc2,	%f31,	%f24
	tl	%icc,	0x2
	brz	%l6,	loop_1443
	addcc	%g5,	0x1D70,	%o2
	bg,pn	%xcc,	loop_1444
	fmovsn	%icc,	%f24,	%f13
loop_1443:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fblg	%fcc1,	loop_1445
loop_1444:
	tvc	%xcc,	0x4
	sra	%i5,	0x1B,	%g3
	move	%icc,	%o3,	%o0
loop_1445:
	sdivx	%o6,	0x0792,	%g7
	movge	%xcc,	%g6,	%i2
	movne	%icc,	%l1,	%g4
	fmovscs	%icc,	%f31,	%f10
	sra	%l4,	0x10,	%g2
	smulcc	%o5,	%g1,	%l5
	movrlz	%i1,	0x382,	%l2
	edge16n	%o1,	%i4,	%i3
	tsubcc	%i0,	%i7,	%i6
	edge16	%l3,	%o4,	%l0
	movcs	%icc,	%o7,	%g5
	movgu	%icc,	%o2,	%i5
	movre	%l6,	0x160,	%o3
	subc	%o0,	%o6,	%g3
	tge	%icc,	0x7
	movrgz	%g7,	0x095,	%i2
	for	%f10,	%f26,	%f10
	sll	%g6,	%l1,	%g4
	fbul	%fcc0,	loop_1446
	edge16l	%l4,	%o5,	%g2
	bne,pn	%xcc,	loop_1447
	te	%icc,	0x2
loop_1446:
	tvs	%icc,	0x4
	membar	#Sync
	set	0x40, %l4
	ldda	[%l7 + %l4] 0xf8,	%f16
loop_1447:
	addccc	%l5,	0x1217,	%i1
	fmovs	%f10,	%f0
	alignaddrl	%l2,	%g1,	%o1
	addc	%i4,	0x0AB3,	%i3
	array32	%i0,	%i7,	%i6
	sdivcc	%o4,	0x0914,	%l3
	alignaddrl	%l0,	%o7,	%g5
	movge	%icc,	%o2,	%l6
	fmovsne	%icc,	%f15,	%f21
	ldub	[%l7 + 0x30],	%i5
	stbar
	fblg,a	%fcc2,	loop_1448
	sra	%o0,	0x01,	%o6
	movcs	%icc,	%o3,	%g7
	call	loop_1449
loop_1448:
	fexpand	%f4,	%f14
	smul	%g3,	0x0F62,	%i2
	te	%icc,	0x1
loop_1449:
	movgu	%icc,	%g6,	%l1
	tle	%icc,	0x6
	alignaddr	%l4,	%o5,	%g2
	array32	%g4,	%l5,	%l2
	nop
	set	0x46, %g4
	sth	%i1,	[%l7 + %g4]
	fbu,a	%fcc2,	loop_1450
	tneg	%icc,	0x2
	ldub	[%l7 + 0x10],	%g1
	umulcc	%i4,	%i3,	%i0
loop_1450:
	tle	%icc,	0x7
	movrlz	%o1,	%i6,	%o4
	fcmpeq16	%f24,	%f10,	%l3
	tvc	%xcc,	0x2
	te	%icc,	0x0
	wr	%g0,	0x0c,	%asi
	lduba	[%l7 + 0x3C] %asi,	%i7
	mulx	%l0,	0x0354,	%o7
	tg	%icc,	0x5
	fmovrsgez	%g5,	%f2,	%f14
	fornot1	%f18,	%f26,	%f16
	fmovdvc	%xcc,	%f3,	%f5
	tneg	%xcc,	0x7
	addc	%l6,	%o2,	%i5
	smul	%o0,	%o6,	%g7
	brlz	%g3,	loop_1451
	edge32l	%i2,	%g6,	%l1
	fmovsg	%icc,	%f23,	%f25
	fmovdl	%xcc,	%f19,	%f28
loop_1451:
	edge16n	%l4,	%o5,	%o3
	set	0x60, %o1
	sta	%f23,	[%l7 + %o1] 0x15
	mulscc	%g4,	%l5,	%l2
	movg	%xcc,	%i1,	%g1
	movrne	%i4,	0x31B,	%g2
	tleu	%icc,	0x1
	tneg	%xcc,	0x4
	tcc	%xcc,	0x0
	movrlz	%i3,	0x276,	%i0
	srax	%o1,	0x07,	%i6
	smulcc	%l3,	%o4,	%l0
	fpadd16	%f2,	%f4,	%f8
	wr	%g0,	0x88,	%asi
	ldstuba	[%l7 + 0x20] %asi,	%o7
	edge8	%g5,	%l6,	%i7
	nop
	setx	loop_1452,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	bg,pn	%xcc,	loop_1453
	udivcc	%i5,	0x19F2,	%o2
	tvs	%icc,	0x5
loop_1452:
	ldsh	[%l7 + 0x40],	%o6
loop_1453:
	movge	%xcc,	%g7,	%o0
	bcc,a,pn	%xcc,	loop_1454
	movgu	%icc,	%i2,	%g6
	bneg,a,pt	%xcc,	loop_1455
	sllx	%g3,	0x1E,	%l1
loop_1454:
	st	%f22,	[%l7 + 0x64]
	brz,a	%o5,	loop_1456
loop_1455:
	movleu	%xcc,	%o3,	%g4
	fpadd32	%f16,	%f20,	%f14
	ta	%icc,	0x2
loop_1456:
	xor	%l5,	%l4,	%i1
	fbe	%fcc0,	loop_1457
	alignaddr	%l2,	%i4,	%g1
	tleu	%xcc,	0x0
	fmovrslz	%i3,	%f19,	%f16
loop_1457:
	subccc	%i0,	%g2,	%o1
	sub	%i6,	%o4,	%l0
	fbule,a	%fcc2,	loop_1458
	bpos	loop_1459
	fandnot2	%f14,	%f10,	%f6
	edge16ln	%o7,	%g5,	%l3
loop_1458:
	move	%icc,	%i7,	%l6
loop_1459:
	bcs,pt	%icc,	loop_1460
	movn	%xcc,	%o2,	%i5
	fmovrde	%g7,	%f4,	%f16
	edge8ln	%o0,	%i2,	%o6
loop_1460:
	tvs	%xcc,	0x0
	fmuld8sux16	%f24,	%f9,	%f24
	edge8l	%g3,	%l1,	%o5
	orcc	%g6,	0x09C2,	%g4
	or	%o3,	%l5,	%i1
	movvs	%xcc,	%l2,	%i4
	set	0x50, %i3
	lda	[%l7 + %i3] 0x04,	%f30
	fabss	%f29,	%f16
	subc	%g1,	%i3,	%i0
	fcmple16	%f12,	%f16,	%g2
	subccc	%o1,	0x0734,	%l4
	fmovrdne	%i6,	%f28,	%f12
	set	0x18, %g6
	stwa	%l0,	[%l7 + %g6] 0xea
	membar	#Sync
	fcmple16	%f30,	%f6,	%o4
	srlx	%o7,	%l3,	%i7
	movrne	%l6,	%g5,	%i5
	brz	%g7,	loop_1461
	fmovdn	%icc,	%f0,	%f19
	srl	%o2,	%o0,	%o6
	srlx	%i2,	%g3,	%o5
loop_1461:
	bpos,pn	%icc,	loop_1462
	nop
	set	0x68, %i7
	std	%f2,	[%l7 + %i7]
	fcmpgt16	%f16,	%f2,	%g6
	fnot1s	%f15,	%f22
loop_1462:
	fexpand	%f7,	%f22
	andncc	%l1,	%o3,	%l5
	movrgz	%i1,	0x37D,	%l2
	fmovdn	%icc,	%f25,	%f20
	ldsh	[%l7 + 0x18],	%i4
	call	loop_1463
	tneg	%icc,	0x6
	mulx	%g4,	%i3,	%g1
	mulscc	%g2,	0x19B4,	%i0
loop_1463:
	fbne	%fcc2,	loop_1464
	fmovde	%icc,	%f15,	%f10
	set	0x10, %o6
	ldda	[%l7 + %o6] 0x14,	%l4
loop_1464:
	andn	%o1,	0x0196,	%l0
	std	%f24,	[%l7 + 0x70]
	fmovsle	%icc,	%f13,	%f22
	wr	%g0,	0x18,	%asi
	stwa	%o4,	[%l7 + 0x74] %asi
	tle	%icc,	0x7
	wr	%g0,	0x18,	%asi
	ldsba	[%l7 + 0x56] %asi,	%i6
	ldub	[%l7 + 0x7A],	%l3
	xorcc	%o7,	0x0D6E,	%l6
	fmovdneg	%icc,	%f19,	%f13
	udiv	%i7,	0x1C5C,	%i5
	array16	%g5,	%o2,	%o0
	srl	%o6,	%g7,	%g3
	membar	0x2C
	xnorcc	%i2,	%g6,	%l1
	edge32	%o3,	%o5,	%l5
	movrne	%i1,	%l2,	%g4
	fcmple32	%f28,	%f22,	%i4
	swap	[%l7 + 0x0C],	%i3
	fxnors	%f8,	%f25,	%f6
	smulcc	%g2,	%g1,	%l4
	fcmple32	%f20,	%f18,	%o1
	movrlz	%i0,	0x1B0,	%o4
	addc	%i6,	%l3,	%l0
	set	0x34, %l6
	stwa	%o7,	[%l7 + %l6] 0x81
	alignaddrl	%l6,	%i7,	%i5
	edge8l	%g5,	%o2,	%o0
	tcc	%xcc,	0x0
	subccc	%g7,	0x01C4,	%g3
	movneg	%icc,	%i2,	%g6
	be,a,pn	%icc,	loop_1465
	movge	%icc,	%l1,	%o6
	call	loop_1466
	subccc	%o5,	%o3,	%i1
loop_1465:
	fnegs	%f12,	%f5
	ldub	[%l7 + 0x17],	%l5
loop_1466:
	stw	%g4,	[%l7 + 0x30]
	add	%l7,	0x68,	%l6
	wr	%g0,	0x0c,	%asi
	casxa	[%l6] %asi,	%i4,	%i3
	sdivcc	%g2,	0x1A00,	%l2
	and	%g1,	%l4,	%o1
	fmovda	%xcc,	%f31,	%f2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andn	%o4,	%i0,	%i6
	udivcc	%l3,	0x14CF,	%l0
	movrgez	%o7,	0x0B1,	%l6
	edge8ln	%i7,	%g5,	%o2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xorcc	%o0,	0x0307,	%i5
	tne	%icc,	0x2
	movn	%icc,	%g3,	%i2
	movg	%xcc,	%g7,	%g6
	mova	%xcc,	%l1,	%o5
	fmovrslez	%o3,	%f4,	%f28
	fand	%f20,	%f24,	%f26
	fcmpgt32	%f22,	%f28,	%o6
	sdivcc	%i1,	0x0798,	%g4
	sra	%i4,	%l5,	%g2
	orn	%i3,	0x0FE9,	%l2
	edge8	%l4,	%o1,	%o4
	siam	0x0
	set	0x0C, %g7
	ldstuba	[%l7 + %g7] 0x88,	%g1
	movvs	%xcc,	%i6,	%i0
	movpos	%icc,	%l3,	%l0
	ldx	[%l7 + 0x68],	%l6
	set	0x18, %l2
	swapa	[%l7 + %l2] 0x04,	%o7
	array8	%g5,	%i7,	%o2
	stb	%o0,	[%l7 + 0x7F]
	movre	%i5,	0x07A,	%i2
	fmovs	%f5,	%f22
	sllx	%g7,	0x11,	%g6
	fandnot2	%f4,	%f20,	%f4
	tl	%icc,	0x5
	movge	%xcc,	%l1,	%o5
	movg	%icc,	%o3,	%g3
	andncc	%o6,	%i1,	%i4
	mulx	%l5,	0x131C,	%g4
	movrlz	%i3,	%g2,	%l2
	sir	0x0D07
	fmuld8sux16	%f30,	%f2,	%f24
	sir	0x0419
	movrgez	%o1,	%l4,	%g1
	fpack32	%f20,	%f18,	%f22
	fandnot2	%f22,	%f10,	%f30
	srax	%o4,	%i0,	%i6
	andcc	%l3,	0x0811,	%l6
	bvc	loop_1467
	subc	%l0,	%g5,	%i7
	movcc	%xcc,	%o7,	%o0
	ldsb	[%l7 + 0x22],	%i5
loop_1467:
	edge16l	%o2,	%i2,	%g6
	edge16ln	%l1,	%g7,	%o3
	movre	%o5,	0x225,	%g3
	tleu	%xcc,	0x6
	addc	%i1,	%o6,	%l5
	udivx	%g4,	0x0953,	%i3
	umul	%g2,	0x1EE4,	%l2
	nop
	setx	loop_1468,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	move	%xcc,	%o1,	%i4
	edge16ln	%g1,	%o4,	%i0
	array16	%i6,	%l4,	%l6
loop_1468:
	stx	%l3,	[%l7 + 0x58]
	edge8n	%g5,	%i7,	%l0
	ta	%xcc,	0x6
	tneg	%icc,	0x4
	subccc	%o0,	0x0F41,	%i5
	bpos,a,pt	%xcc,	loop_1469
	bpos,a	%icc,	loop_1470
	movgu	%xcc,	%o7,	%i2
	fmovsn	%xcc,	%f6,	%f23
loop_1469:
	umul	%o2,	%l1,	%g7
loop_1470:
	movn	%xcc,	%g6,	%o3
	fmovdvs	%xcc,	%f3,	%f29
	movn	%xcc,	%o5,	%i1
	movle	%xcc,	%g3,	%o6
	tsubcc	%g4,	0x128F,	%i3
	membar	0x4B
	tn	%icc,	0x0
	addcc	%g2,	0x1DAB,	%l2
	tpos	%xcc,	0x0
	tpos	%icc,	0x4
	fpadd32	%f8,	%f18,	%f24
	call	loop_1471
	and	%l5,	%o1,	%g1
	stx	%i4,	[%l7 + 0x48]
	subccc	%i0,	%o4,	%l4
loop_1471:
	srlx	%l6,	0x14,	%i6
	movrgz	%g5,	0x0A0,	%i7
	mova	%xcc,	%l0,	%o0
	subc	%i5,	%l3,	%o7
	movn	%icc,	%o2,	%i2
	call	loop_1472
	fabss	%f29,	%f25
	stb	%l1,	[%l7 + 0x63]
	fbu	%fcc3,	loop_1473
loop_1472:
	ble,pn	%xcc,	loop_1474
	ldstub	[%l7 + 0x12],	%g7
	std	%f16,	[%l7 + 0x68]
loop_1473:
	nop
	wr	%g0,	0x19,	%asi
	ldda	[%l7 + 0x10] %asi,	%g6
loop_1474:
	popc	0x1BD0,	%o3
	brgez	%o5,	loop_1475
	movgu	%xcc,	%i1,	%g3
	subcc	%g4,	%o6,	%g2
	tvc	%icc,	0x4
loop_1475:
	fmul8x16au	%f29,	%f31,	%f22
	edge32ln	%i3,	%l2,	%l5
	andn	%o1,	%i4,	%g1
	fcmpgt32	%f2,	%f22,	%o4
	movn	%icc,	%l4,	%l6
	stx	%i6,	[%l7 + 0x28]
	movn	%icc,	%i0,	%g5
	smulcc	%l0,	%o0,	%i5
	taddcc	%i7,	%l3,	%o7
	fone	%f18
	bg	%xcc,	loop_1476
	fbul,a	%fcc3,	loop_1477
	ldd	[%l7 + 0x38],	%i2
	nop
	set	0x1A, %o2
	stb	%o2,	[%l7 + %o2]
loop_1476:
	movvs	%xcc,	%g7,	%l1
loop_1477:
	tpos	%xcc,	0x3
	fmuld8ulx16	%f5,	%f11,	%f2
	addcc	%o3,	%o5,	%g6
	taddcc	%i1,	0x0366,	%g4
	brgz,a	%o6,	loop_1478
	fone	%f26
	tl	%icc,	0x1
	tsubcc	%g2,	0x003E,	%g3
loop_1478:
	sllx	%i3,	0x06,	%l5
	edge32n	%o1,	%l2,	%g1
	tcc	%xcc,	0x2
	addcc	%i4,	%l4,	%o4
	fmul8x16al	%f24,	%f7,	%f0
	movvs	%icc,	%i6,	%i0
	movl	%icc,	%l6,	%g5
	fsrc2s	%f5,	%f15
	ldd	[%l7 + 0x40],	%f18
	array8	%o0,	%i5,	%l0
	tvs	%icc,	0x7
	fmovdvs	%icc,	%f4,	%f23
	fxor	%f2,	%f18,	%f28
	orn	%l3,	%o7,	%i7
	std	%f22,	[%l7 + 0x18]
	sethi	0x179F,	%o2
	tn	%xcc,	0x1
	fcmpeq32	%f2,	%f20,	%g7
	fornot2	%f4,	%f12,	%f14
	tsubcctv	%i2,	%l1,	%o3
	tvc	%xcc,	0x4
	bl	loop_1479
	flush	%l7 + 0x24
	call	loop_1480
	array16	%o5,	%i1,	%g6
loop_1479:
	movg	%xcc,	%g4,	%o6
	wr	%g0,	0x04,	%asi
	ldxa	[%l7 + 0x58] %asi,	%g3
loop_1480:
	andcc	%g2,	0x034C,	%i3
	edge32	%l5,	%o1,	%g1
	tneg	%xcc,	0x1
	orn	%i4,	%l4,	%l2
	ldstub	[%l7 + 0x5D],	%o4
	movrlz	%i0,	%l6,	%g5
	array32	%o0,	%i5,	%l0
	movrgz	%l3,	%i6,	%o7
	stbar
	orncc	%i7,	0x0544,	%o2
	ldd	[%l7 + 0x40],	%i2
	tge	%xcc,	0x5
	bleu,pn	%xcc,	loop_1481
	orncc	%g7,	%o3,	%l1
	edge16ln	%i1,	%o5,	%g6
	wr	%g0,	0xf9,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
loop_1481:
	bg,a	loop_1482
	bne,a,pt	%icc,	loop_1483
	tleu	%xcc,	0x6
	movvs	%xcc,	%o6,	%g4
loop_1482:
	fmovscc	%icc,	%f3,	%f9
loop_1483:
	ble,pn	%icc,	loop_1484
	brgez,a	%g2,	loop_1485
	std	%i2,	[%l7 + 0x48]
	fbule,a	%fcc2,	loop_1486
loop_1484:
	fbn	%fcc0,	loop_1487
loop_1485:
	sllx	%g3,	%o1,	%l5
	movg	%icc,	%i4,	%g1
loop_1486:
	tsubcc	%l2,	0x0D62,	%l4
loop_1487:
	mova	%icc,	%i0,	%o4
	xnor	%g5,	0x1276,	%l6
	taddcctv	%o0,	0x18BA,	%i5
	fsrc2	%f16,	%f26
	tne	%xcc,	0x7
	wr	%g0,	0x2f,	%asi
	ldda	[%l7 + 0x60] %asi,	%l0
	udiv	%l3,	0x0B00,	%o7
	ta	%xcc,	0x7
	movl	%icc,	%i6,	%i7
	alignaddr	%i2,	%g7,	%o3
	brlz	%l1,	loop_1488
	fmovsa	%xcc,	%f28,	%f28
	addccc	%i1,	0x0569,	%o5
	fmovrse	%g6,	%f25,	%f4
loop_1488:
	nop
	set	0x4C, %g1
	lda	[%l7 + %g1] 0x19,	%f4
	movle	%icc,	%o2,	%o6
	move	%xcc,	%g4,	%g2
	orncc	%i3,	0x05E0,	%o1
	wr	%g0,	0x0c,	%asi
	swapa	[%l7 + 0x7C] %asi,	%g3
	subcc	%i4,	%l5,	%g1
	fmovsleu	%icc,	%f18,	%f2
	srax	%l4,	0x0A,	%l2
	fbg,a	%fcc0,	loop_1489
	fzero	%f6
	wr	%g0,	0x04,	%asi
	ldsha	[%l7 + 0x46] %asi,	%o4
loop_1489:
	lduh	[%l7 + 0x7C],	%i0
	fbe,a	%fcc2,	loop_1490
	sdiv	%l6,	0x152B,	%g5
	membar	#Sync
	wr	%g0,	0xf8,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
loop_1490:
	fmul8x16al	%f3,	%f28,	%f4
	stw	%i5,	[%l7 + 0x54]
	movvc	%xcc,	%l0,	%l3
	subccc	%o7,	%o0,	%i7
	udivx	%i2,	0x1F76,	%i6
	ldsh	[%l7 + 0x62],	%g7
	membar	0x6E
	fnand	%f16,	%f16,	%f4
	xor	%l1,	0x12C1,	%i1
	tneg	%xcc,	0x1
	brgz,a	%o3,	loop_1491
	tge	%icc,	0x3
	fzeros	%f23
	movrgz	%g6,	%o2,	%o5
loop_1491:
	orcc	%o6,	0x0E90,	%g4
	wr	%g0,	0x04,	%asi
	lduwa	[%l7 + 0x5C] %asi,	%g2
	fblg,a	%fcc1,	loop_1492
	xnorcc	%o1,	0x054B,	%i3
	fble	%fcc2,	loop_1493
	fbul	%fcc2,	loop_1494
loop_1492:
	taddcc	%i4,	0x010F,	%l5
	wr	%g0,	0x19,	%asi
	lduwa	[%l7 + 0x64] %asi,	%g3
loop_1493:
	brlez	%g1,	loop_1495
loop_1494:
	and	%l2,	%l4,	%o4
	udivx	%i0,	0x15F2,	%l6
	taddcc	%g5,	0x1C9D,	%l0
loop_1495:
	subc	%l3,	0x1270,	%i5
	movleu	%xcc,	%o7,	%i7
	movvs	%icc,	%o0,	%i2
	be,a	%xcc,	loop_1496
	lduw	[%l7 + 0x3C],	%g7
	addcc	%i6,	%l1,	%o3
	bleu,a,pn	%xcc,	loop_1497
loop_1496:
	tpos	%icc,	0x6
	fnand	%f6,	%f22,	%f4
	array16	%i1,	%g6,	%o2
loop_1497:
	popc	%o5,	%g4
	mova	%xcc,	%o6,	%g2
	edge32ln	%o1,	%i3,	%i4
	xorcc	%g3,	%l5,	%l2
	smulcc	%l4,	0x0531,	%o4
	fbne	%fcc1,	loop_1498
	movleu	%icc,	%g1,	%l6
	addc	%i0,	%l0,	%l3
	addccc	%i5,	%g5,	%o7
loop_1498:
	mulx	%i7,	0x1B30,	%o0
	addccc	%g7,	0x0E34,	%i6
	fmovse	%icc,	%f7,	%f0
	move	%icc,	%i2,	%l1
	wr	%g0,	0x57,	%asi
	stxa	%i1,	[%g0 + 0x0] %asi
	wr	%g0,	0x89,	%asi
	sta	%f4,	[%l7 + 0x08] %asi
	brgez	%o3,	loop_1499
	fmovrde	%o2,	%f10,	%f2
	udiv	%o5,	0x029C,	%g6
	fmovdn	%icc,	%f2,	%f26
loop_1499:
	array16	%g4,	%g2,	%o6
	udivx	%o1,	0x1FE0,	%i3
	sir	0x1D02
	movleu	%icc,	%i4,	%l5
	subccc	%l2,	0x1E43,	%g3
	sra	%o4,	%g1,	%l6
	tvs	%icc,	0x2
	fbue,a	%fcc1,	loop_1500
	bcc,pt	%icc,	loop_1501
	movg	%xcc,	%i0,	%l0
	sethi	0x05AD,	%l3
loop_1500:
	fpackfix	%f4,	%f19
loop_1501:
	fmovsvs	%xcc,	%f18,	%f23
	udiv	%i5,	0x079C,	%g5
	umul	%o7,	%l4,	%i7
	fbuge,a	%fcc3,	loop_1502
	nop
	setx loop_1503, %l0, %l1
	jmpl %l1, %g7
	tl	%xcc,	0x4
	movrlez	%i6,	0x372,	%o0
loop_1502:
	edge8ln	%l1,	%i1,	%i2
loop_1503:
	ble,pt	%xcc,	loop_1504
	fcmpes	%fcc1,	%f6,	%f11
	orcc	%o2,	%o3,	%g6
	lduw	[%l7 + 0x74],	%o5
loop_1504:
	movrlez	%g2,	%o6,	%g4
	subccc	%o1,	%i3,	%i4
	array8	%l5,	%l2,	%g3
	fbo	%fcc1,	loop_1505
	edge16l	%g1,	%l6,	%o4
	edge32	%i0,	%l0,	%l3
	bvc	%xcc,	loop_1506
loop_1505:
	std	%f8,	[%l7 + 0x30]
	edge8n	%i5,	%o7,	%l4
	movrlz	%i7,	0x0F0,	%g5
loop_1506:
	pdist	%f30,	%f24,	%f8
	sdiv	%g7,	0x10BE,	%o0
	bneg,pt	%icc,	loop_1507
	array32	%i6,	%l1,	%i2
	fmovsgu	%icc,	%f17,	%f12
	subccc	%o2,	0x1E3C,	%o3
loop_1507:
	movvc	%icc,	%i1,	%o5
	alignaddrl	%g2,	%o6,	%g4
	fxnors	%f22,	%f30,	%f27
	edge8l	%o1,	%g6,	%i3
	nop
	setx loop_1508, %l0, %l1
	jmpl %l1, %l5
	fnands	%f0,	%f28,	%f5
	sir	0x0047
	tle	%icc,	0x6
loop_1508:
	fmovde	%xcc,	%f26,	%f29
	xnor	%i4,	%g3,	%g1
	set	0x38, %l0
	lda	[%l7 + %l0] 0x18,	%f16
	movpos	%xcc,	%l2,	%l6
	membar	0x3C
	set	0x40, %i1
	stda	%f16,	[%l7 + %i1] 0x14
	tpos	%icc,	0x5
	array8	%i0,	%o4,	%l3
	movn	%icc,	%l0,	%i5
	fmul8ulx16	%f28,	%f18,	%f18
	nop
	set	0x2F, %i2
	ldstub	[%l7 + %i2],	%o7
	movvc	%xcc,	%i7,	%g5
	fmovrsgz	%g7,	%f11,	%f25
	fbe,a	%fcc2,	loop_1509
	fnegs	%f12,	%f22
	stx	%l4,	[%l7 + 0x38]
	ldub	[%l7 + 0x34],	%i6
loop_1509:
	tsubcctv	%o0,	%l1,	%i2
	subc	%o3,	%i1,	%o5
	brgez,a	%g2,	loop_1510
	array8	%o2,	%g4,	%o1
	fmovrslez	%o6,	%f23,	%f9
	fnot2	%f14,	%f2
loop_1510:
	movcc	%icc,	%i3,	%l5
	fnand	%f12,	%f20,	%f18
	brgz,a	%i4,	loop_1511
	subc	%g3,	0x0907,	%g1
	fpackfix	%f4,	%f10
	movge	%icc,	%l2,	%g6
loop_1511:
	fpsub32s	%f6,	%f8,	%f5
	udiv	%i0,	0x0DA8,	%l6
	edge32ln	%o4,	%l3,	%i5
	edge32n	%o7,	%i7,	%g5
	fmovrdgz	%l0,	%f18,	%f22
	movne	%icc,	%g7,	%l4
	ldub	[%l7 + 0x22],	%o0
	sdivx	%l1,	0x1948,	%i2
	array8	%i6,	%o3,	%i1
	fmovdle	%xcc,	%f19,	%f5
	movrgz	%g2,	%o2,	%g4
	move	%icc,	%o1,	%o6
	brz,a	%i3,	loop_1512
	sra	%o5,	%i4,	%l5
	edge16ln	%g3,	%l2,	%g6
	sdivcc	%g1,	0x0F18,	%l6
loop_1512:
	fmovsn	%xcc,	%f20,	%f27
	addccc	%i0,	%o4,	%i5
	add	%l7,	0x5C,	%l6
	wr	%g0,	0x0c,	%asi
	lda	[%l6] %asi,	%o7
	casa	[%l6] 0x0c,	%o7,	%l3
	edge32l	%i7,	%l0,	%g7
	movvc	%icc,	%l4,	%o0
	fmovsneg	%xcc,	%f14,	%f6
	fmul8sux16	%f12,	%f14,	%f16
	edge16	%l1,	%g5,	%i2
	movl	%icc,	%i6,	%o3
	fbn,a	%fcc3,	loop_1513
	movrgez	%g2,	0x017,	%i1
	movg	%xcc,	%g4,	%o1
	fnands	%f23,	%f1,	%f29
loop_1513:
	sdivx	%o6,	0x19F1,	%i3
	movne	%icc,	%o2,	%o5
	set	0x48, %l3
	prefetcha	[%l7 + %l3] 0x04,	 0x1
	subccc	%g3,	%i4,	%g6
	sdiv	%g1,	0x037E,	%l6
	nop
	set	0x68, %l1
	std	%f4,	[%l7 + %l1]
	srl	%l2,	%o4,	%i5
	addcc	%o7,	0x1837,	%i0
	mova	%xcc,	%l3,	%l0
	tvs	%xcc,	0x1
	fmovdcc	%xcc,	%f24,	%f17
	fmovrdgez	%i7,	%f8,	%f18
	orncc	%l4,	0x13AB,	%g7
	fmovrdgz	%o0,	%f2,	%f24
	fnors	%f2,	%f10,	%f1
	membar	0x26
	fmovsg	%xcc,	%f31,	%f8
	xor	%g5,	%i2,	%l1
	subccc	%i6,	%g2,	%o3
	subccc	%i1,	%g4,	%o1
	fcmps	%fcc1,	%f7,	%f13
	udiv	%i3,	0x1BF2,	%o6
	udivcc	%o2,	0x0493,	%o5
	fpadd32	%f26,	%f2,	%f18
	array16	%l5,	%g3,	%g6
	edge32ln	%g1,	%l6,	%i4
	wr	%g0,	0x89,	%asi
	ldstuba	[%l7 + 0x51] %asi,	%l2
	fcmpd	%fcc1,	%f10,	%f16
	wr	%g0,	0x19,	%asi
	ldda	[%l7 + 0x40] %asi,	%o4
	array32	%i5,	%i0,	%l3
	movrgez	%l0,	%o7,	%l4
	fmuld8ulx16	%f2,	%f19,	%f22
	tne	%icc,	0x0
	brlz,a	%g7,	loop_1514
	sethi	0x1B1C,	%o0
	fcmps	%fcc2,	%f3,	%f26
	fcmped	%fcc0,	%f28,	%f2
loop_1514:
	tg	%icc,	0x0
	te	%icc,	0x5
	st	%f14,	[%l7 + 0x58]
	movge	%xcc,	%g5,	%i7
	edge8	%i2,	%i6,	%g2
	sdivx	%o3,	0x1601,	%i1
	fnegd	%f0,	%f22
	ldd	[%l7 + 0x30],	%l0
	wr	%g0,	0x80,	%asi
	stda	%g4,	[%l7 + 0x28] %asi
	movcc	%icc,	%o1,	%o6
	movrgez	%i3,	0x2ED,	%o5
	bvc,a,pn	%xcc,	loop_1515
	movg	%icc,	%o2,	%g3
	fnot1	%f0,	%f2
	tgu	%icc,	0x2
loop_1515:
	movleu	%icc,	%g6,	%l5
	movrne	%l6,	%g1,	%l2
	tl	%icc,	0x2
	fexpand	%f12,	%f18
	edge8l	%i4,	%i5,	%o4
	fmovrsgz	%l3,	%f11,	%f3
	fmovdne	%icc,	%f15,	%f28
	smulcc	%i0,	%l0,	%o7
	movpos	%xcc,	%g7,	%o0
	wr	%g0,	0x80,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	movgu	%xcc,	%g5,	%l4
	nop
	setx loop_1516, %l0, %l1
	jmpl %l1, %i2
	fbo,a	%fcc1,	loop_1517
	prefetch	[%l7 + 0x34],	 0x1
	prefetch	[%l7 + 0x40],	 0x2
loop_1516:
	tleu	%icc,	0x4
loop_1517:
	tcs	%icc,	0x2
	membar	0x28
	movrne	%i7,	%i6,	%g2
	xor	%o3,	0x1300,	%l1
	bg,a,pn	%icc,	loop_1518
	add	%g4,	0x055B,	%i1
	add	%l7,	0x38,	%l6
	wr	%g0,	0x19,	%asi
	lda	[%l6] %asi,	%o6
	casa	[%l6] %asi,	%o6,	%i3
loop_1518:
	fmovsl	%icc,	%f29,	%f11
	bvs	%xcc,	loop_1519
	umulcc	%o1,	%o2,	%g3
	tcc	%xcc,	0x4
	movg	%xcc,	%g6,	%o5
loop_1519:
	fones	%f23
	set	0x38, %i5
	stxa	%l5,	[%l7 + %i5] 0x2f
	membar	#Sync
	fblg	%fcc1,	loop_1520
	fblg,a	%fcc2,	loop_1521
	tneg	%icc,	0x5
	taddcctv	%g1,	%l2,	%i4
loop_1520:
	fcmpne32	%f26,	%f18,	%l6
loop_1521:
	movpos	%xcc,	%o4,	%l3
	ld	[%l7 + 0x68],	%f31
	movre	%i5,	%i0,	%o7
	tsubcc	%g7,	0x06D4,	%o0
	fpack32	%f10,	%f22,	%f4
	edge16l	%g5,	%l4,	%i2
	fnors	%f21,	%f16,	%f14
	xnorcc	%i7,	%l0,	%g2
	andcc	%o3,	%l1,	%i6
	fors	%f0,	%f16,	%f26
	popc	0x1BA0,	%g4
	tne	%xcc,	0x7
	edge8ln	%o6,	%i1,	%o1
	fabss	%f23,	%f8
	nop
	setx	loop_1522,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	std	%f24,	[%l7 + 0x70]
	fbo	%fcc1,	loop_1523
	array8	%i3,	%g3,	%g6
loop_1522:
	subcc	%o5,	0x08DA,	%l5
	sethi	0x1214,	%g1
loop_1523:
	fble,a	%fcc3,	loop_1524
	tsubcctv	%o2,	0x01C4,	%l2
	tsubcc	%l6,	0x1C99,	%i4
	srl	%o4,	%l3,	%i0
loop_1524:
	brlez	%o7,	loop_1525
	movl	%icc,	%g7,	%o0
	sub	%i5,	0x0008,	%l4
	andncc	%i2,	%i7,	%g5
loop_1525:
	array16	%l0,	%o3,	%g2
	alignaddrl	%i6,	%l1,	%g4
	fmovrdgz	%o6,	%f22,	%f30
	ba	loop_1526
	std	%o0,	[%l7 + 0x48]
	fmovdcs	%xcc,	%f2,	%f18
	or	%i1,	%g3,	%i3
loop_1526:
	tg	%icc,	0x0
	movleu	%xcc,	%g6,	%l5
	edge8n	%o5,	%o2,	%l2
	fcmpgt32	%f28,	%f28,	%l6
	fbn,a	%fcc1,	loop_1527
	sdivcc	%i4,	0x087A,	%g1
	fbn,a	%fcc0,	loop_1528
	fornot2s	%f20,	%f1,	%f26
loop_1527:
	nop
	wr	%g0,	0x81,	%asi
	ldxa	[%l7 + 0x50] %asi,	%l3
loop_1528:
	edge32ln	%i0,	%o4,	%g7
	fmovrdgz	%o7,	%f12,	%f30
	fmul8ulx16	%f2,	%f10,	%f18
	tcs	%icc,	0x0
	stb	%o0,	[%l7 + 0x40]
	for	%f2,	%f26,	%f6
	movn	%xcc,	%l4,	%i5
	fbul,a	%fcc0,	loop_1529
	brlez	%i7,	loop_1530
	subc	%i2,	%l0,	%g5
	fxnor	%f2,	%f0,	%f28
loop_1529:
	nop
	set	0x54, %i6
	lda	[%l7 + %i6] 0x15,	%f20
loop_1530:
	edge8ln	%g2,	%o3,	%l1
	ldsw	[%l7 + 0x58],	%i6
	addcc	%o6,	%g4,	%o1
	movg	%icc,	%g3,	%i3
	fzero	%f8
	add	%l7,	0x6C,	%l6
	wr	%g0,	0x0c,	%asi
	lda	[%l6] %asi,	%i1
	casa	[%l6] 0x0c,	%i1,	%g6
	tvc	%xcc,	0x1
	fcmps	%fcc3,	%f27,	%f31
	brlz,a	%o5,	loop_1531
	call	loop_1532
	edge8l	%l5,	%o2,	%l6
	xorcc	%i4,	%l2,	%g1
loop_1531:
	fmovsvs	%xcc,	%f31,	%f20
loop_1532:
	movcs	%xcc,	%l3,	%o4
	set	0x30, %o0
	ldda	[%l7 + %o0] 0x11,	%g6
	sdivcc	%o7,	0x01EC,	%o0
	wr	%g0,	0x81,	%asi
	stba	%i0,	[%l7 + 0x35] %asi
	addc	%l4,	%i7,	%i5
	sir	0x0A3D
	edge16n	%l0,	%i2,	%g2
	movrgez	%o3,	%g5,	%l1
	fmovdneg	%icc,	%f10,	%f10
	add	%i6,	%o6,	%o1
	tle	%icc,	0x1
	fbg	%fcc1,	loop_1533
	orn	%g3,	%i3,	%g4
	brz	%g6,	loop_1534
	fmovsle	%xcc,	%f21,	%f9
loop_1533:
	brlez	%o5,	loop_1535
	nop
	setx	loop_1536,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_1534:
	fmovda	%icc,	%f22,	%f9
	fbn,a	%fcc1,	loop_1537
loop_1535:
	tsubcc	%l5,	0x124D,	%o2
loop_1536:
	mulx	%i1,	0x1F0E,	%l6
	fble	%fcc1,	loop_1538
loop_1537:
	fmovsne	%icc,	%f28,	%f8
	sub	%i4,	%l2,	%g1
	fcmple32	%f28,	%f14,	%l3
loop_1538:
	sll	%o4,	%o7,	%g7
	movrgz	%i0,	0x3C6,	%o0
	array32	%l4,	%i5,	%l0
	fblg,a	%fcc2,	loop_1539
	xor	%i7,	%i2,	%g2
	fcmps	%fcc3,	%f22,	%f23
	ld	[%l7 + 0x28],	%f6
loop_1539:
	fbn,a	%fcc2,	loop_1540
	tvs	%xcc,	0x0
	nop
	setx	loop_1541,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	sdivcc	%g5,	0x0AB6,	%l1
loop_1540:
	nop
	set	0x28, %o5
	ldswa	[%l7 + %o5] 0x14,	%i6
loop_1541:
	edge8ln	%o6,	%o3,	%o1
	te	%icc,	0x1
	fmovdl	%xcc,	%f30,	%f5
	fmovscs	%icc,	%f13,	%f18
	ba	loop_1542
	andn	%i3,	%g4,	%g3
	array32	%g6,	%o5,	%l5
	sub	%i1,	%l6,	%o2
loop_1542:
	fbn	%fcc3,	loop_1543
	tcs	%xcc,	0x3
	set	0x56, %l5
	lduha	[%l7 + %l5] 0x19,	%i4
loop_1543:
	nop
	wr	%g0,	0x88,	%asi
	stda	%l2,	[%l7 + 0x18] %asi
	sethi	0x03BF,	%g1
	fand	%f0,	%f14,	%f0
	tl	%xcc,	0x2
	bcs,a,pn	%xcc,	loop_1544
	sir	0x10F8
	lduh	[%l7 + 0x6A],	%l3
	membar	0x40
loop_1544:
	fmovrdgz	%o7,	%f2,	%f4
	tleu	%xcc,	0x3
	brz,a	%o4,	loop_1545
	fmovse	%icc,	%f30,	%f18
	fbule	%fcc0,	loop_1546
	move	%xcc,	%i0,	%o0
loop_1545:
	movre	%g7,	%l4,	%l0
	and	%i5,	0x0DD5,	%i2
loop_1546:
	mova	%icc,	%i7,	%g2
	ta	%icc,	0x3
	movvc	%xcc,	%g5,	%l1
	fandnot2	%f16,	%f6,	%f18
	sdivx	%o6,	0x179E,	%i6
	addc	%o1,	0x0D50,	%o3
	fand	%f0,	%f18,	%f6
	tg	%xcc,	0x4
	nop
	setx	loop_1547,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movpos	%xcc,	%g4,	%g3
	movgu	%xcc,	%i3,	%g6
	fmovdvs	%icc,	%f30,	%f19
loop_1547:
	movpos	%icc,	%o5,	%l5
	fcmple32	%f12,	%f4,	%l6
	movrgz	%o2,	%i1,	%i4
	tleu	%icc,	0x0
	addcc	%g1,	0x0A5C,	%l3
	edge8	%o7,	%o4,	%i0
	srlx	%l2,	%o0,	%g7
	wr	%g0,	0x89,	%asi
	lda	[%l7 + 0x68] %asi,	%f6
	tcs	%xcc,	0x7
	wr	%g0,	0x88,	%asi
	lduwa	[%l7 + 0x38] %asi,	%l0
	add	%l7,	0x2C,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%i5
	casa	[%l6] %asi,	%i5,	%l4
	fpadd32	%f4,	%f4,	%f22
	fzeros	%f10
	movne	%icc,	%i7,	%g2
	tne	%icc,	0x5
	xnor	%i2,	%l1,	%o6
	tsubcctv	%g5,	%i6,	%o1
	ldx	[%l7 + 0x78],	%g4
	mulx	%o3,	0x06A3,	%g3
	sdiv	%g6,	0x16C9,	%i3
	set	0x34, %i0
	lduha	[%l7 + %i0] 0x10,	%o5
	xorcc	%l5,	0x0ACB,	%o2
	fpackfix	%f20,	%f4
	sra	%l6,	0x09,	%i4
	edge32ln	%i1,	%g1,	%o7
	udivx	%o4,	0x06CE,	%i0
	sll	%l2,	0x01,	%o0
	fbue,a	%fcc2,	loop_1548
	movrgz	%g7,	0x139,	%l3
	addcc	%i5,	%l4,	%i7
	edge16ln	%l0,	%g2,	%i2
loop_1548:
	andncc	%l1,	%o6,	%g5
	subccc	%o1,	0x1029,	%i6
	tcc	%icc,	0x3
	fmovdvc	%xcc,	%f12,	%f1
	sll	%o3,	0x18,	%g3
	ba,pt	%icc,	loop_1549
	fsrc1	%f2,	%f12
	ba,pn	%icc,	loop_1550
	fmul8x16al	%f5,	%f17,	%f4
loop_1549:
	tne	%xcc,	0x5
	addccc	%g4,	0x0EA3,	%g6
loop_1550:
	fmovrslz	%o5,	%f4,	%f15
	mova	%icc,	%l5,	%o2
	or	%l6,	0x1DBE,	%i4
	fba	%fcc1,	loop_1551
	fblg	%fcc1,	loop_1552
	xnorcc	%i1,	0x1492,	%i3
	tgu	%xcc,	0x2
loop_1551:
	fbo,a	%fcc0,	loop_1553
loop_1552:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mulscc	%o7,	%o4,	%g1
	udivx	%l2,	0x19B8,	%i0
loop_1553:
	edge32n	%g7,	%o0,	%l3
	nop
	setx	loop_1554,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	sethi	0x0082,	%l4
	bne,pt	%xcc,	loop_1555
	fbne,a	%fcc0,	loop_1556
loop_1554:
	brlez	%i7,	loop_1557
	movn	%xcc,	%l0,	%i5
loop_1555:
	nop
	set	0x20, %o7
	ldxa	[%l7 + %o7] 0x15,	%i2
loop_1556:
	movvs	%xcc,	%l1,	%g2
loop_1557:
	sdivx	%o6,	0x12A9,	%o1
	sllx	%g5,	%i6,	%o3
	movleu	%xcc,	%g4,	%g6
	tgu	%icc,	0x1
	bne	loop_1558
	and	%o5,	%l5,	%g3
	wr	%g0,	0x88,	%asi
	sta	%f8,	[%l7 + 0x68] %asi
loop_1558:
	sdiv	%l6,	0x1505,	%i4
	ble	loop_1559
	movl	%icc,	%i1,	%o2
	edge16n	%i3,	%o7,	%o4
	ba,a,pn	%xcc,	loop_1560
loop_1559:
	nop
	set	0x29, %o4
	ldstub	[%l7 + %o4],	%l2
	subc	%i0,	0x14EE,	%g1
	brlz	%g7,	loop_1561
loop_1560:
	andn	%l3,	0x0781,	%l4
	sethi	0x04E5,	%o0
	bleu	%xcc,	loop_1562
loop_1561:
	nop
	setx loop_1563, %l0, %l1
	jmpl %l1, %l0
	tsubcc	%i5,	%i2,	%l1
	movgu	%icc,	%g2,	%o6
loop_1562:
	andn	%o1,	%i7,	%g5
loop_1563:
	umulcc	%o3,	%i6,	%g6
	movgu	%xcc,	%o5,	%g4
	edge16n	%g3,	%l6,	%i4
	movge	%xcc,	%i1,	%l5
	faligndata	%f6,	%f0,	%f18
	call	loop_1564
	fbge	%fcc0,	loop_1565
	sdivx	%i3,	0x151D,	%o2
	udivx	%o4,	0x0B1B,	%o7
loop_1564:
	bpos,a,pt	%xcc,	loop_1566
loop_1565:
	orn	%l2,	0x15B1,	%g1
	wr	%g0,	0x17,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
loop_1566:
	nop
	setx	loop_1567,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fbul,a	%fcc2,	loop_1568
	andn	%i0,	%l3,	%g7
	set	0x6E, %g2
	lduba	[%l7 + %g2] 0x19,	%l4
loop_1567:
	addc	%l0,	0x095B,	%i5
loop_1568:
	udivx	%o0,	0x0D05,	%i2
	add	%l1,	0x16EB,	%g2
	tgu	%xcc,	0x5
	fmovdne	%xcc,	%f19,	%f8
	brgez,a	%o6,	loop_1569
	brnz	%o1,	loop_1570
	edge16ln	%g5,	%i7,	%o3
	movge	%xcc,	%i6,	%o5
loop_1569:
	tneg	%icc,	0x6
loop_1570:
	tcc	%xcc,	0x5
	brgez	%g6,	loop_1571
	bn	%xcc,	loop_1572
	tsubcc	%g4,	%l6,	%i4
	edge8	%i1,	%g3,	%i3
loop_1571:
	sdivx	%l5,	0x0727,	%o4
loop_1572:
	tgu	%icc,	0x2
	tle	%xcc,	0x6
	brlz,a	%o7,	loop_1573
	fmovscc	%icc,	%f9,	%f3
	fornot2	%f18,	%f12,	%f14
	movg	%icc,	%l2,	%g1
loop_1573:
	nop
	setx	loop_1574,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fmovsleu	%xcc,	%f2,	%f10
	fbug	%fcc2,	loop_1575
	fbe,a	%fcc0,	loop_1576
loop_1574:
	movrgz	%i0,	0x2FB,	%l3
	fnegd	%f2,	%f28
loop_1575:
	movcc	%xcc,	%o2,	%g7
loop_1576:
	bgu	%xcc,	loop_1577
	taddcctv	%l0,	%i5,	%o0
	edge8ln	%i2,	%l1,	%l4
	edge8n	%o6,	%g2,	%o1
loop_1577:
	ldd	[%l7 + 0x58],	%f0
	taddcc	%g5,	0x023B,	%o3
	wr	%g0,	0x0c,	%asi
	ldsha	[%l7 + 0x64] %asi,	%i6
	sub	%o5,	%i7,	%g6
	fbul,a	%fcc2,	loop_1578
	ldsw	[%l7 + 0x68],	%g4
	fpadd16	%f6,	%f6,	%f24
	movvs	%icc,	%i4,	%l6
loop_1578:
	ldstub	[%l7 + 0x5E],	%g3
	udivcc	%i3,	0x0EBD,	%l5
	andn	%i1,	0x0299,	%o7
	tpos	%xcc,	0x0
	movne	%icc,	%l2,	%g1
	alignaddr	%o4,	%i0,	%o2
	fmovsa	%xcc,	%f0,	%f19
	bn,a	%icc,	loop_1579
	xnor	%g7,	%l0,	%l3
	movneg	%icc,	%o0,	%i2
	wr	%g0,	0x89,	%asi
	ldstuba	[%l7 + 0x13] %asi,	%i5
loop_1579:
	fnot2s	%f11,	%f13
	stx	%l4,	[%l7 + 0x10]
	fmovrdgez	%l1,	%f24,	%f28
	brnz	%o6,	loop_1580
	move	%xcc,	%g2,	%g5
	movrlez	%o3,	%o1,	%i6
	movvs	%icc,	%i7,	%o5
loop_1580:
	ldub	[%l7 + 0x18],	%g4
	array32	%g6,	%l6,	%g3
	movleu	%xcc,	%i3,	%l5
	fmovsvs	%icc,	%f15,	%f12
	array16	%i4,	%i1,	%l2
	fmul8x16au	%f6,	%f0,	%f26
	movg	%icc,	%g1,	%o7
	tneg	%xcc,	0x2
	movrgz	%i0,	0x0B4,	%o4
	fbu,a	%fcc2,	loop_1581
	fmovsneg	%xcc,	%f0,	%f6
	add	%g7,	%o2,	%l3
	move	%xcc,	%l0,	%i2
loop_1581:
	ldstub	[%l7 + 0x1C],	%o0
	subcc	%l4,	0x0985,	%i5
	edge16l	%l1,	%g2,	%o6
	edge32	%o3,	%g5,	%i6
	smulcc	%i7,	0x00A3,	%o1
	mova	%icc,	%o5,	%g4
	te	%icc,	0x7
	umulcc	%g6,	%l6,	%i3
	tl	%icc,	0x7
	bvc	%xcc,	loop_1582
	nop
	setx	loop_1583,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	edge8ln	%g3,	%l5,	%i1
	brgez	%i4,	loop_1584
loop_1582:
	edge8l	%g1,	%o7,	%l2
loop_1583:
	fandnot1	%f30,	%f10,	%f22
	fmovse	%xcc,	%f28,	%f30
loop_1584:
	subcc	%o4,	%i0,	%g7
	movle	%icc,	%o2,	%l3
	fbue	%fcc3,	loop_1585
	membar	0x12
	movcc	%xcc,	%i2,	%l0
	movg	%xcc,	%o0,	%l4
loop_1585:
	nop
	wr	%g0,	0x10,	%asi
	lduba	[%l7 + 0x61] %asi,	%i5
	andcc	%g2,	0x1E50,	%l1
	udivx	%o6,	0x0089,	%g5
	movcs	%icc,	%i6,	%o3
	popc	%i7,	%o1
	movgu	%icc,	%o5,	%g6
	fmovd	%f20,	%f2
	edge32n	%g4,	%i3,	%l6
	fpsub32	%f20,	%f12,	%f4
	fcmpgt16	%f6,	%f2,	%l5
	popc	%i1,	%g3
	fmovda	%icc,	%f9,	%f23
	srax	%g1,	%o7,	%l2
	set	0x2A, %i4
	stha	%i4,	[%l7 + %i4] 0x18
	mulscc	%i0,	%g7,	%o2
	andn	%o4,	%i2,	%l3
	set	0x34, %o3
	swapa	[%l7 + %o3] 0x81,	%l0
	ta	%xcc,	0x5
	fexpand	%f15,	%f10
	fba	%fcc2,	loop_1586
	movle	%xcc,	%o0,	%i5
	fpack16	%f16,	%f21
	fble,a	%fcc3,	loop_1587
loop_1586:
	bvs,a	loop_1588
	sir	0x07C4
	xor	%l4,	0x0F9F,	%l1
loop_1587:
	fbul,a	%fcc2,	loop_1589
loop_1588:
	ldsh	[%l7 + 0x5A],	%g2
	addccc	%g5,	0x0D04,	%o6
	fandnot1	%f12,	%f14,	%f24
loop_1589:
	sra	%o3,	%i7,	%o1
	fcmpne16	%f8,	%f22,	%o5
	bn,a	loop_1590
	fbug,a	%fcc2,	loop_1591
	ta	%xcc,	0x5
	fmovrsgz	%g6,	%f28,	%f17
loop_1590:
	tl	%icc,	0x2
loop_1591:
	std	%f20,	[%l7 + 0x08]
	subcc	%i6,	%g4,	%i3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addcc	%l5,	0x12AE,	%l6
	subcc	%g3,	0x0A9A,	%i1
	tgu	%xcc,	0x3
	fnot2s	%f3,	%f14
	edge8	%o7,	%g1,	%l2
	brgez	%i0,	loop_1592
	bshuffle	%f24,	%f0,	%f10
	wr	%g0,	0x22,	%asi
	stwa	%g7,	[%l7 + 0x34] %asi
	membar	#Sync
loop_1592:
	edge32	%o2,	%o4,	%i4
	fmovdgu	%xcc,	%f4,	%f3
	andcc	%l3,	0x05D3,	%l0
	subcc	%i2,	%i5,	%l4
	edge32	%o0,	%g2,	%g5
	fmovscc	%icc,	%f26,	%f22
	array32	%l1,	%o6,	%i7
	udiv	%o1,	0x1A5E,	%o3
	array32	%g6,	%o5,	%g4
	movrlz	%i3,	0x3E7,	%l5
	andncc	%i6,	%l6,	%g3
	tvc	%xcc,	0x7
	fmovsl	%icc,	%f30,	%f7
	bpos,a	%icc,	loop_1593
	movpos	%icc,	%o7,	%i1
	tsubcctv	%g1,	%l2,	%i0
	nop
	set	0x78, %g3
	ldd	[%l7 + %g3],	%f28
loop_1593:
	edge8ln	%o2,	%g7,	%o4
	orcc	%i4,	%l0,	%l3
	fbug	%fcc3,	loop_1594
	fmovdvc	%xcc,	%f12,	%f20
	srax	%i2,	0x0B,	%i5
	wr	%g0,	0x81,	%asi
	ldsba	[%l7 + 0x66] %asi,	%l4
loop_1594:
	nop
	set	0x52, %g5
	ldsba	[%l7 + %g5] 0x11,	%g2
	tsubcc	%g5,	0x0AC3,	%l1
	udivx	%o0,	0x15B1,	%i7
	tneg	%icc,	0x2
	wr	%g0,	0x81,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	fmovdpos	%xcc,	%f13,	%f1
	edge32ln	%o6,	%o1,	%g6
	movgu	%xcc,	%o5,	%g4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fandnot2s	%f21,	%f4,	%f28
	xor	%o3,	0x14EF,	%i3
	tcs	%xcc,	0x4
	fba,a	%fcc3,	loop_1595
	fmovdvs	%xcc,	%f10,	%f9
	set	0x50, %l4
	lduha	[%l7 + %l4] 0x15,	%l5
loop_1595:
	ta	%icc,	0x1
	wr	%g0,	0x19,	%asi
	ldstuba	[%l7 + 0x6B] %asi,	%l6
	or	%g3,	0x0584,	%o7
	srl	%i6,	%i1,	%g1
	edge32ln	%i0,	%o2,	%l2
	tsubcc	%o4,	%i4,	%l0
	fmovdcs	%icc,	%f5,	%f9
	edge32	%g7,	%i2,	%i5
	xorcc	%l3,	0x0CF6,	%g2
	movcs	%icc,	%g5,	%l4
	fmovs	%f16,	%f11
	te	%xcc,	0x3
	addccc	%l1,	0x0733,	%o0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddr	%o6,	%o1,	%i7
	te	%icc,	0x4
	fmovdcc	%xcc,	%f3,	%f0
	movn	%xcc,	%g6,	%o5
	movvc	%xcc,	%g4,	%i3
	orncc	%l5,	0x0488,	%l6
	add	%o3,	%g3,	%o7
	array32	%i6,	%i1,	%g1
	movg	%xcc,	%o2,	%i0
	tneg	%xcc,	0x7
	movge	%icc,	%l2,	%o4
	andncc	%l0,	%g7,	%i2
	tle	%xcc,	0x7
	movrlz	%i4,	0x0FF,	%i5
	edge8n	%l3,	%g2,	%l4
	tcc	%icc,	0x7
	tn	%xcc,	0x6
	set	0x18, %g4
	swapa	[%l7 + %g4] 0x80,	%g5
	add	%o0,	%l1,	%o6
	edge16n	%o1,	%g6,	%o5
	fbue	%fcc2,	loop_1596
	ld	[%l7 + 0x54],	%f0
	fcmpne16	%f18,	%f18,	%g4
	tsubcctv	%i7,	%l5,	%i3
loop_1596:
	fmovrdlez	%l6,	%f2,	%f30
	movrlz	%o3,	%o7,	%i6
	wr	%g0,	0x11,	%asi
	ldda	[%l7 + 0x30] %asi,	%i0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subccc	%g3,	%g1,	%i0
	fnot1	%f8,	%f18
	fmovscs	%xcc,	%f21,	%f12
	srl	%o2,	%o4,	%l0
	fmovsne	%icc,	%f20,	%f27
	set	0x50, %o1
	lduha	[%l7 + %o1] 0x19,	%g7
	tsubcctv	%l2,	%i2,	%i5
	tgu	%xcc,	0x7
	movneg	%xcc,	%l3,	%g2
	movvs	%xcc,	%l4,	%i4
	xorcc	%g5,	%l1,	%o0
	tsubcctv	%o6,	0x117E,	%o1
	fbo,a	%fcc3,	loop_1597
	ta	%xcc,	0x0
	alignaddrl	%o5,	%g4,	%g6
	for	%f10,	%f20,	%f28
loop_1597:
	te	%icc,	0x6
	fmovdpos	%xcc,	%f18,	%f5
	srlx	%i7,	0x0E,	%i3
	fmovd	%f28,	%f22
	fmul8x16	%f18,	%f12,	%f28
	xorcc	%l5,	%o3,	%o7
	tneg	%icc,	0x0
	fmovsn	%xcc,	%f12,	%f15
	bne,a	loop_1598
	brlez	%i6,	loop_1599
	tvc	%xcc,	0x7
	fmovrdne	%i1,	%f30,	%f8
loop_1598:
	tsubcc	%l6,	%g1,	%g3
loop_1599:
	bl,pn	%icc,	loop_1600
	fpack32	%f0,	%f20,	%f4
	fbue,a	%fcc0,	loop_1601
	fbug	%fcc1,	loop_1602
loop_1600:
	tvs	%xcc,	0x6
	alignaddrl	%i0,	%o2,	%l0
loop_1601:
	siam	0x4
loop_1602:
	edge32n	%g7,	%l2,	%o4
	set	0x48, %i3
	lduba	[%l7 + %i3] 0x04,	%i5
	tg	%icc,	0x5
	bneg	loop_1603
	array16	%l3,	%g2,	%l4
	or	%i4,	0x01EC,	%g5
	tsubcc	%l1,	0x0C91,	%i2
loop_1603:
	array8	%o6,	%o0,	%o1
	alignaddrl	%o5,	%g4,	%i7
	move	%xcc,	%i3,	%l5
	set	0x48, %g6
	prefetcha	[%l7 + %g6] 0x10,	 0x2
	movvs	%icc,	%o7,	%g6
	sub	%i1,	%l6,	%g1
	bgu,a	%icc,	loop_1604
	tleu	%xcc,	0x2
	mulx	%i6,	%i0,	%g3
	fcmple16	%f12,	%f20,	%o2
loop_1604:
	call	loop_1605
	fnands	%f16,	%f17,	%f10
	fbo,a	%fcc1,	loop_1606
	movge	%icc,	%l0,	%g7
loop_1605:
	movne	%xcc,	%l2,	%o4
	taddcc	%l3,	0x0A6B,	%g2
loop_1606:
	bge,pt	%xcc,	loop_1607
	fpack16	%f28,	%f0
	tg	%xcc,	0x0
	tcc	%xcc,	0x3
loop_1607:
	movrne	%i5,	%i4,	%g5
	alignaddr	%l1,	%l4,	%i2
	brlz,a	%o0,	loop_1608
	movn	%icc,	%o6,	%o5
	smulcc	%o1,	%i7,	%i3
	umul	%g4,	%l5,	%o3
loop_1608:
	fsrc2s	%f7,	%f20
	lduh	[%l7 + 0x48],	%o7
	smulcc	%g6,	%l6,	%g1
	array16	%i1,	%i6,	%i0
	fornot1s	%f31,	%f31,	%f16
	wr	%g0,	0x0c,	%asi
	prefetcha	[%l7 + 0x60] %asi,	 0x3
	movcc	%icc,	%o2,	%g7
	tcc	%xcc,	0x6
	taddcctv	%l0,	0x06B9,	%o4
	tvs	%xcc,	0x7
	edge16ln	%l2,	%l3,	%g2
	fcmpne32	%f14,	%f24,	%i4
	fnor	%f6,	%f6,	%f22
	sllx	%g5,	%l1,	%i5
	tvs	%xcc,	0x3
	movrgz	%l4,	0x0D2,	%o0
	fbo,a	%fcc3,	loop_1609
	fmovsge	%xcc,	%f31,	%f31
	tn	%icc,	0x2
	movrne	%i2,	%o6,	%o5
loop_1609:
	movcc	%icc,	%o1,	%i3
	wr	%g0,	0x0c,	%asi
	stha	%g4,	[%l7 + 0x58] %asi
	tl	%icc,	0x4
	sdivx	%i7,	0x1D08,	%l5
	fmovdle	%icc,	%f6,	%f23
	movcs	%icc,	%o3,	%o7
	wr	%g0,	0x80,	%asi
	lda	[%l7 + 0x34] %asi,	%f13
	edge16ln	%l6,	%g6,	%g1
	set	0x16, %i7
	lduha	[%l7 + %i7] 0x11,	%i1
	fmul8ulx16	%f10,	%f22,	%f30
	edge16ln	%i0,	%i6,	%o2
	fcmpes	%fcc3,	%f19,	%f2
	fmovd	%f24,	%f14
	for	%f26,	%f14,	%f18
	lduh	[%l7 + 0x66],	%g7
	movcs	%icc,	%g3,	%o4
	brnz,a	%l2,	loop_1610
	edge8	%l0,	%g2,	%l3
	sll	%i4,	%g5,	%i5
	movl	%xcc,	%l4,	%o0
loop_1610:
	fmovde	%icc,	%f19,	%f0
	move	%icc,	%i2,	%l1
	sll	%o6,	%o5,	%o1
	fors	%f26,	%f12,	%f2
	array16	%i3,	%g4,	%l5
	sra	%i7,	0x1E,	%o7
	fandnot2s	%f10,	%f17,	%f11
	edge32l	%l6,	%g6,	%g1
	fcmpd	%fcc2,	%f12,	%f20
	xnor	%o3,	0x1E95,	%i0
	fbne	%fcc2,	loop_1611
	edge16	%i6,	%i1,	%o2
	te	%icc,	0x2
	tgu	%xcc,	0x3
loop_1611:
	tn	%xcc,	0x4
	brz,a	%g3,	loop_1612
	brgz,a	%g7,	loop_1613
	te	%xcc,	0x5
	tg	%xcc,	0x5
loop_1612:
	fornot2s	%f4,	%f2,	%f27
loop_1613:
	fpadd16s	%f29,	%f13,	%f11
	tle	%xcc,	0x1
	edge16	%l2,	%l0,	%o4
	sllx	%g2,	%l3,	%i4
	fcmpeq16	%f28,	%f6,	%g5
	edge32ln	%i5,	%o0,	%i2
	udivcc	%l4,	0x1F50,	%l1
	andn	%o5,	%o1,	%i3
	srlx	%o6,	0x0E,	%l5
	bg,a,pt	%icc,	loop_1614
	fbuge	%fcc3,	loop_1615
	ldsh	[%l7 + 0x0E],	%i7
	set	0x12, %l6
	ldsha	[%l7 + %l6] 0x89,	%o7
loop_1614:
	be	%xcc,	loop_1616
loop_1615:
	movvs	%xcc,	%g4,	%l6
	fmovsl	%xcc,	%f5,	%f23
	tcs	%icc,	0x4
loop_1616:
	udivx	%g6,	0x0C19,	%o3
	orn	%i0,	0x0117,	%i6
	taddcctv	%g1,	%o2,	%g3
	bg,a,pn	%xcc,	loop_1617
	stb	%i1,	[%l7 + 0x46]
	movne	%xcc,	%l2,	%g7
	stb	%l0,	[%l7 + 0x4C]
loop_1617:
	tg	%xcc,	0x0
	tleu	%icc,	0x3
	tn	%icc,	0x3
	fmovsgu	%xcc,	%f28,	%f31
	bge	loop_1618
	movcs	%xcc,	%o4,	%l3
	edge16	%g2,	%i4,	%i5
	sethi	0x04B5,	%g5
loop_1618:
	te	%xcc,	0x7
	movcc	%icc,	%o0,	%i2
	edge8n	%l4,	%o5,	%o1
	edge32	%l1,	%i3,	%l5
	movg	%xcc,	%o6,	%i7
	fble,a	%fcc2,	loop_1619
	fabss	%f23,	%f18
	smulcc	%g4,	0x12DF,	%o7
	ldub	[%l7 + 0x3F],	%l6
loop_1619:
	movneg	%icc,	%g6,	%i0
	tvc	%xcc,	0x0
	sub	%i6,	%g1,	%o3
	tsubcc	%o2,	0x09EA,	%i1
	std	%l2,	[%l7 + 0x48]
	tg	%xcc,	0x3
	fnot1s	%f26,	%f11
	fmovd	%f6,	%f18
	fnot1s	%f14,	%f6
	or	%g7,	%g3,	%o4
	stx	%l0,	[%l7 + 0x40]
	taddcc	%g2,	%i4,	%i5
	brgez	%l3,	loop_1620
	udivcc	%g5,	0x1B99,	%i2
	wr	%g0,	0x89,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
loop_1620:
	ldub	[%l7 + 0x73],	%l4
	fmovdg	%xcc,	%f19,	%f10
	fmovdn	%xcc,	%f9,	%f20
	fmuld8ulx16	%f29,	%f16,	%f6
	fmovscs	%icc,	%f8,	%f25
	fmovdvc	%icc,	%f14,	%f10
	movrgz	%o5,	%o1,	%o0
	fbg,a	%fcc3,	loop_1621
	fbu,a	%fcc1,	loop_1622
	edge32	%l1,	%i3,	%o6
	fmovsvs	%icc,	%f26,	%f1
loop_1621:
	array16	%l5,	%i7,	%g4
loop_1622:
	movgu	%icc,	%l6,	%g6
	orncc	%o7,	%i0,	%g1
	subccc	%o3,	%o2,	%i6
	udivcc	%l2,	0x18C3,	%i1
	brnz,a	%g3,	loop_1623
	taddcctv	%g7,	%l0,	%o4
	fnegs	%f14,	%f9
	stw	%i4,	[%l7 + 0x20]
loop_1623:
	movcs	%xcc,	%g2,	%i5
	movpos	%xcc,	%l3,	%i2
	set	0x34, %g7
	ldsba	[%l7 + %g7] 0x04,	%l4
	fnors	%f11,	%f6,	%f2
	ldsw	[%l7 + 0x54],	%o5
	fble,a	%fcc3,	loop_1624
	tneg	%xcc,	0x3
	addcc	%g5,	0x1B29,	%o1
	udivx	%o0,	0x0900,	%l1
loop_1624:
	fbne	%fcc3,	loop_1625
	edge8	%o6,	%l5,	%i3
	movrne	%g4,	0x10A,	%i7
	prefetch	[%l7 + 0x58],	 0x2
loop_1625:
	movl	%icc,	%g6,	%o7
	taddcctv	%l6,	%i0,	%o3
	fcmpeq32	%f0,	%f22,	%g1
	flush	%l7 + 0x4C
	andn	%i6,	0x144B,	%o2
	ldub	[%l7 + 0x24],	%i1
	taddcc	%l2,	0x03A6,	%g3
	umulcc	%l0,	0x0E20,	%g7
	tgu	%icc,	0x4
	srax	%i4,	0x16,	%o4
	ldub	[%l7 + 0x41],	%i5
	std	%l2,	[%l7 + 0x08]
	smulcc	%i2,	0x1DAB,	%g2
	fone	%f24
	xor	%l4,	%o5,	%g5
	tsubcc	%o0,	%o1,	%o6
	fmovsvs	%icc,	%f7,	%f23
	fbue,a	%fcc3,	loop_1626
	movcs	%icc,	%l1,	%l5
	edge8ln	%i3,	%g4,	%g6
	movre	%i7,	0x29A,	%l6
loop_1626:
	fmuld8sux16	%f29,	%f18,	%f20
	fmul8x16au	%f5,	%f30,	%f16
	fmul8x16	%f10,	%f12,	%f6
	fmovrsne	%o7,	%f24,	%f17
	nop
	setx	loop_1627,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	xorcc	%o3,	0x19C5,	%g1
	ldsw	[%l7 + 0x78],	%i6
	edge16	%o2,	%i0,	%l2
loop_1627:
	movneg	%xcc,	%g3,	%l0
	movleu	%icc,	%g7,	%i4
	tcs	%icc,	0x3
	subcc	%o4,	0x13B6,	%i5
	movgu	%icc,	%l3,	%i2
	fmovsgu	%xcc,	%f31,	%f7
	ldd	[%l7 + 0x28],	%f12
	orcc	%g2,	%l4,	%o5
	srl	%i1,	0x0C,	%g5
	tneg	%icc,	0x5
	fmovsge	%icc,	%f22,	%f8
	tgu	%xcc,	0x0
	tsubcc	%o1,	%o0,	%l1
	tcc	%xcc,	0x2
	xor	%l5,	%o6,	%i3
	ldsb	[%l7 + 0x3A],	%g4
	edge32	%i7,	%l6,	%o7
	movrgz	%o3,	%g1,	%i6
	fmovsgu	%xcc,	%f7,	%f24
	edge16	%g6,	%o2,	%i0
	srlx	%g3,	0x1D,	%l2
	movrne	%l0,	%g7,	%o4
	or	%i5,	0x1BF8,	%i4
	wr	%g0,	0x11,	%asi
	ldxa	[%l7 + 0x40] %asi,	%l3
	udiv	%i2,	0x1C0F,	%l4
	array32	%o5,	%i1,	%g2
	movgu	%icc,	%o1,	%o0
	sll	%l1,	%g5,	%o6
	ldub	[%l7 + 0x46],	%i3
	movcs	%xcc,	%l5,	%i7
	nop
	set	0x44, %l2
	sth	%g4,	[%l7 + %l2]
	orncc	%o7,	0x1346,	%l6
	fmovsn	%xcc,	%f5,	%f0
	fmovsvc	%xcc,	%f11,	%f22
	wr	%g0,	0x04,	%asi
	lduwa	[%l7 + 0x38] %asi,	%g1
	fxnor	%f20,	%f2,	%f4
	fcmpd	%fcc0,	%f16,	%f24
	srl	%o3,	0x0E,	%g6
	mulscc	%i6,	0x05EC,	%o2
	orn	%g3,	%i0,	%l2
	fmovrde	%l0,	%f16,	%f8
	fpmerge	%f22,	%f1,	%f0
	nop
	set	0x34, %o2
	ldsb	[%l7 + %o2],	%g7
	taddcc	%i5,	0x1500,	%o4
	movrne	%i4,	0x08E,	%i2
	bcs,pt	%xcc,	loop_1628
	tg	%icc,	0x1
	sdivcc	%l3,	0x0EFF,	%l4
	edge16ln	%o5,	%g2,	%o1
loop_1628:
	fbe	%fcc2,	loop_1629
	edge8n	%i1,	%o0,	%l1
	membar	0x19
	stbar
loop_1629:
	umulcc	%o6,	0x0706,	%g5
	fnands	%f8,	%f4,	%f17
	andncc	%l5,	%i7,	%i3
	movleu	%xcc,	%o7,	%g4
	nop
	setx	loop_1630,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fmovdcs	%xcc,	%f6,	%f2
	andcc	%l6,	%o3,	%g1
	wr	%g0,	0x10,	%asi
	ldsha	[%l7 + 0x2E] %asi,	%i6
loop_1630:
	movg	%icc,	%o2,	%g6
	move	%xcc,	%g3,	%l2
	movg	%xcc,	%i0,	%l0
	fbul,a	%fcc0,	loop_1631
	sub	%g7,	0x0911,	%o4
	fbe	%fcc2,	loop_1632
	fmovsge	%xcc,	%f29,	%f1
loop_1631:
	movne	%xcc,	%i5,	%i4
	fbu,a	%fcc2,	loop_1633
loop_1632:
	fandnot2	%f0,	%f4,	%f16
	fbe	%fcc1,	loop_1634
	fmovscc	%xcc,	%f19,	%f7
loop_1633:
	mova	%icc,	%l3,	%l4
	fbul	%fcc3,	loop_1635
loop_1634:
	fpackfix	%f10,	%f24
	fornot2	%f18,	%f24,	%f0
	nop
	setx loop_1636, %l0, %l1
	jmpl %l1, %i2
loop_1635:
	movrne	%g2,	%o5,	%i1
	movvs	%icc,	%o1,	%o0
	subc	%l1,	0x13D2,	%o6
loop_1636:
	taddcc	%g5,	%l5,	%i3
	array8	%i7,	%g4,	%o7
	brz	%o3,	loop_1637
	fbug	%fcc1,	loop_1638
	bleu,a	%icc,	loop_1639
	tn	%xcc,	0x0
loop_1637:
	nop
	setx	loop_1640,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_1638:
	edge8n	%g1,	%l6,	%i6
loop_1639:
	nop
	set	0x64, %g1
	swapa	[%l7 + %g1] 0x88,	%o2
loop_1640:
	fbe	%fcc3,	loop_1641
	movge	%xcc,	%g6,	%l2
	movg	%xcc,	%i0,	%l0
	smul	%g3,	0x102C,	%g7
loop_1641:
	smulcc	%o4,	0x1D42,	%i4
	taddcctv	%l3,	%i5,	%i2
	sdiv	%g2,	0x1A89,	%l4
	fmovdl	%icc,	%f24,	%f2
	fbue	%fcc2,	loop_1642
	bn,a,pn	%xcc,	loop_1643
	ba	loop_1644
	fmovrsgz	%o5,	%f17,	%f29
loop_1642:
	edge32l	%i1,	%o0,	%l1
loop_1643:
	for	%f22,	%f30,	%f12
loop_1644:
	nop
	set	0x3A, %o6
	ldsha	[%l7 + %o6] 0x14,	%o1
	tpos	%xcc,	0x1
	wr	%g0,	0x27,	%asi
	stda	%g4,	[%l7 + 0x58] %asi
	membar	#Sync
	edge16l	%l5,	%i3,	%i7
	mova	%xcc,	%o6,	%o7
	wr	%g0,	0x89,	%asi
	stwa	%o3,	[%l7 + 0x34] %asi
	movl	%icc,	%g4,	%l6
	tneg	%xcc,	0x1
	lduw	[%l7 + 0x24],	%g1
	andncc	%i6,	%g6,	%o2
	fmovdge	%xcc,	%f0,	%f12
	fmovsge	%xcc,	%f25,	%f1
	pdist	%f18,	%f16,	%f8
	fmovsvs	%xcc,	%f12,	%f10
	fsrc1s	%f6,	%f10
	wr	%g0,	0x81,	%asi
	ldswa	[%l7 + 0x40] %asi,	%i0
	sllx	%l0,	%g3,	%g7
	move	%icc,	%l2,	%i4
	or	%l3,	0x09DC,	%i5
	set	0x10, %i1
	ldsha	[%l7 + %i1] 0x11,	%o4
	popc	0x11CF,	%i2
	fsrc1s	%f16,	%f11
	fmovdge	%xcc,	%f9,	%f1
	fornot2s	%f22,	%f1,	%f16
	tl	%icc,	0x2
	or	%g2,	%l4,	%o5
	fbue,a	%fcc1,	loop_1645
	srax	%i1,	0x13,	%l1
	tcs	%icc,	0x0
	fbuge,a	%fcc0,	loop_1646
loop_1645:
	swap	[%l7 + 0x50],	%o1
	tpos	%xcc,	0x4
	fbule	%fcc2,	loop_1647
loop_1646:
	ta	%xcc,	0x0
	std	%g4,	[%l7 + 0x20]
	bneg	%xcc,	loop_1648
loop_1647:
	bg,pt	%xcc,	loop_1649
	orncc	%o0,	0x0577,	%l5
	movne	%xcc,	%i7,	%i3
loop_1648:
	orcc	%o6,	%o3,	%g4
loop_1649:
	tsubcctv	%o7,	%g1,	%l6
	te	%xcc,	0x4
	fpack16	%f14,	%f24
	popc	%i6,	%o2
	set	0x3C, %i2
	swapa	[%l7 + %i2] 0x81,	%g6
	fmovrsgez	%l0,	%f15,	%f22
	ble,a	loop_1650
	te	%xcc,	0x7
	fmovscs	%icc,	%f29,	%f1
	orn	%i0,	%g7,	%g3
loop_1650:
	movge	%icc,	%l2,	%l3
	nop
	set	0x4C, %l3
	ldub	[%l7 + %l3],	%i4
	alignaddrl	%i5,	%i2,	%o4
	be,pt	%xcc,	loop_1651
	movcc	%xcc,	%l4,	%g2
	fbug,a	%fcc1,	loop_1652
	brnz,a	%o5,	loop_1653
loop_1651:
	ta	%xcc,	0x0
	bleu,pn	%icc,	loop_1654
loop_1652:
	fmovrslz	%l1,	%f29,	%f24
loop_1653:
	srlx	%o1,	0x18,	%g5
	movgu	%icc,	%o0,	%l5
loop_1654:
	brz	%i7,	loop_1655
	lduw	[%l7 + 0x40],	%i1
	movle	%icc,	%o6,	%o3
	fmovsgu	%xcc,	%f31,	%f8
loop_1655:
	nop
	wr	%g0,	0x18,	%asi
	stxa	%g4,	[%l7 + 0x48] %asi
	edge8n	%i3,	%g1,	%l6
	xnorcc	%i6,	0x156A,	%o2
	bneg,pn	%xcc,	loop_1656
	fcmped	%fcc1,	%f8,	%f24
	tcs	%icc,	0x0
	alignaddrl	%o7,	%g6,	%i0
loop_1656:
	fmovrdne	%l0,	%f20,	%f22
	fblg,a	%fcc3,	loop_1657
	tsubcctv	%g7,	%g3,	%l3
	fmovdn	%icc,	%f25,	%f25
	set	0x74, %l0
	stwa	%i4,	[%l7 + %l0] 0x04
loop_1657:
	brz	%l2,	loop_1658
	tcc	%icc,	0x6
	ba,a	loop_1659
	stw	%i5,	[%l7 + 0x5C]
loop_1658:
	fcmped	%fcc1,	%f28,	%f24
	set	0x5C, %i5
	stwa	%i2,	[%l7 + %i5] 0x81
loop_1659:
	srlx	%l4,	0x00,	%o4
	movle	%icc,	%o5,	%l1
	orn	%g2,	%g5,	%o0
	fcmpne32	%f12,	%f4,	%l5
	movrne	%o1,	0x151,	%i7
	ta	%xcc,	0x4
	mulscc	%i1,	0x1D61,	%o6
	wr	%g0,	0x18,	%asi
	ldsba	[%l7 + 0x5D] %asi,	%g4
	orcc	%o3,	0x0EA0,	%g1
	ble,a,pn	%icc,	loop_1660
	fmovdpos	%xcc,	%f1,	%f19
	bl,a	loop_1661
	tl	%icc,	0x7
loop_1660:
	tle	%xcc,	0x0
	edge32ln	%i3,	%l6,	%o2
loop_1661:
	udiv	%i6,	0x0B77,	%g6
	te	%xcc,	0x1
	movre	%o7,	%l0,	%g7
	mulx	%i0,	0x1E84,	%l3
	fmovrsne	%g3,	%f16,	%f16
	fcmpes	%fcc3,	%f24,	%f13
	andcc	%l2,	0x0DB3,	%i5
	fmovdl	%icc,	%f31,	%f15
	tge	%icc,	0x2
	set	0x40, %i6
	stwa	%i2,	[%l7 + %i6] 0x88
	tge	%xcc,	0x0
	std	%l4,	[%l7 + 0x70]
	tleu	%xcc,	0x6
	fbug,a	%fcc0,	loop_1662
	sub	%i4,	0x141E,	%o5
	fsrc1	%f2,	%f10
	tgu	%xcc,	0x5
loop_1662:
	movne	%xcc,	%l1,	%g2
	xnor	%o4,	0x1095,	%o0
	call	loop_1663
	mulscc	%l5,	%g5,	%i7
	fmovdn	%xcc,	%f6,	%f5
	mulx	%o1,	%i1,	%o6
loop_1663:
	tvc	%icc,	0x6
	orncc	%g4,	0x0E0A,	%o3
	fandnot2	%f28,	%f22,	%f10
	movn	%xcc,	%g1,	%l6
	srax	%o2,	0x19,	%i6
	fpack32	%f24,	%f18,	%f12
	fmovdleu	%xcc,	%f1,	%f22
	sdiv	%g6,	0x190E,	%o7
	taddcc	%i3,	%l0,	%g7
	xnor	%i0,	0x16BC,	%l3
	fand	%f16,	%f12,	%f20
	tg	%icc,	0x3
	fmovrdlez	%g3,	%f24,	%f16
	fbn,a	%fcc0,	loop_1664
	fmovd	%f12,	%f26
	fxors	%f8,	%f19,	%f20
	fornot1s	%f30,	%f7,	%f29
loop_1664:
	taddcctv	%i5,	%l2,	%l4
	srl	%i2,	%i4,	%l1
	fcmpeq16	%f24,	%f26,	%g2
	popc	0x115F,	%o5
	movn	%xcc,	%o0,	%l5
	orn	%g5,	0x0327,	%o4
	edge8	%o1,	%i7,	%o6
	fmovsne	%xcc,	%f25,	%f12
	mova	%xcc,	%g4,	%o3
	subcc	%i1,	%g1,	%l6
	fmovdvs	%xcc,	%f11,	%f21
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	smul	%o2,	0x052C,	%g6
	tneg	%icc,	0x3
	edge32l	%i6,	%i3,	%o7
	edge8l	%l0,	%g7,	%l3
	fmovscs	%icc,	%f31,	%f18
	stbar
	prefetch	[%l7 + 0x5C],	 0x1
	fbule,a	%fcc2,	loop_1665
	fbe,a	%fcc2,	loop_1666
	edge8l	%g3,	%i0,	%l2
	fbule	%fcc1,	loop_1667
loop_1665:
	ldd	[%l7 + 0x58],	%l4
loop_1666:
	edge16ln	%i5,	%i2,	%i4
	addc	%l1,	%o5,	%o0
loop_1667:
	fmovrdlez	%l5,	%f12,	%f10
	edge32	%g5,	%o4,	%g2
	tl	%xcc,	0x5
	nop
	setx	loop_1668,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	ldd	[%l7 + 0x60],	%f22
	fmovrse	%o1,	%f2,	%f28
	tcs	%icc,	0x6
loop_1668:
	fmovsleu	%xcc,	%f29,	%f29
	set	0x71, %o0
	lduba	[%l7 + %o0] 0x88,	%i7
	movpos	%icc,	%g4,	%o3
	wr	%g0,	0x0c,	%asi
	ldstuba	[%l7 + 0x24] %asi,	%i1
	smul	%o6,	%l6,	%g1
	fones	%f10
	fabss	%f28,	%f15
	membar	0x78
	tleu	%xcc,	0x1
	std	%f22,	[%l7 + 0x58]
	movrgez	%g6,	0x362,	%i6
	edge32	%i3,	%o7,	%o2
	sethi	0x026D,	%l0
	bge	%icc,	loop_1669
	edge32ln	%g7,	%l3,	%g3
	tvs	%xcc,	0x4
	movleu	%xcc,	%i0,	%l4
loop_1669:
	fbul,a	%fcc0,	loop_1670
	sllx	%l2,	0x04,	%i5
	std	%f2,	[%l7 + 0x28]
	fandnot1	%f10,	%f18,	%f26
loop_1670:
	fmovrdlz	%i2,	%f16,	%f28
	bgu,a	loop_1671
	fbug,a	%fcc3,	loop_1672
	fmovdne	%icc,	%f18,	%f11
	sdivcc	%l1,	0x05A7,	%i4
loop_1671:
	edge32ln	%o5,	%o0,	%l5
loop_1672:
	nop
	set	0x2A, %o5
	stha	%o4,	[%l7 + %o5] 0xea
	membar	#Sync
	tle	%icc,	0x7
	ta	%icc,	0x0
	fpadd32s	%f9,	%f27,	%f13
	fbug	%fcc1,	loop_1673
	array32	%g2,	%o1,	%i7
	xorcc	%g4,	%g5,	%o3
	movgu	%xcc,	%o6,	%i1
loop_1673:
	fnot2s	%f31,	%f13
	sir	0x0B16
	movrgz	%g1,	0x0E5,	%g6
	fand	%f20,	%f20,	%f0
	bgu	%icc,	loop_1674
	movneg	%icc,	%i6,	%l6
	tpos	%icc,	0x6
	fmovrdgz	%i3,	%f10,	%f8
loop_1674:
	fmovscs	%xcc,	%f21,	%f30
	subccc	%o7,	0x0CE6,	%l0
	udivx	%o2,	0x071B,	%g7
	tvc	%icc,	0x4
	bshuffle	%f22,	%f26,	%f0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fxors	%f16,	%f0,	%f3
	set	0x74, %l1
	sta	%f16,	[%l7 + %l1] 0x0c
	orcc	%g3,	0x0332,	%l3
	popc	%l4,	%l2
	fzero	%f28
	ld	[%l7 + 0x3C],	%f25
	wr	%g0,	0x11,	%asi
	ldsba	[%l7 + 0x23] %asi,	%i0
	move	%xcc,	%i5,	%i2
	fbne,a	%fcc1,	loop_1675
	te	%icc,	0x0
	tneg	%xcc,	0x6
	movne	%xcc,	%l1,	%i4
loop_1675:
	fandnot1s	%f17,	%f1,	%f9
	tgu	%xcc,	0x0
	wr	%g0,	0x88,	%asi
	lduba	[%l7 + 0x76] %asi,	%o0
	fbuge,a	%fcc3,	loop_1676
	tle	%icc,	0x4
	fbu	%fcc3,	loop_1677
	fbuge,a	%fcc0,	loop_1678
loop_1676:
	movge	%icc,	%l5,	%o4
	nop
	setx	loop_1679,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_1677:
	fxnor	%f26,	%f20,	%f22
loop_1678:
	stbar
	edge8	%o5,	%g2,	%i7
loop_1679:
	edge32n	%g4,	%g5,	%o3
	tsubcc	%o1,	%i1,	%o6
	andcc	%g6,	%i6,	%g1
	set	0x68, %l5
	lda	[%l7 + %l5] 0x80,	%f27
	edge8ln	%i3,	%o7,	%l0
	tge	%icc,	0x1
	set	0x40, %i0
	ldstuba	[%l7 + %i0] 0x81,	%l6
	movrlz	%g7,	0x25C,	%o2
	edge32ln	%l3,	%g3,	%l4
	fornot2	%f4,	%f16,	%f8
	or	%i0,	0x1079,	%l2
	fnot1s	%f15,	%f4
	umul	%i2,	0x0D79,	%i5
	mulx	%l1,	%i4,	%o0
	fcmpne32	%f4,	%f10,	%o4
	wr	%g0,	0xe2,	%asi
	stha	%l5,	[%l7 + 0x38] %asi
	membar	#Sync
	ta	%xcc,	0x5
	fbge,a	%fcc3,	loop_1680
	add	%o5,	%g2,	%g4
	flush	%l7 + 0x20
	smulcc	%g5,	0x08D3,	%i7
loop_1680:
	fcmpgt16	%f8,	%f8,	%o3
	fbug	%fcc1,	loop_1681
	movrlez	%i1,	%o1,	%o6
	srax	%i6,	0x17,	%g1
	movvc	%icc,	%g6,	%i3
loop_1681:
	for	%f20,	%f0,	%f26
	sdivcc	%l0,	0x173B,	%o7
	xor	%l6,	0x00EE,	%g7
	fmovdl	%xcc,	%f17,	%f7
	ldsh	[%l7 + 0x1E],	%l3
	stx	%g3,	[%l7 + 0x20]
	movpos	%xcc,	%o2,	%i0
	andn	%l2,	0x0442,	%i2
	stbar
	andncc	%l4,	%i5,	%i4
	popc	0x15CE,	%l1
	tcc	%icc,	0x7
	fone	%f0
	tn	%xcc,	0x7
	fones	%f5
	srlx	%o0,	%o4,	%l5
	movpos	%icc,	%o5,	%g2
	movrgez	%g5,	%g4,	%o3
	movre	%i7,	%i1,	%o1
	set	0x33, %o4
	ldstuba	[%l7 + %o4] 0x80,	%i6
	umul	%o6,	%g6,	%i3
	mulx	%g1,	%o7,	%l0
	xor	%l6,	%g7,	%g3
	edge32ln	%l3,	%i0,	%o2
	edge32n	%i2,	%l2,	%l4
	orcc	%i4,	%i5,	%l1
	fmovdpos	%xcc,	%f26,	%f30
	xorcc	%o4,	%o0,	%o5
	wr	%g0,	0x0c,	%asi
	prefetcha	[%l7 + 0x28] %asi,	 0x0
	subcc	%g5,	%g4,	%g2
	srlx	%o3,	%i7,	%i1
	flush	%l7 + 0x3C
	fmovrdgez	%i6,	%f18,	%f28
	ldx	[%l7 + 0x08],	%o6
	xnorcc	%o1,	0x1D9E,	%i3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsg	%xcc,	%f12,	%f2
	subc	%g6,	%o7,	%l0
	fbe	%fcc3,	loop_1682
	edge16n	%g1,	%g7,	%g3
	fbge,a	%fcc1,	loop_1683
	fcmps	%fcc0,	%f7,	%f31
loop_1682:
	nop
	setx loop_1684, %l0, %l1
	jmpl %l1, %l6
	and	%i0,	%l3,	%i2
loop_1683:
	edge8	%l2,	%o2,	%l4
	srl	%i5,	%i4,	%o4
loop_1684:
	fmovdl	%icc,	%f24,	%f19
	srl	%o0,	0x10,	%l1
	set	0x40, %o7
	ldda	[%l7 + %o7] 0x81,	%f0
	alignaddrl	%l5,	%o5,	%g5
	xnorcc	%g2,	0x1C83,	%o3
	fbge	%fcc3,	loop_1685
	mulscc	%g4,	%i1,	%i7
	tvs	%icc,	0x6
	alignaddrl	%o6,	%i6,	%o1
loop_1685:
	nop
	set	0x3A, %g2
	lduha	[%l7 + %g2] 0x88,	%i3
	brlez	%o7,	loop_1686
	edge16n	%l0,	%g6,	%g1
	tne	%xcc,	0x2
	fmovrdlz	%g3,	%f14,	%f12
loop_1686:
	fcmpgt16	%f2,	%f18,	%g7
	fbule,a	%fcc1,	loop_1687
	andncc	%l6,	%l3,	%i0
	srlx	%l2,	0x1C,	%i2
	sdiv	%o2,	0x13F8,	%i5
loop_1687:
	tcc	%xcc,	0x5
	fbul,a	%fcc3,	loop_1688
	array32	%l4,	%i4,	%o4
	ba	%xcc,	loop_1689
	xnorcc	%l1,	0x016E,	%o0
loop_1688:
	movrgz	%o5,	%l5,	%g2
	sdiv	%o3,	0x1FEA,	%g5
loop_1689:
	movrne	%g4,	%i1,	%i7
	sub	%i6,	%o6,	%o1
	umul	%o7,	0x165B,	%l0
	fmovrdgz	%i3,	%f16,	%f14
	movcc	%xcc,	%g1,	%g6
	fmuld8sux16	%f10,	%f19,	%f22
	stx	%g3,	[%l7 + 0x40]
	fbg,a	%fcc3,	loop_1690
	smulcc	%g7,	0x1C13,	%l3
	fmovdge	%xcc,	%f9,	%f20
	sir	0x1C09
loop_1690:
	sllx	%l6,	%i0,	%l2
	wr	%g0,	0x2f,	%asi
	stwa	%o2,	[%l7 + 0x58] %asi
	membar	#Sync
	array8	%i2,	%l4,	%i5
	ta	%icc,	0x6
	alignaddrl	%o4,	%l1,	%o0
	fmovrdlez	%i4,	%f20,	%f28
	fxnors	%f13,	%f0,	%f20
	tle	%xcc,	0x6
	fbl,a	%fcc2,	loop_1691
	bcs,a	%icc,	loop_1692
	movcs	%xcc,	%o5,	%l5
	sll	%o3,	0x19,	%g5
loop_1691:
	sdiv	%g4,	0x0AFD,	%i1
loop_1692:
	fble,a	%fcc2,	loop_1693
	fmuld8sux16	%f16,	%f11,	%f2
	fmovrslz	%g2,	%f8,	%f12
	tpos	%icc,	0x0
loop_1693:
	tl	%icc,	0x1
	edge32ln	%i7,	%o6,	%i6
	or	%o1,	%o7,	%l0
	wr	%g0,	0x2a,	%asi
	stwa	%g1,	[%l7 + 0x24] %asi
	membar	#Sync
	tcs	%xcc,	0x1
	tl	%icc,	0x6
	sllx	%i3,	0x0E,	%g6
	sllx	%g7,	%g3,	%l6
	sra	%i0,	%l3,	%l2
	tgu	%icc,	0x3
	flush	%l7 + 0x24
	addc	%i2,	0x1984,	%l4
	edge16l	%o2,	%o4,	%i5
	fmovsn	%icc,	%f12,	%f16
	array32	%o0,	%i4,	%l1
	fmovrde	%l5,	%f14,	%f10
	fmovdge	%xcc,	%f18,	%f8
	move	%xcc,	%o5,	%g5
	andn	%g4,	%o3,	%g2
	srax	%i1,	0x17,	%o6
	sra	%i7,	0x1E,	%i6
	nop
	setx	loop_1694,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	nop
	setx loop_1695, %l0, %l1
	jmpl %l1, %o1
	srax	%l0,	0x05,	%g1
	orn	%o7,	%g6,	%i3
loop_1694:
	subc	%g7,	%g3,	%i0
loop_1695:
	edge8	%l6,	%l2,	%i2
	wr	%g0,	0x81,	%asi
	swapa	[%l7 + 0x08] %asi,	%l3
	xnorcc	%o2,	%l4,	%i5
	fmovrslz	%o4,	%f26,	%f11
	array8	%i4,	%l1,	%o0
	subccc	%o5,	0x17B8,	%g5
	fzeros	%f24
	movne	%xcc,	%g4,	%o3
	tgu	%icc,	0x6
	tpos	%xcc,	0x0
	fmovscs	%icc,	%f10,	%f13
	edge16n	%l5,	%g2,	%i1
	tne	%icc,	0x3
	pdist	%f0,	%f10,	%f12
	subccc	%i7,	%o6,	%i6
	movneg	%icc,	%o1,	%g1
	call	loop_1696
	tne	%icc,	0x1
	fcmps	%fcc1,	%f31,	%f24
	fmovdvc	%icc,	%f18,	%f12
loop_1696:
	movrgz	%o7,	%l0,	%i3
	mulx	%g6,	%g3,	%g7
	udivcc	%i0,	0x1FE8,	%l6
	membar	0x52
	fpadd16	%f22,	%f24,	%f22
	taddcctv	%l2,	0x1CB7,	%i2
	edge32l	%o2,	%l4,	%i5
	fnands	%f24,	%f2,	%f30
	movre	%l3,	%i4,	%l1
	fmovsvs	%icc,	%f14,	%f4
	fmovdcc	%xcc,	%f31,	%f19
	edge32l	%o4,	%o0,	%o5
	fbg,a	%fcc1,	loop_1697
	srl	%g4,	%o3,	%l5
	fcmple32	%f2,	%f18,	%g5
	fnor	%f24,	%f8,	%f8
loop_1697:
	sub	%g2,	0x1E6C,	%i1
	movle	%icc,	%o6,	%i7
	bcc	loop_1698
	array8	%i6,	%o1,	%o7
	movn	%icc,	%l0,	%g1
	fbe,a	%fcc2,	loop_1699
loop_1698:
	tn	%icc,	0x7
	tsubcctv	%g6,	0x0CED,	%i3
	brlz	%g7,	loop_1700
loop_1699:
	movgu	%xcc,	%i0,	%l6
	movrlez	%g3,	%l2,	%i2
	andcc	%o2,	0x02CE,	%i5
loop_1700:
	movre	%l4,	0x25D,	%l3
	fpsub32	%f24,	%f18,	%f26
	array8	%l1,	%o4,	%i4
	ldd	[%l7 + 0x78],	%f4
	orcc	%o5,	0x1513,	%g4
	fmovsge	%icc,	%f24,	%f15
	add	%l7,	0x60,	%l6
	wr	%g0,	0x10,	%asi
	casxa	[%l6] 0x10,	%o3,	%l5
	ldub	[%l7 + 0x15],	%g5
	addccc	%g2,	%i1,	%o0
	ldub	[%l7 + 0x0F],	%i7
	fcmps	%fcc2,	%f17,	%f25
	for	%f8,	%f10,	%f26
	fcmped	%fcc2,	%f18,	%f6
	fmovs	%f24,	%f1
	fcmpes	%fcc3,	%f8,	%f29
	array32	%o6,	%i6,	%o1
	ld	[%l7 + 0x70],	%f13
	sub	%o7,	%l0,	%g1
	membar	0x5C
	fabsd	%f0,	%f6
	movne	%icc,	%i3,	%g6
	alignaddrl	%g7,	%l6,	%g3
	tpos	%xcc,	0x7
	flush	%l7 + 0x50
	fmovda	%icc,	%f18,	%f9
	movneg	%xcc,	%l2,	%i0
	orcc	%i2,	%o2,	%i5
	subcc	%l4,	0x177E,	%l1
	fornot1s	%f0,	%f16,	%f26
	sub	%o4,	0x1390,	%i4
	fsrc2s	%f11,	%f27
	stbar
	ld	[%l7 + 0x48],	%f23
	fbl,a	%fcc1,	loop_1701
	subccc	%o5,	%g4,	%o3
	fcmpeq16	%f10,	%f20,	%l5
	fone	%f22
loop_1701:
	fpack32	%f20,	%f6,	%f10
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stb	%g5,	[%l7 + 0x1C]
	stb	%g2,	[%l7 + 0x3B]
	fbuge,a	%fcc1,	loop_1702
	fnors	%f8,	%f10,	%f20
	movrlez	%l3,	0x1C2,	%i1
	movgu	%icc,	%i7,	%o0
loop_1702:
	fpsub32	%f2,	%f20,	%f12
	bn	%xcc,	loop_1703
	sth	%i6,	[%l7 + 0x52]
	movne	%xcc,	%o6,	%o7
	ta	%xcc,	0x6
loop_1703:
	movrgez	%l0,	%o1,	%g1
	umulcc	%g6,	0x08E3,	%g7
	wr	%g0,	0x2f,	%asi
	stha	%l6,	[%l7 + 0x52] %asi
	membar	#Sync
	fzero	%f22
	fandnot1s	%f28,	%f7,	%f28
	tle	%xcc,	0x5
	prefetch	[%l7 + 0x30],	 0x2
	andcc	%i3,	0x17E2,	%l2
	bg,pn	%icc,	loop_1704
	edge32l	%i0,	%i2,	%o2
	edge32	%g3,	%i5,	%l1
	edge32ln	%l4,	%i4,	%o5
loop_1704:
	fmovrdgz	%g4,	%f20,	%f6
	edge16l	%o4,	%l5,	%g5
	tsubcctv	%g2,	%o3,	%i1
	bl,a	%icc,	loop_1705
	sir	0x0848
	lduw	[%l7 + 0x4C],	%l3
	fbe	%fcc0,	loop_1706
loop_1705:
	fbule	%fcc2,	loop_1707
	fbuge	%fcc2,	loop_1708
	siam	0x1
loop_1706:
	udivx	%i7,	0x03C1,	%o0
loop_1707:
	brz,a	%i6,	loop_1709
loop_1708:
	stw	%o6,	[%l7 + 0x24]
	fmovrslz	%o7,	%f24,	%f22
	flush	%l7 + 0x0C
loop_1709:
	ldsb	[%l7 + 0x17],	%l0
	sethi	0x015B,	%g1
	wr	%g0,	0x0c,	%asi
	stda	%o0,	[%l7 + 0x20] %asi
	sdivcc	%g7,	0x0632,	%l6
	add	%l7,	0x68,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] %asi,	%g6,	%l2
	tleu	%icc,	0x5
	flush	%l7 + 0x74
	fmovd	%f28,	%f0
	sir	0x0709
	ldsw	[%l7 + 0x30],	%i3
	movle	%icc,	%i0,	%i2
	movcc	%icc,	%o2,	%i5
	taddcc	%l1,	0x1289,	%l4
	te	%xcc,	0x6
	array8	%g3,	%o5,	%g4
	tl	%icc,	0x7
	fones	%f19
	set	0x58, %i4
	ldsba	[%l7 + %i4] 0x19,	%o4
	st	%f26,	[%l7 + 0x54]
	brnz	%l5,	loop_1710
	subcc	%g5,	%i4,	%g2
	brz,a	%i1,	loop_1711
	smulcc	%o3,	%i7,	%o0
loop_1710:
	for	%f8,	%f30,	%f16
	alignaddrl	%i6,	%l3,	%o7
loop_1711:
	ta	%icc,	0x4
	edge8ln	%l0,	%o6,	%g1
	bshuffle	%f0,	%f24,	%f4
	fblg,a	%fcc3,	loop_1712
	or	%g7,	0x1046,	%l6
	orcc	%g6,	0x0EEB,	%l2
	wr	%g0,	0x04,	%asi
	swapa	[%l7 + 0x74] %asi,	%o1
loop_1712:
	srax	%i3,	0x00,	%i2
	wr	%g0,	0x81,	%asi
	ldxa	[%l7 + 0x18] %asi,	%i0
	sll	%o2,	0x13,	%i5
	array16	%l1,	%g3,	%l4
	membar	0x00
	fcmple32	%f6,	%f20,	%o5
	tg	%icc,	0x2
	popc	0x1941,	%g4
	fnegd	%f26,	%f24
	edge8l	%l5,	%g5,	%o4
	tsubcctv	%g2,	0x0F64,	%i1
	be,pn	%icc,	loop_1713
	movpos	%xcc,	%o3,	%i4
	bpos,pt	%xcc,	loop_1714
	umulcc	%i7,	0x0FDD,	%i6
loop_1713:
	sethi	0x09BE,	%o0
	mulscc	%o7,	0x11CC,	%l0
loop_1714:
	sethi	0x1612,	%o6
	st	%f6,	[%l7 + 0x10]
	edge16l	%l3,	%g1,	%l6
	movge	%xcc,	%g7,	%g6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddr	%o1,	%l2,	%i2
	swap	[%l7 + 0x08],	%i0
	edge32	%i3,	%i5,	%l1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tgu	%xcc,	0x2
	sra	%g3,	%o2,	%l4
	udivcc	%g4,	0x08CF,	%l5
	set	0x40, %g3
	ldda	[%l7 + %g3] 0x18,	%f16
	ba,a	loop_1715
	movvs	%xcc,	%g5,	%o4
	edge32ln	%o5,	%g2,	%i1
	wr	%g0,	0x2e,	%asi
	ldda	[%l7 + 0x20] %asi,	%o2
loop_1715:
	movvs	%icc,	%i7,	%i4
	edge16n	%i6,	%o0,	%o7
	sdivcc	%o6,	0x0554,	%l0
	movgu	%icc,	%l3,	%l6
	mulx	%g7,	0x04AE,	%g1
	edge16ln	%g6,	%l2,	%i2
	add	%l7,	0x18,	%l6
	wr	%g0,	0x04,	%asi
	casa	[%l6] 0x04,	%i0,	%i3
	movcc	%xcc,	%o1,	%l1
	orn	%g3,	%i5,	%o2
	fornot2	%f10,	%f2,	%f8
	fmovrde	%l4,	%f22,	%f4
	bvs,a,pn	%xcc,	loop_1716
	tn	%xcc,	0x4
	sir	0x1228
	stb	%g4,	[%l7 + 0x44]
loop_1716:
	smul	%g5,	0x1668,	%l5
	fmovrde	%o5,	%f16,	%f18
	edge8	%o4,	%g2,	%o3
	fmovd	%f8,	%f22
	addccc	%i1,	%i7,	%i6
	or	%i4,	%o7,	%o6
	sdivcc	%o0,	0x14E0,	%l0
	ta	%xcc,	0x0
	tl	%icc,	0x6
	fpsub32s	%f2,	%f17,	%f11
	sdivx	%l3,	0x0618,	%g7
	tcc	%xcc,	0x5
	tvs	%xcc,	0x3
	brnz,a	%l6,	loop_1717
	udivcc	%g1,	0x0011,	%g6
	brlz	%l2,	loop_1718
	std	%f24,	[%l7 + 0x18]
loop_1717:
	popc	%i0,	%i2
	array32	%i3,	%o1,	%g3
loop_1718:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srl	%i5,	%o2,	%l4
	mova	%icc,	%g4,	%l1
	st	%f30,	[%l7 + 0x68]
	andcc	%g5,	0x0988,	%o5
	movge	%xcc,	%o4,	%g2
	movrlz	%l5,	0x02E,	%i1
	fmovrsne	%o3,	%f16,	%f19
	movrgz	%i7,	0x3EC,	%i6
	wr	%g0,	0x80,	%asi
	swapa	[%l7 + 0x18] %asi,	%o7
	membar	0x51
	movvs	%xcc,	%o6,	%o0
	fbge	%fcc2,	loop_1719
	tleu	%xcc,	0x7
	fmuld8ulx16	%f1,	%f4,	%f24
	orcc	%i4,	0x1986,	%l3
loop_1719:
	nop
	set	0x38, %o3
	stda	%l0,	[%l7 + %o3] 0xe2
	membar	#Sync
	mova	%xcc,	%g7,	%g1
	subc	%l6,	%l2,	%i0
	fmovdge	%xcc,	%f26,	%f29
	tcc	%xcc,	0x4
	fcmped	%fcc2,	%f28,	%f20
	movcc	%icc,	%g6,	%i2
	addccc	%o1,	%i3,	%g3
	udiv	%i5,	0x0989,	%l4
	tg	%xcc,	0x7
	movn	%xcc,	%o2,	%l1
	fmovdle	%icc,	%f25,	%f26
	sir	0x09EA
	tsubcc	%g5,	%g4,	%o5
	movge	%xcc,	%o4,	%l5
	sethi	0x0CE9,	%i1
	fbn,a	%fcc3,	loop_1720
	fmovrdgez	%o3,	%f26,	%f28
	st	%f7,	[%l7 + 0x3C]
	bshuffle	%f4,	%f2,	%f26
loop_1720:
	addc	%g2,	0x0A4D,	%i6
	fmovse	%xcc,	%f9,	%f17
	fbl	%fcc1,	loop_1721
	ldub	[%l7 + 0x17],	%o7
	subc	%i7,	%o6,	%i4
	movle	%icc,	%l3,	%l0
loop_1721:
	fexpand	%f25,	%f26
	edge8	%o0,	%g1,	%g7
	andn	%l6,	0x0C67,	%i0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sll	%l2,	%g6,	%i2
	bgu	%xcc,	loop_1722
	membar	0x06
	fmul8x16	%f25,	%f20,	%f0
	stb	%o1,	[%l7 + 0x5D]
loop_1722:
	movleu	%xcc,	%g3,	%i5
	array8	%l4,	%o2,	%l1
	bpos,pt	%xcc,	loop_1723
	bshuffle	%f16,	%f6,	%f12
	movrlz	%i3,	0x108,	%g4
	tsubcctv	%g5,	%o5,	%o4
loop_1723:
	array8	%i1,	%l5,	%o3
	fpadd32s	%f22,	%f6,	%f5
	fxor	%f14,	%f14,	%f30
	tcs	%icc,	0x7
	edge32n	%g2,	%o7,	%i7
	brnz,a	%o6,	loop_1724
	orn	%i6,	%l3,	%l0
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x72] %asi,	%o0
loop_1724:
	andn	%i4,	%g7,	%g1
	bneg,pn	%xcc,	loop_1725
	bn,a	%xcc,	loop_1726
	move	%icc,	%i0,	%l6
	tsubcctv	%l2,	0x0A45,	%i2
loop_1725:
	tpos	%xcc,	0x3
loop_1726:
	movpos	%xcc,	%o1,	%g6
	bneg,a	loop_1727
	fmovsvc	%icc,	%f6,	%f16
	edge8ln	%i5,	%l4,	%g3
	fsrc1	%f14,	%f26
loop_1727:
	fbe,a	%fcc2,	loop_1728
	siam	0x2
	movle	%icc,	%l1,	%i3
	fbuge	%fcc0,	loop_1729
loop_1728:
	edge32n	%g4,	%o2,	%g5
	orn	%o5,	0x0BC5,	%o4
	bne,a	%icc,	loop_1730
loop_1729:
	edge16n	%i1,	%l5,	%o3
	bge,a,pt	%xcc,	loop_1731
	movleu	%xcc,	%g2,	%o7
loop_1730:
	fbne,a	%fcc1,	loop_1732
	movcs	%xcc,	%i7,	%i6
loop_1731:
	fmovrse	%o6,	%f27,	%f20
	add	%l0,	%o0,	%l3
loop_1732:
	xnor	%g7,	0x126C,	%g1
	xorcc	%i4,	%l6,	%l2
	subccc	%i2,	0x175A,	%o1
	edge16ln	%g6,	%i5,	%l4
	tvs	%xcc,	0x2
	nop
	set	0x18, %l4
	ldd	[%l7 + %l4],	%f0
	movne	%xcc,	%g3,	%l1
	sub	%i3,	%i0,	%g4
	fbn	%fcc0,	loop_1733
	fors	%f17,	%f10,	%f9
	subcc	%o2,	0x0594,	%g5
	orcc	%o4,	0x1CBA,	%i1
loop_1733:
	fornot2s	%f18,	%f19,	%f6
	set	0x1B, %g4
	ldsba	[%l7 + %g4] 0x04,	%o5
	fmovrsgez	%o3,	%f6,	%f21
	xorcc	%l5,	0x1AB2,	%g2
	smul	%i7,	%i6,	%o6
	tg	%icc,	0x7
	orncc	%o7,	0x0D84,	%o0
	edge8ln	%l0,	%l3,	%g7
	faligndata	%f18,	%f24,	%f6
	fcmpgt16	%f16,	%f30,	%g1
	tge	%xcc,	0x3
	fpack16	%f2,	%f19
	brnz	%i4,	loop_1734
	fbug,a	%fcc3,	loop_1735
	srl	%l6,	0x18,	%i2
	membar	0x3D
loop_1734:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1735:
	movl	%icc,	%l2,	%g6
	movcc	%xcc,	%o1,	%l4
	orncc	%i5,	%l1,	%g3
	tsubcctv	%i0,	%g4,	%i3
	fmovdcc	%xcc,	%f17,	%f13
	movpos	%xcc,	%g5,	%o4
	fmovdcs	%icc,	%f8,	%f28
	call	loop_1736
	fmovsn	%icc,	%f16,	%f6
	taddcc	%o2,	0x1BB0,	%o5
	tvc	%icc,	0x0
loop_1736:
	tcs	%icc,	0x4
	fmovdl	%xcc,	%f29,	%f17
	fmovdgu	%icc,	%f22,	%f4
	sdiv	%i1,	0x0B64,	%o3
	movrlez	%g2,	0x129,	%l5
	fpadd32	%f4,	%f20,	%f20
	fbue,a	%fcc3,	loop_1737
	movleu	%icc,	%i6,	%o6
	mulx	%o7,	%i7,	%l0
	tneg	%xcc,	0x4
loop_1737:
	or	%o0,	0x1DFA,	%l3
	subccc	%g1,	0x10EC,	%i4
	set	0x70, %g5
	ldda	[%l7 + %g5] 0x11,	%i6
	array8	%i2,	%g7,	%l2
	edge16	%g6,	%o1,	%l4
	tpos	%xcc,	0x3
	fmovdl	%icc,	%f29,	%f19
	subcc	%i5,	%g3,	%l1
	stx	%i0,	[%l7 + 0x28]
	edge16ln	%g4,	%g5,	%i3
	edge32l	%o4,	%o2,	%o5
	tle	%icc,	0x7
	edge16	%o3,	%g2,	%l5
	fmovs	%f24,	%f9
	movcc	%icc,	%i6,	%o6
	tleu	%icc,	0x6
	movcc	%icc,	%o7,	%i1
	membar	0x39
	movrgez	%l0,	%i7,	%l3
	subc	%o0,	%i4,	%g1
	addccc	%i2,	0x0093,	%l6
	membar	0x6A
	tne	%xcc,	0x5
	array8	%l2,	%g6,	%g7
	fcmpgt32	%f8,	%f28,	%o1
	membar	0x44
	movg	%xcc,	%l4,	%i5
	sdiv	%g3,	0x1256,	%i0
	subcc	%g4,	0x1AFB,	%l1
	siam	0x5
	alignaddr	%g5,	%o4,	%i3
	bcc,a	loop_1738
	tge	%icc,	0x4
	fmovdn	%icc,	%f17,	%f14
	and	%o5,	%o2,	%g2
loop_1738:
	bpos,pt	%xcc,	loop_1739
	fmul8x16	%f9,	%f30,	%f16
	tpos	%icc,	0x2
	mova	%icc,	%o3,	%i6
loop_1739:
	orncc	%o6,	%l5,	%i1
	subcc	%o7,	%i7,	%l0
	subcc	%o0,	0x0EC6,	%i4
	flush	%l7 + 0x44
	fmovdvs	%icc,	%f26,	%f4
	tgu	%xcc,	0x4
	fcmpne16	%f14,	%f8,	%l3
	ba,a,pt	%xcc,	loop_1740
	ta	%xcc,	0x3
	fcmpgt32	%f24,	%f20,	%g1
	movne	%xcc,	%i2,	%l6
loop_1740:
	nop
	set	0x1C, %o1
	ldswa	[%l7 + %o1] 0x80,	%l2
	xnor	%g6,	%g7,	%o1
	sdivx	%i5,	0x107D,	%l4
	andn	%g3,	%g4,	%l1
	add	%g5,	%o4,	%i0
	fbl,a	%fcc3,	loop_1741
	fmuld8sux16	%f4,	%f29,	%f16
	edge32l	%o5,	%i3,	%g2
	bn,a	%icc,	loop_1742
loop_1741:
	edge16	%o3,	%i6,	%o2
	srax	%l5,	%o6,	%i1
	fandnot2	%f16,	%f18,	%f18
loop_1742:
	fmovrde	%o7,	%f12,	%f22
	nop
	setx	loop_1743,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movrne	%l0,	0x031,	%i7
	movneg	%icc,	%i4,	%o0
	movrgez	%l3,	0x3D0,	%g1
loop_1743:
	udiv	%l6,	0x1974,	%i2
	tsubcctv	%l2,	0x1BB5,	%g6
	array32	%g7,	%o1,	%l4
	bpos,a,pn	%xcc,	loop_1744
	bl,pt	%xcc,	loop_1745
	sethi	0x00D5,	%i5
	array16	%g4,	%g3,	%g5
loop_1744:
	fandnot1	%f22,	%f12,	%f16
loop_1745:
	tpos	%icc,	0x3
	fmovrsne	%l1,	%f12,	%f13
	srax	%i0,	%o5,	%o4
	srlx	%i3,	0x11,	%o3
	sdivcc	%i6,	0x0854,	%g2
	wr	%g0,	0x81,	%asi
	stwa	%o2,	[%l7 + 0x38] %asi
	umul	%o6,	0x16F9,	%l5
	fbu	%fcc1,	loop_1746
	flush	%l7 + 0x6C
	movle	%xcc,	%i1,	%l0
	array32	%o7,	%i4,	%o0
loop_1746:
	stw	%i7,	[%l7 + 0x0C]
	edge8l	%g1,	%l3,	%l6
	tsubcctv	%l2,	0x07A7,	%g6
	wr	%g0,	0x19,	%asi
	sta	%f11,	[%l7 + 0x34] %asi
	subc	%i2,	%g7,	%l4
	tsubcctv	%i5,	%o1,	%g3
	fpackfix	%f30,	%f14
	bg,pn	%icc,	loop_1747
	tg	%xcc,	0x0
	fbl,a	%fcc0,	loop_1748
	sdivcc	%g4,	0x1051,	%g5
loop_1747:
	movn	%xcc,	%i0,	%l1
	edge8n	%o4,	%i3,	%o5
loop_1748:
	smulcc	%i6,	0x10B4,	%o3
	movrlz	%o2,	%o6,	%g2
	mulscc	%l5,	%i1,	%l0
	umulcc	%o7,	0x1722,	%o0
	umulcc	%i7,	0x0E2A,	%g1
	sll	%i4,	%l6,	%l2
	sdivcc	%l3,	0x1D10,	%i2
	fcmple32	%f28,	%f28,	%g7
	fmovdle	%xcc,	%f26,	%f4
	movrgz	%g6,	%i5,	%o1
	ldub	[%l7 + 0x36],	%g3
	wr	%g0,	0x04,	%asi
	stha	%g4,	[%l7 + 0x12] %asi
	nop
	setx loop_1749, %l0, %l1
	jmpl %l1, %g5
	swap	[%l7 + 0x74],	%i0
	popc	%l1,	%o4
	srax	%l4,	%o5,	%i3
loop_1749:
	bcs,pn	%icc,	loop_1750
	fmul8sux16	%f4,	%f18,	%f18
	fmul8ulx16	%f4,	%f18,	%f8
	edge16ln	%i6,	%o2,	%o6
loop_1750:
	fexpand	%f17,	%f14
	fbul,a	%fcc1,	loop_1751
	addc	%o3,	0x0D3C,	%l5
	orn	%i1,	%g2,	%o7
	brnz	%l0,	loop_1752
loop_1751:
	edge8	%o0,	%g1,	%i7
	fmul8sux16	%f22,	%f30,	%f20
	movgu	%icc,	%i4,	%l2
loop_1752:
	ble	loop_1753
	umulcc	%l3,	0x0632,	%l6
	bge,a,pn	%xcc,	loop_1754
	sdivcc	%i2,	0x1DB9,	%g6
loop_1753:
	edge8	%g7,	%o1,	%g3
	movle	%xcc,	%g4,	%i5
loop_1754:
	fbe	%fcc3,	loop_1755
	fpsub32s	%f7,	%f31,	%f6
	movg	%xcc,	%g5,	%i0
	ldsh	[%l7 + 0x6A],	%l1
loop_1755:
	fbg,a	%fcc1,	loop_1756
	fmovsne	%icc,	%f24,	%f30
	fzero	%f6
	addccc	%l4,	0x1533,	%o5
loop_1756:
	fpsub16s	%f7,	%f24,	%f21
	sdivx	%i3,	0x0F2D,	%i6
	add	%o4,	%o2,	%o3
	fcmps	%fcc1,	%f29,	%f3
	movneg	%icc,	%l5,	%o6
	fandnot2	%f6,	%f16,	%f6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmped	%fcc1,	%f0,	%f20
	fbue,a	%fcc3,	loop_1757
	brgz	%i1,	loop_1758
	tsubcc	%o7,	0x1F12,	%l0
	ba	%icc,	loop_1759
loop_1757:
	fbul,a	%fcc3,	loop_1760
loop_1758:
	movn	%xcc,	%o0,	%g2
	fsrc1	%f30,	%f22
loop_1759:
	taddcc	%i7,	0x0858,	%g1
loop_1760:
	fmovscs	%xcc,	%f19,	%f1
	sdivx	%l2,	0x1466,	%l3
	fmul8ulx16	%f24,	%f22,	%f6
	orncc	%l6,	%i2,	%g6
	edge8l	%g7,	%o1,	%g3
	movrlez	%g4,	%i4,	%g5
	mulx	%i5,	%i0,	%l1
	mova	%icc,	%o5,	%l4
	fnands	%f17,	%f10,	%f27
	fcmple16	%f14,	%f28,	%i6
	fmovdvs	%xcc,	%f6,	%f18
	smulcc	%i3,	%o2,	%o3
	or	%o4,	%o6,	%l5
	fornot2s	%f21,	%f14,	%f29
	set	0x6C, %g6
	ldsha	[%l7 + %g6] 0x80,	%i1
	fmovdg	%icc,	%f26,	%f0
	tleu	%icc,	0x5
	movge	%xcc,	%l0,	%o0
	tsubcctv	%g2,	0x0483,	%o7
	fmovrdlz	%g1,	%f12,	%f12
	movne	%icc,	%l2,	%i7
	andncc	%l6,	%l3,	%g6
	tgu	%xcc,	0x4
	array8	%i2,	%o1,	%g3
	fmovdpos	%xcc,	%f17,	%f1
	fmovrslez	%g7,	%f8,	%f22
	std	%f20,	[%l7 + 0x20]
	movrlz	%g4,	%g5,	%i4
	andcc	%i0,	0x183F,	%l1
	addccc	%i5,	0x10E5,	%l4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8n	%i6,	%i3,	%o2
	tcs	%xcc,	0x1
	membar	#Sync
	wr	%g0,	0xf9,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	edge16n	%o5,	%o4,	%o6
	fabss	%f8,	%f25
	fcmpeq16	%f20,	%f16,	%l5
	fsrc2s	%f17,	%f27
	sdivx	%i1,	0x093A,	%l0
	fbl	%fcc0,	loop_1761
	tvs	%icc,	0x0
	ldd	[%l7 + 0x38],	%f16
	movrne	%o0,	%g2,	%o3
loop_1761:
	orn	%o7,	0x0433,	%g1
	tne	%icc,	0x7
	movrlz	%i7,	%l6,	%l3
	brlez	%l2,	loop_1762
	taddcctv	%i2,	%o1,	%g6
	edge8ln	%g7,	%g3,	%g5
	sdiv	%g4,	0x027B,	%i0
loop_1762:
	fbul,a	%fcc3,	loop_1763
	fnot1s	%f6,	%f12
	brlez	%l1,	loop_1764
	fpack16	%f10,	%f7
loop_1763:
	nop
	set	0x54, %i3
	ldsb	[%l7 + %i3],	%i4
	movgu	%xcc,	%i5,	%l4
loop_1764:
	ldx	[%l7 + 0x48],	%i3
	sra	%i6,	%o2,	%o4
	udivcc	%o5,	0x10A8,	%l5
	add	%o6,	%l0,	%o0
	fxnors	%f11,	%f5,	%f25
	bge,a	loop_1765
	tsubcctv	%i1,	%g2,	%o7
	edge32	%o3,	%i7,	%l6
	fxnor	%f20,	%f2,	%f18
loop_1765:
	edge8ln	%g1,	%l2,	%l3
	add	%l7,	0x6C,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%i2
	casa	[%l6] 0x80,	%i2,	%o1
	nop
	set	0x28, %i7
	ldsh	[%l7 + %i7],	%g6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bne,a	%icc,	loop_1766
	fmul8sux16	%f14,	%f4,	%f28
	fcmped	%fcc0,	%f14,	%f18
	movn	%icc,	%g7,	%g5
loop_1766:
	fandnot2s	%f19,	%f30,	%f6
	bcs	%icc,	loop_1767
	be	loop_1768
	fmuld8ulx16	%f16,	%f24,	%f14
	fbug,a	%fcc3,	loop_1769
loop_1767:
	edge32n	%g4,	%g3,	%l1
loop_1768:
	array8	%i4,	%i5,	%i0
	movrlez	%i3,	0x3D2,	%l4
loop_1769:
	st	%f10,	[%l7 + 0x28]
	fmovdcc	%xcc,	%f4,	%f31
	sub	%o2,	%i6,	%o5
	edge16	%l5,	%o6,	%o4
	fbe,a	%fcc3,	loop_1770
	fmovrsne	%o0,	%f1,	%f5
	movge	%xcc,	%i1,	%l0
	membar	0x53
loop_1770:
	ta	%icc,	0x4
	move	%xcc,	%g2,	%o7
	srax	%i7,	%l6,	%g1
	sllx	%o3,	%l2,	%l3
	fcmps	%fcc3,	%f15,	%f9
	edge32n	%o1,	%g6,	%i2
	srax	%g7,	%g4,	%g5
	movrlz	%g3,	%i4,	%l1
	edge16n	%i0,	%i3,	%l4
	xorcc	%o2,	%i6,	%o5
	fcmpes	%fcc3,	%f25,	%f5
	tvc	%xcc,	0x7
	fbge	%fcc2,	loop_1771
	movre	%i5,	%o6,	%o4
	edge32	%l5,	%i1,	%l0
	taddcctv	%g2,	0x04ED,	%o7
loop_1771:
	fcmpes	%fcc3,	%f27,	%f0
	edge16n	%i7,	%o0,	%l6
	set	0x1A, %g7
	ldsba	[%l7 + %g7] 0x80,	%g1
	wr	%g0,	0x1e,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
	fmovrde	%l2,	%f30,	%f14
	tneg	%icc,	0x1
	tsubcc	%l3,	0x0BB6,	%o3
	fcmpes	%fcc3,	%f9,	%f5
	ba	loop_1772
	tle	%icc,	0x0
	set	0x58, %l6
	stwa	%g6,	[%l7 + %l6] 0x19
loop_1772:
	tsubcc	%i2,	0x0A83,	%o1
	fornot2	%f14,	%f20,	%f12
	tvs	%xcc,	0x2
	edge8l	%g4,	%g5,	%g7
	ldd	[%l7 + 0x08],	%g2
	fblg,a	%fcc0,	loop_1773
	tcs	%icc,	0x2
	tgu	%xcc,	0x5
	array32	%l1,	%i4,	%i3
loop_1773:
	array16	%l4,	%o2,	%i0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sir	0x02C1
	fbu	%fcc3,	loop_1774
	lduh	[%l7 + 0x16],	%i6
	wr	%g0,	0x81,	%asi
	prefetcha	[%l7 + 0x10] %asi,	 0x3
loop_1774:
	orcc	%i5,	0x153A,	%o4
	fones	%f16
	array32	%o6,	%l5,	%i1
	tleu	%icc,	0x1
	umul	%l0,	%g2,	%i7
	movle	%xcc,	%o7,	%o0
	xnorcc	%g1,	0x187C,	%l6
	fands	%f25,	%f26,	%f1
	fandnot1	%f12,	%f12,	%f16
	udiv	%l3,	0x14B0,	%l2
	fcmpd	%fcc1,	%f18,	%f20
	subccc	%o3,	0x0B64,	%g6
	wr	%g0,	0x04,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	smulcc	%i2,	0x1E40,	%g4
	brlez	%o1,	loop_1775
	bneg,a,pt	%icc,	loop_1776
	prefetch	[%l7 + 0x6C],	 0x3
	tvc	%icc,	0x5
loop_1775:
	smulcc	%g7,	%g5,	%l1
loop_1776:
	edge16ln	%i4,	%i3,	%l4
	bg,pt	%icc,	loop_1777
	addc	%o2,	%i0,	%i6
	ba,a,pn	%xcc,	loop_1778
	movvs	%xcc,	%g3,	%o5
loop_1777:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	brgz,a	%o4,	loop_1779
loop_1778:
	prefetch	[%l7 + 0x38],	 0x2
	andcc	%o6,	0x16FA,	%i5
	movvs	%icc,	%l5,	%l0
loop_1779:
	fmovsgu	%icc,	%f6,	%f30
	xorcc	%g2,	0x1549,	%i7
	tleu	%xcc,	0x6
	bshuffle	%f22,	%f20,	%f0
	fmovde	%xcc,	%f11,	%f24
	fbul,a	%fcc0,	loop_1780
	fbe,a	%fcc1,	loop_1781
	fbue	%fcc0,	loop_1782
	movpos	%xcc,	%o7,	%o0
loop_1780:
	fmovrdgez	%g1,	%f20,	%f20
loop_1781:
	andncc	%i1,	%l3,	%l6
loop_1782:
	fbuge	%fcc3,	loop_1783
	edge32n	%o3,	%g6,	%i2
	fpmerge	%f28,	%f21,	%f16
	bcs,a,pt	%icc,	loop_1784
loop_1783:
	srl	%g4,	%l2,	%o1
	wr	%g0,	0x04,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
loop_1784:
	sir	0x1E77
	edge32ln	%g7,	%l1,	%i4
	fand	%f0,	%f26,	%f4
	fmovrdgez	%g5,	%f4,	%f2
	sllx	%i3,	0x0A,	%o2
	fpackfix	%f20,	%f9
	alignaddr	%l4,	%i6,	%g3
	sdivx	%i0,	0x0429,	%o4
	movn	%xcc,	%o5,	%i5
	addcc	%o6,	0x1EC7,	%l5
	movne	%xcc,	%g2,	%i7
	edge8l	%o7,	%o0,	%g1
	andcc	%i1,	%l3,	%l0
	addccc	%o3,	%l6,	%g6
	fmovrslz	%i2,	%f5,	%f22
	bvs,a,pt	%xcc,	loop_1785
	srl	%g4,	%o1,	%l2
	bl,pn	%xcc,	loop_1786
	sll	%g7,	%l1,	%i4
loop_1785:
	edge8n	%i3,	%g5,	%o2
	movneg	%icc,	%i6,	%g3
loop_1786:
	movneg	%xcc,	%l4,	%o4
	movrgez	%o5,	0x023,	%i5
	flush	%l7 + 0x0C
	set	0x16, %o2
	ldsba	[%l7 + %o2] 0x81,	%i0
	fmovdneg	%icc,	%f2,	%f7
	bleu,a,pn	%icc,	loop_1787
	tsubcc	%l5,	0x1939,	%o6
	fxnors	%f21,	%f9,	%f28
	edge8l	%i7,	%g2,	%o7
loop_1787:
	movrgez	%g1,	%o0,	%l3
	popc	%l0,	%i1
	fmovrdgez	%o3,	%f8,	%f16
	edge32n	%g6,	%i2,	%g4
	bgu,a,pt	%xcc,	loop_1788
	array8	%o1,	%l2,	%l6
	fbne,a	%fcc2,	loop_1789
	tleu	%icc,	0x3
loop_1788:
	fmovdpos	%xcc,	%f13,	%f19
	xorcc	%l1,	0x02EF,	%i4
loop_1789:
	sub	%i3,	%g7,	%o2
	add	%g5,	0x18FB,	%g3
	wr	%g0,	0x80,	%asi
	lduha	[%l7 + 0x6E] %asi,	%l4
	movneg	%xcc,	%i6,	%o5
	brlez	%i5,	loop_1790
	srlx	%o4,	%i0,	%o6
	fbg,a	%fcc2,	loop_1791
	tcs	%xcc,	0x5
loop_1790:
	movgu	%xcc,	%i7,	%g2
	umulcc	%l5,	%g1,	%o0
loop_1791:
	edge32	%o7,	%l0,	%i1
	fnors	%f18,	%f29,	%f0
	edge16n	%l3,	%g6,	%o3
	set	0x30, %g1
	sta	%f29,	[%l7 + %g1] 0x89
	addcc	%g4,	%i2,	%l2
	andn	%o1,	%l6,	%i4
	movvs	%xcc,	%i3,	%l1
	fmovdne	%xcc,	%f15,	%f3
	ta	%xcc,	0x6
	call	loop_1792
	tl	%xcc,	0x0
	movcs	%xcc,	%g7,	%o2
	fmul8ulx16	%f26,	%f6,	%f16
loop_1792:
	andncc	%g3,	%g5,	%i6
	tpos	%icc,	0x0
	tpos	%xcc,	0x1
	bneg	%icc,	loop_1793
	tge	%xcc,	0x0
	xnorcc	%o5,	0x14C8,	%i5
	xor	%o4,	%i0,	%l4
loop_1793:
	fmovrdne	%i7,	%f28,	%f0
	tsubcc	%o6,	%l5,	%g2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	swap	[%l7 + 0x44],	%o0
	xnorcc	%g1,	%o7,	%i1
	bn,a,pn	%xcc,	loop_1794
	sdivcc	%l3,	0x1E94,	%l0
	add	%l7,	0x0C,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%o3
	casa	[%l6] %asi,	%o3,	%g6
loop_1794:
	nop
	wr	%g0,	0x89,	%asi
	lduba	[%l7 + 0x5D] %asi,	%i2
	fabsd	%f8,	%f24
	andn	%l2,	0x0AD1,	%o1
	sdivcc	%g4,	0x0800,	%l6
	mulx	%i3,	%l1,	%g7
	nop
	setx	loop_1795,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tsubcctv	%o2,	%i4,	%g3
	add	%g5,	%o5,	%i5
	xor	%i6,	%o4,	%l4
loop_1795:
	sdivcc	%i0,	0x098A,	%o6
	for	%f12,	%f24,	%f2
	tneg	%icc,	0x2
	addcc	%i7,	0x0EC4,	%l5
	movcs	%xcc,	%g2,	%o0
	ldsh	[%l7 + 0x0C],	%o7
	set	0x30, %o6
	lda	[%l7 + %o6] 0x88,	%f8
	addccc	%g1,	%l3,	%i1
	taddcctv	%o3,	%l0,	%g6
	bgu,pt	%xcc,	loop_1796
	edge32	%i2,	%l2,	%o1
	xor	%l6,	%i3,	%g4
	tge	%icc,	0x7
loop_1796:
	edge16	%l1,	%o2,	%i4
	fmovrdlz	%g3,	%f24,	%f0
	fbne,a	%fcc3,	loop_1797
	fmovscc	%icc,	%f2,	%f0
	taddcc	%g5,	%o5,	%i5
	tpos	%icc,	0x4
loop_1797:
	nop
	setx loop_1798, %l0, %l1
	jmpl %l1, %g7
	fpsub16s	%f3,	%f16,	%f10
	taddcctv	%i6,	0x0B36,	%l4
	fble,a	%fcc0,	loop_1799
loop_1798:
	ldd	[%l7 + 0x10],	%i0
	ldd	[%l7 + 0x48],	%o6
	add	%l7,	0x4C,	%l6
	wr	%g0,	0x10,	%asi
	lda	[%l6] %asi,	%i7
	casa	[%l6] %asi,	%i7,	%o4
loop_1799:
	fandnot1s	%f23,	%f22,	%f13
	fands	%f7,	%f24,	%f9
	tpos	%xcc,	0x1
	fandnot2s	%f4,	%f13,	%f3
	wr	%g0,	0x0c,	%asi
	ldswa	[%l7 + 0x40] %asi,	%g2
	membar	0x55
	ldsw	[%l7 + 0x6C],	%l5
	andn	%o0,	0x027E,	%o7
	tcs	%icc,	0x2
	fbul,a	%fcc1,	loop_1800
	fmovsneg	%xcc,	%f21,	%f20
	movvc	%icc,	%g1,	%i1
	fmovrdgz	%o3,	%f14,	%f26
loop_1800:
	sethi	0x1887,	%l0
	movgu	%xcc,	%l3,	%i2
	tg	%xcc,	0x2
	tleu	%icc,	0x3
	orn	%g6,	0x18B9,	%l2
	fmovrsne	%o1,	%f14,	%f27
	fnor	%f30,	%f18,	%f10
	subcc	%l6,	%i3,	%g4
	mova	%icc,	%l1,	%o2
	tge	%icc,	0x1
	fmovrdgz	%i4,	%f10,	%f2
	ba,a,pn	%icc,	loop_1801
	movrlz	%g3,	%g5,	%i5
	movg	%icc,	%g7,	%i6
	fbul	%fcc2,	loop_1802
loop_1801:
	fnot2s	%f31,	%f14
	fmovsn	%icc,	%f18,	%f11
	bneg,a,pn	%icc,	loop_1803
loop_1802:
	tl	%xcc,	0x5
	fnot1	%f18,	%f20
	orncc	%l4,	%i0,	%o5
loop_1803:
	fnot1s	%f7,	%f29
	lduh	[%l7 + 0x14],	%i7
	edge32	%o6,	%o4,	%l5
	tn	%icc,	0x7
	set	0x3C, %i1
	swapa	[%l7 + %i1] 0x10,	%o0
	fcmpd	%fcc1,	%f26,	%f18
	fmul8sux16	%f26,	%f6,	%f14
	movne	%xcc,	%g2,	%o7
	fcmpgt32	%f16,	%f16,	%i1
	umul	%g1,	0x1AA1,	%l0
	addccc	%l3,	0x1E87,	%o3
	set	0x48, %l2
	lda	[%l7 + %l2] 0x10,	%f4
	udivx	%i2,	0x0C92,	%g6
	orn	%o1,	%l2,	%l6
	edge8	%i3,	%l1,	%g4
	tcs	%icc,	0x3
	fpsub32	%f14,	%f12,	%f12
	nop
	set	0x7C, %i2
	prefetch	[%l7 + %i2],	 0x0
	alignaddrl	%o2,	%i4,	%g5
	fabsd	%f26,	%f4
	edge8ln	%g3,	%g7,	%i6
	tg	%icc,	0x6
	fandnot1	%f18,	%f0,	%f4
	movre	%l4,	0x2AC,	%i0
	tg	%icc,	0x4
	sllx	%i5,	0x10,	%i7
	fmovde	%icc,	%f29,	%f13
	array8	%o6,	%o4,	%l5
	fpsub32	%f8,	%f28,	%f10
	fones	%f23
	or	%o0,	0x0378,	%g2
	tleu	%xcc,	0x5
	nop
	set	0x5E, %l3
	sth	%o7,	[%l7 + %l3]
	fsrc2	%f18,	%f8
	tgu	%icc,	0x5
	udivx	%i1,	0x00E7,	%o5
	orn	%l0,	%l3,	%o3
	stw	%i2,	[%l7 + 0x0C]
	xnor	%g6,	0x1013,	%o1
	movl	%xcc,	%g1,	%l2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addccc	%l6,	%l1,	%g4
	mova	%icc,	%o2,	%i4
	prefetch	[%l7 + 0x4C],	 0x0
	popc	%g5,	%i3
	fnot1s	%f3,	%f23
	fmovrsgz	%g7,	%f1,	%f12
	sir	0x1B00
	edge16ln	%i6,	%g3,	%i0
	fmovdge	%xcc,	%f30,	%f26
	movrgez	%l4,	%i7,	%i5
	set	0x44, %i5
	lda	[%l7 + %i5] 0x10,	%f25
	fmovsge	%xcc,	%f22,	%f4
	add	%l7,	0x74,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%o6
	casa	[%l6] %asi,	%o6,	%l5
	movcs	%xcc,	%o0,	%o4
	set	0x22, %i6
	ldsba	[%l7 + %i6] 0x10,	%o7
	taddcc	%i1,	%o5,	%l0
	addcc	%g2,	0x00E9,	%o3
	tne	%xcc,	0x2
	edge8ln	%i2,	%l3,	%g6
	set	0x40, %l0
	stda	%f0,	[%l7 + %l0] 0x18
	te	%xcc,	0x6
	set	0x40, %o5
	stda	%f16,	[%l7 + %o5] 0x89
	bn,a	%icc,	loop_1804
	edge16n	%o1,	%g1,	%l2
	tleu	%xcc,	0x2
	movn	%icc,	%l1,	%g4
loop_1804:
	bcs,a	%xcc,	loop_1805
	fabsd	%f4,	%f10
	fornot2s	%f9,	%f2,	%f22
	andn	%l6,	0x0A17,	%o2
loop_1805:
	smul	%g5,	0x1ED9,	%i4
	edge8	%i3,	%g7,	%i6
	bn,a	loop_1806
	swap	[%l7 + 0x38],	%g3
	set	0x78, %l1
	prefetcha	[%l7 + %l1] 0x04,	 0x3
loop_1806:
	bpos,a	%xcc,	loop_1807
	add	%l4,	%i7,	%i5
	movrgz	%l5,	0x3E4,	%o0
	movleu	%xcc,	%o4,	%o7
loop_1807:
	alignaddrl	%i1,	%o6,	%l0
	ldsw	[%l7 + 0x30],	%o5
	bvs,pt	%xcc,	loop_1808
	brlz,a	%g2,	loop_1809
	fmovsn	%icc,	%f26,	%f10
	fmovdn	%xcc,	%f29,	%f27
loop_1808:
	sir	0x1B2E
loop_1809:
	xor	%o3,	%i2,	%g6
	edge8n	%l3,	%g1,	%o1
	fmovsleu	%icc,	%f10,	%f17
	edge16	%l1,	%l2,	%l6
	edge16n	%g4,	%o2,	%i4
	sll	%i3,	%g5,	%i6
	fbe,a	%fcc1,	loop_1810
	edge16l	%g3,	%i0,	%g7
	brz	%i7,	loop_1811
	fmovrse	%l4,	%f4,	%f12
loop_1810:
	edge32l	%l5,	%o0,	%i5
	ldx	[%l7 + 0x78],	%o7
loop_1811:
	tsubcc	%o4,	0x00EB,	%o6
	fmovd	%f16,	%f2
	fmovsle	%xcc,	%f26,	%f2
	movrgez	%l0,	0x36D,	%i1
	ta	%xcc,	0x3
	sdivx	%o5,	0x073A,	%o3
	movne	%xcc,	%g2,	%i2
	stbar
	edge32ln	%l3,	%g1,	%o1
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
	fcmple32	%f12,	%f22,	%l1
	tpos	%icc,	0x0
	movle	%icc,	%l2,	%g6
loop_1812:
	nop
	set	0x4D, %l5
	ldstuba	[%l7 + %l5] 0x80,	%l6
	addccc	%g4,	%o2,	%i3
	movcc	%icc,	%g5,	%i4
	brlz	%i6,	loop_1813
	mova	%xcc,	%i0,	%g7
	subccc	%i7,	0x0696,	%l4
	tleu	%icc,	0x0
loop_1813:
	nop
	wr	%g0,	0xeb,	%asi
	stha	%l5,	[%l7 + 0x5E] %asi
	membar	#Sync
	andncc	%o0,	%g3,	%o7
	set	0x28, %o0
	lduha	[%l7 + %o0] 0x80,	%o4
	alignaddr	%o6,	%l0,	%i1
	fbuge,a	%fcc3,	loop_1814
	movvc	%icc,	%i5,	%o5
	fmovdge	%icc,	%f2,	%f10
	set	0x58, %o4
	sta	%f4,	[%l7 + %o4] 0x80
loop_1814:
	tneg	%icc,	0x6
	move	%icc,	%o3,	%i2
	movge	%xcc,	%l3,	%g1
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
	andncc	%g2,	%l1,	%o1
	fmovrslez	%l2,	%f2,	%f2
	sra	%g6,	0x01,	%l6
loop_1815:
	fbe	%fcc3,	loop_1816
	fbn,a	%fcc0,	loop_1817
	fmovrdlz	%o2,	%f22,	%f28
	membar	0x01
loop_1816:
	sllx	%g4,	%i3,	%g5
loop_1817:
	smulcc	%i4,	0x0D88,	%i0
	subc	%g7,	%i7,	%i6
	fmovscs	%xcc,	%f24,	%f23
	orcc	%l5,	0x1549,	%o0
	ble,a	%icc,	loop_1818
	sth	%g3,	[%l7 + 0x70]
	membar	0x66
	fcmpne32	%f28,	%f16,	%l4
loop_1818:
	xnorcc	%o4,	0x12F4,	%o7
	tgu	%icc,	0x6
	stw	%o6,	[%l7 + 0x5C]
	membar	0x58
	tleu	%icc,	0x5
	udivx	%l0,	0x1A63,	%i1
	edge16l	%i5,	%o3,	%i2
	sdiv	%l3,	0x091F,	%g1
	wr	%g0,	0x89,	%asi
	prefetcha	[%l7 + 0x28] %asi,	 0x3
	fbn,a	%fcc3,	loop_1819
	andncc	%l1,	%o5,	%o1
	orcc	%g6,	0x07ED,	%l6
	fmovd	%f28,	%f26
loop_1819:
	nop
	set	0x5A, %i0
	ldsba	[%l7 + %i0] 0x11,	%l2
	bshuffle	%f4,	%f0,	%f20
	movrgz	%o2,	0x15E,	%g4
	sdivcc	%g5,	0x1352,	%i3
	orn	%i4,	%g7,	%i7
	tvs	%icc,	0x1
	sethi	0x1127,	%i0
	movleu	%xcc,	%l5,	%o0
	sdivcc	%i6,	0x06AF,	%g3
	fmovrslz	%o4,	%f2,	%f6
	wr	%g0,	0x04,	%asi
	lduba	[%l7 + 0x53] %asi,	%l4
	fsrc2s	%f30,	%f23
	tle	%xcc,	0x1
	srlx	%o6,	%l0,	%i1
	bleu,a,pt	%icc,	loop_1820
	fpack32	%f26,	%f28,	%f22
	array8	%i5,	%o7,	%i2
	and	%o3,	%l3,	%g1
loop_1820:
	fpadd32s	%f11,	%f19,	%f16
	bn,pt	%xcc,	loop_1821
	bvc,pt	%xcc,	loop_1822
	tg	%xcc,	0x1
	mulscc	%l1,	0x1170,	%g2
loop_1821:
	edge16n	%o1,	%o5,	%g6
loop_1822:
	fpadd16	%f24,	%f16,	%f30
	set	0x2E, %g2
	lduba	[%l7 + %g2] 0x18,	%l6
	set	0x38, %o7
	ldstuba	[%l7 + %o7] 0x88,	%l2
	tleu	%xcc,	0x3
	fbule,a	%fcc2,	loop_1823
	fbuge	%fcc1,	loop_1824
	udiv	%g4,	0x0CCF,	%g5
	tvs	%icc,	0x3
loop_1823:
	alignaddr	%i3,	%o2,	%g7
loop_1824:
	fbne,a	%fcc0,	loop_1825
	tne	%xcc,	0x7
	wr	%g0,	0x89,	%asi
	stha	%i4,	[%l7 + 0x72] %asi
loop_1825:
	flush	%l7 + 0x78
	fnand	%f20,	%f0,	%f0
	movleu	%icc,	%i0,	%l5
	movpos	%xcc,	%i7,	%o0
	fblg,a	%fcc0,	loop_1826
	fmovrse	%i6,	%f8,	%f14
	tleu	%xcc,	0x7
	fcmpgt16	%f28,	%f20,	%o4
loop_1826:
	udivcc	%g3,	0x1B95,	%o6
	fandnot1	%f0,	%f6,	%f4
	fxors	%f7,	%f0,	%f10
	tl	%xcc,	0x1
	umulcc	%l0,	0x089E,	%i1
	ba,pn	%xcc,	loop_1827
	fornot2	%f10,	%f8,	%f2
	ldx	[%l7 + 0x10],	%i5
	wr	%g0,	0x80,	%asi
	ldswa	[%l7 + 0x7C] %asi,	%l4
loop_1827:
	nop
	wr	%g0,	0xea,	%asi
	stda	%i2,	[%l7 + 0x68] %asi
	membar	#Sync
	fcmps	%fcc3,	%f13,	%f6
	fmovsn	%xcc,	%f2,	%f1
	fornot1	%f4,	%f6,	%f8
	xorcc	%o7,	0x0CF2,	%o3
	array32	%g1,	%l1,	%g2
	bneg	loop_1828
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tsubcc	%l3,	%o1,	%g6
	stb	%o5,	[%l7 + 0x25]
loop_1828:
	fmovdneg	%xcc,	%f12,	%f3
	fbug,a	%fcc3,	loop_1829
	movle	%icc,	%l6,	%g4
	st	%f14,	[%l7 + 0x4C]
	andn	%l2,	0x1CFB,	%i3
loop_1829:
	taddcc	%o2,	%g7,	%i4
	ba,a,pn	%xcc,	loop_1830
	fcmpeq32	%f22,	%f20,	%g5
	add	%l5,	%i0,	%i7
	fnot2	%f18,	%f6
loop_1830:
	fmovrdlz	%i6,	%f8,	%f10
	fbo,a	%fcc3,	loop_1831
	fcmpd	%fcc3,	%f22,	%f12
	fnands	%f8,	%f12,	%f3
	mulx	%o4,	0x1E80,	%o0
loop_1831:
	movrgez	%o6,	0x3CE,	%l0
	sub	%i1,	%i5,	%l4
	array32	%i2,	%o7,	%o3
	fandnot1	%f22,	%f26,	%f26
	movrne	%g3,	%g1,	%g2
	udivcc	%l1,	0x12AF,	%o1
	tneg	%icc,	0x5
	xor	%l3,	0x05B0,	%o5
	fmovsgu	%xcc,	%f6,	%f21
	array16	%l6,	%g4,	%l2
	edge8ln	%i3,	%o2,	%g6
	umulcc	%g7,	0x1224,	%i4
	sethi	0x1F4B,	%l5
	fpack32	%f30,	%f30,	%f14
	xor	%i0,	0x111A,	%g5
	wr	%g0,	0x0c,	%asi
	swapa	[%l7 + 0x28] %asi,	%i7
	bleu	loop_1832
	tgu	%icc,	0x2
	movneg	%xcc,	%o4,	%o0
	movrlz	%o6,	0x1F6,	%i6
loop_1832:
	edge8ln	%l0,	%i5,	%i1
	fmovrdgz	%i2,	%f28,	%f24
	set	0x44, %i4
	sta	%f6,	[%l7 + %i4] 0x11
	fones	%f1
	ldd	[%l7 + 0x48],	%f22
	fbu	%fcc3,	loop_1833
	bvs,pt	%icc,	loop_1834
	move	%xcc,	%l4,	%o3
	edge16ln	%g3,	%o7,	%g1
loop_1833:
	fmovdcc	%icc,	%f0,	%f19
loop_1834:
	sdivx	%g2,	0x04F4,	%o1
	edge32	%l1,	%l3,	%l6
	array8	%o5,	%l2,	%g4
	andn	%i3,	%g6,	%g7
	fnor	%f8,	%f30,	%f4
	movneg	%icc,	%o2,	%l5
	bl,a,pn	%icc,	loop_1835
	be,pn	%xcc,	loop_1836
	brgez,a	%i4,	loop_1837
	array16	%g5,	%i7,	%o4
loop_1835:
	xorcc	%i0,	0x00B4,	%o0
loop_1836:
	te	%xcc,	0x7
loop_1837:
	movrlez	%o6,	0x282,	%l0
	orcc	%i6,	%i1,	%i2
	fandnot1	%f22,	%f26,	%f16
	wr	%g0,	0x88,	%asi
	stwa	%i5,	[%l7 + 0x44] %asi
	sra	%l4,	0x02,	%g3
	for	%f8,	%f0,	%f28
	popc	%o3,	%g1
	movvc	%icc,	%g2,	%o1
	fbl,a	%fcc2,	loop_1838
	fpadd16	%f14,	%f28,	%f8
	array16	%l1,	%l3,	%l6
	nop
	set	0x12, %o3
	sth	%o7,	[%l7 + %o3]
loop_1838:
	movpos	%icc,	%o5,	%l2
	fbule	%fcc2,	loop_1839
	movrgz	%g4,	%i3,	%g7
	wr	%g0,	0x10,	%asi
	prefetcha	[%l7 + 0x70] %asi,	 0x0
loop_1839:
	movrne	%o2,	0x3B6,	%i4
	set	0x40, %g3
	ldda	[%l7 + %g3] 0x0c,	%f0
	tcc	%icc,	0x3
	bneg,a	%icc,	loop_1840
	tvc	%xcc,	0x0
	udiv	%g5,	0x13A2,	%l5
	set	0x68, %l4
	ldxa	[%l7 + %l4] 0x04,	%o4
loop_1840:
	fbuge	%fcc3,	loop_1841
	edge8l	%i7,	%i0,	%o0
	fcmpeq32	%f16,	%f8,	%l0
	movleu	%icc,	%o6,	%i6
loop_1841:
	tsubcc	%i2,	%i1,	%i5
	fpsub32	%f8,	%f20,	%f26
	edge8ln	%g3,	%l4,	%g1
	fmovs	%f23,	%f7
	orncc	%g2,	0x152D,	%o1
	tvs	%xcc,	0x2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldub	[%l7 + 0x43],	%o3
	ble,a	loop_1842
	fsrc2s	%f22,	%f19
	fnors	%f28,	%f6,	%f21
	set	0x38, %g4
	stxa	%l1,	[%g0 + %g4] 0x20
loop_1842:
	subc	%l3,	0x17E3,	%o7
	alignaddr	%l6,	%o5,	%l2
	xor	%g4,	0x1B39,	%i3
	tpos	%icc,	0x0
	fornot1	%f14,	%f14,	%f28
	wr	%g0,	0x23,	%asi
	stwa	%g7,	[%l7 + 0x08] %asi
	membar	#Sync
	xnorcc	%o2,	0x1314,	%g6
	fbue,a	%fcc1,	loop_1843
	fnegs	%f13,	%f0
	bge	%icc,	loop_1844
	srlx	%g5,	0x03,	%i4
loop_1843:
	fbule,a	%fcc3,	loop_1845
	membar	0x4C
loop_1844:
	ldsb	[%l7 + 0x44],	%o4
	fmovdpos	%xcc,	%f21,	%f14
loop_1845:
	te	%icc,	0x3
	set	0x26, %o1
	lduha	[%l7 + %o1] 0x18,	%i7
	prefetch	[%l7 + 0x18],	 0x0
	sra	%i0,	%o0,	%l0
	fmovdvc	%xcc,	%f2,	%f19
	sethi	0x1D45,	%o6
	set	0x38, %g5
	ldsha	[%l7 + %g5] 0x0c,	%i6
	movrgez	%l5,	0x31D,	%i1
	edge32	%i2,	%g3,	%i5
	fmovrde	%g1,	%f16,	%f0
	ldub	[%l7 + 0x12],	%l4
	array32	%g2,	%o3,	%o1
	fbue	%fcc0,	loop_1846
	addccc	%l1,	0x0F97,	%l3
	fnor	%f0,	%f24,	%f30
	fzeros	%f30
loop_1846:
	nop
	wr	%g0,	0x88,	%asi
	lduba	[%l7 + 0x71] %asi,	%o7
	movvc	%xcc,	%l6,	%l2
	fcmpd	%fcc1,	%f6,	%f12
	edge8ln	%g4,	%o5,	%g7
	add	%l7,	0x28,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%i3
	casxa	[%l6] %asi,	%i3,	%o2
	array32	%g5,	%i4,	%o4
	tsubcc	%g6,	0x1165,	%i0
	fbul	%fcc0,	loop_1847
	fxor	%f2,	%f2,	%f20
	or	%i7,	%o0,	%o6
	movle	%icc,	%i6,	%l0
loop_1847:
	fpadd16	%f4,	%f8,	%f30
	alignaddr	%l5,	%i2,	%i1
	tgu	%xcc,	0x5
	movge	%xcc,	%g3,	%g1
	tpos	%xcc,	0x6
	siam	0x3
	movcs	%icc,	%i5,	%l4
	tsubcctv	%o3,	%g2,	%l1
	std	%o0,	[%l7 + 0x08]
	set	0x46, %i3
	stha	%o7,	[%l7 + %i3] 0x2b
	membar	#Sync
	fandnot2	%f2,	%f14,	%f12
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sll	%l3,	0x1C,	%l2
	udiv	%g4,	0x09AE,	%o5
	tvc	%icc,	0x1
	array32	%g7,	%l6,	%i3
	bn,a,pn	%xcc,	loop_1848
	ldub	[%l7 + 0x2C],	%g5
	lduh	[%l7 + 0x34],	%i4
	tsubcc	%o4,	%g6,	%o2
loop_1848:
	siam	0x1
	umulcc	%i0,	%i7,	%o0
	smul	%o6,	0x0D44,	%l0
	popc	%l5,	%i2
	ta	%xcc,	0x0
	movcs	%xcc,	%i1,	%g3
	movcc	%xcc,	%i6,	%i5
	brgez,a	%g1,	loop_1849
	membar	0x0D
	and	%l4,	%g2,	%l1
	mulx	%o1,	%o7,	%l3
loop_1849:
	taddcctv	%o3,	%l2,	%o5
	fmul8x16	%f2,	%f2,	%f0
	srl	%g4,	%l6,	%g7
	orcc	%g5,	0x1625,	%i4
	fble	%fcc2,	loop_1850
	ldsh	[%l7 + 0x36],	%i3
	udivx	%o4,	0x141C,	%g6
	edge16ln	%i0,	%o2,	%i7
loop_1850:
	nop
	wr	%g0,	0xf1,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
	wr	%g0,	0x80,	%asi
	stxa	%o6,	[%l7 + 0x30] %asi
	swap	[%l7 + 0x38],	%o0
	stb	%l5,	[%l7 + 0x0B]
	edge16l	%i2,	%i1,	%l0
	andncc	%i6,	%i5,	%g1
	andcc	%l4,	%g2,	%g3
	fxnors	%f27,	%f6,	%f8
	ba,pt	%icc,	loop_1851
	fblg,a	%fcc1,	loop_1852
	fbue	%fcc2,	loop_1853
	ldx	[%l7 + 0x30],	%o1
loop_1851:
	alignaddrl	%l1,	%l3,	%o7
loop_1852:
	sdivx	%o3,	0x0668,	%o5
loop_1853:
	andcc	%l2,	%g4,	%l6
	movneg	%icc,	%g5,	%i4
	fmuld8sux16	%f24,	%f23,	%f0
	wr	%g0,	0x11,	%asi
	lda	[%l7 + 0x44] %asi,	%f21
	prefetch	[%l7 + 0x48],	 0x2
	andn	%i3,	%o4,	%g6
	movrlez	%g7,	%i0,	%o2
	orcc	%i7,	0x1A66,	%o0
	addc	%l5,	%i2,	%o6
	orncc	%i1,	%i6,	%i5
	fandnot2s	%f17,	%f21,	%f16
	or	%g1,	0x1834,	%l0
	movle	%icc,	%l4,	%g3
	brnz,a	%o1,	loop_1854
	brlez	%g2,	loop_1855
	sra	%l1,	%o7,	%l3
	tgu	%xcc,	0x7
loop_1854:
	movpos	%xcc,	%o3,	%l2
loop_1855:
	orn	%o5,	0x12D7,	%l6
	bl	%xcc,	loop_1856
	fmovd	%f24,	%f0
	array8	%g5,	%i4,	%g4
	edge16n	%i3,	%o4,	%g7
loop_1856:
	bl,pn	%xcc,	loop_1857
	movl	%xcc,	%i0,	%o2
	fbge,a	%fcc3,	loop_1858
	umul	%i7,	%o0,	%g6
loop_1857:
	ta	%xcc,	0x7
	fbl	%fcc0,	loop_1859
loop_1858:
	movge	%xcc,	%l5,	%i2
	fcmple32	%f26,	%f10,	%o6
	tvs	%xcc,	0x4
loop_1859:
	ldsw	[%l7 + 0x54],	%i6
	movpos	%xcc,	%i5,	%i1
	tge	%icc,	0x0
	fnegd	%f18,	%f26
	fones	%f5
	movvc	%xcc,	%g1,	%l0
	sub	%l4,	%g3,	%o1
	fandnot1	%f0,	%f30,	%f30
	tn	%icc,	0x6
	xnor	%l1,	0x1496,	%g2
	fexpand	%f24,	%f12
	smulcc	%l3,	%o3,	%l2
	wr	%g0,	0x81,	%asi
	ldstuba	[%l7 + 0x08] %asi,	%o5
	fbug,a	%fcc1,	loop_1860
	nop
	setx	loop_1861,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	addc	%o7,	%g5,	%l6
	fpadd16s	%f17,	%f26,	%f7
loop_1860:
	movpos	%icc,	%g4,	%i3
loop_1861:
	tge	%xcc,	0x5
	wr	%g0,	0xea,	%asi
	stda	%i4,	[%l7 + 0x40] %asi
	membar	#Sync
	brgz,a	%o4,	loop_1862
	fcmple32	%f22,	%f8,	%g7
	brnz,a	%o2,	loop_1863
	srl	%i7,	0x07,	%i0
loop_1862:
	brz,a	%g6,	loop_1864
	tle	%xcc,	0x1
loop_1863:
	srlx	%o0,	%i2,	%l5
	bl	%xcc,	loop_1865
loop_1864:
	fmovsneg	%xcc,	%f11,	%f11
	andn	%i6,	%i5,	%o6
	wr	%g0,	0x0c,	%asi
	swapa	[%l7 + 0x24] %asi,	%i1
loop_1865:
	nop
	set	0x30, %i7
	ldd	[%l7 + %i7],	%f20
	sra	%l0,	%l4,	%g1
	sll	%g3,	%l1,	%o1
	bg,a,pn	%xcc,	loop_1866
	ldsb	[%l7 + 0x35],	%l3
	std	%o2,	[%l7 + 0x18]
	tne	%icc,	0x5
loop_1866:
	fmovdl	%xcc,	%f27,	%f29
	xnor	%l2,	0x18EB,	%g2
	or	%o5,	0x15E1,	%o7
	fone	%f18
	movrgez	%g5,	%l6,	%g4
	tvs	%xcc,	0x5
	fmovdneg	%xcc,	%f7,	%f12
	umul	%i4,	0x1B45,	%i3
	mulx	%g7,	%o4,	%i7
	bg,a,pn	%icc,	loop_1867
	movpos	%xcc,	%o2,	%g6
	move	%xcc,	%i0,	%i2
	xorcc	%l5,	0x196A,	%o0
loop_1867:
	flush	%l7 + 0x28
	movle	%xcc,	%i5,	%o6
	tcs	%xcc,	0x3
	edge8n	%i6,	%i1,	%l0
	xnor	%g1,	0x0772,	%l4
	popc	0x1DB8,	%l1
	sll	%g3,	0x1C,	%o1
	fmovdcs	%xcc,	%f27,	%f27
	movcc	%xcc,	%o3,	%l2
	fmul8x16	%f17,	%f26,	%f20
	nop
	setx	loop_1868,	%l0,	%l1
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
	subcc	%l3,	0x11A2,	%o5
	fpadd16s	%f9,	%f13,	%f21
loop_1868:
	nop
	setx loop_1869, %l0, %l1
	jmpl %l1, %g2
	umulcc	%o7,	0x193E,	%g5
	alignaddr	%l6,	%i4,	%g4
	membar	0x58
loop_1869:
	edge32	%g7,	%i3,	%i7
	addccc	%o2,	%o4,	%g6
	std	%i0,	[%l7 + 0x40]
	movg	%xcc,	%l5,	%i2
	xorcc	%i5,	%o6,	%i6
	wr	%g0,	0xeb,	%asi
	stxa	%o0,	[%l7 + 0x28] %asi
	membar	#Sync
	move	%xcc,	%l0,	%g1
	edge32n	%l4,	%l1,	%g3
	stbar
	brgez,a	%o1,	loop_1870
	edge32ln	%o3,	%l2,	%i1
	movvc	%xcc,	%o5,	%g2
	stb	%l3,	[%l7 + 0x60]
loop_1870:
	subc	%o7,	0x08C8,	%l6
	fsrc2s	%f0,	%f28
	xnor	%g5,	0x173B,	%g4
	movrgez	%g7,	0x0FB,	%i4
	edge32ln	%i7,	%o2,	%o4
	smul	%i3,	0x06C5,	%i0
	ldub	[%l7 + 0x52],	%g6
	tg	%xcc,	0x4
	movne	%icc,	%i2,	%l5
	bcs,pt	%icc,	loop_1871
	fmovs	%f2,	%f28
	movrgz	%o6,	0x397,	%i6
	fnegs	%f6,	%f8
loop_1871:
	sllx	%i5,	0x0C,	%o0
	tvc	%xcc,	0x4
	tcs	%icc,	0x6
	sdivcc	%g1,	0x0536,	%l4
	xor	%l0,	0x009B,	%g3
	brlz	%l1,	loop_1872
	fbug	%fcc2,	loop_1873
	array32	%o1,	%o3,	%i1
	tge	%xcc,	0x0
loop_1872:
	fbug	%fcc0,	loop_1874
loop_1873:
	fmovdneg	%icc,	%f25,	%f10
	edge32l	%l2,	%g2,	%l3
	fmovspos	%icc,	%f1,	%f20
loop_1874:
	sllx	%o7,	0x15,	%l6
	fandnot1s	%f30,	%f2,	%f12
	fmovrdlez	%g5,	%f2,	%f18
	fnor	%f12,	%f18,	%f18
	ldstub	[%l7 + 0x41],	%g4
	add	%o5,	%g7,	%i4
	fmovsa	%xcc,	%f6,	%f26
	smul	%i7,	%o4,	%o2
	ba,a,pt	%xcc,	loop_1875
	sdivcc	%i0,	0x0F3D,	%i3
	bg	loop_1876
	orcc	%g6,	%l5,	%o6
loop_1875:
	fmovrsne	%i6,	%f26,	%f11
	tleu	%xcc,	0x3
loop_1876:
	xorcc	%i2,	0x144C,	%i5
	tneg	%xcc,	0x6
	wr	%g0,	0x89,	%asi
	prefetcha	[%l7 + 0x30] %asi,	 0x3
	fcmpgt32	%f16,	%f0,	%l4
	movvc	%xcc,	%l0,	%g1
	udiv	%g3,	0x134D,	%o1
	ldd	[%l7 + 0x40],	%l0
	ta	%icc,	0x2
	subcc	%i1,	0x1941,	%l2
	wr	%g0,	0x89,	%asi
	ldstuba	[%l7 + 0x2F] %asi,	%g2
	brgz,a	%o3,	loop_1877
	fble,a	%fcc3,	loop_1878
	brlz,a	%l3,	loop_1879
	fxnors	%f27,	%f10,	%f17
loop_1877:
	movre	%l6,	%o7,	%g5
loop_1878:
	fpsub16	%f6,	%f10,	%f0
loop_1879:
	srax	%o5,	%g7,	%g4
	umulcc	%i7,	0x02ED,	%i4
	add	%l7,	0x3C,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%o4,	%i0
	tge	%icc,	0x4
	fmovsvc	%xcc,	%f29,	%f2
	nop
	setx loop_1880, %l0, %l1
	jmpl %l1, %o2
	brgez	%i3,	loop_1881
	fmovdvc	%icc,	%f19,	%f16
	edge32	%l5,	%o6,	%g6
loop_1880:
	nop
	set	0x4F, %g7
	ldstuba	[%l7 + %g7] 0x0c,	%i2
loop_1881:
	udivx	%i6,	0x09E0,	%o0
	fmovdl	%xcc,	%f13,	%f14
	nop
	setx	loop_1882,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fpadd16	%f4,	%f10,	%f20
	edge8n	%l4,	%i5,	%g1
	add	%l7,	0x54,	%l6
	wr	%g0,	0x04,	%asi
	lda	[%l6] %asi,	%l0
	casa	[%l6] %asi,	%l0,	%o1
loop_1882:
	tg	%icc,	0x0
	te	%xcc,	0x6
	wr	%g0,	0x04,	%asi
	swapa	[%l7 + 0x74] %asi,	%g3
	stb	%i1,	[%l7 + 0x61]
	smul	%l2,	%g2,	%o3
	movleu	%xcc,	%l3,	%l1
	tne	%icc,	0x6
	addccc	%l6,	0x0AAE,	%o7
	mulx	%o5,	%g7,	%g5
	subc	%i7,	%i4,	%o4
	membar	#Sync
	wr	%g0,	0xf0,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	subccc	%g4,	%i0,	%o2
	bge,pt	%icc,	loop_1883
	movle	%xcc,	%l5,	%i3
	fmovrse	%g6,	%f5,	%f14
	ldsb	[%l7 + 0x4A],	%o6
loop_1883:
	udivx	%i6,	0x04B5,	%o0
	brgz	%i2,	loop_1884
	fmovrdgz	%l4,	%f22,	%f10
	fcmps	%fcc1,	%f8,	%f27
	movvs	%xcc,	%g1,	%i5
loop_1884:
	edge8ln	%o1,	%l0,	%g3
	tpos	%icc,	0x7
	fmovse	%xcc,	%f26,	%f20
	smul	%l2,	0x1721,	%i1
	movre	%g2,	%o3,	%l1
	sllx	%l3,	0x15,	%l6
	orcc	%o5,	%g7,	%o7
	sdivx	%g5,	0x0EF0,	%i7
	move	%icc,	%o4,	%i4
	fcmpne32	%f8,	%f14,	%g4
	brgz,a	%i0,	loop_1885
	brgz,a	%l5,	loop_1886
	fnors	%f20,	%f29,	%f31
	fmovrsgz	%o2,	%f24,	%f26
loop_1885:
	fmuld8sux16	%f7,	%f20,	%f12
loop_1886:
	edge16n	%i3,	%o6,	%g6
	fexpand	%f1,	%f18
	tcs	%icc,	0x5
	fnot1	%f10,	%f8
	fzero	%f12
	fornot2	%f10,	%f0,	%f6
	fmovdg	%icc,	%f30,	%f17
	umul	%o0,	0x1464,	%i6
	fnot2s	%f15,	%f5
	set	0x2C, %l6
	stha	%i2,	[%l7 + %l6] 0x2a
	membar	#Sync
	srlx	%l4,	%g1,	%o1
	movre	%i5,	0x2A4,	%l0
	movneg	%xcc,	%l2,	%g3
	alignaddrl	%i1,	%g2,	%o3
	fbuge,a	%fcc2,	loop_1887
	tcs	%xcc,	0x5
	bcs,a	loop_1888
	bge,a,pn	%xcc,	loop_1889
loop_1887:
	orncc	%l1,	%l6,	%o5
	smulcc	%g7,	0x15B8,	%o7
loop_1888:
	lduw	[%l7 + 0x10],	%g5
loop_1889:
	fpack16	%f16,	%f10
	andncc	%l3,	%o4,	%i7
	or	%i4,	%i0,	%g4
	addcc	%o2,	0x136A,	%i3
	ldd	[%l7 + 0x30],	%o6
	fmovdle	%icc,	%f26,	%f18
	bne,a	loop_1890
	or	%l5,	%g6,	%i6
	fcmple32	%f20,	%f18,	%o0
	bleu,a,pt	%icc,	loop_1891
loop_1890:
	std	%f6,	[%l7 + 0x70]
	movrgez	%i2,	%l4,	%g1
	fmovspos	%xcc,	%f24,	%f21
loop_1891:
	fpack32	%f10,	%f18,	%f2
	udiv	%i5,	0x1363,	%o1
	tpos	%xcc,	0x1
	movgu	%icc,	%l2,	%l0
	fand	%f26,	%f10,	%f0
	flush	%l7 + 0x10
	fcmpd	%fcc1,	%f0,	%f24
	ldd	[%l7 + 0x58],	%i0
	bpos,a	%xcc,	loop_1892
	membar	0x1B
	movrne	%g2,	%g3,	%l1
	set	0x40, %o2
	swapa	[%l7 + %o2] 0x10,	%o3
loop_1892:
	umulcc	%l6,	%g7,	%o7
	lduh	[%l7 + 0x74],	%g5
	taddcc	%o5,	0x1E51,	%o4
	andcc	%i7,	%l3,	%i4
	fzero	%f14
	tcc	%icc,	0x7
	fmul8sux16	%f20,	%f26,	%f26
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tsubcctv	%i0,	0x0021,	%o2
	te	%xcc,	0x7
	bne,pn	%xcc,	loop_1893
	mova	%icc,	%i3,	%g4
	ta	%xcc,	0x4
	tcc	%icc,	0x0
loop_1893:
	movrlez	%o6,	0x146,	%g6
	tg	%xcc,	0x5
	array16	%i6,	%o0,	%l5
	udiv	%i2,	0x0960,	%g1
	fpadd16	%f14,	%f16,	%f22
	movcc	%xcc,	%l4,	%i5
	ta	%xcc,	0x4
	tneg	%xcc,	0x5
	bne,a,pt	%icc,	loop_1894
	fnegd	%f28,	%f0
	udiv	%o1,	0x1918,	%l2
	brnz,a	%i1,	loop_1895
loop_1894:
	srlx	%g2,	%l0,	%g3
	bl	loop_1896
	tne	%icc,	0x4
loop_1895:
	fbl	%fcc1,	loop_1897
	movcs	%icc,	%o3,	%l1
loop_1896:
	brgz	%l6,	loop_1898
	nop
	setx	loop_1899,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_1897:
	ldd	[%l7 + 0x70],	%o6
	fone	%f18
loop_1898:
	te	%icc,	0x4
loop_1899:
	fnot2s	%f20,	%f13
	bvc,a,pn	%icc,	loop_1900
	add	%g5,	%g7,	%o5
	fmul8x16au	%f0,	%f13,	%f6
	movrgz	%i7,	0x3B1,	%l3
loop_1900:
	fmovrdgz	%o4,	%f20,	%f4
	movge	%icc,	%i0,	%o2
	set	0x0C, %g6
	ldswa	[%l7 + %g6] 0x18,	%i4
	sethi	0x1031,	%i3
	movg	%icc,	%g4,	%g6
	udivx	%o6,	0x0DE3,	%o0
	swap	[%l7 + 0x4C],	%i6
	nop
	setx	loop_1901,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	andncc	%l5,	%i2,	%l4
	edge32n	%i5,	%o1,	%l2
	srax	%i1,	%g1,	%l0
loop_1901:
	movle	%xcc,	%g3,	%g2
	andcc	%o3,	0x1BB9,	%l6
	or	%l1,	0x0145,	%g5
	fcmps	%fcc3,	%f7,	%f7
	fpack16	%f16,	%f25
	array16	%g7,	%o7,	%o5
	udivcc	%i7,	0x1025,	%o4
	add	%l7,	0x48,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] %asi,	%l3,	%i0
	orcc	%o2,	%i4,	%i3
	te	%xcc,	0x2
	subccc	%g4,	0x074F,	%o6
	bvs,a,pt	%icc,	loop_1902
	fmovsne	%icc,	%f9,	%f0
	set	0x40, %g1
	prefetcha	[%l7 + %g1] 0x04,	 0x2
loop_1902:
	siam	0x0
	edge16	%i6,	%l5,	%o0
	ldsw	[%l7 + 0x30],	%i2
	stbar
	sethi	0x174B,	%i5
	te	%icc,	0x1
	edge16l	%o1,	%l2,	%i1
	andn	%g1,	0x0594,	%l4
	ldd	[%l7 + 0x58],	%l0
	fbuge,a	%fcc0,	loop_1903
	tleu	%icc,	0x7
	array8	%g3,	%g2,	%l6
	movrne	%l1,	0x287,	%o3
loop_1903:
	andn	%g7,	%o7,	%o5
	umul	%i7,	0x020A,	%o4
	brlez	%l3,	loop_1904
	movre	%g5,	%o2,	%i4
	addc	%i3,	0x025E,	%g4
	movneg	%xcc,	%o6,	%g6
loop_1904:
	xor	%i0,	0x1B1D,	%l5
	swap	[%l7 + 0x18],	%o0
	andncc	%i2,	%i6,	%i5
	movcc	%icc,	%o1,	%i1
	wr	%g0,	0x19,	%asi
	stda	%g0,	[%l7 + 0x48] %asi
	movre	%l4,	%l0,	%g3
	wr	%g0,	0x52,	%asi
	stxa	%l2,	[%g0 + 0x210] %asi
	edge8l	%g2,	%l6,	%l1
	array16	%g7,	%o3,	%o5
	sdivx	%o7,	0x16D5,	%o4
	xnor	%i7,	%g5,	%o2
	te	%xcc,	0x1
	edge32	%l3,	%i3,	%g4
	srlx	%i4,	%o6,	%i0
	fmovsl	%icc,	%f16,	%f16
	udivx	%g6,	0x1A6A,	%o0
	fnor	%f30,	%f2,	%f22
	fmovrdlz	%l5,	%f30,	%f30
	nop
	setx	loop_1905,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	stw	%i6,	[%l7 + 0x08]
	sethi	0x098B,	%i2
	nop
	setx	loop_1906,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_1905:
	fmovsn	%icc,	%f14,	%f13
	fmovrsgz	%i5,	%f26,	%f3
	addcc	%o1,	0x15BB,	%g1
loop_1906:
	nop
	set	0x74, %i1
	stwa	%i1,	[%l7 + %i1] 0x80
	mulscc	%l4,	0x1BD2,	%g3
	sir	0x0470
	subccc	%l2,	0x1D7F,	%l0
	wr	%g0,	0x81,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	edge16ln	%l6,	%g2,	%g7
	brgez,a	%o3,	loop_1907
	fmovrsne	%l1,	%f19,	%f31
	bshuffle	%f10,	%f14,	%f20
	movleu	%xcc,	%o7,	%o5
loop_1907:
	and	%i7,	0x0253,	%g5
	wr	%g0,	0x81,	%asi
	prefetcha	[%l7 + 0x70] %asi,	 0x1
	siam	0x2
	fmovrdgez	%l3,	%f18,	%f8
	and	%o2,	%i3,	%g4
	edge32	%i4,	%o6,	%g6
	edge32n	%i0,	%o0,	%i6
	array16	%i2,	%l5,	%i5
	edge32l	%g1,	%o1,	%i1
	ble,a	loop_1908
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	membar	0x56
	alignaddr	%g3,	%l2,	%l0
loop_1908:
	fmovspos	%icc,	%f27,	%f26
	movn	%icc,	%l6,	%l4
	udivcc	%g7,	0x0F1F,	%g2
	orcc	%l1,	%o3,	%o5
	movleu	%icc,	%o7,	%i7
	movpos	%xcc,	%o4,	%g5
	umul	%l3,	0x0CA9,	%i3
	fmovrdlz	%g4,	%f20,	%f30
	edge16ln	%o2,	%i4,	%o6
	fmovdgu	%xcc,	%f2,	%f18
	tvc	%icc,	0x2
	tneg	%xcc,	0x1
	movcc	%xcc,	%i0,	%g6
	nop
	setx	loop_1909,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fxor	%f26,	%f26,	%f24
	edge8l	%i6,	%i2,	%o0
	edge8l	%l5,	%i5,	%g1
loop_1909:
	nop
	set	0x4E, %o6
	ldstuba	[%l7 + %o6] 0x80,	%i1
	stw	%o1,	[%l7 + 0x1C]
	fmovse	%icc,	%f13,	%f5
	addccc	%l2,	0x1C83,	%l0
	fmovse	%xcc,	%f13,	%f4
	movge	%icc,	%l6,	%g3
	edge32ln	%g7,	%g2,	%l4
	xorcc	%l1,	0x0658,	%o5
	be,a,pn	%xcc,	loop_1910
	orn	%o3,	0x0264,	%i7
	movvc	%xcc,	%o4,	%o7
	xorcc	%l3,	0x1CFA,	%i3
loop_1910:
	ta	%xcc,	0x1
	fxnor	%f20,	%f8,	%f2
	movrgez	%g5,	0x39F,	%g4
	movvs	%icc,	%i4,	%o6
	movgu	%xcc,	%o2,	%i0
	te	%icc,	0x1
	umul	%i6,	%g6,	%i2
	taddcctv	%o0,	0x18D4,	%l5
	movleu	%icc,	%i5,	%i1
	tcc	%xcc,	0x5
	wr	%g0,	0x18,	%asi
	lduwa	[%l7 + 0x4C] %asi,	%g1
	wr	%g0,	0xe2,	%asi
	stxa	%l2,	[%l7 + 0x20] %asi
	membar	#Sync
	tsubcctv	%l0,	0x1DA8,	%o1
	movrgz	%l6,	%g3,	%g2
	edge8	%l4,	%l1,	%o5
	ldstub	[%l7 + 0x5A],	%o3
	array8	%i7,	%o4,	%g7
	tcs	%xcc,	0x5
	tsubcc	%l3,	0x1658,	%o7
	alignaddrl	%g5,	%g4,	%i3
	movrlez	%o6,	0x352,	%o2
	set	0x60, %l2
	stxa	%i4,	[%l7 + %l2] 0x10
	fbg	%fcc0,	loop_1911
	movrgz	%i0,	0x360,	%g6
	addc	%i6,	%o0,	%i2
	fmovdvs	%icc,	%f21,	%f28
loop_1911:
	nop
	wr	%g0,	0x18,	%asi
	swapa	[%l7 + 0x34] %asi,	%i5
	tl	%icc,	0x3
	alignaddrl	%l5,	%g1,	%l2
	nop
	setx	loop_1912,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movle	%xcc,	%l0,	%o1
	bl,a	%icc,	loop_1913
	add	%i1,	0x0EF4,	%g3
loop_1912:
	sethi	0x0787,	%l6
	movrlez	%l4,	0x361,	%g2
loop_1913:
	nop
	set	0x37, %l3
	ldsb	[%l7 + %l3],	%l1
	brlz	%o3,	loop_1914
	smul	%o5,	0x154D,	%i7
	movl	%xcc,	%o4,	%l3
	orcc	%g7,	0x0240,	%g5
loop_1914:
	and	%o7,	%i3,	%g4
	movpos	%xcc,	%o6,	%i4
	movre	%o2,	0x094,	%i0
	fbue,a	%fcc0,	loop_1915
	fbn,a	%fcc3,	loop_1916
	tg	%icc,	0x7
	movvc	%xcc,	%i6,	%g6
loop_1915:
	edge8	%o0,	%i2,	%i5
loop_1916:
	movg	%xcc,	%g1,	%l2
	bl,pn	%icc,	loop_1917
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x89,	%asi
	ldstuba	[%l7 + 0x3F] %asi,	%l0
loop_1917:
	movrne	%o1,	0x2E1,	%i1
	lduh	[%l7 + 0x2A],	%l5
	fsrc1s	%f23,	%f27
	tsubcc	%g3,	%l6,	%g2
	udiv	%l4,	0x0B7E,	%l1
	sll	%o5,	0x01,	%o3
	tl	%xcc,	0x5
	sethi	0x0965,	%o4
	ble,a	loop_1918
	be	%xcc,	loop_1919
	fbul	%fcc2,	loop_1920
	add	%l3,	0x1CFE,	%i7
loop_1918:
	umulcc	%g5,	0x0F1C,	%o7
loop_1919:
	fpack16	%f14,	%f28
loop_1920:
	bvc,a,pn	%xcc,	loop_1921
	fcmpne32	%f30,	%f22,	%i3
	set	0x58, %i2
	ldsha	[%l7 + %i2] 0x19,	%g7
loop_1921:
	fmovdleu	%xcc,	%f1,	%f30
	add	%l7,	0x20,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%g4
	casxa	[%l6] %asi,	%g4,	%o6
	fcmpes	%fcc0,	%f14,	%f10
	brnz	%o2,	loop_1922
	popc	%i4,	%i6
	andcc	%g6,	0x1667,	%o0
	tcc	%xcc,	0x5
loop_1922:
	xnorcc	%i0,	0x1499,	%i5
	move	%xcc,	%i2,	%g1
	prefetch	[%l7 + 0x5C],	 0x1
	fmovrdlez	%l0,	%f20,	%f14
	fbue,a	%fcc0,	loop_1923
	addccc	%l2,	%i1,	%o1
	udivx	%l5,	0x162B,	%g3
	move	%xcc,	%l6,	%g2
loop_1923:
	fmovrse	%l1,	%f24,	%f0
	popc	%l4,	%o5
	fornot1s	%f26,	%f4,	%f21
	umulcc	%o4,	%l3,	%i7
	prefetch	[%l7 + 0x18],	 0x3
	add	%o3,	0x1A6B,	%g5
	lduw	[%l7 + 0x0C],	%i3
	fmovdleu	%xcc,	%f21,	%f17
	tleu	%icc,	0x4
	sra	%o7,	0x0A,	%g7
	orncc	%o6,	0x122C,	%g4
	tsubcc	%o2,	0x1EFD,	%i6
	or	%g6,	0x1FD4,	%o0
	subc	%i0,	%i4,	%i2
	fcmpgt32	%f8,	%f12,	%i5
	fcmpes	%fcc0,	%f20,	%f4
	fmovrslz	%l0,	%f17,	%f22
	and	%g1,	0x196B,	%l2
	movrne	%i1,	0x23D,	%o1
	wr	%g0,	0x10,	%asi
	stda	%l4,	[%l7 + 0x58] %asi
	fpsub16	%f18,	%f30,	%f2
	brgz	%g3,	loop_1924
	sub	%g2,	%l6,	%l4
	fabss	%f14,	%f13
	smulcc	%l1,	0x1738,	%o4
loop_1924:
	addcc	%o5,	0x02D6,	%l3
	fcmpgt16	%f16,	%f30,	%i7
	bne,pn	%xcc,	loop_1925
	bpos	%icc,	loop_1926
	smul	%o3,	%g5,	%i3
	subccc	%g7,	%o7,	%o6
loop_1925:
	fmovsge	%icc,	%f3,	%f5
loop_1926:
	array32	%g4,	%i6,	%o2
	edge16	%o0,	%i0,	%i4
	taddcc	%i2,	0x0DC1,	%g6
	edge16ln	%i5,	%g1,	%l2
	edge32n	%l0,	%i1,	%o1
	fmovdvc	%xcc,	%f3,	%f4
	bshuffle	%f10,	%f8,	%f8
	set	0x0E, %i6
	lduha	[%l7 + %i6] 0x11,	%l5
	set	0x11, %i5
	ldsba	[%l7 + %i5] 0x88,	%g2
	srl	%g3,	%l6,	%l4
	edge32	%l1,	%o5,	%o4
	swap	[%l7 + 0x2C],	%i7
	edge8ln	%o3,	%g5,	%i3
	fmovsne	%icc,	%f11,	%f9
	smulcc	%g7,	%l3,	%o7
	tsubcctv	%o6,	0x147B,	%i6
	bge	%icc,	loop_1927
	fbu,a	%fcc0,	loop_1928
	fmovsgu	%icc,	%f11,	%f26
	bl,pt	%icc,	loop_1929
loop_1927:
	te	%xcc,	0x5
loop_1928:
	fbo,a	%fcc2,	loop_1930
	fnot1s	%f8,	%f23
loop_1929:
	tle	%icc,	0x5
	fandnot1	%f24,	%f28,	%f8
loop_1930:
	movneg	%icc,	%o2,	%g4
	movrne	%o0,	%i4,	%i2
	fcmpeq16	%f18,	%f4,	%g6
	fpack16	%f14,	%f30
	umul	%i5,	%g1,	%i0
	bg,pt	%icc,	loop_1931
	sir	0x0004
	movvc	%xcc,	%l0,	%i1
	xorcc	%o1,	%l5,	%l2
loop_1931:
	subcc	%g3,	%l6,	%l4
	tle	%xcc,	0x7
	fexpand	%f29,	%f10
	xor	%g2,	0x0440,	%l1
	fcmps	%fcc0,	%f29,	%f29
	stbar
	subcc	%o5,	0x1F8B,	%i7
	srax	%o4,	0x17,	%o3
	sdivx	%g5,	0x036B,	%g7
	sdivcc	%l3,	0x0311,	%o7
	orn	%o6,	0x0131,	%i3
	xnor	%i6,	%g4,	%o0
	fblg	%fcc1,	loop_1932
	movrgez	%o2,	%i2,	%i4
	std	%g6,	[%l7 + 0x70]
	fbul	%fcc0,	loop_1933
loop_1932:
	sethi	0x09E0,	%g1
	call	loop_1934
	bgu	%xcc,	loop_1935
loop_1933:
	orcc	%i5,	0x0310,	%l0
	tg	%icc,	0x7
loop_1934:
	tl	%xcc,	0x7
loop_1935:
	add	%i0,	%i1,	%o1
	alignaddr	%l5,	%g3,	%l6
	udivcc	%l4,	0x1C28,	%g2
	fmovsle	%xcc,	%f14,	%f13
	fmovdvc	%xcc,	%f17,	%f27
	set	0x08, %o5
	stha	%l2,	[%l7 + %o5] 0x15
	te	%icc,	0x7
	movge	%xcc,	%l1,	%i7
	tcs	%icc,	0x6
	st	%f20,	[%l7 + 0x10]
	wr	%g0,	0x18,	%asi
	swapa	[%l7 + 0x74] %asi,	%o5
	fandnot1s	%f8,	%f16,	%f22
	call	loop_1936
	xorcc	%o4,	0x18FD,	%g5
	ldd	[%l7 + 0x50],	%f16
	taddcctv	%g7,	0x0DFD,	%l3
loop_1936:
	array16	%o7,	%o3,	%o6
	movvs	%xcc,	%i3,	%g4
	fpsub16s	%f29,	%f31,	%f6
	fones	%f5
	bcs,a,pn	%xcc,	loop_1937
	edge8ln	%o0,	%i6,	%i2
	umulcc	%i4,	0x1A3D,	%g6
	fmovrdlz	%o2,	%f0,	%f12
loop_1937:
	orcc	%g1,	%l0,	%i5
	taddcc	%i0,	%i1,	%l5
	umul	%g3,	%o1,	%l6
	xor	%g2,	%l2,	%l4
	taddcctv	%l1,	0x1C0A,	%o5
	membar	0x56
	te	%xcc,	0x1
	fpack32	%f24,	%f22,	%f20
	brlz	%i7,	loop_1938
	move	%xcc,	%o4,	%g5
	fba	%fcc2,	loop_1939
	umulcc	%g7,	0x0B9E,	%l3
loop_1938:
	tn	%xcc,	0x0
	array32	%o7,	%o3,	%i3
loop_1939:
	pdist	%f16,	%f20,	%f22
	fpadd32	%f8,	%f14,	%f6
	edge8ln	%o6,	%g4,	%i6
	bneg,a	%xcc,	loop_1940
	orncc	%i2,	%i4,	%o0
	edge32	%g6,	%o2,	%l0
	mulx	%i5,	%g1,	%i1
loop_1940:
	alignaddrl	%i0,	%l5,	%g3
	sllx	%o1,	%g2,	%l6
	fmovspos	%icc,	%f31,	%f18
	tge	%icc,	0x7
	fxnor	%f12,	%f6,	%f0
	movpos	%xcc,	%l4,	%l2
	alignaddr	%l1,	%o5,	%o4
	sra	%g5,	%g7,	%i7
	edge32	%l3,	%o3,	%i3
	bneg,pn	%icc,	loop_1941
	srl	%o6,	0x12,	%o7
	subcc	%g4,	%i6,	%i2
	fmul8ulx16	%f16,	%f4,	%f20
loop_1941:
	fsrc1	%f4,	%f10
	sdivcc	%o0,	0x15D5,	%g6
	sdivx	%i4,	0x17AE,	%l0
	fbe	%fcc3,	loop_1942
	lduh	[%l7 + 0x22],	%i5
	mova	%icc,	%g1,	%i1
	addc	%o2,	%l5,	%i0
loop_1942:
	ldx	[%l7 + 0x20],	%g3
	fsrc1	%f6,	%f20
	tcs	%icc,	0x0
	swap	[%l7 + 0x10],	%g2
	swap	[%l7 + 0x50],	%l6
	movl	%icc,	%l4,	%l2
	wr	%g0,	0xe3,	%asi
	stda	%o0,	[%l7 + 0x30] %asi
	membar	#Sync
	fones	%f19
	mulscc	%o5,	%l1,	%g5
	orcc	%o4,	0x0BB9,	%i7
	sra	%g7,	%o3,	%i3
	bn	%xcc,	loop_1943
	movn	%icc,	%o6,	%l3
	fors	%f7,	%f0,	%f8
	array32	%g4,	%i6,	%i2
loop_1943:
	umulcc	%o0,	0x0B2C,	%o7
	sethi	0x10CE,	%i4
	movn	%xcc,	%l0,	%i5
	set	0x57, %l1
	ldstuba	[%l7 + %l1] 0x10,	%g6
	set	0x53, %l5
	ldstuba	[%l7 + %l5] 0x11,	%i1
	fmovsge	%xcc,	%f15,	%f27
	fbule	%fcc2,	loop_1944
	ta	%icc,	0x1
	subcc	%g1,	0x1754,	%l5
	wr	%g0,	0x80,	%asi
	lduha	[%l7 + 0x7E] %asi,	%o2
loop_1944:
	sdiv	%g3,	0x0EBA,	%i0
	fones	%f23
	movvc	%xcc,	%g2,	%l4
	add	%l7,	0x20,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%l2
	casa	[%l6] 0x88,	%l2,	%o1
	udivx	%l6,	0x1D47,	%l1
	fmovdpos	%xcc,	%f21,	%f28
	fble	%fcc0,	loop_1945
	tsubcc	%o5,	0x1D94,	%g5
	fnot1	%f14,	%f18
	movrlz	%i7,	%g7,	%o4
loop_1945:
	umul	%i3,	%o3,	%o6
	addc	%g4,	0x0149,	%i6
	udivx	%i2,	0x108E,	%l3
	tle	%xcc,	0x0
	and	%o7,	0x01B2,	%i4
	andcc	%l0,	%i5,	%g6
	udivcc	%o0,	0x1F24,	%g1
	smulcc	%i1,	%o2,	%l5
	subccc	%g3,	%g2,	%i0
	array32	%l4,	%o1,	%l2
	sethi	0x0D5A,	%l6
	umul	%l1,	%o5,	%i7
	edge16l	%g7,	%g5,	%i3
	movre	%o4,	%o6,	%o3
	fbe,a	%fcc2,	loop_1946
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	move	%icc,	%g4,	%i2
	xnor	%l3,	%i6,	%i4
loop_1946:
	tgu	%icc,	0x2
	wr	%g0,	0x89,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	bcc,a	%icc,	loop_1947
	fmovrdlz	%o7,	%f18,	%f18
	fbul	%fcc0,	loop_1948
	movrgez	%i5,	0x275,	%g6
loop_1947:
	nop
	set	0x10, %o0
	swapa	[%l7 + %o0] 0x0c,	%l0
loop_1948:
	sll	%o0,	%i1,	%o2
	brz	%g1,	loop_1949
	xorcc	%l5,	0x107D,	%g2
	movgu	%xcc,	%i0,	%g3
	fpackfix	%f30,	%f7
loop_1949:
	fbo,a	%fcc3,	loop_1950
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
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bn,pt	%icc,	loop_1952
loop_1950:
	edge8	%o1,	%l4,	%l6
loop_1951:
	fba,a	%fcc3,	loop_1953
	smul	%l2,	0x0999,	%o5
loop_1952:
	movrlez	%l1,	0x330,	%i7
	fcmple32	%f30,	%f4,	%g7
loop_1953:
	movgu	%icc,	%i3,	%g5
	movrlez	%o6,	%o4,	%o3
	stbar
	tcc	%xcc,	0x7
	alignaddr	%g4,	%l3,	%i2
	orcc	%i4,	0x1293,	%o7
	add	%l7,	0x50,	%l6
	wr	%g0,	0x19,	%asi
	ldxa	[%l6] %asi,	%i6
	casxa	[%l6] %asi,	%i6,	%g6
	sth	%i5,	[%l7 + 0x0A]
	edge8l	%l0,	%o0,	%o2
	brgz,a	%g1,	loop_1954
	fxors	%f3,	%f13,	%f17
	fbge,a	%fcc3,	loop_1955
	sethi	0x0049,	%i1
loop_1954:
	srl	%l5,	0x11,	%i0
	fcmpgt32	%f6,	%f2,	%g3
loop_1955:
	fmovdvc	%xcc,	%f22,	%f15
	tgu	%xcc,	0x0
	edge32n	%o1,	%l4,	%l6
	fbuge,a	%fcc1,	loop_1956
	tvc	%xcc,	0x6
	movvs	%xcc,	%g2,	%o5
	tcs	%xcc,	0x2
loop_1956:
	add	%l2,	0x0B0D,	%l1
	nop
	setx loop_1957, %l0, %l1
	jmpl %l1, %g7
	orcc	%i7,	%g5,	%o6
	edge8l	%o4,	%i3,	%g4
	mova	%xcc,	%o3,	%i2
loop_1957:
	movle	%xcc,	%l3,	%o7
	tl	%xcc,	0x1
	movn	%xcc,	%i6,	%i4
	smul	%g6,	0x1D84,	%i5
	sllx	%o0,	%l0,	%o2
	tgu	%icc,	0x7
	edge8	%i1,	%g1,	%l5
	fmovdcs	%icc,	%f14,	%f17
	taddcc	%g3,	%i0,	%l4
	bge	loop_1958
	edge16	%o1,	%l6,	%g2
	fpack16	%f2,	%f4
	fandnot1	%f4,	%f12,	%f24
loop_1958:
	taddcc	%l2,	%l1,	%o5
	brnz	%i7,	loop_1959
	fnot1	%f4,	%f28
	fandnot2	%f6,	%f6,	%f22
	fcmpes	%fcc1,	%f10,	%f9
loop_1959:
	sir	0x0100
	fpmerge	%f22,	%f1,	%f28
	sethi	0x0BC6,	%g7
	array32	%g5,	%o4,	%o6
	edge32ln	%g4,	%o3,	%i3
	fmovda	%icc,	%f31,	%f2
	fnot1	%f6,	%f22
	brnz	%i2,	loop_1960
	fnot1	%f26,	%f28
	andncc	%l3,	%o7,	%i4
	srlx	%g6,	%i6,	%o0
loop_1960:
	movcc	%icc,	%l0,	%i5
	udivcc	%i1,	0x1FD6,	%o2
	fbug	%fcc0,	loop_1961
	fnot2s	%f17,	%f0
	fmul8x16au	%f7,	%f7,	%f18
	sethi	0x11F9,	%l5
loop_1961:
	fmovrdne	%g1,	%f12,	%f4
	movl	%icc,	%i0,	%l4
	movl	%xcc,	%o1,	%l6
	fbne,a	%fcc0,	loop_1962
	st	%f26,	[%l7 + 0x64]
	fpadd32	%f4,	%f16,	%f2
	sra	%g3,	0x04,	%l2
loop_1962:
	edge32	%l1,	%o5,	%g2
	set	0x40, %l0
	stxa	%i7,	[%l7 + %l0] 0xea
	membar	#Sync
	bgu,a	loop_1963
	tcc	%xcc,	0x3
	bge,a	loop_1964
	tle	%icc,	0x5
loop_1963:
	addccc	%g7,	0x0FED,	%o4
	tle	%xcc,	0x3
loop_1964:
	fpadd16	%f24,	%f30,	%f18
	movre	%o6,	0x0C4,	%g5
	edge32n	%g4,	%i3,	%i2
	fmovrdgez	%o3,	%f12,	%f10
	tpos	%xcc,	0x4
	fmul8ulx16	%f14,	%f6,	%f30
	movvc	%icc,	%o7,	%i4
	stw	%l3,	[%l7 + 0x38]
	movcc	%icc,	%i6,	%g6
	fmovde	%xcc,	%f17,	%f16
	subcc	%l0,	%i5,	%o0
	movgu	%icc,	%i1,	%o2
	sdivx	%g1,	0x1D5C,	%l5
	tvc	%icc,	0x7
	fxnors	%f18,	%f1,	%f26
	edge16	%i0,	%o1,	%l4
	sir	0x07EE
	fbn	%fcc1,	loop_1965
	orn	%g3,	0x1840,	%l6
	tvc	%xcc,	0x6
	edge32n	%l2,	%o5,	%l1
loop_1965:
	ba,pn	%xcc,	loop_1966
	orn	%g2,	0x1395,	%i7
	bcs,a	loop_1967
	tcs	%xcc,	0x1
loop_1966:
	andncc	%o4,	%g7,	%o6
	and	%g4,	0x0CD1,	%g5
loop_1967:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sethi	0x14D2,	%i3
	brgz,a	%i2,	loop_1968
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mova	%icc,	%o3,	%i4
	st	%f13,	[%l7 + 0x28]
loop_1968:
	fmovdneg	%icc,	%f6,	%f23
	fba	%fcc0,	loop_1969
	bvc,pn	%icc,	loop_1970
	tcc	%xcc,	0x5
	andcc	%l3,	%o7,	%g6
loop_1969:
	call	loop_1971
loop_1970:
	fmovsvc	%xcc,	%f23,	%f30
	move	%icc,	%i6,	%l0
	wr	%g0,	0x11,	%asi
	stba	%o0,	[%l7 + 0x22] %asi
loop_1971:
	fmovdne	%icc,	%f12,	%f2
	movleu	%xcc,	%i1,	%o2
	edge16n	%i5,	%g1,	%l5
	bl	%xcc,	loop_1972
	subc	%o1,	%l4,	%i0
	fsrc1	%f6,	%f4
	tleu	%xcc,	0x0
loop_1972:
	bne,pn	%xcc,	loop_1973
	membar	0x29
	nop
	set	0x0C, %i0
	ldsh	[%l7 + %i0],	%g3
	tvc	%xcc,	0x2
loop_1973:
	te	%icc,	0x7
	tcs	%icc,	0x7
	bgu	%xcc,	loop_1974
	alignaddr	%l2,	%o5,	%l1
	tleu	%xcc,	0x2
	array32	%l6,	%i7,	%g2
loop_1974:
	fbne,a	%fcc1,	loop_1975
	fone	%f2
	fmovrslz	%g7,	%f25,	%f20
	ldsw	[%l7 + 0x44],	%o4
loop_1975:
	sdiv	%o6,	0x04B6,	%g4
	ldx	[%l7 + 0x60],	%g5
	sdiv	%i2,	0x1A46,	%o3
	fbug,a	%fcc1,	loop_1976
	fmovdl	%xcc,	%f28,	%f5
	sra	%i3,	0x1B,	%l3
	fmovsn	%xcc,	%f19,	%f4
loop_1976:
	fabss	%f24,	%f22
	fmovdn	%icc,	%f21,	%f3
	mova	%icc,	%o7,	%g6
	taddcctv	%i6,	0x0C95,	%l0
	subc	%i4,	%i1,	%o2
	prefetch	[%l7 + 0x08],	 0x0
	fmovdn	%icc,	%f0,	%f21
	fnor	%f10,	%f0,	%f6
	set	0x0C, %g2
	sta	%f28,	[%l7 + %g2] 0x04
	movrlz	%i5,	0x030,	%g1
	nop
	setx loop_1977, %l0, %l1
	jmpl %l1, %o0
	mulx	%o1,	%l4,	%l5
	stbar
	set	0x18, %o4
	ldxa	[%l7 + %o4] 0x88,	%i0
loop_1977:
	smul	%g3,	0x123F,	%l2
	sdivcc	%l1,	0x029F,	%l6
	bne,pt	%xcc,	loop_1978
	array32	%o5,	%g2,	%g7
	movrgez	%o4,	0x203,	%i7
	subcc	%g4,	%g5,	%i2
loop_1978:
	edge8l	%o3,	%i3,	%l3
	ldsb	[%l7 + 0x13],	%o6
	tpos	%xcc,	0x3
	movvc	%icc,	%g6,	%o7
	tle	%icc,	0x5
	move	%icc,	%i6,	%l0
	set	0x36, %o7
	stha	%i4,	[%l7 + %o7] 0xeb
	membar	#Sync
	fbl	%fcc1,	loop_1979
	tvc	%xcc,	0x7
	tneg	%xcc,	0x3
	addccc	%o2,	%i5,	%g1
loop_1979:
	fmovscs	%xcc,	%f29,	%f19
	bcs,a	%icc,	loop_1980
	fornot2	%f26,	%f30,	%f2
	tneg	%xcc,	0x5
	movle	%icc,	%i1,	%o0
loop_1980:
	sllx	%l4,	0x15,	%o1
	wr	%g0,	0x10,	%asi
	ldsba	[%l7 + 0x34] %asi,	%i0
	bl	loop_1981
	fbg	%fcc0,	loop_1982
	brlez,a	%g3,	loop_1983
	popc	%l2,	%l5
loop_1981:
	movcs	%xcc,	%l6,	%l1
loop_1982:
	bg,pt	%icc,	loop_1984
loop_1983:
	fbo	%fcc0,	loop_1985
	fandnot2s	%f1,	%f19,	%f2
	movre	%o5,	0x015,	%g2
loop_1984:
	srlx	%o4,	%g7,	%g4
loop_1985:
	fnot1s	%f14,	%f27
	stbar
	wr	%g0,	0x10,	%asi
	stha	%g5,	[%l7 + 0x42] %asi
	fmul8ulx16	%f28,	%f20,	%f18
	fcmple32	%f26,	%f2,	%i7
	movrlz	%i2,	%o3,	%i3
	bvc,pt	%icc,	loop_1986
	fmovsle	%icc,	%f13,	%f22
	ble	%icc,	loop_1987
	tl	%xcc,	0x3
loop_1986:
	udiv	%o6,	0x0673,	%l3
	fxnors	%f25,	%f31,	%f4
loop_1987:
	tcc	%xcc,	0x6
	taddcctv	%g6,	0x17C1,	%i6
	array8	%l0,	%o7,	%i4
	bpos,pn	%xcc,	loop_1988
	andncc	%o2,	%g1,	%i1
	bvs,pn	%xcc,	loop_1989
	tcc	%xcc,	0x0
loop_1988:
	edge8ln	%i5,	%l4,	%o1
	fbe	%fcc1,	loop_1990
loop_1989:
	fnegs	%f27,	%f12
	fmovdneg	%xcc,	%f7,	%f14
	move	%xcc,	%o0,	%g3
loop_1990:
	bneg	loop_1991
	movrgez	%i0,	%l5,	%l6
	edge32	%l2,	%l1,	%o5
	call	loop_1992
loop_1991:
	tsubcctv	%o4,	0x14A2,	%g2
	andcc	%g4,	%g7,	%g5
	std	%i2,	[%l7 + 0x30]
loop_1992:
	tl	%icc,	0x4
	bl,a	loop_1993
	bne,a	loop_1994
	umul	%o3,	%i3,	%i7
	fmul8x16al	%f14,	%f29,	%f30
loop_1993:
	brgz,a	%o6,	loop_1995
loop_1994:
	addc	%g6,	%l3,	%i6
	tcc	%xcc,	0x3
	subc	%o7,	0x06DC,	%l0
loop_1995:
	movg	%icc,	%o2,	%g1
	alignaddr	%i4,	%i5,	%i1
	mova	%icc,	%l4,	%o1
	umul	%o0,	0x1A63,	%g3
	swap	[%l7 + 0x1C],	%i0
	taddcc	%l5,	0x0821,	%l6
	taddcctv	%l1,	%l2,	%o5
	movrne	%o4,	0x0A4,	%g2
	fmovsg	%xcc,	%f31,	%f26
	sdiv	%g7,	0x06FB,	%g5
	addccc	%g4,	%o3,	%i3
	wr	%g0,	0x19,	%asi
	ldsha	[%l7 + 0x76] %asi,	%i2
	fbl,a	%fcc0,	loop_1996
	umulcc	%o6,	%i7,	%g6
	te	%xcc,	0x5
	tcs	%xcc,	0x0
loop_1996:
	fpsub32	%f26,	%f18,	%f28
	tgu	%xcc,	0x7
	swap	[%l7 + 0x78],	%i6
	fbule	%fcc3,	loop_1997
	movge	%icc,	%o7,	%l3
	edge8l	%l0,	%o2,	%i4
	udiv	%i5,	0x0632,	%g1
loop_1997:
	fornot1	%f22,	%f10,	%f14
	movg	%icc,	%l4,	%o1
	subccc	%i1,	0x080E,	%o0
	fmovsl	%xcc,	%f11,	%f5
	and	%i0,	%l5,	%l6
	set	0x5C, %i4
	lda	[%l7 + %i4] 0x04,	%f14
	movne	%xcc,	%l1,	%l2
	subc	%g3,	%o4,	%o5
	add	%g2,	0x1CC8,	%g7
	fxors	%f3,	%f13,	%f10
	alignaddr	%g4,	%o3,	%i3
	movrgz	%i2,	%g5,	%i7
	sdiv	%g6,	0x0C2A,	%i6
	tn	%icc,	0x5
	stw	%o6,	[%l7 + 0x4C]
	addccc	%o7,	%l3,	%o2
	fbge	%fcc3,	loop_1998
	srax	%l0,	0x0D,	%i5
	edge16ln	%i4,	%l4,	%o1
	movrne	%g1,	0x1CF,	%i1
loop_1998:
	fbule,a	%fcc1,	loop_1999
	bl,pn	%xcc,	loop_2000
	udivcc	%o0,	0x0BAD,	%l5
	fcmple32	%f18,	%f26,	%i0
loop_1999:
	stw	%l6,	[%l7 + 0x38]
loop_2000:
	edge32	%l1,	%g3,	%o4
	fmovdpos	%icc,	%f28,	%f1
	ldd	[%l7 + 0x40],	%f6
	wr	%g0,	0x23,	%asi
	stha	%l2,	[%l7 + 0x22] %asi
	membar	#Sync
	sdivcc	%g2,	0x19D3,	%g7
	fcmpd	%fcc0,	%f22,	%f18
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
	movcs	%icc,	%o5,	%g4
	srl	%o3,	0x0D,	%i2
	fmovrde	%g5,	%f4,	%f22
loop_2001:
	fmovrsgz	%i3,	%f17,	%f23
	fmovscs	%xcc,	%f7,	%f27
	edge16	%i7,	%i6,	%g6
	movl	%icc,	%o6,	%l3
	ldub	[%l7 + 0x24],	%o2
	ta	%xcc,	0x6
	edge16n	%l0,	%i5,	%o7
	fandnot2	%f2,	%f16,	%f10
	addc	%i4,	0x0D56,	%l4
	set	0x30, %g3
	prefetcha	[%l7 + %g3] 0x11,	 0x0
	sll	%g1,	0x07,	%o0
	brgez,a	%i1,	loop_2002
	move	%xcc,	%l5,	%l6
	std	%l0,	[%l7 + 0x50]
	fmovsne	%xcc,	%f26,	%f30
loop_2002:
	fmovrdlez	%g3,	%f24,	%f20
	sdivcc	%o4,	0x19E4,	%i0
	faligndata	%f30,	%f4,	%f14
	movleu	%xcc,	%l2,	%g2
	fmovsge	%xcc,	%f12,	%f2
	brz,a	%o5,	loop_2003
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
	fcmpne32	%f4,	%f20,	%g7
	movle	%icc,	%o3,	%i2
loop_2003:
	be	%icc,	loop_2005
loop_2004:
	srlx	%g4,	%g5,	%i3
	and	%i6,	%g6,	%o6
	fnot1	%f14,	%f14
loop_2005:
	nop
	set	0x50, %l4
	lduha	[%l7 + %l4] 0x14,	%l3
	fmovdvc	%icc,	%f5,	%f17
	set	0x40, %o3
	ldda	[%l7 + %o3] 0x10,	%f16
	edge8	%i7,	%o2,	%i5
	sra	%o7,	%i4,	%l0
	movneg	%xcc,	%l4,	%o1
	edge16n	%g1,	%o0,	%i1
	sethi	0x0B09,	%l5
	membar	#Sync
	wr	%g0,	0xf8,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	fpack16	%f28,	%f29
	movg	%xcc,	%l6,	%l1
	mulscc	%o4,	0x0F79,	%g3
	wr	%g0,	0xe3,	%asi
	stda	%i0,	[%l7 + 0x60] %asi
	membar	#Sync
	call	loop_2006
	tneg	%xcc,	0x2
	st	%f7,	[%l7 + 0x6C]
	movge	%icc,	%g2,	%l2
loop_2006:
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
	fcmple16	%f30,	%f16,	%o5
	movne	%icc,	%g7,	%o3
	edge16n	%g4,	%i2,	%g5
loop_2007:
	fornot2s	%f25,	%f20,	%f7
	ba,a	loop_2008
	membar	0x07
	fbn,a	%fcc3,	loop_2009
	udivcc	%i3,	0x0753,	%i6
loop_2008:
	nop
	wr	%g0,	0xe3,	%asi
	stwa	%g6,	[%l7 + 0x60] %asi
	membar	#Sync
loop_2009:
	edge16l	%l3,	%o6,	%i7
	umul	%i5,	0x037A,	%o7
	fbuge	%fcc2,	loop_2010
	xnor	%i4,	0x16C9,	%o2
	addcc	%l0,	0x0A87,	%o1
	fmovsgu	%xcc,	%f1,	%f1
loop_2010:
	nop
	set	0x47, %o1
	ldub	[%l7 + %o1],	%g1
	xor	%l4,	%o0,	%i1
	bn	%icc,	loop_2011
	fnors	%f11,	%f20,	%f26
	tg	%icc,	0x7
	bvc	loop_2012
loop_2011:
	addc	%l6,	%l1,	%o4
	edge32	%l5,	%i0,	%g3
	brz,a	%g2,	loop_2013
loop_2012:
	nop
	setx loop_2014, %l0, %l1
	jmpl %l1, %o5
	fbuge,a	%fcc3,	loop_2015
	ldub	[%l7 + 0x74],	%l2
loop_2013:
	nop
	add	%l7,	0x58,	%l6
	wr	%g0,	0x11,	%asi
	casa	[%l6] 0x11,	%o3,	%g4
loop_2014:
	fmovrdgz	%i2,	%f4,	%f8
loop_2015:
	alignaddrl	%g5,	%g7,	%i3
	fmovsvc	%icc,	%f10,	%f16
	edge32	%g6,	%i6,	%l3
	fnot1	%f20,	%f12
	tcc	%xcc,	0x0
	fornot2	%f12,	%f2,	%f0
	sdivcc	%i7,	0x0E4C,	%o6
	edge32ln	%o7,	%i5,	%o2
	fbug,a	%fcc0,	loop_2016
	xorcc	%l0,	0x04E3,	%o1
	fcmps	%fcc0,	%f13,	%f14
	tgu	%xcc,	0x7
loop_2016:
	bvc,a	%xcc,	loop_2017
	movle	%icc,	%g1,	%l4
	fone	%f22
	tge	%xcc,	0x7
loop_2017:
	alignaddr	%i4,	%i1,	%o0
	xnor	%l6,	0x0B80,	%o4
	addccc	%l5,	0x0414,	%l1
	move	%icc,	%i0,	%g3
	fmovdvs	%icc,	%f9,	%f27
	bpos,pn	%xcc,	loop_2018
	tn	%xcc,	0x7
	and	%o5,	0x0E07,	%g2
	umul	%l2,	0x0A9B,	%o3
loop_2018:
	ld	[%l7 + 0x14],	%f30
	xnor	%g4,	%g5,	%i2
	brgez,a	%i3,	loop_2019
	sethi	0x0C12,	%g6
	orcc	%g7,	0x154E,	%l3
	sdiv	%i7,	0x1463,	%o6
loop_2019:
	smulcc	%i6,	%o7,	%o2
	umul	%l0,	0x1D35,	%o1
	movneg	%xcc,	%g1,	%i5
	edge32	%l4,	%i4,	%i1
	sdivcc	%l6,	0x0327,	%o0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	taddcctv	%l5,	0x15FE,	%l1
	wr	%g0,	0x11,	%asi
	stha	%o4,	[%l7 + 0x3C] %asi
	be,a	loop_2020
	fcmpne32	%f20,	%f14,	%i0
	array32	%g3,	%o5,	%g2
	fmovrse	%o3,	%f27,	%f18
loop_2020:
	movrlz	%g4,	%l2,	%g5
	movgu	%icc,	%i3,	%i2
	udivx	%g6,	0x0885,	%g7
	movleu	%xcc,	%l3,	%o6
	tgu	%icc,	0x5
	nop
	setx	loop_2021,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	mulscc	%i7,	0x0D78,	%o7
	fpadd32s	%f17,	%f28,	%f8
	bcc	%xcc,	loop_2022
loop_2021:
	fcmple16	%f6,	%f30,	%i6
	subccc	%l0,	0x1174,	%o1
	tge	%icc,	0x0
loop_2022:
	nop
	wr	%g0,	0x11,	%asi
	lduba	[%l7 + 0x32] %asi,	%g1
	ldd	[%l7 + 0x68],	%f26
	fnot2	%f2,	%f6
	xnor	%o2,	%l4,	%i5
	smul	%i1,	%l6,	%i4
	movre	%l5,	%o0,	%l1
	edge8	%o4,	%i0,	%o5
	brz,a	%g3,	loop_2023
	bvc,a	%icc,	loop_2024
	fbug	%fcc3,	loop_2025
	sir	0x0372
loop_2023:
	taddcctv	%g2,	0x1DC9,	%o3
loop_2024:
	alignaddrl	%g4,	%l2,	%g5
loop_2025:
	stb	%i3,	[%l7 + 0x23]
	taddcctv	%i2,	0x1584,	%g6
	movrlez	%g7,	%o6,	%i7
	fbug	%fcc1,	loop_2026
	udiv	%l3,	0x0486,	%i6
	be	%icc,	loop_2027
	subcc	%o7,	0x1D6F,	%o1
loop_2026:
	flush	%l7 + 0x20
	stx	%g1,	[%l7 + 0x78]
loop_2027:
	bl,a	loop_2028
	array32	%o2,	%l4,	%i5
	wr	%g0,	0x10,	%asi
	stxa	%l0,	[%l7 + 0x50] %asi
loop_2028:
	bl,a,pn	%icc,	loop_2029
	tne	%xcc,	0x4
	fmovsvs	%xcc,	%f22,	%f27
	membar	0x64
loop_2029:
	bvs,pt	%xcc,	loop_2030
	movgu	%icc,	%l6,	%i4
	array32	%i1,	%l5,	%o0
	fmovdcs	%xcc,	%f6,	%f31
loop_2030:
	movle	%icc,	%l1,	%o4
	edge16ln	%i0,	%g3,	%g2
	movpos	%icc,	%o3,	%o5
	fmovda	%xcc,	%f16,	%f25
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tpos	%xcc,	0x7
	udiv	%g4,	0x1387,	%g5
	brz,a	%l2,	loop_2031
	movg	%xcc,	%i3,	%g6
	fmovsgu	%icc,	%f8,	%f5
	srl	%i2,	0x1E,	%g7
loop_2031:
	movrne	%i7,	0x2CD,	%o6
	srlx	%l3,	0x1B,	%o7
	edge8	%i6,	%o1,	%o2
	wr	%g0,	0x18,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	std	%f14,	[%l7 + 0x50]
	mulscc	%l4,	0x0D72,	%g1
	wr	%g0,	0x89,	%asi
	stwa	%l0,	[%l7 + 0x18] %asi
	prefetch	[%l7 + 0x78],	 0x3
	add	%l7,	0x54,	%l6
	wr	%g0,	0x0c,	%asi
	casa	[%l6] 0x0c,	%l6,	%i4
	brz,a	%i1,	loop_2032
	fbug	%fcc2,	loop_2033
	xor	%i5,	0x0BF1,	%l5
	bvs	loop_2034
loop_2032:
	tcc	%xcc,	0x5
loop_2033:
	movge	%xcc,	%o0,	%l1
	popc	0x04C3,	%o4
loop_2034:
	brnz,a	%i0,	loop_2035
	movle	%xcc,	%g2,	%o3
	addccc	%g3,	%o5,	%g5
	orcc	%g4,	0x11C7,	%i3
loop_2035:
	movcs	%xcc,	%g6,	%l2
	srl	%g7,	%i2,	%o6
	fcmpd	%fcc1,	%f24,	%f4
	orncc	%l3,	0x0600,	%o7
	fcmpes	%fcc3,	%f26,	%f22
	tle	%icc,	0x4
	tne	%icc,	0x6
	fnor	%f24,	%f2,	%f4
	movrgz	%i6,	0x12D,	%i7
	tne	%icc,	0x4
	srlx	%o1,	%l4,	%o2
	stbar
	tsubcc	%g1,	%l6,	%i4
	bg	loop_2036
	edge32	%l0,	%i5,	%l5
	fmovsvc	%xcc,	%f13,	%f22
	tcs	%icc,	0x6
loop_2036:
	and	%o0,	%l1,	%o4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	membar	0x41
	fcmpeq32	%f28,	%f6,	%i1
	movleu	%xcc,	%i0,	%g2
	tleu	%icc,	0x4
	mulx	%g3,	%o3,	%g5
	alignaddr	%o5,	%i3,	%g6
	swap	[%l7 + 0x70],	%g4
	taddcc	%l2,	0x0CDE,	%g7
	subcc	%o6,	0x1B03,	%i2
	brnz	%l3,	loop_2037
	fand	%f4,	%f10,	%f12
	edge8	%o7,	%i7,	%i6
	fmovde	%icc,	%f30,	%f12
loop_2037:
	movvc	%icc,	%o1,	%l4
	bl,a,pt	%icc,	loop_2038
	smulcc	%o2,	%l6,	%i4
	movvs	%icc,	%l0,	%i5
	sra	%g1,	%l5,	%o0
loop_2038:
	nop
	wr	%g0,	0x10,	%asi
	stba	%o4,	[%l7 + 0x48] %asi
	st	%f13,	[%l7 + 0x08]
	edge32n	%l1,	%i1,	%i0
	srlx	%g2,	0x15,	%g3
	mulscc	%g5,	0x0A70,	%o5
	tn	%icc,	0x6
	movrne	%i3,	0x2EC,	%o3
	movre	%g6,	%l2,	%g7
	orn	%g4,	0x1A7B,	%i2
	movleu	%xcc,	%o6,	%l3
	movrgz	%i7,	%i6,	%o7
	smul	%o1,	%o2,	%l6
	fnegd	%f14,	%f22
	fmovrde	%l4,	%f24,	%f0
	tneg	%xcc,	0x7
	fpmerge	%f6,	%f27,	%f20
	movre	%l0,	%i5,	%i4
	tpos	%icc,	0x3
	ldsb	[%l7 + 0x69],	%l5
	addc	%g1,	%o0,	%o4
	bgu,a,pn	%icc,	loop_2039
	smul	%l1,	%i1,	%g2
	swap	[%l7 + 0x74],	%i0
	set	0x1C, %g4
	stha	%g5,	[%l7 + %g4] 0x04
loop_2039:
	brgez,a	%o5,	loop_2040
	movrgz	%i3,	0x03B,	%o3
	movcc	%xcc,	%g3,	%l2
	brz,a	%g6,	loop_2041
loop_2040:
	fba	%fcc0,	loop_2042
	sdivcc	%g7,	0x1233,	%i2
	swap	[%l7 + 0x2C],	%o6
loop_2041:
	andcc	%l3,	0x1F62,	%g4
loop_2042:
	edge8	%i6,	%i7,	%o7
	edge32l	%o2,	%l6,	%l4
	movge	%xcc,	%l0,	%i5
	bshuffle	%f22,	%f10,	%f2
	bcs,a	%xcc,	loop_2043
	edge16n	%i4,	%l5,	%o1
	srlx	%g1,	0x1C,	%o0
	movgu	%xcc,	%l1,	%i1
loop_2043:
	fcmped	%fcc3,	%f24,	%f8
	fand	%f12,	%f26,	%f22
	fbne,a	%fcc2,	loop_2044
	ble,a,pt	%icc,	loop_2045
	fmovdpos	%xcc,	%f27,	%f22
	mulscc	%o4,	%g2,	%i0
loop_2044:
	move	%icc,	%g5,	%i3
loop_2045:
	edge8l	%o5,	%o3,	%l2
	brnz	%g3,	loop_2046
	ta	%icc,	0x1
	edge16	%g6,	%g7,	%i2
	tne	%xcc,	0x2
loop_2046:
	fmovrdgz	%l3,	%f10,	%f2
	fmovdcs	%icc,	%f4,	%f12
	fcmpd	%fcc2,	%f22,	%f4
	array8	%o6,	%g4,	%i7
	set	0x7C, %g5
	sta	%f26,	[%l7 + %g5] 0x80
	udiv	%o7,	0x0F97,	%i6
	movne	%xcc,	%l6,	%l4
	tcs	%xcc,	0x0
	orncc	%l0,	%i5,	%i4
	smul	%o2,	0x0535,	%l5
	fpadd16s	%f19,	%f29,	%f25
	or	%g1,	%o0,	%l1
	and	%i1,	%o1,	%g2
	fxor	%f20,	%f0,	%f0
	subc	%o4,	0x1501,	%g5
	srax	%i0,	%i3,	%o5
	fbe,a	%fcc1,	loop_2047
	xor	%l2,	0x0A7E,	%g3
	tle	%icc,	0x6
	brgez,a	%o3,	loop_2048
loop_2047:
	fpadd16s	%f4,	%f18,	%f0
	fmovrdlez	%g7,	%f16,	%f8
	mulx	%i2,	0x04E2,	%l3
loop_2048:
	tg	%xcc,	0x2
	fbule,a	%fcc1,	loop_2049
	edge8l	%o6,	%g4,	%i7
	mulx	%o7,	0x009C,	%i6
	movne	%icc,	%g6,	%l4
loop_2049:
	movg	%xcc,	%l6,	%i5
	movvs	%xcc,	%l0,	%o2
	set	0x50, %i3
	stha	%l5,	[%l7 + %i3] 0x15
	movl	%icc,	%i4,	%g1
	fandnot1	%f24,	%f22,	%f16
	fcmpne16	%f18,	%f24,	%l1
	addcc	%i1,	%o0,	%o1
	st	%f29,	[%l7 + 0x38]
	fpadd32	%f16,	%f4,	%f14
	movl	%xcc,	%o4,	%g2
	sth	%i0,	[%l7 + 0x26]
	add	%g5,	%o5,	%i3
	bge,pn	%xcc,	loop_2050
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addccc	%l2,	%g3,	%o3
	edge32l	%i2,	%g7,	%o6
loop_2050:
	fmovsgu	%icc,	%f1,	%f1
	brlz,a	%g4,	loop_2051
	bcc,pt	%icc,	loop_2052
	sth	%i7,	[%l7 + 0x34]
	tcs	%icc,	0x6
loop_2051:
	fones	%f28
loop_2052:
	fnor	%f6,	%f24,	%f28
	fsrc2	%f28,	%f6
	add	%l7,	0x60,	%l6
	wr	%g0,	0x10,	%asi
	ldxa	[%l6] %asi,	%o7
	casxa	[%l6] 0x10,	%o7,	%l3
	fbuge	%fcc0,	loop_2053
	flush	%l7 + 0x70
	srl	%i6,	0x1F,	%g6
	nop
	set	0x70, %i7
	std	%i6,	[%l7 + %i7]
loop_2053:
	umulcc	%i5,	0x14A0,	%l4
	xnor	%o2,	%l0,	%l5
	subccc	%i4,	0x1921,	%g1
	smulcc	%i1,	0x1260,	%o0
	movvs	%icc,	%o1,	%l1
	fnands	%f7,	%f16,	%f10
	for	%f12,	%f6,	%f24
	movcs	%xcc,	%o4,	%i0
	brlez	%g5,	loop_2054
	move	%xcc,	%g2,	%o5
	tneg	%xcc,	0x2
	fnands	%f15,	%f5,	%f20
loop_2054:
	edge8ln	%i3,	%l2,	%o3
	or	%g3,	0x0AFF,	%g7
	fbul,a	%fcc3,	loop_2055
	xor	%o6,	%i2,	%i7
	movgu	%xcc,	%o7,	%l3
	nop
	set	0x7A, %l6
	ldsb	[%l7 + %l6],	%i6
loop_2055:
	sdivx	%g6,	0x186E,	%g4
	movge	%icc,	%l6,	%l4
	ta	%xcc,	0x5
	add	%i5,	%l0,	%o2
	addccc	%l5,	0x1E7E,	%g1
	add	%i4,	0x103E,	%i1
	edge32n	%o1,	%l1,	%o0
	movcc	%icc,	%i0,	%g5
	tleu	%icc,	0x1
	ta	%icc,	0x4
	fcmpeq16	%f2,	%f20,	%o4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	umulcc	%g2,	%i3,	%l2
	ldd	[%l7 + 0x58],	%o2
	stx	%g3,	[%l7 + 0x68]
	ldd	[%l7 + 0x50],	%o4
	fpsub16	%f20,	%f16,	%f18
	brnz	%g7,	loop_2056
	movcc	%xcc,	%o6,	%i7
	fbug	%fcc1,	loop_2057
	udivcc	%o7,	0x1FCC,	%l3
loop_2056:
	fpsub32s	%f28,	%f17,	%f14
	fbu	%fcc2,	loop_2058
loop_2057:
	ldsb	[%l7 + 0x33],	%i6
	xor	%i2,	0x18E0,	%g6
	subc	%g4,	%l6,	%i5
loop_2058:
	smulcc	%l4,	%o2,	%l0
	brgez	%l5,	loop_2059
	move	%icc,	%g1,	%i1
	movrlz	%o1,	%i4,	%o0
	movgu	%icc,	%l1,	%i0
loop_2059:
	lduw	[%l7 + 0x2C],	%o4
	or	%g2,	0x1009,	%i3
	andncc	%l2,	%g5,	%o3
	movcs	%xcc,	%g3,	%g7
	umulcc	%o6,	0x1650,	%o5
	movrgez	%o7,	0x348,	%i7
	array32	%i6,	%i2,	%g6
	edge32l	%g4,	%l6,	%l3
	subccc	%l4,	0x18F8,	%i5
	fmovsn	%xcc,	%f21,	%f25
	movle	%icc,	%l0,	%l5
	lduw	[%l7 + 0x6C],	%o2
	ldsh	[%l7 + 0x34],	%i1
	tcs	%icc,	0x2
	fcmpes	%fcc3,	%f17,	%f18
	movgu	%xcc,	%o1,	%g1
	movleu	%xcc,	%i4,	%l1
	subccc	%o0,	0x0975,	%o4
	fmovrsne	%g2,	%f5,	%f2
	movvc	%xcc,	%i0,	%l2
	movn	%icc,	%i3,	%g5
	array16	%o3,	%g7,	%o6
	fbge,a	%fcc2,	loop_2060
	fone	%f12
	sdivx	%o5,	0x1D11,	%o7
	movg	%xcc,	%g3,	%i6
loop_2060:
	fands	%f8,	%f3,	%f15
	fmovrdlez	%i7,	%f10,	%f18
	fmovdcc	%xcc,	%f20,	%f21
	fbge	%fcc0,	loop_2061
	fbn,a	%fcc2,	loop_2062
	sdivx	%i2,	0x0702,	%g4
	fmovsgu	%icc,	%f6,	%f28
loop_2061:
	nop
	wr	%g0,	0x11,	%asi
	swapa	[%l7 + 0x10] %asi,	%g6
loop_2062:
	or	%l6,	%l3,	%i5
	call	loop_2063
	umul	%l4,	%l5,	%o2
	xor	%l0,	%i1,	%g1
	movgu	%icc,	%i4,	%l1
loop_2063:
	tvs	%xcc,	0x5
	fmovdneg	%xcc,	%f26,	%f20
	xorcc	%o0,	%o4,	%o1
	fmovsle	%icc,	%f2,	%f5
	fandnot2s	%f3,	%f21,	%f11
	subc	%i0,	0x00B2,	%g2
	ldub	[%l7 + 0x55],	%i3
	membar	#Sync
	set	0x40, %g7
	ldda	[%l7 + %g7] 0xf9,	%f0
	fandnot1s	%f6,	%f13,	%f3
	sub	%g5,	%o3,	%l2
	sra	%g7,	0x18,	%o6
	fmovsn	%icc,	%f13,	%f17
	fpack16	%f2,	%f2
	andcc	%o5,	%g3,	%o7
	ldx	[%l7 + 0x10],	%i7
	fmovsn	%xcc,	%f15,	%f29
	bl,pt	%icc,	loop_2064
	tcc	%icc,	0x3
	addcc	%i2,	%i6,	%g6
	st	%f27,	[%l7 + 0x28]
loop_2064:
	pdist	%f10,	%f22,	%f4
	fmovd	%f22,	%f8
	movrgez	%g4,	%l3,	%l6
	tpos	%icc,	0x2
	or	%i5,	0x05DB,	%l4
	stbar
	srax	%o2,	0x14,	%l5
	ldd	[%l7 + 0x28],	%i0
	bcs,a	loop_2065
	lduw	[%l7 + 0x74],	%g1
	srl	%i4,	0x09,	%l0
	ble,a,pn	%xcc,	loop_2066
loop_2065:
	ldub	[%l7 + 0x27],	%l1
	fands	%f9,	%f28,	%f23
	bleu,a	%xcc,	loop_2067
loop_2066:
	fpadd32	%f14,	%f14,	%f6
	fbug	%fcc3,	loop_2068
	movrlez	%o0,	0x2BF,	%o1
loop_2067:
	nop
	set	0x3C, %g6
	sta	%f28,	[%l7 + %g6] 0x11
loop_2068:
	nop
	set	0x40, %o2
	lda	[%l7 + %o2] 0x80,	%f16
	nop
	setx loop_2069, %l0, %l1
	jmpl %l1, %i0
	popc	%o4,	%g2
	udivx	%i3,	0x1455,	%o3
	tgu	%icc,	0x1
loop_2069:
	andn	%l2,	%g7,	%g5
	orn	%o5,	0x0F12,	%g3
	movgu	%xcc,	%o7,	%i7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrdgez	%i2,	%f22,	%f18
	fpadd16s	%f11,	%f5,	%f15
	fnands	%f27,	%f3,	%f8
	tneg	%xcc,	0x4
	fpsub32	%f4,	%f26,	%f8
	edge32n	%o6,	%i6,	%g6
	stx	%l3,	[%l7 + 0x08]
	xnor	%l6,	%i5,	%l4
	movrne	%g4,	0x07A,	%o2
	popc	0x0A24,	%l5
	fpack16	%f14,	%f11
	orcc	%g1,	0x16C4,	%i4
	movvc	%xcc,	%i1,	%l0
	movne	%icc,	%o0,	%l1
	mulx	%i0,	%o1,	%g2
	tl	%xcc,	0x5
	movcs	%xcc,	%i3,	%o4
	sdiv	%l2,	0x00BA,	%o3
	movcs	%icc,	%g7,	%g5
	movpos	%icc,	%o5,	%o7
	fmovrsne	%i7,	%f12,	%f18
	sethi	0x03E9,	%g3
	fnot1	%f2,	%f18
	movrne	%i2,	0x2D6,	%o6
	bvc,a	%icc,	loop_2070
	tl	%xcc,	0x1
	orncc	%g6,	0x0B88,	%i6
	wr	%g0,	0x89,	%asi
	lduba	[%l7 + 0x33] %asi,	%l3
loop_2070:
	sllx	%l6,	0x02,	%i5
	sir	0x0EBD
	andcc	%g4,	%o2,	%l4
	tvs	%xcc,	0x3
	fmovdleu	%icc,	%f21,	%f5
	edge32l	%g1,	%i4,	%l5
	movl	%icc,	%l0,	%o0
	lduh	[%l7 + 0x48],	%i1
	fsrc2	%f6,	%f6
	set	0x24, %i1
	ldswa	[%l7 + %i1] 0x80,	%i0
	movleu	%xcc,	%l1,	%g2
	swap	[%l7 + 0x54],	%i3
	set	0x56, %o6
	ldsha	[%l7 + %o6] 0x19,	%o4
	edge32	%l2,	%o1,	%o3
	fcmple32	%f2,	%f4,	%g7
	bcc,a,pt	%xcc,	loop_2071
	add	%g5,	%o7,	%o5
	fbne	%fcc2,	loop_2072
	flush	%l7 + 0x6C
loop_2071:
	edge32n	%i7,	%i2,	%g3
	movl	%icc,	%g6,	%o6
loop_2072:
	nop
	add	%l7,	0x18,	%l6
	wr	%g0,	0x18,	%asi
	ldxa	[%l6] %asi,	%i6
	casxa	[%l6] 0x18,	%i6,	%l3
	ldd	[%l7 + 0x10],	%i6
	array32	%i5,	%g4,	%o2
	umul	%g1,	%i4,	%l4
	fba	%fcc1,	loop_2073
	tsubcctv	%l5,	%o0,	%l0
	fmul8x16	%f2,	%f30,	%f26
	fcmpes	%fcc3,	%f3,	%f13
loop_2073:
	st	%f10,	[%l7 + 0x54]
	subccc	%i0,	0x0856,	%l1
	fmovrslz	%i1,	%f9,	%f22
	tsubcctv	%i3,	%o4,	%g2
	wr	%g0,	0x27,	%asi
	stba	%o1,	[%l7 + 0x2B] %asi
	membar	#Sync
	movrlz	%o3,	%l2,	%g5
	movrne	%g7,	%o5,	%o7
	brgez,a	%i7,	loop_2074
	flush	%l7 + 0x68
	tle	%xcc,	0x4
	mulx	%i2,	%g3,	%g6
loop_2074:
	bg,a,pt	%icc,	loop_2075
	alignaddrl	%o6,	%i6,	%l3
	tcc	%xcc,	0x7
	movneg	%icc,	%l6,	%g4
loop_2075:
	andcc	%i5,	0x076D,	%g1
	edge16ln	%o2,	%i4,	%l4
	tsubcctv	%o0,	%l5,	%l0
	sir	0x1E96
	sir	0x1646
	tsubcc	%i0,	%l1,	%i1
	popc	0x0FAF,	%i3
	tleu	%icc,	0x2
	edge32n	%g2,	%o4,	%o1
	fabsd	%f28,	%f2
	fbe	%fcc2,	loop_2076
	sll	%l2,	0x12,	%g5
	movcs	%icc,	%o3,	%g7
	add	%l7,	0x4C,	%l6
	wr	%g0,	0x11,	%asi
	lda	[%l6] %asi,	%o7
	casa	[%l6] %asi,	%o7,	%o5
loop_2076:
	orcc	%i7,	0x02E4,	%g3
	tpos	%icc,	0x1
	bcc,pt	%icc,	loop_2077
	fmovrsgez	%i2,	%f16,	%f15
	sth	%o6,	[%l7 + 0x6E]
	tcc	%icc,	0x6
loop_2077:
	bvs,a	loop_2078
	fbl	%fcc0,	loop_2079
	fmovsge	%icc,	%f24,	%f22
	fbuge,a	%fcc3,	loop_2080
loop_2078:
	movne	%icc,	%g6,	%l3
loop_2079:
	tle	%xcc,	0x4
	array16	%i6,	%g4,	%l6
loop_2080:
	fmovdn	%xcc,	%f16,	%f9
	taddcctv	%g1,	0x17C2,	%o2
	set	0x2E, %l2
	ldsha	[%l7 + %l2] 0x11,	%i5
	fxor	%f8,	%f30,	%f4
	tne	%icc,	0x3
	fcmpd	%fcc2,	%f10,	%f20
	orncc	%l4,	0x131B,	%i4
	fcmpgt32	%f14,	%f12,	%o0
	stbar
	bshuffle	%f10,	%f10,	%f4
	tle	%xcc,	0x7
	taddcc	%l5,	%i0,	%l1
	bvs,pt	%icc,	loop_2081
	bcc,a,pt	%icc,	loop_2082
	taddcc	%l0,	%i1,	%g2
	sdiv	%o4,	0x125C,	%o1
loop_2081:
	lduw	[%l7 + 0x08],	%l2
loop_2082:
	siam	0x5
	set	0x74, %g1
	ldswa	[%l7 + %g1] 0x80,	%i3
	faligndata	%f28,	%f28,	%f20
	bvs,a,pn	%xcc,	loop_2083
	tpos	%xcc,	0x7
	udivx	%g5,	0x1E3B,	%g7
	movrgz	%o3,	0x07E,	%o7
loop_2083:
	xor	%i7,	0x1E9B,	%o5
	movn	%icc,	%i2,	%o6
	ld	[%l7 + 0x6C],	%f9
	or	%g6,	0x0CF5,	%l3
	set	0x38, %i2
	lduha	[%l7 + %i2] 0x0c,	%i6
	wr	%g0,	0x80,	%asi
	prefetcha	[%l7 + 0x70] %asi,	 0x3
	movl	%xcc,	%g3,	%g1
	membar	0x3D
	smul	%o2,	%l6,	%i5
	for	%f28,	%f4,	%f8
	fpsub16	%f0,	%f18,	%f30
	and	%l4,	%i4,	%o0
	sll	%l5,	%l1,	%i0
	wr	%g0,	0x89,	%asi
	lduba	[%l7 + 0x6B] %asi,	%l0
	fmovrdlz	%i1,	%f20,	%f14
	tle	%icc,	0x0
	addcc	%g2,	0x115C,	%o1
	fcmpne32	%f30,	%f0,	%l2
	mova	%icc,	%o4,	%g5
	fmovdg	%icc,	%f13,	%f5
	orcc	%i3,	0x1342,	%g7
	add	%o3,	0x0276,	%i7
	set	0x74, %l3
	lduwa	[%l7 + %l3] 0x14,	%o7
	brlz,a	%o5,	loop_2084
	add	%o6,	%i2,	%g6
	ldd	[%l7 + 0x70],	%f18
	bne,a,pt	%icc,	loop_2085
loop_2084:
	bpos,a,pn	%icc,	loop_2086
	movre	%i6,	%g4,	%g3
	srl	%l3,	%o2,	%g1
loop_2085:
	movrne	%i5,	%l6,	%i4
loop_2086:
	fmovrsne	%l4,	%f27,	%f12
	fmovsle	%xcc,	%f5,	%f18
	udivcc	%o0,	0x0DC6,	%l1
	edge16n	%l5,	%l0,	%i0
	fcmpgt32	%f24,	%f14,	%g2
	sir	0x1DC9
	array8	%o1,	%i1,	%l2
	and	%g5,	%i3,	%g7
	movg	%xcc,	%o4,	%i7
	sra	%o3,	0x14,	%o5
	movcc	%xcc,	%o6,	%i2
	fbe,a	%fcc1,	loop_2087
	orcc	%o7,	%g6,	%g4
	array32	%g3,	%i6,	%l3
	fones	%f29
loop_2087:
	orncc	%g1,	0x1607,	%i5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xorcc	%l6,	0x03EC,	%o2
	andcc	%i4,	0x03F5,	%l4
	fmovdgu	%icc,	%f21,	%f22
	tle	%xcc,	0x7
	fblg,a	%fcc1,	loop_2088
	movne	%icc,	%o0,	%l1
	bg,pn	%xcc,	loop_2089
	fmovrdgez	%l0,	%f26,	%f10
loop_2088:
	nop
	set	0x08, %i6
	ldswa	[%l7 + %i6] 0x18,	%i0
loop_2089:
	or	%l5,	0x02F9,	%g2
	bge,a	loop_2090
	movrlez	%i1,	0x014,	%o1
	fmul8x16al	%f5,	%f3,	%f2
	add	%l7,	0x3C,	%l6
	wr	%g0,	0x0c,	%asi
	lda	[%l6] %asi,	%g5
	casa	[%l6] 0x0c,	%g5,	%i3
loop_2090:
	movg	%icc,	%l2,	%o4
	fandnot1	%f22,	%f8,	%f18
	subc	%i7,	0x1D56,	%g7
	edge8n	%o3,	%o6,	%i2
	movleu	%icc,	%o7,	%g6
	nop
	set	0x38, %i5
	std	%o4,	[%l7 + %i5]
	edge32l	%g4,	%i6,	%g3
	tcc	%xcc,	0x5
	ldsb	[%l7 + 0x56],	%l3
	movg	%xcc,	%i5,	%l6
	movge	%xcc,	%g1,	%o2
	mulx	%i4,	0x1994,	%o0
	edge8	%l1,	%l4,	%i0
	mulscc	%l0,	%l5,	%g2
	bvs	%icc,	loop_2091
	orcc	%i1,	%o1,	%g5
	bcc,a,pt	%xcc,	loop_2092
	sdivx	%l2,	0x122B,	%i3
loop_2091:
	fcmpd	%fcc3,	%f18,	%f8
	srlx	%i7,	0x1A,	%o4
loop_2092:
	fpmerge	%f12,	%f17,	%f16
	movvs	%xcc,	%g7,	%o6
	srl	%i2,	0x01,	%o7
	srlx	%g6,	%o5,	%o3
	umul	%i6,	0x14D1,	%g3
	tg	%icc,	0x6
	movg	%icc,	%g4,	%l3
	ldstub	[%l7 + 0x1E],	%l6
	array32	%i5,	%o2,	%g1
	sdiv	%o0,	0x0191,	%i4
	tle	%icc,	0x3
	movrne	%l4,	0x351,	%l1
	mulx	%l0,	0x086B,	%i0
	movvc	%xcc,	%g2,	%l5
	fxors	%f23,	%f5,	%f10
	movrgz	%i1,	%g5,	%o1
	sethi	0x1275,	%l2
	addcc	%i7,	%o4,	%i3
	edge8ln	%g7,	%i2,	%o7
	fmuld8ulx16	%f4,	%f10,	%f28
	mova	%icc,	%o6,	%g6
	smul	%o5,	0x0D93,	%o3
	fabsd	%f20,	%f4
	bge,a,pn	%icc,	loop_2093
	tpos	%xcc,	0x5
	ta	%icc,	0x5
	edge32n	%g3,	%i6,	%l3
loop_2093:
	tvs	%xcc,	0x4
	umulcc	%l6,	%g4,	%i5
	fand	%f16,	%f2,	%f28
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdiv	%g1,	0x0A71,	%o2
	movg	%xcc,	%i4,	%l4
	add	%l7,	0x6C,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%l1
	casa	[%l6] 0x89,	%l1,	%l0
	add	%o0,	0x0DDD,	%i0
	bn	loop_2094
	stx	%g2,	[%l7 + 0x68]
	fandnot1	%f12,	%f22,	%f30
	fpack32	%f18,	%f12,	%f16
loop_2094:
	bcs,pn	%icc,	loop_2095
	fmovdn	%xcc,	%f13,	%f13
	pdist	%f28,	%f2,	%f18
	tgu	%xcc,	0x4
loop_2095:
	fbuge	%fcc2,	loop_2096
	fmovdcs	%xcc,	%f7,	%f17
	fmovdpos	%icc,	%f20,	%f5
	movrgz	%i1,	0x17E,	%g5
loop_2096:
	fzero	%f16
	add	%l7,	0x7C,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] %asi,	%o1,	%l5
	srl	%i7,	0x15,	%o4
	tsubcctv	%l2,	0x1EA9,	%i3
	alignaddr	%g7,	%o7,	%i2
	fmovse	%xcc,	%f9,	%f3
	fmovrdne	%g6,	%f16,	%f26
	bleu	%icc,	loop_2097
	umulcc	%o5,	0x0E49,	%o3
	ldx	[%l7 + 0x78],	%g3
	sllx	%i6,	%l3,	%l6
loop_2097:
	edge8	%g4,	%o6,	%i5
	fmovdcs	%xcc,	%f30,	%f22
	set	0x4C, %o5
	stwa	%g1,	[%l7 + %o5] 0x88
	tcc	%xcc,	0x2
	fmovdleu	%icc,	%f31,	%f14
	brgz	%o2,	loop_2098
	edge16	%l4,	%i4,	%l1
	srax	%o0,	0x01,	%l0
	fmovrdlz	%g2,	%f22,	%f26
loop_2098:
	ldsw	[%l7 + 0x7C],	%i1
	ta	%icc,	0x5
	for	%f4,	%f6,	%f16
	movcs	%icc,	%g5,	%o1
	bneg,a,pn	%xcc,	loop_2099
	addccc	%l5,	0x169C,	%i7
	fmovsge	%icc,	%f6,	%f20
	fmovdleu	%icc,	%f16,	%f15
loop_2099:
	udivcc	%o4,	0x1973,	%i0
	tge	%icc,	0x5
	std	%f8,	[%l7 + 0x18]
	swap	[%l7 + 0x38],	%l2
	sethi	0x1E8E,	%g7
	set	0x18, %l5
	ldsha	[%l7 + %l5] 0x11,	%o7
	movge	%icc,	%i3,	%i2
	sub	%g6,	%o5,	%o3
	subccc	%i6,	0x0566,	%g3
	tleu	%xcc,	0x5
	fpmerge	%f24,	%f13,	%f4
	fcmpgt16	%f28,	%f14,	%l6
	ba,pn	%icc,	loop_2100
	sdivx	%l3,	0x0840,	%g4
	tvs	%xcc,	0x3
	smul	%i5,	%g1,	%o2
loop_2100:
	tsubcc	%o6,	0x0472,	%i4
	move	%xcc,	%l1,	%o0
	bpos	loop_2101
	movre	%l0,	%g2,	%l4
	set	0x18, %l1
	stxa	%i1,	[%l7 + %l1] 0x81
loop_2101:
	fmovsgu	%icc,	%f27,	%f28
	alignaddrl	%o1,	%g5,	%i7
	fbul	%fcc2,	loop_2102
	siam	0x0
	call	loop_2103
	smul	%o4,	0x02EE,	%i0
loop_2102:
	alignaddrl	%l2,	%l5,	%o7
	edge8n	%g7,	%i3,	%g6
loop_2103:
	movle	%icc,	%o5,	%o3
	alignaddrl	%i6,	%g3,	%l6
	move	%icc,	%i2,	%g4
	tge	%xcc,	0x0
	set	0x34, %o0
	ldsba	[%l7 + %o0] 0x04,	%l3
	bcs	loop_2104
	movrgez	%g1,	0x2ED,	%i5
	tcc	%icc,	0x0
	movg	%xcc,	%o2,	%o6
loop_2104:
	tgu	%xcc,	0x6
	sllx	%i4,	%o0,	%l1
	fbuge,a	%fcc3,	loop_2105
	fpsub32s	%f26,	%f22,	%f8
	array16	%g2,	%l0,	%l4
	fandnot1	%f16,	%f20,	%f12
loop_2105:
	lduw	[%l7 + 0x70],	%i1
	tn	%icc,	0x4
	bcc,a	loop_2106
	edge16l	%o1,	%i7,	%g5
	edge8l	%o4,	%l2,	%l5
	bcs,pn	%xcc,	loop_2107
loop_2106:
	fbul	%fcc0,	loop_2108
	fandnot2	%f4,	%f26,	%f14
	movg	%xcc,	%o7,	%i0
loop_2107:
	smulcc	%i3,	0x1E4C,	%g6
loop_2108:
	nop
	set	0x60, %i0
	swapa	[%l7 + %i0] 0x10,	%o5
	bvs	loop_2109
	and	%g7,	0x0C46,	%o3
	fornot2	%f4,	%f24,	%f14
	edge16ln	%i6,	%g3,	%l6
loop_2109:
	smulcc	%g4,	%l3,	%g1
	fmovdg	%xcc,	%f17,	%f27
	movre	%i5,	%o2,	%i2
	fba,a	%fcc1,	loop_2110
	sll	%i4,	%o0,	%o6
	fbuge	%fcc3,	loop_2111
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2110:
	fmovdneg	%xcc,	%f12,	%f24
	subc	%l1,	%g2,	%l0
loop_2111:
	andncc	%l4,	%i1,	%i7
	add	%o1,	0x0DE0,	%g5
	fbg,a	%fcc0,	loop_2112
	fcmps	%fcc3,	%f13,	%f5
	membar	0x68
	fbge,a	%fcc3,	loop_2113
loop_2112:
	fmovrdgez	%o4,	%f20,	%f28
	movne	%xcc,	%l2,	%o7
	fmovrsne	%i0,	%f3,	%f6
loop_2113:
	tne	%icc,	0x4
	sll	%l5,	0x0C,	%i3
	tge	%xcc,	0x0
	orn	%g6,	0x0F8D,	%o5
	edge32ln	%o3,	%i6,	%g7
	fmovd	%f2,	%f2
	edge8n	%l6,	%g4,	%g3
	subc	%l3,	0x1827,	%g1
	swap	[%l7 + 0x20],	%i5
	wr	%g0,	0x80,	%asi
	stba	%i2,	[%l7 + 0x0F] %asi
	bshuffle	%f26,	%f20,	%f26
	sub	%o2,	0x0F29,	%i4
	fbuge,a	%fcc1,	loop_2114
	fmuld8ulx16	%f23,	%f27,	%f24
	lduw	[%l7 + 0x50],	%o6
	wr	%g0,	0x11,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
loop_2114:
	sethi	0x03AB,	%l1
	addc	%g2,	%l0,	%l4
	fmovrse	%i1,	%f24,	%f6
	sdivcc	%i7,	0x099B,	%o0
	fbug,a	%fcc2,	loop_2115
	fmovsg	%xcc,	%f12,	%f1
	ble,pt	%xcc,	loop_2116
	std	%o0,	[%l7 + 0x38]
loop_2115:
	nop
	wr	%g0,	0x81,	%asi
	lda	[%l7 + 0x18] %asi,	%f14
loop_2116:
	ldstub	[%l7 + 0x77],	%g5
	fnors	%f30,	%f15,	%f14
	orn	%o4,	0x060E,	%o7
	movgu	%icc,	%l2,	%l5
	fmovdn	%xcc,	%f7,	%f27
	sethi	0x1D47,	%i3
	movvs	%xcc,	%i0,	%o5
	mova	%icc,	%o3,	%g6
	fors	%f5,	%f6,	%f5
	umulcc	%g7,	0x1298,	%l6
	sdivcc	%i6,	0x127F,	%g4
	ta	%icc,	0x6
	or	%g3,	%l3,	%g1
	umul	%i5,	%i2,	%o2
	move	%xcc,	%i4,	%o6
	popc	%g2,	%l0
	tvs	%icc,	0x5
	fandnot1	%f14,	%f2,	%f16
	ta	%icc,	0x2
	movrgez	%l4,	%i1,	%l1
	nop
	setx loop_2117, %l0, %l1
	jmpl %l1, %o0
	edge16	%o1,	%g5,	%o4
	tg	%icc,	0x3
	stw	%i7,	[%l7 + 0x54]
loop_2117:
	fxors	%f9,	%f15,	%f31
	fbu	%fcc0,	loop_2118
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	or	%o7,	0x1526,	%l5
	xorcc	%i3,	0x1EC1,	%l2
loop_2118:
	movcs	%icc,	%i0,	%o3
	xnorcc	%g6,	0x0144,	%g7
	brz,a	%l6,	loop_2119
	edge32n	%i6,	%o5,	%g3
	tgu	%xcc,	0x7
	mulscc	%l3,	0x1589,	%g4
loop_2119:
	stb	%i5,	[%l7 + 0x5F]
	set	0x78, %l0
	prefetcha	[%l7 + %l0] 0x10,	 0x0
	fbule,a	%fcc2,	loop_2120
	bg,a,pt	%icc,	loop_2121
	tg	%xcc,	0x2
	mova	%xcc,	%i2,	%i4
loop_2120:
	bgu,a	loop_2122
loop_2121:
	fandnot1	%f14,	%f8,	%f8
	or	%o6,	%o2,	%l0
	te	%xcc,	0x0
loop_2122:
	edge8n	%l4,	%g2,	%i1
	brlz	%o0,	loop_2123
	fxor	%f4,	%f20,	%f20
	edge32n	%l1,	%o1,	%g5
	fxor	%f12,	%f10,	%f24
loop_2123:
	fandnot2	%f14,	%f8,	%f8
	brlz,a	%i7,	loop_2124
	movl	%xcc,	%o7,	%o4
	nop
	setx loop_2125, %l0, %l1
	jmpl %l1, %l5
	mulscc	%i3,	%l2,	%i0
loop_2124:
	popc	0x1CFC,	%g6
	tle	%icc,	0x4
loop_2125:
	call	loop_2126
	fabss	%f16,	%f0
	fmovrdgz	%o3,	%f6,	%f14
	fbl	%fcc3,	loop_2127
loop_2126:
	tn	%icc,	0x2
	smul	%l6,	0x0CA4,	%g7
	fmul8x16al	%f12,	%f29,	%f2
loop_2127:
	movne	%icc,	%o5,	%i6
	movre	%l3,	0x32F,	%g3
	andcc	%i5,	0x1AB9,	%g4
	bvc,pn	%xcc,	loop_2128
	smulcc	%i2,	%i4,	%g1
	movleu	%icc,	%o2,	%o6
	fornot1	%f6,	%f30,	%f28
loop_2128:
	fnands	%f21,	%f5,	%f8
	fzero	%f8
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array16	%l0,	%g2,	%l4
	movrgez	%i1,	0x3A5,	%o0
	fabss	%f3,	%f27
	edge16l	%o1,	%l1,	%g5
	tpos	%xcc,	0x6
	tsubcc	%o7,	0x0AF2,	%i7
	te	%xcc,	0x7
	srax	%o4,	0x04,	%l5
	tcc	%xcc,	0x0
	fble	%fcc0,	loop_2129
	movle	%xcc,	%l2,	%i3
	movpos	%xcc,	%g6,	%i0
	fpack32	%f12,	%f0,	%f20
loop_2129:
	sllx	%o3,	%g7,	%o5
	movvc	%xcc,	%l6,	%l3
	xnorcc	%g3,	%i5,	%i6
	edge16n	%i2,	%g4,	%g1
	subc	%i4,	%o2,	%o6
	movvs	%xcc,	%g2,	%l4
	move	%icc,	%i1,	%o0
	srax	%o1,	0x10,	%l0
	movrlez	%g5,	0x283,	%o7
	bl,a,pn	%xcc,	loop_2130
	fbl	%fcc1,	loop_2131
	fmul8sux16	%f6,	%f10,	%f4
	nop
	set	0x08, %o4
	ldd	[%l7 + %o4],	%f4
loop_2130:
	movpos	%xcc,	%i7,	%l1
loop_2131:
	umulcc	%o4,	%l5,	%l2
	fmovspos	%icc,	%f7,	%f4
	taddcctv	%g6,	%i0,	%i3
	movrgez	%g7,	%o3,	%l6
	sll	%o5,	0x11,	%g3
	brlez,a	%i5,	loop_2132
	movre	%i6,	0x0E8,	%i2
	movrgez	%g4,	0x20F,	%l3
	bgu,a,pn	%icc,	loop_2133
loop_2132:
	movvs	%xcc,	%i4,	%g1
	fxor	%f14,	%f2,	%f10
	movrgz	%o6,	%o2,	%g2
loop_2133:
	lduh	[%l7 + 0x30],	%i1
	fsrc1	%f10,	%f20
	orncc	%o0,	0x171B,	%o1
	orn	%l0,	%g5,	%l4
	fnot2	%f0,	%f0
	be,pn	%icc,	loop_2134
	tvs	%icc,	0x5
	umul	%o7,	%l1,	%i7
	stbar
loop_2134:
	tne	%icc,	0x7
	tvs	%icc,	0x3
	movcs	%xcc,	%l5,	%o4
	tsubcctv	%l2,	%i0,	%g6
	tneg	%xcc,	0x1
	movge	%icc,	%g7,	%i3
	edge16l	%o3,	%l6,	%o5
	sdivcc	%i5,	0x0B92,	%i6
	sub	%i2,	%g4,	%l3
	andn	%g3,	0x1C0D,	%i4
	lduw	[%l7 + 0x08],	%g1
	movrgz	%o6,	%g2,	%i1
	wr	%g0,	0x18,	%asi
	lduha	[%l7 + 0x4E] %asi,	%o0
	sll	%o1,	0x1E,	%o2
	std	%f8,	[%l7 + 0x10]
	popc	%g5,	%l0
	edge8l	%o7,	%l4,	%i7
	sdiv	%l1,	0x0949,	%l5
	tcs	%icc,	0x6
	udiv	%o4,	0x1337,	%i0
	tne	%xcc,	0x6
	movg	%xcc,	%g6,	%g7
	fcmpgt16	%f6,	%f26,	%l2
	smul	%o3,	0x1915,	%i3
	ldx	[%l7 + 0x38],	%l6
	set	0x16, %o7
	stha	%o5,	[%l7 + %o7] 0x2b
	membar	#Sync
	tl	%xcc,	0x0
	bleu,a,pt	%xcc,	loop_2135
	tcc	%xcc,	0x0
	tn	%icc,	0x0
	bcc,pn	%icc,	loop_2136
loop_2135:
	fbuge	%fcc2,	loop_2137
	ldsw	[%l7 + 0x18],	%i5
	fmovd	%f4,	%f4
loop_2136:
	nop
	set	0x08, %g2
	lda	[%l7 + %g2] 0x04,	%f20
loop_2137:
	fnot2	%f26,	%f8
	movcs	%icc,	%i2,	%g4
	tvs	%icc,	0x5
	fmovrsgz	%l3,	%f0,	%f11
	bleu,a	loop_2138
	edge32	%g3,	%i6,	%i4
	tvc	%icc,	0x2
	brgz	%o6,	loop_2139
loop_2138:
	fbn,a	%fcc1,	loop_2140
	fpmerge	%f0,	%f23,	%f20
	wr	%g0,	0x0c,	%asi
	stha	%g2,	[%l7 + 0x38] %asi
loop_2139:
	edge32n	%g1,	%i1,	%o0
loop_2140:
	move	%xcc,	%o2,	%o1
	fmovdgu	%xcc,	%f4,	%f17
	fmovrse	%l0,	%f5,	%f16
	mulscc	%o7,	0x1C34,	%l4
	fnot2s	%f1,	%f0
	prefetch	[%l7 + 0x5C],	 0x1
	flush	%l7 + 0x4C
	mulscc	%g5,	0x18A1,	%i7
	ld	[%l7 + 0x0C],	%f22
	alignaddrl	%l1,	%o4,	%i0
	fnands	%f7,	%f10,	%f11
	ldd	[%l7 + 0x10],	%f14
	ldsh	[%l7 + 0x42],	%g6
	brgz	%g7,	loop_2141
	andncc	%l2,	%l5,	%o3
	fmovdge	%icc,	%f12,	%f26
	fsrc1	%f22,	%f16
loop_2141:
	fbne,a	%fcc2,	loop_2142
	flush	%l7 + 0x68
	ble,pn	%icc,	loop_2143
	fmovscs	%xcc,	%f21,	%f24
loop_2142:
	sllx	%i3,	0x01,	%o5
	srlx	%l6,	0x1F,	%i5
loop_2143:
	sir	0x1810
	ld	[%l7 + 0x14],	%f6
	movge	%icc,	%g4,	%l3
	brgz	%g3,	loop_2144
	fmovsle	%icc,	%f13,	%f6
	edge16	%i6,	%i4,	%o6
	xorcc	%g2,	%g1,	%i1
loop_2144:
	bg	loop_2145
	tne	%xcc,	0x7
	udivcc	%i2,	0x15F1,	%o0
	move	%icc,	%o2,	%o1
loop_2145:
	fmovrdlez	%l0,	%f0,	%f28
	tneg	%xcc,	0x6
	add	%o7,	0x0B9B,	%l4
	array32	%g5,	%l1,	%i7
	taddcctv	%o4,	0x1ED2,	%g6
	edge32l	%g7,	%i0,	%l2
	std	%f14,	[%l7 + 0x60]
	sdiv	%o3,	0x09E8,	%i3
	taddcctv	%l5,	%l6,	%o5
	xnor	%i5,	%l3,	%g3
	fmovdvs	%icc,	%f10,	%f5
	and	%i6,	%i4,	%g4
	xnor	%o6,	0x1AA8,	%g1
	orncc	%i1,	0x1571,	%g2
	movl	%xcc,	%i2,	%o2
	movle	%xcc,	%o0,	%o1
	fand	%f18,	%f4,	%f6
	lduw	[%l7 + 0x78],	%l0
	fbue	%fcc1,	loop_2146
	bvs,a	loop_2147
	brlz,a	%l4,	loop_2148
	ldsw	[%l7 + 0x54],	%o7
loop_2146:
	edge32l	%g5,	%l1,	%i7
loop_2147:
	edge32	%g6,	%o4,	%i0
loop_2148:
	tleu	%xcc,	0x2
	bl,a	%icc,	loop_2149
	brz,a	%g7,	loop_2150
	brgz,a	%l2,	loop_2151
	fbule,a	%fcc3,	loop_2152
loop_2149:
	movg	%xcc,	%o3,	%i3
loop_2150:
	fbule,a	%fcc3,	loop_2153
loop_2151:
	fcmple32	%f10,	%f26,	%l6
loop_2152:
	udivx	%o5,	0x118D,	%l5
	nop
	setx	loop_2154,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_2153:
	nop
	setx	loop_2155,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	brz	%l3,	loop_2156
	andncc	%i5,	%i6,	%i4
loop_2154:
	movrlez	%g3,	0x034,	%g4
loop_2155:
	fba	%fcc2,	loop_2157
loop_2156:
	movpos	%icc,	%o6,	%i1
	wr	%g0,	0x04,	%asi
	lduwa	[%l7 + 0x64] %asi,	%g2
loop_2157:
	nop
	setx loop_2158, %l0, %l1
	jmpl %l1, %g1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tvc	%xcc,	0x7
	movne	%xcc,	%o2,	%i2
loop_2158:
	move	%icc,	%o1,	%o0
	edge8ln	%l0,	%l4,	%g5
	edge8ln	%l1,	%o7,	%i7
	movl	%icc,	%o4,	%i0
	fbu,a	%fcc3,	loop_2159
	add	%g6,	%l2,	%o3
	movvs	%icc,	%g7,	%i3
	stx	%o5,	[%l7 + 0x18]
loop_2159:
	nop
	wr	%g0,	0x80,	%asi
	ldxa	[%l7 + 0x38] %asi,	%l6
	tle	%xcc,	0x4
	tge	%icc,	0x4
	subc	%l3,	0x0D6F,	%l5
	fbne,a	%fcc3,	loop_2160
	orcc	%i5,	0x00CE,	%i6
	alignaddrl	%g3,	%g4,	%i4
	edge8ln	%o6,	%i1,	%g2
loop_2160:
	nop
	wr	%g0,	0x80,	%asi
	stha	%o2,	[%l7 + 0x24] %asi
	move	%icc,	%i2,	%g1
	movvs	%icc,	%o0,	%o1
	bcs,a	loop_2161
	fbul	%fcc1,	loop_2162
	movvc	%xcc,	%l0,	%g5
	stbar
loop_2161:
	bne	loop_2163
loop_2162:
	sllx	%l1,	0x04,	%o7
	tleu	%xcc,	0x4
	fzeros	%f23
loop_2163:
	st	%f8,	[%l7 + 0x28]
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tsubcctv	%i7,	%o4,	%l4
	sdivcc	%g6,	0x0A68,	%i0
	fmovdvs	%xcc,	%f17,	%f30
	subccc	%o3,	0x0410,	%l2
	movle	%xcc,	%g7,	%o5
	edge8ln	%l6,	%i3,	%l3
	tpos	%icc,	0x7
	movl	%icc,	%i5,	%i6
	wr	%g0,	0x80,	%asi
	ldswa	[%l7 + 0x70] %asi,	%g3
	swap	[%l7 + 0x58],	%g4
	tsubcctv	%l5,	%i4,	%o6
	fzeros	%f14
	wr	%g0,	0x11,	%asi
	ldxa	[%l7 + 0x68] %asi,	%i1
	andcc	%g2,	0x1957,	%o2
	brlez,a	%i2,	loop_2164
	sra	%o0,	0x10,	%o1
	edge16	%l0,	%g5,	%l1
	membar	0x1E
loop_2164:
	subcc	%o7,	%i7,	%o4
	addccc	%g1,	%g6,	%l4
	sllx	%o3,	%i0,	%g7
	xnor	%l2,	0x0ABE,	%l6
	bcc,a	loop_2165
	nop
	set	0x78, %i4
	ldsw	[%l7 + %i4],	%i3
	sdiv	%o5,	0x11C7,	%i5
	tne	%icc,	0x5
loop_2165:
	xor	%i6,	0x05D6,	%l3
	subc	%g3,	%l5,	%g4
	fmovrdgez	%i4,	%f6,	%f18
	fsrc2s	%f26,	%f28
	stb	%i1,	[%l7 + 0x15]
	fmovscc	%icc,	%f14,	%f24
	stbar
	bcs,a,pn	%xcc,	loop_2166
	fmovsa	%xcc,	%f10,	%f27
	movcs	%icc,	%g2,	%o2
	movrlz	%i2,	0x134,	%o6
loop_2166:
	fbn,a	%fcc3,	loop_2167
	bvs	%icc,	loop_2168
	brz,a	%o1,	loop_2169
	fbg	%fcc1,	loop_2170
loop_2167:
	movvc	%icc,	%l0,	%g5
loop_2168:
	fbne	%fcc2,	loop_2171
loop_2169:
	fmovdvc	%icc,	%f24,	%f13
loop_2170:
	movvs	%icc,	%l1,	%o7
	movrlz	%i7,	%o4,	%g1
loop_2171:
	mulx	%o0,	0x1EFA,	%g6
	wr	%g0,	0x19,	%asi
	ldsha	[%l7 + 0x3C] %asi,	%o3
	edge8l	%l4,	%g7,	%l2
	fmovsg	%icc,	%f29,	%f11
	sdivx	%i0,	0x0A14,	%i3
	sdivcc	%l6,	0x1BBA,	%i5
	wr	%g0,	0x89,	%asi
	ldsba	[%l7 + 0x5D] %asi,	%o5
	tneg	%icc,	0x6
	set	0x4C, %g3
	lda	[%l7 + %g3] 0x11,	%f7
	alignaddr	%i6,	%l3,	%g3
	orncc	%g4,	0x0919,	%i4
	tl	%xcc,	0x2
	wr	%g0,	0x89,	%asi
	stda	%i0,	[%l7 + 0x48] %asi
	set	0x40, %l4
	stda	%f16,	[%l7 + %l4] 0x17
	membar	#Sync
	fbug	%fcc2,	loop_2172
	addccc	%l5,	0x146A,	%o2
	sll	%i2,	%g2,	%o1
	bcc,pn	%icc,	loop_2173
loop_2172:
	popc	0x081A,	%l0
	alignaddr	%g5,	%l1,	%o7
	movvc	%xcc,	%o6,	%o4
loop_2173:
	edge16l	%g1,	%o0,	%i7
	fsrc1s	%f14,	%f5
	andn	%g6,	0x1470,	%o3
	movrlz	%g7,	0x133,	%l4
	edge32n	%i0,	%i3,	%l2
	fcmpgt32	%f30,	%f18,	%l6
	edge8	%i5,	%o5,	%l3
	fmovscc	%icc,	%f13,	%f23
	fcmpd	%fcc3,	%f14,	%f2
	st	%f26,	[%l7 + 0x10]
	orn	%i6,	%g4,	%i4
	sdiv	%i1,	0x05F1,	%g3
	bcc	loop_2174
	movvs	%icc,	%o2,	%i2
	edge32	%l5,	%o1,	%g2
	addccc	%l0,	%l1,	%g5
loop_2174:
	tne	%xcc,	0x0
	fbue	%fcc3,	loop_2175
	bne,pt	%xcc,	loop_2176
	tg	%icc,	0x3
	andn	%o7,	0x11A5,	%o6
loop_2175:
	fmovda	%icc,	%f23,	%f2
loop_2176:
	be,pt	%xcc,	loop_2177
	bleu,pt	%xcc,	loop_2178
	edge16l	%g1,	%o0,	%o4
	edge32ln	%i7,	%o3,	%g6
loop_2177:
	udivcc	%g7,	0x0C05,	%i0
loop_2178:
	tn	%xcc,	0x1
	andncc	%l4,	%l2,	%i3
	nop
	set	0x30, %o1
	lduh	[%l7 + %o1],	%i5
	fmovdcc	%icc,	%f26,	%f16
	orncc	%l6,	0x1945,	%l3
	set	0x18, %o3
	prefetcha	[%l7 + %o3] 0x04,	 0x1
	fmovrdlz	%i6,	%f24,	%f28
	fabsd	%f28,	%f18
	fbule,a	%fcc1,	loop_2179
	fmovda	%xcc,	%f17,	%f14
	fmovdcs	%xcc,	%f11,	%f17
	fcmpeq16	%f30,	%f4,	%g4
loop_2179:
	popc	0x131E,	%i1
	srl	%i4,	0x03,	%g3
	alignaddrl	%i2,	%o2,	%l5
	movcc	%xcc,	%o1,	%l0
	fmul8x16au	%f15,	%f4,	%f4
	fcmpne32	%f0,	%f10,	%l1
	stw	%g5,	[%l7 + 0x10]
	set	0x2F, %g4
	stba	%o7,	[%l7 + %g4] 0x14
	membar	0x13
	tleu	%icc,	0x1
	subc	%g2,	0x1826,	%o6
	tcs	%xcc,	0x6
	edge16n	%o0,	%g1,	%o4
	srax	%i7,	%g6,	%o3
	sir	0x0061
	ta	%icc,	0x2
	add	%l7,	0x6C,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%g7,	%l4
	sdivcc	%i0,	0x18CD,	%l2
	movvc	%icc,	%i3,	%i5
	bl,a	%icc,	loop_2180
	tpos	%xcc,	0x6
	ldsh	[%l7 + 0x5C],	%l3
	tvc	%icc,	0x6
loop_2180:
	fba	%fcc0,	loop_2181
	movgu	%icc,	%l6,	%o5
	fpadd16s	%f5,	%f30,	%f5
	movl	%icc,	%i6,	%i1
loop_2181:
	nop
	setx loop_2182, %l0, %l1
	jmpl %l1, %g4
	srlx	%i4,	%i2,	%o2
	sra	%l5,	0x0E,	%o1
	movleu	%icc,	%g3,	%l0
loop_2182:
	tsubcctv	%g5,	0x1D1D,	%l1
	edge32n	%o7,	%g2,	%o6
	brlez,a	%o0,	loop_2183
	fcmpne32	%f4,	%f20,	%g1
	fcmpgt16	%f18,	%f12,	%i7
	siam	0x1
loop_2183:
	fmovd	%f4,	%f14
	fmul8x16al	%f27,	%f22,	%f26
	mova	%icc,	%o4,	%o3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
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
	edge32ln	%g7,	%g6,	%i0
	wr	%g0,	0x0c,	%asi
	stda	%l4,	[%l7 + 0x28] %asi
loop_2184:
	fpsub16	%f2,	%f12,	%f8
	subccc	%i3,	%i5,	%l3
	wr	%g0,	0x19,	%asi
	stba	%l6,	[%l7 + 0x37] %asi
	bpos,a,pt	%xcc,	loop_2185
	udiv	%o5,	0x1878,	%i6
	st	%f2,	[%l7 + 0x48]
	movvs	%icc,	%l2,	%g4
loop_2185:
	fsrc1s	%f29,	%f18
	fones	%f6
	ta	%icc,	0x0
	sdivx	%i4,	0x1BAA,	%i2
	ldsw	[%l7 + 0x14],	%o2
	taddcc	%l5,	0x12CD,	%i1
	or	%g3,	0x0677,	%l0
	fmul8x16au	%f2,	%f8,	%f4
	tg	%xcc,	0x3
	andn	%o1,	%l1,	%g5
	ta	%xcc,	0x4
	fmovscs	%xcc,	%f12,	%f10
	andn	%o7,	0x0354,	%g2
	fmovdle	%xcc,	%f16,	%f19
	membar	0x62
	nop
	set	0x10, %g5
	sth	%o0,	[%l7 + %g5]
	popc	0x1F7D,	%o6
	ldx	[%l7 + 0x30],	%g1
	mova	%xcc,	%o4,	%o3
	alignaddrl	%i7,	%g6,	%g7
	fornot1	%f30,	%f24,	%f0
	tg	%xcc,	0x3
	movn	%icc,	%i0,	%i3
	tg	%icc,	0x6
	fornot1	%f4,	%f12,	%f28
	array16	%i5,	%l4,	%l6
	std	%l2,	[%l7 + 0x18]
	fmovscs	%xcc,	%f28,	%f11
	smulcc	%o5,	%i6,	%l2
	edge8ln	%g4,	%i2,	%o2
	fmovsleu	%icc,	%f6,	%f8
	movcc	%icc,	%i4,	%i1
	movrgz	%l5,	%l0,	%g3
	or	%o1,	0x13CC,	%l1
	edge8	%o7,	%g2,	%g5
	ldstub	[%l7 + 0x37],	%o6
	movge	%icc,	%g1,	%o4
	fbn,a	%fcc3,	loop_2186
	edge16	%o3,	%i7,	%o0
	tle	%icc,	0x7
	fbule,a	%fcc3,	loop_2187
loop_2186:
	fcmpne16	%f26,	%f16,	%g6
	fxnor	%f12,	%f8,	%f28
	ble	%icc,	loop_2188
loop_2187:
	taddcctv	%i0,	0x1A49,	%i3
	xorcc	%g7,	0x0462,	%i5
	nop
	setx	loop_2189,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_2188:
	sub	%l4,	0x1620,	%l6
	array8	%l3,	%i6,	%o5
	te	%icc,	0x4
loop_2189:
	sir	0x0418
	udivcc	%l2,	0x04C5,	%i2
	addc	%o2,	%g4,	%i4
	fsrc2	%f24,	%f8
	fmovspos	%xcc,	%f0,	%f15
	tneg	%icc,	0x0
	andcc	%l5,	0x11FB,	%l0
	movre	%i1,	0x3BB,	%o1
	flush	%l7 + 0x24
	xorcc	%l1,	%g3,	%o7
	set	0x38, %i3
	stxa	%g2,	[%l7 + %i3] 0x18
	membar	0x51
	bgu	loop_2190
	fpadd16s	%f23,	%f14,	%f2
	fmovdcc	%icc,	%f1,	%f25
	movvc	%xcc,	%o6,	%g1
loop_2190:
	tleu	%icc,	0x6
	sir	0x1E63
	lduh	[%l7 + 0x3A],	%g5
	bgu,pn	%xcc,	loop_2191
	sir	0x0C84
	addc	%o4,	%o3,	%i7
	wr	%g0,	0x04,	%asi
	ldswa	[%l7 + 0x5C] %asi,	%g6
loop_2191:
	fxor	%f4,	%f8,	%f24
	movl	%icc,	%i0,	%i3
	fbn	%fcc0,	loop_2192
	mulx	%g7,	%i5,	%o0
	mulx	%l6,	%l4,	%i6
	fnot2s	%f19,	%f5
loop_2192:
	alignaddrl	%o5,	%l2,	%l3
	andcc	%o2,	0x01A5,	%g4
	move	%xcc,	%i4,	%i2
	fzero	%f24
	fmovscs	%icc,	%f1,	%f17
	alignaddr	%l5,	%l0,	%i1
	bvs	%icc,	loop_2193
	nop
	set	0x44, %i7
	ldsw	[%l7 + %i7],	%o1
	smulcc	%l1,	%o7,	%g3
	udivcc	%g2,	0x018D,	%o6
loop_2193:
	tsubcc	%g5,	%o4,	%g1
	fpsub16s	%f24,	%f9,	%f18
	membar	0x0E
	fcmpne16	%f24,	%f28,	%i7
	fbo,a	%fcc3,	loop_2194
	andn	%g6,	0x0252,	%i0
	taddcc	%i3,	%o3,	%g7
	bcs,a,pt	%icc,	loop_2195
loop_2194:
	subcc	%i5,	0x12A9,	%l6
	te	%icc,	0x0
	fsrc2	%f6,	%f18
loop_2195:
	brgez,a	%l4,	loop_2196
	fornot1	%f26,	%f12,	%f0
	set	0x34, %g7
	ldsha	[%l7 + %g7] 0x0c,	%o0
loop_2196:
	movvc	%xcc,	%i6,	%o5
	movcc	%icc,	%l3,	%l2
	movvc	%xcc,	%o2,	%g4
	tcs	%icc,	0x2
	andcc	%i2,	0x140B,	%l5
	orcc	%i4,	%i1,	%o1
	edge8	%l1,	%o7,	%l0
	smul	%g2,	%g3,	%g5
	tle	%icc,	0x5
	umul	%o4,	0x1863,	%o6
	bl,a	loop_2197
	tneg	%icc,	0x1
	edge32ln	%g1,	%i7,	%g6
	ldsb	[%l7 + 0x13],	%i0
loop_2197:
	edge8ln	%o3,	%i3,	%i5
	mulx	%g7,	0x027D,	%l4
	wr	%g0,	0x04,	%asi
	ldstuba	[%l7 + 0x15] %asi,	%o0
	te	%xcc,	0x2
	movrlez	%i6,	%o5,	%l6
	fba,a	%fcc3,	loop_2198
	sdiv	%l2,	0x1ADF,	%l3
	fcmped	%fcc0,	%f10,	%f14
	fcmpne32	%f20,	%f20,	%o2
loop_2198:
	movl	%icc,	%i2,	%l5
	xnor	%i4,	0x01C8,	%g4
	and	%o1,	0x0484,	%l1
	tcs	%xcc,	0x0
	fnegd	%f4,	%f30
	taddcc	%i1,	0x0C4E,	%o7
	sll	%g2,	%g3,	%g5
	bneg,a	%xcc,	loop_2199
	edge8n	%l0,	%o4,	%g1
	sra	%o6,	%g6,	%i7
	movn	%icc,	%o3,	%i0
loop_2199:
	movcc	%xcc,	%i5,	%g7
	mova	%xcc,	%l4,	%o0
	subccc	%i6,	0x037E,	%o5
	tle	%icc,	0x4
	smulcc	%i3,	%l2,	%l6
	ldd	[%l7 + 0x08],	%l2
	flush	%l7 + 0x30
	umul	%i2,	0x18CE,	%l5
	bneg,a,pt	%icc,	loop_2200
	move	%icc,	%o2,	%g4
	fmovde	%xcc,	%f11,	%f26
	fnot1s	%f23,	%f24
loop_2200:
	bcs,a,pt	%icc,	loop_2201
	fmovde	%xcc,	%f14,	%f25
	bcc,a	%icc,	loop_2202
	lduh	[%l7 + 0x72],	%i4
loop_2201:
	tgu	%xcc,	0x0
	fmul8x16au	%f9,	%f28,	%f18
loop_2202:
	fcmpne32	%f6,	%f10,	%o1
	movcc	%icc,	%i1,	%l1
	movvs	%xcc,	%g2,	%o7
	popc	0x0BF7,	%g5
	bne,a	loop_2203
	fbu	%fcc0,	loop_2204
	fnors	%f21,	%f11,	%f14
	move	%icc,	%g3,	%o4
loop_2203:
	fsrc2s	%f25,	%f25
loop_2204:
	srlx	%l0,	%o6,	%g6
	lduw	[%l7 + 0x34],	%i7
	tne	%xcc,	0x1
	fmovsl	%xcc,	%f3,	%f22
	edge32n	%g1,	%i0,	%o3
	te	%xcc,	0x1
	nop
	setx loop_2205, %l0, %l1
	jmpl %l1, %i5
	tsubcctv	%l4,	0x1919,	%g7
	array16	%i6,	%o5,	%o0
	fmovse	%xcc,	%f28,	%f19
loop_2205:
	alignaddr	%l2,	%l6,	%l3
	movre	%i2,	0x1EA,	%l5
	add	%o2,	0x0F51,	%g4
	srlx	%i3,	0x06,	%i4
	fmuld8ulx16	%f13,	%f17,	%f10
	set	0x43, %l6
	ldsba	[%l7 + %l6] 0x14,	%i1
	fexpand	%f2,	%f16
	movneg	%xcc,	%o1,	%l1
	xorcc	%g2,	0x14F9,	%o7
	fmovdge	%xcc,	%f11,	%f28
	movrgz	%g3,	%g5,	%o4
	fbe	%fcc3,	loop_2206
	xnorcc	%l0,	0x1FFA,	%g6
	set	0x3A, %g6
	stha	%o6,	[%l7 + %g6] 0x89
loop_2206:
	bl,a,pn	%icc,	loop_2207
	subccc	%g1,	%i0,	%o3
	movge	%icc,	%i5,	%l4
	xnorcc	%g7,	%i6,	%o5
loop_2207:
	fmovdleu	%icc,	%f1,	%f20
	fmovda	%xcc,	%f8,	%f22
	movne	%icc,	%o0,	%l2
	fbg,a	%fcc2,	loop_2208
	sdiv	%i7,	0x0DFE,	%l6
	sdivcc	%i2,	0x0354,	%l3
	taddcctv	%l5,	0x03A6,	%g4
loop_2208:
	ta	%xcc,	0x5
	movleu	%icc,	%i3,	%o2
	orcc	%i1,	0x1239,	%o1
	tne	%xcc,	0x1
	edge8ln	%l1,	%g2,	%i4
	fmovdn	%xcc,	%f27,	%f7
	set	0x10, %o2
	prefetcha	[%l7 + %o2] 0x11,	 0x2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orncc	%g5,	%o7,	%l0
	wr	%g0,	0x16,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
	movge	%icc,	%o4,	%o6
	edge8n	%g1,	%i0,	%g6
	fbl	%fcc2,	loop_2209
	sll	%i5,	%o3,	%g7
	andncc	%i6,	%l4,	%o0
	movleu	%xcc,	%o5,	%l2
loop_2209:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xorcc	%l6,	0x1A9B,	%i2
	fmovdneg	%xcc,	%f4,	%f0
	mulx	%i7,	%l3,	%l5
	fandnot2	%f6,	%f4,	%f12
	tl	%xcc,	0x1
	andcc	%g4,	%i3,	%i1
	movrgz	%o2,	0x3E9,	%o1
	xor	%g2,	%l1,	%i4
	fabss	%f28,	%f12
	taddcc	%g3,	%o7,	%l0
	fmovrdne	%g5,	%f14,	%f30
	subcc	%o4,	%g1,	%i0
	fxnors	%f14,	%f12,	%f0
	fpsub16s	%f31,	%f11,	%f15
	fbul	%fcc0,	loop_2210
	fors	%f26,	%f1,	%f1
	tl	%icc,	0x3
	fmovdl	%xcc,	%f10,	%f10
loop_2210:
	movg	%xcc,	%o6,	%g6
	fmovdge	%xcc,	%f23,	%f10
	edge16n	%o3,	%i5,	%g7
	bleu,a	%xcc,	loop_2211
	fmovdge	%icc,	%f13,	%f7
	fba,a	%fcc3,	loop_2212
	tn	%icc,	0x2
loop_2211:
	movrgz	%i6,	%l4,	%o0
	sdiv	%l2,	0x0D80,	%o5
loop_2212:
	sra	%i2,	0x16,	%l6
	array16	%i7,	%l5,	%g4
	ldub	[%l7 + 0x2D],	%l3
	fmul8x16au	%f5,	%f6,	%f12
	wr	%g0,	0x21,	%asi
	stxa	%i1,	[%g0 + 0x110] %asi
	edge8ln	%i3,	%o2,	%g2
	tcc	%icc,	0x3
	sll	%l1,	%o1,	%g3
	stbar
	mova	%icc,	%i4,	%o7
	taddcctv	%l0,	0x0131,	%g5
	movge	%icc,	%o4,	%i0
	xnorcc	%o6,	%g1,	%g6
	fsrc1s	%f1,	%f17
	movcc	%xcc,	%o3,	%i5
	fbule,a	%fcc1,	loop_2213
	fcmpne16	%f2,	%f4,	%g7
	movge	%icc,	%i6,	%l4
	brz	%o0,	loop_2214
loop_2213:
	ld	[%l7 + 0x18],	%f20
	stx	%o5,	[%l7 + 0x40]
	fmovsa	%xcc,	%f19,	%f19
loop_2214:
	bcs,a	%icc,	loop_2215
	tg	%icc,	0x5
	addcc	%l2,	0x009F,	%i2
	nop
	setx	loop_2216,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_2215:
	movrgez	%l6,	0x281,	%i7
	fmovsvc	%xcc,	%f6,	%f15
	orncc	%l5,	0x02A8,	%g4
loop_2216:
	andn	%i1,	%l3,	%o2
	fmul8x16	%f12,	%f4,	%f14
	or	%g2,	%i3,	%l1
	swap	[%l7 + 0x20],	%g3
	brgz	%o1,	loop_2217
	edge32	%i4,	%o7,	%g5
	wr	%g0,	0xe2,	%asi
	stba	%l0,	[%l7 + 0x28] %asi
	membar	#Sync
loop_2217:
	fsrc1	%f4,	%f30
	sllx	%i0,	%o4,	%o6
	edge8ln	%g1,	%o3,	%i5
	tsubcctv	%g6,	0x056A,	%i6
	fcmple32	%f26,	%f14,	%l4
	bvs,pn	%xcc,	loop_2218
	fmovd	%f6,	%f0
	movleu	%xcc,	%o0,	%g7
	array32	%l2,	%o5,	%i2
loop_2218:
	fandnot1s	%f31,	%f14,	%f18
	fzero	%f8
	edge16ln	%i7,	%l5,	%l6
	std	%f12,	[%l7 + 0x38]
	edge8	%i1,	%l3,	%g4
	add	%l7,	0x20,	%l6
	wr	%g0,	0x04,	%asi
	casxa	[%l6] 0x04,	%o2,	%i3
	fbule	%fcc0,	loop_2219
	fmovsneg	%xcc,	%f10,	%f8
	flush	%l7 + 0x14
	udivx	%l1,	0x0E2F,	%g3
loop_2219:
	nop
	set	0x40, %i1
	ldda	[%l7 + %i1] 0x89,	%f16
	tcc	%xcc,	0x2
	subc	%g2,	%i4,	%o1
	tvs	%icc,	0x6
	fmovsneg	%icc,	%f14,	%f10
	edge32ln	%o7,	%g5,	%l0
	fmovda	%icc,	%f24,	%f0
	taddcc	%o4,	0x07F1,	%i0
	tcc	%xcc,	0x0
	fnegs	%f29,	%f25
	movn	%xcc,	%o6,	%o3
	umul	%i5,	%g6,	%g1
	fors	%f1,	%f24,	%f22
	fbuge,a	%fcc1,	loop_2220
	addc	%i6,	%l4,	%g7
	smulcc	%l2,	%o5,	%o0
	fmovdcc	%icc,	%f0,	%f26
loop_2220:
	membar	0x2A
	orncc	%i2,	0x1FDE,	%i7
	edge32ln	%l5,	%i1,	%l3
	srax	%g4,	%l6,	%o2
	andncc	%i3,	%g3,	%g2
	movvs	%xcc,	%l1,	%o1
	movcs	%icc,	%o7,	%g5
	andn	%i4,	0x0228,	%l0
	mulscc	%o4,	%i0,	%o6
	movl	%icc,	%i5,	%o3
	edge8	%g1,	%g6,	%l4
	edge8ln	%g7,	%i6,	%o5
	fnot1	%f12,	%f26
	edge32l	%o0,	%i2,	%i7
	andncc	%l5,	%l2,	%i1
	tcc	%xcc,	0x0
	tvc	%icc,	0x6
	edge8	%g4,	%l3,	%l6
	andncc	%i3,	%o2,	%g2
	sdivcc	%l1,	0x06DE,	%g3
	fbn	%fcc1,	loop_2221
	addc	%o7,	%g5,	%o1
	fmovdpos	%icc,	%f18,	%f19
	brlz	%i4,	loop_2222
loop_2221:
	sllx	%o4,	%l0,	%i0
	or	%i5,	%o6,	%o3
	wr	%g0,	0x89,	%asi
	stxa	%g1,	[%l7 + 0x38] %asi
loop_2222:
	movcc	%xcc,	%g6,	%l4
	tg	%icc,	0x6
	fba	%fcc1,	loop_2223
	movl	%xcc,	%g7,	%o5
	sth	%i6,	[%l7 + 0x34]
	edge8ln	%i2,	%i7,	%l5
loop_2223:
	fbn	%fcc3,	loop_2224
	fpadd16s	%f30,	%f5,	%f2
	bpos,pt	%xcc,	loop_2225
	membar	0x0A
loop_2224:
	fors	%f25,	%f9,	%f24
	tcc	%icc,	0x1
loop_2225:
	sllx	%l2,	0x14,	%i1
	fmovsle	%xcc,	%f10,	%f11
	set	0x60, %o6
	ldda	[%l7 + %o6] 0x2c,	%g4
	xorcc	%l3,	%l6,	%o0
	xor	%i3,	0x0EDD,	%o2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrgez	%l1,	%g2,	%o7
	te	%xcc,	0x4
	bgu,pt	%xcc,	loop_2226
	movcs	%icc,	%g5,	%o1
	orn	%i4,	%o4,	%l0
	movgu	%xcc,	%i0,	%i5
loop_2226:
	fmovdn	%xcc,	%f21,	%f14
	edge16l	%g3,	%o3,	%o6
	lduw	[%l7 + 0x70],	%g1
	array16	%l4,	%g7,	%o5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tge	%icc,	0x2
	subcc	%i6,	0x0AFA,	%g6
	movgu	%xcc,	%i2,	%i7
	fmovrdlz	%l2,	%f2,	%f14
	array8	%l5,	%g4,	%i1
	mulx	%l6,	%o0,	%l3
	fmovrde	%i3,	%f14,	%f2
	movgu	%xcc,	%l1,	%o2
	fands	%f31,	%f29,	%f27
	edge8l	%g2,	%o7,	%g5
	ble,pn	%icc,	loop_2227
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sll	%i4,	0x1A,	%o4
	sll	%l0,	%o1,	%i0
loop_2227:
	movvc	%icc,	%i5,	%o3
	fpadd32	%f8,	%f24,	%f12
	fcmps	%fcc2,	%f14,	%f19
	set	0x75, %l2
	ldstuba	[%l7 + %l2] 0x19,	%o6
	tle	%xcc,	0x7
	movleu	%icc,	%g3,	%l4
	movre	%g1,	%o5,	%i6
	fble,a	%fcc1,	loop_2228
	tpos	%icc,	0x1
	movne	%xcc,	%g7,	%g6
	andn	%i7,	0x1FDE,	%i2
loop_2228:
	swap	[%l7 + 0x58],	%l5
	ldd	[%l7 + 0x78],	%f30
	or	%l2,	%i1,	%g4
	fpsub32	%f16,	%f24,	%f30
	fmovdn	%icc,	%f12,	%f31
	fones	%f31
	fnor	%f10,	%f8,	%f26
	subcc	%l6,	0x1AA6,	%l3
	fcmpgt32	%f10,	%f10,	%i3
	mulx	%l1,	0x176F,	%o2
	ldsw	[%l7 + 0x78],	%o0
	bgu,a,pt	%icc,	loop_2229
	fmovdle	%xcc,	%f23,	%f10
	membar	0x0E
	set	0x29, %g1
	stba	%g2,	[%l7 + %g1] 0x80
loop_2229:
	subccc	%g5,	0x0D58,	%i4
	mulx	%o4,	%l0,	%o7
	array16	%o1,	%i5,	%i0
	movrgz	%o6,	0x1F8,	%g3
	mulscc	%o3,	%l4,	%o5
	brz	%i6,	loop_2230
	be,a	loop_2231
	edge16n	%g1,	%g6,	%g7
	or	%i2,	0x15CA,	%l5
loop_2230:
	tne	%xcc,	0x7
loop_2231:
	bpos	loop_2232
	movl	%icc,	%i7,	%l2
	fmul8ulx16	%f28,	%f20,	%f16
	fmovrsne	%i1,	%f20,	%f3
loop_2232:
	movne	%xcc,	%g4,	%l3
	ldub	[%l7 + 0x35],	%i3
	stb	%l1,	[%l7 + 0x23]
	or	%o2,	0x1CF6,	%o0
	tneg	%icc,	0x5
	movneg	%xcc,	%l6,	%g2
	addc	%i4,	%o4,	%l0
	call	loop_2233
	bgu,a	loop_2234
	brgez	%o7,	loop_2235
	udiv	%o1,	0x0552,	%g5
loop_2233:
	tpos	%xcc,	0x0
loop_2234:
	sub	%i0,	0x1680,	%i5
loop_2235:
	edge8	%o6,	%g3,	%l4
	nop
	set	0x60, %i2
	std	%o2,	[%l7 + %i2]
	tle	%xcc,	0x0
	sethi	0x13CE,	%o5
	andn	%i6,	0x08C6,	%g1
	fmovdle	%icc,	%f1,	%f9
	fmovsge	%xcc,	%f24,	%f30
	fpack32	%f4,	%f20,	%f0
	fxors	%f11,	%f10,	%f5
	swap	[%l7 + 0x78],	%g7
	udiv	%g6,	0x07F3,	%i2
	brlez,a	%i7,	loop_2236
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsh	[%l7 + 0x1C],	%l5
	wr	%g0,	0x81,	%asi
	lduha	[%l7 + 0x62] %asi,	%l2
loop_2236:
	array32	%g4,	%l3,	%i3
	fone	%f28
	fmovrse	%i1,	%f25,	%f6
	sllx	%o2,	%l1,	%o0
	movrlz	%l6,	%i4,	%o4
	tsubcctv	%l0,	0x0ECC,	%g2
	tcs	%icc,	0x2
	sth	%o7,	[%l7 + 0x74]
	xor	%g5,	%i0,	%o1
	wr	%g0,	0xe3,	%asi
	stba	%i5,	[%l7 + 0x08] %asi
	membar	#Sync
	movne	%icc,	%o6,	%g3
	tle	%icc,	0x4
	fone	%f12
	stx	%l4,	[%l7 + 0x18]
	movne	%icc,	%o5,	%o3
	fmovsg	%xcc,	%f28,	%f18
	fbl	%fcc2,	loop_2237
	faligndata	%f14,	%f20,	%f26
	be	loop_2238
	std	%i6,	[%l7 + 0x78]
loop_2237:
	smulcc	%g7,	%g6,	%g1
	fcmple32	%f16,	%f6,	%i2
loop_2238:
	tvc	%xcc,	0x4
	fxor	%f6,	%f18,	%f14
	edge8n	%l5,	%l2,	%g4
	set	0x50, %i6
	swapa	[%l7 + %i6] 0x89,	%i7
	fmovde	%icc,	%f30,	%f12
	edge8	%l3,	%i3,	%i1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbge	%fcc0,	loop_2239
	srlx	%o2,	0x08,	%o0
	movne	%xcc,	%l1,	%l6
	fsrc2s	%f16,	%f18
loop_2239:
	fmovrsgez	%o4,	%f8,	%f0
	addcc	%i4,	0x1AC8,	%g2
	array16	%l0,	%o7,	%g5
	edge16ln	%i0,	%o1,	%i5
	fcmpeq32	%f8,	%f16,	%g3
	move	%icc,	%l4,	%o6
	movneg	%xcc,	%o3,	%i6
	ldx	[%l7 + 0x68],	%g7
	fmovdl	%xcc,	%f20,	%f28
	wr	%g0,	0x18,	%asi
	sta	%f16,	[%l7 + 0x30] %asi
	fmovrdlz	%o5,	%f18,	%f2
	orncc	%g6,	0x0C74,	%g1
	movcc	%xcc,	%l5,	%i2
	bl,a,pt	%xcc,	loop_2240
	sdivx	%l2,	0x0336,	%i7
	ldsw	[%l7 + 0x5C],	%g4
	orcc	%l3,	0x0B71,	%i1
loop_2240:
	nop
	set	0x0E, %l3
	sth	%o2,	[%l7 + %l3]
	set	0x08, %i5
	swapa	[%l7 + %i5] 0x10,	%o0
	set	0x6E, %o5
	ldsha	[%l7 + %o5] 0x11,	%i3
	subccc	%l1,	0x06BD,	%l6
	tcs	%xcc,	0x4
	stb	%i4,	[%l7 + 0x13]
	addc	%g2,	0x029B,	%o4
	wr	%g0,	0x04,	%asi
	lda	[%l7 + 0x70] %asi,	%f23
	taddcctv	%l0,	%g5,	%i0
	edge8ln	%o7,	%o1,	%i5
	tsubcctv	%g3,	0x1655,	%l4
	wr	%g0,	0x81,	%asi
	ldsba	[%l7 + 0x7C] %asi,	%o3
	tg	%xcc,	0x0
	movl	%xcc,	%i6,	%o6
	xnor	%g7,	%o5,	%g6
	wr	%g0,	0x80,	%asi
	sta	%f10,	[%l7 + 0x34] %asi
	wr	%g0,	0x89,	%asi
	lda	[%l7 + 0x38] %asi,	%f19
	tle	%xcc,	0x3
	taddcctv	%g1,	%l5,	%l2
	movleu	%icc,	%i7,	%i2
	fmovscs	%icc,	%f15,	%f2
	ldd	[%l7 + 0x78],	%l2
	ldstub	[%l7 + 0x11],	%i1
	fmovscs	%icc,	%f26,	%f30
	subccc	%g4,	%o2,	%i3
	fmovrdgez	%o0,	%f4,	%f0
	sdivcc	%l1,	0x1084,	%l6
	wr	%g0,	0x88,	%asi
	stha	%i4,	[%l7 + 0x24] %asi
	bvs	loop_2241
	tl	%xcc,	0x7
	fmovdpos	%xcc,	%f11,	%f22
	fornot1s	%f13,	%f10,	%f5
loop_2241:
	movrlez	%o4,	0x338,	%g2
	srax	%l0,	0x14,	%i0
	prefetch	[%l7 + 0x50],	 0x0
	udiv	%o7,	0x1E61,	%o1
	ldsh	[%l7 + 0x0E],	%g5
	fpsub16	%f28,	%f2,	%f10
	tl	%xcc,	0x3
	brlez	%i5,	loop_2242
	ldd	[%l7 + 0x20],	%f6
	std	%f12,	[%l7 + 0x10]
	mulx	%l4,	0x19AF,	%g3
loop_2242:
	brgez	%i6,	loop_2243
	subcc	%o6,	%g7,	%o5
	std	%f14,	[%l7 + 0x08]
	tne	%xcc,	0x0
loop_2243:
	bcc,a	%icc,	loop_2244
	and	%o3,	0x047B,	%g6
	fnot1s	%f12,	%f17
	smul	%g1,	0x04D3,	%l2
loop_2244:
	bneg,pt	%icc,	loop_2245
	tle	%icc,	0x4
	move	%icc,	%l5,	%i2
	fbe,a	%fcc1,	loop_2246
loop_2245:
	and	%i7,	%i1,	%g4
	andncc	%o2,	%i3,	%o0
	tne	%xcc,	0x4
loop_2246:
	movrlz	%l3,	%l1,	%l6
	fmovscc	%icc,	%f1,	%f15
	fmovs	%f4,	%f7
	fandnot1s	%f22,	%f11,	%f24
	std	%i4,	[%l7 + 0x60]
	fnot1	%f24,	%f24
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
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
	edge16l	%g2,	%l0,	%o4
	edge8	%i0,	%o1,	%g5
	te	%icc,	0x6
loop_2247:
	tpos	%icc,	0x0
	ba,a	loop_2248
	tn	%icc,	0x2
	sub	%o7,	0x0AE5,	%l4
	nop
	setx	loop_2249,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_2248:
	brlz	%i5,	loop_2250
	alignaddr	%g3,	%o6,	%g7
	brz	%o5,	loop_2251
loop_2249:
	array16	%i6,	%g6,	%o3
loop_2250:
	edge8	%g1,	%l5,	%l2
	brlz	%i7,	loop_2252
loop_2251:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8l	%i2,	%i1,	%o2
	edge16l	%g4,	%i3,	%o0
loop_2252:
	nop
	set	0x18, %l5
	ldswa	[%l7 + %l5] 0x04,	%l1
	brgez,a	%l3,	loop_2253
	sethi	0x10FE,	%i4
	sir	0x021E
	fpadd32	%f22,	%f28,	%f26
loop_2253:
	fcmpeq32	%f12,	%f8,	%l6
	edge32n	%g2,	%l0,	%o4
	edge16	%i0,	%g5,	%o7
	fabsd	%f8,	%f12
	edge16ln	%l4,	%i5,	%g3
	array8	%o1,	%o6,	%o5
	and	%g7,	%g6,	%i6
	srl	%g1,	0x1C,	%o3
	orn	%l5,	0x108B,	%i7
	ldsb	[%l7 + 0x1C],	%i2
	fnot2	%f4,	%f14
	brgz	%i1,	loop_2254
	edge16l	%o2,	%l2,	%g4
	addcc	%o0,	%l1,	%i3
	addcc	%i4,	%l3,	%l6
loop_2254:
	movgu	%xcc,	%l0,	%o4
	smul	%g2,	0x1FB4,	%i0
	std	%f8,	[%l7 + 0x20]
	brlz	%g5,	loop_2255
	movrgez	%l4,	%i5,	%o7
	tsubcctv	%o1,	%g3,	%o6
	andncc	%o5,	%g6,	%i6
loop_2255:
	movpos	%icc,	%g1,	%o3
	edge32l	%g7,	%l5,	%i7
	xnor	%i1,	0x1FC5,	%o2
	sra	%l2,	0x02,	%g4
	andn	%o0,	%l1,	%i3
	sdivcc	%i2,	0x18B4,	%l3
	wr	%g0,	0x04,	%asi
	stxa	%l6,	[%l7 + 0x30] %asi
	movn	%xcc,	%l0,	%i4
	fpack32	%f6,	%f6,	%f2
	membar	0x4E
	move	%xcc,	%o4,	%g2
	andn	%i0,	0x1C15,	%l4
	sra	%g5,	0x0B,	%i5
	fpadd32	%f28,	%f4,	%f4
	tl	%xcc,	0x4
	fpmerge	%f20,	%f31,	%f10
	taddcc	%o7,	%g3,	%o1
	set	0x20, %l1
	ldxa	[%l7 + %l1] 0x81,	%o6
	fmovrdgez	%g6,	%f8,	%f10
	addccc	%i6,	%o5,	%o3
	andncc	%g1,	%g7,	%l5
	fandnot1s	%f30,	%f17,	%f31
	xnorcc	%i7,	0x12AB,	%o2
	fands	%f10,	%f22,	%f5
	fcmpes	%fcc0,	%f8,	%f18
	fbg	%fcc0,	loop_2256
	addccc	%l2,	%i1,	%o0
	add	%l7,	0x30,	%l6
	wr	%g0,	0x10,	%asi
	lda	[%l6] %asi,	%l1
	casa	[%l6] 0x10,	%l1,	%g4
loop_2256:
	tleu	%xcc,	0x4
	fmovrdlez	%i2,	%f22,	%f0
	and	%l3,	0x11D2,	%l6
	movcc	%icc,	%l0,	%i4
	bcs,a,pn	%icc,	loop_2257
	movleu	%xcc,	%i3,	%g2
	bpos,a,pt	%xcc,	loop_2258
	fmovrslez	%o4,	%f8,	%f16
loop_2257:
	movrgz	%l4,	%i0,	%i5
	fmovrsne	%o7,	%f9,	%f7
loop_2258:
	fbge,a	%fcc1,	loop_2259
	tcs	%icc,	0x2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movpos	%icc,	%g5,	%o1
loop_2259:
	movrlez	%g3,	0x2BF,	%g6
	ldsh	[%l7 + 0x7C],	%i6
	fcmpes	%fcc3,	%f23,	%f7
	fmovspos	%icc,	%f20,	%f10
	subc	%o6,	0x12EF,	%o3
	alignaddrl	%g1,	%o5,	%g7
	fornot2s	%f8,	%f1,	%f1
	andcc	%l5,	%i7,	%o2
	mulscc	%l2,	%o0,	%l1
	xnor	%g4,	0x1E3F,	%i2
	andn	%i1,	%l6,	%l3
	srax	%l0,	0x0F,	%i3
	set	0x4C, %o0
	swapa	[%l7 + %o0] 0x19,	%i4
	flush	%l7 + 0x24
	tcc	%xcc,	0x4
	fors	%f8,	%f31,	%f31
	wr	%g0,	0x88,	%asi
	ldswa	[%l7 + 0x30] %asi,	%o4
	te	%icc,	0x5
	fcmpgt16	%f10,	%f18,	%g2
	tg	%xcc,	0x2
	tsubcctv	%l4,	%i5,	%o7
	tgu	%xcc,	0x5
	fbue	%fcc1,	loop_2260
	be,pn	%icc,	loop_2261
	movg	%icc,	%g5,	%o1
	set	0x160, %l0
	nop 	! 	nop 	! 	ldxa	[%g0 + %l0] 0x40,	%i0 ripped by fixASI40.pl ripped by fixASI40.pl
loop_2260:
	fsrc2s	%f22,	%f6
loop_2261:
	xnor	%g6,	%i6,	%o6
	fmovsg	%xcc,	%f18,	%f0
	membar	0x3D
	stw	%g3,	[%l7 + 0x50]
	fmovrdne	%o3,	%f10,	%f0
	edge16l	%o5,	%g7,	%l5
	sir	0x065A
	srlx	%g1,	0x1E,	%o2
	andn	%l2,	0x04B7,	%o0
	fbuge,a	%fcc0,	loop_2262
	bg,pn	%xcc,	loop_2263
	stb	%l1,	[%l7 + 0x7E]
	brgez	%g4,	loop_2264
loop_2262:
	xnor	%i2,	%i7,	%l6
loop_2263:
	array16	%i1,	%l0,	%i3
	movrgz	%l3,	%o4,	%i4
loop_2264:
	xor	%g2,	0x0547,	%l4
	fexpand	%f29,	%f2
	fpsub16	%f30,	%f2,	%f12
	movrlz	%i5,	%g5,	%o7
	movn	%xcc,	%o1,	%g6
	tne	%xcc,	0x7
	movgu	%icc,	%i0,	%i6
	fnegd	%f16,	%f6
	srax	%g3,	0x02,	%o6
	fmovrdlez	%o3,	%f26,	%f10
	bcs,a,pt	%xcc,	loop_2265
	fpmerge	%f0,	%f14,	%f12
	movgu	%icc,	%o5,	%g7
	fmovrsne	%g1,	%f23,	%f5
loop_2265:
	nop
	setx	loop_2266,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fble	%fcc2,	loop_2267
	xor	%o2,	0x0C94,	%l5
	or	%l2,	%l1,	%o0
loop_2266:
	andn	%i2,	%g4,	%l6
loop_2267:
	array16	%i1,	%l0,	%i3
	tpos	%icc,	0x7
	fmuld8ulx16	%f17,	%f12,	%f24
	taddcctv	%l3,	0x0F9D,	%i7
	bn	loop_2268
	fpsub32	%f18,	%f0,	%f24
	umul	%i4,	%o4,	%g2
	umul	%i5,	%l4,	%g5
loop_2268:
	andcc	%o7,	0x0696,	%o1
	sdivcc	%g6,	0x0C72,	%i0
	wr	%g0,	0x0c,	%asi
	stha	%i6,	[%l7 + 0x7A] %asi
	fpsub32s	%f24,	%f25,	%f1
	fmovdg	%icc,	%f8,	%f26
	fzeros	%f22
	stbar
	srax	%o6,	%o3,	%g3
	st	%f27,	[%l7 + 0x40]
	tle	%xcc,	0x0
	edge16n	%g7,	%o5,	%g1
	movrlz	%o2,	0x055,	%l5
	fsrc2	%f12,	%f8
	fpackfix	%f20,	%f18
	tgu	%xcc,	0x2
	movle	%xcc,	%l1,	%l2
	andncc	%i2,	%g4,	%o0
	set	0x70, %o4
	lduba	[%l7 + %o4] 0x80,	%i1
	set	0x58, %o7
	ldsha	[%l7 + %o7] 0x14,	%l0
	alignaddrl	%i3,	%l6,	%l3
	fmovdg	%xcc,	%f27,	%f5
	fble,a	%fcc1,	loop_2269
	fnand	%f22,	%f30,	%f20
	popc	0x0336,	%i4
	movvs	%icc,	%o4,	%g2
loop_2269:
	xnor	%i5,	%l4,	%i7
	fbul	%fcc1,	loop_2270
	tcc	%xcc,	0x2
	fnands	%f29,	%f17,	%f4
	sir	0x01AB
loop_2270:
	array16	%g5,	%o1,	%o7
	movcs	%icc,	%g6,	%i6
	tcc	%xcc,	0x3
	edge8	%o6,	%o3,	%i0
	ldsh	[%l7 + 0x0A],	%g3
	movleu	%xcc,	%o5,	%g7
	fmovspos	%xcc,	%f2,	%f24
	movpos	%icc,	%o2,	%g1
	or	%l5,	%l1,	%l2
	fbl	%fcc1,	loop_2271
	fpadd32s	%f19,	%f8,	%f0
	sll	%g4,	%o0,	%i1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2271:
	popc	0x15B5,	%i2
	edge16n	%l0,	%i3,	%l6
	smul	%i4,	%o4,	%l3
	movle	%icc,	%i5,	%l4
	addc	%g2,	%g5,	%i7
	ldd	[%l7 + 0x10],	%o6
	movne	%icc,	%o1,	%i6
	set	0x60, %g2
	ldda	[%l7 + %g2] 0x18,	%o6
	edge8n	%g6,	%i0,	%o3
	tsubcctv	%o5,	%g3,	%o2
	fcmpes	%fcc1,	%f24,	%f16
	fmovsle	%icc,	%f20,	%f10
	fandnot1	%f22,	%f22,	%f12
	fcmpne16	%f28,	%f6,	%g1
	movcs	%icc,	%g7,	%l1
	movne	%icc,	%l2,	%l5
	movrne	%g4,	%o0,	%i2
	fmovdge	%icc,	%f7,	%f29
	udivx	%i1,	0x0AD9,	%l0
	taddcc	%i3,	%i4,	%o4
	fmuld8ulx16	%f4,	%f26,	%f6
	swap	[%l7 + 0x58],	%l6
	ta	%icc,	0x3
	set	0x3A, %i4
	ldsha	[%l7 + %i4] 0x0c,	%l3
	fbn	%fcc1,	loop_2272
	fbu,a	%fcc0,	loop_2273
	smul	%l4,	%i5,	%g2
	wr	%g0,	0x0c,	%asi
	stda	%i6,	[%l7 + 0x30] %asi
loop_2272:
	edge16n	%o7,	%o1,	%g5
loop_2273:
	tge	%xcc,	0x4
	orncc	%o6,	0x0BF6,	%i6
	set	0x20, %g3
	swapa	[%l7 + %g3] 0x89,	%i0
	orn	%g6,	%o5,	%o3
	sdivx	%o2,	0x07F6,	%g3
	fsrc1s	%f21,	%f29
	fmul8x16al	%f1,	%f27,	%f8
	movl	%xcc,	%g7,	%g1
	fmul8x16	%f31,	%f10,	%f26
	ldsb	[%l7 + 0x4F],	%l2
	movgu	%xcc,	%l5,	%g4
	tleu	%xcc,	0x1
	movne	%xcc,	%l1,	%o0
	bvc,a,pt	%xcc,	loop_2274
	fnot1s	%f17,	%f13
	tpos	%xcc,	0x2
	fzero	%f0
loop_2274:
	ta	%xcc,	0x1
	fmul8x16al	%f9,	%f16,	%f16
	fmovsleu	%icc,	%f17,	%f13
	fmovd	%f2,	%f18
	fmovde	%icc,	%f10,	%f2
	move	%xcc,	%i1,	%i2
	tvs	%icc,	0x5
	fcmple16	%f6,	%f8,	%i3
	orn	%l0,	%i4,	%o4
	edge32	%l6,	%l4,	%l3
	addccc	%i5,	0x0F64,	%g2
	tg	%xcc,	0x5
	bpos,a	%icc,	loop_2275
	fmovse	%xcc,	%f5,	%f27
	wr	%g0,	0x11,	%asi
	ldsha	[%l7 + 0x4E] %asi,	%i7
loop_2275:
	srax	%o7,	%o1,	%g5
	tle	%icc,	0x6
	sdiv	%o6,	0x12C1,	%i0
	nop
	set	0x58, %l4
	ldd	[%l7 + %l4],	%f18
	udiv	%i6,	0x02C3,	%g6
	bg,pn	%icc,	loop_2276
	add	%o3,	0x09F4,	%o2
	movge	%icc,	%o5,	%g3
	wr	%g0,	0x04,	%asi
	lda	[%l7 + 0x2C] %asi,	%f29
loop_2276:
	bvc,pn	%xcc,	loop_2277
	srax	%g1,	%g7,	%l5
	fsrc2	%f28,	%f18
	fabss	%f25,	%f8
loop_2277:
	fbule	%fcc1,	loop_2278
	bcc,a,pn	%xcc,	loop_2279
	fone	%f10
	add	%l7,	0x40,	%l6
	wr	%g0,	0x18,	%asi
	lda	[%l6] %asi,	%l2
	casa	[%l6] %asi,	%l2,	%l1
loop_2278:
	edge32n	%g4,	%i1,	%i2
loop_2279:
	nop
	set	0x0C, %o1
	stha	%i3,	[%l7 + %o1] 0x14
	tpos	%xcc,	0x5
	xnor	%l0,	0x1FE9,	%i4
	movg	%xcc,	%o0,	%o4
	fpsub16	%f10,	%f4,	%f2
	movrgez	%l4,	0x3CB,	%l6
	movg	%xcc,	%l3,	%g2
	tcc	%icc,	0x2
	fbl,a	%fcc0,	loop_2280
	xnor	%i7,	%o7,	%o1
	bleu	loop_2281
	udivcc	%i5,	0x15E4,	%g5
loop_2280:
	edge8l	%o6,	%i6,	%g6
	fbne,a	%fcc2,	loop_2282
loop_2281:
	te	%icc,	0x7
	fmovdpos	%icc,	%f28,	%f1
	nop
	setx	loop_2283,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_2282:
	fmovrdgz	%i0,	%f20,	%f16
	fbule,a	%fcc3,	loop_2284
	fxnor	%f4,	%f16,	%f30
loop_2283:
	fxor	%f24,	%f28,	%f2
	fexpand	%f8,	%f8
loop_2284:
	stbar
	sethi	0x0890,	%o2
	fmuld8sux16	%f1,	%f12,	%f0
	andncc	%o5,	%o3,	%g3
	sub	%g7,	%g1,	%l2
	movge	%icc,	%l5,	%g4
	add	%i1,	0x1552,	%i2
	tvc	%icc,	0x5
	movre	%i3,	0x267,	%l0
	smulcc	%l1,	%i4,	%o4
	tneg	%xcc,	0x3
	ldsb	[%l7 + 0x79],	%o0
	fnand	%f22,	%f2,	%f0
	tvs	%icc,	0x0
	addc	%l6,	0x0575,	%l4
	xorcc	%l3,	%i7,	%o7
	edge16ln	%o1,	%i5,	%g2
	orcc	%g5,	%o6,	%i6
	edge16l	%g6,	%i0,	%o2
	bne,a,pn	%icc,	loop_2285
	array16	%o3,	%g3,	%o5
	orcc	%g7,	0x0B7B,	%g1
	fmovdle	%icc,	%f20,	%f27
loop_2285:
	fmovsg	%xcc,	%f23,	%f20
	taddcc	%l2,	%l5,	%i1
	fmovde	%xcc,	%f2,	%f28
	addc	%g4,	%i3,	%i2
	fpadd32	%f14,	%f22,	%f10
	sdiv	%l1,	0x19A2,	%l0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fxnors	%f21,	%f6,	%f7
	sra	%i4,	0x09,	%o0
	andncc	%o4,	%l6,	%l4
	fmovsneg	%icc,	%f10,	%f0
	array16	%i7,	%o7,	%l3
	fbne	%fcc3,	loop_2286
	nop
	set	0x48, %o3
	std	%i4,	[%l7 + %o3]
	set	0x67, %i0
	ldsba	[%l7 + %i0] 0x89,	%g2
loop_2286:
	sethi	0x1F45,	%g5
	edge8	%o6,	%o1,	%i6
	srax	%i0,	0x04,	%g6
	bg	%icc,	loop_2287
	xnorcc	%o3,	%g3,	%o5
	movrgez	%g7,	%o2,	%l2
	fmovd	%f6,	%f16
loop_2287:
	fmul8x16	%f15,	%f12,	%f20
	bn	loop_2288
	fble	%fcc1,	loop_2289
	ldsw	[%l7 + 0x74],	%g1
	flush	%l7 + 0x38
loop_2288:
	flush	%l7 + 0x0C
loop_2289:
	nop
	wr	%g0,	0x0c,	%asi
	ldsba	[%l7 + 0x2C] %asi,	%l5
	fcmpgt32	%f20,	%f18,	%i1
	fmovs	%f12,	%f8
	addcc	%g4,	%i2,	%l1
	andcc	%l0,	%i3,	%o0
	ldstub	[%l7 + 0x68],	%o4
	bleu,a	loop_2290
	edge32n	%l6,	%i4,	%l4
	tl	%icc,	0x1
	movn	%xcc,	%o7,	%i7
loop_2290:
	andncc	%l3,	%g2,	%g5
	fbuge	%fcc2,	loop_2291
	tcc	%xcc,	0x0
	fmovsg	%xcc,	%f19,	%f22
	andcc	%i5,	%o1,	%i6
loop_2291:
	tgu	%icc,	0x4
	tl	%xcc,	0x5
	fmovd	%f18,	%f24
	movvs	%xcc,	%o6,	%g6
	udivcc	%i0,	0x17B3,	%g3
	edge8n	%o5,	%o3,	%g7
	tg	%icc,	0x0
	fmovsne	%xcc,	%f15,	%f21
	call	loop_2292
	tge	%xcc,	0x5
	fbge	%fcc2,	loop_2293
	tle	%xcc,	0x4
loop_2292:
	edge32n	%l2,	%g1,	%l5
	andn	%o2,	%i1,	%g4
loop_2293:
	fnegs	%f20,	%f10
	popc	%l1,	%l0
	stw	%i2,	[%l7 + 0x2C]
	movrne	%o0,	0x391,	%i3
	fbue	%fcc3,	loop_2294
	fbug,a	%fcc3,	loop_2295
	tg	%icc,	0x4
	fxnors	%f24,	%f19,	%f0
loop_2294:
	udiv	%o4,	0x1CA6,	%l6
loop_2295:
	fmul8x16	%f0,	%f18,	%f20
	fcmple16	%f4,	%f24,	%i4
	bpos,pt	%icc,	loop_2296
	tgu	%xcc,	0x1
	and	%o7,	%l4,	%l3
	add	%i7,	0x0FD0,	%g5
loop_2296:
	stb	%g2,	[%l7 + 0x74]
	ld	[%l7 + 0x2C],	%f13
	xnorcc	%o1,	0x07BB,	%i6
	fbu,a	%fcc3,	loop_2297
	brnz,a	%o6,	loop_2298
	bl,a,pn	%xcc,	loop_2299
	tg	%xcc,	0x1
loop_2297:
	siam	0x0
loop_2298:
	fabsd	%f4,	%f26
loop_2299:
	array8	%i5,	%i0,	%g6
	movg	%xcc,	%o5,	%g3
	fble,a	%fcc0,	loop_2300
	ldx	[%l7 + 0x20],	%o3
	fbuge,a	%fcc2,	loop_2301
	popc	0x11FB,	%g7
loop_2300:
	tsubcctv	%g1,	%l2,	%o2
	mova	%icc,	%l5,	%g4
loop_2301:
	nop
	set	0x10, %g5
	ldxa	[%l7 + %g5] 0x19,	%i1
	taddcc	%l0,	0x1877,	%i2
	bgu	%xcc,	loop_2302
	smulcc	%l1,	%o0,	%o4
	brz,a	%i3,	loop_2303
	fbo,a	%fcc1,	loop_2304
loop_2302:
	brgz	%i4,	loop_2305
	fones	%f20
loop_2303:
	edge32ln	%l6,	%l4,	%l3
loop_2304:
	sub	%o7,	0x0AD0,	%g5
loop_2305:
	smul	%i7,	%g2,	%o1
	fbue,a	%fcc2,	loop_2306
	ble,pt	%xcc,	loop_2307
	sethi	0x11F9,	%i6
	movrgz	%o6,	%i5,	%g6
loop_2306:
	movvc	%xcc,	%i0,	%o5
loop_2307:
	be	%icc,	loop_2308
	fbug	%fcc3,	loop_2309
	mova	%icc,	%o3,	%g3
	edge8l	%g1,	%g7,	%l2
loop_2308:
	sdiv	%l5,	0x073A,	%g4
loop_2309:
	addc	%o2,	%l0,	%i1
	umul	%l1,	%o0,	%i2
	subccc	%o4,	%i3,	%l6
	alignaddrl	%l4,	%l3,	%o7
	andn	%i4,	%g5,	%i7
	and	%g2,	%i6,	%o1
	fmovsvc	%icc,	%f29,	%f27
	bgu,pn	%icc,	loop_2310
	taddcc	%o6,	0x0E5C,	%g6
	and	%i0,	%i5,	%o3
	fmovdleu	%icc,	%f31,	%f10
loop_2310:
	mulx	%o5,	%g1,	%g7
	umulcc	%l2,	%l5,	%g3
	orn	%g4,	0x181A,	%l0
	movle	%icc,	%o2,	%i1
	xnor	%l1,	%i2,	%o0
	xor	%i3,	%l6,	%l4
	array16	%o4,	%o7,	%l3
	swap	[%l7 + 0x30],	%g5
	edge16	%i7,	%g2,	%i4
	stb	%i6,	[%l7 + 0x72]
	fmovrdlz	%o1,	%f30,	%f0
	ble,pt	%icc,	loop_2311
	sllx	%o6,	%g6,	%i5
	movcc	%icc,	%o3,	%i0
	fpack32	%f12,	%f0,	%f2
loop_2311:
	fmovsle	%xcc,	%f30,	%f1
	udivcc	%o5,	0x0F73,	%g7
	smulcc	%l2,	0x0E0C,	%g1
	mulscc	%g3,	0x0F20,	%g4
	fmovdg	%icc,	%f8,	%f3
	bvc,a,pt	%icc,	loop_2312
	alignaddrl	%l5,	%l0,	%o2
	smulcc	%l1,	0x0C98,	%i1
	add	%o0,	%i2,	%i3
loop_2312:
	fmovrsgez	%l6,	%f5,	%f24
	tsubcctv	%o4,	%l4,	%l3
	fnor	%f24,	%f10,	%f8
	movge	%icc,	%o7,	%g5
	ba,a	loop_2313
	sethi	0x04E5,	%i7
	edge16l	%i4,	%g2,	%i6
	umul	%o6,	%g6,	%i5
loop_2313:
	stbar
	sth	%o3,	[%l7 + 0x78]
	taddcc	%i0,	0x00F8,	%o1
	sethi	0x1281,	%g7
	edge8l	%o5,	%l2,	%g1
	andn	%g4,	%l5,	%l0
	fmovrsgz	%o2,	%f16,	%f26
	sdivx	%g3,	0x12B6,	%i1
	bpos,a,pt	%icc,	loop_2314
	xorcc	%o0,	%l1,	%i3
	nop
	setx	loop_2315,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	addccc	%l6,	%o4,	%l4
loop_2314:
	nop
	wr	%g0,	0x19,	%asi
	lduwa	[%l7 + 0x60] %asi,	%l3
loop_2315:
	fmovsne	%icc,	%f21,	%f31
	fmovrse	%o7,	%f7,	%f9
	movle	%icc,	%i2,	%i7
	fcmple16	%f0,	%f12,	%i4
	brz,a	%g2,	loop_2316
	andcc	%i6,	%o6,	%g6
	movn	%xcc,	%i5,	%o3
	fmuld8ulx16	%f19,	%f21,	%f30
loop_2316:
	st	%f10,	[%l7 + 0x10]
	sethi	0x1B2D,	%g5
	nop
	set	0x4E, %g4
	lduh	[%l7 + %g4],	%o1
	mulscc	%g7,	%i0,	%l2
	bn,a	%xcc,	loop_2317
	bne,pt	%icc,	loop_2318
	brgez,a	%g1,	loop_2319
	stbar
loop_2317:
	movrlez	%o5,	0x1A4,	%g4
loop_2318:
	fbne,a	%fcc2,	loop_2320
loop_2319:
	stbar
	fbo,a	%fcc2,	loop_2321
	xorcc	%l5,	0x005D,	%o2
loop_2320:
	tg	%xcc,	0x1
	fmovrdne	%g3,	%f0,	%f6
loop_2321:
	orcc	%i1,	0x0A3B,	%o0
	set	0x24, %i7
	lduha	[%l7 + %i7] 0x81,	%l0
	addccc	%l1,	0x0ACB,	%i3
	wr	%g0,	0x89,	%asi
	ldda	[%l7 + 0x10] %asi,	%i6
	fmovrdgz	%l4,	%f18,	%f2
	ta	%xcc,	0x5
	tpos	%icc,	0x0
	fornot2s	%f19,	%f7,	%f13
	tne	%icc,	0x0
	edge32l	%l3,	%o7,	%o4
	ldstub	[%l7 + 0x42],	%i2
	fmovscc	%xcc,	%f26,	%f12
	add	%l7,	0x0C,	%l6
	wr	%g0,	0x11,	%asi
	casa	[%l6] 0x11,	%i4,	%g2
	movrne	%i6,	%o6,	%g6
	movl	%icc,	%i7,	%o3
	fmovrslz	%i5,	%f27,	%f6
	smul	%g5,	%o1,	%i0
	edge32l	%l2,	%g1,	%o5
	movcc	%icc,	%g4,	%g7
	membar	0x78
	set	0x24, %g7
	stba	%o2,	[%l7 + %g7] 0x89
	std	%g2,	[%l7 + 0x70]
	edge16n	%l5,	%o0,	%i1
	addcc	%l1,	0x01D0,	%i3
	movrgez	%l6,	%l0,	%l4
	tvc	%icc,	0x5
	edge32n	%l3,	%o7,	%o4
	fpmerge	%f27,	%f8,	%f24
	ble,a	loop_2322
	movpos	%icc,	%i2,	%g2
	sdivx	%i6,	0x19AD,	%o6
	fmovdl	%xcc,	%f25,	%f29
loop_2322:
	taddcc	%g6,	0x1D04,	%i4
	set	0x50, %i3
	sta	%f30,	[%l7 + %i3] 0x14
	sllx	%o3,	%i7,	%i5
	alignaddrl	%o1,	%i0,	%l2
	and	%g5,	%o5,	%g1
	fxnor	%f12,	%f24,	%f6
	mulx	%g4,	0x00D6,	%g7
	and	%g3,	0x0AE5,	%l5
	edge8ln	%o0,	%o2,	%l1
	xnor	%i1,	%l6,	%i3
	add	%l7,	0x50,	%l6
	wr	%g0,	0x11,	%asi
	ldxa	[%l6] %asi,	%l0
	casxa	[%l6] 0x11,	%l0,	%l3
	array32	%o7,	%o4,	%i2
	movrlz	%l4,	0x1CC,	%i6
	movneg	%xcc,	%o6,	%g2
	alignaddrl	%i4,	%o3,	%g6
	srl	%i7,	%o1,	%i5
	movneg	%xcc,	%i0,	%l2
	sllx	%o5,	%g5,	%g1
	orncc	%g7,	0x11C4,	%g4
	wr	%g0,	0x26,	%asi
	ldda	[%l7 + 0x40] %asi,	%g2
	fmovspos	%icc,	%f22,	%f13
	tpos	%xcc,	0x5
	sdivcc	%l5,	0x09DE,	%o0
	edge32ln	%l1,	%o2,	%l6
	fmul8sux16	%f0,	%f8,	%f2
	tcs	%icc,	0x4
	mulscc	%i3,	0x1BC3,	%l0
	sethi	0x1299,	%l3
	andcc	%o7,	%o4,	%i1
	sll	%l4,	0x1E,	%i6
	sdiv	%o6,	0x1861,	%i2
	movge	%xcc,	%g2,	%i4
	wr	%g0,	0x22,	%asi
	stha	%g6,	[%l7 + 0x1C] %asi
	membar	#Sync
	addc	%o3,	0x0A05,	%i7
	xorcc	%o1,	0x08E9,	%i5
	membar	0x4D
	udivcc	%i0,	0x17CC,	%o5
	bcc,a,pn	%icc,	loop_2323
	fmovrsgez	%g5,	%f21,	%f5
	fbe,a	%fcc3,	loop_2324
	fbue,a	%fcc0,	loop_2325
loop_2323:
	fand	%f6,	%f30,	%f22
	fone	%f20
loop_2324:
	movgu	%icc,	%g1,	%l2
loop_2325:
	fcmple16	%f4,	%f30,	%g7
	move	%icc,	%g4,	%g3
	fornot1	%f30,	%f0,	%f16
	for	%f30,	%f28,	%f8
	bvs	loop_2326
	fnot1s	%f8,	%f23
	sdivx	%l5,	0x0EC3,	%o0
	and	%l1,	0x1D08,	%o2
loop_2326:
	edge16n	%l6,	%l0,	%i3
	movre	%o7,	%o4,	%l3
	wr	%g0,	0x89,	%asi
	ldswa	[%l7 + 0x48] %asi,	%l4
	edge16	%i1,	%o6,	%i2
	taddcc	%i6,	%g2,	%g6
	movre	%i4,	0x2C5,	%i7
	fbul	%fcc3,	loop_2327
	udiv	%o3,	0x108C,	%i5
	srl	%i0,	%o5,	%o1
	fbule	%fcc0,	loop_2328
loop_2327:
	orn	%g5,	0x1E8D,	%l2
	set	0x40, %g6
	ldda	[%l7 + %g6] 0x88,	%f16
loop_2328:
	fmovdl	%xcc,	%f1,	%f28
	popc	0x13E6,	%g1
	array16	%g4,	%g3,	%l5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tvs	%icc,	0x0
	membar	0x32
	wr	%g0,	0x0c,	%asi
	lduha	[%l7 + 0x08] %asi,	%o0
	fmovdneg	%xcc,	%f4,	%f7
	array16	%l1,	%g7,	%l6
	and	%l0,	0x04D7,	%o2
	stx	%o7,	[%l7 + 0x30]
	bge	loop_2329
	edge16n	%i3,	%o4,	%l3
	stb	%i1,	[%l7 + 0x0D]
	fbl,a	%fcc0,	loop_2330
loop_2329:
	movvc	%xcc,	%l4,	%i2
	sir	0x131A
	bne,pt	%icc,	loop_2331
loop_2330:
	tl	%xcc,	0x1
	movneg	%icc,	%o6,	%g2
	edge32	%i6,	%g6,	%i4
loop_2331:
	fcmpeq32	%f14,	%f20,	%o3
	ldstub	[%l7 + 0x0F],	%i7
	orn	%i5,	%i0,	%o1
	tle	%xcc,	0x6
	edge8n	%o5,	%g5,	%g1
	fbug	%fcc3,	loop_2332
	tcc	%xcc,	0x4
	faligndata	%f26,	%f14,	%f12
	taddcc	%l2,	0x1125,	%g4
loop_2332:
	fones	%f19
	fmovsn	%icc,	%f15,	%f13
	wr	%g0,	0x04,	%asi
	sta	%f5,	[%l7 + 0x78] %asi
	bcs,a	%icc,	loop_2333
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tvs	%xcc,	0x7
	movrlz	%l5,	%o0,	%l1
loop_2333:
	andcc	%g3,	%l6,	%l0
	udivx	%o2,	0x0279,	%g7
	addccc	%i3,	0x1C72,	%o7
	movrlez	%l3,	0x006,	%i1
	sra	%o4,	0x1F,	%i2
	array8	%o6,	%l4,	%g2
	tpos	%icc,	0x7
	tge	%icc,	0x4
	nop
	setx	loop_2334,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fmovsvs	%icc,	%f10,	%f14
	alignaddr	%g6,	%i6,	%i4
	fmovsle	%xcc,	%f7,	%f8
loop_2334:
	srlx	%o3,	%i7,	%i5
	move	%icc,	%o1,	%i0
	edge8l	%g5,	%g1,	%l2
	subcc	%o5,	0x0008,	%l5
	addc	%o0,	%l1,	%g4
	fbne,a	%fcc0,	loop_2335
	addccc	%l6,	%l0,	%o2
	set	0x6A, %l6
	stba	%g7,	[%l7 + %l6] 0x80
loop_2335:
	tgu	%icc,	0x6
	fpsub32	%f8,	%f24,	%f2
	wr	%g0,	0x18,	%asi
	stxa	%i3,	[%l7 + 0x28] %asi
	edge8l	%g3,	%o7,	%l3
	fcmpeq16	%f12,	%f14,	%i1
	lduh	[%l7 + 0x4A],	%o4
	fnot1s	%f9,	%f18
	movrlz	%o6,	0x315,	%i2
	fors	%f16,	%f29,	%f30
	set	0x40, %i1
	sta	%f23,	[%l7 + %i1] 0x89
	ldstub	[%l7 + 0x4B],	%g2
	stx	%g6,	[%l7 + 0x68]
	addcc	%i6,	0x0CB5,	%l4
	tvc	%icc,	0x4
	stbar
	tvc	%xcc,	0x6
	wr	%g0,	0x19,	%asi
	lduwa	[%l7 + 0x6C] %asi,	%o3
	ldsh	[%l7 + 0x68],	%i4
	stb	%i7,	[%l7 + 0x5D]
	set	0x08, %o2
	prefetcha	[%l7 + %o2] 0x10,	 0x0
	smulcc	%i5,	%i0,	%g5
	srax	%g1,	%l2,	%o5
	smulcc	%l5,	%l1,	%g4
	tcc	%icc,	0x6
	xnorcc	%l6,	%l0,	%o0
	edge32	%o2,	%g7,	%i3
	fnegs	%f14,	%f24
	tn	%xcc,	0x6
	movrne	%g3,	0x038,	%l3
	edge16l	%i1,	%o4,	%o7
	fmovdcc	%xcc,	%f30,	%f23
	edge16l	%i2,	%o6,	%g6
	lduw	[%l7 + 0x2C],	%g2
	fsrc2	%f24,	%f22
	ldsh	[%l7 + 0x18],	%i6
	andcc	%l4,	0x17A5,	%o3
	brgez,a	%i7,	loop_2336
	fbuge,a	%fcc0,	loop_2337
	popc	0x06F0,	%i4
	set	0x18, %l2
	stha	%i5,	[%l7 + %l2] 0x18
loop_2336:
	fmovdcs	%xcc,	%f25,	%f3
loop_2337:
	movrgz	%o1,	0x28B,	%i0
	subcc	%g1,	%g5,	%o5
	srax	%l5,	0x0F,	%l2
	tg	%icc,	0x2
	and	%g4,	0x0742,	%l1
	alignaddr	%l6,	%l0,	%o2
	fpackfix	%f26,	%f26
	fmovrse	%o0,	%f25,	%f26
	bpos,pn	%icc,	loop_2338
	bne,a,pt	%icc,	loop_2339
	movrne	%i3,	%g3,	%g7
	array16	%i1,	%l3,	%o4
loop_2338:
	fmovdcc	%icc,	%f0,	%f19
loop_2339:
	nop
	set	0x0C, %o6
	sta	%f28,	[%l7 + %o6] 0x14
	andcc	%i2,	0x1DB8,	%o7
	tvc	%icc,	0x5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnorcc	%o6,	0x02E5,	%g2
	add	%l7,	0x40,	%l6
	wr	%g0,	0x11,	%asi
	casxa	[%l6] %asi,	%g6,	%i6
	movcc	%icc,	%o3,	%l4
	set	0x08, %g1
	prefetcha	[%l7 + %g1] 0x89,	 0x0
	wr	%g0,	0x81,	%asi
	ldsha	[%l7 + 0x2E] %asi,	%i5
	orncc	%i7,	0x166F,	%i0
	tsubcc	%o1,	0x1C6D,	%g5
	nop
	setx	loop_2340,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movleu	%icc,	%g1,	%o5
	array32	%l2,	%l5,	%l1
	fmovdl	%icc,	%f27,	%f1
loop_2340:
	tpos	%xcc,	0x5
	fbuge,a	%fcc3,	loop_2341
	bvc,a,pn	%xcc,	loop_2342
	fxors	%f6,	%f5,	%f12
	fone	%f4
loop_2341:
	tcc	%icc,	0x1
loop_2342:
	for	%f6,	%f30,	%f14
	movrgez	%l6,	0x270,	%l0
	umulcc	%g4,	%o2,	%o0
	fmovdne	%icc,	%f7,	%f15
	edge16ln	%i3,	%g3,	%i1
	edge8l	%l3,	%o4,	%i2
	fnot2	%f22,	%f6
	sdivx	%g7,	0x1695,	%o6
	edge8l	%g2,	%o7,	%i6
	subcc	%o3,	0x041D,	%g6
	wr	%g0,	0x04,	%asi
	stda	%l4,	[%l7 + 0x38] %asi
	movgu	%icc,	%i5,	%i7
	addc	%i4,	%o1,	%g5
	fbule	%fcc1,	loop_2343
	sdivcc	%i0,	0x10EF,	%o5
	sdiv	%l2,	0x12ED,	%l5
	fbuge,a	%fcc2,	loop_2344
loop_2343:
	mulscc	%l1,	0x1038,	%l6
	fmovsa	%xcc,	%f22,	%f20
	tl	%xcc,	0x0
loop_2344:
	nop
	wr	%g0,	0x10,	%asi
	ldsha	[%l7 + 0x5C] %asi,	%l0
	taddcctv	%g4,	%g1,	%o0
	fands	%f23,	%f4,	%f17
	ldd	[%l7 + 0x10],	%i2
	pdist	%f2,	%f20,	%f20
	fpsub16s	%f4,	%f14,	%f26
	popc	%o2,	%i1
	ba,a	loop_2345
	tsubcc	%g3,	0x191D,	%o4
	andncc	%l3,	%i2,	%g7
	tne	%icc,	0x0
loop_2345:
	edge8l	%g2,	%o7,	%i6
	fblg	%fcc0,	loop_2346
	and	%o3,	%g6,	%l4
	sub	%i5,	0x16E9,	%o6
	tpos	%icc,	0x0
loop_2346:
	call	loop_2347
	bn,pn	%icc,	loop_2348
	tcc	%icc,	0x0
	fmovdvc	%icc,	%f15,	%f15
loop_2347:
	movcc	%xcc,	%i4,	%i7
loop_2348:
	edge8l	%o1,	%g5,	%o5
	wr	%g0,	0x0c,	%asi
	swapa	[%l7 + 0x28] %asi,	%i0
	fmovdvc	%xcc,	%f13,	%f3
	add	%l7,	0x10,	%l6
	wr	%g0,	0x19,	%asi
	casxa	[%l6] 0x19,	%l5,	%l2
	subc	%l6,	%l1,	%g4
	fbge	%fcc2,	loop_2349
	tl	%icc,	0x2
	mulx	%g1,	0x185A,	%l0
	fcmple32	%f0,	%f6,	%i3
loop_2349:
	movrgez	%o0,	0x0BF,	%o2
	smulcc	%g3,	%i1,	%l3
	fmovdg	%xcc,	%f26,	%f11
	movcc	%xcc,	%o4,	%g7
	ble,a,pt	%xcc,	loop_2350
	movn	%xcc,	%g2,	%i2
	movpos	%xcc,	%i6,	%o3
	movle	%icc,	%g6,	%o7
loop_2350:
	brlz,a	%l4,	loop_2351
	movrgz	%o6,	0x221,	%i4
	brgz	%i7,	loop_2352
	sdivcc	%o1,	0x0E35,	%g5
loop_2351:
	movvc	%xcc,	%o5,	%i0
	fnand	%f0,	%f20,	%f16
loop_2352:
	mulx	%l5,	%i5,	%l6
	sethi	0x1290,	%l1
	xorcc	%l2,	%g1,	%l0
	fbule,a	%fcc2,	loop_2353
	srax	%i3,	%g4,	%o2
	movg	%icc,	%o0,	%g3
	fors	%f3,	%f19,	%f21
loop_2353:
	udiv	%l3,	0x137F,	%i1
	movge	%icc,	%g7,	%g2
	fandnot2	%f6,	%f2,	%f0
	andn	%i2,	0x0D99,	%i6
	tg	%xcc,	0x3
	xorcc	%o3,	%o4,	%g6
	edge16ln	%l4,	%o7,	%i4
	udiv	%i7,	0x19A7,	%o1
	fmovrdlz	%g5,	%f2,	%f16
	udivx	%o5,	0x08CE,	%o6
	taddcctv	%l5,	%i0,	%i5
	movrgz	%l6,	0x255,	%l2
	wr	%g0,	0x81,	%asi
	swapa	[%l7 + 0x20] %asi,	%g1
	sir	0x0159
	umul	%l1,	%i3,	%g4
	ldstub	[%l7 + 0x77],	%o2
	set	0x50, %i2
	ldda	[%l7 + %i2] 0x11,	%o0
	nop
	setx	loop_2354,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	mulx	%g3,	%l3,	%i1
	fxnor	%f16,	%f24,	%f16
	movgu	%icc,	%l0,	%g7
loop_2354:
	tne	%xcc,	0x6
	sll	%g2,	0x0F,	%i6
	fbul	%fcc2,	loop_2355
	std	%o2,	[%l7 + 0x10]
	sdiv	%o4,	0x0293,	%i2
	movg	%icc,	%l4,	%o7
loop_2355:
	umulcc	%g6,	%i7,	%i4
	fmovdleu	%xcc,	%f22,	%f0
	movrlez	%o1,	0x3B5,	%g5
	nop
	setx	loop_2356,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	ldd	[%l7 + 0x08],	%o6
	fmovde	%xcc,	%f7,	%f8
	fandnot1	%f16,	%f30,	%f18
loop_2356:
	tvs	%icc,	0x5
	fmovdge	%icc,	%f28,	%f3
	wr	%g0,	0x80,	%asi
	prefetcha	[%l7 + 0x38] %asi,	 0x1
	stx	%i0,	[%l7 + 0x70]
	movleu	%icc,	%i5,	%l5
	smul	%l6,	%l2,	%l1
	andcc	%i3,	0x1E72,	%g4
	membar	#Sync
	wr	%g0,	0x16,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	tpos	%icc,	0x2
	wr	%g0,	0x19,	%asi
	lda	[%l7 + 0x44] %asi,	%f24
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tsubcctv	%g1,	%o0,	%g3
	fbu	%fcc3,	loop_2357
	addc	%o2,	0x08EA,	%l3
	fnot2	%f8,	%f24
	alignaddr	%l0,	%i1,	%g2
loop_2357:
	popc	%g7,	%i6
	bvc	loop_2358
	tn	%xcc,	0x0
	fsrc2	%f20,	%f28
	orncc	%o4,	0x13C1,	%o3
loop_2358:
	movleu	%xcc,	%l4,	%o7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andcc	%i2,	0x0F63,	%g6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tcs	%icc,	0x6
	edge16n	%i4,	%o1,	%g5
	taddcc	%i7,	%o6,	%i0
	popc	0x0D04,	%o5
	movrgz	%l5,	%l6,	%i5
	wr	%g0,	0x22,	%asi
	stda	%l2,	[%l7 + 0x28] %asi
	membar	#Sync
	tne	%icc,	0x4
	andcc	%l1,	%i3,	%g1
	tneg	%xcc,	0x2
	sra	%g4,	%o0,	%g3
	edge16	%l3,	%o2,	%i1
	fpadd16s	%f8,	%f12,	%f18
	edge16n	%l0,	%g7,	%g2
	fcmpne32	%f16,	%f28,	%i6
	addccc	%o4,	0x0D1A,	%l4
	movrlz	%o7,	%i2,	%o3
	bcs	loop_2359
	ld	[%l7 + 0x78],	%f24
	fmovrdgez	%g6,	%f10,	%f6
	fmovdleu	%icc,	%f27,	%f0
loop_2359:
	srl	%o1,	%i4,	%i7
	fors	%f9,	%f15,	%f20
	bcc,pt	%icc,	loop_2360
	srax	%o6,	0x19,	%i0
	tvs	%xcc,	0x7
	membar	#Sync
	wr	%g0,	0x16,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
loop_2360:
	fmovdle	%xcc,	%f9,	%f9
	movge	%xcc,	%o5,	%l5
	bgu,pt	%icc,	loop_2361
	tne	%xcc,	0x4
	srax	%l6,	%i5,	%l2
	fbl,a	%fcc2,	loop_2362
loop_2361:
	edge8	%l1,	%i3,	%g1
	fmovdgu	%xcc,	%f1,	%f28
	sll	%g4,	0x1B,	%o0
loop_2362:
	tvc	%icc,	0x3
	sethi	0x082A,	%g3
	te	%icc,	0x5
	edge32l	%g5,	%o2,	%l3
	set	0x72, %l3
	stha	%i1,	[%l7 + %l3] 0x22
	membar	#Sync
	movneg	%xcc,	%l0,	%g2
	fmovdne	%icc,	%f25,	%f27
	movrgez	%i6,	%g7,	%o4
	wr	%g0,	0x58,	%asi
	ldxa	[%g0 + 0x18] %asi,	%o7
	wr	%g0,	0x04,	%asi
	ldda	[%l7 + 0x70] %asi,	%l4
	movrlz	%i2,	%g6,	%o3
	taddcctv	%o1,	%i4,	%o6
	fmovdvs	%xcc,	%f17,	%f17
	edge16n	%i7,	%o5,	%l5
	srax	%l6,	0x02,	%i5
	array16	%i0,	%l1,	%i3
	fnegs	%f8,	%f18
	udivx	%l2,	0x1336,	%g1
	fmovrslz	%o0,	%f8,	%f15
	membar	0x7C
	fmovrslez	%g3,	%f26,	%f24
	smulcc	%g4,	%g5,	%o2
	fcmple16	%f10,	%f0,	%i1
	alignaddr	%l3,	%g2,	%l0
	sdivcc	%g7,	0x060F,	%i6
	andn	%o7,	%l4,	%i2
	bvc,a,pn	%xcc,	loop_2363
	bvs,pn	%xcc,	loop_2364
	fbge,a	%fcc2,	loop_2365
	fmul8x16au	%f30,	%f30,	%f18
loop_2363:
	sdivx	%o4,	0x19AA,	%g6
loop_2364:
	ta	%icc,	0x2
loop_2365:
	edge32ln	%o3,	%i4,	%o6
	tge	%xcc,	0x0
	fble	%fcc2,	loop_2366
	fmovsneg	%xcc,	%f3,	%f24
	brgez	%i7,	loop_2367
	movge	%icc,	%o1,	%o5
loop_2366:
	tle	%icc,	0x4
	set	0x40, %i5
	stda	%f16,	[%l7 + %i5] 0x81
loop_2367:
	sethi	0x0D5E,	%l5
	udiv	%l6,	0x1A79,	%i5
	mova	%icc,	%i0,	%l1
	fba	%fcc0,	loop_2368
	fbe,a	%fcc2,	loop_2369
	fbn,a	%fcc0,	loop_2370
	ldx	[%l7 + 0x10],	%l2
loop_2368:
	tn	%xcc,	0x2
loop_2369:
	xnor	%i3,	0x1EDB,	%o0
loop_2370:
	or	%g3,	%g1,	%g5
	nop
	set	0x2C, %i6
	prefetch	[%l7 + %i6],	 0x0
	movneg	%xcc,	%o2,	%g4
	xor	%i1,	%g2,	%l0
	array8	%g7,	%i6,	%l3
	tl	%icc,	0x1
	wr	%g0,	0x88,	%asi
	prefetcha	[%l7 + 0x50] %asi,	 0x1
	tle	%icc,	0x0
	udivcc	%o7,	0x0119,	%i2
	movgu	%xcc,	%o4,	%g6
	addc	%o3,	%i4,	%o6
	ldsb	[%l7 + 0x39],	%o1
	orn	%o5,	0x139A,	%l5
	sir	0x15B6
	nop
	set	0x08, %l5
	ldx	[%l7 + %l5],	%l6
	edge8ln	%i5,	%i0,	%l1
	movcs	%icc,	%i7,	%l2
	sethi	0x1A45,	%o0
	fmul8ulx16	%f24,	%f4,	%f28
	set	0x3C, %o5
	stha	%g3,	[%l7 + %o5] 0xeb
	membar	#Sync
	xor	%g1,	%g5,	%o2
	set	0x22, %l1
	stha	%i3,	[%l7 + %l1] 0xe3
	membar	#Sync
	fpadd32	%f14,	%f12,	%f14
	fbne,a	%fcc2,	loop_2371
	move	%xcc,	%g4,	%g2
	flush	%l7 + 0x18
	fsrc1s	%f25,	%f7
loop_2371:
	nop
	add	%l7,	0x08,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] %asi,	%i1,	%g7
	brz,a	%i6,	loop_2372
	fzeros	%f0
	sir	0x1830
	ba,pn	%xcc,	loop_2373
loop_2372:
	fpadd32s	%f22,	%f13,	%f14
	edge32l	%l0,	%l4,	%l3
	fmovdpos	%icc,	%f27,	%f0
loop_2373:
	fmovrdne	%i2,	%f4,	%f28
	tleu	%xcc,	0x3
	fabsd	%f26,	%f6
	array32	%o4,	%o7,	%o3
	bl,a,pn	%xcc,	loop_2374
	tvs	%icc,	0x1
	fmovsgu	%icc,	%f0,	%f22
	membar	0x24
loop_2374:
	brgez	%g6,	loop_2375
	fors	%f8,	%f14,	%f12
	sdivx	%o6,	0x128F,	%i4
	srax	%o5,	0x18,	%o1
loop_2375:
	addcc	%l6,	0x1642,	%i5
	andn	%l5,	0x0A31,	%l1
	membar	0x6F
	fbne	%fcc2,	loop_2376
	fmovdcs	%xcc,	%f3,	%f5
	tsubcc	%i7,	%i0,	%o0
	flush	%l7 + 0x3C
loop_2376:
	fnand	%f30,	%f14,	%f4
	array8	%g3,	%g1,	%g5
	nop
	setx	loop_2377,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movrlz	%o2,	0x353,	%i3
	fmovsg	%xcc,	%f11,	%f3
	movvc	%xcc,	%l2,	%g4
loop_2377:
	brgez,a	%g2,	loop_2378
	edge32	%g7,	%i6,	%l0
	tl	%xcc,	0x1
	srl	%i1,	%l4,	%i2
loop_2378:
	fpsub32s	%f30,	%f9,	%f13
	srax	%o4,	0x1D,	%o7
	xnor	%l3,	0x05FD,	%o3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnot2	%f14,	%f22
	tvs	%xcc,	0x2
	movcc	%icc,	%o6,	%i4
	array32	%o5,	%o1,	%g6
	sra	%i5,	%l5,	%l1
	te	%xcc,	0x3
	bl,a,pt	%xcc,	loop_2379
	fmuld8ulx16	%f18,	%f1,	%f4
	orcc	%l6,	%i7,	%o0
	prefetch	[%l7 + 0x34],	 0x2
loop_2379:
	movleu	%xcc,	%i0,	%g3
	movleu	%icc,	%g5,	%o2
	fmovsge	%icc,	%f17,	%f14
	andn	%g1,	%l2,	%i3
	mulx	%g2,	0x1473,	%g7
	tsubcc	%i6,	%l0,	%i1
	alignaddr	%g4,	%i2,	%l4
	fandnot2s	%f17,	%f8,	%f19
	fmovdpos	%xcc,	%f27,	%f4
	fmovsne	%icc,	%f30,	%f31
	fmovsge	%icc,	%f13,	%f15
	edge32n	%o7,	%o4,	%l3
	ldsh	[%l7 + 0x5C],	%o3
	edge8ln	%i4,	%o5,	%o6
	movcc	%icc,	%g6,	%o1
	fexpand	%f6,	%f26
	orncc	%i5,	0x059E,	%l5
	fmovsn	%xcc,	%f5,	%f10
	fmovsn	%icc,	%f28,	%f2
	movg	%icc,	%l1,	%l6
	movleu	%icc,	%i7,	%i0
	ble	loop_2380
	fxnors	%f5,	%f7,	%f23
	fand	%f16,	%f28,	%f14
	membar	#Sync
	set	0x40, %o0
	ldda	[%l7 + %o0] 0x16,	%f16
loop_2380:
	movrlz	%o0,	0x2FE,	%g5
	fexpand	%f12,	%f26
	lduh	[%l7 + 0x0E],	%g3
	fmovsn	%icc,	%f19,	%f29
	fmovsl	%xcc,	%f12,	%f13
	sdivcc	%g1,	0x0D58,	%o2
	movre	%l2,	0x131,	%i3
	fpsub16	%f0,	%f16,	%f28
	fabss	%f0,	%f18
	taddcc	%g2,	%i6,	%l0
	fmovde	%xcc,	%f6,	%f0
	sub	%i1,	%g4,	%i2
	fmovrsgz	%l4,	%f14,	%f12
	popc	%g7,	%o4
	mulscc	%l3,	0x1C06,	%o7
	tn	%icc,	0x3
	fblg,a	%fcc3,	loop_2381
	sdivx	%i4,	0x18D6,	%o3
	srlx	%o5,	%g6,	%o6
	udivcc	%o1,	0x03C6,	%l5
loop_2381:
	nop
	set	0x58, %l0
	stda	%l0,	[%l7 + %l0] 0xeb
	membar	#Sync
	wr	%g0,	0x88,	%asi
	lda	[%l7 + 0x78] %asi,	%f14
	fcmpgt32	%f16,	%f16,	%i5
	edge16ln	%l6,	%i0,	%i7
	movpos	%icc,	%o0,	%g5
	add	%l7,	0x38,	%l6
	wr	%g0,	0x0c,	%asi
	casxa	[%l6] 0x0c,	%g1,	%o2
	tgu	%icc,	0x0
	edge8n	%l2,	%i3,	%g3
	edge16	%i6,	%g2,	%i1
	movge	%xcc,	%l0,	%i2
	popc	0x110C,	%g4
	tge	%xcc,	0x6
	bcs,a	loop_2382
	or	%l4,	0x1436,	%g7
	movvs	%xcc,	%l3,	%o7
	ldsw	[%l7 + 0x1C],	%i4
loop_2382:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tleu	%icc,	0x1
	fexpand	%f5,	%f2
	array32	%o4,	%o5,	%g6
	mova	%icc,	%o6,	%o3
	nop
	setx loop_2383, %l0, %l1
	jmpl %l1, %l5
	fmul8sux16	%f18,	%f6,	%f12
	tsubcctv	%l1,	0x0129,	%i5
	ldsh	[%l7 + 0x66],	%l6
loop_2383:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tge	%xcc,	0x7
	ldstub	[%l7 + 0x5D],	%i0
	fcmpne16	%f0,	%f0,	%i7
	set	0x4E, %o4
	ldstuba	[%l7 + %o4] 0x80,	%o0
	tsubcc	%o1,	0x1D8E,	%g5
	be,a	loop_2384
	or	%o2,	%g1,	%l2
	fcmpgt16	%f30,	%f2,	%g3
	edge32ln	%i6,	%g2,	%i1
loop_2384:
	subccc	%l0,	%i2,	%g4
	tcc	%xcc,	0x6
	tcs	%icc,	0x4
	mulx	%i3,	%g7,	%l3
	smulcc	%l4,	0x1136,	%i4
	set	0x36, %g2
	stba	%o4,	[%l7 + %g2] 0x10
	mova	%xcc,	%o5,	%o7
	ldx	[%l7 + 0x10],	%g6
	udivcc	%o3,	0x0C3F,	%o6
	membar	0x18
	pdist	%f8,	%f28,	%f26
	fnot2s	%f24,	%f19
	sethi	0x1524,	%l5
	popc	0x15FB,	%l1
	fornot2s	%f16,	%f30,	%f21
	fbug,a	%fcc2,	loop_2385
	tge	%xcc,	0x7
	ldsw	[%l7 + 0x78],	%l6
	fpadd16s	%f1,	%f31,	%f18
loop_2385:
	nop
	wr	%g0,	0x80,	%asi
	lduha	[%l7 + 0x6C] %asi,	%i0
	xor	%i5,	0x0BAD,	%i7
	movcc	%xcc,	%o0,	%g5
	fmuld8ulx16	%f8,	%f18,	%f20
	addccc	%o2,	%o1,	%l2
	wr	%g0,	0x27,	%asi
	stda	%g0,	[%l7 + 0x38] %asi
	membar	#Sync
	wr	%g0,	0x19,	%asi
	stwa	%g3,	[%l7 + 0x28] %asi
	edge32ln	%g2,	%i6,	%i1
	tsubcctv	%l0,	%i2,	%i3
	tgu	%icc,	0x6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udiv	%g4,	0x05EB,	%l3
	wr	%g0,	0x89,	%asi
	ldstuba	[%l7 + 0x2C] %asi,	%g7
	fors	%f29,	%f14,	%f19
	sethi	0x0AD1,	%i4
	fcmpne16	%f18,	%f18,	%l4
	taddcc	%o4,	0x1629,	%o5
	udivx	%o7,	0x16AA,	%o3
	ldd	[%l7 + 0x30],	%g6
	be	%icc,	loop_2386
	tge	%icc,	0x7
	umulcc	%l5,	0x096C,	%o6
	andcc	%l1,	0x181F,	%i0
loop_2386:
	nop
	set	0x60, %i4
	stda	%i4,	[%l7 + %i4] 0x19
	subccc	%l6,	%o0,	%i7
	fmovdne	%xcc,	%f20,	%f16
	tvc	%xcc,	0x2
	fmovs	%f3,	%f4
	fbuge	%fcc2,	loop_2387
	tpos	%icc,	0x3
	set	0x40, %o7
	stxa	%g5,	[%l7 + %o7] 0x18
loop_2387:
	movvs	%icc,	%o2,	%l2
	fxors	%f24,	%f27,	%f28
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
	fandnot2	%f26,	%f16,	%f26
	sra	%o1,	%g1,	%g3
	movn	%xcc,	%i6,	%i1
	movn	%xcc,	%l0,	%i2
	or	%g2,	0x1396,	%i3
	fmovsge	%icc,	%f29,	%f18
	orncc	%g4,	%g7,	%l3
	wr	%g0,	0x18,	%asi
	stha	%i4,	[%l7 + 0x78] %asi
	array8	%l4,	%o4,	%o5
	fmovrdlez	%o7,	%f24,	%f6
	edge16n	%o3,	%g6,	%o6
	sethi	0x1C57,	%l1
	edge32n	%l5,	%i5,	%l6
	wr	%g0,	0x81,	%asi
	lduwa	[%l7 + 0x4C] %asi,	%i0
	bcc,a	loop_2388
	fbuge,a	%fcc2,	loop_2389
	ld	[%l7 + 0x30],	%f10
	tgu	%icc,	0x4
loop_2388:
	fmovrslz	%i7,	%f30,	%f23
loop_2389:
	array8	%g5,	%o0,	%o2
	movpos	%xcc,	%l2,	%o1
	or	%g1,	%i6,	%i1
	fbne	%fcc1,	loop_2390
	tn	%xcc,	0x5
	umul	%l0,	%g3,	%i2
	bshuffle	%f16,	%f0,	%f26
loop_2390:
	bg	%xcc,	loop_2391
	fbug	%fcc2,	loop_2392
	fsrc2s	%f15,	%f27
	edge32l	%g2,	%i3,	%g4
loop_2391:
	ldsw	[%l7 + 0x1C],	%g7
loop_2392:
	stbar
	fmul8x16au	%f21,	%f14,	%f22
	edge16	%i4,	%l4,	%o4
	xorcc	%o5,	%o7,	%l3
	mulscc	%g6,	0x1AC8,	%o3
	subcc	%l1,	%l5,	%o6
	sdiv	%l6,	0x02EC,	%i5
	smulcc	%i0,	%g5,	%i7
	fbge,a	%fcc3,	loop_2393
	subcc	%o0,	%l2,	%o1
	fzeros	%f5
	tsubcc	%o2,	0x17F0,	%i6
loop_2393:
	nop
	set	0x39, %l4
	stb	%i1,	[%l7 + %l4]
	fmovda	%xcc,	%f8,	%f21
	tvs	%icc,	0x2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x6A, %g3
	ldsba	[%l7 + %g3] 0x18,	%l0
	movvc	%icc,	%g3,	%g1
	movl	%xcc,	%g2,	%i3
	addccc	%g4,	0x02B7,	%i2
	movl	%xcc,	%g7,	%i4
	array32	%o4,	%l4,	%o7
	orn	%o5,	0x1D04,	%l3
	tleu	%xcc,	0x1
	tsubcc	%o3,	%g6,	%l1
	fpadd32	%f6,	%f8,	%f14
	fbug	%fcc0,	loop_2394
	movn	%icc,	%l5,	%l6
	fmul8sux16	%f22,	%f30,	%f30
	nop
	setx loop_2395, %l0, %l1
	jmpl %l1, %i5
loop_2394:
	fpsub16s	%f0,	%f22,	%f24
	movvc	%icc,	%i0,	%g5
	edge8ln	%o6,	%i7,	%o0
loop_2395:
	fcmple16	%f26,	%f0,	%o1
	movvs	%icc,	%l2,	%o2
	wr	%g0,	0x88,	%asi
	sta	%f4,	[%l7 + 0x44] %asi
	set	0x08, %o3
	stxa	%i1,	[%l7 + %o3] 0x27
	membar	#Sync
	fpadd32s	%f12,	%f0,	%f15
	movrlez	%l0,	%g3,	%i6
	tneg	%icc,	0x7
	udivx	%g1,	0x01CF,	%i3
	wr	%g0,	0x11,	%asi
	sta	%f2,	[%l7 + 0x1C] %asi
	wr	%g0,	0x19,	%asi
	lduwa	[%l7 + 0x34] %asi,	%g4
	tneg	%xcc,	0x0
	sllx	%i2,	%g2,	%i4
	set	0x40, %i0
	stda	%f0,	[%l7 + %i0] 0xf0
	membar	#Sync
	fors	%f4,	%f27,	%f17
	orcc	%o4,	0x0F00,	%g7
	bn,a,pt	%xcc,	loop_2396
	andncc	%o7,	%o5,	%l3
	for	%f20,	%f28,	%f22
	movne	%icc,	%o3,	%l4
loop_2396:
	xorcc	%l1,	0x1A79,	%g6
	bcs	%icc,	loop_2397
	movrgz	%l5,	%l6,	%i0
	orn	%i5,	%g5,	%i7
	fba,a	%fcc0,	loop_2398
loop_2397:
	fmovrse	%o0,	%f28,	%f0
	edge32ln	%o6,	%l2,	%o1
	call	loop_2399
loop_2398:
	sth	%i1,	[%l7 + 0x0A]
	std	%o2,	[%l7 + 0x20]
	tle	%icc,	0x0
loop_2399:
	movcc	%icc,	%g3,	%i6
	fmuld8sux16	%f13,	%f3,	%f2
	udivx	%l0,	0x0408,	%g1
	brz	%g4,	loop_2400
	fbl	%fcc0,	loop_2401
	sub	%i3,	0x19C6,	%g2
	sdivx	%i2,	0x0D55,	%i4
loop_2400:
	movl	%xcc,	%o4,	%g7
loop_2401:
	stb	%o5,	[%l7 + 0x29]
	fmovrslez	%o7,	%f1,	%f19
	movrgz	%l3,	0x1E7,	%l4
	fmovs	%f4,	%f3
	fbo,a	%fcc1,	loop_2402
	fsrc2s	%f30,	%f20
	fmovdpos	%icc,	%f4,	%f16
	add	%l7,	0x6C,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%o3
	casa	[%l6] 0x89,	%o3,	%l1
loop_2402:
	nop
	set	0x2B, %g5
	lduba	[%l7 + %g5] 0x89,	%l5
	fmuld8sux16	%f31,	%f7,	%f16
	addcc	%g6,	0x03B4,	%i0
	fmovs	%f8,	%f4
	bl,pn	%icc,	loop_2403
	sir	0x1E76
	tsubcctv	%i5,	0x0C6E,	%l6
	sethi	0x1E1D,	%i7
loop_2403:
	sra	%o0,	%o6,	%l2
	fmovdvs	%xcc,	%f30,	%f31
	movre	%g5,	0x176,	%i1
	bcs	loop_2404
	andncc	%o2,	%o1,	%i6
	add	%g3,	%l0,	%g4
	bl,a,pt	%xcc,	loop_2405
loop_2404:
	and	%i3,	0x14F9,	%g2
	fornot2s	%f29,	%f24,	%f31
	move	%xcc,	%i2,	%i4
loop_2405:
	or	%o4,	%g1,	%o5
	fbo	%fcc1,	loop_2406
	mova	%icc,	%g7,	%o7
	mova	%icc,	%l3,	%l4
	xorcc	%o3,	0x1E19,	%l5
loop_2406:
	fbe	%fcc2,	loop_2407
	brlz	%g6,	loop_2408
	swap	[%l7 + 0x0C],	%l1
	fmovrdgez	%i5,	%f0,	%f30
loop_2407:
	fmul8ulx16	%f20,	%f22,	%f2
loop_2408:
	taddcc	%l6,	%i0,	%i7
	subc	%o0,	%l2,	%g5
	fmovs	%f13,	%f11
	orncc	%o6,	0x00F2,	%i1
	subccc	%o1,	0x1477,	%i6
	stx	%o2,	[%l7 + 0x48]
	stw	%l0,	[%l7 + 0x20]
	set	0x51, %o1
	stba	%g4,	[%l7 + %o1] 0xe3
	membar	#Sync
	fmul8ulx16	%f4,	%f14,	%f4
	srlx	%i3,	0x17,	%g3
	sdivx	%g2,	0x1E09,	%i4
	andncc	%o4,	%g1,	%i2
	brgez	%o5,	loop_2409
	mova	%xcc,	%g7,	%l3
	edge32ln	%o7,	%l4,	%o3
	bvs,pn	%icc,	loop_2410
loop_2409:
	add	%l5,	%l1,	%i5
	sdivx	%g6,	0x1403,	%i0
	alignaddrl	%i7,	%l6,	%o0
loop_2410:
	edge16l	%l2,	%g5,	%i1
	udivcc	%o1,	0x144A,	%o6
	fbule,a	%fcc2,	loop_2411
	movvs	%icc,	%i6,	%o2
	xnor	%g4,	0x1F60,	%i3
	tsubcctv	%l0,	0x01E4,	%g2
loop_2411:
	fmovrslz	%g3,	%f7,	%f14
	fnegs	%f22,	%f21
	udiv	%o4,	0x0E80,	%g1
	movrne	%i2,	%o5,	%i4
	membar	0x35
	andn	%l3,	0x12D1,	%o7
	membar	0x27
	andcc	%l4,	0x0751,	%o3
	movne	%icc,	%l5,	%g7
	andn	%i5,	%g6,	%l1
	movrne	%i7,	0x305,	%l6
	fmovrsgz	%o0,	%f9,	%f4
	sdiv	%l2,	0x1C05,	%g5
	addcc	%i0,	%i1,	%o6
	subcc	%o1,	0x08B8,	%i6
	wr	%g0,	0x18,	%asi
	ldswa	[%l7 + 0x40] %asi,	%o2
	movleu	%xcc,	%i3,	%g4
	wr	%g0,	0x2f,	%asi
	stha	%g2,	[%l7 + 0x0C] %asi
	membar	#Sync
	andcc	%l0,	0x0D2C,	%o4
	fors	%f5,	%f10,	%f25
	ldstub	[%l7 + 0x26],	%g3
	tgu	%icc,	0x1
	add	%l7,	0x70,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%i2,	%g1
	fbue,a	%fcc1,	loop_2412
	sir	0x0704
	pdist	%f26,	%f26,	%f6
	tcc	%xcc,	0x6
loop_2412:
	orn	%o5,	0x0675,	%i4
	tle	%icc,	0x4
	fmovrse	%o7,	%f5,	%f0
	ta	%xcc,	0x1
	sir	0x121D
	fands	%f0,	%f15,	%f8
	movle	%icc,	%l3,	%o3
	tl	%icc,	0x3
	fbg	%fcc2,	loop_2413
	fmovda	%icc,	%f23,	%f13
	tl	%xcc,	0x0
	fmovd	%f12,	%f12
loop_2413:
	or	%l5,	0x0F35,	%g7
	tge	%icc,	0x6
	udivx	%l4,	0x0BF0,	%g6
	movrne	%i5,	%l1,	%i7
	fbe	%fcc2,	loop_2414
	fcmpeq32	%f2,	%f20,	%o0
	mulscc	%l2,	%g5,	%l6
	edge8l	%i1,	%i0,	%o6
loop_2414:
	nop
	set	0x7C, %i7
	lda	[%l7 + %i7] 0x0c,	%f11
	andn	%o1,	%o2,	%i6
	fbule	%fcc3,	loop_2415
	fzeros	%f0
	wr	%g0,	0x19,	%asi
	ldsba	[%l7 + 0x51] %asi,	%i3
loop_2415:
	fzero	%f28
	xorcc	%g4,	0x082A,	%g2
	edge8n	%l0,	%g3,	%o4
	umulcc	%g1,	0x0807,	%o5
	fmovse	%xcc,	%f31,	%f18
	movneg	%xcc,	%i4,	%i2
	xnor	%l3,	%o7,	%o3
	fcmpgt32	%f26,	%f28,	%g7
	tn	%icc,	0x7
	edge8ln	%l5,	%l4,	%i5
	fcmped	%fcc3,	%f28,	%f28
	fsrc2s	%f31,	%f18
	wr	%g0,	0x0c,	%asi
	lduha	[%l7 + 0x68] %asi,	%g6
	xor	%l1,	%i7,	%l2
	set	0x4C, %g4
	lduwa	[%l7 + %g4] 0x18,	%o0
	edge32	%g5,	%l6,	%i1
	fbl	%fcc0,	loop_2416
	tn	%icc,	0x1
	xnorcc	%i0,	0x1978,	%o6
	xnorcc	%o1,	0x0C78,	%i6
loop_2416:
	srax	%o2,	%g4,	%g2
	fbe	%fcc1,	loop_2417
	movrlez	%i3,	%g3,	%o4
	tcc	%xcc,	0x6
	fcmpgt16	%f14,	%f14,	%g1
loop_2417:
	fbge	%fcc0,	loop_2418
	ba,a,pn	%xcc,	loop_2419
	movre	%l0,	0x129,	%i4
	std	%i2,	[%l7 + 0x50]
loop_2418:
	ta	%icc,	0x0
loop_2419:
	nop
	wr	%g0,	0x80,	%asi
	lduha	[%l7 + 0x42] %asi,	%o5
	tneg	%xcc,	0x4
	array8	%l3,	%o3,	%g7
	movrlez	%o7,	0x1BE,	%l5
	srax	%l4,	%g6,	%i5
	sub	%i7,	%l1,	%o0
	fmovsa	%icc,	%f16,	%f24
	subc	%g5,	%l2,	%i1
	bl	%icc,	loop_2420
	fnand	%f12,	%f16,	%f26
	fmovrslz	%l6,	%f17,	%f23
	movre	%i0,	0x2C3,	%o6
loop_2420:
	edge8n	%o1,	%o2,	%g4
	addccc	%i6,	0x0B78,	%g2
	xnor	%g3,	%i3,	%o4
	movge	%xcc,	%g1,	%i4
	te	%icc,	0x5
	fmovsne	%icc,	%f30,	%f10
	edge32ln	%l0,	%o5,	%i2
	tl	%icc,	0x3
	tn	%xcc,	0x1
	tne	%icc,	0x1
	fcmple32	%f14,	%f24,	%o3
	ldx	[%l7 + 0x60],	%l3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	setx loop_2421, %l0, %l1
	jmpl %l1, %o7
	mulx	%l5,	0x0042,	%g7
	sir	0x0776
	fabsd	%f26,	%f30
loop_2421:
	edge16ln	%g6,	%i5,	%l4
	bvc,a	loop_2422
	movleu	%icc,	%l1,	%i7
	srlx	%g5,	0x07,	%o0
	fmovrdgez	%i1,	%f2,	%f0
loop_2422:
	tsubcc	%l6,	%i0,	%o6
	srax	%o1,	0x1C,	%o2
	ble	%icc,	loop_2423
	movg	%icc,	%g4,	%l2
	fmovsvc	%xcc,	%f1,	%f19
	ldub	[%l7 + 0x4F],	%g2
loop_2423:
	srl	%g3,	0x1A,	%i6
	move	%xcc,	%i3,	%g1
	tvs	%icc,	0x2
	fcmpne16	%f28,	%f22,	%o4
	set	0x39, %i3
	ldstuba	[%l7 + %i3] 0x89,	%i4
	movgu	%xcc,	%l0,	%o5
	fcmple16	%f12,	%f6,	%i2
	movg	%xcc,	%l3,	%o7
	alignaddr	%l5,	%o3,	%g6
	bvs,pt	%icc,	loop_2424
	fmovrdgez	%i5,	%f16,	%f24
	edge32l	%l4,	%l1,	%i7
	orn	%g7,	%o0,	%i1
loop_2424:
	fmovdneg	%icc,	%f31,	%f28
	mova	%icc,	%g5,	%l6
	edge32l	%i0,	%o1,	%o6
	lduh	[%l7 + 0x12],	%o2
	fexpand	%f29,	%f4
	andcc	%l2,	0x0B10,	%g2
	edge32n	%g4,	%i6,	%g3
	tne	%icc,	0x0
	ldd	[%l7 + 0x10],	%f10
	orncc	%i3,	0x1276,	%g1
	movpos	%xcc,	%i4,	%l0
	array8	%o5,	%i2,	%l3
	stx	%o7,	[%l7 + 0x60]
	andncc	%l5,	%o3,	%o4
	udivcc	%g6,	0x15BE,	%i5
	add	%l7,	0x68,	%l6
	wr	%g0,	0x11,	%asi
	lda	[%l6] %asi,	%l1
	casa	[%l6] %asi,	%l1,	%i7
	wr	%g0,	0x10,	%asi
	ldstuba	[%l7 + 0x38] %asi,	%l4
	movvc	%icc,	%o0,	%g7
	fmovscc	%xcc,	%f0,	%f22
	mulx	%i1,	0x124D,	%l6
	movvs	%icc,	%g5,	%o1
	movl	%icc,	%o6,	%i0
	fbe,a	%fcc1,	loop_2425
	sll	%o2,	0x05,	%l2
	fpadd32s	%f6,	%f29,	%f6
	movge	%xcc,	%g4,	%i6
loop_2425:
	nop
	set	0x38, %g6
	ldsha	[%l7 + %g6] 0x80,	%g2
	addc	%i3,	0x064F,	%g1
	xnor	%i4,	0x0157,	%l0
	bl	%xcc,	loop_2426
	membar	0x5B
	movrne	%o5,	0x092,	%i2
	movrlez	%g3,	%l3,	%l5
loop_2426:
	add	%o3,	0x1D8C,	%o4
	sra	%o7,	0x19,	%g6
	popc	0x0EEB,	%l1
	andn	%i7,	%l4,	%o0
	tcs	%xcc,	0x0
	lduh	[%l7 + 0x08],	%i5
	fpadd16	%f4,	%f30,	%f12
	tne	%icc,	0x4
	fbul,a	%fcc1,	loop_2427
	tvc	%icc,	0x2
	movn	%xcc,	%g7,	%l6
	nop
	set	0x58, %l6
	std	%i0,	[%l7 + %l6]
loop_2427:
	umul	%g5,	%o6,	%i0
	orcc	%o1,	%l2,	%o2
	fmovrslz	%g4,	%f0,	%f23
	wr	%g0,	0x81,	%asi
	stda	%g2,	[%l7 + 0x38] %asi
	mova	%icc,	%i3,	%i6
	xor	%i4,	%g1,	%o5
	swap	[%l7 + 0x10],	%l0
	wr	%g0,	0x88,	%asi
	lduwa	[%l7 + 0x2C] %asi,	%g3
	movleu	%icc,	%l3,	%i2
	bgu	loop_2428
	stb	%o3,	[%l7 + 0x46]
	xor	%o4,	%l5,	%o7
	fpsub16s	%f5,	%f31,	%f10
loop_2428:
	mulscc	%g6,	0x1270,	%i7
	sdivcc	%l4,	0x160A,	%o0
	tleu	%xcc,	0x1
	xor	%i5,	0x0C79,	%l1
	tne	%icc,	0x0
	movrlez	%l6,	0x3D6,	%g7
	faligndata	%f24,	%f4,	%f24
	edge8n	%g5,	%i1,	%o6
	andn	%i0,	0x1A86,	%l2
	add	%o1,	0x0C08,	%g4
	fzeros	%f20
	set	0x40, %i1
	stda	%f0,	[%l7 + %i1] 0x17
	membar	#Sync
	brgez,a	%o2,	loop_2429
	edge8	%g2,	%i3,	%i6
	movle	%xcc,	%g1,	%i4
	movcc	%icc,	%l0,	%o5
loop_2429:
	udivx	%l3,	0x1FE0,	%i2
	ldd	[%l7 + 0x68],	%g2
	movn	%icc,	%o4,	%o3
	fmovrde	%l5,	%f24,	%f16
	fmovs	%f10,	%f25
	edge32n	%o7,	%i7,	%g6
	sllx	%l4,	%o0,	%i5
	fmovd	%f30,	%f4
	srl	%l1,	0x0E,	%l6
	tne	%xcc,	0x1
	ldub	[%l7 + 0x5B],	%g5
	ba	loop_2430
	move	%icc,	%i1,	%g7
	te	%xcc,	0x5
	addc	%i0,	%o6,	%l2
loop_2430:
	tl	%icc,	0x7
	xor	%o1,	0x1C68,	%g4
	flush	%l7 + 0x40
	brlez,a	%o2,	loop_2431
	stw	%i3,	[%l7 + 0x50]
	wr	%g0,	0x19,	%asi
	swapa	[%l7 + 0x18] %asi,	%i6
loop_2431:
	addccc	%g2,	%i4,	%l0
	edge32ln	%o5,	%g1,	%i2
	popc	0x0EC9,	%g3
	movcs	%icc,	%l3,	%o3
	wr	%g0,	0x89,	%asi
	lduha	[%l7 + 0x60] %asi,	%l5
	tge	%icc,	0x0
	movge	%icc,	%o4,	%o7
	ta	%xcc,	0x7
	xorcc	%i7,	0x1EA9,	%l4
	fmovdge	%icc,	%f23,	%f5
	tcs	%icc,	0x7
	fnegd	%f6,	%f22
	movg	%icc,	%o0,	%i5
	bl,a,pn	%xcc,	loop_2432
	fbuge,a	%fcc2,	loop_2433
	edge16ln	%l1,	%g6,	%l6
	set	0x65, %o2
	ldstuba	[%l7 + %o2] 0x04,	%i1
loop_2432:
	bvs,pn	%xcc,	loop_2434
loop_2433:
	tge	%xcc,	0x2
	bgu,a,pt	%icc,	loop_2435
	udivx	%g5,	0x1394,	%g7
loop_2434:
	flush	%l7 + 0x2C
	nop
	set	0x78, %g7
	ldd	[%l7 + %g7],	%i0
loop_2435:
	edge32	%l2,	%o1,	%o6
	fbo,a	%fcc1,	loop_2436
	movrlez	%g4,	0x372,	%o2
	or	%i3,	%i6,	%g2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2436:
	fcmps	%fcc2,	%f30,	%f16
	fbue,a	%fcc2,	loop_2437
	st	%f12,	[%l7 + 0x1C]
	sdiv	%i4,	0x0E2A,	%o5
	movgu	%icc,	%l0,	%g1
loop_2437:
	array16	%g3,	%i2,	%o3
	brz	%l3,	loop_2438
	fcmpgt32	%f26,	%f8,	%o4
	tl	%icc,	0x4
	smul	%l5,	%i7,	%o7
loop_2438:
	fpsub32s	%f3,	%f13,	%f8
	brz,a	%l4,	loop_2439
	array32	%i5,	%l1,	%o0
	lduh	[%l7 + 0x70],	%g6
	movre	%l6,	0x325,	%g5
loop_2439:
	bvs,a	loop_2440
	edge8ln	%i1,	%g7,	%i0
	ble,a	loop_2441
	fpackfix	%f14,	%f10
loop_2440:
	nop
	wr	%g0,	0x18,	%asi
	ldsba	[%l7 + 0x13] %asi,	%o1
loop_2441:
	tgu	%xcc,	0x3
	fpadd32	%f14,	%f10,	%f12
	brnz,a	%l2,	loop_2442
	movge	%icc,	%o6,	%o2
	movrne	%g4,	0x2DC,	%i6
	movre	%g2,	%i3,	%o5
loop_2442:
	umulcc	%l0,	%g1,	%g3
	or	%i4,	%o3,	%i2
	sdivcc	%l3,	0x108D,	%o4
	or	%i7,	%o7,	%l5
	fble	%fcc3,	loop_2443
	orn	%l4,	%i5,	%o0
	fnot1	%f30,	%f16
	tle	%icc,	0x4
loop_2443:
	sir	0x061A
	srl	%l1,	%g6,	%g5
	set	0x5C, %o6
	ldswa	[%l7 + %o6] 0x0c,	%i1
	orn	%l6,	%g7,	%o1
	wr	%g0,	0x18,	%asi
	lduha	[%l7 + 0x52] %asi,	%l2
	fexpand	%f28,	%f10
	edge8n	%i0,	%o2,	%o6
	movge	%icc,	%g4,	%g2
	edge16	%i3,	%o5,	%l0
	orncc	%g1,	0x151C,	%i6
	umulcc	%g3,	0x00A1,	%o3
	udivx	%i4,	0x07B2,	%i2
	ba	%xcc,	loop_2444
	alignaddr	%l3,	%o4,	%i7
	fsrc2s	%f22,	%f31
	mulx	%l5,	0x1B13,	%l4
loop_2444:
	subccc	%o7,	%o0,	%l1
	fxors	%f6,	%f9,	%f28
	sethi	0x08A3,	%g6
	edge16l	%g5,	%i1,	%i5
	fpadd16	%f14,	%f10,	%f16
	array8	%l6,	%g7,	%l2
	mulx	%o1,	0x166F,	%o2
	st	%f8,	[%l7 + 0x4C]
	add	%l7,	0x08,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] %asi,	%o6,	%g4
	sir	0x1D1D
	movcc	%icc,	%i0,	%i3
	udiv	%o5,	0x1644,	%l0
	bvc,pt	%xcc,	loop_2445
	andncc	%g2,	%i6,	%g1
	ldub	[%l7 + 0x3C],	%g3
	movrne	%o3,	0x292,	%i2
loop_2445:
	fabss	%f4,	%f0
	fnegs	%f29,	%f3
	fnegd	%f28,	%f22
	fandnot1	%f18,	%f28,	%f22
	fnot2	%f18,	%f0
	movrlez	%l3,	0x207,	%i4
	srax	%o4,	0x14,	%i7
	bcs,a	%icc,	loop_2446
	srax	%l4,	0x1D,	%l5
	fmovsvc	%icc,	%f20,	%f2
	movrlz	%o7,	%o0,	%l1
loop_2446:
	sra	%g6,	0x06,	%i1
	mulx	%g5,	0x1206,	%i5
	tvs	%xcc,	0x0
	fmul8ulx16	%f6,	%f6,	%f14
	tsubcc	%g7,	0x0351,	%l6
	tcc	%icc,	0x7
	alignaddr	%l2,	%o2,	%o6
	tsubcc	%o1,	0x09B3,	%g4
	xnorcc	%i3,	%o5,	%i0
	fpsub16	%f22,	%f0,	%f0
	srlx	%g2,	0x1E,	%i6
	fmovdvs	%xcc,	%f15,	%f10
	fmuld8sux16	%f28,	%f11,	%f6
	edge8ln	%l0,	%g3,	%o3
	fcmpgt32	%f10,	%f10,	%i2
	fbuge,a	%fcc1,	loop_2447
	xnorcc	%l3,	%i4,	%g1
	fbg	%fcc1,	loop_2448
	edge32n	%i7,	%l4,	%o4
loop_2447:
	fmovdvc	%icc,	%f29,	%f13
	srl	%l5,	%o7,	%l1
loop_2448:
	fbo,a	%fcc3,	loop_2449
	taddcc	%g6,	%i1,	%o0
	bgu	%xcc,	loop_2450
	tgu	%icc,	0x0
loop_2449:
	movvs	%xcc,	%i5,	%g7
	edge8ln	%l6,	%l2,	%o2
loop_2450:
	nop
	wr	%g0,	0x80,	%asi
	prefetcha	[%l7 + 0x48] %asi,	 0x3
	wr	%g0,	0x0c,	%asi
	lda	[%l7 + 0x5C] %asi,	%f14
	fmovdgu	%icc,	%f10,	%f18
	edge32l	%o6,	%g4,	%o1
	fbuge	%fcc2,	loop_2451
	ldsw	[%l7 + 0x6C],	%i3
	sethi	0x16B8,	%i0
	tpos	%icc,	0x1
loop_2451:
	movle	%xcc,	%g2,	%i6
	array16	%o5,	%l0,	%g3
	sethi	0x0DF0,	%i2
	ldsh	[%l7 + 0x60],	%o3
	tsubcc	%i4,	%g1,	%i7
	brgez	%l3,	loop_2452
	srlx	%o4,	0x0D,	%l5
	bvs,a	loop_2453
	smul	%o7,	0x0F12,	%l1
loop_2452:
	edge8	%g6,	%l4,	%o0
	fexpand	%f25,	%f14
loop_2453:
	edge32l	%i5,	%g7,	%l6
	fmovrslz	%l2,	%f13,	%f8
	taddcc	%i1,	%g5,	%o6
	srl	%o2,	%g4,	%i3
	fmovrsne	%o1,	%f3,	%f25
	edge8ln	%i0,	%i6,	%o5
	fmovdn	%xcc,	%f2,	%f3
	fmovdne	%xcc,	%f19,	%f17
	movne	%icc,	%l0,	%g3
	brlz	%g2,	loop_2454
	tpos	%icc,	0x2
	edge16ln	%i2,	%o3,	%g1
	fpackfix	%f18,	%f8
loop_2454:
	fbe	%fcc1,	loop_2455
	bneg	%icc,	loop_2456
	fpsub32s	%f7,	%f2,	%f30
	bpos,a	loop_2457
loop_2455:
	tn	%xcc,	0x3
loop_2456:
	movre	%i7,	0x1CE,	%l3
	fcmple32	%f6,	%f16,	%o4
loop_2457:
	edge16n	%i4,	%l5,	%o7
	bneg,a,pn	%xcc,	loop_2458
	tge	%xcc,	0x5
	nop
	setx	loop_2459,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	ldx	[%l7 + 0x50],	%l1
loop_2458:
	nop
	wr	%g0,	0x2c,	%asi
	ldda	[%l7 + 0x30] %asi,	%g6
loop_2459:
	movg	%xcc,	%o0,	%i5
	udivx	%l4,	0x08C3,	%g7
	movrlez	%l6,	%i1,	%g5
	bg,a,pt	%xcc,	loop_2460
	fmovsge	%icc,	%f18,	%f2
	bshuffle	%f22,	%f24,	%f2
	xnor	%l2,	0x1E09,	%o6
loop_2460:
	subc	%g4,	0x0ECD,	%o2
	fblg,a	%fcc3,	loop_2461
	smulcc	%i3,	%i0,	%o1
	tneg	%icc,	0x5
	array8	%i6,	%o5,	%g3
loop_2461:
	fmovsgu	%icc,	%f10,	%f13
	movle	%icc,	%g2,	%l0
	tsubcc	%o3,	%i2,	%i7
	movg	%xcc,	%l3,	%g1
	call	loop_2462
	movcs	%icc,	%o4,	%i4
	movrne	%o7,	%l1,	%g6
	umul	%l5,	%o0,	%l4
loop_2462:
	array32	%g7,	%i5,	%l6
	edge32l	%i1,	%l2,	%g5
	ldsh	[%l7 + 0x24],	%g4
	ldx	[%l7 + 0x38],	%o6
	fmovrdgez	%o2,	%f6,	%f30
	movrgez	%i3,	%o1,	%i0
	tne	%icc,	0x7
	array8	%o5,	%g3,	%g2
	stw	%i6,	[%l7 + 0x60]
	xnorcc	%o3,	0x044E,	%i2
	mulx	%i7,	0x020C,	%l0
	movneg	%xcc,	%l3,	%g1
	orn	%o4,	%i4,	%l1
	set	0x22, %l2
	ldsba	[%l7 + %l2] 0x04,	%g6
	umul	%l5,	0x0BA3,	%o0
	tn	%xcc,	0x2
	nop
	setx	loop_2463,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	bgu,a	%xcc,	loop_2464
	fmuld8sux16	%f9,	%f28,	%f0
	fmuld8sux16	%f11,	%f20,	%f18
loop_2463:
	edge32	%l4,	%o7,	%i5
loop_2464:
	movrgez	%l6,	%i1,	%l2
	sdivcc	%g7,	0x0488,	%g4
	fexpand	%f20,	%f22
	sethi	0x1881,	%o6
	array32	%o2,	%i3,	%o1
	set	0x1F, %i2
	stba	%g5,	[%l7 + %i2] 0x15
	movcc	%xcc,	%i0,	%o5
	swap	[%l7 + 0x08],	%g3
	brlz	%i6,	loop_2465
	fbuge	%fcc2,	loop_2466
	tge	%xcc,	0x6
	udivx	%o3,	0x17D8,	%g2
loop_2465:
	sub	%i7,	0x0B31,	%l0
loop_2466:
	ldsw	[%l7 + 0x7C],	%l3
	set	0x5C, %l3
	lduwa	[%l7 + %l3] 0x0c,	%g1
	addcc	%o4,	%i2,	%i4
	edge32ln	%l1,	%g6,	%o0
	fbue,a	%fcc1,	loop_2467
	fsrc1s	%f7,	%f12
	movcs	%icc,	%l5,	%o7
	tsubcc	%i5,	%l6,	%l4
loop_2467:
	and	%i1,	0x1166,	%g7
	movge	%icc,	%l2,	%g4
	array32	%o2,	%o6,	%i3
	or	%o1,	%g5,	%o5
	wr	%g0,	0x2f,	%asi
	stba	%i0,	[%l7 + 0x7E] %asi
	membar	#Sync
	movgu	%icc,	%g3,	%i6
	fmovdleu	%xcc,	%f11,	%f19
	fnot1	%f8,	%f30
	fbe,a	%fcc1,	loop_2468
	tn	%icc,	0x3
	tl	%icc,	0x5
	fbule,a	%fcc3,	loop_2469
loop_2468:
	be,a,pn	%icc,	loop_2470
	orncc	%g2,	0x05F8,	%i7
	srax	%o3,	%l3,	%g1
loop_2469:
	edge16n	%o4,	%l0,	%i4
loop_2470:
	tvc	%icc,	0x5
	smul	%l1,	0x0D2B,	%i2
	sth	%o0,	[%l7 + 0x78]
	edge32l	%l5,	%g6,	%o7
	movcs	%xcc,	%i5,	%l4
	umul	%i1,	%g7,	%l6
	xnor	%l2,	0x1985,	%g4
	fmovsne	%icc,	%f1,	%f21
	st	%f12,	[%l7 + 0x30]
	fone	%f4
	tneg	%icc,	0x3
	subccc	%o6,	%o2,	%i3
	fbue	%fcc2,	loop_2471
	movg	%xcc,	%o1,	%g5
	fandnot2	%f2,	%f4,	%f20
	fnegd	%f28,	%f20
loop_2471:
	nop
	set	0x18, %i5
	ldxa	[%g0 + %i5] 0x20,	%i0
	edge32	%o5,	%i6,	%g3
	fmovdcs	%xcc,	%f5,	%f31
	call	loop_2472
	swap	[%l7 + 0x44],	%i7
	fcmpgt32	%f14,	%f2,	%g2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2472:
	fnor	%f20,	%f24,	%f4
	andncc	%o3,	%g1,	%o4
	tle	%icc,	0x6
	bshuffle	%f6,	%f30,	%f12
	bl,pt	%xcc,	loop_2473
	movneg	%icc,	%l0,	%i4
	fand	%f0,	%f16,	%f0
	fcmpgt32	%f10,	%f8,	%l3
loop_2473:
	nop
	setx	loop_2474,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	brgez	%l1,	loop_2475
	membar	0x68
	edge16	%i2,	%o0,	%l5
loop_2474:
	fsrc2	%f12,	%f8
loop_2475:
	srl	%o7,	%g6,	%i5
	fandnot2s	%f6,	%f9,	%f8
	fabsd	%f22,	%f14
	sethi	0x1DF3,	%l4
	fxnor	%f4,	%f22,	%f28
	edge8l	%i1,	%l6,	%l2
	brnz	%g4,	loop_2476
	fmovrdgez	%g7,	%f30,	%f14
	bvs	loop_2477
	te	%icc,	0x6
loop_2476:
	lduh	[%l7 + 0x0A],	%o2
	fandnot1	%f0,	%f2,	%f8
loop_2477:
	sdivx	%o6,	0x1958,	%i3
	array16	%o1,	%g5,	%i0
	fmovdvs	%xcc,	%f13,	%f28
	popc	0x16BD,	%i6
	edge32ln	%g3,	%o5,	%g2
	wr	%g0,	0xe3,	%asi
	stxa	%i7,	[%l7 + 0x08] %asi
	membar	#Sync
	fand	%f24,	%f22,	%f16
	umul	%o3,	0x10C1,	%o4
	movrne	%l0,	0x007,	%i4
	udivx	%g1,	0x1DDD,	%l3
	orn	%i2,	0x090D,	%o0
	fbe,a	%fcc0,	loop_2478
	sdivx	%l5,	0x0D48,	%o7
	umul	%g6,	0x0082,	%i5
	edge8n	%l4,	%i1,	%l1
loop_2478:
	tpos	%xcc,	0x1
	membar	0x49
	fbul	%fcc0,	loop_2479
	movcc	%icc,	%l2,	%l6
	swap	[%l7 + 0x44],	%g7
	edge16	%g4,	%o2,	%o6
loop_2479:
	smul	%i3,	0x07B8,	%o1
	bvs,a,pn	%icc,	loop_2480
	movpos	%icc,	%g5,	%i6
	set	0x48, %i6
	ldxa	[%l7 + %i6] 0x15,	%g3
loop_2480:
	sub	%i0,	%g2,	%i7
	ldsb	[%l7 + 0x14],	%o5
	sir	0x0D4E
	fmovdge	%icc,	%f10,	%f11
	fbule	%fcc1,	loop_2481
	taddcc	%o3,	0x1943,	%l0
	edge8n	%i4,	%g1,	%o4
	fcmpgt16	%f2,	%f16,	%i2
loop_2481:
	sethi	0x0786,	%o0
	std	%f12,	[%l7 + 0x70]
	xorcc	%l5,	%l3,	%o7
	array8	%i5,	%g6,	%l4
	edge16n	%l1,	%l2,	%i1
	xnorcc	%l6,	0x146D,	%g4
	fnot2	%f26,	%f6
	taddcc	%g7,	0x0EFE,	%o2
	bne	%icc,	loop_2482
	addccc	%i3,	0x0C81,	%o1
	te	%xcc,	0x3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2482:
	srax	%g5,	0x14,	%o6
	ldd	[%l7 + 0x48],	%f24
	taddcc	%g3,	%i6,	%i0
	edge8l	%i7,	%o5,	%o3
	tg	%icc,	0x3
	edge16l	%l0,	%i4,	%g1
	srlx	%o4,	0x14,	%g2
	fnand	%f6,	%f18,	%f30
	tleu	%icc,	0x1
	movle	%xcc,	%i2,	%l5
	fmul8x16al	%f4,	%f17,	%f6
	edge16ln	%l3,	%o0,	%o7
	brgez,a	%i5,	loop_2483
	fand	%f22,	%f26,	%f26
	nop
	setx	loop_2484,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movrgez	%l4,	0x15D,	%g6
loop_2483:
	umulcc	%l1,	0x0C28,	%l2
	movcc	%icc,	%l6,	%g4
loop_2484:
	tcc	%xcc,	0x4
	edge8	%i1,	%o2,	%g7
	movge	%xcc,	%o1,	%i3
	wr	%g0,	0x19,	%asi
	ldxa	[%l7 + 0x10] %asi,	%g5
	tne	%xcc,	0x0
	subc	%o6,	0x1BDB,	%i6
	prefetch	[%l7 + 0x44],	 0x2
	or	%g3,	0x1215,	%i7
	edge32n	%o5,	%o3,	%i0
	sub	%l0,	0x15E6,	%i4
	fbge,a	%fcc0,	loop_2485
	umul	%o4,	%g1,	%g2
	tvc	%xcc,	0x2
	taddcc	%i2,	%l3,	%o0
loop_2485:
	sub	%l5,	0x10CC,	%o7
	fnor	%f4,	%f18,	%f6
	fbl,a	%fcc3,	loop_2486
	addc	%l4,	%i5,	%l1
	edge16ln	%l2,	%l6,	%g6
	movge	%xcc,	%i1,	%o2
loop_2486:
	fcmple16	%f16,	%f20,	%g7
	fmovdneg	%xcc,	%f12,	%f11
	fones	%f20
	set	0x7C, %l5
	sta	%f27,	[%l7 + %l5] 0x81
	udivcc	%o1,	0x1C5F,	%g4
	tle	%xcc,	0x4
	wr	%g0,	0x04,	%asi
	prefetcha	[%l7 + 0x58] %asi,	 0x3
	xnor	%o6,	0x0443,	%i6
	ldsb	[%l7 + 0x62],	%i3
	fandnot2	%f30,	%f24,	%f4
	fabss	%f28,	%f30
	movre	%g3,	0x293,	%i7
	srax	%o5,	%o3,	%l0
	or	%i4,	0x0E28,	%i0
	movl	%xcc,	%g1,	%g2
	orncc	%i2,	0x112F,	%l3
	bn,a	%xcc,	loop_2487
	fmuld8ulx16	%f14,	%f8,	%f30
	stbar
	fnot1	%f28,	%f12
loop_2487:
	edge16n	%o4,	%o0,	%l5
	sdivcc	%l4,	0x1A96,	%o7
	movgu	%icc,	%l1,	%l2
	set	0x68, %g1
	ldsha	[%l7 + %g1] 0x10,	%i5
	bcs,pn	%xcc,	loop_2488
	array16	%g6,	%i1,	%o2
	smulcc	%l6,	%o1,	%g4
	set	0x30, %l1
	stwa	%g7,	[%l7 + %l1] 0x23
	membar	#Sync
loop_2488:
	nop
	membar	#Sync
	set	0x40, %o0
	ldda	[%l7 + %o0] 0x1f,	%f0
	addc	%o6,	0x101E,	%g5
	movn	%icc,	%i6,	%i3
	wr	%g0,	0x10,	%asi
	stwa	%i7,	[%l7 + 0x5C] %asi
	tn	%xcc,	0x1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	and	%g3,	0x1F63,	%o3
	udiv	%o5,	0x1833,	%l0
	tleu	%xcc,	0x2
	fsrc2s	%f14,	%f27
	ldsw	[%l7 + 0x24],	%i4
	movrne	%g1,	0x029,	%i0
	alignaddr	%i2,	%l3,	%g2
	ld	[%l7 + 0x34],	%f7
	tn	%icc,	0x0
	edge8l	%o4,	%o0,	%l5
	brlz	%o7,	loop_2489
	fmovsl	%xcc,	%f6,	%f22
	set	0x28, %o5
	swapa	[%l7 + %o5] 0x10,	%l4
loop_2489:
	fmovse	%icc,	%f6,	%f28
	movgu	%icc,	%l1,	%l2
	movl	%icc,	%g6,	%i5
	fmovdcs	%icc,	%f29,	%f13
	set	0x3C, %l0
	lduwa	[%l7 + %l0] 0x11,	%i1
	tleu	%xcc,	0x1
	fnands	%f18,	%f3,	%f21
	movle	%icc,	%l6,	%o2
	bl,a,pt	%xcc,	loop_2490
	edge16n	%o1,	%g4,	%g7
	movg	%xcc,	%g5,	%i6
	fmuld8ulx16	%f23,	%f3,	%f26
loop_2490:
	fsrc1s	%f11,	%f10
	subcc	%i3,	0x0146,	%o6
	fbn,a	%fcc3,	loop_2491
	ldx	[%l7 + 0x28],	%g3
	fnor	%f8,	%f2,	%f2
	udivx	%i7,	0x0552,	%o3
loop_2491:
	fandnot1s	%f15,	%f9,	%f31
	fbne	%fcc2,	loop_2492
	movvc	%xcc,	%o5,	%i4
	fble	%fcc3,	loop_2493
	udivcc	%l0,	0x1A6B,	%i0
loop_2492:
	tpos	%icc,	0x3
	taddcc	%g1,	%i2,	%g2
loop_2493:
	fmul8x16au	%f14,	%f21,	%f16
	edge16ln	%l3,	%o4,	%o0
	andcc	%l5,	0x0B0A,	%o7
	udiv	%l1,	0x08BF,	%l4
	fmovrde	%l2,	%f20,	%f0
	movneg	%icc,	%i5,	%g6
	stbar
	tn	%xcc,	0x7
	fmovrse	%l6,	%f4,	%f5
	movgu	%icc,	%i1,	%o2
	add	%l7,	0x30,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] %asi,	%o1,	%g4
	xnor	%g5,	%i6,	%i3
	fxors	%f9,	%f0,	%f1
	umulcc	%o6,	%g7,	%i7
	tg	%xcc,	0x0
	srl	%o3,	0x19,	%o5
	bneg,a	%xcc,	loop_2494
	or	%g3,	0x0B93,	%l0
	fbuge,a	%fcc1,	loop_2495
	array32	%i4,	%i0,	%i2
loop_2494:
	fxor	%f0,	%f24,	%f28
	sllx	%g1,	0x0F,	%l3
loop_2495:
	fpack32	%f16,	%f12,	%f30
	fbue	%fcc3,	loop_2496
	movg	%xcc,	%o4,	%o0
	orcc	%l5,	%g2,	%o7
	std	%l4,	[%l7 + 0x30]
loop_2496:
	or	%l1,	0x17A9,	%l2
	fpack16	%f8,	%f20
	fmovde	%xcc,	%f19,	%f20
	sra	%i5,	%g6,	%l6
	nop
	set	0x18, %g2
	std	%i0,	[%l7 + %g2]
	tgu	%xcc,	0x7
	movrne	%o2,	0x2B6,	%o1
	fcmpeq16	%f14,	%f28,	%g5
	tvc	%xcc,	0x0
	edge8	%g4,	%i3,	%o6
	set	0x40, %o4
	stda	%f0,	[%l7 + %o4] 0x11
	std	%f24,	[%l7 + 0x48]
	edge32ln	%g7,	%i7,	%o3
	fble,a	%fcc2,	loop_2497
	subccc	%i6,	0x0253,	%g3
	fmovdne	%icc,	%f30,	%f25
	set	0x18, %i4
	prefetcha	[%l7 + %i4] 0x89,	 0x0
loop_2497:
	stx	%i4,	[%l7 + 0x78]
	tle	%xcc,	0x6
	subcc	%o5,	%i0,	%i2
	mova	%xcc,	%l3,	%g1
	tg	%xcc,	0x4
	movvs	%icc,	%o0,	%l5
	bpos,a,pt	%icc,	loop_2498
	fblg	%fcc2,	loop_2499
	tleu	%icc,	0x1
	edge8ln	%o4,	%g2,	%o7
loop_2498:
	tvc	%icc,	0x7
loop_2499:
	ldsh	[%l7 + 0x52],	%l4
	prefetch	[%l7 + 0x60],	 0x3
	udivcc	%l1,	0x1B1E,	%l2
	fbn	%fcc0,	loop_2500
	fmovrslz	%g6,	%f11,	%f16
	be,a,pn	%xcc,	loop_2501
	udiv	%i5,	0x1448,	%i1
loop_2500:
	fmovdleu	%icc,	%f29,	%f20
	set	0x34, %l4
	lda	[%l7 + %l4] 0x80,	%f0
loop_2501:
	subcc	%o2,	%l6,	%g5
	fors	%f29,	%f24,	%f0
	edge32ln	%g4,	%o1,	%o6
	edge16n	%i3,	%i7,	%g7
	tl	%icc,	0x5
	fmovrslz	%o3,	%f27,	%f17
	be,a,pn	%icc,	loop_2502
	fmovsle	%xcc,	%f30,	%f8
	mulscc	%i6,	0x1B5C,	%l0
	edge16ln	%g3,	%o5,	%i4
loop_2502:
	movrne	%i2,	%l3,	%g1
	fnand	%f14,	%f30,	%f4
	fmovse	%xcc,	%f22,	%f19
	membar	0x30
	bgu,a	%icc,	loop_2503
	tg	%xcc,	0x7
	fandnot1	%f24,	%f18,	%f2
	mulx	%o0,	0x0D2F,	%i0
loop_2503:
	st	%f23,	[%l7 + 0x08]
	movpos	%icc,	%o4,	%l5
	nop
	set	0x5D, %o7
	ldub	[%l7 + %o7],	%g2
	brlz	%o7,	loop_2504
	movle	%icc,	%l4,	%l1
	alignaddrl	%l2,	%g6,	%i1
	tge	%icc,	0x1
loop_2504:
	umul	%o2,	0x01B2,	%l6
	bcs,a	%xcc,	loop_2505
	stbar
	edge32n	%i5,	%g4,	%g5
	ta	%xcc,	0x4
loop_2505:
	nop
	set	0x40, %g3
	ldda	[%l7 + %g3] 0x04,	%f16
	tle	%icc,	0x5
	taddcc	%o6,	0x1E3E,	%i3
	movre	%i7,	%o1,	%g7
	subccc	%i6,	0x1494,	%o3
	xorcc	%g3,	%o5,	%i4
	fbug	%fcc1,	loop_2506
	andn	%i2,	0x0CEE,	%l0
	mulx	%g1,	%l3,	%i0
	wr	%g0,	0x0c,	%asi
	lduba	[%l7 + 0x43] %asi,	%o4
loop_2506:
	edge8l	%o0,	%l5,	%g2
	bpos	loop_2507
	edge8	%o7,	%l1,	%l2
	fmul8x16	%f13,	%f12,	%f18
	edge32l	%l4,	%i1,	%o2
loop_2507:
	fmovsn	%xcc,	%f30,	%f17
	fmovdleu	%icc,	%f11,	%f19
	udiv	%l6,	0x0484,	%g6
	bvc	%xcc,	loop_2508
	edge32l	%i5,	%g5,	%g4
	andcc	%i3,	%i7,	%o1
	bvc,a	loop_2509
loop_2508:
	for	%f6,	%f20,	%f30
	membar	#Sync
	wr	%g0,	0x17,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
loop_2509:
	ldub	[%l7 + 0x50],	%g7
	fble,a	%fcc2,	loop_2510
	fbn	%fcc0,	loop_2511
	fblg	%fcc0,	loop_2512
	movg	%icc,	%o6,	%i6
loop_2510:
	taddcc	%o3,	0x0250,	%o5
loop_2511:
	brlz,a	%g3,	loop_2513
loop_2512:
	fba	%fcc3,	loop_2514
	edge32n	%i2,	%l0,	%i4
	srlx	%g1,	%i0,	%l3
loop_2513:
	nop
	setx loop_2515, %l0, %l1
	jmpl %l1, %o0
loop_2514:
	bne,a,pt	%icc,	loop_2516
	taddcctv	%o4,	%l5,	%o7
	fmovdn	%xcc,	%f8,	%f8
loop_2515:
	fones	%f14
loop_2516:
	sdivx	%l1,	0x13FF,	%g2
	sllx	%l2,	0x16,	%l4
	movrgz	%o2,	0x1E6,	%l6
	taddcctv	%g6,	%i1,	%i5
	wr	%g0,	0xe2,	%asi
	stda	%g4,	[%l7 + 0x50] %asi
	membar	#Sync
	udiv	%g4,	0x1591,	%i7
	addccc	%o1,	%g7,	%o6
	fornot2s	%f11,	%f24,	%f23
	orn	%i3,	%o3,	%o5
	movrlez	%i6,	0x32C,	%g3
	fmovdneg	%icc,	%f14,	%f3
	srlx	%i2,	0x15,	%l0
	srlx	%g1,	0x09,	%i4
	fcmpne32	%f4,	%f6,	%l3
	set	0x50, %i0
	ldda	[%l7 + %i0] 0x88,	%i0
	tcs	%xcc,	0x7
	or	%o0,	%o4,	%o7
	ta	%xcc,	0x1
	array16	%l5,	%g2,	%l1
	fandnot2	%f10,	%f20,	%f18
	movle	%xcc,	%l4,	%l2
	fbe,a	%fcc0,	loop_2517
	fble,a	%fcc3,	loop_2518
	bn	loop_2519
	call	loop_2520
loop_2517:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2518:
	fpsub16s	%f21,	%f28,	%f2
loop_2519:
	popc	%l6,	%o2
loop_2520:
	ba,pn	%icc,	loop_2521
	andn	%g6,	0x0F46,	%i5
	movrne	%g5,	0x195,	%g4
	fand	%f30,	%f30,	%f16
loop_2521:
	andn	%i1,	0x0E87,	%o1
	orn	%i7,	0x1605,	%o6
	movne	%icc,	%g7,	%i3
	andcc	%o5,	0x1A78,	%o3
	andcc	%g3,	%i6,	%l0
	movgu	%icc,	%i2,	%g1
	tl	%icc,	0x7
	umulcc	%i4,	0x0461,	%l3
	nop
	set	0x28, %g5
	stx	%o0,	[%l7 + %g5]
	fmovsle	%xcc,	%f12,	%f29
	tcc	%icc,	0x0
	umulcc	%o4,	%o7,	%l5
	sdivx	%i0,	0x0D83,	%g2
	fcmpgt16	%f20,	%f6,	%l1
	fpack16	%f16,	%f10
	movrgez	%l4,	0x3DB,	%l6
	subc	%l2,	%o2,	%i5
	bneg,pt	%icc,	loop_2522
	fcmpne16	%f30,	%f4,	%g5
	fnands	%f11,	%f28,	%f22
	prefetch	[%l7 + 0x14],	 0x0
loop_2522:
	nop
	add	%l7,	0x38,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%g4
	casa	[%l6] 0x80,	%g4,	%i1
	srlx	%g6,	0x1E,	%o1
	movneg	%icc,	%o6,	%g7
	taddcc	%i3,	%o5,	%i7
	sdiv	%o3,	0x1F77,	%i6
	lduh	[%l7 + 0x5E],	%l0
	alignaddrl	%g3,	%g1,	%i4
	move	%icc,	%i2,	%l3
	brz,a	%o4,	loop_2523
	fpsub32	%f8,	%f14,	%f2
	subc	%o7,	0x1B0E,	%o0
	tsubcc	%i0,	%g2,	%l5
loop_2523:
	edge32	%l4,	%l6,	%l1
	brgez,a	%o2,	loop_2524
	fpsub16s	%f25,	%f7,	%f9
	fmovsl	%xcc,	%f6,	%f28
	wr	%g0,	0x10,	%asi
	stwa	%i5,	[%l7 + 0x28] %asi
loop_2524:
	fxnor	%f14,	%f6,	%f22
	and	%g5,	0x11D0,	%l2
	fxnors	%f27,	%f6,	%f25
	sdivx	%i1,	0x1DE0,	%g6
	bneg,pt	%xcc,	loop_2525
	fmovscc	%xcc,	%f13,	%f1
	bneg	loop_2526
	fbuge,a	%fcc0,	loop_2527
loop_2525:
	movre	%o1,	0x2BC,	%o6
	fbne	%fcc0,	loop_2528
loop_2526:
	fmovsa	%xcc,	%f8,	%f7
loop_2527:
	nop
	set	0x70, %o3
	ldxa	[%l7 + %o3] 0x14,	%g7
loop_2528:
	movrgz	%g4,	%o5,	%i7
	tcs	%xcc,	0x4
	movrlz	%o3,	%i6,	%i3
	flush	%l7 + 0x50
	fcmps	%fcc3,	%f30,	%f31
	tge	%icc,	0x0
	fbule,a	%fcc1,	loop_2529
	fmuld8sux16	%f12,	%f5,	%f30
	tgu	%xcc,	0x6
	bcs	loop_2530
loop_2529:
	tg	%icc,	0x7
	edge16l	%g3,	%g1,	%l0
	subcc	%i4,	0x02EE,	%i2
loop_2530:
	fbug,a	%fcc0,	loop_2531
	fmovdg	%xcc,	%f17,	%f10
	fmovsle	%icc,	%f17,	%f18
	umulcc	%l3,	%o4,	%o7
loop_2531:
	movneg	%xcc,	%i0,	%g2
	mulx	%l5,	0x11FF,	%l4
	fpack16	%f8,	%f14
	movneg	%xcc,	%o0,	%l6
	popc	%l1,	%i5
	tgu	%icc,	0x5
	prefetch	[%l7 + 0x08],	 0x3
	movl	%icc,	%g5,	%o2
	movpos	%xcc,	%l2,	%g6
	fnegs	%f19,	%f15
	wr	%g0,	0xe2,	%asi
	stwa	%o1,	[%l7 + 0x24] %asi
	membar	#Sync
	mulscc	%i1,	%o6,	%g7
	xor	%g4,	0x1CC5,	%o5
	tgu	%xcc,	0x6
	edge32n	%o3,	%i6,	%i3
	array8	%i7,	%g3,	%l0
	te	%icc,	0x3
	sub	%i4,	%g1,	%l3
	alignaddr	%i2,	%o7,	%o4
	fxors	%f11,	%f22,	%f24
	fmovdg	%icc,	%f21,	%f24
	fbule	%fcc2,	loop_2532
	fcmpgt16	%f10,	%f2,	%i0
	fbue,a	%fcc1,	loop_2533
	umulcc	%l5,	%g2,	%l4
loop_2532:
	subc	%o0,	%l1,	%l6
	fbuge	%fcc0,	loop_2534
loop_2533:
	edge32ln	%i5,	%o2,	%g5
	edge8n	%g6,	%o1,	%l2
	movvs	%icc,	%i1,	%o6
loop_2534:
	add	%g4,	0x1CCE,	%o5
	srlx	%o3,	0x12,	%g7
	fabsd	%f18,	%f12
	edge16l	%i3,	%i6,	%g3
	mova	%icc,	%i7,	%i4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mulscc	%l0,	%g1,	%i2
	movcs	%xcc,	%o7,	%l3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpackfix	%f14,	%f19
	fmovse	%xcc,	%f14,	%f13
	set	0x30, %i7
	ldda	[%l7 + %i7] 0x88,	%o4
	fbuge,a	%fcc0,	loop_2535
	movrne	%l5,	0x099,	%g2
	alignaddr	%l4,	%i0,	%o0
	movre	%l1,	0x1A1,	%i5
loop_2535:
	fba,a	%fcc0,	loop_2536
	fmovrdlez	%l6,	%f12,	%f16
	edge16n	%g5,	%g6,	%o2
	fsrc2s	%f12,	%f2
loop_2536:
	fnot1s	%f21,	%f26
	edge8	%l2,	%o1,	%o6
	movneg	%xcc,	%i1,	%o5
	fbn,a	%fcc3,	loop_2537
	udiv	%g4,	0x1266,	%g7
	for	%f0,	%f8,	%f4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2537:
	nop
	set	0x77, %g4
	ldsba	[%l7 + %g4] 0x0c,	%o3
	fxnors	%f31,	%f22,	%f25
	fmovsgu	%icc,	%f10,	%f23
	subcc	%i6,	0x00A4,	%g3
	orn	%i3,	0x0AE5,	%i4
	tleu	%icc,	0x0
	mulx	%l0,	%i7,	%i2
	udivcc	%o7,	0x1E59,	%g1
	edge8ln	%l3,	%o4,	%g2
	edge8ln	%l4,	%i0,	%o0
	fmul8ulx16	%f16,	%f14,	%f14
	sth	%l1,	[%l7 + 0x5E]
	movrne	%l5,	0x2DD,	%l6
	edge8n	%g5,	%g6,	%o2
	lduh	[%l7 + 0x4E],	%i5
	edge8l	%o1,	%o6,	%i1
	ldsb	[%l7 + 0x2A],	%l2
	tneg	%icc,	0x3
	movrgz	%g4,	0x330,	%o5
	ba,a,pt	%xcc,	loop_2538
	be	%icc,	loop_2539
	fpack32	%f26,	%f8,	%f2
	nop
	set	0x5F, %i3
	ldub	[%l7 + %i3],	%g7
loop_2538:
	edge32n	%i6,	%o3,	%i3
loop_2539:
	nop
	wr	%g0,	0x80,	%asi
	lduwa	[%l7 + 0x38] %asi,	%g3
	fbe	%fcc0,	loop_2540
	andncc	%i4,	%l0,	%i2
	lduw	[%l7 + 0x68],	%i7
	srl	%o7,	%l3,	%g1
loop_2540:
	fones	%f22
	movcc	%xcc,	%g2,	%l4
	andn	%o4,	%i0,	%l1
	fands	%f17,	%f15,	%f15
	wr	%g0,	0x81,	%asi
	swapa	[%l7 + 0x54] %asi,	%o0
	fones	%f17
	sdivcc	%l5,	0x1AE2,	%g5
	lduw	[%l7 + 0x2C],	%g6
	movl	%xcc,	%l6,	%o2
	fcmps	%fcc1,	%f6,	%f12
	edge16ln	%i5,	%o6,	%i1
	subcc	%l2,	0x1CB6,	%g4
	sth	%o5,	[%l7 + 0x44]
	edge16	%o1,	%g7,	%o3
	orncc	%i6,	0x0572,	%g3
	fbn,a	%fcc0,	loop_2541
	mulscc	%i4,	%i3,	%l0
	edge16n	%i2,	%i7,	%o7
	tcs	%xcc,	0x3
loop_2541:
	movneg	%xcc,	%g1,	%g2
	set	0x58, %g6
	swapa	[%l7 + %g6] 0x80,	%l4
	xnorcc	%o4,	%i0,	%l3
	fzero	%f20
	ldub	[%l7 + 0x2F],	%o0
	add	%l7,	0x10,	%l6
	wr	%g0,	0x10,	%asi
	lda	[%l6] %asi,	%l1
	casa	[%l6] %asi,	%l1,	%g5
	ldsw	[%l7 + 0x54],	%g6
	subcc	%l5,	0x138E,	%l6
	bleu,a,pn	%icc,	loop_2542
	srlx	%o2,	0x09,	%o6
	edge32ln	%i5,	%i1,	%l2
	tvs	%icc,	0x1
loop_2542:
	or	%g4,	%o1,	%o5
	mova	%icc,	%g7,	%i6
	fandnot2s	%f28,	%f4,	%f10
	set	0x74, %o1
	stba	%o3,	[%l7 + %o1] 0x18
	set	0x74, %l6
	lduba	[%l7 + %l6] 0x04,	%i4
	fones	%f6
	tge	%icc,	0x5
	fornot2	%f16,	%f24,	%f0
	bg	loop_2543
	srax	%g3,	%l0,	%i3
	taddcc	%i2,	0x0E3F,	%i7
	tl	%icc,	0x7
loop_2543:
	mulscc	%g1,	%g2,	%o7
	xorcc	%l4,	0x04B0,	%i0
	bg,pt	%xcc,	loop_2544
	taddcctv	%l3,	%o4,	%o0
	addcc	%g5,	0x0C66,	%l1
	tge	%icc,	0x2
loop_2544:
	tvs	%xcc,	0x0
	prefetch	[%l7 + 0x50],	 0x1
	fmovd	%f8,	%f8
	wr	%g0,	0xf0,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
	tvc	%xcc,	0x4
	subccc	%g6,	%l6,	%o2
	edge16ln	%l5,	%o6,	%i5
	tsubcctv	%l2,	%g4,	%o1
	sdivx	%i1,	0x1A61,	%g7
	tvs	%icc,	0x7
	fmovdgu	%xcc,	%f12,	%f28
	fpsub16	%f16,	%f12,	%f14
	wr	%g0,	0x2a,	%asi
	stha	%i6,	[%l7 + 0x66] %asi
	membar	#Sync
	fands	%f15,	%f11,	%f24
	fmovdleu	%icc,	%f12,	%f18
	tg	%xcc,	0x3
	or	%o3,	%i4,	%o5
	stx	%g3,	[%l7 + 0x50]
	fandnot2	%f16,	%f6,	%f6
	sdivx	%i3,	0x1B4A,	%l0
	orn	%i7,	%i2,	%g2
	edge32	%o7,	%g1,	%l4
	smul	%i0,	%l3,	%o4
	fbule	%fcc3,	loop_2545
	udivcc	%o0,	0x1F6F,	%l1
	sethi	0x069C,	%g6
	tsubcctv	%g5,	%l6,	%o2
loop_2545:
	movcc	%icc,	%l5,	%i5
	fmovrde	%o6,	%f6,	%f24
	movrlez	%l2,	%o1,	%g4
	wr	%g0,	0x50,	%asi
	ldxa	[%g0 + 0x18] %asi,	%i1
	tneg	%icc,	0x3
	sra	%i6,	0x11,	%o3
	set	0x4C, %o2
	swapa	[%l7 + %o2] 0x81,	%i4
	tpos	%icc,	0x2
	edge16ln	%g7,	%g3,	%o5
	fbu	%fcc2,	loop_2546
	sdivx	%l0,	0x0129,	%i3
	tgu	%xcc,	0x1
	edge16n	%i7,	%g2,	%i2
loop_2546:
	orcc	%g1,	0x07C6,	%l4
	mulscc	%i0,	0x0513,	%o7
	stw	%o4,	[%l7 + 0x6C]
	wr	%g0,	0x89,	%asi
	sta	%f19,	[%l7 + 0x54] %asi
	call	loop_2547
	fxors	%f18,	%f23,	%f15
	ld	[%l7 + 0x60],	%f8
	move	%xcc,	%o0,	%l1
loop_2547:
	orn	%l3,	0x0D22,	%g6
	srlx	%l6,	%g5,	%l5
	fmovsgu	%xcc,	%f13,	%f25
	movvc	%icc,	%i5,	%o2
	fmovdg	%xcc,	%f20,	%f4
	ldd	[%l7 + 0x30],	%l2
	faligndata	%f20,	%f22,	%f6
	wr	%g0,	0x04,	%asi
	ldxa	[%l7 + 0x40] %asi,	%o6
	fbe,a	%fcc1,	loop_2548
	ba,a	loop_2549
	ta	%icc,	0x4
	edge8l	%o1,	%g4,	%i6
loop_2548:
	fmovsle	%xcc,	%f15,	%f30
loop_2549:
	fxor	%f6,	%f30,	%f12
	bneg,a	loop_2550
	movge	%icc,	%i1,	%o3
	fcmpgt32	%f6,	%f10,	%i4
	andn	%g7,	0x175A,	%g3
loop_2550:
	bvc,a,pt	%icc,	loop_2551
	umulcc	%l0,	0x12B6,	%o5
	fmovdn	%icc,	%f26,	%f29
	tle	%xcc,	0x4
loop_2551:
	fcmped	%fcc2,	%f22,	%f18
	movcs	%xcc,	%i7,	%i3
	movcs	%icc,	%g2,	%i2
	tleu	%xcc,	0x4
	move	%icc,	%l4,	%i0
	brlez	%g1,	loop_2552
	orn	%o7,	0x116A,	%o4
	tle	%icc,	0x7
	bcc,a	loop_2553
loop_2552:
	tgu	%icc,	0x6
	be,a	loop_2554
	sdivx	%l1,	0x1DDB,	%o0
loop_2553:
	mulscc	%g6,	0x0EED,	%l6
	fmovdne	%xcc,	%f13,	%f24
loop_2554:
	sllx	%g5,	0x0B,	%l5
	brlez,a	%i5,	loop_2555
	tleu	%xcc,	0x0
	brgez,a	%o2,	loop_2556
	udivx	%l2,	0x19CA,	%o6
loop_2555:
	addcc	%o1,	%l3,	%g4
	te	%icc,	0x2
loop_2556:
	movrlz	%i6,	0x023,	%o3
	sdivx	%i1,	0x1F9E,	%g7
	mulscc	%g3,	0x1652,	%l0
	fmovdcc	%xcc,	%f14,	%f3
	addcc	%o5,	0x1B0B,	%i7
	movpos	%icc,	%i4,	%i3
	sdivcc	%g2,	0x000F,	%l4
	fors	%f15,	%f25,	%f21
	addcc	%i2,	0x0EB0,	%g1
	tvc	%xcc,	0x4
	movl	%icc,	%o7,	%i0
	addc	%o4,	0x1FD1,	%o0
	movvs	%xcc,	%l1,	%g6
	fbne,a	%fcc0,	loop_2557
	fnot1	%f20,	%f30
	addccc	%g5,	%l5,	%i5
	movrne	%l6,	0x12B,	%o2
loop_2557:
	tleu	%icc,	0x4
	alignaddrl	%l2,	%o6,	%o1
	alignaddrl	%l3,	%i6,	%o3
	fmovsg	%icc,	%f19,	%f25
	andn	%i1,	%g4,	%g7
	udivcc	%l0,	0x09C3,	%o5
	sdivx	%g3,	0x107C,	%i7
	srax	%i4,	%i3,	%g2
	edge16ln	%i2,	%l4,	%g1
	smulcc	%o7,	%i0,	%o4
	fcmpne16	%f30,	%f2,	%l1
	sethi	0x04AD,	%g6
	addccc	%o0,	0x1546,	%g5
	tsubcc	%l5,	0x002A,	%i5
	faligndata	%f6,	%f20,	%f16
	tge	%xcc,	0x2
	movg	%icc,	%o2,	%l2
	sdiv	%o6,	0x07DA,	%o1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovde	%xcc,	%f12,	%f20
	set	0x20, %i1
	stda	%i6,	[%l7 + %i1] 0xe2
	membar	#Sync
	udivcc	%l3,	0x0BF3,	%o3
	fmovscc	%xcc,	%f19,	%f11
	tge	%xcc,	0x4
	brgez	%i6,	loop_2558
	edge32ln	%i1,	%g7,	%g4
	ldd	[%l7 + 0x78],	%f20
	xor	%l0,	0x05F8,	%g3
loop_2558:
	fornot2	%f24,	%f30,	%f10
	fcmpne16	%f24,	%f30,	%o5
	udivcc	%i4,	0x1B41,	%i7
	edge16	%i3,	%g2,	%l4
	fcmpeq16	%f6,	%f30,	%i2
	ldsh	[%l7 + 0x28],	%g1
	lduw	[%l7 + 0x50],	%o7
	set	0x48, %g7
	stxa	%i0,	[%l7 + %g7] 0x2a
	membar	#Sync
	tsubcc	%o4,	0x0A62,	%g6
	edge8l	%o0,	%l1,	%g5
	nop
	set	0x30, %l2
	std	%f26,	[%l7 + %l2]
	swap	[%l7 + 0x44],	%l5
	fnot2s	%f28,	%f14
	pdist	%f12,	%f30,	%f20
	andn	%o2,	0x0E83,	%l2
	tn	%xcc,	0x7
	umulcc	%o6,	0x1807,	%i5
	addccc	%l6,	0x0B9D,	%l3
	fmovrde	%o1,	%f30,	%f24
	brlez	%i6,	loop_2559
	fmovsne	%xcc,	%f25,	%f10
	movn	%icc,	%i1,	%o3
	andncc	%g7,	%g4,	%g3
loop_2559:
	tpos	%icc,	0x3
	wr	%g0,	0x80,	%asi
	lduwa	[%l7 + 0x64] %asi,	%l0
	movre	%o5,	0x36F,	%i7
	srax	%i3,	0x07,	%i4
	movrlz	%g2,	%i2,	%g1
	siam	0x5
	fones	%f29
	movne	%xcc,	%o7,	%i0
	flush	%l7 + 0x10
	set	0x70, %o6
	stwa	%o4,	[%l7 + %o6] 0xeb
	membar	#Sync
	edge16	%l4,	%o0,	%l1
	mulx	%g5,	0x0D4F,	%l5
	fabsd	%f30,	%f24
	mova	%icc,	%g6,	%o2
	array16	%l2,	%i5,	%o6
	movge	%icc,	%l6,	%o1
	fbn,a	%fcc1,	loop_2560
	fmovdvc	%icc,	%f24,	%f26
	fmovdgu	%xcc,	%f30,	%f11
	std	%f14,	[%l7 + 0x30]
loop_2560:
	fcmpne32	%f28,	%f30,	%l3
	fcmpgt32	%f0,	%f4,	%i6
	fmovdvc	%xcc,	%f30,	%f4
	tsubcc	%o3,	%g7,	%g4
	udivx	%g3,	0x163B,	%i1
	xorcc	%o5,	0x1AF5,	%i7
	fmovdvc	%icc,	%f28,	%f14
	fpmerge	%f21,	%f17,	%f28
	move	%icc,	%i3,	%i4
	udivcc	%l0,	0x16CA,	%g2
	fnot2s	%f27,	%f16
	addc	%g1,	0x01C2,	%o7
	fcmpeq16	%f18,	%f22,	%i0
	tleu	%xcc,	0x6
	edge16	%o4,	%l4,	%i2
	umul	%o0,	%l1,	%l5
	tg	%icc,	0x1
	fmul8x16au	%f1,	%f23,	%f10
	fandnot1	%f2,	%f6,	%f24
	sdivcc	%g5,	0x1907,	%g6
	array8	%o2,	%l2,	%i5
	wr	%g0,	0x21,	%asi
	stxa	%l6,	[%g0 + 0x110] %asi
	movpos	%icc,	%o1,	%l3
	fbul,a	%fcc0,	loop_2561
	fsrc1	%f8,	%f20
	srl	%o6,	%i6,	%g7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2561:
	and	%g4,	%o3,	%i1
	brz,a	%g3,	loop_2562
	edge8n	%o5,	%i7,	%i3
	fbue,a	%fcc3,	loop_2563
	fmovs	%f13,	%f26
loop_2562:
	edge8n	%l0,	%i4,	%g2
	edge8	%o7,	%i0,	%g1
loop_2563:
	andcc	%l4,	0x034B,	%i2
	movvs	%xcc,	%o0,	%o4
	nop
	set	0x28, %i2
	std	%l4,	[%l7 + %i2]
	fxors	%f1,	%f22,	%f6
	tgu	%xcc,	0x3
	std	%f22,	[%l7 + 0x70]
	taddcc	%g5,	0x0649,	%g6
	fnor	%f28,	%f22,	%f16
	fbge,a	%fcc1,	loop_2564
	tne	%xcc,	0x0
	mulscc	%l1,	%l2,	%i5
	addc	%o2,	%l6,	%l3
loop_2564:
	movre	%o1,	%i6,	%o6
	edge16	%g4,	%g7,	%o3
	movpos	%xcc,	%i1,	%o5
	ldsh	[%l7 + 0x52],	%g3
	movgu	%xcc,	%i3,	%l0
	membar	0x2A
	andcc	%i4,	0x1948,	%i7
	sub	%o7,	%g2,	%g1
	sdivx	%i0,	0x1315,	%i2
	set	0x30, %l3
	ldda	[%l7 + %l3] 0xea,	%l4
	lduw	[%l7 + 0x44],	%o0
	tgu	%icc,	0x6
	fpadd16s	%f20,	%f4,	%f13
	fnegd	%f22,	%f2
	stw	%o4,	[%l7 + 0x70]
	udivx	%g5,	0x1148,	%g6
	xnorcc	%l5,	0x0CD4,	%l2
	bge,a	loop_2565
	addccc	%i5,	0x1337,	%l1
	tvc	%xcc,	0x5
	edge32n	%l6,	%o2,	%o1
loop_2565:
	fmovdpos	%xcc,	%f14,	%f28
	array32	%i6,	%l3,	%o6
	wr	%g0,	0x0c,	%asi
	swapa	[%l7 + 0x1C] %asi,	%g4
	fornot1	%f2,	%f0,	%f28
	fpsub32	%f22,	%f22,	%f20
	sll	%g7,	0x0F,	%o3
	movne	%icc,	%i1,	%o5
	st	%f23,	[%l7 + 0x24]
	set	0x20, %i6
	stxa	%i3,	[%l7 + %i6] 0x18
	nop
	setx	loop_2566,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movcc	%icc,	%g3,	%i4
	wr	%g0,	0x18,	%asi
	swapa	[%l7 + 0x74] %asi,	%l0
loop_2566:
	udiv	%o7,	0x0D3F,	%g2
	fmovsvs	%xcc,	%f29,	%f28
	te	%xcc,	0x7
	fmovrse	%g1,	%f26,	%f17
	fmuld8ulx16	%f18,	%f14,	%f12
	andn	%i0,	0x0069,	%i2
	edge32ln	%i7,	%l4,	%o0
	fmovdl	%xcc,	%f5,	%f23
	popc	0x0C84,	%o4
	udivx	%g6,	0x04E4,	%l5
	smulcc	%l2,	0x1363,	%g5
	udivcc	%l1,	0x0A45,	%l6
	fsrc1	%f16,	%f12
	tge	%xcc,	0x6
	fmovrslz	%o2,	%f19,	%f27
	array16	%i5,	%o1,	%i6
	fone	%f16
	fxor	%f16,	%f10,	%f28
	fcmpgt32	%f4,	%f26,	%o6
	sethi	0x1081,	%l3
	fble,a	%fcc1,	loop_2567
	xorcc	%g7,	%g4,	%o3
	sub	%o5,	%i1,	%i3
	edge32	%g3,	%l0,	%o7
loop_2567:
	edge32n	%g2,	%i4,	%i0
	fbn	%fcc1,	loop_2568
	andcc	%i2,	%i7,	%l4
	andn	%g1,	%o0,	%o4
	edge8n	%g6,	%l5,	%g5
loop_2568:
	edge16n	%l2,	%l6,	%l1
	umulcc	%i5,	%o1,	%i6
	fmovd	%f26,	%f30
	fmul8x16al	%f27,	%f23,	%f24
	wr	%g0,	0x88,	%asi
	ldswa	[%l7 + 0x0C] %asi,	%o6
	add	%l7,	0x20,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%l3
	casa	[%l6] %asi,	%l3,	%g7
	sub	%o2,	0x0294,	%o3
	bne,a,pt	%xcc,	loop_2569
	fmovdg	%xcc,	%f5,	%f2
	edge16ln	%o5,	%g4,	%i1
	orn	%i3,	0x12F7,	%g3
loop_2569:
	edge16	%l0,	%g2,	%i4
	fmovde	%xcc,	%f7,	%f5
	fornot1	%f18,	%f16,	%f2
	ldx	[%l7 + 0x38],	%o7
	fmovrdne	%i0,	%f24,	%f4
	fpadd16	%f12,	%f24,	%f24
	fbl,a	%fcc0,	loop_2570
	udiv	%i7,	0x09FE,	%l4
	fmovdle	%icc,	%f12,	%f8
	alignaddr	%g1,	%o0,	%o4
loop_2570:
	mulx	%i2,	0x0F7E,	%l5
	fxnor	%f22,	%f16,	%f12
	tsubcc	%g5,	%g6,	%l6
	fbe,a	%fcc3,	loop_2571
	fbo	%fcc1,	loop_2572
	movrlz	%l2,	%i5,	%l1
	alignaddr	%i6,	%o1,	%l3
loop_2571:
	nop
	set	0x40, %l5
	stwa	%o6,	[%l7 + %l5] 0x10
loop_2572:
	fbo,a	%fcc3,	loop_2573
	edge16l	%g7,	%o2,	%o5
	fmovdne	%xcc,	%f2,	%f26
	tge	%xcc,	0x4
loop_2573:
	tcs	%xcc,	0x7
	or	%o3,	%g4,	%i1
	ldsb	[%l7 + 0x10],	%g3
	movcs	%icc,	%i3,	%g2
	fcmpgt16	%f12,	%f26,	%l0
	srl	%i4,	%o7,	%i7
	taddcc	%l4,	%i0,	%g1
	tge	%icc,	0x3
	fpmerge	%f20,	%f20,	%f12
	fpadd32s	%f7,	%f6,	%f5
	andncc	%o4,	%i2,	%l5
	fbge	%fcc1,	loop_2574
	movge	%xcc,	%o0,	%g6
	edge8n	%g5,	%l6,	%l2
	fmovsg	%xcc,	%f7,	%f26
loop_2574:
	movg	%icc,	%i5,	%l1
	tsubcc	%o1,	0x1BA0,	%i6
	movcc	%icc,	%l3,	%g7
	movrne	%o6,	0x23F,	%o2
	tvc	%xcc,	0x3
	taddcctv	%o5,	0x1455,	%g4
	array16	%i1,	%g3,	%i3
	movcc	%icc,	%o3,	%g2
	ldx	[%l7 + 0x40],	%i4
	srl	%l0,	%o7,	%i7
	movpos	%xcc,	%l4,	%i0
	brnz,a	%g1,	loop_2575
	membar	0x4D
	xorcc	%i2,	0x0D62,	%o4
	fcmped	%fcc2,	%f30,	%f28
loop_2575:
	fbug,a	%fcc0,	loop_2576
	movrne	%o0,	%g6,	%g5
	fcmped	%fcc1,	%f26,	%f2
	movrlez	%l5,	%l2,	%l6
loop_2576:
	movg	%icc,	%i5,	%o1
	subcc	%i6,	0x02EE,	%l3
	orncc	%g7,	0x0DB1,	%l1
	tsubcctv	%o2,	%o6,	%g4
	te	%icc,	0x7
	fnot1	%f24,	%f28
	orcc	%o5,	0x1E02,	%i1
	sethi	0x1FCB,	%i3
	wr	%g0,	0x88,	%asi
	stda	%o2,	[%l7 + 0x38] %asi
	array16	%g2,	%g3,	%i4
	fbg,a	%fcc0,	loop_2577
	ldsw	[%l7 + 0x78],	%o7
	ldsh	[%l7 + 0x7C],	%l0
	movg	%icc,	%i7,	%l4
loop_2577:
	edge32	%i0,	%i2,	%o4
	bg,pn	%icc,	loop_2578
	fxnor	%f30,	%f30,	%f18
	fones	%f29
	sra	%o0,	0x00,	%g6
loop_2578:
	fmovsl	%xcc,	%f18,	%f0
	movrlz	%g1,	0x19B,	%g5
	movrlz	%l2,	%l5,	%l6
	popc	0x1246,	%i5
	be,pt	%xcc,	loop_2579
	xor	%o1,	0x156F,	%l3
	movrlz	%i6,	0x34A,	%l1
	fbue,a	%fcc3,	loop_2580
loop_2579:
	udivx	%o2,	0x1445,	%o6
	mova	%xcc,	%g4,	%g7
	set	0x0E, %i5
	lduha	[%l7 + %i5] 0x0c,	%i1
loop_2580:
	fbul	%fcc1,	loop_2581
	edge8	%i3,	%o3,	%g2
	xor	%g3,	0x115A,	%o5
	membar	0x5F
loop_2581:
	array16	%i4,	%l0,	%o7
	set	0x08, %l1
	sta	%f12,	[%l7 + %l1] 0x15
	movre	%l4,	0x038,	%i7
	fnands	%f23,	%f4,	%f10
	fmul8sux16	%f16,	%f28,	%f14
	tvs	%icc,	0x4
	umul	%i0,	0x1A1C,	%i2
	edge16ln	%o4,	%g6,	%g1
	fcmpne16	%f26,	%f2,	%g5
	edge16	%l2,	%o0,	%l5
	array8	%l6,	%o1,	%i5
	set	0x58, %o0
	swapa	[%l7 + %o0] 0x80,	%i6
	tg	%xcc,	0x3
	fornot2	%f6,	%f28,	%f24
	ldd	[%l7 + 0x58],	%l2
	fcmpeq16	%f16,	%f18,	%o2
	brz	%l1,	loop_2582
	bl	%xcc,	loop_2583
	movrne	%g4,	0x06A,	%o6
	udivx	%i1,	0x0619,	%g7
loop_2582:
	srl	%i3,	%g2,	%g3
loop_2583:
	array32	%o5,	%i4,	%l0
	ta	%xcc,	0x5
	tcs	%xcc,	0x4
	fmovsl	%icc,	%f7,	%f31
	ldsw	[%l7 + 0x68],	%o7
	wr	%g0,	0x81,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	ble,pt	%xcc,	loop_2584
	movcs	%xcc,	%o3,	%l4
	fmovdvc	%xcc,	%f16,	%f20
	movrne	%i7,	%i0,	%i2
loop_2584:
	movgu	%icc,	%o4,	%g6
	fmovdle	%icc,	%f24,	%f15
	edge32	%g1,	%g5,	%l2
	bvc,pn	%icc,	loop_2585
	tgu	%icc,	0x5
	fnot2	%f22,	%f24
	nop
	set	0x0C, %g1
	lduw	[%l7 + %g1],	%o0
loop_2585:
	srlx	%l5,	0x17,	%o1
	edge16	%l6,	%i5,	%i6
	bneg	loop_2586
	brnz,a	%l3,	loop_2587
	stx	%l1,	[%l7 + 0x30]
	fcmpd	%fcc1,	%f26,	%f18
loop_2586:
	nop
	wr	%g0,	0x10,	%asi
	lduba	[%l7 + 0x09] %asi,	%g4
loop_2587:
	subcc	%o2,	%i1,	%g7
	andcc	%i3,	0x0906,	%o6
	movcs	%xcc,	%g2,	%o5
	andn	%g3,	%i4,	%l0
	array16	%o7,	%l4,	%o3
	fmovdcs	%icc,	%f12,	%f5
	mulx	%i7,	0x1441,	%i0
	flush	%l7 + 0x5C
	fabsd	%f20,	%f0
	ld	[%l7 + 0x3C],	%f15
	fsrc1s	%f14,	%f19
	te	%xcc,	0x5
	fornot2	%f0,	%f14,	%f8
	addccc	%i2,	0x0491,	%o4
	fbul,a	%fcc2,	loop_2588
	fmul8sux16	%f16,	%f26,	%f10
	sir	0x154E
	taddcctv	%g6,	%g1,	%g5
loop_2588:
	tn	%icc,	0x2
	edge16n	%l2,	%l5,	%o0
	fmovspos	%xcc,	%f30,	%f27
	fmovdne	%xcc,	%f12,	%f5
	bcc,pn	%xcc,	loop_2589
	fmovrse	%l6,	%f29,	%f27
	array8	%o1,	%i5,	%i6
	fmovdleu	%icc,	%f7,	%f20
loop_2589:
	fmovrdne	%l1,	%f2,	%f26
	addc	%l3,	0x13A7,	%o2
	tgu	%xcc,	0x5
	movvs	%xcc,	%i1,	%g4
	movrlz	%g7,	0x10E,	%o6
	alignaddr	%i3,	%g2,	%g3
	move	%icc,	%i4,	%l0
	fmovde	%xcc,	%f23,	%f22
	tvs	%xcc,	0x2
	xorcc	%o7,	%o5,	%l4
	movvs	%icc,	%o3,	%i7
	fmovsneg	%icc,	%f27,	%f23
	fxor	%f30,	%f0,	%f22
	ldsb	[%l7 + 0x1F],	%i2
	brlez,a	%o4,	loop_2590
	array32	%g6,	%g1,	%i0
	tleu	%xcc,	0x2
	movrgz	%g5,	0x39E,	%l2
loop_2590:
	movl	%icc,	%o0,	%l6
	tne	%xcc,	0x0
	sllx	%l5,	0x1C,	%i5
	fnegs	%f3,	%f23
	fmovdcc	%xcc,	%f22,	%f10
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array16	%i6,	%l1,	%o1
	tsubcc	%l3,	0x1370,	%o2
	edge32n	%i1,	%g4,	%o6
	fzeros	%f0
	edge8	%i3,	%g7,	%g2
	ldstub	[%l7 + 0x6F],	%i4
	bvc,a	%icc,	loop_2591
	xnor	%l0,	0x036F,	%g3
	stx	%o7,	[%l7 + 0x60]
	fbe	%fcc3,	loop_2592
loop_2591:
	fbe	%fcc1,	loop_2593
	xor	%o5,	0x0BC9,	%o3
	taddcc	%i7,	0x1AAD,	%i2
loop_2592:
	fmovdle	%icc,	%f16,	%f12
loop_2593:
	tn	%icc,	0x5
	tsubcc	%o4,	0x100F,	%l4
	fbul,a	%fcc0,	loop_2594
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdl	%icc,	%f7,	%f0
	wr	%g0,	0x88,	%asi
	ldsha	[%l7 + 0x38] %asi,	%g6
loop_2594:
	movrlz	%g1,	%g5,	%i0
	andn	%o0,	%l6,	%l2
	fbu	%fcc3,	loop_2595
	umulcc	%i5,	0x0800,	%i6
	edge32l	%l5,	%o1,	%l3
	fbe	%fcc3,	loop_2596
loop_2595:
	tcs	%xcc,	0x2
	bg,a	loop_2597
	alignaddrl	%l1,	%o2,	%i1
loop_2596:
	tge	%xcc,	0x7
	brlez	%g4,	loop_2598
loop_2597:
	tleu	%xcc,	0x0
	pdist	%f20,	%f4,	%f18
	bge,pt	%icc,	loop_2599
loop_2598:
	movg	%xcc,	%o6,	%g7
	fmul8x16al	%f27,	%f24,	%f30
	faligndata	%f24,	%f4,	%f16
loop_2599:
	fnegd	%f14,	%f22
	fpmerge	%f31,	%f29,	%f12
	umul	%i3,	0x0CD5,	%i4
	movvc	%icc,	%l0,	%g3
	xorcc	%g2,	0x19F7,	%o5
	wr	%g0,	0x80,	%asi
	lduha	[%l7 + 0x42] %asi,	%o7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbue,a	%fcc0,	loop_2600
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
	fmovdcc	%icc,	%f28,	%f12
	ldx	[%l7 + 0x30],	%i7
loop_2600:
	edge32	%o3,	%i2,	%o4
loop_2601:
	smulcc	%g6,	0x1C0A,	%g1
	edge16	%g5,	%l4,	%i0
	fmovda	%xcc,	%f2,	%f20
	wr	%g0,	0x89,	%asi
	swapa	[%l7 + 0x14] %asi,	%l6
	sth	%o0,	[%l7 + 0x14]
	alignaddrl	%l2,	%i5,	%i6
	fmul8x16	%f24,	%f12,	%f2
	movle	%xcc,	%o1,	%l5
	tge	%xcc,	0x0
	sth	%l3,	[%l7 + 0x10]
	srax	%o2,	%i1,	%g4
	tleu	%xcc,	0x1
	fcmped	%fcc1,	%f24,	%f20
	mulx	%o6,	%g7,	%l1
	bneg	%icc,	loop_2602
	fmovsgu	%icc,	%f8,	%f25
	fcmpne32	%f0,	%f18,	%i3
	andncc	%l0,	%i4,	%g2
loop_2602:
	tcc	%xcc,	0x0
	orncc	%o5,	0x19E6,	%o7
	membar	0x7F
	addcc	%g3,	0x0134,	%o3
	taddcctv	%i7,	0x0235,	%o4
	fbule,a	%fcc1,	loop_2603
	brgz	%g6,	loop_2604
	fbne,a	%fcc2,	loop_2605
	movl	%xcc,	%g1,	%i2
loop_2603:
	brlz,a	%g5,	loop_2606
loop_2604:
	alignaddrl	%l4,	%i0,	%o0
loop_2605:
	sllx	%l6,	%l2,	%i5
	taddcc	%o1,	0x128B,	%i6
loop_2606:
	alignaddr	%l3,	%o2,	%l5
	tl	%icc,	0x7
	fpackfix	%f4,	%f13
	movl	%xcc,	%g4,	%i1
	tl	%icc,	0x5
	orncc	%g7,	0x1014,	%l1
	bcc	loop_2607
	tleu	%icc,	0x4
	lduw	[%l7 + 0x14],	%i3
	ba	loop_2608
loop_2607:
	movn	%xcc,	%l0,	%i4
	edge32	%o6,	%g2,	%o7
	umul	%o5,	0x026C,	%g3
loop_2608:
	fmuld8ulx16	%f19,	%f11,	%f16
	ld	[%l7 + 0x38],	%f19
	edge16ln	%o3,	%o4,	%i7
	edge8n	%g6,	%g1,	%i2
	sir	0x043F
	movneg	%xcc,	%l4,	%i0
	fzero	%f20
	umulcc	%o0,	0x03BE,	%l6
	fzero	%f0
	edge16	%g5,	%i5,	%l2
	movleu	%icc,	%i6,	%o1
	bvs,a	%icc,	loop_2609
	movleu	%icc,	%l3,	%o2
	membar	#Sync
	wr	%g0,	0xf8,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
loop_2609:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	taddcctv	%l5,	%i1,	%g4
	movleu	%icc,	%g7,	%l1
	pdist	%f8,	%f20,	%f28
	nop
	set	0x7C, %o5
	lduw	[%l7 + %o5],	%i3
	xorcc	%l0,	%o6,	%i4
	movneg	%xcc,	%g2,	%o5
	edge8l	%g3,	%o3,	%o7
	popc	%i7,	%o4
	bcs	%icc,	loop_2610
	sir	0x007D
	fones	%f0
	fmovdcs	%icc,	%f27,	%f2
loop_2610:
	sll	%g1,	%i2,	%g6
	stbar
	fbo	%fcc1,	loop_2611
	bg,a,pn	%icc,	loop_2612
	or	%i0,	%l4,	%l6
	taddcctv	%g5,	%o0,	%l2
loop_2611:
	andncc	%i5,	%o1,	%l3
loop_2612:
	addccc	%i6,	0x1897,	%l5
	std	%o2,	[%l7 + 0x10]
	stb	%i1,	[%l7 + 0x53]
	fand	%f4,	%f2,	%f20
	xor	%g4,	0x1257,	%g7
	fmovscs	%icc,	%f24,	%f0
	mova	%xcc,	%l1,	%i3
	fpsub32	%f0,	%f4,	%f16
	edge16n	%l0,	%o6,	%g2
	array8	%o5,	%g3,	%i4
	set	0x54, %g2
	sta	%f19,	[%l7 + %g2] 0x14
	fones	%f31
	fnor	%f12,	%f0,	%f20
	movne	%icc,	%o3,	%o7
	smulcc	%i7,	%o4,	%i2
	edge8n	%g1,	%g6,	%i0
	movrlez	%l4,	0x1FB,	%g5
	fmovdle	%xcc,	%f20,	%f28
	tle	%icc,	0x5
	or	%o0,	0x1F34,	%l2
	mova	%icc,	%l6,	%o1
	sll	%l3,	0x04,	%i5
	tleu	%xcc,	0x4
	brz,a	%l5,	loop_2613
	fmovdn	%icc,	%f2,	%f13
	fmovdvc	%icc,	%f21,	%f15
	fbuge	%fcc3,	loop_2614
loop_2613:
	stbar
	set	0x18, %l0
	ldswa	[%l7 + %l0] 0x0c,	%i6
loop_2614:
	addc	%i1,	%o2,	%g4
	ldsb	[%l7 + 0x50],	%l1
	smulcc	%g7,	0x00E9,	%l0
	xorcc	%i3,	0x0DF7,	%o6
	orcc	%o5,	0x1C66,	%g2
	sllx	%g3,	%i4,	%o7
	tn	%icc,	0x2
	srl	%o3,	0x0C,	%i7
	movvc	%icc,	%o4,	%g1
	fmovs	%f27,	%f12
	subccc	%g6,	%i2,	%i0
	add	%l7,	0x08,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%g5
	casa	[%l6] 0x88,	%g5,	%o0
	sllx	%l2,	0x17,	%l4
	edge8ln	%l6,	%o1,	%i5
	taddcctv	%l5,	0x10FD,	%l3
	fmovsleu	%icc,	%f2,	%f23
	fmul8x16	%f30,	%f30,	%f10
	fmovsa	%xcc,	%f1,	%f20
	brz,a	%i6,	loop_2615
	sll	%i1,	%o2,	%l1
	fzeros	%f6
	wr	%g0,	0x19,	%asi
	ldxa	[%l7 + 0x08] %asi,	%g7
loop_2615:
	fmuld8ulx16	%f3,	%f18,	%f14
	fornot1s	%f27,	%f15,	%f25
	bge,a,pt	%icc,	loop_2616
	fmovrse	%l0,	%f4,	%f10
	subc	%i3,	%o6,	%o5
	movn	%xcc,	%g4,	%g3
loop_2616:
	popc	%i4,	%o7
	bvs,a	loop_2617
	fmovdgu	%xcc,	%f4,	%f16
	bleu,a	%xcc,	loop_2618
	movrgz	%g2,	0x37B,	%o3
loop_2617:
	movle	%xcc,	%i7,	%g1
	fandnot1s	%f23,	%f6,	%f31
loop_2618:
	fmovdle	%xcc,	%f29,	%f18
	tcs	%xcc,	0x2
	fpadd32s	%f23,	%f4,	%f4
	tle	%icc,	0x7
	edge16l	%o4,	%g6,	%i0
	srax	%i2,	0x11,	%o0
	tneg	%icc,	0x3
	lduh	[%l7 + 0x3A],	%l2
	brlez	%g5,	loop_2619
	ldd	[%l7 + 0x78],	%l4
	orcc	%l6,	0x061D,	%i5
	movrgz	%o1,	0x2DC,	%l5
loop_2619:
	tn	%icc,	0x6
	sdivcc	%i6,	0x1A58,	%l3
	popc	%o2,	%l1
	fmovsg	%icc,	%f13,	%f24
	tvs	%xcc,	0x6
	lduh	[%l7 + 0x1E],	%g7
	taddcc	%l0,	0x0454,	%i1
	bg,pn	%xcc,	loop_2620
	tge	%icc,	0x2
	brgz	%o6,	loop_2621
	edge32l	%i3,	%o5,	%g3
loop_2620:
	popc	0x1D87,	%g4
	bne	%icc,	loop_2622
loop_2621:
	umul	%o7,	0x1929,	%g2
	fcmple16	%f18,	%f2,	%o3
	tsubcctv	%i7,	0x0515,	%g1
loop_2622:
	edge8	%o4,	%g6,	%i4
	fmovsne	%xcc,	%f5,	%f31
	fands	%f29,	%f30,	%f1
	tl	%icc,	0x2
	tn	%icc,	0x4
	addcc	%i0,	0x038B,	%i2
	movcs	%icc,	%l2,	%g5
	or	%l4,	0x1D24,	%o0
	addcc	%l6,	%o1,	%i5
	movgu	%xcc,	%i6,	%l5
	subcc	%o2,	0x0C98,	%l1
	sll	%g7,	%l3,	%l0
	andncc	%i1,	%o6,	%i3
	fmovdleu	%xcc,	%f1,	%f27
	addccc	%g3,	0x05DA,	%o5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbul	%fcc3,	loop_2623
	fcmpne16	%f10,	%f12,	%o7
	wr	%g0,	0x80,	%asi
	ldswa	[%l7 + 0x44] %asi,	%g4
loop_2623:
	nop
	wr	%g0,	0x19,	%asi
	stxa	%g2,	[%l7 + 0x48] %asi
	tsubcc	%i7,	%g1,	%o4
	movrlz	%g6,	%o3,	%i4
	fmovsgu	%xcc,	%f24,	%f31
	set	0x50, %i4
	swapa	[%l7 + %i4] 0x19,	%i0
	fands	%f19,	%f30,	%f11
	fmovdvs	%xcc,	%f17,	%f11
	edge8ln	%i2,	%g5,	%l4
	fmovsge	%icc,	%f26,	%f5
	fmovsvs	%xcc,	%f10,	%f12
	orncc	%l2,	0x1F52,	%l6
	ldstub	[%l7 + 0x61],	%o0
	orncc	%i5,	%o1,	%l5
	fnors	%f18,	%f9,	%f27
	tleu	%xcc,	0x7
	subccc	%i6,	0x1CE0,	%l1
	sdivcc	%g7,	0x1F45,	%o2
	tcs	%icc,	0x2
	srlx	%l3,	0x15,	%i1
	taddcc	%l0,	%o6,	%i3
	mulscc	%o5,	0x0751,	%g3
	fmovsn	%icc,	%f3,	%f21
	edge16l	%g4,	%g2,	%o7
	fmovsvc	%icc,	%f5,	%f11
	udivcc	%i7,	0x1970,	%o4
	sub	%g1,	0x1705,	%o3
	bneg,a,pt	%icc,	loop_2624
	fones	%f14
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	call	loop_2625
loop_2624:
	movrlz	%i4,	%i0,	%g6
	fbug,a	%fcc0,	loop_2626
	tl	%xcc,	0x4
loop_2625:
	tl	%xcc,	0x0
	movrne	%g5,	0x3B3,	%l4
loop_2626:
	movrlz	%i2,	0x189,	%l6
	sub	%o0,	%l2,	%o1
	tl	%xcc,	0x6
	add	%l7,	0x40,	%l6
	wr	%g0,	0x10,	%asi
	casxa	[%l6] 0x10,	%l5,	%i5
	fabsd	%f16,	%f16
	orn	%i6,	%g7,	%o2
	tsubcc	%l3,	%l1,	%l0
	fmovrdgz	%i1,	%f4,	%f4
	fcmpd	%fcc0,	%f22,	%f8
	tle	%icc,	0x4
	andncc	%i3,	%o6,	%o5
	set	0x43, %o4
	ldsba	[%l7 + %o4] 0x18,	%g4
	tpos	%icc,	0x4
	add	%g3,	0x1972,	%o7
	fmovd	%f16,	%f6
	movrlz	%i7,	0x0DD,	%g2
	movleu	%icc,	%o4,	%o3
	fba,a	%fcc0,	loop_2627
	tgu	%xcc,	0x4
	nop
	set	0x78, %l4
	ldd	[%l7 + %l4],	%f18
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2627:
	tne	%xcc,	0x7
	edge8ln	%g1,	%i4,	%i0
	bl	%icc,	loop_2628
	movneg	%icc,	%g5,	%g6
	tsubcc	%l4,	%l6,	%i2
	fbue,a	%fcc1,	loop_2629
loop_2628:
	edge8n	%o0,	%l2,	%o1
	orncc	%i5,	0x1A13,	%i6
	fpackfix	%f0,	%f18
loop_2629:
	movle	%xcc,	%l5,	%g7
	smul	%l3,	%o2,	%l1
	fmovdleu	%xcc,	%f16,	%f8
	mulx	%i1,	0x0DB6,	%i3
	fmuld8ulx16	%f22,	%f23,	%f2
	fbg,a	%fcc3,	loop_2630
	movrne	%l0,	%o5,	%o6
	ldd	[%l7 + 0x58],	%g4
	set	0x40, %g3
	ldda	[%l7 + %g3] 0x22,	%g2
loop_2630:
	fnot2s	%f31,	%f5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmpeq32	%f8,	%f28,	%o7
	edge8	%g2,	%o4,	%o3
	tge	%xcc,	0x3
	tg	%xcc,	0x6
	taddcctv	%i7,	%g1,	%i4
	tn	%icc,	0x3
	array16	%g5,	%g6,	%l4
	tcs	%xcc,	0x2
	fpadd16s	%f12,	%f16,	%f16
	edge32n	%i0,	%l6,	%o0
	movrlez	%l2,	0x32C,	%i2
	smulcc	%i5,	%i6,	%l5
	fnot1s	%f0,	%f3
	bgu,a,pt	%icc,	loop_2631
	tge	%xcc,	0x0
	orcc	%o1,	0x0476,	%l3
	fone	%f24
loop_2631:
	subc	%g7,	0x13AC,	%o2
	fornot2	%f26,	%f0,	%f10
	fmovdle	%xcc,	%f3,	%f7
	bne,pn	%icc,	loop_2632
	movg	%icc,	%l1,	%i1
	brnz,a	%l0,	loop_2633
	fbue	%fcc3,	loop_2634
loop_2632:
	addc	%o5,	0x1CCA,	%i3
	flush	%l7 + 0x64
loop_2633:
	nop
	set	0x28, %i0
	std	%o6,	[%l7 + %i0]
loop_2634:
	nop
	wr	%g0,	0x2b,	%asi
	stwa	%g3,	[%l7 + 0x40] %asi
	membar	#Sync
	movneg	%icc,	%o7,	%g4
	movge	%icc,	%o4,	%o3
	fmovdgu	%icc,	%f12,	%f19
	fxors	%f4,	%f10,	%f29
	bne	loop_2635
	sub	%g2,	%i7,	%g1
	bvs	%icc,	loop_2636
	fabss	%f4,	%f19
loop_2635:
	brz,a	%i4,	loop_2637
	addc	%g6,	%l4,	%i0
loop_2636:
	tvc	%icc,	0x1
	membar	0x7E
loop_2637:
	sllx	%l6,	%g5,	%o0
	fcmpd	%fcc2,	%f12,	%f28
	pdist	%f20,	%f18,	%f4
	subc	%l2,	%i2,	%i5
	brgez,a	%i6,	loop_2638
	array32	%l5,	%l3,	%o1
	brgz	%o2,	loop_2639
	tsubcctv	%g7,	%l1,	%i1
loop_2638:
	sra	%l0,	%i3,	%o6
	brlz	%o5,	loop_2640
loop_2639:
	fbue	%fcc2,	loop_2641
	fmovsvc	%icc,	%f13,	%f17
	fnands	%f12,	%f3,	%f9
loop_2640:
	sdivx	%o7,	0x0F3C,	%g3
loop_2641:
	fornot1s	%f18,	%f0,	%f26
	array16	%o4,	%g4,	%o3
	movg	%xcc,	%i7,	%g1
	orn	%i4,	0x07B6,	%g6
	te	%icc,	0x2
	edge32	%g2,	%i0,	%l4
	umul	%l6,	0x0D33,	%o0
	orcc	%g5,	0x028C,	%i2
	fcmps	%fcc2,	%f24,	%f30
	edge16l	%l2,	%i6,	%i5
	tge	%icc,	0x7
	wr	%g0,	0x2a,	%asi
	ldda	[%l7 + 0x70] %asi,	%l4
	xor	%o1,	0x020A,	%o2
	tpos	%xcc,	0x5
	set	0x60, %g5
	stda	%g6,	[%l7 + %g5] 0x18
	set	0x4E, %o3
	ldsha	[%l7 + %o3] 0x88,	%l1
	and	%l3,	%i1,	%i3
	edge16n	%o6,	%o5,	%o7
	edge8n	%g3,	%l0,	%o4
	fmul8x16al	%f12,	%f2,	%f6
	fmovrdgz	%g4,	%f14,	%f30
	fmovrsne	%i7,	%f2,	%f6
	fcmpeq32	%f4,	%f22,	%o3
	xnorcc	%g1,	0x178A,	%i4
	edge16ln	%g6,	%i0,	%l4
	sllx	%g2,	%l6,	%o0
	fbge	%fcc2,	loop_2642
	fandnot1s	%f21,	%f13,	%f12
	movvc	%icc,	%i2,	%g5
	std	%i6,	[%l7 + 0x10]
loop_2642:
	flush	%l7 + 0x5C
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tcs	%icc,	0x4
	fmul8x16	%f16,	%f24,	%f24
	and	%l2,	0x0DDB,	%i5
	mulx	%l5,	0x11B6,	%o2
	fmovrse	%o1,	%f18,	%f31
	fmovda	%xcc,	%f12,	%f11
	andncc	%l1,	%g7,	%l3
	tcs	%icc,	0x4
	sub	%i3,	0x17AB,	%o6
	movrlez	%o5,	0x39F,	%o7
	edge32l	%g3,	%l0,	%i1
	ta	%icc,	0x3
	fcmple16	%f6,	%f24,	%o4
	fmovda	%xcc,	%f26,	%f20
	fsrc1	%f16,	%f0
	for	%f2,	%f18,	%f28
	fmovdn	%icc,	%f16,	%f1
	fmovdcc	%icc,	%f18,	%f24
	udivcc	%g4,	0x10D2,	%o3
	ldx	[%l7 + 0x78],	%i7
	bg,a	loop_2643
	movl	%icc,	%i4,	%g1
	move	%icc,	%g6,	%i0
	fabsd	%f2,	%f4
loop_2643:
	membar	0x66
	fblg	%fcc2,	loop_2644
	edge8	%g2,	%l4,	%l6
	edge32l	%o0,	%i2,	%i6
	swap	[%l7 + 0x44],	%l2
loop_2644:
	array32	%i5,	%l5,	%g5
	edge32l	%o1,	%o2,	%g7
	prefetch	[%l7 + 0x18],	 0x3
	edge8l	%l3,	%l1,	%o6
	movrgez	%o5,	0x0D8,	%i3
	tne	%xcc,	0x4
	lduw	[%l7 + 0x68],	%o7
	sll	%g3,	0x17,	%l0
	bneg	loop_2645
	add	%o4,	0x0421,	%i1
	movle	%icc,	%o3,	%g4
	brgez,a	%i4,	loop_2646
loop_2645:
	tpos	%icc,	0x4
	smul	%g1,	0x0436,	%i7
	taddcc	%i0,	%g2,	%g6
loop_2646:
	brlz,a	%l6,	loop_2647
	be	loop_2648
	tn	%xcc,	0x2
	std	%f26,	[%l7 + 0x20]
loop_2647:
	fnegs	%f19,	%f12
loop_2648:
	edge32n	%l4,	%i2,	%i6
	sdiv	%l2,	0x1090,	%i5
	fornot1s	%f15,	%f20,	%f17
	bshuffle	%f16,	%f16,	%f20
	tvc	%icc,	0x7
	umul	%l5,	0x1F94,	%g5
	fbu,a	%fcc1,	loop_2649
	or	%o0,	0x1579,	%o1
	bvc,a	%xcc,	loop_2650
	fcmpgt16	%f28,	%f6,	%g7
loop_2649:
	tle	%icc,	0x2
	array32	%o2,	%l3,	%l1
loop_2650:
	nop
	set	0x1C, %o7
	stwa	%o6,	[%l7 + %o7] 0x81
	alignaddrl	%o5,	%i3,	%g3
	movcs	%xcc,	%o7,	%o4
	edge16ln	%l0,	%o3,	%i1
	andn	%i4,	0x1878,	%g1
	bn,a	loop_2651
	movcc	%icc,	%i7,	%g4
	orncc	%g2,	0x121B,	%g6
	subc	%i0,	%l4,	%l6
loop_2651:
	prefetch	[%l7 + 0x58],	 0x3
	fcmpes	%fcc3,	%f2,	%f31
	fmovdgu	%icc,	%f9,	%f26
	alignaddrl	%i6,	%l2,	%i2
	udivcc	%l5,	0x1AA7,	%g5
	addcc	%o0,	0x0D5D,	%o1
	movre	%i5,	0x346,	%g7
	fbne,a	%fcc2,	loop_2652
	brz	%o2,	loop_2653
	and	%l3,	0x1919,	%l1
	fpsub32	%f18,	%f28,	%f30
loop_2652:
	fpackfix	%f24,	%f26
loop_2653:
	sll	%o5,	0x0B,	%o6
	alignaddr	%i3,	%g3,	%o7
	array8	%o4,	%o3,	%i1
	fmovdcs	%xcc,	%f31,	%f31
	fmovscs	%icc,	%f2,	%f6
	nop
	setx	loop_2654,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	bcc,pt	%icc,	loop_2655
	movne	%icc,	%i4,	%l0
	fsrc2	%f10,	%f22
loop_2654:
	movgu	%icc,	%i7,	%g1
loop_2655:
	edge32	%g2,	%g6,	%i0
	add	%l7,	0x50,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%g4
	casa	[%l6] 0x89,	%g4,	%l6
	fpack32	%f4,	%f10,	%f26
	srl	%l4,	%l2,	%i6
	and	%i2,	%l5,	%o0
	bpos,a,pn	%icc,	loop_2656
	sub	%g5,	%o1,	%g7
	array32	%o2,	%l3,	%l1
	udivx	%o5,	0x0E13,	%o6
loop_2656:
	fmovrslez	%i3,	%f21,	%f2
	fcmpgt32	%f18,	%f26,	%i5
	movn	%icc,	%g3,	%o4
	fmul8ulx16	%f10,	%f6,	%f28
	edge16	%o7,	%i1,	%o3
	bge,a,pn	%icc,	loop_2657
	fmovdcs	%xcc,	%f5,	%f31
	fpsub32	%f30,	%f12,	%f18
	fsrc1	%f22,	%f22
loop_2657:
	tle	%icc,	0x5
	wr	%g0,	0xe2,	%asi
	stda	%i4,	[%l7 + 0x50] %asi
	membar	#Sync
	pdist	%f22,	%f10,	%f30
	edge32n	%i7,	%l0,	%g2
	bgu,pt	%xcc,	loop_2658
	tne	%xcc,	0x0
	fmovscc	%xcc,	%f11,	%f18
	fbge	%fcc3,	loop_2659
loop_2658:
	flush	%l7 + 0x0C
	fnot2s	%f1,	%f29
	alignaddr	%g1,	%i0,	%g4
loop_2659:
	nop
	set	0x20, %g4
	stxa	%g6,	[%l7 + %g4] 0xea
	membar	#Sync
	array32	%l4,	%l6,	%i6
	fmovdle	%xcc,	%f25,	%f25
	bcc,pt	%xcc,	loop_2660
	fba,a	%fcc3,	loop_2661
	fmovdg	%xcc,	%f20,	%f26
	fmovsne	%icc,	%f25,	%f15
loop_2660:
	edge16l	%i2,	%l2,	%l5
loop_2661:
	orcc	%g5,	0x1D37,	%o1
	movg	%xcc,	%g7,	%o2
	fpsub16	%f2,	%f4,	%f22
	fsrc2s	%f23,	%f20
	srax	%o0,	0x02,	%l1
	movleu	%icc,	%l3,	%o6
	addccc	%o5,	0x1E0E,	%i3
	nop
	setx	loop_2662,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	lduw	[%l7 + 0x0C],	%i5
	fcmps	%fcc2,	%f28,	%f29
	ldsb	[%l7 + 0x68],	%g3
loop_2662:
	alignaddrl	%o7,	%i1,	%o3
	move	%icc,	%o4,	%i4
	tcs	%xcc,	0x2
	fmovrse	%i7,	%f10,	%f5
	set	0x40, %i3
	stda	%f16,	[%l7 + %i3] 0xf0
	membar	#Sync
	movvs	%xcc,	%g2,	%g1
	sth	%i0,	[%l7 + 0x6A]
	te	%xcc,	0x1
	andncc	%l0,	%g4,	%l4
	fbne,a	%fcc3,	loop_2663
	movrlez	%g6,	%i6,	%i2
	movcs	%xcc,	%l2,	%l5
	tvs	%xcc,	0x5
loop_2663:
	fmovrsne	%l6,	%f2,	%f13
	mova	%xcc,	%g5,	%o1
	andn	%g7,	0x1088,	%o0
	bne,pt	%xcc,	loop_2664
	fzeros	%f4
	alignaddr	%l1,	%l3,	%o6
	andncc	%o5,	%o2,	%i5
loop_2664:
	srax	%g3,	0x12,	%i3
	sdivx	%i1,	0x1246,	%o3
	movge	%xcc,	%o4,	%i4
	fmovsl	%xcc,	%f17,	%f28
	tn	%icc,	0x5
	xnorcc	%o7,	0x027D,	%g2
	move	%icc,	%i7,	%i0
	addc	%l0,	%g4,	%l4
	fmovde	%icc,	%f24,	%f26
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ta	%xcc,	0x6
	fnand	%f26,	%f10,	%f0
	array16	%g1,	%i6,	%i2
	and	%g6,	%l2,	%l6
	stb	%l5,	[%l7 + 0x19]
	fnors	%f17,	%f11,	%f31
	xnor	%o1,	0x1712,	%g5
	edge8n	%o0,	%l1,	%g7
	bl,pn	%xcc,	loop_2665
	edge16l	%o6,	%o5,	%o2
	ldd	[%l7 + 0x20],	%i4
	fbne	%fcc1,	loop_2666
loop_2665:
	smulcc	%l3,	%i3,	%i1
	orcc	%g3,	%o4,	%o3
	sllx	%o7,	%g2,	%i4
loop_2666:
	fandnot1s	%f25,	%f11,	%f9
	move	%xcc,	%i0,	%i7
	tge	%icc,	0x7
	set	0x40, %g6
	stda	%f16,	[%l7 + %g6] 0x89
	srl	%g4,	%l0,	%g1
	lduh	[%l7 + 0x3C],	%i6
	tl	%icc,	0x5
	wr	%g0,	0x2a,	%asi
	stda	%i2,	[%l7 + 0x30] %asi
	membar	#Sync
	tpos	%icc,	0x4
	bl,a,pt	%xcc,	loop_2667
	fandnot1	%f20,	%f4,	%f6
	taddcctv	%g6,	%l2,	%l6
	sra	%l5,	0x0B,	%o1
loop_2667:
	edge32l	%g5,	%l4,	%o0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	add	%g7,	%l1,	%o6
	xor	%o2,	0x1492,	%i5
	andn	%o5,	0x0C17,	%i3
	edge32ln	%i1,	%g3,	%o4
	membar	0x19
	srax	%o3,	0x1D,	%l3
	andncc	%o7,	%i4,	%g2
	fmovsneg	%xcc,	%f13,	%f31
	set	0x5C, %o1
	stwa	%i0,	[%l7 + %o1] 0x14
	umulcc	%i7,	%g4,	%g1
	smul	%l0,	%i6,	%g6
	fmovsneg	%icc,	%f24,	%f6
	fmovscs	%xcc,	%f9,	%f4
	edge32ln	%l2,	%i2,	%l5
	brlz	%l6,	loop_2668
	movvc	%xcc,	%g5,	%l4
	fba	%fcc3,	loop_2669
	tcs	%icc,	0x1
loop_2668:
	movvc	%icc,	%o1,	%o0
	fmovsne	%xcc,	%f18,	%f25
loop_2669:
	tneg	%icc,	0x3
	stb	%g7,	[%l7 + 0x76]
	fmovscs	%icc,	%f29,	%f0
	st	%f13,	[%l7 + 0x54]
	wr	%g0,	0x11,	%asi
	ldsha	[%l7 + 0x18] %asi,	%o6
	array32	%o2,	%l1,	%i5
	fmovrdne	%i3,	%f8,	%f24
	udivcc	%o5,	0x0771,	%i1
	subc	%g3,	%o3,	%o4
	movrlez	%o7,	%i4,	%g2
	tgu	%icc,	0x7
	orcc	%l3,	%i0,	%g4
	addc	%i7,	0x19DB,	%l0
	te	%icc,	0x7
	st	%f13,	[%l7 + 0x28]
	fmovrsgz	%i6,	%f30,	%f18
	fbue,a	%fcc2,	loop_2670
	movl	%icc,	%g1,	%g6
	fbg,a	%fcc1,	loop_2671
	movle	%xcc,	%l2,	%i2
loop_2670:
	alignaddrl	%l5,	%g5,	%l6
	bcc,a	loop_2672
loop_2671:
	tcc	%icc,	0x1
	addc	%l4,	%o0,	%o1
	edge16ln	%g7,	%o2,	%o6
loop_2672:
	sdivx	%i5,	0x1849,	%l1
	edge8ln	%i3,	%i1,	%o5
	wr	%g0,	0x19,	%asi
	lduba	[%l7 + 0x40] %asi,	%g3
	edge32n	%o4,	%o3,	%i4
	addcc	%g2,	0x0A1B,	%l3
	movre	%o7,	0x065,	%i0
	tvs	%xcc,	0x3
	fmuld8sux16	%f31,	%f26,	%f4
	edge8	%i7,	%g4,	%i6
	or	%l0,	0x16AC,	%g6
	sll	%l2,	0x1C,	%g1
	fpack16	%f20,	%f7
	movneg	%icc,	%i2,	%g5
	movneg	%xcc,	%l5,	%l4
	fmovrdlz	%o0,	%f4,	%f12
	fble	%fcc2,	loop_2673
	tle	%icc,	0x6
	fands	%f18,	%f16,	%f24
	wr	%g0,	0x20,	%asi
	ldxa	[%g0 + 0x38] %asi,	%l6
loop_2673:
	orcc	%g7,	0x10E5,	%o2
	array8	%o1,	%i5,	%l1
	sir	0x022F
	udivx	%o6,	0x02F7,	%i1
	bl	%xcc,	loop_2674
	tleu	%xcc,	0x5
	fpackfix	%f14,	%f31
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2674:
	std	%o4,	[%l7 + 0x60]
	subccc	%i3,	0x04D8,	%g3
	add	%l7,	0x08,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%o3
	casxa	[%l6] %asi,	%o3,	%o4
	or	%g2,	0x1A17,	%i4
	ldsh	[%l7 + 0x60],	%l3
	srlx	%o7,	0x00,	%i0
	xor	%g4,	0x06FB,	%i6
	nop
	set	0x34, %i7
	ldsw	[%l7 + %i7],	%i7
	fcmps	%fcc3,	%f19,	%f22
	fble,a	%fcc1,	loop_2675
	movgu	%icc,	%l0,	%l2
	ldx	[%l7 + 0x08],	%g1
	tge	%xcc,	0x6
loop_2675:
	sdivx	%g6,	0x0B94,	%i2
	addccc	%g5,	%l4,	%o0
	tvc	%icc,	0x0
	or	%l5,	%l6,	%o2
	fpsub32	%f2,	%f28,	%f16
	fornot2	%f18,	%f2,	%f22
	edge8l	%o1,	%i5,	%g7
	array32	%o6,	%l1,	%o5
	movleu	%xcc,	%i1,	%i3
	edge8n	%o3,	%o4,	%g2
	popc	%i4,	%l3
	add	%g3,	%i0,	%o7
	fmovdne	%xcc,	%f20,	%f5
	tsubcc	%g4,	%i6,	%l0
	movneg	%xcc,	%i7,	%l2
	movvc	%xcc,	%g1,	%g6
	fmovdl	%icc,	%f2,	%f11
	and	%g5,	%l4,	%i2
	fcmple32	%f2,	%f28,	%l5
	fmovdvc	%xcc,	%f2,	%f0
	movgu	%icc,	%o0,	%o2
	brnz,a	%o1,	loop_2676
	andn	%l6,	%g7,	%o6
	edge8ln	%i5,	%o5,	%i1
	array8	%l1,	%i3,	%o3
loop_2676:
	fcmped	%fcc2,	%f6,	%f20
	fbue	%fcc1,	loop_2677
	sub	%o4,	0x102D,	%g2
	edge16	%i4,	%l3,	%i0
	movneg	%xcc,	%o7,	%g3
loop_2677:
	fmovdgu	%icc,	%f14,	%f29
	tneg	%icc,	0x2
	mova	%icc,	%g4,	%i6
	fba,a	%fcc2,	loop_2678
	movrgz	%i7,	0x046,	%l2
	set	0x7A, %o2
	stha	%g1,	[%l7 + %o2] 0xe2
	membar	#Sync
loop_2678:
	nop
	set	0x4B, %l6
	stba	%g6,	[%l7 + %l6] 0x10
	bg,pn	%icc,	loop_2679
	bcc	loop_2680
	sethi	0x1E9A,	%l0
	movg	%xcc,	%g5,	%i2
loop_2679:
	udiv	%l4,	0x0FB0,	%l5
loop_2680:
	movleu	%xcc,	%o0,	%o1
	fbo	%fcc2,	loop_2681
	tsubcc	%l6,	%o2,	%o6
	set	0x78, %i1
	stda	%g6,	[%l7 + %i1] 0x2f
	membar	#Sync
loop_2681:
	subc	%o5,	%i5,	%i1
	pdist	%f2,	%f8,	%f8
	sdiv	%i3,	0x1E8C,	%l1
	alignaddrl	%o3,	%o4,	%i4
	movrgz	%g2,	%l3,	%i0
	prefetch	[%l7 + 0x5C],	 0x0
	taddcctv	%g3,	%g4,	%i6
	call	loop_2682
	and	%o7,	%l2,	%g1
	edge16n	%i7,	%g6,	%l0
	addcc	%g5,	0x087A,	%l4
loop_2682:
	sub	%l5,	0x1074,	%o0
	tcs	%icc,	0x2
	tge	%xcc,	0x4
	tvc	%xcc,	0x1
	sth	%i2,	[%l7 + 0x1A]
	edge16n	%l6,	%o1,	%o2
	tcc	%xcc,	0x0
	fnot2s	%f31,	%f23
	edge16ln	%o6,	%o5,	%i5
	set	0x41, %g7
	lduba	[%l7 + %g7] 0x14,	%g7
	mova	%xcc,	%i3,	%i1
	xnorcc	%o3,	%o4,	%i4
	bcc,a,pn	%icc,	loop_2683
	siam	0x6
	srax	%l1,	%g2,	%i0
	fzero	%f22
loop_2683:
	umulcc	%g3,	%g4,	%i6
	tne	%icc,	0x2
	sdivx	%o7,	0x017D,	%l2
	brgez,a	%g1,	loop_2684
	edge16n	%i7,	%l3,	%g6
	movrlz	%g5,	%l4,	%l5
	sir	0x047C
loop_2684:
	edge8l	%o0,	%l0,	%i2
	bpos,a,pn	%icc,	loop_2685
	array8	%o1,	%o2,	%l6
	tge	%icc,	0x3
	ta	%icc,	0x2
loop_2685:
	and	%o6,	%o5,	%i5
	movvc	%icc,	%g7,	%i1
	orn	%o3,	0x1B7E,	%i3
	stx	%o4,	[%l7 + 0x30]
	set	0x6B, %l2
	ldstuba	[%l7 + %l2] 0x11,	%i4
	set	0x50, %o6
	ldxa	[%l7 + %o6] 0x19,	%l1
	srl	%g2,	%g3,	%g4
	fbne,a	%fcc3,	loop_2686
	movne	%xcc,	%i6,	%o7
	udiv	%l2,	0x066E,	%g1
	fmovdvc	%icc,	%f22,	%f12
loop_2686:
	ldub	[%l7 + 0x4C],	%i0
	set	0x0C, %i2
	stha	%l3,	[%l7 + %i2] 0x89
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsb	[%l7 + 0x36],	%g6
	flush	%l7 + 0x44
	bleu,a	loop_2687
	bvs,a,pt	%icc,	loop_2688
	pdist	%f0,	%f4,	%f24
	smul	%g5,	%l4,	%i7
loop_2687:
	fmovrse	%o0,	%f7,	%f21
loop_2688:
	movre	%l5,	%l0,	%o1
	sethi	0x0126,	%o2
	fbe,a	%fcc2,	loop_2689
	brnz	%i2,	loop_2690
	udivx	%l6,	0x05D4,	%o6
	movrne	%o5,	%i5,	%g7
loop_2689:
	bcs	loop_2691
loop_2690:
	movneg	%icc,	%i1,	%o3
	tvs	%icc,	0x0
	mulscc	%o4,	%i4,	%l1
loop_2691:
	fpsub32s	%f11,	%f21,	%f14
	sdivx	%i3,	0x0709,	%g3
	movl	%xcc,	%g4,	%g2
	sub	%o7,	%l2,	%i6
	set	0x30, %i6
	ldsha	[%l7 + %i6] 0x11,	%i0
	umulcc	%g1,	0x02A2,	%g6
	edge32l	%g5,	%l3,	%l4
	set	0x78, %l3
	stwa	%o0,	[%l7 + %l3] 0x27
	membar	#Sync
	subccc	%l5,	%i7,	%l0
	set	0x60, %l5
	ldda	[%l7 + %l5] 0xea,	%o2
	brgez	%i2,	loop_2692
	movl	%icc,	%o1,	%o6
	ldd	[%l7 + 0x50],	%o4
	xorcc	%l6,	%i5,	%g7
loop_2692:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tvs	%icc,	0x2
	subcc	%o3,	%i1,	%o4
	fblg	%fcc0,	loop_2693
	tleu	%icc,	0x5
	set	0x40, %i5
	stda	%f16,	[%l7 + %i5] 0x17
	membar	#Sync
loop_2693:
	srax	%i4,	%i3,	%g3
	edge32n	%l1,	%g4,	%o7
	orn	%l2,	%i6,	%g2
	bgu,a	%icc,	loop_2694
	alignaddr	%g1,	%i0,	%g5
	movrgez	%l3,	0x01F,	%g6
	movl	%icc,	%o0,	%l5
loop_2694:
	faligndata	%f4,	%f0,	%f2
	add	%l7,	0x28,	%l6
	wr	%g0,	0x04,	%asi
	ldxa	[%l6] %asi,	%i7
	casxa	[%l6] %asi,	%i7,	%l0
	ldsw	[%l7 + 0x7C],	%l4
	fcmpd	%fcc2,	%f24,	%f18
	fbul	%fcc1,	loop_2695
	edge8n	%i2,	%o1,	%o6
	tge	%xcc,	0x0
	fpadd16	%f24,	%f2,	%f18
loop_2695:
	lduh	[%l7 + 0x0E],	%o2
	umul	%o5,	0x1B67,	%i5
	edge8ln	%g7,	%o3,	%i1
	fmovsvs	%xcc,	%f29,	%f9
	tcs	%xcc,	0x3
	stw	%o4,	[%l7 + 0x28]
	sdiv	%i4,	0x1AD4,	%l6
	fbge,a	%fcc0,	loop_2696
	smulcc	%i3,	0x1C20,	%l1
	umulcc	%g3,	%g4,	%o7
	wr	%g0,	0x10,	%asi
	stda	%i6,	[%l7 + 0x48] %asi
loop_2696:
	tvs	%xcc,	0x3
	xnor	%l2,	0x09C5,	%g1
	fmovsle	%icc,	%f7,	%f23
	addcc	%i0,	%g5,	%g2
	fexpand	%f29,	%f18
	fmovsne	%xcc,	%f9,	%f18
	fzero	%f14
	wr	%g0,	0x89,	%asi
	stha	%l3,	[%l7 + 0x6C] %asi
	umul	%g6,	0x0286,	%l5
	nop
	setx	loop_2697,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	brgez	%i7,	loop_2698
	fnegd	%f8,	%f6
	fba,a	%fcc1,	loop_2699
loop_2697:
	udiv	%l0,	0x0F2F,	%l4
loop_2698:
	tle	%xcc,	0x6
	ldd	[%l7 + 0x18],	%o0
loop_2699:
	orncc	%o1,	%i2,	%o2
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
	movvs	%icc,	%o5,	%o6
	brz	%g7,	loop_2701
	xor	%i5,	%i1,	%o3
loop_2700:
	fmuld8ulx16	%f22,	%f27,	%f12
	fmovdcc	%icc,	%f12,	%f5
loop_2701:
	fmovdneg	%xcc,	%f19,	%f9
	tge	%icc,	0x3
	fnands	%f1,	%f12,	%f13
	fbue	%fcc0,	loop_2702
	edge8ln	%i4,	%l6,	%o4
	set	0x40, %l1
	stda	%f16,	[%l7 + %l1] 0xf8
	membar	#Sync
loop_2702:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsvs	%icc,	%f9,	%f6
	fmovdvc	%xcc,	%f15,	%f29
	movrgez	%l1,	0x336,	%i3
	wr	%g0,	0x19,	%asi
	lduha	[%l7 + 0x7E] %asi,	%g3
	tvs	%xcc,	0x4
	membar	#Sync
	wr	%g0,	0x16,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	fnegd	%f22,	%f22
	stx	%o7,	[%l7 + 0x50]
	stx	%i6,	[%l7 + 0x40]
	edge16ln	%g4,	%l2,	%i0
	fcmped	%fcc1,	%f14,	%f0
	movne	%xcc,	%g1,	%g5
	ldd	[%l7 + 0x70],	%g2
	movcc	%xcc,	%g6,	%l3
	fand	%f30,	%f0,	%f14
	sdivx	%i7,	0x1E31,	%l0
	or	%l4,	0x16C3,	%o0
	fbule,a	%fcc1,	loop_2703
	srl	%l5,	0x09,	%i2
	nop
	set	0x08, %o0
	ldsh	[%l7 + %o0],	%o2
	tsubcc	%o5,	%o1,	%o6
loop_2703:
	tne	%icc,	0x2
	edge8n	%i5,	%i1,	%g7
	movne	%xcc,	%i4,	%o3
	wr	%g0,	0x18,	%asi
	ldsha	[%l7 + 0x46] %asi,	%l6
	addcc	%l1,	%i3,	%o4
	mulscc	%g3,	0x13CD,	%i6
	wr	%g0,	0x81,	%asi
	ldswa	[%l7 + 0x78] %asi,	%o7
	andcc	%l2,	%i0,	%g1
	srlx	%g4,	0x15,	%g2
	subcc	%g5,	%g6,	%i7
	nop
	setx loop_2704, %l0, %l1
	jmpl %l1, %l3
	taddcctv	%l4,	%o0,	%l5
	fmovrdgz	%i2,	%f0,	%f16
	edge32n	%l0,	%o2,	%o1
loop_2704:
	fbue,a	%fcc2,	loop_2705
	st	%f4,	[%l7 + 0x70]
	fbe	%fcc1,	loop_2706
	move	%xcc,	%o6,	%i5
loop_2705:
	fpsub32s	%f12,	%f5,	%f5
	fmovrslz	%o5,	%f0,	%f27
loop_2706:
	or	%g7,	0x122B,	%i1
	edge8	%o3,	%l6,	%l1
	fmovsvs	%icc,	%f8,	%f30
	fmovrslez	%i3,	%f2,	%f21
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	add	%l7,	0x20,	%l6
	wr	%g0,	0x0c,	%asi
	casxa	[%l6] 0x0c,	%o4,	%g3
	fbug,a	%fcc0,	loop_2707
	movcc	%xcc,	%i6,	%o7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andcc	%i4,	0x0CE8,	%i0
loop_2707:
	sra	%l2,	0x17,	%g1
	movvs	%xcc,	%g2,	%g5
	fcmpeq32	%f24,	%f0,	%g4
	add	%g6,	%i7,	%l3
	edge8l	%o0,	%l5,	%l4
	smulcc	%l0,	0x0B4D,	%o2
	tn	%xcc,	0x4
	array32	%o1,	%i2,	%i5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrse	%o5,	%f25,	%f19
	tge	%icc,	0x4
	edge16n	%o6,	%g7,	%o3
	fbug,a	%fcc1,	loop_2708
	fmovspos	%icc,	%f11,	%f13
	xorcc	%l6,	%i1,	%l1
	addc	%i3,	0x1132,	%o4
loop_2708:
	mova	%xcc,	%g3,	%o7
	bl,pt	%icc,	loop_2709
	sub	%i6,	0x0B91,	%i0
	edge32n	%l2,	%i4,	%g2
	fbn	%fcc1,	loop_2710
loop_2709:
	bl,a	loop_2711
	edge8	%g5,	%g1,	%g4
	fors	%f27,	%f2,	%f28
loop_2710:
	fmovsg	%icc,	%f24,	%f27
loop_2711:
	st	%f8,	[%l7 + 0x2C]
	edge16	%i7,	%l3,	%o0
	nop
	setx loop_2712, %l0, %l1
	jmpl %l1, %l5
	edge32ln	%l4,	%l0,	%g6
	brgz	%o1,	loop_2713
	edge16ln	%o2,	%i5,	%o5
loop_2712:
	xorcc	%i2,	0x0A57,	%o6
	sdivcc	%o3,	0x1853,	%g7
loop_2713:
	and	%l6,	0x11A4,	%i1
	sth	%l1,	[%l7 + 0x68]
	movrgz	%o4,	%i3,	%o7
	sllx	%i6,	0x11,	%i0
	tg	%xcc,	0x3
	fcmple32	%f0,	%f8,	%l2
	orcc	%i4,	0x1A1C,	%g2
	fxnors	%f13,	%f17,	%f24
	sra	%g3,	0x17,	%g5
	nop
	setx	loop_2714,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	udivcc	%g4,	0x14C5,	%i7
	tne	%xcc,	0x1
	popc	%g1,	%o0
loop_2714:
	tne	%xcc,	0x5
	fandnot1	%f28,	%f22,	%f28
	edge32ln	%l3,	%l5,	%l0
	fcmple32	%f26,	%f16,	%g6
	fnegs	%f1,	%f28
	bshuffle	%f4,	%f20,	%f12
	movrgz	%l4,	0x352,	%o1
	fmovdl	%xcc,	%f1,	%f21
	movleu	%icc,	%o2,	%i5
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x14] %asi,	%i2
	edge32l	%o5,	%o6,	%g7
	movne	%icc,	%l6,	%i1
	movrgez	%l1,	%o3,	%i3
	edge32	%o4,	%o7,	%i0
	movrgz	%i6,	0x296,	%l2
	popc	0x1ADB,	%i4
	wr	%g0,	0x0c,	%asi
	ldswa	[%l7 + 0x2C] %asi,	%g3
	tge	%xcc,	0x4
	ld	[%l7 + 0x6C],	%f13
	mulx	%g2,	0x0808,	%g5
	array32	%i7,	%g1,	%g4
	tsubcc	%o0,	0x1643,	%l3
	fbge	%fcc1,	loop_2715
	fcmpgt16	%f0,	%f18,	%l5
	mulx	%g6,	%l0,	%l4
	fand	%f28,	%f16,	%f6
loop_2715:
	fmovdgu	%xcc,	%f27,	%f19
	ldsb	[%l7 + 0x5A],	%o2
	sllx	%i5,	%o1,	%i2
	fmovsleu	%icc,	%f2,	%f17
	fnands	%f4,	%f7,	%f15
	fbul,a	%fcc0,	loop_2716
	fmovdle	%icc,	%f31,	%f25
	bshuffle	%f18,	%f2,	%f24
	array8	%o6,	%g7,	%l6
loop_2716:
	movrgz	%i1,	%l1,	%o5
	udiv	%i3,	0x1605,	%o3
	movrgez	%o4,	0x145,	%o7
	umul	%i6,	0x1477,	%l2
	movvs	%xcc,	%i0,	%g3
	fsrc1	%f22,	%f22
	fpack16	%f16,	%f26
	sth	%g2,	[%l7 + 0x72]
	bg	%icc,	loop_2717
	fornot2s	%f27,	%f7,	%f27
	fble,a	%fcc3,	loop_2718
	brz	%g5,	loop_2719
loop_2717:
	umul	%i7,	%g1,	%g4
	bge,a	loop_2720
loop_2718:
	mova	%icc,	%o0,	%l3
loop_2719:
	tpos	%xcc,	0x0
	addcc	%l5,	%i4,	%g6
loop_2720:
	fpack32	%f22,	%f6,	%f16
	fmovsleu	%xcc,	%f21,	%f17
	tn	%icc,	0x6
	fmovsgu	%xcc,	%f26,	%f3
	set	0x60, %o5
	lduha	[%l7 + %o5] 0x18,	%l0
	fblg,a	%fcc0,	loop_2721
	std	%o2,	[%l7 + 0x78]
	fmovsl	%xcc,	%f20,	%f7
	tneg	%icc,	0x1
loop_2721:
	movrne	%i5,	0x20F,	%l4
	ldub	[%l7 + 0x09],	%i2
	fnands	%f10,	%f9,	%f21
	brz	%o1,	loop_2722
	tg	%icc,	0x0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addcc	%o6,	0x02C7,	%l6
loop_2722:
	pdist	%f30,	%f20,	%f10
	fmovsne	%xcc,	%f11,	%f4
	xorcc	%g7,	0x1B87,	%i1
	tvs	%icc,	0x7
	fmovrsgz	%o5,	%f3,	%f8
	fbg,a	%fcc1,	loop_2723
	tvc	%xcc,	0x0
	wr	%g0,	0x19,	%asi
	lduwa	[%l7 + 0x58] %asi,	%l1
loop_2723:
	fmovrdlez	%i3,	%f10,	%f24
	umulcc	%o3,	%o4,	%i6
	edge8ln	%o7,	%l2,	%g3
	nop
	setx	loop_2724,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fmovdvc	%xcc,	%f24,	%f15
	membar	0x34
	fmovrse	%g2,	%f11,	%f19
loop_2724:
	sdivcc	%g5,	0x05CC,	%i0
	fmovsl	%icc,	%f23,	%f31
	orcc	%i7,	%g4,	%o0
	tg	%xcc,	0x2
	fmovsa	%xcc,	%f28,	%f15
	brlz	%g1,	loop_2725
	udivcc	%l5,	0x1D7A,	%l3
	orncc	%i4,	%l0,	%g6
	ta	%xcc,	0x4
loop_2725:
	smulcc	%o2,	0x1A4B,	%l4
	fbu,a	%fcc3,	loop_2726
	tsubcc	%i2,	0x0CDF,	%i5
	andcc	%o1,	0x0C1C,	%o6
	stx	%g7,	[%l7 + 0x58]
loop_2726:
	stx	%i1,	[%l7 + 0x58]
	srlx	%l6,	%l1,	%i3
	sdivx	%o3,	0x0286,	%o5
	fcmpgt32	%f10,	%f0,	%o4
	fbue	%fcc2,	loop_2727
	fmovsle	%xcc,	%f11,	%f1
	xnorcc	%o7,	0x142D,	%l2
	movleu	%icc,	%g3,	%g2
loop_2727:
	movrne	%g5,	%i6,	%i7
	ldd	[%l7 + 0x58],	%f14
	st	%f27,	[%l7 + 0x6C]
	sra	%g4,	0x18,	%o0
	fxor	%f16,	%f4,	%f18
	bcs	%xcc,	loop_2728
	edge16	%g1,	%l5,	%l3
	move	%icc,	%i0,	%i4
	set	0x20, %g2
	ldda	[%l7 + %g2] 0x0c,	%g6
loop_2728:
	and	%o2,	%l0,	%i2
	tsubcctv	%l4,	0x1F5B,	%i5
	fmovsvc	%xcc,	%f22,	%f1
	umul	%o1,	%g7,	%o6
	movvc	%xcc,	%i1,	%l1
	tle	%xcc,	0x3
	membar	0x05
	movrne	%i3,	0x232,	%o3
	fandnot1	%f20,	%f10,	%f2
	xnorcc	%o5,	0x1C03,	%l6
	fmovdne	%xcc,	%f27,	%f8
	fmovdcs	%icc,	%f19,	%f5
	popc	%o4,	%l2
	tle	%icc,	0x0
	fmovdvs	%xcc,	%f18,	%f15
	movle	%icc,	%g3,	%o7
	movrgez	%g5,	0x290,	%i6
	bl,a	loop_2729
	and	%i7,	%g2,	%g4
	fmovscc	%xcc,	%f13,	%f19
	smul	%o0,	0x1888,	%g1
loop_2729:
	for	%f26,	%f8,	%f16
	fmovdcs	%icc,	%f18,	%f11
	orcc	%l5,	0x0D96,	%l3
	movgu	%xcc,	%i0,	%g6
	tle	%icc,	0x3
	andn	%i4,	%o2,	%l0
	movrlez	%l4,	%i2,	%o1
	fmovrde	%i5,	%f22,	%f22
	nop
	setx loop_2730, %l0, %l1
	jmpl %l1, %o6
	xnor	%i1,	0x1FA4,	%g7
	movrgez	%l1,	0x17C,	%i3
	ldd	[%l7 + 0x38],	%f12
loop_2730:
	ldstub	[%l7 + 0x47],	%o3
	tcc	%icc,	0x0
	fmovsn	%icc,	%f13,	%f15
	movrgz	%o5,	0x0A9,	%o4
	fors	%f26,	%f25,	%f25
	fmovdneg	%icc,	%f17,	%f11
	set	0x6E, %g1
	ldsha	[%l7 + %g1] 0x11,	%l2
	fandnot1	%f6,	%f8,	%f0
	fones	%f25
	fandnot1	%f4,	%f6,	%f8
	or	%l6,	%o7,	%g3
	addc	%g5,	0x14A5,	%i6
	tneg	%xcc,	0x5
	taddcctv	%i7,	%g2,	%g4
	add	%g1,	%o0,	%l3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ta	%xcc,	0x2
	sdivx	%i0,	0x0EF5,	%g6
	tvs	%icc,	0x4
	call	loop_2731
	fexpand	%f20,	%f20
	fmuld8sux16	%f30,	%f5,	%f28
	nop
	setx loop_2732, %l0, %l1
	jmpl %l1, %i4
loop_2731:
	mova	%icc,	%l5,	%l0
	taddcc	%o2,	%i2,	%l4
	movne	%icc,	%i5,	%o1
loop_2732:
	edge32ln	%i1,	%o6,	%g7
	alignaddrl	%i3,	%o3,	%l1
	move	%icc,	%o5,	%l2
	fmovrdlez	%l6,	%f10,	%f0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srlx	%o4,	0x1A,	%o7
	andn	%g3,	%g5,	%i7
	add	%l7,	0x78,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%i6
	casa	[%l6] %asi,	%i6,	%g2
	movrgez	%g4,	0x389,	%g1
	mulscc	%l3,	0x0BF9,	%i0
	sethi	0x1F48,	%o0
	bcc,a,pt	%xcc,	loop_2733
	fbu,a	%fcc2,	loop_2734
	udivcc	%g6,	0x0DD3,	%l5
	flush	%l7 + 0x44
loop_2733:
	tl	%xcc,	0x2
loop_2734:
	tleu	%xcc,	0x1
	sdivx	%i4,	0x1E7E,	%l0
	sdivx	%o2,	0x024D,	%l4
	orcc	%i2,	0x1F6B,	%i5
	subc	%i1,	%o6,	%o1
	movle	%xcc,	%g7,	%o3
	ldd	[%l7 + 0x38],	%l0
	fmovrsgez	%o5,	%f26,	%f25
	tl	%icc,	0x2
	set	0x48, %i4
	sta	%f2,	[%l7 + %i4] 0x0c
	sdivcc	%l2,	0x187C,	%l6
	set	0x7C, %o4
	ldsha	[%l7 + %o4] 0x14,	%o4
	movcc	%xcc,	%o7,	%i3
	movneg	%xcc,	%g5,	%i7
	set	0x60, %l0
	ldda	[%l7 + %l0] 0x2b,	%g2
	bl,a,pn	%xcc,	loop_2735
	edge16	%i6,	%g2,	%g4
	sethi	0x19D3,	%g1
	fmovrsgz	%l3,	%f7,	%f5
loop_2735:
	fbue	%fcc2,	loop_2736
	tpos	%icc,	0x6
	be,a,pt	%xcc,	loop_2737
	st	%f2,	[%l7 + 0x28]
loop_2736:
	array8	%i0,	%o0,	%g6
	fnor	%f14,	%f0,	%f2
loop_2737:
	fbuge,a	%fcc2,	loop_2738
	fmul8x16au	%f18,	%f25,	%f30
	tle	%icc,	0x0
	movl	%xcc,	%i4,	%l0
loop_2738:
	fand	%f16,	%f8,	%f24
	smulcc	%l5,	%o2,	%l4
	movrlez	%i5,	%i1,	%o6
	edge32n	%i2,	%o1,	%o3
	udivcc	%l1,	0x14DE,	%g7
	sub	%o5,	0x0869,	%l6
	swap	[%l7 + 0x50],	%l2
	fmovs	%f27,	%f29
	nop
	setx loop_2739, %l0, %l1
	jmpl %l1, %o7
	ba,a	%xcc,	loop_2740
	movle	%xcc,	%i3,	%o4
	fmovdpos	%icc,	%f0,	%f14
loop_2739:
	nop
	set	0x40, %l4
	stxa	%g5,	[%l7 + %l4] 0x10
loop_2740:
	fandnot2s	%f29,	%f30,	%f4
	stbar
	membar	0x7D
	wr	%g0,	0x89,	%asi
	ldsba	[%l7 + 0x3B] %asi,	%g3
	tvc	%icc,	0x5
	andn	%i7,	0x1AD1,	%g2
	srlx	%i6,	0x1B,	%g4
	tl	%xcc,	0x0
	tvc	%icc,	0x7
	alignaddr	%l3,	%i0,	%g1
	fmovrslez	%g6,	%f27,	%f5
	bvc,a,pt	%xcc,	loop_2741
	bge,pn	%icc,	loop_2742
	xnorcc	%o0,	%l0,	%i4
	mova	%icc,	%l5,	%l4
loop_2741:
	and	%i5,	0x19BA,	%o2
loop_2742:
	movvc	%xcc,	%o6,	%i2
	bcc,a	%xcc,	loop_2743
	and	%i1,	0x15E0,	%o3
	ldstub	[%l7 + 0x1E],	%o1
	movrne	%l1,	0x2B5,	%g7
loop_2743:
	sth	%l6,	[%l7 + 0x78]
	orncc	%l2,	%o7,	%i3
	xnorcc	%o5,	0x131D,	%o4
	sllx	%g5,	0x08,	%g3
	fmovd	%f16,	%f4
	bgu,pt	%icc,	loop_2744
	xorcc	%g2,	0x14AB,	%i6
	orn	%g4,	0x063D,	%i7
	fcmpgt16	%f26,	%f26,	%l3
loop_2744:
	te	%xcc,	0x0
	umul	%i0,	0x06D9,	%g6
	ba,pt	%xcc,	loop_2745
	flush	%l7 + 0x7C
	tcc	%xcc,	0x0
	srlx	%g1,	0x14,	%l0
loop_2745:
	bgu,pn	%xcc,	loop_2746
	edge16n	%i4,	%o0,	%l5
	edge32	%l4,	%o2,	%o6
	smul	%i5,	0x134D,	%i2
loop_2746:
	siam	0x6
	for	%f0,	%f14,	%f18
	sll	%o3,	%o1,	%l1
	edge8l	%i1,	%l6,	%g7
	bg,pn	%xcc,	loop_2747
	fabss	%f6,	%f2
	edge8	%l2,	%i3,	%o7
	andcc	%o4,	%o5,	%g3
loop_2747:
	sdiv	%g5,	0x15D4,	%i6
	membar	0x5F
	te	%icc,	0x6
	edge32	%g4,	%g2,	%l3
	fbule	%fcc3,	loop_2748
	udivcc	%i7,	0x0810,	%g6
	fmovdneg	%xcc,	%f11,	%f18
	fmovdcs	%icc,	%f18,	%f16
loop_2748:
	xor	%i0,	0x170F,	%l0
	wr	%g0,	0x04,	%asi
	ldsha	[%l7 + 0x78] %asi,	%g1
	tl	%icc,	0x2
	smulcc	%o0,	0x0299,	%i4
	tgu	%icc,	0x5
	andncc	%l5,	%l4,	%o2
	movleu	%xcc,	%o6,	%i5
	edge8ln	%i2,	%o1,	%l1
	umul	%i1,	%l6,	%g7
	fexpand	%f13,	%f10
	tvc	%icc,	0x3
	stbar
	umul	%l2,	0x0AF7,	%i3
	movrlez	%o3,	%o4,	%o7
	sll	%g3,	0x13,	%o5
	edge8	%g5,	%g4,	%i6
	ldsb	[%l7 + 0x08],	%g2
	add	%l3,	0x1FDB,	%i7
	taddcc	%i0,	%g6,	%g1
	ta	%xcc,	0x1
	fcmpd	%fcc3,	%f28,	%f22
	fmovspos	%xcc,	%f20,	%f14
	fbul	%fcc0,	loop_2749
	and	%l0,	%i4,	%l5
	fmovdpos	%xcc,	%f17,	%f10
	sethi	0x07D0,	%l4
loop_2749:
	edge16	%o0,	%o6,	%o2
	sdivx	%i2,	0x16D6,	%o1
	fmovdneg	%xcc,	%f21,	%f11
	faligndata	%f14,	%f20,	%f12
	fcmpne16	%f10,	%f26,	%i5
	tvs	%xcc,	0x5
	movg	%icc,	%i1,	%l1
	bvs	%xcc,	loop_2750
	subc	%g7,	0x199A,	%l6
	sra	%l2,	0x0F,	%o3
	movge	%xcc,	%o4,	%o7
loop_2750:
	tle	%icc,	0x3
	fornot2	%f4,	%f8,	%f18
	fbe,a	%fcc2,	loop_2751
	or	%i3,	0x16F3,	%o5
	siam	0x6
	edge16ln	%g5,	%g4,	%i6
loop_2751:
	array16	%g3,	%l3,	%i7
	movrgez	%g2,	%i0,	%g1
	prefetch	[%l7 + 0x68],	 0x0
	umulcc	%l0,	%i4,	%g6
	andcc	%l5,	0x0BA4,	%l4
	fba	%fcc3,	loop_2752
	tpos	%icc,	0x0
	movrgez	%o6,	%o0,	%o2
	edge32n	%o1,	%i2,	%i1
loop_2752:
	fbo,a	%fcc3,	loop_2753
	fmul8ulx16	%f6,	%f28,	%f8
	nop
	setx	loop_2754,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	taddcctv	%l1,	0x0A8E,	%g7
loop_2753:
	movrgz	%l6,	0x190,	%l2
	fpsub32	%f16,	%f16,	%f28
loop_2754:
	edge32l	%i5,	%o4,	%o7
	tle	%icc,	0x6
	ldsh	[%l7 + 0x46],	%o3
	tgu	%icc,	0x6
	tge	%icc,	0x3
	sub	%o5,	%g5,	%g4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srl	%i6,	0x11,	%g3
	udivcc	%l3,	0x0C99,	%i7
	fbul	%fcc1,	loop_2755
	subcc	%i3,	0x1E0C,	%i0
	fbge	%fcc3,	loop_2756
	st	%f0,	[%l7 + 0x2C]
loop_2755:
	tgu	%icc,	0x1
	udivcc	%g1,	0x0DF0,	%l0
loop_2756:
	fbe,a	%fcc2,	loop_2757
	ba,a	%icc,	loop_2758
	fmovrsgz	%g2,	%f24,	%f10
	popc	0x132B,	%i4
loop_2757:
	tleu	%xcc,	0x0
loop_2758:
	movn	%icc,	%g6,	%l4
	orn	%l5,	%o0,	%o2
	movn	%icc,	%o1,	%o6
	bgu	%icc,	loop_2759
	sdiv	%i1,	0x17CD,	%i2
	siam	0x7
	addcc	%g7,	0x1A67,	%l1
loop_2759:
	fmovdcc	%xcc,	%f25,	%f11
	tle	%xcc,	0x3
	te	%xcc,	0x6
	fpmerge	%f19,	%f25,	%f28
	mulscc	%l6,	0x1BA2,	%i5
	fmovdne	%xcc,	%f7,	%f18
	ba,pt	%xcc,	loop_2760
	alignaddr	%o4,	%l2,	%o3
	smulcc	%o5,	%g5,	%o7
	edge8	%g4,	%g3,	%l3
loop_2760:
	movcc	%icc,	%i7,	%i3
	edge8l	%i0,	%g1,	%i6
	fmovdvs	%xcc,	%f26,	%f4
	fnegs	%f10,	%f17
	wr	%g0,	0xe3,	%asi
	stba	%l0,	[%l7 + 0x59] %asi
	membar	#Sync
	edge32	%g2,	%i4,	%l4
	sll	%l5,	0x06,	%g6
	array32	%o0,	%o2,	%o6
	fpsub32s	%f15,	%f2,	%f10
	sdiv	%o1,	0x0E2E,	%i1
	fnands	%f3,	%f1,	%f17
	array32	%i2,	%g7,	%l6
	set	0x6C, %i0
	sta	%f25,	[%l7 + %i0] 0x18
	fmuld8ulx16	%f30,	%f14,	%f4
	and	%l1,	%o4,	%i5
	umulcc	%l2,	%o3,	%g5
	fmovscs	%icc,	%f20,	%f14
	fmovda	%icc,	%f0,	%f28
	brgez,a	%o5,	loop_2761
	fandnot1	%f24,	%f24,	%f30
	smulcc	%o7,	0x168E,	%g4
	tcs	%icc,	0x2
loop_2761:
	bcs	loop_2762
	edge16n	%l3,	%i7,	%i3
	fmovda	%icc,	%f3,	%f21
	fmovda	%xcc,	%f27,	%f16
loop_2762:
	fcmpne32	%f8,	%f22,	%i0
	wr	%g0,	0x80,	%asi
	ldstuba	[%l7 + 0x0C] %asi,	%g1
	tcc	%icc,	0x1
	andncc	%i6,	%g3,	%l0
	wr	%g0,	0x04,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	movne	%icc,	%i4,	%l4
	mulx	%g2,	%l5,	%o0
	fmuld8sux16	%f23,	%f16,	%f30
	xnorcc	%o2,	0x1E29,	%o6
	faligndata	%f2,	%f20,	%f0
	bshuffle	%f26,	%f16,	%f2
	movge	%xcc,	%g6,	%o1
	movleu	%xcc,	%i1,	%i2
	addc	%l6,	0x120A,	%l1
	fpmerge	%f11,	%f21,	%f16
	subccc	%o4,	%i5,	%l2
	fbge	%fcc3,	loop_2763
	movl	%xcc,	%g7,	%o3
	umul	%o5,	0x1BC4,	%o7
	fxor	%f8,	%f10,	%f10
loop_2763:
	fpadd32s	%f19,	%f6,	%f13
	swap	[%l7 + 0x70],	%g4
	movg	%xcc,	%l3,	%g5
	movpos	%xcc,	%i7,	%i3
	prefetch	[%l7 + 0x4C],	 0x1
	fmovsvs	%xcc,	%f7,	%f4
	movl	%icc,	%g1,	%i0
	set	0x4D, %g3
	lduba	[%l7 + %g3] 0x19,	%g3
	fmovrsgz	%i6,	%f18,	%f9
	move	%icc,	%l0,	%l4
	addcc	%g2,	%l5,	%o0
	movrne	%o2,	0x095,	%i4
	fmovrslz	%o6,	%f2,	%f19
	brnz,a	%o1,	loop_2764
	nop
	setx loop_2765, %l0, %l1
	jmpl %l1, %g6
	fcmpne16	%f14,	%f6,	%i2
	ldub	[%l7 + 0x4F],	%l6
loop_2764:
	movrgez	%l1,	0x0EF,	%i1
loop_2765:
	movrgz	%o4,	%i5,	%l2
	fmovrslz	%o3,	%f31,	%f29
	umulcc	%g7,	0x1741,	%o7
	for	%f22,	%f16,	%f2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8	%o5,	%g4,	%l3
	fsrc2s	%f15,	%f6
	taddcc	%g5,	%i7,	%g1
	movrlez	%i3,	0x194,	%g3
	stx	%i0,	[%l7 + 0x28]
	fnot2s	%f26,	%f15
	te	%xcc,	0x3
	tgu	%xcc,	0x5
	sethi	0x0C96,	%i6
	wr	%g0,	0x88,	%asi
	sta	%f29,	[%l7 + 0x40] %asi
	ba	loop_2766
	edge32ln	%l4,	%l0,	%g2
	sdivx	%l5,	0x07F0,	%o2
	bn,a,pn	%icc,	loop_2767
loop_2766:
	srax	%i4,	0x0B,	%o6
	fandnot1	%f2,	%f2,	%f14
	movleu	%icc,	%o1,	%o0
loop_2767:
	edge8n	%g6,	%i2,	%l1
	movpos	%icc,	%i1,	%l6
	fbul,a	%fcc2,	loop_2768
	movge	%xcc,	%o4,	%l2
	edge16l	%i5,	%o3,	%o7
	movrgez	%g7,	%o5,	%l3
loop_2768:
	or	%g4,	%i7,	%g1
	mova	%icc,	%g5,	%g3
	array8	%i3,	%i6,	%i0
	brlz	%l4,	loop_2769
	edge32n	%l0,	%g2,	%l5
	bneg,a,pn	%icc,	loop_2770
	tvs	%icc,	0x5
loop_2769:
	bcc	loop_2771
	addccc	%o2,	0x021D,	%i4
loop_2770:
	taddcctv	%o6,	0x1AD9,	%o0
	edge16ln	%o1,	%g6,	%l1
loop_2771:
	movre	%i2,	0x00C,	%i1
	set	0x13, %o3
	ldsba	[%l7 + %o3] 0x10,	%l6
	movrgez	%l2,	%i5,	%o3
	fmovdge	%icc,	%f0,	%f3
	fmovdcs	%icc,	%f10,	%f0
	fmovda	%icc,	%f10,	%f0
	tge	%xcc,	0x4
	fmovrdgz	%o7,	%f24,	%f18
	tleu	%icc,	0x7
	fmuld8ulx16	%f17,	%f20,	%f10
	set	0x40, %o7
	stha	%o4,	[%l7 + %o7] 0x27
	membar	#Sync
	popc	0x1034,	%o5
	fmuld8ulx16	%f0,	%f26,	%f6
	ba	%xcc,	loop_2772
	fmovrdgez	%l3,	%f28,	%f30
	set	0x50, %g5
	ldda	[%l7 + %g5] 0x80,	%g6
loop_2772:
	tl	%icc,	0x5
	fmuld8sux16	%f18,	%f21,	%f0
	udivx	%g4,	0x0789,	%g1
	fbue	%fcc3,	loop_2773
	fzeros	%f1
	movneg	%icc,	%g5,	%i7
	edge8n	%i3,	%i6,	%g3
loop_2773:
	movle	%icc,	%i0,	%l4
	xor	%l0,	%l5,	%g2
	fcmpeq32	%f6,	%f16,	%o2
	taddcctv	%i4,	0x1617,	%o6
	movge	%icc,	%o0,	%g6
	smulcc	%l1,	0x1DEC,	%o1
	sdivx	%i1,	0x0A4A,	%i2
	fmovspos	%xcc,	%f19,	%f9
	fmovs	%f24,	%f12
	smul	%l2,	%l6,	%o3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subcc	%o7,	0x059E,	%o4
	set	0x5C, %i3
	sta	%f10,	[%l7 + %i3] 0x15
	tvs	%xcc,	0x3
	movcs	%icc,	%o5,	%l3
	ta	%icc,	0x3
	sdivx	%i5,	0x1080,	%g7
	fmuld8ulx16	%f28,	%f3,	%f6
	popc	%g4,	%g5
	edge32n	%g1,	%i3,	%i6
	fand	%f8,	%f26,	%f6
	move	%icc,	%i7,	%i0
	bl,a,pn	%icc,	loop_2774
	movcs	%xcc,	%l4,	%l0
	nop
	set	0x71, %g4
	ldstub	[%l7 + %g4],	%l5
	set	0x40, %o1
	stda	%f16,	[%l7 + %o1] 0x1e
	membar	#Sync
loop_2774:
	brlz	%g3,	loop_2775
	fnot1	%f2,	%f30
	sdivx	%o2,	0x1EE4,	%i4
	fmul8x16	%f14,	%f2,	%f14
loop_2775:
	subccc	%g2,	0x0489,	%o0
	or	%g6,	0x1983,	%o6
	fsrc2s	%f1,	%f24
	taddcc	%l1,	%i1,	%o1
	array32	%i2,	%l2,	%o3
	mulx	%l6,	%o7,	%o5
	movrlez	%o4,	%i5,	%l3
	bgu,a,pt	%xcc,	loop_2776
	move	%icc,	%g4,	%g7
	te	%xcc,	0x3
	sir	0x0B2F
loop_2776:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	set	0x64, %g6
	prefetch	[%l7 + %g6],	 0x0
	movrlez	%g5,	0x177,	%i3
	xnor	%g1,	%i7,	%i0
	edge16l	%l4,	%l0,	%l5
	bn,pn	%xcc,	loop_2777
	taddcc	%g3,	0x0916,	%o2
	mulx	%i6,	%g2,	%i4
	tl	%xcc,	0x4
loop_2777:
	tneg	%xcc,	0x5
	tl	%icc,	0x7
	tvs	%icc,	0x0
	ldx	[%l7 + 0x50],	%g6
	fmovdge	%xcc,	%f14,	%f29
	subcc	%o6,	0x0EA5,	%o0
	fbule	%fcc0,	loop_2778
	bge,a,pn	%xcc,	loop_2779
	fornot1	%f4,	%f16,	%f0
	sdivcc	%i1,	0x088D,	%l1
loop_2778:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2779:
	sra	%i2,	0x19,	%l2
	movn	%icc,	%o1,	%l6
	set	0x40, %o2
	ldda	[%l7 + %o2] 0x23,	%o2
	umul	%o5,	%o7,	%i5
	addc	%o4,	%g4,	%l3
	tn	%icc,	0x4
	bgu,pt	%xcc,	loop_2780
	fzeros	%f5
	sdivx	%g7,	0x1F38,	%i3
	movre	%g5,	0x1EB,	%g1
loop_2780:
	fsrc1	%f22,	%f8
	movrgez	%i0,	%i7,	%l4
	tcc	%icc,	0x6
	bpos,a	%icc,	loop_2781
	ldd	[%l7 + 0x58],	%l4
	umulcc	%l0,	0x0A10,	%g3
	array8	%i6,	%o2,	%i4
loop_2781:
	stx	%g2,	[%l7 + 0x28]
	popc	0x1718,	%o6
	sra	%g6,	0x14,	%o0
	mova	%xcc,	%l1,	%i2
	stbar
	fble	%fcc2,	loop_2782
	mulscc	%l2,	0x192B,	%i1
	fsrc2s	%f16,	%f16
	array16	%l6,	%o3,	%o5
loop_2782:
	mova	%xcc,	%o7,	%i5
	movrlez	%o4,	%g4,	%o1
	subcc	%g7,	%l3,	%i3
	fmovsa	%icc,	%f16,	%f8
	fxors	%f18,	%f17,	%f28
	taddcc	%g5,	%g1,	%i0
	and	%l4,	0x0107,	%l5
	movre	%l0,	%g3,	%i6
	edge8ln	%o2,	%i7,	%g2
	movg	%icc,	%o6,	%g6
	fbe	%fcc1,	loop_2783
	fmul8x16	%f2,	%f22,	%f30
	tn	%icc,	0x7
	wr	%g0,	0x81,	%asi
	lduba	[%l7 + 0x2E] %asi,	%o0
loop_2783:
	tcc	%icc,	0x6
	ldub	[%l7 + 0x2D],	%l1
	tsubcc	%i2,	%i4,	%i1
	prefetch	[%l7 + 0x08],	 0x0
	fsrc1s	%f10,	%f5
	bvc,a,pt	%icc,	loop_2784
	tsubcc	%l2,	0x0402,	%l6
	nop
	setx	loop_2785,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	sllx	%o3,	0x05,	%o5
loop_2784:
	edge16ln	%i5,	%o4,	%g4
	srl	%o1,	%g7,	%o7
loop_2785:
	ldsh	[%l7 + 0x26],	%i3
	andn	%l3,	%g1,	%g5
	call	loop_2786
	nop
	set	0x74, %i7
	ldsh	[%l7 + %i7],	%l4
	fmovsleu	%icc,	%f27,	%f6
	tne	%icc,	0x2
loop_2786:
	fmul8ulx16	%f4,	%f18,	%f8
	mulscc	%l5,	0x187B,	%i0
	srl	%g3,	%l0,	%o2
	set	0x6C, %i1
	stha	%i7,	[%l7 + %i1] 0x2a
	membar	#Sync
	tsubcc	%i6,	0x1043,	%g2
	fpack16	%f6,	%f30
	addc	%g6,	0x0AD1,	%o0
	addccc	%o6,	%i2,	%i4
	orn	%l1,	0x16AE,	%l2
	movrgez	%i1,	%l6,	%o5
	sra	%o3,	0x01,	%o4
	nop
	setx loop_2787, %l0, %l1
	jmpl %l1, %g4
	swap	[%l7 + 0x4C],	%i5
	addccc	%o1,	0x1FE9,	%g7
	array16	%i3,	%o7,	%l3
loop_2787:
	movle	%xcc,	%g1,	%g5
	fsrc2	%f14,	%f10
	wr	%g0,	0x04,	%asi
	swapa	[%l7 + 0x78] %asi,	%l4
	nop
	setx	loop_2788,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	umulcc	%l5,	0x15BF,	%i0
	move	%icc,	%g3,	%o2
	fmovrdlez	%l0,	%f6,	%f30
loop_2788:
	fcmped	%fcc0,	%f2,	%f20
	std	%f8,	[%l7 + 0x20]
	udivcc	%i6,	0x1B35,	%g2
	bl	%icc,	loop_2789
	smul	%g6,	0x1B28,	%i7
	andn	%o6,	%o0,	%i4
	xnor	%l1,	%l2,	%i1
loop_2789:
	taddcctv	%l6,	%o5,	%i2
	movrgez	%o3,	0x0DB,	%o4
	taddcctv	%i5,	0x1A2B,	%g4
	movgu	%xcc,	%o1,	%i3
	fbg,a	%fcc1,	loop_2790
	fpadd32	%f20,	%f30,	%f2
	movle	%xcc,	%o7,	%g7
	fpsub16	%f28,	%f24,	%f22
loop_2790:
	tl	%icc,	0x0
	fmuld8sux16	%f7,	%f11,	%f6
	addccc	%g1,	%g5,	%l3
	fmovscc	%xcc,	%f7,	%f20
	or	%l5,	%l4,	%g3
	movvs	%xcc,	%o2,	%i0
	fmul8ulx16	%f8,	%f24,	%f22
	sllx	%l0,	%g2,	%i6
	xor	%g6,	%o6,	%i7
	set	0x64, %g7
	stwa	%i4,	[%l7 + %g7] 0x14
	fxors	%f19,	%f24,	%f30
	addc	%o0,	%l2,	%l1
	siam	0x2
	move	%icc,	%i1,	%o5
	stb	%i2,	[%l7 + 0x59]
	xnorcc	%o3,	%l6,	%i5
	movneg	%xcc,	%g4,	%o4
	sdivx	%o1,	0x17AB,	%i3
	ldsw	[%l7 + 0x18],	%o7
	fmovdleu	%icc,	%f1,	%f17
	andn	%g1,	%g7,	%g5
	movpos	%icc,	%l5,	%l3
	tge	%icc,	0x5
	fxnor	%f8,	%f12,	%f20
	fmovscs	%xcc,	%f10,	%f3
	movrgez	%g3,	%l4,	%i0
	nop
	set	0x1A, %l2
	ldstub	[%l7 + %l2],	%l0
	srax	%g2,	0x15,	%o2
	tneg	%icc,	0x6
	ldsw	[%l7 + 0x6C],	%g6
	fmovrslez	%i6,	%f6,	%f28
	edge32l	%o6,	%i4,	%i7
	wr	%g0,	0x19,	%asi
	ldswa	[%l7 + 0x78] %asi,	%o0
	edge8	%l2,	%i1,	%l1
	be	%icc,	loop_2791
	tcs	%icc,	0x7
	ba,pt	%xcc,	loop_2792
	fnors	%f31,	%f24,	%f7
loop_2791:
	edge32	%i2,	%o3,	%o5
	fmovrslez	%l6,	%f28,	%f1
loop_2792:
	smulcc	%i5,	%o4,	%g4
	andn	%i3,	%o1,	%o7
	fsrc2	%f16,	%f26
	brz,a	%g1,	loop_2793
	fmul8ulx16	%f26,	%f0,	%f14
	andncc	%g5,	%l5,	%g7
	addc	%g3,	0x0DDF,	%l4
loop_2793:
	edge8l	%i0,	%l3,	%g2
	edge32n	%o2,	%l0,	%i6
	tcs	%xcc,	0x7
	move	%icc,	%g6,	%o6
	nop
	setx	loop_2794,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	edge32	%i4,	%o0,	%l2
	fmul8x16	%f30,	%f16,	%f8
	movge	%icc,	%i7,	%i1
loop_2794:
	edge16n	%l1,	%i2,	%o5
	fnegd	%f8,	%f10
	bleu,a	%icc,	loop_2795
	fcmpeq16	%f0,	%f8,	%l6
	wr	%g0,	0x19,	%asi
	ldsba	[%l7 + 0x7B] %asi,	%o3
loop_2795:
	srl	%i5,	%g4,	%o4
	fpsub16s	%f27,	%f6,	%f11
	smulcc	%o1,	%o7,	%g1
	wr	%g0,	0x19,	%asi
	prefetcha	[%l7 + 0x40] %asi,	 0x2
	fones	%f30
	andncc	%g5,	%l5,	%g3
	tg	%icc,	0x1
	fba	%fcc2,	loop_2796
	movg	%icc,	%l4,	%i0
	or	%l3,	%g7,	%g2
	swap	[%l7 + 0x10],	%o2
loop_2796:
	stx	%l0,	[%l7 + 0x50]
	wr	%g0,	0x18,	%asi
	ldswa	[%l7 + 0x48] %asi,	%i6
	set	0x60, %o6
	lduwa	[%l7 + %o6] 0x11,	%g6
	lduw	[%l7 + 0x14],	%i4
	fcmpne16	%f0,	%f24,	%o6
	smul	%l2,	0x087A,	%o0
	set	0x08, %l6
	lduba	[%l7 + %l6] 0x04,	%i7
	sdivx	%l1,	0x0CD8,	%i1
	add	%i2,	0x1CA0,	%o5
	movl	%xcc,	%o3,	%l6
	nop
	setx loop_2797, %l0, %l1
	jmpl %l1, %i5
	te	%xcc,	0x0
	wr	%g0,	0x10,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
loop_2797:
	xnor	%g4,	0x02FF,	%o4
	umul	%o7,	%g1,	%o1
	te	%icc,	0x4
	movleu	%xcc,	%i3,	%g5
	subcc	%l5,	0x0862,	%l4
	addccc	%i0,	%l3,	%g3
	brlz,a	%g7,	loop_2798
	movneg	%xcc,	%g2,	%o2
	faligndata	%f24,	%f0,	%f2
	fmovs	%f22,	%f31
loop_2798:
	subc	%i6,	0x1566,	%l0
	call	loop_2799
	subcc	%i4,	0x1EC0,	%g6
	fmovdn	%icc,	%f6,	%f30
	movrgez	%l2,	0x0E1,	%o6
loop_2799:
	smul	%i7,	%o0,	%i1
	set	0x7F, %i2
	stba	%l1,	[%l7 + %i2] 0x80
	edge8n	%o5,	%o3,	%i2
	bleu,a,pn	%icc,	loop_2800
	fmovdvs	%xcc,	%f15,	%f2
	fmovrdne	%l6,	%f20,	%f12
	ble,a	%xcc,	loop_2801
loop_2800:
	sllx	%i5,	0x00,	%o4
	wr	%g0,	0x0c,	%asi
	ldstuba	[%l7 + 0x41] %asi,	%g4
loop_2801:
	fpack16	%f4,	%f11
	fnands	%f12,	%f0,	%f21
	xorcc	%o7,	0x0B1B,	%g1
	pdist	%f6,	%f6,	%f2
	xnorcc	%o1,	%i3,	%g5
	edge8	%l4,	%l5,	%i0
	std	%f16,	[%l7 + 0x78]
	membar	#Sync
	wr	%g0,	0x17,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	fmovsgu	%xcc,	%f29,	%f0
	sdivx	%l3,	0x0A52,	%g7
	wr	%g0,	0x88,	%asi
	ldxa	[%l7 + 0x08] %asi,	%g3
	andn	%g2,	%o2,	%i6
	umulcc	%i4,	0x0489,	%l0
	fbn	%fcc3,	loop_2802
	fbule	%fcc3,	loop_2803
	tvc	%icc,	0x5
	andncc	%g6,	%o6,	%l2
loop_2802:
	fmovdneg	%xcc,	%f18,	%f1
loop_2803:
	brlez	%o0,	loop_2804
	mova	%icc,	%i1,	%l1
	orcc	%o5,	0x0E68,	%o3
	tsubcctv	%i2,	0x07E5,	%i7
loop_2804:
	bleu,a	loop_2805
	movneg	%xcc,	%i5,	%l6
	fmovdcs	%xcc,	%f1,	%f1
	edge8	%g4,	%o7,	%g1
loop_2805:
	subccc	%o1,	0x12C3,	%i3
	fbuge	%fcc2,	loop_2806
	orncc	%o4,	%g5,	%l4
	fmovrdlz	%l5,	%f2,	%f30
	bne,pn	%icc,	loop_2807
loop_2806:
	movvs	%icc,	%l3,	%i0
	popc	%g7,	%g3
	fbul	%fcc1,	loop_2808
loop_2807:
	sdivx	%o2,	0x0283,	%i6
	taddcc	%g2,	%i4,	%g6
	fmul8sux16	%f2,	%f28,	%f8
loop_2808:
	movle	%xcc,	%l0,	%l2
	tsubcc	%o6,	0x18E9,	%i1
	fbuge	%fcc1,	loop_2809
	fmovdne	%xcc,	%f12,	%f24
	wr	%g0,	0x18,	%asi
	lda	[%l7 + 0x74] %asi,	%f30
loop_2809:
	lduh	[%l7 + 0x6C],	%l1
	fmovrsgez	%o0,	%f0,	%f7
	bvs	loop_2810
	fornot2	%f10,	%f2,	%f4
	swap	[%l7 + 0x3C],	%o5
	tgu	%xcc,	0x2
loop_2810:
	fmovsne	%icc,	%f4,	%f21
	fpadd16	%f2,	%f8,	%f0
	fbule,a	%fcc3,	loop_2811
	lduw	[%l7 + 0x5C],	%i2
	mulscc	%i7,	%i5,	%o3
	movge	%xcc,	%g4,	%l6
loop_2811:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xor	%o7,	0x0571,	%o1
	tleu	%xcc,	0x1
	tpos	%xcc,	0x4
	siam	0x2
	movneg	%xcc,	%g1,	%i3
	std	%f10,	[%l7 + 0x10]
	fmovd	%f20,	%f0
	stw	%o4,	[%l7 + 0x64]
	fmovrde	%g5,	%f22,	%f4
	call	loop_2812
	movrne	%l4,	0x258,	%l5
	tsubcc	%i0,	%l3,	%g3
	movrlez	%o2,	%i6,	%g7
loop_2812:
	nop
	wr	%g0,	0x5f,	%asi
	stxa	%g2,	[%g0 + 0x0] %asi
	udivcc	%g6,	0x0EA7,	%i4
	nop
	setx loop_2813, %l0, %l1
	jmpl %l1, %l2
	sdivx	%o6,	0x0360,	%i1
	sth	%l1,	[%l7 + 0x16]
	fmul8x16	%f29,	%f26,	%f12
loop_2813:
	nop
	set	0x40, %i6
	stda	%f0,	[%l7 + %i6] 0x1e
	membar	#Sync
	sub	%l0,	0x1E8D,	%o0
	smul	%i2,	0x168B,	%i7
	and	%i5,	0x095D,	%o3
	srlx	%o5,	%l6,	%g4
	wr	%g0,	0x23,	%asi
	ldda	[%l7 + 0x40] %asi,	%o0
	sdivx	%g1,	0x06C9,	%o7
	brgz,a	%o4,	loop_2814
	edge32l	%i3,	%l4,	%l5
	sllx	%i0,	%l3,	%g3
	fmul8x16	%f23,	%f12,	%f30
loop_2814:
	movpos	%icc,	%o2,	%g5
	udivcc	%i6,	0x0ED5,	%g2
	movne	%icc,	%g6,	%i4
	array16	%l2,	%g7,	%i1
	move	%icc,	%o6,	%l1
	edge8ln	%l0,	%o0,	%i2
	tvc	%icc,	0x4
	fmovdvc	%icc,	%f18,	%f3
	edge16l	%i5,	%i7,	%o5
	sub	%l6,	0x1E14,	%g4
	movneg	%xcc,	%o1,	%o3
	fcmpne16	%f2,	%f26,	%g1
	taddcc	%o7,	0x0712,	%i3
	addcc	%l4,	0x117B,	%o4
	fornot2s	%f7,	%f11,	%f20
	fandnot1	%f4,	%f20,	%f24
	array32	%i0,	%l5,	%g3
	edge8	%o2,	%l3,	%g5
	ta	%icc,	0x3
	fmovsle	%icc,	%f21,	%f20
	fandnot2	%f20,	%f30,	%f16
	fbn,a	%fcc2,	loop_2815
	movrne	%i6,	0x295,	%g2
	fmovspos	%icc,	%f16,	%f28
	srax	%i4,	0x1F,	%l2
loop_2815:
	fxors	%f29,	%f23,	%f9
	stw	%g7,	[%l7 + 0x14]
	alignaddrl	%g6,	%o6,	%i1
	sir	0x0ED9
	sethi	0x01BD,	%l0
	orncc	%o0,	%i2,	%i5
	fcmpne32	%f30,	%f22,	%i7
	addcc	%o5,	0x1D69,	%l1
	udiv	%l6,	0x11E1,	%g4
	bshuffle	%f20,	%f14,	%f22
	fbg	%fcc2,	loop_2816
	fmovdvs	%icc,	%f12,	%f19
	edge8n	%o3,	%g1,	%o1
	fblg	%fcc2,	loop_2817
loop_2816:
	movrne	%i3,	%l4,	%o7
	brgz	%i0,	loop_2818
	fbn,a	%fcc1,	loop_2819
loop_2817:
	add	%o4,	%l5,	%o2
	fmovde	%xcc,	%f13,	%f23
loop_2818:
	nop
	wr	%g0,	0x27,	%asi
	stxa	%g3,	[%l7 + 0x20] %asi
	membar	#Sync
loop_2819:
	stb	%l3,	[%l7 + 0x3C]
	movvs	%icc,	%i6,	%g2
	edge32n	%g5,	%l2,	%i4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tcs	%xcc,	0x4
	fpack32	%f4,	%f10,	%f20
	tsubcc	%g6,	0x0A19,	%g7
	fcmpd	%fcc1,	%f0,	%f10
	alignaddrl	%o6,	%i1,	%l0
	edge32l	%o0,	%i2,	%i5
	srlx	%i7,	0x1B,	%l1
	fmovrdlez	%o5,	%f10,	%f26
	fornot1s	%f5,	%f7,	%f6
	edge16l	%l6,	%o3,	%g1
	fmul8sux16	%f18,	%f12,	%f22
	orncc	%o1,	0x082F,	%i3
	tvc	%icc,	0x3
	sir	0x0CBA
	tpos	%icc,	0x7
	tcc	%xcc,	0x3
	te	%icc,	0x5
	wr	%g0,	0x89,	%asi
	lduba	[%l7 + 0x52] %asi,	%l4
	tleu	%xcc,	0x4
	wr	%g0,	0x88,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	ldx	[%l7 + 0x78],	%o7
	std	%g4,	[%l7 + 0x58]
	edge8	%i0,	%l5,	%o4
	fabsd	%f20,	%f18
	fpmerge	%f22,	%f27,	%f20
	popc	0x08BC,	%o2
	sub	%l3,	%i6,	%g2
	movre	%g3,	%g5,	%l2
	tg	%xcc,	0x2
	flush	%l7 + 0x18
	sll	%i4,	%g7,	%g6
	taddcctv	%i1,	%l0,	%o6
	tcc	%icc,	0x1
	pdist	%f2,	%f20,	%f26
	wr	%g0,	0x18,	%asi
	stwa	%i2,	[%l7 + 0x6C] %asi
	edge8n	%i5,	%o0,	%l1
	tle	%xcc,	0x5
	bne	%icc,	loop_2820
	sdivcc	%i7,	0x1648,	%o5
	fands	%f28,	%f29,	%f16
	tne	%xcc,	0x3
loop_2820:
	fbg,a	%fcc3,	loop_2821
	popc	0x1B05,	%l6
	tpos	%icc,	0x2
	ta	%xcc,	0x5
loop_2821:
	fpadd16	%f28,	%f2,	%f0
	udivcc	%g1,	0x1C8E,	%o3
	tne	%icc,	0x1
	sub	%o1,	%i3,	%l4
	addccc	%g4,	%o7,	%i0
	fmovdn	%icc,	%f1,	%f20
	fmovsl	%icc,	%f18,	%f14
	movre	%o4,	0x1D3,	%o2
	edge32ln	%l5,	%l3,	%g2
	udivx	%i6,	0x1EE1,	%g3
	fbule,a	%fcc0,	loop_2822
	tle	%xcc,	0x1
	edge8l	%g5,	%l2,	%i4
	edge32l	%g7,	%i1,	%l0
loop_2822:
	tn	%xcc,	0x0
	taddcc	%g6,	0x11B5,	%o6
	mulx	%i2,	%o0,	%i5
	sll	%l1,	0x0D,	%o5
	fcmpne16	%f8,	%f26,	%i7
	popc	%l6,	%g1
	ldd	[%l7 + 0x18],	%f18
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sethi	0x1398,	%o1
	movleu	%xcc,	%o3,	%l4
	tleu	%xcc,	0x0
	srl	%i3,	%o7,	%i0
	lduh	[%l7 + 0x48],	%g4
	fsrc1	%f2,	%f28
	movrlez	%o2,	%o4,	%l3
	movle	%xcc,	%l5,	%i6
	sdivcc	%g2,	0x1BF3,	%g3
	nop
	setx	loop_2823,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	sll	%l2,	0x14,	%i4
	sub	%g5,	0x0A40,	%g7
	udivx	%i1,	0x06FB,	%l0
loop_2823:
	fmovrslz	%o6,	%f0,	%f24
	fbule	%fcc2,	loop_2824
	array32	%g6,	%i2,	%o0
	ta	%icc,	0x4
	bpos,a	%xcc,	loop_2825
loop_2824:
	fcmpeq16	%f24,	%f30,	%i5
	fbo,a	%fcc2,	loop_2826
	edge32n	%o5,	%i7,	%l6
loop_2825:
	alignaddrl	%g1,	%o1,	%l1
	movle	%icc,	%l4,	%i3
loop_2826:
	edge16	%o7,	%o3,	%g4
	mova	%icc,	%i0,	%o4
	ldd	[%l7 + 0x28],	%l2
	orn	%o2,	0x0E92,	%i6
	add	%l7,	0x10,	%l6
	wr	%g0,	0x0c,	%asi
	casxa	[%l6] %asi,	%g2,	%l5
	add	%l7,	0x70,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] %asi,	%g3,	%i4
	movrlez	%l2,	0x16B,	%g7
	movvc	%icc,	%g5,	%i1
	movge	%icc,	%o6,	%g6
	movg	%xcc,	%l0,	%o0
	ble,a,pn	%xcc,	loop_2827
	movrne	%i5,	%o5,	%i7
	movne	%icc,	%i2,	%g1
	fbn,a	%fcc3,	loop_2828
loop_2827:
	subccc	%o1,	%l1,	%l4
	tsubcc	%i3,	0x13BC,	%l6
	std	%o6,	[%l7 + 0x38]
loop_2828:
	edge32	%g4,	%o3,	%o4
	tge	%xcc,	0x0
	orcc	%l3,	0x03EC,	%o2
	wr	%g0,	0x04,	%asi
	lduha	[%l7 + 0x7A] %asi,	%i0
	fmovspos	%xcc,	%f16,	%f13
	taddcctv	%g2,	0x1A1D,	%i6
	sdivx	%g3,	0x1D01,	%i4
	tcs	%icc,	0x1
	sllx	%l2,	%l5,	%g5
	fmovsne	%icc,	%f20,	%f30
	srl	%i1,	%g7,	%o6
	or	%l0,	%g6,	%i5
	fabsd	%f6,	%f20
	movl	%icc,	%o5,	%i7
	udiv	%o0,	0x07C9,	%g1
	xorcc	%i2,	0x1543,	%o1
	array8	%l1,	%l4,	%i3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrlz	%o7,	0x258,	%l6
	xor	%o3,	0x1E93,	%o4
	fmovrse	%l3,	%f27,	%f16
	sll	%o2,	0x01,	%i0
	addcc	%g4,	%g2,	%g3
	fmovdgu	%xcc,	%f10,	%f1
	pdist	%f20,	%f26,	%f2
	fmovdneg	%xcc,	%f29,	%f1
	set	0x5B, %l5
	ldstuba	[%l7 + %l5] 0x11,	%i4
	bvs,a,pn	%icc,	loop_2829
	tge	%xcc,	0x7
	movrne	%l2,	%l5,	%i6
	tcs	%xcc,	0x3
loop_2829:
	fmovsl	%icc,	%f9,	%f31
	fmovsle	%xcc,	%f23,	%f26
	movrgez	%g5,	%i1,	%g7
	fandnot2	%f8,	%f30,	%f10
	movvc	%xcc,	%o6,	%l0
	sdivx	%g6,	0x0D44,	%o5
	sllx	%i7,	%i5,	%o0
	bge,a	loop_2830
	udivcc	%g1,	0x1D75,	%o1
	fnands	%f19,	%f22,	%f9
	srlx	%l1,	0x15,	%i2
loop_2830:
	udivx	%i3,	0x1248,	%l4
	smul	%l6,	0x0A23,	%o7
	sllx	%o3,	%l3,	%o2
	movne	%xcc,	%i0,	%g4
	sub	%g2,	%g3,	%i4
	movvc	%icc,	%o4,	%l2
	movvs	%icc,	%l5,	%i6
	tsubcctv	%g5,	%i1,	%g7
	fornot2	%f0,	%f24,	%f2
	tn	%icc,	0x5
	tvs	%xcc,	0x1
	taddcctv	%o6,	0x0237,	%g6
	sethi	0x072E,	%l0
	bne,pn	%icc,	loop_2831
	movre	%i7,	%i5,	%o5
	ldd	[%l7 + 0x68],	%f24
	tg	%icc,	0x4
loop_2831:
	fmovsvc	%icc,	%f21,	%f26
	smul	%g1,	%o0,	%l1
	tne	%icc,	0x6
	move	%icc,	%o1,	%i3
	nop
	setx	loop_2832,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	edge8l	%l4,	%l6,	%o7
	ba,pn	%xcc,	loop_2833
	fmovrsgez	%i2,	%f24,	%f9
loop_2832:
	srax	%o3,	%o2,	%l3
	swap	[%l7 + 0x68],	%i0
loop_2833:
	edge8n	%g4,	%g2,	%i4
	move	%xcc,	%o4,	%l2
	or	%l5,	0x150C,	%i6
	std	%g4,	[%l7 + 0x28]
	array16	%i1,	%g7,	%g3
	bl,a,pt	%xcc,	loop_2834
	movge	%xcc,	%o6,	%l0
	movrgez	%i7,	0x105,	%g6
	fmovsne	%icc,	%f19,	%f23
loop_2834:
	movrgz	%o5,	0x2A6,	%g1
	te	%icc,	0x6
	movrlez	%o0,	%l1,	%i5
	movrne	%i3,	0x08C,	%o1
	srax	%l6,	%o7,	%l4
	movneg	%icc,	%i2,	%o2
	add	%l7,	0x08,	%l6
	wr	%g0,	0x11,	%asi
	ldxa	[%l6] %asi,	%o3
	casxa	[%l6] 0x11,	%o3,	%i0
	addccc	%g4,	%l3,	%g2
	sethi	0x1261,	%i4
	set	0x27, %l3
	ldsba	[%l7 + %l3] 0x10,	%o4
	edge8	%l5,	%l2,	%i6
	fandnot2s	%f31,	%f2,	%f5
	bcs,a,pn	%xcc,	loop_2835
	tsubcctv	%i1,	0x178E,	%g5
	movcs	%icc,	%g3,	%g7
	movpos	%icc,	%o6,	%l0
loop_2835:
	addccc	%g6,	0x005A,	%i7
	tneg	%icc,	0x2
	andncc	%o5,	%g1,	%o0
	movrlez	%l1,	%i3,	%o1
	wr	%g0,	0x80,	%asi
	stba	%i5,	[%l7 + 0x0A] %asi
	array32	%l6,	%l4,	%o7
	fbug,a	%fcc1,	loop_2836
	bcc,a,pt	%xcc,	loop_2837
	tcc	%icc,	0x2
	ldx	[%l7 + 0x58],	%o2
loop_2836:
	fmovsvs	%xcc,	%f9,	%f5
loop_2837:
	fbule	%fcc1,	loop_2838
	nop
	set	0x30, %l1
	std	%f22,	[%l7 + %l1]
	orn	%o3,	%i2,	%g4
	sir	0x1CB0
loop_2838:
	edge8n	%i0,	%l3,	%i4
	wr	%g0,	0x10,	%asi
	stxa	%o4,	[%l7 + 0x48] %asi
	fcmple16	%f4,	%f10,	%g2
	fmovrdlz	%l5,	%f2,	%f26
	bvc,a,pt	%xcc,	loop_2839
	fcmpeq16	%f22,	%f2,	%i6
	bshuffle	%f24,	%f22,	%f6
	ta	%xcc,	0x6
loop_2839:
	fmovrdlez	%i1,	%f0,	%f20
	orn	%g5,	0x0458,	%l2
	wr	%g0,	0x80,	%asi
	ldswa	[%l7 + 0x60] %asi,	%g7
	edge8l	%o6,	%g3,	%l0
	fxors	%f2,	%f8,	%f6
	fbug	%fcc0,	loop_2840
	fxnor	%f26,	%f4,	%f18
	srax	%i7,	0x09,	%o5
	andn	%g1,	%o0,	%g6
loop_2840:
	mulscc	%i3,	0x1F99,	%l1
	nop
	setx	loop_2841,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movvc	%xcc,	%i5,	%o1
	set	0x58, %i5
	lda	[%l7 + %i5] 0x89,	%f12
loop_2841:
	ldsh	[%l7 + 0x68],	%l6
	bvc,a	loop_2842
	udivx	%o7,	0x01AF,	%l4
	std	%o2,	[%l7 + 0x28]
	fbule	%fcc1,	loop_2843
loop_2842:
	xnor	%i2,	0x0CFA,	%g4
	movcc	%xcc,	%o3,	%l3
	wr	%g0,	0x0c,	%asi
	lduwa	[%l7 + 0x40] %asi,	%i4
loop_2843:
	smulcc	%o4,	0x1C37,	%g2
	wr	%g0,	0x89,	%asi
	ldstuba	[%l7 + 0x52] %asi,	%i0
	bge	loop_2844
	tcs	%icc,	0x4
	sir	0x13C4
	tsubcc	%i6,	0x0138,	%l5
loop_2844:
	fbe	%fcc2,	loop_2845
	movg	%icc,	%g5,	%l2
	movvc	%xcc,	%g7,	%i1
	smul	%o6,	0x1601,	%l0
loop_2845:
	movle	%icc,	%g3,	%o5
	movrgez	%i7,	%o0,	%g1
	fba,a	%fcc1,	loop_2846
	brgez,a	%i3,	loop_2847
	sdivx	%g6,	0x0A2A,	%i5
	movrgez	%l1,	%l6,	%o7
loop_2846:
	nop
	wr	%g0,	0x89,	%asi
	ldxa	[%l7 + 0x28] %asi,	%l4
loop_2847:
	fnot2s	%f27,	%f17
	fandnot2s	%f9,	%f10,	%f15
	fblg,a	%fcc3,	loop_2848
	edge32n	%o1,	%i2,	%o2
	fpsub32s	%f16,	%f20,	%f14
	stx	%g4,	[%l7 + 0x08]
loop_2848:
	mova	%icc,	%l3,	%o3
	fnot1s	%f10,	%f21
	add	%o4,	%g2,	%i0
	tg	%xcc,	0x1
	sub	%i6,	%l5,	%g5
	edge16n	%i4,	%g7,	%l2
	tle	%icc,	0x7
	brgz,a	%i1,	loop_2849
	movrne	%l0,	%o6,	%o5
	fba	%fcc2,	loop_2850
	movcs	%xcc,	%i7,	%o0
loop_2849:
	fmovsvc	%xcc,	%f4,	%f18
	tg	%xcc,	0x2
loop_2850:
	fbu,a	%fcc1,	loop_2851
	nop
	setx	loop_2852,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	srl	%g1,	0x16,	%g3
	movrgez	%g6,	%i3,	%l1
loop_2851:
	tge	%xcc,	0x0
loop_2852:
	smulcc	%i5,	0x1272,	%o7
	edge8	%l6,	%o1,	%l4
	set	0x40, %o0
	ldda	[%l7 + %o0] 0x10,	%f0
	popc	%o2,	%i2
	fxnor	%f26,	%f8,	%f26
	fblg	%fcc2,	loop_2853
	sdivx	%l3,	0x13FF,	%o3
	fbe,a	%fcc1,	loop_2854
	fmovrsgz	%o4,	%f12,	%f29
loop_2853:
	xorcc	%g4,	0x0F2A,	%i0
	xorcc	%i6,	%l5,	%g2
loop_2854:
	subcc	%g5,	%g7,	%l2
	fpsub32	%f6,	%f30,	%f18
	andncc	%i1,	%l0,	%i4
	fmovdvs	%xcc,	%f19,	%f17
	fble	%fcc3,	loop_2855
	edge16n	%o6,	%o5,	%i7
	swap	[%l7 + 0x74],	%g1
	orn	%o0,	%g6,	%g3
loop_2855:
	lduh	[%l7 + 0x2C],	%i3
	movvs	%xcc,	%i5,	%l1
	fbe	%fcc2,	loop_2856
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddrl	%l6,	%o7,	%o1
	tn	%icc,	0x6
loop_2856:
	edge32ln	%o2,	%l4,	%i2
	taddcc	%l3,	0x1AE0,	%o4
	mulscc	%o3,	0x07E9,	%i0
	edge8ln	%g4,	%i6,	%g2
	tsubcctv	%g5,	%l5,	%g7
	bvc	loop_2857
	bge	loop_2858
	ta	%icc,	0x5
	bge	%xcc,	loop_2859
loop_2857:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2858:
	nop
	wr	%g0,	0x88,	%asi
	lduha	[%l7 + 0x62] %asi,	%i1
loop_2859:
	te	%xcc,	0x0
	fandnot1s	%f31,	%f3,	%f1
	edge8	%l0,	%i4,	%l2
	fbne,a	%fcc2,	loop_2860
	fbe,a	%fcc0,	loop_2861
	edge16ln	%o6,	%i7,	%g1
	sllx	%o0,	0x19,	%g6
loop_2860:
	fcmps	%fcc3,	%f5,	%f7
loop_2861:
	fcmpeq16	%f24,	%f0,	%g3
	fornot1	%f8,	%f24,	%f20
	srl	%o5,	%i5,	%l1
	tg	%xcc,	0x0
	fmovsne	%xcc,	%f12,	%f21
	movg	%xcc,	%i3,	%o7
	movvc	%xcc,	%l6,	%o2
	fmovdg	%xcc,	%f22,	%f28
	edge16n	%o1,	%l4,	%l3
	fcmple16	%f28,	%f18,	%i2
	edge32n	%o3,	%i0,	%o4
	bl,a	%xcc,	loop_2862
	sub	%g4,	0x0640,	%g2
	tne	%icc,	0x1
	bg,a	%xcc,	loop_2863
loop_2862:
	sdiv	%i6,	0x04AA,	%g5
	fcmped	%fcc1,	%f20,	%f24
	andcc	%g7,	%l5,	%l0
loop_2863:
	tsubcctv	%i1,	0x0EBD,	%l2
	udivcc	%i4,	0x0AF2,	%o6
	srl	%g1,	%o0,	%g6
	fmul8ulx16	%f20,	%f4,	%f8
	movvc	%xcc,	%i7,	%o5
	movrgz	%g3,	%l1,	%i3
	movge	%icc,	%i5,	%o7
	ba,a	loop_2864
	smul	%l6,	%o2,	%l4
	sra	%o1,	0x11,	%l3
	std	%i2,	[%l7 + 0x48]
loop_2864:
	fcmpgt16	%f26,	%f4,	%i0
	addcc	%o4,	0x1DBE,	%o3
	bvc,a	loop_2865
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdvs	%icc,	%f9,	%f19
	tvs	%xcc,	0x7
loop_2865:
	alignaddr	%g2,	%i6,	%g4
	fnands	%f29,	%f14,	%f8
	fmovde	%icc,	%f23,	%f7
	fmovdge	%xcc,	%f0,	%f14
	wr	%g0,	0x19,	%asi
	ldswa	[%l7 + 0x60] %asi,	%g7
	brgz,a	%l5,	loop_2866
	nop
	setx	loop_2867,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	orcc	%l0,	%g5,	%l2
	andn	%i4,	%i1,	%g1
loop_2866:
	fornot2s	%f15,	%f8,	%f5
loop_2867:
	and	%o0,	%o6,	%i7
	tsubcctv	%o5,	0x0070,	%g6
	set	0x09, %g2
	ldsba	[%l7 + %g2] 0x15,	%g3
	sllx	%l1,	%i5,	%i3
	movn	%icc,	%o7,	%l6
	std	%o2,	[%l7 + 0x58]
	smulcc	%o1,	%l4,	%i2
	srax	%l3,	%i0,	%o4
	movg	%xcc,	%o3,	%i6
	movleu	%icc,	%g4,	%g2
	tle	%xcc,	0x1
	srax	%l5,	0x14,	%l0
	fbue,a	%fcc2,	loop_2868
	move	%xcc,	%g5,	%l2
	sra	%g7,	0x14,	%i1
	bcs	loop_2869
loop_2868:
	mova	%xcc,	%g1,	%o0
	brgz	%o6,	loop_2870
	fbule	%fcc0,	loop_2871
loop_2869:
	edge16n	%i4,	%i7,	%g6
	fpackfix	%f8,	%f31
loop_2870:
	fmovdgu	%xcc,	%f17,	%f20
loop_2871:
	movg	%icc,	%g3,	%o5
	array8	%l1,	%i3,	%i5
	addccc	%l6,	0x014D,	%o2
	fpsub16s	%f4,	%f17,	%f9
	fsrc2s	%f28,	%f22
	movl	%icc,	%o7,	%l4
	ldx	[%l7 + 0x10],	%o1
	edge32ln	%l3,	%i2,	%i0
	faligndata	%f20,	%f12,	%f30
	sethi	0x1FE2,	%o3
	addcc	%o4,	%g4,	%g2
	tn	%icc,	0x1
	movl	%icc,	%l5,	%l0
	alignaddr	%g5,	%l2,	%i6
	addccc	%i1,	0x06AA,	%g7
	tvs	%icc,	0x2
	andncc	%g1,	%o6,	%o0
	fmovs	%f14,	%f29
	edge32n	%i4,	%g6,	%g3
	fmovrde	%o5,	%f14,	%f18
	tle	%xcc,	0x6
	brgez,a	%l1,	loop_2872
	bl,a,pt	%icc,	loop_2873
	movrlz	%i3,	0x2EC,	%i5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2872:
	edge8	%i7,	%l6,	%o7
loop_2873:
	edge8	%o2,	%o1,	%l4
	fabss	%f4,	%f23
	tgu	%icc,	0x0
	stb	%i2,	[%l7 + 0x56]
	pdist	%f8,	%f2,	%f12
	edge16ln	%l3,	%o3,	%o4
	sub	%i0,	0x0600,	%g4
	edge16n	%l5,	%l0,	%g5
	wr	%g0,	0x89,	%asi
	prefetcha	[%l7 + 0x40] %asi,	 0x2
	xnor	%i6,	0x1452,	%g2
	tvs	%icc,	0x6
	fmovdcc	%xcc,	%f24,	%f10
	edge16l	%g7,	%i1,	%o6
	fpsub16s	%f1,	%f2,	%f24
	wr	%g0,	0x19,	%asi
	lda	[%l7 + 0x70] %asi,	%f16
	faligndata	%f20,	%f16,	%f18
	fxor	%f10,	%f28,	%f6
	fbg,a	%fcc1,	loop_2874
	xnorcc	%g1,	%o0,	%i4
	umulcc	%g3,	%g6,	%o5
	fbe	%fcc0,	loop_2875
loop_2874:
	fmovdle	%icc,	%f30,	%f30
	sdiv	%i3,	0x04E4,	%i5
	edge32l	%i7,	%l6,	%o7
loop_2875:
	fmovsvs	%xcc,	%f24,	%f19
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movcs	%icc,	%l1,	%o2
	xnor	%l4,	%o1,	%i2
	fmul8x16	%f12,	%f2,	%f18
	tpos	%xcc,	0x2
	umul	%l3,	0x1758,	%o4
	nop
	set	0x08, %g1
	stx	%o3,	[%l7 + %g1]
	andcc	%i0,	%l5,	%g4
	set	0x78, %i4
	stda	%l0,	[%l7 + %i4] 0x2b
	membar	#Sync
	edge8	%g5,	%l2,	%g2
	subccc	%g7,	0x15D9,	%i6
	movvc	%icc,	%i1,	%g1
	wr	%g0,	0x23,	%asi
	stha	%o0,	[%l7 + 0x5C] %asi
	membar	#Sync
	movg	%icc,	%o6,	%i4
	brgz	%g3,	loop_2876
	sth	%o5,	[%l7 + 0x54]
	udiv	%g6,	0x1D67,	%i3
	bcs,pn	%icc,	loop_2877
loop_2876:
	movvs	%xcc,	%i5,	%i7
	subc	%l6,	%l1,	%o2
	movcs	%icc,	%l4,	%o1
loop_2877:
	srax	%i2,	%l3,	%o4
	fones	%f17
	fbue	%fcc0,	loop_2878
	array16	%o7,	%i0,	%l5
	nop
	setx loop_2879, %l0, %l1
	jmpl %l1, %o3
	tvc	%icc,	0x2
loop_2878:
	fmovda	%icc,	%f23,	%f4
	movg	%xcc,	%g4,	%l0
loop_2879:
	edge8	%g5,	%g2,	%g7
	sra	%l2,	0x06,	%i6
	movcc	%xcc,	%g1,	%i1
	fbu,a	%fcc0,	loop_2880
	and	%o6,	%i4,	%o0
	smulcc	%o5,	0x045D,	%g6
	fnot1	%f26,	%f20
loop_2880:
	alignaddr	%g3,	%i3,	%i5
	fmovrsne	%i7,	%f6,	%f19
	srlx	%l6,	%o2,	%l4
	bcc,pt	%xcc,	loop_2881
	sdivcc	%o1,	0x0BA8,	%l1
	fmul8sux16	%f0,	%f26,	%f10
	ba,a,pn	%xcc,	loop_2882
loop_2881:
	fmovsa	%icc,	%f15,	%f15
	array16	%i2,	%l3,	%o7
	tcs	%xcc,	0x2
loop_2882:
	lduw	[%l7 + 0x70],	%i0
	fmovdl	%icc,	%f21,	%f1
	xorcc	%o4,	%o3,	%g4
	subccc	%l5,	%l0,	%g5
	fmovsneg	%xcc,	%f25,	%f8
	ldsw	[%l7 + 0x34],	%g7
	srlx	%g2,	0x1A,	%i6
	tvc	%icc,	0x0
	sdivx	%g1,	0x12FD,	%i1
	stx	%o6,	[%l7 + 0x38]
	sll	%i4,	%o0,	%l2
	fmovdle	%xcc,	%f19,	%f1
	subccc	%o5,	%g6,	%g3
	edge32l	%i5,	%i7,	%i3
	fpsub32	%f18,	%f24,	%f22
	tleu	%xcc,	0x3
	edge8ln	%l6,	%l4,	%o1
	nop
	set	0x48, %o5
	ldd	[%l7 + %o5],	%f10
	ba,a	%icc,	loop_2883
	smul	%l1,	0x079D,	%o2
	bl,a,pn	%xcc,	loop_2884
	fmovsvc	%icc,	%f26,	%f6
loop_2883:
	popc	0x0C27,	%i2
	bl,a,pt	%icc,	loop_2885
loop_2884:
	tvs	%xcc,	0x4
	ldstub	[%l7 + 0x26],	%l3
	fpmerge	%f5,	%f30,	%f20
loop_2885:
	tn	%icc,	0x2
	subccc	%i0,	0x0F73,	%o4
	add	%o7,	0x013A,	%o3
	orncc	%g4,	0x0D30,	%l0
	tl	%icc,	0x7
	tn	%icc,	0x3
	bvs,a,pn	%xcc,	loop_2886
	fble	%fcc3,	loop_2887
	movgu	%xcc,	%g5,	%l5
	orcc	%g2,	%i6,	%g1
loop_2886:
	movrgz	%g7,	0x1BB,	%i1
loop_2887:
	fors	%f23,	%f0,	%f11
	edge16ln	%o6,	%i4,	%l2
	tne	%icc,	0x0
	add	%l7,	0x18,	%l6
	wr	%g0,	0x10,	%asi
	casa	[%l6] 0x10,	%o5,	%g6
	brz,a	%o0,	loop_2888
	movrlez	%i5,	0x3DD,	%i7
	bvc,pt	%xcc,	loop_2889
	array32	%i3,	%l6,	%g3
loop_2888:
	fbl,a	%fcc0,	loop_2890
	fmovsleu	%icc,	%f18,	%f29
loop_2889:
	be	loop_2891
	brgez	%l4,	loop_2892
loop_2890:
	fzero	%f14
	fpmerge	%f17,	%f17,	%f22
loop_2891:
	ldd	[%l7 + 0x28],	%o0
loop_2892:
	fbl,a	%fcc0,	loop_2893
	fcmple32	%f10,	%f2,	%o2
	fbge	%fcc0,	loop_2894
	nop
	set	0x32, %l0
	sth	%i2,	[%l7 + %l0]
loop_2893:
	addccc	%l1,	0x0264,	%i0
	swap	[%l7 + 0x20],	%l3
loop_2894:
	smulcc	%o7,	%o3,	%g4
	tneg	%xcc,	0x2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movg	%xcc,	%o4,	%g5
	fandnot1s	%f17,	%f9,	%f14
	bn,a	%xcc,	loop_2895
	movrlez	%l5,	0x19D,	%g2
	movg	%xcc,	%i6,	%g1
	brz	%g7,	loop_2896
loop_2895:
	addccc	%i1,	%o6,	%l0
	edge16l	%l2,	%i4,	%g6
	edge32	%o0,	%o5,	%i5
loop_2896:
	brlez	%i7,	loop_2897
	fxnor	%f0,	%f6,	%f2
	tcc	%icc,	0x7
	or	%i3,	%l6,	%g3
loop_2897:
	tsubcctv	%l4,	0x1E2F,	%o2
	edge8n	%i2,	%l1,	%o1
	xnor	%i0,	%o7,	%l3
	fmovdneg	%icc,	%f4,	%f26
	smul	%o3,	%g4,	%o4
	fmovdne	%icc,	%f11,	%f27
	fmovsvs	%xcc,	%f17,	%f28
	ldd	[%l7 + 0x48],	%g4
	fpsub32s	%f19,	%f7,	%f9
	nop
	setx	loop_2898,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	nop
	setx	loop_2899,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movge	%xcc,	%l5,	%g2
	tvc	%xcc,	0x6
loop_2898:
	edge32n	%g1,	%g7,	%i1
loop_2899:
	brnz	%o6,	loop_2900
	fnot1	%f22,	%f16
	prefetch	[%l7 + 0x68],	 0x1
	srl	%i6,	0x14,	%l2
loop_2900:
	smul	%l0,	%i4,	%o0
	tneg	%xcc,	0x6
	udiv	%o5,	0x115A,	%i5
	tvs	%icc,	0x7
	bge,pn	%xcc,	loop_2901
	fmovrdne	%g6,	%f10,	%f30
	set	0x10, %l4
	ldxa	[%l7 + %l4] 0x0c,	%i3
loop_2901:
	stx	%l6,	[%l7 + 0x50]
	fbne,a	%fcc2,	loop_2902
	fones	%f13
	fmovsge	%xcc,	%f29,	%f25
	fpackfix	%f6,	%f2
loop_2902:
	fmovdg	%xcc,	%f4,	%f13
	ldd	[%l7 + 0x40],	%i6
	fbe,a	%fcc3,	loop_2903
	te	%icc,	0x1
	array8	%l4,	%g3,	%o2
	fsrc1	%f16,	%f12
loop_2903:
	nop
	set	0x40, %o4
	stda	%f0,	[%l7 + %o4] 0x19
	fmovrsgz	%i2,	%f6,	%f30
	for	%f22,	%f22,	%f22
	bpos,pt	%xcc,	loop_2904
	tle	%icc,	0x0
	fmovdge	%icc,	%f11,	%f1
	move	%xcc,	%o1,	%i0
loop_2904:
	alignaddr	%l1,	%o7,	%o3
	fnand	%f30,	%f4,	%f22
	set	0x50, %g3
	stha	%l3,	[%l7 + %g3] 0x11
	edge16ln	%g4,	%o4,	%g5
	orncc	%l5,	0x0C3E,	%g2
	alignaddrl	%g7,	%i1,	%o6
	fmovsleu	%xcc,	%f17,	%f30
	taddcc	%i6,	%g1,	%l2
	edge32ln	%l0,	%o0,	%o5
	tge	%xcc,	0x6
	tvc	%icc,	0x7
	sub	%i4,	%g6,	%i5
	sra	%i3,	%l6,	%l4
	bgu,a,pn	%icc,	loop_2905
	movvc	%icc,	%g3,	%i7
	lduw	[%l7 + 0x78],	%o2
	xor	%i2,	0x13F4,	%i0
loop_2905:
	addc	%l1,	%o1,	%o7
	fbne,a	%fcc0,	loop_2906
	brgez,a	%l3,	loop_2907
	fands	%f3,	%f8,	%f18
	fandnot2s	%f5,	%f15,	%f8
loop_2906:
	fabsd	%f6,	%f12
loop_2907:
	smulcc	%o3,	%g4,	%o4
	fzeros	%f8
	fmovdcs	%xcc,	%f21,	%f19
	tge	%xcc,	0x4
	tleu	%icc,	0x7
	fbge	%fcc0,	loop_2908
	movne	%icc,	%l5,	%g5
	edge16l	%g2,	%g7,	%i1
	ldsb	[%l7 + 0x5B],	%i6
loop_2908:
	smulcc	%g1,	%l2,	%l0
	or	%o0,	0x1CD2,	%o6
	addccc	%o5,	%g6,	%i4
	stw	%i5,	[%l7 + 0x50]
	sdiv	%l6,	0x07B0,	%l4
	te	%icc,	0x3
	tle	%xcc,	0x3
	andn	%g3,	%i7,	%o2
	addcc	%i3,	%i0,	%i2
	bcc,pt	%xcc,	loop_2909
	movrgz	%o1,	0x266,	%l1
	movge	%xcc,	%l3,	%o7
	fbe,a	%fcc2,	loop_2910
loop_2909:
	addccc	%g4,	%o3,	%l5
	std	%g4,	[%l7 + 0x18]
	fba	%fcc1,	loop_2911
loop_2910:
	swap	[%l7 + 0x1C],	%o4
	movrgez	%g2,	0x2D7,	%g7
	sdivx	%i1,	0x02E4,	%i6
loop_2911:
	bcc,pn	%icc,	loop_2912
	fandnot1	%f6,	%f24,	%f10
	taddcc	%l2,	%l0,	%o0
	movneg	%xcc,	%o6,	%g1
loop_2912:
	umulcc	%g6,	0x1AD9,	%i4
	wr	%g0,	0x19,	%asi
	stba	%o5,	[%l7 + 0x3E] %asi
	sethi	0x1254,	%i5
	wr	%g0,	0x89,	%asi
	ldsba	[%l7 + 0x77] %asi,	%l6
	andcc	%g3,	0x154C,	%i7
	fblg,a	%fcc2,	loop_2913
	array16	%l4,	%o2,	%i3
	fand	%f22,	%f12,	%f0
	sdiv	%i2,	0x1A81,	%i0
loop_2913:
	bcs	%xcc,	loop_2914
	addc	%l1,	0x0917,	%o1
	tvs	%xcc,	0x5
	mova	%xcc,	%o7,	%g4
loop_2914:
	tle	%xcc,	0x7
	movn	%icc,	%o3,	%l3
	andcc	%g5,	0x1DBE,	%o4
	alignaddrl	%g2,	%l5,	%i1
	tg	%xcc,	0x5
	xnorcc	%i6,	%l2,	%l0
	subccc	%g7,	0x0E9F,	%o0
	std	%g0,	[%l7 + 0x48]
	andn	%g6,	0x1724,	%o6
	wr	%g0,	0x11,	%asi
	lduwa	[%l7 + 0x10] %asi,	%o5
	tvc	%xcc,	0x4
	fmovsvc	%xcc,	%f5,	%f2
	tneg	%icc,	0x1
	bvs	%icc,	loop_2915
	movne	%icc,	%i4,	%l6
	fsrc2	%f8,	%f12
	wr	%g0,	0x04,	%asi
	ldda	[%l7 + 0x40] %asi,	%i4
loop_2915:
	udivx	%g3,	0x062A,	%l4
	srl	%i7,	%i3,	%o2
	nop
	set	0x68, %i0
	stw	%i0,	[%l7 + %i0]
	movrgz	%l1,	%o1,	%o7
	bvc,a,pt	%icc,	loop_2916
	array8	%i2,	%g4,	%l3
	fmovspos	%icc,	%f13,	%f31
	fones	%f11
loop_2916:
	fcmple16	%f26,	%f18,	%g5
	mulx	%o4,	%g2,	%o3
	fzero	%f22
	xorcc	%l5,	0x05C0,	%i1
	srl	%i6,	0x00,	%l0
	wr	%g0,	0x88,	%asi
	lduba	[%l7 + 0x75] %asi,	%g7
	movvc	%xcc,	%l2,	%o0
	sdivcc	%g6,	0x0BC7,	%g1
	bvs,pt	%icc,	loop_2917
	fands	%f8,	%f26,	%f10
	movcs	%icc,	%o6,	%o5
	movgu	%icc,	%l6,	%i4
loop_2917:
	edge16n	%i5,	%g3,	%i7
	mulscc	%l4,	0x03D8,	%o2
	movrlz	%i3,	%i0,	%o1
	taddcc	%l1,	%o7,	%i2
	udiv	%g4,	0x0AF2,	%l3
	fcmpd	%fcc0,	%f4,	%f30
	fnegs	%f16,	%f14
	array32	%o4,	%g2,	%o3
	nop
	setx	loop_2918,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	flush	%l7 + 0x24
	fpsub32s	%f22,	%f26,	%f22
	lduw	[%l7 + 0x40],	%l5
loop_2918:
	orncc	%g5,	%i6,	%l0
	tsubcc	%i1,	0x107F,	%l2
	ldx	[%l7 + 0x68],	%g7
	array8	%o0,	%g1,	%o6
	edge16ln	%o5,	%g6,	%l6
	fxors	%f11,	%f22,	%f17
	stw	%i4,	[%l7 + 0x28]
	fcmple32	%f14,	%f14,	%g3
	xorcc	%i5,	%l4,	%i7
	fbg,a	%fcc2,	loop_2919
	fmovdn	%icc,	%f23,	%f10
	nop
	set	0x5D, %o7
	ldstub	[%l7 + %o7],	%o2
	edge32n	%i0,	%i3,	%l1
loop_2919:
	faligndata	%f0,	%f2,	%f24
	siam	0x5
	movrgez	%o7,	%o1,	%i2
	smul	%l3,	%o4,	%g4
	add	%g2,	0x0884,	%l5
	mulscc	%g5,	%i6,	%l0
	tle	%icc,	0x2
	swap	[%l7 + 0x74],	%i1
	bne,pt	%icc,	loop_2920
	ble,pn	%xcc,	loop_2921
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xor	%l2,	%o3,	%g7
loop_2920:
	stb	%g1,	[%l7 + 0x77]
loop_2921:
	taddcctv	%o6,	%o0,	%o5
	set	0x18, %o3
	stwa	%l6,	[%l7 + %o3] 0x22
	membar	#Sync
	alignaddrl	%g6,	%i4,	%i5
	addccc	%g3,	%l4,	%o2
	movne	%xcc,	%i0,	%i7
	lduw	[%l7 + 0x64],	%i3
	addc	%o7,	%o1,	%i2
	tg	%xcc,	0x3
	addc	%l1,	0x0F5B,	%l3
	xnor	%o4,	%g2,	%g4
	movne	%xcc,	%l5,	%g5
	array32	%i6,	%l0,	%i1
	fpsub16	%f22,	%f4,	%f22
	tvs	%icc,	0x2
	fmovdpos	%xcc,	%f10,	%f9
	edge16l	%o3,	%g7,	%g1
	movcc	%xcc,	%l2,	%o0
	stbar
	fxors	%f27,	%f7,	%f31
	tvc	%xcc,	0x4
	tleu	%icc,	0x4
	fbn	%fcc3,	loop_2922
	membar	0x39
	taddcc	%o6,	0x0992,	%o5
	membar	0x5D
loop_2922:
	orcc	%g6,	0x165B,	%l6
	tsubcc	%i5,	0x0C52,	%g3
	fmovsvc	%icc,	%f30,	%f9
	fbo,a	%fcc3,	loop_2923
	movg	%icc,	%i4,	%o2
	smul	%i0,	0x1FC4,	%l4
	stb	%i3,	[%l7 + 0x5E]
loop_2923:
	nop
	set	0x68, %i3
	ldsha	[%l7 + %i3] 0x15,	%o7
	set	0x34, %g4
	lda	[%l7 + %g4] 0x89,	%f11
	fsrc1s	%f10,	%f2
	movl	%xcc,	%i7,	%i2
	fbug	%fcc1,	loop_2924
	prefetch	[%l7 + 0x20],	 0x1
	or	%l1,	0x1F18,	%o1
	fmovsvc	%xcc,	%f16,	%f6
loop_2924:
	tgu	%icc,	0x2
	fornot1s	%f20,	%f30,	%f26
	mova	%icc,	%l3,	%g2
	smul	%o4,	0x03FB,	%g4
	orncc	%l5,	0x028F,	%g5
	fmovde	%xcc,	%f2,	%f5
	wr	%g0,	0x52,	%asi
	ldxa	[%g0 + 0x110] %asi,	%i6
	tne	%icc,	0x1
	edge16	%i1,	%l0,	%o3
	array8	%g7,	%g1,	%l2
	fbug,a	%fcc2,	loop_2925
	alignaddr	%o6,	%o0,	%g6
	edge8n	%l6,	%i5,	%o5
	fcmpne16	%f26,	%f10,	%g3
loop_2925:
	nop
	set	0x1C, %o1
	lduw	[%l7 + %o1],	%o2
	umulcc	%i4,	%i0,	%i3
	movrlz	%o7,	0x19E,	%i7
	nop
	setx	loop_2926,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fpadd32	%f14,	%f0,	%f14
	lduh	[%l7 + 0x0C],	%i2
	movrgz	%l1,	%o1,	%l4
loop_2926:
	xnorcc	%g2,	0x1A07,	%o4
	movne	%xcc,	%l3,	%l5
	brgez	%g4,	loop_2927
	tne	%xcc,	0x5
	tge	%xcc,	0x4
	subccc	%i6,	%i1,	%g5
loop_2927:
	fnors	%f16,	%f0,	%f4
	fmul8ulx16	%f30,	%f26,	%f8
	mova	%xcc,	%l0,	%o3
	bpos,a,pn	%xcc,	loop_2928
	bl,a	loop_2929
	ldstub	[%l7 + 0x26],	%g1
	movn	%icc,	%g7,	%o6
loop_2928:
	fmul8ulx16	%f18,	%f20,	%f28
loop_2929:
	fnor	%f22,	%f4,	%f10
	alignaddr	%o0,	%l2,	%l6
	popc	%g6,	%o5
	set	0x54, %g5
	stwa	%i5,	[%l7 + %g5] 0x27
	membar	#Sync
	andncc	%g3,	%i4,	%i0
	ldsb	[%l7 + 0x4C],	%i3
	stx	%o2,	[%l7 + 0x40]
	tl	%xcc,	0x5
	udivcc	%o7,	0x1F68,	%i7
	sllx	%l1,	0x15,	%i2
	set	0x34, %g6
	lduwa	[%l7 + %g6] 0x10,	%o1
	edge16l	%g2,	%o4,	%l3
	wr	%g0,	0x81,	%asi
	swapa	[%l7 + 0x3C] %asi,	%l5
	set	0x30, %i7
	ldsha	[%l7 + %i7] 0x10,	%g4
	fcmpeq32	%f14,	%f16,	%l4
	movre	%i6,	0x3C3,	%i1
	movcs	%xcc,	%l0,	%g5
	tcs	%xcc,	0x6
	fsrc2s	%f13,	%f19
	subccc	%o3,	%g7,	%o6
	wr	%g0,	0x10,	%asi
	stha	%g1,	[%l7 + 0x7A] %asi
	fors	%f16,	%f20,	%f17
	tn	%xcc,	0x5
	fandnot1	%f14,	%f18,	%f10
	movrgez	%o0,	%l2,	%g6
	mulx	%o5,	%l6,	%i5
	fnegd	%f2,	%f30
	sdivcc	%i4,	0x0D18,	%g3
	movvc	%xcc,	%i3,	%o2
	tneg	%xcc,	0x0
	ldd	[%l7 + 0x70],	%f2
	sethi	0x0895,	%i0
	movn	%icc,	%i7,	%o7
	fnors	%f26,	%f4,	%f2
	fpmerge	%f14,	%f24,	%f20
	tcs	%icc,	0x2
	ldsb	[%l7 + 0x4C],	%i2
	tle	%xcc,	0x6
	subc	%l1,	0x0741,	%o1
	bcc,a	loop_2930
	nop
	setx	loop_2931,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fbu	%fcc2,	loop_2932
	sub	%o4,	%l3,	%g2
loop_2930:
	fbo,a	%fcc1,	loop_2933
loop_2931:
	fba	%fcc3,	loop_2934
loop_2932:
	lduw	[%l7 + 0x0C],	%l5
	fmovdneg	%xcc,	%f8,	%f27
loop_2933:
	subccc	%l4,	%g4,	%i1
loop_2934:
	nop
	set	0x08, %o2
	lduba	[%l7 + %o2] 0x14,	%l0
	movgu	%xcc,	%g5,	%i6
	orncc	%g7,	0x1DF9,	%o6
	tvc	%xcc,	0x7
	fxors	%f4,	%f22,	%f28
	tgu	%xcc,	0x3
	edge32ln	%o3,	%o0,	%g1
	andcc	%g6,	0x03F5,	%o5
	move	%icc,	%l6,	%i5
	edge32	%l2,	%i4,	%i3
	subccc	%o2,	%g3,	%i7
	ble,pt	%icc,	loop_2935
	movl	%xcc,	%i0,	%o7
	tpos	%icc,	0x0
	movrne	%l1,	%o1,	%i2
loop_2935:
	ta	%icc,	0x3
	array16	%o4,	%g2,	%l3
	edge8l	%l4,	%g4,	%i1
	and	%l5,	0x102E,	%g5
	tsubcctv	%l0,	%i6,	%g7
	tge	%xcc,	0x5
	movl	%icc,	%o3,	%o0
	tsubcctv	%o6,	0x0DA2,	%g6
	fpadd16s	%f2,	%f19,	%f21
	movg	%icc,	%o5,	%g1
	subccc	%i5,	0x0E1C,	%l6
	tpos	%icc,	0x4
	umulcc	%l2,	%i4,	%o2
	set	0x2F, %g7
	ldsba	[%l7 + %g7] 0x11,	%i3
	set	0x08, %i1
	ldsha	[%l7 + %i1] 0x18,	%i7
	wr	%g0,	0x80,	%asi
	stxa	%i0,	[%l7 + 0x48] %asi
	edge16	%o7,	%l1,	%g3
	subccc	%o1,	%i2,	%g2
	edge8n	%o4,	%l3,	%l4
	wr	%g0,	0x89,	%asi
	sta	%f16,	[%l7 + 0x5C] %asi
	edge16	%g4,	%i1,	%g5
	fblg	%fcc3,	loop_2936
	alignaddrl	%l5,	%i6,	%g7
	movgu	%icc,	%l0,	%o3
	tn	%xcc,	0x4
loop_2936:
	fmul8ulx16	%f22,	%f0,	%f24
	movleu	%xcc,	%o0,	%o6
	bvs,a	loop_2937
	movpos	%xcc,	%o5,	%g1
	stb	%i5,	[%l7 + 0x27]
	fsrc1s	%f12,	%f20
loop_2937:
	udivx	%l6,	0x073E,	%l2
	addcc	%g6,	0x0D95,	%o2
	xnorcc	%i3,	%i7,	%i0
	mova	%icc,	%i4,	%l1
	udivx	%g3,	0x0E1A,	%o7
	fmovdgu	%xcc,	%f15,	%f18
	or	%i2,	%o1,	%g2
	membar	0x27
	membar	0x09
	fmovrsgez	%o4,	%f7,	%f2
	fzero	%f14
	smulcc	%l3,	0x110D,	%g4
	stb	%l4,	[%l7 + 0x12]
	fbule	%fcc0,	loop_2938
	xorcc	%i1,	0x0DBA,	%l5
	ldsh	[%l7 + 0x20],	%i6
	pdist	%f10,	%f16,	%f10
loop_2938:
	nop
	set	0x36, %o6
	stba	%g5,	[%l7 + %o6] 0x22
	membar	#Sync
	fmovsvc	%xcc,	%f31,	%f1
	ble	%xcc,	loop_2939
	movge	%xcc,	%g7,	%o3
	edge8ln	%l0,	%o6,	%o5
	subcc	%g1,	0x1175,	%i5
loop_2939:
	tge	%icc,	0x5
	nop
	set	0x42, %l2
	ldsh	[%l7 + %l2],	%o0
	std	%i6,	[%l7 + 0x08]
	movvs	%xcc,	%l2,	%o2
	movleu	%icc,	%i3,	%i7
	fmovsle	%xcc,	%f16,	%f20
	tcc	%xcc,	0x2
	tneg	%xcc,	0x4
	movre	%g6,	%i0,	%l1
	flush	%l7 + 0x58
	tne	%icc,	0x2
	te	%icc,	0x7
	fbule,a	%fcc0,	loop_2940
	movl	%xcc,	%i4,	%o7
	orn	%g3,	%i2,	%g2
	mulscc	%o1,	0x003B,	%l3
loop_2940:
	addcc	%o4,	%g4,	%i1
	array8	%l4,	%i6,	%g5
	xnor	%g7,	0x0797,	%o3
	fbe,a	%fcc2,	loop_2941
	for	%f0,	%f16,	%f16
	mulx	%l0,	%l5,	%o6
	movvc	%icc,	%g1,	%o5
loop_2941:
	movre	%o0,	%l6,	%l2
	bleu,a	%xcc,	loop_2942
	orcc	%i5,	%o2,	%i3
	taddcc	%i7,	%g6,	%i0
	sdiv	%l1,	0x1743,	%i4
loop_2942:
	fnand	%f20,	%f16,	%f24
	edge16	%o7,	%i2,	%g3
	call	loop_2943
	umulcc	%o1,	0x1BC0,	%g2
	edge8n	%l3,	%o4,	%g4
	tne	%icc,	0x5
loop_2943:
	fbn,a	%fcc3,	loop_2944
	movpos	%xcc,	%l4,	%i1
	tg	%icc,	0x5
	movrgez	%i6,	0x1C3,	%g7
loop_2944:
	umul	%o3,	%g5,	%l0
	taddcc	%o6,	0x164F,	%g1
	fcmpeq16	%f12,	%f0,	%l5
	srax	%o0,	0x0E,	%l6
	edge32	%o5,	%i5,	%l2
	brnz	%o2,	loop_2945
	sdiv	%i7,	0x1D7A,	%i3
	bleu,a	%xcc,	loop_2946
	mulscc	%i0,	%g6,	%l1
loop_2945:
	array8	%i4,	%i2,	%o7
	tleu	%xcc,	0x3
loop_2946:
	movge	%icc,	%g3,	%o1
	andncc	%g2,	%o4,	%g4
	fpmerge	%f26,	%f13,	%f8
	sra	%l3,	%l4,	%i1
	fmuld8sux16	%f22,	%f11,	%f2
	tg	%icc,	0x4
	movl	%xcc,	%i6,	%g7
	fmovrslz	%g5,	%f7,	%f9
	ldsw	[%l7 + 0x28],	%l0
	sub	%o3,	0x0897,	%g1
	bcs,pt	%icc,	loop_2947
	bge,a,pn	%icc,	loop_2948
	fone	%f24
	movrgez	%l5,	%o6,	%o0
loop_2947:
	fmovrdlez	%o5,	%f18,	%f2
loop_2948:
	addcc	%l6,	%i5,	%l2
	addc	%o2,	%i3,	%i0
	fcmpeq32	%f8,	%f20,	%i7
	movneg	%xcc,	%l1,	%i4
	fandnot1	%f20,	%f18,	%f10
	smul	%i2,	%o7,	%g3
	tsubcctv	%g6,	0x0D98,	%o1
	alignaddrl	%g2,	%o4,	%g4
	edge32l	%l3,	%l4,	%i1
	fbuge	%fcc0,	loop_2949
	fbu	%fcc1,	loop_2950
	fmovrdlez	%g7,	%f28,	%f0
	ldsh	[%l7 + 0x08],	%g5
loop_2949:
	andncc	%i6,	%l0,	%g1
loop_2950:
	tcs	%xcc,	0x0
	movne	%xcc,	%l5,	%o6
	mova	%xcc,	%o3,	%o0
	sir	0x019B
	fmovd	%f10,	%f12
	fbug,a	%fcc0,	loop_2951
	movneg	%xcc,	%l6,	%o5
	fcmple16	%f6,	%f12,	%i5
	sll	%l2,	0x16,	%o2
loop_2951:
	nop
	set	0x5C, %l6
	lda	[%l7 + %l6] 0x88,	%f4
	fmovscs	%xcc,	%f2,	%f21
	fbug	%fcc0,	loop_2952
	fnot2s	%f30,	%f18
	smulcc	%i0,	0x06BC,	%i3
	movneg	%xcc,	%l1,	%i4
loop_2952:
	edge16ln	%i2,	%i7,	%g3
	fornot2s	%f18,	%f28,	%f12
	set	0x14, %i2
	lduwa	[%l7 + %i2] 0x89,	%g6
	fmovrdlz	%o1,	%f8,	%f14
	fmovsvc	%xcc,	%f25,	%f8
	set	0x28, %i6
	prefetcha	[%l7 + %i6] 0x10,	 0x3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	lduw	[%l7 + 0x2C],	%o4
	movvc	%icc,	%g2,	%l3
	fsrc1	%f2,	%f2
	ldsb	[%l7 + 0x35],	%g4
	alignaddr	%l4,	%g7,	%g5
	srl	%i1,	%i6,	%g1
	fmovdcs	%icc,	%f3,	%f31
	subccc	%l0,	%o6,	%o3
	prefetch	[%l7 + 0x14],	 0x1
	fnand	%f22,	%f26,	%f8
	taddcctv	%l5,	%l6,	%o5
	pdist	%f30,	%f26,	%f26
	fcmpgt32	%f26,	%f26,	%i5
	fmovrse	%o0,	%f30,	%f20
	xnor	%o2,	%i0,	%i3
	fpackfix	%f14,	%f7
	movg	%xcc,	%l1,	%i4
	tn	%icc,	0x1
	fmovsgu	%xcc,	%f31,	%f0
	orn	%l2,	0x0975,	%i7
	set	0x40, %l3
	ldda	[%l7 + %l3] 0x0c,	%f0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnor	%i2,	0x159A,	%g3
	sdivcc	%o1,	0x0569,	%g6
	taddcc	%o4,	0x01E6,	%o7
	for	%f20,	%f6,	%f4
	fmovd	%f2,	%f8
	tneg	%icc,	0x6
	fmovdl	%icc,	%f16,	%f29
	array32	%l3,	%g2,	%g4
	fxnor	%f10,	%f4,	%f28
	mova	%xcc,	%l4,	%g5
	sll	%i1,	0x19,	%g7
	tleu	%icc,	0x3
	movne	%icc,	%g1,	%l0
	fmovsleu	%xcc,	%f31,	%f28
	tl	%xcc,	0x3
	std	%f0,	[%l7 + 0x48]
	movneg	%xcc,	%o6,	%i6
	fmovsg	%icc,	%f31,	%f29
	tgu	%icc,	0x5
	sll	%o3,	0x1B,	%l5
	sra	%l6,	0x1A,	%i5
	fsrc2	%f18,	%f18
	fbue,a	%fcc3,	loop_2953
	fcmpeq32	%f20,	%f2,	%o0
	sra	%o5,	%o2,	%i3
	movrlz	%l1,	0x1A7,	%i4
loop_2953:
	xorcc	%i0,	%i7,	%i2
	fmovda	%icc,	%f3,	%f16
	tsubcc	%l2,	0x0F55,	%o1
	or	%g3,	0x0162,	%o4
	bneg,pn	%xcc,	loop_2954
	addcc	%o7,	%l3,	%g6
	sdivx	%g2,	0x0F79,	%g4
	movneg	%icc,	%g5,	%l4
loop_2954:
	movvc	%xcc,	%g7,	%i1
	subc	%l0,	%o6,	%g1
	set	0x44, %l1
	stha	%o3,	[%l7 + %l1] 0xe3
	membar	#Sync
	movleu	%icc,	%i6,	%l6
	edge16n	%l5,	%o0,	%i5
	bneg	loop_2955
	edge16ln	%o2,	%o5,	%l1
	umulcc	%i4,	%i3,	%i7
	fmovsa	%icc,	%f19,	%f11
loop_2955:
	addccc	%i0,	0x1FA6,	%i2
	srax	%l2,	0x01,	%o1
	ldx	[%l7 + 0x50],	%g3
	edge32n	%o4,	%l3,	%g6
	andn	%o7,	0x0EA7,	%g4
	fmovdl	%icc,	%f26,	%f17
	fba,a	%fcc2,	loop_2956
	fbug	%fcc2,	loop_2957
	tvc	%icc,	0x6
	set	0x58, %i5
	stxa	%g2,	[%l7 + %i5] 0x0c
loop_2956:
	fcmple16	%f2,	%f0,	%g5
loop_2957:
	fpadd32s	%f12,	%f24,	%f5
	edge8ln	%g7,	%l4,	%i1
	srlx	%l0,	0x00,	%g1
	ldx	[%l7 + 0x68],	%o3
	movrlz	%i6,	0x272,	%o6
	popc	0x0BE2,	%l5
	mulscc	%o0,	0x09E8,	%i5
	fornot2s	%f4,	%f12,	%f27
	and	%o2,	%l6,	%o5
	udiv	%i4,	0x0FFA,	%i3
	sir	0x04E1
	fone	%f24
	sir	0x173C
	mulx	%l1,	0x1EE2,	%i7
	set	0x60, %o0
	ldda	[%l7 + %o0] 0x18,	%i2
	call	loop_2958
	array16	%i0,	%o1,	%l2
	fmovdle	%icc,	%f2,	%f0
	sra	%g3,	0x1E,	%o4
loop_2958:
	nop
	set	0x34, %g2
	stha	%l3,	[%l7 + %g2] 0xea
	membar	#Sync
	srl	%g6,	%o7,	%g4
	edge8	%g2,	%g7,	%l4
	call	loop_2959
	addc	%i1,	%l0,	%g5
	set	0x34, %g1
	ldstuba	[%l7 + %g1] 0x89,	%g1
loop_2959:
	andn	%o3,	0x14E4,	%o6
	andncc	%i6,	%l5,	%o0
	fcmpgt16	%f20,	%f26,	%i5
	udivx	%l6,	0x1F2E,	%o2
	tn	%icc,	0x3
	fornot2s	%f3,	%f6,	%f18
	fbne,a	%fcc3,	loop_2960
	st	%f7,	[%l7 + 0x40]
	andn	%o5,	%i4,	%l1
	movle	%xcc,	%i7,	%i3
loop_2960:
	tgu	%xcc,	0x3
	std	%i0,	[%l7 + 0x28]
	ta	%icc,	0x4
	bleu,pn	%icc,	loop_2961
	fmovdpos	%icc,	%f20,	%f5
	tvs	%xcc,	0x4
	set	0x50, %i4
	ldxa	[%l7 + %i4] 0x0c,	%i2
loop_2961:
	ldsh	[%l7 + 0x52],	%l2
	sdivx	%g3,	0x0843,	%o1
	tcc	%xcc,	0x6
	flush	%l7 + 0x48
	fblg,a	%fcc1,	loop_2962
	mulscc	%o4,	0x120D,	%l3
	movg	%xcc,	%g6,	%o7
	movrlez	%g4,	0x3C3,	%g2
loop_2962:
	lduh	[%l7 + 0x4A],	%l4
	addcc	%i1,	0x0164,	%g7
	fmovrslez	%l0,	%f8,	%f23
	mulscc	%g1,	0x0F20,	%o3
	fbg,a	%fcc0,	loop_2963
	tg	%icc,	0x7
	call	loop_2964
	movvs	%xcc,	%g5,	%i6
loop_2963:
	edge32n	%o6,	%l5,	%o0
	tne	%xcc,	0x4
loop_2964:
	mova	%xcc,	%l6,	%i5
	fmuld8sux16	%f0,	%f27,	%f14
	stbar
	movrne	%o2,	0x361,	%i4
	wr	%g0,	0x88,	%asi
	ldswa	[%l7 + 0x44] %asi,	%o5
	andn	%i7,	0x0164,	%l1
	alignaddrl	%i0,	%i2,	%l2
	edge32	%g3,	%i3,	%o4
	edge8	%l3,	%o1,	%g6
	movvs	%icc,	%o7,	%g2
	tneg	%xcc,	0x7
	ldsh	[%l7 + 0x44],	%g4
	udiv	%l4,	0x0CD3,	%i1
	tsubcc	%l0,	0x12F8,	%g7
	movrgez	%g1,	%g5,	%i6
	fmul8x16	%f14,	%f2,	%f18
	tneg	%xcc,	0x0
	sll	%o3,	0x1E,	%o6
	udivx	%l5,	0x1D8C,	%o0
	tne	%xcc,	0x3
	brnz	%l6,	loop_2965
	tvc	%xcc,	0x1
	movcs	%xcc,	%i5,	%o2
	xnor	%o5,	0x01E3,	%i7
loop_2965:
	tleu	%icc,	0x7
	fsrc2s	%f18,	%f24
	bcc	%icc,	loop_2966
	prefetch	[%l7 + 0x74],	 0x1
	fmovsvs	%icc,	%f25,	%f15
	movge	%icc,	%l1,	%i4
loop_2966:
	sdivcc	%i0,	0x1857,	%i2
	fnegs	%f29,	%f25
	mova	%xcc,	%g3,	%l2
	set	0x38, %o5
	sta	%f4,	[%l7 + %o5] 0x81
	fbule	%fcc1,	loop_2967
	movrne	%o4,	%l3,	%o1
	fbge	%fcc2,	loop_2968
	subccc	%i3,	%o7,	%g2
loop_2967:
	nop
	set	0x10, %l0
	stxa	%g6,	[%g0 + %l0] 0x21
loop_2968:
	movcs	%icc,	%g4,	%l4
	bg,pn	%xcc,	loop_2969
	ble,a	%icc,	loop_2970
	movgu	%xcc,	%i1,	%l0
	ldd	[%l7 + 0x70],	%g6
loop_2969:
	edge16ln	%g1,	%g5,	%i6
loop_2970:
	fcmpgt16	%f26,	%f14,	%o3
	fcmpd	%fcc1,	%f6,	%f4
	movrlez	%l5,	%o0,	%l6
	tne	%xcc,	0x3
	tneg	%icc,	0x1
	xorcc	%i5,	0x005B,	%o2
	stx	%o5,	[%l7 + 0x58]
	edge32l	%i7,	%o6,	%l1
	tgu	%icc,	0x6
	brnz	%i0,	loop_2971
	fble	%fcc0,	loop_2972
	xnor	%i4,	0x08E7,	%g3
	fcmps	%fcc1,	%f10,	%f7
loop_2971:
	tne	%xcc,	0x6
loop_2972:
	fsrc1	%f24,	%f14
	fands	%f24,	%f27,	%f9
	bl,a	loop_2973
	tvs	%xcc,	0x3
	fnand	%f24,	%f18,	%f8
	tpos	%icc,	0x2
loop_2973:
	movvs	%icc,	%l2,	%o4
	fmovdne	%icc,	%f25,	%f4
	xnorcc	%l3,	0x0296,	%i2
	andncc	%o1,	%i3,	%o7
	tvs	%xcc,	0x6
	fcmpeq32	%f26,	%f10,	%g2
	bvc,a	loop_2974
	fabss	%f5,	%f13
	set	0x48, %l5
	stda	%g6,	[%l7 + %l5] 0x04
loop_2974:
	fcmpne16	%f8,	%f12,	%l4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udivx	%g4,	0x127E,	%i1
	subcc	%g7,	0x1D51,	%l0
	xnor	%g5,	%i6,	%g1
	bg,pn	%xcc,	loop_2975
	movle	%icc,	%o3,	%o0
	bcs	loop_2976
	mulx	%l5,	%l6,	%i5
loop_2975:
	nop
	set	0x5C, %l4
	sta	%f20,	[%l7 + %l4] 0x14
loop_2976:
	st	%f8,	[%l7 + 0x48]
	fones	%f0
	udivcc	%o5,	0x0C7D,	%i7
	and	%o6,	%l1,	%i0
	xnorcc	%o2,	0x1157,	%g3
	sdiv	%i4,	0x02DF,	%o4
	edge8ln	%l3,	%i2,	%o1
	movg	%icc,	%i3,	%l2
	alignaddrl	%o7,	%g2,	%l4
	nop
	set	0x31, %o4
	stb	%g6,	[%l7 + %o4]
	fabss	%f19,	%f6
	tn	%xcc,	0x4
	movrgz	%g4,	0x2F4,	%i1
	fnot1	%f28,	%f26
	ta	%xcc,	0x2
	fcmpgt16	%f2,	%f20,	%g7
	nop
	setx	loop_2977,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	umul	%l0,	0x15BD,	%i6
	membar	0x39
	fxnors	%f29,	%f23,	%f29
loop_2977:
	xnorcc	%g1,	0x08BE,	%o3
	bcc,a	%icc,	loop_2978
	edge8l	%o0,	%g5,	%l6
	mova	%icc,	%l5,	%i5
	tvc	%xcc,	0x3
loop_2978:
	fand	%f2,	%f20,	%f10
	tsubcctv	%i7,	%o6,	%l1
	ldstub	[%l7 + 0x0B],	%i0
	movcs	%xcc,	%o2,	%o5
	tn	%xcc,	0x3
	fpadd16s	%f20,	%f1,	%f20
	nop
	setx loop_2979, %l0, %l1
	jmpl %l1, %g3
	srl	%o4,	%i4,	%i2
	fmovdpos	%xcc,	%f18,	%f5
	bgu	%xcc,	loop_2980
loop_2979:
	fmovde	%icc,	%f14,	%f7
	and	%l3,	%o1,	%l2
	sethi	0x1F1B,	%o7
loop_2980:
	subccc	%i3,	0x1BF2,	%l4
	fmuld8ulx16	%f30,	%f30,	%f20
	fzero	%f2
	fbule	%fcc1,	loop_2981
	udivcc	%g2,	0x09E0,	%g4
	stw	%i1,	[%l7 + 0x6C]
	movrgez	%g6,	%g7,	%l0
loop_2981:
	edge8l	%i6,	%g1,	%o0
	movneg	%icc,	%o3,	%g5
	movrlz	%l6,	%l5,	%i5
	edge8ln	%o6,	%i7,	%l1
	fbg,a	%fcc2,	loop_2982
	udivcc	%o2,	0x1F96,	%i0
	fpadd16s	%f2,	%f6,	%f23
	srlx	%g3,	%o4,	%o5
loop_2982:
	fnands	%f7,	%f8,	%f8
	fbl,a	%fcc1,	loop_2983
	movne	%icc,	%i2,	%l3
	edge8ln	%i4,	%l2,	%o7
	subc	%i3,	%l4,	%o1
loop_2983:
	ldsb	[%l7 + 0x64],	%g2
	fbge,a	%fcc2,	loop_2984
	fbug	%fcc3,	loop_2985
	fmovsge	%icc,	%f26,	%f26
	fpadd16	%f0,	%f22,	%f10
loop_2984:
	bleu,a,pt	%icc,	loop_2986
loop_2985:
	mulx	%i1,	%g4,	%g6
	brnz	%g7,	loop_2987
	movl	%icc,	%i6,	%g1
loop_2986:
	movrlz	%l0,	0x17E,	%o3
	movrlz	%o0,	0x3DC,	%g5
loop_2987:
	tneg	%icc,	0x1
	fmovsne	%xcc,	%f30,	%f4
	tleu	%icc,	0x7
	movvs	%icc,	%l5,	%l6
	subccc	%o6,	%i5,	%i7
	edge32n	%l1,	%o2,	%i0
	bvc,a,pn	%icc,	loop_2988
	sdiv	%g3,	0x1E58,	%o4
	std	%i2,	[%l7 + 0x40]
	fnot2	%f26,	%f10
loop_2988:
	fsrc1	%f8,	%f28
	bvc,pt	%xcc,	loop_2989
	udiv	%o5,	0x1EAC,	%l3
	alignaddrl	%i4,	%l2,	%i3
	tneg	%icc,	0x4
loop_2989:
	sdiv	%l4,	0x1909,	%o1
	fsrc1s	%f3,	%f5
	or	%o7,	0x09B3,	%g2
	tge	%xcc,	0x7
	stb	%g4,	[%l7 + 0x41]
	fmovdgu	%icc,	%f25,	%f28
	fmovde	%xcc,	%f7,	%f19
	or	%g6,	0x0182,	%g7
	fbug,a	%fcc2,	loop_2990
	sth	%i6,	[%l7 + 0x26]
	bge,a	%icc,	loop_2991
	movpos	%xcc,	%i1,	%l0
loop_2990:
	movrne	%o3,	%o0,	%g1
	wr	%g0,	0x88,	%asi
	stha	%g5,	[%l7 + 0x6C] %asi
loop_2991:
	movrlez	%l6,	0x030,	%o6
	fmovrsne	%i5,	%f19,	%f9
	fcmpes	%fcc2,	%f14,	%f7
	taddcc	%i7,	0x0585,	%l5
	movrgz	%o2,	0x13E,	%i0
	ldd	[%l7 + 0x40],	%l0
	edge8	%g3,	%i2,	%o4
	edge16ln	%l3,	%o5,	%i4
	and	%i3,	0x075A,	%l2
	movrne	%l4,	%o1,	%g2
	edge16	%o7,	%g4,	%g7
	ta	%xcc,	0x2
	wr	%g0,	0x04,	%asi
	ldda	[%l7 + 0x70] %asi,	%i6
	bn	loop_2992
	edge16ln	%g6,	%l0,	%i1
	array32	%o3,	%g1,	%o0
	edge32ln	%l6,	%g5,	%i5
loop_2992:
	edge32ln	%i7,	%l5,	%o6
	subc	%i0,	%l1,	%o2
	fcmpne32	%f12,	%f16,	%i2
	xor	%o4,	%l3,	%g3
	andn	%i4,	%o5,	%i3
	wr	%g0,	0x88,	%asi
	ldsba	[%l7 + 0x49] %asi,	%l2
	fxors	%f2,	%f18,	%f15
	fbl,a	%fcc2,	loop_2993
	fnands	%f26,	%f1,	%f15
	fmovdneg	%xcc,	%f12,	%f4
	fexpand	%f31,	%f16
loop_2993:
	andn	%l4,	%o1,	%o7
	bcs,pt	%xcc,	loop_2994
	fpack16	%f26,	%f21
	fbu	%fcc3,	loop_2995
	mulx	%g4,	0x06D6,	%g2
loop_2994:
	nop
	membar	#Sync
	set	0x40, %g3
	ldda	[%l7 + %g3] 0xf9,	%f16
loop_2995:
	umul	%g7,	0x10D4,	%i6
	fbuge	%fcc3,	loop_2996
	movge	%icc,	%l0,	%i1
	fand	%f24,	%f16,	%f14
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2996:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ta	%xcc,	0x4
	fmovrsne	%g6,	%f16,	%f21
	pdist	%f30,	%f10,	%f30
	movge	%xcc,	%o3,	%g1
	wr	%g0,	0x89,	%asi
	lduwa	[%l7 + 0x6C] %asi,	%o0
	and	%l6,	%g5,	%i5
	fmovdneg	%icc,	%f26,	%f2
	fbl,a	%fcc0,	loop_2997
	edge16ln	%l5,	%i7,	%o6
	move	%xcc,	%l1,	%i0
	fmovdle	%xcc,	%f9,	%f0
loop_2997:
	sdivcc	%o2,	0x0479,	%o4
	fmul8ulx16	%f14,	%f0,	%f24
	fmovdge	%xcc,	%f4,	%f5
	tpos	%icc,	0x2
	fnot1	%f20,	%f24
	movrlz	%l3,	0x3F7,	%g3
	smulcc	%i2,	0x07F5,	%i4
	movre	%o5,	0x020,	%i3
	movrgz	%l4,	%l2,	%o7
	fbo,a	%fcc0,	loop_2998
	fpmerge	%f6,	%f27,	%f26
	tvs	%xcc,	0x6
	fcmps	%fcc3,	%f17,	%f19
loop_2998:
	fbul	%fcc2,	loop_2999
	subc	%o1,	%g4,	%g2
	fornot1s	%f24,	%f21,	%f27
	fcmpne16	%f18,	%f8,	%g7
loop_2999:
	membar	0x3B
	fmovdle	%icc,	%f19,	%f31
	fbe,a	%fcc1,	loop_3000
	array8	%l0,	%i1,	%g6
	fbne,a	%fcc2,	loop_3001
	fmovsg	%xcc,	%f5,	%f26
loop_3000:
	tne	%icc,	0x0
	andncc	%o3,	%i6,	%g1
loop_3001:
	edge16n	%l6,	%o0,	%i5
	tcs	%icc,	0x2
	ta	%xcc,	0x5
	udivcc	%l5,	0x16EB,	%i7
	edge32	%g5,	%l1,	%i0
	subccc	%o6,	%o4,	%o2
	add	%l3,	0x0CDF,	%g3
	fmuld8sux16	%f15,	%f24,	%f24
	fmovspos	%icc,	%f13,	%f16
	fmovdneg	%xcc,	%f5,	%f7
	edge32l	%i2,	%i4,	%i3
	brnz,a	%o5,	loop_3002
	fmovrde	%l2,	%f4,	%f30
	movgu	%xcc,	%l4,	%o7
	wr	%g0,	0x21,	%asi
	stxa	%g4,	[%g0 + 0x8] %asi
loop_3002:
	fabss	%f12,	%f18
	fmovde	%icc,	%f12,	%f14
	fbug	%fcc1,	loop_3003
	andncc	%o1,	%g7,	%g2
	andn	%l0,	0x1652,	%i1
	fbu	%fcc0,	loop_3004
loop_3003:
	tg	%xcc,	0x4
	movre	%g6,	%o3,	%g1
	wr	%g0,	0x10,	%asi
	ldda	[%l7 + 0x60] %asi,	%i6
loop_3004:
	fpsub32	%f28,	%f28,	%f24
	fmovsvs	%icc,	%f25,	%f3
	tge	%xcc,	0x7
	fcmple32	%f28,	%f18,	%o0
	tg	%icc,	0x4
	tcs	%icc,	0x6
	fmovdl	%icc,	%f6,	%f18
	tl	%xcc,	0x5
	bn,a	%icc,	loop_3005
	tgu	%icc,	0x3
	fcmple32	%f24,	%f0,	%i5
	st	%f20,	[%l7 + 0x5C]
loop_3005:
	alignaddr	%l6,	%l5,	%i7
	nop
	setx	loop_3006,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	alignaddr	%g5,	%l1,	%o6
	movgu	%xcc,	%i0,	%o2
	set	0x73, %o7
	ldstuba	[%l7 + %o7] 0x89,	%o4
loop_3006:
	tn	%xcc,	0x7
	edge8l	%g3,	%l3,	%i2
	sub	%i4,	%i3,	%o5
	set	0x54, %i0
	sta	%f7,	[%l7 + %i0] 0x04
	fexpand	%f30,	%f4
	fpadd32	%f20,	%f30,	%f0
	tvs	%xcc,	0x2
	edge32ln	%l2,	%o7,	%l4
	fandnot1	%f18,	%f10,	%f24
	edge32	%o1,	%g7,	%g2
	alignaddr	%g4,	%l0,	%i1
	fxors	%f24,	%f16,	%f5
	smul	%g6,	0x1871,	%g1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tcs	%xcc,	0x6
	movge	%xcc,	%o3,	%i6
	wr	%g0,	0x0c,	%asi
	stba	%i5,	[%l7 + 0x45] %asi
	movrgez	%o0,	%l5,	%i7
	fands	%f27,	%f17,	%f4
	fbue,a	%fcc1,	loop_3007
	orn	%l6,	0x0D1B,	%g5
	tneg	%xcc,	0x4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_3007:
	bl,a	%icc,	loop_3008
	movpos	%icc,	%o6,	%l1
	tge	%icc,	0x6
	sllx	%o2,	%o4,	%g3
loop_3008:
	xnorcc	%l3,	0x094C,	%i0
	subcc	%i2,	0x0D43,	%i3
	alignaddr	%i4,	%l2,	%o5
	bgu	%icc,	loop_3009
	edge16l	%o7,	%l4,	%o1
	sethi	0x0E6F,	%g7
	taddcctv	%g2,	%l0,	%g4
loop_3009:
	tleu	%icc,	0x0
	movrne	%i1,	%g6,	%g1
	srl	%o3,	%i5,	%i6
	wr	%g0,	0x89,	%asi
	stda	%l4,	[%l7 + 0x40] %asi
	movvc	%xcc,	%i7,	%o0
	andncc	%g5,	%l6,	%l1
	fmovdleu	%xcc,	%f25,	%f9
	stbar
	bleu,pn	%icc,	loop_3010
	udiv	%o6,	0x0E79,	%o4
	tne	%xcc,	0x0
	edge32n	%o2,	%l3,	%g3
loop_3010:
	alignaddrl	%i2,	%i0,	%i4
	movge	%icc,	%i3,	%o5
	fbg	%fcc2,	loop_3011
	fpsub32	%f18,	%f28,	%f2
	edge32	%l2,	%o7,	%l4
	fmovrde	%g7,	%f10,	%f8
loop_3011:
	andcc	%o1,	0x0D82,	%g2
	edge8ln	%g4,	%i1,	%g6
	movcs	%xcc,	%l0,	%g1
	fbne,a	%fcc0,	loop_3012
	sethi	0x163A,	%o3
	wr	%g0,	0x10,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
loop_3012:
	movle	%icc,	%i6,	%l5
	movvs	%icc,	%i5,	%i7
	wr	%g0,	0x80,	%asi
	prefetcha	[%l7 + 0x18] %asi,	 0x3
	array32	%o0,	%l1,	%l6
	tl	%xcc,	0x7
	smulcc	%o4,	0x1F53,	%o2
	movrgez	%o6,	0x10C,	%l3
	fmovdneg	%xcc,	%f4,	%f14
	wr	%g0,	0x88,	%asi
	lduwa	[%l7 + 0x58] %asi,	%i2
	udivx	%i0,	0x1582,	%i4
	for	%f6,	%f14,	%f6
	bne,pt	%xcc,	loop_3013
	taddcctv	%i3,	%g3,	%l2
	fcmpne32	%f22,	%f4,	%o7
	umulcc	%o5,	0x0187,	%l4
loop_3013:
	andn	%o1,	0x1289,	%g7
	movl	%icc,	%g4,	%g2
	movle	%xcc,	%i1,	%g6
	set	0x20, %o3
	stxa	%l0,	[%l7 + %o3] 0x19
	fnot1	%f8,	%f22
	fsrc2s	%f17,	%f11
	movrgez	%o3,	0x19C,	%i6
	fbu,a	%fcc3,	loop_3014
	fornot2	%f4,	%f4,	%f10
	fmuld8sux16	%f2,	%f28,	%f8
	fmovsl	%icc,	%f6,	%f15
loop_3014:
	ldub	[%l7 + 0x1D],	%l5
	andncc	%g1,	%i7,	%i5
	bge,pt	%xcc,	loop_3015
	stw	%g5,	[%l7 + 0x38]
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddr	%l1,	%l6,	%o0
loop_3015:
	movrlz	%o4,	0x1F5,	%o6
	wr	%g0,	0x88,	%asi
	lda	[%l7 + 0x5C] %asi,	%f21
	orncc	%l3,	%i2,	%o2
	wr	%g0,	0x80,	%asi
	lda	[%l7 + 0x50] %asi,	%f25
	fzeros	%f16
	fbne,a	%fcc3,	loop_3016
	fbuge	%fcc3,	loop_3017
	fmovda	%icc,	%f30,	%f30
	alignaddr	%i0,	%i3,	%i4
loop_3016:
	fxor	%f6,	%f20,	%f16
loop_3017:
	ba,a,pt	%xcc,	loop_3018
	movl	%xcc,	%l2,	%o7
	smul	%o5,	0x12C7,	%g3
	edge16n	%l4,	%g7,	%g4
loop_3018:
	nop
	wr	%g0,	0x81,	%asi
	stba	%o1,	[%l7 + 0x12] %asi
	array8	%i1,	%g2,	%g6
	and	%o3,	0x1304,	%i6
	mulscc	%l5,	0x0138,	%l0
	fmovdne	%icc,	%f13,	%f15
	wr	%g0,	0x0c,	%asi
	lduba	[%l7 + 0x68] %asi,	%g1
	wr	%g0,	0x19,	%asi
	lduwa	[%l7 + 0x38] %asi,	%i7
	fmovde	%xcc,	%f26,	%f16
	fandnot2s	%f27,	%f1,	%f5
	edge16	%g5,	%i5,	%l1
	edge32ln	%l6,	%o0,	%o4
	fandnot1	%f22,	%f16,	%f18
	andcc	%o6,	%i2,	%l3
	edge16l	%o2,	%i3,	%i0
	std	%f2,	[%l7 + 0x50]
	array16	%l2,	%i4,	%o7
	tle	%icc,	0x2
	tn	%icc,	0x4
	orcc	%o5,	0x01FD,	%l4
	movvs	%xcc,	%g7,	%g3
	edge8	%o1,	%i1,	%g4
	edge16ln	%g2,	%o3,	%i6
	fmovrslez	%g6,	%f15,	%f10
	tl	%xcc,	0x6
	edge8l	%l5,	%g1,	%l0
	wr	%g0,	0x18,	%asi
	ldswa	[%l7 + 0x14] %asi,	%i7
	mulx	%g5,	%l1,	%i5
	movvc	%xcc,	%l6,	%o4
	subccc	%o6,	0x0192,	%o0
	brgez,a	%i2,	loop_3019
	sir	0x01F6
	fbug,a	%fcc0,	loop_3020
	subcc	%l3,	%o2,	%i3
loop_3019:
	brnz,a	%i0,	loop_3021
	fsrc1s	%f4,	%f23
loop_3020:
	std	%f10,	[%l7 + 0x08]
	xorcc	%l2,	%o7,	%o5
loop_3021:
	fmovsl	%icc,	%f22,	%f16
	fnands	%f8,	%f10,	%f21
	fsrc1	%f10,	%f16
	movn	%xcc,	%l4,	%i4
	fnegs	%f6,	%f11
	wr	%g0,	0x2a,	%asi
	stba	%g3,	[%l7 + 0x28] %asi
	membar	#Sync
	umul	%g7,	%o1,	%g4
	sir	0x0A7A
	tn	%xcc,	0x1
	movge	%icc,	%i1,	%o3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrslz	%i6,	%f21,	%f28
	fornot2s	%f20,	%f25,	%f21
	edge32	%g2,	%g6,	%g1
	fmovrdne	%l5,	%f22,	%f8
	smul	%l0,	%i7,	%g5
	stx	%i5,	[%l7 + 0x70]
	sll	%l6,	0x0A,	%o4
	bshuffle	%f22,	%f20,	%f6
	fand	%f26,	%f18,	%f10
	movl	%xcc,	%o6,	%o0
	edge32l	%l1,	%i2,	%o2
	fmovd	%f2,	%f8
	fmovrdgz	%l3,	%f16,	%f18
	udiv	%i3,	0x1D95,	%i0
	fnegd	%f30,	%f30
	sdivcc	%o7,	0x162F,	%o5
	edge16l	%l2,	%i4,	%l4
	fcmpne16	%f26,	%f2,	%g7
	fxors	%f15,	%f11,	%f19
	movpos	%icc,	%g3,	%o1
	sth	%g4,	[%l7 + 0x5E]
	edge32	%o3,	%i6,	%g2
	udivcc	%i1,	0x1504,	%g1
	tgu	%icc,	0x2
	addcc	%l5,	%l0,	%g6
	fandnot2	%f20,	%f18,	%f26
	ble,pt	%icc,	loop_3022
	fmul8x16al	%f23,	%f14,	%f8
	movne	%xcc,	%i7,	%g5
	fbuge,a	%fcc1,	loop_3023
loop_3022:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnot1s	%f2,	%f19
	ldsb	[%l7 + 0x0F],	%i5
loop_3023:
	fpsub16s	%f29,	%f18,	%f7
	move	%xcc,	%l6,	%o4
	brz	%o0,	loop_3024
	fandnot1	%f14,	%f20,	%f10
	fmovsle	%xcc,	%f15,	%f7
	wr	%g0,	0x19,	%asi
	sta	%f30,	[%l7 + 0x30] %asi
loop_3024:
	popc	%o6,	%i2
	taddcc	%o2,	%l1,	%i3
	bcc,a,pn	%xcc,	loop_3025
	umul	%i0,	%l3,	%o5
	orn	%o7,	%i4,	%l2
	movleu	%xcc,	%l4,	%g3
loop_3025:
	fbo	%fcc0,	loop_3026
	edge16ln	%o1,	%g4,	%g7
	fmuld8ulx16	%f13,	%f0,	%f12
	orn	%o3,	%i6,	%g2
loop_3026:
	edge16l	%i1,	%g1,	%l0
	wr	%g0,	0xe2,	%asi
	stwa	%l5,	[%l7 + 0x50] %asi
	membar	#Sync
	wr	%g0,	0x11,	%asi
	ldswa	[%l7 + 0x08] %asi,	%g6
	xnorcc	%i7,	0x0ABA,	%i5
	mova	%xcc,	%l6,	%g5
	sethi	0x04C7,	%o0
	movl	%icc,	%o4,	%o6
	fmovrdgez	%o2,	%f30,	%f6
	andn	%l1,	%i2,	%i0
	movvc	%icc,	%l3,	%i3
	movrne	%o5,	0x3FC,	%o7
	tvc	%icc,	0x1
	and	%i4,	%l4,	%l2
	udivx	%g3,	0x1ADA,	%g4
	or	%g7,	0x18F3,	%o3
	sub	%o1,	%i6,	%i1
	pdist	%f24,	%f20,	%f2
	tg	%icc,	0x2
	fmuld8ulx16	%f28,	%f23,	%f12
	call	loop_3027
	movneg	%icc,	%g2,	%g1
	edge16n	%l0,	%l5,	%g6
	set	0x60, %i3
	ldda	[%l7 + %i3] 0xe2,	%i4
loop_3027:
	fmovda	%xcc,	%f6,	%f23
	wr	%g0,	0x18,	%asi
	lduwa	[%l7 + 0x38] %asi,	%i7
	sdivx	%l6,	0x0720,	%o0
	fmovdle	%icc,	%f1,	%f5
	bne,pt	%xcc,	loop_3028
	bneg	%xcc,	loop_3029
	fmovrslz	%o4,	%f25,	%f9
	movrlz	%o6,	0x07E,	%o2
loop_3028:
	bcs	%xcc,	loop_3030
loop_3029:
	udivcc	%l1,	0x0A9A,	%g5
	movgu	%icc,	%i0,	%i2
	std	%i2,	[%l7 + 0x20]
loop_3030:
	movrlez	%l3,	0x3CA,	%o5
	movrne	%o7,	0x033,	%i4
	edge8ln	%l4,	%g3,	%l2
	fxors	%f19,	%f12,	%f2
	fsrc2s	%f3,	%f31
	movne	%icc,	%g4,	%o3
	edge16ln	%o1,	%i6,	%g7
	wr	%g0,	0x88,	%asi
	swapa	[%l7 + 0x6C] %asi,	%g2
	bneg,a	loop_3031
	fmovda	%xcc,	%f19,	%f7
	tle	%icc,	0x7
	mulscc	%g1,	%i1,	%l5
loop_3031:
	bvs,a	loop_3032
	fmovd	%f28,	%f14
	tge	%icc,	0x2
	bn,pt	%xcc,	loop_3033
loop_3032:
	fone	%f14
	orn	%l0,	0x15FF,	%i5
	for	%f6,	%f0,	%f4
loop_3033:
	nop
	set	0x60, %o1
	lda	[%l7 + %o1] 0x10,	%f15
	fmovrde	%i7,	%f4,	%f14
	stb	%g6,	[%l7 + 0x47]
	and	%l6,	%o0,	%o4
	wr	%g0,	0x88,	%asi
	prefetcha	[%l7 + 0x18] %asi,	 0x0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fones	%f17
	set	0x50, %g4
	ldda	[%l7 + %g4] 0x81,	%l0
	andcc	%o2,	0x0611,	%i0
	fsrc2s	%f4,	%f27
	tpos	%icc,	0x4
	tgu	%xcc,	0x1
	wr	%g0,	0x11,	%asi
	ldda	[%l7 + 0x10] %asi,	%g4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andncc	%i2,	%l3,	%o5
	alignaddrl	%i3,	%o7,	%l4
	fmovrdlz	%i4,	%f16,	%f12
	tn	%xcc,	0x4
	array32	%g3,	%g4,	%l2
	fmovrde	%o3,	%f18,	%f2
	smulcc	%o1,	0x14B1,	%i6
	addccc	%g2,	%g7,	%i1
	fmovsa	%xcc,	%f31,	%f15
	tge	%icc,	0x7
	sir	0x0AF4
	add	%l5,	%g1,	%i5
	movre	%l0,	0x3E4,	%g6
	add	%l7,	0x10,	%l6
	wr	%g0,	0x0c,	%asi
	casxa	[%l6] 0x0c,	%l6,	%i7
	bge,pt	%icc,	loop_3034
	orn	%o0,	0x17BC,	%o6
	nop
	setx loop_3035, %l0, %l1
	jmpl %l1, %o4
	umulcc	%l1,	%o2,	%g5
loop_3034:
	movvc	%xcc,	%i0,	%l3
	fornot2	%f24,	%f30,	%f14
loop_3035:
	fcmpes	%fcc1,	%f27,	%f14
	xor	%i2,	0x082F,	%o5
	edge32	%o7,	%l4,	%i4
	fandnot2s	%f15,	%f1,	%f31
	fabss	%f18,	%f21
	movvs	%xcc,	%i3,	%g4
	sub	%g3,	%o3,	%o1
	tleu	%xcc,	0x5
	movrgz	%l2,	0x0CF,	%g2
	st	%f1,	[%l7 + 0x4C]
	popc	%i6,	%i1
	ble,a,pn	%xcc,	loop_3036
	te	%xcc,	0x7
	movvs	%icc,	%g7,	%g1
	xorcc	%i5,	0x0342,	%l5
loop_3036:
	udivx	%l0,	0x15D5,	%g6
	orn	%l6,	0x1138,	%o0
	orn	%i7,	%o4,	%o6
	call	loop_3037
	subc	%l1,	0x159C,	%o2
	prefetch	[%l7 + 0x58],	 0x0
	movvc	%icc,	%i0,	%g5
loop_3037:
	stw	%i2,	[%l7 + 0x6C]
	fnot1	%f24,	%f14
	movrlz	%o5,	%o7,	%l4
	orncc	%l3,	0x1308,	%i3
	movvc	%xcc,	%i4,	%g4
	array32	%o3,	%o1,	%g3
	tneg	%icc,	0x4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmul8x16	%f5,	%f14,	%f0
	fcmped	%fcc2,	%f24,	%f6
	fmovdle	%xcc,	%f12,	%f6
	sdiv	%l2,	0x07AE,	%g2
	movgu	%icc,	%i1,	%i6
	edge32n	%g1,	%i5,	%g7
	fbue	%fcc1,	loop_3038
	movvs	%xcc,	%l5,	%l0
	bcc,pn	%icc,	loop_3039
	fnot1	%f0,	%f8
loop_3038:
	nop
	set	0x60, %g6
	lda	[%l7 + %g6] 0x10,	%f19
loop_3039:
	tg	%icc,	0x4
	subc	%g6,	%l6,	%i7
	edge16	%o0,	%o4,	%l1
	set	0x40, %i7
	ldda	[%l7 + %i7] 0x88,	%f0
	std	%o2,	[%l7 + 0x48]
	add	%i0,	0x1CA0,	%o6
	edge16l	%i2,	%o5,	%g5
	movcc	%xcc,	%o7,	%l3
	lduw	[%l7 + 0x78],	%i3
	fmuld8sux16	%f25,	%f30,	%f2
	tl	%xcc,	0x4
	fbge	%fcc3,	loop_3040
	tvs	%icc,	0x4
	mulscc	%i4,	0x12CA,	%l4
	tle	%xcc,	0x3
loop_3040:
	udivx	%g4,	0x1B24,	%o1
	fmovrse	%g3,	%f27,	%f31
	set	0x40, %g5
	ldda	[%l7 + %g5] 0x14,	%f16
	set	0x79, %g7
	lduba	[%l7 + %g7] 0x10,	%o3
	add	%l7,	0x10,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] %asi,	%g2,	%l2
	bcs,a	loop_3041
	fmovrdlz	%i6,	%f30,	%f14
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
	movneg	%icc,	%g1,	%i5
loop_3041:
	nop
	wr	%g0,	0x10,	%asi
	ldxa	[%l7 + 0x20] %asi,	%g7
loop_3042:
	bvs,a,pt	%xcc,	loop_3043
	alignaddr	%l5,	%l0,	%i1
	sethi	0x0BCB,	%g6
	bneg,a	loop_3044
loop_3043:
	tge	%xcc,	0x3
	tsubcc	%l6,	0x0509,	%o0
	movrlz	%o4,	%l1,	%i7
loop_3044:
	fble,a	%fcc1,	loop_3045
	ldsh	[%l7 + 0x68],	%i0
	srax	%o6,	0x1F,	%i2
	call	loop_3046
loop_3045:
	fandnot2s	%f12,	%f0,	%f19
	edge32	%o5,	%o2,	%o7
	movleu	%xcc,	%g5,	%l3
loop_3046:
	movcc	%icc,	%i3,	%i4
	fornot1	%f24,	%f20,	%f16
	set	0x76, %i1
	stba	%l4,	[%l7 + %i1] 0x27
	membar	#Sync
	tg	%xcc,	0x7
	ld	[%l7 + 0x34],	%f26
	sir	0x19CB
	tl	%icc,	0x5
	fmovrdne	%g4,	%f14,	%f22
	add	%l7,	0x48,	%l6
	wr	%g0,	0x19,	%asi
	lda	[%l6] %asi,	%g3
	casa	[%l6] %asi,	%g3,	%o3
	fmovrsne	%g2,	%f23,	%f22
	te	%icc,	0x2
	fmovrdgez	%o1,	%f0,	%f12
	subc	%l2,	%g1,	%i5
	fexpand	%f17,	%f18
	movcc	%icc,	%g7,	%l5
	movvc	%icc,	%i6,	%i1
	xnor	%l0,	0x16F3,	%l6
	tg	%xcc,	0x3
	alignaddrl	%o0,	%g6,	%l1
	fmovdvc	%xcc,	%f26,	%f14
	tle	%xcc,	0x3
	movg	%xcc,	%o4,	%i0
	fone	%f30
	subc	%i7,	%i2,	%o6
	sub	%o2,	0x1436,	%o7
	ldstub	[%l7 + 0x33],	%g5
	fcmps	%fcc1,	%f26,	%f10
	movge	%icc,	%l3,	%i3
	movrlz	%i4,	0x0C7,	%o5
	fandnot2	%f6,	%f14,	%f10
	bleu	loop_3047
	fxnors	%f18,	%f0,	%f8
	sdivx	%l4,	0x08B3,	%g3
	movcs	%xcc,	%o3,	%g4
loop_3047:
	fzero	%f6
	fmovsvs	%icc,	%f27,	%f19
	std	%o0,	[%l7 + 0x40]
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bpos,a	%icc,	loop_3048
	array16	%g2,	%l2,	%i5
	edge32	%g7,	%g1,	%l5
	brnz	%i6,	loop_3049
loop_3048:
	ldub	[%l7 + 0x34],	%i1
	edge32n	%l0,	%o0,	%g6
	movrgez	%l1,	0x086,	%l6
loop_3049:
	popc	%o4,	%i0
	bvs,a	%xcc,	loop_3050
	movrgz	%i7,	0x12E,	%o6
	fpsub32	%f4,	%f18,	%f6
	add	%i2,	%o7,	%g5
loop_3050:
	fblg,a	%fcc0,	loop_3051
	subccc	%o2,	%l3,	%i3
	membar	0x2F
	tpos	%xcc,	0x3
loop_3051:
	movgu	%icc,	%o5,	%i4
	fmovsg	%xcc,	%f20,	%f17
	set	0x40, %o6
	stda	%f16,	[%l7 + %o6] 0x1e
	membar	#Sync
	movneg	%icc,	%g3,	%o3
	call	loop_3052
	bcc,a,pn	%xcc,	loop_3053
	tleu	%xcc,	0x3
	bgu	%xcc,	loop_3054
loop_3052:
	movre	%l4,	0x14E,	%o1
loop_3053:
	fpackfix	%f20,	%f8
	fbl,a	%fcc1,	loop_3055
loop_3054:
	movl	%xcc,	%g2,	%g4
	fmovsg	%icc,	%f11,	%f11
	tne	%icc,	0x7
loop_3055:
	umul	%i5,	0x02BC,	%g7
	bg	loop_3056
	fandnot2	%f4,	%f6,	%f6
	bvs	%icc,	loop_3057
	taddcc	%l2,	%l5,	%g1
loop_3056:
	array32	%i1,	%l0,	%o0
	movvs	%icc,	%g6,	%i6
loop_3057:
	subcc	%l1,	0x18F3,	%l6
	srlx	%i0,	%o4,	%i7
	wr	%g0,	0xea,	%asi
	stxa	%i2,	[%l7 + 0x08] %asi
	membar	#Sync
	fnegs	%f19,	%f0
	fbg,a	%fcc0,	loop_3058
	fble	%fcc2,	loop_3059
	fmovdcs	%xcc,	%f9,	%f14
	nop
	setx	loop_3060,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_3058:
	bg,pn	%xcc,	loop_3061
loop_3059:
	movl	%xcc,	%o6,	%o7
	movrlez	%o2,	0x3AE,	%g5
loop_3060:
	movrgez	%i3,	%o5,	%l3
loop_3061:
	fmovrse	%g3,	%f19,	%f20
	orn	%o3,	0x12E3,	%l4
	orn	%o1,	0x1FE7,	%i4
	umulcc	%g2,	0x1E66,	%g4
	edge16l	%i5,	%g7,	%l5
	orncc	%g1,	0x0016,	%i1
	movrlez	%l2,	%l0,	%g6
	fabss	%f22,	%f31
	tsubcctv	%i6,	%l1,	%o0
	edge16	%l6,	%o4,	%i7
	fpadd32s	%f6,	%f20,	%f21
	ba,a,pt	%xcc,	loop_3062
	edge8l	%i2,	%i0,	%o6
	ldsb	[%l7 + 0x0C],	%o7
	fzero	%f12
loop_3062:
	movrne	%g5,	%o2,	%o5
	movrlez	%i3,	0x122,	%g3
	movge	%xcc,	%o3,	%l3
	fand	%f8,	%f30,	%f24
	fble	%fcc3,	loop_3063
	fcmple32	%f14,	%f18,	%l4
	fnegs	%f18,	%f30
	edge16ln	%o1,	%i4,	%g2
loop_3063:
	fpsub16s	%f20,	%f4,	%f24
	set	0x28, %o2
	swapa	[%l7 + %o2] 0x18,	%g4
	fbuge	%fcc0,	loop_3064
	tsubcc	%g7,	%l5,	%i5
	andn	%i1,	0x16C7,	%l2
	nop
	setx	loop_3065,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_3064:
	fmovsgu	%xcc,	%f31,	%f1
	array32	%l0,	%g6,	%i6
	set	0x08, %l6
	ldsha	[%l7 + %l6] 0x88,	%l1
loop_3065:
	fmovsleu	%xcc,	%f7,	%f4
	mulx	%g1,	0x090D,	%l6
	sdiv	%o0,	0x13BE,	%o4
	movvc	%icc,	%i2,	%i0
	taddcc	%i7,	%o7,	%o6
	ldx	[%l7 + 0x50],	%o2
	wr	%g0,	0x10,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	movvc	%xcc,	%o5,	%i3
	ldx	[%l7 + 0x28],	%g3
	movvs	%xcc,	%o3,	%l3
	siam	0x5
	mulx	%l4,	0x0D99,	%o1
	brlez	%g5,	loop_3066
	andcc	%g2,	0x1F21,	%i4
	orcc	%g7,	0x1BE9,	%l5
	fmovrslz	%i5,	%f5,	%f9
loop_3066:
	ldd	[%l7 + 0x30],	%i0
	fmovsleu	%xcc,	%f30,	%f23
	udivx	%g4,	0x0509,	%l2
	fpack16	%f16,	%f0
	add	%l7,	0x68,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%l0,	%g6
	mova	%icc,	%i6,	%l1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8n	%g1,	%o0,	%l6
	fmul8x16	%f17,	%f30,	%f24
	tne	%xcc,	0x5
	andncc	%o4,	%i0,	%i2
	fba,a	%fcc2,	loop_3067
	tcc	%icc,	0x4
	fnors	%f28,	%f8,	%f2
	fnot2	%f28,	%f12
loop_3067:
	tl	%xcc,	0x5
	bl	loop_3068
	fmovsvs	%xcc,	%f12,	%f29
	movle	%xcc,	%o7,	%o6
	fcmps	%fcc3,	%f22,	%f25
loop_3068:
	bne	%xcc,	loop_3069
	for	%f28,	%f26,	%f2
	move	%icc,	%i7,	%o5
	fmovdl	%icc,	%f0,	%f16
loop_3069:
	smul	%i3,	%g3,	%o3
	fmovdneg	%xcc,	%f22,	%f21
	tgu	%xcc,	0x6
	fmovrdlz	%o2,	%f4,	%f30
	movcc	%xcc,	%l3,	%o1
	add	%g5,	0x1055,	%l4
	edge8n	%g2,	%g7,	%l5
	set	0x40, %i2
	stda	%f0,	[%l7 + %i2] 0x1e
	membar	#Sync
	movneg	%icc,	%i4,	%i5
	movre	%g4,	0x34C,	%l2
	addccc	%l0,	0x17A1,	%g6
	ldub	[%l7 + 0x16],	%i6
	andncc	%l1,	%i1,	%g1
	sllx	%l6,	0x15,	%o0
	addcc	%i0,	%i2,	%o7
	fmovdle	%xcc,	%f3,	%f21
	fble,a	%fcc1,	loop_3070
	fmovspos	%icc,	%f17,	%f17
	for	%f10,	%f4,	%f16
	andncc	%o6,	%i7,	%o4
loop_3070:
	fmovdcc	%icc,	%f28,	%f7
	udiv	%i3,	0x1D5F,	%g3
	fmovdle	%xcc,	%f11,	%f30
	fabss	%f8,	%f31
	edge8ln	%o5,	%o3,	%l3
	movpos	%xcc,	%o2,	%o1
	siam	0x2
	tsubcctv	%l4,	%g5,	%g2
	addc	%l5,	0x057A,	%i4
	tvs	%icc,	0x7
	xorcc	%i5,	0x1DE6,	%g7
	fsrc2s	%f24,	%f19
	sdivx	%g4,	0x1099,	%l0
	srax	%l2,	0x07,	%g6
	move	%icc,	%l1,	%i6
	movcs	%xcc,	%i1,	%g1
	udiv	%o0,	0x1C71,	%l6
	fpmerge	%f9,	%f8,	%f12
	udiv	%i2,	0x01D3,	%o7
	fnegd	%f6,	%f6
	taddcctv	%i0,	%i7,	%o4
	fmovd	%f4,	%f2
	fcmped	%fcc3,	%f6,	%f12
	sll	%i3,	%g3,	%o5
	subcc	%o3,	%o6,	%l3
	sllx	%o1,	%l4,	%g5
	andcc	%o2,	0x1735,	%g2
	tvc	%icc,	0x4
	ble,a,pn	%icc,	loop_3071
	stbar
	xor	%l5,	%i4,	%g7
	swap	[%l7 + 0x1C],	%g4
loop_3071:
	brlz	%i5,	loop_3072
	movcs	%icc,	%l2,	%g6
	tneg	%xcc,	0x3
	wr	%g0,	0x0c,	%asi
	lduba	[%l7 + 0x32] %asi,	%l0
loop_3072:
	movvc	%icc,	%i6,	%i1
	fmovdpos	%icc,	%f3,	%f11
	movpos	%icc,	%l1,	%g1
	and	%l6,	0x076F,	%i2
	wr	%g0,	0xeb,	%asi
	stba	%o0,	[%l7 + 0x6E] %asi
	membar	#Sync
	popc	0x0E7E,	%i0
	array16	%o7,	%i7,	%o4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fornot2s	%f24,	%f0,	%f22
	fpack32	%f28,	%f10,	%f22
	andn	%g3,	0x14A8,	%i3
	mulscc	%o3,	%o6,	%o5
	tneg	%icc,	0x5
	brlz,a	%o1,	loop_3073
	fxors	%f2,	%f14,	%f18
	fmovsleu	%xcc,	%f12,	%f30
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_3073:
	fcmps	%fcc1,	%f23,	%f8
	udivcc	%l4,	0x1EE5,	%l3
	ldstub	[%l7 + 0x62],	%g5
	bge,pn	%icc,	loop_3074
	fmovdge	%xcc,	%f22,	%f25
	srl	%g2,	0x15,	%o2
	edge8	%i4,	%l5,	%g4
loop_3074:
	for	%f30,	%f20,	%f30
	subcc	%i5,	%g7,	%l2
	sll	%g6,	0x0B,	%i6
	xnor	%i1,	%l1,	%l0
	fandnot2s	%f27,	%f15,	%f19
	orn	%l6,	0x0295,	%g1
	movneg	%icc,	%i2,	%o0
	sir	0x0351
	pdist	%f30,	%f22,	%f18
	fmovscs	%xcc,	%f21,	%f8
	subccc	%o7,	%i7,	%o4
	fexpand	%f31,	%f0
	movrgz	%i0,	%g3,	%o3
	movn	%icc,	%i3,	%o5
	andncc	%o6,	%l4,	%l3
	prefetch	[%l7 + 0x30],	 0x0
	tl	%icc,	0x0
	fornot1	%f30,	%f22,	%f0
	fcmple16	%f30,	%f6,	%g5
	stx	%g2,	[%l7 + 0x70]
	or	%o1,	0x199D,	%o2
	sdivx	%i4,	0x1026,	%g4
	movne	%xcc,	%i5,	%l5
	andcc	%l2,	0x1309,	%g6
	addcc	%g7,	0x17DC,	%i1
	sub	%i6,	%l0,	%l6
	fabsd	%f18,	%f2
	fornot2	%f10,	%f28,	%f2
	movre	%l1,	0x014,	%i2
	or	%o0,	0x0BE3,	%o7
	te	%xcc,	0x2
	subcc	%g1,	0x06D9,	%i7
	movrlez	%o4,	%i0,	%o3
	edge32ln	%g3,	%o5,	%i3
	edge8ln	%o6,	%l4,	%g5
	andncc	%l3,	%o1,	%g2
	fmovsle	%icc,	%f16,	%f15
	fmovsl	%xcc,	%f1,	%f21
	bshuffle	%f2,	%f20,	%f2
	fmovdvc	%xcc,	%f16,	%f22
	sdivcc	%i4,	0x1C9C,	%o2
	fbe	%fcc1,	loop_3075
	orcc	%g4,	%l5,	%l2
	fmovdle	%icc,	%f16,	%f12
	fnand	%f2,	%f0,	%f26
loop_3075:
	fmul8x16au	%f20,	%f25,	%f18
	edge16n	%g6,	%g7,	%i1
	tge	%icc,	0x7
	fbe,a	%fcc0,	loop_3076
	srlx	%i5,	%i6,	%l6
	srax	%l1,	0x1B,	%i2
	tvc	%xcc,	0x4
loop_3076:
	tvs	%icc,	0x6
	bleu	loop_3077
	xor	%l0,	0x123A,	%o0
	wr	%g0,	0x81,	%asi
	ldsba	[%l7 + 0x0B] %asi,	%o7
loop_3077:
	movre	%g1,	%i7,	%i0
	movpos	%xcc,	%o3,	%o4
	movpos	%xcc,	%g3,	%o5
	edge8l	%o6,	%i3,	%g5
	andncc	%l4,	%o1,	%g2
	taddcc	%l3,	0x0A1D,	%o2
	sll	%g4,	0x0F,	%i4
	fmovdvc	%xcc,	%f21,	%f17
	fsrc2s	%f11,	%f20
	add	%l7,	0x40,	%l6
	wr	%g0,	0x0c,	%asi
	casa	[%l6] 0x0c,	%l2,	%g6
	xnor	%l5,	0x1F00,	%i1
	edge16	%i5,	%g7,	%l6
	tvs	%xcc,	0x0
	tneg	%icc,	0x6
	ba,a	loop_3078
	stx	%i6,	[%l7 + 0x78]
	fornot2	%f6,	%f6,	%f18
	fmovrsgez	%i2,	%f29,	%f21
loop_3078:
	addcc	%l0,	0x1F0A,	%o0
	fmovsg	%xcc,	%f2,	%f17
	addc	%o7,	0x0C21,	%l1
	nop
	setx loop_3079, %l0, %l1
	jmpl %l1, %g1
	andn	%i7,	0x1545,	%i0
	set	0x108, %l2
	stxa	%o4,	[%g0 + %l2] 0x21
loop_3079:
	mova	%xcc,	%o3,	%o5
	mulscc	%g3,	%i3,	%g5
	movrgz	%l4,	0x24D,	%o1
	wr	%g0,	0x0c,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	edge8	%g2,	%o6,	%o2
	andcc	%g4,	%i4,	%l2
	wr	%g0,	0x81,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	fbue	%fcc2,	loop_3080
	fpack32	%f28,	%f24,	%f14
	edge16l	%g6,	%l5,	%i1
	fmovsne	%icc,	%f20,	%f2
loop_3080:
	smulcc	%l3,	%i5,	%l6
	orcc	%g7,	0x145B,	%i6
	siam	0x3
	xnorcc	%l0,	0x0669,	%o0
	tle	%xcc,	0x5
	sth	%o7,	[%l7 + 0x2E]
	edge32	%i2,	%g1,	%l1
	fmul8x16al	%f8,	%f3,	%f30
	edge32	%i7,	%i0,	%o4
	set	0x60, %i6
	stba	%o3,	[%l7 + %i6] 0xeb
	membar	#Sync
	fbne	%fcc1,	loop_3081
	tvs	%icc,	0x4
	movrlz	%g3,	0x1BB,	%o5
	tpos	%xcc,	0x5
loop_3081:
	bcc	%icc,	loop_3082
	srl	%i3,	%l4,	%o1
	bpos,a,pn	%icc,	loop_3083
	brlz	%g5,	loop_3084
loop_3082:
	taddcc	%g2,	%o6,	%o2
	fpadd32	%f26,	%f4,	%f30
loop_3083:
	andncc	%i4,	%l2,	%g4
loop_3084:
	fbl,a	%fcc3,	loop_3085
	xnor	%l5,	0x0111,	%g6
	tvs	%icc,	0x5
	fpsub32	%f6,	%f0,	%f12
loop_3085:
	fmovdg	%xcc,	%f29,	%f13
	movn	%xcc,	%i1,	%l3
	and	%i5,	%l6,	%g7
	edge16ln	%i6,	%o0,	%l0
	fbe,a	%fcc1,	loop_3086
	andncc	%o7,	%i2,	%g1
	andn	%l1,	0x1D27,	%i7
	edge16	%i0,	%o3,	%g3
loop_3086:
	edge8ln	%o5,	%o4,	%l4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tge	%icc,	0x6
	udiv	%i3,	0x0B8D,	%o1
	movge	%xcc,	%g2,	%o6
	fmovspos	%icc,	%f16,	%f9
	array32	%g5,	%i4,	%o2
	tpos	%xcc,	0x5
	sllx	%l2,	%l5,	%g6
	movcs	%icc,	%g4,	%l3
	brgz,a	%i1,	loop_3087
	fmovrsgz	%i5,	%f20,	%f29
	fsrc2	%f20,	%f2
	movrgez	%g7,	0x0AC,	%i6
loop_3087:
	fpack16	%f24,	%f1
	brlez	%l6,	loop_3088
	tl	%icc,	0x5
	tne	%icc,	0x4
	popc	%l0,	%o0
loop_3088:
	movrne	%o7,	%g1,	%l1
	edge16l	%i2,	%i7,	%o3
	addccc	%i0,	0x165D,	%g3
	srl	%o5,	%o4,	%i3
	udivcc	%o1,	0x10FC,	%l4
	subccc	%o6,	%g5,	%g2
	sethi	0x0D29,	%i4
	wr	%g0,	0x88,	%asi
	ldsha	[%l7 + 0x72] %asi,	%l2
	ba	loop_3089
	udivcc	%l5,	0x1211,	%o2
	mulx	%g4,	%l3,	%i1
	xnor	%g6,	0x1F26,	%g7
loop_3089:
	fbue,a	%fcc3,	loop_3090
	alignaddrl	%i5,	%i6,	%l0
	alignaddrl	%l6,	%o7,	%g1
	set	0x1C, %l1
	lda	[%l7 + %l1] 0x11,	%f0
loop_3090:
	movvs	%icc,	%o0,	%i2
	srl	%l1,	0x1C,	%o3
	sdiv	%i7,	0x0187,	%i0
	fmuld8sux16	%f25,	%f8,	%f4
	xnorcc	%o5,	%o4,	%g3
	array16	%i3,	%l4,	%o6
	umul	%g5,	%o1,	%g2
	stx	%i4,	[%l7 + 0x38]
	fors	%f11,	%f31,	%f12
	fbuge	%fcc1,	loop_3091
	andcc	%l2,	0x0E01,	%o2
	addc	%g4,	0x03F1,	%l3
	bcs,a	%icc,	loop_3092
loop_3091:
	fcmps	%fcc1,	%f16,	%f2
	sdivx	%i1,	0x0B70,	%g6
	srax	%l5,	%g7,	%i5
loop_3092:
	fmovdgu	%xcc,	%f1,	%f23
	array32	%l0,	%l6,	%i6
	movrlez	%g1,	0x39E,	%o7
	fmul8x16au	%f25,	%f2,	%f28
	movneg	%icc,	%i2,	%l1
	tneg	%icc,	0x4
	fmovdcs	%icc,	%f25,	%f27
	brz	%o0,	loop_3093
	move	%xcc,	%i7,	%i0
	xnor	%o5,	0x1E2F,	%o4
	fmul8x16	%f12,	%f20,	%f12
loop_3093:
	nop
	wr	%g0,	0x80,	%asi
	lda	[%l7 + 0x10] %asi,	%f9
	faligndata	%f12,	%f8,	%f14
	subccc	%g3,	0x0A12,	%o3
	for	%f18,	%f0,	%f14
	xor	%i3,	%l4,	%g5
	add	%o6,	0x09B7,	%g2
	fmovdgu	%icc,	%f16,	%f31
	and	%o1,	%i4,	%l2
	fpadd32	%f4,	%f2,	%f12
	fmovrde	%g4,	%f18,	%f6
	umul	%o2,	0x0529,	%i1
	fpack16	%f2,	%f31
	movne	%xcc,	%l3,	%g6
	fbg	%fcc0,	loop_3094
	mulx	%l5,	%g7,	%l0
	prefetch	[%l7 + 0x10],	 0x2
	fbo	%fcc2,	loop_3095
loop_3094:
	sllx	%l6,	0x02,	%i5
	fmovdneg	%xcc,	%f4,	%f29
	subccc	%i6,	%g1,	%i2
loop_3095:
	tne	%icc,	0x0
	subcc	%l1,	%o7,	%i7
	mulscc	%i0,	0x1C21,	%o5
	movpos	%xcc,	%o4,	%o0
	fbo	%fcc1,	loop_3096
	std	%o2,	[%l7 + 0x58]
	fsrc1	%f22,	%f14
	add	%i3,	0x10A7,	%g3
loop_3096:
	mulscc	%g5,	%l4,	%o6
	sir	0x16B2
	bn	%icc,	loop_3097
	move	%xcc,	%g2,	%o1
	fblg	%fcc2,	loop_3098
	array32	%i4,	%l2,	%g4
loop_3097:
	fmovdne	%xcc,	%f17,	%f2
	te	%xcc,	0x0
loop_3098:
	edge8ln	%o2,	%i1,	%g6
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 0:
!
!	Type l   	: 2777
!	Type x   	: 1309
!	Type cti   	: 3098
!	Type f   	: 4488
!	Type i   	: 13328
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


	EXIT_GOOD	/* test finish  */

/************************************************************************
   Test case data start
 ************************************************************************/
.data
user_data_start:
scratch_area:
.word 0x27A27BC3
.word 0x9B08D78B
.word 0x4DF2FFE6
.word 0x547D1F5C
.word 0xB14D42F2
.word 0xA30CC628
.word 0x7524AF68
.word 0x284A95AF
.word 0x2EB058E8
.word 0xE8FD2405
.word 0x0AEB5CD0
.word 0xCC2B70B3
.word 0x55FAF095
.word 0x10D5C00B
.word 0xE41E4355
.word 0xAA10A82B
.word 0x88C2A2E2
.word 0xA20C135B
.word 0x64F84ED1
.word 0x29312DBB
.word 0x49D61D6E
.word 0xBFE6AAA0
.word 0xBF1DA1C7
.word 0x3DCCE0D8
.word 0x9E030B49
.word 0xB161A8FA
.word 0x7F916F82
.word 0xAB0F8207
.word 0xA6FDE9D4
.word 0xC22C93ED
.word 0xB5A2782F
.word 0xA205FC7A
.word 0x4D876E52
.word 0xD16D86FE
.word 0x0D98380E
.word 0x5B7387A2
.word 0x3DFC0EEE
.word 0xB2E2E381
.word 0xD0B17A69
.word 0x7E37DD46
.word 0x2547EB3A
.word 0xEC393D30
.word 0x8A114658
.word 0xA1013E71
.word 0x24082970
.word 0x20797062
.word 0x33C9CB6E
.word 0x5EA9C220
.word 0xFEE19794
.word 0xEFFBDA26
.word 0x125B46AE
.word 0x48C1CB0C
.word 0x24B85E6B
.word 0x38930ECE
.word 0x7EEF01D6
.word 0x5E573999
.word 0x3C747822
.word 0x7A5837C3
.word 0xB1B0387C
.word 0x8537898D
.word 0x590EBB84
.word 0xED16A074
.word 0x76637C3E
.word 0x2D586ACF
.end
