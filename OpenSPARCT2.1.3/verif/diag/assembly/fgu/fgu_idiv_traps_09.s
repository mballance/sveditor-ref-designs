/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: fgu_idiv_traps_09.s
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
.ident "FOCUSCASE: focus.pm,v 1.1 2003/04/23 17:53:39 somePerson Exp somePerson $ spc_basic_isa3.pl FOCUS_SEED=1325872"
.ident "Thu Dec 11 11:48:18 CST 2003"
.ident "Using Instruction Hash for Focus :$Id: fgu_idiv_traps_09.s,v 1.4 2007/07/27 21:45:31 drp Exp $"
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
	set	0x1,	%g1
	set	0x2,	%g2
	set	0xE,	%g3
	set	0x1,	%g4
	set	0x1,	%g5
	set	0xE,	%g6
	set	0x4,	%g7
	!# Input registers
	set	-0x1,	%i0
	set	-0x9,	%i1
	set	-0xE,	%i2
	set	-0xB,	%i3
	set	-0xA,	%i4
	set	-0x7,	%i5
	set	-0x9,	%i6
	set	-0x6,	%i7
	!# Local registers
	set	0x42D1F425,	%l0
	set	0x49B270AC,	%l1
	set	0x4D8840CB,	%l2
	set	0x2371AE07,	%l3
	set	0x5C1AB42B,	%l4
	set	0x2C0EB0A1,	%l5
	set	0x3E4751F8,	%l6
	!# Output registers
	set	-0x05DE,	%o0
	set	-0x0080,	%o1
	set	0x1B10,	%o2
	set	0x098F,	%o3
	set	0x02A2,	%o4
	set	0x0215,	%o5
	set	0x1ED8,	%o6
	set	0x0FA7,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x91C5092990AEF329)
	INIT_TH_FP_REG(%l7,%f2,0x402511393ED0807F)
	INIT_TH_FP_REG(%l7,%f4,0xF92E82099F2DD38A)
	INIT_TH_FP_REG(%l7,%f6,0xC63548B4FC696224)
	INIT_TH_FP_REG(%l7,%f8,0xF8131235A1EC7C86)
	INIT_TH_FP_REG(%l7,%f10,0x078A8E4300E905D4)
	INIT_TH_FP_REG(%l7,%f12,0xDD6D73B68A08BA8F)
	INIT_TH_FP_REG(%l7,%f14,0xD106A081C3DA7B58)
	INIT_TH_FP_REG(%l7,%f16,0x7A8F5A4BA163A19E)
	INIT_TH_FP_REG(%l7,%f18,0x7434B68B53BD3BD8)
	INIT_TH_FP_REG(%l7,%f20,0x6BC9B1E07EDD9AFB)
	INIT_TH_FP_REG(%l7,%f22,0x8DCF0C6A30229D94)
	INIT_TH_FP_REG(%l7,%f24,0x25982157D7AD1F71)
	INIT_TH_FP_REG(%l7,%f26,0x8D7422E16C30147A)
	INIT_TH_FP_REG(%l7,%f28,0xE1680FB547BA28F0)
	INIT_TH_FP_REG(%l7,%f30,0x44FCCC12CECA593A)

	!# Execute Main Diag ..

	fmovrslz	%l5,	%f26,	%f0
	fmovrde	%o7,	%f8,	%f4
	call	loop_1
	tsubcctv	%l0,	%i7,	%i1
	fmovdo	%fcc0,	%f4,	%f16
	fmovrdgz	%i2,	%f12,	%f8
loop_1:
	xorcc	%o6,	%l1,	%i3
	fmovrdgz	%o4,	%f14,	%f4
	sethi	0x0797,	%i0
	ta	%icc,	0x0
	nop
	setx	0xDE407593C6174680,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0xF1506F61,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	fsmuld	%f22,	%f4,	%f8
	movpos	%xcc,	0x10A,	%l6
	call	loop_2
	fpack32	%f2,	%f28,	%f22
	fmovspos	%xcc,	%f2,	%f5
	tcs	%xcc,	0x6
loop_2:
	fmul8ulx16	%f0,	%f4,	%f6
	call	loop_3
	call	loop_4
	call	loop_5
	fmovdo	%fcc0,	%f18,	%f12
loop_3:
	addcc	%o0,	0x1E5A,	%i6
loop_4:
	fmovsul	%fcc2,	%f4,	%f14
loop_5:
	fmovdg	%xcc,	%f12,	%f12
	array16	%l3,	%g1,	%g3
	call	loop_6
	fxnor	%f2,	%f10,	%f16
	call	loop_7
	fmovdug	%fcc3,	%f26,	%f26
loop_6:
	brlez	%o5,	loop_8
	fmovrde	%o3,	%f10,	%f4
loop_7:
	movul	%fcc1,	%o1,	%o2
	ta	%xcc,	0x4
loop_8:
	fmul8sux16	%f6,	%f28,	%f28
	fmovdneg	%icc,	%f4,	%f2
	call	loop_9
	call	loop_10
	fpsub32	%f28,	%f22,	%f22
	call	loop_11
loop_9:
	call	loop_12
loop_10:
	fpsub16s	%f3,	%f0,	%f6
	call	loop_13
loop_11:
	nop
	setx	0x4EC376E6,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f14
	fsqrts	%f14,	%f7
loop_12:
	fcmpgt32	%f26,	%f0,	%g6
	movgu	%xcc,	0x0CD,	%i5
loop_13:
	fcmpeq32	%f28,	%f6,	%g5
	fxor	%f26,	%f10,	%f12
	movuge	%fcc3,	0x263,	%g2
	call	loop_14
	fbe	%fcc2,	loop_15
	nop
	set	0x26, %o0
	ldsh	[%l7 + %o0],	%l4
	swap	[%l7 + 0x2C],	%g4
loop_14:
	tle	%xcc,	0x0
loop_15:
	call	loop_16
	fmovsue	%fcc0,	%f25,	%f0
	fpmerge	%f25,	%f28,	%f14
	call	loop_17
loop_16:
	prefetch	[%l7 + 0x24],	 4
	nop
	setx	0x2E2CF419,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f21
	setx	0xB4AFBB0E,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f17
	fdivs	%f17,	%f21,	%f3
	bmask	%i4,	%g7,	%l5
loop_17:
	movne	%xcc,	%l2,	%l0
	edge32n	%o7,	%i7,	%i2
	ldsb	[%l7 + 0x13],	%o6
	movue	%fcc3,	%i1,	%i3
	movrne	%o4,	0x291,	%l1
	ldub	[%l7 + 0x2C],	%l6
	rdhpr	%hpstate,	%o0
	edge8l	%i0,	%i6,	%l3
	fmovsgu	%xcc,	%f20,	%f1
	movul	%fcc3,	%g1,	%g3
	movle	%fcc1,	%o5,	%o1
	tvc	%xcc,	0x7
	call	loop_18
	call	loop_19
	udivx	%o2,	%g6,	%o3
	addccc	%i5,	0x153A,	%g5
loop_18:
	nop
	fitos	%f14,	%f23
	fstox	%f23,	%f18
	fxtos	%f18,	%f22
loop_19:
	call	loop_20
	fmovscc	%xcc,	%f6,	%f12
	fmovrsgz	%l4,	%f10,	%f25
	call	loop_21
loop_20:
	alignaddr	%g2,	%i4,	%g7
	umul	%l5,	0x015F,	%l2
	fmovsneg	%icc,	%f19,	%f18
loop_21:
	nop
	setx	0x02C0AA290A8B97DC,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	fsqrtd	%f12,	%f16
	wr	%g4,	%o7,	%pic
	rdpr	%gl,	%i7
	fpsub16s	%f7,	%f26,	%f20
	bneg,a	%icc,	loop_22
	ld	[%l7 + 0x34],	%f25
	call	loop_23
	movgu	%icc,	0x016,	%l0
loop_22:
	call	loop_24
	wrpr 	%g0, 	0x0, 	%gl
loop_23:
	stx	%fsr,	[%l7 + 0x78]
	movge	%fcc1,	0x1A4,	%i1
loop_24:
	fmovscs	%xcc,	%f16,	%f10
	call	loop_25
	rdhpr	%hintp,	%i3
	fmovdo	%fcc0,	%f26,	%f24
	fmuld8ulx16	%f1,	%f6,	%f28
loop_25:
	fmovsneg	%icc,	%f10,	%f16
	fmovsu	%fcc2,	%f9,	%f11
	call	loop_26
	call	loop_27
	std	%f24,	[%l7 + 0x70]
	fmovd	%f24,	%f2
loop_26:
	andcc	%l1,	0x19FE,	%o4
loop_27:
	call	loop_28
	fmovdu	%fcc2,	%f16,	%f10
	fcmpne32	%f28,	%f30,	%o0
	fand	%f26,	%f14,	%f20
loop_28:
	sra	%l6,	%i6,	%i0
	popc	%g1,	%g3
	movo	%fcc0,	%o5,	%l3
	fmovdn	%fcc0,	%f16,	%f24
	fcmpgt16	%f6,	%f30,	%o1
	srax	%g6,	0x0C,	%o2
	wr	%g0,	0xda,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	add	%l7,	0x08,	%l6
	wr	%g0,	0x11,	%asi
	casa	[%l6] %asi,	%o3,	%i5
	fmovsue	%fcc1,	%f28,	%f24
	srl	%l4,	0x00,	%g2
	faligndata	%f14,	%f18,	%f12
	call	loop_29
	brlez,a	%g5,	loop_30
	fcmps	%fcc2,	%f21,	%f3
	fmovsug	%fcc1,	%f28,	%f1
loop_29:
	fnand	%f2,	%f16,	%f18
loop_30:
	brgez,a	%g7,	loop_31
	call	loop_32
	be,pn	%xcc,	loop_33
	umulcc	%i4,	0x16D2,	%l2
loop_31:
	fxors	%f18,	%f8,	%f0
loop_32:
	fbuge,a	%fcc2,	loop_34
loop_33:
	mulx	%l5,	%o7,	%i7
	addc	%l0,	0x1EAC,	%i2
	fzeros	%f2
loop_34:
	edge16	%o6,	%g4,	%i1
	subccc	%l1,	0x176C,	%o4
	movule	%fcc1,	%o0,	%l6
	rdhpr	%htba,	%i6
	taddcctv	%i3,	%i0,	%g3
	fnand	%f14,	%f0,	%f8
	edge8	%g1,	%l3,	%o5
	nop
	setx	0x14C77BBC47B9175A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0x958A7FDDE12BE8C8,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	fmuld	%f24,	%f28,	%f4
	call	loop_35
	rd	%sys_tick_cmpr,	%o1
	move	%xcc,	0x24E,	%o2
	fmul8x16al	%f7,	%f24,	%f0
loop_35:
	fcmpeq32	%f14,	%f20,	%o3
	call	loop_36
	bne,a	%xcc,	loop_37
	srl	%i5,	%l4,	%g6
	movcs	%xcc,	0x541,	%g5
loop_36:
	nop
	setx	loop_38,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x001100001406,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_37:
	call	loop_39
	tneg	%xcc,	0x0
	rd	%sys_tick_cmpr,	%g2
loop_38:
	call	loop_40
loop_39:
	call	loop_41
	fxors	%f3,	%f7,	%f1
	call	loop_42
loop_40:
	mulx	%g7,	%i4,	%l2
loop_41:
	call	loop_43
	fcmpne16	%f24,	%f16,	%o7
loop_42:
	call	loop_44
	fpack16	%f16,	%f10
loop_43:
	call	loop_45
	fmovsu	%fcc2,	%f7,	%f25
loop_44:
	nop
	setx	0x080BC5ED,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f14
	fsqrts	%f14,	%f27
	wr	%g0,	0x0c,	%asi
	ldxa	[%l7 + 0x68] %asi,	%i7
loop_45:
	fzeros	%f16
	fbe,pt	%fcc3,	loop_46
	movcs	%icc,	%l5,	%i2
	fbl,pt	%fcc1,	loop_47
	sdivcc	%o6,	%l0,	%g4
loop_46:
	ldd	[%l7 + 0x18],	%f8
	movleu	%xcc,	0x28D,	%l1
loop_47:
	call	loop_48
	fandnot2	%f4,	%f24,	%f28
	call	loop_49
	sdiv	%o4,	%i1,	%l6
loop_48:
	call	loop_50
	call	loop_51
loop_49:
	nop
	fitod	%f4,	%f6
	fdtox	%f6,	%f0
	fxtod	%f0,	%f4
	set	0x60, %l3
	ldda	[%l7 + %l3] 0x80,	%i6
loop_50:
	call	loop_52
loop_51:
	bleu,pt	%icc,	loop_53
	fcmpeq32	%f6,	%f12,	%i3
	bvs,a,pt	%icc,	loop_54
loop_52:
	wr	%o0,	%g3,	%pic
loop_53:
	nop
	setx	0xB288F578,	%l0,	%l6
	st	%l6,	[%l7 + 0x38]
	ld	[%l7 + 0x38],	%fsr
	or	%i0,	%g1,	%l3
loop_54:
	call	loop_55
	edge32ln	%o1,	%o5,	%o3
	call	loop_56
	rd	%pc,	%o2
loop_55:
	fmovsue	%fcc2,	%f1,	%f19
	tsubcctv	%i5,	0x15B6,	%g6
loop_56:
	tn	%xcc,	0x5
	tsubcctv	%g5,	0x14BF,	%l4
	call	loop_57
	fbo,pt	%fcc0,	loop_58
	brz,pn	%g7,	loop_59
	edge32n	%g2,	%i4,	%l2
loop_57:
	call	loop_60
loop_58:
	srlx	%i7,	%l5,	%i2
loop_59:
	call	loop_61
	call	loop_62
loop_60:
	nop
	set	0x38, %l1
	stx	%o6,	[%l7 + %l1]
	nop
	setx	0x4EA1750A,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f1
	setx	0xEF33F995,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f10
	fsubs	%f10,	%f1,	%f22
loop_61:
	call	loop_63
loop_62:
	bmask	%o7,	%g4,	%l1
	rdhpr	%htba,	%o4
	fbu	%fcc0,	loop_64
loop_63:
	tne	%icc,	0x7
	fmovrde	%i1,	%f22,	%f16
	move	%xcc,	%l0,	%i6
loop_64:
	fmovrse	%i3,	%f30,	%f18
	fmovdlg	%fcc3,	%f4,	%f14
	call	loop_65
	or	%o0,	%g3,	%l6
	fcmpne16	%f26,	%f24,	%g1
	call	loop_66
loop_65:
	fones	%f7
	fors	%f5,	%f25,	%f17
	call	loop_67
loop_66:
	call	loop_68
	fpadd16	%f6,	%f10,	%f14
	fpsub16s	%f12,	%f0,	%f16
loop_67:
	fmovsvc	%xcc,	%f25,	%f28
loop_68:
	fmovrdlz	%l3,	%f26,	%f14
	call	loop_69
	rd	%ccr,	%o1
	fnegs	%f11,	%f30
	alignaddr	%o5,	%o3,	%o2
loop_69:
	call	loop_70
	nop
	fitod	%f24,	%f16
	movge	%icc,	%i5,	%i0
	sdiv	%g6,	%l4,	%g7
loop_70:
	fmovrsgez	%g5,	%f31,	%f30
	xorcc	%i4,	0x0C3C,	%g2
	call	loop_71
	fmovdcs	%icc,	%f30,	%f4
	sethi	0x1542,	%l2
	call	loop_72
loop_71:
	rd	%tick_cmpr,	%i7
	call	loop_73
	fmovdu	%fcc1,	%f20,	%f18
loop_72:
	fbne	%fcc2,	loop_74
	call	loop_75
loop_73:
	fmovsge	%fcc0,	%f17,	%f7
	call	loop_76
loop_74:
	call	loop_77
loop_75:
	brlez	%i2,	loop_78
	edge16l	%o6,	%l5,	%o7
loop_76:
	fpsub16s	%f12,	%f28,	%f0
loop_77:
	smulcc	%l1,	%o4,	%g4
loop_78:
	call	loop_79
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	fsrc1s	%f30,	%f29
	call	loop_80
loop_79:
	taddcctv	%i1,	0x1D20,	%l0
	fmovso	%fcc1,	%f5,	%f18
	popc	0x0710,	%i3
loop_80:
	call	loop_81
	call	loop_82
	sir	0x1087
	fnot1s	%f22,	%f26
loop_81:
	fsrc2s	%f18,	%f13
loop_82:
	edge8n	%i6,	%o0,	%l6
	bn	%xcc,	loop_83
	call	loop_84
	wr	%g1,	%l3,	%clear_softint
	set	0x40, %g2
	stda	%f16,	[%l7 + %g2] 0xf8
	membar	#Sync
loop_83:
	pdist	%f8,	%f16,	%f14
loop_84:
	fmovspos	%icc,	%f8,	%f26
	smul	%o1,	0x0B7B,	%g3
	fpsub16	%f6,	%f10,	%f26
	subccc	%o5,	%o3,	%i5
	call	loop_85
	call	loop_86
	call	loop_87
	movcs	%icc,	%o2,	%i0
loop_85:
	call	loop_88
loop_86:
	edge8l	%g6,	%l4,	%g5
loop_87:
	call	loop_89
	call	loop_90
loop_88:
	call	loop_91
	call	loop_92
loop_89:
	call	loop_93
loop_90:
	call	loop_94
loop_91:
	fmovdlg	%fcc3,	%f12,	%f8
loop_92:
	tvc	%xcc,	0x4
loop_93:
	edge32l	%i4,	%g2,	%g7
loop_94:
	call	loop_95
	fpsub16s	%f25,	%f4,	%f10
	tleu	%icc,	0x3
	wr	%g0,	0x80,	%asi
	swapa	[%l7 + 0x1C] %asi,	%l2
loop_95:
	call	loop_96
	call	loop_97
	fmovsle	%fcc0,	%f4,	%f4
	stbar
loop_96:
	srlx	%i2,	%i7,	%l5
loop_97:
	fmovrdgez	%o7,	%f30,	%f20
	fmovrdgez	%l1,	%f28,	%f12
	call	loop_98
	fornot2	%f2,	%f8,	%f6
	orncc	%o4,	0x1C30,	%o6
	wr	%g0,	0xea,	%asi
	stha	%g4,	[%l7 + 0x6E] %asi
	membar	#Sync
loop_98:
	fcmple16	%f4,	%f30,	%l0
	call	loop_99
	nop
	fitod	%f12,	%f8
	fdtoi	%f8,	%f4
	call	loop_100
	alignaddrl	%i3,	%i1,	%o0
loop_99:
	nop
	set	0x24, %o7
	lduwa	[%l7 + %o7] 0x11,	%l6
loop_100:
	alignaddr	%i6,	%l3,	%g1
	brlz,pt	%o1,	loop_101
	edge32ln	%o5,	%o3,	%g3
	nop
	setx loop_102, %l0, %l1
	jmpl %l1, %i5
	call	loop_103
loop_101:
	std	%i0,	[%l7 + 0x38]
	tn	%icc,	0x4
loop_102:
	alignaddrl	%g6,	%o2,	%g5
loop_103:
	edge8ln	%l4,	%g2,	%g7
	fand	%f20,	%f26,	%f22
	fbge,a,pt	%fcc3,	loop_104
	call	loop_105
	movule	%fcc3,	0x795,	%i4
	array8	%l2,	%i2,	%l5
loop_104:
	movug	%fcc2,	0x43A,	%o7
loop_105:
	nop
	fitos	%f13,	%f26
	wr	%i7,	0x1CC3,	%clear_softint
	fmul8sux16	%f8,	%f22,	%f2
	fmovsule	%fcc0,	%f5,	%f8
	movl	%fcc1,	0x155,	%o4
	movleu	%icc,	0x20D,	%o6
	call	loop_106
	call	loop_107
	call	loop_108
	srlx	%g4,	%l1,	%l0
loop_106:
	fmovd	%f20,	%f30
loop_107:
	call	loop_109
loop_108:
	fmovsuge	%fcc2,	%f0,	%f21
	fmovsl	%icc,	%f30,	%f18
	fmovdne	%fcc1,	%f8,	%f12
loop_109:
	fmovse	%fcc0,	%f3,	%f17
	fmovdpos	%xcc,	%f26,	%f20
	call	loop_110
	fnot1s	%f21,	%f5
	wr	%g0,	0x2c,	%asi
	ldda	[%l7 + 0x50] %asi,	%i0
loop_110:
	fxnors	%f8,	%f14,	%f22
	fmovduge	%fcc1,	%f20,	%f2
	movue	%fcc2,	0x549,	%i3
	brlez,a	%o0,	loop_111
	fxors	%f28,	%f21,	%f4
	fxors	%f17,	%f14,	%f10
	fpadd32s	%f0,	%f5,	%f0
loop_111:
	call	loop_112
	edge16	%l6,	%l3,	%g1
	call	loop_113
	orcc	%o1,	0x1B82,	%o5
loop_112:
	movpos	%xcc,	%i6,	%g3
	nop
	setx	0xA256F8A00DAFE2F1,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	fsqrtd	%f8,	%f18
loop_113:
	movug	%fcc3,	0x5A4,	%o3
	call	loop_114
	array32	%i0,	%i5,	%g6
	fbul,pn	%fcc3,	loop_115
	call	loop_116
loop_114:
	fmovrsgez	%g5,	%f15,	%f31
	rd	%fprs,	%l4
loop_115:
	tne	%icc,	0x6
loop_116:
	brgez,a	%g2,	loop_117
	movu	%fcc1,	0x0AC,	%o2
	call	loop_118
	movul	%fcc1,	%i4,	%g7
loop_117:
	fpadd32	%f4,	%f22,	%f0
	movlg	%fcc1,	0x534,	%l2
loop_118:
	call	loop_119
	fpack32	%f14,	%f20,	%f26
	wrpr	%l5,	%o7,	%tick
	rd	%fprs,	%i2
loop_119:
	tvs	%xcc,	0x2
	fsrc2s	%f1,	%f30
	bneg,a	%icc,	loop_120
	fbu	%fcc1,	loop_121
	move	%fcc1,	0x403,	%o4
	call	loop_122
loop_120:
	orncc	%o6,	0x0EB2,	%i7
loop_121:
	call	loop_123
	wrpr	%l1,	%g4,	%cwp
loop_122:
	movl	%fcc3,	%l0,	%i1
	call	loop_124
loop_123:
	call	loop_125
	tvc	%icc,	0x4
	sra	%i3,	%l6,	%l3
loop_124:
	wr 	%g0, 	0x4, 	%fprs
loop_125:
	call	loop_126
	nop
	fitod	%f2,	%f14
	fdtox	%f14,	%f28
	fxtod	%f28,	%f4
	fcmpeq16	%f14,	%f26,	%o1
	nop
	setx loop_127, %l0, %l1
	jmpl %l1, %o5
loop_126:
	call	loop_128
	udivcc	%i6,	%g3,	%o3
	fmovdu	%fcc1,	%f2,	%f20
loop_127:
	nop
	setx	0xD2897B892D48641E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	fsqrtd	%f4,	%f10
loop_128:
	fmovsn	%fcc0,	%f0,	%f31
	edge8ln	%i0,	%i5,	%g6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	call	loop_129
	ld	[%l7 + 0x40],	%f1
	edge8ln	%g2,	%g5,	%o2
	fpsub16s	%f22,	%f1,	%f16
loop_129:
	fmovrsne	%i4,	%f22,	%f7
	taddcctv	%g7,	%l2,	%o7
	call	loop_130
	call	loop_131
	fsrc1s	%f3,	%f11
	fmovse	%fcc3,	%f1,	%f23
loop_130:
	edge16ln	%l5,	%i2,	%o4
loop_131:
	call	loop_132
	taddcctv	%o6,	0x0708,	%i7
	movpos	%icc,	0x392,	%g4
	movue	%fcc2,	0x343,	%l0
loop_132:
	movcc	%xcc,	0x2B7,	%i1
	fmovdge	%fcc2,	%f8,	%f2
	rd	%sys_tick_cmpr,	%l1
	call	loop_133
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	xorcc	%i3,	0x1F45,	%l6
	fbge,a	%fcc2,	loop_134
loop_133:
	call	loop_135
	stb	%o0,	[%l7 + 0x39]
	movne	%xcc,	0x542,	%o1
loop_134:
	xnor	%o5,	0x07E2,	%i6
loop_135:
	nop
	set	0x34, %o4
	ldswa	[%l7 + %o4] 0x81,	%l3
	wr	%g0,	0xdb,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	call	loop_136
	nop
	setx	0xC8D76EF974F90FF5,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0xDB4F0D2D96F80AD4,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	fsubd	%f24,	%f22,	%f12
	ld	[%l7 + 0x58],	%f27
	edge32ln	%o3,	%g3,	%i0
loop_136:
	fsrc1	%f2,	%f0
	fones	%f5
	call	loop_137
	edge32l	%i5,	%g6,	%g1
	rdpr	%tba,	%g2
	call	loop_138
loop_137:
	fabss	%f31,	%f17
	wr	%g0,	0x88,	%asi
	lduwa	[%l7 + 0x10] %asi,	%l4
loop_138:
	movvc	%xcc,	0x402,	%g5
	fabsd	%f28,	%f14
	rdhpr	%hpstate,	%o2
	call	loop_139
	siam	0x7
	tvs	%xcc,	0x7
	nop
	setx	0x8F5F1264CA13A319,	%l0,	%l6
	stx	%l6,	[%l7 + 0x68]
	ldx	[%l7 + 0x68],	%fsr
loop_139:
	sdivcc	%g7,	%l2,	%o7
	fmovsa	%xcc,	%f25,	%f6
	fmovsvs	%icc,	%f1,	%f0
	call	loop_140
	udivx	%i4,	0x00,	%l5
	umulcc	%o4,	%o6,	%i2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x24D, 	%hsys_tick_cmpr
loop_140:
	call	loop_141
	andn	%l0,	0x0449,	%l1
	fmovsvs	%icc,	%f7,	%f4
	fmovsgu	%icc,	%f17,	%f23
loop_141:
	mova	%icc,	%i1,	%i3
	fpack16	%f20,	%f28
	movrne	%o0,	0x063,	%l6
	fmovdo	%fcc2,	%f6,	%f26
	popc	%o5,	%i6
	edge16n	%o1,	%o3,	%l3
	rdpr	%cansave,	%g3
	call	loop_142
	fmovrse	%i0,	%f30,	%f2
	wr	%g0,	0x23,	%asi
	stda	%i4,	[%l7 + 0x10] %asi
	membar	#Sync
loop_142:
	nop
	add	%l7,	0x6C,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%g1
	casa	[%l6] %asi,	%g1,	%g6
	call	loop_143
	movvc	%icc,	0x458,	%g2
	fmovsa	%fcc1,	%f20,	%f17
	call	loop_144
loop_143:
	swap	[%l7 + 0x44],	%g5
	ldd	[%l7 + 0x38],	%f4
	call	loop_145
loop_144:
	edge16	%l4,	%o2,	%g7
	movo	%fcc0,	0x605,	%o7
loop_145:
	nop

	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 0:
!
!	Type l   	: 33
!	Type a   	: 26
!	Type x   	: 14
!	Type cti   	: 145
!	Type f   	: 143
!	Type i   	: 139
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
	set	0xE,	%g1
	set	0x2,	%g2
	set	0xC,	%g3
	set	0x4,	%g4
	set	0x4,	%g5
	set	0x3,	%g6
	set	0x8,	%g7
	!# Input registers
	set	-0xD,	%i0
	set	-0xB,	%i1
	set	-0x6,	%i2
	set	-0x3,	%i3
	set	-0x4,	%i4
	set	-0x9,	%i5
	set	-0xC,	%i6
	set	-0xD,	%i7
	!# Local registers
	set	0x5482B887,	%l0
	set	0x37F97587,	%l1
	set	0x00B80D8F,	%l2
	set	0x4F428CBE,	%l3
	set	0x6D9CF928,	%l4
	set	0x4B210052,	%l5
	set	0x0301E4E0,	%l6
	!# Output registers
	set	-0x0C80,	%o0
	set	0x035F,	%o1
	set	0x0024,	%o2
	set	0x0209,	%o3
	set	-0x10AE,	%o4
	set	-0x1D60,	%o5
	set	-0x099A,	%o6
	set	-0x089B,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x91C5092990AEF329)
	INIT_TH_FP_REG(%l7,%f2,0x402511393ED0807F)
	INIT_TH_FP_REG(%l7,%f4,0xF92E82099F2DD38A)
	INIT_TH_FP_REG(%l7,%f6,0xC63548B4FC696224)
	INIT_TH_FP_REG(%l7,%f8,0xF8131235A1EC7C86)
	INIT_TH_FP_REG(%l7,%f10,0x078A8E4300E905D4)
	INIT_TH_FP_REG(%l7,%f12,0xDD6D73B68A08BA8F)
	INIT_TH_FP_REG(%l7,%f14,0xD106A081C3DA7B58)
	INIT_TH_FP_REG(%l7,%f16,0x7A8F5A4BA163A19E)
	INIT_TH_FP_REG(%l7,%f18,0x7434B68B53BD3BD8)
	INIT_TH_FP_REG(%l7,%f20,0x6BC9B1E07EDD9AFB)
	INIT_TH_FP_REG(%l7,%f22,0x8DCF0C6A30229D94)
	INIT_TH_FP_REG(%l7,%f24,0x25982157D7AD1F71)
	INIT_TH_FP_REG(%l7,%f26,0x8D7422E16C30147A)
	INIT_TH_FP_REG(%l7,%f28,0xE1680FB547BA28F0)
	INIT_TH_FP_REG(%l7,%f30,0x44FCCC12CECA593A)

	!# Execute Main Diag ..

	bleu,pn	%xcc,	loop_146
	array8	%i4,	%l5,	%l2
	call	loop_147
	fmovrdlz	%o6,	%f22,	%f22
loop_146:
	move	%fcc2,	0x704,	%i2
	flushw
loop_147:
	rdhpr	%hintp,	%i7
	fpackfix	%f20,	%f6
	fpadd16s	%f15,	%f4,	%f12
	stx	%g4,	[%l7 + 0x68]
	movue	%fcc1,	0x51A,	%o4
	movn	%fcc1,	0x4C3,	%l1
	nop
	setx	0x0EC0C317,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f22
	setx	0xCCF4FB7B,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f27
	fsubs	%f27,	%f22,	%f26
	fmovde	%fcc2,	%f18,	%f24
	fornot2	%f16,	%f28,	%f4
	bcs,pt	%icc,	loop_148
	tgu	%xcc,	0x4
	call	loop_149
	edge16n	%i1,	%l0,	%o0
loop_148:
	rdhpr	%hintp,	%i3
	fmovsvc	%icc,	%f7,	%f9
loop_149:
	call	loop_150
	fcmpeq32	%f28,	%f20,	%o5
	fandnot1s	%f4,	%f0,	%f30
	subcc	%i6,	0x1D20,	%o1
loop_150:
	tsubcc	%l6,	0x0208,	%l3
	call	loop_151
	brgez,a	%o3,	loop_152
	call	loop_153
	wrpr	%g3,	%i5,	%tick
loop_151:
	flushw
loop_152:
	movre	%i0,	0x3AB,	%g6
loop_153:
	call	loop_154
	orncc	%g1,	0x0CE3,	%g5
	membar	0x05
	fsrc2s	%f12,	%f26
loop_154:
	call	loop_155
	wr	%l4,	%o2,	%set_softint
	add	%g7,	%g2,	%o7
	move	%icc,	%i4,	%l2
loop_155:
	fmovde	%icc,	%f4,	%f20
	sub	%o6,	%l5,	%i7
	fmovduge	%fcc1,	%f8,	%f6
	nop
	setx	0xB8352DFD,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f3
	setx	0xF8A96E5D,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f17
	fmuls	%f17,	%f3,	%f13
	edge32n	%i2,	%o4,	%l1
	fmovsul	%fcc1,	%f26,	%f18
	movrlz	%g4,	0x26D,	%i1
	fxnors	%f13,	%f1,	%f30
	tg	%xcc,	0x2
	alignaddrl	%o0,	%i3,	%l0
	fmovdcc	%xcc,	%f12,	%f26
	addccc	%i6,	0x076C,	%o5
	fmovdug	%fcc3,	%f12,	%f8
	movrlez	%o1,	0x19F,	%l3
	call	loop_156
	call	loop_157
	addccc	%l6,	0x02B5,	%o3
	sdivcc	%g3,	%i0,	%g6
loop_156:
	nop
	setx	0x35EEEAA7DD59ACD5,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0x56D19E0F472C81E8,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	fdivd	%f12,	%f0,	%f24
loop_157:
	fandnot2s	%f31,	%f19,	%f20
	flushw
	movl	%icc,	%i5,	%g1
	fbne,a,pt	%fcc2,	loop_158
	call	loop_159
	movge	%xcc,	0x70B,	%l4
	fxor	%f16,	%f8,	%f30
loop_158:
	fmovsug	%fcc2,	%f4,	%f24
loop_159:
	fabss	%f10,	%f4
	flushw
	movrne	%o2,	%g7,	%g2
	call	loop_160
	fnegs	%f30,	%f15
	tsubcctv	%g5,	0x03F8,	%o7
	fabss	%f3,	%f14
loop_160:
	brlez,a	%i4,	loop_161
	xor	%l2,	0x03AE,	%o6
	fmovsn	%fcc0,	%f22,	%f0
	nop
	fitos	%f10,	%f1
	fstoi	%f1,	%f3
loop_161:
	movgu	%icc,	0x681,	%i7
	or	%l5,	0x023F,	%o4
	call	loop_162
	wr 	%g0, 	0x6, 	%fprs
	rdhpr	%hpstate,	%g4
	call	loop_163
loop_162:
	nop
	set	0x74, %g1
	swap	[%l7 + %g1],	%o0
	nop
	setx	0x1C92CFECD7644531,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0xCDDFBBCBA493FEC6,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	fsubd	%f4,	%f14,	%f22
	fmovdu	%fcc1,	%f22,	%f26
loop_163:
	call	loop_164
	fba	%fcc0,	loop_165
	fmovsu	%fcc1,	%f16,	%f21
	call	loop_166
loop_164:
	call	loop_167
loop_165:
	call	loop_168
	udiv	%i3,	0x00,	%l0
loop_166:
	edge8l	%i1,	%i6,	%o1
loop_167:
	movvc	%icc,	%l3,	%o5
loop_168:
	fmovrdgz	%l6,	%f2,	%f12
	fmovscs	%xcc,	%f21,	%f26
	call	loop_169
	orn	%g3,	%o3,	%g6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x2AF, 	%tick_cmpr
	add	%l7,	0x78,	%l6
	wr	%g0,	0x10,	%asi
	casxa	[%l6] 0x10,	%g1,	%l4
loop_169:
	brlez,a,pn	%o2,	loop_170
	ldsw	[%l7 + 0x5C],	%g7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x0CF, 	%hsys_tick_cmpr
	array8	%g5,	%o7,	%i0
loop_170:
	fcmpeq16	%f16,	%f24,	%l2
	udiv	%o6,	%i4,	%l5
	call	loop_171
	alignaddrl	%i7,	%o4,	%i2
	fnands	%f30,	%f1,	%f24
	nop
	setx	0x08C45CED1D364417,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0x8D9F969E,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	fsmuld	%f4,	%f24,	%f14
loop_171:
	move	%fcc1,	0x492,	%l1
	fornot2s	%f22,	%f5,	%f0
	fmovsug	%fcc1,	%f21,	%f2
	fmovrslz	%g4,	%f25,	%f4
	bn,pn	%icc,	loop_172
	movrgez	%o0,	0x17C,	%i3
	sdiv	%l0,	0x00,	%i6
	call	loop_173
loop_172:
	nop
	fitod	%f8,	%f10
	fdtox	%f10,	%f28
	fxtod	%f28,	%f22
	fmovdvc	%icc,	%f26,	%f10
	movo	%fcc2,	0x38B,	%i1
loop_173:
	movug	%fcc3,	%l3,	%o1
	fandnot1s	%f12,	%f9,	%f30
	call	loop_174
	fmovscc	%icc,	%f21,	%f13
	array32	%o5,	%l6,	%o3
	umul	%g6,	%g3,	%i5
loop_174:
	call	loop_175
	xnor	%l4,	0x16ED,	%g1
	rdhpr	%ver,	%o2
	fornot1	%f10,	%f8,	%f16
loop_175:
	call	loop_176
	fmovd	%f16,	%f6
	fornot2s	%f11,	%f2,	%f1
	faligndata	%f18,	%f2,	%f18
loop_176:
	call	loop_177
	call	loop_178
	fmul8x16au	%f14,	%f21,	%f10
	srax	%g2,	0x1C,	%g5
loop_177:
	alignaddrl	%o7,	%i0,	%l2
loop_178:
	call	loop_179
	movle	%xcc,	0x379,	%g7
	call	loop_180
	call	loop_181
loop_179:
	movre	%i4,	0x00D,	%l5
	fmovrdne	%o6,	%f30,	%f2
loop_180:
	call	loop_182
loop_181:
	fandnot1	%f30,	%f2,	%f28
	wr	%g0,	0x0c,	%asi
	ldstuba	[%l7 + 0x36] %asi,	%i7
loop_182:
	movrlez	%o4,	0x2A6,	%l1
	add	%i2,	%g4,	%o0
	call	loop_183
	tvc	%icc,	0x7
	fmovdu	%fcc0,	%f20,	%f6
	fmovsg	%fcc2,	%f5,	%f8
loop_183:
	fmovdgu	%xcc,	%f0,	%f16
	fmovdue	%fcc2,	%f4,	%f14
	fmovs	%f11,	%f30
	call	loop_184
	fmovsu	%fcc3,	%f5,	%f6
	fmul8ulx16	%f12,	%f6,	%f2
	call	loop_185
loop_184:
	movgu	%xcc,	%i3,	%i6
	edge8l	%i1,	%l0,	%o1
	nop
	fitod	%f8,	%f18
	fdtos	%f18,	%f30
loop_185:
	rdhpr	%htba,	%l3
	call	loop_186
	fcmpd	%fcc2,	%f18,	%f0
	call	loop_187
	fsrc1s	%f13,	%f16
loop_186:
	sra	%o5,	0x06,	%o3
	movlg	%fcc2,	%g6,	%l6
loop_187:
	call	loop_188
	fpsub16	%f18,	%f10,	%f10
	fpsub16s	%f13,	%f8,	%f15
	call	loop_189
loop_188:
	bne,pn	%xcc,	loop_190
	fpadd32s	%f2,	%f7,	%f5
	ldub	[%l7 + 0x39],	%i5
loop_189:
	wr	%g3,	0x1188,	%sys_tick
loop_190:
	nop
	set	0x50, %i5
	ldd	[%l7 + %i5],	%g0
	bcs	%xcc,	loop_191
	sub	%l4,	%g2,	%o2
	nop
	fitos	%f5,	%f23
	fstox	%f23,	%f20
	fxtos	%f20,	%f6
	call	loop_192
loop_191:
	fmovrdne	%g5,	%f30,	%f22
	ble,a	%xcc,	loop_193
	fxor	%f18,	%f28,	%f20
loop_192:
	std	%f26,	[%l7 + 0x58]
	fcmpgt16	%f12,	%f28,	%i0
loop_193:
	rdpr	%tl,	%l2
	array8	%g7,	%i4,	%o7
	call	loop_194
	movo	%fcc3,	%l5,	%i7
	fbuge	%fcc0,	loop_195
	tle	%xcc,	0x2
loop_194:
	fmovdg	%fcc1,	%f8,	%f28
	fnot1s	%f0,	%f11
loop_195:
	subc	%o6,	0x0148,	%o4
	call	loop_196
	call	loop_197
	srax	%i2,	0x1D,	%l1
	fornot2	%f4,	%f4,	%f30
loop_196:
	fmovrdne	%g4,	%f26,	%f4
loop_197:
	wr	%i3,	0x15ED,	%ccr
	fbne,a	%fcc3,	loop_198
	fmovrdlz	%i6,	%f28,	%f30
	fmovso	%fcc1,	%f14,	%f20
	call	loop_199
loop_198:
	call	loop_200
	te	%xcc,	0x5
	call	loop_201
loop_199:
	call	loop_202
loop_200:
	nop
	setx	0x15F8E9DA,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f27
	setx	0x9C6A5B55,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f2
	fadds	%f2,	%f27,	%f2
	bcs,pt	%xcc,	loop_203
loop_201:
	call	loop_204
loop_202:
	movu	%fcc2,	0x7EA,	%o0
	fmovdule	%fcc1,	%f10,	%f2
loop_203:
	fxnor	%f10,	%f16,	%f20
loop_204:
	edge32	%i1,	%o1,	%l0
	set	0x5C, %g7
	lduha	[%l7 + %g7] 0x81,	%l3
	edge32	%o3,	%g6,	%o5
	fmovrdgez	%i5,	%f24,	%f0
	fmovdvc	%xcc,	%f16,	%f16
	tg	%xcc,	0x6
	nop
	setx	0x5F00E94B,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f15
	fsqrts	%f15,	%f19
	array8	%l6,	%g3,	%g1
	movge	%xcc,	0x41B,	%l4
	movg	%icc,	0x127,	%g2
	tgu	%icc,	0x4
	movvc	%icc,	0x717,	%g5
	subc	%i0,	%o2,	%l2
	tn	%xcc,	0x4
	array16	%i4,	%g7,	%l5
	fmovdo	%fcc0,	%f30,	%f26
	rdhpr	%htba,	%o7
	tne	%icc,	0x2
	orncc	%i7,	0x1CED,	%o4
	fcmple16	%f12,	%f8,	%i2
	fmovdn	%icc,	%f2,	%f20
	rdhpr	%hintp,	%o6
	tne	%icc,	0x0
	rd	%sys_tick_cmpr,	%g4
	fmovdge	%xcc,	%f2,	%f24
	call	loop_205
	fmovdvc	%icc,	%f6,	%f12
	nop
	setx	0xCCFC029D0EA70FAD,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0x0B391619D1F4ECF9,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	faddd	%f18,	%f8,	%f16
	set	0x50, %i3
	ldda	[%l7 + %i3] 0x26,	%i2
loop_205:
	movlg	%fcc2,	%l1,	%o0
	fmovdleu	%xcc,	%f22,	%f4
	bcc,a	%icc,	loop_206
	fornot1	%f14,	%f2,	%f8
!!	wr	%g0,	0x40,	%asi
!!	ldxa	[%g0 + 0x160] %asi,	%i1
loop_206:
	nop
	set	0x29, %o5
	ldstuba	[%l7 + %o5] 0x10,	%i6
	movrne	%o1,	0x144,	%l0
	fzeros	%f13
	udivcc	%o3,	0x00,	%g6
	udivcc	%l3,	%i5,	%o5
	fpack16	%f16,	%f20
	movvs	%xcc,	%l6,	%g3
	fmovdleu	%icc,	%f4,	%f12
	fmuld8sux16	%f17,	%f23,	%f4
	call	loop_207
	call	loop_208
	nop
	setx	0xA7984A205910DF66,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0xD284F63892C95E0D,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	fdivd	%f6,	%f6,	%f16
	fmovrdgz	%l4,	%f12,	%f18
loop_207:
	edge16ln	%g1,	%g5,	%i0
loop_208:
	orcc	%o2,	0x0308,	%g2
	fnot1s	%f29,	%f20
	call	loop_209
	fmovdcc	%icc,	%f24,	%f30
	fmuld8sux16	%f22,	%f7,	%f14
	smulcc	%l2,	%i4,	%g7
loop_209:
	fabss	%f1,	%f20
	fpadd32s	%f13,	%f22,	%f25
	fmovda	%xcc,	%f26,	%f22
	umulcc	%o7,	%l5,	%i7
	bne	%icc,	loop_210
	fmovdge	%icc,	%f10,	%f8
	bmask	%o4,	%i2,	%g4
	nop
	fitod	%f6,	%f16
	fdtox	%f16,	%f18
loop_210:
	movn	%xcc,	%i3,	%o6
	fpsub16s	%f27,	%f1,	%f28
	fxnor	%f6,	%f14,	%f6
	popc	%l1,	%i1
	fmovdleu	%xcc,	%f14,	%f28
	call	loop_211
	fornot1s	%f28,	%f26,	%f6
	move	%fcc1,	0x11A,	%i6
	movpos	%icc,	0x06D,	%o1
loop_211:
	movu	%fcc3,	%o0,	%l0
	fmovdpos	%icc,	%f28,	%f6
	membar	0x5D
	fpsub32	%f26,	%f30,	%f0
	fbule	%fcc1,	loop_212
	fexpand	%f14,	%f20
	movle	%fcc0,	%o3,	%g6
	call	loop_213
loop_212:
	brlz,a,pn	%l3,	loop_214
	call	loop_215
	call	loop_216
loop_213:
	rdhpr	%htba,	%i5
loop_214:
	fmovso	%fcc1,	%f18,	%f11
loop_215:
	movcc	%icc,	%l6,	%g3
loop_216:
	fmovrdlz	%o5,	%f16,	%f0
	fcmple16	%f30,	%f8,	%l4
	wr	%g0,	0x0c,	%asi
	lduha	[%l7 + 0x34] %asi,	%g1
	wrpr	%g5,	0x145B,	%tick
	movul	%fcc0,	%i0,	%o2
	fmovsvc	%icc,	%f0,	%f22
	nop
	set	0x60, %l0
	lduh	[%l7 + %l0],	%l2
	smul	%g2,	0x198F,	%i4
	tg	%icc,	0x7
	rd	%tick_cmpr,	%o7
	tsubcctv	%l5,	0x1F8A,	%g7
	call	loop_217
	ble,a	%icc,	loop_218
	sethi	0x0F58,	%o4
	nop
	setx	0x9F4D0DB3,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f4
	setx	0xD1B3BDA6,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f29
	fmuls	%f29,	%f4,	%f10
loop_217:
	nop
	fitod	%f6,	%f20
	fdtox	%f20,	%f24
loop_218:
	fmovso	%fcc2,	%f31,	%f30
	srlx	%i2,	%i7,	%g4
	call	loop_219
	fzeros	%f21
	edge32	%i3,	%l1,	%i1
	rdhpr	%hintp,	%o6
loop_219:
	stbar
	fand	%f10,	%f12,	%f26
	nop
	setx	0xF1E71A18E7D86132,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0xAEECA0DA02D03B41,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	fsubd	%f20,	%f26,	%f10
	fmuld8ulx16	%f10,	%f17,	%f18
	alignaddrl	%o1,	%o0,	%l0
	edge8	%i6,	%o3,	%g6
	siam	0x2
	call	loop_220
	orcc	%l3,	%i5,	%l6
	call	loop_221
	call	loop_222
loop_220:
	fmovscc	%icc,	%f15,	%f19
	call	loop_223
loop_221:
	movlg	%fcc0,	%g3,	%l4
loop_222:
	orncc	%g1,	0x0085,	%o5
	fmovdgu	%xcc,	%f14,	%f14
loop_223:
	nop
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x24] %asi,	%i0
	call	loop_224
	fmovde	%icc,	%f4,	%f4
	fmovdcc	%xcc,	%f18,	%f2
	srlx	%o2,	%g5,	%l2
loop_224:
	fone	%f0
	fmovsug	%fcc0,	%f14,	%f19
	fands	%f4,	%f3,	%f30
	movue	%fcc1,	%i4,	%o7
	fmovsue	%fcc3,	%f24,	%f10
	call	loop_225
	tl	%xcc,	0x6
	call	loop_226
	popc	%l5,	%g7
loop_225:
	movge	%xcc,	0x43D,	%o4
	call	loop_227
loop_226:
	nop
	fitos	%f8,	%f31
	movge	%xcc,	0x206,	%g2
	fbug,pt	%fcc2,	loop_228
loop_227:
	fmovdle	%fcc0,	%f30,	%f24
	wrpr	%i2,	%g4,	%cwp
	nop
	set	0x43, %l4
	ldub	[%l7 + %l4],	%i7
loop_228:
	nop
	setx	loop_229,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x024100001402,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fmovdpos	%icc,	%f0,	%f6
	udiv	%i3,	%i1,	%o6
	fbe,a,pt	%fcc1,	loop_230
loop_229:
	call	loop_231
	umulcc	%o1,	0x04B0,	%o0
	fbe,a,pt	%fcc3,	loop_232
loop_230:
	call	loop_233
loop_231:
	fmovsneg	%xcc,	%f4,	%f2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x0F5, 	%hsys_tick_cmpr
loop_232:
	fcmpne32	%f30,	%f22,	%i6
loop_233:
	fmovde	%icc,	%f20,	%f20
	movrne	%o3,	%l3,	%i5
	fpmerge	%f3,	%f6,	%f24
	move	%icc,	0x76C,	%l6
	tleu	%icc,	0x7
	rdhpr	%hsys_tick_cmpr,	%g3
	fcmpne32	%f6,	%f2,	%l4
	edge8n	%g6,	%g1,	%o5
	fabsd	%f28,	%f12
	tleu	%xcc,	0x3
	call	loop_234
	fpadd16	%f10,	%f0,	%f14
	call	loop_235
	tg	%xcc,	0x1
loop_234:
	movrgz	%i0,	0x2BC,	%o2
	rdpr	%tl,	%g5
loop_235:
	fba,a	%fcc3,	loop_236
	fmovrdgez	%i4,	%f24,	%f0
	movlg	%fcc1,	%o7,	%l5
	movge	%xcc,	0x4E9,	%l2
loop_236:
	movpos	%icc,	%o4,	%g7
	call	loop_237
	rdhpr	%hsys_tick_cmpr,	%i2
	fmovdug	%fcc3,	%f18,	%f16
	fmovsue	%fcc2,	%f28,	%f13
loop_237:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	call	loop_238
	call	loop_239
	taddcctv	%i3,	0x1D9E,	%i1
	movneg	%icc,	%o6,	%o1
loop_238:
	nop
	setx	0x5B7CE1F0,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f14
	setx	0x271AEEAD,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f7
	fdivs	%f7,	%f14,	%f12
loop_239:
	movu	%fcc1,	0x32A,	%o0
	array16	%l0,	%l1,	%i7
	movrlez	%o3,	%l3,	%i5
	sll	%i6,	0x14,	%l6
	fcmpne32	%f0,	%f14,	%g3
	call	loop_240
	fcmps	%fcc3,	%f5,	%f10
	smulcc	%l4,	0x1709,	%g6
	call	loop_241
loop_240:
	edge32	%o5,	%g1,	%o2
	wr	%g0,	0x80,	%asi
	lduba	[%l7 + 0x5E] %asi,	%i0
loop_241:
	call	loop_242
	fmovscc	%icc,	%f23,	%f0
	rd	%sys_tick_cmpr,	%i4
	fbul	%fcc1,	loop_243
loop_242:
	nop
	setx	0xB1DC4EE4,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f15
	setx	0x95340A20,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f25
	fadds	%f25,	%f15,	%f13
	wrpr	%g5,	%l5,	%pil
	fpsub32s	%f4,	%f14,	%f16
loop_243:
	wr	%o7,	0x1C4D,	%pic
	tsubcc	%l2,	%g7,	%o4
	fnors	%f19,	%f1,	%f23
	and	%g2,	0x1BE5,	%g4
	nop
	set	0x48, %l5
	stb	%i2,	[%l7 + %l5]
	edge16	%i1,	%i3,	%o1
	call	loop_244
	call	loop_245
	popc	%o6,	%o0
	sdivcc	%l1,	0x00,	%i7
loop_244:
	movuge	%fcc1,	0x7A4,	%o3
loop_245:
	fmovs	%f27,	%f24
	movuge	%fcc0,	%l3,	%i5
	nop
	setx	0xFFBD7338,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f28
	setx	0x3FC333FD,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f28
	fmuls	%f28,	%f28,	%f9
	bshuffle	%f20,	%f20,	%f2
	call	loop_246
	call	loop_247
	tne	%icc,	0x1
	movrlez	%i6,	%l6,	%g3
loop_246:
	wrpr	%l4,	0x1EC6,	%tick
loop_247:
	fmuld8sux16	%f9,	%f21,	%f18
	wr	%g0,	0x22,	%asi
	stxa	%l0,	[%l7 + 0x30] %asi
	membar	#Sync
	udivcc	%o5,	%g6,	%o2
	call	loop_248
	wr	%i0,	%i4,	%softint
	fbug	%fcc1,	loop_249
	move	%xcc,	0x45B,	%g5
loop_248:
	fmovsl	%fcc2,	%f5,	%f25
	fornot2s	%f10,	%f20,	%f30
loop_249:
	sdivx	%g1,	0x00,	%o7
	movrlez	%l2,	0x3F2,	%g7
	array8	%l5,	%g2,	%g4
	movlg	%fcc3,	%i2,	%o4
	rdhpr	%hsys_tick_cmpr,	%i1
	alignaddrl	%i3,	%o6,	%o1
	edge16l	%o0,	%i7,	%l1
	move	%fcc2,	0x685,	%l3
	call	loop_250
	call	loop_251
	call	loop_252
	add	%i5,	%o3,	%i6
loop_250:
	fnegd	%f14,	%f8
loop_251:
	fmovda	%icc,	%f4,	%f30
loop_252:
	te	%xcc,	0x2
	edge16	%l6,	%g3,	%l0
	fnot1s	%f27,	%f14
	nop
	setx	loop_253,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x022400001403,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fcmpeq16	%f26,	%f6,	%l4
	fmovspos	%icc,	%f17,	%f2
	call	loop_254
loop_253:
	fnot2	%f28,	%f2
	brgz,a,pt	%g6,	loop_255
	fbug	%fcc0,	loop_256
loop_254:
	edge32ln	%o5,	%o2,	%i4
	bshuffle	%f20,	%f0,	%f30
loop_255:
	call	loop_257
loop_256:
	call	loop_258
	bpos,a,pt	%xcc,	loop_259
	fmovscs	%icc,	%f28,	%f5
loop_257:
	fandnot1	%f30,	%f24,	%f14
loop_258:
	fandnot2	%f0,	%f30,	%f14
loop_259:
	fmul8x16al	%f22,	%f5,	%f12

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	subccc	%i0,	%o7,	%l2
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 1:
!
!	Type l   	: 20
!	Type a   	: 33
!	Type x   	: 10
!	Type cti   	: 114
!	Type f   	: 163
!	Type i   	: 160
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
	set	0x1,	%g1
	set	0xF,	%g2
	set	0xA,	%g3
	set	0x1,	%g4
	set	0x7,	%g5
	set	0x2,	%g6
	set	0x3,	%g7
	!# Input registers
	set	-0x8,	%i0
	set	-0xF,	%i1
	set	-0x8,	%i2
	set	-0xB,	%i3
	set	-0xE,	%i4
	set	-0x3,	%i5
	set	-0x8,	%i6
	set	-0x5,	%i7
	!# Local registers
	set	0x2BF421DC,	%l0
	set	0x52578309,	%l1
	set	0x79E909F5,	%l2
	set	0x7F85D6A8,	%l3
	set	0x3C71A869,	%l4
	set	0x15194DCA,	%l5
	set	0x0F8ED31C,	%l6
	!# Output registers
	set	-0x0416,	%o0
	set	-0x1852,	%o1
	set	0x1875,	%o2
	set	-0x0C48,	%o3
	set	0x0691,	%o4
	set	-0x095F,	%o5
	set	0x07B1,	%o6
	set	-0x0F34,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x91C5092990AEF329)
	INIT_TH_FP_REG(%l7,%f2,0x402511393ED0807F)
	INIT_TH_FP_REG(%l7,%f4,0xF92E82099F2DD38A)
	INIT_TH_FP_REG(%l7,%f6,0xC63548B4FC696224)
	INIT_TH_FP_REG(%l7,%f8,0xF8131235A1EC7C86)
	INIT_TH_FP_REG(%l7,%f10,0x078A8E4300E905D4)
	INIT_TH_FP_REG(%l7,%f12,0xDD6D73B68A08BA8F)
	INIT_TH_FP_REG(%l7,%f14,0xD106A081C3DA7B58)
	INIT_TH_FP_REG(%l7,%f16,0x7A8F5A4BA163A19E)
	INIT_TH_FP_REG(%l7,%f18,0x7434B68B53BD3BD8)
	INIT_TH_FP_REG(%l7,%f20,0x6BC9B1E07EDD9AFB)
	INIT_TH_FP_REG(%l7,%f22,0x8DCF0C6A30229D94)
	INIT_TH_FP_REG(%l7,%f24,0x25982157D7AD1F71)
	INIT_TH_FP_REG(%l7,%f26,0x8D7422E16C30147A)
	INIT_TH_FP_REG(%l7,%f28,0xE1680FB547BA28F0)
	INIT_TH_FP_REG(%l7,%f30,0x44FCCC12CECA593A)

	!# Execute Main Diag ..

	call	loop_260
	sethi	0x1049,	%g7
	call	loop_261
	xnorcc	%l5,	0x1340,	%g2
loop_260:
	bvc,pn	%xcc,	loop_262
	rdhpr	%hpstate,	%g1
loop_261:
	fpadd32s	%f12,	%f10,	%f8
	wr	%g0,	0xf0,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
loop_262:
	fbn,a	%fcc0,	loop_263
	addccc	%i2,	%g4,	%o4
	call	loop_264
	sethi	0x058F,	%i3
loop_263:
	array16	%o6,	%i1,	%o0
	call	loop_265
loop_264:
	movrgz	%o1,	0x0AA,	%l1
	srl	%l3,	%i7,	%o3
	tl	%icc,	0x4
loop_265:
	call	loop_266
	umulcc	%i5,	0x0F8A,	%l6
	call	loop_267
	fxnors	%f13,	%f30,	%f7
loop_266:
	fpsub16s	%f17,	%f30,	%f5
	subcc	%g3,	%i6,	%l4
loop_267:
	fbu,pt	%fcc0,	loop_268
	rd	%tick_cmpr,	%g6
	fmovdcs	%xcc,	%f8,	%f16
	movcc	%xcc,	%l0,	%o5
loop_268:
	call	loop_269
	wrpr	%o2,	%i4,	%cwp
	tgu	%xcc,	0x1
	bshuffle	%f30,	%f12,	%f24
loop_269:
	fpadd16	%f2,	%f16,	%f30
	fmovsneg	%icc,	%f13,	%f9
	fcmple16	%f24,	%f24,	%g5
	set	0x08, %i0
	stda	%o6,	[%l7 + %i0] 0x80
	umulcc	%l2,	0x0615,	%g7
	fbue,a,pn	%fcc3,	loop_270
	tneg	%icc,	0x1
	fmovdle	%icc,	%f24,	%f18
	addcc	%i0,	%g2,	%l5
loop_270:
	fmovrdgz	%i2,	%f6,	%f6
	movu	%fcc3,	0x567,	%g1
	call	loop_271
	fand	%f28,	%f10,	%f30
	fand	%f22,	%f16,	%f24
	mova	%xcc,	0x3F0,	%g4
loop_271:
	fabsd	%f26,	%f24
	rdhpr	%ver,	%i3
	rdhpr	%hsys_tick_cmpr,	%o4
	call	loop_272
	call	loop_273
	rdhpr	%hsys_tick_cmpr,	%o6
	fmovsul	%fcc3,	%f18,	%f29
loop_272:
	call	loop_274
loop_273:
	nop
	setx	0xA6943A3D,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f7
	setx	0x0F8D2632,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f23
	fdivs	%f23,	%f7,	%f22
	fmovsue	%fcc3,	%f29,	%f25
	rd	%fprs,	%i1
loop_274:
	edge8ln	%o1,	%l1,	%o0
	call	loop_275
	rd	%sys_tick_cmpr,	%i7
	call	loop_276
	fmovdn	%icc,	%f12,	%f4
loop_275:
	movug	%fcc3,	%o3,	%i5
	call	loop_277
loop_276:
	orcc	%l6,	0x1AAA,	%l3
	fcmpne16	%f8,	%f26,	%g3
	fmovdug	%fcc0,	%f20,	%f4
loop_277:
	fmovrslz	%i6,	%f30,	%f27
	call	loop_278
	call	loop_279
	alignaddr	%g6,	%l0,	%l4
	rdhpr	%hintp,	%o5
loop_278:
	fors	%f19,	%f2,	%f4
loop_279:
	addcc	%i4,	0x0D61,	%o2
	xnorcc	%g5,	%l2,	%g7
	mova	%fcc2,	%i0,	%o7
	fnegd	%f4,	%f16
	call	loop_280
	fmovdneg	%icc,	%f0,	%f16
	umulcc	%g2,	0x0F5E,	%i2
	call	loop_281
loop_280:
	flushw
	fmovdlg	%fcc1,	%f30,	%f6
	fmovdneg	%icc,	%f12,	%f20
loop_281:
	xor	%l5,	0x07A8,	%g1
	nop
	fitos	%f14,	%f21
	fstoi	%f21,	%f26
	nop
	set	0x58, %i2
	swap	[%l7 + %i2],	%g4
	orncc	%i3,	%o4,	%i1
	bvs,a	%icc,	loop_282
	edge16	%o1,	%l1,	%o6
	call	loop_283
	call	loop_284
loop_282:
	fmovdn	%fcc2,	%f8,	%f6
	membar	0x47
loop_283:
	ble,a	%xcc,	loop_285
loop_284:
	tcc	%icc,	0x6
	movne	%fcc1,	%o0,	%o3
	call	loop_286
loop_285:
	fcmpgt16	%f14,	%f14,	%i5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	movleu	%icc,	0x06F,	%l3
loop_286:
	alignaddr	%l6,	%g3,	%i6
	fcmple32	%f6,	%f4,	%l0
	movpos	%xcc,	0x542,	%g6
	nop
	setx	0xBD6F56F8,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f2
	setx	0x6D0179A6,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f31
	fadds	%f31,	%f2,	%f21
	call	loop_287
	ld	[%l7 + 0x6C],	%f6
	fpackfix	%f10,	%f15
	call	loop_288
loop_287:
	mova	%icc,	%o5,	%i4
	siam	0x1
	call	loop_289
loop_288:
	call	loop_290
	call	loop_291
	bvs,a	%xcc,	loop_292
loop_289:
	rdpr	%canrestore,	%o2
loop_290:
	tle	%xcc,	0x4
loop_291:
	call	loop_293
loop_292:
	fmovdpos	%xcc,	%f10,	%f12
	wrpr 	%g0, 	0x2, 	%gl
	move	%icc,	%g7,	%l2
loop_293:
	call	loop_294
	move	%xcc,	0x1E2,	%o7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%hintp,	%i0
loop_294:
	nop
	fitos	%f11,	%f5
	fstod	%f5,	%f6
	call	loop_295
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	subccc	%l5,	%g4,	%i3
	call	loop_296
loop_295:
	fcmpgt32	%f8,	%f8,	%g1
	fabsd	%f22,	%f22
	wrpr	%o4,	0x0C2C,	%pil
loop_296:
	tneg	%xcc,	0x5
	movge	%icc,	%o1,	%l1
	fexpand	%f17,	%f14
	call	loop_297
	fmovdlg	%fcc3,	%f10,	%f2
	call	loop_298
	call	loop_299
loop_297:
	andcc	%i1,	0x0F00,	%o0
	fnot2s	%f7,	%f11
loop_298:
	rd	%ccr,	%o3
loop_299:
	edge32l	%i5,	%i7,	%l3
	orn	%l6,	%o6,	%i6
	call	loop_300
	fmovsneg	%icc,	%f8,	%f8
	edge32n	%l0,	%g6,	%o5
	call	loop_301
loop_300:
	fmovsvc	%xcc,	%f31,	%f1
	bge,pn	%icc,	loop_302
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
loop_301:
	call	loop_303
	movl	%fcc3,	0x3FC,	%g3
loop_302:
	nop
	setx	0xB86D0C4D,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f10
	setx	0xA10D0F18,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f18
	fadds	%f18,	%f10,	%f26
	tg	%xcc,	0x5
loop_303:
	fmovrsgez	%i4,	%f0,	%f19
	nop
	fitos	%f3,	%f21
	fstod	%f21,	%f12
	nop
	set	0x0E, %o6
	lduh	[%l7 + %o6],	%o2
	bneg	%icc,	loop_304
	movle	%fcc0,	%l4,	%g5
	movrlz	%l2,	%g7,	%g2
	bge	%icc,	loop_305
loop_304:
	fmovsgu	%xcc,	%f1,	%f20
	fmul8x16al	%f27,	%f0,	%f0
	set	0x20, %g4
	stda	%o6,	[%l7 + %g4] 0x19
loop_305:
	membar	0x69
	movn	%icc,	%i0,	%l5
	bneg	%xcc,	loop_306
	call	loop_307
	fzeros	%f16
	call	loop_308
loop_306:
	call	loop_309
loop_307:
	call	loop_310
	fmovdl	%fcc1,	%f0,	%f0
loop_308:
	fcmple16	%f10,	%f22,	%i2
loop_309:
	brlez	%i3,	loop_311
loop_310:
	array16	%g1,	%o4,	%o1
	call	loop_312
	brlz	%l1,	loop_313
loop_311:
	movgu	%xcc,	0x779,	%g4
	movcc	%icc,	0x247,	%o0
loop_312:
	call	loop_314
loop_313:
	wr 	%g0, 	0x4, 	%fprs
	rdhpr	%ver,	%i5
	call	loop_315
loop_314:
	fmovdne	%fcc2,	%f28,	%f28
	wrpr	%i7,	0x0ADF,	%tick
	fsrc1s	%f23,	%f23
loop_315:
	call	loop_316
	call	loop_317
	fbu,pn	%fcc1,	loop_318
	srlx	%o3,	0x09,	%l3
loop_316:
	mova	%fcc2,	%l6,	%o6
loop_317:
	call	loop_319
loop_318:
	fmovdg	%fcc1,	%f30,	%f8
	call	loop_320
	orncc	%l0,	%i6,	%g6
loop_319:
	fmovrsne	%g3,	%f16,	%f10
	array16	%i4,	%o5,	%l4
loop_320:
	nop
	fitos	%f5,	%f9
	fstox	%f9,	%f22
	fxtos	%f22,	%f29
	xorcc	%o2,	0x1AAC,	%g5
	nop
	setx loop_321, %l0, %l1
	jmpl %l1, %g7
	fmovdul	%fcc2,	%f22,	%f0
	fmovsule	%fcc3,	%f25,	%f24
	tsubcctv	%g2,	%o7,	%l2
loop_321:
	fmovscs	%icc,	%f15,	%f23
	call	loop_322
	call	loop_323
	call	loop_324
	fbg	%fcc1,	loop_325
loop_322:
	call	loop_326
loop_323:
	fmovdpos	%xcc,	%f30,	%f10
loop_324:
	xnorcc	%l5,	0x174D,	%i2
loop_325:
	nop
	setx	loop_327,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x012200001402,	%l0,	%l1
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
loop_326:
	call	loop_328
	array32	%i3,	%i0,	%g1
	tne	%icc,	0x6
loop_327:
	call	loop_329
loop_328:
	movul	%fcc0,	%o4,	%o1
	ble,a,pt	%icc,	loop_330
	fmovsvs	%icc,	%f4,	%f24
loop_329:
	rdpr	%cleanwin,	%l1
	call	loop_331
loop_330:
	fornot1s	%f9,	%f11,	%f8
	udivx	%o0,	0x00,	%i1
	sub	%g4,	%i7,	%o3
loop_331:
	ldx	[%l7 + 0x48],	%l3
	nop
	set	0x72, %o3
	stb	%l6,	[%l7 + %o3]
	mova	%fcc1,	%o6,	%l0
	fmovsn	%xcc,	%f22,	%f27
	edge8n	%i6,	%i5,	%g6
	smulcc	%g3,	%i4,	%o5
	stx	%fsr,	[%l7 + 0x70]
	movl	%fcc0,	%o2,	%l4
	nop
	setx	0xDD0C221B7D4D29E9,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	fsqrtd	%f4,	%f2
	call	loop_332
	fbge	%fcc1,	loop_333
	tpos	%icc,	0x0
	nop
	setx	0x461B8CE4,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f1
	setx	0xADC82795,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f30
	fsubs	%f30,	%f1,	%f5
loop_332:
	fmovrdlez	%g5,	%f24,	%f10
loop_333:
	fmovsge	%icc,	%f0,	%f19
	fmovsuge	%fcc3,	%f17,	%f6
	fandnot2s	%f27,	%f20,	%f2
	fmovslg	%fcc0,	%f28,	%f1
	call	loop_334
	fmovde	%icc,	%f4,	%f14
	addc	%g2,	%g7,	%l2
	call	loop_335
loop_334:
	fsrc2	%f2,	%f12
	call	loop_336
	fornot1	%f0,	%f18,	%f22
loop_335:
	taddcc	%l5,	0x0E9F,	%i2
	movo	%fcc3,	0x27F,	%i3
loop_336:
	edge32l	%i0,	%g1,	%o7
	umulcc	%o1,	0x042B,	%o4
	call	loop_337
	call	loop_338
	fcmple32	%f8,	%f18,	%o0
	brnz,pn	%i1,	loop_339
loop_337:
	call	loop_340
loop_338:
	tpos	%icc,	0x2
	brgez	%g4,	loop_341
loop_339:
	sra	%i7,	%o3,	%l1
loop_340:
	nop
	fitos	%f7,	%f26
	fstox	%f26,	%f10
	edge16ln	%l6,	%l3,	%o6
loop_341:
	fba,pn	%fcc1,	loop_342
	rdhpr	%hsys_tick_cmpr,	%l0
	nop
	setx	0xF622F47A80DF23CF,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0x0175CAB0FEEA1F5F,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	faddd	%f16,	%f16,	%f10
	call	loop_343
loop_342:
	call	loop_344
	edge32	%i6,	%g6,	%g3
	call	loop_345
loop_343:
	nop
	fitos	%f4,	%f12
	fstod	%f12,	%f24
loop_344:
	call	loop_346
	bleu,a	%xcc,	loop_347
loop_345:
	rdhpr	%ver,	%i5
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
loop_346:
	movuge	%fcc1,	%o5,	%i4
loop_347:
	fmovdcs	%xcc,	%f26,	%f0
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	movpos	%icc,	%l4,	%o2
	call	loop_348
	call	loop_349
	call	loop_350
	movu	%fcc1,	0x61E,	%g5
loop_348:
	call	loop_351
loop_349:
	orn	%g2,	%l2,	%l5
loop_350:
	fmovduge	%fcc3,	%f14,	%f2
	pdist	%f26,	%f0,	%f8
loop_351:
	nop
	set	0x28, %g3
	std	%f18,	[%l7 + %g3]
	call	loop_352
	call	loop_353
	call	loop_354
	fbo,pt	%fcc3,	loop_355
loop_352:
	bshuffle	%f28,	%f30,	%f14
loop_353:
	bcc,a	%icc,	loop_356
loop_354:
	fmuld8ulx16	%f14,	%f3,	%f20
loop_355:
	fcmpeq32	%f2,	%f4,	%i2
	array16	%g7,	%i0,	%i3
loop_356:
	fmovscc	%xcc,	%f11,	%f23
	nop
	setx	0xE6791880B2D4F18E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0x13A4FA37C5FF3A6B,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	fsubd	%f10,	%f24,	%f4
	ldd	[%l7 + 0x48],	%g0
	fxnors	%f0,	%f10,	%f15

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	call	loop_357
	addc	%o4,	0x0D51,	%o0
	call	loop_358
	udivx	%i1,	0x00,	%o7
loop_357:
	fandnot2s	%f10,	%f24,	%f17
	fnot2s	%f1,	%f27
loop_358:
	fmovdn	%fcc2,	%f20,	%f6
	movvs	%xcc,	%g4,	%o3
	call	loop_359
	call	loop_360
	call	loop_361
	nop
	set	0x40, %g6
	ldd	[%l7 + %g6],	%i6
loop_359:
	brlz,a,pt	%l6,	loop_362
loop_360:
	fmovdul	%fcc3,	%f12,	%f18
loop_361:
	orncc	%l1,	%o6,	%l3
	tcc	%xcc,	0x3
loop_362:
	wr	%i6,	0x1F69,	%softint
	fmovsgu	%xcc,	%f27,	%f15
	bl,a	%icc,	loop_363
	rdhpr	%htba,	%l0
	call	loop_364
	movle	%fcc3,	%g3,	%i5
loop_363:
	call	loop_365
	srax	%o5,	0x1C,	%i4
loop_364:
	call	loop_366
	fcmpne32	%f12,	%f14,	%g6
loop_365:
	movrgz	%o2,	%g5,	%g2
	call	loop_367
loop_366:
	movrgz	%l2,	%l4,	%i2
	fmovdg	%xcc,	%f12,	%f28
	call	loop_368
loop_367:
	ldub	[%l7 + 0x2B],	%l5
	call	loop_369
	orcc	%g7,	0x092F,	%i3
loop_368:
	ldsh	[%l7 + 0x68],	%i0
	call	loop_370
loop_369:
	nop
	setx	0x9A846393,	%l0,	%l6
	st	%l6,	[%l7 + 0x6C]
	ld	[%l7 + 0x6C],	%fsr
	udiv	%g1,	0x00,	%o4
	fpadd16s	%f21,	%f20,	%f2
loop_370:
	rd	%pc,	%o1
	fand	%f10,	%f12,	%f30
	movvs	%xcc,	%i1,	%o7
	call	loop_371
	orncc	%o0,	%g4,	%i7
	fabsd	%f10,	%f30
	nop
	fitos	%f4,	%f20
	fstod	%f20,	%f0
loop_371:
	bvc	%icc,	loop_372
	sethi	0x009D,	%l6
	fblg,a,pt	%fcc2,	loop_373
	rdpr	%cwp,	%o3
loop_372:
	fmovrsne	%o6,	%f16,	%f7
	bmask	%l3,	%l1,	%i6
loop_373:
	wr	%l0,	0x099B,	%pic
	fmovsne	%icc,	%f22,	%f14
	nop
	setx	0x816BAA8530CF2066,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	fsqrtd	%f6,	%f28
	fnegd	%f22,	%f18
	fnands	%f15,	%f11,	%f11
	fmovrslez	%i5,	%f25,	%f17
	ba,a,pn	%icc,	loop_374
	ba,a,pt	%xcc,	loop_375
	wr	%o5,	%g3,	%clear_softint
	or	%g6,	%o2,	%i4
loop_374:
	call	loop_376
loop_375:
	call	loop_377
	mulx	%g2,	0x0D5D,	%l2
	call	loop_378
loop_376:
	rd	%fprs,	%l4
loop_377:
	call	loop_379
	call	loop_380
loop_378:
	fmul8sux16	%f24,	%f14,	%f12
	call	loop_381
loop_379:
	fbn	%fcc0,	loop_382
loop_380:
	subccc	%i2,	0x18EA,	%g5
	nop
	set	0x10, %g5
	flush	%l7 + %g5
loop_381:
	call	loop_383
loop_382:
	sir	0x1CC5
	for	%f28,	%f28,	%f14
	edge16ln	%g7,	%l5,	%i3
loop_383:
	movrgez	%i0,	%o4,	%o1
	fsrc1s	%f13,	%f22
	wr	%g1,	0x0589,	%softint
	rdhpr	%htba,	%i1
	edge16n	%o7,	%g4,	%i7
	fmovd	%f10,	%f28
	fxnor	%f26,	%f16,	%f28
	call	loop_384
	fmovdul	%fcc3,	%f24,	%f16
	call	loop_385
	edge8	%l6,	%o3,	%o6
loop_384:
	call	loop_386
	edge16l	%l3,	%l1,	%o0
loop_385:
	nop
	set	0x32, %l2
	lduha	[%l7 + %l2] 0x18,	%i6
loop_386:
	nop
	setx	0xE79AF5C3C4AC23CA,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	fsqrtd	%f18,	%f28
	alignaddrl	%i5,	%o5,	%g3
	bneg	%icc,	loop_387
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	lduw	[%l7 + 0x6C],	%l0
	fmovsg	%fcc2,	%f4,	%f24
loop_387:
	fmovrslez	%o2,	%f28,	%f29
	mulx	%g6,	%i4,	%g2
	ba	%icc,	loop_388
	wr	%l4,	%l2,	%y
	call	loop_389
	tl	%icc,	0x1
loop_388:
	ldstub	[%l7 + 0x5C],	%g5
	nop
	fitod	%f12,	%f30
	fdtos	%f30,	%f3
loop_389:
	call	loop_390
	call	loop_391
	fmovrslez	%g7,	%f2,	%f15
	fpsub32	%f16,	%f10,	%f22
loop_390:
	call	loop_392
loop_391:
	call	loop_393
	movrlez	%l5,	%i3,	%i2
	fzeros	%f2
loop_392:
	nop
	set	0x28, %l6
	lduh	[%l7 + %l6],	%o4
loop_393:
	edge32ln	%o1,	%i0,	%g1
	movpos	%icc,	%i1,	%g4
	fmovdg	%xcc,	%f4,	%f24
	fmovsule	%fcc0,	%f2,	%f23
	call	loop_394
	call	loop_395
	brnz,a,pt	%i7,	loop_396
	call	loop_397
loop_394:
	fabss	%f26,	%f11
loop_395:
	call	loop_398
loop_396:
	nop
	fitos	%f10,	%f12
	fstoi	%f12,	%f31
loop_397:
	brgez,a,pn	%o7,	loop_399
	rdpr	%pil,	%o3
loop_398:
	xnorcc	%l6,	%l3,	%o6
	nop
	setx	0x181CE52D6EE083AD,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0xB90C44E0,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	fsmuld	%f30,	%f28,	%f16
loop_399:
	fmovsvc	%xcc,	%f15,	%f11
	wrpr	%o0,	%l1,	%pil
	rdhpr	%hsys_tick_cmpr,	%i6
	fmovdge	%fcc2,	%f10,	%f24
	call	loop_400
	edge8ln	%o5,	%g3,	%i5
	move	%icc,	0x1C8,	%o2
	bshuffle	%f30,	%f0,	%f30
loop_400:
	call	loop_401
	fmovdu	%fcc0,	%f24,	%f30
	fmul8sux16	%f8,	%f26,	%f18
	movle	%icc,	%l0,	%g6
loop_401:
	bcc,pt	%xcc,	loop_402
	taddcc	%i4,	0x0164,	%g2
	sth	%l4,	[%l7 + 0x12]
	fmovdle	%fcc2,	%f20,	%f8
loop_402:
	fbe,a,pt	%fcc0,	loop_403
	call	loop_404
	call	loop_405
	call	loop_406
loop_403:
	taddcc	%g5,	%g7,	%l5
loop_404:
	fnegd	%f20,	%f12
loop_405:
	fmovdvc	%icc,	%f8,	%f14
loop_406:
	rd	%y,	%l2
	call	loop_407
	fmovdne	%fcc0,	%f10,	%f26
	tn	%icc,	0x1
	fba,a,pn	%fcc1,	loop_408
loop_407:
	call	loop_409
	mova	%fcc0,	%i2,	%o4
	call	loop_410
loop_408:
	call	loop_411
loop_409:
	call	loop_412
	nop
	fitos	%f5,	%f20
	fstod	%f20,	%f16
loop_410:
	movrlz	%i3,	%o1,	%g1
loop_411:
	srlx	%i0,	%i1,	%i7
loop_412:
	wrpr	%o7,	%g4,	%tick
	andncc	%o3,	0x0B10,	%l6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	edge8	%l3,	%l1,	%i6
	tsubcc	%o0,	0x1CFE,	%g3
	edge32ln	%i5,	%o2,	%l0
	fmovdvc	%xcc,	%f16,	%f18
	fpsub32	%f12,	%f20,	%f6
	movrgez	%g6,	0x144,	%o5
	sllx	%i4,	%g2,	%l4
	srax	%g5,	0x15,	%l5
	movl	%xcc,	0x7FD,	%l2
	call	loop_413
	fmovrdne	%i2,	%f12,	%f16
	fmovrdne	%o4,	%f6,	%f12
	movu	%fcc3,	%i3,	%g7
loop_413:
	call	loop_414
	fcmps	%fcc2,	%f14,	%f0
	movrgz	%o1,	0x2E4,	%g1
	call	loop_415
loop_414:
	fmovsule	%fcc0,	%f24,	%f29
	nop
	set	0x4E, %i7
	ldsh	[%l7 + %i7],	%i0
	fone	%f20
loop_415:
	call	loop_416
	movrlz	%i7,	0x3B3,	%o7
loop_416:
	nop

	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 2:
!
!	Type l   	: 22
!	Type a   	: 39
!	Type x   	: 4
!	Type cti   	: 157
!	Type f   	: 136
!	Type i   	: 142
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
	set	0x8,	%g1
	set	0xD,	%g2
	set	0x4,	%g3
	set	0x1,	%g4
	set	0x0,	%g5
	set	0x4,	%g6
	set	0x4,	%g7
	!# Input registers
	set	-0x2,	%i0
	set	-0xD,	%i1
	set	-0x3,	%i2
	set	-0x3,	%i3
	set	-0x9,	%i4
	set	-0x1,	%i5
	set	-0xC,	%i6
	set	-0xE,	%i7
	!# Local registers
	set	0x08DFEBF0,	%l0
	set	0x62B2CE4C,	%l1
	set	0x12B799A0,	%l2
	set	0x11670DA3,	%l3
	set	0x7D730645,	%l4
	set	0x597B9B2F,	%l5
	set	0x5C1AC3C1,	%l6
	!# Output registers
	set	0x0342,	%o0
	set	0x1207,	%o1
	set	-0x0696,	%o2
	set	0x1E73,	%o3
	set	0x0BF3,	%o4
	set	-0x0C59,	%o5
	set	0x0CD0,	%o6
	set	0x0196,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x91C5092990AEF329)
	INIT_TH_FP_REG(%l7,%f2,0x402511393ED0807F)
	INIT_TH_FP_REG(%l7,%f4,0xF92E82099F2DD38A)
	INIT_TH_FP_REG(%l7,%f6,0xC63548B4FC696224)
	INIT_TH_FP_REG(%l7,%f8,0xF8131235A1EC7C86)
	INIT_TH_FP_REG(%l7,%f10,0x078A8E4300E905D4)
	INIT_TH_FP_REG(%l7,%f12,0xDD6D73B68A08BA8F)
	INIT_TH_FP_REG(%l7,%f14,0xD106A081C3DA7B58)
	INIT_TH_FP_REG(%l7,%f16,0x7A8F5A4BA163A19E)
	INIT_TH_FP_REG(%l7,%f18,0x7434B68B53BD3BD8)
	INIT_TH_FP_REG(%l7,%f20,0x6BC9B1E07EDD9AFB)
	INIT_TH_FP_REG(%l7,%f22,0x8DCF0C6A30229D94)
	INIT_TH_FP_REG(%l7,%f24,0x25982157D7AD1F71)
	INIT_TH_FP_REG(%l7,%f26,0x8D7422E16C30147A)
	INIT_TH_FP_REG(%l7,%f28,0xE1680FB547BA28F0)
	INIT_TH_FP_REG(%l7,%f30,0x44FCCC12CECA593A)

	!# Execute Main Diag ..

	rdhpr	%hsys_tick_cmpr,	%i1
	call	loop_417
	fmovspos	%icc,	%f22,	%f22
	call	loop_418
	call	loop_419
loop_417:
	call	loop_420
	rdhpr	%ver,	%g4
loop_418:
	call	loop_421
loop_419:
	rd	%fprs,	%l6
loop_420:
	fcmple16	%f22,	%f30,	%o3
	fmovrsgez	%o6,	%f11,	%f29
loop_421:
	rdpr	%canrestore,	%l1
	mulscc	%l3,	%o0,	%g3
	call	loop_422
	call	loop_423
	nop
	setx	0x204D30EC,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f27
	setx	0xAF56B46B,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f23
	fadds	%f23,	%f27,	%f26
	xor	%i5,	%i6,	%o2
loop_422:
	call	loop_424
loop_423:
	ldd	[%l7 + 0x38],	%f26
	fxnor	%f14,	%f8,	%f0
	fmovrsgz	%l0,	%f17,	%f12
loop_424:
	popc	%o5,	%g6
	edge8ln	%g2,	%i4,	%l4
	xnorcc	%g5,	0x0552,	%l5
	call	loop_425
	fmovsug	%fcc0,	%f27,	%f15
	call	loop_426
	fpadd16s	%f31,	%f28,	%f7
loop_425:
	fmovda	%fcc1,	%f14,	%f28
	array8	%l2,	%o4,	%i3
loop_426:
	fmul8x16	%f11,	%f6,	%f10
	fnot2s	%f19,	%f16
	andn	%g7,	%o1,	%g1
	fpsub16	%f16,	%f28,	%f6
	call	loop_427
	call	loop_428
	rdpr	%cleanwin,	%i2
	call	loop_429
loop_427:
	brz,a	%i7,	loop_430
loop_428:
	fandnot2s	%f18,	%f22,	%f31
	nop
	setx	0x18B66E7A,	%l0,	%l6
	st	%l6,	[%l7 + 0x4C]
	ld	[%l7 + 0x4C],	%fsr
loop_429:
	call	loop_431
loop_430:
	nop
	set	0x20, %i1
	swap	[%l7 + %i1],	%i0
	fnegd	%f4,	%f16
	fcmpgt32	%f28,	%f8,	%o7
loop_431:
	udivcc	%i1,	0x00,	%g4
	movue	%fcc2,	%l6,	%o3
	faligndata	%f6,	%f22,	%f14
	call	loop_432
	call	loop_433
	movrne	%o6,	0x123,	%l3
	fmovrdlz	%o0,	%f28,	%f2
loop_432:
	nop
	fitod	%f23,	%f16
loop_433:
	srlx	%g3,	0x0C,	%l1
	call	loop_434
	faligndata	%f30,	%f10,	%f24
	call	loop_435
	nop
	setx	0xB553D1A4,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f21
	setx	0x7152B74F,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f12
	fsubs	%f12,	%f21,	%f9
loop_434:
	subcc	%i6,	%i5,	%l0
	fmul8x16	%f31,	%f26,	%f10
loop_435:
	call	loop_436
	sethi	0x0AD8,	%o2
	tg	%icc,	0x0
	call	loop_437
loop_436:
	nop
	fitod	%f4,	%f30
	fdtox	%f30,	%f22
	array32	%g6,	%o5,	%i4
	nop
	setx	0xC2FCD16CDECCE4B6,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0xFDDB6FF74D2717A1,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fdivd	%f0,	%f2,	%f0
loop_437:
	call	loop_438
	call	loop_439
	fmovrdlz	%g2,	%f14,	%f10
	call	loop_440
loop_438:
	fcmpeq32	%f30,	%f10,	%g5
loop_439:
	fbo,pn	%fcc3,	loop_441
	wr	%l5,	0x12C5,	%set_softint
loop_440:
	fornot1	%f10,	%f30,	%f22
	sll	%l2,	%o4,	%i3
loop_441:
	fmovdule	%fcc1,	%f10,	%f10
	edge16ln	%l4,	%g7,	%g1
	rdhpr	%hpstate,	%i2
	tg	%xcc,	0x5
	fnot2	%f16,	%f10
	fnand	%f2,	%f4,	%f10
	fandnot1	%f14,	%f28,	%f10
	call	loop_442
	fcmple16	%f18,	%f8,	%o1
	movl	%icc,	0x460,	%i0
	call	loop_443
loop_442:
	alignaddr	%o7,	%i7,	%g4
	call	loop_444
	fmul8x16au	%f7,	%f3,	%f2
loop_443:
	call	loop_445
	fmovsvc	%xcc,	%f19,	%f30
loop_444:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xD08, 	%hsys_tick_cmpr
	wrpr	%o3,	%o6,	%cwp
loop_445:
	tcc	%icc,	0x5
	fnors	%f31,	%f8,	%f19
	call	loop_446
	flushw
	subcc	%o0,	%g3,	%l1
	call	loop_447
loop_446:
	subccc	%l3,	0x042C,	%i6
	edge16ln	%i5,	%o2,	%g6
	call	loop_448
loop_447:
	fandnot1s	%f13,	%f23,	%f5
	set	0x50, %o1
	stha	%o5,	[%l7 + %o1] 0x18
loop_448:
	fmovdvs	%icc,	%f22,	%f10
	fsrc2s	%f5,	%f20
	movuge	%fcc0,	0x24F,	%i4
	array32	%g2,	%g5,	%l0
	bg,a	%xcc,	loop_449
	fmovrdlez	%l5,	%f14,	%f8
	fmovsvs	%icc,	%f11,	%f27
	call	loop_450
loop_449:
	call	loop_451
	fmovdl	%xcc,	%f18,	%f24
	udivx	%l2,	0x00,	%i3
loop_450:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x4DF, 	%hsys_tick_cmpr
loop_451:
	tneg	%xcc,	0x2
	rdpr	%otherwin,	%l4
	edge32n	%g1,	%g7,	%o1
	brlez	%i2,	loop_452
	call	loop_453
	fcmple16	%f30,	%f28,	%o7
	call	loop_454
loop_452:
	call	loop_455
loop_453:
	fmovrslz	%i7,	%f13,	%f28
	fmovrslz	%g4,	%f14,	%f7
loop_454:
	call	loop_456
loop_455:
	bge	%xcc,	loop_457
	tsubcc	%i1,	0x0950,	%l6
	fmovdle	%fcc3,	%f0,	%f14
loop_456:
	fornot1	%f10,	%f22,	%f14
loop_457:
	call	loop_458
	nop
	fitod	%f12,	%f0
	fdtoi	%f0,	%f8
	fmovrsgz	%i0,	%f12,	%f7
	rdpr	%tl,	%o6
loop_458:
	movrne	%o3,	0x370,	%o0
	fpackfix	%f14,	%f13
	fmovsne	%xcc,	%f0,	%f30
	addcc	%g3,	%l1,	%l3
	fmovsleu	%xcc,	%f12,	%f9
	fnor	%f28,	%f20,	%f14
	tg	%xcc,	0x6
	call	loop_459
	call	loop_460
	rdpr	%otherwin,	%i6
	wr	%i5,	%g6,	%clear_softint
loop_459:
	call	loop_461
loop_460:
	call	loop_462
	call	loop_463
	call	loop_464
loop_461:
	nop
	setx	0xD655B72F,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f31
	setx	0xE0BF8652,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f22
	fdivs	%f22,	%f31,	%f3
loop_462:
	fpsub32	%f12,	%f16,	%f30
loop_463:
	nop
	wr	%g0,	0x2c,	%asi
	ldda	[%l7 + 0x60] %asi,	%o4
loop_464:
	movrlz	%o2,	0x16E,	%g2
	nop
	fitod	%f8,	%f4
	nop
	setx	0x812A22ACD84FD8E0,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0x2CB79E780357B428,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	fsubd	%f4,	%f30,	%f0
	call	loop_465
	brnz	%g5,	loop_466
	bmask	%l0,	%i4,	%l2
	mulscc	%l5,	%o4,	%l4
loop_465:
	call	loop_467
loop_466:
	fmovde	%xcc,	%f0,	%f4
	xor	%i3,	%g7,	%g1
	fmul8x16	%f28,	%f20,	%f26
loop_467:
	xnorcc	%o1,	%o7,	%i7
	call	loop_468
	fandnot2	%f6,	%f18,	%f24
	fmovdn	%icc,	%f16,	%f30
	fmul8x16au	%f22,	%f13,	%f10
loop_468:
	call	loop_469
	edge16n	%i2,	%g4,	%l6
	call	loop_470
	call	loop_471
loop_469:
	nop
	setx	0xE17BB970,	%l0,	%l6
	st	%l6,	[%l7 + 0x60]
	ld	[%l7 + 0x60],	%fsr
	fnors	%f5,	%f8,	%f0
loop_470:
	rdhpr	%htba,	%i1
loop_471:
	call	loop_472
	rdhpr	%hsys_tick_cmpr,	%i0
	fmovdu	%fcc1,	%f12,	%f0
	call	loop_473
loop_472:
	bge,pn	%xcc,	loop_474
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	fpadd16s	%f3,	%f10,	%f9
loop_473:
	call	loop_475
loop_474:
	xnor	%o3,	0x16A6,	%o0
	fbo,a	%fcc2,	loop_476
	call	loop_477
loop_475:
	rd	%asi,	%g3
	fmovduge	%fcc2,	%f12,	%f2
loop_476:
	fxnor	%f20,	%f28,	%f28
loop_477:
	call	loop_478
	call	loop_479
	brgz,a,pn	%o6,	loop_480
	call	loop_481
loop_478:
	movle	%icc,	0x767,	%l3
loop_479:
	fabss	%f16,	%f23
loop_480:
	nop
	set	0x60, %i4
	lduha	[%l7 + %i4] 0x81,	%l1
loop_481:
	fcmpgt16	%f2,	%f4,	%i5
	call	loop_482
	ta	%icc,	0x3
	call	loop_483
	movcc	%xcc,	%i6,	%g6
loop_482:
	call	loop_484
	call	loop_485
loop_483:
	call	loop_486
	edge8n	%o5,	%o2,	%g2
loop_484:
	fmovdule	%fcc1,	%f24,	%f22
loop_485:
	fpsub32s	%f8,	%f24,	%f10
loop_486:
	nop
	set	0x60, %i6
	ldd	[%l7 + %i6],	%f28
	call	loop_487
	fmovsl	%fcc3,	%f22,	%f26
	nop
	set	0x0F, %o2
	ldstub	[%l7 + %o2],	%g5
	call	loop_488
loop_487:
	subcc	%i4,	%l2,	%l0
	set	0x64, %o0
	ldsba	[%l7 + %o0] 0x04,	%o4
loop_488:
	movn	%fcc3,	0x439,	%l5
	sdivcc	%i3,	0x00,	%l4
	call	loop_489
	call	loop_490
	tleu	%xcc,	0x2
	edge16l	%g1,	%g7,	%o1
loop_489:
	nop
	setx	0x136D7F86,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f6
	setx	0x5BBCEC05,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f4
	fdivs	%f4,	%f6,	%f8
loop_490:
	fornot2	%f20,	%f8,	%f8
	movpos	%xcc,	%i7,	%o7
	fmuld8sux16	%f30,	%f27,	%f12
	nop
	setx	0x113D8271,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f11
	setx	0x59B464AF,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f10
	fadds	%f10,	%f11,	%f12
	edge32	%g4,	%l6,	%i1
	nop
	set	0x1A, %l3
	stb	%i0,	[%l7 + %l3]
	smulcc	%i2,	%o3,	%g3
	movo	%fcc1,	%o6,	%o0
	tn	%xcc,	0x5
	fcmple16	%f26,	%f8,	%l1
	edge8n	%l3,	%i5,	%g6
	te	%xcc,	0x4
	ldd	[%l7 + 0x68],	%i6
	nop
	fitos	%f0,	%f24
	fstoi	%f24,	%f30
	rdhpr	%ver,	%o5
	call	loop_491
	call	loop_492
	ldsw	[%l7 + 0x60],	%o2
	fble,a,pn	%fcc0,	loop_493
loop_491:
	fmovsue	%fcc0,	%f20,	%f9
loop_492:
	call	loop_494
	call	loop_495
loop_493:
	call	loop_496
	array8	%g2,	%g5,	%i4
loop_494:
	call	loop_497
loop_495:
	fornot1s	%f9,	%f27,	%f15
loop_496:
	fmuld8sux16	%f17,	%f26,	%f14
	fmovsue	%fcc3,	%f28,	%f2
loop_497:
	fors	%f24,	%f23,	%f25
	nop
	set	0x7D, %g2
	ldub	[%l7 + %g2],	%l0
	call	loop_498
	mulx	%l2,	0x1DA2,	%l5
	edge8ln	%o4,	%i3,	%l4
	fba,a	%fcc3,	loop_499
loop_498:
	fmovs	%f29,	%f28
	call	loop_500
	fmovdcs	%xcc,	%f30,	%f16
loop_499:
	subccc	%g7,	%g1,	%i7
	fmul8x16au	%f27,	%f19,	%f12
loop_500:
	fmovsleu	%icc,	%f11,	%f24
	movrgez	%o7,	%g4,	%o1
	call	loop_501
	tle	%xcc,	0x6
	fcmps	%fcc2,	%f8,	%f11
	movge	%fcc0,	0x542,	%i1
loop_501:
	xorcc	%i0,	0x1251,	%l6
	tsubcctv	%i2,	%g3,	%o6
	set	0x38, %l1
	sta	%f13,	[%l7 + %l1] 0x10
	rd	%tick_cmpr,	%o3
	call	loop_502
	bge,a,pn	%xcc,	loop_503
	and	%l1,	0x0E1F,	%l3
	tl	%xcc,	0x2
loop_502:
	movleu	%icc,	0x2DE,	%o0
loop_503:
	call	loop_504
	movpos	%xcc,	0x3B5,	%i5
	smulcc	%i6,	%o5,	%o2
	movue	%fcc3,	%g2,	%g5
loop_504:
	fmovsneg	%xcc,	%f27,	%f1
	nop
	setx	0xDB4DABF3931D46C5,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0x0FDCC29E4F45453A,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	faddd	%f18,	%f4,	%f14
	call	loop_505
	fmovdcc	%xcc,	%f16,	%f16
	fmovdn	%fcc1,	%f20,	%f26
	sdivcc	%i4,	%g6,	%l2
loop_505:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x6EF, 	%hsys_tick_cmpr
	nop
	setx	0xFFD5BD55937454A5,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0xB559DCF51778333B,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	fmuld	%f30,	%f30,	%f8
	array8	%o4,	%l0,	%i3
	fmovrde	%l4,	%f4,	%f20
	call	loop_506
	call	loop_507
	st	%f17,	[%l7 + 0x50]
	call	loop_508
loop_506:
	bcc,a,pt	%xcc,	loop_509
loop_507:
	edge32l	%g1,	%g7,	%o7
	call	loop_510
loop_508:
	alignaddrl	%i7,	%g4,	%o1
loop_509:
	fnors	%f5,	%f14,	%f26
	move	%icc,	%i1,	%i0
loop_510:
	sdivx	%i2,	0x00,	%g3
	fmovsge	%xcc,	%f9,	%f30
	fmovdul	%fcc1,	%f8,	%f28
	fnors	%f22,	%f4,	%f26
	call	loop_511
	ldstub	[%l7 + 0x6C],	%l6
	array16	%o6,	%o3,	%l1
	alignaddrl	%o0,	%l3,	%i5
loop_511:
	fornot1	%f4,	%f24,	%f22
	nop
	set	0x10, %o7
	ldd	[%l7 + %o7],	%i6
	tcc	%icc,	0x2
	tpos	%icc,	0x4
	fexpand	%f5,	%f18
	rdpr	%canrestore,	%o5
	set	0x28, %o4
	lduwa	[%l7 + %o4] 0x0c,	%g2
	sdivx	%g5,	0x00,	%o2
	call	loop_512
	call	loop_513
	sdivcc	%i4,	%l2,	%g6
	fmovdleu	%icc,	%f2,	%f0
loop_512:
	call	loop_514
loop_513:
	call	loop_515
	orn	%o4,	0x1A89,	%l5
	fbn,a,pn	%fcc2,	loop_516
loop_514:
	rdhpr	%ver,	%i3
loop_515:
	fpsub32s	%f10,	%f25,	%f3
	call	loop_517
loop_516:
	fpadd16s	%f17,	%f29,	%f12
	call	loop_518
	fbule,pt	%fcc3,	loop_519
loop_517:
	call	loop_520
	call	loop_521
loop_518:
	nop
	setx	0xEB8BD2C6,	%l0,	%l6
	st	%l6,	[%l7 + 0x5C]
	ld	[%l7 + 0x5C],	%fsr
loop_519:
	bpos	%icc,	loop_522
loop_520:
	fpack16	%f20,	%f21
loop_521:
	wr	%l4,	%l0,	%set_softint
	xor	%g1,	%g7,	%i7
loop_522:
	movcs	%icc,	%o7,	%o1
	fmovdpos	%xcc,	%f22,	%f14
	call	loop_523
	nop
	setx	0x5B23DF8B56BA4D41,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0xC4B2A06AB3CCF83F,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	fsubd	%f22,	%f8,	%f24
	nop
	setx	loop_524,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x032400001403,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	bl	%icc,	loop_525
loop_523:
	rdpr	%cleanwin,	%g4
	mulscc	%i1,	0x05D9,	%i0
loop_524:
	bgu	%icc,	loop_526
loop_525:
	rd	%ccr,	%g3
	call	loop_527
	wr	%i2,	%o6,	%pic
loop_526:
	andncc	%o3,	0x18A3,	%l1
	movu	%fcc1,	%o0,	%l3
loop_527:
	tgu	%icc,	0x2
	call	loop_528
	fmovrsgz	%i5,	%f9,	%f23
	call	loop_529
	fmovda	%icc,	%f28,	%f14
loop_528:
	bcs	%xcc,	loop_530
	call	loop_531
loop_529:
	fmul8x16au	%f30,	%f0,	%f26
	fmovdcc	%icc,	%f30,	%f6
loop_530:
	call	loop_532
loop_531:
	andncc	%i6,	0x1986,	%o5
	orcc	%g2,	0x11C6,	%g5
	nop
	setx	0xC8524BA7FF42C34C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0x45385EAF208905C3,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	fsubd	%f12,	%f28,	%f22
loop_532:
	call	loop_533
	nop
	fitod	%f8,	%f14
	fdtos	%f14,	%f8
	rdhpr	%ver,	%o2
	call	loop_534
loop_533:
	sllx	%l6,	%i4,	%g6
	andncc	%o4,	%l5,	%l2
	movgu	%xcc,	%i3,	%l0
loop_534:
	fmovde	%fcc2,	%f20,	%f20
	sethi	0x0785,	%g1
	call	loop_535
	rdpr	%otherwin,	%g7
	call	loop_536
	fbl,a	%fcc3,	loop_537
loop_535:
	call	loop_538
	rd	%softint,	%i7
loop_536:
	fble,a,pn	%fcc2,	loop_539
loop_537:
	bmask	%o7,	%l4,	%o1
loop_538:
	call	loop_540
	call	loop_541
loop_539:
	call	loop_542
	move	%icc,	0x564,	%i1
loop_540:
	fmovdneg	%icc,	%f28,	%f30
loop_541:
	subc	%i0,	%g4,	%g3
loop_542:
	nop
	wr	%g0,	0x2b,	%asi
	stxa	%i2,	[%l7 + 0x18] %asi
	membar	#Sync
	call	loop_543
	bgu,pt	%icc,	loop_544
	call	loop_545
	fmovrslez	%o6,	%f7,	%f11
loop_543:
	call	loop_546
loop_544:
	fcmpne16	%f12,	%f4,	%o3
loop_545:
	smulcc	%l1,	%o0,	%i5
	call	loop_547
loop_546:
	rdpr	%pil,	%i6
	fmovrslez	%l3,	%f31,	%f14
	fmovdn	%xcc,	%f10,	%f18
loop_547:
	call	loop_548
	call	loop_549
	fpack32	%f14,	%f30,	%f24
	udiv	%g2,	0x00,	%g5
loop_548:
	fmovrse	%o5,	%f7,	%f28
loop_549:
	sth	%o2,	[%l7 + 0x12]
	st	%fsr,	[%l7 + 0x5C]
	stb	%i4,	[%l7 + 0x68]
	fmovrslz	%g6,	%f22,	%f18
	brlez,pt	%l6,	loop_550
	bleu,a,pt	%icc,	loop_551
	wrpr	%o4,	0x0182,	%cwp
	call	loop_552
loop_550:
	fmul8sux16	%f0,	%f0,	%f8
loop_551:
	tcs	%icc,	0x6
	set	0x0C, %g1
	sta	%f22,	[%l7 + %g1] 0x81
loop_552:
	fcmpne32	%f6,	%f22,	%l2
	fbl	%fcc1,	loop_553
	fmovs	%f26,	%f25
	call	loop_554
	call	loop_555
loop_553:
	call	loop_556
	tle	%xcc,	0x2
loop_554:
	nop
	fitos	%f11,	%f8
	fstoi	%f8,	%f10
loop_555:
	fmovdvc	%xcc,	%f2,	%f0
loop_556:
	movug	%fcc0,	%l5,	%l0
	edge16	%i3,	%g7,	%g1
	set	0x3C, %i5
	ldswa	[%l7 + %i5] 0x04,	%o7
	call	loop_557
	nop
	fitos	%f14,	%f2
	fstod	%f2,	%f26
	movgu	%icc,	%i7,	%o1
	call	loop_558
loop_557:
	prefetch	[%l7 + 0x08],	 1
	xor	%l4,	%i1,	%g4
	movne	%xcc,	0x064,	%g3
loop_558:
	edge16	%i0,	%o6,	%o3
	rdhpr	%hpstate,	%i2
	fbug,a	%fcc2,	loop_559
	fmovsa	%icc,	%f4,	%f21

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x244, 	%hsys_tick_cmpr
	tsubcctv	%i6,	%i5,	%g2
loop_559:
	fmuld8sux16	%f9,	%f28,	%f28
	fmovsug	%fcc1,	%f4,	%f23
	fmovsl	%fcc0,	%f25,	%f25
	tcs	%xcc,	0x3
	fcmpes	%fcc0,	%f0,	%f13
	fmovduge	%fcc0,	%f2,	%f12
	fmovsl	%fcc3,	%f1,	%f28
	call	loop_560
	nop
	fitod	%f8,	%f0
	call	loop_561
	call	loop_562
loop_560:
	srlx	%g5,	0x0E,	%o5
	fandnot2	%f30,	%f6,	%f12
loop_561:
	fmovrsgz	%l3,	%f30,	%f5
loop_562:
	tleu	%icc,	0x7
	fmovsuge	%fcc0,	%f7,	%f6
	movrlez	%o2,	%i4,	%g6
	call	loop_563
	movcs	%icc,	%o4,	%l6
	addcc	%l2,	0x0315,	%l5
	addc	%i3,	0x1B7B,	%g7
loop_563:
	smul	%l0,	0x0A57,	%o7
	fmovscs	%xcc,	%f22,	%f18
	call	loop_564
	call	loop_565
	fors	%f24,	%f28,	%f4
	udivx	%g1,	0x00,	%i7
loop_564:
	fnors	%f4,	%f9,	%f16
loop_565:
	call	loop_566
	subcc	%l4,	0x0189,	%i1
	fxors	%f21,	%f12,	%f1
	fmovsa	%icc,	%f22,	%f13
loop_566:
	nop
	wr	%g0,	0x19,	%asi
	lduha	[%l7 + 0x38] %asi,	%o1
	call	loop_567
	sllx	%g4,	0x0A,	%i0
	mulscc	%o6,	0x1856,	%o3
	nop
	set	0x30, %i3
	ldd	[%l7 + %i3],	%f24
loop_567:
	call	loop_568
	call	loop_569
	call	loop_570
	movrgez	%i2,	%g3,	%o0
loop_568:
	udivcc	%l1,	0x00,	%i6
loop_569:
	nop
	setx	loop_571,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x001400001407,	%l0,	%l1
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
loop_570:
	fmovdcc	%icc,	%f24,	%f8
	movl	%fcc0,	%i5,	%g2
	sir	0x17E6
loop_571:
	faligndata	%f12,	%f14,	%f10
	fmovdg	%icc,	%f4,	%f0
	fmuld8ulx16	%f31,	%f0,	%f10
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 3:
!
!	Type l   	: 29
!	Type a   	: 33
!	Type x   	: 10
!	Type cti   	: 155
!	Type f   	: 145
!	Type i   	: 128
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
	set	0xE,	%g1
	set	0xD,	%g2
	set	0x6,	%g3
	set	0xF,	%g4
	set	0xB,	%g5
	set	0x2,	%g6
	set	0xF,	%g7
	!# Input registers
	set	-0xE,	%i0
	set	-0x7,	%i1
	set	-0x9,	%i2
	set	-0xF,	%i3
	set	-0x0,	%i4
	set	-0xE,	%i5
	set	-0x1,	%i6
	set	-0x4,	%i7
	!# Local registers
	set	0x2D517EA0,	%l0
	set	0x641A593C,	%l1
	set	0x204F6C3E,	%l2
	set	0x10535726,	%l3
	set	0x615AB17D,	%l4
	set	0x55C267E2,	%l5
	set	0x1A693D29,	%l6
	!# Output registers
	set	-0x0864,	%o0
	set	0x032C,	%o1
	set	0x0173,	%o2
	set	0x1FC4,	%o3
	set	0x0C4D,	%o4
	set	0x08AD,	%o5
	set	0x11B8,	%o6
	set	0x0634,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x91C5092990AEF329)
	INIT_TH_FP_REG(%l7,%f2,0x402511393ED0807F)
	INIT_TH_FP_REG(%l7,%f4,0xF92E82099F2DD38A)
	INIT_TH_FP_REG(%l7,%f6,0xC63548B4FC696224)
	INIT_TH_FP_REG(%l7,%f8,0xF8131235A1EC7C86)
	INIT_TH_FP_REG(%l7,%f10,0x078A8E4300E905D4)
	INIT_TH_FP_REG(%l7,%f12,0xDD6D73B68A08BA8F)
	INIT_TH_FP_REG(%l7,%f14,0xD106A081C3DA7B58)
	INIT_TH_FP_REG(%l7,%f16,0x7A8F5A4BA163A19E)
	INIT_TH_FP_REG(%l7,%f18,0x7434B68B53BD3BD8)
	INIT_TH_FP_REG(%l7,%f20,0x6BC9B1E07EDD9AFB)
	INIT_TH_FP_REG(%l7,%f22,0x8DCF0C6A30229D94)
	INIT_TH_FP_REG(%l7,%f24,0x25982157D7AD1F71)
	INIT_TH_FP_REG(%l7,%f26,0x8D7422E16C30147A)
	INIT_TH_FP_REG(%l7,%f28,0xE1680FB547BA28F0)
	INIT_TH_FP_REG(%l7,%f30,0x44FCCC12CECA593A)

	!# Execute Main Diag ..

	bgu,a,pn	%xcc,	loop_572
	rdpr	%cansave,	%o5
	add	%l7,	0x58,	%l6
	wr	%g0,	0x11,	%asi
	casxa	[%l6] %asi,	%g5,	%o2
loop_572:
	fpadd16	%f10,	%f20,	%f12
	fmuld8sux16	%f31,	%f2,	%f24
	wr	%g0,	0x04,	%asi
	lduwa	[%l7 + 0x64] %asi,	%i4
	fmovrsne	%l3,	%f16,	%f26
	membar	0x17
	nop
	setx	0xDC8E4DFAE781F1E4,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0x1269AADA16F6A3B9,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	fsubd	%f28,	%f10,	%f18
	call	loop_573
	call	loop_574
	add	%g6,	0x0393,	%l6
	tsubcctv	%o4,	0x1654,	%l5
loop_573:
	fmovdul	%fcc1,	%f6,	%f12
loop_574:
	call	loop_575
	call	loop_576
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	movrne	%l2,	%i3,	%g7
loop_575:
	rdhpr	%hsys_tick_cmpr,	%o7
loop_576:
	call	loop_577
	fpsub16s	%f11,	%f10,	%f1
	call	loop_578
	nop
	fitod	%f8,	%f0
	fdtox	%f0,	%f14
loop_577:
	sll	%l0,	%g1,	%l4
	fmovsule	%fcc1,	%f30,	%f1
loop_578:
	movl	%fcc2,	0x586,	%i7
	call	loop_579
	sdivx	%o1,	0x00,	%g4
	fmul8x16au	%f27,	%f16,	%f30
	call	loop_580
loop_579:
	orncc	%i1,	%i0,	%o3
	tneg	%icc,	0x6
	fmul8x16al	%f4,	%f27,	%f8
loop_580:
	nop
	set	0x7C, %g7
	swapa	[%l7 + %g7] 0x11,	%i2
	movn	%xcc,	0x29A,	%g3
	call	loop_581
	call	loop_582
	call	loop_583
	call	loop_584
loop_581:
	subccc	%o6,	%l1,	%o0
loop_582:
	movrgez	%i6,	%i5,	%g2
loop_583:
	fmovso	%fcc1,	%f25,	%f1
loop_584:
	fmovdue	%fcc1,	%f0,	%f18
	fmovdg	%xcc,	%f12,	%f16
	nop
	setx	0xA44CC918BA33574F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0xC31E2797,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	fsmuld	%f22,	%f2,	%f18
	call	loop_585
	call	loop_586
	nop
	fitos	%f14,	%f1
	membar	#Sync
	set	0x40, %l0
	ldda	[%l7 + %l0] 0xf9,	%f16
loop_585:
	nop
	setx	0x5B33FBE3,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f7
	fsqrts	%f7,	%f23
loop_586:
	call	loop_587
	call	loop_588
	tvs	%xcc,	0x6
	call	loop_589
loop_587:
	st	%f24,	[%l7 + 0x70]
loop_588:
	movo	%fcc2,	%g5,	%o5
	movre	%i4,	%l3,	%o2
loop_589:
	call	loop_590
	fnor	%f28,	%f26,	%f0
	fxnors	%f15,	%f5,	%f12
	fmovduge	%fcc0,	%f10,	%f22
loop_590:
	call	loop_591
	fmuld8sux16	%f15,	%f12,	%f10
	nop
	fitos	%f7,	%f21
	smul	%l6,	%o4,	%l5
loop_591:
	sll	%g6,	0x1D,	%i3
	fmovso	%fcc3,	%f0,	%f13
	call	loop_592
	xnor	%l2,	0x1D56,	%o7
	nop
	setx	0xD637009BDE2E0C83,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0x1441ABFC3879C585,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	fdivd	%f22,	%f10,	%f2
	rd	%tick_cmpr,	%g7
loop_592:
	movug	%fcc0,	%g1,	%l4
	fcmpne32	%f24,	%f18,	%i7
	wr	%g0,	0xd0,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	nop
	fitod	%f8,	%f0
	fdtoi	%f0,	%f8
	fmovsvc	%xcc,	%f1,	%f1
	fmovscc	%xcc,	%f12,	%f24
	fmovd	%f26,	%f8
	call	loop_593
	movl	%fcc2,	%o1,	%g4
	call	loop_594
	edge32ln	%l0,	%i0,	%o3
loop_593:
	nop
	fitos	%f2,	%f16
	call	loop_595
loop_594:
	call	loop_596
	fmovsne	%icc,	%f21,	%f10
	edge16n	%i2,	%i1,	%g3
loop_595:
	fmovsuge	%fcc1,	%f11,	%f3
loop_596:
	call	loop_597
	subcc	%l1,	%o0,	%o6
	bneg,a	%icc,	loop_598
	fmovrdlz	%i5,	%f0,	%f12
loop_597:
	call	loop_599
	movrgz	%g2,	%i6,	%g5
loop_598:
	fbl,a,pn	%fcc2,	loop_600
	call	loop_601
loop_599:
	fmovdule	%fcc2,	%f14,	%f30
	fmovsle	%xcc,	%f15,	%f25
loop_600:
	fcmps	%fcc3,	%f17,	%f13
loop_601:
	fmovse	%icc,	%f28,	%f9
	sethi	0x17C4,	%o5
	movne	%icc,	%l3,	%i4
	call	loop_602
	rd	%asi,	%l6
	call	loop_603
	wrpr	%o2,	%l5,	%cwp
loop_602:
	movrlz	%o4,	0x1B3,	%g6
	umulcc	%i3,	0x0BD6,	%l2
loop_603:
	fmovsul	%fcc2,	%f24,	%f2
	sethi	0x1B56,	%g7
	call	loop_604
	call	loop_605
	call	loop_606
	call	loop_607
loop_604:
	nop
	setx	0x0A14370A1942BEC1,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0xD41146287C03D220,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fmuld	%f0,	%f30,	%f20
loop_605:
	te	%xcc,	0x0
loop_606:
	call	loop_608
loop_607:
	fbn,a	%fcc3,	loop_609
	call	loop_610
	nop
	setx	0x2BE81047,	%l0,	%l6
	st	%l6,	[%l7 + 0x34]
	ld	[%l7 + 0x34],	%fsr
loop_608:
	fmul8x16al	%f2,	%f14,	%f30
loop_609:
	ble,a	%icc,	loop_611
loop_610:
	sll	%g1,	%l4,	%i7
	move	%fcc2,	0x6B1,	%o7
	ba,a	%xcc,	loop_612
loop_611:
	fors	%f25,	%f1,	%f9
	rdpr	%otherwin,	%o1
	nop
	setx	0xC9B80412,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f0
	setx	0x08C7D733,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f4
	fadds	%f4,	%f0,	%f9
loop_612:
	srlx	%l0,	0x18,	%i0
	addccc	%g4,	0x02F4,	%i2
	fble,a	%fcc1,	loop_613
	edge32ln	%o3,	%g3,	%l1
	call	loop_614
	call	loop_615
loop_613:
	fmovdne	%fcc0,	%f0,	%f26
	wrpr	%i1,	0x19C1,	%tick
loop_614:
	tsubcctv	%o6,	%o0,	%g2
loop_615:
	nop
	setx	0xB430E391E66FFF30,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0xDC75A48BA0529E2D,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	fdivd	%f8,	%f8,	%f16
	call	loop_616
	call	loop_617
	bn,pn	%xcc,	loop_618
	fmovrslez	%i6,	%f5,	%f5
loop_616:
	nop
	fitos	%f13,	%f23
	fstox	%f23,	%f28
loop_617:
	fmovrdlz	%i5,	%f20,	%f18
loop_618:
	call	loop_619
	fmovdg	%icc,	%f24,	%f6
	wr	%g0,	0x04,	%asi
	ldsba	[%l7 + 0x14] %asi,	%o5
loop_619:
	addc	%l3,	%g5,	%l6
	fpack32	%f2,	%f20,	%f14
	edge16l	%i4,	%l5,	%o4
	fornot1s	%f24,	%f28,	%f21
	ta	%icc,	0x5
	wr	%g0,	0x10,	%asi
	ldsha	[%l7 + 0x7C] %asi,	%g6
	call	loop_620
	array32	%o2,	%i3,	%g7
	movne	%xcc,	0x16C,	%g1
	ldd	[%l7 + 0x38],	%f2
loop_620:
	fpack32	%f16,	%f2,	%f4
	fbge,a,pt	%fcc3,	loop_621
	fones	%f26
	call	loop_622
	call	loop_623
loop_621:
	umul	%l2,	0x10A8,	%i7
	movneg	%xcc,	0x0DB,	%l4
loop_622:
	fmul8x16al	%f26,	%f1,	%f10
loop_623:
	bpos,pt	%xcc,	loop_624
	smulcc	%o7,	%l0,	%o1
	nop
	fitod	%f0,	%f26
	fdtoi	%f26,	%f23
	rdhpr	%hpstate,	%i0
loop_624:
	sir	0x05F1
	fbu,a	%fcc0,	loop_625
	sdiv	%g4,	0x00,	%i2
	nop
	setx	0x2D9A2450,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f31
	setx	0x2C8B07A9,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f10
	fsubs	%f10,	%f31,	%f23
	lduh	[%l7 + 0x2A],	%o3
loop_625:
	call	loop_626
	fmovrsne	%g3,	%f7,	%f20
	wr	%g0,	0xe3,	%asi
	stba	%i1,	[%l7 + 0x41] %asi
	membar	#Sync
loop_626:
	array8	%l1,	%o6,	%g2
	fornot1	%f2,	%f30,	%f6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x723, 	%sys_tick_cmpr
	tne	%icc,	0x4
	call	loop_627
	wr	%i5,	0x173E,	%ccr
	edge16n	%o5,	%o0,	%g5
	addccc	%l6,	0x07BD,	%l3
loop_627:
	nop
	setx	0x77C10E78F8FDC626,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0x322A16B9DF12B27E,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	faddd	%f20,	%f28,	%f30
	fands	%f4,	%f28,	%f2
	edge8ln	%l5,	%i4,	%g6
	call	loop_628
	fabss	%f31,	%f9
	sdiv	%o4,	%i3,	%g7
	movvs	%xcc,	0x32E,	%o2
loop_628:
	movul	%fcc0,	%g1,	%l2
	wr	%i7,	0x1118,	%y
	fmovspos	%icc,	%f23,	%f14
	fbule	%fcc1,	loop_629
	fandnot1s	%f8,	%f2,	%f25
	fmovrde	%l4,	%f16,	%f2
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
loop_629:
	te	%icc,	0x2
	wrpr 	%g0, 	0x2, 	%gl
	call	loop_630
	movcc	%xcc,	0x2A8,	%o1
	nop
	setx	0x3B1CD116414F727E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x70]
	ldx	[%l7 + 0x70],	%fsr
	fmuld8sux16	%f16,	%f19,	%f24
loop_630:
	fmovdcc	%xcc,	%f22,	%f18
	udiv	%i0,	%l0,	%g4
	movne	%xcc,	0x4FF,	%o3
	sdivcc	%g3,	0x00,	%i2
	call	loop_631
	edge32l	%l1,	%o6,	%g2
	call	loop_632
	tgu	%xcc,	0x1
loop_631:
	addccc	%i6,	%i1,	%i5
	mulscc	%o5,	0x192B,	%o0
loop_632:
	movu	%fcc2,	0x688,	%g5
	umul	%l6,	%l5,	%i4
	fmovsgu	%xcc,	%f17,	%f25
	call	loop_633
	fornot2	%f0,	%f12,	%f26
	for	%f26,	%f24,	%f14
	call	loop_634
loop_633:
	nop
	setx	loop_635,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x022400001402,	%l0,	%l1
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
	wrpr	%l3,	0x104F,	%cwp
	fpackfix	%f10,	%f25
loop_634:
	xnorcc	%g6,	0x1E86,	%o4
loop_635:
	srl	%g7,	%o2,	%g1
	call	loop_636
	fmovsneg	%icc,	%f27,	%f2
	fmovslg	%fcc3,	%f3,	%f27
	fmul8x16al	%f31,	%f8,	%f10
loop_636:
	movcs	%xcc,	%i3,	%l2
	call	loop_637
	fnot2s	%f18,	%f8
	movug	%fcc0,	%l4,	%o7
	wr	%g0,	0x81,	%asi
	stwa	%i7,	[%l7 + 0x50] %asi
loop_637:
	st	%fsr,	[%l7 + 0x20]
	fcmpgt32	%f0,	%f12,	%o1
	array8	%i0,	%l0,	%o3
	fmovsuge	%fcc1,	%f2,	%f27
	call	loop_638
	fmovrdgz	%g3,	%f10,	%f10
	ta	%xcc,	0x2
	fbne,a,pt	%fcc3,	loop_639
loop_638:
	fmovrslz	%i2,	%f24,	%f23
	set	0x40, %l4
	stba	%l1,	[%l7 + %l4] 0x27
	membar	#Sync
loop_639:
	fnegs	%f21,	%f27
	call	loop_640
	smul	%o6,	%g4,	%i6
	fsrc1	%f8,	%f30
	call	loop_641
loop_640:
	movcc	%xcc,	0x5C3,	%i1
	fmuld8ulx16	%f1,	%f19,	%f0
	nop
	fitos	%f3,	%f11
	fstox	%f11,	%f6
	fxtos	%f6,	%f20
loop_641:
	call	loop_642
	wr	%i5,	%g2,	%sys_tick
	call	loop_643
	mulx	%o5,	0x18E5,	%g5
loop_642:
	fornot2s	%f9,	%f22,	%f6
	fsrc1s	%f9,	%f30
loop_643:
	bl	%icc,	loop_644
	fnands	%f16,	%f12,	%f4
	for	%f20,	%f0,	%f8
	fmovdle	%icc,	%f6,	%f22
loop_644:
	tsubcctv	%o0,	%l6,	%l5
	fcmped	%fcc2,	%f2,	%f20
	fpack32	%f18,	%f22,	%f28
	srax	%i4,	0x04,	%l3
	orcc	%o4,	%g7,	%g6
	movge	%fcc2,	%o2,	%g1
	fpsub32s	%f17,	%f20,	%f31
	sllx	%l2,	%l4,	%o7
	xor	%i3,	0x13C8,	%i7
	call	loop_645
	tgu	%icc,	0x1
	wr	%i0,	%o1,	%set_softint
	call	loop_646
loop_645:
	rdhpr	%hintp,	%o3
	sdiv	%g3,	0x00,	%l0
	add	%l7,	0x70,	%l6
	wr	%g0,	0x11,	%asi
	lda	[%l6] %asi,	%l1
	casa	[%l6] %asi,	%l1,	%o6
loop_646:
	call	loop_647
	taddcctv	%i2,	%i6,	%g4
	rd	%sys_tick_cmpr,	%i5
	fmovrsgez	%i1,	%f15,	%f1
loop_647:
	movg	%fcc0,	0x3A7,	%o5
	tsubcctv	%g5,	0x1FCA,	%g2
	call	loop_648
	edge16n	%l6,	%o0,	%i4
	edge32ln	%l3,	%l5,	%o4
	fone	%f22
loop_648:
	fpadd32s	%f17,	%f10,	%f21
	movvs	%xcc,	0x63D,	%g7
	addccc	%o2,	%g6,	%g1
	nop
	setx	0x57A20A47,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f23
	setx	0xEC638022,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f16
	fdivs	%f16,	%f23,	%f21
	edge16n	%l4,	%l2,	%o7
	call	loop_649
	fmovdl	%icc,	%f8,	%f2
	set	0x40, %l5
	ldda	[%l7 + %l5] 0x80,	%f16
loop_649:
	call	loop_650
	fmuld8ulx16	%f27,	%f12,	%f4
	sllx	%i7,	%i0,	%i3
	brgez,pt	%o3,	loop_651
loop_650:
	fmovrdlez	%o1,	%f22,	%f22
	call	loop_652
	taddcc	%g3,	%l1,	%l0
loop_651:
	call	loop_653
	fcmpes	%fcc0,	%f16,	%f4
loop_652:
	fnor	%f8,	%f30,	%f4
	sdivx	%o6,	%i6,	%i2
loop_653:
	movre	%i5,	%i1,	%o5
	fcmps	%fcc1,	%f19,	%f14
	bn,a,pt	%xcc,	loop_654
	nop
	setx	0xE86C3BD533E4C16D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0xBE839A5C,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	fsmuld	%f4,	%f28,	%f8
	andn	%g5,	0x1F8A,	%g4
	sra	%g2,	%l6,	%o0
loop_654:
	edge8ln	%l3,	%l5,	%i4
	call	loop_655
	tneg	%xcc,	0x3
	call	loop_656
	move	%fcc1,	0x390,	%g7
loop_655:
	call	loop_657
	mulscc	%o2,	0x0121,	%g6
loop_656:
	rd	%fprs,	%o4
	brlez,a	%l4,	loop_658
loop_657:
	tsubcc	%l2,	0x1C5B,	%g1
	fornot1	%f20,	%f16,	%f6
	fabss	%f0,	%f2
loop_658:
	movule	%fcc1,	0x4AE,	%i7
	call	loop_659
	call	loop_660
	call	loop_661
	edge32n	%o7,	%i0,	%i3
loop_659:
	fmovduge	%fcc0,	%f22,	%f2
loop_660:
	fand	%f8,	%f2,	%f30
loop_661:
	fmovdvs	%icc,	%f28,	%f20
	call	loop_662
	srl	%o3,	%o1,	%l1
	be	%xcc,	loop_663
	call	loop_664
loop_662:
	fmovdule	%fcc2,	%f18,	%f26
	call	loop_665
loop_663:
	brgez,a,pt	%l0,	loop_666
loop_664:
	call	loop_667
	nop
	setx	0xE7B358F7647FDB96,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0x1D42353E6F61F943,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	faddd	%f16,	%f6,	%f30
loop_665:
	fnors	%f26,	%f27,	%f28
loop_666:
	movrne	%g3,	0x342,	%o6
loop_667:
	call	loop_668
	movue	%fcc0,	%i2,	%i6
	rdhpr	%hpstate,	%i1
	call	loop_669
loop_668:
	movcc	%icc,	%o5,	%i5
	orcc	%g4,	%g5,	%l6
	call	loop_670
loop_669:
	nop
	setx	0xEA03739A7715263E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0x26829F1E9289214C,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	faddd	%f14,	%f14,	%f24
	movrlez	%g2,	%l3,	%l5
	fba,a,pt	%fcc1,	loop_671
loop_670:
	call	loop_672
	call	loop_673
	call	loop_674
loop_671:
	rdhpr	%ver,	%i4
loop_672:
	call	loop_675
loop_673:
	movu	%fcc1,	%o0,	%g7
loop_674:
	fmovda	%fcc1,	%f30,	%f16
	fpsub16s	%f6,	%f12,	%f16
loop_675:
	fmovrsgz	%g6,	%f0,	%f23
	xnor	%o2,	0x1DCE,	%l4
	nop
	fitod	%f9,	%f0
	call	loop_676
	fmovdo	%fcc0,	%f26,	%f28
	tcc	%xcc,	0x1
	bvs	%icc,	loop_677
loop_676:
	call	loop_678
	addcc	%l2,	%g1,	%i7
	fmovs	%f2,	%f14
loop_677:
	nop
	setx	0x28E7E077EE16E6B9,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	setx	0x4C4F43800D998640,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	fdivd	%f30,	%f18,	%f18
loop_678:
	fpadd16	%f22,	%f8,	%f16
	fmovsl	%fcc0,	%f13,	%f8
	movcs	%icc,	0x215,	%o7
	fcmped	%fcc1,	%f26,	%f22
	call	loop_679
	pdist	%f20,	%f8,	%f16
	xnorcc	%i0,	0x19AE,	%o4
	fpadd32	%f20,	%f12,	%f2
loop_679:
	movlg	%fcc2,	%o3,	%o1
	udivx	%i3,	%l0,	%g3
	umul	%o6,	0x1489,	%l1
	tpos	%icc,	0x1
	fornot2	%f14,	%f14,	%f4
	nop
	fitod	%f12,	%f16
	fdtox	%f16,	%f14
	fxtod	%f14,	%f12
	tle	%xcc,	0x1
	tsubcc	%i6,	%i1,	%i2
	call	loop_680
	fmovdo	%fcc2,	%f22,	%f0
	fmovsg	%fcc3,	%f27,	%f15
	taddcctv	%i5,	0x14F5,	%g4
loop_680:
	brgez,pt	%o5,	loop_681
	alignaddrl	%l6,	%g2,	%g5
	movge	%fcc2,	%l3,	%i4
	set	0x78, %o5
	stwa	%l5,	[%l7 + %o5] 0x2f
	membar	#Sync
loop_681:
	call	loop_682
	tl	%xcc,	0x2
	fmul8x16al	%f10,	%f12,	%f6
	fmovsule	%fcc1,	%f0,	%f11
loop_682:
	fmovrse	%o0,	%f12,	%f6
	edge16ln	%g6,	%g7,	%l4
	edge8ln	%l2,	%g1,	%o2
	membar	0x76
	call	loop_683
	call	loop_684
	nop
	fitos	%f3,	%f14
	fstod	%f14,	%f4
	fmovrslez	%i7,	%f2,	%f23
loop_683:
	tl	%icc,	0x3
loop_684:
	fmovsvs	%xcc,	%f10,	%f6
	movleu	%xcc,	0x380,	%o7
	fbue	%fcc1,	loop_685
	movvs	%icc,	0x3D0,	%i0
	sll	%o3,	0x1A,	%o4
	fmovsuge	%fcc0,	%f1,	%f5
loop_685:
	ble,a	%xcc,	loop_686
	fmovdvc	%xcc,	%f24,	%f30
	set	0x10, %i0
	ldswa	[%l7 + %i0] 0x89,	%o1
loop_686:
	rdpr	%cansave,	%i3
	edge32	%l0,	%g3,	%o6
	smulcc	%l1,	0x1437,	%i6
	fmul8sux16	%f2,	%f2,	%f4
	set	0x12, %i2
	lduha	[%l7 + %i2] 0x0c,	%i1
	fmovdo	%fcc1,	%f10,	%f8
	set	0x59, %g4
	stba	%i2,	[%l7 + %g4] 0x23
	membar	#Sync
	movule	%fcc1,	0x4F0,	%i5
	nop
	setx loop_687, %l0, %l1
	jmpl %l1, %o5
	call	loop_688
	fmovsg	%xcc,	%f0,	%f29
	addcc	%l6,	0x1D67,	%g4
loop_687:
	call	loop_689
loop_688:
	sth	%g5,	[%l7 + 0x68]
	siam	0x4
	fmovde	%fcc0,	%f30,	%f22
loop_689:
	call	loop_690
	wrpr	%g2,	%l3,	%pil
	rd	%pc,	%l5
	fpadd16	%f4,	%f14,	%f26
loop_690:
	fmovde	%fcc1,	%f8,	%f0
	andncc	%i4,	0x0C46,	%g6
	nop
	setx	0x3984CE81266D3661,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	setx	0x99724DAAA5BB7F13,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	fdivd	%f12,	%f18,	%f16
	fpsub16	%f28,	%f14,	%f0
	tl	%xcc,	0x6
	fmovrsgz	%o0,	%f10,	%f19
	fornot1s	%f14,	%f3,	%f24
	movgu	%xcc,	0x26E,	%g7
	brnz,pt	%l2,	loop_691
	alignaddrl	%l4,	%g1,	%o2
	movrne	%o7,	0x3DE,	%i0
	call	loop_692
loop_691:
	call	loop_693
	udiv	%i7,	0x00,	%o3
	fmovsug	%fcc0,	%f23,	%f2
loop_692:
	call	loop_694
loop_693:
	call	loop_695
	bg,a	%xcc,	loop_696
	call	loop_697
loop_694:
	call	loop_698
loop_695:
	flushw
loop_696:
	fmovdge	%xcc,	%f28,	%f26
loop_697:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_698:
	movule	%fcc3,	0x4C9,	%i3
	fmovrse	%l0,	%f18,	%f22
	tle	%xcc,	0x4
	fandnot2	%f10,	%f4,	%f6
	ble,a	%icc,	loop_699
	ta	%xcc,	0x3
	fmovsl	%xcc,	%f31,	%f15
	fmul8x16	%f7,	%f8,	%f4
loop_699:
	fmovsne	%icc,	%f27,	%f10
	addc	%o1,	0x1FB2,	%g3
	edge32n	%l1,	%o6,	%i6
	call	loop_700
	movgu	%icc,	%i2,	%i1
	call	loop_701
	call	loop_702
loop_700:
	edge8	%o5,	%l6,	%g4
	edge16ln	%i5,	%g2,	%l3
loop_701:
	fpack16	%f20,	%f8
loop_702:
	addcc	%g5,	%i4,	%l5
	set	, %o3
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 4:
!
!	Type l   	: 23
!	Type a   	: 24
!	Type x   	: 17
!	Type cti   	: 131
!	Type f   	: 151
!	Type i   	: 154
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
	set	0xD,	%g1
	set	0xE,	%g2
	set	0x1,	%g3
	set	0x7,	%g4
	set	0x8,	%g5
	set	0xE,	%g6
	set	0xA,	%g7
	!# Input registers
	set	-0x3,	%i0
	set	-0x5,	%i1
	set	-0xA,	%i2
	set	-0x1,	%i3
	set	-0x9,	%i4
	set	-0xB,	%i5
	set	-0xA,	%i6
	set	-0x1,	%i7
	!# Local registers
	set	0x4F7B437B,	%l0
	set	0x6C2AC528,	%l1
	set	0x181020C9,	%l2
	set	0x155F6600,	%l3
	set	0x367C74E8,	%l4
	set	0x12834F48,	%l5
	set	0x3C373B6F,	%l6
	!# Output registers
	set	0x0758,	%o0
	set	0x00F3,	%o1
	set	0x058A,	%o2
	set	0x03A2,	%o3
	set	0x15A9,	%o4
	set	0x0814,	%o5
	set	0x1EBB,	%o6
	set	-0x1F64,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x91C5092990AEF329)
	INIT_TH_FP_REG(%l7,%f2,0x402511393ED0807F)
	INIT_TH_FP_REG(%l7,%f4,0xF92E82099F2DD38A)
	INIT_TH_FP_REG(%l7,%f6,0xC63548B4FC696224)
	INIT_TH_FP_REG(%l7,%f8,0xF8131235A1EC7C86)
	INIT_TH_FP_REG(%l7,%f10,0x078A8E4300E905D4)
	INIT_TH_FP_REG(%l7,%f12,0xDD6D73B68A08BA8F)
	INIT_TH_FP_REG(%l7,%f14,0xD106A081C3DA7B58)
	INIT_TH_FP_REG(%l7,%f16,0x7A8F5A4BA163A19E)
	INIT_TH_FP_REG(%l7,%f18,0x7434B68B53BD3BD8)
	INIT_TH_FP_REG(%l7,%f20,0x6BC9B1E07EDD9AFB)
	INIT_TH_FP_REG(%l7,%f22,0x8DCF0C6A30229D94)
	INIT_TH_FP_REG(%l7,%f24,0x25982157D7AD1F71)
	INIT_TH_FP_REG(%l7,%f26,0x8D7422E16C30147A)
	INIT_TH_FP_REG(%l7,%f28,0xE1680FB547BA28F0)
	INIT_TH_FP_REG(%l7,%f30,0x44FCCC12CECA593A)

	!# Execute Main Diag ..

	fcmple32	%f18,	%f4,	%g6
	fmuld8sux16	%f26,	%f29,	%f2
	fornot2	%f0,	%f20,	%f4
	nop
	setx	0xCB75BDAD2B7897DB,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	fsqrtd	%f28,	%f14
	movvc	%icc,	%g7,	%l2
	tpos	%xcc,	0x4
	fmovsge	%fcc1,	%f23,	%f10
	call	loop_703
	andcc	%o0,	0x011A,	%g1
	fcmpd	%fcc1,	%f12,	%f28
	call	loop_704
loop_703:
	fmovsug	%fcc2,	%f25,	%f31
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	fmovsne	%fcc3,	%f25,	%f24
loop_704:
	udivcc	%o2,	0x00,	%o7
	fmovsne	%fcc2,	%f27,	%f14
	fxors	%f25,	%f9,	%f20
	call	loop_705
	call	loop_706
	nop
	fitod	%f0,	%f20
	fdtoi	%f20,	%f28
	fmovdvs	%xcc,	%f30,	%f4
loop_705:
	addccc	%i0,	0x0920,	%l4
loop_706:
	fornot1s	%f3,	%f17,	%f1
	tg	%xcc,	0x0
	call	loop_707
	fmovdl	%xcc,	%f6,	%f30
	orcc	%i7,	0x0076,	%o3
	movu	%fcc2,	%i3,	%o4
loop_707:
	movrlz	%l0,	0x212,	%g3
	call	loop_708
	call	loop_709
	fmovdpos	%xcc,	%f24,	%f0
	wr	%l1,	%o6,	%clear_softint
loop_708:
	fmul8x16al	%f22,	%f18,	%f4
loop_709:
	edge8n	%o1,	%i6,	%i2
	fands	%f7,	%f16,	%f13
	fmovrdgez	%i1,	%f26,	%f8
	subc	%o5,	%g4,	%l6
	andncc	%i5,	0x0090,	%g2
	rdhpr	%hsys_tick_cmpr,	%g5
	edge8n	%i4,	%l3,	%g6
	fpackfix	%f28,	%f9
	orn	%l5,	0x1441,	%l2
	nop
	setx	0x7B489FB2CA381197,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0xEBA6F4A56D367E7C,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	faddd	%f12,	%f26,	%f18
	tcc	%xcc,	0x0
	call	loop_710
	tle	%xcc,	0x6
	wr	%g7,	0x0C9D,	%set_softint
	fmovrde	%g1,	%f4,	%f0
loop_710:
	taddcctv	%o0,	0x0D58,	%o7
	fandnot1s	%f2,	%f7,	%f23
	nop
	setx	0x3067DB0D,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f22
	setx	0xCC3D9C44,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f8
	fsubs	%f8,	%f22,	%f30
	fmovscs	%xcc,	%f12,	%f26
	fcmpeq16	%f4,	%f2,	%o2
	wr	%g0,	0x18,	%asi
	lduha	[%l7 + 0x3C] %asi,	%i0
	nop
	setx	0x3CC2828D,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f13
	setx	0xF7A90298,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f11
	fmuls	%f11,	%f13,	%f30
	set	0x37, %g3
	ldsba	[%l7 + %g3] 0x81,	%i7
	fmul8ulx16	%f10,	%f8,	%f24
	call	loop_711
	fmovse	%fcc3,	%f8,	%f15
	call	loop_712
	call	loop_713
loop_711:
	fxor	%f24,	%f12,	%f26
	fandnot2s	%f26,	%f28,	%f2
loop_712:
	fpmerge	%f5,	%f30,	%f20
loop_713:
	call	loop_714
	taddcctv	%o3,	%l4,	%i3
	call	loop_715
	call	loop_716
loop_714:
	call	loop_717
	fmovdge	%xcc,	%f4,	%f6
loop_715:
	rd	%sys_tick_cmpr,	%l0
loop_716:
	nop
	fitod	%f2,	%f16
	fdtoi	%f16,	%f17
loop_717:
	smul	%o4,	%g3,	%o6
	call	loop_718
	call	loop_719
	sdiv	%o1,	0x00,	%i6
	fmovrdne	%l1,	%f12,	%f14
loop_718:
	for	%f26,	%f0,	%f6
loop_719:
	sir	0x11E2
	nop
	fitos	%f13,	%f11
	fstox	%f11,	%f0
	call	loop_720
	call	loop_721
	tsubcc	%i2,	%o5,	%i1
	fmovsul	%fcc1,	%f17,	%f16
loop_720:
	call	loop_722
loop_721:
	wr	%g4,	0x1CBF,	%y
	call	loop_723
	fmovdug	%fcc3,	%f30,	%f2
loop_722:
	fmovsug	%fcc1,	%f25,	%f10
	wrpr 	%g0, 	0x1, 	%gl
loop_723:
	siam	0x4
	fexpand	%f6,	%f4
	fcmple32	%f10,	%f22,	%l6
	fcmped	%fcc3,	%f20,	%f18
	call	loop_724
	call	loop_725
	fcmpd	%fcc2,	%f8,	%f4
	call	loop_726
loop_724:
	umulcc	%g2,	%i4,	%g5
loop_725:
	call	loop_727
	movo	%fcc1,	0x79C,	%l3
loop_726:
	te	%icc,	0x7
	call	loop_728
loop_727:
	tsubcc	%g6,	%l5,	%l2
	fsrc2s	%f28,	%f28
	orcc	%g7,	0x04AF,	%o0
loop_728:
	movvc	%icc,	%g1,	%o7
	nop
	setx	0x270FBE32,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f8
	setx	0x42A72455,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f3
	fmuls	%f3,	%f8,	%f15
	sdivcc	%o2,	0x00,	%i0
	tle	%xcc,	0x2
	fandnot2	%f26,	%f16,	%f30
	bcs,a	%icc,	loop_729
	movrgz	%i7,	0x2FE,	%o3
	call	loop_730
	rd	%ccr,	%l4
loop_729:
	call	loop_731
	movge	%fcc2,	%l0,	%o4
loop_730:
	fmovdu	%fcc1,	%f8,	%f20
	fbule,pn	%fcc0,	loop_732
loop_731:
	movue	%fcc3,	%i3,	%o6
	fmovdvc	%xcc,	%f12,	%f28
	udivcc	%g3,	%o1,	%l1
loop_732:
	wrpr 	%g0, 	0x2, 	%gl
	bcs,pt	%icc,	loop_733
	fabss	%f28,	%f19
	ldstub	[%l7 + 0x60],	%i2
	ldx	[%l7 + 0x58],	%g4
loop_733:
	mulscc	%i5,	0x1B14,	%l6
	movpos	%xcc,	%i1,	%i4
	call	loop_734
	wrpr	%g2,	%l3,	%cwp
	fmovsug	%fcc0,	%f8,	%f19
	bneg,a,pn	%xcc,	loop_735
loop_734:
	movuge	%fcc1,	0x675,	%g6
	call	loop_736
	subc	%l5,	0x0B7C,	%l2
loop_735:
	fnand	%f14,	%f2,	%f14

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
loop_736:
	fmovdl	%fcc3,	%f22,	%f6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x814, 	%tick_cmpr
	fmul8x16al	%f11,	%f16,	%f0
	call	loop_737
	call	loop_738
	call	loop_739
	nop
	fitos	%f1,	%f17
	fstox	%f17,	%f12
	fxtos	%f12,	%f9
loop_737:
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
loop_738:
	call	loop_740
loop_739:
	alignaddr	%o7,	%o2,	%g1
	set	0x40, %o6
	stda	%f16,	[%l7 + %o6] 0x1f
	membar	#Sync
loop_740:
	movo	%fcc0,	0x2EA,	%i0
	call	loop_741
	fpsub32s	%f7,	%f0,	%f27
	tcc	%icc,	0x6
	fbg	%fcc3,	loop_742
loop_741:
	fmovsl	%icc,	%f26,	%f29
	rdpr	%gl,	%i7
	srlx	%o3,	%l4,	%l0
loop_742:
	taddcctv	%o4,	0x097D,	%o6
	call	loop_743
	call	loop_744
	fxor	%f22,	%f18,	%f22
	call	loop_745
loop_743:
	fnot1	%f22,	%f30
loop_744:
	call	loop_746
	nop
	set	0x6F, %g6
	stb	%g3,	[%l7 + %g6]
loop_745:
	fnot2s	%f12,	%f21
	fors	%f26,	%f23,	%f19
loop_746:
	edge32	%o1,	%i3,	%l1
	sllx	%i6,	0x0C,	%o5
	call	loop_747
	movrgz	%i2,	%i5,	%g4
	nop
	fitod	%f6,	%f22
	fdtos	%f22,	%f26
	call	loop_748
loop_747:
	call	loop_749
	call	loop_750
	fands	%f15,	%f23,	%f31
loop_748:
	rdpr	%wstate,	%l6
loop_749:
	fmovsuge	%fcc2,	%f17,	%f5
loop_750:
	nop
	fitod	%f29,	%f12
	tneg	%xcc,	0x6
	sdivx	%i1,	%i4,	%l3
	fnot1	%f6,	%f26
	fblg,a	%fcc0,	loop_751
	call	loop_752
	fmul8x16	%f24,	%f10,	%f2
	wr	%g0,	0x89,	%asi
	lduwa	[%l7 + 0x7C] %asi,	%g2
loop_751:
	movvc	%xcc,	%g6,	%l5
loop_752:
	st	%fsr,	[%l7 + 0x68]
	set	0x34, %l2
	lda	[%l7 + %l2] 0x0c,	%f30

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	fmovsuge	%fcc0,	%f25,	%f30
	fmul8x16al	%f23,	%f7,	%f8
	fmovscc	%icc,	%f14,	%f1
	movl	%fcc1,	0x127,	%g5
	rdpr	%cwp,	%o0
	fsrc1	%f18,	%f26
	nop
	setx	0xA591DBA048443412,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0x6496E8416549545A,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	faddd	%f14,	%f2,	%f26
	fmovdvc	%xcc,	%f18,	%f24
	fabss	%f12,	%f15
	nop
	setx	0x22F9DCAABB408917,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	fsqrtd	%f24,	%f2
	bn,a	%icc,	loop_753
	nop
	set	0x70, %g5
	flush	%l7 + %g5
	smul	%o7,	%g1,	%i0
	ldd	[%l7 + 0x48],	%f14
loop_753:
	fmul8ulx16	%f30,	%f14,	%f22
	nop
	setx loop_754, %l0, %l1
	jmpl %l1, %i7
	fsrc2	%f12,	%f30
	fmovrdgz	%o2,	%f22,	%f2
	fmovdvc	%xcc,	%f12,	%f14
loop_754:
	fnegd	%f4,	%f8
	call	loop_755
	fxnor	%f2,	%f12,	%f4
	bl	%icc,	loop_756
	sll	%o3,	%l0,	%l4
loop_755:
	nop
	wr	%g0,	0x88,	%asi
	ldstuba	[%l7 + 0x30] %asi,	%o6
loop_756:
	srl	%o4,	0x0B,	%g3
	mulscc	%i3,	0x0D2A,	%o1
	smul	%l1,	0x1E79,	%o5
	xor	%i6,	%i2,	%i5
	bg	%xcc,	loop_757
	membar	0x0D
	pdist	%f0,	%f0,	%f0
	fmovrse	%g4,	%f3,	%f19
loop_757:
	movl	%xcc,	0x1B9,	%i1
	sub	%i4,	0x0762,	%l6
	wr	%g0,	0x88,	%asi
	prefetcha	[%l7 + 0x60] %asi,	 0
	nop
	setx	0x9A900241997BB0DF,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0x031802A7EBD3350A,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	faddd	%f12,	%f12,	%f18
	call	loop_758
	call	loop_759
	sdiv	%g2,	%l5,	%l2
	movug	%fcc1,	0x452,	%g7
loop_758:
	call	loop_760
loop_759:
	nop
	set	0x4A, %i7
	sth	%g5,	[%l7 + %i7]
	call	loop_761
	edge8ln	%o0,	%g6,	%g1
loop_760:
	brgez	%o7,	loop_762
	fmovrsgez	%i0,	%f16,	%f29
loop_761:
	alignaddr	%i7,	%o2,	%l0
	wr	%g0,	0x89,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
loop_762:
	call	loop_763
	edge32	%l4,	%o6,	%o4
	call	loop_764
	membar	0x3A
loop_763:
	array8	%g3,	%i3,	%o3
	rdhpr	%hpstate,	%l1
loop_764:
	ble,pt	%icc,	loop_765
	fmovsle	%icc,	%f22,	%f5
	taddcctv	%o5,	0x15FB,	%i6
	fmovdvc	%icc,	%f20,	%f6
loop_765:
	fnors	%f8,	%f23,	%f4
	call	loop_766
	fpsub32s	%f28,	%f5,	%f8
	movvs	%xcc,	0x7C0,	%i2
	edge16n	%i5,	%o1,	%g4
loop_766:
	fmul8sux16	%f18,	%f2,	%f12
	nop
	set	0x35, %l6
	ldstub	[%l7 + %l6],	%i1
	call	loop_767
	call	loop_768
	addccc	%l6,	%i4,	%l3
	xnorcc	%l5,	%l2,	%g7
loop_767:
	andncc	%g2,	%o0,	%g5
loop_768:
	call	loop_769
	call	loop_770
	call	loop_771
	fbug	%fcc3,	loop_772
loop_769:
	call	loop_773
loop_770:
	fmovdl	%icc,	%f18,	%f2
loop_771:
	nop
	setx	0xD5F3EE47,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f13
	setx	0x97A4FC1D,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f6
	fsubs	%f6,	%f13,	%f1
loop_772:
	sll	%g1,	%g6,	%o7
loop_773:
	fmul8ulx16	%f6,	%f0,	%f0
	fbge	%fcc2,	loop_774
	call	loop_775
	call	loop_776
	call	loop_777
loop_774:
	sdivcc	%i7,	0x00,	%o2
loop_775:
	fmovrsgz	%i0,	%f22,	%f3
loop_776:
	movo	%fcc1,	%l0,	%o6
loop_777:
	mulx	%l4,	0x1D76,	%o4
	call	loop_778
	fcmpes	%fcc0,	%f22,	%f3
	call	loop_779
	call	loop_780
loop_778:
	call	loop_781
	call	loop_782
loop_779:
	bge,a	%xcc,	loop_783
loop_780:
	rdpr	%gl,	%i3
loop_781:
	fmovdne	%icc,	%f30,	%f24
loop_782:
	nop
	fitod	%f12,	%f24
	fdtoi	%f24,	%f21
loop_783:
	fmovsg	%fcc1,	%f6,	%f31
	call	loop_784
	mulscc	%o3,	0x0BA9,	%l1
	fornot2s	%f2,	%f21,	%f19
	fmovduge	%fcc0,	%f22,	%f30
loop_784:
	fmovdcc	%icc,	%f18,	%f6
	move	%icc,	0x513,	%g3
	wr	%g0,	0x18,	%asi
	lduba	[%l7 + 0x62] %asi,	%i6
	fmul8x16	%f25,	%f18,	%f22
	fnegs	%f28,	%f21
	fpack32	%f14,	%f14,	%f22
	movne	%xcc,	%i2,	%i5
	fcmps	%fcc3,	%f29,	%f11
	call	loop_785
	call	loop_786
	sdivx	%o5,	0x00,	%o1
	call	loop_787
loop_785:
	array32	%i1,	%g4,	%i4
loop_786:
	call	loop_788
	fmovsn	%icc,	%f31,	%f8
loop_787:
	movrne	%l6,	0x040,	%l5
	call	loop_789
loop_788:
	call	loop_790
	tle	%icc,	0x1
	srlx	%l2,	%g7,	%g2
loop_789:
	bvs,a	%icc,	loop_791
loop_790:
	fblg,pt	%fcc2,	loop_792
	call	loop_793
	fmovscc	%xcc,	%f0,	%f22
loop_791:
	call	loop_794
loop_792:
	tneg	%icc,	0x3
loop_793:
	movo	%fcc0,	%l3,	%g5
	swap	[%l7 + 0x28],	%o0
loop_794:
	wr	%g1,	0x013F,	%ccr
	movg	%icc,	%o7,	%g6
	fmovsgu	%icc,	%f2,	%f2
	call	loop_795
	rdhpr	%htba,	%o2
	subcc	%i7,	%l0,	%i0
	fmovsleu	%xcc,	%f28,	%f11
loop_795:
	flushw
	fmovsul	%fcc3,	%f3,	%f3
	fmovrsgez	%l4,	%f26,	%f13
	movg	%fcc2,	%o4,	%o6
	tsubcctv	%i3,	0x0BBD,	%l1
	nop
	set	0x4C, %i1
	ldsw	[%l7 + %i1],	%g3
	bvc,a,pn	%xcc,	loop_796
	rdpr	%canrestore,	%i6
	fmovscc	%xcc,	%f13,	%f29
	call	loop_797
loop_796:
	call	loop_798
	movn	%fcc0,	0x28E,	%o3
	set	0x4C, %o1
	ldstuba	[%l7 + %o1] 0x10,	%i2
loop_797:
	movule	%fcc1,	%i5,	%o1
loop_798:
	call	loop_799
	movl	%fcc2,	%o5,	%g4
	movl	%fcc1,	%i1,	%l6
	nop
	set	0x18, %i4
	std	%i4,	[%l7 + %i4]
loop_799:
	call	loop_800
	tcs	%xcc,	0x1
	fpack32	%f8,	%f6,	%f20
	call	loop_801
loop_800:
	call	loop_802
	movcs	%icc,	%l5,	%l2
	rdhpr	%htba,	%g7
loop_801:
	srlx	%g2,	0x0D,	%l3
loop_802:
	fmovsa	%icc,	%f18,	%f16
	sdiv	%o0,	0x00,	%g1
	alignaddr	%o7,	%g6,	%o2
	udivcc	%g5,	0x00,	%i7
	fexpand	%f18,	%f24
	call	loop_803
	call	loop_804
	rdpr	%cansave,	%l0
	wrpr	%l4,	%i0,	%tick
loop_803:
	movue	%fcc1,	0x10F,	%o6
loop_804:
	bpos	%icc,	loop_805
	nop
	fitod	%f6,	%f26
	fdtoi	%f26,	%f13
	movne	%fcc1,	%o4,	%i3
	fxors	%f14,	%f1,	%f30
loop_805:
	sra	%g3,	%i6,	%o3
	call	loop_806
	movrlz	%l1,	%i5,	%i2
	fmovrslz	%o5,	%f25,	%f25
	call	loop_807
loop_806:
	smulcc	%g4,	0x10F2,	%i1
	call	loop_808
	ldd	[%l7 + 0x30],	%f0
loop_807:
	rd	%asi,	%o1
	nop
	fitos	%f1,	%f8
	fstox	%f8,	%f30
loop_808:
	prefetch	[%l7 + 0x14],	 3
	fmovrsgz	%i4,	%f0,	%f31
	call	loop_809
	andncc	%l5,	%l6,	%g7
	movrne	%l2,	%l3,	%o0
	fsrc1s	%f25,	%f30
loop_809:
	fblg	%fcc0,	loop_810
	wr 	%g0, 	0x4, 	%fprs
	tcs	%xcc,	0x0
	call	loop_811
loop_810:
	nop
	set	0x20, %i6
	stb	%g2,	[%l7 + %i6]
	call	loop_812
	call	loop_813
loop_811:
	ba,pn	%icc,	loop_814
	nop
	set	0x50, %o2
	ldd	[%l7 + %o2],	%f28
loop_812:
	call	loop_815
loop_813:
	fpsub32s	%f27,	%f20,	%f24
loop_814:
	udiv	%o2,	%g5,	%i7
	taddcc	%l0,	0x05EA,	%l4
loop_815:
	nop
	set	0x52, %o0
	ldub	[%l7 + %o0],	%i0
	fbl,a,pn	%fcc0,	loop_816
	nop
	set	0x68, %g2
	ldd	[%l7 + %g2],	%f2
	fmovsne	%xcc,	%f18,	%f11
	andn	%g6,	%o4,	%o6
loop_816:
	fpadd32s	%f19,	%f31,	%f21
	fmovdl	%xcc,	%f30,	%f30
	fnot2s	%f17,	%f11
	call	loop_817
	movue	%fcc3,	0x03B,	%g3
	call	loop_818
	call	loop_819
loop_817:
	srax	%i3,	0x17,	%i6
	fnands	%f19,	%f21,	%f18
loop_818:
	srax	%o3,	%l1,	%i2
loop_819:
	fbue,pn	%fcc1,	loop_820
	call	loop_821
	call	loop_822
	orcc	%o5,	%i5,	%g4
loop_820:
	fmovsne	%icc,	%f30,	%f18
loop_821:
	edge16l	%i1,	%i4,	%l5
loop_822:
	udivx	%o1,	%l6,	%g7
	fmovrdgez	%l2,	%f4,	%f0
	call	loop_823
	srax	%o0,	0x0E,	%g1
	call	loop_824
	fsrc1	%f12,	%f22
loop_823:
	stbar
	fmovrdlez	%l3,	%f30,	%f4
loop_824:
	array8	%o7,	%o2,	%g2
	nop
	set	0x54, %l3
	flush	%l7 + %l3
	fblg,a	%fcc1,	loop_825
	rd	%fprs,	%i7
	fxor	%f24,	%f30,	%f28
	bvs	%xcc,	loop_826
loop_825:
	call	loop_827
	call	loop_828
	call	loop_829
loop_826:
	fmovsvc	%icc,	%f25,	%f25
loop_827:
	nop
	add	%l7,	0x3C,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%g5
	casa	[%l6] 0x80,	%g5,	%l0
loop_828:
	fmovsue	%fcc1,	%f1,	%f29
loop_829:
	movgu	%xcc,	%l4,	%g6
	rd	%softint,	%o4
	nop
	setx	0xF3C0D2A1,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f31
	fsqrts	%f31,	%f10
	call	loop_830
	subcc	%i0,	0x1145,	%g3
	tsubcc	%i3,	%o6,	%o3
	fmovsgu	%xcc,	%f31,	%f14
loop_830:
	fand	%f2,	%f8,	%f16
	movg	%fcc3,	0x34E,	%i6
	call	loop_831
	edge8ln	%i2,	%o5,	%i5
	call	loop_832
	call	loop_833
loop_831:
	fmovsl	%fcc0,	%f7,	%f4
	orncc	%g4,	%i1,	%l1
loop_832:
	fbu,a,pn	%fcc1,	loop_834
loop_833:
	edge8n	%i4,	%o1,	%l6
	ba,a,pt	%xcc,	loop_835
	tpos	%xcc,	0x0
loop_834:
	tl	%icc,	0x0
	set	0x74, %o7
	stwa	%l5,	[%l7 + %o7] 0x88
loop_835:
	call	loop_836
	nop
	setx	0xB17DAB78BD05502B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x20]
	ldx	[%l7 + 0x20],	%fsr
	bge	%icc,	loop_837
	call	loop_838
loop_836:
	mulx	%g7,	0x0659,	%o0
	mulscc	%l2,	%l3,	%g1
loop_837:
	fbul,a,pn	%fcc2,	loop_839
loop_838:
	fornot2	%f22,	%f22,	%f24
	fxors	%f6,	%f9,	%f29
	faligndata	%f16,	%f0,	%f20
loop_839:
	movuge	%fcc3,	%o7,	%o2
	andcc	%i7,	0x0B46,	%g5
	call	loop_840
	fmovrdne	%l0,	%f26,	%f26
	call	loop_841
	call	loop_842
loop_840:
	fbe,a,pn	%fcc1,	loop_843
	fmovd	%f26,	%f14
loop_841:
	call	loop_844
loop_842:
	wr 	%g0, 	0x6, 	%fprs
loop_843:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fandnot2	%f22,	%f4,	%f24
loop_844:
	fpadd32	%f28,	%f26,	%f22
	fpsub16s	%f22,	%f8,	%f0
	fcmpd	%fcc1,	%f4,	%f2
	call	loop_845
	srlx	%g3,	0x04,	%i3
	fcmpd	%fcc2,	%f12,	%f22
loop_845:
	nop

	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 5:
!
!	Type l   	: 32
!	Type a   	: 29
!	Type x   	: 12
!	Type cti   	: 143
!	Type f   	: 148
!	Type i   	: 136
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
	set	0x6,	%g1
	set	0xC,	%g2
	set	0x9,	%g3
	set	0xC,	%g4
	set	0x5,	%g5
	set	0xB,	%g6
	set	0x5,	%g7
	!# Input registers
	set	-0xB,	%i0
	set	-0xE,	%i1
	set	-0xF,	%i2
	set	-0x8,	%i3
	set	-0x9,	%i4
	set	-0x4,	%i5
	set	-0x8,	%i6
	set	-0xA,	%i7
	!# Local registers
	set	0x13C3E625,	%l0
	set	0x03024F1A,	%l1
	set	0x4C4EAA41,	%l2
	set	0x0D8AF981,	%l3
	set	0x27634E7B,	%l4
	set	0x78621414,	%l5
	set	0x502C9BA1,	%l6
	!# Output registers
	set	0x0D6A,	%o0
	set	-0x10A8,	%o1
	set	0x0AB2,	%o2
	set	-0x15D0,	%o3
	set	0x1DE9,	%o4
	set	0x09FC,	%o5
	set	-0x061A,	%o6
	set	-0x047A,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x91C5092990AEF329)
	INIT_TH_FP_REG(%l7,%f2,0x402511393ED0807F)
	INIT_TH_FP_REG(%l7,%f4,0xF92E82099F2DD38A)
	INIT_TH_FP_REG(%l7,%f6,0xC63548B4FC696224)
	INIT_TH_FP_REG(%l7,%f8,0xF8131235A1EC7C86)
	INIT_TH_FP_REG(%l7,%f10,0x078A8E4300E905D4)
	INIT_TH_FP_REG(%l7,%f12,0xDD6D73B68A08BA8F)
	INIT_TH_FP_REG(%l7,%f14,0xD106A081C3DA7B58)
	INIT_TH_FP_REG(%l7,%f16,0x7A8F5A4BA163A19E)
	INIT_TH_FP_REG(%l7,%f18,0x7434B68B53BD3BD8)
	INIT_TH_FP_REG(%l7,%f20,0x6BC9B1E07EDD9AFB)
	INIT_TH_FP_REG(%l7,%f22,0x8DCF0C6A30229D94)
	INIT_TH_FP_REG(%l7,%f24,0x25982157D7AD1F71)
	INIT_TH_FP_REG(%l7,%f26,0x8D7422E16C30147A)
	INIT_TH_FP_REG(%l7,%f28,0xE1680FB547BA28F0)
	INIT_TH_FP_REG(%l7,%f30,0x44FCCC12CECA593A)

	!# Execute Main Diag ..

	fpsub32	%f18,	%f8,	%f20
	call	loop_846
	mova	%fcc0,	0x7D0,	%g6
	edge16	%o6,	%i6,	%i2
	fmovdlg	%fcc0,	%f12,	%f20
loop_846:
	call	loop_847
	call	loop_848
	fmovdo	%fcc3,	%f22,	%f12
	tsubcctv	%o3,	0x18F7,	%o5
loop_847:
	faligndata	%f10,	%f18,	%f22
loop_848:
	tne	%icc,	0x3
	movpos	%xcc,	0x725,	%i5
	tgu	%icc,	0x1
	taddcc	%g4,	0x1268,	%i1
	fzero	%f12
	bn,a	%icc,	loop_849
	call	loop_850
	fpsub32s	%f2,	%f3,	%f1
	movvc	%xcc,	%l1,	%i4
loop_849:
	fpsub16	%f12,	%f14,	%f24
loop_850:
	fexpand	%f23,	%f14
	std	%f6,	[%l7 + 0x10]
	movl	%fcc1,	%o1,	%l5
	fmovde	%fcc1,	%f14,	%f12
	call	loop_851
	movge	%icc,	0x458,	%l6
	fmovrdgez	%g7,	%f28,	%f24
	fmovsge	%fcc3,	%f23,	%f22
loop_851:
	tvs	%xcc,	0x5
	fxor	%f30,	%f0,	%f6
	array16	%l2,	%l3,	%g1
	fcmpgt16	%f4,	%f30,	%o0
	wr	%g0,	0x18,	%asi
	sta	%f14,	[%l7 + 0x6C] %asi
	fbul	%fcc2,	loop_852
	bpos	%icc,	loop_853
	rd	%sys_tick_cmpr,	%o2
	fblg,pn	%fcc2,	loop_854
loop_852:
	call	loop_855
loop_853:
	rdpr	%tba,	%i7
	brz,a	%g5,	loop_856
loop_854:
	fmovsvc	%icc,	%f24,	%f23
loop_855:
	call	loop_857
	andncc	%l0,	0x1567,	%o7
loop_856:
	add	%g2,	%o4,	%i0
	movre	%l4,	0x048,	%i3
loop_857:
	rdpr	%cwp,	%g3
	wrpr	%g6,	%i6,	%pil
	edge16	%o6,	%o3,	%i2
	siam	0x6
	movne	%fcc3,	%o5,	%i5
	fmovdgu	%xcc,	%f18,	%f6
	udivcc	%g4,	%l1,	%i1
	brz	%i4,	loop_858
	andcc	%l5,	0x0271,	%l6
	fnor	%f26,	%f14,	%f30
	movcs	%xcc,	0x021,	%g7
loop_858:
	sir	0x0F08
	std	%f24,	[%l7 + 0x40]
	movrgz	%l2,	%o1,	%l3
	fzeros	%f11
	orncc	%g1,	%o0,	%o2
	fmovscs	%xcc,	%f19,	%f29
	udivx	%i7,	%l0,	%o7
	fcmpne16	%f6,	%f12,	%g2
	movule	%fcc3,	0x552,	%g5
	nop
	fitod	%f16,	%f10
	fpsub16	%f0,	%f24,	%f20
	taddcctv	%i0,	0x11D4,	%o4
	fmovscs	%icc,	%f3,	%f14
	movrlez	%i3,	%l4,	%g3
	call	loop_859
	movpos	%icc,	%i6,	%o6
	edge32l	%o3,	%g6,	%o5
	call	loop_860
loop_859:
	call	loop_861
	call	loop_862
	rd	%ccr,	%i5
loop_860:
	movul	%fcc1,	0x716,	%i2
loop_861:
	call	loop_863
loop_862:
	rd	%y,	%l1
	add	%i1,	0x15BA,	%i4
	fmovdcs	%xcc,	%f30,	%f2
loop_863:
	tsubcctv	%g4,	0x1403,	%l5
	fzero	%f30
	fbge	%fcc1,	loop_864
	fnot1s	%f15,	%f19
	bmask	%l6,	%g7,	%l2
	fpsub16	%f2,	%f30,	%f10
loop_864:
	tne	%xcc,	0x2
	wr	%g0,	0x89,	%asi
	ldsha	[%l7 + 0x6C] %asi,	%o1
	call	loop_865
	fmovdle	%fcc1,	%f22,	%f26
	mulscc	%g1,	%o0,	%l3
	tne	%icc,	0x1
loop_865:
	ldd	[%l7 + 0x10],	%i6
	call	loop_866
	call	loop_867
	rdpr	%tba,	%o2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_866:
	fmovrdne	%l0,	%f18,	%f6
loop_867:
	nop
	wr	%g0,	0x89,	%asi
	lda	[%l7 + 0x30] %asi,	%f23
	call	loop_868
	fmovdcs	%xcc,	%f20,	%f28
	fmovso	%fcc2,	%f10,	%f26
	bvc,a,pn	%xcc,	loop_869
loop_868:
	sub	%i0,	%o4,	%g5
	call	loop_870
	movge	%xcc,	%i3,	%g3
loop_869:
	sub	%l4,	%o6,	%o3
	fbue,a,pn	%fcc1,	loop_871
loop_870:
	sir	0x08F6
	brlz	%i6,	loop_872
	call	loop_873
loop_871:
	call	loop_874
	fcmpeq32	%f10,	%f2,	%o5
loop_872:
	edge16l	%g6,	%i5,	%l1
loop_873:
	call	loop_875
loop_874:
	wr	%i1,	0x0935,	%y
	fmovs	%f0,	%f7
	call	loop_876
loop_875:
	fmovdul	%fcc0,	%f16,	%f14
	or	%i2,	0x00BB,	%i4
	wr	%g0,	0x19,	%asi
	lduba	[%l7 + 0x69] %asi,	%l5
loop_876:
	nop
	set	0x7C, %l1
	lduh	[%l7 + %l1],	%g4
	nop
	set	0x70, %g1
	ldd	[%l7 + %g1],	%i6
	bvc,a	%icc,	loop_877
	call	loop_878
	fpsub32s	%f17,	%f10,	%f23
	fmovdvc	%icc,	%f20,	%f4
loop_877:
	call	loop_879
loop_878:
	fones	%f11
	tgu	%icc,	0x1
	call	loop_880
loop_879:
	call	loop_881
	movrlez	%l2,	%g7,	%g1
	fbule,pn	%fcc0,	loop_882
loop_880:
	fmovsul	%fcc3,	%f13,	%f18
loop_881:
	movcs	%xcc,	%o1,	%o0
	edge8n	%i7,	%l3,	%o7
loop_882:
	call	loop_883
	call	loop_884
	call	loop_885
	siam	0x2
loop_883:
	call	loop_886
loop_884:
	call	loop_887
loop_885:
	tneg	%xcc,	0x5
	fnot1s	%f26,	%f27
loop_886:
	call	loop_888
loop_887:
	tg	%icc,	0x3
	wr 	%g0, 	0x4, 	%fprs
	call	loop_889
loop_888:
	fpsub16	%f12,	%f26,	%f28
	rd	%sys_tick_cmpr,	%i0
	movgu	%icc,	%o4,	%o2
loop_889:
	fcmple32	%f8,	%f12,	%g5
	nop
	setx loop_890, %l0, %l1
	jmpl %l1, %g3
	call	loop_891
	xnor	%l4,	%i3,	%o3
	call	loop_892
loop_890:
	bcs	%xcc,	loop_893
loop_891:
	edge8n	%i6,	%o5,	%o6
	bneg,a	%xcc,	loop_894
loop_892:
	tne	%xcc,	0x5
loop_893:
	call	loop_895
	call	loop_896
loop_894:
	call	loop_897
	bge,a	%icc,	loop_898
loop_895:
	call	loop_899
loop_896:
	fands	%f28,	%f22,	%f0
loop_897:
	rdhpr	%hsys_tick_cmpr,	%g6
loop_898:
	call	loop_900
loop_899:
	fbug,pt	%fcc2,	loop_901
	membar	0x4D
	movrne	%i5,	0x20C,	%i1
loop_900:
	call	loop_902
loop_901:
	fpmerge	%f31,	%f7,	%f20
	fbule,a,pt	%fcc1,	loop_903
	movle	%fcc2,	0x750,	%i2
loop_902:
	ta	%xcc,	0x2
	sdiv	%l1,	0x00,	%l5
loop_903:
	call	loop_904
	fmovrslz	%i4,	%f11,	%f10
	udiv	%l6,	%l2,	%g4
	call	loop_905
loop_904:
	fnor	%f2,	%f16,	%f22
	srlx	%g1,	0x1F,	%g7
	call	loop_906
loop_905:
	movn	%fcc3,	%o1,	%i7
	fmovda	%icc,	%f4,	%f6
	fandnot2s	%f11,	%f5,	%f27
loop_906:
	rd	%asi,	%o0
	fpadd32	%f2,	%f14,	%f2
	fmul8x16al	%f23,	%f23,	%f0
	rd	%fprs,	%o7
	tn	%icc,	0x5
	edge32	%l3,	%g2,	%i0
	fmovdn	%xcc,	%f30,	%f10
	edge16n	%o4,	%o2,	%l0
	array8	%g3,	%l4,	%g5
	wr	%g0,	0xd9,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	fxnor	%f14,	%f8,	%f18
	xorcc	%o3,	0x1815,	%i6
	movne	%fcc0,	0x1C1,	%o5
	add	%o6,	0x0543,	%i3
	fbge	%fcc0,	loop_907
	fmul8ulx16	%f6,	%f12,	%f2
	call	loop_908
	fmovsneg	%xcc,	%f31,	%f19
loop_907:
	srl	%g6,	%i1,	%i2
	nop
	fitos	%f12,	%f16
	fstod	%f16,	%f2
loop_908:
	call	loop_909
	fmovspos	%icc,	%f11,	%f10
	nop
	fitos	%f0,	%f27
	fstox	%f27,	%f2
	fxtos	%f2,	%f3
	movrlz	%l1,	0x2F6,	%l5
loop_909:
	and	%i4,	0x0158,	%l6
	call	loop_910
	movrgez	%l2,	0x194,	%g4
	call	loop_911
	call	loop_912
loop_910:
	fmovsuge	%fcc2,	%f27,	%f21
	siam	0x5
loop_911:
	fandnot2s	%f29,	%f0,	%f22
loop_912:
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	ldstub	[%l7 + 0x2E],	%g1
	fmovdgu	%xcc,	%f0,	%f2
	fbue,a,pn	%fcc0,	loop_913
	bneg,a,pn	%icc,	loop_914
	fbge	%fcc3,	loop_915
	call	loop_916
loop_913:
	fmovdlg	%fcc0,	%f0,	%f30
loop_914:
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
loop_915:
	call	loop_917
loop_916:
	fcmpeq16	%f20,	%f18,	%g7
	nop
	fitos	%f6,	%f20
	fstox	%f20,	%f24
	fmovscc	%icc,	%f6,	%f0
loop_917:
	fmovrsgz	%o1,	%f13,	%f23
	call	loop_918
	movleu	%icc,	%i7,	%o0
	call	loop_919
	siam	0x7
loop_918:
	fornot1	%f6,	%f2,	%f16
	call	loop_920
loop_919:
	fpmerge	%f0,	%f19,	%f26
	fmovrdlz	%i5,	%f4,	%f4
	tcc	%xcc,	0x2
loop_920:
	call	loop_921
	fmul8sux16	%f10,	%f30,	%f4
	call	loop_922
	call	loop_923
loop_921:
	call	loop_924
	call	loop_925
loop_922:
	call	loop_926
loop_923:
	call	loop_927
loop_924:
	call	loop_928
loop_925:
	fors	%f14,	%f30,	%f24
loop_926:
	fmovdpos	%xcc,	%f16,	%f20
loop_927:
	fmovdge	%fcc0,	%f2,	%f30
loop_928:
	wrpr 	%g0, 	0x0, 	%gl
	ta	%icc,	0x5
	movn	%xcc,	0x7DC,	%g2
	te	%xcc,	0x1
	brlez	%i0,	loop_929
	fpackfix	%f6,	%f27
	te	%icc,	0x2
	umulcc	%o4,	0x08EE,	%l0
loop_929:
	call	loop_930
	brnz,a	%o2,	loop_931
	call	loop_932
	smulcc	%l4,	0x1C9A,	%g5
loop_930:
	call	loop_933
loop_931:
	xorcc	%o3,	%g3,	%i6
loop_932:
	call	loop_934
	fsrc2s	%f7,	%f30
loop_933:
	nop
	set	0x6A, %o4
	sth	%o5,	[%l7 + %o4]
	call	loop_935
loop_934:
	std	%f10,	[%l7 + 0x38]
	call	loop_936
	call	loop_937
loop_935:
	fmul8x16au	%f0,	%f10,	%f0
	call	loop_938
loop_936:
	call	loop_939
loop_937:
	brlz,pn	%i3,	loop_940
	movre	%g6,	%i1,	%i2
loop_938:
	call	loop_941
loop_939:
	wr 	%g0, 	0x5, 	%fprs
loop_940:
	fmovrde	%o6,	%f22,	%f0
	fnors	%f6,	%f15,	%f12
loop_941:
	fmovspos	%xcc,	%f24,	%f10
	sir	0x0DF8
	fbuge,pt	%fcc1,	loop_942
	array8	%i4,	%l2,	%l6
	fmovdne	%fcc1,	%f20,	%f30
	bmask	%g1,	%g4,	%o1
loop_942:
	movo	%fcc2,	0x7AE,	%i7
	fmovdgu	%xcc,	%f16,	%f18
	fors	%f9,	%f28,	%f22
	movue	%fcc2,	%o0,	%g7
	call	loop_943
	bgu	%icc,	loop_944
	ld	[%l7 + 0x64],	%f19
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
loop_943:
	call	loop_945
loop_944:
	fmovsule	%fcc1,	%f11,	%f5
	call	loop_946
	call	loop_947
loop_945:
	bleu,pn	%icc,	loop_948
	call	loop_949
loop_946:
	call	loop_950
loop_947:
	fmovdle	%fcc2,	%f12,	%f22
loop_948:
	bleu,a	%icc,	loop_951
loop_949:
	xnor	%l3,	0x0CE6,	%o7
loop_950:
	udivx	%i5,	0x00,	%g2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_951:
	fmovsle	%xcc,	%f25,	%f12
	call	loop_952
	brz	%i0,	loop_953
	addc	%l0,	%o2,	%g5
	tle	%icc,	0x4
loop_952:
	nop
	set	0x40, %i3
	ldx	[%l7 + %i3],	%l4
loop_953:
	call	loop_954
	wr	%o3,	%g3,	%softint
	nop
	setx	0x1418E11A,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f4
	setx	0xC22F1C16,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f10
	fsubs	%f10,	%f4,	%f22
	fmovdue	%fcc0,	%f24,	%f6
loop_954:
	bl	%xcc,	loop_955
	call	loop_956
	fnors	%f17,	%f6,	%f11
	nop
	fitos	%f11,	%f7
	fstod	%f7,	%f18
loop_955:
	nop
	setx	0x574A98EA9CCF0790,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	fsqrtd	%f6,	%f26
loop_956:
	call	loop_957
	nop
	setx	0x13DF03F4CC54FC16,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0x14EB157B,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	fsmuld	%f2,	%f4,	%f2
	call	loop_958
	fmovdle	%xcc,	%f8,	%f30
loop_957:
	fbug,pt	%fcc3,	loop_959
	wr	%o5,	0x18C5,	%ccr
loop_958:
	fandnot2s	%f6,	%f1,	%f4
	fmovrslz	%i6,	%f23,	%f19
loop_959:
	fcmped	%fcc1,	%f0,	%f0
	fands	%f23,	%f23,	%f12
	wr	%g0,	0x19,	%asi
	swapa	[%l7 + 0x54] %asi,	%i3
	call	loop_960
	brlez,a	%g6,	loop_961
	fmovsne	%xcc,	%f16,	%f22
	movuge	%fcc0,	0x13B,	%i2
loop_960:
	rdhpr	%hsys_tick_cmpr,	%l1
loop_961:
	edge8l	%i1,	%l5,	%o6
	rdpr	%tba,	%l2
	call	loop_962
	call	loop_963
	movg	%icc,	%l6,	%i4
	xnorcc	%g4,	%o1,	%i7
loop_962:
	fmovrdne	%g1,	%f12,	%f6
loop_963:
	tgu	%icc,	0x1
	addc	%g7,	%o0,	%o7
	movge	%xcc,	0x5F2,	%i5
	call	loop_964
	nop
	setx	0x601CC6231599190A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0x7328FE046ABBF035,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	faddd	%f0,	%f30,	%f0
	fxor	%f14,	%f6,	%f4
	brlez	%l3,	loop_965
loop_964:
	call	loop_966
	call	loop_967
	call	loop_968
loop_965:
	movule	%fcc2,	0x7DB,	%o4
loop_966:
	call	loop_969
loop_967:
	fmovse	%fcc1,	%f15,	%f21
loop_968:
	fmovrdne	%i0,	%f2,	%f20
	rdhpr	%hsys_tick_cmpr,	%l0
loop_969:
	fmovde	%fcc1,	%f12,	%f10
	fandnot1	%f30,	%f0,	%f28
	addcc	%g2,	0x08B8,	%o2
	call	loop_970
	fbule,a,pn	%fcc0,	loop_971
	fmovrdlez	%l4,	%f0,	%f30
	tsubcc	%o3,	0x03E1,	%g5
loop_970:
	move	%xcc,	0x35F,	%o5
loop_971:
	brz,a	%g3,	loop_972
	call	loop_973
	fpack32	%f26,	%f16,	%f28
	srl	%i6,	0x1E,	%g6
loop_972:
	te	%xcc,	0x6
loop_973:
	smulcc	%i3,	0x16C4,	%i2
	call	loop_974
	edge8l	%i1,	%l5,	%o6
	brgez,a,pt	%l2,	loop_975
	call	loop_976
loop_974:
	ble,pt	%icc,	loop_977
	addc	%l1,	0x0EE1,	%l6
loop_975:
	te	%icc,	0x4
loop_976:
	call	loop_978
loop_977:
	nop
	setx loop_979, %l0, %l1
	jmpl %l1, %g4
	fpsub16	%f14,	%f24,	%f24
	nop
	set	0x28, %g7
	std	%f2,	[%l7 + %g7]
loop_978:
	sethi	0x00E7,	%o1
loop_979:
	nop
	setx	loop_980,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x032100001407,	%l0,	%l1
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
	ldd	[%l7 + 0x70],	%i4
	call	loop_981
	call	loop_982
loop_980:
	fmul8x16au	%f20,	%f18,	%f10
	fbul,a	%fcc3,	loop_983
loop_981:
	flush	%l7 + 0x74
loop_982:
	bgu,a	%xcc,	loop_984
	bvc,a,pt	%xcc,	loop_985
loop_983:
	fxors	%f21,	%f5,	%f18
	rdpr	%wstate,	%g1
loop_984:
	fmovscs	%icc,	%f5,	%f1
loop_985:
	nop
	wr	%g0,	0x0c,	%asi
	stba	%g7,	[%l7 + 0x1A] %asi
	call	loop_986
	call	loop_987
	movge	%fcc3,	%i7,	%o7
	fmovscc	%icc,	%f8,	%f13
loop_986:
	movrlez	%i5,	%l3,	%o0
loop_987:
	fble	%fcc2,	loop_988
	ldx	[%l7 + 0x78],	%o4
	sdiv	%l0,	%i0,	%g2
	call	loop_989
loop_988:
	sll	%o2,	%l4,	%o3
	bleu	%icc,	loop_990
	edge32l	%o5,	%g5,	%g3
loop_989:
	rdpr	%canrestore,	%g6
	call	loop_991
loop_990:
	call	loop_992
	fxor	%f8,	%f10,	%f6
	fmovdue	%fcc2,	%f20,	%f20
loop_991:
	call	loop_993
loop_992:
	sll	%i6,	0x01,	%i2
	bmask	%i3,	%l5,	%i1
	sub	%o6,	%l2,	%l6
loop_993:
	fbul,a,pt	%fcc3,	loop_994
	movcs	%icc,	0x52D,	%g4
	call	loop_995
	array8	%o1,	%l1,	%i4
loop_994:
	ldsh	[%l7 + 0x7A],	%g7
	fsrc1s	%f31,	%f2
loop_995:
	call	loop_996
	call	loop_997
	call	loop_998
	flushw
loop_996:
	membar	0x63
loop_997:
	fbu	%fcc1,	loop_999
loop_998:
	fbne,a,pn	%fcc1,	loop_1000
	nop
	setx	0x36AD138B731499C1,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	fsqrtd	%f20,	%f18
	nop
	setx	loop_1001,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x031200001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_999:
	mulx	%i7,	%o7,	%g1
loop_1000:
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	fmovdo	%fcc1,	%f6,	%f8
loop_1001:
	movvc	%icc,	0x290,	%i5
	movvs	%icc,	%o0,	%l3
	call	loop_1002
	fpadd32s	%f6,	%f25,	%f25
	rdhpr	%hsys_tick_cmpr,	%l0
	sethi	0x18F5,	%i0
loop_1002:
	movleu	%xcc,	%o4,	%g2
	edge32n	%o2,	%l4,	%o5
	call	loop_1003
	fnands	%f31,	%f7,	%f25
	movrlz	%g5,	0x31A,	%o3
	call	loop_1004
loop_1003:
	fmovduge	%fcc1,	%f10,	%f18
	call	loop_1005
	for	%f18,	%f16,	%f8
loop_1004:
	fzero	%f16
	smul	%g6,	%g3,	%i2
loop_1005:
	sdiv	%i3,	0x00,	%l5
	call	loop_1006
	call	loop_1007
	call	loop_1008
	call	loop_1009
loop_1006:
	movrlz	%i6,	%i1,	%o6
loop_1007:
	fpack32	%f20,	%f0,	%f2
loop_1008:
	call	loop_1010
loop_1009:
	fmovd	%f6,	%f28
	move	%fcc0,	%l6,	%g4
	fmovslg	%fcc1,	%f5,	%f6
loop_1010:
	call	loop_1011
	nop
	setx	0x18CCA8B199BC7E68,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0x077CD64E,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	fsmuld	%f20,	%f14,	%f10
	array8	%l2,	%l1,	%i4
	fand	%f28,	%f24,	%f6
loop_1011:
	nop
	set	0x48, %l0
	prefetcha	[%l7 + %l0] 0x10,	 1
	edge32	%o1,	%i7,	%o7
	call	loop_1012
	srl	%i5,	0x0F,	%o0
	taddcctv	%l3,	%g1,	%l0
	set	0x40, %i5
	ldda	[%l7 + %i5] 0x88,	%o4
loop_1012:
	nop
	fitos	%f5,	%f19
	fstox	%f19,	%f20
	fxtos	%f20,	%f30
	call	loop_1013
	call	loop_1014
	stbar
	membar	0x29
loop_1013:
	call	loop_1015
loop_1014:
	tle	%xcc,	0x0
	call	loop_1016
	udiv	%g2,	%o2,	%i0
loop_1015:
	nop

loop_1016:
	nop

	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 6:
!
!	Type l   	: 25
!	Type a   	: 25
!	Type x   	: 9
!	Type cti   	: 171
!	Type f   	: 128
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
	set	0x7,	%g1
	set	0x8,	%g2
	set	0xB,	%g3
	set	0x0,	%g4
	set	0x6,	%g5
	set	0xC,	%g6
	set	0xF,	%g7
	!# Input registers
	set	-0x2,	%i0
	set	-0x8,	%i1
	set	-0x8,	%i2
	set	-0x5,	%i3
	set	-0x0,	%i4
	set	-0xC,	%i5
	set	-0xE,	%i6
	set	-0xC,	%i7
	!# Local registers
	set	0x4892180B,	%l0
	set	0x05D2BC6F,	%l1
	set	0x3C47BAC2,	%l2
	set	0x09EC3E96,	%l3
	set	0x7CF2852F,	%l4
	set	0x1EE77C66,	%l5
	set	0x664C7426,	%l6
	!# Output registers
	set	-0x1066,	%o0
	set	0x0BC1,	%o1
	set	-0x08D8,	%o2
	set	0x0285,	%o3
	set	-0x18CE,	%o4
	set	-0x1651,	%o5
	set	0x11CA,	%o6
	set	0x0528,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x91C5092990AEF329)
	INIT_TH_FP_REG(%l7,%f2,0x402511393ED0807F)
	INIT_TH_FP_REG(%l7,%f4,0xF92E82099F2DD38A)
	INIT_TH_FP_REG(%l7,%f6,0xC63548B4FC696224)
	INIT_TH_FP_REG(%l7,%f8,0xF8131235A1EC7C86)
	INIT_TH_FP_REG(%l7,%f10,0x078A8E4300E905D4)
	INIT_TH_FP_REG(%l7,%f12,0xDD6D73B68A08BA8F)
	INIT_TH_FP_REG(%l7,%f14,0xD106A081C3DA7B58)
	INIT_TH_FP_REG(%l7,%f16,0x7A8F5A4BA163A19E)
	INIT_TH_FP_REG(%l7,%f18,0x7434B68B53BD3BD8)
	INIT_TH_FP_REG(%l7,%f20,0x6BC9B1E07EDD9AFB)
	INIT_TH_FP_REG(%l7,%f22,0x8DCF0C6A30229D94)
	INIT_TH_FP_REG(%l7,%f24,0x25982157D7AD1F71)
	INIT_TH_FP_REG(%l7,%f26,0x8D7422E16C30147A)
	INIT_TH_FP_REG(%l7,%f28,0xE1680FB547BA28F0)
	INIT_TH_FP_REG(%l7,%f30,0x44FCCC12CECA593A)

	!# Execute Main Diag ..

	movvs	%xcc,	%o5,	%l4
	rd	%ccr,	%o3
	call	loop_1017
	fbul,pn	%fcc2,	loop_1018
	fands	%f7,	%f16,	%f28
	orn	%g5,	0x01EE,	%g6
loop_1017:
	movvs	%icc,	%i2,	%i3
loop_1018:
	wr	%l5,	%i6,	%y
	call	loop_1019
	mova	%xcc,	%i1,	%o6
	nop
	setx	0xF11E85B85DF2106A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0x4812FEFF7A12A950,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	fmuld	%f28,	%f24,	%f24
	alignaddr	%g3,	%l6,	%l2
loop_1019:
	fmovrdlez	%g4,	%f16,	%f26
	call	loop_1020
	be	%xcc,	loop_1021
	bvs,pt	%xcc,	loop_1022
	fmuld8sux16	%f31,	%f30,	%f18
loop_1020:
	call	loop_1023
loop_1021:
	fmovrdlez	%i4,	%f30,	%f22
loop_1022:
	smul	%l1,	0x0A3D,	%g7
	sll	%i7,	0x16,	%o7
loop_1023:
	nop
	fitod	%f12,	%f30
	fdtoi	%f30,	%f9
	fmovso	%fcc3,	%f13,	%f3
	add	%l7,	0x40,	%l6
	wr	%g0,	0x04,	%asi
	ldxa	[%l6] %asi,	%o1
	casxa	[%l6] %asi,	%o1,	%o0
	sdiv	%l3,	%i5,	%g1
	fmovrdgz	%o4,	%f20,	%f24
	ta	%icc,	0x5
	fcmps	%fcc0,	%f8,	%f20
	movrgez	%g2,	0x1B9,	%l0
	tsubcc	%o2,	0x177C,	%i0
	smul	%o5,	%l4,	%g5
	set	0x40, %l5
	stda	%f0,	[%l7 + %l5] 0x0c
	fandnot2s	%f14,	%f9,	%f9
	call	loop_1024
	fmovdue	%fcc2,	%f14,	%f16
	call	loop_1025
	udiv	%o3,	0x00,	%i2
loop_1024:
	edge32ln	%g6,	%i3,	%l5
	nop
	setx	0xE016AD68,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f26
	setx	0x02C604C6,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f29
	fdivs	%f29,	%f26,	%f4
loop_1025:
	udivx	%i6,	%o6,	%g3
	nop
	setx	0xD652C0EE,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f15
	setx	0xA141908A,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f2
	fmuls	%f2,	%f15,	%f26
	fpsub16s	%f30,	%f11,	%f7
	call	loop_1026
	alignaddr	%i1,	%l2,	%g4
	tl	%icc,	0x4
	fmovdlg	%fcc2,	%f10,	%f30
loop_1026:
	call	loop_1027
	fmovdule	%fcc2,	%f24,	%f8
	fmovdu	%fcc2,	%f18,	%f10
	sdivcc	%i4,	0x00,	%l1
loop_1027:
	udiv	%l6,	%i7,	%o7
	fble,pt	%fcc0,	loop_1028
	fpackfix	%f12,	%f28
	bpos,pn	%icc,	loop_1029
	edge16	%o1,	%o0,	%g7
loop_1028:
	bcs,pt	%xcc,	loop_1030
	udiv	%l3,	%g1,	%o4
loop_1029:
	movleu	%icc,	%g2,	%i5
	fmovdlg	%fcc1,	%f6,	%f26
loop_1030:
	edge16l	%o2,	%i0,	%l0
	fcmpes	%fcc1,	%f9,	%f1
	fmovda	%fcc3,	%f14,	%f18
	call	loop_1031
	call	loop_1032
	call	loop_1033
	call	loop_1034
loop_1031:
	sra	%o5,	0x02,	%l4
loop_1032:
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
loop_1033:
	wr	%o3,	%g5,	%y
loop_1034:
	be,a	%xcc,	loop_1035
	srlx	%i2,	%i3,	%l5
	fcmple16	%f8,	%f20,	%g6
	bn,pt	%xcc,	loop_1036
loop_1035:
	fmovscs	%icc,	%f18,	%f20
	tvs	%icc,	0x2
	fmovdg	%icc,	%f18,	%f12
loop_1036:
	fsrc2	%f6,	%f26
	movrlez	%o6,	0x126,	%g3
	fmovdge	%icc,	%f4,	%f0
	call	loop_1037
	nop
	fitod	%f4,	%f8
	fdtox	%f8,	%f14
	call	loop_1038
	nop
	setx	0xC046BCEF8866F267,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0x3A072EC8,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	fsmuld	%f14,	%f16,	%f18
loop_1037:
	fmovdle	%fcc0,	%f8,	%f24
	call	loop_1039
loop_1038:
	nop
	setx	0x50D7B6D33649ACC3,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	fsqrtd	%f14,	%f2
	fandnot2	%f24,	%f24,	%f4
	call	loop_1040
loop_1039:
	call	loop_1041
	fxnor	%f22,	%f12,	%f4
	fandnot2	%f28,	%f18,	%f12
loop_1040:
	edge8n	%i1,	%l2,	%i6
loop_1041:
	fmovrsgez	%g4,	%f22,	%f19
	fmovrslz	%l1,	%f20,	%f23
	call	loop_1042
	rdpr	%otherwin,	%i4
	sdiv	%l6,	%i7,	%o1
	fnot1	%f2,	%f14
loop_1042:
	fxnors	%f13,	%f7,	%f27
	sllx	%o0,	0x1A,	%o7
	wrpr	%g7,	0x022E,	%tick
	for	%f16,	%f10,	%f0
	rdpr	%pil,	%l3
	fmul8ulx16	%f0,	%f18,	%f20
	fmovsl	%icc,	%f28,	%f13
	ldstub	[%l7 + 0x77],	%g1
	sdivcc	%g2,	%i5,	%o2
	orcc	%o4,	0x037D,	%l0
	fxnor	%f10,	%f18,	%f12
	call	loop_1043
	udiv	%o5,	0x00,	%l4
	call	loop_1044
	fmovrsgez	%o3,	%f26,	%f19
loop_1043:
	fmovdvs	%xcc,	%f12,	%f10
	movuge	%fcc3,	%i0,	%i2
loop_1044:
	call	loop_1045
	call	loop_1046
	fands	%f26,	%f7,	%f0
	rdhpr	%ver,	%i3
loop_1045:
	std	%l4,	[%l7 + 0x68]
loop_1046:
	taddcctv	%g6,	0x150D,	%g5
	call	loop_1047
	movug	%fcc3,	0x64D,	%g3
	call	loop_1048
	nop
	setx	0xBCC6C745,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f19
	setx	0x79181854,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f2
	fadds	%f2,	%f19,	%f10
loop_1047:
	bge	%xcc,	loop_1049
	nop
	fitos	%f7,	%f25
	fstoi	%f25,	%f23
loop_1048:
	call	loop_1050
	or	%i1,	0x050F,	%o6
loop_1049:
	edge8	%i6,	%g4,	%l2
	call	loop_1051
loop_1050:
	call	loop_1052
	movn	%xcc,	0x4AC,	%l1
	movle	%icc,	0x2C0,	%i4
loop_1051:
	fmovrde	%l6,	%f2,	%f22
loop_1052:
	fmovsu	%fcc0,	%f16,	%f10
	call	loop_1053
	bgu,a	%icc,	loop_1054
	rdhpr	%hpstate,	%i7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x268, 	%hsys_tick_cmpr
loop_1053:
	fmul8x16	%f10,	%f14,	%f22
loop_1054:
	call	loop_1055
	call	loop_1056
	edge16l	%o7,	%o0,	%l3
	move	%xcc,	0x2D3,	%g1
loop_1055:
	fba	%fcc0,	loop_1057
loop_1056:
	fpadd32	%f4,	%f4,	%f18
	tl	%xcc,	0x2
	movne	%xcc,	%g7,	%g2
loop_1057:
	movgu	%icc,	%o2,	%o4
	call	loop_1058
	fand	%f22,	%f10,	%f12
	fmul8ulx16	%f16,	%f26,	%f10
	sra	%i5,	0x14,	%o5
loop_1058:
	bg,a	%xcc,	loop_1059
	movcc	%icc,	0x735,	%l4
	andcc	%l0,	0x028B,	%o3
	edge8	%i0,	%i2,	%i3
loop_1059:
	movrgez	%g6,	0x302,	%g5
	call	loop_1060
	fornot1	%f12,	%f12,	%f18
	call	loop_1061
	nop
	fitod	%f4,	%f28
	fdtoi	%f28,	%f13
loop_1060:
	movug	%fcc1,	0x254,	%l5
	fmovdule	%fcc0,	%f10,	%f2
loop_1061:
	call	loop_1062
	lduh	[%l7 + 0x6C],	%i1
	fmovdug	%fcc1,	%f4,	%f6
	nop
	fitos	%f2,	%f25
	fstox	%f25,	%f24
	fxtos	%f24,	%f4
loop_1062:
	fmovrse	%o6,	%f3,	%f10
	fmovdne	%fcc3,	%f0,	%f6
	movl	%fcc3,	%g3,	%i6
	call	loop_1063
	movule	%fcc2,	0x16F,	%g4
	tpos	%icc,	0x0
	tpos	%xcc,	0x0
loop_1063:
	call	loop_1064
	nop
	set	0x34, %l4
	ldsw	[%l7 + %l4],	%l2
	call	loop_1065
	call	loop_1066
loop_1064:
	fors	%f18,	%f15,	%f27
	edge8ln	%i4,	%l6,	%i7
loop_1065:
	fxor	%f24,	%f26,	%f20
loop_1066:
	fors	%f30,	%f30,	%f9
	tle	%xcc,	0x7
	fandnot1s	%f1,	%f1,	%f23
	call	loop_1067
	fandnot1s	%f28,	%f18,	%f15
	fmovrslez	%o1,	%f12,	%f6
	movul	%fcc1,	0x7E8,	%o7
loop_1067:
	fbn,a	%fcc3,	loop_1068
	call	loop_1069
	nop
	set	0x78, %i0
	ldx	[%l7 + %i0],	%o0
	fble	%fcc1,	loop_1070
loop_1068:
	call	loop_1071
loop_1069:
	nop
	setx	0xAD086D5DC7219AA7,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0xC85BA2D2,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	fsmuld	%f10,	%f10,	%f0
	call	loop_1072
loop_1070:
	fmovsa	%fcc2,	%f8,	%f3
loop_1071:
	fcmpeq16	%f12,	%f14,	%l1
	movuge	%fcc0,	%l3,	%g1
loop_1072:
	fmuld8ulx16	%f27,	%f4,	%f18
	wrpr	%g2,	0x0E5D,	%cwp
	call	loop_1073
	alignaddr	%o2,	%o4,	%g7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	bg,pn	%icc,	loop_1074
loop_1073:
	edge16n	%o5,	%l4,	%l0
	fpmerge	%f6,	%f12,	%f4
	movg	%xcc,	%o3,	%i2
loop_1074:
	fmovsg	%xcc,	%f12,	%f13
	mova	%icc,	0x05B,	%i3
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	call	loop_1075
	call	loop_1076
	call	loop_1077
	fmovrde	%g6,	%f24,	%f20
loop_1075:
	fands	%f3,	%f22,	%f18
loop_1076:
	movug	%fcc0,	0x348,	%i0
loop_1077:
	fcmpgt32	%f12,	%f6,	%l5
	fand	%f16,	%f2,	%f30
	fmovdl	%fcc3,	%f28,	%f24
	call	loop_1078
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	call	loop_1079
	call	loop_1080
loop_1078:
	nop
	setx loop_1081, %l0, %l1
	jmpl %l1, %g5
	movre	%i1,	%o6,	%g3
loop_1079:
	tcs	%xcc,	0x6
loop_1080:
	movle	%fcc3,	0x044,	%g4
loop_1081:
	fmovsneg	%xcc,	%f22,	%f28
	sllx	%i6,	0x1E,	%l2
	fmovdug	%fcc0,	%f2,	%f12
	taddcc	%l6,	%i7,	%o1
	fand	%f10,	%f30,	%f26
	edge16n	%i4,	%o0,	%l1
	fandnot2s	%f29,	%f9,	%f25
	wrpr	%l3,	0x1CFF,	%tick
	nop
	fitos	%f7,	%f21
	set	0x6E, %o5
	ldsha	[%l7 + %o5] 0x11,	%o7
	rdhpr	%hintp,	%g2
	set	0x2F, %g4
	lduba	[%l7 + %g4] 0x18,	%o2
	wr	%o4,	%g1,	%ccr
	array16	%g7,	%o5,	%l4
	fmovrdgz	%i5,	%f20,	%f18
	nop
	fitos	%f4,	%f8
	fstod	%f8,	%f2
	call	loop_1082
	call	loop_1083
	movvc	%icc,	0x539,	%o3
	faligndata	%f20,	%f22,	%f30
loop_1082:
	tleu	%xcc,	0x5
loop_1083:
	smul	%i2,	0x02BA,	%i3
	rdhpr	%ver,	%l0
	call	loop_1084
	movug	%fcc1,	%i0,	%g6
	edge32	%g5,	%i1,	%l5
	call	loop_1085
loop_1084:
	call	loop_1086
	call	loop_1087
	call	loop_1088
loop_1085:
	fcmps	%fcc0,	%f10,	%f7
loop_1086:
	call	loop_1089
loop_1087:
	sllx	%o6,	0x04,	%g4
loop_1088:
	call	loop_1090
	subccc	%g3,	0x1CF1,	%l2
loop_1089:
	nop
	fitod	%f20,	%f20
	call	loop_1091
loop_1090:
	call	loop_1092
	call	loop_1093
	call	loop_1094
loop_1091:
	smul	%l6,	0x155D,	%i6
loop_1092:
	call	loop_1095
loop_1093:
	movvs	%xcc,	%i7,	%i4
loop_1094:
	fbug,a,pn	%fcc2,	loop_1096
	flushw
loop_1095:
	andcc	%o0,	%o1,	%l3
	call	loop_1097
loop_1096:
	call	loop_1098
	call	loop_1099
	call	loop_1100
loop_1097:
	fmovdvc	%icc,	%f16,	%f6
loop_1098:
	alignaddr	%o7,	%l1,	%o2
loop_1099:
	call	loop_1101
loop_1100:
	fpadd16	%f22,	%f22,	%f6
	fmovda	%fcc0,	%f24,	%f26
	or	%g2,	0x0E7B,	%o4
loop_1101:
	call	loop_1102
	tsubcc	%g7,	0x1E30,	%g1
	nop
	setx	0x8B513FF79C3DAA29,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	fsqrtd	%f26,	%f18
	fmovsg	%fcc1,	%f7,	%f25
loop_1102:
	tsubcc	%o5,	0x07C2,	%i5
	call	loop_1103
	fmovdleu	%xcc,	%f12,	%f10
	fcmped	%fcc2,	%f14,	%f6
	movpos	%icc,	%o3,	%i2
loop_1103:
	nop
	fitos	%f30,	%f2
	fbue,a,pn	%fcc2,	loop_1104
	nop
	set	0x08, %i2
	ldx	[%l7 + %i2],	%l4
	call	loop_1105
	fmovrsne	%i3,	%f5,	%f24
loop_1104:
	movue	%fcc2,	0x448,	%l0
	fmovda	%fcc0,	%f24,	%f18
loop_1105:
	sth	%i0,	[%l7 + 0x68]
	ldsb	[%l7 + 0x49],	%g6
	edge16ln	%i1,	%l5,	%o6
	fsrc1s	%f8,	%f29
	call	loop_1106
	fmovrde	%g4,	%f16,	%f30
	call	loop_1107
	te	%xcc,	0x5
loop_1106:
	call	loop_1108
	call	loop_1109
loop_1107:
	wrpr	%g3,	%g5,	%tick
	swap	[%l7 + 0x3C],	%l2
loop_1108:
	call	loop_1110
loop_1109:
	alignaddr	%l6,	%i7,	%i4
	call	loop_1111
	call	loop_1112
loop_1110:
	call	loop_1113
	nop
	fitod	%f4,	%f2
	fdtos	%f2,	%f22
loop_1111:
	wr	%i6,	%o0,	%sys_tick
loop_1112:
	call	loop_1114
loop_1113:
	orn	%l3,	%o1,	%l1
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	call	loop_1115
loop_1114:
	fzero	%f30
	fmovdug	%fcc1,	%f18,	%f18
	srl	%o2,	0x1F,	%g2
loop_1115:
	edge16ln	%o4,	%o7,	%g7
	call	loop_1116
	call	loop_1117
	fpsub32	%f26,	%f28,	%f28
	movo	%fcc3,	0x31B,	%o5
loop_1116:
	addc	%i5,	0x0631,	%o3
loop_1117:
	call	loop_1118
	fbg,a,pt	%fcc3,	loop_1119
	call	loop_1120
	fbge	%fcc0,	loop_1121
loop_1118:
	call	loop_1122
loop_1119:
	tcc	%xcc,	0x3
loop_1120:
	fpsub16s	%f3,	%f27,	%f0
loop_1121:
	fpadd32	%f0,	%f0,	%f30
loop_1122:
	nop
	set	0x3C, %g3
	lduw	[%l7 + %g3],	%g1
	sllx	%l4,	%i3,	%l0
	set	0x68, %o6
	stxa	%i0,	[%l7 + %o6] 0x89
	orn	%i2,	%g6,	%l5
	rd	%pc,	%o6
	sdivx	%g4,	%i1,	%g5
	wr	%g0,	0x2b,	%asi
	stwa	%g3,	[%l7 + 0x18] %asi
	membar	#Sync
	sllx	%l2,	%i7,	%l6
	nop
	setx	0x4653158923F96B8A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0xEC09DFDE4C865DB9,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	fdivd	%f2,	%f16,	%f8
	call	loop_1123
	movre	%i6,	%o0,	%i4
	bpos,a	%icc,	loop_1124
	fcmpne16	%f30,	%f2,	%o1
loop_1123:
	rd	%pc,	%l3
	edge8	%o2,	%l1,	%g2
loop_1124:
	andcc	%o4,	0x1B29,	%g7
	fmovdg	%icc,	%f24,	%f10
	edge16n	%o7,	%i5,	%o5
	fands	%f12,	%f7,	%f8
	call	loop_1125
	call	loop_1126
	call	loop_1127
	call	loop_1128
loop_1125:
	call	loop_1129
loop_1126:
	fmovdl	%fcc1,	%f12,	%f30
loop_1127:
	tsubcc	%g1,	%o3,	%i3
loop_1128:
	call	loop_1130
loop_1129:
	call	loop_1131
	call	loop_1132
	smulcc	%l4,	0x0541,	%l0
loop_1130:
	fmovdvs	%icc,	%f10,	%f4
loop_1131:
	nop
	setx	0xCF004CAC6EB0AB06,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	fsqrtd	%f14,	%f8
loop_1132:
	call	loop_1133
	call	loop_1134
	edge16l	%i2,	%i0,	%l5
	for	%f18,	%f24,	%f14
loop_1133:
	fsrc1s	%f25,	%f6
loop_1134:
	movuge	%fcc3,	0x765,	%o6
	call	loop_1135
	fmul8sux16	%f6,	%f18,	%f18
	fpack16	%f28,	%f1
	call	loop_1136
loop_1135:
	fpadd32s	%f26,	%f30,	%f18
	fones	%f1
	nop
	fitos	%f2,	%f2
	fstod	%f2,	%f16
loop_1136:
	call	loop_1137
	edge32	%g4,	%i1,	%g6
	fmovdle	%fcc2,	%f18,	%f6
	fcmpd	%fcc2,	%f16,	%f6
loop_1137:
	fnot2s	%f11,	%f8
	edge8n	%g3,	%g5,	%l2
	rdpr	%wstate,	%l6
	edge8	%i7,	%i6,	%i4
	fmovsug	%fcc1,	%f10,	%f5
	call	loop_1138
	nop
	setx	0x9BDD55861FCB4FE1,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0x2BD73BA0F675A2ED,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	fmuld	%f26,	%f26,	%f20
	subccc	%o1,	%o0,	%o2
	fmovsvs	%xcc,	%f11,	%f11
loop_1138:
	fnot2	%f4,	%f24
	call	loop_1139
	fmovrdgz	%l3,	%f26,	%f26
	tleu	%xcc,	0x0
	bcs,a	%icc,	loop_1140
loop_1139:
	smulcc	%l1,	%g2,	%o4
	or	%g7,	%o7,	%i5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
loop_1140:
	addcc	%i3,	0x1A7F,	%l4
	fmovsle	%fcc0,	%f21,	%f3
	call	loop_1141
	fmovsvc	%icc,	%f15,	%f15
	set	0x40, %o3
	ldda	[%l7 + %o3] 0x0c,	%f16
loop_1141:
	rd	%sys_tick_cmpr,	%o5
	fmovda	%icc,	%f18,	%f30
	call	loop_1142
	tvc	%icc,	0x5
	call	loop_1143
	call	loop_1144
loop_1142:
	bvs,a	%xcc,	loop_1145
	nop
	setx	0x8A379032D7A982F7,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0xADA9B575F56FB6C4,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	fmuld	%f4,	%f26,	%f22
loop_1143:
	call	loop_1146
loop_1144:
	call	loop_1147
loop_1145:
	add	%l0,	%i0,	%l5
	fsrc1s	%f5,	%f23
loop_1146:
	ldstub	[%l7 + 0x28],	%o6
loop_1147:
	call	loop_1148
	brz,a	%i2,	loop_1149
	fmovd	%f0,	%f18
	rdhpr	%ver,	%g4
loop_1148:
	brlz,a,pn	%g6,	loop_1150
loop_1149:
	fcmpgt32	%f4,	%f8,	%i1
	movuge	%fcc1,	0x705,	%g3
	pdist	%f20,	%f24,	%f12
loop_1150:
	bvs,a	%xcc,	loop_1151
	call	loop_1152
	fmovscc	%icc,	%f31,	%f16
	movu	%fcc0,	0x74B,	%g5
loop_1151:
	fbue,a,pn	%fcc0,	loop_1153
loop_1152:
	add	%l2,	%l6,	%i7
	fcmped	%fcc2,	%f24,	%f18
	fmovspos	%icc,	%f15,	%f22
loop_1153:
	nop
	setx	0x86733F6E,	%l0,	%l6
	st	%l6,	[%l7 + 0x40]
	ld	[%l7 + 0x40],	%fsr
	tgu	%xcc,	0x2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	fcmpgt32	%f8,	%f22,	%o1
	wr	%i6,	%o2,	%sys_tick
	fmovrdlez	%o0,	%f10,	%f0
	fble,pn	%fcc1,	loop_1154
	call	loop_1155
	siam	0x2
	call	loop_1156
loop_1154:
	umul	%l3,	0x0D8D,	%g2
loop_1155:
	ble,a	%icc,	loop_1157
	fmovsg	%fcc0,	%f29,	%f22
loop_1156:
	call	loop_1158
	srl	%l1,	0x07,	%o4
loop_1157:
	nop
	set	0x1F, %g6
	stb	%o7,	[%l7 + %g6]
	mulx	%g7,	0x0CF7,	%g1
loop_1158:
	nop
	set	0x78, %g5
	sta	%f20,	[%l7 + %g5] 0x04
	movneg	%xcc,	%i5,	%i3
	tge	%icc,	0x6
	call	loop_1159
	fexpand	%f18,	%f6
	fpsub16s	%f18,	%f26,	%f10
	movne	%fcc3,	0x2D2,	%l4
loop_1159:
	sllx	%o5,	0x1E,	%l0
	nop
	setx	0xD78A58B25AE070EA,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0xAD29520A7E58D171,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	faddd	%f6,	%f16,	%f20
	fsrc2	%f2,	%f30
	nop
	fitod	%f10,	%f8
	fdtox	%f8,	%f2
	fxtod	%f2,	%f24
	edge8l	%i0,	%l5,	%o6
	array32	%i2,	%g4,	%o3
	movrgz	%g6,	0x317,	%g3
	call	loop_1160
	call	loop_1161
	tn	%xcc,	0x3
	udiv	%g5,	%i1,	%l2
loop_1160:
	fmovsu	%fcc1,	%f13,	%f2
loop_1161:
	call	loop_1162
	fmovde	%icc,	%f22,	%f18
	fcmple32	%f22,	%f16,	%l6
	call	loop_1163
loop_1162:
	movuge	%fcc0,	0x775,	%i7
	tne	%xcc,	0x4
	call	loop_1164
loop_1163:
	fmovsneg	%icc,	%f4,	%f15
	brgez,a	%o1,	loop_1165
	fmovsuge	%fcc1,	%f0,	%f29
loop_1164:
	call	loop_1166
	taddcc	%i4,	%i6,	%o2
loop_1165:
	call	loop_1167
	fmovdule	%fcc3,	%f22,	%f2
loop_1166:
	call	loop_1168
loop_1167:
	nop

loop_1168:
	nop

	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 7:
!
!	Type l   	: 21
!	Type a   	: 25
!	Type x   	: 8
!	Type cti   	: 152
!	Type f   	: 152
!	Type i   	: 142
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


	EXIT_GOOD	/* test finish  */

/************************************************************************
   Test case data start
 ************************************************************************/
.data
user_data_start:
scratch_area:
.word 0x5DFEB27A
.word 0x552F32C5
.word 0x986A671A
.word 0x9AECE49F
.word 0x86B88B1C
.word 0x738DD1ED
.word 0x0924C1FC
.word 0xE74BC17C
.word 0xB6DEB5D3
.word 0xFF618ED8
.word 0xAF55B051
.word 0xB6D4DB8C
.word 0xD8112D30
.word 0x57A4D020
.word 0xA3A31D9B
.word 0xCD655301
.word 0x8935C5AC
.word 0x7D1FBAE7
.word 0xE4E14B0A
.word 0x015A9717
.word 0x12B3D471
.word 0xD89EB0C0
.word 0x0081DB69
.word 0xA6BA7B3D
.word 0xD400E42F
.word 0x6FEE2F98
.word 0x20E28AC0
.word 0x3216E3E1
.word 0x7558FB96
.word 0xA885D190
.word 0xF3FBA8A5
.word 0xB9E7CD0B
.word 0x4AD40123
.word 0x8E98560C
.word 0x84E256F3
.word 0xF9BFB8BE
.word 0x87965EE0
.word 0x7E286224
.word 0x44825443
.word 0x6ACC620A
.word 0x9F91642E
.word 0xAFE18E9F
.word 0x96133CFC
.word 0x2A402988
.word 0x12047261
.word 0xB5C18740
.word 0x6F64A7E5
.word 0xA1BB2DAB
.word 0xA593EAB5
.word 0x48FBA6C9
.word 0x0F594888
.word 0xF0E3D6F2
.word 0x44CA74A7
.word 0xCC7F7162
.word 0xBA38BB56
.word 0xCA8A1E02
.word 0x590CA539
.word 0xB3F579CE
.word 0x81292FFA
.word 0x05F79788
.word 0xF37A9CAF
.word 0x2D9C1EBD
.word 0xB265A971
.word 0x5D25E19D
.end
