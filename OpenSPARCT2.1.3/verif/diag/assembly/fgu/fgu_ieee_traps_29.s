/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: fgu_ieee_traps_29.s
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
.ident "FOCUSCASE: focus.pm,v 1.1 2003/04/23 17:53:39 somePerson Exp somePerson $ spc_basic_isa3.pl FOCUS_SEED=133241"
.ident "Mon Dec  8 19:58:43 CST 2003"
.ident "Using Instruction Hash for Focus :$Id: fgu_ieee_traps_29.s,v 1.4 2007/07/27 21:45:32 drp Exp $"
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
	set	0xC,	%g1
	set	0xC,	%g2
	set	0x8,	%g3
	set	0x8,	%g4
	set	0xE,	%g5
	set	0xD,	%g6
	set	0x9,	%g7
	!# Input registers
	set	-0x1,	%i0
	set	-0xD,	%i1
	set	-0x9,	%i2
	set	-0xF,	%i3
	set	-0x0,	%i4
	set	-0xA,	%i5
	set	-0xD,	%i6
	set	-0x1,	%i7
	!# Local registers
	set	0x3B429A8A,	%l0
	set	0x0F3D2117,	%l1
	set	0x4B1856D1,	%l2
	set	0x004EF2C6,	%l3
	set	0x20D621D6,	%l4
	set	0x4EED4DE9,	%l5
	set	0x227ABCD4,	%l6
	!# Output registers
	set	0x0EA2,	%o0
	set	-0x1829,	%o1
	set	0x133E,	%o2
	set	-0x14C6,	%o3
	set	-0x04A6,	%o4
	set	0x1CBF,	%o5
	set	0x1C07,	%o6
	set	-0x1A4D,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0xBDC02D05494A9F57)
	INIT_TH_FP_REG(%l7,%f2,0x882D54E409A81313)
	INIT_TH_FP_REG(%l7,%f4,0x4B62A896F84501EF)
	INIT_TH_FP_REG(%l7,%f6,0x024591A99765DD14)
	INIT_TH_FP_REG(%l7,%f8,0x973680810C5E654C)
	INIT_TH_FP_REG(%l7,%f10,0x6F172A3F35C8DEA3)
	INIT_TH_FP_REG(%l7,%f12,0x550BD6991F22F32F)
	INIT_TH_FP_REG(%l7,%f14,0xC23E230E73B5EA0B)
	INIT_TH_FP_REG(%l7,%f16,0x8B432D4FA91DAF47)
	INIT_TH_FP_REG(%l7,%f18,0xE07D2E4B2229E84A)
	INIT_TH_FP_REG(%l7,%f20,0x82BAC4E828D38A05)
	INIT_TH_FP_REG(%l7,%f22,0x9D595B6BCC62A44F)
	INIT_TH_FP_REG(%l7,%f24,0xD0FD43FC16F917F2)
	INIT_TH_FP_REG(%l7,%f26,0xED4F08CF9CC2465D)
	INIT_TH_FP_REG(%l7,%f28,0xC86ED0FF8793FFE4)
	INIT_TH_FP_REG(%l7,%f30,0x2962878FB08EBDCA)

	!# Execute Main Diag ..

	call	loop_1
	call	loop_2
	umulcc	%o5,	0x00F6,	%o0
	add	%i7,	0x12CC,	%g4
loop_1:
	rd	%sys_tick_cmpr,	%o1
loop_2:
	call	loop_3
	fmul8x16au	%f2,	%f2,	%f18
	fmovrsgz	%i1,	%f7,	%f6
	call	loop_4
loop_3:
	fmovdneg	%icc,	%f6,	%f28
	siam	0x0
	call	loop_5
loop_4:
	fmovso	%fcc3,	%f8,	%f17
	nop
	setx	0x176A,	%l0,	%l3
	udivx	%i2,	%l3,	%l2
	movul	%fcc3,	%g2,	%o7
loop_5:
	sir	0x12C5
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	umul	%i3,	%l6,	%i6
	call	loop_6
	add	%g3,	0x1CF5,	%g1
	fxnor	%f18,	%f8,	%f0
	call	loop_7
loop_6:
	nop
	fitos	%f12,	%f25
	addcc	%g7,	%g6,	%g5
	tge	%icc,	0x0
loop_7:
	call	loop_8
	fmovsug	%fcc3,	%f1,	%f25
	fmovdl	%xcc,	%f10,	%f4
	movvc	%icc,	0x734,	%o3
loop_8:
	call	loop_9
	bshuffle	%f22,	%f16,	%f12
	stbar
	xor	%i0,	0x1511,	%l4
loop_9:
	fcmple32	%f30,	%f22,	%o2
	sllx	%i5,	0x13,	%i4
	fmul8ulx16	%f28,	%f26,	%f26
	call	loop_10
	movn	%xcc,	%l5,	%o4
	subccc	%l1,	%l0,	%o5
	fmul8x16	%f25,	%f6,	%f6
loop_10:
	call	loop_11
	edge8l	%o6,	%o0,	%g4
	bn	%xcc,	loop_12
	bpos,pt	%icc,	loop_13
loop_11:
	umul	%o1,	%i1,	%i7
	fmovsug	%fcc1,	%f13,	%f27
loop_12:
	rdpr	%tl,	%l3
loop_13:
	fcmpeq16	%f30,	%f6,	%i2
	fmovdug	%fcc1,	%f12,	%f18

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x731, 	%hsys_tick_cmpr
	call	loop_14
	movvc	%xcc,	0x6FA,	%o7
	flushw
	call	loop_15
loop_14:
	nop
	fitod	%f0,	%f8
	fdtox	%f8,	%f16
	fcmpd	%fcc0,	%f22,	%f20
	movrlez	%i3,	0x267,	%i6
loop_15:
	nop
	setx	0x8A6F2D2FAD7A56CA,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0x2701FD1F,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	fsmuld	%f22,	%f22,	%f0
	fmovdpos	%icc,	%f22,	%f26
	fexpand	%f7,	%f0
	fcmps	%fcc0,	%f3,	%f14
	call	loop_16
	fble,a,pt	%fcc1,	loop_17
	fmovsl	%xcc,	%f22,	%f12
	call	loop_18
loop_16:
	call	loop_19
loop_17:
	call	loop_20
	call	loop_21
loop_18:
	call	loop_22
loop_19:
	bpos,a	%xcc,	loop_23
loop_20:
	nop
	setx	0x823C9720,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f20
	setx	0xC1847F46,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f16
	fadds	%f16,	%f20,	%f28
loop_21:
	movu	%fcc3,	%l6,	%g1
loop_22:
	bne	%xcc,	loop_24
loop_23:
	fmovdpos	%xcc,	%f2,	%f14
	fmovsle	%fcc0,	%f11,	%f1
	fmovsug	%fcc3,	%f23,	%f10
loop_24:
	fmovsn	%xcc,	%f4,	%f10
	movne	%fcc1,	0x652,	%g7
	movuge	%fcc1,	0x6A4,	%g6
	movneg	%xcc,	0x018,	%g3
	fmovrsgz	%o3,	%f21,	%f0
	call	loop_25
	fmovde	%fcc3,	%f20,	%f26
	edge16l	%i0,	%l4,	%o2
	call	loop_26
loop_25:
	call	loop_27
	fpackfix	%f6,	%f25
	fandnot2	%f2,	%f12,	%f22
loop_26:
	call	loop_28
loop_27:
	call	loop_29
	call	loop_30
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
loop_28:
	fmovduge	%fcc2,	%f30,	%f16
loop_29:
	nop
	wr	%g0,	0x19,	%asi
	stda	%g4,	[%l7 + 0x10] %asi
loop_30:
	and	%i4,	%l5,	%i5
	call	loop_31
	tge	%icc,	0x5
	wr	%l1,	%o4,	%set_softint
	fbne,a	%fcc1,	loop_32
loop_31:
	fmovsge	%fcc1,	%f1,	%f20
	call	loop_33
	fnot2	%f22,	%f20
loop_32:
	std	%l0,	[%l7 + 0x28]
	set	0x1E, %o1
	stha	%o6,	[%l7 + %o1] 0x0c
loop_33:
	srlx	%o0,	0x02,	%g4
	fnot1s	%f18,	%f1
	call	loop_34
	call	loop_35
	call	loop_36
	fmul8x16au	%f1,	%f14,	%f2
loop_34:
	fmovdue	%fcc1,	%f6,	%f14
loop_35:
	call	loop_37
loop_36:
	fmovdg	%fcc0,	%f20,	%f10
	fnot2	%f26,	%f6
	call	loop_38
loop_37:
	fmovdleu	%icc,	%f20,	%f18
	movu	%fcc1,	%o5,	%i1
	call	loop_39
loop_38:
	edge8l	%i7,	%l3,	%o1
	fmovrdlez	%l2,	%f14,	%f14
	tsubcctv	%i2,	0x1FDB,	%o7
loop_39:
	fnand	%f12,	%f14,	%f4
	call	loop_40
	call	loop_41
	call	loop_42
	nop
	set	0x7C, %o5
	ldsw	[%l7 + %o5],	%i3
loop_40:
	srax	%i6,	%l6,	%g1
loop_41:
	fnot1s	%f22,	%f27
loop_42:
	call	loop_43
	andcc	%g2,	%g7,	%g6
	edge16ln	%o3,	%i0,	%g3
	call	loop_44
loop_43:
	nop
	fitos	%f11,	%f11
	fstox	%f11,	%f20
	rdhpr	%hsys_tick_cmpr,	%o2
	subcc	%l4,	%i4,	%g5
loop_44:
	xnor	%l5,	0x175E,	%l1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	sub	%o4,	0x1B7F,	%o6
	nop
	fitod	%f2,	%f22
	fdtoi	%f22,	%f21
	fpackfix	%f28,	%f29
	nop
	setx	0xD27A3437E688740E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0x01BB40D3F9FDA14F,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	fmuld	%f26,	%f14,	%f6
	fnegd	%f4,	%f0
	alignaddr	%l0,	%o0,	%o5
	flushw
	fmovsuge	%fcc3,	%f5,	%f21
	call	loop_45
	call	loop_46
	fmovrdgz	%g4,	%f10,	%f0
	andncc	%i7,	%l3,	%i1
loop_45:
	call	loop_47
loop_46:
	fsrc1	%f18,	%f4
	nop
	setx	loop_48,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x021200001406,	%l0,	%l1
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
	edge16n	%o1,	%i2,	%l2
loop_47:
	smulcc	%i3,	%o7,	%i6
	call	loop_49
loop_48:
	nop
	fitos	%f8,	%f1
	fandnot1s	%f14,	%f29,	%f29
	call	loop_50
loop_49:
	call	loop_51
	andncc	%g1,	0x093D,	%l6
	bneg,a,pt	%icc,	loop_52
loop_50:
	fxnors	%f11,	%f11,	%f13
loop_51:
	edge8	%g2,	%g7,	%o3
	siam	0x0
loop_52:
	edge32n	%g6,	%i0,	%o2
	fmovrdlz	%l4,	%f18,	%f8
	sll	%i4,	%g3,	%g5
	call	loop_53
	fxnor	%f30,	%f20,	%f10
	fmovdule	%fcc2,	%f4,	%f2
	alignaddrl	%l5,	%i5,	%o4
loop_53:
	fmul8x16	%f25,	%f24,	%f10
	call	loop_54
	call	loop_55
	call	loop_56
	mulx	%o6,	%l1,	%o0
loop_54:
	fmovsvs	%icc,	%f16,	%f0
loop_55:
	and	%l0,	%g4,	%i7
loop_56:
	orncc	%l3,	0x1B57,	%o5
	call	loop_57
	call	loop_58
	call	loop_59
	fmovsue	%fcc1,	%f23,	%f15
loop_57:
	fnot1	%f4,	%f10
loop_58:
	call	loop_60
loop_59:
	call	loop_61
	fpsub16	%f26,	%f16,	%f22
	fcmpgt32	%f4,	%f2,	%o1
loop_60:
	call	loop_62
loop_61:
	add	%i1,	%i2,	%i3
	for	%f28,	%f28,	%f18
	fmovrsgez	%o7,	%f21,	%f4
loop_62:
	fmovsg	%xcc,	%f15,	%f3
	call	loop_63
	movug	%fcc1,	0x204,	%i6
	call	loop_64
	call	loop_65
loop_63:
	xor	%l2,	0x0F8D,	%g1
loop_64:
	nop

loop_65:
	nop

	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 0:
!
!	Type l   	: 5
!	Type a   	: 6
!	Type x   	: 2
!	Type cti   	: 65
!	Type f   	: 68
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
	set	0x5,	%g1
	set	0xE,	%g2
	set	0xF,	%g3
	set	0x5,	%g4
	set	0x1,	%g5
	set	0xA,	%g6
	set	0xF,	%g7
	!# Input registers
	set	-0xA,	%i0
	set	-0x8,	%i1
	set	-0x1,	%i2
	set	-0xA,	%i3
	set	-0xD,	%i4
	set	-0x3,	%i5
	set	-0x4,	%i6
	set	-0xD,	%i7
	!# Local registers
	set	0x33353AFD,	%l0
	set	0x10A26DD9,	%l1
	set	0x47BA9F60,	%l2
	set	0x52493B53,	%l3
	set	0x21AC0BBC,	%l4
	set	0x4B752867,	%l5
	set	0x7D9F0138,	%l6
	!# Output registers
	set	0x1916,	%o0
	set	0x0F66,	%o1
	set	-0x0736,	%o2
	set	-0x1158,	%o3
	set	-0x026E,	%o4
	set	0x1648,	%o5
	set	0x1808,	%o6
	set	-0x0C50,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0xBDC02D05494A9F57)
	INIT_TH_FP_REG(%l7,%f2,0x882D54E409A81313)
	INIT_TH_FP_REG(%l7,%f4,0x4B62A896F84501EF)
	INIT_TH_FP_REG(%l7,%f6,0x024591A99765DD14)
	INIT_TH_FP_REG(%l7,%f8,0x973680810C5E654C)
	INIT_TH_FP_REG(%l7,%f10,0x6F172A3F35C8DEA3)
	INIT_TH_FP_REG(%l7,%f12,0x550BD6991F22F32F)
	INIT_TH_FP_REG(%l7,%f14,0xC23E230E73B5EA0B)
	INIT_TH_FP_REG(%l7,%f16,0x8B432D4FA91DAF47)
	INIT_TH_FP_REG(%l7,%f18,0xE07D2E4B2229E84A)
	INIT_TH_FP_REG(%l7,%f20,0x82BAC4E828D38A05)
	INIT_TH_FP_REG(%l7,%f22,0x9D595B6BCC62A44F)
	INIT_TH_FP_REG(%l7,%f24,0xD0FD43FC16F917F2)
	INIT_TH_FP_REG(%l7,%f26,0xED4F08CF9CC2465D)
	INIT_TH_FP_REG(%l7,%f28,0xC86ED0FF8793FFE4)
	INIT_TH_FP_REG(%l7,%f30,0x2962878FB08EBDCA)

	!# Execute Main Diag ..

	call	loop_66
	nop
	fitod	%f6,	%f20
	fdtos	%f20,	%f4
	srlx	%g2,	%g7,	%l6
	call	loop_67
loop_66:
	call	loop_68
	fmovdul	%fcc3,	%f4,	%f18
	fmovdn	%fcc3,	%f26,	%f24
loop_67:
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
loop_68:
	be,pn	%xcc,	loop_69
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	call	loop_70
	fmovdcs	%icc,	%f26,	%f0
loop_69:
	tvc	%icc,	0x6
	fnot1s	%f21,	%f15
loop_70:
	nop
	setx	0xE96539F0CCE84677,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0x2200F82CD2E0D04E,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fmuld	%f0,	%f4,	%f28
	movrgez	%g6,	%o3,	%o2
	call	loop_71
	call	loop_72
	bshuffle	%f28,	%f24,	%f6
	fmovrsne	%l4,	%f9,	%f3
loop_71:
	umul	%i4,	%g3,	%i0
loop_72:
	movrlz	%g5,	%l5,	%o4
	rdpr	%tba,	%i5
	movge	%xcc,	0x351,	%l1
	fbo,pn	%fcc2,	loop_73
	call	loop_74
	edge16l	%o6,	%l0,	%g4
	fbug,a	%fcc0,	loop_75
loop_73:
	te	%icc,	0x4
loop_74:
	call	loop_76
	call	loop_77
loop_75:
	movue	%fcc2,	0x2B0,	%o0
	fmovdcs	%xcc,	%f8,	%f0
loop_76:
	call	loop_78
loop_77:
	and	%i7,	0x1E8E,	%o5
	addc	%o1,	%l3,	%i2
	call	loop_79
loop_78:
	fmovdgu	%icc,	%f8,	%f28
	tne	%icc,	0x3
	tcs	%icc,	0x1
loop_79:
	fcmpgt32	%f18,	%f4,	%i1
	tle	%xcc,	0x1
	call	loop_80
	movpos	%xcc,	0x137,	%i3
	movrne	%o7,	0x2F6,	%l2
	fxnor	%f16,	%f20,	%f24
loop_80:
	fpadd32s	%f7,	%f5,	%f22
	sra	%i6,	%g1,	%g2
	movvc	%icc,	%l6,	%g7
	fcmple16	%f22,	%f10,	%o3
	wrpr 	%g0, 	0x3, 	%gl
	fcmpeq32	%f10,	%f30,	%i4
	addcc	%g3,	0x157E,	%o2
	fpsub32	%f14,	%f14,	%f8
	nop
	setx	0xF3C5E37F,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f1
	setx	0xA0056C31,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f20
	fadds	%f20,	%f1,	%f5
	fmovsleu	%icc,	%f26,	%f5
	movne	%fcc0,	%i0,	%g5
	nop
	fitod	%f8,	%f4
	fdtos	%f4,	%f27
	edge8	%l5,	%i5,	%l1
	fmovrdgz	%o6,	%f28,	%f24
	srlx	%o4,	%l0,	%g4
	call	loop_81
	call	loop_82
	movrgz	%i7,	%o0,	%o5
	call	loop_83
loop_81:
	fcmpd	%fcc0,	%f0,	%f18
loop_82:
	fpack32	%f0,	%f30,	%f20
	fcmpes	%fcc2,	%f27,	%f12
loop_83:
	nop
	setx loop_84, %l0, %l1
	jmpl %l1, %o1
	wrpr	%i2,	%i1,	%pil
	call	loop_85
	fnot1	%f28,	%f28
loop_84:
	call	loop_86
	movuge	%fcc1,	0x46A,	%l3
loop_85:
	fmovdue	%fcc3,	%f24,	%f30
	call	loop_87
loop_86:
	bvs,pn	%icc,	loop_88
	siam	0x1
	mulscc	%o7,	0x1BDE,	%l2
loop_87:
	call	loop_89
loop_88:
	sir	0x0C40
	nop
	setx	0xEE091370,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f10
	setx	0x6F14888C,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f22
	fadds	%f22,	%f10,	%f4
	fmovdue	%fcc0,	%f30,	%f2
loop_89:
	call	loop_90
	movul	%fcc3,	%i6,	%g1
	nop
	setx	0x65DDB9BF,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f19
	setx	0x2EBF6A97,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f7
	fdivs	%f7,	%f19,	%f31
	fxors	%f8,	%f31,	%f13
loop_90:
	fxors	%f19,	%f21,	%f5
	tsubcctv	%g2,	0x0214,	%l6
	nop
	setx	0xD4045767A6AF07DB,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0x0D5524EF,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	fsmuld	%f12,	%f2,	%f2
	fmovde	%xcc,	%f0,	%f24
	fmovrde	%i3,	%f10,	%f10
	movo	%fcc1,	%o3,	%g7
	array32	%g6,	%l4,	%g3
	wrpr	%o2,	0x0218,	%pil
	call	loop_91
	tvs	%xcc,	0x2
	call	loop_92
	movvc	%icc,	%i4,	%i0
loop_91:
	xor	%g5,	%l5,	%i5
	xnor	%l1,	%o6,	%l0
loop_92:
	fmovscc	%xcc,	%f29,	%f14
	fmovsle	%xcc,	%f7,	%f25
	movne	%fcc2,	0x420,	%o4
	wr	%g0,	0x81,	%asi
	sta	%f3,	[%l7 + 0x18] %asi
	taddcc	%g4,	%i7,	%o0
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	fpsub32s	%f9,	%f16,	%f22
	tvc	%icc,	0x7
	fmovdleu	%xcc,	%f20,	%f4
	call	loop_93
	rdpr	%canrestore,	%o1
	fabsd	%f28,	%f2
	nop
	setx loop_94, %l0, %l1
	jmpl %l1, %i2
loop_93:
	ta	%icc,	0x0
	addcc	%o5,	%i1,	%l3
	call	loop_95
loop_94:
	call	loop_96
	call	loop_97
	call	loop_98
loop_95:
	st	%fsr,	[%l7 + 0x0C]
loop_96:
	movrlz	%o7,	0x048,	%i6
loop_97:
	call	loop_99
loop_98:
	call	loop_100
	fmovsvc	%xcc,	%f17,	%f20
	wr	%g0,	0x04,	%asi
	ldxa	[%l7 + 0x48] %asi,	%l2
loop_99:
	membar	0x22
loop_100:
	st	%fsr,	[%l7 + 0x78]
	brgz,pt	%g2,	loop_101
	bvc,a,pn	%xcc,	loop_102
	call	loop_103
	addc	%l6,	0x1CA6,	%g1
loop_101:
	fand	%f18,	%f16,	%f12
loop_102:
	fmovs	%f25,	%f23
loop_103:
	fmovscs	%xcc,	%f18,	%f27
	call	loop_104
	sra	%i3,	%g7,	%o3
	call	loop_105
	taddcc	%g6,	%l4,	%g3
loop_104:
	call	loop_106
	fmovscs	%icc,	%f13,	%f20
loop_105:
	fmovrdne	%i4,	%f30,	%f26
	tn	%xcc,	0x4
loop_106:
	fpmerge	%f1,	%f21,	%f30
	call	loop_107
	fxors	%f31,	%f7,	%f19
	call	loop_108
	call	loop_109
loop_107:
	nop
	setx	0xF445D5053599ADDD,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0x53487A3F7B654FFA,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fdivd	%f0,	%f10,	%f16
	addcc	%o2,	%i0,	%l5
loop_108:
	call	loop_110
loop_109:
	fzero	%f14
	fandnot1	%f4,	%f10,	%f10
	fpsub16	%f0,	%f20,	%f14
loop_110:
	fmuld8ulx16	%f23,	%f3,	%f0
	rdpr	%otherwin,	%i5
	call	loop_111
	fmovduge	%fcc1,	%f30,	%f28
	move	%fcc2,	0x4DF,	%g5
	fcmped	%fcc3,	%f26,	%f4
loop_111:
	bpos	%icc,	loop_112
	fpadd32	%f28,	%f2,	%f0
	call	loop_113
	call	loop_114
loop_112:
	sllx	%o6,	0x07,	%l0
	fmovse	%xcc,	%f25,	%f3
loop_113:
	edge16ln	%l1,	%o4,	%g4
loop_114:
	be	%icc,	loop_115
	bl,a,pn	%xcc,	loop_116
	addcc	%i7,	0x17D1,	%o0
	add	%i2,	%o5,	%i1
loop_115:
	wrpr	%l3,	%o1,	%tick
loop_116:
	fsrc2s	%f13,	%f15
	nop
	set	0x34, %l1
	stw	%i6,	[%l7 + %l1]
	nop
	setx	0x382B14D3,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f11
	setx	0xFCCF45D0,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f4
	fadds	%f4,	%f11,	%f24
	fand	%f4,	%f14,	%f8
	call	loop_117
	tgu	%icc,	0x4
	call	loop_118
	udiv	%l2,	0x0212,	%g2
loop_117:
	fmovspos	%icc,	%f1,	%f16
	call	loop_119
loop_118:
	fmovdu	%fcc0,	%f16,	%f22
	ldsw	[%l7 + 0x38],	%o7
	nop
	set	0x52, %o2
	stb	%l6,	[%l7 + %o2]
loop_119:
	fmovrse	%i3,	%f8,	%f30
	wr	%g1,	0x00A1,	%ccr
	wr	%g0,	0x80,	%asi
	sta	%f20,	[%l7 + 0x30] %asi
	nop
	setx	0x38DE0E2E,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f17
	setx	0xC233FBDD,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f27
	fmuls	%f27,	%f17,	%f12
	fble,a	%fcc0,	loop_120
	tne	%icc,	0x4
	call	loop_121
	wrpr 	%g0, 	0x3, 	%gl
loop_120:
	fmul8sux16	%f16,	%f26,	%f22
	movcs	%icc,	0x14A,	%o3
loop_121:
	fmovdcc	%xcc,	%f2,	%f30
	call	loop_122
loop_122:
	nop

	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 1:
!
!	Type l   	: 8
!	Type a   	: 9
!	Type x   	: 3
!	Type cti   	: 57
!	Type f   	: 65
!	Type i   	: 58
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
	set	0x4,	%g2
	set	0x2,	%g3
	set	0xE,	%g4
	set	0xA,	%g5
	set	0x0,	%g6
	set	0x7,	%g7
	!# Input registers
	set	-0xB,	%i0
	set	-0x2,	%i1
	set	-0x4,	%i2
	set	-0x4,	%i3
	set	-0x7,	%i4
	set	-0x1,	%i5
	set	-0x9,	%i6
	set	-0x4,	%i7
	!# Local registers
	set	0x11351D25,	%l0
	set	0x555A11AD,	%l1
	set	0x75F6AA09,	%l2
	set	0x563E1E6E,	%l3
	set	0x57A23B75,	%l4
	set	0x15485AF3,	%l5
	set	0x5FC6317E,	%l6
	!# Output registers
	set	-0x16B8,	%o0
	set	0x10FF,	%o1
	set	-0x024A,	%o2
	set	-0x184B,	%o3
	set	0x12C0,	%o4
	set	0x0138,	%o5
	set	0x1F13,	%o6
	set	-0x193E,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0xBDC02D05494A9F57)
	INIT_TH_FP_REG(%l7,%f2,0x882D54E409A81313)
	INIT_TH_FP_REG(%l7,%f4,0x4B62A896F84501EF)
	INIT_TH_FP_REG(%l7,%f6,0x024591A99765DD14)
	INIT_TH_FP_REG(%l7,%f8,0x973680810C5E654C)
	INIT_TH_FP_REG(%l7,%f10,0x6F172A3F35C8DEA3)
	INIT_TH_FP_REG(%l7,%f12,0x550BD6991F22F32F)
	INIT_TH_FP_REG(%l7,%f14,0xC23E230E73B5EA0B)
	INIT_TH_FP_REG(%l7,%f16,0x8B432D4FA91DAF47)
	INIT_TH_FP_REG(%l7,%f18,0xE07D2E4B2229E84A)
	INIT_TH_FP_REG(%l7,%f20,0x82BAC4E828D38A05)
	INIT_TH_FP_REG(%l7,%f22,0x9D595B6BCC62A44F)
	INIT_TH_FP_REG(%l7,%f24,0xD0FD43FC16F917F2)
	INIT_TH_FP_REG(%l7,%f26,0xED4F08CF9CC2465D)
	INIT_TH_FP_REG(%l7,%f28,0xC86ED0FF8793FFE4)
	INIT_TH_FP_REG(%l7,%f30,0x2962878FB08EBDCA)

	!# Execute Main Diag ..

	call	loop_123
	call	loop_124
	call	loop_125
	movcs	%xcc,	0x0B7,	%l4
loop_123:
	nop
	setx	0xEB73353C,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f2
	setx	0x98DCBCBD,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f16
	fmuls	%f16,	%f2,	%f2
loop_124:
	array32	%g6,	%g3,	%i4
loop_125:
	tpos	%icc,	0x4
	movule	%fcc3,	%o2,	%i0
	call	loop_126
	call	loop_127
	alignaddr	%l5,	%i5,	%g5
	call	loop_128
loop_126:
	bpos,a,pt	%icc,	loop_129
loop_127:
	call	loop_130
	call	loop_131
loop_128:
	fmovso	%fcc0,	%f21,	%f26
loop_129:
	call	loop_132
loop_130:
	call	loop_133
loop_131:
	call	loop_134
	call	loop_135
loop_132:
	fnot1s	%f10,	%f17
loop_133:
	fmovrdlz	%o6,	%f8,	%f18
loop_134:
	movrlz	%l1,	0x270,	%l0
loop_135:
	nop
	setx	0xA1E02341,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f26
	setx	0x7D1BACAF,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f11
	fadds	%f11,	%f26,	%f19
	edge32	%o4,	%g4,	%i7
	be	%icc,	loop_136
	movl	%fcc3,	0x15A,	%i2
	fpack32	%f4,	%f6,	%f24
	nop
	fitod	%f8,	%f16
	fdtox	%f16,	%f16
	fxtod	%f16,	%f14
loop_136:
	nop
	setx	0xF17FE8A9,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f17
	setx	0x2EF97646,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f17
	fadds	%f17,	%f17,	%f22
	taddcc	%o5,	0x1DCA,	%o0
	fbule	%fcc1,	loop_137
	call	loop_138
	fbug,pn	%fcc1,	loop_139
	wr	%i1,	%l3,	%set_softint
loop_137:
	fmovso	%fcc0,	%f14,	%f2
loop_138:
	call	loop_140
loop_139:
	fmovsle	%xcc,	%f18,	%f17
	fbl,pn	%fcc2,	loop_141
	fpsub16	%f14,	%f14,	%f0
loop_140:
	edge16	%i6,	%l2,	%o1
	call	loop_142
loop_141:
	movuge	%fcc3,	0x00A,	%o7
	fmovsue	%fcc1,	%f22,	%f11
	movleu	%icc,	0x464,	%g2
loop_142:
	xnorcc	%i3,	0x03BA,	%g1
	call	loop_143
	nop
	set	0x30, %l0
	std	%g6,	[%l7 + %l0]
	nop
	setx	0x85669FB1,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f15
	fsqrts	%f15,	%f31
	fpsub16s	%f14,	%f21,	%f11
loop_143:
	call	loop_144
	call	loop_145
	call	loop_146
	subcc	%o3,	0x188A,	%l4
loop_144:
	wrpr	%l6,	%g6,	%cwp
loop_145:
	brz,pn	%i4,	loop_147
loop_146:
	fmuld8sux16	%f7,	%f31,	%f28
	fsrc1s	%f0,	%f22
	wrpr 	%g0, 	0x1, 	%gl
loop_147:
	call	loop_148
	fmul8sux16	%f14,	%f8,	%f0
	edge32l	%i0,	%g3,	%l5
	set	0x40, %i6
	ldstuba	[%l7 + %i6] 0x04,	%g5
loop_148:
	wrpr	%o6,	0x0D38,	%pil
	fcmple16	%f22,	%f26,	%l1
	sdiv	%l0,	0x056B,	%i5
	tvs	%xcc,	0x2
	for	%f30,	%f8,	%f16
	movcc	%icc,	%g4,	%i7
	call	loop_149
	call	loop_150
	call	loop_151
	fmovso	%fcc3,	%f17,	%f0
loop_149:
	srax	%i2,	0x18,	%o4
loop_150:
	and	%o0,	%o5,	%i1
loop_151:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	andncc	%o1,	0x1A17,	%o7
	mulscc	%g2,	0x0861,	%i3
	wr	%g0,	0x10,	%asi
	lduwa	[%l7 + 0x0C] %asi,	%g1
	bn	%xcc,	loop_152
	fmul8x16	%f17,	%f22,	%f2
	or	%g7,	0x00B7,	%o3
	fnands	%f26,	%f29,	%f23
loop_152:
	fcmped	%fcc1,	%f2,	%f14
	fmovdvs	%icc,	%f0,	%f0
	wr	%g0,	0x89,	%asi
	lda	[%l7 + 0x5C] %asi,	%f5
	fand	%f2,	%f24,	%f2
	nop
	fitos	%f2,	%f7
	fstox	%f7,	%f16
	fxtos	%f16,	%f6
	fbul	%fcc0,	loop_153
	fmovdge	%icc,	%f4,	%f28
	nop
	setx	0xFF06377D,	%l0,	%l6
	st	%l6,	[%l7 + 0x7C]
	ld	[%l7 + 0x7C],	%fsr
	fmovrsgez	%l4,	%f5,	%f21
loop_153:
	fmovdule	%fcc0,	%f6,	%f24
	movne	%fcc1,	%l6,	%i6
	call	loop_154
	brnz,a,pn	%g6,	loop_155
	fpadd32	%f14,	%f4,	%f14
	fmovdvc	%xcc,	%f4,	%f10
loop_154:
	call	loop_156
loop_155:
	movue	%fcc1,	%o2,	%i0
	fmovdul	%fcc0,	%f4,	%f10
	fcmple32	%f6,	%f22,	%g3
loop_156:
	rdpr	%pil,	%l5
	fmovdu	%fcc3,	%f26,	%f12
	call	loop_157
	fmovrse	%i4,	%f2,	%f3
	call	loop_158
	ba,pt	%xcc,	loop_159
loop_157:
	call	loop_160
	fandnot1s	%f6,	%f15,	%f14
loop_158:
	bcs,pn	%icc,	loop_161
loop_159:
	fmovrdgz	%g5,	%f26,	%f18
loop_160:
	fmovda	%fcc0,	%f4,	%f8
	bvc,a,pt	%icc,	loop_162
loop_161:
	call	loop_163
	tn	%icc,	0x1
	rd	%ccr,	%o6
loop_162:
	fmovrslez	%l0,	%f9,	%f4
loop_163:
	fmovsleu	%icc,	%f17,	%f1
	fmuld8ulx16	%f4,	%f1,	%f18
	call	loop_164
	call	loop_165
	rdpr	%wstate,	%l1
	nop
	setx	0x288BD079,	%l0,	%l6
	st	%l6,	[%l7 + 0x40]
	ld	[%l7 + 0x40],	%fsr
loop_164:
	movue	%fcc2,	%i5,	%g4
loop_165:
	alignaddr	%i7,	%o4,	%i2
	edge8l	%o0,	%i1,	%o5
	movvs	%xcc,	0x6DD,	%l3
	nop
	fitod	%f4,	%f8
	fdtoi	%f8,	%f8
	nop
	setx	0x993D2785,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f16
	setx	0x0D965C32,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f7
	fsubs	%f7,	%f16,	%f11
	fzeros	%f9
	movue	%fcc1,	0x37B,	%l2
	call	loop_166
	fbl	%fcc2,	loop_167
	brnz	%o7,	loop_168
	movrgz	%g2,	0x138,	%o1
loop_166:
	fbule,a,pt	%fcc1,	loop_169
loop_167:
	flushw
loop_168:
	call	loop_170
	fone	%f18
loop_169:
	fsrc2	%f2,	%f2
	nop
	setx	0x5918F023B6E79F63,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0xA641AA225D2A5AD6,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	fdivd	%f28,	%f2,	%f14
loop_170:
	call	loop_171
	edge16ln	%g1,	%g7,	%o3
	call	loop_172
	call	loop_173
loop_171:
	udivx	%l4,	0x011D,	%i3
	nop
	fitos	%f6,	%f2
	fstoi	%f2,	%f16
loop_172:
	array8	%i6,	%l6,	%g6
loop_173:
	call	loop_174
	call	loop_175
	wr	%o2,	%g3,	%sys_tick
	fmovrse	%l5,	%f11,	%f3
loop_174:
	call	loop_176
loop_175:
	nop
	setx	0xBBA13AB8,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f30
	setx	0xC66C3B6A,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f8
	fdivs	%f8,	%f30,	%f21
	call	loop_177
	rd	%sys_tick_cmpr,	%i0
loop_176:
	edge8ln	%i4,	%o6,	%g5
	wr	%g0,	0x80,	%asi
	lda	[%l7 + 0x34] %asi,	%f29
loop_177:
	movle	%xcc,	0x3AF,	%l1
	fpadd32s	%f22,	%f18,	%f2
	bvc	%icc,	loop_178
	edge32l	%l0,	%i5,	%g4
	fmovdneg	%icc,	%f10,	%f14
	te	%xcc,	0x3
loop_178:
	tvs	%icc,	0x4
	nop
	setx	0xA4D7D9B895054C5A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x20]
	ldx	[%l7 + 0x20],	%fsr
	fmovdo	%fcc0,	%f10,	%f8
	alignaddr	%i7,	%i2,	%o4
	nop
	set	0x70, %g1
	stx	%o0,	[%l7 + %g1]
	fpadd16	%f14,	%f2,	%f0
	popc	0x02FA,	%o5
	nop
	set	0x58, %o6
	lduw	[%l7 + %o6],	%l3
	fpmerge	%f22,	%f11,	%f12
	call	loop_179
	call	loop_180
	call	loop_181
	fnor	%f8,	%f0,	%f16
loop_179:
	rdpr	%cwp,	%l2
loop_180:
	edge32l	%i1,	%g2,	%o1
loop_181:
	nop
	setx	0x577EA503BBFF4AA2,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0xD926FA5775C247FB,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	fsubd	%f2,	%f30,	%f22
	edge16ln	%g1,	%g7,	%o7
	sdivcc	%o3,	0x12A5,	%l4
	srlx	%i6,	0x00,	%l6
	andncc	%g6,	%o2,	%i3
	nop
	setx	0x20844710,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f19
	setx	0x3522D497,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f19
	fmuls	%f19,	%f19,	%f5
	wr	%l5,	%i0,	%clear_softint
	call	loop_182
	fmovduge	%fcc1,	%f22,	%f28
	lduh	[%l7 + 0x7E],	%i4
	fmovrsgez	%g3,	%f27,	%f11
loop_182:
	fmovrdgez	%o6,	%f20,	%f12
	tn	%xcc,	0x4
	fcmpd	%fcc0,	%f20,	%f10
	addcc	%l1,	0x0A17,	%l0
	call	loop_183
loop_183:
	nop

	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 2:
!
!	Type l   	: 11
!	Type a   	: 12
!	Type x   	: 4
!	Type cti   	: 61
!	Type f   	: 62
!	Type i   	: 50
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
	set	0xF,	%g1
	set	0xC,	%g2
	set	0xF,	%g3
	set	0xE,	%g4
	set	0x7,	%g5
	set	0xD,	%g6
	set	0x1,	%g7
	!# Input registers
	set	-0x1,	%i0
	set	-0x9,	%i1
	set	-0x2,	%i2
	set	-0x2,	%i3
	set	-0x8,	%i4
	set	-0x0,	%i5
	set	-0x6,	%i6
	set	-0xB,	%i7
	!# Local registers
	set	0x5AB931B0,	%l0
	set	0x670949BE,	%l1
	set	0x0CCA8624,	%l2
	set	0x19583D40,	%l3
	set	0x7CC0B5C0,	%l4
	set	0x4D9DDEDC,	%l5
	set	0x70121965,	%l6
	!# Output registers
	set	-0x1956,	%o0
	set	-0x0F68,	%o1
	set	-0x1B9A,	%o2
	set	0x13B0,	%o3
	set	-0x0EC4,	%o4
	set	0x05DA,	%o5
	set	0x0F57,	%o6
	set	0x0C98,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0xBDC02D05494A9F57)
	INIT_TH_FP_REG(%l7,%f2,0x882D54E409A81313)
	INIT_TH_FP_REG(%l7,%f4,0x4B62A896F84501EF)
	INIT_TH_FP_REG(%l7,%f6,0x024591A99765DD14)
	INIT_TH_FP_REG(%l7,%f8,0x973680810C5E654C)
	INIT_TH_FP_REG(%l7,%f10,0x6F172A3F35C8DEA3)
	INIT_TH_FP_REG(%l7,%f12,0x550BD6991F22F32F)
	INIT_TH_FP_REG(%l7,%f14,0xC23E230E73B5EA0B)
	INIT_TH_FP_REG(%l7,%f16,0x8B432D4FA91DAF47)
	INIT_TH_FP_REG(%l7,%f18,0xE07D2E4B2229E84A)
	INIT_TH_FP_REG(%l7,%f20,0x82BAC4E828D38A05)
	INIT_TH_FP_REG(%l7,%f22,0x9D595B6BCC62A44F)
	INIT_TH_FP_REG(%l7,%f24,0xD0FD43FC16F917F2)
	INIT_TH_FP_REG(%l7,%f26,0xED4F08CF9CC2465D)
	INIT_TH_FP_REG(%l7,%f28,0xC86ED0FF8793FFE4)
	INIT_TH_FP_REG(%l7,%f30,0x2962878FB08EBDCA)

	!# Execute Main Diag ..

	rdhpr	%htba,	%g5
	movrgez	%g4,	%i5,	%i7
	move	%icc,	%i2,	%o4
	nop
	setx	0x04C7708567BDB171,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0x421789E89F077EEC,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	fmuld	%f30,	%f26,	%f6
	call	loop_184
	bmask	%o0,	%l3,	%o5
	call	loop_185
	call	loop_186
loop_184:
	fmovda	%icc,	%f12,	%f24
	tge	%xcc,	0x6
loop_185:
	nop
	set	0x70, %g7
	sta	%f26,	[%l7 + %g7] 0x19
loop_186:
	tl	%xcc,	0x3
	rdhpr	%hpstate,	%i1
	fmovsu	%fcc2,	%f21,	%f1
	movrlez	%g2,	%o1,	%g1
	faligndata	%f12,	%f22,	%f22
	fcmpgt32	%f4,	%f2,	%g7
	bvs	%xcc,	loop_187
	pdist	%f14,	%f4,	%f0
	fmul8x16	%f18,	%f24,	%f14
	call	loop_188
loop_187:
	fmovdug	%fcc1,	%f28,	%f22

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xB3A, 	%hsys_tick_cmpr
	fmovsl	%fcc2,	%f23,	%f30
loop_188:
	fblg	%fcc2,	loop_189
	for	%f28,	%f14,	%f24
	movgu	%xcc,	%l4,	%i6
	call	loop_190
loop_189:
	fpsub32	%f0,	%f4,	%f8
	fbn,a	%fcc0,	loop_191
	call	loop_192
loop_190:
	call	loop_193
	rdhpr	%hintp,	%l2
loop_191:
	call	loop_194
loop_192:
	array8	%g6,	%o2,	%l6
loop_193:
	movne	%fcc1,	%l5,	%i3
	fcmpgt32	%f22,	%f8,	%i0
loop_194:
	fandnot1s	%f1,	%f11,	%f21
	wrpr	%g3,	%i4,	%cwp
	call	loop_195
	srl	%o6,	0x16,	%l1
	nop
	setx	0xAA3DAC30C89F140A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0x13F31285A4170157,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fsubd	%f0,	%f12,	%f8
	stx	%g5,	[%l7 + 0x50]
loop_195:
	call	loop_196
	bvc,pt	%xcc,	loop_197
	bvc,a	%xcc,	loop_198
	call	loop_199
loop_196:
	fpadd16	%f0,	%f12,	%f6
loop_197:
	call	loop_200
loop_198:
	movuge	%fcc2,	0x577,	%l0
loop_199:
	orn	%g4,	0x1BE9,	%i7
	fmovdn	%icc,	%f8,	%f30
loop_200:
	add	%i5,	%i2,	%o0
	rdpr	%tba,	%o4
	movrgez	%l3,	%o5,	%g2
	andncc	%o1,	%i1,	%g7
	movrgez	%g1,	%o3,	%o7
	umulcc	%l4,	%i6,	%g6
	nop
	set	0x68, %o0
	ldsw	[%l7 + %o0],	%l2
	bn,pn	%xcc,	loop_201
	tneg	%icc,	0x5
	movu	%fcc3,	%l6,	%o2
	tn	%xcc,	0x5
loop_201:
	fmovsvs	%xcc,	%f24,	%f19
	call	loop_202
	call	loop_203
	fcmpne32	%f4,	%f18,	%i3
	fcmpes	%fcc1,	%f0,	%f14
loop_202:
	add	%l5,	%i0,	%i4
loop_203:
	bshuffle	%f14,	%f2,	%f6
	edge16ln	%o6,	%g3,	%g5
	call	loop_204
	fcmpne16	%f20,	%f30,	%l0
	call	loop_205
	fmovrdne	%l1,	%f0,	%f26
loop_204:
	sir	0x0E8E
	nop
	setx	0xEB04642DFAF4D05D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0xA0A576834D1B9FDB,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	fsubd	%f26,	%f24,	%f30
loop_205:
	sdivx	%i7,	0x0CAE,	%g4
	fnot1s	%f19,	%f28
	mulx	%i5,	%i2,	%o4
	tleu	%xcc,	0x5
	fnegs	%f19,	%f16
	edge32	%o0,	%o5,	%l3
	edge16ln	%o1,	%g2,	%g7
	fpsub16s	%f11,	%f10,	%f16
	call	loop_206
	wr	%g1,	0x02C7,	%ccr
	fmovdcs	%icc,	%f0,	%f2
	fpack16	%f30,	%f8
loop_206:
	call	loop_207
	srax	%o3,	%i1,	%l4
	taddcc	%i6,	0x1252,	%g6
	call	loop_208
loop_207:
	call	loop_209
	orn	%l2,	%l6,	%o2
	call	loop_210
loop_208:
	call	loop_211
loop_209:
	nop
	fitod	%f4,	%f16
	fdtox	%f16,	%f14
	fxtod	%f14,	%f20
	fmul8sux16	%f16,	%f14,	%f2
loop_210:
	fmovdle	%fcc2,	%f18,	%f0
loop_211:
	bmask	%o7,	%l5,	%i3
	flushw
	nop
	fitod	%f6,	%f12
	fdtox	%f12,	%f4
	fmuld8sux16	%f30,	%f2,	%f6
	call	loop_212
	fmovdpos	%icc,	%f26,	%f30
	rdpr	%otherwin,	%i4
	fmovdge	%icc,	%f10,	%f30
loop_212:
	call	loop_213
	orn	%o6,	%i0,	%g3
	call	loop_214
	movvs	%xcc,	%l0,	%g5
loop_213:
	call	loop_215
	fsrc2s	%f10,	%f23
loop_214:
	fcmpeq16	%f12,	%f24,	%l1
	call	loop_216
loop_215:
	brlez,a,pt	%i7,	loop_217
	ldsh	[%l7 + 0x58],	%i5
	fmovde	%fcc1,	%f16,	%f6
loop_216:
	fnot2s	%f31,	%f20
loop_217:
	umulcc	%i2,	0x1ADB,	%g4
	membar	0x4C
	fpadd16	%f18,	%f4,	%f2
	nop
	fitod	%f0,	%f30
	fmovdl	%fcc3,	%f28,	%f10
	fandnot1s	%f17,	%f30,	%f0
	fmovdleu	%xcc,	%f22,	%f30
	fmovsa	%fcc3,	%f20,	%f6
	nop
	setx	0x073C,	%l0,	%o0
	udivx	%o4,	%o0,	%o5
	fxors	%f18,	%f16,	%f25
	fmul8x16al	%f25,	%f9,	%f16
	andn	%o1,	0x02DC,	%l3
	rdpr	%otherwin,	%g7
	movneg	%icc,	0x54C,	%g2
	call	loop_218
	nop
	fitod	%f4,	%f28
	fdtox	%f28,	%f12
	fnands	%f23,	%f25,	%f15
	fpadd32s	%f2,	%f23,	%f28
loop_218:
	movue	%fcc2,	0x1C3,	%g1
	umul	%i1,	0x00D2,	%o3
	fmovrse	%l4,	%f20,	%f23
	call	loop_219
	fbl	%fcc0,	loop_220
	edge8l	%i6,	%g6,	%l2
	call	loop_221
loop_219:
	nop
	fitod	%f20,	%f10
loop_220:
	fmovrsne	%o2,	%f29,	%f13
	membar	0x5C
loop_221:
	fmovrdlz	%l6,	%f26,	%f30
	fmovdvs	%xcc,	%f12,	%f22
	ldx	[%l7 + 0x58],	%o7
	call	loop_222
	fmovdcs	%xcc,	%f22,	%f14
	call	loop_223
	fands	%f22,	%f28,	%f31
loop_222:
	call	loop_224
	call	loop_225
loop_223:
	fmovsa	%fcc3,	%f21,	%f29
	call	loop_226
loop_224:
	smulcc	%i3,	%l5,	%i4
loop_225:
	fmovdug	%fcc1,	%f26,	%f30
	sethi	0x1F02,	%o6
loop_226:
	fmovrsgez	%i0,	%f26,	%f10
	call	loop_227
	sub	%g3,	0x02E9,	%l0
	be	%xcc,	loop_228
	fnegd	%f20,	%f8
loop_227:
	movneg	%xcc,	%l1,	%g5
	sethi	0x04DE,	%i7
loop_228:
	fmovrdgz	%i5,	%f6,	%f0
	call	loop_229
	fmovsl	%fcc1,	%f13,	%f0
	fmovdug	%fcc3,	%f22,	%f16
	call	loop_230
loop_229:
	movre	%i2,	%o4,	%g4
	movvc	%icc,	0x386,	%o0
	fone	%f2
loop_230:
	call	loop_231
	nop
	setx	0xD7EB8714F6D5B6E1,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0xD0DB5068,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	fsmuld	%f6,	%f8,	%f18
	call	loop_232
	fnot1s	%f13,	%f8
loop_231:
	nop
	set	0x70, %l3
	stx	%fsr,	[%l7 + %l3]
	tvc	%icc,	0x5
loop_232:
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	fmovdvc	%icc,	%f30,	%f2
	wr	%g0,	0x89,	%asi
	ldstuba	[%l7 + 0x68] %asi,	%o5
	call	loop_233
	fmovdug	%fcc1,	%f4,	%f0
	call	loop_234
	brz	%o1,	loop_235
loop_233:
	fmovsa	%fcc3,	%f3,	%f1
	wr	%g0,	0x0c,	%asi
	ldstuba	[%l7 + 0x10] %asi,	%g7
loop_234:
	and	%l3,	%g1,	%i1
loop_235:
	tne	%xcc,	0x5
	call	loop_236
	xnor	%o3,	0x1313,	%g2
	call	loop_237
loop_236:
	nop

loop_237:
	nop

	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 3:
!
!	Type l   	: 8
!	Type a   	: 9
!	Type x   	: 3
!	Type cti   	: 54
!	Type f   	: 70
!	Type i   	: 56
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
	set	0xC,	%g1
	set	0x1,	%g2
	set	0x7,	%g3
	set	0x1,	%g4
	set	0x9,	%g5
	set	0xD,	%g6
	set	0xC,	%g7
	!# Input registers
	set	-0xA,	%i0
	set	-0xB,	%i1
	set	-0x6,	%i2
	set	-0x5,	%i3
	set	-0x5,	%i4
	set	-0x6,	%i5
	set	-0x4,	%i6
	set	-0x6,	%i7
	!# Local registers
	set	0x6339DFF3,	%l0
	set	0x24CCC389,	%l1
	set	0x76C859E2,	%l2
	set	0x37135489,	%l3
	set	0x41CF9892,	%l4
	set	0x6FA1B3B7,	%l5
	set	0x48BD4C79,	%l6
	!# Output registers
	set	0x1DE9,	%o0
	set	0x1723,	%o1
	set	-0x0DE8,	%o2
	set	-0x03B3,	%o3
	set	0x1E88,	%o4
	set	0x19BE,	%o5
	set	-0x1E87,	%o6
	set	0x083E,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0xBDC02D05494A9F57)
	INIT_TH_FP_REG(%l7,%f2,0x882D54E409A81313)
	INIT_TH_FP_REG(%l7,%f4,0x4B62A896F84501EF)
	INIT_TH_FP_REG(%l7,%f6,0x024591A99765DD14)
	INIT_TH_FP_REG(%l7,%f8,0x973680810C5E654C)
	INIT_TH_FP_REG(%l7,%f10,0x6F172A3F35C8DEA3)
	INIT_TH_FP_REG(%l7,%f12,0x550BD6991F22F32F)
	INIT_TH_FP_REG(%l7,%f14,0xC23E230E73B5EA0B)
	INIT_TH_FP_REG(%l7,%f16,0x8B432D4FA91DAF47)
	INIT_TH_FP_REG(%l7,%f18,0xE07D2E4B2229E84A)
	INIT_TH_FP_REG(%l7,%f20,0x82BAC4E828D38A05)
	INIT_TH_FP_REG(%l7,%f22,0x9D595B6BCC62A44F)
	INIT_TH_FP_REG(%l7,%f24,0xD0FD43FC16F917F2)
	INIT_TH_FP_REG(%l7,%f26,0xED4F08CF9CC2465D)
	INIT_TH_FP_REG(%l7,%f28,0xC86ED0FF8793FFE4)
	INIT_TH_FP_REG(%l7,%f30,0x2962878FB08EBDCA)

	!# Execute Main Diag ..

	call	loop_238
	nop
	setx	0x03EF,	%l0,	%i6
	sdivcc	%l4,	%i6,	%g6
	fzeros	%f16
	call	loop_239
loop_238:
	rdhpr	%ver,	%l2
	call	loop_240
	movuge	%fcc3,	%o2,	%l6
loop_239:
	movcs	%icc,	0x332,	%o7
	call	loop_241
loop_240:
	call	loop_242
	rdhpr	%hintp,	%l5
	nop
	set	0x79, %l2
	ldub	[%l7 + %l2],	%i3
loop_241:
	call	loop_243
loop_242:
	call	loop_244
	fmovdne	%fcc1,	%f20,	%f28
	nop
	set	0x32, %l6
	sth	%o6,	[%l7 + %l6]
loop_243:
	fmovrdgz	%i0,	%f10,	%f14
loop_244:
	fnot1s	%f5,	%f13
	bne,pn	%icc,	loop_245
	call	loop_246
	movcs	%icc,	%i4,	%l0
	call	loop_247
loop_245:
	call	loop_248
loop_246:
	nop
	setx	0x3F43B0215B9EABFF,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0x172FF93525A2D480,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	fdivd	%f12,	%f28,	%f2
	call	loop_249
loop_247:
	fxnors	%f9,	%f11,	%f7
loop_248:
	nop
	set	0x70, %o7
	stda	%g2,	[%l7 + %o7] 0x2f
	membar	#Sync
loop_249:
	call	loop_250
	call	loop_251
	fmovdcc	%icc,	%f26,	%f0
	edge8	%l1,	%i7,	%g5
loop_250:
	call	loop_252
loop_251:
	fmovsne	%icc,	%f5,	%f13
	call	loop_253
	edge32	%i2,	%i5,	%g4
loop_252:
	fmovsge	%icc,	%f3,	%f27
	xnorcc	%o4,	%o0,	%o1
loop_253:
	fcmple16	%f26,	%f8,	%o5
	call	loop_254
	fzeros	%f15
	bcc	%xcc,	loop_255
	fsrc1	%f8,	%f2
loop_254:
	call	loop_256
	alignaddr	%g7,	%l3,	%i1
loop_255:
	call	loop_257
	bcc,pn	%xcc,	loop_258
loop_256:
	rdhpr	%hintp,	%g1
	bmask	%o3,	%l4,	%g2
loop_257:
	call	loop_259
loop_258:
	fpsub32	%f8,	%f0,	%f20
	wr	%i6,	%l2,	%softint
	call	loop_260
loop_259:
	bgu,pn	%icc,	loop_261
	edge16ln	%o2,	%l6,	%g6
	wr	%l5,	0x0FB9,	%set_softint
loop_260:
	call	loop_262
loop_261:
	fmovsne	%xcc,	%f9,	%f15
	call	loop_263
	fmovsneg	%xcc,	%f9,	%f18
loop_262:
	call	loop_264
	rdhpr	%ver,	%o7
loop_263:
	faligndata	%f30,	%f26,	%f30
	wrpr	%i3,	%i0,	%pil
loop_264:
	taddcc	%i4,	0x0E2C,	%l0
	subcc	%g3,	%l1,	%o6
	xorcc	%g5,	0x097C,	%i2
	wrpr	%i7,	0x0D95,	%tick
	subcc	%i5,	0x0FC9,	%o4
	fmovsul	%fcc1,	%f18,	%f1
	call	loop_265
	nop
	fitos	%f11,	%f22
	fstox	%f22,	%f8
	call	loop_266
	call	loop_267
loop_265:
	move	%icc,	%o0,	%g4
	call	loop_268
loop_266:
	fmovs	%f14,	%f9
loop_267:
	andncc	%o5,	0x02CA,	%g7
	edge8ln	%l3,	%o1,	%i1
loop_268:
	fmovsne	%icc,	%f20,	%f29
	fone	%f28
	edge8n	%g1,	%o3,	%l4
	movul	%fcc1,	%i6,	%l2
	call	loop_269
	fmovrdne	%o2,	%f18,	%f26

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	call	loop_270
loop_269:
	bg,a	%icc,	loop_271
	udivx	%l6,	0x1B7A,	%l5
	tgu	%xcc,	0x4
loop_270:
	nop
	setx	0x775FD88C3EFB2CE2,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	fsqrtd	%f16,	%f28
loop_271:
	taddcctv	%o7,	0x07BA,	%i3
	nop
	setx	0x0E1D8E94C49BAAC9,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0x8803C81908C3DD1E,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	faddd	%f4,	%f30,	%f18
	fmovsug	%fcc1,	%f11,	%f8
	call	loop_272
	addcc	%g6,	0x1FD8,	%i4
	movle	%fcc2,	0x5AA,	%i0
	fmovsue	%fcc1,	%f3,	%f28
loop_272:
	call	loop_273
	nop
	fitod	%f18,	%f24
	andn	%g3,	0x0416,	%l1
	rd	%pc,	%l0
loop_273:
	nop
	fitod	%f2,	%f18
	fdtox	%f18,	%f18
	call	loop_274
	call	loop_275
	nop
	fitod	%f12,	%f4
	fdtoi	%f4,	%f2
	udiv	%g5,	0x10BE,	%i2
loop_274:
	nop
	setx	0xB24FB5ADA15C4422,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0xB7A18B029694E950,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	faddd	%f6,	%f16,	%f28
loop_275:
	call	loop_276
	fmovrslez	%o6,	%f10,	%f20
	nop
	setx	0x8247C221,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f4
	setx	0xBC26BC76,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f15
	fsubs	%f15,	%f4,	%f10
	fnot1	%f28,	%f16
loop_276:
	rdhpr	%hintp,	%i5
	nop
	setx loop_277, %l0, %l1
	jmpl %l1, %i7
	fmovso	%fcc1,	%f23,	%f31
	sth	%o4,	[%l7 + 0x5C]
	fmovrdlz	%g4,	%f26,	%f20
loop_277:
	call	loop_278
	fexpand	%f5,	%f4
	call	loop_279
	fmovdn	%fcc3,	%f2,	%f8
loop_278:
	nop
	fitod	%f10,	%f20
	fdtos	%f20,	%f29
	add	%o0,	0x02CA,	%o5
loop_279:
	fpack32	%f2,	%f0,	%f8
	fmovso	%fcc1,	%f26,	%f12
	movle	%fcc3,	0x30D,	%g7
	call	loop_280
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	movvs	%xcc,	%l3,	%i1
	fsrc1	%f4,	%f6
loop_280:
	fmovsle	%fcc2,	%f29,	%f5
	andcc	%g1,	0x0E77,	%o3
	call	loop_281
	tl	%xcc,	0x5
	call	loop_282
	wr	%o1,	0x0BB5,	%softint
loop_281:
	edge8l	%l4,	%l2,	%i6
	nop
	set	0x70, %g2
	lduh	[%l7 + %g2],	%g2
loop_282:
	movrne	%o2,	%l5,	%l6
	call	loop_283
	tge	%xcc,	0x3
	call	loop_284
	call	loop_285
loop_283:
	call	loop_286
	fmul8ulx16	%f8,	%f2,	%f16
loop_284:
	fmovrsne	%i3,	%f9,	%f21
loop_285:
	fmovrse	%o7,	%f18,	%f24
loop_286:
	call	loop_287
	movu	%fcc3,	0x6C3,	%g6
	brlez,pt	%i4,	loop_288
	brz	%i0,	loop_289
loop_287:
	call	loop_290
	rdhpr	%hpstate,	%g3
loop_288:
	xorcc	%l1,	0x107D,	%l0
loop_289:
	sra	%g5,	%i2,	%i5
loop_290:
	fnegs	%f29,	%f30
	bmask	%i7,	%o4,	%o6
	set	0x20, %l4
	lda	[%l7 + %l4] 0x88,	%f27
	array8	%g4,	%o5,	%g7
	movneg	%icc,	0x1B8,	%l3
	nop
	fitod	%f2,	%f0
	fdtos	%f0,	%f31
	nop
	fitos	%f1,	%f18
	fstoi	%f18,	%f18
	srax	%o0,	%g1,	%i1
	fandnot1	%f10,	%f10,	%f14
	movug	%fcc1,	0x4E2,	%o1
	nop
	set	0x14, %g4
	flush	%l7 + %g4
	alignaddrl	%l4,	%o3,	%l2
	fmul8x16	%f27,	%f4,	%f14
	sdiv	%g2,	0x189C,	%o2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	call	loop_291
	fmovdgu	%icc,	%f0,	%f26
	flushw
	tg	%xcc,	0x7
loop_291:
	fandnot1s	%f4,	%f0,	%f0
	call	loop_292
	fsrc1	%f28,	%f24
	rd	%pc,	%i3
	call	loop_293
loop_292:
	tcs	%xcc,	0x4
	call	loop_294
	fandnot1	%f14,	%f30,	%f2
loop_293:
	fmovsvc	%xcc,	%f7,	%f2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_294:
	fmovdu	%fcc2,	%f24,	%f26
	tsubcctv	%o7,	%i4,	%i0
	nop
	setx	0x1FE2,	%l0,	%l1
	sdiv	%g6,	%l1,	%l0
	rdhpr	%hsys_tick_cmpr,	%g3
	bl	%xcc,	loop_295
	fpsub32s	%f18,	%f10,	%f26
	movgu	%icc,	%g5,	%i5
	xorcc	%i2,	%o4,	%o6
loop_295:
	rdpr	%pil,	%g4
	addc	%i7,	0x08EE,	%o5
	fmovsn	%fcc0,	%f5,	%f0
	call	loop_296
	call	loop_297
	fmovdpos	%icc,	%f8,	%f0
	call	loop_298
loop_296:
	nop

loop_297:
	nop

loop_298:
	nop

	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 4:
!
!	Type l   	: 7
!	Type a   	: 18
!	Type x   	: 2
!	Type cti   	: 61
!	Type f   	: 59
!	Type i   	: 53
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
	set	0x6,	%g1
	set	0xA,	%g2
	set	0x5,	%g3
	set	0xD,	%g4
	set	0x4,	%g5
	set	0xB,	%g6
	set	0x6,	%g7
	!# Input registers
	set	-0x0,	%i0
	set	-0xD,	%i1
	set	-0xC,	%i2
	set	-0x5,	%i3
	set	-0x3,	%i4
	set	-0x5,	%i5
	set	-0x4,	%i6
	set	-0xA,	%i7
	!# Local registers
	set	0x5F4BE024,	%l0
	set	0x45B831B2,	%l1
	set	0x0DFFF22F,	%l2
	set	0x4B143B14,	%l3
	set	0x6B5A6479,	%l4
	set	0x154289B0,	%l5
	set	0x1C8B6792,	%l6
	!# Output registers
	set	-0x158D,	%o0
	set	-0x0345,	%o1
	set	-0x047A,	%o2
	set	-0x1E23,	%o3
	set	-0x0B38,	%o4
	set	0x14F6,	%o5
	set	-0x1D96,	%o6
	set	-0x1AF2,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0xBDC02D05494A9F57)
	INIT_TH_FP_REG(%l7,%f2,0x882D54E409A81313)
	INIT_TH_FP_REG(%l7,%f4,0x4B62A896F84501EF)
	INIT_TH_FP_REG(%l7,%f6,0x024591A99765DD14)
	INIT_TH_FP_REG(%l7,%f8,0x973680810C5E654C)
	INIT_TH_FP_REG(%l7,%f10,0x6F172A3F35C8DEA3)
	INIT_TH_FP_REG(%l7,%f12,0x550BD6991F22F32F)
	INIT_TH_FP_REG(%l7,%f14,0xC23E230E73B5EA0B)
	INIT_TH_FP_REG(%l7,%f16,0x8B432D4FA91DAF47)
	INIT_TH_FP_REG(%l7,%f18,0xE07D2E4B2229E84A)
	INIT_TH_FP_REG(%l7,%f20,0x82BAC4E828D38A05)
	INIT_TH_FP_REG(%l7,%f22,0x9D595B6BCC62A44F)
	INIT_TH_FP_REG(%l7,%f24,0xD0FD43FC16F917F2)
	INIT_TH_FP_REG(%l7,%f26,0xED4F08CF9CC2465D)
	INIT_TH_FP_REG(%l7,%f28,0xC86ED0FF8793FFE4)
	INIT_TH_FP_REG(%l7,%f30,0x2962878FB08EBDCA)

	!# Execute Main Diag ..

	movrgez	%g7,	%o0,	%l3
	call	loop_299
	faligndata	%f6,	%f26,	%f20
	call	loop_300
	for	%f16,	%f4,	%f28
loop_299:
	call	loop_301
	fmovdl	%xcc,	%f26,	%f22
loop_300:
	fsrc2s	%f2,	%f31
	fmovdcs	%xcc,	%f16,	%f18
loop_301:
	xnor	%g1,	%o1,	%l4
	call	loop_302
	call	loop_303
	fbl,pn	%fcc1,	loop_304
	fandnot1	%f0,	%f8,	%f10
loop_302:
	call	loop_305
loop_303:
	wr	%i1,	%l2,	%y
loop_304:
	sir	0x1E84
	edge32	%g2,	%o2,	%i6
loop_305:
	nop
	setx	0x54678C9B,	%l0,	%l6
	st	%l6,	[%l7 + 0x6C]
	ld	[%l7 + 0x6C],	%fsr
	call	loop_306
	alignaddrl	%l5,	%o3,	%i3
	edge8l	%l6,	%o7,	%i4
	call	loop_307
loop_306:
	call	loop_308
	fmovdul	%fcc3,	%f30,	%f14
	call	loop_309
loop_307:
	nop
	setx	0x0FF1,	%l0,	%l1
	udiv	%i0,	%l1,	%l0
loop_308:
	nop
	setx	loop_310,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x001200001401,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	faligndata	%f8,	%f24,	%f20
loop_309:
	ldd	[%l7 + 0x10],	%g2
	xorcc	%g6,	%i5,	%g5
loop_310:
	fcmps	%fcc2,	%f28,	%f0
	call	loop_311
	fbug,pn	%fcc0,	loop_312
	call	loop_313
	tgu	%xcc,	0x2
loop_311:
	fandnot2s	%f1,	%f30,	%f19
loop_312:
	movu	%fcc3,	%o4,	%i2
loop_313:
	fcmped	%fcc0,	%f16,	%f18
	fmovrsgez	%o6,	%f15,	%f29
	brz	%i7,	loop_314
	fmovsne	%fcc2,	%f23,	%f1
	call	loop_315
	fands	%f10,	%f25,	%f0
loop_314:
	call	loop_316
	movrlz	%g4,	0x2CF,	%o5
loop_315:
	rd	%pc,	%o0
	wr	%g0,	0x04,	%asi
	lda	[%l7 + 0x50] %asi,	%f10
loop_316:
	addccc	%g7,	0x1168,	%l3
	movcs	%xcc,	0x11E,	%g1
	fnot1	%f28,	%f30
	srlx	%o1,	%l4,	%l2
	set	0x64, %i5
	ldswa	[%l7 + %i5] 0x89,	%g2
	fcmped	%fcc2,	%f8,	%f24
	tl	%icc,	0x4
	fmovdcs	%xcc,	%f28,	%f2
	popc	0x1944,	%o2
	call	loop_317
	fbu	%fcc3,	loop_318
	fcmpeq32	%f2,	%f2,	%i6
	call	loop_319
loop_317:
	fpsub16s	%f19,	%f23,	%f16
loop_318:
	fbug,a,pn	%fcc0,	loop_320
	fabss	%f25,	%f19
loop_319:
	orn	%l5,	%o3,	%i3
	tn	%icc,	0x2
loop_320:
	nop
	setx	loop_321,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x001100001404,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	tvs	%icc,	0x4
	rd	%ccr,	%i1
	bvc,a,pn	%icc,	loop_322
loop_321:
	tsubcctv	%l6,	%o7,	%i4
	sub	%i0,	0x1E12,	%l0
	smulcc	%g3,	%g6,	%i5
loop_322:
	call	loop_323
	prefetch	[%l7 + 0x08],	 2
	fmovscs	%xcc,	%f25,	%f14
	fbue,a,pn	%fcc0,	loop_324
loop_323:
	rdpr	%otherwin,	%g5
	rd	%y,	%l1
	fors	%f15,	%f11,	%f15
loop_324:
	call	loop_325
	call	loop_326
	call	loop_327
	call	loop_328
loop_325:
	call	loop_329
loop_326:
	movrne	%i2,	0x0B5,	%o6
loop_327:
	fpackfix	%f12,	%f3
loop_328:
	wrpr	%o4,	0x1DD7,	%cwp
loop_329:
	call	loop_330
	call	loop_331
	fpack32	%f18,	%f14,	%f12
	fmovdvc	%xcc,	%f14,	%f0
loop_330:
	mulscc	%i7,	%g4,	%o0
loop_331:
	addc	%o5,	%l3,	%g7
	fmovdgu	%xcc,	%f22,	%f22
	tsubcc	%g1,	%l4,	%o1
	sub	%l2,	%o2,	%i6
	call	loop_332
	nop
	setx	0x91FD30E5DA6A7AFA,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0xFF311C718F4B0582,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	fmuld	%f8,	%f8,	%f30
	addcc	%g2,	%l5,	%i3
	movge	%fcc1,	0x05A,	%i1
loop_332:
	fba,a,pt	%fcc0,	loop_333
	bg,a	%xcc,	loop_334
	nop
	set	0x48, %o3
	ldx	[%l7 + %o3],	%l6
	for	%f30,	%f28,	%f24
loop_333:
	fcmpes	%fcc3,	%f30,	%f25
loop_334:
	fbule	%fcc1,	loop_335
	call	loop_336
	call	loop_337
	fbl,pt	%fcc1,	loop_338
loop_335:
	andn	%o7,	0x1FFD,	%i4
loop_336:
	fbug,a,pt	%fcc2,	loop_339
loop_337:
	call	loop_340
loop_338:
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	call	loop_341
loop_339:
	call	loop_342
loop_340:
	fmovrslez	%o3,	%f25,	%f25
	subccc	%l0,	0x1D47,	%g3
loop_341:
	call	loop_343
loop_342:
	fmovda	%fcc0,	%f6,	%f14
	call	loop_344
	fmovscc	%icc,	%f4,	%f26
loop_343:
	call	loop_345
	rd	%sys_tick_cmpr,	%g6
loop_344:
	tneg	%icc,	0x3
	fmovdpos	%xcc,	%f10,	%f26
loop_345:
	fmovrslez	%i5,	%f6,	%f4
	nop
	setx	0xED1D93F4,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f5
	fsqrts	%f5,	%f1
	fabsd	%f4,	%f18
	call	loop_346
	fmovduge	%fcc3,	%f24,	%f28

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x38E, 	%hsys_tick_cmpr
	fpadd32s	%f12,	%f1,	%f24
loop_346:
	brlez	%g5,	loop_347
	xnorcc	%i2,	%o6,	%o4
	and	%l1,	0x1383,	%i7
	fpsub32	%f6,	%f10,	%f14
loop_347:
	call	loop_348
	tge	%xcc,	0x2
	wrpr	%g4,	%o5,	%cwp
	sub	%o0,	0x06C5,	%l3
loop_348:
	popc	0x07D0,	%g7
	fmovdo	%fcc2,	%f30,	%f10
	fpadd32	%f16,	%f22,	%f0
	tvc	%icc,	0x5
	movle	%xcc,	0x319,	%l4
	call	loop_349
	stb	%o1,	[%l7 + 0x59]
	nop
	fitod	%f10,	%f28
	fdtox	%f28,	%f8
	call	loop_350
loop_349:
	call	loop_351
	alignaddrl	%g1,	%o2,	%l2
	fmovdul	%fcc0,	%f20,	%f0
loop_350:
	nop
	setx	0xB17833C7CC6B41DB,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0x475DA5FB4F656B60,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	fdivd	%f10,	%f2,	%f12
loop_351:
	nop
	setx	0x69B1CACB,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f22
	setx	0x29F7555C,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f16
	fmuls	%f16,	%f22,	%f18
	sllx	%g2,	%i6,	%l5
	call	loop_352
	fbug	%fcc3,	loop_353
	fmovrdlz	%i1,	%f22,	%f28
	call	loop_354
loop_352:
	and	%l6,	%o7,	%i3
loop_353:
	sra	%i4,	0x19,	%l0
	fnot1	%f28,	%f14
loop_354:
	edge16l	%o3,	%g6,	%i5
	movne	%fcc2,	%i0,	%g3
	call	loop_355
	call	loop_356
	rd	%softint,	%i2
	wr	%g5,	%o6,	%sys_tick
loop_355:
	fpadd16s	%f15,	%f24,	%f0
loop_356:
	and	%l1,	%i7,	%o4
	tsubcc	%o5,	0x0B47,	%g4
	fsrc1	%f18,	%f30
	smul	%l3,	%o0,	%l4
	movug	%fcc2,	%o1,	%g1
	fmovrsgez	%g7,	%f12,	%f15
	fmovsleu	%xcc,	%f25,	%f1
	xnor	%o2,	0x0B71,	%l2
	fcmped	%fcc2,	%f12,	%f0
	nop
	setx	0xD602A52F74060637,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0xCED6088A1021D0C0,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	fmuld	%f24,	%f28,	%f18
	movneg	%xcc,	0x2D6,	%g2
	fmovrslz	%i6,	%f31,	%f6
	fxor	%f20,	%f26,	%f26
	tcs	%icc,	0x3
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	fmul8sux16	%f14,	%f0,	%f10
	fmovdleu	%xcc,	%f30,	%f6
	wrpr	%i1,	0x1477,	%pil
	tg	%xcc,	0x5
	call	loop_357
	tsubcc	%l6,	%o7,	%i3
	umulcc	%i4,	0x1199,	%l0
	tsubcc	%l5,	%o3,	%g6
loop_357:
	fmovslg	%fcc3,	%f31,	%f23
	xor	%i5,	0x0AAB,	%i0
	for	%f24,	%f22,	%f14
	call	loop_358
	or	%i2,	%g3,	%g5
loop_358:
	nop

	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 5:
!
!	Type l   	: 7
!	Type a   	: 12
!	Type x   	: 2
!	Type cti   	: 60
!	Type f   	: 59
!	Type i   	: 60
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
	set	0x0,	%g2
	set	0x5,	%g3
	set	0x9,	%g4
	set	0x9,	%g5
	set	0x0,	%g6
	set	0xF,	%g7
	!# Input registers
	set	-0x1,	%i0
	set	-0x5,	%i1
	set	-0x0,	%i2
	set	-0xF,	%i3
	set	-0x0,	%i4
	set	-0x9,	%i5
	set	-0x8,	%i6
	set	-0xF,	%i7
	!# Local registers
	set	0x4E47A60C,	%l0
	set	0x046059D9,	%l1
	set	0x0E7ECDEF,	%l2
	set	0x0469077E,	%l3
	set	0x7B498AA8,	%l4
	set	0x40FDB0D0,	%l5
	set	0x027B3E84,	%l6
	!# Output registers
	set	-0x1EBF,	%o0
	set	-0x1824,	%o1
	set	0x07C8,	%o2
	set	0x0D48,	%o3
	set	-0x0506,	%o4
	set	0x032E,	%o5
	set	-0x0C17,	%o6
	set	0x1628,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0xBDC02D05494A9F57)
	INIT_TH_FP_REG(%l7,%f2,0x882D54E409A81313)
	INIT_TH_FP_REG(%l7,%f4,0x4B62A896F84501EF)
	INIT_TH_FP_REG(%l7,%f6,0x024591A99765DD14)
	INIT_TH_FP_REG(%l7,%f8,0x973680810C5E654C)
	INIT_TH_FP_REG(%l7,%f10,0x6F172A3F35C8DEA3)
	INIT_TH_FP_REG(%l7,%f12,0x550BD6991F22F32F)
	INIT_TH_FP_REG(%l7,%f14,0xC23E230E73B5EA0B)
	INIT_TH_FP_REG(%l7,%f16,0x8B432D4FA91DAF47)
	INIT_TH_FP_REG(%l7,%f18,0xE07D2E4B2229E84A)
	INIT_TH_FP_REG(%l7,%f20,0x82BAC4E828D38A05)
	INIT_TH_FP_REG(%l7,%f22,0x9D595B6BCC62A44F)
	INIT_TH_FP_REG(%l7,%f24,0xD0FD43FC16F917F2)
	INIT_TH_FP_REG(%l7,%f26,0xED4F08CF9CC2465D)
	INIT_TH_FP_REG(%l7,%f28,0xC86ED0FF8793FFE4)
	INIT_TH_FP_REG(%l7,%f30,0x2962878FB08EBDCA)

	!# Execute Main Diag ..

	fcmpes	%fcc1,	%f0,	%f18
	call	loop_359
	fxors	%f12,	%f4,	%f11
	call	loop_360
	call	loop_361
loop_359:
	fmovdl	%xcc,	%f8,	%f6
	popc	%o6,	%i7
loop_360:
	fmovdne	%xcc,	%f8,	%f22
loop_361:
	rd	%pc,	%o4
	tpos	%icc,	0x1
	mova	%fcc0,	0x235,	%l1
	fpsub32s	%f2,	%f24,	%f22
	call	loop_362
	sra	%o5,	%g4,	%l3
	fsrc2s	%f27,	%f3
	fmovdvc	%xcc,	%f4,	%f2
loop_362:
	subcc	%o0,	%o1,	%l4
	movo	%fcc3,	0x04E,	%g1
	fnor	%f16,	%f20,	%f2
	wrpr	%o2,	%g7,	%cwp
	fba,pn	%fcc2,	loop_363
	fmovrdlz	%l2,	%f24,	%f18
	rd	%sys_tick_cmpr,	%i6
	call	loop_364
loop_363:
	fmovsvs	%xcc,	%f16,	%f18
	edge16n	%g2,	%i1,	%o7
	fmovsug	%fcc0,	%f23,	%f10
loop_364:
	ldd	[%l7 + 0x20],	%i2
	fmovrdgez	%l6,	%f10,	%f12
	wr	%i4,	0x1193,	%y
	fmovdu	%fcc1,	%f26,	%f6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	bpos	%icc,	loop_365
	tcs	%xcc,	0x2
	nop
	fitod	%f10,	%f4
	fdtos	%f4,	%f19
	nop
	set	0x7A, %i0
	sth	%g6,	[%l7 + %i0]
loop_365:
	rd	%y,	%i5
	call	loop_366
	rdhpr	%hintp,	%i0
	ldd	[%l7 + 0x40],	%f2
	fnegs	%f0,	%f31
loop_366:
	call	loop_367
	call	loop_368
	nop
	set	0x78, %g6
	lduw	[%l7 + %g6],	%l0
	nop
	setx	0xE001AAA3528C45AA,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	fsqrtd	%f26,	%f12
loop_367:
	fornot1	%f4,	%f16,	%f8
loop_368:
	subcc	%g3,	%i2,	%g5
	tsubcc	%i7,	%o6,	%o4
	fcmpgt16	%f14,	%f14,	%o5
	call	loop_369
	call	loop_370
	fmuld8ulx16	%f27,	%f14,	%f8
	tcs	%xcc,	0x2
loop_369:
	smul	%l1,	%l3,	%o0
loop_370:
	call	loop_371
	fcmpeq32	%f4,	%f16,	%o1
	andcc	%g4,	%g1,	%o2
	fsrc2s	%f16,	%f11
loop_371:
	rdhpr	%hsys_tick_cmpr,	%g7
	call	loop_372
	nop
	fitos	%f9,	%f12
	fstoi	%f12,	%f10
	ldsw	[%l7 + 0x14],	%l2
	srlx	%i6,	%g2,	%i1
loop_372:
	umulcc	%o7,	0x1B3C,	%l4
	call	loop_373
	sllx	%i3,	0x0E,	%l6
	edge16ln	%l5,	%o3,	%i4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_373:
	fandnot2	%f2,	%f28,	%f20
	bleu,a	%xcc,	loop_374
	fornot1	%f14,	%f8,	%f22
	for	%f2,	%f26,	%f20
	nop
	setx	0x03B64738F138A091,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0xFDD4E78A,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	fsmuld	%f16,	%f24,	%f0
loop_374:
	fmovrse	%i0,	%f20,	%f6
	call	loop_375
	rd	%asi,	%l0
	addccc	%i2,	%g3,	%g5
	bcs,pt	%icc,	loop_376
loop_375:
	fmovrdgz	%i7,	%f20,	%f16
	call	loop_377
	movneg	%xcc,	0x706,	%o4
loop_376:
	fbuge,a,pt	%fcc3,	loop_378
	fnot2s	%f17,	%f15
loop_377:
	call	loop_379
	tge	%xcc,	0x2
loop_378:
	nop
	setx	0x5D9DC5E5,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f27
	setx	0x9B433AFB,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f10
	fmuls	%f10,	%f27,	%f11
	fmovsle	%fcc0,	%f25,	%f11
loop_379:
	edge16ln	%o5,	%l1,	%o6
	tle	%xcc,	0x6
	movg	%fcc2,	0x4F8,	%o0
	call	loop_380
	call	loop_381
	bpos,a	%icc,	loop_382
	addcc	%o1,	%g4,	%l3
loop_380:
	fmul8x16	%f27,	%f26,	%f14
loop_381:
	tpos	%xcc,	0x3
loop_382:
	fmovsvc	%xcc,	%f8,	%f24
	call	loop_383
	call	loop_384
	fnegd	%f30,	%f4
	subc	%g1,	0x086F,	%o2
loop_383:
	wrpr	%l2,	0x0C40,	%pil
loop_384:
	call	loop_385
	fmovrdne	%i6,	%f14,	%f18
	call	loop_386
	movge	%xcc,	%g2,	%g7
loop_385:
	call	loop_387
	call	loop_388
loop_386:
	call	loop_389
	fmovdcs	%xcc,	%f2,	%f26
loop_387:
	fsrc1	%f10,	%f2
loop_388:
	tsubcctv	%o7,	%l4,	%i3
loop_389:
	fsrc2s	%f14,	%f17
	call	loop_390
	edge8	%l6,	%i1,	%o3
	nop
	setx loop_391, %l0, %l1
	jmpl %l1, %i4
	nop
	setx	0x7C57CBA22C81199A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0xBE35013B1DCFE38E,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	fdivd	%f12,	%f8,	%f28
loop_390:
	flushw
	movug	%fcc0,	%g6,	%l5
loop_391:
	nop
	setx	0xE6070303,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f6
	setx	0x41C07CC4,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f31
	fadds	%f31,	%f6,	%f19
	wr	%i5,	%i0,	%y
	nop
	setx	0x8E5A0CE97B58E5C7,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldx	[%l7 + 0x28],	%fsr
	subccc	%i2,	%l0,	%g3
	tsubcc	%i7,	0x068C,	%g5
	edge16n	%o4,	%o5,	%o6
	ble,pn	%xcc,	loop_392
	rd	%asi,	%o0
	fmovsa	%fcc3,	%f11,	%f10
	fmovsge	%fcc1,	%f14,	%f10
loop_392:
	edge8n	%o1,	%l1,	%l3
	call	loop_393
	call	loop_394
	wr 	%g0, 	0x5, 	%fprs
	fmovdule	%fcc0,	%f26,	%f10
loop_393:
	fmovdg	%fcc1,	%f4,	%f6
loop_394:
	rdpr	%otherwin,	%o2
	ldd	[%l7 + 0x20],	%f2
	movcs	%xcc,	0x03C,	%i6
	call	loop_395
	fmul8x16	%f27,	%f6,	%f6
	movug	%fcc0,	0x12D,	%g2
	call	loop_396
loop_395:
	fnands	%f19,	%f31,	%f8
	rdpr	%pil,	%l2
	call	loop_397
loop_396:
	fmovsneg	%xcc,	%f17,	%f26
	tge	%xcc,	0x4
	call	loop_398
loop_397:
	mova	%fcc3,	0x72A,	%g7
	call	loop_399
	fmovsleu	%xcc,	%f15,	%f4
loop_398:
	movge	%fcc3,	0x681,	%l4
	fnot2	%f12,	%f14
loop_399:
	movu	%fcc2,	0x65C,	%i3
	array16	%o7,	%l6,	%o3
	call	loop_400
	fxor	%f4,	%f4,	%f26
	nop
	setx	0x2CC0CB58F251CEE2,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	setx	0xBA11CE87E8CCAE5D,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	fdivd	%f30,	%f18,	%f16
	andn	%i1,	0x027C,	%g6
loop_400:
	call	loop_401
	edge8l	%i4,	%i5,	%l5
	fmovda	%xcc,	%f8,	%f28
	movn	%icc,	%i0,	%l0
loop_401:
	tcs	%icc,	0x7
	nop
	setx	0x065AE7BD,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f29
	setx	0x3DC3CDCA,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f14
	fdivs	%f14,	%f29,	%f8
	call	loop_402
	wr	%g3,	0x0589,	%softint
	brnz,a,pn	%i7,	loop_403
	call	loop_404
loop_402:
	fmovscc	%icc,	%f1,	%f6
	fmuld8ulx16	%f20,	%f19,	%f22
loop_403:
	pdist	%f22,	%f30,	%f0
loop_404:
	addccc	%g5,	0x1E74,	%i2
	call	loop_405
	fornot2s	%f11,	%f29,	%f4
	bvc,pn	%xcc,	loop_406
	fxors	%f10,	%f28,	%f5
loop_405:
	fmovdue	%fcc1,	%f26,	%f18
	call	loop_407
loop_406:
	call	loop_408
	subcc	%o4,	0x0825,	%o5
	call	loop_409
loop_407:
	taddcc	%o6,	%o0,	%o1
loop_408:
	fmovdle	%fcc1,	%f2,	%f18
	fcmpeq32	%f4,	%f22,	%l3
loop_409:
	stb	%l1,	[%l7 + 0x22]
	call	loop_410
	fnot2	%f20,	%f8
	fsrc1	%f4,	%f2
	fsrc1	%f2,	%f8
loop_410:
	fnegd	%f28,	%f10
	tge	%icc,	0x0
	tn	%icc,	0x7
	fand	%f22,	%f20,	%f22
	subc	%g1,	%o2,	%i6
	nop
	setx	0xF8E00D64,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f18
	setx	0x70D38163,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f26
	fmuls	%f26,	%f18,	%f18

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	call	loop_411
	fmul8sux16	%f28,	%f18,	%f20
	rdhpr	%hsys_tick_cmpr,	%g7
loop_411:
	nop

	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 6:
!
!	Type l   	: 8
!	Type a   	: 19
!	Type cti   	: 53
!	Type f   	: 68
!	Type i   	: 52
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
	set	0xB,	%g1
	set	0x3,	%g2
	set	0xE,	%g3
	set	0x0,	%g4
	set	0xD,	%g5
	set	0xF,	%g6
	set	0x7,	%g7
	!# Input registers
	set	-0x5,	%i0
	set	-0x6,	%i1
	set	-0x0,	%i2
	set	-0xA,	%i3
	set	-0xC,	%i4
	set	-0xE,	%i5
	set	-0x1,	%i6
	set	-0xE,	%i7
	!# Local registers
	set	0x6D576675,	%l0
	set	0x51016E0C,	%l1
	set	0x39B876E7,	%l2
	set	0x785BDC11,	%l3
	set	0x0691EDA6,	%l4
	set	0x337DA7B2,	%l5
	set	0x347BBF57,	%l6
	!# Output registers
	set	-0x1C27,	%o0
	set	0x0F7C,	%o1
	set	-0x07BF,	%o2
	set	0x1D09,	%o3
	set	-0x0CEE,	%o4
	set	-0x0A07,	%o5
	set	-0x03F7,	%o6
	set	-0x0AFD,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0xBDC02D05494A9F57)
	INIT_TH_FP_REG(%l7,%f2,0x882D54E409A81313)
	INIT_TH_FP_REG(%l7,%f4,0x4B62A896F84501EF)
	INIT_TH_FP_REG(%l7,%f6,0x024591A99765DD14)
	INIT_TH_FP_REG(%l7,%f8,0x973680810C5E654C)
	INIT_TH_FP_REG(%l7,%f10,0x6F172A3F35C8DEA3)
	INIT_TH_FP_REG(%l7,%f12,0x550BD6991F22F32F)
	INIT_TH_FP_REG(%l7,%f14,0xC23E230E73B5EA0B)
	INIT_TH_FP_REG(%l7,%f16,0x8B432D4FA91DAF47)
	INIT_TH_FP_REG(%l7,%f18,0xE07D2E4B2229E84A)
	INIT_TH_FP_REG(%l7,%f20,0x82BAC4E828D38A05)
	INIT_TH_FP_REG(%l7,%f22,0x9D595B6BCC62A44F)
	INIT_TH_FP_REG(%l7,%f24,0xD0FD43FC16F917F2)
	INIT_TH_FP_REG(%l7,%f26,0xED4F08CF9CC2465D)
	INIT_TH_FP_REG(%l7,%f28,0xC86ED0FF8793FFE4)
	INIT_TH_FP_REG(%l7,%f30,0x2962878FB08EBDCA)

	!# Execute Main Diag ..

	call	loop_412
	fmovrde	%l4,	%f4,	%f30
	nop
	setx	0x2460EC5DD52B397F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0x6B615B13,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	fsmuld	%f28,	%f4,	%f2
	call	loop_413
loop_412:
	fmovrdne	%l2,	%f22,	%f28
	fxors	%f13,	%f30,	%f28
	call	loop_414
loop_413:
	movlg	%fcc0,	%o7,	%l6
	fmovdcs	%xcc,	%f28,	%f2
	xnor	%o3,	0x012F,	%i3
loop_414:
	membar	0x52
	mulscc	%g6,	0x00E0,	%i1
	fmovscs	%xcc,	%f0,	%f21
	call	loop_415
	nop
	setx	0x00297EF9,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f30
	setx	0x4923E92B,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f19
	fdivs	%f19,	%f30,	%f10
	bg,a	%xcc,	loop_416
	rdhpr	%hintp,	%i5
loop_415:
	nop
	setx	0xF042BC96,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f30
	setx	0x4BFCAF51,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f31
	fsubs	%f31,	%f30,	%f3
	mova	%icc,	%l5,	%i0
loop_416:
	rd	%tick_cmpr,	%i4
	fmovsue	%fcc2,	%f18,	%f12
	rdhpr	%hintp,	%g3
	rdhpr	%hpstate,	%i7
	nop
	fitod	%f8,	%f12
	fdtox	%f12,	%f6
	sdivx	%g5,	0x0D49,	%i2
	sub	%o4,	%l0,	%o5
	add	%o0,	0x15DB,	%o1
	umulcc	%o6,	%l1,	%g1
	andn	%o2,	0x021B,	%i6
	sub	%g2,	0x1FC8,	%g4
	fmovda	%icc,	%f6,	%f22
	tcc	%icc,	0x0
	fbu,a	%fcc2,	loop_417
	tleu	%xcc,	0x6
	fblg	%fcc0,	loop_418
	call	loop_419
loop_417:
	nop
	setx	0x90B221AE23CE358B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x30]
	ldx	[%l7 + 0x30],	%fsr
	fmovscs	%xcc,	%f5,	%f29
loop_418:
	andn	%g7,	0x0C42,	%l3
loop_419:
	call	loop_420
	nop
	setx	0x1C05EF71CB3F8311,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	fsqrtd	%f22,	%f18
	tleu	%icc,	0x0
	fcmps	%fcc0,	%f10,	%f11
loop_420:
	te	%xcc,	0x7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xAF0, 	%hsys_tick_cmpr
	membar	0x16
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	xor	%o7,	%l2,	%l6
	fxors	%f4,	%f15,	%f22
	xorcc	%o3,	%g6,	%i1
	nop
	fitod	%f26,	%f6
	call	loop_421
	call	loop_422
	array8	%i5,	%i3,	%i0
	call	loop_423
loop_421:
	fmovsule	%fcc3,	%f22,	%f28
loop_422:
	call	loop_424
	fmovrslez	%l5,	%f6,	%f13
loop_423:
	xor	%i4,	%g3,	%g5
	call	loop_425
loop_424:
	call	loop_426
	fmovrdlz	%i2,	%f2,	%f22
	nop
	set	0x30, %i4
	stx	%fsr,	[%l7 + %i4]
loop_425:
	call	loop_427
loop_426:
	movrgz	%o4,	0x352,	%i7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	sllx	%o5,	%o1,	%o0
loop_427:
	nop
	setx	0x02209779D959B8FE,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0x263300422A4CE249,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	faddd	%f4,	%f22,	%f0
	orn	%l1,	%o6,	%o2
	fone	%f20
	call	loop_428
	array8	%i6,	%g2,	%g1
	call	loop_429
	nop
	set	0x57, %i3
	ldstub	[%l7 + %i3],	%g7
loop_428:
	tsubcc	%g4,	0x116E,	%l3
	call	loop_430
loop_429:
	fmuld8sux16	%f4,	%f17,	%f12
	call	loop_431
	fpadd16	%f2,	%f24,	%f20
loop_430:
	movge	%fcc2,	0x72E,	%l4
	rdpr	%gl,	%l2
loop_431:
	call	loop_432
	rd	%softint,	%l6
	call	loop_433
	wrpr 	%g0, 	0x0, 	%gl
loop_432:
	call	loop_434
	movu	%fcc1,	%i1,	%i5
loop_433:
	wrpr 	%g0, 	0x2, 	%gl
	fmovsgu	%icc,	%f9,	%f29
loop_434:
	bmask	%i0,	%i3,	%i4
	call	loop_435
	call	loop_436
	call	loop_437
	fornot2s	%f20,	%f21,	%f30
loop_435:
	fxors	%f0,	%f18,	%f9
loop_436:
	wr	%g3,	%l5,	%set_softint
loop_437:
	movneg	%xcc,	%g5,	%o4
	call	loop_438
	tcs	%icc,	0x2
	brlz,a,pt	%i7,	loop_439
	call	loop_440
loop_438:
	call	loop_441
	fblg,a,pn	%fcc0,	loop_442
loop_439:
	fbuge,a	%fcc1,	loop_443
loop_440:
	call	loop_444
loop_441:
	call	loop_445
loop_442:
	call	loop_446
loop_443:
	addcc	%i2,	%l0,	%o5
loop_444:
	fmovdneg	%icc,	%f6,	%f26
loop_445:
	call	loop_447
loop_446:
	call	loop_448
	fbule,a,pt	%fcc2,	loop_449
	addc	%o1,	%l1,	%o0
loop_447:
	nop
	wr	%g0,	0x0c,	%asi
	sta	%f21,	[%l7 + 0x28] %asi
loop_448:
	fble,a,pt	%fcc2,	loop_450
loop_449:
	nop
	fitod	%f12,	%f12
	fdtox	%f12,	%f24
	fnot1s	%f28,	%f16
	call	loop_451
loop_450:
	fcmple16	%f0,	%f2,	%o2
	call	loop_452
	call	loop_453
loop_451:
	ta	%xcc,	0x1
	call	loop_454
loop_452:
	call	loop_455
loop_453:
	call	loop_456
	rd	%tick_cmpr,	%i6
loop_454:
	call	loop_457
loop_455:
	fba,pt	%fcc3,	loop_458
loop_456:
	fmovsne	%icc,	%f15,	%f11
	xnorcc	%o6,	0x1819,	%g1
loop_457:
	xor	%g7,	0x1211,	%g2
loop_458:
	call	loop_459
	orn	%l3,	%g4,	%l2
	call	loop_460
	faligndata	%f2,	%f0,	%f0
loop_459:
	call	loop_461
	orncc	%l6,	0x0893,	%o7
loop_460:
	fcmpeq16	%f16,	%f20,	%l4
	call	loop_462
loop_461:
	call	loop_463
	fmovdo	%fcc0,	%f12,	%f2
	call	loop_464
loop_462:
	call	loop_465
loop_463:
	call	loop_466
	tcs	%xcc,	0x5
loop_464:
	tn	%icc,	0x0
loop_465:
	call	loop_467
loop_466:
	fmovsule	%fcc0,	%f31,	%f19
	or	%g6,	%i5,	%i1
	call	loop_468
loop_467:
	bpos,pn	%icc,	loop_469
	or	%o3,	%i0,	%i4
	fmovso	%fcc2,	%f5,	%f7
loop_468:
	brlez,a	%g3,	loop_470
loop_469:
	fmovdne	%fcc2,	%f14,	%f24
	fmovdg	%xcc,	%f18,	%f8
	movo	%fcc0,	%i3,	%l5
loop_470:
	nop
	setx	0xC060DAD5CB3D228C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0x1A6DD0C871E807EA,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	fmuld	%f4,	%f24,	%f16
	fcmpeq16	%f30,	%f6,	%g5
	fcmpne16	%f30,	%f2,	%i7
	call	loop_471
	ta	%icc,	0x4
	umul	%o4,	%i2,	%o5
	fbul,pn	%fcc0,	loop_472
loop_471:
	call	loop_473
	call	loop_474
	fmovsgu	%icc,	%f27,	%f8
loop_472:
	tcc	%icc,	0x1
loop_473:
	nop
	setx	0x412A85FA159DB708,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	fsqrtd	%f28,	%f0
loop_474:
	rdhpr	%ver,	%o1
	movrgz	%l0,	%l1,	%o2
	bmask	%i6,	%o0,	%g1
	rd	%pc,	%o6
	bvc	%xcc,	loop_475
	fmovdlg	%fcc3,	%f2,	%f12
	set	0x0A, %g3
	stba	%g7,	[%l7 + %g3] 0x81
loop_475:
	call	loop_476
	bl,a	%xcc,	loop_477
	fsrc1	%f20,	%f2
	fone	%f6
loop_476:
	te	%xcc,	0x6
loop_477:
	edge16l	%l3,	%g2,	%l2
	andncc	%l6,	%o7,	%l4
	movrgez	%g6,	%g4,	%i5
	nop
	fitos	%f4,	%f26
	call	loop_478
	brlez,a	%o3,	loop_479
	call	loop_480
	fpadd32s	%f25,	%f3,	%f24
loop_478:
	movrlz	%i0,	%i1,	%i4
loop_479:
	be,pt	%icc,	loop_481
loop_480:
	rd	%sys_tick_cmpr,	%i3
	array8	%g3,	%l5,	%g5
	call	loop_482
loop_481:
	sub	%i7,	%i2,	%o4
	fmovslg	%fcc0,	%f20,	%f14
	call	loop_483
loop_482:
	call	loop_484
loop_483:
	nop

loop_484:
	nop

	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 7:
!
!	Type l   	: 5
!	Type a   	: 15
!	Type x   	: 2
!	Type cti   	: 73
!	Type f   	: 49
!	Type i   	: 56
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


	EXIT_GOOD	/* test finish  */

/************************************************************************
   Test case data start
 ************************************************************************/
.data
user_data_start:
scratch_area:
.word 0xDE6DADF7
.word 0xD40136A8
.word 0x3BAF0D41
.word 0xB728FFC8
.word 0x33A206BA
.word 0x0BFF1832
.word 0x164ED8A1
.word 0x0BF89C06
.word 0xF9E025B7
.word 0x264C85E1
.word 0x8E32AA5A
.word 0x093E27A6
.word 0x0724ADCF
.word 0x53BB3C2C
.word 0x4FC7FEF0
.word 0x919B3EC4
.word 0x9DE20CF6
.word 0xE276C44C
.word 0xBD9C8068
.word 0x2C69AB93
.word 0x510051D5
.word 0xEAA24A51
.word 0x44B58114
.word 0x5C4A12D6
.word 0x2143713B
.word 0xB555D02E
.word 0x039765E1
.word 0x401DCD69
.word 0xE76E38A7
.word 0x7413C43A
.word 0xB882DEA8
.word 0x1E486320
.word 0xFD39EA2F
.word 0xCD0A5464
.word 0xF4F48F4D
.word 0x02515E7E
.word 0xE33C744C
.word 0xC2E66F7B
.word 0x8336BB3D
.word 0x6AB24914
.word 0x9049C2FF
.word 0x3D19D66C
.word 0x481D343E
.word 0x9E509194
.word 0x587CB3A8
.word 0xC09BF356
.word 0x5FCBA791
.word 0xDC619883
.word 0x5D57CE04
.word 0xFFC86373
.word 0xC2A730B5
.word 0x84F81A3F
.word 0x24CEA752
.word 0xB48CBA9C
.word 0x074E70A3
.word 0x2AD246A5
.word 0xF1BA7E4B
.word 0x908C705F
.word 0x52A54385
.word 0x5D04F1E7
.word 0x64DB7ACA
.word 0xF6030E67
.word 0xCED25672
.word 0xD193FC47
.end
