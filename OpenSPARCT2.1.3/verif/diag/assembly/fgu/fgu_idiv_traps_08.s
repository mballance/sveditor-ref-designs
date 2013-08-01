/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: fgu_idiv_traps_08.s
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
.ident "FOCUSCASE: focus.pm,v 1.1 2003/04/23 17:53:39 somePerson Exp somePerson $ spc_basic_isa3.pl FOCUS_SEED=32758172"
.ident "Thu Dec 11 11:47:50 CST 2003"
.ident "Using Instruction Hash for Focus :$Id: fgu_idiv_traps_08.s,v 1.4 2007/07/27 21:45:31 drp Exp $"
#include "defines.h"
#include "nmacros.h"
#include "old_boot.s"

/************************************************************************
   Test case code start
 ************************************************************************/

.text
.global main

main:		/* test begin */

	! Get TID/DIAG DATA AREA. Separate memory for each thread.
	ta	T_RD_THID
	mov	%o1, %l6
	umul	%l6, 256, %l7
	setx	DIAG_DATA_AREA, %g1, %g3
	add	%l7, %g3, %l7

	cmp %l6, 0x0
	be main_t0
	nop
	cmp %l6, 0x1
	be main_t1
	nop
	cmp %l6, 0x2
	be main_t2
	nop
	cmp %l6, 0x3
	be main_t3
	nop
	cmp %l6, 0x4
	be main_t4
	nop
	cmp %l6, 0x5
	be main_t5
	nop
	cmp %l6, 0x6
	be main_t6
	nop
	cmp %l6, 0x7
	be main_t7
	nop
	EXIT_GOOD
!
! Thread 0 Start
!
main_t0:
	mov 	%l7, 	%g1
	!# Set %cwp for 8 windows
	!# This threads memory space into each %l7
	wrpr 	%g0, 	0x7, 	%cwp
	mov 	%g1, 	%l7
	wrpr 	%g0, 	0x6, 	%cwp
	mov 	%g1, 	%l7
	wrpr 	%g0, 	0x5, 	%cwp
	mov 	%g1, 	%l7
	wrpr 	%g0, 	0x4, 	%cwp
	mov 	%g1, 	%l7
	wrpr 	%g0, 	0x3, 	%cwp
	mov 	%g1, 	%l7
	wrpr 	%g0, 	0x2, 	%cwp
	mov 	%g1, 	%l7
	wrpr 	%g0, 	0x1, 	%cwp
	mov 	%g1, 	%l7
	wrpr 	%g0, 	0x0, 	%cwp
	mov 	%g1, 	%l7

	!# Set %fsr
	setx 	0x0000000000000000,	%l0,	%l6	!# no post process
	stx 	%l6, 	[%l7 + 0x0]	!# no post process
	ldx 	[%l7 + 0x0], 	%fsr	!# no post process

	!# Initialize registers ..

	!# Global registers
	set	0xF,	%g1
	set	0x0,	%g2
	set	0xB,	%g3
	set	0xD,	%g4
	set	0xA,	%g5
	set	0xD,	%g6
	set	0x6,	%g7
	!# Input registers
	set	-0x9,	%i0
	set	-0x9,	%i1
	set	-0x6,	%i2
	set	-0x3,	%i3
	set	-0x2,	%i4
	set	-0x4,	%i5
	set	-0xC,	%i6
	set	-0xB,	%i7
	!# Local registers
	set	0x16F3183B,	%l0
	set	0x52FAB651,	%l1
	set	0x5D65BCFE,	%l2
	set	0x16A61A66,	%l3
	set	0x050D8847,	%l4
	set	0x47E6E1DA,	%l5
	set	0x0D2F41C4,	%l6
	!# Output registers
	set	0x0E00,	%o0
	set	0x1EE0,	%o1
	set	-0x1F24,	%o2
	set	-0x0870,	%o3
	set	0x10BF,	%o4
	set	0x1020,	%o5
	set	0x16CB,	%o6
	set	0x1B9A,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0xF9E0BBFB632344C2)
	INIT_TH_FP_REG(%l7,%f2,0x53C87029AA2FE833)
	INIT_TH_FP_REG(%l7,%f4,0xDE952A53A3AD06F4)
	INIT_TH_FP_REG(%l7,%f6,0x4829F0FA358AAB1A)
	INIT_TH_FP_REG(%l7,%f8,0x3E56A552936BFBAC)
	INIT_TH_FP_REG(%l7,%f10,0x5FEC588976E3FF0F)
	INIT_TH_FP_REG(%l7,%f12,0x59960BCB796288EC)
	INIT_TH_FP_REG(%l7,%f14,0x02BB7E99E16D67F4)
	INIT_TH_FP_REG(%l7,%f16,0x2B88127A028E0C9D)
	INIT_TH_FP_REG(%l7,%f18,0x1F7BC94AED1048E0)
	INIT_TH_FP_REG(%l7,%f20,0x6AAEFD748E8AA9B7)
	INIT_TH_FP_REG(%l7,%f22,0x42D30B68F5F003E5)
	INIT_TH_FP_REG(%l7,%f24,0x1FD9A46546DB3789)
	INIT_TH_FP_REG(%l7,%f26,0x74E49AFE0AE9E70A)
	INIT_TH_FP_REG(%l7,%f28,0x9610A29EE8E2CA43)
	INIT_TH_FP_REG(%l7,%f30,0x0E709079768FBC1E)

	!# Execute Main Diag ..

	call	loop_1
	call	loop_2
	fcmple32	%f8,	%f22,	%o7
	fmovsg	%fcc3,	%f0,	%f19
loop_1:
	fmovdule	%fcc2,	%f24,	%f24
loop_2:
	call	loop_3
	call	loop_4
	call	loop_5
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
loop_3:
	fmovrsgez	%o4,	%f23,	%f21
loop_4:
	bgu,pt	%icc,	loop_6
loop_5:
	fble,pn	%fcc3,	loop_7
	fcmpes	%fcc0,	%f19,	%f27
	call	loop_8
loop_6:
	bneg,a,pt	%xcc,	loop_9
loop_7:
	fpsub16s	%f24,	%f25,	%f26
	edge32l	%g7,	%g1,	%o2
loop_8:
	call	loop_10
loop_9:
	fcmple32	%f6,	%f6,	%i4
	fmovdneg	%icc,	%f26,	%f16
	fandnot1s	%f25,	%f19,	%f10
loop_10:
	call	loop_11
	sll	%i5,	%l3,	%o5
	edge8	%l5,	%g3,	%i0
	andcc	%o1,	%g4,	%l0
loop_11:
	fbule,a,pt	%fcc1,	loop_12
	movgu	%xcc,	0x680,	%o3
	call	loop_13
	fmovsue	%fcc3,	%f7,	%f0
loop_12:
	sdivx	%l4,	%o0,	%i1
	rdpr	%tl,	%l2
loop_13:
	call	loop_14
	call	loop_15
	edge8n	%g5,	%g6,	%i3
	fmovduge	%fcc2,	%f6,	%f4
loop_14:
	wr 	%g0, 	0x7, 	%fprs
loop_15:
	addc	%o6,	0x1652,	%l6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	orncc	%l1,	0x1751,	%i7
	bn,pn	%xcc,	loop_16
	wrpr 	%g0, 	0x3, 	%gl
	fmovsul	%fcc3,	%f17,	%f2
	umul	%o4,	0x1AF9,	%g7
loop_16:
	fand	%f14,	%f10,	%f22
	call	loop_17
	membar	0x35
	call	loop_18
	nop
	setx	0x816021B7B212D620,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0x20A35075935712A3,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	fdivd	%f2,	%f24,	%f26
loop_17:
	fmovdvs	%icc,	%f2,	%f30
	fxnor	%f20,	%f14,	%f26
loop_18:
	rd	%pc,	%i2
	fnor	%f0,	%f10,	%f8
	call	loop_19
	call	loop_20
	call	loop_21
	xnorcc	%g1,	%i4,	%i5
loop_19:
	wrpr 	%g0, 	0x0, 	%gl
loop_20:
	fnegs	%f12,	%f11
loop_21:
	sdivcc	%l3,	%l5,	%o5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	prefetch	[%l7 + 0x1C],	 0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fmovrse	%g4,	%f15,	%f4
	call	loop_22
	bshuffle	%f6,	%f18,	%f20
	call	loop_23
	fmovrdne	%o3,	%f16,	%f16
loop_22:
	bge	%icc,	loop_24
	fmovdpos	%xcc,	%f0,	%f26
loop_23:
	call	loop_25
	movug	%fcc2,	0x777,	%l0
loop_24:
	edge32	%l4,	%o0,	%l2
	nop
	fitos	%f2,	%f3
	fstox	%f3,	%f8
	fxtos	%f8,	%f13
loop_25:
	call	loop_26
	call	loop_27
	nop
	set	0x78, %l3
	swap	[%l7 + %l3],	%i1
	call	loop_28
loop_26:
	call	loop_29
loop_27:
	call	loop_30
	wrpr	%g5,	0x1B7A,	%tick
loop_28:
	array16	%g6,	%i3,	%g2
loop_29:
	fsrc1s	%f29,	%f21
loop_30:
	fabsd	%f28,	%f30
	rdhpr	%hpstate,	%o6
	nop
	setx	0x92ADFD41,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f1
	setx	0x092E673A,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f26
	fadds	%f26,	%f1,	%f21
	edge8n	%i6,	%l1,	%l6
	call	loop_31
	fmul8ulx16	%f14,	%f26,	%f20
	fmovsge	%icc,	%f2,	%f20
	movre	%i7,	0x138,	%o7
loop_31:
	sll	%o4,	0x05,	%g7
	nop
	setx	0x318576E3,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f27
	setx	0x0FD56699,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f31
	fmuls	%f31,	%f27,	%f24
	array8	%i2,	%i4,	%g1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	call	loop_32
	fmovsgu	%xcc,	%f13,	%f30
	nop
	fitod	%f10,	%f8
	fdtox	%f8,	%f22
	edge32l	%l5,	%l3,	%o5
loop_32:
	fmovdule	%fcc3,	%f4,	%f24
	fmovscc	%xcc,	%f2,	%f14
	call	loop_33
	array32	%g3,	%i0,	%g4
	tneg	%xcc,	0x0
	fmovslg	%fcc3,	%f20,	%f5
loop_33:
	movule	%fcc2,	%o3,	%o1
	nop
	fitos	%f10,	%f20
	call	loop_34
	fmul8x16al	%f4,	%f14,	%f8
	fpack32	%f22,	%f14,	%f6
	fmovde	%icc,	%f0,	%f20
loop_34:
	call	loop_35
	fbge,a,pn	%fcc1,	loop_36
	sdiv	%l0,	0x00,	%l4
	call	loop_37
loop_35:
	fmovsue	%fcc2,	%f2,	%f16
loop_36:
	nop
	setx	0xEB81272EB97AB37D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0xBA1811D0214F8C42,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	fdivd	%f6,	%f0,	%f16
	fmovdleu	%icc,	%f12,	%f10
loop_37:
	fpmerge	%f24,	%f13,	%f24
	mulscc	%l2,	0x1646,	%o0
	sll	%g5,	%g6,	%i3
	sll	%i1,	0x00,	%o6
	fcmpne32	%f18,	%f22,	%i6
	te	%xcc,	0x0
	bmask	%g2,	%l1,	%i7
	fnors	%f31,	%f30,	%f12

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	array8	%o4,	%i2,	%i4
	fmovdpos	%icc,	%f8,	%f10
	call	loop_38
	rdpr	%tba,	%g7
	tleu	%icc,	0x5
	tvc	%icc,	0x6
loop_38:
	nop
	setx	0x66578179,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f30
	setx	0xFA66070F,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f4
	fadds	%f4,	%f30,	%f27
	fornot2	%f4,	%f22,	%f0
	wr	%g1,	0x0D67,	%clear_softint
	tne	%xcc,	0x2
	fmovsg	%fcc0,	%f17,	%f29
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	tvc	%xcc,	0x3
	fmovsvs	%xcc,	%f5,	%f25
	movo	%fcc2,	0x1E4,	%o2
	fsrc1	%f16,	%f30
	fmovsvc	%xcc,	%f21,	%f23
	call	loop_39
	tgu	%icc,	0x5
	fbe,pt	%fcc3,	loop_40
	bshuffle	%f18,	%f8,	%f0
loop_39:
	alignaddr	%i5,	%l3,	%l5
	call	loop_41
loop_40:
	tsubcctv	%o5,	0x0BBA,	%i0
	or	%g4,	%o3,	%o1
	fpadd32	%f12,	%f28,	%f6
loop_41:
	call	loop_42
	andcc	%g3,	0x0199,	%l4
	fone	%f2
	rdhpr	%hintp,	%l2
loop_42:
	nop
	setx	loop_43,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x024200001406,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fmovdge	%icc,	%f30,	%f14
	rdpr	%cwp,	%l0
	fmovsule	%fcc2,	%f26,	%f19
loop_43:
	fmovso	%fcc3,	%f30,	%f2
	call	loop_44
	movgu	%icc,	%g5,	%o0
	fmovsge	%fcc3,	%f3,	%f21
	sethi	0x1622,	%g6
loop_44:
	fand	%f2,	%f6,	%f0
	call	loop_45
	call	loop_46
	nop
	set	0x18, %i2
	stx	%i3,	[%l7 + %i2]
	call	loop_47
loop_45:
	edge32n	%i1,	%o6,	%i6
loop_46:
	movn	%xcc,	%l1,	%i7
	move	%xcc,	0x2E7,	%g2
loop_47:
	mulscc	%l6,	0x1755,	%o4
	fbu	%fcc0,	loop_48
	alignaddr	%i2,	%o7,	%i4
	nop
	fitod	%f8,	%f20
	fdtos	%f20,	%f17
	call	loop_49
loop_48:
	fmuld8ulx16	%f3,	%f6,	%f6
	nop
	set	0x08, %i5
	std	%f18,	[%l7 + %i5]
	call	loop_50
loop_49:
	fmovsne	%fcc0,	%f11,	%f5
	edge8n	%g7,	%o2,	%g1
	rdpr	%wstate,	%i5
loop_50:
	movu	%fcc3,	0x5EA,	%l3
	call	loop_51
	movrlez	%o5,	%i0,	%l5
	nop
	set	0x40, %i3
	ldsw	[%l7 + %i3],	%o3
	call	loop_52
loop_51:
	rdpr	%wstate,	%o1
	udivcc	%g4,	0x00,	%l4
	call	loop_53
loop_52:
	srax	%l2,	0x05,	%l0
	wrpr	%g3,	0x1D0F,	%tick
	tge	%xcc,	0x2
loop_53:
	fmovdle	%xcc,	%f20,	%f6
	call	loop_54
	tvs	%xcc,	0x4
	fmovsuge	%fcc2,	%f15,	%f13
	movlg	%fcc2,	0x74A,	%o0
loop_54:
	call	loop_55
	call	loop_56
	umul	%g5,	0x0F73,	%i3
	tvs	%xcc,	0x4
loop_55:
	tpos	%icc,	0x1
loop_56:
	movuge	%fcc0,	0x73B,	%g6
	nop
	setx	0x208FDBD9,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f25
	setx	0x8C209E8B,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f9
	fsubs	%f9,	%f25,	%f19
	call	loop_57
	fpack32	%f22,	%f16,	%f8
	nop
	set	0x75, %i6
	stb	%o6,	[%l7 + %i6]
	call	loop_58
loop_57:
	rdhpr	%htba,	%i1
	siam	0x2
	call	loop_59
loop_58:
	call	loop_60
	edge32n	%i6,	%l1,	%i7
	subcc	%l6,	0x0171,	%o4
loop_59:
	fcmpeq16	%f2,	%f18,	%g2
loop_60:
	xnorcc	%o7,	%i2,	%i4
	fmovrsne	%o2,	%f30,	%f29
	wrpr	%g7,	0x0209,	%tick
	fmovd	%f0,	%f8
	nop
	set	0x74, %o1
	ldsw	[%l7 + %o1],	%g1
	call	loop_61
	move	%fcc1,	0x11D,	%i5
	wr	%g0,	0x0c,	%asi
	lduha	[%l7 + 0x56] %asi,	%l3
loop_61:
	fnot2s	%f18,	%f15
	for	%f14,	%f26,	%f12
	bleu,pt	%icc,	loop_62
	nop
	set	0x30, %o4
	ldd	[%l7 + %o4],	%i0
	call	loop_63
	movg	%fcc2,	0x2AE,	%o5
loop_62:
	ldsh	[%l7 + 0x60],	%o3
	call	loop_64
loop_63:
	tvs	%icc,	0x5
	call	loop_65
	brlz,a	%o1,	loop_66
loop_64:
	sethi	0x06D0,	%g4
	nop
	fitos	%f7,	%f1
	fstox	%f1,	%f16
	fxtos	%f16,	%f17
loop_65:
	nop
	wr	%g0,	0x80,	%asi
	ldda	[%l7 + 0x10] %asi,	%l4
loop_66:
	ldd	[%l7 + 0x68],	%l4
	pdist	%f4,	%f28,	%f26
	fbul,pn	%fcc0,	loop_67
	edge32l	%l2,	%g3,	%l0
	nop
	setx	loop_68,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x032200001401,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	call	loop_69
loop_67:
	call	loop_70
	std	%f12,	[%l7 + 0x70]
loop_68:
	call	loop_71
loop_69:
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
loop_70:
	ld	[%l7 + 0x44],	%f16
	call	loop_72
loop_71:
	call	loop_73
	call	loop_74
	nop
	setx	0x6C4739CB763819C1,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0x4187F7220C9EAFDA,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	fmuld	%f22,	%f22,	%f8
loop_72:
	membar	0x52
loop_73:
	call	loop_75
loop_74:
	tsubcctv	%o0,	0x095F,	%i3
	wr	%g5,	%g6,	%softint
	fmovdvs	%icc,	%f18,	%f14
loop_75:
	call	loop_76
	fxnors	%f30,	%f5,	%f14
	smulcc	%o6,	0x147C,	%i6
	call	loop_77
loop_76:
	call	loop_78
	tle	%icc,	0x5
	call	loop_79
loop_77:
	fzeros	%f22
loop_78:
	fcmpeq16	%f18,	%f22,	%l1
	for	%f30,	%f22,	%f18
loop_79:
	wr	%i1,	0x137B,	%y
	fmovsleu	%xcc,	%f30,	%f11
	brz,a	%l6,	loop_80
	nop
	setx	0x337170C4,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f11
	setx	0xA67646A4,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f25
	fsubs	%f25,	%f11,	%f29
	call	loop_81
	fandnot2	%f30,	%f16,	%f12
loop_80:
	call	loop_82
	call	loop_83
loop_81:
	popc	0x0C17,	%o4
	nop
	set	0x64, %g1
	ldstub	[%l7 + %g1],	%i7
loop_82:
	call	loop_84
loop_83:
	movneg	%xcc,	%g2,	%i2
	rd	%fprs,	%o7
	pdist	%f18,	%f2,	%f16
loop_84:
	call	loop_85
	movneg	%icc,	0x214,	%o2
	move	%xcc,	%g7,	%i4
	call	loop_86
loop_85:
	call	loop_87
	fornot2	%f26,	%f18,	%f16
	rdpr	%tba,	%g1
loop_86:
	fmovda	%xcc,	%f4,	%f20
loop_87:
	call	loop_88
	fmovduge	%fcc1,	%f24,	%f18
	call	loop_89
	call	loop_90
loop_88:
	or	%i5,	0x16FE,	%l3
	nop
	setx	0xF2B5A4A495C9848B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0x0FABD70D99CE5A2E,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	fsubd	%f20,	%f28,	%f16
loop_89:
	call	loop_91
loop_90:
	addccc	%i0,	0x0F07,	%o3
	fmul8ulx16	%f10,	%f24,	%f16
	wr	%g0,	0xeb,	%asi
	stda	%o4,	[%l7 + 0x60] %asi
	membar	#Sync
loop_91:
	udivcc	%g4,	0x00,	%o1
	edge8n	%l5,	%l4,	%l2
	fxors	%f0,	%f7,	%f18
	fzero	%f26
	fpadd16s	%f22,	%f12,	%f21
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	fpsub32	%f12,	%f8,	%f20
	sub	%g3,	0x0730,	%o0
	call	loop_92
	edge16l	%l0,	%i3,	%g5
	bpos	%xcc,	loop_93
	call	loop_94
loop_92:
	edge32l	%g6,	%i6,	%l1
	rdhpr	%hsys_tick_cmpr,	%o6
loop_93:
	call	loop_95
loop_94:
	flushw
	call	loop_96
	sra	%i1,	%o4,	%l6
loop_95:
	ldx	[%l7 + 0x38],	%i7
	fabss	%f28,	%f18
loop_96:
	fpsub16	%f6,	%f12,	%f30
	fbo,a,pn	%fcc3,	loop_97
	call	loop_98
	fpack16	%f0,	%f1
	fabsd	%f6,	%f14
loop_97:
	fsrc2s	%f8,	%f9
loop_98:
	call	loop_99
	fandnot1	%f14,	%f26,	%f8
	tneg	%xcc,	0x6
	add	%g2,	%o7,	%o2
loop_99:
	call	loop_100
	udiv	%i2,	0x00,	%i4
	fxnor	%f6,	%f16,	%f30
	pdist	%f10,	%f16,	%f4
loop_100:
	subc	%g7,	%g1,	%l3
	mulx	%i5,	0x038B,	%o3
	fornot2s	%f8,	%f19,	%f12
	rdhpr	%hintp,	%i0
	tcc	%xcc,	0x2
	call	loop_101
	wr 	%g0, 	0x5, 	%fprs
	fmovsgu	%xcc,	%f30,	%f13

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x40D, 	%hsys_tick_cmpr
loop_101:
	call	loop_102
	call	loop_103
	fmovrdgez	%l5,	%f4,	%f10
	nop
	setx	0xCC9DB5AC14DFC589,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0x30D5560281E9B271,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	faddd	%f4,	%f30,	%f30
loop_102:
	fmovdvc	%icc,	%f24,	%f6
loop_103:
	fmovda	%xcc,	%f12,	%f16
	nop
	fitod	%f6,	%f12
	fdtox	%f12,	%f18
	fxtod	%f18,	%f10
	fpadd32s	%f19,	%f12,	%f30
	call	loop_104
	or	%l4,	0x130A,	%g4
	andcc	%l2,	0x04F8,	%g3
	call	loop_105
loop_104:
	call	loop_106
	rdhpr	%ver,	%o0
	movneg	%xcc,	0x1BB,	%i3
loop_105:
	rd	%pc,	%l0
loop_106:
	tleu	%xcc,	0x1
	orcc	%g5,	0x11B9,	%g6
	set	0x20, %o3
	stxa	%l1,	[%l7 + %o3] 0xea
	membar	#Sync
	fcmpne16	%f26,	%f8,	%o6
	add	%l7,	0x24,	%l6
	wr	%g0,	0x10,	%asi
	lda	[%l6] %asi,	%i6
	casa	[%l6] %asi,	%i6,	%i1
	wr	%g0,	0xea,	%asi
	stwa	%o4,	[%l7 + 0x48] %asi
	membar	#Sync
	fmovs	%f6,	%f31
	wrpr	%i7,	0x0E83,	%pil
	fnor	%f18,	%f22,	%f30
	call	loop_107
	array8	%g2,	%l6,	%o2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x9D2, 	%hsys_tick_cmpr
	movge	%icc,	0x3FA,	%i4
loop_107:
	tge	%icc,	0x5
	fmovde	%fcc1,	%f4,	%f4
	call	loop_108
	call	loop_109
	fnegs	%f24,	%f22
	call	loop_110
loop_108:
	call	loop_111
loop_109:
	fandnot2	%f6,	%f20,	%f6
	orncc	%g7,	%g1,	%l3
loop_110:
	call	loop_112
loop_111:
	umul	%i5,	%o7,	%i0
	fcmple32	%f26,	%f0,	%o5
	call	loop_113
loop_112:
	call	loop_114
	fbl,a,pt	%fcc0,	loop_115
	call	loop_116
loop_113:
	tne	%icc,	0x4
loop_114:
	fmovdue	%fcc2,	%f28,	%f8
loop_115:
	fmovspos	%xcc,	%f30,	%f24
loop_116:
	fmovdle	%fcc0,	%f24,	%f16
	call	loop_117
	call	loop_118
	nop
	setx	0x9DAA3A1969F6CC14,	%l0,	%l6
	stx	%l6,	[%l7 + 0x78]
	ldx	[%l7 + 0x78],	%fsr
	call	loop_119
loop_117:
	call	loop_120
loop_118:
	call	loop_121
	fmovrse	%o1,	%f30,	%f3
loop_119:
	movcs	%icc,	0x4E0,	%l5
loop_120:
	call	loop_122
loop_121:
	fnot2s	%f10,	%f28
	fmovdg	%xcc,	%f16,	%f12
	fmovrse	%l4,	%f5,	%f20
loop_122:
	bpos,pt	%xcc,	loop_123
	rd	%tick_cmpr,	%o3
	call	loop_124
	call	loop_125
loop_123:
	edge32n	%g4,	%l2,	%g3
	addcc	%i3,	%o0,	%l0
loop_124:
	call	loop_126
loop_125:
	call	loop_127
	fpsub32s	%f9,	%f27,	%f20
	or	%g5,	0x029D,	%l1
loop_126:
	fmovda	%icc,	%f0,	%f16
loop_127:
	call	loop_128
	call	loop_129
	fmovdule	%fcc0,	%f30,	%f4
	ld	[%l7 + 0x58],	%f22
loop_128:
	call	loop_130
loop_129:
	fmovdvc	%icc,	%f8,	%f28
	for	%f24,	%f28,	%f20
	call	loop_131
loop_130:
	movgu	%icc,	%o6,	%i6
	ba,a	%xcc,	loop_132
	fmovsle	%icc,	%f21,	%f24
loop_131:
	edge16	%i1,	%o4,	%g6
	call	loop_133
loop_132:
	fmuld8ulx16	%f0,	%f7,	%f10
	srax	%g2,	%l6,	%o2
	fbuge,a,pn	%fcc0,	loop_134
loop_133:
	addcc	%i2,	%i4,	%i7
	call	loop_135
	fbug,pn	%fcc1,	loop_136
loop_134:
	rdhpr	%ver,	%g1
	call	loop_137
loop_135:
	movcs	%xcc,	0x758,	%l3
loop_136:
	edge16l	%i5,	%o7,	%i0
	fors	%f12,	%f15,	%f30
loop_137:
	nop
	set	0x5C, %g6
	ldswa	[%l7 + %g6] 0x81,	%o5
	movneg	%icc,	%g7,	%l5
	fpadd16s	%f19,	%f17,	%f16
	movneg	%icc,	%l4,	%o1
	movue	%fcc0,	0x15E,	%g4
	call	loop_138
	addcc	%l2,	%o3,	%i3
	fmovsul	%fcc0,	%f31,	%f0
	fmovdgu	%xcc,	%f14,	%f28
loop_138:
	nop
	fitod	%f2,	%f4
	fdtos	%f4,	%f25
	call	loop_139
	fmovdlg	%fcc2,	%f24,	%f14
	call	loop_140
	nop
	setx	0x1D1D32CB,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f30
	setx	0x69123589,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f2
	fdivs	%f2,	%f30,	%f29
loop_139:
	call	loop_141
	fmovrslez	%g3,	%f7,	%f5
loop_140:
	fmovsvs	%xcc,	%f23,	%f1
	nop
	setx	0xD5D5941F,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f24
	setx	0xE3E62A23,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f24
	fadds	%f24,	%f24,	%f9
loop_141:
	nop
	wr	%g0,	0x80,	%asi
	prefetcha	[%l7 + 0x40] %asi,	 0
	fnor	%f4,	%f26,	%f26
	bvs,a	%icc,	loop_142
	nop
	fitod	%f6,	%f12
	fdtox	%f12,	%f22
	fxtod	%f22,	%f2
	fmovsvc	%xcc,	%f22,	%f7
	call	loop_143
loop_142:
	call	loop_144
	fmovrse	%g5,	%f3,	%f19
	movvs	%xcc,	0x10A,	%l1
loop_143:
	nop
	wr	%g0,	0x80,	%asi
	stxa	%o0,	[%l7 + 0x40] %asi
loop_144:
	call	loop_145
	fbne,a	%fcc0,	loop_146
	add	%i6,	%o6,	%o4
	nop
	fitos	%f0,	%f19
	fstod	%f19,	%f6
loop_145:
	call	loop_147
loop_146:
	nop
	fitod	%f0,	%f10
	fdtos	%f10,	%f19
	call	loop_148
	tsubcc	%i1,	0x1F9C,	%g6
loop_147:
	fxors	%f15,	%f22,	%f3
	call	loop_149
loop_148:
	fand	%f22,	%f6,	%f22
	fblg,a,pn	%fcc0,	loop_150
	fbo,a	%fcc2,	loop_151
loop_149:
	call	loop_152
	fmovdn	%icc,	%f24,	%f16
loop_150:
	fxors	%f3,	%f17,	%f30
loop_151:
	movue	%fcc0,	0x48E,	%l6
loop_152:
	call	loop_153
	bmask	%g2,	%i2,	%i4
	fmovsul	%fcc0,	%f26,	%f30
	orn	%i7,	%g1,	%o2
loop_153:
	fmovrsgz	%i5,	%f26,	%f9
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 0:
!
!	Type l   	: 25
!	Type a   	: 35
!	Type x   	: 9
!	Type cti   	: 153
!	Type f   	: 152
!	Type i   	: 126
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

!
! Thread 1 Start
!
main_t1:
	mov 	%l7, 	%g1
	!# Set %cwp for 8 windows
	!# This threads memory space into each %l7
	wrpr 	%g0, 	0x7, 	%cwp
	mov 	%g1, 	%l7
	wrpr 	%g0, 	0x6, 	%cwp
	mov 	%g1, 	%l7
	wrpr 	%g0, 	0x5, 	%cwp
	mov 	%g1, 	%l7
	wrpr 	%g0, 	0x4, 	%cwp
	mov 	%g1, 	%l7
	wrpr 	%g0, 	0x3, 	%cwp
	mov 	%g1, 	%l7
	wrpr 	%g0, 	0x2, 	%cwp
	mov 	%g1, 	%l7
	wrpr 	%g0, 	0x1, 	%cwp
	mov 	%g1, 	%l7
	wrpr 	%g0, 	0x0, 	%cwp
	mov 	%g1, 	%l7

	!# Set %fsr
	setx 	0x0000000000000000,	%l0,	%l6	!# no post process
	stx 	%l6, 	[%l7 + 0x0]	!# no post process
	ldx 	[%l7 + 0x0], 	%fsr	!# no post process

	!# Initialize registers ..

	!# Global registers
	set	0x1,	%g1
	set	0x2,	%g2
	set	0x3,	%g3
	set	0xC,	%g4
	set	0x5,	%g5
	set	0xD,	%g6
	set	0x7,	%g7
	!# Input registers
	set	-0x4,	%i0
	set	-0x8,	%i1
	set	-0xB,	%i2
	set	-0x8,	%i3
	set	-0xA,	%i4
	set	-0xE,	%i5
	set	-0xE,	%i6
	set	-0xE,	%i7
	!# Local registers
	set	0x2E4C4465,	%l0
	set	0x5384EC72,	%l1
	set	0x249F5A07,	%l2
	set	0x11EA26BA,	%l3
	set	0x6121D69A,	%l4
	set	0x14D56010,	%l5
	set	0x132BDA46,	%l6
	!# Output registers
	set	-0x07A7,	%o0
	set	0x142E,	%o1
	set	0x1F4A,	%o2
	set	-0x1495,	%o3
	set	0x1BA7,	%o4
	set	0x10CC,	%o5
	set	-0x008A,	%o6
	set	-0x1598,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0xF9E0BBFB632344C2)
	INIT_TH_FP_REG(%l7,%f2,0x53C87029AA2FE833)
	INIT_TH_FP_REG(%l7,%f4,0xDE952A53A3AD06F4)
	INIT_TH_FP_REG(%l7,%f6,0x4829F0FA358AAB1A)
	INIT_TH_FP_REG(%l7,%f8,0x3E56A552936BFBAC)
	INIT_TH_FP_REG(%l7,%f10,0x5FEC588976E3FF0F)
	INIT_TH_FP_REG(%l7,%f12,0x59960BCB796288EC)
	INIT_TH_FP_REG(%l7,%f14,0x02BB7E99E16D67F4)
	INIT_TH_FP_REG(%l7,%f16,0x2B88127A028E0C9D)
	INIT_TH_FP_REG(%l7,%f18,0x1F7BC94AED1048E0)
	INIT_TH_FP_REG(%l7,%f20,0x6AAEFD748E8AA9B7)
	INIT_TH_FP_REG(%l7,%f22,0x42D30B68F5F003E5)
	INIT_TH_FP_REG(%l7,%f24,0x1FD9A46546DB3789)
	INIT_TH_FP_REG(%l7,%f26,0x74E49AFE0AE9E70A)
	INIT_TH_FP_REG(%l7,%f28,0x9610A29EE8E2CA43)
	INIT_TH_FP_REG(%l7,%f30,0x0E709079768FBC1E)

	!# Execute Main Diag ..

	call	loop_154
	ble,a,pn	%icc,	loop_155
	call	loop_156
	nop
	setx	0x58C4FB1B,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f20
	setx	0x430BCB97,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f12
	fsubs	%f12,	%f20,	%f12
loop_154:
	sir	0x02A1
loop_155:
	or	%l3,	0x1593,	%o7
loop_156:
	rd	%softint,	%i0
	rd	%fprs,	%g7
	fpsub32s	%f1,	%f5,	%f19
	movpos	%xcc,	0x13E,	%o5
	call	loop_157
	call	loop_158
	fxnor	%f26,	%f6,	%f2
	edge32l	%l5,	%o1,	%g4
loop_157:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xE2B, 	%tick_cmpr
loop_158:
	edge8n	%o3,	%i3,	%g3
	call	loop_159
	fmovslg	%fcc0,	%f19,	%f23
	fmovdge	%fcc1,	%f14,	%f4
	andn	%l4,	%g5,	%l1
loop_159:
	fpack16	%f0,	%f17
	fcmpne16	%f6,	%f10,	%l0
	fpackfix	%f2,	%f8
	call	loop_160
	call	loop_161
	fones	%f20
	fmovrslz	%o0,	%f31,	%f7
loop_160:
	fnands	%f28,	%f16,	%f29
loop_161:
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	call	loop_162
	call	loop_163
	movlg	%fcc0,	0x549,	%o6
	andncc	%o4,	%i1,	%i6
loop_162:
	call	loop_164
loop_163:
	call	loop_165
	fmovspos	%xcc,	%f12,	%f5
	movul	%fcc1,	%l6,	%g6
loop_164:
	sethi	0x0126,	%i2
loop_165:
	array16	%g2,	%i4,	%g1
	fornot2s	%f19,	%f29,	%f21
	addccc	%i7,	0x07D5,	%o2
	edge8	%l3,	%i5,	%i0
	sll	%o7,	0x08,	%g7
	nop
	setx	0x212EF6818901EACE,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0x55EB91803229B680,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	fsubd	%f24,	%f26,	%f6
	movl	%fcc3,	0x798,	%o5
	fpsub32s	%f19,	%f18,	%f2
	fcmpes	%fcc1,	%f18,	%f3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%cwp,	%l5
	wr	%g0,	0x81,	%asi
	lduba	[%l7 + 0x37] %asi,	%o3
	array32	%i3,	%g3,	%l4
	udivx	%g5,	%l1,	%l2
	movre	%l0,	0x30A,	%o0
	fxnor	%f22,	%f14,	%f4
	call	loop_166
	bcc,a,pn	%xcc,	loop_167
	orncc	%o4,	%o6,	%i6
	fcmpeq32	%f6,	%f28,	%l6
loop_166:
	wrpr	%i1,	%i2,	%pil
loop_167:
	call	loop_168
	fmovspos	%xcc,	%f15,	%f7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	call	loop_169
loop_168:
	umul	%g6,	%g1,	%i4
	bgu,pn	%icc,	loop_170
	call	loop_171
loop_169:
	call	loop_172
	srax	%i7,	0x15,	%l3
loop_170:
	tcc	%xcc,	0x3
loop_171:
	tgu	%icc,	0x0
loop_172:
	nop
	set	0x58, %g2
	stda	%o2,	[%l7 + %g2] 0x18
	movgu	%xcc,	%i5,	%i0
	call	loop_173
	call	loop_174
	call	loop_175
	fbe,a,pn	%fcc3,	loop_176
loop_173:
	fnegd	%f2,	%f16
loop_174:
	nop
	set	0x38, %g3
	ldswa	[%l7 + %g3] 0x11,	%g7
loop_175:
	call	loop_177
loop_176:
	and	%o7,	0x17BF,	%o5
	mova	%fcc1,	%g4,	%o1
	fbge	%fcc3,	loop_178
loop_177:
	rd	%y,	%o3
	call	loop_179
	movg	%xcc,	0x538,	%l5
loop_178:
	udivx	%g3,	0x00,	%l4
	fnot2	%f16,	%f2
loop_179:
	fabsd	%f28,	%f6
	fmovrdne	%g5,	%f6,	%f24
	set	0x08, %i4
	stda	%l0,	[%l7 + %i4] 0xe3
	membar	#Sync
	addccc	%i3,	%l0,	%o0
	subccc	%l2,	0x1E84,	%o4
	andn	%i6,	%l6,	%o6
	call	loop_180
	fcmple16	%f24,	%f30,	%i1
	fmovdge	%xcc,	%f2,	%f12
	fmul8x16au	%f10,	%f28,	%f26
loop_180:
	nop
	set	0x48, %l1
	stda	%g2,	[%l7 + %l1] 0x19
	fmuld8ulx16	%f31,	%f4,	%f26
	umulcc	%i2,	%g1,	%g6
	call	loop_181
	call	loop_182
	call	loop_183
	fmul8ulx16	%f24,	%f10,	%f8
loop_181:
	call	loop_184
loop_182:
	fcmpne32	%f4,	%f26,	%i7
loop_183:
	fmovsge	%fcc1,	%f2,	%f31
	stx	%l3,	[%l7 + 0x10]
loop_184:
	fmovdle	%icc,	%f8,	%f20
	wrpr	%i4,	%o2,	%cwp
	nop
	fitos	%f6,	%f15
	fstoi	%f15,	%f14
	alignaddrl	%i0,	%i5,	%g7
	fmovdpos	%xcc,	%f24,	%f16
	bvc,pn	%xcc,	loop_185
	fmovrslz	%o7,	%f5,	%f23
	wrpr	%o5,	%o1,	%cwp
	fcmpeq32	%f4,	%f30,	%g4
loop_185:
	call	loop_186
	array32	%o3,	%l5,	%l4
	fands	%f29,	%f10,	%f30
	edge32ln	%g5,	%l1,	%g3
loop_186:
	call	loop_187
	subc	%l0,	%i3,	%l2
	bvs,a	%xcc,	loop_188
	array16	%o0,	%i6,	%o4
loop_187:
	nop
	set	0x33, %g4
	ldsb	[%l7 + %g4],	%o6
	wr	%g0,	0x04,	%asi
	ldsha	[%l7 + 0x36] %asi,	%l6
loop_188:
	fcmpne16	%f20,	%f8,	%i1
	call	loop_189
	tvc	%xcc,	0x3
	movrgz	%i2,	0x339,	%g1
	call	loop_190
loop_189:
	movre	%g2,	0x176,	%i7
	edge8ln	%g6,	%l3,	%i4
	alignaddr	%o2,	%i5,	%g7
loop_190:
	tne	%icc,	0x5
	rdpr	%cwp,	%o7
	ta	%xcc,	0x0
	fcmped	%fcc0,	%f18,	%f28
	movule	%fcc0,	0x69E,	%o5
	call	loop_191
	fmul8x16au	%f17,	%f9,	%f22
	or	%i0,	%g4,	%o3
	call	loop_192
loop_191:
	fsrc2s	%f11,	%f10
	orcc	%o1,	%l4,	%l5
	brz,a,pt	%g5,	loop_193
loop_192:
	fand	%f16,	%f4,	%f12
	fnors	%f8,	%f26,	%f11
	orncc	%l1,	0x11AF,	%l0
loop_193:
	call	loop_194
	membar	0x04
	fmovs	%f21,	%f0
	nop
	fitos	%f3,	%f16
	fstox	%f16,	%f6
loop_194:
	fpackfix	%f12,	%f25
	fmovrsgz	%g3,	%f25,	%f31
	nop
	set	0x50, %o7
	std	%f28,	[%l7 + %o7]
	udivcc	%i3,	0x00,	%l2
	call	loop_195
	call	loop_196
	sra	%o0,	0x1B,	%i6
	call	loop_197
loop_195:
	call	loop_198
loop_196:
	orncc	%o6,	0x03F4,	%l6
	call	loop_199
loop_197:
	fmul8x16au	%f4,	%f21,	%f6
loop_198:
	movne	%fcc1,	0x46D,	%o4
	fnegd	%f0,	%f28
loop_199:
	fabss	%f30,	%f0
	flushw
	call	loop_200
	alignaddr	%i1,	%g1,	%g2
	ldsb	[%l7 + 0x32],	%i7
	edge16ln	%g6,	%l3,	%i4
loop_200:
	nop
	fitod	%f12,	%f14
	fdtox	%f14,	%f14
	fxtod	%f14,	%f28

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xCBB, 	%hsys_tick_cmpr
	popc	0x1A56,	%i5
	fbn,a	%fcc1,	loop_201
	edge16n	%i2,	%o7,	%o5
	fandnot1	%f22,	%f30,	%f8
	nop
	setx	0xCA47C2F2EF7D13F3,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0x0C995099,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	fsmuld	%f20,	%f28,	%f16
loop_201:
	tpos	%icc,	0x5
	fmovsneg	%icc,	%f25,	%f26
	brlez,a	%i0,	loop_202
	fmovdcc	%xcc,	%f10,	%f22
	bcs	%xcc,	loop_203
	fmovdn	%icc,	%f6,	%f6
loop_202:
	call	loop_204
	fcmpgt32	%f12,	%f14,	%g4
loop_203:
	fxnor	%f22,	%f26,	%f6
	call	loop_205
loop_204:
	fmovdneg	%xcc,	%f16,	%f4
	movge	%icc,	0x26D,	%g7
	call	loop_206
loop_205:
	call	loop_207
	edge32n	%o3,	%o1,	%l5
	fmuld8sux16	%f25,	%f2,	%f6
loop_206:
	call	loop_208
loop_207:
	orn	%l4,	0x0413,	%g5
	call	loop_209
	rd	%tick_cmpr,	%l0
loop_208:
	call	loop_210
	fcmpeq16	%f4,	%f30,	%l1
loop_209:
	edge32l	%i3,	%g3,	%o0
	call	loop_211
loop_210:
	sub	%i6,	0x0450,	%l2
	tg	%xcc,	0x4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_211:
	call	loop_212
	movvc	%icc,	%o4,	%i1
	call	loop_213
	call	loop_214
loop_212:
	call	loop_215
	fmovse	%fcc0,	%f25,	%f31
loop_213:
	call	loop_216
loop_214:
	fmovrslez	%g1,	%f19,	%f27
loop_215:
	fxnors	%f14,	%f15,	%f28
	fmovsug	%fcc3,	%f27,	%f12
loop_216:
	call	loop_217
	call	loop_218
	movrne	%g2,	0x378,	%o6
	call	loop_219
loop_217:
	nop
	setx	0x79D38A0D0DAE51C1,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0xDBAFE3476F279C16,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fdivd	%f0,	%f2,	%f30
loop_218:
	call	loop_220
	udiv	%i7,	%l3,	%g6
loop_219:
	call	loop_221
	call	loop_222
loop_220:
	call	loop_223
	fmovdpos	%icc,	%f20,	%f4
loop_221:
	bcc	%xcc,	loop_224
loop_222:
	xorcc	%i4,	%o2,	%i5
loop_223:
	wrpr	%i2,	%o7,	%pil
	fpadd32s	%f17,	%f17,	%f18
loop_224:
	fmovdneg	%icc,	%f8,	%f4
	set	0x50, %l2
	ldswa	[%l7 + %l2] 0x0c,	%i0
	smul	%o5,	%g7,	%o3
	movlg	%fcc0,	0x7CC,	%o1
	xnorcc	%g4,	0x15D1,	%l5
	membar	0x29
	call	loop_225
	fpackfix	%f20,	%f7
	call	loop_226
	movvs	%xcc,	%g5,	%l0
loop_225:
	alignaddrl	%l1,	%l4,	%g3
	nop
	setx	0x4E41C698,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f6
	setx	0xE5D5969F,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f31
	fdivs	%f31,	%f6,	%f11
loop_226:
	fpadd16	%f28,	%f30,	%f26
	call	loop_227
	call	loop_228
	fxnor	%f22,	%f0,	%f24
	movn	%icc,	%o0,	%i3
loop_227:
	call	loop_229
loop_228:
	fble,pt	%fcc2,	loop_230
	fmovdn	%icc,	%f24,	%f30
	call	loop_231
loop_229:
	call	loop_232
loop_230:
	call	loop_233
	call	loop_234
loop_231:
	call	loop_235
loop_232:
	call	loop_236
loop_233:
	call	loop_237
loop_234:
	call	loop_238
loop_235:
	wr	%i6,	%l6,	%ccr
loop_236:
	fmovsuge	%fcc1,	%f31,	%f15
loop_237:
	call	loop_239
loop_238:
	call	loop_240
	fmovdvs	%xcc,	%f20,	%f26
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
loop_239:
	call	loop_241
loop_240:
	fcmped	%fcc2,	%f20,	%f16
	call	loop_242
	tg	%xcc,	0x0
loop_241:
	orn	%o4,	0x142B,	%l2
	call	loop_243
loop_242:
	fsrc1s	%f29,	%f10
	wr	%g0,	0x80,	%asi
	swapa	[%l7 + 0x7C] %asi,	%i1
loop_243:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fbue,pt	%fcc2,	loop_244
	fmovdvc	%icc,	%f2,	%f0
	fmovrslez	%g1,	%f30,	%f23
	fmovrsne	%l3,	%f30,	%f25
loop_244:
	fmovdu	%fcc2,	%f8,	%f2
	and	%g6,	%i4,	%o2
	nop
	setx	0x8A6D56DEA35B0EEB,	%l0,	%l6
	stx	%l6,	[%l7 + 0x78]
	ldx	[%l7 + 0x78],	%fsr
	call	loop_245
	te	%xcc,	0x1
	fmovsge	%xcc,	%f25,	%f9
	rd	%sys_tick_cmpr,	%i7
loop_245:
	movle	%fcc0,	0x71A,	%i5
	edge16ln	%o7,	%i2,	%o5
	edge16	%i0,	%g7,	%o1
	movul	%fcc3,	0x1FD,	%g4
	fmovrslz	%o3,	%f25,	%f20
	nop
	fitod	%f12,	%f6
	fdtox	%f6,	%f12
	fxtod	%f12,	%f8
	subccc	%l5,	%g5,	%l0
	call	loop_246
	fpack16	%f12,	%f2
	taddcctv	%l1,	0x0F0F,	%l4
	bne,a,pn	%icc,	loop_247
loop_246:
	andn	%g3,	%o0,	%i6
	edge16l	%l6,	%i3,	%o4
	fxor	%f28,	%f8,	%f18
loop_247:
	wrpr 	%g0, 	0x0, 	%gl
	edge8l	%i1,	%o6,	%g2
	tleu	%xcc,	0x3
	movn	%icc,	0x6DD,	%g1
	call	loop_248
	call	loop_249
	fmovsuge	%fcc3,	%f6,	%f17
	tvs	%xcc,	0x7
loop_248:
	movcs	%xcc,	0x5ED,	%l3
loop_249:
	call	loop_250
	fones	%f24
	fabss	%f25,	%f2
	call	loop_251
loop_250:
	fnegs	%f11,	%f17
	fxors	%f8,	%f18,	%f7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x23E, 	%hsys_tick_cmpr
loop_251:
	tcs	%icc,	0x4
	fmovsuge	%fcc0,	%f2,	%f16
	fors	%f15,	%f31,	%f16
	call	loop_252
	te	%icc,	0x0
	array16	%o2,	%i7,	%o7
	rdhpr	%hsys_tick_cmpr,	%i5
loop_252:
	call	loop_253
	fmovdue	%fcc0,	%f26,	%f0
	nop
	fitos	%f20,	%f19
	fmul8x16al	%f6,	%f17,	%f14
loop_253:
	fcmpgt16	%f12,	%f28,	%i2
	call	loop_254
	call	loop_255
	fmovsleu	%xcc,	%f15,	%f5
	fmovdcc	%xcc,	%f4,	%f8
loop_254:
	rd	%fprs,	%o5
loop_255:
	call	loop_256
	call	loop_257
	flushw
	fpackfix	%f12,	%f22
loop_256:
	call	loop_258
loop_257:
	call	loop_259
	addc	%g7,	0x16B8,	%i0
	nop
	setx	0xC614BDBD,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f27
	setx	0xEBC91138,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f29
	fsubs	%f29,	%f27,	%f26
loop_258:
	nop
	setx	0xA182FE1D,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f29
	setx	0x09434BAC,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f14
	fdivs	%f14,	%f29,	%f20
loop_259:
	rd	%asi,	%o1
	call	loop_260
	call	loop_261
	smulcc	%o3,	%g4,	%l5
	nop
	fitod	%f15,	%f4
loop_260:
	fpadd32s	%f27,	%f19,	%f31
loop_261:
	nop
	setx	0x061D0044BA900111,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	setx	0xCB7EC4AD0A9915AE,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	fsubd	%f28,	%f18,	%f12
	array32	%g5,	%l1,	%l0
	fmovsgu	%icc,	%f29,	%f13
	fmovse	%fcc1,	%f28,	%f3
	wr	%l4,	%o0,	%sys_tick
	movre	%i6,	0x172,	%l6
	fnot1	%f4,	%f28
	set	0x0, %o5
	stxa	%g3,	[%g0 + %o5] 0x5f
	ta	%icc,	0x7
	nop
	set	0x30, %o2
	ldd	[%l7 + %o2],	%o4
	ldsh	[%l7 + 0x0C],	%i3
	andcc	%i1,	0x091F,	%o6
	fpsub32s	%f5,	%f13,	%f7
	mulx	%l2,	%g1,	%g2
	sethi	0x1F90,	%i4
	fpack16	%f6,	%f22
	call	loop_262
	call	loop_263
	subccc	%l3,	0x0780,	%g6
	fmovrslz	%i7,	%f9,	%f18
loop_262:
	tge	%icc,	0x0
loop_263:
	fabss	%f12,	%f15
	call	loop_264
	tsubcctv	%o7,	0x193B,	%o2
	call	loop_265
	fand	%f20,	%f8,	%f4
loop_264:
	fxors	%f25,	%f9,	%f1
	fmovsu	%fcc1,	%f11,	%f15
loop_265:
	movl	%xcc,	0x305,	%i5
	sra	%o5,	%g7,	%i2
	fands	%f19,	%f18,	%f16
	fmul8x16	%f19,	%f0,	%f0
	add	%i0,	%o3,	%o1
	call	loop_266
	call	loop_267
	mova	%fcc2,	0x33B,	%l5
	bshuffle	%f26,	%f24,	%f0
loop_266:
	rdhpr	%hintp,	%g5
loop_267:
	tgu	%icc,	0x2
	call	loop_268
	fcmpeq16	%f4,	%f26,	%l1
	call	loop_269
	te	%icc,	0x7
loop_268:
	fmovsvc	%xcc,	%f21,	%f24
	membar	0x02
loop_269:
	xnor	%g4,	%l4,	%o0
	call	loop_270
	call	loop_271
	fornot1	%f0,	%f22,	%f24
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
loop_270:
	movn	%icc,	0x7B4,	%l0
loop_271:
	rd	%softint,	%l6
	fnot2s	%f16,	%f10
	fmovrdgz	%i6,	%f8,	%f0
	call	loop_272
	xor	%g3,	0x0D06,	%o4
	fmovduge	%fcc0,	%f16,	%f6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_272:
	movlg	%fcc2,	0x7AB,	%l2
	call	loop_273
	movvs	%xcc,	%o6,	%g2
	fpadd16s	%f13,	%f24,	%f6
	fmovdle	%fcc1,	%f14,	%f16
loop_273:
	movo	%fcc1,	0x399,	%i4
	udiv	%g1,	%l3,	%g6
	call	loop_274
	fbue,pt	%fcc3,	loop_275
	faligndata	%f12,	%f20,	%f24
	call	loop_276
loop_274:
	fcmpgt32	%f28,	%f12,	%i7
loop_275:
	fzeros	%f11
	call	loop_277
loop_276:
	orn	%o2,	0x1F25,	%i5
	call	loop_278
	fpsub32s	%f20,	%f15,	%f12
loop_277:
	call	loop_279
	call	loop_280
loop_278:
	fmovdvc	%xcc,	%f24,	%f18
	fornot2	%f20,	%f16,	%f28
loop_279:
	rd	%fprs,	%o7
loop_280:
	st	%fsr,	[%l7 + 0x10]
	tpos	%xcc,	0x3
	call	loop_281
	fmovspos	%xcc,	%f1,	%f3
	bge,a	%xcc,	loop_282
	fmovsule	%fcc0,	%f10,	%f29
loop_281:
	tcc	%icc,	0x7
	fmovdgu	%xcc,	%f12,	%f24
loop_282:
	fmovdule	%fcc3,	%f24,	%f4
	fblg,a	%fcc0,	loop_283
	fexpand	%f28,	%f22
	call	loop_284
	udivx	%o5,	0x00,	%g7
loop_283:
	for	%f6,	%f8,	%f14
	fbul	%fcc0,	loop_285
loop_284:
	fnegd	%f22,	%f8
	andcc	%i2,	0x1420,	%o3
	movvs	%xcc,	0x523,	%i0
loop_285:
	nop
	wr	%g0,	0x19,	%asi
	ldsba	[%l7 + 0x71] %asi,	%o1
	call	loop_286
	fmovdn	%icc,	%f6,	%f10
	edge16n	%l5,	%l1,	%g4
	swap	[%l7 + 0x20],	%g5
loop_286:
	nop
	set	0x5C, %g5
	swapa	[%l7 + %g5] 0x18,	%l4
	andn	%o0,	0x07A6,	%l6
	srax	%i6,	0x10,	%l0
	fmovsa	%icc,	%f17,	%f22
	mulx	%g3,	%i1,	%o4
	ta	%icc,	0x0
	fmovspos	%xcc,	%f25,	%f26
	tneg	%icc,	0x4
	membar	0x1F
	call	loop_287
	add	%i3,	0x1C08,	%o6
	fmovdue	%fcc3,	%f22,	%f4
	andcc	%g2,	%i4,	%g1
loop_287:
	call	loop_288
	movue	%fcc2,	%l2,	%g6
	fmovd	%f28,	%f24
	movne	%icc,	%l3,	%o2
loop_288:
	swap	[%l7 + 0x10],	%i7
	fmovdule	%fcc2,	%f18,	%f2
	nop
	set	0x58, %l0
	stx	%fsr,	[%l7 + %l0]
	fmovs	%f1,	%f5
	fmovdcc	%icc,	%f30,	%f0
	fmovrslz	%i5,	%f13,	%f6
	fpsub32s	%f13,	%f9,	%f5
	call	loop_289
	fbu,a	%fcc3,	loop_290
	call	loop_291
	call	loop_292
loop_289:
	call	loop_293
loop_290:
	call	loop_294
loop_291:
	tsubcc	%o7,	0x1905,	%g7
loop_292:
	array32	%o5,	%o3,	%i2
loop_293:
	edge16	%o1,	%l5,	%l1
loop_294:
	tn	%icc,	0x3
	fmul8x16	%f26,	%f16,	%f28
	call	loop_295
	brlez	%g4,	loop_296
loop_295:
	nop

loop_296:
	nop

	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 1:
!
!	Type l   	: 22
!	Type a   	: 28
!	Type x   	: 11
!	Type cti   	: 143
!	Type f   	: 150
!	Type i   	: 146
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

!
! Thread 2 Start
!
main_t2:
	mov 	%l7, 	%g1
	!# Set %cwp for 8 windows
	!# This threads memory space into each %l7
	wrpr 	%g0, 	0x7, 	%cwp
	mov 	%g1, 	%l7
	wrpr 	%g0, 	0x6, 	%cwp
	mov 	%g1, 	%l7
	wrpr 	%g0, 	0x5, 	%cwp
	mov 	%g1, 	%l7
	wrpr 	%g0, 	0x4, 	%cwp
	mov 	%g1, 	%l7
	wrpr 	%g0, 	0x3, 	%cwp
	mov 	%g1, 	%l7
	wrpr 	%g0, 	0x2, 	%cwp
	mov 	%g1, 	%l7
	wrpr 	%g0, 	0x1, 	%cwp
	mov 	%g1, 	%l7
	wrpr 	%g0, 	0x0, 	%cwp
	mov 	%g1, 	%l7

	!# Set %fsr
	setx 	0x0000000000000000,	%l0,	%l6	!# no post process
	stx 	%l6, 	[%l7 + 0x0]	!# no post process
	ldx 	[%l7 + 0x0], 	%fsr	!# no post process

	!# Initialize registers ..

	!# Global registers
	set	0xF,	%g1
	set	0x0,	%g2
	set	0xC,	%g3
	set	0xC,	%g4
	set	0xB,	%g5
	set	0x0,	%g6
	set	0x4,	%g7
	!# Input registers
	set	-0x8,	%i0
	set	-0x0,	%i1
	set	-0x0,	%i2
	set	-0xA,	%i3
	set	-0x2,	%i4
	set	-0x0,	%i5
	set	-0x3,	%i6
	set	-0x7,	%i7
	!# Local registers
	set	0x4E019F85,	%l0
	set	0x76DF21CE,	%l1
	set	0x7029F00C,	%l2
	set	0x2FC05B8C,	%l3
	set	0x37A42624,	%l4
	set	0x35D4D6E2,	%l5
	set	0x4E1F321C,	%l6
	!# Output registers
	set	0x0B91,	%o0
	set	0x1AFC,	%o1
	set	0x1F53,	%o2
	set	-0x02F3,	%o3
	set	0x10B4,	%o4
	set	-0x1E25,	%o5
	set	0x1A24,	%o6
	set	0x1CD4,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0xF9E0BBFB632344C2)
	INIT_TH_FP_REG(%l7,%f2,0x53C87029AA2FE833)
	INIT_TH_FP_REG(%l7,%f4,0xDE952A53A3AD06F4)
	INIT_TH_FP_REG(%l7,%f6,0x4829F0FA358AAB1A)
	INIT_TH_FP_REG(%l7,%f8,0x3E56A552936BFBAC)
	INIT_TH_FP_REG(%l7,%f10,0x5FEC588976E3FF0F)
	INIT_TH_FP_REG(%l7,%f12,0x59960BCB796288EC)
	INIT_TH_FP_REG(%l7,%f14,0x02BB7E99E16D67F4)
	INIT_TH_FP_REG(%l7,%f16,0x2B88127A028E0C9D)
	INIT_TH_FP_REG(%l7,%f18,0x1F7BC94AED1048E0)
	INIT_TH_FP_REG(%l7,%f20,0x6AAEFD748E8AA9B7)
	INIT_TH_FP_REG(%l7,%f22,0x42D30B68F5F003E5)
	INIT_TH_FP_REG(%l7,%f24,0x1FD9A46546DB3789)
	INIT_TH_FP_REG(%l7,%f26,0x74E49AFE0AE9E70A)
	INIT_TH_FP_REG(%l7,%f28,0x9610A29EE8E2CA43)
	INIT_TH_FP_REG(%l7,%f30,0x0E709079768FBC1E)

	!# Execute Main Diag ..

	fmovsuge	%fcc3,	%f26,	%f23
	fornot2	%f16,	%f14,	%f20
	xnor	%g5,	0x1705,	%l4
	nop
	set	0x30, %g7
	lduw	[%l7 + %g7],	%o0
	brlz,pt	%l6,	loop_297
	fmul8sux16	%f18,	%f24,	%f28
	andn	%i6,	0x0E96,	%l0
	bcs,a,pn	%icc,	loop_298
loop_297:
	fpack16	%f0,	%f12
	mova	%fcc3,	0x5D7,	%i0
	call	loop_299
loop_298:
	fmovsule	%fcc0,	%f18,	%f22
	alignaddr	%i1,	%o4,	%g3
	wrpr	%i3,	%g2,	%tick
loop_299:
	fzeros	%f3
	call	loop_300
	call	loop_301
	rd	%sys_tick_cmpr,	%i4
	brgz,a	%g1,	loop_302
loop_300:
	call	loop_303
loop_301:
	movlg	%fcc0,	0x769,	%o6
	fbu	%fcc3,	loop_304
loop_302:
	fmovrsgez	%l2,	%f14,	%f6
loop_303:
	call	loop_305
	call	loop_306
loop_304:
	fcmple16	%f4,	%f26,	%l3
	fxors	%f13,	%f5,	%f19
loop_305:
	tle	%xcc,	0x5
loop_306:
	fmovdneg	%xcc,	%f26,	%f28
	movle	%xcc,	0x246,	%g6
	call	loop_307
	call	loop_308
	call	loop_309
	call	loop_310
loop_307:
	nop
	setx	0x01070AB4,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f24
	setx	0x74AFCC47,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f26
	fadds	%f26,	%f24,	%f4
loop_308:
	popc	0x0C6B,	%i7
loop_309:
	call	loop_311
loop_310:
	nop
	fitos	%f11,	%f29
	fstox	%f29,	%f0
	fcmpne16	%f16,	%f14,	%i5
	call	loop_312
loop_311:
	call	loop_313
	movle	%fcc0,	%o7,	%o2
	fandnot1	%f24,	%f8,	%f20
loop_312:
	smul	%g7,	0x14C5,	%o3
loop_313:
	call	loop_314
	fmovdneg	%icc,	%f2,	%f2
	call	loop_315
	fmovrsne	%o5,	%f15,	%f6
loop_314:
	tleu	%icc,	0x7
	call	loop_316
loop_315:
	call	loop_317
	rdpr	%cwp,	%i2
	call	loop_318
loop_316:
	movule	%fcc2,	0x70D,	%l5
loop_317:
	fmovdo	%fcc3,	%f20,	%f8
	set	0x7C, %o0
	ldsba	[%l7 + %o0] 0x89,	%l1
loop_318:
	fmovsu	%fcc2,	%f3,	%f20
	call	loop_319
	rdhpr	%ver,	%g4
	fmovdpos	%icc,	%f20,	%f10
	fmovrdlz	%o1,	%f16,	%f28
loop_319:
	call	loop_320
	for	%f8,	%f20,	%f14
	call	loop_321
	fandnot2s	%f3,	%f23,	%f31
loop_320:
	move	%fcc0,	0x711,	%l4
	call	loop_322
loop_321:
	sra	%g5,	0x1F,	%l6
	fexpand	%f27,	%f24
	fba,a,pt	%fcc3,	loop_323
loop_322:
	movvs	%xcc,	0x10F,	%o0
	ldub	[%l7 + 0x62],	%i6
	call	loop_324
loop_323:
	call	loop_325
	fcmple32	%f28,	%f22,	%l0
	fzero	%f24
loop_324:
	fpsub32s	%f23,	%f9,	%f12
loop_325:
	fmovdge	%fcc3,	%f26,	%f12
	tleu	%icc,	0x7
	fcmpne32	%f0,	%f4,	%i0
	call	loop_326
	umulcc	%o4,	0x0565,	%g3
	call	loop_327
	fbug	%fcc3,	loop_328
loop_326:
	movrgz	%i1,	%g2,	%i3
	fmovspos	%xcc,	%f17,	%f3
loop_327:
	call	loop_329
loop_328:
	call	loop_330
	membar	0x42
	call	loop_331
loop_329:
	fmovdcc	%icc,	%f18,	%f28
loop_330:
	nop
	fitod	%f2,	%f22
	fdtoi	%f22,	%f19
	siam	0x2
loop_331:
	orncc	%i4,	0x17B6,	%o6
	fmovsa	%xcc,	%f7,	%f16
	set	0x1C, %l4
	ldstuba	[%l7 + %l4] 0x10,	%g1
	fbo,pt	%fcc0,	loop_332
	edge16	%l3,	%l2,	%i7
	wr	%g0,	0x10,	%asi
	lduba	[%l7 + 0x3D] %asi,	%g6
loop_332:
	flush	%l7 + 0x44
	nop
	setx	0x47DC43CA5777D133,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	fsqrtd	%f22,	%f14
	addcc	%i5,	0x1B40,	%o7
	call	loop_333
	sdivcc	%g7,	%o2,	%o3
	fmovdlg	%fcc0,	%f28,	%f20
	call	loop_334
loop_333:
	movn	%xcc,	%i2,	%o5
	taddcc	%l1,	%g4,	%l5
	call	loop_335
loop_334:
	fmovs	%f20,	%f1
	nop
	setx	0xA629C60EFBD4EEDC,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0xFF3DE443A75089D3,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	fdivd	%f20,	%f4,	%f18
	fmovrsne	%o1,	%f5,	%f15
loop_335:
	call	loop_336
	call	loop_337
	fbge,a,pt	%fcc1,	loop_338
	rd	%y,	%g5
loop_336:
	nop
	setx	loop_339,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x004400001407,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_337:
	fzeros	%f16
loop_338:
	fpadd16	%f0,	%f4,	%f26
	call	loop_340
loop_339:
	fsrc2	%f30,	%f28
	fpack32	%f26,	%f2,	%f12
	nop
	setx	loop_341,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x012400001403,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	rdpr	%tt,	%l1
	wrpr	%g0,	%l1,	%tt
	rdpr	%pstate,	%l1
	wrpr	%g0,	%l1,	%pstate
	rdpr	%tl,	%l1
	wrpr	%g0,	%l1,	%tl
	rdpr	%tpc,	%l1
	wrpr	%g0,	%l1,	%tpc
	rdpr	%tnpc,	%l1
	wrpr	%g0,	%l1,	%tnpc
	rdpr	%tstate,	%l1
	wrpr	%g0,	%l1,	%tstate
	rdpr	%tba,	%l1
	wrpr	%g0,	%l1,	%tba
	rdpr	%tba,	%l1
	wrpr	%g0,	%l1,	%tba
	rdhpr	%hpstate,	%l1
	wrhpr	%g0,	%l1,	%hpstate
	rdhpr	%htstate,	%l1
	wrhpr	%g0,	%l1,	%htstate
	rdhpr	%hintp,	%l1
	wrhpr	%g0,	%l1,	%hintp
	done
loop_340:
	fnot1s	%f28,	%f12
	fornot2s	%f3,	%f7,	%f2
	fmul8ulx16	%f30,	%f12,	%f28
loop_341:
	movrlz	%l4,	0x268,	%o0
	fnor	%f12,	%f30,	%f4
	call	loop_342
	flushw
	tsubcc	%i6,	%l0,	%i0
	nop
	setx	0xCD76AB46,	%l0,	%l6
	st	%l6,	[%l7 + 0x34]
	ld	[%l7 + 0x34],	%fsr
loop_342:
	fmuld8sux16	%f30,	%f13,	%f6
	taddcc	%o4,	0x128F,	%l6
	nop
	fitos	%f31,	%f17
	fmul8x16	%f16,	%f0,	%f18
	fmovdvc	%icc,	%f18,	%f20
	call	loop_343
	edge32n	%i1,	%g2,	%i3
	movvs	%icc,	0x15A,	%i4
	nop
	setx	0xD0B6D956,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f24
	setx	0xED1430E0,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f13
	fdivs	%f13,	%f24,	%f18
loop_343:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x274, 	%hsys_tick_cmpr
	movlg	%fcc1,	0x115,	%l3
	call	loop_344
	fmovsleu	%icc,	%f3,	%f4
	fbge,a,pn	%fcc0,	loop_345
	movl	%xcc,	%l2,	%i7
loop_344:
	bgu,a,pn	%xcc,	loop_346
	wr	%o6,	%i5,	%ccr
loop_345:
	fpsub32s	%f11,	%f13,	%f15
	fxnors	%f27,	%f20,	%f18
loop_346:
	rdhpr	%hsys_tick_cmpr,	%o7
	nop
	fitod	%f2,	%f10
	fdtox	%f10,	%f12
	fxtod	%f12,	%f22
	sdivx	%g6,	0x00,	%o2
	call	loop_347
	bshuffle	%f20,	%f10,	%f28
	wr	%o3,	0x0E27,	%pic
	edge8n	%g7,	%i2,	%l1
loop_347:
	movcs	%icc,	0x6C8,	%o5
	movrlez	%l5,	0x372,	%o1
	call	loop_348
	faligndata	%f6,	%f30,	%f24
	call	loop_349
	or	%g5,	%g4,	%l4
loop_348:
	nop
	set	0x30, %i7
	flush	%l7 + %i7
	movge	%fcc3,	0x628,	%o0
loop_349:
	fbul,a	%fcc2,	loop_350
	call	loop_351
	fmovd	%f10,	%f26
	subccc	%l0,	0x0530,	%i0
loop_350:
	call	loop_352
loop_351:
	call	loop_353
	movl	%xcc,	0x2B2,	%o4
	fmovdl	%fcc0,	%f8,	%f14
loop_352:
	nop
	wr	%g0,	0x88,	%asi
	ldxa	[%l7 + 0x38] %asi,	%i6
loop_353:
	fbn	%fcc0,	loop_354
	fmovdgu	%icc,	%f0,	%f28
	call	loop_355
	fmovdvs	%icc,	%f14,	%f16
loop_354:
	fmovdule	%fcc2,	%f18,	%f26
	call	loop_356
loop_355:
	srax	%i1,	%l6,	%i3
	call	loop_357
	ldd	[%l7 + 0x48],	%g2
loop_356:
	call	loop_358
	bcs,a,pt	%xcc,	loop_359
loop_357:
	fcmped	%fcc3,	%f20,	%f0
	alignaddrl	%g3,	%i4,	%l3
loop_358:
	fmovsneg	%icc,	%f7,	%f31
loop_359:
	te	%icc,	0x5
	movre	%l2,	0x29F,	%g1
	call	loop_360
	movrlez	%i7,	%i5,	%o7
	fmovsul	%fcc2,	%f8,	%f15
	fnors	%f8,	%f23,	%f8
loop_360:
	fmovrdlez	%g6,	%f28,	%f26
	call	loop_361
	fmovrdgez	%o6,	%f16,	%f16
	wrpr	%o3,	0x1C06,	%pil
	fmovsu	%fcc2,	%f11,	%f25
loop_361:
	edge8	%o2,	%g7,	%i2
	movle	%fcc1,	%l1,	%l5
	call	loop_362
	call	loop_363
	rdpr	%pil,	%o1
	sub	%g5,	0x05B4,	%o5
loop_362:
	movug	%fcc1,	%l4,	%g4
loop_363:
	fmovd	%f30,	%f12
	umulcc	%l0,	0x0909,	%o0
	nop
	set	0x58, %l6
	ldx	[%l7 + %l6],	%o4
	tle	%xcc,	0x2
	call	loop_364
	fbug,a	%fcc2,	loop_365
	call	loop_366
	fblg,a	%fcc1,	loop_367
loop_364:
	lduh	[%l7 + 0x30],	%i0
loop_365:
	call	loop_368
loop_366:
	rdpr	%cansave,	%i6
loop_367:
	orncc	%l6,	%i3,	%i1
	subc	%g3,	%g2,	%l3
loop_368:
	fors	%f23,	%f4,	%f15
	bl	%xcc,	loop_369
	tleu	%xcc,	0x2
	bleu,a	%icc,	loop_370
	fmovdu	%fcc3,	%f14,	%f24
loop_369:
	sub	%l2,	0x0C98,	%g1
	call	loop_371
loop_370:
	alignaddr	%i7,	%i4,	%o7
	fbug	%fcc2,	loop_372
	call	loop_373
loop_371:
	udiv	%g6,	%o6,	%i5
	tsubcc	%o2,	0x15BA,	%g7
loop_372:
	fmovsu	%fcc0,	%f20,	%f16
loop_373:
	nop
	fitos	%f3,	%f16
	fstox	%f16,	%f14
	smul	%i2,	0x0A9C,	%l1
	fmovsvs	%icc,	%f20,	%f15
	call	loop_374
	movue	%fcc2,	0x613,	%l5
	fmovda	%xcc,	%f24,	%f12
	tne	%icc,	0x4
loop_374:
	srl	%o1,	0x08,	%g5
	fpack32	%f16,	%f26,	%f20
	call	loop_375
	tpos	%xcc,	0x7
	mulx	%o5,	0x1E3E,	%o3
	fand	%f6,	%f8,	%f4
loop_375:
	movlg	%fcc3,	0x580,	%l4
	ldub	[%l7 + 0x4C],	%g4
	fpsub16s	%f30,	%f5,	%f6
	fxors	%f1,	%f25,	%f6
	call	loop_376
	nop
	fitos	%f8,	%f1
	fstod	%f1,	%f6
	fmovsgu	%xcc,	%f5,	%f19
	sdivcc	%l0,	%o0,	%o4
loop_376:
	tne	%icc,	0x1
	call	loop_377
	nop
	setx	0xC519CEBA719FF920,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0xBE5036709D3AFAFE,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	faddd	%f24,	%f22,	%f10
	fcmple16	%f8,	%f10,	%i0
	bl,pt	%xcc,	loop_378
loop_377:
	taddcc	%i6,	%i3,	%l6
	nop
	setx	0xF9E377AA11204F7B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0x870D975455CBEBAB,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	fsubd	%f14,	%f8,	%f26
	call	loop_379
loop_378:
	call	loop_380
	tge	%xcc,	0x5
	fmovdcs	%icc,	%f0,	%f14
loop_379:
	fmovrdne	%g3,	%f6,	%f24
loop_380:
	fmul8x16al	%f9,	%f31,	%f16
	bn,a	%icc,	loop_381
	fandnot2s	%f27,	%f17,	%f19
	tvs	%xcc,	0x6
	fpadd16	%f30,	%f14,	%f16
loop_381:
	fmovdge	%fcc2,	%f2,	%f24
	nop
	setx	0xB06D3EA4C5D529C1,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0xA0FC2A181E405B19,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	fsubd	%f22,	%f16,	%f10
	fnegd	%f2,	%f10
	call	loop_382
	fcmped	%fcc3,	%f20,	%f18
	array8	%g2,	%l3,	%i1
	movleu	%icc,	%g1,	%i7
loop_382:
	std	%i4,	[%l7 + 0x60]
	nop
	set	0x5E, %i0
	ldub	[%l7 + %i0],	%l2
	fmovdug	%fcc2,	%f8,	%f24
	fones	%f10
	call	loop_383
	tne	%xcc,	0x3
	fmovda	%xcc,	%f22,	%f14
	set	0x38, %l5
	stxa	%g6,	[%l7 + %l5] 0x23
	membar	#Sync
loop_383:
	fmovdug	%fcc0,	%f2,	%f10
	movleu	%icc,	%o6,	%i5
	fnegd	%f2,	%f22
	fmovscs	%icc,	%f6,	%f19
	nop
	fitod	%f10,	%f22
	fdtos	%f22,	%f28
	fands	%f26,	%f10,	%f2
	fbue,a,pt	%fcc1,	loop_384
	or	%o2,	0x1CE5,	%g7
	stx	%fsr,	[%l7 + 0x58]
	fmul8sux16	%f22,	%f22,	%f14
loop_384:
	fmovdule	%fcc0,	%f30,	%f18
	fxors	%f16,	%f8,	%f5
	fabss	%f6,	%f20
	rdpr	%canrestore,	%i2
	call	loop_385
	fmul8sux16	%f14,	%f2,	%f0
	siam	0x3
	bge,a,pn	%icc,	loop_386
loop_385:
	fmovdcc	%icc,	%f26,	%f22
	nop
	fitod	%f4,	%f14
	fdtos	%f14,	%f23
	fbn,a	%fcc0,	loop_387
loop_386:
	call	loop_388
	mova	%xcc,	0x5AF,	%o7
	call	loop_389
loop_387:
	movl	%xcc,	0x42C,	%l5
loop_388:
	call	loop_390
	fmovdn	%xcc,	%f10,	%f18
loop_389:
	movn	%icc,	%l1,	%o1
	fnot1	%f20,	%f24
loop_390:
	te	%xcc,	0x4
	xor	%g5,	0x0EA1,	%o5
	tl	%icc,	0x3
	fmovdge	%xcc,	%f14,	%f14
	array32	%o3,	%l4,	%l0
	fmovdlg	%fcc0,	%f10,	%f10
	call	loop_391
	call	loop_392
	and	%g4,	0x190F,	%o4
	call	loop_393
loop_391:
	alignaddr	%o0,	%i6,	%i0
loop_392:
	tgu	%xcc,	0x5
	movneg	%xcc,	0x4AA,	%i3
loop_393:
	call	loop_394
	stbar
	call	loop_395
	nop
	setx	0x9307CB18,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f9
	setx	0x441439E2,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f5
	fadds	%f5,	%f9,	%f16
loop_394:
	fmovdul	%fcc1,	%f0,	%f20
	movcs	%icc,	%l6,	%g2
loop_395:
	fexpand	%f16,	%f2
	fnot2s	%f4,	%f27
	nop
	fitod	%f3,	%f26
	udivx	%l3,	0x00,	%i1
	bcs	%icc,	loop_396
	fmovrdlz	%g3,	%f16,	%f30
	call	loop_397
	fbul,pn	%fcc1,	loop_398
loop_396:
	call	loop_399
	sdiv	%i7,	0x00,	%i4
loop_397:
	call	loop_400
loop_398:
	bge,a,pt	%icc,	loop_401
loop_399:
	call	loop_402
	fsrc2s	%f29,	%f9
loop_400:
	taddcc	%l2,	0x04B6,	%g6
loop_401:
	nop
	fitod	%f0,	%f28
	fdtoi	%f28,	%f7
loop_402:
	fmovdpos	%xcc,	%f12,	%f8
	call	loop_403
	sdivx	%g1,	%i5,	%o6
	te	%xcc,	0x4
	membar	0x7B
loop_403:
	movrgz	%g7,	%o2,	%o7
	call	loop_404
	fmovsleu	%icc,	%f4,	%f8
	fmovrdgz	%l5,	%f26,	%f0
	call	loop_405
loop_404:
	call	loop_406
	nop
	fitos	%f3,	%f26
	fstod	%f26,	%f8
	call	loop_407
loop_405:
	call	loop_408
loop_406:
	fcmps	%fcc3,	%f5,	%f29
	fpadd32	%f26,	%f30,	%f12
loop_407:
	call	loop_409
loop_408:
	call	loop_410
	flushw
	movrne	%l1,	%i2,	%o1
loop_409:
	tge	%xcc,	0x3
loop_410:
	fcmpne32	%f22,	%f30,	%o5
	call	loop_411
	fmovdneg	%xcc,	%f26,	%f12
	call	loop_412
	movrgez	%o3,	%g5,	%l4
loop_411:
	array8	%g4,	%l0,	%o4
	fpack16	%f22,	%f9
loop_412:
	nop
	setx	0xC49BB450,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f3
	fsqrts	%f3,	%f30
	add	%l7,	0x68,	%l6
	wr	%g0,	0x04,	%asi
	casxa	[%l6] 0x04,	%i6,	%i0
	fmul8x16al	%f19,	%f25,	%f30

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xA57, 	%hsys_tick_cmpr
	addc	%g2,	%o0,	%l3
	fmovsneg	%icc,	%f31,	%f10
	srlx	%i1,	0x0B,	%g3
	call	loop_413
	orn	%i7,	0x1C4F,	%l2
	call	loop_414
	subcc	%i4,	0x094E,	%g6
loop_413:
	fxors	%f22,	%f13,	%f28
	fba,a	%fcc1,	loop_415
loop_414:
	fsrc2s	%f24,	%f22
	nop
	fitod	%f8,	%f8
	fdtos	%f8,	%f19
	ldx	[%l7 + 0x20],	%i5
loop_415:
	fmovrdlz	%g1,	%f18,	%f4
	brlez,a	%g7,	loop_416
	fxnor	%f14,	%f18,	%f28
	movle	%fcc1,	%o6,	%o7
	call	loop_417
loop_416:
	movne	%xcc,	0x5BA,	%l5
	prefetch	[%l7 + 0x30],	 1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xAB2, 	%hsys_tick_cmpr
loop_417:
	stbar
	call	loop_418
	nop
	setx	0x621AC8229ACFA2D6,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0x9BD5F050,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	fsmuld	%f2,	%f4,	%f2
	fmovdvs	%icc,	%f20,	%f2
	faligndata	%f20,	%f2,	%f12
loop_418:
	rdpr	%canrestore,	%i2
	sra	%o1,	%o5,	%l1
	array8	%o3,	%l4,	%g5
	edge8ln	%l0,	%g4,	%i6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	subccc	%i3,	0x04E4,	%l6
	fbn,pt	%fcc1,	loop_419
	call	loop_420
	fmovrsgz	%o4,	%f19,	%f30
	movle	%icc,	%g2,	%o0
loop_419:
	fnot2	%f20,	%f20
loop_420:
	brgez,a	%l3,	loop_421
	fmovda	%xcc,	%f26,	%f30
	nop
	setx	0x3A9B8B97A57A4696,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	setx	0x66CE02E679D9BEC4,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	fdivd	%f30,	%f18,	%f26
	fcmpd	%fcc3,	%f20,	%f12
loop_421:
	fblg,a	%fcc0,	loop_422
	udivx	%g3,	%i7,	%l2
	tgu	%xcc,	0x1
	fnot2	%f30,	%f30
loop_422:
	array8	%i1,	%i4,	%g6
	fcmpeq16	%f20,	%f26,	%i5
	bne	%xcc,	loop_423
	fmovdcc	%icc,	%f6,	%f12
	nop
	fitod	%f10,	%f12
	fdtox	%f12,	%f0
	fxtod	%f0,	%f12
	st	%fsr,	[%l7 + 0x1C]
loop_423:
	fnors	%f9,	%f29,	%f9

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xAD8, 	%hsys_tick_cmpr
	call	loop_424
	call	loop_425
	fnot1s	%f6,	%f2
	fmovdneg	%icc,	%f0,	%f6
loop_424:
	fmovsule	%fcc0,	%f8,	%f24
loop_425:
	call	loop_426
	move	%fcc0,	%o7,	%g7
	fnands	%f1,	%f25,	%f14
	fbule,pn	%fcc0,	loop_427
loop_426:
	movge	%fcc0,	0x6AA,	%l5
	nop
	setx	0x98E18E4C,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f1
	setx	0xBF24963B,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f24
	fdivs	%f24,	%f1,	%f7
	fmovrdlez	%o2,	%f26,	%f20
loop_427:
	call	loop_428
	call	loop_429
	fnot1s	%f22,	%f22
	tvs	%xcc,	0x6
loop_428:
	nop
	fitos	%f5,	%f30
	fstox	%f30,	%f12
loop_429:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xB9B, 	%hsys_tick_cmpr
	fmovrsgez	%i2,	%f26,	%f31
	fmovduge	%fcc0,	%f12,	%f12
	call	loop_430
	edge8	%l1,	%o5,	%l4
	nop
	fitos	%f14,	%f5
	fstox	%f5,	%f12
	fxtos	%f12,	%f30
	fornot2	%f4,	%f26,	%f24
loop_430:
	fmovsvs	%xcc,	%f6,	%f18
	call	loop_431
	fmovrdgz	%g5,	%f16,	%f2
	nop
	setx	0xBF4C323C7C78BA3E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0x70BB544C260A6B93,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	fdivd	%f12,	%f10,	%f4
	andncc	%o3,	%l0,	%g4
loop_431:
	call	loop_432
	movvs	%icc,	%i0,	%i6
	movl	%fcc2,	0x52D,	%l6
	add	%o4,	%g2,	%i3
loop_432:
	call	loop_433
	rdhpr	%hsys_tick_cmpr,	%o0
	call	loop_434
	ldub	[%l7 + 0x6A],	%g3
loop_433:
	call	loop_435
	rdhpr	%hpstate,	%i7
loop_434:
	call	loop_436
	fpadd32s	%f1,	%f20,	%f16
loop_435:
	call	loop_437
	call	loop_438
loop_436:
	flushw
	call	loop_439
loop_437:
	movu	%fcc2,	%l2,	%i1
loop_438:
	call	loop_440
	nop
	fitos	%f0,	%f25
	fstoi	%f25,	%f30
loop_439:
	fnand	%f20,	%f14,	%f14
	fcmpeq32	%f30,	%f10,	%l3
loop_440:
	tl	%icc,	0x1
	call	loop_441
	call	loop_442
	nop
	fitos	%f29,	%f19
	call	loop_443
loop_441:
	fmovsne	%icc,	%f11,	%f1
loop_442:
	tpos	%xcc,	0x6
	fbne,a,pt	%fcc2,	loop_444
loop_443:
	call	loop_445
	call	loop_446
loop_444:
	nop

loop_445:
	nop

loop_446:
	nop

	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 2:
!
!	Type l   	: 24
!	Type a   	: 21
!	Type x   	: 6
!	Type cti   	: 150
!	Type f   	: 173
!	Type i   	: 126
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

!
! Thread 3 Start
!
main_t3:
	mov 	%l7, 	%g1
	!# Set %cwp for 8 windows
	!# This threads memory space into each %l7
	wrpr 	%g0, 	0x7, 	%cwp
	mov 	%g1, 	%l7
	wrpr 	%g0, 	0x6, 	%cwp
	mov 	%g1, 	%l7
	wrpr 	%g0, 	0x5, 	%cwp
	mov 	%g1, 	%l7
	wrpr 	%g0, 	0x4, 	%cwp
	mov 	%g1, 	%l7
	wrpr 	%g0, 	0x3, 	%cwp
	mov 	%g1, 	%l7
	wrpr 	%g0, 	0x2, 	%cwp
	mov 	%g1, 	%l7
	wrpr 	%g0, 	0x1, 	%cwp
	mov 	%g1, 	%l7
	wrpr 	%g0, 	0x0, 	%cwp
	mov 	%g1, 	%l7

	!# Set %fsr
	setx 	0x0000000000000000,	%l0,	%l6	!# no post process
	stx 	%l6, 	[%l7 + 0x0]	!# no post process
	ldx 	[%l7 + 0x0], 	%fsr	!# no post process

	!# Initialize registers ..

	!# Global registers
	set	0xC,	%g1
	set	0x1,	%g2
	set	0x5,	%g3
	set	0x1,	%g4
	set	0x3,	%g5
	set	0x9,	%g6
	set	0xE,	%g7
	!# Input registers
	set	-0x4,	%i0
	set	-0xF,	%i1
	set	-0xB,	%i2
	set	-0x1,	%i3
	set	-0x9,	%i4
	set	-0x9,	%i5
	set	-0x1,	%i6
	set	-0x6,	%i7
	!# Local registers
	set	0x10B24228,	%l0
	set	0x0AEB8FBB,	%l1
	set	0x02A74415,	%l2
	set	0x693BD793,	%l3
	set	0x3B2C4079,	%l4
	set	0x044878CA,	%l5
	set	0x599C5B64,	%l6
	!# Output registers
	set	-0x062C,	%o0
	set	0x0C29,	%o1
	set	0x02DC,	%o2
	set	-0x0318,	%o3
	set	-0x1EFA,	%o4
	set	-0x1A84,	%o5
	set	0x15DC,	%o6
	set	-0x1105,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0xF9E0BBFB632344C2)
	INIT_TH_FP_REG(%l7,%f2,0x53C87029AA2FE833)
	INIT_TH_FP_REG(%l7,%f4,0xDE952A53A3AD06F4)
	INIT_TH_FP_REG(%l7,%f6,0x4829F0FA358AAB1A)
	INIT_TH_FP_REG(%l7,%f8,0x3E56A552936BFBAC)
	INIT_TH_FP_REG(%l7,%f10,0x5FEC588976E3FF0F)
	INIT_TH_FP_REG(%l7,%f12,0x59960BCB796288EC)
	INIT_TH_FP_REG(%l7,%f14,0x02BB7E99E16D67F4)
	INIT_TH_FP_REG(%l7,%f16,0x2B88127A028E0C9D)
	INIT_TH_FP_REG(%l7,%f18,0x1F7BC94AED1048E0)
	INIT_TH_FP_REG(%l7,%f20,0x6AAEFD748E8AA9B7)
	INIT_TH_FP_REG(%l7,%f22,0x42D30B68F5F003E5)
	INIT_TH_FP_REG(%l7,%f24,0x1FD9A46546DB3789)
	INIT_TH_FP_REG(%l7,%f26,0x74E49AFE0AE9E70A)
	INIT_TH_FP_REG(%l7,%f28,0x9610A29EE8E2CA43)
	INIT_TH_FP_REG(%l7,%f30,0x0E709079768FBC1E)

	!# Execute Main Diag ..

	fpadd16	%f16,	%f4,	%f20
	te	%icc,	0x6
	fpack32	%f14,	%f20,	%f18
	udivcc	%g6,	%i4,	%i5
	fpack16	%f12,	%f11
	tneg	%icc,	0x5
	call	loop_447
	fornot1	%f4,	%f24,	%f22
	membar	0x08
	nop
	set	0x08, %i1
	ldsw	[%l7 + %i1],	%o6
loop_447:
	smulcc	%o7,	%g7,	%g1
	fmovda	%icc,	%f22,	%f18
	edge32	%o2,	%l5,	%i2
	fnot2s	%f21,	%f27
	tvc	%icc,	0x3
	udivcc	%l1,	0x00,	%o1
	call	loop_448
	tn	%xcc,	0x5
	call	loop_449
	movcs	%icc,	0x664,	%l4
loop_448:
	movue	%fcc3,	%o5,	%o3
	wr	%l0,	%g5,	%set_softint
loop_449:
	fmovrsne	%g4,	%f16,	%f8
	xorcc	%i6,	%l6,	%o4
	movrlez	%i0,	0x245,	%i3
	nop
	setx	loop_450,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x001400001405,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movge	%fcc2,	0x4D4,	%o0
	sll	%g3,	%g2,	%l2
	fmovsleu	%icc,	%f9,	%f0
loop_450:
	movuge	%fcc2,	%i1,	%l3
	fmovdge	%fcc1,	%f10,	%f30
	tleu	%icc,	0x3
	wr	%g0,	0x89,	%asi
	lduwa	[%l7 + 0x54] %asi,	%g6
	xnor	%i7,	0x0DE4,	%i4
	fmovdvc	%xcc,	%f26,	%f16
	call	loop_451
	fmul8x16au	%f7,	%f18,	%f14
	fpadd32	%f0,	%f4,	%f2
	fnot2	%f6,	%f0
loop_451:
	orncc	%o6,	%o7,	%g7
	nop
	setx	0x3B066C7A,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f20
	setx	0x7FF27953,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f11
	fdivs	%f11,	%f20,	%f0
	call	loop_452
	nop
	set	0x14, %o6
	flush	%l7 + %o6
	faligndata	%f20,	%f14,	%f20
	nop
	fitos	%f16,	%f2
loop_452:
	orn	%i5,	0x14BD,	%g1
	orncc	%l5,	%o2,	%l1
	call	loop_453
	call	loop_454
	fmovdvs	%icc,	%f14,	%f2
	fmovdue	%fcc0,	%f0,	%f28
loop_453:
	call	loop_455
loop_454:
	fbo,a,pt	%fcc1,	loop_456
	rd	%sys_tick_cmpr,	%o1
	movug	%fcc1,	0x3A2,	%i2
loop_455:
	fmovsgu	%icc,	%f3,	%f2
loop_456:
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	nop
	set	0x08, %l3
	std	%l4,	[%l7 + %l3]

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	fbne,pt	%fcc0,	loop_457
	call	loop_458
	fnand	%f18,	%f2,	%f20
	fmovdle	%fcc3,	%f18,	%f22
loop_457:
	addc	%l0,	%g5,	%g4
loop_458:
	fmovscs	%xcc,	%f28,	%f26
	srax	%l6,	0x05,	%o4
	stx	%i6,	[%l7 + 0x10]
	fmovdug	%fcc3,	%f8,	%f20
	sdiv	%i0,	0x00,	%o0
	fmovdgu	%icc,	%f24,	%f8
	fmovdul	%fcc1,	%f16,	%f2
	fmovdcc	%icc,	%f16,	%f8
	siam	0x2
	faligndata	%f30,	%f24,	%f22
	fandnot2	%f14,	%f26,	%f8
	sub	%i3,	0x0C79,	%g3
	tvc	%xcc,	0x2
	mova	%fcc3,	%g2,	%l2
	fnegs	%f7,	%f18
	fmovrdgz	%l3,	%f20,	%f6
	movpos	%xcc,	0x3A1,	%i1
	subc	%g6,	%i7,	%o6
	addcc	%o7,	0x1591,	%i4
	movne	%fcc2,	%i5,	%g1
	call	loop_459
	call	loop_460
	rdhpr	%hintp,	%l5
	fmul8sux16	%f6,	%f24,	%f22
loop_459:
	call	loop_461
loop_460:
	move	%fcc0,	%o2,	%l1
	rd	%fprs,	%o1
	movuge	%fcc1,	0x45C,	%g7
loop_461:
	rdhpr	%hpstate,	%l4
	call	loop_462
	fmovdvs	%icc,	%f28,	%f6
	call	loop_463
	nop
	fitos	%f4,	%f25
loop_462:
	call	loop_464
	fmovrde	%i2,	%f4,	%f24
loop_463:
	fcmpeq16	%f22,	%f24,	%o3
	movrlez	%l0,	%g5,	%g4
loop_464:
	fandnot1s	%f25,	%f29,	%f4
	fpmerge	%f7,	%f3,	%f30
	set	0x40, %i2
	ldxa	[%l7 + %i2] 0x80,	%o5
	edge16n	%o4,	%i6,	%l6
	nop
	fitos	%f1,	%f1
	fstox	%f1,	%f20
	fxtos	%f20,	%f0
	call	loop_465
	sdivx	%o0,	%i0,	%g3
	mova	%icc,	0x3CF,	%g2
	fmovd	%f8,	%f18
loop_465:
	nop
	setx	0x3437BA78,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f0
	setx	0x1C6BAC03,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f8
	fsubs	%f8,	%f0,	%f19
	nop
	setx	0x8A5CE3EB,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f28
	fsqrts	%f28,	%f26
	fmovde	%fcc2,	%f10,	%f28
	fexpand	%f15,	%f22
	array8	%i3,	%l3,	%l2
	call	loop_466
	fmovdue	%fcc3,	%f12,	%f10
	movug	%fcc2,	0x6F6,	%i1
	nop
	setx	0x745141D1A0652705,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	fsqrtd	%f16,	%f6
loop_466:
	fcmpd	%fcc3,	%f16,	%f2
	movne	%fcc3,	%g6,	%i7
	fpackfix	%f18,	%f11
	fmovsu	%fcc3,	%f5,	%f5
	call	loop_467
	addc	%o6,	0x1085,	%o7
	call	loop_468
	movneg	%xcc,	0x397,	%i4
loop_467:
	call	loop_469
	call	loop_470
loop_468:
	fnot2s	%f4,	%f31
	nop
	fitos	%f12,	%f1
	fstox	%f1,	%f2
loop_469:
	nop
	setx	0xEE1F3FF4,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f6
	setx	0x5FBDE963,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f2
	fmuls	%f2,	%f6,	%f5
loop_470:
	fmovdo	%fcc2,	%f12,	%f10
	fmovrdlez	%i5,	%f10,	%f20
	movleu	%icc,	0x795,	%l5
	call	loop_471
	fmovdpos	%icc,	%f0,	%f6
	wr	%g0,	0x04,	%asi
	lduba	[%l7 + 0x0C] %asi,	%g1
loop_471:
	addcc	%l1,	%o1,	%o2
	sdiv	%g7,	%i2,	%l4
	call	loop_472
	call	loop_473
	fsrc2s	%f10,	%f11
	call	loop_474
loop_472:
	movn	%xcc,	0x508,	%o3
loop_473:
	nop
	setx	0xA82836E6CA1D104C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x08]
	ldx	[%l7 + 0x08],	%fsr
	wrpr	%l0,	0x1BF8,	%tick
loop_474:
	call	loop_475
	movue	%fcc2,	%g4,	%o5
	membar	0x36
	movrne	%g5,	0x278,	%o4
loop_475:
	fmovsug	%fcc3,	%f18,	%f24
	fnors	%f2,	%f17,	%f21
	fmuld8ulx16	%f11,	%f7,	%f22
	fabsd	%f20,	%f2
	fandnot1	%f20,	%f10,	%f22
	movu	%fcc3,	0x7D1,	%l6
	wrpr 	%g0, 	0x3, 	%gl
	fbn,pn	%fcc0,	loop_476
	fmovdue	%fcc1,	%f18,	%f22
	fmovdg	%xcc,	%f24,	%f26
	call	loop_477
loop_476:
	rd	%ccr,	%g3
	wr	%i0,	%i3,	%y
	fmovdpos	%icc,	%f2,	%f6
loop_477:
	call	loop_478
	fmovsne	%xcc,	%f24,	%f15
	fmovsvs	%xcc,	%f7,	%f5
	call	loop_479
loop_478:
	call	loop_480
	fornot1s	%f23,	%f14,	%f18
	fmovdvs	%icc,	%f30,	%f4
loop_479:
	call	loop_481
loop_480:
	smulcc	%l3,	%l2,	%g2
	edge8ln	%i1,	%g6,	%i7
	tl	%icc,	0x6
loop_481:
	call	loop_482
	udivcc	%o7,	%o6,	%i4
	nop
	set	0x40, %i5
	std	%i4,	[%l7 + %i5]
	fpack32	%f24,	%f22,	%f26
loop_482:
	rdhpr	%hintp,	%l5
	move	%fcc0,	%l1,	%o1
	smul	%g1,	%g7,	%o2
	call	loop_483
	movg	%fcc1,	%l4,	%i2
	call	loop_484
	call	loop_485
loop_483:
	ta	%icc,	0x5
	taddcc	%o3,	0x1A2A,	%g4
loop_484:
	fbul,a,pt	%fcc1,	loop_486
loop_485:
	call	loop_487
	movle	%icc,	%l0,	%g5
	fmovdl	%icc,	%f6,	%f12
loop_486:
	nop
	wr	%g0,	0x10,	%asi
	ldstuba	[%l7 + 0x5E] %asi,	%o4
loop_487:
	call	loop_488
	array8	%l6,	%i6,	%o5
	call	loop_489
	faligndata	%f0,	%f4,	%f28
loop_488:
	tge	%xcc,	0x1
	call	loop_490
loop_489:
	sth	%o0,	[%l7 + 0x38]
	nop
	fitod	%f6,	%f10
	fdtos	%f10,	%f3
	fnot2s	%f26,	%f22
loop_490:
	fmovsule	%fcc0,	%f17,	%f21
	fzeros	%f11
	wr	%g3,	%i0,	%y
	fmovrslz	%l3,	%f23,	%f6
	fmovda	%icc,	%f2,	%f4
	bg,pn	%xcc,	loop_491
	call	loop_492
	fand	%f6,	%f18,	%f2
	bshuffle	%f10,	%f26,	%f2
loop_491:
	call	loop_493
loop_492:
	call	loop_494
	nop
	fitod	%f4,	%f16
	fdtox	%f16,	%f2
	fxtod	%f2,	%f18
	fmovs	%f12,	%f18
loop_493:
	call	loop_495
loop_494:
	nop
	fitos	%f9,	%f10
	fstox	%f10,	%f20
	fbue	%fcc3,	loop_496
	call	loop_497
loop_495:
	fmovrslz	%l2,	%f0,	%f4
	call	loop_498
loop_496:
	array16	%g2,	%i1,	%g6
loop_497:
	call	loop_499
	call	loop_500
loop_498:
	fnand	%f8,	%f22,	%f14
	fmovsneg	%icc,	%f22,	%f10
loop_499:
	call	loop_501
loop_500:
	bleu,pn	%xcc,	loop_502
	tne	%icc,	0x3
	bgu	%xcc,	loop_503
loop_501:
	sir	0x1980
loop_502:
	sub	%i7,	%i3,	%o7
	edge32ln	%i4,	%i5,	%o6
loop_503:
	bgu,a	%icc,	loop_504
	fpsub32	%f2,	%f18,	%f20
	fpsub16s	%f1,	%f3,	%f2
	sdivcc	%l1,	%o1,	%g1
loop_504:
	movle	%xcc,	%l5,	%o2
	xnorcc	%l4,	%i2,	%g7
	fmovsg	%xcc,	%f30,	%f2
	call	loop_505
	fmovsue	%fcc2,	%f10,	%f30
	movneg	%icc,	%o3,	%g4
	set	0x70, %i6
	lduba	[%l7 + %i6] 0x04,	%l0
loop_505:
	call	loop_506
	movrlz	%o4,	%l6,	%i6
	call	loop_507
	fmovslg	%fcc1,	%f14,	%f25
loop_506:
	call	loop_508
	tneg	%icc,	0x6
loop_507:
	fmovscs	%icc,	%f8,	%f2
	call	loop_509
loop_508:
	bvc,a	%xcc,	loop_510
	fcmpne32	%f8,	%f28,	%o5
	sllx	%g5,	%o0,	%g3
loop_509:
	nop
	set	0x4A, %o1
	lduh	[%l7 + %o1],	%l3
loop_510:
	edge16ln	%i0,	%l2,	%g2
	xnorcc	%g6,	0x14D3,	%i7
	sllx	%i3,	%i1,	%i4
	call	loop_511
	fbg,a,pt	%fcc0,	loop_512
	fmovrsgez	%o7,	%f15,	%f16
	wr	%g0,	0x2b,	%asi
	stha	%i5,	[%l7 + 0x7C] %asi
	membar	#Sync
loop_511:
	fmovdg	%fcc0,	%f24,	%f30
loop_512:
	fmovrsgz	%o6,	%f4,	%f19
	rd	%ccr,	%o1
	call	loop_513
	call	loop_514
	call	loop_515
	smulcc	%l1,	0x1E2C,	%l5
loop_513:
	fors	%f26,	%f11,	%f29
loop_514:
	fbue,a,pn	%fcc3,	loop_516
loop_515:
	fmovsleu	%icc,	%f24,	%f29
	nop
	set	0x50, %i3
	ldd	[%l7 + %i3],	%f16
	rdhpr	%hsys_tick_cmpr,	%g1
loop_516:
	fzeros	%f14
	movug	%fcc0,	0x508,	%o2
	tne	%xcc,	0x4
	movre	%l4,	0x200,	%i2
	movul	%fcc0,	%o3,	%g7
	ta	%xcc,	0x4
	movlg	%fcc0,	0x165,	%l0
	mova	%fcc3,	0x276,	%o4
	call	loop_517
	movcs	%xcc,	0x4C2,	%g4
	edge8l	%i6,	%o5,	%l6
	fmovsge	%xcc,	%f15,	%f31
loop_517:
	tvc	%icc,	0x1
	fmul8x16au	%f24,	%f12,	%f14
	call	loop_518
	call	loop_519
	call	loop_520
	tvc	%xcc,	0x0
loop_518:
	fbue,pt	%fcc2,	loop_521
loop_519:
	fnot2s	%f15,	%f25
loop_520:
	call	loop_522
	call	loop_523
loop_521:
	fmul8x16al	%f16,	%f10,	%f28
	fpadd32s	%f15,	%f21,	%f8
loop_522:
	call	loop_524
loop_523:
	fmovsgu	%xcc,	%f21,	%f8
	nop
	setx	loop_525,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x014200001406,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fnot2	%f12,	%f6
loop_524:
	fmovdcc	%xcc,	%f24,	%f16
	nop
	fitod	%f0,	%f16
	fdtos	%f16,	%f20
loop_525:
	call	loop_526
	fmovdg	%icc,	%f6,	%f16
	call	loop_527
	sdivcc	%g5,	%o0,	%l3
loop_526:
	bcc,a	%xcc,	loop_528
	call	loop_529
loop_527:
	fmovrsne	%g3,	%f14,	%f11
	fmovdpos	%icc,	%f22,	%f14
loop_528:
	tcc	%icc,	0x4
loop_529:
	edge32n	%i0,	%g2,	%l2
	call	loop_530
	fpadd16	%f6,	%f30,	%f0
	fmovduge	%fcc0,	%f16,	%f16
	fmovso	%fcc2,	%f15,	%f21
loop_530:
	siam	0x7
	call	loop_531
	tpos	%xcc,	0x7
	fmovrdne	%g6,	%f2,	%f2
	fmovdne	%xcc,	%f12,	%f8
loop_531:
	fornot2	%f0,	%f26,	%f30
	call	loop_532
	fmul8sux16	%f12,	%f10,	%f18
	fmovrdgz	%i7,	%f4,	%f8
	tle	%icc,	0x4
loop_532:
	fpsub32s	%f4,	%f16,	%f27

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	call	loop_533
	fmovspos	%xcc,	%f26,	%f11
	edge8n	%i4,	%o7,	%o6
	rd	%asi,	%i5
loop_533:
	call	loop_534
	fpack16	%f18,	%f30
	popc	0x084A,	%o1
	fmovdue	%fcc1,	%f30,	%f22
loop_534:
	call	loop_535
	fmovdcs	%xcc,	%f0,	%f28
	fors	%f11,	%f24,	%f0
	call	loop_536
loop_535:
	nop
	set	0x3A, %g1
	lduh	[%l7 + %g1],	%l5
	fandnot2	%f18,	%f26,	%f24
	rdhpr	%hintp,	%g1
loop_536:
	call	loop_537
	rd	%y,	%l1
	fmovsl	%icc,	%f30,	%f15
	srlx	%l4,	%o2,	%i2
loop_537:
	ldub	[%l7 + 0x14],	%g7
	movrlez	%l0,	%o4,	%o3
	ldsw	[%l7 + 0x30],	%i6
	nop
	setx	0x838D9F7911DE75BD,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0x444FDDB249B11147,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	fmuld	%f6,	%f24,	%f18
	rdhpr	%hpstate,	%g4
	edge16ln	%o5,	%g5,	%l6
	movl	%xcc,	%l3,	%g3
	call	loop_538
	fmovdcs	%icc,	%f2,	%f14
	fmovdule	%fcc0,	%f20,	%f18
	fmul8x16	%f16,	%f6,	%f14
loop_538:
	call	loop_539
	call	loop_540
	rd	%ccr,	%o0
	movlg	%fcc2,	0x561,	%i0
loop_539:
	wrpr	%g2,	0x1272,	%pil
loop_540:
	fmul8x16	%f14,	%f4,	%f12
	call	loop_541
	fmovdo	%fcc2,	%f16,	%f0
	fmovsl	%xcc,	%f25,	%f7
	rdhpr	%ver,	%g6
loop_541:
	ta	%xcc,	0x5
	subcc	%l2,	%i7,	%i3
	nop
	set	0x66, %o3
	lduh	[%l7 + %o3],	%i1
	fbule	%fcc0,	loop_542
	rdpr	%cansave,	%o7
	call	loop_543
	fbn,a	%fcc1,	loop_544
loop_542:
	nop
	fitod	%f8,	%f20
	fdtos	%f20,	%f16
	alignaddrl	%i4,	%o6,	%i5
loop_543:
	fpadd32	%f8,	%f20,	%f24
loop_544:
	fmovscs	%xcc,	%f18,	%f7
	movn	%icc,	%o1,	%l5
	fsrc1	%f22,	%f30
	fandnot1s	%f0,	%f3,	%f9
	call	loop_545
	fmovdg	%icc,	%f24,	%f4
	set	0x70, %g6
	ldda	[%l7 + %g6] 0x22,	%g0
loop_545:
	fcmpeq32	%f12,	%f26,	%l4
	udiv	%l1,	%o2,	%i2
	tneg	%xcc,	0x0
	bcc,a	%icc,	loop_546
	call	loop_547
	fmovrsgz	%g7,	%f2,	%f5
	movgu	%icc,	0x47A,	%o4
loop_546:
	rd	%sys_tick_cmpr,	%o3
loop_547:
	movule	%fcc1,	0x495,	%l0
	bneg,a	%icc,	loop_548
	fmovdule	%fcc1,	%f14,	%f30
	tneg	%xcc,	0x4
	call	loop_549
loop_548:
	call	loop_550
	membar	0x11
	fcmpgt16	%f16,	%f16,	%g4
loop_549:
	call	loop_551
loop_550:
	fmovscs	%xcc,	%f0,	%f3
	movvc	%xcc,	%o5,	%g5
	fpsub16s	%f25,	%f26,	%f2
loop_551:
	fmovdne	%fcc2,	%f22,	%f10
	fabsd	%f12,	%f8

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	brlez,a	%g3,	loop_552
	fzero	%f8
	be	%icc,	loop_553
	call	loop_554
loop_552:
	fmovdgu	%xcc,	%f12,	%f20
	call	loop_555
loop_553:
	rd	%tick_cmpr,	%l3
loop_554:
	bvs,a,pt	%xcc,	loop_556
	taddcc	%o0,	%i0,	%g2
loop_555:
	call	loop_557
	ba	%xcc,	loop_558
loop_556:
	fmovrslez	%g6,	%f26,	%f28
	call	loop_559
loop_557:
	fnot2	%f2,	%f16
loop_558:
	movrlez	%i7,	%i3,	%l2
	edge8ln	%i1,	%i4,	%o7
loop_559:
	movre	%i5,	0x3E4,	%o6
	call	loop_560
	call	loop_561
	fmovdvs	%icc,	%f30,	%f20
	edge8ln	%l5,	%o1,	%g1
loop_560:
	bgu,a,pt	%xcc,	loop_562
loop_561:
	fmovsneg	%icc,	%f7,	%f23
	fmovsle	%fcc3,	%f14,	%f27
	rd	%sys_tick_cmpr,	%l1
loop_562:
	fcmpne32	%f28,	%f26,	%l4
	nop
	set	0x40, %g2
	ldd	[%l7 + %g2],	%o2
	fmovrslz	%i2,	%f10,	%f28
	sllx	%o4,	0x09,	%g7
	fcmpne32	%f0,	%f14,	%o3
	subccc	%l0,	%o5,	%g4
	call	loop_563
	fmovdl	%xcc,	%f22,	%f0
	fmovsge	%xcc,	%f31,	%f22
	taddcctv	%g5,	0x099A,	%l6
loop_563:
	call	loop_564
	call	loop_565
	movule	%fcc1,	%i6,	%g3
	fornot2	%f6,	%f10,	%f20
loop_564:
	movrne	%o0,	0x047,	%i0
loop_565:
	array32	%g2,	%l3,	%i7
	nop
	setx	0x9C591C3C4A6B7DF7,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	setx	0x3ADD42BBF0067E14,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	faddd	%f12,	%f18,	%f28
	bleu,a	%icc,	loop_566
	fsrc2	%f24,	%f14
	call	loop_567
	call	loop_568
loop_566:
	fmovrdgez	%i3,	%f20,	%f22
	nop
	fitos	%f5,	%f28
	fstoi	%f28,	%f20
loop_567:
	nop
	add	%l7,	0x30,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%g6
	casxa	[%l6] 0x81,	%g6,	%i1
loop_568:
	movcc	%xcc,	0x166,	%l2
	call	loop_569
	tsubcc	%i4,	%i5,	%o6
	udivcc	%o7,	%o1,	%g1
	nop
	fitod	%f2,	%f26
	fdtox	%f26,	%f14
loop_569:
	movpos	%icc,	0x405,	%l5
	call	loop_570
	srlx	%l1,	%o2,	%l4
	movo	%fcc2,	0x136,	%i2
	fcmpeq16	%f28,	%f12,	%g7
loop_570:
	fmovsa	%fcc1,	%f11,	%f21
	call	loop_571
	nop
	setx	0xC13DEB09AD30CA28,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldx	[%l7 + 0x28],	%fsr
	fnot2s	%f15,	%f12
	fsrc2	%f4,	%f12
loop_571:
	call	loop_572
	call	loop_573
	call	loop_574
	tl	%xcc,	0x2
loop_572:
	tvc	%icc,	0x2
loop_573:
	sethi	0x0A0D,	%o4
loop_574:
	fmovdge	%fcc3,	%f24,	%f14
	popc	0x0361,	%o3
	fmovdcc	%icc,	%f28,	%f12
	nop
	set	0x58, %g3
	prefetch	[%l7 + %g3],	 3
	std	%l0,	[%l7 + 0x70]
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	wr	%g0,	0x19,	%asi
	stda	%o4,	[%l7 + 0x08] %asi
	subc	%g5,	0x14B4,	%l6
	movvc	%xcc,	0x208,	%g4
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 3:
!
!	Type l   	: 26
!	Type a   	: 27
!	Type x   	: 9
!	Type cti   	: 128
!	Type f   	: 172
!	Type i   	: 138
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

!
! Thread 4 Start
!
main_t4:
	mov 	%l7, 	%g1
	!# Set %cwp for 8 windows
	!# This threads memory space into each %l7
	wrpr 	%g0, 	0x7, 	%cwp
	mov 	%g1, 	%l7
	wrpr 	%g0, 	0x6, 	%cwp
	mov 	%g1, 	%l7
	wrpr 	%g0, 	0x5, 	%cwp
	mov 	%g1, 	%l7
	wrpr 	%g0, 	0x4, 	%cwp
	mov 	%g1, 	%l7
	wrpr 	%g0, 	0x3, 	%cwp
	mov 	%g1, 	%l7
	wrpr 	%g0, 	0x2, 	%cwp
	mov 	%g1, 	%l7
	wrpr 	%g0, 	0x1, 	%cwp
	mov 	%g1, 	%l7
	wrpr 	%g0, 	0x0, 	%cwp
	mov 	%g1, 	%l7

	!# Set %fsr
	setx 	0x0000000000000000,	%l0,	%l6	!# no post process
	stx 	%l6, 	[%l7 + 0x0]	!# no post process
	ldx 	[%l7 + 0x0], 	%fsr	!# no post process

	!# Initialize registers ..

	!# Global registers
	set	0x1,	%g1
	set	0x2,	%g2
	set	0x5,	%g3
	set	0x3,	%g4
	set	0x2,	%g5
	set	0x1,	%g6
	set	0x5,	%g7
	!# Input registers
	set	-0x7,	%i0
	set	-0xE,	%i1
	set	-0xF,	%i2
	set	-0x2,	%i3
	set	-0x4,	%i4
	set	-0xF,	%i5
	set	-0xF,	%i6
	set	-0xD,	%i7
	!# Local registers
	set	0x04255D04,	%l0
	set	0x60574D20,	%l1
	set	0x14D19D9D,	%l2
	set	0x04DE3D3D,	%l3
	set	0x34265047,	%l4
	set	0x76B1C3EE,	%l5
	set	0x44C0A4E4,	%l6
	!# Output registers
	set	0x08C5,	%o0
	set	-0x0217,	%o1
	set	-0x033B,	%o2
	set	-0x1DA1,	%o3
	set	0x0F0A,	%o4
	set	0x04D5,	%o5
	set	-0x1C06,	%o6
	set	-0x104D,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0xF9E0BBFB632344C2)
	INIT_TH_FP_REG(%l7,%f2,0x53C87029AA2FE833)
	INIT_TH_FP_REG(%l7,%f4,0xDE952A53A3AD06F4)
	INIT_TH_FP_REG(%l7,%f6,0x4829F0FA358AAB1A)
	INIT_TH_FP_REG(%l7,%f8,0x3E56A552936BFBAC)
	INIT_TH_FP_REG(%l7,%f10,0x5FEC588976E3FF0F)
	INIT_TH_FP_REG(%l7,%f12,0x59960BCB796288EC)
	INIT_TH_FP_REG(%l7,%f14,0x02BB7E99E16D67F4)
	INIT_TH_FP_REG(%l7,%f16,0x2B88127A028E0C9D)
	INIT_TH_FP_REG(%l7,%f18,0x1F7BC94AED1048E0)
	INIT_TH_FP_REG(%l7,%f20,0x6AAEFD748E8AA9B7)
	INIT_TH_FP_REG(%l7,%f22,0x42D30B68F5F003E5)
	INIT_TH_FP_REG(%l7,%f24,0x1FD9A46546DB3789)
	INIT_TH_FP_REG(%l7,%f26,0x74E49AFE0AE9E70A)
	INIT_TH_FP_REG(%l7,%f28,0x9610A29EE8E2CA43)
	INIT_TH_FP_REG(%l7,%f30,0x0E709079768FBC1E)

	!# Execute Main Diag ..

	set	0x70, %o4
	stxa	%i6,	[%l7 + %o4] 0x22
	membar	#Sync
	rdpr	%pil,	%o0
	fmovdn	%xcc,	%f20,	%f0
	fandnot1	%f0,	%f10,	%f12
	wr	%i0,	%g2,	%pic
	sethi	0x0726,	%l3
	wrpr	%i7,	%g3,	%cwp
	andn	%g6,	0x170A,	%i1
	ba,pt	%xcc,	loop_575
	fmuld8sux16	%f13,	%f29,	%f6
	bn,a,pt	%xcc,	loop_576
	fbn,a	%fcc0,	loop_577
loop_575:
	fmovrdne	%i3,	%f8,	%f10
	movn	%fcc3,	%l2,	%i4
loop_576:
	xor	%i5,	%o6,	%o1
loop_577:
	fbo,pt	%fcc3,	loop_578
	call	loop_579
	membar	0x01
	edge16n	%g1,	%l5,	%o7
loop_578:
	fbug,a	%fcc0,	loop_580
loop_579:
	subcc	%o2,	0x15CB,	%l4
	nop
	set	0x70, %l1
	stx	%fsr,	[%l7 + %l1]
	call	loop_581
loop_580:
	fbl,pt	%fcc2,	loop_582
	sdivx	%l1,	%g7,	%i2
	call	loop_583
loop_581:
	rd	%asi,	%o3
loop_582:
	fnot1s	%f17,	%f28
	fblg,a,pn	%fcc2,	loop_584
loop_583:
	movneg	%xcc,	0x714,	%l0
	wrpr 	%g0, 	0x0, 	%gl
	pdist	%f8,	%f12,	%f0
loop_584:
	movcc	%xcc,	0x74D,	%g5
	andncc	%g4,	%l6,	%o0
	fandnot1s	%f30,	%f29,	%f9
	call	loop_585
	call	loop_586
	call	loop_587
	fmovsvc	%xcc,	%f16,	%f29
loop_585:
	bge,a	%xcc,	loop_588
loop_586:
	fmovsvc	%xcc,	%f6,	%f30
loop_587:
	call	loop_589
	fones	%f13
loop_588:
	call	loop_590
	nop
	fitos	%f3,	%f29
	fstox	%f29,	%f12
loop_589:
	fbo,pt	%fcc0,	loop_591
	call	loop_592
loop_590:
	fmovsu	%fcc1,	%f25,	%f13
	fxors	%f28,	%f27,	%f17
loop_591:
	call	loop_593
loop_592:
	call	loop_594
	call	loop_595
	nop
	set	0x10, %g4
	flush	%l7 + %g4
loop_593:
	fmovrslz	%i0,	%f18,	%f15
loop_594:
	fbl,a	%fcc0,	loop_596
loop_595:
	wrpr 	%g0, 	0x1, 	%gl
	call	loop_597
	nop
	fitod	%f2,	%f20
	fdtox	%f20,	%f28
loop_596:
	fbn,a	%fcc3,	loop_598
	fmovsa	%fcc0,	%f20,	%f11
loop_597:
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	fornot2	%f8,	%f18,	%f26
loop_598:
	orn	%i7,	0x1C2F,	%l3
	fmovdn	%fcc2,	%f22,	%f14
	srlx	%g3,	0x11,	%g6
	fmovdule	%fcc1,	%f2,	%f24
	rd	%ccr,	%i1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fcmple16	%f18,	%f28,	%i3
	call	loop_599
	tn	%icc,	0x1
	srlx	%i5,	0x11,	%o6
	orn	%o1,	0x0CAB,	%g1
loop_599:
	movvs	%xcc,	%i4,	%l5
	smul	%o2,	%l4,	%o7
	edge32	%g7,	%i2,	%l1
	fpadd32	%f28,	%f14,	%f28
	call	loop_600
	addcc	%o3,	0x0568,	%o4
	sethi	0x157F,	%o5
	call	loop_601
loop_600:
	fabsd	%f26,	%f20
	mulx	%l0,	0x00B6,	%g4
	fcmpne16	%f8,	%f30,	%l6
loop_601:
	bneg,a	%xcc,	loop_602
	rd	%ccr,	%g5
	tcs	%icc,	0x0
	call	loop_603
loop_602:
	fmovspos	%icc,	%f3,	%f22
	popc	%o0,	%i6
	fcmpne32	%f24,	%f10,	%i0
loop_603:
	movuge	%fcc0,	%i7,	%g2
	fpadd32	%f10,	%f24,	%f0
	call	loop_604
	fmovdne	%fcc3,	%f16,	%f22
	movrgz	%g3,	0x247,	%l3
	fnot2s	%f25,	%f19
loop_604:
	popc	0x0A68,	%g6
	call	loop_605
	fmovsue	%fcc3,	%f14,	%f7
	movul	%fcc3,	0x676,	%i1
	edge8ln	%i3,	%l2,	%o6
loop_605:
	call	loop_606
	nop
	fitos	%f3,	%f6
	fstod	%f6,	%f24
	rdhpr	%htba,	%i5
	tpos	%icc,	0x5
loop_606:
	call	loop_607
	addcc	%o1,	0x0114,	%i4
	call	loop_608
	movrgz	%g1,	0x3C0,	%l5
loop_607:
	nop
	wr	%g0,	0x88,	%asi
	ldsba	[%l7 + 0x26] %asi,	%o2
loop_608:
	bpos,a,pt	%icc,	loop_609
	fpadd32s	%f12,	%f10,	%f0
	call	loop_610
	movle	%xcc,	%o7,	%g7
loop_609:
	fmovdcc	%icc,	%f0,	%f20
	call	loop_611
loop_610:
	call	loop_612
	call	loop_613
	tsubcctv	%l4,	0x045A,	%l1
loop_611:
	call	loop_614
loop_612:
	fmovscc	%xcc,	%f11,	%f0
loop_613:
	call	loop_615
	edge32	%i2,	%o4,	%o3
loop_614:
	fnegd	%f18,	%f12
	fsrc2	%f0,	%f24
loop_615:
	fmovsneg	%xcc,	%f23,	%f20
	call	loop_616
	rdhpr	%ver,	%o5
	movleu	%xcc,	%g4,	%l0
	and	%g5,	0x0099,	%l6
loop_616:
	nop
	set	0x48, %o7
	stx	%fsr,	[%l7 + %o7]
	rd	%ccr,	%i6
	movcs	%icc,	0x53E,	%o0
	call	loop_617
	fmovdn	%fcc1,	%f18,	%f28
	brgz,a,pn	%i0,	loop_618
	fmovdg	%fcc1,	%f2,	%f28
loop_617:
	fmovde	%xcc,	%f22,	%f4
	fcmpeq16	%f4,	%f10,	%i7
loop_618:
	fpadd32s	%f16,	%f0,	%f0
	call	loop_619
	xorcc	%g2,	%l3,	%g3
	rdhpr	%hsys_tick_cmpr,	%g6
	tcc	%icc,	0x2
loop_619:
	call	loop_620
	call	loop_621
	tg	%xcc,	0x0
	call	loop_622
loop_620:
	smulcc	%i3,	%i1,	%l2
loop_621:
	fmovda	%xcc,	%f12,	%f6
	call	loop_623
loop_622:
	call	loop_624
	fmovsne	%fcc3,	%f13,	%f27
	xnor	%i5,	0x07CD,	%o6
loop_623:
	nop
	fitos	%f8,	%f6
loop_624:
	alignaddrl	%i4,	%g1,	%o1
	nop
	setx	0xB7802C44,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f16
	setx	0xA42E6417,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f8
	fdivs	%f8,	%f16,	%f10
	call	loop_625
	fmovdg	%icc,	%f26,	%f10
	nop
	fitos	%f4,	%f20
	fstox	%f20,	%f22
	call	loop_626
loop_625:
	tn	%xcc,	0x6
	rdpr	%otherwin,	%l5
	rdpr	%cansave,	%o7
loop_626:
	call	loop_627
	movu	%fcc2,	%g7,	%l4
	call	loop_628
	nop
	setx	0x89D2263895432509,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0xE84A25389A8A5CD0,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	fmuld	%f12,	%f0,	%f18
loop_627:
	fmovd	%f10,	%f10
	brnz	%o2,	loop_629
loop_628:
	stx	%fsr,	[%l7 + 0x18]
	set	0x18, %i4
	stda	%i2,	[%l7 + %i4] 0x11
loop_629:
	call	loop_630
	fmovdcs	%xcc,	%f14,	%f24
	tsubcctv	%o4,	0x1CE5,	%o3
	call	loop_631
loop_630:
	movrlz	%l1,	0x02C,	%g4
	stx	%l0,	[%l7 + 0x30]
	fnor	%f16,	%f18,	%f18
loop_631:
	flushw
	swap	[%l7 + 0x48],	%o5
	call	loop_632
	call	loop_633
	fmovsne	%fcc2,	%f4,	%f5
	nop
	setx	0x824BAD6C683653AB,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0xE9CDF2BEB477CC94,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	fdivd	%f30,	%f2,	%f14
loop_632:
	call	loop_634
loop_633:
	rd	%fprs,	%g5
	nop
	fitod	%f4,	%f26
	fdtox	%f26,	%f20
	wr	%g0,	0x23,	%asi
	stxa	%i6,	[%l7 + 0x60] %asi
	membar	#Sync
loop_634:
	nop
	setx	0x96A0A9048E6F149A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0xF56B4F14EC24BA21,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	fdivd	%f30,	%f0,	%f14
	call	loop_635
	bl,a	%xcc,	loop_636
	call	loop_637
	call	loop_638
loop_635:
	call	loop_639
loop_636:
	fbge,a	%fcc3,	loop_640
loop_637:
	fmovrse	%l6,	%f29,	%f11
loop_638:
	nop
	set	0x22, %l2
	ldstuba	[%l7 + %l2] 0x04,	%o0
loop_639:
	tgu	%icc,	0x1
loop_640:
	fmovdule	%fcc3,	%f8,	%f10
	fmovdue	%fcc0,	%f12,	%f24
	nop
	setx	0x37FDFECB2ED0B588,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0x011A675776C6679B,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	faddd	%f4,	%f30,	%f10
	movrgz	%i7,	%i0,	%l3
	wr	%g0,	0x1e,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
	fmovspos	%xcc,	%f26,	%f17
	call	loop_641
	fba	%fcc3,	loop_642
	nop
	setx	loop_643,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x021400001401,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	tvc	%xcc,	0x7
loop_641:
	move	%icc,	%g2,	%g3
loop_642:
	call	loop_644
loop_643:
	call	loop_645
	fnot2	%f16,	%f10
	fbul	%fcc3,	loop_646
loop_644:
	fmuld8ulx16	%f31,	%f30,	%f10
loop_645:
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	movre	%i3,	%g6,	%i1
loop_646:
	fmovdvc	%icc,	%f10,	%f4
	call	loop_647
	call	loop_648
	fbul,pn	%fcc3,	loop_649
	call	loop_650
loop_647:
	tcc	%icc,	0x7
loop_648:
	fmovdpos	%xcc,	%f26,	%f28
loop_649:
	nop
	set	0x40, %o2
	stda	%f0,	[%l7 + %o2] 0xc3
loop_650:
	fmovsule	%fcc2,	%f5,	%f26
	call	loop_651
	bn,pn	%xcc,	loop_652
	rdpr	%pil,	%i5
	udiv	%o6,	0x00,	%l2
loop_651:
	fmuld8ulx16	%f20,	%f7,	%f14
loop_652:
	fbl,pn	%fcc1,	loop_653
	fpadd32	%f18,	%f2,	%f20
	fbul	%fcc2,	loop_654
	call	loop_655
loop_653:
	call	loop_656
	fble,a,pt	%fcc1,	loop_657
loop_654:
	tle	%icc,	0x3
loop_655:
	edge16	%g1,	%i4,	%l5
loop_656:
	fpsub16s	%f5,	%f6,	%f1
loop_657:
	call	loop_658
	wr	%o7,	0x0AAB,	%ccr
	fpack32	%f2,	%f14,	%f10
	fxnor	%f16,	%f16,	%f24
loop_658:
	fbug,a,pt	%fcc0,	loop_659
	wrpr 	%g0, 	0x2, 	%gl
	fmovso	%fcc0,	%f25,	%f21
	movrlez	%l4,	0x1D2,	%g7
loop_659:
	fmovsu	%fcc3,	%f2,	%f14
	call	loop_660
	sub	%i2,	0x0C74,	%o4
	fandnot1s	%f25,	%f26,	%f10
	subccc	%o3,	%l1,	%o2
loop_660:
	edge16ln	%g4,	%o5,	%g5
	call	loop_661
	bmask	%i6,	%l6,	%l0
	srax	%i7,	%o0,	%i0
	fmovdcs	%xcc,	%f14,	%f12
loop_661:
	fors	%f15,	%f4,	%f18
	fmovdu	%fcc1,	%f12,	%f28
	wr	%l3,	0x0940,	%y
	fmovslg	%fcc2,	%f24,	%f30
	fmovrslz	%g2,	%f28,	%f7
	stbar
	tneg	%xcc,	0x7
	call	loop_662
	ta	%icc,	0x1
	edge32	%i3,	%g6,	%i1
	fcmpeq16	%f20,	%f2,	%i5
loop_662:
	fmovscs	%xcc,	%f16,	%f9
	nop
	fitos	%f14,	%f0
	fstod	%f0,	%f10
	fmovscc	%xcc,	%f24,	%f3
	nop
	setx	loop_663,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x031200001402,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	rdpr	%tt,	%l1
	wrpr	%g0,	%l1,	%tt
	rdpr	%pstate,	%l1
	wrpr	%g0,	%l1,	%pstate
	rdpr	%tl,	%l1
	wrpr	%g0,	%l1,	%tl
	rdpr	%tpc,	%l1
	wrpr	%g0,	%l1,	%tpc
	rdpr	%tnpc,	%l1
	wrpr	%g0,	%l1,	%tnpc
	rdpr	%tstate,	%l1
	wrpr	%g0,	%l1,	%tstate
	rdpr	%tba,	%l1
	wrpr	%g0,	%l1,	%tba
	rdpr	%tba,	%l1
	wrpr	%g0,	%l1,	%tba
	rdhpr	%hpstate,	%l1
	wrhpr	%g0,	%l1,	%hpstate
	rdhpr	%htstate,	%l1
	wrhpr	%g0,	%l1,	%htstate
	rdhpr	%hintp,	%l1
	wrhpr	%g0,	%l1,	%hintp
	done
	edge8	%g3,	%l2,	%o6
	fmul8ulx16	%f30,	%f16,	%f16
	call	loop_664
loop_663:
	call	loop_665
	call	loop_666
	sdivx	%g1,	%l5,	%o7
loop_664:
	call	loop_667
loop_665:
	movuge	%fcc2,	%i4,	%o1
loop_666:
	taddcc	%g7,	%l4,	%o4
	call	loop_668
loop_667:
	taddcctv	%o3,	0x1AFA,	%l1
	call	loop_669
	popc	0x001B,	%o2
loop_668:
	fmovsuge	%fcc2,	%f8,	%f5
	fmovrdlez	%g4,	%f6,	%f18
loop_669:
	be	%icc,	loop_670
	call	loop_671
	call	loop_672
	sir	0x172E
loop_670:
	fors	%f12,	%f28,	%f12
loop_671:
	fmovdl	%fcc2,	%f16,	%f30
loop_672:
	call	loop_673
	call	loop_674
	ldsb	[%l7 + 0x4A],	%i2
	addcc	%o5,	0x04FC,	%g5
loop_673:
	fcmpgt32	%f18,	%f16,	%l6
loop_674:
	rdpr	%tl,	%l0
	add	%l7,	0x18,	%l6
	wr	%g0,	0x11,	%asi
	ldxa	[%l6] %asi,	%i6
	casxa	[%l6] 0x11,	%i6,	%i7
	call	loop_675
	nop
	setx	0x3D5C026EB3C3A7F6,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0x538E5716C2A640FF,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	fsubd	%f28,	%f26,	%f2
	fmovdcs	%xcc,	%f12,	%f30
	edge32l	%o0,	%i0,	%l3
loop_675:
	te	%xcc,	0x1
	call	loop_676
	fnands	%f5,	%f24,	%f2
	set	0x69, %o5
	lduba	[%l7 + %o5] 0x88,	%i3
loop_676:
	rd	%asi,	%g2
	fmuld8sux16	%f11,	%f23,	%f18
	call	loop_677
	fmul8ulx16	%f16,	%f18,	%f4
	rdpr	%cleanwin,	%i1
	edge16l	%g6,	%i5,	%l2
loop_677:
	fxor	%f6,	%f26,	%f22
	call	loop_678
	membar	0x1A
	call	loop_679
	call	loop_680
loop_678:
	nop
	setx	loop_681,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x031400001401,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	rdpr	%tt,	%l1
	wrpr	%g0,	%l1,	%tt
	rdpr	%pstate,	%l1
	wrpr	%g0,	%l1,	%pstate
	rdpr	%tl,	%l1
	wrpr	%g0,	%l1,	%tl
	rdpr	%tpc,	%l1
	wrpr	%g0,	%l1,	%tpc
	rdpr	%tnpc,	%l1
	wrpr	%g0,	%l1,	%tnpc
	rdpr	%tstate,	%l1
	wrpr	%g0,	%l1,	%tstate
	rdpr	%tba,	%l1
	wrpr	%g0,	%l1,	%tba
	rdpr	%tba,	%l1
	wrpr	%g0,	%l1,	%tba
	rdhpr	%hpstate,	%l1
	wrhpr	%g0,	%l1,	%hpstate
	rdhpr	%htstate,	%l1
	wrhpr	%g0,	%l1,	%htstate
	rdhpr	%hintp,	%l1
	wrhpr	%g0,	%l1,	%hintp
	done
	add	%g3,	0x022B,	%g1
loop_679:
	call	loop_682
loop_680:
	bneg,a,pt	%xcc,	loop_683
loop_681:
	call	loop_684
	nop
	fitod	%f0,	%f8
	fdtos	%f8,	%f9
loop_682:
	rdpr	%tl,	%l5
loop_683:
	srax	%o6,	0x18,	%i4
loop_684:
	nop
	setx	0x059BF2A24AE5A937,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0xB1E337370D033364,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	fmuld	%f24,	%f4,	%f0
	fmovrdlz	%o7,	%f4,	%f4
	nop
	set	0x68, %g5
	ldd	[%l7 + %g5],	%f16
	fmovsl	%fcc2,	%f24,	%f6
	fmovdvc	%icc,	%f0,	%f16
	call	loop_685
	membar	0x18
	movneg	%xcc,	%o1,	%l4
	nop
	set	0x7C, %l0
	flush	%l7 + %l0
loop_685:
	call	loop_686
	nop
	setx	0x797185C9,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f24
	setx	0xB55D2F74,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f8
	fdivs	%f8,	%f24,	%f11
	rdhpr	%hintp,	%g7
	nop
	fitod	%f0,	%f26
	fdtox	%f26,	%f22
loop_686:
	srlx	%o3,	%o4,	%o2
	wr	%g0,	0x04,	%asi
	lduha	[%l7 + 0x3E] %asi,	%l1
	fmovdn	%xcc,	%f20,	%f4
	fcmps	%fcc0,	%f30,	%f6
	nop
	setx	0xE6BA05CC9FDAD8B7,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	fsqrtd	%f2,	%f14
	mulscc	%i2,	0x013D,	%g4
	wr	%g0,	0x18,	%asi
	lduwa	[%l7 + 0x58] %asi,	%o5
	fbuge,a	%fcc0,	loop_687
	nop
	setx	0x48E335B08633E666,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0x0B15CDB8650885A9,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	faddd	%f2,	%f20,	%f12
	set	0x74, %g7
	ldsba	[%l7 + %g7] 0x80,	%l6
loop_687:
	call	loop_688
	fmovrdgz	%g5,	%f10,	%f16
	sll	%l0,	%i6,	%i7
	udiv	%o0,	0x00,	%l3
loop_688:
	call	loop_689
	fmovrsgz	%i3,	%f14,	%f13
	fmovse	%icc,	%f6,	%f28
	edge8ln	%i0,	%g2,	%i1
loop_689:
	call	loop_690
	call	loop_691
	fmovsule	%fcc0,	%f24,	%f0
	call	loop_692
loop_690:
	fornot2	%f18,	%f18,	%f0
loop_691:
	fpack16	%f26,	%f16
	call	loop_693
loop_692:
	udivcc	%i5,	0x00,	%g6
	fmovsne	%icc,	%f20,	%f17
	rd	%sys_tick_cmpr,	%g3
loop_693:
	call	loop_694
	andncc	%g1,	0x1B67,	%l2
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	fone	%f24
loop_694:
	call	loop_695
	nop
	setx	0xC54F71642809EA6B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	fsqrtd	%f18,	%f16
	call	loop_696
	bvc,a	%icc,	loop_697
loop_695:
	addc	%o6,	0x125D,	%l5
	fmovsg	%fcc1,	%f0,	%f24
loop_696:
	brlez	%i4,	loop_698
loop_697:
	movle	%icc,	0x271,	%o1
	fpadd16s	%f10,	%f14,	%f2
	movl	%fcc2,	0x47F,	%o7
loop_698:
	edge16l	%l4,	%o3,	%o4
	mova	%xcc,	%g7,	%l1
	movul	%fcc3,	0x0D5,	%i2
	fsrc2s	%f19,	%f2
	tcc	%icc,	0x7
	call	loop_699
	sllx	%g4,	%o2,	%o5
	movleu	%xcc,	0x3D9,	%l6
	fsrc2s	%f13,	%f5
loop_699:
	fxors	%f11,	%f21,	%f23
	movvs	%xcc,	0x112,	%l0
	call	loop_700
	bcs,pn	%icc,	loop_701
	nop
	setx	0x68E9D069CEF76CF9,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	fsqrtd	%f22,	%f6
	lduw	[%l7 + 0x0C],	%g5
loop_700:
	alignaddr	%i6,	%i7,	%l3
loop_701:
	movcs	%xcc,	0x5BE,	%o0
	wr	%g0,	0x2f,	%asi
	stba	%i0,	[%l7 + 0x63] %asi
	membar	#Sync
	call	loop_702
	call	loop_703
	movl	%fcc2,	%g2,	%i3
	call	loop_704
loop_702:
	rd	%sys_tick_cmpr,	%i1
loop_703:
	fmovsu	%fcc0,	%f12,	%f26
	sdiv	%i5,	%g6,	%g1
loop_704:
	call	loop_705
	movuge	%fcc0,	0x229,	%l2
	fexpand	%f19,	%f20
	edge8ln	%o6,	%l5,	%g3
loop_705:
	movge	%xcc,	%o1,	%o7
	bn,a,pt	%icc,	loop_706
	call	loop_707
	fzero	%f0
	call	loop_708
loop_706:
	wrpr	%l4,	0x08D5,	%pil
loop_707:
	tl	%xcc,	0x4
	edge8l	%o3,	%i4,	%g7
loop_708:
	sdiv	%o4,	0x00,	%l1
	nop
	setx loop_709, %l0, %l1
	jmpl %l1, %g4
	call	loop_710
	siam	0x4
	call	loop_711
loop_709:
	call	loop_712
loop_710:
	sllx	%i2,	%o5,	%l6
	addcc	%o2,	%l0,	%g5
loop_711:
	call	loop_713
loop_712:
	membar	0x40
	ldd	[%l7 + 0x70],	%f30
	array8	%i7,	%l3,	%o0
loop_713:
	call	loop_714
	wrpr	%i6,	%i0,	%pil
	fcmpne16	%f10,	%f18,	%i3
	ldd	[%l7 + 0x50],	%i0
loop_714:
	tl	%icc,	0x4
	alignaddrl	%g2,	%i5,	%g1
	call	loop_715
	rdpr	%tl,	%g6
	tneg	%icc,	0x1
	call	loop_716
loop_715:
	wr	%o6,	%l2,	%softint
	array8	%g3,	%o1,	%l5
	fpsub16	%f24,	%f0,	%f10
loop_716:
	move	%icc,	0x209,	%l4
	call	loop_717
	call	loop_718
	fmovrdlz	%o3,	%f22,	%f8
	udivcc	%i4,	0x00,	%o7
loop_717:
	rdhpr	%ver,	%g7
loop_718:
	tleu	%xcc,	0x6
	for	%f8,	%f10,	%f30
	wrpr	%o4,	0x0373,	%cwp
	fmovsule	%fcc0,	%f26,	%f2
	call	loop_719
	call	loop_720
	fmovde	%fcc0,	%f28,	%f8
	fnands	%f3,	%f11,	%f13
loop_719:
	fmovrslz	%l1,	%f13,	%f14
loop_720:
	call	loop_721
	subcc	%g4,	0x1ADC,	%i2
	call	loop_722
	call	loop_723
loop_721:
	bshuffle	%f20,	%f16,	%f6
	nop
	set	0x50, %o0
	ldd	[%l7 + %o0],	%o4
loop_722:
	movue	%fcc1,	0x5FC,	%o2
loop_723:
	popc	0x0C11,	%l0
	srlx	%g5,	%i7,	%l3
	tcc	%xcc,	0x5
	bneg,a,pt	%xcc,	loop_724
	call	loop_725
	fcmple16	%f16,	%f12,	%l6
	rd	%y,	%o0
loop_724:
	call	loop_726
loop_725:
	bne,a	%xcc,	loop_727
	fmovrdlez	%i0,	%f20,	%f2
	call	loop_728
loop_726:
	call	loop_729
loop_727:
	tleu	%icc,	0x0
	fnot1s	%f23,	%f20
loop_728:
	call	loop_730
loop_729:
	and	%i6,	%i1,	%g2
	fmovsule	%fcc2,	%f0,	%f22
	movge	%icc,	0x5D9,	%i3
loop_730:
	fmuld8sux16	%f7,	%f26,	%f30
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 4:
!
!	Type l   	: 27
!	Type a   	: 34
!	Type cti   	: 156
!	Type x   	: 13
!	Type f   	: 138
!	Type i   	: 132
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

!
! Thread 5 Start
!
main_t5:
	mov 	%l7, 	%g1
	!# Set %cwp for 8 windows
	!# This threads memory space into each %l7
	wrpr 	%g0, 	0x7, 	%cwp
	mov 	%g1, 	%l7
	wrpr 	%g0, 	0x6, 	%cwp
	mov 	%g1, 	%l7
	wrpr 	%g0, 	0x5, 	%cwp
	mov 	%g1, 	%l7
	wrpr 	%g0, 	0x4, 	%cwp
	mov 	%g1, 	%l7
	wrpr 	%g0, 	0x3, 	%cwp
	mov 	%g1, 	%l7
	wrpr 	%g0, 	0x2, 	%cwp
	mov 	%g1, 	%l7
	wrpr 	%g0, 	0x1, 	%cwp
	mov 	%g1, 	%l7
	wrpr 	%g0, 	0x0, 	%cwp
	mov 	%g1, 	%l7

	!# Set %fsr
	setx 	0x0000000000000000,	%l0,	%l6	!# no post process
	stx 	%l6, 	[%l7 + 0x0]	!# no post process
	ldx 	[%l7 + 0x0], 	%fsr	!# no post process

	!# Initialize registers ..

	!# Global registers
	set	0x3,	%g1
	set	0x9,	%g2
	set	0xF,	%g3
	set	0xA,	%g4
	set	0xA,	%g5
	set	0xA,	%g6
	set	0x2,	%g7
	!# Input registers
	set	-0xA,	%i0
	set	-0x6,	%i1
	set	-0x5,	%i2
	set	-0x5,	%i3
	set	-0x4,	%i4
	set	-0x4,	%i5
	set	-0x6,	%i6
	set	-0xF,	%i7
	!# Local registers
	set	0x26CCD529,	%l0
	set	0x021804AF,	%l1
	set	0x21CCAA2C,	%l2
	set	0x0244745D,	%l3
	set	0x7CF1D667,	%l4
	set	0x45D55978,	%l5
	set	0x7EB48375,	%l6
	!# Output registers
	set	0x1C81,	%o0
	set	0x1E13,	%o1
	set	0x16FE,	%o2
	set	-0x17E3,	%o3
	set	-0x0793,	%o4
	set	0x177D,	%o5
	set	0x0609,	%o6
	set	0x0F29,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0xF9E0BBFB632344C2)
	INIT_TH_FP_REG(%l7,%f2,0x53C87029AA2FE833)
	INIT_TH_FP_REG(%l7,%f4,0xDE952A53A3AD06F4)
	INIT_TH_FP_REG(%l7,%f6,0x4829F0FA358AAB1A)
	INIT_TH_FP_REG(%l7,%f8,0x3E56A552936BFBAC)
	INIT_TH_FP_REG(%l7,%f10,0x5FEC588976E3FF0F)
	INIT_TH_FP_REG(%l7,%f12,0x59960BCB796288EC)
	INIT_TH_FP_REG(%l7,%f14,0x02BB7E99E16D67F4)
	INIT_TH_FP_REG(%l7,%f16,0x2B88127A028E0C9D)
	INIT_TH_FP_REG(%l7,%f18,0x1F7BC94AED1048E0)
	INIT_TH_FP_REG(%l7,%f20,0x6AAEFD748E8AA9B7)
	INIT_TH_FP_REG(%l7,%f22,0x42D30B68F5F003E5)
	INIT_TH_FP_REG(%l7,%f24,0x1FD9A46546DB3789)
	INIT_TH_FP_REG(%l7,%f26,0x74E49AFE0AE9E70A)
	INIT_TH_FP_REG(%l7,%f28,0x9610A29EE8E2CA43)
	INIT_TH_FP_REG(%l7,%f30,0x0E709079768FBC1E)

	!# Execute Main Diag ..

	fxnors	%f4,	%f13,	%f9
	tneg	%icc,	0x6
	fmovsn	%xcc,	%f29,	%f20
	rdpr	%tba,	%g1
	call	loop_731
	xnorcc	%i5,	%g6,	%o6
	movvc	%xcc,	0x111,	%l2
	call	loop_732
loop_731:
	sdivcc	%o1,	0x00,	%g3
	fpadd16s	%f16,	%f30,	%f4
	membar	0x69
loop_732:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%otherwin,	%l5
	tg	%xcc,	0x2
	wrpr	%o7,	%i4,	%pil
	fmovrdlz	%o4,	%f10,	%f18
	call	loop_733
	fornot2	%f8,	%f30,	%f22
	rdhpr	%hintp,	%l1
	wr	%g0,	0x80,	%asi
	ldswa	[%l7 + 0x78] %asi,	%g4
loop_733:
	sdivx	%g7,	0x00,	%o5
	fmovrdgz	%o2,	%f10,	%f24
	call	loop_734
	call	loop_735
	movcc	%xcc,	%l0,	%g5
	addcc	%i2,	0x0F16,	%l3
loop_734:
	fmovsue	%fcc2,	%f21,	%f9
loop_735:
	fmuld8ulx16	%f31,	%f17,	%f6
	call	loop_736
	call	loop_737
	sdivcc	%i7,	%l6,	%o0
	array32	%i6,	%i1,	%i0
loop_736:
	fpsub32s	%f2,	%f6,	%f29
loop_737:
	tgu	%icc,	0x4
	ble,a,pn	%xcc,	loop_738
	call	loop_739
	call	loop_740
	rdhpr	%hpstate,	%i3
loop_738:
	tcs	%icc,	0x4
loop_739:
	fxnors	%f1,	%f3,	%f17
loop_740:
	movug	%fcc0,	%g1,	%i5
	fmovdvs	%icc,	%f10,	%f26
	fmovdue	%fcc1,	%f28,	%f4
	bneg	%xcc,	loop_741
	bvc,pt	%xcc,	loop_742
	call	loop_743
	call	loop_744
loop_741:
	fmovsge	%xcc,	%f10,	%f18
loop_742:
	movo	%fcc3,	0x264,	%g6
loop_743:
	call	loop_745
loop_744:
	fmovdvc	%xcc,	%f6,	%f16
	call	loop_746
	call	loop_747
loop_745:
	nop
	setx	0x983813BFA822ED30,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0xE69EFCA8D165CAB9,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	fsubd	%f8,	%f30,	%f26
	call	loop_748
loop_746:
	mulx	%g2,	0x0C51,	%o6
loop_747:
	sir	0x1DF7
	nop
	fitos	%f1,	%f24
	fstox	%f24,	%f0
loop_748:
	fpmerge	%f25,	%f19,	%f26
	call	loop_749
	call	loop_750
	swap	[%l7 + 0x18],	%l2
	edge16	%g3,	%o1,	%o3
loop_749:
	movg	%icc,	%l4,	%l5
loop_750:
	andcc	%o7,	0x06A9,	%i4
	ta	%icc,	0x6
	rd	%ccr,	%l1
	call	loop_751
	call	loop_752
	mova	%fcc3,	%g4,	%g7
	rdpr	%cwp,	%o4
loop_751:
	nop
	fitos	%f14,	%f9
	fstox	%f9,	%f10
loop_752:
	call	loop_753
	nop
	set	0x72, %l4
	sth	%o2,	[%l7 + %l4]
	ta	%xcc,	0x4
	mova	%fcc3,	0x076,	%l0
loop_753:
	fmovrse	%o5,	%f24,	%f2
	call	loop_754
	call	loop_755
	fmul8sux16	%f0,	%f16,	%f28
	nop
	fitos	%f4,	%f13
	fstod	%f13,	%f8
loop_754:
	fandnot2	%f16,	%f22,	%f28
loop_755:
	nop
	set	0x4A, %i7
	ldsba	[%l7 + %i7] 0x04,	%i2
	rdhpr	%hintp,	%g5
	edge16l	%i7,	%l6,	%l3
	call	loop_756
	movre	%i6,	%i1,	%o0
	call	loop_757
	fmovdn	%xcc,	%f4,	%f28
loop_756:
	call	loop_758
	movul	%fcc3,	0x42E,	%i0
loop_757:
	udivcc	%i3,	0x00,	%g1
	call	loop_759
loop_758:
	andn	%i5,	%g6,	%g2
	call	loop_760
	call	loop_761
loop_759:
	call	loop_762
	edge16ln	%o6,	%g3,	%l2
loop_760:
	call	loop_763
loop_761:
	tsubcctv	%o1,	0x0B8A,	%l4
loop_762:
	fmovso	%fcc1,	%f14,	%f8
	umul	%l5,	0x0D96,	%o7
loop_763:
	call	loop_764
	fmovso	%fcc2,	%f0,	%f9
	fmuld8sux16	%f24,	%f24,	%f10
	tl	%icc,	0x3
loop_764:
	call	loop_765
	te	%xcc,	0x3
	xorcc	%i4,	0x1CA2,	%l1
	fmovsge	%icc,	%f25,	%f28
loop_765:
	nop
	wr	%g0,	0x0c,	%asi
	lda	[%l7 + 0x58] %asi,	%f7
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	sdivx	%g4,	%g7,	%o4
	fxors	%f28,	%f11,	%f29
	call	loop_766
	fcmpgt32	%f2,	%f16,	%o3
	call	loop_767
	taddcc	%o2,	0x0B47,	%l0
loop_766:
	fsrc1	%f2,	%f18
	orcc	%o5,	%g5,	%i7
loop_767:
	fmovrdgez	%l6,	%f2,	%f4
	call	loop_768
	fandnot1	%f16,	%f8,	%f8
	set	0x0, %l6
	stxa	%i2,	[%g0 + %l6] 0x57
loop_768:
	fnot1	%f28,	%f12
	fabsd	%f10,	%f8
	call	loop_769
	mova	%xcc,	0x656,	%i6
	bl	%icc,	loop_770
	call	loop_771
loop_769:
	fxors	%f19,	%f3,	%f6
	call	loop_772
loop_770:
	nop
	fitos	%f9,	%f10
	fstox	%f10,	%f10
loop_771:
	call	loop_773
	call	loop_774
loop_772:
	fmovsule	%fcc0,	%f19,	%f27
	bl,a,pn	%xcc,	loop_775
loop_773:
	call	loop_776
loop_774:
	rd	%softint,	%i1
	sdiv	%l3,	%o0,	%i0
loop_775:
	ba	%icc,	loop_777
loop_776:
	rdpr	%tl,	%i3
	call	loop_778
	srlx	%g1,	%g6,	%g2
loop_777:
	movne	%icc,	0x24E,	%i5
	sdivcc	%g3,	0x00,	%o6
loop_778:
	fmovdg	%fcc0,	%f14,	%f10
	call	loop_779
	fpadd16	%f30,	%f8,	%f10
	rdpr	%cansave,	%o1
	orn	%l4,	%l5,	%l2
loop_779:
	call	loop_780
	srax	%i4,	0x0F,	%o7
	for	%f14,	%f26,	%f2
	movrne	%g4,	%l1,	%o4
loop_780:
	fbul,pn	%fcc2,	loop_781
	fone	%f30
	call	loop_782
	call	loop_783
loop_781:
	call	loop_784
	movg	%icc,	%o3,	%g7
loop_782:
	smulcc	%o2,	0x0076,	%o5
loop_783:
	fsrc1	%f24,	%f10
loop_784:
	wrpr	%g5,	0x09F0,	%pil
	rd	%pc,	%i7
	call	loop_785
	fabss	%f18,	%f20
	fnands	%f4,	%f9,	%f15
	nop
	set	0x32, %i0
	lduh	[%l7 + %i0],	%l6
loop_785:
	call	loop_786
	fmovdge	%fcc2,	%f26,	%f14
	fpsub32	%f10,	%f20,	%f10
	movgu	%xcc,	0x64C,	%i2
loop_786:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xD05, 	%hsys_tick_cmpr
	call	loop_787
	nop
	fitos	%f25,	%f4
	array16	%i6,	%o0,	%i0
	fcmpd	%fcc3,	%f0,	%f20
loop_787:
	wrpr 	%g0, 	0x2, 	%gl
	fnor	%f28,	%f8,	%f0
	call	loop_788
	subccc	%g1,	%l3,	%g2
	brnz	%g6,	loop_789
	nop
	setx	0x79AFF5A6CCEA9CDF,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0x95EE52AD49E754E8,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	fdivd	%f26,	%f26,	%f6
loop_788:
	fmovdcs	%icc,	%f8,	%f12
	udivx	%i5,	0x00,	%g3
loop_789:
	movleu	%icc,	%o1,	%l4
	fzero	%f26
	fmul8x16al	%f7,	%f6,	%f28
	call	loop_790
	fpadd16s	%f11,	%f27,	%f13
	fbge,a	%fcc1,	loop_791
	call	loop_792
loop_790:
	call	loop_793
	nop
	setx	0xD99949235028228B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0x06F7FA8B0BFE57A1,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	fsubd	%f22,	%f6,	%f26
loop_791:
	call	loop_794
loop_792:
	movre	%l5,	0x2B9,	%o6
loop_793:
	call	loop_795
	movl	%fcc2,	%l2,	%i4
loop_794:
	nop
	setx	0x58D7347DD364E099,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0xA43EA23B8675F240,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	fsubd	%f30,	%f26,	%f0
	tle	%icc,	0x4
loop_795:
	fxor	%f26,	%f30,	%f22
	tleu	%xcc,	0x1
	fornot2	%f22,	%f8,	%f30
	call	loop_796
	fmovdneg	%icc,	%f10,	%f24
	fmovsne	%fcc3,	%f1,	%f22
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
loop_796:
	call	loop_797
	call	loop_798
	call	loop_799
	call	loop_800
loop_797:
	wrpr	%g4,	%l1,	%cwp
loop_798:
	call	loop_801
loop_799:
	movrgz	%o4,	%o7,	%g7
loop_800:
	nop
	fitod	%f10,	%f2
	fdtoi	%f2,	%f3
	call	loop_802
loop_801:
	fmovdle	%xcc,	%f4,	%f16
	flushw
	fandnot1s	%f29,	%f24,	%f11
loop_802:
	call	loop_803
	call	loop_804
	udiv	%o2,	%o3,	%o5
	fmul8sux16	%f20,	%f2,	%f14
loop_803:
	fnor	%f6,	%f12,	%f14
loop_804:
	wrpr 	%g0, 	0x3, 	%gl
	tne	%icc,	0x2
	call	loop_805
	sdivx	%g5,	0x00,	%l0
	wr	%i1,	%i2,	%clear_softint
	stbar
loop_805:
	sll	%o0,	%i6,	%i0
	wr	%g0,	0x19,	%asi
	lduwa	[%l7 + 0x58] %asi,	%i3
	wr	%g0,	0x18,	%asi
	ldsha	[%l7 + 0x5C] %asi,	%g1
	call	loop_806
	fmovdue	%fcc2,	%f2,	%f24
	call	loop_807
	fmovsule	%fcc2,	%f19,	%f14
loop_806:
	nop
	set	0x78, %l5
	ldsw	[%l7 + %l5],	%l3
	fmovscs	%icc,	%f16,	%f18
loop_807:
	rdpr	%pil,	%g6
	bvs,pt	%icc,	loop_808
	call	loop_809
	fmovso	%fcc0,	%f0,	%f29
	call	loop_810
loop_808:
	fmovrdlez	%i5,	%f18,	%f0
loop_809:
	call	loop_811
	movue	%fcc3,	%g2,	%o1
loop_810:
	fmovdleu	%icc,	%f24,	%f30
	sdiv	%g3,	0x00,	%l5
loop_811:
	nop
	setx	0x9AEA3AEA,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f10
	setx	0x6CA28C1B,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f9
	fdivs	%f9,	%f10,	%f3
	ta	%icc,	0x7
	call	loop_812
	wrpr	%l4,	0x0E08,	%tick
	nop
	set	0x50, %o6
	std	%o6,	[%l7 + %o6]
	fmovsg	%xcc,	%f2,	%f10
loop_812:
	bg,a	%xcc,	loop_813
	udivcc	%i4,	0x00,	%g4
	andncc	%l2,	%l1,	%o4
	fmovso	%fcc2,	%f25,	%f14
loop_813:
	xor	%g7,	%o2,	%o7
	move	%icc,	%o5,	%o3
	call	loop_814
	sub	%i7,	0x1F6F,	%g5
	movue	%fcc0,	%l0,	%l6
	call	loop_815
loop_814:
	addcc	%i1,	0x1ADD,	%o0
	call	loop_816
	call	loop_817
loop_815:
	call	loop_818
	fmovsn	%fcc3,	%f8,	%f10
loop_816:
	call	loop_819
loop_817:
	umul	%i6,	%i0,	%i3
loop_818:
	bn,pn	%icc,	loop_820
	call	loop_821
loop_819:
	fcmpd	%fcc1,	%f4,	%f4
	fmuld8sux16	%f15,	%f12,	%f4
loop_820:
	fcmps	%fcc1,	%f16,	%f4
loop_821:
	sra	%g1,	%l3,	%i2
	wr	%g6,	%g2,	%clear_softint
	st	%fsr,	[%l7 + 0x34]
	call	loop_822
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	call	loop_823
	fnot2	%f16,	%f14
loop_822:
	popc	0x0E70,	%i5
	nop
	setx	0xBAF9C164BECCD89B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0xFBD950F570A3D7F9,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	fdivd	%f2,	%f0,	%f30
loop_823:
	bgu	%icc,	loop_824
	tgu	%xcc,	0x5
	srl	%o1,	%g3,	%l4
	call	loop_825
loop_824:
	fmovrslez	%l5,	%f5,	%f31
	sir	0x12C8
	tgu	%xcc,	0x6
loop_825:
	tvs	%xcc,	0x6
	fmovrde	%o6,	%f2,	%f0
	addc	%i4,	%l2,	%g4
	call	loop_826
	sdiv	%l1,	0x00,	%g7
	fsrc1s	%f2,	%f21
	rdhpr	%hpstate,	%o2
loop_826:
	call	loop_827
	stbar
	subc	%o4,	0x053F,	%o5
	fnors	%f7,	%f13,	%f17
loop_827:
	fcmpgt16	%f24,	%f22,	%o3
	call	loop_828
	fmovsa	%fcc1,	%f14,	%f15
	fzeros	%f14
	ble,pn	%icc,	loop_829
loop_828:
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	subccc	%i7,	%o7,	%g5
	addc	%l6,	%l0,	%i1
loop_829:
	fornot2	%f0,	%f16,	%f12
	wr	%g0,	0x19,	%asi
	ldstuba	[%l7 + 0x5E] %asi,	%i6
	array16	%o0,	%i0,	%g1
	ldstub	[%l7 + 0x63],	%l3
	taddcc	%i2,	0x0723,	%i3
	fmovrse	%g2,	%f25,	%f29
	fnot1	%f12,	%f24
	wr	%g0,	0x81,	%asi
	ldda	[%l7 + 0x30] %asi,	%i4
	popc	0x15CF,	%g6
	fmovdue	%fcc1,	%f10,	%f30
	array16	%o1,	%l4,	%l5
	call	loop_830
	add	%g3,	%i4,	%l2
	edge8ln	%g4,	%o6,	%l1
	nop
	setx	0xB29860E5A2C1F4E7,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0x23426CD311D6314E,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	fmuld	%f18,	%f14,	%f22
loop_830:
	xnor	%o2,	0x1BA8,	%o4
	fmovsvc	%xcc,	%f4,	%f18
	fcmpd	%fcc2,	%f8,	%f20
	movg	%fcc1,	0x55A,	%o5
	fcmped	%fcc0,	%f0,	%f4
	call	loop_831
	nop
	setx	0x86FDA58A,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f4
	fsqrts	%f4,	%f31
	fpadd32	%f28,	%f22,	%f2
	edge8ln	%o3,	%i7,	%g7
loop_831:
	nop
	fitos	%f21,	%f24
	sra	%g5,	0x15,	%o7
	addc	%l0,	0x149C,	%i1
	for	%f22,	%f26,	%f20
	fmovrsgez	%i6,	%f20,	%f1
	mulx	%o0,	%l6,	%g1
	umulcc	%i0,	0x1A4E,	%l3
	taddcctv	%i2,	%i3,	%g2
	call	loop_832
	fbu,a	%fcc2,	loop_833
	call	loop_834
	call	loop_835
loop_832:
	nop
	setx	loop_836,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x011400001403,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_833:
	call	loop_837
loop_834:
	tgu	%xcc,	0x1
loop_835:
	call	loop_838
loop_836:
	fzero	%f0
loop_837:
	wrpr	%g6,	%o1,	%pil
	fcmpne32	%f24,	%f16,	%i5
loop_838:
	fandnot2	%f22,	%f26,	%f2
	fones	%f9
	edge8l	%l4,	%g3,	%l5
	call	loop_839
	call	loop_840
	bshuffle	%f16,	%f16,	%f12
	edge8n	%l2,	%g4,	%i4
loop_839:
	nop
	fitod	%f8,	%f10
	fdtox	%f10,	%f20
	fxtod	%f20,	%f16
loop_840:
	bshuffle	%f24,	%f2,	%f4
	fmovdg	%fcc1,	%f2,	%f8
	call	loop_841
	nop
	setx	0xC412707B7072093D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	setx	0x0838961866E53C3F,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	faddd	%f24,	%f18,	%f22
	bmask	%l1,	%o2,	%o4
	sethi	0x0D6A,	%o5
loop_841:
	nop
	set	0x4E, %i1
	lduba	[%l7 + %i1] 0x18,	%o3
	call	loop_842
	wr	%o6,	0x1BA4,	%set_softint
	movug	%fcc3,	0x5E6,	%i7
	add	%l7,	0x34,	%l6
	wr	%g0,	0x11,	%asi
	lda	[%l6] %asi,	%g7
	casa	[%l6] 0x11,	%g7,	%o7
loop_842:
	fmovrsgez	%l0,	%f20,	%f16
	call	loop_843
	call	loop_844
	call	loop_845
	srl	%i1,	%g5,	%o0
loop_843:
	movre	%l6,	%g1,	%i0
loop_844:
	move	%fcc3,	%i6,	%l3
loop_845:
	fmovdo	%fcc3,	%f22,	%f30
	call	loop_846
	mulscc	%i3,	0x0E4E,	%g2
	fmovdlg	%fcc3,	%f10,	%f18

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_846:
	fand	%f28,	%f16,	%f16
	srlx	%o1,	0x1B,	%l4
	set	0x6A, %l3
	lduha	[%l7 + %l3] 0x04,	%g3
	call	loop_847
	movle	%fcc3,	%i5,	%l5
	fxors	%f27,	%f15,	%f23
	set	0x2C, %i2
	stha	%g4,	[%l7 + %i2] 0x11
loop_847:
	smulcc	%i4,	%l1,	%o2
	rdpr	%tl,	%l2
	tgu	%xcc,	0x4
	rd	%asi,	%o4
	flushw
	movug	%fcc1,	%o3,	%o5
	movrgez	%i7,	0x168,	%o6
	fmovsg	%xcc,	%f1,	%f4
	fmovspos	%xcc,	%f10,	%f15
	nop
	fitos	%f0,	%f8
	fstox	%f8,	%f18
	call	loop_848
	fcmpne16	%f20,	%f24,	%o7
	umulcc	%g7,	%l0,	%g5
	fmovrdne	%o0,	%f4,	%f2
loop_848:
	taddcc	%i1,	0x1200,	%l6
	nop
	setx	0x196869CDB43A5D17,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0xD9A2D92C,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	fsmuld	%f8,	%f26,	%f26
	fmovdlg	%fcc1,	%f8,	%f4
	call	loop_849
	st	%f16,	[%l7 + 0x7C]
	ldd	[%l7 + 0x68],	%g0
	call	loop_850
loop_849:
	movvc	%xcc,	0x219,	%i0
	call	loop_851
	orn	%i6,	%i3,	%l3
loop_850:
	nop
	wr	%g0,	0x04,	%asi
	ldstuba	[%l7 + 0x6B] %asi,	%g2
loop_851:
	smulcc	%i2,	%o1,	%l4
	movgu	%icc,	%g3,	%i5
	fexpand	%f13,	%f8
	nop
	fitod	%f10,	%f6
	fdtoi	%f6,	%f31
	srlx	%g6,	0x1C,	%g4
	tl	%icc,	0x4
	call	loop_852
	movne	%xcc,	0x4C5,	%i4
	call	loop_853
	fmovrslz	%l5,	%f7,	%f15
loop_852:
	movule	%fcc1,	%o2,	%l1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_853:
	fpsub16s	%f24,	%f30,	%f22
	set	0x10, %i6
	ldda	[%l7 + %i6] 0x19,	%o4
	nop
	set	0x48, %i5
	std	%f6,	[%l7 + %i5]
	fmovdle	%xcc,	%f24,	%f22
	addcc	%o3,	0x0A6D,	%i7
	call	loop_854
	call	loop_855
	fmovdge	%fcc3,	%f26,	%f0
	fandnot1s	%f31,	%f6,	%f4
loop_854:
	fpack16	%f0,	%f12
loop_855:
	fbl	%fcc2,	loop_856
	bcs,pn	%xcc,	loop_857
	nop
	setx	0x6CF3EB2072201102,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0x75D602DA,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	fsmuld	%f12,	%f6,	%f0
	set	0x40, %i3
	stda	%f16,	[%l7 + %i3] 0xc5
loop_856:
	ta	%xcc,	0x7
loop_857:
	andncc	%o6,	0x1390,	%o7
	call	loop_858
	udiv	%g7,	%l0,	%g5
	wr	%g0,	0x0c,	%asi
	sta	%f26,	[%l7 + 0x24] %asi
loop_858:
	nop
	setx	0xA792DE8A,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f23
	setx	0x058F0BC8,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f13
	fmuls	%f13,	%f23,	%f6
	fmovdpos	%xcc,	%f4,	%f2
	call	loop_859
	call	loop_860
	call	loop_861
	fmovsu	%fcc3,	%f31,	%f4
loop_859:
	st	%f14,	[%l7 + 0x58]
loop_860:
	te	%icc,	0x4
loop_861:
	fmovdlg	%fcc3,	%f8,	%f8
	fmul8x16	%f14,	%f2,	%f22
	wr	%g0,	0x11,	%asi
	swapa	[%l7 + 0x3C] %asi,	%o0
	fbne,a,pn	%fcc2,	loop_862
	stb	%o5,	[%l7 + 0x60]
	bshuffle	%f10,	%f30,	%f12
	call	loop_863
loop_862:
	edge32	%i1,	%l6,	%i0
	call	loop_864
	tne	%xcc,	0x2
loop_863:
	call	loop_865
	call	loop_866
loop_864:
	st	%f1,	[%l7 + 0x58]
	wr	%g1,	0x014D,	%sys_tick
loop_865:
	call	loop_867
loop_866:
	fornot2s	%f3,	%f16,	%f2
	rdhpr	%hsys_tick_cmpr,	%i3
	movge	%fcc2,	0x03D,	%l3
loop_867:
	fmovdle	%fcc2,	%f26,	%f20
	movn	%icc,	%g2,	%i2
	fmovsul	%fcc0,	%f24,	%f24
	call	loop_868
	sdivcc	%o1,	%i6,	%l4
	rdpr	%cwp,	%i5
	call	loop_869
loop_868:
	nop

loop_869:
	nop

	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 5:
!
!	Type l   	: 32
!	Type a   	: 32
!	Type x   	: 17
!	Type cti   	: 139
!	Type f   	: 139
!	Type i   	: 141
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

!
! Thread 6 Start
!
main_t6:
	mov 	%l7, 	%g1
	!# Set %cwp for 8 windows
	!# This threads memory space into each %l7
	wrpr 	%g0, 	0x7, 	%cwp
	mov 	%g1, 	%l7
	wrpr 	%g0, 	0x6, 	%cwp
	mov 	%g1, 	%l7
	wrpr 	%g0, 	0x5, 	%cwp
	mov 	%g1, 	%l7
	wrpr 	%g0, 	0x4, 	%cwp
	mov 	%g1, 	%l7
	wrpr 	%g0, 	0x3, 	%cwp
	mov 	%g1, 	%l7
	wrpr 	%g0, 	0x2, 	%cwp
	mov 	%g1, 	%l7
	wrpr 	%g0, 	0x1, 	%cwp
	mov 	%g1, 	%l7
	wrpr 	%g0, 	0x0, 	%cwp
	mov 	%g1, 	%l7

	!# Set %fsr
	setx 	0x0000000000000000,	%l0,	%l6	!# no post process
	stx 	%l6, 	[%l7 + 0x0]	!# no post process
	ldx 	[%l7 + 0x0], 	%fsr	!# no post process

	!# Initialize registers ..

	!# Global registers
	set	0x7,	%g1
	set	0x5,	%g2
	set	0xC,	%g3
	set	0x5,	%g4
	set	0xB,	%g5
	set	0xD,	%g6
	set	0xC,	%g7
	!# Input registers
	set	-0xB,	%i0
	set	-0xC,	%i1
	set	-0x1,	%i2
	set	-0x4,	%i3
	set	-0xD,	%i4
	set	-0x5,	%i5
	set	-0xA,	%i6
	set	-0xF,	%i7
	!# Local registers
	set	0x247254FC,	%l0
	set	0x7A7111C5,	%l1
	set	0x45C101B6,	%l2
	set	0x6FAE4CDF,	%l3
	set	0x127A4C44,	%l4
	set	0x756191B7,	%l5
	set	0x67B0D5DF,	%l6
	!# Output registers
	set	0x1A7D,	%o0
	set	-0x1B52,	%o1
	set	-0x0D58,	%o2
	set	0x0702,	%o3
	set	0x167C,	%o4
	set	-0x1CC8,	%o5
	set	0x1466,	%o6
	set	-0x0275,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0xF9E0BBFB632344C2)
	INIT_TH_FP_REG(%l7,%f2,0x53C87029AA2FE833)
	INIT_TH_FP_REG(%l7,%f4,0xDE952A53A3AD06F4)
	INIT_TH_FP_REG(%l7,%f6,0x4829F0FA358AAB1A)
	INIT_TH_FP_REG(%l7,%f8,0x3E56A552936BFBAC)
	INIT_TH_FP_REG(%l7,%f10,0x5FEC588976E3FF0F)
	INIT_TH_FP_REG(%l7,%f12,0x59960BCB796288EC)
	INIT_TH_FP_REG(%l7,%f14,0x02BB7E99E16D67F4)
	INIT_TH_FP_REG(%l7,%f16,0x2B88127A028E0C9D)
	INIT_TH_FP_REG(%l7,%f18,0x1F7BC94AED1048E0)
	INIT_TH_FP_REG(%l7,%f20,0x6AAEFD748E8AA9B7)
	INIT_TH_FP_REG(%l7,%f22,0x42D30B68F5F003E5)
	INIT_TH_FP_REG(%l7,%f24,0x1FD9A46546DB3789)
	INIT_TH_FP_REG(%l7,%f26,0x74E49AFE0AE9E70A)
	INIT_TH_FP_REG(%l7,%f28,0x9610A29EE8E2CA43)
	INIT_TH_FP_REG(%l7,%f30,0x0E709079768FBC1E)

	!# Execute Main Diag ..

	edge32l	%g6,	%g4,	%g3
	call	loop_870
	call	loop_871
	fors	%f28,	%f29,	%f9
	movge	%fcc3,	%l5,	%o2
loop_870:
	fbu,a	%fcc2,	loop_872
loop_871:
	fmovrdgz	%l1,	%f18,	%f18
	lduw	[%l7 + 0x78],	%i4
	nop
	set	0x08, %g1
	std	%o4,	[%l7 + %g1]
loop_872:
	fsrc2s	%f16,	%f12
	call	loop_873
	movle	%icc,	%o3,	%l2
	udivcc	%o6,	%o7,	%g7
	call	loop_874
loop_873:
	call	loop_875
	fmovrslz	%l0,	%f14,	%f8
	nop
	setx	0x08AD75CB,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f17
	setx	0x48790994,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f2
	fdivs	%f2,	%f17,	%f4
loop_874:
	fmovsul	%fcc2,	%f14,	%f4
loop_875:
	move	%fcc0,	0x5A3,	%g5
	fmovdule	%fcc3,	%f20,	%f24
	call	loop_876
	call	loop_877
	wrpr	%o0,	0x03A6,	%tick
	taddcc	%i7,	0x15ED,	%o5
loop_876:
	or	%l6,	0x1898,	%i1
loop_877:
	call	loop_878
	wrpr 	%g0, 	0x0, 	%gl
	bg,a,pn	%icc,	loop_879
	fmovsu	%fcc0,	%f30,	%f10
loop_878:
	call	loop_880
	call	loop_881
loop_879:
	edge32l	%g1,	%l3,	%i3
	movrgz	%i2,	0x1DA,	%g2
loop_880:
	alignaddrl	%i6,	%o1,	%i5
loop_881:
	wrpr	%g6,	0x0A00,	%tick
	set	0x20, %o1
	lda	[%l7 + %o1] 0x11,	%f16
	fmovrdlz	%l4,	%f14,	%f4
	bmask	%g4,	%g3,	%l5
	call	loop_882
	nop
	setx	0x047B7301,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f22
	setx	0x2781EED1,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f31
	fadds	%f31,	%f22,	%f8
	call	loop_883
	fornot2s	%f26,	%f14,	%f31
loop_882:
	fxors	%f20,	%f27,	%f5
	addccc	%o2,	%i4,	%l1
loop_883:
	fcmpeq32	%f0,	%f6,	%o4
	te	%icc,	0x5
	call	loop_884
	andncc	%l2,	%o3,	%o7
	fmovdu	%fcc1,	%f28,	%f0
	call	loop_885
loop_884:
	fbge	%fcc1,	loop_886
	movcs	%xcc,	%g7,	%o6
	ta	%xcc,	0x4
loop_885:
	rdhpr	%hintp,	%g5
loop_886:
	move	%icc,	%o0,	%i7
	brlez,pn	%o5,	loop_887
	ldsh	[%l7 + 0x46],	%l6
	sub	%l0,	%i1,	%i0
	array16	%g1,	%i3,	%l3
loop_887:
	call	loop_888
	movcc	%icc,	0x716,	%i2
	addcc	%g2,	0x0611,	%i6
	fpadd32s	%f23,	%f14,	%f0
loop_888:
	fbue,a,pt	%fcc2,	loop_889
	nop
	fitos	%f4,	%f7
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	bneg	%icc,	loop_890
loop_889:
	fxors	%f20,	%f5,	%f5
	fcmped	%fcc2,	%f14,	%f18
	wr 	%g0, 	0x6, 	%fprs
loop_890:
	fmovsue	%fcc2,	%f21,	%f8
	fzero	%f26
	call	loop_891
	movule	%fcc2,	0x15B,	%l4
	call	loop_892
	movrgez	%o1,	0x319,	%g4
loop_891:
	call	loop_893
	edge32	%l5,	%o2,	%i4
loop_892:
	addcc	%g3,	0x064C,	%o4
	call	loop_894
loop_893:
	addcc	%l1,	%l2,	%o7
	sra	%o3,	%g7,	%g5
	fmovsuge	%fcc2,	%f14,	%f16
loop_894:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x2C8, 	%hsys_tick_cmpr
	fpadd32s	%f10,	%f1,	%f0
	movuge	%fcc1,	%o6,	%i7
	tvs	%xcc,	0x6
	andn	%o5,	%l0,	%l6
	brz,pn	%i0,	loop_895
	fmovdn	%icc,	%f20,	%f0
	call	loop_896
	bn,a,pt	%icc,	loop_897
loop_895:
	sra	%g1,	%i1,	%i3
	tge	%icc,	0x7
loop_896:
	nop
	set	0x60, %g6
	lduba	[%l7 + %g6] 0x10,	%l3
loop_897:
	fpsub16s	%f19,	%f29,	%f17
	edge16ln	%i2,	%g2,	%i6
	taddcc	%g6,	%l4,	%o1
	andncc	%g4,	%l5,	%i5
	call	loop_898
	sll	%o2,	%g3,	%o4
	add	%i4,	0x0F14,	%l1
	fnot1s	%f20,	%f29
loop_898:
	wrpr	%o7,	0x16CD,	%pil
	fmovdule	%fcc1,	%f4,	%f2
	tcs	%xcc,	0x4
	edge16ln	%l2,	%g7,	%o3
	tge	%icc,	0x4
	call	loop_899
	membar	0x1D
	sethi	0x11BD,	%g5
	fsrc1s	%f21,	%f18
loop_899:
	popc	0x025D,	%o0
	call	loop_900
	fornot2s	%f7,	%f16,	%f8
	fsrc1	%f18,	%f28
	rdhpr	%hpstate,	%i7
loop_900:
	nop
	setx	loop_901,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x001400001404,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fcmpeq16	%f22,	%f18,	%o6
	for	%f24,	%f20,	%f16
	fmovdcs	%xcc,	%f4,	%f14
loop_901:
	call	loop_902
	call	loop_903
	call	loop_904
	fmul8ulx16	%f24,	%f0,	%f22
loop_902:
	fmovdg	%fcc1,	%f30,	%f12
loop_903:
	fmovdule	%fcc0,	%f16,	%f20
loop_904:
	fnot2s	%f26,	%f9
	call	loop_905
	call	loop_906
	stx	%fsr,	[%l7 + 0x18]
	call	loop_907
loop_905:
	nop
	set	0x4C, %g2
	prefetch	[%l7 + %g2],	 4
loop_906:
	call	loop_908
	call	loop_909
loop_907:
	tle	%icc,	0x1
	fcmpgt16	%f8,	%f30,	%o5
loop_908:
	fmuld8sux16	%f27,	%f14,	%f24
loop_909:
	nop
	set	0x40, %o3
	stda	%f16,	[%l7 + %o3] 0x1e
	membar	#Sync
	fcmpgt16	%f28,	%f18,	%l0
	fmovdul	%fcc0,	%f20,	%f0
	fandnot1	%f26,	%f22,	%f4
	tsubcc	%i0,	%g1,	%l6
	fnot1s	%f18,	%f14
	tgu	%xcc,	0x1
	fmul8sux16	%f2,	%f22,	%f8
	srax	%i1,	0x04,	%i3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xA3C, 	%sys_tick_cmpr
	movrgz	%l3,	0x1A8,	%i6
	fmovdo	%fcc3,	%f0,	%f28
	call	loop_910
	orcc	%g6,	%l4,	%g2
	call	loop_911
	call	loop_912
loop_910:
	call	loop_913
	call	loop_914
loop_911:
	movle	%fcc1,	%o1,	%l5
loop_912:
	call	loop_915
loop_913:
	call	loop_916
loop_914:
	call	loop_917
	fmovdpos	%xcc,	%f22,	%f18
loop_915:
	fble,pn	%fcc0,	loop_918
loop_916:
	fornot1	%f0,	%f6,	%f24
loop_917:
	fandnot1s	%f17,	%f1,	%f7
	call	loop_919
loop_918:
	call	loop_920
	fexpand	%f31,	%f26
	fmovrdlez	%g4,	%f18,	%f8
loop_919:
	fors	%f28,	%f26,	%f6
loop_920:
	call	loop_921
	fnors	%f1,	%f30,	%f23
	fmovda	%fcc1,	%f28,	%f12
	call	loop_922
loop_921:
	fnands	%f8,	%f9,	%f19
	nop
	setx	0x7EE4BC7DC64D26DE,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0x54704FEEA2866F14,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	fdivd	%f16,	%f4,	%f24
	call	loop_923
loop_922:
	call	loop_924
	call	loop_925
	wrpr 	%g0, 	0x1, 	%gl
loop_923:
	edge16ln	%o4,	%i4,	%g3
loop_924:
	fmul8sux16	%f28,	%f18,	%f6
loop_925:
	fsrc1s	%f9,	%f9
	fmovspos	%icc,	%f8,	%f23
	call	loop_926
	call	loop_927
	popc	%o7,	%l1
	movrlez	%g7,	0x06F,	%o3
loop_926:
	movu	%fcc3,	%l2,	%o0
loop_927:
	fsrc1	%f18,	%f28
	call	loop_928
	call	loop_929
	call	loop_930
	call	loop_931
loop_928:
	edge32n	%g5,	%i7,	%o6
loop_929:
	fands	%f22,	%f29,	%f16
loop_930:
	tl	%xcc,	0x5
loop_931:
	fmovdge	%fcc1,	%f12,	%f28
	bpos,pt	%xcc,	loop_932
	movug	%fcc1,	%l0,	%i0
	bneg,a	%icc,	loop_933
	fmovdo	%fcc2,	%f0,	%f20
loop_932:
	movne	%fcc3,	%o5,	%g1
	call	loop_934
loop_933:
	movre	%i1,	%i3,	%l6
	fsrc2	%f0,	%f16
	call	loop_935
loop_934:
	tcs	%icc,	0x0
	fmovdug	%fcc2,	%f28,	%f28
	fmovdvs	%icc,	%f16,	%f26
loop_935:
	orcc	%l3,	%i6,	%g6
	edge8	%i2,	%l4,	%o1
	call	loop_936
	call	loop_937
	call	loop_938
	call	loop_939
loop_936:
	fzero	%f22
loop_937:
	fcmpes	%fcc1,	%f31,	%f0
loop_938:
	edge32l	%l5,	%g2,	%i5
loop_939:
	for	%f30,	%f30,	%f20
	nop
	setx	0xEEF76911F0C3965B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	fsqrtd	%f14,	%f2
	bmask	%g4,	%o4,	%o2
	rdhpr	%hpstate,	%i4
	tne	%xcc,	0x7
	fabss	%f2,	%f17
	fmuld8ulx16	%f1,	%f23,	%f28
	call	loop_940
	call	loop_941
	call	loop_942
	call	loop_943
loop_940:
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
loop_941:
	call	loop_944
loop_942:
	call	loop_945
loop_943:
	fxnor	%f14,	%f12,	%f4
	bge,a,pt	%icc,	loop_946
loop_944:
	edge8	%g3,	%o7,	%l1
loop_945:
	bgu,a	%xcc,	loop_947
	orn	%g7,	0x1C4F,	%o3
loop_946:
	call	loop_948
	fcmpgt16	%f18,	%f2,	%l2
loop_947:
	membar	0x70
	movue	%fcc0,	0x6AE,	%g5
loop_948:
	tneg	%xcc,	0x6
	fnegd	%f4,	%f22
	srlx	%o0,	%i7,	%l0
	fpmerge	%f5,	%f14,	%f12
	fands	%f14,	%f21,	%f1
	st	%f1,	[%l7 + 0x5C]
	movrgz	%o6,	0x299,	%o5
	smulcc	%i0,	0x0336,	%g1
	nop
	fitos	%f13,	%f6
	fstod	%f6,	%f18
	smulcc	%i1,	0x133A,	%i3
	fmovsue	%fcc2,	%f27,	%f30
	call	loop_949
	orcc	%l3,	%l6,	%g6
	fabsd	%f14,	%f0
	call	loop_950
loop_949:
	fmovrdne	%i6,	%f26,	%f2
	call	loop_951
	call	loop_952
loop_950:
	fmovslg	%fcc1,	%f28,	%f17
	call	loop_953
loop_951:
	call	loop_954
loop_952:
	and	%l4,	%i2,	%l5
	fmovsul	%fcc0,	%f30,	%f1
loop_953:
	call	loop_955
loop_954:
	sra	%g2,	%i5,	%o1
	rdhpr	%hpstate,	%o4
	fmovsuge	%fcc0,	%f27,	%f15
loop_955:
	fbue	%fcc1,	loop_956
	fpmerge	%f18,	%f24,	%f20
	call	loop_957
	fmovso	%fcc1,	%f30,	%f30
loop_956:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x5CD, 	%hsys_tick_cmpr
	fmovrse	%g4,	%f3,	%f12
loop_957:
	fmovsle	%fcc2,	%f30,	%f15
	fandnot1	%f24,	%f4,	%f20
	nop
	setx	0x2868409E1DDD6517,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0x99896F5E,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	fsmuld	%f28,	%f12,	%f10
	call	loop_958
	nop
	setx	loop_959,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x001100001403,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	rdpr	%tt,	%l1
	wrpr	%g0,	%l1,	%tt
	rdpr	%pstate,	%l1
	wrpr	%g0,	%l1,	%pstate
	rdpr	%tl,	%l1
	wrpr	%g0,	%l1,	%tl
	rdpr	%tpc,	%l1
	wrpr	%g0,	%l1,	%tpc
	rdpr	%tnpc,	%l1
	wrpr	%g0,	%l1,	%tnpc
	rdpr	%tstate,	%l1
	wrpr	%g0,	%l1,	%tstate
	rdpr	%tba,	%l1
	wrpr	%g0,	%l1,	%tba
	rdpr	%tba,	%l1
	wrpr	%g0,	%l1,	%tba
	rdhpr	%hpstate,	%l1
	wrhpr	%g0,	%l1,	%hpstate
	rdhpr	%htstate,	%l1
	wrhpr	%g0,	%l1,	%htstate
	rdhpr	%hintp,	%l1
	wrhpr	%g0,	%l1,	%hintp
	done
	call	loop_960
	nop
	set	0x3C, %g3
	flush	%l7 + %g3
loop_958:
	fbug,a	%fcc0,	loop_961
loop_959:
	call	loop_962
loop_960:
	edge16ln	%g3,	%i4,	%o7
	fabsd	%f6,	%f14
loop_961:
	mulx	%g7,	0x00A1,	%l1
loop_962:
	umul	%o3,	%l2,	%g5
	call	loop_963
	call	loop_964
	fandnot2s	%f14,	%f8,	%f19
	call	loop_965
loop_963:
	fnands	%f24,	%f24,	%f17
loop_964:
	edge32ln	%o0,	%l0,	%i7
	fbul,a	%fcc2,	loop_966
loop_965:
	edge16l	%o5,	%o6,	%g1
	orncc	%i0,	0x0DAD,	%i1
	nop
	setx	loop_967,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x002100001407,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	rdpr	%tt,	%l1
	wrpr	%g0,	%l1,	%tt
	rdpr	%pstate,	%l1
	wrpr	%g0,	%l1,	%pstate
	rdpr	%tl,	%l1
	wrpr	%g0,	%l1,	%tl
	rdpr	%tpc,	%l1
	wrpr	%g0,	%l1,	%tpc
	rdpr	%tnpc,	%l1
	wrpr	%g0,	%l1,	%tnpc
	rdpr	%tstate,	%l1
	wrpr	%g0,	%l1,	%tstate
	rdpr	%tba,	%l1
	wrpr	%g0,	%l1,	%tba
	rdpr	%tba,	%l1
	wrpr	%g0,	%l1,	%tba
	rdhpr	%hpstate,	%l1
	wrhpr	%g0,	%l1,	%hpstate
	rdhpr	%htstate,	%l1
	wrhpr	%g0,	%l1,	%htstate
	rdhpr	%hintp,	%l1
	wrhpr	%g0,	%l1,	%hintp
	done
loop_966:
	bneg	%icc,	loop_968
	call	loop_969
	fnot2	%f10,	%f8
loop_967:
	sir	0x1A98
loop_968:
	nop
	wr	%g0,	0x80,	%asi
	ldda	[%l7 + 0x70] %asi,	%l2
loop_969:
	call	loop_970
	fble,a,pt	%fcc1,	loop_971
	fzero	%f26

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x850, 	%hsys_tick_cmpr
loop_970:
	call	loop_972
loop_971:
	fsrc1	%f30,	%f16
	call	loop_973
	fmovrdgz	%i6,	%f22,	%f24
loop_972:
	fmovsle	%xcc,	%f7,	%f8
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
loop_973:
	tle	%xcc,	0x7
	wr	%l4,	0x161F,	%ccr
	fmovsuge	%fcc3,	%f22,	%f17
	fxnor	%f4,	%f22,	%f14
	movvc	%icc,	%i2,	%l5
	addc	%g6,	0x1D8C,	%g2
	call	loop_974
	rdhpr	%hsys_tick_cmpr,	%i5
	movule	%fcc2,	0x1C1,	%o1
	ldstub	[%l7 + 0x55],	%o2
loop_974:
	call	loop_975
	andcc	%o4,	0x1261,	%g4
	fbul,a	%fcc1,	loop_976
	fnand	%f2,	%f22,	%f0
loop_975:
	array32	%i4,	%g3,	%o7
	movl	%fcc2,	%l1,	%o3
loop_976:
	nop
	fitos	%f30,	%f31
	smul	%g7,	%l2,	%g5
	fbu,a,pn	%fcc3,	loop_977
	fbug,a	%fcc2,	loop_978
	tsubcc	%o0,	%l0,	%i7
	fmovdvc	%icc,	%f0,	%f0
loop_977:
	fmovdl	%fcc0,	%f30,	%f2
loop_978:
	wr	%o6,	%o5,	%softint
	call	loop_979
	call	loop_980
	call	loop_981
	wr	%i0,	%g1,	%clear_softint
loop_979:
	tsubcc	%l3,	0x1970,	%i1
loop_980:
	fmovrse	%l6,	%f12,	%f30
loop_981:
	rdpr	%tl,	%i3
	movuge	%fcc2,	%i6,	%l4
	fabsd	%f4,	%f22
	call	loop_982
	call	loop_983
	movvc	%xcc,	%l5,	%g6
	array32	%i2,	%i5,	%g2
loop_982:
	fnot1s	%f17,	%f2
loop_983:
	fandnot1s	%f1,	%f8,	%f5
	fble	%fcc0,	loop_984
	call	loop_985
	call	loop_986
	subccc	%o1,	0x1C45,	%o4
loop_984:
	movre	%g4,	0x2CF,	%o2
loop_985:
	nop
	setx	0x34B0C44A0A8484A2,	%l0,	%l6
	stx	%l6,	[%l7 + 0x60]
	ldx	[%l7 + 0x60],	%fsr
loop_986:
	fmovsg	%xcc,	%f14,	%f2
	call	loop_987
	call	loop_988
	nop
	fitod	%f4,	%f26
	fdtos	%f26,	%f26
	call	loop_989
loop_987:
	fmovdneg	%xcc,	%f2,	%f14
loop_988:
	alignaddrl	%i4,	%g3,	%l1
	bvc,pt	%icc,	loop_990
loop_989:
	fmovsvc	%icc,	%f3,	%f25
	nop
	fitos	%f13,	%f13
	fmovsge	%xcc,	%f12,	%f26
loop_990:
	edge32n	%o3,	%g7,	%l2
	fmovdge	%xcc,	%f2,	%f6
	bneg,a	%xcc,	loop_991
	nop
	setx	0xCFCD8F4163A94606,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	fsqrtd	%f2,	%f16
	movug	%fcc2,	0x679,	%o7
	fmovsne	%fcc2,	%f13,	%f31
loop_991:
	and	%o0,	0x0355,	%l0
	smulcc	%g5,	0x0ADD,	%i7
	move	%fcc3,	0x741,	%o5
	call	loop_992
	fmovdul	%fcc0,	%f26,	%f0
	fmovs	%f31,	%f6
	set	0x40, %l1
	prefetcha	[%l7 + %l1] 0x19,	 3
loop_992:
	bvs,pt	%icc,	loop_993
	sdiv	%i0,	%l3,	%i1
	ld	[%l7 + 0x64],	%f13
	fandnot2s	%f7,	%f11,	%f1
loop_993:
	fpack16	%f12,	%f12
	std	%i6,	[%l7 + 0x30]
	ldsw	[%l7 + 0x74],	%i3
	call	loop_994
	call	loop_995
	fmovs	%f21,	%f16
	call	loop_996
loop_994:
	edge16n	%g1,	%l4,	%l5
loop_995:
	srax	%i6,	0x1F,	%i2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_996:
	subc	%g2,	%o1,	%o4
	fsrc1	%f14,	%f12
	fmovdug	%fcc1,	%f2,	%f16
	wr	%o2,	0x0ED0,	%set_softint
	movvs	%icc,	%g4,	%i4
	bgu,a,pt	%xcc,	loop_997
	call	loop_998
	nop
	fitod	%f8,	%f10
	fdtox	%f10,	%f4
	fxtod	%f4,	%f2
	nop
	fitos	%f3,	%f15
	fstox	%f15,	%f6
	fxtos	%f6,	%f16
loop_997:
	call	loop_999
loop_998:
	sdivx	%l1,	0x00,	%o3
	wr	%g0,	0x81,	%asi
	stwa	%g3,	[%l7 + 0x6C] %asi
loop_999:
	srl	%l2,	%o7,	%o0
	call	loop_1000
	call	loop_1001
	tge	%icc,	0x2
	fbule,a	%fcc0,	loop_1002
loop_1000:
	call	loop_1003
loop_1001:
	call	loop_1004
	call	loop_1005
loop_1002:
	udivcc	%l0,	%g7,	%i7
loop_1003:
	umulcc	%o5,	%g5,	%o6
loop_1004:
	call	loop_1006
loop_1005:
	fpadd16	%f16,	%f28,	%f12
	fcmpd	%fcc1,	%f24,	%f24
	te	%icc,	0x1
loop_1006:
	call	loop_1007
	tcc	%icc,	0x1
	nop
	fitod	%f10,	%f10
	fdtox	%f10,	%f4
	fxtod	%f4,	%f8
	lduw	[%l7 + 0x28],	%l3
loop_1007:
	movleu	%xcc,	%i1,	%i0
	fornot2s	%f21,	%f11,	%f9
	call	loop_1008
	swap	[%l7 + 0x0C],	%l6
	set	0x20, %g4
	ldda	[%l7 + %g4] 0x26,	%g0
loop_1008:
	call	loop_1009
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	ldsb	[%l7 + 0x46],	%l4
	call	loop_1010
loop_1009:
	call	loop_1011
	rdhpr	%ver,	%l5
	movule	%fcc3,	0x2F6,	%i3
loop_1010:
	edge16	%i2,	%i6,	%i5
loop_1011:
	fmovsle	%fcc0,	%f0,	%f31
	wrpr	%g2,	0x1723,	%cwp
	array8	%g6,	%o4,	%o1
	call	loop_1012
	call	loop_1013
	call	loop_1014
	rdhpr	%ver,	%o2
loop_1012:
	tleu	%icc,	0x1
loop_1013:
	call	loop_1015
loop_1014:
	brgz,a	%i4,	loop_1016
	call	loop_1017
	call	loop_1018
loop_1015:
	fmovrde	%l1,	%f26,	%f10
loop_1016:
	bleu,a,pt	%icc,	loop_1019
loop_1017:
	call	loop_1020
loop_1018:
	ldstub	[%l7 + 0x33],	%g4
	sdiv	%o3,	%g3,	%l2
loop_1019:
	call	loop_1021
loop_1020:
	call	loop_1022
	fmovso	%fcc0,	%f21,	%f29
	nop
	setx	0x41ACEBC3ECC26827,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0x0E8174AEB15C928F,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	fsubd	%f14,	%f26,	%f14
loop_1021:
	ba,a	%xcc,	loop_1023
loop_1022:
	sethi	0x0EDA,	%o0
	sdivx	%l0,	0x00,	%g7
	call	loop_1024
loop_1023:
	popc	%i7,	%o7
	fsrc2	%f20,	%f30
	tvs	%icc,	0x0
loop_1024:
	call	loop_1025
	call	loop_1026
	ldstub	[%l7 + 0x5C],	%g5
	fmovrsne	%o5,	%f4,	%f14
loop_1025:
	fxnor	%f26,	%f12,	%f30
loop_1026:
	nop
	fitod	%f25,	%f28
	movg	%icc,	0x0FC,	%l3
	set	0x14, %o4
	lduwa	[%l7 + %o4] 0x04,	%i1
	pdist	%f4,	%f16,	%f12
	fmovdo	%fcc2,	%f20,	%f28
	edge8ln	%i0,	%l6,	%o6
	fpadd16	%f28,	%f14,	%f2
	edge16ln	%l4,	%l5,	%i3
	fmovsl	%fcc2,	%f18,	%f0
	fabsd	%f8,	%f10
	fmul8sux16	%f26,	%f14,	%f10
	fmovdlg	%fcc3,	%f30,	%f8
	fandnot2	%f26,	%f26,	%f24
	sra	%g1,	%i6,	%i5
	fmovdle	%fcc0,	%f4,	%f30
	fmul8x16	%f21,	%f16,	%f14
	call	loop_1027
	call	loop_1028
	fbuge,pt	%fcc0,	loop_1029
	nop
	fitod	%f12,	%f2
	fdtoi	%f2,	%f16
loop_1027:
	movvs	%xcc,	0x786,	%i2
loop_1028:
	nop

loop_1029:
	nop

	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 6:
!
!	Type l   	: 25
!	Type a   	: 24
!	Type x   	: 8
!	Type cti   	: 160
!	Type f   	: 147
!	Type i   	: 136
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

!
! Thread 7 Start
!
main_t7:
	mov 	%l7, 	%g1
	!# Set %cwp for 8 windows
	!# This threads memory space into each %l7
	wrpr 	%g0, 	0x7, 	%cwp
	mov 	%g1, 	%l7
	wrpr 	%g0, 	0x6, 	%cwp
	mov 	%g1, 	%l7
	wrpr 	%g0, 	0x5, 	%cwp
	mov 	%g1, 	%l7
	wrpr 	%g0, 	0x4, 	%cwp
	mov 	%g1, 	%l7
	wrpr 	%g0, 	0x3, 	%cwp
	mov 	%g1, 	%l7
	wrpr 	%g0, 	0x2, 	%cwp
	mov 	%g1, 	%l7
	wrpr 	%g0, 	0x1, 	%cwp
	mov 	%g1, 	%l7
	wrpr 	%g0, 	0x0, 	%cwp
	mov 	%g1, 	%l7

	!# Set %fsr
	setx 	0x0000000000000000,	%l0,	%l6	!# no post process
	stx 	%l6, 	[%l7 + 0x0]	!# no post process
	ldx 	[%l7 + 0x0], 	%fsr	!# no post process

	!# Initialize registers ..

	!# Global registers
	set	0xC,	%g1
	set	0x4,	%g2
	set	0xA,	%g3
	set	0x8,	%g4
	set	0x5,	%g5
	set	0x6,	%g6
	set	0xD,	%g7
	!# Input registers
	set	-0x4,	%i0
	set	-0x4,	%i1
	set	-0xD,	%i2
	set	-0xB,	%i3
	set	-0x6,	%i4
	set	-0x9,	%i5
	set	-0x1,	%i6
	set	-0x1,	%i7
	!# Local registers
	set	0x3D68992B,	%l0
	set	0x745FBAC8,	%l1
	set	0x5049B538,	%l2
	set	0x4B17696A,	%l3
	set	0x05BDB5A5,	%l4
	set	0x683AACE0,	%l5
	set	0x51660C2A,	%l6
	!# Output registers
	set	-0x0AAB,	%o0
	set	0x0C39,	%o1
	set	0x06F5,	%o2
	set	-0x122F,	%o3
	set	-0x1029,	%o4
	set	-0x038B,	%o5
	set	-0x17A9,	%o6
	set	-0x02F6,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0xF9E0BBFB632344C2)
	INIT_TH_FP_REG(%l7,%f2,0x53C87029AA2FE833)
	INIT_TH_FP_REG(%l7,%f4,0xDE952A53A3AD06F4)
	INIT_TH_FP_REG(%l7,%f6,0x4829F0FA358AAB1A)
	INIT_TH_FP_REG(%l7,%f8,0x3E56A552936BFBAC)
	INIT_TH_FP_REG(%l7,%f10,0x5FEC588976E3FF0F)
	INIT_TH_FP_REG(%l7,%f12,0x59960BCB796288EC)
	INIT_TH_FP_REG(%l7,%f14,0x02BB7E99E16D67F4)
	INIT_TH_FP_REG(%l7,%f16,0x2B88127A028E0C9D)
	INIT_TH_FP_REG(%l7,%f18,0x1F7BC94AED1048E0)
	INIT_TH_FP_REG(%l7,%f20,0x6AAEFD748E8AA9B7)
	INIT_TH_FP_REG(%l7,%f22,0x42D30B68F5F003E5)
	INIT_TH_FP_REG(%l7,%f24,0x1FD9A46546DB3789)
	INIT_TH_FP_REG(%l7,%f26,0x74E49AFE0AE9E70A)
	INIT_TH_FP_REG(%l7,%f28,0x9610A29EE8E2CA43)
	INIT_TH_FP_REG(%l7,%f30,0x0E709079768FBC1E)

	!# Execute Main Diag ..

	fornot1s	%f6,	%f5,	%f22
	te	%xcc,	0x7
	nop
	setx	0xAB084EF160BC2898,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0x9F457F01C09C36DB,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	fdivd	%f22,	%f8,	%f2
	fbug	%fcc2,	loop_1030
	call	loop_1031
	call	loop_1032
	brz,pn	%g6,	loop_1033
loop_1030:
	call	loop_1034
loop_1031:
	movlg	%fcc3,	%o4,	%o1
loop_1032:
	fmovsne	%xcc,	%f19,	%f25
loop_1033:
	fmovdle	%fcc3,	%f0,	%f4
loop_1034:
	nop
	fitos	%f1,	%f28
	fstod	%f28,	%f14
	call	loop_1035
	fmovrdgz	%g2,	%f18,	%f2
	mulx	%i4,	%l1,	%g4
	set	0x58, %o7
	lduwa	[%l7 + %o7] 0x89,	%o3
loop_1035:
	edge16	%g3,	%l2,	%o0
	movvc	%xcc,	%o2,	%g7
	call	loop_1036
	call	loop_1037
	nop
	fitod	%f13,	%f2
	orcc	%i7,	0x17D8,	%o7
loop_1036:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_1037:
	call	loop_1038
	call	loop_1039
	fmovdg	%fcc0,	%f8,	%f10
	call	loop_1040
loop_1038:
	tpos	%xcc,	0x5
loop_1039:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	orncc	%i1,	%l6,	%i0
loop_1040:
	call	loop_1041
	wr 	%g0, 	0x5, 	%fprs
	nop
	fitos	%f4,	%f5
	fstox	%f5,	%f2
	call	loop_1042
loop_1041:
	fmul8x16al	%f26,	%f2,	%f20
	membar	#Sync
	set	0x40, %l2
	ldda	[%l7 + %l2] 0x16,	%f0
loop_1042:
	movrne	%o6,	0x1AC,	%i3
	fmovdcc	%icc,	%f20,	%f24
	wrpr	%g1,	0x1FCF,	%tick
	fmovscc	%xcc,	%f29,	%f26
	fnands	%f22,	%f12,	%f11
	fmovsleu	%xcc,	%f31,	%f23
	addc	%i6,	0x07DC,	%l5
	call	loop_1043
	movrlez	%i5,	%i2,	%o4
	call	loop_1044
	fsrc2s	%f7,	%f7
loop_1043:
	fmovsul	%fcc0,	%f18,	%f14
	fpsub16s	%f21,	%f8,	%f2
loop_1044:
	fmovsneg	%xcc,	%f25,	%f26
	rdhpr	%hpstate,	%o1
	fblg	%fcc3,	loop_1045
	tpos	%icc,	0x5
	fpackfix	%f2,	%f10
	tvc	%icc,	0x6
loop_1045:
	call	loop_1046
	brlz,a,pn	%g6,	loop_1047
	movvc	%icc,	%g2,	%l1
	smulcc	%i4,	0x13BE,	%o3
loop_1046:
	call	loop_1048
loop_1047:
	edge16	%g3,	%l2,	%o0
	fmovdne	%fcc3,	%f30,	%f20
	edge8ln	%g4,	%o2,	%g7
loop_1048:
	call	loop_1049
	tg	%icc,	0x2
	wrpr	%o7,	0x0F21,	%cwp
	fsrc1	%f10,	%f26
loop_1049:
	movne	%icc,	0x1FC,	%i7
	siam	0x6
	add	%l0,	0x1549,	%o5
	call	loop_1050
	fnand	%f8,	%f18,	%f14
	call	loop_1051
	fmovrdgz	%g5,	%f28,	%f28
loop_1050:
	nop
	set	0x40, %o2
	stda	%f16,	[%l7 + %o2] 0xcc
loop_1051:
	nop
	wr	%g0,	0x18,	%asi
	lduha	[%l7 + 0x48] %asi,	%l3
	edge16n	%i1,	%i0,	%l6
	wr	%l4,	%o6,	%softint
	fmovdlg	%fcc3,	%f18,	%f2
	umul	%g1,	%i6,	%l5
	orncc	%i5,	0x0D46,	%i3
	tvc	%xcc,	0x6
	movvc	%xcc,	0x7F8,	%o4
	nop
	setx	0xC39D433E,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f7
	setx	0x26D7858F,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f19
	fsubs	%f19,	%f7,	%f21
	call	loop_1052
	call	loop_1053
	tne	%xcc,	0x4
	call	loop_1054
loop_1052:
	movuge	%fcc2,	%i2,	%o1
loop_1053:
	nop
	set	0x77, %i4
	ldstub	[%l7 + %i4],	%g6
	fandnot1s	%f24,	%f7,	%f31
loop_1054:
	tle	%xcc,	0x0
	sdiv	%l1,	0x00,	%g2
	edge16l	%o3,	%g3,	%l2
	movug	%fcc0,	%o0,	%g4
	fmovda	%fcc0,	%f6,	%f14
	fmovrdlez	%o2,	%f14,	%f14
	tn	%xcc,	0x6
	ble	%xcc,	loop_1055
	tcs	%icc,	0x7
	movvs	%xcc,	0x239,	%i4
	movo	%fcc2,	0x35C,	%o7
loop_1055:
	call	loop_1056
	fmovrsne	%i7,	%f25,	%f10
	call	loop_1057
	movre	%g7,	0x2C1,	%l0
loop_1056:
	call	loop_1058
	faligndata	%f30,	%f16,	%f4
loop_1057:
	udiv	%o5,	%g5,	%i1
	rdpr	%cwp,	%i0
loop_1058:
	bshuffle	%f2,	%f10,	%f14
	tl	%icc,	0x6
	call	loop_1059
	wr	%l3,	%l4,	%clear_softint
	fmovsuge	%fcc1,	%f25,	%f4
	call	loop_1060
loop_1059:
	call	loop_1061
	ta	%icc,	0x4
	call	loop_1062
loop_1060:
	call	loop_1063
loop_1061:
	fbul,a	%fcc2,	loop_1064
	call	loop_1065
loop_1062:
	call	loop_1066
loop_1063:
	stx	%l6,	[%l7 + 0x70]
loop_1064:
	fmovrdgz	%g1,	%f24,	%f30
loop_1065:
	call	loop_1067
loop_1066:
	call	loop_1068
	fxor	%f18,	%f16,	%f20
	edge8ln	%i6,	%o6,	%i5
loop_1067:
	fnegd	%f16,	%f28
loop_1068:
	tcs	%icc,	0x5
	movre	%l5,	%i3,	%i2
	movgu	%xcc,	0x576,	%o1
	fcmps	%fcc0,	%f8,	%f28
	fsrc1	%f10,	%f2
	fmovrse	%o4,	%f31,	%f26
	orn	%g6,	%g2,	%o3
	call	loop_1069
	nop
	set	0x5A, %o5
	lduh	[%l7 + %o5],	%l1
	alignaddrl	%l2,	%o0,	%g3
	call	loop_1070
loop_1069:
	edge8	%g4,	%i4,	%o7
	call	loop_1071
	wr	%o2,	%i7,	%pic
loop_1070:
	call	loop_1072
	sir	0x110F
loop_1071:
	edge32	%g7,	%o5,	%g5
	fmovsg	%fcc1,	%f0,	%f29
loop_1072:
	call	loop_1073
	call	loop_1074
	fcmped	%fcc3,	%f0,	%f6
	call	loop_1075
loop_1073:
	call	loop_1076
loop_1074:
	fmovrsgez	%i1,	%f11,	%f2
	call	loop_1077
loop_1075:
	call	loop_1078
loop_1076:
	movo	%fcc0,	0x5F8,	%l0
	fble,pt	%fcc0,	loop_1079
loop_1077:
	fpackfix	%f28,	%f19
loop_1078:
	andncc	%i0,	%l3,	%l6
	tsubcctv	%l4,	0x1F28,	%g1
loop_1079:
	fbe	%fcc2,	loop_1080
	fandnot2	%f10,	%f22,	%f8
	nop
	setx	0x76A8C56DDDB3617C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	fsqrtd	%f8,	%f6
	add	%o6,	0x1381,	%i6
loop_1080:
	fnegd	%f8,	%f2
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	call	loop_1081
	edge16l	%l5,	%i5,	%i2
	movrne	%i3,	%o1,	%o4
	bge,a	%xcc,	loop_1082
loop_1081:
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	fandnot1s	%f19,	%f20,	%f28
	call	loop_1083
loop_1082:
	fcmps	%fcc2,	%f31,	%f25
	udivcc	%g6,	0x00,	%o3
	call	loop_1084
loop_1083:
	sll	%l1,	%l2,	%g2
	fmul8sux16	%f0,	%f24,	%f8
	mova	%fcc0,	0x393,	%g3
loop_1084:
	fmovs	%f11,	%f8
	call	loop_1085
	nop
	set	0x28, %l0
	stx	%fsr,	[%l7 + %l0]
	tsubcc	%o0,	%i4,	%g4
	edge8l	%o2,	%o7,	%i7
loop_1085:
	call	loop_1086
	fblg,a	%fcc3,	loop_1087
	fornot2	%f24,	%f6,	%f10
	bl,a,pn	%xcc,	loop_1088
loop_1086:
	st	%fsr,	[%l7 + 0x34]
loop_1087:
	fmovdlg	%fcc1,	%f20,	%f10
	set	0x08, %g7
	lduba	[%l7 + %g7] 0x80,	%g7
loop_1088:
	nop
	setx	0xD06B8118,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f24
	setx	0x6A9F9CD3,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f2
	fadds	%f2,	%f24,	%f17
	membar	0x48
	rd	%sys_tick_cmpr,	%g5
	call	loop_1089
	edge16ln	%o5,	%i1,	%l0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fnands	%f7,	%f1,	%f10
loop_1089:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x673, 	%hsys_tick_cmpr
	fnot2s	%f26,	%f4
	call	loop_1090
	fbn,a	%fcc3,	loop_1091
	nop
	fitos	%f5,	%f27
	fstox	%f27,	%f28
	fxtos	%f28,	%f22
	xnor	%l4,	%o6,	%i6
loop_1090:
	fmovsa	%icc,	%f27,	%f9
loop_1091:
	subc	%g1,	%l5,	%i2
	flushw
	movue	%fcc0,	%i5,	%o1
	fmovsvs	%icc,	%f21,	%f26
	fmovdule	%fcc0,	%f14,	%f16
	lduw	[%l7 + 0x78],	%i3
	call	loop_1092
	fmovrsgz	%o4,	%f26,	%f6
	fpack16	%f24,	%f14
	nop
	setx	0x4E939416CB56F7FE,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	fsqrtd	%f10,	%f22
loop_1092:
	nop
	set	0x58, %g5
	prefetcha	[%l7 + %g5] 0x88,	 0
	umul	%g6,	%l1,	%g2
	fmovscs	%xcc,	%f4,	%f16
	movneg	%icc,	%g3,	%o0
	fbe,a	%fcc3,	loop_1093
	call	loop_1094
	nop
	set	0x68, %l4
	std	%f12,	[%l7 + %l4]
	call	loop_1095
loop_1093:
	movle	%fcc2,	%i4,	%l2
loop_1094:
	fmovrdlez	%g4,	%f30,	%f14
	call	loop_1096
loop_1095:
	fmovdneg	%xcc,	%f10,	%f14
	smulcc	%o7,	%o2,	%i7
	siam	0x6
loop_1096:
	nop
	wr	%g0,	0x80,	%asi
	lduwa	[%l7 + 0x74] %asi,	%g5
	call	loop_1097
	call	loop_1098
	fnot2s	%f25,	%f22
	edge32n	%o5,	%g7,	%l0
loop_1097:
	call	loop_1099
loop_1098:
	fmovsuge	%fcc2,	%f11,	%f4
	call	loop_1100
	tl	%xcc,	0x6
loop_1099:
	andncc	%i1,	%l6,	%l3
	fpadd16s	%f3,	%f13,	%f31
loop_1100:
	call	loop_1101
	udiv	%l4,	0x00,	%i0
	fandnot2	%f30,	%f2,	%f16
	call	loop_1102
loop_1101:
	movpos	%xcc,	0x5F5,	%i6
	brgez,a,pn	%o6,	loop_1103
	fmovsug	%fcc0,	%f8,	%f17
loop_1102:
	nop
	setx	0xCF74FC8B,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f12
	setx	0x4705D138,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f4
	fsubs	%f4,	%f12,	%f23
	call	loop_1104
loop_1103:
	bg,a,pn	%icc,	loop_1105
	bvc,a	%icc,	loop_1106
	sllx	%l5,	%g1,	%i2
loop_1104:
	fmul8x16au	%f7,	%f0,	%f24
loop_1105:
	fandnot1s	%f28,	%f23,	%f10
loop_1106:
	fmovsle	%icc,	%f20,	%f11
	tgu	%icc,	0x0
	movgu	%icc,	%i5,	%i3
	flushw
	fzero	%f24
	fmovrsgz	%o1,	%f22,	%f28
	nop
	setx	0xC9C4DB3B,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f15
	setx	0x8C37E697,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f18
	fmuls	%f18,	%f15,	%f1
	bn,a,pn	%icc,	loop_1107
	fmovduge	%fcc3,	%f18,	%f22
	fpsub32s	%f21,	%f11,	%f21
	fnand	%f24,	%f14,	%f8
loop_1107:
	rdhpr	%hsys_tick_cmpr,	%o4
	fands	%f9,	%f5,	%f9
	fmovsge	%icc,	%f5,	%f7
	tl	%xcc,	0x3
	fcmple16	%f12,	%f6,	%o3
	wr	%g6,	%g2,	%y
	fcmped	%fcc1,	%f8,	%f12
	rdhpr	%ver,	%g3
	call	loop_1108
	fabsd	%f30,	%f30
	udivx	%l1,	%o0,	%i4
	movg	%xcc,	0x353,	%l2
loop_1108:
	rdpr	%cleanwin,	%o7
	fmovdug	%fcc1,	%f0,	%f22
	call	loop_1109
	fornot2s	%f23,	%f21,	%f10
	fmovsug	%fcc2,	%f3,	%f8
	nop
	fitos	%f1,	%f19
	fstox	%f19,	%f16
loop_1109:
	fone	%f4
	bvc,pn	%icc,	loop_1110
	edge32n	%g4,	%o2,	%g5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xE3E, 	%hsys_tick_cmpr
	udiv	%g7,	0x00,	%l0
loop_1110:
	call	loop_1111
	fcmps	%fcc2,	%f31,	%f28
	fbge,a,pt	%fcc1,	loop_1112
	call	loop_1113
loop_1111:
	call	loop_1114
	fmovsul	%fcc2,	%f5,	%f31
loop_1112:
	tge	%icc,	0x5
loop_1113:
	call	loop_1115
loop_1114:
	call	loop_1116
	call	loop_1117
	edge8l	%i1,	%l6,	%l3
loop_1115:
	call	loop_1118
loop_1116:
	call	loop_1119
loop_1117:
	fmovso	%fcc1,	%f11,	%f25
	rd	%tick_cmpr,	%l4
loop_1118:
	brnz,pn	%i7,	loop_1120
loop_1119:
	fmovsl	%fcc0,	%f1,	%f30
	fornot2	%f20,	%f22,	%f26
	fpadd32s	%f16,	%f22,	%f19
loop_1120:
	fpsub16	%f0,	%f24,	%f2
	flushw
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	movue	%fcc2,	%i0,	%o6
	movre	%l5,	%i6,	%i2
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	fmovsul	%fcc3,	%f29,	%f30
	call	loop_1121
	movpos	%icc,	0x5EE,	%i5
	call	loop_1122
	movuge	%fcc3,	%i3,	%g1
loop_1121:
	fpack16	%f16,	%f30
	faligndata	%f30,	%f0,	%f4
loop_1122:
	tn	%xcc,	0x3
	fmovsule	%fcc0,	%f5,	%f12
	fnot1s	%f17,	%f20
	call	loop_1123
	wrpr	%o4,	%o1,	%cwp
	mulx	%o3,	0x0658,	%g2
	call	loop_1124
loop_1123:
	st	%f24,	[%l7 + 0x28]
	fmuld8sux16	%f21,	%f18,	%f4
	call	loop_1125
loop_1124:
	fands	%f0,	%f23,	%f15
	fxnors	%f30,	%f28,	%f24
	fmovsuge	%fcc3,	%f26,	%f18
loop_1125:
	wr	%g3,	0x124E,	%sys_tick
	fones	%f28
	call	loop_1126
	fmovduge	%fcc2,	%f16,	%f16
	fcmpeq16	%f4,	%f2,	%l1
	nop
	setx	0x8EDC0215,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f31
	fsqrts	%f31,	%f9
loop_1126:
	movcs	%icc,	0x6AA,	%g6
	movu	%fcc0,	%i4,	%l2
	fmovrdlez	%o7,	%f14,	%f20
	te	%xcc,	0x5
	orn	%g4,	0x0179,	%o0
	ble	%icc,	loop_1127
	tpos	%xcc,	0x2
	fmovdn	%icc,	%f18,	%f20
	alignaddrl	%o2,	%o5,	%g5
loop_1127:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x608, 	%hsys_tick_cmpr
	fmovsle	%icc,	%f27,	%f0
	call	loop_1128
	nop
	set	0x50, %i7
	prefetch	[%l7 + %i7],	 1
	call	loop_1129
	call	loop_1130
loop_1128:
	movvs	%xcc,	0x6E4,	%l6
	nop
	setx	0x8FB62130F751FA6A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0x4A7B845F54F6389D,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	faddd	%f12,	%f6,	%f14
loop_1129:
	call	loop_1131
loop_1130:
	wrpr 	%g0, 	0x0, 	%gl
	movneg	%xcc,	0x189,	%i1
	call	loop_1132
loop_1131:
	fnegs	%f24,	%f4
	prefetch	[%l7 + 0x38],	 0
	bcs	%icc,	loop_1133
loop_1132:
	edge16ln	%l4,	%i7,	%i0
	movrlez	%l5,	0x088,	%i6
	call	loop_1134
loop_1133:
	movl	%xcc,	%o6,	%i5
	umulcc	%i2,	%g1,	%i3
	rd	%sys_tick_cmpr,	%o4
loop_1134:
	bcs,a	%icc,	loop_1135
	fmovrdne	%o1,	%f16,	%f18
	te	%icc,	0x5
	call	loop_1136
loop_1135:
	fmovrslz	%o3,	%f15,	%f25
	fmovde	%icc,	%f20,	%f2
	call	loop_1137
loop_1136:
	wr	%g2,	%g3,	%ccr
	nop
	setx	0x59260996E9B56187,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0xEED9DFA6C6E37ED1,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	fdivd	%f2,	%f22,	%f8
	fmovdle	%xcc,	%f22,	%f20
loop_1137:
	fmovdlg	%fcc2,	%f20,	%f6
	fcmple32	%f10,	%f12,	%g6
	fmovrde	%l1,	%f2,	%f8
	popc	%i4,	%l2
	fmovs	%f0,	%f8
	fpsub16s	%f15,	%f0,	%f26
	andn	%g4,	0x1E83,	%o7
	call	loop_1138
	movvc	%icc,	0x5E2,	%o2
	add	%l7,	0x50,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] %asi,	%o0,	%o5
loop_1138:
	mulx	%g5,	0x053F,	%g7
	call	loop_1139
	movo	%fcc2,	%l6,	%l0
	fbul,a,pt	%fcc3,	loop_1140
	call	loop_1141
loop_1139:
	fbug,a,pn	%fcc3,	loop_1142
	fbul,a	%fcc3,	loop_1143
loop_1140:
	fmovdvs	%icc,	%f18,	%f20
loop_1141:
	rd	%pc,	%i1
loop_1142:
	fba,pn	%fcc1,	loop_1144
loop_1143:
	tsubcc	%l4,	%i7,	%i0
	fpsub32s	%f14,	%f22,	%f23
	fsrc2	%f20,	%f20
loop_1144:
	edge8ln	%l5,	%i6,	%o6
	fmovsvc	%xcc,	%f7,	%f1
	call	loop_1145
	edge32ln	%l3,	%i5,	%i2
	edge8	%g1,	%i3,	%o1
	call	loop_1146
loop_1145:
	nop
	setx	0xBB4D5EFB,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f16
	setx	0x04FA0B33,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f28
	fadds	%f28,	%f16,	%f1
	fmovdn	%xcc,	%f6,	%f24
	fmovdlg	%fcc3,	%f8,	%f18
loop_1146:
	fone	%f8
	fcmple32	%f2,	%f0,	%o4
	fcmpeq32	%f18,	%f8,	%g2
	fmovslg	%fcc2,	%f31,	%f22
	fand	%f2,	%f30,	%f18
	call	loop_1147
	call	loop_1148
	call	loop_1149
	sdivx	%o3,	0x00,	%g6
loop_1147:
	xorcc	%g3,	%l1,	%i4
loop_1148:
	call	loop_1150
loop_1149:
	array16	%l2,	%g4,	%o2
	call	loop_1151
	sdivx	%o7,	%o5,	%o0
loop_1150:
	rdhpr	%ver,	%g5
	bvc	%xcc,	loop_1152
loop_1151:
	fmovde	%fcc1,	%f24,	%f20
	call	loop_1153
	call	loop_1154
loop_1152:
	call	loop_1155
	fsrc2	%f16,	%f30
loop_1153:
	movcc	%xcc,	%l6,	%l0
loop_1154:
	fmovsle	%fcc2,	%f16,	%f12
loop_1155:
	and	%g7,	0x190C,	%l4
	fmovsue	%fcc2,	%f29,	%f1
	nop
	setx	loop_1156,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x011400001402,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	rdpr	%tt,	%l1
	wrpr	%g0,	%l1,	%tt
	rdpr	%pstate,	%l1
	wrpr	%g0,	%l1,	%pstate
	rdpr	%tl,	%l1
	wrpr	%g0,	%l1,	%tl
	rdpr	%tpc,	%l1
	wrpr	%g0,	%l1,	%tpc
	rdpr	%tnpc,	%l1
	wrpr	%g0,	%l1,	%tnpc
	rdpr	%tstate,	%l1
	wrpr	%g0,	%l1,	%tstate
	rdpr	%tba,	%l1
	wrpr	%g0,	%l1,	%tba
	rdpr	%tba,	%l1
	wrpr	%g0,	%l1,	%tba
	rdhpr	%hpstate,	%l1
	wrhpr	%g0,	%l1,	%hpstate
	rdhpr	%htstate,	%l1
	wrhpr	%g0,	%l1,	%htstate
	rdhpr	%hintp,	%l1
	wrhpr	%g0,	%l1,	%hintp
	done
	call	loop_1157
	fmovdule	%fcc0,	%f24,	%f16
	call	loop_1158
loop_1156:
	tsubcctv	%i7,	0x06C6,	%i0
loop_1157:
	call	loop_1159
	movrlz	%l5,	%i6,	%o6
loop_1158:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x960, 	%hsys_tick_cmpr
	call	loop_1160
loop_1159:
	call	loop_1161
	call	loop_1162
	ldsh	[%l7 + 0x60],	%l3
loop_1160:
	call	loop_1163
loop_1161:
	call	loop_1164
loop_1162:
	movneg	%icc,	0x16B,	%i2
	fmovdpos	%icc,	%f16,	%f10
loop_1163:
	movn	%icc,	0x011,	%i5
loop_1164:
	fnot2	%f0,	%f8
	andn	%i3,	%g1,	%o1
	movneg	%icc,	0x532,	%o4
	fornot2	%f24,	%f6,	%f12
	call	loop_1165
	alignaddr	%g2,	%o3,	%g6
	call	loop_1166
	call	loop_1167
loop_1165:
	nop
	fitod	%f6,	%f22
	fdtos	%f22,	%f15
	movul	%fcc2,	0x1AA,	%g3
loop_1166:
	fnors	%f19,	%f21,	%f23
loop_1167:
	tleu	%icc,	0x6
	call	loop_1168
	bshuffle	%f6,	%f8,	%f20
	bcc,a,pn	%icc,	loop_1169
	bvc,a	%icc,	loop_1170
loop_1168:
	fmovsa	%fcc3,	%f16,	%f23
	nop
	setx	0xB71AB505,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f10
	setx	0x6D8541D2,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f3
	fdivs	%f3,	%f10,	%f28
loop_1169:
	fpack16	%f30,	%f15
loop_1170:
	call	loop_1171
	call	loop_1172
	call	loop_1173
	array16	%i4,	%l1,	%g4
loop_1171:
	fmovscc	%xcc,	%f12,	%f7
loop_1172:
	call	loop_1174
loop_1173:
	call	loop_1175
	sub	%l2,	%o7,	%o5
	xnor	%o0,	%o2,	%g5
loop_1174:
	fnands	%f30,	%f23,	%f28
loop_1175:
	fmovdne	%xcc,	%f0,	%f24
	wrpr 	%g0, 	0x1, 	%gl
	fpsub16s	%f18,	%f18,	%f22
	edge32l	%g7,	%l4,	%i7
	call	loop_1176
	xnor	%i0,	%l6,	%l5
	flushw
	bshuffle	%f18,	%f24,	%f26
loop_1176:
	xor	%o6,	0x164E,	%i1
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 7:
!
!	Type l   	: 19
!	Type a   	: 29
!	Type x   	: 8
!	Type cti   	: 147
!	Type f   	: 157
!	Type i   	: 140
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


	EXIT_GOOD	/* test finish  */

/************************************************************************
   Test case data start
 ************************************************************************/
.data
user_data_start:
scratch_area:
.word 0x3EE8D1BF
.word 0xB6868AF3
.word 0x32526413
.word 0xA75ACACB
.word 0x7AC44229
.word 0x0D257678
.word 0xCDAAEEAE
.word 0x2F8ED2CC
.word 0xABA09ABC
.word 0x1C413532
.word 0xCDD4BBFF
.word 0xD3E53190
.word 0x4EDBA66F
.word 0x25174353
.word 0xBC9463EF
.word 0x6CB305D2
.word 0x5F1E2CF6
.word 0x8F31AC52
.word 0x2CAB1138
.word 0x75C0BA99
.word 0xC7339C04
.word 0xB8D8D99B
.word 0x6FF846AE
.word 0x76C340FE
.word 0x56FD2D96
.word 0xDC7C026D
.word 0x2001E2BC
.word 0xFECADA61
.word 0xD7DB4C8B
.word 0xB52DF378
.word 0xBBB66A8E
.word 0x5C288FBA
.word 0x8A9DC3C9
.word 0x1406C018
.word 0x79843CEB
.word 0x64A5E140
.word 0x1FCB20E9
.word 0x4224BADA
.word 0x7BBD24BB
.word 0x40D3E16E
.word 0x79949A5D
.word 0xE2DA14A7
.word 0x367619F5
.word 0xE4BFD116
.word 0xAB56E645
.word 0x9AD09CB1
.word 0x1274935A
.word 0xEDFC5037
.word 0x6C07AB8F
.word 0x4E3E4526
.word 0x277C4D70
.word 0x2061805A
.word 0xD40BAE45
.word 0x951FDC94
.word 0x6B500540
.word 0xE4CC1B12
.word 0xD49C646B
.word 0x8C858049
.word 0x781B7ABE
.word 0x9561E0E8
.word 0x79BB4BEA
.word 0x69C0EAA5
.word 0x4F87BAFB
.word 0x35B82465
.end
