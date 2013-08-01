/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: fgu_ieee_traps_07.s
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
.ident "FOCUSCASE: focus.pm,v 1.1 2003/04/23 17:53:39 somePerson Exp somePerson $ spc_basic_isa3.pl FOCUS_SEED=12555"
.ident "Mon Dec  8 19:23:47 CST 2003"
.ident "Using Instruction Hash for Focus :$Id: fgu_ieee_traps_07.s,v 1.4 2007/07/27 21:45:31 drp Exp $"
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
	set	0xB,	%g1
	set	0x6,	%g2
	set	0x5,	%g3
	set	0x9,	%g4
	set	0xB,	%g5
	set	0x1,	%g6
	set	0xD,	%g7
	!# Input registers
	set	-0xE,	%i0
	set	-0xE,	%i1
	set	-0x1,	%i2
	set	-0x1,	%i3
	set	-0x5,	%i4
	set	-0xB,	%i5
	set	-0xD,	%i6
	set	-0x5,	%i7
	!# Local registers
	set	0x4D02E777,	%l0
	set	0x72E75D57,	%l1
	set	0x79B36D52,	%l2
	set	0x4677B290,	%l3
	set	0x4ED3A3D7,	%l4
	set	0x32601138,	%l5
	set	0x51561456,	%l6
	!# Output registers
	set	0x0FED,	%o0
	set	0x0D79,	%o1
	set	0x13A5,	%o2
	set	-0x12BE,	%o3
	set	-0x1C36,	%o4
	set	0x0677,	%o5
	set	0x1908,	%o6
	set	0x0874,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x1805C4311F23DF84)
	INIT_TH_FP_REG(%l7,%f2,0x427AC311A1EBFF7A)
	INIT_TH_FP_REG(%l7,%f4,0xC51749B0AAEE43C0)
	INIT_TH_FP_REG(%l7,%f6,0x20476743466E0F79)
	INIT_TH_FP_REG(%l7,%f8,0x84DEF9172BC0AD59)
	INIT_TH_FP_REG(%l7,%f10,0xADEE57F98E209BC6)
	INIT_TH_FP_REG(%l7,%f12,0x90F1116B2441D9E0)
	INIT_TH_FP_REG(%l7,%f14,0x02F99AEF7A00A98A)
	INIT_TH_FP_REG(%l7,%f16,0x7562B7867BE5FC0E)
	INIT_TH_FP_REG(%l7,%f18,0xBAFB16AB97120954)
	INIT_TH_FP_REG(%l7,%f20,0x3A17AF8097C11167)
	INIT_TH_FP_REG(%l7,%f22,0x6043AECA0E392B09)
	INIT_TH_FP_REG(%l7,%f24,0x29F55E1180198BEE)
	INIT_TH_FP_REG(%l7,%f26,0x6A2AEEA14A4A2618)
	INIT_TH_FP_REG(%l7,%f28,0xA51988D17F70713E)
	INIT_TH_FP_REG(%l7,%f30,0x9809E1D4CEE6807D)

	!# Execute Main Diag ..

	tne	%icc,	0x0
	or	%o6,	%i2,	%g2
	movrlz	%i3,	0x091,	%g4
	edge16	%o7,	%l0,	%l1
	fmovdpos	%icc,	%f8,	%f18
	fmovrde	%l2,	%f28,	%f2
	taddcc	%i4,	0x1F13,	%o1
	rdhpr	%hpstate,	%l5
	std	%o4,	[%l7 + 0x10]
	movn	%fcc3,	%l4,	%i7
	fmovsul	%fcc3,	%f3,	%f27
	nop
	setx	0x1031,	%l0,	%g1
	udivcc	%i5,	%g1,	%o3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x70D, 	%hsys_tick_cmpr
	nop
	setx	0xCF95C7A7,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f14
	setx	0xE48321B7,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f18
	fmuls	%f18,	%f14,	%f1
	movue	%fcc3,	0x0C4,	%i1
	addcc	%o0,	0x169F,	%i0
	call	loop_1
	call	loop_2
	fmovde	%icc,	%f20,	%f0
	fba,a,pn	%fcc0,	loop_3
loop_1:
	mulscc	%l6,	0x0D6A,	%o4
loop_2:
	call	loop_4
	alignaddr	%g6,	%l3,	%g7
loop_3:
	call	loop_5
	fmovdpos	%icc,	%f30,	%f18
loop_4:
	srlx	%i6,	0x08,	%g5
	edge16n	%o2,	%i2,	%o6
loop_5:
	edge16	%i3,	%g4,	%g2
	fandnot2	%f14,	%f22,	%f20
	edge16l	%o7,	%l1,	%l0
	call	loop_6
	fmovsa	%icc,	%f17,	%f5
	call	loop_7
	call	loop_8
loop_6:
	nop
	set	0x40, %i4
	ldsw	[%l7 + %i4],	%i4
	fmul8sux16	%f10,	%f26,	%f22
loop_7:
	st	%f26,	[%l7 + 0x20]
loop_8:
	array16	%o1,	%l2,	%l5
	brgz,pn	%o5,	loop_9
	nop
	setx	0x2D30626DA1A8D904,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0x88D5DFAD4312175E,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	fsubd	%f8,	%f2,	%f30
	fmovdg	%fcc1,	%f24,	%f30
	call	loop_10
loop_9:
	nop
	fitod	%f8,	%f20
	fdtos	%f20,	%f9
	ldsh	[%l7 + 0x62],	%i7
	rdhpr	%ver,	%i5
loop_10:
	orcc	%l4,	0x0AAA,	%g1
	rd	%softint,	%g3
	fmovrse	%o3,	%f23,	%f17
	nop
	set	0x34, %o5
	flush	%l7 + %o5
	fmovdule	%fcc3,	%f30,	%f26
	wr	%g0,	0x89,	%asi
	ldswa	[%l7 + 0x7C] %asi,	%i1
	fmul8x16al	%f16,	%f29,	%f0
	fmovsge	%fcc2,	%f5,	%f18
	tvs	%xcc,	0x5
	call	loop_11
	nop
	setx	0x30D7AD471C051425,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0x119AA3C2C17FD4E0,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	fsubd	%f18,	%f28,	%f0
	fmovrslz	%i0,	%f0,	%f6
	mulx	%l6,	0x1870,	%o4
loop_11:
	fmovsneg	%xcc,	%f11,	%f22
	andncc	%g6,	%o0,	%g7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x634, 	%hsys_tick_cmpr
	nop
	fitod	%f0,	%f26
	fsrc1s	%f22,	%f29
	faligndata	%f24,	%f4,	%f26
	movule	%fcc0,	%o2,	%i2
	fpack16	%f10,	%f11
	sll	%o6,	%i3,	%g4
	tpos	%icc,	0x4
	xnorcc	%i6,	0x14DA,	%o7
	fmovdul	%fcc1,	%f14,	%f18
	fnand	%f20,	%f8,	%f0
	fmovsule	%fcc0,	%f20,	%f4
	fpsub32s	%f0,	%f7,	%f8
	sdiv	%l1,	0x1554,	%l0
	tsubcctv	%g2,	%o1,	%i4
	call	loop_12
	call	loop_13
	call	loop_14
	subcc	%l5,	0x02CE,	%l2
loop_12:
	call	loop_15
loop_13:
	fsrc1	%f0,	%f22
loop_14:
	sir	0x1F36
	call	loop_16
loop_15:
	fcmple32	%f18,	%f6,	%i7
	fmovduge	%fcc1,	%f8,	%f6
	fmovspos	%icc,	%f9,	%f4
loop_16:
	fmovrdgez	%i5,	%f12,	%f2
	movcs	%icc,	0x318,	%o5
	call	loop_17
	fbne,pn	%fcc1,	loop_18
	rdpr	%pil,	%l4
	fmovsu	%fcc3,	%f12,	%f13
loop_17:
	fmovrdlez	%g1,	%f28,	%f12
loop_18:
	fexpand	%f9,	%f0
	fsrc2	%f14,	%f18
	tsubcc	%g3,	%o3,	%i1
	or	%l6,	%o4,	%g6
	srl	%o0,	0x04,	%i0
	rdpr	%cansave,	%l3
	fmul8x16	%f22,	%f2,	%f14
	fmovdu	%fcc0,	%f10,	%f14
	fmovdule	%fcc1,	%f16,	%f22
	bl,pt	%icc,	loop_19
	fbo,pn	%fcc3,	loop_20
	rdhpr	%htba,	%g5
	fcmpgt32	%f2,	%f22,	%g7
loop_19:
	call	loop_21
loop_20:
	movul	%fcc2,	0x55F,	%o2
	call	loop_22
	call	loop_23
loop_21:
	fbg,pt	%fcc1,	loop_24
	fmovrdne	%o6,	%f30,	%f24
loop_22:
	stx	%i3,	[%l7 + 0x18]
loop_23:
	fbne,a,pt	%fcc3,	loop_25
loop_24:
	fpmerge	%f26,	%f4,	%f12
	call	loop_26
	edge8ln	%i2,	%i6,	%o7
loop_25:
	fmovslg	%fcc3,	%f8,	%f10
	bneg,a,pn	%xcc,	loop_27
loop_26:
	orncc	%l1,	%l0,	%g2
	fands	%f30,	%f12,	%f9
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
loop_27:
	rdpr	%canrestore,	%g4
	wr	%o1,	%i4,	%softint
	for	%f16,	%f8,	%f24
	fmovdvc	%icc,	%f10,	%f0
	fmovsleu	%icc,	%f10,	%f22
	nop
	setx	0x14638E76BADFD7E3,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0x638B5168,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	fsmuld	%f22,	%f20,	%f2
	fbn,a	%fcc0,	loop_28
	fornot1s	%f9,	%f8,	%f13
	call	loop_29
	movleu	%icc,	%l5,	%i7
loop_28:
	tvs	%xcc,	0x4
	call	loop_30
loop_29:
	call	loop_31
	taddcctv	%i5,	0x166F,	%l2
	movne	%fcc3,	0x4B6,	%l4
loop_30:
	nop
	set	0x22, %l5
	ldsba	[%l7 + %l5] 0x18,	%g1
loop_31:
	movrgz	%o5,	0x20A,	%o3
	fmovsg	%icc,	%f23,	%f26
	brgez	%i1,	loop_32
	fmovdl	%fcc0,	%f14,	%f22
	nop
	setx	loop_33,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x011200001400,	%l0,	%l1
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
	call	loop_34
loop_32:
	add	%l6,	0x1B19,	%g3
	bgu,pn	%icc,	loop_35
loop_33:
	call	loop_36
loop_34:
	fmovrslz	%g6,	%f2,	%f3
	fmuld8sux16	%f31,	%f14,	%f16
loop_35:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_36:
	fmovdlg	%fcc0,	%f4,	%f20
	fandnot2s	%f2,	%f9,	%f9
	and	%o4,	0x1395,	%i0
	rdhpr	%htba,	%g5
	call	loop_37
	movcc	%icc,	0x29F,	%g7
	edge16n	%l3,	%o2,	%i3
	movre	%i2,	%i6,	%o6
loop_37:
	call	loop_38
	movo	%fcc0,	0x664,	%o7
	fmovs	%f6,	%f26

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_38:
	ld	[%l7 + 0x08],	%f28
	udivx	%g2,	0x06B7,	%l0
	call	loop_39
	smulcc	%o1,	%i4,	%l5
	call	loop_40
	fbo	%fcc0,	loop_41
loop_39:
	fabss	%f7,	%f28
	srax	%i7,	0x12,	%g4
loop_40:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_41:
	fnegd	%f18,	%f8
	faligndata	%f2,	%f20,	%f28
	sub	%i5,	%g1,	%o5
	call	loop_42
	fzeros	%f1
	call	loop_43
	call	loop_44
loop_42:
	rdpr	%otherwin,	%l4
	fone	%f10
loop_43:
	call	loop_45
loop_44:
	call	loop_46
	movrlz	%o3,	0x033,	%l6
	call	loop_47
loop_45:
	alignaddr	%g3,	%g6,	%i1
loop_46:
	call	loop_48
	fmovda	%xcc,	%f2,	%f6
loop_47:
	sll	%o0,	0x0E,	%o4
	call	loop_49
loop_48:
	call	loop_50
	fcmpeq16	%f0,	%f14,	%g5
	call	loop_51
loop_49:
	nop
	setx	0x0755F39D79AFFAFB,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0xDCDBFC9600DB48E2,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fsubd	%f0,	%f12,	%f24
loop_50:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fmovsug	%fcc1,	%f3,	%f20
loop_51:
	call	loop_52
	alignaddr	%l3,	%i3,	%i2
	fmovdo	%fcc1,	%f14,	%f26
	fpmerge	%f17,	%f13,	%f4
loop_52:
	nop
	set	0x66, %g3
	ldstub	[%l7 + %g3],	%i6
	nop
	setx	0xF88467915D0C4950,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0xB98303BF,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	fsmuld	%f10,	%f22,	%f28
	add	%l7,	0x48,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%o2
	casxa	[%l6] %asi,	%o2,	%o6
	fmovd	%f14,	%f26
	call	loop_53
	fmovsvs	%xcc,	%f1,	%f8
	call	loop_54
	rdhpr	%hsys_tick_cmpr,	%o7
loop_53:
	call	loop_55
	rdhpr	%hsys_tick_cmpr,	%l1
loop_54:
	call	loop_56
	fmovsle	%fcc2,	%f25,	%f15
loop_55:
	xnorcc	%g2,	%l0,	%o1
	fsrc1s	%f29,	%f26
loop_56:
	movcc	%xcc,	%l5,	%i4
	nop
	fitod	%f4,	%f14
	fdtox	%f14,	%f28
	fxtod	%f28,	%f10
	fmovd	%f22,	%f6
	tge	%icc,	0x1
	call	loop_57
	call	loop_58
	call	loop_59
	rdhpr	%hsys_tick_cmpr,	%g4
loop_57:
	fmovdneg	%xcc,	%f30,	%f22
loop_58:
	edge32ln	%i7,	%l2,	%i5
loop_59:
	call	loop_60
	edge8	%o5,	%g1,	%o3
	nop
	fitos	%f6,	%f28
	fstoi	%f28,	%f25
	fornot1	%f10,	%f26,	%f4
loop_60:
	nop
	fitos	%f8,	%f3
	fstox	%f3,	%f0
	fxtos	%f0,	%f7
	tvs	%xcc,	0x3
	call	loop_61
	nop
	setx	0x0EDF,	%l0,	%g3
	udivcc	%l4,	%g3,	%l6
	prefetch	[%l7 + 0x30],	 3
	nop
	setx	0xCB6998D9957838AA,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0x2A8229233CD947CE,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	fdivd	%f30,	%f28,	%f2
loop_61:
	tvc	%icc,	0x5
	fmovsuge	%fcc0,	%f17,	%f25
	call	loop_62
	fmul8x16al	%f21,	%f31,	%f12
	call	loop_63
	call	loop_64
loop_62:
	movuge	%fcc1,	%i1,	%o0
	call	loop_65
loop_63:
	edge32l	%g6,	%g5,	%g7
loop_64:
	udivx	%o4,	0x0D9B,	%l3
	tcs	%icc,	0x5
loop_65:
	call	loop_66
	call	loop_67
	call	loop_68
	fmuld8sux16	%f4,	%f1,	%f20
loop_66:
	nop
	set	0x33, %o7
	stb	%i3,	[%l7 + %o7]
loop_67:
	fmovdue	%fcc1,	%f2,	%f16
loop_68:
	fpack16	%f12,	%f26
	fmovd	%f4,	%f14
	call	loop_69
	movrgez	%i0,	0x0AA,	%i2
	nop
	setx	0x81E3501D,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f18
	setx	0x06411D33,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f27
	fsubs	%f27,	%f18,	%f5
	fandnot1s	%f20,	%f27,	%f18
loop_69:
	xorcc	%i6,	0x0D39,	%o6
	call	loop_70
	call	loop_71
	rdhpr	%hintp,	%o2
	fmul8ulx16	%f8,	%f12,	%f30
loop_70:
	sra	%l1,	%o7,	%g2
loop_71:
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	fornot1	%f20,	%f0,	%f16
	fabss	%f23,	%f7
	and	%o1,	0x0A9C,	%l5
	fmovd	%f16,	%f4
	movvs	%xcc,	%l0,	%i4
	umul	%i7,	0x0B38,	%g4
	fbuge,pt	%fcc0,	loop_72
	call	loop_73
	fbe	%fcc0,	loop_74
	add	%l2,	0x12A9,	%o5
loop_72:
	nop
	fitos	%f12,	%f13
	fstox	%f13,	%f18
loop_73:
	rd	%y,	%i5
loop_74:
	fmovdue	%fcc1,	%f18,	%f30
	orcc	%g1,	0x1917,	%o3
	fcmps	%fcc0,	%f13,	%f2
	fpadd32	%f20,	%f14,	%f22
	call	loop_75
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	fmul8ulx16	%f26,	%f10,	%f14
	fcmped	%fcc0,	%f12,	%f16
loop_75:
	fpack16	%f28,	%f0
	edge8n	%l4,	%g3,	%i1
	fbne,pt	%fcc1,	loop_76
	tle	%icc,	0x0
	fmovdpos	%xcc,	%f14,	%f22
	nop
	fitos	%f7,	%f23
	fstox	%f23,	%f4
	fxtos	%f4,	%f3
loop_76:
	brnz	%l6,	loop_77
	call	loop_78
	movrgz	%o0,	%g5,	%g6
	movrlz	%o4,	%g7,	%i3
loop_77:
	call	loop_79
loop_78:
	movre	%i0,	0x347,	%l3
	call	loop_80
	call	loop_81
loop_79:
	fmul8x16al	%f21,	%f0,	%f18
	fcmps	%fcc1,	%f2,	%f17
loop_80:
	fmovrsgez	%i6,	%f0,	%f7
loop_81:
	bn,a	%icc,	loop_82
	rdpr	%tba,	%o6
	fmovrslez	%o2,	%f22,	%f26
	fmuld8sux16	%f21,	%f15,	%f10
loop_82:
	nop
	setx	loop_83,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x001100001400,	%l0,	%l1
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
	call	loop_84
	call	loop_85
	call	loop_86
loop_83:
	fmovde	%icc,	%f4,	%f20
loop_84:
	nop
	wr	%g0,	0x11,	%asi
	swapa	[%l7 + 0x10] %asi,	%i2
loop_85:
	movpos	%icc,	%o7,	%g2
loop_86:
	movrgez	%l1,	%o1,	%l0
	sllx	%i4,	%l5,	%g4
	nop
	setx	0x1121,	%l0,	%o5
	udivx	%l2,	%o5,	%i5
	fbl,pt	%fcc1,	loop_87
	xnor	%g1,	0x0892,	%o3
	fxnor	%f16,	%f6,	%f20
	call	loop_88
loop_87:
	call	loop_89
	fnot2	%f2,	%f6
	edge32	%l4,	%i7,	%g3
loop_88:
	call	loop_90
loop_89:
	xnor	%l6,	0x07D7,	%i1
	movrgez	%g5,	0x04C,	%o0
	call	loop_91
loop_90:
	call	loop_92
	nop
	setx	0x119B,	%l0,	%g6
	sdiv	%o4,	%g6,	%i3
	fmovrdne	%i0,	%f0,	%f4
loop_91:
	call	loop_93
loop_92:
	subcc	%g7,	0x1420,	%i6
	call	loop_94
	nop
	setx	0x2AFEA2B5FCB37DBA,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldx	[%l7 + 0x28],	%fsr
loop_93:
	ldub	[%l7 + 0x76],	%l3
	call	loop_95
loop_94:
	wr	%o2,	0x18D4,	%clear_softint
	fbl,a	%fcc1,	loop_96
	fmovscc	%icc,	%f25,	%f27
loop_95:
	call	loop_97
	movne	%fcc1,	%o6,	%o7
loop_96:
	fbul,pn	%fcc0,	loop_98
	call	loop_99
loop_97:
	bn	%icc,	loop_100
	edge8n	%g2,	%i2,	%o1
loop_98:
	movrlez	%l0,	%i4,	%l1
loop_99:
	fornot1s	%f21,	%f24,	%f8
loop_100:
	fmovrslz	%l5,	%f18,	%f7
	nop
	fitod	%f0,	%f6
	fdtox	%f6,	%f6
	fxtod	%f6,	%f28
	call	loop_101
	call	loop_102
	and	%g4,	0x03CF,	%l2
	fnor	%f30,	%f6,	%f0
loop_101:
	wrpr	%i5,	0x08C5,	%pil
loop_102:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	call	loop_103
	fbug	%fcc2,	loop_104
	call	loop_105
	ta	%xcc,	0x0
loop_103:
	array16	%g1,	%l4,	%o3
loop_104:
	rd	%pc,	%g3
loop_105:
	nop
	setx	0x12AB7796,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f4
	setx	0x73EC1476,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f9
	fadds	%f9,	%f4,	%f23
	rd	%sys_tick_cmpr,	%i7
!!	wr	%g0,	0x40,	%asi
!!	ldxa	[%g0 + 0x300] %asi,	%l6
	movcs	%icc,	%i1,	%g5
	sll	%o0,	0x06,	%o4
	faligndata	%f20,	%f24,	%f4
	add	%l7,	0x50,	%l6
	wr	%g0,	0x11,	%asi
	ldxa	[%l6] %asi,	%g6
	casxa	[%l6] 0x11,	%g6,	%i3
	call	loop_106
	te	%xcc,	0x0
	movrgez	%i0,	%g7,	%l3
	rd	%softint,	%i6
loop_106:
	edge32ln	%o6,	%o7,	%g2
	call	loop_107
	call	loop_108
	fcmple16	%f2,	%f26,	%o2
	tge	%xcc,	0x1
loop_107:
	movrlz	%o1,	%l0,	%i2
loop_108:
	fmovse	%xcc,	%f22,	%f15
	call	loop_109
	call	loop_110
	call	loop_111
	ldstub	[%l7 + 0x33],	%i4
loop_109:
	call	loop_112
loop_110:
	fmovdu	%fcc3,	%f8,	%f28
loop_111:
	call	loop_113
	fabss	%f22,	%f3
loop_112:
	call	loop_114
	call	loop_115
loop_113:
	fnors	%f6,	%f8,	%f27
	fmovsgu	%icc,	%f14,	%f17
loop_114:
	fmuld8ulx16	%f20,	%f9,	%f0
loop_115:
	nop
	setx	0x85D39301EB5E8E5A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0xCB4F2D0896EF4D21,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	faddd	%f30,	%f28,	%f14
	call	loop_116
	srax	%l5,	0x05,	%l1
	call	loop_117
	fmovdcc	%xcc,	%f8,	%f26
loop_116:
	movrlz	%g4,	0x132,	%i5
	rdpr	%cleanwin,	%l2
loop_117:
	fpadd16s	%f24,	%f1,	%f30
	fmovsgu	%icc,	%f12,	%f20
	movrlz	%o5,	%l4,	%o3
	call	loop_118
	fblg,pn	%fcc3,	loop_119
	fpadd32	%f24,	%f8,	%f0
	fmovso	%fcc0,	%f24,	%f2
loop_118:
	fmovdo	%fcc3,	%f24,	%f18
loop_119:
	call	loop_120
	tneg	%icc,	0x5
	wr	%g0,	0x0c,	%asi
	lduwa	[%l7 + 0x24] %asi,	%g1
loop_120:
	fnot1	%f30,	%f18
	wr	%i7,	%g3,	%clear_softint
	fxor	%f26,	%f22,	%f6
	movgu	%icc,	%l6,	%g5
	nop
	fitos	%f12,	%f3
	fstod	%f3,	%f30
	array8	%i1,	%o4,	%o0
	sub	%i3,	0x0D2B,	%g6
	bcs	%icc,	loop_121
	call	loop_122
	fsrc1	%f30,	%f30
	fmovdul	%fcc0,	%f0,	%f14
loop_121:
	call	loop_123
loop_122:
	fbge,pn	%fcc2,	loop_124
	call	loop_125
	nop
	setx	0x0C9C,	%l0,	%i0
	udivx	%g7,	%i0,	%l3
loop_123:
	nop
	setx	0xCDE174D6,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f10
	setx	0x27C0671B,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f8
	fsubs	%f8,	%f10,	%f22
loop_124:
	udivx	%o6,	0x0C75,	%o7
loop_125:
	call	loop_126
	edge8n	%g2,	%i6,	%o2
	st	%f13,	[%l7 + 0x30]
	fmovsuge	%fcc3,	%f21,	%f9
loop_126:
	rdpr	%pil,	%l0
	wrpr	%i2,	0x0877,	%cwp
	fmovdne	%fcc1,	%f18,	%f20
	movg	%fcc3,	%i4,	%o1
	call	loop_127
	call	loop_128
	nop
	setx	loop_129,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x034200001402,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fones	%f21
loop_127:
	rdhpr	%htba,	%l1
loop_128:
	call	loop_130
loop_129:
	fmovslg	%fcc2,	%f4,	%f21
	fmovdcs	%icc,	%f26,	%f10
	addccc	%g4,	%l5,	%l2
loop_130:
	sir	0x1161
	nop
	set	0x50, %o4
	stx	%i5,	[%l7 + %o4]
	nop
	fitod	%f4,	%f6
	fdtox	%f6,	%f24
	fxtod	%f24,	%f20
	fabss	%f6,	%f5
	call	loop_131
	andncc	%l4,	%o5,	%g1
	call	loop_132
	call	loop_133
loop_131:
	edge16ln	%i7,	%g3,	%l6
	fmovsu	%fcc2,	%f14,	%f2
loop_132:
	andncc	%o3,	0x0E07,	%g5
loop_133:
	taddcc	%o4,	0x09A5,	%o0
	fxnor	%f2,	%f24,	%f24
	subc	%i1,	%g6,	%g7
	fcmpgt16	%f14,	%f22,	%i3
	wr	%l3,	%i0,	%clear_softint
	fmovdvs	%icc,	%f26,	%f20
	nop
	setx	0x163A,	%l0,	%o7
	udivx	%o6,	%o7,	%i6
	array8	%o2,	%g2,	%l0
	call	loop_134
	alignaddrl	%i2,	%o1,	%i4
	alignaddrl	%l1,	%l5,	%g4
	call	loop_135
loop_134:
	fcmpeq32	%f24,	%f30,	%l2
	call	loop_136
	fmul8ulx16	%f0,	%f2,	%f0
loop_135:
	taddcc	%i5,	%l4,	%g1
	fnot1s	%f10,	%f19
loop_136:
	xorcc	%o5,	0x045F,	%g3
	call	loop_137
	stb	%i7,	[%l7 + 0x4A]
	fmovrdlz	%l6,	%f8,	%f16
	call	loop_138
loop_137:
	fbu,a,pt	%fcc2,	loop_139
	tneg	%icc,	0x1
	movre	%o3,	0x1A3,	%o4
loop_138:
	nop
	wr	%g0,	0x10,	%asi
	lduha	[%l7 + 0x2C] %asi,	%g5
loop_139:
	srl	%i1,	0x15,	%g6
	fabsd	%f16,	%f4
	nop
	setx	0xAA7E96D30865E636,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0x66743984B5A6CB55,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	fsubd	%f6,	%f12,	%f0
	fpsub16	%f22,	%f4,	%f14
	ble,a,pn	%icc,	loop_140
	fmovsa	%fcc0,	%f29,	%f18
	call	loop_141
	fnot2s	%f29,	%f20
loop_140:
	edge16ln	%o0,	%g7,	%i3
	call	loop_142
loop_141:
	call	loop_143
	call	loop_144
	fnot1s	%f23,	%f16
loop_142:
	nop

loop_143:
	nop

loop_144:
	nop

	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 0:
!
!	Type l   	: 24
!	Type a   	: 34
!	Type x   	: 8
!	Type cti   	: 144
!	Type f   	: 157
!	Type i   	: 133
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
	set	0xC,	%g1
	set	0xF,	%g2
	set	0x2,	%g3
	set	0x4,	%g4
	set	0x9,	%g5
	set	0xC,	%g6
	set	0x2,	%g7
	!# Input registers
	set	-0x4,	%i0
	set	-0x9,	%i1
	set	-0xD,	%i2
	set	-0x1,	%i3
	set	-0x6,	%i4
	set	-0x6,	%i5
	set	-0x0,	%i6
	set	-0x8,	%i7
	!# Local registers
	set	0x3F4876DE,	%l0
	set	0x458BD99A,	%l1
	set	0x1552079A,	%l2
	set	0x19FC8A63,	%l3
	set	0x446389DE,	%l4
	set	0x12F0A767,	%l5
	set	0x128118E2,	%l6
	!# Output registers
	set	-0x07D5,	%o0
	set	-0x1CD2,	%o1
	set	-0x09F6,	%o2
	set	-0x199B,	%o3
	set	-0x18C8,	%o4
	set	-0x1C07,	%o5
	set	0x18C0,	%o6
	set	-0x0D37,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x1805C4311F23DF84)
	INIT_TH_FP_REG(%l7,%f2,0x427AC311A1EBFF7A)
	INIT_TH_FP_REG(%l7,%f4,0xC51749B0AAEE43C0)
	INIT_TH_FP_REG(%l7,%f6,0x20476743466E0F79)
	INIT_TH_FP_REG(%l7,%f8,0x84DEF9172BC0AD59)
	INIT_TH_FP_REG(%l7,%f10,0xADEE57F98E209BC6)
	INIT_TH_FP_REG(%l7,%f12,0x90F1116B2441D9E0)
	INIT_TH_FP_REG(%l7,%f14,0x02F99AEF7A00A98A)
	INIT_TH_FP_REG(%l7,%f16,0x7562B7867BE5FC0E)
	INIT_TH_FP_REG(%l7,%f18,0xBAFB16AB97120954)
	INIT_TH_FP_REG(%l7,%f20,0x3A17AF8097C11167)
	INIT_TH_FP_REG(%l7,%f22,0x6043AECA0E392B09)
	INIT_TH_FP_REG(%l7,%f24,0x29F55E1180198BEE)
	INIT_TH_FP_REG(%l7,%f26,0x6A2AEEA14A4A2618)
	INIT_TH_FP_REG(%l7,%f28,0xA51988D17F70713E)
	INIT_TH_FP_REG(%l7,%f30,0x9809E1D4CEE6807D)

	!# Execute Main Diag ..

	fmovrslz	%i0,	%f17,	%f22
	te	%xcc,	0x0
	call	loop_145
	tg	%icc,	0x4
	call	loop_146
	call	loop_147
loop_145:
	fbn,pt	%fcc3,	loop_148
	call	loop_149
loop_146:
	call	loop_150
loop_147:
	fmovdneg	%xcc,	%f20,	%f6
loop_148:
	call	loop_151
loop_149:
	fmovdvs	%icc,	%f30,	%f12
loop_150:
	edge32ln	%l3,	%o7,	%o6
	set	0x78, %o6
	stwa	%o2,	[%l7 + %o6] 0xe3
	membar	#Sync
loop_151:
	call	loop_152
	fmovdge	%fcc0,	%f0,	%f20
	wr	%g0,	0xea,	%asi
	stxa	%g2,	[%l7 + 0x70] %asi
	membar	#Sync
loop_152:
	call	loop_153
	andn	%i6,	%l0,	%i2
	wrpr 	%g0, 	0x3, 	%gl
	te	%xcc,	0x7
loop_153:
	fmovsa	%xcc,	%f14,	%f6
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	fpmerge	%f26,	%f25,	%f8
	smulcc	%l1,	%i4,	%g4
	call	loop_154
	brnz,a	%l2,	loop_155
	fmul8x16al	%f0,	%f31,	%f26
	fornot1s	%f11,	%f31,	%f29
loop_154:
	bg,pt	%icc,	loop_156
loop_155:
	umul	%i5,	%l4,	%g1
	fmovdu	%fcc3,	%f10,	%f4
	call	loop_157
loop_156:
	tneg	%xcc,	0x7
	fmuld8sux16	%f22,	%f8,	%f12
	fmovdvc	%xcc,	%f12,	%f12
loop_157:
	nop
	set	0x74, %l3
	lduwa	[%l7 + %l3] 0x10,	%o5
	call	loop_158
	ldsh	[%l7 + 0x1A],	%g3
	fxors	%f15,	%f3,	%f6
	alignaddr	%l5,	%l6,	%i7
loop_158:
	call	loop_159
	fpsub16s	%f13,	%f11,	%f23
	tsubcc	%o3,	%o4,	%g5
	orn	%g6,	0x0DB8,	%i1
loop_159:
	call	loop_160
	fmovsule	%fcc3,	%f11,	%f25
	nop
	setx	0x79D4CCEF,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f24
	fsqrts	%f24,	%f2
	fmovdge	%fcc1,	%f0,	%f22
loop_160:
	edge8n	%g7,	%i3,	%o0
	call	loop_161
	bvs,a	%icc,	loop_162
	call	loop_163
	nop
	setx	0xD03C9C34,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f30
	setx	0xC8A4D982,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f13
	fmuls	%f13,	%f30,	%f8
loop_161:
	nop
	wr	%g0,	0x27,	%asi
	stba	%i0,	[%l7 + 0x1C] %asi
	membar	#Sync
loop_162:
	edge16l	%l3,	%o7,	%o2
loop_163:
	tleu	%icc,	0x0
	fcmpd	%fcc3,	%f24,	%f24
	tcs	%xcc,	0x4
	fmovrslz	%o6,	%f28,	%f16
	rdhpr	%hsys_tick_cmpr,	%i6
	call	loop_164
	fmovdge	%fcc0,	%f0,	%f0
	te	%xcc,	0x0
	call	loop_165
loop_164:
	popc	0x0413,	%l0
	fmovdgu	%icc,	%f16,	%f4
	call	loop_166
loop_165:
	array32	%g2,	%i2,	%o1
	sub	%l1,	0x0953,	%g4
	fmovdl	%icc,	%f0,	%f0
loop_166:
	fmovsne	%fcc0,	%f0,	%f26
	ldsb	[%l7 + 0x7A],	%l2
	call	loop_167
	call	loop_168
	call	loop_169
	call	loop_170
loop_167:
	orn	%i5,	%i4,	%g1
loop_168:
	edge32ln	%o5,	%l4,	%l5
loop_169:
	sllx	%l6,	0x18,	%g3
loop_170:
	fmovdge	%fcc2,	%f8,	%f2
	fmovdug	%fcc3,	%f20,	%f28
	nop
	fitod	%f2,	%f16
	fdtoi	%f16,	%f23
	tne	%icc,	0x2
	fmovdcc	%icc,	%f22,	%f12
	fble,a,pt	%fcc2,	loop_171
	fmovdue	%fcc3,	%f20,	%f18
	fors	%f20,	%f29,	%f26
	tvc	%icc,	0x3
loop_171:
	call	loop_172
	nop
	setx	0x26E708F5,	%l0,	%l6
	st	%l6,	[%l7 + 0x58]
	ld	[%l7 + 0x58],	%fsr
	fpsub16s	%f4,	%f13,	%f20
	call	loop_173
loop_172:
	call	loop_174
	fnot2	%f12,	%f18
	fcmpeq16	%f20,	%f30,	%i7
loop_173:
	brz,a	%o3,	loop_175
loop_174:
	or	%g5,	%o4,	%i1
	bneg,a,pt	%xcc,	loop_176
	andncc	%g6,	%g7,	%o0
loop_175:
	bcs,a,pn	%xcc,	loop_177
	call	loop_178
loop_176:
	orncc	%i0,	%l3,	%i3
	fmovrsgz	%o7,	%f11,	%f31
loop_177:
	movne	%fcc0,	%o2,	%o6
loop_178:
	tge	%icc,	0x4
	fmul8sux16	%f6,	%f18,	%f12
	call	loop_179
	edge8ln	%l0,	%g2,	%i2
	nop
	setx	0xCC8110CE8FE09847,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0xAE54FEA5,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	fsmuld	%f6,	%f2,	%f10
	call	loop_180
loop_179:
	fmovsvs	%xcc,	%f26,	%f16
	membar	0x31
	be,a,pn	%xcc,	loop_181
loop_180:
	call	loop_182
	tl	%xcc,	0x7
	call	loop_183
loop_181:
	fmovsvc	%icc,	%f12,	%f27
loop_182:
	add	%i6,	%l1,	%g4
	tsubcc	%o1,	0x0935,	%i5
loop_183:
	popc	0x135C,	%i4
	call	loop_184
	fone	%f18
	fxor	%f0,	%f12,	%f30
	fmovdn	%fcc2,	%f26,	%f6
loop_184:
	call	loop_185
	fandnot1s	%f18,	%f17,	%f19

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	movuge	%fcc2,	0x382,	%l4
loop_185:
	fmovsuge	%fcc0,	%f21,	%f23
	array16	%o5,	%l5,	%g3
	fmovsge	%xcc,	%f2,	%f29
	call	loop_186
	xnorcc	%i7,	%o3,	%l6
	fcmped	%fcc2,	%f4,	%f16
	bvc,pn	%icc,	loop_187
loop_186:
	fabss	%f8,	%f29
	call	loop_188
	call	loop_189
loop_187:
	call	loop_190
	call	loop_191
loop_188:
	tcs	%icc,	0x2
loop_189:
	and	%o4,	0x02CD,	%i1
loop_190:
	nop
	fitod	%f8,	%f18
	fdtox	%f18,	%f24
	fxtod	%f24,	%f26
loop_191:
	fbu,pn	%fcc3,	loop_192
	nop
	setx	0xFC6DFD0E681CEA61,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	fsqrtd	%f24,	%f4
	fmovdne	%icc,	%f6,	%f22
	fnors	%f16,	%f18,	%f25
loop_192:
	call	loop_193
	call	loop_194
	wrpr	%g5,	0x0120,	%cwp
	udivx	%g6,	0x1754,	%o0
loop_193:
	fmovdue	%fcc1,	%f30,	%f12
loop_194:
	sub	%g7,	%l3,	%i3
	fnegs	%f12,	%f21
	fmovrsgz	%o7,	%f9,	%f21
	fmovsvc	%icc,	%f23,	%f10
	call	loop_195
	movvc	%icc,	%o2,	%o6
	add	%l0,	%i0,	%g2
	fcmpgt16	%f20,	%f30,	%i2
loop_195:
	taddcc	%l1,	0x05B2,	%i6
	sdivcc	%g4,	0x1D9B,	%o1
	fmovs	%f8,	%f26
	fnegs	%f10,	%f4
	smul	%i4,	%i5,	%g1
	rd	%asi,	%l2
	call	loop_196
	tgu	%icc,	0x6
	fnand	%f14,	%f4,	%f4
	call	loop_197
loop_196:
	fmul8ulx16	%f14,	%f8,	%f18
	fmovsle	%fcc2,	%f25,	%f4
	fbe,a,pt	%fcc0,	loop_198
loop_197:
	call	loop_199
	movul	%fcc0,	0x779,	%l4
	sir	0x0A16
loop_198:
	call	loop_200
loop_199:
	fones	%f12
	tne	%icc,	0x0
	wrpr	%l5,	0x00E2,	%tick
loop_200:
	rd	%pc,	%o5
	fmovdvs	%xcc,	%f4,	%f30
	fmul8x16	%f26,	%f4,	%f14
	call	loop_201
	call	loop_202
	tsubcctv	%i7,	0x165A,	%o3
	ta	%xcc,	0x1
loop_201:
	movneg	%icc,	%l6,	%o4
loop_202:
	call	loop_203
	call	loop_204
	fabss	%f10,	%f15
	fmovsul	%fcc2,	%f23,	%f30
loop_203:
	xnorcc	%g3,	%g5,	%g6
loop_204:
	fcmpgt16	%f8,	%f0,	%o0
	fandnot2s	%f18,	%f23,	%f2
	fors	%f17,	%f8,	%f8
	fmovsne	%xcc,	%f9,	%f2
	call	loop_205
	call	loop_206
	fxor	%f16,	%f14,	%f16
	edge32ln	%i1,	%g7,	%l3
loop_205:
	fmovdcs	%xcc,	%f4,	%f4
loop_206:
	call	loop_207
	fands	%f17,	%f13,	%f20
	set	0x66, %l0
	ldsba	[%l7 + %l0] 0x89,	%o7
loop_207:
	movrne	%i3,	0x37E,	%o2
	call	loop_208
	movul	%fcc1,	0x616,	%o6
	movcs	%icc,	%i0,	%l0
	call	loop_209
loop_208:
	edge16ln	%i2,	%g2,	%l1
	call	loop_210
	call	loop_211
loop_209:
	call	loop_212
	movleu	%icc,	0x5B8,	%i6
loop_210:
	fmovslg	%fcc2,	%f24,	%f9
loop_211:
	fandnot1s	%f12,	%f26,	%f4
loop_212:
	call	loop_213
	bge,pn	%icc,	loop_214
	array8	%g4,	%o1,	%i5
	udiv	%g1,	0x0D01,	%l2
loop_213:
	andcc	%i4,	%l4,	%o5
loop_214:
	movlg	%fcc3,	%i7,	%o3
	fmovduge	%fcc0,	%f16,	%f28
	call	loop_215
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	call	loop_216
	flushw
loop_215:
	edge16n	%l6,	%o4,	%l5
	call	loop_217
loop_216:
	fbge	%fcc3,	loop_218
	call	loop_219
	srl	%g5,	%g6,	%o0
loop_217:
	call	loop_220
loop_218:
	call	loop_221
loop_219:
	umulcc	%g3,	0x18AC,	%i1
	stbar
loop_220:
	call	loop_222
loop_221:
	nop
	fitos	%f13,	%f6
	fstod	%f6,	%f22
	fornot2s	%f3,	%f13,	%f20
	wr	%g0,	0x18,	%asi
	swapa	[%l7 + 0x20] %asi,	%g7
loop_222:
	taddcctv	%l3,	0x0DA5,	%o7
	fnot1s	%f3,	%f1
	tpos	%icc,	0x1
	sth	%i3,	[%l7 + 0x7A]
	fmovsug	%fcc2,	%f20,	%f24
	orcc	%o6,	%i0,	%o2
	call	loop_223
	fpadd16	%f10,	%f0,	%f20
	movg	%icc,	0x403,	%i2
	nop
	set	0x5B, %i3
	ldsb	[%l7 + %i3],	%g2
loop_223:
	fornot1	%f20,	%f24,	%f24
	set	0x58, %l4
	lda	[%l7 + %l4] 0x80,	%f16
	call	loop_224
	call	loop_225
	fand	%f4,	%f0,	%f24
	flush	%l7 + 0x5C
loop_224:
	fcmpne32	%f30,	%f10,	%l1
loop_225:
	fpmerge	%f8,	%f8,	%f0
	call	loop_226
	call	loop_227
	tne	%icc,	0x6
	tneg	%xcc,	0x3
loop_226:
	or	%l0,	%i6,	%o1
loop_227:
	call	loop_228
	call	loop_229
	fxors	%f2,	%f5,	%f5
	rdhpr	%hpstate,	%i5
loop_228:
	fmovsg	%fcc1,	%f23,	%f0
loop_229:
	fsrc2s	%f4,	%f5
	for	%f30,	%f30,	%f16
	wrpr	%g1,	0x1073,	%pil
	fbuge	%fcc0,	loop_230
	fble,a,pt	%fcc1,	loop_231
	fornot1	%f26,	%f10,	%f14
	call	loop_232
loop_230:
	call	loop_233
loop_231:
	fmovrdlz	%g4,	%f0,	%f0
	bshuffle	%f20,	%f10,	%f20
loop_232:
	call	loop_234
loop_233:
	call	loop_235
	nop
	setx	0xAF1366376458CF23,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0xDACEE5A5364237C9,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	fdivd	%f18,	%f4,	%f6
	call	loop_236
loop_234:
	sethi	0x1C0A,	%i4
loop_235:
	call	loop_237
	call	loop_238
loop_236:
	rd	%softint,	%l4
	fornot1	%f14,	%f30,	%f2
loop_237:
	mova	%xcc,	0x6F7,	%o5
loop_238:
	call	loop_239
	sllx	%i7,	0x1D,	%o3
	fmovsl	%xcc,	%f24,	%f27
	fmovda	%xcc,	%f18,	%f14
loop_239:
	andncc	%l6,	0x05B8,	%l2
	fornot2	%f14,	%f24,	%f8
	call	loop_240
	rdhpr	%hpstate,	%o4
	nop
	setx	0x385E2A0F,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f24
	setx	0x005A95CE,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f20
	fsubs	%f20,	%f24,	%f5
	fornot2s	%f7,	%f9,	%f26
loop_240:
	orncc	%g5,	0x06A6,	%g6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x539, 	%hsys_tick_cmpr
	nop
	fitos	%f8,	%f29
	fstoi	%f29,	%f26
	rdhpr	%hsys_tick_cmpr,	%g3
	nop
	setx	0x4C56B4EB37794E61,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	fsqrtd	%f26,	%f0
	call	loop_241
	movul	%fcc3,	0x5A9,	%g7
	edge8	%l3,	%o7,	%i1
	fmovspos	%icc,	%f28,	%f14
loop_241:
	fmovdl	%fcc0,	%f12,	%f26
	rdhpr	%hsys_tick_cmpr,	%o6
	movle	%icc,	%i3,	%i0
	rdpr	%tba,	%i2
	movug	%fcc2,	%o2,	%g2
	call	loop_242
	mulx	%l0,	%l1,	%o1
	movle	%icc,	0x73B,	%i6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_242:
	fabsd	%f30,	%f18
	prefetch	[%l7 + 0x3C],	 1
	movre	%i4,	0x22A,	%l4
	mulscc	%g1,	0x1C04,	%i7
	movule	%fcc1,	%o3,	%o5
	call	loop_243
	call	loop_244
	edge32n	%l2,	%o4,	%g5
	wr	%g6,	%o0,	%sys_tick
loop_243:
	xnorcc	%l6,	%l5,	%g3
loop_244:
	call	loop_245
	fpadd16s	%f21,	%f16,	%f26
	call	loop_246
	orn	%g7,	0x0C8E,	%l3
loop_245:
	call	loop_247
	call	loop_248
loop_246:
	sra	%o7,	%i1,	%o6
	call	loop_249
loop_247:
	nop
	fitod	%f6,	%f8
	fdtox	%f8,	%f28
loop_248:
	array16	%i3,	%i2,	%o2
	call	loop_250
loop_249:
	wr	%i0,	%g2,	%y
	nop
	setx	0x814AA189,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f25
	setx	0xD7516CC3,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f24
	fadds	%f24,	%f25,	%f27
	call	loop_251
loop_250:
	movgu	%xcc,	0x1DD,	%l1
	fmul8sux16	%f2,	%f6,	%f12
	tneg	%xcc,	0x4
loop_251:
	orn	%o1,	%i6,	%l0
	subccc	%g4,	0x1EE1,	%i4
	call	loop_252
	nop
	setx	0x2FA7DF3B,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f0
	setx	0x0562C289,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f11
	fadds	%f11,	%f0,	%f25
	wr	%g0,	0x18,	%asi
	lduba	[%l7 + 0x43] %asi,	%l4
loop_252:
	rdpr	%canrestore,	%g1
	wr	%g0,	0x10,	%asi
	ldxa	[%l7 + 0x78] %asi,	%i5
	call	loop_253
	fmovsne	%fcc1,	%f5,	%f20
	fmovslg	%fcc3,	%f11,	%f10
	tcs	%icc,	0x5
loop_253:
	array32	%i7,	%o3,	%o5
	fornot2	%f4,	%f10,	%f2
	xorcc	%l2,	0x14C6,	%g5
	wrpr 	%g0, 	0x0, 	%gl

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xE2B, 	%hsys_tick_cmpr
	nop
	fitod	%f6,	%f18
	fdtox	%f18,	%f28
	fxtod	%f28,	%f28
	movn	%fcc3,	0x5E0,	%l5
	subccc	%g7,	0x1A5B,	%l3
	fpadd16	%f6,	%f0,	%f16
	add	%g3,	%o7,	%i1
	call	loop_254
	fmovdge	%fcc2,	%f2,	%f0
	fmovsvs	%xcc,	%f14,	%f13
	call	loop_255
loop_254:
	sethi	0x0570,	%o6
	fornot2	%f28,	%f10,	%f4
	call	loop_256
loop_255:
	fnot2s	%f27,	%f8
	fmovslg	%fcc2,	%f8,	%f16
	call	loop_257
loop_256:
	fmovsl	%fcc1,	%f11,	%f4
	call	loop_258
	call	loop_259
loop_257:
	edge32	%i3,	%o2,	%i2
	fmovdug	%fcc2,	%f16,	%f2
loop_258:
	call	loop_260
loop_259:
	tg	%icc,	0x7
	brz,a,pt	%g2,	loop_261
	tg	%xcc,	0x3
loop_260:
	tneg	%xcc,	0x2
	fnands	%f15,	%f12,	%f27
loop_261:
	call	loop_262
	fmovsule	%fcc1,	%f14,	%f4
	movule	%fcc3,	%l1,	%o1
	mulx	%i6,	0x11B1,	%i0
loop_262:
	fmovsvs	%xcc,	%f22,	%f18
	movge	%xcc,	0x582,	%l0
	stx	%g4,	[%l7 + 0x60]
	call	loop_263
	call	loop_264
	fmuld8sux16	%f14,	%f11,	%f18

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_263:
	ldd	[%l7 + 0x28],	%f8
loop_264:
	movleu	%icc,	%g1,	%i5
	fnegd	%f14,	%f18
	brlez,a	%l4,	loop_265
	nop
	set	0x48, %i2
	stw	%o3,	[%l7 + %i2]
	srlx	%i7,	%o5,	%l2
	fzero	%f0
loop_265:
	nop
	fitod	%f0,	%f26
	fdtos	%f26,	%f19
	call	loop_266
	ldd	[%l7 + 0x70],	%g4
	fpadd32s	%f0,	%f30,	%f20
	call	loop_267
loop_266:
	movleu	%icc,	0x36D,	%o4
	call	loop_268
	fnegs	%f9,	%f4
loop_267:
	call	loop_269
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
loop_268:
	movrne	%g6,	0x26B,	%o0
	srl	%l5,	%g7,	%l3
loop_269:
	rdpr	%pil,	%g3
	call	loop_270
	fpmerge	%f12,	%f5,	%f20
	fones	%f8
	fmovscs	%xcc,	%f25,	%f30
loop_270:
	fmovdo	%fcc3,	%f0,	%f20
	rdhpr	%htba,	%o7
	fpackfix	%f18,	%f5
	bleu,a	%icc,	loop_271
	fbule,a,pt	%fcc0,	loop_272
	bg,a	%icc,	loop_273
	call	loop_274
loop_271:
	call	loop_275
loop_272:
	call	loop_276
loop_273:
	tcs	%icc,	0x5
loop_274:
	ldsw	[%l7 + 0x64],	%l6
loop_275:
	fornot2	%f0,	%f14,	%f22
loop_276:
	fmovdul	%fcc1,	%f4,	%f22
	movuge	%fcc1,	0x2CB,	%o6
	fmovdvs	%icc,	%f20,	%f2
	mova	%icc,	%i3,	%o2
	bge,a,pt	%icc,	loop_277
	call	loop_278
	fmovsleu	%xcc,	%f12,	%f5
	std	%f2,	[%l7 + 0x20]
loop_277:
	call	loop_279
loop_278:
	bvc	%xcc,	loop_280
	add	%i1,	%i2,	%g2
	call	loop_281
loop_279:
	fmovdge	%fcc1,	%f2,	%f16
loop_280:
	rdpr	%gl,	%o1
	rd	%asi,	%i6
loop_281:
	tg	%icc,	0x6
	wrpr	%l1,	%l0,	%cwp
	fmovrdlez	%i0,	%f16,	%f6
	edge16l	%g4,	%g1,	%i5
	fmovdlg	%fcc2,	%f0,	%f16
	call	loop_282
	nop
	setx	0xFE31A2BB,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f10
	setx	0xFB566075,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f3
	fadds	%f3,	%f10,	%f25
	call	loop_283
	fba,a,pt	%fcc3,	loop_284
loop_282:
	fcmps	%fcc1,	%f11,	%f17
	call	loop_285
loop_283:
	fpsub32s	%f23,	%f15,	%f27
loop_284:
	call	loop_286
	nop
	setx	0x015D,	%l0,	%o3
	udiv	%i4,	%o3,	%l4
loop_285:
	call	loop_287
	call	loop_288
loop_286:
	fmul8x16au	%f15,	%f8,	%f12
	sra	%i7,	0x0F,	%l2
loop_287:
	bn,a	%icc,	loop_289
loop_288:
	fblg,a,pt	%fcc0,	loop_290
	mulx	%o5,	%g5,	%g6
	nop
	fitod	%f10,	%f14
	fdtox	%f14,	%f2
	fxtod	%f2,	%f16
loop_289:
	bneg	%icc,	loop_291
loop_290:
	siam	0x3
	sdiv	%o4,	0x07EF,	%o0
	call	loop_292
loop_291:
	sethi	0x0A88,	%l5
	fmovscc	%xcc,	%f3,	%f3
	sethi	0x1A26,	%l3
loop_292:
	rdpr	%wstate,	%g3
	nop
	setx	0x04B6,	%l0,	%l6
	sdivx	%g7,	%l6,	%o6
	edge8ln	%i3,	%o7,	%o2
	nop
	set	0x3E, %l6
	sth	%i2,	[%l7 + %l6]
	call	loop_293
	fornot1s	%f3,	%f28,	%f19
	call	loop_294
	nop
	fitod	%f8,	%f10
	fdtos	%f10,	%f17
loop_293:
	ba,a,pt	%icc,	loop_295
	fpsub32s	%f4,	%f15,	%f15
loop_294:
	call	loop_296
	edge16l	%g2,	%i1,	%o1
loop_295:
	nop
	fitos	%f10,	%f18
	fstox	%f18,	%f30
loop_296:
	nop

	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 1:
!
!	Type l   	: 24
!	Type a   	: 28
!	Type x   	: 9
!	Type cti   	: 152
!	Type f   	: 151
!	Type i   	: 136
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
	set	0xA,	%g1
	set	0x7,	%g2
	set	0xF,	%g3
	set	0x4,	%g4
	set	0x1,	%g5
	set	0xF,	%g6
	set	0x4,	%g7
	!# Input registers
	set	-0xD,	%i0
	set	-0xC,	%i1
	set	-0x4,	%i2
	set	-0x7,	%i3
	set	-0x3,	%i4
	set	-0x8,	%i5
	set	-0xC,	%i6
	set	-0x6,	%i7
	!# Local registers
	set	0x68DDE77D,	%l0
	set	0x6D299201,	%l1
	set	0x7F72393A,	%l2
	set	0x53B5D1DA,	%l3
	set	0x1A137CF6,	%l4
	set	0x35DC5C63,	%l5
	set	0x092E7CB9,	%l6
	!# Output registers
	set	0x06C8,	%o0
	set	0x1989,	%o1
	set	0x149F,	%o2
	set	0x1675,	%o3
	set	0x157E,	%o4
	set	0x17C0,	%o5
	set	-0x13C1,	%o6
	set	0x13E5,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x1805C4311F23DF84)
	INIT_TH_FP_REG(%l7,%f2,0x427AC311A1EBFF7A)
	INIT_TH_FP_REG(%l7,%f4,0xC51749B0AAEE43C0)
	INIT_TH_FP_REG(%l7,%f6,0x20476743466E0F79)
	INIT_TH_FP_REG(%l7,%f8,0x84DEF9172BC0AD59)
	INIT_TH_FP_REG(%l7,%f10,0xADEE57F98E209BC6)
	INIT_TH_FP_REG(%l7,%f12,0x90F1116B2441D9E0)
	INIT_TH_FP_REG(%l7,%f14,0x02F99AEF7A00A98A)
	INIT_TH_FP_REG(%l7,%f16,0x7562B7867BE5FC0E)
	INIT_TH_FP_REG(%l7,%f18,0xBAFB16AB97120954)
	INIT_TH_FP_REG(%l7,%f20,0x3A17AF8097C11167)
	INIT_TH_FP_REG(%l7,%f22,0x6043AECA0E392B09)
	INIT_TH_FP_REG(%l7,%f24,0x29F55E1180198BEE)
	INIT_TH_FP_REG(%l7,%f26,0x6A2AEEA14A4A2618)
	INIT_TH_FP_REG(%l7,%f28,0xA51988D17F70713E)
	INIT_TH_FP_REG(%l7,%f30,0x9809E1D4CEE6807D)

	!# Execute Main Diag ..

	wr	%i6,	%l0,	%set_softint
	call	loop_297
	edge32l	%i0,	%g4,	%g1
	and	%i5,	0x1C07,	%i4
	call	loop_298
loop_297:
	xnorcc	%o3,	0x1F94,	%l4
	fones	%f8
	fandnot2s	%f14,	%f14,	%f31
loop_298:
	fabss	%f8,	%f8
	movuge	%fcc0,	%l1,	%l2
	tne	%icc,	0x1
	edge32l	%o5,	%i7,	%g5
	fmovspos	%xcc,	%f8,	%f22
	fbl,a	%fcc2,	loop_299
	call	loop_300
	fxnor	%f4,	%f22,	%f2
	srlx	%o4,	%o0,	%l5
loop_299:
	tpos	%xcc,	0x4
loop_300:
	or	%l3,	0x0B71,	%g3
	fsrc1s	%f0,	%f7
	rdpr	%canrestore,	%g7
	call	loop_301
	call	loop_302
	fxors	%f31,	%f29,	%f13
	nop
	fitod	%f16,	%f20
loop_301:
	tcs	%icc,	0x6
loop_302:
	fmul8x16	%f18,	%f20,	%f12
	fmul8x16al	%f6,	%f2,	%f20
	movug	%fcc3,	%l6,	%o6
	call	loop_303
	smul	%i3,	%g6,	%o2
	fmovsge	%fcc2,	%f9,	%f10

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x993, 	%hsys_tick_cmpr
loop_303:
	wrpr	%i2,	0x0143,	%tick
	edge32	%o1,	%i1,	%i6
	nop
	setx	0x41B42B62,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f19
	setx	0x39EE15EB,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f6
	fsubs	%f6,	%f19,	%f15
	fmovdle	%icc,	%f10,	%f18
	wrpr 	%g0, 	0x2, 	%gl
	movrlz	%g4,	%g1,	%i5
	movcs	%icc,	%i4,	%o3
	fxor	%f8,	%f26,	%f28
	call	loop_304
	rdhpr	%hpstate,	%l1
	call	loop_305
	fmovrsgz	%l4,	%f23,	%f21
loop_304:
	movul	%fcc0,	%l2,	%i7
	call	loop_306
loop_305:
	nop
	set	0x48, %l1
	ldub	[%l7 + %l1],	%g5
	tvs	%icc,	0x2
	nop
	setx loop_307, %l0, %l1
	jmpl %l1, %o4
loop_306:
	call	loop_308
	addcc	%o0,	%o5,	%l5
	nop
	fitos	%f3,	%f19
	fstod	%f19,	%f14
loop_307:
	call	loop_309
loop_308:
	call	loop_310
	fmovdl	%fcc0,	%f8,	%f26
	fandnot2s	%f5,	%f6,	%f17
loop_309:
	call	loop_311
loop_310:
	call	loop_312
	nop
	fitod	%f2,	%f0
	fdtox	%f0,	%f12
	array16	%g3,	%l3,	%g7
loop_311:
	fmovsle	%fcc2,	%f29,	%f12
loop_312:
	fmovscs	%xcc,	%f8,	%f2
	fmovsleu	%icc,	%f27,	%f0
	fnor	%f10,	%f2,	%f24
	tvs	%icc,	0x0
	call	loop_313
	fmul8x16au	%f29,	%f6,	%f12
	fbe,a	%fcc3,	loop_314
	fmovsg	%fcc1,	%f15,	%f0
loop_313:
	fsrc1s	%f19,	%f19
	fcmple32	%f4,	%f2,	%o6
loop_314:
	tge	%icc,	0x5
	nop
	set	0x30, %o0
	ldd	[%l7 + %o0],	%f14
	nop
	setx	0x1A8E2D8A,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f30
	fsqrts	%f30,	%f23
	call	loop_315
	fnegs	%f11,	%f27
	std	%i6,	[%l7 + 0x48]
	fbne,a,pt	%fcc1,	loop_316
loop_315:
	call	loop_317
	brlz,a,pn	%g6,	loop_318
	call	loop_319
loop_316:
	call	loop_320
loop_317:
	fcmple32	%f14,	%f0,	%o2
loop_318:
	fmovd	%f14,	%f8
loop_319:
	fmovdule	%fcc0,	%f24,	%f18
loop_320:
	wr	%o7,	0x003E,	%set_softint
	fmul8ulx16	%f0,	%f12,	%f6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	call	loop_321
	fmovdneg	%icc,	%f4,	%f14
	call	loop_322
	call	loop_323
loop_321:
	fpadd16s	%f29,	%f23,	%f7
	movcs	%xcc,	0x0E1,	%g2
loop_322:
	bcs,pn	%icc,	loop_324
loop_323:
	fmovrdgz	%i2,	%f4,	%f12
	nop
	fitod	%f24,	%f30
	or	%o1,	0x148B,	%i6
loop_324:
	call	loop_325
	nop
	fitos	%f4,	%f6
	fstod	%f6,	%f28
	movcc	%icc,	0x2C4,	%i0
	nop
	set	0x48, %g7
	ldstub	[%l7 + %g7],	%l0
loop_325:
	movug	%fcc1,	0x218,	%g4
	smulcc	%i1,	0x0229,	%g1
	call	loop_326
	call	loop_327
	call	loop_328
	call	loop_329
loop_326:
	movcc	%icc,	0x5EB,	%i5
loop_327:
	call	loop_330
loop_328:
	movu	%fcc2,	%i4,	%o3
loop_329:
	rdhpr	%hpstate,	%l1
	fmovrsne	%l4,	%f25,	%f18
loop_330:
	call	loop_331
	nop
	fitos	%f5,	%f30
	fstod	%f30,	%f8
	call	loop_332
	call	loop_333
loop_331:
	fandnot2	%f14,	%f30,	%f30
	call	loop_334
loop_332:
	fmovsug	%fcc1,	%f28,	%f29
loop_333:
	fble,a,pt	%fcc1,	loop_335
	nop
	fitos	%f4,	%f9
	fstox	%f9,	%f28
	fxtos	%f28,	%f18
loop_334:
	for	%f14,	%f2,	%f4
	nop
	fitos	%f8,	%f3
	fstox	%f3,	%f12
loop_335:
	nop
	setx	loop_336,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x001200001407,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fmovrsgz	%i7,	%f13,	%f9
	call	loop_337
	call	loop_338
loop_336:
	call	loop_339
	fmul8x16al	%f25,	%f16,	%f2
loop_337:
	fcmped	%fcc3,	%f0,	%f30
loop_338:
	tge	%xcc,	0x5
loop_339:
	call	loop_340
	call	loop_341
	edge8	%l2,	%o4,	%g5
	call	loop_342
loop_340:
	subccc	%o5,	0x094E,	%o0
loop_341:
	call	loop_343
	sub	%l5,	%l3,	%g3
loop_342:
	rd	%asi,	%g7
	call	loop_344
loop_343:
	fpadd32s	%f30,	%f4,	%f28
	sll	%o6,	0x04,	%g6
	fandnot1	%f6,	%f28,	%f12
loop_344:
	nop
	fitos	%f1,	%f0
	fstox	%f0,	%f6
	movrgez	%l6,	%o7,	%i3
	movg	%xcc,	%g2,	%o2
	fcmpeq16	%f30,	%f16,	%o1
	call	loop_345
	fzero	%f6
	call	loop_346
	stb	%i2,	[%l7 + 0x0F]
loop_345:
	flushw
	movue	%fcc2,	0x3A8,	%i0
loop_346:
	edge8	%l0,	%i6,	%g4
	fpsub32	%f28,	%f12,	%f6
	fmovslg	%fcc3,	%f16,	%f12
	rd	%ccr,	%i1
	call	loop_347
	call	loop_348
	sdiv	%i5,	0x0BCE,	%g1
	siam	0x7
loop_347:
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
loop_348:
	call	loop_349
	mulx	%o3,	0x145B,	%l1
	ta	%xcc,	0x7
	fsrc2s	%f23,	%f22
loop_349:
	tcs	%icc,	0x3
	fbue,a,pt	%fcc2,	loop_350
	call	loop_351
	call	loop_352
	fnands	%f11,	%f22,	%f1
loop_350:
	tge	%icc,	0x7
loop_351:
	call	loop_353
loop_352:
	fmovda	%xcc,	%f2,	%f30
	set	0x60, %g2
	prefetcha	[%l7 + %g2] 0x18,	 2
loop_353:
	fmovsge	%fcc2,	%f7,	%f9
	alignaddrl	%i7,	%l4,	%o4
	fmovd	%f28,	%f30
	nop
	setx	0x30BF699C,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f29
	setx	0xFFEA3C14,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f26
	fadds	%f26,	%f29,	%f15
	fpack16	%f28,	%f5
	fpsub16s	%f15,	%f0,	%f19
	fnot1s	%f0,	%f12
	fmovdne	%xcc,	%f18,	%f18
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	tleu	%xcc,	0x1
	movrgz	%l2,	0x0B3,	%o5
	tneg	%xcc,	0x7
	call	loop_354
	movcc	%icc,	%o0,	%l5
	tg	%xcc,	0x7
	call	loop_355
loop_354:
	fmovrdne	%l3,	%f18,	%f6
	movle	%icc,	0x139,	%g5
	fmovsul	%fcc0,	%f5,	%f31
loop_355:
	movre	%g7,	%o6,	%g3
	call	loop_356
	mulx	%g6,	0x0D82,	%l6
	fmovduge	%fcc2,	%f24,	%f16
	fnot2s	%f7,	%f2
loop_356:
	fmovdug	%fcc3,	%f30,	%f4
	fmovde	%fcc0,	%f4,	%f28
	wr	%g0,	0x88,	%asi
	ldswa	[%l7 + 0x54] %asi,	%o7
	call	loop_357
	movule	%fcc3,	%i3,	%g2
	movle	%icc,	0x71A,	%o2
	rd	%ccr,	%i2
loop_357:
	call	loop_358
	rdpr	%wstate,	%i0
	call	loop_359
	tne	%xcc,	0x4
loop_358:
	tge	%xcc,	0x3
	fand	%f26,	%f6,	%f6
loop_359:
	fnot1s	%f24,	%f21
	call	loop_360
	sdiv	%l0,	0x0CC2,	%i6
	bge,pn	%icc,	loop_361
	call	loop_362
loop_360:
	nop
	setx	0x25FD516CC2670B5A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	fsqrtd	%f12,	%f20
	fmuld8sux16	%f11,	%f22,	%f10
loop_361:
	nop
	setx	0x373E0AEDF924E81C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0xFC65884F,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	fsmuld	%f18,	%f0,	%f24
loop_362:
	rdpr	%otherwin,	%g4
	call	loop_363
	tcs	%icc,	0x3
	tsubcctv	%o1,	%i1,	%i5
	fpmerge	%f4,	%f8,	%f6
loop_363:
	tsubcc	%g1,	%l1,	%i4
	addc	%i7,	%o3,	%o4
	fpsub16s	%f20,	%f5,	%f8
	faligndata	%f16,	%f12,	%f2
	movrgz	%l4,	0x298,	%l2
	movg	%fcc3,	%o5,	%l5
	fmovdn	%icc,	%f26,	%f6
	call	loop_364
	bcc	%icc,	loop_365
	array8	%l3,	%o0,	%g5
	call	loop_366
loop_364:
	subccc	%g7,	0x0C3E,	%o6
loop_365:
	fandnot1	%f14,	%f4,	%f12
	movuge	%fcc2,	0x144,	%g3
loop_366:
	call	loop_367
	brgz,a	%g6,	loop_368
	fmovdvs	%xcc,	%f14,	%f22
	fmovrdlez	%o7,	%f0,	%f4
loop_367:
	movneg	%xcc,	%i3,	%g2
loop_368:
	fmovs	%f18,	%f9
	wr	%o2,	0x1D6D,	%softint
	fpmerge	%f26,	%f3,	%f16
	call	loop_369
	movcs	%xcc,	%l6,	%i0
	for	%f2,	%f10,	%f8
	fmovdug	%fcc3,	%f20,	%f2
loop_369:
	fmovsug	%fcc0,	%f23,	%f4
	brgz,pt	%i2,	loop_370
	bshuffle	%f0,	%f12,	%f14
	call	loop_371
	tvc	%icc,	0x5
loop_370:
	fandnot2	%f18,	%f26,	%f30
	call	loop_372
loop_371:
	movpos	%icc,	%l0,	%g4
	tge	%icc,	0x3
	fors	%f27,	%f3,	%f13
loop_372:
	fpadd16s	%f18,	%f9,	%f18
	fmovsul	%fcc1,	%f6,	%f29
	bmask	%o1,	%i1,	%i5
	call	loop_373
	fmovse	%icc,	%f24,	%f19
	fxnor	%f22,	%f22,	%f22
	brgez	%g1,	loop_374
loop_373:
	call	loop_375
	call	loop_376
	popc	%i6,	%i4
loop_374:
	nop
	fitod	%f6,	%f28
loop_375:
	tvs	%xcc,	0x1
loop_376:
	fmovdul	%fcc1,	%f0,	%f18
	call	loop_377
	fmovsa	%fcc2,	%f23,	%f27
	call	loop_378
	subc	%l1,	%i7,	%o4
loop_377:
	smulcc	%l4,	0x004D,	%l2
	call	loop_379
loop_378:
	popc	0x1801,	%o3
	call	loop_380
	call	loop_381
loop_379:
	umul	%l5,	0x1A33,	%l3
	fbue,a,pn	%fcc3,	loop_382
loop_380:
	movne	%xcc,	0x039,	%o5
loop_381:
	fnegd	%f2,	%f0
	movul	%fcc2,	%o0,	%g5
loop_382:
	bcs,a	%xcc,	loop_383
	nop
	fitod	%f6,	%f18
	fdtox	%f18,	%f14
	movo	%fcc1,	%o6,	%g7
	movu	%fcc3,	%g6,	%o7
loop_383:
	tleu	%xcc,	0x7
	rd	%pc,	%i3
	nop
	fitod	%f2,	%f30
	fdtoi	%f30,	%f28
	movrgz	%g3,	0x1EC,	%o2
	fpsub16	%f8,	%f10,	%f14
	fmuld8ulx16	%f25,	%f30,	%f28
	fnot1	%f8,	%f12
	fxor	%f8,	%f8,	%f8
	fsrc1	%f22,	%f10
	fmovdue	%fcc2,	%f6,	%f24
	call	loop_384
	fmovscs	%icc,	%f5,	%f22
	brgez	%g2,	loop_385
	fmovrdlz	%l6,	%f12,	%f26
loop_384:
	call	loop_386
	brlez,a,pt	%i0,	loop_387
loop_385:
	call	loop_388
	fornot1	%f24,	%f14,	%f12
loop_386:
	nop
	set	0x68, %o2
	stw	%l0,	[%l7 + %o2]
loop_387:
	sethi	0x0EED,	%g4
loop_388:
	call	loop_389
	fands	%f15,	%f23,	%f17
	fpack16	%f6,	%f12
	sra	%i2,	%o1,	%i1
loop_389:
	taddcctv	%i5,	%i6,	%g1
	tsubcc	%i4,	%l1,	%i7
	call	loop_390
	brz,a	%o4,	loop_391
	call	loop_392
	fmovdvc	%xcc,	%f30,	%f0
loop_390:
	call	loop_393
loop_391:
	fcmple16	%f14,	%f0,	%l4
loop_392:
	movre	%l2,	%l5,	%o3
	nop
	setx	0x77D44C7491AF66D4,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0x45B410CA,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	fsmuld	%f28,	%f24,	%f14
loop_393:
	movrlz	%o5,	0x1E6,	%o0
	fmul8x16al	%f23,	%f27,	%f16
	or	%g5,	%o6,	%g7
	call	loop_394
	wr	%g6,	%o7,	%clear_softint
	bvc,a,pt	%xcc,	loop_395
	movre	%i3,	0x1BB,	%g3
loop_394:
	subcc	%l3,	%o2,	%g2
	call	loop_396
loop_395:
	st	%f0,	[%l7 + 0x28]
	call	loop_397
	wr	%i0,	0x176E,	%softint
loop_396:
	rd	%tick_cmpr,	%l0
	call	loop_398
loop_397:
	call	loop_399
	tsubcc	%g4,	%l6,	%o1
	call	loop_400
loop_398:
	nop
	set	0x38, %g6
	ldstub	[%l7 + %g6],	%i1
loop_399:
	edge8	%i5,	%i6,	%i2
	fnand	%f26,	%f16,	%f12
loop_400:
	smul	%i4,	0x08FB,	%l1
	sra	%i7,	%o4,	%l4
	fmovsleu	%xcc,	%f6,	%f23
	fmovrsne	%l2,	%f8,	%f0
	fmovdneg	%xcc,	%f14,	%f6
	wr	%g0,	0x11,	%asi
	stwa	%l5,	[%l7 + 0x44] %asi
	fornot2s	%f20,	%f1,	%f14
	call	loop_401
	edge32ln	%o3,	%g1,	%o5
	movcc	%xcc,	%g5,	%o6
	fmovsle	%icc,	%f14,	%f9
loop_401:
	call	loop_402
	sub	%g7,	%g6,	%o7
	wrpr	%o0,	%i3,	%pil
	srax	%g3,	0x05,	%o2
loop_402:
	fpackfix	%f10,	%f10
	nop
	set	0x4C, %o3
	swap	[%l7 + %o3],	%g2
	fcmpgt16	%f6,	%f14,	%l3
	fsrc2	%f24,	%f4
	set	0x40, %i5
	stda	%f0,	[%l7 + %i5] 0xc5
	edge8l	%i0,	%g4,	%l0
	fnands	%f9,	%f15,	%f19
	call	loop_403
	fmovsa	%xcc,	%f28,	%f31
	add	%l7,	0x10,	%l6
	wr	%g0,	0x04,	%asi
	casxa	[%l6] %asi,	%l6,	%o1
loop_403:
	brlz,a,pn	%i5,	loop_404
	movvs	%xcc,	%i1,	%i2
	nop
	setx	0x99B3DDBF,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f11
	setx	0xB153511A,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f11
	fdivs	%f11,	%f11,	%f11
	fmovdn	%fcc3,	%f6,	%f22
loop_404:
	fmul8x16au	%f4,	%f14,	%f12
	fpmerge	%f24,	%f18,	%f16
	xnorcc	%i6,	%i4,	%i7
	xorcc	%o4,	%l1,	%l2
	call	loop_405
	bgu,pt	%icc,	loop_406
	be,a,pn	%icc,	loop_407
	tcs	%xcc,	0x7
loop_405:
	srlx	%l5,	0x01,	%l4
loop_406:
	call	loop_408
loop_407:
	rdpr	%cleanwin,	%o3
	fmovslg	%fcc2,	%f23,	%f5
	be,a	%xcc,	loop_409
loop_408:
	fmovdul	%fcc1,	%f24,	%f28
	call	loop_410
	addccc	%g1,	%g5,	%o6
loop_409:
	movvc	%icc,	%g7,	%o5
	bg,a	%icc,	loop_411
loop_410:
	call	loop_412
	fmovsue	%fcc0,	%f0,	%f25
	fsrc1s	%f31,	%f10
loop_411:
	sra	%o7,	%g6,	%i3
loop_412:
	wr 	%g0, 	0x5, 	%fprs
	nop
	setx	0x3F585D97D79EF37E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0xE4C9014B71056F13,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fmuld	%f0,	%f16,	%f4
	fmovdg	%xcc,	%f2,	%f24
	call	loop_413
	fmovrdgz	%g3,	%f30,	%f6
	call	loop_414
	call	loop_415
loop_413:
	nop
	setx	0x9EE74A220259F710,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0xAAC28E63698EECCD,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	fdivd	%f30,	%f12,	%f30
	fmovrsgz	%g2,	%f7,	%f5
loop_414:
	andncc	%l3,	0x19B6,	%o2
loop_415:
	call	loop_416
	call	loop_417
	movre	%i0,	0x391,	%g4
	srl	%l6,	%l0,	%o1
loop_416:
	tn	%xcc,	0x5
loop_417:
	fblg,pt	%fcc1,	loop_418
	nop
	setx	0x2EE3F390,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f28
	setx	0x825E36A6,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f11
	fdivs	%f11,	%f28,	%f31
	call	loop_419
	fmovdcs	%xcc,	%f16,	%f4
loop_418:
	fcmpgt32	%f12,	%f30,	%i1
	call	loop_420
loop_419:
	rdpr	%wstate,	%i5
	call	loop_421
	mova	%xcc,	0x2C6,	%i2
loop_420:
	fmul8x16au	%f19,	%f26,	%f8
	fbule,pt	%fcc3,	loop_422
loop_421:
	flushw
	call	loop_423
	call	loop_424
loop_422:
	fmovdlg	%fcc0,	%f20,	%f28
	fxors	%f25,	%f12,	%f0
loop_423:
	fpack16	%f16,	%f19
loop_424:
	call	loop_425
	fcmps	%fcc0,	%f13,	%f23
	fpsub16s	%f7,	%f8,	%f20
	call	loop_426
loop_425:
	rdhpr	%hpstate,	%i4
	nop
	setx	0xE50DDD1C,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f20
	setx	0xDC658F02,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f21
	fmuls	%f21,	%f20,	%f14
	movcs	%xcc,	%i7,	%o4
loop_426:
	fmovdn	%icc,	%f4,	%f2
	faligndata	%f18,	%f0,	%f18
	fmovrslz	%l1,	%f10,	%f12
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	call	loop_427
	wrpr	%i6,	%l5,	%tick
	set	0x60, %i7
	ldda	[%l7 + %i7] 0x19,	%l2
loop_427:
	for	%f14,	%f24,	%f26
	call	loop_428
	fmovdg	%xcc,	%f24,	%f16
	call	loop_429
	fmovsn	%fcc0,	%f5,	%f25
loop_428:
	fpadd32	%f26,	%f18,	%f18
	movu	%fcc2,	%l4,	%g1
loop_429:
	fmovdgu	%icc,	%f18,	%f4
	fpsub16	%f2,	%f4,	%f16
	call	loop_430
	bleu,a	%xcc,	loop_431
	call	loop_432
	tsubcc	%g5,	%o3,	%g7
loop_430:
	tvc	%xcc,	0x7
loop_431:
	fnands	%f25,	%f2,	%f15
loop_432:
	call	loop_433
	nop
	set	0x70, %g4
	stw	%o6,	[%l7 + %g4]
	wr	%o7,	%o5,	%y
	rd	%pc,	%g6
loop_433:
	nop
	set	0x2C, %g5
	swap	[%l7 + %g5],	%o0
	call	loop_434
	movrgz	%g3,	0x22B,	%i3
	nop
	set	0x50, %l2
	std	%f0,	[%l7 + %l2]
	fpsub16	%f30,	%f24,	%f4
loop_434:
	fmovdl	%icc,	%f2,	%f8
	nop
	fitod	%f0,	%f2
	fdtox	%f2,	%f14
	bpos,a,pn	%xcc,	loop_435
	tn	%xcc,	0x4
	fzero	%f26
	sdiv	%l3,	0x07E1,	%g2
loop_435:
	tneg	%xcc,	0x3
	array32	%i0,	%g4,	%o2
	call	loop_436
	sir	0x080A

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	call	loop_437
loop_436:
	edge32n	%i1,	%i5,	%i2
	fmovsle	%icc,	%f3,	%f21
	fone	%f0
loop_437:
	call	loop_438
	movg	%xcc,	0x467,	%o1
	faligndata	%f30,	%f16,	%f22
	call	loop_439
loop_438:
	bvs	%icc,	loop_440
	call	loop_441
	call	loop_442
loop_439:
	tle	%xcc,	0x2
loop_440:
	fba,a	%fcc3,	loop_443
loop_441:
	movn	%xcc,	%i7,	%i4
loop_442:
	nop

loop_443:
	nop

	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 2:
!
!	Type l   	: 18
!	Type a   	: 28
!	Type x   	: 6
!	Type cti   	: 147
!	Type f   	: 168
!	Type i   	: 133
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
	set	0xE,	%g1
	set	0xF,	%g2
	set	0x7,	%g3
	set	0x3,	%g4
	set	0x9,	%g5
	set	0x2,	%g6
	set	0x1,	%g7
	!# Input registers
	set	-0x0,	%i0
	set	-0xF,	%i1
	set	-0x5,	%i2
	set	-0xE,	%i3
	set	-0xA,	%i4
	set	-0xD,	%i5
	set	-0x9,	%i6
	set	-0xF,	%i7
	!# Local registers
	set	0x474C3959,	%l0
	set	0x573AA968,	%l1
	set	0x74D200C5,	%l2
	set	0x576C5D5D,	%l3
	set	0x2091777E,	%l4
	set	0x00DBA1D0,	%l5
	set	0x3933D839,	%l6
	!# Output registers
	set	0x17CA,	%o0
	set	0x0409,	%o1
	set	-0x1949,	%o2
	set	-0x0658,	%o3
	set	0x13C3,	%o4
	set	0x0DF1,	%o5
	set	0x1D33,	%o6
	set	0x032D,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x1805C4311F23DF84)
	INIT_TH_FP_REG(%l7,%f2,0x427AC311A1EBFF7A)
	INIT_TH_FP_REG(%l7,%f4,0xC51749B0AAEE43C0)
	INIT_TH_FP_REG(%l7,%f6,0x20476743466E0F79)
	INIT_TH_FP_REG(%l7,%f8,0x84DEF9172BC0AD59)
	INIT_TH_FP_REG(%l7,%f10,0xADEE57F98E209BC6)
	INIT_TH_FP_REG(%l7,%f12,0x90F1116B2441D9E0)
	INIT_TH_FP_REG(%l7,%f14,0x02F99AEF7A00A98A)
	INIT_TH_FP_REG(%l7,%f16,0x7562B7867BE5FC0E)
	INIT_TH_FP_REG(%l7,%f18,0xBAFB16AB97120954)
	INIT_TH_FP_REG(%l7,%f20,0x3A17AF8097C11167)
	INIT_TH_FP_REG(%l7,%f22,0x6043AECA0E392B09)
	INIT_TH_FP_REG(%l7,%f24,0x29F55E1180198BEE)
	INIT_TH_FP_REG(%l7,%f26,0x6A2AEEA14A4A2618)
	INIT_TH_FP_REG(%l7,%f28,0xA51988D17F70713E)
	INIT_TH_FP_REG(%l7,%f30,0x9809E1D4CEE6807D)

	!# Execute Main Diag ..

	mulx	%l1,	0x0640,	%i6
	rdhpr	%htba,	%l5
	fmovdl	%fcc2,	%f30,	%f10
	fmovdlg	%fcc0,	%f4,	%f30
	call	loop_444
	fmovrslz	%o4,	%f16,	%f14
	call	loop_445
	fmovdvs	%xcc,	%f14,	%f14
loop_444:
	movrlz	%l2,	0x181,	%g1
	nop
	fitod	%f4,	%f26
	fdtos	%f26,	%f5
loop_445:
	rdpr	%otherwin,	%g5
	movlg	%fcc0,	0x390,	%o3
	fpmerge	%f19,	%f4,	%f8
	fpadd16s	%f21,	%f13,	%f30
	call	loop_446
	rdpr	%tba,	%l4
	fmul8x16al	%f9,	%f4,	%f20
	movneg	%icc,	0x216,	%o6
loop_446:
	nop
	set	0x19, %g1
	ldub	[%l7 + %g1],	%o7
	fmovda	%fcc0,	%f14,	%f20
	fpsub32s	%f15,	%f16,	%f9
	fnegs	%f7,	%f28
	call	loop_447
	andcc	%o5,	0x091F,	%g6
	fmovrdlez	%o0,	%f8,	%f22
	call	loop_448
loop_447:
	call	loop_449
	nop
	set	0x10, %i0
	ldd	[%l7 + %i0],	%f6
	call	loop_450
loop_448:
	udivcc	%g3,	0x117E,	%g7
loop_449:
	andcc	%l3,	0x158B,	%g2
	call	loop_451
loop_450:
	fcmpne16	%f22,	%f12,	%i0
	flushw
	fpackfix	%f0,	%f22
loop_451:
	fmovsug	%fcc2,	%f31,	%f24
	fmovdcs	%xcc,	%f8,	%f12
	edge32l	%i3,	%o2,	%g4
	rdpr	%canrestore,	%l0
	tn	%icc,	0x6
	call	loop_452
	movue	%fcc2,	%i1,	%i5
	nop
	setx	0x1743,	%l0,	%o1
	udivcc	%l6,	%o1,	%i7
	fbne	%fcc3,	loop_453
loop_452:
	fcmple32	%f28,	%f24,	%i4
	orn	%i2,	0x0C1B,	%i6
	fmovdge	%fcc0,	%f4,	%f20
loop_453:
	movrlz	%l1,	%o4,	%l2
	movle	%icc,	0x3A6,	%l5
	rdpr	%pil,	%g5
	fbne,pn	%fcc1,	loop_454
	movrlez	%o3,	0x1D6,	%l4
	fsrc1s	%f19,	%f0
	fmovdneg	%icc,	%f24,	%f0
loop_454:
	fbg,a,pt	%fcc2,	loop_455
	call	loop_456
	movgu	%xcc,	0x72F,	%o6
	call	loop_457
loop_455:
	popc	0x1478,	%o7
loop_456:
	nop
	fitod	%f4,	%f4
	fdtox	%f4,	%f4
	stw	%g1,	[%l7 + 0x48]
loop_457:
	sll	%o5,	0x05,	%g6
	fpsub32s	%f10,	%f19,	%f23
	tsubcc	%g3,	0x08D9,	%o0
	fmul8x16	%f5,	%f14,	%f12
	nop
	setx	loop_458,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x021100001405,	%l0,	%l1
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
	call	loop_459
	call	loop_460
	srax	%l3,	0x1E,	%g2
loop_458:
	call	loop_461
loop_459:
	for	%f30,	%f12,	%f18
loop_460:
	tcc	%icc,	0x0
	sll	%i0,	0x11,	%g7
loop_461:
	nop
	wr	%g0,	0x10,	%asi
	ldsha	[%l7 + 0x16] %asi,	%i3
	brnz,a,pn	%g4,	loop_462
	nop
	setx	0x693C4F4254BF2339,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0xBCB96F4902576232,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	faddd	%f18,	%f26,	%f0
	call	loop_463
	fpsub32	%f22,	%f16,	%f18
loop_462:
	nop
	set	0x38, %o1
	ldx	[%l7 + %o1],	%o2
	edge16n	%l0,	%i5,	%i1
loop_463:
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	call	loop_464
	fpsub16	%f12,	%f8,	%f20
	call	loop_465
	srax	%o1,	%l6,	%i4
loop_464:
	add	%i2,	0x0C1A,	%i7
	fnot2	%f2,	%f14
loop_465:
	fmovdvs	%xcc,	%f6,	%f28
	wrpr	%i6,	0x0BB3,	%tick
	call	loop_466
	fmovsgu	%icc,	%f3,	%f18
	alignaddr	%o4,	%l1,	%l2
	fcmpes	%fcc3,	%f18,	%f17
loop_466:
	movrgez	%l5,	0x178,	%o3
	fcmpne16	%f24,	%f8,	%g5
	movge	%fcc0,	%o6,	%l4
	andn	%g1,	0x0AEC,	%o7
	fmovdule	%fcc3,	%f22,	%f20
	alignaddrl	%g6,	%o5,	%o0
	addccc	%g3,	0x068D,	%l3
	flushw
	fmovrde	%i0,	%f14,	%f8
	call	loop_467
	andcc	%g2,	0x0326,	%g7
	call	loop_468
	fmovdge	%icc,	%f22,	%f0
loop_467:
	call	loop_469
	nop
	fitos	%f12,	%f6
	fstox	%f6,	%f6
loop_468:
	bcs,pn	%icc,	loop_470
	rdpr	%wstate,	%g4
loop_469:
	fcmpne32	%f10,	%f2,	%i3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x60E, 	%hsys_tick_cmpr
loop_470:
	movneg	%xcc,	%i1,	%o1
	andncc	%l6,	0x13A5,	%i5
	fmul8x16au	%f30,	%f8,	%f24
	call	loop_471
	movule	%fcc3,	%i4,	%i2
	fnegs	%f15,	%f20
	bvs,pn	%xcc,	loop_472
loop_471:
	call	loop_473
	fnor	%f28,	%f26,	%f8
	movgu	%xcc,	0x6DD,	%i7
loop_472:
	call	loop_474
loop_473:
	call	loop_475
	fmovsl	%fcc1,	%f7,	%f17
	nop
	fitod	%f8,	%f4
	fdtox	%f4,	%f0
loop_474:
	fmovsn	%icc,	%f30,	%f28
loop_475:
	tl	%xcc,	0x4
	call	loop_476
	movu	%fcc1,	0x1E0,	%o4
	call	loop_477
	fsrc1	%f20,	%f24
loop_476:
	fbge,a,pt	%fcc0,	loop_478
	nop
	setx	0x5A2954B7,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%fsr
loop_477:
	fxors	%f0,	%f3,	%f20
	taddcctv	%l1,	0x13EB,	%l2
loop_478:
	nop
	fitod	%f6,	%f0
	fdtoi	%f0,	%f26
	edge16l	%i6,	%o3,	%l5
	fba,a	%fcc3,	loop_479
	fmovdug	%fcc0,	%f14,	%f20
	bn,a,pn	%icc,	loop_480
	rdhpr	%hsys_tick_cmpr,	%o6
loop_479:
	movu	%fcc2,	0x3B1,	%l4
	rdpr	%cwp,	%g5
loop_480:
	nop
	fitos	%f5,	%f3
	fstox	%f3,	%f6
	fxtos	%f6,	%f0
	movrne	%g1,	%g6,	%o7
	bmask	%o5,	%o0,	%l3
	call	loop_481
	movue	%fcc0,	0x28F,	%g3
	fnegd	%f22,	%f6
	addccc	%g2,	%i0,	%g7
loop_481:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x04B, 	%hsys_tick_cmpr
	call	loop_482
	call	loop_483
	rd	%pc,	%l0
	edge32ln	%g4,	%i1,	%l6
loop_482:
	fsrc1	%f0,	%f10
loop_483:
	edge16ln	%o1,	%i4,	%i2
	call	loop_484
	movul	%fcc3,	0x681,	%i7
	call	loop_485
	nop
	fitos	%f5,	%f16
	fstod	%f16,	%f22
loop_484:
	nop
	setx	0x97C4EE5D,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f6
	setx	0x6778A20A,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f15
	fdivs	%f15,	%f6,	%f8
	call	loop_486
loop_485:
	call	loop_487
	fpadd16	%f26,	%f6,	%f20
	nop
	setx	0x1811,	%l0,	%l1
	sdivcc	%i5,	%l1,	%o4
loop_486:
	movrgez	%i6,	0x220,	%o3
loop_487:
	nop
	wr	%g0,	0x2b,	%asi
	stba	%l2,	[%l7 + 0x20] %asi
	membar	#Sync
	fmovdu	%fcc0,	%f28,	%f2
	movrlez	%o6,	%l4,	%l5
	st	%f6,	[%l7 + 0x0C]
	fabss	%f11,	%f23
	xnorcc	%g5,	%g1,	%o7
	call	loop_488
	movcs	%xcc,	%g6,	%o0
	call	loop_489
	rdhpr	%hpstate,	%l3
loop_488:
	call	loop_490
	movl	%fcc2,	%o5,	%g3
loop_489:
	fones	%f29
	fmovdcc	%xcc,	%f4,	%f16
loop_490:
	subccc	%g2,	0x0293,	%g7
	fblg,a	%fcc3,	loop_491
	call	loop_492
	fpadd16s	%f25,	%f8,	%f28
	movo	%fcc3,	%i3,	%o2
loop_491:
	call	loop_493
loop_492:
	call	loop_494
	call	loop_495
	tsubcc	%i0,	0x18AF,	%l0
loop_493:
	fzero	%f10
loop_494:
	movne	%icc,	0x02D,	%g4
loop_495:
	array16	%i1,	%o1,	%i4
	fmovdue	%fcc0,	%f30,	%f0
	addc	%l6,	%i2,	%i5
	flushw
	fmovscs	%xcc,	%f6,	%f21
	call	loop_496
	fcmpgt16	%f14,	%f2,	%l1
	addcc	%i7,	%o4,	%o3
	array32	%i6,	%l2,	%o6
loop_496:
	call	loop_497
	call	loop_498
	call	loop_499
	fcmpgt16	%f22,	%f10,	%l4
loop_497:
	call	loop_500
loop_498:
	andn	%l5,	0x0772,	%g1
loop_499:
	call	loop_501
	call	loop_502
loop_500:
	fmul8sux16	%f2,	%f4,	%f22
	sethi	0x0703,	%g5
loop_501:
	call	loop_503
loop_502:
	edge8l	%o7,	%g6,	%l3
	fmovrdgz	%o0,	%f28,	%f24
	tl	%icc,	0x1
loop_503:
	edge8ln	%g3,	%g2,	%g7
	movcs	%xcc,	%i3,	%o5
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xF9A, 	%hsys_tick_cmpr
	brnz,a,pt	%l0,	loop_504
	fxors	%f21,	%f29,	%f15
	call	loop_505
	movlg	%fcc3,	%o2,	%i1
loop_504:
	nop
	setx	loop_506,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x001200001404,	%l0,	%l1
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
	xnorcc	%g4,	%i4,	%l6
loop_505:
	nop
	set	0x5C, %i6
	flush	%l7 + %i6
	fpadd32	%f10,	%f12,	%f10
loop_506:
	fbn,pn	%fcc2,	loop_507
	fmovdleu	%xcc,	%f12,	%f26
	orcc	%o1,	%i5,	%i2
	nop
	setx	0x5A2453AC8E6F0071,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0x36263EB8AEF0C470,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	fdivd	%f24,	%f8,	%f8
loop_507:
	rdhpr	%hintp,	%i7
	andcc	%o4,	0x1830,	%l1
	fnot1	%f20,	%f4
	rdpr	%gl,	%i6
	fmovrslz	%o3,	%f12,	%f23
	sll	%l2,	%l4,	%l5
	orcc	%g1,	0x0B4D,	%o6
	addc	%g5,	0x1C49,	%g6
	rd	%y,	%o7
	ldub	[%l7 + 0x47],	%l3
	call	loop_508
	fmovscs	%icc,	%f17,	%f26
	fmovrse	%g3,	%f15,	%f11
	movo	%fcc2,	0x657,	%o0
loop_508:
	movg	%fcc2,	0x1E3,	%g7
	fands	%f9,	%f10,	%f26
	fbul,pn	%fcc0,	loop_509
	call	loop_510
	call	loop_511
	call	loop_512
loop_509:
	alignaddrl	%i3,	%g2,	%o5
loop_510:
	call	loop_513
loop_511:
	fmovdu	%fcc2,	%f16,	%f24
loop_512:
	call	loop_514
	fmovrslz	%l0,	%f15,	%f20
loop_513:
	nop
	setx	0x9571749BDF31AE46,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0x7E990AFC4D801FF1,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	faddd	%f24,	%f2,	%f18
	fornot2	%f14,	%f12,	%f12
loop_514:
	movneg	%xcc,	0x136,	%i0
	orn	%o2,	%i1,	%g4
	fmovscs	%icc,	%f14,	%f9
	movl	%xcc,	%i4,	%o1
	fmovsvc	%icc,	%f24,	%f25
	set	0x28, %i4
	prefetcha	[%l7 + %i4] 0x89,	 0
	tne	%icc,	0x2
	fmul8x16	%f30,	%f12,	%f26
	nop
	setx	0xE158E10F,	%l0,	%l6
	st	%l6,	[%l7 + 0x1C]
	ld	[%l7 + 0x1C],	%fsr
	call	loop_515
	sdivcc	%i5,	0x1C2E,	%i7
	fxor	%f12,	%f10,	%f16
	fmovsug	%fcc1,	%f27,	%f20
loop_515:
	sra	%o4,	%i2,	%l1
	subcc	%i6,	%o3,	%l4
	array8	%l5,	%g1,	%l2
	call	loop_516
	call	loop_517
	fnot2	%f28,	%f28
	rdhpr	%htba,	%g5
loop_516:
	call	loop_518
loop_517:
	call	loop_519
	tvs	%icc,	0x0
	set	0x70, %i1
	stwa	%g6,	[%l7 + %i1] 0x80
loop_518:
	movgu	%icc,	0x3C7,	%o7
loop_519:
	tle	%xcc,	0x4
	fmovrsgez	%l3,	%f11,	%f5
	bl	%icc,	loop_520
	call	loop_521
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	andncc	%g3,	0x061D,	%o6
loop_520:
	orn	%o0,	0x126A,	%i3
loop_521:
	call	loop_522
	fmovsa	%fcc3,	%f16,	%f4
	fmovdneg	%icc,	%f0,	%f16
	add	%l7,	0x18,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%g2
	casa	[%l6] %asi,	%g2,	%g7
loop_522:
	be,a,pt	%icc,	loop_523
	fmovdvs	%icc,	%f20,	%f10
	tcc	%xcc,	0x6
	nop
	fitod	%f4,	%f12
	fdtox	%f12,	%f12
loop_523:
	fmovsue	%fcc2,	%f22,	%f30
	fnor	%f12,	%f8,	%f12
	rdhpr	%ver,	%o5
	set	0x30, %o5
	stda	%l0,	[%l7 + %o5] 0x2f
	membar	#Sync
	mova	%icc,	%o2,	%i1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xDE2, 	%hsys_tick_cmpr
	call	loop_524
	edge8n	%i4,	%o1,	%l6
	fmovsa	%icc,	%f11,	%f1
	fexpand	%f27,	%f30
loop_524:
	wrpr	%i5,	0x079E,	%cwp
	call	loop_525
	fmovde	%icc,	%f4,	%f0
	edge16ln	%i7,	%o4,	%i0
	fexpand	%f22,	%f6
loop_525:
	fmovrsne	%i2,	%f31,	%f7
	subc	%l1,	0x05F9,	%i6
	fcmped	%fcc2,	%f28,	%f10
	rdhpr	%hintp,	%l4
	fmovdul	%fcc0,	%f16,	%f2
	fcmpes	%fcc3,	%f6,	%f1
	call	loop_526
	fbu,a	%fcc2,	loop_527
	call	loop_528
	fmovdgu	%icc,	%f4,	%f14
loop_526:
	movre	%o3,	0x372,	%l5
loop_527:
	call	loop_529
loop_528:
	edge32	%g1,	%g5,	%l2
	wr	%g0,	0x04,	%asi
	stda	%o6,	[%l7 + 0x48] %asi
loop_529:
	orn	%g6,	%l3,	%o6
	st	%f23,	[%l7 + 0x40]
	fpsub32s	%f7,	%f4,	%f24
	call	loop_530
	call	loop_531
	fnot1	%f2,	%f30
	fcmpgt16	%f10,	%f8,	%o0
loop_530:
	call	loop_532
loop_531:
	call	loop_533
	fba,a	%fcc1,	loop_534
	call	loop_535
loop_532:
	call	loop_536
loop_533:
	call	loop_537
loop_534:
	movgu	%icc,	0x1CB,	%g3
loop_535:
	pdist	%f0,	%f28,	%f24
loop_536:
	edge32n	%i3,	%g2,	%o5
loop_537:
	tgu	%icc,	0x6
	call	loop_538
	call	loop_539
	orcc	%l0,	%g7,	%o2
	call	loop_540
loop_538:
	call	loop_541
loop_539:
	nop
	setx	0x014F,	%l0,	%g4
	udiv	%i1,	%g4,	%i4
	fpmerge	%f24,	%f17,	%f4
loop_540:
	tn	%xcc,	0x6
loop_541:
	fba,a	%fcc0,	loop_542
	call	loop_543
	call	loop_544
	call	loop_545
loop_542:
	srlx	%l6,	%i5,	%o1
loop_543:
	call	loop_546
loop_544:
	call	loop_547
loop_545:
	fmovdue	%fcc0,	%f10,	%f30
	call	loop_548
loop_546:
	call	loop_549
loop_547:
	umul	%i7,	0x0BDF,	%o4
	call	loop_550
loop_548:
	call	loop_551
loop_549:
	rdpr	%tl,	%i0
	fmovspos	%xcc,	%f15,	%f10
loop_550:
	fornot2	%f4,	%f6,	%f20
loop_551:
	bvs,a,pn	%xcc,	loop_552
	rd	%pc,	%l1
	edge8	%i6,	%i2,	%l4
	te	%icc,	0x0
loop_552:
	te	%xcc,	0x4
	nop
	setx	0xCB390BBB5CCCC41A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	fsqrtd	%f0,	%f6
	call	loop_553
	movvc	%xcc,	%o3,	%l5
	fbl,a,pn	%fcc3,	loop_554
	call	loop_555
loop_553:
	movrlz	%g1,	%l2,	%g5
	call	loop_556
loop_554:
	call	loop_557
loop_555:
	nop
	set	0x0A, %g3
	sth	%g6,	[%l7 + %g3]
	for	%f14,	%f14,	%f20
loop_556:
	fbue,a,pn	%fcc3,	loop_558
loop_557:
	sdiv	%l3,	0x1B41,	%o7
	fnot2	%f28,	%f12
	fmovrslz	%o6,	%f14,	%f23
loop_558:
	call	loop_559
	tsubcc	%o0,	%i3,	%g3
	movvs	%xcc,	0x4A9,	%o5
	fcmpgt32	%f14,	%f30,	%g2
loop_559:
	call	loop_560
	mova	%xcc,	%l0,	%o2
	fpmerge	%f7,	%f25,	%f12
	stx	%i1,	[%l7 + 0x18]
loop_560:
	movrgz	%g4,	%i4,	%l6
	call	loop_561
	call	loop_562
	fbe,a	%fcc1,	loop_563
	fands	%f1,	%f30,	%f19
loop_561:
	bcs,a	%icc,	loop_564
loop_562:
	call	loop_565
loop_563:
	call	loop_566
	bcs,a,pn	%icc,	loop_567
loop_564:
	movug	%fcc3,	0x409,	%i5
loop_565:
	call	loop_568
loop_566:
	call	loop_569
loop_567:
	call	loop_570
	movl	%fcc0,	0x037,	%g7
loop_568:
	fba,pn	%fcc3,	loop_571
loop_569:
	nop
	setx	0x10CB,	%l0,	%i7
	sdivcc	%o1,	%i7,	%o4
loop_570:
	fble,pt	%fcc3,	loop_572
	call	loop_573
loop_571:
	fxor	%f20,	%f2,	%f16
	movpos	%xcc,	%l1,	%i6
loop_572:
	fzero	%f22
loop_573:
	movre	%i0,	0x276,	%i2
	fandnot1s	%f29,	%f30,	%f25
	call	loop_574
	call	loop_575
	fors	%f11,	%f30,	%f12
	set	0x0C, %l5
	sta	%f17,	[%l7 + %l5] 0x0c
loop_574:
	fbule,a	%fcc3,	loop_576
loop_575:
	fxors	%f29,	%f28,	%f0
	call	loop_577
	fmovdge	%fcc0,	%f28,	%f30
loop_576:
	nop
	fitos	%f5,	%f18
	taddcc	%o3,	0x0D24,	%l5
loop_577:
	call	loop_578
	call	loop_579
	fcmpgt32	%f20,	%f2,	%l4
	fmovdvs	%icc,	%f12,	%f8
loop_578:
	movrgz	%l2,	0x3AF,	%g5
loop_579:
	call	loop_580
	fmovde	%icc,	%f22,	%f6
	call	loop_581
	taddcc	%g6,	%g1,	%o7
loop_580:
	fnegd	%f28,	%f30
	call	loop_582
loop_581:
	fbne,pn	%fcc3,	loop_583
	nop
	fitod	%f6,	%f4
	fdtoi	%f4,	%f8
	movvs	%icc,	0x6B3,	%o6
loop_582:
	fmul8x16al	%f16,	%f10,	%f24
loop_583:
	fand	%f16,	%f8,	%f14
	fbne,a,pn	%fcc3,	loop_584
	ld	[%l7 + 0x1C],	%f23
	movule	%fcc1,	%l3,	%o0
	call	loop_585
loop_584:
	call	loop_586
	tcs	%xcc,	0x4
	sll	%g3,	%i3,	%o5
loop_585:
	call	loop_587
loop_586:
	fornot1s	%f3,	%f6,	%f0
	tcs	%icc,	0x3
	call	loop_588
loop_587:
	call	loop_589
	fsrc2s	%f27,	%f20
	sethi	0x0C5D,	%l0
loop_588:
	movue	%fcc1,	%o2,	%i1
loop_589:
	fcmps	%fcc0,	%f21,	%f6
	call	loop_590
	orncc	%g4,	0x0CEF,	%g2
	call	loop_591
	fmovde	%icc,	%f24,	%f30
loop_590:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	stbar
loop_591:
	faligndata	%f14,	%f24,	%f24
	add	%i4,	%o1,	%g7
	call	loop_592
	nop
	setx	0xDEF4A40B,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f12
	fsqrts	%f12,	%f24
	nop
	setx	0x5C525155BB04CD11,	%l0,	%l6
	stx	%l6,	[%l7 + 0x40]
	ldx	[%l7 + 0x40],	%fsr
	array32	%o4,	%l1,	%i7
loop_592:
	edge16l	%i6,	%i2,	%o3
	call	loop_593
	call	loop_594
	fsrc2	%f8,	%f24
	orcc	%i0,	%l5,	%l4
loop_593:
	call	loop_595
loop_594:
	call	loop_596
	movrne	%g5,	%g6,	%l2
	udiv	%g1,	0x1B15,	%o6
loop_595:
	bg,a,pn	%xcc,	loop_597
loop_596:
	call	loop_598
	wr	%o7,	%l3,	%set_softint
	for	%f10,	%f12,	%f14
loop_597:
	call	loop_599
loop_598:
	fxors	%f24,	%f7,	%f21
	bvs,a,pn	%icc,	loop_600
	call	loop_601
loop_599:
	call	loop_602
	fabss	%f24,	%f31
loop_600:
	nop

loop_601:
	nop

loop_602:
	nop

	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 3:
!
!	Type l   	: 23
!	Type a   	: 26
!	Type x   	: 8
!	Type cti   	: 159
!	Type f   	: 139
!	Type i   	: 145
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
	set	0x5,	%g1
	set	0x2,	%g2
	set	0x2,	%g3
	set	0x8,	%g4
	set	0x6,	%g5
	set	0x6,	%g6
	set	0x7,	%g7
	!# Input registers
	set	-0xB,	%i0
	set	-0x9,	%i1
	set	-0xE,	%i2
	set	-0xA,	%i3
	set	-0x7,	%i4
	set	-0x8,	%i5
	set	-0x5,	%i6
	set	-0x2,	%i7
	!# Local registers
	set	0x013FAFB1,	%l0
	set	0x0E05A741,	%l1
	set	0x084EE12E,	%l2
	set	0x7B8D92F8,	%l3
	set	0x5DD9F1E0,	%l4
	set	0x36735207,	%l5
	set	0x26C3F144,	%l6
	!# Output registers
	set	0x1A82,	%o0
	set	-0x04EB,	%o1
	set	-0x13CA,	%o2
	set	0x1DBE,	%o3
	set	-0x03DE,	%o4
	set	0x0247,	%o5
	set	0x038C,	%o6
	set	-0x157B,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x1805C4311F23DF84)
	INIT_TH_FP_REG(%l7,%f2,0x427AC311A1EBFF7A)
	INIT_TH_FP_REG(%l7,%f4,0xC51749B0AAEE43C0)
	INIT_TH_FP_REG(%l7,%f6,0x20476743466E0F79)
	INIT_TH_FP_REG(%l7,%f8,0x84DEF9172BC0AD59)
	INIT_TH_FP_REG(%l7,%f10,0xADEE57F98E209BC6)
	INIT_TH_FP_REG(%l7,%f12,0x90F1116B2441D9E0)
	INIT_TH_FP_REG(%l7,%f14,0x02F99AEF7A00A98A)
	INIT_TH_FP_REG(%l7,%f16,0x7562B7867BE5FC0E)
	INIT_TH_FP_REG(%l7,%f18,0xBAFB16AB97120954)
	INIT_TH_FP_REG(%l7,%f20,0x3A17AF8097C11167)
	INIT_TH_FP_REG(%l7,%f22,0x6043AECA0E392B09)
	INIT_TH_FP_REG(%l7,%f24,0x29F55E1180198BEE)
	INIT_TH_FP_REG(%l7,%f26,0x6A2AEEA14A4A2618)
	INIT_TH_FP_REG(%l7,%f28,0xA51988D17F70713E)
	INIT_TH_FP_REG(%l7,%f30,0x9809E1D4CEE6807D)

	!# Execute Main Diag ..

	movl	%fcc0,	%g3,	%i3
	call	loop_603
	call	loop_604
	call	loop_605
	call	loop_606
loop_603:
	movcs	%xcc,	0x61C,	%o0
loop_604:
	nop
	fitos	%f5,	%f0
	fstoi	%f0,	%f17
loop_605:
	call	loop_607
loop_606:
	call	loop_608
	bvs,pn	%xcc,	loop_609
	call	loop_610
loop_607:
	nop
	fitos	%f6,	%f16
	fstoi	%f16,	%f6
loop_608:
	fmovdule	%fcc3,	%f24,	%f10
loop_609:
	movrne	%o5,	0x2F5,	%o2
loop_610:
	movl	%fcc2,	0x70F,	%l0
	smul	%i1,	0x0758,	%g4
	tn	%xcc,	0x3
	fmovdul	%fcc3,	%f2,	%f16
	call	loop_611
	bmask	%g2,	%l6,	%i4
	umul	%i5,	%o1,	%g7
	call	loop_612
loop_611:
	fmul8x16au	%f21,	%f4,	%f24
	edge8	%o4,	%i7,	%i6
	move	%fcc2,	%l1,	%i2
loop_612:
	movge	%fcc3,	0x48D,	%i0
	wrpr	%l5,	0x02A8,	%pil
	nop
	fitos	%f20,	%f10
	edge8n	%l4,	%g5,	%g6
	fmovdug	%fcc1,	%f18,	%f8
	bpos,a	%xcc,	loop_613
	bl,pn	%icc,	loop_614
	stbar
	call	loop_615
loop_613:
	nop
	setx	loop_616,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x004400001407,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_614:
	subcc	%o3,	%g1,	%o6
	call	loop_617
loop_615:
	flushw
loop_616:
	fpadd32	%f8,	%f4,	%f8

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_617:
	tsubcc	%l3,	0x112F,	%g3
	udiv	%o7,	0x00C5,	%i3
	fnegs	%f3,	%f22
	fnot2	%f20,	%f18
	call	loop_618
	call	loop_619
	call	loop_620
	for	%f20,	%f12,	%f6
loop_618:
	fbue,a,pt	%fcc1,	loop_621
loop_619:
	wrpr 	%g0, 	0x0, 	%gl
loop_620:
	call	loop_622
	fpsub16	%f4,	%f12,	%f8
loop_621:
	fmovsug	%fcc1,	%f16,	%f17
	fmovsvc	%xcc,	%f7,	%f28
loop_622:
	movrlz	%o2,	0x0D3,	%o0
	srlx	%l0,	0x19,	%g4
	tl	%icc,	0x1
	movrgez	%g2,	%i1,	%l6
	smul	%i4,	%i5,	%o1
	rdhpr	%hintp,	%g7
	mova	%fcc1,	0x4F6,	%o4
	call	loop_623
	nop
	fitos	%f14,	%f8
	fstoi	%f8,	%f8
	bneg,a,pt	%icc,	loop_624
	movle	%xcc,	%i6,	%i7
loop_623:
	call	loop_625
	orncc	%i2,	%l1,	%i0
loop_624:
	fnands	%f6,	%f6,	%f18
	fpsub16	%f14,	%f10,	%f0
loop_625:
	fmovsgu	%xcc,	%f12,	%f15
	call	loop_626
	fmovrsgez	%l5,	%f23,	%f12
	bmask	%g5,	%g6,	%l4
	bmask	%o3,	%g1,	%o6
loop_626:
	nop
	wr	%g0,	0x11,	%asi
	ldsha	[%l7 + 0x52] %asi,	%l2
	movrlez	%l3,	0x210,	%g3
	ba,a,pn	%icc,	loop_627
	movcc	%xcc,	0x108,	%i3
	addc	%o5,	0x13FD,	%o2
	add	%l7,	0x28,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%o0
	casxa	[%l6] 0x80,	%o0,	%o7
loop_627:
	rdhpr	%htba,	%l0
	smul	%g2,	%g4,	%i1
	call	loop_628
	call	loop_629
	call	loop_630
	call	loop_631
loop_628:
	rd	%sys_tick_cmpr,	%i4
loop_629:
	ldd	[%l7 + 0x30],	%i4
loop_630:
	fbne,a	%fcc2,	loop_632
loop_631:
	mova	%icc,	0x1C2,	%l6
	fpack32	%f26,	%f22,	%f20
	call	loop_633
loop_632:
	call	loop_634
	udiv	%o1,	0x19C3,	%g7
	fnands	%f29,	%f17,	%f10
loop_633:
	fandnot2s	%f0,	%f13,	%f6
loop_634:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fcmple16	%f12,	%f10,	%i2
	rdpr	%wstate,	%i7
	call	loop_635
	rdhpr	%ver,	%i0
	fnand	%f8,	%f8,	%f10
	udivcc	%l1,	0x0C8C,	%g5
loop_635:
	nop
	set	0x30, %o7
	ldsw	[%l7 + %o7],	%g6
	fmovde	%fcc1,	%f12,	%f12
	tcc	%icc,	0x1
	call	loop_636
	bgu,a,pn	%icc,	loop_637
	tle	%icc,	0x2
	and	%l5,	%l4,	%g1
loop_636:
	nop
	wr	%g0,	0x04,	%asi
	lduha	[%l7 + 0x46] %asi,	%o6
loop_637:
	edge32n	%o3,	%l3,	%g3
	edge32n	%l2,	%o5,	%i3
	call	loop_638
	call	loop_639
	rd	%asi,	%o0
	fmovdneg	%icc,	%f28,	%f28
loop_638:
	call	loop_640
loop_639:
	fxors	%f8,	%f11,	%f28
	add	%l7,	0x08,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%o2
	casxa	[%l6] %asi,	%o2,	%l0
loop_640:
	movue	%fcc1,	%o7,	%g4
	call	loop_641
	call	loop_642
	fnands	%f5,	%f11,	%f4
	bcc,a	%icc,	loop_643
loop_641:
	orn	%g2,	0x1273,	%i1
loop_642:
	xorcc	%i5,	%i4,	%l6
	tcs	%icc,	0x6
loop_643:
	nop
	add	%l7,	0x18,	%l6
	wr	%g0,	0x19,	%asi
	ldxa	[%l6] %asi,	%g7
	casxa	[%l6] 0x19,	%g7,	%o1
	fornot1	%f24,	%f10,	%f6
	umulcc	%o4,	0x13FF,	%i2
	taddcctv	%i7,	0x06F7,	%i0
	call	loop_644
	fornot2	%f2,	%f0,	%f0
	call	loop_645
	fmovsn	%fcc1,	%f11,	%f28
loop_644:
	fmovrsgez	%l1,	%f8,	%f22
	edge8l	%g5,	%g6,	%l5
loop_645:
	call	loop_646
	call	loop_647
	tvc	%xcc,	0x7
	call	loop_648
loop_646:
	fone	%f18
loop_647:
	call	loop_649
	call	loop_650
loop_648:
	call	loop_651
	and	%i6,	%g1,	%o6
loop_649:
	addc	%l4,	0x1BE0,	%o3
loop_650:
	bn	%icc,	loop_652
loop_651:
	call	loop_653
	call	loop_654
	call	loop_655
loop_652:
	bvc,pn	%xcc,	loop_656
loop_653:
	call	loop_657
loop_654:
	movcc	%xcc,	0x239,	%g3
loop_655:
	rdhpr	%ver,	%l2
loop_656:
	fmovdne	%fcc3,	%f10,	%f20
loop_657:
	nop
	fitod	%f4,	%f28
	fdtoi	%f28,	%f8
	fblg	%fcc2,	loop_658
	tl	%xcc,	0x2
	call	loop_659
	fnors	%f2,	%f23,	%f20
loop_658:
	orncc	%o5,	%i3,	%o0
	smulcc	%l3,	%l0,	%o7
loop_659:
	call	loop_660
	call	loop_661
	call	loop_662
	nop
	setx	loop_663,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x021200001405,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_660:
	fmovsleu	%icc,	%f15,	%f26
loop_661:
	fnor	%f8,	%f0,	%f26
loop_662:
	std	%f8,	[%l7 + 0x30]
loop_663:
	fmovdcs	%icc,	%f24,	%f4
	edge32n	%o2,	%g2,	%i1
	movn	%xcc,	%i5,	%g4
	call	loop_664
	movgu	%xcc,	%i4,	%l6
	nop
	setx	0x04FC,	%l0,	%o4
	udivcc	%g7,	%o4,	%o1
	wrpr	%i7,	0x0404,	%tick
loop_664:
	call	loop_665
	orncc	%i0,	0x1499,	%i2
	wr	%l1,	%g6,	%softint
	fnot2s	%f18,	%f30
loop_665:
	call	loop_666
	call	loop_667
	fandnot2	%f6,	%f18,	%f30
	fcmpgt32	%f30,	%f2,	%g5
loop_666:
	fmovdpos	%icc,	%f30,	%f26
loop_667:
	fbu,a	%fcc0,	loop_668
	ba,a,pn	%xcc,	loop_669
	movg	%icc,	%i6,	%g1
	call	loop_670
loop_668:
	fmovs	%f6,	%f30
loop_669:
	subccc	%o6,	0x1414,	%l4
	fandnot1s	%f30,	%f11,	%f4
loop_670:
	call	loop_671
	call	loop_672
	call	loop_673
	call	loop_674
loop_671:
	call	loop_675
loop_672:
	nop
	setx	0x6ED7FAFE788D578C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0xA57601BA614D2925,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	fmuld	%f20,	%f26,	%f26
loop_673:
	srlx	%o3,	%l5,	%l2
loop_674:
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
loop_675:
	fone	%f0
	sdivcc	%g3,	0x0501,	%i3
	taddcc	%o5,	0x04BC,	%l3
	sllx	%l0,	0x18,	%o0
	tvc	%xcc,	0x6
	fcmpd	%fcc3,	%f18,	%f16
	call	loop_676
	edge8ln	%o7,	%g2,	%o2
	fmovrdgez	%i5,	%f4,	%f2
	fzero	%f10
loop_676:
	fpackfix	%f0,	%f23
	bpos,pn	%xcc,	loop_677
	rd	%fprs,	%i1
	fzeros	%f19
	fmovsn	%icc,	%f1,	%f30
loop_677:
	fmovso	%fcc3,	%f12,	%f24
	fcmpne32	%f30,	%f26,	%i4
	brnz,pn	%l6,	loop_678
	wrpr	%g7,	0x0938,	%tick
	fsrc1	%f18,	%f12
	sth	%o4,	[%l7 + 0x4E]
loop_678:
	call	loop_679
	fmovsa	%icc,	%f2,	%f22
	fcmple32	%f14,	%f10,	%o1
	tne	%icc,	0x4
loop_679:
	nop
	fitos	%f2,	%f20
	fstod	%f20,	%f6
	call	loop_680
	movcc	%icc,	%i7,	%g4
	fnot2	%f20,	%f8
	nop
	fitos	%f15,	%f31
loop_680:
	fbn,a,pt	%fcc2,	loop_681
	call	loop_682
	fmovsvs	%xcc,	%f24,	%f8
	nop
	setx loop_683, %l0, %l1
	jmpl %l1, %i2
loop_681:
	taddcc	%l1,	%g6,	%i0
loop_682:
	call	loop_684
	fornot1s	%f22,	%f27,	%f2
loop_683:
	movcs	%icc,	%i6,	%g5
	fands	%f19,	%f13,	%f17
loop_684:
	fmul8x16au	%f12,	%f30,	%f16
	wrpr	%o6,	%g1,	%tick
	wr 	%g0, 	0x4, 	%fprs
	call	loop_685
	fcmpes	%fcc0,	%f28,	%f19
	rd	%asi,	%o3
	fmovduge	%fcc2,	%f8,	%f2
loop_685:
	call	loop_686
	sllx	%l5,	0x00,	%g3
	fmovsneg	%xcc,	%f10,	%f17
	tgu	%xcc,	0x7
loop_686:
	bcs,a,pn	%icc,	loop_687
	siam	0x5
	taddcctv	%l2,	0x0D74,	%o5
	ba	%icc,	loop_688
loop_687:
	sth	%l3,	[%l7 + 0x42]
	nop
	setx	0x09A9,	%l0,	%i3
	udiv	%l0,	%i3,	%o7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xAD4, 	%hsys_tick_cmpr
loop_688:
	fmul8x16	%f20,	%f0,	%f30
	fmovdgu	%icc,	%f26,	%f0
	call	loop_689
	nop
	setx	loop_690,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x032100001405,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	udivcc	%i5,	0x1740,	%i1
	fmovsug	%fcc3,	%f24,	%f24
loop_689:
	nop
	setx	loop_691,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x012100001402,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_690:
	tleu	%icc,	0x6
	and	%o2,	%l6,	%i4
	fmovdule	%fcc2,	%f20,	%f18
loop_691:
	movule	%fcc1,	0x66E,	%o4
	call	loop_692
	call	loop_693
	bne	%icc,	loop_694
	fmovsge	%xcc,	%f26,	%f11
loop_692:
	subccc	%o1,	0x01EE,	%g7
loop_693:
	call	loop_695
loop_694:
	subc	%g4,	0x03BB,	%i2
	movue	%fcc1,	0x2F1,	%i7
	call	loop_696
loop_695:
	xorcc	%l1,	0x1A00,	%g6
	movul	%fcc2,	0x74A,	%i6
	set	0x20, %o6
	stxa	%i0,	[%l7 + %o6] 0x80
loop_696:
	call	loop_697
	call	loop_698
	fmovsug	%fcc0,	%f10,	%f27
	te	%xcc,	0x1
loop_697:
	edge32ln	%g5,	%g1,	%l4
loop_698:
	edge8n	%o6,	%l5,	%o3
	movg	%icc,	%l2,	%o5
	nop
	setx	0xBCDABBDAFDBE932C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0x7028486F8027B051,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	faddd	%f6,	%f2,	%f30
	fbul,a	%fcc0,	loop_699
	fmovdo	%fcc2,	%f14,	%f24
	movue	%fcc0,	0x28A,	%l3
	movre	%g3,	%l0,	%i3
loop_699:
	call	loop_700
	fsrc2	%f4,	%f16
	call	loop_701
	call	loop_702
loop_700:
	movlg	%fcc3,	0x2E3,	%o7
	fcmpgt16	%f28,	%f6,	%g2
loop_701:
	call	loop_703
loop_702:
	fands	%f6,	%f13,	%f18
	fbu,a,pn	%fcc0,	loop_704
	tsubcctv	%o0,	0x0D22,	%i5
loop_703:
	call	loop_705
	tpos	%icc,	0x1
loop_704:
	fmovdo	%fcc2,	%f20,	%f30
	fandnot1	%f6,	%f22,	%f10
loop_705:
	nop
	setx	0x04FB,	%l0,	%o2
	udivx	%i1,	%o2,	%l6
	call	loop_706
	call	loop_707
	movrne	%o4,	0x03C,	%o1
	call	loop_708
loop_706:
	call	loop_709
loop_707:
	membar	0x72
	fcmpd	%fcc2,	%f28,	%f26
loop_708:
	nop
	setx	0x402AAEF1,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f24
	setx	0x26064423,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f21
	fadds	%f21,	%f24,	%f9
loop_709:
	edge32ln	%g7,	%g4,	%i4
	siam	0x1
	movg	%icc,	0x6CA,	%i7
	edge8ln	%l1,	%i2,	%i6
	tneg	%xcc,	0x3
	call	loop_710
	fcmpne32	%f8,	%f16,	%g6
	tn	%icc,	0x0
	fandnot1	%f12,	%f10,	%f4
loop_710:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fmovdgu	%xcc,	%f30,	%f12
	wr	%l4,	0x1CFA,	%y
	umulcc	%o6,	0x16AF,	%l5
	bne,a,pt	%xcc,	loop_711
	movrne	%o3,	%l2,	%g1
	call	loop_712
	call	loop_713
loop_711:
	fmovrdgz	%o5,	%f4,	%f22
	call	loop_714
loop_712:
	ba	%xcc,	loop_715
loop_713:
	umul	%g3,	0x0D8A,	%l0
	fmovse	%xcc,	%f27,	%f5
loop_714:
	ble,a,pn	%icc,	loop_716
loop_715:
	rd	%y,	%i3
	movcc	%icc,	%o7,	%g2
	call	loop_717
loop_716:
	fmovdcc	%icc,	%f2,	%f30
	xnor	%o0,	%i5,	%l3
	fmovdu	%fcc1,	%f22,	%f20
loop_717:
	call	loop_718
	fcmpeq16	%f14,	%f24,	%i1
	fcmpd	%fcc3,	%f24,	%f14
	fandnot1s	%f18,	%f27,	%f0
loop_718:
	bn	%xcc,	loop_719
	addccc	%l6,	%o4,	%o1
	fcmps	%fcc3,	%f2,	%f18
	sra	%o2,	0x02,	%g7
loop_719:
	fmovdul	%fcc2,	%f18,	%f0
	edge8	%g4,	%i7,	%i4
	call	loop_720
	call	loop_721
	call	loop_722
	tcc	%icc,	0x7
loop_720:
	movue	%fcc2,	%l1,	%i6
loop_721:
	ba	%icc,	loop_723
loop_722:
	and	%g6,	%g5,	%i2
	and	%i0,	0x132A,	%l4
	call	loop_724
loop_723:
	tge	%xcc,	0x7
	fpsub32s	%f14,	%f31,	%f9
	nop
	setx	0x1358337C,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f29
	setx	0xDAB3886B,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f5
	fadds	%f5,	%f29,	%f24
loop_724:
	nop
	set	0x7B, %o4
	stba	%l5,	[%l7 + %o4] 0x0c
	fmovsl	%fcc1,	%f28,	%f24
	rd	%tick_cmpr,	%o6
	srl	%l2,	%g1,	%o5
	movrgez	%o3,	%g3,	%l0
	fmovdul	%fcc3,	%f18,	%f26
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	fnand	%f0,	%f24,	%f8
	fmovsug	%fcc3,	%f27,	%f3
	nop
	setx	0x0361,	%l0,	%g2
	sdivcc	%i3,	%g2,	%o0
	fmovrsne	%o7,	%f22,	%f25
	fxnor	%f28,	%f0,	%f12
	rdpr	%cansave,	%i5
	fbul,a,pn	%fcc0,	loop_725
	fabss	%f9,	%f2
	call	loop_726
	movre	%i1,	0x3F7,	%l6
loop_725:
	fmovsul	%fcc0,	%f5,	%f8
	bleu,a	%xcc,	loop_727
loop_726:
	nop
	setx	0x196C,	%l0,	%l3
	sdivx	%o4,	%l3,	%o1
	movrne	%g7,	0x020,	%g4
	wr	%g0,	0x50,	%asi
	ldxa	[%g0 + 0x18] %asi,	%o2
loop_727:
	fmovdvc	%xcc,	%f26,	%f18
	rd	%softint,	%i7
	fmovda	%fcc2,	%f22,	%f20
	siam	0x4
	call	loop_728
	fmovdleu	%xcc,	%f14,	%f30
	std	%f22,	[%l7 + 0x38]
	array16	%i4,	%l1,	%g6
loop_728:
	movrlz	%g5,	%i6,	%i2
	te	%icc,	0x7
	udivcc	%l4,	0x1A45,	%i0
	nop
	fitod	%f8,	%f10
	fdtox	%f10,	%f6
	fxtod	%f6,	%f4
	std	%o6,	[%l7 + 0x40]
	set	0x7D, %l0
	ldstuba	[%l7 + %l0] 0x80,	%l2
	rdhpr	%htba,	%g1
	fmovde	%icc,	%f28,	%f8
	call	loop_729
	edge32l	%l5,	%o3,	%o5
	call	loop_730
	call	loop_731
loop_729:
	fbule	%fcc3,	loop_732
	fmovscc	%icc,	%f2,	%f3
loop_730:
	tgu	%icc,	0x5
loop_731:
	fmovsl	%fcc2,	%f25,	%f17
loop_732:
	fmovdn	%xcc,	%f28,	%f22
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	wrpr	%g3,	%l0,	%cwp
	call	loop_733
	call	loop_734
	alignaddr	%i3,	%g2,	%o0
	call	loop_735
loop_733:
	subcc	%o7,	0x1301,	%i1
loop_734:
	movleu	%icc,	0x666,	%l6
	movuge	%fcc2,	%o4,	%l3
loop_735:
	call	loop_736
	fmovrslz	%o1,	%f25,	%f30
	edge32ln	%i5,	%g4,	%g7
	nop
	set	0x28, %l3
	prefetch	[%l7 + %l3],	 3
loop_736:
	nop
	add	%l7,	0x70,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%i7,	%o2
	and	%l1,	%g6,	%i4
	add	%g5,	0x0BC5,	%i6
	call	loop_737
	bn,pn	%icc,	loop_738
	call	loop_739
	fcmpeq16	%f16,	%f16,	%l4
loop_737:
	call	loop_740
loop_738:
	fmovrsgez	%i2,	%f24,	%f11
loop_739:
	movrgez	%i0,	0x289,	%o6
	call	loop_741
loop_740:
	addccc	%g1,	%l5,	%o3
	fmul8x16al	%f16,	%f21,	%f12
	call	loop_742
loop_741:
	fmovdge	%xcc,	%f14,	%f14
	call	loop_743
	call	loop_744
loop_742:
	fpadd32s	%f1,	%f22,	%f30
	smulcc	%o5,	0x0C17,	%g3
loop_743:
	nop
	fitod	%f0,	%f20
	fdtoi	%f20,	%f5
loop_744:
	nop
	setx	0x0AAE867B78C93B0C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0x137118A000E6AC7F,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	faddd	%f10,	%f16,	%f20
	fnand	%f14,	%f28,	%f28
	call	loop_745
	tn	%icc,	0x1
	fmul8ulx16	%f18,	%f10,	%f20
	movpos	%xcc,	0x191,	%l2
loop_745:
	edge8l	%l0,	%g2,	%i3
	wrpr 	%g0, 	0x1, 	%gl
	call	loop_746
	call	loop_747
	call	loop_748
	call	loop_749
loop_746:
	nop
	setx	0x2EE6FD69F5D24129,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0x5EE94957130BD94A,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	faddd	%f18,	%f14,	%f10
loop_747:
	nop
	setx	0xACB8C64B,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f21
	setx	0x16C54964,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f26
	fsubs	%f26,	%f21,	%f10
loop_748:
	movu	%fcc2,	0x3DC,	%i1
loop_749:
	fmovsug	%fcc0,	%f0,	%f0
	nop
	fitod	%f2,	%f0
	fdtox	%f0,	%f28
	edge16l	%o7,	%o4,	%l3
	set	0x73, %l4
	ldsba	[%l7 + %l4] 0x18,	%l6
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	call	loop_750
	fmovdgu	%xcc,	%f18,	%f26
	nop
	setx	0x0E526403,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f13
	fsqrts	%f13,	%f25
	movue	%fcc0,	%i5,	%o1
loop_750:
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	fpsub32s	%f23,	%f11,	%f1
	set	0x40, %i2
	ldda	[%l7 + %i2] 0x18,	%f0
	fbge,pt	%fcc1,	loop_751
	fpmerge	%f14,	%f8,	%f22
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	call	loop_752
loop_751:
	fmovsneg	%xcc,	%f3,	%f23
	call	loop_753
	movl	%fcc1,	0x78E,	%g7
loop_752:
	fbn,a	%fcc3,	loop_754
	call	loop_755
loop_753:
	rdhpr	%hsys_tick_cmpr,	%i7
	xnor	%o2,	0x0300,	%l1
loop_754:
	call	loop_756
loop_755:
	call	loop_757
loop_756:
	nop

loop_757:
	nop

	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 4:
!
!	Type l   	: 21
!	Type a   	: 29
!	Type x   	: 12
!	Type cti   	: 155
!	Type f   	: 135
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
	set	0x3,	%g2
	set	0x6,	%g3
	set	0xC,	%g4
	set	0x2,	%g5
	set	0xC,	%g6
	set	0x8,	%g7
	!# Input registers
	set	-0x7,	%i0
	set	-0x3,	%i1
	set	-0xE,	%i2
	set	-0x8,	%i3
	set	-0x0,	%i4
	set	-0x1,	%i5
	set	-0xD,	%i6
	set	-0x4,	%i7
	!# Local registers
	set	0x38E648C3,	%l0
	set	0x5D3E4527,	%l1
	set	0x373BF01B,	%l2
	set	0x53DBBC97,	%l3
	set	0x14602BBD,	%l4
	set	0x196B613C,	%l5
	set	0x6232FA91,	%l6
	!# Output registers
	set	0x1289,	%o0
	set	-0x0892,	%o1
	set	0x187A,	%o2
	set	-0x0A61,	%o3
	set	-0x086E,	%o4
	set	-0x102E,	%o5
	set	0x0AB3,	%o6
	set	-0x19F8,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x1805C4311F23DF84)
	INIT_TH_FP_REG(%l7,%f2,0x427AC311A1EBFF7A)
	INIT_TH_FP_REG(%l7,%f4,0xC51749B0AAEE43C0)
	INIT_TH_FP_REG(%l7,%f6,0x20476743466E0F79)
	INIT_TH_FP_REG(%l7,%f8,0x84DEF9172BC0AD59)
	INIT_TH_FP_REG(%l7,%f10,0xADEE57F98E209BC6)
	INIT_TH_FP_REG(%l7,%f12,0x90F1116B2441D9E0)
	INIT_TH_FP_REG(%l7,%f14,0x02F99AEF7A00A98A)
	INIT_TH_FP_REG(%l7,%f16,0x7562B7867BE5FC0E)
	INIT_TH_FP_REG(%l7,%f18,0xBAFB16AB97120954)
	INIT_TH_FP_REG(%l7,%f20,0x3A17AF8097C11167)
	INIT_TH_FP_REG(%l7,%f22,0x6043AECA0E392B09)
	INIT_TH_FP_REG(%l7,%f24,0x29F55E1180198BEE)
	INIT_TH_FP_REG(%l7,%f26,0x6A2AEEA14A4A2618)
	INIT_TH_FP_REG(%l7,%f28,0xA51988D17F70713E)
	INIT_TH_FP_REG(%l7,%f30,0x9809E1D4CEE6807D)

	!# Execute Main Diag ..

	movg	%fcc0,	0x147,	%g4
	add	%i4,	0x11DA,	%g5
	movo	%fcc0,	%i6,	%l4
	call	loop_758
	fbe,pn	%fcc1,	loop_759
	array16	%g6,	%i0,	%i2
	set	0x24, %l6
	ldswa	[%l7 + %l6] 0x80,	%g1
loop_758:
	sethi	0x00FE,	%l5
loop_759:
	move	%fcc2,	0x7A5,	%o3
	ble,a,pn	%icc,	loop_760
	call	loop_761
	tcc	%xcc,	0x1
	array16	%o5,	%o6,	%g3
loop_760:
	nop
	wr	%g0,	0x80,	%asi
	ldda	[%l7 + 0x30] %asi,	%l2
loop_761:
	movne	%fcc0,	%g2,	%l0
	nop
	setx	0xE62447B1160ED8EB,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	fsqrtd	%f22,	%f10
	fmovdue	%fcc1,	%f16,	%f12
	fcmpne16	%f4,	%f14,	%i3
	fmovdvc	%icc,	%f28,	%f26
	call	loop_762
	edge16	%o0,	%o7,	%i1
	movvs	%icc,	0x116,	%l3
	bmask	%o4,	%i5,	%l6
loop_762:
	call	loop_763
	fcmped	%fcc0,	%f22,	%f28
	fmovslg	%fcc3,	%f1,	%f5
	movrlz	%o1,	0x2FF,	%g7
loop_763:
	fmovsle	%xcc,	%f8,	%f28
	edge16n	%o2,	%l1,	%i7
	movvc	%xcc,	%g4,	%g5
	tle	%xcc,	0x3
	call	loop_764
	fabsd	%f20,	%f4
	movne	%fcc3,	0x687,	%i6
	fsrc2s	%f2,	%f18
loop_764:
	call	loop_765
	call	loop_766
	fmovdo	%fcc0,	%f10,	%f10
	and	%l4,	0x1782,	%i4
loop_765:
	edge16	%i0,	%i2,	%g6
loop_766:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xDA5, 	%hsys_tick_cmpr
	nop
	setx	0xE1366FC5EA641926,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0xE2045BF3C857C4A9,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	fsubd	%f6,	%f2,	%f14
	alignaddr	%o5,	%o3,	%g3
	sethi	0x1E0E,	%l2
	fmovdge	%fcc2,	%f4,	%f22
	fbne	%fcc3,	loop_767
	stw	%g2,	[%l7 + 0x58]
	call	loop_768
	edge16ln	%l0,	%o6,	%i3
loop_767:
	call	loop_769
	nop
	setx	0xE63717A6,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f16
	setx	0x68D23DF7,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f16
	fadds	%f16,	%f16,	%f25
loop_768:
	sir	0x0536
	fmovdule	%fcc0,	%f2,	%f28
loop_769:
	fcmple16	%f26,	%f0,	%o0
	fpack16	%f14,	%f23
	fones	%f6
	fmovrdgz	%o7,	%f20,	%f28
	call	loop_770
	nop
	fitos	%f0,	%f20
	movrlez	%l3,	%o4,	%i5
	fpadd16	%f24,	%f10,	%f30
loop_770:
	wr	%l6,	0x1A32,	%ccr
	rd	%softint,	%o1
	fmovdue	%fcc1,	%f28,	%f10
	or	%i1,	0x0C95,	%o2
	fxnors	%f6,	%f20,	%f10
	wr	%g7,	0x113E,	%pic
	movue	%fcc3,	0x5F9,	%l1
	edge32l	%g4,	%i7,	%g5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%ccr,	%i4
	call	loop_771
	fpsub32s	%f9,	%f13,	%f14
	call	loop_772
	fabsd	%f4,	%f0
loop_771:
	nop
	wr	%g0,	0x10,	%asi
	ldstuba	[%l7 + 0x1E] %asi,	%i0
loop_772:
	subc	%i2,	%l4,	%g6
	te	%icc,	0x6
	edge8n	%l5,	%g1,	%o5
	bcs,a,pn	%xcc,	loop_773
	fmovrsgez	%g3,	%f10,	%f19
	fmovdgu	%xcc,	%f0,	%f4
	call	loop_774
loop_773:
	fmuld8sux16	%f0,	%f11,	%f28
	call	loop_775
	tpos	%icc,	0x0
loop_774:
	fbge,a	%fcc2,	loop_776
	wrpr	%l2,	0x022F,	%pil
loop_775:
	rd	%asi,	%o3
	fmovdul	%fcc1,	%f26,	%f4
loop_776:
	srl	%g2,	0x06,	%o6
	fmovdgu	%xcc,	%f30,	%f28
	fpsub16s	%f5,	%f4,	%f16
	call	loop_777
	fba	%fcc2,	loop_778
	movug	%fcc0,	%i3,	%o0
	call	loop_779
loop_777:
	ldsh	[%l7 + 0x68],	%o7
loop_778:
	nop
	fitos	%f1,	%f13
	fstoi	%f13,	%f13
	nop
	setx	0x07504A0BB621B6D1,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0x11F4DDDA9EA89614,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	faddd	%f12,	%f8,	%f6
loop_779:
	call	loop_780
	call	loop_781
	fnot2s	%f21,	%f8
	addc	%l0,	0x0319,	%o4
loop_780:
	fmovdn	%fcc3,	%f10,	%f18
loop_781:
	fnands	%f17,	%f31,	%f6
	set	0x38, %l1
	stxa	%l3,	[%l7 + %l1] 0x04
	call	loop_782
	bn,pn	%icc,	loop_783
	call	loop_784
	rdpr	%otherwin,	%l6
loop_782:
	fandnot1s	%f2,	%f12,	%f20
loop_783:
	fmovd	%f30,	%f30
loop_784:
	fbe,pn	%fcc3,	loop_785
	call	loop_786
	movrlez	%o1,	0x3A4,	%i1
	tg	%xcc,	0x3
loop_785:
	bmask	%i5,	%g7,	%l1
loop_786:
	orn	%o2,	%i7,	%g5
	call	loop_787
	fmovsvc	%xcc,	%f2,	%f26
	nop
	fitos	%f0,	%f3
	fstod	%f3,	%f26
	fandnot2	%f18,	%f16,	%f16
loop_787:
	fcmple16	%f8,	%f2,	%i6
	set	0x28, %i3
	ldswa	[%l7 + %i3] 0x19,	%g4
	xnorcc	%i4,	%i2,	%i0
	movcc	%icc,	%l4,	%g6
	call	loop_788
	call	loop_789
	call	loop_790
	nop
	setx	0x12E7,	%l0,	%g1
	sdiv	%l5,	%g1,	%g3
loop_788:
	fmovrsne	%o5,	%f9,	%f21
loop_789:
	faligndata	%f0,	%f24,	%f18
loop_790:
	fcmpne16	%f2,	%f8,	%l2
	flushw
	tpos	%icc,	0x1
	movge	%fcc3,	%g2,	%o6
	fmovsle	%fcc1,	%f13,	%f8
	srax	%o3,	0x13,	%o0
	fmovdug	%fcc0,	%f20,	%f12
	call	loop_791
	bcs,pt	%icc,	loop_792
	sir	0x1115
	call	loop_793
loop_791:
	movue	%fcc3,	%o7,	%l0
loop_792:
	call	loop_794
	fornot1	%f30,	%f8,	%f12
loop_793:
	nop
	setx	0xA3E3F3C68E23F2E7,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0xB0DEE819C8834111,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	faddd	%f22,	%f12,	%f22
	popc	0x1C11,	%o4
loop_794:
	call	loop_795
	tl	%icc,	0x3
	movgu	%xcc,	%i3,	%l3
	movl	%xcc,	0x7B2,	%l6
loop_795:
	sth	%i1,	[%l7 + 0x44]
	movle	%xcc,	%o1,	%g7
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	orcc	%i5,	%o2,	%l1
	xorcc	%g5,	%i7,	%i6
	call	loop_796
	sth	%i4,	[%l7 + 0x4C]
	tneg	%icc,	0x6
	call	loop_797
loop_796:
	alignaddrl	%i2,	%g4,	%i0
	call	loop_798
	alignaddr	%g6,	%l5,	%g1
loop_797:
	fpsub32s	%f2,	%f2,	%f9
	fmovs	%f30,	%f4
loop_798:
	fpsub32s	%f22,	%f18,	%f12
	edge8n	%g3,	%o5,	%l2
	ta	%icc,	0x7
	call	loop_799
	xnor	%g2,	%l4,	%o3
	array16	%o0,	%o7,	%o6
	nop
	set	0x42, %o0
	sth	%o4,	[%l7 + %o0]
loop_799:
	movlg	%fcc3,	0x69A,	%l0
	movgu	%xcc,	%l3,	%i3
	tne	%icc,	0x1
	edge16n	%i1,	%l6,	%o1
	wr	%g0,	0x88,	%asi
	ldstuba	[%l7 + 0x2E] %asi,	%g7
	call	loop_800
	fexpand	%f22,	%f26
	movne	%icc,	%o2,	%i5
	orncc	%g5,	0x0279,	%i7
loop_800:
	call	loop_801
	edge32ln	%i6,	%l1,	%i2
	call	loop_802
	call	loop_803
loop_801:
	edge32l	%i4,	%i0,	%g6
	call	loop_804
loop_802:
	call	loop_805
loop_803:
	call	loop_806
	orncc	%g4,	0x00DF,	%g1
loop_804:
	call	loop_807
loop_805:
	nop
	set	0x50, %g7
	stx	%l5,	[%l7 + %g7]
loop_806:
	fmovsge	%fcc3,	%f0,	%f18
	umulcc	%g3,	0x0425,	%l2
loop_807:
	call	loop_808
	udivcc	%o5,	0x17C3,	%l4
	call	loop_809
	call	loop_810
loop_808:
	nop
	setx	0xF9AA38E9,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f12
	setx	0xD20D372B,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f23
	fmuls	%f23,	%f12,	%f30
	nop
	setx	0x637CADF101E4D117,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0x715E149900B3E572,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	fdivd	%f6,	%f2,	%f6
loop_809:
	fmovsne	%xcc,	%f14,	%f29
loop_810:
	call	loop_811
	nop
	setx	0x366209DB,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f13
	setx	0x8374B596,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f14
	fadds	%f14,	%f13,	%f29
	call	loop_812
	ba	%icc,	loop_813
loop_811:
	nop
	setx loop_814, %l0, %l1
	jmpl %l1, %o3
	call	loop_815
loop_812:
	fornot1s	%f7,	%f12,	%f30
loop_813:
	movre	%o0,	0x1E2,	%o7
loop_814:
	fpack16	%f18,	%f8
loop_815:
	tsubcctv	%o6,	0x19F0,	%o4
	add	%l0,	%l3,	%i3
	call	loop_816
	edge32n	%i1,	%l6,	%o1
	brnz,a,pt	%g7,	loop_817
	wr	%o2,	%i5,	%set_softint
loop_816:
	call	loop_818
	fmovdcs	%icc,	%f26,	%f30
loop_817:
	fmovsvs	%icc,	%f6,	%f15
	rdpr	%cansave,	%g2
loop_818:
	call	loop_819
	fmovdne	%icc,	%f18,	%f14
	fba,pt	%fcc3,	loop_820
	subc	%g5,	0x0909,	%i6
loop_819:
	fabss	%f2,	%f4
	edge16l	%l1,	%i2,	%i4
loop_820:
	fmovrdlz	%i0,	%f26,	%f22
	call	loop_821
	tn	%icc,	0x7
	fmul8x16al	%f17,	%f28,	%f8
	fmul8x16al	%f17,	%f15,	%f20
loop_821:
	call	loop_822
	wr	%i7,	0x1E34,	%y
	rd	%softint,	%g6
	call	loop_823
loop_822:
	bge	%icc,	loop_824
	movle	%icc,	%g4,	%l5
	fmovso	%fcc1,	%f3,	%f16
loop_823:
	andcc	%g1,	%g3,	%o5
loop_824:
	fmovsgu	%xcc,	%f17,	%f11
	fcmpd	%fcc2,	%f14,	%f6
	call	loop_825
	tsubcc	%l2,	%o3,	%l4
	fmovdl	%xcc,	%f20,	%f30
	andn	%o7,	0x192A,	%o0
loop_825:
	taddcctv	%o4,	0x1D2F,	%o6
	call	loop_826
	movgu	%icc,	%l3,	%l0
	movrgz	%i1,	0x25A,	%i3
	tsubcctv	%l6,	%g7,	%o2
loop_826:
	call	loop_827
	tleu	%icc,	0x2
	call	loop_828
	call	loop_829
loop_827:
	fmovduge	%fcc0,	%f2,	%f26
	brlez,a	%o1,	loop_830
loop_828:
	movne	%fcc3,	0x4CD,	%g2
loop_829:
	call	loop_831
	rd	%pc,	%g5
loop_830:
	fxnor	%f0,	%f26,	%f22
	rdpr	%pil,	%i5
loop_831:
	wrpr	%i6,	%i2,	%pil
	addcc	%i4,	%i0,	%l1
	andncc	%i7,	0x0EF0,	%g4
	fmovsue	%fcc3,	%f5,	%f6
	brz,a	%l5,	loop_832
	movg	%xcc,	%g6,	%g3
	xnorcc	%g1,	%o5,	%o3
	fmovrdgez	%l4,	%f30,	%f26
loop_832:
	te	%xcc,	0x3
	rdpr	%pil,	%o7
	fmovrde	%o0,	%f30,	%f2
	call	loop_833
	movo	%fcc2,	0x520,	%o4
	siam	0x7
	bn	%xcc,	loop_834
loop_833:
	call	loop_835
	movule	%fcc3,	%l2,	%o6
	call	loop_836
loop_834:
	call	loop_837
loop_835:
	fmovrdgez	%l0,	%f12,	%f18
	fpmerge	%f12,	%f11,	%f6
loop_836:
	bmask	%i1,	%i3,	%l6
loop_837:
	ta	%xcc,	0x7
	movu	%fcc2,	0x13E,	%l3
	call	loop_838
	call	loop_839
	movgu	%icc,	0x616,	%g7
	fmovrdgez	%o2,	%f26,	%f0
loop_838:
	call	loop_840
loop_839:
	fpadd16s	%f19,	%f18,	%f31
	nop
	setx	0x7C459B82C71B5925,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0xBFCC8DFE88114D76,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	fmuld	%f20,	%f0,	%f12
	movue	%fcc3,	0x6AD,	%g2
loop_840:
	movrne	%g5,	0x106,	%i5
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	andncc	%i6,	0x0B9F,	%i2
	bneg	%xcc,	loop_841
	rd	%pc,	%o1
	movrlez	%i0,	%l1,	%i7
	call	loop_842
loop_841:
	movvc	%xcc,	0x65D,	%i4
	fandnot1s	%f16,	%f4,	%f9
	call	loop_843
loop_842:
	edge8l	%l5,	%g6,	%g4
	fmovdul	%fcc0,	%f2,	%f2
	sdiv	%g1,	0x1F57,	%g3
loop_843:
	orn	%o5,	%o3,	%l4
	fmovdl	%fcc2,	%f16,	%f14
	fpmerge	%f9,	%f13,	%f28
	brlez,a	%o7,	loop_844
	call	loop_845
	fmovrdlez	%o0,	%f24,	%f2
	movvc	%icc,	0x748,	%l2
loop_844:
	sdivcc	%o6,	0x0666,	%o4
loop_845:
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	edge32ln	%l0,	%i1,	%i3
	movlg	%fcc2,	0x122,	%l6
	tcs	%icc,	0x7
	fpsub32	%f20,	%f14,	%f28
	wrpr	%l3,	%o2,	%tick
	call	loop_846
	call	loop_847
	call	loop_848
	nop
	setx	0x1BE740862A82FD9C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	setx	0x2DEFCAFB1B84CAF3,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	faddd	%f2,	%f18,	%f6
loop_846:
	sll	%g2,	%g7,	%g5
loop_847:
	fpack32	%f20,	%f20,	%f18
loop_848:
	call	loop_849
	tgu	%xcc,	0x5
	fmovse	%icc,	%f12,	%f19
	call	loop_850
loop_849:
	movlg	%fcc3,	0x576,	%i6
	nop
	fitos	%f9,	%f19
	fstox	%f19,	%f12
	movule	%fcc0,	%i2,	%i5
loop_850:
	wrpr	%o1,	%l1,	%pil
	set	0x34, %o2
	stha	%i7,	[%l7 + %o2] 0x0c
	call	loop_851
	fornot2	%f10,	%f18,	%f2
	fexpand	%f20,	%f12
	rdhpr	%ver,	%i0
loop_851:
	nop
	setx	0x0530,	%l0,	%g6
	sdiv	%i4,	%g6,	%g4
	brz,a,pn	%g1,	loop_852
	call	loop_853
	move	%xcc,	0x592,	%g3
	add	%l5,	%o5,	%o3
loop_852:
	movu	%fcc3,	0x085,	%o7
loop_853:
	fpack32	%f20,	%f12,	%f2
	call	loop_854
	call	loop_855
	fcmpgt16	%f18,	%f20,	%o0
	fmovsa	%fcc1,	%f8,	%f0
loop_854:
	nop
	setx	0x2020170D,	%l0,	%l6
	st	%l6,	[%l7 + 0x6C]
	ld	[%l7 + 0x6C],	%fsr
loop_855:
	fbne	%fcc2,	loop_856
	nop
	fitos	%f3,	%f19
	fstox	%f19,	%f4
	call	loop_857
	sllx	%l2,	%o6,	%l4
loop_856:
	fbl,a,pn	%fcc2,	loop_858
	wrpr	%o4,	0x001F,	%pil
loop_857:
	fble,a,pt	%fcc3,	loop_859
	nop
	setx	0xC6F9B61739FB6066,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0xA58031B16CDD5A53,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	fsubd	%f4,	%f2,	%f12
loop_858:
	fors	%f8,	%f10,	%f22
	fcmpeq32	%f12,	%f0,	%i1
loop_859:
	fnot1s	%f7,	%f15
	fpadd16s	%f23,	%f0,	%f12
	tleu	%xcc,	0x3
	addc	%i3,	0x1DCC,	%l0
	flushw
	fpsub16s	%f3,	%f10,	%f23
	call	loop_860
	call	loop_861
	call	loop_862
	movn	%icc,	%l3,	%o2
loop_860:
	fmul8ulx16	%f12,	%f8,	%f30
loop_861:
	nop
	setx	0x1C31,	%l0,	%l6
	udivcc	%g2,	%l6,	%g5
loop_862:
	andncc	%i6,	%i2,	%i5
	sll	%o1,	0x06,	%l1
	call	loop_863
	brlez	%g7,	loop_864
	fnegs	%f19,	%f23
	fpsub16s	%f24,	%f16,	%f11
loop_863:
	fsrc1s	%f14,	%f26
loop_864:
	call	loop_865
	array8	%i7,	%i0,	%g6
	movle	%icc,	0x389,	%i4
	call	loop_866
loop_865:
	fsrc2s	%f2,	%f27
	subccc	%g4,	0x0E16,	%g1
	rd	%sys_tick_cmpr,	%l5
loop_866:
	tl	%xcc,	0x6
	tsubcc	%g3,	%o5,	%o7
	fnegd	%f22,	%f22
	call	loop_867
	addcc	%o3,	%o0,	%l2
	fmovrdlez	%o6,	%f14,	%f22
	call	loop_868
loop_867:
	movg	%icc,	0x4A5,	%o4
	movle	%xcc,	%l4,	%i1
	fornot1	%f26,	%f12,	%f0
loop_868:
	fxnor	%f0,	%f30,	%f20
	sub	%l0,	0x115C,	%l3
	call	loop_869
	call	loop_870
	edge16n	%i3,	%g2,	%o2
	fmovdcc	%xcc,	%f30,	%f6
loop_869:
	movrgz	%g5,	%l6,	%i2
loop_870:
	wr	%i5,	%i6,	%y
	edge32l	%l1,	%o1,	%i7
	set	0x18, %g6
	sta	%f23,	[%l7 + %g6] 0x10
	fblg,a	%fcc3,	loop_871
	call	loop_872
	call	loop_873
	call	loop_874
loop_871:
	fcmped	%fcc2,	%f6,	%f22
loop_872:
	fmovdug	%fcc2,	%f8,	%f22
loop_873:
	call	loop_875
loop_874:
	call	loop_876
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	movuge	%fcc2,	0x7DE,	%g7
loop_875:
	tleu	%xcc,	0x1
loop_876:
	bl,a	%xcc,	loop_877
	fbule	%fcc2,	loop_878
	movrlez	%g6,	0x1A0,	%i0
	fmovspos	%xcc,	%f0,	%f12
loop_877:
	stw	%g4,	[%l7 + 0x78]
loop_878:
	fnor	%f10,	%f12,	%f26
	call	loop_879
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	fmovrdgz	%i4,	%f26,	%f18
	brlz,pn	%l5,	loop_880
loop_879:
	call	loop_881
	rdpr	%tba,	%g1
	fcmpne16	%f12,	%f24,	%o5
loop_880:
	sethi	0x1946,	%o7
loop_881:
	fpadd16s	%f9,	%f3,	%f12
	call	loop_882
	pdist	%f16,	%f24,	%f14
	edge32l	%g3,	%o3,	%l2
	bgu,pt	%icc,	loop_883
loop_882:
	call	loop_884
	call	loop_885
	call	loop_886
loop_883:
	bvs,pt	%icc,	loop_887
loop_884:
	mulx	%o6,	0x1A8C,	%o0
loop_885:
	fmovsvc	%icc,	%f21,	%f22
loop_886:
	fmuld8ulx16	%f27,	%f1,	%f8
loop_887:
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	std	%f22,	[%l7 + 0x30]
	rdpr	%cansave,	%o4
	call	loop_888
	movneg	%icc,	0x031,	%i1
	fmuld8ulx16	%f3,	%f19,	%f22
	mulx	%l0,	%l3,	%l4
loop_888:
	tsubcctv	%i3,	%g2,	%o2
	fbug	%fcc2,	loop_889
	call	loop_890
	fmovscc	%icc,	%f21,	%f25
	sth	%g5,	[%l7 + 0x72]
loop_889:
	edge32ln	%i2,	%i5,	%i6
loop_890:
	ldsw	[%l7 + 0x60],	%l1
	fmovdleu	%xcc,	%f4,	%f16
	wr	%g0,	0x2f,	%asi
	stba	%l6,	[%l7 + 0x68] %asi
	membar	#Sync
	tge	%xcc,	0x0
	nop
	fitos	%f8,	%f27
	fstod	%f27,	%f16
	fcmpeq16	%f18,	%f26,	%o1
	subcc	%g7,	0x1ABB,	%g6
	array32	%i7,	%g4,	%i4
	st	%f17,	[%l7 + 0x4C]
	fxors	%f14,	%f30,	%f26
	st	%f8,	[%l7 + 0x60]
	nop
	setx	0x3651A27184DC2764,	%l0,	%l6
	stx	%l6,	[%l7 + 0x78]
	ldx	[%l7 + 0x78],	%fsr
	call	loop_891
	movleu	%icc,	0x6F6,	%l5
	tsubcctv	%g1,	%o5,	%i0
	call	loop_892
loop_891:
	call	loop_893
	movge	%fcc2,	%g3,	%o3
	tvs	%icc,	0x1
loop_892:
	edge16	%o7,	%l2,	%o6
loop_893:
	fbug	%fcc0,	loop_894
	fmovrde	%o4,	%f4,	%f16
	fmovsle	%icc,	%f13,	%f28
	movpos	%xcc,	%i1,	%l0
loop_894:
	fnot1s	%f5,	%f29
	fornot2s	%f16,	%f0,	%f7
	subcc	%l3,	%o0,	%i3
	call	loop_895
	call	loop_896
	fnegs	%f22,	%f15
	fmovrse	%l4,	%f22,	%f17
loop_895:
	bg,pt	%icc,	loop_897
loop_896:
	nop

loop_897:
	nop

	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 5:
!
!	Type l   	: 23
!	Type a   	: 26
!	Type x   	: 9
!	Type cti   	: 140
!	Type f   	: 135
!	Type i   	: 167
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
	set	0xF,	%g1
	set	0x6,	%g2
	set	0x5,	%g3
	set	0x4,	%g4
	set	0x5,	%g5
	set	0xE,	%g6
	set	0x3,	%g7
	!# Input registers
	set	-0xD,	%i0
	set	-0x0,	%i1
	set	-0x1,	%i2
	set	-0xB,	%i3
	set	-0xA,	%i4
	set	-0xB,	%i5
	set	-0x9,	%i6
	set	-0xF,	%i7
	!# Local registers
	set	0x36108CD6,	%l0
	set	0x383EE7DE,	%l1
	set	0x18B787C5,	%l2
	set	0x7C672C46,	%l3
	set	0x2C6733BE,	%l4
	set	0x6DF648D4,	%l5
	set	0x6022812F,	%l6
	!# Output registers
	set	-0x1C25,	%o0
	set	0x1478,	%o1
	set	-0x0AC8,	%o2
	set	0x0E4B,	%o3
	set	-0x19A9,	%o4
	set	-0x1AEA,	%o5
	set	0x1568,	%o6
	set	0x089D,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x1805C4311F23DF84)
	INIT_TH_FP_REG(%l7,%f2,0x427AC311A1EBFF7A)
	INIT_TH_FP_REG(%l7,%f4,0xC51749B0AAEE43C0)
	INIT_TH_FP_REG(%l7,%f6,0x20476743466E0F79)
	INIT_TH_FP_REG(%l7,%f8,0x84DEF9172BC0AD59)
	INIT_TH_FP_REG(%l7,%f10,0xADEE57F98E209BC6)
	INIT_TH_FP_REG(%l7,%f12,0x90F1116B2441D9E0)
	INIT_TH_FP_REG(%l7,%f14,0x02F99AEF7A00A98A)
	INIT_TH_FP_REG(%l7,%f16,0x7562B7867BE5FC0E)
	INIT_TH_FP_REG(%l7,%f18,0xBAFB16AB97120954)
	INIT_TH_FP_REG(%l7,%f20,0x3A17AF8097C11167)
	INIT_TH_FP_REG(%l7,%f22,0x6043AECA0E392B09)
	INIT_TH_FP_REG(%l7,%f24,0x29F55E1180198BEE)
	INIT_TH_FP_REG(%l7,%f26,0x6A2AEEA14A4A2618)
	INIT_TH_FP_REG(%l7,%f28,0xA51988D17F70713E)
	INIT_TH_FP_REG(%l7,%f30,0x9809E1D4CEE6807D)

	!# Execute Main Diag ..

	call	loop_898
	tvs	%xcc,	0x4
	xnor	%g2,	%g5,	%i2
	fmovsge	%xcc,	%f24,	%f19
loop_898:
	fnand	%f2,	%f0,	%f12
	call	loop_899
	movue	%fcc1,	0x48E,	%o2
	tneg	%xcc,	0x3
	fcmpeq16	%f26,	%f30,	%i6
loop_899:
	fmovsleu	%xcc,	%f2,	%f30
	fmovscs	%xcc,	%f30,	%f15
	wr	%g0,	0x88,	%asi
	stxa	%l1,	[%l7 + 0x78] %asi
	brz,pn	%i5,	loop_900
	call	loop_901
	fbg,a,pn	%fcc2,	loop_902
	edge32n	%l6,	%g7,	%g6
loop_900:
	fmovsvc	%icc,	%f19,	%f2
loop_901:
	nop
	wr	%g0,	0x89,	%asi
	lduha	[%l7 + 0x28] %asi,	%i7
loop_902:
	wrpr 	%g0, 	0x2, 	%gl
	fpsub16	%f6,	%f2,	%f2
	xorcc	%i4,	%g1,	%o5
	fmovsule	%fcc1,	%f25,	%f8
	movrne	%i0,	%g3,	%l5
	tle	%icc,	0x6
	tg	%xcc,	0x4
	edge8n	%o7,	%l2,	%o3
	nop
	setx	0x0050,	%l0,	%i1
	udiv	%o6,	%i1,	%l0
	nop
	fitod	%f6,	%f26
	rdpr	%cansave,	%o4
	fmovdo	%fcc1,	%f2,	%f6
	siam	0x2
	call	loop_903
	movvc	%xcc,	0x6F1,	%o0
	fmovsg	%xcc,	%f6,	%f2
	addccc	%l3,	%i3,	%l4
loop_903:
	orcc	%g2,	%i2,	%g5
	nop
	setx	0x78ACF719,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f1
	setx	0x129DD51C,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f12
	fsubs	%f12,	%f1,	%f10
	movg	%fcc0,	%i6,	%l1
	fnot2s	%f25,	%f23
	call	loop_904
	fcmpne16	%f12,	%f0,	%i5
	orncc	%o2,	0x1D45,	%l6
	fnands	%f23,	%f30,	%f12
loop_904:
	ld	[%l7 + 0x78],	%f27
	fands	%f27,	%f25,	%f18
	fmovdl	%icc,	%f8,	%f2
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	rd	%sys_tick_cmpr,	%g7
	movneg	%icc,	%i7,	%o1
	call	loop_905
	fsrc1	%f0,	%f4
	nop
	set	0x70, %o3
	ldd	[%l7 + %o3],	%f6
	call	loop_906
loop_905:
	nop
	setx	0x61E65D00CCC44AD6,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0x83B84850443A04CB,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	fmuld	%f24,	%f30,	%f14
	sll	%g6,	0x06,	%g4
	nop
	set	0x50, %g2
	flush	%l7 + %g2
loop_906:
	movrlz	%i4,	%o5,	%g1
	nop
	fitod	%f12,	%f0
	fdtoi	%f0,	%f25
	call	loop_907
	fmovsgu	%xcc,	%f14,	%f22
	movcs	%xcc,	%g3,	%l5
	st	%f29,	[%l7 + 0x2C]
loop_907:
	wr	%i0,	0x1D56,	%clear_softint
	nop
	fitos	%f0,	%f23
	tle	%xcc,	0x6
	nop
	setx	0x67D75F8CF8BDB19C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	fsqrtd	%f26,	%f18
	nop
	setx	0x018A,	%l0,	%l2
	sdivcc	%o7,	%l2,	%o3
	call	loop_908
	nop
	set	0x1C, %i7
	ldsw	[%l7 + %i7],	%o6
	call	loop_909
	sdivcc	%l0,	0x198A,	%o4
loop_908:
	movug	%fcc1,	%i1,	%o0
	movug	%fcc0,	%i3,	%l4
loop_909:
	taddcctv	%l3,	%i2,	%g5
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	tge	%xcc,	0x6
	alignaddrl	%g2,	%l1,	%i5
	fpmerge	%f17,	%f10,	%f4
	movge	%xcc,	0x568,	%i6
	add	%l7,	0x34,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] %asi,	%l6,	%o2
	ta	%xcc,	0x2
	call	loop_910
	fmovrsne	%g7,	%f2,	%f1
	call	loop_911
	nop
	fitod	%f12,	%f6
	fdtox	%f6,	%f8
loop_910:
	fmul8ulx16	%f8,	%f24,	%f12
	fmovdul	%fcc1,	%f12,	%f24
loop_911:
	nop
	wr	%g0,	0x22,	%asi
	stba	%o1,	[%l7 + 0x71] %asi
	membar	#Sync
	set	0x70, %i5
	stxa	%g6,	[%l7 + %i5] 0x22
	membar	#Sync
	rdpr	%otherwin,	%i7
	call	loop_912
	fcmps	%fcc2,	%f7,	%f31
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	call	loop_913
loop_912:
	fands	%f19,	%f16,	%f10
	wr	%g0,	0x88,	%asi
	prefetcha	[%l7 + 0x68] %asi,	 2
loop_913:
	array32	%i4,	%o5,	%g1
	call	loop_914
	tne	%xcc,	0x7
	call	loop_915
	xor	%g3,	%i0,	%o7
loop_914:
	te	%icc,	0x0
	tg	%xcc,	0x1
loop_915:
	movrlez	%l2,	0x064,	%o3
	taddcc	%l5,	%o6,	%l0
	fmovse	%xcc,	%f22,	%f5
	tge	%icc,	0x4
	nop
	setx	0x09A7,	%l0,	%i1
	udivx	%o4,	%i1,	%i3
	call	loop_916
	fbul,pt	%fcc3,	loop_917
	call	loop_918
	movule	%fcc1,	%o0,	%l3
loop_916:
	nop
	wr	%g0,	0x88,	%asi
	stha	%i2,	[%l7 + 0x6A] %asi
loop_917:
	fmovsu	%fcc1,	%f13,	%f29
loop_918:
	nop
	setx	0x131C,	%l0,	%l4
	udivcc	%g5,	%l4,	%l1
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	call	loop_919
	movneg	%xcc,	%i5,	%i6
	call	loop_920
	fmovsu	%fcc1,	%f28,	%f29
loop_919:
	fmovsgu	%icc,	%f31,	%f17
	call	loop_921
loop_920:
	fmovdle	%fcc2,	%f8,	%f28
	call	loop_922
	fcmpeq32	%f24,	%f12,	%l6
loop_921:
	bmask	%g2,	%g7,	%o1
	wr	%g0,	0x0c,	%asi
	ldsha	[%l7 + 0x18] %asi,	%o2
loop_922:
	edge16l	%g6,	%i7,	%i4
	nop
	set	0x60, %g4
	lduw	[%l7 + %g4],	%o5
	nop
	setx	0x0A42,	%l0,	%g4
	sdiv	%g1,	%g4,	%i0
	add	%l7,	0x40,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] %asi,	%g3,	%l2
	fxnor	%f12,	%f28,	%f24
	call	loop_923
	lduw	[%l7 + 0x5C],	%o3
	fmovslg	%fcc0,	%f9,	%f29
	call	loop_924
loop_923:
	edge8ln	%o7,	%l5,	%l0
	nop
	set	0x48, %l2
	flush	%l7 + %l2
	movug	%fcc1,	%o6,	%o4
loop_924:
	fmovsue	%fcc1,	%f29,	%f17
	sll	%i1,	%i3,	%l3
	tg	%xcc,	0x6
	call	loop_925
	call	loop_926
	fnot2	%f24,	%f4
	srlx	%o0,	0x18,	%i2
loop_925:
	fmovrslez	%l4,	%f9,	%f13
loop_926:
	fnot2	%f28,	%f30
	nop
	setx loop_927, %l0, %l1
	jmpl %l1, %g5
	popc	0x0C5B,	%l1
	call	loop_928
	fpadd32s	%f26,	%f17,	%f13
loop_927:
	call	loop_929
	for	%f20,	%f10,	%f16
loop_928:
	call	loop_930
	fmovso	%fcc2,	%f20,	%f4
loop_929:
	edge32ln	%i5,	%l6,	%g2
	call	loop_931
loop_930:
	rd	%asi,	%i6
	bpos,pt	%icc,	loop_932
	move	%xcc,	0x062,	%g7
loop_931:
	call	loop_933
	rdhpr	%ver,	%o1
loop_932:
	fnand	%f0,	%f10,	%f18
	fmovdleu	%xcc,	%f0,	%f8
loop_933:
	fmovsue	%fcc3,	%f11,	%f6
	call	loop_934
	call	loop_935
	call	loop_936
	edge8	%g6,	%i7,	%o2
loop_934:
	fmovdcs	%icc,	%f28,	%f0
loop_935:
	nop
	set	0x10, %g1
	flush	%l7 + %g1
loop_936:
	call	loop_937
	subc	%i4,	%o5,	%g1
	tpos	%icc,	0x1
	fblg,a	%fcc2,	loop_938
loop_937:
	nop
	fitod	%f2,	%f16
	fdtox	%f16,	%f24
	fxtod	%f24,	%f10
	fbo,pt	%fcc0,	loop_939
	alignaddr	%g4,	%i0,	%l2
loop_938:
	subccc	%o3,	%o7,	%l5
	movg	%xcc,	%l0,	%g3
loop_939:
	fsrc2	%f10,	%f4
	movrgz	%o4,	%i1,	%i3
	bgu,a	%xcc,	loop_940
	rdhpr	%hpstate,	%l3
	call	loop_941
	srax	%o6,	%o0,	%i2
loop_940:
	movuge	%fcc2,	%l4,	%l1
	call	loop_942
loop_941:
	bcc,a,pt	%icc,	loop_943
	fandnot1s	%f5,	%f12,	%f12
	wrpr	%i5,	0x164A,	%tick
loop_942:
	movrlez	%g5,	0x077,	%g2
loop_943:
	fzeros	%f11
	sir	0x13BF
	rdpr	%tl,	%l6
	call	loop_944
	fbule,a,pt	%fcc1,	loop_945
	fmovsug	%fcc1,	%f30,	%f12
	tne	%xcc,	0x1
loop_944:
	rdhpr	%htba,	%g7
loop_945:
	edge32n	%i6,	%g6,	%i7
	nop
	setx	0x4D8DAAC0E388BE9D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0xC8B0D0DB151CF94E,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	faddd	%f12,	%f10,	%f8
	faligndata	%f6,	%f8,	%f6
	call	loop_946
	movul	%fcc0,	%o2,	%o1
	fmovdleu	%xcc,	%f28,	%f8
	brnz	%i4,	loop_947
loop_946:
	tpos	%icc,	0x1
	call	loop_948
	fexpand	%f26,	%f12
loop_947:
	wr	%g1,	%o5,	%y
	call	loop_949
loop_948:
	fmovsneg	%icc,	%f22,	%f26
	edge16ln	%g4,	%i0,	%o3
	call	loop_950
loop_949:
	bshuffle	%f18,	%f0,	%f6
	andn	%l2,	%l5,	%o7
	call	loop_951
loop_950:
	brlez	%g3,	loop_952
	tgu	%icc,	0x6
	taddcc	%l0,	%o4,	%i3
loop_951:
	fsrc1s	%f10,	%f17
loop_952:
	rdpr	%canrestore,	%i1
	call	loop_953
	srlx	%o6,	0x0E,	%l3
	fornot2s	%f30,	%f9,	%f25
	movpos	%xcc,	%i2,	%o0
loop_953:
	call	loop_954
	fnegd	%f16,	%f22
	fone	%f2
	andn	%l1,	%l4,	%g5
loop_954:
	nop
	setx	0x65AF5DE9,	%l0,	%l6
	st	%l6,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%fsr
	tge	%icc,	0x4
	fandnot1s	%f15,	%f28,	%f8
	fmovso	%fcc3,	%f18,	%f7
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	set	0x58, %g5
	stba	%g2,	[%l7 + %g5] 0x88
	call	loop_955
	fmovdcc	%xcc,	%f26,	%f14
	fmovdue	%fcc0,	%f12,	%f20
	fnot2	%f8,	%f12
loop_955:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x6EF, 	%hsys_tick_cmpr
	movule	%fcc1,	0x527,	%g7
	edge8l	%i6,	%g6,	%i5
	fbne	%fcc0,	loop_956
	smulcc	%o2,	%o1,	%i4
	edge16l	%i7,	%g1,	%g4
	fandnot1s	%f29,	%f8,	%f24
loop_956:
	call	loop_957
	call	loop_958
	pdist	%f6,	%f30,	%f18
	sdivcc	%o5,	0x1595,	%o3
loop_957:
	ta	%icc,	0x2
loop_958:
	wr 	%g0, 	0x5, 	%fprs
	srlx	%l5,	0x1D,	%i0
	fmovsg	%fcc2,	%f19,	%f30
	edge32l	%g3,	%o7,	%o4
	bneg,pt	%icc,	loop_959
	movo	%fcc0,	0x046,	%l0
	call	loop_960
	fnot2	%f6,	%f14
loop_959:
	call	loop_961
	call	loop_962
loop_960:
	ldub	[%l7 + 0x16],	%i3
	fpack16	%f4,	%f31
loop_961:
	call	loop_963
loop_962:
	movvc	%icc,	%i1,	%o6
	movuge	%fcc1,	0x10A,	%i2
	movle	%xcc,	0x7BE,	%l3
loop_963:
	call	loop_964
	fpsub16s	%f7,	%f10,	%f27
	call	loop_965
	call	loop_966
loop_964:
	nop
	setx	0x053B,	%l0,	%l4
	udivcc	%l1,	%l4,	%g5
	movule	%fcc3,	0x5E0,	%g2
loop_965:
	fsrc2	%f12,	%f8
loop_966:
	nop
	setx	0x4906BB5A,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f6
	setx	0xA67153E1,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f19
	fsubs	%f19,	%f6,	%f27
	call	loop_967
	fble,a,pt	%fcc1,	loop_968
	call	loop_969
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
loop_967:
	fbu	%fcc0,	loop_970
loop_968:
	fpadd16s	%f18,	%f8,	%f23
loop_969:
	call	loop_971
	fmovrdgz	%l6,	%f6,	%f10
loop_970:
	tgu	%icc,	0x0
	call	loop_972
loop_971:
	call	loop_973
	fcmpne16	%f6,	%f8,	%g7
	fmovdlg	%fcc1,	%f4,	%f8
loop_972:
	call	loop_974
loop_973:
	movvs	%icc,	%i6,	%o0
	call	loop_975
	alignaddrl	%g6,	%o2,	%i5
loop_974:
	fnegs	%f16,	%f8
	call	loop_976
loop_975:
	call	loop_977
	bshuffle	%f18,	%f12,	%f0
	fmovdule	%fcc1,	%f12,	%f6
loop_976:
	fmul8ulx16	%f12,	%f2,	%f16
loop_977:
	call	loop_978
	nop
	set	0x68, %o1
	ldd	[%l7 + %o1],	%f10
	rd	%tick_cmpr,	%o1
	rd	%ccr,	%i7
loop_978:
	call	loop_979
	fmovsneg	%icc,	%f28,	%f16
	rdhpr	%hintp,	%g1
	call	loop_980
loop_979:
	fbuge,pt	%fcc1,	loop_981
	nop
	setx	0xC9BF875D,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f30
	setx	0xAD7663C5,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f5
	fsubs	%f5,	%f30,	%f10
	call	loop_982
loop_980:
	call	loop_983
loop_981:
	nop
	fitos	%f0,	%f26
	fstoi	%f26,	%f7
	set	0x58, %i6
	ldsha	[%l7 + %i6] 0x88,	%g4
loop_982:
	edge8	%i4,	%o3,	%o5
loop_983:
	call	loop_984
	call	loop_985
	array16	%l5,	%i0,	%l2
	fexpand	%f0,	%f14
loop_984:
	call	loop_986
loop_985:
	call	loop_987
	tsubcctv	%o7,	%o4,	%g3
	tcs	%xcc,	0x5
loop_986:
	wr	%l0,	0x1673,	%softint
loop_987:
	movug	%fcc1,	0x663,	%i1
	fcmpne16	%f26,	%f0,	%i3
	fmovsuge	%fcc2,	%f9,	%f13
	call	loop_988
	rd	%sys_tick_cmpr,	%i2
	lduh	[%l7 + 0x4A],	%l3
	call	loop_989
loop_988:
	tvs	%icc,	0x4
	wrpr 	%g0, 	0x3, 	%gl
	fornot2s	%f24,	%f15,	%f15
loop_989:
	ldx	[%l7 + 0x58],	%o6
	wr	%g0,	0x10,	%asi
	ldsba	[%l7 + 0x0B] %asi,	%l4
	rdpr	%canrestore,	%g5
	te	%icc,	0x6
	call	loop_990
	call	loop_991
	fabss	%f24,	%f4
	fmovscs	%xcc,	%f28,	%f13
loop_990:
	call	loop_992
loop_991:
	call	loop_993
	fmovdule	%fcc0,	%f22,	%f28
	call	loop_994
loop_992:
	call	loop_995
loop_993:
	call	loop_996
	call	loop_997
loop_994:
	tl	%icc,	0x4
loop_995:
	umulcc	%g2,	0x0F20,	%g7
loop_996:
	membar	0x2E
loop_997:
	taddcc	%l6,	%o0,	%i6
	fcmpgt16	%f24,	%f8,	%g6
	call	loop_998
	wrpr	%o2,	0x0B4E,	%pil
	fpack32	%f22,	%f24,	%f2
	call	loop_999
loop_998:
	fbg,a,pn	%fcc0,	loop_1000
	subc	%i5,	%i7,	%o1
	bg,a	%xcc,	loop_1001
loop_999:
	call	loop_1002
loop_1000:
	edge8n	%g4,	%g1,	%o3
	fmovsue	%fcc3,	%f1,	%f13
loop_1001:
	call	loop_1003
loop_1002:
	nop
	set	0x3C, %i0
	ldsb	[%l7 + %i0],	%o5
	edge8ln	%l5,	%i4,	%i0
	subcc	%l2,	0x0B64,	%o4
loop_1003:
	fmovdn	%fcc2,	%f22,	%f6
	fzeros	%f18
	umul	%g3,	0x1E7A,	%l0
	fnot2s	%f11,	%f3
	orcc	%i1,	0x0CFD,	%o7
	call	loop_1004
	movle	%xcc,	%i3,	%i2
	call	loop_1005
	tcs	%icc,	0x6
loop_1004:
	call	loop_1006
	nop
	set	0x44, %i4
	sth	%l1,	[%l7 + %i4]
loop_1005:
	call	loop_1007
	call	loop_1008
loop_1006:
	edge16ln	%o6,	%l4,	%l3
	call	loop_1009
loop_1007:
	call	loop_1010
loop_1008:
	call	loop_1011
	fsrc2s	%f0,	%f31
loop_1009:
	st	%f3,	[%l7 + 0x10]
loop_1010:
	fmovrdgz	%g5,	%f0,	%f18
loop_1011:
	rdhpr	%htba,	%g7
	fmovscc	%xcc,	%f2,	%f12
	call	loop_1012
	fpadd16s	%f29,	%f11,	%f2
	fbu,a	%fcc1,	loop_1013
	tpos	%xcc,	0x3
loop_1012:
	call	loop_1014
	xorcc	%g2,	0x0679,	%l6
loop_1013:
	fones	%f21
	fcmpes	%fcc1,	%f12,	%f16
loop_1014:
	fmovdcc	%xcc,	%f4,	%f16
	alignaddrl	%o0,	%g6,	%i6
	fmovdpos	%icc,	%f26,	%f16
	edge16	%i5,	%o2,	%i7
	fmovsuge	%fcc3,	%f0,	%f10
	call	loop_1015
	nop
	fitod	%f2,	%f22
	fdtos	%f22,	%f17
	movo	%fcc3,	%o1,	%g1
	subcc	%g4,	0x02A4,	%o3
loop_1015:
	call	loop_1016
	call	loop_1017
	fmovrdgz	%o5,	%f28,	%f6
	movre	%i4,	0x3C5,	%l5
loop_1016:
	nop
	fitos	%f14,	%f22
	fstod	%f22,	%f22
loop_1017:
	call	loop_1018
	call	loop_1019
	fmuld8sux16	%f11,	%f30,	%f24
	fmovrde	%l2,	%f12,	%f22
loop_1018:
	call	loop_1020
loop_1019:
	fnegs	%f31,	%f2
	subc	%i0,	0x09FC,	%o4
	wr 	%g0, 	0x5, 	%fprs
loop_1020:
	movvs	%icc,	%i1,	%l0
	srax	%i3,	0x0A,	%i2
	call	loop_1021
	tneg	%xcc,	0x4
	fmovrdlz	%o7,	%f10,	%f26
	popc	%o6,	%l1
loop_1021:
	movre	%l4,	0x3E1,	%l3
	fpadd32s	%f20,	%f26,	%f11
	tle	%icc,	0x6
	flushw
	subc	%g7,	0x13C8,	%g5
	bvc,a,pn	%xcc,	loop_1022
	bcc,a,pn	%xcc,	loop_1023
	move	%icc,	0x5C7,	%g2
	move	%fcc2,	0x167,	%l6
loop_1022:
	movul	%fcc2,	0x5BC,	%g6
loop_1023:
	nop
	setx	0x10A4AF8DFC3B6AA2,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldx	[%l7 + 0x28],	%fsr
	call	loop_1024
	nop
	fitos	%f13,	%f15
	fstox	%f15,	%f6
	fxtos	%f6,	%f30
	movvs	%xcc,	0x1B7,	%o0
	edge16l	%i6,	%o2,	%i7
loop_1024:
	tne	%xcc,	0x5
	membar	0x1E
	fpadd16	%f12,	%f14,	%f22
	call	loop_1025
	subcc	%i5,	%o1,	%g1
	nop
	set	0x1C, %o5
	lduw	[%l7 + %o5],	%o3
	fcmpeq16	%f8,	%f16,	%g4
loop_1025:
	call	loop_1026
	bvs,pt	%xcc,	loop_1027
	fmovrslez	%o5,	%f20,	%f20
	fxnor	%f18,	%f10,	%f2
loop_1026:
	fnegd	%f12,	%f12
loop_1027:
	call	loop_1028
	fmovdo	%fcc0,	%f24,	%f6
	st	%f21,	[%l7 + 0x48]
	wr 	%g0, 	0x6, 	%fprs
loop_1028:
	bneg,a,pn	%icc,	loop_1029
	call	loop_1030
	andcc	%l2,	0x1B60,	%i0
	call	loop_1031
loop_1029:
	xor	%l5,	%g3,	%o4
loop_1030:
	call	loop_1032
	call	loop_1033
loop_1031:
	fmul8x16al	%f5,	%f24,	%f14
	tvc	%xcc,	0x5
loop_1032:
	call	loop_1034
loop_1033:
	subc	%i1,	%l0,	%i3
	fsrc2s	%f21,	%f22
	fxnor	%f24,	%f28,	%f22
loop_1034:
	nop
	fitos	%f7,	%f7
	fnor	%f18,	%f6,	%f12
	call	loop_1035
	call	loop_1036
	wr	%o7,	0x0FCF,	%clear_softint
	nop
	setx	0x2C285F29,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f3
	setx	0x70449419,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f24
	fmuls	%f24,	%f3,	%f5
loop_1035:
	call	loop_1037
loop_1036:
	fpsub16s	%f16,	%f29,	%f21
	fmovde	%icc,	%f18,	%f6
	nop
	setx	0x003322A4,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f2
	setx	0xE5D3C326,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f0
	fsubs	%f0,	%f2,	%f15
loop_1037:
	movu	%fcc0,	0x4EC,	%i2
	movue	%fcc3,	%o6,	%l1
	wr	%l3,	%g7,	%clear_softint
	fpsub16	%f6,	%f28,	%f14
	fpadd16s	%f12,	%f4,	%f31
	edge16	%l4,	%g2,	%l6
	tcs	%icc,	0x4
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 6:
!
!	Type l   	: 32
!	Type a   	: 28
!	Type x   	: 12
!	Type cti   	: 140
!	Type f   	: 137
!	Type i   	: 151
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
	set	0xE,	%g1
	set	0xB,	%g2
	set	0x8,	%g3
	set	0x8,	%g4
	set	0x6,	%g5
	set	0x6,	%g6
	set	0x7,	%g7
	!# Input registers
	set	-0x9,	%i0
	set	-0xE,	%i1
	set	-0x9,	%i2
	set	-0x0,	%i3
	set	-0x2,	%i4
	set	-0xA,	%i5
	set	-0xF,	%i6
	set	-0x1,	%i7
	!# Local registers
	set	0x1558DB29,	%l0
	set	0x1DF26739,	%l1
	set	0x0CA59F61,	%l2
	set	0x0A17CFAD,	%l3
	set	0x2C7ED5B1,	%l4
	set	0x3A59A90C,	%l5
	set	0x1FCF56A0,	%l6
	!# Output registers
	set	-0x073D,	%o0
	set	0x10D7,	%o1
	set	0x064C,	%o2
	set	-0x1128,	%o3
	set	-0x0588,	%o4
	set	0x01E3,	%o5
	set	0x1D95,	%o6
	set	-0x098F,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x1805C4311F23DF84)
	INIT_TH_FP_REG(%l7,%f2,0x427AC311A1EBFF7A)
	INIT_TH_FP_REG(%l7,%f4,0xC51749B0AAEE43C0)
	INIT_TH_FP_REG(%l7,%f6,0x20476743466E0F79)
	INIT_TH_FP_REG(%l7,%f8,0x84DEF9172BC0AD59)
	INIT_TH_FP_REG(%l7,%f10,0xADEE57F98E209BC6)
	INIT_TH_FP_REG(%l7,%f12,0x90F1116B2441D9E0)
	INIT_TH_FP_REG(%l7,%f14,0x02F99AEF7A00A98A)
	INIT_TH_FP_REG(%l7,%f16,0x7562B7867BE5FC0E)
	INIT_TH_FP_REG(%l7,%f18,0xBAFB16AB97120954)
	INIT_TH_FP_REG(%l7,%f20,0x3A17AF8097C11167)
	INIT_TH_FP_REG(%l7,%f22,0x6043AECA0E392B09)
	INIT_TH_FP_REG(%l7,%f24,0x29F55E1180198BEE)
	INIT_TH_FP_REG(%l7,%f26,0x6A2AEEA14A4A2618)
	INIT_TH_FP_REG(%l7,%f28,0xA51988D17F70713E)
	INIT_TH_FP_REG(%l7,%f30,0x9809E1D4CEE6807D)

	!# Execute Main Diag ..

	call	loop_1038
	xnor	%g6,	%o0,	%i6
	movge	%icc,	%g5,	%i7
	edge16ln	%o2,	%o1,	%i5
loop_1038:
	fmovdn	%fcc2,	%f30,	%f30
	nop
	setx	0x333555F1CA3E69C1,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0xC3A0118F7FBE024F,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	fsubd	%f4,	%f6,	%f26
	and	%g1,	%o3,	%g4
	call	loop_1039
	or	%i4,	%l2,	%i0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	addcc	%o5,	0x01B5,	%g3
loop_1039:
	srl	%o4,	0x02,	%i1
	fpmerge	%f15,	%f17,	%f4
	fmovrdlz	%l0,	%f10,	%f24
	rdpr	%wstate,	%o7
	fornot1	%f0,	%f28,	%f14
	nop
	setx	0xB60B5001,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f4
	setx	0x47F64D80,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f28
	fsubs	%f28,	%f4,	%f11
	nop
	setx	loop_1040,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x021200001405,	%l0,	%l1
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
	subcc	%i3,	0x0A35,	%i2
	call	loop_1041
	edge16ln	%o6,	%l3,	%l1
loop_1040:
	edge8n	%l4,	%g7,	%l6
	fsrc2	%f4,	%f28
loop_1041:
	movcc	%icc,	%g6,	%g2
	array32	%o0,	%i6,	%i7
	movrgz	%o2,	0x20D,	%o1
	tvs	%xcc,	0x4
	fmovsule	%fcc2,	%f1,	%f0
	sir	0x0F2D
	wr	%g0,	0x81,	%asi
	lduha	[%l7 + 0x52] %asi,	%g5
	add	%i5,	0x1C16,	%o3
	fmovdn	%xcc,	%f26,	%f30
	sra	%g4,	%g1,	%l2
	nop
	set	0x68, %g3
	stx	%i4,	[%l7 + %g3]
	rd	%y,	%l5
	call	loop_1042
	call	loop_1043
	call	loop_1044
	rdpr	%cleanwin,	%o5
loop_1042:
	fornot2	%f18,	%f18,	%f0
loop_1043:
	call	loop_1045
loop_1044:
	call	loop_1046
	nop
	setx	0x3E3401EB,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f25
	setx	0x7A169D96,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f19
	fmuls	%f19,	%f25,	%f17
	fpmerge	%f8,	%f8,	%f28
loop_1045:
	call	loop_1047
loop_1046:
	fcmpgt32	%f2,	%f16,	%g3
	fmovdn	%fcc0,	%f10,	%f2
	fmovdlg	%fcc2,	%f28,	%f22
loop_1047:
	movgu	%xcc,	%i0,	%i1
	fmovsleu	%xcc,	%f4,	%f23
	fpsub16s	%f14,	%f23,	%f6
	call	loop_1048
	call	loop_1049
	call	loop_1050
	call	loop_1051
loop_1048:
	nop
	setx	0x5CA310883231BE0B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0x7666FFE14E51391B,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	faddd	%f28,	%f20,	%f24
loop_1049:
	wrpr 	%g0, 	0x2, 	%gl
loop_1050:
	call	loop_1052
loop_1051:
	faligndata	%f10,	%f10,	%f20
	nop
	setx loop_1053, %l0, %l1
	jmpl %l1, %o4
	fandnot1	%f12,	%f24,	%f4
loop_1052:
	nop
	set	0x38, %i1
	ldswa	[%l7 + %i1] 0x11,	%i3
loop_1053:
	call	loop_1054
	xorcc	%o6,	%l3,	%i2
	bmask	%l1,	%g7,	%l4
	call	loop_1055
loop_1054:
	call	loop_1056
	nop
	fitos	%f1,	%f21
	fstod	%f21,	%f0
	rdpr	%gl,	%g6
loop_1055:
	nop
	fitod	%f4,	%f6
	fdtox	%f6,	%f4
loop_1056:
	movul	%fcc1,	%l6,	%o0
	sth	%i6,	[%l7 + 0x16]
	movuge	%fcc3,	%g2,	%o2
	call	loop_1057
	call	loop_1058
	movo	%fcc1,	0x412,	%o1
	call	loop_1059
loop_1057:
	call	loop_1060
loop_1058:
	call	loop_1061
	fmovsu	%fcc2,	%f25,	%f26
loop_1059:
	faligndata	%f30,	%f16,	%f8
loop_1060:
	stx	%i7,	[%l7 + 0x48]
loop_1061:
	call	loop_1062
	udiv	%i5,	0x0BDE,	%g5
	wrpr 	%g0, 	0x1, 	%gl
	tn	%icc,	0x3
loop_1062:
	tcs	%xcc,	0x5
	fnands	%f8,	%f23,	%f15
	call	loop_1063
	fcmpd	%fcc2,	%f30,	%f26
	call	loop_1064
	tgu	%xcc,	0x3
loop_1063:
	call	loop_1065
	fnors	%f10,	%f31,	%f26
loop_1064:
	taddcc	%g4,	%l2,	%g1
	fmovrdgz	%i4,	%f22,	%f14
loop_1065:
	fmovsue	%fcc3,	%f14,	%f28
	membar	#Sync
	set	0x40, %l5
	ldda	[%l7 + %l5] 0xf0,	%f0
	nop
	setx	0x05B9,	%l0,	%g3
	sdiv	%o5,	%g3,	%l5
	subc	%i1,	%i0,	%l0
	fxor	%f18,	%f6,	%f22
	bmask	%o4,	%o7,	%i3
	fmovsn	%fcc0,	%f26,	%f4
	fmovsvs	%xcc,	%f1,	%f29
	movge	%fcc1,	%l3,	%o6
	call	loop_1066
	call	loop_1067
	call	loop_1068
	call	loop_1069
loop_1066:
	rd	%pc,	%l1
loop_1067:
	call	loop_1070
loop_1068:
	mulscc	%g7,	%i2,	%g6
loop_1069:
	subc	%l4,	%o0,	%l6
	call	loop_1071
loop_1070:
	call	loop_1072
	call	loop_1073
	nop
	fitos	%f3,	%f23
	fstox	%f23,	%f8
loop_1071:
	rdpr	%cwp,	%i6
loop_1072:
	fmovrdlez	%o2,	%f12,	%f26
loop_1073:
	nop
	wr	%g0,	0x80,	%asi
	lda	[%l7 + 0x0C] %asi,	%f13
	call	loop_1074
	call	loop_1075
	fmovsne	%fcc1,	%f16,	%f18
	fmovdu	%fcc2,	%f24,	%f4
loop_1074:
	fmovrsgez	%g2,	%f28,	%f7
loop_1075:
	sllx	%i7,	0x03,	%i5
	fmovdue	%fcc0,	%f30,	%f10
	subccc	%g5,	%o3,	%g4
	call	loop_1076
	nop
	fitod	%f10,	%f24
	fdtos	%f24,	%f22
	fornot2	%f20,	%f22,	%f4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xBEB, 	%hsys_tick_cmpr
loop_1076:
	rdpr	%otherwin,	%i4
	sir	0x0770
	fmovd	%f24,	%f18
	nop
	setx	0x0BAD7FC3,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f16
	setx	0xD11A7FA3,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f5
	fdivs	%f5,	%f16,	%f15
	nop
	fitos	%f3,	%f0
	fstod	%f0,	%f0
	call	loop_1077
	rdhpr	%ver,	%l2
	fmovrdlz	%o5,	%f28,	%f8
	edge16	%g3,	%i1,	%l5
loop_1077:
	fornot2s	%f9,	%f0,	%f2
	fmul8x16al	%f24,	%f24,	%f12
	nop
	setx	0x6099FD0EB5F84DD2,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	fsqrtd	%f30,	%f10
	set	0x50, %o6
	ldxa	[%l7 + %o6] 0x80,	%i0
	wrpr	%l0,	%o7,	%cwp
	call	loop_1078
	nop
	set	0x44, %o7
	prefetch	[%l7 + %o7],	 2
	call	loop_1079
	tn	%icc,	0x7
loop_1078:
	call	loop_1080
	edge32n	%o4,	%l3,	%i3
loop_1079:
	fmovdne	%fcc0,	%f4,	%f20

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xD79, 	%hsys_tick_cmpr
loop_1080:
	call	loop_1081
	fandnot2	%f8,	%f20,	%f16
	call	loop_1082
	call	loop_1083
loop_1081:
	call	loop_1084
	nop
	setx	0x4FC852A3EF41B1B4,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0x2F914B51BD89CC8F,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	faddd	%f28,	%f6,	%f8
loop_1082:
	call	loop_1085
loop_1083:
	movrne	%g7,	0x269,	%l1
loop_1084:
	call	loop_1086
	wr	%i2,	0x0414,	%clear_softint
loop_1085:
	fnot2	%f20,	%f28
	call	loop_1087
loop_1086:
	fbl,a,pt	%fcc1,	loop_1088
	call	loop_1089
	add	%l4,	0x0EF3,	%o0
loop_1087:
	tneg	%icc,	0x0
loop_1088:
	ldd	[%l7 + 0x20],	%f8
loop_1089:
	rdpr	%wstate,	%l6
	call	loop_1090
	wrpr	%g6,	%o2,	%pil
	fnot1	%f26,	%f16
	call	loop_1091
loop_1090:
	fmovdg	%xcc,	%f22,	%f18
	ble,a	%icc,	loop_1092
	nop
	setx	0xE2D34F43F0ED9C8D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0x87BFCDE7CD8C5122,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	fdivd	%f12,	%f20,	%f16
loop_1091:
	fmovrdgez	%g2,	%f22,	%f30
	edge16	%i6,	%i7,	%g5
loop_1092:
	call	loop_1093
	fornot2	%f4,	%f0,	%f8
	call	loop_1094
	nop
	setx	0xD732B94,	%l0,	%l6
	st	%l6,	[%l7 + 0x78]
	ld	[%l7 + 0x78],	%fsr
loop_1093:
	bcc,a	%xcc,	loop_1095
	sdivcc	%o3,	0x0C6D,	%g4
loop_1094:
	fmul8x16au	%f18,	%f3,	%f4
	fcmple32	%f20,	%f4,	%i5
loop_1095:
	sllx	%o1,	%g1,	%l2
	fmovsvs	%xcc,	%f12,	%f30
	nop
	fitod	%f0,	%f10
	fdtox	%f10,	%f12
	fxtod	%f12,	%f10
	call	loop_1096
	edge32	%i4,	%g3,	%i1
	fmovsneg	%xcc,	%f13,	%f24
	movcs	%xcc,	%l5,	%i0
loop_1096:
	tsubcctv	%o5,	0x1B93,	%o7
	fpsub32	%f16,	%f18,	%f18
	call	loop_1097
	fands	%f21,	%f14,	%f12
	call	loop_1098
	fmovdo	%fcc2,	%f2,	%f20
loop_1097:
	call	loop_1099
	move	%xcc,	0x491,	%o4
loop_1098:
	call	loop_1100
	fmovrdgz	%l0,	%f22,	%f2
loop_1099:
	fxnors	%f1,	%f19,	%f20
	fxor	%f12,	%f0,	%f6
loop_1100:
	array16	%i3,	%l3,	%o6
	fmovd	%f12,	%f12
	fsrc2s	%f30,	%f6
	edge32	%l1,	%i2,	%l4
	fmovsneg	%icc,	%f1,	%f12
	fornot1s	%f5,	%f2,	%f22
	movneg	%xcc,	0x62A,	%o0
	fornot2s	%f15,	%f14,	%f8
	edge16n	%l6,	%g7,	%g6
	fmovdcs	%xcc,	%f26,	%f28
	fmovsg	%fcc3,	%f7,	%f31
	tg	%xcc,	0x4
	fxors	%f23,	%f7,	%f28
	fpadd32	%f20,	%f26,	%f14
	movge	%xcc,	0x062,	%o2
	fmovsue	%fcc2,	%f16,	%f24
	fba,a	%fcc3,	loop_1101
	nop
	fitos	%f5,	%f25
	fstoi	%f25,	%f25
	fxors	%f15,	%f6,	%f27
	call	loop_1102
loop_1101:
	fmovdul	%fcc2,	%f4,	%f30
	movrlez	%i6,	0x138,	%i7
	fnor	%f22,	%f14,	%f30
loop_1102:
	call	loop_1103
	call	loop_1104
	call	loop_1105
	addcc	%g2,	%o3,	%g4
loop_1103:
	nop
	set	0x20, %o4
	ldswa	[%l7 + %o4] 0x11,	%i5
loop_1104:
	fmovsgu	%xcc,	%f27,	%f8
loop_1105:
	rd	%ccr,	%o1
	fmovsge	%fcc0,	%f1,	%f13
	fornot1s	%f23,	%f19,	%f22
	wr	%g0,	0x04,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	ldstub	[%l7 + 0x18],	%g1
	movule	%fcc0,	%g5,	%i4
	fands	%f24,	%f26,	%f14
	call	loop_1106
	call	loop_1107
	call	loop_1108
	fbn,a,pt	%fcc3,	loop_1109
loop_1106:
	fmul8ulx16	%f18,	%f12,	%f20
loop_1107:
	call	loop_1110
loop_1108:
	call	loop_1111
loop_1109:
	fmovscc	%icc,	%f26,	%f28
	for	%f8,	%f20,	%f12
loop_1110:
	smulcc	%l2,	0x07DA,	%i1
loop_1111:
	fabss	%f25,	%f9
	umulcc	%g3,	%i0,	%o5
	fandnot1s	%f11,	%f12,	%f12
	movrgez	%o7,	%o4,	%l5
	fmovrdgez	%i3,	%f26,	%f8
	fpsub16	%f22,	%f10,	%f24
	nop
	fitod	%f2,	%f10
	fdtox	%f10,	%f28
	fxtod	%f28,	%f2
	nop
	set	0x60, %l3
	std	%l2,	[%l7 + %l3]
	call	loop_1112
	movule	%fcc0,	0x270,	%l0
	rd	%tick_cmpr,	%o6
	fandnot1	%f28,	%f18,	%f0
loop_1112:
	call	loop_1113
	fbuge,pn	%fcc0,	loop_1114
	fmovrdgz	%i2,	%f26,	%f6
	umulcc	%l4,	0x1C6E,	%o0
loop_1113:
	fmovdcs	%xcc,	%f24,	%f2
loop_1114:
	ldub	[%l7 + 0x60],	%l6
	faligndata	%f22,	%f24,	%f26
	movue	%fcc0,	0x31C,	%l1
	flushw
	call	loop_1115
	alignaddr	%g7,	%o2,	%g6
	faligndata	%f14,	%f8,	%f4
	call	loop_1116
loop_1115:
	fsrc1s	%f7,	%f5
	fmovsu	%fcc0,	%f5,	%f30
	movuge	%fcc2,	%i7,	%g2
loop_1116:
	call	loop_1117
	wrpr	%i6,	%g4,	%pil
	call	loop_1118
	rdpr	%tl,	%i5
loop_1117:
	call	loop_1119
	fzeros	%f13
loop_1118:
	nop
	setx	0x9103697461276E69,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0x382D08B81D6F8595,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	fmuld	%f28,	%f12,	%f2
	fmovrsgez	%o3,	%f30,	%f8
loop_1119:
	fmovdule	%fcc2,	%f24,	%f8
	call	loop_1120
	fzeros	%f0
	nop
	set	0x34, %l4
	stb	%o1,	[%l7 + %l4]
	call	loop_1121
loop_1120:
	call	loop_1122
	fnot1	%f16,	%f16
	te	%icc,	0x6
loop_1121:
	fcmple32	%f26,	%f8,	%g5
loop_1122:
	call	loop_1123
	call	loop_1124
	fnors	%f8,	%f10,	%f18
	fnegs	%f3,	%f20
loop_1123:
	fbug	%fcc1,	loop_1125
loop_1124:
	call	loop_1126
	array8	%i4,	%l2,	%g1
	fnot2	%f10,	%f16
loop_1125:
	call	loop_1127
loop_1126:
	call	loop_1128
	te	%xcc,	0x4
	set	0x30, %l0
	stxa	%i1,	[%l7 + %l0] 0xeb
	membar	#Sync
loop_1127:
	fmovdul	%fcc0,	%f10,	%f26
loop_1128:
	nop
	fitod	%f6,	%f10
	fdtoi	%f10,	%f29
	movcs	%icc,	0x4BF,	%g3
	sub	%i0,	%o5,	%o7
	fmovdu	%fcc2,	%f22,	%f0
	fmovsneg	%xcc,	%f30,	%f6
	nop
	setx	0xD2813D0092F63C5F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0x25C68897,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	fsmuld	%f24,	%f28,	%f14
	call	loop_1129
	call	loop_1130
	rdhpr	%htba,	%l5
	movu	%fcc2,	0x5B4,	%o4
loop_1129:
	tne	%xcc,	0x2
loop_1130:
	brlz	%l3,	loop_1131
	siam	0x4
	ld	[%l7 + 0x40],	%f17
	call	loop_1132
loop_1131:
	fcmpgt32	%f28,	%f6,	%l0
	subc	%o6,	0x1C78,	%i2
	rd	%pc,	%l4
loop_1132:
	for	%f22,	%f8,	%f12
	call	loop_1133
	call	loop_1134
	fornot1s	%f16,	%f20,	%f0
	smulcc	%o0,	0x09BB,	%i3
loop_1133:
	fmovdpos	%icc,	%f2,	%f18
loop_1134:
	call	loop_1135
	edge8	%l1,	%g7,	%l6
	fmul8x16al	%f26,	%f22,	%f12
	movrgz	%g6,	%i7,	%g2
loop_1135:
	call	loop_1136
	call	loop_1137
	fmovde	%icc,	%f14,	%f30
	call	loop_1138
loop_1136:
	fmovscs	%xcc,	%f10,	%f7
loop_1137:
	fone	%f8
	stw	%o2,	[%l7 + 0x20]
loop_1138:
	fmovsvc	%icc,	%f12,	%f18
	rd	%softint,	%g4
	call	loop_1139
	fmovsne	%fcc2,	%f1,	%f6
	fmovrslz	%i6,	%f8,	%f22
	fmovd	%f10,	%f14
loop_1139:
	fornot2s	%f5,	%f16,	%f6
	call	loop_1140
	call	loop_1141
	srlx	%i5,	%o3,	%o1
	fandnot1s	%f26,	%f6,	%f9
loop_1140:
	fmul8x16	%f19,	%f30,	%f12
loop_1141:
	nop
	set	0x74, %i2
	ldsha	[%l7 + %i2] 0x10,	%g5
	edge32l	%l2,	%g1,	%i1
	movul	%fcc1,	%g3,	%i0
	tn	%icc,	0x0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xBBD, 	%tick_cmpr
	fmovsug	%fcc2,	%f6,	%f15
	fmovspos	%icc,	%f21,	%f17
	call	loop_1142
	flushw
	sir	0x0A87
	fmovsul	%fcc3,	%f22,	%f5
loop_1142:
	fmovrdgez	%i4,	%f22,	%f0
	call	loop_1143
	fbul	%fcc1,	loop_1144
	edge32l	%l5,	%o4,	%o7
	fpsub16s	%f0,	%f3,	%f15
loop_1143:
	call	loop_1145
loop_1144:
	tpos	%xcc,	0x0
	fandnot1	%f30,	%f6,	%f18
	fmul8ulx16	%f22,	%f10,	%f10
loop_1145:
	call	loop_1146
	call	loop_1147
	alignaddrl	%l3,	%o6,	%i2
	movvc	%xcc,	0x6B0,	%l0
loop_1146:
	fsrc1	%f2,	%f20
loop_1147:
	bg,a	%icc,	loop_1148
	orncc	%l4,	0x01DC,	%o0
	fmovscs	%xcc,	%f2,	%f22
	srl	%i3,	%l1,	%l6
loop_1148:
	fpsub32s	%f26,	%f30,	%f24
	call	loop_1149
	fmul8ulx16	%f20,	%f26,	%f24
	movug	%fcc3,	%g7,	%i7
	sethi	0x0781,	%g2
loop_1149:
	edge8ln	%o2,	%g6,	%g4
	call	loop_1150
	tleu	%icc,	0x1
	call	loop_1151
	edge8	%i5,	%o3,	%o1
loop_1150:
	call	loop_1152
	movrlz	%g5,	%l2,	%i6
loop_1151:
	bcs,a,pn	%icc,	loop_1153
	nop
	fitos	%f19,	%f27
loop_1152:
	call	loop_1154
	tsubcc	%g1,	%i1,	%i0
loop_1153:
	brnz,a	%g3,	loop_1155
	wrpr	%i4,	0x057F,	%cwp
loop_1154:
	flushw
	tvs	%icc,	0x7
loop_1155:
	brz,pn	%o5,	loop_1156
	xor	%l5,	0x093B,	%o4
	movrne	%l3,	%o7,	%i2
	movlg	%fcc2,	0x163,	%o6
loop_1156:
	movneg	%xcc,	%l0,	%l4
	tn	%icc,	0x7
	call	loop_1157
	call	loop_1158
	fmovsn	%xcc,	%f15,	%f21
	call	loop_1159
loop_1157:
	fmovslg	%fcc2,	%f20,	%f23
loop_1158:
	umul	%i3,	0x1242,	%l1
	fmovsue	%fcc2,	%f22,	%f30
loop_1159:
	andcc	%l6,	0x0E1D,	%o0
	tcc	%icc,	0x7
	tpos	%xcc,	0x1
	subccc	%g7,	%i7,	%g2
	call	loop_1160
	ble,pt	%xcc,	loop_1161
	pdist	%f24,	%f16,	%f2
	fmovrdgez	%g6,	%f28,	%f0
loop_1160:
	call	loop_1162
loop_1161:
	movn	%xcc,	%o2,	%g4
	call	loop_1163
	call	loop_1164
loop_1162:
	fbul	%fcc1,	loop_1165
	fmovdne	%fcc3,	%f6,	%f30
loop_1163:
	smul	%o3,	%i5,	%g5
loop_1164:
	fxnor	%f12,	%f12,	%f22
loop_1165:
	fmovrslz	%l2,	%f7,	%f27
	tsubcc	%i6,	0x0B61,	%g1
	nop
	set	0x30, %l1
	ldd	[%l7 + %l1],	%i0
	nop
	setx	0xCF2DCE0F6B340AD3,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	fsqrtd	%f28,	%f6
	fcmpgt32	%f14,	%f22,	%i0
	wr 	%g0, 	0x5, 	%fprs
	movle	%xcc,	0x39A,	%i4
	movn	%fcc0,	%o5,	%g3
	rd	%sys_tick_cmpr,	%l5
	fmovsn	%xcc,	%f8,	%f10
	fbn,a	%fcc1,	loop_1166
	call	loop_1167
	call	loop_1168
	orcc	%o4,	0x05C3,	%o7
loop_1166:
	fands	%f12,	%f6,	%f13
loop_1167:
	fmovrdgez	%i2,	%f6,	%f14
loop_1168:
	fmovsvc	%xcc,	%f16,	%f9
	call	loop_1169
	subcc	%o6,	%l3,	%l0
	call	loop_1170
	call	loop_1171
loop_1169:
	call	loop_1172
	call	loop_1173
loop_1170:
	call	loop_1174
loop_1171:
	movuge	%fcc0,	0x01D,	%i3
loop_1172:
	fmovscs	%icc,	%f9,	%f9
loop_1173:
	call	loop_1175
loop_1174:
	fnands	%f23,	%f5,	%f31
	call	loop_1176
	movrgz	%l4,	0x3F0,	%l1
loop_1175:
	bge	%icc,	loop_1177
	fmuld8sux16	%f11,	%f8,	%f26
loop_1176:
	std	%f14,	[%l7 + 0x40]
	call	loop_1178
loop_1177:
	edge16	%l6,	%o0,	%g7
	call	loop_1179
	bge,a	%icc,	loop_1180
loop_1178:
	movre	%i7,	%g2,	%o2
	call	loop_1181
loop_1179:
	addccc	%g6,	0x0B13,	%o3
loop_1180:
	call	loop_1182
	call	loop_1183
loop_1181:
	call	loop_1184
	call	loop_1185
loop_1182:
	nop
	setx	0x18CB,	%l0,	%g4
	udiv	%i5,	%g4,	%g5
loop_1183:
	te	%xcc,	0x6
loop_1184:
	tsubcc	%l2,	0x0EEC,	%i6
loop_1185:
	movleu	%xcc,	%g1,	%i0
	fbuge	%fcc0,	loop_1186
	tcs	%icc,	0x3
	call	loop_1187
	call	loop_1188
loop_1186:
	subcc	%o1,	0x1B38,	%i1
	fmovda	%xcc,	%f12,	%f20
loop_1187:
	nop

loop_1188:
	nop

	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 7:
!
!	Type l   	: 23
!	Type a   	: 28
!	Type x   	: 9
!	Type cti   	: 151
!	Type f   	: 161
!	Type i   	: 128
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


	EXIT_GOOD	/* test finish  */

/************************************************************************
   Test case data start
 ************************************************************************/
.data
user_data_start:
scratch_area:
.word 0x2CCE8D12
.word 0xC3F8C20D
.word 0xDF6398D9
.word 0xADF2F483
.word 0x3BECC028
.word 0xE752791C
.word 0x5E4997F2
.word 0xDF169A0F
.word 0x412A8825
.word 0xD617E44D
.word 0x0F2F14B7
.word 0xBF2BD6BA
.word 0xBF4C69CA
.word 0xF6EE8A0C
.word 0x937B34D7
.word 0x0C4160DC
.word 0x0141F04E
.word 0x453110BF
.word 0x13B2BB6A
.word 0x0EE93583
.word 0xE2C0CF0D
.word 0xAA19C7C7
.word 0xA2B90FAA
.word 0x559A0151
.word 0x5991614B
.word 0xA63DD788
.word 0x0792D1AD
.word 0x986B604F
.word 0x202F0158
.word 0x3FBDDB54
.word 0x22CE1C8F
.word 0x73DB5759
.word 0xFD614571
.word 0xD1B72943
.word 0x09E9A918
.word 0xF4E2588D
.word 0xA7EFAAB0
.word 0x1CF35F2F
.word 0xCDEC8A8B
.word 0xDA230D15
.word 0xF58A4FED
.word 0xC5E8FBFD
.word 0x70A539F3
.word 0x7A58C9AC
.word 0xAA6B04AB
.word 0xAABC765D
.word 0x37AD9092
.word 0x8D0E9A5F
.word 0xF517C699
.word 0x51A221E3
.word 0xACB89E96
.word 0x9C862BAA
.word 0x0B81ADB3
.word 0x3E4597BC
.word 0xB0F8E5EC
.word 0xC4E44DAE
.word 0xEC47D3DF
.word 0xA14FA918
.word 0x03FB4A25
.word 0x0955888E
.word 0x747BC80A
.word 0x6844211D
.word 0x189B5989
.word 0x023831A9
.end
