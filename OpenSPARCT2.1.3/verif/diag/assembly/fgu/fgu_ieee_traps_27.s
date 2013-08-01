/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: fgu_ieee_traps_27.s
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
.ident "FOCUSCASE: focus.pm,v 1.1 2003/04/23 17:53:39 somePerson Exp somePerson $ spc_basic_isa3.pl FOCUS_SEED=54790124"
.ident "Mon Dec  8 19:58:07 CST 2003"
.ident "Using Instruction Hash for Focus :$Id: fgu_ieee_traps_27.s,v 1.4 2007/07/27 21:45:31 drp Exp $"
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
	set	0x2,	%g1
	set	0x9,	%g2
	set	0x8,	%g3
	set	0x8,	%g4
	set	0x4,	%g5
	set	0x0,	%g6
	set	0x4,	%g7
	!# Input registers
	set	-0x8,	%i0
	set	-0x6,	%i1
	set	-0x8,	%i2
	set	-0x8,	%i3
	set	-0xC,	%i4
	set	-0x6,	%i5
	set	-0xA,	%i6
	set	-0x1,	%i7
	!# Local registers
	set	0x588120FE,	%l0
	set	0x133FBAEB,	%l1
	set	0x127C25C0,	%l2
	set	0x69B4B4E8,	%l3
	set	0x0B95043C,	%l4
	set	0x31FCC11D,	%l5
	set	0x325B3120,	%l6
	!# Output registers
	set	0x0DCD,	%o0
	set	0x1450,	%o1
	set	-0x1983,	%o2
	set	0x002F,	%o3
	set	0x01AE,	%o4
	set	0x1558,	%o5
	set	0x188D,	%o6
	set	0x0CA7,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0xA4614F60243B2ED6)
	INIT_TH_FP_REG(%l7,%f2,0x4DCC2DE710D109EF)
	INIT_TH_FP_REG(%l7,%f4,0xCB873947E98D9408)
	INIT_TH_FP_REG(%l7,%f6,0x3A2052A6786BE33F)
	INIT_TH_FP_REG(%l7,%f8,0x9013DC668BF6D8CF)
	INIT_TH_FP_REG(%l7,%f10,0x3FF2F28DFE9128BC)
	INIT_TH_FP_REG(%l7,%f12,0x1EB3E5F49D5026AD)
	INIT_TH_FP_REG(%l7,%f14,0xC9B0C3F8D0E7AD8B)
	INIT_TH_FP_REG(%l7,%f16,0xF59B0574923872BC)
	INIT_TH_FP_REG(%l7,%f18,0x75121D18D4B09293)
	INIT_TH_FP_REG(%l7,%f20,0x099721E63DA7EBA9)
	INIT_TH_FP_REG(%l7,%f22,0xDDEC52C2C142D36C)
	INIT_TH_FP_REG(%l7,%f24,0x59CA0055E046B503)
	INIT_TH_FP_REG(%l7,%f26,0xB79A7C1B0DE9A102)
	INIT_TH_FP_REG(%l7,%f28,0x16B9B0C47BB6B48A)
	INIT_TH_FP_REG(%l7,%f30,0xBF102F5D279F71DD)

	!# Execute Main Diag ..

	tn	%icc,	0x6
	nop
	set	0x14, %g7
	lduw	[%l7 + %g7],	%g4
	tge	%icc,	0x7
	xnorcc	%g6,	%i5,	%o1
	call	loop_1
	sll	%i0,	0x04,	%l4
	wrpr	%o7,	0x0F5A,	%tick
	fandnot2	%f18,	%f6,	%f24
loop_1:
	brz,a	%g7,	loop_2
	fmovdue	%fcc3,	%f26,	%f22
	call	loop_3
	faligndata	%f26,	%f22,	%f20
loop_2:
	fmovrdgez	%l3,	%f6,	%f4
	call	loop_4
loop_3:
	fand	%f14,	%f18,	%f22
	call	loop_5
	call	loop_6
loop_4:
	movneg	%xcc,	0x39C,	%o3
	fnor	%f22,	%f12,	%f24
loop_5:
	call	loop_7
loop_6:
	call	loop_8
	fmovs	%f6,	%f6
	call	loop_9
loop_7:
	fmovdul	%fcc3,	%f24,	%f26
loop_8:
	call	loop_10
	call	loop_11
loop_9:
	wr 	%g0, 	0x6, 	%fprs
	sra	%g3,	%o6,	%i7
loop_10:
	fornot2	%f24,	%f14,	%f2
loop_11:
	call	loop_12
	and	%o2,	0x05B6,	%i6
	brz,pn	%o4,	loop_13
	rdpr	%tba,	%o5
loop_12:
	umulcc	%i4,	0x0371,	%i3
	fmovsvs	%icc,	%f22,	%f7
loop_13:
	fmovdcc	%icc,	%f6,	%f26
	fmovscs	%xcc,	%f5,	%f7
	fmovrdne	%g5,	%f18,	%f26
	nop
	set	0x30, %i2
	lduw	[%l7 + %i2],	%l6
	fmovdg	%icc,	%f12,	%f6
	call	loop_14
	wrpr	%l0,	%o0,	%cwp
	stx	%l5,	[%l7 + 0x20]
	rd	%tick_cmpr,	%i2
loop_14:
	and	%l1,	%g1,	%g2
	call	loop_15
	fnot2s	%f11,	%f21
	fmovsn	%xcc,	%f3,	%f15
	movneg	%icc,	%g4,	%g6
loop_15:
	call	loop_16
	movrlez	%i5,	0x2AE,	%i0
	fmovdcc	%icc,	%f16,	%f16
	call	loop_17
loop_16:
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	call	loop_18
	wr	%l4,	0x1DB4,	%sys_tick
loop_17:
	call	loop_19
	orn	%o1,	%o7,	%l3
loop_18:
	edge32l	%g7,	%i1,	%o3
	fmovsleu	%xcc,	%f27,	%f11
loop_19:
	andcc	%g3,	0x182C,	%l2
	subc	%o6,	0x1C50,	%i7
	call	loop_20
	fmuld8ulx16	%f27,	%f28,	%f18
	rd	%tick_cmpr,	%i6
	fcmpeq16	%f20,	%f20,	%o2
loop_20:
	fxnor	%f8,	%f14,	%f18
	call	loop_21
	fandnot2	%f26,	%f20,	%f14
	fpsub16s	%f15,	%f16,	%f1
	call	loop_22
loop_21:
	call	loop_23
	call	loop_24
	call	loop_25
loop_22:
	umul	%o5,	0x1BDE,	%o4
loop_23:
	movneg	%icc,	0x05F,	%i3
loop_24:
	te	%icc,	0x6
loop_25:
	nop
	set	0x2C, %o2
	lduh	[%l7 + %o2],	%g5
	movu	%fcc0,	%i4,	%l6
	fmovrdlz	%l0,	%f10,	%f26
	fmovdcs	%icc,	%f26,	%f12
	fmovsu	%fcc3,	%f22,	%f15
	fmovscc	%icc,	%f12,	%f15
	fnot2	%f0,	%f0
	nop
	fitos	%f2,	%f18
	fstod	%f18,	%f22
	call	loop_26
	pdist	%f0,	%f16,	%f30
	call	loop_27
	call	loop_28
loop_26:
	call	loop_29
	tle	%xcc,	0x1
loop_27:
	call	loop_30
loop_28:
	edge16ln	%o0,	%l5,	%l1
loop_29:
	tne	%icc,	0x7
	edge8	%g1,	%i2,	%g2
loop_30:
	fmovsvs	%icc,	%f26,	%f31
	fnot1s	%f18,	%f30
	fnands	%f28,	%f24,	%f2
	fmul8sux16	%f16,	%f22,	%f6
	edge32	%g6,	%i5,	%i0
	nop
	setx	loop_31,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x001400001407,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movvs	%icc,	0x5A3,	%l4
	call	loop_32
	fblg,a,pt	%fcc3,	loop_33
loop_31:
	call	loop_34
	tsubcc	%g4,	0x06A2,	%o1
loop_32:
	nop
	setx	0x0F9B,	%l0,	%o7
	sdivcc	%l3,	%o7,	%g7
loop_33:
	call	loop_35
loop_34:
	call	loop_36
	call	loop_37
	bn	%icc,	loop_38
loop_35:
	call	loop_39
loop_36:
	fmovrslez	%o3,	%f0,	%f17
loop_37:
	nop
	set	0x6F, %o1
	ldub	[%l7 + %o1],	%i1
loop_38:
	tgu	%icc,	0x1
loop_39:
	ldd	[%l7 + 0x30],	%l2
	rd	%softint,	%o6
	call	loop_40
	membar	0x73
	smul	%i7,	%i6,	%o2
	call	loop_41
loop_40:
	fmovdug	%fcc3,	%f16,	%f20
	fmovs	%f21,	%f10
	call	loop_42
loop_41:
	fmovrde	%g3,	%f12,	%f26
	fbne,a,pt	%fcc2,	loop_43
	call	loop_44
loop_42:
	fcmps	%fcc0,	%f8,	%f15
	nop
	setx	0x6048CE3B233B13F0,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0xB3EED0EAE6034EC0,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	fmuld	%f16,	%f30,	%f20
loop_43:
	fba,pn	%fcc2,	loop_45
loop_44:
	fmovsuge	%fcc3,	%f8,	%f27
	fxnor	%f16,	%f4,	%f6
	fmovsvc	%xcc,	%f11,	%f24
loop_45:
	te	%xcc,	0x4
	fmovdcs	%xcc,	%f16,	%f30
	call	loop_46
	fmovdge	%icc,	%f2,	%f2
	fmovs	%f0,	%f1
	orncc	%o4,	%o5,	%g5
loop_46:
	edge16n	%i4,	%i3,	%l0
	call	loop_47
	nop
	setx	0xFDAA4A5F,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f10
	setx	0xE4AB2172,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f8
	fsubs	%f8,	%f10,	%f12
	call	loop_48
	rdpr	%tl,	%l6
loop_47:
	sllx	%o0,	0x16,	%l1
	call	loop_49
loop_48:
	xnorcc	%g1,	%l5,	%i2
	nop
	set	0x6A, %l2
	stb	%g6,	[%l7 + %l2]
	brgz	%i5,	loop_50
loop_49:
	fcmpd	%fcc3,	%f2,	%f4
	nop
	fitos	%f7,	%f1
	fstoi	%f1,	%f31
	smulcc	%i0,	%g2,	%g4
loop_50:
	movleu	%icc,	%l4,	%o1
	call	loop_51
	movpos	%xcc,	%o7,	%g7
	call	loop_52
	nop
	set	0x0C, %g5
	swap	[%l7 + %g5],	%o3
loop_51:
	call	loop_53
	movrlez	%i1,	0x03C,	%l2
loop_52:
	edge32	%o6,	%l3,	%i7
	call	loop_54
loop_53:
	taddcctv	%o2,	0x18EA,	%i6
	fornot1	%f26,	%f6,	%f30
	call	loop_55
loop_54:
	be	%xcc,	loop_56
	rdhpr	%hsys_tick_cmpr,	%g3
	nop
	set	0x38, %l0
	prefetch	[%l7 + %l0],	 0
loop_55:
	call	loop_57
loop_56:
	fmovdvc	%icc,	%f0,	%f0
	taddcctv	%o4,	0x0957,	%o5
	array32	%g5,	%i3,	%l0
loop_57:
	fmovsuge	%fcc3,	%f27,	%f7
	fmovrde	%i4,	%f12,	%f4
	rdpr	%canrestore,	%l6
	call	loop_58
	call	loop_59
	ldstub	[%l7 + 0x71],	%l1
	call	loop_60
loop_58:
	fmovsue	%fcc0,	%f6,	%f20
loop_59:
	sdiv	%g1,	0x1D2C,	%l5
	call	loop_61
loop_60:
	call	loop_62
	xnor	%i2,	0x19C0,	%g6
	move	%fcc1,	%o0,	%i5
loop_61:
	edge8ln	%i0,	%g2,	%l4
loop_62:
	call	loop_63
	call	loop_64
	alignaddr	%g4,	%o1,	%o7
	call	loop_65
loop_63:
	faligndata	%f12,	%f22,	%f6
loop_64:
	movuge	%fcc1,	0x175,	%g7
	fxors	%f5,	%f26,	%f14
loop_65:
	nop
	setx loop_66, %l0, %l1
	jmpl %l1, %o3
	alignaddr	%i1,	%l2,	%l3
	nop
	setx	0x1C16,	%l0,	%i7
	sdiv	%o6,	%i7,	%i6
	andcc	%g3,	0x1C75,	%o4
loop_66:
	sethi	0x0017,	%o2
	call	loop_67
	fmovdvc	%icc,	%f2,	%f18
	fbn,pt	%fcc3,	loop_68
loop_67:
	nop

loop_68:
	nop

	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 0:
!
!	Type l   	: 10
!	Type a   	: 11
!	Type cti   	: 68
!	Type f   	: 57
!	Type i   	: 54
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
	set	0x3,	%g1
	set	0x3,	%g2
	set	0x5,	%g3
	set	0xE,	%g4
	set	0x7,	%g5
	set	0x2,	%g6
	set	0xD,	%g7
	!# Input registers
	set	-0xC,	%i0
	set	-0xE,	%i1
	set	-0x3,	%i2
	set	-0x0,	%i3
	set	-0xB,	%i4
	set	-0x0,	%i5
	set	-0x4,	%i6
	set	-0xE,	%i7
	!# Local registers
	set	0x1FB7DF4F,	%l0
	set	0x28C4A374,	%l1
	set	0x4AE4A857,	%l2
	set	0x744A46F7,	%l3
	set	0x6CEDDFC2,	%l4
	set	0x3589FCFD,	%l5
	set	0x5A8EA362,	%l6
	!# Output registers
	set	-0x0068,	%o0
	set	0x1C9B,	%o1
	set	0x1279,	%o2
	set	-0x0418,	%o3
	set	-0x126B,	%o4
	set	0x006A,	%o5
	set	0x1FF2,	%o6
	set	-0x0898,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0xA4614F60243B2ED6)
	INIT_TH_FP_REG(%l7,%f2,0x4DCC2DE710D109EF)
	INIT_TH_FP_REG(%l7,%f4,0xCB873947E98D9408)
	INIT_TH_FP_REG(%l7,%f6,0x3A2052A6786BE33F)
	INIT_TH_FP_REG(%l7,%f8,0x9013DC668BF6D8CF)
	INIT_TH_FP_REG(%l7,%f10,0x3FF2F28DFE9128BC)
	INIT_TH_FP_REG(%l7,%f12,0x1EB3E5F49D5026AD)
	INIT_TH_FP_REG(%l7,%f14,0xC9B0C3F8D0E7AD8B)
	INIT_TH_FP_REG(%l7,%f16,0xF59B0574923872BC)
	INIT_TH_FP_REG(%l7,%f18,0x75121D18D4B09293)
	INIT_TH_FP_REG(%l7,%f20,0x099721E63DA7EBA9)
	INIT_TH_FP_REG(%l7,%f22,0xDDEC52C2C142D36C)
	INIT_TH_FP_REG(%l7,%f24,0x59CA0055E046B503)
	INIT_TH_FP_REG(%l7,%f26,0xB79A7C1B0DE9A102)
	INIT_TH_FP_REG(%l7,%f28,0x16B9B0C47BB6B48A)
	INIT_TH_FP_REG(%l7,%f30,0xBF102F5D279F71DD)

	!# Execute Main Diag ..

	nop
	setx	0x0864,	%l0,	%g5
	sdivx	%o5,	%g5,	%l0
	call	loop_69
	fpsub16	%f14,	%f28,	%f26
	movpos	%icc,	0x23E,	%i3
	call	loop_70
loop_69:
	call	loop_71
	fmovrdgez	%l6,	%f14,	%f24

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_70:
	fmovsule	%fcc3,	%f15,	%f26
loop_71:
	tpos	%icc,	0x4
	call	loop_72
	call	loop_73
	fones	%f16
	ta	%xcc,	0x6
loop_72:
	orn	%l5,	%i2,	%l1
loop_73:
	call	loop_74
	wr	%g6,	%o0,	%pic
	subccc	%i5,	0x03F0,	%i0
	fmovdge	%fcc0,	%f16,	%f12
loop_74:
	call	loop_75
	be,pt	%icc,	loop_76
	call	loop_77
	call	loop_78
loop_75:
	call	loop_79
loop_76:
	stw	%g2,	[%l7 + 0x34]
loop_77:
	call	loop_80
loop_78:
	fmovscs	%xcc,	%f10,	%f21
loop_79:
	fcmpeq32	%f0,	%f12,	%l4
	fmovdn	%icc,	%f6,	%f18
loop_80:
	fpsub32s	%f26,	%f22,	%f0
	fmovdneg	%xcc,	%f8,	%f14
	rdhpr	%hpstate,	%o1
	fmovsneg	%xcc,	%f18,	%f12
	fmovrdgez	%o7,	%f22,	%f2
	call	loop_81
	movre	%g4,	0x13F,	%o3
	fmovdul	%fcc2,	%f16,	%f26
	membar	0x17
loop_81:
	fmovde	%xcc,	%f20,	%f16
	alignaddrl	%g7,	%l2,	%l3
	movl	%fcc0,	%o6,	%i1
	tcs	%xcc,	0x0
	rdpr	%wstate,	%i6
	popc	%i7,	%o4
	call	loop_82
	nop
	set	0x6F, %g6
	ldstub	[%l7 + %g6],	%g3
	call	loop_83
	call	loop_84
loop_82:
	taddcc	%o5,	%g5,	%l0
	call	loop_85
loop_83:
	fmovrsgez	%i3,	%f27,	%f21
loop_84:
	edge32	%o2,	%i4,	%l6
	movrgez	%l5,	%i2,	%l1
loop_85:
	fbuge,a	%fcc0,	loop_86
	fpsub32	%f4,	%f18,	%f6
	call	loop_87
	fmovdle	%xcc,	%f12,	%f30
loop_86:
	call	loop_88
	call	loop_89
loop_87:
	call	loop_90
	call	loop_91
loop_88:
	bpos	%icc,	loop_92
loop_89:
	fmovslg	%fcc0,	%f12,	%f1
loop_90:
	fnand	%f30,	%f18,	%f30
loop_91:
	movule	%fcc1,	%g1,	%g6
loop_92:
	fbo,a,pn	%fcc3,	loop_93
	brlez	%i5,	loop_94
	nop
	setx	0x917ED9B6B3D6D7F4,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0x143394F42B17B906,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	fmuld	%f16,	%f0,	%f22
	wr	%o0,	0x1649,	%set_softint
loop_93:
	call	loop_95
loop_94:
	call	loop_96
	call	loop_97
	rdhpr	%ver,	%g2
loop_95:
	fmovsuge	%fcc0,	%f16,	%f19
loop_96:
	orn	%l4,	0x0200,	%o1
loop_97:
	tneg	%icc,	0x0
	call	loop_98
	movneg	%icc,	%i0,	%o7
	call	loop_99
	call	loop_100
loop_98:
	tg	%icc,	0x1
	fcmpne32	%f6,	%f28,	%g4
loop_99:
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
loop_100:
	nop
	setx	0x1C74865F,	%l0,	%l6
	st	%l6,	[%l7 + 0x5C]
	ld	[%l7 + 0x5C],	%fsr
	call	loop_101
	call	loop_102
	fcmps	%fcc2,	%f13,	%f11
	call	loop_103
loop_101:
	fmovdne	%fcc1,	%f28,	%f26
loop_102:
	call	loop_104
	tcc	%icc,	0x1
loop_103:
	edge16ln	%g7,	%o3,	%l2
	and	%l3,	0x095C,	%o6
loop_104:
	fmovdg	%fcc1,	%f4,	%f28
	nop
	set	0x37, %i7
	stb	%i6,	[%l7 + %i7]
	addccc	%i7,	%i1,	%g3
	brlz,pt	%o4,	loop_105
	call	loop_106
	movrne	%o5,	%l0,	%i3
	set	0x73, %i0
	lduba	[%l7 + %i0] 0x80,	%o2
loop_105:
	subccc	%g5,	0x1718,	%l6
loop_106:
	rdpr	%tba,	%i4
	tvs	%icc,	0x3
	smul	%l5,	0x0DAD,	%i2
	nop
	setx	0x7DC22A28B5D5EEBB,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	fsqrtd	%f14,	%f16
	call	loop_107
	call	loop_108
	fpack16	%f14,	%f20
	fmul8ulx16	%f0,	%f0,	%f22
loop_107:
	fsrc1	%f28,	%f12
loop_108:
	movrgez	%l1,	0x2E2,	%g1
	movul	%fcc2,	0x754,	%g6
	fmovsu	%fcc2,	%f1,	%f29
	sll	%i5,	0x15,	%o0
	fbge,a	%fcc1,	loop_109
	fmovdl	%icc,	%f22,	%f22
	call	loop_110
	nop
	setx	0x1877,	%l0,	%o1
	udiv	%g2,	%o1,	%l4
loop_109:
	call	loop_111
	call	loop_112
loop_110:
	fnegd	%f0,	%f16
	and	%o7,	0x05DA,	%g4
loop_111:
	tneg	%icc,	0x2
loop_112:
	fmovrsgez	%i0,	%f20,	%f17
	call	loop_113
	wr	%o3,	%g7,	%softint
	fbo	%fcc3,	loop_114
	fmovsug	%fcc1,	%f15,	%f17
loop_113:
	tge	%xcc,	0x4
	fmovdug	%fcc0,	%f26,	%f20
loop_114:
	nop
	setx	0x000B,	%l0,	%l2
	sdiv	%l3,	%l2,	%o6
	fornot2	%f12,	%f26,	%f12
	fpsub32s	%f9,	%f27,	%f10
	call	loop_115
	fble	%fcc3,	loop_116
	edge16ln	%i6,	%i7,	%i1
	fmovsneg	%xcc,	%f21,	%f9
loop_115:
	fnors	%f24,	%f30,	%f11
loop_116:
	fmovsneg	%icc,	%f25,	%f3
	fpsub32	%f10,	%f30,	%f22
	nop
	setx	0x9A0DD4BE,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f5
	fsqrts	%f5,	%f25
	call	loop_117
	sra	%o4,	0x0A,	%g3
	fmovdue	%fcc2,	%f22,	%f30
	fmovdgu	%xcc,	%f20,	%f14
loop_117:
	fpack16	%f30,	%f22
	tpos	%icc,	0x6
	call	loop_118
	movrne	%o5,	0x293,	%i3
	fcmple16	%f26,	%f10,	%l0
	taddcctv	%g5,	%l6,	%o2
loop_118:
	nop
	fitos	%f10,	%f5
	fstox	%f5,	%f2
	fxtos	%f2,	%f8
	fmovdvc	%xcc,	%f0,	%f20
	array32	%l5,	%i2,	%i4
	xor	%g1,	%g6,	%i5
	fmovsule	%fcc0,	%f17,	%f31
	call	loop_119
	edge8ln	%o0,	%l1,	%o1
	call	loop_120
	brlez,a,pn	%g2,	loop_121
loop_119:
	movuge	%fcc0,	%o7,	%g4
	call	loop_122
loop_120:
	fmovsug	%fcc3,	%f22,	%f2
loop_121:
	tsubcc	%l4,	%o3,	%i0
	nop
	setx	0x60FD7FFA0BAD48E2,	%l0,	%l6
	stx	%l6,	[%l7 + 0x60]
	ldx	[%l7 + 0x60],	%fsr
loop_122:
	call	loop_123
	rd	%y,	%g7
	for	%f4,	%f24,	%f16
	call	loop_124
loop_123:
	fornot1s	%f3,	%f10,	%f4
	bleu,a,pt	%xcc,	loop_125
	call	loop_126
loop_124:
	fsrc2s	%f2,	%f26
	xnorcc	%l3,	%o6,	%i6
loop_125:
	call	loop_127
loop_126:
	edge32	%i7,	%l2,	%i1
	smul	%g3,	0x19F0,	%o4
	rdpr	%cansave,	%o5
loop_127:
	call	loop_128
	fmul8x16	%f11,	%f2,	%f6
	fcmpgt16	%f24,	%f4,	%i3
	fbuge,pt	%fcc0,	loop_129
loop_128:
	rdhpr	%hintp,	%g5
	bvs,a	%xcc,	loop_130
	call	loop_131
loop_129:
	addccc	%l0,	%o2,	%l5
	movu	%fcc3,	%i2,	%i4
loop_130:
	fornot2	%f28,	%f8,	%f2
loop_131:
	xnorcc	%g1,	%l6,	%g6
	movrgz	%o0,	%l1,	%o1
	wrpr 	%g0, 	0x2, 	%gl
	movge	%fcc2,	%g2,	%l4
	fabsd	%f18,	%f22
	nop
	setx	0x235C448A,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%fsr
	brlez,a	%o3,	loop_132
	addccc	%g4,	0x1C47,	%i0
	call	loop_133
	fmovdn	%fcc2,	%f24,	%f6
loop_132:
	movlg	%fcc1,	0x5DE,	%l3
loop_133:
	nop

	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 1:
!
!	Type l   	: 7
!	Type a   	: 12
!	Type x   	: 1
!	Type cti   	: 65
!	Type f   	: 58
!	Type i   	: 57
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
	set	0x9,	%g1
	set	0x9,	%g2
	set	0xD,	%g3
	set	0x3,	%g4
	set	0xC,	%g5
	set	0xF,	%g6
	set	0x9,	%g7
	!# Input registers
	set	-0x4,	%i0
	set	-0xF,	%i1
	set	-0x7,	%i2
	set	-0xF,	%i3
	set	-0x6,	%i4
	set	-0x2,	%i5
	set	-0x6,	%i6
	set	-0x6,	%i7
	!# Local registers
	set	0x16982D17,	%l0
	set	0x0334F819,	%l1
	set	0x4831B7DD,	%l2
	set	0x6CF0CBA1,	%l3
	set	0x44910330,	%l4
	set	0x0271CA9C,	%l5
	set	0x13236D1E,	%l6
	!# Output registers
	set	0x0B13,	%o0
	set	-0x05A3,	%o1
	set	0x154C,	%o2
	set	0x12DD,	%o3
	set	0x1204,	%o4
	set	-0x0DFB,	%o5
	set	0x04D3,	%o6
	set	0x105F,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0xA4614F60243B2ED6)
	INIT_TH_FP_REG(%l7,%f2,0x4DCC2DE710D109EF)
	INIT_TH_FP_REG(%l7,%f4,0xCB873947E98D9408)
	INIT_TH_FP_REG(%l7,%f6,0x3A2052A6786BE33F)
	INIT_TH_FP_REG(%l7,%f8,0x9013DC668BF6D8CF)
	INIT_TH_FP_REG(%l7,%f10,0x3FF2F28DFE9128BC)
	INIT_TH_FP_REG(%l7,%f12,0x1EB3E5F49D5026AD)
	INIT_TH_FP_REG(%l7,%f14,0xC9B0C3F8D0E7AD8B)
	INIT_TH_FP_REG(%l7,%f16,0xF59B0574923872BC)
	INIT_TH_FP_REG(%l7,%f18,0x75121D18D4B09293)
	INIT_TH_FP_REG(%l7,%f20,0x099721E63DA7EBA9)
	INIT_TH_FP_REG(%l7,%f22,0xDDEC52C2C142D36C)
	INIT_TH_FP_REG(%l7,%f24,0x59CA0055E046B503)
	INIT_TH_FP_REG(%l7,%f26,0xB79A7C1B0DE9A102)
	INIT_TH_FP_REG(%l7,%f28,0x16B9B0C47BB6B48A)
	INIT_TH_FP_REG(%l7,%f30,0xBF102F5D279F71DD)

	!# Execute Main Diag ..

	fmovsge	%xcc,	%f8,	%f11
	call	loop_134
	fnot1s	%f25,	%f19
	call	loop_135
	fmovde	%fcc2,	%f16,	%f18
loop_134:
	call	loop_136
	brnz,a	%o6,	loop_137
loop_135:
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	fpadd32	%f30,	%f20,	%f12
loop_136:
	movrgez	%i6,	%g7,	%i7
loop_137:
	xnorcc	%i1,	%g3,	%o4
	fmovrde	%l2,	%f22,	%f18
	fandnot2	%f24,	%f4,	%f16
	ldsw	[%l7 + 0x10],	%o5
	bgu,pn	%icc,	loop_138
	fpadd16	%f24,	%f30,	%f24
	tgu	%icc,	0x4
	rdpr	%wstate,	%i3
loop_138:
	call	loop_139
	and	%l0,	%o2,	%g5
	subccc	%i2,	0x0C62,	%i4
	nop
	set	0x50, %i4
	ldd	[%l7 + %i4],	%f12
loop_139:
	fmovduge	%fcc0,	%f24,	%f12
	rd	%ccr,	%g1
	or	%l5,	%g6,	%l6
	call	loop_140
	edge16ln	%o0,	%l1,	%i5
	call	loop_141
	fmul8sux16	%f26,	%f0,	%f24
loop_140:
	bneg,a	%icc,	loop_142
	movge	%fcc3,	0x19D,	%o1
loop_141:
	call	loop_143
	call	loop_144
loop_142:
	wr	%o7,	0x116E,	%ccr
	fmovsne	%fcc2,	%f5,	%f2
loop_143:
	subccc	%g2,	0x0835,	%o3
loop_144:
	call	loop_145
	fsrc1	%f20,	%f28
	edge16n	%g4,	%i0,	%l3
	call	loop_146
loop_145:
	xor	%l4,	0x1405,	%i6
	nop
	setx	0x1B58,	%l0,	%g7
	sdiv	%o6,	%g7,	%i1
	call	loop_147
loop_146:
	fmovdge	%fcc1,	%f30,	%f2
	bpos,pn	%icc,	loop_148
	orn	%g3,	%i7,	%o4
loop_147:
	sub	%o5,	0x13D8,	%i3
	xnorcc	%l2,	0x0E5A,	%l0
loop_148:
	siam	0x3
	movo	%fcc1,	%o2,	%i2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x8F8, 	%sys_tick_cmpr
	call	loop_149
	call	loop_150
	nop
	setx	0x3AAFBBF305D37619,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0xE8EFB09CB81CF0EE,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	faddd	%f12,	%f14,	%f4
	array32	%g5,	%g1,	%l5
loop_149:
	movo	%fcc3,	0x58F,	%l6
loop_150:
	call	loop_151
	call	loop_152
	call	loop_153
	fmovsa	%icc,	%f29,	%f11
loop_151:
	call	loop_154
loop_152:
	andncc	%g6,	%l1,	%i5
loop_153:
	ldsw	[%l7 + 0x1C],	%o0
	call	loop_155
loop_154:
	call	loop_156
	fba,pn	%fcc3,	loop_157
	stbar
loop_155:
	fmovrsne	%o7,	%f22,	%f11
loop_156:
	call	loop_158
loop_157:
	call	loop_159
	call	loop_160
	movneg	%icc,	0x239,	%o1
loop_158:
	rdhpr	%ver,	%o3
loop_159:
	call	loop_161
loop_160:
	edge16ln	%g2,	%i0,	%g4
	call	loop_162
	fabsd	%f12,	%f12
loop_161:
	nop
	setx	0xE52E077829BAD61F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0xC8DD306B2E53A43C,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	fmuld	%f16,	%f6,	%f0
	set	0x48, %g1
	swapa	[%l7 + %g1] 0x81,	%l3
loop_162:
	flushw
	fmovsg	%xcc,	%f1,	%f4
	call	loop_163
	nop
	setx	0x0FB8,	%l0,	%i6
	sdivcc	%l4,	%i6,	%o6
	wr	%g7,	0x0378,	%clear_softint
	movn	%fcc1,	0x6FD,	%g3
loop_163:
	call	loop_164
	bn,a,pn	%icc,	loop_165
	edge8	%i1,	%o4,	%o5
	call	loop_166
loop_164:
	call	loop_167
loop_165:
	movge	%fcc0,	0x4CB,	%i7
	bvc	%icc,	loop_168
loop_166:
	call	loop_169
loop_167:
	fsrc2	%f26,	%f28
	tvs	%xcc,	0x1
loop_168:
	fmovrslez	%l2,	%f27,	%f6
loop_169:
	rdhpr	%htba,	%l0
	call	loop_170
	ba,a	%icc,	loop_171
	fpadd32s	%f3,	%f17,	%f10
	movcs	%icc,	%o2,	%i2
loop_170:
	fxnors	%f26,	%f27,	%f11
loop_171:
	call	loop_172
	movue	%fcc0,	0x378,	%i4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	movl	%icc,	0x0D6,	%i3
loop_172:
	call	loop_173
	fandnot1s	%f18,	%f26,	%f19
	fmovdul	%fcc2,	%f10,	%f18
	fornot1s	%f27,	%f24,	%f9
loop_173:
	call	loop_174
	call	loop_175
	fabsd	%f20,	%f20
	fcmpd	%fcc0,	%f0,	%f22
loop_174:
	call	loop_176
loop_175:
	bpos,a,pt	%xcc,	loop_177
	fmovsu	%fcc1,	%f16,	%f31
	bg,pt	%xcc,	loop_178
loop_176:
	subc	%l5,	0x0382,	%g6
loop_177:
	tpos	%icc,	0x6
	fmovsl	%icc,	%f13,	%f5
loop_178:
	fmovdu	%fcc2,	%f8,	%f18
	edge8	%l1,	%l6,	%o0
	fcmpeq32	%f8,	%f10,	%o7
	sethi	0x1F0A,	%o1
	fba,a	%fcc0,	loop_179
	call	loop_180
	tneg	%xcc,	0x7
	fmovrsgz	%o3,	%f14,	%f3
loop_179:
	fbuge,pn	%fcc2,	loop_181
loop_180:
	prefetch	[%l7 + 0x3C],	 2
	call	loop_182
	fmovdcs	%icc,	%f14,	%f4
loop_181:
	call	loop_183
	fmul8x16al	%f8,	%f4,	%f20
loop_182:
	call	loop_184
	add	%i5,	%g2,	%i0
loop_183:
	fnor	%f14,	%f0,	%f2
	bg	%xcc,	loop_185
loop_184:
	fpmerge	%f1,	%f16,	%f18
	call	loop_186
	call	loop_187
loop_185:
	call	loop_188
	tsubcc	%l3,	%l4,	%i6
loop_186:
	call	loop_189
loop_187:
	tvc	%xcc,	0x5
loop_188:
	tgu	%icc,	0x2
	movo	%fcc0,	%g4,	%o6
loop_189:
	popc	0x0370,	%g3
	fandnot2	%f8,	%f28,	%f26
	fmovdg	%fcc3,	%f16,	%f12
	fors	%f15,	%f14,	%f24
	fmovspos	%xcc,	%f0,	%f10
	call	loop_190
	rdpr	%otherwin,	%g7
	fands	%f18,	%f25,	%f12
	fxors	%f16,	%f10,	%f16
loop_190:
	nop
	setx loop_191, %l0, %l1
	jmpl %l1, %i1
	movug	%fcc3,	0x286,	%o4
	fbu	%fcc3,	loop_192
	fcmpne16	%f14,	%f28,	%o5
loop_191:
	fabsd	%f16,	%f12
	fnor	%f28,	%f6,	%f14
loop_192:
	fone	%f16
	fbul,a	%fcc0,	loop_193
	stbar
	pdist	%f6,	%f22,	%f0
	movleu	%xcc,	0x406,	%i7
loop_193:
	edge8	%l2,	%l0,	%i2
	fcmpgt32	%f0,	%f18,	%o2
	fcmpgt16	%f6,	%f6,	%g5
	fxnors	%f13,	%f13,	%f27
	tsubcc	%g1,	%i4,	%i3
	call	loop_194
	call	loop_195
	mulx	%g6,	0x0FD8,	%l5
	bleu,pt	%icc,	loop_196
loop_194:
	fbne,a,pn	%fcc2,	loop_197
loop_195:
	fmul8ulx16	%f2,	%f28,	%f2
	movu	%fcc3,	%l1,	%o0
loop_196:
	call	loop_198
loop_197:
	fbge,a	%fcc2,	loop_199
	call	loop_200
	te	%xcc,	0x7
loop_198:
	tsubcctv	%l6,	%o1,	%o7
loop_199:
	bvc,a,pn	%xcc,	loop_201
loop_200:
	fsrc2s	%f13,	%f1
	movre	%i5,	%o3,	%i0
	call	loop_202
loop_201:
	nop
	fitod	%f8,	%f28
	fdtox	%f28,	%f28
	rd	%fprs,	%l3
	fcmpgt16	%f14,	%f24,	%g2
loop_202:
	xnor	%l4,	0x1AA5,	%i6
	sub	%g4,	0x0BBB,	%g3
	srlx	%o6,	0x11,	%i1
	call	loop_203
	stw	%o4,	[%l7 + 0x2C]
	fzero	%f10
	bn	%icc,	loop_204
loop_203:
	nop

loop_204:
	nop

	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 2:
!
!	Type l   	: 8
!	Type a   	: 10
!	Type x   	: 1
!	Type cti   	: 71
!	Type f   	: 56
!	Type i   	: 54
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
	set	0x4,	%g1
	set	0xD,	%g2
	set	0x4,	%g3
	set	0xD,	%g4
	set	0xE,	%g5
	set	0x8,	%g6
	set	0x8,	%g7
	!# Input registers
	set	-0x1,	%i0
	set	-0xA,	%i1
	set	-0xD,	%i2
	set	-0x8,	%i3
	set	-0x4,	%i4
	set	-0xC,	%i5
	set	-0x9,	%i6
	set	-0x6,	%i7
	!# Local registers
	set	0x75CFAF4A,	%l0
	set	0x730D98F7,	%l1
	set	0x5C4D427E,	%l2
	set	0x5CF389C6,	%l3
	set	0x261B8706,	%l4
	set	0x4AF92CBB,	%l5
	set	0x5EF4B00F,	%l6
	!# Output registers
	set	-0x0AB7,	%o0
	set	0x03F2,	%o1
	set	0x1948,	%o2
	set	-0x1471,	%o3
	set	0x1799,	%o4
	set	-0x0900,	%o5
	set	0x0F9B,	%o6
	set	0x15DE,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0xA4614F60243B2ED6)
	INIT_TH_FP_REG(%l7,%f2,0x4DCC2DE710D109EF)
	INIT_TH_FP_REG(%l7,%f4,0xCB873947E98D9408)
	INIT_TH_FP_REG(%l7,%f6,0x3A2052A6786BE33F)
	INIT_TH_FP_REG(%l7,%f8,0x9013DC668BF6D8CF)
	INIT_TH_FP_REG(%l7,%f10,0x3FF2F28DFE9128BC)
	INIT_TH_FP_REG(%l7,%f12,0x1EB3E5F49D5026AD)
	INIT_TH_FP_REG(%l7,%f14,0xC9B0C3F8D0E7AD8B)
	INIT_TH_FP_REG(%l7,%f16,0xF59B0574923872BC)
	INIT_TH_FP_REG(%l7,%f18,0x75121D18D4B09293)
	INIT_TH_FP_REG(%l7,%f20,0x099721E63DA7EBA9)
	INIT_TH_FP_REG(%l7,%f22,0xDDEC52C2C142D36C)
	INIT_TH_FP_REG(%l7,%f24,0x59CA0055E046B503)
	INIT_TH_FP_REG(%l7,%f26,0xB79A7C1B0DE9A102)
	INIT_TH_FP_REG(%l7,%f28,0x16B9B0C47BB6B48A)
	INIT_TH_FP_REG(%l7,%f30,0xBF102F5D279F71DD)

	!# Execute Main Diag ..

	fmovdg	%xcc,	%f12,	%f28
	sll	%o5,	0x0E,	%i7
	fmuld8sux16	%f6,	%f18,	%f28
	fmovsn	%xcc,	%f11,	%f19
	pdist	%f10,	%f30,	%f14
	fsrc2s	%f13,	%f26
	call	loop_205
	movule	%fcc0,	%l2,	%l0
	fcmple16	%f6,	%f2,	%i2
	fmovrsne	%o2,	%f28,	%f23
loop_205:
	fmovsule	%fcc3,	%f22,	%f18
	call	loop_206
	fcmpgt16	%f26,	%f8,	%g5
	alignaddrl	%g1,	%i4,	%i3
	fmovdg	%fcc2,	%f8,	%f14
loop_206:
	call	loop_207
	nop
	setx	0x13D5,	%l0,	%l5
	udiv	%g7,	%l5,	%g6
	call	loop_208
	add	%l1,	%l6,	%o0
loop_207:
	sllx	%o1,	0x1C,	%o7
	nop
	setx	0xFAB0ECFA,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f25
	setx	0x0DD11D7E,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f8
	fmuls	%f8,	%f25,	%f20
loop_208:
	call	loop_209
	fcmpeq16	%f18,	%f0,	%o3
	nop
	setx	0xE1C4449905919977,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0x39BB11FA0DB61B4F,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	fmuld	%f28,	%f0,	%f2
	call	loop_210
loop_209:
	xor	%i0,	0x12E0,	%i5
	fmovrdne	%l3,	%f2,	%f4
	call	loop_211
loop_210:
	fbg,pn	%fcc2,	loop_212
	edge8ln	%l4,	%g2,	%g4
	fmovrslz	%g3,	%f19,	%f17
loop_211:
	fxors	%f20,	%f31,	%f31
loop_212:
	rdpr	%cwp,	%i6
	call	loop_213
	call	loop_214
	movrgz	%o6,	%o4,	%o5
	movug	%fcc2,	%i1,	%i7
loop_213:
	nop
	setx	0x19B65041DFC33622,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0x01081FBB,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	fsmuld	%f24,	%f26,	%f18
loop_214:
	nop
	setx	loop_215,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x012100001401,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	rd	%pc,	%l0
	call	loop_216
	call	loop_217
loop_215:
	fornot1s	%f16,	%f30,	%f3
	fmovso	%fcc3,	%f11,	%f0
loop_216:
	nop
	fitos	%f3,	%f11
	fstoi	%f11,	%f5
loop_217:
	mulx	%i2,	0x0F05,	%l2
	call	loop_218
	nop
	fitos	%f1,	%f12
	fstod	%f12,	%f4
	movcs	%xcc,	0x374,	%o2
	call	loop_219
loop_218:
	fmovdne	%icc,	%f8,	%f8
	movul	%fcc2,	0x526,	%g1
	call	loop_220
loop_219:
	fcmped	%fcc2,	%f22,	%f16
	movne	%fcc1,	0x322,	%g5
	brnz,a	%i4,	loop_221
loop_220:
	and	%g7,	%l5,	%g6
	fcmpes	%fcc3,	%f5,	%f6
	call	loop_222
loop_221:
	st	%f8,	[%l7 + 0x0C]
	call	loop_223
	or	%i3,	%l6,	%l1
loop_222:
	call	loop_224
	call	loop_225
loop_223:
	rdpr	%canrestore,	%o0
	tle	%xcc,	0x3
loop_224:
	or	%o7,	%o3,	%o1
loop_225:
	fmovdule	%fcc0,	%f20,	%f4
	fzeros	%f27
	call	loop_226
	rdhpr	%ver,	%i0
	fmovdue	%fcc1,	%f2,	%f26
	st	%f28,	[%l7 + 0x50]
loop_226:
	nop
	set	0x5C, %o5
	sth	%i5,	[%l7 + %o5]
	fnegs	%f19,	%f12
	srlx	%l4,	%g2,	%g4
	fmovdlg	%fcc3,	%f8,	%f28
	brz,a,pt	%l3,	loop_227
	call	loop_228
	call	loop_229
	ta	%xcc,	0x1
loop_227:
	call	loop_230
loop_228:
	tcs	%icc,	0x2
loop_229:
	fpsub16s	%f16,	%f4,	%f13
	fmovdgu	%icc,	%f20,	%f26
loop_230:
	movneg	%icc,	%i6,	%g3
	fabsd	%f18,	%f24
	rdhpr	%hintp,	%o6
	call	loop_231
	fcmps	%fcc2,	%f13,	%f31
	tcs	%icc,	0x0
	smul	%o4,	%i1,	%i7
loop_231:
	brlz,pt	%l0,	loop_232
	call	loop_233
	rdpr	%canrestore,	%i2
	call	loop_234
loop_232:
	brgez,pt	%l2,	loop_235
loop_233:
	rdpr	%canrestore,	%o5
	sir	0x1398
loop_234:
	call	loop_236
loop_235:
	call	loop_237
	call	loop_238
	call	loop_239
loop_236:
	xnorcc	%g1,	0x1C91,	%o2
loop_237:
	fxor	%f26,	%f8,	%f20
loop_238:
	fmovsvc	%xcc,	%f15,	%f1
loop_239:
	call	loop_240
	fmovsvs	%icc,	%f5,	%f17
	fzero	%f4
	tg	%xcc,	0x4
loop_240:
	andcc	%i4,	%g5,	%l5
	fmovsleu	%xcc,	%f31,	%f19
	edge16	%g6,	%g7,	%i3
	call	loop_241
	ba,a,pt	%icc,	loop_242
	call	loop_243
	edge16n	%l6,	%l1,	%o7
loop_241:
	call	loop_244
loop_242:
	brz,a,pt	%o3,	loop_245
loop_243:
	nop
	set	0x18, %l5
	std	%o0,	[%l7 + %l5]
	fbge	%fcc1,	loop_246
loop_244:
	fmovdug	%fcc2,	%f2,	%f24
loop_245:
	call	loop_247
	fmovdu	%fcc0,	%f14,	%f26
loop_246:
	tvs	%xcc,	0x5
	fmovrdne	%i0,	%f24,	%f24
loop_247:
	tleu	%xcc,	0x6
	movge	%xcc,	0x7AA,	%o0
	nop
	fitod	%f2,	%f28
	fdtoi	%f28,	%f5
	nop
	fitos	%f8,	%f5
	fstoi	%f5,	%f5
	call	loop_248
	fmovrdne	%i5,	%f18,	%f18
	fmovsul	%fcc1,	%f27,	%f19
	fmovsa	%xcc,	%f10,	%f0
loop_248:
	call	loop_249
	fpsub16s	%f11,	%f1,	%f14
	wr	%g2,	0x08A7,	%clear_softint
	call	loop_250
loop_249:
	call	loop_251
	fpadd16	%f6,	%f20,	%f22
	membar	#Sync
	set	0x40, %l1
	ldda	[%l7 + %l1] 0xf1,	%f16
loop_250:
	fmovdcc	%xcc,	%f18,	%f4
loop_251:
	wrpr	%g4,	0x1BC0,	%cwp
	fcmpeq16	%f28,	%f12,	%l3
	call	loop_252
	call	loop_253
	call	loop_254
	fpadd32s	%f22,	%f11,	%f3
loop_252:
	fnegs	%f27,	%f29
loop_253:
	call	loop_255
loop_254:
	fmovdgu	%xcc,	%f2,	%f28
	fmovdn	%fcc2,	%f0,	%f22
	taddcctv	%l4,	0x1809,	%i6
loop_255:
	fnegd	%f4,	%f0
	fmovsule	%fcc1,	%f20,	%f21
	sir	0x1BD4
	rd	%pc,	%o6
	movgu	%icc,	0x2A0,	%g3
	fmovsule	%fcc0,	%f16,	%f0
	fmovsg	%fcc1,	%f12,	%f20
	ld	[%l7 + 0x58],	%f16
	movrlz	%i1,	%o4,	%i7
	rdhpr	%hpstate,	%i2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	edge32n	%o5,	%l0,	%o2
	bg	%icc,	loop_256
	subc	%i4,	0x0E56,	%g5
	rd	%tick_cmpr,	%g1
	fmovrdlz	%l5,	%f28,	%f22
loop_256:
	nop
	set	0x24, %o0
	prefetch	[%l7 + %o0],	 2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x1C6, 	%sys_tick_cmpr
	bcs	%xcc,	loop_257
	xnor	%g7,	%l6,	%i3
	fandnot1s	%f6,	%f18,	%f31
	fmovdule	%fcc0,	%f6,	%f6
loop_257:
	fexpand	%f5,	%f24
	call	loop_258
	fandnot1	%f6,	%f6,	%f28
	nop
	fitos	%f1,	%f5
	fstox	%f5,	%f24
	fxtos	%f24,	%f10
	ta	%xcc,	0x3
loop_258:
	xnor	%o7,	0x11DA,	%l1
	fmovrsgez	%o1,	%f0,	%f24
	move	%fcc2,	0x25B,	%i0
	fnot2s	%f9,	%f3
	fpack16	%f10,	%f31
	nop
	set	0x79, %g3
	ldstub	[%l7 + %g3],	%o0
	srax	%o3,	%g2,	%i5
	call	loop_259
	fandnot1	%f24,	%f16,	%f4
	array16	%g4,	%l4,	%l3
	bshuffle	%f24,	%f22,	%f10
loop_259:
	call	loop_260
	fpadd16	%f8,	%f2,	%f18
	call	loop_261
	call	loop_262
loop_260:
	andn	%o6,	0x10F4,	%g3
	nop
	set	0x40, %o7
	stx	%fsr,	[%l7 + %o7]
loop_261:
	fsrc1	%f0,	%f30
loop_262:
	fnot1	%f4,	%f4
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 3:
!
!	Type l   	: 9
!	Type a   	: 14
!	Type x   	: 1
!	Type cti   	: 58
!	Type f   	: 72
!	Type i   	: 46
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
	set	0x3,	%g1
	set	0xA,	%g2
	set	0x0,	%g3
	set	0x4,	%g4
	set	0xA,	%g5
	set	0x0,	%g6
	set	0x7,	%g7
	!# Input registers
	set	-0x3,	%i0
	set	-0xE,	%i1
	set	-0xF,	%i2
	set	-0x4,	%i3
	set	-0x3,	%i4
	set	-0x6,	%i5
	set	-0x1,	%i6
	set	-0x5,	%i7
	!# Local registers
	set	0x18FADD8F,	%l0
	set	0x2FEE160F,	%l1
	set	0x197C1796,	%l2
	set	0x2B93B977,	%l3
	set	0x6EE25DCF,	%l4
	set	0x12A99DD1,	%l5
	set	0x251CD8CA,	%l6
	!# Output registers
	set	0x032D,	%o0
	set	-0x19AB,	%o1
	set	-0x0C0C,	%o2
	set	-0x0140,	%o3
	set	0x117A,	%o4
	set	-0x13AF,	%o5
	set	0x016E,	%o6
	set	0x0618,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0xA4614F60243B2ED6)
	INIT_TH_FP_REG(%l7,%f2,0x4DCC2DE710D109EF)
	INIT_TH_FP_REG(%l7,%f4,0xCB873947E98D9408)
	INIT_TH_FP_REG(%l7,%f6,0x3A2052A6786BE33F)
	INIT_TH_FP_REG(%l7,%f8,0x9013DC668BF6D8CF)
	INIT_TH_FP_REG(%l7,%f10,0x3FF2F28DFE9128BC)
	INIT_TH_FP_REG(%l7,%f12,0x1EB3E5F49D5026AD)
	INIT_TH_FP_REG(%l7,%f14,0xC9B0C3F8D0E7AD8B)
	INIT_TH_FP_REG(%l7,%f16,0xF59B0574923872BC)
	INIT_TH_FP_REG(%l7,%f18,0x75121D18D4B09293)
	INIT_TH_FP_REG(%l7,%f20,0x099721E63DA7EBA9)
	INIT_TH_FP_REG(%l7,%f22,0xDDEC52C2C142D36C)
	INIT_TH_FP_REG(%l7,%f24,0x59CA0055E046B503)
	INIT_TH_FP_REG(%l7,%f26,0xB79A7C1B0DE9A102)
	INIT_TH_FP_REG(%l7,%f28,0x16B9B0C47BB6B48A)
	INIT_TH_FP_REG(%l7,%f30,0xBF102F5D279F71DD)

	!# Execute Main Diag ..

	call	loop_263
	call	loop_264
	fcmped	%fcc0,	%f24,	%f22
	call	loop_265
loop_263:
	call	loop_266
loop_264:
	tvc	%icc,	0x6
	xorcc	%i1,	0x0750,	%o4
loop_265:
	fbul,a	%fcc0,	loop_267
loop_266:
	nop
	fitod	%f6,	%f18
	fdtoi	%f18,	%f2
	sethi	0x1DF8,	%i6
	call	loop_268
loop_267:
	movl	%icc,	0x6D8,	%i7
	movule	%fcc1,	0x349,	%l2
	movre	%o5,	%i2,	%l0
loop_268:
	fcmpeq32	%f12,	%f2,	%i4
	call	loop_269
	call	loop_270
	nop
	fitos	%f22,	%f12
	rdpr	%gl,	%o2
loop_269:
	edge16n	%g1,	%g5,	%l5
loop_270:
	fmovsu	%fcc1,	%f23,	%f7
	call	loop_271
	rd	%ccr,	%g6
	subccc	%l6,	%g7,	%i3
	call	loop_272
loop_271:
	nop
	setx	loop_273,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x024100001403,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fmovdul	%fcc0,	%f22,	%f14
	srl	%l1,	0x12,	%o7
loop_272:
	call	loop_274
loop_273:
	stx	%fsr,	[%l7 + 0x38]
	taddcc	%i0,	%o0,	%o3
	rdpr	%pil,	%g2
loop_274:
	call	loop_275
	xor	%o1,	%g4,	%l4
	fsrc2	%f28,	%f24
	fmovrslez	%i5,	%f16,	%f28
loop_275:
	fmovslg	%fcc3,	%f16,	%f31
	xorcc	%o6,	0x1CAB,	%g3
	mulscc	%i1,	%o4,	%l3
	fmovs	%f17,	%f29
	call	loop_276
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	fmovsgu	%xcc,	%f11,	%f18
	movlg	%fcc3,	0x515,	%i6
loop_276:
	subccc	%i7,	0x0EF1,	%o5
	fcmpgt16	%f26,	%f6,	%i2
	fmovdvc	%icc,	%f0,	%f28
	call	loop_277
	rd	%asi,	%l2
	fones	%f26
	edge8	%l0,	%i4,	%g1
loop_277:
	tcs	%icc,	0x0
	bneg	%xcc,	loop_278
	call	loop_279
	bshuffle	%f10,	%f8,	%f18
	fmovdle	%icc,	%f14,	%f4
loop_278:
	edge8	%o2,	%l5,	%g6
loop_279:
	movne	%fcc3,	0x352,	%g5
	wr	%g0,	0x19,	%asi
	ldswa	[%l7 + 0x28] %asi,	%l6
	call	loop_280
	nop
	set	0x78, %g2
	ldd	[%l7 + %g2],	%f24
	fands	%f24,	%f8,	%f8
	nop
	setx	0xD3F1C7CE,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f6
	setx	0x90DE8488,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f5
	fmuls	%f5,	%f6,	%f12
loop_280:
	subccc	%g7,	%i3,	%o7
	call	loop_281
	fmovspos	%icc,	%f18,	%f12
	fand	%f22,	%f22,	%f12
	call	loop_282
loop_281:
	xorcc	%l1,	%i0,	%o3
	call	loop_283
	movneg	%xcc,	%g2,	%o0
loop_282:
	call	loop_284
	call	loop_285
loop_283:
	bg,a	%xcc,	loop_286
	call	loop_287
loop_284:
	fandnot1	%f18,	%f16,	%f4
loop_285:
	fmovsgu	%xcc,	%f20,	%f7
loop_286:
	bcs	%xcc,	loop_288
loop_287:
	fmovd	%f0,	%f8
	tgu	%icc,	0x1
	xnor	%g4,	0x11DD,	%l4
loop_288:
	fmul8x16au	%f9,	%f19,	%f24
	sethi	0x1205,	%i5
	srl	%o1,	0x12,	%o6
	fmovdlg	%fcc0,	%f0,	%f4
	call	loop_289
	alignaddr	%i1,	%g3,	%o4
	rdhpr	%htba,	%l3
	fbne	%fcc1,	loop_290
loop_289:
	call	loop_291
	fmovda	%xcc,	%f16,	%f12
	nop
	fitod	%f4,	%f22
	fdtos	%f22,	%f15
loop_290:
	call	loop_292
loop_291:
	brnz,a	%i6,	loop_293
	fmovsvs	%xcc,	%f21,	%f6
	call	loop_294
loop_292:
	array16	%o5,	%i2,	%i7
loop_293:
	wr	%l2,	%i4,	%sys_tick
	fmovda	%icc,	%f22,	%f24
loop_294:
	call	loop_295
	alignaddr	%l0,	%o2,	%l5
	call	loop_296
	udivcc	%g1,	0x0471,	%g6
loop_295:
	sdivx	%g5,	0x1BE6,	%l6
	fmul8x16al	%f11,	%f5,	%f6
loop_296:
	alignaddrl	%i3,	%o7,	%g7
	move	%fcc1,	0x282,	%i0
	movl	%xcc,	0x73A,	%o3
	mova	%fcc3,	%g2,	%o0
	call	loop_297
	call	loop_298
	call	loop_299
	array16	%l1,	%l4,	%g4
loop_297:
	brgz,pt	%o1,	loop_300
loop_298:
	call	loop_301
loop_299:
	smulcc	%i5,	%i1,	%o6
	call	loop_302
loop_300:
	fmovsa	%fcc2,	%f26,	%f17
loop_301:
	nop
	add	%l7,	0x18,	%l6
	wr	%g0,	0x19,	%asi
	casa	[%l6] %asi,	%o4,	%l3
loop_302:
	for	%f14,	%f30,	%f24
	call	loop_303
	fmovrslez	%i6,	%f13,	%f4
	call	loop_304
	call	loop_305
loop_303:
	call	loop_306
	movpos	%icc,	%o5,	%i2
loop_304:
	brgz,a,pt	%i7,	loop_307
loop_305:
	movug	%fcc3,	0x4DF,	%l2
loop_306:
	fmovdl	%fcc3,	%f10,	%f28
	movul	%fcc3,	0x0AE,	%g3
loop_307:
	nop
	setx	0x0900,	%l1,	%l0
	sdivx	%i4,	%l0,	%o2
	call	loop_308
	call	loop_309
	rdpr	%otherwin,	%l5
	fmovsa	%fcc3,	%f14,	%f17
loop_308:
	rdpr	%otherwin,	%g1
loop_309:
	fmovsug	%fcc2,	%f23,	%f27
	call	loop_310
	call	loop_311
	call	loop_312
	nop
	setx	0x68137D9D3096C782,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	fsqrtd	%f22,	%f18
loop_310:
	bshuffle	%f4,	%f10,	%f6
loop_311:
	bcs,a	%xcc,	loop_313
loop_312:
	call	loop_314
	fmovsule	%fcc0,	%f23,	%f4
	fbug,pt	%fcc2,	loop_315
loop_313:
	call	loop_316
loop_314:
	call	loop_317
	fmovrdlez	%g5,	%f12,	%f24
loop_315:
	udivcc	%g6,	0x0520,	%l6
loop_316:
	call	loop_318
loop_317:
	siam	0x0
	fxor	%f14,	%f2,	%f28
	fmovsvc	%icc,	%f17,	%f29
loop_318:
	lduw	[%l7 + 0x18],	%o7
	tcs	%xcc,	0x2
	fpsub16s	%f5,	%f19,	%f6
	brlez,a	%g7,	loop_319
	call	loop_320
	call	loop_321
	bneg,a,pt	%xcc,	loop_322
loop_319:
	fmovrdlez	%i3,	%f0,	%f20
loop_320:
	ldsb	[%l7 + 0x3D],	%o3
loop_321:
	call	loop_323
loop_322:
	movge	%icc,	%i0,	%g2
	rdpr	%canrestore,	%l1
	te	%xcc,	0x1
loop_323:
	movuge	%fcc0,	0x53B,	%o0
	movrgez	%g4,	%o1,	%i5
	fbn,a,pn	%fcc3,	loop_324
	subc	%l4,	0x130D,	%o6
	call	loop_325
	tpos	%icc,	0x6
loop_324:
	tvc	%icc,	0x7
	nop
	setx	0x995E771BD919A7D1,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0xB056F79D,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	fsmuld	%f28,	%f16,	%f0
loop_325:
	addc	%o4,	%i1,	%l3
	fmovscs	%icc,	%f24,	%f18
	edge16n	%i6,	%i2,	%o5
	call	loop_326
	fmovrdgez	%i7,	%f12,	%f10
	fmovrse	%l2,	%f9,	%f5
	wr	%g0,	0x11,	%asi
	ldswa	[%l7 + 0x5C] %asi,	%i4
loop_326:
	fzeros	%f1
	fcmped	%fcc2,	%f8,	%f30
	fcmpne32	%f16,	%f10,	%g3
	sir	0x0AA5
	fones	%f28
	set	0x20, %i3
	ldda	[%l7 + %i3] 0x88,	%o2
	wr 	%g0, 	0x5, 	%fprs
	call	loop_327
	fmovsge	%icc,	%f13,	%f7
	call	loop_328
	movn	%icc,	%l5,	%g5
loop_327:
	rdhpr	%hintp,	%g6
	fpack16	%f16,	%f27
loop_328:
	call	loop_329
loop_329:
	nop

	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 4:
!
!	Type l   	: 8
!	Type a   	: 11
!	Type x   	: 4
!	Type cti   	: 67
!	Type f   	: 55
!	Type i   	: 55
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
	set	0xC,	%g3
	set	0x3,	%g4
	set	0xB,	%g5
	set	0x6,	%g6
	set	0xB,	%g7
	!# Input registers
	set	-0x9,	%i0
	set	-0x1,	%i1
	set	-0xA,	%i2
	set	-0xB,	%i3
	set	-0xE,	%i4
	set	-0x4,	%i5
	set	-0x5,	%i6
	set	-0x1,	%i7
	!# Local registers
	set	0x6C6F6024,	%l0
	set	0x17F0C020,	%l1
	set	0x471490F4,	%l2
	set	0x55D4CAA7,	%l3
	set	0x2500E4DF,	%l4
	set	0x0C4D47A1,	%l5
	set	0x52B173A4,	%l6
	!# Output registers
	set	-0x0964,	%o0
	set	-0x1726,	%o1
	set	0x1B92,	%o2
	set	-0x10EB,	%o3
	set	0x04A8,	%o4
	set	0x07A4,	%o5
	set	0x0F34,	%o6
	set	0x0518,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0xA4614F60243B2ED6)
	INIT_TH_FP_REG(%l7,%f2,0x4DCC2DE710D109EF)
	INIT_TH_FP_REG(%l7,%f4,0xCB873947E98D9408)
	INIT_TH_FP_REG(%l7,%f6,0x3A2052A6786BE33F)
	INIT_TH_FP_REG(%l7,%f8,0x9013DC668BF6D8CF)
	INIT_TH_FP_REG(%l7,%f10,0x3FF2F28DFE9128BC)
	INIT_TH_FP_REG(%l7,%f12,0x1EB3E5F49D5026AD)
	INIT_TH_FP_REG(%l7,%f14,0xC9B0C3F8D0E7AD8B)
	INIT_TH_FP_REG(%l7,%f16,0xF59B0574923872BC)
	INIT_TH_FP_REG(%l7,%f18,0x75121D18D4B09293)
	INIT_TH_FP_REG(%l7,%f20,0x099721E63DA7EBA9)
	INIT_TH_FP_REG(%l7,%f22,0xDDEC52C2C142D36C)
	INIT_TH_FP_REG(%l7,%f24,0x59CA0055E046B503)
	INIT_TH_FP_REG(%l7,%f26,0xB79A7C1B0DE9A102)
	INIT_TH_FP_REG(%l7,%f28,0x16B9B0C47BB6B48A)
	INIT_TH_FP_REG(%l7,%f30,0xBF102F5D279F71DD)

	!# Execute Main Diag ..

	nop
	setx	0x13D764CA,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f8
	setx	0x731DEA73,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f10
	fsubs	%f10,	%f8,	%f16
	tcc	%icc,	0x3
	movuge	%fcc2,	%o7,	%g7
	fandnot1	%f20,	%f26,	%f12
	call	loop_330
	call	loop_331
	call	loop_332
	call	loop_333
loop_330:
	call	loop_334
loop_331:
	call	loop_335
loop_332:
	fmovda	%icc,	%f26,	%f22
loop_333:
	st	%fsr,	[%l7 + 0x0C]
loop_334:
	call	loop_336
loop_335:
	umul	%i3,	%l6,	%o3
	xor	%i0,	%l1,	%g2
	fnand	%f2,	%f22,	%f12
loop_336:
	fnand	%f6,	%f20,	%f18
	andn	%o0,	%o1,	%g4
	nop
	fitos	%f5,	%f24
	fcmple32	%f26,	%f22,	%l4
	call	loop_337
	call	loop_338
	call	loop_339
	array8	%i5,	%o4,	%i1
loop_337:
	call	loop_340
loop_338:
	srl	%l3,	%i6,	%o6
loop_339:
	sll	%o5,	0x19,	%i7
	call	loop_341
loop_340:
	fcmpne16	%f24,	%f28,	%l2
	call	loop_342
	bleu	%icc,	loop_343
loop_341:
	fcmpeq16	%f4,	%f24,	%i2
	call	loop_344
loop_342:
	fone	%f12
loop_343:
	call	loop_345
	fxnor	%f8,	%f12,	%f0
loop_344:
	fmovsneg	%icc,	%f24,	%f12
	call	loop_346
loop_345:
	fmovsu	%fcc1,	%f2,	%f14
	call	loop_347
	fsrc2s	%f3,	%f9
loop_346:
	tge	%xcc,	0x3
	subc	%g3,	0x0835,	%o2
loop_347:
	fcmple32	%f22,	%f4,	%l0
	call	loop_348
	array8	%i4,	%g1,	%g5
	call	loop_349
	call	loop_350
loop_348:
	fmovslg	%fcc0,	%f26,	%f15
	fmovdvc	%icc,	%f4,	%f10
loop_349:
	nop
	setx	0xAE1AC5B3,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f0
	setx	0x878FCC70,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f13
	fsubs	%f13,	%f0,	%f19
loop_350:
	fmuld8sux16	%f10,	%f21,	%f10
	fpmerge	%f19,	%f3,	%f0
	set	0x18, %g4
	lduwa	[%l7 + %g4] 0x89,	%g6
	fzeros	%f18
	fandnot1s	%f20,	%f4,	%f23
	addc	%o7,	0x06A4,	%g7
	edge32l	%i3,	%l5,	%o3
	movg	%fcc3,	0x498,	%i0
	srax	%l1,	0x15,	%g2
	tcc	%xcc,	0x5
	fcmple32	%f6,	%f4,	%o0
	call	loop_351
	nop
	fitod	%f13,	%f0
	be,a	%icc,	loop_352
	wr	%l6,	0x0C1F,	%sys_tick
loop_351:
	call	loop_353
	tneg	%icc,	0x5
loop_352:
	umul	%g4,	0x03E3,	%l4
	fbuge,a,pt	%fcc3,	loop_354
loop_353:
	fcmped	%fcc3,	%f30,	%f28
	movg	%icc,	0x2B8,	%i5
	array16	%o4,	%o1,	%l3
loop_354:
	movg	%xcc,	%i6,	%o6
	brz	%o5,	loop_355
	bgu,pt	%xcc,	loop_356
	nop
	fitod	%f2,	%f30
	fdtoi	%f30,	%f22
	bmask	%i1,	%l2,	%i2
loop_355:
	fmovdvc	%icc,	%f0,	%f20
loop_356:
	fmovrdgz	%i7,	%f0,	%f8
	xnorcc	%o2,	%l0,	%g3
	fpsub32	%f0,	%f2,	%f6
	call	loop_357
	ldd	[%l7 + 0x58],	%f4
	fmovdug	%fcc2,	%f30,	%f14
	fcmple16	%f4,	%f26,	%g1
loop_357:
	nop
	setx	0x19B018ED3F1AE8BE,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0x9E485A92529B1F89,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	faddd	%f10,	%f20,	%f18
	edge16l	%g5,	%g6,	%o7
	taddcctv	%i4,	0x0D4A,	%i3
	call	loop_358
	edge16ln	%l5,	%g7,	%i0
	nop
	setx	0x0D19,	%l0,	%g2
	sdiv	%l1,	%g2,	%o0
	call	loop_359
loop_358:
	call	loop_360
	call	loop_361
	call	loop_362
loop_359:
	call	loop_363
loop_360:
	fmovrsgz	%o3,	%f10,	%f12
loop_361:
	fmovd	%f18,	%f8
loop_362:
	call	loop_364
loop_363:
	nop
	setx	0x3B7EBF0691930F89,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	setx	0x0A670A714C906231,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	fdivd	%f18,	%f18,	%f20
	or	%g4,	0x10D1,	%l6
	rd	%asi,	%l4
loop_364:
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	orn	%o4,	0x14BC,	%i5
	call	loop_365
	call	loop_366
	call	loop_367
	call	loop_368
loop_365:
	call	loop_369
loop_366:
	edge8l	%l3,	%i6,	%o6
loop_367:
	addcc	%o1,	%i1,	%l2
loop_368:
	andcc	%o5,	%i7,	%i2
loop_369:
	taddcctv	%o2,	%g3,	%g1
	fpack16	%f24,	%f17
	fxnor	%f30,	%f10,	%f16
	fxor	%f12,	%f20,	%f8
	fmovsu	%fcc0,	%f26,	%f19
	fmovdul	%fcc3,	%f22,	%f2
	nop
	setx	0x831FF72DD57BDC1E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0xF690C8DC58F230E7,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	faddd	%f20,	%f26,	%f4
	fpack16	%f16,	%f21
	call	loop_370
	sdiv	%l0,	0x112F,	%g5
	fxnor	%f0,	%f16,	%f26
	sethi	0x1336,	%g6
loop_370:
	fmovscs	%icc,	%f30,	%f0
	call	loop_371
	bl,a	%icc,	loop_372
	wr	%i4,	0x1DC1,	%sys_tick
	fmovsge	%fcc1,	%f25,	%f17
loop_371:
	fandnot1s	%f5,	%f24,	%f4
loop_372:
	for	%f10,	%f20,	%f14
	call	loop_373
	call	loop_374
	movcc	%icc,	0x7FB,	%o7
	call	loop_375
loop_373:
	subcc	%i3,	%l5,	%g7
loop_374:
	bne,pn	%icc,	loop_376
	call	loop_377
loop_375:
	movvc	%xcc,	0x0BD,	%i0
	fmovrslz	%l1,	%f5,	%f22
loop_376:
	fnegs	%f9,	%f12
loop_377:
	call	loop_378
	nop
	setx	0x9D417166,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f30
	setx	0x40DBDCEA,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f31
	fsubs	%f31,	%f30,	%f26
	brz,a,pn	%o0,	loop_379
	fmul8x16	%f16,	%f28,	%f18
loop_378:
	call	loop_380
	nop
	setx loop_381, %l0, %l1
	jmpl %l1, %g2
loop_379:
	call	loop_382
	fmovdule	%fcc2,	%f10,	%f16
loop_380:
	movleu	%xcc,	%g4,	%o3
loop_381:
	fornot2	%f30,	%f16,	%f16
loop_382:
	rdpr	%tba,	%l4
	fpadd32	%f0,	%f20,	%f18
	fsrc2s	%f25,	%f29
	nop
	setx	0x9E4DF8D31D0A7AB8,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0xA90E6AC7,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	fsmuld	%f20,	%f14,	%f26
	rdpr	%wstate,	%o4
	fsrc2	%f2,	%f26
	nop
	setx	0x57CF482B,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f20
	fsqrts	%f20,	%f29
	call	loop_383
	pdist	%f18,	%f30,	%f26
	wr	%l6,	0x0FA9,	%y
	brz,a	%l3,	loop_384
loop_383:
	move	%icc,	0x1B4,	%i6
	fpackfix	%f14,	%f23
	fpack16	%f0,	%f27
loop_384:
	movlg	%fcc1,	0x342,	%o6
	bne	%xcc,	loop_385
	brlez,pt	%i5,	loop_386
	fone	%f6
	xnor	%o1,	0x0BD6,	%l2
loop_385:
	fand	%f4,	%f2,	%f28
loop_386:
	bvs,pn	%xcc,	loop_387
	andcc	%i1,	0x0428,	%i7
	fmovrdlz	%i2,	%f30,	%f8
	nop
	fitod	%f12,	%f18
	fdtoi	%f18,	%f27
loop_387:
	andn	%o5,	0x16E8,	%o2
	fmovduge	%fcc2,	%f8,	%f4
	call	loop_388
	movpos	%icc,	0x3C3,	%g1
	nop
	setx	0x6668389C,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f4
	setx	0x3D524FF9,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f15
	fmuls	%f15,	%f4,	%f28
	movo	%fcc1,	%l0,	%g5
loop_388:
	fxnor	%f16,	%f4,	%f14
	fmul8ulx16	%f16,	%f26,	%f6
	fmovdlg	%fcc3,	%f0,	%f18
	nop
	setx	0x55F44CEFE7EF2DC2,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0x352523AA9DAEF932,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	faddd	%f10,	%f0,	%f4
	ldd	[%l7 + 0x60],	%g2
	fnand	%f24,	%f8,	%f10
	subccc	%i4,	%g6,	%o7
	tg	%icc,	0x5
	fmovrsgz	%l5,	%f27,	%f14
	call	loop_389
	fcmpne16	%f8,	%f10,	%i3
	call	loop_390
	call	loop_391
loop_389:
	sra	%i0,	0x16,	%l1
	call	loop_392
loop_390:
	faligndata	%f2,	%f28,	%f16
loop_391:
	xorcc	%g7,	0x073F,	%g2
loop_392:
	nop

	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 5:
!
!	Type l   	: 4
!	Type a   	: 6
!	Type x   	: 1
!	Type cti   	: 63
!	Type f   	: 75
!	Type i   	: 51
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
	set	0xB,	%g4
	set	0x8,	%g5
	set	0x0,	%g6
	set	0x5,	%g7
	!# Input registers
	set	-0xA,	%i0
	set	-0x5,	%i1
	set	-0x5,	%i2
	set	-0xF,	%i3
	set	-0xE,	%i4
	set	-0x1,	%i5
	set	-0xE,	%i6
	set	-0x6,	%i7
	!# Local registers
	set	0x3591A3DD,	%l0
	set	0x0B4FC34D,	%l1
	set	0x43FA97F8,	%l2
	set	0x70D361CE,	%l3
	set	0x0AC3C4FF,	%l4
	set	0x32B39907,	%l5
	set	0x714872FB,	%l6
	!# Output registers
	set	0x04CF,	%o0
	set	-0x0DCC,	%o1
	set	0x1300,	%o2
	set	0x05E7,	%o3
	set	0x18D2,	%o4
	set	0x1B54,	%o5
	set	0x01BD,	%o6
	set	-0x1BF2,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0xA4614F60243B2ED6)
	INIT_TH_FP_REG(%l7,%f2,0x4DCC2DE710D109EF)
	INIT_TH_FP_REG(%l7,%f4,0xCB873947E98D9408)
	INIT_TH_FP_REG(%l7,%f6,0x3A2052A6786BE33F)
	INIT_TH_FP_REG(%l7,%f8,0x9013DC668BF6D8CF)
	INIT_TH_FP_REG(%l7,%f10,0x3FF2F28DFE9128BC)
	INIT_TH_FP_REG(%l7,%f12,0x1EB3E5F49D5026AD)
	INIT_TH_FP_REG(%l7,%f14,0xC9B0C3F8D0E7AD8B)
	INIT_TH_FP_REG(%l7,%f16,0xF59B0574923872BC)
	INIT_TH_FP_REG(%l7,%f18,0x75121D18D4B09293)
	INIT_TH_FP_REG(%l7,%f20,0x099721E63DA7EBA9)
	INIT_TH_FP_REG(%l7,%f22,0xDDEC52C2C142D36C)
	INIT_TH_FP_REG(%l7,%f24,0x59CA0055E046B503)
	INIT_TH_FP_REG(%l7,%f26,0xB79A7C1B0DE9A102)
	INIT_TH_FP_REG(%l7,%f28,0x16B9B0C47BB6B48A)
	INIT_TH_FP_REG(%l7,%f30,0xBF102F5D279F71DD)

	!# Execute Main Diag ..

	call	loop_393
	call	loop_394
	call	loop_395
	brlez,a,pn	%o0,	loop_396
loop_393:
	pdist	%f14,	%f12,	%f28
loop_394:
	rdpr	%cleanwin,	%g4
loop_395:
	edge16l	%l4,	%o4,	%l6
loop_396:
	call	loop_397
	call	loop_398
	bmask	%o3,	%i6,	%o6
	fnot2	%f24,	%f12
loop_397:
	movn	%fcc0,	%l3,	%i5
loop_398:
	fcmpne32	%f22,	%f22,	%l2
	call	loop_399
	brlz,a	%i1,	loop_400
	nop
	setx	0x800FF27E4ACABDFE,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0x8C4EEAA59923AEB9,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	fdivd	%f2,	%f20,	%f14
	rdpr	%cansave,	%o1
loop_399:
	movuge	%fcc1,	0x2DB,	%i2
loop_400:
	mulx	%i7,	%o5,	%o2
	call	loop_401
	fmovdvs	%icc,	%f6,	%f20
	call	loop_402
	st	%fsr,	[%l7 + 0x40]
loop_401:
	xnor	%l0,	0x0848,	%g1
	fmovdu	%fcc1,	%f6,	%f16
loop_402:
	movle	%fcc3,	%g5,	%i4
	rdhpr	%hsys_tick_cmpr,	%g6
	fmovsgu	%xcc,	%f20,	%f15
	fmovsl	%fcc3,	%f14,	%f0
	nop
	setx loop_403, %l0, %l1
	jmpl %l1, %g3
	nop
	setx	0x27C6162CDEACFE48,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0x742CE25E,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	fsmuld	%f28,	%f2,	%f30
	fbue,a,pt	%fcc3,	loop_404
	tsubcctv	%o7,	%i3,	%i0
loop_403:
	nop
	wr	%g0,	0x80,	%asi
	prefetcha	[%l7 + 0x28] %asi,	 1
loop_404:
	movrlez	%l1,	%g7,	%o0
	call	loop_405
	call	loop_406
	be	%icc,	loop_407
	nop
	setx	0x3DD4D36C1FC6DE1C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0x1FCA56D3,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	fsmuld	%f26,	%f28,	%f18
loop_405:
	wrpr 	%g0, 	0x1, 	%gl
loop_406:
	fmovrdgz	%l4,	%f18,	%f26
loop_407:
	fpadd16	%f28,	%f10,	%f14
	bcs,pt	%xcc,	loop_408
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	array32	%g4,	%o4,	%l6
	call	loop_409
loop_408:
	rd	%ccr,	%o3
	fsrc2	%f0,	%f6
	wr	%g0,	0x11,	%asi
	stha	%i6,	[%l7 + 0x56] %asi
loop_409:
	sir	0x0380
	movvs	%icc,	%o6,	%l3
	call	loop_410
	rdpr	%cwp,	%i5
	rdpr	%gl,	%i1
	fmul8x16au	%f20,	%f13,	%f8
loop_410:
	call	loop_411
	movuge	%fcc1,	0x20D,	%l2
	edge16l	%o1,	%i2,	%o5
	fmovde	%fcc1,	%f22,	%f28
loop_411:
	rd	%asi,	%o2
	fmovrslez	%i7,	%f10,	%f30
	st	%fsr,	[%l7 + 0x78]
	add	%l7,	0x44,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%l0
	casa	[%l6] 0x80,	%l0,	%g5
	call	loop_412
	call	loop_413
	fpsub32s	%f0,	%f7,	%f8
	call	loop_414
loop_412:
	call	loop_415
loop_413:
	and	%g1,	%i4,	%g6
	tleu	%icc,	0x4
loop_414:
	nop
	setx	0x0BD9,	%l0,	%i3
	sdivx	%g3,	%i3,	%i0
loop_415:
	fmovdvs	%xcc,	%f10,	%f4
	movvs	%icc,	%l5,	%o7
	call	loop_416
	call	loop_417
	fornot1s	%f15,	%f16,	%f4
	srlx	%l1,	0x10,	%g7
loop_416:
	call	loop_418
loop_417:
	call	loop_419
	call	loop_420
	edge16l	%o0,	%g2,	%l4
loop_418:
	call	loop_421
loop_419:
	call	loop_422
loop_420:
	call	loop_423
	call	loop_424
loop_421:
	call	loop_425
loop_422:
	movg	%icc,	0x5C5,	%o4
loop_423:
	call	loop_426
loop_424:
	fnors	%f23,	%f19,	%f6
loop_425:
	call	loop_427
	call	loop_428
loop_426:
	call	loop_429
	call	loop_430
loop_427:
	fmovrsgz	%l6,	%f1,	%f25
loop_428:
	call	loop_431
loop_429:
	fcmple16	%f12,	%f24,	%g4
loop_430:
	bpos,a	%xcc,	loop_432
	call	loop_433
loop_431:
	call	loop_434
	sir	0x1AF6
loop_432:
	array16	%i6,	%o6,	%l3
loop_433:
	wrpr	%i5,	0x108E,	%pil
loop_434:
	ba,a	%xcc,	loop_435
	fbu,a	%fcc1,	loop_436
	fmovrslz	%i1,	%f22,	%f29
	flushw
loop_435:
	call	loop_437
loop_436:
	call	loop_438
	fmovso	%fcc1,	%f6,	%f5
	call	loop_439
loop_437:
	fbo,pn	%fcc2,	loop_440
loop_438:
	bne,a,pt	%icc,	loop_441
	fmul8x16al	%f21,	%f17,	%f6
loop_439:
	be,pn	%xcc,	loop_442
loop_440:
	brnz	%l2,	loop_443
loop_441:
	movle	%icc,	0x0C8,	%o3
	fmovdne	%fcc0,	%f0,	%f16
loop_442:
	call	loop_444
loop_443:
	fmovdg	%xcc,	%f24,	%f4
	tcc	%xcc,	0x2
	fmul8ulx16	%f2,	%f12,	%f12
loop_444:
	call	loop_445
	brlz,a,pn	%o1,	loop_446
	fcmple32	%f30,	%f2,	%i2
	fmovrde	%o5,	%f8,	%f10
loop_445:
	fsrc1s	%f22,	%f5
loop_446:
	call	loop_447
	movn	%fcc3,	0x610,	%i7
	call	loop_448
	fmovdge	%fcc0,	%f30,	%f10
loop_447:
	edge8	%o2,	%l0,	%g5
	tleu	%icc,	0x3
loop_448:
	movuge	%fcc1,	%i4,	%g6
	fxnors	%f14,	%f0,	%f0
	umulcc	%g3,	%g1,	%i0
	fpsub16	%f22,	%f18,	%f22
	and	%i3,	%l5,	%l1
	rd	%pc,	%g7
	fandnot1s	%f16,	%f26,	%f10
	fnegd	%f6,	%f2
	fmuld8ulx16	%f11,	%f19,	%f8
	tl	%xcc,	0x1
	call	loop_449
	fmovscc	%xcc,	%f30,	%f21
	movg	%fcc2,	%o7,	%g2
	call	loop_450
loop_449:
	fnot2	%f22,	%f26
	call	loop_451
	movue	%fcc2,	%o0,	%o4
loop_450:
	nop
	setx	loop_452,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x001100001407,	%l0,	%l1
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
	orn	%l4,	%g4,	%l6
loop_451:
	call	loop_453
	fmovrdgez	%i6,	%f0,	%f6
loop_452:
	nop
	set	0x2F, %o4
	ldsba	[%l7 + %o4] 0x10,	%o6
loop_453:
	sllx	%l3,	%i1,	%i5
	fsrc2	%f30,	%f14
	bshuffle	%f30,	%f28,	%f6
	movue	%fcc2,	0x7BD,	%l2
	fand	%f2,	%f22,	%f16
	addcc	%o3,	%i2,	%o5
	fba,a	%fcc3,	loop_454
	fsrc2	%f14,	%f0
	bne,pt	%xcc,	loop_455
	call	loop_456
loop_454:
	call	loop_457
	movle	%fcc3,	%o1,	%o2
loop_455:
	nop
	set	0x70, %l4
	prefetcha	[%l7 + %l4] 0x89,	 3
loop_456:
	call	loop_458
loop_457:
	movul	%fcc1,	%g5,	%i4
	fmovso	%fcc2,	%f12,	%f24
	fmovsuge	%fcc3,	%f19,	%f6
loop_458:
	call	loop_459
	fornot2s	%f5,	%f27,	%f18
	subcc	%i7,	%g6,	%g3
	nop
	set	0x6C, %l3
	swap	[%l7 + %l3],	%i0
loop_459:
	call	loop_460
	fmovsneg	%xcc,	%f20,	%f18
	wr	%g0,	0x2f,	%asi
	ldda	[%l7 + 0x30] %asi,	%g0
loop_460:
	call	loop_461
	wrpr	%i3,	0x01A0,	%pil
	call	loop_462
	fmovsleu	%icc,	%f27,	%f9
loop_461:
	mulx	%l1,	0x03C1,	%l5
	fnegs	%f14,	%f24
loop_462:
	nop
	fitod	%f10,	%f18
	fdtox	%f18,	%f26
	fxtod	%f26,	%f12
	fxor	%f20,	%f18,	%f14
	fands	%f16,	%f30,	%f30
	bn	%xcc,	loop_463
	alignaddrl	%o7,	%g7,	%o0
	fmovsge	%fcc2,	%f10,	%f9
	movgu	%xcc,	%o4,	%g2
loop_463:
	fmovrslez	%g4,	%f18,	%f8
	call	loop_464
	fmovdul	%fcc2,	%f24,	%f26
loop_464:
	nop

	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 6:
!
!	Type l   	: 9
!	Type a   	: 11
!	Type x   	: 6
!	Type cti   	: 72
!	Type f   	: 56
!	Type i   	: 46
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
	set	0x8,	%g1
	set	0xF,	%g2
	set	0x8,	%g3
	set	0x9,	%g4
	set	0x5,	%g5
	set	0xF,	%g6
	set	0x6,	%g7
	!# Input registers
	set	-0xC,	%i0
	set	-0xE,	%i1
	set	-0x5,	%i2
	set	-0xA,	%i3
	set	-0xC,	%i4
	set	-0x2,	%i5
	set	-0x9,	%i6
	set	-0x3,	%i7
	!# Local registers
	set	0x03F92CEC,	%l0
	set	0x1FF90E53,	%l1
	set	0x0769A1E3,	%l2
	set	0x600A6E08,	%l3
	set	0x40E40A3A,	%l4
	set	0x3308F30B,	%l5
	set	0x4B400914,	%l6
	!# Output registers
	set	0x0389,	%o0
	set	0x168D,	%o1
	set	0x1695,	%o2
	set	-0x0F76,	%o3
	set	-0x1CA4,	%o4
	set	0x1E80,	%o5
	set	-0x0A7C,	%o6
	set	-0x17A1,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0xA4614F60243B2ED6)
	INIT_TH_FP_REG(%l7,%f2,0x4DCC2DE710D109EF)
	INIT_TH_FP_REG(%l7,%f4,0xCB873947E98D9408)
	INIT_TH_FP_REG(%l7,%f6,0x3A2052A6786BE33F)
	INIT_TH_FP_REG(%l7,%f8,0x9013DC668BF6D8CF)
	INIT_TH_FP_REG(%l7,%f10,0x3FF2F28DFE9128BC)
	INIT_TH_FP_REG(%l7,%f12,0x1EB3E5F49D5026AD)
	INIT_TH_FP_REG(%l7,%f14,0xC9B0C3F8D0E7AD8B)
	INIT_TH_FP_REG(%l7,%f16,0xF59B0574923872BC)
	INIT_TH_FP_REG(%l7,%f18,0x75121D18D4B09293)
	INIT_TH_FP_REG(%l7,%f20,0x099721E63DA7EBA9)
	INIT_TH_FP_REG(%l7,%f22,0xDDEC52C2C142D36C)
	INIT_TH_FP_REG(%l7,%f24,0x59CA0055E046B503)
	INIT_TH_FP_REG(%l7,%f26,0xB79A7C1B0DE9A102)
	INIT_TH_FP_REG(%l7,%f28,0x16B9B0C47BB6B48A)
	INIT_TH_FP_REG(%l7,%f30,0xBF102F5D279F71DD)

	!# Execute Main Diag ..

	fmovdl	%fcc3,	%f28,	%f8
	fmovdge	%fcc2,	%f8,	%f22
	call	loop_465
	fcmped	%fcc2,	%f0,	%f20
	rdhpr	%hsys_tick_cmpr,	%l4
	tne	%xcc,	0x2
loop_465:
	call	loop_466
	tg	%icc,	0x0
	call	loop_467
	call	loop_468
loop_466:
	wrpr 	%g0, 	0x3, 	%gl
	fpack16	%f18,	%f10
loop_467:
	call	loop_469
loop_468:
	call	loop_470
	rdpr	%wstate,	%l6
	fmovrdne	%l3,	%f4,	%f14
loop_469:
	call	loop_471
loop_470:
	movuge	%fcc1,	%o6,	%i5
	movrgez	%l2,	%o3,	%i1
	call	loop_472
loop_471:
	call	loop_473
	faligndata	%f2,	%f6,	%f24
	nop
	setx	0x97AB5AE0C5B45606,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0x0F9FB273,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	fsmuld	%f2,	%f10,	%f0
loop_472:
	call	loop_474
loop_473:
	call	loop_475
	tleu	%xcc,	0x7
	siam	0x0
loop_474:
	umulcc	%i2,	0x1E6A,	%o1
loop_475:
	umulcc	%o2,	0x1FC1,	%l0
	fmul8x16al	%f3,	%f5,	%f24
	nop
	fitos	%f1,	%f13
	fstox	%f13,	%f24
	fbule,a	%fcc3,	loop_476
	movo	%fcc3,	0x297,	%o5
	call	loop_477
	fmovdne	%fcc2,	%f2,	%f24
loop_476:
	call	loop_478
	call	loop_479
loop_477:
	tleu	%xcc,	0x1
	lduw	[%l7 + 0x18],	%g5
loop_478:
	nop
	setx loop_480, %l0, %l1
	jmpl %l1, %i7
loop_479:
	movrgz	%g6,	0x3C6,	%g3
	popc	%i0,	%i4
	udivcc	%g1,	0x1383,	%l1
loop_480:
	fmovsvs	%xcc,	%f20,	%f27
	edge8ln	%l5,	%o7,	%g7
	call	loop_481
	fors	%f5,	%f9,	%f10
	tvc	%xcc,	0x7
	edge8l	%o0,	%i3,	%g2
loop_481:
	call	loop_482
	call	loop_483
	call	loop_484
	fxors	%f4,	%f16,	%f27
loop_482:
	fmovsle	%icc,	%f11,	%f21
loop_483:
	fmovda	%xcc,	%f8,	%f26
loop_484:
	call	loop_485
	fmovrdgez	%g4,	%f22,	%f24
	call	loop_486
	movleu	%icc,	%l4,	%o4
loop_485:
	movl	%icc,	0x04E,	%i6
	fornot1	%f24,	%f8,	%f6
loop_486:
	tcc	%icc,	0x6
	fmovdvs	%icc,	%f14,	%f2
	call	loop_487
	nop
	fitod	%f7,	%f10
	call	loop_488
	call	loop_489
loop_487:
	nop
	set	0x20, %i5
	std	%f24,	[%l7 + %i5]
	fone	%f20
loop_488:
	call	loop_490
loop_489:
	fandnot1	%f12,	%f22,	%f18
	tpos	%xcc,	0x4
	movvc	%icc,	%l3,	%o6
loop_490:
	call	loop_491
	call	loop_492
	nop
	setx	0x1D4E,	%l0,	%l2
	udiv	%i5,	%l2,	%o3
	udivx	%i1,	0x0CF0,	%l6
loop_491:
	fmovrdlz	%o1,	%f30,	%f20
loop_492:
	be	%icc,	loop_493
	fmovsu	%fcc0,	%f17,	%f22
	add	%i2,	%o2,	%l0
	call	loop_494
loop_493:
	call	loop_495
	call	loop_496
	rd	%ccr,	%g5
loop_494:
	bcs,a	%icc,	loop_497
loop_495:
	nop
	set	0x6E, %o6
	ldstub	[%l7 + %o6],	%i7
loop_496:
	fmovdg	%fcc1,	%f8,	%f20
	fmovrslz	%g6,	%f6,	%f1
loop_497:
	call	loop_498
	nop
	fitos	%f12,	%f15
	fstoi	%f15,	%f1
	call	loop_499
	fmovslg	%fcc0,	%f18,	%f19
loop_498:
	movge	%fcc2,	%g3,	%i0
	and	%i4,	0x12B6,	%g1
loop_499:
	bleu	%icc,	loop_500
	fandnot1	%f28,	%f20,	%f20
	srlx	%o5,	%l1,	%l5
	call	loop_501
loop_500:
	addc	%o7,	%o0,	%i3
	xnor	%g2,	%g7,	%g4
	tg	%xcc,	0x6
loop_501:
	brlez,pt	%l4,	loop_502
	wrpr	%o4,	0x18E6,	%pil
	call	loop_503
	nop
	fitod	%f6,	%f18
loop_502:
	call	loop_504
	fpmerge	%f28,	%f5,	%f2
loop_503:
	fmovsl	%xcc,	%f12,	%f9
	call	loop_505
loop_504:
	rdhpr	%ver,	%l3
	edge8n	%i6,	%i5,	%o6
	edge32n	%o3,	%i1,	%l6
loop_505:
	call	loop_506
	call	loop_507
	ldd	[%l7 + 0x60],	%l2
	fmul8sux16	%f24,	%f8,	%f12
loop_506:
	call	loop_508
loop_507:
	fmovse	%fcc0,	%f3,	%f10
	tvs	%icc,	0x0
	wr	%g0,	0xe2,	%asi
	stha	%i2,	[%l7 + 0x0A] %asi
	membar	#Sync
loop_508:
	fornot1s	%f8,	%f0,	%f29
	movuge	%fcc3,	%o2,	%o1
	call	loop_509
	call	loop_510
	fmovdvc	%xcc,	%f18,	%f12
	movgu	%icc,	%l0,	%g5
loop_509:
	call	loop_511
loop_510:
	fone	%f10
	nop
	set	0x38, %i6
	prefetch	[%l7 + %i6],	 3
	call	loop_512
loop_511:
	flush	%l7 + 0x78
	fpadd16	%f20,	%f16,	%f2
	brgz,a,pt	%g6,	loop_513
loop_512:
	call	loop_514
	call	loop_515
	fble	%fcc0,	loop_516
loop_513:
	call	loop_517
loop_514:
	fpadd32s	%f11,	%f12,	%f28
loop_515:
	fmovsvs	%icc,	%f29,	%f5
loop_516:
	fexpand	%f19,	%f10
loop_517:
	call	loop_518
	rdpr	%cansave,	%i7
	flush	%l7 + 0x60
	call	loop_519
loop_518:
	wr	%i0,	%i4,	%sys_tick
	call	loop_520
	fpmerge	%f17,	%f7,	%f2
loop_519:
	fnot1s	%f7,	%f19
	call	loop_521
loop_520:
	rd	%fprs,	%g1
	call	loop_522
	fmovdo	%fcc2,	%f0,	%f4
loop_521:
	fmovdl	%xcc,	%f8,	%f6
	udiv	%o5,	0x04C6,	%l1
loop_522:
	nop
	setx	0xC288A9CE,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f15
	setx	0x09AABE36,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f25
	fdivs	%f25,	%f15,	%f19
	nop
	setx	0x1B8F,	%l0,	%o7
	sdivcc	%l5,	%o7,	%o0
	call	loop_523
	tge	%xcc,	0x5
	call	loop_524
	fcmpes	%fcc2,	%f6,	%f15
loop_523:
	fmovdne	%xcc,	%f6,	%f14
	tcs	%xcc,	0x7
loop_524:
	call	loop_525
	movneg	%icc,	0x005,	%g3
	call	loop_526
	call	loop_527
loop_525:
	fmovsue	%fcc2,	%f10,	%f24
	fone	%f8
loop_526:
	fmovsgu	%icc,	%f11,	%f14
loop_527:
	rdhpr	%hintp,	%i3
	fmovrdlz	%g2,	%f0,	%f16
	set	0x5C, %o3
	stwa	%g4,	[%l7 + %o3] 0x2a
	membar	#Sync
	fbug,pn	%fcc1,	loop_528
	call	loop_529
	ld	[%l7 + 0x20],	%f9
	fpadd16	%f14,	%f4,	%f2
loop_528:
	fmovrdlz	%l4,	%f10,	%f22
loop_529:
	call	loop_530
	call	loop_531
	fmovsgu	%icc,	%f21,	%f11
	fxnors	%f16,	%f10,	%f25
loop_530:
	ld	[%l7 + 0x54],	%f28
loop_531:
	wr	%o4,	%l3,	%pic
	fmovsneg	%xcc,	%f29,	%f8
	call	loop_532
	wrpr	%i6,	0x1A45,	%tick
	call	loop_533
	nop
	setx	0x1B7F,	%l0,	%o6
	sdivx	%i5,	%o6,	%o3
loop_532:
	call	loop_534
	fmovrsgz	%i1,	%f10,	%f11
loop_533:
	fabss	%f5,	%f27
	fmovrslz	%l6,	%f31,	%f3
loop_534:
	call	loop_535
	call	loop_536
	call	loop_537
	call	loop_538
loop_535:
	call	loop_539
loop_536:
	nop

loop_537:
	nop

loop_538:
	nop

loop_539:
	nop

	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 7:
!
!	Type l   	: 11
!	Type a   	: 12
!	Type x   	: 2
!	Type cti   	: 75
!	Type f   	: 60
!	Type i   	: 40
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


	EXIT_GOOD	/* test finish  */

/************************************************************************
   Test case data start
 ************************************************************************/
.data
user_data_start:
scratch_area:
.word 0x614892B7
.word 0x2EACFE26
.word 0xEEE47771
.word 0x046E3ACD
.word 0x489ACFAB
.word 0xA768A586
.word 0xF7629C3C
.word 0x83C095B6
.word 0xF8BE7E55
.word 0x8CF5A679
.word 0x8D73947B
.word 0x155EE241
.word 0x03BB7B6C
.word 0x04F1959F
.word 0x1A530A78
.word 0x1B0284F1
.word 0x7BA3A641
.word 0x0FC08847
.word 0xA813A78B
.word 0x7C7312BB
.word 0x010AA0A3
.word 0x33021137
.word 0x209828BF
.word 0x9DF99BD2
.word 0x0D691893
.word 0x29DBA331
.word 0xB2F950D8
.word 0x01E7EA3B
.word 0x78F7BA25
.word 0x2BD4CBBB
.word 0xF25E7A44
.word 0x7ECCDAB8
.word 0x49E94D15
.word 0x4FAB2E43
.word 0xBE7F3C64
.word 0x0E4CC901
.word 0x42F98596
.word 0x4EE94A8B
.word 0x6F5AAFAA
.word 0xA45BD2DC
.word 0xF619FB28
.word 0x58D62EA2
.word 0x37676012
.word 0x2731A9CD
.word 0x5F536B7A
.word 0x4017F485
.word 0xF839CC2C
.word 0xBE5EAA16
.word 0xFFFFE2C4
.word 0x95BF0ACE
.word 0x78DD9979
.word 0x07501CD0
.word 0xDDAC27BC
.word 0xD7DBEEEA
.word 0xC2607CCF
.word 0xDF37B997
.word 0xA6F4865A
.word 0xC7BD51CF
.word 0x70A899A6
.word 0xFA16BE97
.word 0x0C310CEA
.word 0xFEDD38E7
.word 0xB44709BD
.word 0x55480FEA
.end
