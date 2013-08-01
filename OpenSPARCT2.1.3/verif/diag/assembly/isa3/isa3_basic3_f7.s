/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: isa3_basic3_f7.s
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
.ident "Using Instruction Hash for Focus :$Id: isa3_basic3_f7.s,v 1.1 2007/05/11 17:22:23 drp Exp $"
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
	setx	0x57BDF251805D3E3B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x0]
	ldx	[%l7 + 0x0],	%fsr
!
! Thread 0 Start
!
main_t0:

	!# Initialize registers ..

	!# Global registers
	set	0xE,	%g1
	set	0x6,	%g2
	set	0xA,	%g3
	set	0x3,	%g4
	set	0x3,	%g5
	set	0x5,	%g6
	set	0x9,	%g7
	!# Input registers
	set	-0xA,	%i0
	set	-0x9,	%i1
	set	-0x6,	%i2
	set	-0x0,	%i3
	set	-0xA,	%i4
	set	-0xA,	%i5
	set	-0x6,	%i6
	set	-0x3,	%i7
	!# Local registers
	set	0x4756832E,	%l0
	set	0x0F9339FC,	%l1
	set	0x523AD56F,	%l2
	set	0x776CEBAD,	%l3
	set	0x1CB4BBFC,	%l4
	set	0x6710009A,	%l5
	set	0x3175AE98,	%l6
	!# Output registers
	set	0x19C1,	%o0
	set	-0x116D,	%o1
	set	0x1349,	%o2
	set	0x0DF5,	%o3
	set	0x1D68,	%o4
	set	-0x105E,	%o5
	set	-0x1302,	%o6
	set	-0x0F3E,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x0D46A6E90D1894A4)
	INIT_TH_FP_REG(%l7,%f2,0xF285B01B577762D1)
	INIT_TH_FP_REG(%l7,%f4,0x2E3A261AD580B870)
	INIT_TH_FP_REG(%l7,%f6,0x3142F048868DB8C7)
	INIT_TH_FP_REG(%l7,%f8,0x4404E7880582FF20)
	INIT_TH_FP_REG(%l7,%f10,0x0F5003DF33271DDB)
	INIT_TH_FP_REG(%l7,%f12,0x0E2D6F028D9702D6)
	INIT_TH_FP_REG(%l7,%f14,0xE8A0AF5CC181B9A6)
	INIT_TH_FP_REG(%l7,%f16,0x7D6A843EE3FD7871)
	INIT_TH_FP_REG(%l7,%f18,0xAEA16E2B8A0F9EAF)
	INIT_TH_FP_REG(%l7,%f20,0x18E051511F6B69BA)
	INIT_TH_FP_REG(%l7,%f22,0xBFBADE68D37BE4FA)
	INIT_TH_FP_REG(%l7,%f24,0x5448A85D6EF5EDEA)
	INIT_TH_FP_REG(%l7,%f26,0x10E7F38EAC6F8DDD)
	INIT_TH_FP_REG(%l7,%f28,0x50AE5E4B7C6059BC)
	INIT_TH_FP_REG(%l7,%f30,0x83A6DA60C04DFE4F)
	!# Other state
	
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr


	!# Execute Main Diag ..

	bvs,pn	%icc,	loop_1
	andn	%l2,	%i6,	%i2
	edge16n	%i7,	%g3,	%o0
	std	%l2,	[%l7 + 0x60]
loop_1:
	taddcctv	%o1,	0x17DE,	%o7
	movneg	%icc,	%o2,	%g2
	movrne	%o6,	0x08A,	%o5
	faligndata	%f10,	%f26,	%f18
	wr	%g0,	0x89,	%asi
	lda	[%l7 + 0x14] %asi,	%f8
	array32	%i3,	%o3,	%g7
	subccc	%l0,	0x0C8A,	%g1
	tgu	%xcc,	0x6
	fabsd	%f22,	%f4
	srax	%g4,	%g5,	%g6
	brlz,a	%i1,	loop_2
	tpos	%xcc,	0x6
	alignaddrl	%l5,	%i4,	%i0
	wr	%g0,	0x89,	%asi
	ldsba	[%l7 + 0x22] %asi,	%l4
loop_2:
	move	%xcc,	%l6,	%i5
	brgz,a	%l1,	loop_3
	fmovsneg	%xcc,	%f20,	%f25
	set	0x46, %i5
	lduha	[%l7 + %i5] 0x11,	%l2
loop_3:
	movre	%i6,	%i2,	%o4
	fandnot1s	%f6,	%f27,	%f9
	addccc	%g3,	0x0A4A,	%o0
	fsrc2	%f10,	%f14
	fmul8x16al	%f19,	%f18,	%f6
	subcc	%l3,	%o1,	%o7
	movle	%icc,	%i7,	%o2
	ld	[%l7 + 0x74],	%f27
	addccc	%o6,	%g2,	%o5
	ldx	[%l7 + 0x60],	%o3
	srlx	%g7,	%i3,	%g1
	brgz	%g4,	loop_4
	movvs	%icc,	%g5,	%g6
	fbe,a	%fcc3,	loop_5
	umul	%i1,	%l5,	%l0
loop_4:
	fmovsne	%xcc,	%f0,	%f0
	addcc	%i0,	0x0F78,	%i4
loop_5:
	fmovrdlz	%l6,	%f26,	%f12
	set	0x21, %i4
	ldsba	[%l7 + %i4] 0x80,	%i5
	ldx	[%l7 + 0x38],	%l1
	fbo,a	%fcc1,	loop_6
	udiv	%l4,	0x0477,	%l2
	fcmps	%fcc2,	%f7,	%f26
	tl	%icc,	0x7
loop_6:
	sth	%i2,	[%l7 + 0x64]
	fpsub16	%f28,	%f26,	%f6
	faligndata	%f16,	%f22,	%f12
	sethi	0x1473,	%o4
	edge16ln	%g3,	%o0,	%l3
	movvs	%icc,	%o1,	%o7
	bn	%xcc,	loop_7
	tcc	%icc,	0x0
	fcmpne16	%f16,	%f28,	%i7
	tn	%icc,	0x6
loop_7:
	orcc	%o2,	0x1B1A,	%o6
	fnor	%f24,	%f8,	%f20
	fmovrdne	%g2,	%f4,	%f2
	andn	%i6,	0x08B8,	%o5
	sra	%g7,	%i3,	%o3
	edge32n	%g1,	%g5,	%g6
	fsrc2s	%f11,	%f31
	sethi	0x10B5,	%g4
	fandnot2	%f2,	%f10,	%f6
	edge8ln	%i1,	%l5,	%l0
	nop
	setx	loop_8,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	bpos,a	loop_9
	fsrc1s	%f2,	%f24
	ldx	[%l7 + 0x78],	%i0
loop_8:
	brlez	%i4,	loop_10
loop_9:
	std	%f16,	[%l7 + 0x30]
	set	0x50, %g6
	stxa	%l6,	[%l7 + %g6] 0x2a
	membar	#Sync
loop_10:
	tneg	%xcc,	0x3
	fzeros	%f24
	udiv	%i5,	0x194F,	%l4
	membar	0x5B
	bn,a	%xcc,	loop_11
	addcc	%l2,	%l1,	%o4
	fmovsg	%xcc,	%f26,	%f7
	fnors	%f23,	%f4,	%f11
loop_11:
	bge,a	loop_12
	sub	%g3,	%o0,	%i2
	movl	%icc,	%o1,	%l3
	alignaddr	%o7,	%o2,	%i7
loop_12:
	fornot1	%f16,	%f20,	%f12
	mova	%xcc,	%o6,	%g2
	ldd	[%l7 + 0x70],	%o4
	addcc	%i6,	0x195C,	%g7
	udivx	%o3,	0x1BF7,	%g1
	movleu	%xcc,	%g5,	%g6
	te	%icc,	0x2
	subccc	%g4,	0x114B,	%i3
	addcc	%l5,	%l0,	%i0
	tn	%xcc,	0x3
	movg	%icc,	%i4,	%l6
	fpsub16s	%f28,	%f27,	%f7
	srax	%i5,	%i1,	%l4
	mulscc	%l1,	0x181D,	%l2
	tn	%icc,	0x2
	edge16l	%o4,	%g3,	%o0
	fpadd16	%f6,	%f22,	%f20
	fmul8ulx16	%f10,	%f2,	%f28
	mova	%xcc,	%i2,	%o1
	ldd	[%l7 + 0x08],	%f22
	sethi	0x1EAA,	%l3
	fbn	%fcc0,	loop_13
	fmovs	%f28,	%f19
	edge16	%o7,	%o2,	%o6
	andn	%g2,	%o5,	%i7
loop_13:
	movvc	%icc,	%i6,	%o3
	fpsub32	%f16,	%f28,	%f0
	ble,a	%icc,	loop_14
	movn	%xcc,	%g1,	%g7
	movge	%icc,	%g6,	%g5
	wr	%g0,	0x89,	%asi
	ldstuba	[%l7 + 0x3F] %asi,	%i3
loop_14:
	movgu	%xcc,	%l5,	%g4
	sll	%l0,	0x1C,	%i0
	wr	%g0,	0x0c,	%asi
	lduwa	[%l7 + 0x48] %asi,	%l6
	popc	%i4,	%i5
	movgu	%xcc,	%l4,	%i1
	brz	%l2,	loop_15
	edge8l	%l1,	%o4,	%o0
	addcc	%i2,	%o1,	%l3
	fba,a	%fcc3,	loop_16
loop_15:
	sllx	%g3,	0x19,	%o2
	ta	%xcc,	0x3
	fsrc1	%f6,	%f8
loop_16:
	fmovscs	%xcc,	%f4,	%f16
	addccc	%o6,	0x123A,	%g2
	alignaddr	%o5,	%o7,	%i6
	fmovrde	%i7,	%f22,	%f28
	bge	loop_17
	edge32ln	%g1,	%o3,	%g7
	fmovde	%xcc,	%f29,	%f25
	tle	%icc,	0x3
loop_17:
	ble,a	loop_18
	fnor	%f18,	%f14,	%f30
	or	%g5,	%g6,	%l5
	fornot1	%f14,	%f18,	%f2
loop_18:
	tl	%icc,	0x5
	membar	0x2B
	set	0x75, %o4
	lduba	[%l7 + %o4] 0x80,	%i3
	xnorcc	%l0,	0x0C51,	%i0
	movn	%icc,	%l6,	%i4
	movcs	%xcc,	%i5,	%l4
	addc	%g4,	0x0410,	%l2
	set	0x5A, %o0
	ldsba	[%l7 + %o0] 0x0c,	%l1
	movle	%icc,	%o4,	%o0
	ba,a	%xcc,	loop_19
	addc	%i1,	%o1,	%i2
	bn,a,pt	%xcc,	loop_20
	tle	%xcc,	0x0
loop_19:
	sethi	0x0F3D,	%l3
	fbuge,a	%fcc2,	loop_21
loop_20:
	subc	%g3,	0x0E85,	%o2
	bleu,a,pn	%xcc,	loop_22
	movvc	%xcc,	%g2,	%o5
loop_21:
	tsubcc	%o7,	0x0E66,	%o6
	tne	%icc,	0x7
loop_22:
	sub	%i6,	0x0680,	%g1
	andn	%i7,	0x1285,	%g7
	xnorcc	%g5,	%o3,	%g6
	ldd	[%l7 + 0x68],	%i2
	fblg,a	%fcc0,	loop_23
	tgu	%xcc,	0x7
	movl	%xcc,	%l5,	%i0
	popc	0x0C0E,	%l0
loop_23:
	tgu	%xcc,	0x5
	fcmpne32	%f20,	%f8,	%i4
	move	%icc,	%l6,	%l4
	sdivx	%i5,	0x018D,	%g4
	sra	%l2,	0x14,	%l1
	subcc	%o0,	%o4,	%o1
	fmovsge	%icc,	%f19,	%f24
	fbge,a	%fcc1,	loop_24
	or	%i1,	0x0D21,	%i2
	movg	%xcc,	%l3,	%g3
	set	0x28, %l5
	ldxa	[%l7 + %l5] 0x04,	%o2
loop_24:
	tcs	%xcc,	0x4
	fba	%fcc0,	loop_25
	sll	%g2,	0x02,	%o5
	tpos	%icc,	0x4
	bleu	loop_26
loop_25:
	tn	%icc,	0x1
	fcmped	%fcc3,	%f28,	%f2
	edge8	%o7,	%o6,	%g1
loop_26:
	fmovdcs	%xcc,	%f5,	%f17
	ldsw	[%l7 + 0x5C],	%i7
	umul	%g7,	%i6,	%o3
	alignaddr	%g5,	%i3,	%l5
	fmovrdgz	%g6,	%f4,	%f18
	xor	%i0,	%l0,	%i4
	movrgz	%l4,	0x02F,	%l6
	sth	%g4,	[%l7 + 0x7E]
	fmuld8sux16	%f16,	%f29,	%f0
	set	0x08, %l1
	prefetcha	[%l7 + %l1] 0x18,	 0x3
	movrgz	%l2,	%o0,	%l1
	stbar
	brlez,a	%o4,	loop_27
	fmovscs	%xcc,	%f0,	%f0
	tg	%xcc,	0x6
	set	0x60, %g2
	lduwa	[%l7 + %g2] 0x0c,	%o1
loop_27:
	sub	%i1,	0x0BEE,	%l3
	nop
	set	0x18, %i3
	std	%f22,	[%l7 + %i3]
	be,pt	%icc,	loop_28
	movvs	%xcc,	%g3,	%i2
	subcc	%o2,	%g2,	%o5
	fornot2	%f28,	%f20,	%f10
loop_28:
	mulscc	%o6,	%g1,	%o7
	andncc	%g7,	%i7,	%o3
	set	0x70, %i2
	prefetcha	[%l7 + %i2] 0x18,	 0x3
	fbg	%fcc3,	loop_29
	edge32	%i6,	%i3,	%l5
	fmovsa	%icc,	%f20,	%f26
	fbn	%fcc1,	loop_30
loop_29:
	movcs	%xcc,	%i0,	%l0
	ldsh	[%l7 + 0x4E],	%g6
	edge16l	%l4,	%i4,	%l6
loop_30:
	fmovse	%xcc,	%f26,	%f3
	sir	0x1170
	bgu,a,pt	%icc,	loop_31
	tn	%xcc,	0x7
	nop
	setx	loop_32,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fcmple16	%f14,	%f18,	%g4
loop_31:
	fmovscc	%icc,	%f31,	%f24
	edge32n	%i5,	%o0,	%l2
loop_32:
	tle	%icc,	0x2
	udivcc	%l1,	0x0831,	%o1
	tvc	%xcc,	0x3
	fbuge,a	%fcc2,	loop_33
	andncc	%i1,	%l3,	%g3
	lduh	[%l7 + 0x7A],	%i2
	srlx	%o2,	0x19,	%o4
loop_33:
	fcmpgt32	%f18,	%f4,	%g2
	xorcc	%o5,	0x1579,	%g1
	movrlez	%o7,	%g7,	%o6
	set	0x58, %g5
	stxa	%o3,	[%l7 + %g5] 0x15
	fmovrsgz	%g5,	%f26,	%f13
	fcmpd	%fcc2,	%f0,	%f2
	edge32ln	%i7,	%i3,	%l5
	set	0x40, %i7
	stda	%f0,	[%l7 + %i7] 0x10
	sdiv	%i0,	0x0EC7,	%l0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x40, %l0
	ldda	[%l7 + %l0] 0x10,	%f16
	movrlez	%g6,	0x207,	%l4
	brz	%i6,	loop_34
	ldd	[%l7 + 0x20],	%f14
	fcmple16	%f0,	%f0,	%i4
	bneg,pt	%xcc,	loop_35
loop_34:
	sll	%l6,	%i5,	%g4
	wr	%g0,	0x80,	%asi
	stwa	%l2,	[%l7 + 0x70] %asi
loop_35:
	bg,pn	%xcc,	loop_36
	fmovda	%xcc,	%f19,	%f3
	subcc	%l1,	%o0,	%o1
	swap	[%l7 + 0x68],	%l3
loop_36:
	array32	%i1,	%i2,	%g3
	array8	%o2,	%o4,	%g2
	bne,a,pn	%icc,	loop_37
	movneg	%icc,	%o5,	%o7
	fmovdle	%xcc,	%f5,	%f17
	orcc	%g7,	0x09D2,	%g1
loop_37:
	fcmpgt32	%f26,	%f30,	%o6
	wr	%g0,	0x0c,	%asi
	lda	[%l7 + 0x74] %asi,	%f11
	wr	%g0,	0x80,	%asi
	lduwa	[%l7 + 0x20] %asi,	%g5
	addccc	%o3,	0x0171,	%i3
	for	%f12,	%f0,	%f6
	andncc	%i7,	%i0,	%l0
	movrgez	%g6,	%l4,	%i6
	fbl	%fcc0,	loop_38
	bneg,a	loop_39
	fxors	%f29,	%f17,	%f15
	taddcc	%i4,	0x1360,	%l6
loop_38:
	edge32n	%i5,	%l5,	%g4
loop_39:
	edge32	%l2,	%o0,	%l1
	tle	%icc,	0x0
	fpadd32s	%f17,	%f25,	%f26
	wr	%g0,	0x80,	%asi
	lda	[%l7 + 0x74] %asi,	%f2
	tne	%icc,	0x0
	fmovs	%f2,	%f23
	edge8ln	%o1,	%i1,	%i2
	tge	%icc,	0x6
	udiv	%l3,	0x0A02,	%g3
	set	0x50, %i1
	ldda	[%l7 + %i1] 0x24,	%o2
	stbar
	nop
	setx loop_40, %l0, %l1
	jmpl %l1, %g2
	tvs	%icc,	0x4
	movne	%xcc,	%o4,	%o5
	orcc	%g7,	%g1,	%o6
loop_40:
	nop
	set	0x74, %i6
	stwa	%g5,	[%l7 + %i6] 0x2a
	membar	#Sync
	array32	%o3,	%i3,	%o7
	fcmpgt32	%f18,	%f4,	%i0
	add	%l0,	%g6,	%i7
	andcc	%i6,	0x0402,	%i4
	movre	%l4,	%l6,	%l5
	edge32n	%i5,	%g4,	%o0
	edge32ln	%l1,	%l2,	%i1
	orncc	%i2,	%l3,	%g3
	edge8	%o2,	%o1,	%g2
	fmul8sux16	%f28,	%f4,	%f20
	mulx	%o4,	0x1B1B,	%g7
	taddcctv	%o5,	0x0D6C,	%o6
	fmovda	%icc,	%f23,	%f28
	ldsb	[%l7 + 0x0F],	%g1
	fornot1s	%f19,	%f30,	%f22
	movn	%icc,	%g5,	%o3
	umulcc	%i3,	0x1980,	%i0
	fmovdgu	%icc,	%f14,	%f19
	orncc	%o7,	0x0ED8,	%g6
	movre	%i7,	%i6,	%l0
	movrgez	%i4,	%l6,	%l5
	fmul8x16au	%f30,	%f6,	%f24
	fmovrsgez	%i5,	%f15,	%f21
	movre	%g4,	%l4,	%l1
	tpos	%xcc,	0x4
	tle	%icc,	0x0
	set	0x38, %o2
	sta	%f20,	[%l7 + %o2] 0x15
	edge8n	%o0,	%i1,	%i2
	sir	0x0791
	fpmerge	%f5,	%f21,	%f22
	subcc	%l2,	%g3,	%o2
	tvs	%icc,	0x0
	tleu	%xcc,	0x0
	tleu	%icc,	0x0
	udivx	%o1,	0x1F8F,	%g2
	call	loop_41
	bvs,a	%xcc,	loop_42
	fmovsneg	%xcc,	%f24,	%f13
	fmovrdgz	%l3,	%f28,	%f6
loop_41:
	tvs	%icc,	0x5
loop_42:
	fbue,a	%fcc2,	loop_43
	ldx	[%l7 + 0x10],	%o4
	fbne,a	%fcc2,	loop_44
	edge8	%o5,	%o6,	%g7
loop_43:
	swap	[%l7 + 0x30],	%g1
	xor	%o3,	0x0824,	%i3
loop_44:
	nop
	set	0x28, %g4
	lduha	[%l7 + %g4] 0x80,	%g5
	tle	%xcc,	0x2
	srl	%i0,	%g6,	%i7
	movrlez	%i6,	0x028,	%l0
	bgu,pn	%xcc,	loop_45
	fmovdleu	%xcc,	%f25,	%f8
	fmovdgu	%xcc,	%f14,	%f21
	set	0x20, %o6
	stha	%o7,	[%l7 + %o6] 0xea
	membar	#Sync
loop_45:
	fmovsvc	%icc,	%f31,	%f24
	xor	%l6,	%l5,	%i5
	udivx	%g4,	0x0B94,	%i4
	tneg	%icc,	0x5
	siam	0x3
	fmovdg	%xcc,	%f29,	%f22
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fsrc1	%f10,	%f28
	addccc	%l4,	%l1,	%o0
	wr	%g0,	0x88,	%asi
	stba	%i1,	[%l7 + 0x4C] %asi
	ta	%xcc,	0x6
	brgz,a	%l2,	loop_46
	sdiv	%i2,	0x0F3D,	%o2
	fmovsge	%icc,	%f23,	%f22
	addcc	%o1,	%g2,	%l3
loop_46:
	nop
	wr	%g0,	0x22,	%asi
	stxa	%o4,	[%l7 + 0x08] %asi
	membar	#Sync
	stb	%g3,	[%l7 + 0x5D]
	edge32ln	%o6,	%g7,	%o5
	edge32l	%g1,	%o3,	%i3
	alignaddr	%g5,	%i0,	%g6
	wr	%g0,	0x23,	%asi
	ldda	[%l7 + 0x50] %asi,	%i6
	mova	%xcc,	%l0,	%o7
	tvs	%icc,	0x5
	alignaddr	%l6,	%i6,	%i5
	movrlez	%l5,	0x29B,	%g4
	nop
	setx	loop_47,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	edge32ln	%l4,	%i4,	%l1
	edge32n	%i1,	%l2,	%i2
	movvc	%icc,	%o2,	%o1
loop_47:
	nop
	wr	%g0,	0x89,	%asi
	ldswa	[%l7 + 0x10] %asi,	%o0
	set	0x48, %g7
	prefetcha	[%l7 + %g7] 0x14,	 0x1
	sdiv	%l3,	0x1183,	%o4
	fzeros	%f8
	fmovrslez	%g3,	%f28,	%f2
	srlx	%g7,	%o5,	%o6
	tneg	%xcc,	0x7
	sdivx	%o3,	0x1D61,	%i3
	call	loop_48
	bn	%icc,	loop_49
	srlx	%g1,	%g5,	%i0
	add	%g6,	0x0282,	%i7
loop_48:
	nop
	set	0x75, %o1
	lduba	[%l7 + %o1] 0x88,	%l0
loop_49:
	edge8n	%o7,	%l6,	%i6
	nop
	set	0x5D, %l2
	ldsb	[%l7 + %l2],	%l5
	fmovsneg	%xcc,	%f7,	%f14
	tsubcc	%g4,	%l4,	%i4
	fmovse	%xcc,	%f14,	%f25
	st	%f2,	[%l7 + 0x2C]
	array32	%i5,	%l1,	%i1
	orncc	%l2,	0x05C8,	%i2
	fbue,a	%fcc0,	loop_50
	bg	%icc,	loop_51
	fmovdle	%xcc,	%f26,	%f11
	wr	%g0,	0x80,	%asi
	lduba	[%l7 + 0x67] %asi,	%o1
loop_50:
	fxnor	%f26,	%f10,	%f20
loop_51:
	fmovsle	%icc,	%f29,	%f28
	popc	0x1123,	%o2
	movrne	%g2,	0x167,	%o0
	fcmple32	%f20,	%f26,	%o4
	movgu	%icc,	%g3,	%l3
	siam	0x0
	fpsub32s	%f8,	%f16,	%f2
	addccc	%o5,	%o6,	%o3
	swap	[%l7 + 0x28],	%i3
	sdivx	%g1,	0x1A5C,	%g5
	bg,a,pt	%xcc,	loop_52
	ldstub	[%l7 + 0x7B],	%i0
	set	0x19, %o7
	ldsba	[%l7 + %o7] 0x19,	%g6
loop_52:
	srlx	%g7,	0x1E,	%i7
	edge8	%o7,	%l0,	%l6
	sdiv	%l5,	0x1408,	%i6
	edge8l	%g4,	%i4,	%l4
	movvs	%icc,	%i5,	%l1
	nop
	set	0x0C, %l6
	ldsh	[%l7 + %l6],	%i1
	bcs,a,pn	%xcc,	loop_53
	stw	%l2,	[%l7 + 0x5C]
	edge16ln	%i2,	%o2,	%o1
	orn	%o0,	0x142A,	%o4
loop_53:
	movgu	%xcc,	%g2,	%g3
	bg	%xcc,	loop_54
	edge16ln	%o5,	%l3,	%o6
	smul	%i3,	0x0094,	%g1
	addccc	%g5,	%i0,	%o3
loop_54:
	subccc	%g6,	%g7,	%i7
	bneg,a	%xcc,	loop_55
	umulcc	%o7,	%l0,	%l5
	array32	%l6,	%i6,	%i4
	udivcc	%l4,	0x05AC,	%i5
loop_55:
	movrlez	%l1,	%i1,	%l2
	tge	%icc,	0x2
	fmovdvs	%xcc,	%f26,	%f28
	fmovdleu	%xcc,	%f18,	%f5
	tneg	%xcc,	0x4
	movn	%icc,	%i2,	%o2
	move	%icc,	%g4,	%o0
	brnz	%o1,	loop_56
	bvc,a,pn	%xcc,	loop_57
	fbug,a	%fcc0,	loop_58
	umul	%g2,	%g3,	%o4
loop_56:
	stbar
loop_57:
	std	%f30,	[%l7 + 0x08]
loop_58:
	alignaddr	%o5,	%l3,	%o6
	tsubcctv	%i3,	0x1AEE,	%g5
	tleu	%xcc,	0x5
	umulcc	%i0,	%g1,	%o3
	orcc	%g7,	%g6,	%i7
	tn	%xcc,	0x5
	fands	%f8,	%f31,	%f23
	fand	%f12,	%f26,	%f26
	be,a,pt	%icc,	loop_59
	movrne	%o7,	0x00E,	%l5
	and	%l6,	%i6,	%i4
	sllx	%l4,	0x14,	%l0
loop_59:
	orncc	%i5,	%l1,	%l2
	edge32l	%i1,	%o2,	%i2
	std	%g4,	[%l7 + 0x18]
	movleu	%xcc,	%o1,	%g2
	movle	%icc,	%o0,	%g3
	set	0x08, %o5
	ldswa	[%l7 + %o5] 0x0c,	%o4
	fmovsneg	%xcc,	%f29,	%f12
	edge16l	%o5,	%o6,	%l3
	array8	%i3,	%g5,	%i0
	tpos	%icc,	0x0
	movleu	%icc,	%o3,	%g1
	subccc	%g6,	0x170C,	%i7
	subccc	%o7,	%g7,	%l5
	set	0x41, %g1
	lduba	[%l7 + %g1] 0x04,	%l6
	fexpand	%f19,	%f12
	fmul8ulx16	%f24,	%f22,	%f4
	movpos	%xcc,	%i4,	%i6
	ldd	[%l7 + 0x08],	%f30
	movge	%icc,	%l0,	%i5
	fble,a	%fcc3,	loop_60
	fcmps	%fcc3,	%f4,	%f20
	edge16n	%l1,	%l4,	%i1
	movg	%xcc,	%l2,	%i2
loop_60:
	for	%f6,	%f20,	%f14
	umul	%o2,	0x0094,	%g4
	subccc	%o1,	%g2,	%g3
	wr	%g0,	0x89,	%asi
	ldsba	[%l7 + 0x09] %asi,	%o0
	edge8ln	%o4,	%o5,	%l3
	ta	%icc,	0x3
	addccc	%i3,	%o6,	%i0
	tg	%icc,	0x4
	taddcctv	%o3,	%g5,	%g1
	tl	%xcc,	0x2
	bpos,pn	%xcc,	loop_61
	tge	%icc,	0x7
	wr	%g0,	0x19,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
loop_61:
	movl	%icc,	%i7,	%g6
	fmovs	%f9,	%f27
	orn	%o7,	%g7,	%l5
	alignaddrl	%l6,	%i4,	%l0
	tl	%icc,	0x2
	movge	%icc,	%i5,	%i6
	wr	%g0,	0x10,	%asi
	ldsha	[%l7 + 0x38] %asi,	%l1
	alignaddrl	%l4,	%l2,	%i1
	fmovsvs	%icc,	%f16,	%f0
	fmovdvc	%xcc,	%f16,	%f20
	tg	%icc,	0x5
	tcc	%xcc,	0x7
	brz,a	%i2,	loop_62
	bgu	%icc,	loop_63
	call	loop_64
	stx	%o2,	[%l7 + 0x28]
loop_62:
	orn	%g4,	0x0DB9,	%g2
loop_63:
	addc	%o1,	0x1845,	%o0
loop_64:
	nop
	wr	%g0,	0x0c,	%asi
	swapa	[%l7 + 0x38] %asi,	%g3
	alignaddr	%o5,	%l3,	%o4
	fxnors	%f11,	%f19,	%f30
	tpos	%icc,	0x7
	subc	%i3,	%i0,	%o3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpsub32	%f2,	%f20,	%f14
	movrne	%g5,	%o6,	%i7
	fzero	%f0
	swap	[%l7 + 0x7C],	%g1
	fornot2s	%f27,	%f16,	%f27
	sub	%o7,	%g7,	%g6
	add	%l7,	0x2C,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] %asi,	%l5,	%l6
	add	%i4,	0x0136,	%i5
	stx	%l0,	[%l7 + 0x40]
	orncc	%l1,	%l4,	%l2
	or	%i1,	%i2,	%i6
	fbuge,a	%fcc0,	loop_65
	lduw	[%l7 + 0x7C],	%o2
	sdivx	%g2,	0x1771,	%o1
	brlz	%g4,	loop_66
loop_65:
	andcc	%g3,	0x0EE4,	%o0
	std	%l2,	[%l7 + 0x58]
	movne	%icc,	%o4,	%i3
loop_66:
	swap	[%l7 + 0x0C],	%i0
	mulscc	%o3,	%o5,	%o6
	fbne,a	%fcc3,	loop_67
	sethi	0x15DA,	%i7
	set	0x3F, %g3
	stba	%g5,	[%l7 + %g3] 0x18
loop_67:
	fmovdgu	%xcc,	%f23,	%f7
	sdivcc	%o7,	0x11E7,	%g1
	fnot1	%f30,	%f6
	tsubcc	%g7,	%l5,	%g6
	edge16n	%l6,	%i4,	%l0
	prefetch	[%l7 + 0x2C],	 0x3
	tvc	%xcc,	0x5
	fmovrsgz	%i5,	%f23,	%f14
	tpos	%xcc,	0x3
	addcc	%l4,	0x1627,	%l1
	fornot2s	%f29,	%f26,	%f16
	tl	%xcc,	0x6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8	%i1,	%i2,	%l2
	fcmps	%fcc2,	%f5,	%f24
	srlx	%i6,	%o2,	%o1
	fnand	%f4,	%f24,	%f8
	tge	%icc,	0x6
	bvc	%xcc,	loop_68
	ldsw	[%l7 + 0x5C],	%g4
	sth	%g2,	[%l7 + 0x78]
	addcc	%o0,	0x18A1,	%l3
loop_68:
	sll	%g3,	0x0D,	%o4
	sllx	%i3,	0x08,	%i0
	bg,a	loop_69
	movrgez	%o5,	%o6,	%i7
	fexpand	%f4,	%f18
	wr	%g0,	0x80,	%asi
	ldxa	[%l7 + 0x48] %asi,	%g5
loop_69:
	nop
	set	0x17, %l4
	ldstuba	[%l7 + %l4] 0x11,	%o3
	orncc	%o7,	0x0367,	%g7
	edge16n	%g1,	%g6,	%l6
	fbuge,a	%fcc1,	loop_70
	sllx	%i4,	0x14,	%l0
	tleu	%icc,	0x5
	set	0x2C, %l3
	lduha	[%l7 + %l3] 0x88,	%i5
loop_70:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bvs,a,pn	%xcc,	loop_71
	ldsh	[%l7 + 0x68],	%l4
	fmovsl	%icc,	%f17,	%f16
	movrlz	%l5,	0x064,	%i1
loop_71:
	tn	%xcc,	0x1
	or	%l1,	0x1514,	%i2
	or	%i6,	0x0ADF,	%o2
	fands	%f11,	%f2,	%f18
	srax	%o1,	%g4,	%g2
	fmovscs	%icc,	%f12,	%f18
	alignaddr	%l2,	%o0,	%g3
	wr	%g0,	0x04,	%asi
	stha	%l3,	[%l7 + 0x46] %asi
	tcs	%icc,	0x5
	ld	[%l7 + 0x5C],	%f12
	tg	%xcc,	0x0
	subc	%i3,	0x0EC3,	%i0
	edge16ln	%o5,	%o6,	%i7
	fmovrslz	%g5,	%f5,	%f11
	bcc,a,pt	%icc,	loop_72
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udiv	%o4,	0x0B2E,	%o3
	mova	%icc,	%o7,	%g7
loop_72:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tcs	%xcc,	0x1
	movg	%xcc,	%g1,	%l6
	fcmped	%fcc2,	%f28,	%f0
	tgu	%xcc,	0x7
	fmovdcc	%xcc,	%f2,	%f16
	sdivx	%i4,	0x1104,	%l0
	fmovsge	%icc,	%f15,	%f8
	and	%g6,	%i5,	%l5
	tl	%xcc,	0x7
	bvs	%xcc,	loop_73
	fcmpeq32	%f10,	%f24,	%l4
	udivx	%l1,	0x095F,	%i1
	fnegd	%f26,	%f2
loop_73:
	fbo,a	%fcc2,	loop_74
	bleu,pn	%xcc,	loop_75
	fbge	%fcc3,	loop_76
	edge8l	%i6,	%i2,	%o2
loop_74:
	edge32	%g4,	%o1,	%g2
loop_75:
	fzeros	%f13
loop_76:
	fands	%f29,	%f15,	%f29
	tcs	%xcc,	0x2
	move	%xcc,	%o0,	%g3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srlx	%l3,	%i3,	%l2
	movrlz	%i0,	%o6,	%i7
	nop
	setx loop_77, %l0, %l1
	jmpl %l1, %g5
	tpos	%icc,	0x0
	fpsub32s	%f6,	%f12,	%f2
	xnor	%o4,	0x1E4F,	%o3
loop_77:
	orcc	%o7,	%g7,	%g1
	tle	%xcc,	0x6
	nop
	set	0x78, %i0
	ldsh	[%l7 + %i0],	%l6
	set	0x10, %o3
	ldxa	[%g0 + %o3] 0x4f,	%i4
	popc	%l0,	%o5
	tle	%xcc,	0x2
	fors	%f4,	%f27,	%f5
	fornot2	%f10,	%f26,	%f30
	fpsub16s	%f11,	%f25,	%f17
	taddcc	%g6,	0x0771,	%l5
	edge16l	%l4,	%l1,	%i5
	fbue	%fcc3,	loop_78
	fabsd	%f24,	%f20
	movle	%icc,	%i1,	%i6
	stx	%o2,	[%l7 + 0x20]
loop_78:
	fblg	%fcc0,	loop_79
	fmovrse	%g4,	%f2,	%f10
	tneg	%icc,	0x5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_79:
	bvs,pt	%icc,	loop_80
	movpos	%xcc,	%i2,	%o1
	edge8l	%o0,	%g2,	%l3
	edge16	%i3,	%g3,	%l2
loop_80:
	sra	%o6,	0x0C,	%i7
	orn	%g5,	0x0891,	%i0
	bleu	loop_81
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrgz	%o3,	%o7,	%o4
	tne	%xcc,	0x4
loop_81:
	bgu,a	%xcc,	loop_82
	tvc	%xcc,	0x3
	fsrc1	%f4,	%f18
	fmovsvc	%xcc,	%f2,	%f10
loop_82:
	fsrc1	%f8,	%f10
	movrgz	%g1,	0x1F3,	%g7
	fmovrdgz	%i4,	%f12,	%f6
	fmovsvs	%icc,	%f2,	%f10
	tle	%icc,	0x4
	fpsub32s	%f20,	%f19,	%f12
	edge16n	%l6,	%o5,	%g6
	wr	%g0,	0x4f,	%asi
	ldxa	[%g0 + 0x38] %asi,	%l5
	fpadd16s	%f20,	%f8,	%f4
	bcs,a,pn	%xcc,	loop_83
	subccc	%l0,	0x12D1,	%l4
	wr	%g0,	0x11,	%asi
	lduwa	[%l7 + 0x7C] %asi,	%l1
loop_83:
	fmovsn	%xcc,	%f3,	%f9
	movre	%i5,	0x201,	%i6
	movvc	%xcc,	%i1,	%g4
	edge32l	%i2,	%o2,	%o1
	xorcc	%o0,	%l3,	%i3
	popc	0x0B3D,	%g3
	sir	0x1171
	membar	#Sync
	set	0x40, %i4
	ldda	[%l7 + %i4] 0x16,	%f0
	fzero	%f4
	prefetch	[%l7 + 0x2C],	 0x3
	wr	%g0,	0x11,	%asi
	lduha	[%l7 + 0x26] %asi,	%l2
	sdivx	%o6,	0x0AFC,	%i7
	tsubcctv	%g2,	%g5,	%i0
	fand	%f14,	%f28,	%f16
	edge16	%o3,	%o4,	%o7
	srl	%g7,	%i4,	%l6
	add	%l7,	0x68,	%l6
	wr	%g0,	0x0c,	%asi
	casxa	[%l6] %asi,	%g1,	%o5
	tsubcctv	%g6,	0x121D,	%l5
	bneg,a,pn	%xcc,	loop_84
	fcmpne16	%f0,	%f12,	%l0
	tle	%xcc,	0x3
	add	%l1,	0x014C,	%i5
loop_84:
	movrlz	%i6,	0x0DB,	%l4
	tvc	%xcc,	0x1
	fbn	%fcc3,	loop_85
	bcs,a,pt	%xcc,	loop_86
	movvs	%icc,	%i1,	%i2
	movpos	%icc,	%o2,	%g4
loop_85:
	udiv	%o1,	0x0610,	%o0
loop_86:
	array8	%i3,	%g3,	%l2
	movn	%icc,	%l3,	%o6
	or	%g2,	0x0D34,	%g5
	set	0x70, %i5
	prefetcha	[%l7 + %i5] 0x89,	 0x1
	ldd	[%l7 + 0x18],	%o2
	fmul8x16au	%f28,	%f30,	%f30
	ldd	[%l7 + 0x58],	%f14
	movgu	%icc,	%i0,	%o7
	fmovrde	%g7,	%f16,	%f14
	or	%o4,	0x1649,	%l6
	movcc	%icc,	%i4,	%g1
	fbne	%fcc0,	loop_87
	edge8	%o5,	%g6,	%l0
	fmovdg	%xcc,	%f13,	%f20
	tleu	%xcc,	0x1
loop_87:
	movvs	%xcc,	%l1,	%l5
	fxnors	%f0,	%f1,	%f25
	movneg	%icc,	%i5,	%i6
	movre	%l4,	0x2A5,	%i2
	fmovsg	%icc,	%f16,	%f4
	sir	0x13EF
	fabss	%f30,	%f12
	ldub	[%l7 + 0x2A],	%i1
	andcc	%g4,	%o2,	%o0
	movcs	%xcc,	%i3,	%g3
	fxors	%f10,	%f12,	%f11
	ldub	[%l7 + 0x0A],	%o1
	st	%f20,	[%l7 + 0x38]
	fnot1	%f4,	%f10
	fmovspos	%xcc,	%f15,	%f17
	fbne,a	%fcc2,	loop_88
	fnegd	%f0,	%f30
	ta	%icc,	0x0
	fornot2	%f2,	%f18,	%f18
loop_88:
	nop
	wr	%g0,	0x04,	%asi
	sta	%f17,	[%l7 + 0x7C] %asi
	ldub	[%l7 + 0x33],	%l3
	movrlz	%l2,	0x3D6,	%o6
	movl	%icc,	%g5,	%i7
	set	0x60, %g6
	ldda	[%l7 + %g6] 0x2a,	%o2
	set	0x28, %o4
	stda	%i0,	[%l7 + %o4] 0x80
	ldd	[%l7 + 0x40],	%g2
	sdiv	%g7,	0x1C3F,	%o7
	wr	%g0,	0x88,	%asi
	prefetcha	[%l7 + 0x30] %asi,	 0x3
	taddcc	%i4,	0x06B8,	%g1
	movrgez	%o5,	%g6,	%o4
	xnor	%l1,	0x1AF3,	%l5
	fornot2s	%f26,	%f3,	%f19
	fand	%f20,	%f0,	%f22
	fmovscs	%xcc,	%f15,	%f30
	edge8	%i5,	%l0,	%l4
	set	0x128, %o0
	nop 	! 	nop 	! 	ldxa	[%g0 + %o0] 0x40,	%i6 ripped by fixASI40.pl ripped by fixASI40.pl
	umul	%i2,	%g4,	%o2
	bleu,a,pn	%icc,	loop_89
	ldsh	[%l7 + 0x22],	%o0
	movrne	%i1,	%i3,	%o1
	smulcc	%g3,	%l2,	%o6
loop_89:
	tcc	%xcc,	0x6
	fmovd	%f16,	%f2
	andn	%l3,	0x1DD8,	%i7
	tgu	%xcc,	0x2
	edge8n	%o3,	%g5,	%i0
	bvc	%xcc,	loop_90
	be,a,pn	%xcc,	loop_91
	tcs	%xcc,	0x2
	sethi	0x0FC2,	%g7
loop_90:
	umulcc	%g2,	%o7,	%l6
loop_91:
	tg	%icc,	0x7
	wr	%g0,	0x81,	%asi
	lduwa	[%l7 + 0x3C] %asi,	%i4
	srl	%g1,	0x0A,	%o5
	mova	%xcc,	%g6,	%o4
	fmovsvs	%xcc,	%f1,	%f4
	tvc	%xcc,	0x1
	fors	%f30,	%f25,	%f27
	set	0x38, %l5
	sta	%f7,	[%l7 + %l5] 0x89
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	te	%xcc,	0x6
	bl,a,pn	%xcc,	loop_92
	tpos	%xcc,	0x6
	edge16ln	%l5,	%i5,	%l0
	nop
	setx loop_93, %l0, %l1
	jmpl %l1, %l1
loop_92:
	umulcc	%l4,	0x150E,	%i2
	andn	%g4,	%o2,	%o0
	tsubcc	%i6,	0x1D09,	%i1
loop_93:
	fba	%fcc1,	loop_94
	movleu	%xcc,	%o1,	%g3
	edge8	%l2,	%i3,	%o6
	fmovrdlz	%i7,	%f20,	%f0
loop_94:
	tneg	%xcc,	0x3
	fmovdneg	%xcc,	%f5,	%f19
	alignaddr	%l3,	%o3,	%i0
	edge16l	%g7,	%g5,	%o7
	movn	%xcc,	%g2,	%l6
	set	0x40, %g2
	stda	%f16,	[%l7 + %g2] 0x89
	sdiv	%i4,	0x1295,	%g1
	edge8ln	%o5,	%o4,	%g6
	fnand	%f22,	%f20,	%f6
	xnor	%i5,	%l0,	%l1
	wr	%g0,	0x89,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	fbe,a	%fcc0,	loop_95
	movre	%l4,	%l5,	%i2
	ba	loop_96
	and	%g4,	%o0,	%o2
loop_95:
	tn	%icc,	0x7
	movrlz	%i1,	0x114,	%i6
loop_96:
	andn	%o1,	0x1FBF,	%g3
	nop
	setx loop_97, %l0, %l1
	jmpl %l1, %i3
	andcc	%o6,	%l2,	%i7
	move	%icc,	%l3,	%i0
	fbule,a	%fcc2,	loop_98
loop_97:
	edge32	%o3,	%g7,	%g5
	sra	%g2,	%l6,	%o7
	edge16n	%g1,	%o5,	%i4
loop_98:
	nop
	set	0x20, %l1
	sta	%f16,	[%l7 + %l1] 0x10
	wr	%g0,	0x11,	%asi
	lduha	[%l7 + 0x58] %asi,	%g6
	movl	%xcc,	%o4,	%i5
	fnegd	%f10,	%f28
	udivx	%l0,	0x1D27,	%l4
	movgu	%xcc,	%l5,	%l1
	fbule,a	%fcc0,	loop_99
	bne,a,pt	%xcc,	loop_100
	bne	%xcc,	loop_101
	orcc	%g4,	0x0775,	%i2
loop_99:
	andcc	%o0,	%i1,	%i6
loop_100:
	sdivcc	%o2,	0x03E2,	%o1
loop_101:
	tn	%icc,	0x1
	fbu,a	%fcc2,	loop_102
	fmovdvc	%xcc,	%f18,	%f10
	fbe	%fcc3,	loop_103
	edge16	%g3,	%o6,	%i3
loop_102:
	nop
	set	0x40, %i3
	ldswa	[%l7 + %i3] 0x10,	%l2
loop_103:
	fnot2s	%f27,	%f5
	fmovscs	%xcc,	%f3,	%f0
	tge	%icc,	0x4
	tl	%icc,	0x1
	array32	%l3,	%i0,	%i7
	nop
	setx	loop_104,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	orncc	%g7,	0x0C52,	%g5
	fpadd16s	%f7,	%f7,	%f24
	bn,a	%icc,	loop_105
loop_104:
	udivx	%o3,	0x034B,	%g2
	fbue,a	%fcc3,	loop_106
	tle	%xcc,	0x7
loop_105:
	tge	%icc,	0x2
	tne	%xcc,	0x4
loop_106:
	umulcc	%l6,	0x0BB8,	%g1
	fmul8x16	%f16,	%f22,	%f20
	bvc	loop_107
	fcmple16	%f24,	%f20,	%o5
	srlx	%i4,	0x07,	%o7
	tsubcc	%o4,	0x0011,	%i5
loop_107:
	movcs	%xcc,	%l0,	%g6
	fpsub16	%f22,	%f16,	%f8
	sdiv	%l4,	0x0C98,	%l1
	fxors	%f10,	%f18,	%f28
	lduw	[%l7 + 0x44],	%g4
	fbn	%fcc1,	loop_108
	addc	%i2,	0x13D7,	%o0
	mulscc	%l5,	%i6,	%i1
	movcs	%icc,	%o2,	%o1
loop_108:
	tcs	%xcc,	0x3
	tg	%icc,	0x6
	movneg	%icc,	%o6,	%g3
	mulx	%l2,	%i3,	%l3
	addcc	%i7,	0x1E38,	%g7
	subc	%i0,	0x02A6,	%o3
	fcmpeq16	%f24,	%f2,	%g2
	movpos	%icc,	%g5,	%l6
	movvs	%icc,	%o5,	%g1
	nop
	set	0x28, %i2
	ldd	[%l7 + %i2],	%f22
	set	0x44, %i7
	ldsha	[%l7 + %i7] 0x80,	%i4
	fmovsne	%xcc,	%f16,	%f19
	edge32ln	%o4,	%i5,	%l0
	ldsb	[%l7 + 0x68],	%o7
	stb	%g6,	[%l7 + 0x21]
	xor	%l1,	0x15A4,	%g4
	edge16ln	%i2,	%l4,	%l5
	fpsub32	%f4,	%f4,	%f12
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andn	%i6,	%i1,	%o2
	xnor	%o0,	%o6,	%g3
	fmovrslez	%l2,	%f11,	%f10
	fmovsg	%icc,	%f25,	%f22
	fcmpeq32	%f12,	%f6,	%o1
	tneg	%xcc,	0x0
	edge16ln	%l3,	%i3,	%g7
	ldx	[%l7 + 0x10],	%i0
	tgu	%icc,	0x4
	or	%o3,	0x06FA,	%i7
	add	%g2,	%g5,	%l6
	tl	%xcc,	0x4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32ln	%o5,	%i4,	%o4
	movrlez	%g1,	%l0,	%o7
	fmovdl	%icc,	%f30,	%f16
	movl	%xcc,	%g6,	%i5
	sll	%l1,	%g4,	%i2
	tpos	%xcc,	0x6
	orn	%l5,	%l4,	%i6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movne	%icc,	%i1,	%o2
	srlx	%o0,	%g3,	%l2
	tpos	%xcc,	0x5
	movvc	%icc,	%o1,	%l3
	std	%o6,	[%l7 + 0x60]
	bneg,a	%xcc,	loop_109
	add	%i3,	%g7,	%i0
	fandnot2	%f2,	%f14,	%f14
	brgz	%o3,	loop_110
loop_109:
	movge	%xcc,	%g2,	%g5
	taddcctv	%l6,	0x137A,	%o5
	movvs	%icc,	%i4,	%i7
loop_110:
	sdivx	%g1,	0x0A8C,	%l0
	fbo,a	%fcc0,	loop_111
	andncc	%o7,	%g6,	%o4
	ld	[%l7 + 0x3C],	%f11
	tvc	%icc,	0x5
loop_111:
	fabss	%f27,	%f18
	edge16ln	%l1,	%i5,	%i2
	array8	%l5,	%g4,	%l4
	tl	%icc,	0x2
	umulcc	%i1,	0x03E4,	%i6
	fmovrdlz	%o0,	%f10,	%f30
	mulscc	%g3,	0x1BE6,	%l2
	taddcctv	%o1,	0x183C,	%o2
	set	0x40, %g5
	stda	%f0,	[%l7 + %g5] 0x11
	te	%icc,	0x6
	wr	%g0,	0x23,	%asi
	ldda	[%l7 + 0x60] %asi,	%l2
	fcmpgt16	%f28,	%f6,	%i3
	fornot1s	%f15,	%f3,	%f27
	tle	%icc,	0x1
	fmovdn	%icc,	%f8,	%f4
	bge,a	loop_112
	fpsub32s	%f1,	%f18,	%f1
	xnorcc	%o6,	%i0,	%g7
	xorcc	%o3,	0x0B4F,	%g5
loop_112:
	edge32	%g2,	%o5,	%i4
	popc	0x11A6,	%i7
	bneg,pt	%icc,	loop_113
	tpos	%icc,	0x2
	fbug,a	%fcc2,	loop_114
	taddcctv	%g1,	0x1B22,	%l6
loop_113:
	edge8ln	%l0,	%o7,	%o4
	array8	%g6,	%i5,	%l1
loop_114:
	bvs,pt	%xcc,	loop_115
	fble	%fcc2,	loop_116
	fpadd32	%f10,	%f14,	%f22
	add	%l5,	0x174A,	%i2
loop_115:
	nop
	add	%l7,	0x48,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%g4,	%i1
loop_116:
	fsrc2s	%f5,	%f3
	fmovdge	%xcc,	%f12,	%f21
	fmuld8ulx16	%f18,	%f8,	%f12
	set	0x36, %l0
	ldsha	[%l7 + %l0] 0x15,	%i6
	taddcctv	%o0,	0x1BBD,	%g3
	movle	%icc,	%l2,	%l4
	addc	%o2,	%l3,	%i3
	movgu	%xcc,	%o1,	%o6
	fpadd32s	%f27,	%f3,	%f24
	mova	%icc,	%i0,	%g7
	movcs	%icc,	%o3,	%g5
	fbul	%fcc3,	loop_117
	fnot1	%f0,	%f0
	orcc	%o5,	0x0D28,	%i4
	tle	%xcc,	0x0
loop_117:
	tne	%xcc,	0x2
	fbne,a	%fcc3,	loop_118
	edge32ln	%i7,	%g2,	%l6
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x78] %asi,	%g1
loop_118:
	popc	0x05CA,	%o7
	sir	0x0D12
	bleu,pn	%xcc,	loop_119
	edge16ln	%o4,	%g6,	%i5
	brnz,a	%l1,	loop_120
	fmovsvc	%xcc,	%f16,	%f27
loop_119:
	andcc	%l5,	0x01D8,	%l0
	umul	%g4,	0x0B41,	%i2
loop_120:
	fmovdgu	%xcc,	%f12,	%f23
	addccc	%i1,	%o0,	%g3
	array8	%l2,	%i6,	%l4
	tg	%xcc,	0x1
	tn	%xcc,	0x5
	bge,pt	%xcc,	loop_121
	stw	%l3,	[%l7 + 0x40]
	array8	%i3,	%o2,	%o6
	fcmple16	%f2,	%f14,	%i0
loop_121:
	fcmpes	%fcc2,	%f7,	%f10
	fmovdl	%icc,	%f19,	%f17
	sdivcc	%o1,	0x158F,	%o3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	pdist	%f2,	%f18,	%f30
	bvs,a	loop_122
	smulcc	%g5,	%g7,	%o5
	bcs,pt	%icc,	loop_123
	fmovrde	%i7,	%f12,	%f22
loop_122:
	movle	%xcc,	%i4,	%l6
	call	loop_124
loop_123:
	edge8ln	%g1,	%g2,	%o4
	fnands	%f13,	%f15,	%f0
	brlez,a	%o7,	loop_125
loop_124:
	orncc	%g6,	%l1,	%l5
	movpos	%xcc,	%i5,	%g4
	movrgz	%l0,	0x151,	%i2
loop_125:
	array8	%i1,	%g3,	%l2
	mulscc	%i6,	%l4,	%l3
	sra	%i3,	0x00,	%o0
	edge8l	%o2,	%i0,	%o6
	edge16	%o3,	%g5,	%o1
	array16	%g7,	%o5,	%i4
	movcs	%xcc,	%l6,	%i7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fble,a	%fcc2,	loop_126
	edge8l	%g1,	%g2,	%o7
	tn	%xcc,	0x4
	mulx	%g6,	%o4,	%l5
loop_126:
	movvs	%xcc,	%l1,	%g4
	movrne	%l0,	0x2DD,	%i5
	tle	%icc,	0x3
	nop
	set	0x0A, %i1
	lduh	[%l7 + %i1],	%i2
	udivcc	%i1,	0x0B2B,	%g3
	be,a	%xcc,	loop_127
	te	%icc,	0x3
	subc	%l2,	0x1C40,	%l4
	brgz,a	%i6,	loop_128
loop_127:
	tsubcctv	%i3,	0x1835,	%o0
	move	%icc,	%l3,	%i0
	movgu	%xcc,	%o2,	%o3
loop_128:
	fcmpd	%fcc1,	%f6,	%f30
	wr	%g0,	0x22,	%asi
	stwa	%o6,	[%l7 + 0x7C] %asi
	membar	#Sync
	andcc	%g5,	%g7,	%o1
	bl,a,pn	%xcc,	loop_129
	fbne	%fcc2,	loop_130
	fmovdcc	%icc,	%f26,	%f12
	bvs,a	%xcc,	loop_131
loop_129:
	andn	%o5,	%i4,	%l6
loop_130:
	lduw	[%l7 + 0x3C],	%i7
	bpos,a,pn	%xcc,	loop_132
loop_131:
	taddcctv	%g1,	%o7,	%g2
	swap	[%l7 + 0x0C],	%g6
	bne	%icc,	loop_133
loop_132:
	subccc	%o4,	%l5,	%l1
	array16	%g4,	%l0,	%i5
	te	%xcc,	0x6
loop_133:
	nop
	wr	%g0,	0x80,	%asi
	ldsba	[%l7 + 0x35] %asi,	%i1
	xorcc	%g3,	%i2,	%l2
	movrgz	%i6,	%i3,	%o0
	brlz	%l4,	loop_134
	fmovs	%f25,	%f28
	fbuge	%fcc3,	loop_135
	fornot2	%f2,	%f16,	%f2
loop_134:
	subccc	%l3,	%i0,	%o2
	orcc	%o6,	%o3,	%g7
loop_135:
	ta	%icc,	0x7
	fble,a	%fcc2,	loop_136
	tvs	%icc,	0x5
	fbule,a	%fcc1,	loop_137
	movl	%xcc,	%o1,	%o5
loop_136:
	edge8	%g5,	%i4,	%l6
	srl	%i7,	0x13,	%g1
loop_137:
	edge8	%o7,	%g6,	%g2
	xnorcc	%o4,	%l1,	%l5
	srlx	%g4,	0x01,	%l0
	tle	%xcc,	0x4
	movneg	%xcc,	%i1,	%i5
	sdivx	%i2,	0x000F,	%l2
	add	%g3,	0x1C7B,	%i6
	for	%f26,	%f18,	%f4
	umul	%i3,	%l4,	%o0
	alignaddr	%l3,	%i0,	%o6
	fbu	%fcc0,	loop_138
	sra	%o2,	%g7,	%o3
	movvc	%xcc,	%o5,	%g5
	fornot1s	%f15,	%f13,	%f12
loop_138:
	addc	%i4,	%o1,	%i7
	edge8l	%l6,	%o7,	%g6
	edge16	%g2,	%o4,	%l1
	movrne	%g1,	%l5,	%l0
	movn	%xcc,	%i1,	%i5
	fornot1s	%f9,	%f20,	%f29
	add	%l7,	0x24,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] %asi,	%i2,	%l2
	movl	%xcc,	%g3,	%g4
	fmovrsne	%i3,	%f13,	%f24
	ldd	[%l7 + 0x58],	%l4
	bneg,a	loop_139
	movrgez	%o0,	%i6,	%i0
	fmovsn	%icc,	%f27,	%f21
	alignaddr	%o6,	%l3,	%o2
loop_139:
	brlez,a	%g7,	loop_140
	movrgez	%o3,	%o5,	%g5
	smulcc	%i4,	%o1,	%l6
	umulcc	%o7,	0x15CB,	%i7
loop_140:
	movcc	%icc,	%g6,	%o4
	wr	%g0,	0x19,	%asi
	lduba	[%l7 + 0x2C] %asi,	%l1
	fpadd16	%f22,	%f12,	%f22
	alignaddrl	%g1,	%g2,	%l0
	movl	%icc,	%l5,	%i1
	alignaddrl	%i2,	%i5,	%g3
	xnor	%l2,	%i3,	%l4
	sdiv	%o0,	0x1295,	%i6
	sdivcc	%i0,	0x0421,	%o6
	mova	%icc,	%g4,	%o2
	tvs	%icc,	0x0
	fmovrdlz	%l3,	%f28,	%f12
	srl	%o3,	%g7,	%g5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnot1s	%f9,	%f1
	movcc	%icc,	%i4,	%o5
	sllx	%l6,	%o7,	%i7
	fors	%f4,	%f18,	%f23
	tneg	%icc,	0x3
	array8	%g6,	%o4,	%o1
	fnegs	%f15,	%f19
	fmul8x16al	%f20,	%f11,	%f0
	edge32l	%l1,	%g2,	%l0
	fmovrdgez	%g1,	%f24,	%f10
	fcmple32	%f14,	%f12,	%i1
	fnor	%f4,	%f6,	%f20
	wr	%g0,	0x19,	%asi
	prefetcha	[%l7 + 0x20] %asi,	 0x0
	orcc	%i5,	%g3,	%l2
	brz	%i3,	loop_141
	srax	%l5,	0x08,	%l4
	sll	%o0,	%i0,	%i6
	fpadd16s	%f6,	%f17,	%f12
loop_141:
	or	%g4,	%o6,	%o2
	tle	%xcc,	0x6
	smulcc	%l3,	%g7,	%g5
	brgez	%o3,	loop_142
	fmul8x16	%f9,	%f30,	%f8
	movgu	%xcc,	%i4,	%o5
	fzero	%f28
loop_142:
	edge16	%o7,	%i7,	%l6
	or	%g6,	0x15C5,	%o4
	set	0x40, %o2
	stda	%f16,	[%l7 + %o2] 0x14
	sll	%l1,	0x12,	%o1
	movvs	%icc,	%g2,	%g1
	sdiv	%l0,	0x01C1,	%i2
	edge32ln	%i1,	%g3,	%l2
	movge	%icc,	%i3,	%l5
	ba,a	%xcc,	loop_143
	fmovsgu	%xcc,	%f23,	%f10
	orn	%l4,	0x16D5,	%o0
	fmovdge	%icc,	%f11,	%f8
loop_143:
	umul	%i5,	%i0,	%i6
	set	0x60, %g4
	lda	[%l7 + %g4] 0x11,	%f1
	fcmpne16	%f2,	%f20,	%o6
	xor	%o2,	0x033A,	%g4
	fandnot1	%f18,	%f4,	%f22
	fmovd	%f12,	%f26
	wr	%g0,	0x80,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	udivx	%l3,	0x1E1B,	%g5
	ldub	[%l7 + 0x15],	%o3
	tsubcctv	%g7,	%o5,	%o7
	srlx	%i7,	%i4,	%l6
	bpos,a	loop_144
	subccc	%o4,	0x0C42,	%l1
	bn,a,pn	%xcc,	loop_145
	fones	%f17
loop_144:
	ld	[%l7 + 0x18],	%f13
	movrgez	%o1,	0x20A,	%g6
loop_145:
	fpsub32	%f26,	%f2,	%f12
	fmovsn	%icc,	%f27,	%f16
	andcc	%g1,	0x0F65,	%l0
	mova	%icc,	%i2,	%g2
	array32	%g3,	%i1,	%l2
	movrlez	%i3,	0x231,	%l4
	fble,a	%fcc3,	loop_146
	movrgz	%l5,	0x0CF,	%i5
	srlx	%i0,	%i6,	%o0
	tgu	%icc,	0x0
loop_146:
	nop
	wr	%g0,	0x10,	%asi
	lduwa	[%l7 + 0x4C] %asi,	%o2
	flush	%l7 + 0x0C
	movgu	%xcc,	%o6,	%l3
	siam	0x6
	fmovsvs	%icc,	%f22,	%f18
	ldsb	[%l7 + 0x1D],	%g5
	ble,pn	%icc,	loop_147
	tcc	%icc,	0x0
	tpos	%xcc,	0x5
	tcc	%icc,	0x2
loop_147:
	popc	0x0116,	%g4
	tge	%xcc,	0x0
	sir	0x06F7
	andcc	%o3,	0x0601,	%g7
	fnor	%f18,	%f22,	%f10
	andncc	%o7,	%i7,	%i4
	fxors	%f28,	%f17,	%f16
	mova	%icc,	%o5,	%o4
	wr	%g0,	0x88,	%asi
	swapa	[%l7 + 0x10] %asi,	%l6
	nop
	setx loop_148, %l0, %l1
	jmpl %l1, %o1
	std	%f24,	[%l7 + 0x10]
	sllx	%l1,	%g6,	%g1
	movcs	%xcc,	%l0,	%g2
loop_148:
	bcc,a	%xcc,	loop_149
	fcmpd	%fcc1,	%f28,	%f30
	movgu	%xcc,	%i2,	%g3
	fbuge,a	%fcc3,	loop_150
loop_149:
	array32	%i1,	%l2,	%i3
	fmovsne	%icc,	%f24,	%f6
	edge8ln	%l4,	%i5,	%l5
loop_150:
	std	%f4,	[%l7 + 0x40]
	tsubcctv	%i6,	0x0145,	%i0
	movne	%xcc,	%o0,	%o6
	edge8	%o2,	%g5,	%l3
	fmovspos	%icc,	%f20,	%f13
	for	%f8,	%f2,	%f24
	nop
	set	0x40, %i6
	ldd	[%l7 + %i6],	%f4
	xor	%g4,	0x075C,	%g7
	tvs	%icc,	0x2
	fmovdpos	%icc,	%f25,	%f12
	ldub	[%l7 + 0x4B],	%o7
	brlez	%i7,	loop_151
	movrlz	%o3,	0x3ED,	%i4
	smul	%o4,	%l6,	%o1
	addc	%o5,	%g6,	%l1
loop_151:
	movcc	%xcc,	%g1,	%l0
	brlez,a	%g2,	loop_152
	alignaddrl	%g3,	%i2,	%i1
	taddcctv	%i3,	%l4,	%l2
	wr	%g0,	0x2b,	%asi
	stha	%i5,	[%l7 + 0x22] %asi
	membar	#Sync
loop_152:
	alignaddr	%i6,	%l5,	%o0
	bne,a	loop_153
	bpos	%xcc,	loop_154
	sdivcc	%o6,	0x149F,	%o2
	srax	%g5,	0x0D,	%i0
loop_153:
	fxor	%f26,	%f28,	%f18
loop_154:
	lduh	[%l7 + 0x70],	%g4
	udiv	%g7,	0x0CB9,	%o7
	sll	%i7,	%l3,	%i4
	fbl	%fcc1,	loop_155
	edge32ln	%o4,	%o3,	%l6
	fmovdcs	%icc,	%f18,	%f15
	xnorcc	%o1,	%o5,	%l1
loop_155:
	edge16n	%g1,	%g6,	%g2
	subccc	%l0,	0x150C,	%i2
	bvs,a	%xcc,	loop_156
	edge32n	%i1,	%i3,	%l4
	tle	%xcc,	0x2
	orcc	%l2,	0x1E01,	%i5
loop_156:
	fmovdvs	%icc,	%f21,	%f25
	fbuge,a	%fcc0,	loop_157
	fmovdne	%icc,	%f12,	%f18
	fmovdgu	%icc,	%f22,	%f20
	fsrc2s	%f27,	%f4
loop_157:
	fabss	%f6,	%f9
	ldsb	[%l7 + 0x75],	%i6
	sethi	0x00AD,	%l5
	mova	%icc,	%g3,	%o0
	fbul	%fcc0,	loop_158
	movpos	%xcc,	%o6,	%g5
	fmovrdlez	%o2,	%f14,	%f0
	array16	%i0,	%g7,	%o7
loop_158:
	movcs	%xcc,	%g4,	%i7
	nop
	setx	loop_159,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	edge32l	%l3,	%i4,	%o3
	edge32	%o4,	%l6,	%o5
	taddcc	%o1,	0x08BE,	%g1
loop_159:
	nop
	wr	%g0,	0x27,	%asi
	stba	%l1,	[%l7 + 0x4C] %asi
	membar	#Sync
	sra	%g2,	0x18,	%g6
	umulcc	%l0,	%i2,	%i1
	tcs	%xcc,	0x6
	tg	%xcc,	0x6
	fcmpeq16	%f6,	%f2,	%i3
	fbe	%fcc1,	loop_160
	popc	%l2,	%l4
	alignaddrl	%i6,	%l5,	%g3
	andcc	%o0,	%o6,	%g5
loop_160:
	umul	%i5,	0x1667,	%i0
	addc	%g7,	%o2,	%o7
	andcc	%g4,	%i7,	%l3
	wr	%g0,	0x0c,	%asi
	lduha	[%l7 + 0x3A] %asi,	%o3
	fmovdvc	%icc,	%f15,	%f29
	ldsb	[%l7 + 0x37],	%i4
	array16	%l6,	%o5,	%o4
	fcmpgt32	%f16,	%f6,	%o1
	sir	0x1B72
	fmovsgu	%xcc,	%f25,	%f17
	taddcctv	%g1,	%l1,	%g2
	tne	%icc,	0x2
	umul	%l0,	%i2,	%g6
	sra	%i3,	%l2,	%l4
	ta	%xcc,	0x2
	edge32n	%i1,	%l5,	%i6
	fcmple16	%f22,	%f16,	%g3
	ldsb	[%l7 + 0x75],	%o6
	fbg	%fcc2,	loop_161
	fmovsg	%icc,	%f8,	%f20
	edge32n	%g5,	%o0,	%i5
	wr	%g0,	0x04,	%asi
	lduwa	[%l7 + 0x1C] %asi,	%i0
loop_161:
	movpos	%icc,	%o2,	%g7
	fxors	%f9,	%f24,	%f7
	te	%xcc,	0x3
	tl	%xcc,	0x6
	movleu	%xcc,	%g4,	%o7
	popc	%i7,	%l3
	tvc	%xcc,	0x4
	wr	%g0,	0x80,	%asi
	ldstuba	[%l7 + 0x5B] %asi,	%i4
	udiv	%o3,	0x1B67,	%l6
	tne	%xcc,	0x7
	bleu,pt	%xcc,	loop_162
	fzero	%f6
	fsrc1	%f12,	%f22
	wr	%g0,	0x18,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
loop_162:
	fcmped	%fcc2,	%f2,	%f20
	tle	%icc,	0x5
	movre	%o4,	%o1,	%o5
	fnegd	%f2,	%f30
	tn	%xcc,	0x0
	xnorcc	%g1,	%g2,	%l1
	bvs,a,pn	%icc,	loop_163
	tl	%xcc,	0x7
	fcmpd	%fcc2,	%f6,	%f8
	set	0x50, %g7
	lda	[%l7 + %g7] 0x80,	%f6
loop_163:
	orcc	%i2,	%l0,	%g6
	movne	%xcc,	%i3,	%l2
	tl	%xcc,	0x1
	lduh	[%l7 + 0x1A],	%l4
	mulscc	%l5,	0x1A83,	%i6
	stw	%g3,	[%l7 + 0x0C]
	movneg	%xcc,	%i1,	%g5
	edge32n	%o6,	%i5,	%i0
	fbne,a	%fcc0,	loop_164
	tcc	%xcc,	0x6
	membar	0x4F
	and	%o2,	0x1CFA,	%g7
loop_164:
	ble	%icc,	loop_165
	srl	%o0,	%g4,	%i7
	fbo	%fcc2,	loop_166
	membar	0x36
loop_165:
	popc	0x1848,	%l3
	fbuge	%fcc1,	loop_167
loop_166:
	fsrc2	%f28,	%f2
	ldd	[%l7 + 0x60],	%f18
	fmovrsgz	%o7,	%f5,	%f9
loop_167:
	subccc	%i4,	%l6,	%o4
	sth	%o1,	[%l7 + 0x5E]
	wr	%g0,	0x89,	%asi
	stba	%o5,	[%l7 + 0x13] %asi
	sra	%g1,	0x13,	%g2
	edge16	%l1,	%i2,	%l0
	fba	%fcc1,	loop_168
	bvc,a	loop_169
	fsrc2s	%f4,	%f31
	tsubcctv	%o3,	%g6,	%i3
loop_168:
	fmovdneg	%icc,	%f14,	%f21
loop_169:
	nop
	set	0x18, %o6
	stda	%l4,	[%l7 + %o6] 0x15
	subccc	%l5,	%i6,	%g3
	movn	%xcc,	%l2,	%g5
	ta	%icc,	0x0
	ldd	[%l7 + 0x40],	%f18
	fnegd	%f20,	%f14
	ldx	[%l7 + 0x10],	%o6
	movne	%xcc,	%i5,	%i1
	and	%o2,	0x1BA8,	%i0
	tvs	%icc,	0x0
	edge32ln	%o0,	%g4,	%g7
	smulcc	%l3,	%i7,	%o7
	fpack32	%f10,	%f26,	%f4
	addcc	%l6,	%o4,	%i4
	taddcc	%o5,	0x0CB8,	%g1
	nop
	set	0x08, %l2
	std	%o0,	[%l7 + %l2]
	fmuld8sux16	%f9,	%f0,	%f20
	edge32l	%l1,	%g2,	%l0
	sethi	0x1143,	%i2
	taddcctv	%g6,	0x04F6,	%o3
	mova	%xcc,	%l4,	%l5
	sub	%i6,	%g3,	%i3
	fsrc2s	%f10,	%f28
	tcc	%icc,	0x5
	fbule,a	%fcc3,	loop_170
	fmuld8ulx16	%f3,	%f11,	%f2
	fabss	%f29,	%f29
	tge	%icc,	0x4
loop_170:
	nop
	wr	%g0,	0x89,	%asi
	lduba	[%l7 + 0x22] %asi,	%g5
	fbu	%fcc3,	loop_171
	orn	%o6,	%l2,	%i5
	andn	%o2,	0x06F2,	%i1
	sub	%i0,	%g4,	%g7
loop_171:
	fxnors	%f29,	%f2,	%f20
	fbn,a	%fcc1,	loop_172
	tge	%icc,	0x3
	movl	%xcc,	%o0,	%l3
	movne	%icc,	%i7,	%o7
loop_172:
	membar	0x3C
	movrgz	%o4,	0x157,	%l6
	tvs	%icc,	0x4
	movgu	%xcc,	%o5,	%g1
	fbn,a	%fcc3,	loop_173
	fsrc2s	%f23,	%f23
	nop
	setx	loop_174,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movge	%icc,	%o1,	%l1
loop_173:
	lduh	[%l7 + 0x14],	%i4
	sdiv	%g2,	0x000E,	%l0
loop_174:
	prefetch	[%l7 + 0x48],	 0x0
	fnegd	%f2,	%f24
	srl	%i2,	0x1C,	%o3
	tcs	%xcc,	0x2
	wr	%g0,	0x2a,	%asi
	stha	%g6,	[%l7 + 0x32] %asi
	membar	#Sync
	set	0x18, %o1
	stxa	%l5,	[%g0 + %o1] 0x4f
	edge16ln	%l4,	%g3,	%i3
	movl	%icc,	%g5,	%i6
	alignaddrl	%o6,	%l2,	%o2
	tle	%icc,	0x7
	umul	%i5,	0x08CB,	%i1
	movrgz	%i0,	%g4,	%g7
	srax	%o0,	%l3,	%o7
	array16	%o4,	%i7,	%o5
	mulscc	%l6,	0x1CE1,	%o1
	udivcc	%g1,	0x145C,	%l1
	swap	[%l7 + 0x10],	%g2
	membar	0x43
	sth	%i4,	[%l7 + 0x62]
	orn	%i2,	%o3,	%g6
	movle	%xcc,	%l0,	%l4
	subcc	%g3,	0x14A0,	%l5
	tsubcctv	%g5,	0x11AD,	%i3
	bgu	loop_175
	movge	%xcc,	%o6,	%l2
	tleu	%icc,	0x0
	mova	%xcc,	%o2,	%i6
loop_175:
	edge16l	%i5,	%i0,	%g4
	fmul8x16au	%f25,	%f5,	%f0
	movgu	%icc,	%g7,	%i1
	orncc	%o0,	0x1EC7,	%l3
	movre	%o7,	%i7,	%o5
	fandnot2	%f16,	%f18,	%f2
	fbo	%fcc0,	loop_176
	srlx	%l6,	%o1,	%o4
	movgu	%icc,	%l1,	%g2
	subcc	%i4,	%g1,	%o3
loop_176:
	fbuge	%fcc0,	loop_177
	xorcc	%i2,	0x0D72,	%g6
	edge32	%l0,	%g3,	%l5
	bg,a	%xcc,	loop_178
loop_177:
	prefetch	[%l7 + 0x28],	 0x1
	fmovdvs	%xcc,	%f16,	%f22
	ta	%xcc,	0x6
loop_178:
	mulscc	%l4,	%i3,	%o6
	fcmpne32	%f12,	%f20,	%g5
	movvc	%xcc,	%l2,	%o2
	fmovrslez	%i5,	%f12,	%f0
	movcs	%xcc,	%i0,	%g4
	pdist	%f30,	%f8,	%f8
	movle	%icc,	%i6,	%g7
	ta	%icc,	0x7
	fmovdvs	%xcc,	%f20,	%f20
	movcc	%xcc,	%i1,	%o0
	mova	%xcc,	%o7,	%l3
	sra	%i7,	%l6,	%o1
	popc	0x0110,	%o5
	fmovrsne	%l1,	%f16,	%f6
	membar	0x4F
	ba,a,pn	%icc,	loop_179
	tneg	%icc,	0x5
	fmovsne	%xcc,	%f4,	%f29
	sdiv	%g2,	0x1843,	%i4
loop_179:
	flush	%l7 + 0x5C
	fabsd	%f10,	%f4
	fmovrdgz	%o4,	%f30,	%f2
	orncc	%o3,	%g1,	%i2
	fpsub16s	%f26,	%f6,	%f15
	set	0x1b8, %o7
	nop 	! 	nop 	! 	ldxa	[%g0 + %o7] 0x40,	%g6 ripped by fixASI40.pl ripped by fixASI40.pl
	sra	%g3,	%l0,	%l4
	tge	%xcc,	0x1
	be,pn	%xcc,	loop_180
	brnz	%l5,	loop_181
	orcc	%o6,	%g5,	%i3
	edge8n	%o2,	%l2,	%i5
loop_180:
	fmovdneg	%xcc,	%f1,	%f0
loop_181:
	edge8n	%g4,	%i0,	%g7
	fxnor	%f18,	%f22,	%f24
	mulscc	%i6,	0x04D1,	%i1
	nop
	setx	loop_182,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	stbar
	bpos,a,pn	%icc,	loop_183
	tge	%xcc,	0x1
loop_182:
	subc	%o0,	0x19FB,	%o7
	stx	%i7,	[%l7 + 0x70]
loop_183:
	edge8	%l3,	%l6,	%o1
	swap	[%l7 + 0x28],	%l1
	fxnors	%f1,	%f18,	%f4
	smul	%o5,	0x1E39,	%g2
	brgez	%o4,	loop_184
	andncc	%o3,	%g1,	%i4
	tl	%xcc,	0x1
	edge32l	%g6,	%i2,	%g3
loop_184:
	mulx	%l4,	0x0449,	%l0
	wr	%g0,	0x19,	%asi
	lduwa	[%l7 + 0x68] %asi,	%o6
	orncc	%l5,	0x00B2,	%g5
	fbue,a	%fcc0,	loop_185
	fbu,a	%fcc0,	loop_186
	movrlz	%o2,	0x27E,	%l2
	tneg	%icc,	0x5
loop_185:
	fmovrdne	%i5,	%f24,	%f30
loop_186:
	nop
	set	0x20, %l6
	stwa	%g4,	[%l7 + %l6] 0x80
	movpos	%xcc,	%i0,	%i3
	stx	%i6,	[%l7 + 0x70]
	nop
	set	0x24, %g1
	ldsw	[%l7 + %g1],	%g7
	fcmpgt16	%f8,	%f0,	%o0
	edge32l	%i1,	%o7,	%l3
	tn	%xcc,	0x6
	fabsd	%f6,	%f2
	xnor	%i7,	0x0D6E,	%l6
	tvc	%xcc,	0x7
	tge	%icc,	0x5
	tvs	%icc,	0x3
	tneg	%xcc,	0x7
	bcs	loop_187
	ba,a	%icc,	loop_188
	ldsh	[%l7 + 0x62],	%o1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_187:
	lduw	[%l7 + 0x34],	%o5
loop_188:
	edge32l	%g2,	%o4,	%o3
	addcc	%l1,	0x01FC,	%i4
	addcc	%g6,	%i2,	%g1
	fbn,a	%fcc1,	loop_189
	bvc,a	%xcc,	loop_190
	array32	%l4,	%g3,	%o6
	umulcc	%l0,	%g5,	%l5
loop_189:
	fmuld8sux16	%f9,	%f8,	%f20
loop_190:
	alignaddrl	%o2,	%l2,	%g4
	alignaddr	%i0,	%i3,	%i6
	andcc	%i5,	0x1522,	%g7
	fornot1s	%f25,	%f25,	%f14
	movre	%o0,	0x1B9,	%o7
	edge32	%i1,	%l3,	%i7
	srax	%o1,	0x0E,	%o5
	taddcctv	%g2,	%l6,	%o4
	andcc	%o3,	%i4,	%l1
	tsubcc	%i2,	0x04A4,	%g1
	subccc	%l4,	%g3,	%o6
	nop
	setx loop_191, %l0, %l1
	jmpl %l1, %l0
	movle	%xcc,	%g5,	%l5
	andncc	%g6,	%l2,	%g4
	movrne	%o2,	%i0,	%i3
loop_191:
	fcmps	%fcc2,	%f8,	%f24
	add	%i5,	0x07BE,	%g7
	tcc	%icc,	0x7
	fmovdne	%icc,	%f29,	%f18
	movrgez	%o0,	0x01D,	%i6
	bpos	%icc,	loop_192
	fmul8x16	%f7,	%f16,	%f14
	sll	%i1,	%l3,	%o7
	xnorcc	%o1,	%o5,	%i7
loop_192:
	fbg,a	%fcc3,	loop_193
	fcmpgt32	%f4,	%f12,	%g2
	orcc	%l6,	%o3,	%i4
	movre	%o4,	0x09A,	%l1
loop_193:
	mulscc	%g1,	0x14DF,	%i2
	fmovrslez	%l4,	%f15,	%f3
	fmovda	%icc,	%f28,	%f6
	call	loop_194
	bg,a,pn	%xcc,	loop_195
	swap	[%l7 + 0x60],	%g3
	taddcc	%o6,	%l0,	%l5
loop_194:
	fbul,a	%fcc1,	loop_196
loop_195:
	call	loop_197
	bne,a,pn	%xcc,	loop_198
	ldx	[%l7 + 0x40],	%g5
loop_196:
	array16	%g6,	%g4,	%o2
loop_197:
	and	%i0,	0x1F15,	%i3
loop_198:
	tsubcctv	%l2,	%g7,	%o0
	edge32ln	%i5,	%i6,	%i1
	tvc	%icc,	0x2
	tcs	%xcc,	0x5
	udivx	%l3,	0x01F0,	%o1
	fmovscc	%icc,	%f30,	%f5
	edge16l	%o7,	%i7,	%o5
	fmovd	%f10,	%f8
	tpos	%icc,	0x2
	wr	%g0,	0x89,	%asi
	ldswa	[%l7 + 0x78] %asi,	%l6
	sll	%o3,	%i4,	%o4
	udivx	%l1,	0x11CC,	%g1
	movrlez	%i2,	0x3C1,	%l4
	ld	[%l7 + 0x50],	%f11
	srax	%g2,	%g3,	%l0
	brgz,a	%l5,	loop_199
	tn	%icc,	0x3
	tsubcctv	%o6,	0x18D9,	%g6
	subccc	%g4,	%o2,	%g5
loop_199:
	tge	%xcc,	0x3
	lduw	[%l7 + 0x50],	%i0
	movrlz	%l2,	0x01C,	%g7
	mova	%icc,	%i3,	%o0
	fbe	%fcc0,	loop_200
	srax	%i6,	%i5,	%l3
	fmovdcc	%xcc,	%f26,	%f15
	fcmpne16	%f20,	%f6,	%i1
loop_200:
	tcs	%icc,	0x0
	movn	%icc,	%o1,	%i7
	bg,pt	%xcc,	loop_201
	fmovsa	%icc,	%f4,	%f8
	umulcc	%o7,	%o5,	%o3
	brnz	%l6,	loop_202
loop_201:
	orcc	%o4,	%i4,	%l1
	fornot1s	%f0,	%f6,	%f9
	fornot1s	%f28,	%f8,	%f7
loop_202:
	tle	%xcc,	0x5
	bn,a,pn	%xcc,	loop_203
	alignaddrl	%i2,	%g1,	%l4
	movrlez	%g2,	0x0CC,	%g3
	fbne,a	%fcc2,	loop_204
loop_203:
	brnz,a	%l0,	loop_205
	tsubcc	%l5,	0x0063,	%o6
	andcc	%g4,	0x173C,	%o2
loop_204:
	movne	%icc,	%g6,	%g5
loop_205:
	fmovsa	%xcc,	%f13,	%f20
	fba	%fcc2,	loop_206
	sll	%i0,	%g7,	%l2
	subcc	%i3,	0x0DA7,	%i6
	movn	%xcc,	%i5,	%o0
loop_206:
	stbar
	movneg	%icc,	%i1,	%o1
	fmovrslez	%l3,	%f11,	%f27
	add	%o7,	0x011B,	%i7
	nop
	setx	loop_207,	%l0,	%l1
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
	udivcc	%o3,	0x102D,	%o5
	edge16ln	%l6,	%i4,	%o4
loop_207:
	bg,a	loop_208
	alignaddrl	%l1,	%i2,	%g1
	movle	%icc,	%l4,	%g2
	faligndata	%f14,	%f20,	%f18
loop_208:
	fmovdvc	%icc,	%f9,	%f31
	srl	%l0,	0x12,	%l5
	xnor	%g3,	%o6,	%g4
	fnand	%f16,	%f16,	%f22
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32	%o2,	%g5,	%i0
	nop
	set	0x10, %o5
	prefetch	[%l7 + %o5],	 0x2
	tsubcc	%g7,	0x044F,	%l2
	fmovrsgez	%g6,	%f17,	%f2
	fbne	%fcc1,	loop_209
	movg	%xcc,	%i3,	%i6
	bneg,a,pt	%icc,	loop_210
	fexpand	%f23,	%f30
loop_209:
	fbuge,a	%fcc0,	loop_211
	ta	%icc,	0x6
loop_210:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fble,a	%fcc1,	loop_212
loop_211:
	tn	%icc,	0x4
	bneg,a	%icc,	loop_213
	fbul	%fcc2,	loop_214
loop_212:
	fmul8x16	%f3,	%f6,	%f20
	edge32n	%o0,	%i1,	%o1
loop_213:
	fblg,a	%fcc3,	loop_215
loop_214:
	std	%l2,	[%l7 + 0x38]
	fnot2s	%f18,	%f15
	ldub	[%l7 + 0x55],	%i5
loop_215:
	tcc	%icc,	0x6
	tl	%xcc,	0x1
	edge32ln	%i7,	%o3,	%o7
	fmovrsgez	%o5,	%f11,	%f20
	edge16n	%i4,	%o4,	%l1
	bne,a,pt	%icc,	loop_216
	edge32n	%i2,	%l6,	%l4
	sllx	%g1,	0x15,	%g2
	fnor	%f12,	%f22,	%f2
loop_216:
	sll	%l0,	0x01,	%l5
	fpadd32s	%f0,	%f24,	%f11
	xnor	%g3,	%g4,	%o2
	xnorcc	%o6,	0x14D1,	%i0
	fmovsg	%xcc,	%f8,	%f1
	edge16l	%g5,	%g7,	%l2
	edge16n	%i3,	%g6,	%i6
	set	0x1C, %g3
	ldswa	[%l7 + %g3] 0x0c,	%i1
	sllx	%o1,	0x10,	%l3
	bgu,a,pt	%icc,	loop_217
	tleu	%xcc,	0x3
	set	0x50, %l4
	ldsha	[%l7 + %l4] 0x0c,	%o0
loop_217:
	nop
	set	0x18, %l3
	ldxa	[%l7 + %l3] 0x0c,	%i7
	movn	%xcc,	%o3,	%o7
	fbuge,a	%fcc3,	loop_218
	edge16	%i5,	%o5,	%o4
	srlx	%i4,	0x17,	%l1
	stw	%i2,	[%l7 + 0x4C]
loop_218:
	mulx	%l6,	0x0B70,	%g1
	movre	%l4,	0x167,	%l0
	fmovdg	%xcc,	%f10,	%f2
	flush	%l7 + 0x08
	nop
	setx	loop_219,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fbo,a	%fcc0,	loop_220
	tgu	%icc,	0x7
	movgu	%xcc,	%g2,	%l5
loop_219:
	movre	%g4,	0x28F,	%o2
loop_220:
	sdiv	%o6,	0x1A8C,	%i0
	movrgez	%g5,	0x06B,	%g7
	xor	%l2,	%i3,	%g6
	call	loop_221
	tsubcctv	%g3,	%i6,	%o1
	brgz,a	%l3,	loop_222
	edge16l	%o0,	%i1,	%i7
loop_221:
	movcc	%xcc,	%o7,	%i5
	sllx	%o3,	%o5,	%i4
loop_222:
	ldd	[%l7 + 0x20],	%f18
	fmovscc	%icc,	%f29,	%f0
	udivcc	%l1,	0x1ACE,	%o4
	tcs	%icc,	0x0
	be	%xcc,	loop_223
	edge32ln	%i2,	%l6,	%l4
	tvc	%xcc,	0x0
	faligndata	%f0,	%f24,	%f4
loop_223:
	sdivcc	%l0,	0x0A62,	%g1
	fbug,a	%fcc2,	loop_224
	fmovrslz	%l5,	%f26,	%f29
	movrlez	%g2,	%g4,	%o6
	bg,a	%icc,	loop_225
loop_224:
	nop
	set	0x7A, %i0
	ldub	[%l7 + %i0],	%o2
	fpsub16	%f4,	%f16,	%f2
	array8	%g5,	%g7,	%l2
loop_225:
	xnor	%i0,	%g6,	%i3
	sra	%i6,	%o1,	%l3
	brgz,a	%g3,	loop_226
	tleu	%icc,	0x3
	andn	%o0,	0x006B,	%i7
	tgu	%xcc,	0x2
loop_226:
	fbge,a	%fcc3,	loop_227
	movrne	%o7,	0x033,	%i5
	mova	%icc,	%o3,	%o5
	fabss	%f30,	%f11
loop_227:
	nop
	wr	%g0,	0x89,	%asi
	sta	%f12,	[%l7 + 0x18] %asi
	fmovsn	%icc,	%f22,	%f26
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bneg,a	loop_228
	nop
	setx	loop_229,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	edge8n	%i1,	%i4,	%l1
	fbne	%fcc1,	loop_230
loop_228:
	nop
	set	0x30, %i4
	ldd	[%l7 + %i4],	%f24
loop_229:
	movl	%xcc,	%i2,	%l6
	taddcctv	%o4,	%l0,	%l4
loop_230:
	fbe,a	%fcc2,	loop_231
	umul	%g1,	0x1552,	%l5
	prefetch	[%l7 + 0x20],	 0x3
	edge16n	%g4,	%o6,	%g2
loop_231:
	sll	%o2,	0x1C,	%g5
	fmovsvs	%icc,	%f1,	%f24
	nop
	set	0x74, %i5
	ldsh	[%l7 + %i5],	%l2
	srax	%g7,	0x0A,	%g6
	fpsub32	%f12,	%f30,	%f28
	prefetch	[%l7 + 0x7C],	 0x2
	mova	%icc,	%i3,	%i6
	st	%f8,	[%l7 + 0x6C]
	mulx	%o1,	%l3,	%g3
	taddcctv	%o0,	%i7,	%o7
	tsubcc	%i5,	%i0,	%o3
	tleu	%icc,	0x5
	movrlz	%o5,	0x082,	%i1
	bcs	loop_232
	lduw	[%l7 + 0x08],	%i4
	fabss	%f15,	%f12
	movrgz	%l1,	%i2,	%l6
loop_232:
	add	%o4,	0x06BB,	%l4
	movrgz	%g1,	%l5,	%g4
	fmovspos	%xcc,	%f19,	%f27
	sth	%o6,	[%l7 + 0x26]
	tsubcc	%g2,	0x0C86,	%l0
	udivcc	%o2,	0x0713,	%l2
	fmovrslz	%g7,	%f6,	%f26
	bcs	%icc,	loop_233
	movpos	%xcc,	%g5,	%i3
	fcmps	%fcc2,	%f0,	%f25
	tcs	%xcc,	0x4
loop_233:
	bleu,pn	%xcc,	loop_234
	sethi	0x0E08,	%i6
	array16	%o1,	%l3,	%g6
	std	%o0,	[%l7 + 0x50]
loop_234:
	fmovrdlez	%g3,	%f16,	%f24
	and	%o7,	%i7,	%i5
	edge32l	%i0,	%o5,	%i1
	orcc	%i4,	0x0C36,	%o3
	orn	%l1,	%i2,	%o4
	tge	%icc,	0x6
	movrne	%l4,	0x2BF,	%g1
	movn	%icc,	%l5,	%l6
	movl	%xcc,	%o6,	%g4
	alignaddr	%l0,	%g2,	%l2
	fpadd16s	%f9,	%f27,	%f5
	fbg	%fcc3,	loop_235
	tpos	%xcc,	0x4
	fbul,a	%fcc0,	loop_236
	tge	%icc,	0x0
loop_235:
	movgu	%xcc,	%o2,	%g7
	add	%l7,	0x14,	%l6
	wr	%g0,	0x0c,	%asi
	casa	[%l6] %asi,	%g5,	%i3
loop_236:
	movne	%icc,	%o1,	%l3
	alignaddrl	%i6,	%o0,	%g3
	subccc	%g6,	0x098E,	%i7
	sub	%i5,	%i0,	%o7
	tcc	%xcc,	0x2
	fmuld8sux16	%f18,	%f15,	%f10
	fba,a	%fcc1,	loop_237
	fbe	%fcc2,	loop_238
	fblg	%fcc2,	loop_239
	bvc,a,pt	%icc,	loop_240
loop_237:
	andn	%o5,	%i4,	%i1
loop_238:
	fexpand	%f19,	%f2
loop_239:
	movrgz	%l1,	0x311,	%o3
loop_240:
	movn	%icc,	%i2,	%o4
	fpack32	%f24,	%f22,	%f26
	fbe,a	%fcc0,	loop_241
	popc	%l4,	%l5
	xnor	%l6,	%g1,	%g4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_241:
	mova	%xcc,	%o6,	%g2
	tgu	%xcc,	0x7
	wr	%g0,	0x0c,	%asi
	lduba	[%l7 + 0x60] %asi,	%l2
	srl	%o2,	%l0,	%g7
	set	0x58, %g6
	lduwa	[%l7 + %g6] 0x10,	%i3
	andcc	%g5,	%o1,	%i6
	wr	%g0,	0x80,	%asi
	swapa	[%l7 + 0x78] %asi,	%l3
	fbge	%fcc2,	loop_242
	ta	%xcc,	0x7
	fmovrsgez	%g3,	%f4,	%f9
	wr	%g0,	0x2b,	%asi
	stha	%g6,	[%l7 + 0x6E] %asi
	membar	#Sync
loop_242:
	lduh	[%l7 + 0x7E],	%i7
	and	%i5,	%i0,	%o7
	set	0x20, %o3
	lduba	[%l7 + %o3] 0x19,	%o5
	edge8	%i4,	%o0,	%i1
	membar	#Sync
	set	0x40, %o0
	ldda	[%l7 + %o0] 0xf0,	%f16
	wr	%g0,	0x81,	%asi
	lduha	[%l7 + 0x10] %asi,	%o3
	wr	%g0,	0x5f,	%asi
	stxa	%l1,	[%g0 + 0x0] %asi
	wr	%g0,	0x80,	%asi
	sta	%f13,	[%l7 + 0x74] %asi
	tcs	%xcc,	0x4
	fbne	%fcc1,	loop_243
	tsubcctv	%i2,	0x1E10,	%l4
	fbul	%fcc0,	loop_244
	add	%o4,	%l5,	%l6
loop_243:
	taddcc	%g1,	0x192C,	%g4
	taddcc	%o6,	0x04BF,	%g2
loop_244:
	alignaddrl	%o2,	%l0,	%g7
	addccc	%i3,	%g5,	%l2
	smulcc	%o1,	%i6,	%l3
	alignaddrl	%g6,	%g3,	%i7
	movleu	%icc,	%i5,	%o7
	taddcctv	%o5,	0x10E1,	%i0
	st	%f25,	[%l7 + 0x70]
	lduw	[%l7 + 0x38],	%i4
	ba,a	loop_245
	xorcc	%o0,	0x02D5,	%i1
	tne	%xcc,	0x2
	movvc	%icc,	%o3,	%l1
loop_245:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16ln	%l4,	%o4,	%l5
	sllx	%l6,	0x15,	%g1
	andn	%g4,	%o6,	%i2
	fmovsg	%xcc,	%f3,	%f11
	stbar
	fcmpne16	%f18,	%f20,	%g2
	sllx	%l0,	0x1B,	%o2
	andcc	%i3,	0x142D,	%g5
	subcc	%g7,	0x0D9D,	%l2
	fpack32	%f14,	%f14,	%f16
	mova	%icc,	%i6,	%o1
	and	%l3,	%g3,	%g6
	tpos	%xcc,	0x1
	fpack16	%f28,	%f14
	fmovsn	%icc,	%f5,	%f3
	edge16n	%i7,	%o7,	%i5
	sra	%i0,	%o5,	%i4
	fmovda	%xcc,	%f13,	%f2
	edge8ln	%i1,	%o0,	%o3
	edge16ln	%l4,	%o4,	%l5
	edge32ln	%l1,	%l6,	%g1
	subccc	%o6,	0x1AD3,	%i2
	bg	loop_246
	alignaddrl	%g4,	%g2,	%o2
	movrlz	%i3,	0x12E,	%l0
	fcmps	%fcc2,	%f31,	%f3
loop_246:
	movgu	%xcc,	%g7,	%l2
	fmuld8ulx16	%f7,	%f7,	%f20
	fnands	%f10,	%f31,	%f28
	call	loop_247
	fbule	%fcc3,	loop_248
	fsrc1	%f30,	%f10
	set	0x40, %l5
	stda	%f0,	[%l7 + %l5] 0x15
loop_247:
	edge32ln	%g5,	%o1,	%i6
loop_248:
	bcs,a,pt	%xcc,	loop_249
	movg	%xcc,	%g3,	%l3
	set	0x40, %o4
	ldda	[%l7 + %o4] 0x18,	%f0
loop_249:
	popc	0x09A5,	%i7
	sdivx	%o7,	0x177E,	%g6
	flush	%l7 + 0x6C
	fnegd	%f14,	%f30
	tcc	%xcc,	0x5
	fpmerge	%f12,	%f22,	%f30
	srax	%i0,	%o5,	%i5
	edge32ln	%i4,	%o0,	%i1
	tvc	%icc,	0x4
	brgez,a	%l4,	loop_250
	addccc	%o4,	%l5,	%o3
	sethi	0x14FC,	%l1
	siam	0x1
loop_250:
	nop
	wr	%g0,	0x18,	%asi
	swapa	[%l7 + 0x10] %asi,	%l6
	fzeros	%f17
	or	%o6,	0x1AC2,	%i2
	nop
	set	0x30, %g2
	ldd	[%l7 + %g2],	%g4
	fbug	%fcc3,	loop_251
	umulcc	%g2,	0x16DB,	%g1
	move	%xcc,	%o2,	%l0
	movvc	%xcc,	%i3,	%g7
loop_251:
	edge8n	%g5,	%l2,	%o1
	brgez	%g3,	loop_252
	fmovdcc	%icc,	%f17,	%f0
	taddcctv	%l3,	%i6,	%o7
	wr	%g0,	0x19,	%asi
	ldswa	[%l7 + 0x68] %asi,	%i7
loop_252:
	mulscc	%i0,	0x1ADE,	%o5
	addccc	%g6,	%i4,	%i5
	fmovsg	%xcc,	%f30,	%f15
	udiv	%i1,	0x004D,	%l4
	wr	%g0,	0x80,	%asi
	sta	%f17,	[%l7 + 0x48] %asi
	te	%icc,	0x0
	tne	%icc,	0x1
	xnorcc	%o0,	0x053A,	%l5
	movl	%xcc,	%o4,	%o3
	fbuge	%fcc0,	loop_253
	fbg,a	%fcc0,	loop_254
	tg	%icc,	0x6
	edge16l	%l1,	%o6,	%l6
loop_253:
	bshuffle	%f18,	%f2,	%f22
loop_254:
	edge8	%g4,	%i2,	%g1
	mova	%icc,	%g2,	%o2
	fmovspos	%xcc,	%f25,	%f12
	tvc	%icc,	0x0
	fpsub16	%f4,	%f0,	%f2
	ldub	[%l7 + 0x3B],	%i3
	tpos	%xcc,	0x3
	wr	%g0,	0x0c,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	fbn,a	%fcc3,	loop_255
	orn	%l0,	%g5,	%g7
	and	%o1,	%g3,	%l3
	movcs	%icc,	%i6,	%o7
loop_255:
	subc	%i7,	0x1937,	%i0
	tl	%xcc,	0x4
	taddcctv	%o5,	%l2,	%i4
	edge32ln	%g6,	%i5,	%l4
	popc	%i1,	%l5
	addccc	%o4,	%o3,	%l1
	tl	%icc,	0x0
	fcmpne32	%f16,	%f24,	%o6
	fmovrdne	%o0,	%f30,	%f16
	prefetch	[%l7 + 0x10],	 0x1
	udiv	%g4,	0x1FF4,	%l6
	orncc	%i2,	0x048B,	%g1
	tl	%xcc,	0x5
	set	0x10, %l1
	lda	[%l7 + %l1] 0x11,	%f29
	array16	%o2,	%i3,	%l0
	srlx	%g5,	%g2,	%g7
	te	%xcc,	0x5
	set	0x22, %i2
	ldstuba	[%l7 + %i2] 0x11,	%o1
	fandnot1s	%f6,	%f16,	%f15
	edge32l	%g3,	%l3,	%i6
	movn	%icc,	%o7,	%i7
	movg	%xcc,	%i0,	%o5
	subccc	%l2,	0x0C28,	%g6
	movrgez	%i4,	%l4,	%i5
	ldsw	[%l7 + 0x38],	%i1
	taddcc	%l5,	0x0A22,	%o4
	movge	%xcc,	%l1,	%o3
	movre	%o0,	%g4,	%l6
	wr	%g0,	0x80,	%asi
	lduha	[%l7 + 0x5C] %asi,	%o6
	fmovrdgz	%g1,	%f0,	%f22
	movne	%xcc,	%i2,	%i3
	prefetch	[%l7 + 0x14],	 0x0
	subccc	%o2,	0x124B,	%g5
	brz	%g2,	loop_256
	movrgz	%g7,	%o1,	%l0
	wr	%g0,	0x89,	%asi
	stxa	%g3,	[%l7 + 0x18] %asi
loop_256:
	te	%xcc,	0x1
	movn	%icc,	%i6,	%o7
	fpadd32s	%f14,	%f4,	%f6
	set	0x60, %i7
	stda	%l2,	[%l7 + %i7] 0x22
	membar	#Sync
	sir	0x0FB6
	edge16ln	%i7,	%i0,	%o5
	stw	%g6,	[%l7 + 0x58]
	fmovrsne	%i4,	%f14,	%f22
	add	%l7,	0x18,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%l4
	casa	[%l6] 0x89,	%l4,	%i5
	fandnot1s	%f29,	%f10,	%f6
	wr	%g0,	0x11,	%asi
	ldswa	[%l7 + 0x0C] %asi,	%l2
	sll	%l5,	%i1,	%o4
	addc	%o3,	0x19A3,	%o0
	popc	%l1,	%g4
	tge	%xcc,	0x1
	bvc,pt	%icc,	loop_257
	fmovrde	%l6,	%f26,	%f26
	sir	0x0454
	srax	%o6,	%g1,	%i2
loop_257:
	add	%i3,	0x04F8,	%o2
	edge8ln	%g2,	%g7,	%o1
	movrlz	%g5,	0x00A,	%g3
	fmovrdlz	%l0,	%f12,	%f2
	fmovdcs	%xcc,	%f8,	%f19
	set	0x34, %i3
	ldswa	[%l7 + %i3] 0x10,	%o7
	bne	loop_258
	fmul8x16	%f6,	%f12,	%f24
	movrgez	%l3,	0x12A,	%i7
	bgu,a	%icc,	loop_259
loop_258:
	xnor	%i0,	0x1B54,	%i6
	orcc	%g6,	%i4,	%l4
	tn	%xcc,	0x2
loop_259:
	movvc	%icc,	%i5,	%o5
	swap	[%l7 + 0x54],	%l2
	array8	%i1,	%o4,	%l5
	movvs	%icc,	%o0,	%o3
	ldd	[%l7 + 0x40],	%l0
	fcmpes	%fcc1,	%f22,	%f12
	ldstub	[%l7 + 0x6E],	%l6
	fbge	%fcc3,	loop_260
	taddcctv	%o6,	%g1,	%i2
	tn	%icc,	0x1
	fandnot2s	%f22,	%f12,	%f23
loop_260:
	bleu,a	loop_261
	fmul8sux16	%f20,	%f2,	%f0
	tn	%xcc,	0x3
	movl	%xcc,	%i3,	%o2
loop_261:
	tl	%xcc,	0x5
	ta	%xcc,	0x7
	add	%l7,	0x48,	%l6
	wr	%g0,	0x18,	%asi
	lda	[%l6] %asi,	%g2
	casa	[%l6] 0x18,	%g2,	%g7
	fnot2s	%f9,	%f31
	fmovdl	%icc,	%f0,	%f28
	edge8	%o1,	%g5,	%g3
	fmovscc	%xcc,	%f21,	%f19
	tsubcc	%g4,	0x0446,	%l0
	ldsw	[%l7 + 0x78],	%l3
	array16	%o7,	%i7,	%i0
	ldstub	[%l7 + 0x2A],	%g6
	stbar
	movrne	%i6,	%l4,	%i5
	sir	0x1CC6
	fble,a	%fcc1,	loop_262
	fbul,a	%fcc3,	loop_263
	tge	%xcc,	0x3
	ldd	[%l7 + 0x20],	%f6
loop_262:
	fcmpne32	%f22,	%f2,	%o5
loop_263:
	fbug	%fcc1,	loop_264
	smul	%i4,	0x1ABC,	%l2
	bge	%xcc,	loop_265
	fmovd	%f22,	%f18
loop_264:
	alignaddrl	%i1,	%o4,	%l5
	fblg,a	%fcc2,	loop_266
loop_265:
	ldd	[%l7 + 0x30],	%o0
	ldd	[%l7 + 0x48],	%f24
	fmovdne	%xcc,	%f28,	%f14
loop_266:
	fnegs	%f25,	%f6
	array16	%o3,	%l1,	%l6
	stx	%g1,	[%l7 + 0x08]
	ldd	[%l7 + 0x40],	%f2
	edge16ln	%i2,	%o6,	%o2
	andncc	%i3,	%g7,	%o1
	fnegd	%f0,	%f26
	xorcc	%g2,	%g5,	%g3
	taddcc	%g4,	0x0E7C,	%l0
	fbn	%fcc2,	loop_267
	addccc	%l3,	0x1123,	%o7
	array8	%i7,	%g6,	%i0
	edge16n	%l4,	%i6,	%o5
loop_267:
	fcmple32	%f12,	%f28,	%i5
	umulcc	%i4,	%i1,	%o4
	edge8n	%l5,	%l2,	%o3
	subcc	%o0,	%l1,	%g1
	ldd	[%l7 + 0x38],	%f10
	umul	%i2,	%o6,	%l6
	addc	%o2,	0x1A3E,	%g7
	bgu,pt	%xcc,	loop_268
	movge	%xcc,	%o1,	%i3
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x34] %asi,	%g5
loop_268:
	umul	%g2,	0x08AE,	%g3
	brgez	%l0,	loop_269
	tneg	%icc,	0x7
	xnor	%g4,	%l3,	%o7
	tg	%icc,	0x5
loop_269:
	tvc	%xcc,	0x6
	sir	0x1932
	add	%l7,	0x44,	%l6
	wr	%g0,	0x10,	%asi
	lda	[%l6] %asi,	%g6
	casa	[%l6] 0x10,	%g6,	%i7
	membar	0x3C
	array32	%i0,	%i6,	%o5
	edge32l	%l4,	%i4,	%i5
	fand	%f6,	%f26,	%f26
	edge16ln	%i1,	%o4,	%l5
	wr	%g0,	0x04,	%asi
	ldswa	[%l7 + 0x4C] %asi,	%o3
	fpsub32s	%f18,	%f11,	%f4
	wr	%g0,	0x19,	%asi
	ldsha	[%l7 + 0x32] %asi,	%o0
	srax	%l2,	0x0F,	%l1
	ble	%xcc,	loop_270
	movne	%icc,	%g1,	%o6
	xnor	%i2,	0x0055,	%l6
	movge	%xcc,	%g7,	%o2
loop_270:
	tge	%icc,	0x6
	orcc	%o1,	%g5,	%i3
	smul	%g3,	0x12B8,	%l0
	addc	%g2,	0x0E7E,	%l3
	and	%g4,	%o7,	%i7
	srax	%g6,	%i0,	%o5
	edge8l	%i6,	%l4,	%i4
	tg	%icc,	0x6
	tg	%icc,	0x2
	tcs	%xcc,	0x4
	sir	0x1FF0
	for	%f18,	%f2,	%f4
	ld	[%l7 + 0x18],	%f6
	fmovrdgz	%i5,	%f16,	%f30
	alignaddr	%i1,	%l5,	%o3
	tleu	%icc,	0x2
	tsubcctv	%o4,	%l2,	%o0
	fmovrdgz	%g1,	%f8,	%f30
	edge8ln	%l1,	%i2,	%l6
	sdiv	%g7,	0x164C,	%o6
	tgu	%xcc,	0x3
	edge16n	%o2,	%g5,	%i3
	tcs	%icc,	0x7
	add	%g3,	%l0,	%o1
	edge8	%l3,	%g4,	%o7
	wr	%g0,	0x10,	%asi
	ldsba	[%l7 + 0x7B] %asi,	%g2
	movneg	%icc,	%i7,	%g6
	fmovrslez	%i0,	%f21,	%f19
	fmovdne	%icc,	%f3,	%f20
	tvc	%xcc,	0x7
	tvc	%icc,	0x5
	set	0x78, %g5
	lduha	[%l7 + %g5] 0x11,	%o5
	fmovsl	%icc,	%f21,	%f6
	fornot2	%f6,	%f16,	%f26
	mulx	%i6,	0x0050,	%i4
	array8	%l4,	%i1,	%l5
	bne,pn	%xcc,	loop_271
	nop
	setx	loop_272,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	mulx	%i5,	0x0B64,	%o3
	brnz,a	%l2,	loop_273
loop_271:
	movcs	%xcc,	%o0,	%o4
loop_272:
	tne	%xcc,	0x7
	sth	%g1,	[%l7 + 0x5E]
loop_273:
	subccc	%l1,	0x112E,	%i2
	movg	%xcc,	%g7,	%l6
	fzero	%f18
	tle	%icc,	0x1
	fxnors	%f0,	%f20,	%f3
	addccc	%o6,	%g5,	%i3
	brlz,a	%g3,	loop_274
	fbu	%fcc1,	loop_275
	andcc	%l0,	%o1,	%o2
	movrlez	%g4,	0x2CC,	%l3
loop_274:
	fmovrslz	%o7,	%f28,	%f7
loop_275:
	movleu	%xcc,	%i7,	%g2
	wr	%g0,	0x0c,	%asi
	ldstuba	[%l7 + 0x0E] %asi,	%i0
	membar	0x59
	sdiv	%g6,	0x062F,	%o5
	fblg,a	%fcc2,	loop_276
	movrlez	%i4,	%i6,	%i1
	fmovsleu	%icc,	%f6,	%f21
	movcs	%xcc,	%l5,	%l4
loop_276:
	sllx	%o3,	%i5,	%l2
	fmovsvs	%xcc,	%f16,	%f14
	nop
	setx	loop_277,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fnot1	%f30,	%f6
	fmovrse	%o4,	%f17,	%f29
	xnor	%g1,	%o0,	%i2
loop_277:
	flush	%l7 + 0x08
	movpos	%xcc,	%g7,	%l6
	sir	0x1A59
	tcs	%xcc,	0x7
	fands	%f14,	%f20,	%f31
	nop
	setx loop_278, %l0, %l1
	jmpl %l1, %o6
	fbul,a	%fcc1,	loop_279
	fpackfix	%f8,	%f26
	fsrc1s	%f6,	%f23
loop_278:
	nop
	add	%l7,	0x24,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%g5,	%i3
loop_279:
	tcs	%xcc,	0x2
	edge32ln	%l1,	%l0,	%o1
	wr	%g0,	0x88,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	fmovrde	%o2,	%f30,	%f20
	stw	%g3,	[%l7 + 0x0C]
	tneg	%icc,	0x2
	bgu,a	%icc,	loop_280
	movcs	%icc,	%g4,	%l3
	movvs	%xcc,	%o7,	%i7
	bn,pt	%icc,	loop_281
loop_280:
	bcc,a	loop_282
	xnor	%i0,	0x0470,	%g2
	fornot2	%f12,	%f28,	%f12
loop_281:
	fornot2	%f4,	%f6,	%f18
loop_282:
	movre	%g6,	%o5,	%i6
	bshuffle	%f6,	%f6,	%f18
	fmul8x16al	%f3,	%f1,	%f28
	movre	%i1,	%i4,	%l4
	xorcc	%o3,	%l5,	%i5
	movn	%xcc,	%l2,	%o4
	edge16ln	%o0,	%g1,	%i2
	fpadd16s	%f16,	%f29,	%f12
	movneg	%icc,	%g7,	%o6
	subccc	%l6,	0x1148,	%i3
	and	%l1,	%l0,	%g5
	bne,a	loop_283
	sub	%o1,	%g3,	%o2
	fmovs	%f5,	%f12
	tsubcc	%l3,	0x1EA3,	%o7
loop_283:
	bne,a	%icc,	loop_284
	movrgez	%i7,	%g4,	%i0
	fmovdcc	%icc,	%f17,	%f7
	sra	%g2,	0x0C,	%g6
loop_284:
	xnor	%i6,	%i1,	%o5
	swap	[%l7 + 0x6C],	%l4
	fmovdgu	%icc,	%f11,	%f28
	nop
	set	0x62, %l0
	ldsb	[%l7 + %l0],	%o3
	movle	%xcc,	%i4,	%i5
	fmovscc	%xcc,	%f20,	%f12
	edge16ln	%l5,	%o4,	%o0
	movrgz	%g1,	0x3C6,	%i2
	tneg	%xcc,	0x6
	tge	%icc,	0x5
	bcs,a	%icc,	loop_285
	faligndata	%f22,	%f8,	%f20
	srlx	%g7,	%o6,	%l2
	set	0x42, %i1
	lduba	[%l7 + %i1] 0x14,	%i3
loop_285:
	fmovrde	%l6,	%f22,	%f10
	edge32	%l0,	%g5,	%o1
	srl	%l1,	0x18,	%g3
	tleu	%xcc,	0x0
	move	%icc,	%o2,	%o7
	movneg	%icc,	%i7,	%l3
	xor	%g4,	0x1850,	%g2
	brlz,a	%g6,	loop_286
	fcmpgt16	%f12,	%f14,	%i6
	fmovrdne	%i0,	%f18,	%f12
	bge	loop_287
loop_286:
	sdiv	%i1,	0x1804,	%o5
	fcmpes	%fcc1,	%f22,	%f3
	set	0x28, %g4
	lda	[%l7 + %g4] 0x11,	%f25
loop_287:
	fbe,a	%fcc3,	loop_288
	tg	%xcc,	0x7
	fbul	%fcc2,	loop_289
	stb	%l4,	[%l7 + 0x3B]
loop_288:
	xorcc	%o3,	0x1013,	%i4
	movrlz	%i5,	0x15E,	%o4
loop_289:
	bshuffle	%f14,	%f30,	%f26
	prefetch	[%l7 + 0x54],	 0x1
	xnor	%l5,	0x068E,	%o0
	wr	%g0,	0x0c,	%asi
	sta	%f10,	[%l7 + 0x18] %asi
	ldsb	[%l7 + 0x47],	%i2
	brlez,a	%g1,	loop_290
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	or	%o6,	0x0644,	%l2
	andn	%i3,	0x1A33,	%g7
loop_290:
	brz,a	%l0,	loop_291
	movgu	%xcc,	%l6,	%o1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bvc,a,pn	%icc,	loop_292
loop_291:
	fandnot2s	%f5,	%f25,	%f15
	sllx	%g5,	%g3,	%o2
	udivx	%o7,	0x1929,	%i7
loop_292:
	fmovdgu	%icc,	%f3,	%f27
	tcc	%icc,	0x4
	orcc	%l3,	%g4,	%g2
	fsrc1s	%f2,	%f29
	sethi	0x0AB7,	%g6
	fcmple32	%f4,	%f30,	%i6
	edge32l	%l1,	%i1,	%o5
	fbug,a	%fcc2,	loop_293
	orncc	%l4,	%i0,	%o3
	fmovrdgez	%i5,	%f2,	%f30
	xorcc	%i4,	%l5,	%o4
loop_293:
	edge8ln	%i2,	%g1,	%o0
	ldd	[%l7 + 0x10],	%o6
	sdivx	%i3,	0x1445,	%g7
	movrlez	%l2,	%l0,	%l6
	movrne	%o1,	0x13E,	%g3
	udiv	%g5,	0x1559,	%o2
	movrne	%o7,	%i7,	%g4
	xor	%l3,	0x01F7,	%g2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	siam	0x4
	xor	%i6,	0x136F,	%g6
	bcs,a,pt	%xcc,	loop_294
	ldd	[%l7 + 0x18],	%i0
	tcc	%xcc,	0x7
	srl	%l1,	%o5,	%i0
loop_294:
	swap	[%l7 + 0x08],	%o3
	mova	%icc,	%l4,	%i4
	fmovrdgz	%i5,	%f2,	%f18
	array32	%o4,	%l5,	%i2
	smulcc	%o0,	0x1A87,	%o6
	fpack32	%f18,	%f8,	%f18
	move	%xcc,	%g1,	%g7
	smulcc	%l2,	%i3,	%l6
	subc	%l0,	%o1,	%g3
	add	%g5,	%o7,	%i7
	srax	%g4,	0x04,	%l3
	xor	%g2,	%o2,	%g6
	popc	0x09FA,	%i6
	for	%f2,	%f18,	%f8
	nop
	setx	loop_295,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movn	%xcc,	%i1,	%l1
	xnorcc	%i0,	%o5,	%l4
	movrgez	%o3,	0x2B0,	%i5
loop_295:
	tvc	%xcc,	0x2
	array16	%o4,	%l5,	%i2
	tl	%xcc,	0x7
	tge	%icc,	0x0
	movvc	%xcc,	%i4,	%o0
	set	0x78, %i6
	ldxa	[%l7 + %i6] 0x80,	%o6
	addccc	%g1,	%g7,	%l2
	wr	%g0,	0x88,	%asi
	sta	%f23,	[%l7 + 0x2C] %asi
	fmovsle	%xcc,	%f11,	%f21
	ld	[%l7 + 0x58],	%f1
	sdivcc	%i3,	0x1EBE,	%l6
	tsubcc	%l0,	0x1648,	%g3
	fmovdn	%xcc,	%f9,	%f24
	te	%icc,	0x7
	edge32	%o1,	%o7,	%g5
	tge	%icc,	0x4
	xorcc	%i7,	0x1DB7,	%l3
	fandnot2	%f26,	%f4,	%f16
	brlez	%g2,	loop_296
	srlx	%g4,	0x18,	%o2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tle	%xcc,	0x1
loop_296:
	membar	0x35
	fbg,a	%fcc1,	loop_297
	fmovdl	%xcc,	%f10,	%f24
	fabss	%f6,	%f2
	subcc	%i6,	%i1,	%g6
loop_297:
	edge32	%i0,	%o5,	%l4
	ldstub	[%l7 + 0x4D],	%l1
	fmovdcc	%xcc,	%f13,	%f19
	fmovsa	%icc,	%f6,	%f17
	addc	%o3,	0x070F,	%o4
	brgez,a	%i5,	loop_298
	tsubcctv	%l5,	%i4,	%i2
	array8	%o0,	%o6,	%g7
	sub	%l2,	%i3,	%g1
loop_298:
	tcc	%icc,	0x7
	edge32l	%l0,	%l6,	%o1
	fabsd	%f16,	%f0
	fmovrdne	%o7,	%f30,	%f28
	fcmpeq16	%f30,	%f2,	%g3
	set	0x1C, %o2
	ldswa	[%l7 + %o2] 0x14,	%g5
	edge32ln	%l3,	%g2,	%i7
	ta	%xcc,	0x1
	andn	%g4,	0x1DB1,	%o2
	tcc	%icc,	0x7
	fmovsvs	%icc,	%f22,	%f10
	fpmerge	%f16,	%f28,	%f14
	mulx	%i1,	0x1DFD,	%g6
	tgu	%xcc,	0x4
	taddcctv	%i0,	%o5,	%i6
	ldsw	[%l7 + 0x44],	%l1
	movrlez	%l4,	%o4,	%o3
	fmovd	%f16,	%f0
	edge32	%i5,	%i4,	%i2
	mulscc	%o0,	%o6,	%g7
	wr	%g0,	0x81,	%asi
	sta	%f5,	[%l7 + 0x1C] %asi
	tsubcctv	%l2,	0x0FF1,	%l5
	movrgez	%g1,	%i3,	%l6
	sll	%o1,	%o7,	%l0
	fbge,a	%fcc1,	loop_299
	sll	%g5,	%g3,	%g2
	movre	%l3,	%i7,	%g4
	bl,a	%icc,	loop_300
loop_299:
	fmovsl	%icc,	%f27,	%f11
	ldsw	[%l7 + 0x0C],	%i1
	udivcc	%o2,	0x0447,	%g6
loop_300:
	sir	0x1DDA
	edge8ln	%i0,	%o5,	%l1
	tge	%icc,	0x2
	movre	%l4,	0x046,	%i6
	taddcctv	%o3,	%o4,	%i4
	tcs	%xcc,	0x4
	std	%i2,	[%l7 + 0x68]
	andcc	%o0,	%i5,	%o6
	tl	%xcc,	0x2
	fbug	%fcc0,	loop_301
	tge	%icc,	0x0
	fbo	%fcc0,	loop_302
	std	%g6,	[%l7 + 0x78]
loop_301:
	ldsh	[%l7 + 0x30],	%l2
	movrgz	%g1,	0x19A,	%l5
loop_302:
	nop
	add	%l7,	0x58,	%l6
	wr	%g0,	0x0c,	%asi
	ldxa	[%l6] %asi,	%i3
	casxa	[%l6] %asi,	%i3,	%o1
	membar	0x07
	fcmpne32	%f28,	%f24,	%l6
	movle	%icc,	%o7,	%g5
	add	%l7,	0x7C,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%l0,	%g3
	movne	%xcc,	%l3,	%i7
	andn	%g4,	0x1B08,	%g2
	tsubcctv	%o2,	0x081E,	%i1
	fnot2s	%f20,	%f22
	alignaddr	%g6,	%i0,	%l1
	wr	%g0,	0x04,	%asi
	sta	%f6,	[%l7 + 0x7C] %asi
	fandnot2s	%f7,	%f2,	%f14
	fnors	%f25,	%f16,	%f10
	sdiv	%l4,	0x06E4,	%i6
	movrlez	%o5,	0x0BA,	%o4
	fsrc1s	%f7,	%f5
	sub	%i4,	%i2,	%o3
	movne	%xcc,	%o0,	%o6
	tge	%icc,	0x6
	brlez,a	%i5,	loop_303
	udivx	%g7,	0x133A,	%g1
	fbule,a	%fcc1,	loop_304
	fpsub32s	%f11,	%f16,	%f26
loop_303:
	add	%l5,	%i3,	%l2
	movrlez	%l6,	%o7,	%g5
loop_304:
	fcmpes	%fcc1,	%f31,	%f9
	movcs	%xcc,	%l0,	%g3
	movre	%o1,	%l3,	%g4
	tpos	%icc,	0x1
	be,a	loop_305
	sdiv	%g2,	0x0858,	%i7
	umulcc	%o2,	0x01D5,	%g6
	fxnors	%f6,	%f27,	%f12
loop_305:
	nop
	add	%l7,	0x70,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] %asi,	%i1,	%i0
	edge8	%l4,	%i6,	%l1
	fmovrsgez	%o4,	%f4,	%f11
	fble,a	%fcc3,	loop_306
	fmovrsgez	%i4,	%f14,	%f11
	fnot1	%f30,	%f16
	bcc,a,pt	%xcc,	loop_307
loop_306:
	fbn,a	%fcc3,	loop_308
	subccc	%o5,	0x168E,	%i2
	tsubcc	%o0,	%o3,	%o6
loop_307:
	movrlz	%i5,	%g7,	%l5
loop_308:
	ldsh	[%l7 + 0x28],	%i3
	bne,pn	%xcc,	loop_309
	fnot2	%f2,	%f14
	set	0x70, %o6
	lduwa	[%l7 + %o6] 0x10,	%l2
loop_309:
	brlez,a	%l6,	loop_310
	addccc	%o7,	%g5,	%g1
	fbg	%fcc2,	loop_311
	srax	%g3,	%o1,	%l0
loop_310:
	bge,a	%xcc,	loop_312
	sub	%l3,	0x072F,	%g4
loop_311:
	udivcc	%g2,	0x1718,	%o2
	sllx	%g6,	0x17,	%i1
loop_312:
	edge8l	%i7,	%i0,	%i6
	tsubcctv	%l4,	%o4,	%l1
	ldd	[%l7 + 0x30],	%f26
	brlz,a	%o5,	loop_313
	fpsub32	%f22,	%f14,	%f30
	fmovrse	%i4,	%f20,	%f8
	sir	0x0DFD
loop_313:
	movrne	%o0,	0x2D2,	%o3
	brlez	%i2,	loop_314
	move	%xcc,	%o6,	%i5
	movne	%icc,	%l5,	%g7
	fmovrsne	%l2,	%f16,	%f4
loop_314:
	nop
	setx	loop_315,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fandnot1	%f22,	%f28,	%f4
	xnor	%l6,	0x02D1,	%i3
	movge	%icc,	%g5,	%o7
loop_315:
	addccc	%g3,	0x0644,	%g1
	fmovscc	%xcc,	%f31,	%f24
	movcc	%xcc,	%l0,	%l3
	movpos	%xcc,	%o1,	%g2
	movl	%icc,	%g4,	%g6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udivx	%i1,	0x1271,	%o2
	sdiv	%i0,	0x0DB6,	%i6
	movcc	%xcc,	%l4,	%i7
	membar	0x08
	bpos,a	loop_316
	tvs	%xcc,	0x3
	movrlz	%o4,	%o5,	%i4
	fcmpes	%fcc1,	%f1,	%f14
loop_316:
	edge32l	%o0,	%l1,	%i2
	fcmpeq32	%f20,	%f20,	%o6
	smul	%o3,	%l5,	%g7
	wr	%g0,	0x10,	%asi
	lduwa	[%l7 + 0x34] %asi,	%l2
	addc	%l6,	0x1672,	%i5
	fxnors	%f2,	%f12,	%f24
	fmuld8sux16	%f19,	%f5,	%f8
	tpos	%xcc,	0x3
	fnot2	%f2,	%f28
	movrne	%i3,	%o7,	%g3
	movne	%xcc,	%g5,	%l0
	ldsb	[%l7 + 0x74],	%l3
	fpmerge	%f22,	%f21,	%f10
	addccc	%o1,	%g1,	%g2
	fmovsneg	%icc,	%f0,	%f1
	movleu	%icc,	%g4,	%g6
	wr	%g0,	0x19,	%asi
	lduwa	[%l7 + 0x24] %asi,	%i1
	subcc	%o2,	0x166F,	%i0
	subcc	%i6,	%i7,	%o4
	tge	%xcc,	0x2
	membar	0x0F
	fbe,a	%fcc0,	loop_317
	fandnot2	%f18,	%f18,	%f14
	edge32	%o5,	%l4,	%o0
	alignaddrl	%i4,	%i2,	%l1
loop_317:
	nop
	wr	%g0,	0xea,	%asi
	stda	%o2,	[%l7 + 0x48] %asi
	membar	#Sync
	add	%l7,	0x08,	%l6
	wr	%g0,	0x11,	%asi
	ldxa	[%l6] %asi,	%o6
	casxa	[%l6] %asi,	%o6,	%g7
	fbe	%fcc3,	loop_318
	movrlz	%l2,	%l6,	%l5
	movrlez	%i5,	0x09A,	%o7
	edge32l	%g3,	%i3,	%g5
loop_318:
	membar	0x7E
	std	%l0,	[%l7 + 0x58]
	ble,pn	%icc,	loop_319
	ta	%icc,	0x3
	wr	%g0,	0x80,	%asi
	lduha	[%l7 + 0x24] %asi,	%o1
loop_319:
	faligndata	%f24,	%f14,	%f20
	ldsb	[%l7 + 0x16],	%g1
	sdivcc	%g2,	0x06E2,	%g4
	fmul8x16au	%f25,	%f25,	%f12
	alignaddr	%l3,	%g6,	%i1
	movn	%xcc,	%i0,	%o2
	taddcctv	%i6,	%i7,	%o4
	taddcctv	%l4,	%o5,	%o0
	array32	%i4,	%l1,	%i2
	edge32ln	%o3,	%g7,	%l2
	tle	%icc,	0x0
	fbne	%fcc1,	loop_320
	movn	%icc,	%o6,	%l6
	fbl,a	%fcc3,	loop_321
	fmovdvc	%xcc,	%f17,	%f13
loop_320:
	alignaddr	%l5,	%i5,	%o7
	fmovrdgz	%i3,	%f20,	%f8
loop_321:
	fmovsa	%icc,	%f23,	%f20
	fmovscs	%icc,	%f30,	%f13
	tsubcc	%g5,	0x18A3,	%l0
	fandnot2	%f0,	%f4,	%f26
	ba	loop_322
	udivcc	%o1,	0x0EF2,	%g1
	movle	%xcc,	%g3,	%g4
	addcc	%g2,	0x0A73,	%l3
loop_322:
	tg	%icc,	0x5
	tsubcc	%g6,	0x1CC4,	%i0
	membar	0x7A
	edge32	%i1,	%o2,	%i7
	brnz,a	%i6,	loop_323
	andn	%l4,	%o5,	%o0
	fmul8ulx16	%f28,	%f12,	%f20
	array32	%i4,	%o4,	%i2
loop_323:
	addccc	%o3,	%l1,	%g7
	move	%xcc,	%l2,	%l6
	tcs	%xcc,	0x4
	set	0x48, %l2
	stwa	%o6,	[%l7 + %l2] 0x2f
	membar	#Sync
	movpos	%icc,	%l5,	%i5
	fbul	%fcc0,	loop_324
	sdivcc	%i3,	0x01F2,	%g5
	edge8n	%l0,	%o7,	%g1
	subcc	%g3,	%o1,	%g4
loop_324:
	movl	%icc,	%g2,	%l3
	fmovdn	%icc,	%f10,	%f31
	edge8	%g6,	%i0,	%i1
	andcc	%o2,	0x102E,	%i7
	taddcctv	%l4,	0x0B08,	%i6
	mova	%icc,	%o5,	%i4
	edge16	%o4,	%o0,	%i2
	fbue	%fcc1,	loop_325
	edge8l	%o3,	%l1,	%g7
	addccc	%l2,	%o6,	%l6
	sethi	0x034A,	%l5
loop_325:
	edge16n	%i5,	%i3,	%l0
	tleu	%icc,	0x7
	tsubcc	%g5,	0x07F7,	%o7
	tg	%icc,	0x0
	fmovrsne	%g1,	%f11,	%f15
	tle	%xcc,	0x2
	tsubcc	%o1,	0x10F3,	%g3
	sir	0x1A78
	wr	%g0,	0x10,	%asi
	ldsha	[%l7 + 0x24] %asi,	%g2
	tle	%icc,	0x5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	popc	0x1C90,	%g4
	movn	%xcc,	%l3,	%i0
	fpackfix	%f16,	%f17
	or	%i1,	0x0B8A,	%g6
	array32	%o2,	%l4,	%i7
	taddcc	%i6,	0x03D5,	%i4
	smulcc	%o4,	%o5,	%o0
	tvc	%icc,	0x4
	tge	%icc,	0x3
	add	%i2,	%l1,	%g7
	fnot1	%f16,	%f22
	edge16l	%o3,	%o6,	%l6
	fnot2s	%f16,	%f18
	edge8l	%l5,	%l2,	%i3
	fmovrse	%l0,	%f15,	%f14
	fmovse	%xcc,	%f4,	%f27
	brgz,a	%i5,	loop_326
	fmovrdgez	%o7,	%f6,	%f30
	movrgez	%g5,	0x2C3,	%o1
	fornot1s	%f3,	%f24,	%f0
loop_326:
	smulcc	%g1,	%g2,	%g4
	wr	%g0,	0x88,	%asi
	ldsha	[%l7 + 0x46] %asi,	%l3
	for	%f0,	%f28,	%f14
	edge32n	%g3,	%i0,	%i1
	fmovd	%f2,	%f22
	subc	%o2,	0x162B,	%g6
	subc	%l4,	%i6,	%i7
	fsrc2s	%f14,	%f4
	fnor	%f14,	%f2,	%f8
	andcc	%i4,	%o5,	%o4
	edge8ln	%o0,	%l1,	%g7
	movvc	%icc,	%o3,	%o6
	fpadd32	%f10,	%f2,	%f2
	tgu	%xcc,	0x5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movn	%icc,	%i2,	%l5
	movrlez	%l2,	0x387,	%i3
	tpos	%icc,	0x3
	edge8l	%l6,	%i5,	%l0
	fmovsg	%xcc,	%f29,	%f18
	fba,a	%fcc3,	loop_327
	fmovdn	%xcc,	%f2,	%f25
	fmovdge	%icc,	%f17,	%f21
	fmovrslez	%o7,	%f15,	%f6
loop_327:
	xor	%g5,	0x0579,	%o1
	array16	%g1,	%g2,	%g4
	movn	%icc,	%g3,	%l3
	fmovsleu	%xcc,	%f11,	%f20
	fzeros	%f8
	wr	%g0,	0x89,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	tl	%icc,	0x2
	tneg	%xcc,	0x0
	tsubcc	%i0,	%i1,	%o2
	sub	%g6,	%i6,	%i7
	wr	%g0,	0x19,	%asi
	ldsha	[%l7 + 0x42] %asi,	%i4
	fmovrslz	%o5,	%f1,	%f7
	srax	%o4,	0x1E,	%l4
	bne,a	loop_328
	fmul8x16al	%f20,	%f8,	%f2
	fabss	%f3,	%f8
	set	0x60, %g7
	ldda	[%l7 + %g7] 0x23,	%l0
loop_328:
	xorcc	%g7,	0x18DA,	%o0
	fbug	%fcc2,	loop_329
	movcc	%xcc,	%o6,	%o3
	fcmpgt32	%f14,	%f6,	%i2
	popc	0x1BA7,	%l2
loop_329:
	movge	%icc,	%l5,	%i3
	ldsb	[%l7 + 0x2F],	%l6
	or	%i5,	%o7,	%g5
	fcmpgt32	%f8,	%f18,	%o1
	fmovrslez	%g1,	%f4,	%f14
	movrgz	%g2,	0x369,	%l0
	fbn,a	%fcc0,	loop_330
	movneg	%icc,	%g4,	%g3
	std	%i0,	[%l7 + 0x28]
	addcc	%l3,	0x01BF,	%o2
loop_330:
	fbul,a	%fcc3,	loop_331
	fbge	%fcc0,	loop_332
	edge8	%g6,	%i1,	%i7
	movgu	%icc,	%i6,	%i4
loop_331:
	andncc	%o4,	%o5,	%l1
loop_332:
	brnz,a	%l4,	loop_333
	fmovsg	%xcc,	%f21,	%f29
	bl	%xcc,	loop_334
	orcc	%o0,	0x1515,	%o6
loop_333:
	fcmpes	%fcc1,	%f6,	%f19
	movleu	%icc,	%g7,	%o3
loop_334:
	fmovsn	%xcc,	%f24,	%f11
	movpos	%icc,	%l2,	%i2
	wr	%g0,	0x80,	%asi
	lduwa	[%l7 + 0x78] %asi,	%l5
	fsrc2s	%f12,	%f3
	fpsub32	%f24,	%f14,	%f18
	tleu	%icc,	0x1
	subc	%i3,	0x0B7B,	%i5
	fmovrslz	%l6,	%f1,	%f23
	andncc	%g5,	%o7,	%o1
	fmovdge	%icc,	%f21,	%f21
	movleu	%xcc,	%g1,	%g2
	fmovdgu	%icc,	%f17,	%f30
	sllx	%l0,	0x17,	%g4
	fsrc2	%f30,	%f4
	xnorcc	%i0,	0x1B24,	%l3
	edge32	%o2,	%g3,	%i1
	umulcc	%g6,	0x0EA1,	%i6
	movpos	%xcc,	%i7,	%i4
	brlz,a	%o4,	loop_335
	stbar
	tn	%icc,	0x1
	tl	%xcc,	0x4
loop_335:
	srl	%l1,	%o5,	%o0
	fba	%fcc3,	loop_336
	fpmerge	%f22,	%f10,	%f2
	wr	%g0,	0x18,	%asi
	stba	%o6,	[%l7 + 0x41] %asi
loop_336:
	fcmpgt16	%f2,	%f8,	%g7
	ta	%icc,	0x5
	array16	%o3,	%l2,	%l4
	fsrc2	%f6,	%f28
	edge16	%l5,	%i3,	%i5
	fmovse	%xcc,	%f26,	%f19
	movrne	%i2,	0x0B3,	%l6
	subccc	%g5,	0x0F58,	%o7
	sethi	0x060A,	%g1
	subccc	%g2,	%l0,	%g4
	edge16	%o1,	%l3,	%o2
	mulx	%g3,	0x181C,	%i1
	sdiv	%i0,	0x1526,	%g6
	srl	%i7,	%i6,	%i4
	xnorcc	%l1,	%o4,	%o0
	flush	%l7 + 0x60
	fmovdge	%xcc,	%f15,	%f27
	udivx	%o5,	0x03F6,	%o6
	brz	%o3,	loop_337
	srl	%l2,	0x04,	%l4
	fmovrsgez	%l5,	%f23,	%f26
	taddcc	%i3,	%i5,	%g7
loop_337:
	bcc,a,pt	%xcc,	loop_338
	fmovs	%f17,	%f29
	tvc	%icc,	0x0
	set	0x20, %o7
	prefetcha	[%l7 + %o7] 0x88,	 0x2
loop_338:
	nop
	wr	%g0,	0x89,	%asi
	ldda	[%l7 + 0x40] %asi,	%g4
	array8	%i2,	%g1,	%g2
	brnz	%o7,	loop_339
	fpackfix	%f14,	%f10
	fandnot2s	%f9,	%f27,	%f5
	fexpand	%f29,	%f8
loop_339:
	fmovscs	%xcc,	%f21,	%f12
	std	%l0,	[%l7 + 0x20]
	tcs	%icc,	0x6
	brlez,a	%g4,	loop_340
	bl	%icc,	loop_341
	udivcc	%o1,	0x0062,	%l3
	subcc	%o2,	%i1,	%i0
loop_340:
	fbul	%fcc2,	loop_342
loop_341:
	fmovsvs	%xcc,	%f19,	%f28
	movcc	%xcc,	%g6,	%g3
	mulx	%i7,	%i6,	%l1
loop_342:
	tl	%xcc,	0x7
	xnorcc	%i4,	%o4,	%o0
	edge16n	%o6,	%o5,	%o3
	nop
	set	0x78, %o1
	stw	%l4,	[%l7 + %o1]
	fbue,a	%fcc3,	loop_343
	movne	%icc,	%l5,	%l2
	move	%icc,	%i3,	%g7
	addccc	%i5,	%l6,	%g5
loop_343:
	xnor	%i2,	0x13CA,	%g2
	fmovd	%f2,	%f30
	tleu	%xcc,	0x7
	fands	%f11,	%f16,	%f25
	tne	%icc,	0x7
	srax	%o7,	0x01,	%g1
	fmul8x16	%f14,	%f16,	%f30
	xor	%g4,	%l0,	%o1
	movrlz	%l3,	0x1F7,	%i1
	sdivcc	%i0,	0x0838,	%g6
	taddcctv	%g3,	0x13FC,	%o2
	sra	%i6,	%l1,	%i4
	edge16n	%o4,	%i7,	%o0
	umul	%o6,	0x0339,	%o3
	xnorcc	%o5,	0x07C1,	%l4
	fand	%f28,	%f16,	%f6
	xorcc	%l5,	0x1F58,	%i3
	movcs	%xcc,	%l2,	%g7
	mova	%xcc,	%l6,	%g5
	fmovrse	%i5,	%f11,	%f13
	fbn	%fcc3,	loop_344
	smulcc	%g2,	0x1CA8,	%o7
	wr	%g0,	0xe2,	%asi
	stda	%i2,	[%l7 + 0x10] %asi
	membar	#Sync
loop_344:
	edge32ln	%g4,	%l0,	%o1
	edge16l	%l3,	%i1,	%g1
	xor	%g6,	%i0,	%o2
	taddcc	%g3,	%i6,	%l1
	ba,pn	%icc,	loop_345
	fabsd	%f2,	%f12
	brlez	%o4,	loop_346
	tne	%xcc,	0x6
loop_345:
	taddcctv	%i7,	0x03F2,	%i4
	ldd	[%l7 + 0x10],	%o0
loop_346:
	movrlz	%o3,	0x071,	%o6
	fmul8ulx16	%f24,	%f0,	%f0
	wr	%g0,	0x11,	%asi
	prefetcha	[%l7 + 0x38] %asi,	 0x3
	tne	%xcc,	0x0
	tle	%xcc,	0x4
	movleu	%xcc,	%l5,	%o5
	ldstub	[%l7 + 0x45],	%l2
	subc	%g7,	0x1F2F,	%l6
	movre	%g5,	%i3,	%g2
	array16	%i5,	%i2,	%o7
	mulx	%g4,	%l0,	%l3
	tcs	%xcc,	0x7
	alignaddrl	%o1,	%i1,	%g6
	bge,pt	%xcc,	loop_347
	stx	%i0,	[%l7 + 0x48]
	fone	%f24
	xnor	%o2,	0x1820,	%g1
loop_347:
	movpos	%icc,	%g3,	%l1
	taddcctv	%o4,	%i6,	%i7
	orncc	%i4,	%o3,	%o0
	fornot1s	%f18,	%f22,	%f13
	edge8n	%o6,	%l5,	%o5
	std	%l4,	[%l7 + 0x08]
	ldsh	[%l7 + 0x70],	%l2
	tle	%icc,	0x2
	movge	%icc,	%l6,	%g7
	alignaddr	%i3,	%g5,	%i5
	fmovrsgez	%i2,	%f25,	%f15
	fors	%f27,	%f21,	%f4
	srax	%g2,	0x13,	%o7
	mulscc	%g4,	0x05AC,	%l3
	tge	%icc,	0x5
	smul	%l0,	%o1,	%i1
	bgu,a	loop_348
	sllx	%g6,	%o2,	%i0
	fpsub16	%f6,	%f16,	%f26
	ba,a,pt	%xcc,	loop_349
loop_348:
	tne	%icc,	0x5
	movg	%xcc,	%g3,	%g1
	tvs	%xcc,	0x1
loop_349:
	nop
	wr	%g0,	0xea,	%asi
	stxa	%l1,	[%l7 + 0x58] %asi
	membar	#Sync
	subcc	%i6,	%o4,	%i4
	tl	%xcc,	0x3
	movgu	%icc,	%o3,	%i7
	andn	%o0,	%o6,	%o5
	subcc	%l5,	%l2,	%l4
	edge16n	%g7,	%i3,	%l6
	or	%g5,	%i5,	%i2
	set	0x0C, %l6
	ldsha	[%l7 + %l6] 0x14,	%o7
	orncc	%g2,	0x1BDB,	%l3
	fsrc1s	%f5,	%f10
	edge32	%g4,	%o1,	%i1
	bge,a	loop_350
	edge32	%g6,	%l0,	%i0
	fbge	%fcc1,	loop_351
	edge16l	%g3,	%g1,	%o2
loop_350:
	tne	%xcc,	0x0
	movgu	%xcc,	%l1,	%o4
loop_351:
	tle	%icc,	0x6
	or	%i6,	0x1B15,	%o3
	sdivx	%i4,	0x132E,	%o0
	tleu	%xcc,	0x1
	smulcc	%o6,	0x08E1,	%o5
	tsubcctv	%i7,	0x1EA4,	%l2
	set	0x36, %o5
	ldstuba	[%l7 + %o5] 0x19,	%l5
	and	%g7,	0x1483,	%l4
	fmul8x16	%f2,	%f6,	%f10
	edge16l	%i3,	%l6,	%g5
	nop
	set	0x70, %g1
	stw	%i5,	[%l7 + %g1]
	fpadd32	%f10,	%f24,	%f26
	bvc,a,pn	%icc,	loop_352
	edge32l	%o7,	%g2,	%i2
	membar	#Sync
	wr	%g0,	0xf9,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
loop_352:
	fbe	%fcc2,	loop_353
	subcc	%l3,	0x0291,	%g4
	array8	%i1,	%g6,	%o1
	fbne,a	%fcc1,	loop_354
loop_353:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tsubcc	%l0,	0x133A,	%i0
	movg	%xcc,	%g3,	%o2
loop_354:
	prefetch	[%l7 + 0x64],	 0x2
	sdivcc	%l1,	0x072A,	%g1
	array8	%i6,	%o4,	%o3
	sethi	0x1650,	%i4
	sdivx	%o0,	0x0CC9,	%o5
	xor	%i7,	%l2,	%o6
	bcs,a,pn	%xcc,	loop_355
	flush	%l7 + 0x6C
	movne	%xcc,	%l5,	%g7
	movrgez	%l4,	0x130,	%i3
loop_355:
	edge8ln	%g5,	%i5,	%o7
	set	0x50, %g3
	ldswa	[%l7 + %g3] 0x0c,	%g2
	wr	%g0,	0x19,	%asi
	stxa	%i2,	[%l7 + 0x08] %asi
	fmovrdne	%l3,	%f30,	%f12
	fnot1s	%f14,	%f29
	umulcc	%l6,	0x157A,	%g4
	membar	0x5E
	fpadd16s	%f18,	%f24,	%f30
	fmovrde	%i1,	%f4,	%f6
	tpos	%icc,	0x2
	fmovdg	%xcc,	%f2,	%f22
	array8	%o1,	%l0,	%g6
	add	%i0,	%g3,	%l1
	fexpand	%f0,	%f10
	add	%g1,	0x000B,	%i6
	tg	%icc,	0x5
	ldd	[%l7 + 0x30],	%o4
	movrgez	%o2,	%o3,	%i4
	fmul8x16au	%f29,	%f29,	%f28
	set	0x60, %l3
	ldda	[%l7 + %l3] 0x2f,	%o4
	movleu	%icc,	%i7,	%o0
	xnorcc	%o6,	0x074C,	%l5
	ldsw	[%l7 + 0x40],	%l2
	nop
	set	0x78, %l4
	ldd	[%l7 + %l4],	%f8
	tle	%xcc,	0x7
	movrne	%l4,	%i3,	%g5
	udiv	%i5,	0x0AB5,	%o7
	wr	%g0,	0x27,	%asi
	stba	%g2,	[%l7 + 0x0B] %asi
	membar	#Sync
	movpos	%icc,	%i2,	%l3
	movl	%xcc,	%l6,	%g4
	movl	%icc,	%g7,	%o1
	movrlez	%i1,	0x031,	%l0
	fnand	%f16,	%f10,	%f10
	tne	%xcc,	0x0
	tl	%icc,	0x3
	ldstub	[%l7 + 0x39],	%i0
	prefetch	[%l7 + 0x3C],	 0x1
	fmovdle	%xcc,	%f6,	%f0
	movrgez	%g6,	%l1,	%g1
	tle	%icc,	0x3
	set	0x38, %i0
	lduwa	[%l7 + %i0] 0x11,	%g3
	add	%o4,	%o2,	%o3
	fmovd	%f30,	%f20
	edge8l	%i6,	%i4,	%o5
	sdivcc	%o0,	0x102B,	%i7
	andncc	%l5,	%o6,	%l2
	fpadd16s	%f14,	%f19,	%f24
	subc	%l4,	0x14A9,	%g5
	fmovsn	%xcc,	%f23,	%f20
	movvc	%icc,	%i5,	%o7
	srax	%g2,	%i2,	%l3
	nop
	set	0x6E, %i5
	ldsh	[%l7 + %i5],	%l6
	fcmpgt16	%f14,	%f4,	%g4
	ta	%xcc,	0x6
	movl	%icc,	%i3,	%g7
	fmovsvc	%icc,	%f3,	%f12
	array32	%i1,	%o1,	%i0
	edge16	%g6,	%l0,	%l1
	movrgez	%g1,	%o4,	%o2
	nop
	setx	loop_356,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	sdiv	%g3,	0x0E79,	%o3
	xorcc	%i6,	0x1FD5,	%o5
	andncc	%o0,	%i7,	%i4
loop_356:
	orncc	%o6,	%l5,	%l4
	fpackfix	%f10,	%f25
	edge32	%g5,	%i5,	%l2
	tle	%xcc,	0x7
	tcs	%icc,	0x7
	fbul	%fcc0,	loop_357
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fexpand	%f6,	%f8
	fsrc2s	%f13,	%f8
loop_357:
	fbe	%fcc0,	loop_358
	movpos	%icc,	%g2,	%i2
	edge16n	%l3,	%o7,	%g4
	xnorcc	%i3,	%l6,	%i1
loop_358:
	movne	%xcc,	%g7,	%o1
	fmovsleu	%xcc,	%f24,	%f8
	edge8n	%i0,	%g6,	%l1
	orcc	%g1,	%l0,	%o2
	wr	%g0,	0x80,	%asi
	lduha	[%l7 + 0x0A] %asi,	%g3
	lduh	[%l7 + 0x7E],	%o4
	umulcc	%i6,	0x14DC,	%o5
	fmovsgu	%xcc,	%f30,	%f27
	movrne	%o3,	%i7,	%o0
	edge32ln	%i4,	%l5,	%o6
	orcc	%l4,	%g5,	%i5
	fcmpes	%fcc2,	%f9,	%f9
	tg	%xcc,	0x4
	tl	%icc,	0x4
	call	loop_359
	or	%g2,	%i2,	%l3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fsrc1s	%f9,	%f28
loop_359:
	fornot1s	%f8,	%f2,	%f23
	fba	%fcc1,	loop_360
	bvs	loop_361
	tcs	%xcc,	0x3
	fcmps	%fcc3,	%f26,	%f11
loop_360:
	fornot1	%f12,	%f14,	%f12
loop_361:
	edge16n	%o7,	%g4,	%i3
	st	%f27,	[%l7 + 0x70]
	bge,a,pt	%xcc,	loop_362
	sub	%l6,	%i1,	%g7
	fmovs	%f25,	%f0
	wr	%g0,	0x10,	%asi
	lduwa	[%l7 + 0x08] %asi,	%o1
loop_362:
	smul	%l2,	%g6,	%l1
	addc	%g1,	0x04DD,	%i0
	xor	%l0,	0x14C5,	%g3
	ble,a	loop_363
	array16	%o4,	%o2,	%i6
	umulcc	%o5,	0x1CCA,	%i7
	sethi	0x0403,	%o3
loop_363:
	addccc	%i4,	%o0,	%o6
	fpsub32	%f26,	%f0,	%f14
	fcmple16	%f4,	%f2,	%l4
	fcmps	%fcc0,	%f26,	%f8
	fbge	%fcc2,	loop_364
	fpadd16	%f10,	%f14,	%f26
	sub	%l5,	0x0190,	%i5
	lduw	[%l7 + 0x4C],	%g5
loop_364:
	movn	%icc,	%g2,	%l3
	movrgz	%i2,	0x37C,	%o7
	ba	loop_365
	tcs	%xcc,	0x2
	nop
	setx	loop_366,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fmovrdgez	%i3,	%f20,	%f16
loop_365:
	bvc	%xcc,	loop_367
	subccc	%l6,	%i1,	%g7
loop_366:
	xorcc	%g4,	0x1E32,	%o1
	bshuffle	%f18,	%f20,	%f24
loop_367:
	tn	%xcc,	0x7
	siam	0x3
	edge8ln	%g6,	%l2,	%g1
	movcc	%xcc,	%i0,	%l0
	movrlz	%l1,	%o4,	%g3
	movvs	%xcc,	%i6,	%o2
	fornot1	%f30,	%f22,	%f24
	tvc	%xcc,	0x3
	tcs	%icc,	0x6
	umulcc	%o5,	0x0C1E,	%o3
	fpsub16	%f20,	%f30,	%f28
	movge	%xcc,	%i4,	%o0
	membar	0x69
	mulscc	%i7,	%o6,	%l5
	st	%f6,	[%l7 + 0x10]
	fornot1s	%f19,	%f0,	%f1
	fnand	%f10,	%f14,	%f10
	fzeros	%f8
	sdiv	%l4,	0x0DA7,	%i5
	set	0x10, %g6
	stxa	%g5,	[%g0 + %g6] 0x21
	membar	0x00
	smulcc	%g2,	0x07FA,	%l3
	nop
	set	0x68, %i4
	ldd	[%l7 + %i4],	%i2
	flush	%l7 + 0x48
	movrgz	%i3,	%o7,	%l6
	fmovdcs	%xcc,	%f10,	%f27
	umul	%g7,	0x1767,	%g4
	stw	%i1,	[%l7 + 0x1C]
	tvs	%icc,	0x7
	fmovse	%icc,	%f5,	%f29
	edge16	%g6,	%o1,	%l2
	edge32ln	%i0,	%g1,	%l0
	srlx	%o4,	0x0A,	%l1
	xor	%i6,	0x1C92,	%g3
	fmovrse	%o5,	%f6,	%f23
	move	%xcc,	%o3,	%o2
	tle	%icc,	0x2
	andncc	%i4,	%i7,	%o6
	tl	%icc,	0x0
	movcs	%icc,	%o0,	%l4
	fpsub16s	%f23,	%f17,	%f22
	fbge,a	%fcc1,	loop_368
	flush	%l7 + 0x2C
	xor	%i5,	%g5,	%g2
	tcs	%icc,	0x7
loop_368:
	movrlez	%l3,	%l5,	%i2
	ble,a,pn	%xcc,	loop_369
	alignaddrl	%o7,	%l6,	%i3
	movneg	%xcc,	%g4,	%g7
	fexpand	%f22,	%f28
loop_369:
	brlz,a	%i1,	loop_370
	smulcc	%o1,	%g6,	%i0
	set	0x20, %o0
	lduha	[%l7 + %o0] 0x18,	%l2
loop_370:
	xnorcc	%g1,	%l0,	%l1
	smul	%i6,	0x04E4,	%o4
	movne	%xcc,	%g3,	%o3
	taddcc	%o2,	%i4,	%o5
	set	0x10, %o3
	sta	%f12,	[%l7 + %o3] 0x18
	ldub	[%l7 + 0x76],	%i7
	edge8n	%o0,	%o6,	%i5
	tsubcctv	%g5,	%l4,	%l3
	fpsub16	%f26,	%f6,	%f0
	fbo	%fcc2,	loop_371
	mulx	%g2,	%l5,	%i2
	brgez	%o7,	loop_372
	fmovsle	%icc,	%f15,	%f27
loop_371:
	sdivcc	%l6,	0x118A,	%g4
	srlx	%i3,	%i1,	%o1
loop_372:
	fmovsleu	%xcc,	%f25,	%f2
	movcc	%xcc,	%g7,	%g6
	fnors	%f7,	%f6,	%f9
	nop
	set	0x44, %o4
	ldsh	[%l7 + %o4],	%l2
	mulscc	%i0,	0x09A5,	%g1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tn	%xcc,	0x7
	fcmpgt32	%f22,	%f2,	%l1
	xnorcc	%l0,	0x1DCB,	%o4
	fmovrdlez	%i6,	%f4,	%f14
	edge16	%g3,	%o2,	%i4
	bl	%icc,	loop_373
	tle	%xcc,	0x4
	tne	%icc,	0x0
	edge16n	%o3,	%i7,	%o5
loop_373:
	nop
	add	%l7,	0x30,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%o0
	casa	[%l6] 0x80,	%o0,	%o6
	fxnor	%f14,	%f16,	%f16
	call	loop_374
	fmovse	%icc,	%f17,	%f4
	sth	%i5,	[%l7 + 0x08]
	set	0x40, %l5
	ldda	[%l7 + %l5] 0x88,	%f0
loop_374:
	fandnot2s	%f9,	%f1,	%f1
	sllx	%l4,	0x00,	%g5
	movrlez	%l3,	0x2E3,	%g2
	tne	%icc,	0x5
	edge8ln	%i2,	%o7,	%l6
	andn	%l5,	0x137B,	%g4
	sdivx	%i1,	0x1B30,	%o1
	ldub	[%l7 + 0x7D],	%g7
	wr	%g0,	0x11,	%asi
	lduwa	[%l7 + 0x48] %asi,	%g6
	tcs	%xcc,	0x2
	movcs	%xcc,	%i3,	%l2
	tne	%icc,	0x7
	andn	%i0,	0x1C5B,	%g1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movneg	%xcc,	%l1,	%o4
	taddcctv	%l0,	0x19FB,	%g3
	fpack32	%f20,	%f2,	%f2
	fnot2s	%f25,	%f6
	tsubcc	%o2,	%i4,	%o3
	tvc	%icc,	0x7
	andn	%i7,	%i6,	%o5
	fzeros	%f5
	orcc	%o0,	0x0EED,	%o6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xorcc	%i5,	%l4,	%l3
	addcc	%g5,	%g2,	%i2
	fabsd	%f0,	%f18
	tge	%xcc,	0x2
	set	0x30, %l1
	ldda	[%l7 + %l1] 0x26,	%i6
	fmul8x16al	%f23,	%f4,	%f16
	fmovsvc	%icc,	%f9,	%f25
	edge16l	%l5,	%g4,	%i1
	fmovdne	%xcc,	%f29,	%f3
	addcc	%o7,	%o1,	%g6
	movl	%icc,	%g7,	%i3
	bgu	%icc,	loop_375
	sir	0x1A24
	fornot1s	%f5,	%f10,	%f26
	sdiv	%l2,	0x1226,	%g1
loop_375:
	membar	0x2D
	tvs	%icc,	0x1
	movvs	%xcc,	%l1,	%o4
	fmovrsgez	%l0,	%f18,	%f14
	xor	%i0,	%o2,	%i4
	tge	%xcc,	0x4
	fones	%f15
	srax	%g3,	%o3,	%i7
	flush	%l7 + 0x30
	fbu	%fcc0,	loop_376
	fbu,a	%fcc1,	loop_377
	tge	%xcc,	0x7
	ldsh	[%l7 + 0x3E],	%i6
loop_376:
	fandnot2	%f14,	%f16,	%f22
loop_377:
	movrlez	%o5,	%o0,	%o6
	set	0x38, %i2
	ldswa	[%l7 + %i2] 0x81,	%i5
	fmovdge	%xcc,	%f25,	%f29
	fbug	%fcc2,	loop_378
	fcmps	%fcc2,	%f7,	%f9
	movrlz	%l3,	%l4,	%g2
	tle	%icc,	0x7
loop_378:
	fmovsge	%icc,	%f28,	%f3
	movge	%xcc,	%i2,	%l6
	array8	%g5,	%g4,	%i1
	fornot1	%f2,	%f20,	%f6
	fzero	%f30
	array16	%l5,	%o7,	%o1
	ldsw	[%l7 + 0x68],	%g7
	movgu	%xcc,	%g6,	%i3
	fbue,a	%fcc0,	loop_379
	xnor	%l2,	0x012C,	%l1
	add	%o4,	0x0413,	%l0
	ld	[%l7 + 0x4C],	%f28
loop_379:
	addcc	%g1,	%i0,	%o2
	movne	%xcc,	%g3,	%o3
	fornot1s	%f28,	%f13,	%f6
	fors	%f5,	%f27,	%f7
	fcmped	%fcc0,	%f6,	%f10
	array8	%i4,	%i7,	%o5
	xnor	%o0,	%i6,	%i5
	ldsh	[%l7 + 0x32],	%o6
	fmovrdlz	%l3,	%f6,	%f2
	movgu	%icc,	%g2,	%l4
	fandnot1	%f26,	%f18,	%f2
	fornot2	%f2,	%f8,	%f30
	fpadd32	%f24,	%f6,	%f10
	fcmpeq32	%f22,	%f22,	%l6
	tle	%icc,	0x4
	ld	[%l7 + 0x40],	%f10
	ble	loop_380
	addc	%g5,	%i2,	%i1
	fmovsvc	%icc,	%f7,	%f19
	nop
	set	0x58, %g2
	ldsw	[%l7 + %g2],	%g4
loop_380:
	taddcc	%l5,	0x1BC5,	%o1
	ldsw	[%l7 + 0x40],	%o7
	tvs	%xcc,	0x6
	fbuge	%fcc0,	loop_381
	sub	%g7,	0x0BA1,	%i3
	movpos	%xcc,	%g6,	%l2
	orcc	%l1,	%o4,	%l0
loop_381:
	be,pn	%xcc,	loop_382
	edge16	%i0,	%o2,	%g1
	brz	%o3,	loop_383
	array16	%g3,	%i4,	%i7
loop_382:
	tg	%icc,	0x2
	taddcc	%o0,	0x12F4,	%o5
loop_383:
	stbar
	movleu	%xcc,	%i6,	%i5
	fcmped	%fcc0,	%f6,	%f26
	ldub	[%l7 + 0x6D],	%l3
	nop
	setx	loop_384,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	sdiv	%g2,	0x14B7,	%l4
	movne	%xcc,	%l6,	%o6
	orcc	%i2,	%g5,	%g4
loop_384:
	orn	%i1,	0x17CB,	%l5
	set	0x54, %i7
	swapa	[%l7 + %i7] 0x89,	%o1
	array16	%g7,	%o7,	%i3
	brlz,a	%l2,	loop_385
	movrne	%g6,	0x21B,	%o4
	srax	%l1,	%l0,	%i0
	movneg	%xcc,	%g1,	%o3
loop_385:
	alignaddrl	%o2,	%i4,	%g3
	edge16ln	%o0,	%i7,	%o5
	bcc,a,pn	%icc,	loop_386
	fmul8x16	%f7,	%f10,	%f12
	fnegs	%f6,	%f11
	ldx	[%l7 + 0x20],	%i6
loop_386:
	sra	%i5,	0x0E,	%l3
	tl	%xcc,	0x7
	udivcc	%l4,	0x1C75,	%g2
	tge	%icc,	0x4
	add	%l7,	0x7C,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] %asi,	%l6,	%o6
	xnorcc	%g5,	0x16B0,	%g4
	movrne	%i2,	0x3E7,	%i1
	wr	%g0,	0x11,	%asi
	sta	%f3,	[%l7 + 0x4C] %asi
	tsubcctv	%l5,	0x0ECD,	%o1
	fmul8x16	%f31,	%f12,	%f8
	fabsd	%f6,	%f10
	fxors	%f11,	%f20,	%f9
	fmovdle	%icc,	%f17,	%f19
	stbar
	prefetch	[%l7 + 0x68],	 0x2
	subcc	%o7,	%g7,	%l2
	bg,a,pn	%xcc,	loop_387
	orcc	%g6,	%i3,	%o4
	movne	%icc,	%l1,	%i0
	fcmpeq32	%f0,	%f26,	%l0
loop_387:
	smul	%o3,	%g1,	%o2
	ldub	[%l7 + 0x28],	%g3
	set	0x12, %g5
	lduha	[%l7 + %g5] 0x04,	%i4
	tvs	%xcc,	0x4
	fbl	%fcc1,	loop_388
	fpadd16	%f6,	%f16,	%f24
	wr	%g0,	0x89,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
loop_388:
	xorcc	%i7,	%o0,	%i6
	subc	%i5,	%o5,	%l3
	movrlez	%l4,	%l6,	%g2
	fors	%f6,	%f19,	%f5
	siam	0x4
	move	%xcc,	%o6,	%g4
	andcc	%g5,	0x0152,	%i1
	set	0x60, %l0
	ldda	[%l7 + %l0] 0x2a,	%l4
	edge8n	%o1,	%o7,	%g7
	fmovsne	%icc,	%f21,	%f3
	xorcc	%l2,	0x167B,	%g6
	sub	%i2,	0x1704,	%o4
	udiv	%l1,	0x0481,	%i3
	edge32n	%i0,	%o3,	%g1
	movrlz	%o2,	%l0,	%g3
	smulcc	%i7,	%i4,	%i6
	fors	%f6,	%f26,	%f15
	fmovda	%xcc,	%f0,	%f29
	xorcc	%i5,	0x120A,	%o0
	lduh	[%l7 + 0x12],	%o5
	movn	%icc,	%l4,	%l6
	sra	%l3,	0x19,	%o6
	add	%l7,	0x74,	%l6
	wr	%g0,	0x18,	%asi
	lda	[%l6] %asi,	%g4
	casa	[%l6] %asi,	%g4,	%g5
	and	%i1,	0x1250,	%g2
	fpadd32s	%f14,	%f15,	%f11
	tl	%xcc,	0x0
	edge8l	%o1,	%o7,	%g7
	set	0x60, %i1
	stba	%l5,	[%l7 + %i1] 0x14
	fands	%f1,	%f14,	%f23
	brlz	%g6,	loop_389
	fmovrslz	%l2,	%f30,	%f4
	movrne	%i2,	%o4,	%l1
	fsrc1s	%f9,	%f9
loop_389:
	nop
	wr	%g0,	0x81,	%asi
	ldsba	[%l7 + 0x6E] %asi,	%i0
	tvc	%icc,	0x1
	fsrc1	%f26,	%f22
	tvc	%xcc,	0x1
	fpack32	%f22,	%f0,	%f10
	nop
	setx	loop_390,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	tgu	%xcc,	0x5
	xnorcc	%i3,	0x0C07,	%g1
	tneg	%icc,	0x3
loop_390:
	subccc	%o2,	0x193F,	%l0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsneg	%xcc,	%f27,	%f15
	set	0x68, %i3
	ldswa	[%l7 + %i3] 0x18,	%g3
	edge16n	%o3,	%i7,	%i6
	tl	%xcc,	0x4
	xnor	%i4,	0x0FD8,	%i5
	bne,a	loop_391
	sth	%o0,	[%l7 + 0x42]
	taddcctv	%o5,	%l4,	%l3
	fmovsge	%xcc,	%f24,	%f12
loop_391:
	movrlez	%l6,	0x005,	%o6
	wr	%g0,	0x80,	%asi
	sta	%f17,	[%l7 + 0x3C] %asi
	udivcc	%g5,	0x0D5C,	%i1
	umul	%g2,	0x0FDE,	%o1
	flush	%l7 + 0x20
	tl	%xcc,	0x2
	fmul8x16	%f7,	%f2,	%f14
	srlx	%g4,	%g7,	%l5
	fmovspos	%icc,	%f23,	%f29
	xor	%o7,	%g6,	%i2
	wr	%g0,	0x80,	%asi
	lduwa	[%l7 + 0x74] %asi,	%o4
	sdivcc	%l2,	0x1D62,	%l1
	array32	%i3,	%i0,	%g1
	ldsh	[%l7 + 0x34],	%l0
	tcc	%icc,	0x5
	edge16	%g3,	%o2,	%i7
	smulcc	%o3,	0x1A4D,	%i4
	subc	%i6,	%o0,	%i5
	fpack16	%f0,	%f20
	std	%l4,	[%l7 + 0x70]
	edge8	%l3,	%o5,	%l6
	fble	%fcc1,	loop_392
	ldsh	[%l7 + 0x22],	%g5
	udivx	%o6,	0x1838,	%g2
	fmovspos	%icc,	%f5,	%f16
loop_392:
	fzeros	%f11
	movle	%xcc,	%i1,	%o1
	fmovdvs	%xcc,	%f3,	%f17
	movrgez	%g4,	0x211,	%l5
	tne	%xcc,	0x2
	movne	%icc,	%o7,	%g6
	wr	%g0,	0x19,	%asi
	sta	%f31,	[%l7 + 0x74] %asi
	udivx	%i2,	0x19CB,	%g7
	fcmpeq16	%f4,	%f10,	%o4
	tpos	%xcc,	0x0
	tvs	%icc,	0x4
	tpos	%icc,	0x3
	fmovdcs	%icc,	%f25,	%f6
	movl	%icc,	%l1,	%i3
	tpos	%icc,	0x0
	fxnors	%f10,	%f30,	%f29
	fmovrslez	%l2,	%f0,	%f18
	fmovdge	%xcc,	%f28,	%f17
	brgez,a	%g1,	loop_393
	movleu	%xcc,	%i0,	%g3
	be,pt	%icc,	loop_394
	srlx	%o2,	0x05,	%i7
loop_393:
	fpadd32	%f26,	%f28,	%f6
	set	0x40, %g4
	ldda	[%l7 + %g4] 0x10,	%f0
loop_394:
	fmovdvc	%icc,	%f30,	%f5
	fandnot1	%f12,	%f8,	%f30
	sra	%l0,	0x10,	%i4
	wr	%g0,	0x22,	%asi
	ldda	[%l7 + 0x10] %asi,	%o2
	udivx	%i6,	0x153D,	%i5
	fzero	%f16
	udivx	%l4,	0x0237,	%o0
	tne	%icc,	0x7
	wr	%g0,	0x18,	%asi
	sta	%f4,	[%l7 + 0x2C] %asi
	subccc	%l3,	%l6,	%o5
	edge32l	%o6,	%g5,	%i1
	bl,pn	%icc,	loop_395
	ldsh	[%l7 + 0x30],	%o1
	sdiv	%g4,	0x02EB,	%l5
	tl	%xcc,	0x4
loop_395:
	srax	%o7,	%g2,	%i2
	movl	%icc,	%g6,	%g7
	orncc	%l1,	%i3,	%l2
	tcs	%icc,	0x0
	srl	%o4,	%g1,	%g3
	edge32n	%o2,	%i0,	%i7
	array16	%i4,	%l0,	%o3
	tsubcc	%i5,	%l4,	%o0
	swap	[%l7 + 0x24],	%i6
	umulcc	%l3,	0x074B,	%o5
	st	%f14,	[%l7 + 0x40]
	sra	%l6,	0x14,	%g5
	fmovsne	%xcc,	%f29,	%f17
	bne	%xcc,	loop_396
	fandnot1	%f14,	%f8,	%f10
	prefetch	[%l7 + 0x60],	 0x0
	ld	[%l7 + 0x6C],	%f7
loop_396:
	fmovdgu	%xcc,	%f27,	%f19
	udiv	%o6,	0x1707,	%o1
	edge8	%g4,	%l5,	%i1
	set	0x38, %o2
	prefetcha	[%l7 + %o2] 0x18,	 0x2
	wr	%g0,	0x04,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	smul	%o7,	0x07EA,	%i2
	movvs	%xcc,	%g7,	%l1
	movvs	%xcc,	%i3,	%g6
	fbg,a	%fcc2,	loop_397
	stbar
	array16	%l2,	%o4,	%g1
	fmovdne	%icc,	%f19,	%f31
loop_397:
	fbule,a	%fcc3,	loop_398
	ldd	[%l7 + 0x58],	%f10
	xnor	%o2,	0x0C6A,	%g3
	fmovdge	%xcc,	%f7,	%f20
loop_398:
	bvs,a,pt	%icc,	loop_399
	movcc	%xcc,	%i7,	%i0
	xorcc	%i4,	%o3,	%l0
	fmovsn	%icc,	%f2,	%f17
loop_399:
	movrne	%l4,	%i5,	%o0
	movvs	%icc,	%i6,	%o5
	tsubcctv	%l6,	%l3,	%g5
	sllx	%o6,	%g4,	%l5
	siam	0x5
	movpos	%xcc,	%i1,	%o1
	add	%l7,	0x7C,	%l6
	wr	%g0,	0x18,	%asi
	lda	[%l6] %asi,	%g2
	casa	[%l6] 0x18,	%g2,	%o7
	set	0x40, %i6
	stda	%f16,	[%l7 + %i6] 0x89
	edge8ln	%i2,	%l1,	%i3
	fba,a	%fcc3,	loop_400
	alignaddrl	%g7,	%g6,	%l2
	fbue	%fcc3,	loop_401
	and	%g1,	%o2,	%g3
loop_400:
	tneg	%xcc,	0x5
	tvc	%xcc,	0x6
loop_401:
	te	%xcc,	0x1
	smul	%i7,	0x1053,	%i0
	tgu	%icc,	0x2
	mova	%icc,	%i4,	%o4
	orn	%l0,	%l4,	%i5
	flush	%l7 + 0x34
	edge8	%o3,	%i6,	%o5
	ldsb	[%l7 + 0x7E],	%o0
	wr	%g0,	0x80,	%asi
	prefetcha	[%l7 + 0x68] %asi,	 0x3
	tne	%xcc,	0x5
	array8	%l6,	%g5,	%g4
	fbe,a	%fcc2,	loop_402
	fba	%fcc0,	loop_403
	tcc	%xcc,	0x6
	taddcctv	%l5,	0x1EB7,	%o6
loop_402:
	fcmped	%fcc3,	%f0,	%f6
loop_403:
	fnands	%f8,	%f27,	%f18
	movne	%icc,	%o1,	%g2
	tg	%icc,	0x7
	andn	%i1,	0x1AD9,	%i2
	edge16n	%l1,	%o7,	%g7
	tne	%xcc,	0x0
	edge8	%g6,	%l2,	%g1
	movgu	%xcc,	%o2,	%i3
	edge8	%i7,	%g3,	%i4
	movrgz	%i0,	0x1A2,	%o4
	swap	[%l7 + 0x7C],	%l0
	st	%f30,	[%l7 + 0x70]
	movcc	%xcc,	%l4,	%i5
	sra	%o3,	%o5,	%o0
	orn	%l3,	%l6,	%g5
	movge	%xcc,	%g4,	%i6
	fmovrdlz	%l5,	%f12,	%f16
	fmovdgu	%xcc,	%f9,	%f15
	tleu	%icc,	0x6
	movre	%o1,	%o6,	%g2
	flush	%l7 + 0x10
	movcs	%xcc,	%i1,	%i2
	ldstub	[%l7 + 0x79],	%o7
	brlz	%l1,	loop_404
	stw	%g6,	[%l7 + 0x28]
	bn,pt	%icc,	loop_405
	fmovscs	%xcc,	%f30,	%f1
loop_404:
	addccc	%l2,	0x0BDB,	%g7
	set	0x54, %o6
	stwa	%o2,	[%l7 + %o6] 0x0c
loop_405:
	edge32	%i3,	%g1,	%i7
	popc	%g3,	%i4
	popc	%o4,	%i0
	stw	%l0,	[%l7 + 0x74]
	movle	%icc,	%i5,	%o3
	movre	%l4,	%o5,	%o0
	popc	%l6,	%l3
	movpos	%icc,	%g4,	%i6
	fbu,a	%fcc1,	loop_406
	subc	%l5,	%o1,	%o6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fone	%f12
loop_406:
	subc	%g2,	0x0C67,	%g5
	addcc	%i1,	%i2,	%l1
	be,pn	%icc,	loop_407
	tcc	%icc,	0x2
	movle	%icc,	%g6,	%l2
	move	%xcc,	%g7,	%o7
loop_407:
	movvs	%icc,	%o2,	%g1
	ldd	[%l7 + 0x58],	%f10
	movleu	%icc,	%i7,	%i3
	edge32ln	%g3,	%o4,	%i4
	ld	[%l7 + 0x48],	%f21
	ld	[%l7 + 0x14],	%f1
	ldub	[%l7 + 0x25],	%i0
	ldub	[%l7 + 0x14],	%l0
	nop
	set	0x6F, %g7
	ldstub	[%l7 + %g7],	%o3
	movrne	%l4,	0x3DD,	%i5
	sra	%o0,	0x11,	%o5
	orn	%l6,	%l3,	%g4
	fmovdleu	%icc,	%f3,	%f26
	movneg	%xcc,	%i6,	%o1
	movge	%icc,	%l5,	%g2
	ldsb	[%l7 + 0x6B],	%o6
	srax	%g5,	0x14,	%i2
	edge8n	%l1,	%i1,	%l2
	fmovs	%f27,	%f0
	movvs	%icc,	%g6,	%g7
	movrlez	%o7,	%g1,	%o2
	orn	%i3,	%g3,	%o4
	fmovdg	%xcc,	%f14,	%f12
	alignaddrl	%i4,	%i0,	%l0
	flush	%l7 + 0x6C
	andcc	%i7,	0x1B80,	%l4
	lduw	[%l7 + 0x18],	%o3
	sir	0x1D2A
	fbl	%fcc1,	loop_408
	umulcc	%i5,	0x1DB0,	%o0
	array16	%l6,	%o5,	%l3
	orn	%i6,	%g4,	%l5
loop_408:
	te	%xcc,	0x7
	tpos	%icc,	0x3
	set	0x58, %l2
	stda	%o0,	[%l7 + %l2] 0x2b
	membar	#Sync
	fandnot1s	%f11,	%f26,	%f10
	sdiv	%o6,	0x05B2,	%g5
	edge8l	%g2,	%l1,	%i2
	movcs	%xcc,	%i1,	%l2
	fblg	%fcc0,	loop_409
	mulx	%g6,	0x17C4,	%o7
	ldx	[%l7 + 0x20],	%g7
	sdivcc	%g1,	0x18F8,	%i3
loop_409:
	stb	%g3,	[%l7 + 0x33]
	fmovdg	%xcc,	%f8,	%f27
	std	%o4,	[%l7 + 0x40]
	mova	%icc,	%o2,	%i0
	movvc	%xcc,	%l0,	%i4
	tleu	%xcc,	0x2
	taddcctv	%i7,	0x1CE6,	%o3
	mova	%icc,	%i5,	%o0
	orcc	%l4,	0x0F28,	%l6
	smulcc	%l3,	0x1F32,	%i6
	stbar
	set	0x34, %o7
	ldswa	[%l7 + %o7] 0x15,	%g4
	fnegs	%f8,	%f16
	movrlz	%o5,	0x294,	%l5
	mova	%xcc,	%o1,	%o6
	tvc	%xcc,	0x4
	udiv	%g2,	0x1714,	%l1
	fbu	%fcc3,	loop_410
	fmovdg	%xcc,	%f8,	%f18
	xnor	%g5,	0x1667,	%i1
	membar	0x73
loop_410:
	sethi	0x1040,	%i2
	tvc	%xcc,	0x3
	fmul8x16au	%f28,	%f11,	%f8
	te	%icc,	0x6
	fbu	%fcc1,	loop_411
	sll	%g6,	0x08,	%o7
	array32	%g7,	%l2,	%i3
	edge32	%g1,	%o4,	%o2
loop_411:
	sethi	0x103D,	%i0
	tsubcctv	%l0,	0x0785,	%i4
	wr	%g0,	0x89,	%asi
	lduha	[%l7 + 0x48] %asi,	%i7
	fnands	%f25,	%f5,	%f1
	bgu,pt	%xcc,	loop_412
	xnorcc	%o3,	%i5,	%o0
	fmovsneg	%icc,	%f17,	%f8
	fpsub32s	%f7,	%f25,	%f29
loop_412:
	srl	%l4,	0x17,	%g3
	fmovrsgz	%l6,	%f7,	%f25
	srl	%l3,	%i6,	%g4
	movleu	%icc,	%l5,	%o5
	fmul8x16al	%f22,	%f19,	%f16
	subccc	%o6,	%o1,	%g2
	lduw	[%l7 + 0x60],	%l1
	tcs	%xcc,	0x4
	edge16	%g5,	%i1,	%g6
	wr	%g0,	0x10,	%asi
	lduwa	[%l7 + 0x40] %asi,	%i2
	bvc	loop_413
	fnegs	%f21,	%f12
	orncc	%o7,	0x1481,	%l2
	fbg	%fcc1,	loop_414
loop_413:
	movcc	%xcc,	%g7,	%g1
	edge8	%i3,	%o4,	%o2
	fmovscs	%xcc,	%f0,	%f7
loop_414:
	movne	%icc,	%i0,	%i4
	stb	%i7,	[%l7 + 0x2C]
	addc	%l0,	0x197F,	%i5
	fmovdl	%xcc,	%f17,	%f19
	fone	%f20
	bn,pn	%xcc,	loop_415
	fornot2s	%f26,	%f0,	%f28
	bleu,a	%icc,	loop_416
	add	%o0,	0x0D11,	%l4
loop_415:
	move	%xcc,	%g3,	%l6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_416:
	smul	%l3,	%i6,	%g4
	fbge,a	%fcc2,	loop_417
	movg	%xcc,	%o3,	%l5
	or	%o6,	0x1BDB,	%o5
	addc	%g2,	0x1610,	%l1
loop_417:
	movvc	%icc,	%g5,	%i1
	udivcc	%o1,	0x148C,	%i2
	fbuge	%fcc0,	loop_418
	subcc	%g6,	0x0BE5,	%o7
	sdivcc	%l2,	0x031E,	%g7
	movcc	%icc,	%g1,	%o4
loop_418:
	srlx	%i3,	0x01,	%i0
	udivcc	%o2,	0x0E10,	%i4
	movle	%icc,	%i7,	%i5
	subccc	%l0,	0x1EF5,	%l4
	movleu	%xcc,	%o0,	%g3
	taddcctv	%l3,	0x123A,	%l6
	fcmpgt16	%f20,	%f0,	%g4
	fxors	%f25,	%f24,	%f11
	umulcc	%o3,	%l5,	%i6
	ta	%icc,	0x3
	fble	%fcc2,	loop_419
	fbu,a	%fcc3,	loop_420
	fmovse	%xcc,	%f22,	%f9
	add	%o6,	0x189A,	%g2
loop_419:
	udivcc	%o5,	0x1AC5,	%l1
loop_420:
	popc	%i1,	%g5
	alignaddrl	%i2,	%o1,	%o7
	andncc	%g6,	%g7,	%g1
	subc	%l2,	%o4,	%i3
	bvc,pt	%xcc,	loop_421
	brnz,a	%o2,	loop_422
	fmul8ulx16	%f6,	%f22,	%f18
	fblg,a	%fcc2,	loop_423
loop_421:
	fcmped	%fcc3,	%f22,	%f14
loop_422:
	fcmpne32	%f24,	%f12,	%i4
	orcc	%i0,	0x1715,	%i7
loop_423:
	movl	%xcc,	%l0,	%i5
	and	%o0,	0x0105,	%l4
	tpos	%xcc,	0x7
	fmovrsne	%g3,	%f2,	%f25
	call	loop_424
	fsrc1s	%f10,	%f26
	udiv	%l6,	0x10B4,	%g4
	edge16l	%l3,	%o3,	%l5
loop_424:
	fmovdn	%xcc,	%f28,	%f2
	std	%f30,	[%l7 + 0x48]
	srax	%o6,	%i6,	%o5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sir	0x1CE0
	edge32	%g2,	%i1,	%l1
	tle	%icc,	0x5
	sdivx	%i2,	0x1417,	%g5
	orcc	%o7,	%g6,	%o1
	move	%xcc,	%g1,	%l2
	sir	0x1CF4
	tcc	%xcc,	0x2
	andcc	%o4,	0x0453,	%g7
	nop
	setx	loop_425,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fmovrsne	%i3,	%f29,	%f8
	array16	%o2,	%i4,	%i7
	edge32n	%i0,	%l0,	%o0
loop_425:
	fbo	%fcc0,	loop_426
	tge	%xcc,	0x2
	fmovrdgez	%l4,	%f22,	%f4
	ba,pn	%xcc,	loop_427
loop_426:
	fcmped	%fcc1,	%f30,	%f0
	mova	%xcc,	%i5,	%l6
	orncc	%g3,	0x0CE7,	%l3
loop_427:
	udivx	%g4,	0x0666,	%o3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnegd	%f8,	%f26
	faligndata	%f16,	%f2,	%f12
	movg	%icc,	%l5,	%i6
	fpsub16	%f28,	%f20,	%f18
	tsubcctv	%o6,	%g2,	%o5
	tpos	%xcc,	0x4
	fcmpd	%fcc2,	%f16,	%f24
	mulx	%l1,	0x0545,	%i2
	fmovrslez	%i1,	%f9,	%f15
	or	%o7,	%g6,	%g5
	fnot1s	%f28,	%f23
	fbuge,a	%fcc3,	loop_428
	andn	%o1,	%g1,	%o4
	movpos	%xcc,	%l2,	%i3
	xnor	%g7,	0x1853,	%i4
loop_428:
	edge16	%i7,	%o2,	%l0
	umulcc	%o0,	%l4,	%i5
	movre	%l6,	0x05C,	%g3
	edge8n	%l3,	%i0,	%o3
	fmovdle	%xcc,	%f24,	%f1
	orncc	%l5,	%g4,	%i6
	edge16n	%o6,	%g2,	%o5
	fandnot1s	%f6,	%f13,	%f5
	wr	%g0,	0x04,	%asi
	lda	[%l7 + 0x28] %asi,	%f15
	fpack32	%f24,	%f16,	%f10
	tneg	%icc,	0x6
	fmovsl	%icc,	%f30,	%f13
	fmovspos	%xcc,	%f2,	%f3
	fandnot2	%f18,	%f20,	%f6
	fsrc2	%f26,	%f16
	movre	%l1,	%i1,	%i2
	wr	%g0,	0x89,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	fmovdcc	%xcc,	%f3,	%f26
	movre	%g6,	0x02F,	%o7
	tvc	%xcc,	0x0
	faligndata	%f8,	%f8,	%f26
	sir	0x091F
	sll	%g5,	%g1,	%o4
	bvs,a,pt	%xcc,	loop_429
	bcc,pt	%xcc,	loop_430
	udiv	%l2,	0x04B0,	%i3
	set	0x64, %l6
	stwa	%o1,	[%l7 + %l6] 0x11
loop_429:
	brz,a	%g7,	loop_431
loop_430:
	fmovdleu	%xcc,	%f7,	%f14
	movleu	%xcc,	%i4,	%i7
	edge16l	%o2,	%l0,	%l4
loop_431:
	srax	%i5,	%o0,	%l6
	bcs,pn	%xcc,	loop_432
	fmovrdlz	%g3,	%f24,	%f20
	ta	%icc,	0x5
	set	0x0C, %o5
	lduba	[%l7 + %o5] 0x0c,	%i0
loop_432:
	tcs	%icc,	0x2
	fmuld8sux16	%f17,	%f26,	%f6
	movrgez	%l3,	0x395,	%o3
	smulcc	%g4,	%i6,	%l5
	movrgz	%g2,	%o6,	%l1
	smulcc	%o5,	%i2,	%g6
	mulscc	%o7,	0x0FF3,	%i1
	mova	%icc,	%g1,	%o4
	sub	%g5,	0x0604,	%l2
	flush	%l7 + 0x6C
	tpos	%xcc,	0x7
	tgu	%xcc,	0x6
	orncc	%i3,	0x1AF5,	%o1
	movcc	%icc,	%i4,	%i7
	sllx	%o2,	0x01,	%g7
	fpmerge	%f19,	%f27,	%f6
	movrgz	%l4,	0x32F,	%i5
	tg	%icc,	0x7
	te	%icc,	0x0
	ld	[%l7 + 0x34],	%f30
	fsrc1	%f16,	%f26
	array32	%o0,	%l6,	%g3
	orcc	%l0,	%l3,	%o3
	fones	%f25
	movleu	%icc,	%i0,	%g4
	fmovrslez	%l5,	%f4,	%f24
	movneg	%xcc,	%i6,	%o6
	movrne	%g2,	%l1,	%i2
	fabss	%f24,	%f23
	bl,pt	%icc,	loop_433
	fmovdn	%icc,	%f8,	%f19
	edge32ln	%g6,	%o5,	%i1
	fsrc2	%f18,	%f14
loop_433:
	edge8	%g1,	%o4,	%o7
	fbul,a	%fcc3,	loop_434
	fmovda	%xcc,	%f13,	%f5
	fsrc2	%f4,	%f6
	nop
	set	0x2F, %g1
	ldstub	[%l7 + %g1],	%g5
loop_434:
	udiv	%l2,	0x017D,	%o1
	alignaddrl	%i4,	%i7,	%i3
	srlx	%g7,	%l4,	%o2
	fones	%f11
	movge	%xcc,	%o0,	%l6
	fmovdle	%xcc,	%f7,	%f1
	nop
	setx loop_435, %l0, %l1
	jmpl %l1, %g3
	fmovsneg	%xcc,	%f16,	%f11
	brgz	%i5,	loop_436
	movrlez	%l3,	0x0CE,	%l0
loop_435:
	edge16l	%o3,	%g4,	%i0
	fble,a	%fcc3,	loop_437
loop_436:
	edge32ln	%l5,	%i6,	%o6
	bcc,a,pt	%icc,	loop_438
	addccc	%g2,	0x1CC4,	%l1
loop_437:
	movg	%icc,	%g6,	%i2
	stw	%o5,	[%l7 + 0x24]
loop_438:
	mulx	%g1,	%i1,	%o4
	tgu	%icc,	0x2
	popc	%o7,	%l2
	fxnors	%f7,	%f25,	%f21
	fmovsvs	%icc,	%f25,	%f26
	xnor	%g5,	%i4,	%o1
	movvs	%xcc,	%i3,	%i7
	std	%f28,	[%l7 + 0x08]
	fnot2s	%f20,	%f20
	bshuffle	%f2,	%f14,	%f10
	st	%f23,	[%l7 + 0x2C]
	smul	%g7,	0x1030,	%o2
	movneg	%xcc,	%l4,	%l6
	fnors	%f4,	%f19,	%f11
	stx	%g3,	[%l7 + 0x10]
	xnorcc	%o0,	0x0D40,	%i5
	umulcc	%l3,	%l0,	%g4
	array8	%o3,	%l5,	%i0
	fbue	%fcc2,	loop_439
	tpos	%xcc,	0x0
	subc	%o6,	%g2,	%l1
	and	%g6,	0x16AD,	%i6
loop_439:
	fbo	%fcc0,	loop_440
	move	%icc,	%i2,	%o5
	edge16l	%g1,	%o4,	%i1
	call	loop_441
loop_440:
	fbuge,a	%fcc0,	loop_442
	tl	%xcc,	0x0
	st	%f29,	[%l7 + 0x50]
loop_441:
	nop
	set	0x40, %g3
	ldda	[%l7 + %g3] 0x15,	%f16
loop_442:
	stb	%o7,	[%l7 + 0x19]
	nop
	setx	loop_443,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	orn	%l2,	0x1283,	%i4
	set	0x58, %o1
	lduha	[%l7 + %o1] 0x81,	%g5
loop_443:
	sdivcc	%i3,	0x0254,	%i7
	umulcc	%g7,	0x1ECE,	%o2
	fmovsvs	%icc,	%f11,	%f13
	tl	%xcc,	0x7
	fmovsneg	%icc,	%f29,	%f28
	ldsb	[%l7 + 0x35],	%l4
	fcmpeq32	%f20,	%f6,	%o1
	mova	%icc,	%l6,	%o0
	fcmps	%fcc2,	%f18,	%f17
	tcs	%icc,	0x5
	movcs	%xcc,	%i5,	%g3
	ldd	[%l7 + 0x40],	%l2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8ln	%l0,	%g4,	%o3
	orncc	%l5,	0x0C70,	%i0
	edge16n	%o6,	%l1,	%g2
	andcc	%g6,	%i2,	%i6
	and	%g1,	%o4,	%o5
	orn	%o7,	%i1,	%i4
	wr	%g0,	0x23,	%asi
	stxa	%l2,	[%l7 + 0x78] %asi
	membar	#Sync
	movrlz	%g5,	%i7,	%g7
	brz,a	%o2,	loop_444
	movrgez	%i3,	0x048,	%o1
	tle	%xcc,	0x2
	fmovdleu	%icc,	%f17,	%f25
loop_444:
	fbg,a	%fcc2,	loop_445
	ld	[%l7 + 0x50],	%f13
	te	%xcc,	0x5
	taddcctv	%l4,	0x1A06,	%l6
loop_445:
	xorcc	%i5,	%g3,	%l3
	smul	%o0,	0x1647,	%l0
	smulcc	%o3,	%g4,	%i0
	orncc	%l5,	0x18B3,	%o6
	edge8l	%l1,	%g6,	%i2
	fbuge,a	%fcc2,	loop_446
	movrgez	%i6,	0x3BD,	%g1
	movle	%xcc,	%g2,	%o5
	fmovdcc	%icc,	%f21,	%f8
loop_446:
	edge32	%o4,	%o7,	%i4
	tn	%icc,	0x4
	movvs	%icc,	%l2,	%i1
	lduh	[%l7 + 0x22],	%g5
	udivx	%g7,	0x1B99,	%i7
	membar	0x7A
	fmuld8ulx16	%f31,	%f31,	%f28
	fmovdne	%xcc,	%f3,	%f5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdl	%xcc,	%f1,	%f8
	sub	%i3,	%o2,	%o1
	tg	%icc,	0x0
	movre	%l4,	%i5,	%l6
	fmovdvs	%icc,	%f5,	%f27
	bpos	loop_447
	tsubcctv	%g3,	%l3,	%l0
	fmovdcc	%xcc,	%f23,	%f30
	siam	0x0
loop_447:
	fcmps	%fcc1,	%f13,	%f7
	udiv	%o3,	0x123A,	%o0
	srax	%i0,	0x0F,	%l5
	fnegs	%f16,	%f23
	array8	%g4,	%l1,	%o6
	tvc	%xcc,	0x1
	fmovdleu	%xcc,	%f30,	%f7
	movcc	%xcc,	%g6,	%i2
	movle	%xcc,	%i6,	%g1
	movleu	%icc,	%g2,	%o5
	set	0x3A, %l3
	lduha	[%l7 + %l3] 0x04,	%o7
	subc	%i4,	%o4,	%l2
	bshuffle	%f26,	%f0,	%f26
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bpos,pt	%xcc,	loop_448
	fnegs	%f23,	%f30
	taddcctv	%i1,	%g5,	%g7
	sth	%i7,	[%l7 + 0x40]
loop_448:
	fmuld8sux16	%f26,	%f9,	%f2
	fsrc2	%f22,	%f28
	wr	%g0,	0x89,	%asi
	lduba	[%l7 + 0x5C] %asi,	%i3
	add	%l7,	0x68,	%l6
	wr	%g0,	0x19,	%asi
	lda	[%l6] %asi,	%o1
	casa	[%l6] %asi,	%o1,	%l4
	fmovdpos	%icc,	%f26,	%f25
	tgu	%xcc,	0x5
	edge8l	%o2,	%l6,	%g3
	tcc	%xcc,	0x4
	xor	%l3,	%l0,	%i5
	srax	%o0,	0x09,	%i0
	fxor	%f30,	%f28,	%f18
	addccc	%o3,	0x17B4,	%g4
	fpadd32s	%f17,	%f6,	%f1
	edge32ln	%l1,	%l5,	%o6
	fzero	%f0
	movvc	%icc,	%i2,	%g6
	bshuffle	%f24,	%f4,	%f22
	orncc	%i6,	0x049F,	%g1
	umul	%g2,	0x1B48,	%o5
	tsubcctv	%o7,	0x01AD,	%i4
	fmovsvc	%xcc,	%f10,	%f29
	bn,a,pn	%xcc,	loop_449
	prefetch	[%l7 + 0x40],	 0x0
	fxnor	%f14,	%f8,	%f6
	swap	[%l7 + 0x78],	%o4
loop_449:
	ld	[%l7 + 0x1C],	%f16
	nop
	set	0x4C, %l4
	ldsw	[%l7 + %l4],	%i1
	srl	%l2,	%g5,	%g7
	nop
	set	0x10, %i5
	stx	%i7,	[%l7 + %i5]
	tn	%icc,	0x6
	taddcc	%o1,	%l4,	%i3
	fmovrdne	%o2,	%f28,	%f0
	fandnot1	%f28,	%f2,	%f30
	bcc,pn	%xcc,	loop_450
	fabsd	%f10,	%f18
	fcmpeq32	%f24,	%f14,	%g3
	array16	%l6,	%l0,	%l3
loop_450:
	fmovdneg	%xcc,	%f30,	%f16
	sllx	%i5,	0x0A,	%o0
	fmovsn	%icc,	%f17,	%f19
	ldd	[%l7 + 0x30],	%f24
	fpadd16s	%f21,	%f19,	%f19
	fors	%f22,	%f12,	%f30
	sdivx	%i0,	0x094A,	%o3
	tneg	%icc,	0x6
	nop
	setx loop_451, %l0, %l1
	jmpl %l1, %l1
	tgu	%xcc,	0x0
	tvc	%xcc,	0x1
	tg	%icc,	0x7
loop_451:
	movge	%icc,	%l5,	%g4
	movrgez	%o6,	%i2,	%g6
	edge32n	%i6,	%g1,	%o5
	edge16l	%o7,	%g2,	%o4
	movrgez	%i4,	0x3DC,	%l2
	tvs	%icc,	0x6
	add	%g5,	%g7,	%i1
	fcmpgt32	%f16,	%f26,	%i7
	udivx	%o1,	0x0EAB,	%l4
	fmovrsne	%i3,	%f5,	%f17
	stb	%g3,	[%l7 + 0x73]
	sir	0x0185
	andncc	%l6,	%l0,	%o2
	addc	%l3,	0x12E8,	%i5
	orn	%i0,	%o0,	%l1
	brgz	%o3,	loop_452
	edge16n	%l5,	%o6,	%g4
	ldd	[%l7 + 0x60],	%i2
	fbuge,a	%fcc2,	loop_453
loop_452:
	brz,a	%i6,	loop_454
	addc	%g6,	0x11A5,	%o5
	ta	%icc,	0x5
loop_453:
	movn	%icc,	%g1,	%g2
loop_454:
	subc	%o4,	%o7,	%i4
	movrgz	%g5,	%g7,	%l2
	fbl,a	%fcc1,	loop_455
	tl	%xcc,	0x7
	umulcc	%i7,	0x12D5,	%i1
	movge	%icc,	%o1,	%i3
loop_455:
	andn	%l4,	%g3,	%l0
	fsrc1s	%f13,	%f14
	subccc	%l6,	0x07D5,	%o2
	fmovrdlz	%i5,	%f10,	%f20
	call	loop_456
	ldsb	[%l7 + 0x7B],	%i0
	movg	%xcc,	%l3,	%o0
	ldstub	[%l7 + 0x0D],	%l1
loop_456:
	fxors	%f2,	%f29,	%f1
	fmovscc	%icc,	%f4,	%f24
	fbul,a	%fcc1,	loop_457
	fnor	%f22,	%f20,	%f20
	wr	%g0,	0x0c,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
loop_457:
	nop
	set	0x52, %i0
	lduha	[%l7 + %i0] 0x89,	%o3
	array16	%o6,	%g4,	%l5
	edge8n	%i2,	%i6,	%g6
	fsrc1s	%f0,	%f17
	xorcc	%o5,	%g1,	%g2
	fbue,a	%fcc3,	loop_458
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movvs	%icc,	%o7,	%i4
	and	%o4,	0x0342,	%g5
loop_458:
	nop
	set	0x20, %g6
	std	%g6,	[%l7 + %g6]
	ble,pn	%icc,	loop_459
	for	%f24,	%f26,	%f30
	tsubcctv	%i7,	%i1,	%l2
	brlez	%i3,	loop_460
loop_459:
	tvs	%xcc,	0x6
	bgu,a,pn	%icc,	loop_461
	and	%o1,	%l4,	%g3
loop_460:
	nop
	set	0x5E, %i4
	lduh	[%l7 + %i4],	%l0
	fzeros	%f10
loop_461:
	sdivx	%o2,	0x1782,	%i5
	movcs	%icc,	%i0,	%l3
	stbar
	ldstub	[%l7 + 0x5F],	%l6
	movrlez	%o0,	%o3,	%l1
	edge8n	%o6,	%l5,	%g4
	smul	%i6,	%g6,	%i2
	ble,a	loop_462
	fnot2	%f2,	%f12
	fmovd	%f26,	%f22
	tl	%xcc,	0x7
loop_462:
	fmovsl	%xcc,	%f4,	%f10
	wr	%g0,	0x20,	%asi
	stxa	%g1,	[%g0 + 0x20] %asi
	fbe	%fcc3,	loop_463
	tn	%icc,	0x3
	fble	%fcc3,	loop_464
	fba	%fcc1,	loop_465
loop_463:
	fbuge	%fcc0,	loop_466
	sra	%o5,	%g2,	%i4
loop_464:
	fcmpeq32	%f24,	%f8,	%o7
loop_465:
	fbn,a	%fcc2,	loop_467
loop_466:
	tge	%icc,	0x7
	or	%g5,	%g7,	%o4
	array32	%i1,	%i7,	%i3
loop_467:
	fabsd	%f8,	%f12
	stbar
	nop
	set	0x48, %o0
	stx	%l2,	[%l7 + %o0]
	subcc	%l4,	0x1EDD,	%g3
	flush	%l7 + 0x74
	set	0x37, %o4
	ldstuba	[%l7 + %o4] 0x19,	%l0
	fpack32	%f24,	%f8,	%f14
	edge16ln	%o2,	%i5,	%o1
	array32	%l3,	%i0,	%o0
	wr	%g0,	0x19,	%asi
	lda	[%l7 + 0x50] %asi,	%f27
	tne	%xcc,	0x1
	subc	%o3,	%l1,	%o6
	movn	%icc,	%l5,	%l6
	smulcc	%g4,	%i6,	%i2
	add	%l7,	0x64,	%l6
	wr	%g0,	0x11,	%asi
	casa	[%l6] 0x11,	%g6,	%g1
	sdivcc	%g2,	0x1C7A,	%i4
	fmovdpos	%icc,	%f28,	%f22
	taddcctv	%o5,	0x0641,	%o7
	set	0x74, %o3
	sta	%f26,	[%l7 + %o3] 0x88
	bvc,a,pn	%icc,	loop_468
	tn	%xcc,	0x5
	movgu	%xcc,	%g7,	%o4
	sllx	%g5,	%i1,	%i3
loop_468:
	edge8	%i7,	%l2,	%l4
	set	0x18, %l1
	ldxa	[%g0 + %l1] 0x20,	%l0
	set	0x0, %i2
	stxa	%g3,	[%g0 + %i2] 0x57
	bcs	loop_469
	fsrc1s	%f24,	%f26
	edge32ln	%i5,	%o1,	%o2
	move	%xcc,	%i0,	%o0
loop_469:
	tpos	%xcc,	0x0
	fmovsneg	%xcc,	%f10,	%f0
	sdivcc	%l3,	0x0225,	%o3
	movrne	%o6,	%l1,	%l5
	subccc	%l6,	0x178A,	%i6
	wr	%g0,	0x04,	%asi
	prefetcha	[%l7 + 0x18] %asi,	 0x3
	edge32	%g4,	%g6,	%g1
	array16	%i4,	%o5,	%o7
	brlz	%g2,	loop_470
	udivx	%g7,	0x01A0,	%g5
	edge8n	%i1,	%o4,	%i3
	stx	%i7,	[%l7 + 0x30]
loop_470:
	srl	%l2,	%l4,	%g3
	wr	%g0,	0x04,	%asi
	stha	%l0,	[%l7 + 0x10] %asi
	udiv	%o1,	0x0B75,	%o2
	subccc	%i5,	0x17BB,	%i0
	edge8n	%l3,	%o0,	%o6
	set	0x7C, %g2
	lda	[%l7 + %g2] 0x14,	%f14
	smulcc	%l1,	%l5,	%l6
	ldx	[%l7 + 0x68],	%o3
	tge	%xcc,	0x3
	sub	%i6,	0x19B7,	%i2
	tn	%icc,	0x6
	fcmps	%fcc0,	%f16,	%f8
	tleu	%icc,	0x7
	movpos	%icc,	%g4,	%g6
	umul	%i4,	0x076F,	%o5
	fmul8ulx16	%f10,	%f24,	%f30
	movne	%icc,	%o7,	%g2
	wr	%g0,	0xe3,	%asi
	stba	%g1,	[%l7 + 0x5B] %asi
	membar	#Sync
	fmovrdgz	%g5,	%f12,	%f14
	set	0x40, %l5
	ldda	[%l7 + %l5] 0x11,	%f16
	array16	%i1,	%o4,	%i3
	array8	%i7,	%l2,	%l4
	tvs	%icc,	0x3
	tl	%icc,	0x0
	fbn	%fcc0,	loop_471
	edge16l	%g3,	%g7,	%o1
	fmovsgu	%xcc,	%f20,	%f22
	movle	%icc,	%o2,	%l0
loop_471:
	fbne,a	%fcc1,	loop_472
	edge32	%i5,	%l3,	%i0
	st	%f17,	[%l7 + 0x50]
	wr	%g0,	0x04,	%asi
	lduba	[%l7 + 0x7F] %asi,	%o6
loop_472:
	sll	%l1,	0x08,	%o0
	fnors	%f18,	%f22,	%f27
	lduw	[%l7 + 0x48],	%l5
	subcc	%o3,	%l6,	%i6
	fbl	%fcc0,	loop_473
	addc	%i2,	%g4,	%g6
	movpos	%icc,	%i4,	%o7
	mova	%xcc,	%g2,	%g1
loop_473:
	fxnor	%f8,	%f24,	%f30
	tn	%icc,	0x4
	umulcc	%g5,	0x0BCF,	%i1
	stw	%o5,	[%l7 + 0x78]
	mulx	%o4,	%i3,	%l2
	sethi	0x0D7D,	%l4
	movge	%xcc,	%i7,	%g7
	movle	%icc,	%o1,	%o2
	add	%l7,	0x40,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] %asi,	%l0,	%g3
	fbue	%fcc2,	loop_474
	edge16ln	%i5,	%l3,	%i0
	mulscc	%l1,	%o6,	%l5
	andn	%o3,	0x1ED3,	%l6
loop_474:
	taddcctv	%i6,	0x068A,	%i2
	ldx	[%l7 + 0x60],	%g4
	ld	[%l7 + 0x4C],	%f10
	fpsub16	%f30,	%f10,	%f16
	sdiv	%o0,	0x12EE,	%i4
	mulx	%o7,	%g6,	%g2
	sdivcc	%g5,	0x0FC5,	%i1
	alignaddr	%g1,	%o4,	%o5
	fmul8x16	%f25,	%f8,	%f22
	orn	%l2,	%i3,	%i7
	tsubcc	%l4,	%g7,	%o2
	tl	%xcc,	0x6
	ta	%icc,	0x2
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x60] %asi,	%o1
	addcc	%l0,	0x1B5D,	%i5
	movrne	%l3,	0x11C,	%g3
	stbar
	edge8n	%l1,	%o6,	%i0
	bg,a	loop_475
	tle	%xcc,	0x2
	movrlez	%o3,	0x1BC,	%l6
	edge32n	%l5,	%i2,	%i6
loop_475:
	fmovdle	%xcc,	%f10,	%f4
	movleu	%icc,	%o0,	%i4
	edge16	%g4,	%o7,	%g2
	tleu	%xcc,	0x6
	edge16ln	%g6,	%i1,	%g1
	movgu	%xcc,	%o4,	%g5
	tcc	%icc,	0x5
	lduh	[%l7 + 0x38],	%l2
	edge16ln	%i3,	%i7,	%o5
	add	%g7,	0x08EB,	%o2
	set	0x75, %i7
	ldsba	[%l7 + %i7] 0x88,	%l4
	popc	%o1,	%l0
	sdivx	%i5,	0x04B8,	%g3
	fbuge	%fcc2,	loop_476
	fmovsa	%xcc,	%f28,	%f29
	andncc	%l1,	%o6,	%l3
	set	0x18, %g5
	stda	%i0,	[%l7 + %g5] 0x14
loop_476:
	movleu	%xcc,	%o3,	%l5
	alignaddrl	%l6,	%i6,	%i2
	movneg	%xcc,	%i4,	%g4
	tle	%icc,	0x0
	edge8n	%o0,	%o7,	%g6
	tvc	%icc,	0x7
	edge8l	%g2,	%g1,	%o4
	membar	0x61
	bvs,a,pt	%xcc,	loop_477
	movpos	%xcc,	%g5,	%l2
	tne	%icc,	0x2
	std	%i2,	[%l7 + 0x58]
loop_477:
	or	%i1,	%o5,	%i7
	alignaddr	%g7,	%l4,	%o2
	std	%l0,	[%l7 + 0x20]
	fmovdn	%xcc,	%f20,	%f24
	fzero	%f22
	nop
	setx	loop_478,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movleu	%icc,	%i5,	%o1
	ble	loop_479
	fandnot1s	%f9,	%f22,	%f14
loop_478:
	tleu	%icc,	0x3
	edge32n	%l1,	%g3,	%o6
loop_479:
	fmovrslez	%l3,	%f15,	%f25
	fmovsneg	%xcc,	%f0,	%f16
	and	%o3,	0x1639,	%l5
	tl	%xcc,	0x2
	array8	%i0,	%i6,	%i2
	udiv	%i4,	0x0C68,	%l6
	movvc	%icc,	%g4,	%o0
	taddcctv	%o7,	%g2,	%g1
	bne,a,pt	%xcc,	loop_480
	fba	%fcc2,	loop_481
	fxor	%f4,	%f10,	%f16
	movrlez	%g6,	%g5,	%o4
loop_480:
	udivcc	%i3,	0x094B,	%l2
loop_481:
	addccc	%i1,	%i7,	%g7
	movcc	%icc,	%o5,	%l4
	move	%xcc,	%o2,	%l0
	fnors	%f6,	%f29,	%f22
	movrne	%o1,	%l1,	%g3
	mulscc	%i5,	%o6,	%o3
	taddcctv	%l3,	%l5,	%i0
	movrgez	%i2,	%i4,	%i6
	membar	0x42
	movrlez	%l6,	0x04A,	%o0
	orcc	%o7,	0x1A45,	%g4
	andn	%g2,	%g6,	%g1
	movn	%xcc,	%o4,	%i3
	tsubcc	%g5,	%i1,	%l2
	movge	%xcc,	%i7,	%o5
	taddcctv	%l4,	0x14A4,	%g7
	stbar
	andn	%l0,	0x012B,	%o1
	xnor	%o2,	0x155F,	%l1
	subccc	%i5,	%g3,	%o6
	tg	%xcc,	0x6
	fmovrde	%o3,	%f26,	%f24
	tle	%xcc,	0x4
	fmovsgu	%icc,	%f27,	%f22
	andn	%l5,	%i0,	%l3
	edge8n	%i4,	%i2,	%i6
	movvc	%xcc,	%o0,	%o7
	mulx	%l6,	0x0ED7,	%g2
	tleu	%icc,	0x5
	movrlez	%g6,	0x123,	%g4
	tl	%icc,	0x5
	movleu	%xcc,	%o4,	%g1
	array32	%g5,	%i1,	%l2
	edge32l	%i3,	%o5,	%i7
	fbu,a	%fcc3,	loop_482
	fxors	%f7,	%f16,	%f24
	smul	%g7,	0x0E42,	%l4
	fands	%f1,	%f25,	%f30
loop_482:
	smul	%l0,	%o1,	%l1
	pdist	%f8,	%f28,	%f14
	be,a,pn	%xcc,	loop_483
	fmovrde	%o2,	%f30,	%f22
	ble,a	%icc,	loop_484
	movrlez	%g3,	0x207,	%o6
loop_483:
	movvs	%xcc,	%o3,	%i5
	sir	0x10C3
loop_484:
	nop
	set	0x48, %i1
	stda	%l4,	[%l7 + %i1] 0x89
	fpmerge	%f4,	%f20,	%f24
	array16	%l3,	%i4,	%i2
	movne	%icc,	%i0,	%o0
	call	loop_485
	fmul8ulx16	%f18,	%f28,	%f30
	fmovdneg	%xcc,	%f11,	%f25
	edge16n	%o7,	%l6,	%g2
loop_485:
	fnegs	%f7,	%f30
	addc	%i6,	%g4,	%o4
	udiv	%g1,	0x028D,	%g6
	fnands	%f15,	%f30,	%f6
	mova	%xcc,	%i1,	%g5
	fpsub32	%f6,	%f24,	%f18
	wr	%g0,	0x0c,	%asi
	stxa	%i3,	[%l7 + 0x08] %asi
	tl	%icc,	0x7
	edge16	%l2,	%i7,	%g7
	ldsh	[%l7 + 0x4A],	%o5
	fornot2s	%f22,	%f20,	%f4
	stx	%l4,	[%l7 + 0x28]
	smulcc	%o1,	%l0,	%l1
	fsrc2	%f20,	%f16
	add	%o2,	%g3,	%o6
	sethi	0x1B61,	%i5
	smul	%o3,	0x11CA,	%l5
	tle	%xcc,	0x5
	movre	%i4,	0x008,	%l3
	fsrc1	%f28,	%f30
	brlz	%i0,	loop_486
	fbn	%fcc2,	loop_487
	tvc	%xcc,	0x6
	andncc	%i2,	%o0,	%l6
loop_486:
	nop
	set	0x30, %l0
	lduw	[%l7 + %l0],	%g2
loop_487:
	fmovdge	%xcc,	%f27,	%f8
	add	%o7,	0x0569,	%i6
	wr	%g0,	0x10,	%asi
	prefetcha	[%l7 + 0x08] %asi,	 0x1
	movrlez	%g4,	0x2CB,	%g6
	udivx	%i1,	0x1805,	%g5
	fmovsneg	%xcc,	%f5,	%f9
	movrlez	%i3,	0x076,	%l2
	sir	0x1336
	fmovsvc	%icc,	%f24,	%f19
	fmovs	%f11,	%f4
	movrgez	%i7,	%g1,	%o5
	fpadd32s	%f5,	%f12,	%f25
	sra	%l4,	%g7,	%l0
	tl	%icc,	0x7
	fbule,a	%fcc2,	loop_488
	array32	%o1,	%l1,	%o2
	movre	%g3,	0x09D,	%o6
	subcc	%o3,	%i5,	%i4
loop_488:
	nop
	set	0x08, %i3
	prefetcha	[%l7 + %i3] 0x18,	 0x0
	edge32n	%l5,	%i2,	%o0
	ta	%xcc,	0x0
	alignaddr	%i0,	%g2,	%l6
	fandnot2	%f18,	%f16,	%f22
	srl	%o7,	0x1A,	%o4
	tg	%icc,	0x5
	umulcc	%g4,	%i6,	%i1
	sethi	0x0BCD,	%g5
	fnegs	%f25,	%f31
	tcs	%icc,	0x4
	tsubcctv	%g6,	0x0820,	%i3
	move	%icc,	%l2,	%i7
	sllx	%o5,	0x0D,	%g1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovse	%icc,	%f10,	%f22
	move	%xcc,	%l4,	%l0
	ta	%icc,	0x1
	edge8n	%o1,	%g7,	%o2
	fcmpgt16	%f20,	%f2,	%l1
	umulcc	%g3,	0x1E2D,	%o6
	fbg,a	%fcc2,	loop_489
	tn	%icc,	0x1
	fsrc1s	%f8,	%f8
	fmul8x16au	%f9,	%f25,	%f14
loop_489:
	fnot2	%f16,	%f14
	bne,a,pt	%xcc,	loop_490
	orn	%i5,	%o3,	%i4
	tge	%xcc,	0x4
	fmovdpos	%xcc,	%f23,	%f23
loop_490:
	tgu	%xcc,	0x2
	std	%l2,	[%l7 + 0x78]
	std	%f20,	[%l7 + 0x58]
	wr	%g0,	0x57,	%asi
	stxa	%i2,	[%g0 + 0x0] %asi
	edge16	%l5,	%o0,	%g2
	stw	%l6,	[%l7 + 0x44]
	wr	%g0,	0x89,	%asi
	ldsba	[%l7 + 0x1E] %asi,	%o7
	ldsh	[%l7 + 0x4E],	%i0
	tsubcctv	%o4,	%i6,	%g4
	smul	%g5,	%i1,	%i3
	tsubcc	%l2,	%i7,	%g6
	fbne	%fcc0,	loop_491
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orncc	%o5,	%l4,	%g1
	wr	%g0,	0x89,	%asi
	stwa	%o1,	[%l7 + 0x64] %asi
loop_491:
	addccc	%g7,	%o2,	%l1
	sllx	%g3,	0x0C,	%l0
	movle	%xcc,	%o6,	%o3
	fmovsne	%icc,	%f10,	%f11
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tleu	%xcc,	0x3
	fnot2s	%f28,	%f11
	mulx	%i5,	%i4,	%i2
	wr	%g0,	0x80,	%asi
	ldxa	[%l7 + 0x28] %asi,	%l5
	sdivcc	%l3,	0x14C3,	%o0
	add	%l7,	0x0C,	%l6
	wr	%g0,	0x11,	%asi
	casa	[%l6] %asi,	%l6,	%o7
	brgz	%g2,	loop_492
	fand	%f24,	%f2,	%f18
	taddcctv	%i0,	0x19A5,	%o4
	movrgez	%i6,	0x046,	%g4
loop_492:
	array8	%g5,	%i1,	%i3
	fmovdne	%icc,	%f25,	%f23
	xorcc	%l2,	%g6,	%o5
	flush	%l7 + 0x48
	edge8l	%i7,	%l4,	%o1
	move	%xcc,	%g7,	%o2
	array8	%g1,	%l1,	%g3
	sdiv	%o6,	0x104C,	%l0
	tg	%icc,	0x6
	movleu	%icc,	%i5,	%o3
	fmul8x16al	%f0,	%f20,	%f30
	sub	%i2,	0x0BFB,	%i4
	smulcc	%l3,	0x0610,	%o0
	fmovdvs	%icc,	%f27,	%f22
	fbuge,a	%fcc1,	loop_493
	movrgz	%l5,	%l6,	%g2
	tl	%xcc,	0x1
	orncc	%o7,	0x079C,	%o4
loop_493:
	edge32	%i6,	%i0,	%g5
	fnand	%f14,	%f16,	%f10
	edge16n	%i1,	%i3,	%g4
	srl	%l2,	0x12,	%g6
	set	0x54, %g4
	ldswa	[%l7 + %g4] 0x88,	%i7
	tg	%icc,	0x4
	array32	%l4,	%o5,	%g7
	fmovrsne	%o2,	%f19,	%f17
	set	0x40, %i6
	ldda	[%l7 + %i6] 0x19,	%f0
	movrgez	%g1,	%l1,	%o1
	srl	%g3,	0x10,	%l0
	fbne,a	%fcc0,	loop_494
	umulcc	%o6,	0x06BC,	%i5
	fmul8x16	%f8,	%f6,	%f24
	fmovrsgez	%o3,	%f24,	%f26
loop_494:
	movrgez	%i2,	0x33A,	%l3
	te	%xcc,	0x3
	swap	[%l7 + 0x54],	%i4
	set	0x21, %o6
	ldstuba	[%l7 + %o6] 0x11,	%o0
	fble	%fcc2,	loop_495
	sll	%l5,	0x00,	%g2
	brgz	%o7,	loop_496
	brlez,a	%o4,	loop_497
loop_495:
	edge16	%l6,	%i0,	%i6
	tvs	%icc,	0x1
loop_496:
	taddcctv	%g5,	%i3,	%g4
loop_497:
	bneg,a	loop_498
	edge16ln	%i1,	%l2,	%g6
	subccc	%l4,	0x0722,	%i7
	set	0x68, %g7
	ldxa	[%l7 + %g7] 0x0c,	%g7
loop_498:
	movre	%o2,	0x381,	%g1
	sethi	0x0077,	%l1
	srlx	%o5,	%o1,	%l0
	fsrc2s	%f20,	%f30
	stw	%g3,	[%l7 + 0x54]
	fsrc1	%f16,	%f20
	fmovrdne	%i5,	%f14,	%f8
	fpsub32	%f22,	%f8,	%f14
	tsubcc	%o3,	%i2,	%o6
	fmovrse	%l3,	%f7,	%f8
	fmovda	%xcc,	%f1,	%f7
	brnz	%o0,	loop_499
	fcmpes	%fcc0,	%f2,	%f3
	movne	%icc,	%i4,	%g2
	subccc	%o7,	%o4,	%l6
loop_499:
	movcc	%icc,	%i0,	%i6
	xor	%g5,	0x008B,	%i3
	fbo,a	%fcc1,	loop_500
	stbar
	edge16l	%g4,	%l5,	%i1
	subc	%g6,	0x01BB,	%l4
loop_500:
	movvc	%icc,	%l2,	%i7
	fmovsle	%xcc,	%f5,	%f11
	edge8ln	%g7,	%g1,	%l1
	udiv	%o5,	0x11FF,	%o2
	edge32l	%o1,	%l0,	%i5
	fmul8x16al	%f3,	%f13,	%f2
	fbne	%fcc1,	loop_501
	edge16	%g3,	%o3,	%o6
	edge16n	%i2,	%l3,	%o0
	tcs	%xcc,	0x0
loop_501:
	fnot2	%f16,	%f28
	movne	%xcc,	%i4,	%g2
	movg	%xcc,	%o7,	%l6
	movrlz	%o4,	0x068,	%i0
	fxor	%f8,	%f26,	%f26
	orn	%i6,	0x16F6,	%g5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bvc,pt	%xcc,	loop_502
	movre	%g4,	0x1FE,	%l5
	tn	%icc,	0x4
	movrgz	%i3,	0x090,	%g6
loop_502:
	ba,a	%xcc,	loop_503
	edge32ln	%l4,	%l2,	%i1
	fmovsleu	%icc,	%f6,	%f10
	addcc	%g7,	%i7,	%g1
loop_503:
	lduw	[%l7 + 0x38],	%o5
	srl	%l1,	0x15,	%o1
	lduh	[%l7 + 0x0A],	%l0
	brgez,a	%i5,	loop_504
	fba,a	%fcc2,	loop_505
	fbue	%fcc1,	loop_506
	tn	%xcc,	0x7
loop_504:
	taddcctv	%g3,	0x0A29,	%o3
loop_505:
	xnor	%o2,	%i2,	%o6
loop_506:
	nop
	wr	%g0,	0x80,	%asi
	swapa	[%l7 + 0x5C] %asi,	%o0
	array32	%l3,	%i4,	%g2
	set	0x36, %o2
	ldsha	[%l7 + %o2] 0x11,	%o7
	tle	%xcc,	0x5
	bl,a	%icc,	loop_507
	fblg	%fcc2,	loop_508
	sdivcc	%o4,	0x1578,	%l6
	for	%f2,	%f30,	%f30
loop_507:
	fpsub32s	%f21,	%f1,	%f18
loop_508:
	tcs	%xcc,	0x5
	sra	%i6,	%g5,	%i0
	movle	%icc,	%g4,	%i3
	addcc	%g6,	0x1D8F,	%l5
	fpsub16	%f6,	%f0,	%f28
	set	0x58, %l2
	lduba	[%l7 + %l2] 0x19,	%l2
	alignaddrl	%i1,	%l4,	%i7
	fble,a	%fcc3,	loop_509
	tvs	%icc,	0x3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrsgz	%g7,	%f22,	%f20
loop_509:
	andcc	%g1,	%o5,	%l1
	wr	%g0,	0x19,	%asi
	stda	%l0,	[%l7 + 0x78] %asi
	fble,a	%fcc2,	loop_510
	add	%i5,	%g3,	%o3
	smulcc	%o2,	0x1249,	%i2
	tsubcctv	%o6,	%o1,	%o0
loop_510:
	fmuld8ulx16	%f23,	%f23,	%f16
	smulcc	%i4,	0x1265,	%g2
	fmovs	%f6,	%f21
	sdiv	%o7,	0x0FC4,	%l3
	tle	%icc,	0x0
	ldsb	[%l7 + 0x4E],	%o4
	add	%l7,	0x40,	%l6
	wr	%g0,	0x0c,	%asi
	casa	[%l6] 0x0c,	%l6,	%g5
	wr	%g0,	0x10,	%asi
	lduwa	[%l7 + 0x28] %asi,	%i6
	movle	%icc,	%g4,	%i3
	bgu,pt	%xcc,	loop_511
	fmovrslez	%g6,	%f13,	%f1
	fpackfix	%f18,	%f27
	fpsub16	%f28,	%f14,	%f28
loop_511:
	subc	%l5,	%i0,	%l2
	tvc	%xcc,	0x2
	sdiv	%i1,	0x0AEF,	%l4
	bpos	loop_512
	sra	%i7,	%g7,	%o5
	subc	%l1,	%g1,	%l0
	wr	%g0,	0xea,	%asi
	stba	%i5,	[%l7 + 0x5D] %asi
	membar	#Sync
loop_512:
	fba	%fcc3,	loop_513
	movcc	%xcc,	%o3,	%o2
	wr	%g0,	0x0c,	%asi
	stwa	%i2,	[%l7 + 0x58] %asi
loop_513:
	fmovrdlez	%o6,	%f14,	%f16
	fbuge,a	%fcc1,	loop_514
	subccc	%o1,	0x0BC5,	%g3
	sethi	0x111D,	%i4
	fbg	%fcc1,	loop_515
loop_514:
	umulcc	%g2,	0x08BA,	%o7
	edge16n	%l3,	%o0,	%o4
	fbl,a	%fcc2,	loop_516
loop_515:
	nop
	set	0x08, %l6
	std	%g4,	[%l7 + %l6]
	tpos	%icc,	0x0
	movleu	%icc,	%i6,	%l6
loop_516:
	edge32	%g4,	%i3,	%g6
	subc	%i0,	0x13C6,	%l2
	array8	%i1,	%l4,	%l5
	alignaddrl	%g7,	%i7,	%l1
	tvc	%icc,	0x0
	movneg	%icc,	%o5,	%l0
	ldub	[%l7 + 0x30],	%i5
	set	0x58, %o7
	stha	%g1,	[%l7 + %o7] 0x81
	fmul8x16al	%f13,	%f17,	%f6
	add	%l7,	0x34,	%l6
	wr	%g0,	0x0c,	%asi
	lda	[%l6] %asi,	%o3
	casa	[%l6] 0x0c,	%o3,	%i2
	fnegs	%f7,	%f29
	sdivx	%o6,	0x1765,	%o1
	addccc	%g3,	%o2,	%i4
	add	%l7,	0x20,	%l6
	wr	%g0,	0x11,	%asi
	casxa	[%l6] %asi,	%o7,	%g2
	popc	0x06C1,	%l3
	bvc,a	loop_517
	array8	%o0,	%o4,	%i6
	fmovdcs	%icc,	%f18,	%f22
	movge	%icc,	%g5,	%l6
loop_517:
	nop
	wr	%g0,	0x0c,	%asi
	stda	%g4,	[%l7 + 0x08] %asi
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subc	%g6,	0x1628,	%i3
	bge,pt	%xcc,	loop_518
	movne	%xcc,	%i0,	%l2
	pdist	%f4,	%f18,	%f2
	tg	%icc,	0x6
loop_518:
	fors	%f10,	%f31,	%f9
	smulcc	%i1,	0x1A15,	%l4
	ldstub	[%l7 + 0x60],	%l5
	fmovrse	%g7,	%f11,	%f0
	bvc	loop_519
	mulx	%i7,	0x03B0,	%o5
	edge16	%l0,	%l1,	%i5
	fands	%f16,	%f24,	%f4
loop_519:
	nop
	set	0x40, %o5
	stda	%f16,	[%l7 + %o5] 0x11
	movne	%xcc,	%o3,	%i2
	subc	%o6,	%g1,	%g3
	movl	%xcc,	%o1,	%i4
	movcc	%icc,	%o2,	%g2
	orcc	%o7,	0x0AD8,	%o0
	prefetch	[%l7 + 0x60],	 0x2
	addccc	%o4,	0x13D3,	%i6
	fmovsg	%xcc,	%f25,	%f22
	sll	%g5,	0x04,	%l6
	addc	%l3,	%g6,	%i3
	wr	%g0,	0x11,	%asi
	stwa	%g4,	[%l7 + 0x30] %asi
	mulscc	%l2,	0x0DE9,	%i1
	bg,a	%xcc,	loop_520
	sdivcc	%l4,	0x1A08,	%i0
	xorcc	%l5,	%i7,	%g7
	fbug	%fcc0,	loop_521
loop_520:
	sdivcc	%l0,	0x063C,	%l1
	mova	%xcc,	%o5,	%o3
	or	%i5,	%i2,	%g1
loop_521:
	fcmpeq16	%f4,	%f22,	%o6
	movleu	%icc,	%o1,	%i4
	subc	%g3,	%o2,	%o7
	udivx	%o0,	0x1F4F,	%o4
	bcs	loop_522
	fpmerge	%f3,	%f26,	%f16
	fandnot2	%f0,	%f8,	%f14
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_522:
	nop
	set	0x78, %g1
	stxa	%g2,	[%l7 + %g1] 0x14
	fcmple16	%f6,	%f12,	%g5
	std	%i6,	[%l7 + 0x48]
	set	0x74, %o1
	ldswa	[%l7 + %o1] 0x81,	%l6
	fpsub16	%f10,	%f20,	%f6
	sra	%g6,	0x08,	%i3
	set	0x38, %g3
	ldstuba	[%l7 + %g3] 0x10,	%l3
	movg	%icc,	%l2,	%g4
	stx	%i1,	[%l7 + 0x08]
	tgu	%icc,	0x3
	edge16	%i0,	%l5,	%i7
	tcs	%icc,	0x4
	fmovdpos	%icc,	%f26,	%f16
	xnor	%g7,	%l4,	%l1
	movrlz	%o5,	%l0,	%i5
	movgu	%icc,	%o3,	%g1
	brlz	%i2,	loop_523
	orn	%o6,	%i4,	%g3
	fmovrsgz	%o2,	%f26,	%f20
	fsrc1	%f20,	%f8
loop_523:
	fpmerge	%f8,	%f21,	%f12
	fsrc1s	%f30,	%f5
	andn	%o1,	%o7,	%o0
	tvc	%xcc,	0x1
	fblg	%fcc1,	loop_524
	sdivx	%o4,	0x0BA5,	%g5
	tsubcc	%g2,	%i6,	%l6
	fmovsle	%icc,	%f3,	%f12
loop_524:
	sethi	0x0454,	%i3
	fmovda	%xcc,	%f30,	%f5
	fmovrdlez	%l3,	%f24,	%f18
	nop
	setx loop_525, %l0, %l1
	jmpl %l1, %g6
	fmovdcc	%icc,	%f0,	%f4
	edge8	%l2,	%i1,	%i0
	smul	%l5,	0x15F3,	%i7
loop_525:
	movrgz	%g7,	%g4,	%l1
	fsrc2s	%f5,	%f26
	edge32l	%l4,	%l0,	%i5
	edge8n	%o5,	%o3,	%i2
	movneg	%icc,	%g1,	%o6
	prefetch	[%l7 + 0x30],	 0x1
	srlx	%g3,	%o2,	%o1
	ldd	[%l7 + 0x28],	%f12
	sdiv	%o7,	0x142C,	%i4
	subcc	%o0,	0x0C44,	%g5
	movrne	%o4,	%i6,	%l6
	fornot2	%f18,	%f28,	%f28
	mova	%xcc,	%g2,	%l3
	wr	%g0,	0x2f,	%asi
	stwa	%i3,	[%l7 + 0x64] %asi
	membar	#Sync
	edge8	%l2,	%g6,	%i1
	pdist	%f0,	%f30,	%f14
	movvs	%icc,	%i0,	%l5
	sdivcc	%i7,	0x14B2,	%g7
	fbue,a	%fcc0,	loop_526
	fmovdvc	%icc,	%f18,	%f13
	orn	%l1,	%g4,	%l0
	xnor	%i5,	0x0483,	%l4
loop_526:
	smul	%o5,	0x04A7,	%i2
	srl	%g1,	0x13,	%o6
	xnorcc	%g3,	%o3,	%o1
	edge8	%o2,	%i4,	%o0
	bcs,a,pt	%icc,	loop_527
	swap	[%l7 + 0x6C],	%g5
	addc	%o4,	0x1A93,	%o7
	sub	%i6,	%l6,	%g2
loop_527:
	edge16l	%i3,	%l2,	%l3
	move	%xcc,	%i1,	%i0
	tneg	%xcc,	0x2
	tgu	%xcc,	0x6
	fble	%fcc2,	loop_528
	nop
	setx	loop_529,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fbu	%fcc1,	loop_530
	tn	%xcc,	0x5
loop_528:
	movgu	%xcc,	%g6,	%l5
loop_529:
	edge32n	%i7,	%g7,	%l1
loop_530:
	tl	%xcc,	0x6
	wr	%g0,	0x0c,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	wr	%g0,	0x88,	%asi
	lduba	[%l7 + 0x17] %asi,	%l0
	xor	%i5,	%g4,	%l4
	movvc	%xcc,	%o5,	%g1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tle	%xcc,	0x2
	fbule	%fcc0,	loop_531
	sethi	0x12B6,	%i2
	movge	%xcc,	%o6,	%o3
	tn	%icc,	0x7
loop_531:
	xnorcc	%g3,	%o1,	%i4
	srax	%o0,	0x1C,	%g5
	fmovda	%icc,	%f4,	%f28
	set	0x2C, %l3
	lduha	[%l7 + %l3] 0x11,	%o4
	edge32	%o2,	%o7,	%i6
	fmovsl	%icc,	%f5,	%f21
	wr	%g0,	0x27,	%asi
	stba	%g2,	[%l7 + 0x48] %asi
	membar	#Sync
	ldd	[%l7 + 0x48],	%i2
	sth	%l2,	[%l7 + 0x44]
	ldstub	[%l7 + 0x5D],	%l6
	tvc	%xcc,	0x4
	fmovsne	%icc,	%f0,	%f8
	array32	%i1,	%i0,	%l3
	or	%g6,	%l5,	%i7
	wr	%g0,	0x18,	%asi
	lduba	[%l7 + 0x7B] %asi,	%l1
	wr	%g0,	0x81,	%asi
	swapa	[%l7 + 0x74] %asi,	%l0
	fblg,a	%fcc1,	loop_532
	tgu	%xcc,	0x6
	edge8n	%g7,	%g4,	%i5
	tneg	%xcc,	0x6
loop_532:
	bleu,a,pt	%icc,	loop_533
	tvc	%icc,	0x3
	stx	%l4,	[%l7 + 0x18]
	add	%g1,	%o5,	%i2
loop_533:
	movge	%icc,	%o3,	%o6
	tsubcc	%o1,	%g3,	%o0
	movvc	%xcc,	%g5,	%o4
	bpos,a,pt	%icc,	loop_534
	smul	%o2,	%i4,	%i6
	fmovdvc	%icc,	%f9,	%f10
	add	%l7,	0x50,	%l6
	wr	%g0,	0x0c,	%asi
	casxa	[%l6] %asi,	%o7,	%i3
loop_534:
	smulcc	%g2,	0x177E,	%l6
	ldd	[%l7 + 0x58],	%f2
	popc	%i1,	%i0
	fors	%f21,	%f26,	%f21
	flush	%l7 + 0x7C
	wr	%g0,	0x89,	%asi
	lduwa	[%l7 + 0x1C] %asi,	%l2
	tvc	%xcc,	0x3
	udivx	%g6,	0x1383,	%l5
	movge	%xcc,	%l3,	%i7
	edge8l	%l0,	%g7,	%g4
	srax	%i5,	%l4,	%g1
	wr	%g0,	0xe2,	%asi
	ldda	[%l7 + 0x50] %asi,	%l0
	set	0x49, %l4
	lduba	[%l7 + %l4] 0x14,	%o5
	edge16ln	%o3,	%i2,	%o1
	wr	%g0,	0x04,	%asi
	lduba	[%l7 + 0x68] %asi,	%o6
	subc	%g3,	%o0,	%o4
	addccc	%o2,	%i4,	%i6
	edge16n	%o7,	%i3,	%g5
	tne	%icc,	0x1
	tpos	%icc,	0x6
	andn	%l6,	0x0A80,	%g2
	fbug,a	%fcc1,	loop_535
	movrlz	%i1,	%i0,	%l2
	movgu	%icc,	%l5,	%l3
	movrlz	%g6,	0x373,	%i7
loop_535:
	edge32l	%g7,	%g4,	%l0
	ta	%icc,	0x2
	set	0x44, %i5
	ldsha	[%l7 + %i5] 0x14,	%l4
	movcs	%icc,	%i5,	%l1
	bcc,a	%icc,	loop_536
	fmovd	%f26,	%f28
	fbl,a	%fcc2,	loop_537
	movne	%xcc,	%g1,	%o3
loop_536:
	movn	%icc,	%i2,	%o5
	fmovsle	%icc,	%f10,	%f22
loop_537:
	fba,a	%fcc0,	loop_538
	fba,a	%fcc3,	loop_539
	sdivx	%o6,	0x0765,	%o1
	andn	%o0,	0x126F,	%o4
loop_538:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_539:
	ta	%icc,	0x0
	sir	0x1FA3
	ldd	[%l7 + 0x50],	%f14
	fcmped	%fcc0,	%f0,	%f14
	add	%o2,	0x0EE3,	%i4
	fpadd32s	%f22,	%f19,	%f12
	movcc	%xcc,	%i6,	%g3
	movl	%xcc,	%o7,	%i3
	andncc	%l6,	%g2,	%i1
	fmovdleu	%icc,	%f31,	%f8
	movge	%xcc,	%g5,	%l2
	fnot2	%f22,	%f16
	wr	%g0,	0x18,	%asi
	ldxa	[%l7 + 0x78] %asi,	%i0
	prefetch	[%l7 + 0x54],	 0x0
	fbg	%fcc0,	loop_540
	edge16ln	%l3,	%l5,	%g6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xor	%i7,	0x007E,	%g7
loop_540:
	alignaddrl	%g4,	%l0,	%l4
	srlx	%i5,	0x14,	%l1
	array16	%g1,	%i2,	%o3
	mova	%icc,	%o6,	%o5
	movl	%icc,	%o0,	%o4
	fpmerge	%f29,	%f4,	%f6
	srax	%o1,	%i4,	%i6
	ldsb	[%l7 + 0x72],	%g3
	alignaddrl	%o7,	%i3,	%o2
	te	%icc,	0x0
	wr	%g0,	0x88,	%asi
	lduha	[%l7 + 0x46] %asi,	%l6
	udiv	%g2,	0x1039,	%i1
	fbl	%fcc2,	loop_541
	fornot2s	%f20,	%f8,	%f1
	addccc	%g5,	%i0,	%l3
	array8	%l5,	%g6,	%l2
loop_541:
	te	%icc,	0x1
	fnot2s	%f24,	%f22
	udiv	%g7,	0x0515,	%g4
	fmovdgu	%xcc,	%f17,	%f24
	subc	%i7,	%l4,	%l0
	tg	%xcc,	0x3
	fmovsn	%xcc,	%f4,	%f25
	tle	%icc,	0x5
	fblg,a	%fcc2,	loop_542
	tcs	%xcc,	0x3
	smulcc	%i5,	%g1,	%l1
	edge16	%i2,	%o6,	%o5
loop_542:
	fcmpne16	%f28,	%f8,	%o3
	wr	%g0,	0x89,	%asi
	ldswa	[%l7 + 0x14] %asi,	%o0
	andn	%o4,	0x1C43,	%i4
	tsubcctv	%i6,	0x1A8D,	%o1
	move	%icc,	%g3,	%i3
	ldd	[%l7 + 0x18],	%f12
	fxor	%f8,	%f26,	%f24
	smul	%o2,	0x0EBB,	%o7
	tvs	%xcc,	0x5
	fmul8x16	%f18,	%f12,	%f24
	sdivcc	%g2,	0x0C8B,	%i1
	umulcc	%l6,	%g5,	%i0
	tleu	%icc,	0x1
	fxors	%f8,	%f17,	%f5
	bvs,a	loop_543
	tpos	%xcc,	0x2
	mulx	%l5,	%g6,	%l2
	movvc	%icc,	%g7,	%g4
loop_543:
	taddcctv	%i7,	%l4,	%l3
	nop
	set	0x48, %i0
	std	%l0,	[%l7 + %i0]
	brz	%i5,	loop_544
	sllx	%g1,	0x14,	%i2
	movn	%xcc,	%o6,	%o5
	tne	%icc,	0x1
loop_544:
	ldub	[%l7 + 0x0D],	%o3
	fmovsg	%icc,	%f29,	%f30
	orncc	%l1,	%o0,	%o4
	movrne	%i4,	%o1,	%i6
	udiv	%g3,	0x1F9E,	%i3
	xnorcc	%o2,	0x0176,	%g2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdleu	%icc,	%f27,	%f28
	fmovdn	%icc,	%f12,	%f19
	popc	0x0FF9,	%o7
	wr	%g0,	0x23,	%asi
	stxa	%i1,	[%l7 + 0x60] %asi
	membar	#Sync
	fmovspos	%xcc,	%f20,	%f14
	sethi	0x07AF,	%g5
	movpos	%xcc,	%l6,	%i0
	fbul	%fcc0,	loop_545
	bg,a	loop_546
	sethi	0x1707,	%g6
	fand	%f24,	%f22,	%f22
loop_545:
	brlez,a	%l2,	loop_547
loop_546:
	tpos	%xcc,	0x5
	mova	%xcc,	%l5,	%g7
	membar	0x2D
loop_547:
	andncc	%g4,	%l4,	%i7
	sdivcc	%l3,	0x16FC,	%i5
	fsrc1s	%f23,	%f20
	addc	%g1,	0x0AF4,	%l0
	tvc	%icc,	0x5
	sdiv	%i2,	0x0F63,	%o5
	sub	%o6,	%o3,	%o0
	tn	%xcc,	0x4
	fcmped	%fcc3,	%f10,	%f20
	bn,a,pn	%icc,	loop_548
	be	%icc,	loop_549
	movneg	%icc,	%o4,	%l1
	wr	%g0,	0xeb,	%asi
	stwa	%o1,	[%l7 + 0x48] %asi
	membar	#Sync
loop_548:
	movneg	%xcc,	%i6,	%g3
loop_549:
	stbar
	faligndata	%f26,	%f4,	%f26
	prefetch	[%l7 + 0x14],	 0x1
	bgu	loop_550
	andn	%i4,	0x05AA,	%i3
	edge16ln	%o2,	%g2,	%i1
	bg,a	%xcc,	loop_551
loop_550:
	bg,a,pt	%xcc,	loop_552
	sllx	%g5,	0x11,	%l6
	srlx	%o7,	0x1D,	%g6
loop_551:
	xor	%i0,	0x14D1,	%l2
loop_552:
	andcc	%g7,	0x0F27,	%g4
	ldstub	[%l7 + 0x28],	%l5
	sub	%l4,	%l3,	%i5
	bpos,a,pt	%icc,	loop_553
	fpmerge	%f26,	%f23,	%f22
	stb	%i7,	[%l7 + 0x0D]
	fmovrsgez	%l0,	%f19,	%f27
loop_553:
	nop
	set	0x76, %i4
	stba	%g1,	[%l7 + %i4] 0x81
	movcs	%icc,	%i2,	%o6
	andcc	%o3,	%o0,	%o5
	fandnot1	%f24,	%f16,	%f4
	alignaddrl	%o4,	%o1,	%i6
	fandnot2s	%f14,	%f16,	%f16
	movge	%icc,	%l1,	%i4
	and	%i3,	%o2,	%g3
	udiv	%i1,	0x152B,	%g5
	and	%g2,	%o7,	%l6
	fmul8x16al	%f8,	%f3,	%f8
	brgez	%i0,	loop_554
	orncc	%g6,	0x0FFA,	%g7
	movleu	%xcc,	%l2,	%l5
	mulscc	%l4,	%l3,	%i5
loop_554:
	movre	%g4,	%i7,	%g1
	set	0x49, %g6
	lduba	[%l7 + %g6] 0x81,	%l0
	udivcc	%o6,	0x1E95,	%o3
	fbge,a	%fcc2,	loop_555
	membar	0x2E
	fsrc2s	%f5,	%f20
	tvs	%icc,	0x2
loop_555:
	fpsub16s	%f11,	%f0,	%f25
	sth	%o0,	[%l7 + 0x6A]
	ldub	[%l7 + 0x71],	%i2
	fxnor	%f2,	%f20,	%f26
	mulx	%o5,	%o4,	%i6
	ld	[%l7 + 0x58],	%f30
	fcmpne32	%f18,	%f24,	%l1
	subcc	%o1,	0x15E6,	%i3
	smul	%i4,	%o2,	%g3
	fmovsneg	%xcc,	%f1,	%f25
	mulx	%g5,	%g2,	%i1
	ldsw	[%l7 + 0x50],	%o7
	fbne,a	%fcc3,	loop_556
	sllx	%l6,	0x06,	%g6
	mulx	%i0,	0x15A3,	%g7
	fmovdvs	%xcc,	%f11,	%f7
loop_556:
	fmovdle	%icc,	%f16,	%f23
	addcc	%l2,	0x0723,	%l5
	wr	%g0,	0x88,	%asi
	stba	%l3,	[%l7 + 0x55] %asi
	fmul8x16au	%f24,	%f23,	%f4
	alignaddr	%i5,	%g4,	%l4
	bshuffle	%f30,	%f28,	%f28
	fbg,a	%fcc2,	loop_557
	movleu	%icc,	%g1,	%i7
	xor	%l0,	0x0E4B,	%o3
	fmovrsgez	%o0,	%f2,	%f14
loop_557:
	movge	%xcc,	%o6,	%o5
	nop
	setx	loop_558,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	te	%xcc,	0x5
	bgu	%xcc,	loop_559
	umulcc	%o4,	%i2,	%l1
loop_558:
	edge16n	%i6,	%o1,	%i4
	subc	%o2,	%i3,	%g5
loop_559:
	fpack16	%f0,	%f2
	edge8ln	%g3,	%i1,	%g2
	edge8ln	%l6,	%g6,	%i0
	bne	loop_560
	fpackfix	%f4,	%f1
	movne	%icc,	%o7,	%g7
	faligndata	%f28,	%f6,	%f12
loop_560:
	tvc	%icc,	0x0
	be,a	loop_561
	sdivcc	%l5,	0x188F,	%l2
	array16	%l3,	%i5,	%l4
	fpadd16s	%f9,	%f4,	%f16
loop_561:
	tgu	%xcc,	0x4
	umul	%g4,	%g1,	%i7
	or	%l0,	%o3,	%o0
	wr	%g0,	0x22,	%asi
	stda	%o6,	[%l7 + 0x78] %asi
	membar	#Sync
	add	%o5,	%o4,	%l1
	edge8ln	%i6,	%o1,	%i2
	tleu	%icc,	0x5
	brlz	%o2,	loop_562
	subccc	%i4,	0x1EF5,	%i3
	movcc	%xcc,	%g5,	%i1
	orcc	%g3,	0x1A29,	%g2
loop_562:
	movvc	%icc,	%g6,	%l6
	udiv	%i0,	0x02A4,	%g7
	sdiv	%o7,	0x06FA,	%l2
	edge16n	%l5,	%i5,	%l4
	add	%l3,	%g1,	%g4
	sethi	0x0DE3,	%l0
	set	0x15, %o4
	ldstuba	[%l7 + %o4] 0x11,	%o3
	ble	%icc,	loop_563
	movrlz	%i7,	%o0,	%o5
	edge8	%o4,	%o6,	%i6
	taddcctv	%l1,	%o1,	%o2
loop_563:
	edge32ln	%i2,	%i4,	%i3
	movle	%xcc,	%g5,	%i1
	xor	%g2,	%g3,	%l6
	fand	%f4,	%f6,	%f14
	movleu	%icc,	%g6,	%g7
	movl	%xcc,	%o7,	%i0
	movcs	%icc,	%l5,	%l2
	tvc	%icc,	0x3
	fornot2s	%f6,	%f17,	%f21
	and	%i5,	0x0A08,	%l4
	movne	%icc,	%g1,	%l3
	set	0x38, %o0
	lda	[%l7 + %o0] 0x0c,	%f2
	fbuge,a	%fcc1,	loop_564
	popc	0x0270,	%l0
	fbue	%fcc3,	loop_565
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
loop_564:
	membar	0x06
	fandnot2s	%f18,	%f4,	%f20
loop_565:
	fandnot2s	%f2,	%f16,	%f21
loop_566:
	nop
	wr	%g0,	0x0c,	%asi
	lduba	[%l7 + 0x6C] %asi,	%g4
	movg	%icc,	%i7,	%o3
	tl	%icc,	0x0
	fba	%fcc2,	loop_567
	fbule,a	%fcc0,	loop_568
	bvs,a	%icc,	loop_569
	array8	%o0,	%o5,	%o6
loop_567:
	sir	0x12B9
loop_568:
	srlx	%o4,	0x15,	%i6
loop_569:
	movleu	%xcc,	%l1,	%o2
	fcmps	%fcc0,	%f15,	%f9
	smulcc	%o1,	%i4,	%i2
	edge16	%i3,	%g5,	%g2
	fnor	%f2,	%f20,	%f10
	ldstub	[%l7 + 0x5A],	%g3
	tn	%xcc,	0x3
	fmovdvs	%xcc,	%f28,	%f28
	brgz,a	%i1,	loop_570
	andcc	%g6,	%g7,	%o7
	andncc	%i0,	%l6,	%l5
	xorcc	%l2,	%i5,	%g1
loop_570:
	brlez	%l3,	loop_571
	andn	%l4,	%l0,	%i7
	set	0x4E, %o3
	lduha	[%l7 + %o3] 0x15,	%g4
loop_571:
	sdivcc	%o0,	0x0A12,	%o3
	umul	%o5,	0x076B,	%o4
	umulcc	%i6,	%l1,	%o2
	sub	%o1,	0x1A5C,	%i4
	tg	%xcc,	0x6
	tne	%xcc,	0x0
	orcc	%i2,	%o6,	%g5
	movleu	%icc,	%g2,	%g3
	movrlz	%i3,	0x2FC,	%i1
	fmovrdlez	%g6,	%f12,	%f0
	fble,a	%fcc2,	loop_572
	movvc	%icc,	%o7,	%i0
	set	0x60, %i2
	prefetcha	[%l7 + %i2] 0x15,	 0x2
loop_572:
	fzeros	%f28
	taddcc	%g7,	0x16FD,	%l5
	movpos	%icc,	%l2,	%g1
	sub	%l3,	0x1CD1,	%i5
	bne,a	%icc,	loop_573
	popc	0x12A8,	%l0
	wr	%g0,	0x10,	%asi
	ldswa	[%l7 + 0x54] %asi,	%i7
loop_573:
	stw	%g4,	[%l7 + 0x4C]
	fsrc2	%f22,	%f18
	fbe,a	%fcc2,	loop_574
	movrlez	%o0,	%l4,	%o5
	set	0x40, %g2
	stda	%f16,	[%l7 + %g2] 0x0c
loop_574:
	tl	%xcc,	0x7
	fpadd16s	%f30,	%f3,	%f7
	tle	%icc,	0x1
	subc	%o4,	0x04C6,	%i6
	edge16ln	%l1,	%o2,	%o3
	fmovsl	%xcc,	%f12,	%f28
	ta	%icc,	0x5
	movn	%icc,	%o1,	%i4
	wr	%g0,	0x0c,	%asi
	ldsba	[%l7 + 0x40] %asi,	%o6
	tcc	%icc,	0x2
	udivx	%g5,	0x019F,	%g2
	fmovrsgez	%i2,	%f5,	%f12
	fpmerge	%f3,	%f25,	%f0
	edge32	%g3,	%i1,	%g6
	bvs,a	loop_575
	stw	%o7,	[%l7 + 0x48]
	fba	%fcc0,	loop_576
	tcs	%xcc,	0x4
loop_575:
	fbo,a	%fcc1,	loop_577
	sdivcc	%i0,	0x0D72,	%l6
loop_576:
	nop
	set	0x40, %l1
	stda	%f16,	[%l7 + %l1] 0x1f
	membar	#Sync
loop_577:
	ldsb	[%l7 + 0x71],	%g7
	fnor	%f2,	%f18,	%f2
	movpos	%xcc,	%i3,	%l5
	movrlz	%g1,	%l2,	%l3
	movrgz	%l0,	%i5,	%i7
	fmovs	%f14,	%f6
	bn,a,pn	%icc,	loop_578
	std	%f6,	[%l7 + 0x10]
	tsubcctv	%o0,	0x0949,	%l4
	alignaddrl	%g4,	%o4,	%o5
loop_578:
	movn	%xcc,	%l1,	%i6
	std	%o2,	[%l7 + 0x20]
	fcmpes	%fcc3,	%f10,	%f19
	sdivcc	%o1,	0x12D7,	%o3
	taddcc	%o6,	0x1F75,	%g5
	alignaddr	%g2,	%i4,	%i2
	sdiv	%i1,	0x00D7,	%g3
	tneg	%xcc,	0x5
	umul	%g6,	0x0EE9,	%i0
	tpos	%icc,	0x3
	xor	%l6,	%o7,	%g7
	fandnot2s	%f30,	%f17,	%f2
	ldsb	[%l7 + 0x62],	%i3
	tge	%xcc,	0x6
	movre	%g1,	%l2,	%l5
	movg	%xcc,	%l0,	%l3
	umulcc	%i5,	%i7,	%o0
	membar	0x78
	edge32	%g4,	%l4,	%o5
	bneg,pn	%icc,	loop_579
	membar	0x47
	fbn,a	%fcc2,	loop_580
	tneg	%xcc,	0x6
loop_579:
	stx	%l1,	[%l7 + 0x10]
	ldd	[%l7 + 0x18],	%o4
loop_580:
	tcs	%xcc,	0x5
	movpos	%xcc,	%o2,	%i6
	xnorcc	%o3,	%o1,	%o6
	movrne	%g5,	%g2,	%i4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmpeq32	%f14,	%f14,	%i1
	andn	%i2,	0x154B,	%g6
	srax	%i0,	0x17,	%l6
	movpos	%xcc,	%g3,	%o7
	movleu	%xcc,	%g7,	%i3
	tge	%icc,	0x5
	siam	0x3
	tcs	%xcc,	0x5
	wr	%g0,	0x89,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	bcs,a	loop_581
	xorcc	%l2,	%g1,	%l5
	set	0x10, %l5
	prefetcha	[%l7 + %l5] 0x14,	 0x3
loop_581:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bg,a,pt	%xcc,	loop_582
	fzeros	%f0
	edge8n	%i5,	%l3,	%i7
	fnegd	%f16,	%f18
loop_582:
	fsrc2s	%f31,	%f13
	bgu,a	loop_583
	mulscc	%o0,	0x16BF,	%l4
	bneg	loop_584
	fba	%fcc0,	loop_585
loop_583:
	fnegs	%f0,	%f20
	bpos,a	loop_586
loop_584:
	addc	%g4,	%l1,	%o5
loop_585:
	movn	%xcc,	%o4,	%i6
	fble,a	%fcc2,	loop_587
loop_586:
	fmul8x16al	%f8,	%f25,	%f8
	andn	%o2,	%o1,	%o3
	fbule,a	%fcc2,	loop_588
loop_587:
	sub	%g5,	%o6,	%g2
	flush	%l7 + 0x54
	movrne	%i4,	0x1EE,	%i1
loop_588:
	prefetch	[%l7 + 0x28],	 0x0
	movleu	%icc,	%g6,	%i2
	tleu	%xcc,	0x1
	bg,a,pt	%xcc,	loop_589
	brlz,a	%i0,	loop_590
	move	%xcc,	%l6,	%o7
	fbl	%fcc3,	loop_591
loop_589:
	movrlz	%g3,	0x2F3,	%i3
loop_590:
	fpack16	%f28,	%f31
	taddcc	%l2,	%g1,	%l5
loop_591:
	edge16l	%l0,	%i5,	%l3
	movvc	%xcc,	%i7,	%o0
	fornot2	%f24,	%f2,	%f22
	srl	%l4,	%g7,	%g4
	fbne,a	%fcc0,	loop_592
	pdist	%f8,	%f28,	%f14
	fbue	%fcc3,	loop_593
	srl	%o5,	%l1,	%i6
loop_592:
	udivx	%o2,	0x106A,	%o1
	ldsw	[%l7 + 0x10],	%o4
loop_593:
	orncc	%g5,	0x0CBF,	%o3
	mulx	%g2,	%o6,	%i4
	fmovsa	%xcc,	%f26,	%f4
	tle	%icc,	0x2
	ble	loop_594
	bvs,pt	%xcc,	loop_595
	fbug	%fcc2,	loop_596
	move	%icc,	%g6,	%i2
loop_594:
	nop
	set	0x0C, %g5
	stwa	%i1,	[%l7 + %g5] 0x18
loop_595:
	nop
	setx loop_597, %l0, %l1
	jmpl %l1, %i0
loop_596:
	fsrc1s	%f1,	%f13
	set	0x10, %i7
	prefetcha	[%l7 + %i7] 0x11,	 0x3
loop_597:
	ta	%icc,	0x7
	edge8	%o7,	%g3,	%l2
	fsrc2	%f14,	%f30
	sub	%i3,	0x0678,	%l5
	movvc	%xcc,	%l0,	%g1
	array32	%l3,	%i5,	%i7
	xnor	%l4,	0x0F6A,	%g7
	fbg,a	%fcc1,	loop_598
	addcc	%o0,	0x1953,	%g4
	umul	%l1,	0x1C5F,	%i6
	movre	%o5,	%o2,	%o1
loop_598:
	movle	%xcc,	%g5,	%o3
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
	fxnors	%f21,	%f17,	%f1
	edge32	%g2,	%o6,	%i4
	movvc	%icc,	%g6,	%o4
loop_599:
	edge16	%i2,	%i0,	%l6
	bcc,a,pn	%icc,	loop_600
	bvc,a,pt	%xcc,	loop_601
	udivx	%i1,	0x00BD,	%g3
	fmovsneg	%icc,	%f14,	%f20
loop_600:
	fmovdleu	%xcc,	%f4,	%f25
loop_601:
	edge32n	%l2,	%o7,	%l5
	fxnors	%f11,	%f21,	%f1
	movrgz	%l0,	0x355,	%g1
	tvs	%icc,	0x4
	fmovdneg	%xcc,	%f2,	%f31
	xorcc	%i3,	0x1B3B,	%l3
	srax	%i5,	%l4,	%i7
	brlez	%o0,	loop_602
	array32	%g7,	%g4,	%l1
	movre	%i6,	0x1B3,	%o2
	membar	0x0A
loop_602:
	edge8l	%o1,	%o5,	%o3
	addc	%g2,	0x0775,	%g5
	subccc	%o6,	%i4,	%o4
	brlez,a	%g6,	loop_603
	edge16	%i2,	%i0,	%i1
	movpos	%xcc,	%g3,	%l2
	wr	%g0,	0x10,	%asi
	ldxa	[%l7 + 0x28] %asi,	%l6
loop_603:
	ldsw	[%l7 + 0x68],	%o7
	udivx	%l5,	0x02E5,	%g1
	movrne	%l0,	%l3,	%i5
	tvs	%xcc,	0x0
	subc	%i3,	%i7,	%o0
	edge8	%g7,	%l4,	%g4
	fmovdl	%icc,	%f31,	%f31
	lduw	[%l7 + 0x14],	%l1
	std	%i6,	[%l7 + 0x18]
	sll	%o2,	%o5,	%o1
	wr	%g0,	0xea,	%asi
	stha	%o3,	[%l7 + 0x32] %asi
	membar	#Sync
	fandnot1	%f16,	%f8,	%f6
	subccc	%g2,	%o6,	%g5
	set	0x20, %l0
	swapa	[%l7 + %l0] 0x0c,	%i4
	fbl	%fcc1,	loop_604
	ldsb	[%l7 + 0x25],	%o4
	nop
	set	0x10, %i1
	std	%f24,	[%l7 + %i1]
	subcc	%i2,	%g6,	%i0
loop_604:
	lduh	[%l7 + 0x0C],	%i1
	tpos	%xcc,	0x4
	umulcc	%l2,	%l6,	%o7
	tn	%icc,	0x7
	fcmpes	%fcc0,	%f19,	%f29
	mova	%xcc,	%l5,	%g1
	brlz	%l0,	loop_605
	fornot1	%f8,	%f10,	%f10
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addc	%l3,	0x0388,	%i5
loop_605:
	fnot2s	%f3,	%f0
	tsubcctv	%i3,	0x1FDA,	%i7
	tgu	%xcc,	0x0
	wr	%g0,	0x19,	%asi
	lduba	[%l7 + 0x25] %asi,	%g3
	sll	%o0,	%l4,	%g7
	fmovdleu	%xcc,	%f12,	%f6
	sir	0x01AA
	movvs	%icc,	%l1,	%i6
	wr	%g0,	0xf8,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
	tvc	%icc,	0x0
	ldsw	[%l7 + 0x50],	%o2
	mulscc	%g4,	0x065F,	%o1
	fmovsn	%xcc,	%f27,	%f19
	tvs	%xcc,	0x4
	smulcc	%o3,	%g2,	%o5
	bg,a,pt	%icc,	loop_606
	movcs	%icc,	%o6,	%i4
	fmovdl	%icc,	%f12,	%f27
	tneg	%icc,	0x6
loop_606:
	movg	%xcc,	%o4,	%i2
	fone	%f26
	edge8n	%g5,	%i0,	%i1
	nop
	setx	loop_607,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	tsubcctv	%g6,	%l2,	%o7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddr	%l6,	%l5,	%l0
loop_607:
	st	%f8,	[%l7 + 0x28]
	movgu	%icc,	%g1,	%i5
	faligndata	%f10,	%f10,	%f30
	movre	%l3,	%i7,	%i3
	umulcc	%o0,	%g3,	%l4
	udivx	%l1,	0x044C,	%i6
	fmovrdgz	%g7,	%f8,	%f2
	tge	%icc,	0x7
	wr	%g0,	0x19,	%asi
	ldswa	[%l7 + 0x08] %asi,	%g4
	lduw	[%l7 + 0x50],	%o2
	fornot1	%f28,	%f10,	%f30
	fcmpd	%fcc2,	%f20,	%f6
	fnot2	%f18,	%f8
	popc	%o3,	%g2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sub	%o5,	%o6,	%i4
	movgu	%icc,	%o4,	%o1
	movneg	%xcc,	%i2,	%g5
	stx	%i1,	[%l7 + 0x78]
	fxor	%f6,	%f2,	%f20
	wr	%g0,	0x89,	%asi
	ldsba	[%l7 + 0x43] %asi,	%i0
	movrlez	%l2,	%o7,	%g6
	subcc	%l6,	0x03E4,	%l0
	tle	%xcc,	0x0
	tne	%xcc,	0x0
	movneg	%icc,	%g1,	%l5
	bg,a	loop_608
	movne	%xcc,	%i5,	%l3
	tvs	%xcc,	0x2
	fornot1	%f14,	%f22,	%f2
loop_608:
	alignaddr	%i7,	%i3,	%g3
	fpack32	%f6,	%f26,	%f16
	udivcc	%l4,	0x16D8,	%l1
	fmovsge	%xcc,	%f22,	%f29
	bvc,a,pn	%icc,	loop_609
	subcc	%o0,	%g7,	%g4
	edge32ln	%o2,	%i6,	%g2
	wr	%g0,	0x80,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
loop_609:
	movvs	%icc,	%o3,	%o5
	udivcc	%o6,	0x0F41,	%i4
	movneg	%icc,	%o4,	%i2
	fnot2	%f6,	%f22
	fbug,a	%fcc0,	loop_610
	fexpand	%f16,	%f20
	ldsh	[%l7 + 0x36],	%o1
	fbule	%fcc2,	loop_611
loop_610:
	edge16l	%g5,	%i1,	%i0
	move	%icc,	%l2,	%g6
	edge32n	%o7,	%l6,	%g1
loop_611:
	nop
	set	0x0A, %i3
	stha	%l5,	[%l7 + %i3] 0x23
	membar	#Sync
	movgu	%icc,	%l0,	%i5
	fmovscc	%xcc,	%f14,	%f4
	addcc	%i7,	0x00EF,	%l3
	fbn,a	%fcc1,	loop_612
	nop
	setx loop_613, %l0, %l1
	jmpl %l1, %i3
	fexpand	%f14,	%f18
	nop
	setx	loop_614,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_612:
	sub	%g3,	%l4,	%l1
loop_613:
	sll	%g7,	%g4,	%o2
	subcc	%i6,	0x0AAD,	%o0
loop_614:
	add	%g2,	%o5,	%o3
	edge32n	%o6,	%o4,	%i2
	fmovsvc	%icc,	%f12,	%f30
	tge	%xcc,	0x4
	movgu	%xcc,	%o1,	%g5
	subc	%i1,	%i0,	%i4
	bcs,a,pn	%xcc,	loop_615
	fmovdgu	%xcc,	%f27,	%f30
	movpos	%xcc,	%g6,	%l2
	taddcctv	%o7,	0x05B9,	%l6
loop_615:
	fmovdpos	%xcc,	%f13,	%f1
	edge32	%l5,	%g1,	%l0
	fbul	%fcc1,	loop_616
	sra	%i5,	%l3,	%i3
	fmovdvc	%icc,	%f28,	%f19
	be,a	loop_617
loop_616:
	orncc	%i7,	0x0FBA,	%g3
	xor	%l1,	%l4,	%g4
	nop
	setx	loop_618,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_617:
	tge	%xcc,	0x5
	umul	%o2,	%g7,	%i6
	nop
	set	0x47, %g4
	ldstub	[%l7 + %g4],	%g2
loop_618:
	fmovdgu	%xcc,	%f9,	%f5
	fmovdcs	%xcc,	%f2,	%f18
	movrlez	%o5,	%o3,	%o0
	tge	%icc,	0x2
	srl	%o6,	%i2,	%o4
	sdivx	%o1,	0x0F0B,	%g5
	fmovdcc	%icc,	%f4,	%f5
	fbg	%fcc0,	loop_619
	edge8n	%i1,	%i0,	%i4
	wr	%g0,	0x89,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
loop_619:
	udivx	%g6,	0x0C03,	%o7
	pdist	%f30,	%f8,	%f28
	fmovse	%icc,	%f31,	%f28
	orcc	%l6,	0x0588,	%l5
	fbn,a	%fcc3,	loop_620
	fcmple16	%f12,	%f14,	%l2
	fmovrsne	%l0,	%f27,	%f1
	fpsub16s	%f27,	%f27,	%f21
loop_620:
	brgz	%i5,	loop_621
	fpsub16s	%f31,	%f11,	%f27
	movrgz	%g1,	%l3,	%i3
	ba,pn	%xcc,	loop_622
loop_621:
	edge16l	%i7,	%g3,	%l1
	fmul8sux16	%f8,	%f20,	%f2
	ldd	[%l7 + 0x60],	%f22
loop_622:
	fpack16	%f4,	%f31
	mulscc	%g4,	0x0D7F,	%l4
	edge16	%g7,	%o2,	%g2
	tgu	%xcc,	0x0
	subcc	%o5,	%i6,	%o3
	movrgez	%o6,	%o0,	%i2
	movg	%icc,	%o1,	%g5
	smulcc	%i1,	0x1097,	%o4
	fbg	%fcc3,	loop_623
	addcc	%i0,	0x05F6,	%i4
	bge,pt	%icc,	loop_624
	fmovs	%f29,	%f3
loop_623:
	membar	0x7C
	edge16	%g6,	%o7,	%l6
loop_624:
	be,a	%xcc,	loop_625
	bvc,pn	%icc,	loop_626
	movle	%icc,	%l5,	%l2
	movvc	%icc,	%i5,	%l0
loop_625:
	xnorcc	%l3,	%i3,	%i7
loop_626:
	alignaddr	%g3,	%g1,	%l1
	membar	0x78
	fbg,a	%fcc1,	loop_627
	xorcc	%g4,	0x0B61,	%l4
	subccc	%o2,	0x198F,	%g7
	movcs	%xcc,	%g2,	%o5
loop_627:
	orcc	%o3,	%o6,	%o0
	xnor	%i6,	0x06F9,	%o1
	movrgz	%i2,	%i1,	%g5
	fexpand	%f6,	%f12
	wr	%g0,	0x80,	%asi
	ldstuba	[%l7 + 0x4D] %asi,	%i0
	tneg	%xcc,	0x2
	udivcc	%o4,	0x1F63,	%i4
	edge16l	%g6,	%o7,	%l5
	fmovrdne	%l6,	%f0,	%f22
	ldd	[%l7 + 0x60],	%i4
	subcc	%l0,	0x0930,	%l2
	tl	%xcc,	0x5
	fnot1	%f18,	%f26
	subc	%l3,	%i3,	%i7
	tcc	%icc,	0x6
	addcc	%g1,	0x11AF,	%g3
	fpsub16	%f14,	%f0,	%f4
	tgu	%icc,	0x5
	edge32	%l1,	%l4,	%g4
	tpos	%xcc,	0x1
	movcc	%xcc,	%o2,	%g7
	movrlez	%g2,	0x284,	%o5
	movrlez	%o3,	0x047,	%o6
	nop
	setx loop_628, %l0, %l1
	jmpl %l1, %i6
	edge16l	%o0,	%i2,	%i1
	fbu	%fcc3,	loop_629
	movl	%icc,	%g5,	%o1
loop_628:
	fbule,a	%fcc3,	loop_630
	fmovse	%icc,	%f26,	%f0
loop_629:
	fzero	%f0
	andn	%i0,	%o4,	%g6
loop_630:
	lduh	[%l7 + 0x2E],	%i4
	edge32ln	%o7,	%l6,	%i5
	tl	%xcc,	0x4
	movgu	%xcc,	%l5,	%l0
	taddcc	%l2,	%i3,	%l3
	tsubcc	%g1,	0x0F53,	%i7
	movneg	%xcc,	%g3,	%l4
	fbge,a	%fcc3,	loop_631
	tle	%icc,	0x6
	andncc	%l1,	%o2,	%g4
	fmovsge	%icc,	%f0,	%f27
loop_631:
	xorcc	%g2,	0x0A92,	%g7
	andcc	%o3,	0x024D,	%o6
	srlx	%o5,	0x0D,	%o0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movcs	%icc,	%i2,	%i6
	orncc	%g5,	%o1,	%i1
	andcc	%o4,	0x1F30,	%i0
	alignaddrl	%g6,	%i4,	%l6
	fnands	%f17,	%f11,	%f28
	fone	%f28
	fmovsleu	%icc,	%f16,	%f13
	move	%icc,	%i5,	%l5
	fmovrslz	%l0,	%f27,	%f1
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
	udiv	%l2,	0x0FF9,	%i3
	lduw	[%l7 + 0x50],	%o7
	addc	%g1,	0x0212,	%i7
loop_632:
	udivcc	%g3,	0x0738,	%l4
	std	%l0,	[%l7 + 0x78]
	andncc	%o2,	%l3,	%g2
	andn	%g7,	0x0178,	%g4
	tsubcctv	%o3,	%o5,	%o0
	wr	%g0,	0x27,	%asi
	stwa	%i2,	[%l7 + 0x44] %asi
	membar	#Sync
	fornot2	%f16,	%f26,	%f24
	smulcc	%i6,	0x0F53,	%g5
	fone	%f20
	tge	%xcc,	0x0
	wr	%g0,	0x10,	%asi
	ldsha	[%l7 + 0x64] %asi,	%o1
	tvc	%icc,	0x6
	bleu,a	%icc,	loop_633
	tleu	%xcc,	0x1
	fandnot1s	%f27,	%f15,	%f17
	tle	%xcc,	0x4
loop_633:
	tl	%xcc,	0x0
	movre	%i1,	%o4,	%i0
	srl	%o6,	0x03,	%g6
	movcs	%icc,	%i4,	%i5
	edge8n	%l6,	%l0,	%l5
	subc	%l2,	0x1453,	%i3
	orncc	%o7,	%i7,	%g1
	smulcc	%l4,	0x1077,	%l1
	taddcc	%g3,	%l3,	%g2
	stw	%o2,	[%l7 + 0x10]
	edge16	%g4,	%g7,	%o5
	fcmple32	%f12,	%f18,	%o3
	fpadd32	%f30,	%f14,	%f6
	tneg	%icc,	0x2
	fbue	%fcc3,	loop_634
	xnor	%i2,	0x0039,	%o0
	umul	%g5,	%o1,	%i1
	membar	0x73
loop_634:
	bpos	%icc,	loop_635
	fbl,a	%fcc0,	loop_636
	be,a	%xcc,	loop_637
	taddcc	%i6,	%i0,	%o4
loop_635:
	fsrc1	%f24,	%f8
loop_636:
	andn	%o6,	%g6,	%i5
loop_637:
	fand	%f24,	%f18,	%f14
	movneg	%icc,	%i4,	%l0
	move	%icc,	%l6,	%l5
	edge32l	%i3,	%l2,	%i7
	array16	%g1,	%l4,	%o7
	movpos	%icc,	%g3,	%l1
	set	0x20, %o6
	ldxa	[%l7 + %o6] 0x04,	%l3
	edge32ln	%o2,	%g2,	%g4
	mulscc	%g7,	0x11C6,	%o5
	edge8l	%o3,	%i2,	%o0
	wr	%g0,	0xeb,	%asi
	stda	%o0,	[%l7 + 0x68] %asi
	membar	#Sync
	tcs	%xcc,	0x1
	wr	%g0,	0x89,	%asi
	stda	%i0,	[%l7 + 0x28] %asi
	bl	loop_638
	be	loop_639
	tsubcc	%g5,	0x03B1,	%i0
	set	0x58, %i6
	ldswa	[%l7 + %i6] 0x89,	%o4
loop_638:
	fxor	%f26,	%f22,	%f16
loop_639:
	nop
	wr	%g0,	0x80,	%asi
	swapa	[%l7 + 0x18] %asi,	%i6
	bpos,a,pn	%icc,	loop_640
	edge32l	%o6,	%g6,	%i4
	movgu	%xcc,	%l0,	%l6
	ba,a,pt	%xcc,	loop_641
loop_640:
	fmuld8sux16	%f1,	%f26,	%f20
	set	0x5C, %o2
	ldswa	[%l7 + %o2] 0x15,	%i5
loop_641:
	lduh	[%l7 + 0x08],	%l5
	fcmpes	%fcc0,	%f13,	%f14
	andncc	%i3,	%i7,	%l2
	orcc	%l4,	%o7,	%g1
	udivx	%l1,	0x0C98,	%g3
	movn	%xcc,	%o2,	%g2
	fmovrsgez	%g4,	%f19,	%f26
	tcs	%icc,	0x3
	bvc,pt	%icc,	loop_642
	fxnor	%f24,	%f20,	%f14
	subc	%l3,	%o5,	%o3
	movleu	%xcc,	%i2,	%g7
loop_642:
	array16	%o1,	%o0,	%g5
	movvs	%icc,	%i0,	%i1
	fcmpeq16	%f26,	%f30,	%i6
	srlx	%o4,	%g6,	%i4
	tgu	%icc,	0x7
	tsubcctv	%o6,	0x06E7,	%l6
	sth	%l0,	[%l7 + 0x7E]
	sth	%l5,	[%l7 + 0x58]
	movcc	%xcc,	%i5,	%i3
	orcc	%i7,	0x0ACD,	%l4
	edge32	%o7,	%g1,	%l1
	lduh	[%l7 + 0x12],	%l2
	std	%g2,	[%l7 + 0x10]
	popc	%g2,	%g4
	bcs	%icc,	loop_643
	fnor	%f26,	%f24,	%f14
	tcs	%xcc,	0x3
	tne	%icc,	0x3
loop_643:
	subc	%o2,	0x1FC5,	%o5
	mulscc	%o3,	0x1051,	%l3
	edge8ln	%g7,	%o1,	%i2
	movrne	%o0,	0x157,	%g5
	nop
	setx	loop_644,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	edge8n	%i0,	%i6,	%i1
	umulcc	%g6,	%o4,	%i4
	fands	%f7,	%f10,	%f22
loop_644:
	fxnor	%f4,	%f12,	%f16
	fands	%f21,	%f5,	%f22
	fornot1s	%f25,	%f24,	%f3
	fmovde	%xcc,	%f15,	%f29
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tge	%icc,	0x5
	tcc	%xcc,	0x1
	edge8n	%l6,	%o6,	%l5
	for	%f0,	%f8,	%f18
	taddcc	%i5,	%i3,	%i7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xor	%l4,	0x1ECC,	%o7
	movcc	%icc,	%l0,	%l1
	fxnor	%f6,	%f28,	%f0
	fmovs	%f28,	%f2
	edge32n	%g1,	%l2,	%g3
	stx	%g4,	[%l7 + 0x70]
	fmovd	%f24,	%f30
	ldstub	[%l7 + 0x6C],	%g2
	ld	[%l7 + 0x18],	%f29
	movpos	%xcc,	%o2,	%o5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdivcc	%o3,	0x137A,	%l3
	ta	%icc,	0x3
	fbge,a	%fcc0,	loop_645
	stbar
	fpadd16s	%f31,	%f3,	%f7
	alignaddrl	%o1,	%g7,	%o0
loop_645:
	movrgez	%i2,	%i0,	%g5
	subccc	%i1,	0x01E5,	%i6
	subccc	%o4,	%i4,	%l6
	bpos,pn	%xcc,	loop_646
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdiv	%o6,	0x152D,	%l5
	sdivx	%i5,	0x1392,	%g6
loop_646:
	swap	[%l7 + 0x38],	%i3
	stx	%i7,	[%l7 + 0x58]
	tg	%icc,	0x6
	xorcc	%o7,	0x05E8,	%l4
	tgu	%xcc,	0x4
	prefetch	[%l7 + 0x60],	 0x3
	fornot1s	%f9,	%f28,	%f20
	srax	%l1,	0x07,	%g1
	fpadd16	%f8,	%f2,	%f10
	fmovsg	%icc,	%f23,	%f26
	stbar
	fornot1s	%f4,	%f11,	%f2
	fbl	%fcc2,	loop_647
	tcs	%icc,	0x6
	orcc	%l0,	%g3,	%g4
	flush	%l7 + 0x28
loop_647:
	udiv	%l2,	0x0561,	%g2
	fmovse	%icc,	%f26,	%f21
	tgu	%xcc,	0x1
	edge16n	%o2,	%o5,	%l3
	edge32ln	%o3,	%o1,	%o0
	ble,a,pn	%xcc,	loop_648
	fcmpne32	%f4,	%f2,	%g7
	wr	%g0,	0x19,	%asi
	prefetcha	[%l7 + 0x30] %asi,	 0x2
loop_648:
	fbug	%fcc1,	loop_649
	umul	%g5,	%i1,	%i6
	fmovdleu	%icc,	%f25,	%f12
	popc	0x0591,	%i2
loop_649:
	edge8l	%o4,	%l6,	%o6
	call	loop_650
	andcc	%i4,	0x1433,	%l5
	movneg	%xcc,	%i5,	%i3
	set	0x4C, %l2
	sta	%f20,	[%l7 + %l2] 0x11
loop_650:
	tsubcctv	%g6,	%o7,	%l4
	sir	0x04D7
	fbn,a	%fcc3,	loop_651
	subccc	%l1,	%g1,	%i7
	fmovdcs	%xcc,	%f25,	%f13
	ta	%xcc,	0x3
loop_651:
	tsubcctv	%g3,	0x1B73,	%l0
	fmul8sux16	%f4,	%f28,	%f26
	movne	%icc,	%l2,	%g2
	fzeros	%f9
	wr	%g0,	0x18,	%asi
	stda	%g4,	[%l7 + 0x28] %asi
	wr	%g0,	0x80,	%asi
	lduha	[%l7 + 0x6A] %asi,	%o2
	movrgz	%l3,	0x001,	%o3
	orn	%o5,	0x10CE,	%o1
	fnot2	%f30,	%f6
	wr	%g0,	0x80,	%asi
	lduwa	[%l7 + 0x4C] %asi,	%o0
	array8	%i0,	%g5,	%g7
	edge16	%i6,	%i2,	%o4
	tneg	%xcc,	0x2
	xnorcc	%i1,	%o6,	%l6
	sra	%i4,	%i5,	%l5
	fmovrse	%i3,	%f9,	%f29
	fornot2	%f30,	%f4,	%f22
	andn	%g6,	0x1A90,	%o7
	fmul8sux16	%f14,	%f26,	%f28
	set	0x40, %l6
	ldswa	[%l7 + %l6] 0x89,	%l4
	fors	%f26,	%f21,	%f19
	stx	%l1,	[%l7 + 0x60]
	fmovdneg	%xcc,	%f20,	%f0
	udivx	%i7,	0x0F76,	%g1
	sdivcc	%g3,	0x0985,	%l0
	movrlez	%l2,	%g4,	%o2
	bge,a	loop_652
	edge8ln	%l3,	%o3,	%g2
	fpack16	%f14,	%f22
	te	%xcc,	0x1
loop_652:
	and	%o1,	%o5,	%o0
	srl	%i0,	0x1A,	%g5
	fmovdg	%icc,	%f14,	%f13
	sethi	0x00ED,	%g7
	bl,a,pt	%icc,	loop_653
	movrlez	%i2,	0x2F3,	%i6
	fabss	%f3,	%f0
	mova	%xcc,	%o4,	%i1
loop_653:
	subc	%l6,	0x1735,	%o6
	bn	%xcc,	loop_654
	bcc	%xcc,	loop_655
	tneg	%icc,	0x3
	brlez	%i4,	loop_656
loop_654:
	std	%l4,	[%l7 + 0x58]
loop_655:
	fmovsneg	%xcc,	%f8,	%f10
	brz	%i5,	loop_657
loop_656:
	sub	%g6,	%o7,	%i3
	edge16	%l1,	%l4,	%g1
	movrne	%g3,	%l0,	%i7
loop_657:
	fbule,a	%fcc0,	loop_658
	stw	%l2,	[%l7 + 0x4C]
	ld	[%l7 + 0x7C],	%f7
	bcs,a,pt	%xcc,	loop_659
loop_658:
	sub	%g4,	0x1FE0,	%l3
	fmovdpos	%xcc,	%f19,	%f16
	sdiv	%o2,	0x175B,	%o3
loop_659:
	sra	%g2,	0x18,	%o1
	nop
	setx loop_660, %l0, %l1
	jmpl %l1, %o0
	bcs,a	%icc,	loop_661
	sth	%o5,	[%l7 + 0x24]
	fmul8x16au	%f1,	%f3,	%f24
loop_660:
	sllx	%g5,	0x01,	%i0
loop_661:
	taddcc	%g7,	0x1FB1,	%i6
	umul	%i2,	%o4,	%l6
	srax	%i1,	0x1C,	%i4
	addc	%l5,	0x0EE8,	%o6
	mulscc	%i5,	%g6,	%i3
	fbo	%fcc3,	loop_662
	fcmple32	%f4,	%f0,	%l1
	fxnors	%f8,	%f13,	%f24
	xor	%l4,	0x0517,	%o7
loop_662:
	fsrc2	%f24,	%f20
	mulscc	%g3,	0x0F34,	%g1
	fmovdg	%icc,	%f3,	%f3
	array8	%i7,	%l2,	%l0
	fexpand	%f28,	%f10
	set	0x30, %g7
	ldxa	[%g0 + %g7] 0x20,	%g4
	srlx	%o2,	0x01,	%o3
	bl,a,pn	%xcc,	loop_663
	edge32	%l3,	%o1,	%g2
	std	%f16,	[%l7 + 0x30]
	movn	%icc,	%o5,	%o0
loop_663:
	fand	%f12,	%f14,	%f22
	bl	loop_664
	stbar
	and	%g5,	0x0EA5,	%g7
	fbo	%fcc2,	loop_665
loop_664:
	fxnors	%f8,	%f6,	%f28
	mova	%xcc,	%i0,	%i6
	edge8ln	%o4,	%l6,	%i1
loop_665:
	fmovrdlz	%i2,	%f14,	%f24
	fpsub16s	%f18,	%f20,	%f29
	tcc	%icc,	0x7
	movcs	%xcc,	%l5,	%o6
	edge8l	%i4,	%i5,	%g6
	wr	%g0,	0x81,	%asi
	stha	%i3,	[%l7 + 0x48] %asi
	mulscc	%l1,	%o7,	%g3
	edge32n	%g1,	%i7,	%l2
	edge8l	%l4,	%g4,	%l0
	addccc	%o2,	0x0ECB,	%l3
	add	%l7,	0x48,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%o1,	%g2
	smul	%o5,	%o3,	%o0
	bg,a,pn	%icc,	loop_666
	taddcctv	%g7,	0x0A44,	%g5
	orn	%i6,	0x00B5,	%o4
	sub	%l6,	%i0,	%i2
loop_666:
	fmovrslz	%i1,	%f30,	%f21
	add	%l7,	0x30,	%l6
	wr	%g0,	0x18,	%asi
	ldxa	[%l6] %asi,	%l5
	casxa	[%l6] %asi,	%l5,	%i4
	and	%i5,	0x1ABF,	%o6
	wr	%g0,	0x27,	%asi
	stxa	%g6,	[%l7 + 0x30] %asi
	membar	#Sync
	tpos	%xcc,	0x6
	fcmple16	%f2,	%f26,	%l1
	fmul8sux16	%f14,	%f4,	%f28
	fcmpne16	%f20,	%f6,	%o7
	movneg	%xcc,	%g3,	%g1
	bneg	%icc,	loop_667
	fcmpgt16	%f20,	%f14,	%i3
	fbue	%fcc2,	loop_668
	orn	%l2,	%i7,	%l4
loop_667:
	sdivcc	%g4,	0x08CA,	%o2
	tleu	%icc,	0x0
loop_668:
	tvs	%icc,	0x6
	subccc	%l3,	%o1,	%l0
	fpsub32s	%f5,	%f9,	%f20
	sllx	%o5,	%g2,	%o3
	andcc	%o0,	%g5,	%i6
	fsrc2s	%f21,	%f0
	alignaddrl	%g7,	%o4,	%l6
	prefetch	[%l7 + 0x7C],	 0x0
	subc	%i0,	0x1FFF,	%i2
	movneg	%icc,	%i1,	%i4
	mova	%icc,	%l5,	%o6
	nop
	set	0x50, %o7
	std	%i4,	[%l7 + %o7]
	or	%l1,	0x17FB,	%o7
	andncc	%g6,	%g3,	%g1
	tle	%xcc,	0x1
	fcmpeq32	%f18,	%f24,	%l2
	fmovrdlez	%i7,	%f28,	%f22
	ba,pt	%icc,	loop_669
	sdiv	%l4,	0x0314,	%g4
	brgz	%o2,	loop_670
	tne	%xcc,	0x1
loop_669:
	membar	0x31
	fmul8x16au	%f26,	%f15,	%f20
loop_670:
	popc	0x1149,	%i3
	subc	%o1,	0x0BF0,	%l0
	prefetch	[%l7 + 0x18],	 0x3
	andn	%l3,	0x03E2,	%o5
	call	loop_671
	tle	%icc,	0x7
	smulcc	%g2,	%o3,	%g5
	fpadd16	%f24,	%f2,	%f24
loop_671:
	udivx	%o0,	0x064B,	%g7
	fba	%fcc2,	loop_672
	fbul,a	%fcc0,	loop_673
	mulscc	%i6,	0x1E66,	%o4
	array32	%i0,	%l6,	%i2
loop_672:
	movcs	%icc,	%i4,	%i1
loop_673:
	movpos	%icc,	%l5,	%o6
	orncc	%i5,	%o7,	%g6
	fnegd	%f2,	%f18
	mova	%icc,	%g3,	%g1
	xnor	%l2,	0x036F,	%i7
	addc	%l4,	0x00DD,	%g4
	xnor	%o2,	0x1F5F,	%i3
	orn	%l1,	%o1,	%l0
	fpadd16	%f18,	%f2,	%f16
	brnz,a	%l3,	loop_674
	andncc	%g2,	%o3,	%o5
	ble,a	loop_675
	movcc	%xcc,	%g5,	%o0
loop_674:
	tge	%icc,	0x3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_675:
	pdist	%f14,	%f12,	%f6
	xor	%g7,	0x08AE,	%i6
	movle	%icc,	%o4,	%l6
	wr	%g0,	0x04,	%asi
	ldsba	[%l7 + 0x33] %asi,	%i0
	movcc	%icc,	%i2,	%i1
	orncc	%l5,	%i4,	%o6
	edge8	%o7,	%i5,	%g3
	ta	%xcc,	0x2
	xnorcc	%g1,	%g6,	%l2
	fmuld8sux16	%f23,	%f21,	%f30
	fba,a	%fcc3,	loop_676
	fcmpeq16	%f20,	%f0,	%l4
	sub	%g4,	%o2,	%i7
	orcc	%l1,	0x1B9F,	%o1
loop_676:
	alignaddrl	%i3,	%l3,	%g2
	movrlz	%o3,	%l0,	%o5
	mova	%icc,	%g5,	%g7
	andn	%i6,	0x147B,	%o4
	sdivcc	%o0,	0x04E1,	%i0
	fmovsleu	%xcc,	%f29,	%f19
	movneg	%icc,	%i2,	%i1
	and	%l5,	%l6,	%i4
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
	std	%o6,	[%l7 + 0x48]
	srlx	%o6,	%g3,	%g1
	fors	%f30,	%f24,	%f18
loop_677:
	tpos	%xcc,	0x3
	brnz	%i5,	loop_678
	sllx	%g6,	%l2,	%l4
	edge8ln	%o2,	%g4,	%i7
	movneg	%icc,	%l1,	%i3
loop_678:
	be,a	loop_679
	addc	%l3,	0x1E77,	%g2
	fabsd	%f30,	%f22
	array32	%o1,	%l0,	%o5
loop_679:
	fpsub16	%f20,	%f8,	%f8
	ldstub	[%l7 + 0x24],	%g5
	mulx	%o3,	%i6,	%o4
	tvs	%icc,	0x3
	sll	%g7,	%o0,	%i0
	fmovdle	%xcc,	%f21,	%f22
	srax	%i2,	0x0A,	%l5
	wr	%g0,	0x81,	%asi
	prefetcha	[%l7 + 0x28] %asi,	 0x1
	add	%l7,	0x38,	%l6
	wr	%g0,	0x0c,	%asi
	casxa	[%l6] %asi,	%l6,	%i4
	addccc	%o6,	0x00D4,	%g3
	fands	%f27,	%f7,	%f8
	popc	0x0450,	%o7
	array32	%i5,	%g1,	%g6
	tvc	%xcc,	0x0
	edge8ln	%l4,	%o2,	%l2
	nop
	set	0x6B, %o5
	ldstub	[%l7 + %o5],	%i7
	fpadd16	%f10,	%f10,	%f14
	tle	%xcc,	0x5
	bcs,a	loop_680
	add	%l1,	0x1A2A,	%i3
	movrgez	%l3,	%g4,	%o1
	set	0x46, %o1
	ldsha	[%l7 + %o1] 0x19,	%g2
loop_680:
	sllx	%o5,	%l0,	%g5
	add	%i6,	0x170A,	%o4
	andncc	%g7,	%o0,	%o3
	bpos,a,pt	%icc,	loop_681
	fmovdcs	%icc,	%f29,	%f3
	fpmerge	%f4,	%f23,	%f2
	flush	%l7 + 0x64
loop_681:
	srlx	%i0,	%l5,	%i1
	array16	%i2,	%l6,	%o6
	fpadd32	%f30,	%f12,	%f14
	fcmple16	%f18,	%f8,	%i4
	array8	%o7,	%g3,	%i5
	movn	%icc,	%g1,	%g6
	nop
	setx	loop_682,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movl	%xcc,	%o2,	%l4
	fbue,a	%fcc3,	loop_683
	movcc	%icc,	%l2,	%l1
loop_682:
	fbue,a	%fcc0,	loop_684
	brlez	%i7,	loop_685
loop_683:
	movrlz	%l3,	0x057,	%g4
	be,a	%icc,	loop_686
loop_684:
	tne	%icc,	0x2
loop_685:
	sllx	%i3,	0x19,	%o1
	set	0x64, %g1
	ldstuba	[%l7 + %g1] 0x19,	%o5
loop_686:
	sdivx	%g2,	0x0713,	%g5
	edge8	%i6,	%o4,	%l0
	movne	%xcc,	%o0,	%g7
	fbule	%fcc0,	loop_687
	array16	%i0,	%o3,	%i1
	movne	%xcc,	%l5,	%i2
	nop
	setx	loop_688,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_687:
	umulcc	%l6,	0x0338,	%o6
	bcc,pn	%xcc,	loop_689
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_688:
	ldd	[%l7 + 0x30],	%f6
	alignaddrl	%o7,	%i4,	%g3
loop_689:
	fmul8x16al	%f24,	%f22,	%f18
	tcs	%icc,	0x3
	or	%i5,	%g1,	%o2
	fmovspos	%xcc,	%f26,	%f27
	wr	%g0,	0x19,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	movne	%icc,	%g6,	%l2
	set	0x47, %l3
	ldstuba	[%l7 + %l3] 0x04,	%l1
	movrlz	%l4,	0x266,	%i7
	tne	%icc,	0x6
	ta	%icc,	0x3
	srlx	%g4,	0x13,	%i3
	edge32l	%l3,	%o5,	%o1
	array16	%g5,	%g2,	%o4
	fmovsge	%icc,	%f26,	%f10
	fcmpne32	%f18,	%f8,	%l0
	call	loop_690
	movleu	%xcc,	%i6,	%o0
	edge8n	%g7,	%o3,	%i0
	fmovsl	%icc,	%f4,	%f10
loop_690:
	fbn,a	%fcc0,	loop_691
	tneg	%icc,	0x5
	tneg	%icc,	0x2
	movcs	%icc,	%l5,	%i1
loop_691:
	xnor	%i2,	0x1A0F,	%l6
	std	%f18,	[%l7 + 0x18]
	edge8n	%o6,	%o7,	%i4
	set	0x78, %g3
	lduwa	[%l7 + %g3] 0x80,	%i5
	addc	%g3,	%o2,	%g1
	tsubcctv	%g6,	%l2,	%l4
	movcc	%xcc,	%i7,	%g4
	ldd	[%l7 + 0x18],	%l0
	movvc	%icc,	%i3,	%l3
	ba,a,pn	%icc,	loop_692
	fmovrdgz	%o5,	%f8,	%f30
	fmovrsne	%o1,	%f23,	%f31
	fcmple16	%f14,	%f0,	%g5
loop_692:
	subc	%o4,	%l0,	%g2
	set	0x08, %i5
	lda	[%l7 + %i5] 0x10,	%f25
	set	0x68, %i0
	prefetcha	[%l7 + %i0] 0x0c,	 0x1
	tle	%xcc,	0x1
	umul	%o0,	%g7,	%i0
	tcs	%icc,	0x2
	movre	%o3,	%i1,	%l5
	xor	%i2,	%o6,	%o7
	sub	%i4,	0x14CD,	%i5
	movg	%xcc,	%g3,	%o2
	wr	%g0,	0x89,	%asi
	lda	[%l7 + 0x60] %asi,	%f31
	srl	%g1,	0x03,	%l6
	fabss	%f16,	%f1
	movneg	%icc,	%l2,	%l4
	wr	%g0,	0x88,	%asi
	ldsha	[%l7 + 0x28] %asi,	%i7
	movle	%icc,	%g4,	%l1
	movrlz	%g6,	%l3,	%i3
	fand	%f6,	%f0,	%f6
	movvs	%icc,	%o1,	%o5
	set	0x64, %l4
	lduwa	[%l7 + %l4] 0x04,	%o4
	movl	%icc,	%l0,	%g5
	ba,a,pt	%xcc,	loop_693
	movvc	%icc,	%g2,	%o0
	mova	%xcc,	%i6,	%i0
	edge8	%g7,	%i1,	%o3
loop_693:
	edge16n	%i2,	%o6,	%l5
	movvc	%xcc,	%o7,	%i4
	brnz,a	%i5,	loop_694
	movpos	%xcc,	%g3,	%g1
	fmovrsne	%o2,	%f4,	%f11
	set	0x22, %i4
	lduha	[%l7 + %i4] 0x80,	%l2
loop_694:
	call	loop_695
	andcc	%l6,	%l4,	%g4
	umul	%i7,	%l1,	%g6
	bcc,a,pt	%xcc,	loop_696
loop_695:
	ld	[%l7 + 0x4C],	%f16
	fcmpne16	%f2,	%f12,	%i3
	movrlz	%l3,	0x146,	%o5
loop_696:
	tvc	%icc,	0x6
	brz	%o4,	loop_697
	movcc	%xcc,	%l0,	%o1
	wr	%g0,	0x80,	%asi
	sta	%f23,	[%l7 + 0x44] %asi
loop_697:
	nop
	setx loop_698, %l0, %l1
	jmpl %l1, %g2
	movrne	%g5,	0x127,	%i6
	tleu	%xcc,	0x3
	flush	%l7 + 0x1C
loop_698:
	fxnor	%f10,	%f22,	%f10
	fmovdgu	%icc,	%f25,	%f20
	tleu	%xcc,	0x5
	fandnot1	%f14,	%f4,	%f8
	ldsw	[%l7 + 0x50],	%o0
	movrlez	%g7,	0x3BC,	%i0
	set	0x70, %o4
	ldstuba	[%l7 + %o4] 0x04,	%i1
	tl	%icc,	0x1
	fexpand	%f18,	%f26
	movrne	%i2,	0x340,	%o3
	movrne	%l5,	0x060,	%o7
	sub	%i4,	0x0D95,	%o6
	ldd	[%l7 + 0x50],	%f4
	brlez	%g3,	loop_699
	tpos	%xcc,	0x6
	fnor	%f20,	%f2,	%f18
	udivcc	%i5,	0x0FCC,	%o2
loop_699:
	sir	0x0483
	edge8l	%l2,	%l6,	%g1
	edge32ln	%g4,	%l4,	%i7
	fpadd32	%f30,	%f18,	%f12
	fands	%f12,	%f21,	%f25
	edge32l	%g6,	%i3,	%l1
	movrgez	%l3,	0x18E,	%o4
	wr	%g0,	0x89,	%asi
	ldsba	[%l7 + 0x6E] %asi,	%l0
	fmovsvs	%xcc,	%f14,	%f16
	wr	%g0,	0x80,	%asi
	lduwa	[%l7 + 0x64] %asi,	%o1
	set	0x70, %o0
	prefetcha	[%l7 + %o0] 0x81,	 0x1
	edge16l	%g2,	%g5,	%o0
	brgez,a	%g7,	loop_700
	smul	%i0,	0x0F06,	%i6
	ldsh	[%l7 + 0x30],	%i2
	membar	0x5E
loop_700:
	membar	0x0D
	bleu,pn	%xcc,	loop_701
	bn	%xcc,	loop_702
	movgu	%xcc,	%o3,	%i1
	fbug	%fcc1,	loop_703
loop_701:
	tvs	%xcc,	0x3
loop_702:
	tsubcctv	%o7,	%i4,	%o6
	tneg	%icc,	0x4
loop_703:
	tl	%icc,	0x0
	edge32n	%l5,	%i5,	%g3
	fmovdg	%xcc,	%f0,	%f29
	lduw	[%l7 + 0x24],	%o2
	tle	%xcc,	0x0
	sub	%l6,	%l2,	%g4
	andn	%g1,	%i7,	%g6
	fmovsgu	%icc,	%f31,	%f3
	movrne	%l4,	0x173,	%i3
	movre	%l3,	%l1,	%o4
	move	%icc,	%l0,	%o1
	set	0x6A, %g6
	lduha	[%l7 + %g6] 0x10,	%g2
	orcc	%g5,	%o5,	%o0
	taddcctv	%g7,	%i6,	%i2
	fpadd16s	%f4,	%f13,	%f2
	fba,a	%fcc3,	loop_704
	fbul	%fcc3,	loop_705
	stb	%i0,	[%l7 + 0x1E]
	wr	%g0,	0x04,	%asi
	lduha	[%l7 + 0x10] %asi,	%i1
loop_704:
	bg,pt	%xcc,	loop_706
loop_705:
	tpos	%icc,	0x7
	fmovrslez	%o7,	%f31,	%f13
	fornot1s	%f2,	%f14,	%f20
loop_706:
	fbul	%fcc0,	loop_707
	array8	%i4,	%o3,	%o6
	udiv	%i5,	0x1CC9,	%g3
	subccc	%l5,	0x016D,	%o2
loop_707:
	taddcc	%l6,	0x1987,	%l2
	set	0x58, %o3
	stxa	%g4,	[%l7 + %o3] 0x19
	fmovscs	%xcc,	%f19,	%f29
	wr	%g0,	0x88,	%asi
	stwa	%i7,	[%l7 + 0x20] %asi
	fbn	%fcc2,	loop_708
	membar	0x6A
	set	0x74, %g2
	stwa	%g6,	[%l7 + %g2] 0x11
loop_708:
	nop
	add	%l7,	0x14,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] %asi,	%g1,	%l4
	fcmple32	%f14,	%f2,	%l3
	addcc	%l1,	%i3,	%o4
	tpos	%icc,	0x4
	fcmpeq16	%f6,	%f6,	%o1
	bcs	%icc,	loop_709
	movgu	%xcc,	%g2,	%g5
	movre	%l0,	0x16C,	%o5
	fmovdle	%xcc,	%f28,	%f9
loop_709:
	addccc	%o0,	0x0A34,	%g7
	tn	%icc,	0x2
	taddcc	%i6,	0x0DA4,	%i2
	siam	0x2
	fbug	%fcc2,	loop_710
	edge32n	%i0,	%o7,	%i4
	fmovdgu	%xcc,	%f18,	%f15
	movg	%xcc,	%o3,	%i1
loop_710:
	sll	%o6,	%i5,	%g3
	tsubcctv	%l5,	%o2,	%l2
	bgu	%xcc,	loop_711
	popc	%g4,	%i7
	srax	%l6,	0x10,	%g1
	andn	%g6,	%l4,	%l3
loop_711:
	fnot1s	%f13,	%f7
	fmovscs	%icc,	%f23,	%f6
	tcs	%xcc,	0x3
	udiv	%l1,	0x060B,	%i3
	edge16n	%o4,	%g2,	%g5
	bshuffle	%f16,	%f26,	%f10
	sra	%l0,	0x04,	%o5
	andcc	%o0,	%g7,	%i6
	te	%icc,	0x1
	edge32l	%o1,	%i0,	%i2
	smul	%i4,	%o7,	%i1
	fmovsa	%icc,	%f22,	%f3
	fmovdgu	%icc,	%f7,	%f5
	ldd	[%l7 + 0x58],	%f24
	edge16n	%o3,	%i5,	%o6
	movrgez	%l5,	%g3,	%l2
	mulx	%g4,	0x1909,	%i7
	fexpand	%f19,	%f6
	tgu	%xcc,	0x0
	alignaddr	%o2,	%l6,	%g6
	fbl,a	%fcc3,	loop_712
	subc	%l4,	%g1,	%l3
	tl	%xcc,	0x2
	stbar
loop_712:
	pdist	%f0,	%f10,	%f18
	addc	%i3,	%l1,	%o4
	srlx	%g2,	0x1A,	%l0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	setx loop_713, %l0, %l1
	jmpl %l1, %g5
	stb	%o5,	[%l7 + 0x32]
	fmovdcc	%xcc,	%f1,	%f25
	fsrc2s	%f4,	%f10
loop_713:
	fmovdl	%xcc,	%f26,	%f24
	movg	%xcc,	%g7,	%o0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andn	%o1,	0x1CEC,	%i6
	fbo,a	%fcc3,	loop_714
	xor	%i2,	%i0,	%o7
	te	%icc,	0x4
	fzeros	%f14
loop_714:
	fbu,a	%fcc3,	loop_715
	movcc	%xcc,	%i4,	%o3
	fmovdleu	%icc,	%f17,	%f13
	fmovdg	%xcc,	%f10,	%f13
loop_715:
	fmovsl	%xcc,	%f25,	%f0
	movvs	%icc,	%i5,	%o6
	bgu,a	loop_716
	st	%f7,	[%l7 + 0x74]
	bn,a,pt	%xcc,	loop_717
	st	%f5,	[%l7 + 0x3C]
loop_716:
	bl,pt	%xcc,	loop_718
	edge8	%i1,	%g3,	%l5
loop_717:
	alignaddr	%g4,	%l2,	%o2
	tneg	%xcc,	0x5
loop_718:
	edge8l	%l6,	%g6,	%i7
	movrne	%l4,	%g1,	%i3
	fpsub16s	%f19,	%f6,	%f21
	ldd	[%l7 + 0x10],	%f12
	movrgez	%l3,	0x230,	%l1
	movne	%xcc,	%g2,	%o4
	set	0x48, %i2
	prefetcha	[%l7 + %i2] 0x0c,	 0x3
	fmovdvs	%xcc,	%f29,	%f28
	fmovrslez	%o5,	%f31,	%f14
	sdivx	%g7,	0x1C96,	%l0
	edge32	%o0,	%o1,	%i6
	udiv	%i2,	0x0AD8,	%i0
	fsrc1s	%f10,	%f27
	movrgz	%i4,	%o7,	%i5
	alignaddr	%o6,	%i1,	%o3
	bl	loop_719
	fmuld8ulx16	%f27,	%f5,	%f8
	subcc	%g3,	0x0064,	%l5
	movrlez	%g4,	0x066,	%o2
loop_719:
	movle	%xcc,	%l6,	%g6
	movrlz	%i7,	%l4,	%g1
	array8	%l2,	%l3,	%l1
	movneg	%xcc,	%g2,	%i3
	stx	%o4,	[%l7 + 0x08]
	srax	%g5,	%g7,	%o5
	smul	%o0,	0x04D7,	%l0
	umul	%i6,	%i2,	%o1
	fbug	%fcc1,	loop_720
	subcc	%i0,	0x1B95,	%o7
	andcc	%i4,	%i5,	%o6
	alignaddrl	%i1,	%g3,	%l5
loop_720:
	smulcc	%g4,	%o2,	%l6
	fpadd16s	%f14,	%f15,	%f19
	movvc	%xcc,	%o3,	%g6
	fxnor	%f6,	%f14,	%f20
	brlz	%i7,	loop_721
	movvc	%xcc,	%g1,	%l2
	sdivx	%l3,	0x1E2A,	%l4
	sll	%l1,	0x08,	%g2
loop_721:
	fmovscc	%xcc,	%f11,	%f20
	movrne	%i3,	0x052,	%g5
	wr	%g0,	0x80,	%asi
	stba	%g7,	[%l7 + 0x6E] %asi
	movne	%xcc,	%o5,	%o4
	movrlz	%l0,	%o0,	%i2
	sethi	0x0017,	%i6
	sdiv	%o1,	0x07AA,	%o7
	orn	%i4,	%i5,	%i0
	nop
	set	0x08, %l5
	prefetch	[%l7 + %l5],	 0x1
	fcmple16	%f24,	%f22,	%o6
	edge16ln	%i1,	%g3,	%l5
	smul	%o2,	0x06D4,	%g4
	sethi	0x1A6D,	%o3
	movrgez	%g6,	%l6,	%i7
	fpadd32	%f24,	%f16,	%f28
	ta	%xcc,	0x4
	std	%l2,	[%l7 + 0x60]
	st	%f19,	[%l7 + 0x14]
	alignaddr	%g1,	%l4,	%l3
	edge8n	%l1,	%g2,	%i3
	movre	%g5,	%o5,	%g7
	fcmpeq32	%f26,	%f30,	%l0
	nop
	set	0x1A, %g5
	ldub	[%l7 + %g5],	%o4
	ldsb	[%l7 + 0x66],	%o0
	edge32ln	%i6,	%i2,	%o1
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
	bn	loop_723
	addccc	%i4,	%i5,	%o7
	ldsh	[%l7 + 0x7C],	%o6
loop_722:
	tg	%icc,	0x5
loop_723:
	bcs,a	loop_724
	fpadd32	%f8,	%f8,	%f6
	fnegs	%f27,	%f7
	be,a	%xcc,	loop_725
loop_724:
	mulx	%i1,	%i0,	%l5
	sethi	0x1F0A,	%g3
	fandnot1s	%f14,	%f10,	%f20
loop_725:
	edge32	%g4,	%o3,	%g6
	brnz	%o2,	loop_726
	brlz	%i7,	loop_727
	fmovsvs	%xcc,	%f17,	%f2
	addcc	%l6,	0x1224,	%l2
loop_726:
	ldsw	[%l7 + 0x6C],	%g1
loop_727:
	subccc	%l4,	%l1,	%g2
	fmovdge	%xcc,	%f31,	%f23
	fpsub16s	%f2,	%f14,	%f5
	movrlz	%i3,	0x2D1,	%g5
	wr	%g0,	0x0c,	%asi
	swapa	[%l7 + 0x0C] %asi,	%o5
	movg	%xcc,	%l3,	%l0
	edge32ln	%g7,	%o4,	%i6
	fbne	%fcc2,	loop_728
	fone	%f26
	edge32n	%o0,	%i2,	%i4
	set	0x58, %l1
	stwa	%i5,	[%l7 + %l1] 0x23
	membar	#Sync
loop_728:
	brlez	%o7,	loop_729
	umulcc	%o1,	%o6,	%i0
	stb	%l5,	[%l7 + 0x7A]
	nop
	set	0x30, %l0
	ldd	[%l7 + %l0],	%f28
loop_729:
	andn	%i1,	0x140B,	%g4
	tneg	%xcc,	0x2
	fmovdpos	%icc,	%f16,	%f25
	add	%g3,	0x0FE5,	%o3
	tpos	%xcc,	0x0
	fbu,a	%fcc2,	loop_730
	mulx	%g6,	%o2,	%l6
	fmovrsgz	%i7,	%f13,	%f11
	fbul,a	%fcc3,	loop_731
loop_730:
	fbge,a	%fcc0,	loop_732
	fmovrdlz	%g1,	%f20,	%f12
	fbul	%fcc3,	loop_733
loop_731:
	fcmple32	%f20,	%f14,	%l2
loop_732:
	bvc,a	loop_734
	fabss	%f2,	%f11
loop_733:
	edge8	%l1,	%l4,	%g2
	movl	%xcc,	%g5,	%i3
loop_734:
	movrlez	%l3,	0x0FB,	%l0
	fmovsvs	%icc,	%f19,	%f23
	fmovrslz	%o5,	%f18,	%f29
	set	0x78, %i7
	sta	%f27,	[%l7 + %i7] 0x0c
	array32	%o4,	%g7,	%i6
	fbge	%fcc0,	loop_735
	brlez	%o0,	loop_736
	faligndata	%f22,	%f2,	%f24
	stx	%i2,	[%l7 + 0x50]
loop_735:
	edge32ln	%i4,	%i5,	%o1
loop_736:
	andn	%o7,	0x1E06,	%i0
	std	%f26,	[%l7 + 0x68]
	fmovsl	%xcc,	%f6,	%f14
	mova	%xcc,	%l5,	%i1
	fmul8x16au	%f30,	%f23,	%f2
	flush	%l7 + 0x64
	fmovdneg	%icc,	%f1,	%f6
	fands	%f15,	%f15,	%f20
	add	%g4,	%o6,	%o3
	fmovdvc	%icc,	%f23,	%f21
	fmovde	%icc,	%f4,	%f18
	ldstub	[%l7 + 0x3A],	%g3
	ldx	[%l7 + 0x08],	%g6
	udivx	%o2,	0x188C,	%l6
	ba,pn	%icc,	loop_737
	fbn,a	%fcc2,	loop_738
	edge32l	%i7,	%l2,	%l1
	fnegd	%f12,	%f10
loop_737:
	fmovdgu	%icc,	%f26,	%f25
loop_738:
	fbn,a	%fcc3,	loop_739
	sub	%l4,	0x0FA4,	%g2
	fornot1s	%f9,	%f26,	%f24
	smulcc	%g1,	0x1093,	%g5
loop_739:
	fsrc2	%f20,	%f12
	addccc	%i3,	%l0,	%o5
	orncc	%l3,	0x0EC9,	%g7
	array16	%o4,	%o0,	%i6
	stbar
	nop
	setx loop_740, %l0, %l1
	jmpl %l1, %i4
	movgu	%xcc,	%i2,	%i5
	sdivx	%o1,	0x1360,	%o7
	for	%f2,	%f28,	%f24
loop_740:
	fmovsvc	%xcc,	%f0,	%f11
	sub	%l5,	%i1,	%i0
	fmovsl	%xcc,	%f2,	%f2
	tge	%xcc,	0x4
	tvs	%xcc,	0x2
	tne	%icc,	0x2
	nop
	set	0x7C, %i1
	ldsh	[%l7 + %i1],	%g4
	bleu,pn	%icc,	loop_741
	membar	0x22
	edge8ln	%o3,	%g3,	%o6
	tcc	%xcc,	0x0
loop_741:
	ta	%icc,	0x4
	array8	%o2,	%g6,	%l6
	movrlz	%l2,	%l1,	%l4
	umul	%i7,	%g2,	%g1
	bgu	loop_742
	move	%xcc,	%g5,	%i3
	fnands	%f20,	%f19,	%f24
	fnot1	%f30,	%f12
loop_742:
	brnz	%o5,	loop_743
	movgu	%icc,	%l3,	%l0
	addcc	%o4,	0x10B6,	%g7
	ldx	[%l7 + 0x78],	%o0
loop_743:
	srax	%i4,	0x06,	%i2
	udivcc	%i5,	0x0C04,	%o1
	wr	%g0,	0xf8,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
	fmovsge	%icc,	%f21,	%f29
	edge8n	%o7,	%l5,	%i6
	sethi	0x08CE,	%i0
	te	%icc,	0x1
	edge32n	%g4,	%o3,	%g3
	ldsh	[%l7 + 0x3A],	%i1
	fpsub32s	%f28,	%f10,	%f26
	fmovspos	%icc,	%f26,	%f30
	sth	%o2,	[%l7 + 0x28]
	edge32l	%g6,	%o6,	%l2
	movcc	%icc,	%l6,	%l1
	mulx	%i7,	0x1669,	%l4
	tne	%xcc,	0x1
	orn	%g1,	%g2,	%i3
	bne	%icc,	loop_744
	xor	%g5,	0x1A19,	%l3
	andcc	%l0,	%o4,	%o5
	wr	%g0,	0x11,	%asi
	sta	%f1,	[%l7 + 0x0C] %asi
loop_744:
	nop
	set	0x60, %i3
	ldswa	[%l7 + %i3] 0x89,	%o0
	fbue,a	%fcc3,	loop_745
	udivx	%g7,	0x1B12,	%i4
	addcc	%i5,	0x19F7,	%o1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_745:
	sra	%o7,	%i2,	%l5
	fmovdl	%icc,	%f29,	%f7
	fnors	%f7,	%f5,	%f1
	std	%i0,	[%l7 + 0x20]
	tsubcctv	%g4,	%o3,	%i6
	stbar
	fmuld8sux16	%f7,	%f12,	%f4
	nop
	set	0x10, %g4
	ldd	[%l7 + %g4],	%f4
	brnz	%i1,	loop_746
	stbar
	tvc	%xcc,	0x1
	fmovsn	%xcc,	%f2,	%f9
loop_746:
	nop
	wr	%g0,	0x19,	%asi
	lduba	[%l7 + 0x19] %asi,	%g3
	udiv	%g6,	0x0E71,	%o6
	addc	%l2,	%o2,	%l1
	fmovdge	%xcc,	%f25,	%f26
	wr	%g0,	0x88,	%asi
	sta	%f28,	[%l7 + 0x74] %asi
	srl	%i7,	%l4,	%l6
	orcc	%g1,	%i3,	%g5
	movpos	%icc,	%g2,	%l3
	set	0x60, %o6
	prefetcha	[%l7 + %o6] 0x15,	 0x2
	taddcctv	%o4,	%o5,	%o0
	fmovsg	%icc,	%f25,	%f25
	movg	%xcc,	%i4,	%g7
	edge8l	%o1,	%o7,	%i5
	xnor	%i2,	0x0E4E,	%i0
	brlez,a	%l5,	loop_747
	movne	%icc,	%o3,	%g4
	movvs	%icc,	%i1,	%i6
	srlx	%g6,	%g3,	%l2
loop_747:
	bleu,a	%xcc,	loop_748
	xnor	%o2,	%o6,	%l1
	sdivcc	%l4,	0x0E00,	%l6
	bl,a,pn	%icc,	loop_749
loop_748:
	orcc	%g1,	%i7,	%i3
	subcc	%g2,	0x0E7A,	%g5
	fandnot1	%f26,	%f28,	%f6
loop_749:
	addc	%l0,	0x1557,	%o4
	subc	%l3,	%o0,	%o5
	subcc	%g7,	0x02AA,	%i4
	smul	%o7,	0x13BB,	%i5
	fnors	%f25,	%f7,	%f9
	movge	%xcc,	%i2,	%i0
	edge32l	%l5,	%o3,	%g4
	alignaddr	%o1,	%i6,	%g6
	movn	%xcc,	%i1,	%l2
	bpos,a	%icc,	loop_750
	fands	%f26,	%f12,	%f4
	tneg	%xcc,	0x5
	subc	%g3,	0x0576,	%o6
loop_750:
	nop
	set	0x70, %i6
	ldswa	[%l7 + %i6] 0x88,	%o2
	fmovdgu	%xcc,	%f23,	%f12
	tcs	%xcc,	0x0
	tsubcctv	%l4,	0x1215,	%l6
	srl	%l1,	0x0D,	%i7
	tpos	%xcc,	0x2
	fmovsge	%xcc,	%f17,	%f11
	array16	%g1,	%g2,	%i3
	movvs	%xcc,	%g5,	%o4
	andncc	%l3,	%l0,	%o0
	fmovsge	%icc,	%f2,	%f23
	udivx	%g7,	0x00C3,	%o5
	tn	%icc,	0x4
	fand	%f18,	%f30,	%f26
	sdivx	%o7,	0x05C8,	%i4
	fabss	%f24,	%f20
	andncc	%i5,	%i0,	%i2
	umulcc	%o3,	%l5,	%g4
	xorcc	%i6,	%g6,	%i1
	edge32n	%l2,	%o1,	%g3
	addc	%o2,	%o6,	%l6
	movn	%xcc,	%l4,	%l1
	movrlez	%i7,	%g1,	%i3
	ble	loop_751
	fands	%f13,	%f18,	%f13
	sra	%g2,	%o4,	%l3
	tle	%icc,	0x4
loop_751:
	movrgez	%g5,	0x0E8,	%l0
	tsubcctv	%o0,	0x12F3,	%g7
	tvc	%icc,	0x7
	smul	%o7,	%o5,	%i5
	sub	%i0,	%i4,	%o3
	sdivx	%i2,	0x018E,	%g4
	set	0x57, %o2
	ldstuba	[%l7 + %o2] 0x0c,	%i6
	te	%xcc,	0x4
	wr	%g0,	0xe3,	%asi
	stxa	%l5,	[%l7 + 0x70] %asi
	membar	#Sync
	udiv	%i1,	0x0F42,	%l2
	sra	%g6,	0x10,	%o1
	edge32ln	%o2,	%g3,	%l6
	tsubcctv	%l4,	%l1,	%o6
	tsubcctv	%g1,	0x14F4,	%i3
	fmovdge	%xcc,	%f16,	%f3
	bgu	loop_752
	array32	%i7,	%g2,	%o4
	fbge	%fcc1,	loop_753
	taddcctv	%l3,	%g5,	%o0
loop_752:
	fbug	%fcc0,	loop_754
	fmovde	%icc,	%f31,	%f3
loop_753:
	srax	%l0,	%g7,	%o5
	fzero	%f2
loop_754:
	sllx	%o7,	0x15,	%i0
	sdivx	%i5,	0x0203,	%o3
	fbge,a	%fcc1,	loop_755
	addc	%i4,	0x1D8A,	%g4
	sra	%i2,	%l5,	%i6
	edge8ln	%l2,	%g6,	%i1
loop_755:
	movg	%xcc,	%o1,	%o2
	sir	0x0A18
	fpsub16s	%f28,	%f4,	%f19
	edge8l	%g3,	%l6,	%l1
	movrlez	%l4,	%o6,	%i3
	sdivx	%g1,	0x09C6,	%g2
	umulcc	%i7,	%o4,	%g5
	bvc,pn	%icc,	loop_756
	edge16	%l3,	%l0,	%o0
	wr	%g0,	0x57,	%asi
	stxa	%g7,	[%g0 + 0x0] %asi
loop_756:
	orcc	%o5,	%i0,	%i5
	edge16ln	%o7,	%i4,	%g4
	movne	%icc,	%o3,	%l5
	srlx	%i2,	%i6,	%g6
	tvc	%xcc,	0x7
	brgez,a	%l2,	loop_757
	fornot1s	%f10,	%f16,	%f8
	sethi	0x10F6,	%o1
	brlez,a	%i1,	loop_758
loop_757:
	swap	[%l7 + 0x60],	%g3
	sdiv	%o2,	0x1E6F,	%l1
	brlez,a	%l6,	loop_759
loop_758:
	flush	%l7 + 0x60
	edge16l	%l4,	%o6,	%i3
	edge16l	%g1,	%g2,	%i7
loop_759:
	nop
	wr	%g0,	0x89,	%asi
	swapa	[%l7 + 0x6C] %asi,	%g5
	popc	%o4,	%l0
	alignaddrl	%o0,	%g7,	%o5
	wr	%g0,	0x89,	%asi
	ldsba	[%l7 + 0x46] %asi,	%l3
	srax	%i5,	%o7,	%i0
	add	%l7,	0x14,	%l6
	wr	%g0,	0x18,	%asi
	lda	[%l6] %asi,	%i4
	casa	[%l6] %asi,	%i4,	%g4
	fpsub16s	%f30,	%f1,	%f0
	tne	%xcc,	0x5
	edge32l	%o3,	%i2,	%l5
	movle	%xcc,	%i6,	%l2
	movrne	%o1,	0x156,	%i1
	umulcc	%g6,	0x1AFB,	%o2
	fnot2	%f24,	%f8
	sra	%g3,	0x02,	%l1
	sub	%l6,	%o6,	%l4
	edge8l	%i3,	%g2,	%i7
	te	%icc,	0x6
	smul	%g1,	0x1579,	%g5
	xnor	%l0,	0x0C6F,	%o0
	array32	%g7,	%o4,	%l3
	tvs	%xcc,	0x4
	stx	%o5,	[%l7 + 0x18]
	sra	%o7,	0x00,	%i0
	edge16	%i4,	%g4,	%o3
	tg	%icc,	0x5
	fnot1s	%f6,	%f21
	movre	%i2,	%i5,	%l5
	fmovrdgez	%l2,	%f28,	%f30
	bvs,pt	%xcc,	loop_760
	edge16l	%o1,	%i6,	%i1
	tle	%icc,	0x1
	fabsd	%f6,	%f4
loop_760:
	andncc	%g6,	%g3,	%l1
	fone	%f8
	brgz,a	%o2,	loop_761
	ta	%icc,	0x6
	mulscc	%l6,	%l4,	%o6
	set	0x74, %l2
	ldsha	[%l7 + %l2] 0x14,	%i3
loop_761:
	nop
	setx	loop_762,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	membar	0x5D
	swap	[%l7 + 0x3C],	%i7
	fbn,a	%fcc1,	loop_763
loop_762:
	ld	[%l7 + 0x5C],	%f10
	tl	%xcc,	0x3
	movvs	%xcc,	%g1,	%g2
loop_763:
	mulx	%l0,	%o0,	%g7
	fmovsg	%xcc,	%f9,	%f8
	ta	%xcc,	0x2
	edge32l	%o4,	%l3,	%o5
	fbuge	%fcc0,	loop_764
	fmovdpos	%xcc,	%f15,	%f21
	fpsub32	%f2,	%f26,	%f22
	umul	%o7,	0x00A9,	%g5
loop_764:
	xnor	%i0,	0x0231,	%g4
	srlx	%i4,	%o3,	%i2
	fmovd	%f30,	%f12
	xorcc	%l5,	%i5,	%l2
	fmul8x16al	%f21,	%f2,	%f6
	tle	%icc,	0x4
	fnegs	%f2,	%f14
	movpos	%xcc,	%i6,	%o1
	xorcc	%i1,	%g6,	%l1
	andncc	%o2,	%l6,	%g3
	sdivx	%o6,	0x0217,	%i3
	ble,pt	%icc,	loop_765
	sdiv	%l4,	0x1838,	%i7
	tle	%icc,	0x5
	wr	%g0,	0x04,	%asi
	ldsha	[%l7 + 0x3C] %asi,	%g2
loop_765:
	fpadd32s	%f7,	%f27,	%f6
	tne	%xcc,	0x4
	fble	%fcc1,	loop_766
	fmovdn	%xcc,	%f26,	%f9
	fbe	%fcc2,	loop_767
	and	%g1,	0x0D55,	%l0
loop_766:
	ta	%xcc,	0x3
	tvc	%icc,	0x3
loop_767:
	movneg	%xcc,	%g7,	%o0
	movrlz	%l3,	0x31A,	%o4
	std	%f8,	[%l7 + 0x68]
	fmovsn	%icc,	%f8,	%f13
	tl	%icc,	0x0
	membar	0x4D
	xor	%o5,	%g5,	%o7
	bne,a,pn	%icc,	loop_768
	fbl	%fcc2,	loop_769
	edge16n	%i0,	%g4,	%o3
	sir	0x18A0
loop_768:
	movleu	%xcc,	%i4,	%i2
loop_769:
	taddcctv	%l5,	0x1980,	%i5
	fexpand	%f15,	%f20
	fmovsgu	%icc,	%f29,	%f14
	tpos	%icc,	0x5
	fmovdl	%icc,	%f7,	%f20
	fcmpne16	%f28,	%f14,	%i6
	fmovsl	%icc,	%f8,	%f4
	andn	%l2,	0x0436,	%i1
	fcmple32	%f24,	%f22,	%g6
	tneg	%icc,	0x6
	fmovsl	%icc,	%f1,	%f27
	move	%xcc,	%l1,	%o2
	subcc	%l6,	0x08FA,	%o1
	tvc	%icc,	0x7
	ble,a,pn	%icc,	loop_770
	fsrc2s	%f15,	%f21
	fmovdneg	%icc,	%f19,	%f25
	edge16	%g3,	%i3,	%o6
loop_770:
	pdist	%f8,	%f8,	%f26
	edge32n	%l4,	%i7,	%g2
	fbne	%fcc3,	loop_771
	tvc	%icc,	0x5
	lduh	[%l7 + 0x4E],	%l0
	fbe,a	%fcc2,	loop_772
loop_771:
	movre	%g1,	0x148,	%g7
	sdivx	%o0,	0x0F84,	%o4
	brgz,a	%o5,	loop_773
loop_772:
	xnorcc	%g5,	0x116B,	%o7
	movne	%xcc,	%l3,	%i0
	fmovsneg	%icc,	%f5,	%f15
loop_773:
	bpos	%icc,	loop_774
	orncc	%g4,	0x0F8E,	%i4
	fmovsgu	%xcc,	%f14,	%f13
	bl	loop_775
loop_774:
	ldsb	[%l7 + 0x78],	%i2
	sra	%l5,	0x1F,	%o3
	edge8ln	%i5,	%l2,	%i1
loop_775:
	fandnot1	%f16,	%f6,	%f24
	tgu	%xcc,	0x2
	tgu	%xcc,	0x7
	fzero	%f8
	fbn	%fcc1,	loop_776
	edge32l	%i6,	%l1,	%g6
	sdiv	%l6,	0x067B,	%o2
	fmovsvc	%icc,	%f15,	%f28
loop_776:
	bg,a,pn	%xcc,	loop_777
	movvs	%icc,	%g3,	%i3
	subcc	%o1,	%l4,	%i7
	edge8n	%o6,	%l0,	%g2
loop_777:
	and	%g7,	%o0,	%g1
	sethi	0x0981,	%o5
	andcc	%g5,	%o4,	%o7
	tsubcctv	%l3,	0x0BE4,	%i0
	fbe	%fcc2,	loop_778
	swap	[%l7 + 0x10],	%i4
	edge16	%i2,	%l5,	%g4
	wr	%g0,	0xea,	%asi
	stwa	%i5,	[%l7 + 0x74] %asi
	membar	#Sync
loop_778:
	array16	%l2,	%i1,	%i6
	fpsub16	%f8,	%f24,	%f22
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnot1	%f22,	%f30
	lduw	[%l7 + 0x48],	%o3
	fcmped	%fcc0,	%f0,	%f22
	fandnot2	%f24,	%f10,	%f4
	fmovrdgz	%l1,	%f18,	%f16
	swap	[%l7 + 0x24],	%l6
	tl	%icc,	0x4
	tg	%icc,	0x6
	ldstub	[%l7 + 0x17],	%o2
	movre	%g3,	%g6,	%i3
	tn	%xcc,	0x0
	brgz	%o1,	loop_779
	fmovde	%xcc,	%f21,	%f10
	fmovsn	%icc,	%f26,	%f4
	st	%f25,	[%l7 + 0x0C]
loop_779:
	fmovsne	%icc,	%f21,	%f23
	array32	%l4,	%i7,	%l0
	fnot2s	%f7,	%f24
	xnor	%g2,	%g7,	%o0
	tsubcc	%g1,	0x081D,	%o6
	subc	%g5,	0x1CBA,	%o5
	fornot1s	%f27,	%f0,	%f19
	popc	0x0DC1,	%o7
	fmovdleu	%xcc,	%f23,	%f5
	taddcc	%o4,	%l3,	%i4
	fbuge	%fcc2,	loop_780
	fcmple32	%f30,	%f10,	%i2
	fbe,a	%fcc3,	loop_781
	edge32ln	%i0,	%g4,	%i5
loop_780:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sub	%l2,	0x1AA2,	%l5
loop_781:
	ldd	[%l7 + 0x48],	%f16
	edge32n	%i6,	%o3,	%i1
	sethi	0x0B2D,	%l6
	fcmpgt16	%f16,	%f14,	%o2
	tvc	%xcc,	0x2
	lduw	[%l7 + 0x7C],	%g3
	taddcc	%l1,	0x10F0,	%g6
	edge32n	%o1,	%l4,	%i3
	srax	%l0,	%g2,	%g7
	fbn	%fcc0,	loop_782
	ba	loop_783
	stw	%o0,	[%l7 + 0x5C]
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_782:
	movrgez	%i7,	%g1,	%g5
loop_783:
	fbu,a	%fcc1,	loop_784
	edge16n	%o5,	%o6,	%o7
	edge32ln	%o4,	%l3,	%i2
	sth	%i4,	[%l7 + 0x68]
loop_784:
	mulx	%g4,	0x1CAC,	%i0
	edge8ln	%l2,	%l5,	%i6
	popc	%i5,	%i1
	sra	%o3,	%o2,	%g3
	sub	%l6,	0x0D8B,	%g6
	subcc	%o1,	%l4,	%i3
	movn	%icc,	%l1,	%l0
	xnorcc	%g2,	%o0,	%i7
	sub	%g7,	0x1350,	%g1
	siam	0x4
	andn	%o5,	%g5,	%o7
	edge32ln	%o6,	%l3,	%i2
	xnor	%o4,	%g4,	%i0
	brnz,a	%l2,	loop_785
	tcs	%xcc,	0x2
	tn	%xcc,	0x5
	sllx	%i4,	0x09,	%l5
loop_785:
	bvs,pn	%xcc,	loop_786
	fzeros	%f18
	tneg	%icc,	0x4
	fexpand	%f3,	%f6
loop_786:
	alignaddrl	%i6,	%i5,	%o3
	sdiv	%o2,	0x18A8,	%g3
	movrne	%i1,	0x184,	%l6
	movvc	%xcc,	%g6,	%l4
	xor	%o1,	%i3,	%l0
	xor	%g2,	%l1,	%o0
	andcc	%i7,	0x022A,	%g1
	wr	%g0,	0x80,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	tcc	%icc,	0x2
	movneg	%icc,	%o5,	%g5
	tvc	%icc,	0x5
	set	0x38, %g7
	sta	%f16,	[%l7 + %g7] 0x04
	edge32n	%g7,	%o6,	%l3
	edge16l	%o7,	%o4,	%i2
	alignaddr	%g4,	%l2,	%i4
	fmovdn	%icc,	%f17,	%f16
	fcmpd	%fcc0,	%f18,	%f30
	subccc	%i0,	0x0CF1,	%i6
	subcc	%i5,	%o3,	%l5
	movneg	%xcc,	%o2,	%g3
	movcc	%xcc,	%l6,	%g6
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
	sth	%l4,	[%l7 + 0x6A]
	movvs	%icc,	%o1,	%i1
	xnor	%l0,	%i3,	%l1
loop_787:
	bvc,a	loop_788
	edge16	%g2,	%i7,	%g1
	set	0x40, %l6
	stda	%f0,	[%l7 + %l6] 0x14
loop_788:
	movgu	%xcc,	%o0,	%g5
	bne,pn	%xcc,	loop_789
	fbu	%fcc2,	loop_790
	fmul8ulx16	%f0,	%f22,	%f16
	fcmple16	%f26,	%f26,	%o5
loop_789:
	subcc	%g7,	0x08E9,	%o6
loop_790:
	st	%f24,	[%l7 + 0x6C]
	edge32ln	%o7,	%o4,	%l3
	movrgz	%g4,	%l2,	%i2
	subc	%i0,	%i6,	%i4
	fmovs	%f3,	%f29
	tpos	%xcc,	0x1
	set	0x38, %o5
	ldxa	[%l7 + %o5] 0x04,	%o3
	umulcc	%i5,	%o2,	%l5
	fandnot2s	%f7,	%f5,	%f23
	movn	%xcc,	%g3,	%g6
	array16	%l4,	%o1,	%i1
	fmovsvc	%xcc,	%f19,	%f1
	brlez,a	%l6,	loop_791
	fcmped	%fcc0,	%f22,	%f22
	movl	%icc,	%i3,	%l0
	movleu	%xcc,	%l1,	%i7
loop_791:
	taddcc	%g2,	%g1,	%o0
	bcs,a,pn	%icc,	loop_792
	fpsub32s	%f24,	%f16,	%f11
	brlez,a	%g5,	loop_793
	sth	%g7,	[%l7 + 0x50]
loop_792:
	add	%o5,	%o7,	%o4
	tleu	%icc,	0x4
loop_793:
	sir	0x0441
	tne	%icc,	0x7
	tsubcc	%l3,	%o6,	%g4
	ld	[%l7 + 0x4C],	%f11
	bpos,pn	%xcc,	loop_794
	fnegs	%f22,	%f23
	andcc	%l2,	%i0,	%i6
	ta	%xcc,	0x5
loop_794:
	tvc	%xcc,	0x4
	fpack32	%f4,	%f16,	%f22
	fmovsl	%icc,	%f22,	%f12
	st	%f1,	[%l7 + 0x30]
	and	%i4,	0x123E,	%o3
	tgu	%icc,	0x5
	srax	%i2,	%i5,	%l5
	addccc	%o2,	%g3,	%l4
	add	%g6,	%o1,	%l6
	popc	%i1,	%i3
	fbne	%fcc3,	loop_795
	te	%icc,	0x1
	faligndata	%f28,	%f20,	%f8
	movgu	%icc,	%l0,	%l1
loop_795:
	pdist	%f14,	%f30,	%f10
	movneg	%xcc,	%g2,	%i7
	orncc	%o0,	%g5,	%g7
	add	%l7,	0x08,	%l6
	wr	%g0,	0x0c,	%asi
	casxa	[%l6] 0x0c,	%o5,	%g1
	taddcc	%o7,	0x0A35,	%l3
	movre	%o4,	0x159,	%o6
	popc	%l2,	%i0
	fmovscs	%xcc,	%f12,	%f5
	edge16n	%i6,	%g4,	%i4
	wr	%g0,	0x88,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	fmovrsne	%i2,	%f22,	%f1
	fcmps	%fcc0,	%f7,	%f12
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stb	%i5,	[%l7 + 0x41]
	xorcc	%o3,	%l5,	%g3
	fcmpne16	%f26,	%f22,	%o2
	set	0x38, %o7
	ldxa	[%g0 + %o7] 0x4f,	%g6
	subc	%o1,	0x05AD,	%l4
	fbug,a	%fcc1,	loop_796
	movg	%icc,	%l6,	%i3
	prefetch	[%l7 + 0x68],	 0x2
	fornot2s	%f31,	%f22,	%f9
loop_796:
	tgu	%icc,	0x6
	fmovsl	%xcc,	%f31,	%f18
	edge16ln	%l0,	%l1,	%g2
	fmovsn	%xcc,	%f18,	%f12
	edge8	%i1,	%i7,	%o0
	wr	%g0,	0x88,	%asi
	lduha	[%l7 + 0x1E] %asi,	%g5
	movg	%xcc,	%g7,	%o5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x5C, %o1
	sta	%f0,	[%l7 + %o1] 0x88
	fmul8x16au	%f10,	%f23,	%f20
	umul	%g1,	%o7,	%l3
	fmovscs	%xcc,	%f6,	%f21
	sll	%o6,	%o4,	%l2
	fornot2	%f6,	%f28,	%f2
	sdivcc	%i0,	0x03FC,	%g4
	bvc,pt	%icc,	loop_797
	udivcc	%i4,	0x04B5,	%i2
	fbuge	%fcc3,	loop_798
	tleu	%icc,	0x3
loop_797:
	fpadd16	%f14,	%f24,	%f26
	tcs	%xcc,	0x5
loop_798:
	brlz,a	%i5,	loop_799
	fbl,a	%fcc0,	loop_800
	andn	%i6,	%o3,	%l5
	movcc	%xcc,	%g3,	%o2
loop_799:
	move	%icc,	%g6,	%l4
loop_800:
	tn	%xcc,	0x0
	bn,a	loop_801
	brnz	%l6,	loop_802
	array32	%i3,	%l0,	%l1
	fbn,a	%fcc0,	loop_803
loop_801:
	nop
	set	0x7D, %l3
	ldub	[%l7 + %l3],	%g2
loop_802:
	fmuld8sux16	%f13,	%f22,	%f26
	popc	0x12D2,	%i1
loop_803:
	andn	%i7,	0x0422,	%o1
	movle	%xcc,	%o0,	%g7
	edge8l	%o5,	%g1,	%g5
	fbuge,a	%fcc1,	loop_804
	fone	%f6
	array32	%o7,	%o6,	%l3
	tl	%icc,	0x1
loop_804:
	brgez,a	%l2,	loop_805
	ldsw	[%l7 + 0x18],	%i0
	tsubcc	%g4,	%i4,	%i2
	edge8l	%o4,	%i6,	%o3
loop_805:
	fmovdl	%icc,	%f10,	%f10
	tg	%xcc,	0x1
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x32] %asi,	%l5
	edge8ln	%g3,	%o2,	%g6
	addccc	%l4,	0x12DD,	%i5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	or	%i3,	%l0,	%l6
	set	0x2D, %g3
	ldsba	[%l7 + %g3] 0x10,	%g2
	set	0x18, %i5
	stda	%i0,	[%l7 + %i5] 0x18
	smulcc	%l1,	%o1,	%o0
	ldsb	[%l7 + 0x0F],	%g7
	tg	%xcc,	0x5
	fbul,a	%fcc1,	loop_806
	alignaddrl	%i7,	%o5,	%g1
	sir	0x1D1D
	ble,a	%xcc,	loop_807
loop_806:
	xnor	%o7,	0x0CC4,	%g5
	subcc	%o6,	0x098C,	%l2
	movrne	%i0,	%l3,	%i4
loop_807:
	fbge	%fcc0,	loop_808
	brlz	%g4,	loop_809
	bcs,pn	%xcc,	loop_810
	smul	%i2,	%o4,	%i6
loop_808:
	fpack16	%f8,	%f8
loop_809:
	tl	%icc,	0x7
loop_810:
	umul	%l5,	%g3,	%o2
	tle	%icc,	0x1
	ldub	[%l7 + 0x4D],	%o3
	fornot1	%f12,	%f16,	%f20
	set	0x41, %g1
	ldsba	[%l7 + %g1] 0x88,	%g6
	fornot2s	%f1,	%f3,	%f2
	fand	%f20,	%f4,	%f18
	set	0x1C, %l4
	lda	[%l7 + %l4] 0x14,	%f0
	edge8n	%i5,	%i3,	%l4
	movvc	%xcc,	%l6,	%g2
	fbuge,a	%fcc0,	loop_811
	srax	%i1,	%l1,	%o1
	movvs	%icc,	%o0,	%l0
	brz	%i7,	loop_812
loop_811:
	fmovde	%xcc,	%f22,	%f4
	umulcc	%g7,	0x1A59,	%g1
	fmovsa	%icc,	%f0,	%f26
loop_812:
	sir	0x04B3
	tg	%xcc,	0x5
	fnors	%f25,	%f20,	%f6
	ldd	[%l7 + 0x10],	%o6
	sdivx	%o5,	0x1E20,	%g5
	edge8n	%o6,	%l2,	%l3
	nop
	setx	loop_813,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movge	%xcc,	%i0,	%i4
	movcs	%xcc,	%i2,	%g4
	fpsub32s	%f19,	%f27,	%f1
loop_813:
	tgu	%icc,	0x1
	swap	[%l7 + 0x14],	%o4
	fbn	%fcc2,	loop_814
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32	%i6,	%l5,	%g3
	nop
	setx	loop_815,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_814:
	fmovdl	%icc,	%f11,	%f15
	movneg	%xcc,	%o2,	%g6
	bvs,a,pn	%icc,	loop_816
loop_815:
	fmovsge	%xcc,	%f16,	%f2
	tsubcc	%i5,	%i3,	%o3
	fmovsge	%xcc,	%f18,	%f14
loop_816:
	fble	%fcc3,	loop_817
	brgez,a	%l4,	loop_818
	ldsh	[%l7 + 0x26],	%l6
	fmovrde	%g2,	%f2,	%f2
loop_817:
	movneg	%xcc,	%i1,	%o1
loop_818:
	subccc	%l1,	0x01C2,	%o0
	fnot2	%f0,	%f14
	set	0x0E, %i0
	ldsha	[%l7 + %i0] 0x80,	%l0
	fzero	%f30
	fandnot1s	%f31,	%f20,	%f15
	fmovrslz	%i7,	%f20,	%f19
	tsubcc	%g1,	0x15D4,	%o7
	wr	%g0,	0x81,	%asi
	ldda	[%l7 + 0x70] %asi,	%g6
	tsubcc	%o5,	0x0B11,	%o6
	add	%g5,	0x1A44,	%l3
	movne	%xcc,	%i0,	%i4
	edge32	%i2,	%g4,	%l2
	fmovsleu	%icc,	%f5,	%f10
	tvs	%xcc,	0x4
	ld	[%l7 + 0x34],	%f4
	edge16n	%o4,	%l5,	%i6
	alignaddr	%o2,	%g6,	%i5
	edge8	%g3,	%i3,	%o3
	sdiv	%l4,	0x0BED,	%g2
	fpack16	%f28,	%f27
	movle	%icc,	%l6,	%i1
	bn,a	%xcc,	loop_819
	fmovde	%icc,	%f9,	%f22
	brz	%o1,	loop_820
	srlx	%o0,	0x02,	%l1
loop_819:
	tcs	%xcc,	0x5
	array16	%l0,	%g1,	%i7
loop_820:
	fbue	%fcc2,	loop_821
	movre	%g7,	0x0BF,	%o7
	array8	%o6,	%g5,	%o5
	and	%i0,	%l3,	%i4
loop_821:
	edge16n	%i2,	%g4,	%l2
	edge16l	%l5,	%o4,	%i6
	movvc	%icc,	%g6,	%o2
	ldsw	[%l7 + 0x5C],	%g3
	movpos	%xcc,	%i3,	%o3
	fmovspos	%icc,	%f16,	%f0
	movrne	%i5,	0x2A1,	%l4
	fmovs	%f8,	%f20
	set	0x40, %i4
	ldda	[%l7 + %i4] 0x11,	%f16
	edge8n	%g2,	%i1,	%l6
	movrgez	%o1,	%l1,	%o0
	movcs	%icc,	%g1,	%l0
	fsrc1s	%f23,	%f16
	xorcc	%g7,	%i7,	%o6
	addccc	%g5,	0x0A50,	%o5
	movneg	%icc,	%i0,	%o7
	movne	%xcc,	%i4,	%i2
	set	0x18, %o4
	lduwa	[%l7 + %o4] 0x04,	%l3
	fpack32	%f20,	%f6,	%f8
	movrlz	%l2,	%l5,	%o4
	taddcc	%g4,	0x175D,	%g6
	fpadd16	%f0,	%f30,	%f28
	bneg,a	%icc,	loop_822
	edge16	%i6,	%g3,	%o2
	bleu,pt	%icc,	loop_823
	xnorcc	%o3,	0x06EA,	%i3
loop_822:
	brgez	%i5,	loop_824
	subccc	%g2,	0x178E,	%l4
loop_823:
	bcs	loop_825
	fbge,a	%fcc1,	loop_826
loop_824:
	stx	%i1,	[%l7 + 0x40]
	fba	%fcc3,	loop_827
loop_825:
	sub	%o1,	0x036B,	%l1
loop_826:
	edge16l	%l6,	%g1,	%o0
	movcs	%xcc,	%l0,	%i7
loop_827:
	nop
	set	0x10, %g6
	stba	%o6,	[%l7 + %g6] 0x23
	membar	#Sync
	srlx	%g5,	%g7,	%i0
	movrgz	%o7,	0x1CE,	%i4
	set	0x8, %o0
	ldxa	[%g0 + %o0] 0x4f,	%o5
	movrlz	%l3,	0x201,	%i2
	andn	%l5,	%o4,	%l2
	movpos	%icc,	%g4,	%g6
	movgu	%icc,	%i6,	%o2
	wr	%g0,	0x2f,	%asi
	ldda	[%l7 + 0x60] %asi,	%o2
	sll	%i3,	%g3,	%g2
	bcc,pn	%xcc,	loop_828
	fsrc2s	%f13,	%f26
	std	%f0,	[%l7 + 0x48]
	flush	%l7 + 0x18
loop_828:
	movrgez	%i5,	%l4,	%o1
	sra	%l1,	%i1,	%l6
	edge8ln	%o0,	%g1,	%l0
	tg	%xcc,	0x6
	fors	%f27,	%f4,	%f25
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	swap	[%l7 + 0x60],	%i7
	fbu	%fcc0,	loop_829
	bleu,a	loop_830
	fmovdpos	%xcc,	%f20,	%f26
	taddcctv	%g5,	0x1668,	%g7
loop_829:
	swap	[%l7 + 0x18],	%i0
loop_830:
	movn	%icc,	%o6,	%i4
	taddcctv	%o7,	%l3,	%i2
	flush	%l7 + 0x54
	edge32l	%l5,	%o4,	%o5
	xnorcc	%l2,	%g4,	%g6
	movvs	%xcc,	%i6,	%o2
	fcmpgt16	%f8,	%f18,	%i3
	sub	%g3,	%o3,	%g2
	tleu	%xcc,	0x0
	wr	%g0,	0x11,	%asi
	ldsha	[%l7 + 0x36] %asi,	%l4
	movvs	%icc,	%o1,	%l1
	movre	%i5,	0x3F2,	%i1
	fmovrsne	%o0,	%f30,	%f31
	movge	%icc,	%l6,	%g1
	mova	%xcc,	%l0,	%g5
	sra	%g7,	0x03,	%i7
	movl	%icc,	%o6,	%i0
	alignaddrl	%o7,	%l3,	%i2
	swap	[%l7 + 0x3C],	%i4
	sethi	0x10D2,	%l5
	fmovrdlez	%o5,	%f6,	%f26
	udivcc	%l2,	0x12C2,	%o4
	ldsb	[%l7 + 0x3E],	%g4
	addcc	%i6,	%o2,	%g6
	tcs	%xcc,	0x2
	tl	%xcc,	0x1
	fmul8ulx16	%f4,	%f26,	%f4
	fxor	%f24,	%f20,	%f10
	fpsub32s	%f6,	%f24,	%f8
	bcs	%xcc,	loop_831
	tcc	%icc,	0x2
	edge8n	%g3,	%o3,	%g2
	addcc	%i3,	0x1A8F,	%l4
loop_831:
	movrlz	%o1,	0x10C,	%i5
	std	%f8,	[%l7 + 0x38]
	fpadd32s	%f26,	%f28,	%f17
	fpsub16s	%f14,	%f3,	%f29
	ta	%icc,	0x5
	fors	%f0,	%f6,	%f19
	add	%l7,	0x70,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%l1,	%i1
	ldsb	[%l7 + 0x40],	%o0
	fpadd32	%f0,	%f0,	%f14
	fbe,a	%fcc3,	loop_832
	and	%g1,	%l0,	%l6
	ta	%icc,	0x3
	udivx	%g5,	0x079C,	%i7
loop_832:
	fbl,a	%fcc3,	loop_833
	udivx	%g7,	0x05F5,	%i0
	set	0x50, %g2
	ldxa	[%l7 + %g2] 0x89,	%o6
loop_833:
	fornot1	%f6,	%f12,	%f14
	nop
	setx	loop_834,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	ldd	[%l7 + 0x60],	%l2
	tg	%xcc,	0x5
	fsrc2	%f18,	%f6
loop_834:
	mova	%xcc,	%o7,	%i2
	fsrc2s	%f22,	%f21
	fmovsgu	%icc,	%f5,	%f30
	brnz,a	%i4,	loop_835
	subccc	%o5,	0x1062,	%l5
	call	loop_836
	movge	%xcc,	%l2,	%g4
loop_835:
	sdivx	%o4,	0x00FD,	%o2
	fmul8ulx16	%f18,	%f22,	%f6
loop_836:
	fmovsg	%xcc,	%f0,	%f6
	stx	%i6,	[%l7 + 0x78]
	srlx	%g3,	%g6,	%g2
	be	%xcc,	loop_837
	movle	%xcc,	%o3,	%l4
	movvs	%icc,	%o1,	%i5
	fmovsn	%icc,	%f18,	%f15
loop_837:
	siam	0x4
	xorcc	%i3,	%i1,	%l1
	movleu	%icc,	%o0,	%l0
	fpackfix	%f4,	%f4
	movrgz	%g1,	%g5,	%l6
	fmovrdgez	%i7,	%f8,	%f0
	tsubcctv	%g7,	0x12CC,	%o6
	fmovsn	%xcc,	%f19,	%f25
	bshuffle	%f6,	%f2,	%f24
	edge16	%l3,	%o7,	%i0
	fmovsa	%icc,	%f22,	%f24
	sra	%i2,	%i4,	%l5
	tcc	%xcc,	0x4
	smulcc	%l2,	%o5,	%o4
	tle	%icc,	0x2
	fmuld8sux16	%f13,	%f14,	%f22
	set	0x108, %i2
	ldxa	[%g0 + %i2] 0x21,	%g4
	add	%i6,	0x0638,	%o2
	fmovsgu	%icc,	%f13,	%f1
	fones	%f26
	std	%g2,	[%l7 + 0x30]
	andncc	%g6,	%g2,	%l4
	fbne	%fcc3,	loop_838
	fmovdleu	%icc,	%f28,	%f16
	tsubcctv	%o3,	%o1,	%i5
	fbule	%fcc1,	loop_839
loop_838:
	swap	[%l7 + 0x20],	%i1
	tcs	%icc,	0x4
	set	0x3B, %o3
	lduba	[%l7 + %o3] 0x04,	%i3
loop_839:
	std	%f28,	[%l7 + 0x20]
	sllx	%o0,	%l1,	%l0
	popc	%g1,	%g5
	fbne	%fcc0,	loop_840
	fmovsg	%icc,	%f27,	%f29
	movrlz	%i7,	0x271,	%g7
	set	0x40, %g5
	ldda	[%l7 + %g5] 0x15,	%f0
loop_840:
	sdivx	%o6,	0x0F5D,	%l6
	fandnot2s	%f3,	%f22,	%f23
	bg,a,pn	%icc,	loop_841
	std	%f16,	[%l7 + 0x78]
	tg	%xcc,	0x6
	set	0x54, %l5
	stwa	%l3,	[%l7 + %l5] 0x23
	membar	#Sync
loop_841:
	movge	%xcc,	%o7,	%i2
	tne	%xcc,	0x2
	tl	%xcc,	0x4
	bvc,a	%icc,	loop_842
	xnor	%i0,	%i4,	%l5
	andn	%l2,	0x1794,	%o4
	smulcc	%o5,	%g4,	%o2
loop_842:
	nop
	set	0x40, %l0
	stxa	%i6,	[%l7 + %l0] 0x2f
	membar	#Sync
	movg	%icc,	%g3,	%g6
	wr	%g0,	0x81,	%asi
	lda	[%l7 + 0x54] %asi,	%f1
	andncc	%g2,	%l4,	%o1
	alignaddrl	%o3,	%i5,	%i3
	tvc	%xcc,	0x6
	sethi	0x0004,	%i1
	add	%l7,	0x10,	%l6
	wr	%g0,	0x19,	%asi
	lda	[%l6] %asi,	%o0
	casa	[%l6] 0x19,	%o0,	%l1
	tsubcc	%l0,	%g5,	%g1
	tcc	%icc,	0x5
	brgez,a	%i7,	loop_843
	sethi	0x021F,	%o6
	fcmped	%fcc0,	%f10,	%f18
	st	%f16,	[%l7 + 0x10]
loop_843:
	nop
	wr	%g0,	0xeb,	%asi
	stha	%l6,	[%l7 + 0x1A] %asi
	membar	#Sync
	set	0x28, %i7
	stxa	%g7,	[%l7 + %i7] 0x22
	membar	#Sync
	set	0x18, %l1
	lda	[%l7 + %l1] 0x0c,	%f22
	fnot1	%f8,	%f2
	edge16	%o7,	%l3,	%i0
	movre	%i4,	%l5,	%l2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movneg	%icc,	%i2,	%o4
	orcc	%g4,	%o2,	%i6
	fand	%f2,	%f2,	%f12
	fnegd	%f26,	%f18
	pdist	%f8,	%f2,	%f26
	bne,pn	%xcc,	loop_844
	srl	%g3,	0x1A,	%g6
	srl	%o5,	%l4,	%g2
	movn	%xcc,	%o3,	%i5
loop_844:
	movcc	%xcc,	%o1,	%i3
	udiv	%o0,	0x1E56,	%i1
	brlez,a	%l0,	loop_845
	sethi	0x1A13,	%l1
	fbul,a	%fcc0,	loop_846
	movcc	%xcc,	%g5,	%g1
loop_845:
	movne	%icc,	%o6,	%l6
	srl	%g7,	%i7,	%o7
loop_846:
	fmovrde	%i0,	%f4,	%f14
	movrgz	%i4,	%l3,	%l5
	edge8l	%l2,	%o4,	%i2
	umul	%g4,	%o2,	%i6
	andcc	%g3,	%o5,	%g6
	udivcc	%l4,	0x13BE,	%g2
	bg,pt	%xcc,	loop_847
	edge16n	%i5,	%o1,	%o3
	bshuffle	%f26,	%f2,	%f26
	brlez	%o0,	loop_848
loop_847:
	movrgz	%i1,	%l0,	%i3
	addcc	%l1,	%g1,	%g5
	bpos,pn	%icc,	loop_849
loop_848:
	fmovrdgez	%o6,	%f4,	%f24
	brgez,a	%l6,	loop_850
	edge32	%g7,	%i7,	%o7
loop_849:
	nop
	wr	%g0,	0x80,	%asi
	swapa	[%l7 + 0x48] %asi,	%i4
loop_850:
	stbar
	edge8	%i0,	%l5,	%l3
	subcc	%o4,	%l2,	%i2
	fmovrse	%o2,	%f23,	%f8
	set	0x70, %i1
	ldda	[%l7 + %i1] 0x2c,	%g4
	edge16ln	%g3,	%o5,	%i6
	xor	%l4,	0x0151,	%g6
	movgu	%icc,	%i5,	%o1
	edge16l	%g2,	%o0,	%i1
	addc	%l0,	0x1E8B,	%o3
	prefetch	[%l7 + 0x20],	 0x3
	bcc	%icc,	loop_851
	taddcc	%i3,	0x1BB2,	%g1
	sdivx	%l1,	0x0AF0,	%g5
	addc	%l6,	%o6,	%g7
loop_851:
	fbn	%fcc2,	loop_852
	brz,a	%i7,	loop_853
	sdivx	%o7,	0x0B1F,	%i0
	lduh	[%l7 + 0x4A],	%i4
loop_852:
	fpadd16	%f10,	%f30,	%f12
loop_853:
	taddcctv	%l5,	0x0829,	%o4
	fmovdl	%xcc,	%f20,	%f31
	edge16	%l3,	%i2,	%l2
	edge32	%o2,	%g4,	%g3
	fmovdpos	%xcc,	%f15,	%f2
	fbg	%fcc1,	loop_854
	sllx	%o5,	0x14,	%l4
	fnors	%f12,	%f30,	%f29
	xor	%g6,	%i5,	%o1
loop_854:
	fmovrslez	%g2,	%f15,	%f8
	sub	%i6,	%o0,	%l0
	stx	%o3,	[%l7 + 0x20]
	movcs	%xcc,	%i1,	%i3
	bl,a	%icc,	loop_855
	ldsb	[%l7 + 0x4F],	%g1
	taddcctv	%l1,	0x0F11,	%g5
	fbu	%fcc1,	loop_856
loop_855:
	fmovsle	%xcc,	%f26,	%f26
	movrlez	%o6,	%g7,	%i7
	array8	%o7,	%i0,	%l6
loop_856:
	tn	%xcc,	0x0
	and	%i4,	%o4,	%l5
	fones	%f27
	tg	%xcc,	0x6
	sra	%l3,	%l2,	%o2
	movgu	%xcc,	%g4,	%g3
	fornot2	%f20,	%f18,	%f0
	sth	%o5,	[%l7 + 0x3E]
	nop
	set	0x48, %g4
	prefetch	[%l7 + %g4],	 0x3
	movge	%xcc,	%i2,	%g6
	mulscc	%l4,	0x0F0B,	%i5
	be,a	loop_857
	edge8n	%o1,	%i6,	%o0
	tge	%icc,	0x7
	sth	%g2,	[%l7 + 0x7C]
loop_857:
	sdivx	%o3,	0x1FAF,	%l0
	fbl,a	%fcc2,	loop_858
	smulcc	%i1,	%i3,	%l1
	edge8l	%g1,	%g5,	%g7
	udivx	%o6,	0x0C6E,	%o7
loop_858:
	subcc	%i7,	0x159A,	%i0
	te	%xcc,	0x2
	fmovdcs	%xcc,	%f13,	%f14
	movrgez	%l6,	%o4,	%i4
	fzero	%f14
	tne	%icc,	0x7
	fbule,a	%fcc2,	loop_859
	bg,a	loop_860
	ta	%xcc,	0x2
	sdivcc	%l5,	0x0D8D,	%l2
loop_859:
	movre	%l3,	%g4,	%o2
loop_860:
	orncc	%g3,	%i2,	%o5
	xor	%l4,	%i5,	%o1
	bpos	loop_861
	edge32	%i6,	%g6,	%g2
	fcmple16	%f2,	%f6,	%o3
	fbo	%fcc1,	loop_862
loop_861:
	fxnor	%f12,	%f0,	%f12
	fmovdgu	%xcc,	%f12,	%f11
	movvc	%xcc,	%o0,	%i1
loop_862:
	movvs	%xcc,	%i3,	%l1
	fbe,a	%fcc2,	loop_863
	st	%f29,	[%l7 + 0x1C]
	bn	loop_864
	movle	%xcc,	%g1,	%l0
loop_863:
	fxors	%f6,	%f30,	%f29
	fmovda	%icc,	%f25,	%f27
loop_864:
	nop
	setx	loop_865,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fandnot2	%f8,	%f8,	%f4
	edge32n	%g5,	%g7,	%o7
	sll	%i7,	%i0,	%o6
loop_865:
	edge16ln	%l6,	%i4,	%l5
	edge8	%l2,	%l3,	%o4
	fbn,a	%fcc0,	loop_866
	fxor	%f22,	%f30,	%f16
	fmuld8sux16	%f19,	%f14,	%f8
	tneg	%xcc,	0x1
loop_866:
	sdivcc	%o2,	0x0AE3,	%g4
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x6C] %asi,	%i2
	set	0x70, %o6
	prefetcha	[%l7 + %o6] 0x18,	 0x1
	popc	%g3,	%l4
	fmovspos	%icc,	%f16,	%f13
	andcc	%i5,	%o1,	%i6
	std	%g2,	[%l7 + 0x78]
	set	0x0E, %i6
	stha	%g6,	[%l7 + %i6] 0x04
	fand	%f26,	%f20,	%f2
	orncc	%o0,	0x0A35,	%o3
	movvc	%icc,	%i1,	%l1
	sllx	%g1,	%l0,	%g5
	orn	%i3,	%o7,	%g7
	fnot2s	%f21,	%f6
	movn	%xcc,	%i7,	%o6
	udivx	%i0,	0x1489,	%i4
	edge16n	%l6,	%l5,	%l3
	fbul,a	%fcc1,	loop_867
	tneg	%icc,	0x6
	stx	%o4,	[%l7 + 0x40]
	fbl	%fcc3,	loop_868
loop_867:
	tcs	%xcc,	0x7
	fmovrdgz	%l2,	%f8,	%f26
	pdist	%f22,	%f22,	%f2
loop_868:
	movrlez	%o2,	%g4,	%i2
	edge16n	%o5,	%l4,	%i5
	edge32n	%g3,	%o1,	%i6
	smul	%g6,	%o0,	%o3
	srax	%g2,	%i1,	%g1
	mova	%xcc,	%l1,	%l0
	sra	%i3,	0x11,	%o7
	tpos	%xcc,	0x6
	sub	%g5,	0x1807,	%i7
	fbue,a	%fcc3,	loop_869
	lduw	[%l7 + 0x70],	%g7
	bge,a	%icc,	loop_870
	and	%o6,	0x1390,	%i4
loop_869:
	movpos	%icc,	%l6,	%l5
	fmovrdgez	%l3,	%f28,	%f8
loop_870:
	sllx	%o4,	0x02,	%i0
	tvc	%xcc,	0x7
	movpos	%xcc,	%o2,	%l2
	edge16ln	%g4,	%i2,	%l4
	ldx	[%l7 + 0x68],	%i5
	tgu	%xcc,	0x7
	orcc	%o5,	0x097F,	%o1
	fbug	%fcc3,	loop_871
	edge32	%g3,	%i6,	%g6
	fcmpne32	%f6,	%f2,	%o0
	movre	%o3,	%g2,	%i1
loop_871:
	movleu	%icc,	%l1,	%l0
	fcmpd	%fcc2,	%f16,	%f2
	udivcc	%i3,	0x0538,	%g1
	bne,pn	%xcc,	loop_872
	sll	%g5,	0x1E,	%o7
	fmovrslez	%i7,	%f28,	%f0
	fba	%fcc1,	loop_873
loop_872:
	movrlz	%o6,	%g7,	%i4
	stb	%l5,	[%l7 + 0x60]
	andn	%l6,	0x1547,	%o4
loop_873:
	orncc	%l3,	%o2,	%l2
	xnor	%g4,	0x1FBE,	%i0
	set	0x60, %i3
	lda	[%l7 + %i3] 0x14,	%f26
	edge32l	%l4,	%i2,	%i5
	fands	%f26,	%f0,	%f26
	tneg	%icc,	0x5
	tleu	%icc,	0x3
	fbe	%fcc0,	loop_874
	tg	%icc,	0x4
	ta	%xcc,	0x3
	flush	%l7 + 0x68
loop_874:
	fcmped	%fcc2,	%f10,	%f22
	fble,a	%fcc3,	loop_875
	tneg	%xcc,	0x7
	tge	%xcc,	0x2
	brlez,a	%o5,	loop_876
loop_875:
	fmul8x16	%f31,	%f4,	%f30
	smul	%o1,	0x1AE3,	%i6
	movl	%icc,	%g6,	%g3
loop_876:
	sdivcc	%o3,	0x116C,	%g2
	mulx	%o0,	%i1,	%l0
	fmovsvs	%xcc,	%f17,	%f15
	ba,pn	%icc,	loop_877
	addcc	%l1,	0x08B0,	%g1
	fmovdne	%icc,	%f21,	%f11
	wr	%g0,	0x81,	%asi
	lduha	[%l7 + 0x1E] %asi,	%g5
loop_877:
	fmovdne	%xcc,	%f16,	%f31
	movrgez	%i3,	%i7,	%o6
	tsubcctv	%o7,	%g7,	%l5
	add	%l6,	%o4,	%l3
	fmovsgu	%icc,	%f13,	%f25
	taddcc	%o2,	0x0560,	%l2
	ble,pt	%icc,	loop_878
	fbg	%fcc1,	loop_879
	udivcc	%g4,	0x0096,	%i0
	mova	%xcc,	%l4,	%i2
loop_878:
	andcc	%i5,	0x1CB2,	%o5
loop_879:
	mulscc	%o1,	0x0B16,	%i6
	udiv	%i4,	0x00B0,	%g3
	addc	%g6,	0x0D55,	%o3
	smul	%g2,	0x0C12,	%o0
	fsrc1s	%f23,	%f2
	movle	%icc,	%i1,	%l0
	fnot1s	%f5,	%f4
	popc	%l1,	%g1
	tgu	%xcc,	0x1
	fbo	%fcc2,	loop_880
	sth	%g5,	[%l7 + 0x30]
	movge	%xcc,	%i7,	%i3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_880:
	fmovsvc	%icc,	%f20,	%f8
	brgez	%o7,	loop_881
	brgz,a	%g7,	loop_882
	ba,a	%xcc,	loop_883
	ldsb	[%l7 + 0x73],	%o6
loop_881:
	bvs	%icc,	loop_884
loop_882:
	movn	%xcc,	%l6,	%o4
loop_883:
	movg	%icc,	%l3,	%o2
	andncc	%l5,	%g4,	%i0
loop_884:
	movg	%icc,	%l2,	%l4
	tg	%icc,	0x1
	fmovdneg	%xcc,	%f10,	%f8
	addcc	%i2,	%i5,	%o5
	ldsh	[%l7 + 0x3E],	%o1
	fbule	%fcc1,	loop_885
	fbule,a	%fcc2,	loop_886
	fmovs	%f27,	%f1
	addc	%i4,	0x1A2B,	%i6
loop_885:
	be	%xcc,	loop_887
loop_886:
	subcc	%g6,	0x1200,	%g3
	alignaddr	%g2,	%o0,	%o3
	umulcc	%i1,	%l0,	%g1
loop_887:
	fbne,a	%fcc0,	loop_888
	movneg	%icc,	%l1,	%i7
	movgu	%xcc,	%i3,	%g5
	edge32l	%o7,	%o6,	%g7
loop_888:
	nop
	wr	%g0,	0x04,	%asi
	ldstuba	[%l7 + 0x47] %asi,	%l6
	movleu	%icc,	%l3,	%o2
	movvc	%xcc,	%o4,	%l5
	edge8l	%i0,	%g4,	%l2
	movrgez	%l4,	%i5,	%i2
	fone	%f14
	fcmpne16	%f30,	%f18,	%o5
	swap	[%l7 + 0x28],	%o1
	wr	%g0,	0x0c,	%asi
	lduha	[%l7 + 0x20] %asi,	%i4
	subcc	%i6,	0x1319,	%g6
	fbne,a	%fcc1,	loop_889
	srax	%g2,	%g3,	%o3
	edge32l	%i1,	%l0,	%o0
	pdist	%f26,	%f0,	%f22
loop_889:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdivcc	%g1,	0x1D2B,	%l1
	sll	%i3,	%i7,	%o7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bne,a	loop_890
	movgu	%icc,	%g5,	%g7
	fmovrslz	%l6,	%f26,	%f27
	wr	%g0,	0x88,	%asi
	stxa	%l3,	[%l7 + 0x68] %asi
loop_890:
	std	%f22,	[%l7 + 0x68]
	tsubcctv	%o6,	0x029A,	%o2
	te	%icc,	0x7
	ld	[%l7 + 0x34],	%f6
	movle	%xcc,	%l5,	%i0
	fmovsne	%xcc,	%f19,	%f22
	taddcc	%o4,	%l2,	%l4
	umulcc	%i5,	%g4,	%i2
	fpadd16	%f20,	%f20,	%f18
	fmovspos	%xcc,	%f24,	%f10
	fandnot1s	%f19,	%f29,	%f1
	fbo	%fcc1,	loop_891
	movge	%icc,	%o1,	%i4
	tn	%icc,	0x5
	fmovrsgz	%i6,	%f17,	%f30
loop_891:
	udivx	%o5,	0x086A,	%g2
	te	%xcc,	0x5
	tne	%xcc,	0x0
	fandnot2	%f16,	%f22,	%f16
	fmovrsgz	%g6,	%f22,	%f7
	udivcc	%o3,	0x16FE,	%i1
	fbue	%fcc0,	loop_892
	udivcc	%l0,	0x1F53,	%g3
	fmovse	%icc,	%f30,	%f1
	fbug	%fcc3,	loop_893
loop_892:
	tge	%xcc,	0x1
	fmovdcs	%xcc,	%f29,	%f9
	edge32	%o0,	%g1,	%i3
loop_893:
	array16	%l1,	%i7,	%g5
	movrne	%o7,	%g7,	%l3
	taddcctv	%l6,	0x0B02,	%o2
	edge16n	%l5,	%o6,	%o4
	andcc	%l2,	0x0184,	%i0
	edge16n	%l4,	%g4,	%i5
	fpackfix	%f14,	%f30
	fnands	%f6,	%f1,	%f11
	brgez	%o1,	loop_894
	bg,a	loop_895
	fbuge,a	%fcc1,	loop_896
	bvc,pn	%xcc,	loop_897
loop_894:
	movrgez	%i2,	%i4,	%i6
loop_895:
	array8	%g2,	%o5,	%g6
loop_896:
	movrgz	%o3,	0x2DC,	%l0
loop_897:
	fmovsa	%xcc,	%f28,	%f19
	tn	%icc,	0x1
	movvs	%icc,	%g3,	%i1
	fmovsneg	%icc,	%f25,	%f4
	sethi	0x1652,	%g1
	wr	%g0,	0x81,	%asi
	lduba	[%l7 + 0x29] %asi,	%o0
	fxnor	%f6,	%f30,	%f14
	movpos	%xcc,	%l1,	%i7
	orncc	%g5,	%i3,	%o7
	sir	0x0F80
	edge32ln	%l3,	%g7,	%o2
	fandnot2	%f28,	%f16,	%f4
	or	%l5,	%o6,	%o4
	array16	%l6,	%l2,	%l4
	andncc	%i0,	%g4,	%o1
	udivcc	%i5,	0x13C8,	%i4
	sra	%i2,	%g2,	%i6
	subcc	%o5,	%o3,	%g6
	fmul8x16	%f10,	%f28,	%f30
	tl	%xcc,	0x3
	tsubcctv	%l0,	%i1,	%g3
	fbne	%fcc2,	loop_898
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsneg	%icc,	%f7,	%f18
	smul	%o0,	%g1,	%l1
loop_898:
	movn	%icc,	%i7,	%i3
	movre	%g5,	0x136,	%o7
	wr	%g0,	0x18,	%asi
	ldsha	[%l7 + 0x6A] %asi,	%g7
	tl	%icc,	0x3
	andcc	%l3,	0x10CE,	%o2
	edge16n	%o6,	%o4,	%l6
	movrgez	%l2,	0x055,	%l5
	xnorcc	%l4,	0x1577,	%i0
	movvs	%icc,	%o1,	%g4
	orncc	%i4,	0x1369,	%i5
	udivx	%g2,	0x0F03,	%i6
	tcc	%xcc,	0x7
	fmovdl	%icc,	%f15,	%f2
	ldd	[%l7 + 0x20],	%i2
	move	%xcc,	%o3,	%g6
	nop
	setx loop_899, %l0, %l1
	jmpl %l1, %o5
	fmovdgu	%icc,	%f26,	%f11
	fbg	%fcc0,	loop_900
	move	%icc,	%i1,	%g3
loop_899:
	bgu	%xcc,	loop_901
	fmovdleu	%icc,	%f15,	%f4
loop_900:
	or	%o0,	%g1,	%l0
	movrlz	%i7,	0x2E1,	%l1
loop_901:
	andn	%g5,	0x0010,	%o7
	movge	%xcc,	%i3,	%g7
	fpsub16	%f20,	%f22,	%f10
	fandnot1s	%f24,	%f4,	%f16
	movvc	%icc,	%l3,	%o6
	wr	%g0,	0x04,	%asi
	stda	%o2,	[%l7 + 0x38] %asi
	tgu	%icc,	0x1
	array16	%o4,	%l2,	%l6
	movl	%xcc,	%l4,	%l5
	bge,pt	%xcc,	loop_902
	fandnot2s	%f14,	%f29,	%f1
	taddcctv	%i0,	0x0BBE,	%g4
	fmovdpos	%xcc,	%f19,	%f28
loop_902:
	bvc,a	loop_903
	movre	%o1,	0x280,	%i5
	udivx	%i4,	0x1C94,	%g2
	sllx	%i6,	%i2,	%o3
loop_903:
	orncc	%g6,	%o5,	%i1
	lduw	[%l7 + 0x68],	%o0
	tneg	%xcc,	0x2
	sub	%g3,	%g1,	%l0
	bvc,a	loop_904
	std	%l0,	[%l7 + 0x40]
	edge32n	%i7,	%o7,	%g5
	fmovscs	%xcc,	%f4,	%f13
loop_904:
	orcc	%g7,	%l3,	%i3
	orncc	%o2,	0x0C29,	%o6
	sdivcc	%o4,	0x0C81,	%l6
	ldd	[%l7 + 0x30],	%f14
	tvc	%icc,	0x6
	fcmped	%fcc0,	%f4,	%f0
	fnor	%f8,	%f8,	%f16
	movrlez	%l4,	0x26A,	%l2
	taddcc	%i0,	%g4,	%l5
	bcc,pt	%icc,	loop_905
	mulx	%i5,	%i4,	%o1
	bvs,a,pn	%icc,	loop_906
	fornot2	%f26,	%f20,	%f28
loop_905:
	and	%g2,	0x018F,	%i2
	ldd	[%l7 + 0x58],	%f24
loop_906:
	subcc	%o3,	%i6,	%g6
	udivcc	%i1,	0x027D,	%o0
	movn	%icc,	%g3,	%o5
	fble,a	%fcc1,	loop_907
	bl,a,pn	%icc,	loop_908
	stb	%g1,	[%l7 + 0x1B]
	swap	[%l7 + 0x54],	%l0
loop_907:
	edge16n	%i7,	%o7,	%g5
loop_908:
	tne	%icc,	0x7
	edge8	%g7,	%l3,	%l1
	fbn	%fcc2,	loop_909
	nop
	setx	loop_910,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	mulscc	%o2,	0x0FBC,	%i3
	movrlz	%o6,	0x2F6,	%l6
loop_909:
	tneg	%icc,	0x0
loop_910:
	edge8ln	%l4,	%l2,	%i0
	srax	%g4,	0x10,	%o4
	movvs	%icc,	%i5,	%l5
	sdivx	%i4,	0x1E5D,	%g2
	subcc	%i2,	%o1,	%i6
	ba,a,pn	%xcc,	loop_911
	st	%f0,	[%l7 + 0x68]
	edge16	%g6,	%o3,	%i1
	tg	%xcc,	0x1
loop_911:
	edge8ln	%o0,	%g3,	%g1
	set	0x30, %o2
	ldxa	[%g0 + %o2] 0x50,	%o5
	or	%l0,	%o7,	%i7
	movle	%xcc,	%g7,	%g5
	sdivcc	%l3,	0x0DB0,	%o2
	tge	%xcc,	0x4
	taddcctv	%i3,	%o6,	%l6
	fmovdne	%icc,	%f8,	%f24
	fble,a	%fcc2,	loop_912
	andn	%l4,	0x0B31,	%l1
	fmul8x16al	%f28,	%f10,	%f14
	set	0x1D, %l2
	lduba	[%l7 + %l2] 0x11,	%l2
loop_912:
	fabsd	%f14,	%f24
	ldx	[%l7 + 0x48],	%i0
	ldsh	[%l7 + 0x28],	%g4
	add	%i5,	%o4,	%i4
	taddcctv	%l5,	0x0103,	%g2
	movpos	%xcc,	%i2,	%i6
	tcc	%icc,	0x1
	fbge,a	%fcc3,	loop_913
	xnorcc	%g6,	%o3,	%o1
	smul	%o0,	0x1724,	%i1
	edge16l	%g3,	%o5,	%l0
loop_913:
	fxnor	%f2,	%f16,	%f22
	tle	%icc,	0x0
	movgu	%xcc,	%g1,	%i7
	tne	%icc,	0x6
	orncc	%o7,	%g5,	%g7
	popc	%o2,	%i3
	call	loop_914
	sll	%l3,	0x15,	%l6
	edge8n	%o6,	%l4,	%l1
	bge,a,pt	%xcc,	loop_915
loop_914:
	udiv	%l2,	0x0742,	%g4
	mulx	%i0,	%o4,	%i4
	edge16l	%l5,	%g2,	%i5
loop_915:
	nop
	set	0x3C, %l6
	ldswa	[%l7 + %l6] 0x15,	%i2
	fbe,a	%fcc3,	loop_916
	tne	%icc,	0x3
	ba,pn	%xcc,	loop_917
	bne,a,pn	%icc,	loop_918
loop_916:
	fnot1s	%f0,	%f1
	fsrc2s	%f31,	%f30
loop_917:
	addc	%g6,	0x128E,	%i6
loop_918:
	movg	%xcc,	%o1,	%o3
	fpsub32s	%f28,	%f23,	%f15
	edge16l	%o0,	%g3,	%i1
	udiv	%l0,	0x19DE,	%o5
	wr	%g0,	0x04,	%asi
	lda	[%l7 + 0x4C] %asi,	%f4
	movn	%xcc,	%i7,	%o7
	sub	%g5,	0x1773,	%g1
	or	%g7,	0x06A8,	%i3
	fnands	%f21,	%f9,	%f13
	set	0x40, %o5
	stda	%f0,	[%l7 + %o5] 0x16
	membar	#Sync
	fba	%fcc1,	loop_919
	fxor	%f22,	%f10,	%f8
	bcs,a,pn	%icc,	loop_920
	tne	%xcc,	0x4
loop_919:
	ldsh	[%l7 + 0x36],	%o2
	andn	%l6,	%l3,	%o6
loop_920:
	fbn,a	%fcc3,	loop_921
	fmul8sux16	%f24,	%f14,	%f28
	and	%l1,	%l2,	%g4
	fmovsle	%xcc,	%f19,	%f3
loop_921:
	bcc,a,pt	%xcc,	loop_922
	nop
	set	0x20, %o7
	prefetch	[%l7 + %o7],	 0x0
	brgz,a	%l4,	loop_923
	edge8n	%i0,	%i4,	%o4
loop_922:
	fmovsg	%xcc,	%f24,	%f22
	set	0x18, %g7
	prefetcha	[%l7 + %g7] 0x89,	 0x3
loop_923:
	movrne	%l5,	0x341,	%i5
	add	%i2,	%g6,	%o1
	xnorcc	%o3,	0x0D89,	%i6
	nop
	setx loop_924, %l0, %l1
	jmpl %l1, %g3
	stb	%o0,	[%l7 + 0x48]
	wr	%g0,	0x0c,	%asi
	swapa	[%l7 + 0x64] %asi,	%i1
loop_924:
	sdivx	%o5,	0x1D77,	%i7
	fmovse	%xcc,	%f29,	%f8
	fbge	%fcc2,	loop_925
	add	%o7,	0x1EC2,	%g5
	smulcc	%g1,	0x189E,	%l0
	fnot1	%f24,	%f4
loop_925:
	mulscc	%i3,	%g7,	%o2
	andcc	%l6,	%o6,	%l3
	movgu	%icc,	%l1,	%g4
	ldstub	[%l7 + 0x66],	%l2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32n	%l4,	%i4,	%o4
	wr	%g0,	0x80,	%asi
	lduha	[%l7 + 0x58] %asi,	%g2
	wr	%g0,	0x0c,	%asi
	swapa	[%l7 + 0x60] %asi,	%l5
	fmovdl	%xcc,	%f22,	%f5
	fsrc1s	%f17,	%f28
	fpack32	%f12,	%f24,	%f24
	fbn	%fcc3,	loop_926
	subccc	%i0,	%i2,	%i5
	edge16n	%g6,	%o1,	%i6
	fcmpgt32	%f20,	%f24,	%o3
loop_926:
	lduh	[%l7 + 0x6C],	%g3
	subccc	%o0,	%i1,	%o5
	fpadd16	%f12,	%f4,	%f28
	set	0x20, %l3
	lduwa	[%l7 + %l3] 0x80,	%o7
	set	0x40, %g3
	stda	%f16,	[%l7 + %g3] 0x80
	fmovrslez	%i7,	%f4,	%f5
	wr	%g0,	0x11,	%asi
	stda	%g4,	[%l7 + 0x68] %asi
	bn	loop_927
	sdiv	%g1,	0x0314,	%i3
	udivx	%l0,	0x0CD3,	%o2
	wr	%g0,	0x0c,	%asi
	ldsba	[%l7 + 0x08] %asi,	%g7
loop_927:
	fcmpeq32	%f20,	%f22,	%l6
	fexpand	%f2,	%f24
	fnegd	%f14,	%f30
	movg	%xcc,	%l3,	%l1
	edge32ln	%g4,	%l2,	%l4
	edge32l	%i4,	%o6,	%g2
	fandnot2s	%f24,	%f9,	%f31
	fors	%f26,	%f6,	%f28
	edge16ln	%l5,	%o4,	%i2
	or	%i5,	0x16CD,	%i0
	tge	%xcc,	0x6
	taddcctv	%o1,	0x0B2A,	%g6
	fmovsle	%xcc,	%f12,	%f18
	st	%f13,	[%l7 + 0x2C]
	srlx	%i6,	0x0B,	%o3
	tl	%xcc,	0x3
	mulscc	%g3,	%i1,	%o0
	fsrc1s	%f1,	%f18
	sdiv	%o5,	0x0C32,	%i7
	brgez	%g5,	loop_928
	smulcc	%o7,	%i3,	%l0
	array8	%o2,	%g1,	%l6
	movpos	%xcc,	%g7,	%l1
loop_928:
	fmovd	%f2,	%f10
	movcs	%icc,	%g4,	%l3
	addcc	%l2,	%i4,	%l4
	edge32	%o6,	%l5,	%o4
	tl	%icc,	0x1
	fcmpne32	%f24,	%f2,	%i2
	bvs	%xcc,	loop_929
	fmovrse	%i5,	%f13,	%f6
	ldsw	[%l7 + 0x4C],	%i0
	bpos,a,pn	%icc,	loop_930
loop_929:
	fbo,a	%fcc0,	loop_931
	movre	%g2,	%g6,	%i6
	fpack32	%f30,	%f20,	%f12
loop_930:
	sethi	0x07A2,	%o1
loop_931:
	movle	%xcc,	%g3,	%o3
	andn	%o0,	%o5,	%i1
	wr	%g0,	0x11,	%asi
	ldxa	[%l7 + 0x68] %asi,	%g5
	nop
	set	0x1F, %o1
	ldstub	[%l7 + %o1],	%o7
	fpadd32	%f2,	%f14,	%f20
	wr	%g0,	0x88,	%asi
	lduha	[%l7 + 0x14] %asi,	%i7
	umul	%i3,	%l0,	%g1
	edge16n	%l6,	%o2,	%g7
	tg	%xcc,	0x5
	ldsw	[%l7 + 0x1C],	%g4
	tsubcc	%l3,	%l2,	%i4
	tvs	%icc,	0x7
	edge32	%l4,	%l1,	%l5
	andn	%o6,	%i2,	%o4
	or	%i0,	%i5,	%g2
	set	0x1A, %i5
	lduha	[%l7 + %i5] 0x80,	%i6
	edge32ln	%o1,	%g3,	%o3
	fmuld8sux16	%f19,	%f14,	%f10
	ta	%xcc,	0x1
	movle	%xcc,	%g6,	%o0
	lduh	[%l7 + 0x4C],	%o5
	tgu	%icc,	0x2
	subc	%i1,	%g5,	%i7
	ldub	[%l7 + 0x50],	%i3
	wr	%g0,	0x19,	%asi
	swapa	[%l7 + 0x78] %asi,	%l0
	movgu	%xcc,	%g1,	%o7
	orncc	%o2,	0x1B8E,	%l6
	fpmerge	%f15,	%f17,	%f16
	fba,a	%fcc2,	loop_932
	ta	%icc,	0x4
	fone	%f14
	array16	%g4,	%l3,	%g7
loop_932:
	xorcc	%l2,	0x0874,	%l4
	movle	%xcc,	%i4,	%l1
	mulscc	%l5,	%o6,	%o4
	udivx	%i0,	0x1D58,	%i5
	fbn,a	%fcc0,	loop_933
	edge16n	%i2,	%i6,	%o1
	ta	%xcc,	0x6
	array8	%g3,	%g2,	%g6
loop_933:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ld	[%l7 + 0x2C],	%f10
	tcc	%icc,	0x6
	edge16l	%o3,	%o0,	%o5
	array16	%i1,	%g5,	%i7
	sdivcc	%l0,	0x0F79,	%g1
	membar	#Sync
	set	0x40, %l4
	ldda	[%l7 + %l4] 0x17,	%f0
	fpmerge	%f10,	%f13,	%f8
	stw	%o7,	[%l7 + 0x48]
	srlx	%i3,	%l6,	%o2
	fble,a	%fcc2,	loop_934
	fbul,a	%fcc2,	loop_935
	mulscc	%g4,	%l3,	%l2
	xor	%g7,	0x1766,	%l4
loop_934:
	tsubcc	%l1,	%l5,	%o6
loop_935:
	orncc	%i4,	0x108A,	%i0
	fxnors	%f1,	%f15,	%f4
	nop
	setx	loop_936,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fbl,a	%fcc0,	loop_937
	tpos	%icc,	0x1
	fblg,a	%fcc3,	loop_938
loop_936:
	fnot2	%f22,	%f12
loop_937:
	std	%f0,	[%l7 + 0x70]
	udiv	%o4,	0x19A6,	%i2
loop_938:
	andcc	%i6,	0x0786,	%i5
	tleu	%xcc,	0x5
	addccc	%g3,	0x146A,	%g2
	movneg	%icc,	%o1,	%o3
	add	%l7,	0x68,	%l6
	wr	%g0,	0x0c,	%asi
	casa	[%l6] %asi,	%g6,	%o0
	tle	%icc,	0x7
	orcc	%i1,	0x0DE4,	%g5
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x0E] %asi,	%o5
	edge16ln	%i7,	%l0,	%o7
	bg,pt	%icc,	loop_939
	edge8	%i3,	%l6,	%o2
	set	0x5B, %g1
	stba	%g1,	[%l7 + %g1] 0x80
loop_939:
	brlz,a	%g4,	loop_940
	fpackfix	%f26,	%f16
	movl	%xcc,	%l2,	%l3
	tcs	%icc,	0x4
loop_940:
	fpadd16	%f8,	%f12,	%f20
	fmovrse	%l4,	%f14,	%f22
	bgu,a	%xcc,	loop_941
	edge8n	%g7,	%l5,	%l1
	fmul8sux16	%f20,	%f26,	%f4
	wr	%g0,	0x80,	%asi
	ldswa	[%l7 + 0x20] %asi,	%o6
loop_941:
	prefetch	[%l7 + 0x18],	 0x2
	edge8l	%i0,	%i4,	%o4
	fornot1s	%f2,	%f8,	%f25
	xnorcc	%i6,	%i5,	%i2
	edge32ln	%g2,	%g3,	%o3
	sub	%g6,	%o1,	%o0
	tn	%icc,	0x1
	movne	%icc,	%i1,	%g5
	bcc	loop_942
	tl	%xcc,	0x7
	udivcc	%i7,	0x0667,	%o5
	edge8	%l0,	%o7,	%i3
loop_942:
	sll	%o2,	%g1,	%g4
	movrne	%l2,	0x045,	%l3
	fmovrslz	%l4,	%f3,	%f15
	fornot2	%f12,	%f24,	%f20
	subcc	%l6,	0x14A7,	%l5
	subcc	%l1,	%o6,	%i0
	edge32	%i4,	%g7,	%i6
	set	0x68, %i0
	sta	%f9,	[%l7 + %i0] 0x81
	ldd	[%l7 + 0x28],	%f24
	smul	%i5,	0x0E25,	%i2
	edge16l	%g2,	%o4,	%o3
	fbl	%fcc0,	loop_943
	fmovdvc	%xcc,	%f26,	%f0
	edge16ln	%g6,	%o1,	%g3
	membar	0x37
loop_943:
	addcc	%i1,	%g5,	%o0
	movrgz	%o5,	0x240,	%l0
	movrlez	%i7,	%o7,	%i3
	bgu,a,pt	%icc,	loop_944
	bn,a	%xcc,	loop_945
	st	%f7,	[%l7 + 0x3C]
	subcc	%o2,	%g1,	%g4
loop_944:
	orn	%l2,	%l3,	%l4
loop_945:
	srlx	%l6,	0x15,	%l5
	fmul8sux16	%f12,	%f8,	%f2
	movg	%icc,	%l1,	%o6
	wr	%g0,	0x11,	%asi
	ldsha	[%l7 + 0x1E] %asi,	%i0
	fmuld8sux16	%f26,	%f17,	%f10
	wr	%g0,	0x89,	%asi
	ldsha	[%l7 + 0x4E] %asi,	%i4
	fmovs	%f25,	%f7
	movvc	%icc,	%g7,	%i6
	fzeros	%f16
	tvc	%xcc,	0x6
	fmovdleu	%xcc,	%f11,	%f12
	fmovsgu	%icc,	%f31,	%f28
	nop
	setx	loop_946,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	bl,a,pn	%xcc,	loop_947
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8ln	%i2,	%g2,	%o4
loop_946:
	fmovdl	%icc,	%f15,	%f11
loop_947:
	edge16l	%o3,	%g6,	%i5
	fnands	%f19,	%f18,	%f29
	movgu	%xcc,	%o1,	%i1
	flush	%l7 + 0x74
	udivcc	%g5,	0x0B2C,	%o0
	nop
	set	0x1A, %o4
	lduh	[%l7 + %o4],	%g3
	brlz,a	%l0,	loop_948
	ldsb	[%l7 + 0x3F],	%o5
	sethi	0x18D6,	%i7
	movg	%xcc,	%o7,	%i3
loop_948:
	move	%xcc,	%o2,	%g4
	fsrc2s	%f29,	%f19
	addcc	%l2,	%l3,	%g1
	tge	%xcc,	0x2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbn,a	%fcc0,	loop_949
	fmovrsgez	%l6,	%f22,	%f5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpack16	%f12,	%f11
loop_949:
	fmovsa	%icc,	%f10,	%f14
	udivx	%l5,	0x0F78,	%l4
	fba	%fcc2,	loop_950
	fmovsl	%icc,	%f31,	%f24
	fpsub32s	%f22,	%f12,	%f27
	fbn,a	%fcc0,	loop_951
loop_950:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32ln	%l1,	%o6,	%i4
	smulcc	%i0,	%i6,	%g7
loop_951:
	fmovde	%xcc,	%f25,	%f2
	bvc,a,pn	%xcc,	loop_952
	movrne	%g2,	0x14A,	%i2
	movg	%xcc,	%o3,	%o4
	smulcc	%i5,	0x1E3A,	%g6
loop_952:
	ldub	[%l7 + 0x5C],	%o1
	sll	%g5,	%i1,	%o0
	bpos,a	%xcc,	loop_953
	orn	%g3,	0x0F22,	%o5
	ldx	[%l7 + 0x20],	%l0
	andncc	%o7,	%i7,	%i3
loop_953:
	fpack16	%f26,	%f15
	sub	%o2,	0x176E,	%l2
	sdiv	%g4,	0x1E56,	%l3
	tvc	%icc,	0x6
	fmovdpos	%icc,	%f14,	%f11
	ldsw	[%l7 + 0x3C],	%g1
	taddcc	%l5,	0x1595,	%l4
	fbul,a	%fcc2,	loop_954
	membar	0x24
	taddcctv	%l1,	0x02B2,	%l6
	sdiv	%o6,	0x1451,	%i4
loop_954:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addcc	%i0,	0x0A88,	%g7
	movrlez	%i6,	0x159,	%i2
	brgez,a	%o3,	loop_955
	fmovdleu	%xcc,	%f31,	%f19
	nop
	set	0x6C, %g6
	sth	%o4,	[%l7 + %g6]
	brnz,a	%i5,	loop_956
loop_955:
	call	loop_957
	tvs	%xcc,	0x3
	ld	[%l7 + 0x38],	%f31
loop_956:
	nop
	set	0x58, %o0
	stda	%g6,	[%l7 + %o0] 0x80
loop_957:
	subcc	%o1,	%g2,	%g5
	bn	%xcc,	loop_958
	array8	%i1,	%g3,	%o0
	mulscc	%o5,	%l0,	%i7
	edge32ln	%i3,	%o2,	%l2
loop_958:
	movvc	%icc,	%o7,	%l3
	movcs	%icc,	%g1,	%g4
	movg	%icc,	%l5,	%l4
	tneg	%xcc,	0x3
	srl	%l1,	0x1F,	%l6
	fpadd16	%f28,	%f18,	%f26
	ldsh	[%l7 + 0x50],	%o6
	fble	%fcc3,	loop_959
	edge32l	%i4,	%i0,	%g7
	fmuld8sux16	%f17,	%f0,	%f0
	fbg	%fcc1,	loop_960
loop_959:
	movcc	%xcc,	%i6,	%o3
	tneg	%xcc,	0x4
	tle	%xcc,	0x0
loop_960:
	movn	%icc,	%i2,	%o4
	bn,pt	%icc,	loop_961
	tl	%xcc,	0x3
	ldsb	[%l7 + 0x5B],	%i5
	udivcc	%g6,	0x1E02,	%o1
loop_961:
	addccc	%g2,	0x01C4,	%g5
	fxor	%f10,	%f30,	%f22
	fmovrdne	%i1,	%f2,	%f24
	siam	0x2
	wr	%g0,	0x4f,	%asi
	stxa	%g3,	[%g0 + 0x30] %asi
	fpadd32s	%f11,	%f8,	%f29
	umulcc	%o5,	0x155F,	%o0
	movneg	%icc,	%l0,	%i7
	movn	%icc,	%o2,	%l2
	fmovs	%f26,	%f2
	fmovsneg	%xcc,	%f22,	%f29
	udivcc	%i3,	0x04B8,	%o7
	movcs	%xcc,	%g1,	%g4
	movvs	%xcc,	%l5,	%l4
	brlz	%l1,	loop_962
	srl	%l3,	0x12,	%o6
	movcc	%icc,	%i4,	%l6
	nop
	set	0x28, %g2
	sth	%g7,	[%l7 + %g2]
loop_962:
	tvc	%xcc,	0x5
	alignaddr	%i0,	%o3,	%i2
	tn	%xcc,	0x6
	orncc	%o4,	%i6,	%i5
	movne	%xcc,	%g6,	%o1
	fnor	%f0,	%f24,	%f24
	add	%l7,	0x18,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] %asi,	%g2,	%i1
	fpsub32	%f6,	%f6,	%f16
	movrne	%g3,	0x07A,	%o5
	fpsub16	%f28,	%f26,	%f8
	addc	%g5,	%o0,	%l0
	smul	%o2,	0x07BB,	%i7
	movn	%icc,	%i3,	%l2
	edge16ln	%o7,	%g1,	%l5
	edge32ln	%g4,	%l4,	%l1
	fcmped	%fcc0,	%f26,	%f14
	fbug	%fcc1,	loop_963
	movne	%xcc,	%l3,	%o6
	fornot1s	%f24,	%f31,	%f2
	add	%l6,	0x1977,	%i4
loop_963:
	fmovda	%icc,	%f5,	%f17
	fnot1	%f0,	%f10
	edge32l	%g7,	%i0,	%o3
	stbar
	orncc	%i2,	0x111B,	%o4
	fmovspos	%xcc,	%f4,	%f17
	tpos	%icc,	0x7
	mulscc	%i5,	0x1D6F,	%g6
	flush	%l7 + 0x5C
	fpsub32	%f0,	%f24,	%f30
	sir	0x01B9
	fors	%f16,	%f24,	%f17
	edge16n	%o1,	%i6,	%g2
	umul	%g3,	%i1,	%g5
	bn	loop_964
	umulcc	%o0,	%o5,	%l0
	ldub	[%l7 + 0x5A],	%i7
	movneg	%icc,	%i3,	%o2
loop_964:
	edge16l	%l2,	%g1,	%o7
	umulcc	%l5,	%l4,	%l1
	fabsd	%f28,	%f14
	wr	%g0,	0x89,	%asi
	prefetcha	[%l7 + 0x20] %asi,	 0x3
	tleu	%xcc,	0x4
	fcmpne32	%f20,	%f2,	%g4
	fblg,a	%fcc1,	loop_965
	alignaddr	%o6,	%i4,	%l6
	set	0x34, %i2
	stwa	%i0,	[%l7 + %i2] 0x11
loop_965:
	or	%o3,	0x19D8,	%g7
	tn	%icc,	0x6
	movrne	%i2,	0x263,	%i5
	st	%f22,	[%l7 + 0x2C]
	te	%xcc,	0x1
	alignaddrl	%o4,	%g6,	%i6
	sra	%g2,	%g3,	%i1
	fpsub32s	%f3,	%f29,	%f28
	andn	%o1,	0x11C8,	%g5
	add	%o5,	0x1831,	%o0
	fmul8ulx16	%f6,	%f16,	%f12
	fbule,a	%fcc3,	loop_966
	fpsub16s	%f23,	%f30,	%f13
	andn	%l0,	0x12EE,	%i7
	movneg	%xcc,	%o2,	%i3
loop_966:
	fmovdleu	%icc,	%f16,	%f4
	fcmpne32	%f12,	%f26,	%g1
	movn	%xcc,	%o7,	%l5
	fmul8x16au	%f13,	%f16,	%f12
	set	0x1F, %i4
	ldsba	[%l7 + %i4] 0x15,	%l4
	te	%icc,	0x2
	edge16l	%l2,	%l3,	%l1
	sdiv	%o6,	0x04C8,	%g4
	fmovdge	%xcc,	%f24,	%f1
	udivx	%l6,	0x1CD2,	%i4
	fpmerge	%f31,	%f0,	%f18
	set	0x3C, %o3
	stwa	%o3,	[%l7 + %o3] 0xeb
	membar	#Sync
	movgu	%xcc,	%g7,	%i0
	edge16	%i2,	%o4,	%g6
	bneg	loop_967
	fmovsle	%icc,	%f30,	%f23
	movleu	%icc,	%i5,	%i6
	fzero	%f4
loop_967:
	sethi	0x1875,	%g3
	brlez	%i1,	loop_968
	fmovscs	%xcc,	%f23,	%f31
	fbne	%fcc2,	loop_969
	xorcc	%g2,	%g5,	%o1
loop_968:
	fblg	%fcc3,	loop_970
	edge32l	%o0,	%l0,	%o5
loop_969:
	bg,a,pn	%icc,	loop_971
	edge32n	%o2,	%i7,	%i3
loop_970:
	sllx	%o7,	%l5,	%g1
	sub	%l2,	0x15FF,	%l4
loop_971:
	fcmpeq32	%f26,	%f20,	%l1
	stb	%o6,	[%l7 + 0x52]
	wr	%g0,	0x0c,	%asi
	ldstuba	[%l7 + 0x31] %asi,	%l3
	tn	%icc,	0x1
	sra	%g4,	0x12,	%l6
	brnz,a	%o3,	loop_972
	fsrc2s	%f6,	%f30
	fmovdleu	%xcc,	%f2,	%f14
	edge32	%i4,	%g7,	%i2
loop_972:
	fmovd	%f10,	%f26
	bne	loop_973
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddr	%o4,	%i0,	%i5
	movn	%xcc,	%i6,	%g6
loop_973:
	tgu	%xcc,	0x1
	xnorcc	%g3,	0x0A4D,	%i1
	array8	%g2,	%g5,	%o0
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
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bcs	loop_975
	fpackfix	%f26,	%f31
loop_974:
	movrgez	%l0,	0x24D,	%o5
	tcs	%xcc,	0x7
loop_975:
	andn	%o2,	0x1805,	%i7
	andncc	%o1,	%i3,	%o7
	fmovdleu	%xcc,	%f31,	%f15
	tpos	%icc,	0x7
	bleu,pt	%xcc,	loop_976
	fabsd	%f0,	%f20
	wr	%g0,	0x81,	%asi
	ldsba	[%l7 + 0x4B] %asi,	%g1
loop_976:
	nop
	set	0x20, %l5
	stda	%l4,	[%l7 + %l5] 0xeb
	membar	#Sync
	movrlez	%l4,	%l1,	%l2
	fmovdpos	%icc,	%f5,	%f19
	andncc	%l3,	%o6,	%g4
	movgu	%icc,	%o3,	%i4
	sll	%g7,	0x18,	%l6
	fsrc2	%f0,	%f20
	andncc	%i2,	%i0,	%i5
	add	%o4,	%g6,	%i6
	fblg	%fcc2,	loop_977
	fabsd	%f28,	%f4
	smul	%i1,	%g2,	%g5
	movne	%xcc,	%g3,	%l0
loop_977:
	nop
	wr	%g0,	0x22,	%asi
	stba	%o5,	[%l7 + 0x10] %asi
	membar	#Sync
	nop
	setx loop_978, %l0, %l1
	jmpl %l1, %o2
	umulcc	%i7,	0x0756,	%o0
	tsubcc	%i3,	%o1,	%o7
	fmovdpos	%xcc,	%f28,	%f11
loop_978:
	array32	%g1,	%l5,	%l4
	fmovdn	%icc,	%f31,	%f4
	pdist	%f8,	%f28,	%f30
	edge32	%l1,	%l3,	%o6
	brlez,a	%l2,	loop_979
	movvs	%icc,	%g4,	%o3
	fpadd16s	%f11,	%f7,	%f28
	stbar
loop_979:
	fcmpgt32	%f14,	%f6,	%i4
	edge8n	%g7,	%i2,	%i0
	or	%i5,	%l6,	%o4
	movle	%icc,	%i6,	%g6
	mulx	%g2,	%g5,	%i1
	wr	%g0,	0x11,	%asi
	ldswa	[%l7 + 0x14] %asi,	%g3
	add	%o5,	%o2,	%l0
	subccc	%o0,	%i3,	%i7
	fmovrdne	%o7,	%f28,	%f14
	andn	%g1,	%l5,	%o1
	fmovsgu	%xcc,	%f0,	%f18
	te	%icc,	0x6
	wr	%g0,	0x27,	%asi
	ldda	[%l7 + 0x60] %asi,	%l0
	add	%l3,	%l4,	%o6
	tvs	%xcc,	0x3
	fpackfix	%f12,	%f1
	addcc	%g4,	0x08A8,	%l2
	srl	%i4,	%g7,	%i2
	movl	%icc,	%i0,	%o3
	edge8ln	%i5,	%l6,	%i6
	ldsb	[%l7 + 0x1D],	%g6
	fcmpeq32	%f26,	%f24,	%g2
	edge32	%g5,	%o4,	%g3
	bgu	loop_980
	sll	%i1,	%o2,	%l0
	tsubcctv	%o0,	%i3,	%i7
	bge,pt	%icc,	loop_981
loop_980:
	addcc	%o7,	0x08A3,	%o5
	or	%g1,	%o1,	%l5
	edge8l	%l3,	%l1,	%l4
loop_981:
	add	%o6,	0x1808,	%l2
	fpadd16	%f24,	%f12,	%f16
	te	%xcc,	0x3
	movrgz	%i4,	0x153,	%g4
	movvc	%icc,	%g7,	%i0
	movvc	%icc,	%o3,	%i5
	movpos	%icc,	%i2,	%l6
	membar	0x6E
	swap	[%l7 + 0x60],	%i6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bl,a	%icc,	loop_982
	bgu	%icc,	loop_983
	orncc	%g2,	0x0340,	%g5
	fpadd32	%f14,	%f16,	%f26
loop_982:
	fandnot1	%f24,	%f8,	%f18
loop_983:
	tpos	%icc,	0x7
	movrlez	%o4,	0x04E,	%g3
	sra	%i1,	%g6,	%o2
	fmovsne	%icc,	%f8,	%f16
	tg	%icc,	0x1
	movgu	%xcc,	%l0,	%o0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fandnot2s	%f27,	%f28,	%f10
	fmul8sux16	%f20,	%f12,	%f18
	te	%xcc,	0x2
	fsrc2	%f22,	%f12
	bl,a	%icc,	loop_984
	sdivx	%i7,	0x032C,	%o7
	wr	%g0,	0x89,	%asi
	lduha	[%l7 + 0x40] %asi,	%i3
loop_984:
	movcs	%icc,	%o5,	%g1
	fandnot1s	%f31,	%f9,	%f27
	fmovsle	%icc,	%f9,	%f20
	fmovrsgz	%l5,	%f19,	%f21
	fbug,a	%fcc2,	loop_985
	xnor	%o1,	0x055A,	%l3
	te	%icc,	0x2
	movrgez	%l4,	%o6,	%l2
loop_985:
	fblg,a	%fcc0,	loop_986
	udiv	%l1,	0x05A7,	%g4
	udivx	%i4,	0x1B18,	%g7
	fands	%f19,	%f24,	%f31
loop_986:
	popc	0x151A,	%i0
	movvs	%icc,	%o3,	%i2
	sllx	%l6,	%i5,	%g2
	brgz,a	%i6,	loop_987
	subccc	%g5,	%g3,	%i1
	set	0x4E, %g5
	ldsha	[%l7 + %g5] 0x19,	%g6
loop_987:
	andn	%o4,	%o2,	%o0
	movle	%icc,	%i7,	%o7
	bgu	%xcc,	loop_988
	fbue	%fcc0,	loop_989
	edge32ln	%i3,	%o5,	%l0
	fsrc2s	%f7,	%f16
loop_988:
	movvs	%xcc,	%l5,	%g1
loop_989:
	edge8ln	%l3,	%l4,	%o1
	xorcc	%l2,	%l1,	%g4
	fmovrslez	%o6,	%f16,	%f22
	tg	%xcc,	0x0
	tne	%xcc,	0x0
	srax	%g7,	%i4,	%o3
	movge	%xcc,	%i0,	%i2
	fbe	%fcc3,	loop_990
	sth	%i5,	[%l7 + 0x4A]
	srlx	%l6,	%g2,	%i6
	tvs	%xcc,	0x5
loop_990:
	edge16ln	%g5,	%g3,	%g6
	popc	0x03FE,	%o4
	fone	%f8
	tvs	%icc,	0x6
	subccc	%o2,	%i1,	%i7
	stw	%o0,	[%l7 + 0x50]
	set	0x4C, %l0
	lduwa	[%l7 + %l0] 0x0c,	%o7
	set	0x40, %l1
	ldda	[%l7 + %l1] 0x15,	%f0
	movcc	%icc,	%i3,	%o5
	movrgz	%l0,	%l5,	%g1
	fmovsleu	%xcc,	%f16,	%f6
	tpos	%icc,	0x1
	udivcc	%l4,	0x122A,	%l3
	fand	%f6,	%f20,	%f26
	fbule,a	%fcc3,	loop_991
	andcc	%o1,	%l1,	%g4
	tsubcctv	%o6,	0x0336,	%g7
	orncc	%l2,	0x0AAD,	%i4
loop_991:
	mova	%icc,	%o3,	%i2
	brgez	%i0,	loop_992
	fbo,a	%fcc2,	loop_993
	bvc	%icc,	loop_994
	movvc	%icc,	%i5,	%g2
loop_992:
	movl	%icc,	%i6,	%l6
loop_993:
	movle	%xcc,	%g3,	%g6
loop_994:
	sdiv	%g5,	0x066E,	%o4
	movre	%o2,	0x380,	%i7
	tg	%xcc,	0x6
	addccc	%i1,	%o7,	%i3
	membar	0x0E
	smul	%o0,	0x0289,	%o5
	ldx	[%l7 + 0x58],	%l5
	sethi	0x1912,	%g1
	fcmple32	%f6,	%f30,	%l0
	fmul8x16al	%f21,	%f7,	%f16
	fmovdgu	%icc,	%f21,	%f12
	fmovscs	%icc,	%f24,	%f15
	xnorcc	%l3,	%o1,	%l4
	tgu	%icc,	0x6
	brgez,a	%l1,	loop_995
	alignaddr	%o6,	%g7,	%l2
	edge8	%i4,	%o3,	%i2
	set	0x40, %i1
	ldda	[%l7 + %i1] 0x2b,	%i0
loop_995:
	alignaddrl	%g4,	%i5,	%i6
	sir	0x0834
	fornot1	%f8,	%f26,	%f16
	lduw	[%l7 + 0x10],	%g2
	fmovsa	%icc,	%f27,	%f29
	fxnor	%f24,	%f0,	%f28
	add	%l7,	0x6C,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%l6,	%g3
	fcmpd	%fcc2,	%f6,	%f10
	tsubcctv	%g5,	%o4,	%g6
	movpos	%xcc,	%o2,	%i7
	add	%i1,	%i3,	%o7
	bne	loop_996
	srl	%o0,	0x02,	%o5
	fnot1s	%f25,	%f9
	sllx	%l5,	0x0D,	%l0
loop_996:
	tgu	%xcc,	0x4
	set	0x44, %i7
	swapa	[%l7 + %i7] 0x11,	%g1
	fpadd16	%f8,	%f12,	%f2
	sll	%o1,	0x13,	%l3
	fmovdvs	%xcc,	%f24,	%f15
	st	%f18,	[%l7 + 0x7C]
	fmovdvs	%xcc,	%f13,	%f9
	sdiv	%l4,	0x0CCB,	%l1
	tcc	%xcc,	0x1
	lduw	[%l7 + 0x60],	%g7
	srl	%o6,	0x1C,	%i4
	add	%l2,	%o3,	%i2
	srax	%i0,	%i5,	%g4
	set	0x10, %g4
	lduwa	[%l7 + %g4] 0x88,	%i6
	orcc	%g2,	0x18C0,	%l6
	edge8ln	%g5,	%o4,	%g6
	set	0x24, %i6
	ldsha	[%l7 + %i6] 0x0c,	%o2
	xnorcc	%i7,	0x0AC3,	%i1
	movrlz	%i3,	%g3,	%o0
	fpsub16	%f18,	%f28,	%f24
	orcc	%o7,	%l5,	%o5
	fmovrsgez	%g1,	%f10,	%f5
	ld	[%l7 + 0x50],	%f30
	alignaddrl	%l0,	%o1,	%l3
	edge8n	%l1,	%l4,	%o6
	edge16ln	%g7,	%i4,	%l2
	tsubcc	%o3,	0x06BB,	%i0
	movgu	%icc,	%i5,	%g4
	movleu	%xcc,	%i6,	%i2
	fandnot1	%f0,	%f10,	%f16
	brgez,a	%l6,	loop_997
	movvc	%xcc,	%g5,	%g2
	fnot2	%f22,	%f30
	add	%g6,	0x16C9,	%o2
loop_997:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrlz	%o4,	%i1,	%i3
	fornot1s	%f16,	%f24,	%f15
	ta	%xcc,	0x5
	fbn,a	%fcc0,	loop_998
	addc	%i7,	%o0,	%g3
	sll	%o7,	0x09,	%l5
	udivcc	%g1,	0x1C52,	%l0
loop_998:
	fnot1s	%f28,	%f10
	move	%xcc,	%o5,	%o1
	add	%l3,	%l1,	%o6
	add	%l4,	%i4,	%g7
	movrne	%l2,	0x117,	%o3
	srlx	%i5,	%i0,	%i6
	fmovdn	%xcc,	%f11,	%f3
	fcmpes	%fcc0,	%f0,	%f15
	andn	%g4,	0x155A,	%l6
	tge	%icc,	0x2
	xnor	%g5,	0x1727,	%g2
	movneg	%icc,	%i2,	%g6
	brgez	%o4,	loop_999
	nop
	setx	loop_1000,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fors	%f15,	%f23,	%f28
	wr	%g0,	0x80,	%asi
	lda	[%l7 + 0x58] %asi,	%f7
loop_999:
	alignaddrl	%i1,	%o2,	%i7
loop_1000:
	umulcc	%o0,	0x144F,	%i3
	tn	%xcc,	0x6
	srax	%g3,	0x17,	%o7
	fmovdge	%xcc,	%f17,	%f24
	tpos	%icc,	0x1
	set	0x60, %i3
	ldswa	[%l7 + %i3] 0x81,	%l5
	fpsub32	%f26,	%f26,	%f12
	fmovrslz	%g1,	%f3,	%f22
	umulcc	%o5,	%l0,	%o1
	srl	%l3,	%o6,	%l4
	bne,a,pt	%icc,	loop_1001
	sethi	0x0C95,	%l1
	movneg	%icc,	%i4,	%l2
	addccc	%g7,	0x0B2D,	%o3
loop_1001:
	fmovsa	%xcc,	%f13,	%f26
	alignaddr	%i5,	%i0,	%g4
	movgu	%xcc,	%i6,	%g5
	srlx	%g2,	%l6,	%g6
	movg	%icc,	%o4,	%i1
	sethi	0x0BDD,	%i2
	edge8l	%i7,	%o2,	%o0
	tneg	%xcc,	0x1
	movpos	%xcc,	%g3,	%o7
	sub	%l5,	0x15A5,	%i3
	srax	%o5,	0x0F,	%g1
	fmovdcs	%xcc,	%f10,	%f25
	xnorcc	%o1,	%l0,	%o6
	fabss	%f26,	%f26
	wr	%g0,	0x19,	%asi
	lduha	[%l7 + 0x0E] %asi,	%l4
	fornot1	%f18,	%f12,	%f6
	fsrc2s	%f30,	%f1
	movrgz	%l1,	%i4,	%l3
	subc	%g7,	%o3,	%l2
	nop
	setx loop_1002, %l0, %l1
	jmpl %l1, %i0
	fmovde	%xcc,	%f22,	%f18
	movle	%icc,	%g4,	%i6
	set	0x18, %o2
	stxa	%i5,	[%l7 + %o2] 0x14
loop_1002:
	edge32ln	%g5,	%g2,	%l6
	fmul8x16	%f29,	%f10,	%f0
	edge8n	%g6,	%o4,	%i2
	fbule,a	%fcc1,	loop_1003
	ldsh	[%l7 + 0x76],	%i7
	subcc	%o2,	%o0,	%i1
	set	0x08, %l2
	lduba	[%l7 + %l2] 0x14,	%g3
loop_1003:
	swap	[%l7 + 0x40],	%o7
	tn	%xcc,	0x0
	ble,a	%xcc,	loop_1004
	fmovsvc	%icc,	%f11,	%f16
	orcc	%l5,	%i3,	%o5
	fba	%fcc2,	loop_1005
loop_1004:
	fmovsvs	%icc,	%f2,	%f6
	edge8ln	%o1,	%g1,	%l0
	bleu,a,pn	%xcc,	loop_1006
loop_1005:
	fcmpes	%fcc3,	%f8,	%f15
	tge	%xcc,	0x4
	edge8l	%l4,	%l1,	%o6
loop_1006:
	fmovdle	%icc,	%f25,	%f14
	fpackfix	%f20,	%f14
	membar	#Sync
	set	0x40, %l6
	ldda	[%l7 + %l6] 0x17,	%f0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sub	%l3,	%g7,	%i4
	faligndata	%f24,	%f24,	%f22
	andcc	%o3,	0x16F6,	%i0
	tcc	%icc,	0x3
	and	%l2,	%i6,	%i5
	fsrc2	%f22,	%f4
	tg	%icc,	0x0
	fmovdneg	%icc,	%f10,	%f7
	movcs	%icc,	%g5,	%g4
	smul	%l6,	0x1B6C,	%g6
	array32	%o4,	%g2,	%i2
	fandnot2	%f26,	%f16,	%f18
	fmovrdlez	%i7,	%f22,	%f4
	orncc	%o2,	%o0,	%g3
	te	%xcc,	0x2
	set	0x20, %o5
	stda	%i0,	[%l7 + %o5] 0xe3
	membar	#Sync
	edge32	%l5,	%o7,	%o5
	brz,a	%o1,	loop_1007
	or	%i3,	0x1418,	%l0
	fmovscs	%icc,	%f9,	%f27
	ta	%icc,	0x4
loop_1007:
	movgu	%icc,	%g1,	%l4
	ta	%xcc,	0x7
	ldstub	[%l7 + 0x55],	%o6
	tn	%xcc,	0x5
	edge16l	%l1,	%l3,	%i4
	fmovdg	%icc,	%f26,	%f29
	bl,a,pn	%icc,	loop_1008
	edge8ln	%g7,	%i0,	%l2
	fmovse	%icc,	%f16,	%f16
	membar	0x7A
loop_1008:
	alignaddr	%o3,	%i5,	%g5
	move	%xcc,	%i6,	%l6
	fcmple16	%f4,	%f22,	%g6
	te	%xcc,	0x1
	stbar
	mulx	%o4,	%g2,	%i2
	be,a,pn	%icc,	loop_1009
	movl	%xcc,	%g4,	%i7
	wr	%g0,	0x04,	%asi
	lda	[%l7 + 0x24] %asi,	%f7
loop_1009:
	pdist	%f28,	%f20,	%f6
	fmovdgu	%xcc,	%f15,	%f12
	movrne	%o2,	0x118,	%o0
	fcmped	%fcc2,	%f4,	%f26
	fmovdge	%icc,	%f14,	%f0
	wr	%g0,	0xf9,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
	fmovda	%icc,	%f30,	%f9
	ldx	[%l7 + 0x78],	%g3
	and	%l5,	0x1C37,	%i1
	te	%xcc,	0x3
	fpadd16s	%f4,	%f11,	%f18
	nop
	set	0x71, %o6
	ldsb	[%l7 + %o6],	%o5
	subcc	%o1,	%i3,	%o7
	set	0x52, %g7
	lduha	[%l7 + %g7] 0x88,	%l0
	smulcc	%l4,	%o6,	%l1
	bleu,pn	%xcc,	loop_1010
	movne	%icc,	%l3,	%i4
	andncc	%g7,	%g1,	%l2
	addcc	%i0,	%i5,	%g5
loop_1010:
	movgu	%xcc,	%o3,	%l6
	sth	%i6,	[%l7 + 0x44]
	addccc	%g6,	%g2,	%o4
	fornot2	%f8,	%f0,	%f24
	movrlez	%i2,	%g4,	%o2
	sra	%i7,	0x0E,	%g3
	subc	%l5,	0x0BE7,	%i1
	wr	%g0,	0x04,	%asi
	lduba	[%l7 + 0x76] %asi,	%o5
	subc	%o1,	%i3,	%o7
	movleu	%icc,	%l0,	%l4
	ldsh	[%l7 + 0x2C],	%o6
	taddcc	%o0,	%l1,	%i4
	wr	%g0,	0x2b,	%asi
	stha	%g7,	[%l7 + 0x68] %asi
	membar	#Sync
	movvc	%xcc,	%l3,	%l2
	subcc	%g1,	%i5,	%g5
	fmul8x16	%f27,	%f30,	%f16
	fcmpeq32	%f2,	%f30,	%i0
	addc	%l6,	%i6,	%o3
	ba	loop_1011
	add	%g2,	0x0474,	%o4
	fmovdl	%icc,	%f0,	%f14
	movn	%icc,	%i2,	%g4
loop_1011:
	membar	0x10
	call	loop_1012
	for	%f4,	%f14,	%f20
	fblg,a	%fcc2,	loop_1013
	orn	%o2,	0x1D7D,	%g6
loop_1012:
	bneg,a	loop_1014
	fsrc1s	%f14,	%f5
loop_1013:
	movleu	%xcc,	%i7,	%g3
	fmovdg	%icc,	%f22,	%f23
loop_1014:
	bvs,a,pn	%icc,	loop_1015
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sth	%l5,	[%l7 + 0x52]
	bg,a,pn	%icc,	loop_1016
loop_1015:
	tn	%icc,	0x6
	edge32ln	%o5,	%o1,	%i1
	bvc,pn	%icc,	loop_1017
loop_1016:
	sra	%i3,	%o7,	%l4
	edge16n	%o6,	%o0,	%l1
	tn	%icc,	0x2
loop_1017:
	nop
	set	0x60, %o7
	swapa	[%l7 + %o7] 0x80,	%i4
	edge32ln	%g7,	%l0,	%l3
	lduh	[%l7 + 0x4E],	%g1
	edge16ln	%i5,	%l2,	%g5
	movge	%xcc,	%i0,	%i6
	tl	%xcc,	0x7
	and	%l6,	0x19EC,	%o3
	movrlez	%o4,	0x3DA,	%g2
	movl	%icc,	%i2,	%o2
	fnot2	%f8,	%f4
	tle	%xcc,	0x3
	wr	%g0,	0xea,	%asi
	stwa	%g6,	[%l7 + 0x3C] %asi
	membar	#Sync
	bcc,a,pt	%icc,	loop_1018
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdge	%xcc,	%f16,	%f17
	addc	%g4,	%i7,	%g3
loop_1018:
	fnot1s	%f5,	%f11
	wr	%g0,	0x04,	%asi
	ldsha	[%l7 + 0x2A] %asi,	%l5
	movrgz	%o5,	0x374,	%i1
	umulcc	%o1,	0x09B6,	%o7
	wr	%g0,	0x11,	%asi
	lduha	[%l7 + 0x72] %asi,	%l4
	ldsh	[%l7 + 0x4C],	%o6
	subccc	%i3,	%o0,	%l1
	movvs	%icc,	%i4,	%g7
	movn	%xcc,	%l0,	%l3
	edge32l	%g1,	%l2,	%i5
	fxnor	%f30,	%f24,	%f14
	mova	%xcc,	%i0,	%g5
	fpsub32s	%f1,	%f0,	%f17
	tvs	%xcc,	0x5
	umulcc	%l6,	0x11C4,	%o3
	fone	%f22
	mulscc	%i6,	0x13A9,	%g2
	set	0x68, %g3
	prefetcha	[%l7 + %g3] 0x15,	 0x3
	xorcc	%o4,	0x049E,	%o2
	tneg	%xcc,	0x0
	fcmpgt32	%f8,	%f12,	%g4
	andncc	%g6,	%i7,	%g3
	movle	%xcc,	%o5,	%i1
	movrlz	%l5,	0x244,	%o7
	fmovs	%f2,	%f1
	fmovsg	%xcc,	%f13,	%f18
	brz,a	%l4,	loop_1019
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tn	%xcc,	0x1
	fbl	%fcc1,	loop_1020
loop_1019:
	bgu,a,pt	%xcc,	loop_1021
	call	loop_1022
	sll	%o6,	0x13,	%o1
loop_1020:
	nop
	set	0x18, %o1
	stx	%o0,	[%l7 + %o1]
loop_1021:
	edge32l	%l1,	%i3,	%i4
loop_1022:
	st	%f21,	[%l7 + 0x54]
	lduh	[%l7 + 0x44],	%l0
	wr	%g0,	0x0c,	%asi
	stba	%l3,	[%l7 + 0x0C] %asi
	brgz	%g1,	loop_1023
	fcmpgt16	%f12,	%f4,	%l2
	movgu	%xcc,	%g7,	%i5
	sth	%i0,	[%l7 + 0x66]
loop_1023:
	xorcc	%l6,	%g5,	%o3
	addcc	%g2,	0x0902,	%i2
	and	%o4,	0x1523,	%o2
	sir	0x08A7
	movre	%i6,	%g6,	%g4
	edge16l	%g3,	%o5,	%i7
	sllx	%i1,	%o7,	%l5
	fmuld8sux16	%f2,	%f28,	%f30
	fzero	%f4
	fmovrde	%o6,	%f12,	%f30
	movrne	%l4,	0x2E1,	%o0
	tn	%icc,	0x6
	movrne	%l1,	0x19A,	%o1
	movg	%xcc,	%i4,	%l0
	sra	%l3,	%i3,	%g1
	smul	%l2,	%g7,	%i5
	fpadd16s	%f1,	%f11,	%f3
	movvc	%xcc,	%l6,	%g5
	tn	%xcc,	0x6
	tgu	%icc,	0x7
	srax	%o3,	%g2,	%i2
	tn	%xcc,	0x7
	edge8ln	%o4,	%o2,	%i6
	fmovse	%xcc,	%f24,	%f6
	tneg	%xcc,	0x5
	srax	%g6,	0x1B,	%g4
	xorcc	%i0,	%o5,	%i7
	udivcc	%g3,	0x014D,	%i1
	fornot2s	%f29,	%f28,	%f27
	edge16ln	%l5,	%o6,	%l4
	and	%o0,	%l1,	%o7
	edge8ln	%o1,	%l0,	%l3
	addcc	%i4,	0x1C55,	%i3
	fbn,a	%fcc3,	loop_1024
	fnot1s	%f12,	%f25
	fbge	%fcc3,	loop_1025
	umulcc	%g1,	%g7,	%i5
loop_1024:
	sdivcc	%l2,	0x1DF7,	%l6
	movrgez	%o3,	%g5,	%i2
loop_1025:
	fcmpes	%fcc3,	%f20,	%f9
	wr	%g0,	0x81,	%asi
	lda	[%l7 + 0x08] %asi,	%f12
	tvs	%icc,	0x0
	xnor	%o4,	0x1682,	%o2
	be,a,pt	%icc,	loop_1026
	mulx	%i6,	0x0CF0,	%g2
	fornot2s	%f22,	%f27,	%f9
	mulscc	%g4,	%g6,	%i0
loop_1026:
	taddcc	%o5,	%g3,	%i7
	nop
	setx loop_1027, %l0, %l1
	jmpl %l1, %l5
	flush	%l7 + 0x24
	movne	%icc,	%o6,	%l4
	fmovsne	%xcc,	%f13,	%f0
loop_1027:
	fmovdvs	%icc,	%f27,	%f14
	fnegs	%f30,	%f16
	fmovsne	%icc,	%f9,	%f25
	fxnor	%f28,	%f8,	%f22
	fbne,a	%fcc0,	loop_1028
	addc	%i1,	%l1,	%o0
	brlz,a	%o1,	loop_1029
	movge	%xcc,	%l0,	%l3
loop_1028:
	ba	loop_1030
	bn,a,pt	%xcc,	loop_1031
loop_1029:
	sub	%o7,	%i4,	%i3
	fbe,a	%fcc1,	loop_1032
loop_1030:
	sdivx	%g7,	0x0FE0,	%g1
loop_1031:
	fpadd32	%f2,	%f8,	%f16
	add	%l7,	0x48,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%l2
	casxa	[%l6] %asi,	%l2,	%i5
loop_1032:
	movrlez	%o3,	0x0EF,	%l6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x10,	%asi
	lduha	[%l7 + 0x78] %asi,	%i2
	movcc	%icc,	%g5,	%o2
	tsubcctv	%o4,	0x1A13,	%i6
	fmovdcs	%icc,	%f13,	%f14
	movge	%xcc,	%g2,	%g4
	fbuge,a	%fcc2,	loop_1033
	fmovrsne	%g6,	%f22,	%f8
	xorcc	%o5,	%i0,	%g3
	udivx	%l5,	0x1554,	%i7
loop_1033:
	sra	%l4,	%i1,	%o6
	andn	%o0,	0x056A,	%o1
	udivx	%l1,	0x1537,	%l3
	edge8n	%o7,	%l0,	%i3
	fbo	%fcc0,	loop_1034
	movl	%xcc,	%g7,	%g1
	addc	%i4,	0x0E23,	%i5
	movvs	%xcc,	%l2,	%l6
loop_1034:
	nop
	set	0x44, %l3
	swapa	[%l7 + %l3] 0x80,	%i2
	edge8ln	%o3,	%g5,	%o2
	tsubcc	%i6,	%o4,	%g2
	fone	%f14
	fmovrsne	%g4,	%f9,	%f31
	tcc	%xcc,	0x1
	sdivx	%g6,	0x1599,	%i0
	mova	%icc,	%o5,	%g3
	or	%l5,	%l4,	%i7
	edge16ln	%i1,	%o0,	%o6
	ba,a,pt	%xcc,	loop_1035
	edge32	%l1,	%l3,	%o7
	tle	%icc,	0x4
	movn	%icc,	%o1,	%i3
loop_1035:
	fmovrdlez	%g7,	%f4,	%f30
	smul	%l0,	%i4,	%i5
	fand	%f10,	%f0,	%f4
	wr	%g0,	0x27,	%asi
	ldda	[%l7 + 0x10] %asi,	%g0
	srlx	%l2,	0x17,	%l6
	fmovdneg	%icc,	%f27,	%f30
	addcc	%i2,	0x0053,	%g5
	ldd	[%l7 + 0x38],	%f18
	fmovrdgez	%o2,	%f24,	%f2
	alignaddr	%o4,	%g2,	%g4
	stx	%o3,	[%l7 + 0x28]
	fpsub32	%f14,	%f16,	%f2
	wr	%g0,	0x04,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	movne	%xcc,	%g6,	%i0
	fxnor	%f16,	%f20,	%f16
	umul	%o5,	0x1A4F,	%l5
	tle	%xcc,	0x2
	wr	%g0,	0x19,	%asi
	lduba	[%l7 + 0x28] %asi,	%l4
	fbe,a	%fcc0,	loop_1036
	taddcc	%i7,	%g3,	%i1
	or	%o0,	%l1,	%l3
	fone	%f8
loop_1036:
	mulscc	%o6,	%o1,	%o7
	tneg	%icc,	0x7
	udivx	%g7,	0x0B42,	%i3
	taddcc	%i4,	%i5,	%g1
	orn	%l2,	0x1BD5,	%l0
	fmovsle	%icc,	%f4,	%f26
	fmovsne	%xcc,	%f23,	%f21
	sra	%l6,	0x09,	%g5
	wr	%g0,	0x89,	%asi
	ldsba	[%l7 + 0x4B] %asi,	%o2
	addc	%i2,	0x101F,	%o4
	tsubcctv	%i6,	0x1C14,	%g2
	edge8n	%o3,	%g4,	%i0
	srlx	%o5,	%l5,	%g6
	addccc	%i7,	0x14D0,	%g3
	taddcctv	%l4,	0x10A6,	%o0
	fmovrslz	%i1,	%f25,	%f30
	ble,a,pt	%xcc,	loop_1037
	te	%xcc,	0x1
	nop
	setx	loop_1038,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tpos	%xcc,	0x5
loop_1037:
	fmovdg	%icc,	%f23,	%f17
	stb	%l1,	[%l7 + 0x2F]
loop_1038:
	tle	%xcc,	0x7
	array32	%l3,	%o1,	%o6
	fsrc1	%f18,	%f20
	orn	%o7,	%g7,	%i4
	edge16ln	%i5,	%g1,	%l2
	addcc	%i3,	0x1FFD,	%l6
	subccc	%g5,	0x04A6,	%o2
	fnegd	%f16,	%f30
	movle	%xcc,	%i2,	%o4
	edge16l	%i6,	%l0,	%g2
	set	0x5B, %i5
	ldstuba	[%l7 + %i5] 0x88,	%o3
	xorcc	%i0,	0x1985,	%g4
	wr	%g0,	0x89,	%asi
	ldsha	[%l7 + 0x48] %asi,	%o5
	movrgez	%l5,	%g6,	%i7
	wr	%g0,	0x10,	%asi
	ldstuba	[%l7 + 0x17] %asi,	%l4
	fmovdle	%xcc,	%f24,	%f26
	add	%o0,	0x00B7,	%i1
	movge	%xcc,	%g3,	%l1
	movrlz	%l3,	0x186,	%o1
	fmovdg	%icc,	%f5,	%f10
	set	0x2F, %l4
	lduba	[%l7 + %l4] 0x88,	%o7
	fcmpes	%fcc1,	%f28,	%f4
	movpos	%xcc,	%o6,	%g7
	fpack16	%f30,	%f12
	taddcc	%i4,	0x1802,	%i5
	move	%icc,	%l2,	%g1
	addc	%l6,	0x0B0A,	%g5
	bne,pn	%icc,	loop_1039
	fcmpgt32	%f2,	%f8,	%i3
	xor	%i2,	0x02E0,	%o4
	tvs	%xcc,	0x7
loop_1039:
	edge8	%o2,	%i6,	%l0
	and	%g2,	0x0C5D,	%i0
	andncc	%o3,	%o5,	%l5
	umulcc	%g4,	%g6,	%i7
	brnz	%o0,	loop_1040
	xorcc	%l4,	0x131E,	%g3
	array8	%l1,	%i1,	%o1
	ldsh	[%l7 + 0x44],	%l3
loop_1040:
	tcs	%xcc,	0x7
	edge8	%o7,	%g7,	%o6
	wr	%g0,	0x04,	%asi
	stha	%i4,	[%l7 + 0x40] %asi
	fbge	%fcc1,	loop_1041
	xnorcc	%l2,	0x0312,	%g1
	nop
	setx	loop_1042,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	brlz	%l6,	loop_1043
loop_1041:
	udivx	%g5,	0x1DA8,	%i3
	udivcc	%i5,	0x0146,	%o4
loop_1042:
	fmovsg	%xcc,	%f22,	%f11
loop_1043:
	fandnot1	%f14,	%f28,	%f30
	alignaddrl	%o2,	%i2,	%i6
	set	0x20, %g1
	prefetcha	[%l7 + %g1] 0x80,	 0x3
	andn	%g2,	0x08F7,	%i0
	fbl	%fcc2,	loop_1044
	udivx	%o5,	0x0F9A,	%o3
	mulscc	%l5,	%g4,	%i7
	movl	%icc,	%o0,	%g6
loop_1044:
	fbug,a	%fcc3,	loop_1045
	fmovsn	%xcc,	%f16,	%f15
	movrlez	%l4,	0x0B0,	%g3
	fbuge	%fcc1,	loop_1046
loop_1045:
	tn	%icc,	0x3
	sll	%i1,	0x19,	%o1
	subcc	%l3,	%o7,	%g7
loop_1046:
	edge16l	%l1,	%i4,	%l2
	edge8l	%o6,	%l6,	%g1
	fblg	%fcc0,	loop_1047
	fmovdleu	%xcc,	%f1,	%f9
	addc	%g5,	0x0412,	%i5
	xor	%o4,	0x124A,	%i3
loop_1047:
	fbuge,a	%fcc2,	loop_1048
	tcc	%icc,	0x6
	sethi	0x08D5,	%o2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1048:
	andncc	%i2,	%i6,	%l0
	edge32ln	%g2,	%i0,	%o5
	sdivcc	%l5,	0x0CB9,	%o3
	fandnot2s	%f28,	%f7,	%f12
	add	%g4,	0x153D,	%o0
	udivcc	%g6,	0x12F7,	%i7
	movgu	%xcc,	%l4,	%i1
	fxor	%f30,	%f2,	%f16
	tvs	%xcc,	0x5
	tpos	%xcc,	0x5
	brz	%o1,	loop_1049
	fblg,a	%fcc0,	loop_1050
	bg,a,pn	%icc,	loop_1051
	fmovsgu	%icc,	%f31,	%f28
loop_1049:
	sdiv	%l3,	0x0619,	%o7
loop_1050:
	fandnot2s	%f10,	%f12,	%f9
loop_1051:
	fpsub32s	%f16,	%f27,	%f31
	fors	%f4,	%f6,	%f19
	fbuge	%fcc1,	loop_1052
	xnor	%g3,	0x18AA,	%g7
	array32	%l1,	%i4,	%l2
	fmovrsgz	%l6,	%f12,	%f13
loop_1052:
	sdivx	%g1,	0x0F23,	%g5
	edge32n	%o6,	%o4,	%i5
	fbn	%fcc1,	loop_1053
	fnot2	%f18,	%f4
	flush	%l7 + 0x6C
	orcc	%i3,	%i2,	%o2
loop_1053:
	fandnot2s	%f9,	%f3,	%f30
	movcs	%icc,	%l0,	%g2
	fbue,a	%fcc2,	loop_1054
	fxnor	%f30,	%f0,	%f12
	edge16l	%i0,	%o5,	%l5
	wr	%g0,	0x0c,	%asi
	stda	%i6,	[%l7 + 0x40] %asi
loop_1054:
	sra	%o3,	0x19,	%g4
	membar	0x1C
	fnot2s	%f3,	%f31
	taddcctv	%g6,	0x14A0,	%i7
	fmovse	%xcc,	%f12,	%f27
	tg	%icc,	0x5
	tn	%icc,	0x6
	subccc	%l4,	%i1,	%o1
	sethi	0x0C5F,	%l3
	alignaddrl	%o0,	%g3,	%o7
	movrne	%g7,	%l1,	%l2
	brlz	%l6,	loop_1055
	subc	%g1,	0x002E,	%g5
	edge32ln	%o6,	%i4,	%o4
	swap	[%l7 + 0x4C],	%i3
loop_1055:
	udiv	%i5,	0x1E44,	%i2
	tle	%icc,	0x5
	fmovrse	%l0,	%f25,	%f16
	fmovsgu	%xcc,	%f3,	%f2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdiv	%g2,	0x100C,	%o2
	tcc	%xcc,	0x1
	fcmpeq16	%f30,	%f8,	%i0
	mulx	%l5,	%o5,	%o3
	edge32ln	%g4,	%i6,	%g6
	tvc	%icc,	0x2
	xnorcc	%i7,	0x1964,	%i1
	ldd	[%l7 + 0x38],	%l4
	movrlz	%l3,	%o0,	%o1
	sdiv	%g3,	0x03A9,	%o7
	stbar
	xnorcc	%l1,	0x155D,	%l2
	tneg	%icc,	0x7
	xnorcc	%g7,	%l6,	%g5
	fmovdn	%icc,	%f13,	%f31
	srlx	%o6,	%g1,	%i4
	tge	%icc,	0x1
	bge,pt	%icc,	loop_1056
	tn	%xcc,	0x0
	umulcc	%o4,	%i5,	%i2
	set	0x28, %o4
	stha	%i3,	[%l7 + %o4] 0x22
	membar	#Sync
loop_1056:
	edge16l	%g2,	%l0,	%i0
	movpos	%icc,	%o2,	%o5
	fones	%f14
	sethi	0x054E,	%o3
	set	0x1C, %g6
	lduwa	[%l7 + %g6] 0x11,	%g4
	udivcc	%l5,	0x1E7A,	%i6
	andcc	%i7,	%i1,	%l4
	fbuge,a	%fcc0,	loop_1057
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmuld8ulx16	%f17,	%f21,	%f20
	fmovse	%icc,	%f31,	%f31
loop_1057:
	tvs	%xcc,	0x6
	movrgz	%l3,	0x305,	%g6
	bcc,a	loop_1058
	movne	%icc,	%o0,	%o1
	and	%o7,	0x1CFC,	%l1
	add	%g3,	0x05AF,	%l2
loop_1058:
	xorcc	%g7,	0x023E,	%l6
	edge32ln	%o6,	%g5,	%g1
	set	0x34, %o0
	ldswa	[%l7 + %o0] 0x88,	%o4
	siam	0x1
	udiv	%i5,	0x07A7,	%i2
	fba	%fcc3,	loop_1059
	ble,pn	%icc,	loop_1060
	movcc	%xcc,	%i4,	%i3
	fbuge	%fcc1,	loop_1061
loop_1059:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1060:
	fmovspos	%icc,	%f12,	%f3
	set	0x16, %g2
	lduha	[%l7 + %g2] 0x10,	%l0
loop_1061:
	movrlz	%i0,	%g2,	%o2
	sllx	%o5,	%g4,	%l5
	bcs,a,pt	%icc,	loop_1062
	movleu	%icc,	%o3,	%i6
	edge8l	%i7,	%i1,	%l3
	smulcc	%l4,	0x0F64,	%g6
loop_1062:
	bge,pn	%icc,	loop_1063
	movvc	%icc,	%o1,	%o0
	membar	0x73
	fmovspos	%xcc,	%f0,	%f0
loop_1063:
	array8	%l1,	%o7,	%g3
	nop
	set	0x33, %i0
	ldstub	[%l7 + %i0],	%g7
	movvs	%xcc,	%l2,	%o6
	fzero	%f10
	fmovsvc	%xcc,	%f28,	%f7
	bpos,a,pn	%icc,	loop_1064
	tneg	%xcc,	0x2
	set	0x40, %i4
	stwa	%l6,	[%l7 + %i4] 0x81
loop_1064:
	andncc	%g1,	%g5,	%i5
	tl	%xcc,	0x7
	tne	%xcc,	0x5
	tg	%icc,	0x7
	popc	0x093B,	%o4
	fandnot1s	%f23,	%f29,	%f10
	sub	%i2,	%i3,	%i4
	smulcc	%l0,	0x08CE,	%g2
	alignaddrl	%o2,	%o5,	%i0
	bvs,a,pn	%icc,	loop_1065
	fmovdn	%icc,	%f15,	%f11
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdivcc	%g4,	0x02DC,	%o3
loop_1065:
	fba,a	%fcc1,	loop_1066
	addccc	%l5,	%i6,	%i1
	alignaddrl	%i7,	%l4,	%l3
	edge32n	%o1,	%g6,	%o0
loop_1066:
	tsubcc	%o7,	%l1,	%g7
	xnorcc	%l2,	%g3,	%l6
	array8	%g1,	%g5,	%o6
	set	0x26, %o3
	lduha	[%l7 + %o3] 0x89,	%i5
	andcc	%o4,	%i2,	%i3
	brgez	%l0,	loop_1067
	edge16l	%i4,	%o2,	%g2
	edge16ln	%o5,	%i0,	%g4
	ldsb	[%l7 + 0x68],	%o3
loop_1067:
	andcc	%l5,	%i1,	%i6
	sub	%i7,	%l4,	%o1
	fmovdne	%xcc,	%f23,	%f22
	fcmple16	%f2,	%f30,	%l3
	fbuge,a	%fcc0,	loop_1068
	movre	%g6,	%o0,	%l1
	bg	%icc,	loop_1069
	fmovd	%f2,	%f12
loop_1068:
	fbge	%fcc1,	loop_1070
	fcmple32	%f6,	%f30,	%o7
loop_1069:
	tne	%xcc,	0x5
	alignaddrl	%g7,	%g3,	%l6
loop_1070:
	bneg,pt	%xcc,	loop_1071
	or	%g1,	0x0136,	%l2
	bvs,a,pt	%icc,	loop_1072
	sth	%g5,	[%l7 + 0x3C]
loop_1071:
	sllx	%i5,	0x18,	%o4
	fmovdneg	%icc,	%f7,	%f7
loop_1072:
	nop
	wr	%g0,	0x88,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	wr	%g0,	0x5f,	%asi
	stxa	%i2,	[%g0 + 0x0] %asi
	prefetch	[%l7 + 0x40],	 0x0
	edge8l	%o6,	%l0,	%i3
	fzero	%f12
	ldsh	[%l7 + 0x36],	%o2
	fmovrdlez	%g2,	%f30,	%f16
	tgu	%icc,	0x3
	bleu,a,pn	%xcc,	loop_1073
	fzero	%f14
	fble	%fcc0,	loop_1074
	movrlz	%i4,	%o5,	%g4
loop_1073:
	movcc	%xcc,	%i0,	%l5
	sllx	%i1,	0x1F,	%o3
loop_1074:
	fbe,a	%fcc2,	loop_1075
	fmul8sux16	%f12,	%f22,	%f0
	bne,a	loop_1076
	st	%f28,	[%l7 + 0x68]
loop_1075:
	smul	%i6,	0x0103,	%l4
	stb	%i7,	[%l7 + 0x13]
loop_1076:
	movcc	%icc,	%l3,	%g6
	edge8ln	%o1,	%o0,	%l1
	udivx	%g7,	0x0D5E,	%g3
	edge32l	%o7,	%l6,	%g1
	fbn,a	%fcc2,	loop_1077
	lduw	[%l7 + 0x40],	%l2
	tge	%icc,	0x4
	alignaddr	%g5,	%o4,	%i2
loop_1077:
	edge16ln	%o6,	%i5,	%i3
	tl	%xcc,	0x1
	fmuld8ulx16	%f25,	%f12,	%f26
	ld	[%l7 + 0x08],	%f7
	movpos	%icc,	%o2,	%g2
	nop
	setx loop_1078, %l0, %l1
	jmpl %l1, %i4
	andn	%l0,	%g4,	%i0
	be,a	loop_1079
	addccc	%l5,	%o5,	%o3
loop_1078:
	tl	%icc,	0x5
	sir	0x12A4
loop_1079:
	nop
	setx	loop_1080,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	bge,a	%xcc,	loop_1081
	movleu	%xcc,	%i6,	%i1
	st	%f21,	[%l7 + 0x0C]
loop_1080:
	fpack32	%f16,	%f6,	%f4
loop_1081:
	addc	%l4,	0x09EE,	%l3
	fbug	%fcc2,	loop_1082
	fmovrsne	%i7,	%f3,	%f5
	tsubcc	%g6,	0x0E30,	%o1
	xor	%o0,	%g7,	%l1
loop_1082:
	movre	%g3,	0x0E8,	%l6
	fsrc2	%f28,	%f2
	xor	%g1,	%o7,	%g5
	std	%f28,	[%l7 + 0x38]
	sub	%l2,	%i2,	%o4
	set	0x0A, %l5
	ldstuba	[%l7 + %l5] 0x04,	%i5
	sethi	0x0883,	%i3
	be,a,pt	%icc,	loop_1083
	fpsub16	%f30,	%f24,	%f20
	bvc	%xcc,	loop_1084
	udivcc	%o2,	0x1460,	%o6
loop_1083:
	add	%g2,	0x15AE,	%l0
	and	%i4,	%i0,	%l5
loop_1084:
	movrlez	%g4,	0x3F6,	%o5
	movg	%icc,	%o3,	%i6
	fpsub32	%f6,	%f12,	%f2
	fmovdleu	%xcc,	%f14,	%f14
	mulx	%l4,	0x19FE,	%l3
	andn	%i7,	0x0486,	%i1
	movrgez	%g6,	%o1,	%g7
	ble,a	%icc,	loop_1085
	fmovd	%f28,	%f20
	subccc	%o0,	%l1,	%g3
	bgu,a	loop_1086
loop_1085:
	fmovsge	%icc,	%f19,	%f18
	ta	%xcc,	0x7
	edge32n	%l6,	%g1,	%o7
loop_1086:
	fcmpes	%fcc2,	%f27,	%f10
	sethi	0x1B53,	%g5
	movcs	%xcc,	%i2,	%o4
	te	%icc,	0x0
	set	0x50, %i2
	stwa	%l2,	[%l7 + %i2] 0x80
	sra	%i5,	0x01,	%i3
	fmul8sux16	%f12,	%f4,	%f14
	or	%o2,	0x0022,	%o6
	movrne	%l0,	%i4,	%i0
	set	0x68, %g5
	stda	%g2,	[%l7 + %g5] 0x23
	membar	#Sync
	movrgz	%l5,	%o5,	%o3
	fpsub32	%f12,	%f26,	%f0
	fmovdcs	%xcc,	%f31,	%f30
	tneg	%icc,	0x6
	fmovsle	%xcc,	%f22,	%f21
	subccc	%g4,	%i6,	%l4
	tne	%icc,	0x7
	array16	%l3,	%i1,	%g6
	tl	%icc,	0x3
	ldub	[%l7 + 0x59],	%o1
	fpackfix	%f12,	%f21
	tsubcctv	%g7,	%i7,	%l1
	movvc	%xcc,	%o0,	%l6
	ble	%xcc,	loop_1087
	tcs	%icc,	0x3
	fbo,a	%fcc1,	loop_1088
	movrgz	%g1,	%g3,	%g5
loop_1087:
	nop
	set	0x78, %l1
	stwa	%o7,	[%l7 + %l1] 0x2f
	membar	#Sync
loop_1088:
	nop
	setx	loop_1089,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tpos	%xcc,	0x3
	fmovrslz	%i2,	%f31,	%f4
	sllx	%o4,	%l2,	%i3
loop_1089:
	xnor	%o2,	%i5,	%l0
	movn	%icc,	%o6,	%i4
	bvs	%xcc,	loop_1090
	fmovsne	%icc,	%f27,	%f27
	subccc	%g2,	0x0726,	%i0
	srlx	%o5,	%l5,	%g4
loop_1090:
	brgz,a	%o3,	loop_1091
	nop
	setx	loop_1092,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fcmpgt32	%f28,	%f8,	%l4
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
loop_1091:
	subc	%l3,	0x04B5,	%i6
loop_1092:
	and	%g6,	%o1,	%g7
	movgu	%xcc,	%i7,	%l1
loop_1093:
	movrne	%o0,	0x317,	%i1
	movg	%icc,	%g1,	%l6
	movleu	%xcc,	%g3,	%g5
	edge16l	%o7,	%i2,	%o4
	edge16n	%l2,	%i3,	%o2
	sir	0x14AB
	movre	%l0,	0x230,	%o6
	srax	%i5,	0x01,	%g2
	addc	%i0,	0x085E,	%i4
	sdivcc	%o5,	0x1699,	%l5
	fornot1	%f4,	%f30,	%f4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addccc	%o3,	0x1D8C,	%g4
	brgz	%l4,	loop_1094
	fpadd32	%f22,	%f2,	%f28
	set	0x328, %i1
	nop 	! 	nop 	! 	ldxa	[%g0 + %i1] 0x40,	%i6 ripped by fixASI40.pl ripped by fixASI40.pl
loop_1094:
	sll	%g6,	%o1,	%g7
	tge	%icc,	0x3
	tpos	%xcc,	0x0
	bshuffle	%f4,	%f28,	%f4
	bn,a,pt	%icc,	loop_1095
	ble	loop_1096
	udiv	%l3,	0x06BD,	%i7
	edge8n	%l1,	%i1,	%g1
loop_1095:
	array8	%l6,	%o0,	%g3
loop_1096:
	movge	%xcc,	%g5,	%o7
	fones	%f16
	srlx	%i2,	%l2,	%o4
	fmovrdne	%o2,	%f10,	%f14
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
	xor	%i3,	0x1B42,	%o6
	udivx	%i5,	0x162D,	%l0
	bg,a,pt	%icc,	loop_1098
loop_1097:
	movrgz	%g2,	0x31D,	%i4
	sll	%o5,	0x05,	%i0
	fbuge	%fcc2,	loop_1099
loop_1098:
	tsubcc	%o3,	0x022B,	%g4
	fcmpne16	%f16,	%f8,	%l4
	movcs	%xcc,	%l5,	%i6
loop_1099:
	array32	%o1,	%g6,	%l3
	swap	[%l7 + 0x08],	%i7
	swap	[%l7 + 0x64],	%l1
	fmovdle	%xcc,	%f28,	%f2
	be,a,pt	%icc,	loop_1100
	movrne	%i1,	%g1,	%g7
	nop
	set	0x18, %l0
	stw	%o0,	[%l7 + %l0]
	tg	%xcc,	0x1
loop_1100:
	edge32n	%l6,	%g3,	%g5
	fandnot1s	%f24,	%f12,	%f19
	fmovsgu	%icc,	%f30,	%f28
	array8	%i2,	%o7,	%l2
	set	0x68, %i7
	swapa	[%l7 + %i7] 0x81,	%o2
	movre	%o4,	0x0FD,	%o6
	andcc	%i5,	%i3,	%g2
	bne,a,pn	%icc,	loop_1101
	ble,a,pt	%xcc,	loop_1102
	edge16l	%i4,	%o5,	%l0
	ldsb	[%l7 + 0x76],	%i0
loop_1101:
	popc	0x1762,	%o3
loop_1102:
	nop
	wr	%g0,	0x19,	%asi
	stba	%l4,	[%l7 + 0x19] %asi
	movneg	%icc,	%l5,	%i6
	fsrc2s	%f26,	%f13
	fmovd	%f22,	%f16
	fbuge,a	%fcc3,	loop_1103
	xor	%o1,	%g4,	%g6
	andcc	%l3,	0x1CC5,	%l1
	smul	%i7,	%i1,	%g1
loop_1103:
	sub	%g7,	0x1FA9,	%o0
	addcc	%g3,	0x02E5,	%l6
	fnegs	%f16,	%f0
	xnorcc	%i2,	%g5,	%o7
	udivx	%o2,	0x0135,	%o4
	bvs,pn	%xcc,	loop_1104
	sir	0x05AC
	alignaddrl	%o6,	%i5,	%i3
	srlx	%l2,	0x08,	%i4
loop_1104:
	movle	%icc,	%o5,	%l0
	set	0x40, %i6
	ldda	[%l7 + %i6] 0x89,	%f16
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fornot2	%f10,	%f26,	%f12
	fandnot2	%f12,	%f18,	%f26
	brgz,a	%g2,	loop_1105
	edge32l	%i0,	%l4,	%l5
	fble,a	%fcc1,	loop_1106
	subcc	%i6,	%o1,	%g4
loop_1105:
	bvs	%xcc,	loop_1107
	xorcc	%o3,	%g6,	%l1
loop_1106:
	sdiv	%i7,	0x1967,	%i1
	edge8ln	%l3,	%g7,	%g1
loop_1107:
	srax	%o0,	0x06,	%g3
	mulx	%l6,	%i2,	%g5
	addc	%o7,	%o4,	%o2
	tle	%icc,	0x0
	fsrc2	%f16,	%f28
	popc	%o6,	%i3
	ldx	[%l7 + 0x30],	%i5
	andcc	%l2,	0x1C5F,	%o5
	bcc,a	%xcc,	loop_1108
	addc	%i4,	0x1D03,	%g2
	fpsub32	%f14,	%f16,	%f28
	siam	0x5
loop_1108:
	nop
	wr	%g0,	0x89,	%asi
	ldxa	[%l7 + 0x70] %asi,	%i0
	tpos	%xcc,	0x4
	tn	%xcc,	0x6
	sir	0x0CF1
	tn	%icc,	0x2
	orn	%l0,	%l4,	%i6
	tn	%xcc,	0x5
	orncc	%o1,	%g4,	%o3
	andcc	%l5,	0x0E37,	%g6
	subc	%i7,	0x0DBA,	%i1
	popc	%l1,	%l3
	fmovdneg	%xcc,	%f3,	%f14
	bvc,a	%icc,	loop_1109
	and	%g7,	0x15D7,	%o0
	fmul8x16al	%f8,	%f3,	%f26
	fsrc1s	%f4,	%f6
loop_1109:
	alignaddrl	%g1,	%g3,	%l6
	bneg,pt	%xcc,	loop_1110
	tl	%xcc,	0x6
	edge16n	%i2,	%g5,	%o7
	membar	0x08
loop_1110:
	srl	%o4,	%o6,	%i3
	tneg	%icc,	0x7
	prefetch	[%l7 + 0x4C],	 0x2
	subc	%o2,	0x13D8,	%l2
	subcc	%o5,	%i5,	%g2
	smul	%i4,	%l0,	%i0
	wr	%g0,	0x10,	%asi
	stwa	%i6,	[%l7 + 0x4C] %asi
	fmuld8sux16	%f31,	%f27,	%f28
	move	%xcc,	%l4,	%o1
	fbl,a	%fcc0,	loop_1111
	brnz,a	%o3,	loop_1112
	fmovrdlez	%l5,	%f20,	%f4
	or	%g6,	%g4,	%i7
loop_1111:
	prefetch	[%l7 + 0x18],	 0x1
loop_1112:
	fabsd	%f18,	%f4
	movg	%icc,	%l1,	%l3
	sdivcc	%g7,	0x07E6,	%i1
	fand	%f10,	%f12,	%f20
	array16	%o0,	%g3,	%g1
	fbge	%fcc0,	loop_1113
	movre	%i2,	0x3FD,	%l6
	subcc	%o7,	0x1DE7,	%g5
	movn	%icc,	%o4,	%o6
loop_1113:
	edge16n	%i3,	%o2,	%o5
	fmul8sux16	%f0,	%f6,	%f24
	fcmpne16	%f20,	%f24,	%i5
	edge16n	%g2,	%i4,	%l2
	edge8n	%i0,	%i6,	%l0
	fmovdl	%xcc,	%f27,	%f12
	sir	0x13EF
	fmovdneg	%xcc,	%f30,	%f6
	stb	%o1,	[%l7 + 0x4F]
	nop
	setx loop_1114, %l0, %l1
	jmpl %l1, %l4
	te	%icc,	0x4
	bge,pt	%icc,	loop_1115
	lduh	[%l7 + 0x0E],	%l5
loop_1114:
	fbo	%fcc0,	loop_1116
	tn	%xcc,	0x6
loop_1115:
	sub	%g6,	0x177B,	%g4
	brgez,a	%o3,	loop_1117
loop_1116:
	stx	%l1,	[%l7 + 0x78]
	movge	%icc,	%i7,	%g7
	movle	%icc,	%i1,	%o0
loop_1117:
	addccc	%g3,	%l3,	%g1
	move	%xcc,	%i2,	%l6
	subccc	%g5,	0x1F80,	%o7
	and	%o6,	%o4,	%o2
	tle	%xcc,	0x2
	andncc	%o5,	%i3,	%i5
	fnot2s	%f19,	%f23
	fpackfix	%f8,	%f11
	move	%icc,	%i4,	%l2
	wr	%g0,	0x10,	%asi
	ldswa	[%l7 + 0x64] %asi,	%g2
	edge16ln	%i0,	%i6,	%o1
	movcc	%xcc,	%l0,	%l4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32n	%l5,	%g6,	%g4
	movcc	%icc,	%l1,	%i7
	movcs	%icc,	%o3,	%g7
	udivx	%o0,	0x1CD9,	%g3
	tvs	%icc,	0x0
	movcc	%xcc,	%i1,	%l3
	bcc,pt	%icc,	loop_1118
	flush	%l7 + 0x24
	fbge	%fcc1,	loop_1119
	fmovrdlez	%i2,	%f0,	%f8
loop_1118:
	fones	%f1
	tgu	%icc,	0x0
loop_1119:
	fabsd	%f2,	%f10
	movrlez	%g1,	%l6,	%g5
	wr	%g0,	0x11,	%asi
	lduha	[%l7 + 0x68] %asi,	%o7
	fmovrse	%o4,	%f12,	%f17
	set	0x33, %g4
	lduba	[%l7 + %g4] 0x0c,	%o2
	srl	%o6,	0x1F,	%i3
	add	%l7,	0x28,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%o5
	casxa	[%l6] %asi,	%o5,	%i4
	array32	%i5,	%l2,	%i0
	andn	%i6,	%o1,	%g2
	movgu	%xcc,	%l4,	%l5
	tsubcctv	%l0,	0x0578,	%g4
	movrgz	%g6,	%i7,	%l1
	add	%o3,	0x047B,	%g7
	fmovdpos	%icc,	%f18,	%f21
	bl,pt	%icc,	loop_1120
	ldsw	[%l7 + 0x18],	%g3
	popc	0x0736,	%o0
	fmovde	%xcc,	%f23,	%f13
loop_1120:
	movcc	%icc,	%l3,	%i2
	fmovrdne	%i1,	%f20,	%f20
	udivcc	%g1,	0x100B,	%l6
	fble,a	%fcc0,	loop_1121
	fmovdgu	%xcc,	%f23,	%f6
	fbl,a	%fcc2,	loop_1122
	movrlz	%g5,	%o7,	%o2
loop_1121:
	fmovdcs	%icc,	%f31,	%f28
	movneg	%xcc,	%o6,	%i3
loop_1122:
	ldstub	[%l7 + 0x1D],	%o4
	fornot2	%f12,	%f20,	%f30
	set	0x3E, %o2
	lduha	[%l7 + %o2] 0x19,	%o5
	edge8ln	%i5,	%i4,	%i0
	movvc	%icc,	%i6,	%l2
	add	%g2,	0x0073,	%o1
	set	0x40, %i3
	stda	%f0,	[%l7 + %i3] 0x1f
	membar	#Sync
	xorcc	%l5,	0x1373,	%l4
	edge32l	%g4,	%g6,	%l0
	tg	%icc,	0x2
	nop
	setx loop_1123, %l0, %l1
	jmpl %l1, %l1
	srl	%o3,	%g7,	%g3
	tle	%xcc,	0x6
	alignaddr	%o0,	%l3,	%i7
loop_1123:
	edge32	%i1,	%g1,	%l6
	fones	%f5
	tle	%xcc,	0x0
	set	0x6C, %l6
	swapa	[%l7 + %l6] 0x81,	%i2
	movneg	%icc,	%g5,	%o7
	umul	%o6,	%i3,	%o2
	fmovsg	%xcc,	%f22,	%f31
	mova	%icc,	%o5,	%i5
	ldsh	[%l7 + 0x5A],	%o4
	prefetch	[%l7 + 0x0C],	 0x0
	fmovdvc	%icc,	%f24,	%f11
	fpadd32s	%f19,	%f12,	%f17
	movle	%icc,	%i0,	%i6
	xorcc	%i4,	%l2,	%o1
	movle	%xcc,	%g2,	%l4
	fmuld8sux16	%f3,	%f9,	%f26
	nop
	set	0x40, %o5
	ldx	[%l7 + %o5],	%g4
	fpadd32	%f14,	%f20,	%f6
	brlez,a	%l5,	loop_1124
	edge32n	%g6,	%l0,	%o3
	alignaddrl	%g7,	%l1,	%g3
	xorcc	%l3,	0x19F2,	%o0
loop_1124:
	sdiv	%i1,	0x1B41,	%i7
	movcs	%xcc,	%l6,	%g1
	fone	%f0
	fmovsleu	%xcc,	%f14,	%f9
	brgez	%g5,	loop_1125
	movpos	%xcc,	%o7,	%i2
	fmovse	%icc,	%f16,	%f5
	tsubcc	%i3,	%o6,	%o2
loop_1125:
	movrgez	%i5,	0x13C,	%o4
	tsubcc	%o5,	0x1CF3,	%i6
	or	%i4,	0x083E,	%i0
	fmovdneg	%xcc,	%f8,	%f18
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fand	%f14,	%f18,	%f12
	fba	%fcc2,	loop_1126
	tsubcc	%l2,	0x1CCD,	%g2
	subcc	%l4,	%o1,	%g4
	sdivx	%l5,	0x1622,	%l0
loop_1126:
	sth	%o3,	[%l7 + 0x2E]
	mulscc	%g7,	0x1F38,	%g6
	edge32	%g3,	%l1,	%l3
	fbo	%fcc0,	loop_1127
	nop
	setx	loop_1128,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movrgz	%o0,	0x0AF,	%i1
	bg	loop_1129
loop_1127:
	movneg	%icc,	%i7,	%l6
loop_1128:
	tl	%icc,	0x2
	taddcc	%g1,	0x036B,	%o7
loop_1129:
	mova	%icc,	%i2,	%i3
	srl	%g5,	%o6,	%o2
	ld	[%l7 + 0x14],	%f11
	bneg,a,pn	%icc,	loop_1130
	bgu,a	loop_1131
	add	%o4,	0x1BB9,	%i5
	nop
	setx loop_1132, %l0, %l1
	jmpl %l1, %i6
loop_1130:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1131:
	sllx	%o5,	%i0,	%l2
	fbuge,a	%fcc3,	loop_1133
loop_1132:
	sth	%g2,	[%l7 + 0x58]
	fbo	%fcc3,	loop_1134
	subcc	%i4,	0x134C,	%l4
loop_1133:
	tcc	%icc,	0x3
	fbl	%fcc2,	loop_1135
loop_1134:
	fmovrdgz	%o1,	%f24,	%f22
	edge32n	%l5,	%l0,	%o3
	fnegd	%f24,	%f24
loop_1135:
	or	%g7,	%g6,	%g3
	nop
	setx	loop_1136,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fexpand	%f22,	%f14
	set	0x44, %o6
	swapa	[%l7 + %o6] 0x88,	%g4
loop_1136:
	edge8ln	%l3,	%l1,	%o0
	stw	%i1,	[%l7 + 0x3C]
	bgu	%icc,	loop_1137
	ldd	[%l7 + 0x30],	%i6
	std	%f10,	[%l7 + 0x30]
	wr	%g0,	0x89,	%asi
	lduwa	[%l7 + 0x7C] %asi,	%i7
loop_1137:
	fsrc2	%f12,	%f18
	membar	0x41
	tle	%icc,	0x7
	fpmerge	%f20,	%f7,	%f12
	or	%o7,	0x0BB5,	%g1
	movcs	%xcc,	%i2,	%g5
	edge8ln	%o6,	%o2,	%i3
	sdivcc	%o4,	0x0EB1,	%i5
	movcc	%xcc,	%i6,	%o5
	fcmpd	%fcc0,	%f22,	%f16
	bgu,a	%icc,	loop_1138
	movgu	%icc,	%l2,	%g2
	brnz,a	%i0,	loop_1139
	fabss	%f26,	%f17
loop_1138:
	alignaddrl	%i4,	%l4,	%o1
	sir	0x1B2C
loop_1139:
	movvs	%icc,	%l5,	%l0
	sub	%g7,	%g6,	%o3
	add	%l7,	0x78,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%g3,	%l3
	ldd	[%l7 + 0x40],	%f10
	fcmps	%fcc2,	%f11,	%f8
	fornot1s	%f4,	%f10,	%f31
	edge16	%l1,	%o0,	%i1
	udivcc	%l6,	0x1CC7,	%g4
	brlz	%i7,	loop_1140
	stb	%g1,	[%l7 + 0x45]
	movrlz	%o7,	%i2,	%g5
	brz,a	%o6,	loop_1141
loop_1140:
	ld	[%l7 + 0x5C],	%f13
	movvc	%xcc,	%i3,	%o4
	fmovdg	%icc,	%f11,	%f27
loop_1141:
	edge8ln	%o2,	%i6,	%i5
	fnands	%f28,	%f8,	%f27
	movrne	%o5,	0x2DF,	%l2
	wr	%g0,	0x04,	%asi
	ldxa	[%l7 + 0x50] %asi,	%i0
	movcs	%icc,	%i4,	%g2
	movne	%icc,	%o1,	%l5
	udiv	%l4,	0x12DE,	%l0
	srax	%g7,	0x02,	%o3
	movrlz	%g3,	%l3,	%g6
	fpadd16s	%f8,	%f6,	%f21
	swap	[%l7 + 0x24],	%o0
	fbug	%fcc1,	loop_1142
	mulscc	%l1,	%l6,	%g4
	wr	%g0,	0x19,	%asi
	lduha	[%l7 + 0x20] %asi,	%i7
loop_1142:
	orn	%i1,	%g1,	%o7
	tsubcctv	%i2,	0x0C63,	%g5
	edge8l	%i3,	%o6,	%o2
	fnand	%f16,	%f0,	%f4
	edge32ln	%o4,	%i5,	%o5
	fmovrslez	%l2,	%f20,	%f29
	sll	%i0,	%i4,	%g2
	fandnot2s	%f8,	%f12,	%f24
	popc	0x0C31,	%o1
	orcc	%l5,	0x11EA,	%i6
	fexpand	%f13,	%f14
	fcmped	%fcc0,	%f26,	%f8
	fbuge,a	%fcc1,	loop_1143
	nop
	set	0x2F, %g7
	ldub	[%l7 + %g7],	%l4
	edge8	%g7,	%o3,	%g3
	edge32n	%l3,	%l0,	%o0
loop_1143:
	movl	%xcc,	%l1,	%g6
	sdivcc	%l6,	0x1E43,	%i7
	swap	[%l7 + 0x40],	%i1
	movpos	%icc,	%g4,	%g1
	xnorcc	%i2,	0x1226,	%g5
	fba,a	%fcc0,	loop_1144
	fmovsl	%xcc,	%f12,	%f3
	fmovrdlez	%i3,	%f18,	%f8
	fmovsvs	%xcc,	%f2,	%f2
loop_1144:
	fornot1	%f10,	%f28,	%f12
	addcc	%o7,	%o6,	%o2
	fbul,a	%fcc2,	loop_1145
	bvs,a,pn	%icc,	loop_1146
	fmovdleu	%icc,	%f17,	%f8
	movle	%icc,	%i5,	%o5
loop_1145:
	mova	%xcc,	%l2,	%o4
loop_1146:
	fbue,a	%fcc1,	loop_1147
	orn	%i4,	0x1BFF,	%i0
	fmovde	%icc,	%f8,	%f3
	wr	%g0,	0x2a,	%asi
	stda	%o0,	[%l7 + 0x70] %asi
	membar	#Sync
loop_1147:
	popc	%l5,	%g2
	movre	%l4,	0x3AF,	%i6
	tvc	%xcc,	0x5
	udiv	%g7,	0x035D,	%o3
	movleu	%xcc,	%g3,	%l0
	fcmpeq16	%f22,	%f26,	%o0
	edge8ln	%l3,	%g6,	%l6
	mulscc	%i7,	%i1,	%g4
	addcc	%g1,	0x0B3D,	%l1
	nop
	setx	loop_1148,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	mova	%icc,	%i2,	%i3
	ldsb	[%l7 + 0x4A],	%o7
	edge8	%o6,	%g5,	%i5
loop_1148:
	fmovsa	%xcc,	%f7,	%f7
	ldstub	[%l7 + 0x6E],	%o2
	bshuffle	%f6,	%f18,	%f16
	fmuld8ulx16	%f1,	%f19,	%f26
	tgu	%xcc,	0x0
	alignaddrl	%l2,	%o4,	%i4
	movrlez	%i0,	0x0A6,	%o1
	sir	0x1502
	srl	%l5,	0x1E,	%g2
	te	%xcc,	0x3
	set	0x57, %l2
	stba	%l4,	[%l7 + %l2] 0x88
	brgez	%o5,	loop_1149
	sdivcc	%g7,	0x10C9,	%i6
	alignaddr	%g3,	%o3,	%o0
	bpos,a,pn	%icc,	loop_1150
loop_1149:
	xor	%l3,	0x123F,	%l0
	movrlz	%g6,	%i7,	%i1
	subccc	%l6,	%g4,	%g1
loop_1150:
	brlz,a	%l1,	loop_1151
	movrlez	%i3,	0x22B,	%o7
	srax	%i2,	%g5,	%i5
	tne	%xcc,	0x6
loop_1151:
	bge,pt	%icc,	loop_1152
	udiv	%o2,	0x0365,	%o6
	nop
	set	0x0E, %o7
	ldsh	[%l7 + %o7],	%l2
	ldx	[%l7 + 0x78],	%o4
loop_1152:
	edge8n	%i0,	%o1,	%l5
	sllx	%g2,	0x1A,	%i4
	srl	%l4,	0x1D,	%g7
	orncc	%o5,	0x00EE,	%i6
	smulcc	%g3,	0x1E7C,	%o0
	siam	0x7
	tsubcctv	%o3,	%l3,	%l0
	movcc	%icc,	%g6,	%i7
	tsubcc	%l6,	%g4,	%i1
	subc	%g1,	%l1,	%o7
	sdivcc	%i2,	0x0039,	%i3
	fpadd16s	%f5,	%f0,	%f19
	fbuge	%fcc0,	loop_1153
	movg	%xcc,	%g5,	%i5
	edge32l	%o2,	%l2,	%o4
	ta	%icc,	0x6
loop_1153:
	fpadd16s	%f8,	%f20,	%f19
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udivcc	%o6,	0x072F,	%o1
	lduh	[%l7 + 0x1E],	%l5
	ba	%xcc,	loop_1154
	flush	%l7 + 0x48
	movcs	%icc,	%i0,	%g2
	taddcc	%l4,	%i4,	%o5
loop_1154:
	fcmple32	%f4,	%f8,	%g7
	edge16	%g3,	%o0,	%i6
	tvs	%icc,	0x6
	wr	%g0,	0x88,	%asi
	swapa	[%l7 + 0x34] %asi,	%l3
	add	%l0,	%g6,	%i7
	orncc	%o3,	0x106D,	%l6
	taddcctv	%g4,	0x0539,	%g1
	fcmped	%fcc3,	%f22,	%f26
	sethi	0x15FF,	%l1
	movrlez	%i1,	%o7,	%i2
	alignaddrl	%g5,	%i3,	%o2
	set	0x74, %g3
	swapa	[%l7 + %g3] 0x19,	%l2
	wr	%g0,	0x89,	%asi
	lduha	[%l7 + 0x44] %asi,	%i5
	andn	%o4,	%o6,	%o1
	tsubcctv	%l5,	0x0B93,	%i0
	srlx	%l4,	%g2,	%i4
	membar	0x12
	orcc	%g7,	%o5,	%g3
	ldsh	[%l7 + 0x32],	%i6
	movrgez	%l3,	0x1DE,	%l0
	ta	%xcc,	0x4
	fmuld8ulx16	%f16,	%f3,	%f16
	tsubcctv	%g6,	%i7,	%o3
	set	0x7C, %l3
	sta	%f20,	[%l7 + %l3] 0x0c
	lduh	[%l7 + 0x4C],	%o0
	ldsb	[%l7 + 0x30],	%g4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8n	%l6,	%g1,	%i1
	brnz,a	%o7,	loop_1155
	sllx	%i2,	0x01,	%g5
	movle	%xcc,	%l1,	%i3
	for	%f4,	%f0,	%f2
loop_1155:
	umul	%o2,	0x030A,	%l2
	fbug,a	%fcc0,	loop_1156
	array8	%i5,	%o6,	%o1
	membar	#Sync
	wr	%g0,	0xf1,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
loop_1156:
	fornot2s	%f23,	%f9,	%f29
	add	%l7,	0x6C,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%l5
	casa	[%l6] %asi,	%l5,	%i0
	ldstub	[%l7 + 0x20],	%o4
	movn	%icc,	%l4,	%g2
	fxors	%f19,	%f13,	%f5
	movre	%g7,	%i4,	%o5
	wr	%g0,	0x18,	%asi
	lda	[%l7 + 0x50] %asi,	%f30
	edge16ln	%g3,	%l3,	%i6
	fmovdcc	%icc,	%f13,	%f27
	fbo,a	%fcc0,	loop_1157
	fpack32	%f10,	%f10,	%f20
	fbue,a	%fcc0,	loop_1158
	edge16n	%g6,	%i7,	%l0
loop_1157:
	orn	%o0,	0x00B6,	%o3
	set	0x48, %o1
	ldsha	[%l7 + %o1] 0x04,	%g4
loop_1158:
	ta	%icc,	0x7
	fornot2s	%f13,	%f25,	%f14
	movpos	%icc,	%g1,	%i1
	mulscc	%o7,	0x0DD1,	%i2
	nop
	set	0x40, %l4
	ldd	[%l7 + %l4],	%f12
	fpackfix	%f30,	%f23
	fpsub16s	%f29,	%f31,	%f27
	subcc	%g5,	0x031A,	%l6
	add	%l7,	0x28,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%i3
	casxa	[%l6] 0x89,	%i3,	%l1
	srl	%o2,	%i5,	%l2
	sir	0x1EC4
	fbul,a	%fcc0,	loop_1159
	fmovrsgez	%o1,	%f17,	%f28
	edge32	%l5,	%o6,	%i0
	membar	0x69
loop_1159:
	movrgz	%l4,	0x260,	%g2
	fmovdg	%icc,	%f27,	%f29
	mulx	%o4,	%g7,	%i4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8ln	%g3,	%l3,	%o5
	movvs	%icc,	%g6,	%i7
	fmovdne	%icc,	%f0,	%f17
	fpsub16s	%f0,	%f14,	%f9
	set	0x2E, %i5
	stba	%l0,	[%l7 + %i5] 0xe2
	membar	#Sync
	tle	%icc,	0x5
	tpos	%xcc,	0x0
	fmul8ulx16	%f14,	%f18,	%f30
	fxnor	%f8,	%f30,	%f8
	membar	0x02
	wr	%g0,	0x11,	%asi
	lda	[%l7 + 0x70] %asi,	%f11
	ldsw	[%l7 + 0x28],	%o0
	fmul8ulx16	%f2,	%f6,	%f18
	tsubcc	%i6,	%o3,	%g1
	movre	%g4,	0x041,	%o7
	addcc	%i2,	%g5,	%l6
	tcc	%xcc,	0x2
	brz	%i3,	loop_1160
	add	%i1,	%o2,	%l1
	wr	%g0,	0x19,	%asi
	sta	%f27,	[%l7 + 0x34] %asi
loop_1160:
	fbge,a	%fcc3,	loop_1161
	fcmple32	%f4,	%f18,	%l2
	movvs	%xcc,	%i5,	%l5
	bn,a,pn	%icc,	loop_1162
loop_1161:
	te	%icc,	0x3
	edge8n	%o6,	%o1,	%l4
	wr	%g0,	0x11,	%asi
	swapa	[%l7 + 0x1C] %asi,	%i0
loop_1162:
	sub	%g2,	0x039B,	%g7
	tvs	%icc,	0x7
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x34] %asi,	%i4
	tneg	%icc,	0x6
	smulcc	%o4,	0x19E6,	%g3
	fmovrsgez	%o5,	%f8,	%f22
	alignaddrl	%l3,	%i7,	%g6
	fmovdl	%xcc,	%f0,	%f4
	nop
	set	0x38, %o4
	lduw	[%l7 + %o4],	%l0
	movle	%icc,	%i6,	%o3
	brnz	%g1,	loop_1163
	stb	%g4,	[%l7 + 0x43]
	tle	%icc,	0x2
	tsubcctv	%o0,	%o7,	%i2
loop_1163:
	fmovrdgz	%g5,	%f20,	%f2
	fmovse	%xcc,	%f11,	%f28
	fbuge,a	%fcc3,	loop_1164
	fornot2	%f12,	%f30,	%f26
	bn,a	%xcc,	loop_1165
	bgu,a	%xcc,	loop_1166
loop_1164:
	orn	%i3,	%l6,	%i1
	ldsw	[%l7 + 0x50],	%o2
loop_1165:
	sub	%l1,	%l2,	%i5
loop_1166:
	smul	%l5,	0x1C6B,	%o6
	add	%l7,	0x50,	%l6
	wr	%g0,	0x19,	%asi
	ldxa	[%l6] %asi,	%o1
	casxa	[%l6] %asi,	%o1,	%i0
	fnor	%f26,	%f26,	%f20
	fmovdn	%xcc,	%f7,	%f23
	movcc	%icc,	%g2,	%l4
	fbl	%fcc1,	loop_1167
	xnor	%g7,	0x0A1D,	%i4
	fpsub32s	%f12,	%f20,	%f17
	tn	%xcc,	0x2
loop_1167:
	andn	%g3,	%o4,	%l3
	xnor	%o5,	%g6,	%i7
	movne	%xcc,	%l0,	%o3
	taddcc	%g1,	%g4,	%o0
	smul	%i6,	0x1E0A,	%o7
	tsubcc	%i2,	0x0027,	%g5
	ldsw	[%l7 + 0x34],	%i3
	and	%l6,	0x0003,	%i1
	andn	%l1,	%o2,	%l2
	tpos	%xcc,	0x4
	or	%l5,	%i5,	%o6
	edge8	%i0,	%o1,	%l4
	tne	%xcc,	0x0
	andn	%g7,	0x104E,	%i4
	edge8	%g3,	%g2,	%l3
	sra	%o5,	%g6,	%o4
	movvc	%icc,	%l0,	%o3
	fbge	%fcc0,	loop_1168
	ldsw	[%l7 + 0x74],	%i7
	movn	%xcc,	%g4,	%g1
	alignaddrl	%i6,	%o0,	%i2
loop_1168:
	edge8	%g5,	%o7,	%i3
	add	%l7,	0x58,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%l6,	%i1
	edge32n	%l1,	%o2,	%l2
	fmovsa	%xcc,	%f22,	%f19
	fmovsleu	%xcc,	%f23,	%f30
	nop
	setx	loop_1169,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fnors	%f29,	%f18,	%f24
	mulscc	%l5,	0x088F,	%i5
	fandnot1	%f10,	%f22,	%f24
loop_1169:
	xor	%o6,	%i0,	%l4
	taddcctv	%o1,	%i4,	%g7
	wr	%g0,	0x11,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	udivx	%g2,	0x1554,	%g3
	edge8ln	%l3,	%g6,	%o5
	movpos	%xcc,	%o4,	%o3
	fmovrsgez	%l0,	%f19,	%f31
	fmovdpos	%icc,	%f13,	%f19
	umul	%i7,	0x1A47,	%g4
	edge16	%g1,	%i6,	%i2
	movpos	%xcc,	%o0,	%g5
	orcc	%i3,	%l6,	%i1
	movcs	%xcc,	%o7,	%o2
	movne	%icc,	%l2,	%l5
	srl	%i5,	%o6,	%l1
	fmovsne	%xcc,	%f2,	%f19
	tcc	%icc,	0x7
	fbne,a	%fcc1,	loop_1170
	array32	%i0,	%l4,	%i4
	fmovdle	%xcc,	%f4,	%f20
	fpadd16	%f6,	%f2,	%f30
loop_1170:
	andn	%o1,	%g2,	%g7
	tgu	%icc,	0x0
	movge	%xcc,	%l3,	%g6
	nop
	set	0x70, %g1
	sth	%g3,	[%l7 + %g1]
	wr	%g0,	0x0c,	%asi
	ldstuba	[%l7 + 0x53] %asi,	%o4
	popc	0x0132,	%o3
	movneg	%xcc,	%o5,	%l0
	fcmps	%fcc3,	%f29,	%f27
	add	%l7,	0x2C,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%g4
	casa	[%l6] 0x80,	%g4,	%g1
	tn	%icc,	0x4
	bg,a,pn	%xcc,	loop_1171
	and	%i6,	%i7,	%i2
	tg	%icc,	0x7
	taddcc	%g5,	%i3,	%l6
loop_1171:
	nop
	add	%l7,	0x38,	%l6
	wr	%g0,	0x11,	%asi
	casa	[%l6] 0x11,	%i1,	%o7
	orn	%o0,	%o2,	%l2
	fmovscc	%xcc,	%f31,	%f2
	bcs,a	%icc,	loop_1172
	subccc	%i5,	0x1BC5,	%l5
	sir	0x0ED2
	andcc	%o6,	%l1,	%l4
loop_1172:
	xor	%i0,	%o1,	%g2
	fmovdge	%icc,	%f10,	%f28
	brlz	%g7,	loop_1173
	call	loop_1174
	ba,pt	%xcc,	loop_1175
	smul	%i4,	0x0A16,	%l3
loop_1173:
	movleu	%xcc,	%g3,	%g6
loop_1174:
	movne	%xcc,	%o4,	%o5
loop_1175:
	movne	%icc,	%o3,	%g4
	smul	%l0,	%i6,	%i7
	subccc	%i2,	%g1,	%g5
	movleu	%xcc,	%l6,	%i1
	fpadd32s	%f10,	%f9,	%f30
	wr	%g0,	0x10,	%asi
	lduba	[%l7 + 0x28] %asi,	%i3
	fbe,a	%fcc3,	loop_1176
	fmovrsgez	%o0,	%f31,	%f0
	fsrc2s	%f29,	%f4
	array16	%o7,	%l2,	%i5
loop_1176:
	addccc	%l5,	%o2,	%o6
	fnand	%f6,	%f12,	%f0
	movcs	%xcc,	%l4,	%i0
	tsubcc	%l1,	%g2,	%g7
	ldsh	[%l7 + 0x78],	%o1
	orn	%l3,	0x0993,	%g3
	ble,pt	%icc,	loop_1177
	movcs	%xcc,	%g6,	%i4
	mulscc	%o5,	0x1E52,	%o4
	fbue,a	%fcc0,	loop_1178
loop_1177:
	alignaddr	%g4,	%l0,	%o3
	fbule,a	%fcc2,	loop_1179
	te	%icc,	0x7
loop_1178:
	movge	%xcc,	%i6,	%i2
	fors	%f2,	%f6,	%f0
loop_1179:
	edge16l	%g1,	%i7,	%g5
	set	0x28, %o0
	ldxa	[%l7 + %o0] 0x14,	%l6
	fmovrdgez	%i3,	%f8,	%f26
	fcmpne16	%f4,	%f16,	%o0
	fmovdpos	%xcc,	%f22,	%f22
	stx	%i1,	[%l7 + 0x08]
	fmovsne	%xcc,	%f24,	%f29
	alignaddr	%o7,	%i5,	%l2
	fmovdn	%icc,	%f9,	%f20
	fmul8sux16	%f6,	%f12,	%f30
	udiv	%o2,	0x16B2,	%l5
	fcmpne32	%f30,	%f28,	%o6
	ta	%xcc,	0x2
	fbu	%fcc3,	loop_1180
	udivx	%i0,	0x001F,	%l1
	ldd	[%l7 + 0x18],	%l4
	array8	%g2,	%o1,	%g7
loop_1180:
	tsubcctv	%l3,	%g3,	%g6
	tn	%icc,	0x6
	edge8n	%o5,	%i4,	%o4
	umulcc	%g4,	%o3,	%i6
	tcs	%icc,	0x2
	wr	%g0,	0x80,	%asi
	lduba	[%l7 + 0x5A] %asi,	%l0
	tne	%icc,	0x0
	fbul,a	%fcc2,	loop_1181
	taddcc	%i2,	0x06DE,	%g1
	brz,a	%i7,	loop_1182
	edge16l	%l6,	%i3,	%g5
loop_1181:
	tvc	%xcc,	0x2
	srax	%o0,	0x12,	%i1
loop_1182:
	ldub	[%l7 + 0x10],	%i5
	bcc,a,pn	%xcc,	loop_1183
	subccc	%o7,	%l2,	%l5
	movleu	%xcc,	%o6,	%i0
	umulcc	%l1,	0x06C8,	%l4
loop_1183:
	movpos	%xcc,	%g2,	%o2
	fmovrde	%g7,	%f12,	%f24
	xorcc	%l3,	0x1BAC,	%g3
	sub	%g6,	%o1,	%i4
	nop
	setx loop_1184, %l0, %l1
	jmpl %l1, %o4
	fnot2s	%f28,	%f6
	tne	%xcc,	0x1
	brgez,a	%o5,	loop_1185
loop_1184:
	faligndata	%f6,	%f4,	%f12
	fmovrslz	%o3,	%f13,	%f18
	std	%g4,	[%l7 + 0x48]
loop_1185:
	te	%xcc,	0x6
	fmuld8ulx16	%f2,	%f1,	%f20
	array32	%i6,	%l0,	%i2
	swap	[%l7 + 0x2C],	%i7
	xor	%g1,	%l6,	%g5
	set	0x08, %g6
	prefetcha	[%l7 + %g6] 0x80,	 0x2
	orcc	%i3,	%i5,	%i1
	edge16ln	%o7,	%l2,	%o6
	movre	%l5,	0x3E3,	%i0
	edge32n	%l1,	%g2,	%o2
	ba,a,pn	%icc,	loop_1186
	alignaddr	%g7,	%l4,	%g3
	fpmerge	%f5,	%f14,	%f26
	movre	%l3,	%g6,	%i4
loop_1186:
	lduh	[%l7 + 0x7E],	%o4
	movcs	%icc,	%o5,	%o1
	edge32	%o3,	%g4,	%l0
	tle	%icc,	0x4
	sdivx	%i6,	0x15D8,	%i7
	wr	%g0,	0x80,	%asi
	lduwa	[%l7 + 0x54] %asi,	%i2
	brgz,a	%g1,	loop_1187
	or	%g5,	%l6,	%i3
	fmovsgu	%xcc,	%f26,	%f30
	fbu,a	%fcc2,	loop_1188
loop_1187:
	sll	%i5,	0x1D,	%i1
	fpadd16s	%f15,	%f16,	%f22
	bl,pn	%icc,	loop_1189
loop_1188:
	edge16ln	%o7,	%l2,	%o0
	edge16n	%l5,	%o6,	%i0
	edge8	%g2,	%l1,	%o2
loop_1189:
	tcs	%icc,	0x4
	movre	%l4,	%g7,	%g3
	udivx	%l3,	0x1975,	%g6
	wr	%g0,	0x19,	%asi
	lduwa	[%l7 + 0x50] %asi,	%o4
	sdivcc	%i4,	0x0D95,	%o5
	orncc	%o3,	%o1,	%g4
	movle	%xcc,	%i6,	%l0
	movgu	%icc,	%i2,	%i7
	tge	%xcc,	0x5
	ble	%xcc,	loop_1190
	fmovrsne	%g5,	%f4,	%f21
	edge8l	%l6,	%g1,	%i3
	fnor	%f2,	%f26,	%f4
loop_1190:
	sll	%i1,	%o7,	%i5
	srax	%l2,	0x16,	%o0
	set	0x0A, %g2
	lduha	[%l7 + %g2] 0x19,	%l5
	fcmpne16	%f10,	%f18,	%o6
	sra	%g2,	%i0,	%l1
	stw	%o2,	[%l7 + 0x50]
	subcc	%g7,	%l4,	%l3
	bgu,pn	%xcc,	loop_1191
	fexpand	%f16,	%f0
	tl	%xcc,	0x5
	xorcc	%g3,	%g6,	%i4
loop_1191:
	fcmpne16	%f18,	%f4,	%o4
	edge8ln	%o3,	%o1,	%o5
	bne	%icc,	loop_1192
	membar	0x5F
	fornot1s	%f0,	%f15,	%f22
	edge8	%i6,	%g4,	%i2
loop_1192:
	fpsub32	%f10,	%f2,	%f14
	sir	0x15B8
	fandnot1s	%f1,	%f18,	%f1
	brlz	%l0,	loop_1193
	mova	%xcc,	%i7,	%l6
	fabsd	%f30,	%f10
	brgez,a	%g5,	loop_1194
loop_1193:
	te	%icc,	0x7
	brnz	%g1,	loop_1195
	fmovdleu	%icc,	%f18,	%f7
loop_1194:
	movcc	%icc,	%i1,	%o7
	edge8	%i3,	%i5,	%l2
loop_1195:
	xnor	%l5,	0x0538,	%o6
	fands	%f6,	%f3,	%f31
	fmovrdgz	%o0,	%f26,	%f0
	tsubcctv	%i0,	0x19C9,	%g2
	edge8ln	%o2,	%l1,	%l4
	xnorcc	%g7,	0x1511,	%l3
	fmovs	%f7,	%f0
	fnot1	%f10,	%f10
	alignaddr	%g6,	%g3,	%o4
	addc	%i4,	%o1,	%o5
	nop
	set	0x28, %i0
	std	%f18,	[%l7 + %i0]
	ble,a	%xcc,	loop_1196
	bg	%icc,	loop_1197
	sdiv	%o3,	0x0D02,	%g4
	tcc	%xcc,	0x5
loop_1196:
	fmovda	%xcc,	%f0,	%f23
loop_1197:
	tl	%xcc,	0x7
	movrlz	%i6,	0x35D,	%i2
	umul	%l0,	0x1347,	%l6
	fxnor	%f14,	%f26,	%f16
	fbu	%fcc2,	loop_1198
	fmovdcc	%icc,	%f2,	%f3
	edge16n	%i7,	%g5,	%g1
	fone	%f0
loop_1198:
	movvc	%xcc,	%i1,	%i3
	fba,a	%fcc1,	loop_1199
	bge,a	loop_1200
	tleu	%xcc,	0x2
	sdivx	%i5,	0x0D76,	%o7
loop_1199:
	movcs	%icc,	%l2,	%o6
loop_1200:
	orn	%l5,	0x07FC,	%o0
	addccc	%i0,	%o2,	%g2
	te	%xcc,	0x3
	set	0x7C, %o3
	ldsha	[%l7 + %o3] 0x18,	%l4
	lduw	[%l7 + 0x4C],	%g7
	tgu	%icc,	0x3
	sth	%l3,	[%l7 + 0x7C]
	umul	%l1,	0x12B3,	%g6
	movvc	%xcc,	%o4,	%g3
	edge16ln	%o1,	%i4,	%o5
	bn,pt	%xcc,	loop_1201
	fmovrdgez	%g4,	%f14,	%f16
	sdivcc	%i6,	0x1E47,	%i2
	std	%l0,	[%l7 + 0x78]
loop_1201:
	ble,a	loop_1202
	tgu	%xcc,	0x7
	tvs	%xcc,	0x3
	movcs	%icc,	%o3,	%l6
loop_1202:
	umulcc	%i7,	%g1,	%g5
	stb	%i1,	[%l7 + 0x59]
	pdist	%f4,	%f18,	%f28
	set	0x40, %l5
	ldda	[%l7 + %l5] 0x10,	%f16
	tl	%xcc,	0x0
	andn	%i5,	0x14BC,	%i3
	movl	%icc,	%o7,	%l2
	fble,a	%fcc2,	loop_1203
	fpsub16s	%f1,	%f9,	%f21
	orn	%o6,	0x0EA2,	%l5
	tleu	%xcc,	0x2
loop_1203:
	stb	%i0,	[%l7 + 0x68]
	bge,a,pt	%xcc,	loop_1204
	swap	[%l7 + 0x6C],	%o0
	movrlz	%g2,	0x0AD,	%l4
	fbuge,a	%fcc2,	loop_1205
loop_1204:
	movleu	%xcc,	%o2,	%l3
	st	%f5,	[%l7 + 0x24]
	tcs	%icc,	0x0
loop_1205:
	fpackfix	%f8,	%f1
	fcmps	%fcc1,	%f8,	%f28
	andcc	%l1,	%g7,	%o4
	bne	loop_1206
	alignaddr	%g3,	%o1,	%g6
	fnor	%f12,	%f2,	%f12
	movcs	%xcc,	%i4,	%o5
loop_1206:
	udivcc	%g4,	0x1A06,	%i2
	fpadd32	%f0,	%f8,	%f20
	fzero	%f26
	tvc	%xcc,	0x3
	movrgz	%i6,	0x3A1,	%l0
	movrne	%l6,	%i7,	%o3
	fpadd16s	%f26,	%f14,	%f14
	orncc	%g1,	0x1F25,	%i1
	add	%g5,	0x059D,	%i5
	subccc	%o7,	%l2,	%i3
	stb	%l5,	[%l7 + 0x59]
	addc	%i0,	0x17C9,	%o6
	stb	%g2,	[%l7 + 0x63]
	std	%l4,	[%l7 + 0x20]
	fmovd	%f28,	%f0
	movle	%xcc,	%o2,	%l3
	mulx	%l1,	%o0,	%g7
	fmovsvc	%xcc,	%f1,	%f12
	smul	%g3,	0x1A2C,	%o1
	fmul8sux16	%f18,	%f16,	%f6
	set	0x68, %i2
	sta	%f17,	[%l7 + %i2] 0x0c
	edge8l	%g6,	%i4,	%o5
	movn	%icc,	%o4,	%g4
	stw	%i2,	[%l7 + 0x34]
	set	0x10, %g5
	ldda	[%l7 + %g5] 0x14,	%l0
	fexpand	%f15,	%f4
	bn,a,pn	%xcc,	loop_1207
	fmovrdlz	%l6,	%f8,	%f8
	xnorcc	%i7,	0x0D41,	%i6
	set	0x74, %i4
	stwa	%g1,	[%l7 + %i4] 0x04
loop_1207:
	movrlz	%o3,	%g5,	%i5
	be,pn	%xcc,	loop_1208
	st	%f1,	[%l7 + 0x58]
	tge	%xcc,	0x3
	fmovrdlz	%i1,	%f14,	%f30
loop_1208:
	fbug	%fcc3,	loop_1209
	mova	%xcc,	%l2,	%i3
	udivcc	%o7,	0x1A9C,	%l5
	sra	%o6,	%i0,	%l4
loop_1209:
	nop
	wr	%g0,	0x18,	%asi
	stxa	%o2,	[%l7 + 0x40] %asi
	movre	%g2,	0x119,	%l3
	wr	%g0,	0x22,	%asi
	stwa	%o0,	[%l7 + 0x74] %asi
	membar	#Sync
	movne	%icc,	%g7,	%l1
	ble,pt	%icc,	loop_1210
	tvs	%icc,	0x3
	tg	%icc,	0x4
	edge32l	%o1,	%g3,	%g6
loop_1210:
	tle	%icc,	0x5
	fmovrdgez	%i4,	%f8,	%f22
	set	0x60, %l1
	stxa	%o5,	[%l7 + %l1] 0x11
	st	%f23,	[%l7 + 0x40]
	fpsub32	%f14,	%f10,	%f4
	orncc	%o4,	0x1925,	%i2
	brlz	%l0,	loop_1211
	movvs	%icc,	%l6,	%i7
	fbl,a	%fcc0,	loop_1212
	srlx	%g4,	0x1D,	%i6
loop_1211:
	or	%o3,	%g5,	%g1
	movvc	%xcc,	%i5,	%l2
loop_1212:
	lduh	[%l7 + 0x34],	%i3
	addccc	%o7,	%l5,	%o6
	fmovrdne	%i1,	%f18,	%f8
	tsubcc	%i0,	%o2,	%g2
	wr	%g0,	0xe2,	%asi
	stxa	%l3,	[%l7 + 0x78] %asi
	membar	#Sync
	movrlz	%l4,	0x0F1,	%g7
	wr	%g0,	0x10,	%asi
	lduba	[%l7 + 0x0D] %asi,	%o0
	addc	%l1,	%o1,	%g3
	sllx	%i4,	%g6,	%o5
	udivx	%o4,	0x044F,	%l0
	fmovrdgez	%i2,	%f12,	%f8
	edge32l	%l6,	%g4,	%i6
	ta	%icc,	0x3
	move	%icc,	%o3,	%g5
	tl	%icc,	0x4
	addcc	%i7,	%i5,	%l2
	sdivcc	%g1,	0x0E00,	%i3
	wr	%g0,	0x18,	%asi
	lduba	[%l7 + 0x7D] %asi,	%o7
	movg	%icc,	%l5,	%i1
	fpack32	%f16,	%f16,	%f12
	fornot1s	%f25,	%f20,	%f25
	prefetch	[%l7 + 0x6C],	 0x0
	movre	%i0,	%o2,	%g2
	fxor	%f30,	%f24,	%f16
	ldsh	[%l7 + 0x58],	%o6
	fpsub32s	%f23,	%f0,	%f11
	tvs	%icc,	0x5
	tsubcc	%l3,	0x1DC5,	%g7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ld	[%l7 + 0x44],	%f23
	mulscc	%o0,	0x08FA,	%l1
	addcc	%o1,	0x006F,	%g3
	fzero	%f20
	fbuge	%fcc2,	loop_1213
	lduh	[%l7 + 0x2A],	%i4
	movvs	%xcc,	%g6,	%o5
	xor	%o4,	%l0,	%i2
loop_1213:
	stw	%l4,	[%l7 + 0x40]
	fbo,a	%fcc2,	loop_1214
	fbe,a	%fcc0,	loop_1215
	brlz,a	%g4,	loop_1216
	orcc	%l6,	0x182B,	%o3
loop_1214:
	fmovrdgez	%i6,	%f18,	%f0
loop_1215:
	udivx	%g5,	0x1A40,	%i7
loop_1216:
	nop
	wr	%g0,	0x04,	%asi
	stxa	%l2,	[%l7 + 0x40] %asi
	umul	%i5,	%i3,	%o7
	udivcc	%l5,	0x04AF,	%i1
	fmovdg	%icc,	%f4,	%f28
	movge	%xcc,	%g1,	%i0
	movleu	%icc,	%o2,	%o6
	wr	%g0,	0x0c,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	wr	%g0,	0x19,	%asi
	lduba	[%l7 + 0x10] %asi,	%l3
	membar	0x29
	movre	%g2,	%o0,	%g7
	fmovrdlez	%l1,	%f28,	%f14
	stb	%o1,	[%l7 + 0x1F]
	sra	%g3,	%i4,	%o5
	fcmpgt32	%f30,	%f8,	%g6
	udivcc	%o4,	0x097A,	%l0
	ble,pn	%icc,	loop_1217
	andncc	%l4,	%g4,	%l6
	tvc	%xcc,	0x5
	fzero	%f6
loop_1217:
	bvc,a,pn	%icc,	loop_1218
	orn	%o3,	%i6,	%i2
	alignaddrl	%g5,	%l2,	%i7
	array16	%i3,	%i5,	%o7
loop_1218:
	brlez	%i1,	loop_1219
	taddcctv	%l5,	%i0,	%g1
	fba	%fcc3,	loop_1220
	call	loop_1221
loop_1219:
	tl	%xcc,	0x6
	edge16n	%o6,	%l3,	%g2
loop_1220:
	andcc	%o2,	%g7,	%o0
loop_1221:
	movgu	%icc,	%l1,	%o1
	udiv	%g3,	0x0DE4,	%i4
	fpmerge	%f21,	%f31,	%f20
	brnz	%o5,	loop_1222
	xor	%g6,	%o4,	%l0
	wr	%g0,	0x80,	%asi
	prefetcha	[%l7 + 0x08] %asi,	 0x3
loop_1222:
	srlx	%l4,	%l6,	%i6
	bneg,a	%icc,	loop_1223
	fabsd	%f24,	%f6
	addccc	%i2,	0x05A2,	%o3
	tn	%icc,	0x4
loop_1223:
	sethi	0x1675,	%g5
	edge32l	%l2,	%i3,	%i7
	tcc	%xcc,	0x7
	fmovde	%xcc,	%f23,	%f22
	mova	%xcc,	%o7,	%i1
	fmovdne	%icc,	%f7,	%f2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpackfix	%f30,	%f24
	fones	%f31
	be,a	loop_1224
	fbule	%fcc2,	loop_1225
	smul	%l5,	%i0,	%i5
	fnands	%f26,	%f8,	%f2
loop_1224:
	udivx	%g1,	0x1641,	%o6
loop_1225:
	alignaddrl	%g2,	%o2,	%l3
	array8	%o0,	%l1,	%g7
	edge32ln	%g3,	%i4,	%o1
	fmovdleu	%xcc,	%f22,	%f1
	movrgez	%g6,	%o4,	%l0
	umulcc	%o5,	0x10E2,	%g4
	edge16	%l6,	%i6,	%i2
	fpadd32s	%f0,	%f16,	%f6
	sdivcc	%o3,	0x1688,	%l4
	brz	%l2,	loop_1226
	srax	%g5,	%i7,	%i3
	ldub	[%l7 + 0x2F],	%i1
	fnot1s	%f13,	%f4
loop_1226:
	tneg	%icc,	0x3
	fmovrdgz	%l5,	%f4,	%f14
	tge	%icc,	0x2
	membar	0x00
	movre	%i0,	%i5,	%g1
	movcs	%xcc,	%o6,	%g2
	sir	0x0B4E
	xorcc	%o2,	%o7,	%l3
	smulcc	%o0,	%g7,	%l1
	set	0x24, %l0
	lduwa	[%l7 + %l0] 0x18,	%g3
	movn	%icc,	%i4,	%o1
	edge32ln	%o4,	%l0,	%o5
	tvs	%xcc,	0x4
	fbn,a	%fcc1,	loop_1227
	movcs	%xcc,	%g4,	%g6
	edge16	%i6,	%i2,	%o3
	ld	[%l7 + 0x20],	%f4
loop_1227:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32n	%l6,	%l4,	%g5
	mulx	%l2,	%i3,	%i1
	set	0x23, %i7
	ldsba	[%l7 + %i7] 0x14,	%i7
	fnand	%f10,	%f14,	%f22
	sdivx	%i0,	0x106B,	%l5
	sllx	%g1,	%i5,	%g2
	wr	%g0,	0x80,	%asi
	ldstuba	[%l7 + 0x7A] %asi,	%o2
	movrne	%o6,	0x179,	%l3
	tle	%icc,	0x2
	movge	%icc,	%o7,	%o0
	add	%g7,	%g3,	%l1
	fpack32	%f24,	%f2,	%f10
	call	loop_1228
	faligndata	%f20,	%f18,	%f8
	sub	%o1,	0x151C,	%o4
	set	0x10, %i1
	swapa	[%l7 + %i1] 0x18,	%l0
loop_1228:
	taddcctv	%o5,	%g4,	%g6
	edge16ln	%i6,	%i2,	%o3
	fcmpeq32	%f24,	%f26,	%l6
	bvc,a,pt	%icc,	loop_1229
	orn	%i4,	%g5,	%l4
	fpsub32	%f28,	%f18,	%f30
	tle	%xcc,	0x6
loop_1229:
	edge32l	%l2,	%i3,	%i1
	movrlz	%i7,	%l5,	%i0
	fsrc1	%f6,	%f8
	fmovrsgez	%i5,	%f10,	%f7
	mova	%xcc,	%g1,	%g2
	stbar
	fmovde	%icc,	%f10,	%f22
	edge8	%o2,	%l3,	%o6
	fbule	%fcc0,	loop_1230
	sth	%o7,	[%l7 + 0x1A]
	sllx	%g7,	%g3,	%o0
	xor	%l1,	%o1,	%l0
loop_1230:
	edge16l	%o4,	%g4,	%g6
	move	%xcc,	%i6,	%o5
	fbule,a	%fcc2,	loop_1231
	brz	%o3,	loop_1232
	fbug,a	%fcc0,	loop_1233
	movleu	%icc,	%i2,	%l6
loop_1231:
	tl	%icc,	0x3
loop_1232:
	fcmpgt16	%f4,	%f16,	%g5
loop_1233:
	nop
	set	0x68, %i6
	ldsha	[%l7 + %i6] 0x0c,	%l4
	bne	loop_1234
	fmovscs	%icc,	%f28,	%f14
	tpos	%xcc,	0x7
	movrgez	%i4,	%l2,	%i1
loop_1234:
	move	%xcc,	%i7,	%l5
	set	0x40, %o2
	stda	%f16,	[%l7 + %o2] 0x17
	membar	#Sync
	andncc	%i3,	%i5,	%g1
	movre	%g2,	0x37A,	%o2
	bl,a	%icc,	loop_1235
	addc	%i0,	%l3,	%o7
	srl	%o6,	0x15,	%g3
	movleu	%xcc,	%g7,	%l1
loop_1235:
	membar	0x74
	call	loop_1236
	srlx	%o0,	0x09,	%o1
	mulscc	%l0,	0x0A88,	%o4
	fmovs	%f4,	%f12
loop_1236:
	sdiv	%g4,	0x1678,	%i6
	fmovdneg	%xcc,	%f3,	%f14
	fmuld8ulx16	%f26,	%f17,	%f28
	fmovsn	%icc,	%f9,	%f24
	movrgez	%g6,	%o5,	%o3
	andncc	%i2,	%l6,	%g5
	st	%f25,	[%l7 + 0x70]
	fmovdn	%xcc,	%f26,	%f29
	movle	%icc,	%l4,	%i4
	fnot2	%f6,	%f10
	lduh	[%l7 + 0x20],	%i1
	edge8n	%i7,	%l5,	%i3
	te	%xcc,	0x4
	set	0x3C, %i3
	sta	%f0,	[%l7 + %i3] 0x0c
	tn	%icc,	0x3
	fmul8x16al	%f4,	%f27,	%f22
	set	0x26, %g4
	ldsha	[%l7 + %g4] 0x19,	%l2
	brlez	%i5,	loop_1237
	brgz	%g1,	loop_1238
	ba,a,pt	%icc,	loop_1239
	addcc	%o2,	0x17D1,	%g2
loop_1237:
	edge8ln	%l3,	%o7,	%i0
loop_1238:
	fblg	%fcc2,	loop_1240
loop_1239:
	movpos	%xcc,	%o6,	%g3
	fmovsneg	%xcc,	%f20,	%f17
	fnegd	%f14,	%f26
loop_1240:
	edge8ln	%l1,	%o0,	%g7
	popc	%l0,	%o4
	fand	%f22,	%f22,	%f24
	ldx	[%l7 + 0x78],	%g4
	std	%i6,	[%l7 + 0x58]
	add	%o1,	0x18AD,	%g6
	set	0x2A, %l6
	lduba	[%l7 + %l6] 0x0c,	%o3
	fbe	%fcc3,	loop_1241
	tgu	%icc,	0x6
	subcc	%i2,	0x12C5,	%l6
	fbl	%fcc0,	loop_1242
loop_1241:
	fbn,a	%fcc0,	loop_1243
	movpos	%xcc,	%g5,	%l4
	stw	%o5,	[%l7 + 0x28]
loop_1242:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1243:
	subccc	%i4,	%i1,	%i7
	wr	%g0,	0xea,	%asi
	stha	%l5,	[%l7 + 0x5C] %asi
	membar	#Sync
	fmovrdlez	%i3,	%f4,	%f10
	alignaddrl	%l2,	%i5,	%o2
	fbug	%fcc0,	loop_1244
	movcc	%icc,	%g1,	%g2
	edge8	%l3,	%i0,	%o6
	fxors	%f4,	%f9,	%f13
loop_1244:
	ldx	[%l7 + 0x60],	%g3
	movvc	%xcc,	%l1,	%o7
	membar	0x1E
	edge8	%o0,	%l0,	%o4
	prefetch	[%l7 + 0x64],	 0x2
	addc	%g4,	0x0214,	%i6
	fbl,a	%fcc3,	loop_1245
	ta	%xcc,	0x1
	movvs	%icc,	%o1,	%g6
	tn	%xcc,	0x1
loop_1245:
	fbuge,a	%fcc1,	loop_1246
	membar	0x59
	bn	%xcc,	loop_1247
	tl	%xcc,	0x0
loop_1246:
	alignaddr	%g7,	%o3,	%l6
	edge32ln	%i2,	%l4,	%o5
loop_1247:
	add	%g5,	0x1102,	%i4
	tvs	%xcc,	0x1
	set	0x68, %o6
	sta	%f12,	[%l7 + %o6] 0x89
	tn	%xcc,	0x1
	movge	%xcc,	%i7,	%i1
	ldub	[%l7 + 0x65],	%l5
	taddcc	%l2,	0x0043,	%i3
	add	%l7,	0x30,	%l6
	wr	%g0,	0x11,	%asi
	ldxa	[%l6] %asi,	%o2
	casxa	[%l6] %asi,	%o2,	%g1
	sll	%i5,	0x1F,	%g2
	set	0x60, %g7
	ldda	[%l7 + %g7] 0x89,	%i0
	smul	%o6,	%g3,	%l3
	set	0x14, %o5
	swapa	[%l7 + %o5] 0x81,	%l1
	fbn,a	%fcc0,	loop_1248
	addccc	%o7,	%o0,	%o4
	fmovdgu	%xcc,	%f10,	%f23
	set	0x40, %l2
	stda	%f0,	[%l7 + %l2] 0x81
loop_1248:
	edge16n	%g4,	%i6,	%o1
	tleu	%xcc,	0x6
	sir	0x0408
	fornot1s	%f3,	%f27,	%f13
	fbule	%fcc1,	loop_1249
	movre	%l0,	0x271,	%g7
	fcmpne32	%f20,	%f18,	%g6
	fmovsn	%icc,	%f13,	%f15
loop_1249:
	sth	%l6,	[%l7 + 0x52]
	tpos	%xcc,	0x5
	add	%l7,	0x5C,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%o3,	%i2
	fornot1	%f18,	%f26,	%f0
	tl	%icc,	0x3
	fbul	%fcc3,	loop_1250
	umul	%o5,	%g5,	%i4
	edge32n	%i7,	%l4,	%l5
	tcs	%icc,	0x1
loop_1250:
	sir	0x0C31
	fandnot2	%f14,	%f18,	%f12
	set	0x68, %o7
	stxa	%l2,	[%l7 + %o7] 0x89
	ld	[%l7 + 0x44],	%f8
	fcmpeq16	%f16,	%f0,	%i1
	tvs	%xcc,	0x6
	wr	%g0,	0x18,	%asi
	lduha	[%l7 + 0x10] %asi,	%o2
	subc	%g1,	0x00C2,	%i5
	fbn	%fcc2,	loop_1251
	xorcc	%i3,	0x1DC2,	%g2
	edge8n	%o6,	%g3,	%l3
	fmovsg	%icc,	%f30,	%f23
loop_1251:
	bneg,a,pt	%xcc,	loop_1252
	fmovsl	%icc,	%f24,	%f30
	movrlz	%i0,	%o7,	%o0
	fbo	%fcc0,	loop_1253
loop_1252:
	fbule	%fcc1,	loop_1254
	movge	%icc,	%o4,	%l1
	tg	%xcc,	0x4
loop_1253:
	fnegd	%f22,	%f12
loop_1254:
	std	%f8,	[%l7 + 0x70]
	tvc	%icc,	0x5
	fnand	%f4,	%f8,	%f22
	edge16l	%g4,	%i6,	%o1
	fands	%f0,	%f9,	%f24
	tne	%xcc,	0x5
	alignaddrl	%l0,	%g6,	%l6
	movle	%xcc,	%g7,	%i2
	alignaddrl	%o5,	%g5,	%i4
	add	%i7,	%l4,	%o3
	fmovsleu	%icc,	%f8,	%f14
	taddcctv	%l2,	0x10B2,	%i1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sethi	0x19B3,	%o2
	tsubcctv	%g1,	0x056B,	%l5
	subccc	%i5,	0x02A2,	%g2
	fxnor	%f2,	%f22,	%f16
	srlx	%i3,	0x17,	%o6
	movvc	%xcc,	%l3,	%i0
	tvc	%xcc,	0x5
	sub	%o7,	0x093A,	%o0
	tn	%xcc,	0x1
	bpos,a	%xcc,	loop_1255
	edge32n	%o4,	%l1,	%g4
	brgz	%g3,	loop_1256
	sdivcc	%i6,	0x1F24,	%l0
loop_1255:
	edge32ln	%o1,	%l6,	%g7
	sdivcc	%i2,	0x0608,	%g6
loop_1256:
	edge16n	%o5,	%i4,	%i7
	wr	%g0,	0x19,	%asi
	stha	%l4,	[%l7 + 0x6E] %asi
	fcmpd	%fcc2,	%f28,	%f8
	wr	%g0,	0x80,	%asi
	prefetcha	[%l7 + 0x68] %asi,	 0x2
	fbe	%fcc1,	loop_1257
	tvc	%icc,	0x0
	bvs,pn	%xcc,	loop_1258
	addccc	%g5,	0x02E4,	%l2
loop_1257:
	movne	%icc,	%i1,	%o2
	mulx	%g1,	%i5,	%l5
loop_1258:
	fmovdl	%xcc,	%f6,	%f2
	sllx	%g2,	0x03,	%o6
	orcc	%i3,	0x0A8B,	%l3
	tge	%icc,	0x3
	array8	%o7,	%o0,	%o4
	sethi	0x01A3,	%i0
	bgu,pt	%icc,	loop_1259
	sdivcc	%l1,	0x148B,	%g3
	brlz	%i6,	loop_1260
	edge16l	%l0,	%o1,	%l6
loop_1259:
	tsubcc	%g4,	%i2,	%g6
	fmovdg	%icc,	%f3,	%f20
loop_1260:
	tpos	%icc,	0x3
	call	loop_1261
	bpos	%xcc,	loop_1262
	movneg	%icc,	%g7,	%i4
	edge8n	%i7,	%o5,	%o3
loop_1261:
	movrgez	%g5,	%l2,	%l4
loop_1262:
	fpsub32	%f10,	%f26,	%f24
	fornot2	%f0,	%f16,	%f8
	edge8	%i1,	%o2,	%i5
	popc	0x14AC,	%l5
	mova	%icc,	%g1,	%g2
	edge8	%o6,	%i3,	%o7
	tsubcc	%o0,	%o4,	%i0
	movrgz	%l3,	0x3CA,	%g3
	ldsh	[%l7 + 0x48],	%l1
	fmovscs	%icc,	%f13,	%f21
	faligndata	%f20,	%f26,	%f4
	fpadd16s	%f12,	%f30,	%f29
	fornot1s	%f10,	%f25,	%f20
	set	0x28, %l3
	lduwa	[%l7 + %l3] 0x80,	%l0
	std	%f26,	[%l7 + 0x50]
	fmovdvs	%icc,	%f2,	%f18
	faligndata	%f22,	%f30,	%f18
	membar	0x75
	andn	%o1,	0x1422,	%l6
	fmovdpos	%xcc,	%f24,	%f2
	subccc	%g4,	%i2,	%g6
	edge32ln	%g7,	%i6,	%i4
	ldub	[%l7 + 0x2A],	%o5
	movrne	%o3,	0x2F0,	%i7
	popc	%g5,	%l2
	taddcc	%i1,	0x024D,	%l4
	edge32	%o2,	%l5,	%g1
	andcc	%g2,	%i5,	%i3
	addccc	%o6,	0x1465,	%o7
	fornot2	%f6,	%f16,	%f2
	brlez	%o0,	loop_1263
	tle	%icc,	0x3
	orncc	%o4,	0x087C,	%i0
	movl	%xcc,	%l3,	%l1
loop_1263:
	fmovsg	%icc,	%f19,	%f4
	taddcctv	%l0,	0x1593,	%g3
	movneg	%icc,	%o1,	%g4
	fbne	%fcc0,	loop_1264
	subc	%i2,	0x0828,	%g6
	ldub	[%l7 + 0x3B],	%g7
	mova	%xcc,	%l6,	%i4
loop_1264:
	bvs,pt	%icc,	loop_1265
	fbuge,a	%fcc3,	loop_1266
	tg	%xcc,	0x7
	sra	%i6,	0x12,	%o3
loop_1265:
	fbe,a	%fcc1,	loop_1267
loop_1266:
	movrgez	%i7,	0x31E,	%o5
	brnz	%l2,	loop_1268
	sdiv	%g5,	0x0E27,	%l4
loop_1267:
	tleu	%icc,	0x1
	prefetch	[%l7 + 0x0C],	 0x2
loop_1268:
	srlx	%i1,	%l5,	%o2
	lduh	[%l7 + 0x14],	%g1
	tl	%xcc,	0x3
	ta	%xcc,	0x4
	tn	%xcc,	0x1
	swap	[%l7 + 0x68],	%i5
	tpos	%xcc,	0x0
	lduw	[%l7 + 0x48],	%i3
	srlx	%g2,	0x05,	%o6
	fmovsl	%xcc,	%f3,	%f30
	bgu,a	loop_1269
	fnor	%f10,	%f18,	%f20
	brz,a	%o0,	loop_1270
	fandnot2s	%f28,	%f24,	%f19
loop_1269:
	tsubcctv	%o4,	%o7,	%i0
	tvs	%icc,	0x4
loop_1270:
	brlz,a	%l3,	loop_1271
	fors	%f12,	%f24,	%f14
	fbn	%fcc0,	loop_1272
	sra	%l1,	%l0,	%g3
loop_1271:
	nop
	setx	loop_1273,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	mova	%xcc,	%o1,	%i2
loop_1272:
	edge8l	%g4,	%g6,	%g7
	fmul8x16au	%f24,	%f24,	%f28
loop_1273:
	sra	%l6,	%i6,	%o3
	movneg	%icc,	%i7,	%i4
	prefetch	[%l7 + 0x1C],	 0x2
	brlz	%l2,	loop_1274
	edge32ln	%o5,	%g5,	%l4
	siam	0x6
	te	%icc,	0x7
loop_1274:
	movrne	%l5,	%o2,	%i1
	movvc	%xcc,	%g1,	%i5
	subc	%i3,	0x1A21,	%o6
	andncc	%g2,	%o4,	%o7
	addccc	%i0,	0x0AED,	%o0
	movrlz	%l3,	0x015,	%l1
	fbge	%fcc1,	loop_1275
	tvc	%icc,	0x3
	tleu	%xcc,	0x1
	andncc	%l0,	%g3,	%o1
loop_1275:
	udivx	%g4,	0x1811,	%i2
	array16	%g6,	%g7,	%i6
	alignaddr	%o3,	%i7,	%l6
	stw	%i4,	[%l7 + 0x28]
	srax	%o5,	%g5,	%l4
	subcc	%l2,	0x1396,	%o2
	tg	%xcc,	0x1
	mulx	%i1,	%l5,	%i5
	wr	%g0,	0x80,	%asi
	ldsba	[%l7 + 0x26] %asi,	%i3
	fmovsne	%icc,	%f9,	%f8
	fxor	%f24,	%f8,	%f12
	fmovdg	%icc,	%f6,	%f1
	fnot2s	%f17,	%f25
	movg	%xcc,	%o6,	%g1
	fmovs	%f29,	%f19
	xor	%o4,	%g2,	%i0
	mulx	%o7,	0x13B9,	%l3
	fbge	%fcc1,	loop_1276
	fmovse	%xcc,	%f22,	%f10
	movg	%icc,	%o0,	%l1
	or	%l0,	0x1B21,	%g3
loop_1276:
	xnorcc	%o1,	0x03B2,	%g4
	sdivcc	%i2,	0x093B,	%g6
	addcc	%g7,	%o3,	%i7
	bge,pt	%icc,	loop_1277
	fpsub16s	%f26,	%f15,	%f21
	edge8l	%l6,	%i4,	%i6
	edge16	%o5,	%g5,	%l4
loop_1277:
	fnand	%f8,	%f22,	%f24
	brz,a	%l2,	loop_1278
	brgez	%o2,	loop_1279
	brlz	%i1,	loop_1280
	xnorcc	%l5,	%i3,	%i5
loop_1278:
	tneg	%icc,	0x2
loop_1279:
	orcc	%o6,	%g1,	%o4
loop_1280:
	fabss	%f1,	%f13
	bne	%icc,	loop_1281
	ldsb	[%l7 + 0x61],	%g2
	flush	%l7 + 0x48
	fcmpes	%fcc3,	%f30,	%f24
loop_1281:
	fbug	%fcc2,	loop_1282
	fsrc1s	%f28,	%f5
	andcc	%o7,	0x1D6B,	%l3
	and	%o0,	%l1,	%i0
loop_1282:
	mulx	%g3,	%l0,	%o1
	add	%l7,	0x60,	%l6
	wr	%g0,	0x04,	%asi
	ldxa	[%l6] %asi,	%g4
	casxa	[%l6] %asi,	%g4,	%i2
	srl	%g7,	%g6,	%i7
	sllx	%o3,	0x02,	%i4
	movre	%l6,	%i6,	%g5
	fornot2s	%f13,	%f7,	%f2
	udivcc	%o5,	0x14C4,	%l2
	fmovdl	%xcc,	%f25,	%f30
	addcc	%o2,	0x1746,	%l4
	bleu,a,pn	%icc,	loop_1283
	xnor	%l5,	0x0EF7,	%i3
	orn	%i5,	0x191B,	%o6
	fpadd16s	%f23,	%f11,	%f18
loop_1283:
	nop
	wr	%g0,	0x10,	%asi
	stha	%i1,	[%l7 + 0x6A] %asi
	set	0x48, %o1
	stda	%o4,	[%l7 + %o1] 0xe2
	membar	#Sync
	movcs	%xcc,	%g2,	%o7
	fornot2	%f4,	%f0,	%f30
	set	0x5C, %l4
	lduwa	[%l7 + %l4] 0x0c,	%g1
	movge	%xcc,	%o0,	%l3
	fandnot2s	%f8,	%f3,	%f21
	smul	%l1,	0x0812,	%i0
	sll	%g3,	0x18,	%l0
	movgu	%xcc,	%o1,	%i2
	movge	%xcc,	%g7,	%g4
	faligndata	%f16,	%f30,	%f2
	xnorcc	%i7,	0x1E93,	%g6
	movrne	%o3,	0x159,	%l6
	fbge	%fcc0,	loop_1284
	smulcc	%i4,	%i6,	%o5
	fmovdgu	%icc,	%f10,	%f22
	movneg	%icc,	%l2,	%o2
loop_1284:
	fblg,a	%fcc0,	loop_1285
	fmovspos	%xcc,	%f2,	%f25
	fabsd	%f6,	%f10
	fzero	%f30
loop_1285:
	movpos	%icc,	%l4,	%l5
	fmovdgu	%xcc,	%f3,	%f10
	orncc	%g5,	0x0C03,	%i3
	tle	%xcc,	0x7
	xor	%i5,	0x0EED,	%i1
	fpsub32s	%f31,	%f29,	%f22
	movneg	%xcc,	%o4,	%o6
	subccc	%o7,	0x1753,	%g2
	edge32ln	%o0,	%l3,	%l1
	fmovscs	%icc,	%f15,	%f8
	array8	%i0,	%g1,	%g3
	tvc	%xcc,	0x5
	popc	%o1,	%l0
	movne	%icc,	%g7,	%i2
	udiv	%g4,	0x0E97,	%i7
	fcmped	%fcc2,	%f16,	%f16
	fcmpgt32	%f24,	%f24,	%o3
	edge32n	%g6,	%i4,	%i6
	fabss	%f27,	%f9
	std	%o4,	[%l7 + 0x78]
	fnot2	%f20,	%f26
	alignaddr	%l6,	%l2,	%o2
	brlz,a	%l5,	loop_1286
	sllx	%g5,	0x08,	%i3
	taddcctv	%l4,	%i1,	%i5
	fands	%f9,	%f20,	%f16
loop_1286:
	edge8	%o4,	%o6,	%o7
	fxnor	%f2,	%f24,	%f8
	fmovd	%f20,	%f22
	set	0x30, %g3
	lda	[%l7 + %g3] 0x80,	%f11
	orn	%o0,	%l3,	%l1
	srax	%g2,	%g1,	%i0
	fxnor	%f22,	%f22,	%f6
	wr	%g0,	0x89,	%asi
	stba	%o1,	[%l7 + 0x0F] %asi
	wr	%g0,	0x81,	%asi
	ldsha	[%l7 + 0x46] %asi,	%l0
	fpsub16	%f18,	%f24,	%f26
	tge	%icc,	0x1
	ta	%xcc,	0x2
	fmovrsgez	%g7,	%f4,	%f27
	andncc	%i2,	%g3,	%g4
	tsubcc	%i7,	0x07D6,	%g6
	membar	0x22
	ba,pn	%xcc,	loop_1287
	tcs	%icc,	0x1
	edge16	%o3,	%i4,	%o5
	set	0x7A, %i5
	stha	%l6,	[%l7 + %i5] 0x80
loop_1287:
	tne	%xcc,	0x2
	add	%l7,	0x74,	%l6
	wr	%g0,	0x11,	%asi
	casa	[%l6] %asi,	%l2,	%o2
	fmovsg	%icc,	%f23,	%f6
	ta	%xcc,	0x6
	tpos	%icc,	0x3
	movcs	%xcc,	%i6,	%l5
	be,pn	%icc,	loop_1288
	tn	%icc,	0x1
	brnz,a	%i3,	loop_1289
	movn	%icc,	%l4,	%i1
loop_1288:
	nop
	set	0x48, %g1
	prefetcha	[%l7 + %g1] 0x0c,	 0x2
loop_1289:
	addc	%i5,	0x1388,	%o4
	ldsw	[%l7 + 0x4C],	%o6
	orncc	%o7,	0x1A32,	%o0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16ln	%l3,	%g2,	%l1
	fmuld8ulx16	%f12,	%f26,	%f24
	fors	%f14,	%f10,	%f6
	bshuffle	%f24,	%f14,	%f4
	mova	%icc,	%g1,	%o1
	tpos	%xcc,	0x7
	add	%l7,	0x58,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%i0
	casxa	[%l6] 0x88,	%i0,	%l0
	move	%xcc,	%i2,	%g7
	movvc	%icc,	%g4,	%g3
	mulscc	%g6,	0x1D3F,	%o3
	edge16l	%i7,	%o5,	%i4
	bvs,a,pn	%icc,	loop_1290
	fbule	%fcc1,	loop_1291
	fbule	%fcc2,	loop_1292
	alignaddr	%l6,	%l2,	%o2
loop_1290:
	fmovrsne	%i6,	%f29,	%f5
loop_1291:
	nop
	wr	%g0,	0x81,	%asi
	lduha	[%l7 + 0x34] %asi,	%l5
loop_1292:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	and	%l4,	%i1,	%g5
	tleu	%xcc,	0x6
	ba,a	%icc,	loop_1293
	fmovsl	%icc,	%f3,	%f31
	and	%i3,	%o4,	%o6
	fones	%f23
loop_1293:
	sethi	0x06D0,	%i5
	tge	%icc,	0x2
	stb	%o7,	[%l7 + 0x47]
	and	%l3,	0x0CE3,	%o0
	fbg,a	%fcc3,	loop_1294
	sir	0x0511
	orcc	%l1,	0x018E,	%g1
	membar	0x54
loop_1294:
	fmovsne	%icc,	%f17,	%f2
	edge16	%o1,	%g2,	%i0
	srlx	%l0,	0x0F,	%i2
	fnegs	%f9,	%f1
	sra	%g7,	%g3,	%g6
	andcc	%g4,	%i7,	%o5
	ldsb	[%l7 + 0x32],	%i4
	sir	0x027A
	sra	%o3,	%l2,	%l6
	tvs	%icc,	0x1
	andncc	%o2,	%l5,	%l4
	movgu	%icc,	%i6,	%g5
	bvc,a,pt	%icc,	loop_1295
	fbue	%fcc0,	loop_1296
	smul	%i3,	0x0AF0,	%o4
	mulscc	%o6,	0x1DC2,	%i1
loop_1295:
	fcmpeq16	%f2,	%f30,	%i5
loop_1296:
	nop
	set	0x40, %o4
	stda	%f16,	[%l7 + %o4] 0xf8
	membar	#Sync
	sethi	0x0532,	%l3
	umul	%o0,	0x156E,	%o7
	addccc	%g1,	%l1,	%g2
	fbule,a	%fcc1,	loop_1297
	addc	%o1,	%i0,	%l0
	edge16	%g7,	%i2,	%g3
	fmuld8ulx16	%f16,	%f27,	%f12
loop_1297:
	sdivcc	%g6,	0x1F8C,	%g4
	wr	%g0,	0x80,	%asi
	stba	%o5,	[%l7 + 0x50] %asi
	sra	%i7,	0x1A,	%i4
	tne	%icc,	0x6
	fcmpgt32	%f28,	%f6,	%o3
	bvs,a,pn	%xcc,	loop_1298
	movrlez	%l6,	%o2,	%l5
	sub	%l4,	%i6,	%l2
	wr	%g0,	0x81,	%asi
	lduha	[%l7 + 0x4A] %asi,	%i3
loop_1298:
	subccc	%g5,	%o4,	%i1
	fmuld8sux16	%f3,	%f7,	%f4
	tneg	%xcc,	0x4
	stbar
	brz	%o6,	loop_1299
	edge8l	%l3,	%o0,	%o7
	wr	%g0,	0x10,	%asi
	ldsha	[%l7 + 0x6A] %asi,	%g1
loop_1299:
	movrgez	%l1,	%i5,	%g2
	fors	%f28,	%f28,	%f15
	tle	%icc,	0x2
	umulcc	%o1,	0x15ED,	%l0
	fbn	%fcc1,	loop_1300
	bcs,pt	%xcc,	loop_1301
	tleu	%xcc,	0x5
	addc	%i0,	0x1767,	%i2
loop_1300:
	movne	%xcc,	%g3,	%g6
loop_1301:
	umul	%g7,	%g4,	%i7
	subcc	%i4,	%o5,	%o3
	std	%i6,	[%l7 + 0x50]
	ldsh	[%l7 + 0x38],	%o2
	fsrc1	%f8,	%f22
	udivx	%l5,	0x0D82,	%l4
	tne	%xcc,	0x2
	movrgz	%l2,	%i3,	%g5
	edge16ln	%i6,	%i1,	%o4
	fpackfix	%f18,	%f12
	subccc	%l3,	0x00E2,	%o0
	edge8	%o7,	%g1,	%o6
	andn	%l1,	0x1DEA,	%i5
	tneg	%icc,	0x7
	tgu	%xcc,	0x1
	brlez,a	%g2,	loop_1302
	nop
	setx loop_1303, %l0, %l1
	jmpl %l1, %l0
	ldub	[%l7 + 0x27],	%o1
	tvc	%icc,	0x7
loop_1302:
	bg,a	%xcc,	loop_1304
loop_1303:
	ldsb	[%l7 + 0x3B],	%i0
	xnorcc	%g3,	0x185F,	%g6
	udiv	%g7,	0x1ADF,	%g4
loop_1304:
	movvs	%xcc,	%i2,	%i7
	prefetch	[%l7 + 0x14],	 0x3
	fmovdgu	%icc,	%f30,	%f10
	set	0x30, %o0
	stda	%i4,	[%l7 + %o0] 0x04
	fbuge,a	%fcc2,	loop_1305
	movgu	%icc,	%o3,	%l6
	orncc	%o5,	0x0DB9,	%o2
	fcmpne16	%f14,	%f28,	%l5
loop_1305:
	sra	%l2,	%l4,	%g5
	edge16ln	%i3,	%i6,	%o4
	subc	%l3,	0x05A7,	%o0
	srlx	%i1,	%g1,	%o7
	or	%l1,	%o6,	%i5
	movcc	%xcc,	%l0,	%g2
	fmovrdgez	%o1,	%f14,	%f10
	ldub	[%l7 + 0x12],	%g3
	fpadd16s	%f22,	%f0,	%f3
	tle	%icc,	0x4
	nop
	setx loop_1306, %l0, %l1
	jmpl %l1, %i0
	sethi	0x09DD,	%g6
	set	0x54, %g6
	lduwa	[%l7 + %g6] 0x88,	%g4
loop_1306:
	taddcctv	%i2,	0x070F,	%g7
	fmovrslez	%i4,	%f23,	%f15
	set	0x8, %i0
	ldxa	[%g0 + %i0] 0x21,	%o3
	tneg	%xcc,	0x5
	fnands	%f27,	%f10,	%f14
	tpos	%icc,	0x0
	edge8ln	%l6,	%o5,	%o2
	smulcc	%l5,	%l2,	%l4
	bne,a	loop_1307
	tpos	%xcc,	0x5
	or	%i7,	0x0E75,	%g5
	wr	%g0,	0x0c,	%asi
	lda	[%l7 + 0x74] %asi,	%f5
loop_1307:
	edge8	%i3,	%i6,	%l3
	srlx	%o4,	%i1,	%g1
	ld	[%l7 + 0x30],	%f21
	movcs	%xcc,	%o7,	%l1
	sub	%o0,	%o6,	%l0
	tneg	%xcc,	0x2
	ta	%icc,	0x6
	taddcctv	%i5,	%g2,	%g3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movleu	%icc,	%i0,	%g6
	movleu	%xcc,	%g4,	%i2
	stb	%g7,	[%l7 + 0x34]
	te	%icc,	0x7
	movneg	%icc,	%i4,	%o3
	movge	%xcc,	%l6,	%o1
	fmovsgu	%icc,	%f13,	%f12
	membar	0x5F
	array32	%o5,	%o2,	%l5
	addcc	%l4,	%l2,	%i7
	tsubcctv	%g5,	%i3,	%l3
	edge16l	%o4,	%i1,	%i6
	fpackfix	%f14,	%f22
	sdivcc	%o7,	0x1654,	%l1
	tge	%xcc,	0x7
	fmovspos	%xcc,	%f24,	%f30
	bneg	loop_1308
	siam	0x6
	orncc	%o0,	%o6,	%g1
	set	0x78, %g2
	stxa	%i5,	[%l7 + %g2] 0x22
	membar	#Sync
loop_1308:
	fpack32	%f6,	%f22,	%f24
	subc	%g2,	%l0,	%i0
	edge32ln	%g6,	%g4,	%i2
	edge8l	%g3,	%g7,	%o3
	fbu	%fcc0,	loop_1309
	siam	0x6
	ldd	[%l7 + 0x40],	%i4
	addc	%l6,	%o5,	%o1
loop_1309:
	stx	%l5,	[%l7 + 0x78]
	taddcctv	%l4,	%o2,	%i7
	subcc	%g5,	%i3,	%l2
	fbug	%fcc3,	loop_1310
	fcmpes	%fcc1,	%f14,	%f10
	movrgez	%o4,	%l3,	%i6
	tl	%icc,	0x5
loop_1310:
	movg	%xcc,	%i1,	%o7
	movpos	%icc,	%l1,	%o6
	ba	%icc,	loop_1311
	tcs	%icc,	0x4
	nop
	set	0x28, %l5
	lduh	[%l7 + %l5],	%o0
	ba,pn	%icc,	loop_1312
loop_1311:
	fabss	%f26,	%f13
	srax	%i5,	%g1,	%g2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1312:
	edge32	%i0,	%g6,	%l0
	array32	%i2,	%g4,	%g7
	xor	%o3,	%g3,	%i4
	bl	loop_1313
	mova	%icc,	%o5,	%o1
	orn	%l5,	0x1FBC,	%l4
	sethi	0x06BB,	%o2
loop_1313:
	movrgez	%i7,	%l6,	%i3
	tcs	%icc,	0x4
	set	0x48, %i2
	stxa	%l2,	[%l7 + %i2] 0x2a
	membar	#Sync
	tg	%icc,	0x1
	sllx	%o4,	%g5,	%l3
	edge32l	%i6,	%i1,	%o7
	tcs	%xcc,	0x2
	popc	%l1,	%o6
	movrlez	%o0,	%i5,	%g2
	move	%xcc,	%i0,	%g1
	addc	%l0,	%g6,	%i2
	wr	%g0,	0x0c,	%asi
	lduha	[%l7 + 0x32] %asi,	%g7
	tsubcc	%o3,	0x0F7E,	%g4
	fxors	%f20,	%f14,	%f9
	edge8ln	%i4,	%g3,	%o5
	movrlz	%l5,	%l4,	%o2
	std	%f18,	[%l7 + 0x38]
	add	%l7,	0x38,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%o1,	%i7
	movrgz	%l6,	%i3,	%l2
	bcc,pt	%xcc,	loop_1314
	fnands	%f15,	%f25,	%f18
	lduw	[%l7 + 0x7C],	%o4
	mulx	%l3,	%g5,	%i1
loop_1314:
	xnorcc	%o7,	%i6,	%l1
	array32	%o0,	%i5,	%g2
	fmovsvc	%xcc,	%f14,	%f15
	addcc	%o6,	0x0CFF,	%i0
	edge16	%l0,	%g1,	%i2
	call	loop_1315
	te	%icc,	0x1
	edge8ln	%g6,	%o3,	%g7
	sethi	0x1705,	%i4
loop_1315:
	sethi	0x092F,	%g3
	fnors	%f0,	%f8,	%f31
	tvs	%icc,	0x7
	movre	%o5,	0x0AB,	%g4
	fmovdcs	%icc,	%f17,	%f10
	andn	%l5,	%o2,	%o1
	edge8	%l4,	%l6,	%i3
	fmovrdlz	%i7,	%f28,	%f20
	movle	%icc,	%l2,	%l3
	movrlez	%o4,	%i1,	%o7
	udiv	%g5,	0x0121,	%l1
	movneg	%icc,	%i6,	%o0
	tcc	%icc,	0x6
	fpackfix	%f26,	%f1
	wr	%g0,	0xeb,	%asi
	stwa	%i5,	[%l7 + 0x5C] %asi
	membar	#Sync
	movvc	%icc,	%o6,	%i0
	sethi	0x1C00,	%l0
	siam	0x0
	sll	%g1,	%g2,	%g6
	tne	%xcc,	0x7
	fandnot2s	%f3,	%f6,	%f14
	umul	%i2,	0x0A1E,	%g7
	sdivcc	%o3,	0x18AC,	%g3
	tleu	%icc,	0x6
	mulscc	%o5,	%i4,	%l5
	nop
	setx	loop_1316,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fbge	%fcc2,	loop_1317
	umul	%o2,	0x02C2,	%g4
	bpos,pt	%icc,	loop_1318
loop_1316:
	fpadd32s	%f6,	%f29,	%f24
loop_1317:
	fcmpeq16	%f4,	%f10,	%o1
	fornot2	%f6,	%f18,	%f20
loop_1318:
	fmovsg	%xcc,	%f0,	%f10
	membar	0x07
	fandnot2s	%f11,	%f2,	%f2
	udiv	%l6,	0x0A3B,	%i3
	set	0x7C, %o3
	lduwa	[%l7 + %o3] 0x88,	%l4
	ble,a	loop_1319
	edge16l	%l2,	%l3,	%o4
	fmovrsne	%i1,	%f9,	%f18
	fbe	%fcc1,	loop_1320
loop_1319:
	or	%i7,	0x021C,	%g5
	stx	%l1,	[%l7 + 0x50]
	prefetch	[%l7 + 0x2C],	 0x2
loop_1320:
	tpos	%icc,	0x1
	alignaddr	%i6,	%o7,	%i5
	add	%l7,	0x48,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%o6,	%o0
	movcc	%icc,	%l0,	%i0
	edge32ln	%g1,	%g6,	%i2
	sllx	%g7,	%g2,	%o3
	wr	%g0,	0x23,	%asi
	stba	%o5,	[%l7 + 0x67] %asi
	membar	#Sync
	fone	%f22
	stbar
	array32	%g3,	%l5,	%i4
	tsubcctv	%o2,	%o1,	%l6
	movrlz	%i3,	%g4,	%l4
	fmovdg	%xcc,	%f13,	%f20
	sdiv	%l2,	0x13A5,	%o4
	srax	%i1,	0x0C,	%i7
	edge16l	%g5,	%l3,	%i6
	alignaddrl	%l1,	%o7,	%i5
	alignaddrl	%o0,	%l0,	%i0
	bneg,a,pn	%xcc,	loop_1321
	fzero	%f8
	movrlez	%g1,	%o6,	%i2
	sdivcc	%g6,	0x05FC,	%g7
loop_1321:
	fmovrsne	%o3,	%f10,	%f20
	ldx	[%l7 + 0x10],	%g2
	edge32l	%o5,	%g3,	%l5
	tpos	%xcc,	0x3
	andncc	%o2,	%o1,	%i4
	udivx	%i3,	0x07F5,	%l6
	orncc	%g4,	0x00C5,	%l2
	wr	%g0,	0x19,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	edge8l	%l4,	%o4,	%i1
	fbl	%fcc1,	loop_1322
	movge	%xcc,	%i7,	%l3
	udivx	%g5,	0x16BC,	%i6
	add	%l7,	0x24,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] %asi,	%o7,	%l1
loop_1322:
	nop
	wr	%g0,	0x19,	%asi
	swapa	[%l7 + 0x0C] %asi,	%i5
	movleu	%icc,	%l0,	%i0
	membar	0x0C
	fandnot2	%f10,	%f24,	%f2
	edge8	%o0,	%g1,	%i2
	fmovdn	%icc,	%f14,	%f20
	wr	%g0,	0xea,	%asi
	ldda	[%l7 + 0x60] %asi,	%o6
	umul	%g6,	0x163D,	%o3
	fmovscc	%xcc,	%f17,	%f27
	fmul8x16	%f7,	%f8,	%f12
	fnot2	%f22,	%f2
	fandnot1s	%f24,	%f9,	%f30
	fcmped	%fcc1,	%f18,	%f28
	sdivcc	%g2,	0x029C,	%o5
	edge8ln	%g3,	%g7,	%o2
	sir	0x0E94
	wr	%g0,	0x89,	%asi
	ldsha	[%l7 + 0x26] %asi,	%l5
	wr	%g0,	0xeb,	%asi
	stwa	%i4,	[%l7 + 0x68] %asi
	membar	#Sync
	tle	%xcc,	0x2
	mulscc	%o1,	0x0C1C,	%i3
	fmul8x16	%f26,	%f14,	%f16
	fpack32	%f20,	%f26,	%f6
	tleu	%icc,	0x4
	srax	%g4,	0x06,	%l2
	fcmpne16	%f30,	%f28,	%l6
	movrlez	%o4,	0x312,	%l4
	fcmped	%fcc3,	%f12,	%f26
	te	%xcc,	0x6
	nop
	setx	loop_1323,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	taddcctv	%i7,	0x1271,	%i1
	bn	%xcc,	loop_1324
	movne	%icc,	%g5,	%i6
loop_1323:
	fbg,a	%fcc2,	loop_1325
	siam	0x4
loop_1324:
	movre	%o7,	0x184,	%l1
	fmovsg	%xcc,	%f19,	%f0
loop_1325:
	or	%l3,	%l0,	%i0
	fbuge,a	%fcc0,	loop_1326
	fnot2	%f2,	%f4
	edge16	%o0,	%g1,	%i5
	sir	0x099F
loop_1326:
	taddcc	%o6,	%g6,	%o3
	edge16ln	%i2,	%g2,	%g3
	fpackfix	%f30,	%f7
	set	0x56, %g5
	lduba	[%l7 + %g5] 0x15,	%o5
	fmovsn	%icc,	%f21,	%f11
	array32	%g7,	%l5,	%i4
	wr	%g0,	0x88,	%asi
	sta	%f0,	[%l7 + 0x38] %asi
	popc	0x0257,	%o1
	edge8	%i3,	%g4,	%l2
	alignaddrl	%o2,	%l6,	%o4
	orcc	%l4,	0x1B79,	%i1
	brlz	%g5,	loop_1327
	addccc	%i6,	%o7,	%l1
	fmovdneg	%icc,	%f23,	%f19
	fmovdvs	%icc,	%f13,	%f24
loop_1327:
	fnot2	%f30,	%f30
	fmovrse	%l3,	%f18,	%f9
	and	%l0,	0x072C,	%i7
	movl	%xcc,	%i0,	%o0
	fmovd	%f10,	%f2
	taddcctv	%i5,	%o6,	%g6
	set	0x2C, %l1
	lduha	[%l7 + %l1] 0x89,	%o3
	fbge,a	%fcc1,	loop_1328
	tcs	%icc,	0x1
	mova	%icc,	%g1,	%g2
	movgu	%xcc,	%i2,	%o5
loop_1328:
	udivcc	%g7,	0x0A19,	%l5
	add	%i4,	%g3,	%o1
	bn,pn	%icc,	loop_1329
	fbg,a	%fcc2,	loop_1330
	movpos	%xcc,	%g4,	%l2
	movgu	%icc,	%o2,	%i3
loop_1329:
	or	%o4,	0x0C1C,	%l6
loop_1330:
	fmul8sux16	%f24,	%f2,	%f6
	movge	%xcc,	%i1,	%l4
	fabsd	%f22,	%f22
	tl	%xcc,	0x0
	mova	%icc,	%g5,	%i6
	fmovrsgz	%l1,	%f0,	%f29
	andcc	%l3,	%o7,	%i7
	alignaddr	%i0,	%l0,	%o0
	fxor	%f22,	%f12,	%f20
	fbge,a	%fcc2,	loop_1331
	stx	%o6,	[%l7 + 0x70]
	fmovrdlz	%i5,	%f16,	%f16
	andncc	%o3,	%g1,	%g6
loop_1331:
	fsrc2	%f22,	%f0
	movne	%xcc,	%g2,	%i2
	fxnor	%f12,	%f12,	%f18
	subcc	%g7,	0x1942,	%l5
	ld	[%l7 + 0x08],	%f23
	fmovd	%f10,	%f10
	andn	%o5,	%g3,	%i4
	edge32	%g4,	%o1,	%l2
	smulcc	%i3,	0x04BE,	%o2
	umulcc	%l6,	0x14EF,	%o4
	movge	%icc,	%i1,	%l4
	add	%l7,	0x10,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%i6,	%l1
	movgu	%xcc,	%l3,	%g5
	te	%xcc,	0x1
	sllx	%o7,	%i0,	%l0
	xor	%i7,	0x1C0C,	%o6
	andcc	%o0,	0x08F1,	%i5
	fmovrslz	%g1,	%f31,	%f4
	fbo,a	%fcc3,	loop_1332
	movneg	%icc,	%o3,	%g6
	subcc	%i2,	0x1577,	%g2
	fbe,a	%fcc1,	loop_1333
loop_1332:
	fbo	%fcc3,	loop_1334
	bleu,a,pn	%icc,	loop_1335
	fornot1s	%f27,	%f1,	%f9
loop_1333:
	tl	%icc,	0x1
loop_1334:
	smulcc	%g7,	%l5,	%o5
loop_1335:
	array16	%g3,	%i4,	%g4
	ldub	[%l7 + 0x61],	%l2
	nop
	setx	loop_1336,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	bleu,pt	%xcc,	loop_1337
	edge8l	%o1,	%i3,	%l6
	alignaddrl	%o2,	%o4,	%i1
loop_1336:
	nop
	set	0x30, %l0
	lduba	[%l7 + %l0] 0x10,	%i6
loop_1337:
	edge8ln	%l4,	%l1,	%g5
	prefetch	[%l7 + 0x28],	 0x3
	ta	%icc,	0x7
	ldsb	[%l7 + 0x28],	%o7
	taddcc	%l3,	%i0,	%l0
	fmovdpos	%xcc,	%f17,	%f0
	nop
	setx	loop_1338,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	alignaddrl	%i7,	%o0,	%i5
	tpos	%xcc,	0x3
	tvs	%icc,	0x5
loop_1338:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stb	%g1,	[%l7 + 0x14]
	fbule,a	%fcc0,	loop_1339
	move	%icc,	%o6,	%g6
	tgu	%xcc,	0x7
	xor	%o3,	0x1719,	%i2
loop_1339:
	movgu	%icc,	%g2,	%g7
	swap	[%l7 + 0x78],	%o5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	taddcctv	%l5,	%i4,	%g3
	fba	%fcc1,	loop_1340
	fcmple32	%f26,	%f30,	%g4
	xnor	%o1,	0x0742,	%l2
	wr	%g0,	0x11,	%asi
	swapa	[%l7 + 0x70] %asi,	%l6
loop_1340:
	fnegs	%f29,	%f0
	wr	%g0,	0x89,	%asi
	swapa	[%l7 + 0x40] %asi,	%i3
	ta	%icc,	0x6
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
	stbar
	tpos	%xcc,	0x5
	fnot2s	%f12,	%f19
loop_1341:
	nop
	set	0x44, %i7
	ldswa	[%l7 + %i7] 0x19,	%o4
	bcs,a,pn	%xcc,	loop_1342
	fpadd32s	%f26,	%f4,	%f22
	tle	%xcc,	0x5
	movrne	%o2,	%i6,	%i1
loop_1342:
	edge32n	%l4,	%g5,	%l1
	fmovdle	%xcc,	%f5,	%f29
	xor	%l3,	%i0,	%l0
	fpsub16	%f4,	%f24,	%f24
	brlz,a	%i7,	loop_1343
	fornot1	%f6,	%f8,	%f2
	fmul8ulx16	%f24,	%f4,	%f18
	fnor	%f24,	%f14,	%f4
loop_1343:
	sllx	%o7,	%i5,	%g1
	edge32n	%o0,	%g6,	%o3
	edge16n	%i2,	%o6,	%g7
	fcmple32	%f10,	%f26,	%g2
	edge32n	%o5,	%l5,	%g3
	fmovsle	%xcc,	%f18,	%f17
	move	%xcc,	%g4,	%i4
	addccc	%l2,	0x1B7F,	%l6
	set	0x60, %i4
	ldda	[%l7 + %i4] 0x04,	%i2
	ld	[%l7 + 0x24],	%f30
	tpos	%xcc,	0x6
	tge	%icc,	0x1
	fmovdne	%xcc,	%f21,	%f31
	movge	%icc,	%o1,	%o2
	fnegs	%f21,	%f5
	xorcc	%i6,	0x1B9C,	%o4
	nop
	set	0x28, %i1
	std	%i0,	[%l7 + %i1]
	fmovse	%icc,	%f13,	%f22
	membar	0x33
	bne,a	loop_1344
	fbue,a	%fcc0,	loop_1345
	sll	%g5,	%l4,	%l3
	edge8ln	%l1,	%l0,	%i0
loop_1344:
	fmovs	%f20,	%f24
loop_1345:
	nop
	set	0x20, %i6
	sta	%f27,	[%l7 + %i6] 0x04
	tn	%xcc,	0x4
	tgu	%icc,	0x7
	wr	%g0,	0x18,	%asi
	lduwa	[%l7 + 0x78] %asi,	%i7
	subcc	%o7,	%g1,	%i5
	fba	%fcc1,	loop_1346
	fbe	%fcc0,	loop_1347
	bpos	loop_1348
	xor	%g6,	%o0,	%i2
loop_1346:
	tne	%xcc,	0x3
loop_1347:
	mulx	%o6,	%o3,	%g2
loop_1348:
	tvc	%icc,	0x7
	fcmple16	%f0,	%f4,	%o5
	sra	%g7,	0x0F,	%l5
	orncc	%g4,	%g3,	%l2
	bne,pt	%icc,	loop_1349
	addccc	%l6,	0x1CDA,	%i4
	bl,a,pt	%xcc,	loop_1350
	ldsh	[%l7 + 0x4A],	%i3
loop_1349:
	fbule	%fcc0,	loop_1351
	fbne	%fcc1,	loop_1352
loop_1350:
	siam	0x2
	taddcctv	%o2,	%i6,	%o1
loop_1351:
	subccc	%o4,	0x05C5,	%g5
loop_1352:
	smul	%l4,	%l3,	%i1
	brlez	%l1,	loop_1353
	tpos	%icc,	0x2
	move	%xcc,	%l0,	%i7
	xnor	%o7,	%i0,	%g1
loop_1353:
	mova	%icc,	%i5,	%o0
	umul	%i2,	%o6,	%o3
	fmovdneg	%xcc,	%f5,	%f6
	alignaddr	%g6,	%o5,	%g7
	addccc	%g2,	0x12EA,	%l5
	ldd	[%l7 + 0x70],	%g2
	tgu	%icc,	0x5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	brgz,a	%l2,	loop_1354
	fmovsne	%xcc,	%f8,	%f6
	fbu	%fcc3,	loop_1355
	fsrc1s	%f27,	%f28
loop_1354:
	fandnot2	%f20,	%f0,	%f28
	bne,a,pn	%xcc,	loop_1356
loop_1355:
	array16	%l6,	%i4,	%i3
	fbl	%fcc3,	loop_1357
	fmovdge	%xcc,	%f22,	%f3
loop_1356:
	fbuge,a	%fcc3,	loop_1358
	fmul8x16al	%f2,	%f27,	%f0
loop_1357:
	nop
	set	0x20, %o2
	lda	[%l7 + %o2] 0x80,	%f6
loop_1358:
	nop
	wr	%g0,	0x80,	%asi
	lduha	[%l7 + 0x22] %asi,	%g4
	or	%o2,	0x0DB1,	%i6
	xnor	%o1,	0x0265,	%o4
	alignaddr	%l4,	%l3,	%g5
	mulscc	%l1,	0x1B43,	%l0
	std	%f20,	[%l7 + 0x78]
	fandnot1s	%f13,	%f7,	%f12
	sdivx	%i1,	0x0D3F,	%i7
	movrlz	%o7,	%i0,	%i5
	fmovdne	%xcc,	%f13,	%f24
	fandnot1	%f24,	%f30,	%f0
	edge32l	%o0,	%g1,	%i2
	fmovrdgz	%o3,	%f4,	%f14
	movvc	%xcc,	%g6,	%o6
	movle	%xcc,	%o5,	%g7
	brlez,a	%g2,	loop_1359
	xnor	%l5,	%g3,	%l6
	bcs	%icc,	loop_1360
	mova	%xcc,	%l2,	%i3
loop_1359:
	fnegs	%f18,	%f6
	nop
	setx loop_1361, %l0, %l1
	jmpl %l1, %g4
loop_1360:
	brz,a	%i4,	loop_1362
	fblg	%fcc2,	loop_1363
	ldstub	[%l7 + 0x6E],	%i6
loop_1361:
	orcc	%o1,	0x160C,	%o2
loop_1362:
	edge32n	%o4,	%l3,	%l4
loop_1363:
	movg	%icc,	%g5,	%l0
	nop
	setx	loop_1364,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tcc	%icc,	0x0
	fnand	%f20,	%f4,	%f8
	set	0x7E, %g4
	ldsba	[%l7 + %g4] 0x14,	%i1
loop_1364:
	fbu,a	%fcc3,	loop_1365
	tn	%icc,	0x3
	nop
	setx loop_1366, %l0, %l1
	jmpl %l1, %i7
	edge32n	%l1,	%i0,	%i5
loop_1365:
	brlz,a	%o7,	loop_1367
	orncc	%o0,	0x02F7,	%i2
loop_1366:
	tvs	%icc,	0x5
	tgu	%xcc,	0x6
loop_1367:
	srax	%g1,	0x03,	%g6
	set	0x40, %l6
	stda	%f0,	[%l7 + %l6] 0xf8
	membar	#Sync
	bcc,a,pt	%xcc,	loop_1368
	udiv	%o6,	0x127E,	%o3
	fxor	%f8,	%f28,	%f18
	tcc	%xcc,	0x3
loop_1368:
	taddcctv	%g7,	0x05FF,	%o5
	ta	%xcc,	0x6
	ba	%icc,	loop_1369
	bvc	%xcc,	loop_1370
	stx	%g2,	[%l7 + 0x30]
	fbue,a	%fcc0,	loop_1371
loop_1369:
	sdivcc	%l5,	0x1537,	%l6
loop_1370:
	fbne,a	%fcc0,	loop_1372
	orncc	%g3,	%i3,	%g4
loop_1371:
	fornot1s	%f25,	%f16,	%f10
	wr	%g0,	0x10,	%asi
	lduba	[%l7 + 0x2C] %asi,	%l2
loop_1372:
	fones	%f3
	set	0x20, %o6
	ldda	[%l7 + %o6] 0x2f,	%i4
	fpsub32	%f6,	%f20,	%f8
	movrlez	%i6,	%o1,	%o2
	tsubcctv	%o4,	%l4,	%g5
	wr	%g0,	0x2c,	%asi
	ldda	[%l7 + 0x60] %asi,	%l0
	fmovdleu	%xcc,	%f17,	%f11
	edge16ln	%i1,	%i7,	%l3
	edge8l	%l1,	%i5,	%o7
	fpack16	%f24,	%f31
	mulscc	%i0,	%o0,	%i2
	sll	%g1,	0x1A,	%g6
	tl	%xcc,	0x6
	wr	%g0,	0x80,	%asi
	stba	%o6,	[%l7 + 0x37] %asi
	andn	%g7,	%o3,	%o5
	tle	%xcc,	0x5
	fmovrsgez	%l5,	%f23,	%f5
	movpos	%xcc,	%g2,	%g3
	edge32ln	%l6,	%g4,	%i3
	movle	%xcc,	%i4,	%l2
	brnz	%i6,	loop_1373
	sdiv	%o2,	0x0E64,	%o4
	lduh	[%l7 + 0x6C],	%o1
	movgu	%xcc,	%g5,	%l0
loop_1373:
	movcc	%icc,	%l4,	%i1
	std	%i6,	[%l7 + 0x78]
	popc	%l1,	%i5
	fcmps	%fcc2,	%f14,	%f21
	movn	%xcc,	%o7,	%l3
	fmovdvs	%xcc,	%f25,	%f11
	move	%icc,	%i0,	%o0
	sir	0x05FB
	tsubcctv	%i2,	%g1,	%o6
	fmovrdgez	%g6,	%f2,	%f12
	fcmps	%fcc3,	%f26,	%f22
	udivx	%g7,	0x0ED9,	%o3
	movge	%xcc,	%l5,	%g2
	edge32l	%o5,	%g3,	%l6
	bge	loop_1374
	popc	0x014E,	%g4
	mova	%xcc,	%i3,	%i4
	bleu,a,pt	%icc,	loop_1375
loop_1374:
	orcc	%l2,	0x16A1,	%i6
	fbn,a	%fcc3,	loop_1376
	movge	%xcc,	%o4,	%o1
loop_1375:
	movrgez	%o2,	0x199,	%l0
	membar	0x09
loop_1376:
	or	%l4,	%i1,	%g5
	movneg	%icc,	%l1,	%i7
	array16	%o7,	%l3,	%i5
	tpos	%icc,	0x0
	sdivcc	%i0,	0x162B,	%i2
	addccc	%g1,	0x1470,	%o0
	fmovscs	%xcc,	%f17,	%f12
	fbg,a	%fcc2,	loop_1377
	nop
	setx	loop_1378,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	tleu	%icc,	0x4
	fmuld8ulx16	%f6,	%f3,	%f0
loop_1377:
	tneg	%xcc,	0x3
loop_1378:
	fmovsn	%icc,	%f15,	%f21
	movg	%icc,	%o6,	%g6
	xnor	%o3,	%g7,	%g2
	nop
	set	0x30, %i3
	std	%f10,	[%l7 + %i3]
	ld	[%l7 + 0x50],	%f26
	fsrc2	%f20,	%f26
	edge32	%l5,	%o5,	%g3
	fmovsleu	%icc,	%f12,	%f20
	fmovsvc	%icc,	%f11,	%f15
	subc	%l6,	0x15A7,	%g4
	array8	%i3,	%i4,	%l2
	fbug	%fcc3,	loop_1379
	bvs,a,pt	%icc,	loop_1380
	fbn,a	%fcc3,	loop_1381
	xor	%o4,	0x1E04,	%i6
loop_1379:
	orncc	%o1,	%o2,	%l0
loop_1380:
	fmul8x16	%f22,	%f18,	%f20
loop_1381:
	edge16	%i1,	%l4,	%l1
	movcc	%icc,	%i7,	%g5
	fandnot2s	%f5,	%f16,	%f3
	andn	%o7,	%i5,	%i0
	or	%i2,	%g1,	%o0
	or	%l3,	0x1129,	%o6
	bleu,a,pt	%icc,	loop_1382
	srax	%o3,	%g6,	%g7
	subc	%g2,	%o5,	%g3
	sdivcc	%l5,	0x0634,	%g4
loop_1382:
	nop
	set	0x3D, %o5
	lduba	[%l7 + %o5] 0x89,	%l6
	tneg	%xcc,	0x7
	bleu,a	%xcc,	loop_1383
	tvs	%icc,	0x0
	subc	%i3,	0x1E85,	%i4
	fxnor	%f2,	%f20,	%f0
loop_1383:
	smul	%l2,	0x18C2,	%i6
	edge8n	%o4,	%o2,	%l0
	fbne,a	%fcc1,	loop_1384
	fbne,a	%fcc2,	loop_1385
	sethi	0x016E,	%i1
	tsubcctv	%l4,	0x140C,	%l1
loop_1384:
	taddcc	%o1,	0x00AA,	%i7
loop_1385:
	addcc	%o7,	0x05E8,	%i5
	tvc	%xcc,	0x6
	sra	%i0,	%g5,	%i2
	tgu	%icc,	0x5
	taddcc	%o0,	%g1,	%o6
	fmul8sux16	%f20,	%f22,	%f24
	srl	%l3,	%o3,	%g7
	tn	%icc,	0x6
	sdivx	%g6,	0x19E7,	%g2
	bleu,a,pt	%icc,	loop_1386
	subcc	%g3,	%o5,	%g4
	mulx	%l5,	%i3,	%l6
	xorcc	%l2,	%i6,	%o4
loop_1386:
	udiv	%o2,	0x07A9,	%i4
	movrgz	%l0,	%i1,	%l1
	addcc	%o1,	0x1F76,	%l4
	movne	%xcc,	%o7,	%i7
	taddcc	%i0,	0x0AF5,	%g5
	fornot1	%f28,	%f10,	%f6
	fpackfix	%f16,	%f14
	add	%l7,	0x08,	%l6
	wr	%g0,	0x19,	%asi
	ldxa	[%l6] %asi,	%i2
	casxa	[%l6] 0x19,	%i2,	%i5
	sir	0x0C37
	fnot2	%f14,	%f12
	movle	%xcc,	%g1,	%o0
	orn	%l3,	%o3,	%g7
	wr	%g0,	0x18,	%asi
	lduba	[%l7 + 0x22] %asi,	%g6
	std	%f14,	[%l7 + 0x48]
	wr	%g0,	0x21,	%asi
	stxa	%g2,	[%g0 + 0x8] %asi
	fbne	%fcc1,	loop_1387
	fabss	%f9,	%f21
	fmovdpos	%xcc,	%f14,	%f3
	sir	0x0740
loop_1387:
	movcc	%xcc,	%o6,	%o5
	edge8	%g3,	%g4,	%i3
	fmovdneg	%xcc,	%f0,	%f15
	alignaddrl	%l6,	%l2,	%l5
	fmovsge	%xcc,	%f29,	%f17
	xnor	%o4,	0x0ECF,	%i6
	movleu	%xcc,	%o2,	%l0
	sdivcc	%i4,	0x1830,	%l1
	sra	%i1,	0x14,	%l4
	tpos	%xcc,	0x4
	add	%l7,	0x6C,	%l6
	wr	%g0,	0x10,	%asi
	casa	[%l6] 0x10,	%o1,	%i7
	addccc	%i0,	0x01EC,	%g5
	ld	[%l7 + 0x60],	%f23
	edge8l	%o7,	%i2,	%i5
	lduw	[%l7 + 0x54],	%g1
	sdiv	%o0,	0x1302,	%l3
	orncc	%g7,	%o3,	%g2
	sdiv	%g6,	0x08E5,	%o6
	edge32n	%g3,	%o5,	%g4
	fpadd16	%f12,	%f10,	%f8
	tsubcctv	%l6,	0x07D0,	%l2
	fnot1s	%f15,	%f4
	st	%f30,	[%l7 + 0x18]
	sllx	%l5,	0x0F,	%i3
	nop
	setx	loop_1388,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	sllx	%i6,	%o4,	%o2
	andcc	%i4,	0x17A8,	%l1
	tle	%xcc,	0x5
loop_1388:
	fmovrslez	%i1,	%f3,	%f15
	nop
	setx	loop_1389,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fsrc2	%f30,	%f30
	movl	%xcc,	%l0,	%l4
	ldsb	[%l7 + 0x37],	%i7
loop_1389:
	xorcc	%o1,	%i0,	%o7
	sllx	%i2,	0x00,	%g5
	fmul8x16al	%f31,	%f10,	%f24
	be,a	loop_1390
	edge32l	%g1,	%i5,	%l3
	move	%xcc,	%g7,	%o0
	sdivcc	%g2,	0x198C,	%g6
loop_1390:
	ldsh	[%l7 + 0x2C],	%o6
	add	%l7,	0x2C,	%l6
	wr	%g0,	0x18,	%asi
	lda	[%l6] %asi,	%g3
	casa	[%l6] 0x18,	%g3,	%o5
	fnot1	%f20,	%f10
	flush	%l7 + 0x48
	subc	%o3,	%g4,	%l6
	fmul8x16au	%f13,	%f20,	%f8
	edge8n	%l5,	%i3,	%i6
	fcmple32	%f18,	%f12,	%l2
	xnor	%o4,	0x1BBC,	%i4
	ldsb	[%l7 + 0x1F],	%l1
	sra	%o2,	%l0,	%l4
	tleu	%xcc,	0x7
	brlz	%i1,	loop_1391
	and	%o1,	%i7,	%i0
	fmovsvs	%icc,	%f11,	%f28
	fone	%f10
loop_1391:
	fzeros	%f12
	and	%i2,	0x0AC1,	%g5
	movg	%icc,	%g1,	%o7
	edge16	%l3,	%i5,	%o0
	tsubcctv	%g7,	0x1DB9,	%g2
	edge32n	%g6,	%g3,	%o6
	tl	%xcc,	0x0
	fcmpes	%fcc3,	%f2,	%f21
	udivx	%o5,	0x1A8D,	%o3
	edge16ln	%l6,	%g4,	%l5
	movn	%xcc,	%i3,	%i6
	edge16	%l2,	%o4,	%i4
	movgu	%icc,	%o2,	%l0
	movge	%xcc,	%l4,	%i1
	movrne	%o1,	0x3A8,	%i7
	wr	%g0,	0x89,	%asi
	ldsha	[%l7 + 0x72] %asi,	%l1
	fbue,a	%fcc0,	loop_1392
	movvs	%icc,	%i2,	%i0
	fsrc1s	%f23,	%f31
	set	0x08, %l2
	stwa	%g5,	[%l7 + %l2] 0x81
loop_1392:
	fble	%fcc1,	loop_1393
	fmovsge	%xcc,	%f20,	%f31
	edge8ln	%g1,	%o7,	%i5
	fba,a	%fcc2,	loop_1394
loop_1393:
	tsubcc	%l3,	%o0,	%g2
	nop
	setx loop_1395, %l0, %l1
	jmpl %l1, %g6
	fmovda	%xcc,	%f20,	%f30
loop_1394:
	faligndata	%f28,	%f24,	%f26
	set	0x24, %o7
	stwa	%g7,	[%l7 + %o7] 0x19
loop_1395:
	siam	0x0
	edge8	%o6,	%o5,	%o3
	sdivx	%g3,	0x04B9,	%g4
	edge32l	%l5,	%l6,	%i3
	tg	%icc,	0x6
	fbne	%fcc0,	loop_1396
	xorcc	%i6,	0x09FA,	%l2
	xor	%o4,	%i4,	%l0
	bcc,pt	%xcc,	loop_1397
loop_1396:
	std	%f20,	[%l7 + 0x20]
	tneg	%icc,	0x6
	bg,a,pt	%xcc,	loop_1398
loop_1397:
	sll	%l4,	%i1,	%o1
	nop
	setx loop_1399, %l0, %l1
	jmpl %l1, %o2
	fbu,a	%fcc3,	loop_1400
loop_1398:
	movcc	%xcc,	%l1,	%i2
	edge16n	%i7,	%g5,	%g1
loop_1399:
	fnegs	%f13,	%f12
loop_1400:
	tle	%xcc,	0x3
	array8	%o7,	%i0,	%i5
	movvc	%icc,	%l3,	%o0
	addccc	%g2,	0x0074,	%g6
	andn	%o6,	%g7,	%o3
	fmovsge	%xcc,	%f22,	%f11
	fpadd16	%f2,	%f20,	%f30
	movne	%icc,	%g3,	%o5
	move	%icc,	%g4,	%l6
	fnands	%f30,	%f13,	%f10
	movne	%icc,	%l5,	%i6
	edge8l	%i3,	%o4,	%i4
	movrgz	%l2,	0x0E6,	%l0
	orcc	%l4,	%o1,	%o2
	nop
	set	0x7C, %g7
	ldsw	[%l7 + %g7],	%l1
	fmovde	%xcc,	%f20,	%f14
	te	%icc,	0x3
	fmovde	%icc,	%f6,	%f7
	addccc	%i1,	%i7,	%i2
	movcc	%icc,	%g5,	%o7
	wr	%g0,	0x80,	%asi
	stha	%i0,	[%l7 + 0x3E] %asi
	fbule	%fcc0,	loop_1401
	andncc	%i5,	%l3,	%o0
	stb	%g2,	[%l7 + 0x3E]
	movrgez	%g6,	%g1,	%o6
loop_1401:
	fnors	%f29,	%f21,	%f23
	fbne,a	%fcc0,	loop_1402
	addc	%g7,	%o3,	%g3
	array32	%o5,	%l6,	%g4
	sllx	%l5,	%i3,	%o4
loop_1402:
	brz	%i4,	loop_1403
	fbl,a	%fcc2,	loop_1404
	alignaddr	%i6,	%l0,	%l4
	fmovdcs	%icc,	%f8,	%f5
loop_1403:
	addcc	%o1,	0x05C1,	%o2
loop_1404:
	sll	%l1,	%l2,	%i1
	ld	[%l7 + 0x70],	%f22
	and	%i7,	0x020D,	%g5
	array8	%i2,	%o7,	%i5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpadd16	%f12,	%f6,	%f16
	mulx	%i0,	0x1135,	%o0
	subccc	%l3,	0x1E01,	%g6
	st	%f25,	[%l7 + 0x1C]
	edge8	%g1,	%g2,	%g7
	movvs	%xcc,	%o3,	%o6
	movvc	%xcc,	%g3,	%l6
	movl	%icc,	%o5,	%l5
	movgu	%icc,	%i3,	%g4
	set	0x37, %l3
	ldsba	[%l7 + %l3] 0x04,	%o4
	sir	0x11E9
	or	%i4,	%i6,	%l4
	fmovde	%icc,	%f30,	%f29
	st	%f1,	[%l7 + 0x10]
	lduh	[%l7 + 0x42],	%l0
	siam	0x6
	sir	0x1D9F
	orncc	%o2,	%o1,	%l1
	srlx	%i1,	%i7,	%g5
	ldstub	[%l7 + 0x62],	%i2
	tcs	%xcc,	0x2
	edge16l	%o7,	%l2,	%i0
	addc	%i5,	%o0,	%l3
	subccc	%g1,	%g6,	%g2
	lduh	[%l7 + 0x1E],	%g7
	movrgz	%o3,	%g3,	%l6
	andn	%o6,	0x10E3,	%l5
	te	%xcc,	0x6
	movge	%icc,	%i3,	%g4
	movrgz	%o5,	%i4,	%o4
	be	%icc,	loop_1405
	movneg	%xcc,	%l4,	%l0
	or	%o2,	0x1D81,	%o1
	addccc	%i6,	%i1,	%i7
loop_1405:
	xnor	%l1,	%i2,	%g5
	fmovsa	%icc,	%f7,	%f24
	wr	%g0,	0x80,	%asi
	ldsba	[%l7 + 0x79] %asi,	%o7
	edge16l	%l2,	%i5,	%o0
	movleu	%xcc,	%i0,	%l3
	srax	%g1,	0x1C,	%g2
	ba	%icc,	loop_1406
	tsubcc	%g6,	%o3,	%g7
	movn	%icc,	%g3,	%l6
	edge8	%o6,	%l5,	%i3
loop_1406:
	bl,pt	%xcc,	loop_1407
	fmovse	%icc,	%f4,	%f5
	brz,a	%o5,	loop_1408
	edge32l	%i4,	%o4,	%g4
loop_1407:
	bg,a	loop_1409
	fmovrslz	%l0,	%f1,	%f9
loop_1408:
	movcs	%icc,	%o2,	%o1
	fmovdle	%icc,	%f5,	%f1
loop_1409:
	fxors	%f18,	%f21,	%f4
	stbar
	movvc	%xcc,	%i6,	%l4
	movrlez	%i7,	0x217,	%l1
	addccc	%i1,	0x1407,	%g5
	wr	%g0,	0x89,	%asi
	prefetcha	[%l7 + 0x40] %asi,	 0x0
	orn	%l2,	0x0DB1,	%i5
	fmovrdne	%o0,	%f6,	%f2
	fmovdneg	%xcc,	%f18,	%f21
	tg	%icc,	0x6
	movrgez	%i0,	%l3,	%i2
	tge	%icc,	0x3
	movvc	%icc,	%g2,	%g6
	bshuffle	%f6,	%f18,	%f18
	srl	%g1,	%o3,	%g7
	umulcc	%l6,	0x11F0,	%g3
	movrlz	%o6,	0x307,	%i3
	movl	%xcc,	%l5,	%o5
	brgz	%i4,	loop_1410
	popc	%o4,	%l0
	fnands	%f7,	%f25,	%f9
	sra	%g4,	0x12,	%o1
loop_1410:
	fmovscs	%icc,	%f2,	%f8
	movcs	%xcc,	%o2,	%l4
	smul	%i6,	0x01F1,	%i7
	nop 	! 	nop 	! 	wr	%g0,	0x40,	%asi ripped by fixASI40.pl ripped by fixASI40.pl
	nop 	! 	nop 	! 	ldxa	[%g0 + 0x358] %asi,	%i1 ripped by fixASI40.pl ripped by fixASI40.pl
	fcmps	%fcc2,	%f7,	%f4
	fornot2s	%f24,	%f17,	%f20
	srlx	%l1,	0x03,	%o7
	andcc	%l2,	0x0170,	%g5
	edge8n	%i5,	%i0,	%l3
	fpsub16	%f10,	%f2,	%f20
	edge8n	%o0,	%i2,	%g6
	edge16	%g2,	%g1,	%o3
	tl	%icc,	0x4
	movrgz	%g7,	0x2E9,	%g3
	fmovscc	%xcc,	%f2,	%f6
	tvc	%icc,	0x2
	ldstub	[%l7 + 0x37],	%l6
	wr	%g0,	0xe2,	%asi
	stba	%o6,	[%l7 + 0x30] %asi
	membar	#Sync
	movre	%i3,	0x284,	%l5
	swap	[%l7 + 0x7C],	%i4
	set	0x30, %o1
	stwa	%o4,	[%l7 + %o1] 0x23
	membar	#Sync
	tpos	%xcc,	0x4
	edge32l	%l0,	%g4,	%o1
	add	%l7,	0x74,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%o2,	%o5
	sub	%i6,	%i7,	%i1
	tvs	%xcc,	0x1
	fone	%f14
	sdivcc	%l4,	0x170A,	%l1
	edge32n	%l2,	%o7,	%g5
	edge32l	%i5,	%l3,	%o0
	subccc	%i2,	0x0237,	%i0
	edge16	%g6,	%g1,	%g2
	fmovdle	%xcc,	%f12,	%f18
	set	0x08, %l4
	lda	[%l7 + %l4] 0x0c,	%f18
	tn	%icc,	0x7
	tsubcctv	%o3,	%g7,	%l6
	wr	%g0,	0x11,	%asi
	stda	%g2,	[%l7 + 0x18] %asi
	tgu	%icc,	0x4
	fmovsge	%xcc,	%f29,	%f0
	sdivcc	%i3,	0x027E,	%l5
	udivx	%i4,	0x1CFC,	%o6
	xnor	%o4,	%l0,	%o1
	srax	%o2,	%g4,	%i6
	fcmped	%fcc1,	%f8,	%f12
	move	%xcc,	%o5,	%i7
	alignaddr	%i1,	%l4,	%l2
	ldstub	[%l7 + 0x25],	%l1
	set	0x32, %g3
	ldsba	[%l7 + %g3] 0x19,	%g5
	fnot2s	%f26,	%f11
	srax	%o7,	%i5,	%o0
	movvc	%xcc,	%i2,	%l3
	udivcc	%g6,	0x1581,	%i0
	andncc	%g1,	%g2,	%g7
	bge,a	%xcc,	loop_1411
	fmovsge	%xcc,	%f13,	%f26
	movg	%icc,	%l6,	%g3
	ldsh	[%l7 + 0x62],	%o3
loop_1411:
	movrgez	%l5,	0x1B4,	%i3
	fandnot1s	%f6,	%f11,	%f18
	srlx	%i4,	%o4,	%o6
	tpos	%xcc,	0x2
	brnz	%o1,	loop_1412
	movre	%l0,	%o2,	%i6
	movgu	%xcc,	%g4,	%i7
	fmovsn	%icc,	%f13,	%f26
loop_1412:
	call	loop_1413
	bgu	loop_1414
	tg	%xcc,	0x3
	ta	%icc,	0x1
loop_1413:
	popc	0x00EA,	%i1
loop_1414:
	movrgez	%l4,	0x26F,	%o5
	udivcc	%l1,	0x1B56,	%l2
	fmovsneg	%icc,	%f16,	%f23
	fmovsa	%xcc,	%f1,	%f18
	umul	%o7,	%i5,	%g5
	fmovrsgz	%i2,	%f2,	%f7
	andcc	%o0,	%g6,	%i0
	popc	0x17E9,	%l3
	movn	%xcc,	%g1,	%g2
	tne	%xcc,	0x7
	membar	#Sync
	set	0x40, %i5
	ldda	[%l7 + %i5] 0xf0,	%f16
	fmul8x16al	%f1,	%f8,	%f16
	te	%icc,	0x7
	movrlez	%g7,	0x0CE,	%l6
	set	0x5C, %o4
	sta	%f12,	[%l7 + %o4] 0x11
	orn	%o3,	0x01B8,	%g3
	ld	[%l7 + 0x30],	%f1
	xnor	%i3,	0x124A,	%l5
	set	0x24, %o0
	ldswa	[%l7 + %o0] 0x10,	%i4
	tcc	%icc,	0x1
	xnorcc	%o4,	%o6,	%l0
	andn	%o2,	%i6,	%o1
	set	0x50, %g1
	ldstuba	[%l7 + %g1] 0x11,	%i7
	fmovrslez	%i1,	%f28,	%f12
	wr	%g0,	0x81,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	ble,pn	%icc,	loop_1415
	fexpand	%f31,	%f6
	fornot2s	%f27,	%f9,	%f1
	fnot2s	%f7,	%f22
loop_1415:
	nop
	set	0x30, %i0
	ldda	[%l7 + %i0] 0x2c,	%g4
	movneg	%xcc,	%l4,	%l1
	tvc	%xcc,	0x7
	fbule,a	%fcc2,	loop_1416
	tle	%icc,	0x2
	xor	%l2,	0x021E,	%o7
	ldx	[%l7 + 0x38],	%o5
loop_1416:
	bleu	%icc,	loop_1417
	array8	%g5,	%i2,	%i5
	tn	%icc,	0x5
	bvs,pt	%xcc,	loop_1418
loop_1417:
	faligndata	%f20,	%f12,	%f24
	set	0x30, %g6
	ldda	[%l7 + %g6] 0x0c,	%g6
loop_1418:
	sdivcc	%o0,	0x183D,	%i0
	orn	%l3,	0x011B,	%g1
	ble,pn	%icc,	loop_1419
	fmovdcc	%icc,	%f17,	%f18
	ble,a	%xcc,	loop_1420
	be	loop_1421
loop_1419:
	fnors	%f5,	%f31,	%f11
	udivx	%g2,	0x04F8,	%g7
loop_1420:
	movpos	%xcc,	%o3,	%l6
loop_1421:
	alignaddr	%i3,	%l5,	%g3
	tvc	%icc,	0x4
	movrgz	%o4,	0x310,	%i4
	fand	%f30,	%f2,	%f12
	srl	%l0,	%o2,	%i6
	edge8ln	%o1,	%i7,	%o6
	alignaddr	%g4,	%l4,	%l1
	tl	%icc,	0x4
	tg	%xcc,	0x1
	bneg,pn	%icc,	loop_1422
	ldx	[%l7 + 0x60],	%l2
	array16	%i1,	%o7,	%g5
	std	%i2,	[%l7 + 0x48]
loop_1422:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sra	%o5,	%g6,	%i5
	fbn	%fcc0,	loop_1423
	brlz	%o0,	loop_1424
	andcc	%l3,	%g1,	%g2
	tvc	%xcc,	0x3
loop_1423:
	tn	%icc,	0x5
loop_1424:
	movl	%icc,	%i0,	%o3
	sub	%l6,	%i3,	%g7
	tvc	%icc,	0x4
	movne	%xcc,	%l5,	%o4
	umul	%g3,	0x1210,	%i4
	tcs	%xcc,	0x7
	andn	%l0,	%i6,	%o2
	umul	%o1,	%o6,	%g4
	array16	%i7,	%l1,	%l4
	umul	%l2,	0x06A7,	%i1
	edge16l	%o7,	%g5,	%o5
	fnands	%f24,	%f0,	%f5
	tneg	%icc,	0x7
	ldx	[%l7 + 0x50],	%g6
	add	%i2,	%i5,	%l3
	tvs	%icc,	0x2
	fmovsg	%xcc,	%f22,	%f19
	set	0x13, %l5
	ldsba	[%l7 + %l5] 0x80,	%o0
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
	bne,a	loop_1426
	bgu,pt	%icc,	loop_1427
	tge	%icc,	0x2
loop_1425:
	xnor	%g2,	0x101D,	%i0
loop_1426:
	popc	0x0D04,	%g1
loop_1427:
	nop
	set	0x2C, %g2
	ldsw	[%l7 + %g2],	%l6
	fnand	%f16,	%f30,	%f12
	xnor	%i3,	0x10D0,	%o3
	wr	%g0,	0x89,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	fmovdg	%icc,	%f18,	%f21
	movcs	%icc,	%l5,	%g7
	tcs	%icc,	0x1
	fblg	%fcc1,	loop_1428
	srax	%g3,	%i4,	%o4
	brnz	%l0,	loop_1429
	srax	%o2,	%i6,	%o1
loop_1428:
	tne	%icc,	0x2
	move	%xcc,	%o6,	%g4
loop_1429:
	andncc	%i7,	%l4,	%l2
	faligndata	%f22,	%f20,	%f2
	fmovse	%xcc,	%f15,	%f4
	wr	%g0,	0x11,	%asi
	ldxa	[%l7 + 0x10] %asi,	%i1
	fmovrsgez	%o7,	%f24,	%f21
	ta	%xcc,	0x4
	umulcc	%l1,	%o5,	%g5
	addcc	%g6,	0x1F5D,	%i5
	sth	%l3,	[%l7 + 0x76]
	addcc	%o0,	%i2,	%i0
	fpmerge	%f31,	%f21,	%f12
	edge16n	%g2,	%g1,	%i3
	fmovsneg	%xcc,	%f31,	%f13
	brz,a	%o3,	loop_1430
	sra	%l5,	%l6,	%g3
	movleu	%icc,	%g7,	%i4
	edge16	%o4,	%l0,	%i6
loop_1430:
	orncc	%o2,	0x076F,	%o6
	edge8l	%g4,	%o1,	%i7
	addccc	%l2,	0x0C19,	%i1
	sdiv	%l4,	0x0F1C,	%o7
	fmovdneg	%icc,	%f20,	%f14
	srlx	%l1,	0x03,	%o5
	fmovsvc	%xcc,	%f13,	%f12
	andcc	%g6,	%g5,	%i5
	fsrc2s	%f1,	%f24
	set	0x7A, %o3
	lduha	[%l7 + %o3] 0x0c,	%o0
	movgu	%icc,	%i2,	%l3
	movle	%xcc,	%g2,	%g1
	fmovde	%xcc,	%f10,	%f27
	fmovscs	%xcc,	%f9,	%f27
	taddcctv	%i0,	%i3,	%o3
	addc	%l6,	%g3,	%g7
	xnor	%i4,	0x04A2,	%l5
	siam	0x4
	orcc	%o4,	%l0,	%i6
	lduh	[%l7 + 0x30],	%o2
	bneg,pt	%icc,	loop_1431
	and	%g4,	0x0FD0,	%o6
	smulcc	%i7,	0x0B8A,	%o1
	fmovde	%xcc,	%f19,	%f15
loop_1431:
	fpadd32	%f0,	%f0,	%f20
	set	0x3A, %g5
	lduba	[%l7 + %g5] 0x80,	%l2
	bn,a,pn	%xcc,	loop_1432
	fxnors	%f9,	%f3,	%f13
	andncc	%l4,	%o7,	%l1
	fcmpes	%fcc1,	%f27,	%f14
loop_1432:
	fmovdneg	%xcc,	%f12,	%f7
	set	0x20, %i2
	stba	%i1,	[%l7 + %i2] 0x80
	edge32ln	%o5,	%g5,	%g6
	add	%i5,	0x0AE1,	%i2
	te	%icc,	0x3
	fba,a	%fcc2,	loop_1433
	popc	0x0E1F,	%l3
	alignaddrl	%g2,	%o0,	%i0
	fmovsneg	%xcc,	%f17,	%f24
loop_1433:
	alignaddrl	%i3,	%o3,	%l6
	ta	%icc,	0x1
	bge,a,pt	%icc,	loop_1434
	be,pn	%xcc,	loop_1435
	fmul8ulx16	%f24,	%f8,	%f18
	set	0x73, %l1
	ldsba	[%l7 + %l1] 0x0c,	%g1
loop_1434:
	tvc	%xcc,	0x6
loop_1435:
	add	%g3,	0x09D7,	%i4
	fnot1	%f14,	%f0
	fandnot1s	%f16,	%f10,	%f22
	movgu	%icc,	%g7,	%o4
	add	%l7,	0x50,	%l6
	wr	%g0,	0x11,	%asi
	lda	[%l6] %asi,	%l0
	casa	[%l6] 0x11,	%l0,	%l5
	wr	%g0,	0x26,	%asi
	ldda	[%l7 + 0x30] %asi,	%o2
	ldd	[%l7 + 0x30],	%g4
	ldub	[%l7 + 0x24],	%i6
	tcc	%icc,	0x4
	edge16	%o6,	%o1,	%l2
	ldsw	[%l7 + 0x5C],	%i7
	edge16ln	%o7,	%l1,	%l4
	bneg,a	loop_1436
	call	loop_1437
	ldd	[%l7 + 0x58],	%o4
	array32	%i1,	%g6,	%g5
loop_1436:
	bneg,a	%icc,	loop_1438
loop_1437:
	array8	%i5,	%i2,	%g2
	tpos	%xcc,	0x1
	fmovdvs	%xcc,	%f16,	%f2
loop_1438:
	tge	%xcc,	0x3
	fabsd	%f24,	%f6
	fands	%f17,	%f25,	%f15
	edge32n	%o0,	%l3,	%i3
	movneg	%xcc,	%o3,	%i0
	movle	%icc,	%l6,	%g1
	stw	%i4,	[%l7 + 0x58]
	edge32l	%g3,	%o4,	%g7
	movleu	%icc,	%l5,	%o2
	fsrc2s	%f27,	%f17
	for	%f26,	%f20,	%f20
	fbul	%fcc0,	loop_1439
	edge16n	%g4,	%l0,	%o6
	movrlez	%i6,	0x0A1,	%l2
	tg	%xcc,	0x3
loop_1439:
	movvc	%xcc,	%i7,	%o7
	array32	%l1,	%o1,	%o5
	fbu	%fcc3,	loop_1440
	fmovdcc	%icc,	%f7,	%f7
	andcc	%l4,	0x13FC,	%i1
	wr	%g0,	0x04,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
loop_1440:
	tsubcc	%g6,	%g5,	%i2
	fmovspos	%xcc,	%f10,	%f30
	fmul8ulx16	%f22,	%f4,	%f12
	ldsb	[%l7 + 0x35],	%g2
	fpadd16	%f10,	%f14,	%f22
	srl	%o0,	0x0F,	%i5
	movleu	%xcc,	%i3,	%o3
	membar	#Sync
	set	0x40, %l0
	ldda	[%l7 + %l0] 0x1e,	%f16
	xnor	%l3,	0x082E,	%i0
	wr	%g0,	0x89,	%asi
	prefetcha	[%l7 + 0x50] %asi,	 0x2
	fmovspos	%icc,	%f30,	%f15
	fbug	%fcc2,	loop_1441
	fmovd	%f14,	%f0
	ble,a	loop_1442
	edge16ln	%g1,	%i4,	%g3
loop_1441:
	fands	%f20,	%f13,	%f29
	stw	%g7,	[%l7 + 0x78]
loop_1442:
	smulcc	%l5,	0x0229,	%o2
	wr	%g0,	0x18,	%asi
	sta	%f14,	[%l7 + 0x48] %asi
	movneg	%icc,	%g4,	%o4
	edge8n	%o6,	%l0,	%i6
	swap	[%l7 + 0x44],	%i7
	brlz,a	%l2,	loop_1443
	fcmpgt16	%f6,	%f8,	%l1
	mova	%xcc,	%o1,	%o5
	smulcc	%o7,	%l4,	%i1
loop_1443:
	movle	%xcc,	%g6,	%g5
	fmovsvc	%icc,	%f5,	%f30
	sdivcc	%i2,	0x0F1C,	%o0
	mova	%icc,	%i5,	%g2
	taddcctv	%i3,	0x0CAC,	%l3
	fxors	%f14,	%f11,	%f16
	fbne	%fcc2,	loop_1444
	std	%o2,	[%l7 + 0x20]
	sll	%l6,	%g1,	%i0
	andcc	%g3,	0x1944,	%i4
loop_1444:
	sdiv	%l5,	0x07CB,	%g7
	tge	%icc,	0x2
	smulcc	%g4,	%o2,	%o4
	xor	%o6,	%l0,	%i6
	fxors	%f28,	%f16,	%f3
	fbg,a	%fcc3,	loop_1445
	mova	%icc,	%i7,	%l2
	ba,pt	%icc,	loop_1446
	edge8	%l1,	%o1,	%o7
loop_1445:
	edge16n	%l4,	%o5,	%i1
	orcc	%g5,	%i2,	%o0
loop_1446:
	fnand	%f20,	%f12,	%f16
	fcmpeq32	%f22,	%f0,	%g6
	orcc	%g2,	0x195C,	%i5
	sdivx	%i3,	0x0048,	%l3
	fpsub32s	%f5,	%f30,	%f9
	wr	%g0,	0x19,	%asi
	stwa	%l6,	[%l7 + 0x30] %asi
	ta	%xcc,	0x4
	sdivx	%o3,	0x00AD,	%i0
	umul	%g1,	%g3,	%i4
	st	%f4,	[%l7 + 0x30]
	movrlz	%g7,	%g4,	%o2
	alignaddrl	%l5,	%o6,	%o4
	edge8ln	%i6,	%l0,	%l2
	fexpand	%f11,	%f8
	edge8l	%i7,	%l1,	%o7
	edge8	%o1,	%l4,	%o5
	sub	%g5,	%i1,	%o0
	subccc	%i2,	%g2,	%g6
	bn	%xcc,	loop_1447
	siam	0x4
	xor	%i5,	0x0FA5,	%i3
	smulcc	%l6,	%o3,	%i0
loop_1447:
	tn	%icc,	0x0
	tcs	%icc,	0x2
	fmovspos	%icc,	%f19,	%f3
	sth	%l3,	[%l7 + 0x2E]
	xnor	%g1,	0x1E27,	%i4
	or	%g3,	%g4,	%g7
	ldstub	[%l7 + 0x38],	%o2
	fmovrdgz	%o6,	%f2,	%f14
	bshuffle	%f18,	%f4,	%f6
	xnorcc	%l5,	%i6,	%l0
	fbg,a	%fcc0,	loop_1448
	fmovsvc	%icc,	%f11,	%f15
	set	0x18, %i7
	swapa	[%l7 + %i7] 0x11,	%o4
loop_1448:
	fmovrsgz	%i7,	%f25,	%f12
	movpos	%icc,	%l1,	%l2
	tcc	%xcc,	0x3
	xnorcc	%o1,	0x0942,	%l4
	movg	%icc,	%o5,	%g5
	udiv	%i1,	0x0D6C,	%o7
	ta	%icc,	0x6
	umulcc	%o0,	%g2,	%g6
	brgez	%i5,	loop_1449
	fbuge	%fcc0,	loop_1450
	brz	%i2,	loop_1451
	fmovdle	%icc,	%f30,	%f11
loop_1449:
	fble,a	%fcc0,	loop_1452
loop_1450:
	tne	%icc,	0x5
loop_1451:
	brz,a	%l6,	loop_1453
	and	%o3,	0x0978,	%i3
loop_1452:
	brgez,a	%l3,	loop_1454
	array16	%g1,	%i0,	%g3
loop_1453:
	fmovrsgez	%i4,	%f30,	%f30
	movgu	%xcc,	%g4,	%o2
loop_1454:
	popc	0x0727,	%g7
	fandnot1	%f30,	%f6,	%f12
	fcmpgt32	%f22,	%f6,	%o6
	fbue	%fcc1,	loop_1455
	sethi	0x0764,	%i6
	tg	%xcc,	0x6
	fmovdvs	%icc,	%f6,	%f3
loop_1455:
	andncc	%l0,	%o4,	%l5
	move	%icc,	%i7,	%l1
	brz,a	%o1,	loop_1456
	fbul	%fcc2,	loop_1457
	te	%icc,	0x2
	bvc	%xcc,	loop_1458
loop_1456:
	fmovsleu	%icc,	%f18,	%f13
loop_1457:
	fbue	%fcc3,	loop_1459
	edge16	%l2,	%l4,	%g5
loop_1458:
	xor	%o5,	%i1,	%o7
	std	%o0,	[%l7 + 0x40]
loop_1459:
	fbug	%fcc1,	loop_1460
	movn	%icc,	%g2,	%i5
	taddcc	%g6,	0x1304,	%i2
	fmovsn	%xcc,	%f18,	%f16
loop_1460:
	bn	%xcc,	loop_1461
	fbe,a	%fcc2,	loop_1462
	bpos,pt	%icc,	loop_1463
	fmovsvs	%xcc,	%f18,	%f20
loop_1461:
	fnegs	%f13,	%f0
loop_1462:
	mova	%xcc,	%l6,	%i3
loop_1463:
	umul	%l3,	0x041F,	%g1
	brlz	%o3,	loop_1464
	tl	%icc,	0x4
	nop
	setx	loop_1465,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movcs	%xcc,	%i0,	%g3
loop_1464:
	fba,a	%fcc1,	loop_1466
	fors	%f5,	%f30,	%f0
loop_1465:
	sdiv	%i4,	0x0415,	%o2
	edge32	%g7,	%o6,	%g4
loop_1466:
	sdivcc	%l0,	0x0A71,	%i6
	sir	0x1F72
	edge16	%o4,	%i7,	%l5
	srl	%l1,	%l2,	%o1
	tvs	%icc,	0x3
	set	0x08, %i1
	stwa	%l4,	[%l7 + %i1] 0x89
	fmovrsgez	%g5,	%f20,	%f5
	add	%l7,	0x60,	%l6
	wr	%g0,	0x0c,	%asi
	lda	[%l6] %asi,	%o5
	casa	[%l6] %asi,	%o5,	%i1
	bne,a	loop_1467
	tvc	%xcc,	0x5
	tl	%icc,	0x4
	edge8	%o7,	%g2,	%o0
loop_1467:
	ldx	[%l7 + 0x08],	%g6
	bpos,a,pn	%icc,	loop_1468
	fmul8ulx16	%f10,	%f14,	%f6
	movvs	%icc,	%i5,	%l6
	movrgez	%i2,	%l3,	%i3
loop_1468:
	fbul	%fcc3,	loop_1469
	umul	%g1,	%i0,	%o3
	subc	%g3,	0x0F28,	%i4
	fcmpeq32	%f4,	%f22,	%o2
loop_1469:
	fandnot1s	%f1,	%f28,	%f0
	set	0x24, %i6
	stwa	%o6,	[%l7 + %i6] 0x14
	tvs	%icc,	0x6
	umul	%g7,	0x0D24,	%l0
	movcc	%icc,	%i6,	%g4
	movcs	%xcc,	%i7,	%o4
	xnorcc	%l5,	%l1,	%l2
	fxors	%f1,	%f12,	%f24
	movgu	%xcc,	%l4,	%o1
	fsrc1s	%f27,	%f13
	ldd	[%l7 + 0x68],	%g4
	ldub	[%l7 + 0x2F],	%i1
	fmovsvc	%xcc,	%f22,	%f19
	or	%o7,	%o5,	%g2
	fblg,a	%fcc3,	loop_1470
	fmovdneg	%xcc,	%f1,	%f31
	tsubcc	%o0,	%g6,	%i5
	fbl,a	%fcc3,	loop_1471
loop_1470:
	fcmped	%fcc3,	%f20,	%f4
	fmovrslz	%l6,	%f7,	%f14
	umulcc	%l3,	0x0A4B,	%i2
loop_1471:
	tl	%icc,	0x5
	fblg,a	%fcc0,	loop_1472
	smulcc	%g1,	0x041B,	%i0
	flush	%l7 + 0x2C
	wr	%g0,	0x18,	%asi
	stha	%i3,	[%l7 + 0x1A] %asi
loop_1472:
	orncc	%o3,	0x013F,	%g3
	movge	%xcc,	%i4,	%o2
	tpos	%xcc,	0x1
	sethi	0x09EF,	%o6
	wr	%g0,	0x80,	%asi
	ldda	[%l7 + 0x70] %asi,	%g6
	umulcc	%i6,	%l0,	%i7
	orn	%g4,	0x0369,	%o4
	tvc	%xcc,	0x7
	fmovscs	%icc,	%f9,	%f27
	fmovrsne	%l5,	%f31,	%f8
	ba,pn	%xcc,	loop_1473
	popc	0x1FB0,	%l1
	addccc	%l4,	%o1,	%g5
	umulcc	%i1,	%l2,	%o5
loop_1473:
	orncc	%g2,	%o0,	%o7
	addcc	%g6,	0x1B0C,	%i5
	tl	%xcc,	0x7
	brz	%l6,	loop_1474
	tgu	%xcc,	0x2
	array32	%i2,	%l3,	%g1
	orcc	%i0,	0x0343,	%i3
loop_1474:
	fbn,a	%fcc3,	loop_1475
	tsubcc	%g3,	%o3,	%i4
	membar	#Sync
	set	0x40, %o2
	ldda	[%l7 + %o2] 0x1e,	%f16
loop_1475:
	edge8n	%o6,	%o2,	%i6
	tvs	%icc,	0x3
	umulcc	%l0,	0x1E4A,	%i7
	movcs	%icc,	%g4,	%g7
	sir	0x1BF7
	edge8ln	%o4,	%l1,	%l4
	xnorcc	%o1,	%g5,	%i1
	fbn	%fcc3,	loop_1476
	brnz,a	%l5,	loop_1477
	fbue,a	%fcc0,	loop_1478
	srax	%o5,	%l2,	%o0
loop_1476:
	tcs	%icc,	0x3
loop_1477:
	fbe	%fcc3,	loop_1479
loop_1478:
	fors	%f2,	%f1,	%f21
	movcc	%icc,	%g2,	%g6
	addc	%o7,	0x0119,	%l6
loop_1479:
	srl	%i5,	0x08,	%i2
	wr	%g0,	0x19,	%asi
	ldstuba	[%l7 + 0x38] %asi,	%l3
	tcs	%xcc,	0x2
	umulcc	%g1,	%i0,	%i3
	fbul	%fcc3,	loop_1480
	fmovrde	%o3,	%f24,	%f0
	fbuge	%fcc0,	loop_1481
	lduw	[%l7 + 0x18],	%g3
loop_1480:
	or	%i4,	%o2,	%o6
	flush	%l7 + 0x30
loop_1481:
	array32	%i6,	%i7,	%l0
	wr	%g0,	0x18,	%asi
	lduwa	[%l7 + 0x7C] %asi,	%g7
	fcmps	%fcc3,	%f3,	%f2
	fpadd32	%f12,	%f8,	%f22
	sub	%g4,	0x0B61,	%o4
	move	%icc,	%l4,	%o1
	fbo,a	%fcc2,	loop_1482
	movn	%icc,	%l1,	%i1
	set	0x26, %i4
	lduha	[%l7 + %i4] 0x81,	%g5
loop_1482:
	edge8ln	%l5,	%l2,	%o5
	tleu	%xcc,	0x3
	fmovdg	%xcc,	%f10,	%f6
	and	%g2,	0x0ED9,	%o0
	movvc	%icc,	%o7,	%g6
	wr	%g0,	0x89,	%asi
	lda	[%l7 + 0x6C] %asi,	%f17
	fmovdl	%icc,	%f26,	%f23
	fmovspos	%xcc,	%f1,	%f4
	fmovscc	%icc,	%f27,	%f12
	membar	0x62
	edge16l	%i5,	%l6,	%l3
	be,a,pt	%icc,	loop_1483
	array8	%g1,	%i0,	%i2
	bleu	%xcc,	loop_1484
	fpadd16	%f10,	%f26,	%f0
loop_1483:
	tsubcctv	%i3,	%g3,	%i4
	movg	%xcc,	%o3,	%o6
loop_1484:
	ta	%xcc,	0x2
	nop
	set	0x38, %g4
	ldd	[%l7 + %g4],	%o2
	mulx	%i6,	%i7,	%l0
	bcs	%icc,	loop_1485
	movvs	%xcc,	%g7,	%g4
	movpos	%xcc,	%o4,	%l4
	alignaddr	%l1,	%o1,	%i1
loop_1485:
	fbg	%fcc2,	loop_1486
	tsubcctv	%l5,	0x03F8,	%g5
	fabsd	%f10,	%f6
	smulcc	%l2,	0x1F96,	%o5
loop_1486:
	movpos	%icc,	%g2,	%o7
	udivcc	%o0,	0x145D,	%g6
	ld	[%l7 + 0x48],	%f3
	tvc	%icc,	0x6
	ldstub	[%l7 + 0x53],	%l6
	fsrc2s	%f11,	%f16
	movrgez	%l3,	0x3D2,	%g1
	movre	%i5,	0x030,	%i2
	set	0x34, %l6
	lduwa	[%l7 + %l6] 0x80,	%i0
	taddcctv	%i3,	%i4,	%o3
	edge16n	%o6,	%o2,	%i6
	fmovsvs	%icc,	%f15,	%f21
	edge16n	%i7,	%l0,	%g7
	fbg,a	%fcc0,	loop_1487
	smulcc	%g4,	0x1AE6,	%o4
	tsubcc	%l4,	0x0A46,	%g3
	movn	%xcc,	%l1,	%o1
loop_1487:
	movrgez	%i1,	%g5,	%l2
	ldsw	[%l7 + 0x78],	%o5
	movn	%xcc,	%l5,	%o7
	edge32	%g2,	%o0,	%l6
	mulx	%l3,	0x14C5,	%g1
	fone	%f28
	addc	%i5,	0x022B,	%g6
	subc	%i2,	0x1730,	%i0
	fpsub16s	%f22,	%f10,	%f19
	set	0x24, %o6
	lduba	[%l7 + %o6] 0x14,	%i4
	fornot1s	%f25,	%f5,	%f0
	tcs	%xcc,	0x5
	tn	%icc,	0x1
	edge8ln	%o3,	%i3,	%o2
	ta	%xcc,	0x2
	bg,pt	%icc,	loop_1488
	alignaddr	%o6,	%i7,	%l0
	stx	%i6,	[%l7 + 0x40]
	xorcc	%g4,	%g7,	%o4
loop_1488:
	fmovrsne	%l4,	%f28,	%f1
	mulscc	%g3,	%l1,	%o1
	addccc	%g5,	%l2,	%i1
	fnands	%f29,	%f2,	%f24
	mova	%xcc,	%l5,	%o7
	fmovrsgez	%o5,	%f9,	%f24
	movrgz	%g2,	%l6,	%o0
	tsubcc	%l3,	%g1,	%i5
	fnot2	%f16,	%f28
	subccc	%i2,	0x0B15,	%g6
	movrlz	%i0,	0x055,	%o3
	pdist	%f12,	%f24,	%f12
	membar	0x64
	movre	%i3,	0x20A,	%i4
	edge8l	%o2,	%i7,	%l0
	mulscc	%o6,	0x0763,	%i6
	movleu	%xcc,	%g7,	%o4
	bleu,a	loop_1489
	sra	%l4,	0x05,	%g4
	fmovrslz	%l1,	%f24,	%f29
	udiv	%g3,	0x16E8,	%g5
loop_1489:
	nop
	set	0x40, %i3
	prefetcha	[%l7 + %i3] 0x10,	 0x0
	andncc	%i1,	%o1,	%o7
	fornot2s	%f5,	%f15,	%f0
	array32	%l5,	%g2,	%o5
	tgu	%icc,	0x7
	fmovsle	%icc,	%f26,	%f19
	wr	%g0,	0x0c,	%asi
	lda	[%l7 + 0x08] %asi,	%f15
	ldub	[%l7 + 0x48],	%l6
	wr	%g0,	0x11,	%asi
	ldsba	[%l7 + 0x2D] %asi,	%o0
	fornot1s	%f20,	%f7,	%f17
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddr	%l3,	%g1,	%i2
	edge32	%g6,	%i0,	%o3
	fmovsne	%xcc,	%f10,	%f15
	subccc	%i5,	0x06CE,	%i3
	movre	%i4,	%o2,	%i7
	addcc	%o6,	%i6,	%g7
	tneg	%icc,	0x5
	brz	%l0,	loop_1490
	fble,a	%fcc1,	loop_1491
	brgz	%l4,	loop_1492
	fmovdne	%icc,	%f23,	%f14
loop_1490:
	fmovdle	%xcc,	%f27,	%f9
loop_1491:
	mulx	%g4,	%o4,	%l1
loop_1492:
	tg	%xcc,	0x7
	fbe,a	%fcc0,	loop_1493
	edge32l	%g5,	%g3,	%i1
	tn	%icc,	0x0
	smul	%l2,	0x13DB,	%o1
loop_1493:
	brlz,a	%l5,	loop_1494
	call	loop_1495
	tge	%xcc,	0x4
	fcmpne32	%f22,	%f8,	%g2
loop_1494:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1495:
	be,a	loop_1496
	movrgz	%o7,	%l6,	%o5
	movrgz	%o0,	%l3,	%i2
	movrgz	%g6,	0x31A,	%g1
loop_1496:
	tle	%icc,	0x2
	movge	%icc,	%i0,	%o3
	fabsd	%f26,	%f28
	udivcc	%i5,	0x14F9,	%i4
	edge8	%i3,	%o2,	%o6
	addc	%i6,	0x1216,	%g7
	orncc	%i7,	0x062E,	%l4
	taddcctv	%g4,	0x02D8,	%o4
	movneg	%icc,	%l0,	%l1
	array32	%g5,	%i1,	%g3
	xnor	%o1,	0x0262,	%l2
	sir	0x0CDF
	sdivx	%l5,	0x1A1F,	%o7
	ble,a	loop_1497
	bgu	loop_1498
	fcmpne16	%f18,	%f6,	%l6
	xnorcc	%o5,	%o0,	%l3
loop_1497:
	movpos	%xcc,	%g2,	%g6
loop_1498:
	fnot2	%f20,	%f16
	sra	%g1,	%i2,	%i0
	bgu,a,pt	%icc,	loop_1499
	movn	%icc,	%i5,	%o3
	call	loop_1500
	fpsub16	%f12,	%f12,	%f4
loop_1499:
	brgz	%i4,	loop_1501
	bshuffle	%f30,	%f28,	%f22
loop_1500:
	fones	%f23
	movcc	%icc,	%o2,	%i3
loop_1501:
	movge	%xcc,	%o6,	%g7
	edge8	%i7,	%i6,	%g4
	tg	%xcc,	0x1
	nop
	set	0x38, %l2
	std	%l4,	[%l7 + %l2]
	set	0x73, %o5
	stba	%l0,	[%l7 + %o5] 0xe2
	membar	#Sync
	set	0x70, %g7
	sta	%f11,	[%l7 + %g7] 0x81
	fnors	%f19,	%f2,	%f15
	movrne	%l1,	0x300,	%o4
	tl	%icc,	0x6
	fzeros	%f8
	be,a	%xcc,	loop_1502
	fcmpd	%fcc1,	%f0,	%f18
	edge32	%g5,	%i1,	%g3
	bneg	%xcc,	loop_1503
loop_1502:
	brlez	%o1,	loop_1504
	fcmpgt16	%f14,	%f16,	%l2
	set	0x70, %o7
	stda	%o6,	[%l7 + %o7] 0x11
loop_1503:
	fandnot2s	%f31,	%f29,	%f21
loop_1504:
	fpmerge	%f21,	%f3,	%f2
	edge32n	%l6,	%o5,	%o0
	srax	%l5,	%l3,	%g6
	addc	%g1,	0x0D90,	%i2
	fands	%f21,	%f11,	%f12
	fandnot1s	%f29,	%f31,	%f25
	fpsub32	%f24,	%f6,	%f26
	taddcc	%g2,	0x08D2,	%i0
	movre	%o3,	0x3AC,	%i4
	movcc	%xcc,	%i5,	%i3
	fbue,a	%fcc2,	loop_1505
	subccc	%o2,	0x007B,	%o6
	edge8	%i7,	%i6,	%g7
	brgz	%g4,	loop_1506
loop_1505:
	movrne	%l4,	%l1,	%o4
	fmovdl	%xcc,	%f21,	%f10
	te	%xcc,	0x7
loop_1506:
	edge32	%g5,	%l0,	%i1
	faligndata	%f14,	%f4,	%f0
	fmovdge	%icc,	%f24,	%f12
	subc	%g3,	%o1,	%l2
	udivcc	%l6,	0x1FB9,	%o5
	andncc	%o7,	%l5,	%l3
	addc	%o0,	%g6,	%g1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdgu	%xcc,	%f7,	%f23
	set	0x11, %o1
	stba	%i2,	[%l7 + %o1] 0x14
	mulx	%i0,	%o3,	%i4
	fba,a	%fcc0,	loop_1507
	fmovrdne	%g2,	%f30,	%f4
	movn	%xcc,	%i5,	%o2
	fandnot2s	%f7,	%f31,	%f11
loop_1507:
	edge32l	%i3,	%i7,	%o6
	edge16n	%g7,	%i6,	%l4
	smulcc	%g4,	%l1,	%o4
	bshuffle	%f22,	%f30,	%f8
	tpos	%xcc,	0x5
	tl	%xcc,	0x2
	edge32n	%l0,	%g5,	%i1
	ldd	[%l7 + 0x70],	%g2
	array16	%l2,	%l6,	%o5
	tcs	%icc,	0x5
	fmovsne	%xcc,	%f11,	%f11
	ldd	[%l7 + 0x60],	%o0
	movre	%o7,	%l5,	%l3
	fnors	%f16,	%f16,	%f10
	tgu	%xcc,	0x7
	ldx	[%l7 + 0x18],	%o0
	fbul,a	%fcc2,	loop_1508
	fcmple16	%f16,	%f0,	%g6
	movn	%icc,	%i2,	%g1
	array8	%o3,	%i4,	%i0
loop_1508:
	mulscc	%g2,	%i5,	%i3
	bl	loop_1509
	movneg	%xcc,	%o2,	%o6
	fmovscc	%xcc,	%f4,	%f24
	xorcc	%i7,	%i6,	%g7
loop_1509:
	taddcc	%l4,	0x1833,	%l1
	tn	%xcc,	0x7
	movcs	%xcc,	%g4,	%l0
	add	%l7,	0x78,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%o4,	%g5
	ldd	[%l7 + 0x78],	%f24
	fandnot1s	%f29,	%f0,	%f19
	edge8l	%i1,	%g3,	%l2
	mulx	%l6,	0x1492,	%o5
	wr	%g0,	0x81,	%asi
	stha	%o7,	[%l7 + 0x7C] %asi
	movgu	%xcc,	%l5,	%o1
	ldsh	[%l7 + 0x34],	%l3
	movcs	%xcc,	%o0,	%g6
	mova	%icc,	%i2,	%g1
	fnegs	%f6,	%f1
	fmovse	%xcc,	%f3,	%f12
	ldstub	[%l7 + 0x67],	%o3
	addcc	%i0,	%g2,	%i4
	fmovsge	%xcc,	%f26,	%f21
	ldd	[%l7 + 0x38],	%i4
	fmovrdlz	%i3,	%f28,	%f4
	fnand	%f14,	%f14,	%f22
	fornot2	%f2,	%f20,	%f0
	swap	[%l7 + 0x50],	%o6
	movneg	%icc,	%i7,	%o2
	fsrc1s	%f14,	%f7
	brlez	%g7,	loop_1510
	edge32	%l4,	%i6,	%g4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8l	%l0,	%o4,	%g5
loop_1510:
	fbug	%fcc0,	loop_1511
	tneg	%xcc,	0x5
	orncc	%l1,	0x0783,	%i1
	fbn	%fcc0,	loop_1512
loop_1511:
	fmovda	%xcc,	%f19,	%f1
	bcs,pt	%icc,	loop_1513
	movne	%xcc,	%l2,	%g3
loop_1512:
	orncc	%l6,	0x1B07,	%o7
	wr	%g0,	0x19,	%asi
	lduba	[%l7 + 0x5A] %asi,	%l5
loop_1513:
	edge8	%o1,	%l3,	%o0
	wr	%g0,	0x80,	%asi
	ldsba	[%l7 + 0x46] %asi,	%g6
	move	%icc,	%o5,	%i2
	fnand	%f16,	%f26,	%f14
	sra	%g1,	0x00,	%i0
	alignaddr	%o3,	%i4,	%i5
	edge16	%g2,	%o6,	%i7
	array8	%i3,	%g7,	%l4
	brgz,a	%o2,	loop_1514
	tneg	%xcc,	0x0
	fnot2	%f26,	%f24
	membar	#Sync
	wr	%g0,	0x17,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
loop_1514:
	nop
	set	0x34, %l4
	ldsha	[%l7 + %l4] 0x88,	%i6
	stbar
	andncc	%g4,	%o4,	%g5
	movrlez	%l1,	0x1D8,	%i1
	te	%icc,	0x4
	taddcctv	%l0,	0x0460,	%l2
	alignaddr	%l6,	%o7,	%l5
	fble,a	%fcc0,	loop_1515
	array32	%o1,	%g3,	%l3
	subc	%o0,	0x1773,	%g6
	movleu	%icc,	%o5,	%i2
loop_1515:
	move	%icc,	%g1,	%o3
	tn	%xcc,	0x6
	fblg	%fcc3,	loop_1516
	edge16	%i4,	%i5,	%i0
	edge16n	%g2,	%o6,	%i3
	tleu	%icc,	0x3
loop_1516:
	and	%i7,	0x0AE1,	%g7
	fbne	%fcc1,	loop_1517
	sub	%l4,	%i6,	%g4
	tsubcc	%o2,	%g5,	%o4
	fsrc1s	%f10,	%f6
loop_1517:
	fmovscc	%icc,	%f4,	%f0
	set	0x4A, %g3
	stha	%l1,	[%l7 + %g3] 0x14
	nop
	setx	loop_1518,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	nop
	setx	loop_1519,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movgu	%xcc,	%l0,	%i1
	movrlz	%l6,	0x280,	%o7
loop_1518:
	bcs,pn	%icc,	loop_1520
loop_1519:
	fmovsvs	%xcc,	%f17,	%f28
	fmovrsgz	%l2,	%f28,	%f28
	set	0x60, %i5
	lduwa	[%l7 + %i5] 0x81,	%l5
loop_1520:
	movgu	%icc,	%g3,	%o1
	xnorcc	%o0,	%l3,	%g6
	andn	%o5,	0x0B7F,	%i2
	alignaddr	%g1,	%o3,	%i4
	move	%xcc,	%i0,	%g2
	edge16n	%o6,	%i3,	%i7
	tgu	%xcc,	0x0
	fmovrdlz	%g7,	%f18,	%f28
	array32	%l4,	%i6,	%g4
	popc	%i5,	%g5
	fmovrsne	%o2,	%f4,	%f21
	brgez,a	%o4,	loop_1521
	fxors	%f11,	%f16,	%f26
	fmovdvs	%xcc,	%f4,	%f2
	tvc	%xcc,	0x0
loop_1521:
	movrgz	%l1,	%l0,	%i1
	bgu,a,pt	%icc,	loop_1522
	fcmple16	%f12,	%f20,	%o7
	orn	%l6,	%l5,	%g3
	edge32	%o1,	%l2,	%o0
loop_1522:
	array16	%l3,	%o5,	%g6
	edge16n	%i2,	%o3,	%g1
	wr	%g0,	0x10,	%asi
	ldda	[%l7 + 0x20] %asi,	%i0
	movne	%icc,	%g2,	%i4
	fors	%f28,	%f7,	%f7
	movrne	%o6,	0x325,	%i7
	array32	%g7,	%l4,	%i6
	movrlez	%i3,	%g4,	%g5
	fnot2	%f28,	%f6
	movgu	%xcc,	%i5,	%o4
	tneg	%icc,	0x3
	edge32l	%l1,	%l0,	%o2
	tle	%icc,	0x6
	edge8l	%o7,	%l6,	%i1
	edge8l	%l5,	%g3,	%l2
	fxor	%f22,	%f28,	%f2
	tle	%xcc,	0x7
	fmul8x16au	%f21,	%f30,	%f12
	fnot2s	%f26,	%f2
	mulscc	%o1,	0x019F,	%l3
	ldsh	[%l7 + 0x7C],	%o5
	smulcc	%o0,	%i2,	%g6
	movrlez	%g1,	0x393,	%o3
	lduh	[%l7 + 0x64],	%g2
	fxnors	%f17,	%f22,	%f21
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	lduh	[%l7 + 0x24],	%i4
	movrgz	%i0,	%o6,	%i7
	subcc	%l4,	0x1AA8,	%g7
	fbule	%fcc1,	loop_1523
	fmovdg	%icc,	%f25,	%f16
	ta	%icc,	0x0
	nop
	setx loop_1524, %l0, %l1
	jmpl %l1, %i3
loop_1523:
	andn	%g4,	0x137B,	%i6
	array32	%i5,	%o4,	%l1
	edge16ln	%l0,	%g5,	%o7
loop_1524:
	orcc	%l6,	%o2,	%l5
	movle	%xcc,	%i1,	%g3
	movre	%o1,	%l2,	%l3
	edge16	%o5,	%o0,	%g6
	fbe,a	%fcc2,	loop_1525
	bpos,a,pt	%icc,	loop_1526
	fmul8x16	%f18,	%f14,	%f0
	fandnot2s	%f30,	%f25,	%f12
loop_1525:
	fpsub32	%f10,	%f4,	%f14
loop_1526:
	xnor	%i2,	%g1,	%g2
	tsubcc	%o3,	%i0,	%o6
	addccc	%i7,	0x0A3E,	%l4
	array32	%i4,	%g7,	%i3
	ldsw	[%l7 + 0x54],	%g4
	tpos	%xcc,	0x7
	fmovrse	%i5,	%f8,	%f28
	bvs,a,pt	%icc,	loop_1527
	fble,a	%fcc3,	loop_1528
	movgu	%icc,	%i6,	%o4
	fornot2	%f12,	%f6,	%f6
loop_1527:
	tgu	%xcc,	0x4
loop_1528:
	brgez,a	%l1,	loop_1529
	movne	%xcc,	%l0,	%g5
	edge32n	%o7,	%l6,	%o2
	mulx	%i1,	0x0B80,	%l5
loop_1529:
	popc	0x0167,	%o1
	movle	%xcc,	%l2,	%g3
	array32	%o5,	%l3,	%o0
	ldstub	[%l7 + 0x20],	%i2
	addc	%g6,	0x0F2D,	%g1
	lduh	[%l7 + 0x36],	%g2
	add	%i0,	%o6,	%o3
	xnor	%i7,	%i4,	%l4
	udivx	%g7,	0x1588,	%i3
	mova	%icc,	%g4,	%i6
	fmul8sux16	%f10,	%f14,	%f2
	movn	%icc,	%o4,	%l1
	array32	%i5,	%g5,	%l0
	fmovrdlz	%o7,	%f14,	%f8
	ldstub	[%l7 + 0x64],	%o2
	set	0x4C, %o4
	ldswa	[%l7 + %o4] 0x89,	%l6
	set	0x34, %l3
	ldsha	[%l7 + %l3] 0x81,	%i1
	membar	0x2D
	movvs	%xcc,	%o1,	%l5
	andn	%l2,	%o5,	%g3
	movrlz	%l3,	0x3D8,	%o0
	set	0x40, %g1
	stda	%f0,	[%l7 + %g1] 0x11
	movre	%g6,	%g1,	%i2
	orcc	%i0,	0x1D4F,	%g2
	movvc	%xcc,	%o3,	%i7
	alignaddrl	%o6,	%i4,	%g7
	udivcc	%l4,	0x10AF,	%g4
	alignaddr	%i3,	%o4,	%l1
	tcs	%icc,	0x1
	movcs	%icc,	%i6,	%g5
	tgu	%icc,	0x7
	wr	%g0,	0x04,	%asi
	stda	%l0,	[%l7 + 0x08] %asi
	fmovrsgz	%o7,	%f2,	%f3
	andcc	%o2,	0x1F8B,	%i5
	movpos	%icc,	%l6,	%i1
	fcmple16	%f10,	%f18,	%l5
	edge8n	%o1,	%l2,	%g3
	edge8n	%l3,	%o5,	%o0
	fbo	%fcc3,	loop_1530
	fmovdl	%xcc,	%f4,	%f1
	fmovdpos	%icc,	%f11,	%f30
	fone	%f6
loop_1530:
	array16	%g6,	%i2,	%i0
	fmovdvc	%xcc,	%f21,	%f22
	tle	%icc,	0x5
	set	0x60, %i0
	stha	%g1,	[%l7 + %i0] 0x04
	for	%f10,	%f0,	%f18
	andn	%o3,	%i7,	%g2
	set	0x68, %g6
	ldstuba	[%l7 + %g6] 0x88,	%i4
	fmovsge	%xcc,	%f10,	%f22
	be,a,pn	%xcc,	loop_1531
	andn	%g7,	%o6,	%l4
	call	loop_1532
	lduh	[%l7 + 0x68],	%g4
loop_1531:
	fcmpes	%fcc2,	%f7,	%f3
	addc	%o4,	%i3,	%i6
loop_1532:
	nop
	wr	%g0,	0x89,	%asi
	lduba	[%l7 + 0x34] %asi,	%g5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnors	%f0,	%f15,	%f27
	fmovsne	%icc,	%f25,	%f25
	movrlz	%l0,	%l1,	%o2
	std	%f24,	[%l7 + 0x08]
	tgu	%xcc,	0x7
	fxor	%f10,	%f22,	%f6
	ta	%icc,	0x4
	ld	[%l7 + 0x3C],	%f13
	wr	%g0,	0xeb,	%asi
	stba	%i5,	[%l7 + 0x3F] %asi
	membar	#Sync
	lduw	[%l7 + 0x7C],	%o7
	edge8l	%l6,	%l5,	%o1
	taddcc	%i1,	%l2,	%g3
	fnors	%f20,	%f21,	%f15
	movg	%xcc,	%o5,	%l3
	addc	%g6,	%o0,	%i0
	fmovd	%f24,	%f12
	subccc	%i2,	%g1,	%o3
	wr	%g0,	0x80,	%asi
	lduba	[%l7 + 0x50] %asi,	%i7
	move	%icc,	%g2,	%g7
	bgu,pn	%xcc,	loop_1533
	mova	%xcc,	%i4,	%l4
	movvs	%icc,	%g4,	%o4
	edge8n	%o6,	%i6,	%g5
loop_1533:
	st	%f3,	[%l7 + 0x54]
	fcmped	%fcc3,	%f8,	%f2
	movvc	%xcc,	%l0,	%i3
	tle	%icc,	0x3
	movrne	%l1,	0x111,	%o2
	sdivcc	%i5,	0x1382,	%l6
	tge	%xcc,	0x3
	move	%icc,	%o7,	%l5
	siam	0x4
	fmovdvc	%icc,	%f9,	%f31
	tneg	%icc,	0x7
	movl	%icc,	%o1,	%l2
	ldstub	[%l7 + 0x75],	%g3
	fbn	%fcc1,	loop_1534
	movvc	%icc,	%o5,	%l3
	sethi	0x08A4,	%g6
	stb	%i1,	[%l7 + 0x16]
loop_1534:
	fbne,a	%fcc3,	loop_1535
	fmovdge	%icc,	%f28,	%f24
	fbge,a	%fcc1,	loop_1536
	edge8ln	%o0,	%i2,	%i0
loop_1535:
	xnor	%g1,	%o3,	%i7
	faligndata	%f20,	%f24,	%f10
loop_1536:
	lduw	[%l7 + 0x60],	%g2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16l	%i4,	%l4,	%g7
	brz	%g4,	loop_1537
	srl	%o6,	%o4,	%g5
	add	%l0,	%i6,	%l1
	fbo,a	%fcc1,	loop_1538
loop_1537:
	bn,a	%xcc,	loop_1539
	fones	%f9
	umulcc	%i3,	0x0927,	%o2
loop_1538:
	fnot1s	%f0,	%f31
loop_1539:
	tg	%icc,	0x7
	brlz,a	%l6,	loop_1540
	sub	%i5,	%l5,	%o1
	fxor	%f28,	%f16,	%f0
	array16	%l2,	%o7,	%g3
loop_1540:
	sethi	0x1D3E,	%l3
	bleu,a	%icc,	loop_1541
	bcc,a,pt	%icc,	loop_1542
	ldub	[%l7 + 0x70],	%o5
	fandnot2	%f22,	%f26,	%f30
loop_1541:
	edge32ln	%g6,	%i1,	%o0
loop_1542:
	move	%icc,	%i2,	%g1
	sdiv	%o3,	0x12AC,	%i7
	alignaddr	%i0,	%g2,	%i4
	bleu	%xcc,	loop_1543
	and	%g7,	0x030E,	%g4
	fzero	%f28
	set	0x58, %o0
	stxa	%l4,	[%l7 + %o0] 0x19
loop_1543:
	te	%xcc,	0x2
	movrlz	%o4,	0x1B9,	%g5
	fmovdleu	%xcc,	%f30,	%f5
	fba	%fcc0,	loop_1544
	movvc	%icc,	%o6,	%i6
	sethi	0x19C1,	%l1
	bcc,a,pn	%xcc,	loop_1545
loop_1544:
	fbule	%fcc2,	loop_1546
	ldsh	[%l7 + 0x56],	%l0
	movcs	%icc,	%i3,	%o2
loop_1545:
	array8	%i5,	%l5,	%o1
loop_1546:
	movle	%xcc,	%l2,	%o7
	fmovsg	%icc,	%f17,	%f8
	fmovse	%icc,	%f20,	%f29
	brlz	%g3,	loop_1547
	nop
	setx loop_1548, %l0, %l1
	jmpl %l1, %l3
	movleu	%xcc,	%l6,	%o5
	stw	%g6,	[%l7 + 0x18]
loop_1547:
	edge32ln	%o0,	%i2,	%g1
loop_1548:
	tle	%icc,	0x1
	tsubcc	%i1,	%i7,	%i0
	edge16l	%o3,	%i4,	%g2
	fble	%fcc3,	loop_1549
	edge8l	%g7,	%g4,	%o4
	orn	%l4,	0x00B1,	%o6
	movge	%xcc,	%g5,	%l1
loop_1549:
	bpos,a	loop_1550
	array8	%l0,	%i3,	%i6
	edge32ln	%i5,	%o2,	%o1
	sll	%l2,	0x1F,	%l5
loop_1550:
	lduh	[%l7 + 0x4C],	%g3
	lduw	[%l7 + 0x54],	%o7
	movrgz	%l3,	%l6,	%o5
	popc	%o0,	%g6
	sdiv	%g1,	0x0692,	%i2
	set	0x3C, %l5
	lda	[%l7 + %l5] 0x80,	%f24
	swap	[%l7 + 0x38],	%i7
	movre	%i1,	0x09F,	%i0
	movgu	%xcc,	%o3,	%i4
	add	%g2,	%g4,	%g7
	sll	%o4,	0x09,	%l4
	smul	%g5,	0x065A,	%o6
	andncc	%l0,	%l1,	%i3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bn,a	%xcc,	loop_1551
	edge8ln	%i5,	%i6,	%o1
	fmovdge	%icc,	%f22,	%f23
	fexpand	%f11,	%f6
loop_1551:
	sra	%l2,	0x08,	%l5
	smul	%o2,	0x0C8B,	%o7
	fmovs	%f14,	%f8
	ba,pt	%xcc,	loop_1552
	fmovrsgez	%l3,	%f20,	%f2
	fbule,a	%fcc3,	loop_1553
	movvc	%xcc,	%l6,	%o5
loop_1552:
	tvs	%xcc,	0x1
	sdivx	%o0,	0x0489,	%g3
loop_1553:
	fbuge	%fcc2,	loop_1554
	fmovrdlez	%g6,	%f10,	%f20
	taddcctv	%i2,	0x06F8,	%g1
	fxors	%f15,	%f21,	%f28
loop_1554:
	tgu	%icc,	0x2
	popc	0x1B06,	%i1
	array8	%i7,	%i0,	%o3
	fmovda	%icc,	%f0,	%f17
	fmovd	%f8,	%f2
	ldd	[%l7 + 0x10],	%g2
	add	%i4,	%g7,	%o4
	te	%icc,	0x2
	bneg,pt	%xcc,	loop_1555
	movg	%icc,	%g4,	%l4
	tvc	%icc,	0x5
	call	loop_1556
loop_1555:
	array8	%g5,	%o6,	%l1
	fpsub32s	%f18,	%f0,	%f26
	smulcc	%i3,	0x1DF5,	%i5
loop_1556:
	srlx	%i6,	0x16,	%o1
	subc	%l2,	0x1B4B,	%l5
	stw	%l0,	[%l7 + 0x60]
	fmovda	%icc,	%f27,	%f1
	sub	%o7,	0x0BDA,	%l3
	edge16ln	%o2,	%l6,	%o0
	xnor	%g3,	%o5,	%i2
	umulcc	%g1,	0x1597,	%g6
	edge32	%i1,	%i7,	%i0
	umul	%o3,	0x06A1,	%g2
	edge8ln	%i4,	%o4,	%g4
	mova	%xcc,	%l4,	%g7
	bneg,pt	%xcc,	loop_1557
	fxnors	%f29,	%f11,	%f12
	add	%l7,	0x48,	%l6
	wr	%g0,	0x04,	%asi
	ldxa	[%l6] %asi,	%g5
	casxa	[%l6] 0x04,	%g5,	%l1
loop_1557:
	edge8	%i3,	%o6,	%i6
	movg	%icc,	%o1,	%i5
	fands	%f16,	%f15,	%f17
	fnot1s	%f0,	%f26
	udiv	%l5,	0x1BF4,	%l2
	edge32	%l0,	%l3,	%o2
	taddcc	%l6,	0x10CB,	%o0
	srlx	%g3,	%o5,	%i2
	ldd	[%l7 + 0x30],	%f14
	movg	%icc,	%o7,	%g1
	wr	%g0,	0x0c,	%asi
	ldsha	[%l7 + 0x60] %asi,	%g6
	fbu	%fcc3,	loop_1558
	orncc	%i7,	%i1,	%i0
	fpmerge	%f9,	%f31,	%f26
	sdivcc	%o3,	0x06F7,	%g2
loop_1558:
	fbo,a	%fcc3,	loop_1559
	fandnot1s	%f29,	%f31,	%f7
	fbe	%fcc0,	loop_1560
	fmovrde	%i4,	%f6,	%f30
loop_1559:
	fba	%fcc0,	loop_1561
	mulscc	%g4,	%l4,	%o4
loop_1560:
	fmovdcc	%icc,	%f30,	%f29
	fmovrsgz	%g5,	%f10,	%f2
loop_1561:
	fmovse	%xcc,	%f7,	%f24
	edge8ln	%g7,	%i3,	%o6
	wr	%g0,	0x89,	%asi
	prefetcha	[%l7 + 0x10] %asi,	 0x0
	stx	%i6,	[%l7 + 0x08]
	fmovrslez	%o1,	%f10,	%f30
	movcs	%xcc,	%l5,	%i5
	fxnor	%f10,	%f26,	%f28
	movl	%xcc,	%l2,	%l3
	move	%xcc,	%o2,	%l6
	add	%l7,	0x40,	%l6
	wr	%g0,	0x11,	%asi
	casxa	[%l6] %asi,	%o0,	%g3
	movgu	%icc,	%l0,	%o5
	and	%i2,	%g1,	%g6
	sll	%i7,	%i1,	%i0
	movvc	%icc,	%o3,	%g2
	array16	%i4,	%g4,	%o7
	nop
	setx	loop_1562,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	sub	%l4,	%g5,	%g7
	ldsw	[%l7 + 0x54],	%i3
	edge8n	%o4,	%l1,	%i6
loop_1562:
	sub	%o1,	%o6,	%l5
	xnor	%i5,	0x15BC,	%l2
	movle	%xcc,	%l3,	%o2
	faligndata	%f2,	%f20,	%f20
	udivcc	%o0,	0x1491,	%l6
	tvs	%icc,	0x3
	array32	%g3,	%l0,	%i2
	movrlez	%g1,	0x1D6,	%g6
	addccc	%o5,	0x011C,	%i1
	fcmped	%fcc0,	%f2,	%f8
	movge	%xcc,	%i0,	%o3
	fmovdleu	%xcc,	%f29,	%f12
	wr	%g0,	0x10,	%asi
	prefetcha	[%l7 + 0x70] %asi,	 0x1
	fmovscs	%xcc,	%f25,	%f14
	tcc	%xcc,	0x4
	set	0x7E, %o3
	stba	%g2,	[%l7 + %o3] 0x11
	fpadd16s	%f22,	%f6,	%f16
	fmovsneg	%icc,	%f26,	%f12
	tg	%xcc,	0x5
	set	0x40, %g5
	stda	%f0,	[%l7 + %g5] 0x10
	fmovrse	%g4,	%f27,	%f13
	movl	%icc,	%o7,	%i4
	tvs	%icc,	0x0
	nop
	set	0x48, %i2
	ldd	[%l7 + %i2],	%f18
	prefetch	[%l7 + 0x0C],	 0x2
	tneg	%icc,	0x2
	fbn	%fcc1,	loop_1563
	tvs	%icc,	0x7
	xor	%g5,	%g7,	%i3
	xorcc	%o4,	0x106C,	%l1
loop_1563:
	sll	%l4,	0x06,	%o1
	fabss	%f25,	%f24
	set	0x30, %g2
	ldswa	[%l7 + %g2] 0x18,	%o6
	fcmpne32	%f10,	%f8,	%l5
	wr	%g0,	0x10,	%asi
	ldsha	[%l7 + 0x4C] %asi,	%i6
	tleu	%xcc,	0x0
	movrgez	%l2,	%l3,	%i5
	bneg,a	loop_1564
	fsrc1s	%f24,	%f5
	fand	%f22,	%f4,	%f26
	fmovsleu	%icc,	%f2,	%f13
loop_1564:
	array32	%o2,	%l6,	%g3
	flush	%l7 + 0x14
	nop
	set	0x48, %l0
	ldd	[%l7 + %l0],	%f28
	taddcctv	%o0,	%i2,	%l0
	bg	loop_1565
	addc	%g6,	%g1,	%i1
	brlez,a	%o5,	loop_1566
	fmovdl	%xcc,	%f18,	%f9
loop_1565:
	ble	loop_1567
	srlx	%o3,	0x02,	%i7
loop_1566:
	ba,a,pt	%icc,	loop_1568
	addc	%g2,	0x13B1,	%g4
loop_1567:
	taddcctv	%i0,	0x0FC0,	%o7
	edge8ln	%g5,	%g7,	%i3
loop_1568:
	tpos	%icc,	0x5
	wr	%g0,	0x0c,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	movgu	%xcc,	%o4,	%i4
	movcc	%xcc,	%l1,	%o1
	tcs	%icc,	0x1
	movrlz	%l4,	%l5,	%i6
	array8	%l2,	%l3,	%o6
	orcc	%i5,	%o2,	%l6
	sdiv	%g3,	0x1AA0,	%i2
	wr	%g0,	0x0c,	%asi
	lda	[%l7 + 0x10] %asi,	%f16
	tleu	%xcc,	0x3
	array32	%l0,	%g6,	%g1
	fandnot2	%f6,	%f14,	%f30
	bcs,pn	%icc,	loop_1569
	tvs	%xcc,	0x1
	wr	%g0,	0x89,	%asi
	ldxa	[%l7 + 0x48] %asi,	%i1
loop_1569:
	fbu	%fcc0,	loop_1570
	fzero	%f28
	tneg	%icc,	0x5
	srax	%o5,	%o0,	%i7
loop_1570:
	addc	%g2,	%g4,	%o3
	movvc	%icc,	%o7,	%g5
	srl	%i0,	0x19,	%g7
	orncc	%o4,	0x174F,	%i4
	orcc	%l1,	0x01BF,	%i3
	ldx	[%l7 + 0x70],	%l4
	srlx	%o1,	%i6,	%l2
	fcmpes	%fcc3,	%f29,	%f10
	wr	%g0,	0x81,	%asi
	stba	%l5,	[%l7 + 0x67] %asi
	movre	%o6,	%i5,	%l3
	xnor	%o2,	%l6,	%g3
	xor	%l0,	0x13AB,	%i2
	sll	%g6,	%i1,	%o5
	array32	%o0,	%i7,	%g1
	bneg,a	%icc,	loop_1571
	ldx	[%l7 + 0x20],	%g4
	smul	%o3,	%o7,	%g2
	tgu	%icc,	0x2
loop_1571:
	tsubcc	%i0,	%g7,	%o4
	sdivcc	%i4,	0x1123,	%g5
	movrlez	%l1,	0x291,	%l4
	xorcc	%i3,	%o1,	%l2
	ldd	[%l7 + 0x38],	%f6
	array16	%i6,	%o6,	%l5
	mulscc	%l3,	0x0F43,	%i5
	edge32	%l6,	%g3,	%o2
	tcs	%icc,	0x0
	taddcctv	%i2,	0x0872,	%g6
	movcc	%icc,	%l0,	%o5
	movl	%xcc,	%i1,	%i7
	fnors	%f1,	%f31,	%f29
	movne	%icc,	%o0,	%g1
	fbug	%fcc1,	loop_1572
	fbl,a	%fcc3,	loop_1573
	umulcc	%g4,	%o7,	%g2
	fands	%f6,	%f13,	%f26
loop_1572:
	for	%f14,	%f4,	%f18
loop_1573:
	umul	%i0,	0x01AA,	%o3
	stw	%o4,	[%l7 + 0x34]
	fmovda	%xcc,	%f26,	%f14
	subccc	%i4,	0x10B3,	%g5
	movre	%g7,	0x01E,	%l1
	bgu	loop_1574
	sir	0x165D
	edge16	%l4,	%o1,	%i3
	sub	%i6,	%l2,	%o6
loop_1574:
	fble	%fcc1,	loop_1575
	tgu	%icc,	0x6
	fone	%f8
	set	0x30, %l1
	stwa	%l3,	[%l7 + %l1] 0x2b
	membar	#Sync
loop_1575:
	srl	%i5,	0x16,	%l6
	bn	loop_1576
	sethi	0x11EF,	%l5
	fpmerge	%f22,	%f12,	%f18
	bg,a	%xcc,	loop_1577
loop_1576:
	call	loop_1578
	movg	%xcc,	%o2,	%i2
	fmovdcc	%xcc,	%f30,	%f10
loop_1577:
	bgu,a,pt	%xcc,	loop_1579
loop_1578:
	fcmpeq32	%f2,	%f14,	%g6
	movgu	%xcc,	%g3,	%l0
	prefetch	[%l7 + 0x4C],	 0x3
loop_1579:
	taddcc	%o5,	%i7,	%i1
	nop
	set	0x18, %i7
	ldd	[%l7 + %i7],	%f6
	set	0x40, %i1
	stda	%f0,	[%l7 + %i1] 0x16
	membar	#Sync
	tcs	%icc,	0x2
	edge32ln	%o0,	%g1,	%g4
	fbuge,a	%fcc2,	loop_1580
	andcc	%o7,	0x031D,	%g2
	movvs	%xcc,	%i0,	%o4
	fmovsneg	%icc,	%f24,	%f3
loop_1580:
	st	%f5,	[%l7 + 0x64]
	fmovdg	%icc,	%f7,	%f8
	add	%i4,	0x16E3,	%o3
	flush	%l7 + 0x28
	addccc	%g7,	0x0EB9,	%l1
	fandnot1	%f18,	%f2,	%f18
	udivx	%l4,	0x0ECD,	%o1
	fzeros	%f21
	fmovdg	%icc,	%f22,	%f26
	fmovsgu	%icc,	%f9,	%f17
	sdiv	%g5,	0x0279,	%i6
	bn	loop_1581
	edge16n	%i3,	%o6,	%l2
	fnegs	%f14,	%f24
	set	0x10, %i6
	stda	%l2,	[%l7 + %i6] 0x27
	membar	#Sync
loop_1581:
	umul	%l6,	%i5,	%l5
	fcmpne16	%f16,	%f8,	%i2
	tg	%icc,	0x2
	movrlez	%g6,	0x1BE,	%o2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsgu	%icc,	%f14,	%f26
	andn	%g3,	%l0,	%i7
	sub	%o5,	0x18B8,	%i1
	alignaddrl	%g1,	%o0,	%o7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbu	%fcc1,	loop_1582
	fbn	%fcc0,	loop_1583
	xnorcc	%g2,	0x0794,	%i0
	movl	%icc,	%o4,	%g4
loop_1582:
	fble,a	%fcc1,	loop_1584
loop_1583:
	srl	%i4,	%o3,	%g7
	fcmpgt32	%f8,	%f20,	%l4
	add	%o1,	0x02A2,	%g5
loop_1584:
	swap	[%l7 + 0x3C],	%l1
	movrne	%i3,	%i6,	%o6
	udivcc	%l3,	0x141E,	%l2
	ldx	[%l7 + 0x50],	%i5
	std	%l4,	[%l7 + 0x70]
	movn	%xcc,	%l6,	%g6
	fmovspos	%xcc,	%f19,	%f28
	movrne	%o2,	%g3,	%l0
	bvs,a,pt	%icc,	loop_1585
	addc	%i2,	%i7,	%i1
	bvc,a,pn	%xcc,	loop_1586
	fmovda	%xcc,	%f23,	%f15
loop_1585:
	movre	%g1,	%o0,	%o5
	ldd	[%l7 + 0x58],	%g2
loop_1586:
	tvs	%xcc,	0x6
	orncc	%i0,	0x0ABF,	%o4
	brlez,a	%g4,	loop_1587
	fbl	%fcc1,	loop_1588
	fcmpd	%fcc0,	%f4,	%f30
	tsubcctv	%i4,	0x1D84,	%o7
loop_1587:
	brlez	%o3,	loop_1589
loop_1588:
	stb	%g7,	[%l7 + 0x74]
	fcmpeq32	%f24,	%f16,	%l4
	and	%o1,	0x1B05,	%l1
loop_1589:
	alignaddr	%i3,	%i6,	%g5
	tsubcc	%o6,	%l3,	%l2
	tle	%xcc,	0x2
	andncc	%l5,	%l6,	%i5
	stx	%o2,	[%l7 + 0x20]
	movrlz	%g3,	%l0,	%i2
	for	%f0,	%f6,	%f2
	fcmpgt32	%f16,	%f8,	%i7
	lduw	[%l7 + 0x1C],	%i1
	stx	%g6,	[%l7 + 0x38]
	movrgz	%o0,	0x043,	%o5
	movne	%xcc,	%g1,	%g2
	array16	%o4,	%i0,	%g4
	movgu	%xcc,	%i4,	%o7
	sllx	%o3,	0x1E,	%g7
	add	%o1,	%l1,	%l4
	addcc	%i6,	0x0918,	%i3
	alignaddrl	%g5,	%o6,	%l3
	movpos	%icc,	%l2,	%l5
	prefetch	[%l7 + 0x44],	 0x2
	mova	%xcc,	%i5,	%o2
	move	%icc,	%l6,	%l0
	ba,a	%xcc,	loop_1590
	bg,a,pn	%xcc,	loop_1591
	bpos,a	loop_1592
	bcc,a,pt	%xcc,	loop_1593
loop_1590:
	fmovde	%xcc,	%f4,	%f20
loop_1591:
	ta	%icc,	0x3
loop_1592:
	orn	%g3,	%i7,	%i2
loop_1593:
	edge32n	%i1,	%g6,	%o5
	sdivx	%o0,	0x0784,	%g1
	umulcc	%o4,	%i0,	%g4
	tge	%icc,	0x6
	movvc	%icc,	%g2,	%o7
	nop
	setx loop_1594, %l0, %l1
	jmpl %l1, %i4
	srl	%g7,	0x1E,	%o1
	tvs	%icc,	0x7
	std	%f28,	[%l7 + 0x08]
loop_1594:
	mulx	%l1,	0x07D1,	%o3
	fba,a	%fcc2,	loop_1595
	subcc	%l4,	0x1122,	%i3
	xnor	%i6,	%o6,	%g5
	alignaddr	%l3,	%l2,	%i5
loop_1595:
	sub	%l5,	0x0522,	%o2
	subc	%l0,	0x1D36,	%g3
	wr	%g0,	0x2b,	%asi
	stwa	%i7,	[%l7 + 0x30] %asi
	membar	#Sync
	set	0x2D, %o2
	ldsba	[%l7 + %o2] 0x0c,	%l6
	udivcc	%i2,	0x16A8,	%i1
	std	%o4,	[%l7 + 0x38]
	fmul8x16al	%f18,	%f8,	%f6
	edge32	%g6,	%g1,	%o0
	addccc	%o4,	0x08FD,	%g4
	fmovdgu	%xcc,	%f16,	%f30
	tneg	%icc,	0x4
	edge8n	%i0,	%g2,	%i4
	or	%g7,	%o7,	%o1
	orcc	%o3,	0x04E4,	%l4
	fmovdvc	%xcc,	%f9,	%f9
	tcs	%xcc,	0x7
	xnor	%l1,	%i3,	%i6
	xnorcc	%o6,	%g5,	%l2
	taddcc	%l3,	0x08B3,	%l5
	mulx	%i5,	%o2,	%g3
	fmovdge	%icc,	%f7,	%f10
	fornot1	%f20,	%f2,	%f24
	umul	%i7,	%l0,	%l6
	udiv	%i2,	0x1D38,	%i1
	edge32n	%o5,	%g6,	%o0
	set	0x31, %i4
	ldsba	[%l7 + %i4] 0x18,	%g1
	srlx	%o4,	0x03,	%i0
	sllx	%g4,	0x0D,	%g2
	edge16ln	%g7,	%o7,	%i4
	or	%o3,	0x1251,	%o1
	fmovdvs	%xcc,	%f16,	%f21
	umulcc	%l4,	%l1,	%i6
	sethi	0x0255,	%i3
	bpos,a,pt	%xcc,	loop_1596
	umulcc	%g5,	%l2,	%o6
	tge	%icc,	0x2
	edge32ln	%l3,	%l5,	%i5
loop_1596:
	edge16ln	%o2,	%g3,	%l0
	smul	%l6,	%i2,	%i7
	set	0x08, %l6
	ldsba	[%l7 + %l6] 0x88,	%o5
	movle	%xcc,	%g6,	%o0
	fmovspos	%icc,	%f30,	%f23
	fblg,a	%fcc0,	loop_1597
	fmuld8ulx16	%f22,	%f18,	%f0
	brgez,a	%i1,	loop_1598
	srax	%g1,	0x13,	%i0
loop_1597:
	andncc	%g4,	%g2,	%g7
	bleu,a,pt	%icc,	loop_1599
loop_1598:
	sth	%o4,	[%l7 + 0x34]
	pdist	%f14,	%f28,	%f28
	movrlz	%i4,	0x11B,	%o3
loop_1599:
	orn	%o7,	%l4,	%o1
	brnz,a	%l1,	loop_1600
	movg	%xcc,	%i6,	%i3
	ldsh	[%l7 + 0x7E],	%l2
	fcmps	%fcc0,	%f16,	%f21
loop_1600:
	nop
	set	0x50, %o6
	std	%g4,	[%l7 + %o6]
	movrgez	%l3,	0x1D5,	%o6
	mova	%icc,	%l5,	%i5
	sth	%g3,	[%l7 + 0x5C]
	nop
	setx loop_1601, %l0, %l1
	jmpl %l1, %o2
	fbug	%fcc3,	loop_1602
	movrlez	%l6,	%l0,	%i7
	edge8	%o5,	%g6,	%o0
loop_1601:
	tvc	%xcc,	0x7
loop_1602:
	fmovrdlz	%i1,	%f20,	%f8
	tsubcctv	%g1,	%i2,	%i0
	fbn,a	%fcc0,	loop_1603
	fmovdpos	%icc,	%f2,	%f12
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	brlz	%g2,	loop_1604
loop_1603:
	fbn	%fcc1,	loop_1605
	fmovrslz	%g4,	%f10,	%f5
	sdivcc	%g7,	0x1C71,	%o4
loop_1604:
	stb	%i4,	[%l7 + 0x21]
loop_1605:
	nop
	set	0x30, %g4
	stxa	%o3,	[%l7 + %g4] 0xeb
	membar	#Sync
	udiv	%o7,	0x1A73,	%l4
	lduw	[%l7 + 0x64],	%o1
	fandnot1s	%f8,	%f0,	%f8
	subc	%l1,	%i6,	%i3
	addcc	%l2,	%l3,	%g5
	movge	%icc,	%l5,	%o6
	set	0x18, %i3
	stda	%g2,	[%l7 + %i3] 0x11
	mova	%xcc,	%i5,	%o2
	movrlz	%l0,	%l6,	%i7
	addccc	%o5,	%o0,	%i1
	smulcc	%g1,	%i2,	%g6
	add	%i0,	%g4,	%g7
	add	%g2,	0x0232,	%o4
	tvs	%icc,	0x3
	bvc,pt	%xcc,	loop_1606
	ldstub	[%l7 + 0x70],	%o3
	fabss	%f28,	%f11
	tl	%xcc,	0x5
loop_1606:
	movrlz	%i4,	0x308,	%l4
	edge8	%o1,	%o7,	%l1
	orncc	%i3,	%i6,	%l2
	srlx	%l3,	%l5,	%o6
	tgu	%xcc,	0x0
	sll	%g5,	0x14,	%i5
	tle	%icc,	0x5
	wr	%g0,	0x22,	%asi
	stha	%o2,	[%l7 + 0x76] %asi
	membar	#Sync
	edge16ln	%l0,	%l6,	%i7
	fmuld8sux16	%f26,	%f15,	%f26
	alignaddr	%g3,	%o5,	%i1
	membar	0x32
	addc	%o0,	0x0675,	%i2
	andcc	%g6,	%g1,	%i0
	edge32	%g4,	%g7,	%o4
	popc	0x050B,	%o3
	srl	%g2,	%l4,	%i4
	movl	%xcc,	%o1,	%o7
	xnorcc	%i3,	0x0038,	%l1
	tleu	%xcc,	0x1
	fpsub32	%f24,	%f14,	%f6
	bcs,a,pt	%icc,	loop_1607
	fmovsleu	%icc,	%f20,	%f7
	wr	%g0,	0xf8,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
loop_1607:
	xorcc	%i6,	%l3,	%l5
	bgu,a	loop_1608
	fmovrdgez	%l2,	%f4,	%f28
	call	loop_1609
	movle	%xcc,	%g5,	%o6
loop_1608:
	smul	%o2,	%i5,	%l6
	movvc	%icc,	%l0,	%i7
loop_1609:
	movge	%xcc,	%o5,	%g3
	fsrc2s	%f11,	%f19
	sdivcc	%i1,	0x09BC,	%o0
	fmovrdne	%i2,	%f20,	%f6
	movl	%icc,	%g6,	%g1
	fmovsvc	%xcc,	%f28,	%f12
	addcc	%i0,	%g7,	%o4
	ta	%xcc,	0x0
	set	0x27, %l2
	lduba	[%l7 + %l2] 0x19,	%o3
	sllx	%g4,	0x04,	%l4
	fxnors	%f10,	%f31,	%f20
	movrlez	%i4,	0x25D,	%g2
	fcmpgt32	%f8,	%f4,	%o1
	fbuge,a	%fcc2,	loop_1610
	or	%i3,	0x129D,	%l1
	fxors	%f19,	%f2,	%f20
	edge16	%i6,	%o7,	%l3
loop_1610:
	udivx	%l5,	0x1051,	%g5
	andn	%o6,	0x1528,	%l2
	ldsb	[%l7 + 0x78],	%i5
	sdivcc	%l6,	0x1A9E,	%o2
	alignaddrl	%i7,	%l0,	%g3
	movleu	%icc,	%i1,	%o5
	array16	%o0,	%i2,	%g1
	set	0x60, %o5
	prefetcha	[%l7 + %o5] 0x19,	 0x1
	subc	%i0,	0x1E11,	%g7
	array8	%o3,	%o4,	%l4
	fmovdpos	%xcc,	%f10,	%f5
	movleu	%icc,	%i4,	%g2
	stw	%o1,	[%l7 + 0x4C]
	tvs	%icc,	0x5
	movpos	%icc,	%g4,	%l1
	tneg	%xcc,	0x3
	fcmple16	%f28,	%f24,	%i3
	tne	%icc,	0x2
	mova	%icc,	%i6,	%l3
	andn	%l5,	%o7,	%o6
	movrgez	%l2,	%i5,	%l6
	srlx	%o2,	0x0E,	%i7
	movleu	%xcc,	%l0,	%g3
	edge32n	%i1,	%g5,	%o5
	set	0x40, %g7
	ldda	[%l7 + %g7] 0x10,	%f16
	wr	%g0,	0x04,	%asi
	stxa	%o0,	[%l7 + 0x78] %asi
	fcmped	%fcc3,	%f10,	%f14
	nop
	set	0x58, %o1
	ldsw	[%l7 + %o1],	%i2
	udivx	%g6,	0x1555,	%i0
	bneg	%icc,	loop_1611
	sra	%g1,	0x17,	%o3
	fcmpeq16	%f22,	%f26,	%g7
	mulscc	%l4,	%i4,	%g2
loop_1611:
	nop
	wr	%g0,	0x89,	%asi
	lduha	[%l7 + 0x68] %asi,	%o1
	srlx	%o4,	%l1,	%g4
	fone	%f6
	tne	%icc,	0x0
	sllx	%i6,	%l3,	%l5
	tsubcctv	%i3,	%o7,	%l2
	tgu	%xcc,	0x7
	movvs	%xcc,	%i5,	%l6
	bg,a,pn	%xcc,	loop_1612
	fcmple32	%f14,	%f0,	%o2
	fxors	%f23,	%f2,	%f21
	ldx	[%l7 + 0x18],	%i7
loop_1612:
	edge8	%o6,	%g3,	%l0
	fmovda	%icc,	%f24,	%f19
	edge16n	%i1,	%g5,	%o5
	andcc	%o0,	0x00A1,	%g6
	tvs	%icc,	0x1
	wr	%g0,	0x04,	%asi
	stha	%i0,	[%l7 + 0x7C] %asi
	srax	%i2,	0x15,	%g1
	array32	%o3,	%l4,	%g7
	movne	%xcc,	%i4,	%o1
	tcc	%icc,	0x3
	tne	%icc,	0x2
	fnot1	%f12,	%f0
	movge	%icc,	%o4,	%l1
	membar	0x01
	xnorcc	%g2,	%i6,	%l3
	udiv	%l5,	0x0B7C,	%i3
	swap	[%l7 + 0x0C],	%o7
	mova	%icc,	%l2,	%i5
	edge32	%g4,	%o2,	%i7
	addccc	%o6,	%g3,	%l0
	bge	%icc,	loop_1613
	fmul8ulx16	%f2,	%f24,	%f8
	std	%i6,	[%l7 + 0x48]
	tgu	%xcc,	0x3
loop_1613:
	movg	%xcc,	%g5,	%i1
	edge16n	%o5,	%g6,	%i0
	alignaddr	%o0,	%i2,	%g1
	ldd	[%l7 + 0x60],	%f8
	fmovrslz	%o3,	%f16,	%f1
	tcs	%icc,	0x2
	fbue,a	%fcc3,	loop_1614
	addccc	%l4,	0x07DA,	%i4
	tl	%xcc,	0x0
	brlez	%g7,	loop_1615
loop_1614:
	array8	%o4,	%l1,	%g2
	movneg	%icc,	%i6,	%o1
	xnorcc	%l5,	%l3,	%i3
loop_1615:
	fmovrde	%l2,	%f24,	%f24
	ldub	[%l7 + 0x79],	%o7
	faligndata	%f16,	%f22,	%f10
	fmovrdlz	%g4,	%f6,	%f8
	xnorcc	%o2,	0x05CB,	%i7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdgu	%xcc,	%f15,	%f3
	bvc,a	loop_1616
	fornot1	%f26,	%f22,	%f22
	fxnors	%f7,	%f4,	%f2
	fble	%fcc2,	loop_1617
loop_1616:
	brgz,a	%i5,	loop_1618
	mulx	%g3,	%o6,	%l0
	bcc,a,pt	%xcc,	loop_1619
loop_1617:
	fmovsa	%xcc,	%f25,	%f18
loop_1618:
	fnegd	%f26,	%f14
	movn	%icc,	%l6,	%g5
loop_1619:
	fmovspos	%xcc,	%f26,	%f4
	bne,a	loop_1620
	brz,a	%o5,	loop_1621
	fsrc2	%f0,	%f18
	popc	%i1,	%g6
loop_1620:
	movneg	%xcc,	%i0,	%i2
loop_1621:
	nop
	wr	%g0,	0x04,	%asi
	ldstuba	[%l7 + 0x57] %asi,	%g1
	umulcc	%o0,	0x06B7,	%o3
	movrne	%i4,	0x346,	%g7
	edge16	%o4,	%l4,	%l1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fxnors	%f12,	%f12,	%f21
	fble	%fcc0,	loop_1622
	fbn	%fcc3,	loop_1623
	sethi	0x19E8,	%i6
	te	%xcc,	0x3
loop_1622:
	fble,a	%fcc2,	loop_1624
loop_1623:
	movle	%xcc,	%o1,	%g2
	te	%icc,	0x4
	movvs	%xcc,	%l3,	%i3
loop_1624:
	srlx	%l2,	0x0A,	%l5
	xor	%o7,	%o2,	%g4
	fmovrslez	%i7,	%f0,	%f29
	edge16l	%g3,	%o6,	%l0
	brgz,a	%i5,	loop_1625
	te	%icc,	0x6
	bgu,a	%xcc,	loop_1626
	mulx	%g5,	0x1142,	%l6
loop_1625:
	nop
	setx	loop_1627,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
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
loop_1626:
	fcmpeq16	%f24,	%f26,	%i1
	alignaddrl	%o5,	%g6,	%i2
loop_1627:
	ldsb	[%l7 + 0x6F],	%i0
loop_1628:
	umul	%g1,	%o3,	%i4
	fcmpne16	%f26,	%f22,	%g7
	movrlez	%o4,	%l4,	%l1
	brnz	%o0,	loop_1629
	tpos	%xcc,	0x6
	edge8l	%i6,	%o1,	%l3
	tsubcctv	%g2,	0x10C2,	%i3
loop_1629:
	bl,a	%icc,	loop_1630
	tvs	%xcc,	0x1
	movvc	%xcc,	%l2,	%l5
	movvs	%xcc,	%o2,	%o7
loop_1630:
	nop
	wr	%g0,	0x18,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	udivx	%g4,	0x1FC4,	%i7
	tgu	%icc,	0x1
	fmovsne	%icc,	%f6,	%f5
	edge32l	%g3,	%l0,	%i5
	fmovde	%icc,	%f7,	%f12
	tgu	%xcc,	0x3
	fcmpne16	%f24,	%f28,	%g5
	movrlez	%l6,	%i1,	%o6
	fmul8x16au	%f16,	%f30,	%f30
	fmovsge	%icc,	%f22,	%f11
	fandnot1s	%f23,	%f3,	%f27
	alignaddrl	%g6,	%i2,	%o5
	call	loop_1631
	tgu	%xcc,	0x1
	fbl,a	%fcc0,	loop_1632
	edge32l	%i0,	%g1,	%o3
loop_1631:
	fmuld8ulx16	%f29,	%f25,	%f8
	set	0x46, %o7
	stha	%i4,	[%l7 + %o7] 0x2a
	membar	#Sync
loop_1632:
	tge	%xcc,	0x6
	bne,a	loop_1633
	udivcc	%o4,	0x0DFC,	%l4
	sdivcc	%l1,	0x1C40,	%o0
	set	0x40, %g3
	stda	%f0,	[%l7 + %g3] 0xf8
	membar	#Sync
loop_1633:
	orn	%g7,	0x0A7E,	%o1
	set	0x40, %l4
	ldsha	[%l7 + %l4] 0x80,	%l3
	tneg	%xcc,	0x0
	tg	%icc,	0x7
	andncc	%g2,	%i6,	%l2
	smulcc	%i3,	0x1914,	%l5
	movne	%icc,	%o2,	%g4
	fmovda	%xcc,	%f4,	%f21
	fba,a	%fcc2,	loop_1634
	movcs	%icc,	%o7,	%g3
	movgu	%icc,	%l0,	%i7
	fbuge	%fcc3,	loop_1635
loop_1634:
	fmovsneg	%icc,	%f21,	%f21
	bleu,pn	%icc,	loop_1636
	udiv	%g5,	0x10ED,	%i5
loop_1635:
	fmul8x16al	%f16,	%f8,	%f4
	edge16n	%i1,	%o6,	%g6
loop_1636:
	sir	0x08B8
	faligndata	%f4,	%f12,	%f18
	array8	%i2,	%l6,	%o5
	fnor	%f6,	%f8,	%f14
	wr	%g0,	0x89,	%asi
	prefetcha	[%l7 + 0x58] %asi,	 0x3
	edge8ln	%g1,	%i4,	%o3
	move	%icc,	%l4,	%o4
	wr	%g0,	0x10,	%asi
	stwa	%o0,	[%l7 + 0x70] %asi
	lduw	[%l7 + 0x78],	%g7
	bpos,a,pt	%xcc,	loop_1637
	fmovspos	%xcc,	%f10,	%f30
	popc	0x0294,	%o1
	edge32ln	%l1,	%g2,	%i6
loop_1637:
	movgu	%xcc,	%l3,	%l2
	addcc	%l5,	0x03F0,	%i3
	movrgz	%o2,	0x2D2,	%g4
	fmovdcc	%icc,	%f10,	%f14
	bpos	loop_1638
	umul	%o7,	%l0,	%g3
	fmovdleu	%xcc,	%f13,	%f13
	tvc	%xcc,	0x0
loop_1638:
	fmovsvc	%icc,	%f19,	%f3
	edge32l	%i7,	%g5,	%i5
	fmovsvc	%icc,	%f18,	%f22
	and	%i1,	%o6,	%g6
	tle	%xcc,	0x3
	ldd	[%l7 + 0x10],	%i6
	fcmps	%fcc1,	%f30,	%f6
	ba,a	%xcc,	loop_1639
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bcs,a	loop_1640
	be,pt	%icc,	loop_1641
loop_1639:
	or	%i2,	%i0,	%g1
	edge8n	%i4,	%o3,	%l4
loop_1640:
	tcc	%xcc,	0x5
loop_1641:
	edge16	%o5,	%o4,	%o0
	smul	%o1,	%l1,	%g2
	edge32n	%g7,	%l3,	%l2
	xnor	%i6,	0x0EFC,	%i3
	edge16ln	%l5,	%g4,	%o2
	fbl	%fcc0,	loop_1642
	addcc	%o7,	%l0,	%g3
	stw	%i7,	[%l7 + 0x24]
	fblg	%fcc1,	loop_1643
loop_1642:
	tvs	%icc,	0x5
	fornot2	%f8,	%f14,	%f30
	srl	%g5,	%i1,	%o6
loop_1643:
	sll	%i5,	%g6,	%l6
	sll	%i2,	%g1,	%i0
	array16	%i4,	%l4,	%o5
	mova	%xcc,	%o3,	%o4
	movleu	%xcc,	%o0,	%o1
	orn	%l1,	0x1EE5,	%g2
	ldx	[%l7 + 0x38],	%g7
	sub	%l2,	0x17EF,	%l3
	sllx	%i6,	%i3,	%l5
	mova	%icc,	%o2,	%g4
	membar	#Sync
	set	0x40, %i5
	ldda	[%l7 + %i5] 0xf0,	%f16
	srl	%o7,	%g3,	%l0
	array8	%i7,	%g5,	%i1
	bn,a,pn	%icc,	loop_1644
	for	%f8,	%f14,	%f24
	edge16	%o6,	%i5,	%g6
	fabss	%f19,	%f20
loop_1644:
	andn	%l6,	%g1,	%i0
	sethi	0x14C9,	%i4
	smulcc	%i2,	%l4,	%o3
	bshuffle	%f26,	%f20,	%f16
	bg,a	%xcc,	loop_1645
	fmovrsgz	%o5,	%f29,	%f28
	fpack16	%f2,	%f20
	orncc	%o4,	0x11B4,	%o0
loop_1645:
	movre	%l1,	0x162,	%o1
	set	0x40, %l3
	stda	%f16,	[%l7 + %l3] 0x88
	fabss	%f16,	%f31
	edge8	%g7,	%l2,	%l3
	movre	%g2,	0x348,	%i3
	fcmple16	%f12,	%f16,	%l5
	sllx	%o2,	0x09,	%i6
	movgu	%xcc,	%g4,	%o7
	array32	%g3,	%i7,	%l0
	set	0x58, %g1
	prefetcha	[%l7 + %g1] 0x04,	 0x2
	sll	%o6,	0x17,	%i5
	set	0x56, %i0
	stha	%g6,	[%l7 + %i0] 0x19
	fpadd32s	%f28,	%f12,	%f0
	fmovrslz	%i1,	%f25,	%f5
	array16	%g1,	%l6,	%i4
	stx	%i2,	[%l7 + 0x08]
	fmovsl	%icc,	%f9,	%f23
	ble,a,pt	%xcc,	loop_1646
	subcc	%l4,	%o3,	%i0
	srl	%o4,	0x01,	%o5
	udivcc	%l1,	0x0A33,	%o0
loop_1646:
	subcc	%g7,	%l2,	%o1
	fbge	%fcc3,	loop_1647
	fbne	%fcc1,	loop_1648
	tpos	%icc,	0x6
	movrgez	%l3,	0x131,	%g2
loop_1647:
	bleu,a,pt	%icc,	loop_1649
loop_1648:
	udiv	%l5,	0x07C8,	%o2
	tcc	%xcc,	0x0
	orncc	%i6,	0x1416,	%i3
loop_1649:
	sethi	0x0776,	%o7
	sra	%g4,	%g3,	%i7
	orncc	%g5,	0x127B,	%l0
	addc	%i5,	0x1F2D,	%o6
	srl	%i1,	0x16,	%g1
	fmuld8sux16	%f28,	%f16,	%f0
	stbar
	flush	%l7 + 0x2C
	ldd	[%l7 + 0x70],	%i6
	tvs	%xcc,	0x3
	fcmpeq32	%f24,	%f28,	%i4
	fcmpne16	%f4,	%f24,	%g6
	smul	%l4,	%i2,	%i0
	brnz,a	%o4,	loop_1650
	tcs	%xcc,	0x1
	array8	%o5,	%l1,	%o0
	fzeros	%f6
loop_1650:
	fcmpne16	%f2,	%f2,	%g7
	fmovsa	%icc,	%f4,	%f29
	fbg	%fcc2,	loop_1651
	tgu	%icc,	0x4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbuge,a	%fcc0,	loop_1652
loop_1651:
	tleu	%xcc,	0x1
	movrlz	%l2,	%o3,	%l3
	set	0x48, %g6
	stda	%g2,	[%l7 + %g6] 0xe2
	membar	#Sync
loop_1652:
	bvs,a	loop_1653
	movvc	%icc,	%l5,	%o1
	xnorcc	%i6,	%o2,	%o7
	fcmpgt32	%f30,	%f2,	%i3
loop_1653:
	tsubcc	%g3,	%g4,	%i7
	movcc	%xcc,	%l0,	%i5
	fbn,a	%fcc2,	loop_1654
	udiv	%g5,	0x0EF2,	%i1
	fbu	%fcc1,	loop_1655
	edge32	%g1,	%o6,	%i4
loop_1654:
	nop
	membar	#Sync
	set	0x40, %o0
	ldda	[%l7 + %o0] 0xf9,	%f16
loop_1655:
	nop
	setx loop_1656, %l0, %l1
	jmpl %l1, %l6
	tleu	%icc,	0x2
	fbn	%fcc1,	loop_1657
	fmovrdgz	%l4,	%f4,	%f4
loop_1656:
	bn,a,pt	%xcc,	loop_1658
	array8	%g6,	%i0,	%o4
loop_1657:
	nop
	add	%l7,	0x6C,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%o5
	casa	[%l6] %asi,	%o5,	%i2
loop_1658:
	movle	%xcc,	%o0,	%g7
	andcc	%l2,	0x1A8F,	%o3
	fmovsn	%xcc,	%f16,	%f2
	smulcc	%l1,	0x04EE,	%l3
	bge,pt	%icc,	loop_1659
	ta	%xcc,	0x7
	array16	%l5,	%o1,	%g2
	movrne	%o2,	%i6,	%o7
loop_1659:
	tvc	%xcc,	0x4
	fbu,a	%fcc2,	loop_1660
	fmovrdlz	%g3,	%f12,	%f28
	umulcc	%i3,	0x1604,	%i7
	fandnot1	%f26,	%f6,	%f10
loop_1660:
	array16	%l0,	%i5,	%g5
	smulcc	%g4,	0x1CDB,	%g1
	set	0x40, %l5
	sta	%f0,	[%l7 + %l5] 0x15
	fba,a	%fcc1,	loop_1661
	fsrc2s	%f28,	%f17
	edge32ln	%i1,	%o6,	%i4
	nop
	setx	loop_1662,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_1661:
	edge16l	%l6,	%l4,	%g6
	movge	%icc,	%o4,	%i0
	movrlez	%i2,	%o0,	%g7
loop_1662:
	tne	%icc,	0x0
	edge8l	%l2,	%o3,	%l1
	add	%l3,	0x0334,	%l5
	xorcc	%o5,	0x0DF2,	%g2
	andcc	%o2,	%i6,	%o7
	fmovdne	%icc,	%f20,	%f30
	fcmpeq32	%f6,	%f28,	%g3
	xor	%o1,	%i3,	%l0
	bg,a,pn	%icc,	loop_1663
	fnegd	%f0,	%f24
	bg,pn	%xcc,	loop_1664
	taddcc	%i7,	0x087F,	%g5
loop_1663:
	movrgez	%i5,	0x036,	%g4
	edge32	%i1,	%g1,	%o6
loop_1664:
	fmovsl	%icc,	%f18,	%f18
	sethi	0x0B9B,	%i4
	set	0x30, %o3
	stha	%l6,	[%l7 + %o3] 0x04
	be,a,pn	%icc,	loop_1665
	srl	%l4,	0x11,	%o4
	tvc	%xcc,	0x0
	addccc	%g6,	0x1D8F,	%i2
loop_1665:
	xnor	%i0,	%o0,	%g7
	fmovda	%xcc,	%f28,	%f20
	fmovse	%icc,	%f27,	%f10
	ldsb	[%l7 + 0x15],	%o3
	edge8	%l2,	%l3,	%l5
	fpack16	%f20,	%f24
	and	%o5,	0x12B1,	%g2
	ldd	[%l7 + 0x50],	%o2
	nop
	set	0x28, %o4
	ldd	[%l7 + %o4],	%f20
	movcs	%xcc,	%l1,	%i6
	tvs	%xcc,	0x2
	tle	%icc,	0x3
	array16	%o7,	%g3,	%o1
	movvs	%icc,	%l0,	%i3
	set	0x40, %g5
	ldda	[%l7 + %g5] 0x11,	%f16
	smulcc	%g5,	%i5,	%i7
	edge8n	%g4,	%g1,	%i1
	movcs	%icc,	%i4,	%o6
	srl	%l6,	0x0B,	%l4
	movpos	%xcc,	%g6,	%o4
	fbg,a	%fcc0,	loop_1666
	taddcc	%i2,	0x1CC8,	%o0
	te	%icc,	0x4
	xorcc	%i0,	%g7,	%l2
loop_1666:
	nop
	wr	%g0,	0x81,	%asi
	ldstuba	[%l7 + 0x0A] %asi,	%o3
	tgu	%icc,	0x6
	brlez,a	%l5,	loop_1667
	edge16ln	%o5,	%g2,	%o2
	edge16ln	%l1,	%i6,	%o7
	fmovsvc	%xcc,	%f28,	%f4
loop_1667:
	umul	%g3,	%l3,	%l0
	wr	%g0,	0x0c,	%asi
	ldswa	[%l7 + 0x18] %asi,	%o1
	fxnor	%f18,	%f8,	%f26
	fmovdne	%icc,	%f2,	%f19
	sra	%i3,	%g5,	%i7
	move	%icc,	%g4,	%g1
	bl	%xcc,	loop_1668
	sdiv	%i1,	0x0906,	%i4
	tl	%xcc,	0x4
	wr	%g0,	0x18,	%asi
	ldstuba	[%l7 + 0x28] %asi,	%o6
loop_1668:
	andncc	%i5,	%l6,	%l4
	or	%g6,	0x070E,	%i2
	std	%f6,	[%l7 + 0x10]
	bshuffle	%f20,	%f26,	%f8
	sir	0x1523
	fnands	%f20,	%f18,	%f13
	brlz	%o4,	loop_1669
	fble,a	%fcc3,	loop_1670
	brlz,a	%o0,	loop_1671
	fbul	%fcc3,	loop_1672
loop_1669:
	xnor	%i0,	0x01C2,	%l2
loop_1670:
	sdivcc	%g7,	0x0F18,	%l5
loop_1671:
	tneg	%xcc,	0x5
loop_1672:
	ld	[%l7 + 0x08],	%f31
	bg,a,pt	%icc,	loop_1673
	std	%f2,	[%l7 + 0x18]
	addc	%o5,	%g2,	%o2
	sdivcc	%l1,	0x1E3C,	%o3
loop_1673:
	stw	%i6,	[%l7 + 0x4C]
	tgu	%icc,	0x1
	brgz	%g3,	loop_1674
	orcc	%o7,	0x099B,	%l3
	te	%icc,	0x3
	fmovrsne	%o1,	%f29,	%f28
loop_1674:
	prefetch	[%l7 + 0x20],	 0x1
	wr	%g0,	0x89,	%asi
	lduwa	[%l7 + 0x34] %asi,	%l0
	orcc	%i3,	%g5,	%i7
	fbue,a	%fcc0,	loop_1675
	orncc	%g4,	0x1716,	%i1
	addccc	%i4,	%g1,	%o6
	fone	%f18
loop_1675:
	tne	%xcc,	0x6
	set	0x19, %i2
	stba	%l6,	[%l7 + %i2] 0x2b
	membar	#Sync
	tvc	%icc,	0x4
	bg,a,pn	%xcc,	loop_1676
	or	%i5,	%g6,	%i2
	tvc	%icc,	0x4
	addc	%o4,	%l4,	%i0
loop_1676:
	ta	%xcc,	0x3
	st	%f15,	[%l7 + 0x60]
	movl	%icc,	%l2,	%g7
	movrgz	%o0,	%o5,	%l5
	udivcc	%g2,	0x1074,	%l1
	edge16l	%o3,	%i6,	%g3
	fones	%f15
	movrgez	%o2,	0x3B6,	%o7
	add	%o1,	0x1F14,	%l3
	fbo	%fcc0,	loop_1677
	movrgez	%l0,	%i3,	%i7
	movre	%g5,	%g4,	%i4
	movrgez	%i1,	%g1,	%l6
loop_1677:
	addccc	%i5,	%g6,	%o6
	sllx	%o4,	0x0E,	%l4
	edge16l	%i2,	%l2,	%g7
	brgez	%o0,	loop_1678
	edge16l	%o5,	%i0,	%l5
	wr	%g0,	0x27,	%asi
	stwa	%g2,	[%l7 + 0x10] %asi
	membar	#Sync
loop_1678:
	fornot1s	%f9,	%f4,	%f10
	tneg	%xcc,	0x3
	fmovse	%xcc,	%f17,	%f9
	umul	%l1,	%i6,	%g3
	edge32ln	%o3,	%o7,	%o1
	sdivx	%o2,	0x0A7C,	%l0
	tcc	%xcc,	0x0
	wr	%g0,	0x16,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
	tleu	%icc,	0x7
	tn	%xcc,	0x7
	mova	%xcc,	%l3,	%i7
	fmovrslz	%i3,	%f28,	%f21
	tcc	%icc,	0x3
	add	%l7,	0x18,	%l6
	wr	%g0,	0x18,	%asi
	casxa	[%l6] %asi,	%g4,	%g5
	fpsub32s	%f7,	%f3,	%f15
	edge32n	%i4,	%i1,	%g1
	movleu	%icc,	%l6,	%i5
	fand	%f10,	%f0,	%f8
	andcc	%g6,	%o4,	%o6
	fxnors	%f5,	%f2,	%f30
	tgu	%icc,	0x5
	brlez,a	%i2,	loop_1679
	fmovscc	%xcc,	%f16,	%f18
	fmovdl	%xcc,	%f7,	%f4
	te	%icc,	0x1
loop_1679:
	movne	%xcc,	%l4,	%l2
	fcmpgt32	%f14,	%f14,	%o0
	edge32n	%g7,	%o5,	%i0
	taddcctv	%g2,	0x1E42,	%l5
	addccc	%i6,	%g3,	%o3
	fmovda	%icc,	%f19,	%f18
	orn	%o7,	%l1,	%o1
	fmuld8ulx16	%f4,	%f25,	%f26
	umulcc	%o2,	%l0,	%l3
	movrgez	%i3,	0x204,	%i7
	and	%g5,	0x0CE3,	%i4
	umul	%g4,	0x0A3E,	%i1
	tvs	%icc,	0x0
	tpos	%icc,	0x1
	movrgez	%g1,	0x2F5,	%l6
	movgu	%xcc,	%i5,	%g6
	nop
	set	0x60, %g2
	stx	%o4,	[%l7 + %g2]
	fmovdvs	%icc,	%f17,	%f5
	andncc	%o6,	%l4,	%l2
	sub	%i2,	0x1E45,	%o0
	subc	%g7,	%i0,	%o5
	tl	%xcc,	0x2
	edge16l	%l5,	%i6,	%g2
	edge32ln	%o3,	%o7,	%g3
	andncc	%l1,	%o1,	%o2
	set	0x30, %l0
	swapa	[%l7 + %l0] 0x11,	%l0
	movvs	%xcc,	%l3,	%i7
	bcc,pn	%xcc,	loop_1680
	fbe,a	%fcc2,	loop_1681
	edge32	%i3,	%i4,	%g4
	edge32n	%g5,	%i1,	%g1
loop_1680:
	fcmpgt32	%f30,	%f6,	%i5
loop_1681:
	swap	[%l7 + 0x70],	%g6
	fmovdneg	%xcc,	%f3,	%f1
	edge8ln	%l6,	%o4,	%l4
	bcc,a	loop_1682
	bshuffle	%f16,	%f0,	%f10
	ldd	[%l7 + 0x78],	%f28
	prefetch	[%l7 + 0x58],	 0x3
loop_1682:
	fba,a	%fcc3,	loop_1683
	srl	%o6,	%l2,	%i2
	fmovdg	%xcc,	%f10,	%f8
	fmul8ulx16	%f18,	%f22,	%f12
loop_1683:
	fble	%fcc3,	loop_1684
	movrgz	%o0,	0x113,	%i0
	fmovdle	%icc,	%f19,	%f1
	fbule,a	%fcc2,	loop_1685
loop_1684:
	andncc	%o5,	%l5,	%g7
	umul	%i6,	%o3,	%o7
	bge,a	loop_1686
loop_1685:
	fmovdcs	%icc,	%f25,	%f8
	movvs	%icc,	%g3,	%l1
	set	0x3E, %i7
	stba	%g2,	[%l7 + %i7] 0x2b
	membar	#Sync
loop_1686:
	nop
	set	0x69, %l1
	lduba	[%l7 + %l1] 0x10,	%o2
	fmovscc	%xcc,	%f14,	%f28
	edge8	%o1,	%l3,	%i7
	brgz,a	%l0,	loop_1687
	membar	0x5F
	fble,a	%fcc1,	loop_1688
	tvs	%xcc,	0x5
loop_1687:
	movl	%icc,	%i4,	%g4
	movvc	%icc,	%g5,	%i1
loop_1688:
	fmovrsgz	%i3,	%f6,	%f2
	movvs	%icc,	%i5,	%g6
	edge16ln	%l6,	%o4,	%g1
	fcmpes	%fcc3,	%f16,	%f29
	fmovdvs	%icc,	%f17,	%f11
	array8	%o6,	%l4,	%i2
	fmovdneg	%icc,	%f30,	%f27
	sth	%o0,	[%l7 + 0x36]
	tpos	%xcc,	0x2
	bgu,a,pt	%xcc,	loop_1689
	movrgez	%l2,	0x128,	%i0
	tleu	%icc,	0x4
	movge	%icc,	%l5,	%o5
loop_1689:
	fcmpeq16	%f0,	%f24,	%g7
	addc	%o3,	%o7,	%i6
	movrlz	%g3,	0x01F,	%g2
	tne	%icc,	0x2
	edge32	%l1,	%o2,	%l3
	edge16ln	%i7,	%o1,	%l0
	taddcctv	%g4,	%i4,	%g5
	array16	%i1,	%i5,	%g6
	fpmerge	%f28,	%f11,	%f0
	for	%f0,	%f22,	%f4
	sdivcc	%l6,	0x17C7,	%i3
	edge32	%o4,	%g1,	%o6
	sra	%l4,	%o0,	%i2
	bvc,a	loop_1690
	movvc	%xcc,	%i0,	%l5
	fpack16	%f30,	%f0
	addcc	%l2,	%o5,	%o3
loop_1690:
	sll	%o7,	0x0C,	%g7
	sdivcc	%i6,	0x03D4,	%g3
	fones	%f6
	movrlz	%g2,	%o2,	%l1
	brnz,a	%l3,	loop_1691
	brlz,a	%o1,	loop_1692
	sub	%i7,	0x1853,	%g4
	fabsd	%f12,	%f18
loop_1691:
	nop
	set	0x6A, %i6
	lduba	[%l7 + %i6] 0x19,	%i4
loop_1692:
	movcs	%icc,	%l0,	%g5
	fnands	%f0,	%f15,	%f23
	fxnor	%f26,	%f22,	%f20
	subcc	%i1,	0x1C82,	%g6
	sra	%i5,	%l6,	%o4
	tne	%icc,	0x2
	stb	%g1,	[%l7 + 0x60]
	sllx	%i3,	%o6,	%o0
	brlz,a	%i2,	loop_1693
	or	%i0,	0x0C31,	%l4
	fpadd16	%f0,	%f8,	%f30
	fandnot1s	%f20,	%f18,	%f15
loop_1693:
	addc	%l2,	0x0D33,	%l5
	movgu	%icc,	%o5,	%o3
	bcs	loop_1694
	edge8	%g7,	%o7,	%i6
	bneg,pn	%icc,	loop_1695
	sdivx	%g2,	0x0C0A,	%g3
loop_1694:
	edge8l	%l1,	%o2,	%o1
	fcmpgt16	%f22,	%f30,	%i7
loop_1695:
	fpmerge	%f9,	%f3,	%f26
	wr	%g0,	0x04,	%asi
	lduwa	[%l7 + 0x6C] %asi,	%g4
	fmuld8sux16	%f18,	%f31,	%f6
	edge8	%i4,	%l3,	%g5
	fbn	%fcc2,	loop_1696
	mulscc	%l0,	%g6,	%i5
	tcs	%icc,	0x3
	addcc	%l6,	%i1,	%o4
loop_1696:
	sir	0x1FE0
	tleu	%icc,	0x6
	taddcctv	%g1,	0x1D22,	%i3
	udivx	%o0,	0x1B46,	%o6
	tn	%icc,	0x0
	siam	0x3
	fmuld8sux16	%f5,	%f3,	%f10
	addc	%i2,	%l4,	%l2
	movrgez	%l5,	0x04F,	%o5
	movvc	%icc,	%o3,	%i0
	wr	%g0,	0x88,	%asi
	lduwa	[%l7 + 0x50] %asi,	%g7
	edge16	%i6,	%o7,	%g2
	taddcctv	%l1,	0x1064,	%o2
	movle	%icc,	%g3,	%o1
	smul	%i7,	0x0628,	%i4
	movl	%icc,	%g4,	%l3
	srax	%l0,	%g6,	%i5
	alignaddr	%l6,	%i1,	%g5
	fpmerge	%f19,	%f11,	%f12
	tvc	%icc,	0x2
	move	%icc,	%o4,	%i3
	addc	%o0,	0x16BE,	%g1
	wr	%g0,	0xf8,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
	fmovscs	%icc,	%f3,	%f8
	fnot2s	%f6,	%f0
	edge32l	%o6,	%l4,	%l2
	edge8	%l5,	%i2,	%o3
	tcc	%xcc,	0x5
	movre	%i0,	%g7,	%i6
	orn	%o7,	0x0AB5,	%g2
	ldx	[%l7 + 0x38],	%o5
	addcc	%l1,	%g3,	%o1
	fzeros	%f9
	fcmped	%fcc1,	%f10,	%f22
	fbu,a	%fcc2,	loop_1697
	edge16ln	%i7,	%o2,	%g4
	ldsb	[%l7 + 0x4B],	%l3
	fmovdvc	%icc,	%f30,	%f9
loop_1697:
	fone	%f24
	for	%f24,	%f24,	%f4
	sra	%i4,	0x18,	%l0
	fbu	%fcc1,	loop_1698
	fpsub32s	%f6,	%f13,	%f28
	fcmpeq16	%f6,	%f2,	%i5
	sir	0x0890
loop_1698:
	membar	0x1E
	fba	%fcc0,	loop_1699
	umul	%g6,	0x13F0,	%i1
	wr	%g0,	0x80,	%asi
	ldswa	[%l7 + 0x38] %asi,	%l6
loop_1699:
	movle	%xcc,	%g5,	%i3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tleu	%xcc,	0x7
	call	loop_1700
	stbar
	tvc	%xcc,	0x1
	wr	%g0,	0x2a,	%asi
	stwa	%o4,	[%l7 + 0x64] %asi
	membar	#Sync
loop_1700:
	and	%o0,	0x10DB,	%o6
	subcc	%g1,	%l2,	%l5
	tneg	%xcc,	0x6
	bleu,pt	%icc,	loop_1701
	bgu,pt	%xcc,	loop_1702
	ldub	[%l7 + 0x13],	%l4
	tl	%icc,	0x5
loop_1701:
	edge16n	%i2,	%o3,	%g7
loop_1702:
	nop
	set	0x44, %o2
	ldswa	[%l7 + %o2] 0x89,	%i6
	set	0x40, %i4
	ldda	[%l7 + %i4] 0x0c,	%f0
	edge16	%o7,	%g2,	%o5
	flush	%l7 + 0x60
	bge,a,pt	%xcc,	loop_1703
	fnors	%f21,	%f22,	%f8
	sethi	0x1EF8,	%i0
	or	%l1,	%g3,	%i7
loop_1703:
	ldub	[%l7 + 0x67],	%o2
	movl	%icc,	%o1,	%g4
	edge32n	%i4,	%l0,	%l3
	fmul8x16	%f20,	%f20,	%f16
	bg	%xcc,	loop_1704
	tneg	%xcc,	0x2
	movrlez	%i5,	%g6,	%i1
	subc	%g5,	0x165C,	%i3
loop_1704:
	flush	%l7 + 0x68
	popc	0x113D,	%l6
	fsrc1	%f10,	%f28
	fandnot1s	%f25,	%f10,	%f4
	andn	%o0,	%o6,	%o4
	nop
	setx loop_1705, %l0, %l1
	jmpl %l1, %g1
	ldsh	[%l7 + 0x46],	%l2
	fpadd32	%f22,	%f28,	%f10
	wr	%g0,	0x89,	%asi
	ldstuba	[%l7 + 0x57] %asi,	%l5
loop_1705:
	srlx	%l4,	0x17,	%o3
	xnorcc	%g7,	0x1636,	%i2
	srlx	%o7,	0x09,	%g2
	fcmps	%fcc1,	%f8,	%f18
	orcc	%i6,	%o5,	%i0
	tg	%xcc,	0x5
	movleu	%icc,	%g3,	%i7
	swap	[%l7 + 0x6C],	%l1
	fpmerge	%f6,	%f12,	%f30
	sdiv	%o1,	0x01DB,	%g4
	ldsw	[%l7 + 0x18],	%o2
	bl,a,pn	%xcc,	loop_1706
	sth	%l0,	[%l7 + 0x28]
	prefetch	[%l7 + 0x74],	 0x1
	tl	%icc,	0x5
loop_1706:
	fmovrdlz	%l3,	%f30,	%f4
	movvs	%xcc,	%i4,	%i5
	addccc	%i1,	%g6,	%i3
	tgu	%xcc,	0x1
	fcmpgt16	%f14,	%f8,	%l6
	or	%g5,	%o0,	%o4
	brz,a	%o6,	loop_1707
	sdiv	%g1,	0x0052,	%l2
	wr	%g0,	0x19,	%asi
	lduha	[%l7 + 0x26] %asi,	%l5
loop_1707:
	nop
	setx	loop_1708,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	tvc	%xcc,	0x2
	te	%icc,	0x2
	mulscc	%o3,	%g7,	%l4
loop_1708:
	flush	%l7 + 0x10
	wr	%g0,	0x89,	%asi
	lduba	[%l7 + 0x7C] %asi,	%o7
	fbul	%fcc2,	loop_1709
	tgu	%icc,	0x4
	bn,a,pn	%icc,	loop_1710
	xnorcc	%i2,	%i6,	%g2
loop_1709:
	movrlz	%o5,	0x12E,	%i0
	bvc,a,pt	%icc,	loop_1711
loop_1710:
	movneg	%xcc,	%i7,	%l1
	movl	%xcc,	%o1,	%g4
	taddcctv	%g3,	0x0041,	%o2
loop_1711:
	sllx	%l3,	%l0,	%i5
	stw	%i4,	[%l7 + 0x20]
	movleu	%icc,	%g6,	%i1
	ldsb	[%l7 + 0x15],	%l6
	movge	%xcc,	%g5,	%o0
	tcc	%xcc,	0x6
	tneg	%xcc,	0x4
	add	%i3,	0x1801,	%o4
	edge16	%g1,	%o6,	%l5
	fandnot2	%f30,	%f4,	%f2
	movn	%icc,	%l2,	%o3
	wr	%g0,	0x18,	%asi
	sta	%f3,	[%l7 + 0x74] %asi
	bg,a	%xcc,	loop_1712
	fmovrsne	%l4,	%f10,	%f23
	array8	%g7,	%o7,	%i2
	add	%l7,	0x70,	%l6
	wr	%g0,	0x11,	%asi
	casxa	[%l6] 0x11,	%i6,	%o5
loop_1712:
	array8	%i0,	%g2,	%i7
	and	%o1,	0x0EF8,	%g4
	mova	%xcc,	%l1,	%o2
	movgu	%icc,	%l3,	%g3
	subcc	%l0,	%i4,	%i5
	sdivcc	%i1,	0x136B,	%g6
	fbuge	%fcc1,	loop_1713
	fnor	%f6,	%f6,	%f20
	movcs	%xcc,	%l6,	%g5
	tle	%icc,	0x2
loop_1713:
	andn	%o0,	0x0E02,	%o4
	taddcctv	%g1,	0x1BF6,	%o6
	movrgz	%i3,	%l5,	%o3
	andcc	%l2,	%g7,	%l4
	andncc	%i2,	%o7,	%i6
	fmul8x16au	%f3,	%f17,	%f26
	smul	%o5,	0x1B50,	%g2
	movre	%i7,	%i0,	%o1
	fcmpeq16	%f22,	%f6,	%g4
	movrne	%l1,	0x3B5,	%o2
	bg,pn	%icc,	loop_1714
	fbge	%fcc2,	loop_1715
	andn	%g3,	%l3,	%l0
	array16	%i5,	%i1,	%i4
loop_1714:
	fmovde	%icc,	%f5,	%f3
loop_1715:
	smul	%l6,	%g6,	%o0
	nop
	setx	loop_1716,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fnand	%f24,	%f8,	%f8
	fmovse	%icc,	%f10,	%f10
	edge32ln	%g5,	%o4,	%o6
loop_1716:
	tneg	%xcc,	0x5
	movne	%xcc,	%i3,	%g1
	fmovscs	%icc,	%f6,	%f6
	tvc	%icc,	0x0
	te	%icc,	0x3
	subc	%l5,	0x0E88,	%o3
	mulx	%l2,	0x0E4F,	%g7
	bcs,pt	%icc,	loop_1717
	andn	%l4,	0x010C,	%i2
	tne	%icc,	0x5
	fmovspos	%xcc,	%f9,	%f16
loop_1717:
	tg	%xcc,	0x7
	fmovsvs	%xcc,	%f4,	%f29
	movneg	%icc,	%o7,	%o5
	movpos	%icc,	%g2,	%i7
	bneg,pn	%icc,	loop_1718
	siam	0x7
	set	0x70, %l6
	lduwa	[%l7 + %l6] 0x04,	%i0
loop_1718:
	nop
	wr	%g0,	0x04,	%asi
	lduba	[%l7 + 0x54] %asi,	%i6
	smulcc	%o1,	%g4,	%o2
	fmovsle	%icc,	%f0,	%f21
	movge	%icc,	%g3,	%l3
	ta	%xcc,	0x5
	set	0x42, %o6
	ldsba	[%l7 + %o6] 0x15,	%l1
	tvc	%icc,	0x2
	fblg,a	%fcc2,	loop_1719
	udivcc	%l0,	0x1679,	%i1
	movleu	%xcc,	%i4,	%l6
	umul	%i5,	%g6,	%o0
loop_1719:
	andn	%o4,	0x06CD,	%o6
	fpadd16s	%f20,	%f31,	%f18
	umulcc	%g5,	0x080D,	%g1
	wr	%g0,	0x88,	%asi
	lduba	[%l7 + 0x58] %asi,	%l5
	tvc	%icc,	0x4
	movrlez	%o3,	0x32F,	%l2
	umulcc	%g7,	%i3,	%l4
	tleu	%xcc,	0x3
	wr	%g0,	0x0c,	%asi
	ldsba	[%l7 + 0x63] %asi,	%o7
	edge32	%i2,	%o5,	%g2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x38, %g4
	ldxa	[%l7 + %g4] 0x04,	%i7
	fmovrslz	%i0,	%f1,	%f4
	ldsh	[%l7 + 0x18],	%i6
	orncc	%o1,	0x0CE0,	%o2
	array32	%g3,	%g4,	%l3
	wr	%g0,	0x11,	%asi
	ldsba	[%l7 + 0x41] %asi,	%l0
	fmovd	%f4,	%f4
	ta	%icc,	0x7
	movleu	%xcc,	%l1,	%i4
	movn	%icc,	%l6,	%i5
	ldsh	[%l7 + 0x18],	%g6
	sdiv	%i1,	0x1769,	%o0
	andncc	%o6,	%g5,	%g1
	set	0x00, %i3
	ldxa	[%g0 + %i3] 0x50,	%l5
	fmuld8sux16	%f10,	%f2,	%f8
	subcc	%o4,	0x0E67,	%o3
	sdivx	%g7,	0x1F6F,	%l2
	array8	%i3,	%l4,	%i2
	mulscc	%o5,	%o7,	%i7
	set	0x70, %l2
	ldxa	[%l7 + %l2] 0x15,	%i0
	fmovdle	%icc,	%f0,	%f28
	edge32n	%i6,	%o1,	%g2
	set	0x68, %o5
	prefetcha	[%l7 + %o5] 0x0c,	 0x3
	xor	%g4,	%g3,	%l0
	tleu	%xcc,	0x2
	fornot1	%f28,	%f20,	%f2
	fnands	%f4,	%f11,	%f5
	xnorcc	%l3,	%i4,	%l1
	addc	%i5,	0x07FC,	%g6
	tge	%xcc,	0x7
	fmovsvc	%xcc,	%f3,	%f0
	mulscc	%i1,	%l6,	%o0
	nop
	setx	loop_1720,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	andcc	%o6,	0x0B6A,	%g1
	subcc	%g5,	%o4,	%l5
	movge	%icc,	%g7,	%o3
loop_1720:
	stbar
	sethi	0x0DE9,	%i3
	stbar
	fmul8sux16	%f22,	%f16,	%f26
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addccc	%l2,	%i2,	%l4
	set	0x40, %g7
	ldda	[%l7 + %g7] 0x18,	%f16
	fmovsle	%icc,	%f28,	%f17
	xnorcc	%o5,	0x0D5C,	%o7
	swap	[%l7 + 0x48],	%i7
	mulx	%i0,	%o1,	%i6
	movre	%g2,	0x150,	%o2
	edge8	%g3,	%g4,	%l3
	fba,a	%fcc2,	loop_1721
	tge	%icc,	0x6
	fnand	%f24,	%f2,	%f0
	set	0x78, %i1
	stda	%i4,	[%l7 + %i1] 0x22
	membar	#Sync
loop_1721:
	nop
	wr	%g0,	0x88,	%asi
	lduwa	[%l7 + 0x70] %asi,	%l1
	stbar
	fandnot1	%f8,	%f4,	%f26
	set	0x18, %o7
	prefetcha	[%l7 + %o7] 0x10,	 0x2
	fnor	%f20,	%f28,	%f20
	sethi	0x16D0,	%l0
	fnot1	%f24,	%f12
	fmovdgu	%icc,	%f19,	%f6
	wr	%g0,	0x11,	%asi
	stwa	%i1,	[%l7 + 0x54] %asi
	tcc	%xcc,	0x0
	tsubcc	%g6,	%l6,	%o0
	subc	%o6,	0x1942,	%g1
	smulcc	%g5,	%o4,	%l5
	ldd	[%l7 + 0x18],	%f30
	srlx	%o3,	%i3,	%g7
	ldsh	[%l7 + 0x0C],	%l2
	prefetch	[%l7 + 0x08],	 0x1
	wr	%g0,	0x88,	%asi
	stda	%i2,	[%l7 + 0x48] %asi
	wr	%g0,	0x88,	%asi
	lda	[%l7 + 0x3C] %asi,	%f21
	fexpand	%f12,	%f2
	bneg,a	%icc,	loop_1722
	fbue	%fcc1,	loop_1723
	fble	%fcc0,	loop_1724
	sdivcc	%l4,	0x0734,	%o7
loop_1722:
	tleu	%xcc,	0x2
loop_1723:
	movre	%i7,	0x27F,	%i0
loop_1724:
	tgu	%xcc,	0x6
	te	%icc,	0x3
	movrlez	%o1,	%i6,	%g2
	brnz,a	%o2,	loop_1725
	bl,pn	%icc,	loop_1726
	brz,a	%g3,	loop_1727
	fmovsa	%icc,	%f18,	%f13
loop_1725:
	fandnot2	%f0,	%f6,	%f12
loop_1726:
	sll	%o5,	%g4,	%i4
loop_1727:
	nop
	wr	%g0,	0x11,	%asi
	ldswa	[%l7 + 0x50] %asi,	%l3
	movrgez	%i5,	0x0DA,	%l0
	tsubcctv	%l1,	0x03B1,	%i1
	fmovrdne	%l6,	%f24,	%f6
	srlx	%g6,	0x0F,	%o6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrgez	%o0,	0x05B,	%g1
	alignaddrl	%o4,	%g5,	%o3
	fornot1	%f8,	%f2,	%f22
	movne	%icc,	%i3,	%l5
	wr	%g0,	0x89,	%asi
	lduha	[%l7 + 0x34] %asi,	%g7
	fsrc2	%f10,	%f24
	tg	%xcc,	0x1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	or	%l2,	%l4,	%o7
	movrlez	%i7,	0x1CA,	%i2
	smul	%i0,	0x04C4,	%o1
	ldsh	[%l7 + 0x42],	%i6
	sllx	%g2,	%g3,	%o5
	brlez,a	%g4,	loop_1728
	ld	[%l7 + 0x40],	%f10
	nop
	setx loop_1729, %l0, %l1
	jmpl %l1, %o2
	movn	%icc,	%i4,	%l3
loop_1728:
	taddcc	%l0,	%i5,	%l1
	wr	%g0,	0x89,	%asi
	ldswa	[%l7 + 0x78] %asi,	%l6
loop_1729:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subccc	%g6,	%i1,	%o6
	fmovdvs	%icc,	%f13,	%f7
	movleu	%icc,	%g1,	%o4
	smulcc	%g5,	%o3,	%i3
	fblg	%fcc0,	loop_1730
	smul	%l5,	0x1DE8,	%o0
	fbuge,a	%fcc1,	loop_1731
	tgu	%icc,	0x4
loop_1730:
	andcc	%l2,	%l4,	%g7
	fcmpd	%fcc2,	%f2,	%f10
loop_1731:
	nop
	wr	%g0,	0x10,	%asi
	ldstuba	[%l7 + 0x3F] %asi,	%i7
	srl	%o7,	0x0C,	%i2
	sdivx	%i0,	0x0581,	%i6
	edge32l	%o1,	%g3,	%g2
	movre	%o5,	0x001,	%o2
	fmovse	%icc,	%f19,	%f9
	fmovsneg	%icc,	%f15,	%f1
	bg,a	%xcc,	loop_1732
	fnegd	%f14,	%f30
	fblg,a	%fcc0,	loop_1733
	brlz	%g4,	loop_1734
loop_1732:
	umul	%l3,	%i4,	%i5
	srlx	%l0,	0x12,	%l1
loop_1733:
	fmovrde	%g6,	%f4,	%f4
loop_1734:
	fmovrsne	%i1,	%f7,	%f20
	movrlz	%o6,	0x040,	%l6
	tn	%xcc,	0x5
	st	%f12,	[%l7 + 0x30]
	edge16l	%o4,	%g5,	%o3
	brgz,a	%g1,	loop_1735
	fbue,a	%fcc0,	loop_1736
	bcc,a,pt	%xcc,	loop_1737
	andn	%i3,	0x0529,	%l5
loop_1735:
	te	%icc,	0x6
loop_1736:
	movgu	%xcc,	%o0,	%l2
loop_1737:
	ldd	[%l7 + 0x58],	%f12
	fmovrdlz	%l4,	%f30,	%f24
	xorcc	%g7,	0x1932,	%o7
	ta	%icc,	0x3
	prefetch	[%l7 + 0x6C],	 0x2
	fmovrsne	%i2,	%f16,	%f7
	bge	%xcc,	loop_1738
	tneg	%xcc,	0x1
	wr	%g0,	0x11,	%asi
	prefetcha	[%l7 + 0x28] %asi,	 0x3
loop_1738:
	or	%i6,	0x0F9B,	%i7
	fbue,a	%fcc0,	loop_1739
	edge32l	%o1,	%g3,	%g2
	udivcc	%o2,	0x0079,	%o5
	move	%icc,	%g4,	%l3
loop_1739:
	tgu	%icc,	0x7
	tge	%icc,	0x6
	andncc	%i5,	%l0,	%l1
	wr	%g0,	0x80,	%asi
	ldswa	[%l7 + 0x30] %asi,	%g6
	fmovrsne	%i1,	%f1,	%f24
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fexpand	%f0,	%f10
	tsubcctv	%o6,	0x16D4,	%i4
	lduw	[%l7 + 0x50],	%o4
	edge16l	%g5,	%o3,	%l6
	fnot1s	%f1,	%f4
	faligndata	%f28,	%f22,	%f6
	tsubcctv	%g1,	%l5,	%o0
	fnors	%f19,	%f30,	%f3
	tgu	%xcc,	0x7
	wr	%g0,	0x19,	%asi
	prefetcha	[%l7 + 0x48] %asi,	 0x1
	set	0x60, %o1
	lda	[%l7 + %o1] 0x19,	%f28
	or	%i3,	0x0F60,	%g7
	fmovrde	%o7,	%f2,	%f24
	movne	%xcc,	%i2,	%i0
	stb	%i6,	[%l7 + 0x50]
	taddcctv	%l4,	%o1,	%g3
	nop
	setx	loop_1740,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fmuld8sux16	%f17,	%f29,	%f22
	ldsw	[%l7 + 0x50],	%i7
	sir	0x1371
loop_1740:
	movcc	%icc,	%g2,	%o2
	fzero	%f2
	for	%f10,	%f18,	%f22
	ba	loop_1741
	brlz,a	%g4,	loop_1742
	lduh	[%l7 + 0x0C],	%o5
	tsubcc	%l3,	%l0,	%l1
loop_1741:
	sdivx	%g6,	0x11E4,	%i5
loop_1742:
	fmul8x16au	%f10,	%f11,	%f4
	lduh	[%l7 + 0x54],	%o6
	umulcc	%i1,	0x049F,	%i4
	andncc	%o4,	%g5,	%o3
	or	%g1,	0x1FA5,	%l6
	fxnors	%f10,	%f20,	%f2
	fmovs	%f14,	%f27
	tvs	%xcc,	0x5
	sethi	0x16FC,	%o0
	andncc	%l2,	%l5,	%i3
	fmovrde	%o7,	%f20,	%f22
	wr	%g0,	0x0c,	%asi
	ldsba	[%l7 + 0x4D] %asi,	%g7
	bvs,a,pt	%xcc,	loop_1743
	alignaddrl	%i0,	%i2,	%i6
	fcmple16	%f26,	%f0,	%l4
	ldstub	[%l7 + 0x7B],	%g3
loop_1743:
	nop
	wr	%g0,	0x80,	%asi
	prefetcha	[%l7 + 0x20] %asi,	 0x1
	fbg	%fcc1,	loop_1744
	fnot1s	%f23,	%f19
	addc	%g2,	0x1197,	%i7
	fcmple32	%f4,	%f6,	%o2
loop_1744:
	udivcc	%o5,	0x0E68,	%g4
	brgez,a	%l3,	loop_1745
	edge16ln	%l1,	%g6,	%l0
	sdiv	%o6,	0x024E,	%i5
	te	%icc,	0x3
loop_1745:
	movrgez	%i1,	0x337,	%i4
	ba,pn	%xcc,	loop_1746
	movg	%icc,	%o4,	%o3
	andcc	%g5,	%g1,	%o0
	brgez	%l6,	loop_1747
loop_1746:
	bneg,pt	%xcc,	loop_1748
	sdiv	%l5,	0x10C0,	%l2
	set	0x78, %g3
	lduha	[%l7 + %g3] 0x19,	%i3
loop_1747:
	fsrc2	%f2,	%f26
loop_1748:
	edge32ln	%g7,	%o7,	%i0
	sllx	%i6,	0x13,	%i2
	alignaddrl	%g3,	%o1,	%g2
	mulx	%i7,	0x0792,	%l4
	andcc	%o5,	%g4,	%l3
	sub	%l1,	0x1801,	%g6
	smulcc	%o2,	0x04B5,	%l0
	alignaddrl	%i5,	%i1,	%o6
	movvc	%xcc,	%o4,	%o3
	movrgz	%g5,	0x194,	%g1
	wr	%g0,	0x80,	%asi
	swapa	[%l7 + 0x3C] %asi,	%o0
	tpos	%icc,	0x7
	nop
	set	0x70, %i5
	ldd	[%l7 + %i5],	%i6
	array8	%i4,	%l2,	%l5
	wr	%g0,	0x10,	%asi
	swapa	[%l7 + 0x18] %asi,	%g7
	movle	%icc,	%o7,	%i3
	wr	%g0,	0xf8,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
	popc	0x0214,	%i6
	fbue,a	%fcc2,	loop_1749
	movpos	%icc,	%i2,	%i0
	sub	%o1,	%g3,	%i7
	popc	%g2,	%o5
loop_1749:
	tle	%xcc,	0x3
	nop
	setx	loop_1750,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movge	%icc,	%g4,	%l4
	movn	%xcc,	%l1,	%l3
	tl	%xcc,	0x6
loop_1750:
	ba	loop_1751
	andcc	%o2,	%g6,	%i5
	movrne	%i1,	%o6,	%o4
	fornot1s	%f0,	%f21,	%f5
loop_1751:
	tpos	%xcc,	0x6
	fble	%fcc0,	loop_1752
	ld	[%l7 + 0x4C],	%f16
	sdivcc	%l0,	0x0C8B,	%o3
	popc	0x02AF,	%g1
loop_1752:
	fmovsge	%xcc,	%f9,	%f20
	ldd	[%l7 + 0x38],	%f24
	bvs	loop_1753
	tvs	%xcc,	0x4
	set	0x78, %l3
	stwa	%g5,	[%l7 + %l3] 0x0c
loop_1753:
	bl,pn	%xcc,	loop_1754
	fpsub32s	%f20,	%f27,	%f24
	fmovdge	%icc,	%f9,	%f23
	fmovsvc	%xcc,	%f30,	%f16
loop_1754:
	alignaddrl	%l6,	%i4,	%l2
	movg	%icc,	%o0,	%l5
	bl	%xcc,	loop_1755
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbne	%fcc0,	loop_1756
	fexpand	%f9,	%f20
loop_1755:
	edge16l	%o7,	%i3,	%g7
	edge16n	%i6,	%i0,	%o1
loop_1756:
	movneg	%xcc,	%g3,	%i2
	move	%icc,	%i7,	%g2
	movleu	%xcc,	%o5,	%l4
	fmovda	%xcc,	%f20,	%f26
	udivx	%g4,	0x12AC,	%l3
	fornot2	%f4,	%f26,	%f20
	fbul,a	%fcc0,	loop_1757
	tcc	%xcc,	0x7
	movrgz	%l1,	0x0C9,	%o2
	srax	%i5,	0x06,	%g6
loop_1757:
	tl	%icc,	0x7
	taddcctv	%i1,	0x1701,	%o4
	edge32	%o6,	%l0,	%o3
	taddcc	%g5,	0x0629,	%l6
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
	fba,a	%fcc2,	loop_1759
	fones	%f25
	ta	%xcc,	0x0
loop_1758:
	orcc	%g1,	0x0F1F,	%l2
loop_1759:
	tne	%icc,	0x4
	sth	%i4,	[%l7 + 0x5C]
	udiv	%l5,	0x0FBE,	%o7
	add	%i3,	0x0729,	%g7
	tvs	%icc,	0x7
	wr	%g0,	0x80,	%asi
	ldsba	[%l7 + 0x62] %asi,	%o0
	movrgz	%i0,	%i6,	%g3
	fbne,a	%fcc2,	loop_1760
	fmovrde	%i2,	%f14,	%f30
	fbe,a	%fcc3,	loop_1761
	fmul8sux16	%f22,	%f0,	%f22
loop_1760:
	edge32ln	%o1,	%g2,	%o5
	movcs	%xcc,	%i7,	%g4
loop_1761:
	subccc	%l3,	0x055E,	%l4
	fmovscc	%xcc,	%f15,	%f17
	wr	%g0,	0x89,	%asi
	swapa	[%l7 + 0x3C] %asi,	%l1
	sir	0x18D2
	addccc	%o2,	0x0272,	%g6
	fmuld8sux16	%f10,	%f21,	%f4
	bne,a	%xcc,	loop_1762
	movle	%xcc,	%i5,	%i1
	edge16l	%o6,	%l0,	%o3
	ldsw	[%l7 + 0x4C],	%g5
loop_1762:
	or	%o4,	0x1BAA,	%g1
	brlez,a	%l6,	loop_1763
	fbo,a	%fcc1,	loop_1764
	tpos	%xcc,	0x5
	orn	%i4,	%l5,	%o7
loop_1763:
	fcmps	%fcc1,	%f31,	%f22
loop_1764:
	orn	%i3,	0x18C6,	%l2
	fmovscc	%xcc,	%f6,	%f31
	array8	%o0,	%g7,	%i0
	array32	%i6,	%i2,	%o1
	fmovrslz	%g3,	%f23,	%f3
	or	%o5,	%i7,	%g2
	fcmpgt32	%f30,	%f26,	%l3
	tge	%icc,	0x2
	edge16	%l4,	%g4,	%o2
	fands	%f7,	%f19,	%f4
	subccc	%g6,	%i5,	%l1
	fbn,a	%fcc0,	loop_1765
	brlz,a	%o6,	loop_1766
	xnorcc	%i1,	%l0,	%o3
	srlx	%g5,	%o4,	%g1
loop_1765:
	addc	%i4,	0x04A3,	%l6
loop_1766:
	movneg	%icc,	%o7,	%l5
	srlx	%l2,	%o0,	%g7
	fbl	%fcc1,	loop_1767
	edge8	%i3,	%i6,	%i0
	stw	%i2,	[%l7 + 0x48]
	array16	%g3,	%o1,	%o5
loop_1767:
	fbuge	%fcc0,	loop_1768
	fxnors	%f10,	%f19,	%f16
	udivcc	%g2,	0x18BE,	%i7
	tgu	%icc,	0x6
loop_1768:
	array16	%l4,	%l3,	%o2
	alignaddr	%g4,	%i5,	%l1
	edge32	%g6,	%o6,	%i1
	andncc	%l0,	%o3,	%g5
	bne	%icc,	loop_1769
	movrlez	%g1,	%i4,	%o4
	movneg	%icc,	%o7,	%l6
	umulcc	%l5,	%l2,	%g7
loop_1769:
	tneg	%xcc,	0x6
	movge	%xcc,	%i3,	%o0
	fbne	%fcc0,	loop_1770
	tcc	%icc,	0x4
	fpsub32s	%f10,	%f21,	%f22
	sub	%i6,	0x05BA,	%i0
loop_1770:
	popc	0x0F7A,	%g3
	edge16	%o1,	%i2,	%g2
	bneg	loop_1771
	fpmerge	%f4,	%f0,	%f28
	move	%xcc,	%o5,	%i7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1771:
	fmovdg	%icc,	%f10,	%f30
	andcc	%l3,	0x08C1,	%o2
	ble	%xcc,	loop_1772
	fxor	%f14,	%f18,	%f6
	mulscc	%l4,	%g4,	%i5
	bcc	loop_1773
loop_1772:
	prefetch	[%l7 + 0x50],	 0x1
	ldsb	[%l7 + 0x78],	%g6
	set	0x08, %l4
	lduha	[%l7 + %l4] 0x18,	%l1
loop_1773:
	tpos	%xcc,	0x4
	mova	%xcc,	%o6,	%l0
	wr	%g0,	0x88,	%asi
	ldda	[%l7 + 0x20] %asi,	%o2
	xnorcc	%g5,	0x1718,	%g1
	wr	%g0,	0x80,	%asi
	ldsba	[%l7 + 0x1F] %asi,	%i1
	alignaddrl	%i4,	%o4,	%o7
	udivx	%l6,	0x0654,	%l2
	set	0x0, %g1
	stxa	%l5,	[%g0 + %g1] 0x5f
	stb	%i3,	[%l7 + 0x67]
	edge32	%o0,	%i6,	%i0
	stw	%g7,	[%l7 + 0x08]
	edge8l	%g3,	%i2,	%g2
	smul	%o5,	%i7,	%l3
	tn	%icc,	0x2
	fandnot1	%f0,	%f16,	%f30
	tvs	%icc,	0x2
	array8	%o1,	%o2,	%g4
	te	%xcc,	0x4
	array32	%l4,	%g6,	%l1
	movn	%icc,	%o6,	%l0
	fmovsle	%icc,	%f18,	%f4
	ldstub	[%l7 + 0x38],	%o3
	fmovsgu	%xcc,	%f14,	%f7
	fmovdgu	%xcc,	%f30,	%f1
	tneg	%icc,	0x4
	for	%f18,	%f10,	%f2
	set	0x0A, %i0
	lduha	[%l7 + %i0] 0x14,	%i5
	fmovsgu	%xcc,	%f7,	%f21
	xnorcc	%g5,	0x09E1,	%i1
	array32	%i4,	%g1,	%o4
	nop
	set	0x3C, %o0
	ldsh	[%l7 + %o0],	%l6
	lduw	[%l7 + 0x58],	%o7
	fble	%fcc1,	loop_1774
	taddcctv	%l5,	0x12AE,	%i3
	fandnot1	%f26,	%f12,	%f14
	movg	%xcc,	%l2,	%i6
loop_1774:
	flush	%l7 + 0x78
	tn	%xcc,	0x6
	fnegd	%f28,	%f22
	array8	%i0,	%g7,	%g3
	fmovsvs	%xcc,	%f13,	%f31
	edge32n	%o0,	%i2,	%o5
	movrne	%g2,	%i7,	%o1
	fbue,a	%fcc0,	loop_1775
	movgu	%xcc,	%l3,	%g4
	movl	%icc,	%l4,	%g6
	add	%l1,	0x0EDE,	%o2
loop_1775:
	array8	%l0,	%o6,	%o3
	tle	%xcc,	0x0
	fmovde	%icc,	%f21,	%f17
	srl	%g5,	0x0A,	%i5
	wr	%g0,	0x0c,	%asi
	ldxa	[%l7 + 0x18] %asi,	%i4
	edge8n	%g1,	%i1,	%l6
	edge32	%o7,	%l5,	%o4
	xnorcc	%l2,	%i6,	%i3
	umulcc	%g7,	%g3,	%o0
	umulcc	%i0,	0x03D5,	%o5
	movgu	%xcc,	%i2,	%g2
	edge32	%o1,	%l3,	%i7
	sethi	0x0834,	%g4
	orcc	%g6,	0x0657,	%l1
	array32	%o2,	%l4,	%o6
	wr	%g0,	0x88,	%asi
	ldswa	[%l7 + 0x3C] %asi,	%o3
	fmovrsgez	%l0,	%f8,	%f9
	tn	%xcc,	0x0
	umul	%g5,	0x0DFD,	%i5
	membar	0x5E
	bgu,a,pt	%xcc,	loop_1776
	bne,a	%xcc,	loop_1777
	fmovd	%f0,	%f2
	fmovsne	%xcc,	%f13,	%f10
loop_1776:
	tleu	%xcc,	0x5
loop_1777:
	brlz,a	%g1,	loop_1778
	umulcc	%i4,	%l6,	%i1
	movrgz	%l5,	%o4,	%l2
	srax	%o7,	%i3,	%g7
loop_1778:
	edge16n	%i6,	%g3,	%o0
	fmovdcs	%icc,	%f23,	%f13
	subc	%i0,	%o5,	%g2
	fmovrsne	%o1,	%f5,	%f16
	sir	0x0B28
	lduh	[%l7 + 0x64],	%i2
	xnorcc	%i7,	0x1F2A,	%g4
	udivcc	%l3,	0x0578,	%g6
	xorcc	%o2,	%l4,	%o6
	edge32	%l1,	%l0,	%g5
	fmovsneg	%xcc,	%f4,	%f26
	movrlz	%i5,	%o3,	%g1
	membar	0x15
	call	loop_1779
	edge32	%i4,	%l6,	%i1
	mulx	%l5,	0x0A9B,	%l2
	tge	%xcc,	0x6
loop_1779:
	edge8	%o4,	%i3,	%g7
	fmovrdne	%i6,	%f4,	%f10
	array16	%o7,	%o0,	%g3
	fbg	%fcc2,	loop_1780
	taddcc	%o5,	%g2,	%o1
	call	loop_1781
	fmovspos	%icc,	%f29,	%f12
loop_1780:
	or	%i0,	%i7,	%g4
	fbu,a	%fcc3,	loop_1782
loop_1781:
	fmovsg	%icc,	%f12,	%f26
	xor	%i2,	0x0116,	%g6
	fmovdgu	%icc,	%f3,	%f4
loop_1782:
	fabsd	%f24,	%f20
	fpadd16	%f22,	%f4,	%f2
	movneg	%xcc,	%o2,	%l3
	fmovsg	%icc,	%f19,	%f12
	array8	%o6,	%l1,	%l4
	subccc	%l0,	0x1055,	%g5
	movrgez	%o3,	0x0AA,	%i5
	fmovdgu	%icc,	%f7,	%f18
	tg	%icc,	0x1
	fornot1	%f20,	%f30,	%f20
	faligndata	%f8,	%f24,	%f22
	edge16n	%i4,	%l6,	%i1
	fblg	%fcc0,	loop_1783
	be,pn	%icc,	loop_1784
	movrlez	%l5,	0x1C9,	%g1
	set	0x64, %l5
	lduwa	[%l7 + %l5] 0x88,	%o4
loop_1783:
	fabsd	%f4,	%f14
loop_1784:
	fnand	%f18,	%f12,	%f14
	fnor	%f4,	%f18,	%f6
	bne,pn	%xcc,	loop_1785
	fnor	%f16,	%f2,	%f20
	brz	%l2,	loop_1786
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1785:
	bcs,a,pn	%icc,	loop_1787
	sll	%i3,	%i6,	%g7
loop_1786:
	movrlez	%o7,	%o0,	%o5
	set	0x14, %o3
	lda	[%l7 + %o3] 0x18,	%f8
loop_1787:
	ldd	[%l7 + 0x28],	%f4
	movle	%icc,	%g2,	%g3
	array32	%i0,	%o1,	%g4
	alignaddrl	%i2,	%g6,	%i7
	sethi	0x0212,	%o2
	pdist	%f20,	%f22,	%f20
	orcc	%l3,	0x1148,	%o6
	fbul	%fcc1,	loop_1788
	xnor	%l4,	%l1,	%l0
	movrgz	%o3,	0x04B,	%i5
	movle	%icc,	%g5,	%l6
loop_1788:
	fcmple16	%f10,	%f14,	%i4
	bleu	loop_1789
	fnands	%f24,	%f21,	%f28
	alignaddrl	%i1,	%g1,	%o4
	sllx	%l2,	0x10,	%l5
loop_1789:
	fnot1s	%f31,	%f25
	bge	%xcc,	loop_1790
	fblg	%fcc0,	loop_1791
	sir	0x192B
	movge	%xcc,	%i6,	%g7
loop_1790:
	umulcc	%o7,	%o0,	%o5
loop_1791:
	nop
	wr	%g0,	0x04,	%asi
	prefetcha	[%l7 + 0x60] %asi,	 0x1
	movvc	%icc,	%g3,	%i3
	set	0x68, %o4
	stwa	%o1,	[%l7 + %o4] 0x19
	sllx	%i0,	%i2,	%g6
	fandnot2	%f6,	%f2,	%f12
	fsrc1s	%f5,	%f20
	fmovde	%xcc,	%f22,	%f8
	srlx	%i7,	%o2,	%g4
	movneg	%icc,	%l3,	%o6
	fmovdl	%xcc,	%f2,	%f1
	edge16	%l4,	%l1,	%l0
	and	%i5,	0x0942,	%o3
	call	loop_1792
	array8	%l6,	%g5,	%i1
	set	0x40, %g5
	stda	%f16,	[%l7 + %g5] 0xf0
	membar	#Sync
loop_1792:
	array32	%i4,	%g1,	%o4
	set	0x66, %g6
	lduba	[%l7 + %g6] 0x14,	%l2
	te	%icc,	0x2
	array8	%i6,	%g7,	%l5
	movpos	%xcc,	%o0,	%o7
	tvs	%icc,	0x7
	mova	%xcc,	%o5,	%g3
	movrne	%g2,	0x311,	%i3
	orncc	%i0,	0x1A56,	%i2
	ba,pn	%icc,	loop_1793
	edge32n	%g6,	%o1,	%o2
	fornot1	%f6,	%f16,	%f8
	movg	%icc,	%i7,	%g4
loop_1793:
	mova	%icc,	%o6,	%l4
	nop
	setx	loop_1794,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	orn	%l1,	0x0D61,	%l0
	edge32n	%i5,	%l3,	%l6
	movrgz	%o3,	0x07D,	%g5
loop_1794:
	fones	%f8
	fnand	%f0,	%f6,	%f0
	bn	%xcc,	loop_1795
	edge8	%i4,	%i1,	%o4
	xor	%g1,	%i6,	%g7
	tl	%icc,	0x3
loop_1795:
	movvs	%xcc,	%l2,	%l5
	sdiv	%o0,	0x0835,	%o5
	tgu	%xcc,	0x3
	movcc	%xcc,	%o7,	%g2
	add	%l7,	0x30,	%l6
	wr	%g0,	0x11,	%asi
	casxa	[%l6] 0x11,	%g3,	%i0
	move	%icc,	%i2,	%g6
	movpos	%xcc,	%i3,	%o1
	add	%o2,	%g4,	%i7
	set	0x50, %i2
	lduwa	[%l7 + %i2] 0x81,	%o6
	tsubcc	%l1,	0x1AF6,	%l4
	fbul,a	%fcc3,	loop_1796
	movgu	%icc,	%l0,	%i5
	call	loop_1797
	umul	%l6,	0x1692,	%l3
loop_1796:
	sdivcc	%g5,	0x18DE,	%o3
	bgu	%icc,	loop_1798
loop_1797:
	movge	%xcc,	%i1,	%o4
	fcmps	%fcc2,	%f22,	%f29
	fmovsneg	%xcc,	%f17,	%f26
loop_1798:
	brlz,a	%i4,	loop_1799
	ld	[%l7 + 0x1C],	%f18
	alignaddrl	%g1,	%g7,	%i6
	movvc	%icc,	%l5,	%l2
loop_1799:
	fcmpgt32	%f10,	%f22,	%o0
	sllx	%o5,	0x14,	%g2
	fbg,a	%fcc0,	loop_1800
	ldsh	[%l7 + 0x14],	%g3
	movg	%xcc,	%o7,	%i2
	fbge	%fcc0,	loop_1801
loop_1800:
	sllx	%i0,	%g6,	%o1
	call	loop_1802
	fmovrslz	%o2,	%f21,	%f18
loop_1801:
	tg	%icc,	0x1
	umulcc	%i3,	%g4,	%o6
loop_1802:
	flush	%l7 + 0x7C
	wr	%g0,	0x19,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	movgu	%xcc,	%l1,	%i7
	udivx	%l4,	0x17DD,	%i5
	te	%icc,	0x6
	sll	%l6,	0x07,	%l0
	brgez	%g5,	loop_1803
	movgu	%xcc,	%l3,	%i1
	fnot2s	%f9,	%f28
	brlz	%o4,	loop_1804
loop_1803:
	call	loop_1805
	andncc	%i4,	%o3,	%g1
	array8	%g7,	%i6,	%l2
loop_1804:
	movneg	%icc,	%o0,	%o5
loop_1805:
	bge,pt	%xcc,	loop_1806
	fbug	%fcc0,	loop_1807
	fmovd	%f28,	%f18
	fandnot2s	%f20,	%f17,	%f3
loop_1806:
	nop
	set	0x40, %l0
	stda	%f0,	[%l7 + %l0] 0xf8
	membar	#Sync
loop_1807:
	smul	%l5,	0x1003,	%g2
	subcc	%g3,	%i2,	%o7
	xnorcc	%i0,	%o1,	%g6
	fmovdneg	%xcc,	%f24,	%f30
	fbe,a	%fcc2,	loop_1808
	tneg	%xcc,	0x7
	ldub	[%l7 + 0x22],	%i3
	wr	%g0,	0x18,	%asi
	ldswa	[%l7 + 0x7C] %asi,	%g4
loop_1808:
	fpsub16	%f2,	%f12,	%f18
	popc	0x11FB,	%o2
	movneg	%icc,	%o6,	%l1
	array8	%l4,	%i5,	%l6
	fbe,a	%fcc1,	loop_1809
	fmovrdgz	%l0,	%f12,	%f26
	tleu	%icc,	0x1
	andn	%g5,	0x04A8,	%l3
loop_1809:
	tgu	%icc,	0x1
	bleu,a,pn	%icc,	loop_1810
	tpos	%xcc,	0x5
	fmuld8ulx16	%f5,	%f25,	%f12
	brnz,a	%i7,	loop_1811
loop_1810:
	addcc	%i1,	%i4,	%o3
	addc	%g1,	0x117D,	%o4
	wr	%g0,	0x80,	%asi
	prefetcha	[%l7 + 0x70] %asi,	 0x0
loop_1811:
	movre	%g7,	%o0,	%l2
	tcc	%xcc,	0x2
	fmovrsgez	%l5,	%f23,	%f16
	fbg,a	%fcc1,	loop_1812
	fmovrdgz	%o5,	%f10,	%f22
	subccc	%g3,	0x0E2E,	%i2
	move	%icc,	%g2,	%o7
loop_1812:
	nop
	setx	loop_1813,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	tsubcctv	%i0,	0x1DAB,	%g6
	ldsh	[%l7 + 0x74],	%i3
	movge	%xcc,	%g4,	%o1
loop_1813:
	fmovse	%xcc,	%f15,	%f3
	sethi	0x0456,	%o2
	orncc	%l1,	%o6,	%i5
	fzeros	%f17
	tpos	%xcc,	0x4
	fbn	%fcc1,	loop_1814
	or	%l6,	%l4,	%g5
	tge	%xcc,	0x1
	sra	%l3,	0x1F,	%l0
loop_1814:
	fcmpeq16	%f12,	%f6,	%i1
	fpsub32s	%f17,	%f13,	%f1
	fands	%f31,	%f15,	%f14
	movge	%xcc,	%i4,	%o3
	fbue	%fcc0,	loop_1815
	fcmpeq32	%f14,	%f28,	%g1
	fpsub32	%f26,	%f22,	%f2
	movleu	%xcc,	%i7,	%i6
loop_1815:
	be,a	%icc,	loop_1816
	tleu	%xcc,	0x0
	sra	%o4,	0x02,	%o0
	orcc	%l2,	0x1A4C,	%l5
loop_1816:
	fpadd32	%f26,	%f2,	%f28
	wr	%g0,	0xe2,	%asi
	stba	%o5,	[%l7 + 0x73] %asi
	membar	#Sync
	movrlez	%g7,	%g3,	%g2
	umulcc	%i2,	%o7,	%g6
	fble	%fcc3,	loop_1817
	tn	%xcc,	0x3
	movleu	%icc,	%i3,	%g4
	fbo,a	%fcc0,	loop_1818
loop_1817:
	srax	%i0,	0x11,	%o2
	fmovdgu	%icc,	%f31,	%f12
	bne,pt	%xcc,	loop_1819
loop_1818:
	fmovd	%f14,	%f30
	ldstub	[%l7 + 0x6F],	%l1
	fmovdleu	%xcc,	%f3,	%f30
loop_1819:
	sdivx	%o1,	0x129F,	%o6
	ldd	[%l7 + 0x58],	%f12
	edge8ln	%l6,	%l4,	%g5
	fbg	%fcc0,	loop_1820
	and	%i5,	0x1F8D,	%l0
	fmul8sux16	%f16,	%f26,	%f20
	tge	%icc,	0x2
loop_1820:
	te	%icc,	0x3
	tgu	%xcc,	0x5
	srlx	%i1,	%l3,	%i4
	tge	%icc,	0x3
	movl	%xcc,	%g1,	%o3
	fmovspos	%xcc,	%f16,	%f5
	udivcc	%i6,	0x17A3,	%i7
	movre	%o0,	0x25D,	%o4
	udiv	%l2,	0x1683,	%l5
	movrlz	%o5,	%g7,	%g3
	prefetch	[%l7 + 0x3C],	 0x3
	edge8l	%g2,	%i2,	%o7
	subc	%i3,	%g4,	%i0
	bcs	loop_1821
	edge32ln	%o2,	%l1,	%g6
	fpsub32	%f14,	%f20,	%f4
	add	%o6,	0x0206,	%l6
loop_1821:
	movneg	%icc,	%o1,	%l4
	te	%icc,	0x4
	ta	%xcc,	0x2
	set	0x66, %i7
	ldsba	[%l7 + %i7] 0x19,	%i5
	tle	%icc,	0x1
	movg	%xcc,	%g5,	%l0
	edge8	%l3,	%i1,	%g1
	movle	%icc,	%o3,	%i4
	bcc	loop_1822
	siam	0x4
	fornot1	%f18,	%f16,	%f0
	ldd	[%l7 + 0x50],	%i6
loop_1822:
	brlez	%o0,	loop_1823
	xor	%i7,	%o4,	%l2
	stbar
	movrlz	%o5,	%l5,	%g7
loop_1823:
	movneg	%icc,	%g3,	%g2
	add	%o7,	%i3,	%i2
	fmovdneg	%icc,	%f14,	%f20
	sdivx	%g4,	0x0DC9,	%i0
	sdivcc	%l1,	0x1428,	%g6
	set	0x2A, %l1
	ldsha	[%l7 + %l1] 0x11,	%o2
	movn	%xcc,	%l6,	%o6
	membar	0x09
	fbuge,a	%fcc2,	loop_1824
	tvs	%icc,	0x3
	tcs	%xcc,	0x3
	tcs	%xcc,	0x0
loop_1824:
	movg	%icc,	%o1,	%l4
	fabsd	%f12,	%f26
	set	0x70, %i6
	lduwa	[%l7 + %i6] 0x89,	%i5
	fnot2s	%f15,	%f13
	fba	%fcc1,	loop_1825
	movneg	%xcc,	%g5,	%l0
	edge32	%i1,	%l3,	%o3
	edge32	%g1,	%i4,	%i6
loop_1825:
	nop
	set	0x58, %g2
	lduwa	[%l7 + %g2] 0x04,	%o0
	array8	%i7,	%o4,	%o5
	tleu	%xcc,	0x0
	movvs	%xcc,	%l5,	%l2
	tg	%icc,	0x4
	fpsub16s	%f20,	%f7,	%f31
	edge8ln	%g3,	%g2,	%o7
	movvs	%xcc,	%g7,	%i2
	set	0x60, %o2
	stda	%g4,	[%l7 + %o2] 0x11
	edge8l	%i3,	%i0,	%l1
	movcs	%icc,	%g6,	%l6
	fbue	%fcc1,	loop_1826
	move	%icc,	%o6,	%o1
	wr	%g0,	0x81,	%asi
	ldsba	[%l7 + 0x3B] %asi,	%o2
loop_1826:
	andcc	%l4,	0x1FFF,	%g5
	umulcc	%l0,	0x0586,	%i5
	edge32l	%i1,	%l3,	%o3
	fnegs	%f31,	%f10
	fornot1	%f24,	%f26,	%f0
	fbg	%fcc3,	loop_1827
	edge16	%i4,	%i6,	%g1
	fmovsl	%xcc,	%f6,	%f4
	edge8ln	%o0,	%o4,	%i7
loop_1827:
	tge	%xcc,	0x1
	movrgez	%l5,	%l2,	%g3
	fornot1s	%f11,	%f22,	%f5
	and	%o5,	%o7,	%g7
	subccc	%g2,	%g4,	%i2
	subc	%i0,	%i3,	%g6
	movpos	%xcc,	%l1,	%o6
	orncc	%l6,	0x1293,	%o1
	fmovsn	%xcc,	%f22,	%f7
	nop
	setx loop_1828, %l0, %l1
	jmpl %l1, %l4
	addccc	%o2,	%l0,	%g5
	fmovd	%f18,	%f26
	ldsb	[%l7 + 0x3E],	%i1
loop_1828:
	addccc	%l3,	0x10EB,	%o3
	fmovscc	%icc,	%f19,	%f8
	fnand	%f28,	%f26,	%f26
	srl	%i4,	0x12,	%i5
	set	0x24, %l6
	swapa	[%l7 + %l6] 0x11,	%i6
	movrlez	%g1,	%o4,	%i7
	orcc	%o0,	%l5,	%g3
	movre	%l2,	0x21A,	%o7
	ldstub	[%l7 + 0x73],	%g7
	subccc	%o5,	0x14FE,	%g4
	for	%f22,	%f14,	%f10
	mulscc	%i2,	%g2,	%i0
	tsubcctv	%g6,	%i3,	%l1
	fmovdge	%icc,	%f13,	%f23
	udivcc	%o6,	0x0C37,	%l6
	fbu	%fcc3,	loop_1829
	array32	%l4,	%o2,	%o1
	bcc,a	%xcc,	loop_1830
	movrlez	%l0,	0x206,	%g5
loop_1829:
	edge8	%l3,	%o3,	%i1
	sub	%i5,	%i4,	%i6
loop_1830:
	edge8	%o4,	%g1,	%o0
	fmovscc	%icc,	%f11,	%f13
	brnz,a	%i7,	loop_1831
	add	%g3,	%l5,	%l2
	fmovspos	%xcc,	%f9,	%f9
	ldd	[%l7 + 0x50],	%g6
loop_1831:
	tpos	%xcc,	0x4
	movpos	%xcc,	%o5,	%o7
	bl,a	loop_1832
	sub	%g4,	%g2,	%i2
	edge8	%g6,	%i3,	%l1
	bne,a	%icc,	loop_1833
loop_1832:
	movcc	%xcc,	%o6,	%i0
	set	0x42, %o6
	ldsba	[%l7 + %o6] 0x80,	%l4
loop_1833:
	nop
	add	%l7,	0x6C,	%l6
	wr	%g0,	0x18,	%asi
	lda	[%l6] %asi,	%o2
	casa	[%l6] 0x18,	%o2,	%l6
	mova	%xcc,	%l0,	%o1
	andn	%g5,	0x1CAB,	%o3
	sir	0x1198
	fbug,a	%fcc2,	loop_1834
	sir	0x1EBF
	stbar
	udiv	%i1,	0x13B3,	%l3
loop_1834:
	ldsb	[%l7 + 0x0A],	%i5
	movge	%xcc,	%i4,	%o4
	fornot2	%f16,	%f2,	%f18
	movrgz	%i6,	0x23C,	%o0
	tsubcc	%g1,	0x115B,	%g3
	fornot1s	%f25,	%f7,	%f31
	add	%l7,	0x18,	%l6
	wr	%g0,	0x19,	%asi
	ldxa	[%l6] %asi,	%l5
	casxa	[%l6] 0x19,	%l5,	%i7
	taddcc	%g7,	0x0F66,	%o5
	fnot1s	%f25,	%f4
	wr	%g0,	0x89,	%asi
	lda	[%l7 + 0x0C] %asi,	%f3
	fbug	%fcc3,	loop_1835
	sdivcc	%l2,	0x105B,	%g4
	udiv	%o7,	0x0CD7,	%i2
	umul	%g2,	0x088C,	%g6
loop_1835:
	mova	%icc,	%i3,	%o6
	subccc	%i0,	0x0827,	%l4
	ldsh	[%l7 + 0x6A],	%l1
	fmovdcc	%xcc,	%f13,	%f3
	tne	%icc,	0x6
	mova	%icc,	%l6,	%l0
	sir	0x15F4
	andncc	%o1,	%o2,	%g5
	te	%xcc,	0x2
	tne	%icc,	0x0
	addcc	%o3,	0x0CC7,	%i1
	fpsub16	%f22,	%f26,	%f26
	edge8	%l3,	%i4,	%i5
	add	%l7,	0x0C,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%i6
	casa	[%l6] 0x81,	%i6,	%o4
	edge8	%g1,	%g3,	%o0
	umulcc	%i7,	%g7,	%o5
	te	%xcc,	0x6
	bn	loop_1836
	alignaddrl	%l2,	%g4,	%l5
	fmovrde	%o7,	%f8,	%f26
	brnz	%g2,	loop_1837
loop_1836:
	udivcc	%g6,	0x1531,	%i2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tcs	%xcc,	0x5
loop_1837:
	xnor	%o6,	%i0,	%i3
	tn	%icc,	0x1
	wr	%g0,	0x18,	%asi
	sta	%f26,	[%l7 + 0x58] %asi
	fmovse	%icc,	%f31,	%f2
	wr	%g0,	0x10,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	movrlez	%l1,	0x11F,	%l4
	alignaddrl	%l6,	%l0,	%o2
	fbu,a	%fcc0,	loop_1838
	orn	%g5,	0x07E4,	%o1
	bvs,pt	%xcc,	loop_1839
	fmovrde	%i1,	%f12,	%f22
loop_1838:
	subc	%o3,	0x0354,	%l3
	movcs	%xcc,	%i5,	%i6
loop_1839:
	tpos	%icc,	0x1
	be,a	loop_1840
	smulcc	%o4,	%g1,	%i4
	bl,a,pt	%xcc,	loop_1841
	andncc	%g3,	%i7,	%o0
loop_1840:
	swap	[%l7 + 0x4C],	%o5
	edge16	%l2,	%g4,	%g7
loop_1841:
	fmovrde	%l5,	%f8,	%f10
	te	%icc,	0x0
	movcs	%icc,	%o7,	%g2
	fbn,a	%fcc2,	loop_1842
	stbar
	fmovrslz	%i2,	%f27,	%f23
	movle	%xcc,	%o6,	%g6
loop_1842:
	flush	%l7 + 0x70
	movrlez	%i3,	0x37F,	%i0
	andncc	%l1,	%l6,	%l4
	taddcctv	%o2,	%g5,	%l0
	edge16	%i1,	%o3,	%o1
	fornot1	%f0,	%f4,	%f28
	flush	%l7 + 0x60
	fmovsleu	%icc,	%f26,	%f22
	set	0x5E, %g4
	ldsha	[%l7 + %g4] 0x18,	%l3
	nop
	set	0x60, %i3
	std	%f14,	[%l7 + %i3]
	fmovsgu	%icc,	%f20,	%f12
	set	0x36, %i4
	ldstuba	[%l7 + %i4] 0x0c,	%i6
	andncc	%i5,	%o4,	%i4
	sdivcc	%g1,	0x146B,	%g3
	fble	%fcc2,	loop_1843
	subccc	%o0,	%o5,	%l2
	stb	%i7,	[%l7 + 0x4A]
	fbu,a	%fcc3,	loop_1844
loop_1843:
	bpos,a,pt	%xcc,	loop_1845
	srax	%g4,	0x10,	%g7
	movne	%xcc,	%o7,	%l5
loop_1844:
	nop
	wr	%g0,	0x10,	%asi
	stwa	%g2,	[%l7 + 0x0C] %asi
loop_1845:
	sdiv	%i2,	0x181E,	%g6
	fcmpd	%fcc1,	%f10,	%f2
	fands	%f19,	%f2,	%f6
	stw	%o6,	[%l7 + 0x48]
	add	%l7,	0x4C,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%i3
	casa	[%l6] 0x89,	%i3,	%i0
	mulx	%l6,	%l4,	%o2
	tleu	%icc,	0x3
	fmovdcs	%icc,	%f4,	%f2
	orn	%l1,	%l0,	%i1
	array16	%g5,	%o3,	%l3
	movleu	%icc,	%i6,	%i5
	srl	%o1,	0x1D,	%i4
	subccc	%o4,	%g1,	%o0
	movneg	%icc,	%g3,	%o5
	tl	%icc,	0x6
	edge32n	%i7,	%g4,	%l2
	orcc	%g7,	%o7,	%g2
	std	%f8,	[%l7 + 0x18]
	membar	#Sync
	set	0x40, %l2
	ldda	[%l7 + %l2] 0xf9,	%f16
	smul	%i2,	%g6,	%l5
	swap	[%l7 + 0x30],	%o6
	bpos	loop_1846
	tn	%xcc,	0x3
	udivcc	%i3,	0x11E6,	%i0
	fpack16	%f22,	%f5
loop_1846:
	edge32l	%l4,	%l6,	%o2
	movle	%xcc,	%l1,	%l0
	tgu	%xcc,	0x1
	edge32ln	%g5,	%o3,	%i1
	fmovse	%icc,	%f17,	%f16
	array32	%i6,	%i5,	%o1
	andcc	%l3,	0x1BF2,	%i4
	sdivcc	%o4,	0x1993,	%o0
	movge	%icc,	%g1,	%o5
	sth	%i7,	[%l7 + 0x3C]
	for	%f22,	%f0,	%f10
	fornot1	%f10,	%f2,	%f8
	edge16l	%g4,	%g3,	%g7
	andncc	%o7,	%l2,	%g2
	ta	%xcc,	0x1
	ldub	[%l7 + 0x37],	%g6
	srax	%i2,	%l5,	%i3
	set	0x64, %o5
	ldsha	[%l7 + %o5] 0x11,	%o6
	fsrc1s	%f7,	%f18
	fmovd	%f12,	%f14
	wr	%g0,	0x80,	%asi
	ldstuba	[%l7 + 0x6D] %asi,	%i0
	set	0x50, %i1
	ldda	[%l7 + %i1] 0xea,	%i6
	wr	%g0,	0x0c,	%asi
	stha	%l4,	[%l7 + 0x3E] %asi
	fpsub32	%f4,	%f2,	%f20
	fpadd32	%f14,	%f22,	%f24
	smulcc	%l1,	0x1698,	%o2
	tg	%xcc,	0x4
	taddcctv	%g5,	0x04BD,	%o3
	addcc	%l0,	%i1,	%i6
	wr	%g0,	0x81,	%asi
	ldswa	[%l7 + 0x3C] %asi,	%i5
	wr	%g0,	0x2a,	%asi
	stwa	%l3,	[%l7 + 0x5C] %asi
	membar	#Sync
	tcs	%icc,	0x6
	fors	%f31,	%f26,	%f30
	fxor	%f24,	%f26,	%f6
	add	%o1,	%o4,	%i4
	tvc	%icc,	0x2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmuld8sux16	%f28,	%f24,	%f2
	movrgz	%o0,	0x129,	%o5
	array32	%g1,	%i7,	%g3
	srl	%g7,	%g4,	%o7
	fcmpeq32	%f2,	%f18,	%l2
	or	%g2,	%i2,	%g6
	brlz,a	%l5,	loop_1847
	fbg	%fcc3,	loop_1848
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsle	%xcc,	%f4,	%f2
loop_1847:
	orncc	%o6,	%i3,	%l6
loop_1848:
	nop
	set	0x30, %g7
	stda	%l4,	[%l7 + %g7] 0x2b
	membar	#Sync
	andncc	%i0,	%o2,	%l1
	wr	%g0,	0x18,	%asi
	lduha	[%l7 + 0x36] %asi,	%o3
	orcc	%g5,	%l0,	%i1
	movg	%xcc,	%i6,	%i5
	brz	%o1,	loop_1849
	fnot2	%f0,	%f24
	andncc	%l3,	%i4,	%o4
	std	%o0,	[%l7 + 0x28]
loop_1849:
	fand	%f8,	%f26,	%f18
	nop
	set	0x4C, %o1
	stb	%o5,	[%l7 + %o1]
	srlx	%g1,	%i7,	%g3
	srl	%g7,	%o7,	%g4
	swap	[%l7 + 0x28],	%l2
	ldstub	[%l7 + 0x64],	%i2
	ld	[%l7 + 0x5C],	%f14
	bcc,a	%icc,	loop_1850
	movl	%icc,	%g2,	%l5
	sllx	%o6,	%i3,	%l6
	edge8l	%l4,	%g6,	%i0
loop_1850:
	or	%l1,	%o2,	%g5
	xnor	%o3,	0x1F36,	%i1
	sllx	%i6,	%l0,	%i5
	fmovdvc	%icc,	%f12,	%f12
	addc	%l3,	0x0A02,	%i4
	srax	%o4,	%o0,	%o1
	fmovdl	%xcc,	%f26,	%f30
	movrgez	%o5,	0x18D,	%g1
	movle	%icc,	%i7,	%g7
	be,a,pn	%icc,	loop_1851
	bge,a	%xcc,	loop_1852
	fmovde	%xcc,	%f1,	%f0
	tneg	%xcc,	0x7
loop_1851:
	fbge,a	%fcc2,	loop_1853
loop_1852:
	tcc	%icc,	0x1
	fmovdneg	%icc,	%f9,	%f22
	tge	%icc,	0x5
loop_1853:
	movvc	%xcc,	%g3,	%g4
	or	%o7,	%i2,	%g2
	fbue	%fcc1,	loop_1854
	andcc	%l2,	%l5,	%o6
	umul	%i3,	%l6,	%g6
	fbug,a	%fcc0,	loop_1855
loop_1854:
	udivcc	%i0,	0x0091,	%l1
	tvc	%icc,	0x4
	tle	%icc,	0x2
loop_1855:
	edge16n	%o2,	%g5,	%o3
	prefetch	[%l7 + 0x74],	 0x3
	set	0x30, %g3
	lduwa	[%l7 + %g3] 0x89,	%i1
	movpos	%icc,	%l4,	%l0
	nop
	set	0x5C, %i5
	lduw	[%l7 + %i5],	%i6
	mulscc	%l3,	0x03B5,	%i4
	fmovdpos	%xcc,	%f27,	%f11
	subc	%o4,	%o0,	%i5
	edge32ln	%o5,	%o1,	%g1
	pdist	%f24,	%f6,	%f8
	fbne	%fcc1,	loop_1856
	faligndata	%f10,	%f26,	%f14
	fxnors	%f18,	%f18,	%f13
	sllx	%g7,	0x09,	%g3
loop_1856:
	movgu	%icc,	%g4,	%o7
	fand	%f8,	%f30,	%f24
	tleu	%icc,	0x4
	fbule,a	%fcc2,	loop_1857
	sllx	%i2,	0x1F,	%g2
	subccc	%i7,	0x01AA,	%l5
	andn	%o6,	0x0F3B,	%i3
loop_1857:
	edge32n	%l6,	%g6,	%i0
	fmovrdlez	%l1,	%f24,	%f4
	fmul8sux16	%f10,	%f14,	%f30
	tsubcc	%l2,	%g5,	%o3
	fble	%fcc1,	loop_1858
	bvs,pn	%icc,	loop_1859
	fbu,a	%fcc2,	loop_1860
	fmovsne	%xcc,	%f13,	%f28
loop_1858:
	te	%icc,	0x5
loop_1859:
	sdiv	%i1,	0x054F,	%o2
loop_1860:
	edge16n	%l0,	%i6,	%l3
	xnorcc	%l4,	%o4,	%i4
	addccc	%i5,	%o0,	%o1
	movpos	%icc,	%o5,	%g1
	ldd	[%l7 + 0x58],	%g6
	set	0x39, %l3
	ldsba	[%l7 + %l3] 0x80,	%g3
	fnot2s	%f10,	%f1
	set	0x70, %l4
	ldda	[%l7 + %l4] 0x04,	%g4
	movvc	%xcc,	%o7,	%g2
	bcc,a,pt	%icc,	loop_1861
	bleu	loop_1862
	sllx	%i2,	0x0C,	%l5
	subcc	%i7,	0x1320,	%i3
loop_1861:
	fbug	%fcc2,	loop_1863
loop_1862:
	edge32n	%o6,	%l6,	%i0
	fmovdg	%icc,	%f15,	%f18
	fbue	%fcc1,	loop_1864
loop_1863:
	fnot2	%f10,	%f4
	fornot1	%f6,	%f8,	%f8
	fnot1	%f2,	%f28
loop_1864:
	edge16l	%l1,	%g6,	%g5
	tle	%xcc,	0x4
	sdiv	%o3,	0x0BAE,	%l2
	tsubcctv	%i1,	%o2,	%l0
	ta	%xcc,	0x6
	edge32n	%l3,	%i6,	%o4
	addccc	%l4,	%i5,	%i4
	fmul8x16au	%f2,	%f28,	%f4
	fnot2s	%f29,	%f9
	subccc	%o1,	0x0BB4,	%o5
	fmuld8ulx16	%f6,	%f1,	%f16
	edge32	%o0,	%g7,	%g3
	move	%xcc,	%g1,	%o7
	fcmps	%fcc1,	%f17,	%f17
	mulx	%g2,	%i2,	%l5
	array16	%i7,	%g4,	%o6
	nop
	set	0x20, %g1
	std	%f10,	[%l7 + %g1]
	nop
	set	0x14, %i0
	ldsh	[%l7 + %i0],	%l6
	movl	%icc,	%i3,	%i0
	movl	%xcc,	%l1,	%g6
	movl	%icc,	%g5,	%o3
	taddcc	%l2,	0x03E8,	%i1
	fpadd32	%f30,	%f14,	%f12
	movrlez	%l0,	%o2,	%i6
	sllx	%l3,	0x05,	%o4
	mulx	%i5,	0x0AC1,	%i4
	brgz	%o1,	loop_1865
	fmovdvc	%xcc,	%f6,	%f22
	srax	%l4,	0x0A,	%o5
	umulcc	%o0,	0x1932,	%g7
loop_1865:
	movre	%g3,	0x126,	%o7
	tcs	%icc,	0x5
	wr	%g0,	0x0c,	%asi
	ldstuba	[%l7 + 0x50] %asi,	%g2
	bvs,pt	%icc,	loop_1866
	movrne	%g1,	0x08D,	%l5
	fmovscs	%icc,	%f6,	%f9
	movpos	%xcc,	%i7,	%i2
loop_1866:
	movle	%icc,	%g4,	%l6
	subccc	%i3,	0x1FBE,	%i0
	tgu	%icc,	0x3
	sllx	%l1,	0x07,	%g6
	tl	%xcc,	0x6
	fornot2s	%f21,	%f31,	%f12
	nop
	set	0x68, %o0
	ldd	[%l7 + %o0],	%f16
	membar	0x53
	mulx	%o6,	%g5,	%o3
	te	%icc,	0x7
	fcmpeq16	%f4,	%f16,	%l2
	edge8ln	%l0,	%o2,	%i6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	lduw	[%l7 + 0x10],	%l3
	addcc	%i1,	%o4,	%i4
	fmovrsgz	%o1,	%f28,	%f16
	xnor	%i5,	%l4,	%o0
	fmovs	%f3,	%f27
	nop
	set	0x24, %l5
	ldub	[%l7 + %l5],	%g7
	edge8	%g3,	%o7,	%o5
	fba	%fcc1,	loop_1867
	bcc,pt	%icc,	loop_1868
	smulcc	%g2,	%g1,	%l5
	edge8ln	%i7,	%i2,	%g4
loop_1867:
	array16	%l6,	%i3,	%l1
loop_1868:
	fbo	%fcc0,	loop_1869
	ldub	[%l7 + 0x1F],	%g6
	std	%f8,	[%l7 + 0x58]
	tg	%icc,	0x5
loop_1869:
	orn	%i0,	0x166C,	%g5
	movrgez	%o6,	%o3,	%l0
	taddcctv	%o2,	%l2,	%i6
	umulcc	%i1,	%l3,	%o4
	tcs	%xcc,	0x0
	tpos	%xcc,	0x3
	wr	%g0,	0x80,	%asi
	stba	%o1,	[%l7 + 0x3C] %asi
	subcc	%i5,	0x1379,	%l4
	stb	%i4,	[%l7 + 0x4D]
	fexpand	%f10,	%f28
	bleu,a,pt	%icc,	loop_1870
	membar	0x6E
	fbuge	%fcc2,	loop_1871
	movneg	%xcc,	%o0,	%g7
loop_1870:
	fmovsge	%xcc,	%f19,	%f8
	movrlz	%g3,	%o7,	%g2
loop_1871:
	subc	%o5,	%g1,	%i7
	srax	%i2,	0x16,	%l5
	mulscc	%l6,	0x1A6E,	%g4
	tvs	%icc,	0x6
	xnorcc	%l1,	%i3,	%g6
	tvc	%xcc,	0x7
	tvc	%icc,	0x0
	mova	%xcc,	%g5,	%o6
	fxors	%f10,	%f1,	%f2
	ldsh	[%l7 + 0x32],	%o3
	addcc	%l0,	0x1204,	%o2
	fmovrslez	%i0,	%f6,	%f12
	srax	%i6,	%l2,	%i1
	bge,a,pt	%xcc,	loop_1872
	tcc	%icc,	0x4
	edge8ln	%o4,	%o1,	%i5
	bcs,pn	%xcc,	loop_1873
loop_1872:
	tge	%xcc,	0x3
	pdist	%f2,	%f22,	%f2
	edge8l	%l3,	%i4,	%o0
loop_1873:
	movcc	%icc,	%g7,	%l4
	orcc	%o7,	%g2,	%o5
	fbul,a	%fcc2,	loop_1874
	fandnot1s	%f24,	%f5,	%f10
	ldx	[%l7 + 0x48],	%g1
	array32	%i7,	%g3,	%l5
loop_1874:
	edge32ln	%i2,	%l6,	%g4
	tge	%icc,	0x3
	tleu	%icc,	0x1
	xorcc	%l1,	%i3,	%g5
	fpack16	%f26,	%f21
	fble,a	%fcc3,	loop_1875
	tvs	%icc,	0x0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	st	%f12,	[%l7 + 0x38]
loop_1875:
	nop
	set	0x5C, %o7
	stwa	%g6,	[%l7 + %o7] 0x2f
	membar	#Sync
	lduh	[%l7 + 0x22],	%o6
	andcc	%l0,	0x0C47,	%o2
	fbl	%fcc0,	loop_1876
	fbule	%fcc2,	loop_1877
	tpos	%xcc,	0x6
	wr	%g0,	0x11,	%asi
	stda	%i0,	[%l7 + 0x10] %asi
loop_1876:
	sdivx	%i6,	0x0EFF,	%l2
loop_1877:
	tg	%icc,	0x1
	movrgz	%o3,	%i1,	%o4
	orn	%i5,	0x1BB0,	%l3
	fabss	%f25,	%f24
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movvs	%xcc,	%i4,	%o1
	bn,pn	%xcc,	loop_1878
	fsrc2s	%f16,	%f19
	fcmps	%fcc1,	%f2,	%f13
	fpadd16	%f8,	%f18,	%f22
loop_1878:
	siam	0x1
	fones	%f26
	movleu	%icc,	%g7,	%o0
	fpack16	%f14,	%f1
	fmovdle	%xcc,	%f26,	%f27
	movleu	%icc,	%o7,	%g2
	addccc	%l4,	%o5,	%g1
	bvs,pt	%xcc,	loop_1879
	fpsub32	%f16,	%f10,	%f6
	array16	%i7,	%l5,	%g3
	smul	%i2,	0x1CB5,	%l6
loop_1879:
	orncc	%g4,	%i3,	%l1
	fmovsl	%icc,	%f10,	%f24
	bne,a	%xcc,	loop_1880
	smulcc	%g5,	0x03D9,	%o6
	orcc	%l0,	0x0B67,	%g6
	movrgz	%o2,	0x3A6,	%i0
loop_1880:
	tg	%icc,	0x1
	array32	%l2,	%i6,	%i1
	te	%icc,	0x3
	tvc	%xcc,	0x6
	taddcctv	%o4,	0x0150,	%o3
	andncc	%l3,	%i4,	%i5
	fmovse	%xcc,	%f5,	%f16
	sdivcc	%g7,	0x1925,	%o0
	movrgz	%o7,	%o1,	%g2
	movrne	%o5,	0x39A,	%g1
	add	%l7,	0x78,	%l6
	wr	%g0,	0x0c,	%asi
	casa	[%l6] %asi,	%l4,	%i7
	movcc	%icc,	%l5,	%i2
	addccc	%g3,	%l6,	%g4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32n	%l1,	%i3,	%g5
	tvc	%xcc,	0x2
	fmovdle	%icc,	%f15,	%f4
	edge32l	%l0,	%o6,	%g6
	mulx	%i0,	0x1E11,	%l2
	movge	%xcc,	%o2,	%i6
	fmovsn	%xcc,	%f28,	%f18
	nop
	set	0x40, %o3
	stx	%o4,	[%l7 + %o3]
	wr	%g0,	0x04,	%asi
	prefetcha	[%l7 + 0x30] %asi,	 0x1
	sll	%i1,	%l3,	%i5
	fmovdcs	%xcc,	%f6,	%f17
	set	0x5E, %g5
	stha	%i4,	[%l7 + %g5] 0x2a
	membar	#Sync
	fcmpgt16	%f18,	%f14,	%o0
	fcmpeq16	%f6,	%f16,	%g7
	edge16n	%o1,	%o7,	%o5
	wr	%g0,	0x89,	%asi
	ldstuba	[%l7 + 0x2E] %asi,	%g1
	ldsb	[%l7 + 0x1E],	%g2
	mulx	%i7,	0x1FF2,	%l4
	wr	%g0,	0x18,	%asi
	stxa	%l5,	[%l7 + 0x18] %asi
	smulcc	%g3,	%i2,	%l6
	fmovdl	%icc,	%f29,	%f12
	fbe	%fcc0,	loop_1881
	fbe	%fcc0,	loop_1882
	tne	%icc,	0x2
	for	%f10,	%f2,	%f20
loop_1881:
	move	%xcc,	%g4,	%i3
loop_1882:
	fmovdpos	%icc,	%f27,	%f9
	movne	%xcc,	%l1,	%g5
	nop
	set	0x14, %o4
	ldsb	[%l7 + %o4],	%o6
	andncc	%l0,	%g6,	%i0
	fcmped	%fcc2,	%f28,	%f6
	movge	%xcc,	%l2,	%o2
	tn	%icc,	0x2
	edge16ln	%i6,	%o4,	%i1
	udiv	%o3,	0x0DCF,	%l3
	tl	%xcc,	0x2
	orcc	%i5,	0x0B65,	%o0
	sllx	%g7,	0x01,	%o1
	bne	%icc,	loop_1883
	andncc	%o7,	%o5,	%i4
	edge8ln	%g1,	%i7,	%g2
	fpsub16s	%f31,	%f23,	%f6
loop_1883:
	orn	%l5,	0x0BD1,	%g3
	taddcctv	%i2,	%l4,	%g4
	tg	%icc,	0x3
	mova	%icc,	%i3,	%l1
	fmovsvs	%xcc,	%f31,	%f22
	tg	%xcc,	0x5
	fbug	%fcc3,	loop_1884
	array32	%l6,	%g5,	%o6
	smulcc	%g6,	0x156A,	%l0
	sethi	0x044F,	%i0
loop_1884:
	nop
	set	0x78, %i2
	stxa	%o2,	[%l7 + %i2] 0x2a
	membar	#Sync
	ldsb	[%l7 + 0x75],	%i6
	xor	%l2,	%o4,	%o3
	movvc	%icc,	%i1,	%l3
	subc	%o0,	0x0C8D,	%i5
	std	%f26,	[%l7 + 0x60]
	std	%f12,	[%l7 + 0x30]
	fmovdneg	%xcc,	%f24,	%f22
	wr	%g0,	0x11,	%asi
	stba	%o1,	[%l7 + 0x4F] %asi
	tvs	%icc,	0x4
	and	%g7,	0x03E0,	%o5
	orn	%o7,	0x058E,	%i4
	xor	%g1,	0x1752,	%i7
	fble,a	%fcc2,	loop_1885
	fmovrdlez	%g2,	%f24,	%f30
	tne	%icc,	0x0
	te	%icc,	0x2
loop_1885:
	fbug,a	%fcc1,	loop_1886
	tneg	%xcc,	0x1
	tgu	%xcc,	0x6
	wr	%g0,	0x81,	%asi
	lda	[%l7 + 0x28] %asi,	%f29
loop_1886:
	movn	%xcc,	%l5,	%i2
	sir	0x016D
	movge	%icc,	%g3,	%l4
	ba,a,pn	%icc,	loop_1887
	fpack32	%f26,	%f30,	%f10
	sll	%i3,	0x16,	%g4
	set	0x08, %l0
	stda	%l0,	[%l7 + %l0] 0x2b
	membar	#Sync
loop_1887:
	fcmple32	%f4,	%f22,	%g5
	array16	%l6,	%o6,	%g6
	nop
	setx loop_1888, %l0, %l1
	jmpl %l1, %i0
	nop
	setx	loop_1889,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fmovdleu	%xcc,	%f21,	%f0
	set	0x40, %i7
	ldda	[%l7 + %i7] 0x81,	%f0
loop_1888:
	fmul8x16	%f15,	%f16,	%f4
loop_1889:
	tleu	%xcc,	0x3
	nop
	setx loop_1890, %l0, %l1
	jmpl %l1, %l0
	bleu,a,pn	%xcc,	loop_1891
	movvs	%icc,	%o2,	%l2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1890:
	subccc	%o4,	%i6,	%i1
loop_1891:
	tleu	%xcc,	0x4
	edge8l	%l3,	%o0,	%o3
	edge16ln	%o1,	%g7,	%o5
	fmovsgu	%icc,	%f17,	%f13
	fnands	%f9,	%f16,	%f1
	orcc	%i5,	0x03E7,	%i4
	fmovse	%icc,	%f2,	%f8
	movrgez	%g1,	%o7,	%g2
	bvc,pn	%xcc,	loop_1892
	tcs	%xcc,	0x7
	set	0x50, %l1
	prefetcha	[%l7 + %l1] 0x10,	 0x2
loop_1892:
	edge8ln	%i2,	%i7,	%g3
	subcc	%i3,	%l4,	%l1
	ta	%icc,	0x3
	fors	%f12,	%f15,	%f9
	fmovrslz	%g5,	%f14,	%f15
	movrgez	%l6,	%g4,	%o6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8ln	%g6,	%l0,	%i0
	fmovdg	%xcc,	%f6,	%f18
	wr	%g0,	0x80,	%asi
	lduwa	[%l7 + 0x44] %asi,	%l2
	tcc	%icc,	0x4
	fornot1	%f14,	%f24,	%f2
	fnegd	%f12,	%f26
	srlx	%o4,	0x04,	%o2
	tgu	%xcc,	0x1
	fmovrdgz	%i6,	%f10,	%f12
	lduw	[%l7 + 0x40],	%i1
	edge8	%l3,	%o0,	%o3
	fbne,a	%fcc1,	loop_1893
	movvc	%xcc,	%g7,	%o1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tcs	%icc,	0x2
loop_1893:
	fble	%fcc2,	loop_1894
	bge,a	%icc,	loop_1895
	sll	%o5,	%i4,	%g1
	movvc	%xcc,	%i5,	%g2
loop_1894:
	sth	%o7,	[%l7 + 0x6E]
loop_1895:
	nop
	wr	%g0,	0x04,	%asi
	lduba	[%l7 + 0x42] %asi,	%l5
	set	0x38, %g6
	stxa	%i7,	[%l7 + %g6] 0x04
	edge16l	%g3,	%i3,	%l4
	movl	%xcc,	%l1,	%g5
	fmovdl	%xcc,	%f20,	%f25
	std	%f24,	[%l7 + 0x20]
	wr	%g0,	0x80,	%asi
	ldstuba	[%l7 + 0x1B] %asi,	%l6
	movn	%icc,	%g4,	%i2
	movg	%xcc,	%o6,	%l0
	fbo	%fcc1,	loop_1896
	movleu	%icc,	%i0,	%g6
	membar	0x5F
	and	%l2,	0x1A2A,	%o4
loop_1896:
	bcc,pt	%icc,	loop_1897
	movrne	%o2,	0x312,	%i6
	addc	%i1,	0x0E48,	%l3
	tle	%icc,	0x7
loop_1897:
	fxnor	%f6,	%f8,	%f30
	stw	%o0,	[%l7 + 0x34]
	movpos	%icc,	%g7,	%o1
	movvc	%icc,	%o3,	%o5
	fmovdgu	%icc,	%f20,	%f9
	fnegs	%f31,	%f15
	orncc	%i4,	%i5,	%g1
	ble	loop_1898
	taddcc	%g2,	%l5,	%o7
	tcs	%icc,	0x7
	addc	%i7,	0x15FA,	%g3
loop_1898:
	fbule,a	%fcc3,	loop_1899
	movre	%i3,	%l1,	%l4
	stx	%l6,	[%l7 + 0x10]
	xorcc	%g5,	%g4,	%i2
loop_1899:
	sir	0x1EA5
	andn	%o6,	0x14BD,	%l0
	fsrc2	%f20,	%f2
	call	loop_1900
	tneg	%xcc,	0x4
	fcmple32	%f6,	%f8,	%g6
	wr	%g0,	0x80,	%asi
	lda	[%l7 + 0x0C] %asi,	%f14
loop_1900:
	bge,a	loop_1901
	fmovde	%icc,	%f3,	%f31
	stw	%l2,	[%l7 + 0x14]
	addcc	%i0,	%o4,	%o2
loop_1901:
	fmuld8ulx16	%f30,	%f10,	%f16
	umulcc	%i6,	%i1,	%o0
	fmovsle	%xcc,	%f21,	%f10
	tn	%xcc,	0x2
	fbu,a	%fcc2,	loop_1902
	movcc	%icc,	%l3,	%g7
	ba,pt	%xcc,	loop_1903
	addccc	%o3,	%o5,	%o1
loop_1902:
	ldub	[%l7 + 0x0B],	%i5
	membar	0x12
loop_1903:
	bge	%xcc,	loop_1904
	umul	%g1,	0x10A9,	%g2
	sir	0x000B
	bg,pn	%xcc,	loop_1905
loop_1904:
	andncc	%l5,	%o7,	%i7
	set	0x4D, %i6
	ldstuba	[%l7 + %i6] 0x80,	%g3
loop_1905:
	te	%xcc,	0x2
	wr	%g0,	0x89,	%asi
	sta	%f16,	[%l7 + 0x30] %asi
	bg	loop_1906
	movrgez	%i4,	%l1,	%i3
	fbl,a	%fcc2,	loop_1907
	xnor	%l6,	0x046B,	%g5
loop_1906:
	alignaddrl	%g4,	%i2,	%l4
	taddcctv	%l0,	%g6,	%o6
loop_1907:
	fnot1	%f22,	%f8
	srlx	%i0,	%l2,	%o2
	movne	%icc,	%i6,	%i1
	fpsub32	%f18,	%f20,	%f14
	fpsub16	%f24,	%f14,	%f22
	movvs	%icc,	%o0,	%o4
	fmovsn	%xcc,	%f13,	%f6
	srax	%l3,	0x1D,	%g7
	addccc	%o5,	0x1463,	%o1
	edge8ln	%i5,	%o3,	%g1
	membar	0x33
	ldsh	[%l7 + 0x78],	%l5
	fexpand	%f14,	%f4
	fornot1	%f20,	%f28,	%f8
	movne	%xcc,	%g2,	%i7
	tl	%icc,	0x4
	andncc	%o7,	%i4,	%g3
	sdiv	%l1,	0x0B48,	%l6
	nop
	setx loop_1908, %l0, %l1
	jmpl %l1, %g5
	movrlz	%i3,	%i2,	%g4
	tleu	%xcc,	0x6
	move	%icc,	%l4,	%g6
loop_1908:
	taddcc	%o6,	%i0,	%l2
	edge8	%l0,	%i6,	%i1
	prefetch	[%l7 + 0x0C],	 0x0
	set	0x6A, %o2
	ldstuba	[%l7 + %o2] 0x89,	%o2
	fbg,a	%fcc1,	loop_1909
	bn	loop_1910
	fpadd32s	%f22,	%f3,	%f26
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1909:
	brlz	%o4,	loop_1911
loop_1910:
	tpos	%icc,	0x1
	ba,a	loop_1912
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1911:
	tvs	%icc,	0x4
	fxnor	%f0,	%f6,	%f6
loop_1912:
	movne	%xcc,	%o0,	%g7
	ta	%xcc,	0x0
	movg	%xcc,	%o5,	%o1
	tvs	%icc,	0x6
	umul	%l3,	0x1979,	%i5
	ldsw	[%l7 + 0x48],	%g1
	edge32ln	%l5,	%g2,	%o3
	fmovrsgz	%o7,	%f15,	%f17
	fmovdvs	%xcc,	%f26,	%f18
	fsrc1s	%f26,	%f6
	ldsh	[%l7 + 0x74],	%i4
	edge32ln	%g3,	%i7,	%l1
	mova	%xcc,	%g5,	%i3
	tvs	%xcc,	0x0
	sdivx	%i2,	0x09B8,	%l6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subcc	%g4,	0x06A4,	%g6
	movrlz	%l4,	0x1E3,	%i0
	wr	%g0,	0x10,	%asi
	ldxa	[%l7 + 0x18] %asi,	%o6
	andn	%l2,	%l0,	%i6
	edge16n	%o2,	%o4,	%i1
	fmuld8sux16	%f25,	%f21,	%f6
	fexpand	%f4,	%f6
	array16	%g7,	%o5,	%o0
	bn,a,pt	%xcc,	loop_1913
	taddcc	%o1,	%l3,	%i5
	wr	%g0,	0x0c,	%asi
	lda	[%l7 + 0x48] %asi,	%f23
loop_1913:
	ldsw	[%l7 + 0x58],	%g1
	bshuffle	%f16,	%f12,	%f10
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sethi	0x1250,	%l5
	fzero	%f12
	array32	%o3,	%g2,	%i4
	movne	%icc,	%g3,	%o7
	lduw	[%l7 + 0x78],	%l1
	edge32l	%g5,	%i7,	%i2
	movvc	%icc,	%l6,	%g4
	fones	%f0
	fornot1	%f28,	%f22,	%f16
	srlx	%i3,	%l4,	%i0
	fandnot2	%f12,	%f26,	%f30
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32n	%g6,	%l2,	%o6
	fmul8x16au	%f10,	%f6,	%f24
	fmovda	%xcc,	%f30,	%f11
	fbug	%fcc0,	loop_1914
	fbu	%fcc0,	loop_1915
	movn	%xcc,	%l0,	%i6
	fnor	%f30,	%f4,	%f16
loop_1914:
	tg	%icc,	0x6
loop_1915:
	addc	%o2,	%i1,	%o4
	sdivx	%o5,	0x0B87,	%g7
	addcc	%o1,	0x0316,	%l3
	lduw	[%l7 + 0x7C],	%o0
	andncc	%i5,	%g1,	%o3
	edge16ln	%l5,	%g2,	%g3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	smulcc	%o7,	%i4,	%g5
	add	%l7,	0x58,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%l1
	casa	[%l6] %asi,	%l1,	%i2
	wr	%g0,	0x0c,	%asi
	prefetcha	[%l7 + 0x28] %asi,	 0x1
	set	0x1F, %g2
	ldstuba	[%l7 + %g2] 0x04,	%g4
	edge32l	%i3,	%l4,	%i7
	edge16l	%i0,	%g6,	%l2
	fmul8x16	%f7,	%f16,	%f14
	popc	%o6,	%l0
	srax	%i6,	%i1,	%o2
	fmovsneg	%xcc,	%f29,	%f15
	brgez	%o4,	loop_1916
	fpsub16	%f24,	%f30,	%f6
	movle	%xcc,	%g7,	%o5
	or	%o1,	0x1D1E,	%o0
loop_1916:
	addcc	%l3,	0x1EF1,	%g1
	fmovd	%f12,	%f28
	alignaddrl	%o3,	%i5,	%g2
	fones	%f4
	tl	%xcc,	0x2
	fcmpgt32	%f4,	%f0,	%g3
	fmovdg	%icc,	%f21,	%f0
	tn	%icc,	0x5
	movrlez	%l5,	%i4,	%o7
	tpos	%xcc,	0x1
	orcc	%g5,	0x12AA,	%l1
	ba,a,pn	%xcc,	loop_1917
	fmovrsgz	%l6,	%f20,	%f15
	ld	[%l7 + 0x5C],	%f26
	edge16	%i2,	%g4,	%i3
loop_1917:
	fbue	%fcc0,	loop_1918
	sdivx	%i7,	0x03D4,	%i0
	add	%l4,	%l2,	%o6
	fpack16	%f2,	%f11
loop_1918:
	fnegd	%f14,	%f2
	movrgez	%g6,	0x22C,	%l0
	movrlz	%i1,	%o2,	%o4
	tsubcctv	%i6,	%g7,	%o5
	xnor	%o1,	0x0B3E,	%o0
	fmul8ulx16	%f4,	%f10,	%f12
	tne	%icc,	0x6
	subccc	%l3,	%o3,	%i5
	xnor	%g2,	0x0205,	%g3
	edge32	%l5,	%i4,	%g1
	array32	%g5,	%o7,	%l1
	fble,a	%fcc1,	loop_1919
	fbo	%fcc3,	loop_1920
	array16	%i2,	%g4,	%i3
	nop
	setx	loop_1921,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_1919:
	fble	%fcc2,	loop_1922
loop_1920:
	fands	%f19,	%f20,	%f14
	sdiv	%l6,	0x0129,	%i0
loop_1921:
	fmovrslez	%i7,	%f27,	%f14
loop_1922:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movle	%icc,	%l2,	%l4
	movge	%xcc,	%o6,	%l0
	set	0x5E, %o6
	lduba	[%l7 + %o6] 0x14,	%i1
	fmovdcc	%xcc,	%f5,	%f30
	edge16ln	%g6,	%o4,	%o2
	wr	%g0,	0x80,	%asi
	swapa	[%l7 + 0x14] %asi,	%g7
	fmovde	%icc,	%f2,	%f5
	ta	%xcc,	0x6
	movpos	%xcc,	%i6,	%o1
	stb	%o5,	[%l7 + 0x18]
	move	%icc,	%o0,	%o3
	srl	%i5,	0x08,	%g2
	pdist	%f8,	%f4,	%f8
	fpadd32s	%f6,	%f31,	%f10
	fones	%f30
	movneg	%xcc,	%g3,	%l5
	fbule,a	%fcc0,	loop_1923
	ldsw	[%l7 + 0x24],	%i4
	bpos	%xcc,	loop_1924
	fmovrdlez	%l3,	%f30,	%f14
loop_1923:
	orcc	%g5,	%o7,	%l1
	brlez,a	%g1,	loop_1925
loop_1924:
	fcmple16	%f16,	%f14,	%i2
	fnors	%f6,	%f30,	%f21
	membar	0x46
loop_1925:
	edge8	%g4,	%l6,	%i3
	xorcc	%i7,	0x1963,	%i0
	andcc	%l4,	0x0F64,	%o6
	alignaddr	%l2,	%l0,	%i1
	te	%xcc,	0x0
	fnegd	%f4,	%f26
	udivcc	%g6,	0x1895,	%o2
	ldsh	[%l7 + 0x3E],	%g7
	fornot2	%f24,	%f28,	%f10
	movrgz	%o4,	%i6,	%o5
	fnegs	%f4,	%f30
	srlx	%o1,	0x03,	%o0
	movrlz	%o3,	%i5,	%g2
	popc	0x031F,	%l5
	movle	%xcc,	%g3,	%i4
	fcmps	%fcc2,	%f15,	%f23
	movcs	%icc,	%g5,	%o7
	fnot2	%f28,	%f28
	smul	%l1,	%g1,	%l3
	sllx	%g4,	0x1F,	%i2
	movpos	%xcc,	%l6,	%i7
	fpsub32s	%f9,	%f8,	%f31
	addcc	%i0,	0x05F2,	%i3
	fmovdpos	%icc,	%f6,	%f0
	fbule	%fcc3,	loop_1926
	fsrc2	%f4,	%f14
	edge32l	%o6,	%l4,	%l0
	tg	%xcc,	0x5
loop_1926:
	movn	%xcc,	%i1,	%l2
	udivx	%o2,	0x1915,	%g6
	wr	%g0,	0x2f,	%asi
	stxa	%g7,	[%l7 + 0x70] %asi
	membar	#Sync
	umul	%o4,	%o5,	%i6
	fmovrdne	%o0,	%f18,	%f26
	andncc	%o1,	%i5,	%o3
	edge16n	%l5,	%g2,	%g3
	alignaddr	%g5,	%o7,	%l1
	srlx	%g1,	%i4,	%g4
	smul	%i2,	0x0DD3,	%l6
	fmovrdlz	%l3,	%f12,	%f18
	add	%i7,	%i0,	%i3
	fpadd16	%f28,	%f16,	%f0
	nop
	setx	loop_1927,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	or	%l4,	0x0E24,	%o6
	sra	%i1,	0x10,	%l0
	andn	%l2,	0x069C,	%g6
loop_1927:
	edge8	%g7,	%o4,	%o2
	fmovse	%xcc,	%f22,	%f7
	sdiv	%i6,	0x17A0,	%o0
	brlez	%o5,	loop_1928
	tsubcctv	%i5,	0x0792,	%o3
	set	0x10, %g4
	stda	%o0,	[%l7 + %g4] 0x89
loop_1928:
	nop
	setx	loop_1929,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fornot1s	%f29,	%f16,	%f7
	xnorcc	%g2,	0x189D,	%g3
	movneg	%icc,	%l5,	%g5
loop_1929:
	nop
	set	0x40, %i3
	ldda	[%l7 + %i3] 0x04,	%f0
	movne	%xcc,	%l1,	%g1
	alignaddrl	%o7,	%g4,	%i2
	subcc	%i4,	%l6,	%l3
	fmul8ulx16	%f6,	%f24,	%f26
	fmovdl	%icc,	%f12,	%f16
	st	%f28,	[%l7 + 0x18]
	fmovrsgz	%i7,	%f26,	%f26
	tvs	%xcc,	0x4
	sll	%i0,	%i3,	%o6
	movneg	%icc,	%i1,	%l4
	movg	%xcc,	%l2,	%l0
	movneg	%xcc,	%g7,	%g6
	fpsub32	%f6,	%f20,	%f22
	bn	%icc,	loop_1930
	sll	%o4,	%i6,	%o2
	xorcc	%o0,	%i5,	%o5
	ta	%icc,	0x0
loop_1930:
	st	%f8,	[%l7 + 0x48]
	fcmpgt32	%f30,	%f22,	%o1
	set	0x08, %i4
	stda	%o2,	[%l7 + %i4] 0xe2
	membar	#Sync
	flush	%l7 + 0x70
	add	%l7,	0x28,	%l6
	wr	%g0,	0x18,	%asi
	ldxa	[%l6] %asi,	%g3
	casxa	[%l6] 0x18,	%g3,	%g2
	sllx	%l5,	%g5,	%l1
	ldstub	[%l7 + 0x25],	%o7
	movpos	%icc,	%g4,	%i2
	fmovdg	%icc,	%f22,	%f24
	orcc	%i4,	0x09DC,	%g1
	srl	%l6,	0x1A,	%i7
	tvc	%icc,	0x0
	fbo	%fcc3,	loop_1931
	fbn	%fcc3,	loop_1932
	fcmpgt32	%f26,	%f4,	%i0
	movrlez	%l3,	%o6,	%i3
loop_1931:
	tsubcctv	%i1,	%l4,	%l2
loop_1932:
	udivcc	%g7,	0x09EE,	%l0
	fmovdn	%icc,	%f5,	%f4
	tvc	%xcc,	0x6
	sdiv	%g6,	0x156A,	%o4
	udivx	%o2,	0x176A,	%i6
	fandnot1s	%f7,	%f22,	%f15
	fmovsa	%icc,	%f15,	%f10
	tle	%icc,	0x2
	brlez,a	%o0,	loop_1933
	movpos	%xcc,	%i5,	%o5
	brgz,a	%o1,	loop_1934
	fcmpgt16	%f26,	%f26,	%g3
loop_1933:
	fmovdg	%xcc,	%f28,	%f8
	sub	%o3,	0x19E6,	%l5
loop_1934:
	srlx	%g2,	%l1,	%g5
	taddcc	%g4,	0x0CC7,	%i2
	fnors	%f28,	%f4,	%f16
	bl,pt	%icc,	loop_1935
	lduh	[%l7 + 0x38],	%i4
	udivcc	%o7,	0x114C,	%g1
	fone	%f14
loop_1935:
	move	%xcc,	%l6,	%i7
	bpos,pn	%icc,	loop_1936
	edge8l	%l3,	%o6,	%i0
	srax	%i3,	%l4,	%l2
	movcs	%xcc,	%i1,	%g7
loop_1936:
	tpos	%xcc,	0x6
	movl	%icc,	%g6,	%l0
	fmovsvc	%xcc,	%f19,	%f3
	edge32	%o4,	%o2,	%o0
	fbul,a	%fcc0,	loop_1937
	nop
	setx	loop_1938,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tsubcctv	%i5,	0x10CF,	%o5
	movle	%icc,	%i6,	%g3
loop_1937:
	edge32l	%o3,	%l5,	%g2
loop_1938:
	fpack16	%f10,	%f26
	stw	%l1,	[%l7 + 0x54]
	add	%l7,	0x44,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%o1
	casa	[%l6] 0x81,	%o1,	%g4
	sth	%g5,	[%l7 + 0x58]
	bgu,a,pn	%icc,	loop_1939
	sllx	%i4,	%i2,	%g1
	edge16ln	%o7,	%l6,	%l3
	bcs,pt	%icc,	loop_1940
loop_1939:
	array8	%o6,	%i0,	%i3
	movrlez	%i7,	%l2,	%i1
	add	%l4,	%g7,	%g6
loop_1940:
	fmovscs	%xcc,	%f30,	%f29
	tneg	%icc,	0x4
	umul	%o4,	0x03A0,	%l0
	sdivx	%o2,	0x0330,	%i5
	ld	[%l7 + 0x4C],	%f12
	fpsub16	%f20,	%f4,	%f30
	fornot2	%f16,	%f28,	%f10
	subcc	%o0,	%i6,	%o5
	movn	%icc,	%g3,	%l5
	movrlez	%g2,	0x0EB,	%o3
	add	%o1,	%g4,	%g5
	fcmpes	%fcc2,	%f3,	%f15
	orn	%i4,	0x041A,	%i2
	brlez	%g1,	loop_1941
	addc	%l1,	0x0654,	%l6
	brgz	%o7,	loop_1942
	edge32ln	%l3,	%o6,	%i3
loop_1941:
	sir	0x063B
	sdivx	%i7,	0x11B1,	%i0
loop_1942:
	bleu,a	%icc,	loop_1943
	and	%i1,	0x05CC,	%l2
	orncc	%g7,	0x032D,	%g6
	bl,a	%xcc,	loop_1944
loop_1943:
	fcmpgt32	%f8,	%f14,	%l4
	wr	%g0,	0x10,	%asi
	ldswa	[%l7 + 0x6C] %asi,	%o4
loop_1944:
	nop
	set	0x40, %l2
	stha	%l0,	[%l7 + %l2] 0x11
	tsubcc	%i5,	0x1A33,	%o2
	fnot2s	%f28,	%f7
	mulscc	%o0,	0x014C,	%o5
	tne	%icc,	0x2
	fcmpeq16	%f6,	%f4,	%i6
	wr	%g0,	0xeb,	%asi
	stha	%g3,	[%l7 + 0x60] %asi
	membar	#Sync
	taddcctv	%g2,	%o3,	%l5
	mova	%icc,	%o1,	%g5
	addcc	%i4,	0x0BB9,	%g4
	fcmple16	%f0,	%f26,	%i2
	fmovs	%f12,	%f6
	brlz	%l1,	loop_1945
	xnor	%g1,	0x0D2D,	%o7
	fcmpgt16	%f6,	%f24,	%l6
	fsrc1	%f28,	%f16
loop_1945:
	udivx	%l3,	0x0D93,	%o6
	smulcc	%i3,	0x015A,	%i7
	fmovdcc	%icc,	%f21,	%f14
	umul	%i1,	0x0D19,	%l2
	array16	%i0,	%g6,	%g7
	movrgz	%l4,	%o4,	%l0
	fnot2s	%f18,	%f22
	srl	%o2,	0x08,	%i5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x30, %o5
	ldsha	[%l7 + %o5] 0x15,	%o0
	srl	%i6,	0x1A,	%g3
	fabss	%f28,	%f17
	tsubcctv	%o5,	0x0BC4,	%o3
	tgu	%icc,	0x2
	mova	%xcc,	%g2,	%l5
	array8	%o1,	%g5,	%i4
	edge8l	%i2,	%g4,	%g1
	sir	0x1310
	set	0x2C, %i1
	stwa	%l1,	[%l7 + %i1] 0x23
	membar	#Sync
	sra	%l6,	%o7,	%o6
	orcc	%i3,	%l3,	%i7
	fnors	%f13,	%f29,	%f16
	edge32l	%i1,	%i0,	%g6
	taddcctv	%g7,	0x04B2,	%l2
	fands	%f20,	%f15,	%f5
	bshuffle	%f22,	%f0,	%f30
	edge8ln	%l4,	%l0,	%o4
	srl	%o2,	0x07,	%i5
	or	%i6,	0x13D4,	%g3
	movrlz	%o5,	0x07F,	%o0
	movre	%g2,	%o3,	%l5
	alignaddrl	%o1,	%g5,	%i4
	fmovdvs	%icc,	%f3,	%f4
	fmovrde	%g4,	%f20,	%f30
	ba	loop_1946
	array8	%g1,	%l1,	%i2
	taddcctv	%o7,	%o6,	%i3
	udivx	%l3,	0x1E10,	%i7
loop_1946:
	andncc	%i1,	%l6,	%g6
	alignaddr	%g7,	%i0,	%l2
	tsubcctv	%l0,	%l4,	%o2
	or	%o4,	0x1F6A,	%i6
	tvs	%icc,	0x0
	tneg	%icc,	0x1
	ldsh	[%l7 + 0x1E],	%i5
	add	%l7,	0x58,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%g3,	%o5
	fandnot2	%f8,	%f4,	%f4
	edge8l	%g2,	%o3,	%l5
	mulscc	%o0,	%o1,	%i4
	sir	0x0680
	edge8ln	%g5,	%g4,	%g1
	set	0x5B, %l6
	lduba	[%l7 + %l6] 0x04,	%l1
	mova	%xcc,	%i2,	%o6
	std	%i2,	[%l7 + 0x40]
	edge8l	%o7,	%i7,	%i1
	brz	%l3,	loop_1947
	bvs,a	%xcc,	loop_1948
	fmovrslz	%g6,	%f9,	%f23
	bl,a	loop_1949
loop_1947:
	array8	%l6,	%g7,	%l2
loop_1948:
	alignaddr	%i0,	%l4,	%o2
	edge8n	%l0,	%o4,	%i6
loop_1949:
	bvc,a	%xcc,	loop_1950
	stw	%i5,	[%l7 + 0x0C]
	wr	%g0,	0x04,	%asi
	ldsba	[%l7 + 0x3F] %asi,	%g3
loop_1950:
	popc	%o5,	%o3
	fbu	%fcc1,	loop_1951
	mulx	%g2,	0x19A7,	%l5
	nop
	setx	loop_1952,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	tcs	%icc,	0x7
loop_1951:
	tge	%xcc,	0x5
	fnor	%f12,	%f4,	%f8
loop_1952:
	fmovdpos	%xcc,	%f25,	%f21
	ldstub	[%l7 + 0x1F],	%o0
	sdivx	%o1,	0x07E6,	%g5
	edge16n	%i4,	%g4,	%l1
	bcc	%xcc,	loop_1953
	fornot2s	%f30,	%f3,	%f2
	wr	%g0,	0x20,	%asi
	ldxa	[%g0 + 0x20] %asi,	%i2
loop_1953:
	tsubcctv	%g1,	%i3,	%o6
	te	%xcc,	0x4
	tge	%xcc,	0x6
	taddcctv	%o7,	%i7,	%l3
	fzero	%f8
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsb	[%l7 + 0x54],	%i1
	fandnot1	%f18,	%f26,	%f2
	movrne	%g6,	0x09A,	%l6
	fmovdne	%xcc,	%f11,	%f18
	movne	%xcc,	%l2,	%g7
	fbug,a	%fcc0,	loop_1954
	te	%icc,	0x3
	tle	%icc,	0x2
	ba	%icc,	loop_1955
loop_1954:
	sub	%i0,	0x1E48,	%o2
	srl	%l0,	%o4,	%i6
	or	%l4,	%i5,	%o5
loop_1955:
	bn,a	loop_1956
	fnor	%f10,	%f12,	%f20
	fmovdvs	%icc,	%f10,	%f25
	wr	%g0,	0x88,	%asi
	lduwa	[%l7 + 0x28] %asi,	%o3
loop_1956:
	bl,a	%icc,	loop_1957
	edge16	%g3,	%l5,	%o0
	bneg	loop_1958
	tne	%icc,	0x5
loop_1957:
	movvs	%icc,	%g2,	%o1
	fabsd	%f18,	%f10
loop_1958:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	smul	%g5,	%g4,	%l1
	edge16l	%i4,	%i2,	%g1
	array8	%o6,	%i3,	%o7
	bcs,a	%icc,	loop_1959
	movrgez	%i7,	0x1CC,	%i1
	sll	%l3,	0x00,	%g6
	movre	%l2,	0x13B,	%g7
loop_1959:
	fpsub16	%f20,	%f4,	%f26
	fmovsn	%icc,	%f0,	%f28
	movle	%icc,	%l6,	%o2
	umul	%l0,	%o4,	%i0
	movge	%xcc,	%i6,	%i5
	tneg	%icc,	0x0
	fbg	%fcc3,	loop_1960
	fmul8ulx16	%f22,	%f2,	%f2
	ldsb	[%l7 + 0x68],	%l4
	ldd	[%l7 + 0x28],	%o2
loop_1960:
	sdivx	%g3,	0x0A1A,	%l5
	edge8ln	%o0,	%g2,	%o1
	edge16n	%g5,	%g4,	%l1
	sllx	%o5,	%i4,	%g1
	fmovdn	%xcc,	%f0,	%f9
	srlx	%o6,	%i3,	%o7
	wr	%g0,	0x11,	%asi
	prefetcha	[%l7 + 0x58] %asi,	 0x0
	wr	%g0,	0x19,	%asi
	stha	%i1,	[%l7 + 0x7C] %asi
	fcmps	%fcc0,	%f1,	%f13
	taddcctv	%i7,	%g6,	%l2
	sethi	0x0BA1,	%g7
	mova	%icc,	%l6,	%o2
	fpackfix	%f6,	%f6
	edge8l	%l3,	%l0,	%i0
	fone	%f10
	fmovdcs	%xcc,	%f4,	%f15
	fmovdgu	%icc,	%f25,	%f10
	movrgz	%o4,	0x23C,	%i5
	te	%icc,	0x4
	addc	%l4,	0x0CE3,	%o3
	fbule	%fcc1,	loop_1961
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbn,a	%fcc0,	loop_1962
	swap	[%l7 + 0x40],	%i6
loop_1961:
	fbul,a	%fcc1,	loop_1963
	movleu	%icc,	%l5,	%o0
loop_1962:
	fors	%f18,	%f8,	%f31
	sll	%g2,	0x1E,	%o1
loop_1963:
	nop
	setx	loop_1964,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	prefetch	[%l7 + 0x44],	 0x3
	fbue,a	%fcc1,	loop_1965
	movvc	%xcc,	%g5,	%g3
loop_1964:
	nop
	wr	%g0,	0x0c,	%asi
	stha	%l1,	[%l7 + 0x10] %asi
loop_1965:
	fbne	%fcc3,	loop_1966
	orn	%g4,	0x07A4,	%i4
	movl	%icc,	%g1,	%o6
	array8	%i3,	%o7,	%i2
loop_1966:
	movpos	%icc,	%o5,	%i1
	subccc	%i7,	0x14E5,	%l2
	fmovsl	%xcc,	%f10,	%f0
	set	0x76, %o1
	stba	%g6,	[%l7 + %o1] 0x15
	pdist	%f28,	%f10,	%f4
	addc	%g7,	0x0F29,	%l6
	fmovsge	%xcc,	%f12,	%f14
	brlez,a	%o2,	loop_1967
	subcc	%l3,	%i0,	%l0
	subc	%o4,	0x1E13,	%l4
	array32	%o3,	%i5,	%i6
loop_1967:
	nop
	wr	%g0,	0x89,	%asi
	ldswa	[%l7 + 0x48] %asi,	%o0
	bpos,a,pn	%icc,	loop_1968
	pdist	%f2,	%f6,	%f8
	orncc	%g2,	%l5,	%g5
	array16	%g3,	%l1,	%o1
loop_1968:
	array8	%g4,	%i4,	%g1
	tg	%xcc,	0x0
	edge32n	%i3,	%o7,	%i2
	bgu	%icc,	loop_1969
	bvc,a	loop_1970
	nop
	setx loop_1971, %l0, %l1
	jmpl %l1, %o5
	movcs	%xcc,	%i1,	%o6
loop_1969:
	edge8n	%l2,	%i7,	%g6
loop_1970:
	fmul8sux16	%f26,	%f4,	%f2
loop_1971:
	edge32n	%l6,	%o2,	%l3
	tsubcc	%g7,	%i0,	%o4
	set	0x40, %g3
	stba	%l0,	[%l7 + %g3] 0x19
	fmovdl	%icc,	%f7,	%f8
	movpos	%xcc,	%l4,	%o3
	fcmpgt16	%f18,	%f6,	%i5
	tge	%icc,	0x3
	wr	%g0,	0x11,	%asi
	prefetcha	[%l7 + 0x78] %asi,	 0x2
	bvs,a,pn	%icc,	loop_1972
	edge8ln	%i6,	%g2,	%l5
	edge32ln	%g5,	%g3,	%o1
	taddcctv	%l1,	%i4,	%g1
loop_1972:
	edge32	%g4,	%i3,	%o7
	edge16	%o5,	%i1,	%o6
	ld	[%l7 + 0x3C],	%f15
	movge	%icc,	%i2,	%i7
	movcs	%xcc,	%g6,	%l2
	fmovrsgz	%o2,	%f10,	%f25
	wr	%g0,	0x81,	%asi
	stba	%l6,	[%l7 + 0x54] %asi
	subcc	%g7,	0x0CF5,	%i0
	set	0x30, %i5
	ldda	[%l7 + %i5] 0x18,	%l2
	fbule	%fcc0,	loop_1973
	sra	%o4,	0x02,	%l4
	srlx	%o3,	%l0,	%i5
	orn	%o0,	0x1778,	%g2
loop_1973:
	bl	loop_1974
	sdivcc	%i6,	0x1BC7,	%g5
	wr	%g0,	0x19,	%asi
	prefetcha	[%l7 + 0x70] %asi,	 0x3
loop_1974:
	tcs	%xcc,	0x4
	fmul8x16al	%f16,	%f31,	%f28
	sub	%o1,	0x1BAD,	%l1
	subc	%l5,	0x1957,	%g1
	fbue	%fcc0,	loop_1975
	te	%icc,	0x7
	lduh	[%l7 + 0x5E],	%i4
	fba,a	%fcc0,	loop_1976
loop_1975:
	fnot2s	%f3,	%f3
	bcs,a,pn	%icc,	loop_1977
	tle	%xcc,	0x4
loop_1976:
	ld	[%l7 + 0x38],	%f0
	wr	%g0,	0x18,	%asi
	stda	%g4,	[%l7 + 0x10] %asi
loop_1977:
	edge8	%o7,	%i3,	%i1
	ldx	[%l7 + 0x08],	%o6
	fmovse	%xcc,	%f8,	%f0
	fbue,a	%fcc2,	loop_1978
	ldsh	[%l7 + 0x7E],	%i2
	smul	%o5,	%i7,	%g6
	tleu	%xcc,	0x1
loop_1978:
	umulcc	%l2,	%o2,	%l6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fornot1	%f22,	%f10,	%f30
	fmovse	%icc,	%f10,	%f7
	ldx	[%l7 + 0x50],	%g7
	wr	%g0,	0x80,	%asi
	sta	%f16,	[%l7 + 0x70] %asi
	tvs	%icc,	0x1
	fbg,a	%fcc2,	loop_1979
	smulcc	%l3,	0x0116,	%o4
	fpsub16	%f28,	%f2,	%f6
	tvs	%xcc,	0x7
loop_1979:
	orncc	%i0,	%l4,	%l0
	fmovdvc	%xcc,	%f27,	%f7
	movg	%icc,	%o3,	%i5
	bgu,pt	%xcc,	loop_1980
	bpos	%icc,	loop_1981
	fzeros	%f28
	array8	%g2,	%i6,	%o0
loop_1980:
	movrgez	%g3,	%g5,	%l1
loop_1981:
	srax	%o1,	0x00,	%g1
	edge16	%i4,	%g4,	%o7
	addccc	%l5,	%i1,	%o6
	addc	%i2,	%o5,	%i3
	fsrc1	%f8,	%f16
	andcc	%i7,	0x115B,	%g6
	membar	0x17
	wr	%g0,	0x19,	%asi
	lduha	[%l7 + 0x6C] %asi,	%l2
	subc	%o2,	0x0E8B,	%g7
	set	0x34, %l3
	sta	%f9,	[%l7 + %l3] 0x80
	edge16ln	%l6,	%l3,	%o4
	tneg	%icc,	0x5
	wr	%g0,	0x19,	%asi
	lda	[%l7 + 0x10] %asi,	%f1
	tsubcc	%l4,	%i0,	%o3
	stx	%i5,	[%l7 + 0x38]
	movrgz	%g2,	%l0,	%o0
	fpadd32	%f8,	%f18,	%f20
	fabsd	%f20,	%f6
	tne	%icc,	0x0
	popc	0x1920,	%g3
	wr	%g0,	0x89,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	std	%f28,	[%l7 + 0x78]
	sra	%g5,	0x0B,	%l1
	st	%f18,	[%l7 + 0x38]
	fandnot1	%f10,	%f14,	%f24
	fpsub16	%f26,	%f16,	%f24
	mova	%xcc,	%i6,	%o1
	tsubcctv	%g1,	%g4,	%i4
	fbl	%fcc1,	loop_1982
	edge8ln	%l5,	%i1,	%o6
	taddcctv	%o7,	%i2,	%o5
	tg	%xcc,	0x7
loop_1982:
	sub	%i3,	%i7,	%l2
	tleu	%icc,	0x1
	ble,pn	%xcc,	loop_1983
	fmovde	%xcc,	%f1,	%f7
	set	0x26, %g7
	lduha	[%l7 + %g7] 0x14,	%o2
loop_1983:
	movn	%icc,	%g6,	%l6
	umul	%g7,	0x024A,	%o4
	bcc,pt	%xcc,	loop_1984
	fnegs	%f13,	%f24
	wr	%g0,	0x18,	%asi
	ldswa	[%l7 + 0x24] %asi,	%l4
loop_1984:
	taddcc	%l3,	%i0,	%i5
	popc	%o3,	%l0
	bcc	%xcc,	loop_1985
	edge32n	%g2,	%o0,	%g5
	edge16	%g3,	%l1,	%o1
	orcc	%i6,	0x17C3,	%g1
loop_1985:
	nop
	set	0x08, %g1
	lduha	[%l7 + %g1] 0x0c,	%g4
	nop
	set	0x68, %i0
	ldsw	[%l7 + %i0],	%l5
	fpsub16s	%f17,	%f3,	%f17
	bcs,pt	%xcc,	loop_1986
	tl	%xcc,	0x7
	movleu	%xcc,	%i1,	%i4
	tpos	%xcc,	0x2
loop_1986:
	move	%icc,	%o6,	%i2
	fmovsgu	%xcc,	%f14,	%f20
	edge8ln	%o5,	%i3,	%i7
	tsubcctv	%o7,	0x11A0,	%l2
	ldstub	[%l7 + 0x3C],	%o2
	addc	%g6,	%g7,	%l6
	sth	%l4,	[%l7 + 0x52]
	bneg	loop_1987
	fmovsl	%xcc,	%f0,	%f27
	edge8n	%l3,	%i0,	%o4
	set	0x50, %l4
	stda	%o2,	[%l7 + %l4] 0x80
loop_1987:
	bcc,pt	%icc,	loop_1988
	movre	%i5,	0x3CA,	%l0
	udivx	%o0,	0x0E0F,	%g2
	fmul8x16al	%f5,	%f16,	%f18
loop_1988:
	bcs,a	loop_1989
	fmovdne	%icc,	%f10,	%f8
	tl	%icc,	0x7
	edge16ln	%g5,	%g3,	%l1
loop_1989:
	fone	%f4
	edge16l	%i6,	%g1,	%o1
	fbne	%fcc0,	loop_1990
	fmul8sux16	%f22,	%f22,	%f8
	sdivcc	%l5,	0x131C,	%g4
	mulscc	%i4,	0x14B5,	%o6
loop_1990:
	sethi	0x0533,	%i1
	tne	%xcc,	0x6
	tn	%icc,	0x3
	edge16ln	%i2,	%i3,	%i7
	fsrc2s	%f1,	%f31
	fmul8ulx16	%f14,	%f2,	%f30
	taddcc	%o7,	0x18EC,	%o5
	fnors	%f24,	%f27,	%f14
	wr	%g0,	0x04,	%asi
	stwa	%l2,	[%l7 + 0x58] %asi
	set	0x28, %l5
	lda	[%l7 + %l5] 0x04,	%f17
	edge8	%g6,	%o2,	%l6
	movvc	%xcc,	%l4,	%g7
	tvc	%xcc,	0x5
	tsubcctv	%i0,	%o4,	%l3
	alignaddrl	%i5,	%o3,	%l0
	tne	%xcc,	0x5
	orn	%o0,	%g5,	%g3
	xnor	%l1,	0x0791,	%i6
	mova	%icc,	%g2,	%o1
	ldx	[%l7 + 0x38],	%l5
	sra	%g1,	0x16,	%g4
	orcc	%i4,	0x027E,	%o6
	bl	loop_1991
	fcmps	%fcc1,	%f31,	%f5
	fbg,a	%fcc0,	loop_1992
	add	%i2,	%i1,	%i3
loop_1991:
	ta	%icc,	0x4
	membar	0x0A
loop_1992:
	edge32l	%i7,	%o7,	%l2
	addccc	%g6,	%o2,	%o5
	edge8n	%l4,	%g7,	%i0
	srlx	%l6,	0x03,	%l3
	edge16n	%o4,	%o3,	%l0
	swap	[%l7 + 0x48],	%i5
	movrlz	%o0,	%g3,	%l1
	bvc	%icc,	loop_1993
	sethi	0x1F98,	%i6
	andncc	%g2,	%g5,	%l5
	srax	%g1,	%o1,	%g4
loop_1993:
	move	%icc,	%i4,	%o6
	movg	%icc,	%i2,	%i1
	edge32	%i7,	%i3,	%l2
	fmovdgu	%xcc,	%f16,	%f10
	fpackfix	%f6,	%f13
	edge8n	%o7,	%g6,	%o2
	movg	%icc,	%o5,	%g7
	tn	%icc,	0x1
	set	0x42, %o7
	lduha	[%l7 + %o7] 0x89,	%i0
	umul	%l6,	0x0B92,	%l3
	umul	%l4,	%o3,	%l0
	fpack16	%f10,	%f14
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32	%i5,	%o0,	%o4
	tg	%xcc,	0x3
	te	%xcc,	0x4
	edge32	%l1,	%i6,	%g3
	movrgez	%g5,	%l5,	%g1
	xor	%g2,	%g4,	%o1
	taddcctv	%i4,	0x177F,	%o6
	brgz	%i2,	loop_1994
	edge32n	%i7,	%i1,	%l2
	tn	%icc,	0x6
	fmovdgu	%xcc,	%f23,	%f8
loop_1994:
	nop
	wr	%g0,	0x89,	%asi
	lduba	[%l7 + 0x52] %asi,	%i3
	movrlez	%g6,	0x0C8,	%o2
	fmul8x16au	%f10,	%f17,	%f24
	taddcc	%o5,	%g7,	%o7
	lduh	[%l7 + 0x6A],	%i0
	sir	0x18F5
	tge	%icc,	0x5
	movvc	%icc,	%l6,	%l3
	ta	%icc,	0x6
	edge8ln	%o3,	%l4,	%l0
	movgu	%xcc,	%o0,	%i5
	edge32n	%o4,	%i6,	%l1
	fmovrde	%g3,	%f30,	%f18
	fmovrsgz	%l5,	%f18,	%f18
	fors	%f19,	%f16,	%f22
	stx	%g5,	[%l7 + 0x10]
	sethi	0x0EAA,	%g1
	movneg	%xcc,	%g4,	%g2
	ldsh	[%l7 + 0x54],	%o1
	tg	%icc,	0x3
	fpsub16s	%f21,	%f26,	%f17
	sra	%o6,	%i4,	%i2
	taddcctv	%i1,	0x1905,	%i7
	te	%xcc,	0x4
	fbul	%fcc1,	loop_1995
	brgz,a	%l2,	loop_1996
	brlz	%g6,	loop_1997
	tsubcc	%o2,	0x0030,	%i3
loop_1995:
	or	%g7,	%o7,	%i0
loop_1996:
	nop
	wr	%g0,	0x80,	%asi
	swapa	[%l7 + 0x60] %asi,	%o5
loop_1997:
	fbul	%fcc1,	loop_1998
	tl	%icc,	0x1
	fmovsleu	%xcc,	%f5,	%f0
	bg,a,pn	%xcc,	loop_1999
loop_1998:
	lduw	[%l7 + 0x74],	%l6
	edge8n	%o3,	%l4,	%l0
	subccc	%o0,	0x0736,	%l3
loop_1999:
	ba,a	loop_2000
	udivcc	%o4,	0x0E29,	%i6
	xnorcc	%i5,	%l1,	%l5
	tne	%xcc,	0x0
loop_2000:
	brz	%g3,	loop_2001
	fmovrslz	%g1,	%f14,	%f17
	array8	%g5,	%g4,	%g2
	sethi	0x0D5E,	%o1
loop_2001:
	nop
	wr	%g0,	0x19,	%asi
	lduwa	[%l7 + 0x58] %asi,	%i4
	pdist	%f6,	%f16,	%f28
	movleu	%xcc,	%i2,	%o6
	fornot1s	%f16,	%f8,	%f28
	fnors	%f11,	%f19,	%f8
	bneg	%icc,	loop_2002
	smulcc	%i7,	0x17B0,	%l2
	fmovdg	%xcc,	%f7,	%f12
	array8	%i1,	%o2,	%i3
loop_2002:
	tge	%xcc,	0x6
	xor	%g6,	%o7,	%g7
	tpos	%icc,	0x3
	movvc	%xcc,	%i0,	%l6
	brlz,a	%o5,	loop_2003
	movrgez	%l4,	%l0,	%o0
	edge16	%o3,	%o4,	%i6
	fpackfix	%f8,	%f1
loop_2003:
	tl	%icc,	0x2
	andn	%l3,	%i5,	%l1
	fmovspos	%icc,	%f11,	%f20
	fcmpes	%fcc0,	%f19,	%f5
	fmovrslez	%l5,	%f5,	%f28
	bl,pt	%xcc,	loop_2004
	fmovd	%f2,	%f16
	tsubcctv	%g3,	%g1,	%g4
	stbar
loop_2004:
	ldsw	[%l7 + 0x20],	%g2
	tn	%icc,	0x2
	ldd	[%l7 + 0x60],	%o0
	wr	%g0,	0x52,	%asi
	ldxa	[%g0 + 0x118] %asi,	%i4
	brlz,a	%g5,	loop_2005
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
	for	%f18,	%f12,	%f8
	fbo	%fcc2,	loop_2007
loop_2005:
	fxnors	%f23,	%f21,	%f11
loop_2006:
	movle	%xcc,	%i2,	%i7
	movrlez	%o6,	%i1,	%o2
loop_2007:
	stx	%l2,	[%l7 + 0x58]
	srl	%i3,	%g6,	%o7
	fornot2s	%f7,	%f14,	%f10
	ble	%xcc,	loop_2008
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	flush	%l7 + 0x68
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2008:
	movgu	%icc,	%i0,	%l6
	ldx	[%l7 + 0x48],	%o5
	ta	%icc,	0x7
	brgz	%l4,	loop_2009
	array16	%g7,	%o0,	%l0
	fnot1	%f24,	%f18
	wr	%g0,	0x27,	%asi
	stwa	%o4,	[%l7 + 0x74] %asi
	membar	#Sync
loop_2009:
	fmovdpos	%icc,	%f0,	%f28
	fmovsvs	%icc,	%f14,	%f10
	smulcc	%o3,	%l3,	%i5
	movgu	%icc,	%l1,	%l5
	wr	%g0,	0x11,	%asi
	stda	%i6,	[%l7 + 0x40] %asi
	fmovscc	%xcc,	%f13,	%f2
	nop
	setx loop_2010, %l0, %l1
	jmpl %l1, %g1
	bvc,pn	%xcc,	loop_2011
	fsrc1	%f16,	%f20
	edge16ln	%g4,	%g2,	%o1
loop_2010:
	st	%f31,	[%l7 + 0x24]
loop_2011:
	fbo,a	%fcc2,	loop_2012
	movrne	%i4,	0x10A,	%g5
	tsubcctv	%i2,	%i7,	%g3
	fmul8x16	%f1,	%f0,	%f6
loop_2012:
	edge32ln	%o6,	%o2,	%l2
	bvs,a	loop_2013
	fbug	%fcc3,	loop_2014
	xor	%i3,	%i1,	%o7
	xorcc	%i0,	%g6,	%o5
loop_2013:
	smulcc	%l6,	%g7,	%o0
loop_2014:
	brgez	%l4,	loop_2015
	taddcctv	%o4,	0x0C59,	%l0
	fblg,a	%fcc0,	loop_2016
	tle	%icc,	0x4
loop_2015:
	fornot1	%f18,	%f28,	%f12
	smul	%o3,	%i5,	%l3
loop_2016:
	movl	%icc,	%l5,	%l1
	fblg	%fcc0,	loop_2017
	smul	%i6,	%g1,	%g2
	bpos,a	%xcc,	loop_2018
	sdivcc	%o1,	0x0D3E,	%i4
loop_2017:
	tneg	%xcc,	0x3
	bn,a	loop_2019
loop_2018:
	subccc	%g5,	%g4,	%i7
	ble,a,pt	%xcc,	loop_2020
	tvs	%icc,	0x2
loop_2019:
	andcc	%i2,	%g3,	%o2
	movcs	%xcc,	%o6,	%l2
loop_2020:
	tgu	%xcc,	0x3
	udivx	%i3,	0x0F56,	%o7
	sll	%i0,	%i1,	%o5
	wr	%g0,	0x88,	%asi
	ldstuba	[%l7 + 0x6B] %asi,	%l6
	fbg,a	%fcc1,	loop_2021
	fandnot2	%f6,	%f12,	%f10
	fcmple32	%f10,	%f30,	%g7
	tcc	%xcc,	0x4
loop_2021:
	sethi	0x172E,	%o0
	movvc	%icc,	%g6,	%l4
	srl	%l0,	0x13,	%o3
	fbg	%fcc1,	loop_2022
	mulscc	%i5,	0x1B75,	%l3
	ble,pt	%xcc,	loop_2023
	tn	%icc,	0x1
loop_2022:
	movcs	%xcc,	%l5,	%o4
	fzeros	%f5
loop_2023:
	mova	%icc,	%l1,	%g1
	movrlz	%g2,	%i6,	%o1
	movrgz	%g5,	%i4,	%g4
	edge16n	%i7,	%i2,	%g3
	and	%o6,	%o2,	%i3
	fcmple32	%f16,	%f20,	%l2
	fand	%f30,	%f2,	%f4
	bcs,a	loop_2024
	fpadd16	%f16,	%f20,	%f0
	sra	%i0,	0x14,	%i1
	taddcc	%o7,	0x0D23,	%o5
loop_2024:
	sdiv	%g7,	0x10AC,	%o0
	bl,pt	%xcc,	loop_2025
	mulx	%g6,	0x018E,	%l6
	tg	%icc,	0x3
	set	0x20, %o0
	stda	%l4,	[%l7 + %o0] 0x81
loop_2025:
	sra	%l0,	0x0B,	%o3
	movcs	%icc,	%i5,	%l3
	fbg	%fcc3,	loop_2026
	andn	%o4,	0x058A,	%l5
	fcmpgt32	%f10,	%f2,	%g1
	movre	%g2,	%l1,	%o1
loop_2026:
	umul	%g5,	0x0DCC,	%i4
	subccc	%i6,	%i7,	%i2
	tgu	%xcc,	0x6
	tne	%icc,	0x5
	movvs	%icc,	%g3,	%o6
	andcc	%o2,	%i3,	%g4
	movneg	%xcc,	%i0,	%i1
	tn	%icc,	0x3
	tsubcctv	%l2,	0x10AE,	%o5
	movrgez	%g7,	0x041,	%o7
	edge16ln	%g6,	%o0,	%l4
	edge16	%l6,	%o3,	%i5
	addccc	%l0,	0x196C,	%o4
	bg,pt	%xcc,	loop_2027
	fmovrdne	%l3,	%f30,	%f22
	set	0x6E, %g5
	ldsha	[%l7 + %g5] 0x19,	%l5
loop_2027:
	bg,a	%icc,	loop_2028
	fmovspos	%xcc,	%f13,	%f16
	fnot1	%f30,	%f30
	fcmpne16	%f20,	%f30,	%g1
loop_2028:
	fpadd32s	%f4,	%f2,	%f16
	fmovdgu	%icc,	%f20,	%f22
	tcc	%icc,	0x1
	fmovsleu	%xcc,	%f5,	%f14
	movg	%xcc,	%l1,	%o1
	edge16l	%g2,	%g5,	%i4
	tcc	%icc,	0x7
	fmovdle	%icc,	%f17,	%f11
	bn,a,pt	%icc,	loop_2029
	fxnors	%f10,	%f0,	%f20
	fmovdcs	%icc,	%f1,	%f28
	subcc	%i7,	0x04C0,	%i2
loop_2029:
	fcmpne16	%f4,	%f14,	%g3
	addc	%o6,	%i6,	%i3
	srax	%o2,	0x1C,	%i0
	movrne	%i1,	%g4,	%l2
	fnegs	%f16,	%f13
	fmovsleu	%xcc,	%f22,	%f9
	fmovsa	%icc,	%f20,	%f30
	addccc	%o5,	0x1180,	%o7
	bl	%icc,	loop_2030
	edge32l	%g6,	%o0,	%l4
	flush	%l7 + 0x24
	tg	%icc,	0x2
loop_2030:
	movcc	%icc,	%g7,	%l6
	set	0x5C, %o4
	stwa	%i5,	[%l7 + %o4] 0x89
	tvs	%xcc,	0x7
	set	0x24, %o3
	sta	%f20,	[%l7 + %o3] 0x89
	sdivx	%o3,	0x12AB,	%o4
	mulx	%l0,	%l3,	%g1
	taddcc	%l1,	0x062A,	%o1
	movleu	%icc,	%g2,	%g5
	fbg,a	%fcc2,	loop_2031
	movg	%icc,	%l5,	%i7
	wr	%g0,	0x52,	%asi
	stxa	%i2,	[%g0 + 0x120] %asi
loop_2031:
	call	loop_2032
	tvc	%icc,	0x6
	tvs	%xcc,	0x7
	sra	%g3,	%i4,	%o6
loop_2032:
	movrne	%i3,	%i6,	%o2
	brlz,a	%i1,	loop_2033
	movl	%icc,	%i0,	%g4
	addcc	%l2,	%o7,	%o5
	movrne	%o0,	0x2F2,	%l4
loop_2033:
	subc	%g6,	%g7,	%i5
	bcs,pn	%xcc,	loop_2034
	sub	%l6,	%o4,	%o3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x18,	%asi
	lduha	[%l7 + 0x64] %asi,	%l0
loop_2034:
	movrgz	%g1,	0x29F,	%l3
	fnot2s	%f13,	%f9
	array32	%l1,	%o1,	%g2
	fmovrdlez	%l5,	%f8,	%f10
	edge32l	%g5,	%i7,	%g3
	sdiv	%i2,	0x07A4,	%o6
	fba,a	%fcc3,	loop_2035
	orcc	%i3,	%i6,	%o2
	sir	0x0C1A
	fmovdne	%xcc,	%f23,	%f2
loop_2035:
	srl	%i4,	%i0,	%g4
	bshuffle	%f28,	%f14,	%f14
	movleu	%icc,	%i1,	%l2
	fbe,a	%fcc2,	loop_2036
	ldd	[%l7 + 0x08],	%f8
	fmuld8sux16	%f20,	%f1,	%f20
	add	%o5,	%o7,	%l4
loop_2036:
	movl	%icc,	%g6,	%g7
	set	0x2F, %i2
	stba	%i5,	[%l7 + %i2] 0xeb
	membar	#Sync
	movvc	%xcc,	%o0,	%l6
	fbo	%fcc3,	loop_2037
	movcc	%icc,	%o4,	%o3
	edge8ln	%l0,	%g1,	%l1
	add	%l3,	0x0D4F,	%o1
loop_2037:
	nop
	add	%l7,	0x38,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%g2,	%g5
	subc	%l5,	0x0875,	%i7
	movrne	%i2,	%o6,	%g3
	tle	%icc,	0x0
	sdivx	%i3,	0x035B,	%o2
	fmovdcc	%icc,	%f19,	%f13
	sll	%i6,	0x0E,	%i0
	set	0x48, %l0
	stda	%i4,	[%l7 + %l0] 0xe3
	membar	#Sync
	tvs	%xcc,	0x5
	orcc	%g4,	%i1,	%o5
	fbug,a	%fcc1,	loop_2038
	ta	%icc,	0x7
	tne	%xcc,	0x2
	edge32ln	%l2,	%o7,	%g6
loop_2038:
	edge8	%g7,	%i5,	%l4
	subcc	%o0,	%o4,	%o3
	srax	%l6,	%g1,	%l1
	fmovrsgez	%l3,	%f2,	%f29
	fmovdle	%icc,	%f4,	%f31
	addccc	%l0,	0x0ECF,	%g2
	movrgz	%g5,	%o1,	%l5
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x64] %asi,	%i7
	tg	%xcc,	0x0
	sethi	0x16C3,	%i2
	fbo	%fcc2,	loop_2039
	movrlez	%g3,	0x0E6,	%o6
	bge,pn	%xcc,	loop_2040
	mulscc	%i3,	0x1A4F,	%o2
loop_2039:
	nop
	wr	%g0,	0x0c,	%asi
	swapa	[%l7 + 0x08] %asi,	%i0
loop_2040:
	and	%i6,	%g4,	%i1
	fmovrsgz	%o5,	%f14,	%f12
	fpackfix	%f2,	%f13
	smulcc	%l2,	0x0B9C,	%i4
	tg	%icc,	0x1
	sth	%g6,	[%l7 + 0x4C]
	and	%g7,	%o7,	%l4
	taddcctv	%o0,	%o4,	%i5
	fmovsleu	%icc,	%f17,	%f4
	movrlez	%o3,	0x25C,	%g1
	fnot1	%f20,	%f16
	add	%l7,	0x64,	%l6
	wr	%g0,	0x04,	%asi
	casa	[%l6] %asi,	%l6,	%l1
	edge8l	%l3,	%g2,	%g5
	wr	%g0,	0x81,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	movrne	%l0,	%o1,	%l5
	xor	%i2,	%i7,	%o6
	bcs,a,pn	%icc,	loop_2041
	stx	%i3,	[%l7 + 0x40]
	movneg	%xcc,	%o2,	%i0
	andn	%g3,	0x1250,	%g4
loop_2041:
	addcc	%i1,	0x0A38,	%i6
	fmuld8sux16	%f11,	%f13,	%f14
	fpadd32s	%f3,	%f1,	%f7
	fmovrdlez	%o5,	%f6,	%f14
	edge8	%l2,	%i4,	%g7
	movrne	%o7,	0x1CD,	%l4
	xnor	%g6,	%o4,	%o0
	bvc,a,pt	%icc,	loop_2042
	mulscc	%o3,	0x0F48,	%i5
	tg	%icc,	0x4
	movrgez	%g1,	0x20F,	%l6
loop_2042:
	call	loop_2043
	edge8ln	%l1,	%g2,	%l3
	ldub	[%l7 + 0x20],	%l0
	sub	%o1,	%g5,	%l5
loop_2043:
	membar	0x0E
	ta	%icc,	0x6
	edge32ln	%i7,	%i2,	%o6
	fbuge,a	%fcc0,	loop_2044
	fmovdpos	%xcc,	%f16,	%f31
	fbug	%fcc2,	loop_2045
	edge32	%o2,	%i3,	%i0
loop_2044:
	umulcc	%g3,	%g4,	%i1
	movne	%icc,	%i6,	%o5
loop_2045:
	tneg	%xcc,	0x2
	stbar
	ldstub	[%l7 + 0x61],	%i4
	ldsh	[%l7 + 0x4E],	%l2
	movleu	%icc,	%o7,	%l4
	move	%icc,	%g6,	%g7
	fmovdne	%xcc,	%f23,	%f26
	andcc	%o0,	%o4,	%o3
	lduw	[%l7 + 0x14],	%i5
	fxnors	%f16,	%f20,	%f30
	fmovrdlez	%g1,	%f6,	%f0
	smulcc	%l1,	0x088D,	%g2
	orcc	%l3,	0x0D65,	%l6
	ldsh	[%l7 + 0x42],	%l0
	orncc	%g5,	%l5,	%o1
	sir	0x0724
	prefetch	[%l7 + 0x64],	 0x0
	edge32ln	%i7,	%o6,	%o2
	edge32l	%i3,	%i0,	%i2
	prefetch	[%l7 + 0x50],	 0x2
	call	loop_2046
	nop
	setx loop_2047, %l0, %l1
	jmpl %l1, %g4
	edge16	%i1,	%g3,	%i6
	st	%f16,	[%l7 + 0x5C]
loop_2046:
	for	%f30,	%f12,	%f12
loop_2047:
	edge16l	%o5,	%l2,	%o7
	tsubcctv	%l4,	%i4,	%g7
	fcmpes	%fcc2,	%f12,	%f28
	fcmps	%fcc3,	%f23,	%f19
	udiv	%o0,	0x099A,	%o4
	pdist	%f0,	%f4,	%f10
	edge8l	%g6,	%o3,	%i5
	sethi	0x0E4E,	%l1
	andncc	%g2,	%l3,	%l6
	sra	%l0,	0x00,	%g5
	fmovd	%f18,	%f28
	subc	%l5,	%g1,	%i7
	ldsh	[%l7 + 0x7C],	%o1
	array8	%o2,	%i3,	%i0
	stx	%i2,	[%l7 + 0x78]
	fcmpeq32	%f8,	%f10,	%g4
	movvc	%icc,	%i1,	%g3
	fbne	%fcc1,	loop_2048
	st	%f22,	[%l7 + 0x24]
	tn	%xcc,	0x3
	srax	%i6,	%o5,	%o6
loop_2048:
	movrlez	%l2,	0x37F,	%l4
	umulcc	%o7,	%i4,	%g7
	nop
	setx	loop_2049,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tcc	%icc,	0x5
	fmovrsgez	%o0,	%f6,	%f3
	taddcc	%o4,	0x1916,	%g6
loop_2049:
	nop
	wr	%g0,	0x10,	%asi
	lduba	[%l7 + 0x72] %asi,	%o3
	tge	%icc,	0x4
	be,a	%xcc,	loop_2050
	ldsw	[%l7 + 0x24],	%i5
	ldd	[%l7 + 0x08],	%g2
	sdivcc	%l3,	0x0159,	%l1
loop_2050:
	te	%xcc,	0x3
	fmovdne	%icc,	%f7,	%f11
	tg	%icc,	0x3
	bpos,a,pn	%xcc,	loop_2051
	fmovse	%icc,	%f27,	%f7
	orncc	%l0,	%g5,	%l5
	fsrc2	%f4,	%f4
loop_2051:
	edge8ln	%g1,	%l6,	%i7
	set	0x48, %i7
	stda	%o2,	[%l7 + %i7] 0x19
	edge32l	%i3,	%o1,	%i0
	set	0x6C, %l1
	stwa	%g4,	[%l7 + %l1] 0xeb
	membar	#Sync
	movvc	%xcc,	%i1,	%g3
	fpsub32	%f18,	%f26,	%f6
	sdivx	%i2,	0x08DA,	%o5
	mova	%xcc,	%o6,	%i6
	fmovrse	%l4,	%f14,	%f29
	stw	%o7,	[%l7 + 0x18]
	sdivx	%l2,	0x0111,	%g7
	fmovsle	%xcc,	%f28,	%f7
	fbl	%fcc2,	loop_2052
	fbug	%fcc0,	loop_2053
	fble,a	%fcc3,	loop_2054
	movleu	%xcc,	%o0,	%i4
loop_2052:
	xorcc	%o4,	%g6,	%i5
loop_2053:
	nop
	set	0x40, %g6
	stda	%f0,	[%l7 + %g6] 0xf8
	membar	#Sync
loop_2054:
	nop
	wr	%g0,	0x80,	%asi
	ldswa	[%l7 + 0x5C] %asi,	%o3
	stw	%g2,	[%l7 + 0x50]
	siam	0x3
	movn	%icc,	%l1,	%l0
	array16	%g5,	%l3,	%g1
	srl	%l6,	0x05,	%l5
	udivcc	%i7,	0x060A,	%o2
	fbul	%fcc2,	loop_2055
	fmovdleu	%xcc,	%f3,	%f24
	movcc	%icc,	%i3,	%o1
	movge	%icc,	%i0,	%i1
loop_2055:
	tcc	%icc,	0x1
	bcc,a	%xcc,	loop_2056
	srax	%g3,	%i2,	%g4
	ldd	[%l7 + 0x68],	%o6
	subc	%i6,	%o5,	%l4
loop_2056:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmped	%fcc1,	%f20,	%f8
	wr	%g0,	0x0c,	%asi
	lduba	[%l7 + 0x59] %asi,	%l2
	array32	%g7,	%o0,	%o7
	addccc	%i4,	%g6,	%i5
	std	%f12,	[%l7 + 0x50]
	fxnors	%f4,	%f26,	%f9
	nop
	setx	loop_2057,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	taddcctv	%o4,	%o3,	%l1
	xor	%l0,	%g2,	%g5
	fzeros	%f3
loop_2057:
	sdivx	%l3,	0x0126,	%g1
	brnz	%l6,	loop_2058
	sdivx	%l5,	0x06B7,	%i7
	tne	%icc,	0x1
	bge,a,pn	%xcc,	loop_2059
loop_2058:
	addc	%i3,	%o2,	%o1
	mulx	%i1,	%i0,	%g3
	bshuffle	%f4,	%f0,	%f18
loop_2059:
	taddcctv	%g4,	%o6,	%i2
	popc	%i6,	%o5
	addcc	%l2,	%l4,	%o0
	wr	%g0,	0xea,	%asi
	stxa	%o7,	[%l7 + 0x60] %asi
	membar	#Sync
	umulcc	%i4,	%g6,	%g7
	fbule,a	%fcc3,	loop_2060
	fmovsvs	%xcc,	%f14,	%f16
	fmovsle	%xcc,	%f15,	%f22
	swap	[%l7 + 0x28],	%o4
loop_2060:
	tn	%icc,	0x7
	tcs	%xcc,	0x0
	sethi	0x0C69,	%o3
	sethi	0x1010,	%l1
	orn	%i5,	%l0,	%g5
	edge8n	%g2,	%g1,	%l6
	ta	%xcc,	0x2
	movne	%xcc,	%l5,	%l3
	fmul8x16al	%f5,	%f3,	%f2
	sdivx	%i7,	0x067D,	%i3
	taddcctv	%o1,	0x07AB,	%i1
	orncc	%i0,	0x1E26,	%o2
	movcc	%xcc,	%g4,	%g3
	ldsw	[%l7 + 0x60],	%i2
	fmuld8sux16	%f18,	%f18,	%f0
	fcmpeq32	%f18,	%f2,	%i6
	fmovrdne	%o6,	%f2,	%f0
	tsubcctv	%l2,	%o5,	%l4
	fbuge,a	%fcc3,	loop_2061
	fmovs	%f4,	%f4
	subcc	%o7,	%o0,	%g6
	sub	%g7,	0x1A2C,	%i4
loop_2061:
	st	%f21,	[%l7 + 0x4C]
	wr	%g0,	0x11,	%asi
	prefetcha	[%l7 + 0x38] %asi,	 0x2
	tgu	%xcc,	0x6
	te	%icc,	0x4
	and	%o4,	%i5,	%l1
	smul	%l0,	%g5,	%g2
	edge16ln	%g1,	%l6,	%l3
	udivcc	%i7,	0x1EF3,	%i3
	fpsub16	%f0,	%f12,	%f14
	movn	%xcc,	%l5,	%o1
	udivcc	%i1,	0x0BA0,	%o2
	nop
	setx	loop_2062,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	prefetch	[%l7 + 0x30],	 0x0
	array32	%g4,	%i0,	%i2
	orncc	%g3,	0x18C6,	%i6
loop_2062:
	movrgez	%o6,	%l2,	%o5
	bge,pn	%xcc,	loop_2063
	edge8	%o7,	%o0,	%g6
	fbg,a	%fcc2,	loop_2064
	tvc	%icc,	0x6
loop_2063:
	udivx	%g7,	0x010C,	%l4
	fbne,a	%fcc0,	loop_2065
loop_2064:
	umulcc	%o3,	0x00F5,	%o4
	udiv	%i4,	0x0EFF,	%l1
	subc	%i5,	%g5,	%g2
loop_2065:
	tl	%xcc,	0x4
	wr	%g0,	0x81,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	orcc	%l0,	0x1E4F,	%g1
	bcs	%xcc,	loop_2066
	membar	0x79
	fbul,a	%fcc1,	loop_2067
	tne	%icc,	0x7
loop_2066:
	popc	%l6,	%i7
	fnot1	%f6,	%f18
loop_2067:
	umulcc	%i3,	0x0416,	%l3
	or	%o1,	%i1,	%l5
	or	%g4,	0x1534,	%o2
	ldsb	[%l7 + 0x26],	%i2
	tle	%icc,	0x1
	array16	%g3,	%i6,	%i0
	edge16n	%o6,	%o5,	%o7
	set	0x62, %i6
	lduha	[%l7 + %i6] 0x04,	%l2
	edge32ln	%g6,	%o0,	%g7
	fmovrdgez	%o3,	%f2,	%f2
	udivcc	%o4,	0x04FF,	%i4
	set	0x54, %g2
	swapa	[%l7 + %g2] 0x88,	%l1
	wr	%g0,	0x0c,	%asi
	ldsba	[%l7 + 0x32] %asi,	%l4
	ld	[%l7 + 0x7C],	%f8
	edge16ln	%i5,	%g2,	%l0
	ba	loop_2068
	movrgez	%g5,	0x3E0,	%l6
	mulscc	%g1,	%i3,	%i7
	tsubcc	%l3,	0x0D98,	%o1
loop_2068:
	edge16ln	%i1,	%g4,	%l5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	setx loop_2069, %l0, %l1
	jmpl %l1, %o2
	bcs,a	%icc,	loop_2070
	tvs	%icc,	0x7
	fpsub16	%f20,	%f2,	%f0
loop_2069:
	addc	%g3,	0x1FAE,	%i2
loop_2070:
	tsubcc	%i0,	%o6,	%i6
	bg,pt	%icc,	loop_2071
	xnorcc	%o7,	0x0B85,	%l2
	set	0x50, %o6
	stda	%o4,	[%l7 + %o6] 0x81
loop_2071:
	tvc	%xcc,	0x2
	brz	%o0,	loop_2072
	stb	%g7,	[%l7 + 0x1D]
	taddcc	%g6,	%o4,	%i4
	movne	%xcc,	%l1,	%o3
loop_2072:
	edge16n	%i5,	%g2,	%l0
	edge32n	%g5,	%l4,	%g1
	edge16l	%i3,	%l6,	%i7
	movg	%icc,	%l3,	%o1
	xorcc	%g4,	%l5,	%o2
	movrlz	%g3,	%i1,	%i2
	xor	%o6,	0x1B1B,	%i6
	nop 	! 	nop 	! 	wr	%g0,	0x40,	%asi ripped by fixASI40.pl ripped by fixASI40.pl
	nop 	! 	nop 	! 	ldxa	[%g0 + 0x368] %asi,	%o7 ripped by fixASI40.pl ripped by fixASI40.pl
	srlx	%i0,	0x18,	%o5
	smulcc	%l2,	%g7,	%o0
	fbg	%fcc2,	loop_2073
	call	loop_2074
	sllx	%g6,	%i4,	%o4
	ldub	[%l7 + 0x21],	%l1
loop_2073:
	nop
	set	0x53, %o2
	stba	%o3,	[%l7 + %o2] 0xe3
	membar	#Sync
loop_2074:
	sth	%g2,	[%l7 + 0x20]
	movle	%icc,	%i5,	%g5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbule,a	%fcc0,	loop_2075
	movcs	%xcc,	%l4,	%l0
	smul	%i3,	%g1,	%i7
	wr	%g0,	0x89,	%asi
	lduba	[%l7 + 0x6F] %asi,	%l3
loop_2075:
	edge32l	%l6,	%g4,	%l5
	tle	%icc,	0x7
	xnor	%o1,	%o2,	%i1
	fxor	%f8,	%f24,	%f24
	orcc	%i2,	0x0C89,	%o6
	brz	%i6,	loop_2076
	edge8l	%o7,	%i0,	%o5
	edge32ln	%g3,	%g7,	%l2
	addc	%g6,	%i4,	%o0
loop_2076:
	udivcc	%l1,	0x1C3E,	%o3
	edge32ln	%o4,	%i5,	%g2
	edge32ln	%g5,	%l0,	%l4
	array16	%i3,	%g1,	%l3
	fmovdgu	%xcc,	%f24,	%f31
	bcs	%xcc,	loop_2077
	ldd	[%l7 + 0x50],	%i6
	udivx	%g4,	0x0B4E,	%l5
	sdivcc	%i7,	0x1DC4,	%o1
loop_2077:
	fpack32	%f4,	%f2,	%f0
	taddcctv	%i1,	%i2,	%o2
	ta	%xcc,	0x3
	or	%i6,	%o6,	%o7
	stb	%i0,	[%l7 + 0x37]
	movvc	%icc,	%o5,	%g7
	fmovdvs	%icc,	%f5,	%f20
	te	%icc,	0x4
	set	0x34, %g4
	stha	%g3,	[%l7 + %g4] 0xe3
	membar	#Sync
	subc	%g6,	%i4,	%o0
	ldx	[%l7 + 0x20],	%l1
	edge8l	%l2,	%o4,	%o3
	xnor	%g2,	%i5,	%l0
	stbar
	fblg	%fcc1,	loop_2078
	smulcc	%g5,	0x1116,	%i3
	sra	%l4,	%l3,	%g1
	stb	%g4,	[%l7 + 0x12]
loop_2078:
	nop
	wr	%g0,	0x11,	%asi
	stxa	%l6,	[%l7 + 0x78] %asi
	set	0x30, %i3
	ldda	[%l7 + %i3] 0x04,	%l4
	ldub	[%l7 + 0x7F],	%o1
	wr	%g0,	0x18,	%asi
	sta	%f23,	[%l7 + 0x48] %asi
	fcmpne32	%f20,	%f26,	%i1
	xorcc	%i2,	%o2,	%i7
	xor	%i6,	0x1719,	%o6
	fsrc2	%f4,	%f2
	movle	%icc,	%i0,	%o7
	fmul8x16au	%f28,	%f5,	%f0
	popc	%g7,	%o5
	fandnot2s	%f31,	%f4,	%f23
	ld	[%l7 + 0x3C],	%f2
	srlx	%g6,	0x1E,	%g3
	fmovsle	%xcc,	%f18,	%f6
	alignaddrl	%o0,	%i4,	%l2
	movre	%o4,	0x3A5,	%o3
	movn	%xcc,	%l1,	%g2
	alignaddr	%l0,	%g5,	%i5
	fpack16	%f14,	%f4
	te	%xcc,	0x3
	edge16l	%l4,	%i3,	%g1
	alignaddrl	%l3,	%l6,	%g4
	alignaddrl	%l5,	%i1,	%i2
	te	%icc,	0x3
	bne,a	loop_2079
	bneg,pn	%icc,	loop_2080
	taddcc	%o2,	%o1,	%i6
	sdivx	%o6,	0x0169,	%i0
loop_2079:
	fbule,a	%fcc0,	loop_2081
loop_2080:
	tgu	%xcc,	0x3
	fpadd32	%f6,	%f14,	%f12
	set	0x44, %i4
	stha	%i7,	[%l7 + %i4] 0x11
loop_2081:
	or	%g7,	%o5,	%o7
	fbe	%fcc3,	loop_2082
	fbg,a	%fcc1,	loop_2083
	fnot2	%f26,	%f12
	nop
	setx	loop_2084,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_2082:
	fcmpeq32	%f26,	%f4,	%g3
loop_2083:
	fabss	%f14,	%f14
	ldstub	[%l7 + 0x3C],	%o0
loop_2084:
	siam	0x7
	movvs	%xcc,	%g6,	%i4
	mulx	%o4,	%o3,	%l1
	edge32l	%g2,	%l0,	%g5
	fsrc1	%f2,	%f12
	fmovdcc	%xcc,	%f18,	%f1
	tvs	%xcc,	0x3
	edge8ln	%l2,	%l4,	%i5
	subcc	%i3,	%g1,	%l3
	udivx	%l6,	0x163C,	%g4
	flush	%l7 + 0x2C
	movcs	%xcc,	%i1,	%i2
	tsubcctv	%l5,	%o2,	%i6
	movrgz	%o6,	0x384,	%i0
	fbge	%fcc3,	loop_2085
	movleu	%icc,	%o1,	%g7
	edge32n	%o5,	%i7,	%g3
	fmovrdgez	%o7,	%f14,	%f0
loop_2085:
	movrne	%o0,	%g6,	%i4
	movge	%xcc,	%o4,	%o3
	sethi	0x0592,	%g2
	fxors	%f10,	%f30,	%f3
	movl	%xcc,	%l0,	%l1
	umul	%g5,	%l4,	%i5
	movrlez	%l2,	%g1,	%l3
	nop
	setx	loop_2086,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	array32	%i3,	%l6,	%g4
	fba	%fcc0,	loop_2087
	movl	%icc,	%i2,	%i1
loop_2086:
	movleu	%icc,	%l5,	%i6
	wr	%g0,	0x11,	%asi
	swapa	[%l7 + 0x10] %asi,	%o2
loop_2087:
	tgu	%icc,	0x2
	orcc	%i0,	0x0379,	%o1
	movle	%xcc,	%g7,	%o5
	smulcc	%o6,	%i7,	%g3
	sra	%o0,	0x12,	%g6
	fmovsgu	%icc,	%f4,	%f5
	movrne	%o7,	%i4,	%o4
	movge	%xcc,	%o3,	%g2
	array32	%l0,	%l1,	%g5
	xorcc	%l4,	%i5,	%g1
	set	0x40, %o5
	lda	[%l7 + %o5] 0x80,	%f25
	sethi	0x0454,	%l2
	nop
	setx	loop_2088,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movl	%xcc,	%i3,	%l6
	sethi	0x142A,	%g4
	sth	%i2,	[%l7 + 0x44]
loop_2088:
	fmovsge	%icc,	%f24,	%f2
	set	0x08, %i1
	stda	%i0,	[%l7 + %i1] 0xeb
	membar	#Sync
	fors	%f26,	%f9,	%f19
	fmul8x16au	%f15,	%f15,	%f30
	tsubcc	%l5,	%i6,	%o2
	umul	%i0,	0x05AD,	%l3
	orncc	%g7,	0x0C99,	%o1
	ba	%xcc,	loop_2089
	fcmpne32	%f0,	%f0,	%o6
	fmovde	%xcc,	%f23,	%f3
	fmovde	%xcc,	%f30,	%f6
loop_2089:
	nop
	set	0x62, %l6
	lduha	[%l7 + %l6] 0x14,	%i7
	movgu	%icc,	%g3,	%o5
	bg,a	loop_2090
	nop
	setx	loop_2091,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	nop
	set	0x10, %l2
	std	%g6,	[%l7 + %l2]
	alignaddrl	%o7,	%i4,	%o4
loop_2090:
	tge	%icc,	0x0
loop_2091:
	brgz,a	%o3,	loop_2092
	fcmpeq32	%f8,	%f28,	%o0
	alignaddr	%g2,	%l1,	%g5
	brgz	%l0,	loop_2093
loop_2092:
	fmovdvs	%icc,	%f24,	%f1
	fbule	%fcc0,	loop_2094
	tcc	%xcc,	0x2
loop_2093:
	sllx	%i5,	%l4,	%g1
	fbul	%fcc0,	loop_2095
loop_2094:
	movgu	%icc,	%l2,	%l6
	movvs	%icc,	%g4,	%i3
	edge16n	%i1,	%i2,	%l5
loop_2095:
	fnot2s	%f21,	%f6
	fbo,a	%fcc1,	loop_2096
	fmovdleu	%icc,	%f28,	%f22
	fzeros	%f16
	tle	%xcc,	0x0
loop_2096:
	fcmpd	%fcc3,	%f16,	%f26
	fpadd16	%f20,	%f24,	%f12
	udivx	%o2,	0x126E,	%i6
	fmovsle	%icc,	%f12,	%f16
	fcmpd	%fcc3,	%f0,	%f18
	set	0x18, %o1
	stda	%i0,	[%l7 + %o1] 0xea
	membar	#Sync
	nop
	set	0x20, %i5
	ldd	[%l7 + %i5],	%l2
	fpadd32	%f18,	%f6,	%f26
	fmovrdgz	%o1,	%f28,	%f12
	fmovsneg	%icc,	%f22,	%f26
	fabsd	%f24,	%f30
	addccc	%o6,	0x00D0,	%g7
	fpadd32s	%f18,	%f13,	%f26
	sll	%i7,	%o5,	%g6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subccc	%g3,	0x1CF4,	%o7
	tl	%xcc,	0x5
	edge32l	%o4,	%o3,	%o0
	fmovdne	%xcc,	%f9,	%f28
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	move	%xcc,	%g2,	%l1
	udivcc	%i4,	0x0F46,	%g5
	stw	%l0,	[%l7 + 0x28]
	fabsd	%f10,	%f0
	orncc	%i5,	%l4,	%g1
	set	0x70, %g3
	ldda	[%l7 + %g3] 0x24,	%i6
	tleu	%xcc,	0x0
	set	0x64, %g7
	swapa	[%l7 + %g7] 0x18,	%g4
	fcmpne32	%f0,	%f14,	%i3
	ba,a	%icc,	loop_2097
	tsubcctv	%i1,	0x0F92,	%l2
	or	%i2,	0x11E4,	%l5
	alignaddrl	%o2,	%i0,	%l3
loop_2097:
	fmul8sux16	%f4,	%f6,	%f30
	move	%icc,	%o1,	%i6
	sdivx	%g7,	0x10D8,	%o6
	sth	%o5,	[%l7 + 0x30]
	movle	%xcc,	%i7,	%g3
	edge32	%o7,	%g6,	%o3
	movge	%xcc,	%o4,	%o0
	ba	%xcc,	loop_2098
	movrlz	%g2,	0x288,	%l1
	fmovsleu	%xcc,	%f4,	%f31
	edge16l	%i4,	%g5,	%i5
loop_2098:
	fbg	%fcc3,	loop_2099
	fbug	%fcc2,	loop_2100
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bneg	%icc,	loop_2101
loop_2099:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2100:
	umul	%l0,	0x161C,	%l4
	wr	%g0,	0x10,	%asi
	ldxa	[%l7 + 0x30] %asi,	%g1
loop_2101:
	bl,a	%xcc,	loop_2102
	movre	%g4,	0x0A3,	%l6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fble,a	%fcc1,	loop_2103
loop_2102:
	pdist	%f20,	%f26,	%f26
	add	%l7,	0x54,	%l6
	wr	%g0,	0x10,	%asi
	lda	[%l6] %asi,	%i1
	casa	[%l6] %asi,	%i1,	%i3
loop_2103:
	nop
	wr	%g0,	0x19,	%asi
	prefetcha	[%l7 + 0x68] %asi,	 0x3
	fbe	%fcc0,	loop_2104
	subcc	%l5,	%i2,	%o2
	for	%f24,	%f2,	%f28
	move	%icc,	%i0,	%o1
loop_2104:
	prefetch	[%l7 + 0x18],	 0x2
	edge8ln	%l3,	%i6,	%o6
	tge	%icc,	0x1
	subccc	%o5,	0x1D50,	%i7
	edge8l	%g7,	%g3,	%g6
	fmovse	%xcc,	%f1,	%f12
	orn	%o3,	%o7,	%o0
	mulscc	%o4,	%g2,	%l1
	fandnot1s	%f28,	%f30,	%f13
	orn	%g5,	0x0AA2,	%i5
	set	0x34, %l3
	stha	%l0,	[%l7 + %l3] 0x19
	subcc	%i4,	0x14FB,	%g1
	fmovsle	%xcc,	%f7,	%f28
	lduh	[%l7 + 0x34],	%g4
	array32	%l6,	%l4,	%i3
	ldstub	[%l7 + 0x14],	%l2
	fmovrslez	%l5,	%f27,	%f14
	tne	%xcc,	0x5
	sub	%i2,	0x13C4,	%i1
	orncc	%i0,	0x09C8,	%o1
	fpmerge	%f28,	%f12,	%f28
	umulcc	%o2,	0x1438,	%l3
	fnot1s	%f21,	%f7
	prefetch	[%l7 + 0x2C],	 0x0
	tpos	%xcc,	0x0
	fmovrslz	%i6,	%f12,	%f27
	xor	%o6,	%o5,	%g7
	movl	%xcc,	%g3,	%g6
	fmovsg	%icc,	%f7,	%f27
	fnot1	%f16,	%f24
	movrne	%o3,	0x369,	%o7
	addcc	%o0,	0x1A49,	%i7
	membar	0x3A
	fnegd	%f26,	%f12
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bpos,a,pt	%xcc,	loop_2105
	ldstub	[%l7 + 0x5D],	%o4
	wr	%g0,	0x89,	%asi
	lda	[%l7 + 0x74] %asi,	%f17
loop_2105:
	tle	%xcc,	0x4
	fsrc1	%f8,	%f4
	fbg	%fcc3,	loop_2106
	fcmpne16	%f0,	%f0,	%l1
	tcs	%xcc,	0x3
	be,a	loop_2107
loop_2106:
	tleu	%icc,	0x6
	srlx	%g5,	%i5,	%g2
	smul	%i4,	%l0,	%g4
loop_2107:
	edge16l	%l6,	%g1,	%i3
	fnot2s	%f22,	%f16
	fsrc1	%f12,	%f22
	edge16n	%l2,	%l4,	%l5
	subcc	%i1,	0x0575,	%i0
	fmovspos	%xcc,	%f21,	%f20
	umulcc	%o1,	%o2,	%i2
	ba,a	loop_2108
	movg	%icc,	%l3,	%o6
	array16	%o5,	%g7,	%g3
	movn	%icc,	%g6,	%i6
loop_2108:
	andcc	%o3,	%o7,	%i7
	array16	%o0,	%o4,	%l1
	xorcc	%g5,	0x036C,	%g2
	wr	%g0,	0x89,	%asi
	prefetcha	[%l7 + 0x08] %asi,	 0x3
	edge16	%l0,	%g4,	%l6
	udivx	%g1,	0x1991,	%i3
	pdist	%f0,	%f12,	%f20
	movne	%icc,	%i5,	%l4
	array8	%l5,	%i1,	%i0
	umul	%l2,	%o1,	%o2
	ldsw	[%l7 + 0x3C],	%l3
	tge	%xcc,	0x7
	subcc	%o6,	%o5,	%g7
	movgu	%xcc,	%g3,	%g6
	addccc	%i2,	0x16BF,	%i6
	taddcc	%o3,	0x1F86,	%o7
	tne	%xcc,	0x2
	call	loop_2109
	movge	%xcc,	%o0,	%i7
	wr	%g0,	0x11,	%asi
	prefetcha	[%l7 + 0x18] %asi,	 0x0
loop_2109:
	addc	%g5,	0x091B,	%o4
	nop
	set	0x30, %i0
	sth	%g2,	[%l7 + %i0]
	tgu	%icc,	0x0
	fnot2s	%f1,	%f22
	mulx	%i4,	0x0C5D,	%g4
	fmovdg	%xcc,	%f7,	%f3
	bvs,a	%xcc,	loop_2110
	edge32ln	%l6,	%l0,	%i3
	fbule,a	%fcc0,	loop_2111
	fnands	%f7,	%f0,	%f7
loop_2110:
	tg	%xcc,	0x5
	set	0x38, %l4
	prefetcha	[%l7 + %l4] 0x80,	 0x2
loop_2111:
	fsrc2s	%f7,	%f14
	tcc	%xcc,	0x4
	set	0x20, %g1
	lduwa	[%l7 + %g1] 0x10,	%l4
	smul	%l5,	%i1,	%i0
	tsubcctv	%i5,	0x1E2E,	%l2
	set	0x58, %l5
	ldxa	[%l7 + %l5] 0x15,	%o1
	edge32n	%o2,	%o6,	%l3
	movvs	%xcc,	%g7,	%o5
	fbn	%fcc2,	loop_2112
	movre	%g6,	%g3,	%i2
	smul	%o3,	%i6,	%o7
	smulcc	%i7,	0x0857,	%o0
loop_2112:
	bvc,a,pt	%xcc,	loop_2113
	fbge	%fcc2,	loop_2114
	movvc	%xcc,	%l1,	%o4
	popc	0x11E8,	%g2
loop_2113:
	tgu	%icc,	0x2
loop_2114:
	tl	%icc,	0x7
	movleu	%icc,	%i4,	%g4
	mulscc	%g5,	%l6,	%i3
	fnot2	%f24,	%f26
	mulscc	%g1,	0x08CD,	%l4
	fble	%fcc3,	loop_2115
	fxors	%f27,	%f15,	%f9
	fand	%f26,	%f0,	%f22
	taddcctv	%l0,	0x1273,	%l5
loop_2115:
	edge8l	%i0,	%i1,	%i5
	move	%xcc,	%l2,	%o1
	orcc	%o6,	%l3,	%g7
	std	%o2,	[%l7 + 0x68]
	brnz	%o5,	loop_2116
	nop
	set	0x58, %o0
	ldd	[%l7 + %o0],	%g6
	orncc	%i2,	0x11D6,	%o3
	alignaddr	%g3,	%o7,	%i7
loop_2116:
	subcc	%o0,	0x0FFD,	%l1
	movle	%icc,	%i6,	%g2
	fmovrse	%i4,	%f16,	%f2
	edge32ln	%o4,	%g4,	%l6
	andn	%g5,	%g1,	%l4
	fmovdleu	%xcc,	%f4,	%f9
	tn	%xcc,	0x3
	fmul8sux16	%f28,	%f22,	%f0
	fornot1s	%f31,	%f15,	%f28
	fcmpeq32	%f2,	%f14,	%i3
	set	0x51, %o7
	ldstuba	[%l7 + %o7] 0x88,	%l0
	xnorcc	%l5,	%i1,	%i0
	fmovdgu	%icc,	%f16,	%f27
	ldx	[%l7 + 0x58],	%i5
	taddcc	%o1,	0x1CB1,	%o6
	sdiv	%l2,	0x1C20,	%g7
	brlez,a	%o2,	loop_2117
	movrgz	%o5,	0x101,	%g6
	fmovdl	%xcc,	%f25,	%f2
	movrgez	%i2,	%l3,	%o3
loop_2117:
	fpack32	%f12,	%f26,	%f18
	fmovscs	%icc,	%f5,	%f0
	std	%g2,	[%l7 + 0x10]
	subc	%o7,	%i7,	%o0
	fpadd16s	%f11,	%f27,	%f6
	edge32l	%i6,	%l1,	%g2
	movl	%icc,	%o4,	%i4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x64, %o4
	swapa	[%l7 + %o4] 0x0c,	%g4
	movgu	%xcc,	%l6,	%g1
	sll	%g5,	%l4,	%i3
	movrgez	%l5,	0x361,	%i1
	set	0x46, %g5
	ldsha	[%l7 + %g5] 0x88,	%l0
	xnorcc	%i0,	%i5,	%o1
	ldsb	[%l7 + 0x51],	%o6
	fmovrdgez	%g7,	%f14,	%f30
	movneg	%xcc,	%l2,	%o2
	ldx	[%l7 + 0x48],	%g6
	faligndata	%f20,	%f26,	%f0
	movrgez	%o5,	0x29B,	%i2
	bvc,a	%icc,	loop_2118
	lduw	[%l7 + 0x14],	%l3
	bl,a,pn	%xcc,	loop_2119
	popc	%g3,	%o3
loop_2118:
	fbg	%fcc1,	loop_2120
	fcmpeq16	%f24,	%f4,	%o7
loop_2119:
	nop
	set	0x40, %i2
	prefetcha	[%l7 + %i2] 0x18,	 0x1
loop_2120:
	fcmpgt16	%f12,	%f24,	%i6
	wr	%g0,	0x0c,	%asi
	ldstuba	[%l7 + 0x20] %asi,	%l1
	tcc	%icc,	0x0
	set	0x28, %o3
	lda	[%l7 + %o3] 0x04,	%f16
	fornot1s	%f16,	%f6,	%f26
	add	%l7,	0x28,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] %asi,	%g2,	%o4
	bvs,a,pt	%xcc,	loop_2121
	movl	%icc,	%i7,	%i4
	movg	%xcc,	%l6,	%g4
	fbule	%fcc0,	loop_2122
loop_2121:
	movl	%icc,	%g1,	%g5
	array32	%l4,	%l5,	%i3
	fcmpes	%fcc1,	%f28,	%f14
loop_2122:
	movre	%l0,	0x241,	%i0
	fcmps	%fcc3,	%f11,	%f20
	tle	%icc,	0x0
	set	0x68, %l0
	stwa	%i1,	[%l7 + %l0] 0x2b
	membar	#Sync
	move	%xcc,	%i5,	%o6
	fmuld8ulx16	%f4,	%f23,	%f6
	xorcc	%g7,	%o1,	%l2
	ld	[%l7 + 0x34],	%f5
	edge32ln	%g6,	%o2,	%o5
	std	%f24,	[%l7 + 0x28]
	nop
	setx loop_2123, %l0, %l1
	jmpl %l1, %l3
	ba	loop_2124
	edge32	%g3,	%i2,	%o3
	tne	%icc,	0x2
loop_2123:
	udiv	%o0,	0x09D7,	%i6
loop_2124:
	fbl,a	%fcc3,	loop_2125
	ba,a	%icc,	loop_2126
	fmovrse	%l1,	%f21,	%f22
	call	loop_2127
loop_2125:
	tneg	%xcc,	0x4
loop_2126:
	srax	%o7,	%o4,	%i7
	mova	%xcc,	%g2,	%i4
loop_2127:
	fornot1s	%f23,	%f22,	%f11
	xnor	%g4,	0x1838,	%l6
	tcc	%xcc,	0x6
	fmovsl	%icc,	%f15,	%f12
	andn	%g5,	%g1,	%l5
	tgu	%icc,	0x3
	edge8	%i3,	%l0,	%i0
	fmovsle	%xcc,	%f20,	%f1
	andcc	%i1,	%l4,	%i5
	xnor	%g7,	%o1,	%o6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmpgt16	%f10,	%f28,	%l2
	wr	%g0,	0x19,	%asi
	ldswa	[%l7 + 0x2C] %asi,	%g6
	te	%xcc,	0x6
	srlx	%o5,	0x1E,	%o2
	ta	%xcc,	0x2
	sra	%g3,	0x0D,	%i2
	sir	0x054D
	mulscc	%o3,	0x0783,	%l3
	set	0x28, %i7
	stda	%o0,	[%l7 + %i7] 0x89
	movpos	%icc,	%l1,	%i6
	brgz,a	%o4,	loop_2128
	fones	%f29
	fbue,a	%fcc1,	loop_2129
	bvc,a	%icc,	loop_2130
loop_2128:
	array8	%o7,	%i7,	%i4
	edge16ln	%g4,	%l6,	%g5
loop_2129:
	ldsw	[%l7 + 0x74],	%g1
loop_2130:
	tle	%xcc,	0x0
	fpmerge	%f11,	%f6,	%f30
	popc	0x165E,	%g2
	add	%l7,	0x18,	%l6
	wr	%g0,	0x18,	%asi
	casxa	[%l6] %asi,	%l5,	%l0
	subccc	%i3,	0x1E32,	%i1
	movg	%icc,	%i0,	%i5
	tpos	%icc,	0x0
	movrgez	%l4,	0x249,	%g7
	sllx	%o6,	%l2,	%o1
	edge32n	%g6,	%o2,	%g3
	ba	%icc,	loop_2131
	fcmple16	%f0,	%f6,	%i2
	fmovrsgez	%o3,	%f5,	%f23
	fbe,a	%fcc2,	loop_2132
loop_2131:
	array8	%o5,	%l3,	%l1
	fpack32	%f26,	%f26,	%f8
	andcc	%o0,	0x0B1A,	%i6
loop_2132:
	mulscc	%o4,	0x16E0,	%o7
	fmovrse	%i7,	%f28,	%f8
	addc	%g4,	0x062D,	%l6
	fcmpd	%fcc2,	%f0,	%f18
	movge	%xcc,	%g5,	%i4
	tleu	%icc,	0x0
	fpsub16	%f0,	%f0,	%f0
	fmovrdlez	%g1,	%f6,	%f16
	bvs,a	loop_2133
	array32	%g2,	%l5,	%i3
	brgz	%l0,	loop_2134
	te	%icc,	0x3
loop_2133:
	tvc	%icc,	0x2
	addc	%i0,	0x1ACC,	%i5
loop_2134:
	fmovsvs	%xcc,	%f9,	%f5
	udivcc	%i1,	0x1711,	%g7
	fnands	%f20,	%f12,	%f17
	be,pt	%xcc,	loop_2135
	udiv	%o6,	0x103C,	%l2
	movge	%xcc,	%o1,	%l4
	fmuld8sux16	%f11,	%f4,	%f18
loop_2135:
	fmovd	%f24,	%f16
	smul	%o2,	%g3,	%g6
	fmovdl	%icc,	%f11,	%f5
	fmovrdne	%o3,	%f24,	%f12
	fxnor	%f8,	%f8,	%f24
	fbne	%fcc3,	loop_2136
	edge8n	%i2,	%l3,	%o5
	movrlz	%o0,	0x0D3,	%l1
	brz,a	%o4,	loop_2137
loop_2136:
	array32	%o7,	%i7,	%i6
	fmuld8sux16	%f10,	%f3,	%f28
	fpadd16	%f22,	%f14,	%f30
loop_2137:
	fmovrde	%g4,	%f2,	%f10
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnegs	%f2,	%f31
	bvc,a	loop_2138
	nop
	set	0x68, %g6
	ldsb	[%l7 + %g6],	%l6
	set	0x40, %i6
	swapa	[%l7 + %i6] 0x11,	%g5
loop_2138:
	edge8l	%i4,	%g1,	%l5
	set	0x38, %g2
	lduwa	[%l7 + %g2] 0x10,	%i3
	stw	%g2,	[%l7 + 0x20]
	fmovrde	%l0,	%f28,	%f24
	fble,a	%fcc3,	loop_2139
	fnor	%f0,	%f22,	%f20
	sdivcc	%i0,	0x1912,	%i1
	fnegd	%f12,	%f24
loop_2139:
	swap	[%l7 + 0x6C],	%i5
	fzero	%f4
	srax	%o6,	%g7,	%l2
	edge32ln	%l4,	%o2,	%o1
	fpack16	%f6,	%f5
	nop
	setx loop_2140, %l0, %l1
	jmpl %l1, %g6
	swap	[%l7 + 0x4C],	%o3
	fmovrslz	%g3,	%f2,	%f11
	edge8	%i2,	%o5,	%o0
loop_2140:
	fnands	%f11,	%f1,	%f18
	fones	%f13
	brlz	%l3,	loop_2141
	tvs	%xcc,	0x1
	edge32	%o4,	%l1,	%o7
	fbuge	%fcc2,	loop_2142
loop_2141:
	smulcc	%i6,	0x0C14,	%g4
	umul	%l6,	%g5,	%i7
	wr	%g0,	0x04,	%asi
	ldsba	[%l7 + 0x52] %asi,	%i4
loop_2142:
	movne	%icc,	%g1,	%l5
	fbg,a	%fcc2,	loop_2143
	tn	%icc,	0x7
	brlez,a	%g2,	loop_2144
	fandnot2s	%f5,	%f14,	%f24
loop_2143:
	tcs	%icc,	0x5
	fmovsg	%xcc,	%f3,	%f20
loop_2144:
	tsubcc	%i3,	0x0C81,	%l0
	edge8n	%i1,	%i5,	%i0
	ldd	[%l7 + 0x60],	%g6
	fbe,a	%fcc2,	loop_2145
	tg	%icc,	0x1
	set	0x68, %l1
	prefetcha	[%l7 + %l1] 0x04,	 0x0
loop_2145:
	tge	%xcc,	0x5
	ta	%xcc,	0x1
	bge,a,pn	%xcc,	loop_2146
	fmovdg	%xcc,	%f7,	%f31
	sdiv	%l4,	0x1361,	%o2
	mova	%xcc,	%o1,	%o6
loop_2146:
	bg,a	%xcc,	loop_2147
	mulscc	%o3,	%g3,	%i2
	fornot1s	%f9,	%f3,	%f12
	fmul8x16au	%f16,	%f25,	%f20
loop_2147:
	array32	%g6,	%o0,	%o5
	sub	%l3,	%o4,	%o7
	fmovdvs	%icc,	%f1,	%f2
	mulscc	%l1,	%g4,	%l6
	bcs	loop_2148
	mulx	%i6,	%g5,	%i7
	array16	%g1,	%i4,	%l5
	addc	%i3,	%g2,	%i1
loop_2148:
	fmovdleu	%xcc,	%f5,	%f17
	ta	%xcc,	0x2
	tgu	%xcc,	0x7
	tvc	%xcc,	0x3
	fcmps	%fcc1,	%f24,	%f25
	ble,a,pt	%icc,	loop_2149
	fmovdn	%xcc,	%f23,	%f11
	andncc	%i5,	%i0,	%g7
	taddcctv	%l2,	%l0,	%o2
loop_2149:
	fmovdvs	%icc,	%f17,	%f19
	movge	%icc,	%l4,	%o6
	bne	%xcc,	loop_2150
	sra	%o1,	%g3,	%o3
	edge16n	%i2,	%o0,	%g6
	fmovde	%xcc,	%f25,	%f4
loop_2150:
	tvs	%icc,	0x3
	fmovdvs	%xcc,	%f17,	%f25
	tle	%xcc,	0x2
	edge8l	%l3,	%o4,	%o5
	wr	%g0,	0x89,	%asi
	lduwa	[%l7 + 0x34] %asi,	%o7
	tne	%icc,	0x7
	tg	%xcc,	0x5
	addccc	%g4,	%l6,	%i6
	sll	%g5,	0x16,	%i7
	te	%xcc,	0x4
	and	%l1,	%g1,	%i4
	edge16l	%l5,	%i3,	%i1
	xor	%g2,	%i5,	%i0
	movneg	%icc,	%g7,	%l0
	xor	%o2,	0x026F,	%l4
	sdivx	%o6,	0x10B1,	%o1
	edge32	%g3,	%l2,	%o3
	sdivcc	%i2,	0x1DA0,	%g6
	tpos	%xcc,	0x7
	ta	%icc,	0x2
	fsrc2s	%f21,	%f9
	fcmped	%fcc1,	%f10,	%f4
	sra	%o0,	%o4,	%o5
	array32	%l3,	%g4,	%l6
	fmovrdlz	%i6,	%f4,	%f26
	udivcc	%g5,	0x031C,	%i7
	tcs	%icc,	0x5
	fcmpgt32	%f20,	%f12,	%o7
	ldsw	[%l7 + 0x38],	%l1
	nop
	set	0x6A, %o2
	sth	%i4,	[%l7 + %o2]
	movg	%icc,	%l5,	%g1
	mova	%icc,	%i1,	%i3
	umulcc	%g2,	%i5,	%i0
	tvc	%xcc,	0x4
	srax	%g7,	0x07,	%l0
	bneg,a,pn	%xcc,	loop_2151
	movg	%icc,	%o2,	%o6
	tl	%icc,	0x4
	orcc	%o1,	%g3,	%l4
loop_2151:
	andncc	%l2,	%i2,	%g6
	movn	%icc,	%o3,	%o0
	siam	0x2
	fmovsgu	%icc,	%f13,	%f30
	tneg	%xcc,	0x5
	movle	%xcc,	%o4,	%l3
	movrlez	%g4,	%l6,	%o5
	xor	%i6,	0x1B83,	%g5
	udivcc	%o7,	0x1A36,	%i7
	movge	%icc,	%i4,	%l5
	fmovsle	%xcc,	%f14,	%f15
	fmovdneg	%xcc,	%f15,	%f3
	array16	%g1,	%i1,	%i3
	bg,a	%xcc,	loop_2152
	fbu,a	%fcc3,	loop_2153
	movle	%icc,	%g2,	%l1
	addccc	%i5,	%i0,	%g7
loop_2152:
	fpsub16	%f30,	%f10,	%f30
loop_2153:
	be,a	%xcc,	loop_2154
	sdiv	%l0,	0x1C24,	%o6
	movvs	%xcc,	%o2,	%g3
	movn	%icc,	%o1,	%l4
loop_2154:
	fmovrse	%i2,	%f19,	%f15
	andcc	%l2,	0x0EF9,	%o3
	movpos	%icc,	%g6,	%o0
	fandnot1s	%f19,	%f28,	%f31
	edge32	%o4,	%g4,	%l3
	sdivx	%l6,	0x171F,	%o5
	movre	%i6,	%g5,	%o7
	sir	0x0CCF
	edge8ln	%i4,	%l5,	%i7
	array32	%i1,	%g1,	%i3
	subccc	%l1,	%i5,	%g2
	fmovdl	%icc,	%f21,	%f0
	fmovrdgz	%i0,	%f30,	%f0
	set	0x74, %o6
	stba	%l0,	[%l7 + %o6] 0x2f
	membar	#Sync
	fbule,a	%fcc3,	loop_2155
	taddcc	%o6,	%o2,	%g3
	brgez,a	%g7,	loop_2156
	edge32ln	%l4,	%i2,	%l2
loop_2155:
	fnegd	%f30,	%f20
	fandnot2s	%f31,	%f29,	%f19
loop_2156:
	tcc	%icc,	0x1
	fbug,a	%fcc0,	loop_2157
	te	%icc,	0x6
	fbge	%fcc2,	loop_2158
	sdiv	%o3,	0x1715,	%o1
loop_2157:
	swap	[%l7 + 0x1C],	%g6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2158:
	fones	%f11
	ld	[%l7 + 0x6C],	%f18
	bcc,a	loop_2159
	alignaddr	%o4,	%o0,	%g4
	nop
	set	0x5C, %i3
	sth	%l3,	[%l7 + %i3]
	fpackfix	%f28,	%f2
loop_2159:
	edge16ln	%l6,	%o5,	%g5
	add	%l7,	0x5C,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] %asi,	%o7,	%i4
	tg	%icc,	0x6
	edge32ln	%l5,	%i6,	%i1
	fbg	%fcc1,	loop_2160
	orcc	%i7,	0x0E9A,	%i3
	fmovrde	%l1,	%f30,	%f12
	movle	%icc,	%g1,	%g2
loop_2160:
	movre	%i0,	0x360,	%l0
	srax	%i5,	0x0E,	%o2
	movleu	%xcc,	%o6,	%g3
	addc	%g7,	0x1FAA,	%l4
	fmovdne	%xcc,	%f17,	%f22
	srax	%l2,	%o3,	%o1
	set	0x0B, %i4
	stba	%i2,	[%l7 + %i4] 0x11
	tsubcc	%g6,	%o0,	%o4
	stw	%l3,	[%l7 + 0x30]
	edge16	%l6,	%g4,	%o5
	tleu	%icc,	0x1
	fbl	%fcc2,	loop_2161
	edge32ln	%o7,	%i4,	%g5
	movne	%xcc,	%l5,	%i6
	fnot2	%f10,	%f2
loop_2161:
	orcc	%i7,	0x1E70,	%i1
	wr	%g0,	0x80,	%asi
	sta	%f6,	[%l7 + 0x54] %asi
	fxnors	%f22,	%f9,	%f2
	fzero	%f4
	wr	%g0,	0x88,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	andn	%i3,	0x0C5F,	%g1
	tsubcc	%g2,	0x0A9C,	%i0
	movleu	%icc,	%l1,	%i5
	fnot2s	%f26,	%f10
	bne,pn	%icc,	loop_2162
	or	%o2,	0x155A,	%l0
	sethi	0x04E6,	%o6
	fmovdne	%icc,	%f6,	%f12
loop_2162:
	taddcc	%g7,	0x1E6C,	%l4
	subc	%g3,	0x0C4E,	%l2
	sdivx	%o3,	0x13E1,	%i2
	movge	%xcc,	%o1,	%o0
	movcs	%xcc,	%o4,	%g6
	movrlz	%l6,	%l3,	%g4
	addc	%o7,	0x1C5B,	%o5
	umul	%i4,	0x0AB7,	%l5
	tl	%xcc,	0x2
	set	0x4E, %o5
	stha	%i6,	[%l7 + %o5] 0xe2
	membar	#Sync
	wr	%g0,	0x24,	%asi
	ldda	[%l7 + 0x50] %asi,	%g4
	fmul8x16al	%f16,	%f18,	%f24
	subcc	%i7,	%i3,	%g1
	bn,a,pt	%icc,	loop_2163
	edge8	%g2,	%i1,	%l1
	movge	%xcc,	%i5,	%o2
	tl	%icc,	0x2
loop_2163:
	edge8n	%l0,	%o6,	%i0
	xnor	%l4,	%g7,	%g3
	fpadd32s	%f15,	%f16,	%f29
	fxor	%f8,	%f14,	%f4
	sth	%l2,	[%l7 + 0x7E]
	tle	%icc,	0x6
	movcs	%icc,	%i2,	%o3
	srlx	%o1,	0x0F,	%o0
	fbl	%fcc1,	loop_2164
	brz	%g6,	loop_2165
	edge16	%o4,	%l3,	%l6
	bgu,pt	%xcc,	loop_2166
loop_2164:
	tne	%xcc,	0x3
loop_2165:
	add	%g4,	%o5,	%o7
	bl,a,pn	%xcc,	loop_2167
loop_2166:
	tgu	%xcc,	0x2
	nop
	set	0x70, %i1
	stx	%i4,	[%l7 + %i1]
	wr	%g0,	0x80,	%asi
	sta	%f16,	[%l7 + 0x08] %asi
loop_2167:
	fcmps	%fcc3,	%f29,	%f22
	fmovsl	%icc,	%f30,	%f10
	movvc	%icc,	%i6,	%g5
	ldsw	[%l7 + 0x54],	%l5
	smul	%i7,	0x1162,	%i3
	fnors	%f27,	%f29,	%f20
	movcs	%icc,	%g1,	%g2
	set	0x44, %g4
	lduwa	[%l7 + %g4] 0x18,	%l1
	tl	%icc,	0x7
	lduw	[%l7 + 0x54],	%i5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udivcc	%i1,	0x18ED,	%o2
	fxnor	%f14,	%f12,	%f20
	set	0x5A, %l6
	lduha	[%l7 + %l6] 0x0c,	%o6
	edge16	%l0,	%i0,	%g7
	fmovdleu	%xcc,	%f20,	%f25
	movle	%icc,	%l4,	%g3
	movvc	%xcc,	%i2,	%l2
	edge8n	%o3,	%o0,	%o1
	bn,a	loop_2168
	edge8ln	%g6,	%l3,	%o4
	bne,a	%icc,	loop_2169
	fcmple32	%f10,	%f12,	%l6
loop_2168:
	fmovsvs	%icc,	%f10,	%f28
	tgu	%icc,	0x6
loop_2169:
	fmovrsne	%o5,	%f12,	%f7
	movvs	%icc,	%o7,	%g4
	movpos	%icc,	%i4,	%g5
	sdivcc	%i6,	0x19B5,	%i7
	edge16n	%i3,	%g1,	%l5
	or	%l1,	%g2,	%i1
	edge16n	%i5,	%o2,	%o6
	edge32l	%l0,	%g7,	%l4
	movpos	%xcc,	%i0,	%g3
	call	loop_2170
	sll	%l2,	%o3,	%o0
	edge16ln	%i2,	%o1,	%g6
	movgu	%xcc,	%o4,	%l3
loop_2170:
	subccc	%l6,	%o5,	%o7
	sra	%g4,	0x16,	%g5
	orcc	%i4,	0x15E7,	%i7
	fbn	%fcc0,	loop_2171
	brnz	%i3,	loop_2172
	bpos,pt	%xcc,	loop_2173
	call	loop_2174
loop_2171:
	movleu	%icc,	%i6,	%g1
loop_2172:
	mulx	%l1,	%g2,	%l5
loop_2173:
	nop
	wr	%g0,	0x89,	%asi
	stha	%i1,	[%l7 + 0x1A] %asi
loop_2174:
	fbul	%fcc0,	loop_2175
	movrlez	%i5,	%o2,	%o6
	wr	%g0,	0x10,	%asi
	lda	[%l7 + 0x50] %asi,	%f21
loop_2175:
	nop
	set	0x40, %o1
	ldda	[%l7 + %o1] 0x80,	%l0
	smulcc	%l4,	%g7,	%g3
	subc	%l2,	0x1AC5,	%o3
	ldx	[%l7 + 0x70],	%i0
	fbe,a	%fcc0,	loop_2176
	tl	%icc,	0x4
	edge16n	%o0,	%o1,	%g6
	tge	%icc,	0x6
loop_2176:
	movne	%icc,	%i2,	%l3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movcs	%icc,	%l6,	%o5
	fmovrslz	%o4,	%f20,	%f20
	tsubcc	%g4,	0x052A,	%o7
	or	%i4,	0x00D1,	%i7
	addcc	%i3,	%g5,	%i6
	movcs	%icc,	%l1,	%g2
	edge8l	%l5,	%g1,	%i5
	st	%f17,	[%l7 + 0x5C]
	array8	%i1,	%o2,	%l0
	movrgz	%l4,	0x119,	%o6
	edge8ln	%g3,	%g7,	%o3
	or	%i0,	0x13A4,	%o0
	addcc	%l2,	0x1643,	%o1
	tcc	%icc,	0x6
	bcs,a	%xcc,	loop_2177
	fbug,a	%fcc2,	loop_2178
	fnand	%f28,	%f2,	%f14
	edge8ln	%i2,	%l3,	%g6
loop_2177:
	movre	%l6,	0x075,	%o4
loop_2178:
	sethi	0x07F2,	%g4
	fbne	%fcc3,	loop_2179
	movne	%icc,	%o7,	%i4
	fnand	%f6,	%f20,	%f10
	edge32ln	%o5,	%i3,	%i7
loop_2179:
	tn	%xcc,	0x2
	fble,a	%fcc1,	loop_2180
	addc	%g5,	%l1,	%g2
	fnot1s	%f14,	%f13
	fbul	%fcc1,	loop_2181
loop_2180:
	edge16n	%l5,	%g1,	%i6
	fnot1s	%f3,	%f5
	edge32l	%i1,	%i5,	%o2
loop_2181:
	bneg	loop_2182
	movcc	%xcc,	%l4,	%l0
	xor	%g3,	%g7,	%o3
	sra	%o6,	%o0,	%i0
loop_2182:
	fcmpne32	%f26,	%f0,	%o1
	movneg	%icc,	%l2,	%i2
	movgu	%icc,	%l3,	%l6
	fsrc1	%f14,	%f0
	movvs	%xcc,	%o4,	%g6
	sll	%o7,	0x0A,	%g4
	fpmerge	%f0,	%f17,	%f4
	taddcc	%i4,	%o5,	%i7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xor	%g5,	0x0EE8,	%i3
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
	umul	%g2,	%l5,	%l1
	sdivx	%g1,	0x1622,	%i6
	tg	%xcc,	0x7
	fpsub32	%f24,	%f18,	%f28
	fpsub32	%f20,	%f8,	%f10
	fcmpeq32	%f20,	%f16,	%i1
	fnot1s	%f22,	%f28
	nop
	set	0x16, %i5
	ldsh	[%l7 + %i5],	%o2
	edge8l	%l4,	%l0,	%g3
	fands	%f10,	%f6,	%f16
	brlez	%g7,	loop_2183
	movpos	%icc,	%i5,	%o3
	movcs	%icc,	%o6,	%i0
	stbar
loop_2183:
	bgu,a,pt	%icc,	loop_2184
	tge	%icc,	0x2
	fmovscs	%xcc,	%f0,	%f5
	fnegd	%f4,	%f26
loop_2184:
	call	loop_2185
	fmovrdgz	%o0,	%f4,	%f14
	addc	%l2,	0x0D78,	%i2
	fornot1	%f14,	%f26,	%f14
loop_2185:
	smulcc	%l3,	%l6,	%o4
	ldub	[%l7 + 0x2C],	%o1
	fmul8x16al	%f10,	%f29,	%f22
	movcc	%xcc,	%o7,	%g6
	fblg	%fcc1,	loop_2186
	xnorcc	%g4,	0x1F5B,	%i4
	edge8	%o5,	%g5,	%i3
	fmovdne	%icc,	%f16,	%f14
loop_2186:
	tleu	%xcc,	0x3
	movrgez	%i7,	%l5,	%g2
	ta	%icc,	0x2
	wr	%g0,	0x0c,	%asi
	sta	%f19,	[%l7 + 0x24] %asi
	andn	%g1,	%l1,	%i6
	fba	%fcc0,	loop_2187
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sub	%i1,	0x1E1B,	%l4
	ld	[%l7 + 0x64],	%f2
loop_2187:
	nop
	wr	%g0,	0x80,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	wr	%g0,	0x80,	%asi
	ldswa	[%l7 + 0x10] %asi,	%l0
	membar	0x24
	alignaddr	%o2,	%g3,	%i5
	ldd	[%l7 + 0x20],	%o2
	movcs	%icc,	%o6,	%g7
	tsubcctv	%o0,	%i0,	%i2
	movgu	%xcc,	%l3,	%l2
	tleu	%xcc,	0x2
	add	%l6,	0x1866,	%o1
	movpos	%icc,	%o4,	%g6
	for	%f6,	%f28,	%f30
	fandnot1	%f14,	%f22,	%f4
	srax	%g4,	0x04,	%i4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	popc	0x01AC,	%o7
	movre	%o5,	%i3,	%g5
	movl	%icc,	%i7,	%l5
	movleu	%xcc,	%g1,	%g2
	tle	%icc,	0x0
	tleu	%xcc,	0x6
	fbge	%fcc0,	loop_2188
	bpos,pn	%icc,	loop_2189
	xnorcc	%l1,	%i1,	%l4
	fmovsgu	%icc,	%f31,	%f6
loop_2188:
	popc	%i6,	%l0
loop_2189:
	edge32l	%o2,	%i5,	%o3
	andncc	%g3,	%g7,	%o6
	fzero	%f0
	movrgez	%o0,	0x3AF,	%i2
	popc	%l3,	%i0
	orcc	%l6,	0x1155,	%l2
	fnand	%f6,	%f16,	%f10
	alignaddr	%o4,	%o1,	%g6
	sub	%g4,	%o7,	%o5
	wr	%g0,	0xe3,	%asi
	stha	%i4,	[%l7 + 0x50] %asi
	membar	#Sync
	orn	%g5,	0x1F55,	%i3
	array16	%i7,	%g1,	%g2
	array8	%l5,	%l1,	%l4
	xorcc	%i1,	%l0,	%i6
	fmovdgu	%xcc,	%f27,	%f4
	edge32ln	%i5,	%o3,	%o2
	udivcc	%g7,	0x0399,	%o6
	taddcctv	%g3,	0x0075,	%o0
	fpack32	%f12,	%f2,	%f26
	fxnors	%f1,	%f21,	%f17
	fmovdn	%xcc,	%f8,	%f12
	fandnot2	%f10,	%f16,	%f28
	umulcc	%i2,	%i0,	%l3
	tsubcc	%l6,	0x0D07,	%o4
	fblg	%fcc0,	loop_2190
	array32	%o1,	%l2,	%g6
	movvs	%icc,	%o7,	%o5
	mova	%icc,	%i4,	%g5
loop_2190:
	addccc	%i3,	0x1C8A,	%g4
	movg	%xcc,	%g1,	%g2
	brlez	%l5,	loop_2191
	taddcc	%i7,	%l1,	%l4
	tsubcctv	%l0,	0x1B38,	%i6
	fmovs	%f24,	%f9
loop_2191:
	edge16n	%i1,	%o3,	%o2
	edge16	%g7,	%i5,	%o6
	sll	%g3,	%i2,	%o0
	sdivcc	%i0,	0x1F8A,	%l3
	nop
	set	0x40, %l2
	ldsb	[%l7 + %l2],	%o4
	and	%o1,	%l6,	%g6
	movneg	%xcc,	%o7,	%o5
	movrlz	%l2,	0x1B6,	%i4
	and	%g5,	0x0B2D,	%g4
	fmuld8sux16	%f10,	%f20,	%f20
	ta	%xcc,	0x5
	tn	%icc,	0x4
	ld	[%l7 + 0x5C],	%f0
	movg	%xcc,	%g1,	%g2
	fpsub16	%f0,	%f4,	%f16
	edge32n	%l5,	%i3,	%l1
	set	0x78, %g3
	swapa	[%l7 + %g3] 0x88,	%i7
	fmovrsgz	%l0,	%f20,	%f16
	tle	%xcc,	0x7
	umulcc	%l4,	%i6,	%o3
	movre	%o2,	0x20A,	%i1
	smul	%i5,	%g7,	%g3
	sra	%i2,	0x0A,	%o6
	mova	%xcc,	%o0,	%i0
	edge16ln	%l3,	%o4,	%o1
	movge	%icc,	%l6,	%o7
	alignaddr	%o5,	%l2,	%g6
	fmovsa	%xcc,	%f27,	%f16
	fmovdcs	%xcc,	%f2,	%f6
	fmul8x16al	%f1,	%f21,	%f28
	set	0x40, %l3
	ldda	[%l7 + %l3] 0x18,	%f16
	alignaddrl	%i4,	%g4,	%g1
	move	%icc,	%g2,	%g5
	fmovsge	%xcc,	%f7,	%f10
	nop
	setx loop_2192, %l0, %l1
	jmpl %l1, %i3
	mulscc	%l1,	%l5,	%i7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andcc	%l4,	0x045F,	%i6
loop_2192:
	fmovsn	%xcc,	%f3,	%f11
	fpsub16	%f2,	%f16,	%f12
	fbue,a	%fcc1,	loop_2193
	sdivx	%l0,	0x057C,	%o2
	subcc	%i1,	%i5,	%g7
	tcc	%xcc,	0x0
loop_2193:
	orcc	%o3,	%g3,	%o6
	sth	%o0,	[%l7 + 0x16]
	fmovdneg	%xcc,	%f22,	%f7
	xnorcc	%i0,	%i2,	%l3
	edge16ln	%o1,	%l6,	%o4
	fcmpeq16	%f26,	%f30,	%o7
	sth	%l2,	[%l7 + 0x78]
	srl	%o5,	%g6,	%g4
	fbl,a	%fcc0,	loop_2194
	fpsub16s	%f29,	%f2,	%f21
	fmovsg	%xcc,	%f9,	%f26
	mova	%xcc,	%g1,	%i4
loop_2194:
	fsrc2	%f16,	%f16
	tl	%icc,	0x7
	tneg	%xcc,	0x1
	orncc	%g2,	0x12A6,	%g5
	smul	%i3,	0x0168,	%l5
	be,a	loop_2195
	edge32	%l1,	%i7,	%i6
	fmovd	%f20,	%f30
	fcmped	%fcc1,	%f16,	%f30
loop_2195:
	edge32l	%l4,	%o2,	%i1
	call	loop_2196
	alignaddrl	%i5,	%g7,	%l0
	fpadd32	%f10,	%f20,	%f0
	fmul8x16	%f20,	%f30,	%f2
loop_2196:
	fnot1s	%f19,	%f4
	tcs	%icc,	0x4
	fmovdvc	%xcc,	%f2,	%f22
	fmovs	%f21,	%f17
	tne	%xcc,	0x6
	edge32ln	%g3,	%o6,	%o3
	edge8n	%o0,	%i2,	%l3
	edge32l	%i0,	%l6,	%o1
	fcmple16	%f18,	%f4,	%o4
	smul	%l2,	0x0672,	%o5
	fmovrslz	%o7,	%f24,	%f27
	fbg,a	%fcc0,	loop_2197
	fbe,a	%fcc1,	loop_2198
	fmovdge	%icc,	%f24,	%f20
	set	0x3E, %g7
	ldsha	[%l7 + %g7] 0x15,	%g4
loop_2197:
	sdivcc	%g6,	0x0AC1,	%g1
loop_2198:
	fbue,a	%fcc3,	loop_2199
	bpos,pn	%xcc,	loop_2200
	tsubcc	%i4,	%g2,	%g5
	movne	%xcc,	%i3,	%l1
loop_2199:
	tsubcctv	%l5,	%i6,	%l4
loop_2200:
	sdivcc	%o2,	0x0744,	%i7
	andcc	%i5,	0x172D,	%i1
	sub	%g7,	0x1278,	%l0
	movre	%g3,	%o6,	%o3
	fmovdneg	%xcc,	%f6,	%f20
	ldsb	[%l7 + 0x7C],	%i2
	or	%o0,	%l3,	%l6
	bne,a	%icc,	loop_2201
	mova	%icc,	%o1,	%o4
	tsubcctv	%l2,	0x0FFA,	%i0
	subc	%o5,	0x1B7F,	%o7
loop_2201:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovspos	%icc,	%f29,	%f13
	umul	%g4,	0x0013,	%g1
	xor	%g6,	%g2,	%i4
	movl	%icc,	%i3,	%l1
	fba	%fcc2,	loop_2202
	fmovsvs	%icc,	%f25,	%f18
	ldstub	[%l7 + 0x41],	%g5
	tle	%icc,	0x3
loop_2202:
	smulcc	%l5,	%l4,	%o2
	fnegd	%f16,	%f4
	orncc	%i6,	%i7,	%i1
	add	%i5,	%l0,	%g7
	fcmpeq32	%f10,	%f26,	%o6
	bge,a	loop_2203
	xorcc	%o3,	%i2,	%g3
	edge8	%o0,	%l3,	%l6
	edge32	%o1,	%l2,	%i0
loop_2203:
	sth	%o5,	[%l7 + 0x36]
	popc	0x050C,	%o4
	add	%l7,	0x2C,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%o7
	casa	[%l6] %asi,	%o7,	%g4
	tneg	%xcc,	0x4
	tcs	%xcc,	0x2
	fabss	%f31,	%f0
	wr	%g0,	0x2b,	%asi
	stha	%g1,	[%l7 + 0x3E] %asi
	membar	#Sync
	alignaddrl	%g6,	%g2,	%i3
	fmul8ulx16	%f0,	%f4,	%f2
	movg	%xcc,	%i4,	%g5
	flush	%l7 + 0x5C
	sra	%l5,	0x0F,	%l4
	fpack32	%f26,	%f26,	%f20
	edge8	%l1,	%i6,	%i7
	set	0x40, %l4
	stda	%f0,	[%l7 + %l4] 0x11
	fnors	%f2,	%f18,	%f10
	fpack32	%f16,	%f26,	%f2
	edge32l	%i1,	%o2,	%l0
	call	loop_2204
	bge,a,pn	%xcc,	loop_2205
	movrlez	%g7,	%i5,	%o6
	fblg	%fcc3,	loop_2206
loop_2204:
	edge32	%o3,	%i2,	%g3
loop_2205:
	fbu,a	%fcc3,	loop_2207
	stb	%l3,	[%l7 + 0x12]
loop_2206:
	edge16ln	%l6,	%o0,	%l2
	sllx	%o1,	%i0,	%o5
loop_2207:
	bcs	loop_2208
	fcmps	%fcc0,	%f23,	%f29
	tpos	%xcc,	0x5
	movg	%xcc,	%o7,	%o4
loop_2208:
	brz,a	%g4,	loop_2209
	fcmpne16	%f28,	%f14,	%g1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32	%g6,	%i3,	%g2
loop_2209:
	tcc	%icc,	0x3
	fones	%f28
	fmovdneg	%xcc,	%f15,	%f28
	subcc	%i4,	0x08C0,	%g5
	movcc	%xcc,	%l5,	%l1
	subc	%i6,	0x102A,	%l4
	umul	%i1,	0x1111,	%o2
	fba,a	%fcc0,	loop_2210
	umul	%i7,	0x1749,	%l0
	movneg	%xcc,	%g7,	%i5
	ldx	[%l7 + 0x08],	%o6
loop_2210:
	fornot2	%f4,	%f22,	%f10
	fnands	%f31,	%f0,	%f8
	taddcctv	%o3,	0x10CD,	%i2
	bneg	%icc,	loop_2211
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array16	%g3,	%l3,	%l6
	udiv	%o0,	0x1664,	%o1
loop_2211:
	fcmpes	%fcc1,	%f22,	%f31
	fmovrdgez	%l2,	%f8,	%f8
	movrgz	%o5,	0x30A,	%o7
	move	%icc,	%i0,	%o4
	srl	%g1,	0x1B,	%g6
	movvc	%icc,	%g4,	%i3
	andcc	%g2,	0x1B79,	%g5
	taddcctv	%i4,	0x182C,	%l5
	bvs,a	loop_2212
	bne,pt	%icc,	loop_2213
	fmovrslz	%l1,	%f9,	%f4
	edge16n	%l4,	%i1,	%i6
loop_2212:
	edge16l	%i7,	%o2,	%l0
loop_2213:
	nop
	wr	%g0,	0x04,	%asi
	lduha	[%l7 + 0x3A] %asi,	%i5
	bleu,a	%icc,	loop_2214
	fxor	%f16,	%f6,	%f22
	edge32	%o6,	%o3,	%i2
	fornot2	%f0,	%f8,	%f6
loop_2214:
	membar	0x7E
	tleu	%xcc,	0x4
	fble,a	%fcc2,	loop_2215
	swap	[%l7 + 0x30],	%g3
	add	%g7,	%l3,	%l6
	fmovda	%xcc,	%f9,	%f25
loop_2215:
	ba	%xcc,	loop_2216
	sethi	0x007C,	%o0
	fmovrsne	%l2,	%f31,	%f4
	mulscc	%o1,	0x140C,	%o5
loop_2216:
	bcs	%icc,	loop_2217
	edge16	%o7,	%o4,	%i0
	fmovrdgez	%g1,	%f18,	%f8
	movre	%g6,	%i3,	%g4
loop_2217:
	membar	0x74
	ble,a	%xcc,	loop_2218
	sdivx	%g2,	0x1C4F,	%g5
	edge32ln	%i4,	%l5,	%l4
	tg	%icc,	0x3
loop_2218:
	std	%f16,	[%l7 + 0x70]
	nop
	set	0x46, %i0
	sth	%l1,	[%l7 + %i0]
	fmovrse	%i1,	%f3,	%f24
	tpos	%xcc,	0x5
	nop
	setx	loop_2219,	%l0,	%l1
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
	movrgez	%i7,	0x3CC,	%i6
	fbo	%fcc0,	loop_2220
loop_2219:
	brgez	%o2,	loop_2221
	fmovda	%xcc,	%f25,	%f11
	fandnot1	%f8,	%f4,	%f18
loop_2220:
	tn	%icc,	0x3
loop_2221:
	taddcc	%i5,	0x1E55,	%l0
	movrgz	%o6,	0x097,	%i2
	fmovdgu	%xcc,	%f10,	%f13
	fpsub32	%f4,	%f16,	%f20
	tsubcc	%g3,	0x011C,	%o3
	fblg,a	%fcc3,	loop_2222
	ld	[%l7 + 0x38],	%f5
	udivcc	%g7,	0x0B65,	%l3
	sdivx	%o0,	0x06BC,	%l6
loop_2222:
	fmovsvs	%icc,	%f24,	%f11
	tg	%xcc,	0x0
	andcc	%o1,	%o5,	%l2
	fmovdge	%xcc,	%f19,	%f27
	mulx	%o7,	%o4,	%i0
	tsubcctv	%g1,	0x1506,	%g6
	nop
	setx	loop_2223,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	sdivcc	%g4,	0x154C,	%i3
	fnor	%f18,	%f14,	%f24
	sethi	0x02AE,	%g5
loop_2223:
	array32	%g2,	%i4,	%l5
	fbne,a	%fcc2,	loop_2224
	edge32	%l4,	%l1,	%i7
	movre	%i1,	0x2C5,	%i6
	sdivx	%i5,	0x0B44,	%l0
loop_2224:
	subccc	%o2,	0x0C62,	%o6
	edge32n	%i2,	%o3,	%g3
	andncc	%l3,	%g7,	%o0
	tcs	%xcc,	0x4
	fmovde	%xcc,	%f8,	%f8
	movneg	%icc,	%l6,	%o5
	xnor	%l2,	%o1,	%o7
	st	%f11,	[%l7 + 0x74]
	xor	%i0,	0x0EC2,	%g1
	brnz,a	%o4,	loop_2225
	brz	%g4,	loop_2226
	edge32ln	%g6,	%g5,	%i3
	movgu	%xcc,	%i4,	%g2
loop_2225:
	std	%f0,	[%l7 + 0x58]
loop_2226:
	fpsub32	%f16,	%f10,	%f10
	edge16	%l4,	%l5,	%i7
	movle	%icc,	%l1,	%i1
	movcc	%xcc,	%i6,	%i5
	xnorcc	%o2,	%l0,	%o6
	movge	%xcc,	%i2,	%g3
	addc	%o3,	0x08FE,	%g7
	wr	%g0,	0x89,	%asi
	ldda	[%l7 + 0x50] %asi,	%l2
	bshuffle	%f10,	%f16,	%f6
	udivx	%l6,	0x10AA,	%o0
	mova	%icc,	%l2,	%o1
	stbar
	movg	%xcc,	%o5,	%o7
	fmovsa	%xcc,	%f27,	%f25
	fzero	%f16
	lduw	[%l7 + 0x68],	%i0
	fmovrdne	%g1,	%f0,	%f0
	alignaddrl	%g4,	%g6,	%o4
	fmovrdgez	%i3,	%f6,	%f4
	tge	%xcc,	0x2
	bshuffle	%f16,	%f6,	%f12
	mulx	%g5,	%i4,	%g2
	sra	%l5,	0x09,	%l4
	fzeros	%f4
	sra	%l1,	0x1A,	%i1
	fbul	%fcc1,	loop_2227
	mulscc	%i6,	0x0DAA,	%i7
	movrlz	%o2,	0x376,	%l0
	addccc	%o6,	%i5,	%g3
loop_2227:
	fcmpgt32	%f26,	%f26,	%i2
	tg	%xcc,	0x6
	tpos	%xcc,	0x2
	edge16l	%g7,	%o3,	%l3
	fbe,a	%fcc3,	loop_2228
	fone	%f18
	taddcc	%o0,	0x06CB,	%l6
	brlez,a	%l2,	loop_2229
loop_2228:
	bvc	%xcc,	loop_2230
	movg	%xcc,	%o1,	%o5
	lduh	[%l7 + 0x12],	%o7
loop_2229:
	brnz,a	%i0,	loop_2231
loop_2230:
	fnor	%f8,	%f30,	%f8
	tge	%icc,	0x6
	edge8n	%g4,	%g6,	%g1
loop_2231:
	ld	[%l7 + 0x14],	%f3
	orncc	%o4,	%g5,	%i3
	tgu	%xcc,	0x6
	set	0x1C, %l5
	lduha	[%l7 + %l5] 0x89,	%i4
	stx	%g2,	[%l7 + 0x18]
	add	%l5,	%l4,	%l1
	fors	%f7,	%f27,	%f15
	sub	%i1,	%i7,	%i6
	fmovdl	%xcc,	%f1,	%f18
	brlz,a	%o2,	loop_2232
	fnands	%f24,	%f12,	%f26
	brlez	%o6,	loop_2233
	fbug,a	%fcc2,	loop_2234
loop_2232:
	andcc	%l0,	0x0CD7,	%i5
	fnand	%f14,	%f16,	%f30
loop_2233:
	udivcc	%g3,	0x0EC4,	%g7
loop_2234:
	sdivcc	%o3,	0x1DD6,	%l3
	movg	%icc,	%i2,	%o0
	udivcc	%l6,	0x11A8,	%l2
	edge32ln	%o5,	%o1,	%o7
	tne	%xcc,	0x7
	mulscc	%i0,	0x144B,	%g4
	udiv	%g6,	0x089A,	%o4
	fones	%f27
	tvc	%xcc,	0x4
	fmovrsgez	%g1,	%f5,	%f20
	andn	%g5,	%i3,	%g2
	movvc	%icc,	%l5,	%i4
	fandnot2	%f30,	%f0,	%f22
	movvs	%icc,	%l4,	%l1
	srax	%i7,	%i1,	%i6
	edge32ln	%o6,	%o2,	%i5
	sth	%l0,	[%l7 + 0x3C]
	bgu,a,pt	%icc,	loop_2235
	fmul8x16al	%f4,	%f1,	%f24
	fpadd32	%f14,	%f0,	%f30
	add	%l7,	0x50,	%l6
	wr	%g0,	0x04,	%asi
	lda	[%l6] %asi,	%g3
	casa	[%l6] %asi,	%g3,	%g7
loop_2235:
	nop
	set	0x28, %g1
	lduba	[%l7 + %g1] 0x15,	%l3
	fmovrse	%i2,	%f5,	%f12
	sethi	0x00DC,	%o0
	bn,a	%xcc,	loop_2236
	orncc	%o3,	0x0B37,	%l2
	stx	%l6,	[%l7 + 0x28]
	and	%o1,	0x1EF8,	%o7
loop_2236:
	andcc	%i0,	%o5,	%g4
	wr	%g0,	0x19,	%asi
	ldstuba	[%l7 + 0x4D] %asi,	%g6
	fmovscc	%icc,	%f16,	%f13
	taddcc	%o4,	%g5,	%g1
	membar	0x1D
	tle	%xcc,	0x7
	fpsub32s	%f3,	%f4,	%f24
	movrgz	%g2,	0x230,	%l5
	st	%f7,	[%l7 + 0x58]
	for	%f26,	%f28,	%f22
	movrlz	%i4,	%l4,	%l1
	movgu	%icc,	%i3,	%i1
	movcs	%icc,	%i7,	%o6
	fbul	%fcc0,	loop_2237
	udivx	%i6,	0x1AF1,	%i5
	set	0x28, %o7
	lduha	[%l7 + %o7] 0x18,	%o2
loop_2237:
	stb	%l0,	[%l7 + 0x28]
	std	%f6,	[%l7 + 0x08]
	andn	%g7,	%g3,	%i2
	fmovdpos	%xcc,	%f21,	%f8
	tn	%xcc,	0x0
	edge8ln	%o0,	%l3,	%l2
	move	%xcc,	%l6,	%o3
	fbl	%fcc2,	loop_2238
	movre	%o1,	%o7,	%i0
	fcmple16	%f14,	%f22,	%o5
	xor	%g6,	%g4,	%g5
loop_2238:
	tpos	%xcc,	0x2
	fmul8x16	%f7,	%f16,	%f12
	sll	%g1,	0x04,	%o4
	fxnor	%f10,	%f14,	%f2
	sdivx	%g2,	0x119E,	%l5
	xorcc	%i4,	%l1,	%l4
	alignaddr	%i3,	%i7,	%o6
	fmovrse	%i1,	%f14,	%f1
	edge32n	%i5,	%o2,	%i6
	membar	0x4B
	edge16ln	%g7,	%g3,	%l0
	or	%i2,	0x1685,	%l3
	ta	%icc,	0x2
	fmovrsne	%l2,	%f24,	%f0
	tpos	%icc,	0x5
	tsubcc	%l6,	%o0,	%o3
	movle	%xcc,	%o1,	%i0
	movg	%xcc,	%o5,	%o7
	movn	%icc,	%g4,	%g6
	edge32ln	%g1,	%o4,	%g5
	edge16ln	%g2,	%l5,	%l1
	set	0x0C, %o0
	lduwa	[%l7 + %o0] 0x0c,	%i4
	movl	%icc,	%l4,	%i3
	wr	%g0,	0x81,	%asi
	ldstuba	[%l7 + 0x47] %asi,	%i7
	fnegd	%f2,	%f12
	ldsh	[%l7 + 0x0C],	%o6
	tle	%xcc,	0x7
	movrne	%i1,	%o2,	%i6
	fabsd	%f28,	%f24
	smulcc	%g7,	%g3,	%l0
	popc	0x1F1A,	%i5
	fabss	%f26,	%f23
	sethi	0x09E3,	%i2
	addc	%l2,	%l3,	%l6
	bgu,pn	%icc,	loop_2239
	fmovdne	%xcc,	%f26,	%f9
	edge32l	%o3,	%o1,	%i0
	fandnot1s	%f3,	%f30,	%f31
loop_2239:
	fnand	%f26,	%f20,	%f6
	fnegd	%f10,	%f24
	movgu	%xcc,	%o5,	%o0
	sub	%o7,	0x04C4,	%g4
	siam	0x1
	set	0x14, %g5
	stwa	%g1,	[%l7 + %g5] 0x10
	edge8l	%o4,	%g5,	%g6
	fbul	%fcc3,	loop_2240
	orncc	%l5,	0x0579,	%l1
	movrne	%i4,	0x0E3,	%g2
	taddcc	%i3,	%l4,	%i7
loop_2240:
	fzero	%f22
	fmovrsgez	%o6,	%f24,	%f25
	fpsub32	%f28,	%f20,	%f0
	andncc	%i1,	%i6,	%o2
	fmovsneg	%icc,	%f29,	%f16
	bvc,a	loop_2241
	fpsub16	%f10,	%f16,	%f20
	tle	%xcc,	0x2
	pdist	%f22,	%f12,	%f6
loop_2241:
	array32	%g7,	%g3,	%i5
	sllx	%l0,	%l2,	%l3
	array32	%l6,	%o3,	%i2
	fble	%fcc0,	loop_2242
	bpos,pn	%xcc,	loop_2243
	tneg	%icc,	0x4
	sethi	0x03A3,	%o1
loop_2242:
	andncc	%i0,	%o5,	%o7
loop_2243:
	st	%f3,	[%l7 + 0x1C]
	brz,a	%o0,	loop_2244
	edge8n	%g1,	%o4,	%g5
	edge16l	%g6,	%l5,	%l1
	fxor	%f10,	%f2,	%f30
loop_2244:
	brgz	%i4,	loop_2245
	udiv	%g2,	0x0771,	%i3
	ldx	[%l7 + 0x18],	%g4
	mulscc	%i7,	%l4,	%i1
loop_2245:
	fmuld8sux16	%f12,	%f7,	%f26
	udiv	%i6,	0x084D,	%o6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovde	%xcc,	%f17,	%f28
	array8	%g7,	%o2,	%g3
	set	0x28, %i2
	lduha	[%l7 + %i2] 0x11,	%l0
	andncc	%i5,	%l2,	%l6
	edge32	%l3,	%i2,	%o3
	fmovrsgz	%o1,	%f29,	%f19
	movpos	%icc,	%o5,	%i0
	alignaddrl	%o0,	%o7,	%g1
	sth	%g5,	[%l7 + 0x16]
	andn	%o4,	%g6,	%l1
	movgu	%icc,	%l5,	%i4
	bne	loop_2246
	fcmple16	%f6,	%f14,	%g2
	smulcc	%i3,	0x16B1,	%i7
	wr	%g0,	0x81,	%asi
	stha	%g4,	[%l7 + 0x56] %asi
loop_2246:
	movg	%xcc,	%i1,	%i6
	fandnot2s	%f14,	%f11,	%f5
	set	0x70, %o4
	lduwa	[%l7 + %o4] 0x14,	%l4
	add	%l7,	0x48,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%o6
	casxa	[%l6] %asi,	%o6,	%g7
	addcc	%g3,	%l0,	%i5
	udivx	%o2,	0x16D1,	%l2
	membar	0x43
	movvc	%xcc,	%l6,	%l3
	wr	%g0,	0xea,	%asi
	stba	%i2,	[%l7 + 0x26] %asi
	membar	#Sync
	tne	%xcc,	0x6
	edge32n	%o3,	%o1,	%o5
	mulscc	%i0,	0x12EF,	%o7
	edge8n	%g1,	%o0,	%g5
	movcs	%icc,	%o4,	%l1
	wr	%g0,	0x2a,	%asi
	stxa	%g6,	[%l7 + 0x18] %asi
	membar	#Sync
	smul	%l5,	0x0D3F,	%i4
	umul	%i3,	%g2,	%i7
	fzeros	%f9
	fmovrde	%i1,	%f20,	%f6
	umulcc	%i6,	0x1579,	%g4
	edge16n	%o6,	%l4,	%g3
	edge32	%l0,	%g7,	%i5
	fones	%f15
	set	0x60, %o3
	swapa	[%l7 + %o3] 0x04,	%o2
	sir	0x170C
	fmovsg	%xcc,	%f6,	%f20
	edge8n	%l2,	%l3,	%l6
	brlez	%o3,	loop_2247
	tneg	%xcc,	0x7
	sdivx	%o1,	0x17B2,	%o5
	umulcc	%i2,	0x0152,	%o7
loop_2247:
	movrlz	%g1,	0x342,	%o0
	ba,a,pt	%icc,	loop_2248
	orn	%i0,	%o4,	%g5
	fmovsle	%xcc,	%f5,	%f7
	ba	%xcc,	loop_2249
loop_2248:
	edge16l	%g6,	%l5,	%l1
	brz	%i3,	loop_2250
	sth	%g2,	[%l7 + 0x70]
loop_2249:
	edge32l	%i4,	%i1,	%i7
	add	%l7,	0x48,	%l6
	wr	%g0,	0x0c,	%asi
	casxa	[%l6] 0x0c,	%g4,	%o6
loop_2250:
	addccc	%l4,	%g3,	%i6
	xor	%l0,	%g7,	%o2
	movcc	%icc,	%i5,	%l3
	movcs	%icc,	%l6,	%o3
	movge	%xcc,	%o1,	%l2
	andcc	%o5,	0x107E,	%i2
	movn	%icc,	%g1,	%o0
	tcs	%icc,	0x1
	edge8ln	%o7,	%i0,	%g5
	bvs	%xcc,	loop_2251
	membar	0x3D
	fmovsne	%icc,	%f30,	%f14
	subcc	%o4,	0x1BB4,	%l5
loop_2251:
	movge	%xcc,	%g6,	%l1
	edge32n	%g2,	%i3,	%i4
	fmovrde	%i7,	%f12,	%f0
	te	%xcc,	0x6
	ldd	[%l7 + 0x38],	%i0
	tsubcc	%g4,	0x1784,	%o6
	mulscc	%l4,	%g3,	%i6
	alignaddr	%l0,	%g7,	%o2
	sdivcc	%i5,	0x063A,	%l3
	movre	%o3,	0x0F3,	%l6
	nop
	set	0x58, %i7
	std	%f6,	[%l7 + %i7]
	bvs,a,pn	%icc,	loop_2252
	bcs,a	loop_2253
	bg,pt	%xcc,	loop_2254
	mulscc	%l2,	0x1057,	%o1
loop_2252:
	te	%xcc,	0x1
loop_2253:
	nop
	wr	%g0,	0x04,	%asi
	swapa	[%l7 + 0x6C] %asi,	%o5
loop_2254:
	fmuld8sux16	%f22,	%f24,	%f26
	movre	%g1,	%o0,	%i2
	fcmpd	%fcc2,	%f2,	%f0
	orncc	%o7,	0x1631,	%i0
	ta	%icc,	0x0
	alignaddr	%o4,	%g5,	%g6
	fblg	%fcc2,	loop_2255
	fmovrdgez	%l5,	%f2,	%f26
	movrlz	%l1,	%g2,	%i3
	fsrc1s	%f18,	%f14
loop_2255:
	fbuge,a	%fcc0,	loop_2256
	fmovdg	%icc,	%f27,	%f1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srax	%i4,	0x13,	%i7
loop_2256:
	tcs	%xcc,	0x7
	swap	[%l7 + 0x58],	%g4
	bge	loop_2257
	array8	%i1,	%l4,	%o6
	udivx	%i6,	0x163C,	%g3
	ldd	[%l7 + 0x08],	%g6
loop_2257:
	fpackfix	%f6,	%f4
	andcc	%o2,	%l0,	%l3
	movneg	%icc,	%o3,	%i5
	brlz,a	%l6,	loop_2258
	be	%xcc,	loop_2259
	array8	%l2,	%o5,	%g1
	umul	%o1,	0x1D33,	%o0
loop_2258:
	subc	%o7,	0x15D7,	%i2
loop_2259:
	tl	%icc,	0x3
	fandnot2s	%f5,	%f25,	%f25
	and	%i0,	%o4,	%g5
	ble,a	loop_2260
	sdiv	%l5,	0x0202,	%l1
	fandnot1	%f26,	%f28,	%f12
	movl	%icc,	%g6,	%i3
loop_2260:
	fmuld8ulx16	%f18,	%f0,	%f30
	movgu	%icc,	%i4,	%i7
	fmovsne	%icc,	%f23,	%f31
	sub	%g2,	%i1,	%l4
	umulcc	%o6,	%i6,	%g3
	taddcc	%g7,	%o2,	%l0
	tcc	%xcc,	0x1
	umul	%l3,	%o3,	%i5
	edge32n	%g4,	%l2,	%o5
	edge32	%l6,	%g1,	%o0
	tg	%xcc,	0x4
	stb	%o7,	[%l7 + 0x5D]
	tl	%icc,	0x3
	movgu	%icc,	%i2,	%i0
	srl	%o1,	%g5,	%o4
	fzero	%f18
	orcc	%l1,	0x06D0,	%g6
	umul	%l5,	%i3,	%i4
	movrlez	%g2,	%i1,	%l4
	movrlez	%i7,	0x1FE,	%i6
	ta	%icc,	0x2
	movge	%icc,	%g3,	%g7
	movre	%o2,	0x329,	%o6
	nop
	setx	loop_2261,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movrgz	%l3,	%o3,	%i5
	fmovdle	%xcc,	%f24,	%f25
	andn	%g4,	%l2,	%l0
loop_2261:
	movvs	%xcc,	%o5,	%g1
	orcc	%l6,	%o7,	%i2
	fbule	%fcc0,	loop_2262
	fbule,a	%fcc1,	loop_2263
	call	loop_2264
	brlz	%o0,	loop_2265
loop_2262:
	fsrc1	%f6,	%f18
loop_2263:
	srlx	%o1,	0x0E,	%i0
loop_2264:
	fmovsn	%icc,	%f20,	%f11
loop_2265:
	nop
	setx	loop_2266,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	orncc	%o4,	%g5,	%l1
	fexpand	%f26,	%f14
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2266:
	ldstub	[%l7 + 0x1F],	%l5
	stw	%i3,	[%l7 + 0x48]
	fbuge,a	%fcc1,	loop_2267
	taddcctv	%i4,	%g6,	%g2
	nop
	setx loop_2268, %l0, %l1
	jmpl %l1, %l4
	fbul,a	%fcc2,	loop_2269
loop_2267:
	xor	%i1,	0x0046,	%i6
	tvc	%xcc,	0x2
loop_2268:
	fornot1	%f8,	%f30,	%f28
loop_2269:
	sdiv	%i7,	0x04CB,	%g3
	ldsw	[%l7 + 0x20],	%g7
	wr	%g0,	0x18,	%asi
	swapa	[%l7 + 0x68] %asi,	%o6
	fpadd16s	%f26,	%f23,	%f12
	fmul8x16al	%f0,	%f14,	%f16
	fcmpgt32	%f30,	%f0,	%o2
	bpos,pt	%xcc,	loop_2270
	movpos	%xcc,	%o3,	%i5
	xorcc	%g4,	0x0EFB,	%l2
	bl,pn	%icc,	loop_2271
loop_2270:
	tge	%xcc,	0x3
	edge32n	%l3,	%l0,	%o5
	tneg	%icc,	0x7
loop_2271:
	call	loop_2272
	tgu	%xcc,	0x7
	fxnor	%f10,	%f2,	%f14
	move	%xcc,	%g1,	%l6
loop_2272:
	array32	%o7,	%i2,	%o1
	fmovdne	%icc,	%f16,	%f0
	smul	%o0,	%o4,	%i0
	flush	%l7 + 0x64
	edge8	%g5,	%l5,	%i3
	andn	%l1,	%g6,	%g2
	call	loop_2273
	xor	%l4,	%i4,	%i6
	fbue	%fcc3,	loop_2274
	fbuge	%fcc0,	loop_2275
loop_2273:
	tcs	%icc,	0x0
	ta	%icc,	0x6
loop_2274:
	ldd	[%l7 + 0x10],	%i6
loop_2275:
	taddcc	%i1,	%g3,	%o6
	edge16	%o2,	%o3,	%g7
	fbg	%fcc0,	loop_2276
	bg,pt	%xcc,	loop_2277
	sdivcc	%i5,	0x1E12,	%g4
	movrgez	%l2,	0x31C,	%l0
loop_2276:
	addccc	%o5,	0x1BD3,	%g1
loop_2277:
	nop
	membar	#Sync
	set	0x40, %g6
	ldda	[%l7 + %g6] 0x17,	%f16
	set	0x24, %i6
	ldswa	[%l7 + %i6] 0x14,	%l6
	membar	0x4D
	movrlez	%l3,	0x1FA,	%o7
	fmovdgu	%xcc,	%f4,	%f7
	taddcc	%i2,	%o1,	%o0
	tvs	%icc,	0x3
	wr	%g0,	0x04,	%asi
	ldsba	[%l7 + 0x10] %asi,	%o4
	sllx	%g5,	%i0,	%l5
	tvs	%icc,	0x7
	ba,a	loop_2278
	tne	%icc,	0x0
	tle	%icc,	0x2
	fones	%f17
loop_2278:
	sir	0x1232
	subccc	%l1,	0x03CD,	%i3
	andncc	%g2,	%g6,	%l4
	fcmple16	%f16,	%f10,	%i6
	sir	0x12E8
	movrgz	%i7,	0x336,	%i4
	movn	%xcc,	%i1,	%o6
	umul	%o2,	%o3,	%g7
	sir	0x1D16
	subc	%i5,	0x10C2,	%g3
	movrgez	%l2,	0x2BF,	%l0
	movneg	%xcc,	%o5,	%g1
	fzero	%f22
	ta	%icc,	0x5
	tcc	%xcc,	0x7
	andcc	%g4,	%l3,	%o7
	fmovrsne	%i2,	%f13,	%f24
	movle	%xcc,	%o1,	%l6
	sllx	%o0,	%g5,	%o4
	tge	%xcc,	0x6
	xorcc	%i0,	%l5,	%i3
	bleu,pt	%xcc,	loop_2279
	udiv	%l1,	0x13A4,	%g6
	bvs,pt	%xcc,	loop_2280
	srax	%g2,	0x06,	%l4
loop_2279:
	edge8	%i6,	%i4,	%i7
	edge32ln	%i1,	%o6,	%o3
loop_2280:
	movrlez	%o2,	0x2F7,	%i5
	movge	%icc,	%g7,	%l2
	sir	0x0160
	ldsw	[%l7 + 0x68],	%l0
	taddcctv	%g3,	%g1,	%o5
	fmovsg	%icc,	%f22,	%f18
	bl,a,pt	%icc,	loop_2281
	and	%g4,	0x1BE7,	%l3
	sethi	0x1249,	%o7
	edge16	%o1,	%i2,	%o0
loop_2281:
	fnot2	%f2,	%f24
	swap	[%l7 + 0x60],	%g5
	sir	0x1F2D
	lduw	[%l7 + 0x48],	%l6
	umulcc	%o4,	%l5,	%i3
	ldsh	[%l7 + 0x3A],	%i0
	ta	%icc,	0x3
	edge32n	%g6,	%l1,	%l4
	edge8ln	%i6,	%i4,	%g2
	xor	%i7,	%i1,	%o3
	fbue	%fcc3,	loop_2282
	ldstub	[%l7 + 0x45],	%o2
	bcs,a,pn	%icc,	loop_2283
	fcmped	%fcc2,	%f10,	%f26
loop_2282:
	ldub	[%l7 + 0x57],	%o6
	fmovsneg	%icc,	%f12,	%f28
loop_2283:
	fbu,a	%fcc0,	loop_2284
	tg	%xcc,	0x1
	fbge	%fcc0,	loop_2285
	movrne	%g7,	%i5,	%l2
loop_2284:
	movvs	%xcc,	%l0,	%g3
	edge16n	%o5,	%g1,	%l3
loop_2285:
	fnegd	%f22,	%f20
	nop
	set	0x38, %g2
	std	%o6,	[%l7 + %g2]
	fzero	%f8
	or	%g4,	%i2,	%o0
	andncc	%g5,	%o1,	%o4
	brlez,a	%l5,	loop_2286
	alignaddr	%i3,	%l6,	%g6
	edge8l	%i0,	%l4,	%l1
	set	0x34, %l0
	ldsba	[%l7 + %l0] 0x15,	%i6
loop_2286:
	movge	%xcc,	%i4,	%g2
	smulcc	%i7,	0x11F5,	%i1
	array32	%o3,	%o6,	%o2
	fsrc1s	%f29,	%f23
	addccc	%i5,	%g7,	%l2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fble	%fcc3,	loop_2287
	edge16l	%l0,	%o5,	%g1
	fbu	%fcc1,	loop_2288
	subc	%l3,	0x0713,	%o7
loop_2287:
	brz,a	%g4,	loop_2289
	tn	%xcc,	0x5
loop_2288:
	fmovrdne	%g3,	%f2,	%f4
	sdivx	%o0,	0x13A5,	%g5
loop_2289:
	movrlez	%o1,	0x373,	%o4
	move	%icc,	%l5,	%i3
	fmovrdgez	%l6,	%f10,	%f20
	add	%l7,	0x28,	%l6
	wr	%g0,	0x19,	%asi
	ldxa	[%l6] %asi,	%i2
	casxa	[%l6] %asi,	%i2,	%g6
	tsubcc	%l4,	0x0C5F,	%i0
	fble	%fcc0,	loop_2290
	brz,a	%i6,	loop_2291
	edge8l	%l1,	%g2,	%i4
	array32	%i1,	%o3,	%o6
loop_2290:
	fbue,a	%fcc3,	loop_2292
loop_2291:
	te	%xcc,	0x4
	tvc	%xcc,	0x5
	fmovsne	%icc,	%f21,	%f23
loop_2292:
	tge	%xcc,	0x1
	fzero	%f26
	mulx	%o2,	%i5,	%g7
	wr	%g0,	0x04,	%asi
	stba	%i7,	[%l7 + 0x77] %asi
	sra	%l0,	%o5,	%g1
	movrlez	%l3,	0x377,	%l2
	move	%xcc,	%g4,	%g3
	pdist	%f14,	%f14,	%f22
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stb	%o0,	[%l7 + 0x09]
	udivcc	%o7,	0x018D,	%o1
	set	0x60, %o2
	prefetcha	[%l7 + %o2] 0x80,	 0x3
	mova	%xcc,	%g5,	%i3
	move	%xcc,	%l5,	%i2
	movcc	%icc,	%l6,	%g6
	movneg	%xcc,	%l4,	%i6
	edge32n	%l1,	%i0,	%i4
	sra	%i1,	%g2,	%o6
	addc	%o2,	%i5,	%g7
	wr	%g0,	0x89,	%asi
	prefetcha	[%l7 + 0x30] %asi,	 0x0
	srlx	%o3,	0x06,	%l0
	set	0x5C, %o6
	lduha	[%l7 + %o6] 0x15,	%o5
	set	0x0C, %i3
	stwa	%g1,	[%l7 + %i3] 0x81
	andn	%l3,	0x1298,	%l2
	smul	%g3,	0x0FB1,	%o0
	fbuge,a	%fcc1,	loop_2293
	tcc	%xcc,	0x1
	fmovrdlez	%o7,	%f0,	%f16
	fcmpne16	%f24,	%f2,	%o1
loop_2293:
	prefetch	[%l7 + 0x44],	 0x3
	fmovrdlz	%g4,	%f4,	%f6
	fmovrslz	%o4,	%f0,	%f3
	movrgez	%i3,	0x16A,	%g5
	stx	%l5,	[%l7 + 0x40]
	orn	%l6,	%i2,	%l4
	call	loop_2294
	move	%icc,	%i6,	%l1
	edge8n	%i0,	%g6,	%i4
	movrgz	%g2,	0x0AF,	%i1
loop_2294:
	xnor	%o6,	%i5,	%g7
	bn,a	loop_2295
	ba,a	%xcc,	loop_2296
	tgu	%icc,	0x5
	addc	%o2,	0x1DBA,	%i7
loop_2295:
	tn	%icc,	0x3
loop_2296:
	ldd	[%l7 + 0x70],	%f12
	tcs	%icc,	0x2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movpos	%xcc,	%l0,	%o3
	edge16n	%o5,	%g1,	%l3
	taddcctv	%g3,	0x027B,	%l2
	fble,a	%fcc0,	loop_2297
	bneg,a,pn	%xcc,	loop_2298
	fble,a	%fcc0,	loop_2299
	bcs,a,pn	%xcc,	loop_2300
loop_2297:
	sllx	%o0,	%o7,	%g4
loop_2298:
	edge8l	%o1,	%i3,	%o4
loop_2299:
	fcmple16	%f18,	%f28,	%g5
loop_2300:
	fmovda	%icc,	%f31,	%f20
	tle	%xcc,	0x2
	umulcc	%l5,	0x0250,	%i2
	fnands	%f8,	%f12,	%f28
	edge32l	%l4,	%l6,	%i6
	bn,a,pn	%icc,	loop_2301
	tleu	%icc,	0x6
	set	0x40, %i4
	ldda	[%l7 + %i4] 0x81,	%f16
loop_2301:
	fbge,a	%fcc3,	loop_2302
	udivcc	%l1,	0x020B,	%g6
	tleu	%icc,	0x5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2302:
	tgu	%icc,	0x7
	andn	%i0,	%g2,	%i1
	edge8ln	%o6,	%i4,	%g7
	tgu	%xcc,	0x4
	xnor	%i5,	%i7,	%o2
	addc	%o3,	%o5,	%l0
	bn	loop_2303
	fexpand	%f9,	%f28
	fmovsa	%xcc,	%f27,	%f6
	fandnot1s	%f23,	%f31,	%f6
loop_2303:
	sll	%g1,	%l3,	%l2
	fpadd32	%f20,	%f14,	%f22
	tg	%xcc,	0x6
	movn	%icc,	%g3,	%o7
	movvc	%xcc,	%g4,	%o1
	fmovrse	%o0,	%f29,	%f23
	movpos	%xcc,	%i3,	%o4
	mulx	%g5,	%l5,	%l4
	fxnors	%f24,	%f21,	%f9
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnands	%f18,	%f14,	%f25
	movre	%l6,	%i2,	%i6
	movleu	%xcc,	%l1,	%i0
	wr	%g0,	0x80,	%asi
	stba	%g6,	[%l7 + 0x58] %asi
	fands	%f3,	%f28,	%f24
	fmovrdgez	%i1,	%f28,	%f28
	edge32l	%g2,	%i4,	%g7
	udivx	%o6,	0x1501,	%i5
	array8	%o2,	%o3,	%i7
	srax	%l0,	%g1,	%l3
	smul	%o5,	0x0B74,	%l2
	movge	%xcc,	%o7,	%g4
	fmovsvc	%icc,	%f21,	%f16
	bl,a	%icc,	loop_2304
	stb	%g3,	[%l7 + 0x24]
	fmovdg	%icc,	%f4,	%f18
	fmovrdgz	%o1,	%f14,	%f24
loop_2304:
	fmovrde	%i3,	%f0,	%f20
	fmovdg	%icc,	%f1,	%f17
	fba	%fcc3,	loop_2305
	nop
	set	0x14, %o5
	ldsw	[%l7 + %o5],	%o4
	fnands	%f9,	%f17,	%f9
	xnor	%g5,	0x16B2,	%l5
loop_2305:
	ldsb	[%l7 + 0x15],	%o0
	sdiv	%l4,	0x1336,	%l6
	movvc	%icc,	%i2,	%l1
	movrlz	%i0,	0x211,	%i6
	fmovscs	%xcc,	%f23,	%f23
	orn	%g6,	%g2,	%i1
	movleu	%xcc,	%i4,	%g7
	membar	0x0F
	fbl,a	%fcc1,	loop_2306
	movrlez	%i5,	0x2A4,	%o2
	orcc	%o6,	%o3,	%i7
	fmovrsne	%g1,	%f7,	%f14
loop_2306:
	fpsub32	%f0,	%f6,	%f20
	bpos	%icc,	loop_2307
	edge16n	%l0,	%l3,	%o5
	edge32ln	%l2,	%o7,	%g3
	ldstub	[%l7 + 0x0F],	%g4
loop_2307:
	tgu	%icc,	0x7
	smulcc	%o1,	%o4,	%g5
	fcmps	%fcc2,	%f28,	%f23
	or	%i3,	%l5,	%l4
	set	0x20, %l1
	ldda	[%l7 + %l1] 0x0c,	%i6
	prefetch	[%l7 + 0x54],	 0x0
	mova	%xcc,	%o0,	%l1
	fornot1	%f14,	%f20,	%f4
	membar	0x65
	stbar
	fpmerge	%f24,	%f8,	%f20
	movle	%icc,	%i0,	%i6
	movrgez	%g6,	0x195,	%i2
	udivcc	%i1,	0x13ED,	%i4
	tsubcc	%g2,	0x0DAE,	%g7
	fxnor	%f20,	%f6,	%f14
	movge	%icc,	%i5,	%o2
	sll	%o6,	%o3,	%i7
	array8	%l0,	%g1,	%o5
	lduw	[%l7 + 0x14],	%l3
	movrne	%o7,	0x039,	%g3
	fcmps	%fcc2,	%f8,	%f13
	fsrc2	%f28,	%f10
	sir	0x1B06
	lduh	[%l7 + 0x36],	%l2
	fand	%f16,	%f28,	%f0
	tneg	%icc,	0x6
	bvc	%xcc,	loop_2308
	be,a,pn	%icc,	loop_2309
	edge32ln	%g4,	%o1,	%g5
	fmovsleu	%xcc,	%f15,	%f21
loop_2308:
	sdiv	%i3,	0x0A8D,	%o4
loop_2309:
	and	%l5,	0x1232,	%l4
	array32	%o0,	%l6,	%i0
	fbuge,a	%fcc3,	loop_2310
	fcmple32	%f28,	%f12,	%i6
	fnot2	%f0,	%f0
	fors	%f19,	%f26,	%f26
loop_2310:
	fmovdvs	%xcc,	%f19,	%f29
	edge8l	%g6,	%l1,	%i1
	fbg,a	%fcc1,	loop_2311
	movle	%icc,	%i4,	%i2
	subcc	%g2,	0x0003,	%i5
	edge32n	%o2,	%g7,	%o3
loop_2311:
	srax	%i7,	0x0B,	%o6
	tneg	%xcc,	0x5
	sdivx	%g1,	0x0134,	%l0
	bpos	loop_2312
	fbo,a	%fcc2,	loop_2313
	xnor	%l3,	0x0625,	%o7
	tneg	%icc,	0x6
loop_2312:
	std	%f6,	[%l7 + 0x60]
loop_2313:
	subccc	%o5,	0x0AA9,	%g3
	movle	%xcc,	%l2,	%o1
	andncc	%g4,	%g5,	%i3
	movne	%xcc,	%l5,	%o4
	bneg,a	%icc,	loop_2314
	fmovsne	%xcc,	%f7,	%f26
	edge8n	%o0,	%l4,	%i0
	fmovsneg	%icc,	%f9,	%f30
loop_2314:
	andncc	%i6,	%l6,	%l1
	fzeros	%f29
	orcc	%g6,	0x0CE3,	%i4
	movcc	%xcc,	%i1,	%i2
	ldstub	[%l7 + 0x7B],	%i5
	movg	%xcc,	%g2,	%g7
	set	0x18, %g4
	lduwa	[%l7 + %g4] 0x81,	%o2
	movneg	%xcc,	%i7,	%o6
	umulcc	%o3,	0x12BB,	%g1
	movre	%l0,	%l3,	%o5
	srax	%o7,	0x08,	%l2
	ldd	[%l7 + 0x28],	%g2
	edge32l	%g4,	%g5,	%i3
	brnz	%l5,	loop_2315
	addccc	%o1,	0x03DD,	%o0
	edge8n	%o4,	%l4,	%i0
	fsrc2s	%f0,	%f3
loop_2315:
	fbg	%fcc2,	loop_2316
	fpsub32	%f28,	%f28,	%f24
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnorcc	%l6,	0x179D,	%l1
loop_2316:
	nop
	wr	%g0,	0x88,	%asi
	lduwa	[%l7 + 0x5C] %asi,	%g6
	fxnors	%f14,	%f4,	%f26
	movg	%xcc,	%i4,	%i6
	alignaddrl	%i1,	%i5,	%i2
	edge16ln	%g7,	%g2,	%o2
	and	%i7,	%o3,	%o6
	ldsh	[%l7 + 0x18],	%l0
	andncc	%l3,	%o5,	%g1
	wr	%g0,	0x89,	%asi
	lduba	[%l7 + 0x72] %asi,	%o7
	fxnors	%f14,	%f29,	%f19
	std	%l2,	[%l7 + 0x28]
	tvs	%xcc,	0x2
	edge32n	%g3,	%g4,	%i3
	fandnot1s	%f1,	%f16,	%f29
	fnors	%f2,	%f28,	%f3
	ldstub	[%l7 + 0x73],	%l5
	xorcc	%g5,	0x094D,	%o1
	mulx	%o0,	%l4,	%i0
	addcc	%l6,	0x162B,	%o4
	movrgez	%g6,	%l1,	%i4
	mulscc	%i6,	0x1C7C,	%i1
	fmovdl	%xcc,	%f0,	%f2
	fcmped	%fcc2,	%f14,	%f0
	orn	%i2,	%i5,	%g2
	taddcctv	%o2,	%i7,	%g7
	orn	%o3,	%l0,	%o6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbl,a	%fcc1,	loop_2317
	fsrc1	%f2,	%f28
	fbul,a	%fcc0,	loop_2318
	taddcc	%l3,	0x038E,	%o5
loop_2317:
	membar	0x03
	and	%g1,	%l2,	%g3
loop_2318:
	movn	%icc,	%g4,	%i3
	edge16ln	%o7,	%l5,	%o1
	siam	0x7
	sllx	%o0,	0x1D,	%g5
	sdiv	%i0,	0x130F,	%l6
	udivcc	%l4,	0x114E,	%o4
	edge16ln	%l1,	%i4,	%i6
	edge32n	%i1,	%g6,	%i2
	tvs	%xcc,	0x7
	fpadd32s	%f18,	%f10,	%f4
	sdivcc	%g2,	0x164D,	%i5
	umulcc	%i7,	0x011A,	%o2
	sth	%o3,	[%l7 + 0x42]
	srlx	%l0,	0x12,	%o6
	fmovrdne	%l3,	%f12,	%f22
	ldub	[%l7 + 0x3E],	%g7
	movge	%icc,	%g1,	%o5
	fcmpgt16	%f0,	%f10,	%l2
	addcc	%g4,	0x1258,	%g3
	alignaddrl	%i3,	%l5,	%o7
	movcc	%icc,	%o0,	%o1
	fbne,a	%fcc1,	loop_2319
	edge32ln	%i0,	%l6,	%l4
	ldd	[%l7 + 0x10],	%o4
	fcmpne16	%f10,	%f24,	%g5
loop_2319:
	movpos	%icc,	%l1,	%i6
	orcc	%i1,	0x1CCA,	%i4
	add	%i2,	0x07E4,	%g6
	wr	%g0,	0x88,	%asi
	lda	[%l7 + 0x28] %asi,	%f9
	fpack32	%f28,	%f6,	%f24
	movvc	%xcc,	%g2,	%i7
	array16	%i5,	%o3,	%l0
	siam	0x5
	tne	%xcc,	0x2
	bvs,a,pt	%icc,	loop_2320
	brgz	%o6,	loop_2321
	mulscc	%o2,	0x0888,	%g7
	set	0x44, %i1
	lduha	[%l7 + %i1] 0x81,	%l3
loop_2320:
	edge8	%g1,	%l2,	%o5
loop_2321:
	andn	%g3,	0x0D0D,	%g4
	brgez	%l5,	loop_2322
	ldstub	[%l7 + 0x7B],	%i3
	fmovrsne	%o7,	%f22,	%f16
	fcmpes	%fcc1,	%f12,	%f11
loop_2322:
	tpos	%xcc,	0x1
	movcs	%icc,	%o0,	%o1
	movgu	%icc,	%i0,	%l4
	fmovdvc	%icc,	%f8,	%f9
	fbne,a	%fcc0,	loop_2323
	xnor	%l6,	%g5,	%l1
	fmovde	%icc,	%f13,	%f3
	fone	%f18
loop_2323:
	fmovdgu	%xcc,	%f20,	%f31
	brlez,a	%o4,	loop_2324
	mulx	%i1,	%i4,	%i2
	orn	%i6,	%g2,	%g6
	fmuld8ulx16	%f22,	%f19,	%f4
loop_2324:
	nop
	membar	#Sync
	wr	%g0,	0xf0,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	movrlez	%i7,	0x2B0,	%i5
	orn	%o3,	0x176C,	%o6
	sllx	%o2,	%l0,	%l3
	edge32l	%g1,	%l2,	%o5
	wr	%g0,	0x88,	%asi
	lduha	[%l7 + 0x34] %asi,	%g3
	orncc	%g7,	%l5,	%i3
	edge32l	%g4,	%o0,	%o7
	tsubcc	%o1,	%i0,	%l6
	movg	%icc,	%l4,	%l1
	or	%o4,	0x0B2A,	%i1
	fbg	%fcc2,	loop_2325
	edge16l	%g5,	%i4,	%i2
	sethi	0x108A,	%i6
	edge16n	%g6,	%i7,	%g2
loop_2325:
	nop
	set	0x40, %o1
	ldda	[%l7 + %o1] 0x81,	%f0
	edge8l	%i5,	%o6,	%o2
	mulx	%o3,	0x01C8,	%l0
	bgu	%icc,	loop_2326
	edge32l	%g1,	%l3,	%l2
	fbule	%fcc1,	loop_2327
	fpack16	%f8,	%f11
loop_2326:
	fandnot1s	%f26,	%f7,	%f20
	fbge,a	%fcc3,	loop_2328
loop_2327:
	fcmped	%fcc3,	%f26,	%f8
	movrne	%o5,	0x08E,	%g7
	brlez,a	%g3,	loop_2329
loop_2328:
	sethi	0x0DFA,	%i3
	ble,a	%xcc,	loop_2330
	fcmpgt32	%f22,	%f26,	%l5
loop_2329:
	xor	%o0,	%g4,	%o1
	fblg	%fcc1,	loop_2331
loop_2330:
	edge16ln	%o7,	%i0,	%l6
	fmovrdlz	%l1,	%f2,	%f10
	andncc	%o4,	%l4,	%g5
loop_2331:
	nop
	setx	loop_2332,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	umulcc	%i1,	0x1089,	%i4
	fmovrdgez	%i6,	%f28,	%f30
	add	%l7,	0x58,	%l6
	wr	%g0,	0x19,	%asi
	casxa	[%l6] 0x19,	%i2,	%i7
loop_2332:
	edge32n	%g6,	%g2,	%o6
	mova	%icc,	%o2,	%o3
	tleu	%icc,	0x4
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
	fexpand	%f26,	%f20
	edge16	%l0,	%i5,	%g1
	movrgez	%l2,	0x360,	%o5
loop_2333:
	alignaddrl	%l3,	%g7,	%i3
	movl	%xcc,	%l5,	%g3
	fmovrdgz	%g4,	%f0,	%f22
	fpack16	%f12,	%f18
	fbne	%fcc2,	loop_2334
	movl	%xcc,	%o1,	%o7
	fbul,a	%fcc0,	loop_2335
	fornot2s	%f8,	%f5,	%f4
loop_2334:
	udiv	%i0,	0x0404,	%l6
	fcmpgt32	%f0,	%f4,	%o0
loop_2335:
	bgu,a,pt	%xcc,	loop_2336
	ldd	[%l7 + 0x50],	%l0
	fmuld8sux16	%f15,	%f26,	%f4
	orcc	%o4,	%g5,	%i1
loop_2336:
	fmovsl	%icc,	%f6,	%f22
	fmovdcs	%icc,	%f11,	%f27
	orncc	%l4,	0x0D1A,	%i4
	udiv	%i2,	0x1A25,	%i7
	tge	%xcc,	0x2
	fcmps	%fcc1,	%f21,	%f21
	brgez	%g6,	loop_2337
	fpack16	%f18,	%f6
	fbl,a	%fcc0,	loop_2338
	bg,a,pt	%icc,	loop_2339
loop_2337:
	fmovdg	%icc,	%f14,	%f24
	wr	%g0,	0x10,	%asi
	stha	%g2,	[%l7 + 0x28] %asi
loop_2338:
	fmovsg	%icc,	%f27,	%f9
loop_2339:
	andcc	%i6,	%o2,	%o6
	fcmpes	%fcc3,	%f13,	%f12
	ldstub	[%l7 + 0x16],	%l0
	orcc	%o3,	%g1,	%l2
	xor	%i5,	0x19DD,	%o5
	bcc,pt	%xcc,	loop_2340
	tsubcc	%g7,	0x073F,	%i3
	edge8n	%l3,	%l5,	%g3
	movle	%xcc,	%g4,	%o7
loop_2340:
	array32	%i0,	%l6,	%o0
	brgez	%l1,	loop_2341
	tcc	%icc,	0x0
	fmovrdlez	%o1,	%f26,	%f18
	and	%o4,	%g5,	%l4
loop_2341:
	bgu,a,pt	%xcc,	loop_2342
	srlx	%i1,	0x0C,	%i4
	sth	%i7,	[%l7 + 0x30]
	addcc	%i2,	0x1E60,	%g2
loop_2342:
	bleu,a	%xcc,	loop_2343
	mulscc	%g6,	0x09F0,	%i6
	tn	%icc,	0x3
	fcmps	%fcc2,	%f11,	%f25
loop_2343:
	sub	%o6,	0x0180,	%o2
	movle	%xcc,	%l0,	%g1
	mova	%xcc,	%l2,	%o3
	andcc	%i5,	0x015D,	%g7
	set	0x55, %l6
	ldstuba	[%l7 + %l6] 0x89,	%o5
	edge32l	%l3,	%l5,	%i3
	tg	%icc,	0x6
	edge8ln	%g4,	%o7,	%g3
	tge	%icc,	0x1
	tvc	%icc,	0x6
	movcs	%icc,	%l6,	%i0
	fornot2s	%f6,	%f7,	%f9
	sdivcc	%o0,	0x1845,	%l1
	add	%l7,	0x50,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%o4
	casa	[%l6] 0x80,	%o4,	%o1
	brnz	%l4,	loop_2344
	addc	%g5,	0x0800,	%i1
	taddcc	%i7,	0x089C,	%i2
	orn	%i4,	%g6,	%i6
loop_2344:
	movpos	%xcc,	%o6,	%g2
	edge8ln	%o2,	%l0,	%l2
	movl	%xcc,	%g1,	%i5
	tpos	%icc,	0x1
	tne	%xcc,	0x1
	fpackfix	%f0,	%f27
	tle	%icc,	0x4
	fbne	%fcc0,	loop_2345
	umulcc	%g7,	0x0689,	%o5
	bvc,a,pt	%xcc,	loop_2346
	addc	%o3,	%l3,	%i3
loop_2345:
	add	%g4,	0x11F3,	%l5
	movgu	%icc,	%g3,	%l6
loop_2346:
	bgu	%icc,	loop_2347
	fmovrslez	%o7,	%f7,	%f16
	stx	%o0,	[%l7 + 0x78]
	movre	%l1,	0x1B8,	%i0
loop_2347:
	fbl	%fcc0,	loop_2348
	movn	%xcc,	%o1,	%o4
	ld	[%l7 + 0x30],	%f8
	srlx	%g5,	0x1E,	%i1
loop_2348:
	nop
	set	0x2C, %i5
	lda	[%l7 + %i5] 0x0c,	%f6
	movvs	%icc,	%i7,	%l4
	bvc,pt	%xcc,	loop_2349
	movcs	%icc,	%i2,	%i4
	edge8ln	%g6,	%o6,	%i6
	bl,pt	%xcc,	loop_2350
loop_2349:
	fmul8x16	%f12,	%f22,	%f12
	fcmpes	%fcc2,	%f27,	%f24
	movrlez	%o2,	0x064,	%g2
loop_2350:
	fbne	%fcc2,	loop_2351
	bneg,a,pn	%icc,	loop_2352
	xor	%l0,	0x0587,	%l2
	tg	%xcc,	0x3
loop_2351:
	array16	%g1,	%g7,	%i5
loop_2352:
	andn	%o3,	0x1898,	%o5
	edge8	%l3,	%g4,	%i3
	fmovsvc	%xcc,	%f8,	%f2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	and	%g3,	%l6,	%o7
	fmovdne	%icc,	%f22,	%f16
	movvc	%icc,	%l5,	%o0
	fbug,a	%fcc1,	loop_2353
	or	%l1,	0x02CB,	%o1
	fmovdn	%icc,	%f3,	%f3
	edge16n	%i0,	%o4,	%g5
loop_2353:
	subcc	%i7,	0x0060,	%i1
	orcc	%i2,	0x1A1B,	%i4
	popc	0x1EC4,	%g6
	bneg	%icc,	loop_2354
	udivcc	%o6,	0x17F9,	%i6
	orncc	%l4,	%o2,	%g2
	movre	%l2,	%l0,	%g1
loop_2354:
	tvc	%xcc,	0x3
	wr	%g0,	0x80,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	umul	%g7,	%i5,	%o3
	movcs	%xcc,	%o5,	%g4
	taddcc	%i3,	%g3,	%l3
	fbne,a	%fcc1,	loop_2355
	fnands	%f17,	%f0,	%f31
	tgu	%xcc,	0x5
	array32	%l6,	%l5,	%o0
loop_2355:
	lduw	[%l7 + 0x18],	%o7
	mulx	%o1,	%l1,	%i0
	edge8ln	%g5,	%o4,	%i7
	popc	0x0B6B,	%i2
	set	0x74, %g3
	lda	[%l7 + %g3] 0x19,	%f1
	smulcc	%i4,	0x14E0,	%g6
	fcmpeq16	%f0,	%f30,	%o6
	fmovdgu	%icc,	%f29,	%f1
	add	%l7,	0x78,	%l6
	wr	%g0,	0x18,	%asi
	casxa	[%l6] 0x18,	%i1,	%i6
	sra	%l4,	0x1A,	%g2
	orn	%l2,	%o2,	%l0
	stbar
	fblg	%fcc1,	loop_2356
	movl	%xcc,	%g7,	%i5
	tsubcc	%o3,	0x1B4C,	%g1
	edge32ln	%o5,	%g4,	%i3
loop_2356:
	array16	%l3,	%g3,	%l6
	wr	%g0,	0x11,	%asi
	ldda	[%l7 + 0x40] %asi,	%l4
	andcc	%o7,	%o0,	%l1
	orcc	%i0,	%g5,	%o1
	flush	%l7 + 0x70
	sllx	%i7,	%o4,	%i4
	fcmps	%fcc1,	%f1,	%f6
	addc	%i2,	0x1B21,	%g6
	movle	%icc,	%i1,	%i6
	set	0x40, %l3
	stda	%f0,	[%l7 + %l3] 0x19
	fcmps	%fcc0,	%f3,	%f21
	mulx	%l4,	0x0B8E,	%g2
	edge16l	%o6,	%l2,	%l0
	fbuge	%fcc2,	loop_2357
	fsrc1s	%f28,	%f0
	sth	%g7,	[%l7 + 0x14]
	movn	%icc,	%i5,	%o2
loop_2357:
	mulx	%o3,	0x07DD,	%g1
	wr	%g0,	0x19,	%asi
	lduwa	[%l7 + 0x7C] %asi,	%g4
	tvc	%icc,	0x2
	edge32n	%o5,	%i3,	%g3
	sth	%l6,	[%l7 + 0x50]
	fmovrsgz	%l5,	%f2,	%f30
	or	%l3,	%o0,	%o7
	tne	%icc,	0x5
	movrgz	%l1,	%g5,	%o1
	tsubcc	%i7,	0x1D4D,	%i0
	movrgz	%o4,	0x3C4,	%i2
	srlx	%i4,	%i1,	%g6
	brz,a	%l4,	loop_2358
	fcmpeq32	%f10,	%f0,	%g2
	srax	%o6,	0x0B,	%i6
	add	%l7,	0x0C,	%l6
	wr	%g0,	0x18,	%asi
	lda	[%l6] %asi,	%l2
	casa	[%l6] 0x18,	%l2,	%g7
loop_2358:
	nop
	set	0x70, %l2
	stw	%i5,	[%l7 + %l2]
	addc	%o2,	0x053F,	%o3
	fornot2	%f18,	%f24,	%f14
	st	%f18,	[%l7 + 0x1C]
	bge,a,pt	%icc,	loop_2359
	move	%icc,	%l0,	%g1
	andn	%g4,	0x0E13,	%i3
	edge8ln	%g3,	%o5,	%l6
loop_2359:
	fbu,a	%fcc0,	loop_2360
	tge	%xcc,	0x1
	sll	%l5,	0x18,	%o0
	movpos	%xcc,	%l3,	%o7
loop_2360:
	movgu	%icc,	%g5,	%o1
	fors	%f7,	%f26,	%f28
	edge8	%i7,	%i0,	%l1
	ba,a,pn	%xcc,	loop_2361
	movgu	%icc,	%o4,	%i4
	subcc	%i2,	%i1,	%g6
	popc	%g2,	%o6
loop_2361:
	fxnor	%f2,	%f24,	%f4
	bg	%icc,	loop_2362
	fone	%f18
	wr	%g0,	0x19,	%asi
	lduba	[%l7 + 0x4D] %asi,	%l4
loop_2362:
	sir	0x1B4A
	fpack32	%f20,	%f20,	%f30
	movvc	%icc,	%i6,	%l2
	mulscc	%i5,	%o2,	%g7
	and	%l0,	%o3,	%g1
	movrlz	%i3,	%g4,	%o5
	fbul,a	%fcc0,	loop_2363
	movne	%xcc,	%l6,	%g3
	edge16ln	%o0,	%l3,	%l5
	set	0x78, %l4
	stda	%o6,	[%l7 + %l4] 0xe3
	membar	#Sync
loop_2363:
	subccc	%o1,	0x0B80,	%g5
	edge8ln	%i7,	%i0,	%l1
	movn	%xcc,	%i4,	%o4
	umul	%i1,	%g6,	%g2
	nop
	setx loop_2364, %l0, %l1
	jmpl %l1, %o6
	alignaddr	%l4,	%i2,	%l2
	movge	%xcc,	%i5,	%o2
	fmovsleu	%icc,	%f9,	%f28
loop_2364:
	tgu	%icc,	0x7
	edge32n	%g7,	%l0,	%i6
	alignaddr	%g1,	%o3,	%g4
	fmovsvs	%xcc,	%f2,	%f12
	andcc	%i3,	%o5,	%g3
	fmovdgu	%icc,	%f13,	%f7
	edge8n	%l6,	%o0,	%l3
	edge16	%l5,	%o7,	%g5
	tge	%xcc,	0x4
	std	%f12,	[%l7 + 0x68]
	movvs	%xcc,	%o1,	%i0
	array32	%i7,	%l1,	%i4
	movne	%icc,	%i1,	%g6
	edge32n	%g2,	%o6,	%l4
	fbge	%fcc1,	loop_2365
	tcc	%icc,	0x2
	xor	%i2,	0x045E,	%o4
	fandnot2s	%f4,	%f30,	%f29
loop_2365:
	ld	[%l7 + 0x7C],	%f1
	umul	%i5,	%l2,	%o2
	sethi	0x0464,	%g7
	nop
	set	0x7A, %g7
	lduh	[%l7 + %g7],	%l0
	orn	%g1,	%o3,	%g4
	set	0x0C, %l5
	ldstuba	[%l7 + %l5] 0x0c,	%i6
	siam	0x6
	tcc	%xcc,	0x0
	tneg	%xcc,	0x7
	set	0x7C, %g1
	lduwa	[%l7 + %g1] 0x80,	%i3
	andn	%o5,	%l6,	%g3
	movneg	%xcc,	%l3,	%l5
	movg	%icc,	%o0,	%o7
	array16	%o1,	%g5,	%i7
	fmovscc	%icc,	%f30,	%f21
	ld	[%l7 + 0x64],	%f24
	ld	[%l7 + 0x7C],	%f20
	fbl	%fcc0,	loop_2366
	mulscc	%l1,	%i0,	%i1
	tvs	%xcc,	0x7
	edge16n	%i4,	%g6,	%o6
loop_2366:
	andncc	%g2,	%i2,	%o4
	bcc,pn	%icc,	loop_2367
	fbge	%fcc2,	loop_2368
	sub	%l4,	%l2,	%o2
	movle	%icc,	%g7,	%l0
loop_2367:
	tl	%xcc,	0x2
loop_2368:
	sethi	0x0C9A,	%i5
	nop
	setx	loop_2369,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fmovsvs	%xcc,	%f5,	%f5
	edge8	%g1,	%o3,	%g4
	tn	%xcc,	0x0
loop_2369:
	fandnot2	%f4,	%f8,	%f30
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbue,a	%fcc2,	loop_2370
	sdivx	%i3,	0x16E7,	%i6
	fmovs	%f14,	%f29
	mulx	%l6,	%o5,	%g3
loop_2370:
	nop
	wr	%g0,	0x10,	%asi
	ldstuba	[%l7 + 0x47] %asi,	%l3
	taddcctv	%o0,	%l5,	%o1
	edge32n	%g5,	%o7,	%i7
	fexpand	%f0,	%f20
	movne	%icc,	%l1,	%i1
	be,pn	%icc,	loop_2371
	fsrc1	%f14,	%f18
	fornot2	%f0,	%f14,	%f18
	fmovrdgez	%i4,	%f6,	%f20
loop_2371:
	orn	%i0,	0x0BE2,	%g6
	edge16n	%o6,	%i2,	%o4
	movrlez	%g2,	%l4,	%o2
	alignaddrl	%g7,	%l2,	%i5
	smulcc	%l0,	0x1CAE,	%g1
	lduh	[%l7 + 0x70],	%o3
	taddcc	%g4,	0x0BC9,	%i3
	bpos,a	loop_2372
	popc	%i6,	%o5
	set	0x40, %o7
	ldda	[%l7 + %o7] 0x11,	%f0
loop_2372:
	movne	%xcc,	%g3,	%l6
	fxnor	%f22,	%f4,	%f18
	array8	%o0,	%l3,	%o1
	orncc	%g5,	%o7,	%i7
	ble,a,pt	%icc,	loop_2373
	fbne,a	%fcc2,	loop_2374
	tvc	%xcc,	0x6
	movrgez	%l1,	%i1,	%l5
loop_2373:
	edge16l	%i0,	%g6,	%o6
loop_2374:
	xor	%i2,	0x0373,	%o4
	fxors	%f15,	%f11,	%f12
	movgu	%xcc,	%g2,	%i4
	bpos	%xcc,	loop_2375
	tleu	%xcc,	0x2
	xor	%l4,	%g7,	%l2
	fabss	%f30,	%f20
loop_2375:
	nop
	wr	%g0,	0x89,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	brnz,a	%i5,	loop_2376
	std	%o2,	[%l7 + 0x48]
	sdivcc	%g1,	0x15FE,	%o3
	fpsub32s	%f0,	%f9,	%f17
loop_2376:
	edge16n	%l0,	%i3,	%g4
	stbar
	fmovrslz	%o5,	%f30,	%f0
	fmovrslez	%i6,	%f12,	%f2
	movn	%xcc,	%g3,	%o0
	tcc	%xcc,	0x3
	tvc	%xcc,	0x0
	ldd	[%l7 + 0x08],	%f26
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	taddcc	%l6,	0x1FCE,	%l3
	movleu	%icc,	%o1,	%o7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sllx	%i7,	%g5,	%i1
	sdivcc	%l1,	0x071A,	%i0
	tcc	%xcc,	0x3
	smulcc	%l5,	0x1C59,	%g6
	udivcc	%i2,	0x03E7,	%o6
	andcc	%g2,	%i4,	%o4
	taddcc	%g7,	%l4,	%l2
	srl	%o2,	%g1,	%i5
	movrgz	%l0,	%i3,	%g4
	fpadd16s	%f17,	%f24,	%f9
	movpos	%icc,	%o5,	%o3
	movrgez	%g3,	%o0,	%i6
	xor	%l3,	0x057E,	%l6
	fmovscc	%xcc,	%f16,	%f7
	te	%icc,	0x6
	edge16	%o7,	%i7,	%g5
	fmovd	%f6,	%f24
	add	%l7,	0x74,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] %asi,	%i1,	%l1
	fpadd32s	%f1,	%f18,	%f30
	tge	%icc,	0x1
	umulcc	%i0,	0x0633,	%o1
	tsubcc	%g6,	0x1A13,	%i2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrlez	%l5,	0x2C2,	%o6
	subccc	%g2,	0x1B2C,	%i4
	fblg,a	%fcc1,	loop_2377
	bleu,a	%xcc,	loop_2378
	srax	%g7,	%l4,	%l2
	add	%l7,	0x48,	%l6
	wr	%g0,	0x11,	%asi
	lda	[%l6] %asi,	%o4
	casa	[%l6] 0x11,	%o4,	%o2
loop_2377:
	edge16n	%g1,	%i5,	%l0
loop_2378:
	fble,a	%fcc0,	loop_2379
	xorcc	%i3,	%o5,	%g4
	fmovdle	%icc,	%f12,	%f21
	fmovd	%f24,	%f20
loop_2379:
	ldd	[%l7 + 0x78],	%o2
	fnands	%f19,	%f9,	%f21
	set	0x63, %o0
	ldsba	[%l7 + %o0] 0x81,	%g3
	fmovrdgz	%i6,	%f26,	%f10
	fmovrsgez	%o0,	%f11,	%f30
	fmovdvc	%icc,	%f14,	%f17
	movgu	%icc,	%l3,	%o7
	bcs,a,pn	%icc,	loop_2380
	mova	%xcc,	%i7,	%l6
	mulscc	%i1,	%l1,	%i0
	taddcctv	%g5,	%o1,	%g6
loop_2380:
	sra	%i2,	0x02,	%l5
	fcmpne16	%f18,	%f20,	%g2
	edge32ln	%o6,	%g7,	%l4
	stw	%i4,	[%l7 + 0x68]
	sir	0x13A3
	fba,a	%fcc0,	loop_2381
	orncc	%l2,	%o2,	%g1
	fmovscs	%icc,	%f0,	%f28
	membar	0x10
loop_2381:
	subc	%o4,	0x16D8,	%l0
	bleu,a	%xcc,	loop_2382
	tvc	%xcc,	0x3
	bg,a	%xcc,	loop_2383
	brlz	%i3,	loop_2384
loop_2382:
	and	%i5,	0x128C,	%g4
	wr	%g0,	0x1f,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
loop_2383:
	bneg,pn	%icc,	loop_2385
loop_2384:
	tne	%icc,	0x6
	set	0x21, %g5
	ldstuba	[%l7 + %g5] 0x88,	%o3
loop_2385:
	movpos	%xcc,	%g3,	%i6
	fmovdn	%xcc,	%f0,	%f16
	add	%l7,	0x40,	%l6
	wr	%g0,	0x19,	%asi
	casa	[%l6] 0x19,	%o5,	%l3
	bneg,a	%icc,	loop_2386
	fcmpeq16	%f30,	%f16,	%o0
	movrlz	%o7,	%i7,	%i1
	std	%l0,	[%l7 + 0x78]
loop_2386:
	tne	%icc,	0x5
	fabss	%f25,	%f5
	smulcc	%l6,	0x1D61,	%i0
	sll	%g5,	0x05,	%o1
	edge8n	%g6,	%l5,	%i2
	fmovrsgz	%g2,	%f10,	%f1
	fbuge,a	%fcc1,	loop_2387
	fmovdpos	%xcc,	%f10,	%f18
	fmovs	%f22,	%f13
	array8	%o6,	%g7,	%i4
loop_2387:
	sir	0x1016
	fbg	%fcc0,	loop_2388
	ldub	[%l7 + 0x11],	%l2
	set	0x60, %i0
	stda	%o2,	[%l7 + %i0] 0x22
	membar	#Sync
loop_2388:
	umulcc	%g1,	%o4,	%l4
	fmovdcs	%icc,	%f24,	%f23
	andcc	%l0,	0x0A9D,	%i3
	edge8n	%i5,	%o3,	%g3
	sllx	%g4,	0x0D,	%o5
	movcc	%icc,	%i6,	%o0
	movcc	%xcc,	%l3,	%i7
	mulscc	%o7,	0x0A4E,	%i1
	ta	%icc,	0x2
	edge32ln	%l6,	%l1,	%g5
	bge	%icc,	loop_2389
	srax	%o1,	0x15,	%g6
	ldstub	[%l7 + 0x3D],	%l5
	tleu	%xcc,	0x5
loop_2389:
	movrgz	%i0,	0x3DD,	%g2
	fsrc2s	%f18,	%f26
	fnor	%f0,	%f26,	%f12
	udivx	%o6,	0x176E,	%g7
	edge8ln	%i4,	%i2,	%l2
	edge32l	%o2,	%o4,	%l4
	fones	%f28
	fmovdne	%xcc,	%f21,	%f24
	set	0x0C, %i2
	lduha	[%l7 + %i2] 0x80,	%l0
	lduh	[%l7 + 0x0E],	%i3
	xor	%i5,	%g1,	%g3
	alignaddrl	%o3,	%g4,	%i6
	bneg,pn	%icc,	loop_2390
	tleu	%icc,	0x0
	udivx	%o0,	0x001F,	%o5
	alignaddrl	%i7,	%l3,	%i1
loop_2390:
	fmovrslez	%o7,	%f20,	%f6
	bcc	loop_2391
	movcs	%icc,	%l6,	%g5
	fbu,a	%fcc3,	loop_2392
	edge8l	%o1,	%g6,	%l5
loop_2391:
	subccc	%l1,	0x1B18,	%g2
	sdivx	%i0,	0x0F74,	%o6
loop_2392:
	fmovrdgz	%i4,	%f4,	%f26
	tle	%xcc,	0x0
	umul	%i2,	%l2,	%g7
	stx	%o4,	[%l7 + 0x58]
	movrgez	%l4,	0x16E,	%l0
	ldd	[%l7 + 0x60],	%i2
	fcmpne16	%f26,	%f10,	%o2
	srlx	%i5,	0x1E,	%g3
	addc	%o3,	%g4,	%i6
	movn	%xcc,	%o0,	%o5
	array16	%i7,	%g1,	%l3
	set	0x4C, %o3
	lduwa	[%l7 + %o3] 0x11,	%o7
	fnot2s	%f7,	%f25
	movrgz	%l6,	0x067,	%g5
	addccc	%o1,	%g6,	%l5
	movcc	%icc,	%l1,	%g2
	edge32n	%i0,	%o6,	%i1
	xorcc	%i4,	0x1F62,	%i2
	edge32	%g7,	%l2,	%l4
	movcs	%xcc,	%o4,	%l0
	fcmple16	%f2,	%f26,	%o2
	bneg,pn	%xcc,	loop_2393
	movge	%icc,	%i5,	%g3
	ldd	[%l7 + 0x28],	%f8
	array8	%o3,	%g4,	%i6
loop_2393:
	edge16	%i3,	%o0,	%i7
	fba	%fcc1,	loop_2394
	addccc	%g1,	0x1F5D,	%o5
	tcc	%icc,	0x1
	fmovrsgz	%o7,	%f30,	%f24
loop_2394:
	srl	%l6,	%g5,	%l3
	fmovdcc	%xcc,	%f17,	%f22
	fabss	%f31,	%f22
	fmovrdgz	%g6,	%f14,	%f8
	fmovsneg	%xcc,	%f27,	%f8
	add	%o1,	%l1,	%g2
	set	0x40, %i7
	stda	%f16,	[%l7 + %i7] 0xf9
	membar	#Sync
	tne	%icc,	0x4
	membar	0x62
	tsubcctv	%l5,	0x171C,	%o6
	subccc	%i1,	%i4,	%i2
	taddcctv	%g7,	0x0A69,	%i0
	umul	%l4,	0x0770,	%o4
	fmovrslz	%l0,	%f14,	%f11
	ta	%icc,	0x3
	bleu	loop_2395
	movvc	%icc,	%o2,	%l2
	lduh	[%l7 + 0x44],	%g3
	andcc	%o3,	0x00DE,	%g4
loop_2395:
	membar	0x5E
	addc	%i6,	0x0315,	%i5
	or	%i3,	0x1DF8,	%o0
	std	%f22,	[%l7 + 0x20]
	xnorcc	%g1,	%i7,	%o5
	tsubcc	%o7,	%l6,	%g5
	te	%xcc,	0x2
	fmovscc	%xcc,	%f22,	%f10
	movre	%g6,	%o1,	%l3
	fxnor	%f0,	%f4,	%f26
	sdivcc	%g2,	0x1285,	%l1
	movge	%icc,	%l5,	%o6
	set	0x30, %o4
	ldswa	[%l7 + %o4] 0x19,	%i1
	addccc	%i2,	0x1E8A,	%g7
	movleu	%xcc,	%i4,	%l4
	wr	%g0,	0x18,	%asi
	lduba	[%l7 + 0x0C] %asi,	%i0
	set	0x38, %i6
	prefetcha	[%l7 + %i6] 0x04,	 0x3
	fmovdl	%xcc,	%f20,	%f18
	fxnor	%f0,	%f18,	%f2
	mulscc	%l0,	0x0FEC,	%o2
	edge8ln	%l2,	%o3,	%g3
	fmovsa	%xcc,	%f8,	%f10
	for	%f28,	%f26,	%f20
	fsrc2	%f20,	%f4
	ldd	[%l7 + 0x58],	%g4
	brz,a	%i6,	loop_2396
	tge	%icc,	0x7
	movcs	%xcc,	%i5,	%i3
	array8	%g1,	%o0,	%i7
loop_2396:
	nop
	set	0x48, %g6
	stda	%o6,	[%l7 + %g6] 0x18
	fandnot1	%f0,	%f16,	%f28
	addc	%o5,	0x0706,	%l6
	set	0x40, %g2
	stda	%f0,	[%l7 + %g2] 0x19
	fmul8x16	%f0,	%f0,	%f30
	set	0x18, %o2
	lduwa	[%l7 + %o2] 0x15,	%g5
	sdivcc	%o1,	0x0AA3,	%l3
	ldx	[%l7 + 0x08],	%g6
	movrgz	%g2,	0x1E6,	%l1
	prefetch	[%l7 + 0x54],	 0x0
	movne	%icc,	%o6,	%l5
	flush	%l7 + 0x54
	subc	%i2,	0x13A5,	%g7
	ldsw	[%l7 + 0x58],	%i4
	fbuge	%fcc1,	loop_2397
	tvc	%icc,	0x0
	prefetch	[%l7 + 0x3C],	 0x0
	ldd	[%l7 + 0x48],	%f8
loop_2397:
	movge	%icc,	%l4,	%i1
	fsrc1s	%f29,	%f15
	for	%f30,	%f10,	%f0
	sdivx	%i0,	0x1741,	%l0
	ldsh	[%l7 + 0x64],	%o4
	ba,pn	%xcc,	loop_2398
	sllx	%o2,	%o3,	%g3
	be,a	loop_2399
	bcc,a,pn	%icc,	loop_2400
loop_2398:
	edge32ln	%g4,	%l2,	%i5
	edge32n	%i6,	%g1,	%o0
loop_2399:
	nop
	wr	%g0,	0x04,	%asi
	lduwa	[%l7 + 0x0C] %asi,	%i7
loop_2400:
	fxnor	%f0,	%f16,	%f16
	bn	%icc,	loop_2401
	srax	%o7,	%i3,	%o5
	tvs	%xcc,	0x7
	tvs	%xcc,	0x3
loop_2401:
	nop
	wr	%g0,	0x20,	%asi
	ldxa	[%g0 + 0x0] %asi,	%g5
	nop
	setx	loop_2402,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	brlez	%o1,	loop_2403
	movrlz	%l6,	0x18C,	%g6
	ld	[%l7 + 0x38],	%f7
loop_2402:
	fnands	%f26,	%f2,	%f29
loop_2403:
	movvc	%xcc,	%g2,	%l1
	movpos	%icc,	%o6,	%l5
	swap	[%l7 + 0x40],	%i2
	fcmpeq32	%f12,	%f30,	%g7
	tvs	%icc,	0x6
	fbe	%fcc1,	loop_2404
	fmovsa	%icc,	%f11,	%f28
	and	%i4,	%l3,	%l4
	taddcctv	%i0,	%l0,	%o4
loop_2404:
	nop
	set	0x58, %o6
	ldswa	[%l7 + %o6] 0x89,	%o2
	movrne	%i1,	%g3,	%g4
	tpos	%icc,	0x1
	or	%l2,	0x1273,	%o3
	fmovde	%xcc,	%f5,	%f8
	fcmpne16	%f2,	%f6,	%i5
	tpos	%icc,	0x4
	movvs	%xcc,	%i6,	%o0
	fmovsle	%icc,	%f5,	%f4
	fmovdpos	%icc,	%f9,	%f6
	bgu	%icc,	loop_2405
	bneg,a,pn	%xcc,	loop_2406
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tl	%xcc,	0x3
loop_2405:
	nop
	set	0x40, %i3
	swapa	[%l7 + %i3] 0x80,	%g1
loop_2406:
	nop
	set	0x26, %l0
	stha	%o7,	[%l7 + %l0] 0x18
	or	%i7,	%i3,	%o5
	nop
	setx	loop_2407,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	ldsw	[%l7 + 0x6C],	%g5
	popc	%o1,	%g6
	subc	%g2,	%l6,	%o6
loop_2407:
	fbn,a	%fcc3,	loop_2408
	fbe	%fcc2,	loop_2409
	xorcc	%l1,	%i2,	%l5
	membar	0x24
loop_2408:
	tpos	%icc,	0x3
loop_2409:
	fbe,a	%fcc3,	loop_2410
	movcc	%icc,	%i4,	%g7
	movgu	%icc,	%l3,	%l4
	fbug	%fcc3,	loop_2411
loop_2410:
	fcmpd	%fcc0,	%f24,	%f6
	bl,pn	%icc,	loop_2412
	std	%i0,	[%l7 + 0x28]
loop_2411:
	array32	%l0,	%o4,	%o2
	fbge	%fcc0,	loop_2413
loop_2412:
	taddcctv	%g3,	0x063A,	%i1
	wr	%g0,	0x80,	%asi
	ldda	[%l7 + 0x20] %asi,	%l2
loop_2413:
	nop
	setx	loop_2414,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	udivx	%g4,	0x0786,	%i5
	fbne,a	%fcc2,	loop_2415
	sub	%o3,	0x192B,	%o0
loop_2414:
	sir	0x00CB
	set	0x09, %i4
	ldstuba	[%l7 + %i4] 0x18,	%g1
loop_2415:
	sir	0x1DDB
	tpos	%icc,	0x7
	edge16	%i6,	%i7,	%i3
	edge16	%o5,	%g5,	%o1
	fsrc2s	%f13,	%f7
	movrlez	%o7,	0x173,	%g2
	movn	%xcc,	%g6,	%l6
	wr	%g0,	0x21,	%asi
	stxa	%o6,	[%g0 + 0x108] %asi
	sub	%i2,	%l5,	%l1
	tsubcc	%g7,	%l3,	%l4
	orn	%i4,	0x18CA,	%i0
	srax	%l0,	%o4,	%g3
	smul	%o2,	0x1EBA,	%i1
	sir	0x03CF
	taddcctv	%g4,	0x0B06,	%i5
	tn	%icc,	0x0
	fsrc1	%f28,	%f10
	sdiv	%o3,	0x0730,	%o0
	edge32n	%g1,	%l2,	%i7
	edge16ln	%i3,	%o5,	%g5
	bvs	loop_2416
	bgu	%icc,	loop_2417
	umul	%i6,	%o7,	%o1
	addcc	%g6,	%g2,	%o6
loop_2416:
	nop
	set	0x30, %l1
	stxa	%i2,	[%l7 + %l1] 0x23
	membar	#Sync
loop_2417:
	fmovscs	%xcc,	%f0,	%f29
	edge8l	%l6,	%l5,	%l1
	stbar
	stbar
	bvs	loop_2418
	tle	%xcc,	0x3
	ta	%icc,	0x5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2418:
	fsrc1	%f16,	%f30
	movleu	%icc,	%g7,	%l3
	alignaddrl	%i4,	%i0,	%l4
	srl	%o4,	%g3,	%l0
	fmovdne	%xcc,	%f8,	%f13
	tpos	%icc,	0x2
	edge8n	%i1,	%g4,	%i5
	nop
	set	0x23, %g4
	stb	%o2,	[%l7 + %g4]
	set	0x3E, %i1
	ldsha	[%l7 + %i1] 0x80,	%o3
	brgez	%o0,	loop_2419
	tl	%xcc,	0x2
	udiv	%g1,	0x0FC9,	%i7
	orn	%i3,	%o5,	%g5
loop_2419:
	subccc	%i6,	%l2,	%o1
	or	%o7,	0x040B,	%g2
	brgez,a	%o6,	loop_2420
	movneg	%icc,	%g6,	%i2
	bgu	%xcc,	loop_2421
	fcmpeq32	%f28,	%f26,	%l6
loop_2420:
	sir	0x09DF
	bpos,a,pn	%xcc,	loop_2422
loop_2421:
	tge	%xcc,	0x3
	edge8l	%l1,	%g7,	%l3
	movvs	%icc,	%i4,	%l5
loop_2422:
	edge16	%l4,	%i0,	%o4
	brz,a	%g3,	loop_2423
	brz	%i1,	loop_2424
	bl	loop_2425
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2423:
	movrgez	%g4,	0x01A,	%l0
loop_2424:
	popc	0x1994,	%o2
loop_2425:
	fpsub32s	%f6,	%f0,	%f15
	wr	%g0,	0x81,	%asi
	lduba	[%l7 + 0x0C] %asi,	%o3
	edge32ln	%i5,	%o0,	%i7
	mova	%xcc,	%i3,	%g1
	movneg	%xcc,	%o5,	%i6
	array8	%g5,	%o1,	%o7
	orcc	%l2,	%o6,	%g2
	addc	%g6,	%l6,	%i2
	tvc	%icc,	0x5
	addc	%l1,	%g7,	%l3
	fpack32	%f0,	%f16,	%f4
	fsrc1	%f0,	%f20
	and	%i4,	0x16C8,	%l4
	array16	%l5,	%o4,	%g3
	orncc	%i1,	%g4,	%i0
	umulcc	%l0,	0x1DF1,	%o2
	fmuld8ulx16	%f6,	%f22,	%f26
	stbar
	fmovsleu	%icc,	%f5,	%f10
	fornot1s	%f18,	%f25,	%f2
	tpos	%icc,	0x7
	addcc	%i5,	0x0645,	%o0
	movne	%xcc,	%o3,	%i7
	and	%i3,	0x041D,	%o5
	prefetch	[%l7 + 0x64],	 0x0
	call	loop_2426
	bcc,pn	%xcc,	loop_2427
	fbg	%fcc2,	loop_2428
	srax	%i6,	0x15,	%g5
loop_2426:
	orcc	%g1,	0x1760,	%o1
loop_2427:
	fcmpeq32	%f12,	%f22,	%l2
loop_2428:
	subcc	%o6,	%g2,	%o7
	tne	%icc,	0x7
	movneg	%xcc,	%g6,	%l6
	be,a,pn	%icc,	loop_2429
	sdiv	%l1,	0x0BF4,	%i2
	tvc	%icc,	0x3
	smul	%l3,	0x0154,	%g7
loop_2429:
	tneg	%xcc,	0x1
	fbg	%fcc3,	loop_2430
	ta	%icc,	0x1
	edge32	%i4,	%l5,	%l4
	fcmpgt16	%f24,	%f18,	%g3
loop_2430:
	sethi	0x1EF7,	%i1
	stbar
	andcc	%o4,	%i0,	%l0
	addc	%g4,	0x0BDA,	%i5
	fmovscc	%xcc,	%f28,	%f27
	fmovsn	%xcc,	%f2,	%f24
	fbul	%fcc2,	loop_2431
	add	%o0,	0x0816,	%o3
	stx	%o2,	[%l7 + 0x08]
	fcmped	%fcc3,	%f0,	%f18
loop_2431:
	stx	%i7,	[%l7 + 0x48]
	movrlz	%i3,	0x0A2,	%o5
	srl	%i6,	0x03,	%g5
	srlx	%g1,	0x08,	%o1
	fands	%f22,	%f21,	%f17
	st	%f27,	[%l7 + 0x3C]
	edge8ln	%l2,	%g2,	%o7
	bne	%xcc,	loop_2432
	movvc	%xcc,	%g6,	%o6
	edge16	%l1,	%l6,	%l3
	bg,a	%xcc,	loop_2433
loop_2432:
	movcs	%icc,	%g7,	%i4
	fmovsvs	%xcc,	%f31,	%f18
	tvc	%icc,	0x0
loop_2433:
	fabss	%f21,	%f14
	udivx	%i2,	0x0779,	%l5
	movrlz	%g3,	%l4,	%i1
	bleu	loop_2434
	edge8n	%i0,	%o4,	%g4
	fxors	%f22,	%f26,	%f28
	sethi	0x09F1,	%i5
loop_2434:
	fmovdvc	%xcc,	%f7,	%f22
	mulscc	%l0,	%o0,	%o3
	fcmpgt32	%f6,	%f6,	%o2
	movn	%xcc,	%i7,	%i3
	movcs	%icc,	%o5,	%g5
	tleu	%icc,	0x5
	brlez,a	%i6,	loop_2435
	edge32ln	%o1,	%g1,	%g2
	sdivx	%l2,	0x0198,	%g6
	alignaddr	%o7,	%o6,	%l1
loop_2435:
	edge16l	%l3,	%l6,	%g7
	array32	%i2,	%i4,	%l5
	smul	%g3,	%l4,	%i0
	tvc	%xcc,	0x5
	fmovdle	%icc,	%f25,	%f24
	fcmps	%fcc0,	%f24,	%f4
	stbar
	movn	%icc,	%i1,	%g4
	ldstub	[%l7 + 0x62],	%i5
	andcc	%l0,	0x10FA,	%o0
	fmovdle	%icc,	%f14,	%f20
	srl	%o4,	%o2,	%i7
	bpos,a,pn	%icc,	loop_2436
	nop
	setx loop_2437, %l0, %l1
	jmpl %l1, %i3
	fmovdcc	%xcc,	%f24,	%f3
	be,a,pn	%xcc,	loop_2438
loop_2436:
	brnz	%o3,	loop_2439
loop_2437:
	edge16	%o5,	%i6,	%o1
	udiv	%g1,	0x14E4,	%g5
loop_2438:
	umulcc	%g2,	0x15D8,	%l2
loop_2439:
	fsrc2	%f18,	%f2
	tg	%xcc,	0x7
	sth	%g6,	[%l7 + 0x14]
	fblg,a	%fcc3,	loop_2440
	fmovsle	%xcc,	%f6,	%f18
	set	0x5B, %o5
	stba	%o7,	[%l7 + %o5] 0xe3
	membar	#Sync
loop_2440:
	edge8l	%o6,	%l1,	%l6
	fcmpes	%fcc1,	%f19,	%f15
	sll	%l3,	%g7,	%i2
	addc	%l5,	0x1FC3,	%g3
	orn	%i4,	0x0FCF,	%i0
	movcs	%xcc,	%l4,	%g4
	and	%i5,	%i1,	%o0
	movneg	%icc,	%l0,	%o2
	smulcc	%i7,	%o4,	%i3
	bl,a	%icc,	loop_2441
	xor	%o3,	%o5,	%i6
	fbe	%fcc3,	loop_2442
	bl,pn	%xcc,	loop_2443
loop_2441:
	ba,a,pn	%xcc,	loop_2444
	nop
	setx	loop_2445,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_2442:
	fmuld8sux16	%f4,	%f0,	%f10
loop_2443:
	tg	%xcc,	0x6
loop_2444:
	mulscc	%o1,	0x07EF,	%g1
loop_2445:
	tg	%icc,	0x2
	stb	%g5,	[%l7 + 0x48]
	wr	%g0,	0x19,	%asi
	ldswa	[%l7 + 0x3C] %asi,	%g2
	stx	%g6,	[%l7 + 0x38]
	be,a,pt	%icc,	loop_2446
	xnor	%o7,	%o6,	%l1
	fmuld8ulx16	%f9,	%f29,	%f30
	fbg	%fcc3,	loop_2447
loop_2446:
	movpos	%xcc,	%l2,	%l3
	move	%xcc,	%l6,	%g7
	ldd	[%l7 + 0x20],	%l4
loop_2447:
	add	%g3,	0x1B9A,	%i4
	movrne	%i0,	0x2E9,	%l4
	fbn	%fcc1,	loop_2448
	edge8ln	%g4,	%i2,	%i1
	sdivx	%i5,	0x0965,	%l0
	set	0x48, %l6
	stxa	%o0,	[%l7 + %l6] 0x2f
	membar	#Sync
loop_2448:
	movge	%xcc,	%o2,	%o4
	nop
	set	0x50, %i5
	ldd	[%l7 + %i5],	%i2
	addc	%o3,	%o5,	%i7
	stw	%o1,	[%l7 + 0x38]
	st	%f7,	[%l7 + 0x5C]
	tle	%xcc,	0x4
	movcc	%xcc,	%i6,	%g5
	xnor	%g1,	0x0DE6,	%g2
	sdivcc	%g6,	0x0D5D,	%o7
	tleu	%xcc,	0x1
	fblg,a	%fcc3,	loop_2449
	subc	%l1,	%o6,	%l3
	fmovsn	%xcc,	%f31,	%f10
	fsrc1s	%f4,	%f7
loop_2449:
	tsubcctv	%l2,	%l6,	%g7
	xnorcc	%g3,	%l5,	%i0
	fpackfix	%f18,	%f25
	ldx	[%l7 + 0x08],	%i4
	movrlz	%g4,	%l4,	%i1
	fmovdg	%icc,	%f7,	%f28
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mova	%icc,	%i5,	%l0
	fcmpd	%fcc2,	%f16,	%f28
	fbn,a	%fcc0,	loop_2450
	movvc	%icc,	%i2,	%o2
	mulx	%o4,	0x06F9,	%o0
	membar	0x48
loop_2450:
	fcmpeq32	%f12,	%f16,	%o3
	edge16n	%i3,	%o5,	%o1
	movcc	%xcc,	%i7,	%i6
	umul	%g5,	0x0893,	%g1
	tcc	%xcc,	0x7
	bgu,pt	%icc,	loop_2451
	fble,a	%fcc2,	loop_2452
	fmovdneg	%icc,	%f21,	%f5
	ldsw	[%l7 + 0x5C],	%g6
loop_2451:
	udivx	%o7,	0x0494,	%l1
loop_2452:
	bvc,a	loop_2453
	sdivcc	%g2,	0x120A,	%o6
	fmovrdlez	%l3,	%f26,	%f6
	lduw	[%l7 + 0x1C],	%l2
loop_2453:
	nop
	set	0x6D, %o1
	ldub	[%l7 + %o1],	%g7
	edge8n	%g3,	%l5,	%l6
	fmovscc	%xcc,	%f10,	%f23
	mova	%xcc,	%i4,	%i0
	edge8	%g4,	%l4,	%i5
	addcc	%l0,	0x0748,	%i1
	and	%i2,	0x117F,	%o4
	popc	%o0,	%o3
	fsrc2	%f16,	%f16
	udiv	%o2,	0x154C,	%o5
	fexpand	%f13,	%f0
	nop
	set	0x10, %l3
	lduw	[%l7 + %l3],	%i3
	edge16l	%i7,	%i6,	%o1
	fmul8sux16	%f2,	%f2,	%f20
	fnegs	%f15,	%f28
	bcs,pn	%icc,	loop_2454
	orn	%g5,	%g1,	%o7
	fcmple16	%f14,	%f0,	%g6
	edge8n	%l1,	%g2,	%l3
loop_2454:
	fmovda	%xcc,	%f2,	%f19
	fabsd	%f4,	%f0
	edge32n	%l2,	%g7,	%o6
	set	0x0C, %g3
	lda	[%l7 + %g3] 0x0c,	%f28
	sll	%l5,	0x1F,	%l6
	andncc	%i4,	%i0,	%g4
	edge16l	%l4,	%g3,	%i5
	ldsh	[%l7 + 0x7A],	%i1
	movvs	%xcc,	%l0,	%i2
	xor	%o0,	%o3,	%o2
	fbo	%fcc3,	loop_2455
	tn	%xcc,	0x3
	tg	%xcc,	0x1
	movne	%icc,	%o4,	%i3
loop_2455:
	ld	[%l7 + 0x7C],	%f8
	udiv	%o5,	0x1616,	%i7
	udivcc	%i6,	0x114D,	%g5
	fornot2	%f12,	%f2,	%f6
	edge32	%o1,	%g1,	%o7
	movvc	%icc,	%l1,	%g6
	array16	%g2,	%l2,	%g7
	fbule,a	%fcc2,	loop_2456
	tleu	%xcc,	0x5
	tle	%xcc,	0x2
	alignaddr	%o6,	%l5,	%l3
loop_2456:
	fcmpgt16	%f18,	%f22,	%l6
	movcc	%xcc,	%i4,	%g4
	ldsw	[%l7 + 0x7C],	%l4
	ba,a	loop_2457
	xorcc	%i0,	%g3,	%i5
	bneg,pt	%icc,	loop_2458
	subc	%i1,	0x0158,	%l0
loop_2457:
	fpackfix	%f16,	%f25
	set	0x2C, %l2
	lduha	[%l7 + %l2] 0x10,	%o0
loop_2458:
	fmovsl	%xcc,	%f11,	%f4
	fmovspos	%xcc,	%f19,	%f16
	movrne	%o3,	%o2,	%i2
	fbne	%fcc1,	loop_2459
	tsubcctv	%i3,	%o5,	%i7
	movg	%icc,	%o4,	%i6
	nop
	setx loop_2460, %l0, %l1
	jmpl %l1, %o1
loop_2459:
	sethi	0x019F,	%g1
	wr	%g0,	0x81,	%asi
	lduba	[%l7 + 0x48] %asi,	%g5
loop_2460:
	fpadd16s	%f9,	%f6,	%f20
	nop
	setx	loop_2461,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	array16	%l1,	%o7,	%g6
	edge16n	%l2,	%g7,	%o6
	prefetch	[%l7 + 0x24],	 0x0
loop_2461:
	tpos	%icc,	0x6
	sra	%g2,	%l5,	%l6
	tn	%xcc,	0x2
	movl	%xcc,	%i4,	%g4
	orcc	%l3,	%l4,	%g3
	tne	%icc,	0x6
	fones	%f25
	movneg	%xcc,	%i5,	%i0
	fbul,a	%fcc1,	loop_2462
	edge8l	%i1,	%o0,	%l0
	te	%icc,	0x4
	stx	%o3,	[%l7 + 0x50]
loop_2462:
	movrlz	%i2,	0x2EF,	%o2
	or	%o5,	%i3,	%i7
	brlez,a	%o4,	loop_2463
	edge8	%i6,	%o1,	%g5
	fandnot2	%f30,	%f22,	%f24
	sllx	%g1,	%o7,	%l1
loop_2463:
	tcs	%xcc,	0x2
	fmovdcs	%xcc,	%f0,	%f12
	srax	%l2,	0x14,	%g7
	udivcc	%o6,	0x0A04,	%g2
	popc	%l5,	%l6
	movpos	%xcc,	%g6,	%g4
	fbge,a	%fcc1,	loop_2464
	fmovdpos	%xcc,	%f4,	%f2
	fmovscs	%xcc,	%f23,	%f30
	alignaddr	%i4,	%l4,	%g3
loop_2464:
	alignaddr	%i5,	%i0,	%i1
	stx	%o0,	[%l7 + 0x18]
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sll	%l0,	0x14,	%l3
	movrlez	%i2,	0x043,	%o2
	wr	%g0,	0x11,	%asi
	stha	%o3,	[%l7 + 0x3E] %asi
	edge32	%o5,	%i3,	%i7
	fmovrdne	%o4,	%f10,	%f26
	fmovde	%xcc,	%f26,	%f17
	prefetch	[%l7 + 0x48],	 0x0
	std	%f28,	[%l7 + 0x28]
	and	%o1,	0x1335,	%g5
	addcc	%g1,	%o7,	%l1
	sll	%l2,	0x1B,	%i6
	tvc	%icc,	0x6
	movg	%xcc,	%g7,	%o6
	fmovrde	%g2,	%f6,	%f30
	andn	%l6,	0x0CD8,	%g6
	fmovsgu	%icc,	%f19,	%f4
	fbg	%fcc2,	loop_2465
	tle	%xcc,	0x3
	ldsb	[%l7 + 0x48],	%l5
	fpsub16s	%f6,	%f1,	%f7
loop_2465:
	bg,a	loop_2466
	fmovdleu	%icc,	%f13,	%f5
	fmovrslez	%i4,	%f7,	%f15
	mulscc	%g4,	%l4,	%g3
loop_2466:
	fcmple16	%f28,	%f0,	%i0
	fmovsn	%xcc,	%f5,	%f13
	tle	%xcc,	0x7
	fmovrdgz	%i5,	%f18,	%f10
	tn	%xcc,	0x4
	orcc	%o0,	%l0,	%l3
	fcmpne32	%f6,	%f8,	%i2
	te	%icc,	0x6
	sllx	%o2,	0x17,	%i1
	fandnot2s	%f24,	%f23,	%f12
	tpos	%icc,	0x7
	ta	%icc,	0x1
	brlez,a	%o3,	loop_2467
	addcc	%i3,	%i7,	%o4
	edge32	%o5,	%o1,	%g5
	mulx	%o7,	%g1,	%l1
loop_2467:
	fcmpne32	%f28,	%f16,	%l2
	fors	%f13,	%f31,	%f4
	xor	%g7,	0x097F,	%o6
	set	0x24, %g7
	lduha	[%l7 + %g7] 0x10,	%i6
	xorcc	%l6,	0x0FA1,	%g2
	movl	%xcc,	%l5,	%g6
	andcc	%i4,	%g4,	%g3
	fmovrdgz	%i0,	%f6,	%f16
	std	%l4,	[%l7 + 0x28]
	wr	%g0,	0x80,	%asi
	lduwa	[%l7 + 0x1C] %asi,	%o0
	set	0x30, %l5
	ldxa	[%l7 + %l5] 0x88,	%i5
	fbue,a	%fcc2,	loop_2468
	andn	%l3,	%l0,	%i2
	edge32n	%o2,	%o3,	%i1
	mulscc	%i3,	0x0782,	%i7
loop_2468:
	fpack32	%f4,	%f28,	%f26
	addccc	%o4,	%o1,	%o5
	taddcc	%o7,	%g1,	%g5
	umul	%l1,	0x1223,	%g7
	fble,a	%fcc2,	loop_2469
	sra	%l2,	0x1C,	%o6
	subccc	%i6,	%g2,	%l5
	srlx	%l6,	0x01,	%g6
loop_2469:
	brgez	%g4,	loop_2470
	bl,a,pt	%icc,	loop_2471
	fmuld8ulx16	%f16,	%f29,	%f14
	ldsw	[%l7 + 0x4C],	%g3
loop_2470:
	bneg,a,pn	%xcc,	loop_2472
loop_2471:
	movn	%icc,	%i4,	%l4
	bgu,pt	%xcc,	loop_2473
	taddcc	%i0,	%o0,	%i5
loop_2472:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	call	loop_2474
loop_2473:
	te	%xcc,	0x3
	umulcc	%l3,	%i2,	%o2
	fmovdvc	%xcc,	%f5,	%f2
loop_2474:
	nop
	set	0x50, %g1
	lduw	[%l7 + %g1],	%l0
	movn	%xcc,	%o3,	%i3
	fxnor	%f16,	%f18,	%f28
	movle	%xcc,	%i7,	%i1
	pdist	%f0,	%f30,	%f14
	std	%f0,	[%l7 + 0x68]
	fbg,a	%fcc0,	loop_2475
	or	%o1,	0x1D95,	%o4
	membar	0x60
	fbue,a	%fcc2,	loop_2476
loop_2475:
	edge8ln	%o5,	%g1,	%g5
	smulcc	%o7,	%g7,	%l2
	movpos	%xcc,	%l1,	%o6
loop_2476:
	movg	%icc,	%g2,	%l5
	edge32l	%i6,	%g6,	%l6
	fcmps	%fcc2,	%f31,	%f18
	membar	0x39
	tg	%icc,	0x0
	edge32l	%g4,	%g3,	%l4
	fbe	%fcc0,	loop_2477
	fmovdleu	%xcc,	%f6,	%f17
	fmul8ulx16	%f0,	%f30,	%f26
	edge32ln	%i4,	%i0,	%o0
loop_2477:
	sir	0x075A
	edge32l	%i5,	%l3,	%i2
	array8	%o2,	%l0,	%i3
	movpos	%icc,	%i7,	%o3
	popc	%i1,	%o1
	sdivx	%o5,	0x188F,	%o4
	sethi	0x1FA6,	%g1
	orcc	%g5,	0x1033,	%g7
	umulcc	%o7,	0x1439,	%l2
	fnot1s	%f17,	%f16
	umul	%o6,	0x1605,	%g2
	movrne	%l1,	0x3D9,	%l5
	siam	0x3
	fmovrdne	%i6,	%f14,	%f16
	sll	%l6,	%g4,	%g3
	tgu	%icc,	0x4
	fpsub32s	%f8,	%f31,	%f10
	and	%g6,	0x1A90,	%l4
	bpos	loop_2478
	sir	0x0F38
	nop
	setx	loop_2479,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fbe	%fcc2,	loop_2480
loop_2478:
	bpos	%xcc,	loop_2481
	srlx	%i0,	0x06,	%o0
loop_2479:
	tne	%icc,	0x3
loop_2480:
	fpsub16	%f20,	%f10,	%f2
loop_2481:
	movcs	%xcc,	%i4,	%l3
	andn	%i2,	0x09B9,	%i5
	tvc	%icc,	0x3
	fmovdle	%xcc,	%f22,	%f16
	mulscc	%o2,	%l0,	%i7
	movrlz	%o3,	%i3,	%o1
	sdiv	%o5,	0x1EC8,	%o4
	array16	%g1,	%g5,	%g7
	ble,a,pn	%xcc,	loop_2482
	tle	%icc,	0x7
	sdiv	%o7,	0x17A1,	%l2
	smulcc	%o6,	%i1,	%l1
loop_2482:
	edge16n	%g2,	%i6,	%l5
	bneg	%icc,	loop_2483
	sub	%l6,	%g3,	%g6
	fmovdcc	%xcc,	%f10,	%f16
	array32	%l4,	%g4,	%i0
loop_2483:
	movvc	%icc,	%o0,	%l3
	tpos	%icc,	0x5
	srlx	%i4,	0x04,	%i5
	andncc	%o2,	%l0,	%i2
	alignaddr	%o3,	%i7,	%o1
	ba	loop_2484
	array8	%i3,	%o5,	%o4
	fsrc1	%f14,	%f8
	popc	%g1,	%g7
loop_2484:
	edge8l	%o7,	%l2,	%o6
	movl	%xcc,	%i1,	%l1
	edge32l	%g2,	%i6,	%g5
	fmovrdgz	%l6,	%f18,	%f14
	orn	%l5,	0x06E7,	%g3
	edge16l	%g6,	%g4,	%i0
	fmovrde	%l4,	%f14,	%f26
	tgu	%icc,	0x7
	taddcctv	%o0,	0x051E,	%i4
	addccc	%i5,	%o2,	%l3
	movne	%xcc,	%l0,	%i2
	nop
	set	0x6F, %l4
	ldub	[%l7 + %l4],	%o3
	edge8ln	%i7,	%o1,	%i3
	fmovd	%f24,	%f22
	fmovdgu	%icc,	%f29,	%f6
	fmovdneg	%icc,	%f16,	%f4
	fsrc1s	%f31,	%f28
	alignaddrl	%o5,	%g1,	%o4
	movrlz	%o7,	%g7,	%l2
	movcc	%icc,	%i1,	%l1
	fmovsa	%xcc,	%f20,	%f11
	mova	%xcc,	%g2,	%o6
	subc	%g5,	%i6,	%l5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbe	%fcc0,	loop_2485
	fpadd32s	%f9,	%f17,	%f23
	fmovrsne	%l6,	%f5,	%f5
	edge16l	%g6,	%g3,	%g4
loop_2485:
	srlx	%l4,	0x0A,	%i0
	fblg,a	%fcc2,	loop_2486
	movneg	%xcc,	%i4,	%i5
	edge8ln	%o2,	%o0,	%l3
	xnorcc	%l0,	%i2,	%i7
loop_2486:
	movg	%xcc,	%o1,	%i3
	alignaddrl	%o5,	%o3,	%o4
	taddcc	%g1,	0x015D,	%g7
	taddcc	%l2,	%o7,	%l1
	nop
	set	0x2D, %o0
	ldstub	[%l7 + %o0],	%i1
	orncc	%g2,	0x12F9,	%g5
	edge16	%o6,	%l5,	%l6
	fsrc2s	%f20,	%f31
	movle	%icc,	%g6,	%g3
	bleu,pn	%icc,	loop_2487
	bneg,a,pn	%xcc,	loop_2488
	movneg	%xcc,	%g4,	%i6
	st	%f9,	[%l7 + 0x38]
loop_2487:
	array32	%i0,	%i4,	%i5
loop_2488:
	movleu	%icc,	%l4,	%o2
	udivcc	%l3,	0x0F66,	%o0
	set	0x54, %o7
	swapa	[%l7 + %o7] 0x04,	%l0
	tge	%icc,	0x6
	fmovdvc	%xcc,	%f2,	%f7
	brgez	%i7,	loop_2489
	smul	%o1,	%i3,	%i2
	sra	%o3,	%o5,	%g1
	tvs	%icc,	0x0
loop_2489:
	sllx	%o4,	0x0B,	%g7
	movcs	%xcc,	%l2,	%l1
	edge8n	%i1,	%o7,	%g2
	fmovdl	%xcc,	%f2,	%f27
	fmovrdgez	%o6,	%f20,	%f2
	fcmpgt16	%f10,	%f28,	%g5
	xor	%l5,	0x0621,	%g6
	addc	%l6,	%g4,	%g3
	nop
	setx loop_2490, %l0, %l1
	jmpl %l1, %i6
	srlx	%i4,	0x00,	%i0
	fbl	%fcc0,	loop_2491
	movvs	%xcc,	%l4,	%i5
loop_2490:
	fmovdcs	%xcc,	%f29,	%f10
	fmul8sux16	%f30,	%f0,	%f16
loop_2491:
	tsubcctv	%o2,	0x0CB0,	%o0
	smul	%l3,	0x1906,	%i7
	movl	%icc,	%o1,	%i3
	fcmpne32	%f24,	%f28,	%i2
	te	%icc,	0x5
	tl	%icc,	0x3
	movn	%icc,	%l0,	%o3
	or	%g1,	0x1A23,	%o4
	fmovdne	%xcc,	%f30,	%f4
	bl,a,pn	%icc,	loop_2492
	tg	%icc,	0x1
	sll	%o5,	%g7,	%l1
	addc	%i1,	0x1EEB,	%o7
loop_2492:
	edge32n	%l2,	%o6,	%g5
	fba,a	%fcc1,	loop_2493
	movvs	%xcc,	%l5,	%g6
	edge8ln	%l6,	%g2,	%g4
	xorcc	%g3,	0x117D,	%i6
loop_2493:
	movrlz	%i4,	0x2F8,	%i0
	sir	0x1457
	and	%l4,	0x0BD7,	%o2
	tne	%xcc,	0x6
	tgu	%icc,	0x6
	bshuffle	%f4,	%f18,	%f0
	movcs	%icc,	%i5,	%o0
	fsrc1s	%f30,	%f26
	edge8	%i7,	%o1,	%l3
	addccc	%i2,	0x0486,	%l0
	fcmps	%fcc3,	%f16,	%f0
	tvc	%xcc,	0x5
	pdist	%f24,	%f6,	%f28
	udivx	%i3,	0x15B5,	%o3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0xeb,	%asi
	stda	%o4,	[%l7 + 0x50] %asi
	membar	#Sync
	tcc	%icc,	0x5
	mulscc	%o5,	%g1,	%l1
	edge8l	%g7,	%o7,	%l2
	movne	%xcc,	%i1,	%g5
	fbl,a	%fcc1,	loop_2494
	edge16ln	%o6,	%g6,	%l6
	bne,a,pn	%icc,	loop_2495
	udivx	%l5,	0x0ED7,	%g4
loop_2494:
	edge8	%g2,	%g3,	%i6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2495:
	smul	%i4,	%i0,	%o2
	set	0x50, %i0
	ldswa	[%l7 + %i0] 0x15,	%l4
	addccc	%i5,	0x0DB3,	%i7
	tvs	%xcc,	0x7
	movrgz	%o1,	0x146,	%o0
	add	%l3,	%i2,	%i3
	edge32n	%o3,	%o4,	%l0
	stx	%g1,	[%l7 + 0x40]
	fpadd32s	%f11,	%f12,	%f3
	addc	%o5,	0x032B,	%l1
	edge16l	%o7,	%g7,	%i1
	flush	%l7 + 0x4C
	fmovdge	%xcc,	%f14,	%f6
	fmovspos	%xcc,	%f10,	%f15
	movn	%icc,	%l2,	%g5
	edge16	%g6,	%l6,	%o6
	fmovsvc	%xcc,	%f26,	%f22
	set	0x42, %g5
	ldstuba	[%l7 + %g5] 0x80,	%l5
	array32	%g4,	%g3,	%i6
	edge32	%i4,	%i0,	%g2
	fones	%f30
	ldsh	[%l7 + 0x3A],	%l4
	tge	%xcc,	0x6
	brz,a	%i5,	loop_2496
	array32	%o2,	%i7,	%o1
	udivcc	%o0,	0x1779,	%i2
	fbul,a	%fcc0,	loop_2497
loop_2496:
	bgu,a	%icc,	loop_2498
	bpos,pn	%xcc,	loop_2499
	movn	%xcc,	%l3,	%o3
loop_2497:
	nop
	wr	%g0,	0x0c,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
loop_2498:
	movpos	%xcc,	%o4,	%l0
loop_2499:
	addccc	%g1,	%i3,	%o5
	fnot1s	%f11,	%f19
	bleu,a	%xcc,	loop_2500
	movre	%o7,	0x13F,	%g7
	array16	%l1,	%i1,	%l2
	add	%g5,	0x09CB,	%g6
loop_2500:
	fabss	%f15,	%f19
	ta	%icc,	0x3
	add	%o6,	%l5,	%g4
	wr	%g0,	0x10,	%asi
	prefetcha	[%l7 + 0x68] %asi,	 0x2
	edge8l	%i6,	%g3,	%i4
	taddcc	%g2,	%i0,	%i5
	udivx	%l4,	0x1AB5,	%i7
	fcmped	%fcc0,	%f30,	%f18
	movne	%xcc,	%o1,	%o0
	tvc	%icc,	0x4
	edge32n	%o2,	%i2,	%o3
	srax	%o4,	0x1C,	%l0
	udivcc	%g1,	0x19DB,	%i3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movcc	%xcc,	%l3,	%o5
	srl	%o7,	%l1,	%g7
	bvc,pt	%xcc,	loop_2501
	movle	%xcc,	%l2,	%i1
	fbge,a	%fcc1,	loop_2502
	fmovdn	%icc,	%f0,	%f5
loop_2501:
	ba	loop_2503
	fcmpeq16	%f10,	%f10,	%g6
loop_2502:
	move	%icc,	%o6,	%g5
	or	%g4,	0x03CF,	%l5
loop_2503:
	nop
	wr	%g0,	0x80,	%asi
	ldxa	[%l7 + 0x20] %asi,	%i6
	xnorcc	%l6,	0x1DC0,	%i4
	movvs	%icc,	%g3,	%g2
	set	0x40, %i2
	ldda	[%l7 + %i2] 0x19,	%f16
	fmovrdlez	%i5,	%f8,	%f0
	faligndata	%f14,	%f28,	%f10
	wr	%g0,	0x89,	%asi
	ldstuba	[%l7 + 0x56] %asi,	%l4
	set	0x7C, %o3
	stwa	%i7,	[%l7 + %o3] 0x80
	fmovrdlez	%o1,	%f18,	%f30
	movrlez	%o0,	0x081,	%i0
	wr	%g0,	0x10,	%asi
	swapa	[%l7 + 0x2C] %asi,	%o2
	fxnors	%f30,	%f20,	%f7
	fand	%f4,	%f8,	%f8
	bgu,a,pt	%icc,	loop_2504
	fmovsle	%xcc,	%f16,	%f9
	bcc,pt	%icc,	loop_2505
	movrlz	%o3,	%i2,	%o4
loop_2504:
	alignaddrl	%g1,	%l0,	%l3
	movcc	%icc,	%o5,	%i3
loop_2505:
	taddcctv	%o7,	%g7,	%l1
	fzero	%f30
	fcmpgt16	%f16,	%f24,	%i1
	wr	%g0,	0x0c,	%asi
	prefetcha	[%l7 + 0x60] %asi,	 0x3
	fbg,a	%fcc2,	loop_2506
	smulcc	%o6,	%g6,	%g4
	set	0x10, %o4
	stxa	%l5,	[%g0 + %o4] 0x21
loop_2506:
	movrgez	%g5,	%i6,	%i4
	sth	%l6,	[%l7 + 0x5A]
	fmuld8sux16	%f17,	%f9,	%f4
	addcc	%g3,	%g2,	%i5
	fmovsvs	%icc,	%f25,	%f27
	fornot1	%f30,	%f14,	%f16
	fbuge	%fcc2,	loop_2507
	sethi	0x1E0C,	%l4
	movpos	%icc,	%i7,	%o1
	bvs,a,pt	%icc,	loop_2508
loop_2507:
	movpos	%xcc,	%o0,	%i0
	move	%icc,	%o2,	%o3
	taddcctv	%i2,	%g1,	%l0
loop_2508:
	popc	0x014E,	%o4
	ble	%xcc,	loop_2509
	tne	%icc,	0x6
	fornot2s	%f21,	%f12,	%f4
	fmovspos	%icc,	%f0,	%f17
loop_2509:
	bl,a	loop_2510
	smul	%l3,	%o5,	%o7
	sdivx	%i3,	0x00EC,	%g7
	alignaddr	%l1,	%i1,	%o6
loop_2510:
	tvc	%xcc,	0x7
	fpadd16s	%f19,	%f3,	%f3
	fmovdneg	%xcc,	%f8,	%f9
	fmovsleu	%icc,	%f24,	%f4
	fmovrslz	%g6,	%f7,	%f20
	fmovrde	%g4,	%f4,	%f24
	movne	%icc,	%l5,	%g5
	movn	%icc,	%l2,	%i4
	edge8l	%i6,	%l6,	%g2
	udivx	%i5,	0x133C,	%g3
	add	%l4,	%o1,	%o0
	set	0x0, %i6
	stxa	%i0,	[%g0 + %i6] 0x4f
	movcc	%xcc,	%i7,	%o3
	edge8l	%o2,	%g1,	%l0
	fmovdvs	%icc,	%f15,	%f5
	edge8ln	%i2,	%o4,	%o5
	swap	[%l7 + 0x48],	%o7
	fba,a	%fcc0,	loop_2511
	tle	%icc,	0x7
	fbule,a	%fcc1,	loop_2512
	membar	0x30
loop_2511:
	stw	%i3,	[%l7 + 0x78]
	srlx	%g7,	%l1,	%i1
loop_2512:
	nop
	wr	%g0,	0x04,	%asi
	stwa	%l3,	[%l7 + 0x08] %asi
	bl,a,pn	%xcc,	loop_2513
	subc	%g6,	%o6,	%g4
	move	%icc,	%g5,	%l2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2513:
	srax	%i4,	%l5,	%l6
	bvc,pn	%xcc,	loop_2514
	fmovscs	%icc,	%f17,	%f25
	alignaddr	%g2,	%i5,	%i6
	subcc	%l4,	0x1A76,	%o1
loop_2514:
	brz,a	%g3,	loop_2515
	bvc	%icc,	loop_2516
	edge8l	%i0,	%o0,	%o3
	tn	%icc,	0x3
loop_2515:
	tcc	%icc,	0x3
loop_2516:
	alignaddrl	%o2,	%g1,	%l0
	bcc,pn	%xcc,	loop_2517
	fmovdl	%xcc,	%f13,	%f6
	bleu,a,pt	%icc,	loop_2518
	taddcctv	%i7,	%o4,	%i2
loop_2517:
	smulcc	%o5,	%i3,	%o7
	xor	%l1,	0x0DE6,	%g7
loop_2518:
	umul	%i1,	%l3,	%o6
	movge	%icc,	%g6,	%g5
	udivx	%g4,	0x0D4D,	%i4
	fbu,a	%fcc2,	loop_2519
	edge32ln	%l2,	%l6,	%l5
	ble,pt	%xcc,	loop_2520
	tcs	%xcc,	0x3
loop_2519:
	movvs	%icc,	%i5,	%i6
	add	%l7,	0x58,	%l6
	wr	%g0,	0x19,	%asi
	lda	[%l6] %asi,	%g2
	casa	[%l6] %asi,	%g2,	%l4
loop_2520:
	movre	%o1,	0x224,	%i0
	movrlez	%o0,	%g3,	%o3
	fmovdne	%icc,	%f10,	%f12
	swap	[%l7 + 0x7C],	%g1
	tleu	%xcc,	0x5
	te	%icc,	0x0
	xnorcc	%l0,	0x1E25,	%i7
	wr	%g0,	0x10,	%asi
	ldswa	[%l7 + 0x0C] %asi,	%o4
	fxnor	%f12,	%f30,	%f16
	ldd	[%l7 + 0x60],	%f4
	srlx	%o2,	0x0B,	%i2
	fnot2s	%f16,	%f31
	fmovrdgez	%i3,	%f16,	%f18
	array16	%o5,	%l1,	%o7
	fbne,a	%fcc0,	loop_2521
	edge16	%i1,	%g7,	%o6
	fpadd32	%f8,	%f26,	%f20
	xorcc	%l3,	0x1DA7,	%g5
loop_2521:
	fmovdcs	%xcc,	%f26,	%f29
	movne	%xcc,	%g6,	%i4
	andncc	%g4,	%l6,	%l5
	bcs,pt	%icc,	loop_2522
	mulscc	%i5,	0x0EE3,	%l2
	subc	%g2,	%l4,	%o1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2522:
	orn	%i0,	%i6,	%o0
	sdivx	%o3,	0x0B5C,	%g1
	andncc	%l0,	%g3,	%i7
	fmul8x16al	%f4,	%f19,	%f20
	set	0x40, %i7
	stda	%f16,	[%l7 + %i7] 0xf1
	membar	#Sync
	tleu	%icc,	0x6
	andncc	%o4,	%o2,	%i2
	mulscc	%o5,	%l1,	%i3
	tne	%xcc,	0x7
	stb	%i1,	[%l7 + 0x1C]
	array32	%g7,	%o7,	%o6
	array32	%l3,	%g5,	%g6
	set	0x58, %g6
	stxa	%g4,	[%l7 + %g6] 0x19
	te	%xcc,	0x7
	edge32l	%i4,	%l6,	%i5
	subc	%l5,	0x1C62,	%g2
	set	0x10, %o2
	ldxa	[%g0 + %o2] 0x21,	%l4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sllx	%l2,	0x04,	%o1
	fbne	%fcc3,	loop_2523
	srl	%i6,	0x03,	%o0
	tg	%icc,	0x6
	tcc	%xcc,	0x5
loop_2523:
	fmovrde	%i0,	%f4,	%f2
	membar	0x52
	bl,a,pn	%icc,	loop_2524
	tne	%xcc,	0x6
	set	0x48, %g2
	stwa	%o3,	[%l7 + %g2] 0x81
loop_2524:
	bgu,a,pn	%icc,	loop_2525
	fnegd	%f6,	%f6
	fnands	%f30,	%f29,	%f2
	movg	%xcc,	%l0,	%g3
loop_2525:
	fnegd	%f18,	%f24
	tleu	%icc,	0x2
	tg	%xcc,	0x6
	srax	%g1,	%i7,	%o2
	bleu	%icc,	loop_2526
	tl	%icc,	0x3
	fcmps	%fcc1,	%f16,	%f15
	edge8l	%o4,	%o5,	%i2
loop_2526:
	fones	%f29
	udivx	%l1,	0x1FB1,	%i1
	movvc	%icc,	%g7,	%i3
	smulcc	%o6,	0x11E6,	%o7
	movrgz	%g5,	%g6,	%g4
	movrlz	%i4,	%l3,	%i5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mulscc	%l6,	0x1C21,	%l5
	tvs	%icc,	0x4
	mulx	%g2,	%l4,	%l2
	srl	%i6,	0x17,	%o1
	movpos	%icc,	%i0,	%o0
	umul	%o3,	0x12E1,	%l0
	stb	%g3,	[%l7 + 0x36]
	ble,a,pt	%icc,	loop_2527
	orn	%i7,	%g1,	%o2
	fnor	%f20,	%f28,	%f16
	array8	%o4,	%o5,	%l1
loop_2527:
	nop
	wr	%g0,	0x19,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	movrgez	%i1,	0x0BB,	%g7
	edge8	%i2,	%o6,	%o7
	bvs,pt	%xcc,	loop_2528
	smulcc	%i3,	0x070F,	%g5
	umulcc	%g6,	%g4,	%l3
	set	0x5C, %o6
	lduwa	[%l7 + %o6] 0x80,	%i5
loop_2528:
	movcs	%icc,	%l6,	%l5
	smul	%i4,	0x1DFA,	%g2
	subcc	%l4,	%l2,	%o1
	andn	%i0,	0x148F,	%o0
	movcs	%xcc,	%o3,	%l0
	udivx	%g3,	0x1ED7,	%i6
	bge,a	loop_2529
	tvs	%icc,	0x1
	udiv	%i7,	0x08BC,	%g1
	flush	%l7 + 0x50
loop_2529:
	tl	%xcc,	0x1
	fornot1s	%f18,	%f2,	%f20
	array16	%o2,	%o4,	%l1
	tn	%xcc,	0x3
	movleu	%icc,	%i1,	%o5
	edge32	%i2,	%o6,	%g7
	tcc	%xcc,	0x7
	fcmpes	%fcc1,	%f21,	%f7
	ldub	[%l7 + 0x7B],	%o7
	tle	%icc,	0x3
	array32	%i3,	%g5,	%g4
	tg	%xcc,	0x0
	bpos,a,pn	%icc,	loop_2530
	ldd	[%l7 + 0x78],	%f10
	array16	%g6,	%l3,	%l6
	wr	%g0,	0x80,	%asi
	stba	%i5,	[%l7 + 0x4D] %asi
loop_2530:
	popc	%i4,	%l5
	add	%g2,	%l2,	%o1
	fmovsl	%xcc,	%f15,	%f16
	wr	%g0,	0x11,	%asi
	ldda	[%l7 + 0x20] %asi,	%i0
	fbug	%fcc3,	loop_2531
	fbge,a	%fcc1,	loop_2532
	fmovsn	%icc,	%f24,	%f18
	movrlez	%o0,	%o3,	%l4
loop_2531:
	edge8ln	%g3,	%l0,	%i7
loop_2532:
	smul	%g1,	0x1BDA,	%i6
	edge32	%o4,	%l1,	%i1
	edge16l	%o2,	%o5,	%o6
	set	0x0A, %l0
	stha	%g7,	[%l7 + %l0] 0x81
	fblg	%fcc3,	loop_2533
	edge8n	%i2,	%i3,	%o7
	xnorcc	%g5,	%g4,	%g6
	ba	loop_2534
loop_2533:
	edge16	%l6,	%i5,	%l3
	tl	%icc,	0x4
	umul	%l5,	%i4,	%g2
loop_2534:
	alignaddr	%l2,	%o1,	%o0
	brz	%i0,	loop_2535
	srax	%l4,	%g3,	%o3
	movg	%xcc,	%i7,	%l0
	edge16l	%g1,	%o4,	%i6
loop_2535:
	nop
	membar	#Sync
	set	0x40, %i4
	ldda	[%l7 + %i4] 0xf1,	%f16
	sllx	%l1,	0x02,	%i1
	set	0x34, %i3
	ldsba	[%l7 + %i3] 0x0c,	%o5
	ba,a	loop_2536
	call	loop_2537
	tgu	%xcc,	0x6
	edge8ln	%o6,	%o2,	%g7
loop_2536:
	movg	%xcc,	%i3,	%o7
loop_2537:
	addccc	%g5,	%i2,	%g6
	fba	%fcc1,	loop_2538
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srlx	%l6,	0x1A,	%g4
	movrgz	%l3,	0x2F5,	%i5
loop_2538:
	membar	0x03
	brgez	%i4,	loop_2539
	flush	%l7 + 0x30
	tvc	%xcc,	0x0
	ldsh	[%l7 + 0x2C],	%l5
loop_2539:
	umulcc	%g2,	%l2,	%o0
	fands	%f7,	%f7,	%f8
	fbn	%fcc1,	loop_2540
	bleu,a	%icc,	loop_2541
	andcc	%i0,	%l4,	%o1
	alignaddrl	%o3,	%i7,	%l0
loop_2540:
	fands	%f16,	%f26,	%f19
loop_2541:
	fmovdne	%xcc,	%f8,	%f29
	fbn,a	%fcc1,	loop_2542
	subc	%g1,	0x0FF3,	%o4
	movrgez	%g3,	0x341,	%l1
	fbge	%fcc3,	loop_2543
loop_2542:
	edge8l	%i1,	%o5,	%i6
	addcc	%o2,	%g7,	%o6
	set	0x50, %g4
	swapa	[%l7 + %g4] 0x18,	%i3
loop_2543:
	movl	%icc,	%g5,	%i2
	alignaddrl	%o7,	%l6,	%g4
	movvc	%xcc,	%g6,	%l3
	edge8l	%i4,	%l5,	%i5
	fpadd16s	%f12,	%f16,	%f24
	fmovsl	%xcc,	%f19,	%f12
	membar	#Sync
	wr	%g0,	0x1f,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	movneg	%xcc,	%g2,	%o0
	brgez	%i0,	loop_2544
	movl	%icc,	%l4,	%o1
	udiv	%l2,	0x1DB1,	%i7
	fmovspos	%xcc,	%f3,	%f20
loop_2544:
	fpack16	%f6,	%f22
	sub	%o3,	0x1162,	%g1
	fmovdcs	%icc,	%f7,	%f10
	fmovscs	%icc,	%f10,	%f25
	set	0x78, %l1
	stda	%l0,	[%l7 + %l1] 0x15
	fpack16	%f24,	%f13
	movl	%xcc,	%o4,	%l1
	edge32l	%g3,	%o5,	%i6
	move	%icc,	%o2,	%g7
	addc	%o6,	%i1,	%g5
	orcc	%i3,	0x0117,	%i2
	fmovrslz	%l6,	%f7,	%f10
	fbug,a	%fcc2,	loop_2545
	ldsw	[%l7 + 0x14],	%g4
	sdivcc	%o7,	0x13CC,	%g6
	stw	%i4,	[%l7 + 0x50]
loop_2545:
	fbn,a	%fcc2,	loop_2546
	fmovdg	%icc,	%f8,	%f14
	fmovrde	%l3,	%f22,	%f6
	flush	%l7 + 0x30
loop_2546:
	fxors	%f21,	%f29,	%f15
	fmovdpos	%icc,	%f25,	%f13
	movvs	%xcc,	%l5,	%i5
	array8	%g2,	%o0,	%l4
	subc	%i0,	%l2,	%o1
	movgu	%xcc,	%o3,	%g1
	fmovsl	%icc,	%f17,	%f22
	xnor	%i7,	0x17E8,	%o4
	stw	%l0,	[%l7 + 0x4C]
	srl	%l1,	%g3,	%o5
	fones	%f16
	srl	%o2,	%i6,	%o6
	mova	%icc,	%g7,	%g5
	set	0x40, %i1
	ldda	[%l7 + %i1] 0x89,	%f16
	array16	%i3,	%i2,	%l6
	be,pt	%xcc,	loop_2547
	orn	%g4,	%i1,	%o7
	sdiv	%i4,	0x0254,	%l3
	movrgz	%l5,	0x29F,	%i5
loop_2547:
	xnor	%g2,	0x0D7A,	%g6
	stbar
	tl	%icc,	0x1
	umul	%o0,	%i0,	%l2
	popc	%o1,	%l4
	ba,pt	%xcc,	loop_2548
	movg	%icc,	%g1,	%i7
	subc	%o3,	%o4,	%l1
	edge8n	%l0,	%o5,	%g3
loop_2548:
	smul	%o2,	0x0DBD,	%i6
	taddcc	%o6,	0x1C5C,	%g5
	ble,a	%xcc,	loop_2549
	movcs	%icc,	%i3,	%i2
	bge,pt	%xcc,	loop_2550
	movre	%l6,	%g7,	%i1
loop_2549:
	fmovrsgez	%g4,	%f19,	%f28
	edge32	%i4,	%l3,	%l5
loop_2550:
	fmovdcs	%xcc,	%f22,	%f14
	fmul8ulx16	%f0,	%f16,	%f12
	srax	%o7,	%g2,	%i5
	tge	%icc,	0x7
	movre	%g6,	%i0,	%l2
	fpsub16s	%f23,	%f2,	%f29
	pdist	%f8,	%f28,	%f6
	fand	%f12,	%f22,	%f22
	fmovscc	%icc,	%f22,	%f1
	movcs	%icc,	%o0,	%o1
	sdiv	%l4,	0x11B7,	%i7
	fmovsne	%icc,	%f17,	%f0
	add	%l7,	0x74,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%o3
	casa	[%l6] 0x88,	%o3,	%g1
	membar	0x12
	set	0x48, %l6
	lduwa	[%l7 + %l6] 0x81,	%l1
	bge	%xcc,	loop_2551
	fmul8x16au	%f27,	%f21,	%f0
	sth	%l0,	[%l7 + 0x6C]
	bcs,a	loop_2552
loop_2551:
	array8	%o4,	%g3,	%o2
	fandnot2s	%f8,	%f14,	%f10
	sth	%o5,	[%l7 + 0x7E]
loop_2552:
	mulx	%o6,	%i6,	%i3
	fnand	%f10,	%f8,	%f14
	srlx	%g5,	0x02,	%l6
	fnegd	%f16,	%f8
	fcmpeq32	%f10,	%f8,	%i2
	movcc	%xcc,	%g7,	%g4
	tneg	%icc,	0x1
	umul	%i1,	0x1B93,	%i4
	set	0x40, %o5
	stda	%f0,	[%l7 + %o5] 0x19
	orncc	%l3,	%o7,	%l5
	fblg,a	%fcc1,	loop_2553
	edge32	%i5,	%g6,	%i0
	wr	%g0,	0x88,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
loop_2553:
	fpackfix	%f26,	%f3
	fornot2	%f30,	%f30,	%f24
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	move	%xcc,	%g2,	%l2
	edge8ln	%o1,	%o0,	%i7
	std	%f30,	[%l7 + 0x68]
	fmovrsne	%o3,	%f19,	%f23
	tle	%icc,	0x0
	srl	%g1,	0x0D,	%l1
	sdivx	%l0,	0x136C,	%o4
	std	%f12,	[%l7 + 0x58]
	edge32n	%l4,	%g3,	%o2
	smulcc	%o5,	0x0C03,	%o6
	fmovsvc	%icc,	%f16,	%f5
	brgz,a	%i3,	loop_2554
	fandnot2	%f2,	%f2,	%f22
	fpadd16s	%f19,	%f30,	%f6
	movneg	%xcc,	%i6,	%g5
loop_2554:
	fpadd16	%f8,	%f22,	%f26
	set	0x54, %o1
	ldswa	[%l7 + %o1] 0x11,	%l6
	bleu,a	loop_2555
	array8	%g7,	%g4,	%i2
	xorcc	%i4,	%i1,	%o7
	or	%l5,	%i5,	%g6
loop_2555:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32l	%l3,	%i0,	%l2
	ba,pt	%icc,	loop_2556
	sethi	0x0783,	%g2
	ldsb	[%l7 + 0x41],	%o0
	alignaddrl	%o1,	%i7,	%o3
loop_2556:
	edge16n	%g1,	%l1,	%o4
	fcmps	%fcc1,	%f22,	%f0
	fbul	%fcc2,	loop_2557
	fmovdneg	%icc,	%f20,	%f9
	fnand	%f20,	%f18,	%f18
	movne	%icc,	%l4,	%g3
loop_2557:
	movleu	%xcc,	%l0,	%o2
	fba	%fcc1,	loop_2558
	xorcc	%o6,	0x0DD2,	%i3
	fbn,a	%fcc0,	loop_2559
	tg	%xcc,	0x5
loop_2558:
	orcc	%o5,	%i6,	%g5
	fmovda	%xcc,	%f3,	%f9
loop_2559:
	edge32l	%g7,	%l6,	%i2
	movcc	%icc,	%g4,	%i4
	fbule	%fcc0,	loop_2560
	ldsw	[%l7 + 0x78],	%o7
	movneg	%icc,	%i1,	%l5
	movgu	%icc,	%g6,	%l3
loop_2560:
	sub	%i5,	0x0403,	%l2
	orcc	%g2,	0x0EB3,	%i0
	or	%o0,	0x1A11,	%i7
	fzeros	%f6
	fxor	%f18,	%f18,	%f24
	srlx	%o3,	%g1,	%o1
	movrgz	%o4,	%l1,	%g3
	fbl,a	%fcc0,	loop_2561
	sub	%l0,	%l4,	%o2
	bne,a	%xcc,	loop_2562
	tcs	%icc,	0x5
loop_2561:
	prefetch	[%l7 + 0x58],	 0x1
	fxnor	%f12,	%f30,	%f30
loop_2562:
	fnot1s	%f7,	%f0
	fabss	%f31,	%f31
	fone	%f0
	bn,a,pt	%xcc,	loop_2563
	fbl,a	%fcc2,	loop_2564
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16	%o6,	%i3,	%o5
loop_2563:
	fba	%fcc0,	loop_2565
loop_2564:
	smul	%i6,	0x0251,	%g7
	tleu	%xcc,	0x0
	sdiv	%l6,	0x1C42,	%i2
loop_2565:
	orcc	%g5,	0x1850,	%g4
	fmovs	%f19,	%f12
	tl	%xcc,	0x4
	bne,a	%icc,	loop_2566
	fbo,a	%fcc2,	loop_2567
	tneg	%icc,	0x1
	popc	%o7,	%i1
loop_2566:
	fmovdle	%icc,	%f0,	%f12
loop_2567:
	andn	%l5,	0x0022,	%g6
	xnorcc	%i4,	%l3,	%l2
	fmovdg	%icc,	%f29,	%f7
	smul	%g2,	0x1B82,	%i0
	fpack32	%f6,	%f12,	%f24
	fbne,a	%fcc1,	loop_2568
	siam	0x4
	set	0x70, %i5
	ldswa	[%l7 + %i5] 0x88,	%o0
loop_2568:
	andn	%i7,	0x1BAB,	%o3
	bge,pt	%icc,	loop_2569
	edge32l	%g1,	%i5,	%o1
	set	0x0C, %g3
	stwa	%o4,	[%l7 + %g3] 0xeb
	membar	#Sync
loop_2569:
	stx	%l1,	[%l7 + 0x10]
	bneg	loop_2570
	xor	%g3,	0x03D8,	%l0
	fsrc1	%f16,	%f12
	movrlez	%l4,	0x351,	%o2
loop_2570:
	fmovrdne	%i3,	%f24,	%f26
	fpmerge	%f19,	%f7,	%f2
	xnor	%o5,	0x1F9A,	%o6
	bvc,a,pn	%icc,	loop_2571
	fbule	%fcc1,	loop_2572
	edge16l	%g7,	%l6,	%i6
	movge	%xcc,	%i2,	%g5
loop_2571:
	tsubcc	%o7,	0x0A81,	%g4
loop_2572:
	fpsub32	%f16,	%f18,	%f28
	fcmpne16	%f12,	%f12,	%i1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sra	%l5,	0x07,	%i4
	sll	%g6,	%l3,	%l2
	fnegs	%f1,	%f17
	brlz	%g2,	loop_2573
	sethi	0x13A2,	%i0
	bvs,a,pt	%icc,	loop_2574
	fmovdneg	%icc,	%f28,	%f2
loop_2573:
	edge8ln	%o0,	%i7,	%o3
	fbul,a	%fcc1,	loop_2575
loop_2574:
	sdiv	%g1,	0x1E06,	%o1
	tsubcc	%o4,	0x1FD7,	%i5
	fornot2s	%f14,	%f15,	%f31
loop_2575:
	fmovspos	%xcc,	%f18,	%f23
	ldd	[%l7 + 0x78],	%l0
	membar	0x1A
	movgu	%icc,	%g3,	%l4
	mova	%icc,	%o2,	%l0
	tsubcctv	%o5,	0x0E9B,	%o6
	popc	%g7,	%i3
	bge,a,pn	%xcc,	loop_2576
	taddcctv	%i6,	%l6,	%i2
	tsubcc	%o7,	0x17E2,	%g5
	membar	0x23
loop_2576:
	subccc	%i1,	%l5,	%i4
	xnorcc	%g6,	%l3,	%l2
	tneg	%xcc,	0x2
	movrne	%g4,	%g2,	%o0
	addc	%i7,	%o3,	%g1
	movrlez	%i0,	%o1,	%o4
	bneg,pn	%xcc,	loop_2577
	lduw	[%l7 + 0x1C],	%i5
	xorcc	%l1,	%l4,	%o2
	xor	%l0,	%o5,	%o6
loop_2577:
	movrlz	%g3,	%g7,	%i3
	set	0x48, %l2
	ldxa	[%l7 + %l2] 0x19,	%i6
	fbuge	%fcc2,	loop_2578
	ldd	[%l7 + 0x68],	%f4
	srax	%l6,	%i2,	%o7
	orcc	%g5,	0x0251,	%l5
loop_2578:
	mulx	%i1,	0x08B1,	%i4
	fbul,a	%fcc2,	loop_2579
	fandnot2s	%f29,	%f28,	%f12
	xorcc	%g6,	0x0D76,	%l3
	mova	%xcc,	%l2,	%g2
loop_2579:
	alignaddrl	%o0,	%g4,	%i7
	ldd	[%l7 + 0x30],	%f20
	wr	%g0,	0x89,	%asi
	ldswa	[%l7 + 0x44] %asi,	%g1
	movre	%o3,	%i0,	%o1
	movge	%xcc,	%o4,	%l1
	siam	0x0
	lduh	[%l7 + 0x16],	%i5
	move	%icc,	%l4,	%l0
	srax	%o5,	%o6,	%o2
	bpos,a	loop_2580
	ldsh	[%l7 + 0x60],	%g7
	taddcc	%i3,	%i6,	%l6
	or	%g3,	%i2,	%g5
loop_2580:
	umulcc	%o7,	0x11AD,	%i1
	wr	%g0,	0x88,	%asi
	ldswa	[%l7 + 0x0C] %asi,	%l5
	andncc	%g6,	%l3,	%i4
	array8	%g2,	%o0,	%g4
	sll	%l2,	%i7,	%g1
	udivcc	%o3,	0x1C12,	%o1
	wr	%g0,	0x58,	%asi
	ldxa	[%g0 + 0x0] %asi,	%i0
	edge8l	%o4,	%l1,	%l4
	subcc	%l0,	%o5,	%o6
	ta	%icc,	0x1
	movrne	%o2,	%g7,	%i5
	fbg	%fcc2,	loop_2581
	movrgez	%i6,	%l6,	%g3
	fmovdcc	%xcc,	%f6,	%f12
	set	0x1E, %l3
	stha	%i3,	[%l7 + %l3] 0x23
	membar	#Sync
loop_2581:
	bneg,a	%icc,	loop_2582
	siam	0x7
	fbge,a	%fcc3,	loop_2583
	addc	%i2,	%o7,	%g5
loop_2582:
	fmovdpos	%xcc,	%f1,	%f4
	movvc	%icc,	%i1,	%l5
loop_2583:
	movgu	%xcc,	%g6,	%i4
	movcs	%xcc,	%l3,	%g2
	srlx	%o0,	0x14,	%g4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stw	%i7,	[%l7 + 0x68]
	movg	%xcc,	%l2,	%g1
	wr	%g0,	0x04,	%asi
	sta	%f13,	[%l7 + 0x64] %asi
	array8	%o3,	%o1,	%o4
	movvc	%icc,	%l1,	%l4
	fbne,a	%fcc3,	loop_2584
	fcmpne32	%f14,	%f30,	%i0
	membar	0x67
	fandnot1	%f2,	%f26,	%f24
loop_2584:
	movrgz	%l0,	%o5,	%o2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	and	%g7,	%i5,	%i6
	movl	%xcc,	%o6,	%l6
	sllx	%i3,	0x05,	%i2
	bneg,pt	%xcc,	loop_2585
	and	%o7,	%g3,	%i1
	set	0x24, %g7
	stwa	%g5,	[%l7 + %g7] 0x23
	membar	#Sync
loop_2585:
	nop
	wr	%g0,	0x18,	%asi
	ldsha	[%l7 + 0x24] %asi,	%g6
	edge16	%l5,	%i4,	%g2
	array32	%l3,	%o0,	%g4
	wr	%g0,	0x80,	%asi
	ldsba	[%l7 + 0x72] %asi,	%i7
	edge16l	%g1,	%o3,	%o1
	popc	0x0361,	%l2
	fmovspos	%icc,	%f0,	%f20
	bleu,a,pn	%xcc,	loop_2586
	fbl,a	%fcc3,	loop_2587
	movgu	%xcc,	%o4,	%l1
	umul	%l4,	%i0,	%o5
loop_2586:
	subc	%l0,	%g7,	%i5
loop_2587:
	fcmpgt32	%f12,	%f16,	%o2
	stx	%i6,	[%l7 + 0x78]
	movle	%icc,	%l6,	%o6
	smul	%i3,	%o7,	%i2
	be,pn	%icc,	loop_2588
	udivx	%g3,	0x07F9,	%g5
	fmovdvs	%xcc,	%f31,	%f8
	fbn,a	%fcc2,	loop_2589
loop_2588:
	bcs,a	%icc,	loop_2590
	udivcc	%g6,	0x0E6C,	%i1
	fmul8sux16	%f0,	%f18,	%f30
loop_2589:
	bvc,a,pt	%xcc,	loop_2591
loop_2590:
	orncc	%i4,	0x105D,	%l5
	fmovsgu	%icc,	%f6,	%f21
	popc	0x191B,	%l3
loop_2591:
	ldd	[%l7 + 0x68],	%o0
	fbn	%fcc2,	loop_2592
	bvc,a,pt	%xcc,	loop_2593
	fnor	%f18,	%f24,	%f10
	movre	%g2,	%i7,	%g1
loop_2592:
	fmovdg	%xcc,	%f0,	%f8
loop_2593:
	edge16n	%g4,	%o1,	%o3
	edge8ln	%o4,	%l1,	%l2
	bcc,a	loop_2594
	brgz	%l4,	loop_2595
	ldx	[%l7 + 0x58],	%i0
	fcmped	%fcc1,	%f8,	%f14
loop_2594:
	udiv	%o5,	0x1269,	%l0
loop_2595:
	orcc	%i5,	0x12FA,	%o2
	fmul8x16au	%f10,	%f13,	%f26
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	add	%l7,	0x58,	%l6
	wr	%g0,	0x18,	%asi
	casxa	[%l6] %asi,	%i6,	%g7
	fbo	%fcc0,	loop_2596
	fsrc2s	%f14,	%f4
	umul	%l6,	%o6,	%o7
	fcmple32	%f6,	%f16,	%i2
loop_2596:
	sllx	%i3,	0x18,	%g3
	movleu	%icc,	%g6,	%g5
	fnor	%f28,	%f0,	%f2
	fbu,a	%fcc0,	loop_2597
	fbe	%fcc3,	loop_2598
	addcc	%i4,	%l5,	%l3
	tsubcctv	%o0,	0x1397,	%g2
loop_2597:
	tcc	%xcc,	0x2
loop_2598:
	tg	%icc,	0x5
	ble,a,pn	%icc,	loop_2599
	movleu	%icc,	%i1,	%g1
	fmovrdlez	%g4,	%f24,	%f22
	smul	%o1,	%i7,	%o3
loop_2599:
	siam	0x7
	edge16l	%o4,	%l2,	%l1
	bcs,a	loop_2600
	andn	%i0,	%o5,	%l0
	wr	%g0,	0x18,	%asi
	prefetcha	[%l7 + 0x38] %asi,	 0x2
loop_2600:
	bcc,pn	%xcc,	loop_2601
	tvc	%icc,	0x7
	brz,a	%l4,	loop_2602
	or	%i6,	0x1E7B,	%o2
loop_2601:
	orcc	%g7,	%o6,	%l6
	xnorcc	%i2,	0x0CD9,	%i3
loop_2602:
	brlez,a	%g3,	loop_2603
	fcmpgt32	%f0,	%f6,	%g6
	edge32	%o7,	%g5,	%i4
	stw	%l3,	[%l7 + 0x5C]
loop_2603:
	nop
	wr	%g0,	0x19,	%asi
	ldsba	[%l7 + 0x50] %asi,	%l5
	add	%g2,	0x170C,	%o0
	bne,pt	%icc,	loop_2604
	smulcc	%g1,	0x17E3,	%g4
	move	%icc,	%i1,	%i7
	taddcc	%o3,	%o1,	%o4
loop_2604:
	movge	%icc,	%l2,	%l1
	movrgz	%o5,	%i0,	%l0
	add	%l4,	%i6,	%i5
	srax	%g7,	%o6,	%l6
	wr	%g0,	0x0c,	%asi
	swapa	[%l7 + 0x30] %asi,	%i2
	fbuge	%fcc3,	loop_2605
	sir	0x1177
	bn,a	%xcc,	loop_2606
	fmovsleu	%icc,	%f22,	%f12
loop_2605:
	edge8ln	%i3,	%o2,	%g3
	mova	%icc,	%o7,	%g6
loop_2606:
	addcc	%g5,	%i4,	%l3
	stx	%g2,	[%l7 + 0x38]
	set	0x34, %l5
	stwa	%l5,	[%l7 + %l5] 0x27
	membar	#Sync
	xnorcc	%g1,	0x19EB,	%o0
	movre	%i1,	0x088,	%i7
	fmovrde	%g4,	%f4,	%f18
	andcc	%o3,	0x01CA,	%o4
	sllx	%l2,	0x17,	%l1
	fmovda	%xcc,	%f23,	%f5
	fbue,a	%fcc3,	loop_2607
	fabss	%f13,	%f26
	fnot1	%f26,	%f4
	bneg,a,pn	%xcc,	loop_2608
loop_2607:
	edge8ln	%o1,	%o5,	%l0
	edge32	%l4,	%i6,	%i5
	stw	%g7,	[%l7 + 0x50]
loop_2608:
	nop
	add	%l7,	0x48,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%o6
	casxa	[%l6] %asi,	%o6,	%i0
	movg	%icc,	%l6,	%i3
	sllx	%o2,	0x05,	%g3
	movle	%xcc,	%o7,	%i2
	movrgez	%g6,	0x353,	%g5
	sir	0x1627
	brnz,a	%l3,	loop_2609
	sdivx	%i4,	0x1A8E,	%g2
	srl	%g1,	0x13,	%l5
	sll	%o0,	%i1,	%i7
loop_2609:
	movrlez	%o3,	0x24A,	%g4
	te	%icc,	0x0
	movpos	%xcc,	%o4,	%l2
	movcc	%xcc,	%l1,	%o1
	xorcc	%o5,	%l0,	%l4
	fpackfix	%f16,	%f14
	addc	%i6,	%g7,	%o6
	brgez	%i5,	loop_2610
	fbl	%fcc1,	loop_2611
	srl	%l6,	0x01,	%i0
	fmovrdgez	%o2,	%f10,	%f18
loop_2610:
	movle	%icc,	%i3,	%o7
loop_2611:
	lduh	[%l7 + 0x48],	%i2
	edge32l	%g3,	%g6,	%g5
	tl	%xcc,	0x0
	srl	%i4,	0x0F,	%l3
	edge32	%g2,	%g1,	%o0
	membar	0x31
	set	0x10, %g1
	stwa	%l5,	[%l7 + %g1] 0x11
	set	0x74, %l4
	ldsha	[%l7 + %l4] 0x88,	%i1
	flush	%l7 + 0x50
	set	0x78, %o7
	stba	%i7,	[%l7 + %o7] 0x14
	subc	%o3,	0x118A,	%o4
	sdivcc	%g4,	0x0B7E,	%l2
	fzero	%f16
	array32	%o1,	%l1,	%o5
	sra	%l0,	0x1E,	%i6
	tge	%xcc,	0x0
	fands	%f16,	%f11,	%f29
	fxnors	%f25,	%f28,	%f2
	add	%l7,	0x14,	%l6
	wr	%g0,	0x19,	%asi
	casa	[%l6] %asi,	%l4,	%o6
	edge8	%g7,	%i5,	%i0
	srax	%l6,	%i3,	%o7
	alignaddr	%i2,	%g3,	%o2
	movneg	%icc,	%g5,	%g6
	bge	loop_2612
	tsubcc	%i4,	%g2,	%g1
	prefetch	[%l7 + 0x74],	 0x1
	stw	%o0,	[%l7 + 0x40]
loop_2612:
	fmovdleu	%icc,	%f31,	%f15
	orcc	%l3,	0x0174,	%l5
	ldd	[%l7 + 0x68],	%f26
	fbuge	%fcc2,	loop_2613
	fbne,a	%fcc1,	loop_2614
	movcc	%icc,	%i1,	%i7
	add	%o3,	%g4,	%o4
loop_2613:
	fmuld8ulx16	%f16,	%f20,	%f22
loop_2614:
	sllx	%l2,	0x13,	%l1
	fmovdvs	%icc,	%f19,	%f0
	ldsh	[%l7 + 0x46],	%o5
	add	%l0,	%o1,	%i6
	orncc	%o6,	%g7,	%i5
	wr	%g0,	0x22,	%asi
	ldda	[%l7 + 0x20] %asi,	%l4
	sdivx	%l6,	0x0B7E,	%i3
	array16	%i0,	%o7,	%i2
	fbge	%fcc0,	loop_2615
	for	%f14,	%f8,	%f0
	sdivx	%o2,	0x1D0C,	%g5
	wr	%g0,	0x19,	%asi
	stwa	%g3,	[%l7 + 0x4C] %asi
loop_2615:
	udivx	%g6,	0x08F4,	%i4
	tsubcc	%g2,	%g1,	%o0
	fmovrdgez	%l5,	%f16,	%f10
	xor	%i1,	0x140C,	%i7
	fornot1s	%f25,	%f2,	%f12
	tl	%icc,	0x5
	brgez	%o3,	loop_2616
	fcmps	%fcc3,	%f30,	%f30
	sdiv	%g4,	0x1073,	%l3
	bpos,pn	%icc,	loop_2617
loop_2616:
	udivx	%o4,	0x026D,	%l2
	udiv	%l1,	0x1B11,	%l0
	ldd	[%l7 + 0x48],	%o0
loop_2617:
	addccc	%o5,	0x1479,	%o6
	fnot1s	%f28,	%f7
	swap	[%l7 + 0x54],	%i6
	brz	%i5,	loop_2618
	call	loop_2619
	bvc,pn	%xcc,	loop_2620
	fmovscc	%xcc,	%f11,	%f4
loop_2618:
	andn	%l4,	%g7,	%l6
loop_2619:
	addc	%i3,	0x1CF1,	%i0
loop_2620:
	or	%o7,	0x149B,	%i2
	wr	%g0,	0x80,	%asi
	lduba	[%l7 + 0x2A] %asi,	%g5
	movrgez	%o2,	0x0F5,	%g6
	ldub	[%l7 + 0x73],	%g3
	edge8l	%i4,	%g2,	%g1
	wr	%g0,	0x81,	%asi
	stxa	%o0,	[%l7 + 0x50] %asi
	ta	%icc,	0x4
	movg	%xcc,	%l5,	%i7
	fbn	%fcc2,	loop_2621
	fmovsgu	%icc,	%f7,	%f18
	movrgz	%o3,	0x291,	%g4
	sub	%i1,	%o4,	%l2
loop_2621:
	smulcc	%l3,	%l0,	%o1
	edge16n	%o5,	%l1,	%o6
	sir	0x1697
	mova	%xcc,	%i6,	%l4
	bvs	loop_2622
	subc	%g7,	0x04E9,	%i5
	sir	0x0311
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2622:
	bleu,a,pt	%xcc,	loop_2623
	movcc	%icc,	%i3,	%i0
	bcc,a,pn	%xcc,	loop_2624
	subccc	%o7,	%i2,	%g5
loop_2623:
	fnors	%f26,	%f30,	%f22
	tge	%xcc,	0x3
loop_2624:
	fpadd32s	%f17,	%f9,	%f26
	umul	%o2,	%l6,	%g3
	or	%g6,	%i4,	%g1
	umulcc	%g2,	%l5,	%o0
	fpsub32	%f16,	%f2,	%f26
	tsubcctv	%o3,	0x1FD3,	%g4
	set	0x64, %i0
	lda	[%l7 + %i0] 0x10,	%f18
	movcc	%xcc,	%i1,	%o4
	xnor	%l2,	%l3,	%i7
	movvc	%icc,	%l0,	%o1
	fbg	%fcc3,	loop_2625
	membar	0x35
	bvs,a,pn	%icc,	loop_2626
	ta	%xcc,	0x3
loop_2625:
	tleu	%xcc,	0x4
	tl	%xcc,	0x4
loop_2626:
	xor	%l1,	0x1D6C,	%o5
	tcc	%xcc,	0x1
	edge16	%o6,	%i6,	%l4
	ldub	[%l7 + 0x31],	%i5
	fmovdcs	%xcc,	%f14,	%f1
	udivx	%g7,	0x06BF,	%i3
	tne	%icc,	0x0
	tn	%xcc,	0x5
	fmovsge	%icc,	%f16,	%f26
	movrgz	%o7,	%i2,	%g5
	mova	%xcc,	%i0,	%l6
	fpsub16	%f0,	%f0,	%f30
	tn	%icc,	0x6
	andncc	%g3,	%g6,	%o2
	movrgz	%i4,	%g1,	%g2
	fcmple16	%f24,	%f6,	%o0
	bn,a	loop_2627
	edge16ln	%o3,	%g4,	%i1
	brz	%o4,	loop_2628
	tpos	%xcc,	0x6
loop_2627:
	fpsub32s	%f0,	%f30,	%f10
	tl	%xcc,	0x3
loop_2628:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	and	%l5,	0x14EC,	%l3
	siam	0x7
	xor	%l2,	0x1BA5,	%i7
	bne,a	loop_2629
	srl	%o1,	0x0A,	%l0
	orncc	%l1,	%o6,	%o5
	sth	%i6,	[%l7 + 0x08]
loop_2629:
	fmovdvs	%icc,	%f25,	%f26
	brgz,a	%l4,	loop_2630
	brz,a	%i5,	loop_2631
	andncc	%i3,	%o7,	%i2
	fnands	%f27,	%f22,	%f23
loop_2630:
	fornot2	%f14,	%f2,	%f24
loop_2631:
	mulx	%g5,	0x03BA,	%g7
	movge	%xcc,	%i0,	%l6
	bcs,pt	%icc,	loop_2632
	tcs	%xcc,	0x6
	wr	%g0,	0x04,	%asi
	ldsba	[%l7 + 0x29] %asi,	%g6
loop_2632:
	smulcc	%o2,	%i4,	%g3
	movrgz	%g1,	0x0BB,	%o0
	sra	%g2,	0x12,	%g4
	sub	%i1,	0x0E08,	%o4
	movpos	%icc,	%o3,	%l5
	sethi	0x1E5A,	%l3
	movvs	%xcc,	%l2,	%i7
	ldsw	[%l7 + 0x6C],	%l0
	ldsh	[%l7 + 0x3C],	%o1
	movgu	%icc,	%o6,	%l1
	stbar
	wr	%g0,	0xe3,	%asi
	stba	%i6,	[%l7 + 0x79] %asi
	membar	#Sync
	tn	%xcc,	0x3
	smulcc	%o5,	0x01C8,	%i5
	edge8	%l4,	%i3,	%o7
	array32	%g5,	%g7,	%i0
	movgu	%icc,	%i2,	%g6
	wr	%g0,	0x89,	%asi
	sta	%f1,	[%l7 + 0x7C] %asi
	fornot1s	%f7,	%f2,	%f18
	fbe	%fcc3,	loop_2633
	movcc	%icc,	%l6,	%i4
	edge16n	%o2,	%g1,	%o0
	taddcctv	%g3,	0x195B,	%g4
loop_2633:
	fbule	%fcc3,	loop_2634
	addc	%i1,	%g2,	%o3
	bvc	loop_2635
	te	%icc,	0x1
loop_2634:
	tcs	%icc,	0x3
	fmul8x16au	%f22,	%f27,	%f2
loop_2635:
	sllx	%o4,	%l3,	%l5
	bvc	%icc,	loop_2636
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fornot2	%f2,	%f20,	%f2
	andncc	%l2,	%l0,	%o1
loop_2636:
	tl	%icc,	0x5
	fands	%f22,	%f1,	%f5
	movrgz	%o6,	%i7,	%i6
	fcmple16	%f10,	%f10,	%l1
	brlez,a	%i5,	loop_2637
	array16	%o5,	%i3,	%l4
	fandnot2	%f20,	%f14,	%f30
	edge8l	%g5,	%g7,	%i0
loop_2637:
	fmovsvs	%icc,	%f3,	%f29
	tvc	%xcc,	0x5
	bshuffle	%f8,	%f12,	%f28
	wr	%g0,	0x80,	%asi
	stba	%o7,	[%l7 + 0x13] %asi
	fpack16	%f2,	%f14
	alignaddr	%i2,	%l6,	%g6
	edge32n	%o2,	%g1,	%i4
	xorcc	%o0,	%g4,	%i1
	sub	%g3,	0x1683,	%o3
	set	0x20, %g5
	prefetcha	[%l7 + %g5] 0x18,	 0x2
	move	%icc,	%o4,	%l3
	xor	%l2,	0x09F8,	%l0
	wr	%g0,	0x0c,	%asi
	ldsba	[%l7 + 0x70] %asi,	%o1
	fone	%f0
	fnands	%f23,	%f16,	%f27
	sll	%o6,	0x01,	%i7
	tne	%icc,	0x4
	movneg	%xcc,	%i6,	%l1
	sdiv	%l5,	0x1B98,	%o5
	fbul,a	%fcc2,	loop_2638
	faligndata	%f26,	%f6,	%f26
	movcc	%xcc,	%i3,	%l4
	subccc	%g5,	%g7,	%i5
loop_2638:
	edge16l	%o7,	%i0,	%i2
	andncc	%l6,	%g6,	%g1
	tg	%xcc,	0x6
	tge	%icc,	0x2
	bvs,pt	%icc,	loop_2639
	fbul	%fcc0,	loop_2640
	fpack16	%f10,	%f4
	tvc	%xcc,	0x3
loop_2639:
	fcmped	%fcc1,	%f2,	%f10
loop_2640:
	fands	%f20,	%f15,	%f10
	movle	%xcc,	%i4,	%o0
	fmovrdne	%o2,	%f6,	%f12
	edge32	%g4,	%g3,	%o3
	array16	%g2,	%i1,	%o4
	movle	%xcc,	%l2,	%l0
	flush	%l7 + 0x44
	fmovrsne	%o1,	%f22,	%f22
	tcs	%icc,	0x7
	tge	%xcc,	0x6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andn	%o6,	%l3,	%i7
	movn	%icc,	%i6,	%l5
	wr	%g0,	0x04,	%asi
	ldstuba	[%l7 + 0x25] %asi,	%o5
	faligndata	%f22,	%f20,	%f8
	addc	%l1,	%i3,	%l4
	or	%g5,	%i5,	%g7
	smul	%i0,	0x17DB,	%i2
	tcs	%icc,	0x2
	tle	%xcc,	0x1
	fbul	%fcc0,	loop_2641
	tpos	%icc,	0x4
	tpos	%icc,	0x5
	fnot2s	%f10,	%f13
loop_2641:
	movl	%xcc,	%o7,	%g6
	swap	[%l7 + 0x78],	%l6
	popc	%i4,	%g1
	bg,pn	%xcc,	loop_2642
	subccc	%o0,	0x034C,	%g4
	edge32	%g3,	%o2,	%o3
	movrne	%g2,	%i1,	%l2
loop_2642:
	move	%xcc,	%l0,	%o4
	sll	%o6,	0x1D,	%l3
	membar	0x23
	movgu	%xcc,	%i7,	%o1
	array8	%i6,	%l5,	%o5
	lduw	[%l7 + 0x08],	%l1
	tne	%icc,	0x5
	set	0x4A, %o0
	lduba	[%l7 + %o0] 0x81,	%i3
	addccc	%g5,	%i5,	%l4
	tcc	%xcc,	0x5
	edge16	%g7,	%i2,	%i0
	set	0x08, %o3
	prefetcha	[%l7 + %o3] 0x15,	 0x1
	fmovrdgz	%g6,	%f28,	%f10
	tg	%xcc,	0x5
	move	%xcc,	%i4,	%l6
	xorcc	%g1,	%g4,	%o0
	sll	%g3,	0x04,	%o3
	andn	%g2,	%o2,	%l2
	sll	%i1,	0x16,	%l0
	tcs	%xcc,	0x2
	siam	0x4
	alignaddrl	%o6,	%l3,	%o4
	subc	%o1,	0x1B9F,	%i7
	set	0x55, %o4
	ldsba	[%l7 + %o4] 0x10,	%l5
	andcc	%o5,	0x0243,	%i6
	tleu	%xcc,	0x1
	srl	%l1,	%i3,	%g5
	fmovrde	%l4,	%f10,	%f16
	fpmerge	%f8,	%f19,	%f20
	xnor	%g7,	0x16C3,	%i5
	edge16l	%i0,	%o7,	%i2
	ldsb	[%l7 + 0x1E],	%g6
	movre	%l6,	%i4,	%g4
	wr	%g0,	0x88,	%asi
	stda	%o0,	[%l7 + 0x48] %asi
	srax	%g3,	0x17,	%g1
	udivcc	%o3,	0x0574,	%g2
	movneg	%icc,	%o2,	%i1
	nop
	setx	loop_2643,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	move	%icc,	%l2,	%l0
	movrgz	%o6,	0x2C5,	%o4
	tvs	%icc,	0x3
loop_2643:
	and	%l3,	0x0B2E,	%o1
	fbge	%fcc0,	loop_2644
	fcmple16	%f0,	%f22,	%i7
	edge8ln	%l5,	%i6,	%o5
	tvc	%xcc,	0x0
loop_2644:
	fnors	%f15,	%f24,	%f10
	mulscc	%l1,	%g5,	%i3
	nop
	setx loop_2645, %l0, %l1
	jmpl %l1, %l4
	andncc	%i5,	%g7,	%o7
	tg	%xcc,	0x4
	movrgz	%i2,	0x1F1,	%g6
loop_2645:
	ldsw	[%l7 + 0x64],	%l6
	fands	%f20,	%f8,	%f30
	addccc	%i0,	0x00FF,	%g4
	brz,a	%i4,	loop_2646
	fbug	%fcc0,	loop_2647
	stb	%o0,	[%l7 + 0x77]
	movle	%icc,	%g3,	%g1
loop_2646:
	movgu	%xcc,	%o3,	%o2
loop_2647:
	fbge	%fcc3,	loop_2648
	tsubcctv	%g2,	%i1,	%l0
	movrlz	%o6,	0x10C,	%o4
	wr	%g0,	0x17,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
loop_2648:
	nop
	set	0x0C, %i2
	lduha	[%l7 + %i2] 0x19,	%l2
	ldd	[%l7 + 0x20],	%f24
	movneg	%xcc,	%o1,	%l3
	fmovrdlz	%l5,	%f18,	%f4
	tcc	%xcc,	0x4
	movre	%i7,	%o5,	%i6
	tge	%xcc,	0x1
	tcs	%icc,	0x4
	bleu,pn	%icc,	loop_2649
	xnorcc	%l1,	0x1F5E,	%i3
	tgu	%xcc,	0x5
	wr	%g0,	0x89,	%asi
	ldswa	[%l7 + 0x34] %asi,	%g5
loop_2649:
	edge16	%l4,	%g7,	%i5
	addccc	%o7,	%i2,	%g6
	stbar
	wr	%g0,	0x2b,	%asi
	ldda	[%l7 + 0x20] %asi,	%i6
	movrlz	%g4,	0x234,	%i4
	tg	%xcc,	0x5
	fnot2	%f0,	%f0
	ldstub	[%l7 + 0x18],	%o0
	andn	%i0,	%g1,	%g3
	tleu	%xcc,	0x7
	addcc	%o3,	%g2,	%o2
	nop
	set	0x52, %i7
	ldstub	[%l7 + %i7],	%l0
	stw	%i1,	[%l7 + 0x08]
	fnands	%f10,	%f28,	%f21
	fornot1	%f8,	%f26,	%f26
	fsrc2s	%f9,	%f2
	movle	%icc,	%o4,	%o6
	movgu	%icc,	%l2,	%o1
	movgu	%xcc,	%l3,	%i7
	fbule,a	%fcc3,	loop_2650
	edge32n	%l5,	%o5,	%l1
	fmovsleu	%xcc,	%f8,	%f21
	set	0x78, %g6
	stha	%i3,	[%l7 + %g6] 0x19
loop_2650:
	mulscc	%g5,	0x09EE,	%l4
	tn	%xcc,	0x7
	set	0x30, %o2
	lda	[%l7 + %o2] 0x15,	%f1
	fandnot1s	%f13,	%f13,	%f17
	set	0x58, %g2
	ldswa	[%l7 + %g2] 0x18,	%g7
	movpos	%xcc,	%i6,	%i5
	subcc	%o7,	0x1BF9,	%i2
	movl	%xcc,	%l6,	%g4
	wr	%g0,	0x89,	%asi
	ldsha	[%l7 + 0x2C] %asi,	%g6
	movpos	%icc,	%i4,	%i0
	movrlez	%o0,	%g3,	%g1
	edge8n	%g2,	%o3,	%o2
	fands	%f5,	%f11,	%f31
	alignaddrl	%i1,	%l0,	%o6
	sra	%o4,	0x18,	%o1
	fmovdge	%xcc,	%f18,	%f10
	andncc	%l3,	%l2,	%l5
	fble,a	%fcc0,	loop_2651
	and	%o5,	0x041F,	%i7
	fbo,a	%fcc0,	loop_2652
	movne	%icc,	%i3,	%l1
loop_2651:
	nop
	wr	%g0,	0x2a,	%asi
	stda	%g4,	[%l7 + 0x70] %asi
	membar	#Sync
loop_2652:
	fbug	%fcc2,	loop_2653
	edge16	%l4,	%g7,	%i5
	sdiv	%o7,	0x1517,	%i2
	umulcc	%l6,	0x19D7,	%i6
loop_2653:
	tcc	%xcc,	0x1
	set	0x10, %i6
	ldxa	[%l7 + %i6] 0x14,	%g4
	or	%g6,	%i4,	%i0
	alignaddrl	%g3,	%o0,	%g2
	subccc	%g1,	0x01F6,	%o2
	membar	#Sync
	set	0x40, %l0
	ldda	[%l7 + %l0] 0xf8,	%f16
	bvs	loop_2654
	fbe	%fcc1,	loop_2655
	orncc	%o3,	0x1826,	%l0
	movcs	%xcc,	%i1,	%o4
loop_2654:
	membar	0x00
loop_2655:
	sub	%o6,	%l3,	%l2
	membar	#Sync
	wr	%g0,	0x17,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	fnands	%f12,	%f15,	%f2
	fmovsl	%icc,	%f18,	%f26
	set	0x78, %i4
	ldswa	[%l7 + %i4] 0x0c,	%o1
	bvc,a	%xcc,	loop_2656
	xorcc	%l5,	0x0381,	%o5
	te	%xcc,	0x7
	or	%i7,	0x0047,	%i3
loop_2656:
	brnz,a	%g5,	loop_2657
	fmovscs	%icc,	%f18,	%f24
	popc	0x0622,	%l4
	set	0x60, %i3
	prefetcha	[%l7 + %i3] 0x04,	 0x2
loop_2657:
	subcc	%i5,	%g7,	%i2
	fxnors	%f13,	%f10,	%f26
	orcc	%o7,	%l6,	%g4
	fcmpeq16	%f12,	%f14,	%g6
	nop
	setx	loop_2658,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	edge32n	%i6,	%i4,	%i0
	tneg	%icc,	0x0
	andcc	%g3,	%g2,	%g1
loop_2658:
	bn	%xcc,	loop_2659
	brnz,a	%o0,	loop_2660
	fbg	%fcc3,	loop_2661
	xnorcc	%o3,	0x18DC,	%o2
loop_2659:
	subc	%l0,	0x1ED4,	%o4
loop_2660:
	nop
	wr	%g0,	0x11,	%asi
	stxa	%i1,	[%l7 + 0x40] %asi
loop_2661:
	umul	%l3,	%l2,	%o1
	tleu	%xcc,	0x3
	wr	%g0,	0x81,	%asi
	stwa	%l5,	[%l7 + 0x6C] %asi
	brlz	%o5,	loop_2662
	fnot2s	%f3,	%f6
	edge8n	%o6,	%i3,	%i7
	bge,a	loop_2663
loop_2662:
	fzeros	%f30
	membar	0x0B
	orcc	%g5,	0x0E96,	%l1
loop_2663:
	tpos	%icc,	0x4
	mova	%icc,	%l4,	%g7
	swap	[%l7 + 0x14],	%i2
	tvs	%xcc,	0x6
	brgz	%o7,	loop_2664
	fxor	%f0,	%f14,	%f20
	edge8l	%l6,	%g4,	%g6
	movrgez	%i6,	0x01D,	%i4
loop_2664:
	bneg,a,pn	%xcc,	loop_2665
	addc	%i5,	%i0,	%g2
	udiv	%g3,	0x146A,	%o0
	popc	%o3,	%g1
loop_2665:
	popc	0x00FC,	%l0
	sir	0x14E1
	fbne	%fcc3,	loop_2666
	ldsb	[%l7 + 0x67],	%o2
	fmovrdgez	%i1,	%f26,	%f28
	tgu	%xcc,	0x6
loop_2666:
	tle	%xcc,	0x4
	fmovrdgez	%o4,	%f22,	%f12
	taddcctv	%l3,	0x0CB4,	%l2
	fmovsgu	%xcc,	%f2,	%f29
	popc	0x0FEB,	%o1
	tg	%xcc,	0x4
	movvs	%icc,	%l5,	%o6
	nop
	set	0x3C, %o6
	ldsw	[%l7 + %o6],	%i3
	fmul8sux16	%f30,	%f26,	%f22
	umulcc	%o5,	0x070F,	%g5
	fpadd32s	%f27,	%f0,	%f21
	for	%f30,	%f24,	%f26
	bvs	loop_2667
	brlz	%l1,	loop_2668
	movvs	%icc,	%l4,	%i7
	tpos	%xcc,	0x2
loop_2667:
	fmovscs	%xcc,	%f24,	%f30
loop_2668:
	movne	%xcc,	%i2,	%o7
	addccc	%g7,	%l6,	%g6
	wr	%g0,	0xeb,	%asi
	stda	%g4,	[%l7 + 0x10] %asi
	membar	#Sync
	fmul8x16al	%f23,	%f21,	%f30
	fabss	%f27,	%f4
	fone	%f24
	edge16ln	%i6,	%i5,	%i0
	movrgez	%g2,	%i4,	%g3
	fmovsl	%icc,	%f0,	%f16
	tvs	%xcc,	0x0
	movne	%xcc,	%o0,	%g1
	edge32n	%o3,	%l0,	%i1
	sethi	0x1A78,	%o4
	fnand	%f20,	%f24,	%f24
	fand	%f22,	%f2,	%f22
	fnot1	%f28,	%f10
	bvc,a,pn	%icc,	loop_2669
	stbar
	movn	%icc,	%o2,	%l3
	nop
	set	0x48, %l1
	ldd	[%l7 + %l1],	%f28
loop_2669:
	sll	%o1,	%l2,	%l5
	movrlz	%i3,	%o5,	%g5
	tcc	%icc,	0x3
	fsrc2	%f16,	%f4
	movpos	%xcc,	%o6,	%l1
	fbuge	%fcc1,	loop_2670
	edge32n	%i7,	%l4,	%o7
	sir	0x05C4
	edge8ln	%g7,	%l6,	%g6
loop_2670:
	add	%i2,	0x024C,	%g4
	stw	%i6,	[%l7 + 0x78]
	tle	%xcc,	0x4
	movge	%xcc,	%i0,	%i5
	orcc	%g2,	%i4,	%o0
	edge16	%g1,	%o3,	%l0
	fnegd	%f26,	%f28
	andncc	%g3,	%o4,	%o2
	movle	%icc,	%i1,	%l3
	bcc,pt	%xcc,	loop_2671
	sllx	%l2,	%l5,	%o1
	subcc	%o5,	%g5,	%o6
	edge16	%i3,	%l1,	%l4
loop_2671:
	fbe,a	%fcc1,	loop_2672
	edge16ln	%o7,	%i7,	%g7
	fble,a	%fcc1,	loop_2673
	ta	%icc,	0x4
loop_2672:
	tl	%icc,	0x5
	fcmpeq32	%f2,	%f14,	%l6
loop_2673:
	edge16ln	%g6,	%g4,	%i2
	movvs	%icc,	%i0,	%i5
	fxor	%f10,	%f20,	%f12
	edge8l	%i6,	%g2,	%o0
	movn	%xcc,	%g1,	%o3
	tl	%icc,	0x2
	movgu	%xcc,	%l0,	%g3
	fmovrdgz	%i4,	%f10,	%f24
	fmovdge	%icc,	%f16,	%f21
	subc	%o4,	0x0D0C,	%o2
	nop
	set	0x40, %i1
	std	%f24,	[%l7 + %i1]
	fnand	%f26,	%f28,	%f26
	tsubcctv	%l3,	0x09B8,	%l2
	ld	[%l7 + 0x5C],	%f31
	be,pn	%xcc,	loop_2674
	sllx	%i1,	0x12,	%o1
	nop
	set	0x37, %l6
	ldub	[%l7 + %l6],	%l5
	nop
	setx	loop_2675,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_2674:
	siam	0x5
	ba,a	loop_2676
	fxnor	%f2,	%f22,	%f8
loop_2675:
	smulcc	%g5,	%o5,	%o6
	fandnot2s	%f29,	%f25,	%f25
loop_2676:
	movcs	%xcc,	%l1,	%l4
	fbule,a	%fcc3,	loop_2677
	movneg	%xcc,	%o7,	%i3
	movre	%i7,	%l6,	%g6
	movrgz	%g7,	0x354,	%g4
loop_2677:
	movcc	%icc,	%i2,	%i0
	tpos	%icc,	0x4
	fxnors	%f8,	%f11,	%f31
	lduh	[%l7 + 0x2A],	%i5
	tl	%xcc,	0x5
	taddcctv	%g2,	0x1B54,	%i6
	movrgz	%g1,	%o3,	%l0
	movrne	%g3,	%i4,	%o0
	tcs	%xcc,	0x2
	wr	%g0,	0xeb,	%asi
	stda	%o4,	[%l7 + 0x50] %asi
	membar	#Sync
	movge	%icc,	%o2,	%l3
	tn	%icc,	0x2
	fones	%f31
	fmovdcc	%xcc,	%f24,	%f31
	orncc	%i1,	%l2,	%l5
	bvs,a	%icc,	loop_2678
	ba,a	%icc,	loop_2679
	fnegd	%f10,	%f6
	umul	%g5,	%o1,	%o5
loop_2678:
	movg	%icc,	%l1,	%l4
loop_2679:
	tsubcctv	%o7,	0x19A9,	%i3
	edge8ln	%i7,	%l6,	%g6
	xorcc	%g7,	%o6,	%i2
	edge32ln	%g4,	%i5,	%g2
	smulcc	%i6,	%i0,	%o3
	tg	%xcc,	0x6
	smulcc	%l0,	%g3,	%i4
	set	0x58, %g4
	sta	%f15,	[%l7 + %g4] 0x11
	tne	%icc,	0x0
	tle	%xcc,	0x5
	edge16ln	%g1,	%o0,	%o4
	fmovsgu	%xcc,	%f28,	%f11
	movcs	%icc,	%l3,	%i1
	fpadd16s	%f13,	%f28,	%f20
	fbe,a	%fcc1,	loop_2680
	brgz,a	%l2,	loop_2681
	edge8l	%o2,	%l5,	%g5
	fmuld8sux16	%f6,	%f21,	%f16
loop_2680:
	siam	0x5
loop_2681:
	fmovsleu	%icc,	%f15,	%f21
	bn,a,pn	%xcc,	loop_2682
	subc	%o5,	%l1,	%l4
	tsubcctv	%o7,	%i3,	%i7
	call	loop_2683
loop_2682:
	edge8l	%l6,	%g6,	%g7
	fzero	%f14
	array32	%o6,	%i2,	%g4
loop_2683:
	bpos,pn	%icc,	loop_2684
	subccc	%i5,	0x1CDE,	%o1
	fpsub16s	%f13,	%f24,	%f27
	movle	%icc,	%i6,	%i0
loop_2684:
	smul	%o3,	%g2,	%l0
	edge32l	%g3,	%i4,	%g1
	edge16ln	%o0,	%l3,	%i1
	te	%xcc,	0x6
	xorcc	%l2,	0x150D,	%o4
	fone	%f28
	movrgez	%o2,	0x1BC,	%l5
	edge16l	%o5,	%l1,	%l4
	umulcc	%g5,	%i3,	%o7
	fmovse	%icc,	%f22,	%f22
	wr	%g0,	0x89,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	bn,a	loop_2685
	subcc	%l6,	%i7,	%g7
	fbl	%fcc2,	loop_2686
	movg	%xcc,	%o6,	%g6
loop_2685:
	xnor	%i2,	0x15BB,	%i5
	movgu	%icc,	%g4,	%i6
loop_2686:
	nop
	setx	loop_2687,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	subcc	%i0,	0x016A,	%o1
	tvs	%icc,	0x4
	mulx	%o3,	%g2,	%l0
loop_2687:
	array16	%g3,	%i4,	%g1
	wr	%g0,	0x81,	%asi
	lduba	[%l7 + 0x7A] %asi,	%o0
	sth	%l3,	[%l7 + 0x7C]
	edge32l	%l2,	%i1,	%o4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	smul	%l5,	%o5,	%l1
	sdiv	%o2,	0x09CD,	%l4
	fmovdge	%xcc,	%f1,	%f27
	fmovdne	%icc,	%f21,	%f27
	movcs	%xcc,	%g5,	%o7
	tge	%xcc,	0x1
	bge,pt	%icc,	loop_2688
	fone	%f6
	fmovsgu	%icc,	%f19,	%f3
	edge8n	%l6,	%i7,	%i3
loop_2688:
	movcc	%xcc,	%g7,	%g6
	fmovrdlz	%o6,	%f30,	%f6
	edge32	%i5,	%g4,	%i2
	sll	%i6,	%o1,	%i0
	xnor	%o3,	0x0544,	%l0
	edge8n	%g2,	%i4,	%g3
	wr	%g0,	0x80,	%asi
	lduwa	[%l7 + 0x6C] %asi,	%g1
	fmovsvs	%icc,	%f18,	%f0
	srlx	%o0,	0x0B,	%l3
	or	%i1,	0x1C32,	%l2
	edge16l	%l5,	%o4,	%l1
	movvs	%icc,	%o5,	%l4
	fnegd	%f14,	%f6
	subccc	%o2,	%g5,	%o7
	array8	%i7,	%l6,	%g7
	sll	%g6,	0x0B,	%o6
	set	0x1C, %o5
	stwa	%i3,	[%l7 + %o5] 0x2a
	membar	#Sync
	fone	%f24
	sdivx	%g4,	0x1953,	%i2
	fbuge,a	%fcc2,	loop_2689
	move	%icc,	%i5,	%i6
	call	loop_2690
	addccc	%o1,	0x0D61,	%i0
loop_2689:
	edge8n	%o3,	%g2,	%l0
	add	%l7,	0x28,	%l6
	wr	%g0,	0x18,	%asi
	casxa	[%l6] %asi,	%i4,	%g1
loop_2690:
	movle	%icc,	%o0,	%g3
	fbne	%fcc2,	loop_2691
	edge32l	%i1,	%l3,	%l5
	fnor	%f12,	%f24,	%f16
	ba,a	loop_2692
loop_2691:
	movg	%icc,	%o4,	%l2
	tge	%xcc,	0x7
	taddcc	%l1,	0x0BE2,	%l4
loop_2692:
	fbule,a	%fcc2,	loop_2693
	xorcc	%o5,	0x189E,	%o2
	wr	%g0,	0x19,	%asi
	stha	%g5,	[%l7 + 0x24] %asi
loop_2693:
	tsubcctv	%o7,	0x041B,	%i7
	fmovrse	%l6,	%f5,	%f26
	fmovdvc	%xcc,	%f10,	%f7
	fbl	%fcc2,	loop_2694
	andcc	%g6,	%g7,	%i3
	tneg	%xcc,	0x3
	edge16	%o6,	%g4,	%i2
loop_2694:
	edge32l	%i5,	%i6,	%o1
	andn	%o3,	0x1AA8,	%i0
	bneg	%xcc,	loop_2695
	fmovsn	%icc,	%f30,	%f14
	fcmpgt32	%f20,	%f10,	%l0
	movneg	%xcc,	%g2,	%i4
loop_2695:
	array16	%g1,	%o0,	%i1
	set	0x41, %o1
	ldstuba	[%l7 + %o1] 0x88,	%g3
	sub	%l5,	0x0B38,	%l3
	brgez	%l2,	loop_2696
	fxor	%f18,	%f28,	%f4
	umulcc	%l1,	%o4,	%l4
	brgez	%o5,	loop_2697
loop_2696:
	umulcc	%o2,	0x0B98,	%o7
	ldsb	[%l7 + 0x09],	%i7
	sllx	%g5,	%l6,	%g7
loop_2697:
	movvc	%xcc,	%i3,	%g6
	subcc	%g4,	%i2,	%o6
	fmovrdne	%i6,	%f30,	%f4
	tl	%icc,	0x6
	fzeros	%f14
	subccc	%i5,	0x0674,	%o1
	add	%l7,	0x28,	%l6
	wr	%g0,	0x0c,	%asi
	casa	[%l6] 0x0c,	%i0,	%o3
	set	0x3D, %g3
	ldstuba	[%l7 + %g3] 0x11,	%g2
	smulcc	%l0,	%g1,	%o0
	orcc	%i4,	%g3,	%l5
	fbu,a	%fcc1,	loop_2698
	fmovdge	%icc,	%f22,	%f15
	edge8n	%l3,	%i1,	%l2
	movgu	%icc,	%l1,	%o4
loop_2698:
	bpos	%xcc,	loop_2699
	sdiv	%o5,	0x1F0E,	%l4
	call	loop_2700
	brnz	%o7,	loop_2701
loop_2699:
	fpack16	%f16,	%f24
	edge32l	%o2,	%i7,	%g5
loop_2700:
	fmuld8sux16	%f16,	%f20,	%f14
loop_2701:
	bpos,a	loop_2702
	movgu	%xcc,	%l6,	%i3
	taddcc	%g6,	0x1D55,	%g7
	movneg	%xcc,	%i2,	%g4
loop_2702:
	move	%icc,	%i6,	%o6
	set	0x38, %l2
	swapa	[%l7 + %l2] 0x19,	%o1
	set	0x20, %i5
	stxa	%i0,	[%l7 + %i5] 0x81
	add	%o3,	0x0A80,	%g2
	tcs	%xcc,	0x4
	addcc	%i5,	0x1734,	%g1
	xorcc	%l0,	%o0,	%g3
	srlx	%l5,	%l3,	%i1
	taddcctv	%i4,	0x01C0,	%l2
	fmovdl	%icc,	%f10,	%f19
	or	%o4,	%l1,	%l4
	sethi	0x0EA6,	%o7
	array16	%o2,	%o5,	%g5
	fbe	%fcc2,	loop_2703
	tneg	%icc,	0x3
	movvs	%icc,	%l6,	%i3
	edge8	%i7,	%g7,	%g6
loop_2703:
	ld	[%l7 + 0x60],	%f0
	bcs,a	loop_2704
	movg	%xcc,	%i2,	%g4
	bvc	%xcc,	loop_2705
	sdiv	%i6,	0x0450,	%o1
loop_2704:
	ld	[%l7 + 0x18],	%f3
	taddcctv	%i0,	0x05B1,	%o6
loop_2705:
	edge32	%g2,	%i5,	%g1
	movrlez	%o3,	%o0,	%l0
	edge32	%g3,	%l5,	%i1
	fmovrdgz	%i4,	%f8,	%f28
	movvs	%xcc,	%l3,	%o4
	xnor	%l2,	%l1,	%l4
	fbne,a	%fcc2,	loop_2706
	edge8ln	%o2,	%o7,	%g5
	edge32ln	%o5,	%l6,	%i7
	fabsd	%f12,	%f22
loop_2706:
	std	%g6,	[%l7 + 0x48]
	movrne	%g6,	%i3,	%g4
	edge8n	%i2,	%o1,	%i6
	xnorcc	%o6,	0x04FA,	%i0
	umulcc	%i5,	%g2,	%o3
	xnorcc	%g1,	0x1A5A,	%l0
	lduh	[%l7 + 0x3A],	%g3
	set	0x48, %g7
	ldxa	[%l7 + %g7] 0x18,	%l5
	stb	%i1,	[%l7 + 0x2C]
	fmovsle	%xcc,	%f10,	%f3
	addccc	%o0,	%l3,	%i4
	bpos,pt	%xcc,	loop_2707
	tne	%xcc,	0x5
	fmovrsne	%o4,	%f13,	%f9
	fabsd	%f18,	%f28
loop_2707:
	sub	%l1,	%l4,	%l2
	udivx	%o2,	0x194D,	%o7
	fcmple32	%f10,	%f28,	%g5
	taddcc	%l6,	0x0EDB,	%i7
	orncc	%o5,	0x1A66,	%g7
	tleu	%xcc,	0x4
	bvs	%icc,	loop_2708
	tn	%icc,	0x5
	siam	0x0
	addcc	%g6,	%i3,	%i2
loop_2708:
	tvs	%icc,	0x1
	nop
	setx	loop_2709,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tleu	%xcc,	0x6
	tpos	%icc,	0x2
	mova	%xcc,	%o1,	%g4
loop_2709:
	fmul8x16al	%f8,	%f8,	%f26
	tsubcctv	%o6,	0x0C55,	%i0
	edge16ln	%i5,	%i6,	%g2
	array32	%o3,	%l0,	%g3
	bpos,a	loop_2710
	movg	%xcc,	%l5,	%g1
	andn	%i1,	%o0,	%i4
	fzero	%f4
loop_2710:
	alignaddr	%o4,	%l3,	%l4
	alignaddrl	%l2,	%l1,	%o7
	and	%o2,	%g5,	%l6
	fcmple16	%f0,	%f30,	%i7
	edge8ln	%g7,	%o5,	%g6
	alignaddr	%i3,	%i2,	%o1
	xor	%o6,	%g4,	%i0
	bn,a	%xcc,	loop_2711
	fbl	%fcc2,	loop_2712
	andncc	%i6,	%g2,	%o3
	edge8n	%i5,	%g3,	%l0
loop_2711:
	alignaddrl	%g1,	%l5,	%o0
loop_2712:
	ldub	[%l7 + 0x47],	%i4
	movrgz	%i1,	%l3,	%l4
	mulx	%l2,	%o4,	%l1
	stbar
	fblg,a	%fcc1,	loop_2713
	xor	%o2,	0x0C5E,	%g5
	std	%o6,	[%l7 + 0x70]
	ta	%xcc,	0x4
loop_2713:
	movneg	%icc,	%l6,	%i7
	edge32ln	%o5,	%g7,	%i3
	movge	%icc,	%g6,	%i2
	sllx	%o6,	%o1,	%i0
	tsubcc	%i6,	%g4,	%o3
	sll	%g2,	0x1E,	%i5
	tleu	%xcc,	0x7
	movgu	%xcc,	%g3,	%l0
	mulx	%l5,	%o0,	%i4
	movge	%xcc,	%g1,	%i1
	taddcctv	%l3,	%l4,	%o4
	membar	0x10
	fmuld8sux16	%f26,	%f6,	%f2
	call	loop_2714
	bn,a	%xcc,	loop_2715
	fmovrsgez	%l1,	%f16,	%f2
	fmovdgu	%icc,	%f30,	%f28
loop_2714:
	movrlez	%l2,	%o2,	%g5
loop_2715:
	prefetch	[%l7 + 0x60],	 0x0
	tvc	%xcc,	0x5
	fnand	%f24,	%f12,	%f0
	fpadd32s	%f19,	%f18,	%f30
	edge16ln	%l6,	%i7,	%o7
	wr	%g0,	0x80,	%asi
	stxa	%g7,	[%l7 + 0x48] %asi
	sdivcc	%o5,	0x123B,	%i3
	fpadd32s	%f17,	%f4,	%f1
	lduh	[%l7 + 0x3A],	%g6
	call	loop_2716
	fmovspos	%xcc,	%f30,	%f12
	set	0x66, %l3
	ldsha	[%l7 + %l3] 0x81,	%i2
loop_2716:
	membar	0x59
	ldsh	[%l7 + 0x18],	%o6
	wr	%g0,	0x1e,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
	bn,a,pn	%icc,	loop_2717
	bpos,a	%xcc,	loop_2718
	st	%f14,	[%l7 + 0x6C]
	tne	%xcc,	0x3
loop_2717:
	addcc	%o1,	0x0C9A,	%i6
loop_2718:
	te	%xcc,	0x4
	edge16n	%g4,	%i0,	%o3
	edge8n	%i5,	%g2,	%l0
	edge16	%g3,	%l5,	%i4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmpeq16	%f14,	%f10,	%o0
	popc	0x0E8F,	%i1
	movvs	%xcc,	%l3,	%l4
	movne	%icc,	%g1,	%l1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	brz,a	%o4,	loop_2719
	ldsb	[%l7 + 0x72],	%o2
	srl	%g5,	0x1E,	%l2
	fmovs	%f11,	%f12
loop_2719:
	nop
	set	0x18, %g1
	ldd	[%l7 + %g1],	%f26
	array16	%l6,	%o7,	%g7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ta	%icc,	0x6
	add	%o5,	%i7,	%g6
	edge16l	%i2,	%o6,	%i3
	nop
	set	0x38, %l5
	ldd	[%l7 + %l5],	%f26
	orncc	%o1,	0x15CB,	%i6
	tl	%xcc,	0x6
	movrlz	%g4,	0x379,	%o3
	umulcc	%i5,	0x1527,	%g2
	bgu,a	loop_2720
	fmovdleu	%xcc,	%f30,	%f7
	movl	%icc,	%i0,	%l0
	wr	%g0,	0x19,	%asi
	ldswa	[%l7 + 0x70] %asi,	%l5
loop_2720:
	sir	0x13B7
	movle	%xcc,	%i4,	%o0
	fbue	%fcc3,	loop_2721
	movcs	%icc,	%i1,	%l3
	bgu,pn	%icc,	loop_2722
	movrgz	%g3,	0x134,	%l4
loop_2721:
	edge32	%l1,	%g1,	%o2
	bneg,pt	%xcc,	loop_2723
loop_2722:
	tleu	%icc,	0x5
	edge8n	%o4,	%g5,	%l2
	subccc	%l6,	0x0678,	%o7
loop_2723:
	subcc	%g7,	0x07FD,	%i7
	fnand	%f28,	%f24,	%f18
	tsubcctv	%o5,	%i2,	%g6
	xnorcc	%i3,	0x0533,	%o6
	edge32	%o1,	%i6,	%o3
	set	0x1E, %l4
	stba	%i5,	[%l7 + %l4] 0x2b
	membar	#Sync
	fsrc2s	%f2,	%f20
	sllx	%g2,	0x1A,	%g4
	membar	0x78
	srl	%i0,	%l5,	%l0
	fpmerge	%f6,	%f24,	%f0
	fmovsg	%icc,	%f13,	%f7
	sdivcc	%i4,	0x1CF2,	%i1
	fmovsge	%xcc,	%f29,	%f19
	edge16l	%o0,	%g3,	%l4
	tvs	%icc,	0x0
	fmovdpos	%xcc,	%f8,	%f24
	orcc	%l1,	%l3,	%g1
	fnors	%f24,	%f8,	%f2
	movne	%icc,	%o2,	%g5
	fandnot2	%f16,	%f12,	%f18
	edge32l	%o4,	%l2,	%l6
	xor	%o7,	%g7,	%i7
	tpos	%icc,	0x7
	tcs	%icc,	0x4
	fcmpne16	%f18,	%f6,	%o5
	sir	0x00EC
	sdivcc	%i2,	0x0321,	%g6
	movcs	%icc,	%i3,	%o1
	fcmps	%fcc2,	%f22,	%f26
	fble,a	%fcc3,	loop_2724
	fzeros	%f29
	brgez,a	%o6,	loop_2725
	mulx	%i6,	%o3,	%i5
loop_2724:
	fmovsn	%xcc,	%f15,	%f30
	edge16	%g2,	%i0,	%l5
loop_2725:
	sub	%g4,	0x171B,	%l0
	sdivx	%i1,	0x0B82,	%i4
	membar	0x40
	tleu	%icc,	0x6
	movn	%xcc,	%g3,	%o0
	te	%icc,	0x0
	mova	%icc,	%l4,	%l3
	sdivcc	%l1,	0x0A45,	%g1
	fpack32	%f4,	%f30,	%f26
	movl	%xcc,	%g5,	%o2
	subc	%l2,	0x1AE7,	%o4
	tge	%icc,	0x1
	fmuld8sux16	%f6,	%f1,	%f24
	st	%f12,	[%l7 + 0x38]
	and	%o7,	%l6,	%i7
	sll	%g7,	0x1E,	%i2
	movvs	%icc,	%g6,	%o5
	add	%l7,	0x60,	%l6
	wr	%g0,	0x04,	%asi
	lda	[%l6] %asi,	%o1
	casa	[%l6] 0x04,	%o1,	%o6
	tn	%icc,	0x0
	tsubcc	%i6,	%o3,	%i3
	tneg	%icc,	0x4
	ldsw	[%l7 + 0x6C],	%g2
	fcmpne16	%f10,	%f10,	%i0
	fnegs	%f21,	%f10
	movvs	%icc,	%l5,	%i5
	fandnot2	%f24,	%f0,	%f28
	tcc	%xcc,	0x4
	subc	%l0,	0x072C,	%g4
	addccc	%i4,	0x1380,	%g3
	wr	%g0,	0x19,	%asi
	ldsha	[%l7 + 0x4C] %asi,	%i1
	xorcc	%l4,	0x0583,	%l3
	ldsw	[%l7 + 0x68],	%o0
	movrlez	%g1,	0x25D,	%l1
	movvc	%xcc,	%g5,	%l2
	tsubcc	%o4,	%o2,	%l6
	movvs	%icc,	%i7,	%g7
	movle	%xcc,	%o7,	%i2
	ldstub	[%l7 + 0x26],	%g6
	xorcc	%o1,	%o5,	%o6
	fbuge	%fcc0,	loop_2726
	umul	%i6,	%o3,	%g2
	movvc	%xcc,	%i3,	%i0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2726:
	popc	%i5,	%l0
	fsrc2s	%f18,	%f17
	udivx	%g4,	0x0CB9,	%l5
	movgu	%icc,	%g3,	%i4
	tvc	%icc,	0x6
	tl	%icc,	0x0
	orcc	%i1,	0x1670,	%l3
	fpadd16s	%f10,	%f16,	%f5
	srl	%l4,	%g1,	%o0
	fmovsle	%icc,	%f30,	%f7
	move	%icc,	%l1,	%l2
	set	0x1C, %o7
	lduwa	[%l7 + %o7] 0x11,	%o4
	edge32ln	%g5,	%o2,	%l6
	edge16ln	%i7,	%g7,	%o7
	fmovsleu	%icc,	%f13,	%f4
	be,pn	%xcc,	loop_2727
	sra	%g6,	0x1B,	%i2
	fbuge,a	%fcc1,	loop_2728
	movrgz	%o5,	0x12E,	%o6
loop_2727:
	subc	%o1,	0x045E,	%o3
	orn	%i6,	0x075F,	%i3
loop_2728:
	movrlz	%i0,	%i5,	%g2
	wr	%g0,	0x89,	%asi
	sta	%f8,	[%l7 + 0x34] %asi
	tvs	%xcc,	0x7
	fmovrsne	%g4,	%f14,	%f24
	add	%l0,	0x17C9,	%l5
	tpos	%xcc,	0x6
	smulcc	%g3,	0x0591,	%i1
	wr	%g0,	0x19,	%asi
	sta	%f26,	[%l7 + 0x7C] %asi
	tl	%icc,	0x3
	tcc	%icc,	0x1
	orncc	%i4,	%l3,	%g1
	alignaddr	%o0,	%l4,	%l2
	brlz	%o4,	loop_2729
	fcmps	%fcc1,	%f9,	%f12
	movrlz	%l1,	0x3BD,	%g5
	edge32ln	%l6,	%o2,	%g7
loop_2729:
	movrgz	%o7,	%i7,	%g6
	bgu,a,pn	%icc,	loop_2730
	fnands	%f22,	%f30,	%f8
	edge8ln	%o5,	%o6,	%i2
	fcmpgt32	%f12,	%f20,	%o1
loop_2730:
	nop
	set	0x40, %g5
	ldda	[%l7 + %g5] 0x0c,	%f16
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andcc	%o3,	0x1E0E,	%i6
	set	0x30, %i0
	ldswa	[%l7 + %i0] 0x18,	%i3
	ldd	[%l7 + 0x50],	%f20
	swap	[%l7 + 0x1C],	%i0
	fpadd16	%f24,	%f22,	%f6
	tsubcc	%i5,	%g2,	%l0
	movcs	%xcc,	%l5,	%g3
	ldx	[%l7 + 0x38],	%i1
	popc	%i4,	%l3
	stbar
	nop
	setx	loop_2731,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	brnz	%g1,	loop_2732
	faligndata	%f14,	%f26,	%f28
	andcc	%g4,	%l4,	%l2
loop_2731:
	orncc	%o4,	%l1,	%g5
loop_2732:
	nop
	wr	%g0,	0x11,	%asi
	ldstuba	[%l7 + 0x0E] %asi,	%o0
	addcc	%l6,	0x01FA,	%g7
	fbue	%fcc2,	loop_2733
	movleu	%icc,	%o7,	%i7
	set	0x54, %o0
	sta	%f27,	[%l7 + %o0] 0x88
loop_2733:
	ldd	[%l7 + 0x20],	%f12
	tsubcc	%o2,	0x1F30,	%o5
	andn	%o6,	0x1786,	%g6
	fbule	%fcc0,	loop_2734
	fblg,a	%fcc2,	loop_2735
	lduw	[%l7 + 0x70],	%i2
	xnor	%o3,	0x0A7F,	%o1
loop_2734:
	addccc	%i3,	0x1A0B,	%i0
loop_2735:
	sir	0x0A2D
	udiv	%i6,	0x12C2,	%i5
	fpack32	%f14,	%f22,	%f6
	lduh	[%l7 + 0x54],	%g2
	nop
	setx	loop_2736,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	sth	%l0,	[%l7 + 0x62]
	addcc	%g3,	%i1,	%i4
	fbue,a	%fcc1,	loop_2737
loop_2736:
	fmovdge	%icc,	%f27,	%f20
	fmovse	%xcc,	%f18,	%f27
	ld	[%l7 + 0x68],	%f3
loop_2737:
	fsrc1	%f0,	%f18
	smulcc	%l3,	0x1CFF,	%g1
	udiv	%g4,	0x177C,	%l4
	stw	%l2,	[%l7 + 0x5C]
	add	%o4,	0x0F33,	%l5
	tsubcc	%l1,	0x14C8,	%o0
	alignaddrl	%g5,	%l6,	%o7
	movpos	%xcc,	%g7,	%o2
	fcmpeq16	%f0,	%f18,	%i7
	movneg	%xcc,	%o6,	%g6
	fmovdn	%xcc,	%f8,	%f31
	movleu	%xcc,	%i2,	%o5
	movrlez	%o3,	0x0B1,	%i3
	fbn	%fcc3,	loop_2738
	ta	%icc,	0x6
	fbo,a	%fcc1,	loop_2739
	alignaddr	%i0,	%o1,	%i6
loop_2738:
	stbar
	bne,pt	%xcc,	loop_2740
loop_2739:
	fmovde	%icc,	%f23,	%f24
	edge32ln	%g2,	%l0,	%g3
	be	%icc,	loop_2741
loop_2740:
	andcc	%i5,	%i1,	%l3
	umul	%i4,	%g1,	%l4
	orcc	%l2,	0x1AC5,	%o4
loop_2741:
	ldstub	[%l7 + 0x61],	%g4
	call	loop_2742
	fblg	%fcc0,	loop_2743
	fmovsvs	%icc,	%f6,	%f12
	subccc	%l1,	%o0,	%g5
loop_2742:
	fmovspos	%xcc,	%f21,	%f18
loop_2743:
	fbl	%fcc1,	loop_2744
	tn	%xcc,	0x7
	edge8l	%l6,	%l5,	%g7
	or	%o2,	0x04F9,	%i7
loop_2744:
	fmovrdne	%o7,	%f28,	%f4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpmerge	%f7,	%f14,	%f22
	edge16n	%o6,	%i2,	%g6
	sethi	0x05C4,	%o5
	bcs,a	loop_2745
	bne	loop_2746
	movle	%icc,	%i3,	%o3
	edge8n	%o1,	%i6,	%g2
loop_2745:
	sth	%i0,	[%l7 + 0x60]
loop_2746:
	movrlez	%g3,	%i5,	%l0
	fba,a	%fcc3,	loop_2747
	bvc,a,pt	%icc,	loop_2748
	ba,pt	%xcc,	loop_2749
	fbue,a	%fcc0,	loop_2750
loop_2747:
	movcs	%icc,	%i1,	%l3
loop_2748:
	edge16	%g1,	%l4,	%i4
loop_2749:
	fmovdneg	%xcc,	%f31,	%f8
loop_2750:
	movle	%xcc,	%o4,	%l2
	tsubcctv	%l1,	%o0,	%g4
	umul	%l6,	%g5,	%g7
	movrlez	%o2,	%i7,	%o7
	swap	[%l7 + 0x2C],	%o6
	xnorcc	%l5,	%i2,	%g6
	array32	%o5,	%i3,	%o3
	fmovsneg	%icc,	%f10,	%f21
	for	%f26,	%f30,	%f20
	andcc	%o1,	0x055C,	%i6
	nop
	set	0x78, %o4
	ldd	[%l7 + %o4],	%f2
	movrlz	%i0,	%g2,	%i5
	movn	%xcc,	%g3,	%i1
	mulx	%l0,	0x1FF9,	%g1
	for	%f8,	%f24,	%f22
	mova	%icc,	%l4,	%l3
	fornot2	%f30,	%f24,	%f14
	edge16l	%o4,	%i4,	%l2
	wr	%g0,	0x89,	%asi
	stba	%l1,	[%l7 + 0x1F] %asi
	ba,pn	%xcc,	loop_2751
	fcmpd	%fcc2,	%f20,	%f30
	movleu	%xcc,	%g4,	%l6
	wr	%g0,	0x88,	%asi
	prefetcha	[%l7 + 0x20] %asi,	 0x0
loop_2751:
	bleu	loop_2752
	tsubcc	%g7,	%g5,	%o2
	brz	%i7,	loop_2753
	stx	%o7,	[%l7 + 0x30]
loop_2752:
	stx	%o6,	[%l7 + 0x20]
	array16	%i2,	%l5,	%g6
loop_2753:
	tpos	%xcc,	0x0
	xnorcc	%o5,	0x0708,	%i3
	edge8n	%o1,	%i6,	%i0
	tpos	%xcc,	0x6
	edge8ln	%o3,	%i5,	%g2
	andn	%g3,	%i1,	%g1
	fxnor	%f20,	%f8,	%f16
	bgu,a	loop_2754
	ldx	[%l7 + 0x70],	%l0
	membar	0x48
	fxors	%f5,	%f8,	%f14
loop_2754:
	stbar
	andn	%l4,	0x1779,	%l3
	fmovrslz	%o4,	%f18,	%f20
	lduw	[%l7 + 0x3C],	%i4
	edge8l	%l2,	%g4,	%l1
	sra	%l6,	0x0C,	%o0
	addcc	%g5,	0x1CAE,	%g7
	tsubcc	%o2,	0x0978,	%o7
	sub	%i7,	0x0714,	%o6
	brz,a	%i2,	loop_2755
	sir	0x0422
	movvc	%xcc,	%l5,	%g6
	srax	%i3,	0x12,	%o5
loop_2755:
	tvs	%icc,	0x6
	sdiv	%o1,	0x07CE,	%i6
	umul	%i0,	%o3,	%g2
	stbar
	add	%l7,	0x30,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%i5,	%i1
	sir	0x1C73
	add	%l7,	0x70,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] %asi,	%g3,	%l0
	tcs	%icc,	0x5
	smulcc	%g1,	0x0598,	%l3
	fandnot1	%f28,	%f0,	%f28
	wr	%g0,	0x88,	%asi
	ldsba	[%l7 + 0x34] %asi,	%l4
	fmovscc	%xcc,	%f4,	%f0
	ldsh	[%l7 + 0x1C],	%o4
	taddcc	%i4,	0x1E29,	%l2
	orncc	%l1,	0x1FF9,	%l6
	movgu	%xcc,	%g4,	%g5
	srlx	%g7,	0x15,	%o2
	fmovsvc	%xcc,	%f2,	%f8
	sethi	0x000F,	%o7
	movg	%xcc,	%i7,	%o0
	addcc	%i2,	0x0735,	%o6
	movcc	%xcc,	%l5,	%i3
	array16	%o5,	%g6,	%i6
	fcmpgt32	%f18,	%f20,	%o1
	tcc	%xcc,	0x1
	xorcc	%i0,	0x11FE,	%o3
	fbug	%fcc3,	loop_2756
	fba	%fcc2,	loop_2757
	movneg	%icc,	%i5,	%i1
	srlx	%g3,	0x12,	%l0
loop_2756:
	nop
	set	0x30, %i2
	ldstub	[%l7 + %i2],	%g2
loop_2757:
	stb	%g1,	[%l7 + 0x53]
	tg	%xcc,	0x2
	edge8	%l3,	%l4,	%i4
	sll	%o4,	0x01,	%l1
	taddcctv	%l2,	%g4,	%l6
	fcmpes	%fcc1,	%f9,	%f6
	srl	%g7,	%o2,	%o7
	umul	%i7,	0x0F19,	%g5
	fbe	%fcc0,	loop_2758
	be,a,pt	%icc,	loop_2759
	movl	%icc,	%o0,	%i2
	fnands	%f14,	%f12,	%f26
loop_2758:
	edge8l	%o6,	%l5,	%o5
loop_2759:
	flush	%l7 + 0x48
	bleu,a	loop_2760
	taddcc	%g6,	0x1299,	%i3
	wr	%g0,	0x19,	%asi
	lda	[%l7 + 0x14] %asi,	%f17
loop_2760:
	ba,a	%icc,	loop_2761
	movneg	%xcc,	%o1,	%i6
	srlx	%o3,	%i5,	%i1
	movne	%icc,	%g3,	%l0
loop_2761:
	sdivcc	%g2,	0x06C7,	%g1
	or	%i0,	%l3,	%l4
	fandnot1s	%f17,	%f14,	%f11
	array16	%i4,	%l1,	%o4
	tvs	%icc,	0x7
	fmovde	%xcc,	%f5,	%f22
	movcs	%icc,	%l2,	%g4
	bvs,a,pt	%icc,	loop_2762
	movcc	%xcc,	%g7,	%o2
	edge8n	%l6,	%i7,	%o7
	be,a	%icc,	loop_2763
loop_2762:
	tsubcc	%g5,	0x190B,	%o0
	be,a	loop_2764
	ta	%xcc,	0x5
loop_2763:
	edge8	%i2,	%o6,	%o5
	movcc	%xcc,	%g6,	%i3
loop_2764:
	fpsub16s	%f12,	%f16,	%f26
	stx	%l5,	[%l7 + 0x28]
	fbule,a	%fcc0,	loop_2765
	fble	%fcc1,	loop_2766
	fzeros	%f30
	srl	%i6,	%o3,	%i5
loop_2765:
	fmuld8ulx16	%f31,	%f29,	%f8
loop_2766:
	move	%icc,	%i1,	%g3
	bneg,pn	%xcc,	loop_2767
	sth	%l0,	[%l7 + 0x7A]
	std	%g2,	[%l7 + 0x30]
	nop
	setx loop_2768, %l0, %l1
	jmpl %l1, %o1
loop_2767:
	add	%g1,	0x012D,	%i0
	movcc	%icc,	%l3,	%i4
	sdiv	%l4,	0x1529,	%o4
loop_2768:
	fmovsle	%xcc,	%f14,	%f14
	and	%l2,	0x11A7,	%l1
	andcc	%g4,	%g7,	%o2
	movg	%xcc,	%l6,	%i7
	movrlez	%g5,	%o7,	%i2
	tg	%xcc,	0x7
	fxnor	%f22,	%f0,	%f20
	fmul8x16au	%f29,	%f5,	%f0
	fmovrdlez	%o6,	%f6,	%f0
	and	%o0,	%o5,	%i3
	movrgz	%l5,	%g6,	%i6
	mulx	%o3,	%i1,	%i5
	sdiv	%g3,	0x007F,	%g2
	fpack32	%f10,	%f26,	%f30
	fxnors	%f29,	%f5,	%f9
	udivcc	%o1,	0x0F05,	%g1
	edge8l	%i0,	%l0,	%l3
	tl	%xcc,	0x7
	orncc	%i4,	0x06FF,	%l4
	taddcc	%o4,	%l2,	%g4
	fnot1s	%f23,	%f12
	taddcc	%l1,	%o2,	%l6
	sdiv	%g7,	0x1BEE,	%i7
	set	0x40, %i7
	stda	%f0,	[%l7 + %i7] 0x18
	srl	%o7,	%i2,	%o6
	fcmpne32	%f28,	%f12,	%g5
	movvs	%xcc,	%o5,	%o0
	edge8n	%i3,	%l5,	%i6
	popc	%o3,	%i1
	fnand	%f30,	%f14,	%f28
	edge16	%g6,	%g3,	%i5
	fmovsg	%xcc,	%f14,	%f19
	or	%g2,	0x1758,	%o1
	subccc	%i0,	0x16A2,	%l0
	fbug,a	%fcc3,	loop_2769
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmul8sux16	%f16,	%f8,	%f30
	subcc	%g1,	%i4,	%l3
loop_2769:
	edge8ln	%l4,	%l2,	%g4
	umulcc	%l1,	0x052A,	%o2
	tvs	%xcc,	0x0
	edge32	%l6,	%o4,	%g7
	fmovsvs	%xcc,	%f16,	%f15
	tge	%xcc,	0x7
	nop
	setx loop_2770, %l0, %l1
	jmpl %l1, %i7
	bneg,pt	%icc,	loop_2771
	tn	%icc,	0x4
	movn	%xcc,	%o7,	%i2
loop_2770:
	sdivcc	%o6,	0x0FB2,	%o5
loop_2771:
	orcc	%o0,	%i3,	%l5
	popc	0x131B,	%i6
	umulcc	%o3,	%i1,	%g6
	tne	%xcc,	0x7
	xor	%g5,	%g3,	%i5
	andn	%o1,	0x1F84,	%g2
	movvs	%icc,	%i0,	%g1
	mova	%xcc,	%i4,	%l0
	fbue,a	%fcc1,	loop_2772
	fornot2	%f18,	%f24,	%f28
	popc	%l4,	%l2
	orcc	%l3,	%g4,	%l1
loop_2772:
	srl	%o2,	%o4,	%l6
	ldsw	[%l7 + 0x30],	%g7
	taddcc	%o7,	%i7,	%i2
	movleu	%icc,	%o6,	%o0
	faligndata	%f20,	%f20,	%f30
	tvs	%xcc,	0x3
	fcmpd	%fcc3,	%f4,	%f14
	ldd	[%l7 + 0x10],	%f30
	edge32ln	%i3,	%o5,	%l5
	array32	%i6,	%o3,	%g6
	orn	%i1,	0x05EF,	%g3
	bgu,pt	%icc,	loop_2773
	fnand	%f26,	%f6,	%f0
	addccc	%g5,	%o1,	%i5
	taddcc	%i0,	%g1,	%i4
loop_2773:
	array8	%g2,	%l0,	%l2
	movn	%xcc,	%l4,	%l3
	movgu	%icc,	%g4,	%l1
	set	0x42, %o3
	stba	%o4,	[%l7 + %o3] 0x0c
	orcc	%l6,	%o2,	%g7
	fbule	%fcc0,	loop_2774
	alignaddrl	%i7,	%i2,	%o7
	taddcctv	%o0,	0x14F9,	%o6
	ldsw	[%l7 + 0x64],	%o5
loop_2774:
	tgu	%icc,	0x0
	fornot1	%f26,	%f8,	%f30
	movn	%icc,	%l5,	%i6
	fbge,a	%fcc2,	loop_2775
	movcc	%icc,	%i3,	%g6
	set	0x68, %o2
	prefetcha	[%l7 + %o2] 0x80,	 0x1
loop_2775:
	andn	%g3,	0x18D5,	%o3
	popc	%o1,	%g5
	movrne	%i5,	0x2F5,	%g1
	srl	%i4,	%g2,	%i0
	tgu	%xcc,	0x0
	sub	%l0,	%l2,	%l3
	te	%xcc,	0x6
	ldd	[%l7 + 0x08],	%g4
	array16	%l1,	%o4,	%l6
	tg	%xcc,	0x1
	fxnors	%f6,	%f28,	%f11
	fbo	%fcc1,	loop_2776
	fmovdcs	%icc,	%f4,	%f7
	tpos	%xcc,	0x3
	fble,a	%fcc0,	loop_2777
loop_2776:
	fmovdcs	%icc,	%f4,	%f27
	tsubcc	%l4,	0x1EFE,	%o2
	movrgez	%i7,	%g7,	%o7
loop_2777:
	add	%o0,	0x0161,	%i2
	edge16ln	%o5,	%l5,	%i6
	fmovsge	%icc,	%f20,	%f5
	add	%o6,	0x1970,	%i3
	brlz,a	%g6,	loop_2778
	xorcc	%g3,	0x05AB,	%o3
	fcmpne16	%f20,	%f14,	%o1
	addcc	%i1,	%i5,	%g5
loop_2778:
	fors	%f5,	%f12,	%f2
	and	%i4,	%g1,	%g2
	fmovsvs	%xcc,	%f6,	%f23
	subcc	%l0,	0x014D,	%i0
	movcc	%xcc,	%l2,	%g4
	bn	loop_2779
	std	%l0,	[%l7 + 0x78]
	std	%f8,	[%l7 + 0x08]
	movrlez	%o4,	%l6,	%l4
loop_2779:
	mova	%xcc,	%o2,	%l3
	srlx	%i7,	0x02,	%g7
	movneg	%xcc,	%o0,	%i2
	movn	%icc,	%o5,	%l5
	mova	%icc,	%o7,	%o6
	sub	%i3,	%g6,	%g3
	movre	%o3,	0x1D4,	%i6
	sll	%i1,	%i5,	%o1
	movrne	%g5,	%g1,	%i4
	movne	%xcc,	%l0,	%g2
	edge16	%i0,	%g4,	%l2
	fbn,a	%fcc3,	loop_2780
	edge16n	%l1,	%o4,	%l4
	bvs,a,pn	%xcc,	loop_2781
	fcmps	%fcc0,	%f0,	%f28
loop_2780:
	nop
	wr	%g0,	0x89,	%asi
	lduwa	[%l7 + 0x14] %asi,	%l6
loop_2781:
	ta	%icc,	0x0
	fmovdcs	%icc,	%f11,	%f3
	tg	%icc,	0x1
	and	%o2,	0x14EE,	%i7
	fmul8x16	%f31,	%f6,	%f24
	tvs	%xcc,	0x0
	brgz	%g7,	loop_2782
	fbl,a	%fcc3,	loop_2783
	fcmple16	%f22,	%f0,	%o0
	movpos	%icc,	%i2,	%l3
loop_2782:
	movg	%icc,	%o5,	%o7
loop_2783:
	fmovdpos	%icc,	%f21,	%f26
	fbule,a	%fcc2,	loop_2784
	fmovrsgez	%l5,	%f5,	%f17
	wr	%g0,	0x88,	%asi
	ldswa	[%l7 + 0x6C] %asi,	%o6
loop_2784:
	fxnor	%f14,	%f18,	%f10
	edge32	%i3,	%g3,	%g6
	fnot1s	%f7,	%f0
	fmovdge	%xcc,	%f21,	%f11
	fmovscc	%icc,	%f18,	%f30
	fcmple16	%f20,	%f12,	%i6
	bshuffle	%f18,	%f22,	%f24
	sllx	%i1,	%i5,	%o3
	sra	%o1,	%g5,	%g1
	or	%l0,	0x0C2B,	%i4
	add	%g2,	0x1332,	%i0
	fmul8sux16	%f20,	%f24,	%f2
	tleu	%icc,	0x3
	te	%icc,	0x6
	smulcc	%l2,	%l1,	%g4
	ba,a,pt	%icc,	loop_2785
	nop
	set	0x38, %g2
	ldd	[%l7 + %g2],	%l4
	movrgez	%l6,	%o2,	%o4
	edge16l	%g7,	%i7,	%o0
loop_2785:
	nop
	wr	%g0,	0x89,	%asi
	ldsba	[%l7 + 0x7D] %asi,	%i2
	subcc	%l3,	0x07B9,	%o7
	tvs	%xcc,	0x5
	nop
	setx loop_2786, %l0, %l1
	jmpl %l1, %l5
	ld	[%l7 + 0x24],	%f30
	bge,pt	%icc,	loop_2787
	fpsub16s	%f3,	%f15,	%f6
loop_2786:
	call	loop_2788
	tneg	%icc,	0x6
loop_2787:
	array16	%o6,	%i3,	%g3
	fnot1s	%f6,	%f2
loop_2788:
	movge	%icc,	%g6,	%o5
	fbule	%fcc0,	loop_2789
	edge32n	%i6,	%i1,	%o3
	alignaddrl	%o1,	%g5,	%g1
	fmuld8ulx16	%f14,	%f27,	%f22
loop_2789:
	fone	%f16
	srax	%i5,	0x17,	%l0
	movrlz	%i4,	0x157,	%g2
	stbar
	fxnors	%f29,	%f17,	%f26
	orncc	%l2,	0x1F15,	%i0
	bg,pt	%icc,	loop_2790
	stb	%g4,	[%l7 + 0x33]
	fcmpne32	%f4,	%f4,	%l4
	movge	%xcc,	%l6,	%o2
loop_2790:
	fpackfix	%f16,	%f17
	umulcc	%l1,	%o4,	%i7
	alignaddr	%g7,	%o0,	%l3
	movgu	%icc,	%i2,	%o7
	fmovs	%f5,	%f23
	fbule	%fcc2,	loop_2791
	bvs,pt	%icc,	loop_2792
	bvs,a,pt	%icc,	loop_2793
	fmovsgu	%xcc,	%f13,	%f16
loop_2791:
	xnor	%l5,	0x1123,	%i3
loop_2792:
	nop
	wr	%g0,	0x21,	%asi
	stxa	%o6,	[%g0 + 0x8] %asi
loop_2793:
	tg	%xcc,	0x3
	fmovsvs	%icc,	%f26,	%f23
	ldx	[%l7 + 0x78],	%g6
	be,a	loop_2794
	mova	%xcc,	%o5,	%g3
	tn	%xcc,	0x3
	fornot2	%f10,	%f10,	%f8
loop_2794:
	fmovsvs	%xcc,	%f19,	%f14
	movrne	%i1,	%i6,	%o1
	mova	%icc,	%o3,	%g1
	movvs	%icc,	%i5,	%l0
	bshuffle	%f18,	%f16,	%f12
	sra	%g5,	%i4,	%g2
	tvc	%xcc,	0x6
	ldd	[%l7 + 0x48],	%f2
	tvs	%icc,	0x7
	tn	%xcc,	0x7
	srax	%l2,	0x1C,	%i0
	sub	%g4,	0x11BF,	%l4
	stb	%o2,	[%l7 + 0x34]
	add	%l1,	%l6,	%o4
	tvs	%xcc,	0x5
	sllx	%i7,	%o0,	%l3
	tsubcctv	%g7,	%i2,	%o7
	alignaddrl	%i3,	%l5,	%o6
	sdiv	%o5,	0x1DC1,	%g3
	tg	%icc,	0x5
	add	%l7,	0x40,	%l6
	wr	%g0,	0x10,	%asi
	ldxa	[%l6] %asi,	%g6
	casxa	[%l6] %asi,	%g6,	%i1
	sir	0x0D60
	fmul8x16au	%f13,	%f27,	%f14
	fpadd32s	%f31,	%f13,	%f18
	orncc	%i6,	0x1E24,	%o3
	tneg	%xcc,	0x1
	tcc	%icc,	0x3
	fxor	%f16,	%f4,	%f16
	bleu,pt	%icc,	loop_2795
	fxor	%f10,	%f4,	%f16
	andcc	%g1,	0x0266,	%i5
	sllx	%o1,	%g5,	%l0
loop_2795:
	membar	0x1A
	fbge	%fcc0,	loop_2796
	fsrc2	%f26,	%f2
	set	0x68, %g6
	prefetcha	[%l7 + %g6] 0x88,	 0x0
loop_2796:
	movrgz	%i4,	%i0,	%l2
	fble,a	%fcc0,	loop_2797
	sir	0x18B1
	bleu,a	%xcc,	loop_2798
	fpmerge	%f30,	%f29,	%f22
loop_2797:
	nop
	set	0x60, %i6
	ldd	[%l7 + %i6],	%l4
	udivcc	%g4,	0x1562,	%l1
loop_2798:
	sdivx	%l6,	0x031A,	%o2
	array16	%i7,	%o0,	%o4
	fcmpne32	%f0,	%f10,	%g7
	edge8n	%l3,	%o7,	%i3
	wr	%g0,	0x81,	%asi
	swapa	[%l7 + 0x20] %asi,	%l5
	fbn,a	%fcc1,	loop_2799
	sdivcc	%o6,	0x1C76,	%i2
	popc	0x104A,	%g3
	call	loop_2800
loop_2799:
	nop
	set	0x42, %i4
	ldub	[%l7 + %i4],	%o5
	ldsw	[%l7 + 0x34],	%g6
	fand	%f10,	%f18,	%f2
loop_2800:
	movcc	%icc,	%i1,	%i6
	popc	%o3,	%g1
	fcmps	%fcc1,	%f0,	%f15
	tsubcctv	%o1,	%i5,	%l0
	edge16l	%g2,	%i4,	%i0
	movrgz	%l2,	%g5,	%l4
	fandnot1s	%f0,	%f0,	%f2
	movvc	%xcc,	%g4,	%l1
	ba,a	loop_2801
	tvs	%xcc,	0x4
	fbuge,a	%fcc2,	loop_2802
	add	%o2,	%l6,	%i7
loop_2801:
	fcmpeq32	%f6,	%f18,	%o4
	fmul8x16	%f13,	%f6,	%f24
loop_2802:
	brlez,a	%o0,	loop_2803
	smul	%l3,	%o7,	%i3
	andn	%l5,	%g7,	%o6
	movrlz	%g3,	%o5,	%g6
loop_2803:
	edge16n	%i2,	%i1,	%i6
	movne	%icc,	%g1,	%o3
	tleu	%xcc,	0x2
	tle	%icc,	0x0
	set	0x20, %l0
	ldswa	[%l7 + %l0] 0x04,	%o1
	andcc	%i5,	0x13CB,	%g2
	fand	%f16,	%f20,	%f14
	set	0x5C, %i3
	ldswa	[%l7 + %i3] 0x04,	%i4
	fmovdleu	%xcc,	%f21,	%f23
	ldd	[%l7 + 0x78],	%l0
	tsubcctv	%i0,	%l2,	%l4
	andn	%g4,	0x0C7B,	%g5
	add	%l7,	0x78,	%l6
	wr	%g0,	0x19,	%asi
	casa	[%l6] %asi,	%o2,	%l6
	movne	%xcc,	%i7,	%o4
	smulcc	%o0,	%l1,	%l3
	fpsub16s	%f6,	%f5,	%f7
	edge32n	%o7,	%i3,	%g7
	andn	%l5,	%g3,	%o6
	edge16n	%o5,	%g6,	%i2
	bge,a	loop_2804
	fmovsvs	%icc,	%f10,	%f0
	tn	%xcc,	0x0
	fcmple16	%f18,	%f4,	%i6
loop_2804:
	tcc	%icc,	0x2
	fcmpgt32	%f12,	%f14,	%i1
	swap	[%l7 + 0x34],	%g1
	xnorcc	%o3,	0x0BA3,	%i5
	movvc	%xcc,	%o1,	%g2
	fbul,a	%fcc2,	loop_2805
	bl,a	%xcc,	loop_2806
	bneg	loop_2807
	fcmpes	%fcc1,	%f9,	%f8
loop_2805:
	fmovdvs	%icc,	%f22,	%f22
loop_2806:
	movle	%icc,	%i4,	%l0
loop_2807:
	smul	%l2,	0x0D67,	%l4
	wr	%g0,	0x88,	%asi
	lduha	[%l7 + 0x6C] %asi,	%i0
	fsrc2s	%f25,	%f17
	fmul8ulx16	%f2,	%f4,	%f20
	edge32ln	%g4,	%o2,	%l6
	andn	%g5,	0x0114,	%i7
	movvs	%xcc,	%o0,	%o4
	set	0x28, %l1
	lduha	[%l7 + %l1] 0x0c,	%l3
	umulcc	%o7,	%l1,	%i3
	bvc,pt	%xcc,	loop_2808
	movge	%icc,	%l5,	%g7
	fmovs	%f0,	%f5
	wr	%g0,	0x04,	%asi
	ldsba	[%l7 + 0x67] %asi,	%o6
loop_2808:
	movneg	%xcc,	%g3,	%o5
	movl	%icc,	%g6,	%i6
	brz	%i2,	loop_2809
	movpos	%icc,	%g1,	%i1
	movn	%xcc,	%o3,	%o1
	edge8l	%i5,	%i4,	%g2
loop_2809:
	sra	%l0,	%l2,	%l4
	stw	%i0,	[%l7 + 0x38]
	bneg,pn	%icc,	loop_2810
	fnand	%f30,	%f28,	%f24
	edge16n	%g4,	%l6,	%g5
	addc	%o2,	%i7,	%o4
loop_2810:
	umul	%l3,	%o7,	%l1
	fsrc1s	%f24,	%f21
	addc	%i3,	0x015D,	%o0
	fmovrslez	%g7,	%f29,	%f10
	udivx	%l5,	0x0D85,	%o6
	edge8	%o5,	%g6,	%g3
	fblg	%fcc1,	loop_2811
	tn	%xcc,	0x2
	mulscc	%i6,	%i2,	%i1
	bn,pn	%xcc,	loop_2812
loop_2811:
	ldub	[%l7 + 0x33],	%o3
	fmovdge	%icc,	%f17,	%f10
	fcmpes	%fcc0,	%f24,	%f28
loop_2812:
	std	%g0,	[%l7 + 0x48]
	subcc	%i5,	%i4,	%g2
	bgu,a	loop_2813
	bcc,a,pt	%icc,	loop_2814
	fand	%f4,	%f6,	%f24
	taddcctv	%l0,	0x1A4E,	%l2
loop_2813:
	movcc	%xcc,	%o1,	%i0
loop_2814:
	edge32n	%g4,	%l6,	%l4
	pdist	%f20,	%f14,	%f24
	movneg	%xcc,	%g5,	%i7
	brlez,a	%o2,	loop_2815
	edge16n	%o4,	%o7,	%l1
	fbule,a	%fcc0,	loop_2816
	brgz,a	%l3,	loop_2817
loop_2815:
	edge8n	%o0,	%i3,	%l5
	fpsub32s	%f26,	%f18,	%f14
loop_2816:
	xnorcc	%g7,	%o6,	%o5
loop_2817:
	nop
	wr	%g0,	0x11,	%asi
	lduba	[%l7 + 0x71] %asi,	%g3
	subc	%g6,	%i6,	%i1
	ta	%xcc,	0x2
	sdivx	%o3,	0x1410,	%g1
	ldub	[%l7 + 0x2F],	%i2
	fxors	%f6,	%f23,	%f31
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tge	%xcc,	0x2
	xnorcc	%i4,	%g2,	%i5
	edge32l	%l2,	%o1,	%i0
	sdivx	%l0,	0x0640,	%l6
	fmovsneg	%xcc,	%f14,	%f28
	array32	%g4,	%g5,	%i7
	fbn,a	%fcc2,	loop_2818
	xnorcc	%l4,	0x1395,	%o2
	sll	%o4,	%o7,	%l1
	fmovdg	%icc,	%f9,	%f27
loop_2818:
	edge8ln	%l3,	%i3,	%o0
	set	0x40, %o6
	stda	%g6,	[%l7 + %o6] 0x0c
	smulcc	%o6,	0x1F5C,	%l5
	fands	%f21,	%f22,	%f11
	ble	loop_2819
	array32	%g3,	%g6,	%o5
	fmovdcc	%xcc,	%f26,	%f21
	fand	%f24,	%f22,	%f30
loop_2819:
	umulcc	%i6,	%i1,	%g1
	nop
	setx	loop_2820,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	addccc	%i2,	0x1D8C,	%i4
	tgu	%icc,	0x7
	fbule	%fcc3,	loop_2821
loop_2820:
	sdiv	%g2,	0x1000,	%o3
	sdivx	%l2,	0x1AF7,	%i5
	movcc	%icc,	%o1,	%l0
loop_2821:
	edge16ln	%i0,	%g4,	%l6
	fcmped	%fcc2,	%f26,	%f2
	popc	%g5,	%i7
	umulcc	%l4,	0x0972,	%o2
	fbul	%fcc1,	loop_2822
	movrne	%o4,	0x034,	%l1
	popc	%o7,	%l3
	fpsub32	%f26,	%f26,	%f24
loop_2822:
	fmovspos	%xcc,	%f31,	%f21
	tvc	%icc,	0x3
	umul	%i3,	0x16FC,	%o0
	edge8	%o6,	%l5,	%g3
	and	%g6,	%o5,	%g7
	or	%i1,	%i6,	%g1
	orcc	%i4,	%i2,	%o3
	xnor	%g2,	0x1A8F,	%l2
	udivcc	%o1,	0x174C,	%l0
	set	0x27, %l6
	lduba	[%l7 + %l6] 0x04,	%i0
	array32	%i5,	%g4,	%g5
	add	%l7,	0x20,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] %asi,	%i7,	%l6
	array32	%o2,	%l4,	%o4
	wr	%g0,	0x1e,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
	tge	%xcc,	0x1
	udivx	%l1,	0x1034,	%o7
	tsubcc	%l3,	%i3,	%o6
	bvc,a	%icc,	loop_2823
	brz,a	%o0,	loop_2824
	orncc	%l5,	0x1E1C,	%g6
	fpack16	%f26,	%f5
loop_2823:
	mulx	%g3,	%g7,	%o5
loop_2824:
	fpackfix	%f24,	%f3
	sll	%i6,	0x0F,	%g1
	movle	%xcc,	%i4,	%i2
	ldsw	[%l7 + 0x24],	%i1
	set	0x68, %i1
	swapa	[%l7 + %i1] 0x04,	%g2
	stw	%l2,	[%l7 + 0x7C]
	fmovsle	%icc,	%f12,	%f20
	xorcc	%o1,	%o3,	%i0
	set	0x2C, %o5
	sta	%f22,	[%l7 + %o5] 0x15
	fmovsneg	%xcc,	%f27,	%f0
	subccc	%i5,	%g4,	%l0
	orcc	%g5,	0x0BD4,	%i7
	fbo,a	%fcc3,	loop_2825
	edge32	%o2,	%l6,	%o4
	fmovrse	%l1,	%f15,	%f19
	tsubcc	%l4,	0x0996,	%o7
loop_2825:
	movgu	%xcc,	%i3,	%l3
	or	%o6,	0x1B9D,	%o0
	wr	%g0,	0x04,	%asi
	prefetcha	[%l7 + 0x10] %asi,	 0x0
	tsubcc	%l5,	%g3,	%o5
	movvs	%xcc,	%g7,	%i6
	fabss	%f5,	%f12
	movrlez	%i4,	0x182,	%i2
	fpsub32	%f14,	%f8,	%f24
	xnor	%g1,	0x177C,	%i1
	udivcc	%g2,	0x0AEF,	%o1
	add	%l7,	0x50,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%o3,	%i0
	bn,a	loop_2826
	ta	%icc,	0x3
	xorcc	%i5,	0x0AEC,	%l2
	ldsb	[%l7 + 0x62],	%g4
loop_2826:
	xorcc	%g5,	0x1658,	%l0
	fpadd16s	%f7,	%f24,	%f23
	fnands	%f21,	%f24,	%f17
	fmovrdgez	%o2,	%f18,	%f18
	movge	%xcc,	%l6,	%o4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	smul	%l1,	0x0C47,	%i7
	tneg	%xcc,	0x6
	srlx	%l4,	%i3,	%l3
	movrgez	%o6,	%o0,	%o7
	mulscc	%g6,	%g3,	%l5
	movge	%icc,	%o5,	%g7
	umul	%i6,	0x1030,	%i2
	tcs	%icc,	0x2
	ta	%icc,	0x6
	popc	0x016E,	%g1
	tneg	%xcc,	0x1
	edge32l	%i4,	%g2,	%i1
	stw	%o1,	[%l7 + 0x20]
	fbo	%fcc1,	loop_2827
	stw	%o3,	[%l7 + 0x1C]
	array8	%i0,	%i5,	%g4
	alignaddrl	%g5,	%l0,	%l2
loop_2827:
	movle	%icc,	%o2,	%o4
	xnor	%l6,	0x0ED6,	%i7
	orn	%l4,	0x1E3C,	%i3
	tvc	%xcc,	0x7
	tvc	%icc,	0x4
	and	%l3,	0x029F,	%l1
	fbne,a	%fcc0,	loop_2828
	tg	%xcc,	0x5
	fnot2	%f20,	%f0
	fand	%f16,	%f18,	%f14
loop_2828:
	fmovrdgez	%o0,	%f22,	%f28
	stbar
	brz	%o7,	loop_2829
	andncc	%g6,	%o6,	%g3
	wr	%g0,	0x19,	%asi
	sta	%f1,	[%l7 + 0x38] %asi
loop_2829:
	swap	[%l7 + 0x64],	%o5
	edge8l	%l5,	%g7,	%i2
	move	%xcc,	%i6,	%i4
	udivcc	%g2,	0x1F04,	%i1
	fbge	%fcc1,	loop_2830
	fnot2s	%f15,	%f3
	movvc	%icc,	%g1,	%o1
	sra	%o3,	0x11,	%i5
loop_2830:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tvs	%xcc,	0x1
	movcc	%xcc,	%g4,	%i0
	membar	0x75
	wr	%g0,	0x2b,	%asi
	stha	%l0,	[%l7 + 0x74] %asi
	membar	#Sync
	movvc	%icc,	%g5,	%o2
	wr	%g0,	0x89,	%asi
	ldsba	[%l7 + 0x0E] %asi,	%o4
	sub	%l6,	%l2,	%l4
	xnorcc	%i3,	%l3,	%l1
	sll	%o0,	0x09,	%i7
	tneg	%icc,	0x7
	udiv	%g6,	0x08B1,	%o7
	bge,a	loop_2831
	fbo	%fcc0,	loop_2832
	tne	%xcc,	0x6
	sdivcc	%o6,	0x026D,	%o5
loop_2831:
	fpsub32	%f30,	%f16,	%f14
loop_2832:
	fnands	%f10,	%f29,	%f19
	tcc	%xcc,	0x7
	bn,a,pn	%xcc,	loop_2833
	faligndata	%f24,	%f30,	%f26
	mova	%xcc,	%g3,	%g7
	sll	%i2,	0x1A,	%l5
loop_2833:
	fcmpne16	%f10,	%f26,	%i4
	fcmpne32	%f24,	%f30,	%g2
	array16	%i1,	%g1,	%i6
	fbu,a	%fcc2,	loop_2834
	movge	%xcc,	%o1,	%o3
	subcc	%g4,	%i0,	%i5
	addc	%g5,	%o2,	%o4
loop_2834:
	fsrc1s	%f26,	%f8
	fmovdg	%xcc,	%f28,	%f11
	orcc	%l6,	%l0,	%l2
	udiv	%i3,	0x18A4,	%l4
	fmovdleu	%xcc,	%f5,	%f0
	array16	%l3,	%o0,	%l1
	movcs	%xcc,	%i7,	%o7
	movneg	%icc,	%o6,	%o5
	sra	%g6,	%g7,	%g3
	edge32l	%l5,	%i4,	%i2
	umul	%i1,	%g1,	%g2
	taddcc	%i6,	0x1DC3,	%o1
	call	loop_2835
	sth	%o3,	[%l7 + 0x7E]
	andcc	%i0,	%i5,	%g4
	or	%o2,	0x0CBC,	%o4
loop_2835:
	sethi	0x1B27,	%l6
	tvs	%xcc,	0x2
	fzeros	%f1
	addcc	%l0,	0x0228,	%g5
	sir	0x1550
	movrgez	%i3,	%l2,	%l3
	movl	%xcc,	%o0,	%l4
	addcc	%i7,	0x155A,	%o7
	movpos	%icc,	%l1,	%o6
	smul	%o5,	0x0CCD,	%g6
	te	%icc,	0x6
	bl,a	loop_2836
	membar	0x79
	bg,a,pt	%xcc,	loop_2837
	edge32l	%g3,	%g7,	%i4
loop_2836:
	edge16n	%i2,	%i1,	%l5
	fbne,a	%fcc2,	loop_2838
loop_2837:
	srax	%g2,	%i6,	%o1
	movcs	%icc,	%o3,	%g1
	movvs	%icc,	%i5,	%g4
loop_2838:
	sll	%o2,	0x10,	%o4
	fmovda	%xcc,	%f9,	%f25
	xor	%l6,	0x0319,	%i0
	be,a,pt	%xcc,	loop_2839
	edge8ln	%g5,	%i3,	%l0
	movg	%xcc,	%l3,	%l2
	membar	0x53
loop_2839:
	srlx	%l4,	%i7,	%o7
	fand	%f22,	%f18,	%f2
	bcs,pn	%icc,	loop_2840
	popc	%o0,	%o6
	fmovrdgz	%o5,	%f4,	%f8
	fmul8x16au	%f27,	%f16,	%f2
loop_2840:
	udivcc	%l1,	0x1FE9,	%g6
	fpack16	%f16,	%f4
	mulscc	%g3,	%g7,	%i4
	srlx	%i2,	0x00,	%i1
	edge8ln	%l5,	%g2,	%o1
	wr	%g0,	0x89,	%asi
	stxa	%o3,	[%l7 + 0x38] %asi
	add	%l7,	0x38,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%g1
	casxa	[%l6] %asi,	%g1,	%i5
	edge32	%i6,	%g4,	%o4
	andcc	%l6,	0x043B,	%o2
	fmovsl	%xcc,	%f22,	%f10
	tleu	%xcc,	0x6
	mulscc	%i0,	%i3,	%g5
	fcmpne16	%f30,	%f8,	%l3
	fbge	%fcc3,	loop_2841
	srl	%l2,	0x09,	%l0
	tsubcc	%l4,	0x0856,	%i7
	add	%o7,	%o0,	%o5
loop_2841:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fornot1s	%f1,	%f23,	%f19
	xorcc	%l1,	0x0533,	%g6
	taddcctv	%o6,	0x17E6,	%g7
	andcc	%i4,	0x178D,	%i2
	movge	%xcc,	%i1,	%l5
	bge,a	%xcc,	loop_2842
	movgu	%xcc,	%g3,	%g2
	addccc	%o3,	%g1,	%o1
	wr	%g0,	0x04,	%asi
	ldxa	[%l7 + 0x68] %asi,	%i5
loop_2842:
	fmovsge	%icc,	%f5,	%f0
	fmovrslez	%i6,	%f17,	%f6
	bleu,a,pn	%icc,	loop_2843
	taddcc	%g4,	%l6,	%o2
	fmul8sux16	%f6,	%f22,	%f12
	fcmpgt16	%f12,	%f0,	%i0
loop_2843:
	fzero	%f28
	movle	%xcc,	%i3,	%o4
	wr	%g0,	0x10,	%asi
	stxa	%g5,	[%l7 + 0x78] %asi
	movvs	%icc,	%l3,	%l2
	and	%l0,	%i7,	%o7
	edge8n	%l4,	%o5,	%o0
	fbn,a	%fcc3,	loop_2844
	andcc	%l1,	%o6,	%g7
	umul	%g6,	0x0654,	%i2
	movgu	%icc,	%i4,	%i1
loop_2844:
	alignaddr	%l5,	%g3,	%o3
	call	loop_2845
	fsrc2	%f24,	%f16
	umulcc	%g1,	%o1,	%g2
	fpadd32s	%f12,	%f11,	%f24
loop_2845:
	fcmpne32	%f22,	%f14,	%i6
	tgu	%xcc,	0x4
	set	0x38, %g4
	stwa	%g4,	[%l7 + %g4] 0x2a
	membar	#Sync
	fcmpd	%fcc3,	%f6,	%f24
	tleu	%icc,	0x1
	movle	%icc,	%i5,	%o2
	udiv	%i0,	0x02AB,	%l6
	mulscc	%i3,	0x004F,	%o4
	udiv	%g5,	0x0EB3,	%l2
	lduh	[%l7 + 0x66],	%l0
	xnorcc	%l3,	%i7,	%o7
	set	0x6C, %o1
	lduwa	[%l7 + %o1] 0x04,	%l4
	sdivx	%o5,	0x0D38,	%o0
	fnot2	%f28,	%f0
	andn	%l1,	%o6,	%g7
	andcc	%i2,	%g6,	%i1
	movcs	%xcc,	%l5,	%g3
	fmovscc	%xcc,	%f23,	%f6
	fbul,a	%fcc3,	loop_2846
	fbe,a	%fcc2,	loop_2847
	fbu	%fcc2,	loop_2848
	bcs,a,pn	%xcc,	loop_2849
loop_2846:
	tge	%xcc,	0x1
loop_2847:
	fmovsle	%xcc,	%f18,	%f31
loop_2848:
	array32	%o3,	%g1,	%i4
loop_2849:
	sllx	%o1,	0x0D,	%g2
	udivx	%g4,	0x1648,	%i6
	set	0x60, %l2
	stxa	%i5,	[%l7 + %l2] 0x0c
	fbue	%fcc2,	loop_2850
	fornot2s	%f15,	%f11,	%f15
	sir	0x0008
	st	%f14,	[%l7 + 0x58]
loop_2850:
	movre	%o2,	%i0,	%l6
	or	%i3,	0x1471,	%g5
	movl	%xcc,	%o4,	%l0
	tg	%xcc,	0x4
	fba,a	%fcc0,	loop_2851
	movrne	%l3,	0x0F6,	%i7
	fornot1s	%f9,	%f26,	%f26
	movn	%xcc,	%l2,	%l4
loop_2851:
	orcc	%o5,	%o0,	%l1
	fexpand	%f8,	%f8
	lduw	[%l7 + 0x58],	%o6
	edge16	%o7,	%g7,	%i2
	prefetch	[%l7 + 0x30],	 0x3
	fcmpeq16	%f8,	%f6,	%g6
	and	%l5,	0x1EB5,	%g3
	fba,a	%fcc0,	loop_2852
	edge8l	%i1,	%g1,	%i4
	fble	%fcc0,	loop_2853
	fnors	%f5,	%f26,	%f7
loop_2852:
	tcc	%xcc,	0x7
	edge32n	%o3,	%o1,	%g2
loop_2853:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	smulcc	%g4,	%i5,	%o2
	array32	%i6,	%i0,	%l6
	umul	%g5,	%o4,	%l0
	swap	[%l7 + 0x38],	%l3
	andcc	%i7,	%i3,	%l2
	edge8n	%l4,	%o0,	%o5
	edge8ln	%l1,	%o7,	%o6
	fandnot1s	%f17,	%f18,	%f28
	fpmerge	%f2,	%f27,	%f8
	swap	[%l7 + 0x1C],	%i2
	fabsd	%f2,	%f22
	ldsw	[%l7 + 0x14],	%g6
	edge32ln	%g7,	%g3,	%l5
	ldsw	[%l7 + 0x28],	%i1
	sir	0x198F
	movre	%i4,	0x2E1,	%o3
	fnot2	%f10,	%f30
	nop
	setx	loop_2854,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	stb	%o1,	[%l7 + 0x76]
	orcc	%g1,	0x0DAB,	%g4
	addcc	%i5,	0x076E,	%o2
loop_2854:
	tne	%icc,	0x4
	fzeros	%f8
	tge	%icc,	0x3
	brlz,a	%g2,	loop_2855
	xorcc	%i6,	%l6,	%i0
	tgu	%icc,	0x2
	andcc	%g5,	0x1503,	%o4
loop_2855:
	edge8ln	%l3,	%l0,	%i7
	ble,a,pn	%icc,	loop_2856
	orncc	%l2,	0x0732,	%i3
	fmovsvs	%xcc,	%f24,	%f24
	andn	%o0,	0x0667,	%o5
loop_2856:
	fba,a	%fcc3,	loop_2857
	smul	%l4,	%l1,	%o6
	add	%i2,	%o7,	%g6
	tcs	%xcc,	0x7
loop_2857:
	fcmple16	%f30,	%f28,	%g7
	brgz	%l5,	loop_2858
	fbl	%fcc3,	loop_2859
	sdivcc	%i1,	0x01A5,	%g3
	sdivx	%i4,	0x08C3,	%o1
loop_2858:
	fmovsle	%icc,	%f11,	%f20
loop_2859:
	membar	0x65
	fbul,a	%fcc3,	loop_2860
	xnorcc	%g1,	0x02C1,	%g4
	sllx	%o3,	0x17,	%i5
	fmuld8sux16	%f8,	%f2,	%f20
loop_2860:
	subcc	%o2,	0x16B3,	%g2
	add	%l6,	0x08CC,	%i0
	flush	%l7 + 0x7C
	taddcctv	%i6,	%o4,	%l3
	std	%l0,	[%l7 + 0x58]
	set	0x60, %i5
	ldsha	[%l7 + %i5] 0x88,	%i7
	tpos	%icc,	0x4
	umulcc	%g5,	0x030D,	%i3
	tle	%icc,	0x4
	movrne	%o0,	0x1A4,	%l2
	brz	%l4,	loop_2861
	xnorcc	%o5,	%o6,	%l1
	umul	%o7,	%i2,	%g6
	tn	%icc,	0x1
loop_2861:
	edge32n	%g7,	%i1,	%l5
	movvc	%xcc,	%g3,	%o1
	sllx	%i4,	%g4,	%g1
	addc	%i5,	%o3,	%o2
	brgez,a	%g2,	loop_2862
	movl	%icc,	%l6,	%i0
	fmuld8sux16	%f10,	%f20,	%f30
	bg,a	%icc,	loop_2863
loop_2862:
	fandnot2	%f28,	%f22,	%f30
	sllx	%o4,	0x01,	%l3
	array32	%l0,	%i6,	%g5
loop_2863:
	tvs	%icc,	0x6
	bcc,a,pt	%xcc,	loop_2864
	orcc	%i7,	0x0E06,	%i3
	movneg	%xcc,	%l2,	%l4
	bcs	%xcc,	loop_2865
loop_2864:
	fandnot1	%f0,	%f8,	%f2
	subc	%o5,	0x1F02,	%o0
	udivx	%o6,	0x1B07,	%o7
loop_2865:
	edge32	%i2,	%l1,	%g7
	edge16	%g6,	%i1,	%l5
	edge32n	%o1,	%g3,	%i4
	udivcc	%g1,	0x18D1,	%g4
	membar	0x60
	srl	%i5,	0x18,	%o3
	fmovrdlz	%o2,	%f18,	%f18
	sll	%l6,	%i0,	%g2
	orn	%l3,	%o4,	%l0
	fandnot2s	%f20,	%f25,	%f1
	andn	%i6,	0x05B5,	%g5
	tcc	%icc,	0x4
	sth	%i3,	[%l7 + 0x48]
	movvs	%xcc,	%l2,	%l4
	wr	%g0,	0x81,	%asi
	stba	%o5,	[%l7 + 0x5C] %asi
	fble	%fcc0,	loop_2866
	bn,a	loop_2867
	sth	%i7,	[%l7 + 0x20]
	lduw	[%l7 + 0x0C],	%o6
loop_2866:
	array8	%o0,	%o7,	%i2
loop_2867:
	add	%g7,	0x1A23,	%l1
	movge	%xcc,	%g6,	%i1
	udivx	%o1,	0x19D1,	%l5
	fxnor	%f12,	%f20,	%f20
	andncc	%g3,	%i4,	%g1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	call	loop_2868
	stx	%g4,	[%l7 + 0x68]
	tsubcc	%o3,	0x1FFF,	%o2
	fcmpes	%fcc2,	%f2,	%f18
loop_2868:
	alignaddrl	%l6,	%i5,	%g2
	tn	%xcc,	0x4
	tn	%icc,	0x1
	ldd	[%l7 + 0x28],	%f10
	fnands	%f7,	%f0,	%f1
	fmovscc	%xcc,	%f20,	%f23
	fmovsge	%icc,	%f19,	%f8
	movrlez	%l3,	%o4,	%l0
	subccc	%i0,	%g5,	%i3
	brnz	%i6,	loop_2869
	sir	0x048E
	edge8ln	%l4,	%o5,	%i7
	te	%xcc,	0x7
loop_2869:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrgez	%l2,	0x226,	%o6
	fornot1	%f14,	%f22,	%f6
	fble	%fcc2,	loop_2870
	bcc,a	loop_2871
	addc	%o0,	0x0E74,	%i2
	subc	%o7,	%g7,	%l1
loop_2870:
	bg,a,pn	%xcc,	loop_2872
loop_2871:
	mova	%icc,	%i1,	%g6
	movrlz	%l5,	%o1,	%g3
	sll	%g1,	%i4,	%g4
loop_2872:
	addc	%o2,	0x01D4,	%o3
	fmovrslez	%i5,	%f24,	%f12
	fmovrslz	%l6,	%f28,	%f21
	sdivx	%g2,	0x009D,	%l3
	fmovdneg	%icc,	%f16,	%f23
	addccc	%o4,	%i0,	%l0
	fpsub16s	%f31,	%f16,	%f24
	ld	[%l7 + 0x0C],	%f2
	sll	%i3,	0x0F,	%g5
	fbo	%fcc3,	loop_2873
	fmovsl	%icc,	%f31,	%f28
	udivcc	%l4,	0x00EE,	%o5
	edge16	%i7,	%i6,	%o6
loop_2873:
	sethi	0x02FC,	%o0
	fpadd32	%f14,	%f26,	%f4
	edge16ln	%i2,	%l2,	%g7
	xorcc	%l1,	%o7,	%i1
	fornot1	%f6,	%f14,	%f26
	nop
	setx	loop_2874,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	srlx	%g6,	%l5,	%g3
	ldsh	[%l7 + 0x2C],	%g1
	membar	#Sync
	set	0x40, %g3
	ldda	[%l7 + %g3] 0x1f,	%f0
loop_2874:
	edge32	%o1,	%g4,	%i4
	movvc	%xcc,	%o3,	%i5
	add	%l7,	0x28,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%o2
	casxa	[%l6] %asi,	%o2,	%g2
	array16	%l3,	%o4,	%l6
	nop
	setx loop_2875, %l0, %l1
	jmpl %l1, %l0
	edge32l	%i3,	%g5,	%i0
	fmovdle	%xcc,	%f7,	%f8
	xorcc	%l4,	0x1CB7,	%i7
loop_2875:
	movrlez	%i6,	0x373,	%o6
	fmul8x16al	%f21,	%f7,	%f0
	fxnor	%f10,	%f4,	%f24
	fcmpne16	%f30,	%f2,	%o5
	fbul,a	%fcc1,	loop_2876
	sdivcc	%i2,	0x19FB,	%l2
	sll	%o0,	%g7,	%o7
	fmovrdgez	%l1,	%f16,	%f16
loop_2876:
	alignaddr	%g6,	%l5,	%i1
	movrlz	%g3,	0x2FD,	%o1
	sth	%g1,	[%l7 + 0x38]
	fbn	%fcc1,	loop_2877
	edge8n	%g4,	%i4,	%o3
	fsrc2s	%f22,	%f10
	wr	%g0,	0x2c,	%asi
	ldda	[%l7 + 0x40] %asi,	%o2
loop_2877:
	taddcctv	%g2,	0x1978,	%l3
	or	%o4,	%l6,	%i5
	udivcc	%l0,	0x11AD,	%g5
	ta	%xcc,	0x3
	lduh	[%l7 + 0x78],	%i3
	xor	%i0,	%l4,	%i6
	movrgz	%o6,	%i7,	%i2
	wr	%g0,	0x0c,	%asi
	stwa	%o5,	[%l7 + 0x30] %asi
	fbl,a	%fcc1,	loop_2878
	swap	[%l7 + 0x50],	%l2
	fmovse	%icc,	%f0,	%f13
	edge32	%g7,	%o0,	%l1
loop_2878:
	ba,pt	%icc,	loop_2879
	fbug,a	%fcc3,	loop_2880
	fbuge	%fcc0,	loop_2881
	edge16l	%o7,	%l5,	%i1
loop_2879:
	tneg	%icc,	0x5
loop_2880:
	sdivcc	%g3,	0x162A,	%g6
loop_2881:
	edge16n	%g1,	%g4,	%i4
	fandnot2	%f10,	%f26,	%f6
	edge16l	%o3,	%o1,	%o2
	fands	%f15,	%f3,	%f3
	wr	%g0,	0x81,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	fnot1	%f0,	%f26
	fpmerge	%f5,	%f11,	%f6
	fbo	%fcc0,	loop_2882
	bpos,pt	%xcc,	loop_2883
	taddcctv	%l3,	%g2,	%l6
	andn	%o4,	%i5,	%g5
loop_2882:
	fcmpes	%fcc1,	%f19,	%f14
loop_2883:
	fexpand	%f11,	%f6
	st	%f17,	[%l7 + 0x7C]
	edge8l	%i3,	%l0,	%i0
	set	0x40, %g7
	stda	%f16,	[%l7 + %g7] 0x14
	movle	%xcc,	%i6,	%l4
	std	%o6,	[%l7 + 0x20]
	movl	%icc,	%i7,	%o5
	orncc	%i2,	%g7,	%o0
	tsubcctv	%l2,	0x0CFE,	%l1
	bcc,a,pt	%xcc,	loop_2884
	tgu	%icc,	0x4
	set	0x40, %g1
	stda	%o6,	[%l7 + %g1] 0x27
	membar	#Sync
loop_2884:
	tcc	%xcc,	0x0
	xnor	%l5,	0x04E6,	%i1
	edge8	%g6,	%g3,	%g1
	wr	%g0,	0x22,	%asi
	stda	%i4,	[%l7 + 0x78] %asi
	membar	#Sync
	wr	%g0,	0x19,	%asi
	ldda	[%l7 + 0x40] %asi,	%g4
	wr	%g0,	0xf9,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
	fcmpd	%fcc2,	%f2,	%f28
	fbo	%fcc3,	loop_2885
	addccc	%o3,	%o2,	%o1
	srlx	%l3,	%l6,	%g2
	fmovdvs	%xcc,	%f4,	%f15
loop_2885:
	fbe	%fcc1,	loop_2886
	andcc	%i5,	%g5,	%i3
	wr	%g0,	0xe2,	%asi
	stwa	%o4,	[%l7 + 0x7C] %asi
	membar	#Sync
loop_2886:
	array16	%i0,	%l0,	%l4
	ldsb	[%l7 + 0x7A],	%i6
	wr	%g0,	0x19,	%asi
	ldxa	[%l7 + 0x08] %asi,	%i7
	udivcc	%o5,	0x06C6,	%i2
	orn	%g7,	%o0,	%l2
	fmovsle	%xcc,	%f23,	%f11
	fmovs	%f8,	%f4
	xor	%l1,	0x1562,	%o7
	movle	%xcc,	%l5,	%o6
	std	%g6,	[%l7 + 0x20]
	movcs	%icc,	%g3,	%i1
	wr	%g0,	0x0c,	%asi
	swapa	[%l7 + 0x58] %asi,	%i4
	std	%f12,	[%l7 + 0x70]
	set	0x10, %l5
	ldsba	[%l7 + %l5] 0x81,	%g4
	fmovse	%icc,	%f13,	%f24
	fbue	%fcc0,	loop_2887
	tsubcctv	%o3,	%g1,	%o2
	xor	%l3,	0x1963,	%l6
	addcc	%o1,	0x108E,	%g2
loop_2887:
	movpos	%icc,	%g5,	%i5
	bge,pn	%xcc,	loop_2888
	udivx	%o4,	0x13B0,	%i0
	smulcc	%i3,	%l4,	%i6
	tne	%xcc,	0x6
loop_2888:
	fcmpes	%fcc3,	%f31,	%f12
	membar	0x25
	ldsh	[%l7 + 0x2E],	%l0
	fba	%fcc1,	loop_2889
	edge8ln	%i7,	%o5,	%i2
	bcs	%icc,	loop_2890
	movleu	%xcc,	%o0,	%g7
loop_2889:
	fmovde	%icc,	%f18,	%f11
	movrlz	%l1,	0x363,	%l2
loop_2890:
	subcc	%o7,	%l5,	%o6
	movcc	%xcc,	%g6,	%i1
	sth	%g3,	[%l7 + 0x66]
	srlx	%g4,	%o3,	%g1
	orcc	%o2,	0x1ACA,	%i4
	sll	%l6,	%l3,	%o1
	subccc	%g2,	%g5,	%i5
	ldd	[%l7 + 0x70],	%o4
	orncc	%i0,	0x1C96,	%i3
	movrlz	%l4,	%l0,	%i6
	sub	%i7,	%i2,	%o0
	movne	%xcc,	%o5,	%g7
	mova	%icc,	%l2,	%o7
	wr	%g0,	0x04,	%asi
	lduwa	[%l7 + 0x50] %asi,	%l1
	fornot1s	%f31,	%f30,	%f13
	movneg	%xcc,	%l5,	%o6
	ta	%xcc,	0x5
	fbug,a	%fcc2,	loop_2891
	fblg	%fcc0,	loop_2892
	movl	%icc,	%g6,	%i1
	fmovdneg	%xcc,	%f18,	%f25
loop_2891:
	fpackfix	%f2,	%f11
loop_2892:
	tg	%xcc,	0x0
	set	0x4C, %l4
	sta	%f1,	[%l7 + %l4] 0x10
	smul	%g4,	%o3,	%g1
	xorcc	%o2,	0x13BC,	%i4
	movcs	%icc,	%g3,	%l3
	wr	%g0,	0x50,	%asi
	ldxa	[%g0 + 0x30] %asi,	%o1
	fornot1s	%f4,	%f1,	%f30
	ldsb	[%l7 + 0x33],	%l6
	srl	%g2,	%i5,	%g5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdpos	%icc,	%f22,	%f11
	fbge,a	%fcc2,	loop_2893
	taddcc	%i0,	0x0BCC,	%i3
	sir	0x1954
	fmovdge	%xcc,	%f8,	%f11
loop_2893:
	movle	%icc,	%o4,	%l0
	fpadd16	%f24,	%f0,	%f14
	movg	%xcc,	%l4,	%i6
	movre	%i2,	0x034,	%o0
	fmovdg	%icc,	%f11,	%f18
	brz	%o5,	loop_2894
	tcs	%icc,	0x3
	edge32l	%i7,	%g7,	%l2
	fmovdvs	%icc,	%f18,	%f6
loop_2894:
	mulx	%o7,	0x0575,	%l5
	smulcc	%o6,	%l1,	%g6
	movvc	%xcc,	%g4,	%o3
	fmovsl	%icc,	%f28,	%f30
	fblg	%fcc0,	loop_2895
	edge32ln	%i1,	%o2,	%g1
	umul	%g3,	0x1852,	%l3
	smulcc	%o1,	%l6,	%g2
loop_2895:
	edge16	%i5,	%g5,	%i4
	fbu	%fcc0,	loop_2896
	move	%xcc,	%i0,	%o4
	nop
	setx	loop_2897,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movn	%icc,	%i3,	%l4
loop_2896:
	movcc	%icc,	%l0,	%i2
	add	%l7,	0x58,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%o0,	%i6
loop_2897:
	array16	%o5,	%i7,	%g7
	movneg	%xcc,	%o7,	%l5
	edge16ln	%l2,	%o6,	%g6
	ldub	[%l7 + 0x27],	%g4
	array32	%l1,	%i1,	%o2
	fmovdl	%icc,	%f2,	%f11
	fpack32	%f4,	%f6,	%f8
	brgz,a	%o3,	loop_2898
	add	%g1,	0x13BB,	%g3
	fmovdpos	%icc,	%f7,	%f9
	wr	%g0,	0x81,	%asi
	stba	%o1,	[%l7 + 0x13] %asi
loop_2898:
	sll	%l6,	0x00,	%g2
	bcc,pt	%xcc,	loop_2899
	subccc	%i5,	0x0459,	%l3
	movrgz	%i4,	0x368,	%g5
	subcc	%o4,	0x1B26,	%i0
loop_2899:
	fbge,a	%fcc0,	loop_2900
	tge	%xcc,	0x4
	movleu	%xcc,	%i3,	%l0
	wr	%g0,	0x23,	%asi
	stha	%l4,	[%l7 + 0x54] %asi
	membar	#Sync
loop_2900:
	nop
	wr	%g0,	0x80,	%asi
	stda	%o0,	[%l7 + 0x38] %asi
	bgu,a	loop_2901
	smul	%i2,	0x1D8C,	%o5
	bpos,a,pt	%icc,	loop_2902
	srax	%i7,	%g7,	%o7
loop_2901:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmpgt16	%f14,	%f8,	%i6
loop_2902:
	tvs	%icc,	0x4
	tg	%xcc,	0x5
	ld	[%l7 + 0x50],	%f16
	fpadd16	%f28,	%f10,	%f28
	bcc,a,pn	%xcc,	loop_2903
	fone	%f12
	sub	%l2,	%l5,	%o6
	add	%g4,	0x1705,	%l1
loop_2903:
	tpos	%xcc,	0x1
	edge16l	%i1,	%o2,	%g6
	taddcctv	%g1,	0x1D6C,	%o3
	faligndata	%f16,	%f6,	%f0
	tsubcctv	%o1,	0x08BB,	%g3
	smulcc	%l6,	0x1BA2,	%g2
	tleu	%icc,	0x5
	fmovsne	%icc,	%f11,	%f6
	fmovsg	%xcc,	%f10,	%f19
	wr	%g0,	0x89,	%asi
	sta	%f30,	[%l7 + 0x64] %asi
	fcmpeq32	%f16,	%f4,	%l3
	bvs,a	loop_2904
	subcc	%i5,	%i4,	%o4
	xor	%i0,	%g5,	%l0
	fmovrsne	%i3,	%f7,	%f31
loop_2904:
	fbne,a	%fcc2,	loop_2905
	brgez,a	%o0,	loop_2906
	fmovrdgz	%l4,	%f12,	%f0
	movpos	%icc,	%o5,	%i2
loop_2905:
	andncc	%i7,	%o7,	%g7
loop_2906:
	orn	%l2,	0x10D5,	%i6
	mulx	%l5,	%g4,	%l1
	movgu	%icc,	%o6,	%o2
	fmovdn	%xcc,	%f0,	%f0
	st	%f19,	[%l7 + 0x3C]
	fmovdg	%xcc,	%f30,	%f13
	sdivx	%i1,	0x0204,	%g6
	movre	%g1,	0x0C8,	%o1
	fnot2	%f30,	%f22
	movne	%icc,	%o3,	%l6
	andncc	%g3,	%l3,	%i5
	srax	%i4,	%g2,	%i0
	xor	%o4,	0x0B92,	%l0
	bn,a	loop_2907
	tcc	%icc,	0x1
	movleu	%icc,	%i3,	%g5
	fble,a	%fcc0,	loop_2908
loop_2907:
	fmovsvs	%xcc,	%f28,	%f8
	tneg	%icc,	0x2
	movrgez	%o0,	%o5,	%l4
loop_2908:
	edge32n	%i7,	%i2,	%g7
	brgz,a	%o7,	loop_2909
	movleu	%icc,	%l2,	%l5
	xnorcc	%i6,	0x0C91,	%g4
	sllx	%o6,	0x16,	%o2
loop_2909:
	andn	%i1,	%g6,	%g1
	xnor	%l1,	0x1E19,	%o3
	edge32l	%l6,	%o1,	%g3
	subc	%l3,	0x1056,	%i4
	fmovsneg	%icc,	%f13,	%f14
	bn,a,pn	%icc,	loop_2910
	fpadd32s	%f20,	%f27,	%f24
	orcc	%g2,	0x152B,	%i0
	array16	%o4,	%i5,	%l0
loop_2910:
	fmovrse	%g5,	%f25,	%f26
	movvc	%xcc,	%o0,	%o5
	move	%icc,	%l4,	%i3
	subccc	%i2,	%i7,	%o7
	set	0x10, %l3
	stda	%l2,	[%l7 + %l3] 0x10
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bne,pt	%icc,	loop_2911
	edge8l	%g7,	%i6,	%l5
	sllx	%g4,	%o2,	%o6
	edge16ln	%i1,	%g1,	%g6
loop_2911:
	ble	loop_2912
	xorcc	%o3,	0x08A2,	%l6
	sdivcc	%o1,	0x1D96,	%l1
	bg,a,pt	%xcc,	loop_2913
loop_2912:
	std	%f20,	[%l7 + 0x78]
	movneg	%xcc,	%g3,	%l3
	array8	%i4,	%g2,	%i0
loop_2913:
	mova	%icc,	%i5,	%l0
	tcs	%xcc,	0x5
	sdivx	%o4,	0x1A62,	%g5
	brz	%o5,	loop_2914
	edge8ln	%o0,	%l4,	%i3
	tge	%icc,	0x4
	tpos	%xcc,	0x4
loop_2914:
	tg	%xcc,	0x1
	fmovdle	%icc,	%f8,	%f8
	tgu	%icc,	0x4
	move	%icc,	%i2,	%i7
	popc	%l2,	%o7
	fcmpes	%fcc3,	%f3,	%f17
	sdivcc	%i6,	0x05A4,	%g7
	set	0x22, %g5
	lduha	[%l7 + %g5] 0x14,	%l5
	popc	%o2,	%g4
	movle	%icc,	%o6,	%i1
	te	%xcc,	0x3
	smulcc	%g6,	%o3,	%l6
	nop
	setx	loop_2915,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movgu	%icc,	%g1,	%o1
	fmovd	%f10,	%f6
	udiv	%g3,	0x1469,	%l3
loop_2915:
	tleu	%icc,	0x0
	ldd	[%l7 + 0x48],	%l0
	fcmpeq32	%f18,	%f12,	%g2
	fble,a	%fcc3,	loop_2916
	fand	%f0,	%f28,	%f6
	fbge	%fcc3,	loop_2917
	move	%icc,	%i0,	%i4
loop_2916:
	brz	%i5,	loop_2918
	tl	%xcc,	0x4
loop_2917:
	taddcc	%l0,	0x0BD8,	%g5
	fmuld8sux16	%f25,	%f1,	%f10
loop_2918:
	brz	%o4,	loop_2919
	tgu	%icc,	0x1
	mulx	%o5,	%o0,	%i3
	movvs	%xcc,	%l4,	%i7
loop_2919:
	nop
	set	0x64, %i0
	lduwa	[%l7 + %i0] 0x11,	%l2
	edge32l	%i2,	%i6,	%o7
	move	%xcc,	%g7,	%l5
	fcmped	%fcc2,	%f30,	%f10
	nop
	set	0x48, %o0
	std	%g4,	[%l7 + %o0]
	movvs	%xcc,	%o6,	%i1
	wr	%g0,	0x11,	%asi
	lduha	[%l7 + 0x1E] %asi,	%g6
	edge16ln	%o2,	%o3,	%l6
	fmovdleu	%icc,	%f21,	%f9
	fmovdpos	%icc,	%f4,	%f20
	fmovs	%f4,	%f13
	wr	%g0,	0x81,	%asi
	ldstuba	[%l7 + 0x4A] %asi,	%g1
	edge8n	%g3,	%l3,	%o1
	ldd	[%l7 + 0x68],	%f14
	edge16l	%l1,	%g2,	%i4
	fmovrdgz	%i0,	%f4,	%f14
	fbo,a	%fcc3,	loop_2920
	orn	%i5,	%l0,	%g5
	movpos	%xcc,	%o5,	%o4
	tge	%icc,	0x3
loop_2920:
	fbule	%fcc1,	loop_2921
	bshuffle	%f16,	%f10,	%f4
	brnz	%i3,	loop_2922
	movrlez	%l4,	%o0,	%l2
loop_2921:
	array32	%i2,	%i7,	%i6
	umul	%g7,	%l5,	%g4
loop_2922:
	sethi	0x12DE,	%o7
	sll	%o6,	%i1,	%g6
	fmovrse	%o2,	%f17,	%f14
	add	%o3,	%l6,	%g1
	fble	%fcc1,	loop_2923
	fnot2	%f4,	%f20
	fbg	%fcc0,	loop_2924
	array16	%g3,	%o1,	%l1
loop_2923:
	fmovd	%f24,	%f24
	fmovdleu	%xcc,	%f28,	%f11
loop_2924:
	ldub	[%l7 + 0x1B],	%l3
	bneg	%xcc,	loop_2925
	smul	%g2,	0x12B6,	%i0
	xorcc	%i4,	%i5,	%l0
	movre	%g5,	%o5,	%i3
loop_2925:
	lduh	[%l7 + 0x56],	%o4
	tg	%icc,	0x1
	fmovsleu	%icc,	%f8,	%f8
	add	%o0,	%l2,	%l4
	or	%i2,	0x0FF9,	%i7
	te	%icc,	0x0
	te	%icc,	0x3
	wr	%g0,	0x80,	%asi
	prefetcha	[%l7 + 0x70] %asi,	 0x2
	srax	%l5,	%i6,	%o7
	wr	%g0,	0x2f,	%asi
	ldda	[%l7 + 0x70] %asi,	%o6
	sll	%i1,	0x15,	%g4
	tcs	%icc,	0x5
	fornot2s	%f8,	%f0,	%f27
	andcc	%o2,	0x15EB,	%g6
	ldd	[%l7 + 0x70],	%f14
	fcmpes	%fcc3,	%f28,	%f23
	movrlz	%l6,	%o3,	%g1
	edge32	%o1,	%l1,	%l3
	xorcc	%g3,	%i0,	%g2
	stbar
	edge8n	%i5,	%l0,	%g5
	stw	%i4,	[%l7 + 0x30]
	bn,pn	%xcc,	loop_2926
	fmovsleu	%icc,	%f12,	%f21
	fmovsa	%xcc,	%f24,	%f1
	orcc	%o5,	0x1311,	%o4
loop_2926:
	fcmpne16	%f18,	%f6,	%o0
	nop
	setx	loop_2927,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	tle	%xcc,	0x1
	fpadd16s	%f8,	%f23,	%f31
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2927:
	edge8l	%i3,	%l4,	%l2
	fpadd16s	%f30,	%f6,	%f14
	fnegs	%f15,	%f9
	ble,a,pt	%icc,	loop_2928
	edge8n	%i2,	%i7,	%l5
	wr	%g0,	0x18,	%asi
	ldsha	[%l7 + 0x28] %asi,	%i6
loop_2928:
	fsrc1	%f14,	%f2
	xorcc	%o7,	0x0EC5,	%o6
	bg,a,pn	%xcc,	loop_2929
	fbo	%fcc2,	loop_2930
	andn	%g7,	0x1F5E,	%g4
	fornot2	%f12,	%f26,	%f0
loop_2929:
	xnor	%i1,	0x1B8D,	%g6
loop_2930:
	udivcc	%l6,	0x1AB1,	%o2
	edge32ln	%g1,	%o3,	%l1
	ldstub	[%l7 + 0x70],	%l3
	edge8l	%o1,	%i0,	%g3
	movne	%xcc,	%g2,	%i5
	subc	%l0,	%g5,	%i4
	subccc	%o4,	%o0,	%o5
	fexpand	%f27,	%f0
	fsrc1	%f0,	%f28
	smul	%i3,	0x1778,	%l4
	or	%i2,	0x192A,	%l2
	movleu	%xcc,	%i7,	%i6
	and	%l5,	%o6,	%o7
	tgu	%xcc,	0x2
	smul	%g4,	0x1D2B,	%i1
	fmovsge	%icc,	%f8,	%f2
	fmuld8ulx16	%f21,	%f24,	%f16
	movge	%icc,	%g7,	%l6
	brlez,a	%g6,	loop_2931
	tpos	%icc,	0x4
	mulx	%o2,	%o3,	%l1
	move	%icc,	%g1,	%l3
loop_2931:
	subccc	%i0,	%o1,	%g3
	movcc	%icc,	%i5,	%l0
	tneg	%icc,	0x6
	edge8	%g2,	%i4,	%g5
	edge16	%o4,	%o5,	%i3
	fcmpeq16	%f30,	%f14,	%l4
	orncc	%o0,	%i2,	%l2
	movre	%i6,	%i7,	%l5
	edge32n	%o6,	%o7,	%g4
	movrne	%i1,	0x064,	%g7
	movrlz	%g6,	%l6,	%o2
	ldd	[%l7 + 0x48],	%f6
	tleu	%xcc,	0x7
	xorcc	%l1,	0x1A2E,	%o3
	wr	%g0,	0x19,	%asi
	sta	%f15,	[%l7 + 0x4C] %asi
	subcc	%l3,	%g1,	%i0
	ba,pn	%xcc,	loop_2932
	fcmpeq32	%f12,	%f2,	%o1
	mulx	%i5,	%g3,	%g2
	array8	%l0,	%i4,	%o4
loop_2932:
	movleu	%icc,	%o5,	%g5
	set	0x40, %o7
	ldda	[%l7 + %o7] 0x0c,	%f16
	fone	%f6
	bcs,a	%icc,	loop_2933
	edge16	%i3,	%l4,	%o0
	smulcc	%l2,	%i6,	%i2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2933:
	movgu	%xcc,	%l5,	%o6
	udivcc	%i7,	0x1489,	%o7
	stbar
	edge8ln	%i1,	%g4,	%g7
	swap	[%l7 + 0x6C],	%l6
	fornot1s	%f7,	%f4,	%f6
	nop
	setx loop_2934, %l0, %l1
	jmpl %l1, %o2
	edge8l	%g6,	%l1,	%l3
	sir	0x1C20
	fmovsge	%icc,	%f31,	%f29
loop_2934:
	subcc	%o3,	0x1E67,	%g1
	movrlez	%i0,	0x2D0,	%o1
	umul	%i5,	%g3,	%l0
	andncc	%i4,	%o4,	%o5
	st	%f14,	[%l7 + 0x18]
	fmovrdgez	%g5,	%f20,	%f2
	brlz	%i3,	loop_2935
	srax	%g2,	0x17,	%o0
	tg	%xcc,	0x5
	or	%l2,	%i6,	%i2
loop_2935:
	brnz,a	%l4,	loop_2936
	fcmpne32	%f4,	%f8,	%l5
	movvs	%icc,	%o6,	%i7
	edge8ln	%o7,	%i1,	%g7
loop_2936:
	smulcc	%g4,	0x1AC4,	%o2
	movleu	%xcc,	%l6,	%g6
	wr	%g0,	0x80,	%asi
	lduha	[%l7 + 0x58] %asi,	%l3
	edge32n	%l1,	%g1,	%o3
	andcc	%o1,	0x0264,	%i0
	brgz	%g3,	loop_2937
	fcmpeq32	%f30,	%f16,	%i5
	tleu	%icc,	0x0
	udiv	%i4,	0x0C54,	%o4
loop_2937:
	ta	%icc,	0x4
	sdivcc	%o5,	0x0B22,	%g5
	fbg,a	%fcc0,	loop_2938
	fexpand	%f28,	%f12
	fmovdgu	%xcc,	%f6,	%f9
	umulcc	%l0,	0x1D64,	%i3
loop_2938:
	subc	%g2,	0x0F1E,	%o0
	array32	%i6,	%l2,	%l4
	movge	%icc,	%i2,	%l5
	te	%icc,	0x5
	bneg,a,pt	%xcc,	loop_2939
	tle	%icc,	0x6
	xorcc	%i7,	0x02BA,	%o7
	fxnors	%f19,	%f4,	%f4
loop_2939:
	fpmerge	%f23,	%f24,	%f22
	or	%o6,	0x189A,	%i1
	mulx	%g4,	0x196D,	%o2
	fmovrdgz	%l6,	%f18,	%f30
	edge16n	%g6,	%l3,	%g7
	brgz,a	%l1,	loop_2940
	smulcc	%o3,	%o1,	%g1
	fornot2s	%f19,	%f4,	%f25
	movg	%icc,	%g3,	%i0
loop_2940:
	orn	%i4,	%o4,	%i5
	popc	%o5,	%l0
	fandnot2	%f12,	%f6,	%f4
	sethi	0x1A5D,	%i3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tcs	%icc,	0x3
	movrne	%g2,	%o0,	%g5
	bcs,pn	%xcc,	loop_2941
	srlx	%l2,	%l4,	%i2
	taddcc	%i6,	%l5,	%i7
	fpsub32s	%f6,	%f10,	%f27
loop_2941:
	movvc	%icc,	%o6,	%o7
	nop
	setx	loop_2942,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fmovdcs	%xcc,	%f18,	%f1
	fmovrsgz	%i1,	%f8,	%f14
	fmovrdne	%g4,	%f2,	%f28
loop_2942:
	tvc	%xcc,	0x6
	wr	%g0,	0x81,	%asi
	stwa	%o2,	[%l7 + 0x10] %asi
	edge16n	%g6,	%l3,	%g7
	popc	%l6,	%o3
	movvs	%xcc,	%o1,	%g1
	andncc	%g3,	%i0,	%i4
	ba,a	%icc,	loop_2943
	mova	%xcc,	%o4,	%i5
	edge16	%o5,	%l1,	%l0
	movrlez	%g2,	%o0,	%i3
loop_2943:
	lduw	[%l7 + 0x08],	%g5
	and	%l2,	%i2,	%i6
	te	%icc,	0x3
	movn	%xcc,	%l5,	%i7
	array16	%o6,	%l4,	%o7
	wr	%g0,	0x80,	%asi
	stha	%i1,	[%l7 + 0x0E] %asi
	movcs	%icc,	%o2,	%g4
	smul	%g6,	0x13D0,	%g7
	fmovrslez	%l3,	%f5,	%f24
	udivcc	%l6,	0x072B,	%o3
	orncc	%g1,	%o1,	%g3
	move	%icc,	%i4,	%o4
	tleu	%icc,	0x2
	edge8	%i5,	%o5,	%i0
	movrgz	%l1,	%g2,	%l0
	mulx	%o0,	0x0B24,	%g5
	xnor	%i3,	0x1E06,	%i2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sir	0x1394
	fbuge,a	%fcc3,	loop_2944
	taddcctv	%i6,	%l5,	%l2
	tsubcc	%o6,	0x07B0,	%i7
	fcmps	%fcc2,	%f23,	%f2
loop_2944:
	brgez	%l4,	loop_2945
	sir	0x0654
	orn	%i1,	0x050E,	%o7
	fmul8ulx16	%f6,	%f4,	%f12
loop_2945:
	bne,a,pt	%xcc,	loop_2946
	xnorcc	%o2,	%g4,	%g7
	tg	%xcc,	0x1
	edge32l	%l3,	%l6,	%o3
loop_2946:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movvc	%xcc,	%g1,	%o1
	fmovda	%xcc,	%f2,	%f9
	tcs	%icc,	0x7
	subc	%g3,	%g6,	%i4
	fsrc1	%f20,	%f20
	ldx	[%l7 + 0x50],	%i5
	prefetch	[%l7 + 0x48],	 0x0
	fnot1s	%f0,	%f0
	movrne	%o5,	0x39D,	%o4
	tvs	%xcc,	0x1
	fbge	%fcc0,	loop_2947
	movg	%icc,	%l1,	%i0
	edge8ln	%g2,	%l0,	%o0
	bvc,a,pt	%icc,	loop_2948
loop_2947:
	movne	%icc,	%i3,	%g5
	tvs	%xcc,	0x6
	stw	%i6,	[%l7 + 0x54]
loop_2948:
	udivx	%i2,	0x15F3,	%l5
	set	0x40, %i2
	ldda	[%l7 + %i2] 0x89,	%f16
	fbug,a	%fcc3,	loop_2949
	movgu	%xcc,	%o6,	%i7
	wr	%g0,	0x0c,	%asi
	lduwa	[%l7 + 0x68] %asi,	%l2
loop_2949:
	fmul8ulx16	%f10,	%f30,	%f12
	edge8n	%l4,	%o7,	%i1
	nop
	set	0x48, %i7
	ldd	[%l7 + %i7],	%f24
	fnot2s	%f2,	%f7
	subcc	%o2,	0x00A0,	%g7
	bpos,a	%xcc,	loop_2950
	umul	%g4,	%l3,	%o3
	fmovdgu	%xcc,	%f3,	%f22
	movn	%xcc,	%l6,	%o1
loop_2950:
	udivx	%g1,	0x1F73,	%g6
	fmovdgu	%icc,	%f27,	%f11
	nop
	setx loop_2951, %l0, %l1
	jmpl %l1, %i4
	xnorcc	%g3,	%o5,	%o4
	tl	%xcc,	0x5
	srlx	%i5,	0x07,	%i0
loop_2951:
	edge32	%g2,	%l1,	%l0
	fornot2	%f12,	%f14,	%f20
	fmuld8sux16	%f0,	%f17,	%f18
	wr	%g0,	0x0c,	%asi
	ldswa	[%l7 + 0x5C] %asi,	%i3
	movrlez	%o0,	%i6,	%i2
	xorcc	%g5,	0x16D8,	%l5
	brz	%o6,	loop_2952
	tle	%xcc,	0x7
	ldsh	[%l7 + 0x4C],	%l2
	movrgez	%i7,	%o7,	%l4
loop_2952:
	xor	%i1,	0x009F,	%g7
	fpsub32s	%f3,	%f18,	%f29
	movrlz	%g4,	0x25B,	%o2
	fcmpgt32	%f18,	%f4,	%l3
	fmovspos	%icc,	%f10,	%f22
	tn	%xcc,	0x4
	movge	%icc,	%l6,	%o1
	tvc	%xcc,	0x4
	fmul8x16au	%f22,	%f17,	%f12
	xnorcc	%g1,	0x052B,	%g6
	bg,pt	%icc,	loop_2953
	fnot1	%f4,	%f0
	movge	%xcc,	%i4,	%g3
	fnot2s	%f9,	%f6
loop_2953:
	fmovse	%xcc,	%f7,	%f5
	fbu,a	%fcc0,	loop_2954
	ldstub	[%l7 + 0x5E],	%o5
	ld	[%l7 + 0x34],	%f15
	bge,a	loop_2955
loop_2954:
	tl	%xcc,	0x4
	xnorcc	%o3,	0x18F0,	%o4
	tvs	%xcc,	0x5
loop_2955:
	tsubcctv	%i5,	0x0869,	%g2
	wr	%g0,	0x2b,	%asi
	stba	%i0,	[%l7 + 0x0E] %asi
	membar	#Sync
	fmul8ulx16	%f6,	%f30,	%f2
	fornot1	%f12,	%f28,	%f22
	addcc	%l1,	0x05DA,	%i3
	movcs	%icc,	%o0,	%l0
	stb	%i2,	[%l7 + 0x61]
	smulcc	%g5,	%i6,	%l5
	fornot1s	%f1,	%f25,	%f15
	mulx	%o6,	%i7,	%o7
	subcc	%l2,	0x00EE,	%i1
	fnor	%f14,	%f4,	%f0
	edge8ln	%l4,	%g7,	%o2
	bl,a	loop_2956
	xor	%g4,	0x17CD,	%l3
	fmovd	%f14,	%f24
	ldsh	[%l7 + 0x6C],	%l6
loop_2956:
	subc	%o1,	0x1758,	%g6
	subccc	%g1,	0x1C91,	%g3
	sir	0x0DED
	movpos	%icc,	%o5,	%i4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16l	%o4,	%i5,	%o3
	brgez,a	%i0,	loop_2957
	fmuld8ulx16	%f30,	%f31,	%f10
	sra	%g2,	0x15,	%l1
	fornot2	%f26,	%f0,	%f2
loop_2957:
	fmovsvc	%icc,	%f8,	%f24
	stbar
	tneg	%icc,	0x5
	fmovdvc	%xcc,	%f25,	%f22
	fbu,a	%fcc3,	loop_2958
	bleu,pn	%xcc,	loop_2959
	fmovsge	%xcc,	%f17,	%f9
	ta	%xcc,	0x6
loop_2958:
	addcc	%o0,	0x10ED,	%l0
loop_2959:
	fbl	%fcc2,	loop_2960
	std	%i2,	[%l7 + 0x38]
	fmovrdlz	%i2,	%f22,	%f14
	fzero	%f8
loop_2960:
	nop
	add	%l7,	0x20,	%l6
	wr	%g0,	0x18,	%asi
	casxa	[%l6] 0x18,	%i6,	%l5
	edge32l	%g5,	%o6,	%i7
	edge16n	%l2,	%i1,	%l4
	ta	%icc,	0x5
	fmovdpos	%xcc,	%f27,	%f25
	fzero	%f24
	tn	%icc,	0x6
	movrne	%o7,	0x04F,	%g7
	taddcc	%g4,	%o2,	%l6
	andncc	%l3,	%o1,	%g6
	fandnot2s	%f25,	%f31,	%f16
	brnz	%g1,	loop_2961
	bge	loop_2962
	fands	%f14,	%f20,	%f31
	mulx	%o5,	0x142A,	%g3
loop_2961:
	nop
	wr	%g0,	0x89,	%asi
	stda	%i4,	[%l7 + 0x10] %asi
loop_2962:
	bpos,a	loop_2963
	fsrc2	%f18,	%f18
	array8	%i5,	%o3,	%i0
	movl	%xcc,	%g2,	%o4
loop_2963:
	std	%f0,	[%l7 + 0x10]
	edge16ln	%o0,	%l1,	%i3
	fble,a	%fcc3,	loop_2964
	fcmpes	%fcc2,	%f19,	%f11
	sdiv	%i2,	0x0944,	%l0
	andn	%l5,	0x16AF,	%i6
loop_2964:
	udivx	%g5,	0x1851,	%i7
	ldd	[%l7 + 0x50],	%f10
	sdivcc	%l2,	0x1F95,	%i1
	fbule,a	%fcc2,	loop_2965
	edge32n	%l4,	%o7,	%o6
	membar	0x10
	umulcc	%g4,	0x0325,	%o2
loop_2965:
	brz	%g7,	loop_2966
	fpsub16	%f18,	%f18,	%f14
	brlez,a	%l6,	loop_2967
	movrgz	%o1,	%l3,	%g1
loop_2966:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrlez	%o5,	%g3,	%g6
loop_2967:
	smulcc	%i4,	%i5,	%o3
	tvs	%icc,	0x5
	sll	%i0,	%g2,	%o0
	swap	[%l7 + 0x34],	%o4
	umul	%l1,	0x117E,	%i3
	mulx	%l0,	%l5,	%i2
	movleu	%xcc,	%g5,	%i6
	edge16	%i7,	%i1,	%l2
	movrgz	%l4,	0x2CB,	%o6
	fpadd16	%f0,	%f30,	%f14
	movcs	%icc,	%g4,	%o2
	fbug	%fcc2,	loop_2968
	udivcc	%g7,	0x03D6,	%o7
	addcc	%l6,	%o1,	%g1
	wr	%g0,	0xf9,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
loop_2968:
	xor	%l3,	0x0970,	%o5
	movpos	%icc,	%g3,	%i4
	edge32	%g6,	%o3,	%i0
	add	%l7,	0x50,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%i5,	%g2
	fmovdvs	%xcc,	%f1,	%f10
	set	0x40, %o4
	ldda	[%l7 + %o4] 0x80,	%f16
	sll	%o0,	0x0C,	%o4
	set	0x0C, %o2
	lduwa	[%l7 + %o2] 0x18,	%l1
	subcc	%l0,	%l5,	%i3
	bpos,a	loop_2969
	fxnors	%f12,	%f9,	%f25
	swap	[%l7 + 0x78],	%i2
	fcmps	%fcc2,	%f1,	%f1
loop_2969:
	xorcc	%g5,	%i6,	%i1
	tle	%xcc,	0x3
	edge32l	%i7,	%l2,	%o6
	ldsh	[%l7 + 0x2A],	%g4
	fmovrde	%o2,	%f4,	%f20
	fnot2	%f18,	%f20
	edge32n	%l4,	%g7,	%l6
	orn	%o1,	%o7,	%g1
	fmovrsne	%o5,	%f5,	%f1
	edge8l	%g3,	%l3,	%g6
	srl	%o3,	%i0,	%i4
	stw	%i5,	[%l7 + 0x24]
	fnot2s	%f30,	%f11
	fmovsn	%icc,	%f5,	%f19
	edge32l	%o0,	%g2,	%o4
	sdivcc	%l1,	0x1AD7,	%l5
	fcmped	%fcc3,	%f26,	%f6
	taddcctv	%i3,	%l0,	%i2
	fmuld8ulx16	%f16,	%f23,	%f30
	xorcc	%g5,	0x12B7,	%i6
	membar	0x04
	siam	0x7
	fors	%f2,	%f11,	%f9
	wr	%g0,	0x89,	%asi
	lduwa	[%l7 + 0x20] %asi,	%i7
	movvc	%xcc,	%i1,	%o6
	nop
	setx	loop_2970,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fmovdl	%xcc,	%f2,	%f19
	brz,a	%g4,	loop_2971
	for	%f6,	%f4,	%f18
loop_2970:
	sth	%o2,	[%l7 + 0x0A]
	fmovrsne	%l2,	%f24,	%f28
loop_2971:
	fmovscc	%xcc,	%f0,	%f9
	udiv	%g7,	0x12ED,	%l6
	movn	%icc,	%o1,	%o7
	edge32l	%g1,	%o5,	%g3
	fmovrsgz	%l4,	%f17,	%f12
	fpack32	%f24,	%f16,	%f10
	brlz,a	%l3,	loop_2972
	or	%o3,	0x0047,	%g6
	fcmpeq32	%f26,	%f12,	%i0
	fmovdleu	%xcc,	%f23,	%f11
loop_2972:
	ta	%xcc,	0x3
	set	0x58, %g2
	lda	[%l7 + %g2] 0x15,	%f3
	tsubcc	%i5,	%i4,	%g2
	fmovdne	%xcc,	%f24,	%f16
	fmovdge	%xcc,	%f29,	%f30
	stbar
	sll	%o4,	0x07,	%o0
	fbg	%fcc3,	loop_2973
	fbge,a	%fcc0,	loop_2974
	fbne,a	%fcc3,	loop_2975
	bneg,a,pt	%icc,	loop_2976
loop_2973:
	udivcc	%l5,	0x1D89,	%l1
loop_2974:
	edge16l	%l0,	%i3,	%i2
loop_2975:
	edge32	%g5,	%i7,	%i6
loop_2976:
	nop
	nop 	! 	nop 	! 	wr	%g0,	0x40,	%asi ripped by fixASI40.pl ripped by fixASI40.pl
	nop 	! 	nop 	! 	stxa	%i1,	[%g0 + 0x1d0] %asi ripped by fixASI40.pl ripped by fixASI40.pl
	fmul8sux16	%f10,	%f12,	%f2
	and	%g4,	0x0019,	%o2
	movrlz	%o6,	0x3BC,	%l2
	orcc	%g7,	0x1538,	%o1
	edge8l	%l6,	%o7,	%o5
	edge32l	%g1,	%g3,	%l4
	fpadd32s	%f16,	%f18,	%f13
	subcc	%l3,	%o3,	%i0
	fandnot2s	%f12,	%f6,	%f0
	tle	%xcc,	0x5
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 0:
!
!	Type l   	: 2876
!	Type x   	: 1364
!	Type cti   	: 2976
!	Type f   	: 4430
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
.word 0xA23A9739
.word 0xC9349285
.word 0x5C7E0BF4
.word 0x9EAFCDAC
.word 0x997CCD76
.word 0xC1BE5D6C
.word 0x5C96A458
.word 0xDCD05770
.word 0xF1055208
.word 0xB34468C8
.word 0xB58D60FB
.word 0x7B8ED7C9
.word 0xF5007B55
.word 0xBF9A67B0
.word 0xCFB9EEFA
.word 0x7280185B
.word 0x86F0A806
.word 0x540FAD5E
.word 0xED671374
.word 0x63DFF881
.word 0xDB417FE3
.word 0xFB9EE289
.word 0xBE8BB154
.word 0xEB7A4C99
.word 0x11E1294D
.word 0x9E3E5DE4
.word 0x1BAB3BEF
.word 0x617B6392
.word 0x4888548E
.word 0x5F3F4EA0
.word 0xAABA439F
.word 0x12E854EA
.word 0x2C3690A3
.word 0x623CD985
.word 0xD801AAD9
.word 0x9FF6D42F
.word 0x25C9F4EF
.word 0x30099D67
.word 0x4C2891C0
.word 0xB380EB56
.word 0x8ECC35DD
.word 0x6D01EC70
.word 0x09711C89
.word 0x804BC5FA
.word 0xC074E041
.word 0xF60B9C7B
.word 0xB266DA29
.word 0x19E01A90
.word 0xAAF313B7
.word 0x294671C7
.word 0x70322679
.word 0xB00D0706
.word 0x27ECC19E
.word 0x39AFBF49
.word 0x29A1CF9D
.word 0x201E0997
.word 0xA3247FF6
.word 0x89F063CF
.word 0x9ADB653A
.word 0x058B9988
.word 0x89646CB3
.word 0x802D6682
.word 0xA517BAE6
.word 0x1F2898A1
.end
