/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: fgu_idiv_traps_10.s
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
.ident "FOCUSCASE: focus.pm,v 1.1 2003/04/23 17:53:39 somePerson Exp somePerson $ spc_basic_isa3.pl FOCUS_SEED=133254876"
.ident "Thu Dec 11 11:48:49 CST 2003"
.ident "Using Instruction Hash for Focus :$Id: fgu_idiv_traps_10.s,v 1.4 2007/07/27 21:45:31 drp Exp $"
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
	set	0xE,	%g2
	set	0x0,	%g3
	set	0x2,	%g4
	set	0x4,	%g5
	set	0xF,	%g6
	set	0x1,	%g7
	!# Input registers
	set	-0x5,	%i0
	set	-0x4,	%i1
	set	-0xB,	%i2
	set	-0xD,	%i3
	set	-0x9,	%i4
	set	-0x4,	%i5
	set	-0x7,	%i6
	set	-0x1,	%i7
	!# Local registers
	set	0x099F326E,	%l0
	set	0x01971FD1,	%l1
	set	0x3E4901DD,	%l2
	set	0x7F8B4035,	%l3
	set	0x2DA35024,	%l4
	set	0x276B6EF3,	%l5
	set	0x715D34DD,	%l6
	!# Output registers
	set	-0x0CBE,	%o0
	set	0x0AF2,	%o1
	set	0x1F8B,	%o2
	set	-0x09EA,	%o3
	set	-0x1FD2,	%o4
	set	0x1B91,	%o5
	set	0x11B5,	%o6
	set	-0x1B2D,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0xD523630FDD061F8B)
	INIT_TH_FP_REG(%l7,%f2,0xAE0CDD1D39273890)
	INIT_TH_FP_REG(%l7,%f4,0xEA6C9FE21A53F8CA)
	INIT_TH_FP_REG(%l7,%f6,0xE96E6C657E02C71B)
	INIT_TH_FP_REG(%l7,%f8,0xFB09BCEC42A88D3F)
	INIT_TH_FP_REG(%l7,%f10,0x34A9A3AAA8FAD540)
	INIT_TH_FP_REG(%l7,%f12,0x0AF9C80D0A157C13)
	INIT_TH_FP_REG(%l7,%f14,0x70D050BFAA949054)
	INIT_TH_FP_REG(%l7,%f16,0x64C2D9F7783E696B)
	INIT_TH_FP_REG(%l7,%f18,0x53EE6B281353063D)
	INIT_TH_FP_REG(%l7,%f20,0x92269AD949643F8D)
	INIT_TH_FP_REG(%l7,%f22,0x9F25609CD5C02745)
	INIT_TH_FP_REG(%l7,%f24,0x7C2B8BE5FE50BC3F)
	INIT_TH_FP_REG(%l7,%f26,0xA8F8ABCD4B791C0D)
	INIT_TH_FP_REG(%l7,%f28,0x7D3EC69CA2CCFD4E)
	INIT_TH_FP_REG(%l7,%f30,0x542D35F2E88B05C0)

	!# Execute Main Diag ..

	fbl,pn	%fcc1,	loop_1
	call	loop_2
	call	loop_3
	call	loop_4
loop_1:
	rdpr	%cwp,	%g3
loop_2:
	tgu	%xcc,	0x6
loop_3:
	call	loop_5
loop_4:
	wr 	%g0, 	0x6, 	%fprs
	fabsd	%f12,	%f22
	movleu	%xcc,	%g5,	%o3
loop_5:
	membar	0x7D
	call	loop_6
	call	loop_7
	movu	%fcc1,	%g4,	%i6
	nop
	setx	0xC18E372F,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f1
	setx	0x90208E6B,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f15
	fadds	%f15,	%f1,	%f2
loop_6:
	call	loop_8
loop_7:
	fmul8x16au	%f8,	%f2,	%f26
	smulcc	%l1,	0x1AEA,	%o0
	fpadd16	%f4,	%f6,	%f12
loop_8:
	edge32	%o1,	%g6,	%i1
	nop
	setx	0x766C1C47,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f8
	setx	0x99080DD3,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f19
	fdivs	%f19,	%f8,	%f20
	srax	%g7,	%g1,	%i5
	movue	%fcc0,	%i3,	%o7
	call	loop_9
	call	loop_10
	call	loop_11
	alignaddrl	%l5,	%i0,	%o5
loop_9:
	for	%f30,	%f8,	%f2
loop_10:
	fmovsu	%fcc2,	%f4,	%f4
loop_11:
	fnot2	%f6,	%f16
	call	loop_12
	call	loop_13
	fabss	%f25,	%f0
	fmovsneg	%xcc,	%f15,	%f7
loop_12:
	fmovda	%icc,	%f24,	%f28
loop_13:
	wrpr	%o6,	%o2,	%tick
	bcs,pn	%xcc,	loop_14
	ta	%xcc,	0x2
	srlx	%g2,	0x14,	%i7
	edge16n	%l0,	%o4,	%i4
loop_14:
	fpsub32	%f28,	%f20,	%f26
	fcmpne32	%f18,	%f20,	%l3
	sdiv	%l2,	0x00,	%g3
	call	loop_15
	fmovdule	%fcc2,	%f12,	%f8
	fpsub16s	%f7,	%f1,	%f10
	call	loop_16
loop_15:
	call	loop_17
	call	loop_18
	nop
	set	0x40, %o4
	ldx	[%l7 + %o4],	%i2
loop_16:
	for	%f12,	%f10,	%f16
loop_17:
	fnor	%f22,	%f10,	%f14
loop_18:
	andcc	%l4,	0x04E6,	%l6
	tl	%xcc,	0x1
	set	0x4B, %o3
	lduba	[%l7 + %o3] 0x11,	%g5
	call	loop_19
	fabsd	%f22,	%f10
	movul	%fcc3,	0x119,	%g4
	fpsub32s	%f19,	%f31,	%f15
loop_19:
	wrpr 	%g0, 	0x1, 	%gl
	for	%f28,	%f6,	%f12
	call	loop_20
	fmovsa	%fcc3,	%f24,	%f6
	call	loop_21
	call	loop_22
loop_20:
	fmovsn	%fcc1,	%f8,	%f22
	flush	%l7 + 0x18
loop_21:
	tneg	%icc,	0x0
loop_22:
	movgu	%xcc,	%o0,	%i6
	call	loop_23
	edge32	%o1,	%g6,	%i1
	fmovdle	%fcc3,	%f0,	%f10
	nop
	setx	0xB375EA6DADCBA8E8,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0x15703D4A2E184AA2,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	fdivd	%f14,	%f24,	%f6
loop_23:
	sdiv	%g7,	0x00,	%i5
	call	loop_24
	nop
	fitod	%f12,	%f6
	fdtos	%f6,	%f2
	call	loop_25
	call	loop_26
loop_24:
	call	loop_27
	fandnot1	%f12,	%f12,	%f28
loop_25:
	fornot2s	%f0,	%f3,	%f18
loop_26:
	tle	%xcc,	0x1
loop_27:
	alignaddrl	%g1,	%o7,	%i3
	call	loop_28
	bn,a	%icc,	loop_29
	fnot2	%f14,	%f22
	array8	%l5,	%o5,	%o6
loop_28:
	sub	%i0,	0x12D4,	%o2
loop_29:
	fmovdgu	%icc,	%f18,	%f22
	or	%i7,	0x1272,	%l0
	call	loop_30
	subcc	%o4,	0x12C2,	%g2
	nop
	setx	0xC642D142,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f13
	setx	0x11CEB7EF,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f30
	fsubs	%f30,	%f13,	%f21

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_30:
	fmovda	%icc,	%f8,	%f8
	fmovdvs	%xcc,	%f4,	%f6
	call	loop_31
	fmovrsne	%l2,	%f30,	%f5
	call	loop_32
	fpack32	%f10,	%f20,	%f2
loop_31:
	fmul8x16	%f17,	%f30,	%f8
	nop
	setx	0xA6DF098AC3101439,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0x9B95C669,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	fsmuld	%f24,	%f20,	%f16
loop_32:
	movul	%fcc2,	0x638,	%i2
	tcs	%xcc,	0x2
	ble,a	%icc,	loop_33
	fmovdcs	%xcc,	%f6,	%f24
	call	loop_34
	fmovso	%fcc1,	%f2,	%f21
loop_33:
	nop
	add	%l7,	0x20,	%l6
	wr	%g0,	0x04,	%asi
	casxa	[%l6] %asi,	%g3,	%l4
loop_34:
	fmovdcc	%icc,	%f20,	%f4
	rdpr	%cwp,	%g5
	call	loop_35
	nop
	fitos	%f2,	%f23
	fstox	%f23,	%f24
	fxtos	%f24,	%f27
	fmovsgu	%xcc,	%f18,	%f2
	call	loop_36
loop_35:
	sethi	0x0E5D,	%g4
	tle	%icc,	0x4
	orcc	%o3,	0x0156,	%l1
loop_36:
	call	loop_37
	edge32ln	%l6,	%o0,	%o1
	fmovsl	%fcc1,	%f4,	%f0
	movleu	%xcc,	0x5C8,	%g6
loop_37:
	rd	%softint,	%i1
	wr	%i6,	%g7,	%y
	call	loop_38
	fpackfix	%f26,	%f23
	fcmped	%fcc3,	%f22,	%f30
	call	loop_39
loop_38:
	fabsd	%f4,	%f8
	fmuld8sux16	%f0,	%f24,	%f0
	call	loop_40
loop_39:
	xorcc	%i5,	%o7,	%g1
	fcmped	%fcc1,	%f10,	%f12
	rd	%y,	%i3
loop_40:
	alignaddr	%o5,	%l5,	%o6
	call	loop_41
	movneg	%icc,	0x06F,	%i0
	ld	[%l7 + 0x44],	%f4
	call	loop_42
loop_41:
	fmovrdlez	%i7,	%f30,	%f8
	call	loop_43
	fmovdcc	%icc,	%f18,	%f10
loop_42:
	edge16ln	%o2,	%l0,	%o4
	call	loop_44
loop_43:
	wrpr	%l3,	0x152F,	%cwp
	call	loop_45
	movge	%fcc1,	0x7DB,	%i4
loop_44:
	movle	%fcc2,	0x13C,	%g2
	call	loop_46
loop_45:
	xnor	%i2,	0x1B3F,	%g3
	bpos	%icc,	loop_47
	ta	%icc,	0x0
loop_46:
	array32	%l4,	%g5,	%g4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
loop_47:
	fpadd16	%f6,	%f28,	%f20
	brgez,pn	%l1,	loop_48
	rdhpr	%hintp,	%l6
	fmovsuge	%fcc2,	%f27,	%f8
	fmovspos	%icc,	%f24,	%f29
loop_48:
	call	loop_49
	fnors	%f21,	%f16,	%f15
	rdhpr	%hpstate,	%o0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xB97, 	%hsys_tick_cmpr
loop_49:
	movrne	%o3,	0x043,	%i1
	array32	%g6,	%g7,	%i6
	fmovsg	%icc,	%f18,	%f8
	srl	%i5,	%o7,	%g1
	fcmpeq16	%f14,	%f10,	%i3
	call	loop_50
	udivx	%l5,	0x00,	%o5
	call	loop_51
	fnot1s	%f8,	%f18
loop_50:
	wr	%o6,	0x159A,	%sys_tick
	tneg	%icc,	0x4
loop_51:
	nop
	setx loop_52, %l0, %l1
	jmpl %l1, %i7
	nop
	fitod	%f12,	%f16
	fdtoi	%f16,	%f2
	tcs	%xcc,	0x3
	call	loop_53
loop_52:
	call	loop_54
	nop
	set	0x68, %i6
	ldd	[%l7 + %i6],	%o2
	movg	%xcc,	0x3DE,	%i0
loop_53:
	movgu	%icc,	%o4,	%l3
loop_54:
	fmovsneg	%icc,	%f4,	%f15
	fmovduge	%fcc1,	%f4,	%f24
	call	loop_55
	movn	%xcc,	%i4,	%g2
	call	loop_56
	fmovsug	%fcc3,	%f2,	%f23
loop_55:
	sllx	%i2,	0x02,	%l0
	nop
	setx	0x2FEB11228E34E021,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	fsqrtd	%f4,	%f18
loop_56:
	fcmpgt16	%f8,	%f8,	%g3
	bneg	%icc,	loop_57
	fmovdne	%fcc0,	%f30,	%f20
	fmovrdne	%g5,	%f30,	%f2
	call	loop_58
loop_57:
	nop
	fitos	%f3,	%f3
	fstox	%f3,	%f26
	fxtos	%f26,	%f31
	call	loop_59
	fmovrdgz	%l4,	%f16,	%f16
loop_58:
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	set	0x64, %i2
	sta	%f29,	[%l7 + %i2] 0x10
loop_59:
	call	loop_60
	xorcc	%g4,	0x1ECC,	%l2
	tvs	%icc,	0x5
	rdpr	%canrestore,	%l1
loop_60:
	call	loop_61
	fands	%f20,	%f27,	%f22
	rd	%sys_tick_cmpr,	%o0
	call	loop_62
loop_61:
	call	loop_63
	rdpr	%otherwin,	%l6
	fba,a	%fcc0,	loop_64
loop_62:
	nop
	setx	0x6E62DCBAD36AC0A6,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0x122DD52691A65ED1,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	fmuld	%f24,	%f30,	%f16
loop_63:
	bvc,a	%icc,	loop_65
	movug	%fcc2,	%o3,	%o1
loop_64:
	call	loop_66
	sra	%i1,	0x1D,	%g7
loop_65:
	fmovsa	%fcc0,	%f26,	%f30
	bg	%xcc,	loop_67
loop_66:
	call	loop_68
	movvs	%icc,	%g6,	%i5
	wrpr	%o7,	%i6,	%cwp
loop_67:
	tl	%icc,	0x7
loop_68:
	call	loop_69
	fmovde	%fcc2,	%f2,	%f26
	sra	%i3,	%l5,	%o5
	call	loop_70
loop_69:
	fabsd	%f26,	%f22
	call	loop_71
	call	loop_72
loop_70:
	call	loop_73
	call	loop_74
loop_71:
	fornot1s	%f3,	%f18,	%f22
loop_72:
	fmovdvc	%xcc,	%f16,	%f24
loop_73:
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
loop_74:
	fmuld8ulx16	%f17,	%f9,	%f22
	fnot1s	%f15,	%f30
	call	loop_75
	call	loop_76
	call	loop_77
	prefetch	[%l7 + 0x58],	 2
loop_75:
	nop
	wr	%g0,	0x80,	%asi
	lduwa	[%l7 + 0x6C] %asi,	%g1
loop_76:
	fmovspos	%icc,	%f31,	%f10
loop_77:
	fxors	%f6,	%f17,	%f19
	wr	%o6,	0x0C1D,	%y
	fmovrsne	%i7,	%f3,	%f8
	call	loop_78
	brgz	%o2,	loop_79
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	fmovdle	%icc,	%f4,	%f20
loop_78:
	fmovdne	%icc,	%f14,	%f30
loop_79:
	rdhpr	%ver,	%i0
	fmovd	%f18,	%f22
	fabsd	%f2,	%f22
	nop
	set	0x2F, %o0
	ldsb	[%l7 + %o0],	%l3
	fcmpeq32	%f10,	%f26,	%i4
	tle	%icc,	0x0
	call	loop_80
	subccc	%g2,	0x069A,	%o4
	call	loop_81
	edge8l	%i2,	%g3,	%l0
loop_80:
	nop
	set	0x4A, %i3
	ldsha	[%l7 + %i3] 0x10,	%g5
loop_81:
	subccc	%g4,	0x0C94,	%l4
	call	loop_82
	umul	%l1,	%l2,	%o0
	bl,a,pt	%xcc,	loop_83
	edge8	%l6,	%o1,	%i1
loop_82:
	nop
	membar	#Sync
	wr	%g0,	0x1f,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
loop_83:
	wr	%g7,	0x16B2,	%set_softint
	orcc	%o3,	0x1829,	%i5
	fmovdn	%icc,	%f30,	%f8
	orn	%g6,	0x1D38,	%o7
	fornot1s	%f29,	%f24,	%f30
	tne	%icc,	0x2
	nop
	fitos	%f8,	%f21
	fstox	%f21,	%f2
	fxtos	%f2,	%f5
	call	loop_84
	fmovrdne	%i3,	%f14,	%f24
	call	loop_85
	call	loop_86
loop_84:
	srlx	%i6,	%l5,	%o5
	call	loop_87
loop_85:
	wr	%g1,	0x02C3,	%softint
loop_86:
	orncc	%i7,	0x0E00,	%o6
	fmovsne	%xcc,	%f16,	%f25
loop_87:
	alignaddrl	%i0,	%o2,	%l3
	fmovduge	%fcc1,	%f30,	%f14
	brlez	%g2,	loop_88
	movcc	%icc,	0x77B,	%i4
	xnor	%i2,	0x0904,	%g3
	call	loop_89
loop_88:
	fbe	%fcc0,	loop_90
	fmovdul	%fcc3,	%f6,	%f24
	fmovduge	%fcc0,	%f22,	%f20
loop_89:
	edge16ln	%o4,	%l0,	%g5
loop_90:
	udivcc	%g4,	0x00,	%l1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fpsub16	%f8,	%f16,	%f18
	fpadd16s	%f26,	%f30,	%f0
	sll	%l2,	%l6,	%o1
	fmovslg	%fcc2,	%f21,	%f28
	call	loop_91
	fmovrdlez	%o0,	%f12,	%f4
	nop
	setx	0x262355E59B726BEC,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0x61B95EA81CD779B7,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	faddd	%f6,	%f2,	%f14
	fmovsue	%fcc2,	%f29,	%f18
loop_91:
	fone	%f26
	fornot2s	%f25,	%f12,	%f22
	edge8n	%i1,	%o3,	%i5
	wr	%g7,	0x05D9,	%sys_tick
	call	loop_92
	fbo,a,pt	%fcc3,	loop_93
	nop
	set	0x60, %i5
	stx	%fsr,	[%l7 + %i5]
	xor	%o7,	%g6,	%i6
loop_92:
	wrpr	%l5,	%i3,	%tick
loop_93:
	nop
	wr	%g0,	0x04,	%asi
	ldsha	[%l7 + 0x24] %asi,	%g1
	call	loop_94
	nop
	fitos	%f12,	%f18
	fstod	%f18,	%f4
	fbul	%fcc0,	loop_95
	call	loop_96
loop_94:
	call	loop_97
	movne	%fcc0,	%i7,	%o6
loop_95:
	rdhpr	%hsys_tick_cmpr,	%o5
loop_96:
	call	loop_98
loop_97:
	call	loop_99
	fpadd32s	%f29,	%f31,	%f2
	sra	%o2,	0x03,	%i0
loop_98:
	nop
	setx	0x21F3BCA03714A3C3,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0xE35B88C7FC3E3177,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	fmuld	%f8,	%f10,	%f0
loop_99:
	udiv	%g2,	0x00,	%i4
	fmovduge	%fcc2,	%f6,	%f22
	array32	%i2,	%l3,	%g3
	popc	0x12C2,	%o4
	movgu	%icc,	0x550,	%l0
	fandnot2	%f6,	%f8,	%f28
	fands	%f2,	%f17,	%f22
	alignaddrl	%g5,	%l1,	%l4
	call	loop_100
	movlg	%fcc2,	0x62F,	%g4
	array8	%l6,	%l2,	%o1
	sethi	0x05E8,	%i1
loop_100:
	fpadd32s	%f1,	%f25,	%f16
	fmuld8ulx16	%f26,	%f30,	%f30
	edge32l	%o0,	%o3,	%i5
	call	loop_101
	call	loop_102
	subc	%o7,	%g7,	%g6
	nop
	set	0x77, %i4
	ldub	[%l7 + %i4],	%i6
loop_101:
	fandnot1s	%f6,	%f28,	%f17
loop_102:
	fpadd32	%f16,	%f20,	%f20
	call	loop_103
	fmovdle	%fcc1,	%f10,	%f26
	fmul8sux16	%f26,	%f24,	%f18
	fpack16	%f30,	%f9
loop_103:
	fmovs	%f15,	%f24
	fnors	%f15,	%f25,	%f2
	bpos,a	%icc,	loop_104
	call	loop_105
	edge32ln	%l5,	%g1,	%i3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
loop_104:
	call	loop_106
loop_105:
	movrgez	%i7,	%i0,	%g2
	ld	[%l7 + 0x50],	%f8
	add	%i4,	%i2,	%o2
loop_106:
	fzeros	%f21
	call	loop_107
	rdhpr	%hpstate,	%g3
	fpadd16	%f26,	%f16,	%f30
	flush	%l7 + 0x58
loop_107:
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	fmovrde	%o4,	%f18,	%f28
	nop
	set	0x2C, %i7
	swap	[%l7 + %i7],	%l0
	fmovrsne	%g5,	%f11,	%f29
	add	%l7,	0x08,	%l6
	wr	%g0,	0x11,	%asi
	casa	[%l6] %asi,	%l1,	%l3
	fmovdug	%fcc0,	%f28,	%f24
	array32	%g4,	%l6,	%l4
	movre	%o1,	0x071,	%i1
	fmovdul	%fcc0,	%f24,	%f26
	call	loop_108
	call	loop_109
	tvc	%xcc,	0x3
	fmovscs	%icc,	%f18,	%f23
loop_108:
	fmovdl	%fcc2,	%f8,	%f22
loop_109:
	nop
	wr	%g0,	0x04,	%asi
	ldstuba	[%l7 + 0x71] %asi,	%o0
	fmul8x16au	%f19,	%f24,	%f10
	fmovspos	%icc,	%f21,	%f27
	alignaddrl	%l2,	%i5,	%o7
	call	loop_110
	sdivx	%g7,	0x00,	%g6
	call	loop_111
	stx	%fsr,	[%l7 + 0x20]
loop_110:
	fnot2	%f24,	%f8
	call	loop_112
loop_111:
	call	loop_113
	stb	%i6,	[%l7 + 0x6F]
	rdhpr	%hpstate,	%o3
loop_112:
	rd	%asi,	%g1
loop_113:
	udivx	%i3,	0x00,	%o6
	call	loop_114
	wrpr	%l5,	0x0989,	%pil
	call	loop_115
	wrpr 	%g0, 	0x2, 	%gl
loop_114:
	call	loop_116
	fcmple16	%f18,	%f0,	%o5
loop_115:
	tsubcc	%i0,	%g2,	%i2
	fmovse	%icc,	%f15,	%f22
loop_116:
	call	loop_117
	fmovslg	%fcc3,	%f7,	%f4
	brnz,pt	%o2,	loop_118
	call	loop_119
loop_117:
	sra	%i4,	0x0A,	%o4
	movg	%fcc0,	%l0,	%g5
loop_118:
	xnor	%l1,	0x1105,	%l3
loop_119:
	bmask	%g3,	%g4,	%l4
	call	loop_120
	edge32ln	%l6,	%o1,	%o0
	umul	%l2,	0x189E,	%i5
	nop
	set	0x68, %g5
	stx	%fsr,	[%l7 + %g5]
loop_120:
	tvc	%icc,	0x7
	sll	%i1,	0x03,	%o7
	nop
	setx	0xFED3A498,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f1
	fsqrts	%f1,	%f26
	nop
	setx	0xF8660337A92B0ED3,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0x513BDEDB6A845204,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	fmuld	%f22,	%f24,	%f4
	brgez,pn	%g6,	loop_121
	be,a	%icc,	loop_122
	call	loop_123
	smulcc	%i6,	0x0814,	%o3
loop_121:
	movneg	%xcc,	%g1,	%g7
loop_122:
	nop
	setx	0xD60EA1B3,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f27
	setx	0xE95E0D71,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f26
	fdivs	%f26,	%f27,	%f22
loop_123:
	call	loop_124
	fmovscc	%xcc,	%f17,	%f11
	call	loop_125
	call	loop_126
loop_124:
	stx	%fsr,	[%l7 + 0x50]
	or	%o6,	0x1CFF,	%i3
loop_125:
	fmovsgu	%xcc,	%f10,	%f17
loop_126:
	call	loop_127
	fmovsgu	%xcc,	%f16,	%f9
	fmovscs	%icc,	%f7,	%f11
	call	loop_128
loop_127:
	call	loop_129
	fcmpd	%fcc1,	%f20,	%f30
	movl	%icc,	%i7,	%o5
loop_128:
	umul	%i0,	%l5,	%g2
loop_129:
	fmovsleu	%xcc,	%f25,	%f16
	wrpr	%o2,	0x1F4E,	%cwp
	call	loop_130
	call	loop_131
	bvs,a,pn	%xcc,	loop_132
	fnand	%f24,	%f4,	%f28
loop_130:
	fcmple32	%f14,	%f6,	%i4
loop_131:
	fmul8ulx16	%f14,	%f10,	%f0
loop_132:
	nop
	setx	0x4B73E8CC,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f30
	setx	0x2897C35A,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f29
	fsubs	%f29,	%f30,	%f1
	fmovse	%xcc,	%f30,	%f3
	fmovrsgez	%i2,	%f0,	%f27
	tvs	%xcc,	0x5
	edge32n	%l0,	%g5,	%o4
	ldub	[%l7 + 0x4A],	%l1
	call	loop_133
	nop
	fitod	%f22,	%f8
	call	loop_134
	call	loop_135
loop_133:
	call	loop_136
	movrgz	%l3,	%g3,	%l4
loop_134:
	mova	%xcc,	0x534,	%l6
loop_135:
	fcmpne16	%f18,	%f2,	%g4
loop_136:
	call	loop_137
	nop
	fitod	%f21,	%f14
	fpsub16s	%f28,	%f18,	%f7
	fnor	%f14,	%f2,	%f10
loop_137:
	array8	%o1,	%o0,	%l2
	tle	%xcc,	0x3
	movrne	%i1,	%o7,	%g6
	call	loop_138
	edge8	%i6,	%i5,	%g1
	tcs	%icc,	0x0
	fcmple32	%f30,	%f24,	%o3
loop_138:
	taddcctv	%o6,	0x043C,	%i3
	fbu,a,pt	%fcc2,	loop_139
	call	loop_140
	call	loop_141
	fmovdgu	%icc,	%f0,	%f10
loop_139:
	call	loop_142
loop_140:
	fbe,pn	%fcc2,	loop_143
loop_141:
	fmovdne	%xcc,	%f20,	%f2
	wr	%g0,	0x88,	%asi
	lduwa	[%l7 + 0x28] %asi,	%g7
loop_142:
	rdhpr	%ver,	%o5
loop_143:
	fmovrde	%i0,	%f12,	%f14
	fcmped	%fcc0,	%f2,	%f14
	call	loop_144
	call	loop_145
	fandnot2s	%f4,	%f6,	%f3
	fmovsleu	%xcc,	%f5,	%f20
loop_144:
	fmovdle	%icc,	%f24,	%f4
loop_145:
	nop
	setx	0x6C2D9B81,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f11
	setx	0xE2C658AE,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f6
	fdivs	%f6,	%f11,	%f18
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 0:
!
!	Type l   	: 26
!	Type a   	: 35
!	Type x   	: 10
!	Type cti   	: 145
!	Type f   	: 157
!	Type i   	: 127
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
	set	0x2,	%g1
	set	0xA,	%g2
	set	0x2,	%g3
	set	0x9,	%g4
	set	0x6,	%g5
	set	0xD,	%g6
	set	0x2,	%g7
	!# Input registers
	set	-0xE,	%i0
	set	-0x5,	%i1
	set	-0xB,	%i2
	set	-0x3,	%i3
	set	-0xB,	%i4
	set	-0x7,	%i5
	set	-0xB,	%i6
	set	-0xE,	%i7
	!# Local registers
	set	0x673691E0,	%l0
	set	0x13E175FD,	%l1
	set	0x57298813,	%l2
	set	0x0202C084,	%l3
	set	0x1B0A6B05,	%l4
	set	0x54CAF176,	%l5
	set	0x15177872,	%l6
	!# Output registers
	set	0x0D35,	%o0
	set	-0x1A78,	%o1
	set	-0x0C26,	%o2
	set	0x096E,	%o3
	set	0x1D10,	%o4
	set	0x11FB,	%o5
	set	0x07CF,	%o6
	set	-0x1259,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0xD523630FDD061F8B)
	INIT_TH_FP_REG(%l7,%f2,0xAE0CDD1D39273890)
	INIT_TH_FP_REG(%l7,%f4,0xEA6C9FE21A53F8CA)
	INIT_TH_FP_REG(%l7,%f6,0xE96E6C657E02C71B)
	INIT_TH_FP_REG(%l7,%f8,0xFB09BCEC42A88D3F)
	INIT_TH_FP_REG(%l7,%f10,0x34A9A3AAA8FAD540)
	INIT_TH_FP_REG(%l7,%f12,0x0AF9C80D0A157C13)
	INIT_TH_FP_REG(%l7,%f14,0x70D050BFAA949054)
	INIT_TH_FP_REG(%l7,%f16,0x64C2D9F7783E696B)
	INIT_TH_FP_REG(%l7,%f18,0x53EE6B281353063D)
	INIT_TH_FP_REG(%l7,%f20,0x92269AD949643F8D)
	INIT_TH_FP_REG(%l7,%f22,0x9F25609CD5C02745)
	INIT_TH_FP_REG(%l7,%f24,0x7C2B8BE5FE50BC3F)
	INIT_TH_FP_REG(%l7,%f26,0xA8F8ABCD4B791C0D)
	INIT_TH_FP_REG(%l7,%f28,0x7D3EC69CA2CCFD4E)
	INIT_TH_FP_REG(%l7,%f30,0x542D35F2E88B05C0)

	!# Execute Main Diag ..

	fmovdcc	%icc,	%f2,	%f0
	edge16	%l5,	%g2,	%i7
	fmovdleu	%xcc,	%f0,	%f20
	fmovdvc	%icc,	%f18,	%f2
	for	%f14,	%f26,	%f26
	flushw
	fmul8ulx16	%f30,	%f14,	%f10
	taddcc	%i4,	%o2,	%l0
	movleu	%icc,	0x554,	%i2
	call	loop_146
	call	loop_147
	fandnot2s	%f15,	%f17,	%f15
	fnot1s	%f8,	%f31
loop_146:
	nop
	setx	loop_148,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x032400001407,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_147:
	nop
	setx	0x61B562BC,	%l0,	%l6
	st	%l6,	[%l7 + 0x38]
	ld	[%l7 + 0x38],	%fsr
	rd	%tick_cmpr,	%g5
	call	loop_149
loop_148:
	call	loop_150
	std	%o4,	[%l7 + 0x10]
	fmovda	%xcc,	%f20,	%f30
loop_149:
	fmovsge	%icc,	%f25,	%f7
loop_150:
	brgez,pt	%l1,	loop_151
	tg	%xcc,	0x0
	fbn,a,pn	%fcc1,	loop_152
	movneg	%xcc,	%l3,	%l4
loop_151:
	call	loop_153
	fmovdvs	%xcc,	%f24,	%f14
loop_152:
	nop
	set	0x10, %l4
	stx	%g3,	[%l7 + %l4]
	brz,pt	%l6,	loop_154
loop_153:
	for	%f0,	%f22,	%f24
	call	loop_155
	fnot2s	%f20,	%f15
loop_154:
	fmovsneg	%icc,	%f12,	%f17
	call	loop_156
loop_155:
	fmovsl	%fcc2,	%f20,	%f5
	bge,pt	%xcc,	loop_157
	brz,a,pn	%g4,	loop_158
loop_156:
	fmovsule	%fcc0,	%f22,	%f11
	tleu	%icc,	0x7
loop_157:
	call	loop_159
loop_158:
	fmovdneg	%icc,	%f20,	%f28
	fmovrslz	%o1,	%f5,	%f2
	nop
	fitod	%f10,	%f0
loop_159:
	movcs	%xcc,	0x078,	%l2
	call	loop_160
	ldsh	[%l7 + 0x0C],	%o0
	call	loop_161
	movneg	%icc,	0x7D7,	%o7
loop_160:
	sdiv	%g6,	%i1,	%i5
	fandnot1s	%f31,	%f12,	%f9
loop_161:
	call	loop_162
	call	loop_163
	fornot1s	%f30,	%f2,	%f23
	tne	%xcc,	0x5
loop_162:
	rdpr	%tl,	%g1
loop_163:
	fpmerge	%f20,	%f1,	%f18
	call	loop_164
	ldx	[%l7 + 0x18],	%i6
	call	loop_165
	call	loop_166
loop_164:
	tvs	%xcc,	0x6
	call	loop_167
loop_165:
	call	loop_168
loop_166:
	array16	%o3,	%o6,	%g7
	array16	%o5,	%i0,	%i3
loop_167:
	movvs	%icc,	0x284,	%l5
loop_168:
	nop
	setx	0x35E35BF0,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f19
	setx	0xB470410D,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f0
	fsubs	%f0,	%f19,	%f3
	call	loop_169
	nop
	setx	0x9BE4397DF53D730E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0xE03955B2378A9EA5,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	fsubd	%f20,	%f24,	%f6
	tcc	%icc,	0x6
	call	loop_170
loop_169:
	fmovslg	%fcc2,	%f13,	%f2
	sub	%g2,	0x05D3,	%i7
	alignaddr	%i4,	%l0,	%o2
loop_170:
	call	loop_171
	movpos	%icc,	%g5,	%o4
	mulscc	%i2,	%l1,	%l4
	smul	%l3,	0x1348,	%l6
loop_171:
	fmuld8sux16	%f11,	%f31,	%f20
	fcmped	%fcc0,	%f6,	%f22
	call	loop_172
	sdivcc	%g4,	0x00,	%g3
	rd	%tick_cmpr,	%o1
	call	loop_173
loop_172:
	nop
	fitod	%f10,	%f8
	fdtos	%f8,	%f23
	addcc	%o0,	%l2,	%g6
	call	loop_174
loop_173:
	fmul8x16al	%f4,	%f5,	%f30
	wrpr	%o7,	0x0E73,	%tick
	call	loop_175
loop_174:
	fbug	%fcc1,	loop_176
	tsubcctv	%i5,	%i1,	%g1
	call	loop_177
loop_175:
	fmovsgu	%xcc,	%f19,	%f20
loop_176:
	call	loop_178
	fbu,a	%fcc1,	loop_179
loop_177:
	call	loop_180
	movvc	%xcc,	0x21F,	%i6
loop_178:
	edge32l	%o6,	%o3,	%g7
loop_179:
	movcs	%xcc,	0x6A0,	%i0
loop_180:
	tge	%xcc,	0x6
	umulcc	%i3,	0x1C24,	%l5
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	call	loop_181
	call	loop_182
	sdiv	%g2,	0x00,	%o5
	movn	%icc,	0x51E,	%i4
loop_181:
	fmovse	%fcc3,	%f19,	%f10
loop_182:
	nop
	set	0x7D, %g1
	ldsba	[%l7 + %g1] 0x04,	%i7
	for	%f14,	%f6,	%f28
	fpack32	%f30,	%f24,	%f16
	call	loop_183
	nop
	fitod	%f6,	%f30
	call	loop_184
	edge32n	%l0,	%g5,	%o4
loop_183:
	fmovsle	%fcc2,	%f14,	%f19
	fandnot2s	%f12,	%f17,	%f4
loop_184:
	te	%icc,	0x2
	fmovsne	%xcc,	%f13,	%f14
	umul	%o2,	0x08FC,	%i2
	call	loop_185
	call	loop_186
	fbge,pt	%fcc3,	loop_187
	bshuffle	%f10,	%f18,	%f28
loop_185:
	edge32n	%l4,	%l1,	%l6
loop_186:
	fpack32	%f8,	%f20,	%f12
loop_187:
	call	loop_188
	movrne	%l3,	%g3,	%o1
	movul	%fcc2,	%g4,	%o0
	call	loop_189
loop_188:
	fmovdcc	%xcc,	%f18,	%f30
	fmovrdne	%l2,	%f22,	%f26
	tleu	%icc,	0x4
loop_189:
	movu	%fcc0,	%o7,	%g6
	fabsd	%f2,	%f20
	call	loop_190
	tvs	%icc,	0x6
	nop
	fitos	%f14,	%f2
	fstoi	%f2,	%f2
	movne	%fcc1,	0x7DE,	%i5
loop_190:
	sub	%g1,	0x0A26,	%i6
	fandnot1	%f14,	%f0,	%f8
	nop
	setx	0x33F174A89D64B216,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0xC1F97B88,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	fsmuld	%f20,	%f4,	%f12
	call	loop_191
	fcmpd	%fcc1,	%f6,	%f8
	rd	%ccr,	%i1
	call	loop_192
loop_191:
	fmovsvs	%icc,	%f6,	%f7
	fmovdge	%icc,	%f28,	%f28
	srax	%o6,	%o3,	%g7
loop_192:
	array16	%i3,	%l5,	%g2
	fcmped	%fcc2,	%f18,	%f2
	fcmpeq16	%f24,	%f4,	%o5
	call	loop_193
	bneg	%icc,	loop_194
	fmovspos	%xcc,	%f1,	%f14
	rd	%softint,	%i4
loop_193:
	movrlez	%i7,	0x10D,	%l0
loop_194:
	movle	%fcc0,	%g5,	%i0
	fpmerge	%f0,	%f10,	%f16
	fnors	%f15,	%f9,	%f14
	fmovsug	%fcc3,	%f4,	%f31
	call	loop_195
	fnor	%f30,	%f20,	%f14
	call	loop_196
	fmovdu	%fcc3,	%f18,	%f30
loop_195:
	fornot1s	%f18,	%f14,	%f5
	tcs	%xcc,	0x0
loop_196:
	nop
	membar	#Sync
	set	0x40, %i0
	ldda	[%l7 + %i0] 0x1e,	%f16
	set	0x68, %o5
	lda	[%l7 + %o5] 0x80,	%f20
	fnot1s	%f18,	%f15
	smulcc	%o4,	0x1BA8,	%o2
	call	loop_197
	array16	%i2,	%l1,	%l4
	fsrc1s	%f5,	%f26
	nop
	set	0x7A, %i1
	sth	%l3,	[%l7 + %i1]
loop_197:
	nop
	setx	loop_198,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x032100001401,	%l0,	%l1
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
	rdpr	%tba,	%g3
	tvs	%icc,	0x1
	call	loop_199
loop_198:
	sdivx	%l6,	0x00,	%g4
	tg	%icc,	0x0
	wr	%g0,	0x2a,	%asi
	stda	%o0,	[%l7 + 0x58] %asi
	membar	#Sync
loop_199:
	nop
	setx	0x20F4F0DC,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f9
	setx	0xEA3818B0,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f21
	fdivs	%f21,	%f9,	%f12
	fmul8x16al	%f8,	%f10,	%f8
	fcmpeq32	%f16,	%f4,	%l2
	fmovdlg	%fcc1,	%f16,	%f30
	fblg,pn	%fcc0,	loop_200
	call	loop_201
	call	loop_202
	call	loop_203
loop_200:
	fcmpgt16	%f26,	%f0,	%o7
loop_201:
	ba,a	%icc,	loop_204
loop_202:
	call	loop_205
loop_203:
	ld	[%l7 + 0x68],	%f30
	nop
	setx	0x49D04FA7616A65D5,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0x617FC79037147DF4,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	fsubd	%f28,	%f0,	%f14
loop_204:
	fcmpne32	%f28,	%f16,	%g6
loop_205:
	nop
	setx	0x0F9B72B8,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f30
	setx	0x6D7BB421,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f6
	fdivs	%f6,	%f30,	%f18
	fmul8x16au	%f12,	%f16,	%f18
	call	loop_206
	wrpr	%o1,	%i5,	%cwp
	tleu	%xcc,	0x5
	call	loop_207
loop_206:
	tpos	%xcc,	0x7
	fzero	%f16
	wr	%g0,	0xdb,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
loop_207:
	nop
	fitod	%f10,	%f18
	fdtos	%f18,	%f12
	call	loop_208
	fmovdvs	%xcc,	%f12,	%f10
	nop
	fitos	%f6,	%f24
	fstod	%f24,	%f6
	call	loop_209
loop_208:
	fands	%f24,	%f3,	%f16
	nop
	setx	0x461235FB43FB7A17,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0x8104392592A98E12,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	faddd	%f10,	%f0,	%f18
	call	loop_210
loop_209:
	tsubcctv	%g1,	%i6,	%i1
	andncc	%o6,	%g7,	%o3
	sdivcc	%i3,	0x00,	%g2
loop_210:
	tl	%xcc,	0x4
	call	loop_211
	fxors	%f31,	%f16,	%f25
	fmovdg	%icc,	%f12,	%f24
	call	loop_212
loop_211:
	fnegs	%f13,	%f12
	call	loop_213
	tg	%xcc,	0x4
loop_212:
	nop
	set	0x08, %o6
	ldstub	[%l7 + %o6],	%l5
	call	loop_214
loop_213:
	call	loop_215
	fmovdge	%xcc,	%f16,	%f4
	fnot2	%f0,	%f6
loop_214:
	fcmpne32	%f18,	%f22,	%o5
loop_215:
	nop
	set	0x08, %o1
	lda	[%l7 + %o1] 0x81,	%f27
	wr	%g0,	0x18,	%asi
	stxa	%i7,	[%l7 + 0x68] %asi
	mulscc	%i4,	%l0,	%g5
	call	loop_216
	fnor	%f6,	%f24,	%f4
	call	loop_217
	tvc	%xcc,	0x5
loop_216:
	call	loop_218
	fnors	%f29,	%f31,	%f18
loop_217:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xCA3, 	%hsys_tick_cmpr
	movle	%fcc1,	0x16E,	%o2
loop_218:
	std	%f18,	[%l7 + 0x18]
	fornot2	%f0,	%f16,	%f2
	tsubcc	%i0,	0x1332,	%i2
	fmovde	%fcc1,	%f26,	%f2
	membar	#Sync
	set	0x40, %g4
	ldda	[%l7 + %g4] 0x16,	%f16
	call	loop_219
	sir	0x0B28
	fmul8x16	%f31,	%f20,	%f24
	fnot2	%f6,	%f20
loop_219:
	brnz,a	%l1,	loop_220
	rdpr	%tl,	%l3
	array32	%l4,	%g3,	%g4
	edge32	%l6,	%o0,	%l2
loop_220:
	movul	%fcc2,	0x7D3,	%g6
	movgu	%xcc,	%o7,	%i5
	bshuffle	%f20,	%f26,	%f10
	tcc	%icc,	0x4
	add	%o1,	0x12F6,	%g1
	fmovsgu	%icc,	%f20,	%f4
	fmovdcc	%xcc,	%f4,	%f20
	fmovsle	%icc,	%f22,	%f29
	fornot2	%f20,	%f22,	%f10
	fmovsue	%fcc1,	%f7,	%f10
	fpsub32	%f8,	%f4,	%f4
	edge8ln	%i6,	%o6,	%i1
	fpmerge	%f24,	%f7,	%f12
	fmul8x16al	%f26,	%f5,	%f14
	fmuld8ulx16	%f11,	%f31,	%f14
	wr	%g0,	0x88,	%asi
	lduba	[%l7 + 0x1C] %asi,	%g7
	fbge,a,pn	%fcc2,	loop_221
	bmask	%i3,	%g2,	%o3
	nop
	fitos	%f12,	%f19
	fstox	%f19,	%f28
	fxtos	%f28,	%f12
	tsubcctv	%o5,	%i7,	%l5
loop_221:
	call	loop_222
	tg	%xcc,	0x0
	rd	%tick_cmpr,	%i4
	mulscc	%g5,	0x1858,	%o4
loop_222:
	fmovduge	%fcc1,	%f18,	%f0
	call	loop_223
	call	loop_224
	call	loop_225
	fmovse	%fcc2,	%f25,	%f15
loop_223:
	flushw
loop_224:
	call	loop_226
loop_225:
	call	loop_227
	lduw	[%l7 + 0x2C],	%o2
	call	loop_228
loop_226:
	fmovsul	%fcc2,	%f2,	%f17
loop_227:
	fmovsne	%icc,	%f24,	%f13
	rdpr	%tl,	%l0
loop_228:
	call	loop_229
	addcc	%i2,	%i0,	%l3
	rd	%sys_tick_cmpr,	%l1
	call	loop_230
loop_229:
	fmovrsgez	%g3,	%f14,	%f19
	nop
	fitos	%f13,	%f16
	call	loop_231
loop_230:
	call	loop_232
	call	loop_233
	fmovdvs	%icc,	%f4,	%f26
loop_231:
	fmovdcc	%xcc,	%f10,	%f8
loop_232:
	movrlez	%g4,	0x2A2,	%l4
loop_233:
	call	loop_234
	nop
	set	0x60, %l2
	ldd	[%l7 + %l2],	%f6
	call	loop_235
	call	loop_236
loop_234:
	call	loop_237
	call	loop_238
loop_235:
	tgu	%xcc,	0x6
loop_236:
	call	loop_239
loop_237:
	call	loop_240
loop_238:
	fnot1s	%f20,	%f9
	orn	%l6,	%l2,	%o0
loop_239:
	tsubcctv	%g6,	0x085B,	%o7
loop_240:
	membar	0x7A
	movule	%fcc0,	%i5,	%g1
	fmovdle	%fcc0,	%f14,	%f26
	call	loop_241
	fand	%f4,	%f0,	%f10
	call	loop_242
	movre	%o1,	%o6,	%i1
loop_241:
	fmovscc	%icc,	%f2,	%f10
	call	loop_243
loop_242:
	fone	%f2
	mulx	%i6,	0x0A9B,	%i3
	rd	%tick_cmpr,	%g2
loop_243:
	fmovsvs	%xcc,	%f27,	%f8
	nop
	fitod	%f6,	%f10
	fdtox	%f10,	%f12
	fxtod	%f12,	%f14
	fmul8ulx16	%f2,	%f20,	%f18
	call	loop_244
	fors	%f10,	%f7,	%f7
	fmovs	%f10,	%f5
	nop
	setx	0xAF5E29E1,	%l0,	%l6
	st	%l6,	[%l7 + 0x68]
	ld	[%l7 + 0x68],	%fsr
loop_244:
	siam	0x5
	bmask	%o3,	%g7,	%o5
	nop
	setx	0x59680A94F45D26F8,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0x0C3D9719A62DCC81,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	faddd	%f18,	%f2,	%f18
	call	loop_245
	rdhpr	%htba,	%i7
	call	loop_246
	call	loop_247
loop_245:
	fnor	%f8,	%f22,	%f16
	call	loop_248
loop_246:
	call	loop_249
loop_247:
	movrne	%l5,	%i4,	%g5
	brnz,pn	%o4,	loop_250
loop_248:
	bvs,a	%xcc,	loop_251
loop_249:
	fzeros	%f23
	nop
	set	0x7A, %l3
	ldub	[%l7 + %l3],	%o2
loop_250:
	sdivcc	%i2,	%l0,	%l3
loop_251:
	fmovdle	%icc,	%f16,	%f2
	bvs,pt	%icc,	loop_252
	call	loop_253
	fmovdne	%fcc2,	%f26,	%f6
	orncc	%i0,	%g3,	%l1
loop_252:
	fble,a,pn	%fcc2,	loop_254
loop_253:
	umul	%g4,	0x1BB2,	%l4
	call	loop_255
	array16	%l6,	%o0,	%g6
loop_254:
	std	%f26,	[%l7 + 0x28]
	call	loop_256
loop_255:
	fmovrdlez	%l2,	%f6,	%f26
	call	loop_257
	call	loop_258
loop_256:
	call	loop_259
	call	loop_260
loop_257:
	tge	%xcc,	0x0
loop_258:
	call	loop_261
loop_259:
	addcc	%i5,	0x1A29,	%o7
loop_260:
	alignaddrl	%g1,	%o6,	%o1
	fands	%f22,	%f2,	%f6
loop_261:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x3C6, 	%hsys_tick_cmpr
	movre	%i6,	0x1D2,	%g2
	call	loop_262
	fmovdneg	%xcc,	%f22,	%f10
	bcc,pt	%icc,	loop_263
	call	loop_264
loop_262:
	movu	%fcc3,	0x640,	%i3
	fnot2	%f10,	%f16
loop_263:
	fmovsa	%fcc3,	%f13,	%f9
loop_264:
	fmovdcs	%icc,	%f28,	%f16
	fpsub16s	%f16,	%f28,	%f9
	nop
	set	0x54, %o2
	swap	[%l7 + %o2],	%o3
	call	loop_265
	nop
	setx	0xB99372A5,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f25
	setx	0xB1A6AB3C,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f4
	fmuls	%f4,	%f25,	%f9
	nop
	set	0x18, %g7
	ldsw	[%l7 + %g7],	%g7
	nop
	setx	loop_266,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x021400001407,	%l0,	%l1
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
loop_265:
	call	loop_267
	fbne	%fcc2,	loop_268
	edge16	%i7,	%o5,	%l5
loop_266:
	fcmpne32	%f28,	%f26,	%i4
loop_267:
	fmovdvc	%xcc,	%f12,	%f16
loop_268:
	call	loop_269
	fmovrdgz	%g5,	%f16,	%f16
	nop
	setx	0x86FB8E7C,	%l0,	%l6
	st	%l6,	[%l7 + 0x4C]
	ld	[%l7 + 0x4C],	%fsr
	tneg	%xcc,	0x0
loop_269:
	edge16	%o2,	%i2,	%o4
	fmovsvs	%icc,	%f6,	%f29
	add	%l0,	%i0,	%l3
	fxor	%f26,	%f26,	%f30
	call	loop_270
	call	loop_271
	fmovsvc	%icc,	%f3,	%f24
	fnand	%f26,	%f6,	%f30
loop_270:
	movrgz	%l1,	0x03B,	%g4
loop_271:
	tl	%xcc,	0x2
	rdhpr	%hpstate,	%l4
	faligndata	%f2,	%f10,	%f20
	fpmerge	%f18,	%f11,	%f22
	call	loop_272
	movgu	%icc,	%g3,	%l6
	fpsub16	%f22,	%f26,	%f2
	fmovd	%f16,	%f6
loop_272:
	call	loop_273
	tcs	%xcc,	0x4
	call	loop_274
	call	loop_275
loop_273:
	addccc	%o0,	0x004C,	%l2
	udiv	%i5,	%g6,	%o7
loop_274:
	movuge	%fcc1,	%o6,	%o1
loop_275:
	call	loop_276
	fnands	%f17,	%f4,	%f12
	sdiv	%g1,	0x00,	%i1
	fmovrse	%g2,	%f25,	%f20
loop_276:
	tsubcc	%i6,	0x0128,	%o3
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	edge16l	%g7,	%i3,	%o5
	fand	%f14,	%f16,	%f8
	fmovsgu	%icc,	%f19,	%f9
	nop
	set	0x44, %o7
	lduw	[%l7 + %o7],	%l5
	fbue,pt	%fcc1,	loop_277
	fmovdvs	%icc,	%f22,	%f0
	fmovdn	%xcc,	%f20,	%f20
	wrpr 	%g0, 	0x2, 	%gl
loop_277:
	wrpr	%i7,	0x1591,	%tick
	fmul8sux16	%f4,	%f24,	%f16
	fnegs	%f1,	%f10
	fxnors	%f13,	%f1,	%f10
	call	loop_278
	call	loop_279
	fmovsg	%fcc0,	%f10,	%f0
	call	loop_280
loop_278:
	nop
	fitod	%f0,	%f14
	fdtox	%f14,	%f10
loop_279:
	nop
	fitos	%f10,	%f17
	fstod	%f17,	%f12
	for	%f24,	%f6,	%f26
loop_280:
	fmuld8ulx16	%f20,	%f20,	%f16
	bshuffle	%f16,	%f20,	%f10
	call	loop_281
	nop
	setx	0xBEF2B572,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f20
	setx	0xD4BB8989,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f5
	fdivs	%f5,	%f20,	%f14
	fmovs	%f15,	%f13
	fmovse	%fcc0,	%f2,	%f31
loop_281:
	movg	%xcc,	%o2,	%g5
	xor	%i2,	%l0,	%o4
	fmovsa	%fcc2,	%f18,	%f23
	fxors	%f25,	%f10,	%f1
	fmovdcs	%xcc,	%f14,	%f12
	nop
	set	0x18, %l0
	ldsw	[%l7 + %l0],	%l3
	wr	%g0,	0x2e,	%asi
	ldda	[%l7 + 0x40] %asi,	%l0
	nop
	set	0x18, %l5
	ldd	[%l7 + %l5],	%f0
	call	loop_282
	for	%f4,	%f10,	%f12
	for	%f4,	%f10,	%f30
	fmovrdlz	%g4,	%f30,	%f20
loop_282:
	fnegd	%f24,	%f20
	sll	%i0,	0x00,	%l4
	call	loop_283
	fmovs	%f1,	%f30
	fmovrdlez	%l6,	%f0,	%f20
	fone	%f4
loop_283:
	array32	%o0,	%g3,	%l2
	movneg	%icc,	0x36C,	%g6
	fmovrslez	%o7,	%f14,	%f18
	fandnot1	%f18,	%f10,	%f24
	rdpr	%gl,	%i5
	fnot1s	%f1,	%f19
	fmovsu	%fcc1,	%f13,	%f12
	call	loop_284
	fmovrsne	%o6,	%f8,	%f21
	edge8	%g1,	%o1,	%i1
	ldsh	[%l7 + 0x48],	%i6
loop_284:
	nop
	setx	0x7B44A2BF,	%l0,	%l6
	st	%l6,	[%l7 + 0x3C]
	ld	[%l7 + 0x3C],	%fsr
	call	loop_285
	call	loop_286
	call	loop_287
	call	loop_288
loop_285:
	array16	%o3,	%g7,	%i3
loop_286:
	orncc	%g2,	0x03AE,	%l5
loop_287:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xE7E, 	%hsys_tick_cmpr
loop_288:
	fmovso	%fcc3,	%f12,	%f31
	ld	[%l7 + 0x6C],	%f22
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 1:
!
!	Type l   	: 33
!	Type a   	: 21
!	Type x   	: 10
!	Type cti   	: 143
!	Type f   	: 173
!	Type i   	: 120
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
	set	0x2,	%g1
	set	0x2,	%g2
	set	0xE,	%g3
	set	0x4,	%g4
	set	0x5,	%g5
	set	0xF,	%g6
	set	0xF,	%g7
	!# Input registers
	set	-0x0,	%i0
	set	-0xC,	%i1
	set	-0x2,	%i2
	set	-0xE,	%i3
	set	-0x2,	%i4
	set	-0x5,	%i5
	set	-0x7,	%i6
	set	-0x5,	%i7
	!# Local registers
	set	0x2776B734,	%l0
	set	0x3BDC0270,	%l1
	set	0x29FE2067,	%l2
	set	0x190C09F9,	%l3
	set	0x6359FEBB,	%l4
	set	0x35562EAE,	%l5
	set	0x0F046B6D,	%l6
	!# Output registers
	set	0x06C5,	%o0
	set	0x1A7A,	%o1
	set	0x0D3C,	%o2
	set	0x0F52,	%o3
	set	0x05B3,	%o4
	set	-0x0D64,	%o5
	set	-0x1ED7,	%o6
	set	0x1259,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0xD523630FDD061F8B)
	INIT_TH_FP_REG(%l7,%f2,0xAE0CDD1D39273890)
	INIT_TH_FP_REG(%l7,%f4,0xEA6C9FE21A53F8CA)
	INIT_TH_FP_REG(%l7,%f6,0xE96E6C657E02C71B)
	INIT_TH_FP_REG(%l7,%f8,0xFB09BCEC42A88D3F)
	INIT_TH_FP_REG(%l7,%f10,0x34A9A3AAA8FAD540)
	INIT_TH_FP_REG(%l7,%f12,0x0AF9C80D0A157C13)
	INIT_TH_FP_REG(%l7,%f14,0x70D050BFAA949054)
	INIT_TH_FP_REG(%l7,%f16,0x64C2D9F7783E696B)
	INIT_TH_FP_REG(%l7,%f18,0x53EE6B281353063D)
	INIT_TH_FP_REG(%l7,%f20,0x92269AD949643F8D)
	INIT_TH_FP_REG(%l7,%f22,0x9F25609CD5C02745)
	INIT_TH_FP_REG(%l7,%f24,0x7C2B8BE5FE50BC3F)
	INIT_TH_FP_REG(%l7,%f26,0xA8F8ABCD4B791C0D)
	INIT_TH_FP_REG(%l7,%f28,0x7D3EC69CA2CCFD4E)
	INIT_TH_FP_REG(%l7,%f30,0x542D35F2E88B05C0)

	!# Execute Main Diag ..

	call	loop_289
	fbg,pn	%fcc0,	loop_290
	nop
	setx	0x03AADB7F,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f21
	setx	0x659602C8,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f22
	fsubs	%f22,	%f21,	%f2
	wr	%g0,	0x19,	%asi
	ldsba	[%l7 + 0x71] %asi,	%i4
loop_289:
	movcc	%icc,	0x326,	%o2
loop_290:
	tl	%icc,	0x2
	call	loop_291
	call	loop_292
	call	loop_293
	call	loop_294
loop_291:
	call	loop_295
loop_292:
	call	loop_296
loop_293:
	fmovdge	%fcc3,	%f20,	%f8
loop_294:
	call	loop_297
loop_295:
	subccc	%g5,	0x1EDC,	%i7
loop_296:
	movcc	%icc,	%i2,	%o4
	wrpr	%l0,	%l3,	%cwp
loop_297:
	call	loop_298
	call	loop_299
	tsubcc	%l1,	%g4,	%i0
	tvs	%xcc,	0x1
loop_298:
	tpos	%icc,	0x2
loop_299:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x5C9, 	%hsys_tick_cmpr
	call	loop_300
	fpadd32	%f8,	%f26,	%f24
	nop
	setx	0x89B2D9936D5EEB7D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0xB01E266B3B0BE64E,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	faddd	%f18,	%f2,	%f20
	bl	%icc,	loop_301
loop_300:
	fmovrslz	%o0,	%f27,	%f16
	call	loop_302
	tcc	%icc,	0x5
loop_301:
	call	loop_303
	fcmped	%fcc0,	%f24,	%f12
loop_302:
	call	loop_304
	nop
	setx	0x65F2811F7A5E8E77,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	fsqrtd	%f2,	%f12
loop_303:
	subc	%g3,	%l2,	%o7
	xnor	%i5,	%o6,	%g6
loop_304:
	call	loop_305
	call	loop_306
	fmovsleu	%xcc,	%f23,	%f8
	array32	%g1,	%o1,	%i6
loop_305:
	fpsub32	%f18,	%f24,	%f28
loop_306:
	xorcc	%i1,	0x0F84,	%g7
	tneg	%icc,	0x3
	call	loop_307
	fbul,pt	%fcc0,	loop_308
	call	loop_309
	fble,a,pn	%fcc2,	loop_310
loop_307:
	call	loop_311
loop_308:
	movleu	%icc,	%o3,	%i3
loop_309:
	fmovs	%f10,	%f9
loop_310:
	edge8l	%l5,	%g2,	%o5
loop_311:
	call	loop_312
	add	%i4,	%o2,	%g5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xBF6, 	%hsys_tick_cmpr
	call	loop_313
loop_312:
	movuge	%fcc0,	%l0,	%l3
	call	loop_314
	and	%o4,	%l1,	%g4
loop_313:
	edge16ln	%l4,	%l6,	%o0
	fmovdvs	%xcc,	%f18,	%f14
loop_314:
	fmovdleu	%xcc,	%f28,	%f30
	umulcc	%i0,	%l2,	%o7
	udivcc	%i5,	0x00,	%o6
	bge,a,pt	%icc,	loop_315
	nop
	setx	0xFEFD5AEFD911708C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0x0C35FCD85FF46014,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	fdivd	%f20,	%f28,	%f6
	sdivx	%g3,	0x00,	%g1
	fmovrdgz	%g6,	%f8,	%f4
loop_315:
	call	loop_316
	fcmpgt16	%f4,	%f18,	%o1
	addcc	%i6,	0x0EEA,	%g7
	udivx	%o3,	%i1,	%l5
loop_316:
	fmovrde	%i3,	%f4,	%f2
	fbge,a	%fcc1,	loop_317
	fmuld8sux16	%f6,	%f25,	%f8
	call	loop_318
	fmovrdne	%g2,	%f28,	%f28
loop_317:
	fmovsge	%xcc,	%f7,	%f31

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xE67, 	%tick_cmpr
loop_318:
	call	loop_319
	nop
	set	0x34, %g6
	sth	%g5,	[%l7 + %g6]
	fmovsn	%fcc2,	%f11,	%f21
	fpack32	%f24,	%f20,	%f8
loop_319:
	fmovrsgez	%o5,	%f25,	%f6
	call	loop_320
	nop
	setx	0xF9B62EE2,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f31
	setx	0x61566F46,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f8
	fdivs	%f8,	%f31,	%f9
	ba,a	%xcc,	loop_321
	sra	%i2,	0x0B,	%l0
loop_320:
	rdpr	%cansave,	%i7
	call	loop_322
loop_321:
	tsubcc	%l3,	0x09D7,	%o4
	xnor	%l1,	0x080F,	%l4
	srlx	%g4,	%l6,	%o0
loop_322:
	fbe,pn	%fcc0,	loop_323
	sethi	0x129E,	%i0
	movg	%fcc0,	%l2,	%o7
	call	loop_324
loop_323:
	fmovrsne	%i5,	%f31,	%f11
	movcc	%xcc,	0x340,	%g3
	fandnot2	%f20,	%f10,	%f30
loop_324:
	call	loop_325
	fnegs	%f26,	%f12
	movo	%fcc2,	0x633,	%g1
	call	loop_326
loop_325:
	orn	%o6,	%o1,	%g6
	edge8ln	%i6,	%o3,	%g7
	call	loop_327
loop_326:
	nop
	setx	loop_328,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x034400001404,	%l0,	%l1
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
	fpack16	%f26,	%f29
	st	%f26,	[%l7 + 0x40]
loop_327:
	fmovsleu	%icc,	%f17,	%f31
loop_328:
	movlg	%fcc3,	0x40F,	%i1
	fmovsuge	%fcc2,	%f10,	%f8
	wrpr	%i3,	0x1B77,	%tick
	subcc	%g2,	%i4,	%l5
	call	loop_329
	taddcctv	%o2,	%g5,	%i2
	call	loop_330
	orncc	%l0,	%i7,	%l3
loop_329:
	fmovdue	%fcc3,	%f6,	%f10
	call	loop_331
loop_330:
	for	%f20,	%f4,	%f16
	call	loop_332
	mulscc	%o4,	%o5,	%l1
loop_331:
	call	loop_333
	edge32n	%g4,	%l4,	%o0
loop_332:
	fmovrdlez	%i0,	%f24,	%f22
	fzeros	%f1
loop_333:
	fbul	%fcc0,	loop_334
	call	loop_335
	bmask	%l6,	%o7,	%i5
	movl	%fcc2,	%g3,	%g1
loop_334:
	call	loop_336
loop_335:
	fmovrdgz	%o6,	%f24,	%f26
	rd	%y,	%l2
	fmovsue	%fcc3,	%f6,	%f21
loop_336:
	fzero	%f26
	rd	%pc,	%o1
	call	loop_337
	call	loop_338
	fsrc2s	%f6,	%f8
	fmovsule	%fcc1,	%f25,	%f20
loop_337:
	brgez	%i6,	loop_339
loop_338:
	call	loop_340
	umulcc	%g6,	%o3,	%i1
	wr	%g0,	0x19,	%asi
	lduha	[%l7 + 0x34] %asi,	%g7
loop_339:
	array32	%g2,	%i4,	%l5
loop_340:
	movpos	%xcc,	0x209,	%i3
	tvc	%xcc,	0x1
	fmovsle	%xcc,	%f6,	%f27
	fmovsue	%fcc3,	%f12,	%f26
	nop
	setx	0xBF408C4C,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f8
	setx	0xC9FF7D38,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f9
	fmuls	%f9,	%f8,	%f21
	rdhpr	%htba,	%o2
	rd	%softint,	%i2
	fcmpgt16	%f20,	%f10,	%g5
	call	loop_341
	fcmpgt16	%f24,	%f10,	%i7
	call	loop_342
	call	loop_343
loop_341:
	sdivx	%l0,	%o4,	%l3
	nop
	setx	loop_344,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x031200001401,	%l0,	%l1
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
loop_342:
	bpos,a	%xcc,	loop_345
loop_343:
	fbue	%fcc3,	loop_346
	fmovdu	%fcc2,	%f12,	%f10
loop_344:
	fandnot1	%f24,	%f18,	%f2
loop_345:
	edge8n	%o5,	%l1,	%g4
loop_346:
	call	loop_347
	addc	%l4,	%i0,	%o0
	tsubcctv	%l6,	%i5,	%o7
	fsrc1	%f18,	%f28
loop_347:
	call	loop_348
	fcmps	%fcc1,	%f29,	%f1
	fmovdne	%fcc0,	%f26,	%f14
	fmovsule	%fcc1,	%f14,	%f15
loop_348:
	addc	%g3,	%o6,	%g1
	call	loop_349
	nop
	set	0x6C, %g2
	ldsh	[%l7 + %g2],	%l2
	call	loop_350
	tge	%icc,	0x7
loop_349:
	rdpr	%gl,	%i6
	call	loop_351
loop_350:
	wrpr	%g6,	%o3,	%pil
	call	loop_352
	call	loop_353
loop_351:
	nop
	setx	0x85C4E5F29BE284F2,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	fsqrtd	%f4,	%f20
	fmovdge	%xcc,	%f20,	%f0
loop_352:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xA2F, 	%sys_tick_cmpr
loop_353:
	rdhpr	%ver,	%o1
	fmul8x16	%f22,	%f8,	%f0
	bmask	%g2,	%i4,	%l5
	fmovscs	%xcc,	%f16,	%f16
	call	loop_354
	fpackfix	%f4,	%f11
	movl	%xcc,	%o2,	%i2
	set	0x30, %g3
	lda	[%l7 + %g3] 0x18,	%f30
loop_354:
	fbg	%fcc3,	loop_355
	fors	%f0,	%f7,	%f0
	fsrc1s	%f2,	%f20
	fcmpeq16	%f0,	%f4,	%g5
loop_355:
	call	loop_356
	movne	%xcc,	%i3,	%l0
	mulscc	%i7,	%l3,	%o4
	call	loop_357
loop_356:
	movle	%fcc3,	0x538,	%l1
	call	loop_358
	movrlz	%g4,	0x343,	%o5
loop_357:
	edge8ln	%l4,	%i0,	%o0
	fors	%f2,	%f8,	%f1
loop_358:
	fmovdlg	%fcc1,	%f18,	%f26
	rdpr	%pil,	%i5
	call	loop_359
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	fmovde	%fcc1,	%f28,	%f14
	nop
	fitod	%f2,	%f6
	fdtox	%f6,	%f6
loop_359:
	alignaddrl	%l6,	%o7,	%g3
	call	loop_360
	call	loop_361
	call	loop_362
	call	loop_363
loop_360:
	movrlez	%g1,	%o6,	%i6
loop_361:
	rdhpr	%hsys_tick_cmpr,	%l2
loop_362:
	call	loop_364
loop_363:
	rdpr	%cleanwin,	%g6
	orncc	%o3,	0x11BD,	%i1
	bg,a,pn	%xcc,	loop_365
loop_364:
	wr	%o1,	%g2,	%set_softint
	set	0x1f8, %l6
!!	stxa	%g7,	[%g0 + %l6] 0x40
loop_365:
	movlg	%fcc0,	0x17D,	%i4
	wrpr 	%g0, 	0x3, 	%gl
	fornot2	%f16,	%f12,	%f18
	call	loop_366
	call	loop_367
	fmovsl	%icc,	%f16,	%f13
	tgu	%icc,	0x3
loop_366:
	movuge	%fcc2,	0x6BE,	%l5
loop_367:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	andncc	%l0,	0x0AD0,	%g5
	fba,a	%fcc2,	loop_368
	fblg,a	%fcc1,	loop_369
	fnands	%f27,	%f1,	%f28
	nop
	fitod	%f0,	%f30
	fdtoi	%f30,	%f7
loop_368:
	bshuffle	%f12,	%f28,	%f24
loop_369:
	fones	%f10
	tcc	%xcc,	0x7
	bgu	%icc,	loop_370
	bg,a,pn	%xcc,	loop_371
	movrgz	%l3,	0x363,	%i7
	ldub	[%l7 + 0x3E],	%o4
loop_370:
	sdiv	%g4,	0x00,	%l1
loop_371:
	fbg	%fcc0,	loop_372
	tge	%icc,	0x4
	tcc	%icc,	0x6
	nop
	fitod	%f0,	%f12
	fdtox	%f12,	%f28
	fxtod	%f28,	%f6
loop_372:
	edge32l	%o5,	%l4,	%i0
	fcmpeq16	%f12,	%f22,	%o0
	ta	%xcc,	0x3
	call	loop_373
	membar	0x11
	fbo,pt	%fcc1,	loop_374
	wr	%i5,	%o7,	%clear_softint
loop_373:
	xorcc	%l6,	%g1,	%o6
	rdhpr	%hintp,	%i6
loop_374:
	subcc	%l2,	%g3,	%o3
	fnot1	%f24,	%f2
	call	loop_375
	movvc	%icc,	0x76C,	%i1
	fornot1	%f18,	%f20,	%f12
	fpadd16s	%f26,	%f11,	%f14
loop_375:
	fmovsul	%fcc3,	%f6,	%f12
	call	loop_376
	movrne	%g6,	0x2FE,	%o1
	fmovrdgz	%g7,	%f4,	%f12
	call	loop_377
loop_376:
	call	loop_378
	call	loop_379
	rdhpr	%ver,	%i4
loop_377:
	nop
	fitod	%f4,	%f26
	fdtox	%f26,	%f20
loop_378:
	fmovd	%f0,	%f16
loop_379:
	movcc	%xcc,	0x40A,	%o2
	tge	%icc,	0x2
	fmovsge	%xcc,	%f11,	%f26
	edge16ln	%g2,	%l5,	%i2
	srax	%l0,	%i3,	%l3
	fmovsn	%fcc2,	%f23,	%f0
	call	loop_380
	fandnot1	%f26,	%f24,	%f4
	call	loop_381
	fzeros	%f31
loop_380:
	call	loop_382
	call	loop_383
loop_381:
	edge8ln	%i7,	%o4,	%g4
	call	loop_384
loop_382:
	sub	%l1,	0x0270,	%g5
loop_383:
	fpadd16	%f20,	%f24,	%f26
	movvc	%icc,	%o5,	%i0
loop_384:
	siam	0x3
	edge8	%l4,	%i5,	%o0
	fba	%fcc0,	loop_385
	fmovdneg	%icc,	%f4,	%f16
	faligndata	%f24,	%f18,	%f30
	movl	%fcc1,	%o7,	%l6
loop_385:
	nop
	wr	%g0,	0x11,	%asi
	ldswa	[%l7 + 0x18] %asi,	%g1
	call	loop_386
	orn	%o6,	%l2,	%g3
	call	loop_387
	bvc	%icc,	loop_388
loop_386:
	call	loop_389
	fnot1s	%f1,	%f24
loop_387:
	smul	%i6,	%i1,	%o3
loop_388:
	call	loop_390
loop_389:
	add	%g6,	%o1,	%g7
	fmovsn	%xcc,	%f24,	%f28
	call	loop_391
loop_390:
	wr	%o2,	0x1A39,	%pic
	fmovscs	%icc,	%f24,	%f3
	mulx	%g2,	%l5,	%i2
loop_391:
	lduh	[%l7 + 0x56],	%l0
	call	loop_392
	bpos	%icc,	loop_393
	call	loop_394
	call	loop_395
loop_392:
	brlz,a,pt	%i4,	loop_396
loop_393:
	mulscc	%l3,	%i3,	%i7
loop_394:
	tsubcc	%g4,	0x09F3,	%l1
loop_395:
	rd	%softint,	%o4
loop_396:
	nop
	fitos	%f13,	%f29
	fstox	%f29,	%f16
	fxtos	%f16,	%f4
	edge16ln	%g5,	%o5,	%i0
	nop
	fitod	%f4,	%f0
	fdtox	%f0,	%f30
	fxnor	%f30,	%f18,	%f10
	fnand	%f20,	%f10,	%f12
	fornot1	%f14,	%f14,	%f12
	fmovrslz	%l4,	%f4,	%f24
	fmovrde	%o0,	%f14,	%f14
	sdiv	%i5,	%o7,	%g1
	tsubcc	%o6,	0x01E4,	%l6
	movrlz	%l2,	0x12F,	%g3
	call	loop_397
	call	loop_398
	movge	%fcc1,	%i6,	%i1
	wr	%g0,	0x27,	%asi
	stxa	%g6,	[%l7 + 0x38] %asi
	membar	#Sync
loop_397:
	movu	%fcc2,	%o3,	%o1
loop_398:
	xnor	%o2,	0x17D1,	%g7
	nop
	set	0x76, %o4
	ldsh	[%l7 + %o4],	%l5
	call	loop_399
	fmovsneg	%xcc,	%f26,	%f21
	smulcc	%i2,	%g2,	%l0
	fmovspos	%xcc,	%f20,	%f15
loop_399:
	fmovde	%fcc1,	%f4,	%f20
	umul	%i4,	%l3,	%i3
	fba,a,pt	%fcc0,	loop_400
	movvs	%icc,	%i7,	%g4
	array8	%l1,	%o4,	%o5
	call	loop_401
loop_400:
	movue	%fcc1,	%g5,	%l4
	call	loop_402
	fmuld8ulx16	%f12,	%f22,	%f10
loop_401:
	fbue,a	%fcc2,	loop_403
	call	loop_404
loop_402:
	movug	%fcc0,	%i0,	%o0
	fmovdo	%fcc3,	%f26,	%f12
loop_403:
	nop
	set	0x38, %l1
	stda	%o6,	[%l7 + %l1] 0x2a
	membar	#Sync
loop_404:
	fand	%f2,	%f30,	%f0
	call	loop_405
	nop
	set	0x76, %i6
	ldstub	[%l7 + %i6],	%i5
	andn	%g1,	%o6,	%l6
	movneg	%icc,	0x7FC,	%l2
loop_405:
	fornot1	%f10,	%f6,	%f28
	fmovrdlz	%g3,	%f18,	%f22

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xBDA, 	%sys_tick_cmpr
	movrne	%g6,	0x2E6,	%o3
	fmovsule	%fcc1,	%f24,	%f5
	ba,a	%xcc,	loop_406
	nop
	setx	0xCF7CEA5B,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f7
	setx	0x2562AD9F,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f10
	fsubs	%f10,	%f7,	%f11
	brz,pt	%o2,	loop_407
	fmul8sux16	%f8,	%f4,	%f18
loop_406:
	fmovdo	%fcc2,	%f16,	%f4
	call	loop_408
loop_407:
	call	loop_409
	faligndata	%f28,	%f12,	%f2
	andncc	%g7,	%l5,	%o1
loop_408:
	movvc	%xcc,	0x330,	%g2
loop_409:
	fpsub32s	%f20,	%f28,	%f9
	fmovsge	%icc,	%f2,	%f6
	movu	%fcc3,	0x01E,	%i2
	edge32n	%l0,	%i4,	%l3
	call	loop_410
	bn	%icc,	loop_411
	fnegs	%f9,	%f18
	call	loop_412
loop_410:
	wr 	%g0, 	0x5, 	%fprs
loop_411:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	movvc	%icc,	%l1,	%g4
loop_412:
	call	loop_413
	sir	0x1D07
	siam	0x4
	fmovspos	%xcc,	%f16,	%f28
loop_413:
	fmovsvc	%xcc,	%f17,	%f13
	xnor	%o5,	0x0CDA,	%o4
	fmovsul	%fcc2,	%f29,	%f10
	nop
	set	0x70, %i2
	std	%l4,	[%l7 + %i2]
	sra	%g5,	%i0,	%o0
	andncc	%o7,	0x17B9,	%g1
	brgez	%i5,	loop_414
	call	loop_415
	subccc	%o6,	0x103A,	%l6
	call	loop_416
loop_414:
	fmovrde	%l2,	%f26,	%f6
loop_415:
	call	loop_417
	call	loop_418
loop_416:
	fexpand	%f8,	%f2
	brgez,a	%g3,	loop_419
loop_417:
	fsrc1s	%f25,	%f11
loop_418:
	fmovrde	%i1,	%f16,	%f6
	call	loop_420
loop_419:
	call	loop_421
	fmovrsgez	%i6,	%f7,	%f15
	movcc	%xcc,	%g6,	%o2
loop_420:
	movrne	%o3,	0x34C,	%g7
loop_421:
	call	loop_422
	edge16	%o1,	%g2,	%i2
	udivcc	%l5,	%l0,	%i4
	fmovscc	%xcc,	%f26,	%f13
loop_422:
	fmovrse	%i7,	%f6,	%f5
	srlx	%l3,	0x16,	%l1
	tpos	%icc,	0x5
	call	loop_423
	fmovsa	%xcc,	%f10,	%f23
	edge8n	%g4,	%o5,	%i3
	andn	%o4,	%g5,	%l4
loop_423:
	nop
	fitod	%f8,	%f16
	fdtos	%f16,	%f18
	rdpr	%otherwin,	%i0
	call	loop_424
	call	loop_425
	fmovrdgz	%o7,	%f28,	%f6
	fpack32	%f24,	%f18,	%f30
loop_424:
	edge8n	%o0,	%g1,	%o6
loop_425:
	nop
	fitod	%f4,	%f8
	fdtox	%f8,	%f20
	fxtod	%f20,	%f16
	sub	%i5,	0x077E,	%l6
	stx	%fsr,	[%l7 + 0x40]
	fcmpes	%fcc2,	%f31,	%f18
	call	loop_426
	bgu,a	%xcc,	loop_427
	movle	%fcc3,	0x4C1,	%l2
	call	loop_428
loop_426:
	sdivx	%i1,	%i6,	%g3
loop_427:
	fmovdgu	%xcc,	%f6,	%f8
	call	loop_429
loop_428:
	movn	%fcc3,	0x3FA,	%g6
	rdhpr	%htba,	%o2
	fornot1	%f10,	%f16,	%f12
loop_429:
	fcmpne32	%f26,	%f12,	%o3
	call	loop_430
	call	loop_431
	fmovsgu	%xcc,	%f30,	%f16
	flushw
loop_430:
	fandnot1s	%f25,	%f19,	%f3
loop_431:
	call	loop_432
	tg	%xcc,	0x3
	call	loop_433
	udiv	%o1,	%g2,	%g7
loop_432:
	call	loop_434
	fpmerge	%f6,	%f30,	%f18
loop_433:
	fands	%f30,	%f31,	%f11
	fornot1s	%f19,	%f10,	%f27
loop_434:
	tne	%xcc,	0x1
	movcc	%xcc,	%l5,	%i2
	te	%xcc,	0x7
	edge32ln	%i4,	%i7,	%l0
	call	loop_435
	bvs	%xcc,	loop_436
	movle	%xcc,	0x520,	%l1
	fmovsleu	%icc,	%f17,	%f31
loop_435:
	tsubcctv	%g4,	%l3,	%o5
loop_436:
	call	loop_437
	fandnot1	%f10,	%f6,	%f14
	rd	%tick_cmpr,	%i3
	wr	%g0,	0x19,	%asi
	lda	[%l7 + 0x74] %asi,	%f7
loop_437:
	call	loop_438
	call	loop_439
	movrlz	%g5,	0x30A,	%l4
	array32	%i0,	%o7,	%o4
loop_438:
	fnands	%f6,	%f21,	%f19
loop_439:
	tcc	%icc,	0x2
	rd	%tick_cmpr,	%o0
	lduw	[%l7 + 0x28],	%o6
	nop
	fitos	%f9,	%f2
	fstoi	%f2,	%f24
	nop
	fitod	%f12,	%f26
	fdtox	%f26,	%f20
	fxnors	%f21,	%f19,	%f30
	movpos	%icc,	%g1,	%l6
	call	loop_440
	tgu	%xcc,	0x3
	xnorcc	%i5,	0x0890,	%l2
	bpos,pn	%icc,	loop_441
loop_440:
	nop

loop_441:
	nop

	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 2:
!
!	Type l   	: 18
!	Type a   	: 32
!	Type x   	: 8
!	Type cti   	: 153
!	Type f   	: 141
!	Type i   	: 148
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
	set	0x7,	%g1
	set	0xC,	%g2
	set	0x2,	%g3
	set	0x2,	%g4
	set	0xD,	%g5
	set	0xE,	%g6
	set	0x1,	%g7
	!# Input registers
	set	-0x1,	%i0
	set	-0x7,	%i1
	set	-0xA,	%i2
	set	-0xD,	%i3
	set	-0x1,	%i4
	set	-0xC,	%i5
	set	-0xA,	%i6
	set	-0x2,	%i7
	!# Local registers
	set	0x5F0E10A6,	%l0
	set	0x2F506B39,	%l1
	set	0x56125447,	%l2
	set	0x5957FA0B,	%l3
	set	0x4C03946E,	%l4
	set	0x34FB41D5,	%l5
	set	0x3410BB6E,	%l6
	!# Output registers
	set	0x07AC,	%o0
	set	-0x1099,	%o1
	set	0x1514,	%o2
	set	0x13BF,	%o3
	set	0x0EC4,	%o4
	set	-0x15DF,	%o5
	set	0x0F00,	%o6
	set	0x0F38,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0xD523630FDD061F8B)
	INIT_TH_FP_REG(%l7,%f2,0xAE0CDD1D39273890)
	INIT_TH_FP_REG(%l7,%f4,0xEA6C9FE21A53F8CA)
	INIT_TH_FP_REG(%l7,%f6,0xE96E6C657E02C71B)
	INIT_TH_FP_REG(%l7,%f8,0xFB09BCEC42A88D3F)
	INIT_TH_FP_REG(%l7,%f10,0x34A9A3AAA8FAD540)
	INIT_TH_FP_REG(%l7,%f12,0x0AF9C80D0A157C13)
	INIT_TH_FP_REG(%l7,%f14,0x70D050BFAA949054)
	INIT_TH_FP_REG(%l7,%f16,0x64C2D9F7783E696B)
	INIT_TH_FP_REG(%l7,%f18,0x53EE6B281353063D)
	INIT_TH_FP_REG(%l7,%f20,0x92269AD949643F8D)
	INIT_TH_FP_REG(%l7,%f22,0x9F25609CD5C02745)
	INIT_TH_FP_REG(%l7,%f24,0x7C2B8BE5FE50BC3F)
	INIT_TH_FP_REG(%l7,%f26,0xA8F8ABCD4B791C0D)
	INIT_TH_FP_REG(%l7,%f28,0x7D3EC69CA2CCFD4E)
	INIT_TH_FP_REG(%l7,%f30,0x542D35F2E88B05C0)

	!# Execute Main Diag ..

	call	loop_442
	fpsub32s	%f4,	%f12,	%f28
	call	loop_443
	wrpr	%i6,	%i1,	%tick
loop_442:
	call	loop_444
	fxnor	%f18,	%f20,	%f6
loop_443:
	edge8n	%g6,	%o2,	%o3
	fmuld8ulx16	%f26,	%f4,	%f12
loop_444:
	movul	%fcc0,	0x472,	%g3
	xorcc	%g2,	0x067A,	%o1
	fpadd16s	%f10,	%f25,	%f25
	srlx	%g7,	%i2,	%l5
	edge32n	%i4,	%i7,	%l1
	call	loop_445
	call	loop_446
	and	%g4,	0x1B7F,	%l3
	call	loop_447
loop_445:
	fabsd	%f28,	%f8
loop_446:
	call	loop_448
	tle	%xcc,	0x6
loop_447:
	pdist	%f22,	%f30,	%f24
	call	loop_449
loop_448:
	movrne	%o5,	0x2D0,	%i3
	fsrc2	%f28,	%f8
	call	loop_450
loop_449:
	tpos	%icc,	0x2
	fmovdl	%fcc3,	%f30,	%f6
	call	loop_451
loop_450:
	movul	%fcc1,	%l0,	%g5
	fnands	%f31,	%f21,	%f3
	rdpr	%tl,	%l4
loop_451:
	call	loop_452
	call	loop_453
	andcc	%i0,	0x1B5A,	%o4
	call	loop_454
loop_452:
	wr 	%g0, 	0x7, 	%fprs
loop_453:
	sdivcc	%o6,	0x00,	%g1
	fmovsne	%fcc1,	%f13,	%f0
loop_454:
	xor	%o0,	%i5,	%l6
	fpack32	%f8,	%f24,	%f4
	fmovdle	%xcc,	%f2,	%f10
	smul	%i6,	%i1,	%g6
	sra	%o2,	%l2,	%o3
	te	%xcc,	0x5
	nop
	set	0x2E, %o0
	lduh	[%l7 + %o0],	%g2
	movle	%icc,	%g3,	%g7
	fmovduge	%fcc1,	%f30,	%f14
	faligndata	%f20,	%f14,	%f26
	alignaddrl	%o1,	%i2,	%i4
	fpadd32	%f4,	%f26,	%f20
	movrgez	%i7,	0x296,	%l5
	faligndata	%f18,	%f8,	%f8
	wrpr	%l1,	%l3,	%pil
	movcs	%icc,	%o5,	%g4
	fpadd16	%f26,	%f2,	%f24
	nop
	set	0x5E, %o3
	ldsh	[%l7 + %o3],	%i3
	call	loop_455
	fcmpeq16	%f28,	%f16,	%g5
	fmul8x16au	%f16,	%f5,	%f24
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
loop_455:
	movul	%fcc2,	%l4,	%l0
	fmovrde	%o4,	%f22,	%f14
	call	loop_456
	fmovdge	%xcc,	%f0,	%f0
	fpadd32s	%f17,	%f5,	%f14
	call	loop_457
loop_456:
	call	loop_458
	fmovdlg	%fcc1,	%f16,	%f4
	movuge	%fcc1,	%o7,	%o6
loop_457:
	tsubcc	%i0,	%o0,	%g1
loop_458:
	fmovdlg	%fcc3,	%f30,	%f4
	call	loop_459
	movneg	%xcc,	%l6,	%i5
	nop
	fitos	%f4,	%f13
	fstoi	%f13,	%f20
	set	0x40, %i5
	stda	%f0,	[%l7 + %i5] 0xc0
loop_459:
	bmask	%i6,	%i1,	%g6
	fnegs	%f24,	%f12
	call	loop_460
	lduw	[%l7 + 0x24],	%o2
	fmovdleu	%xcc,	%f28,	%f10
	call	loop_461
loop_460:
	call	loop_462
	fmovspos	%icc,	%f14,	%f25
	tleu	%icc,	0x5
loop_461:
	tge	%icc,	0x7
loop_462:
	array16	%l2,	%o3,	%g2
	nop
	set	0x08, %i3
	ldd	[%l7 + %i3],	%g6
	edge32l	%g3,	%o1,	%i2
	fmovdul	%fcc1,	%f12,	%f2
	call	loop_463
	call	loop_464
	orcc	%i4,	%i7,	%l5
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
loop_463:
	bne,a,pt	%icc,	loop_465
loop_464:
	movpos	%icc,	0x570,	%l3
	fbuge,a	%fcc2,	loop_466
	subccc	%l1,	0x05EE,	%g4
loop_465:
	fbuge	%fcc1,	loop_467
	movug	%fcc3,	%o5,	%i3
loop_466:
	fmovde	%fcc0,	%f24,	%f14
	te	%xcc,	0x6
loop_467:
	sir	0x1F4D
	brnz,pt	%l4,	loop_468
	fmovsu	%fcc3,	%f3,	%f15
	bn,a	%xcc,	loop_469
	fmovrsgz	%g5,	%f3,	%f2
loop_468:
	call	loop_470
	call	loop_471
loop_469:
	fmovde	%xcc,	%f2,	%f26
	fmovsvs	%icc,	%f30,	%f26
loop_470:
	call	loop_472
loop_471:
	fcmps	%fcc1,	%f17,	%f10
	call	loop_473
	call	loop_474
loop_472:
	edge32ln	%l0,	%o4,	%o7
	bcs,a	%icc,	loop_475
loop_473:
	call	loop_476
loop_474:
	movug	%fcc3,	%i0,	%o0
	fmul8x16au	%f31,	%f13,	%f12
loop_475:
	call	loop_477
loop_476:
	flushw
	call	loop_478
	call	loop_479
loop_477:
	call	loop_480
	nop
	setx	0x3E3ABCE4,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f11
	setx	0x89E1985A,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f0
	fdivs	%f0,	%f11,	%f1
loop_478:
	call	loop_481
loop_479:
	mova	%fcc2,	0x5E5,	%g1
loop_480:
	bvs	%icc,	loop_482
	subccc	%o6,	%l6,	%i6
loop_481:
	call	loop_483
	call	loop_484
loop_482:
	movge	%icc,	%i5,	%i1
	call	loop_485
loop_483:
	movrgz	%g6,	0x163,	%o2
loop_484:
	call	loop_486
	fmovsl	%fcc3,	%f28,	%f0
loop_485:
	nop
	set	0x08, %i4
	stx	%fsr,	[%l7 + %i4]
	movrgz	%o3,	%l2,	%g2
loop_486:
	call	loop_487
	fmovdle	%fcc1,	%f4,	%f24
	nop
	setx	0x1B21AF77,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f15
	fsqrts	%f15,	%f12
	tge	%xcc,	0x3
loop_487:
	fmovrsgz	%g7,	%f4,	%f31
	nop
	fitos	%f13,	%f7
	fstox	%f7,	%f10
	fxtos	%f10,	%f5
	nop
	setx	0x75C99541442A615F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	fsqrtd	%f10,	%f24
	fabss	%f0,	%f6
	call	loop_488
	sllx	%g3,	%i2,	%i4
	edge32ln	%i7,	%l5,	%l3
	or	%o1,	%l1,	%o5
loop_488:
	call	loop_489
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	nop
	set	0x70, %i7
	prefetch	[%l7 + %i7],	 4
	fmul8x16al	%f8,	%f12,	%f24
loop_489:
	subcc	%i3,	0x135A,	%g4
	subcc	%l4,	0x00B9,	%l0
	call	loop_490
	call	loop_491
	call	loop_492
	tgu	%icc,	0x4
loop_490:
	nop
	set	0x64, %g5
	stw	%g5,	[%l7 + %g5]
loop_491:
	fbu,a,pn	%fcc3,	loop_493
loop_492:
	call	loop_494
	fmovdvs	%icc,	%f12,	%f24
	rdpr	%gl,	%o7
loop_493:
	call	loop_495
loop_494:
	array32	%o4,	%o0,	%g1
	rdpr	%cansave,	%o6
	fmovslg	%fcc3,	%f31,	%f9
loop_495:
	nop
	fitod	%f10,	%f12
	fdtox	%f12,	%f24
	fxtod	%f24,	%f14
	fbu,pn	%fcc0,	loop_496
	fmuld8sux16	%f6,	%f11,	%f16
	fmovdgu	%xcc,	%f30,	%f6
	fsrc1s	%f20,	%f18
loop_496:
	fmovslg	%fcc0,	%f31,	%f22
	fmovde	%xcc,	%f20,	%f24
	fmovrse	%l6,	%f24,	%f16
	call	loop_497
	fmovrdlz	%i0,	%f30,	%f22
	call	loop_498
	fbn,a	%fcc0,	loop_499
loop_497:
	fmovsn	%icc,	%f26,	%f18
	call	loop_500
loop_498:
	movug	%fcc0,	%i5,	%i1
loop_499:
	sdivcc	%g6,	%i6,	%o2
	fbn,a,pt	%fcc1,	loop_501
loop_500:
	call	loop_502
	subcc	%l2,	0x0F8D,	%o3
	fcmpd	%fcc3,	%f18,	%f8
loop_501:
	movge	%fcc0,	0x58F,	%g2
loop_502:
	sll	%g7,	0x0E,	%i2
	fcmpd	%fcc1,	%f8,	%f2
	for	%f10,	%f2,	%f18
	subcc	%i4,	0x0DC0,	%i7
	call	loop_503
	fmovdue	%fcc3,	%f24,	%f24
	fmovs	%f27,	%f3
	fmovsneg	%xcc,	%f15,	%f5
loop_503:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	call	loop_504
	call	loop_505
	fmovrslz	%l3,	%f29,	%f7
	movlg	%fcc1,	0x23C,	%o1
loop_504:
	fcmpne32	%f24,	%f2,	%l1
loop_505:
	fmovdul	%fcc2,	%f20,	%f8
	fmovdgu	%xcc,	%f26,	%f6
	movule	%fcc0,	0x44C,	%g3
	edge16ln	%i3,	%o5,	%l4
	bcs,pt	%icc,	loop_506
	and	%g4,	%g5,	%l0
	andncc	%o7,	0x1770,	%o0
	fmovdg	%xcc,	%f6,	%f6
loop_506:
	nop
	set	0x20, %l4
	stxa	%o4,	[%l7 + %l4] 0x18
	fmuld8ulx16	%f25,	%f7,	%f30
	ldstub	[%l7 + 0x1C],	%o6
	srlx	%l6,	%i0,	%i5
	nop
	setx	0xE127DC16DFEB69A3,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	fsqrtd	%f12,	%f2
	call	loop_507
	call	loop_508
	call	loop_509
	xor	%g1,	0x01E3,	%g6
loop_507:
	call	loop_510
loop_508:
	andn	%i1,	%i6,	%o2
loop_509:
	fmovdcs	%icc,	%f8,	%f22
	call	loop_511
loop_510:
	movrgz	%o3,	0x385,	%g2
	edge32l	%l2,	%g7,	%i4
	call	loop_512
loop_511:
	nop
	setx	0x17898D6893F5D7D5,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0x8BF5CE9EC57C2C7B,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	faddd	%f12,	%f20,	%f30
	call	loop_513
	movcc	%icc,	%i7,	%i2
loop_512:
	fmovso	%fcc1,	%f31,	%f16
	fmovrdlz	%l3,	%f20,	%f20
loop_513:
	sdiv	%l5,	%l1,	%o1
	movge	%xcc,	0x24D,	%g3
	fmovsvs	%xcc,	%f4,	%f24
	fmul8x16au	%f2,	%f8,	%f30
	udiv	%i3,	%l4,	%o5
	subc	%g4,	%l0,	%g5
	fand	%f16,	%f0,	%f28
	fmovdge	%icc,	%f2,	%f4
	call	loop_514
	call	loop_515
	fnot2s	%f18,	%f23
	array8	%o7,	%o0,	%o6
loop_514:
	movre	%l6,	%o4,	%i5
loop_515:
	movvc	%xcc,	0x036,	%g1
	wr	%i0,	0x04CB,	%softint
	nop
	set	0x48, %g1
	swap	[%l7 + %g1],	%i1
	nop
	fitod	%f19,	%f18
	fmovrslz	%g6,	%f13,	%f19
	tle	%icc,	0x2
	rdhpr	%hsys_tick_cmpr,	%i6
	fmovsvc	%xcc,	%f15,	%f20
	call	loop_516
	fmovsa	%icc,	%f7,	%f5
	brgz	%o2,	loop_517
	edge8l	%g2,	%l2,	%g7
loop_516:
	fnegs	%f16,	%f20
	call	loop_518
loop_517:
	fxnors	%f7,	%f20,	%f16
	fmovsvs	%xcc,	%f7,	%f5
	bne	%xcc,	loop_519
loop_518:
	fnot2	%f22,	%f12
	call	loop_520
	call	loop_521
loop_519:
	call	loop_522
	fmovdneg	%icc,	%f22,	%f4
loop_520:
	movrgz	%i4,	%o3,	%i2
loop_521:
	call	loop_523
loop_522:
	sth	%i7,	[%l7 + 0x1E]
	umulcc	%l3,	0x1426,	%l1
	call	loop_524
loop_523:
	tleu	%xcc,	0x2
	rdhpr	%hintp,	%o1
	fmovso	%fcc0,	%f30,	%f0
loop_524:
	fors	%f26,	%f21,	%f10
	tgu	%icc,	0x6
	orn	%l5,	0x0AA9,	%g3
	bge,pt	%icc,	loop_525
	rdpr	%canrestore,	%i3
	brgez,a	%l4,	loop_526
	andcc	%g4,	0x0FC6,	%o5
loop_525:
	call	loop_527
	edge16n	%l0,	%o7,	%o0
loop_526:
	or	%g5,	%o6,	%l6
	tcs	%icc,	0x0
loop_527:
	subcc	%i5,	%o4,	%g1
	rdpr	%pil,	%i1
	fnor	%f2,	%f8,	%f6
	call	loop_528
	call	loop_529
	addccc	%i0,	%g6,	%o2
	tsubcctv	%g2,	0x1E86,	%l2
loop_528:
	fmovdul	%fcc2,	%f14,	%f12
loop_529:
	nop
	setx	0xE548B810C18FAEBE,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0x31576604A2430D91,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	faddd	%f6,	%f28,	%f14
	movcc	%icc,	0x075,	%g7
	nop
	set	0x70, %o5
	std	%f24,	[%l7 + %o5]
	edge8l	%i6,	%o3,	%i4
	flushw
	fmovs	%f24,	%f5
	call	loop_530
	flushw
	fmovrdlz	%i2,	%f28,	%f4
	mova	%icc,	0x0CF,	%l3
loop_530:
	fnands	%f17,	%f19,	%f3
	call	loop_531
	call	loop_532
	movlg	%fcc0,	%i7,	%l1
	call	loop_533
loop_531:
	movleu	%icc,	%l5,	%o1
loop_532:
	call	loop_534
	fmovsul	%fcc2,	%f5,	%f6
loop_533:
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	call	loop_535
loop_534:
	fmovsg	%icc,	%f13,	%f29
	fmovdvs	%xcc,	%f30,	%f16
	xnorcc	%i3,	0x184B,	%l4
loop_535:
	edge32	%g3,	%o5,	%l0
	fmovdcc	%xcc,	%f20,	%f4
	call	loop_536
	call	loop_537
	sllx	%o7,	0x1D,	%g4
	fmovsu	%fcc0,	%f20,	%f31
loop_536:
	call	loop_538
loop_537:
	fbue,a	%fcc3,	loop_539
	or	%o0,	%g5,	%l6
	alignaddr	%i5,	%o6,	%o4
loop_538:
	call	loop_540
loop_539:
	call	loop_541
	call	loop_542
	udivx	%g1,	%i0,	%g6
loop_540:
	call	loop_543
loop_541:
	xorcc	%i1,	0x1F3F,	%g2
loop_542:
	bmask	%o2,	%g7,	%l2
	movo	%fcc1,	%i6,	%i4
loop_543:
	tleu	%xcc,	0x7
	fornot1s	%f13,	%f14,	%f24
	call	loop_544
	fmuld8ulx16	%f26,	%f2,	%f8
	wr	%g0,	0xea,	%asi
	ldda	[%l7 + 0x70] %asi,	%i2
loop_544:
	brz,a	%l3,	loop_545
	call	loop_546
	tle	%icc,	0x4
	call	loop_547
loop_545:
	fcmpeq32	%f12,	%f6,	%o3
loop_546:
	tge	%icc,	0x7
	nop
	setx	0xFDD0AF84FCC3BEAA,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0x3817F2FE457FC245,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	fdivd	%f26,	%f16,	%f12
loop_547:
	nop
	wr	%g0,	0x0c,	%asi
	lduba	[%l7 + 0x63] %asi,	%l1
	nop
	setx	0x97B673A2,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f7
	setx	0xFC7C81F2,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f2
	fmuls	%f2,	%f7,	%f11
	call	loop_548
	call	loop_549
	sdivcc	%l5,	0x00,	%i7
	fmovsa	%fcc2,	%f31,	%f4
loop_548:
	fmovduge	%fcc2,	%f2,	%f22
loop_549:
	nop
	setx	0x29FC267ABA48DF83,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	fsqrtd	%f8,	%f4
	call	loop_550
	movne	%fcc3,	0x2E8,	%o1
	fcmpes	%fcc3,	%f18,	%f12
	movpos	%xcc,	0x27D,	%l4
loop_550:
	call	loop_551
	udivx	%i3,	0x00,	%o5
	tcs	%xcc,	0x2
	movl	%icc,	%g3,	%o7
loop_551:
	fexpand	%f14,	%f24
	fmul8x16	%f29,	%f30,	%f24
	call	loop_552
	edge32n	%l0,	%o0,	%g4
	call	loop_553
	udiv	%g5,	0x00,	%i5
loop_552:
	call	loop_554
	nop
	set	0x78, %i0
	ldd	[%l7 + %i0],	%f28
loop_553:
	mulscc	%l6,	0x1763,	%o6
	fmovdue	%fcc3,	%f20,	%f24
loop_554:
	call	loop_555
	array16	%g1,	%i0,	%g6
	call	loop_556
	fmovdue	%fcc2,	%f0,	%f24
loop_555:
	call	loop_557
	movleu	%xcc,	0x5DC,	%o4
loop_556:
	fbue	%fcc2,	loop_558
	movle	%icc,	%i1,	%g2
loop_557:
	faligndata	%f28,	%f18,	%f30
	call	loop_559
loop_558:
	call	loop_560
	ba,a	%xcc,	loop_561
	fnors	%f17,	%f22,	%f18
loop_559:
	nop
	set	0x48, %o6
	stxa	%g7,	[%l7 + %o6] 0x10
loop_560:
	call	loop_562
loop_561:
	ldx	[%l7 + 0x18],	%l2
	wr	%o2,	0x02E9,	%softint
	nop
	set	0x10, %i1
	std	%i4,	[%l7 + %i1]
loop_562:
	fpsub32s	%f11,	%f13,	%f21
	fbul,a	%fcc3,	loop_563
	call	loop_564
	movvs	%xcc,	0x279,	%i6
	st	%fsr,	[%l7 + 0x6C]
loop_563:
	mova	%fcc0,	0x110,	%l3
loop_564:
	call	loop_565
	fmovrslz	%i2,	%f16,	%f27
	movl	%fcc1,	%l1,	%l5
	bl,a,pt	%xcc,	loop_566
loop_565:
	fmovrsne	%o3,	%f27,	%f25
	call	loop_567
	taddcctv	%o1,	%l4,	%i3
loop_566:
	fcmpne16	%f10,	%f6,	%i7
	te	%icc,	0x2
loop_567:
	movneg	%xcc,	0x6F0,	%o5
	xnor	%o7,	%l0,	%g3
	tpos	%icc,	0x7
	set	0x7E, %g4
	lduha	[%l7 + %g4] 0x81,	%o0
	be	%xcc,	loop_568
	call	loop_569
	add	%g4,	%i5,	%l6
	fpsub32	%f26,	%f16,	%f10
loop_568:
	fandnot2	%f20,	%f4,	%f16
loop_569:
	call	loop_570
	taddcctv	%g5,	%o6,	%g1
	fmovsle	%xcc,	%f27,	%f21
	tgu	%icc,	0x7
loop_570:
	xnorcc	%i0,	0x05B9,	%o4
	andn	%i1,	%g6,	%g2
	fandnot1s	%f12,	%f19,	%f0
	orn	%l2,	%o2,	%g7
	fmovs	%f25,	%f12
	fmovso	%fcc1,	%f26,	%f18
	call	loop_571
	fpsub16	%f30,	%f10,	%f28
	srlx	%i4,	0x03,	%l3
	prefetch	[%l7 + 0x20],	 1
loop_571:
	fpsub32s	%f14,	%f24,	%f16
	subcc	%i6,	%l1,	%l5
	fsrc2s	%f27,	%f27
	addc	%i2,	0x091B,	%o1
	rdhpr	%hintp,	%o3
	fmovrdne	%l4,	%f24,	%f16
	nop
	setx	0x83970FEA,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f15
	setx	0x1BCD411E,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f17
	fmuls	%f17,	%f15,	%f7
	call	loop_572
	fabsd	%f22,	%f0
	fmovsle	%xcc,	%f25,	%f8
	movcc	%xcc,	0x112,	%i3
loop_572:
	array16	%i7,	%o7,	%o5
	movue	%fcc1,	%g3,	%l0
	fmovda	%fcc3,	%f18,	%f28
	bvc,a,pn	%icc,	loop_573
	nop
	fitos	%f5,	%f29
	fstox	%f29,	%f10
	tpos	%xcc,	0x1
	movu	%fcc3,	0x01D,	%g4
loop_573:
	call	loop_574
	call	loop_575
	nop
	setx	0x658FFEE2,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f1
	setx	0x3D880F4E,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f26
	fmuls	%f26,	%f1,	%f7
	tsubcctv	%i5,	0x0DD7,	%o0
loop_574:
	fmovsneg	%xcc,	%f9,	%f9
loop_575:
	fmovsneg	%icc,	%f1,	%f31
	movrlz	%l6,	%o6,	%g5
	fmovdu	%fcc3,	%f6,	%f16
	array32	%g1,	%o4,	%i1
	rdpr	%tl,	%g6
	call	loop_576
	call	loop_577
	orcc	%i0,	%g2,	%l2
	add	%g7,	0x0F82,	%o2
loop_576:
	call	loop_578
loop_577:
	fmovdne	%fcc1,	%f4,	%f4
	call	loop_579
	call	loop_580
loop_578:
	call	loop_581
	call	loop_582
loop_579:
	fmovrdne	%l3,	%f12,	%f8
loop_580:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
loop_581:
	movuge	%fcc1,	0x709,	%l1
loop_582:
	edge32l	%l5,	%i2,	%o1
	fpadd16	%f30,	%f28,	%f0
	fmovrsgz	%i6,	%f27,	%f11
	tl	%icc,	0x7
	fmovse	%icc,	%f30,	%f8
	call	loop_583
	edge16ln	%l4,	%o3,	%i7
	bpos	%icc,	loop_584
	rdhpr	%htba,	%o7
loop_583:
	fmovsuge	%fcc2,	%f2,	%f12
	nop
	set	0x58, %l2
	std	%f16,	[%l7 + %l2]
loop_584:
	orn	%o5,	%g3,	%i3
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	fcmpes	%fcc2,	%f2,	%f4
	edge8	%l0,	%g4,	%i5
	movneg	%icc,	0x744,	%o0
	nop
	set	0x74, %o1
	ldsw	[%l7 + %o1],	%l6
	rdpr	%cleanwin,	%g5
	call	loop_585
	fnor	%f0,	%f14,	%f4
	movvc	%icc,	0x1DD,	%o6
	fmovdg	%icc,	%f0,	%f2
loop_585:
	brnz,pt	%g1,	loop_586
loop_586:
	nop

	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 3:
!
!	Type l   	: 24
!	Type a   	: 18
!	Type x   	: 6
!	Type cti   	: 145
!	Type f   	: 147
!	Type i   	: 160
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
	set	0x3,	%g2
	set	0x6,	%g3
	set	0x0,	%g4
	set	0xC,	%g5
	set	0xE,	%g6
	set	0xA,	%g7
	!# Input registers
	set	-0x8,	%i0
	set	-0xC,	%i1
	set	-0x5,	%i2
	set	-0x8,	%i3
	set	-0xF,	%i4
	set	-0x8,	%i5
	set	-0xF,	%i6
	set	-0x3,	%i7
	!# Local registers
	set	0x38DF0B30,	%l0
	set	0x5AA9E8C4,	%l1
	set	0x16F74997,	%l2
	set	0x0C290440,	%l3
	set	0x4ADB0661,	%l4
	set	0x05E405C0,	%l5
	set	0x4EDAF6F7,	%l6
	!# Output registers
	set	0x067D,	%o0
	set	0x0C08,	%o1
	set	-0x17AD,	%o2
	set	0x0B7C,	%o3
	set	0x0CDA,	%o4
	set	0x0287,	%o5
	set	0x1E93,	%o6
	set	-0x00F1,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0xD523630FDD061F8B)
	INIT_TH_FP_REG(%l7,%f2,0xAE0CDD1D39273890)
	INIT_TH_FP_REG(%l7,%f4,0xEA6C9FE21A53F8CA)
	INIT_TH_FP_REG(%l7,%f6,0xE96E6C657E02C71B)
	INIT_TH_FP_REG(%l7,%f8,0xFB09BCEC42A88D3F)
	INIT_TH_FP_REG(%l7,%f10,0x34A9A3AAA8FAD540)
	INIT_TH_FP_REG(%l7,%f12,0x0AF9C80D0A157C13)
	INIT_TH_FP_REG(%l7,%f14,0x70D050BFAA949054)
	INIT_TH_FP_REG(%l7,%f16,0x64C2D9F7783E696B)
	INIT_TH_FP_REG(%l7,%f18,0x53EE6B281353063D)
	INIT_TH_FP_REG(%l7,%f20,0x92269AD949643F8D)
	INIT_TH_FP_REG(%l7,%f22,0x9F25609CD5C02745)
	INIT_TH_FP_REG(%l7,%f24,0x7C2B8BE5FE50BC3F)
	INIT_TH_FP_REG(%l7,%f26,0xA8F8ABCD4B791C0D)
	INIT_TH_FP_REG(%l7,%f28,0x7D3EC69CA2CCFD4E)
	INIT_TH_FP_REG(%l7,%f30,0x542D35F2E88B05C0)

	!# Execute Main Diag ..

	fcmpne16	%f14,	%f8,	%o4
	call	loop_587
	edge8ln	%i1,	%i0,	%g6
	call	loop_588
	xorcc	%g2,	0x1F70,	%l2
loop_587:
	fone	%f28
	udivx	%g7,	0x00,	%o2
loop_588:
	movue	%fcc1,	%i4,	%l3
	or	%l1,	0x039B,	%l5
	rd	%ccr,	%o1
	tcc	%icc,	0x0
	mulscc	%i2,	%i6,	%l4
	fmovsge	%xcc,	%f7,	%f21
	fmul8x16al	%f15,	%f20,	%f0
	fmovdl	%fcc1,	%f10,	%f20
	fbo,a	%fcc0,	loop_589
	call	loop_590
	call	loop_591
	subcc	%i7,	%o7,	%o5
loop_589:
	fpadd16	%f8,	%f10,	%f28
loop_590:
	ba,a	%xcc,	loop_592
loop_591:
	rd	%sys_tick_cmpr,	%o3
	movg	%xcc,	0x53F,	%i3
	fcmpeq16	%f30,	%f30,	%g3
loop_592:
	array8	%l0,	%g4,	%o0
	call	loop_593
	call	loop_594
	fmovdvs	%icc,	%f8,	%f26
	alignaddr	%i5,	%l6,	%g5
loop_593:
	sdivx	%g1,	%o4,	%o6
loop_594:
	stx	%fsr,	[%l7 + 0x48]
	call	loop_595
	fands	%f9,	%f25,	%f1
	fmovsue	%fcc3,	%f9,	%f15
	call	loop_596
loop_595:
	fpack32	%f16,	%f22,	%f20
	add	%l7,	0x30,	%l6
	wr	%g0,	0x10,	%asi
	ldxa	[%l6] %asi,	%i1
	casxa	[%l6] 0x10,	%i1,	%g6
loop_596:
	movcc	%xcc,	0x03C,	%g2
	flushw
	fpsub16	%f4,	%f30,	%f24
	set	0x70, %l3
	stxa	%i0,	[%l7 + %l3] 0xea
	membar	#Sync
	addccc	%g7,	%l2,	%i4
	call	loop_597
	call	loop_598
	smulcc	%l3,	0x04DF,	%o2
	movrne	%l1,	0x108,	%o1
loop_597:
	movneg	%icc,	%l5,	%i6
loop_598:
	fmovscc	%icc,	%f6,	%f12
	fnors	%f4,	%f23,	%f2
	srlx	%l4,	0x10,	%i2
	call	loop_599
	orcc	%i7,	%o7,	%o5
	fmovdg	%fcc0,	%f0,	%f22
	fmovdneg	%xcc,	%f26,	%f2
loop_599:
	movu	%fcc0,	%o3,	%i3
	sir	0x1A3B
	ldsb	[%l7 + 0x16],	%g3
	fcmple16	%f4,	%f14,	%l0
	xorcc	%o0,	%i5,	%g4
	movgu	%xcc,	0x404,	%g5
	rd	%fprs,	%g1
	fmovdvc	%icc,	%f10,	%f8
	stb	%o4,	[%l7 + 0x1C]
	tn	%xcc,	0x7
	call	loop_600
	call	loop_601
	fbn,pn	%fcc0,	loop_602
	brz,a	%o6,	loop_603
loop_600:
	fmovdleu	%icc,	%f0,	%f10
loop_601:
	call	loop_604
loop_602:
	call	loop_605
loop_603:
	fmovduge	%fcc2,	%f10,	%f4
	call	loop_606
loop_604:
	fcmpd	%fcc1,	%f20,	%f4
loop_605:
	tsubcctv	%i1,	0x0FAE,	%l6
	wrpr	%g2,	%g6,	%cwp
loop_606:
	call	loop_607
	nop
	fitod	%f2,	%f8
	fdtos	%f8,	%f0
	movrlz	%i0,	0x306,	%g7
	call	loop_608
loop_607:
	membar	0x54
	set	0x218, %g7
	ldxa	[%g0 + %g7] 0x52,	%l2
loop_608:
	nop
	setx	0x0C80F12C,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f30
	setx	0xA34630BF,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f1
	fsubs	%f1,	%f30,	%f24
	fmovde	%xcc,	%f18,	%f30
	call	loop_609
	call	loop_610
	nop
	set	0x68, %o2
	lduh	[%l7 + %o2],	%i4
	fmovd	%f18,	%f0
loop_609:
	tsubcctv	%o2,	0x19BF,	%l1
loop_610:
	wrpr	%l3,	0x1217,	%cwp
	fmovso	%fcc2,	%f2,	%f4
	movrlz	%o1,	0x095,	%i6
	fornot1	%f8,	%f22,	%f0
	set	0x44, %o7
	lduha	[%l7 + %o7] 0x19,	%l5
	fmovdle	%fcc3,	%f22,	%f4
	orcc	%i2,	%l4,	%i7
	andcc	%o5,	%o7,	%i3
	call	loop_611
	addcc	%g3,	0x0842,	%l0
	fsrc1s	%f6,	%f2
	call	loop_612
loop_611:
	movrgz	%o0,	%i5,	%o3
	array16	%g5,	%g1,	%o4
	fmovdul	%fcc1,	%f28,	%f4
loop_612:
	fors	%f7,	%f28,	%f6
	rdpr	%otherwin,	%o6
	rdpr	%wstate,	%i1
	edge8l	%l6,	%g2,	%g6
	fmovdneg	%xcc,	%f18,	%f22
	movvs	%icc,	%i0,	%g4
	taddcctv	%l2,	%g7,	%i4
	fmovda	%xcc,	%f12,	%f6
	call	loop_613
	call	loop_614
	edge32	%o2,	%l3,	%l1
	fmovsleu	%xcc,	%f17,	%f9
loop_613:
	call	loop_615
loop_614:
	sethi	0x1540,	%o1
	fnot1s	%f5,	%f10
	tneg	%xcc,	0x4
loop_615:
	fornot1s	%f11,	%f18,	%f17
	call	loop_616
	movl	%icc,	0x6EB,	%i6
	xnor	%l5,	0x1868,	%i2
	nop
	fitos	%f1,	%f18
	fstod	%f18,	%f10
loop_616:
	sra	%l4,	0x12,	%i7
	srl	%o7,	0x14,	%i3
	set	0x50, %l0
	lda	[%l7 + %l0] 0x89,	%f26
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	nop
	setx	0xC793C95D,	%l0,	%l6
	st	%l6,	[%l7 + 0x64]
	ld	[%l7 + 0x64],	%fsr
	call	loop_617
	call	loop_618
	tle	%icc,	0x6
	call	loop_619
loop_617:
	popc	%g3,	%l0
loop_618:
	wr	%o0,	%o5,	%sys_tick
	fmovdg	%icc,	%f2,	%f10
loop_619:
	fmovdne	%icc,	%f14,	%f0
	fmovsle	%fcc0,	%f9,	%f20
	fmovd	%f24,	%f4
	nop
	set	0x0C, %g6
	flush	%l7 + %g6
	call	loop_620
	add	%i5,	0x1A93,	%o3
	edge16n	%g5,	%o4,	%g1
	fmovsul	%fcc3,	%f0,	%f12
loop_620:
	fmovrdlz	%i1,	%f16,	%f28
	sir	0x159F
	fcmpeq32	%f26,	%f10,	%l6
	edge32n	%o6,	%g2,	%i0
	call	loop_621
	tgu	%xcc,	0x4
	nop
	fitod	%f2,	%f24
	fdtos	%f24,	%f1
	tle	%icc,	0x7
loop_621:
	fmul8x16al	%f27,	%f12,	%f6
	call	loop_622
	call	loop_623
	bpos,pn	%icc,	loop_624
	fnors	%f29,	%f25,	%f31
loop_622:
	call	loop_625
loop_623:
	edge16	%g6,	%g4,	%g7
loop_624:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	fnot1	%f14,	%f22
loop_625:
	flushw

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x721, 	%hsys_tick_cmpr
	array16	%o2,	%o1,	%l1
	call	loop_626
	nop
	setx	0x55E7F910,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f14
	setx	0x6B0D9BF8,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f19
	fsubs	%f19,	%f14,	%f29
	call	loop_627
	edge32l	%l5,	%i2,	%i6
loop_626:
	fnors	%f7,	%f3,	%f13
	add	%i7,	0x042B,	%o7
loop_627:
	fbo,pn	%fcc2,	loop_628
	alignaddrl	%i3,	%g3,	%l0
	nop
	setx	0x72425411,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f12
	setx	0x7C5A565E,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f26
	fmuls	%f26,	%f12,	%f19
	fcmped	%fcc1,	%f4,	%f10
loop_628:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	call	loop_629
	fzero	%f6
	bshuffle	%f20,	%f4,	%f2
	call	loop_630
loop_629:
	nop
	setx	loop_631,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x001200001401,	%l0,	%l1
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
	fmovsg	%fcc1,	%f18,	%f24
	fpadd16s	%f14,	%f26,	%f7
loop_630:
	array32	%l4,	%o5,	%o3
loop_631:
	call	loop_632
	fmovsgu	%xcc,	%f13,	%f30
	tneg	%xcc,	0x0
	alignaddrl	%i5,	%g5,	%g1
loop_632:
	nop
	setx loop_633, %l0, %l1
	jmpl %l1, %i1
	ble,pt	%xcc,	loop_634
	call	loop_635
	add	%o4,	0x082D,	%l6
loop_633:
	fxnors	%f27,	%f30,	%f29
loop_634:
	fmovdlg	%fcc1,	%f28,	%f30
loop_635:
	call	loop_636
	stb	%o6,	[%l7 + 0x73]
	call	loop_637
	sllx	%i0,	%g2,	%g6
loop_636:
	wrpr	%g7,	%i4,	%cwp
	edge32ln	%l2,	%l3,	%o2
loop_637:
	tcc	%xcc,	0x3
	bneg,a	%xcc,	loop_638
	bneg,a,pt	%icc,	loop_639
	call	loop_640
	brlz,a,pt	%o1,	loop_641
loop_638:
	movgu	%xcc,	%g4,	%l1
loop_639:
	fmuld8ulx16	%f5,	%f31,	%f14
loop_640:
	tleu	%icc,	0x0
loop_641:
	alignaddrl	%i2,	%l5,	%i7
	fxnors	%f18,	%f5,	%f15
	call	loop_642
	movuge	%fcc0,	%i6,	%i3
	fcmple32	%f30,	%f12,	%g3
	fmovscs	%xcc,	%f2,	%f16
loop_642:
	st	%fsr,	[%l7 + 0x78]
	call	loop_643
	rdpr	%cwp,	%l0
	tcs	%xcc,	0x7
	tneg	%icc,	0x1
loop_643:
	nop
	fitos	%f7,	%f21
	fstox	%f21,	%f12
	fxtos	%f12,	%f12
	rdhpr	%hintp,	%o0
	rdpr	%tl,	%o7
	call	loop_644
	nop
	set	0x0B, %g2
	ldub	[%l7 + %g2],	%o5
	set	0x0A, %g3
	stha	%l4,	[%l7 + %g3] 0x23
	membar	#Sync
loop_644:
	nop
	add	%l7,	0x20,	%l6
	wr	%g0,	0x11,	%asi
	casxa	[%l6] %asi,	%o3,	%g5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	set	0x34, %l5
	lda	[%l7 + %l5] 0x88,	%f14
	fandnot2s	%f24,	%f12,	%f26
	call	loop_645
	call	loop_646
	stb	%i5,	[%l7 + 0x0A]
	nop
	fitod	%f2,	%f8
	fdtos	%f8,	%f20
loop_645:
	fmovse	%fcc2,	%f3,	%f9
loop_646:
	call	loop_647
	fmovdne	%icc,	%f4,	%f22
	call	loop_648
	edge8	%i1,	%l6,	%o4
loop_647:
	call	loop_649
	call	loop_650
loop_648:
	fmovrdgz	%i0,	%f10,	%f14
	edge32l	%o6,	%g2,	%g7
loop_649:
	movcs	%icc,	0x422,	%i4
loop_650:
	nop
	fitos	%f26,	%f9
	fornot1s	%f10,	%f14,	%f25
	brgz,a	%g6,	loop_651
	call	loop_652
	call	loop_653
	umulcc	%l3,	0x005D,	%o2
loop_651:
	brgez,a,pn	%o1,	loop_654
loop_652:
	nop
	fitos	%f0,	%f31
	fstoi	%f31,	%f16
loop_653:
	fnegd	%f6,	%f10
	fxnor	%f12,	%f0,	%f4
loop_654:
	umulcc	%g4,	%l2,	%l1
	fpmerge	%f11,	%f30,	%f16
	nop
	setx	0x8BF883A466245DEF,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0x235A00DBAE441CA6,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	fsubd	%f4,	%f8,	%f2
	call	loop_655
	fmovslg	%fcc1,	%f8,	%f31
	call	loop_656
	fornot1	%f30,	%f14,	%f14
loop_655:
	fmovsge	%icc,	%f8,	%f14
	bpos,a,pt	%xcc,	loop_657
loop_656:
	fmovsa	%icc,	%f9,	%f11
	call	loop_658
	ta	%icc,	0x2
loop_657:
	call	loop_659
	rd	%ccr,	%l5
loop_658:
	call	loop_660
	nop
	setx	0x8A86EF7B293FCBB5,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0xCFDEB6DFF011CEB3,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	fdivd	%f24,	%f10,	%f6
loop_659:
	nop
	setx	0x0AE30C06,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f31
	setx	0xF3F5C041,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f5
	fsubs	%f5,	%f31,	%f30
	fcmpeq16	%f24,	%f28,	%i2
loop_660:
	array8	%i7,	%i6,	%g3
	call	loop_661
	fmovsue	%fcc2,	%f23,	%f15
	umul	%i3,	%l0,	%o0
	edge8n	%o7,	%l4,	%o3
loop_661:
	fpadd32	%f4,	%f10,	%f6
	fnors	%f19,	%f29,	%f23
	sll	%g5,	%o5,	%g1
	subcc	%i5,	0x1B81,	%i1
	fnot2s	%f12,	%f11
	fand	%f6,	%f14,	%f26
	fmovda	%icc,	%f28,	%f10
	movlg	%fcc3,	%l6,	%o4
	call	loop_662
	siam	0x2
	nop
	fitos	%f28,	%f11
	ldx	[%l7 + 0x58],	%i0
loop_662:
	movvc	%icc,	0x3B1,	%o6
	call	loop_663
	movne	%fcc0,	%g7,	%g2
	movule	%fcc0,	0x735,	%i4
	rd	%fprs,	%g6
loop_663:
	fmovda	%xcc,	%f0,	%f22
	wrpr 	%g0, 	0x2, 	%gl
	fmovrslez	%o2,	%f30,	%f14
	flushw
	tneg	%icc,	0x7
	call	loop_664
	sir	0x12B2
	call	loop_665
	call	loop_666
loop_664:
	nop
	set	0x22, %l6
	stb	%o1,	[%l7 + %l6]
	call	loop_667
loop_665:
	fmovrdgez	%l2,	%f0,	%f2
loop_666:
	call	loop_668
	nop
	fitos	%f5,	%f26
	fstoi	%f26,	%f17
loop_667:
	call	loop_669
	call	loop_670
loop_668:
	or	%g4,	0x1C57,	%l1
	call	loop_671
loop_669:
	movrgz	%l5,	%i7,	%i6
loop_670:
	call	loop_672
	nop
	setx	0x633E5D4D,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f14
	fsqrts	%f14,	%f30
loop_671:
	call	loop_673
	call	loop_674
loop_672:
	nop
	fitos	%f3,	%f24
	fstod	%f24,	%f8
	umul	%g3,	%i2,	%l0
loop_673:
	pdist	%f26,	%f0,	%f4
loop_674:
	fmul8x16al	%f19,	%f22,	%f24
	subccc	%i3,	0x053C,	%o0
	call	loop_675
	orncc	%o7,	0x0D85,	%l4
	add	%l7,	0x78,	%l6
	wr	%g0,	0x04,	%asi
	casxa	[%l6] 0x04,	%o3,	%g5
loop_675:
	call	loop_676
	fmovsul	%fcc3,	%f24,	%f3
	fmovdlg	%fcc3,	%f0,	%f4
	movuge	%fcc0,	0x6D3,	%g1
loop_676:
	movrlz	%i5,	0x365,	%i1
	umul	%l6,	%o5,	%o4
	rdhpr	%ver,	%o6
	call	loop_677
	bshuffle	%f12,	%f26,	%f26
	sdivcc	%i0,	%g2,	%g7
	fmovsgu	%icc,	%f27,	%f20
loop_677:
	fmovscs	%icc,	%f15,	%f2
	call	loop_678
	fmovso	%fcc0,	%f3,	%f29
	call	loop_679
	tsubcc	%i4,	%l3,	%g6
loop_678:
	edge16l	%o2,	%o1,	%g4
	move	%fcc2,	%l2,	%l1
loop_679:
	tl	%icc,	0x4
	wr	%l5,	0x0DF2,	%y
	nop
	fitod	%f10,	%f0
	fdtoi	%f0,	%f16
	fmovsleu	%icc,	%f4,	%f14
	fpackfix	%f30,	%f25
	add	%l7,	0x60,	%l6
	wr	%g0,	0x11,	%asi
	casxa	[%l6] 0x11,	%i6,	%i7
	nop
	set	0x11, %o4
	stb	%i2,	[%l7 + %o4]
	fxors	%f12,	%f23,	%f25
	sdiv	%l0,	%g3,	%o0
	edge32ln	%o7,	%i3,	%o3
	tneg	%icc,	0x6
	sllx	%l4,	0x0E,	%g5
	call	loop_680
	fcmpeq32	%f26,	%f18,	%i5
	call	loop_681
	tl	%icc,	0x1
loop_680:
	call	loop_682
	tvc	%xcc,	0x6
loop_681:
	call	loop_683
	mulx	%g1,	0x02A2,	%l6
loop_682:
	fmovsug	%fcc1,	%f3,	%f0
	fbge,a,pn	%fcc0,	loop_684
loop_683:
	call	loop_685
	fmovsvs	%xcc,	%f28,	%f9
	fcmpeq16	%f10,	%f16,	%o5
loop_684:
	sdivcc	%i1,	%o6,	%i0
loop_685:
	fmuld8ulx16	%f16,	%f21,	%f14
	mulx	%o4,	0x1EB2,	%g2
	sllx	%i4,	0x0F,	%l3
	call	loop_686
	call	loop_687
	call	loop_688
	movlg	%fcc1,	0x756,	%g7
loop_686:
	nop
	fitod	%f31,	%f28
loop_687:
	call	loop_689
loop_688:
	call	loop_690
	call	loop_691
	wrpr	%g6,	0x15CA,	%cwp
loop_689:
	call	loop_692
loop_690:
	call	loop_693
loop_691:
	nop
	fitod	%f20,	%f10
	fsrc1s	%f12,	%f16
loop_692:
	call	loop_694
loop_693:
	nop
	setx	0x9DEB4CEFA446E46D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0x00155601,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	fsmuld	%f14,	%f2,	%f4
	movlg	%fcc2,	%o1,	%g4
	sra	%o2,	%l2,	%l5
loop_694:
	call	loop_695
	fmuld8ulx16	%f21,	%f25,	%f16
	fmul8x16au	%f3,	%f12,	%f0
	taddcctv	%l1,	%i7,	%i6
loop_695:
	brgz,a	%i2,	loop_696
	fzeros	%f24
	call	loop_697
	bn,a,pt	%icc,	loop_698
loop_696:
	call	loop_699
	tvc	%xcc,	0x7
loop_697:
	rd	%softint,	%l0
loop_698:
	movleu	%icc,	%g3,	%o0
loop_699:
	call	loop_700
	call	loop_701
	rdhpr	%hsys_tick_cmpr,	%o7
	sethi	0x0BF6,	%o3
loop_700:
	array16	%i3,	%g5,	%l4
loop_701:
	movu	%fcc2,	%i5,	%g1
	ba,a	%icc,	loop_702
	edge16l	%o5,	%i1,	%o6
	ta	%icc,	0x7
	movpos	%icc,	%l6,	%i0
loop_702:
	ba,pn	%icc,	loop_703
	fmovdu	%fcc3,	%f26,	%f10
	fsrc2	%f24,	%f0
	fone	%f30
loop_703:
	movcs	%xcc,	%g2,	%i4
	movvs	%icc,	%l3,	%o4
	sdiv	%g6,	0x00,	%g7
	movleu	%icc,	%g4,	%o1
	nop
	setx	0x46B2339F0303A247,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0xAFCC7950,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	fsmuld	%f6,	%f22,	%f26
	nop
	set	0x70, %i6
	ldd	[%l7 + %i6],	%f8
	fmovsuge	%fcc1,	%f12,	%f17
	call	loop_704
	fmovdg	%icc,	%f2,	%f14
	call	loop_705
	fnand	%f22,	%f18,	%f20
loop_704:
	fmovdg	%fcc0,	%f28,	%f16
	srlx	%l2,	0x0C,	%l5
loop_705:
	brz,a,pt	%l1,	loop_706
	tge	%xcc,	0x7
	fabss	%f10,	%f12
	call	loop_707
loop_706:
	call	loop_708
	nop
	fitos	%f11,	%f3
	fstox	%f3,	%f16
	fxtos	%f16,	%f17
	rdpr	%tba,	%o2
loop_707:
	sll	%i6,	%i2,	%l0
loop_708:
	call	loop_709
	fpsub32s	%f28,	%f23,	%f15
	fmovsne	%xcc,	%f12,	%f29
	call	loop_710
loop_709:
	call	loop_711
	nop
	fitod	%f4,	%f2
	fdtoi	%f2,	%f26
	fmovslg	%fcc2,	%f1,	%f8
loop_710:
	call	loop_712
loop_711:
	call	loop_713
	call	loop_714
	wr	%i7,	0x0842,	%softint
loop_712:
	fbl,pt	%fcc2,	loop_715
loop_713:
	mulx	%g3,	%o7,	%o3
loop_714:
	call	loop_716
	movcc	%icc,	0x487,	%i3
loop_715:
	or	%g5,	%o0,	%i5
	fmovsu	%fcc0,	%f12,	%f12
loop_716:
	call	loop_717
	rdpr	%canrestore,	%l4
	rdpr	%cwp,	%g1
	sdiv	%o5,	0x00,	%o6
loop_717:
	call	loop_718
	fmovdu	%fcc3,	%f30,	%f26
	ble,a	%xcc,	loop_719
	st	%fsr,	[%l7 + 0x74]
loop_718:
	edge32	%l6,	%i0,	%i1
	call	loop_720
loop_719:
	tgu	%icc,	0x6
	move	%xcc,	0x2D2,	%g2
	fors	%f6,	%f7,	%f31
loop_720:
	movre	%i4,	%o4,	%l3
	fmovrse	%g7,	%f10,	%f9
	fmovsgu	%xcc,	%f7,	%f26
	bmask	%g6,	%o1,	%l2
	call	loop_721
	call	loop_722
	call	loop_723
	call	loop_724
loop_721:
	edge32l	%l5,	%l1,	%g4
loop_722:
	fmovdn	%icc,	%f22,	%f2
loop_723:
	movvc	%icc,	%o2,	%i2
loop_724:
	fpadd16s	%f31,	%f22,	%f13
	taddcc	%l0,	%i7,	%i6
	call	loop_725
	rdpr	%otherwin,	%o7
	faligndata	%f30,	%f18,	%f0
	movg	%xcc,	0x0DC,	%o3
loop_725:
	call	loop_726
	movrgez	%i3,	%g3,	%g5
	movge	%icc,	0x5EB,	%i5
	call	loop_727
loop_726:
	call	loop_728
	wr	%o0,	%l4,	%y
	call	loop_729
loop_727:
	call	loop_730
loop_728:
	nop

loop_729:
	nop

loop_730:
	nop

	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 4:
!
!	Type l   	: 25
!	Type a   	: 30
!	Type x   	: 10
!	Type cti   	: 144
!	Type f   	: 143
!	Type i   	: 148
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
	set	0x7,	%g1
	set	0x9,	%g2
	set	0x9,	%g3
	set	0xA,	%g4
	set	0x7,	%g5
	set	0xB,	%g6
	set	0xA,	%g7
	!# Input registers
	set	-0x1,	%i0
	set	-0x0,	%i1
	set	-0x4,	%i2
	set	-0x3,	%i3
	set	-0x9,	%i4
	set	-0x9,	%i5
	set	-0xA,	%i6
	set	-0x9,	%i7
	!# Local registers
	set	0x7AAF3113,	%l0
	set	0x65051EB8,	%l1
	set	0x46E2DC8F,	%l2
	set	0x63A3018D,	%l3
	set	0x473A5C79,	%l4
	set	0x40C3BBA0,	%l5
	set	0x1AAC0B7B,	%l6
	!# Output registers
	set	-0x0096,	%o0
	set	0x0E4B,	%o1
	set	0x1441,	%o2
	set	0x19E1,	%o3
	set	-0x1062,	%o4
	set	0x0588,	%o5
	set	-0x1479,	%o6
	set	0x1DE0,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0xD523630FDD061F8B)
	INIT_TH_FP_REG(%l7,%f2,0xAE0CDD1D39273890)
	INIT_TH_FP_REG(%l7,%f4,0xEA6C9FE21A53F8CA)
	INIT_TH_FP_REG(%l7,%f6,0xE96E6C657E02C71B)
	INIT_TH_FP_REG(%l7,%f8,0xFB09BCEC42A88D3F)
	INIT_TH_FP_REG(%l7,%f10,0x34A9A3AAA8FAD540)
	INIT_TH_FP_REG(%l7,%f12,0x0AF9C80D0A157C13)
	INIT_TH_FP_REG(%l7,%f14,0x70D050BFAA949054)
	INIT_TH_FP_REG(%l7,%f16,0x64C2D9F7783E696B)
	INIT_TH_FP_REG(%l7,%f18,0x53EE6B281353063D)
	INIT_TH_FP_REG(%l7,%f20,0x92269AD949643F8D)
	INIT_TH_FP_REG(%l7,%f22,0x9F25609CD5C02745)
	INIT_TH_FP_REG(%l7,%f24,0x7C2B8BE5FE50BC3F)
	INIT_TH_FP_REG(%l7,%f26,0xA8F8ABCD4B791C0D)
	INIT_TH_FP_REG(%l7,%f28,0x7D3EC69CA2CCFD4E)
	INIT_TH_FP_REG(%l7,%f30,0x542D35F2E88B05C0)

	!# Execute Main Diag ..

	movleu	%xcc,	%g1,	%o5
	movg	%icc,	0x319,	%l6
	nop
	setx	0x81D4ED59,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f21
	fsqrts	%f21,	%f25
	fsrc1	%f2,	%f26
	call	loop_731
	movrgz	%i0,	0x2B1,	%o6
	fxors	%f13,	%f16,	%f13
	faligndata	%f26,	%f26,	%f24
loop_731:
	taddcc	%g2,	0x0940,	%i4
	st	%fsr,	[%l7 + 0x30]
	edge8n	%o4,	%i1,	%l3
	set	0x20, %l1
	ldswa	[%l7 + %l1] 0x04,	%g7
	fcmpgt32	%f12,	%f24,	%o1
	ba,pn	%icc,	loop_732
	tn	%xcc,	0x7
	nop
	fitos	%f8,	%f25
	call	loop_733
loop_732:
	call	loop_734
	rdpr	%canrestore,	%g6
	add	%l2,	0x0E84,	%l5
loop_733:
	fba,a	%fcc1,	loop_735
loop_734:
	array8	%l1,	%o2,	%g4
	fmovsa	%xcc,	%f7,	%f26
	edge16l	%i2,	%l0,	%i7
loop_735:
	call	loop_736
	brlz,pn	%o7,	loop_737
	fmovs	%f11,	%f0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_736:
	nop
	fitod	%f2,	%f12
	fdtoi	%f12,	%f19
loop_737:
	fpadd16s	%f4,	%f26,	%f6
	fnot2s	%f2,	%f24
	fmovsa	%fcc3,	%f28,	%f21
	xnorcc	%g3,	0x101B,	%i3
	call	loop_738
	sir	0x179B
	fandnot1	%f24,	%f30,	%f28
	call	loop_739
loop_738:
	movg	%fcc0,	0x356,	%i5
	bvs,a,pn	%xcc,	loop_740
	xor	%g5,	%o0,	%g1
loop_739:
	addcc	%l4,	0x095D,	%o5
	nop
	set	0x58, %i2
	ldd	[%l7 + %i2],	%i0
loop_740:
	fsrc2	%f16,	%f8
	wr	%l6,	0x123A,	%pic
	call	loop_741
	fmovrsgz	%g2,	%f19,	%f4
	fmovdne	%xcc,	%f26,	%f14
	fbuge	%fcc2,	loop_742
loop_741:
	edge32n	%i4,	%o6,	%o4
	bneg,pn	%xcc,	loop_743
	call	loop_744
loop_742:
	fmovdl	%fcc3,	%f16,	%f0
	wr	%g0,	0x80,	%asi
	stwa	%l3,	[%l7 + 0x58] %asi
loop_743:
	fxnors	%f28,	%f18,	%f28
loop_744:
	edge16l	%g7,	%o1,	%i1
	bleu	%icc,	loop_745
	nop
	fitos	%f10,	%f24
	fstoi	%f24,	%f19
	fpack16	%f4,	%f20
	call	loop_746
loop_745:
	call	loop_747
	array16	%l2,	%l5,	%l1
	call	loop_748
loop_746:
	andn	%g6,	0x1298,	%g4
loop_747:
	fmul8x16	%f10,	%f22,	%f28
	call	loop_749
loop_748:
	edge8l	%o2,	%i2,	%l0
	call	loop_750
	sllx	%o7,	%i7,	%i6
loop_749:
	bshuffle	%f20,	%f18,	%f26
	taddcc	%o3,	%i3,	%g3
loop_750:
	fnors	%f10,	%f21,	%f11
	xnor	%g5,	%i5,	%o0
	tg	%xcc,	0x2
	nop
	setx	0x9D4A8CDD,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f4
	fsqrts	%f4,	%f14
	fxnors	%f30,	%f9,	%f16
	call	loop_751
	fbug,pt	%fcc2,	loop_752
	nop
	setx loop_753, %l0, %l1
	jmpl %l1, %g1
	fbne,a,pn	%fcc0,	loop_754
loop_751:
	movrlz	%o5,	%l4,	%l6
loop_752:
	fmovsle	%xcc,	%f23,	%f30
loop_753:
	movu	%fcc3,	%i0,	%g2
loop_754:
	xnor	%i4,	%o4,	%o6
	fmovso	%fcc1,	%f25,	%f14
	edge32l	%l3,	%g7,	%o1
	call	loop_755
	ld	[%l7 + 0x58],	%f1
	smulcc	%i1,	%l2,	%l5
	call	loop_756
loop_755:
	fmovsge	%fcc0,	%f9,	%f2
	fmovsu	%fcc1,	%f18,	%f20
	ta	%icc,	0x3
loop_756:
	fandnot2	%f24,	%f2,	%f6
	movu	%fcc2,	%g6,	%g4
	fmovdvs	%xcc,	%f14,	%f0
	call	loop_757
	fmovrsgez	%o2,	%f29,	%f4
	nop
	fitod	%f12,	%f16
	fdtox	%f16,	%f10
	fxnors	%f6,	%f20,	%f16
loop_757:
	mulscc	%l1,	%l0,	%i2
	call	loop_758
	array8	%i7,	%i6,	%o3
	tleu	%icc,	0x1
	fmovrsne	%o7,	%f23,	%f13
loop_758:
	prefetch	[%l7 + 0x5C],	 1
	call	loop_759
	ta	%xcc,	0x3
	call	loop_760
	wrpr	%g3,	0x1833,	%pil
loop_759:
	bl,a	%xcc,	loop_761
	nop
	set	0x70, %o3
	std	%g4,	[%l7 + %o3]
loop_760:
	fcmple32	%f6,	%f2,	%i5
	bcs,a	%xcc,	loop_762
loop_761:
	call	loop_763
	nop
	fitos	%f12,	%f3
	fstoi	%f3,	%f10
	fmuld8sux16	%f24,	%f30,	%f12
loop_762:
	fmovdule	%fcc3,	%f22,	%f22
loop_763:
	wrpr	%i3,	0x0259,	%pil
	fmovsne	%fcc3,	%f4,	%f25
	movug	%fcc0,	0x7AF,	%o0
	call	loop_764
	call	loop_765
	call	loop_766
	edge16n	%o5,	%g1,	%l6
loop_764:
	edge8n	%i0,	%g2,	%i4
loop_765:
	fcmpgt32	%f20,	%f14,	%l4
loop_766:
	movneg	%xcc,	%o6,	%o4
	siam	0x0
	call	loop_767
	call	loop_768
	rd	%tick_cmpr,	%g7
	call	loop_769
loop_767:
	call	loop_770
loop_768:
	xnor	%o1,	%l3,	%l2
	call	loop_771
loop_769:
	addc	%i1,	%l5,	%g6
loop_770:
	mulx	%g4,	0x0DAF,	%o2
	membar	0x49
loop_771:
	movo	%fcc3,	%l0,	%l1
	bmask	%i2,	%i7,	%i6
	fmovrdne	%o7,	%f30,	%f12
	fmovrslez	%g3,	%f12,	%f28
	fnand	%f24,	%f12,	%f20
	bg,a,pt	%icc,	loop_772
	movcc	%xcc,	0x7F7,	%o3
	smulcc	%i5,	0x0AE3,	%g5
	fmovdge	%fcc3,	%f4,	%f30
loop_772:
	call	loop_773
	call	loop_774
	call	loop_775
	call	loop_776
loop_773:
	mova	%icc,	%o0,	%o5
loop_774:
	call	loop_777
loop_775:
	fmovsn	%fcc1,	%f23,	%f9
loop_776:
	fornot1s	%f13,	%f17,	%f20
	fone	%f24
loop_777:
	fpadd16	%f26,	%f6,	%f6
	set	0x28, %i5
	stwa	%g1,	[%l7 + %i5] 0x2a
	membar	#Sync

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x471, 	%tick_cmpr
	fmovrdne	%g2,	%f12,	%f30
	fpsub16	%f28,	%f22,	%f14
	fexpand	%f4,	%f6
	call	loop_778
	move	%icc,	0x6AB,	%i4
	fexpand	%f20,	%f6
	tn	%icc,	0x2
loop_778:
	umul	%i0,	%o6,	%o4
	umulcc	%g7,	%l4,	%l3
	sdiv	%l2,	%o1,	%i1
	tpos	%icc,	0x7
	fxor	%f12,	%f10,	%f0
	tne	%xcc,	0x7
	call	loop_779
	fcmps	%fcc0,	%f27,	%f12
	nop
	setx	0x7CDFE3C2,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f1
	setx	0xB6D3EFA9,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f6
	fadds	%f6,	%f1,	%f7
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
loop_779:
	addcc	%g6,	0x0A16,	%g4
	call	loop_780
	fand	%f18,	%f14,	%f2
	fcmpgt32	%f14,	%f20,	%l5
	fcmple16	%f0,	%f0,	%o2
loop_780:
	udiv	%l0,	%i2,	%i7
	fmovrdlez	%i6,	%f18,	%f20
	fzero	%f28
	call	loop_781
	call	loop_782
	tsubcc	%l1,	0x15D4,	%g3
	call	loop_783
loop_781:
	fmovrslez	%o7,	%f21,	%f20
loop_782:
	xor	%o3,	0x01D8,	%g5
	rdhpr	%hintp,	%i5
loop_783:
	movcs	%xcc,	%o0,	%o5
	movu	%fcc3,	0x567,	%i3
	fmovd	%f26,	%f4
	wr	%l6,	%g1,	%softint
	nop
	fitos	%f3,	%f5
	fstox	%f5,	%f0
	fxtos	%f0,	%f13
	popc	0x1434,	%g2
	call	loop_784
	call	loop_785
	edge16	%i4,	%o6,	%i0
	call	loop_786
loop_784:
	fpack32	%f14,	%f4,	%f0
loop_785:
	edge16	%g7,	%l4,	%l3
	addccc	%o4,	0x00EE,	%l2
loop_786:
	faligndata	%f0,	%f14,	%f26
	prefetch	[%l7 + 0x40],	 1
	call	loop_787
	brlz,a	%i1,	loop_788
	nop
	setx loop_789, %l0, %l1
	jmpl %l1, %o1
	call	loop_790
loop_787:
	fmovrdlez	%g4,	%f6,	%f8
loop_788:
	fxors	%f30,	%f20,	%f25
loop_789:
	fmovsg	%fcc1,	%f30,	%f17
loop_790:
	call	loop_791
	movu	%fcc0,	%l5,	%o2
	call	loop_792
	call	loop_793
loop_791:
	fnors	%f1,	%f23,	%f7
	fmuld8sux16	%f3,	%f9,	%f16
loop_792:
	nop
	setx	0x432E0AB061224B7A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0x1C2ECDCE,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	fsmuld	%f22,	%f30,	%f2
loop_793:
	fnand	%f10,	%f14,	%f14
	nop
	fitos	%f10,	%f11
	fstox	%f11,	%f8
	fxtos	%f8,	%f17
	fzero	%f8
	call	loop_794
	fba,pn	%fcc3,	loop_795
	call	loop_796
	sdivcc	%g6,	0x00,	%l0
loop_794:
	call	loop_797
loop_795:
	taddcctv	%i7,	%i6,	%l1
loop_796:
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	nop
	fitos	%f7,	%f9
	fstox	%f9,	%f18
	fxtos	%f18,	%f18
loop_797:
	call	loop_798
	rdpr	%tba,	%i2
	call	loop_799
	call	loop_800
loop_798:
	fexpand	%f2,	%f24
	sll	%g3,	%o7,	%g5
loop_799:
	call	loop_801
loop_800:
	andn	%i5,	0x1F72,	%o3
	mulscc	%o0,	0x165C,	%i3
	fxors	%f26,	%f5,	%f23
loop_801:
	edge32ln	%l6,	%o5,	%g2
	call	loop_802
	fnands	%f27,	%f15,	%f8
	wr	%g0,	0x19,	%asi
	swapa	[%l7 + 0x64] %asi,	%g1
loop_802:
	fmovrslez	%o6,	%f14,	%f27
	andn	%i4,	0x1C10,	%i0
	membar	0x5D
	call	loop_803
	call	loop_804
	edge16n	%l4,	%l3,	%o4
	movrgz	%l2,	0x2DB,	%i1
loop_803:
	fmovdu	%fcc3,	%f14,	%f18
loop_804:
	fpsub32	%f16,	%f12,	%f28
	array16	%o1,	%g4,	%l5
	call	loop_805
	edge32ln	%o2,	%g7,	%l0
	fmovsgu	%icc,	%f18,	%f14
	movleu	%icc,	%i7,	%i6
loop_805:
	movn	%xcc,	0x2FD,	%g6
	call	loop_806
	rdpr	%wstate,	%l1
	movo	%fcc3,	0x039,	%g3
	mulscc	%o7,	0x1857,	%g5
loop_806:
	call	loop_807
	smul	%i2,	0x0C35,	%i5
	call	loop_808
	call	loop_809
loop_807:
	movlg	%fcc0,	%o3,	%o0
	call	loop_810
loop_808:
	mova	%icc,	%i3,	%o5
loop_809:
	nop
	setx	0x3A07C551C28FB1B5,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0xA5C748E7AA6EB94B,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	fmuld	%f2,	%f0,	%f18
	sethi	0x0DCF,	%g2
loop_810:
	fmovsgu	%xcc,	%f0,	%f19
	sdivcc	%g1,	0x00,	%l6
	tcs	%icc,	0x1
	fmovdpos	%xcc,	%f16,	%f12
	fornot1	%f16,	%f16,	%f24
	wrpr	%o6,	%i0,	%cwp
	call	loop_811
	movleu	%xcc,	%l4,	%i4
	subc	%l3,	%l2,	%i1
	fpadd16	%f6,	%f16,	%f8
loop_811:
	movl	%icc,	0x0DD,	%o1
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	call	loop_812
	fcmps	%fcc0,	%f23,	%f9
	call	loop_813
	add	%o4,	0x1647,	%l5
loop_812:
	fmovso	%fcc0,	%f17,	%f11
	tg	%xcc,	0x4
loop_813:
	alignaddr	%g4,	%g7,	%o2
	call	loop_814
	nop
	set	0x64, %i3
	swap	[%l7 + %i3],	%l0
	siam	0x2
	wr 	%g0, 	0x6, 	%fprs
loop_814:
	rdhpr	%htba,	%i6
	fmovde	%fcc0,	%f24,	%f26
	edge16	%l1,	%g3,	%o7
	movue	%fcc2,	0x5D6,	%g5
	fmul8sux16	%f8,	%f22,	%f20
	call	loop_815
	fpadd16	%f26,	%f30,	%f16

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fmovrdgz	%g6,	%f8,	%f0
loop_815:
	fmovd	%f22,	%f18
	fmovda	%fcc1,	%f6,	%f28
	fmovdleu	%xcc,	%f12,	%f30
	call	loop_816
	ta	%xcc,	0x3
	call	loop_817
	umulcc	%i5,	0x06EF,	%o3
loop_816:
	nop
	fitos	%f4,	%f14
	fstox	%f14,	%f16
	fpackfix	%f6,	%f25
loop_817:
	udivx	%i3,	%o5,	%o0
	fmovde	%fcc3,	%f24,	%f8
	sdivcc	%g1,	0x00,	%l6
	fbg	%fcc3,	loop_818
	movle	%xcc,	0x0EF,	%o6
	brgz,pn	%i0,	loop_819
	taddcctv	%l4,	%i4,	%l3
loop_818:
	add	%l2,	%g2,	%i1
	fmovsu	%fcc2,	%f1,	%f9
loop_819:
	call	loop_820
	taddcctv	%o4,	%o1,	%g4
	smul	%l5,	0x0934,	%g7
	alignaddrl	%l0,	%o2,	%i6
loop_820:
	call	loop_821
	nop
	fitos	%f4,	%f9
	fstox	%f9,	%f20
	fxtos	%f20,	%f26
	fmovsne	%icc,	%f25,	%f3
	tpos	%xcc,	0x1
loop_821:
	call	loop_822
	call	loop_823
	fcmpne32	%f28,	%f8,	%l1
	fmul8x16al	%f22,	%f4,	%f8
loop_822:
	nop
	fitod	%f2,	%f20
	fdtos	%f20,	%f4
loop_823:
	fcmpeq32	%f6,	%f22,	%g3
	std	%f8,	[%l7 + 0x58]
	fands	%f3,	%f5,	%f17
	fors	%f12,	%f15,	%f11
	wrpr	%o7,	%g5,	%tick
	bmask	%i7,	%i2,	%g6
	fpack16	%f20,	%f21
	fsrc2	%f20,	%f28
	fornot2s	%f21,	%f15,	%f1
	fnor	%f26,	%f10,	%f28
	nop
	setx	loop_824,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x011400001403,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fmovda	%xcc,	%f4,	%f12

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	tvc	%icc,	0x4
loop_824:
	tge	%icc,	0x6
	call	loop_825
	fornot2s	%f27,	%f20,	%f29
	set	0x10, %i4
	lda	[%l7 + %i4] 0x0c,	%f28
loop_825:
	call	loop_826
	edge32n	%o3,	%i3,	%o0
	movre	%g1,	%o5,	%o6
	call	loop_827
loop_826:
	call	loop_828
	fone	%f4
	mulx	%l6,	%i0,	%i4
loop_827:
	call	loop_829
loop_828:
	fmovdgu	%icc,	%f2,	%f8
	orcc	%l4,	%l3,	%g2
	faligndata	%f24,	%f20,	%f10
loop_829:
	call	loop_830
	fpmerge	%f5,	%f17,	%f22
	call	loop_831
	tg	%icc,	0x0
loop_830:
	wr	%l2,	%i1,	%y
	fpackfix	%f12,	%f12
loop_831:
	call	loop_832
	call	loop_833
	nop
	setx	loop_834,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x024200001405,	%l0,	%l1
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
	edge32	%o4,	%g4,	%o1
loop_832:
	fpadd16	%f22,	%f16,	%f14
loop_833:
	move	%fcc3,	0x5E2,	%l5
loop_834:
	movue	%fcc0,	%l0,	%g7
	andcc	%i6,	0x0A48,	%l1
	brlez,pt	%g3,	loop_835
	nop
	setx	0xE4E19D375DA95769,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0xD0BC8BCD127E5FC9,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	fsubd	%f14,	%f6,	%f22
	fmuld8ulx16	%f29,	%f30,	%f8
	call	loop_836
loop_835:
	bneg,pt	%icc,	loop_837
	edge32	%o7,	%o2,	%i7
	fnot2s	%f7,	%f17
loop_836:
	call	loop_838
loop_837:
	movvc	%xcc,	%g5,	%g6
	fmovrdgez	%i2,	%f2,	%f8
	fzero	%f22
loop_838:
	smul	%i5,	%o3,	%i3
	edge16l	%o0,	%g1,	%o6
	fsrc1	%f24,	%f20
	wr	%g0,	0x89,	%asi
	swapa	[%l7 + 0x30] %asi,	%l6
	call	loop_839
	call	loop_840
	fnot1s	%f11,	%f7
	call	loop_841
loop_839:
	call	loop_842
loop_840:
	fmovrdgz	%i0,	%f2,	%f10
	fbn,pt	%fcc2,	loop_843
loop_841:
	fzero	%f30
loop_842:
	fcmpgt32	%f20,	%f0,	%i4
	call	loop_844
loop_843:
	call	loop_845
	wr	%o5,	%l3,	%clear_softint
	nop
	setx	0x9598F8247BD1582D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0x9DC00C7CF1498BB2,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	fsubd	%f30,	%f10,	%f8
loop_844:
	bgu	%icc,	loop_846
loop_845:
	sub	%l4,	0x047C,	%l2
	fxor	%f0,	%f18,	%f2
	call	loop_847
loop_846:
	std	%f0,	[%l7 + 0x20]
	call	loop_848
	nop
	fitod	%f12,	%f20
	fdtoi	%f20,	%f23
loop_847:
	tcc	%icc,	0x5
	movcs	%icc,	0x226,	%i1
loop_848:
	nop
	fitod	%f2,	%f14
	call	loop_849
	call	loop_850
	movge	%fcc2,	%g2,	%g4
	fmovdne	%xcc,	%f4,	%f0
loop_849:
	nop
	fitos	%f1,	%f11
	fstox	%f11,	%f10
	fxtos	%f10,	%f6
loop_850:
	tpos	%xcc,	0x1
	call	loop_851
	fsrc1s	%f1,	%f28
	wrpr 	%g0, 	0x1, 	%gl
	fmovde	%icc,	%f12,	%f6
loop_851:
	wr	%l0,	%l5,	%set_softint
	rdpr	%wstate,	%g7
	call	loop_852
	fmovsvs	%xcc,	%f30,	%f5
	array32	%i6,	%g3,	%o7
	call	loop_853
loop_852:
	fmovde	%xcc,	%f6,	%f0
	call	loop_854
	fnand	%f26,	%f26,	%f30
loop_853:
	nop
	set	0x48, %o0
	stx	%fsr,	[%l7 + %o0]
	fbue	%fcc1,	loop_855
loop_854:
	movn	%fcc1,	%o2,	%i7
	movue	%fcc0,	0x76A,	%l1
	fmovdn	%xcc,	%f20,	%f18
loop_855:
	fmovdneg	%icc,	%f8,	%f22
	call	loop_856
	call	loop_857
	movuge	%fcc3,	%g6,	%i2
	rdhpr	%hintp,	%i5
loop_856:
	call	loop_858
loop_857:
	bge,a	%icc,	loop_859
	call	loop_860
	udivcc	%o3,	0x00,	%i3
loop_858:
	call	loop_861
loop_859:
	call	loop_862
loop_860:
	nop
	fitod	%f6,	%f10
	fdtox	%f10,	%f0
	call	loop_863
loop_861:
	fmovsu	%fcc0,	%f22,	%f3
loop_862:
	addcc	%o0,	%g1,	%o6
	movug	%fcc3,	0x603,	%l6
loop_863:
	call	loop_864
	fmovspos	%icc,	%f5,	%f23
	fpmerge	%f31,	%f5,	%f10
	fbo	%fcc2,	loop_865
loop_864:
	fmovrslz	%i0,	%f6,	%f31
	andncc	%i4,	0x0DAB,	%o5
	siam	0x7
loop_865:
	call	loop_866
	call	loop_867
	movug	%fcc0,	%g5,	%l4
	fbge	%fcc2,	loop_868
loop_866:
	edge16l	%l2,	%l3,	%i1
loop_867:
	call	loop_869
	sra	%g2,	0x1F,	%g4
loop_868:
	srl	%o1,	0x11,	%o4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xC6A, 	%hsys_tick_cmpr
loop_869:
	call	loop_870
	call	loop_871
	fmovsul	%fcc2,	%f10,	%f20
	add	%l7,	0x18,	%l6
	wr	%g0,	0x0c,	%asi
	casa	[%l6] 0x0c,	%g7,	%l0
loop_870:
	fmovda	%icc,	%f16,	%f8
loop_871:
	fnors	%f28,	%f19,	%f14
	fmovscs	%xcc,	%f16,	%f3
	fcmpeq16	%f16,	%f0,	%g3
	fmovsvc	%xcc,	%f29,	%f4
	fabsd	%f2,	%f20
	tsubcctv	%o7,	0x1EB4,	%o2
	brnz,a,pt	%i7,	loop_872
	edge8ln	%i6,	%l1,	%g6
	call	loop_873
	fmul8x16	%f27,	%f8,	%f30
loop_872:
	movvs	%xcc,	%i5,	%i2
	tgu	%icc,	0x3
loop_873:
	nop
	setx	0x0A60484D,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f3
	setx	0xDAA93F7F,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f7
	fsubs	%f7,	%f3,	%f18
	membar	0x53
	nop
	fitod	%f4,	%f0
	fdtoi	%f0,	%f14
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 5:
!
!	Type l   	: 17
!	Type a   	: 24
!	Type x   	: 7
!	Type cti   	: 143
!	Type f   	: 162
!	Type i   	: 147
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
	set	0x0,	%g1
	set	0xF,	%g2
	set	0xB,	%g3
	set	0x1,	%g4
	set	0x5,	%g5
	set	0x5,	%g6
	set	0x6,	%g7
	!# Input registers
	set	-0xE,	%i0
	set	-0x4,	%i1
	set	-0x5,	%i2
	set	-0xA,	%i3
	set	-0xA,	%i4
	set	-0xD,	%i5
	set	-0x0,	%i6
	set	-0xE,	%i7
	!# Local registers
	set	0x580D105C,	%l0
	set	0x217FD4D3,	%l1
	set	0x1724D2B6,	%l2
	set	0x37749775,	%l3
	set	0x3DDEF297,	%l4
	set	0x6E0393DF,	%l5
	set	0x30F40056,	%l6
	!# Output registers
	set	-0x00D0,	%o0
	set	-0x0624,	%o1
	set	0x1B8D,	%o2
	set	-0x16E1,	%o3
	set	0x0A7E,	%o4
	set	0x0852,	%o5
	set	-0x1913,	%o6
	set	0x1E76,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0xD523630FDD061F8B)
	INIT_TH_FP_REG(%l7,%f2,0xAE0CDD1D39273890)
	INIT_TH_FP_REG(%l7,%f4,0xEA6C9FE21A53F8CA)
	INIT_TH_FP_REG(%l7,%f6,0xE96E6C657E02C71B)
	INIT_TH_FP_REG(%l7,%f8,0xFB09BCEC42A88D3F)
	INIT_TH_FP_REG(%l7,%f10,0x34A9A3AAA8FAD540)
	INIT_TH_FP_REG(%l7,%f12,0x0AF9C80D0A157C13)
	INIT_TH_FP_REG(%l7,%f14,0x70D050BFAA949054)
	INIT_TH_FP_REG(%l7,%f16,0x64C2D9F7783E696B)
	INIT_TH_FP_REG(%l7,%f18,0x53EE6B281353063D)
	INIT_TH_FP_REG(%l7,%f20,0x92269AD949643F8D)
	INIT_TH_FP_REG(%l7,%f22,0x9F25609CD5C02745)
	INIT_TH_FP_REG(%l7,%f24,0x7C2B8BE5FE50BC3F)
	INIT_TH_FP_REG(%l7,%f26,0xA8F8ABCD4B791C0D)
	INIT_TH_FP_REG(%l7,%f28,0x7D3EC69CA2CCFD4E)
	INIT_TH_FP_REG(%l7,%f30,0x542D35F2E88B05C0)

	!# Execute Main Diag ..

	call	loop_874
	array16	%o3,	%i3,	%g1
	call	loop_875
	fmovsug	%fcc3,	%f17,	%f8
loop_874:
	smul	%o6,	0x1E4A,	%o0
	ldstub	[%l7 + 0x66],	%i0
loop_875:
	nop
	setx	0x6574817DF97C82ED,	%l0,	%l6
	stx	%l6,	[%l7 + 0x20]
	ldx	[%l7 + 0x20],	%fsr
	call	loop_876
	fmul8x16	%f7,	%f16,	%f20
	fnors	%f23,	%f22,	%f26
	call	loop_877
loop_876:
	fabss	%f27,	%f24
	fpsub16s	%f11,	%f24,	%f17
	fmovsa	%icc,	%f29,	%f18
loop_877:
	edge16	%l6,	%o5,	%g5
	call	loop_878
	edge32n	%l4,	%i4,	%l2
	call	loop_879
	rd	%ccr,	%i1
loop_878:
	fmovscc	%icc,	%f19,	%f29
	fpmerge	%f29,	%f15,	%f10
loop_879:
	call	loop_880
	fpadd32	%f26,	%f14,	%f0
	wr	%l3,	0x0F67,	%clear_softint
	fmovsgu	%xcc,	%f25,	%f19
loop_880:
	fmovdvc	%xcc,	%f8,	%f6
	sdivcc	%g4,	0x00,	%o1
	fnand	%f22,	%f10,	%f30
	call	loop_881
	rdpr	%cwp,	%o4
	fpsub16	%f14,	%f22,	%f10
	nop
	setx	0xA4AF926A935EDE86,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0x2DDAAE8BD28FB54B,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	fsubd	%f26,	%f8,	%f30
loop_881:
	tg	%icc,	0x6
	call	loop_882
	call	loop_883
	call	loop_884
	fpsub32	%f0,	%f8,	%f6
loop_882:
	fnegd	%f24,	%f16
loop_883:
	call	loop_885
loop_884:
	rd	%sys_tick_cmpr,	%l5
	fble	%fcc0,	loop_886
	xnorcc	%g7,	0x0BA7,	%l0
loop_885:
	fmovslg	%fcc1,	%f28,	%f19
	fbe,pt	%fcc1,	loop_887
loop_886:
	siam	0x1
	call	loop_888
	call	loop_889
loop_887:
	fmovsgu	%xcc,	%f23,	%f8
	fpack16	%f30,	%f30
loop_888:
	sdiv	%g3,	0x00,	%g2
loop_889:
	ldsb	[%l7 + 0x46],	%o7
	call	loop_890
	movl	%icc,	%i7,	%i6
	fornot2s	%f9,	%f14,	%f18
	call	loop_891
loop_890:
	bmask	%l1,	%g6,	%o2
	flushw
	call	loop_892
loop_891:
	call	loop_893
	fmovrde	%i5,	%f28,	%f18
	fands	%f28,	%f29,	%f24
loop_892:
	call	loop_894
loop_893:
	call	loop_895
	fpsub16s	%f22,	%f20,	%f6
	fxors	%f0,	%f23,	%f10
loop_894:
	bmask	%i2,	%i3,	%g1
loop_895:
	fpackfix	%f16,	%f30
	nop
	fitos	%f2,	%f25
	fstox	%f25,	%f30
	fxtos	%f30,	%f13
	nop
	setx	0xE6A571A9,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f17
	setx	0x99CD4339,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f10
	fsubs	%f10,	%f17,	%f1
	call	loop_896
	bvc,a	%xcc,	loop_897
	call	loop_898
	swap	[%l7 + 0x6C],	%o3
loop_896:
	fxnors	%f6,	%f16,	%f20
loop_897:
	call	loop_899
loop_898:
	fzero	%f6
	tle	%xcc,	0x2
	fmovsgu	%icc,	%f7,	%f28
loop_899:
	rdpr	%cansave,	%o6
	nop
	setx	0xD1E559CE,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f12
	setx	0xE66C5AB8,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f19
	fadds	%f19,	%f12,	%f13
	call	loop_900
	sdivcc	%o0,	%l6,	%o5
	fcmpd	%fcc1,	%f6,	%f14
	nop
	set	0x3C, %g5
	lduw	[%l7 + %g5],	%i0
loop_900:
	movrne	%g5,	0x34A,	%i4
	fmovrslez	%l4,	%f9,	%f23
	wr	%g0,	0x89,	%asi
	ldstuba	[%l7 + 0x0A] %asi,	%i1
	for	%f16,	%f24,	%f6
	bcc	%xcc,	loop_901
	andn	%l3,	0x0D9A,	%l2
	fandnot1	%f24,	%f30,	%f8
	subcc	%g4,	0x0C72,	%o4
loop_901:
	tle	%xcc,	0x4
	rdpr	%pil,	%o1
	call	loop_902
	fmovsvc	%xcc,	%f27,	%f14
	call	loop_903
	fandnot1	%f30,	%f6,	%f8
loop_902:
	for	%f20,	%f6,	%f22
	nop
	setx	0x5581BFBCAA730824,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	fsqrtd	%f8,	%f2
loop_903:
	movpos	%xcc,	0x046,	%g7
	bge,a	%icc,	loop_904
	call	loop_905
	call	loop_906
	array32	%l5,	%l0,	%g3
loop_904:
	nop
	setx	loop_907,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x014200001406,	%l0,	%l1
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
loop_905:
	nop
	setx	0xCBE724B5,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f7
	setx	0xEC541E84,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f9
	fadds	%f9,	%f7,	%f11
loop_906:
	movre	%g2,	0x21E,	%o7
	call	loop_908
loop_907:
	sdivx	%i6,	0x00,	%i7
	array32	%g6,	%l1,	%i5
	tneg	%xcc,	0x6
loop_908:
	nop
	set	0x40, %i7
	stda	%f16,	[%l7 + %i7] 0xc0
	fornot2	%f12,	%f4,	%f2
	rdpr	%pil,	%i2
	call	loop_909
	movle	%xcc,	%i3,	%g1
	brlz,pt	%o3,	loop_910
	call	loop_911
loop_909:
	alignaddr	%o6,	%o0,	%o2
	movre	%o5,	0x38D,	%i0
loop_910:
	movvs	%icc,	%l6,	%g5
loop_911:
	fmovspos	%xcc,	%f18,	%f22
	fnot2	%f8,	%f2
	brlz,a,pt	%i4,	loop_912
	call	loop_913
	call	loop_914
	call	loop_915
loop_912:
	nop
	setx	0xE88BB159,	%l0,	%l6
	st	%l6,	[%l7 + 0x74]
	ld	[%l7 + 0x74],	%fsr
loop_913:
	movrlz	%i1,	%l4,	%l2
loop_914:
	fbl,a	%fcc3,	loop_916
loop_915:
	udivx	%g4,	0x00,	%l3
	call	loop_917
	fmovscs	%icc,	%f31,	%f3
loop_916:
	brz,a,pt	%o4,	loop_918
	bneg,pt	%xcc,	loop_919
loop_917:
	tgu	%icc,	0x0
	call	loop_920
loop_918:
	ldd	[%l7 + 0x20],	%f24
loop_919:
	andcc	%o1,	0x0A8B,	%l5
	call	loop_921
loop_920:
	fpackfix	%f12,	%f28
	movge	%xcc,	%g7,	%g3
	fnot1	%f18,	%f4
loop_921:
	tg	%icc,	0x1
	rd	%softint,	%l0
	fnegs	%f21,	%f14
	call	loop_922
	rdhpr	%htba,	%g2
	call	loop_923
	tg	%xcc,	0x7
loop_922:
	addcc	%i6,	0x0391,	%o7
	edge16n	%g6,	%i7,	%i5
loop_923:
	udivcc	%l1,	0x00,	%i3
	call	loop_924
	fsrc2	%f4,	%f2
	fmuld8ulx16	%f10,	%f4,	%f30
	nop
	fitod	%f6,	%f16
	fdtox	%f16,	%f20
	fxtod	%f20,	%f2
loop_924:
	movug	%fcc3,	%i2,	%o3
	fand	%f10,	%f28,	%f30

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xBAF, 	%sys_tick_cmpr
	siam	0x0
	brlz,a,pt	%o6,	loop_925
	fbg,pn	%fcc0,	loop_926
	alignaddrl	%o2,	%i0,	%l6
	fxor	%f6,	%f6,	%f8
loop_925:
	nop
	fitod	%f20,	%f24
loop_926:
	nop
	setx	0xF7851334,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f6
	setx	0x9A0F9924,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f11
	fadds	%f11,	%f6,	%f20
	fmovdvs	%icc,	%f14,	%f26
	call	loop_927
	call	loop_928
	call	loop_929
	movrne	%o5,	0x1A2,	%g5
loop_927:
	sir	0x0A53
loop_928:
	fnegd	%f16,	%f28
loop_929:
	nop
	setx	0xD27A2369C02830B2,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0xBDAC2035BFAC0DBF,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	fsubd	%f4,	%f20,	%f22
	call	loop_930
	movle	%fcc1,	0x231,	%i4
	fnegs	%f31,	%f14
	movrgz	%i1,	%l4,	%l2
loop_930:
	fmovslg	%fcc0,	%f23,	%f21
	lduh	[%l7 + 0x6A],	%g4
	fmovsug	%fcc1,	%f24,	%f17
	fabss	%f5,	%f10
	fxors	%f29,	%f7,	%f28
	tleu	%xcc,	0x1
	call	loop_931
	fornot2s	%f2,	%f26,	%f8
	membar	0x20
	movl	%fcc3,	0x144,	%l3
loop_931:
	tpos	%xcc,	0x6
	call	loop_932
	call	loop_933
	fmovdvs	%icc,	%f6,	%f28
	bg	%icc,	loop_934
loop_932:
	call	loop_935
loop_933:
	call	loop_936
	call	loop_937
loop_934:
	rd	%fprs,	%o1
loop_935:
	array16	%o4,	%g7,	%l5
loop_936:
	fandnot2s	%f17,	%f24,	%f19
loop_937:
	fmovrdgez	%l0,	%f18,	%f2
	call	loop_938
	bmask	%g3,	%g2,	%o7
	fmovscs	%xcc,	%f6,	%f28
	call	loop_939
loop_938:
	taddcctv	%g6,	%i6,	%i7
	fnands	%f1,	%f22,	%f29
	call	loop_940
loop_939:
	bvs,a	%xcc,	loop_941
	call	loop_942
	fmovsg	%icc,	%f5,	%f12
loop_940:
	nop
	fitod	%f8,	%f4
	fdtoi	%f4,	%f10
loop_941:
	wr	%i5,	0x00B3,	%pic
loop_942:
	tsubcc	%i3,	0x0754,	%i2
	call	loop_943
	fmovsneg	%icc,	%f7,	%f9
	fmovdlg	%fcc3,	%f6,	%f22
	fmovrdgez	%l1,	%f0,	%f12
loop_943:
	fmovd	%f24,	%f4
	bleu,a	%icc,	loop_944
	call	loop_945
	tcc	%xcc,	0x4
	fmovrdgz	%g1,	%f2,	%f30
loop_944:
	edge32n	%o3,	%o6,	%o0
loop_945:
	nop
	set	0x7C, %l4
	lda	[%l7 + %l4] 0x19,	%f8
	tl	%xcc,	0x4
	call	loop_946
	movvc	%xcc,	%i0,	%l6
	sra	%o2,	%o5,	%i4
	fpadd16s	%f26,	%f13,	%f26
loop_946:
	call	loop_947
	wr	%g5,	%i1,	%softint
	call	loop_948
	call	loop_949
loop_947:
	umul	%l4,	0x04EF,	%g4
	fnand	%f14,	%f30,	%f20
loop_948:
	call	loop_950
loop_949:
	fpackfix	%f10,	%f29
	fmovdcc	%icc,	%f18,	%f12
	rdhpr	%htba,	%l3
loop_950:
	tgu	%xcc,	0x2
	nop
	fitos	%f6,	%f14
	fstoi	%f14,	%f23
	or	%o1,	0x1845,	%o4
	rdpr	%canrestore,	%l2
	udivcc	%l5,	%g7,	%g3
	fmovsvc	%xcc,	%f5,	%f5
	fmul8ulx16	%f4,	%f10,	%f24
	sdivx	%l0,	0x00,	%g2
	call	loop_951
	call	loop_952
	smul	%g6,	0x0B58,	%o7
	call	loop_953
loop_951:
	nop
	setx	0x86D5663BD79321E5,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	fsqrtd	%f8,	%f4
loop_952:
	sllx	%i6,	0x14,	%i7
	nop
	set	0x26, %g1
	ldub	[%l7 + %g1],	%i3
loop_953:
	call	loop_954
	call	loop_955
	edge8l	%i5,	%i2,	%g1
	fbe,pt	%fcc1,	loop_956
loop_954:
	call	loop_957
loop_955:
	array32	%o3,	%l1,	%o0
	call	loop_958
loop_956:
	fandnot1s	%f15,	%f3,	%f27
loop_957:
	fmovrsgz	%i0,	%f31,	%f28
	fmovdn	%xcc,	%f10,	%f24
loop_958:
	wrpr	%l6,	%o6,	%cwp
	movcc	%xcc,	%o2,	%o5
	edge8l	%g5,	%i4,	%l4
	call	loop_959
	call	loop_960
	fmovdcc	%icc,	%f8,	%f14
	rdhpr	%hpstate,	%g4
loop_959:
	nop
	fitos	%f14,	%f4
	fstoi	%f4,	%f29
loop_960:
	srax	%l3,	%o1,	%o4
	edge32	%i1,	%l5,	%g7
	call	loop_961
	nop
	set	0x78, %i0
	std	%l2,	[%l7 + %i0]
	call	loop_962
	edge16l	%l0,	%g2,	%g6
loop_961:
	fmuld8ulx16	%f28,	%f18,	%f20
	xorcc	%o7,	0x0EA1,	%i6
loop_962:
	fmul8x16	%f20,	%f22,	%f28
	rdhpr	%hpstate,	%g3
	nop
	fitod	%f8,	%f14
	fdtox	%f14,	%f24
	fxtod	%f24,	%f28
	nop
	setx	0x021C12169560718D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	fsqrtd	%f8,	%f20
	movneg	%xcc,	%i7,	%i3
	fpadd16s	%f27,	%f7,	%f28
	orcc	%i5,	%i2,	%g1
	nop
	fitos	%f0,	%f22
	fstod	%f22,	%f30
	tge	%icc,	0x5
	call	loop_963
	rdpr	%cwp,	%l1
	fnot1	%f18,	%f14
	call	loop_964
loop_963:
	array32	%o3,	%i0,	%o0
	call	loop_965
	fbue,a,pn	%fcc2,	loop_966
loop_964:
	fmovrsgez	%l6,	%f19,	%f8
	bshuffle	%f14,	%f22,	%f30
loop_965:
	nop
	fitos	%f6,	%f9
	fstoi	%f9,	%f21
loop_966:
	call	loop_967
	tne	%icc,	0x7
	fmovdn	%icc,	%f6,	%f20
	fnot1s	%f2,	%f7
loop_967:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x77E, 	%sys_tick_cmpr
	movcs	%icc,	%o5,	%g5
	call	loop_968
	andcc	%i4,	%g4,	%l3
	fbne,a,pt	%fcc3,	loop_969
	and	%o1,	%l4,	%o4
loop_968:
	movre	%i1,	0x3EB,	%l5
	subc	%g7,	%l2,	%l0
loop_969:
	subcc	%g6,	0x18FD,	%o7
	fnot2	%f2,	%f28
	fandnot2	%f0,	%f6,	%f14
	nop
	setx	0x9A01B54A21AE2490,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0x15AEA9A9A03E774E,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	fsubd	%f26,	%f6,	%f22
	nop
	set	0x68, %o6
	flush	%l7 + %o6
	call	loop_970
	call	loop_971
	call	loop_972
	call	loop_973
loop_970:
	wr	%i6,	0x175B,	%set_softint
loop_971:
	fnegd	%f12,	%f18
loop_972:
	bg,pn	%icc,	loop_974
loop_973:
	call	loop_975
	call	loop_976
	fandnot2	%f0,	%f28,	%f10
loop_974:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_975:
	call	loop_977
loop_976:
	nop
	setx	0x4A9A599F2309C443,	%l0,	%l6
	stx	%l6,	[%l7 + 0x38]
	ldx	[%l7 + 0x38],	%fsr
	brlez,pt	%i7,	loop_978
	fabsd	%f18,	%f10
loop_977:
	ba,pn	%icc,	loop_979
	nop
	fitos	%f0,	%f19
	fstox	%f19,	%f30
loop_978:
	subccc	%i3,	%i2,	%i5
	fmovdvc	%icc,	%f0,	%f20
loop_979:
	tn	%xcc,	0x4
	alignaddr	%g1,	%l1,	%o3
	rd	%fprs,	%o0
	call	loop_980
	fmovsue	%fcc0,	%f3,	%f2
	fmovrdgez	%i0,	%f2,	%f28
	fmovsule	%fcc0,	%f26,	%f23
loop_980:
	call	loop_981
	movneg	%xcc,	%l6,	%o6
	udivcc	%o5,	0x00,	%g5
	rd	%pc,	%i4
loop_981:
	fbo,a,pt	%fcc1,	loop_982
	fmovdgu	%icc,	%f8,	%f14
	orcc	%o2,	%g4,	%o1
	fpsub32	%f28,	%f26,	%f16
loop_982:
	sra	%l4,	0x03,	%o4
	fmovd	%f18,	%f12
	fmovsue	%fcc3,	%f18,	%f15
	nop
	fitos	%f11,	%f23
	fstoi	%f23,	%f2
	for	%f6,	%f4,	%f30
	call	loop_983
	movne	%fcc0,	%i1,	%l3
	fsrc2s	%f4,	%f25
	movcs	%icc,	%g7,	%l2
loop_983:
	fmovdneg	%xcc,	%f0,	%f0
	std	%l4,	[%l7 + 0x78]
	orn	%g6,	0x11F0,	%l0
	nop
	setx	0x452F3343,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f10
	setx	0xBAB11F82,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f23
	fadds	%f23,	%f10,	%f7
	fmovdcc	%icc,	%f8,	%f20
	movcc	%xcc,	0x1DE,	%i6
	tneg	%icc,	0x5
	add	%l7,	0x10,	%l6
	wr	%g0,	0x18,	%asi
	ldxa	[%l6] %asi,	%g3
	casxa	[%l6] %asi,	%g3,	%o7
	fmovda	%fcc0,	%f24,	%f16
	umulcc	%i7,	0x0916,	%g2
	fmovrslez	%i3,	%f7,	%f9
	movrlz	%i2,	%i5,	%l1
	st	%f23,	[%l7 + 0x24]
	udivcc	%o3,	0x00,	%o0
	sub	%i0,	%l6,	%g1
	fbn,a,pt	%fcc2,	loop_984
	fmovrslez	%o5,	%f19,	%f24
	call	loop_985
	call	loop_986
loop_984:
	movule	%fcc3,	%g5,	%o6
	call	loop_987
loop_985:
	rd	%asi,	%i4
loop_986:
	nop
	setx	0xE10289FB,	%l0,	%l6
	st	%l6,	[%l7 + 0x6C]
	ld	[%l7 + 0x6C],	%fsr
	fnot1	%f6,	%f2
loop_987:
	andn	%o2,	%o1,	%g4
	fmovdne	%icc,	%f24,	%f20
	call	loop_988
	tcs	%xcc,	0x7
	call	loop_989
	rd	%pc,	%l4
loop_988:
	movlg	%fcc2,	%i1,	%l3
	fmovdleu	%xcc,	%f26,	%f28
loop_989:
	tgu	%xcc,	0x2
	tsubcctv	%o4,	%g7,	%l2
	movcs	%icc,	%g6,	%l5
	fcmpeq16	%f24,	%f16,	%l0
	call	loop_990
	fzero	%f28
	fmovrse	%i6,	%f11,	%f1
	fmovsleu	%xcc,	%f6,	%f18
loop_990:
	mulx	%g3,	0x0BF0,	%i7
	call	loop_991
	rdhpr	%htba,	%o7
	fandnot1s	%f20,	%f1,	%f1
	movne	%xcc,	0x73D,	%g2
loop_991:
	call	loop_992
	call	loop_993
	taddcctv	%i2,	%i3,	%l1
	fbo,a,pt	%fcc1,	loop_994
loop_992:
	fbu	%fcc3,	loop_995
loop_993:
	nop
	setx	0x387575A4AA83021B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	fsqrtd	%f24,	%f0
	nop
	fitos	%f10,	%f25
	fstoi	%f25,	%f3
loop_994:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xB02, 	%hsys_tick_cmpr
loop_995:
	rd	%asi,	%i0
	nop
	set	0x08, %o5
	lduw	[%l7 + %o5],	%o0
	call	loop_996
	call	loop_997
	srl	%l6,	%g1,	%g5
	fmovsu	%fcc3,	%f29,	%f15
loop_996:
	fmovsug	%fcc0,	%f5,	%f21
loop_997:
	nop
	setx	loop_998,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x002200001402,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	faligndata	%f28,	%f2,	%f0
	nop
	setx	0xE7FD68F1D6134C3D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0xB2BC3F288960643E,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	faddd	%f14,	%f10,	%f4
	ldsb	[%l7 + 0x77],	%o6
loop_998:
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	call	loop_999
	call	loop_1000
	srlx	%i4,	%o5,	%o1
	xnor	%o2,	%l4,	%i1
loop_999:
	call	loop_1001
loop_1000:
	brz,a,pt	%g4,	loop_1002
	call	loop_1003
	fnot1s	%f15,	%f31
loop_1001:
	fmovdcs	%xcc,	%f12,	%f20
loop_1002:
	smulcc	%o4,	0x0F75,	%g7
loop_1003:
	fmovsgu	%icc,	%f13,	%f9
	fmovsuge	%fcc2,	%f28,	%f6
	call	loop_1004
	call	loop_1005
	nop
	set	0x4C, %i1
	stw	%l3,	[%l7 + %i1]
	fsrc2s	%f17,	%f24
loop_1004:
	call	loop_1006
loop_1005:
	call	loop_1007
	stbar
	tge	%icc,	0x1
loop_1006:
	nop
	fitod	%f6,	%f12
	fdtox	%f12,	%f16
	fxtod	%f16,	%f26
loop_1007:
	fmovd	%f16,	%f2
	subc	%l2,	0x148A,	%g6
	fmovso	%fcc0,	%f18,	%f10
	fbge,a	%fcc3,	loop_1008
	movvs	%icc,	0x6FB,	%l0
	orcc	%i6,	0x11E6,	%g3
	call	loop_1009
loop_1008:
	movule	%fcc0,	%l5,	%o7
	brnz,a	%i7,	loop_1010
	call	loop_1011
loop_1009:
	edge32	%g2,	%i2,	%i3
	fmovdgu	%xcc,	%f14,	%f2
loop_1010:
	array8	%l1,	%o3,	%i5
loop_1011:
	call	loop_1012
	fmovdgu	%icc,	%f4,	%f20
	fcmpgt32	%f30,	%f26,	%o0
	set	0x22, %g4
	stba	%i0,	[%l7 + %g4] 0x88
loop_1012:
	nop
	setx	0xEEDA51EE,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f22
	setx	0x413A55E3,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f29
	fsubs	%f29,	%f22,	%f20
	fmovdul	%fcc3,	%f24,	%f30
	bpos,a	%xcc,	loop_1013
	call	loop_1014
	movu	%fcc1,	%l6,	%g1
	fones	%f24
loop_1013:
	andn	%g5,	0x1D18,	%o6
loop_1014:
	fbue,a	%fcc0,	loop_1015
	te	%xcc,	0x2
	fzero	%f14
	call	loop_1016
loop_1015:
	fxors	%f3,	%f27,	%f2
	rdhpr	%hpstate,	%i4
	call	loop_1017
loop_1016:
	call	loop_1018
	movl	%fcc1,	0x69C,	%o5
	fmovslg	%fcc3,	%f20,	%f6
loop_1017:
	call	loop_1019
loop_1018:
	call	loop_1020
	udiv	%o2,	%l4,	%i1
	sll	%o1,	%g4,	%o4
loop_1019:
	and	%l3,	%l2,	%g7
loop_1020:
	bshuffle	%f16,	%f24,	%f24
	call	loop_1021
	tn	%icc,	0x4
	movne	%icc,	0x545,	%l0
	faligndata	%f18,	%f14,	%f4
loop_1021:
	fmovsug	%fcc2,	%f0,	%f2
	brgez,a	%g6,	loop_1022
	fmovdl	%fcc1,	%f18,	%f30
	ldsb	[%l7 + 0x28],	%g3
loop_1022:
	nop

	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 6:
!
!	Type l   	: 25
!	Type a   	: 30
!	Type x   	: 5
!	Type cti   	: 149
!	Type f   	: 161
!	Type i   	: 130
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
	set	0x9,	%g2
	set	0x9,	%g3
	set	0x9,	%g4
	set	0x9,	%g5
	set	0x7,	%g6
	set	0xF,	%g7
	!# Input registers
	set	-0x2,	%i0
	set	-0x4,	%i1
	set	-0x8,	%i2
	set	-0x9,	%i3
	set	-0x9,	%i4
	set	-0xD,	%i5
	set	-0xA,	%i6
	set	-0x1,	%i7
	!# Local registers
	set	0x32816429,	%l0
	set	0x4A19FDF6,	%l1
	set	0x1ABA00BA,	%l2
	set	0x56529924,	%l3
	set	0x09C2F8F3,	%l4
	set	0x0E59601B,	%l5
	set	0x2994C844,	%l6
	!# Output registers
	set	0x08A4,	%o0
	set	-0x1D15,	%o1
	set	0x170E,	%o2
	set	0x0521,	%o3
	set	-0x0EE0,	%o4
	set	-0x1F28,	%o5
	set	0x0B1B,	%o6
	set	-0x0BF6,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0xD523630FDD061F8B)
	INIT_TH_FP_REG(%l7,%f2,0xAE0CDD1D39273890)
	INIT_TH_FP_REG(%l7,%f4,0xEA6C9FE21A53F8CA)
	INIT_TH_FP_REG(%l7,%f6,0xE96E6C657E02C71B)
	INIT_TH_FP_REG(%l7,%f8,0xFB09BCEC42A88D3F)
	INIT_TH_FP_REG(%l7,%f10,0x34A9A3AAA8FAD540)
	INIT_TH_FP_REG(%l7,%f12,0x0AF9C80D0A157C13)
	INIT_TH_FP_REG(%l7,%f14,0x70D050BFAA949054)
	INIT_TH_FP_REG(%l7,%f16,0x64C2D9F7783E696B)
	INIT_TH_FP_REG(%l7,%f18,0x53EE6B281353063D)
	INIT_TH_FP_REG(%l7,%f20,0x92269AD949643F8D)
	INIT_TH_FP_REG(%l7,%f22,0x9F25609CD5C02745)
	INIT_TH_FP_REG(%l7,%f24,0x7C2B8BE5FE50BC3F)
	INIT_TH_FP_REG(%l7,%f26,0xA8F8ABCD4B791C0D)
	INIT_TH_FP_REG(%l7,%f28,0x7D3EC69CA2CCFD4E)
	INIT_TH_FP_REG(%l7,%f30,0x542D35F2E88B05C0)

	!# Execute Main Diag ..

	call	loop_1023
	rd	%tick_cmpr,	%i6
	call	loop_1024
	te	%xcc,	0x4
loop_1023:
	call	loop_1025
	nop
	setx	0x5D1919CA41D15F39,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0x808732ECD97C2615,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	fsubd	%f26,	%f26,	%f28
loop_1024:
	fpackfix	%f4,	%f11
	srax	%l5,	%o7,	%g2
loop_1025:
	move	%xcc,	0x57E,	%i7
	call	loop_1026
	srax	%i3,	%l1,	%o3
	call	loop_1027
	call	loop_1028
loop_1026:
	call	loop_1029
	fmovdul	%fcc3,	%f22,	%f0
loop_1027:
	call	loop_1030
loop_1028:
	rdpr	%cansave,	%i2
loop_1029:
	rdpr	%cwp,	%o0
	wr	%g0,	0x04,	%asi
	lduba	[%l7 + 0x3C] %asi,	%i5
loop_1030:
	fmovdule	%fcc2,	%f12,	%f22
	call	loop_1031
	call	loop_1032
	fmovsuge	%fcc0,	%f26,	%f5
	fmovsgu	%xcc,	%f9,	%f9
loop_1031:
	fmovrse	%i0,	%f7,	%f12
loop_1032:
	call	loop_1033
	sdiv	%l6,	0x00,	%g5
	sdiv	%g1,	%o6,	%o5
	call	loop_1034
loop_1033:
	fmovrslz	%i4,	%f12,	%f12
	movre	%l4,	0x037,	%i1
	set	0x40, %o1
	swapa	[%l7 + %o1] 0x04,	%o1
loop_1034:
	fmovrdne	%g4,	%f8,	%f8
	set	0x60, %l3
	ldsba	[%l7 + %l3] 0x19,	%o2
	membar	#Sync
	set	0x40, %l2
	ldda	[%l7 + %l2] 0x1f,	%f16
	fmovdlg	%fcc3,	%f16,	%f2
	nop
	fitod	%f6,	%f28
	fdtox	%f28,	%f30
	movug	%fcc1,	%o4,	%l2
	call	loop_1035
	fmuld8sux16	%f10,	%f7,	%f22
	sir	0x0916
	call	loop_1036
loop_1035:
	st	%fsr,	[%l7 + 0x68]
	movlg	%fcc3,	0x34E,	%l3
	rdpr	%cansave,	%l0
loop_1036:
	fmovse	%fcc3,	%f14,	%f22
	nop
	setx	0x7E63DFEC3C300FC3,	%l0,	%l6
	stx	%l6,	[%l7 + 0x60]
	ldx	[%l7 + 0x60],	%fsr
	movgu	%icc,	%g6,	%g3
	ble	%xcc,	loop_1037
	fbuge,a,pn	%fcc2,	loop_1038
	rdhpr	%hsys_tick_cmpr,	%g7
	edge16	%l5,	%o7,	%i6
loop_1037:
	fmul8ulx16	%f30,	%f22,	%f0
loop_1038:
	nop
	fitos	%f16,	%f24
	orncc	%g2,	%i7,	%i3
	fbuge,a,pn	%fcc0,	loop_1039
	call	loop_1040
	rdhpr	%hsys_tick_cmpr,	%o3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x3F2, 	%hsys_tick_cmpr
loop_1039:
	movcs	%icc,	%o0,	%i5
loop_1040:
	call	loop_1041
	bgu,a,pn	%icc,	loop_1042
	call	loop_1043
	fmovscc	%icc,	%f25,	%f13
loop_1041:
	xnorcc	%l6,	%i0,	%g5
loop_1042:
	fmovdleu	%icc,	%f24,	%f28
loop_1043:
	rd	%y,	%o6
	movrgz	%g1,	0x3E1,	%o5
	fors	%f23,	%f9,	%f21
	movlg	%fcc3,	%l4,	%i4
	movvc	%icc,	%i1,	%o1
	nop
	fitos	%f4,	%f19
	fstox	%f19,	%f30
	fxtos	%f30,	%f23
	call	loop_1044
	andcc	%g4,	%o2,	%l2
	smul	%o4,	%l3,	%g6
	fmovsne	%xcc,	%f28,	%f8
loop_1044:
	nop
	fitod	%f12,	%f28
	fdtos	%f28,	%f31
	fpsub32s	%f31,	%f31,	%f29
	set	0x0, %o2
	stxa	%l0,	[%g0 + %o2] 0x4f
	call	loop_1045
	tsubcctv	%g7,	0x0885,	%g3
	ta	%icc,	0x4
	membar	0x36
loop_1045:
	fmovdcs	%icc,	%f20,	%f28
	fnor	%f26,	%f0,	%f16
	membar	0x0B
	tsubcctv	%l5,	0x034D,	%o7
	tcs	%icc,	0x7
	call	loop_1046
	addccc	%i6,	%g2,	%i7
	edge16n	%o3,	%l1,	%i3
	call	loop_1047
loop_1046:
	call	loop_1048
	call	loop_1049
	movrlz	%o0,	0x330,	%i5
loop_1047:
	call	loop_1050
loop_1048:
	nop
	fitod	%f8,	%f30
	fdtos	%f30,	%f16
loop_1049:
	nop
	add	%l7,	0x30,	%l6
	wr	%g0,	0x0c,	%asi
	casa	[%l6] %asi,	%l6,	%i2
loop_1050:
	call	loop_1051
	call	loop_1052
	addcc	%g5,	%i0,	%g1
	fzero	%f2
loop_1051:
	call	loop_1053
loop_1052:
	rdpr	%gl,	%o5
	fmovse	%xcc,	%f28,	%f11
	tleu	%xcc,	0x1
loop_1053:
	fmul8x16al	%f15,	%f21,	%f0
	rdhpr	%hintp,	%o6
	rdpr	%otherwin,	%i4
	fands	%f27,	%f12,	%f7
	nop
	set	0x6C, %o7
	ldsw	[%l7 + %o7],	%l4
	bmask	%i1,	%g4,	%o1
	xor	%l2,	0x0A2A,	%o2
	orncc	%o4,	0x13D1,	%g6
	call	loop_1054
	nop
	fitod	%f12,	%f16
	fdtoi	%f16,	%f6
	call	loop_1055
	fxor	%f8,	%f4,	%f30
loop_1054:
	tcs	%xcc,	0x3
	fxnors	%f11,	%f11,	%f1
loop_1055:
	fmovdneg	%icc,	%f4,	%f24
	call	loop_1056
	call	loop_1057
	edge8	%l3,	%g7,	%g3
	pdist	%f16,	%f28,	%f14
loop_1056:
	call	loop_1058
loop_1057:
	fmovdg	%icc,	%f22,	%f30
	fandnot1s	%f11,	%f18,	%f0
	srax	%l5,	0x04,	%l0
loop_1058:
	fmul8ulx16	%f30,	%f16,	%f30
	taddcctv	%o7,	0x105F,	%i6
	call	loop_1059
	fmovrdlez	%g2,	%f8,	%f6
	nop
	setx	0x33749476,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f2
	setx	0x20B4CC31,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f19
	fsubs	%f19,	%f2,	%f7
	call	loop_1060
loop_1059:
	call	loop_1061
	fmovsgu	%xcc,	%f17,	%f10
	bvc	%icc,	loop_1062
loop_1060:
	fxors	%f19,	%f13,	%f2
loop_1061:
	edge8l	%i7,	%l1,	%o3
	tn	%icc,	0x0
loop_1062:
	call	loop_1063
	fandnot1s	%f13,	%f22,	%f17
	alignaddrl	%o0,	%i5,	%l6
	fmovda	%icc,	%f18,	%f2
loop_1063:
	rdpr	%pil,	%i3
	fpack16	%f16,	%f13
	fnor	%f24,	%f22,	%f0
	sll	%g5,	%i0,	%i2
	call	loop_1064
	fmovdcc	%xcc,	%f26,	%f24
	movu	%fcc2,	0x1D5,	%o5
	subcc	%o6,	%g1,	%i4
loop_1064:
	brgez,a	%i1,	loop_1065
	call	loop_1066
	fmovdcs	%xcc,	%f20,	%f24
	call	loop_1067
loop_1065:
	call	loop_1068
loop_1066:
	rd	%asi,	%l4
	fmovscs	%xcc,	%f11,	%f31
loop_1067:
	movge	%fcc3,	%o1,	%l2
loop_1068:
	tcs	%icc,	0x1
	nop
	set	0x20, %l0
	stw	%g4,	[%l7 + %l0]
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	call	loop_1069
	brgz	%o2,	loop_1070
	array32	%g6,	%l3,	%o4
	edge32	%g7,	%g3,	%l5
loop_1069:
	call	loop_1071
loop_1070:
	bne	%icc,	loop_1072
	fmovdg	%fcc2,	%f10,	%f10
	and	%o7,	%l0,	%g2
loop_1071:
	rdhpr	%hintp,	%i7
loop_1072:
	xnor	%l1,	%o3,	%i6
	fnor	%f20,	%f22,	%f6
	call	loop_1073
	nop
	fitod	%f0,	%f28
	fdtoi	%f28,	%f9
	sdivcc	%o0,	0x00,	%l6
	fblg,pt	%fcc0,	loop_1074
loop_1073:
	ba,a	%icc,	loop_1075
	orcc	%i3,	%g5,	%i5
	fblg	%fcc3,	loop_1076
loop_1074:
	fcmpes	%fcc0,	%f13,	%f2
loop_1075:
	bge,a,pt	%xcc,	loop_1077
	fbne	%fcc3,	loop_1078
loop_1076:
	sir	0x1A04
	fmovsule	%fcc3,	%f9,	%f20
loop_1077:
	nop
	setx	0xE262247C15AA70A0,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0x5FA32D476667ECFE,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	fsubd	%f10,	%f14,	%f22
loop_1078:
	nop
	setx	0xBF64FBFFB2607860,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0x811AEE20929E02FC,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	faddd	%f6,	%f22,	%f14
	set	0x08, %g6
	ldsha	[%l7 + %g6] 0x88,	%i2
	call	loop_1079
	call	loop_1080
	fmovdle	%xcc,	%f0,	%f14
	movuge	%fcc0,	0x151,	%o5
loop_1079:
	nop
	fitos	%f2,	%f25
	fstox	%f25,	%f8
loop_1080:
	or	%o6,	%g1,	%i4
	add	%l7,	0x50,	%l6
	wr	%g0,	0x0c,	%asi
	lda	[%l6] %asi,	%i1
	casa	[%l6] %asi,	%i1,	%l4
	bcc,a	%xcc,	loop_1081
	call	loop_1082
	fmovrsne	%o1,	%f25,	%f2
	fmovda	%fcc2,	%f20,	%f12
loop_1081:
	call	loop_1083
loop_1082:
	brgz	%i0,	loop_1084
	fcmpne16	%f6,	%f12,	%l2
	edge16n	%g4,	%g6,	%o2
loop_1083:
	fmovdvc	%icc,	%f10,	%f20
loop_1084:
	wrpr	%l3,	%g7,	%cwp
	fmovso	%fcc1,	%f23,	%f18
	call	loop_1085
	fpmerge	%f13,	%f2,	%f10
	call	loop_1086
	edge32l	%g3,	%l5,	%o4
loop_1085:
	fcmpgt32	%f8,	%f0,	%l0
	fsrc2s	%f11,	%f30
loop_1086:
	fmul8sux16	%f14,	%f6,	%f10
	fornot2	%f18,	%f30,	%f28
	array8	%o7,	%i7,	%l1
	tg	%xcc,	0x5
	wr	%g0,	0x10,	%asi
	ldxa	[%l7 + 0x08] %asi,	%g2
	call	loop_1087
	call	loop_1088
	fcmpne32	%f16,	%f8,	%o3
	movrne	%o0,	0x015,	%l6
loop_1087:
	fmovrdne	%i6,	%f2,	%f24
loop_1088:
	call	loop_1089
	call	loop_1090
	nop
	setx	0xDCA3ADCFA84F7B3D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0xAF2FCB82,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	fsmuld	%f8,	%f14,	%f10
	call	loop_1091
loop_1089:
	movl	%icc,	0x4BE,	%i3
loop_1090:
	fmovscs	%icc,	%f9,	%f11
	fmovsul	%fcc3,	%f8,	%f3
loop_1091:
	fsrc2	%f16,	%f14
	fmovsl	%icc,	%f24,	%f13
	or	%i5,	%i2,	%o5
	call	loop_1092
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	set	0x6E, %g7
	lduha	[%l7 + %g7] 0x04,	%g5
loop_1092:
	fmovrsgez	%o6,	%f2,	%f22
	rd	%softint,	%i4
	nop
	setx	0x62D8A030,	%l0,	%l6
	st	%l6,	[%l7 + 0x48]
	ld	[%l7 + 0x48],	%fsr
	popc	%g1,	%l4
	fbne,a	%fcc2,	loop_1093
	movcs	%icc,	%o1,	%i1
	fnands	%f7,	%f5,	%f9
	call	loop_1094
loop_1093:
	add	%i0,	0x013D,	%l2
	call	loop_1095
	nop
	set	0x42, %g3
	sth	%g4,	[%l7 + %g3]
loop_1094:
	rdpr	%tl,	%o2
	fnot1	%f0,	%f14
loop_1095:
	call	loop_1096
	edge16	%g6,	%l3,	%g7
	mulscc	%g3,	%l5,	%l0
	bmask	%o4,	%o7,	%i7
loop_1096:
	fmovdule	%fcc3,	%f6,	%f28
	fmovrsgez	%g2,	%f9,	%f31
	movrgz	%l1,	%o0,	%o3
	call	loop_1097
	rdpr	%gl,	%l6
	movrne	%i3,	0x3F7,	%i5
	tleu	%icc,	0x1
loop_1097:
	bneg,a,pn	%icc,	loop_1098
	nop
	fitos	%f4,	%f11
	fstox	%f11,	%f18
	fmovsne	%icc,	%f0,	%f15
	call	loop_1099
loop_1098:
	fmovrsgez	%i6,	%f18,	%f27
	andncc	%i2,	0x0B3E,	%o5
	fpsub32s	%f3,	%f4,	%f28
loop_1099:
	fmovduge	%fcc2,	%f16,	%f18
	srax	%o6,	0x18,	%i4
	fbue,pn	%fcc2,	loop_1100
	bge	%icc,	loop_1101
	call	loop_1102
	fmovspos	%xcc,	%f6,	%f2
loop_1100:
	fmovsle	%fcc2,	%f22,	%f20
loop_1101:
	tsubcctv	%g5,	0x09B2,	%g1
loop_1102:
	fmovdvs	%xcc,	%f8,	%f20
	rd	%y,	%o1
	fandnot1s	%f27,	%f22,	%f31
	movvc	%icc,	%l4,	%i0
	call	loop_1103
	edge8n	%l2,	%i1,	%g4
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	movuge	%fcc3,	0x5B1,	%g6
loop_1103:
	fmovsl	%xcc,	%f22,	%f4
	fnor	%f2,	%f6,	%f20
	fsrc1	%f26,	%f18
	fpmerge	%f19,	%f29,	%f16
	call	loop_1104
	fnand	%f12,	%f24,	%f26
	call	loop_1105
	nop
	setx	0x26F9D0C8477EF220,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0xF680BC1EDEF1B8F4,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	faddd	%f14,	%f26,	%f2
loop_1104:
	udivx	%o2,	0x00,	%l3
	call	loop_1106
loop_1105:
	for	%f14,	%f18,	%f24
	rd	%pc,	%g7
	call	loop_1107
loop_1106:
	fmovrslez	%l5,	%f14,	%f5
	nop
	setx	0x6C727555EF8701EE,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0x4CA0A0F7CDE51864,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	fmuld	%f8,	%f2,	%f22
	call	loop_1108
loop_1107:
	fbe,a,pn	%fcc3,	loop_1109
	call	loop_1110
	call	loop_1111
loop_1108:
	call	loop_1112
loop_1109:
	fnot1s	%f24,	%f9
loop_1110:
	ldsb	[%l7 + 0x70],	%g3
loop_1111:
	wrpr	%l0,	0x0A5B,	%pil
loop_1112:
	fcmpgt16	%f18,	%f8,	%o7
	call	loop_1113
	fmovdgu	%xcc,	%f10,	%f22
	call	loop_1114
	rdpr	%gl,	%i7
loop_1113:
	stx	%fsr,	[%l7 + 0x20]
	call	loop_1115
loop_1114:
	fmovsg	%icc,	%f7,	%f27
	fzero	%f28
	sethi	0x0C7A,	%g2
loop_1115:
	umul	%o4,	0x0BC4,	%l1
	call	loop_1116
	fmovsvc	%xcc,	%f1,	%f26
	fors	%f16,	%f26,	%f23
	fandnot2	%f20,	%f6,	%f0
loop_1116:
	call	loop_1117
	addccc	%o0,	%l6,	%i3
	and	%o3,	0x0BE1,	%i6
	nop
	setx	loop_1118,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x022100001405,	%l0,	%l1
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
loop_1117:
	movul	%fcc3,	0x72E,	%i5
	be,pn	%icc,	loop_1119
	tleu	%xcc,	0x0
loop_1118:
	nop
	wr	%g0,	0x19,	%asi
	ldswa	[%l7 + 0x58] %asi,	%i2
loop_1119:
	fabsd	%f26,	%f22
	call	loop_1120
	call	loop_1121
	movcc	%xcc,	0x143,	%o5
	fbe,a,pn	%fcc2,	loop_1122
loop_1120:
	edge32	%i4,	%o6,	%g5
loop_1121:
	tsubcc	%o1,	0x1899,	%l4
	nop
	setx	0xD0EB6D9A7641E698,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0xB43D44CB8CC74597,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	faddd	%f26,	%f2,	%f20
loop_1122:
	fandnot2	%f12,	%f16,	%f30
	call	loop_1123
	call	loop_1124
	ta	%icc,	0x1
	fmovdu	%fcc3,	%f26,	%f4
loop_1123:
	edge32ln	%g1,	%i0,	%i1
loop_1124:
	movleu	%xcc,	%l2,	%g4
	call	loop_1125
	call	loop_1126
	fmovd	%f14,	%f26
	nop
	setx	0xBCF50234A031C4D6,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0xA8BC2F126F118C39,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	fdivd	%f12,	%f24,	%f22
loop_1125:
	array16	%o2,	%l3,	%g7
loop_1126:
	call	loop_1127
	nop
	setx	0x0F83ADF5,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f13
	setx	0x1D68686A,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f8
	fadds	%f8,	%f13,	%f1
	set	0x28, %l5
	prefetcha	[%l7 + %l5] 0x19,	 0
loop_1127:
	nop
	fitos	%f22,	%f16
	rdpr	%pil,	%g3
	sll	%l5,	%o7,	%l0
	call	loop_1128
	fmul8x16au	%f10,	%f16,	%f8
	brgez,a,pt	%g2,	loop_1129
	call	loop_1130
loop_1128:
	fpackfix	%f18,	%f28
	call	loop_1131
loop_1129:
	movne	%fcc0,	%o4,	%i7
loop_1130:
	fxnor	%f28,	%f8,	%f20
	call	loop_1132
loop_1131:
	call	loop_1133
	fxor	%f0,	%f22,	%f20
	call	loop_1134
loop_1132:
	wrpr 	%g0, 	0x3, 	%gl
loop_1133:
	edge16	%o0,	%o3,	%i6
	fzeros	%f26
loop_1134:
	call	loop_1135
	rdpr	%otherwin,	%i3
	sra	%i2,	0x1E,	%o5
	call	loop_1136
loop_1135:
	rdhpr	%hsys_tick_cmpr,	%i5
	fmovdvs	%xcc,	%f18,	%f28
	bshuffle	%f26,	%f4,	%f16
loop_1136:
	fcmpes	%fcc0,	%f5,	%f12
	andcc	%i4,	0x0672,	%g5
	fmovdge	%icc,	%f30,	%f8
	call	loop_1137
	fmovsgu	%xcc,	%f17,	%f16
	rdpr	%cwp,	%o1
	movre	%l4,	%o6,	%g1
loop_1137:
	edge32ln	%i0,	%l2,	%i1
	rd	%asi,	%g4
	nop
	setx	0x843B0548DD9AFD4C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0x0F2FF29BBF0A6F15,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	fsubd	%f30,	%f28,	%f30
	call	loop_1138
	edge32l	%o2,	%l3,	%g7
	andncc	%g3,	%l5,	%o7
	rdhpr	%ver,	%l0
loop_1138:
	movneg	%xcc,	0x716,	%g6
	call	loop_1139
	sra	%g2,	%o4,	%l1
	nop
	set	0x7E, %l6
	ldsb	[%l7 + %l6],	%l6
	call	loop_1140
loop_1139:
	movug	%fcc3,	0x6E1,	%i7
	wrpr	%o3,	0x1407,	%tick
	call	loop_1141
loop_1140:
	call	loop_1142
	ba,a	%icc,	loop_1143
	brnz,a	%o0,	loop_1144
loop_1141:
	nop
	setx	0xDFCC40A0190E7EC2,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	fsqrtd	%f4,	%f14
loop_1142:
	edge32ln	%i6,	%i2,	%i3
loop_1143:
	fpmerge	%f16,	%f18,	%f20
loop_1144:
	fmovdul	%fcc3,	%f28,	%f20
	nop
	setx	0xF6C3CC1D804BA0E9,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0x818FD64680802D6C,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	fmuld	%f28,	%f6,	%f22
	fpadd16	%f16,	%f20,	%f10
	nop
	setx	0xB839F396,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f9
	setx	0x455374AF,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f2
	fdivs	%f2,	%f9,	%f17
	movvc	%xcc,	%i5,	%o5
	fmovda	%icc,	%f26,	%f16
	udivcc	%i4,	%o1,	%g5
	edge32ln	%l4,	%g1,	%i0
	edge8	%o6,	%i1,	%l2
	call	loop_1145
	nop
	fitod	%f0,	%f2
	fdtoi	%f2,	%f4
	fmul8x16	%f1,	%f8,	%f16
	call	loop_1146
loop_1145:
	fblg,pt	%fcc2,	loop_1147
	movuge	%fcc1,	0x3E6,	%g4
	call	loop_1148
loop_1146:
	call	loop_1149
loop_1147:
	nop
	set	0x69, %g2
	stb	%o2,	[%l7 + %g2]
	andn	%l3,	%g7,	%l5
loop_1148:
	call	loop_1150
loop_1149:
	wr 	%g0, 	0x6, 	%fprs
	wrpr	%g6,	0x01CF,	%tick
	fmovsneg	%xcc,	%f27,	%f9
loop_1150:
	sir	0x06EF
	rd	%tick_cmpr,	%g2
	rdpr	%cwp,	%g3
	bcc,pt	%icc,	loop_1151
	rdhpr	%hsys_tick_cmpr,	%l1
	st	%fsr,	[%l7 + 0x5C]
	rdpr	%wstate,	%o4
loop_1151:
	movge	%fcc3,	0x2AF,	%l6
	brgz	%o3,	loop_1152
	call	loop_1153
	nop
	setx loop_1154, %l0, %l1
	jmpl %l1, %o0
	movrlz	%i6,	%i2,	%i3
loop_1152:
	for	%f28,	%f2,	%f2
loop_1153:
	call	loop_1155
loop_1154:
	ldsw	[%l7 + 0x68],	%i7
	fbug,pn	%fcc3,	loop_1156
	rdpr	%gl,	%i5
loop_1155:
	call	loop_1157
	fcmpgt32	%f4,	%f28,	%i4
loop_1156:
	fmovrslez	%o5,	%f17,	%f22
	call	loop_1158
loop_1157:
	fmovdo	%fcc1,	%f14,	%f0
	fnot2s	%f18,	%f30
	sll	%g5,	%l4,	%g1
loop_1158:
	edge16	%i0,	%o6,	%i1
	movg	%icc,	%l2,	%o1
	wr	%g0,	0x2b,	%asi
	stda	%g4,	[%l7 + 0x48] %asi
	membar	#Sync
	call	loop_1159
	call	loop_1160
	call	loop_1161
	fmovdge	%xcc,	%f30,	%f10
loop_1159:
	call	loop_1162
loop_1160:
	fmovs	%f2,	%f16
loop_1161:
	call	loop_1163
	fones	%f28
loop_1162:
	nop
	setx	0x1A05E555A25ABD24,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	fsqrtd	%f4,	%f22
	fmovdvs	%icc,	%f14,	%f20
loop_1163:
	fmovd	%f26,	%f16
	membar	0x20
	bmask	%o2,	%l3,	%g7
	fnor	%f0,	%f28,	%f0
	tne	%icc,	0x7
	fmovsg	%xcc,	%f0,	%f9

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xE23, 	%hsys_tick_cmpr
	call	loop_1164
	bne	%icc,	loop_1165
	fpadd32	%f22,	%f22,	%f16
	udiv	%o7,	0x00,	%l0
loop_1164:
	call	loop_1166
loop_1165:
	call	loop_1167
	nop
	setx	0xA8FADF02,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f31
	setx	0xF0ECE9F3,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f11
	fmuls	%f11,	%f31,	%f10
	call	loop_1168
loop_1166:
	tge	%icc,	0x1
loop_1167:
	fcmps	%fcc3,	%f5,	%f2
	call	loop_1169
loop_1168:
	movcc	%xcc,	%g2,	%g6
	edge16	%g3,	%l1,	%l6
	call	loop_1170
loop_1169:
	nop

loop_1170:
	nop

	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 7:
!
!	Type l   	: 25
!	Type a   	: 38
!	Type x   	: 13
!	Type cti   	: 148
!	Type f   	: 150
!	Type i   	: 126
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


	EXIT_GOOD	/* test finish  */

/************************************************************************
   Test case data start
 ************************************************************************/
.data
user_data_start:
scratch_area:
.word 0x6263614E
.word 0x989944A4
.word 0x26DE1125
.word 0x4BBAC67E
.word 0xE6E5AD72
.word 0x2535CD03
.word 0xBE8AF70E
.word 0x99B9F960
.word 0xA6492572
.word 0xEFA8972B
.word 0x924B6200
.word 0x79E87441
.word 0xCD16D676
.word 0xE5EEF450
.word 0xA7435751
.word 0x5756F312
.word 0xC70E815F
.word 0x4B2B0D81
.word 0x03348836
.word 0x38CE4F3F
.word 0x12B476E1
.word 0xAEC41DEE
.word 0x8FAD56B0
.word 0xD1E1D3E0
.word 0x62C78DDA
.word 0x7B241FD2
.word 0x7D19DDF7
.word 0x01356F45
.word 0xE6178B99
.word 0xD0BE99E9
.word 0xA17CAF76
.word 0x08C5E801
.word 0x832F6B49
.word 0xEDD61A6F
.word 0xE6426C81
.word 0x4A91F8A2
.word 0xAA2F94E2
.word 0xB57BFDC4
.word 0x2DC2A642
.word 0xC9B0513E
.word 0xE370EDE3
.word 0xD2AB4664
.word 0x89150890
.word 0x56ADBE16
.word 0xEDBDD273
.word 0xE7D54616
.word 0xC8860FD7
.word 0x1AD1EB1A
.word 0x7A978CB6
.word 0x8120BB12
.word 0x9A0BE359
.word 0x1B0AE10F
.word 0xF41D5014
.word 0x815EB9F3
.word 0x88599C1A
.word 0x7472F019
.word 0x34529CB3
.word 0x408B8BFC
.word 0x509AB256
.word 0x2C156741
.word 0x5C0034E7
.word 0xEF36ADD1
.word 0x8255A7DD
.word 0xD6D16FE3
.end
