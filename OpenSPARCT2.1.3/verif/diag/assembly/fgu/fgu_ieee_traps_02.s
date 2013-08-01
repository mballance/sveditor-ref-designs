/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: fgu_ieee_traps_02.s
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
.ident "FOCUSCASE: focus.pm,v 1.1 2003/04/23 17:53:39 somePerson Exp somePerson $ spc_basic_isa3.pl FOCUS_SEED=12340"
.ident "Mon Dec  8 19:21:06 CST 2003"
.ident "Using Instruction Hash for Focus :$Id: fgu_ieee_traps_02.s,v 1.4 2007/07/27 21:45:31 drp Exp $"
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
	set	0x6,	%g2
	set	0x2,	%g3
	set	0x0,	%g4
	set	0xC,	%g5
	set	0x4,	%g6
	set	0x3,	%g7
	!# Input registers
	set	-0x6,	%i0
	set	-0x6,	%i1
	set	-0x7,	%i2
	set	-0x3,	%i3
	set	-0x6,	%i4
	set	-0xB,	%i5
	set	-0x2,	%i6
	set	-0x0,	%i7
	!# Local registers
	set	0x257DA432,	%l0
	set	0x15253CE1,	%l1
	set	0x7A050272,	%l2
	set	0x39015A3E,	%l3
	set	0x66E12F52,	%l4
	set	0x73B87878,	%l5
	set	0x1BE121D0,	%l6
	!# Output registers
	set	0x0F8B,	%o0
	set	-0x0C50,	%o1
	set	-0x13A1,	%o2
	set	0x1BCB,	%o3
	set	-0x1CDB,	%o4
	set	-0x12BD,	%o5
	set	0x0FF6,	%o6
	set	0x1958,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0xDF0ECADE0EF32D6C)
	INIT_TH_FP_REG(%l7,%f2,0xD39FBDF2FF8041F1)
	INIT_TH_FP_REG(%l7,%f4,0x28E8DA40A34F7AF5)
	INIT_TH_FP_REG(%l7,%f6,0x1ED95E842FE99A93)
	INIT_TH_FP_REG(%l7,%f8,0xC75F90F668FE95A4)
	INIT_TH_FP_REG(%l7,%f10,0xB5604C572AF6B3B0)
	INIT_TH_FP_REG(%l7,%f12,0xD2A237325CE89EBE)
	INIT_TH_FP_REG(%l7,%f14,0x2B3C65BA4DFB4A5E)
	INIT_TH_FP_REG(%l7,%f16,0x8CF05B6E45FCA256)
	INIT_TH_FP_REG(%l7,%f18,0x40B4194346F8E401)
	INIT_TH_FP_REG(%l7,%f20,0xE43FCD95335A2B05)
	INIT_TH_FP_REG(%l7,%f22,0xBC76F48ADA21346E)
	INIT_TH_FP_REG(%l7,%f24,0xA92EAFE66D619A84)
	INIT_TH_FP_REG(%l7,%f26,0x685FBAEE804725AF)
	INIT_TH_FP_REG(%l7,%f28,0xE4E0B45FBC8156B8)
	INIT_TH_FP_REG(%l7,%f30,0x2C0ED2C6B4BF932A)

	!# Execute Main Diag ..

	fmovse	%icc,	%f15,	%f25
	fmovdgu	%xcc,	%f2,	%f12
	call	loop_1
	fmovdneg	%xcc,	%f2,	%f2
	movu	%fcc1,	%i5,	%g1
	call	loop_2
loop_1:
	movule	%fcc3,	%o3,	%i6
	fmovsvs	%xcc,	%f4,	%f16
	nop
	set	0x4B, %l1
	stb	%l6,	[%l7 + %l1]
loop_2:
	nop
	fitod	%f2,	%f14
	fdtoi	%f14,	%f7
	orn	%l0,	%i0,	%g3
	call	loop_3
	srl	%o0,	%o1,	%i1
	subccc	%o4,	0x00FE,	%g5
	edge16ln	%i2,	%i4,	%o5
loop_3:
	movcs	%icc,	0x27A,	%o7
	set	0x5F, %o2
	lduba	[%l7 + %o2] 0x88,	%i3
	fmovs	%f25,	%f23
	and	%g7,	%o2,	%i7
	movleu	%icc,	%l3,	%l1
	movneg	%xcc,	%l2,	%l4
	fmovspos	%icc,	%f9,	%f29
	call	loop_4
	call	loop_5
	call	loop_6
	call	loop_7
loop_4:
	wrpr	%o6,	0x03E0,	%cwp
loop_5:
	fpadd16	%f0,	%f30,	%f18
loop_6:
	orncc	%l5,	%g6,	%g4
loop_7:
	fandnot1	%f8,	%f2,	%f12
	fpmerge	%f23,	%f2,	%f22
	call	loop_8
	call	loop_9
	fnors	%f27,	%f3,	%f26
	sdivx	%g2,	0x1C15,	%i5
loop_8:
	edge8	%g1,	%o3,	%i6
loop_9:
	call	loop_10
	call	loop_11
	fmovsug	%fcc3,	%f12,	%f3
	call	loop_12
loop_10:
	call	loop_13
loop_11:
	rd	%sys_tick_cmpr,	%l0
	movule	%fcc1,	0x29F,	%l6
loop_12:
	fsrc2	%f18,	%f28
loop_13:
	orcc	%g3,	%i0,	%o0
	fpsub16s	%f12,	%f18,	%f20
	fcmpne16	%f6,	%f20,	%i1
	bpos,a,pt	%icc,	loop_14
	call	loop_15
	bshuffle	%f26,	%f6,	%f12
	nop
	setx	0x97D7D7DC973AE5F8,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0x76C43456,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	fsmuld	%f16,	%f10,	%f20
loop_14:
	umulcc	%o1,	%g5,	%i2
loop_15:
	umul	%i4,	%o4,	%o7
	fzero	%f6
	bpos	%xcc,	loop_16
	fbu,a,pt	%fcc2,	loop_17
	movle	%xcc,	0x0E0,	%i3
	fors	%f5,	%f26,	%f4
loop_16:
	call	loop_18
loop_17:
	call	loop_19
	nop
	set	0x20, %g5
	std	%o4,	[%l7 + %g5]
	wr	%g0,	0x80,	%asi
	ldsba	[%l7 + 0x14] %asi,	%g7
loop_18:
	nop
	fitos	%f2,	%f22
	fstoi	%f22,	%f21
loop_19:
	pdist	%f28,	%f26,	%f26
	brnz,a,pt	%o2,	loop_20
	call	loop_21
	sra	%i7,	0x1C,	%l3
	fabsd	%f30,	%f30
loop_20:
	call	loop_22
loop_21:
	bvc,a	%icc,	loop_23
	lduh	[%l7 + 0x28],	%l2
	te	%icc,	0x6
loop_22:
	call	loop_24
loop_23:
	ldsh	[%l7 + 0x56],	%l1
	rdpr	%canrestore,	%o6
	set	0x3A, %g7
	ldsha	[%l7 + %g7] 0x11,	%l4
loop_24:
	fnegd	%f8,	%f14
	lduw	[%l7 + 0x5C],	%l5
	bleu,pn	%xcc,	loop_25
	call	loop_26
	fmovsneg	%icc,	%f8,	%f18
	call	loop_27
loop_25:
	call	loop_28
loop_26:
	movu	%fcc3,	0x109,	%g6
	nop
	fitod	%f8,	%f6
	fdtos	%f6,	%f14
loop_27:
	fcmps	%fcc1,	%f15,	%f21
loop_28:
	call	loop_29
	orncc	%g4,	%i5,	%g1
	fmul8x16	%f11,	%f24,	%f22
	wrpr 	%g0, 	0x0, 	%gl
loop_29:
	call	loop_30
	edge32	%o3,	%i6,	%l0
	fmovrdlz	%l6,	%f6,	%f6
	fpackfix	%f28,	%f6
loop_30:
	st	%f15,	[%l7 + 0x60]
	array16	%g3,	%i0,	%i1
	bgu,a	%xcc,	loop_31
	nop
	setx	loop_32,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x031400001404,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	sllx	%o1,	%o0,	%i2
	fmovrdgz	%i4,	%f26,	%f12
loop_31:
	fcmpeq16	%f10,	%f8,	%g5
loop_32:
	rdpr	%wstate,	%o4
	add	%i3,	0x133E,	%o5
	rdhpr	%hpstate,	%g7
	tneg	%xcc,	0x1
	fpsub16	%f22,	%f10,	%f24
	nop
	setx	0x6AE0E69AE074FE77,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0x90FB25FCF990518A,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	fsubd	%f18,	%f30,	%f0
	fone	%f4
	tne	%xcc,	0x6
	call	loop_33
	fmovsn	%fcc0,	%f5,	%f8
	nop
	fitos	%f4,	%f23
	fstod	%f23,	%f6
	addccc	%o7,	%o2,	%i7
loop_33:
	tne	%icc,	0x3
	movuge	%fcc1,	%l2,	%l3
	fmovsue	%fcc1,	%f20,	%f22
	fmovdleu	%icc,	%f10,	%f4
	call	loop_34
	udiv	%l1,	0x086B,	%o6
	move	%icc,	0x2C6,	%l5
	call	loop_35
loop_34:
	call	loop_36
	call	loop_37
	fmovrslez	%g6,	%f7,	%f28
loop_35:
	addc	%g4,	0x16BC,	%l4
loop_36:
	fornot2	%f12,	%f2,	%f14
loop_37:
	call	loop_38
	fone	%f4
	call	loop_39
	call	loop_40
loop_38:
	subcc	%g1,	%g2,	%o3
	fnegd	%f28,	%f22
loop_39:
	movrlz	%i6,	%l0,	%l6
loop_40:
	call	loop_41
	call	loop_42
	rdpr	%cleanwin,	%g3
	rd	%pc,	%i5
loop_41:
	call	loop_43
loop_42:
	fmovde	%icc,	%f12,	%f22
	fzeros	%f5
	fcmpd	%fcc2,	%f6,	%f30
loop_43:
	call	loop_44
	call	loop_45
	rd	%asi,	%i1
	call	loop_46
loop_44:
	movge	%fcc1,	0x3B4,	%i0
loop_45:
	call	loop_47
	fnor	%f0,	%f12,	%f16
loop_46:
	call	loop_48
	tgu	%xcc,	0x3
loop_47:
	movue	%fcc2,	0x286,	%o1
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
loop_48:
	nop
	set	0x74, %g4
	ldswa	[%l7 + %g4] 0x0c,	%i2
	tl	%icc,	0x1
	fmuld8ulx16	%f31,	%f7,	%f10
	fnot1	%f22,	%f20
	tcs	%icc,	0x6
	movgu	%icc,	%o0,	%g5
	and	%i4,	%i3,	%o5
	movrgz	%o4,	0x015,	%g7
	fmovs	%f3,	%f31
	call	loop_49
	call	loop_50
	bneg,a	%xcc,	loop_51
	popc	0x145C,	%o7
loop_49:
	fmovdpos	%icc,	%f10,	%f2
loop_50:
	fmovdul	%fcc1,	%f24,	%f12
loop_51:
	call	loop_52
	fpack32	%f30,	%f28,	%f10
	nop
	fitod	%f0,	%f30
	tne	%xcc,	0x6
loop_52:
	fmovsa	%fcc3,	%f18,	%f2
	fpsub32s	%f4,	%f27,	%f15
	add	%l7,	0x68,	%l6
	wr	%g0,	0x19,	%asi
	ldxa	[%l6] %asi,	%i7
	casxa	[%l6] %asi,	%i7,	%l2
	smul	%o2,	%l3,	%o6
	pdist	%f28,	%f2,	%f30
	wrpr	%l5,	%g6,	%pil
	call	loop_53
	call	loop_54
	wr	%l1,	0x0A06,	%ccr
	call	loop_55
loop_53:
	call	loop_56
loop_54:
	call	loop_57
	call	loop_58
loop_55:
	srl	%l4,	0x11,	%g4
loop_56:
	call	loop_59
loop_57:
	fmovsvs	%xcc,	%f29,	%f8
loop_58:
	edge16n	%g2,	%g1,	%i6
	fbg	%fcc0,	loop_60
loop_59:
	rdpr	%wstate,	%o3
	fmovdge	%fcc1,	%f30,	%f22
	fmovso	%fcc1,	%f30,	%f29
loop_60:
	nop
	set	0x4C, %i6
	stw	%l0,	[%l7 + %i6]
	call	loop_61
	fmul8sux16	%f22,	%f0,	%f20
	sra	%l6,	%i5,	%i1
	call	loop_62
loop_61:
	fcmpgt32	%f26,	%f10,	%g3
	fmovdule	%fcc2,	%f22,	%f28
	call	loop_63
loop_62:
	mulscc	%o1,	%i0,	%o0
	bgu,a,pt	%xcc,	loop_64
	brgz,a,pn	%i2,	loop_65
loop_63:
	array16	%g5,	%i3,	%o5
	set	0x40, %l3
	stda	%f0,	[%l7 + %l3] 0xc0
loop_64:
	movo	%fcc1,	0x13D,	%o4
loop_65:
	andn	%g7,	%o7,	%i4
	nop
	fitod	%f12,	%f30
	fdtoi	%f30,	%f12
	rd	%fprs,	%i7
	movpos	%xcc,	%o2,	%l2
	call	loop_66
	edge16n	%o6,	%l5,	%g6
	fpack16	%f0,	%f14
	fcmpd	%fcc0,	%f0,	%f0
loop_66:
	fmovrdne	%l3,	%f24,	%f14
	call	loop_67
	wr	%l1,	%l4,	%ccr
	fmovd	%f12,	%f12
	movrgz	%g4,	%g1,	%i6
loop_67:
	bgu,a,pn	%xcc,	loop_68
	fmovrde	%g2,	%f22,	%f24
	fmovrdgz	%o3,	%f30,	%f16
	fmovdleu	%xcc,	%f12,	%f10
loop_68:
	rd	%asi,	%l6
	nop
	set	0x28, %o3
	ldx	[%l7 + %o3],	%i5
	fcmpd	%fcc0,	%f30,	%f2
	brnz,a,pt	%l0,	loop_69
	call	loop_70
	call	loop_71
	rd	%tick_cmpr,	%i1
loop_69:
	fcmped	%fcc3,	%f10,	%f30
loop_70:
	call	loop_72
loop_71:
	fcmpeq32	%f26,	%f20,	%g3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fxors	%f19,	%f24,	%f3
loop_72:
	call	loop_73
	tne	%icc,	0x4
	fnands	%f13,	%f20,	%f15
	call	loop_74
loop_73:
	bcc,pt	%icc,	loop_75
	fmovdul	%fcc1,	%f30,	%f28
	addc	%i0,	%i2,	%g5
loop_74:
	alignaddrl	%i3,	%o0,	%o4
loop_75:
	call	loop_76
	fmovrdlz	%o5,	%f24,	%f20
	call	loop_77
	fones	%f7
loop_76:
	alignaddr	%g7,	%i4,	%o7
	bneg	%icc,	loop_78
loop_77:
	call	loop_79
	call	loop_80
	fmovdue	%fcc0,	%f22,	%f20
loop_78:
	mulscc	%o2,	0x15C4,	%i7
loop_79:
	call	loop_81
loop_80:
	wrpr	%o6,	0x0376,	%cwp
	addcc	%l2,	0x1D51,	%l5
	fmovscs	%icc,	%f18,	%f31
loop_81:
	xnor	%l3,	%g6,	%l4
	nop
	fitos	%f8,	%f15
	fstox	%f15,	%f28
	fxtos	%f28,	%f10
	fmovslg	%fcc0,	%f5,	%f2
	call	loop_82
	fmovrdne	%g4,	%f8,	%f10
	movre	%l1,	0x004,	%i6
	fmovsule	%fcc3,	%f24,	%f5
loop_82:
	st	%f8,	[%l7 + 0x0C]
	fcmple16	%f6,	%f24,	%g2
	nop
	set	0x18, %i7
	lduw	[%l7 + %i7],	%o3
	call	loop_83
	orcc	%l6,	%i5,	%g1
	call	loop_84
	movneg	%xcc,	%i1,	%g3
loop_83:
	call	loop_85
	call	loop_86
loop_84:
	fmovrdgz	%o1,	%f12,	%f30
	orncc	%l0,	%i2,	%i0
loop_85:
	movrlz	%i3,	%g5,	%o4
loop_86:
	nop
	setx	0xA28859196287F08C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0xD8F6641937EFD03B,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	fsubd	%f22,	%f22,	%f28
	call	loop_87
	call	loop_88
	fones	%f29
	movu	%fcc3,	%o0,	%o5
loop_87:
	ble,a,pn	%icc,	loop_89
loop_88:
	fcmpgt16	%f30,	%f6,	%i4
	array16	%o7,	%g7,	%i7
	fmovsg	%fcc1,	%f20,	%f3
loop_89:
	edge8	%o6,	%o2,	%l2
	udivx	%l3,	0x1EB0,	%g6
	sllx	%l4,	%g4,	%l1
	call	loop_90
	bvs,pt	%xcc,	loop_91
	rdhpr	%ver,	%l5
	addc	%i6,	0x045B,	%o3
loop_90:
	fpadd16s	%f14,	%f27,	%f19
loop_91:
	call	loop_92
	call	loop_93
	udivcc	%l6,	0x17B7,	%g2
	fmovscs	%xcc,	%f2,	%f10
loop_92:
	call	loop_94
loop_93:
	movrgez	%i5,	0x136,	%i1
	brgez	%g3,	loop_95
	tleu	%xcc,	0x2
loop_94:
	call	loop_96
	tsubcc	%g1,	0x0E39,	%o1
loop_95:
	call	loop_97
	call	loop_98
loop_96:
	alignaddrl	%l0,	%i2,	%i3
	edge16ln	%i0,	%o4,	%o0
loop_97:
	fmovrslez	%o5,	%f8,	%f15
loop_98:
	fcmpd	%fcc3,	%f6,	%f14
	call	loop_99
	fnot1	%f18,	%f12
	set	0x78, %l4
	prefetcha	[%l7 + %l4] 0x81,	 3
loop_99:
	call	loop_100
	call	loop_101
	call	loop_102
	bl,a,pn	%xcc,	loop_103
loop_100:
	call	loop_104
loop_101:
	call	loop_105
loop_102:
	fornot1	%f16,	%f6,	%f24
loop_103:
	xnor	%i4,	0x1DE0,	%o7
loop_104:
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
loop_105:
	call	loop_106
	fmovsl	%icc,	%f24,	%f9
	fcmped	%fcc3,	%f24,	%f4
	andncc	%i7,	0x0580,	%o6
loop_106:
	fpmerge	%f27,	%f19,	%f30
	call	loop_107
	fcmpeq32	%f18,	%f8,	%o2
	call	loop_108
	call	loop_109
loop_107:
	fone	%f22
	nop
	set	0x6C, %o0
	ldsw	[%l7 + %o0],	%g7
loop_108:
	nop
	fitos	%f14,	%f19
	fstox	%f19,	%f4
	fxtos	%f4,	%f31
loop_109:
	movrlez	%l2,	0x0F4,	%g6
	tsubcc	%l4,	%g4,	%l3
	call	loop_110
	membar	0x31
	call	loop_111
	call	loop_112
loop_110:
	fmovrsgez	%l5,	%f13,	%f23
	tsubcctv	%i6,	0x1EBD,	%o3
loop_111:
	fnot1s	%f0,	%f31
loop_112:
	call	loop_113
	call	loop_114
	edge16	%l6,	%g2,	%i5
	call	loop_115
loop_113:
	fmovrsgz	%i1,	%f30,	%f14
loop_114:
	edge8l	%g3,	%g1,	%l1
	fmovsuge	%fcc3,	%f11,	%f17
loop_115:
	fnor	%f12,	%f12,	%f30
	call	loop_116
	fmuld8ulx16	%f2,	%f11,	%f22
	nop
	setx	0x70FB495F,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f25
	fsqrts	%f25,	%f17
	rdpr	%pil,	%o1
loop_116:
	brnz,a	%i2,	loop_117
	call	loop_118
	movule	%fcc0,	%l0,	%i0
	brz,pt	%o4,	loop_119
loop_117:
	array16	%o0,	%o5,	%i3
loop_118:
	call	loop_120
	call	loop_121
loop_119:
	call	loop_122
	wr	%i4,	%g5,	%set_softint
loop_120:
	fmovdvs	%xcc,	%f18,	%f30
loop_121:
	call	loop_123
loop_122:
	call	loop_124
	fmovsleu	%icc,	%f19,	%f26
	bcc	%xcc,	loop_125
loop_123:
	movu	%fcc2,	0x05B,	%i7
loop_124:
	call	loop_126
	srax	%o7,	0x17,	%o6
loop_125:
	tsubcc	%g7,	0x08D7,	%l2
	call	loop_127
loop_126:
	edge8ln	%g6,	%o2,	%l4
	fmovdule	%fcc0,	%f10,	%f16
	call	loop_128
loop_127:
	fpsub32s	%f22,	%f10,	%f15
	orn	%l3,	0x1881,	%l5
	edge8ln	%g4,	%i6,	%o3
loop_128:
	call	loop_129
	nop
	setx	0x1A87,	%l0,	%l6
	sdivx	%g2,	%l6,	%i5
	fmovdug	%fcc0,	%f28,	%f30
	wrpr	%i1,	%g3,	%pil
loop_129:
	nop
	wr	%g0,	0x11,	%asi
	ldsha	[%l7 + 0x5E] %asi,	%l1
	call	loop_130
	call	loop_131
	call	loop_132
	fones	%f23
loop_130:
	fmovsul	%fcc3,	%f0,	%f5
loop_131:
	fexpand	%f23,	%f30
loop_132:
	call	loop_133
	fexpand	%f27,	%f18
	call	loop_134
	mulx	%o1,	0x0346,	%g1
loop_133:
	call	loop_135
	edge8	%i2,	%l0,	%i0
loop_134:
	fnegd	%f26,	%f28
	call	loop_136
loop_135:
	fcmple32	%f26,	%f0,	%o0
	sllx	%o4,	%i3,	%o5
	tl	%xcc,	0x3
loop_136:
	sethi	0x0843,	%i4
	call	loop_137
	fnot1s	%f23,	%f11
	bvc	%icc,	loop_138
	fpadd16s	%f9,	%f29,	%f6
loop_137:
	nop
	setx loop_139, %l0, %l1
	jmpl %l1, %g5
	call	loop_140
loop_138:
	fmovrde	%o7,	%f26,	%f26
	array8	%o6,	%i7,	%l2
loop_139:
	fmovrslez	%g6,	%f6,	%f14
loop_140:
	call	loop_141
	movvc	%icc,	0x19F,	%o2
	tsubcc	%g7,	%l3,	%l4
	fmovsvc	%icc,	%f0,	%f31
loop_141:
	call	loop_142
	call	loop_143
	call	loop_144
	fmovrse	%g4,	%f13,	%f1
loop_142:
	call	loop_145
loop_143:
	fnor	%f24,	%f4,	%f0
loop_144:
	orncc	%l5,	0x0FB1,	%i6
	fsrc1s	%f7,	%f10
loop_145:
	fpack16	%f8,	%f10
	set	0x18, %g1
	ldxa	[%l7 + %g1] 0x19,	%o3
	call	loop_146
	fmovdule	%fcc3,	%f28,	%f18
	movneg	%xcc,	0x018,	%l6
	fandnot1s	%f11,	%f26,	%f5
loop_146:
	movvs	%icc,	%g2,	%i5
	subc	%i1,	%g3,	%o1
	fmovsn	%fcc2,	%f14,	%f17
	call	loop_147
	wrpr	%l1,	0x193D,	%cwp
	tle	%xcc,	0x5
	call	loop_148
loop_147:
	tle	%xcc,	0x0
	rd	%tick_cmpr,	%i2
	fpadd16s	%f5,	%f3,	%f15
loop_148:
	movrne	%l0,	%g1,	%o0
	call	loop_149
	fpsub16	%f28,	%f10,	%f26
	call	loop_150
	call	loop_151
loop_149:
	call	loop_152
	smulcc	%o4,	0x0145,	%i0
loop_150:
	fbue	%fcc0,	loop_153
loop_151:
	fmovdn	%xcc,	%f20,	%f12
loop_152:
	call	loop_154
	call	loop_155
loop_153:
	nop
	fitod	%f0,	%f6
	fdtox	%f6,	%f6
	fxtod	%f6,	%f4
	fnand	%f12,	%f0,	%f2
loop_154:
	sdivx	%i3,	0x176C,	%i4
loop_155:
	ble	%icc,	loop_156
	fsrc1	%f20,	%f22
	call	loop_157
	srlx	%g5,	0x18,	%o7
loop_156:
	movre	%o6,	0x026,	%o5
	fnot1	%f18,	%f16
loop_157:
	movlg	%fcc0,	0x582,	%i7
	call	loop_158
	fmovsn	%icc,	%f9,	%f24
	call	loop_159
	call	loop_160
loop_158:
	call	loop_161
	ldd	[%l7 + 0x38],	%f28
loop_159:
	fbo,a	%fcc0,	loop_162
loop_160:
	nop
	set	0x54, %i2
	lduh	[%l7 + %i2],	%l2
loop_161:
	tvs	%icc,	0x2
	call	loop_163
loop_162:
	call	loop_164
	ble,a,pn	%icc,	loop_165
	call	loop_166
loop_163:
	movge	%fcc2,	0x6CF,	%o2
loop_164:
	call	loop_167
loop_165:
	fmovso	%fcc1,	%f29,	%f11
loop_166:
	fexpand	%f6,	%f16
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
loop_167:
	fandnot2s	%f22,	%f14,	%f7
	fpack16	%f26,	%f23
	call	loop_168
	rdhpr	%ver,	%g6
	bleu,a	%xcc,	loop_169
	rdpr	%wstate,	%g7
loop_168:
	tcc	%xcc,	0x5
	orcc	%l3,	%g4,	%l5
loop_169:
	ta	%icc,	0x1
	fnot2	%f28,	%f8
	wr	%g0,	0x04,	%asi
	stxa	%l4,	[%l7 + 0x20] %asi
	call	loop_170
loop_170:
	nop

	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 0:
!
!	Type l   	: 23
!	Type a   	: 26
!	Type x   	: 10
!	Type cti   	: 170
!	Type f   	: 145
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
	set	0xD,	%g1
	set	0x1,	%g2
	set	0xB,	%g3
	set	0xF,	%g4
	set	0x4,	%g5
	set	0x7,	%g6
	set	0x5,	%g7
	!# Input registers
	set	-0x2,	%i0
	set	-0x8,	%i1
	set	-0xE,	%i2
	set	-0xC,	%i3
	set	-0xC,	%i4
	set	-0x1,	%i5
	set	-0xB,	%i6
	set	-0x2,	%i7
	!# Local registers
	set	0x2E976660,	%l0
	set	0x033A2288,	%l1
	set	0x01B8F18A,	%l2
	set	0x7A5E0881,	%l3
	set	0x5607A108,	%l4
	set	0x4D3ADE18,	%l5
	set	0x70615ADB,	%l6
	!# Output registers
	set	0x0B73,	%o0
	set	-0x0BC0,	%o1
	set	-0x032D,	%o2
	set	-0x06DC,	%o3
	set	-0x1479,	%o4
	set	0x0E32,	%o5
	set	0x19A0,	%o6
	set	0x1245,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0xDF0ECADE0EF32D6C)
	INIT_TH_FP_REG(%l7,%f2,0xD39FBDF2FF8041F1)
	INIT_TH_FP_REG(%l7,%f4,0x28E8DA40A34F7AF5)
	INIT_TH_FP_REG(%l7,%f6,0x1ED95E842FE99A93)
	INIT_TH_FP_REG(%l7,%f8,0xC75F90F668FE95A4)
	INIT_TH_FP_REG(%l7,%f10,0xB5604C572AF6B3B0)
	INIT_TH_FP_REG(%l7,%f12,0xD2A237325CE89EBE)
	INIT_TH_FP_REG(%l7,%f14,0x2B3C65BA4DFB4A5E)
	INIT_TH_FP_REG(%l7,%f16,0x8CF05B6E45FCA256)
	INIT_TH_FP_REG(%l7,%f18,0x40B4194346F8E401)
	INIT_TH_FP_REG(%l7,%f20,0xE43FCD95335A2B05)
	INIT_TH_FP_REG(%l7,%f22,0xBC76F48ADA21346E)
	INIT_TH_FP_REG(%l7,%f24,0xA92EAFE66D619A84)
	INIT_TH_FP_REG(%l7,%f26,0x685FBAEE804725AF)
	INIT_TH_FP_REG(%l7,%f28,0xE4E0B45FBC8156B8)
	INIT_TH_FP_REG(%l7,%f30,0x2C0ED2C6B4BF932A)

	!# Execute Main Diag ..

	fcmple16	%f24,	%f6,	%i6
	fmovdne	%fcc3,	%f24,	%f26
	call	loop_171
	movlg	%fcc1,	%l6,	%o3
	faligndata	%f28,	%f10,	%f28
	fbg,pn	%fcc3,	loop_172
loop_171:
	call	loop_173
	fmovde	%fcc3,	%f16,	%f30
	rdpr	%tl,	%g2
loop_172:
	call	loop_174
loop_173:
	fnegd	%f4,	%f14
	fmovsul	%fcc1,	%f23,	%f9
	orcc	%i5,	%i1,	%g3
loop_174:
	fmovsu	%fcc2,	%f20,	%f12
	fnand	%f22,	%f8,	%f18
	fpack32	%f2,	%f16,	%f14
	ldd	[%l7 + 0x38],	%f14
	call	loop_175
	fmul8sux16	%f12,	%f18,	%f8
	call	loop_176
	wrpr	%l1,	0x04A5,	%cwp
loop_175:
	call	loop_177
	fmovsle	%fcc2,	%f22,	%f19
loop_176:
	nop
	setx	loop_178,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x034100001405,	%l0,	%l1
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
	call	loop_179
loop_177:
	subcc	%i2,	%o1,	%l0
	be,a,pt	%xcc,	loop_180
loop_178:
	tle	%icc,	0x3
loop_179:
	fmovdul	%fcc3,	%f8,	%f20
	fmovdo	%fcc3,	%f20,	%f26
loop_180:
	fnot2s	%f27,	%f20
	stx	%g1,	[%l7 + 0x08]
	wr	%o0,	%o4,	%sys_tick
	xnor	%i3,	%i0,	%g5
	call	loop_181
	fbul	%fcc1,	loop_182
	nop
	setx	0xB457AE9A,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f16
	setx	0x636A6CFC,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f12
	fmuls	%f12,	%f16,	%f26
	wr	%o7,	%i4,	%set_softint
loop_181:
	call	loop_183
loop_182:
	nop
	set	0x2E, %i0
	sth	%o5,	[%l7 + %i0]

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x916, 	%hsys_tick_cmpr
	bpos,a	%xcc,	loop_184
loop_183:
	movge	%xcc,	0x50C,	%i7
	fmovdul	%fcc3,	%f0,	%f8
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
loop_184:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x87C, 	%hsys_tick_cmpr
	call	loop_185
	movre	%g7,	%g6,	%l3
	fbule,a,pt	%fcc0,	loop_186
	call	loop_187
loop_185:
	fmovdo	%fcc3,	%f20,	%f14
	fcmpne16	%f28,	%f14,	%g4
loop_186:
	fcmped	%fcc3,	%f4,	%f8
loop_187:
	fmovdleu	%xcc,	%f18,	%f2
	call	loop_188
	xorcc	%l4,	0x08B2,	%i6
	fmovdo	%fcc3,	%f12,	%f16
	andcc	%l6,	%l5,	%g2
loop_188:
	call	loop_189
	call	loop_190
	taddcctv	%o3,	%i5,	%g3
	bgu,pn	%xcc,	loop_191
loop_189:
	movrlz	%l1,	%i1,	%o1
loop_190:
	call	loop_192
	call	loop_193
loop_191:
	nop
	setx	0x59768ED7E949ADFD,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0x2ED2B4A4AFEE48AA,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	faddd	%f2,	%f2,	%f4
	edge32l	%l0,	%i2,	%g1
loop_192:
	call	loop_194
loop_193:
	movue	%fcc2,	0x587,	%o0
	call	loop_195
	mova	%fcc0,	0x179,	%i3
loop_194:
	call	loop_196
	fmovduge	%fcc3,	%f26,	%f18
loop_195:
	call	loop_197
	call	loop_198
loop_196:
	fmovdneg	%xcc,	%f4,	%f12
	call	loop_199
loop_197:
	call	loop_200
loop_198:
	xorcc	%o4,	0x020F,	%i0
	nop
	setx	0xA9A60E08F5E2680A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	setx	0x447A9D62D0DE4189,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	fsubd	%f24,	%f18,	%f10
loop_199:
	fmovsul	%fcc1,	%f7,	%f22
loop_200:
	nop
	set	0x78, %l5
	lda	[%l7 + %l5] 0x11,	%f31
	call	loop_201
	call	loop_202
	nop
	setx	0x5230C4184C1D0030,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0xE08FADA0,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	fsmuld	%f6,	%f14,	%f4
	nop
	setx	0x4D5234DE,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f12
	setx	0x852070B9,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f16
	fmuls	%f16,	%f12,	%f4
loop_201:
	addccc	%g5,	0x1015,	%i4
loop_202:
	rdhpr	%hpstate,	%o5
	wrpr	%o7,	%o6,	%tick
	movrlz	%i7,	0x329,	%l2
	call	loop_203
	ta	%icc,	0x2
	brlez,pt	%o2,	loop_204
	fbuge,a,pn	%fcc2,	loop_205
loop_203:
	swap	[%l7 + 0x40],	%g7
	alignaddr	%g6,	%g4,	%l4
loop_204:
	bleu,a	%xcc,	loop_206
loop_205:
	call	loop_207
	fbu,pt	%fcc0,	loop_208
	movvs	%icc,	0x63C,	%l3
loop_206:
	addcc	%l6,	0x0E59,	%l5
loop_207:
	movul	%fcc0,	%g2,	%i6
loop_208:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xCD4, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%g0,	0x89,	%asi
	ldxa	[%l7 + 0x20] %asi,	%i1
	subcc	%l1,	0x1F56,	%o1
	call	loop_209
	ldsb	[%l7 + 0x2C],	%l0
	move	%fcc0,	0x45E,	%g1
	call	loop_210
loop_209:
	movg	%fcc2,	%o0,	%i3
	call	loop_211
	nop
	setx	0xA08A650629CE43EC,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	fsqrtd	%f10,	%f22
loop_210:
	fmovspos	%icc,	%f20,	%f7
	bcc,pn	%xcc,	loop_212
loop_211:
	nop
	set	0x6A, %i5
	ldub	[%l7 + %i5],	%i2
	srlx	%o4,	%g5,	%i0
	fcmple16	%f14,	%f12,	%o5
loop_212:
	call	loop_213
	fmovrsgez	%o7,	%f17,	%f8
	fmovdge	%fcc0,	%f8,	%f22

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_213:
	call	loop_214
	bgu,a,pt	%icc,	loop_215
	edge8n	%i7,	%o6,	%o2
	fbue	%fcc2,	loop_216
loop_214:
	fbuge,pt	%fcc1,	loop_217
loop_215:
	fmovrse	%l2,	%f13,	%f6
	fbe,a,pt	%fcc2,	loop_218
loop_216:
	fxnors	%f26,	%f20,	%f13
loop_217:
	fxor	%f16,	%f22,	%f2
	rdhpr	%hintp,	%g6
loop_218:
	stbar
	fcmple32	%f8,	%f30,	%g7
	call	loop_219
	brz,a,pt	%g4,	loop_220
	wr 	%g0, 	0x4, 	%fprs
	add	%l7,	0x3C,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] %asi,	%l6,	%g2
loop_219:
	fcmpgt16	%f24,	%f30,	%i6
loop_220:
	edge8l	%i5,	%l5,	%g3
	call	loop_221
	fmovsn	%xcc,	%f25,	%f11
	tle	%xcc,	0x1
	fmovrslez	%o3,	%f25,	%f1
loop_221:
	call	loop_222
	call	loop_223
	call	loop_224
	movgu	%icc,	%i1,	%o1
loop_222:
	call	loop_225
loop_223:
	fmovdug	%fcc2,	%f10,	%f0
loop_224:
	call	loop_226
	nop
	fitod	%f2,	%f16
	fdtox	%f16,	%f18
loop_225:
	xorcc	%l1,	%g1,	%o0
	fmovrde	%i3,	%f8,	%f14
loop_226:
	srl	%l0,	0x1D,	%i2
	tsubcc	%o4,	0x1A18,	%g5
	rdpr	%cleanwin,	%i0
	call	loop_227
	movcs	%xcc,	%o5,	%i4
	call	loop_228
	fmovdue	%fcc3,	%f10,	%f26
loop_227:
	fmovdue	%fcc3,	%f28,	%f28
	call	loop_229
loop_228:
	brgez	%o7,	loop_230
	movrne	%o6,	0x3CB,	%i7
	fmul8ulx16	%f2,	%f4,	%f26
loop_229:
	array32	%o2,	%l2,	%g6
loop_230:
	fsrc1s	%f1,	%f19
	faligndata	%f12,	%f10,	%f18
	edge16n	%g7,	%l4,	%g4
	fone	%f18
	popc	0x0DB2,	%l6
	fpadd16s	%f25,	%f25,	%f13
	bpos	%icc,	loop_231
	movo	%fcc1,	0x6A7,	%l3
	umulcc	%g2,	0x1C53,	%i5
	call	loop_232
loop_231:
	fcmpes	%fcc2,	%f7,	%f24
	set	0x70, %o5
	ldsha	[%l7 + %o5] 0x04,	%l5
loop_232:
	fmuld8sux16	%f16,	%f21,	%f8
	fmovsg	%fcc3,	%f22,	%f4
	call	loop_233
	rdhpr	%ver,	%g3
	call	loop_234
	mova	%fcc2,	0x383,	%o3
loop_233:
	xnorcc	%i6,	0x057B,	%i1
	fcmpd	%fcc1,	%f20,	%f18
loop_234:
	fpackfix	%f18,	%f22
	bl	%xcc,	loop_235
	fmovrsgez	%o1,	%f11,	%f16
	call	loop_236
	call	loop_237
loop_235:
	sllx	%g1,	0x0F,	%o0
	add	%l7,	0x38,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] %asi,	%l1,	%l0
loop_236:
	array8	%i2,	%i3,	%o4
loop_237:
	fornot1s	%f12,	%f15,	%f2
	fnot1	%f22,	%f6
	nop
	fitod	%f8,	%f4
	fdtoi	%f4,	%f2
	add	%g5,	%i0,	%i4
	call	loop_238
	fmovrdgez	%o7,	%f22,	%f0
	fmovrdlez	%o6,	%f2,	%f10
	call	loop_239
loop_238:
	call	loop_240
	wrpr	%o5,	0x0E46,	%cwp
	fmovsne	%fcc1,	%f12,	%f19
loop_239:
	tge	%xcc,	0x1
loop_240:
	nop
	membar	#Sync
	wr	%g0,	0x1f,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	fmovsl	%fcc0,	%f14,	%f10
	call	loop_241
	movue	%fcc3,	%o2,	%l2
	call	loop_242
	fmovdleu	%xcc,	%f30,	%f14
loop_241:
	call	loop_243
	siam	0x1
loop_242:
	orncc	%i7,	%g7,	%g6
	movrlz	%g4,	0x3C3,	%l6
loop_243:
	fpackfix	%f2,	%f1
	call	loop_244
	fandnot1s	%f11,	%f22,	%f28
	fzeros	%f10
	movgu	%icc,	0x019,	%l4
loop_244:
	call	loop_245
	rd	%softint,	%l3
	call	loop_246
	srax	%g2,	%l5,	%i5
loop_245:
	movle	%icc,	0x07D,	%g3
	nop
	setx	0x6ED91634,	%l0,	%l6
	st	%l6,	[%l7 + 0x24]
	ld	[%l7 + 0x24],	%fsr
loop_246:
	ldx	[%l7 + 0x30],	%i6
	add	%o3,	%i1,	%o1
	call	loop_247
	call	loop_248
	call	loop_249
	nop
	setx	0x1E21,	%l0,	%l1
	sdivx	%o0,	%l1,	%l0
loop_247:
	fmovdul	%fcc0,	%f30,	%f6
loop_248:
	call	loop_250
loop_249:
	wr 	%g0, 	0x4, 	%fprs
	call	loop_251
	edge16l	%o4,	%i2,	%i0
loop_250:
	call	loop_252
	call	loop_253
loop_251:
	call	loop_254
	call	loop_255
loop_252:
	call	loop_256
loop_253:
	nop
	setx	0x10CF52A1,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f31
	setx	0xE409261D,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f31
	fsubs	%f31,	%f31,	%f13
loop_254:
	fcmpgt32	%f6,	%f2,	%i4
loop_255:
	nop
	set	0x20, %o4
	ldd	[%l7 + %o4],	%f24
loop_256:
	call	loop_257
	call	loop_258
	tcc	%icc,	0x5
	call	loop_259
loop_257:
	fmovdvs	%xcc,	%f22,	%f26
loop_258:
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	taddcctv	%g5,	%o7,	%o5
loop_259:
	array16	%o2,	%o6,	%i7
	fpmerge	%f23,	%f5,	%f10
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	wr	%g0,	0x18,	%asi
	prefetcha	[%l7 + 0x08] %asi,	 4
	nop
	setx	0x6951CC3A,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f6
	setx	0x53BFE1BA,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f19
	fadds	%f19,	%f6,	%f20
	fmovda	%fcc1,	%f28,	%f20
	fnand	%f26,	%f6,	%f16
	fabsd	%f16,	%f26
	fmovsu	%fcc1,	%f24,	%f21
	set	0x76, %o1
	stha	%g6,	[%l7 + %o1] 0x81
	stbar
	rdhpr	%htba,	%g4
	fmovsug	%fcc1,	%f30,	%f1
	call	loop_260
	edge16	%l6,	%g7,	%l3
	call	loop_261
	call	loop_262
loop_260:
	fmul8sux16	%f22,	%f10,	%f26
	rdhpr	%ver,	%g2
loop_261:
	fxors	%f7,	%f17,	%f11
loop_262:
	nop
	set	0x1C, %o7
	lduw	[%l7 + %o7],	%l5
	movlg	%fcc1,	%i5,	%g3
	movne	%xcc,	%i6,	%o3
	call	loop_263
	edge8	%l4,	%o1,	%o0
	tsubcctv	%l1,	%i1,	%l0
	fsrc1s	%f29,	%f24
loop_263:
	call	loop_264
	fnands	%f22,	%f23,	%f0
	te	%xcc,	0x0
	tsubcctv	%g1,	%o4,	%i3
loop_264:
	edge8	%i0,	%i4,	%i2
	fmovsule	%fcc2,	%f26,	%f13
	movrlz	%g5,	%o5,	%o7
	call	loop_265
	bl,a,pn	%icc,	loop_266
	fpadd16	%f30,	%f20,	%f0
	edge32l	%o2,	%o6,	%l2
loop_265:
	movre	%i7,	%g4,	%l6
loop_266:
	fnands	%f20,	%f16,	%f10
	movre	%g7,	0x257,	%l3
	call	loop_267
	fpsub32s	%f21,	%f19,	%f12
	fble,a,pn	%fcc0,	loop_268
	nop
	set	0x50, %g6
	stb	%g2,	[%l7 + %g6]
loop_267:
	st	%f3,	[%l7 + 0x6C]
	tne	%icc,	0x2
loop_268:
	call	loop_269
	fzero	%f28
	call	loop_270
	movo	%fcc0,	%g6,	%i5
loop_269:
	fbg,a	%fcc1,	loop_271
	call	loop_272
loop_270:
	nop
	set	0x2C, %i1
	ldsh	[%l7 + %i1],	%g3
	tne	%xcc,	0x3
loop_271:
	fones	%f26
loop_272:
	fmovdgu	%icc,	%f6,	%f2
	fand	%f4,	%f8,	%f24
	tcs	%xcc,	0x1
	mulscc	%i6,	%o3,	%l5
	ba,a	%icc,	loop_273
	call	loop_274
	bneg,pt	%xcc,	loop_275
	orcc	%l4,	%o0,	%o1
loop_273:
	tpos	%xcc,	0x1
loop_274:
	fsrc1s	%f17,	%f8
loop_275:
	call	loop_276
	fmovrde	%i1,	%f16,	%f24
	fcmpeq32	%f26,	%f24,	%l0
	fcmpne32	%f20,	%f28,	%g1
loop_276:
	sub	%o4,	0x0874,	%l1
	movul	%fcc1,	%i3,	%i0
	fbul,a,pt	%fcc1,	loop_277
	call	loop_278
	fmovdl	%fcc2,	%f18,	%f12
	edge16n	%i2,	%i4,	%g5
loop_277:
	call	loop_279
loop_278:
	call	loop_280
	movrne	%o5,	%o7,	%o2
	add	%o6,	%i7,	%g4
loop_279:
	fbu	%fcc0,	loop_281
loop_280:
	call	loop_282
	fnegd	%f4,	%f10
	fpsub16s	%f20,	%f2,	%f24
loop_281:
	call	loop_283
loop_282:
	call	loop_284
	fzero	%f6
	tpos	%xcc,	0x5
loop_283:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x10E, 	%hsys_tick_cmpr
loop_284:
	call	loop_285
	fmovdug	%fcc2,	%f10,	%f22
	fmovda	%fcc3,	%f6,	%f12
	rdhpr	%hintp,	%l6
loop_285:
	wr	%l3,	%g6,	%ccr
	call	loop_286
	edge32ln	%g2,	%g3,	%i5
	udiv	%i6,	0x0E80,	%l5
	fbl,pn	%fcc0,	loop_287
loop_286:
	fsrc2s	%f15,	%f23
	or	%o3,	%o0,	%l4
	tsubcc	%o1,	0x1A98,	%l0
loop_287:
	call	loop_288
	call	loop_289
	fmovsne	%fcc0,	%f18,	%f15
	wr	%g1,	%o4,	%y
loop_288:
	xnorcc	%i1,	%l1,	%i0
loop_289:
	andcc	%i2,	%i3,	%i4
	orcc	%g5,	%o7,	%o2
	movuge	%fcc1,	0x41C,	%o6
	fmovsgu	%icc,	%f27,	%f18
	fmovdul	%fcc3,	%f16,	%f20
	call	loop_290
	movu	%fcc3,	0x00A,	%i7
	sll	%o5,	%g4,	%g7
	fandnot2s	%f31,	%f20,	%f0
loop_290:
	call	loop_291
	call	loop_292
	ldsw	[%l7 + 0x14],	%l2
	wr	%g0,	0x88,	%asi
	lda	[%l7 + 0x6C] %asi,	%f24
loop_291:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
loop_292:
	sll	%l3,	%g2,	%g6
	fpadd16s	%f28,	%f25,	%f17
	nop
	setx	0x0DDB0B28,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f15
	setx	0x192FAB33,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f9
	fadds	%f9,	%f15,	%f21
	brlz,a	%i5,	loop_293
	call	loop_294
	nop
	fitod	%f0,	%f8
	fdtox	%f8,	%f24
	call	loop_295
loop_293:
	fcmpgt16	%f30,	%f22,	%g3
loop_294:
	ta	%xcc,	0x7
	nop
	setx	0x39D585E693300C7C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0xB43FFAEB6F631272,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	fdivd	%f16,	%f16,	%f30
loop_295:
	call	loop_296
	flushw
	fxnor	%f28,	%f20,	%f20
	call	loop_297
loop_296:
	movneg	%icc,	%i6,	%l5
	fble,a,pt	%fcc2,	loop_298
	call	loop_299
loop_297:
	subccc	%o0,	0x0AE7,	%o3
	call	loop_300
loop_298:
	call	loop_301
loop_299:
	call	loop_302
	fandnot1s	%f14,	%f27,	%f13
loop_300:
	call	loop_303
loop_301:
	call	loop_304
loop_302:
	fandnot1	%f18,	%f28,	%f2
	fmovsuge	%fcc2,	%f11,	%f20
loop_303:
	call	loop_305
loop_304:
	fmul8x16al	%f3,	%f4,	%f20
	nop
	setx	0x862E603591616B2B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0x64717FD3,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	fsmuld	%f24,	%f0,	%f6
	mova	%icc,	%l4,	%o1
loop_305:
	ba,pt	%icc,	loop_306
	nop
	fitos	%f1,	%f0
	fstod	%f0,	%f20
	fmovdue	%fcc0,	%f24,	%f24
	fnot1	%f12,	%f24
loop_306:
	nop
	membar	#Sync
	set	0x40, %g2
	ldda	[%l7 + %g2] 0xf8,	%f0
	call	loop_307
	stbar
	movcc	%icc,	0x5CD,	%g1
	fmovrdlz	%l0,	%f4,	%f20
loop_307:
	edge8ln	%o4,	%l1,	%i1
	wrpr	%i0,	%i3,	%cwp
	lduw	[%l7 + 0x30],	%i4
	call	loop_308
	fpadd32s	%f31,	%f6,	%f2
	call	loop_309
	call	loop_310
loop_308:
	call	loop_311
	call	loop_312
loop_309:
	fones	%f11
loop_310:
	call	loop_313
loop_311:
	smul	%g5,	0x1168,	%i2
loop_312:
	fabss	%f8,	%f0
	fmovsge	%icc,	%f30,	%f14
loop_313:
	nop
	fitod	%f6,	%f20
	fdtos	%f20,	%f20
	ta	%icc,	0x1
	pdist	%f2,	%f26,	%f26
	xorcc	%o2,	%o7,	%i7
	addccc	%o6,	%o5,	%g7
	fbg	%fcc2,	loop_314
	wrpr	%g4,	%l6,	%tick
	fpsub16	%f2,	%f20,	%f26
	array16	%l2,	%g2,	%g6
loop_314:
	fpadd16s	%f12,	%f15,	%f15
	call	loop_315
	fmovscs	%icc,	%f1,	%f13
	call	loop_316
	call	loop_317
loop_315:
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	call	loop_318
loop_316:
	call	loop_319
loop_317:
	movcs	%xcc,	0x07A,	%i5
	set	0x18, %o6
	stda	%l2,	[%l7 + %o6] 0xe2
	membar	#Sync
loop_318:
	fcmpeq32	%f2,	%f4,	%i6
loop_319:
	call	loop_320
	fba	%fcc3,	loop_321
	wrpr 	%g0, 	0x3, 	%gl
	andncc	%o3,	0x1EE6,	%o0
loop_320:
	edge16	%l4,	%g1,	%l0
loop_321:
	srl	%o1,	%l1,	%o4
	subc	%i0,	%i3,	%i1
	call	loop_322
	edge8ln	%i4,	%g5,	%o2
	fmovdu	%fcc0,	%f0,	%f10
	fones	%f15
loop_322:
	call	loop_323
	fmovdneg	%icc,	%f26,	%f0
	nop
	setx	0x7F866750,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f10
	setx	0x8C82A9ED,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f10
	fmuls	%f10,	%f10,	%f26
	st	%f20,	[%l7 + 0x70]
loop_323:
	call	loop_324
	flushw
	call	loop_325
	bcc,a	%icc,	loop_326
loop_324:
	bshuffle	%f10,	%f18,	%f10
	fmovscc	%icc,	%f2,	%f11
loop_325:
	flushw
loop_326:
	fcmpne16	%f2,	%f10,	%i2
	edge32	%i7,	%o7,	%o6
	fmovdg	%fcc2,	%f8,	%f12
	fmovdpos	%xcc,	%f2,	%f16
	nop
	setx	0x99DF6720,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f11
	setx	0x14BEF00B,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f26
	fsubs	%f26,	%f11,	%f10
	call	loop_327
	call	loop_328
	movgu	%xcc,	0x4DD,	%g7
	umul	%g4,	%o5,	%l2
loop_327:
	call	loop_329
loop_328:
	std	%g2,	[%l7 + 0x30]
	fmovda	%fcc1,	%f24,	%f20
	brlez,a	%l6,	loop_330
loop_329:
	fbul,a	%fcc2,	loop_331
	tsubcc	%i5,	0x153F,	%g6
	fmul8x16au	%f11,	%f10,	%f16
loop_330:
	fzeros	%f23
loop_331:
	call	loop_332
	fmovsue	%fcc2,	%f5,	%f1
	fmovso	%fcc1,	%f6,	%f29
loop_332:
	nop

	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 1:
!
!	Type l   	: 31
!	Type a   	: 28
!	Type x   	: 11
!	Type cti   	: 162
!	Type f   	: 146
!	Type i   	: 122
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
	set	0x5,	%g1
	set	0xE,	%g2
	set	0xD,	%g3
	set	0x4,	%g4
	set	0x2,	%g5
	set	0xA,	%g6
	set	0x2,	%g7
	!# Input registers
	set	-0x7,	%i0
	set	-0xD,	%i1
	set	-0x7,	%i2
	set	-0xA,	%i3
	set	-0x3,	%i4
	set	-0xD,	%i5
	set	-0x0,	%i6
	set	-0xC,	%i7
	!# Local registers
	set	0x4BBF7790,	%l0
	set	0x5B7C6E4A,	%l1
	set	0x140E6FE0,	%l2
	set	0x30A6C8EB,	%l3
	set	0x56FA246C,	%l4
	set	0x13DAC258,	%l5
	set	0x6A22BCE6,	%l6
	!# Output registers
	set	-0x1B55,	%o0
	set	0x1D42,	%o1
	set	-0x1C35,	%o2
	set	0x1C5D,	%o3
	set	-0x163D,	%o4
	set	0x0362,	%o5
	set	-0x10BC,	%o6
	set	0x0DA0,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0xDF0ECADE0EF32D6C)
	INIT_TH_FP_REG(%l7,%f2,0xD39FBDF2FF8041F1)
	INIT_TH_FP_REG(%l7,%f4,0x28E8DA40A34F7AF5)
	INIT_TH_FP_REG(%l7,%f6,0x1ED95E842FE99A93)
	INIT_TH_FP_REG(%l7,%f8,0xC75F90F668FE95A4)
	INIT_TH_FP_REG(%l7,%f10,0xB5604C572AF6B3B0)
	INIT_TH_FP_REG(%l7,%f12,0xD2A237325CE89EBE)
	INIT_TH_FP_REG(%l7,%f14,0x2B3C65BA4DFB4A5E)
	INIT_TH_FP_REG(%l7,%f16,0x8CF05B6E45FCA256)
	INIT_TH_FP_REG(%l7,%f18,0x40B4194346F8E401)
	INIT_TH_FP_REG(%l7,%f20,0xE43FCD95335A2B05)
	INIT_TH_FP_REG(%l7,%f22,0xBC76F48ADA21346E)
	INIT_TH_FP_REG(%l7,%f24,0xA92EAFE66D619A84)
	INIT_TH_FP_REG(%l7,%f26,0x685FBAEE804725AF)
	INIT_TH_FP_REG(%l7,%f28,0xE4E0B45FBC8156B8)
	INIT_TH_FP_REG(%l7,%f30,0x2C0ED2C6B4BF932A)

	!# Execute Main Diag ..

	nop
	set	0x57, %i3
	ldstub	[%l7 + %i3],	%l3
	fmovdle	%fcc3,	%f2,	%f4
	call	loop_333
	call	loop_334
	edge32	%i6,	%l5,	%g3
	movne	%icc,	0x6D8,	%o3
loop_333:
	xorcc	%o0,	%g1,	%l0
loop_334:
	flushw
	add	%l7,	0x70,	%l6
	wr	%g0,	0x04,	%asi
	lda	[%l6] %asi,	%l4
	casa	[%l6] 0x04,	%l4,	%o1
	fmovrsgz	%o4,	%f5,	%f14
	fmovrdlez	%l1,	%f4,	%f2
	call	loop_335
	call	loop_336
	tsubcc	%i0,	0x166A,	%i1
	tge	%icc,	0x0
loop_335:
	fmovscs	%xcc,	%f12,	%f21
loop_336:
	call	loop_337
	fbuge,a	%fcc1,	loop_338
	call	loop_339
	fornot2	%f18,	%f4,	%f12
loop_337:
	xor	%i4,	0x1972,	%i3
loop_338:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
loop_339:
	call	loop_340
	nop
	setx	0x7A4FCDA27FC7437C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0x3DA1BE39F12B0ADC,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	fdivd	%f24,	%f30,	%f12
	call	loop_341
	rdhpr	%hintp,	%o2
loop_340:
	bn	%xcc,	loop_342
	wrpr	%i7,	0x1B19,	%cwp
loop_341:
	call	loop_343
	call	loop_344
loop_342:
	edge32ln	%i2,	%o7,	%o6
	nop
	fitod	%f0,	%f18
	fdtox	%f18,	%f4
	fxtod	%f4,	%f30
loop_343:
	fpadd16	%f16,	%f18,	%f10
loop_344:
	call	loop_345
	call	loop_346
	movre	%g7,	0x355,	%g4
	fmovdcs	%icc,	%f22,	%f10
loop_345:
	call	loop_347
loop_346:
	call	loop_348
	call	loop_349
	call	loop_350
loop_347:
	nop
	fitos	%f11,	%f28
	fstoi	%f28,	%f29
loop_348:
	call	loop_351
loop_349:
	st	%f24,	[%l7 + 0x28]
loop_350:
	fmovsn	%fcc3,	%f26,	%f12
	nop
	setx	0xE7F1F582331D5AFF,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0x32FB8DF13AF06895,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	fdivd	%f20,	%f26,	%f6
loop_351:
	rd	%tick_cmpr,	%l2
	tsubcctv	%g2,	%l6,	%o5
	call	loop_352
	brlz	%g6,	loop_353
	call	loop_354
	call	loop_355
loop_352:
	andncc	%i5,	0x052E,	%i6
loop_353:
	fmovdpos	%icc,	%f0,	%f16
loop_354:
	call	loop_356
loop_355:
	call	loop_357
	movrgez	%l5,	0x3E6,	%g3
	fmovsg	%fcc2,	%f24,	%f6
loop_356:
	array16	%o3,	%o0,	%l3
loop_357:
	fbuge	%fcc1,	loop_358
	nop
	setx	0x36A0B35BF7458EAB,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0x55EF205548E10667,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	faddd	%f10,	%f22,	%f24
	addc	%l0,	0x0275,	%g1
	fbue,a	%fcc3,	loop_359
loop_358:
	mova	%xcc,	0x3A1,	%o1
	rdpr	%gl,	%l4
	ld	[%l7 + 0x64],	%f6
loop_359:
	nop
	setx	0xDEAA2DCD,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f9
	setx	0xEE198951,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f2
	fsubs	%f2,	%f9,	%f5
	call	loop_360
	edge8ln	%o4,	%l1,	%i1
	addc	%i4,	%i3,	%g5
	bg,a	%xcc,	loop_361
loop_360:
	fbge,pn	%fcc1,	loop_362
	addccc	%i0,	%o2,	%i2
	call	loop_363
loop_361:
	tne	%icc,	0x7
loop_362:
	fabss	%f6,	%f3
	fornot1	%f4,	%f6,	%f26
loop_363:
	nop
	set	0x60, %i4
	ldda	[%l7 + %i4] 0x04,	%o6
	movul	%fcc1,	0x7BB,	%i7
	fornot2s	%f31,	%f21,	%f19
	fornot1s	%f24,	%f30,	%f11
	fmovdo	%fcc1,	%f22,	%f18
	call	loop_364
	alignaddrl	%g7,	%o6,	%l2
	fcmple32	%f28,	%f6,	%g4
	wr	%g0,	0x0c,	%asi
	prefetcha	[%l7 + 0x10] %asi,	 2
loop_364:
	movge	%xcc,	0x494,	%o5
	fmovsue	%fcc0,	%f7,	%f0
	fcmple32	%f18,	%f24,	%l6
	fcmpgt32	%f30,	%f2,	%g6
	call	loop_365
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	call	loop_366
	fcmpgt32	%f6,	%f28,	%i5
loop_365:
	call	loop_367
	call	loop_368
loop_366:
	fmovrdlez	%i6,	%f26,	%f14
	call	loop_369
loop_367:
	fcmpd	%fcc2,	%f28,	%f28
loop_368:
	call	loop_370
	ldx	[%l7 + 0x18],	%l5
loop_369:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x38F, 	%hsys_tick_cmpr
	alignaddrl	%l3,	%l0,	%g1
loop_370:
	tvs	%icc,	0x2
	bshuffle	%f16,	%f16,	%f16
	rd	%asi,	%g3
	call	loop_371
	fmovsg	%fcc1,	%f20,	%f24
	call	loop_372
	mova	%xcc,	%o1,	%l4
loop_371:
	fbl,a	%fcc2,	loop_373
	movuge	%fcc3,	0x181,	%o4
loop_372:
	call	loop_374
	srl	%l1,	0x00,	%i4
loop_373:
	nop
	setx	0x1916,	%l0,	%i3
	sdivx	%i1,	%i3,	%i0
	nop
	setx	0xEE7FA83C,	%l0,	%l6
	st	%l6,	[%l7 + 0x40]
	ld	[%l7 + 0x40],	%fsr
loop_374:
	fxnor	%f8,	%f0,	%f24
	movge	%fcc0,	%o2,	%i2
	call	loop_375
	fandnot2	%f4,	%f28,	%f20
	orcc	%o7,	0x000E,	%g5
	brlez,a,pt	%i7,	loop_376
loop_375:
	flushw
	fnot1	%f0,	%f8
	bpos,pt	%xcc,	loop_377
loop_376:
	nop
	fitos	%f9,	%f4
	nop
	fitod	%f6,	%f18
	fdtos	%f18,	%f4
	fmovdu	%fcc3,	%f8,	%f4
loop_377:
	be,a	%icc,	loop_378
	wrpr	%o6,	%l2,	%pil
	fmovrdne	%g4,	%f0,	%f4
	fmovdule	%fcc1,	%f8,	%f22
loop_378:
	movcs	%xcc,	0x06B,	%g7
	call	loop_379
	lduw	[%l7 + 0x38],	%o5
	call	loop_380
	movug	%fcc2,	0x064,	%l6
loop_379:
	sir	0x1825
	fmovrsgz	%g6,	%f22,	%f15
loop_380:
	nop
	wr	%g0,	0x2f,	%asi
	stxa	%g2,	[%l7 + 0x20] %asi
	membar	#Sync
	fcmpeq16	%f20,	%f30,	%i6
	fmul8x16au	%f20,	%f25,	%f24
	call	loop_381
	call	loop_382
	brnz	%i5,	loop_383
	movn	%fcc2,	0x226,	%l5
loop_381:
	andncc	%o3,	%o0,	%l3
loop_382:
	tneg	%icc,	0x0
loop_383:
	fcmpne32	%f10,	%f20,	%l0
	fmovrdgz	%g1,	%f26,	%f20
	rd	%sys_tick_cmpr,	%o1
	set	0x2D, %l6
	ldsba	[%l7 + %l6] 0x81,	%g3
	movvc	%xcc,	%o4,	%l1
	fblg,pn	%fcc3,	loop_384
	fmovrde	%l4,	%f28,	%f20
	movn	%icc,	0x3F4,	%i4
	call	loop_385
loop_384:
	smul	%i1,	%i3,	%i0
	call	loop_386
	call	loop_387
loop_385:
	call	loop_388
	bpos,a,pt	%xcc,	loop_389
loop_386:
	call	loop_390
loop_387:
	call	loop_391
loop_388:
	sll	%i2,	%o2,	%o7
loop_389:
	fpadd32s	%f5,	%f7,	%f21
loop_390:
	call	loop_392
loop_391:
	fmovdle	%fcc3,	%f26,	%f14
	call	loop_393
	call	loop_394
loop_392:
	bshuffle	%f22,	%f16,	%f8
	addc	%i7,	%o6,	%g5
loop_393:
	fble,a,pt	%fcc2,	loop_395
loop_394:
	call	loop_396
	fbne,a	%fcc3,	loop_397
	edge32l	%g4,	%l2,	%o5
loop_395:
	call	loop_398
loop_396:
	xnor	%l6,	%g7,	%g6
loop_397:
	call	loop_399
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
loop_398:
	nop
	fitos	%f9,	%f11
	fstox	%f11,	%f2
	call	loop_400
loop_399:
	tcc	%xcc,	0x7
	fpsub16s	%f11,	%f5,	%f26
	fmovdn	%xcc,	%f6,	%f8
loop_400:
	fmovrsgez	%g2,	%f2,	%f4
	fnot1	%f28,	%f28
	call	loop_401
	smulcc	%i6,	0x016D,	%l5
	taddcctv	%o3,	%i5,	%o0
	call	loop_402
loop_401:
	fmovsue	%fcc3,	%f23,	%f0
	fbuge,pt	%fcc2,	loop_403
	bge,a,pn	%icc,	loop_404
loop_402:
	nop
	setx	0x5423FCDBF10683D9,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	fsqrtd	%f8,	%f4
	call	loop_405
loop_403:
	tle	%xcc,	0x0
loop_404:
	fbue	%fcc0,	loop_406
	membar	0x0D
loop_405:
	subc	%l3,	%l0,	%g1
	tge	%xcc,	0x2
loop_406:
	movn	%xcc,	0x614,	%g3
	fands	%f9,	%f16,	%f19
	sdivx	%o1,	0x0CAC,	%l1
	call	loop_407
	fpack16	%f6,	%f25
	call	loop_408
	call	loop_409
loop_407:
	fmovsvs	%icc,	%f27,	%f9
	fornot1	%f20,	%f30,	%f12
loop_408:
	call	loop_410
loop_409:
	stb	%o4,	[%l7 + 0x0A]
	call	loop_411
	rdhpr	%hpstate,	%l4
loop_410:
	edge16	%i4,	%i1,	%i3
	fmovdu	%fcc0,	%f12,	%f10
loop_411:
	smulcc	%i2,	%o2,	%i0
	call	loop_412
	umul	%o7,	0x0BBE,	%o6
	movcc	%icc,	0x6C0,	%g5
	movrne	%g4,	%l2,	%o5
loop_412:
	call	loop_413
	fbg	%fcc0,	loop_414
	taddcc	%i7,	%l6,	%g6
	membar	#Sync
	wr	%g0,	0xf9,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
loop_413:
	call	loop_415
loop_414:
	edge16n	%g7,	%g2,	%i6
	call	loop_416
	fmovsneg	%icc,	%f18,	%f9
loop_415:
	nop
	set	0x48, %l0
	stxa	%l5,	[%l7 + %l0] 0x04
loop_416:
	call	loop_417
	call	loop_418
	fmovscc	%icc,	%f22,	%f29
	movge	%fcc1,	0x0D3,	%o3
loop_417:
	rd	%sys_tick_cmpr,	%o0
loop_418:
	fmul8ulx16	%f6,	%f26,	%f22
	umulcc	%i5,	%l0,	%g1
	call	loop_419
	fnegd	%f0,	%f26
	nop
	setx	0x910C446D,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f17
	fsqrts	%f17,	%f12
	array8	%l3,	%o1,	%l1
loop_419:
	fnegd	%f22,	%f0
	fnot2s	%f6,	%f17
	fmovdl	%fcc3,	%f2,	%f8
	udiv	%g3,	0x1264,	%l4
	fmovdleu	%icc,	%f2,	%f8
	fmovsg	%icc,	%f18,	%f26
	fmovdne	%fcc3,	%f28,	%f20
	fmovdlg	%fcc2,	%f20,	%f2
	wr	%g0,	0x80,	%asi
	stha	%i4,	[%l7 + 0x32] %asi

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	call	loop_420
	std	%o4,	[%l7 + 0x40]
	call	loop_421
	pdist	%f16,	%f8,	%f26
loop_420:
	nop
	set	0x38, %g3
	ldd	[%l7 + %g3],	%i2
	fandnot1s	%f27,	%f7,	%f0
loop_421:
	tsubcctv	%i2,	0x0435,	%i0
	fmovdul	%fcc2,	%f6,	%f24
	call	loop_422
	alignaddr	%o7,	%o6,	%o2
	wr	%g4,	0x0826,	%y
	call	loop_423
loop_422:
	call	loop_424
	brlz,a,pn	%l2,	loop_425
	umulcc	%o5,	%i7,	%l6
loop_423:
	fornot1	%f2,	%f12,	%f22
loop_424:
	fmovdleu	%xcc,	%f24,	%f20
loop_425:
	call	loop_426
	wr	%g6,	0x14AD,	%y
	call	loop_427
	call	loop_428
loop_426:
	call	loop_429
	call	loop_430
loop_427:
	call	loop_431
loop_428:
	sub	%g5,	0x02BD,	%g7
loop_429:
	nop
	set	0x2F, %l1
	ldsb	[%l7 + %l1],	%i6
loop_430:
	rdpr	%cwp,	%l5
loop_431:
	flushw
	edge8l	%o3,	%o0,	%i5
	fcmpeq16	%f18,	%f8,	%g2
	andn	%l0,	0x1866,	%g1
	addc	%o1,	0x18E2,	%l3
	smulcc	%l1,	0x1C7D,	%g3
	call	loop_432
	call	loop_433
	fmovdug	%fcc1,	%f14,	%f18
	call	loop_434
loop_432:
	fones	%f29
loop_433:
	nop
	setx	0x768CB1A974271345,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0xE92F918BC08620F2,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	faddd	%f30,	%f12,	%f16
	fcmps	%fcc0,	%f9,	%f16
loop_434:
	nop
	fitod	%f26,	%f24
	call	loop_435
	call	loop_436
	edge32	%l4,	%i1,	%o4
	call	loop_437
loop_435:
	fmovdule	%fcc1,	%f2,	%f16
loop_436:
	call	loop_438
	mulx	%i4,	0x1C1D,	%i2
loop_437:
	ta	%xcc,	0x1
	call	loop_439
loop_438:
	bn,a	%xcc,	loop_440
	fmovsul	%fcc1,	%f7,	%f14
	call	loop_441
loop_439:
	edge8n	%i0,	%i3,	%o6
loop_440:
	call	loop_442
	fmovse	%fcc0,	%f8,	%f25
loop_441:
	fpmerge	%f27,	%f26,	%f28
	edge8ln	%o7,	%o2,	%g4
loop_442:
	umulcc	%o5,	0x13DD,	%l2
	call	loop_443
	for	%f0,	%f14,	%f2
	call	loop_444
	fmovsvs	%xcc,	%f7,	%f0
loop_443:
	nop
	fitos	%f17,	%f21
	mova	%fcc3,	%i7,	%l6
loop_444:
	call	loop_445
	fcmpeq16	%f10,	%f24,	%g5
	fmovsug	%fcc3,	%f31,	%f7
	call	loop_446
loop_445:
	fmovdo	%fcc2,	%f4,	%f26
	nop
	setx	0x0082,	%l0,	%i6
	udiv	%g7,	%i6,	%l5
	fmovsu	%fcc0,	%f30,	%f3
loop_446:
	call	loop_447
	call	loop_448
	alignaddrl	%g6,	%o0,	%o3
	orncc	%g2,	%i5,	%g1
loop_447:
	brgez,a	%l0,	loop_449
loop_448:
	call	loop_450
	rdpr	%tba,	%o1
	fand	%f2,	%f10,	%f18
loop_449:
	movule	%fcc2,	0x3DA,	%l3
loop_450:
	fcmpeq32	%f10,	%f4,	%g3
	call	loop_451
	tneg	%icc,	0x3
	nop
	setx	0x1187,	%l0,	%i1
	udivcc	%l1,	%i1,	%o4
	brlez	%i4,	loop_452
loop_451:
	movule	%fcc1,	%l4,	%i2
	rdpr	%wstate,	%i3
	rd	%y,	%o6
loop_452:
	andncc	%o7,	0x0300,	%i0
	wrpr	%g4,	%o5,	%cwp
	fmovsn	%fcc2,	%f16,	%f21
	movrlz	%l2,	0x24F,	%i7
	call	loop_453
	call	loop_454
	pdist	%f16,	%f28,	%f8
	fmovdl	%fcc1,	%f22,	%f30
loop_453:
	call	loop_455
loop_454:
	nop
	setx	loop_456,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x004100001401,	%l0,	%l1
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
	call	loop_457
	fabsd	%f6,	%f20
loop_455:
	movrlz	%l6,	%g5,	%o2
loop_456:
	srl	%g7,	0x02,	%i6
loop_457:
	movre	%g6,	%o0,	%o3
	call	loop_458
	call	loop_459
	fmovde	%fcc0,	%f24,	%f26
	fcmpd	%fcc0,	%f16,	%f20
loop_458:
	movcs	%xcc,	%g2,	%l5
loop_459:
	call	loop_460
	andcc	%i5,	%l0,	%o1
	alignaddr	%l3,	%g3,	%l1
	fnegs	%f16,	%f4
loop_460:
	call	loop_461
	subccc	%g1,	%o4,	%i4
	fxors	%f6,	%f1,	%f2
	wr	%l4,	0x0ADB,	%softint
loop_461:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	edge32n	%o6,	%i3,	%o7
	fmovrdlez	%i0,	%f12,	%f28
	fbul	%fcc2,	loop_462
	fmovdue	%fcc0,	%f12,	%f28
	tvs	%icc,	0x4
	fmovsg	%fcc2,	%f23,	%f1
loop_462:
	edge16l	%g4,	%l2,	%i7
	ld	[%l7 + 0x58],	%f17
	taddcctv	%o5,	0x0601,	%g5
	call	loop_463
	nop
	fitod	%f8,	%f8
	fdtox	%f8,	%f0
	fxtod	%f0,	%f26
	fbge,a,pn	%fcc3,	loop_464
	movug	%fcc0,	0x358,	%o2
loop_463:
	smul	%g7,	0x0D5A,	%l6
	nop
	setx	0x878B5391,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f6
	setx	0x45EA9961,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f0
	fsubs	%f0,	%f6,	%f21
loop_464:
	call	loop_465
	call	loop_466
	call	loop_467
	array16	%g6,	%o0,	%o3
loop_465:
	andn	%i6,	0x1491,	%g2
loop_466:
	call	loop_468
loop_467:
	fbule,a	%fcc2,	loop_469
	fands	%f22,	%f24,	%f24
	call	loop_470
loop_468:
	fzero	%f20
loop_469:
	call	loop_471
	call	loop_472
loop_470:
	fcmpgt16	%f0,	%f28,	%i5
	fmovscs	%xcc,	%f18,	%f23
loop_471:
	movrne	%l5,	0x0C2,	%l0
loop_472:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xC66, 	%hsys_tick_cmpr
	fble,a	%fcc1,	loop_473
	call	loop_474
	call	loop_475
	call	loop_476
loop_473:
	fnegd	%f16,	%f12
loop_474:
	call	loop_477
loop_475:
	brlez,a,pt	%o1,	loop_478
loop_476:
	fmovdl	%icc,	%f24,	%f24
	fmovdvs	%xcc,	%f0,	%f30
loop_477:
	nop
	fitos	%f3,	%f25
	fstox	%f25,	%f28
	fxtos	%f28,	%f8
loop_478:
	movvc	%xcc,	%g3,	%g1
	fmovsleu	%icc,	%f29,	%f21
	movrgez	%l1,	%o4,	%l4
	rdhpr	%hpstate,	%i2
	call	loop_479
	fnot2s	%f30,	%f29
	call	loop_480
	fmovscc	%icc,	%f18,	%f1
loop_479:
	call	loop_481
	swap	[%l7 + 0x18],	%i1
loop_480:
	fmovduge	%fcc1,	%f10,	%f22
	fmovdule	%fcc1,	%f10,	%f4
loop_481:
	edge8n	%o6,	%i3,	%i4
	set	0x28, %l2
	swapa	[%l7 + %l2] 0x19,	%o7
	call	loop_482
	call	loop_483
	call	loop_484
	call	loop_485
loop_482:
	edge8n	%i0,	%g4,	%l2
loop_483:
	sll	%i7,	%o5,	%g5
loop_484:
	membar	0x37
loop_485:
	call	loop_486
	call	loop_487
	movpos	%xcc,	%g7,	%o2
	call	loop_488
loop_486:
	nop
	setx	0xACD7144E,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f7
	setx	0x2E44AB79,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f6
	fmuls	%f6,	%f7,	%f25
loop_487:
	nop
	set	0x70, %g5
	prefetcha	[%l7 + %g5] 0x88,	 2
loop_488:
	call	loop_489
	nop
	fitod	%f6,	%f12
	fdtos	%f12,	%f25
	movue	%fcc3,	%l6,	%o3
	tcc	%xcc,	0x0
loop_489:
	fabss	%f20,	%f25
	call	loop_490
	tcc	%xcc,	0x4
	call	loop_491
	tcs	%icc,	0x1
loop_490:
	orncc	%i6,	%g2,	%i5
	brlz,a	%o0,	loop_492
loop_491:
	rdpr	%cansave,	%l5
	pdist	%f28,	%f16,	%f4
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
loop_492:
	call	loop_493
	nop
	setx	0xB88AD80C0D5C8437,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0xC04329B3E98F42A6,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	faddd	%f30,	%f6,	%f2
	movul	%fcc1,	0x687,	%l3
	nop
	setx	loop_494,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x011100001402,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_493:
	fornot1s	%f7,	%f19,	%f29
	fmul8ulx16	%f14,	%f10,	%f0
	movuge	%fcc0,	%l0,	%o1
loop_494:
	nop
	setx loop_495, %l0, %l1
	jmpl %l1, %g1
	nop
	setx	0x0ADA,	%l0,	%l1
	sdivx	%g3,	%l1,	%l4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x2D7, 	%tick_cmpr
	fmovdlg	%fcc2,	%f0,	%f6
loop_495:
	call	loop_496
	xnorcc	%i2,	0x0171,	%i1
	fblg,a	%fcc3,	loop_497
	movrlez	%i3,	0x182,	%o6
loop_496:
	fmovsvs	%xcc,	%f20,	%f5
	fcmpd	%fcc3,	%f8,	%f14
loop_497:
	lduh	[%l7 + 0x36],	%o7
	nop
	setx	0xC59CE5F4D5DDA133,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	setx	0x434C6C4D,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	fsmuld	%f6,	%f18,	%f6
	fones	%f27
	rdpr	%gl,	%i0
	fmovdgu	%icc,	%f0,	%f0
	fmovscs	%icc,	%f16,	%f11
	edge32l	%g4,	%i4,	%i7
	call	loop_498
	tcs	%icc,	0x5
	fmovdgu	%icc,	%f2,	%f8
	nop
	fitos	%f14,	%f16
	fstod	%f16,	%f4
loop_498:
	mulx	%o5,	0x0814,	%l2
	rd	%pc,	%g7
	nop
	fitos	%f8,	%f5
	call	loop_499
	call	loop_500
	call	loop_501
	wr	%g5,	0x011C,	%y
loop_499:
	xnorcc	%g6,	0x0F91,	%l6
loop_500:
	nop
	setx	0x070E,	%l0,	%i6
	udiv	%o2,	%i6,	%o3
loop_501:
	nop
	setx	0x08A1,	%l0,	%i5
	udivx	%g2,	%i5,	%o0
	tvs	%icc,	0x7
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 2:
!
!	Type l   	: 23
!	Type a   	: 28
!	Type x   	: 10
!	Type cti   	: 169
!	Type f   	: 138
!	Type i   	: 132
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
	set	0x5,	%g1
	set	0xB,	%g2
	set	0x0,	%g3
	set	0x6,	%g4
	set	0x6,	%g5
	set	0x5,	%g6
	set	0xC,	%g7
	!# Input registers
	set	-0x5,	%i0
	set	-0x3,	%i1
	set	-0x3,	%i2
	set	-0x3,	%i3
	set	-0x3,	%i4
	set	-0xE,	%i5
	set	-0x6,	%i6
	set	-0xC,	%i7
	!# Local registers
	set	0x6FF417DD,	%l0
	set	0x494619EA,	%l1
	set	0x541BD8A7,	%l2
	set	0x4A163CFB,	%l3
	set	0x460D0DC6,	%l4
	set	0x015B977D,	%l5
	set	0x519059D6,	%l6
	!# Output registers
	set	0x0D99,	%o0
	set	0x08FA,	%o1
	set	-0x097B,	%o2
	set	-0x1B28,	%o3
	set	-0x16DF,	%o4
	set	0x0FBC,	%o5
	set	-0x0BB8,	%o6
	set	-0x1E0D,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0xDF0ECADE0EF32D6C)
	INIT_TH_FP_REG(%l7,%f2,0xD39FBDF2FF8041F1)
	INIT_TH_FP_REG(%l7,%f4,0x28E8DA40A34F7AF5)
	INIT_TH_FP_REG(%l7,%f6,0x1ED95E842FE99A93)
	INIT_TH_FP_REG(%l7,%f8,0xC75F90F668FE95A4)
	INIT_TH_FP_REG(%l7,%f10,0xB5604C572AF6B3B0)
	INIT_TH_FP_REG(%l7,%f12,0xD2A237325CE89EBE)
	INIT_TH_FP_REG(%l7,%f14,0x2B3C65BA4DFB4A5E)
	INIT_TH_FP_REG(%l7,%f16,0x8CF05B6E45FCA256)
	INIT_TH_FP_REG(%l7,%f18,0x40B4194346F8E401)
	INIT_TH_FP_REG(%l7,%f20,0xE43FCD95335A2B05)
	INIT_TH_FP_REG(%l7,%f22,0xBC76F48ADA21346E)
	INIT_TH_FP_REG(%l7,%f24,0xA92EAFE66D619A84)
	INIT_TH_FP_REG(%l7,%f26,0x685FBAEE804725AF)
	INIT_TH_FP_REG(%l7,%f28,0xE4E0B45FBC8156B8)
	INIT_TH_FP_REG(%l7,%f30,0x2C0ED2C6B4BF932A)

	!# Execute Main Diag ..

	call	loop_502
	smulcc	%l3,	%l0,	%o1
	and	%l5,	%g3,	%l1
	fandnot1s	%f19,	%f6,	%f17
loop_502:
	call	loop_503
	call	loop_504
	fsrc2s	%f6,	%f10
	call	loop_505
loop_503:
	fornot1	%f18,	%f18,	%f4
loop_504:
	ba,a,pn	%icc,	loop_506
	fones	%f22
loop_505:
	call	loop_507
	fcmpes	%fcc3,	%f25,	%f7
loop_506:
	call	loop_508
	call	loop_509
loop_507:
	fpmerge	%f8,	%f5,	%f0
	fsrc2	%f4,	%f24
loop_508:
	call	loop_510
loop_509:
	call	loop_511
	xor	%l4,	0x195F,	%g1
	call	loop_512
loop_510:
	tneg	%xcc,	0x7
loop_511:
	call	loop_513
	edge16n	%i2,	%o4,	%i3
loop_512:
	call	loop_514
	nop
	setx	0x11F1,	%l0,	%o7
	udivx	%i1,	%o7,	%o6
loop_513:
	call	loop_515
	fmovd	%f20,	%f0
loop_514:
	fcmple16	%f24,	%f26,	%g4
	call	loop_516
loop_515:
	fnegs	%f25,	%f30
	wrpr 	%g0, 	0x3, 	%gl
	fmovrslez	%o5,	%f9,	%f5
loop_516:
	fmovsvs	%xcc,	%f31,	%f9
	nop
	setx	0x5DBD33E5,	%l0,	%l6
	st	%l6,	[%l7 + 0x60]
	ld	[%l7 + 0x60],	%fsr
	fmovspos	%xcc,	%f22,	%f0
	nop
	fitod	%f8,	%f18
	fdtox	%f18,	%f20
	rd	%sys_tick_cmpr,	%l2
	movl	%fcc1,	0x4A7,	%g7
	fxor	%f20,	%f24,	%f2
	nop
	fitod	%f12,	%f4
	fdtoi	%f4,	%f10
	udivx	%i7,	0x1287,	%g5
	addc	%g6,	%o2,	%l6
	bn,a,pn	%xcc,	loop_517
	fabss	%f22,	%f26
	rd	%sys_tick_cmpr,	%i6
	wr	%o3,	0x0296,	%ccr
loop_517:
	fmul8x16al	%f23,	%f22,	%f10
	fpsub32s	%f16,	%f2,	%f0
	call	loop_518
	stw	%i5,	[%l7 + 0x50]
	movrlz	%o0,	%l3,	%l0
	xorcc	%g2,	%o1,	%l5
loop_518:
	fmovdue	%fcc2,	%f18,	%f0
	rdhpr	%hpstate,	%l1
	fand	%f0,	%f30,	%f2
	fpadd32	%f12,	%f10,	%f28
	nop
	fitos	%f11,	%f23
	fstox	%f23,	%f26
	fxtos	%f26,	%f21
	edge16n	%l4,	%g3,	%i2
	call	loop_519
	andn	%g1,	%o4,	%i3
	fmovrdlz	%i1,	%f8,	%f0
	movle	%xcc,	%o6,	%o7
loop_519:
	edge32n	%i4,	%i0,	%o5
	ble,pt	%xcc,	loop_520
	movcc	%icc,	%l2,	%g7
	edge16n	%g4,	%i7,	%g6
	fmovdl	%fcc1,	%f6,	%f0
loop_520:
	edge32	%o2,	%l6,	%g5
	edge32l	%i6,	%o3,	%o0
	movcs	%icc,	%i5,	%l0
	bmask	%g2,	%o1,	%l3
	fcmpne32	%f16,	%f30,	%l1
	fmovrslz	%l4,	%f9,	%f17
	fmovsl	%icc,	%f22,	%f21
	nop
	setx	0xEC80B93A,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f22
	setx	0x89CD3971,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f3
	fsubs	%f3,	%f22,	%f20
	fmovdvc	%xcc,	%f6,	%f14
	nop
	fitod	%f8,	%f16
	fdtox	%f16,	%f10
	fxtod	%f10,	%f14
	call	loop_521
	edge16l	%g3,	%i2,	%g1
	fmovslg	%fcc1,	%f26,	%f8
	tvc	%icc,	0x2
loop_521:
	call	loop_522
	nop
	set	0x24, %o2
	ldsw	[%l7 + %o2],	%o4
	rd	%asi,	%l5
	wr	%g0,	0x88,	%asi
	lduha	[%l7 + 0x6C] %asi,	%i1
loop_522:
	nop
	wr	%g0,	0x0c,	%asi
	lduwa	[%l7 + 0x44] %asi,	%i3
	call	loop_523
	srl	%o7,	%i4,	%o6
	fmovslg	%fcc2,	%f22,	%f3
	fandnot2s	%f28,	%f11,	%f3
loop_523:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	xorcc	%l2,	0x1F87,	%i0
	fbue,a,pn	%fcc3,	loop_524
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	andn	%g7,	%i7,	%g6
	fbge,a	%fcc2,	loop_525
loop_524:
	fnot2s	%f16,	%f21
	call	loop_526
	fmovdgu	%xcc,	%f10,	%f4
loop_525:
	edge16l	%g4,	%l6,	%g5
	call	loop_527
loop_526:
	call	loop_528
	nop
	set	0x38, %g4
	ldd	[%l7 + %g4],	%o2
	rdhpr	%hintp,	%i6
loop_527:
	umulcc	%o3,	0x050D,	%i5
loop_528:
	call	loop_529
	srax	%l0,	0x17,	%g2
	fands	%f3,	%f3,	%f3
	fsrc2	%f10,	%f16
loop_529:
	fcmped	%fcc0,	%f0,	%f12
	tleu	%xcc,	0x3
	call	loop_530
	swap	[%l7 + 0x24],	%o1
	fbuge,a	%fcc2,	loop_531
	edge16ln	%o0,	%l3,	%l1
loop_530:
	nop
	fitos	%f2,	%f30
	nop
	fitos	%f9,	%f1
	fstoi	%f1,	%f11
loop_531:
	call	loop_532
	bg,pn	%xcc,	loop_533
	edge32ln	%l4,	%i2,	%g1
	bn,pn	%xcc,	loop_534
loop_532:
	fbo,a,pt	%fcc2,	loop_535
loop_533:
	call	loop_536
	nop
	set	0x22, %i6
	lduh	[%l7 + %i6],	%o4
loop_534:
	fmovdlg	%fcc1,	%f12,	%f4
loop_535:
	call	loop_537
loop_536:
	alignaddr	%l5,	%g3,	%i1
	fmovrsgez	%i3,	%f18,	%f0
	fmovdcs	%xcc,	%f28,	%f14
loop_537:
	sdiv	%o7,	0x099B,	%i4
	call	loop_538
	fmul8sux16	%f4,	%f26,	%f30
	fmovsule	%fcc2,	%f9,	%f22
	call	loop_539
loop_538:
	tne	%icc,	0x1
	fabss	%f23,	%f31
	fexpand	%f18,	%f6
loop_539:
	rdpr	%tba,	%o6
	edge8n	%o5,	%i0,	%l2
	call	loop_540
	call	loop_541
	nop
	setx	0x406F991D20B45F77,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0x00C23896D5D7B441,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	fmuld	%f14,	%f26,	%f30

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_540:
	call	loop_542
loop_541:
	srlx	%g4,	%g6,	%g5
	movn	%icc,	0x325,	%l6
	tge	%xcc,	0x6
loop_542:
	movl	%xcc,	%o2,	%i6
	fnors	%f19,	%f5,	%f11
	call	loop_543
	fbule	%fcc3,	loop_544
	fnegd	%f30,	%f12
	wrpr 	%g0, 	0x2, 	%gl
loop_543:
	fmovrde	%g2,	%f18,	%f8
loop_544:
	pdist	%f6,	%f14,	%f30
	fsrc2	%f20,	%f28
	fmovdn	%xcc,	%f2,	%f0
	fexpand	%f19,	%f6
	movle	%fcc1,	0x24F,	%i5
	fmovrdgez	%o1,	%f2,	%f6
	movrlz	%l3,	0x29D,	%o0
	call	loop_545
	nop
	set	0x38, %l3
	stw	%l4,	[%l7 + %l3]
	call	loop_546
	fmovsa	%fcc3,	%f6,	%f12
loop_545:
	fmovsvc	%icc,	%f8,	%f15
	call	loop_547
loop_546:
	fmovsvs	%xcc,	%f27,	%f21
	fmovrdne	%l1,	%f12,	%f16
	call	loop_548
loop_547:
	fmovdgu	%icc,	%f14,	%f8
	nop
	fitos	%f6,	%f21
	fstod	%f21,	%f24
	call	loop_549
loop_548:
	call	loop_550
	rdhpr	%hintp,	%i2
	fzero	%f22
loop_549:
	fnot2	%f4,	%f28
loop_550:
	sub	%g1,	%l5,	%o4
	edge8n	%g3,	%i3,	%o7
	call	loop_551
	movneg	%icc,	%i4,	%o6
	move	%fcc1,	0x6CE,	%o5
	fmovdo	%fcc2,	%f0,	%f16
loop_551:
	call	loop_552
	call	loop_553
	call	loop_554
	nop
	setx	0x76E52BB1E4E4588F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0xAED4D0A1B56ABC93,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	fsubd	%f24,	%f6,	%f4
loop_552:
	nop
	add	%l7,	0x0C,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%i1
	casa	[%l6] 0x88,	%i1,	%i0
loop_553:
	fmovse	%fcc2,	%f24,	%f26
loop_554:
	fmovsl	%fcc2,	%f15,	%f23
	bne,a,pt	%icc,	loop_555
	fmovdue	%fcc3,	%f20,	%f24
	nop
	setx	0xBB0D025F,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f21
	setx	0x2FEF61C3,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f16
	fadds	%f16,	%f21,	%f8
	fmovdule	%fcc3,	%f14,	%f4
loop_555:
	fbl	%fcc1,	loop_556
	edge16ln	%i7,	%l2,	%g7
	fmovda	%xcc,	%f18,	%f16
	call	loop_557
loop_556:
	rd	%sys_tick_cmpr,	%g6
	call	loop_558
	fmovsgu	%xcc,	%f25,	%f10
loop_557:
	fmovrdlez	%g5,	%f28,	%f8
	popc	%l6,	%g4
loop_558:
	fmovdge	%xcc,	%f0,	%f12
	nop
	set	0x3F, %g7
	stb	%o2,	[%l7 + %g7]
	call	loop_559
	movpos	%xcc,	0x190,	%i6
	taddcctv	%o3,	0x1F86,	%g2
	call	loop_560
loop_559:
	fcmpeq16	%f18,	%f8,	%i5
	call	loop_561
	movge	%xcc,	0x363,	%o1
loop_560:
	udivx	%l0,	0x0C43,	%l3
	call	loop_562
loop_561:
	and	%l4,	%l1,	%o0
	brlez	%i2,	loop_563
	fandnot2s	%f14,	%f9,	%f26
loop_562:
	movre	%l5,	%o4,	%g1
	add	%g3,	%o7,	%i3
loop_563:
	call	loop_564
	srlx	%i4,	0x10,	%o6
	call	loop_565
	call	loop_566
loop_564:
	fbg	%fcc0,	loop_567
	call	loop_568
loop_565:
	movrlz	%o5,	%i0,	%i1
loop_566:
	call	loop_569
loop_567:
	call	loop_570
loop_568:
	mova	%icc,	%i7,	%l2
	call	loop_571
loop_569:
	fmovrse	%g6,	%f21,	%f12
loop_570:
	fsrc1s	%f16,	%f4
	set	0x36, %o3
	ldstuba	[%l7 + %o3] 0x19,	%g5
loop_571:
	flush	%l7 + 0x20
	tpos	%xcc,	0x5
	tsubcctv	%l6,	%g4,	%o2
	membar	0x2A
	call	loop_572
	movcc	%icc,	%i6,	%o3
	call	loop_573
	xnor	%g2,	%g7,	%i5
loop_572:
	fmovrsgz	%o1,	%f9,	%f0
	fbul,a,pt	%fcc0,	loop_574
loop_573:
	tg	%icc,	0x4
	call	loop_575
	fcmpgt32	%f16,	%f28,	%l3
loop_574:
	call	loop_576
	fbl,a,pn	%fcc1,	loop_577
loop_575:
	tsubcctv	%l4,	%l1,	%l0
	call	loop_578
loop_576:
	fmovs	%f27,	%f14
loop_577:
	call	loop_579
	call	loop_580
loop_578:
	edge8ln	%i2,	%l5,	%o4
	movgu	%icc,	0x5B7,	%o0
loop_579:
	fone	%f30
loop_580:
	fnot1s	%f0,	%f0
	brgz,a,pt	%g3,	loop_581
	movug	%fcc2,	%g1,	%i3
	call	loop_582
	call	loop_583
loop_581:
	call	loop_584
	call	loop_585
loop_582:
	fors	%f8,	%f7,	%f20
loop_583:
	subccc	%i4,	0x0A4E,	%o6
loop_584:
	call	loop_586
loop_585:
	fmovsn	%fcc1,	%f16,	%f15
	fmovrsgz	%o5,	%f27,	%f31
	nop
	fitos	%f10,	%f17
	fstox	%f17,	%f26
	fxtos	%f26,	%f30
loop_586:
	call	loop_587
	nop
	set	0x58, %l4
	prefetch	[%l7 + %l4],	 2
	rdhpr	%ver,	%i0
	fand	%f20,	%f18,	%f18
loop_587:
	xor	%i1,	0x1F52,	%i7
	tvs	%xcc,	0x5
	nop
	setx	0x147F,	%l0,	%o7
	udivx	%l2,	%o7,	%g6
	nop
	setx	loop_588,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x012400001406,	%l0,	%l1
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
	tcs	%xcc,	0x0
	call	loop_589
	rd	%asi,	%l6
loop_588:
	addc	%g4,	%g5,	%o2
	movue	%fcc2,	%o3,	%i6
loop_589:
	nop
	set	0x20, %o0
	ldda	[%l7 + %o0] 0x18,	%g2
	fmovdu	%fcc3,	%f28,	%f18
	nop
	setx	0xFE7B384CBFB5BFCE,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0x486E029C94E2DED2,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	fsubd	%f6,	%f8,	%f14
	wrpr	%g7,	0x1936,	%pil
	edge16l	%o1,	%i5,	%l4
	call	loop_590
	call	loop_591
	movleu	%xcc,	0x56D,	%l1
	srl	%l0,	0x18,	%l3
loop_590:
	fxnor	%f14,	%f22,	%f4
loop_591:
	fandnot2	%f12,	%f22,	%f18
	brnz,a,pn	%i2,	loop_592
	movvs	%icc,	0x638,	%o4
	bleu	%icc,	loop_593
	wr	%o0,	%g3,	%ccr
loop_592:
	call	loop_594
	tpos	%xcc,	0x4
loop_593:
	call	loop_595
	call	loop_596
loop_594:
	fandnot2s	%f21,	%f4,	%f27
	call	loop_597
loop_595:
	st	%f31,	[%l7 + 0x28]
loop_596:
	xnor	%l5,	0x0ED6,	%i3
	edge16	%g1,	%i4,	%o5
loop_597:
	fmovdleu	%xcc,	%f24,	%f2
	fpsub16s	%f28,	%f25,	%f25
	fbue	%fcc3,	loop_598
	call	loop_599
	rdpr	%pil,	%i0
	call	loop_600
loop_598:
	fnot1s	%f9,	%f18
loop_599:
	fmovrslez	%o6,	%f8,	%f27
	call	loop_601
loop_600:
	nop
	set	0x58, %g1
	sth	%i1,	[%l7 + %g1]
	fmovdcs	%icc,	%f8,	%f0
	call	loop_602
loop_601:
	call	loop_603
	nop
	setx	0x0377,	%l0,	%l2
	sdivx	%i7,	%l2,	%g6
	call	loop_604
loop_602:
	nop
	fitos	%f11,	%f12
	fstod	%f12,	%f28
loop_603:
	fmovd	%f18,	%f6
	bn	%xcc,	loop_605
loop_604:
	movo	%fcc0,	%o7,	%l6
	fmovdg	%xcc,	%f0,	%f18
	bcc	%icc,	loop_606
loop_605:
	call	loop_607
	nop
	fitod	%f2,	%f8
	fdtox	%f8,	%f28
	fmovse	%xcc,	%f5,	%f2
loop_606:
	andncc	%g5,	0x1EF4,	%g4
loop_607:
	fornot2	%f0,	%f12,	%f10
	movg	%fcc1,	%o3,	%o2
	call	loop_608
	fpadd16s	%f20,	%f30,	%f30
	call	loop_609
	wr 	%g0, 	0x6, 	%fprs
loop_608:
	fmovrdgz	%i6,	%f8,	%f8
	tl	%icc,	0x4
loop_609:
	call	loop_610
	move	%fcc1,	%g7,	%o1
	fmovdul	%fcc1,	%f8,	%f30
	wr	%i5,	0x0FB0,	%y
loop_610:
	ldsh	[%l7 + 0x50],	%l4
	fmovrsne	%l1,	%f6,	%f5
	fmovdo	%fcc3,	%f20,	%f2
	fmovdl	%fcc3,	%f30,	%f2
	call	loop_611
	flushw
	call	loop_612
	call	loop_613
loop_611:
	call	loop_614
	fmovdleu	%xcc,	%f12,	%f2
loop_612:
	call	loop_615
loop_613:
	fsrc1s	%f29,	%f8
loop_614:
	call	loop_616
	fandnot2s	%f29,	%f2,	%f31
loop_615:
	call	loop_617
	call	loop_618
loop_616:
	edge32n	%l3,	%l0,	%o4
	call	loop_619
loop_617:
	edge16l	%i2,	%o0,	%g3
loop_618:
	fmovse	%icc,	%f8,	%f2
	call	loop_620
loop_619:
	call	loop_621
	bshuffle	%f14,	%f12,	%f12
	membar	0x03
loop_620:
	for	%f18,	%f14,	%f6
loop_621:
	nop
	set	0x40, %i2
	stda	%f0,	[%l7 + %i2] 0xd9
	addccc	%i3,	%g1,	%l5
	tcs	%icc,	0x0
	sdivcc	%o5,	0x0FEF,	%i0
	fnot2	%f24,	%f2
	and	%i4,	%o6,	%i7
	bne,a,pt	%xcc,	loop_622
	srax	%l2,	%g6,	%o7
	rdhpr	%hintp,	%l6
	movuge	%fcc0,	0x3FD,	%g5
loop_622:
	nop
	fitod	%f6,	%f10
	fdtox	%f10,	%f22
	fxtod	%f22,	%f14
	fmovdul	%fcc2,	%f12,	%f6
	nop
	setx	0x6FDDEEA2,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f15
	fsqrts	%f15,	%f0
	call	loop_623
	srlx	%i1,	0x17,	%g4
	wr	%o2,	0x062E,	%set_softint
	fsrc2s	%f15,	%f26
loop_623:
	array32	%o3,	%g2,	%g7
	edge32n	%o1,	%i5,	%i6
	tcc	%xcc,	0x0
	nop
	setx	0xCFCEC725,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f29
	setx	0x58B582AD,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f28
	fdivs	%f28,	%f29,	%f6
	nop
	set	0x4C, %i7
	sth	%l1,	[%l7 + %i7]
	fmul8x16	%f16,	%f18,	%f6
	call	loop_624
	fpadd32s	%f28,	%f25,	%f18
	std	%l2,	[%l7 + 0x68]
	rd	%pc,	%l4
loop_624:
	call	loop_625
	call	loop_626
	addcc	%o4,	0x0DFC,	%i2
	fbge,a	%fcc1,	loop_627
loop_625:
	tleu	%icc,	0x5
loop_626:
	nop
	wr	%g0,	0x80,	%asi
	swapa	[%l7 + 0x34] %asi,	%o0
loop_627:
	fornot1s	%f19,	%f17,	%f8
	call	loop_628
	ldsb	[%l7 + 0x60],	%g3
	call	loop_629
	edge16l	%i3,	%g1,	%l5
loop_628:
	call	loop_630
	stbar
loop_629:
	nop
	fitod	%f0,	%f28
	call	loop_631
loop_630:
	rdpr	%cwp,	%o5
	fmovsu	%fcc1,	%f3,	%f9
	call	loop_632
loop_631:
	nop
	setx loop_633, %l0, %l1
	jmpl %l1, %i0
	subcc	%l0,	0x1324,	%o6
	nop
	setx	0x6E1E9108ABAC29F6,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	fsqrtd	%f4,	%f10
loop_632:
	popc	0x0CF3,	%i7
loop_633:
	umulcc	%i4,	0x0EF2,	%l2
	nop
	setx	loop_634,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x021100001401,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fmovsneg	%xcc,	%f20,	%f21
	call	loop_635
	umulcc	%g6,	%o7,	%g5
loop_634:
	for	%f4,	%f14,	%f24
	fbl,pt	%fcc0,	loop_636
loop_635:
	call	loop_637
	xnor	%l6,	%g4,	%i1
	call	loop_638
loop_636:
	bvc	%xcc,	loop_639
loop_637:
	xnor	%o2,	0x05DD,	%g2
	call	loop_640
loop_638:
	movge	%icc,	0x2D6,	%o3
loop_639:
	fmovsn	%xcc,	%f3,	%f13
	call	loop_641
loop_640:
	srlx	%o1,	0x02,	%g7
	bvs,a	%xcc,	loop_642
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
loop_641:
	fxor	%f20,	%f14,	%f8
	fmovde	%xcc,	%f28,	%f26
loop_642:
	tn	%icc,	0x1
	tcc	%icc,	0x7
	fcmpne32	%f22,	%f30,	%i5
	fnand	%f12,	%f10,	%f12
	rd	%sys_tick_cmpr,	%i6
	wrpr	%l3,	%l4,	%tick
	nop
	setx	0x8485EC5C,	%l0,	%l6
	st	%l6,	[%l7 + 0x6C]
	ld	[%l7 + 0x6C],	%fsr
	subc	%o4,	%l1,	%o0
	fcmpeq32	%f30,	%f24,	%i2
	fmovsneg	%icc,	%f19,	%f11
	set	0x11, %l5
	ldsba	[%l7 + %l5] 0x19,	%i3
	addccc	%g3,	0x0F81,	%l5
	call	loop_643
	movug	%fcc0,	%o5,	%g1
	fands	%f22,	%f0,	%f22
	call	loop_644
loop_643:
	rdpr	%pil,	%l0
	call	loop_645
	tgu	%icc,	0x2
loop_644:
	tcs	%xcc,	0x3
	fmovsvc	%xcc,	%f3,	%f31
loop_645:
	orn	%i0,	0x09F8,	%i7
	call	loop_646
	fbo,a	%fcc1,	loop_647
	call	loop_648
	rdhpr	%hsys_tick_cmpr,	%i4
loop_646:
	fbo,a	%fcc2,	loop_649
loop_647:
	st	%f18,	[%l7 + 0x54]
loop_648:
	fpsub32s	%f0,	%f14,	%f16
	call	loop_650
loop_649:
	fmovsg	%xcc,	%f7,	%f7
	rdhpr	%ver,	%l2
	call	loop_651
loop_650:
	tpos	%xcc,	0x0
	movrgez	%o6,	%o7,	%g5
	set	0x40, %i5
	ldda	[%l7 + %i5] 0x11,	%f0
loop_651:
	fxnor	%f18,	%f16,	%f30
	nop
	setx	0x7FF4C23B432D7EE0,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0xBA55ECEC61FF567D,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	fsubd	%f28,	%f28,	%f22
	fxnors	%f20,	%f18,	%f13
	subccc	%g6,	%l6,	%g4
	rdpr	%wstate,	%i1
	fbe,a,pn	%fcc0,	loop_652
	nop
	set	0x11, %o5
	ldsb	[%l7 + %o5],	%g2
	fmovsug	%fcc2,	%f25,	%f26
	call	loop_653
loop_652:
	tne	%xcc,	0x5
	set	0x56, %i0
	ldsha	[%l7 + %i0] 0x89,	%o2
loop_653:
	addcc	%o1,	%g7,	%i5
	movleu	%xcc,	0x415,	%i6
	fmovsne	%fcc1,	%f4,	%f0
	movu	%fcc2,	%o3,	%l4
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 3:
!
!	Type l   	: 30
!	Type a   	: 30
!	Type x   	: 10
!	Type cti   	: 152
!	Type f   	: 148
!	Type i   	: 130
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
	set	0x7,	%g1
	set	0xE,	%g2
	set	0x9,	%g3
	set	0x4,	%g4
	set	0x9,	%g5
	set	0xA,	%g6
	set	0x9,	%g7
	!# Input registers
	set	-0x0,	%i0
	set	-0xD,	%i1
	set	-0x2,	%i2
	set	-0x4,	%i3
	set	-0xE,	%i4
	set	-0xB,	%i5
	set	-0xC,	%i6
	set	-0x9,	%i7
	!# Local registers
	set	0x4D09E23E,	%l0
	set	0x6B481428,	%l1
	set	0x5777BB1E,	%l2
	set	0x00CE1306,	%l3
	set	0x2787D5BE,	%l4
	set	0x53690045,	%l5
	set	0x58F0FB9E,	%l6
	!# Output registers
	set	0x14F8,	%o0
	set	-0x138D,	%o1
	set	0x09DF,	%o2
	set	0x195B,	%o3
	set	0x0449,	%o4
	set	-0x1B4E,	%o5
	set	-0x131E,	%o6
	set	-0x0A28,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0xDF0ECADE0EF32D6C)
	INIT_TH_FP_REG(%l7,%f2,0xD39FBDF2FF8041F1)
	INIT_TH_FP_REG(%l7,%f4,0x28E8DA40A34F7AF5)
	INIT_TH_FP_REG(%l7,%f6,0x1ED95E842FE99A93)
	INIT_TH_FP_REG(%l7,%f8,0xC75F90F668FE95A4)
	INIT_TH_FP_REG(%l7,%f10,0xB5604C572AF6B3B0)
	INIT_TH_FP_REG(%l7,%f12,0xD2A237325CE89EBE)
	INIT_TH_FP_REG(%l7,%f14,0x2B3C65BA4DFB4A5E)
	INIT_TH_FP_REG(%l7,%f16,0x8CF05B6E45FCA256)
	INIT_TH_FP_REG(%l7,%f18,0x40B4194346F8E401)
	INIT_TH_FP_REG(%l7,%f20,0xE43FCD95335A2B05)
	INIT_TH_FP_REG(%l7,%f22,0xBC76F48ADA21346E)
	INIT_TH_FP_REG(%l7,%f24,0xA92EAFE66D619A84)
	INIT_TH_FP_REG(%l7,%f26,0x685FBAEE804725AF)
	INIT_TH_FP_REG(%l7,%f28,0xE4E0B45FBC8156B8)
	INIT_TH_FP_REG(%l7,%f30,0x2C0ED2C6B4BF932A)

	!# Execute Main Diag ..

	fmul8x16au	%f5,	%f18,	%f12
	fmovd	%f16,	%f0
	movgu	%icc,	%l3,	%o4
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	call	loop_654
	edge32l	%o0,	%l1,	%i3
	fmovd	%f8,	%f24
	and	%g3,	%i2,	%o5
loop_654:
	nop
	wr	%g0,	0x0c,	%asi
	lda	[%l7 + 0x78] %asi,	%f1
	call	loop_655
	nop
	set	0x4C, %o4
	prefetch	[%l7 + %o4],	 3
	add	%l7,	0x48,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%l5,	%l0
loop_655:
	prefetch	[%l7 + 0x18],	 3
	call	loop_656
	fmovsge	%icc,	%f4,	%f4
	fmovdlg	%fcc2,	%f14,	%f8
	set	0x60, %o1
	ldsha	[%l7 + %o1] 0x11,	%i0
loop_656:
	array8	%i7,	%i4,	%g1
	fcmpes	%fcc3,	%f20,	%f17
	edge32n	%l2,	%o7,	%g5
	fnand	%f20,	%f6,	%f0
	mulscc	%o6,	%g6,	%l6
	fornot2s	%f28,	%f30,	%f23
	brnz,pn	%i1,	loop_657
	wr 	%g0, 	0x7, 	%fprs
	movn	%xcc,	%o1,	%g7
	fzeros	%f15
loop_657:
	fxors	%f26,	%f1,	%f22
	call	loop_658
	fxnor	%f10,	%f16,	%f26
	call	loop_659
	fmovsl	%icc,	%f28,	%f15
loop_658:
	rdhpr	%htba,	%o2
	call	loop_660
loop_659:
	fexpand	%f12,	%f10
	rd	%sys_tick_cmpr,	%i5
	edge32ln	%i6,	%o3,	%l4
loop_660:
	edge8ln	%l3,	%o4,	%o0
	call	loop_661
	call	loop_662
	nop
	setx	0x0D7B,	%l0,	%g3
	sdiv	%l1,	%g3,	%i2
	call	loop_663
loop_661:
	call	loop_664
loop_662:
	call	loop_665
	fmovdcs	%xcc,	%f8,	%f24
loop_663:
	call	loop_666
loop_664:
	movvc	%icc,	%i3,	%l5
loop_665:
	call	loop_667
	fmovsuge	%fcc1,	%f20,	%f0
loop_666:
	nop
	fitod	%f0,	%f24
	andcc	%o5,	0x035B,	%l0
loop_667:
	call	loop_668
	fmuld8ulx16	%f19,	%f14,	%f28
	fmul8ulx16	%f22,	%f8,	%f14
	tge	%xcc,	0x4
loop_668:
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	nop
	setx	0x0686EFF4,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f10
	setx	0xDF5451B3,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f6
	fadds	%f6,	%f10,	%f20
	edge16l	%i0,	%i7,	%i4
	move	%xcc,	0x6A2,	%l2
	for	%f28,	%f16,	%f20
	fmovdne	%icc,	%f30,	%f28
	call	loop_669
	nop
	fitos	%f13,	%f24
	fstoi	%f24,	%f8
	nop
	set	0x08, %g6
	ldsw	[%l7 + %g6],	%g1
	call	loop_670
loop_669:
	fnot2	%f14,	%f10
	call	loop_671
	fandnot1s	%f26,	%f22,	%f31
loop_670:
	fcmpd	%fcc2,	%f20,	%f14
	bl	%xcc,	loop_672
loop_671:
	fmovdgu	%xcc,	%f2,	%f16
	nop
	set	0x7C, %i1
	lduw	[%l7 + %i1],	%o7
	call	loop_673
loop_672:
	fmovdle	%icc,	%f26,	%f16
	nop
	set	0x62, %g2
	sth	%g5,	[%l7 + %g2]
	membar	#Sync
	wr	%g0,	0xf8,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
loop_673:
	movgu	%icc,	%o6,	%g6
	fmovrdne	%l6,	%f20,	%f28
	movrgz	%i1,	0x0EF,	%g4
	fmovsg	%fcc1,	%f27,	%f24
	fmovdo	%fcc3,	%f8,	%f0
	fabss	%f11,	%f15
	edge8	%o1,	%g7,	%g2
	movgu	%xcc,	%o2,	%i5
	call	loop_674
	sllx	%o3,	0x0E,	%i6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x6B5, 	%hsys_tick_cmpr
	fmovdleu	%icc,	%f18,	%f26
loop_674:
	call	loop_675
	fbuge,a,pt	%fcc1,	loop_676
	fmovrdgez	%o0,	%f8,	%f28
	movl	%icc,	%l1,	%g3
loop_675:
	tg	%icc,	0x2
loop_676:
	movule	%fcc3,	0x1D3,	%i2
	fcmpeq16	%f10,	%f30,	%i3
	fmovscs	%icc,	%f26,	%f31
	call	loop_677
	fands	%f7,	%f23,	%f2
	movle	%xcc,	0x446,	%l3
	fmovslg	%fcc0,	%f11,	%f19
loop_677:
	fcmpeq16	%f26,	%f30,	%o5
	fxnor	%f12,	%f0,	%f22
	movrne	%l5,	0x3BF,	%i0
	fcmpeq32	%f24,	%f4,	%l0
	movl	%fcc2,	0x33A,	%i7
	call	loop_678
	wr	%i4,	%l2,	%sys_tick
	bshuffle	%f6,	%f22,	%f10
	bl,pt	%icc,	loop_679
loop_678:
	fmovdcs	%icc,	%f0,	%f20
	call	loop_680
	fornot1	%f6,	%f26,	%f22
loop_679:
	bshuffle	%f8,	%f2,	%f12
	rdhpr	%hpstate,	%g1
loop_680:
	fnand	%f8,	%f28,	%f22
	nop
	fitod	%f4,	%f6
	fdtos	%f6,	%f5
	fnot2	%f16,	%f28
	call	loop_681
	xnor	%g5,	%o6,	%o7
	add	%l7,	0x5C,	%l6
	wr	%g0,	0x18,	%asi
	casa	[%l6] 0x18,	%g6,	%i1
loop_681:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fnands	%f26,	%f9,	%f24
	fmovscc	%xcc,	%f11,	%f17
	sdivx	%o1,	0x01F7,	%g7
	bge,pn	%icc,	loop_682
	movug	%fcc1,	0x5DA,	%l6
	nop
	fitod	%f6,	%f14
	fdtox	%f14,	%f0
	call	loop_683
loop_682:
	call	loop_684
	edge8n	%o2,	%g2,	%i5
	tpos	%xcc,	0x0
loop_683:
	be,pt	%xcc,	loop_685
loop_684:
	fmovrdlz	%i6,	%f22,	%f24
	fcmpne16	%f18,	%f30,	%l4
	call	loop_686
loop_685:
	sdivx	%o3,	0x1D6C,	%o4
	fmuld8ulx16	%f18,	%f1,	%f18
	fmovsuge	%fcc2,	%f18,	%f0
loop_686:
	fmovrslz	%l1,	%f21,	%f16
	call	loop_687
	edge16ln	%g3,	%o0,	%i3
	tsubcctv	%l3,	0x03F4,	%o5
	call	loop_688
loop_687:
	fcmple16	%f30,	%f16,	%i2
	stbar
	fmovsvc	%xcc,	%f16,	%f4
loop_688:
	fmovrse	%i0,	%f12,	%f6
	mulscc	%l0,	%i7,	%l5
	nop
	fitod	%f7,	%f22
	nop
	fitos	%f2,	%f27
	fstox	%f27,	%f10
	fxtos	%f10,	%f25
	movu	%fcc2,	0x06C,	%l2
	fmovscc	%icc,	%f19,	%f3
	andn	%i4,	%g1,	%g5
	call	loop_689
	rdhpr	%hintp,	%o7
	movrgez	%o6,	%g6,	%i1
	call	loop_690
loop_689:
	rdhpr	%hsys_tick_cmpr,	%g4
	fmovsa	%fcc1,	%f7,	%f23
	nop
	setx	0xFA935EFC66113E57,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0xC8790C4555B109DB,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fmuld	%f0,	%f0,	%f28
loop_690:
	fcmpeq16	%f12,	%f12,	%g7
	fmul8x16	%f17,	%f18,	%f8
	call	loop_691
	call	loop_692
	call	loop_693
	fmovdu	%fcc0,	%f12,	%f22
loop_691:
	fcmpes	%fcc1,	%f17,	%f26
loop_692:
	edge8l	%l6,	%o1,	%g2
loop_693:
	fandnot1	%f12,	%f6,	%f10
	fbule,a	%fcc3,	loop_694
	nop
	set	0x0C, %o7
	prefetch	[%l7 + %o7],	 1
	flushw
	tl	%xcc,	0x2
loop_694:
	call	loop_695
	andn	%i5,	%o2,	%i6
	call	loop_696
	call	loop_697
loop_695:
	tle	%icc,	0x6
	or	%l4,	0x1F9E,	%o3
loop_696:
	movg	%xcc,	0x1BF,	%l1
loop_697:
	fmovscs	%icc,	%f22,	%f20
	call	loop_698
	fmovsne	%fcc2,	%f9,	%f5
	call	loop_699
	edge8n	%g3,	%o0,	%i3
loop_698:
	call	loop_700
	edge8l	%o4,	%o5,	%l3
loop_699:
	fpadd32	%f2,	%f18,	%f2
	nop
	setx	0x053E6F4B,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f14
	setx	0x29FC3B50,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f14
	fadds	%f14,	%f14,	%f10
loop_700:
	fand	%f6,	%f20,	%f26
	fmovdul	%fcc1,	%f6,	%f0
	call	loop_701
	fandnot1s	%f26,	%f3,	%f19
	call	loop_702
	sir	0x17D3
loop_701:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fmovsu	%fcc0,	%f6,	%f20
loop_702:
	fnors	%f7,	%f30,	%f4
	wr	%l0,	%i7,	%pic
	nop
	fitos	%f13,	%f7
	fstox	%f7,	%f10
	fxtos	%f10,	%f26
	alignaddr	%l5,	%i4,	%g1
	call	loop_703
	wrpr 	%g0, 	0x3, 	%gl
	nop
	fitos	%f3,	%f3
	fstox	%f3,	%f10
	rdhpr	%hpstate,	%o6
loop_703:
	fmuld8sux16	%f20,	%f13,	%f24
	sdivx	%g5,	0x18FC,	%g6
	movuge	%fcc2,	0x0A4,	%g4
	call	loop_704
	sllx	%g7,	0x02,	%l6
	fmul8x16	%f22,	%f10,	%f8
	wr	%i1,	%g2,	%set_softint
loop_704:
	call	loop_705
	nop
	fitod	%f12,	%f14
	fdtoi	%f14,	%f9
	fors	%f27,	%f1,	%f13
	call	loop_706
loop_705:
	fmovrsgez	%i5,	%f17,	%f4
	nop
	setx	0xFFB21E23A0B18065,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0x09224344,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	fsmuld	%f4,	%f8,	%f30
	rd	%fprs,	%o2
loop_706:
	be	%icc,	loop_707
	call	loop_708
	call	loop_709
	call	loop_710
loop_707:
	nop
	fitod	%f15,	%f2
loop_708:
	movue	%fcc1,	0x7D3,	%i6
loop_709:
	fmovrsgz	%o1,	%f16,	%f6
loop_710:
	fandnot1	%f10,	%f20,	%f0
	call	loop_711
	fmovdle	%fcc2,	%f24,	%f0
	nop
	fitos	%f2,	%f23
	fstox	%f23,	%f16
	fxtos	%f16,	%f22
	nop
	fitod	%f4,	%f30
	fdtox	%f30,	%f6
loop_711:
	nop
	wr	%g0,	0x18,	%asi
	ldstuba	[%l7 + 0x21] %asi,	%o3
	rdpr	%gl,	%l1
	nop
	setx	0x8EBD2072,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f21
	fsqrts	%f21,	%f30
	nop
	fitod	%f8,	%f18
	fdtoi	%f18,	%f5
	orcc	%l4,	%g3,	%o0
	fmul8sux16	%f10,	%f18,	%f12
	fornot2s	%f13,	%f29,	%f9
	rdhpr	%ver,	%o4
	nop
	setx	0x8B705624,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f7
	setx	0xCCD73200,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f6
	fsubs	%f6,	%f7,	%f13
	edge8ln	%o5,	%l3,	%i2
	move	%xcc,	%i3,	%l0
	movvc	%icc,	0x03F,	%i7
	fmovdleu	%icc,	%f18,	%f22
	movrgez	%l5,	0x09E,	%i0
	call	loop_712
	subcc	%i4,	0x0FEF,	%g1
	bn,a,pt	%xcc,	loop_713
	movlg	%fcc1,	0x22C,	%l2
loop_712:
	nop
	set	0x7A, %o6
	lduba	[%l7 + %o6] 0x19,	%o7
loop_713:
	fmovdvc	%icc,	%f6,	%f22
	movge	%xcc,	%o6,	%g6
	call	loop_714
	call	loop_715
	call	loop_716
	wrpr	%g5,	%g7,	%pil
loop_714:
	call	loop_717
loop_715:
	move	%xcc,	%g4,	%l6
loop_716:
	fsrc1s	%f0,	%f5
	fmovdue	%fcc2,	%f6,	%f16
loop_717:
	fpsub16s	%f25,	%f11,	%f2
	fnor	%f24,	%f0,	%f24
	fandnot1s	%f9,	%f21,	%f29
	call	loop_718
	call	loop_719
	call	loop_720
	fbg,a,pt	%fcc2,	loop_721
loop_718:
	movcc	%xcc,	%i1,	%i5
loop_719:
	movrlez	%g2,	0x22C,	%i6
loop_720:
	fmul8x16al	%f20,	%f4,	%f0
loop_721:
	nop
	setx	loop_722,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x034100001406,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	tcs	%xcc,	0x5
	movug	%fcc3,	0x135,	%o2
	stx	%o1,	[%l7 + 0x18]
loop_722:
	fbule,pn	%fcc3,	loop_723
	fexpand	%f9,	%f2
	call	loop_724
	call	loop_725
loop_723:
	fcmpeq16	%f22,	%f20,	%l1
	call	loop_726
loop_724:
	fmovdne	%fcc1,	%f14,	%f4
loop_725:
	addc	%o3,	%l4,	%o0
	call	loop_727
loop_726:
	bcs,pt	%xcc,	loop_728
	call	loop_729
	fmovsleu	%xcc,	%f2,	%f2
loop_727:
	fpsub16s	%f10,	%f18,	%f26
loop_728:
	edge16l	%o4,	%g3,	%l3
loop_729:
	call	loop_730
	pdist	%f4,	%f16,	%f16
	call	loop_731
	movle	%xcc,	%i2,	%i3
loop_730:
	call	loop_732
	call	loop_733
loop_731:
	call	loop_734
	fmul8x16	%f21,	%f14,	%f12
loop_732:
	alignaddr	%l0,	%i7,	%o5
loop_733:
	wr	%i0,	0x1F36,	%y
loop_734:
	nop
	membar	#Sync
	set	0x40, %i3
	ldda	[%l7 + %i3] 0xf0,	%f16
	subc	%i4,	0x14A2,	%l5
	brz,a	%l2,	loop_735
	nop
	fitod	%f6,	%f14
	fdtox	%f14,	%f18
	fxtod	%f18,	%f16
	call	loop_736
	call	loop_737
loop_735:
	fbo,a	%fcc3,	loop_738
	andncc	%g1,	0x0C20,	%o6
loop_736:
	orn	%o7,	0x0FA2,	%g6
loop_737:
	nop
	set	0x30, %i4
	std	%g6,	[%l7 + %i4]
loop_738:
	smul	%g4,	%l6,	%i1
	subccc	%g5,	0x1436,	%g2
	fmovdle	%icc,	%f8,	%f18
	array16	%i5,	%o2,	%i6
	call	loop_739
	fmovdo	%fcc3,	%f30,	%f6
	movre	%o1,	0x2EB,	%o3
	fbg	%fcc2,	loop_740
loop_739:
	orncc	%l4,	%o0,	%o4
	wr	%g0,	0x80,	%asi
	ldstuba	[%l7 + 0x39] %asi,	%g3
loop_740:
	fnot1	%f24,	%f18
	movul	%fcc2,	0x2FC,	%l1
	nop
	set	0x78, %l6
	lduw	[%l7 + %l6],	%l3
	nop
	fitos	%f3,	%f29
	edge16n	%i3,	%l0,	%i2
	fmovdul	%fcc1,	%f14,	%f6
	call	loop_741
	fble,a	%fcc2,	loop_742
	fmovsule	%fcc0,	%f28,	%f11
	fmovdo	%fcc3,	%f28,	%f20
loop_741:
	nop
	add	%l7,	0x38,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%o5
	casa	[%l6] %asi,	%o5,	%i0
loop_742:
	call	loop_743
	ble	%xcc,	loop_744
	fpadd16	%f18,	%f16,	%f4
	fbe,a,pn	%fcc0,	loop_745
loop_743:
	fbule,pn	%fcc1,	loop_746
loop_744:
	fcmpgt16	%f26,	%f16,	%i7
	call	loop_747
loop_745:
	fzero	%f2
loop_746:
	alignaddr	%l5,	%l2,	%i4
	tcs	%icc,	0x5
loop_747:
	bneg	%icc,	loop_748
	call	loop_749
	wrpr	%o6,	%o7,	%cwp
	call	loop_750
loop_748:
	call	loop_751
loop_749:
	call	loop_752
	sub	%g1,	0x1CEB,	%g6
loop_750:
	movuge	%fcc1,	%g4,	%l6
loop_751:
	array32	%i1,	%g5,	%g7
loop_752:
	fmuld8sux16	%f4,	%f6,	%f18
	movuge	%fcc3,	0x593,	%i5
	call	loop_753
	taddcc	%o2,	%i6,	%g2
	rd	%y,	%o3
	fmovdneg	%icc,	%f26,	%f10
loop_753:
	rd	%ccr,	%o1
	tne	%xcc,	0x1
	fmovdcs	%xcc,	%f2,	%f12
	sub	%l4,	%o4,	%g3
	srax	%o0,	0x14,	%l3
	call	loop_754
	call	loop_755
	fmovrdgez	%l1,	%f28,	%f14
	call	loop_756
loop_754:
	edge16ln	%l0,	%i2,	%i3
loop_755:
	call	loop_757
	call	loop_758
loop_756:
	call	loop_759
	call	loop_760
loop_757:
	fmul8x16	%f18,	%f22,	%f2
loop_758:
	addc	%o5,	%i7,	%l5
loop_759:
	call	loop_761
loop_760:
	movvc	%xcc,	%i0,	%i4
	edge8ln	%o6,	%l2,	%o7
	movrgez	%g6,	%g4,	%l6
loop_761:
	rd	%asi,	%i1
	bcc,pn	%xcc,	loop_762
	srlx	%g1,	%g7,	%g5
	sllx	%i5,	%o2,	%i6
	siam	0x1
loop_762:
	call	loop_763
	fmovrde	%o3,	%f28,	%f18
	call	loop_764
	call	loop_765
loop_763:
	call	loop_766
	nop
	setx	0x0124A50DB63B51D5,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0xC8BE0C8D8DB3C721,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	fsubd	%f14,	%f14,	%f6
loop_764:
	fmovscs	%icc,	%f30,	%f12
loop_765:
	brnz	%g2,	loop_767
loop_766:
	fmovrdgz	%o1,	%f6,	%f8
	fzeros	%f28
	orn	%o4,	%l4,	%g3
loop_767:
	nop
	setx	0xA67D3900,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f17
	setx	0x96C0D1B9,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f24
	fdivs	%f24,	%f17,	%f7
	call	loop_768
	movule	%fcc0,	%l3,	%l1
	edge8ln	%l0,	%i2,	%i3
	sll	%o0,	0x0B,	%i7
loop_768:
	fmovrse	%l5,	%f29,	%f6
	fmovda	%icc,	%f20,	%f8
	call	loop_769
	movrgez	%o5,	0x3B2,	%i0
	fmovsul	%fcc2,	%f7,	%f9
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
loop_769:
	nop
	setx loop_770, %l0, %l1
	jmpl %l1, %o6
	taddcc	%i4,	%o7,	%g6
	bpos	%icc,	loop_771
	call	loop_772
loop_770:
	fbn	%fcc0,	loop_773
	call	loop_774
loop_771:
	for	%f10,	%f30,	%f24
loop_772:
	call	loop_775
loop_773:
	call	loop_776
loop_774:
	fnot1	%f18,	%f28
	fmovsul	%fcc3,	%f23,	%f1
loop_775:
	sub	%l2,	%l6,	%i1
loop_776:
	fpadd32s	%f20,	%f6,	%f0
	move	%fcc2,	0x2F3,	%g1
	srlx	%g7,	%g5,	%i5
	fpsub32	%f26,	%f10,	%f24
	fnot1s	%f5,	%f1
	nop
	setx	0xDCD682B2E3BBAA2A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	fsqrtd	%f6,	%f16
	rd	%tick_cmpr,	%o2
	tgu	%icc,	0x2
	alignaddrl	%i6,	%o3,	%g4
	fmovrde	%g2,	%f24,	%f8
	call	loop_777
	tneg	%xcc,	0x4
	taddcctv	%o1,	0x1B57,	%o4
	call	loop_778
loop_777:
	tcs	%icc,	0x3
	fpack16	%f2,	%f2
	call	loop_779
loop_778:
	movleu	%icc,	0x00B,	%l4
	call	loop_780
	call	loop_781
loop_779:
	edge8ln	%g3,	%l3,	%l0
	fsrc2s	%f16,	%f18
loop_780:
	call	loop_782
loop_781:
	movge	%fcc0,	0x1E2,	%i2
	call	loop_783
	call	loop_784
loop_782:
	wrpr	%i3,	0x0E39,	%pil
	rdpr	%tba,	%l1
loop_783:
	tgu	%icc,	0x3
loop_784:
	fcmpeq32	%f14,	%f18,	%o0
	fmovrsgez	%l5,	%f4,	%f1
	movneg	%xcc,	0x1A0,	%i7
	xnor	%o5,	0x1AD8,	%i0
	call	loop_785
	nop
	setx	0x83DDAFDB421D61DF,	%l0,	%l6
	stx	%l6,	[%l7 + 0x18]
	ldx	[%l7 + 0x18],	%fsr
	call	loop_786
	subcc	%i4,	%o6,	%o7
loop_785:
	popc	0x1571,	%g6
	bneg	%icc,	loop_787
loop_786:
	sll	%l2,	0x15,	%l6
	smul	%g1,	0x1156,	%g7
	nop
	setx	0x41557C2406578F57,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0x08BDFC0AF918190F,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	faddd	%f6,	%f6,	%f18
loop_787:
	fnegs	%f10,	%f27
	nop
	set	0x64, %l0
	swap	[%l7 + %l0],	%g5
	fcmpes	%fcc2,	%f20,	%f10
	wr	%g0,	0x2b,	%asi
	stha	%i5,	[%l7 + 0x24] %asi
	membar	#Sync
	movleu	%icc,	%o2,	%i6
	call	loop_788
	movug	%fcc3,	%i1,	%g4
	nop
	setx	0x9B0933ECECED1CA1,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0x66C8AED83A0FA440,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	fdivd	%f26,	%f0,	%f14
	tvc	%icc,	0x7
loop_788:
	fpsub16s	%f12,	%f11,	%f11
	fxors	%f6,	%f24,	%f28
	edge32l	%g2,	%o3,	%o1
	fcmped	%fcc3,	%f12,	%f14
	tvc	%icc,	0x7
	fmovslg	%fcc1,	%f16,	%f30
	fmovsue	%fcc2,	%f3,	%f3
	xnorcc	%o4,	%l4,	%g3
	rdpr	%pil,	%l3
	movl	%xcc,	0x113,	%l0
	fnand	%f8,	%f18,	%f4
	call	loop_789
	fzero	%f24
	fsrc1	%f0,	%f14
	xnor	%i2,	0x0741,	%l1
loop_789:
	fcmpne16	%f20,	%f2,	%i3
	fandnot1	%f6,	%f20,	%f22
	srlx	%o0,	0x11,	%i7
	andcc	%o5,	%i0,	%l5
	wr 	%g0, 	0x5, 	%fprs
	fnand	%f28,	%f18,	%f24
	fmul8x16al	%f22,	%f28,	%f24
	rdhpr	%hsys_tick_cmpr,	%o6
	rdpr	%cleanwin,	%l2
	fmovrdlez	%g6,	%f28,	%f28
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 4:
!
!	Type l   	: 23
!	Type a   	: 30
!	Type x   	: 11
!	Type cti   	: 136
!	Type f   	: 166
!	Type i   	: 134
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
	set	0x5,	%g2
	set	0xD,	%g3
	set	0xD,	%g4
	set	0x4,	%g5
	set	0x8,	%g6
	set	0xA,	%g7
	!# Input registers
	set	-0xE,	%i0
	set	-0xE,	%i1
	set	-0xD,	%i2
	set	-0x3,	%i3
	set	-0xE,	%i4
	set	-0xF,	%i5
	set	-0x8,	%i6
	set	-0xA,	%i7
	!# Local registers
	set	0x750089A3,	%l0
	set	0x442BD678,	%l1
	set	0x72537B16,	%l2
	set	0x3EE14BB9,	%l3
	set	0x72D66CAA,	%l4
	set	0x201F38D9,	%l5
	set	0x26CA63B4,	%l6
	!# Output registers
	set	0x18DD,	%o0
	set	0x0B4D,	%o1
	set	-0x080A,	%o2
	set	-0x1B0E,	%o3
	set	0x182D,	%o4
	set	0x1F83,	%o5
	set	-0x0104,	%o6
	set	-0x0EFF,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0xDF0ECADE0EF32D6C)
	INIT_TH_FP_REG(%l7,%f2,0xD39FBDF2FF8041F1)
	INIT_TH_FP_REG(%l7,%f4,0x28E8DA40A34F7AF5)
	INIT_TH_FP_REG(%l7,%f6,0x1ED95E842FE99A93)
	INIT_TH_FP_REG(%l7,%f8,0xC75F90F668FE95A4)
	INIT_TH_FP_REG(%l7,%f10,0xB5604C572AF6B3B0)
	INIT_TH_FP_REG(%l7,%f12,0xD2A237325CE89EBE)
	INIT_TH_FP_REG(%l7,%f14,0x2B3C65BA4DFB4A5E)
	INIT_TH_FP_REG(%l7,%f16,0x8CF05B6E45FCA256)
	INIT_TH_FP_REG(%l7,%f18,0x40B4194346F8E401)
	INIT_TH_FP_REG(%l7,%f20,0xE43FCD95335A2B05)
	INIT_TH_FP_REG(%l7,%f22,0xBC76F48ADA21346E)
	INIT_TH_FP_REG(%l7,%f24,0xA92EAFE66D619A84)
	INIT_TH_FP_REG(%l7,%f26,0x685FBAEE804725AF)
	INIT_TH_FP_REG(%l7,%f28,0xE4E0B45FBC8156B8)
	INIT_TH_FP_REG(%l7,%f30,0x2C0ED2C6B4BF932A)

	!# Execute Main Diag ..

	move	%fcc2,	0x3CC,	%l6
	fzeros	%f21
	nop
	setx	0x6607657456E8DF37,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	fsqrtd	%f26,	%f0
	addcc	%g7,	%g5,	%g1
	te	%icc,	0x1
	call	loop_790
	fmovdul	%fcc3,	%f26,	%f14
	array32	%i5,	%i6,	%i1
	mulscc	%g4,	0x1EC8,	%o2
loop_790:
	call	loop_791
	call	loop_792
	edge32	%o3,	%o1,	%o4
	fors	%f5,	%f26,	%f5
loop_791:
	movn	%fcc3,	0x3AA,	%g2
loop_792:
	call	loop_793
	addccc	%l4,	%l3,	%l0
	nop
	fitod	%f18,	%f8
	nop
	set	0x16, %g3
	lduh	[%l7 + %g3],	%g3
loop_793:
	fmul8x16al	%f20,	%f2,	%f24
	fmovdcs	%xcc,	%f14,	%f0
	call	loop_794
	stbar
	fpsub16	%f6,	%f10,	%f30
	call	loop_795
loop_794:
	movg	%icc,	%i2,	%l1
	fabss	%f30,	%f9
	movul	%fcc1,	0x3EA,	%i3
loop_795:
	edge32	%i7,	%o0,	%o5
	fnot2s	%f7,	%f15
	call	loop_796
	tleu	%icc,	0x5
	add	%l7,	0x18,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%i0,	%i4
loop_796:
	wrpr	%l5,	0x0F9A,	%cwp
	call	loop_797
	call	loop_798
	fsrc1	%f26,	%f24
	call	loop_799
loop_797:
	nop
	set	0x10, %l1
	lduh	[%l7 + %l1],	%o7
loop_798:
	call	loop_800
	movlg	%fcc2,	%l2,	%g6
loop_799:
	nop
	setx	0xBDAC75E3425EB431,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	setx	0x1925476D,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	fsmuld	%f24,	%f18,	%f20
	set	0x40, %l2
	stwa	%o6,	[%l7 + %l2] 0xeb
	membar	#Sync
loop_800:
	call	loop_801
	call	loop_802
	call	loop_803
	call	loop_804
loop_801:
	fmovsleu	%icc,	%f13,	%f22
loop_802:
	call	loop_805
loop_803:
	fmovsvs	%icc,	%f27,	%f8
loop_804:
	sllx	%l6,	%g5,	%g1
	fmovdug	%fcc0,	%f24,	%f12
loop_805:
	srlx	%i5,	%i6,	%g7
	call	loop_806
	call	loop_807
	call	loop_808
	call	loop_809
loop_806:
	bmask	%g4,	%i1,	%o2
loop_807:
	call	loop_810
loop_808:
	fcmpgt16	%f14,	%f14,	%o3
loop_809:
	fcmped	%fcc3,	%f24,	%f0
	fmovsg	%fcc1,	%f10,	%f4
loop_810:
	umulcc	%o1,	0x0EB9,	%g2
	call	loop_811
	fmovsul	%fcc3,	%f23,	%f14
	call	loop_812
	fones	%f2
loop_811:
	movrlez	%l4,	0x171,	%l3
	fsrc2	%f6,	%f12
loop_812:
	srax	%l0,	0x19,	%g3
	fcmple16	%f28,	%f30,	%o4
	fpack32	%f28,	%f10,	%f4
	rdpr	%tba,	%l1
	call	loop_813
	wrpr	%i3,	0x1CA2,	%tick
	call	loop_814
	call	loop_815
loop_813:
	call	loop_816
	call	loop_817
loop_814:
	mulscc	%i7,	%i2,	%o5
loop_815:
	call	loop_818
loop_816:
	lduh	[%l7 + 0x5C],	%i0
loop_817:
	fmovsuge	%fcc1,	%f18,	%f2
	nop
	fitod	%f8,	%f4
	fdtox	%f4,	%f22
loop_818:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fmovsneg	%xcc,	%f3,	%f10
	movul	%fcc1,	%l5,	%o7
	set	0x58, %o2
	lduba	[%l7 + %o2] 0x81,	%l2
	nop
	set	0x6C, %g5
	ldub	[%l7 + %g5],	%g6
	fmuld8ulx16	%f3,	%f19,	%f2
	fmovdo	%fcc3,	%f2,	%f20
	call	loop_819
	fmovsn	%fcc0,	%f28,	%f30
	fble,a	%fcc3,	loop_820
	fmovsge	%icc,	%f7,	%f13
loop_819:
	popc	0x017C,	%o0
	nop
	set	0x58, %i6
	ldd	[%l7 + %i6],	%i6
loop_820:
	call	loop_821
	fmovs	%f10,	%f23
	nop
	setx	0x62A6949EC5CF76C1,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0xA728C582D3E02CF1,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	fsubd	%f12,	%f10,	%f18
	call	loop_822
loop_821:
	fornot1s	%f28,	%f29,	%f28
	xnor	%o6,	0x0C65,	%g5
	fxnors	%f18,	%f20,	%f5
loop_822:
	call	loop_823
	call	loop_824
	fandnot2s	%f25,	%f0,	%f12
	movcs	%xcc,	0x166,	%g1
loop_823:
	fmovrdlz	%i6,	%f22,	%f6
loop_824:
	call	loop_825
	nop
	setx	loop_826,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x012200001403,	%l0,	%l1
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
	array16	%i5,	%g4,	%g7
	call	loop_827
loop_825:
	call	loop_828
loop_826:
	fmovrsgez	%i1,	%f4,	%f24
	fpadd16s	%f18,	%f10,	%f29
loop_827:
	call	loop_829
loop_828:
	fsrc1s	%f11,	%f26
	call	loop_830
	fmovdneg	%icc,	%f30,	%f16
loop_829:
	call	loop_831
	fpsub16s	%f9,	%f22,	%f27
loop_830:
	addcc	%o2,	0x0A57,	%o1
	edge32ln	%g2,	%l4,	%o3
loop_831:
	fmovdge	%xcc,	%f10,	%f22
	pdist	%f4,	%f18,	%f18
	brz,pt	%l0,	loop_832
	umulcc	%l3,	0x0F40,	%g3
	rdhpr	%hsys_tick_cmpr,	%o4
	ta	%icc,	0x5
loop_832:
	nop
	fitos	%f10,	%f27
	fstox	%f27,	%f14
	call	loop_833
	rdhpr	%hpstate,	%l1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x922, 	%hsys_tick_cmpr
	te	%xcc,	0x4
loop_833:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x724, 	%hsys_tick_cmpr
	fmovsleu	%xcc,	%f5,	%f27
	movne	%fcc3,	0x1E9,	%i0
	xorcc	%l5,	%o7,	%i4
	fpackfix	%f2,	%f22
	brgez	%l2,	loop_834
	wr	%o0,	%g6,	%ccr
	tge	%icc,	0x2
	call	loop_835
loop_834:
	fmovdlg	%fcc1,	%f12,	%f6
	fand	%f14,	%f0,	%f20
	fmovd	%f30,	%f12
loop_835:
	fmul8sux16	%f28,	%f26,	%f28
	call	loop_836
	call	loop_837
	fmovrde	%l6,	%f22,	%f12
	fmovrsgez	%o6,	%f8,	%f15
loop_836:
	nop
	set	0x32, %g4
	ldsha	[%l7 + %g4] 0x19,	%g1
loop_837:
	movuge	%fcc0,	0x382,	%i6
	call	loop_838
	call	loop_839
	fmovsneg	%icc,	%f6,	%f14
	call	loop_840
loop_838:
	edge32l	%g5,	%i5,	%g4
loop_839:
	movuge	%fcc0,	%i1,	%o2
	set	0x78, %g7
	ldsha	[%l7 + %g7] 0x88,	%o1
loop_840:
	rd	%softint,	%g7
	movvs	%icc,	%l4,	%g2
	fnands	%f30,	%f6,	%f4
	add	%o3,	0x0A70,	%l3
	addcc	%l0,	%g3,	%l1
	set	0x3C, %l3
	lduwa	[%l7 + %l3] 0x04,	%i7
	call	loop_841
	call	loop_842
	fbge,a	%fcc3,	loop_843
	edge8	%o4,	%i2,	%o5
loop_841:
	movre	%i0,	0x00D,	%l5
loop_842:
	fmovdu	%fcc1,	%f30,	%f26
loop_843:
	call	loop_844
	fpadd32s	%f4,	%f25,	%f25
	fmovs	%f1,	%f13
	fpadd32	%f30,	%f20,	%f22
loop_844:
	movvs	%icc,	0x31E,	%o7
	movrgz	%i3,	0x1AF,	%l2
	call	loop_845
	call	loop_846
	rd	%asi,	%i4
	tcc	%icc,	0x3
loop_845:
	movo	%fcc2,	%o0,	%g6
loop_846:
	call	loop_847
	nop
	setx	0xC2D31E74A492413E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0xE552F619562C2F3C,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	faddd	%f16,	%f16,	%f6
	taddcc	%o6,	0x1C52,	%g1
	set	0x15, %o3
	ldstuba	[%l7 + %o3] 0x18,	%i6
loop_847:
	fnands	%f0,	%f11,	%f31
	fbe,a,pn	%fcc3,	loop_848
	mova	%xcc,	0x22F,	%l6
	subc	%i5,	%g5,	%g4
	stbar
loop_848:
	call	loop_849
	call	loop_850
	call	loop_851
	wrpr 	%g0, 	0x3, 	%gl
loop_849:
	fmovsn	%fcc3,	%f17,	%f0
loop_850:
	fmovdule	%fcc2,	%f6,	%f16
loop_851:
	fble,a,pt	%fcc3,	loop_852
	call	loop_853
	nop
	fitos	%f7,	%f25
	fstod	%f25,	%f18
	popc	0x01D5,	%o2
loop_852:
	wr 	%g0, 	0x4, 	%fprs
loop_853:
	nop
	wr	%g0,	0x0c,	%asi
	ldstuba	[%l7 + 0x72] %asi,	%o1
	movge	%fcc1,	0x71B,	%g2
	fcmpeq32	%f20,	%f8,	%l4
	nop
	set	0x78, %l4
	ldd	[%l7 + %l4],	%f6
	fbn,a,pt	%fcc3,	loop_854
	call	loop_855
	umul	%l3,	0x1D88,	%l0
	te	%icc,	0x0
loop_854:
	fbule,a,pn	%fcc3,	loop_856
loop_855:
	fmovrdgz	%o3,	%f16,	%f6
	movge	%fcc2,	%g3,	%i7
	call	loop_857
loop_856:
	nop
	fitod	%f10,	%f16
	fdtox	%f16,	%f4
	fxtod	%f4,	%f20
	call	loop_858
	nop
	setx	0xBA2A52F829DA095D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0xA8304381F19A6F34,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	faddd	%f24,	%f6,	%f10
loop_857:
	nop
	setx	0xCA8D9850,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f12
	setx	0xA756FF8B,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f15
	fdivs	%f15,	%f12,	%f3
	call	loop_859
loop_858:
	tcc	%icc,	0x0
	call	loop_860
	nop
	setx loop_861, %l0, %l1
	jmpl %l1, %o4
loop_859:
	fxors	%f31,	%f4,	%f13
	fbe,pt	%fcc0,	loop_862
loop_860:
	movl	%icc,	%l1,	%o5
loop_861:
	movneg	%xcc,	0x73A,	%i0
	for	%f16,	%f18,	%f26
loop_862:
	fmuld8ulx16	%f19,	%f20,	%f6
	fpmerge	%f6,	%f18,	%f28
	rd	%pc,	%l5
	nop
	setx	0x0F42,	%l0,	%i3
	udivcc	%o7,	%i3,	%i2
	fnot1	%f8,	%f16
	call	loop_863
	call	loop_864
	call	loop_865
	umulcc	%l2,	0x06C0,	%i4
loop_863:
	fnor	%f0,	%f20,	%f28
loop_864:
	nop
	set	0x0C, %o0
	stw	%g6,	[%l7 + %o0]
loop_865:
	edge32n	%o0,	%g1,	%o6
	fmovsneg	%xcc,	%f21,	%f29

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x840, 	%hsys_tick_cmpr
	move	%fcc0,	0x47B,	%i5
	fabss	%f23,	%f18
	addc	%i6,	%g4,	%g5
	or	%o2,	0x0865,	%i1
	call	loop_866
	tsubcctv	%o1,	0x0D0C,	%g7
	call	loop_867
	call	loop_868
loop_866:
	fmovrslez	%g2,	%f5,	%f19
	fpadd32s	%f17,	%f11,	%f13
loop_867:
	fnot1	%f26,	%f2
loop_868:
	ldd	[%l7 + 0x18],	%f12
	fmovda	%fcc0,	%f30,	%f22
	call	loop_869
	call	loop_870
	te	%icc,	0x4
	faligndata	%f2,	%f12,	%f24
loop_869:
	nop
	setx	0x556F0FFA8B4BEEC2,	%l0,	%l6
	stx	%l6,	[%l7 + 0x48]
	ldx	[%l7 + 0x48],	%fsr
loop_870:
	call	loop_871
	nop
	setx loop_872, %l0, %l1
	jmpl %l1, %l3
	fcmps	%fcc1,	%f27,	%f25
	array32	%l0,	%l4,	%o3
loop_871:
	fmovrdgez	%i7,	%f30,	%f26
loop_872:
	membar	0x62
	call	loop_873
	fbule,pn	%fcc2,	loop_874
	mova	%fcc2,	0x683,	%g3
	fmovsuge	%fcc3,	%f13,	%f24
loop_873:
	xnor	%l1,	%o5,	%i0
loop_874:
	call	loop_875
	ble	%xcc,	loop_876
	call	loop_877
	fcmpeq16	%f28,	%f20,	%o4
loop_875:
	call	loop_878
loop_876:
	srlx	%l5,	0x0B,	%i3
loop_877:
	bshuffle	%f28,	%f2,	%f14
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
loop_878:
	bn,pt	%xcc,	loop_879
	nop
	setx	0x13EF,	%l0,	%l2
	udiv	%i2,	%l2,	%o7
	fnegs	%f4,	%f19
	nop
	setx	0x669A21952950CBE2,	%l0,	%l6
	stx	%l6,	[%l7 + 0x20]
	ldx	[%l7 + 0x20],	%fsr
loop_879:
	tg	%icc,	0x2
	fmovrsgez	%g6,	%f31,	%f6
	call	loop_880
	fmovrsne	%i4,	%f18,	%f3
	call	loop_881
	call	loop_882
loop_880:
	call	loop_883
	fmovdg	%xcc,	%f28,	%f10
loop_881:
	fmul8x16al	%f10,	%f15,	%f14
loop_882:
	fors	%f12,	%f8,	%f1
loop_883:
	fmovrdlz	%o0,	%f16,	%f10
	fmovdvs	%xcc,	%f20,	%f26
	set	0x60, %i2
	lda	[%l7 + %i2] 0x04,	%f13
	umulcc	%g1,	%o6,	%l6
	fzero	%f12
	call	loop_884
	wr	%i6,	%i5,	%set_softint
	call	loop_885
	fxnor	%f6,	%f22,	%f6
loop_884:
	call	loop_886
	fmovdo	%fcc1,	%f24,	%f4
loop_885:
	call	loop_887
	orn	%g4,	0x10F6,	%g5
loop_886:
	call	loop_888
	call	loop_889
loop_887:
	call	loop_890
	fmovrsgez	%o2,	%f10,	%f28
loop_888:
	move	%fcc2,	0x42A,	%o1
loop_889:
	fmovrse	%i1,	%f15,	%f14
loop_890:
	movn	%icc,	%g7,	%l3
	fsrc2s	%f18,	%f21
	movre	%l0,	%g2,	%o3
	fpsub32	%f8,	%f6,	%f24
	ldd	[%l7 + 0x30],	%f30
	taddcc	%l4,	0x02BF,	%i7
	fbl,pn	%fcc3,	loop_891
	fcmpgt32	%f18,	%f4,	%g3
	fsrc2	%f28,	%f28
	call	loop_892
loop_891:
	alignaddr	%o5,	%l1,	%o4
	fxnor	%f22,	%f28,	%f26
	movvc	%xcc,	0x50A,	%l5
loop_892:
	fmovsge	%xcc,	%f4,	%f12
	movrlz	%i0,	%i2,	%i3
	fmovdleu	%icc,	%f22,	%f20
	rdpr	%wstate,	%o7
	fmul8ulx16	%f18,	%f4,	%f8
	sethi	0x1692,	%g6
	fcmpgt16	%f14,	%f10,	%i4
	call	loop_893
	movug	%fcc1,	%l2,	%o0
	call	loop_894
	tsubcc	%o6,	0x11CC,	%l6
loop_893:
	siam	0x1
	smulcc	%g1,	%i6,	%g4
loop_894:
	sdivx	%i5,	0x0BFB,	%o2
	call	loop_895
	array16	%g5,	%i1,	%g7
	call	loop_896
	call	loop_897
loop_895:
	call	loop_898
	xnor	%o1,	0x17BC,	%l3
loop_896:
	bleu	%icc,	loop_899
loop_897:
	nop
	setx	0x3210EEE2,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f6
	fsqrts	%f6,	%f26
loop_898:
	call	loop_900
	smulcc	%l0,	0x17A1,	%g2
loop_899:
	orn	%o3,	0x1815,	%l4
	orn	%i7,	%g3,	%o5
loop_900:
	call	loop_901
	fmovsge	%xcc,	%f15,	%f14
	nop
	fitod	%f12,	%f8
	fdtox	%f8,	%f8
	srlx	%o4,	%l5,	%i0
loop_901:
	call	loop_902
	call	loop_903
	fpsub16	%f14,	%f20,	%f2
	call	loop_904
loop_902:
	fornot1s	%f16,	%f7,	%f15
loop_903:
	movgu	%xcc,	%l1,	%i3
	call	loop_905
loop_904:
	tg	%xcc,	0x4
	edge16ln	%o7,	%g6,	%i2
	call	loop_906
loop_905:
	call	loop_907
	movvc	%icc,	%i4,	%o0
	subccc	%o6,	0x003D,	%l6
loop_906:
	fornot1s	%f14,	%f26,	%f16
loop_907:
	call	loop_908
	fmovrsgez	%l2,	%f17,	%f22
	wr	%g1,	0x041C,	%y
	nop
	setx	0x4C2B6E09,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f25
	setx	0x76B5B22F,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f12
	fsubs	%f12,	%f25,	%f22
loop_908:
	rdpr	%pil,	%i6
	call	loop_909
	call	loop_910
	fand	%f0,	%f28,	%f22
	wrpr 	%g0, 	0x3, 	%gl
loop_909:
	call	loop_911
loop_910:
	call	loop_912
	nop
	setx	0x34277E87,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f15
	fsqrts	%f15,	%f25
	call	loop_913
loop_911:
	rdpr	%gl,	%g4
loop_912:
	call	loop_914
	call	loop_915
loop_913:
	nop
	setx loop_916, %l0, %l1
	jmpl %l1, %g5
	fnot1s	%f6,	%f8
loop_914:
	edge8	%i1,	%g7,	%o1
loop_915:
	call	loop_917
loop_916:
	nop
	set	0x68, %i7
	swap	[%l7 + %i7],	%o2
	brlez	%l3,	loop_918
	movcc	%xcc,	0x663,	%l0
loop_917:
	nop
	set	0x44, %g1
	stba	%o3,	[%l7 + %g1] 0x18
loop_918:
	nop
	setx	0x90F762F0,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f25
	setx	0xB9A7568F,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f11
	fadds	%f11,	%f25,	%f21
	taddcctv	%g2,	0x128C,	%l4
	call	loop_919
	sub	%i7,	0x08AA,	%g3
	nop
	set	0x50, %i5
	prefetch	[%l7 + %i5],	 0
	sdivcc	%o5,	0x0CA9,	%o4
loop_919:
	movvs	%xcc,	0x4BB,	%i0
	tgu	%icc,	0x1
	movuge	%fcc3,	0x16F,	%l5
	call	loop_920
	lduh	[%l7 + 0x5E],	%i3
	movpos	%icc,	0x290,	%o7
	call	loop_921
loop_920:
	rdpr	%cwp,	%l1
	call	loop_922
	call	loop_923
loop_921:
	stw	%g6,	[%l7 + 0x48]
	fmovdule	%fcc0,	%f26,	%f4
loop_922:
	fpsub16	%f2,	%f10,	%f26
loop_923:
	fbule,a,pt	%fcc1,	loop_924
	addcc	%i4,	0x08C0,	%o0
	rdpr	%wstate,	%o6
	call	loop_925
loop_924:
	nop
	fitod	%f2,	%f12
	fdtos	%f12,	%f10
	andncc	%i2,	%l2,	%l6
	subc	%g1,	0x0972,	%i5
loop_925:
	fmuld8sux16	%f21,	%f31,	%f24
	rdpr	%tba,	%g4
	umulcc	%g5,	%i1,	%g7
	bmask	%i6,	%o2,	%l3
	movl	%fcc2,	%o1,	%l0
	call	loop_926
	fmovspos	%xcc,	%f8,	%f1
	tne	%xcc,	0x5
	fpsub32s	%f24,	%f31,	%f2
loop_926:
	call	loop_927
	rdpr	%tba,	%o3
	fmovsuge	%fcc3,	%f4,	%f3
	fzero	%f6
loop_927:
	xnor	%l4,	0x0F6E,	%i7
	edge16ln	%g3,	%o5,	%g2
	call	loop_928
	edge8	%o4,	%l5,	%i3
	fcmps	%fcc3,	%f30,	%f30
	fmul8x16au	%f0,	%f18,	%f14
loop_928:
	call	loop_929
	movn	%fcc2,	%o7,	%i0
	call	loop_930
	call	loop_931
loop_929:
	call	loop_932
	call	loop_933
loop_930:
	smulcc	%g6,	%i4,	%l1
loop_931:
	call	loop_934
loop_932:
	rd	%sys_tick_cmpr,	%o6
loop_933:
	tsubcc	%o0,	%l2,	%l6
	fcmple16	%f10,	%f22,	%i2
loop_934:
	movrlz	%i5,	%g4,	%g1
	fmovsge	%fcc1,	%f17,	%f15
	fsrc2	%f18,	%f6
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	movlg	%fcc0,	%i1,	%g5
	set	0x4C, %l5
	ldsba	[%l7 + %l5] 0x18,	%i6
	fornot2	%f14,	%f12,	%f16
	fmul8x16au	%f1,	%f21,	%f6
	wrpr 	%g0, 	0x2, 	%gl
	fxnor	%f20,	%f22,	%f14
	swap	[%l7 + 0x38],	%l3
	call	loop_935
	tvc	%xcc,	0x0
	wr	%g0,	0x0c,	%asi
	ldswa	[%l7 + 0x78] %asi,	%o2
loop_935:
	fnor	%f14,	%f6,	%f30
	tg	%xcc,	0x4
	fsrc2	%f26,	%f4
	fmovsn	%xcc,	%f31,	%f18
	call	loop_936
	fsrc2s	%f28,	%f23
	orn	%o1,	%l0,	%o3
	nop
	fitos	%f6,	%f23
	fstod	%f23,	%f28
loop_936:
	nop
	fitos	%f0,	%f4
	fstod	%f4,	%f28
	call	loop_937
	srax	%i7,	0x04,	%g3
	fpackfix	%f10,	%f19
	fpackfix	%f2,	%f18
loop_937:
	mova	%fcc2,	0x4FB,	%l4
	fnands	%f8,	%f23,	%f26
	movule	%fcc3,	0x55E,	%g2
	call	loop_938
	taddcc	%o4,	0x1121,	%l5
	call	loop_939
	fsrc2s	%f21,	%f16
loop_938:
	fmovduge	%fcc2,	%f12,	%f22
	movrlez	%o5,	%o7,	%i0
loop_939:
	bgu,pn	%xcc,	loop_940
	movneg	%icc,	%g6,	%i3
	bge,a,pt	%icc,	loop_941
loop_940:
	nop

loop_941:
	nop

	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 5:
!
!	Type l   	: 30
!	Type a   	: 27
!	Type x   	: 12
!	Type cti   	: 152
!	Type f   	: 148
!	Type i   	: 131
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
	set	0x5,	%g2
	set	0x7,	%g3
	set	0xB,	%g4
	set	0xA,	%g5
	set	0xC,	%g6
	set	0xA,	%g7
	!# Input registers
	set	-0x6,	%i0
	set	-0x5,	%i1
	set	-0x9,	%i2
	set	-0xB,	%i3
	set	-0x5,	%i4
	set	-0x9,	%i5
	set	-0x4,	%i6
	set	-0x1,	%i7
	!# Local registers
	set	0x4E49B63E,	%l0
	set	0x5365C533,	%l1
	set	0x37A1C200,	%l2
	set	0x4F1A12DE,	%l3
	set	0x5F594C02,	%l4
	set	0x36084023,	%l5
	set	0x184AC14F,	%l6
	!# Output registers
	set	0x1F51,	%o0
	set	-0x14EA,	%o1
	set	0x038E,	%o2
	set	0x1EBD,	%o3
	set	-0x17BA,	%o4
	set	0x1D24,	%o5
	set	0x0E13,	%o6
	set	0x0A95,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0xDF0ECADE0EF32D6C)
	INIT_TH_FP_REG(%l7,%f2,0xD39FBDF2FF8041F1)
	INIT_TH_FP_REG(%l7,%f4,0x28E8DA40A34F7AF5)
	INIT_TH_FP_REG(%l7,%f6,0x1ED95E842FE99A93)
	INIT_TH_FP_REG(%l7,%f8,0xC75F90F668FE95A4)
	INIT_TH_FP_REG(%l7,%f10,0xB5604C572AF6B3B0)
	INIT_TH_FP_REG(%l7,%f12,0xD2A237325CE89EBE)
	INIT_TH_FP_REG(%l7,%f14,0x2B3C65BA4DFB4A5E)
	INIT_TH_FP_REG(%l7,%f16,0x8CF05B6E45FCA256)
	INIT_TH_FP_REG(%l7,%f18,0x40B4194346F8E401)
	INIT_TH_FP_REG(%l7,%f20,0xE43FCD95335A2B05)
	INIT_TH_FP_REG(%l7,%f22,0xBC76F48ADA21346E)
	INIT_TH_FP_REG(%l7,%f24,0xA92EAFE66D619A84)
	INIT_TH_FP_REG(%l7,%f26,0x685FBAEE804725AF)
	INIT_TH_FP_REG(%l7,%f28,0xE4E0B45FBC8156B8)
	INIT_TH_FP_REG(%l7,%f30,0x2C0ED2C6B4BF932A)

	!# Execute Main Diag ..

	brgez,a,pn	%l1,	loop_942
	fcmpes	%fcc3,	%f15,	%f13
	call	loop_943
	fmovspos	%icc,	%f24,	%f8
loop_942:
	movlg	%fcc2,	%o6,	%i4
	xnor	%l2,	0x1669,	%o0
loop_943:
	fmovdvc	%icc,	%f6,	%f18
	fmovrslz	%i2,	%f29,	%f11
	fble,a,pn	%fcc0,	loop_944
	call	loop_945
	movgu	%icc,	0x509,	%i5
	wrpr	%l6,	0x0F9F,	%tick
loop_944:
	fandnot2s	%f15,	%f12,	%f8
loop_945:
	movl	%icc,	0x617,	%g4
	movgu	%icc,	0x42B,	%g1
	fmovsu	%fcc2,	%f17,	%f31
	fmovsgu	%xcc,	%f17,	%f16
	tcs	%xcc,	0x4
	fxnor	%f12,	%f24,	%f16
	fmul8sux16	%f14,	%f0,	%f4
	andn	%i1,	0x08DC,	%i6
	movcc	%icc,	0x3B7,	%g5
	tge	%xcc,	0x2
	movl	%fcc1,	%l3,	%g7
	call	loop_946
	fbne	%fcc1,	loop_947
	rdpr	%cleanwin,	%o1
	array16	%o2,	%l0,	%i7
loop_946:
	movrlez	%o3,	0x015,	%l4
loop_947:
	rdhpr	%hintp,	%g3
	fmovrdlz	%g2,	%f16,	%f12
	orn	%o4,	0x1B54,	%o5
	fands	%f9,	%f24,	%f11
	fmovdgu	%icc,	%f16,	%f6
	fmovdu	%fcc2,	%f18,	%f22
	fornot1	%f0,	%f22,	%f16
	nop
	setx	loop_948,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x034200001405,	%l0,	%l1
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
	for	%f20,	%f16,	%f28
	fors	%f14,	%f27,	%f15
	xnorcc	%l5,	0x0452,	%i0
loop_948:
	movg	%fcc3,	%g6,	%i3
	fpadd16	%f6,	%f0,	%f16
	fmuld8sux16	%f16,	%f4,	%f26
	addcc	%l1,	0x05A8,	%o6
	rdhpr	%ver,	%i4
	fmovdvc	%icc,	%f12,	%f2
	fcmpeq16	%f6,	%f20,	%l2
	edge8	%o7,	%o0,	%i2
	rd	%pc,	%l6
	fmovdle	%fcc2,	%f24,	%f8
	edge8n	%g4,	%i5,	%g1
	sdivcc	%i1,	0x09A1,	%g5
	fmovsue	%fcc0,	%f3,	%f9
	call	loop_949
	call	loop_950
	tl	%xcc,	0x1
	sub	%i6,	0x1C0B,	%l3
loop_949:
	call	loop_951
loop_950:
	tcc	%icc,	0x6
	call	loop_952
	movue	%fcc2,	%g7,	%o1
loop_951:
	sll	%l0,	%o2,	%i7
	call	loop_953
loop_952:
	nop
	setx	0x2A997293C54B8158,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0xFFE8045C88977378,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	faddd	%f14,	%f2,	%f30
	ble,pt	%xcc,	loop_954
	sra	%o3,	%l4,	%g2
loop_953:
	andncc	%o4,	0x183A,	%g3
	fbg,a	%fcc0,	loop_955
loop_954:
	mulx	%o5,	%i0,	%g6
	movu	%fcc1,	0x0ED,	%i3
	sllx	%l5,	%l1,	%o6
loop_955:
	nop
	setx	0x71B1E0E6,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f21
	setx	0x869AA1A6,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f30
	fdivs	%f30,	%f21,	%f29
	nop
	set	0x4F, %o5
	ldstub	[%l7 + %o5],	%i4
	call	loop_956
	fbne,a	%fcc1,	loop_957
	call	loop_958
	fmul8sux16	%f18,	%f20,	%f14
loop_956:
	call	loop_959
loop_957:
	nop
	fitod	%f2,	%f20
	fdtox	%f20,	%f14
loop_958:
	fmovrdlz	%o7,	%f2,	%f6
	wr	%g0,	0x19,	%asi
	ldsba	[%l7 + 0x1D] %asi,	%l2
loop_959:
	andncc	%o0,	0x100F,	%i2
	fone	%f28
	call	loop_960
	movcc	%xcc,	%g4,	%l6
	tge	%icc,	0x6
	call	loop_961
loop_960:
	movre	%i5,	%i1,	%g1
	stx	%i6,	[%l7 + 0x70]
	edge16ln	%l3,	%g5,	%g7
loop_961:
	fandnot1s	%f18,	%f1,	%f21
	fcmpgt32	%f2,	%f12,	%o1
	umulcc	%o2,	%i7,	%o3
	edge32	%l0,	%g2,	%l4
	wr	%g0,	0x89,	%asi
	ldsha	[%l7 + 0x48] %asi,	%o4
	fabsd	%f14,	%f6
	srlx	%g3,	%i0,	%o5
	umul	%g6,	%i3,	%l5
	wr	%g0,	0x18,	%asi
	lda	[%l7 + 0x60] %asi,	%f18
	movn	%fcc1,	%o6,	%i4
	fmuld8sux16	%f31,	%f13,	%f12
	call	loop_962
	ldstub	[%l7 + 0x78],	%o7
	srax	%l1,	0x04,	%l2
	fcmpne16	%f2,	%f4,	%i2
loop_962:
	fmovdo	%fcc1,	%f14,	%f30
	fmovscs	%icc,	%f26,	%f16
	call	loop_963
	fxor	%f8,	%f10,	%f28
	tn	%icc,	0x3
	sth	%o0,	[%l7 + 0x64]
loop_963:
	fcmpne16	%f0,	%f30,	%g4
	for	%f0,	%f24,	%f2
	fmovdcc	%icc,	%f28,	%f10
	rd	%y,	%l6
	call	loop_964
	fcmpgt16	%f22,	%f0,	%i5
	call	loop_965
	fxnors	%f7,	%f9,	%f21
loop_964:
	ldsw	[%l7 + 0x48],	%i1
	fzeros	%f14
loop_965:
	fcmpgt32	%f30,	%f26,	%g1
	set	0x48, %i0
	prefetcha	[%l7 + %i0] 0x81,	 3
	call	loop_966
	call	loop_967
	call	loop_968
	call	loop_969
loop_966:
	rdhpr	%hpstate,	%g5
loop_967:
	edge8ln	%i6,	%o1,	%g7
loop_968:
	nop
	fitos	%f8,	%f17
	fstox	%f17,	%f18
loop_969:
	call	loop_970
	movvs	%xcc,	%o2,	%i7
	rd	%fprs,	%o3
	call	loop_971
loop_970:
	bshuffle	%f8,	%f18,	%f22
	fbo,a	%fcc1,	loop_972
	fmovscs	%icc,	%f4,	%f18
loop_971:
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	fpadd32s	%f4,	%f27,	%f14
loop_972:
	wr	%l0,	%g2,	%y
	call	loop_973
	bn,pt	%icc,	loop_974
	movu	%fcc0,	%l4,	%g3
	call	loop_975
loop_973:
	edge16l	%i0,	%o4,	%o5
loop_974:
	fbe	%fcc2,	loop_976
	movneg	%icc,	%g6,	%l5
loop_975:
	fxor	%f26,	%f6,	%f0
	movge	%icc,	%o6,	%i4
loop_976:
	fmovdul	%fcc2,	%f6,	%f0
	call	loop_977
	call	loop_978
	andn	%o7,	0x0C0E,	%i3
	rd	%tick_cmpr,	%l1
loop_977:
	call	loop_979
loop_978:
	nop
	setx	0xCBF9D995E1067814,	%l0,	%l6
	stx	%l6,	[%l7 + 0x38]
	ldx	[%l7 + 0x38],	%fsr
	fbn	%fcc0,	loop_980
	call	loop_981
loop_979:
	call	loop_982
	fmovdlg	%fcc0,	%f16,	%f14
loop_980:
	and	%l2,	%o0,	%i2
loop_981:
	call	loop_983
loop_982:
	fmovsu	%fcc0,	%f7,	%f30
	fble,a	%fcc2,	loop_984
	tge	%xcc,	0x3
loop_983:
	fmovslg	%fcc2,	%f2,	%f23
	movvc	%icc,	0x415,	%l6
loop_984:
	call	loop_985
	wr	%i5,	0x16FD,	%set_softint
	call	loop_986
	call	loop_987
loop_985:
	movcs	%icc,	0x474,	%i1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x69A, 	%hsys_tick_cmpr
loop_986:
	call	loop_988
loop_987:
	fmovsa	%fcc2,	%f15,	%f26
	movle	%fcc0,	%l3,	%i6
	call	loop_989
loop_988:
	nop
	fitod	%f8,	%f18
	fdtox	%f18,	%f6
	sllx	%g5,	%g7,	%o1
	call	loop_990
loop_989:
	for	%f8,	%f16,	%f18
	call	loop_991
	tcs	%icc,	0x4
loop_990:
	taddcctv	%o2,	0x1932,	%i7
	fmovd	%f10,	%f10
loop_991:
	call	loop_992
	nop
	setx	0x65BE6A9BB9C8714E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0xECD1470233CA6C68,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	faddd	%f18,	%f30,	%f8
	fmovdgu	%icc,	%f10,	%f20
	lduh	[%l7 + 0x6C],	%l0
loop_992:
	fmovrdgez	%o3,	%f20,	%f30
	add	%l7,	0x54,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%g2,	%l4
	fmovdue	%fcc2,	%f6,	%f16
	fmovrdne	%i0,	%f2,	%f6
	call	loop_993
	call	loop_994
	fpack16	%f30,	%f31
	smulcc	%o4,	0x0996,	%o5
loop_993:
	call	loop_995
loop_994:
	fpackfix	%f28,	%f10
	fmovsue	%fcc0,	%f31,	%f10
	fmovrslez	%g3,	%f4,	%f25
loop_995:
	wrpr	%l5,	%o6,	%cwp
	edge16	%i4,	%g6,	%o7
	wr	%l1,	%l2,	%sys_tick
	fmovdpos	%xcc,	%f30,	%f20
	fmovd	%f18,	%f26
	call	loop_996
	nop
	fitod	%f8,	%f6
	fdtoi	%f6,	%f21
	subc	%o0,	0x0F34,	%i3
	edge16ln	%l6,	%i5,	%i2
loop_996:
	nop
	set	0x7C, %o4
	lduw	[%l7 + %o4],	%g4
	fmuld8sux16	%f28,	%f25,	%f8
	call	loop_997
	tn	%xcc,	0x7
	fmovsa	%xcc,	%f16,	%f6
	movrlz	%g1,	%i1,	%l3
loop_997:
	call	loop_998
	call	loop_999
	fmovslg	%fcc1,	%f28,	%f2
	call	loop_1000
loop_998:
	edge32ln	%g5,	%i6,	%o1
loop_999:
	call	loop_1001
	move	%icc,	0x2E5,	%g7
loop_1000:
	fornot2	%f4,	%f2,	%f16
	call	loop_1002
loop_1001:
	call	loop_1003
	flush	%l7 + 0x7C
	call	loop_1004
loop_1002:
	edge16n	%i7,	%o2,	%o3
loop_1003:
	fsrc2s	%f15,	%f9
	fones	%f1
loop_1004:
	call	loop_1005
	nop
	fitos	%f3,	%f10
	fstod	%f10,	%f8
	fpsub32	%f16,	%f28,	%f22
	brlez,pt	%l0,	loop_1006
loop_1005:
	fmul8ulx16	%f18,	%f30,	%f14
	call	loop_1007
	fpack16	%f8,	%f23
loop_1006:
	bl,a	%xcc,	loop_1008
	nop
	fitos	%f27,	%f11
loop_1007:
	nop
	setx	0x03F6,	%l0,	%i0
	udiv	%g2,	%i0,	%l4
	call	loop_1009
loop_1008:
	call	loop_1010
	rdpr	%tba,	%o5
	udivcc	%o4,	0x0BA0,	%l5
loop_1009:
	call	loop_1011
loop_1010:
	movcc	%xcc,	0x6BA,	%g3
	call	loop_1012
	wr	%o6,	%g6,	%set_softint
loop_1011:
	tsubcc	%o7,	%i4,	%l1
	edge16l	%o0,	%l2,	%l6
loop_1012:
	nop
	setx	0x0759,	%l0,	%i2
	udiv	%i3,	%i2,	%g4
	call	loop_1013
	smulcc	%i5,	%g1,	%l3
	set	0x7A, %g6
	ldstuba	[%l7 + %g6] 0x88,	%g5
loop_1013:
	call	loop_1014
	fornot2	%f24,	%f22,	%f16
	nop
	set	0x74, %i1
	lduh	[%l7 + %i1],	%i6
	andcc	%o1,	0x0D95,	%g7
loop_1014:
	edge16	%i7,	%i1,	%o2
	call	loop_1015
	fmovsle	%fcc3,	%f2,	%f6
	tsubcctv	%o3,	%l0,	%i0
	bshuffle	%f0,	%f10,	%f2
loop_1015:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x09F, 	%hsys_tick_cmpr
	movvs	%icc,	%o5,	%o4
	fmovsl	%fcc1,	%f23,	%f15
	fbule,pt	%fcc2,	loop_1016
	fmovsgu	%icc,	%f26,	%f16
	tvc	%icc,	0x4
	call	loop_1017
loop_1016:
	call	loop_1018
	bneg	%icc,	loop_1019
	fbuge	%fcc3,	loop_1020
loop_1017:
	fmul8x16	%f13,	%f10,	%f8
loop_1018:
	fand	%f26,	%f20,	%f0
loop_1019:
	call	loop_1021
loop_1020:
	movpos	%icc,	0x2D5,	%l5
	addccc	%g2,	%g3,	%g6
	call	loop_1022
loop_1021:
	fmovda	%icc,	%f2,	%f22
	fands	%f19,	%f0,	%f16
	call	loop_1023
loop_1022:
	udivx	%o7,	0x13EC,	%o6
	xnor	%i4,	%l1,	%l2
	add	%o0,	%i3,	%l6
loop_1023:
	call	loop_1024
	te	%xcc,	0x1
	fcmpeq16	%f4,	%f10,	%g4
	nop
	setx	0xC8641D3399CD8B31,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0x15B510F2F5DE13E7,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	fsubd	%f30,	%f4,	%f24
loop_1024:
	nop
	setx	0x650927A1998EAE49,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0x3E5F74EE,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fsmuld	%f0,	%f8,	%f2
	fmovrsne	%i2,	%f27,	%f1
	call	loop_1025
	tne	%xcc,	0x7
	call	loop_1026
	call	loop_1027
loop_1025:
	fmovduge	%fcc1,	%f10,	%f12
	and	%g1,	0x0215,	%l3
loop_1026:
	call	loop_1028
loop_1027:
	call	loop_1029
	nop
	setx	0x9BF1D9F5,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f5
	setx	0xACEF0FB7,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f9
	fmuls	%f9,	%f5,	%f13
	call	loop_1030
loop_1028:
	movrgez	%i5,	0x3E5,	%i6
loop_1029:
	array32	%g5,	%g7,	%i7
	call	loop_1031
loop_1030:
	edge8	%i1,	%o2,	%o3
	wr	%g0,	0x80,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
loop_1031:
	fmovsn	%fcc1,	%f1,	%f23
	fbge,pt	%fcc3,	loop_1032
	nop
	fitos	%f10,	%f16
	fstod	%f16,	%f2
	xor	%l0,	0x1BD2,	%i0
	faligndata	%f0,	%f4,	%f30
loop_1032:
	te	%xcc,	0x5
	mulx	%l4,	%o5,	%o4
	fcmpne32	%f4,	%f30,	%l5
	call	loop_1033
	call	loop_1034
	fcmpes	%fcc3,	%f11,	%f4
	andcc	%g2,	%o1,	%g6
loop_1033:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xF5A, 	%sys_tick_cmpr
loop_1034:
	lduw	[%l7 + 0x4C],	%g3
	fpadd16s	%f10,	%f4,	%f23
	ldx	[%l7 + 0x78],	%i4
	fmovsuge	%fcc2,	%f7,	%f17
	fmovdgu	%xcc,	%f22,	%f16
	std	%f28,	[%l7 + 0x58]
	call	loop_1035
	fmul8x16	%f14,	%f14,	%f4
	fmovdge	%fcc2,	%f8,	%f8
	ldd	[%l7 + 0x30],	%f30
loop_1035:
	fmovrse	%o6,	%f5,	%f24
	fmovdug	%fcc2,	%f24,	%f26
	set	0x28, %g2
	swapa	[%l7 + %g2] 0x88,	%l1
	fsrc2	%f2,	%f14
	taddcc	%o0,	%i3,	%l6
	nop
	fitod	%f12,	%f20
	fdtoi	%f20,	%f5
	call	loop_1036
	call	loop_1037
	flushw
	edge32ln	%g4,	%i2,	%g1
loop_1036:
	bgu,pn	%icc,	loop_1038
loop_1037:
	call	loop_1039
	fmovda	%xcc,	%f22,	%f26
	umul	%l2,	%i5,	%i6
loop_1038:
	call	loop_1040
loop_1039:
	ldsh	[%l7 + 0x24],	%g5
	movo	%fcc0,	%g7,	%l3
	fmovda	%xcc,	%f8,	%f30
loop_1040:
	fbul	%fcc2,	loop_1041
	fmovdcc	%icc,	%f12,	%f22
	fbug,a	%fcc2,	loop_1042
	sir	0x11F6
loop_1041:
	fmovsul	%fcc1,	%f24,	%f0
	fnegs	%f6,	%f17
loop_1042:
	fmovsuge	%fcc2,	%f26,	%f22
	tvc	%xcc,	0x0
	fmovsug	%fcc0,	%f12,	%f16
	fmovdg	%fcc3,	%f8,	%f26
	call	loop_1043
	call	loop_1044
	wrpr 	%g0, 	0x2, 	%gl
	call	loop_1045
loop_1043:
	fornot2s	%f31,	%f22,	%f3
loop_1044:
	call	loop_1046
	call	loop_1047
loop_1045:
	nop
	setx	0x327E34A92748BB12,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0x2BE2F9ACCDF8036B,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	fmuld	%f28,	%f10,	%f4
	fmovrdne	%o2,	%f14,	%f0
loop_1046:
	call	loop_1048
loop_1047:
	tgu	%xcc,	0x7
	mova	%xcc,	0x35D,	%l0
	call	loop_1049
loop_1048:
	rd	%asi,	%o3
	wr	%l4,	%o5,	%ccr
	call	loop_1050
loop_1049:
	call	loop_1051
	tgu	%icc,	0x6
	fabss	%f7,	%f31
loop_1050:
	call	loop_1052
loop_1051:
	call	loop_1053
	lduw	[%l7 + 0x40],	%i0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_1052:
	tsubcctv	%o4,	%o1,	%g2
loop_1053:
	call	loop_1054
	tvc	%icc,	0x5
	fbu,pn	%fcc3,	loop_1055
	sll	%g6,	%g3,	%i4
loop_1054:
	wrpr	%o6,	%o7,	%pil
	tleu	%icc,	0x7
loop_1055:
	tge	%xcc,	0x7
	prefetch	[%l7 + 0x0C],	 3
	or	%o0,	0x0058,	%l1
	movule	%fcc2,	%l6,	%i3
	movl	%fcc1,	0x501,	%g4
	call	loop_1056
	call	loop_1057
	tge	%xcc,	0x6
	movo	%fcc2,	%g1,	%l2
loop_1056:
	fcmpgt16	%f0,	%f12,	%i5
loop_1057:
	membar	0x35
	wr	%g0,	0xe2,	%asi
	stxa	%i2,	[%l7 + 0x50] %asi
	membar	#Sync
	call	loop_1058
	call	loop_1059
	call	loop_1060
	movu	%fcc0,	0x723,	%i6
loop_1058:
	nop
	setx	0xD446472788AFF8C8,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0xCA131603092871A6,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	fsubd	%f24,	%f10,	%f30
loop_1059:
	fmovrslez	%g7,	%f4,	%f15
loop_1060:
	nop
	setx	loop_1061,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x004400001403,	%l0,	%l1
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
	fmul8x16al	%f18,	%f0,	%f4
	fble	%fcc0,	loop_1062
	fbge	%fcc3,	loop_1063
loop_1061:
	fpadd32	%f6,	%f16,	%f16
	xnorcc	%l3,	%g5,	%i7
loop_1062:
	edge8ln	%o2,	%i1,	%o3
loop_1063:
	fpsub32	%f14,	%f20,	%f14
	edge32l	%l4,	%o5,	%i0
	move	%icc,	0x2AE,	%l0
	fmovdgu	%xcc,	%f14,	%f20

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	movule	%fcc1,	%g2,	%l5
	srax	%g3,	%i4,	%o6
	call	loop_1064
	andn	%g6,	%o7,	%o0
	fabsd	%f16,	%f12
	call	loop_1065
loop_1064:
	call	loop_1066
	ldstub	[%l7 + 0x0A],	%l6
	wr	%g0,	0x19,	%asi
	lduwa	[%l7 + 0x08] %asi,	%l1
loop_1065:
	call	loop_1067
loop_1066:
	movpos	%icc,	0x01A,	%i3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x5B4, 	%hsys_tick_cmpr
	call	loop_1068
loop_1067:
	call	loop_1069
	xorcc	%i5,	0x1ECA,	%g1
	call	loop_1070
loop_1068:
	or	%i2,	0x0CC3,	%g7
loop_1069:
	fcmpeq32	%f4,	%f26,	%l3
	fcmpgt32	%f10,	%f8,	%i6
loop_1070:
	call	loop_1071
	fnot1s	%f4,	%f9
	subcc	%i7,	0x1850,	%o2
	call	loop_1072
loop_1071:
	tneg	%icc,	0x7
	movug	%fcc2,	%g5,	%o3
	fmovrdlz	%i1,	%f24,	%f12
loop_1072:
	call	loop_1073
	movu	%fcc2,	0x549,	%l4
	rdpr	%cwp,	%i0
	bneg,pt	%icc,	loop_1074
loop_1073:
	wr 	%g0, 	0x4, 	%fprs
	call	loop_1075
	call	loop_1076
loop_1074:
	fornot1	%f12,	%f26,	%f26
	fmovrslez	%l0,	%f28,	%f4
loop_1075:
	rd	%tick_cmpr,	%o1
loop_1076:
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	nop
	setx	0x31158DBA591277FF,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0x1CFDE509BEBB2B26,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	faddd	%f4,	%f26,	%f18
	call	loop_1077
	fpadd32s	%f24,	%f6,	%f22
	nop
	setx	0x0113,	%l0,	%g3
	sdivx	%l5,	%g3,	%g2
	call	loop_1078
loop_1077:
	fmovs	%f16,	%f16
	fnegs	%f11,	%f15
	movug	%fcc2,	0x0C5,	%i4
loop_1078:
	brgez	%g6,	loop_1079
	fsrc2	%f6,	%f26
	taddcctv	%o6,	0x02B7,	%o7
	call	loop_1080
loop_1079:
	wr	%o0,	0x0AE8,	%sys_tick
	orcc	%l1,	0x1E96,	%l6
	wr	%g0,	0x10,	%asi
	prefetcha	[%l7 + 0x38] %asi,	 4
loop_1080:
	tge	%icc,	0x2
	tgu	%icc,	0x4
	and	%l2,	%g4,	%g1
	xor	%i5,	%g7,	%l3
	addc	%i6,	%i7,	%o2
	movge	%fcc1,	%i2,	%o3
	nop
	set	0x40, %o1
	swap	[%l7 + %o1],	%g5
	movvc	%icc,	%l4,	%i1
	nop
	fitos	%f3,	%f27
	fstox	%f27,	%f28
	call	loop_1081
	nop
	setx	0x323C18FDB6DA44A8,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0x8F2922B67801626D,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	fsubd	%f6,	%f20,	%f6
	call	loop_1082
	call	loop_1083
loop_1081:
	call	loop_1084
	brnz	%i0,	loop_1085
loop_1082:
	taddcc	%o5,	%o4,	%o1
loop_1083:
	fbe,a	%fcc0,	loop_1086
loop_1084:
	fmovdcs	%xcc,	%f4,	%f2
loop_1085:
	nop
	setx	loop_1087,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x022400001405,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_1086:
	nop

loop_1087:
	nop

	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 6:
!
!	Type l   	: 30
!	Type a   	: 29
!	Type x   	: 11
!	Type cti   	: 146
!	Type f   	: 142
!	Type i   	: 142
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
	set	0x1,	%g1
	set	0x0,	%g2
	set	0xF,	%g3
	set	0x7,	%g4
	set	0x3,	%g5
	set	0x6,	%g6
	set	0xE,	%g7
	!# Input registers
	set	-0xE,	%i0
	set	-0x1,	%i1
	set	-0x9,	%i2
	set	-0xD,	%i3
	set	-0x0,	%i4
	set	-0x8,	%i5
	set	-0xD,	%i6
	set	-0x4,	%i7
	!# Local registers
	set	0x412ECC20,	%l0
	set	0x7996BF58,	%l1
	set	0x547DB204,	%l2
	set	0x3D3E7005,	%l3
	set	0x259391EB,	%l4
	set	0x47753B92,	%l5
	set	0x11A42C56,	%l6
	!# Output registers
	set	0x1157,	%o0
	set	-0x1F92,	%o1
	set	-0x0DD0,	%o2
	set	0x0389,	%o3
	set	-0x0565,	%o4
	set	0x0564,	%o5
	set	0x1957,	%o6
	set	0x02FB,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0xDF0ECADE0EF32D6C)
	INIT_TH_FP_REG(%l7,%f2,0xD39FBDF2FF8041F1)
	INIT_TH_FP_REG(%l7,%f4,0x28E8DA40A34F7AF5)
	INIT_TH_FP_REG(%l7,%f6,0x1ED95E842FE99A93)
	INIT_TH_FP_REG(%l7,%f8,0xC75F90F668FE95A4)
	INIT_TH_FP_REG(%l7,%f10,0xB5604C572AF6B3B0)
	INIT_TH_FP_REG(%l7,%f12,0xD2A237325CE89EBE)
	INIT_TH_FP_REG(%l7,%f14,0x2B3C65BA4DFB4A5E)
	INIT_TH_FP_REG(%l7,%f16,0x8CF05B6E45FCA256)
	INIT_TH_FP_REG(%l7,%f18,0x40B4194346F8E401)
	INIT_TH_FP_REG(%l7,%f20,0xE43FCD95335A2B05)
	INIT_TH_FP_REG(%l7,%f22,0xBC76F48ADA21346E)
	INIT_TH_FP_REG(%l7,%f24,0xA92EAFE66D619A84)
	INIT_TH_FP_REG(%l7,%f26,0x685FBAEE804725AF)
	INIT_TH_FP_REG(%l7,%f28,0xE4E0B45FBC8156B8)
	INIT_TH_FP_REG(%l7,%f30,0x2C0ED2C6B4BF932A)

	!# Execute Main Diag ..

	tne	%icc,	0x0
	xnor	%l5,	0x023A,	%l0
	fble	%fcc0,	loop_1088
	call	loop_1089
	movcs	%icc,	%g2,	%g3
	smul	%i4,	%g6,	%o6
loop_1088:
	call	loop_1090
loop_1089:
	fbl,a	%fcc1,	loop_1091
	call	loop_1092
	call	loop_1093
loop_1090:
	fbul,a,pn	%fcc3,	loop_1094
loop_1091:
	movpos	%icc,	0x567,	%o7
loop_1092:
	fmovsa	%icc,	%f29,	%f22
loop_1093:
	fsrc1s	%f10,	%f17
loop_1094:
	call	loop_1095
	call	loop_1096
	fxnors	%f21,	%f6,	%f20
	fnot2s	%f5,	%f8
loop_1095:
	xnor	%o0,	%l6,	%l1
loop_1096:
	movue	%fcc2,	0x215,	%l2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	nop
	setx	0x572B73E8E4E16F00,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0x615368D8A62E5132,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	fdivd	%f12,	%f4,	%f0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fmovdleu	%xcc,	%f10,	%f24
	call	loop_1097
	mova	%fcc3,	%g7,	%l3
	edge16	%i5,	%i6,	%o2
	fpadd32	%f16,	%f8,	%f22
loop_1097:
	fmovdo	%fcc1,	%f24,	%f2
	fmul8ulx16	%f20,	%f22,	%f10
	call	loop_1098
	addccc	%i7,	%i2,	%g5
	sra	%o3,	0x0A,	%l4
	movvs	%xcc,	0x11D,	%i0
loop_1098:
	nop
	set	0x20, %o7
	ldswa	[%l7 + %o7] 0x19,	%i1
	be,a	%icc,	loop_1099
	addcc	%o4,	0x0FAD,	%o5
	call	loop_1100
	call	loop_1101
loop_1099:
	sdiv	%l5,	0x0912,	%l0
	call	loop_1102
loop_1100:
	bshuffle	%f20,	%f16,	%f18
loop_1101:
	fbuge	%fcc2,	loop_1103
	fone	%f30
loop_1102:
	mulx	%o1,	%g3,	%i4
	movu	%fcc2,	0x569,	%g2
loop_1103:
	call	loop_1104
	call	loop_1105
	nop
	setx	0x1AD0,	%l0,	%o6
	sdiv	%g6,	%o6,	%o7
	sub	%l6,	0x1CA7,	%o0
loop_1104:
	fnot1	%f24,	%f4
loop_1105:
	move	%xcc,	%l1,	%i3
	sethi	0x0229,	%g4
	bge	%xcc,	loop_1106
	wr	%l2,	0x0823,	%softint
	call	loop_1107
	edge16l	%g1,	%l3,	%i5
loop_1106:
	call	loop_1108
	call	loop_1109
loop_1107:
	wr	%i6,	0x07C8,	%sys_tick
	nop
	set	0x7E, %o6
	sth	%o2,	[%l7 + %o6]
loop_1108:
	call	loop_1110
loop_1109:
	fcmpeq32	%f4,	%f30,	%g7
	tvs	%xcc,	0x0
	call	loop_1111
loop_1110:
	ldsw	[%l7 + 0x18],	%i7
	ld	[%l7 + 0x4C],	%f28
	fnot1s	%f15,	%f23
loop_1111:
	array16	%g5,	%o3,	%l4
	nop
	setx	0x3C79F839CAC790EE,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0x4933AD4C2ED76DC1,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	fsubd	%f22,	%f8,	%f10
	fmovd	%f20,	%f4
	fmovd	%f22,	%f30
	fmovsa	%xcc,	%f7,	%f30
	rd	%pc,	%i2
	call	loop_1112
	movl	%icc,	%i1,	%o4
	wr	%i0,	0x140C,	%set_softint
	fcmpeq16	%f6,	%f2,	%o5
loop_1112:
	fands	%f27,	%f20,	%f14
	rd	%pc,	%l5
	fmovdvs	%xcc,	%f14,	%f26
	movcc	%icc,	0x4F6,	%o1
	fpadd32s	%f2,	%f14,	%f27
	fmovsuge	%fcc1,	%f0,	%f9
	movvs	%icc,	%g3,	%l0
	movneg	%xcc,	%i4,	%g2
	alignaddr	%g6,	%o6,	%o7
	call	loop_1113
	taddcc	%l6,	0x16B3,	%l1
	fmovs	%f6,	%f5
	call	loop_1114
loop_1113:
	movug	%fcc1,	0x08F,	%i3
	membar	0x03
	fmovsue	%fcc0,	%f1,	%f20
loop_1114:
	rdhpr	%ver,	%o0
	call	loop_1115
	srlx	%l2,	0x01,	%g1
	ldsw	[%l7 + 0x14],	%l3
	fmovsge	%icc,	%f12,	%f18
loop_1115:
	fpack16	%f16,	%f11
	fmovdl	%fcc3,	%f20,	%f18
	tsubcc	%i5,	%i6,	%o2
	bpos,a	%icc,	loop_1116
	nop
	set	0x60, %i3
	std	%f14,	[%l7 + %i3]
	fmovdleu	%icc,	%f12,	%f16
	popc	%g7,	%g4
loop_1116:
	call	loop_1117
	subc	%i7,	%g5,	%l4
	nop
	fitos	%f10,	%f13
	fstox	%f13,	%f8
	fmovdg	%fcc0,	%f28,	%f26
loop_1117:
	call	loop_1118
	taddcctv	%i2,	%o3,	%i1
	fpadd32	%f30,	%f14,	%f10
	call	loop_1119
loop_1118:
	fmovdvc	%xcc,	%f22,	%f14
	call	loop_1120
	call	loop_1121
loop_1119:
	movgu	%icc,	%i0,	%o5
	fxnor	%f10,	%f22,	%f4
loop_1120:
	nop
	setx	0x20B5FBE9FD3B7A0C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0x767BDD12,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	fsmuld	%f2,	%f20,	%f22
loop_1121:
	nop
	wr	%g0,	0x0c,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	nop
	setx	0x06E7,	%l0,	%l5
	udiv	%o4,	%l5,	%g3
	movul	%fcc0,	0x71C,	%o1
	fbule	%fcc0,	loop_1122
	fmovsuge	%fcc0,	%f24,	%f5
	call	loop_1123
	fmul8ulx16	%f28,	%f12,	%f2
loop_1122:
	addc	%i4,	%g2,	%g6
	movre	%o6,	%o7,	%l6
loop_1123:
	call	loop_1124
	fpadd32	%f14,	%f12,	%f18
	fmovdule	%fcc3,	%f4,	%f0
	fcmpeq16	%f2,	%f6,	%l1
loop_1124:
	call	loop_1125
	fmovdcs	%icc,	%f8,	%f26
	subccc	%i3,	%l0,	%o0
	call	loop_1126
loop_1125:
	fmovdue	%fcc3,	%f14,	%f2
	pdist	%f8,	%f0,	%f28
	fmovrdgez	%l2,	%f20,	%f4
loop_1126:
	brnz,a	%l3,	loop_1127
	edge32n	%i5,	%i6,	%o2
	addccc	%g1,	0x0DCE,	%g7
	call	loop_1128
loop_1127:
	tl	%xcc,	0x7
	call	loop_1129
	xnor	%g4,	%g5,	%i7
loop_1128:
	edge8n	%i2,	%o3,	%i1
	rdhpr	%htba,	%i0
loop_1129:
	call	loop_1130
	fcmpeq32	%f16,	%f12,	%l4
	call	loop_1131
	edge32n	%o5,	%o4,	%l5
loop_1130:
	fnands	%f28,	%f12,	%f24
	call	loop_1132
loop_1131:
	or	%g3,	%o1,	%g2
	fmovdne	%icc,	%f22,	%f24
	sll	%i4,	0x04,	%g6
loop_1132:
	fmovrse	%o7,	%f31,	%f1
	bcc,pn	%xcc,	loop_1133
	udiv	%o6,	0x1201,	%l6
	fnegs	%f8,	%f23
	wr	%l1,	0x1DD9,	%softint
loop_1133:
	call	loop_1134
	rdhpr	%htba,	%l0
	call	loop_1135
	tn	%icc,	0x4
loop_1134:
	fxor	%f28,	%f18,	%f24
	add	%l7,	0x40,	%l6
	wr	%g0,	0x0c,	%asi
	ldxa	[%l6] %asi,	%o0
	casxa	[%l6] 0x0c,	%o0,	%i3
loop_1135:
	tgu	%icc,	0x7
	nop
	setx	0x3A9D255D,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f1
	setx	0xABA8F7A9,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f5
	fdivs	%f5,	%f1,	%f6
	call	loop_1136
	call	loop_1137
	tsubcc	%l3,	%l2,	%i6
	movl	%fcc1,	0x3AC,	%o2
loop_1136:
	fandnot2	%f16,	%f30,	%f8
loop_1137:
	fpack32	%f20,	%f22,	%f6
	call	loop_1138
	subcc	%g1,	0x1494,	%g7
	call	loop_1139
	array16	%g4,	%g5,	%i7
loop_1138:
	fmul8x16	%f22,	%f4,	%f10
	fmovrdgez	%i2,	%f16,	%f16
loop_1139:
	call	loop_1140
	andcc	%i5,	0x000A,	%o3
	fmovdne	%icc,	%f6,	%f4
	fors	%f4,	%f10,	%f21
loop_1140:
	fands	%f6,	%f9,	%f25
	call	loop_1141
	fmovd	%f8,	%f0
	fcmpd	%fcc0,	%f24,	%f26
	fmovdul	%fcc3,	%f20,	%f26
loop_1141:
	edge16n	%i0,	%i1,	%l4
	movug	%fcc0,	0x126,	%o4
	ble	%icc,	loop_1142
	fmul8x16au	%f27,	%f9,	%f12
	set	0x20, %i4
	ldxa	[%g0 + %i4] 0x20,	%o5
loop_1142:
	fcmple16	%f26,	%f2,	%l5
	call	loop_1143
	fornot2	%f30,	%f28,	%f4
	rdpr	%cansave,	%o1
	xnorcc	%g2,	0x1632,	%i4
loop_1143:
	movcc	%icc,	%g6,	%o7
	fand	%f10,	%f4,	%f8
	brgz,a	%g3,	loop_1144
	call	loop_1145
	tsubcc	%l6,	0x0BAE,	%o6
	movule	%fcc0,	%l0,	%l1
loop_1144:
	call	loop_1146
loop_1145:
	call	loop_1147
	fones	%f18
	call	loop_1148
loop_1146:
	fmovde	%xcc,	%f6,	%f18
loop_1147:
	movle	%icc,	0x469,	%i3
	wrpr	%l3,	%l2,	%pil
loop_1148:
	fbule	%fcc3,	loop_1149
	nop
	setx	0x07AE,	%l0,	%o2
	udivx	%o0,	%o2,	%i6
	call	loop_1150
	orncc	%g7,	%g4,	%g5
loop_1149:
	array32	%g1,	%i2,	%i5
	addcc	%i7,	0x1AE7,	%o3
loop_1150:
	fnand	%f10,	%f30,	%f0
	sdivx	%i0,	0x1CDF,	%l4
	taddcc	%o4,	0x0D95,	%i1
	call	loop_1151
	wr	%l5,	0x06A7,	%sys_tick
	movu	%fcc3,	0x10E,	%o1
	fbn,a	%fcc3,	loop_1152
loop_1151:
	tgu	%icc,	0x2
	rdpr	%tba,	%o5
	fnot2	%f2,	%f16
loop_1152:
	tcs	%xcc,	0x0
	nop
	fitod	%f0,	%f12
	fdtox	%f12,	%f22
	mova	%fcc1,	%g2,	%g6
	addc	%o7,	0x13BB,	%i4
	smulcc	%l6,	0x137A,	%o6
	sub	%g3,	0x0518,	%l0
	edge32n	%i3,	%l3,	%l1
	fmovda	%icc,	%f14,	%f26
	movrgez	%l2,	%o0,	%i6
	te	%xcc,	0x0
	call	loop_1153
	nop
	set	0x34, %l6
	ldstub	[%l7 + %l6],	%o2
	nop
	setx	0xE384743A66B0A394,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0x3161BAD4,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fsmuld	%f0,	%f14,	%f4
	orn	%g7,	%g5,	%g4
loop_1153:
	call	loop_1154
	fnors	%f22,	%f13,	%f20
	call	loop_1155
	brgez,a,pt	%g1,	loop_1156
loop_1154:
	call	loop_1157
	bcc,pt	%xcc,	loop_1158
loop_1155:
	movrlz	%i5,	0x0C4,	%i2
loop_1156:
	fmovsgu	%icc,	%f14,	%f7
loop_1157:
	call	loop_1159
loop_1158:
	orn	%o3,	%i7,	%i0
	fmovsleu	%icc,	%f19,	%f18
	popc	%l4,	%i1
loop_1159:
	edge8ln	%o4,	%l5,	%o5
	call	loop_1160
	movneg	%xcc,	%o1,	%g6
	call	loop_1161
	fnot2s	%f21,	%f14
loop_1160:
	fandnot1s	%f14,	%f4,	%f8
	brgez,pt	%o7,	loop_1162
loop_1161:
	movl	%xcc,	0x57C,	%g2
	add	%l7,	0x5C,	%l6
	wr	%g0,	0x04,	%asi
	casa	[%l6] %asi,	%l6,	%i4
loop_1162:
	call	loop_1163
	call	loop_1164
	movle	%fcc1,	0x29E,	%g3
	sth	%o6,	[%l7 + 0x6C]
loop_1163:
	ta	%icc,	0x4
loop_1164:
	xnorcc	%l0,	%i3,	%l3
	edge8ln	%l2,	%l1,	%o0
	fmovrsne	%o2,	%f14,	%f2
	movge	%fcc3,	%g7,	%g5
	te	%xcc,	0x4
	call	loop_1165
	fmovdo	%fcc3,	%f10,	%f14
	call	loop_1166
	nop
	set	0x08, %g3
	ldd	[%l7 + %g3],	%f26
loop_1165:
	call	loop_1167
	call	loop_1168
loop_1166:
	fmovdue	%fcc3,	%f16,	%f30
	xorcc	%i6,	0x1D9A,	%g4
loop_1167:
	tle	%xcc,	0x4
loop_1168:
	fmovspos	%icc,	%f4,	%f13
	call	loop_1169
	call	loop_1170
	fbug,pn	%fcc2,	loop_1171
	fpack32	%f18,	%f8,	%f0
loop_1169:
	fnegd	%f18,	%f16
loop_1170:
	fmovsge	%xcc,	%f29,	%f1
loop_1171:
	call	loop_1172
	nop
	setx	0xAD1E2F256006957F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0xBD564414,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	fsmuld	%f20,	%f4,	%f8
	fbu,a	%fcc1,	loop_1173
	call	loop_1174
loop_1172:
	fmovscs	%icc,	%f17,	%f14
	fbu	%fcc2,	loop_1175
loop_1173:
	call	loop_1176
loop_1174:
	add	%g1,	0x023F,	%i5
	movo	%fcc3,	0x69D,	%o3
loop_1175:
	call	loop_1177
loop_1176:
	orncc	%i7,	%i0,	%l4
	tne	%xcc,	0x3
	movuge	%fcc0,	%i1,	%i2
loop_1177:
	bvs	%icc,	loop_1178
	nop
	set	0x71, %l0
	ldstub	[%l7 + %l0],	%l5
	siam	0x2
	wr	%g0,	0x18,	%asi
	stwa	%o4,	[%l7 + 0x78] %asi
loop_1178:
	move	%fcc1,	%o1,	%g6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	nop
	setx	0xEA187DDB225BE9A7,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0x38F76D062B417310,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	faddd	%f22,	%f20,	%f20
	fmovdle	%fcc1,	%f22,	%f22
	fmovdu	%fcc3,	%f24,	%f14
	call	loop_1179
	ldd	[%l7 + 0x60],	%f14
	call	loop_1180
	call	loop_1181
loop_1179:
	rdpr	%cansave,	%g2
	movug	%fcc0,	0x468,	%i4
loop_1180:
	fandnot2s	%f20,	%f24,	%f2
loop_1181:
	srl	%g3,	%o6,	%l6
	movug	%fcc1,	%l0,	%i3
	tcs	%xcc,	0x7
	set	0x40, %l2
	stda	%f0,	[%l7 + %l2] 0xc0
	call	loop_1182
	fors	%f12,	%f11,	%f18
	movleu	%xcc,	%l2,	%l1
	fbo,a,pn	%fcc3,	loop_1183
loop_1182:
	call	loop_1184
	std	%f20,	[%l7 + 0x08]
	nop
	set	0x60, %o2
	prefetch	[%l7 + %o2],	 3
loop_1183:
	tpos	%xcc,	0x6
loop_1184:
	fmovdcc	%xcc,	%f28,	%f28
	edge16l	%o0,	%l3,	%g7
	fmuld8sux16	%f8,	%f21,	%f14
	call	loop_1185
	smulcc	%o2,	0x071D,	%i6
	edge8n	%g5,	%g4,	%g1
	nop
	setx	0x0DC3,	%l0,	%i5
	udivx	%o3,	%i5,	%i7
loop_1185:
	nop
	setx	0xCD56F74C9F786135,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0xF841D78D29165797,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	fdivd	%f12,	%f4,	%f24
	fpadd16	%f10,	%f2,	%f12
	fmovscs	%xcc,	%f8,	%f12
	sllx	%l4,	0x16,	%i1
	call	loop_1186
	fmovrsgz	%i0,	%f1,	%f8
	call	loop_1187
	edge8	%l5,	%i2,	%o1
loop_1186:
	nop
	set	0x50, %l1
	stx	%o4,	[%l7 + %l1]
	call	loop_1188
loop_1187:
	sll	%o5,	0x0F,	%g6
	movgu	%xcc,	%o7,	%g2
	edge16n	%g3,	%i4,	%l6
loop_1188:
	and	%o6,	%l0,	%i3
	fnands	%f25,	%f0,	%f22
	srlx	%l2,	0x1A,	%l1
	call	loop_1189
	call	loop_1190
	fmovsleu	%icc,	%f13,	%f11
	call	loop_1191
loop_1189:
	array16	%l3,	%g7,	%o2
loop_1190:
	movlg	%fcc1,	0x6BF,	%i6
	set	0x4C, %g5
	lduwa	[%l7 + %g5] 0x0c,	%g5
loop_1191:
	nop
	wr	%g0,	0x18,	%asi
	stxa	%g4,	[%l7 + 0x58] %asi
	array16	%o0,	%o3,	%g1
	nop
	fitos	%f11,	%f11
	fstox	%f11,	%f22
	call	loop_1192
	call	loop_1193
	and	%i7,	0x1AE7,	%l4
	fmovsneg	%icc,	%f30,	%f29
loop_1192:
	call	loop_1194
loop_1193:
	fmovrdgez	%i5,	%f2,	%f24
	fornot1s	%f8,	%f0,	%f26
	rd	%ccr,	%i0
loop_1194:
	wr	%i1,	0x09AB,	%set_softint
	fmul8x16au	%f20,	%f12,	%f8
	tcc	%icc,	0x5
	brgez,a,pn	%i2,	loop_1195
	nop
	setx	0xAD6F4CF6,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f0
	fsqrts	%f0,	%f25
	fmovdlg	%fcc1,	%f14,	%f10
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
loop_1195:
	call	loop_1196
	movleu	%xcc,	%o1,	%l5
	edge16ln	%o5,	%o4,	%o7
	fpack16	%f14,	%f3
loop_1196:
	movlg	%fcc0,	%g2,	%g6
	fmovsn	%fcc1,	%f10,	%f22
	fzero	%f12
	nop
	setx	0xE7545120,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f5
	setx	0x3B3A7937,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f3
	fsubs	%f3,	%f5,	%f18
	call	loop_1197
	fsrc1	%f24,	%f10
	fmovsue	%fcc0,	%f20,	%f31
	fmovrsne	%i4,	%f3,	%f0
loop_1197:
	nop
	set	0x08, %g4
	swap	[%l7 + %g4],	%g3
	fmovsa	%fcc1,	%f9,	%f19
	tle	%xcc,	0x2
	bvs,a,pt	%xcc,	loop_1198
	call	loop_1199
	call	loop_1200
	call	loop_1201
loop_1198:
	fandnot1s	%f6,	%f18,	%f22
loop_1199:
	brnz	%o6,	loop_1202
loop_1200:
	call	loop_1203
loop_1201:
	movrlez	%l6,	%i3,	%l0
	movg	%icc,	%l2,	%l1
loop_1202:
	addcc	%g7,	%o2,	%l3
loop_1203:
	call	loop_1204
	call	loop_1205
	ba	%icc,	loop_1206
	call	loop_1207
loop_1204:
	call	loop_1208
loop_1205:
	fcmpgt16	%f10,	%f10,	%g5
loop_1206:
	subccc	%g4,	0x1005,	%i6
loop_1207:
	move	%xcc,	0x157,	%o3
loop_1208:
	edge32l	%g1,	%i7,	%o0
	nop
	setx	loop_1209,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x004100001401,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	call	loop_1210
	bcc,a	%icc,	loop_1211
	fnot1s	%f23,	%f8
loop_1209:
	movre	%l4,	0x01A,	%i5
loop_1210:
	and	%i0,	0x11F3,	%i2
loop_1211:
	call	loop_1212
	te	%icc,	0x5
	wrpr	%i1,	0x0024,	%cwp
	call	loop_1213
loop_1212:
	mulscc	%l5,	%o5,	%o1
	call	loop_1214
	fxors	%f14,	%f19,	%f8
loop_1213:
	fmovde	%xcc,	%f0,	%f2
	call	loop_1215
loop_1214:
	srlx	%o4,	0x1E,	%o7
	fmovsuge	%fcc3,	%f21,	%f3
	tsubcctv	%g6,	%g2,	%g3
loop_1215:
	brz,a,pn	%i4,	loop_1216
	fsrc1s	%f15,	%f20
	movneg	%xcc,	%o6,	%i3
	fornot1s	%f3,	%f16,	%f14
loop_1216:
	fbl,a	%fcc2,	loop_1217
	tne	%icc,	0x4
	fmovduge	%fcc1,	%f28,	%f24
	call	loop_1218
loop_1217:
	fmovdle	%icc,	%f2,	%f4
	wr	%g0,	0x11,	%asi
	ldswa	[%l7 + 0x14] %asi,	%l0
loop_1218:
	rd	%tick_cmpr,	%l6
	call	loop_1219
	fmovsu	%fcc1,	%f6,	%f9
	fmovsu	%fcc0,	%f0,	%f2
	movue	%fcc0,	%l1,	%l2
loop_1219:
	fbul,a	%fcc3,	loop_1220
	fcmple32	%f2,	%f8,	%o2
	call	loop_1221
	tpos	%xcc,	0x7
loop_1220:
	fone	%f14
	ta	%xcc,	0x5
loop_1221:
	bgu,pn	%icc,	loop_1222
	fmovsvs	%icc,	%f12,	%f4
	fpmerge	%f10,	%f4,	%f2
	call	loop_1223
loop_1222:
	movrlez	%l3,	%g5,	%g7
	srl	%g4,	0x16,	%i6
	edge16l	%o3,	%i7,	%o0
loop_1223:
	array8	%l4,	%g1,	%i0
	call	loop_1224
	fexpand	%f8,	%f18
	rdhpr	%htba,	%i2
	fbul,a	%fcc1,	loop_1225
loop_1224:
	movrgz	%i5,	0x0F1,	%l5
	call	loop_1226
	addccc	%o5,	%i1,	%o4
loop_1225:
	rdpr	%cleanwin,	%o1
	call	loop_1227
loop_1226:
	call	loop_1228
	xorcc	%o7,	0x053B,	%g6
	call	loop_1229
loop_1227:
	call	loop_1230
loop_1228:
	call	loop_1231
	fandnot2	%f6,	%f22,	%f28
loop_1229:
	addcc	%g3,	%g2,	%o6
loop_1230:
	fnot1s	%f27,	%f27
loop_1231:
	call	loop_1232
	fornot1s	%f12,	%f18,	%f2
	fandnot1s	%f22,	%f18,	%f8
	fmovdleu	%icc,	%f4,	%f6
loop_1232:
	st	%f24,	[%l7 + 0x7C]
	fcmped	%fcc0,	%f14,	%f24
	movre	%i3,	0x0C5,	%i4
	fmovdug	%fcc0,	%f4,	%f24
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	smulcc	%l6,	%l0,	%l2
	flushw
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 7:
!
!	Type l   	: 25
!	Type a   	: 23
!	Type x   	: 10
!	Type cti   	: 145
!	Type f   	: 139
!	Type i   	: 158
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


	EXIT_GOOD	/* test finish  */

/************************************************************************
   Test case data start
 ************************************************************************/
.data
user_data_start:
scratch_area:
.word 0x21E4DC54
.word 0xB81141B3
.word 0x0426817B
.word 0x7C31C406
.word 0x89078033
.word 0xAA5604EE
.word 0xDF49DD2B
.word 0xDAF7251A
.word 0xB7E35E5D
.word 0xBE8C6B10
.word 0x3001327C
.word 0x1FAE4C62
.word 0x310A26B4
.word 0x8BFCE46C
.word 0x9D533575
.word 0x43F890F5
.word 0xAF833171
.word 0x904518B5
.word 0x96C51EFF
.word 0x65A9DC3F
.word 0xBF43F23F
.word 0x73A68EDD
.word 0x1955FEF4
.word 0x40A295CF
.word 0x274A59E7
.word 0x76964300
.word 0x980268C6
.word 0xAD28F821
.word 0x146CBB50
.word 0xCC908E5C
.word 0xD8CDB87C
.word 0xE1517611
.word 0xCF4A54FB
.word 0xEF721804
.word 0xBB4C4CB1
.word 0x4BDD168E
.word 0xDBE01DE6
.word 0x0EAC3671
.word 0xD27F5322
.word 0x20021ACD
.word 0x23E1BD9D
.word 0x8CB84AC0
.word 0x4B4F3FA1
.word 0xCA0F5FA0
.word 0xAF1E1A09
.word 0x15AABA17
.word 0xAC45A1B5
.word 0x03D7EBB1
.word 0x1C482C2F
.word 0xB9B1C301
.word 0xD32E1381
.word 0xAA60724C
.word 0xB1A9F7DC
.word 0xC7F37D4A
.word 0x13CF87C2
.word 0xA3C5609A
.word 0x5DA8C89E
.word 0x004ACD12
.word 0x38C1C0C9
.word 0x79D3B32E
.word 0x3C780A1F
.word 0x563462C2
.word 0x3E3085DD
.word 0xFB3F67E9
.end
