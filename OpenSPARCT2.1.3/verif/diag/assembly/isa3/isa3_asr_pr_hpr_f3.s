/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: isa3_asr_pr_hpr_f3.s
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
.ident "FOCUSCASE: focus.pm,v 1.1 2003/04/23 17:53:39 somePerson Exp somePerson $ ../focus/spc_basic_isa3.pl FOCUS_SEED=967582580"
.ident "BY gg137162 ON Tue Sep  9 16:34:37 CDT 2003"
.ident "Using Instruction Hash for Focus :$Id: isa3_asr_pr_hpr_f3.s,v 1.2 2007/07/05 21:59:48 drp Exp $"
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
!
! Thread 0 Start
!
main_t0:

	!# Initialize registers ..

	!# Global registers
	set	0xC,	%g1
	set	0x4,	%g2
	set	0xF,	%g3
	set	0x8,	%g4
	set	0x0,	%g5
	set	0xE,	%g6
	set	0xA,	%g7
	!# Input registers
	set	-0x9,	%i0
	set	-0xD,	%i1
	set	-0x7,	%i2
	set	-0x6,	%i3
	set	-0x2,	%i4
	set	-0x0,	%i5
	set	-0x5,	%i6
	set	-0x6,	%i7
	!# Local registers
	set	0x43E3E5C8,	%l0
	set	0x5A52F8CF,	%l1
	set	0x052DF69D,	%l2
	set	0x2E2DD2C1,	%l3
	set	0x21355790,	%l4
	set	0x15C038E1,	%l5
	set	0x30B8C23A,	%l6
	!# Output registers
	set	0x1F13,	%o0
	set	0x0A85,	%o1
	set	0x066F,	%o2
	set	-0x137C,	%o3
	set	-0x09EA,	%o4
	set	0x06FE,	%o5
	set	-0x0D36,	%o6
	set	0x0C88,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0xA8D1F8EEC434C2E1)
	INIT_TH_FP_REG(%l7,%f2,0x34CD55CB8D87B6CD)
	INIT_TH_FP_REG(%l7,%f4,0xE322C55DCF373032)
	INIT_TH_FP_REG(%l7,%f6,0x5467655F51750CC4)
	INIT_TH_FP_REG(%l7,%f8,0x663285E55429698F)
	INIT_TH_FP_REG(%l7,%f10,0xE699A5809F303E68)
	INIT_TH_FP_REG(%l7,%f12,0xBE4898FF42CAE14F)
	INIT_TH_FP_REG(%l7,%f14,0x0A3002F92C4661D6)
	INIT_TH_FP_REG(%l7,%f16,0x9FE7BE12E7C3F080)
	INIT_TH_FP_REG(%l7,%f18,0x98D654DB09C34B50)
	INIT_TH_FP_REG(%l7,%f20,0x648369DC6BA7D72F)
	INIT_TH_FP_REG(%l7,%f22,0xD7C92F758825EB03)
	INIT_TH_FP_REG(%l7,%f24,0x65A81A9C083D6A1A)
	INIT_TH_FP_REG(%l7,%f26,0x104C017B286D96F4)
	INIT_TH_FP_REG(%l7,%f28,0x67E612B7F7FFBCC2)
	INIT_TH_FP_REG(%l7,%f30,0xB2DC594B10678E4B)
	!# Other state
	
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr


	!# Execute Main Diag ..

	rd	%ccr,	%g1
	fbule	%fcc0,	loop_1
	wrpr	%i6,	%g6,	%pil
	wrpr	%g7,	0x1518,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_1:
	wrpr	%o6,	%i0,	%tick
	fand	%f4,	%f24,	%f6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%hsys_tick_cmpr,	%l0
	wrpr	%i2,	0x19AC,	%cwp
	rdhpr	%htba,	%l4
	sethi	0x0D77,	%g4
	rd	%fprs,	%o2
	wr	%g3,	%l6,	%softint
	wr	%o4,	%g5,	%pic
	rd	%y,	%o5
	rdhpr	%hintp,	%l1
	tle	%xcc,	0x4
	rdpr	%canrestore,	%i1
	fmovrse	%o0,	%f29,	%f8
	rdpr	%cleanwin,	%l2
	rdhpr	%hintp,	%l3
	fmovsge	%xcc,	%f21,	%f13

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xB32, 	%hsys_tick_cmpr
	rdhpr	%hsys_tick_cmpr,	%i5
	xorcc	%o3,	0x166B,	%o7
	fbge,a	%fcc0,	loop_2
	movg	%xcc,	%o1,	%l5
	wr	%i6,	%g6,	%y
	rdpr	%cwp,	%g7
loop_2:
	wrpr	%g1,	%i4,	%tick
	rd	%sys_tick_cmpr,	%i0
	wr	%i3,	0x0632,	%softint
	wrpr	%o6,	%g2,	%cwp
	rdhpr	%htba,	%l0
	rd	%ccr,	%i2
	movgu	%icc,	%g4,	%l4
	movge	%icc,	%g3,	%o2
	bgu,a	%icc,	loop_3
	fbn,a	%fcc3,	loop_4
	wrpr	%l6,	%g5,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_3:
	rd	%ccr,	%o5
loop_4:
	rd	%pc,	%i1
	rdpr	%cleanwin,	%l1
	wr	%o0,	0x1592,	%softint
	rdhpr	%htba,	%l2
	wrpr	%i7,	%i5,	%cwp
	rd	%fprs,	%o3
	taddcctv	%o7,	0x1312,	%o1
	tn	%icc,	0x3
	rdhpr	%hsys_tick_cmpr,	%l3
	rdpr	%pil,	%i6
	wrpr	%g6,	%g7,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x890, 	%hsys_tick_cmpr
	fbul	%fcc1,	loop_5
	edge32	%i4,	%i0,	%o6
	rdhpr	%hintp,	%i3
	wr	%g0,	0x80,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
loop_5:
	movne	%xcc,	%g2,	%l0
	rdpr	%wstate,	%g4
	fbug,a	%fcc1,	loop_6
	fbule	%fcc0,	loop_7
	rdhpr	%hpstate,	%i2
	fmovsn	%icc,	%f22,	%f31
loop_6:
	wr	%l4,	0x0AB5,	%set_softint
loop_7:
	rd	%fprs,	%g3
	movcc	%icc,	%o2,	%g5
	rdpr	%cansave,	%l6
	wrpr	%o5,	0x11D4,	%pil
	tsubcctv	%o4,	%i1,	%l1
	rd	%softint,	%o0
	rdhpr	%hintp,	%l2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xEC0, 	%hsys_tick_cmpr
	tvc	%icc,	0x6
	rdpr	%tl,	%i5
	bne,pn	%xcc,	loop_8
	ta	%xcc,	0x5
	rdpr	%pil,	%o1
	te	%xcc,	0x1
loop_8:
	sir	0x1895

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fcmple32	%f6,	%f4,	%g6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x38C, 	%hsys_tick_cmpr
	rdpr	%cleanwin,	%o7
	wrpr	%i4,	%l5,	%tick
	wrpr	%o6,	%i0,	%tick
	wr	%i3,	0x13A8,	%set_softint
	bpos,a	%xcc,	loop_9
	fbg,a	%fcc2,	loop_10
	rd	%pc,	%g2
	movrgz	%l0,	%g4,	%i2
loop_9:
	fsrc2	%f22,	%f14
loop_10:
	membar	0x6C
	wr	%g3,	0x0597,	%softint
	rdpr	%cwp,	%l4
	rd	%y,	%g5
	bpos,a	%xcc,	loop_11
	tpos	%icc,	0x3
	wrpr	%o2,	0x15E3,	%tick
	fmovrslez	%o5,	%f24,	%f8
loop_11:
	fmovdge	%xcc,	%f9,	%f27
	membar	0x1E
	tle	%xcc,	0x2
	wrpr	%l6,	0x083F,	%cwp
	edge32l	%i1,	%l1,	%o4
	xnor	%o0,	%l2,	%i7
	addccc	%i5,	0x0EFB,	%o1
	stw	%o3,	[%l7 + 0x34]
	fpadd32s	%f19,	%f28,	%f7
	set	0x2C, %i0
	stha	%l3,	[%l7 + %i0] 0x2f
	membar	#Sync
	movvs	%icc,	%g6,	%g7
	fcmple32	%f16,	%f24,	%g1
	fmovdn	%xcc,	%f26,	%f22
	rd	%asi,	%o7
	movgu	%xcc,	%i4,	%l5
	bvc,a	%icc,	loop_12
	fmovrse	%o6,	%f5,	%f6
	wrpr	%i0,	0x1F2D,	%pil
	fornot1s	%f1,	%f10,	%f28
loop_12:
	sdivcc	%i3,	0x12A3,	%i6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x94E, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%htba,	%g3
	rdhpr	%htba,	%l4
	fnegd	%f12,	%f6
	set	0x68, %g1
	ldxa	[%l7 + %g1] 0x89,	%i2
	rd	%asi,	%g5
	nop
	setx	loop_13,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	prefetch	[%l7 + 0x50],	 0x3
	fmul8sux16	%f14,	%f30,	%f10
	ldx	[%l7 + 0x70],	%o5
loop_13:
	addccc	%l6,	%o2,	%l1
	add	%o4,	%o0,	%l2
	sdiv	%i1,	0x0489,	%i5
	fands	%f20,	%f27,	%f19
	rd	%softint,	%o1
	orcc	%i7,	0x0931,	%l3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x6A5, 	%hsys_tick_cmpr
	wrpr	%o7,	%g7,	%pil
	wr	%i4,	0x0B35,	%sys_tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xE59, 	%hsys_tick_cmpr
	rdhpr	%hintp,	%i0
	wr	%o6,	%i6,	%pic
	sdiv	%l0,	0x1B49,	%i3
	tsubcc	%g4,	0x15E7,	%g3
	wrpr	%g2,	0x005C,	%cwp
	nop
	set	0x60, %l0
	ldx	[%l7 + %l0],	%i2
	edge16	%g5,	%l4,	%l6
	movg	%icc,	%o2,	%l1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	mulx	%o5,	0x181A,	%l2
	ldsw	[%l7 + 0x78],	%i5
	rdpr	%wstate,	%i1
	rdhpr	%hpstate,	%o1
	fbue	%fcc2,	loop_14
	wr 	%g0, 	0x4, 	%fprs
	edge16ln	%i7,	%o3,	%g1
	udiv	%g7,	0x07F9,	%i4
loop_14:
	wr	%l5,	0x02C6,	%sys_tick
	mulscc	%i0,	%o7,	%o6
	tne	%icc,	0x3
	fmovsleu	%xcc,	%f16,	%f1
	sra	%i6,	%l0,	%i3
	movg	%icc,	%g4,	%g3
	wrpr	%i2,	0x0DD4,	%tick
	taddcc	%g2,	%g5,	%l6
	movcs	%xcc,	%o2,	%l1
	fnand	%f10,	%f14,	%f2
	rdpr	%gl,	%o4
	rd	%pc,	%o0
	rdpr	%tba,	%o5
	wrpr	%l4,	%l2,	%pil
	srax	%i5,	%i1,	%l3
	xnor	%g6,	%o1,	%o3
	rdhpr	%hintp,	%g1
	movrlez	%g7,	0x300,	%i4
	rdpr	%tl,	%l5
	rdhpr	%hintp,	%i7
	andcc	%i0,	%o7,	%i6
	edge32ln	%l0,	%i3,	%o6
	rd	%ccr,	%g3
	fornot1	%f30,	%f16,	%f4
	fbul	%fcc3,	loop_15
	wr	%g4,	0x132B,	%y
	rd	%asi,	%g2
	rd	%asi,	%g5
loop_15:
	brlez	%i2,	loop_16
	rdhpr	%hintp,	%o2
	wrpr	%l1,	0x14DB,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x6AF, 	%hsys_tick_cmpr
loop_16:
	fmovsl	%xcc,	%f10,	%f1
	rdhpr	%htba,	%l6
	edge16	%o5,	%o0,	%l2
	mova	%icc,	%i5,	%l4
	movge	%icc,	%i1,	%l3
	rd	%pc,	%g6
	fbul,a	%fcc3,	loop_17
	fmovrdne	%o3,	%f0,	%f16
	wr	%g1,	%o1,	%set_softint

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_17:
	rdhpr	%hintp,	%l5
	ldub	[%l7 + 0x7F],	%g7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%i7,	%i3,	%pil
	rdhpr	%hintp,	%o6
	array32	%g3,	%l0,	%g4
	rdpr	%tba,	%g5
	wrpr	%i2,	%o2,	%tick
	rdpr	%cansave,	%g2
	edge32	%o4,	%l1,	%o5
	rdhpr	%hpstate,	%o0
	wrpr	%l6,	0x09E6,	%tick
	fbne,a	%fcc0,	loop_18
	rdpr	%cansave,	%l2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_18:

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x0EE, 	%tick_cmpr
	andcc	%i4,	0x0349,	%o1
	rdhpr	%hintp,	%g7
	movrgez	%i0,	0x33E,	%l5
	brgez,a	%o7,	loop_19
	edge16l	%i7,	%i3,	%i6
	rdhpr	%hintp,	%g3
	rdhpr	%hpstate,	%o6
loop_19:
	wr	%l0,	%g4,	%ccr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xE7B, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x0A0, 	%hsys_tick_cmpr
	fpack16	%f8,	%f2
	fxor	%f2,	%f8,	%f28
	wrpr	%g5,	0x0730,	%pil
	wrpr	%o5,	%l1,	%cwp
	edge32l	%o0,	%l2,	%l4
	rdhpr	%hintp,	%l6
	movge	%xcc,	%l3,	%i1
	movl	%xcc,	%o3,	%i5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	brlez	%i4,	loop_20
	wrpr	%g6,	0x037A,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	mulscc	%g7,	%o7,	%l5
loop_20:
	wr	%i7,	%i3,	%ccr
	tleu	%xcc,	0x5
	ble,pt	%xcc,	loop_21
	rd	%tick_cmpr,	%g3
	mulx	%o6,	0x0D37,	%i6
	rd	%sys_tick_cmpr,	%g4
loop_21:
	fandnot2s	%f11,	%f15,	%f6
	ba,a	%xcc,	loop_22
	rdpr	%cansave,	%i2
	fmovsvs	%icc,	%f9,	%f24
	rd	%tick_cmpr,	%l0
loop_22:
	rd	%asi,	%g2
	fnot1s	%f20,	%f10
	set	0x78, %l5
	prefetcha	[%l7 + %l5] 0x11,	 0x3
	ld	[%l7 + 0x50],	%f22
	fabss	%f5,	%f1
	rdhpr	%hpstate,	%g5
	rd	%pc,	%o2
	fmovrsgz	%l1,	%f7,	%f29
	rd	%ccr,	%o0
	wrpr	%l2,	%o5,	%tick
	brnz,a	%l4,	loop_23
	rdhpr	%htba,	%l3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x462, 	%sys_tick_cmpr
	fble	%fcc2,	loop_24
loop_23:
	xor	%i5,	0x00D6,	%i1
	xorcc	%i4,	%g6,	%o1
loop_24:
	fbg,a	%fcc0,	loop_25
	sllx	%i0,	0x0B,	%g7
	wrpr	%g1,	0x183F,	%pil
	tgu	%icc,	0x0
loop_25:
	movrgz	%o7,	0x000,	%i7
	umul	%i3,	%g3,	%l5
	tpos	%icc,	0x1
	rd	%fprs,	%o6
	movne	%xcc,	%i6,	%i2
	smul	%g4,	%g2,	%o4
	edge32n	%g5,	%l0,	%o2
	rd	%ccr,	%o5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%hpstate,	%l2
	wrpr	%l6,	%l3,	%cwp
	rdpr	%cansave,	%o3
	taddcctv	%i1,	%i4,	%g6
	wr	%o1,	0x0BD5,	%softint
	rdpr	%otherwin,	%i5
	wr	%g7,	0x0920,	%pic
	rd	%tick_cmpr,	%i0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	rdpr	%pil,	%o7
	wrpr	%i3,	%g3,	%tick
	fmovdle	%icc,	%f25,	%f21
	edge8	%l5,	%o6,	%i6
	fpsub32	%f6,	%f18,	%f0
	rdhpr	%hintp,	%g4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x566, 	%hsys_tick_cmpr
	rd	%tick_cmpr,	%g5
	bpos,pt	%icc,	loop_26
	rdpr	%tl,	%g2
	rd	%sys_tick_cmpr,	%l0
	rdpr	%otherwin,	%o0
loop_26:
	udiv	%o2,	0x1697,	%l1
	rdpr	%canrestore,	%l4
	fbn	%fcc1,	loop_27
	rdpr	%pil,	%o5
	wr	%l2,	%l3,	%clear_softint
	bcs,a	%icc,	loop_28
loop_27:
	rdhpr	%hintp,	%l6
	fba	%fcc1,	loop_29
	wrpr	%o3,	0x081E,	%tick
loop_28:
	rdhpr	%hintp,	%i4
	fsrc2	%f8,	%f10
loop_29:
	flushw

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	movrgz	%g7,	%i0,	%i1
	tl	%xcc,	0x6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%tba,	%g3
	rdhpr	%htba,	%o6
	edge16ln	%l5,	%g4,	%i6
	wr 	%g0, 	0x6, 	%fprs
	rd	%sys_tick_cmpr,	%g5
	rd	%sys_tick_cmpr,	%g2
	rdpr	%wstate,	%l0
	rd	%fprs,	%o4
	rdpr	%cleanwin,	%o0
	set	0x24, %i3
	lda	[%l7 + %i3] 0x0c,	%f15
	movle	%icc,	%l1,	%l4
	movrlz	%o2,	0x3C6,	%l2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%hpstate,	%l6
	fabss	%f8,	%f12
	rdpr	%gl,	%l3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	fzero	%f20

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x6D6, 	%hsys_tick_cmpr
	rd	%sys_tick_cmpr,	%o1
	movn	%xcc,	%g7,	%i0
	wrpr	%i1,	0x04E9,	%cwp
	rd	%ccr,	%o7
	te	%xcc,	0x6
	rd	%pc,	%i7
	rdpr	%gl,	%g1
	wrpr	%g3,	0x168A,	%pil
	call	loop_30
	prefetch	[%l7 + 0x1C],	 0x3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%g0,	0x80,	%asi
	swapa	[%l7 + 0x48] %asi,	%l5
loop_30:
	wrpr	%o6,	%g4,	%cwp
	wrpr	%i6,	0x128D,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xF19, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x911, 	%sys_tick_cmpr
	add	%o4,	0x0489,	%o0
	wrpr	%l0,	0x0C8C,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x36F, 	%hsys_tick_cmpr
	rd	%asi,	%l1
	set	0x60, %o1
	ldda	[%l7 + %o1] 0xea,	%o2
	rd	%asi,	%l2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	sir	0x0D8F
	fmovsleu	%xcc,	%f14,	%f0
	rd	%asi,	%o3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xD87, 	%hsys_tick_cmpr
	fbg	%fcc1,	loop_31
	tne	%xcc,	0x3
	wr	%i5,	0x0AB9,	%clear_softint
	rdhpr	%hpstate,	%o1
loop_31:
	nop
	set	0x0B, %i4
	stba	%g7,	[%l7 + %i4] 0xea
	membar	#Sync
	fzeros	%f29
	sdivcc	%g6,	0x1D94,	%i0
	fmovd	%f18,	%f2
	sdivx	%i1,	0x19C4,	%i7
	for	%f8,	%f22,	%f4
	rd	%softint,	%g1
	rd	%ccr,	%g3
	rdpr	%cleanwin,	%o7
	rd	%pc,	%i3
	brnz	%l5,	loop_32
	fnand	%f16,	%f20,	%f4
	movpos	%xcc,	%o6,	%g4
	orn	%i6,	%i2,	%g2
loop_32:
	rdhpr	%hpstate,	%g5
	rdhpr	%hpstate,	%o0
	wrpr	%o4,	0x0C52,	%pil
	rdpr	%pil,	%l4
	flush	%l7 + 0x30

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x0DC, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%tick_cmpr,	%o5
	rdpr	%gl,	%l6
	wrpr	%o3,	%l3,	%tick
	rd	%tick_cmpr,	%i4
	tcs	%icc,	0x1
	movvs	%icc,	%o1,	%i5
	andn	%g6,	%g7,	%i1
	rdpr	%cleanwin,	%i0
	rd	%sys_tick_cmpr,	%i7
	or	%g1,	%o7,	%i3
	rdhpr	%hsys_tick_cmpr,	%l5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xD53, 	%sys_tick_cmpr
	set	0x33, %g2
	ldsba	[%l7 + %g2] 0x0c,	%g4
	wr	%i2,	0x1EA2,	%clear_softint
	wrpr	%g2,	0x1B5E,	%cwp
	rdpr	%wstate,	%i6
	orncc	%o0,	0x1911,	%o4
	wr	%l4,	%g5,	%ccr
	rdhpr	%hintp,	%o2
	wrpr	%l1,	0x1082,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	add	%l7,	0x50,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%l0
	casxa	[%l6] %asi,	%l0,	%o5
	brlez	%l6,	loop_33
	rdhpr	%htba,	%o3
	alignaddr	%l3,	%o1,	%i4
	wrpr	%g6,	0x11E3,	%pil
loop_33:
	orcc	%i5,	0x1BAA,	%i1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	flushw
	rd	%softint,	%i7
	call	loop_34
	wr	%g1,	%o7,	%clear_softint
	rd	%y,	%g7
	nop
	setx loop_35, %l0, %l1
	jmpl %l1, %l5
loop_34:
	rd	%pc,	%i3
	wr	%o6,	0x1AE1,	%clear_softint
	wrpr	%g4,	%g3,	%tick
loop_35:
	wr	%g2,	%i6,	%clear_softint
	taddcc	%i2,	0x1FEB,	%o0
	rd	%pc,	%o4
	rdhpr	%hintp,	%g5
	fmul8x16al	%f16,	%f26,	%f30
	tcc	%icc,	0x2
	call	loop_36
	be	loop_37
	tg	%icc,	0x3
	wr	%o2,	0x02BF,	%softint
loop_36:
	array32	%l1,	%l4,	%l2
loop_37:
	wrpr	%l0,	%o5,	%pil
	rd	%ccr,	%l6
	wr	%l3,	0x0231,	%pic
	array32	%o3,	%i4,	%g6
	rdpr	%wstate,	%i5
	andncc	%i1,	%i0,	%o1
	rdpr	%canrestore,	%i7
	fsrc2	%f22,	%f2
	xnorcc	%g1,	0x0882,	%o7
	fbule,a	%fcc1,	loop_38
	rd	%tick_cmpr,	%o6
	subc	%g4,	0x0F25,	%i3
	rd	%sys_tick_cmpr,	%g2
loop_38:
	fcmple16	%f14,	%f28,	%i6
	ld	[%l7 + 0x1C],	%f2
	wrpr	%g3,	%i2,	%pil
	rdpr	%otherwin,	%o4
	fandnot1	%f6,	%f6,	%f2
	sllx	%g5,	0x18,	%o2
	fandnot2	%f12,	%f20,	%f0
	rdhpr	%htba,	%o0
	rd	%asi,	%l1
	ldsh	[%l7 + 0x58],	%l4
	rd	%softint,	%l2
	umul	%o5,	0x1FEA,	%l6
	swap	[%l7 + 0x70],	%l3
	set	0x20, %l6
	ldda	[%l7 + %l6] 0x27,	%o2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	addc	%i4,	%g6,	%i5
	fcmpes	%fcc2,	%f30,	%f2
	movrlz	%i1,	%i0,	%i7
	fbule,a	%fcc1,	loop_39
	wrpr	%g1,	0x0C08,	%tick
	tcs	%icc,	0x3
	wrpr	%o7,	0x029D,	%pil
loop_39:
	fmovsneg	%icc,	%f21,	%f13
	wr	%l5,	%g7,	%y
	swap	[%l7 + 0x14],	%o1
	rdpr	%gl,	%g4
	rdhpr	%hpstate,	%i3
	subcc	%o6,	%i6,	%g3
	tvc	%icc,	0x6
	udiv	%i2,	0x1202,	%g2
	rd	%fprs,	%g5
	wrpr	%o4,	0x033B,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%htba,	%l4
	wr	%l2,	0x00D0,	%ccr
	rdhpr	%hpstate,	%o0
	fxor	%f16,	%f4,	%f12
	edge32	%o5,	%l6,	%o3
	st	%f5,	[%l7 + 0x50]
	wrpr	%l3,	%l0,	%pil
	wr	%i4,	0x08D9,	%ccr
	wr	%g6,	0x1758,	%softint
	wrpr	%i5,	0x1AF3,	%tick
	rd	%tick_cmpr,	%i0
	edge16l	%i7,	%g1,	%o7
	sir	0x028F

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x3C0, 	%hsys_tick_cmpr
	rd	%asi,	%o1
	tne	%icc,	0x7
	stw	%g7,	[%l7 + 0x54]

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xC01, 	%tick_cmpr
	srlx	%i6,	%g3,	%o6
	fbug,a	%fcc3,	loop_40
	srax	%i2,	%g5,	%g2
	rdhpr	%hintp,	%o4
	prefetch	[%l7 + 0x24],	 0x2
loop_40:
	bcc,pt	%xcc,	loop_41
	fnot1s	%f3,	%f28
	udivcc	%l1,	0x194A,	%o2
	fnot1s	%f23,	%f3
loop_41:
	rdhpr	%hintp,	%l4
	fnand	%f12,	%f20,	%f0
	ldsw	[%l7 + 0x54],	%o0
	edge16n	%o5,	%l6,	%o3
	bn,pn	%xcc,	loop_42
	fmovsvs	%xcc,	%f0,	%f22
	flushw
	edge32l	%l3,	%l0,	%l2
loop_42:
	rd	%asi,	%i4
	wr	%g6,	%i0,	%set_softint
	rd	%fprs,	%i7
	wrpr	%g1,	%o7,	%tick
	rdhpr	%hpstate,	%i5
	movrgz	%l5,	0x0BF,	%o1
	fmuld8sux16	%f2,	%f1,	%f12
	rdpr	%wstate,	%i1
	fbug,a	%fcc3,	loop_43
	wrpr	%i3,	%g4,	%tick
	rdhpr	%hintp,	%g7
	udivcc	%g3,	0x179B,	%i6
loop_43:
	edge8l	%i2,	%g5,	%g2
	rdhpr	%htba,	%o6
	fmovda	%xcc,	%f13,	%f21
	bleu	%icc,	loop_44
	srlx	%l1,	%o2,	%l4
	wrpr	%o4,	%o5,	%tick
	faligndata	%f2,	%f16,	%f16
loop_44:
	wrpr	%o0,	0x0389,	%tick
	rd	%sys_tick_cmpr,	%l6
	rd	%ccr,	%o3
	smul	%l0,	%l2,	%i4
	set	0x24, %l1
	lda	[%l7 + %l1] 0x14,	%f15

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x187, 	%tick_cmpr
	movneg	%xcc,	%i7,	%g1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xC91, 	%hsys_tick_cmpr
	rd	%ccr,	%o7
	fmul8x16al	%f21,	%f10,	%f12
	addccc	%i5,	0x0C84,	%l5
	brz	%o1,	loop_45
	rdhpr	%hsys_tick_cmpr,	%i3
	rdpr	%cansave,	%g4
	fbge	%fcc3,	loop_46
loop_45:
	wrpr	%i1,	%g3,	%cwp
	addcc	%g7,	0x045A,	%i2
	rdhpr	%htba,	%g5
loop_46:
	rdhpr	%htba,	%g2
	movpos	%xcc,	%i6,	%l1
	fpadd16s	%f26,	%f5,	%f4
	subccc	%o2,	0x0ADB,	%l4
	movpos	%xcc,	%o4,	%o6
	ta	%xcc,	0x2
	wr	%o5,	%o0,	%pic
	rdpr	%wstate,	%o3
	movgu	%icc,	%l6,	%l2
	movneg	%xcc,	%l0,	%i4
	tleu	%icc,	0x6
	rd	%ccr,	%l3
	wrpr	%i7,	%g1,	%tick
	udivcc	%g6,	0x0440,	%o7
	rdhpr	%hsys_tick_cmpr,	%i0
	movl	%icc,	%i5,	%l5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x1D2, 	%hsys_tick_cmpr
	or	%o1,	0x1950,	%i1
	wrpr	%g3,	%g4,	%pil
	movne	%xcc,	%i2,	%g5
	movl	%xcc,	%g2,	%i6
	brnz	%g7,	loop_47
	fbule,a	%fcc2,	loop_48
	wr 	%g0, 	0x4, 	%fprs
	rdhpr	%hsys_tick_cmpr,	%l4
loop_47:
	sdivcc	%o4,	0x04F9,	%o6
loop_48:
	fmovsl	%xcc,	%f18,	%f27
	lduh	[%l7 + 0x3A],	%o5
	fbug,a	%fcc0,	loop_49
	rdpr	%cleanwin,	%o0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xD0C, 	%sys_tick_cmpr
	rdhpr	%htba,	%o3
loop_49:
	orn	%l2,	0x0C4F,	%l0
	rd	%asi,	%i4
	rdhpr	%htba,	%i7
	add	%l7,	0x74,	%l6
	wr	%g0,	0x10,	%asi
	casa	[%l6] %asi,	%l3,	%g6
	rdpr	%gl,	%o7
	tgu	%xcc,	0x0
	wrpr	%g1,	%i5,	%cwp
	rdpr	%tba,	%i0
	wr	%i3,	%o1,	%set_softint
	rdhpr	%hintp,	%l5
	rdpr	%cwp,	%i1
	rdpr	%wstate,	%g4
	rdpr	%cansave,	%g3
	rd	%fprs,	%g5
	fcmpes	%fcc2,	%f9,	%f31
	wr	%i2,	%i6,	%set_softint
	rdpr	%cansave,	%g7
	wr	%o2,	%g2,	%clear_softint
	fmovdvs	%xcc,	%f2,	%f6
	andcc	%l4,	0x1869,	%o4
	rdpr	%cansave,	%o5
	fmovrslez	%o0,	%f31,	%f23
	rd	%pc,	%o6
	wr	%l6,	0x1B28,	%clear_softint
	fors	%f21,	%f3,	%f29
	rdpr	%gl,	%l1
	taddcc	%o3,	%l0,	%i4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x806, 	%hsys_tick_cmpr
	rdhpr	%hintp,	%g6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x068, 	%sys_tick_cmpr
	edge16ln	%i5,	%i0,	%g1
	tge	%icc,	0x0
	edge16ln	%i3,	%o1,	%l5
	wrpr	%i1,	0x0812,	%cwp
	tvc	%xcc,	0x3
	wrpr	%g5,	%i2,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%fprs,	%o2
	wrpr	%l4,	0x1E65,	%pil
	tne	%icc,	0x6
	fnegd	%f18,	%f2
	wr 	%g0, 	0x6, 	%fprs
	taddcctv	%o0,	%o6,	%l6
	srl	%l1,	%o3,	%l0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	stb	%i7,	[%l7 + 0x4E]
	rdpr	%tba,	%g6
	rd	%tick_cmpr,	%l3
	wr	%o7,	0x0F05,	%pic
	wr	%l2,	0x06B7,	%y
	rdhpr	%hpstate,	%i5
	swap	[%l7 + 0x44],	%g1
	movl	%xcc,	%i0,	%o1
	nop
	setx	loop_50,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	edge8ln	%l5,	%i3,	%g4
	rd	%pc,	%i1
	bpos	%icc,	loop_51
loop_50:
	rd	%pc,	%g3
	rdhpr	%hintp,	%g5
	fmovsne	%icc,	%f28,	%f30
loop_51:
	mulscc	%i2,	0x1450,	%g7
	or	%i6,	0x16E1,	%l4
	wrpr	%g2,	%o2,	%tick
	wrpr	%o0,	%o5,	%pil
	subccc	%l6,	%o6,	%l1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	fbo,a	%fcc3,	loop_52
	wr	%i4,	%i7,	%y
	movneg	%icc,	%g6,	%l3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x1F6, 	%hsys_tick_cmpr
loop_52:
	rd	%softint,	%i5
	rdhpr	%hintp,	%o3
	array8	%i0,	%o1,	%g1
	rd	%y,	%i3
	rd	%softint,	%g4
	movl	%icc,	%i1,	%g3
	rd	%fprs,	%l5
	xor	%i2,	0x1E35,	%g5
	wr 	%g0, 	0x4, 	%fprs
	movne	%icc,	%l4,	%g7
	bl	%icc,	loop_53
	xnor	%g2,	0x04D6,	%o0
	wrpr	%o2,	0x0717,	%pil
	fmovsvs	%icc,	%f24,	%f22
loop_53:
	rd	%tick_cmpr,	%l6
	rd	%asi,	%o5
	fxnor	%f24,	%f18,	%f14
	movleu	%xcc,	%o6,	%l0
	rd	%asi,	%o4
	edge32n	%i4,	%i7,	%l1
	wr	%g6,	%o7,	%set_softint

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	movvc	%xcc,	%i5,	%o3
	wr	%i0,	0x1A06,	%y
	alignaddr	%o1,	%g1,	%i3
	fsrc1	%f14,	%f12
	smulcc	%g4,	%i1,	%l5
	rd	%tick_cmpr,	%i2
	rdhpr	%hintp,	%g3
	brnz	%g5,	loop_54
	fzeros	%f20
	wr	%l4,	%i6,	%sys_tick
	edge16n	%g7,	%o0,	%g2
loop_54:
	bpos	%xcc,	loop_55
	rd	%asi,	%l6
	rd	%sys_tick_cmpr,	%o5
	bcc,a,pt	%xcc,	loop_56
loop_55:
	fmovdge	%icc,	%f26,	%f29
	edge16ln	%o2,	%l0,	%o6
	wrpr	%o4,	0x17F4,	%tick
loop_56:
	subccc	%i7,	%l1,	%g6
	and	%o7,	%l2,	%i4
	ldd	[%l7 + 0x50],	%i4
	rd	%fprs,	%l3
	rdpr	%cleanwin,	%i0
	tn	%icc,	0x2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%otherwin,	%g1
	rdhpr	%hsys_tick_cmpr,	%o3
	rdhpr	%hpstate,	%i3
	rdpr	%pil,	%g4
	fornot1s	%f8,	%f16,	%f28
	rdhpr	%htba,	%l5
	rdpr	%cwp,	%i1
	rdhpr	%htba,	%i2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wrpr	%g5,	0x1328,	%pil
	rd	%pc,	%g3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	andcc	%o0,	%g2,	%l6
	fcmpd	%fcc1,	%f28,	%f28
	smulcc	%g7,	0x1287,	%o2
	wr	%l0,	0x0485,	%sys_tick
	be,pt	%xcc,	loop_57
	wr	%o5,	%o4,	%pic
	fmul8ulx16	%f18,	%f16,	%f24
	movrgz	%o6,	%l1,	%g6
loop_57:
	movvc	%icc,	%i7,	%o7
	rd	%sys_tick_cmpr,	%l2
	wr	%i4,	%i5,	%y
	udiv	%l3,	0x106F,	%o1
	rdhpr	%hsys_tick_cmpr,	%g1
	nop
	setx	loop_58,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	addcc	%o3,	%i3,	%i0
	fzero	%f4
	rd	%ccr,	%l5
loop_58:
	wrpr	%i1,	%g4,	%tick
	sll	%g5,	0x12,	%i2
	bgu	%xcc,	loop_59
	rdpr	%gl,	%g3
	wrpr	%l4,	%o0,	%tick
	movcc	%xcc,	%i6,	%l6
loop_59:
	wrpr	%g2,	0x02F5,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x123, 	%hsys_tick_cmpr
	wr 	%g0, 	0x5, 	%fprs
	movrne	%o4,	%o5,	%o6
	fornot1s	%f13,	%f13,	%f1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x95E, 	%hsys_tick_cmpr
	edge32n	%o7,	%l2,	%i4
	taddcc	%g6,	0x17FC,	%l3
	bvc,pt	%icc,	loop_60
	wrpr	%i5,	%o1,	%tick
	wrpr	%o3,	%i3,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_60:
	wrpr	%l5,	0x1F52,	%cwp
	wrpr	%g4,	%g5,	%tick
	wrpr	%i2,	%g3,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xFD5, 	%hsys_tick_cmpr
	subc	%o0,	0x1767,	%l6
	rd	%sys_tick_cmpr,	%g2
	edge32	%o2,	%i6,	%g7
	tleu	%xcc,	0x3
	rdhpr	%hsys_tick_cmpr,	%l0
	rdpr	%otherwin,	%o4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x2A8, 	%tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x626, 	%hsys_tick_cmpr
	wr	%l2,	0x15F2,	%set_softint
	andcc	%i4,	0x1DE5,	%g6
	addc	%l3,	%o6,	%o1
	rdhpr	%hintp,	%o3
	tleu	%xcc,	0x7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x6D3, 	%hsys_tick_cmpr
	rd	%ccr,	%g1
	andncc	%i0,	%g4,	%g5
	fmuld8ulx16	%f15,	%f6,	%f6
	fmovdge	%icc,	%f28,	%f31

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xF07, 	%hsys_tick_cmpr
	rd	%asi,	%g3
	wrpr	%l6,	%o0,	%pil
	nop
	set	0x68, %o6
	stx	%g2,	[%l7 + %o6]
	rdpr	%gl,	%o2
	rdpr	%pil,	%i6
	wr	%l0,	%o4,	%sys_tick
	wrpr	%g7,	0x1B96,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xC37, 	%hsys_tick_cmpr
	rd	%sys_tick_cmpr,	%i7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x520, 	%hsys_tick_cmpr
	wrpr	%i4,	0x0A21,	%pil
	edge16	%g6,	%l3,	%o6
	fbge	%fcc0,	loop_61
	fbule,a	%fcc0,	loop_62
	wr 	%g0, 	0x4, 	%fprs
	fmul8x16au	%f23,	%f26,	%f2
loop_61:
	fbge,a	%fcc2,	loop_63
loop_62:
	rdpr	%pil,	%o3
	wr	%i3,	%i5,	%sys_tick
	rdhpr	%htba,	%g1
loop_63:
	wr	%o7,	0x0560,	%y
	wr	%g0,	0x19,	%asi
	lduha	[%l7 + 0x18] %asi,	%g4
	rdhpr	%htba,	%g5
	sra	%i0,	%l5,	%i2
	rdpr	%pil,	%i1
	rd	%ccr,	%g3
	rdhpr	%hintp,	%l4
	rdhpr	%hpstate,	%l6
	addc	%o0,	%o2,	%i6
	rd	%pc,	%g2
	ld	[%l7 + 0x44],	%f22
	tneg	%icc,	0x1
	wr	%o4,	0x0527,	%ccr
	wrpr	%g7,	%l1,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x553, 	%hsys_tick_cmpr
	rd	%sys_tick_cmpr,	%l2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xFB2, 	%sys_tick_cmpr
	wrpr	%g6,	%o6,	%pil
	fnors	%f15,	%f15,	%f22
	rdpr	%cleanwin,	%o1
	tl	%xcc,	0x3
	wr	%g0,	0x80,	%asi
	ldda	[%l7 + 0x30] %asi,	%l2
	fandnot2s	%f17,	%f30,	%f0
	rd	%ccr,	%o3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	sdivx	%o7,	0x0D8B,	%g1
	udivcc	%g5,	0x018B,	%i0
	add	%l5,	%g4,	%i1
	rd	%pc,	%i2
	rdhpr	%hsys_tick_cmpr,	%l4
	stbar
	set	0x7A, %g7
	ldsha	[%l7 + %g7] 0x81,	%g3
	rdhpr	%hsys_tick_cmpr,	%o0
	tl	%xcc,	0x1
	edge16l	%o2,	%i6,	%g2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	ldd	[%l7 + 0x40],	%i6
	flush	%l7 + 0x70
	wr 	%g0, 	0x5, 	%fprs
	rdhpr	%hpstate,	%o5
	rdpr	%cansave,	%l2
	movrne	%i4,	0x161,	%i7
	rdpr	%pil,	%l0
	rdhpr	%htba,	%g6
	set	0x1C, %i2
	ldswa	[%l7 + %i2] 0x14,	%o1
	sub	%l3,	%o3,	%o6
	rd	%sys_tick_cmpr,	%i3
	fnors	%f26,	%f31,	%f8
	rdpr	%pil,	%i5
	wr	%o7,	0x0F26,	%pic
	rdhpr	%hsys_tick_cmpr,	%i0
	rd	%y,	%g4
	rdpr	%cleanwin,	%l5
	andn	%i2,	0x0711,	%l4
	smul	%i1,	0x0876,	%g3
	ldd	[%l7 + 0x78],	%f14
	rd	%ccr,	%o2
	rdhpr	%hintp,	%o0
	rdpr	%canrestore,	%i6
	rdhpr	%hintp,	%o4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x804, 	%hsys_tick_cmpr
	wrpr	%g2,	0x0CF8,	%tick
	nop
	set	0x78, %i6
	ldx	[%l7 + %i6],	%g7
	sdiv	%o5,	0x088C,	%l1
	rdhpr	%htba,	%i4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wrpr	%l2,	0x0E27,	%pil
	rdhpr	%hsys_tick_cmpr,	%i7
	rdpr	%canrestore,	%g6
	wrpr	%o1,	0x08FF,	%tick
	rdhpr	%hintp,	%l0
	wrpr	%o3,	%l3,	%pil
	rdhpr	%hintp,	%o6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	smulcc	%i3,	%g5,	%o7
	nop
	set	0x28, %g4
	std	%f10,	[%l7 + %g4]
	wrpr	%i0,	%l5,	%pil
	movre	%i2,	%l4,	%i1
	wrpr	%g4,	%g3,	%tick
	rdhpr	%hintp,	%o2
	rdhpr	%htba,	%i6
	edge16l	%o0,	%l6,	%o4
	rdpr	%gl,	%g7
	rdhpr	%hintp,	%g2
	nop
	set	0x6C, %o0
	sth	%o5,	[%l7 + %o0]

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	edge16ln	%l1,	%i7,	%o1
	rdpr	%tba,	%l0
	bleu,a	%icc,	loop_64
	wr	%g6,	%o3,	%clear_softint
	tsubcctv	%o6,	%i5,	%l3
	movre	%g1,	0x155,	%i3
loop_64:
	wr	%g5,	0x115C,	%y
	fandnot1s	%f31,	%f26,	%f25

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	edge32ln	%i2,	%l5,	%i1
	rdpr	%cwp,	%l4
	sir	0x0CA1
	tne	%xcc,	0x7
	rd	%sys_tick_cmpr,	%g4
	brlez	%g3,	loop_65
	fnot1s	%f24,	%f1
	fpadd16	%f2,	%f8,	%f8
	wrpr	%i6,	%o0,	%tick
loop_65:
	edge8n	%o2,	%l6,	%g7
	wr	%g2,	%o5,	%ccr
	movne	%xcc,	%i4,	%l2
	rdpr	%otherwin,	%l1
	tn	%icc,	0x0
	fcmpne32	%f22,	%f14,	%o4
	set	0x68, %l3
	prefetcha	[%l7 + %l3] 0x81,	 0x1
	be,a	loop_66
	rdpr	%pil,	%o1
	wr 	%g0, 	0x4, 	%fprs
	edge32ln	%o6,	%i5,	%l3
loop_66:
	fxnor	%f4,	%f16,	%f14
	alignaddrl	%g1,	%g6,	%i3
	rd	%fprs,	%o7
	tne	%xcc,	0x2
	bcs	loop_67
	movle	%icc,	%g5,	%i2
	wr	%l5,	%i0,	%ccr
	tcs	%icc,	0x1
loop_67:
	rdhpr	%hsys_tick_cmpr,	%i1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xB80, 	%hsys_tick_cmpr
	rd	%softint,	%i6
	rdpr	%otherwin,	%g3
	wrpr	%o0,	%o2,	%tick
	alignaddr	%l6,	%g2,	%g7
	rdhpr	%hsys_tick_cmpr,	%o5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xE22, 	%hsys_tick_cmpr
	rd	%asi,	%l2
	rd	%sys_tick_cmpr,	%o4
	rdhpr	%htba,	%i7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%cansave,	%l0
	umulcc	%o3,	0x1D76,	%l1
	be,a	loop_68
	rdhpr	%hpstate,	%i5
	fmovrsgez	%l3,	%f30,	%f10
	rdpr	%cleanwin,	%g1
loop_68:
	sub	%o6,	%g6,	%i3
	nop
	setx	loop_69,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fmovspos	%icc,	%f28,	%f14
	wr	%g0,	0x18,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
loop_69:
	wrpr	%g5,	%o7,	%tick
	edge8ln	%l5,	%i0,	%i1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%pc,	%i2
	rdpr	%tba,	%l4
	wrpr	%g3,	%o0,	%pil
	sub	%i6,	0x0DC8,	%o2
	wr	%g2,	%g7,	%y
	wrpr	%o5,	0x1DF4,	%tick
	wrpr	%l6,	%l2,	%tick
	movrne	%i4,	%i7,	%o4
	wr	%o1,	%o3,	%y
	rdhpr	%htba,	%l1
	srlx	%i5,	%l3,	%g1
	movrne	%o6,	%g6,	%i3
	wrpr	%l0,	0x0718,	%tick
	wr	%g5,	%o7,	%set_softint
	tgu	%xcc,	0x2
	rdhpr	%htba,	%l5
	rd	%ccr,	%i0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x7DC, 	%sys_tick_cmpr
	smulcc	%o0,	0x150C,	%i6
	fmovsgu	%icc,	%f5,	%f4
	sdivx	%o2,	0x0344,	%i2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	lduw	[%l7 + 0x08],	%g7
	fbue	%fcc3,	loop_70
	rdhpr	%hintp,	%l6
	rd	%ccr,	%l2
	rd	%y,	%o5
loop_70:
	rd	%ccr,	%i4
	srlx	%o4,	0x11,	%o1
	fpadd16s	%f17,	%f5,	%f5
	edge32	%o3,	%l1,	%i7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	swap	[%l7 + 0x18],	%o6
	fmovdl	%xcc,	%f27,	%f8
	rdpr	%tl,	%g6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xEAC, 	%hsys_tick_cmpr
	rdpr	%wstate,	%l0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%hintp,	%l5
	rdpr	%gl,	%i1
	tn	%xcc,	0x0
	taddcc	%g4,	%l4,	%g3
	rd	%pc,	%i0
	movl	%icc,	%o0,	%o2
	alignaddrl	%i6,	%i2,	%g7
	wrpr	%l6,	%l2,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	srax	%o4,	%i4,	%o1
	rdhpr	%hsys_tick_cmpr,	%o3
	rdpr	%cleanwin,	%l1
	fblg	%fcc3,	loop_71
	movne	%xcc,	%l3,	%i7
	rdpr	%gl,	%o6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_71:
	rdhpr	%hpstate,	%g6
	xorcc	%l0,	0x06B5,	%o7
	prefetch	[%l7 + 0x7C],	 0x2
	wrpr	%g1,	0x1663,	%tick
	set	0x7E, %i1
	ldsba	[%l7 + %i1] 0x0c,	%g5
	andcc	%l5,	%i1,	%l4
	rdhpr	%hsys_tick_cmpr,	%g4
	rdhpr	%hintp,	%i0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	ldx	[%l7 + 0x70],	%i6
	movl	%xcc,	%o2,	%i2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xAB7, 	%hsys_tick_cmpr
	movrlz	%l2,	0x067,	%g7
	wrpr	%g2,	0x0EB9,	%tick
	rdhpr	%hsys_tick_cmpr,	%o4
	add	%l7,	0x18,	%l6
	wr	%g0,	0x0c,	%asi
	casxa	[%l6] %asi,	%i4,	%o5
	rd	%sys_tick_cmpr,	%o3
	movrgz	%l1,	%o1,	%l3
	rdpr	%gl,	%i7
	rdhpr	%hsys_tick_cmpr,	%i5
	wrpr	%o6,	0x0E83,	%tick
	wr 	%g0, 	0x4, 	%fprs
	wr	%g6,	%o7,	%pic
	orncc	%l0,	%g1,	%g5
	rd	%softint,	%i1
	mulscc	%l4,	0x05CA,	%l5
	rd	%asi,	%g4
	fnegs	%f31,	%f25
	subccc	%i0,	0x09F1,	%o0
	wrpr	%g3,	0x1EAB,	%pil
	rdpr	%cleanwin,	%o2
	fmovspos	%xcc,	%f15,	%f14
	tvs	%icc,	0x3
	andncc	%i6,	%l6,	%l2
	alignaddr	%i2,	%g2,	%o4
	fmovdvs	%xcc,	%f20,	%f16
	rdpr	%tba,	%g7
	rdhpr	%hsys_tick_cmpr,	%i4
	subccc	%o3,	0x18FD,	%o5
	wrpr	%l1,	%l3,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x79C, 	%hsys_tick_cmpr
	wr	%o6,	%i3,	%sys_tick
	edge16l	%o1,	%g6,	%l0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x923, 	%tick_cmpr
	rdpr	%cleanwin,	%o7
	sll	%i1,	0x06,	%l4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xD4B, 	%hsys_tick_cmpr
	wrpr	%i0,	%l5,	%cwp
	set	0x68, %o7
	stwa	%g3,	[%l7 + %o7] 0xea
	membar	#Sync
	ble	%xcc,	loop_72
	wr	%o2,	%i6,	%y
	fmuld8ulx16	%f31,	%f18,	%f28
	rdpr	%cansave,	%l6
loop_72:
	wrpr	%l2,	%i2,	%pil
	edge32l	%o0,	%o4,	%g7
	rdhpr	%htba,	%g2
	tpos	%xcc,	0x5
	rdpr	%tl,	%o3
	ldsh	[%l7 + 0x26],	%i4
	nop
	setx loop_73, %l0, %l1
	jmpl %l1, %o5
	rdpr	%tba,	%l3
	wr	%i7,	%i5,	%sys_tick
	fbul	%fcc3,	loop_74
loop_73:
	rd	%sys_tick_cmpr,	%o6
	rdhpr	%hpstate,	%i3
	edge8	%l1,	%g6,	%l0
loop_74:
	fmovdcc	%xcc,	%f19,	%f10
	edge32n	%o1,	%g1,	%o7
	wrpr	%g5,	%i1,	%pil
	rdhpr	%htba,	%g4
	rdpr	%otherwin,	%g3
	fnands	%f30,	%f9,	%f25
	stx	%l5,	[%l7 + 0x10]
	fsrc1s	%f10,	%f20
	sethi	0x0B46,	%i6
	rdpr	%wstate,	%l6
	fbu,a	%fcc2,	loop_75
	rd	%asi,	%o2
	rdpr	%gl,	%i2
loop_75:
	array8	%o4,	%l2,	%g7
	edge32ln	%o3,	%g2,	%i4
	rdpr	%wstate,	%o5
	tn	%xcc,	0x1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xA3E, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fbu	%fcc1,	loop_76
	wrpr	%o6,	%i3,	%pil
	fbule	%fcc1,	loop_77
	wrpr	%i5,	0x088D,	%pil
loop_76:
	rdhpr	%hintp,	%g6
	wrpr	%l0,	0x1ED5,	%pil
loop_77:
	wr	%o1,	0x0910,	%sys_tick
	fbug	%fcc2,	loop_78
	rd	%ccr,	%l1
	add	%g1,	%o7,	%i1
	wrpr	%g4,	0x1005,	%tick
loop_78:
	wrpr	%g5,	%i0,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x38D, 	%hsys_tick_cmpr
	rdpr	%gl,	%l5
	movrne	%i6,	0x2DC,	%o2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%cwp,	%i2
	wrpr	%l2,	0x04D7,	%tick
	rd	%fprs,	%o3
	rdhpr	%hpstate,	%g2
	fmovrsgez	%i4,	%f19,	%f14
	rdpr	%cansave,	%g7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x61E, 	%hsys_tick_cmpr
	rd	%ccr,	%o6
	wr	%l3,	%i3,	%pic
	set	0x54, %i5
	lda	[%l7 + %i5] 0x88,	%f12
	te	%icc,	0x2
	fandnot2	%f30,	%f14,	%f20
	prefetch	[%l7 + 0x40],	 0x3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xBA4, 	%hsys_tick_cmpr
	membar	0x69
	brgz	%l0,	loop_79
	rdpr	%tba,	%o1
	mulscc	%l1,	0x0086,	%o7
	rdhpr	%hintp,	%i1
loop_79:
	movge	%icc,	%g4,	%g1
	rdhpr	%hintp,	%g5
	brlz	%i0,	loop_80
	fbn,a	%fcc3,	loop_81
	nop
	setx	loop_82,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	rd	%ccr,	%g3
loop_80:
	wrpr	%l4,	0x1126,	%cwp
loop_81:
	bvs,a,pn	%icc,	loop_83
loop_82:
	st	%f8,	[%l7 + 0x64]
	or	%i6,	0x0168,	%l5
	sdivx	%o2,	0x0C25,	%l6
loop_83:
	be	%icc,	loop_84
	wr	%o0,	0x0AC0,	%pic
	fbe,a	%fcc1,	loop_85
	fbule	%fcc2,	loop_86
loop_84:
	ldsw	[%l7 + 0x68],	%i2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x66E, 	%hsys_tick_cmpr
loop_85:
	move	%xcc,	%o3,	%g2
loop_86:
	fbug,a	%fcc2,	loop_87
	wrpr	%g7,	0x0045,	%pil
	rd	%asi,	%i4
	rdhpr	%hpstate,	%i7
loop_87:
	rd	%softint,	%o5
	movrlez	%o6,	0x3AA,	%l3
	wr 	%g0, 	0x5, 	%fprs
	xnorcc	%i5,	%i3,	%l0
	rdhpr	%hsys_tick_cmpr,	%o1
	fcmpeq16	%f30,	%f18,	%l1
	rd	%y,	%o7
	fandnot2s	%f12,	%f26,	%f17
	tcc	%xcc,	0x1
	wr	%g4,	0x1BCE,	%pic
	ta	%icc,	0x0
	rdpr	%gl,	%g1
	wrpr	%g5,	0x196E,	%pil
	rdhpr	%hintp,	%i1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x30F, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fones	%f7
	bleu,a	%xcc,	loop_88
	wr	%o2,	0x0580,	%ccr
	ldsw	[%l7 + 0x40],	%l6
	set	0x40, %g6
	ldda	[%l7 + %g6] 0x04,	%f0
loop_88:
	rd	%asi,	%o0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%wstate,	%l4
	brgez	%l2,	loop_89
	rd	%fprs,	%o3
	fpsub32s	%f8,	%f25,	%f28
	movcs	%icc,	%g2,	%o4
loop_89:
	udiv	%g7,	0x0DB2,	%i7
	rd	%tick_cmpr,	%i4
	fmovrslez	%o6,	%f18,	%f25
	xor	%o5,	0x1911,	%l3
	fnors	%f31,	%f10,	%f19
	rdpr	%canrestore,	%i5
	fba,a	%fcc0,	loop_90
	wrpr	%g6,	0x13B1,	%tick
	wrpr	%l0,	%o1,	%pil
	rdhpr	%hpstate,	%i3
loop_90:
	smul	%o7,	0x1202,	%l1
	stbar
	wrpr	%g4,	%g1,	%tick
	wr	%i1,	%g3,	%pic
	nop
	set	0x50, %l4
	sth	%g5,	[%l7 + %l4]
	rdhpr	%htba,	%i0
	wr	%l5,	%o2,	%ccr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x315, 	%hsys_tick_cmpr
	ldstub	[%l7 + 0x51],	%i2
	rdhpr	%htba,	%i6
	rd	%pc,	%l2
	movcs	%xcc,	%l4,	%g2
	fmovsle	%xcc,	%f10,	%f14
	rdhpr	%hsys_tick_cmpr,	%o3
	rdpr	%canrestore,	%g7
	umul	%i7,	%i4,	%o4
	rdpr	%tba,	%o5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%o6,	%i5,	%pil
	xorcc	%g6,	%l0,	%o1
	rdpr	%gl,	%o7
	srl	%l1,	0x07,	%g4
	fble	%fcc2,	loop_91
	tn	%xcc,	0x3
	sth	%g1,	[%l7 + 0x5E]
	rdpr	%wstate,	%i1
loop_91:
	subcc	%i3,	%g5,	%g3
	udivx	%i0,	0x1698,	%l5
	stbar
	wrpr	%o2,	0x1AD4,	%tick
	xorcc	%o0,	0x18FA,	%l6
	edge32ln	%i2,	%l2,	%i6
	wr	%g2,	0x1A57,	%ccr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	wrpr	%g7,	0x1FBD,	%tick
	edge8l	%i7,	%o4,	%o5
	wr	%l3,	0x0665,	%set_softint
	smul	%i4,	0x0BF4,	%i5
	sll	%g6,	0x09,	%o6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x751, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xBF0, 	%hsys_tick_cmpr
	wr	%i1,	%g1,	%set_softint
	popc	0x1651,	%i3
	rdpr	%otherwin,	%g3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	andcc	%o2,	%l5,	%o0
	edge8ln	%l6,	%l2,	%i6
	set	0x6E, %g5
	stha	%g2,	[%l7 + %g5] 0x15
	wrpr	%i2,	0x12FD,	%pil
	fbule	%fcc0,	loop_92
	wr	%o3,	0x1B21,	%ccr
	fmul8ulx16	%f12,	%f8,	%f26
	tpos	%xcc,	0x1
loop_92:
	or	%l4,	0x1CD7,	%i7
	wr	%g7,	0x0B7B,	%y
	fpack16	%f28,	%f26
	fmovdpos	%xcc,	%f14,	%f6
	add	%l7,	0x10,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%o5
	casxa	[%l6] %asi,	%o5,	%l3
	rdpr	%gl,	%i4
	rdhpr	%hintp,	%o4
	movrlez	%g6,	%i5,	%o6
	wr	%l0,	0x1CB1,	%sys_tick
	edge8ln	%g4,	%o7,	%g1
	wr	%i3,	%g3,	%softint
	wr	%i1,	0x1FE6,	%set_softint
	rdpr	%tl,	%i0
	wrpr	%o2,	%l5,	%tick
	rdpr	%cleanwin,	%o0
	rdpr	%pil,	%g5
	wrpr	%l6,	%i6,	%tick
	wrpr	%l2,	0x0DC6,	%cwp
	fbl,a	%fcc3,	loop_93
	rd	%sys_tick_cmpr,	%i2
	wrpr	%o3,	%l4,	%tick
	sethi	0x1873,	%i7
loop_93:
	mulscc	%g7,	%o5,	%l3
	edge16n	%i4,	%o4,	%g6
	wr	%i5,	0x0EF0,	%sys_tick
	rd	%tick_cmpr,	%o6
	edge16ln	%o1,	%g2,	%l0
	wr 	%g0, 	0x7, 	%fprs
	fba	%fcc0,	loop_94
	fnot2	%f30,	%f12
	mulscc	%g1,	%l1,	%g3
	smul	%i1,	%i0,	%i3
loop_94:
	orcc	%o2,	0x0DF9,	%l5
	rdhpr	%htba,	%o0
	fornot2s	%f10,	%f10,	%f20
	array8	%g5,	%i6,	%l6
	wr	%g0,	0x10,	%asi
	lduba	[%l7 + 0x60] %asi,	%l2
	rdhpr	%htba,	%i7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%tba,	%o5
	rdhpr	%hpstate,	%l4
	rdhpr	%htba,	%i4
	rdhpr	%hintp,	%o4
	rdhpr	%htba,	%g6
	rdpr	%otherwin,	%i5
	wr	%l3,	%o6,	%sys_tick
	bl,a,pn	%xcc,	loop_95
	movcc	%icc,	%o1,	%g2
	movleu	%xcc,	%l0,	%g4
	wrpr	%o7,	%g1,	%tick
loop_95:
	rdhpr	%hpstate,	%g3
	rdpr	%wstate,	%l1
	brgez,a	%i1,	loop_96
	rdpr	%pil,	%i3
	rd	%tick_cmpr,	%o2
	fmovdvc	%icc,	%f4,	%f8
loop_96:
	rdpr	%tba,	%i0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%hpstate,	%o0
	movrgez	%i6,	%g5,	%l6
	alignaddrl	%l2,	%o3,	%i2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fbe	%fcc3,	loop_97
	fbg	%fcc3,	loop_98
	subcc	%i7,	0x0DDA,	%o5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xBAB, 	%hsys_tick_cmpr
loop_97:
	subcc	%g6,	%i5,	%o4
loop_98:
	edge8l	%l3,	%o6,	%o1
	taddcctv	%l0,	0x0C30,	%g2
	rdhpr	%htba,	%g4
	fcmpd	%fcc1,	%f8,	%f10
	rdhpr	%hpstate,	%o7
	xor	%g3,	0x1B3F,	%g1
	wr	%i1,	0x07F3,	%softint
	rd	%y,	%l1
	add	%l7,	0x4C,	%l6
	wr	%g0,	0x0c,	%asi
	casa	[%l6] 0x0c,	%o2,	%i0
	rd	%asi,	%i3
	edge32ln	%l5,	%i6,	%o0
	fmuld8ulx16	%f18,	%f12,	%f6
	udivx	%l6,	0x1DA6,	%g5
	edge32ln	%o3,	%i2,	%l2
	tle	%xcc,	0x0
	wrpr	%i7,	0x1021,	%tick
	orncc	%o5,	%l4,	%g7
	rdpr	%tl,	%i4
	rd	%pc,	%i5
	wrpr	%o4,	%g6,	%cwp
	rdpr	%gl,	%l3
	sll	%o1,	%o6,	%l0
	tsubcc	%g4,	%o7,	%g3
	rdhpr	%hpstate,	%g1
	rdpr	%canrestore,	%i1
	bge,a,pt	%xcc,	loop_99
	rd	%y,	%l1
	fble,a	%fcc3,	loop_100
	wrpr	%g2,	0x1E5E,	%pil
loop_99:
	movcc	%xcc,	%i0,	%o2
	rdpr	%tl,	%i3
loop_100:
	rd	%ccr,	%l5
	rd	%y,	%o0
	tl	%icc,	0x5
	wrpr	%l6,	%g5,	%cwp
	sethi	0x0E69,	%o3
	fpackfix	%f20,	%f19
	tcs	%xcc,	0x7
	tg	%icc,	0x5
	rdpr	%cleanwin,	%i6
	sir	0x16F2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x1D4, 	%hsys_tick_cmpr
	array8	%o5,	%l4,	%g7
	wrpr	%i4,	%l2,	%tick
	smulcc	%o4,	%g6,	%i5
	nop
	setx	loop_101,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	rdhpr	%hsys_tick_cmpr,	%o1
	rd	%sys_tick_cmpr,	%o6
	fcmped	%fcc0,	%f4,	%f22
loop_101:
	rdhpr	%htba,	%l0
	rdhpr	%hintp,	%g4
	brgez,a	%l3,	loop_102
	wr	%o7,	0x079C,	%sys_tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x32B, 	%sys_tick_cmpr
	rd	%pc,	%i1
loop_102:
	edge32n	%l1,	%g3,	%g2
	rdpr	%wstate,	%o2
	movrlz	%i0,	0x26F,	%l5
	fbg,a	%fcc3,	loop_103
	rd	%sys_tick_cmpr,	%i3
	fmovsvc	%icc,	%f18,	%f5
	fmovdgu	%xcc,	%f16,	%f17
loop_103:
	movre	%l6,	0x10A,	%g5
	wr	%o0,	%o3,	%sys_tick
	alignaddrl	%i6,	%i2,	%i7
	wrpr	%o5,	0x0C16,	%pil
	brnz,a	%l4,	loop_104
	edge16ln	%g7,	%l2,	%o4
	fcmpne16	%f16,	%f24,	%i4
	edge16l	%i5,	%g6,	%o6
loop_104:
	wr	%o1,	%l0,	%pic
	wr	%l3,	0x1B47,	%sys_tick
	move	%icc,	%o7,	%g4
	edge32	%g1,	%l1,	%g3
	fmovsge	%icc,	%f18,	%f24
	movne	%xcc,	%i1,	%o2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	edge16l	%i0,	%i3,	%l5
	rdhpr	%hintp,	%l6
	wr	%g0,	0x19,	%asi
	prefetcha	[%l7 + 0x10] %asi,	 0x1
	wr 	%g0, 	0x4, 	%fprs
	set	0x78, %l2
	sta	%f30,	[%l7 + %l2] 0x14
	rdhpr	%hsys_tick_cmpr,	%i2
	wrpr	%i7,	0x0304,	%cwp
	movgu	%icc,	%o5,	%o3
	andn	%g7,	0x1BA5,	%l2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xF1A, 	%hsys_tick_cmpr
	wr	%i4,	0x0F4B,	%set_softint
	set	0x48, %o4
	lduha	[%l7 + %o4] 0x81,	%i5
	rdpr	%wstate,	%o4
	udiv	%g6,	0x0267,	%o1
	rdpr	%cwp,	%l0
	rd	%asi,	%o6
	rdhpr	%hsys_tick_cmpr,	%l3
	fmovrsgez	%o7,	%f10,	%f26

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x314, 	%hsys_tick_cmpr
	ta	%xcc,	0x2
	movge	%xcc,	%l1,	%i1
	wr	%g3,	0x0577,	%softint
	wr	%o2,	0x02DC,	%softint
	movcc	%icc,	%i0,	%g2
	rd	%softint,	%l5
	movcs	%icc,	%l6,	%i3
	rd	%pc,	%g5
	fsrc2s	%f6,	%f6
	rd	%pc,	%i6
	fxnor	%f10,	%f16,	%f20

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x76A, 	%hsys_tick_cmpr
	rdhpr	%hintp,	%i7
	wr	%o5,	%g7,	%y

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	rdhpr	%htba,	%l4
	wrpr	%o3,	%i4,	%tick
	addcc	%o4,	0x0904,	%g6
	wrpr	%o1,	0x024D,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x650, 	%hsys_tick_cmpr
	orncc	%l0,	%l3,	%g1
	movvs	%xcc,	%o7,	%l1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xE89, 	%hsys_tick_cmpr
	rd	%ccr,	%i1
	fornot1	%f22,	%f12,	%f8

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xB8D, 	%hsys_tick_cmpr
	sdivx	%g2,	0x098B,	%l5
	rdhpr	%htba,	%o2
	rdhpr	%htba,	%l6
	sra	%g5,	%i6,	%i3
	movgu	%xcc,	%o0,	%i2
	alignaddr	%i7,	%g7,	%l2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x27E, 	%hsys_tick_cmpr
	wr	%o3,	%i4,	%pic
	subccc	%l4,	0x1DDD,	%g6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	orcc	%i5,	%o6,	%l0
	popc	0x17D6,	%o1
	sethi	0x01AC,	%g1
	set	0x41, %o2
	stba	%o7,	[%l7 + %o2] 0x04
	movle	%icc,	%l3,	%g4
	movrgez	%i1,	%g3,	%i0
	rd	%ccr,	%l1
	sdivcc	%l5,	0x1E4F,	%g2
	fbo,a	%fcc1,	loop_105
	rd	%pc,	%l6
	rd	%tick_cmpr,	%g5
	rd	%asi,	%o2
loop_105:
	orncc	%i3,	0x0AB9,	%o0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x0DC, 	%hsys_tick_cmpr
	rdpr	%tl,	%g7
	array16	%l2,	%i7,	%o5
	wrpr	%i4,	%l4,	%pil
	rd	%ccr,	%o3
	sub	%o4,	%i5,	%g6
	sll	%l0,	0x04,	%o6
	rd	%ccr,	%o1
	sdiv	%o7,	0x05A4,	%l3
	movre	%g1,	0x33D,	%i1
	tvs	%icc,	0x1
	rdpr	%gl,	%g4
	wr 	%g0, 	0x4, 	%fprs
	wrpr	%g3,	0x0852,	%cwp
	fmovdpos	%icc,	%f2,	%f25

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g2,	0x0B0A,	%y
	andncc	%g5,	%o2,	%i3
	brlz	%o0,	loop_106
	wrpr	%l6,	%i6,	%tick
	rdpr	%tba,	%i2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_106:
	rd	%y,	%l2
	sdiv	%o5,	0x15DA,	%i7
	rd	%pc,	%l4
	rdpr	%tl,	%i4
	wrpr	%o4,	0x0162,	%cwp
	rdpr	%tl,	%i5
	wrpr	%o3,	%g6,	%tick
	fbne	%fcc2,	loop_107
	rdpr	%cansave,	%l0
	wr 	%g0, 	0x5, 	%fprs
	xnorcc	%o1,	0x1F95,	%g1
loop_107:
	rdhpr	%hpstate,	%i1
	rdpr	%tba,	%g4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fcmped	%fcc2,	%f18,	%f14
	movne	%xcc,	%l1,	%l5
	wr	%g2,	0x02EA,	%pic
	wr	%g3,	0x0312,	%sys_tick
	rd	%fprs,	%o2
	brgez	%g5,	loop_108
	wrpr	%i3,	%l6,	%pil
	bvs,a,pt	%icc,	loop_109
	rdpr	%wstate,	%i6
loop_108:
	rdpr	%cwp,	%i2
	wr	%g7,	0x1C8E,	%set_softint
loop_109:
	rdhpr	%hintp,	%l2
	wr	%o0,	%o5,	%clear_softint
	rd	%softint,	%l4
	wrpr	%i4,	%i7,	%pil
	wr	%i5,	%o3,	%ccr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xA1B, 	%hsys_tick_cmpr
	rdhpr	%htba,	%g6
	rd	%pc,	%l0
	rdhpr	%hpstate,	%o6
	rdhpr	%hsys_tick_cmpr,	%o1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x0C5, 	%hsys_tick_cmpr
	wr 	%g0, 	0x4, 	%fprs
	movleu	%xcc,	%g1,	%l3
	rdhpr	%hsys_tick_cmpr,	%l1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	tvs	%icc,	0x2
	rdhpr	%hintp,	%i0
	wr	%g0,	0x89,	%asi
	ldsba	[%l7 + 0x2F] %asi,	%g2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xBBC, 	%hsys_tick_cmpr
	rdhpr	%hintp,	%g5
	rd	%fprs,	%g3
	bg,pt	%icc,	loop_110
	alignaddrl	%l6,	%i6,	%i2
	fsrc1s	%f28,	%f5
	rdpr	%gl,	%g7
loop_110:
	udiv	%i3,	0x0A35,	%o0
	rdhpr	%hpstate,	%l2
	array16	%l4,	%i4,	%o5
	tn	%icc,	0x7
	wrpr	%i7,	%i5,	%cwp
	fbule,a	%fcc1,	loop_111
	ble,a	%icc,	loop_112
	rdhpr	%hintp,	%o3
	rd	%sys_tick_cmpr,	%g6
loop_111:
	mulx	%l0,	0x1666,	%o4
loop_112:
	rdhpr	%hpstate,	%o1
	smul	%o7,	%i1,	%o6
	movrlz	%g1,	%g4,	%l1
	fmovs	%f26,	%f4
	rdhpr	%hintp,	%l3
	rdpr	%cwp,	%i0
	rdpr	%otherwin,	%l5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	movle	%icc,	%g5,	%o2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xB6A, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	alignaddrl	%i2,	%i3,	%o0
	tpos	%xcc,	0x2
	bneg,a	%icc,	loop_113
	rdhpr	%htba,	%l2
	wr	%l4,	%o5,	%sys_tick
	rd	%asi,	%i4
loop_113:
	wr	%i5,	%i7,	%y

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%l0,	0x0E59,	%softint
	addc	%o4,	%o7,	%o1
	movg	%icc,	%i1,	%g1
	rd	%ccr,	%g4
	stw	%o6,	[%l7 + 0x48]
	swap	[%l7 + 0x18],	%l1
	wrpr	%l3,	%i0,	%tick
	rdhpr	%htba,	%g2
	wr 	%g0, 	0x4, 	%fprs

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%y,	%l6
	wrpr	%i6,	%g5,	%cwp
	rd	%y,	%g3
	fmovsn	%icc,	%f30,	%f20

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%i3,	0x0B4B,	%softint
	rd	%softint,	%i2
	fmovd	%f2,	%f24
	sll	%o0,	0x08,	%l4
	tsubcctv	%o5,	0x0D23,	%l2
	ble,a,pt	%icc,	loop_114
	rdhpr	%hsys_tick_cmpr,	%i4
	brgez	%i5,	loop_115
	wr	%g6,	%i7,	%sys_tick
loop_114:
	edge8l	%o3,	%o4,	%l0
	rdhpr	%htba,	%o1
loop_115:
	fmovrse	%o7,	%f24,	%f22
	rdhpr	%hsys_tick_cmpr,	%i1
	fzeros	%f10
	rdpr	%cleanwin,	%g1
	rdhpr	%htba,	%o6
	sdivx	%l1,	0x04EC,	%g4
	wrpr	%l3,	%g2,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%y,	%l6
	rdhpr	%hintp,	%i6
	rdhpr	%hintp,	%o2
	edge32ln	%g5,	%g3,	%g7
	wrpr	%i2,	0x1A60,	%cwp
	wr	%i3,	0x123C,	%softint
	tgu	%xcc,	0x4
	bpos,a	loop_116
	rdhpr	%hintp,	%o0
	ld	[%l7 + 0x08],	%f29

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xDE5, 	%hsys_tick_cmpr
loop_116:
	move	%xcc,	%o5,	%l2
	edge16ln	%i4,	%g6,	%i7
	tvc	%icc,	0x0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x671, 	%tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x9CE, 	%hsys_tick_cmpr
	srax	%l0,	0x1A,	%o7
	rdpr	%pil,	%i1
	wrpr	%g1,	0x0242,	%pil
	fcmpes	%fcc1,	%f7,	%f8
	andncc	%o1,	%l1,	%g4
	fmovrdgez	%o6,	%f12,	%f22
	rdhpr	%hsys_tick_cmpr,	%g2
	std	%l4,	[%l7 + 0x20]
	rdhpr	%htba,	%i0
	rdhpr	%hsys_tick_cmpr,	%l6
	nop
	set	0x60, %o5
	prefetch	[%l7 + %o5],	 0x3
	rdpr	%tba,	%i6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%htba,	%g5
	flush	%l7 + 0x78
	rd	%tick_cmpr,	%l3
	rdpr	%gl,	%g3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x1A8, 	%hsys_tick_cmpr
	fornot2s	%f3,	%f0,	%f12
	flushw
	rdhpr	%htba,	%o0
	rdpr	%cansave,	%i3
	tne	%xcc,	0x4
	ba	%icc,	loop_117
	fmovrdgz	%o5,	%f20,	%f8
	wrpr	%l4,	0x0259,	%cwp
	rd	%sys_tick_cmpr,	%l2
loop_117:
	rdpr	%canrestore,	%i4
	rdhpr	%hsys_tick_cmpr,	%g6
	wrpr	%i7,	0x0E60,	%tick
	fpsub32s	%f22,	%f23,	%f18
	rdpr	%tl,	%o4
	wr	%o3,	0x100C,	%y
	orcc	%l0,	0x116E,	%i5
	brgez,a	%o7,	loop_118
	tleu	%xcc,	0x2
	tvs	%icc,	0x4
	tn	%xcc,	0x1
loop_118:
	rd	%fprs,	%i1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xBCF, 	%hsys_tick_cmpr
	or	%g1,	%l1,	%g4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x5EF, 	%hsys_tick_cmpr
	rdhpr	%hsys_tick_cmpr,	%l5
	tn	%icc,	0x2
	fmovsvs	%icc,	%f28,	%f2
	tsubcctv	%i0,	%o6,	%l6
	wr	%i6,	0x135F,	%pic
	add	%g5,	%o2,	%g3
	movvc	%xcc,	%l3,	%i2
	rd	%pc,	%o0
	fcmpes	%fcc2,	%f26,	%f23
	rdhpr	%hsys_tick_cmpr,	%g7
	rdhpr	%htba,	%o5
	movre	%l4,	%l2,	%i3
	wr	%g6,	0x171A,	%sys_tick
	wr	%i7,	0x02A4,	%set_softint
	rd	%asi,	%i4
	movleu	%icc,	%o4,	%l0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%tba,	%i1
	sdiv	%o1,	0x0091,	%o7
	tgu	%xcc,	0x4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x43B, 	%hsys_tick_cmpr
	wrpr	%g2,	0x1FD1,	%pil
	rd	%tick_cmpr,	%l5
	rdhpr	%hintp,	%g4
	rdhpr	%hintp,	%i0
	fmovrse	%o6,	%f28,	%f15
	andn	%i6,	0x15AE,	%g5
	wrpr	%l6,	%g3,	%cwp
	movcs	%xcc,	%l3,	%i2
	wrpr	%o2,	0x16C1,	%cwp
	wr	%o0,	%o5,	%ccr
	nop
	setx	loop_119,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	sub	%g7,	%l4,	%i3
	taddcc	%g6,	%i7,	%i4
	rd	%tick_cmpr,	%l2
loop_119:
	brlz,a	%o4,	loop_120
	te	%icc,	0x2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x528, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xBAB, 	%hsys_tick_cmpr
loop_120:
	tgu	%xcc,	0x0
	smulcc	%o1,	0x04B3,	%o7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%i5,	0x05FB,	%set_softint
	wrpr	%g1,	%g2,	%pil
	bg	loop_121
	mulx	%l5,	0x169E,	%g4
	rdhpr	%hpstate,	%o6
	edge32ln	%i6,	%g5,	%l6
loop_121:
	fpadd32	%f16,	%f14,	%f10
	movrlez	%i0,	0x1C8,	%l3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xE62, 	%hsys_tick_cmpr
	rd	%pc,	%o0
	fbg	%fcc2,	loop_122
	rd	%ccr,	%i2
	smulcc	%o5,	0x0BFE,	%g7
	rdpr	%otherwin,	%l4
loop_122:
	rd	%softint,	%i3
	udivcc	%i7,	0x0E0A,	%i4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%pil,	%o3
	rdpr	%pil,	%i1
	wrpr	%l0,	%o1,	%tick
	tvc	%xcc,	0x6
	rdhpr	%hsys_tick_cmpr,	%o7
	movrlez	%i5,	%l1,	%g1
	tge	%xcc,	0x5
	wr	%l5,	%g2,	%softint
	rdhpr	%hintp,	%g4
	wr	%g0,	0x89,	%asi
	ldda	[%l7 + 0x40] %asi,	%o6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x82C, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%cwp,	%l3
	wrpr	%o2,	0x0BE2,	%cwp
	wr	%o0,	%i0,	%softint
	wrpr	%i2,	0x00E0,	%pil
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	move	%icc,	%g7,	%l4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x3F9, 	%hsys_tick_cmpr
	wr	%i3,	0x0649,	%pic
	wr	%i7,	0x0FB1,	%pic
	rdhpr	%hintp,	%g6
	set	0x20, %g3
	stxa	%i4,	[%l7 + %g3] 0x0c
	rdhpr	%hintp,	%l2
	ldd	[%l7 + 0x78],	%o4
	stb	%o3,	[%l7 + 0x0E]
	tleu	%icc,	0x1
	rdhpr	%htba,	%i1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%l1,	%g1,	%cwp
	subccc	%l5,	%o7,	%g2
	andcc	%o6,	%g5,	%g4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x3A8, 	%hsys_tick_cmpr
	rd	%ccr,	%l6
	wr	%l3,	%o2,	%set_softint
	brlz	%i6,	loop_123
	addccc	%i0,	0x1B2D,	%i2
	rdhpr	%hsys_tick_cmpr,	%g7
	rdpr	%pil,	%l4
loop_123:
	fcmped	%fcc3,	%f16,	%f30
	fmul8x16	%f3,	%f4,	%f12
	rdpr	%cansave,	%o5
	andn	%i3,	0x0263,	%i7
	ba,a,pn	%icc,	loop_124
	fba,a	%fcc3,	loop_125
	sdiv	%g6,	0x15C1,	%i4
	rd	%pc,	%o0
loop_124:
	addcc	%l2,	%o4,	%i1
loop_125:
	nop
	wr	%g0,	0x81,	%asi
	ldxa	[%l7 + 0x58] %asi,	%l0
	wrpr	%o3,	%o1,	%tick
	wr	%g0,	0x04,	%asi
	swapa	[%l7 + 0x7C] %asi,	%l1
	fxnor	%f4,	%f30,	%f10
	rd	%asi,	%i5
	wr	%g0,	0x11,	%asi
	lduba	[%l7 + 0x34] %asi,	%g1
	brlz,a	%l5,	loop_126
	wr 	%g0, 	0x7, 	%fprs
	rd	%ccr,	%o6
	rdpr	%gl,	%g5
loop_126:
	sdivx	%o7,	0x0FE5,	%g3
	fandnot2s	%f12,	%f0,	%f12
	sdivx	%l6,	0x0D0E,	%g4
	rdhpr	%hsys_tick_cmpr,	%l3
	smul	%i6,	0x0214,	%i0
	srax	%i2,	0x0B,	%o2
	rdpr	%otherwin,	%l4
	ld	[%l7 + 0x20],	%f6
	rdhpr	%hpstate,	%g7
	tcc	%xcc,	0x6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x40C, 	%hsys_tick_cmpr
	rd	%ccr,	%i4
	rdpr	%gl,	%g6
	fnot2s	%f10,	%f30
	wrpr	%i1,	%l0,	%tick
	wrpr	%o3,	0x1F03,	%pil
	rdhpr	%hsys_tick_cmpr,	%o4
	rdhpr	%hintp,	%l1
	sethi	0x0215,	%i5
	edge16ln	%o1,	%g1,	%g2
	fabsd	%f8,	%f8
	fand	%f2,	%f30,	%f2
	andn	%o6,	%l5,	%o7
	rd	%y,	%g3
	wrpr	%g5,	%g4,	%pil
	wr	%l6,	0x01FF,	%ccr
	wr	%i6,	%i0,	%set_softint
	wr	%i2,	0x063E,	%clear_softint
	rdhpr	%hsys_tick_cmpr,	%l3
	rdhpr	%htba,	%o2
	rdpr	%cleanwin,	%l4
	rdhpr	%hintp,	%g7
	rd	%asi,	%o5
	rdhpr	%hpstate,	%i3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x130, 	%hsys_tick_cmpr
	tn	%icc,	0x7
	rd	%asi,	%g6
	fmovs	%f17,	%f7
	rd	%fprs,	%l2
	wr	%g0,	0x11,	%asi
	ldstuba	[%l7 + 0x1C] %asi,	%o0
	fbuge,a	%fcc1,	loop_127
	rdhpr	%hintp,	%i4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	popc	0x1807,	%o4
loop_127:
	nop
	wr	%g0,	0x18,	%asi
	ldsba	[%l7 + 0x56] %asi,	%l0
	rdhpr	%hpstate,	%i5
	wrpr	%o1,	0x162C,	%cwp
	fbu,a	%fcc3,	loop_128
	rdpr	%cansave,	%g1
	sir	0x15AB
	rdpr	%otherwin,	%l1
loop_128:
	nop
	set	0x7B, %i7
	lduba	[%l7 + %i7] 0x14,	%o6
	wrpr	%l5,	%o7,	%cwp
	wr	%g2,	%g5,	%softint
	rdhpr	%hsys_tick_cmpr,	%g3
	rd	%asi,	%l6
	rdhpr	%htba,	%g4
	rdpr	%pil,	%i6
	rdhpr	%hpstate,	%i2
	rdhpr	%htba,	%i0
	rdpr	%cwp,	%l3
	be,a	%xcc,	loop_129
	ldx	[%l7 + 0x70],	%l4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x2FB, 	%hsys_tick_cmpr
loop_129:
	wrpr	%i3,	%o5,	%pil
	tvc	%icc,	0x0
	fsrc1	%f10,	%f12
	wr	%i7,	0x1BFE,	%y
	edge8	%l2,	%g6,	%i4
	rd	%ccr,	%o0
	wrpr	%o3,	0x10BB,	%pil
	wrpr	%i1,	%o4,	%tick
	rdpr	%cleanwin,	%l0
	fmovsvs	%xcc,	%f26,	%f11
	wrpr	%i5,	0x00B3,	%pil
	rdpr	%canrestore,	%o1
	rdpr	%tba,	%l1
	rdhpr	%hpstate,	%g1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x742, 	%hsys_tick_cmpr
	movvs	%icc,	%o7,	%g2
	fxors	%f3,	%f29,	%f9
	fble	%fcc2,	loop_130
	rdhpr	%htba,	%l5
	movre	%g3,	%l6,	%g4
	rd	%tick_cmpr,	%i6
loop_130:
	wr	%g5,	%i2,	%set_softint

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x5FC, 	%hsys_tick_cmpr
	rd	%ccr,	%o2
	fbue	%fcc0,	loop_131
	subccc	%g7,	0x0579,	%l4
	rd	%pc,	%i3
	fnot1	%f8,	%f28
loop_131:
	wr	%i7,	%l2,	%clear_softint
	rdpr	%wstate,	%g6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xA21, 	%hsys_tick_cmpr
	rd	%y,	%i4
	movleu	%xcc,	%o0,	%i1
	fand	%f20,	%f12,	%f24
	ble,pn	%xcc,	loop_132
	rdhpr	%hsys_tick_cmpr,	%o3
	rd	%y,	%l0
	rd	%y,	%o4
loop_132:
	wr	%o1,	%l1,	%clear_softint
	fmovdleu	%icc,	%f13,	%f0
	rd	%fprs,	%g1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%i5,	0x18F8,	%cwp
	subcc	%g2,	%l5,	%o7
	wrpr	%l6,	0x1A81,	%cwp
	rd	%y,	%g3
	wr 	%g0, 	0x6, 	%fprs
	rd	%asi,	%g5
	wrpr	%i2,	%l3,	%pil
	nop
	setx	loop_133,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	wr	%i0,	0x1748,	%y
	movre	%g7,	0x325,	%l4
	wr	%o2,	%i3,	%sys_tick
loop_133:
	movcc	%xcc,	%l2,	%i7
	fnot2	%f22,	%f28
	umul	%g6,	0x1510,	%i4
	rdhpr	%hintp,	%o5
	st	%f0,	[%l7 + 0x2C]
	brgez,a	%i1,	loop_134
	fpsub32s	%f14,	%f3,	%f1
	add	%o0,	%l0,	%o4
	movvc	%icc,	%o1,	%l1
loop_134:
	wr	%g1,	%o3,	%ccr
	wrpr	%i5,	%g2,	%pil
	wr	%o6,	0x04B3,	%set_softint
	fmovdg	%xcc,	%f17,	%f12
	wr	%o7,	%l5,	%clear_softint
	wr	%l6,	%g3,	%set_softint
	wrpr	%g4,	0x062A,	%pil
	rdhpr	%hpstate,	%g5
	rd	%pc,	%i2
	wrpr	%i6,	%i0,	%tick
	ldsb	[%l7 + 0x11],	%g7
	wr	%g0,	0xea,	%asi
	ldda	[%l7 + 0x60] %asi,	%l2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	movpos	%xcc,	%l4,	%i3
	or	%l2,	%g6,	%i4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xFA6, 	%sys_tick_cmpr
	sth	%o0,	[%l7 + 0x42]
	ldstub	[%l7 + 0x6B],	%l0
	rdhpr	%hintp,	%o1
	fbuge	%fcc2,	loop_135
	rdpr	%pil,	%o4
	tn	%icc,	0x0
	rd	%y,	%g1
loop_135:
	rdhpr	%hsys_tick_cmpr,	%l1
	tn	%icc,	0x5
	wrpr	%o3,	%i5,	%tick
	taddcc	%o6,	0x1ACA,	%g2
	lduh	[%l7 + 0x30],	%o7
	orcc	%l5,	%l6,	%g4
	fors	%f26,	%f19,	%f4
	tle	%xcc,	0x3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%i6,	0x15B2,	%pil
	rdhpr	%hintp,	%i2
	rdpr	%cwp,	%i0
	rd	%fprs,	%l3
	edge8l	%o2,	%g7,	%l4
	tleu	%icc,	0x1
	bleu,pn	%icc,	loop_136
	movrgez	%l2,	0x050,	%i3
	rdpr	%cwp,	%i4
	rdpr	%tba,	%g6
loop_136:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x60F, 	%sys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xA5E, 	%hsys_tick_cmpr
	fmovsleu	%xcc,	%f30,	%f6
	rdpr	%wstate,	%l0
	wr	%o1,	%g1,	%set_softint

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fmuld8ulx16	%f22,	%f23,	%f12
	rdpr	%wstate,	%i5
	tle	%icc,	0x6
	subcc	%o4,	%g2,	%o7
	addc	%l5,	%o6,	%g4
	subcc	%l6,	0x16DC,	%g3
	wr 	%g0, 	0x4, 	%fprs
	wrpr	%i6,	%i2,	%pil
	movcs	%icc,	%i0,	%l3
	fabss	%f14,	%f22
	rdhpr	%htba,	%o2
	rd	%tick_cmpr,	%g7
	tvc	%icc,	0x6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xF79, 	%hsys_tick_cmpr
	wrpr	%i3,	%l4,	%cwp
	rdpr	%otherwin,	%g6
	rdpr	%cleanwin,	%i1
	fbne	%fcc1,	loop_137
	sdivcc	%o5,	0x019E,	%i7
	movn	%xcc,	%i4,	%l0
	array8	%o0,	%o1,	%l1
loop_137:
	rdhpr	%hsys_tick_cmpr,	%g1
	orcc	%o3,	0x1785,	%o4
	rdpr	%otherwin,	%i5
	tn	%xcc,	0x7
	mulscc	%g2,	0x0A4C,	%l5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%cansave,	%l6
	popc	0x120F,	%g3
	ldsh	[%l7 + 0x42],	%o6
	rdpr	%gl,	%i6
	umul	%i2,	0x1B81,	%g5
	fmul8sux16	%f6,	%f26,	%f2
	wrpr	%l3,	0x0CC8,	%tick
	set	0x47, %o3
	lduba	[%l7 + %o3] 0x80,	%i0
	ldsw	[%l7 + 0x6C],	%g7
	edge32n	%o2,	%l2,	%i3
	wrpr	%l4,	0x006A,	%pil
	wr 	%g0, 	0x6, 	%fprs
	wr 	%g0, 	0x4, 	%fprs
	fmovsgu	%icc,	%f13,	%f25
	rd	%sys_tick_cmpr,	%o5
	siam	0x7
	andcc	%i7,	%l0,	%i4
	rd	%asi,	%o0
	fnot1s	%f7,	%f6
	wrpr	%l1,	%o1,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xD8E, 	%sys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	udiv	%g1,	0x17D4,	%g2
	edge32n	%o7,	%g4,	%l6
	fmovsleu	%icc,	%f20,	%f12
	wrpr	%g3,	%o6,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x38E, 	%hsys_tick_cmpr
	fmul8x16al	%f29,	%f24,	%f30
	flush	%l7 + 0x2C
	rdpr	%otherwin,	%g5
	umulcc	%i2,	%i0,	%g7
	rd	%tick_cmpr,	%l3
	fmovrsgz	%l2,	%f3,	%f13
	wr	%g0,	0x80,	%asi
	stba	%o2,	[%l7 + 0x62] %asi
	tn	%xcc,	0x3
	orncc	%l4,	%i1,	%g6
	wrpr	%o5,	%i7,	%pil
	wrpr	%l0,	0x0696,	%pil
	rdhpr	%htba,	%o0
	fxnor	%f30,	%f26,	%f10
	movn	%xcc,	%l1,	%i4
	rdpr	%cleanwin,	%o1
	taddcctv	%o3,	0x0C4D,	%o4
	movcs	%xcc,	%g1,	%i5
	wrpr	%o7,	%g2,	%tick
	brnz	%l6,	loop_138
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udiv	%g4,	0x1BB1,	%o6
	rd	%pc,	%i6
loop_138:
	wrpr	%l5,	%g5,	%tick
	rd	%tick_cmpr,	%i2
	movleu	%xcc,	%g3,	%g7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%gl,	%o2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x9F8, 	%hsys_tick_cmpr
	rdpr	%wstate,	%i1
	rdhpr	%htba,	%g6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xF92, 	%hsys_tick_cmpr
	set	0x0C, %i0
	lda	[%l7 + %i0] 0x15,	%f15
	udivx	%i7,	0x0F70,	%l0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%o1,	0x0984,	%ccr
	wrpr	%l1,	%o3,	%tick
	rd	%tick_cmpr,	%o4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x41B, 	%hsys_tick_cmpr
	subc	%g2,	%l6,	%g4
	wr	%o6,	0x12F9,	%set_softint
	rdpr	%gl,	%i6
	rdhpr	%hpstate,	%l5
	wrpr	%g1,	0x0FFA,	%pil
	wr	%i2,	%g3,	%pic
	wrpr	%g7,	0x1DC8,	%pil
	fmovscs	%icc,	%f14,	%f9
	rd	%softint,	%g5
	wrpr	%i0,	0x1A60,	%tick
	rdhpr	%hpstate,	%o2
	rdpr	%cleanwin,	%l3
	edge32l	%l2,	%i1,	%g6
	call	loop_139
	movre	%i3,	%l4,	%i7
	fbg,a	%fcc2,	loop_140
	movvs	%icc,	%l0,	%o0
loop_139:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x186, 	%hsys_tick_cmpr
	tne	%icc,	0x1
loop_140:
	wrpr	%l1,	0x19B0,	%cwp
	smulcc	%o3,	0x0373,	%o4
	rdpr	%wstate,	%i5
	wr	%o7,	0x18D8,	%set_softint
	rdpr	%cwp,	%g2
	rdhpr	%hintp,	%l6
	movvs	%xcc,	%g4,	%o6
	alignaddrl	%i6,	%l5,	%g1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%otherwin,	%o1
	rd	%fprs,	%g3
	edge32l	%g5,	%g7,	%o2
	edge16	%l3,	%l2,	%i1
	wrpr	%i0,	%g6,	%cwp
	orcc	%i3,	0x11D0,	%i7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x57E, 	%hsys_tick_cmpr
	wrpr	%o5,	0x0297,	%cwp
	rd	%softint,	%o0
	brgez,a	%l1,	loop_141
	mova	%icc,	%o3,	%o4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x100, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x94D, 	%hsys_tick_cmpr
loop_141:
	edge8l	%l6,	%g4,	%o6
	wr	%l5,	%i6,	%set_softint

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xC83, 	%hsys_tick_cmpr
	set	0x48, %l0
	stwa	%g3,	[%l7 + %l0] 0xea
	membar	#Sync
	andn	%g5,	%o1,	%g7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x85E, 	%hsys_tick_cmpr
	wrpr	%l2,	0x1301,	%pil
	umul	%i1,	0x1849,	%i0
	wrpr	%i3,	%g6,	%tick
	rdpr	%pil,	%l4
	rdhpr	%hpstate,	%l0
	wr	%o5,	0x1114,	%set_softint
	rd	%ccr,	%o0
	rdhpr	%hpstate,	%l1
	tvc	%icc,	0x4
	edge16	%o3,	%i7,	%o4
	bleu,a,pn	%icc,	loop_142
	rd	%y,	%i4
	movle	%xcc,	%o7,	%i5
	wrpr	%g2,	0x0768,	%cwp
loop_142:
	rdpr	%cwp,	%g4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fbne,a	%fcc0,	loop_143
	bl,a,pn	%xcc,	loop_144
	te	%icc,	0x6
	rdhpr	%htba,	%l5
loop_143:
	fbul,a	%fcc1,	loop_145
loop_144:
	edge32n	%i2,	%g1,	%i6
	smul	%g3,	0x1678,	%g5
	stb	%o1,	[%l7 + 0x6E]
loop_145:
	rdpr	%cwp,	%o2
	wrpr	%l2,	%i1,	%cwp
	fbn	%fcc0,	loop_146
	rdhpr	%htba,	%g7
	alignaddr	%i0,	%l3,	%i3
	rdpr	%gl,	%g6
loop_146:
	wrpr	%l4,	%o5,	%pil
	edge8l	%o0,	%l1,	%o3
	tg	%xcc,	0x7
	srlx	%l0,	0x05,	%o4
	rdhpr	%hintp,	%i7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x164, 	%hsys_tick_cmpr
	rdpr	%cwp,	%g2
	fmovsle	%icc,	%f3,	%f19
	nop
	setx	loop_147,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	bcc	loop_148
	fblg,a	%fcc2,	loop_149
	srl	%g4,	0x0B,	%o7
loop_147:
	tcs	%xcc,	0x3
loop_148:
	fmuld8ulx16	%f29,	%f28,	%f28
loop_149:
	fmovdpos	%xcc,	%f2,	%f4
	rdhpr	%hintp,	%o6
	fbl,a	%fcc2,	loop_150
	st	%f7,	[%l7 + 0x6C]
	edge32ln	%l5,	%l6,	%g1
	rdpr	%otherwin,	%i6
loop_150:
	rdpr	%cansave,	%i2
	rdhpr	%hpstate,	%g5
	fmul8ulx16	%f0,	%f0,	%f2
	rdpr	%pil,	%g3
	rd	%ccr,	%o1
	wr	%l2,	%i1,	%ccr
	rdhpr	%hintp,	%g7
	rd	%tick_cmpr,	%i0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x01F, 	%hsys_tick_cmpr
	addcc	%i3,	0x131A,	%l3
	edge16n	%l4,	%o5,	%g6
	movn	%xcc,	%o0,	%o3
	rdpr	%cwp,	%l1
	rd	%sys_tick_cmpr,	%o4
	nop
	setx	loop_151,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	wr	%l0,	0x1600,	%clear_softint
	set	0x10, %g1
	prefetcha	[%l7 + %g1] 0x11,	 0x1
loop_151:
	andn	%i5,	0x0D2F,	%g2
	subccc	%i7,	%g4,	%o6
	edge16ln	%o7,	%l5,	%l6
	rdpr	%cansave,	%i6
	wrpr	%i2,	0x05CF,	%pil
	bgu,a	%icc,	loop_152
	rdhpr	%hpstate,	%g5
	rdhpr	%hintp,	%g3
	sllx	%o1,	%g1,	%i1
loop_152:
	lduw	[%l7 + 0x4C],	%l2
	rdhpr	%hsys_tick_cmpr,	%g7
	fba	%fcc1,	loop_153
	umul	%o2,	0x0C51,	%i0
	rd	%asi,	%l3
	prefetch	[%l7 + 0x1C],	 0x1
loop_153:
	sdivcc	%i3,	0x0735,	%o5
	rd	%ccr,	%g6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x012, 	%hsys_tick_cmpr
	lduw	[%l7 + 0x0C],	%o3
	rdpr	%otherwin,	%l4
	addc	%l1,	0x1C19,	%o4
	fmovrsne	%i4,	%f17,	%f21
	wr	%i5,	0x1F8C,	%y
	wrpr	%g2,	0x036F,	%cwp
	rd	%asi,	%l0
	set	0x45, %i3
	stba	%i7,	[%l7 + %i3] 0x04
	rd	%sys_tick_cmpr,	%g4
	fmovrsgez	%o7,	%f22,	%f0
	tl	%icc,	0x4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%canrestore,	%o6
	set	0x58, %o1
	lda	[%l7 + %o1] 0x81,	%f8
	bge	%icc,	loop_154
	subcc	%i6,	%i2,	%l6
	wr	%g5,	0x082D,	%y
	rdhpr	%htba,	%g3
loop_154:
	edge8l	%o1,	%i1,	%l2
	movle	%xcc,	%g7,	%g1
	orcc	%o2,	%i0,	%i3
	or	%l3,	%o5,	%g6
	wrpr	%o0,	0x1CC9,	%cwp
	rdhpr	%hsys_tick_cmpr,	%l4
	tvc	%xcc,	0x0
	tcs	%icc,	0x4
	wr	%g0,	0x11,	%asi
	swapa	[%l7 + 0x28] %asi,	%l1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	movleu	%icc,	%o4,	%i5
	ba	loop_155
	wrpr	%g2,	%i7,	%cwp
	fbn,a	%fcc3,	loop_156
	fmovdn	%xcc,	%f3,	%f29
loop_155:
	wr	%g4,	%l0,	%sys_tick
	bpos,pn	%icc,	loop_157
loop_156:
	rdpr	%canrestore,	%o7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x050, 	%hsys_tick_cmpr
	fcmpes	%fcc0,	%f4,	%f15
loop_157:
	rdpr	%tl,	%l5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x9B1, 	%hsys_tick_cmpr
	rd	%ccr,	%g3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	rd	%pc,	%g5
	bcc	loop_158
	wrpr	%o1,	0x1670,	%cwp
	wrpr	%l2,	%g7,	%pil
	sdivx	%i1,	0x184F,	%o2
loop_158:
	or	%i0,	%i3,	%l3
	ldstub	[%l7 + 0x4C],	%g1
	brlez,a	%o5,	loop_159
	xnorcc	%o0,	%l4,	%l1
	rdpr	%cansave,	%o3
	fnot1	%f4,	%f6
loop_159:
	wrpr	%g6,	0x1711,	%cwp
	rdhpr	%htba,	%i4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%g2,	%i5,	%set_softint
	rd	%ccr,	%g4
	wr	%i7,	%o7,	%clear_softint
	rd	%pc,	%o6
	rdhpr	%hintp,	%i6
	rdpr	%cleanwin,	%l5
	rdpr	%cwp,	%l0
	tcs	%icc,	0x3
	rdhpr	%hintp,	%l6
	srax	%g3,	%i2,	%g5
	bge,pn	%xcc,	loop_160
	fpadd32	%f16,	%f22,	%f22
	brgez,a	%o1,	loop_161
	rd	%softint,	%l2
loop_160:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x3A7, 	%hsys_tick_cmpr
	bpos,pt	%icc,	loop_162
loop_161:
	rdhpr	%hsys_tick_cmpr,	%o2
	addccc	%i0,	0x168A,	%l3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x86A, 	%hsys_tick_cmpr
loop_162:
	wrpr	%g1,	%o0,	%cwp
	rdpr	%pil,	%l4
	rd	%y,	%o5
	edge32	%l1,	%g6,	%i4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x5FA, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%hintp,	%g4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%o7,	0x05C0,	%pil
	wr	%o6,	0x143A,	%pic
	bcs	loop_163
	movn	%xcc,	%i7,	%l5
	move	%xcc,	%l0,	%l6
	addc	%i6,	%i2,	%g5
loop_163:
	fmuld8ulx16	%f3,	%f20,	%f18
	alignaddr	%o1,	%l2,	%i1
	subcc	%g3,	%o2,	%g7
	xnor	%i0,	0x1000,	%i3
	edge32n	%g1,	%o0,	%l3
	rdpr	%pil,	%o5
	ba	loop_164
	rdhpr	%htba,	%l4
	rdpr	%canrestore,	%l1
	rd	%fprs,	%i4
loop_164:
	udiv	%g6,	0x1E36,	%o4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bvs,pn	%xcc,	loop_165
	fbo,a	%fcc2,	loop_166
	tl	%xcc,	0x1
	set	0x58, %l5
	prefetcha	[%l7 + %l5] 0x10,	 0x2
loop_165:
	wr	%o3,	%i5,	%y
loop_166:
	wr	%g4,	%o7,	%clear_softint
	rdhpr	%hsys_tick_cmpr,	%i7
	rdhpr	%hintp,	%o6
	rdhpr	%hintp,	%l5
	sdivx	%l6,	0x039C,	%i6
	be,pt	%xcc,	loop_167
	fmovrsne	%l0,	%f11,	%f27
	wr	%i2,	%g5,	%softint
	wrpr	%l2,	%o1,	%pil
loop_167:
	srl	%i1,	%g3,	%o2
	movrlz	%i0,	%g7,	%g1
	xnorcc	%i3,	0x0B37,	%o0
	sdiv	%l3,	0x1C4A,	%o5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	rdpr	%otherwin,	%i4
	rdpr	%canrestore,	%g6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xD32, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%hpstate,	%o3
	umul	%g2,	%i5,	%o7
	rdpr	%cwp,	%g4
	rd	%y,	%o6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x657, 	%tick_cmpr
	tsubcctv	%l6,	%i6,	%i7
	fmovscc	%icc,	%f5,	%f1
	mulx	%i2,	%l0,	%l2
	rdpr	%wstate,	%o1
	rdpr	%gl,	%g5
	rd	%softint,	%g3
	wrpr	%i1,	0x1A6F,	%pil
	rdpr	%gl,	%o2
	rdpr	%cwp,	%i0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	subccc	%o0,	%l3,	%o5
	wr 	%g0, 	0x4, 	%fprs
	wrpr	%i4,	%i3,	%pil
	wr 	%g0, 	0x7, 	%fprs

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x65F, 	%hsys_tick_cmpr
	movrgz	%i5,	0x039,	%o7
	edge8ln	%g4,	%o6,	%l5
	wrpr	%g2,	0x0705,	%tick
	udivcc	%i6,	0x06EB,	%i7
	rd	%sys_tick_cmpr,	%i2
	rd	%asi,	%l0
	wrpr	%l2,	%o1,	%cwp
	rd	%sys_tick_cmpr,	%g5
	brz	%l6,	loop_168
	andncc	%i1,	%o2,	%g3
	wr	%g7,	%g1,	%clear_softint

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x811, 	%sys_tick_cmpr
loop_168:
	wr	%i0,	%l3,	%clear_softint
	bleu	%xcc,	loop_169
	wrpr	%o5,	%i4,	%pil
	set	0x7B, %i4
	ldsba	[%l7 + %i4] 0x11,	%l4
loop_169:
	rd	%sys_tick_cmpr,	%i3
	andncc	%l1,	%o4,	%g6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xBAD, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x013, 	%hsys_tick_cmpr
	wrpr	%o6,	0x1568,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x90F, 	%hsys_tick_cmpr
	std	%f6,	[%l7 + 0x50]
	fmovrse	%o7,	%f25,	%f2
	bpos,a	%icc,	loop_170
	fpackfix	%f4,	%f16
	rdhpr	%hintp,	%g2
	fmovrsgez	%i6,	%f8,	%f26
loop_170:
	fmovrde	%i2,	%f18,	%f2
	fornot1	%f10,	%f28,	%f8
	fbne,a	%fcc0,	loop_171
	tcs	%icc,	0x4
	brlez,a	%l0,	loop_172
	movpos	%icc,	%i7,	%o1
loop_171:
	movrlz	%g5,	%l6,	%l2
	rd	%y,	%i1
loop_172:
	fmovdge	%icc,	%f28,	%f26
	alignaddrl	%o2,	%g3,	%g7
	wr	%g1,	0x0C25,	%pic
	rdpr	%cwp,	%i0
	udivcc	%l3,	0x0124,	%o5
	rdpr	%tba,	%o0
	fmovrsgz	%l4,	%f4,	%f3
	rdpr	%canrestore,	%i4
	rd	%sys_tick_cmpr,	%l1
	rd	%ccr,	%i3
	edge8	%g6,	%o3,	%o4
	wr	%g0,	0x2a,	%asi
	stwa	%i5,	[%l7 + 0x3C] %asi
	membar	#Sync
	move	%icc,	%g4,	%o6
	xnorcc	%l5,	0x0175,	%o7
	movcc	%xcc,	%g2,	%i6
	fandnot1	%f26,	%f4,	%f2
	rdhpr	%htba,	%i2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xBC8, 	%tick_cmpr
	fmovrdne	%l0,	%f24,	%f20
	fmuld8ulx16	%f4,	%f29,	%f18
	rd	%sys_tick_cmpr,	%g5
	movl	%xcc,	%o1,	%l2
	movvs	%xcc,	%i1,	%o2
	rd	%softint,	%g3
	fba	%fcc3,	loop_173
	nop
	set	0x48, %l6
	std	%g6,	[%l7 + %l6]
	edge32	%g1,	%l6,	%l3
	wrpr	%o5,	%i0,	%tick
loop_173:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x0F1, 	%hsys_tick_cmpr
	wr	%g0,	0xe2,	%asi
	stha	%l1,	[%l7 + 0x62] %asi
	membar	#Sync

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x78A, 	%hsys_tick_cmpr
	edge32ln	%o4,	%i5,	%g4
	ldd	[%l7 + 0x30],	%g6
	rd	%ccr,	%l5
	fble,a	%fcc2,	loop_174
	fmovsleu	%xcc,	%f18,	%f23
	wr	%o7,	%g2,	%pic
	fornot1s	%f6,	%f20,	%f25
loop_174:
	fxors	%f1,	%f11,	%f12
	pdist	%f0,	%f12,	%f24
	rd	%pc,	%o6
	smul	%i6,	%i2,	%i7
	tn	%icc,	0x0
	fmovdcc	%xcc,	%f31,	%f31
	wr	%l0,	%o1,	%pic
	rdpr	%tba,	%l2
	sir	0x0B1D
	fpsub16s	%f31,	%f10,	%f9

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xAD7, 	%hsys_tick_cmpr
	rdpr	%tba,	%o2
	wrpr	%g5,	%g7,	%cwp
	orncc	%g1,	0x1584,	%l6
	add	%g3,	0x135F,	%l3
	wrpr	%i0,	0x1674,	%pil
	wr	%o5,	%l4,	%pic
	wrpr	%o0,	0x127F,	%tick
	rd	%asi,	%i3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x631, 	%hsys_tick_cmpr
	rdhpr	%htba,	%o3
	wrpr	%l1,	0x0EA2,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x22A, 	%hsys_tick_cmpr
	ldsw	[%l7 + 0x60],	%i5
	rdhpr	%htba,	%g4
	fnegs	%f23,	%f12
	fbne	%fcc1,	loop_175
	rd	%pc,	%l5
	fpadd16	%f24,	%f28,	%f24
	wr	%o7,	%g6,	%ccr
loop_175:
	faligndata	%f28,	%f6,	%f18
	rdpr	%cwp,	%g2
	fpadd16s	%f26,	%f0,	%f22
	sdivcc	%i6,	0x1F23,	%o6
	sdiv	%i7,	0x03BD,	%l0
	wrpr	%i2,	0x0AAE,	%cwp
	rdhpr	%htba,	%l2
	set	0x22, %l1
	ldsha	[%l7 + %l1] 0x10,	%o1
	orncc	%i1,	%o2,	%g5
	edge16l	%g7,	%g1,	%g3
	rd	%y,	%l6
	fmul8x16au	%f26,	%f2,	%f22
	membar	0x00
	fmul8sux16	%f0,	%f24,	%f10

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x62C, 	%hsys_tick_cmpr
	movrgz	%i0,	0x1B9,	%l4
	rdpr	%tba,	%o5
	wr	%o0,	0x0951,	%softint
	wrpr	%i4,	%i3,	%pil
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fornot2s	%f20,	%f6,	%f18
	wrpr	%o3,	%o4,	%cwp
	rdhpr	%hintp,	%l1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%g0,	0x04,	%asi
	stba	%o7,	[%l7 + 0x6B] %asi
	rd	%sys_tick_cmpr,	%g6
	call	loop_176
	wrpr	%l5,	%i6,	%cwp
	smul	%o6,	%i7,	%l0
	rdpr	%wstate,	%i2
loop_176:
	rd	%tick_cmpr,	%l2
	wr	%o1,	0x1C3D,	%softint
	rdhpr	%hsys_tick_cmpr,	%g2
	movrgz	%o2,	%g5,	%g7
	rdhpr	%hintp,	%g1
	rdpr	%pil,	%i1
	fmovrsne	%g3,	%f28,	%f29
	rdpr	%pil,	%l3
	wr	%i0,	0x19AE,	%softint
	fzeros	%f11
	rdhpr	%hsys_tick_cmpr,	%l6
	fmovdle	%xcc,	%f17,	%f3
	sllx	%l4,	%o5,	%o0
	wrpr	%i4,	%o3,	%cwp
	tne	%icc,	0x1
	rd	%pc,	%o4
	sdivx	%l1,	0x127F,	%i3
	sub	%g4,	%o7,	%g6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	rdpr	%wstate,	%i6
	alignaddr	%l5,	%o6,	%l0
	movrgz	%i7,	%i2,	%l2
	rdpr	%cansave,	%g2
	rdpr	%otherwin,	%o2
	wr	%g0,	0x89,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	movrgz	%o1,	0x06E,	%g7
	fpsub32s	%f11,	%f12,	%f1
	wrpr	%g1,	%g5,	%tick
	rdhpr	%hpstate,	%g3
	set	0x78, %g2
	stba	%l3,	[%l7 + %g2] 0x89

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x2EC, 	%hsys_tick_cmpr
	wrpr	%l6,	%l4,	%cwp
	sdivx	%o5,	0x0F16,	%o0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%tick_cmpr,	%o3
	rdhpr	%hintp,	%i3
	sll	%g4,	0x16,	%g6
	alignaddrl	%o7,	%i6,	%i5
	wr	%o6,	0x0F05,	%ccr
	rdpr	%pil,	%l0
	ble,pt	%icc,	loop_177
	tcs	%xcc,	0x5
	tcc	%icc,	0x0
	fornot2s	%f30,	%f25,	%f26
loop_177:
	fcmpne16	%f0,	%f30,	%l5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x919, 	%hsys_tick_cmpr
	rdpr	%otherwin,	%l2
	fpadd16	%f24,	%f24,	%f4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xC05, 	%tick_cmpr
	wr	%i7,	%o2,	%softint
	fbn,a	%fcc2,	loop_178
	rd	%y,	%g7
	subc	%o1,	0x04F1,	%g1
	movpos	%icc,	%g3,	%g5
loop_178:
	fbg	%fcc0,	loop_179
	umulcc	%i0,	%i1,	%l6
	rd	%y,	%l4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_179:
	xnorcc	%o5,	0x161D,	%o0
	rd	%tick_cmpr,	%i4
	smul	%l1,	%o4,	%o3
	array16	%i3,	%g6,	%g4
	wr	%i6,	%i5,	%clear_softint
	set	0x40, %g7
	ldswa	[%l7 + %g7] 0x19,	%o7
	te	%xcc,	0x4
	rdhpr	%hpstate,	%l0
	sub	%l5,	%i2,	%l2
	fmovdle	%xcc,	%f14,	%f11
	stbar
	rdpr	%wstate,	%g2
	wr	%g0,	0x19,	%asi
	ldsha	[%l7 + 0x16] %asi,	%o6
	bg,pt	%icc,	loop_180
	fxnor	%f14,	%f8,	%f20
	fpackfix	%f14,	%f9
	bleu,pn	%icc,	loop_181
loop_180:
	tsubcctv	%o2,	%g7,	%i7
	rdhpr	%htba,	%g1
	wr	%g3,	%g5,	%pic
loop_181:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%otherwin,	%o1
	rd	%asi,	%l4
	rdpr	%otherwin,	%o5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x5AE, 	%hsys_tick_cmpr
	fpmerge	%f23,	%f3,	%f0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x69D, 	%hsys_tick_cmpr
	for	%f4,	%f20,	%f18

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xE06, 	%hsys_tick_cmpr
	nop
	setx loop_182, %l0, %l1
	jmpl %l1, %o4
	wrpr	%o3,	%i3,	%tick
	rd	%ccr,	%g4
	fmovdvc	%icc,	%f25,	%f13
loop_182:
	wrpr	%g6,	%i5,	%tick
	wrpr	%o7,	0x115D,	%tick
	siam	0x1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fbo	%fcc1,	loop_183
	wrpr	%l0,	0x1CDB,	%tick
	rdhpr	%hpstate,	%l5
	tcs	%xcc,	0x3
loop_183:
	brlz,a	%l2,	loop_184
	rd	%asi,	%g2
	rd	%tick_cmpr,	%o6
	rdhpr	%hpstate,	%i2
loop_184:
	membar	0x26
	wr	%o2,	%g7,	%ccr
	set	0x72, %o6
	stha	%g1,	[%l7 + %o6] 0x04
	rdpr	%cansave,	%g3
	set	0x58, %i6
	lda	[%l7 + %i6] 0x81,	%f7
	xorcc	%i7,	0x1829,	%g5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x482, 	%hsys_tick_cmpr
	rdhpr	%htba,	%l4
	wrpr	%l3,	%i0,	%tick
	wrpr	%o5,	%i4,	%tick
	rdhpr	%hsys_tick_cmpr,	%l1
	wr	%o0,	0x0F46,	%sys_tick
	fmovrdlz	%o4,	%f2,	%f0
	bne,a,pt	%icc,	loop_185
	fnand	%f28,	%f22,	%f0
	movle	%icc,	%l6,	%o3
	rdpr	%canrestore,	%g4
loop_185:
	fpadd32s	%f30,	%f17,	%f11
	tne	%xcc,	0x4
	rdpr	%cleanwin,	%g6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	fandnot2	%f20,	%f20,	%f18
	rdpr	%wstate,	%o7
	rdhpr	%hpstate,	%i6
	for	%f26,	%f28,	%f6
	tsubcc	%i5,	0x1B30,	%l0
	rd	%sys_tick_cmpr,	%l2
	wrpr	%l5,	%g2,	%pil
	edge8ln	%o6,	%o2,	%i2
	rd	%y,	%g7
	wrpr	%g3,	%g1,	%cwp
	fbug	%fcc0,	loop_186
	rd	%ccr,	%g5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xCBB, 	%hsys_tick_cmpr
	bcc,a	%xcc,	loop_187
loop_186:
	bg,a	loop_188
	sub	%o1,	%i7,	%l3
	rd	%sys_tick_cmpr,	%l4
loop_187:
	stw	%i0,	[%l7 + 0x24]
loop_188:
	fmul8x16au	%f29,	%f7,	%f28
	wr	%g0,	0x19,	%asi
	stda	%o4,	[%l7 + 0x60] %asi
	tpos	%xcc,	0x4
	wr	%i4,	%l1,	%clear_softint
	rdpr	%tl,	%o4
	andncc	%l6,	%o3,	%g4
	srax	%o0,	0x15,	%i3
	fmovrse	%o7,	%f25,	%f27
	fsrc1	%f8,	%f18
	lduw	[%l7 + 0x2C],	%g6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x96E, 	%hsys_tick_cmpr
	tn	%xcc,	0x0
	wrpr	%i6,	0x1252,	%cwp
	wr	%l2,	%l5,	%set_softint
	edge32	%g2,	%o6,	%o2
	tn	%icc,	0x3
	rdhpr	%hpstate,	%g7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	sdiv	%g1,	0x09D1,	%g5
	fandnot2	%f12,	%f18,	%f26
	fmovdvs	%icc,	%f31,	%f17
	wrpr	%i1,	0x04F4,	%pil
	rdhpr	%hintp,	%i7
	mova	%xcc,	%l3,	%l4
	movrgz	%o1,	%i0,	%i4
	edge8l	%l1,	%o4,	%l6
	umulcc	%o3,	0x1E91,	%g4
	fxnor	%f0,	%f30,	%f12
	rdhpr	%hsys_tick_cmpr,	%o5
	wrpr	%o0,	%i3,	%tick
	rd	%softint,	%g6
	srax	%i5,	%l0,	%o7
	rd	%sys_tick_cmpr,	%l2
	std	%l4,	[%l7 + 0x58]
	rdpr	%cansave,	%i6
	udivx	%o2,	0x0302,	%g2
	tn	%xcc,	0x2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x742, 	%hsys_tick_cmpr
	rdhpr	%hsys_tick_cmpr,	%g7
	rd	%sys_tick_cmpr,	%i2
	fpadd32s	%f31,	%f10,	%f2
	wr	%g0,	0x23,	%asi
	stda	%g4,	[%l7 + 0x30] %asi
	membar	#Sync

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	addc	%i7,	0x1036,	%l3
	rdhpr	%hintp,	%o1
	rdpr	%cwp,	%l4
	andcc	%i0,	0x14F3,	%i4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x8FA, 	%hsys_tick_cmpr
	sdivcc	%l6,	0x043D,	%o3
	mova	%icc,	%g4,	%o5
	rdpr	%cansave,	%o0
	tn	%icc,	0x3
	movcc	%xcc,	%i3,	%g6
	mulscc	%o4,	0x1B96,	%i5
	rdpr	%tba,	%o7
	wr	%l0,	%l5,	%set_softint
	sllx	%i6,	0x06,	%l2
	rdhpr	%hsys_tick_cmpr,	%o2
	wr	%o6,	0x1EFA,	%clear_softint
	rdpr	%cansave,	%g2
	rdhpr	%hpstate,	%g3
	rdpr	%gl,	%g7
	rdhpr	%hsys_tick_cmpr,	%g5
	move	%xcc,	%g1,	%i1
	popc	0x169D,	%i2
	rdhpr	%htba,	%i7
	rdhpr	%hintp,	%o1
	rdhpr	%hsys_tick_cmpr,	%l4
	sth	%i0,	[%l7 + 0x78]
	sll	%l3,	%l1,	%l6
	wr	%o3,	0x06DA,	%softint

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	fxors	%f10,	%f22,	%f11
	ld	[%l7 + 0x08],	%f20
	rdhpr	%htba,	%o0
	rd	%asi,	%o5
	array8	%g6,	%i3,	%o4
	movneg	%icc,	%i5,	%l0
	ba,pt	%xcc,	loop_189
	move	%icc,	%o7,	%l5
	xnorcc	%l2,	%o2,	%i6
	wrpr	%g2,	0x13B5,	%pil
loop_189:
	rd	%ccr,	%o6
	rd	%softint,	%g3
	rdhpr	%hsys_tick_cmpr,	%g5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x304, 	%hsys_tick_cmpr
	wrpr	%g7,	0x1264,	%cwp
	xorcc	%i1,	%i2,	%i7
	rd	%fprs,	%l4
	rdpr	%tl,	%o1
	rdpr	%otherwin,	%l3
	fnand	%f28,	%f2,	%f14
	fnor	%f10,	%f14,	%f18
	wrpr	%l1,	%i0,	%pil
	srl	%o3,	%i4,	%g4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%pc,	%g6
	wr	%i3,	%l6,	%y
	fmovsg	%icc,	%f2,	%f6
	wrpr	%i5,	%o4,	%cwp
	wr	%o7,	%l5,	%clear_softint
	movgu	%xcc,	%l2,	%l0
	fmovrslz	%o2,	%f22,	%f18
	movrlz	%i6,	0x29C,	%o6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xC1E, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fnegd	%f26,	%f6
	rd	%ccr,	%g1
	rdhpr	%htba,	%g7
	sra	%g2,	0x1E,	%i1
	wr	%i2,	%i7,	%ccr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x726, 	%hsys_tick_cmpr
	rdpr	%wstate,	%l1
	fba	%fcc2,	loop_190
	rdhpr	%hintp,	%i0
	rd	%softint,	%l3
	sra	%o3,	0x1D,	%g4
loop_190:
	rdhpr	%hsys_tick_cmpr,	%o0
	rdhpr	%hsys_tick_cmpr,	%o5
	rdhpr	%hsys_tick_cmpr,	%i4
	move	%xcc,	%i3,	%g6
	wr	%g0,	0x19,	%asi
	stha	%l6,	[%l7 + 0x40] %asi
	rd	%sys_tick_cmpr,	%i5
	wr	%o7,	0x1A67,	%y
	wr	%l2,	0x1EBE,	%clear_softint
	movcs	%xcc,	%l0,	%o2
	tsubcc	%i6,	0x0821,	%l5
	wr	%g3,	%g5,	%ccr
	rdhpr	%htba,	%o6
	rd	%fprs,	%g1
	rdhpr	%hintp,	%g2
	wrpr	%i1,	0x192D,	%tick
	edge16l	%g7,	%i7,	%i2
	rd	%fprs,	%l4
	tge	%icc,	0x7
	wrpr	%o1,	%l1,	%cwp
	sllx	%l3,	%o3,	%i0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xA23, 	%hsys_tick_cmpr
	rdhpr	%hsys_tick_cmpr,	%g4
	fbul,a	%fcc0,	loop_191
	mova	%xcc,	%i4,	%i3
	wrpr	%g6,	%l6,	%tick
	edge8n	%i5,	%o5,	%o7
loop_191:
	fbu,a	%fcc3,	loop_192
	wrpr	%o4,	%l0,	%pil
	wr	%g0,	0x80,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
loop_192:
	rdhpr	%hpstate,	%o2
	wrpr	%l2,	%i6,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xDCC, 	%hsys_tick_cmpr
	ldd	[%l7 + 0x30],	%l4
	rd	%pc,	%o6
	rdpr	%canrestore,	%g1
	te	%icc,	0x0
	rdhpr	%htba,	%g5
	rd	%pc,	%i1
	tge	%xcc,	0x3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xD61, 	%hsys_tick_cmpr
	udiv	%i2,	0x094F,	%g2
	udivcc	%o1,	0x015E,	%l4
	wr	%l1,	0x1036,	%clear_softint
	wrpr	%l3,	0x0227,	%pil
	wr	%i0,	%o3,	%pic
	st	%f28,	[%l7 + 0x6C]
	wr	%o0,	0x1EA8,	%sys_tick
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xE76, 	%hsys_tick_cmpr
	wr	%l6,	%i5,	%sys_tick
	edge16l	%o5,	%o7,	%o4
	stbar
	fmovdge	%icc,	%f7,	%f9

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xACF, 	%hsys_tick_cmpr
	movvs	%xcc,	%o2,	%i3
	movrgez	%i6,	0x36E,	%l2
	wrpr	%g3,	0x15C9,	%tick
	set	0x66, %g4
	ldsba	[%l7 + %g4] 0x19,	%l5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x490, 	%hsys_tick_cmpr
	rd	%ccr,	%g1
	tsubcctv	%g5,	%i1,	%i7
	tge	%icc,	0x7
	fornot2s	%f13,	%f26,	%f24
	wr	%i2,	%g7,	%set_softint
	wr	%g2,	%o1,	%y
	rdpr	%pil,	%l4
	wr	%l3,	0x14ED,	%y
	rdpr	%canrestore,	%i0
	udivx	%o3,	0x05ED,	%l1
	bl	loop_193
	smul	%o0,	0x0F54,	%i4
	rdpr	%canrestore,	%g6
	wrpr	%l6,	0x0F2F,	%cwp
loop_193:
	wrpr	%i5,	0x03B1,	%tick
	rd	%softint,	%o5
	rdpr	%gl,	%o7
	fabsd	%f30,	%f28
	wr	%g4,	0x0A9E,	%clear_softint

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x77D, 	%hsys_tick_cmpr
	wrpr	%o2,	0x088C,	%cwp
	subc	%o4,	0x10B3,	%i3
	rdhpr	%hsys_tick_cmpr,	%i6
	tcs	%icc,	0x0
	rd	%ccr,	%l2
	tvc	%xcc,	0x7
	wrpr	%g3,	0x1F96,	%tick
	ble	loop_194
	rd	%tick_cmpr,	%l5
	rdhpr	%hpstate,	%o6
	wr	%g1,	0x080D,	%set_softint
loop_194:
	rdhpr	%hsys_tick_cmpr,	%i1
	fmul8x16al	%f14,	%f11,	%f22
	rd	%sys_tick_cmpr,	%g5
	fabsd	%f20,	%f18
	tl	%icc,	0x6
	xor	%i7,	0x1225,	%g7
	tle	%xcc,	0x5
	movl	%xcc,	%g2,	%i2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x210, 	%hsys_tick_cmpr
	brnz	%l3,	loop_195
	wrpr	%i0,	0x18DD,	%pil
	rd	%pc,	%o3
	rdhpr	%hpstate,	%o1
loop_195:
	rdpr	%canrestore,	%l1
	movne	%xcc,	%i4,	%o0
	rdpr	%otherwin,	%l6
	rd	%softint,	%i5
	std	%f26,	[%l7 + 0x10]
	tne	%icc,	0x3
	fpack16	%f30,	%f8
	rdpr	%cwp,	%o5
	wr 	%g0, 	0x5, 	%fprs

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	stb	%o2,	[%l7 + 0x72]
	taddcc	%o4,	%i3,	%g6
	wr	%g0,	0x80,	%asi
	stwa	%i6,	[%l7 + 0x78] %asi

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	wr	%g3,	0x0B74,	%clear_softint
	add	%l7,	0x20,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] %asi,	%l5,	%g1
	xorcc	%i1,	%o6,	%g5
	movge	%icc,	%g7,	%i7
	sll	%g2,	%i2,	%l4
	rdhpr	%htba,	%l3
	set	0x70, %o0
	prefetcha	[%l7 + %o0] 0x80,	 0x2
	array32	%i0,	%o1,	%i4
	rdpr	%canrestore,	%l1
	smulcc	%l6,	0x1D9B,	%i5
	fmovd	%f6,	%f22
	rd	%asi,	%o5
	edge32	%o0,	%o7,	%l0
	nop
	setx	loop_196,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	rd	%pc,	%g4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x115, 	%hsys_tick_cmpr
	edge16	%g6,	%i3,	%l2
loop_196:
	rdpr	%tl,	%i6
	fmovdleu	%xcc,	%f8,	%f3
	rd	%sys_tick_cmpr,	%l5
	rdpr	%cleanwin,	%g3
	wr	%g0,	0x88,	%asi
	stha	%i1,	[%l7 + 0x36] %asi

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr 	%g0, 	0x7, 	%fprs
	rdpr	%cansave,	%g5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fbe,a	%fcc2,	loop_197
	fnegs	%f31,	%f14
	fpack16	%f14,	%f16
	set	0x40, %i2
	stda	%f16,	[%l7 + %i2] 0x19
loop_197:
	rdpr	%tl,	%i2
	rdpr	%pil,	%l4
	wr	%g0,	0x11,	%asi
	lduwa	[%l7 + 0x70] %asi,	%l3
	rdhpr	%htba,	%o3
	rd	%asi,	%i7
	tcc	%icc,	0x4
	taddcc	%i0,	0x002C,	%i4
	fmovrdgz	%l6,	%f6,	%f24
	rdpr	%cansave,	%o1
	rdhpr	%htba,	%o5
	tsubcctv	%o0,	0x1661,	%i5
	mova	%icc,	%g4,	%o4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%otherwin,	%o2
	edge8ln	%i3,	%l2,	%i6
	wr	%l5,	0x001B,	%pic
	rdhpr	%hsys_tick_cmpr,	%g3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	wr	%g6,	0x1710,	%softint
	set	0x38, %l3
	lda	[%l7 + %l3] 0x10,	%f9
	rdpr	%tba,	%g1
	movgu	%icc,	%g5,	%g2
	movg	%xcc,	%i2,	%l4
	xor	%g7,	0x073D,	%o3
	brgz,a	%i7,	loop_198
	rdpr	%canrestore,	%l3
	wr	%i4,	0x13F1,	%softint
	prefetch	[%l7 + 0x2C],	 0x0
loop_198:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xFFA, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x979, 	%hsys_tick_cmpr
	taddcc	%o5,	0x1908,	%l6
	rd	%asi,	%i5
	ld	[%l7 + 0x48],	%f31
	rd	%pc,	%l0
	addc	%o0,	0x07BF,	%g4
	movleu	%xcc,	%o4,	%o2
	rd	%pc,	%o7
	xorcc	%l2,	0x0C9E,	%i6
	rdpr	%cansave,	%l5
	rd	%asi,	%g3
	nop
	set	0x18, %o7
	stx	%i1,	[%l7 + %o7]
	xor	%o6,	0x1305,	%g6
	fmovsne	%icc,	%f21,	%f28
	movrlez	%g1,	0x08D,	%g5
	fbuge,a	%fcc2,	loop_199
	addccc	%i3,	%i2,	%l4
	fmovrsgez	%g2,	%f9,	%f16
	rdpr	%canrestore,	%g7
loop_199:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%o3,	0x0E7C,	%tick
	bvc,a,pn	%xcc,	loop_200
	wrpr	%i4,	%l1,	%cwp
	rd	%fprs,	%l3
	rdhpr	%hpstate,	%o1
loop_200:
	ldd	[%l7 + 0x48],	%f16
	fpadd32s	%f28,	%f9,	%f10
	rdpr	%cwp,	%o5
	rdpr	%tba,	%l6
	udivx	%i0,	0x0636,	%l0
	andn	%o0,	0x1603,	%i5
	rd	%tick_cmpr,	%g4
	array32	%o4,	%o2,	%l2
	rdpr	%tl,	%o7
	rd	%pc,	%i6
	edge16n	%g3,	%l5,	%o6
	rdhpr	%hpstate,	%i1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xD36, 	%hsys_tick_cmpr
	rdhpr	%hpstate,	%g5
	flushw
	sdiv	%i2,	0x1571,	%l4
	alignaddrl	%g2,	%g7,	%i3
	movle	%icc,	%i7,	%o3
	wrpr	%i4,	0x098B,	%tick
	wr	%l1,	0x072B,	%ccr
	tle	%icc,	0x4
	alignaddr	%l3,	%o1,	%l6
	wrpr	%o5,	0x142B,	%tick
	wrpr	%i0,	0x1EE0,	%pil
	wrpr	%l0,	%i5,	%pil
	rdpr	%gl,	%o0
	wr	%o4,	0x0C48,	%y
	wr 	%g0, 	0x4, 	%fprs

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x4F5, 	%hsys_tick_cmpr
	rdhpr	%htba,	%o7
	set	0x54, %i1
	stwa	%i6,	[%l7 + %i1] 0x04
	membar	0x7E
	sllx	%l2,	0x09,	%g3
	sethi	0x13E2,	%o6
	fbu,a	%fcc2,	loop_201
	fbue,a	%fcc1,	loop_202
	wr	%i1,	0x0E6A,	%softint
	tge	%icc,	0x3
loop_201:
	nop
	set	0x28, %i5
	prefetcha	[%l7 + %i5] 0x04,	 0x3
loop_202:
	rdhpr	%htba,	%l5
	sir	0x026F
	wr	%g6,	0x163D,	%sys_tick
	wrpr	%g5,	%l4,	%cwp
	rdpr	%cansave,	%i2
	movneg	%icc,	%g7,	%i3
	te	%xcc,	0x1
	rdpr	%cwp,	%i7
	wr	%g2,	%o3,	%clear_softint
	rdpr	%cleanwin,	%l1
	rd	%fprs,	%l3
	tpos	%xcc,	0x6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xDDE, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%cleanwin,	%o5
	rdpr	%cwp,	%i0
	wr	%g0,	0x0c,	%asi
	ldda	[%l7 + 0x30] %asi,	%o0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	movgu	%xcc,	%o4,	%o0
	wr	%o2,	%o7,	%pic
	rdhpr	%htba,	%i6
	rdhpr	%hsys_tick_cmpr,	%l2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xEA7, 	%hsys_tick_cmpr
	fble,a	%fcc1,	loop_203
	add	%i1,	%o6,	%g1
	sra	%g6,	0x02,	%g5
	addc	%l5,	%l4,	%i2
loop_203:
	rdhpr	%htba,	%g7
	rd	%asi,	%i7
	fand	%f2,	%f30,	%f4
	edge32	%g2,	%i3,	%l1
	orn	%o3,	%i4,	%l6
	movrgz	%o5,	0x1CD,	%i0
	nop
	setx loop_204, %l0, %l1
	jmpl %l1, %o1
	rdhpr	%hsys_tick_cmpr,	%l0
	wr 	%g0, 	0x7, 	%fprs
	umulcc	%l3,	%o0,	%o4
loop_204:
	fone	%f0
	wrpr	%o2,	0x06AE,	%cwp
	nop
	set	0x0C, %g6
	ldsh	[%l7 + %g6],	%i6
	rd	%tick_cmpr,	%l2
	set	0x68, %l4
	stda	%g4,	[%l7 + %l4] 0x23
	membar	#Sync
	rdpr	%wstate,	%g3
	fmuld8sux16	%f0,	%f5,	%f0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	edge8	%o6,	%i1,	%g1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%l5,	%i2,	%cwp
	rdhpr	%htba,	%l4
	rdhpr	%htba,	%g7
	wrpr	%i7,	0x1A1F,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	rdhpr	%htba,	%i3
	fbge	%fcc2,	loop_205
	movl	%icc,	%o3,	%l6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	popc	%o1,	%i4
loop_205:
	edge8	%l0,	%i5,	%o0
	rdhpr	%hsys_tick_cmpr,	%l3
	rdhpr	%hsys_tick_cmpr,	%o4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x6B8, 	%hsys_tick_cmpr
	rd	%y,	%l2
	rdhpr	%hsys_tick_cmpr,	%o2
	rdpr	%canrestore,	%g4
	orn	%o7,	0x0AC0,	%o6
	rdhpr	%hsys_tick_cmpr,	%g3
	wr	%g1,	%g5,	%set_softint
	nop
	setx	loop_206,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fmovsleu	%xcc,	%f26,	%f10
	wr	%g6,	%l5,	%set_softint
	wr	%i2,	%i1,	%set_softint
loop_206:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	array16	%g7,	%l1,	%g2
	wr	%i3,	%l6,	%ccr
	wrpr	%o5,	0x1AE4,	%tick
	bne,pn	%xcc,	loop_207
	rdpr	%otherwin,	%i0
	wrpr	%o1,	%i4,	%tick
	set	0x08, %l2
	stda	%l0,	[%l7 + %l2] 0x14
loop_207:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%hsys_tick_cmpr,	%o0
	smul	%l3,	0x1530,	%o4
	add	%l7,	0x50,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%l2,	%i6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x467, 	%hsys_tick_cmpr
	rdpr	%tl,	%o7
	tgu	%icc,	0x6
	fmovs	%f13,	%f14

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x1E8, 	%hsys_tick_cmpr
	xorcc	%g5,	0x0BED,	%g6
	fmovse	%icc,	%f15,	%f2
	rd	%ccr,	%g1
	wr	%l5,	0x0587,	%pic
	rdpr	%gl,	%i2
	fmovrsgez	%l4,	%f24,	%f31
	wrpr	%i1,	%i7,	%pil
	rdpr	%tl,	%l1
	wr	%g2,	0x0CD9,	%y

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xDFB, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	stbar
	rdhpr	%hpstate,	%g7
	rd	%asi,	%i0
	subccc	%o5,	%i4,	%o1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x3FF, 	%hsys_tick_cmpr
	rdpr	%wstate,	%o0
	rdpr	%wstate,	%o3
	rdhpr	%htba,	%o4
	tleu	%icc,	0x1
	rdpr	%tl,	%l2
	wrpr	%l3,	0x1BA5,	%pil
	wr	%i6,	%o2,	%sys_tick
	xorcc	%o7,	0x1D2A,	%g3
	sdivx	%o6,	0x0DD7,	%g4
	wr	%g6,	0x15B6,	%sys_tick
	rd	%fprs,	%g5
	rdpr	%cansave,	%g1
	fmovrdlz	%l5,	%f0,	%f26
	fones	%f29
	fmovdle	%icc,	%f7,	%f0
	mulscc	%i2,	%i1,	%i7
	movcs	%icc,	%l4,	%g2
	bcs,a	%icc,	loop_208
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	rdhpr	%hsys_tick_cmpr,	%l1
	wr	%i3,	0x125F,	%ccr
loop_208:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	rd	%fprs,	%g7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x470, 	%hsys_tick_cmpr
	wrpr	%o5,	%i0,	%tick
	wr	%i4,	%l0,	%set_softint

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xE79, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	te	%xcc,	0x2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x5F6, 	%hsys_tick_cmpr
	wr	%l3,	0x0F5A,	%pic
	tg	%xcc,	0x0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x8FB, 	%hsys_tick_cmpr
	tvc	%icc,	0x1
	rdpr	%cansave,	%i6
	rdpr	%gl,	%o2
	rd	%fprs,	%o7
	sethi	0x0A34,	%g3
	wrpr	%o6,	0x0860,	%pil
	wr	%g4,	%g6,	%clear_softint
	movrlz	%g1,	0x2DA,	%l5
	wrpr	%g5,	0x143C,	%cwp
	wrpr	%i1,	0x14C0,	%cwp
	rdpr	%tl,	%i7
	addccc	%l4,	%g2,	%l1
	rd	%sys_tick_cmpr,	%i2
	fmovsle	%xcc,	%f7,	%f0
	addc	%i3,	%l6,	%o5
	addcc	%i0,	0x1A89,	%g7
	rdpr	%pil,	%l0
	subc	%o1,	%o0,	%i4
	wr	%o3,	%i5,	%ccr
	rd	%fprs,	%o4
	rdpr	%otherwin,	%l2
	rdpr	%gl,	%l3
	movn	%xcc,	%i6,	%o2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%softint,	%g3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xEB5, 	%hsys_tick_cmpr
	rdhpr	%hpstate,	%g1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fmuld8ulx16	%f10,	%f13,	%f2
	movvs	%icc,	%g6,	%g5
	array16	%i1,	%l4,	%i7
	wrpr	%l1,	0x1D57,	%pil
	rd	%y,	%g2
	rdhpr	%hintp,	%i3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%cansave,	%i2
	srax	%i0,	0x0D,	%g7
	tleu	%xcc,	0x1
	wrpr	%l0,	%o1,	%cwp
	rdhpr	%hsys_tick_cmpr,	%o0
	sll	%o3,	0x13,	%i5
	wrpr	%o4,	%i4,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	rdhpr	%hintp,	%i6
	rdhpr	%hintp,	%o2
	wr	%g0,	0x19,	%asi
	lduba	[%l7 + 0x2D] %asi,	%o7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x63D, 	%tick_cmpr
	wrpr	%g4,	%o6,	%pil
	rdpr	%cleanwin,	%l5
	mulscc	%g6,	%g5,	%g1
	wrpr	%i1,	0x112C,	%cwp
	movcs	%icc,	%l4,	%i7
	movpos	%xcc,	%g2,	%i3
	wrpr	%l1,	0x0116,	%pil
	wr 	%g0, 	0x6, 	%fprs
	fba,a	%fcc2,	loop_209

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	smulcc	%l0,	0x1AEF,	%o1
loop_209:
	rdpr	%gl,	%o3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x7A9, 	%hsys_tick_cmpr
	rdpr	%cwp,	%o4
	rdhpr	%htba,	%i5
	rdhpr	%hsys_tick_cmpr,	%l3
	xor	%l2,	%i6,	%i4
	fsrc2s	%f31,	%f15
	rdpr	%canrestore,	%o7
	rd	%ccr,	%g3
	ld	[%l7 + 0x14],	%f14
	tle	%xcc,	0x6
	smul	%o2,	%o6,	%g4
	rdpr	%cansave,	%l5
	wrpr	%g6,	0x07DA,	%tick
	bpos,a	loop_210
	rd	%fprs,	%g5
	wr	%g1,	%l4,	%pic
	rdpr	%tba,	%i7
loop_210:
	rdpr	%pil,	%i1
	rdpr	%cansave,	%i3
	wrpr	%l1,	%g2,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x230, 	%hsys_tick_cmpr
	wrpr	%o5,	0x09F3,	%pil
	rdhpr	%hsys_tick_cmpr,	%i0
	edge8ln	%l0,	%o1,	%o3
	xorcc	%o0,	%g7,	%o4
	rd	%sys_tick_cmpr,	%l3
	edge16	%i5,	%i6,	%l2
	tsubcc	%i4,	%o7,	%o2
	rdhpr	%hintp,	%o6
	wrpr	%g4,	0x10D4,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%cwp,	%g3
	srl	%g6,	%g1,	%l4
	rdpr	%tba,	%g5
	rdpr	%cansave,	%i1
	movl	%xcc,	%i3,	%l1
	rdhpr	%hsys_tick_cmpr,	%i2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x31C, 	%hsys_tick_cmpr
	wr	%l0,	0x0AF4,	%softint
	ldd	[%l7 + 0x28],	%o0
	rd	%softint,	%o3
	wr	%o0,	0x0E6D,	%softint
	stb	%g7,	[%l7 + 0x7C]
	rdhpr	%hpstate,	%o4
	rd	%y,	%l3
	fexpand	%f11,	%f12
	rdpr	%cwp,	%i5
	fble	%fcc2,	loop_211
	lduh	[%l7 + 0x26],	%i6
	srlx	%l2,	0x1D,	%l6
	bne,pt	%xcc,	loop_212
loop_211:
	rdhpr	%hintp,	%o7
	andncc	%o2,	%o6,	%g4
	edge16n	%l5,	%i4,	%g6
loop_212:
	subc	%g1,	0x0F19,	%g3
	xnor	%g5,	%l4,	%i1
	tg	%xcc,	0x7
	popc	%i3,	%l1
	wr	%i7,	%g2,	%ccr
	xorcc	%o5,	0x0AF2,	%i2
	wrpr	%l0,	%i0,	%tick
	add	%o3,	%o0,	%o1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xA68, 	%sys_tick_cmpr
	rdhpr	%htba,	%o4
	rdhpr	%hsys_tick_cmpr,	%i5
	edge8n	%l3,	%l2,	%l6
	fble	%fcc2,	loop_213
	rdpr	%tl,	%i6
	rd	%ccr,	%o2
	wrpr	%o7,	%o6,	%cwp
loop_213:
	rdpr	%tba,	%g4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x015, 	%hsys_tick_cmpr
	fpsub16s	%f30,	%f17,	%f11
	subcc	%g6,	%l5,	%g3
	rd	%pc,	%g5
	tge	%xcc,	0x1
	sra	%g1,	%l4,	%i3
	wr	%i1,	%i7,	%set_softint
	prefetch	[%l7 + 0x14],	 0x2
	wr	%l1,	%g2,	%set_softint

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xE39, 	%hsys_tick_cmpr
	edge32n	%i2,	%i0,	%l0
	wr	%o0,	0x0A7D,	%ccr
	wrpr	%o1,	0x1DD5,	%cwp
	fpsub16s	%f10,	%f10,	%f8

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xEC1, 	%hsys_tick_cmpr
	edge8n	%o4,	%l3,	%i5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	add	%l7,	0x60,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%l2
	casxa	[%l6] 0x89,	%l2,	%i6
	rdhpr	%hsys_tick_cmpr,	%o7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xF33, 	%hsys_tick_cmpr
	tvc	%icc,	0x1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	set	0x6C, %o4
	ldstuba	[%l7 + %o4] 0x80,	%l5
	fcmpgt16	%f24,	%f6,	%g1
	fmovda	%icc,	%f27,	%f29
	bleu,pt	%xcc,	loop_214
	tvc	%icc,	0x6
	set	0x64, %g5
	ldswa	[%l7 + %g5] 0x81,	%l4
loop_214:
	rd	%softint,	%g5
	rdhpr	%htba,	%i1
	rdpr	%wstate,	%i3
	rdpr	%pil,	%i7
	wrpr	%g2,	0x03BC,	%tick
	fnor	%f10,	%f22,	%f12

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x3B9, 	%hsys_tick_cmpr
	rdhpr	%hsys_tick_cmpr,	%i2
	rd	%softint,	%i0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%l0,	0x16E3,	%y
	wrpr	%o1,	0x1CC9,	%pil
	sdivcc	%o0,	0x18FF,	%o3
	rdhpr	%hintp,	%g7
	fbe,a	%fcc0,	loop_215
	rdhpr	%hintp,	%l3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x09C, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xE5C, 	%hsys_tick_cmpr
loop_215:
	brnz	%i6,	loop_216
	fnor	%f16,	%f14,	%f24
	addcc	%l2,	0x0473,	%o7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_216:
	fmovsa	%icc,	%f10,	%f7
	rd	%fprs,	%o6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%hintp,	%g6
	tvc	%xcc,	0x6
	rdhpr	%hintp,	%g3
	tpos	%xcc,	0x2
	fbul	%fcc0,	loop_217
	rdpr	%cleanwin,	%g1
	rd	%sys_tick_cmpr,	%i1
	fmovsg	%icc,	%f10,	%f0
loop_217:
	popc	0x1442,	%g5
	rdhpr	%htba,	%i7
	rdpr	%cwp,	%g2
	udivx	%i3,	0x1213,	%i2
	edge32ln	%i0,	%l1,	%o5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%wstate,	%o3
	movgu	%icc,	%g7,	%o0
	movge	%icc,	%o4,	%l6
	nop
	setx	loop_218,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	edge32n	%l3,	%i5,	%l2
	wr	%i6,	0x02E7,	%y
	fpadd16	%f24,	%f2,	%f30
loop_218:
	rdpr	%gl,	%g4
	wrpr	%o6,	%o7,	%pil
	tl	%xcc,	0x2
	edge8n	%i4,	%g6,	%o2
	wrpr	%g3,	%l4,	%tick
	rdpr	%cwp,	%l5
	wrpr	%i1,	%g1,	%cwp
	rdpr	%otherwin,	%g5
	movn	%xcc,	%i7,	%g2
	fmovrse	%i3,	%f13,	%f20
	rdhpr	%hsys_tick_cmpr,	%i2
	rdpr	%tba,	%i0
	fmovrse	%o5,	%f5,	%f20
	fmovdcs	%xcc,	%f0,	%f0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%o1,	%o3,	%tick
	fcmpes	%fcc3,	%f9,	%f3
	edge32n	%o0,	%o4,	%g7
	wrpr	%l3,	0x1694,	%cwp
	movrgez	%i5,	%l6,	%l2
	fpsub32	%f24,	%f8,	%f8
	ldsb	[%l7 + 0x42],	%g4
	movl	%xcc,	%i6,	%o7
	xnor	%i4,	0x07E4,	%o6
	rd	%fprs,	%g6
	wr	%o2,	%g3,	%set_softint
	rd	%tick_cmpr,	%l4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x36C, 	%hsys_tick_cmpr
	fmul8x16al	%f18,	%f7,	%f20
	set	0x10, %o5
	swapa	[%l7 + %o5] 0x0c,	%g5
	rdhpr	%hintp,	%i1
	bcc,pn	%icc,	loop_219
	rd	%asi,	%g2
	tle	%icc,	0x7
	wr	%g0,	0x81,	%asi
	lda	[%l7 + 0x10] %asi,	%f14
loop_219:
	wrpr	%i3,	0x084B,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fmul8ulx16	%f30,	%f30,	%f18
	tn	%xcc,	0x0
	rd	%pc,	%i0
	wrpr	%l0,	0x05D9,	%pil
	wrpr	%o5,	0x0D94,	%tick
	rdhpr	%hsys_tick_cmpr,	%o1
	fpsub32s	%f19,	%f0,	%f10
	rdhpr	%hsys_tick_cmpr,	%l1
	rdpr	%pil,	%o3
	wr	%o4,	%g7,	%pic
	and	%l3,	0x1335,	%i5
	rdhpr	%hsys_tick_cmpr,	%l6
	rdpr	%gl,	%l2
	wr	%o0,	0x1DBC,	%ccr
	fnegd	%f4,	%f24
	wrpr	%g4,	0x14AE,	%pil
	rdhpr	%hintp,	%o7
	bne,pn	%icc,	loop_220
	subccc	%i4,	%o6,	%g6
	edge32l	%i6,	%g3,	%o2
	rdpr	%tl,	%l4
loop_220:
	fblg,a	%fcc3,	loop_221
	wrpr	%g1,	%l5,	%pil
	rdhpr	%htba,	%g5
	tcs	%xcc,	0x3
loop_221:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%hintp,	%i3
	rd	%sys_tick_cmpr,	%i7
	sllx	%i0,	%l0,	%o5
	addccc	%o1,	%i2,	%l1
	udiv	%o4,	0x133C,	%g7
	wrpr	%o3,	0x0F7C,	%cwp
	fmovsneg	%xcc,	%f17,	%f6
	wr	%g0,	0xf0,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
	addccc	%l3,	%l6,	%l2
	wr	%i5,	%g4,	%set_softint
	fmovsl	%xcc,	%f24,	%f18

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x394, 	%hsys_tick_cmpr
	rdpr	%tba,	%o0
	wr	%o6,	%i4,	%clear_softint

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x35C, 	%hsys_tick_cmpr
	edge32l	%g3,	%o2,	%g6
	mova	%xcc,	%l4,	%l5
	rdpr	%gl,	%g5
	fnot2s	%f6,	%f10
	wr	%g2,	%g1,	%set_softint

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	brgez	%i7,	loop_222
	wrpr	%i0,	%o5,	%cwp
	fmovsneg	%xcc,	%f0,	%f22
	addccc	%o1,	%i2,	%l0
loop_222:
	rdpr	%cleanwin,	%l1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xC5C, 	%hsys_tick_cmpr
	wr	%g7,	%l3,	%ccr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	tneg	%xcc,	0x1
	rd	%pc,	%g4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x828, 	%hsys_tick_cmpr
	edge32ln	%o7,	%o6,	%i4
	wr	%i6,	0x0A4C,	%y
	and	%o0,	%o2,	%g3
	be	%xcc,	loop_223
	edge16n	%g6,	%l4,	%g5
	rd	%asi,	%l5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_223:
	rdpr	%gl,	%i3
	nop
	set	0x20, %o2
	std	%f18,	[%l7 + %o2]
	edge16ln	%i1,	%i7,	%o5
	rdpr	%otherwin,	%i0
	tpos	%xcc,	0x5
	tpos	%xcc,	0x0
	rd	%tick_cmpr,	%i2
	rd	%y,	%l0
	rdhpr	%hsys_tick_cmpr,	%o1
	for	%f30,	%f16,	%f24

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%g0,	0x0c,	%asi
	ldsba	[%l7 + 0x41] %asi,	%o3
	xnor	%o4,	0x15B3,	%g7
	alignaddr	%l2,	%l3,	%l6
	movrgez	%g4,	0x093,	%i5
	wr	%o6,	%o7,	%pic
	sdiv	%i4,	0x1DB8,	%o0
	rdpr	%otherwin,	%o2
	rdpr	%gl,	%g3
	wrpr	%g6,	%l4,	%cwp
	rd	%softint,	%g5
	tle	%xcc,	0x1
	xnor	%l5,	0x18F5,	%i6
	wr	%i3,	%g1,	%softint
	udivx	%g2,	0x18BE,	%i1
	fcmpne16	%f28,	%f16,	%i7
	rdpr	%canrestore,	%i0
	rdhpr	%hsys_tick_cmpr,	%i2
	fmovsn	%icc,	%f19,	%f13
	movne	%icc,	%o5,	%l0
	wr	%g0,	0x89,	%asi
	stwa	%o1,	[%l7 + 0x14] %asi
	rdpr	%canrestore,	%l1
	fblg	%fcc0,	loop_224
	sdivx	%o3,	0x0CA0,	%o4
	sir	0x17B0
	orcc	%l2,	0x1678,	%l3
loop_224:
	fpsub32s	%f11,	%f25,	%f26

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x37D, 	%tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fand	%f14,	%f16,	%f18
	rdpr	%tl,	%o6
	rdhpr	%hintp,	%i4
	wr	%o0,	0x1816,	%ccr
	rdpr	%cwp,	%o7
	movl	%xcc,	%o2,	%g6
	wrpr	%l4,	0x19AF,	%pil
	wr	%g5,	%l5,	%y
	edge32l	%g3,	%i3,	%g1
	rdhpr	%hsys_tick_cmpr,	%g2
	taddcc	%i1,	%i6,	%i0
	wr	%i7,	%i2,	%pic
	edge16ln	%l0,	%o1,	%l1
	tsubcctv	%o3,	0x188B,	%o4
	wr 	%g0, 	0x7, 	%fprs
	umulcc	%l3,	0x1778,	%g7
	fmovrdlez	%g4,	%f12,	%f10

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	movrgez	%l2,	%o6,	%i4
	andncc	%o0,	%o2,	%o7
	movne	%icc,	%l4,	%g6
	wr	%g0,	0x89,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	and	%g5,	%l5,	%i3
	alignaddrl	%g1,	%g2,	%g3
	fcmpgt16	%f30,	%f20,	%i6
	umul	%i0,	%i1,	%i7
	wr 	%g0, 	0x7, 	%fprs
	wrpr	%l1,	%i2,	%pil
	movle	%xcc,	%o4,	%o3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	bcs,a,pt	%xcc,	loop_225
	tvs	%xcc,	0x2
	rdhpr	%hintp,	%g7
	flush	%l7 + 0x14
loop_225:
	rdhpr	%hsys_tick_cmpr,	%o5
	edge8ln	%g4,	%l6,	%i5
	movre	%o6,	%i4,	%o0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fmovsvc	%icc,	%f0,	%f1
	wrpr	%o2,	%l4,	%tick
	subccc	%g6,	0x0B5E,	%g5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fabsd	%f16,	%f22

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	taddcc	%g3,	%i6,	%i0
	movvs	%xcc,	%l5,	%i1
	ldsb	[%l7 + 0x26],	%l0
	wr	%i2,	0x14A9,	%sys_tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x112, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%htba,	%o4
	rdpr	%tba,	%g7
	rdhpr	%hpstate,	%l3
	rdhpr	%hsys_tick_cmpr,	%o5
	wrpr	%g4,	0x0F89,	%pil
	movl	%xcc,	%l6,	%o6
	wr	%i4,	%i5,	%set_softint
	rd	%tick_cmpr,	%o0
	edge32l	%l2,	%o7,	%l4
	sdiv	%g6,	0x16C4,	%o2
	rd	%sys_tick_cmpr,	%i3
	rdhpr	%hsys_tick_cmpr,	%g1
	edge32	%g5,	%g2,	%i6
	fcmpeq32	%f10,	%f22,	%i0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x3ED, 	%tick_cmpr
	wrpr	%l5,	0x1C2B,	%pil
	fbul,a	%fcc2,	loop_226
	wrpr	%i1,	%l0,	%pil
	rdhpr	%hintp,	%o1
	rdpr	%otherwin,	%l1
loop_226:
	orn	%i7,	0x1DBA,	%i2
	wr	%o3,	0x0096,	%ccr
	fbu	%fcc0,	loop_227
	fbo,a	%fcc0,	loop_228
	addcc	%o4,	0x1089,	%l3
	andncc	%g7,	%o5,	%g4
loop_227:
	xnorcc	%l6,	%i4,	%i5
loop_228:
	mulscc	%o6,	0x14C3,	%l2
	wr	%o0,	%o7,	%set_softint
	bne,a	%icc,	loop_229
	wr	%l4,	0x1FAE,	%pic
	rdhpr	%hintp,	%o2
	rdpr	%wstate,	%g6
loop_229:
	wr	%g1,	0x0F14,	%set_softint
	orn	%i3,	0x0C13,	%g5
	rdpr	%tl,	%i6
	rdhpr	%htba,	%g2
	fpsub32	%f20,	%f30,	%f24
	srl	%i0,	%g3,	%l5
	fmovscc	%icc,	%f11,	%f1
	edge16l	%i1,	%l0,	%l1
	rdpr	%tba,	%i7
	flushw
	fmovsneg	%xcc,	%f23,	%f22

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	edge8l	%o4,	%o1,	%l3
	alignaddr	%g7,	%g4,	%l6
	rd	%ccr,	%o5
	wr	%i5,	%o6,	%y

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x754, 	%hsys_tick_cmpr
	fpadd16	%f14,	%f24,	%f28
	rdhpr	%hsys_tick_cmpr,	%o0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%hintp,	%l4
	fnot2s	%f12,	%f5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	membar	0x48
	rdpr	%tba,	%g1
	ld	[%l7 + 0x10],	%f14
	wrpr	%o2,	0x0507,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%i6,	0x0A40,	%cwp
	fcmpne32	%f26,	%f26,	%g2
	rdpr	%wstate,	%i0
	rdpr	%tba,	%i3
	rdpr	%gl,	%l5
	rd	%y,	%g3
	rdpr	%tba,	%i1
	fmovsne	%icc,	%f26,	%f9
	rdhpr	%hpstate,	%l0
	rdhpr	%hintp,	%i7
	flushw
	fabss	%f3,	%f16
	tleu	%icc,	0x0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x570, 	%hsys_tick_cmpr
	rd	%tick_cmpr,	%o3
	wrpr	%o4,	0x011E,	%pil
	fmovdvc	%xcc,	%f26,	%f13
	wrpr	%o1,	%l3,	%tick
	wrpr	%g7,	%l6,	%tick
	addcc	%o5,	0x104B,	%i5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x56C, 	%hsys_tick_cmpr
	tcs	%icc,	0x5
	rdhpr	%hintp,	%o6
	udiv	%o0,	0x11B1,	%l2
	rdpr	%tba,	%l4
	rdpr	%gl,	%o7
	edge32n	%g6,	%g1,	%g5
	movgu	%icc,	%i6,	%o2
	wrpr	%i0,	%i3,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	addcc	%g2,	%l0,	%i1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xCCC, 	%hsys_tick_cmpr
	rdhpr	%htba,	%i2
	wrpr	%o3,	0x01A6,	%pil
	wrpr	%o4,	%o1,	%pil
	rdhpr	%hsys_tick_cmpr,	%l3
	fornot2	%f8,	%f4,	%f26

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%sys_tick_cmpr,	%o5
	xnor	%i7,	%i5,	%g4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%pil,	%o0
	rdpr	%cwp,	%l2
	addcc	%l4,	0x0EF3,	%i4
	fnors	%f30,	%f26,	%f1
	sir	0x1140

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%sys_tick_cmpr,	%g1
	wr	%g6,	%i6,	%clear_softint
	andncc	%o2,	%g5,	%i0
	rdhpr	%hintp,	%l5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x5C, %g3
	lduwa	[%l7 + %g3] 0x15,	%g3
	array32	%g2,	%l0,	%i1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	popc	%i3,	%i2
	or	%o4,	0x0D71,	%o1
	rdpr	%canrestore,	%l3
	wrpr	%o3,	0x03A2,	%cwp
	mova	%xcc,	%l6,	%o5
	fmovsvc	%xcc,	%f18,	%f26
	sub	%i7,	0x1B14,	%g7
	rd	%tick_cmpr,	%i5
	nop
	set	0x2E, %o3
	ldstub	[%l7 + %o3],	%g4
	rdpr	%cwp,	%o6
	fmuld8sux16	%f23,	%f21,	%f28
	for	%f10,	%f16,	%f22
	brnz	%l2,	loop_230
	stb	%l4,	[%l7 + 0x7C]
	rd	%y,	%i4
	addc	%o0,	%g1,	%o7
loop_230:
	wr	%g6,	%o2,	%clear_softint
	fpsub16s	%f0,	%f6,	%f3
	addc	%g5,	0x06DA,	%i6
	rd	%pc,	%i0
	tvs	%xcc,	0x2
	fpack32	%f12,	%f12,	%f28
	rdhpr	%hintp,	%g3
	rdpr	%tba,	%g2
	rdpr	%tba,	%l0
	addcc	%i1,	%l1,	%l5
	rdhpr	%htba,	%i3
	fbug	%fcc3,	loop_231
	rdhpr	%hintp,	%o4
	andcc	%i2,	%o1,	%o3
	addc	%l3,	0x0EC7,	%o5
loop_231:
	rdpr	%cansave,	%i7
	wr	%l6,	%g7,	%sys_tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	movrlz	%l4,	0x2DC,	%i4
	rd	%softint,	%l2
	rdpr	%wstate,	%g1
	te	%icc,	0x4
	rd	%pc,	%o7
	fmovdcs	%xcc,	%f10,	%f9
	rd	%y,	%g6
	fxnor	%f12,	%f8,	%f6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xD70, 	%hsys_tick_cmpr
	rdhpr	%htba,	%g5
	set	0x30, %i7
	ldswa	[%l7 + %i7] 0x10,	%o2
	edge8ln	%i6,	%g3,	%g2
	andn	%i0,	0x0C54,	%i1
	wrpr	%l0,	%l1,	%tick
	srl	%l5,	%i3,	%o4
	rdhpr	%hpstate,	%i2
	sub	%o3,	0x06C0,	%o1
	rdhpr	%hintp,	%o5
	sdivx	%l3,	0x129B,	%l6
	wrpr	%i7,	0x1975,	%tick
	edge16ln	%g7,	%i5,	%o6
	addccc	%g4,	%i4,	%l4
	rdpr	%tba,	%l2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xFEE, 	%hsys_tick_cmpr
	rdhpr	%hpstate,	%o7
	fmovdvc	%icc,	%f12,	%f2
	rdhpr	%hpstate,	%g5
	or	%o0,	0x14B2,	%i6
	rdhpr	%htba,	%g3
	rdhpr	%htba,	%o2
	rdhpr	%htba,	%g2
	fornot1s	%f5,	%f18,	%f14
	set	0x50, %i0
	lda	[%l7 + %i0] 0x10,	%f17
	tge	%xcc,	0x1
	rdhpr	%hsys_tick_cmpr,	%i1
	rd	%softint,	%i0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%pil,	%l5
	wr	%i3,	%o4,	%softint
	wr	%l1,	0x0D31,	%clear_softint
	wr	%i2,	%o3,	%y
	fbne,a	%fcc3,	loop_232
	srl	%o1,	0x18,	%o5
	edge16	%l6,	%l3,	%g7
	wr	%i7,	%o6,	%ccr
loop_232:
	rd	%pc,	%g4
	edge16ln	%i4,	%l4,	%l2
	edge8l	%i5,	%g6,	%o7
	rdhpr	%hintp,	%g5
	wr	%g1,	%i6,	%ccr
	rd	%asi,	%o0
	rdpr	%cansave,	%o2
	movcc	%icc,	%g2,	%i1
	edge32ln	%g3,	%i0,	%l0
	rdhpr	%htba,	%l5
	rd	%tick_cmpr,	%i3
	stbar
	srl	%o4,	0x02,	%i2
	movrne	%o3,	%o1,	%l1
	fcmpes	%fcc0,	%f9,	%f14
	rdhpr	%hsys_tick_cmpr,	%o5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x41C, 	%hsys_tick_cmpr
	wrpr	%i4,	%g4,	%cwp
	ble,pn	%icc,	loop_233
	rdpr	%otherwin,	%l4
	rdpr	%cansave,	%i5
	tcc	%xcc,	0x7
loop_233:
	addccc	%l2,	0x196D,	%g6
	rd	%y,	%o7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x8EA, 	%hsys_tick_cmpr
	rdhpr	%hpstate,	%i6
	rd	%fprs,	%g1
	edge32ln	%o2,	%g2,	%o0
	movrgz	%i1,	%i0,	%g3
	rd	%tick_cmpr,	%l0
	fble,a	%fcc3,	loop_234
	edge32l	%l5,	%i3,	%i2
	rdpr	%cleanwin,	%o4
	set	0x70, %g1
	sta	%f6,	[%l7 + %g1] 0x81
loop_234:
	wrpr	%o1,	%o3,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x005, 	%hsys_tick_cmpr
	rdpr	%tba,	%l3
	sethi	0x1033,	%l6
	set	0x40, %l0
	stda	%f16,	[%l7 + %l0] 0x14
	set	0x7C, %i3
	ldswa	[%l7 + %i3] 0x15,	%o5
	set	0x46, %o1
	ldstuba	[%l7 + %o1] 0x04,	%g7
	wr	%i7,	0x0888,	%clear_softint
	movrlz	%o6,	%g4,	%l4
	rdhpr	%hintp,	%i4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	edge16ln	%l2,	%g6,	%g5
	wr	%g0,	0x89,	%asi
	ldxa	[%l7 + 0x20] %asi,	%o7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	orncc	%g1,	0x1EB6,	%o2
	fmovs	%f28,	%f14

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x49D, 	%tick_cmpr
	rdhpr	%hsys_tick_cmpr,	%i0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x45E, 	%hsys_tick_cmpr
	fmovsa	%icc,	%f6,	%f13
	ble,a	%icc,	loop_235
	movrlz	%l0,	%g3,	%l5
	wr	%i2,	%i3,	%sys_tick
	fors	%f7,	%f8,	%f5
loop_235:
	andncc	%o4,	%o1,	%o3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	add	%l7,	0x78,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%l3
	casa	[%l6] 0x80,	%l3,	%l6
	rdhpr	%hpstate,	%o5
	srl	%i7,	%g7,	%o6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xEDF, 	%hsys_tick_cmpr
	nop
	setx loop_236, %l0, %l1
	jmpl %l1, %l4
	wrpr	%i5,	0x0B3F,	%tick
	rd	%tick_cmpr,	%g6
	wr	%g5,	%o7,	%pic
loop_236:
	wr	%i6,	0x06E1,	%y
	rdhpr	%hsys_tick_cmpr,	%g1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%hpstate,	%l2
	wr	%o0,	0x05E2,	%set_softint

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	rd	%pc,	%l0
	fmovdl	%xcc,	%f12,	%f21
	rdpr	%gl,	%g3
	smulcc	%i1,	%i2,	%i3
	orn	%o4,	%l5,	%o3
	movgu	%icc,	%o1,	%l3
	rdpr	%otherwin,	%l1
	rdhpr	%hsys_tick_cmpr,	%o5
	fbg,a	%fcc0,	loop_237
	rdhpr	%htba,	%i7
	edge8l	%g7,	%l6,	%g4
	wr	%o6,	%l4,	%clear_softint
loop_237:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x8C2, 	%hsys_tick_cmpr
	rdpr	%pil,	%g5
	fmovdleu	%icc,	%f14,	%f25
	fabss	%f9,	%f28
	rdhpr	%hsys_tick_cmpr,	%o7
	tcs	%xcc,	0x2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xA01, 	%tick_cmpr
	wrpr	%g1,	0x1C28,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x601, 	%hsys_tick_cmpr
	wrpr	%o2,	0x13D0,	%tick
	movpos	%icc,	%l2,	%i0
	edge8ln	%o0,	%l0,	%g3
	brlez	%i1,	loop_238
	wr	%i3,	0x1203,	%clear_softint

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x086, 	%hsys_tick_cmpr
	wr	%g0,	0xf8,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
loop_238:
	wr	%o3,	%l5,	%pic

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xA9C, 	%hsys_tick_cmpr
	wr	%o1,	%o5,	%softint
	fpsub32	%f30,	%f26,	%f26
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tge	%icc,	0x2
	rd	%sys_tick_cmpr,	%i7
	or	%l1,	%g7,	%l6
	rdpr	%pil,	%o6
	xorcc	%g4,	0x0A74,	%i5
	wrpr	%i4,	%l4,	%pil
	udivcc	%o7,	0x062D,	%g5
	subcc	%i6,	%g1,	%g2
	tvs	%xcc,	0x6
	rdpr	%cwp,	%g6
	rdpr	%cansave,	%o2
	taddcc	%l2,	0x1BCE,	%o0
	rdpr	%canrestore,	%i0
	rd	%asi,	%g3
	rdhpr	%htba,	%l0
	rd	%y,	%i3
	rdpr	%cansave,	%i2
	wrpr	%o4,	%i1,	%tick
	addc	%l5,	%o3,	%l3
	bne	loop_239
	rdpr	%tba,	%o5
	rd	%fprs,	%o1
	movre	%i7,	%l1,	%l6
loop_239:
	rdpr	%gl,	%g7
	wr	%g4,	0x1579,	%y
	alignaddr	%i5,	%i4,	%o6
	rdhpr	%hintp,	%l4
	rdpr	%cwp,	%o7
	movpos	%xcc,	%i6,	%g5
	fbne	%fcc0,	loop_240
	rdhpr	%hpstate,	%g2
	bg,a,pn	%xcc,	loop_241
	movn	%xcc,	%g1,	%o2
loop_240:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x8FA, 	%hsys_tick_cmpr
	andncc	%o0,	%i0,	%g3
loop_241:
	fzeros	%f9
	rdpr	%tl,	%l0
	rdhpr	%hsys_tick_cmpr,	%g6
	edge16l	%i2,	%i3,	%o4
	brgez,a	%i1,	loop_242
	wr	%l5,	0x1AC5,	%sys_tick
	rdpr	%gl,	%l3
	sll	%o3,	0x02,	%o5
loop_242:
	wrpr	%o1,	0x0F32,	%pil
	rdhpr	%htba,	%i7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x595, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xBC6, 	%hsys_tick_cmpr
	rdpr	%gl,	%l6
	fpmerge	%f6,	%f18,	%f30
	array16	%i4,	%i5,	%o6
	movl	%icc,	%l4,	%i6
	rdhpr	%hsys_tick_cmpr,	%o7
	wrpr	%g2,	%g1,	%tick
	rdpr	%tba,	%o2
	fsrc2	%f6,	%f16
	rdpr	%tba,	%l2
	flushw
	rdpr	%wstate,	%g5
	rdhpr	%hpstate,	%o0
	movleu	%icc,	%i0,	%g3
	fabsd	%f8,	%f2
	rd	%tick_cmpr,	%g6
	wrpr	%l0,	%i3,	%tick
	rdpr	%cleanwin,	%i2
	alignaddr	%i1,	%o4,	%l3
	wrpr	%o3,	%l5,	%tick
	wr	%o5,	%o1,	%clear_softint
	wr	%g0,	0x19,	%asi
	ldsba	[%l7 + 0x61] %asi,	%l1
	tleu	%xcc,	0x7
	rdpr	%wstate,	%i7
	wrpr	%g4,	0x07CB,	%tick
	rd	%y,	%g7
	subcc	%i4,	0x12DB,	%i5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%tick_cmpr,	%o6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%cwp,	%o7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xD74, 	%hsys_tick_cmpr
	fmovrdgz	%g1,	%f18,	%f20
	fmovrdgez	%l2,	%f8,	%f24
	rdhpr	%htba,	%g5
	xnorcc	%o0,	0x1FF2,	%i0
	rdhpr	%hintp,	%g3
	rdpr	%pil,	%g6
	movcc	%xcc,	%i3,	%l0
	rdhpr	%htba,	%i2
	rdpr	%tl,	%i1
	addccc	%o4,	%o3,	%l3
	tn	%xcc,	0x0
	for	%f18,	%f14,	%f30

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	movneg	%icc,	%o1,	%o5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x022, 	%hsys_tick_cmpr
	nop
	set	0x28, %l5
	ldsw	[%l7 + %l5],	%g7
	srlx	%g4,	0x15,	%i4
	tn	%icc,	0x1
	andcc	%i5,	%l4,	%l6
	sdivx	%o6,	0x009E,	%i6
	std	%f14,	[%l7 + 0x70]
	sdivx	%o7,	0x1AF5,	%g2
	xnor	%o2,	%g1,	%g5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x0D4, 	%sys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%hpstate,	%g3
	wrpr	%g6,	%i3,	%tick
	edge8ln	%l0,	%i1,	%i2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	tsubcctv	%o4,	0x0357,	%l5
	rd	%ccr,	%o1
	fcmpne32	%f30,	%f12,	%o5
	rdhpr	%hsys_tick_cmpr,	%l3
	rd	%y,	%l1
	movl	%xcc,	%g7,	%i7
	rdhpr	%hpstate,	%i4
	subc	%g4,	%l4,	%l6
	alignaddr	%i5,	%i6,	%o6
	sll	%o7,	0x15,	%o2
	sth	%g1,	[%l7 + 0x5C]
	movrne	%g2,	%l2,	%g5
	rdpr	%cansave,	%o0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%g6,	0x0F95,	%cwp
	movre	%i3,	0x015,	%i0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xD93, 	%sys_tick_cmpr
	wr	%g0,	0x80,	%asi
	ldswa	[%l7 + 0x64] %asi,	%i2
	fandnot1	%f10,	%f20,	%f8
	movcc	%xcc,	%l5,	%o1
	edge32l	%o5,	%o4,	%l1
	rdhpr	%hintp,	%l3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%cansave,	%g4
	orn	%i4,	%l4,	%l6
	tne	%xcc,	0x5
	umul	%i6,	%o6,	%i5
	xnor	%o7,	%o2,	%g2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xF0B, 	%hsys_tick_cmpr
	set	0x28, %i4
	ldsba	[%l7 + %i4] 0x14,	%l2
	rdhpr	%hintp,	%g5
	lduh	[%l7 + 0x50],	%g3
	movrgz	%g6,	0x1D3,	%o0
	sethi	0x0E9A,	%i3
	rd	%asi,	%i0
	lduh	[%l7 + 0x42],	%i1
	movrlz	%o3,	0x2DC,	%l0
	brgez	%i2,	loop_243
	brgz,a	%o1,	loop_244
	movg	%icc,	%l5,	%o4
	rdhpr	%htba,	%o5
loop_243:
	tpos	%icc,	0x7
loop_244:
	rdpr	%cwp,	%l3
	movn	%xcc,	%l1,	%i7
	rdhpr	%hpstate,	%g4
	smulcc	%i4,	0x0819,	%g7
	rd	%sys_tick_cmpr,	%l4
	wrpr	%i6,	%o6,	%cwp
	lduh	[%l7 + 0x34],	%i5
	addcc	%l6,	%o2,	%g2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x637, 	%hsys_tick_cmpr
	rd	%softint,	%g5
	rd	%pc,	%g3
	rdpr	%pil,	%o7
	rd	%fprs,	%o0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32l	%i3,	%g6,	%i0
	fpsub16s	%f13,	%f4,	%f23
	rdpr	%gl,	%o3
	lduh	[%l7 + 0x3C],	%i1
	rd	%asi,	%l0
	rdhpr	%htba,	%o1
	andncc	%l5,	%o4,	%o5
	wr	%g0,	0x04,	%asi
	lduba	[%l7 + 0x2F] %asi,	%i2
	mova	%icc,	%l3,	%i7
	wrpr	%g4,	0x1B42,	%pil
	fcmpes	%fcc1,	%f17,	%f21
	addc	%l1,	%i4,	%l4
	array8	%g7,	%i6,	%i5
	wr	%o6,	%l6,	%ccr
	wr	%g2,	0x0F57,	%y
	fzeros	%f15
	rdpr	%cleanwin,	%o2
	or	%g1,	%l2,	%g5
	rdpr	%gl,	%g3
	fpmerge	%f19,	%f22,	%f30
	rd	%tick_cmpr,	%o7
	rd	%softint,	%o0
	andncc	%i3,	%g6,	%o3
	te	%icc,	0x1
	wrpr	%i1,	%l0,	%pil
	rdhpr	%hpstate,	%o1
	wr	%l5,	%o4,	%sys_tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x02A, 	%hsys_tick_cmpr
	fpadd16	%f6,	%f16,	%f30
	rd	%fprs,	%l3
	rd	%fprs,	%i0
	movvs	%xcc,	%i7,	%g4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xEBD, 	%hsys_tick_cmpr
	ldub	[%l7 + 0x27],	%i4
	udiv	%l4,	0x1D1A,	%i6
	rdhpr	%htba,	%g7
	rd	%fprs,	%i5
	wr	%l6,	0x09BE,	%sys_tick
	rdhpr	%htba,	%g2
	rdhpr	%htba,	%o6
	rdpr	%wstate,	%o2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x179, 	%sys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fcmped	%fcc3,	%f30,	%f18

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xE22, 	%hsys_tick_cmpr
	rd	%asi,	%i3
	rd	%softint,	%g1
	fpsub16	%f24,	%f14,	%f0
	rdhpr	%htba,	%o3
	rdpr	%canrestore,	%g6
	wrpr	%l0,	0x1EF3,	%tick
	rd	%pc,	%i1
	wr	%o1,	%o4,	%sys_tick
	movrgz	%l5,	0x126,	%o5
	rdhpr	%hpstate,	%l3
	fmovsvc	%icc,	%f2,	%f29
	rdhpr	%hsys_tick_cmpr,	%i0
	nop
	setx	loop_245,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	st	%f0,	[%l7 + 0x64]

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%wstate,	%g4
loop_245:
	rd	%fprs,	%i7
	rd	%sys_tick_cmpr,	%l1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xF3F, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	srax	%g7,	%l6,	%g2
	movpos	%icc,	%o6,	%l2
	call	loop_246
	rdpr	%cleanwin,	%o2
	edge16	%g3,	%g5,	%o7
	bvc,pn	%xcc,	loop_247
loop_246:
	membar	0x31
	wrpr	%i3,	0x08B4,	%cwp
	fsrc2	%f2,	%f4
loop_247:
	tcc	%xcc,	0x7
	ldub	[%l7 + 0x09],	%g6
	wrpr	%o3,	%l0,	%pil
	wrpr	%i1,	%o1,	%pil
	wrpr	%l5,	%o4,	%pil
	wr	%o5,	%l3,	%sys_tick
	sdiv	%i2,	0x00C4,	%g4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	bgu,a,pn	%icc,	loop_248
	wr	%l4,	%i6,	%sys_tick
	rd	%sys_tick_cmpr,	%i7
	rd	%softint,	%i5
loop_248:
	rdhpr	%htba,	%g7
	wr	%l6,	%i4,	%sys_tick
	sdiv	%g2,	0x1733,	%o6
	fnot1	%f2,	%f10
	rd	%fprs,	%o2
	rdhpr	%hsys_tick_cmpr,	%l2
	ldsw	[%l7 + 0x50],	%g3
	addccc	%o7,	0x1C15,	%g5
	fmovspos	%xcc,	%f11,	%f3
	rdpr	%gl,	%i3
	wr	%g1,	0x1888,	%pic
	wr	%g0,	0x80,	%asi
	ldsba	[%l7 + 0x26] %asi,	%o0
	rdhpr	%hsys_tick_cmpr,	%g6
	rdhpr	%hintp,	%l0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x301, 	%hsys_tick_cmpr
	rd	%asi,	%o3
	rdhpr	%hpstate,	%l5
	rdpr	%otherwin,	%o4
	tge	%icc,	0x7
	rd	%pc,	%l3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x573, 	%hsys_tick_cmpr
	andcc	%o5,	0x05FF,	%g4
	sra	%i0,	0x1B,	%l1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xC6E, 	%hsys_tick_cmpr
	wr	%i7,	0x046F,	%sys_tick
	wr 	%g0, 	0x4, 	%fprs
	edge32l	%i4,	%g2,	%o6
	wr	%g0,	0x1f,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
	tsubcc	%o2,	0x04E8,	%l6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%ccr,	%g5
	add	%l7,	0x30,	%l6
	wr	%g0,	0x11,	%asi
	casxa	[%l6] 0x11,	%o7,	%g1
	wrpr	%o0,	%i3,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x2F5, 	%hsys_tick_cmpr
	wrpr	%l0,	%i1,	%tick
	fnot2s	%f23,	%f18

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x737, 	%hsys_tick_cmpr
	wr	%l5,	0x1471,	%clear_softint
	wr	%l3,	0x1C56,	%ccr
	rdhpr	%hsys_tick_cmpr,	%i2
	rd	%y,	%o5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xABF, 	%hsys_tick_cmpr
	tge	%icc,	0x5
	fmuld8ulx16	%f13,	%f20,	%f2
	rd	%pc,	%g4
	rd	%y,	%l1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x120, 	%hsys_tick_cmpr
	wrpr	%i7,	0x0E3D,	%tick
	umul	%g7,	0x0DD7,	%l4
	stw	%i5,	[%l7 + 0x34]
	fmul8sux16	%f22,	%f26,	%f0
	rdpr	%cwp,	%i4
	movge	%icc,	%g2,	%o2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xFEB, 	%hsys_tick_cmpr
	rdhpr	%hintp,	%o6
	fmovdvs	%xcc,	%f9,	%f23
	wrpr	%g3,	%o7,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	addc	%o0,	0x19FB,	%g5
	wr	%i3,	0x0347,	%set_softint
	fmovrsgz	%l0,	%f28,	%f26
	tcs	%xcc,	0x4
	mova	%icc,	%i1,	%g6
	rdpr	%cwp,	%o3
	udivx	%o1,	0x11FE,	%l3
	wrpr	%l5,	0x16F6,	%tick
	rdhpr	%hsys_tick_cmpr,	%o5
	rd	%y,	%i2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%hintp,	%g4
	rd	%asi,	%l1
	wr	%i6,	%i7,	%set_softint
	move	%xcc,	%g7,	%i0
	rd	%softint,	%l4
	wr	%i4,	0x1F0F,	%pic
	wr	%g2,	0x196D,	%set_softint
	rd	%asi,	%i5
	udivcc	%l6,	0x1B33,	%l2
	fbl	%fcc2,	loop_249
	edge16	%o2,	%g3,	%o6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x2DB, 	%hsys_tick_cmpr
	or	%g5,	0x02C1,	%i3
loop_249:
	rd	%sys_tick_cmpr,	%o0
	movvc	%xcc,	%i1,	%l0
	wrpr	%o3,	%g6,	%pil
	wrpr	%l3,	%l5,	%cwp
	rdpr	%tba,	%o5
	rdpr	%wstate,	%o1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x3CC, 	%hsys_tick_cmpr
	udivx	%l1,	0x1DAF,	%g4
	rdhpr	%hsys_tick_cmpr,	%i7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%i6,	%l4,	%cwp
	rdhpr	%htba,	%i0
	fmovrde	%i4,	%f30,	%f20
	edge32n	%g2,	%l6,	%l2
	wrpr	%o2,	0x1A1E,	%cwp
	fmovrdne	%g3,	%f12,	%f10
	wrpr	%i5,	%o6,	%tick
	rdpr	%gl,	%g1
	rdpr	%gl,	%g5
	rdhpr	%hsys_tick_cmpr,	%i3
	wrpr	%o0,	%i1,	%tick
	fand	%f22,	%f22,	%f24
	subccc	%o7,	0x04EE,	%l0
	fmovdg	%xcc,	%f7,	%f0
	set	0x18, %l6
	stha	%o3,	[%l7 + %l6] 0x18
	wr	%g6,	0x0644,	%ccr
	rdpr	%wstate,	%l5
	wrpr	%l3,	0x035E,	%cwp
	rdpr	%cansave,	%o1
	rdpr	%canrestore,	%o5
	rdpr	%pil,	%o4
	smulcc	%i2,	%l1,	%i7
	rdhpr	%hpstate,	%g7
	set	0x20, %g2
	stwa	%i6,	[%l7 + %g2] 0x27
	membar	#Sync
	edge32ln	%g4,	%i0,	%l4
	rd	%tick_cmpr,	%g2
	wrpr	%i4,	%l2,	%cwp
	rd	%softint,	%o2
	brlez	%l6,	loop_250
	edge8l	%g3,	%i5,	%g1
	stb	%g5,	[%l7 + 0x5D]
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_250:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%htba,	%o6
	srax	%i1,	%o7,	%o0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x7D9, 	%hsys_tick_cmpr
	tvs	%icc,	0x1
	rdhpr	%hsys_tick_cmpr,	%l5
	tl	%icc,	0x1
	fmovsl	%icc,	%f27,	%f17
	wr	%g6,	%l3,	%y
	wr	%o1,	0x19B2,	%set_softint
	rdpr	%otherwin,	%o4
	wr 	%g0, 	0x6, 	%fprs

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%htba,	%i6
	fxors	%f8,	%f3,	%f27
	wr	%g0,	0x80,	%asi
	swapa	[%l7 + 0x68] %asi,	%g4
	smul	%i0,	0x0170,	%i7
	bpos,a,pn	%xcc,	loop_251
	rdpr	%otherwin,	%g2
	subccc	%l4,	%l2,	%i4
	rdhpr	%htba,	%o2
loop_251:
	fba,a	%fcc2,	loop_252
	rdhpr	%hintp,	%g3
	addcc	%i5,	0x16A7,	%g1
	wrpr	%g5,	0x144D,	%cwp
loop_252:
	umul	%i3,	0x0BB9,	%l6
	edge16	%o6,	%i1,	%o7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x46A, 	%tick_cmpr
	rdhpr	%hsys_tick_cmpr,	%l5
	orcc	%g6,	0x0534,	%l3
	wr	%o3,	0x1241,	%ccr
	wr	%o1,	0x05BE,	%pic
	fors	%f13,	%f20,	%f20
	rdhpr	%hsys_tick_cmpr,	%i2
	bleu,a	loop_253
	srl	%o4,	%l1,	%o5
	fblg,a	%fcc3,	loop_254
	wrpr	%i6,	0x0673,	%tick
loop_253:
	rdhpr	%hsys_tick_cmpr,	%g4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xF29, 	%hsys_tick_cmpr
loop_254:
	edge32l	%g7,	%i7,	%g2
	wrpr	%l2,	0x15B6,	%cwp
	orncc	%l4,	0x03E5,	%o2
	or	%i4,	%i5,	%g3
	smulcc	%g1,	0x0182,	%g5
	wr	%i3,	%o6,	%sys_tick
	udiv	%l6,	0x0473,	%i1
	rdpr	%gl,	%o7
	andn	%o0,	0x1B53,	%l5
	tgu	%icc,	0x3
	fmovdleu	%xcc,	%f25,	%f11
	rdhpr	%hpstate,	%g6
	orcc	%l3,	%l0,	%o3
	wrpr	%i2,	%o4,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	edge8n	%l1,	%i6,	%o5
	wrpr	%g4,	%g7,	%pil
	wr	%i7,	0x0FE5,	%y
	subc	%i0,	0x14A5,	%l2
	set	0x40, %l1
	ldda	[%l7 + %l1] 0x19,	%f0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x6BA, 	%tick_cmpr
	wrpr	%l4,	%o2,	%cwp
	wr	%i5,	%i4,	%clear_softint
	popc	%g1,	%g3
	wrpr	%g5,	0x16C1,	%pil
	movpos	%xcc,	%i3,	%l6
	rd	%ccr,	%i1
	ld	[%l7 + 0x10],	%f11
	sub	%o7,	%o0,	%o6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%l3,	%l0,	%y
	edge16	%o3,	%i2,	%o4
	rd	%tick_cmpr,	%l1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	add	%l7,	0x58,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] %asi,	%g4,	%o5
	rd	%softint,	%i7
	rdpr	%otherwin,	%g7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xED4, 	%tick_cmpr
	rdpr	%pil,	%g2
	fpsub32s	%f8,	%f18,	%f7
	rd	%fprs,	%o2
	wrpr	%i5,	0x1595,	%pil
	rd	%pc,	%l4
	taddcctv	%i4,	%g1,	%g5
	rd	%pc,	%i3
	tvs	%icc,	0x1
	rdpr	%wstate,	%l6
	fbul,a	%fcc3,	loop_255
	rdhpr	%hpstate,	%i1
	ldstub	[%l7 + 0x19],	%o7
loop_255:
	wr	%o0,	0x16CF,	%sys_tick
	fmovspos	%xcc,	%f23,	%f8
	sra	%l5,	0x0C,	%o6
	tneg	%icc,	0x2
	edge8ln	%g6,	%l3,	%o3
	movpos	%xcc,	%i2,	%l0
	wr	%o4,	0x0208,	%ccr
	fmovrsgz	%l1,	%f19,	%f6
	wr	%o1,	0x15A9,	%clear_softint
	xnorcc	%g4,	0x0496,	%o5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%tl,	%i6
	bcc,a,pt	%icc,	loop_256
	rdhpr	%hsys_tick_cmpr,	%i0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%cansave,	%g7
loop_256:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%tick_cmpr,	%o2
	edge32n	%l4,	%g1,	%g5
	rdhpr	%hsys_tick_cmpr,	%i3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%i1,	%i4,	%clear_softint
	te	%icc,	0x5
	rd	%ccr,	%g3
	edge8ln	%o7,	%l5,	%o0
	rdhpr	%htba,	%o6
	brnz,a	%g6,	loop_257
	ta	%icc,	0x4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x864, 	%hsys_tick_cmpr
	edge16	%i2,	%o3,	%l0
loop_257:
	udivcc	%l1,	0x18AB,	%o1
	rdhpr	%hpstate,	%g4
	wr	%o5,	0x0B31,	%softint
	edge16l	%o4,	%i7,	%i6
	movvc	%xcc,	%l2,	%g7
	rd	%ccr,	%i0
	fsrc2	%f12,	%f26
	rd	%tick_cmpr,	%g2
	rd	%ccr,	%o2
	rd	%sys_tick_cmpr,	%i5
	subc	%l4,	%g1,	%g5
	sdivcc	%l6,	0x08C7,	%i1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%cwp,	%g3
	wrpr	%l5,	%o7,	%cwp
	ldsh	[%l7 + 0x3C],	%o0
	rd	%softint,	%g6
	movne	%icc,	%o6,	%l3
	movcs	%xcc,	%o3,	%l0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x913, 	%hsys_tick_cmpr
	wr	%g0,	0x23,	%asi
	stwa	%i2,	[%l7 + 0x7C] %asi
	membar	#Sync
	tneg	%icc,	0x7
	fbuge,a	%fcc2,	loop_258
	ldd	[%l7 + 0x70],	%f30
	wrpr	%o1,	0x1B29,	%tick
	mulx	%g4,	0x1DDF,	%o5
loop_258:
	rdhpr	%hintp,	%i7
	tne	%xcc,	0x7
	wr	%o4,	0x07F6,	%pic
	rdpr	%wstate,	%l2
	wrpr	%g7,	%i0,	%cwp
	movre	%g2,	%o2,	%i5
	srlx	%l4,	%i6,	%g1
	movvc	%xcc,	%l6,	%i1
	wrpr	%i4,	0x137B,	%tick
	rdpr	%tba,	%g5
	fors	%f28,	%f7,	%f24
	rdpr	%pil,	%i3
	udivx	%l5,	0x0F1C,	%g3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fbn,a	%fcc3,	loop_259
	edge8l	%g6,	%o6,	%l3
	prefetch	[%l7 + 0x14],	 0x2
	rd	%softint,	%o3
loop_259:
	wrpr	%l0,	%o0,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	taddcc	%i2,	0x1581,	%g4
	tl	%icc,	0x0
	fbue,a	%fcc3,	loop_260
	edge8	%o1,	%o5,	%o4
	rd	%tick_cmpr,	%l2
	nop
	setx	loop_261,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_260:
	rdpr	%wstate,	%g7
	movre	%i0,	0x0A9,	%i7
	edge8	%g2,	%i5,	%l4
loop_261:
	rd	%ccr,	%i6
	rdpr	%wstate,	%o2
	rdhpr	%hpstate,	%l6
	wr 	%g0, 	0x5, 	%fprs
	sub	%i4,	%g5,	%l5
	rdhpr	%htba,	%g3
	movrgz	%o7,	0x345,	%g6
	subccc	%o6,	0x121C,	%i3
	wrpr	%o3,	%l3,	%tick
	fmovsgu	%xcc,	%f28,	%f25
	sethi	0x1FCF,	%o0
	wrpr	%l0,	%i2,	%cwp
	movrgez	%g4,	%o1,	%l1
	movleu	%icc,	%o4,	%o5
	rdpr	%tba,	%g7
	rdhpr	%hpstate,	%l2
	rdhpr	%hintp,	%i7
	rdhpr	%htba,	%i0
	fcmple16	%f4,	%f22,	%i5
	fba	%fcc1,	loop_262
	edge8	%l4,	%g2,	%i6
	rd	%ccr,	%o2
	tl	%xcc,	0x0
loop_262:
	rd	%fprs,	%i1
	bne	loop_263
	rdpr	%tl,	%g1
	rd	%asi,	%i4
	wr	%g5,	%l5,	%set_softint
loop_263:
	movrlz	%g3,	%o7,	%g6
	st	%f17,	[%l7 + 0x38]
	taddcctv	%o6,	0x12E3,	%i3
	rdpr	%otherwin,	%o3
	set	0x6C, %g7
	lda	[%l7 + %g7] 0x0c,	%f7
	rd	%tick_cmpr,	%l3
	bcc,a,pt	%xcc,	loop_264
	wrpr	%o0,	0x0F23,	%cwp
	movrgez	%l0,	%l6,	%g4
	wr 	%g0, 	0x4, 	%fprs
loop_264:
	nop
	add	%l7,	0x40,	%l6
	wr	%g0,	0x0c,	%asi
	ldxa	[%l6] %asi,	%o1
	casxa	[%l6] 0x0c,	%o1,	%o4
	wr	%o5,	0x15AE,	%set_softint
	wrpr	%l1,	0x125C,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fbge,a	%fcc3,	loop_265
	wrpr	%i7,	%i5,	%pil
	mulscc	%i0,	0x06A3,	%g2
	movg	%xcc,	%l4,	%i6
loop_265:
	nop
	set	0x08, %o6
	sta	%f30,	[%l7 + %o6] 0x88
	andcc	%i1,	0x1D93,	%g1
	rdpr	%cwp,	%o2
	rdhpr	%hsys_tick_cmpr,	%i4
	movrlz	%l5,	0x035,	%g3
	be	%icc,	loop_266
	xor	%g5,	0x1E2B,	%g6
	flushw
	wr	%o6,	%o7,	%sys_tick
loop_266:
	rdhpr	%htba,	%i3
	edge32	%l3,	%o0,	%l0
	fpsub32s	%f18,	%f17,	%f13
	rdpr	%wstate,	%o3
	rdhpr	%hsys_tick_cmpr,	%g4
	wr	%i2,	0x04A7,	%set_softint
	and	%l6,	0x1A14,	%o4
	wr	%o1,	%l1,	%pic
	wrpr	%o5,	%l2,	%pil
	fnor	%f20,	%f30,	%f2
	fsrc2s	%f31,	%f18
	rdpr	%cwp,	%i7
	rdhpr	%hpstate,	%i5
	fxors	%f7,	%f0,	%f25
	rd	%ccr,	%g7
	or	%g2,	0x06E1,	%l4
	or	%i6,	0x0049,	%i0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xE5A, 	%hsys_tick_cmpr
	rdhpr	%hsys_tick_cmpr,	%o2
	rdhpr	%hpstate,	%l5
	wrpr	%g3,	0x04DF,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x4A1, 	%hsys_tick_cmpr
	andncc	%o6,	%g6,	%o7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%i3,	0x1C04,	%cwp
	wrpr	%l0,	0x05AC,	%tick
	rd	%y,	%o3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%o0,	%i2,	%sys_tick
	rdpr	%wstate,	%o4
	rdpr	%wstate,	%l6
	fmovscs	%xcc,	%f23,	%f17
	lduh	[%l7 + 0x4A],	%l1
	tge	%icc,	0x1
	rdpr	%gl,	%o5
	fabsd	%f26,	%f8
	rdhpr	%hintp,	%o1
	rdpr	%wstate,	%l2
	rdpr	%tl,	%i5
	srl	%i7,	0x05,	%g2
	set	0x74, %i6
	sta	%f28,	[%l7 + %i6] 0x11
	orn	%g7,	0x08A6,	%l4
	wr	%i6,	0x16BA,	%pic
	andncc	%g1,	%i0,	%i1
	rdhpr	%hsys_tick_cmpr,	%o2
	fmovs	%f6,	%f13
	tle	%icc,	0x6
	rdhpr	%hintp,	%l5
	tne	%xcc,	0x1
	swap	[%l7 + 0x28],	%g3
	wrpr	%i4,	%o6,	%tick
	fmovdle	%xcc,	%f26,	%f27
	rdpr	%cansave,	%g6
	tne	%icc,	0x7
	wr	%g5,	%l3,	%set_softint
	fble,a	%fcc2,	loop_267
	fmovrdgez	%i3,	%f30,	%f30
	wrpr	%l0,	0x1837,	%tick
	rdhpr	%hsys_tick_cmpr,	%o3
loop_267:
	rdhpr	%hintp,	%o7
	wrpr	%g4,	%i2,	%cwp
	umul	%o4,	%l6,	%l1
	wr	%g0,	0x88,	%asi
	stwa	%o5,	[%l7 + 0x28] %asi
	movpos	%icc,	%o0,	%l2
	wr	%i5,	0x16AC,	%sys_tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	andncc	%g2,	%i7,	%l4
	edge8n	%i6,	%g1,	%g7
	fpack32	%f28,	%f6,	%f4
	fnor	%f8,	%f6,	%f30
	mulx	%i0,	0x09A5,	%o2
	rdhpr	%hintp,	%i1
	srax	%g3,	0x09,	%i4
	sdivx	%o6,	0x01A1,	%g5
	rdhpr	%hintp,	%g6
	nop
	set	0x68, %g4
	prefetch	[%l7 + %g4],	 0x2
	rdpr	%canrestore,	%l3
	wrpr	%i3,	0x1792,	%tick
	wr	%l0,	0x1B57,	%sys_tick
	fblg,a	%fcc3,	loop_268
	rdpr	%canrestore,	%o3
	rd	%fprs,	%g4
	tle	%icc,	0x1
loop_268:
	srlx	%i2,	%o7,	%l6
	sll	%l1,	%o4,	%o5
	fmovsneg	%icc,	%f23,	%f8
	wrpr	%o0,	%i5,	%pil
	rdpr	%tba,	%l2
	movne	%icc,	%o1,	%i7
	rd	%asi,	%g2
	wr	%g0,	0x2a,	%asi
	stha	%l4,	[%l7 + 0x70] %asi
	membar	#Sync
	fbge	%fcc3,	loop_269
	wrpr	%i6,	0x1B60,	%tick
	wr	%g1,	%i0,	%pic
	rdpr	%tba,	%g7
loop_269:
	ble,a,pn	%xcc,	loop_270
	fmovse	%xcc,	%f13,	%f20
	rd	%asi,	%o2
	udiv	%g3,	0x069E,	%i4
loop_270:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdcs	%xcc,	%f3,	%f6
	movle	%icc,	%i1,	%o6
	wr	%g5,	0x0FCD,	%set_softint
	edge16	%l5,	%l3,	%g6
	rdhpr	%hintp,	%l0
!Yo - got one - imm_asi 0x52 
!And yo - immediate is 0x220
	wr	%g0,	0x52,	%asi
	stxa	%o3,	[%g0 + 0x220] %asi
	rdhpr	%hsys_tick_cmpr,	%i3
	wrpr	%i2,	%g4,	%cwp
	rdhpr	%htba,	%o7
	sir	0x0FCB

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x7AC, 	%hsys_tick_cmpr
	std	%i6,	[%l7 + 0x10]
	udiv	%o4,	0x18C3,	%o5
	taddcc	%o0,	%l2,	%o1
	movrgez	%i5,	%g2,	%i7
	array8	%l4,	%g1,	%i0
	movrne	%g7,	%i6,	%g3
	rd	%sys_tick_cmpr,	%i4
	movgu	%icc,	%i1,	%o2
	rdhpr	%hsys_tick_cmpr,	%g5
	rdhpr	%hintp,	%l5
	rd	%y,	%o6
	movpos	%xcc,	%l3,	%l0
	sllx	%o3,	0x1C,	%g6
	fmovrslz	%i2,	%f0,	%f27
	rdhpr	%hsys_tick_cmpr,	%g4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	stb	%l1,	[%l7 + 0x22]
	flushw
	rdpr	%tba,	%o0
	taddcctv	%l2,	%o1,	%i5
	addccc	%g2,	0x0802,	%o5
	rdhpr	%hintp,	%l4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	orncc	%i0,	%g7,	%i7
	fpadd16	%f22,	%f26,	%f12
	taddcctv	%i6,	%g3,	%i4
	rdpr	%cleanwin,	%i1
	sll	%g5,	0x07,	%o2
	tle	%icc,	0x3
	rd	%asi,	%o6
	rd	%y,	%l5
	wrpr	%l3,	0x1487,	%tick
	rdhpr	%htba,	%o3
	rdhpr	%htba,	%g6
	wr	%l0,	0x0E7F,	%softint
	edge32n	%i2,	%o7,	%g4
	edge32	%i3,	%l6,	%o4
	sub	%o0,	%l1,	%l2
	rdhpr	%hintp,	%i5
	rdpr	%pil,	%g2
	rdhpr	%htba,	%o1
	tcc	%icc,	0x1
	rd	%asi,	%l4
	orncc	%o5,	%g1,	%g7
	fble,a	%fcc0,	loop_271
	rdhpr	%hsys_tick_cmpr,	%i0
	rdhpr	%htba,	%i7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x965, 	%hsys_tick_cmpr
loop_271:
	rd	%pc,	%g3
	fmovdgu	%icc,	%f24,	%f16
	fandnot1	%f6,	%f14,	%f0
	wrpr	%g5,	%o2,	%cwp
	fzero	%f18
	movne	%xcc,	%o6,	%l5
	fmul8ulx16	%f4,	%f2,	%f0
	rdhpr	%htba,	%l3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x367, 	%hsys_tick_cmpr
	wr	%o3,	%g6,	%y
	rd	%pc,	%i2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%i3,	%g4,	%clear_softint
	sdivx	%l6,	0x01F8,	%o0
	movrlz	%l1,	%l2,	%i5
	movrlz	%o4,	%g2,	%o1
	ldsb	[%l7 + 0x68],	%l4
	brnz	%o5,	loop_272
	wr	%g1,	%g7,	%clear_softint
	fmovrslez	%i0,	%f19,	%f24
	rdpr	%tl,	%i6
loop_272:
	rdpr	%tba,	%i7
	rdhpr	%hsys_tick_cmpr,	%g3
	tl	%xcc,	0x1
	rdhpr	%hpstate,	%g5
	wrpr	%i4,	0x0B58,	%cwp
	rdhpr	%hsys_tick_cmpr,	%o6
	wr	%l5,	0x1A91,	%ccr
	rdpr	%cwp,	%l3
	fmovs	%f14,	%f22
	rdhpr	%hsys_tick_cmpr,	%i1
	membar	0x29
	rdpr	%tba,	%o3
	rdpr	%canrestore,	%g6
	wr	%o2,	0x1D92,	%set_softint
	rd	%fprs,	%i2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%htba,	%g4
	wr 	%g0, 	0x6, 	%fprs
	bne	%xcc,	loop_273
	umulcc	%l0,	0x177A,	%o0
	tvs	%xcc,	0x1
	wrpr	%l2,	%i5,	%pil
loop_273:
	rdpr	%gl,	%o4
	fcmpes	%fcc3,	%f1,	%f17

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%cwp,	%l4
	sethi	0x02AC,	%o5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x9AC, 	%hsys_tick_cmpr
	rdhpr	%hintp,	%g1
	rd	%asi,	%i0
	rd	%ccr,	%g7
	tle	%xcc,	0x3
	fpsub16	%f14,	%f24,	%f24
	fpadd16s	%f19,	%f16,	%f21
	wr	%i7,	%g3,	%pic
	sdiv	%i6,	0x076F,	%i4
	wrpr	%g5,	%l5,	%tick
	wr	%g0,	0x80,	%asi
	lda	[%l7 + 0x0C] %asi,	%f8
	rdpr	%tl,	%o6
	or	%l3,	0x0D9C,	%i1
	fnors	%f27,	%f8,	%f2
	mulscc	%g6,	%o2,	%o3
	wr	%i2,	%i3,	%sys_tick
	rdpr	%pil,	%o7
	te	%icc,	0x3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fmovse	%xcc,	%f28,	%f31
	fmovrde	%o0,	%f14,	%f20
	tcc	%xcc,	0x7
	rdhpr	%hsys_tick_cmpr,	%l0
	movvc	%xcc,	%i5,	%o4
	wr	%g0,	0x89,	%asi
	sta	%f26,	[%l7 + 0x08] %asi
	tsubcc	%l2,	0x128F,	%l1
	ldstub	[%l7 + 0x4E],	%l4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x491, 	%hsys_tick_cmpr
	taddcctv	%o1,	0x1DD0,	%g1
	fmul8x16	%f19,	%f28,	%f20
	fcmpd	%fcc2,	%f2,	%f12
	wrpr	%g7,	%i7,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fmovrdlz	%i6,	%f22,	%f20
	movl	%xcc,	%i4,	%l5
	movcc	%icc,	%g5,	%o6
	fmovrde	%i1,	%f4,	%f18

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%g6,	%o2,	%cwp
	ldstub	[%l7 + 0x62],	%i2
	rdhpr	%hsys_tick_cmpr,	%o3
	wr	%o7,	0x06FF,	%sys_tick
	fpmerge	%f30,	%f22,	%f18

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x06E, 	%hsys_tick_cmpr
	rdhpr	%hintp,	%l6
	rdhpr	%hintp,	%o0
	umulcc	%g4,	%i5,	%l0
	fcmped	%fcc0,	%f8,	%f10
	xor	%l2,	%o4,	%l4
	rdpr	%pil,	%l1
	rd	%y,	%g2
	rdhpr	%hsys_tick_cmpr,	%o1
	bg,a,pt	%icc,	loop_274
	movn	%icc,	%g1,	%g7
	rdpr	%cwp,	%o5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_274:
	rdhpr	%hpstate,	%i6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x112, 	%hsys_tick_cmpr
	rdpr	%cwp,	%l5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x3DF, 	%hsys_tick_cmpr
	rdhpr	%htba,	%i1
	add	%g5,	0x1B93,	%l3
	rdhpr	%hintp,	%o2
	rdpr	%gl,	%g6
	ldsh	[%l7 + 0x58],	%i2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xDEA, 	%hsys_tick_cmpr
	fmovdneg	%icc,	%f29,	%f25
	wrpr	%o3,	%i3,	%pil
	movre	%l6,	0x3E0,	%g4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x8BE, 	%hsys_tick_cmpr
	rdpr	%pil,	%l0
	taddcctv	%l2,	0x0532,	%o4
	orncc	%o0,	%l1,	%g2
	rdhpr	%hintp,	%o1
	wrpr	%l4,	0x189C,	%tick
	for	%f18,	%f24,	%f4
	rdpr	%cansave,	%g1
	rd	%softint,	%g7
	wr	%i0,	%g3,	%y
	brlz	%o5,	loop_275
	mulscc	%i7,	%i4,	%i6
	rd	%softint,	%l5
	wrpr	%o6,	%g5,	%tick
loop_275:
	rdhpr	%hsys_tick_cmpr,	%l3
	or	%o2,	0x0DA3,	%g6
	edge32ln	%i2,	%o7,	%i1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x870, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xAE8, 	%hsys_tick_cmpr
	te	%icc,	0x3
	rd	%tick_cmpr,	%l0
	mova	%icc,	%i5,	%o4
	mulscc	%l2,	0x159B,	%o0
	rdhpr	%hintp,	%g2
	wr	%l1,	%o1,	%y
	fmovrdlez	%l4,	%f24,	%f14
	addc	%g1,	0x18FD,	%g7
	rdpr	%wstate,	%g3
	rd	%y,	%o5
	movneg	%icc,	%i0,	%i4
	movle	%xcc,	%i7,	%l5
	movcs	%xcc,	%o6,	%g5
	alignaddr	%l3,	%i6,	%g6
	rdpr	%canrestore,	%i2
	wrpr	%o2,	%o7,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x6FB, 	%hsys_tick_cmpr
	fmovdge	%xcc,	%f28,	%f5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x0A8, 	%hsys_tick_cmpr
	rdpr	%tba,	%l6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsgu	%xcc,	%f1,	%f15
	movrgez	%o3,	%g4,	%l0
	rdpr	%cwp,	%o4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x3BB, 	%hsys_tick_cmpr
	rd	%softint,	%g2
	rdhpr	%hpstate,	%l2
	alignaddr	%l1,	%o1,	%g1
	udiv	%g7,	0x01B6,	%g3
	fmovrse	%l4,	%f7,	%f21

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x50B, 	%hsys_tick_cmpr
	rd	%pc,	%o5
	sll	%i7,	0x05,	%l5
	rd	%tick_cmpr,	%g5
	edge32l	%o6,	%i6,	%g6
	sir	0x03EF

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%gl,	%o7
	wrpr	%i3,	0x00DE,	%pil
	fmovdleu	%icc,	%f6,	%f15
	rdpr	%gl,	%i1
	wrpr	%i2,	%o3,	%tick
	rdpr	%cansave,	%l6
	wrpr	%g4,	0x0D0D,	%tick
	rdpr	%otherwin,	%o4
	rd	%pc,	%l0
	fandnot2s	%f23,	%f27,	%f4
	fbul,a	%fcc0,	loop_276
	rdpr	%cleanwin,	%o0
	rd	%sys_tick_cmpr,	%g2
	sllx	%i5,	%l1,	%l2
loop_276:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xEC3, 	%tick_cmpr
	brnz,a	%g3,	loop_277
	flushw
	bleu,a,pn	%icc,	loop_278
	movvs	%xcc,	%o1,	%l4
loop_277:
	wrpr	%i4,	%i0,	%cwp
	nop
	setx	loop_279,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_278:
	fnot1s	%f18,	%f19
	wr 	%g0, 	0x6, 	%fprs
	rdpr	%otherwin,	%l5
loop_279:
	tg	%xcc,	0x7
	fone	%f4
	sethi	0x13F0,	%i7
	rdhpr	%htba,	%o6
	wrpr	%g5,	0x082C,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	xnorcc	%l3,	0x0F55,	%o2
	ldstub	[%l7 + 0x0A],	%i6
	orncc	%o7,	%i3,	%i2
	srl	%i1,	0x0B,	%l6
	rdhpr	%htba,	%o3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	rdhpr	%hsys_tick_cmpr,	%o4
	rd	%fprs,	%o0
	wr	%l0,	%i5,	%pic
	rdhpr	%htba,	%l1
	fmul8sux16	%f2,	%f22,	%f20
	wr	%l2,	%g1,	%set_softint
	tvc	%icc,	0x6
	smulcc	%g7,	0x1957,	%g3
	rd	%pc,	%o1
	fornot1s	%f12,	%f30,	%f24
	rdhpr	%htba,	%l4
	wrpr	%g2,	0x0667,	%tick
	rdpr	%otherwin,	%i4
	rdpr	%pil,	%o5
	fcmped	%fcc1,	%f14,	%f8
	popc	0x1554,	%l5
	rd	%fprs,	%i7
	wr	%i0,	%o6,	%pic
	rdhpr	%hsys_tick_cmpr,	%g5
	rdhpr	%hsys_tick_cmpr,	%g6
	fmovdne	%xcc,	%f27,	%f10
	tcc	%xcc,	0x1
	rdpr	%tba,	%l3
	wrpr	%o2,	%o7,	%pil
	for	%f30,	%f16,	%f18
	wrpr	%i6,	0x0300,	%cwp
	mova	%xcc,	%i3,	%i2
	fmovs	%f14,	%f5
	rdhpr	%htba,	%i1
	rdhpr	%hsys_tick_cmpr,	%o3
	fmul8x16al	%f27,	%f4,	%f6
	rdhpr	%hsys_tick_cmpr,	%l6
	rdpr	%cansave,	%o4
	movcs	%xcc,	%o0,	%i5
	fnegd	%f8,	%f4
	rdpr	%canrestore,	%l1
	rd	%y,	%l0
	addcc	%g1,	0x0BCC,	%l2
	rd	%softint,	%g7
	fmovrdgez	%o1,	%f30,	%f0
	ta	%icc,	0x4
	rdpr	%cleanwin,	%g3
	wrpr	%g2,	0x061D,	%tick
	wrpr	%l4,	0x0574,	%tick
	wr	%o5,	%l5,	%y
	rdhpr	%hpstate,	%i7
	set	0x0C, %i2
	lduwa	[%l7 + %i2] 0x10,	%i0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	tcc	%icc,	0x1
	tpos	%xcc,	0x7
	sdiv	%o6,	0x0F03,	%g5
	movcs	%icc,	%l3,	%g6
	wrpr	%o2,	0x1CF6,	%tick
	movre	%o7,	0x16B,	%i3
	wrpr	%i2,	0x0C76,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%l6,	%i1,	%tick
	wr	%g4,	%o0,	%softint
	rdpr	%otherwin,	%i5
	fmovde	%icc,	%f12,	%f17
	rdpr	%tba,	%l1
	rd	%ccr,	%l0
	rdpr	%tl,	%o4
	smulcc	%l2,	%g7,	%o1
	wrpr	%g3,	0x0204,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x0D8, 	%hsys_tick_cmpr
	tvs	%xcc,	0x6
	rdhpr	%hpstate,	%o5
	edge32n	%l4,	%l5,	%i0
	bg	%icc,	loop_280
	wrpr	%i7,	%i4,	%pil
	membar	#Sync
	wr	%g0,	0xf9,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
loop_280:
	rdhpr	%htba,	%g5
	fmovsl	%xcc,	%f19,	%f31
	bgu,a,pt	%xcc,	loop_281
	udiv	%o6,	0x0F4B,	%g6
	brlez	%l3,	loop_282
	alignaddr	%o2,	%i3,	%o7
loop_281:
	rdpr	%pil,	%i6
	tleu	%xcc,	0x4
loop_282:
	rdpr	%tl,	%o3
	movn	%icc,	%l6,	%i2
	wr	%g0,	0x0c,	%asi
	ldsba	[%l7 + 0x27] %asi,	%i1
	fmovrde	%g4,	%f2,	%f20
	rd	%pc,	%i5
	wr	%o0,	%l0,	%clear_softint
	smul	%l1,	0x0657,	%l2
	wr 	%g0, 	0x5, 	%fprs

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x540, 	%hsys_tick_cmpr
	fbe	%fcc3,	loop_283
	fbg,a	%fcc3,	loop_284
	rd	%ccr,	%g1
loop_283:
	fbug,a	%fcc3,	loop_285
loop_284:
	fble	%fcc2,	loop_286
	wrpr	%g3,	0x0795,	%cwp
	rdhpr	%hintp,	%g2
loop_285:
	sth	%l4,	[%l7 + 0x52]
loop_286:
	sethi	0x1019,	%l5
	wrpr	%o5,	0x07B9,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x11A, 	%hsys_tick_cmpr
	edge16n	%i7,	%i4,	%o6
	wrpr	%g6,	%g5,	%cwp
	rd	%softint,	%l3
	rdpr	%canrestore,	%o2
	rdpr	%gl,	%o7
	wr	%i6,	0x1625,	%pic
	sub	%i3,	0x058B,	%o3
	andncc	%i2,	%i1,	%g4
	rd	%asi,	%l6
	fmovdle	%xcc,	%f19,	%f26
	fbul	%fcc1,	loop_287
	array32	%o0,	%l0,	%l1
	fcmple32	%f22,	%f8,	%i5
	wrpr	%l2,	%o1,	%cwp
loop_287:
	rdpr	%cwp,	%g7
	rdhpr	%hsys_tick_cmpr,	%g1
	tneg	%icc,	0x5
	rdpr	%cleanwin,	%g3
	wrpr	%g2,	0x0122,	%cwp
	and	%o4,	0x0AE4,	%l5
	fcmpgt32	%f22,	%f20,	%l4
	rdhpr	%hintp,	%i0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x991, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	udivx	%o5,	0x1D84,	%o2
	smul	%l3,	0x06CC,	%o7
	tgu	%icc,	0x6
	wr	%i3,	0x14B3,	%sys_tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fmul8x16al	%f1,	%f30,	%f28
	brlz	%o3,	loop_288
	rdhpr	%hsys_tick_cmpr,	%i2
	tcs	%icc,	0x2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x3FB, 	%hsys_tick_cmpr
loop_288:
	taddcctv	%l6,	0x19FA,	%l0
	wr 	%g0, 	0x5, 	%fprs
	wrpr	%l2,	0x1FC8,	%tick
	wrpr	%l1,	0x03AD,	%tick
	sra	%o1,	%g1,	%g7
	add	%g3,	0x00C6,	%g2
	rdhpr	%hpstate,	%o4
	fmul8x16al	%f7,	%f31,	%f18
	wrpr	%i0,	0x0A99,	%tick
	wr	%i7,	%i4,	%clear_softint
	subcc	%l4,	0x0C97,	%o6
	ldx	[%l7 + 0x48],	%g6
	rd	%asi,	%o5
	fbule	%fcc1,	loop_289
	rdhpr	%hintp,	%o2
	sub	%l3,	0x01B6,	%g5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xDF1, 	%hsys_tick_cmpr
loop_289:
	nop
	wr	%g0,	0x18,	%asi
	ldxa	[%l7 + 0x58] %asi,	%o7
	tleu	%xcc,	0x3
	wrpr	%i6,	%o3,	%tick
	rd	%tick_cmpr,	%i1
	flush	%l7 + 0x58
	membar	0x00
	rd	%softint,	%g4
	rd	%ccr,	%i2
	set	0x48, %l3
	stxa	%l6,	[%l7 + %l3] 0xea
	membar	#Sync
	andncc	%l0,	%o0,	%l2
	edge8l	%l1,	%o1,	%i5
	wr	%g1,	%g7,	%clear_softint
	alignaddrl	%g2,	%o4,	%l5
	rd	%fprs,	%g3
	srl	%i0,	%i4,	%i7
	addccc	%l4,	0x04B5,	%o6
	or	%o5,	0x10A8,	%g6
	sth	%l3,	[%l7 + 0x60]
	rd	%pc,	%g5
	wr 	%g0, 	0x7, 	%fprs
	wrpr	%o7,	0x1B43,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x8E8, 	%hsys_tick_cmpr
	edge8l	%o3,	%i1,	%o2
	wr	%g0,	0x89,	%asi
	lduba	[%l7 + 0x0E] %asi,	%g4
	wrpr	%i2,	0x0587,	%tick
	add	%l0,	%l6,	%o0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	tne	%xcc,	0x1
	prefetch	[%l7 + 0x14],	 0x3
	wrpr	%i5,	0x0E46,	%cwp
	rd	%fprs,	%g1
	movge	%xcc,	%l1,	%g7
	wrpr	%g2,	0x0959,	%pil
	movpos	%icc,	%o4,	%l5
	wrpr	%i0,	0x1064,	%pil
	fpadd32	%f8,	%f12,	%f6
	rdhpr	%hpstate,	%g3
	tl	%xcc,	0x6
	rdpr	%otherwin,	%i4
	edge8l	%i7,	%l4,	%o6
	rdpr	%canrestore,	%o5
	fmuld8ulx16	%f18,	%f4,	%f0
	rd	%softint,	%g6
	movcs	%xcc,	%g5,	%i3
	rd	%pc,	%l3
	movge	%xcc,	%i6,	%o7
	rdhpr	%hsys_tick_cmpr,	%o3
	fpack32	%f24,	%f12,	%f14
	fpsub32	%f8,	%f8,	%f0
	fble,a	%fcc2,	loop_290
	orcc	%i1,	0x085B,	%g4
	set	0x20, %o7
	stda	%o2,	[%l7 + %o7] 0x22
	membar	#Sync
loop_290:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%asi,	%l6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x81E, 	%sys_tick_cmpr
	rd	%asi,	%o1
	fmovsg	%icc,	%f1,	%f11
	fmovdgu	%icc,	%f9,	%f12
	lduh	[%l7 + 0x3C],	%i5
	tcs	%xcc,	0x1
	rdpr	%otherwin,	%l2
	ldsb	[%l7 + 0x50],	%g1
	brlez	%l1,	loop_291
	rdhpr	%hpstate,	%g2
	wrpr	%g7,	%o4,	%cwp
	wrpr	%i0,	%g3,	%tick
loop_291:
	wrpr	%i4,	%i7,	%cwp
	fmovsne	%icc,	%f26,	%f22
	fand	%f0,	%f6,	%f28
	rd	%softint,	%l5
	fmul8x16	%f3,	%f10,	%f10
	wrpr	%o6,	%l4,	%tick
	flushw

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xD81, 	%hsys_tick_cmpr
	wr 	%g0, 	0x4, 	%fprs
	fcmpne16	%f4,	%f26,	%l3
	or	%g6,	%o7,	%o3
	rdpr	%cansave,	%i6
	rdhpr	%hintp,	%i1
	rd	%pc,	%o2
	rdhpr	%htba,	%l0
	wr	%g4,	%l6,	%set_softint
	fbl,a	%fcc0,	loop_292
	fbo,a	%fcc0,	loop_293
	wr	%i2,	0x1947,	%ccr
	movn	%icc,	%o0,	%i5
loop_292:
	rd	%ccr,	%l2
loop_293:
	sllx	%g1,	0x0C,	%l1
	bge,pt	%icc,	loop_294
	rdhpr	%hpstate,	%o1
	tne	%icc,	0x7
	wrpr	%g2,	0x1B49,	%cwp
loop_294:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x68, %o0
	stha	%g7,	[%l7 + %o0] 0x0c
	orcc	%o4,	%g3,	%i0
	alignaddr	%i7,	%l5,	%i4
	rdpr	%gl,	%o6
	xorcc	%o5,	0x1B2C,	%l4
	te	%xcc,	0x7
	rdpr	%tl,	%i3
	rd	%pc,	%g5
	set	0x5C, %i5
	stwa	%g6,	[%l7 + %i5] 0x81
	fnands	%f6,	%f25,	%f5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%l3,	%i6,	%tick
	edge16ln	%i1,	%l0,	%g4
	fmovdneg	%xcc,	%f30,	%f2
	wr	%l6,	%i2,	%clear_softint
	edge16ln	%o0,	%i5,	%l2
	wrpr	%o2,	0x1740,	%pil
	movg	%icc,	%l1,	%g1
	rdhpr	%hintp,	%o1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%g2,	0x0714,	%cwp
	fornot2s	%f29,	%f14,	%f27
	rd	%tick_cmpr,	%o4
	fmovspos	%icc,	%f11,	%f0
	wrpr	%i0,	%g3,	%tick
	rdhpr	%hsys_tick_cmpr,	%l5
	rd	%asi,	%i7
	wrpr	%i4,	0x1C05,	%pil
	rdpr	%gl,	%o6
	wrpr	%l4,	0x1446,	%cwp
	sdiv	%i3,	0x1C34,	%o5
	tcs	%icc,	0x2
	movneg	%icc,	%g6,	%o7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	bgu,a	%xcc,	loop_295
	addccc	%l3,	%i6,	%o3
	movrgz	%i1,	0x0B9,	%l0
	xnorcc	%l6,	0x159D,	%i2
loop_295:
	bge,a	%xcc,	loop_296
	rd	%softint,	%o0
	wrpr	%g4,	0x01D2,	%pil
	rdhpr	%htba,	%l2
loop_296:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xFBA, 	%hsys_tick_cmpr
	fand	%f22,	%f24,	%f14
	rdpr	%tl,	%o1
	rdpr	%tl,	%g7
	rdhpr	%hintp,	%g2
	rdhpr	%htba,	%o4
	rdhpr	%htba,	%i0
	wr	%g3,	0x017A,	%pic
	rdpr	%tba,	%g1
	rdpr	%pil,	%i7
	wrpr	%l5,	0x0C54,	%tick
	rdhpr	%hintp,	%o6
	rdhpr	%hpstate,	%l4
	fsrc2s	%f22,	%f2
	rdhpr	%hintp,	%i4
	rdhpr	%hsys_tick_cmpr,	%o5
	movrgz	%i3,	%o7,	%g5
	fnand	%f18,	%f2,	%f6
	andn	%l3,	%g6,	%i6
	wrpr	%o3,	%i1,	%cwp
	wr	%g0,	0x2a,	%asi
	stxa	%l6,	[%l7 + 0x68] %asi
	membar	#Sync
	srax	%i2,	%o0,	%l0
	wrpr	%g4,	%l2,	%cwp
	fnors	%f23,	%f11,	%f12
	fsrc2	%f0,	%f12
	wrpr	%l1,	%i5,	%pil
	fmovs	%f16,	%f26
	wr	%o2,	%o1,	%pic
	wrpr	%g7,	0x0900,	%pil
	wrpr	%o4,	%g2,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	sub	%g3,	0x09F1,	%i7
	tne	%xcc,	0x2
	ta	%icc,	0x7
	rdhpr	%hsys_tick_cmpr,	%o6
	bcc,pn	%xcc,	loop_297
	wrpr	%l4,	0x0674,	%tick
	wrpr	%i4,	0x09AF,	%cwp
	wrpr	%l5,	0x138B,	%tick
loop_297:
	rdhpr	%htba,	%i3
	wr	%o5,	0x1130,	%pic
	orncc	%o7,	%l3,	%g5
	edge8ln	%i6,	%g6,	%o3
	fbge	%fcc1,	loop_298
	fxnor	%f24,	%f30,	%f14
	rdpr	%otherwin,	%l6
	wr 	%g0, 	0x6, 	%fprs
loop_298:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	tpos	%icc,	0x1
	mulx	%l0,	0x1857,	%g4
	wrpr	%l2,	%i5,	%tick
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	rdhpr	%hsys_tick_cmpr,	%l1
	rdhpr	%hsys_tick_cmpr,	%o1
	fmovdcs	%icc,	%f23,	%f26
	fbule,a	%fcc3,	loop_299
	ta	%xcc,	0x2
	rd	%tick_cmpr,	%g7
	rdhpr	%hpstate,	%o2
loop_299:
	wrpr	%o4,	0x130F,	%cwp
	rdpr	%cleanwin,	%i0
	wrpr	%g1,	0x1E66,	%tick
	sdivcc	%g2,	0x01D2,	%i7
	rdhpr	%htba,	%g3
	fnand	%f2,	%f16,	%f24
	move	%xcc,	%o6,	%l4
	wrpr	%i4,	0x1751,	%pil
	rdhpr	%htba,	%l5
	wrpr	%o5,	%o7,	%pil
	rdhpr	%hpstate,	%l3
	rd	%softint,	%i3
	fmovdne	%icc,	%f18,	%f26
	rdpr	%cwp,	%i6
	sllx	%g6,	%g5,	%l6
	rd	%sys_tick_cmpr,	%i1
	tle	%icc,	0x7
	rdhpr	%hsys_tick_cmpr,	%i2
	subc	%o0,	0x059D,	%o3
	wrpr	%l0,	0x12CC,	%tick
	sllx	%l2,	%i5,	%l1
	rdhpr	%hintp,	%g4
	wr	%o1,	%o2,	%softint
	wrpr	%o4,	%g7,	%cwp
	bneg,pn	%xcc,	loop_300
	wr 	%g0, 	0x5, 	%fprs
	fxor	%f22,	%f30,	%f14
	wrpr	%g2,	%g1,	%cwp
loop_300:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	fabsd	%f2,	%f24
	wr	%g3,	0x15A1,	%pic

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	rdpr	%wstate,	%l5
	wr	%l4,	0x16AC,	%pic
	udivcc	%o7,	0x08B8,	%l3
	rdhpr	%htba,	%o5
	rdhpr	%hsys_tick_cmpr,	%i6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bneg,a	loop_301
	movcs	%xcc,	%i3,	%g6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x2F2, 	%hsys_tick_cmpr
	xnor	%i2,	%o0,	%o3
loop_301:
	rdhpr	%hintp,	%l0
	rd	%asi,	%g5
	wrpr	%l2,	0x1755,	%tick
	wr	%g0,	0x11,	%asi
	swapa	[%l7 + 0x10] %asi,	%i5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xBC5, 	%sys_tick_cmpr
	wrpr	%o1,	%o2,	%cwp
	wrpr	%o4,	%g4,	%pil
	add	%l7,	0x58,	%l6
	wr	%g0,	0x11,	%asi
	ldxa	[%l6] %asi,	%i0
	casxa	[%l6] 0x11,	%i0,	%g7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xB45, 	%hsys_tick_cmpr
	wr	%i7,	%o6,	%sys_tick
	rd	%sys_tick_cmpr,	%g3
	rdpr	%canrestore,	%i4
	rd	%pc,	%l5
	rdpr	%gl,	%o7
	movvs	%xcc,	%l4,	%l3
	rd	%pc,	%i3
	rdpr	%tl,	%g6
	movcc	%xcc,	%i6,	%l6
	rdhpr	%hintp,	%i1
	rdpr	%pil,	%i2
	rdpr	%pil,	%o3
	rdhpr	%hpstate,	%l0
	wr	%o0,	%l2,	%pic
	movvc	%xcc,	%i5,	%g5
	fnand	%f0,	%f16,	%f14
	udiv	%l1,	0x0210,	%o2
	rdhpr	%htba,	%o1
	rdhpr	%hsys_tick_cmpr,	%o4
	wrpr	%g4,	%g7,	%tick
	rdpr	%cwp,	%g2
	rdpr	%cleanwin,	%g1
	movne	%icc,	%i0,	%o6
	fmovsgu	%icc,	%f5,	%f21
	wrpr	%g3,	0x1A32,	%tick
	xnor	%l5,	0x1C20,	%i4
	bneg,a,pn	%xcc,	loop_302
	rdpr	%tl,	%l4
	fxor	%f12,	%f22,	%f26
	add	%l7,	0x48,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] %asi,	%l3,	%o7
loop_302:
	xor	%o5,	0x0A36,	%i3
	tg	%xcc,	0x3
	fbo,a	%fcc0,	loop_303
	edge16n	%i6,	%g6,	%l6
	rd	%softint,	%i2
	rdhpr	%hsys_tick_cmpr,	%i1
loop_303:
	fmovrde	%o3,	%f24,	%f12
	wrpr	%l0,	0x1CE8,	%cwp
	edge32ln	%o0,	%l2,	%g5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x136, 	%hsys_tick_cmpr
	rdpr	%gl,	%o1
	wrpr	%l1,	%g4,	%cwp
	wr	%g0,	0x10,	%asi
	stda	%g6,	[%l7 + 0x60] %asi
	rdpr	%tl,	%g2
	movvs	%xcc,	%o4,	%i7
	rdhpr	%hpstate,	%i0
	wr	%g1,	%o6,	%ccr
	add	%l5,	0x08D5,	%i4
	wr 	%g0, 	0x6, 	%fprs
	movrlez	%l3,	%o7,	%i3
	fpsub16s	%f6,	%f2,	%f4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x2EB, 	%hsys_tick_cmpr
	rdhpr	%hpstate,	%i6
	rd	%sys_tick_cmpr,	%l6
	nop
	setx	loop_304,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	rd	%tick_cmpr,	%i1
	rd	%asi,	%i2
	move	%icc,	%o3,	%l0
loop_304:
	wrpr	%l2,	%o0,	%tick
	fmuld8sux16	%f27,	%f15,	%f6
	movne	%xcc,	%g5,	%i5
	rdpr	%tba,	%o1
	ldub	[%l7 + 0x58],	%o2
	wrpr	%g4,	0x0E75,	%cwp
	rd	%sys_tick_cmpr,	%g7
	rdpr	%cwp,	%l1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x7C3, 	%hsys_tick_cmpr
	rdhpr	%htba,	%i7
	fbn,a	%fcc2,	loop_305
	wr	%i0,	0x02D3,	%clear_softint
	fbo	%fcc1,	loop_306
	rd	%ccr,	%g1
loop_305:
	edge32n	%l5,	%i4,	%l4
	wrpr	%o6,	%g3,	%pil
loop_306:
	wr 	%g0, 	0x6, 	%fprs
	edge16n	%o5,	%g6,	%l3
	wrpr	%l6,	0x1372,	%pil
	rdhpr	%htba,	%i1
	xor	%i2,	%i6,	%o3
	smul	%l2,	%l0,	%o0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	call	loop_307
	ble,a,pn	%xcc,	loop_308
	fpackfix	%f20,	%f10
	wr	%o2,	%g4,	%pic
loop_307:
	fba,a	%fcc0,	loop_309
loop_308:
	ldsh	[%l7 + 0x7C],	%g7
	taddcc	%l1,	%o4,	%o1
	edge16l	%g2,	%i0,	%g1
loop_309:
	fmovrdgz	%l5,	%f0,	%f18

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xC29, 	%hsys_tick_cmpr
	wrpr	%i4,	0x1E9E,	%cwp
	set	0x18, %g6
	stxa	%o6,	[%l7 + %g6] 0x23
	membar	#Sync
	movrne	%l4,	0x28C,	%g3
	rdpr	%wstate,	%o7
	movneg	%icc,	%i3,	%g6
	rdhpr	%htba,	%o5
	ldd	[%l7 + 0x38],	%f4
	ldsb	[%l7 + 0x60],	%l3
	edge8	%l6,	%i2,	%i6
	rdhpr	%hpstate,	%o3
	srax	%l2,	0x0A,	%i1
	fcmpne16	%f26,	%f16,	%o0
	wrpr	%l0,	0x15FF,	%pil
	fbule	%fcc2,	loop_310
	fpadd16s	%f12,	%f12,	%f3
	bge,pt	%xcc,	loop_311
	bgu,a	loop_312
loop_310:
	sir	0x0541
	bneg,a	loop_313
loop_311:
	brnz,a	%i5,	loop_314
loop_312:
	rdhpr	%hsys_tick_cmpr,	%o2
	rd	%tick_cmpr,	%g5
loop_313:
	flushw
loop_314:
	wr	%g7,	0x0363,	%clear_softint
	ble,a,pt	%xcc,	loop_315
	te	%xcc,	0x4
	wrpr	%g4,	0x0F95,	%pil
	umulcc	%o4,	0x04B0,	%o1
loop_315:
	brz,a	%g2,	loop_316
	edge16n	%l1,	%i0,	%l5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xBEB, 	%hsys_tick_cmpr
	rd	%ccr,	%g1
loop_316:
	tpos	%xcc,	0x5
	alignaddr	%i4,	%l4,	%g3
	rd	%asi,	%o6
	sth	%i3,	[%l7 + 0x30]
	rdhpr	%hsys_tick_cmpr,	%g6
	bl,pn	%icc,	loop_317
	fzeros	%f30
	movn	%icc,	%o5,	%o7
	rdhpr	%hpstate,	%l6
loop_317:
	fmovrdgez	%i2,	%f2,	%f14
	wr	%i6,	0x1E47,	%clear_softint
	wr	%l3,	%o3,	%pic

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x14A, 	%hsys_tick_cmpr
	wrpr	%o0,	0x025E,	%tick
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xA82, 	%hsys_tick_cmpr
	wrpr	%i5,	0x016A,	%tick
	set	0x68, %l4
	stha	%g5,	[%l7 + %l4] 0x18
	edge16	%g7,	%o2,	%g4
	rd	%asi,	%o1
	umulcc	%g2,	0x09F5,	%o4
	nop
	setx	loop_318,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	orn	%i0,	%l5,	%i7
	bneg,a	%icc,	loop_319
	movne	%icc,	%l1,	%i4
loop_318:
	edge8n	%l4,	%g1,	%o6
	wrpr	%g3,	%i3,	%tick
loop_319:
	fmovsa	%xcc,	%f9,	%f3
	rdhpr	%hpstate,	%g6
	wrpr	%o7,	0x0AED,	%tick
	rd	%asi,	%l6
	srl	%o5,	%i6,	%l3
	bgu,a,pn	%icc,	loop_320
	wr	%o3,	0x03D0,	%softint
	wr	%l2,	0x1E4A,	%sys_tick
	smul	%i2,	%l0,	%o0
loop_320:
	rdpr	%gl,	%i1
	movne	%xcc,	%g5,	%i5
	tleu	%xcc,	0x0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%hintp,	%o1
	wr	%g7,	0x1BF4,	%pic

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x075, 	%hsys_tick_cmpr
	pdist	%f10,	%f28,	%f14
	tl	%xcc,	0x4
	rdhpr	%hsys_tick_cmpr,	%i0
	edge8ln	%l5,	%g2,	%l1
	edge32ln	%i4,	%l4,	%i7
	movle	%xcc,	%o6,	%g3
	fbne	%fcc0,	loop_321
	rdhpr	%hsys_tick_cmpr,	%g1
	wrpr	%i3,	%o7,	%cwp
	rdhpr	%hpstate,	%g6
loop_321:
	rdhpr	%hpstate,	%l6
	wrpr	%i6,	%l3,	%cwp
	wrpr	%o5,	%l2,	%tick
	wr	%i2,	0x063C,	%pic
	sra	%o3,	%l0,	%i1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xD8E, 	%hsys_tick_cmpr
	wrpr	%o2,	%g5,	%pil
	rdhpr	%hsys_tick_cmpr,	%o1
	set	0x20, %l2
	stba	%g4,	[%l7 + %l2] 0xeb
	membar	#Sync
	fble,a	%fcc0,	loop_322
	brlz,a	%o4,	loop_323
	rd	%fprs,	%i0
	smulcc	%l5,	0x1033,	%g2
loop_322:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_323:
	xor	%l1,	0x18E3,	%l4
	tcc	%icc,	0x2
	rd	%softint,	%i7
	rdhpr	%hintp,	%o6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x584, 	%hsys_tick_cmpr
	wrpr	%i3,	0x1EC1,	%pil
	wrpr	%g3,	%o7,	%cwp
	pdist	%f2,	%f22,	%f4
	fbul,a	%fcc3,	loop_324
	wrpr	%g6,	%l6,	%pil
	sdiv	%l3,	0x1FDB,	%i6
	wrpr	%l2,	%i2,	%cwp
loop_324:
	ldd	[%l7 + 0x78],	%f0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fba	%fcc2,	loop_325
	fmovrsgz	%i1,	%f9,	%f14
	sll	%o0,	%i5,	%l0
	wr	%o2,	%g5,	%softint
loop_325:
	wrpr	%o1,	0x128F,	%cwp
	rd	%asi,	%o4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xEBD, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xD16, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%l1,	0x0C9D,	%pil
	or	%g2,	0x0A1D,	%l4
	bpos,a,pn	%xcc,	loop_326
	rdhpr	%hpstate,	%o6
	rdhpr	%hsys_tick_cmpr,	%i4
loop_326:
	rd	%pc,	%g1
	edge8ln	%g3,	%g6,	%o7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x3ED, 	%sys_tick_cmpr
	wr	%l6,	0x0AC2,	%ccr
	wr	%l2,	0x0C7A,	%softint
	rd	%softint,	%i2
	rdpr	%tba,	%o5
	movrgz	%o3,	0x1D2,	%i1
	xnorcc	%o0,	%l0,	%o2
	rd	%softint,	%g5
	fexpand	%f7,	%f20
	rd	%ccr,	%o1
	rdpr	%tl,	%i5
	edge16ln	%o4,	%i0,	%g4
	rd	%softint,	%l5
	edge16ln	%g7,	%l1,	%g2
	movl	%icc,	%l4,	%o6
	xnor	%i7,	0x1B1E,	%i3
	sdivx	%i4,	0x1A7B,	%g1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x085, 	%sys_tick_cmpr
	andncc	%l3,	%o7,	%l6
	rd	%asi,	%l2
	rdhpr	%hintp,	%i6
	rdhpr	%hsys_tick_cmpr,	%o5
	movge	%xcc,	%i2,	%o3
	rdpr	%canrestore,	%o0
	andn	%l0,	%o2,	%i1
	rd	%pc,	%o1
	fpackfix	%f10,	%f0
	wrpr	%g5,	%o4,	%cwp
	rdpr	%wstate,	%i0
	wrpr	%i5,	0x0E57,	%tick
	rdhpr	%hsys_tick_cmpr,	%l5
	fmovdneg	%xcc,	%f7,	%f5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	rd	%softint,	%g7
	addcc	%l1,	0x0AC4,	%g2
	umul	%l4,	0x1EB1,	%g4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xCC8, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%g6,	0x0428,	%tick
	wrpr	%l3,	%i3,	%tick
	rdhpr	%htba,	%l6
	sdivcc	%o7,	0x188C,	%l2
	wrpr	%o5,	%i6,	%tick
	rdpr	%cleanwin,	%o3
	wrpr	%i2,	0x0133,	%tick
	wrpr	%l0,	%o2,	%tick
	wrpr	%o0,	%o1,	%tick
	wr	%i1,	0x1141,	%ccr
	edge32ln	%o4,	%g5,	%i0
	rdhpr	%hintp,	%l5
	movne	%icc,	%g7,	%l1
	fble,a	%fcc3,	loop_327
	wr	%i5,	0x0426,	%pic
	fnor	%f26,	%f0,	%f28
	wrpr	%l4,	%g2,	%cwp
loop_327:
	rdpr	%otherwin,	%o6
	rdpr	%tba,	%g4
	edge32ln	%i7,	%i4,	%g1
	udiv	%g6,	0x0F23,	%g3
	movrlz	%i3,	%l3,	%o7
	sdivcc	%l6,	0x143E,	%o5
	nop
	setx	loop_328,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	nop
	setx loop_329, %l0, %l1
	jmpl %l1, %l2
	wrpr	%i6,	0x0BC3,	%cwp
	movcc	%icc,	%o3,	%l0
loop_328:
	rdpr	%wstate,	%i2
loop_329:
	wr	%o2,	0x124A,	%ccr
	rdpr	%cwp,	%o0
	tn	%xcc,	0x3
	wr	%o1,	%i1,	%set_softint
	movgu	%xcc,	%o4,	%i0
	rd	%pc,	%g5
	bcs,a	%xcc,	loop_330
	rdhpr	%hsys_tick_cmpr,	%l5
	rd	%sys_tick_cmpr,	%l1
	rdpr	%cleanwin,	%g7
loop_330:
	taddcc	%i5,	0x0BE8,	%l4
	rd	%y,	%g2
	rd	%fprs,	%g4
	rdpr	%otherwin,	%o6
	xor	%i4,	0x02FA,	%g1
	rd	%ccr,	%i7
	fmovdle	%xcc,	%f11,	%f1
	rdhpr	%htba,	%g3
	rdhpr	%hpstate,	%i3
	wr	%l3,	0x074C,	%set_softint
	rd	%pc,	%g6
	edge16	%o7,	%o5,	%l6
	bpos,a,pt	%xcc,	loop_331
	wrpr	%i6,	%o3,	%pil
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x89,	%asi
	stha	%l2,	[%l7 + 0x7E] %asi
loop_331:
	wrpr	%l0,	%i2,	%pil
	rd	%asi,	%o2
	rdhpr	%hpstate,	%o1
	popc	%o0,	%o4
	rdhpr	%hsys_tick_cmpr,	%i1
	wrpr	%g5,	0x1B96,	%pil
	sra	%i0,	%l5,	%l1
	wr	%i5,	%g7,	%pic
	rd	%softint,	%g2
	rd	%pc,	%g4
	wr	%o6,	0x1FF9,	%pic
	sir	0x1068
	edge32	%l4,	%i4,	%i7
	rdhpr	%hpstate,	%g1
	alignaddr	%g3,	%i3,	%l3
	rdpr	%cwp,	%g6
	rdpr	%cwp,	%o7
	wr	%g0,	0x19,	%asi
	sta	%f28,	[%l7 + 0x08] %asi
	edge8n	%l6,	%o5,	%i6
	wrpr	%l2,	%l0,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xECD, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x607, 	%hsys_tick_cmpr
	rdhpr	%hpstate,	%o1
	sir	0x04FC
	wr	%o0,	%i1,	%softint

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xA28, 	%tick_cmpr
	addccc	%g5,	%l5,	%i0
	rd	%softint,	%l1
	mulscc	%i5,	0x12D6,	%g7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xD89, 	%hsys_tick_cmpr
	rd	%sys_tick_cmpr,	%o6
	tn	%icc,	0x4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	fmovsvs	%icc,	%f20,	%f5
	wrpr	%g1,	0x0D40,	%tick
	wr	%g0,	0x0c,	%asi
	ldxa	[%l7 + 0x18] %asi,	%g3
	wr	%l3,	%i3,	%sys_tick
	move	%xcc,	%g6,	%o7
	wr	%o5,	%l6,	%softint
	rd	%ccr,	%l2
	movrgz	%l0,	0x02F,	%i2
	rdhpr	%hsys_tick_cmpr,	%i6
	fmovsle	%xcc,	%f24,	%f24
	rdhpr	%htba,	%o3
	rdpr	%pil,	%o2
	fbg,a	%fcc0,	loop_332
	fpsub32	%f8,	%f18,	%f20
	wr 	%g0, 	0x4, 	%fprs
	bl	loop_333
loop_332:
	rd	%tick_cmpr,	%i1
	wr	%o4,	0x0501,	%sys_tick
	rd	%softint,	%g5
loop_333:
	addccc	%l5,	0x0340,	%l1
	wr	%i0,	0x02FC,	%y
	rdpr	%canrestore,	%i5
	ldx	[%l7 + 0x38],	%g7
	edge8ln	%g4,	%g2,	%i4
	taddcc	%o6,	0x1385,	%l4
	edge8n	%i7,	%g3,	%g1
	fmovd	%f26,	%f26
	bcc,pn	%xcc,	loop_334
	rd	%tick_cmpr,	%i3
	fbe,a	%fcc3,	loop_335
	rdpr	%cansave,	%g6
loop_334:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xF76, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_335:
	st	%f27,	[%l7 + 0x50]
	rdhpr	%hpstate,	%l6
	udivcc	%l0,	0x07D0,	%i2
	set	0x79, %o4
	stba	%i6,	[%l7 + %o4] 0x15
	nop
	setx	loop_336,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	rdpr	%tba,	%l2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	ldsb	[%l7 + 0x39],	%o2
loop_336:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xAA8, 	%hsys_tick_cmpr
	rd	%ccr,	%g5
	rdhpr	%htba,	%o4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xFB7, 	%tick_cmpr
	srlx	%l1,	%i0,	%i5
	rdpr	%cwp,	%g7
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
	wr	%g4,	0x0545,	%ccr
	rdpr	%canrestore,	%i4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x67D, 	%sys_tick_cmpr
loop_337:
	andcc	%o6,	%i7,	%g3
	flush	%l7 + 0x24
	rdhpr	%hintp,	%i3
	udivx	%g1,	0x0E8D,	%l3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	bn,a,pn	%icc,	loop_338
	wrpr	%o5,	0x14D1,	%pil
	set	0x40, %g5
	ldswa	[%l7 + %g5] 0x81,	%l6
loop_338:
	brz,a	%l0,	loop_339
	wrpr	%o7,	0x1264,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x579, 	%hsys_tick_cmpr
	rdpr	%canrestore,	%i6
loop_339:
	tvc	%icc,	0x0
	xnorcc	%o1,	0x1AF6,	%o2
	srlx	%i1,	0x11,	%o0
	rdpr	%tl,	%o3
	wrpr	%o4,	0x0F5B,	%pil
	smul	%l5,	0x1EA4,	%g5
	fble,a	%fcc1,	loop_340
	taddcc	%l1,	0x03BC,	%i5
	sir	0x054F
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_340:
	rd	%asi,	%g7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xB1D, 	%hsys_tick_cmpr
	set	0x49, %i1
	ldsba	[%l7 + %i1] 0x10,	%i4
	rdhpr	%hintp,	%g2
	rdpr	%pil,	%g4
	rd	%sys_tick_cmpr,	%l4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	tsubcctv	%g3,	%i7,	%g1
	srlx	%l3,	0x14,	%i3
	edge8n	%g6,	%l6,	%o5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xA2B, 	%hsys_tick_cmpr
	add	%o7,	0x0D58,	%i6
	movrlez	%o1,	0x2A9,	%o2
	orcc	%i1,	0x1D80,	%l2
	rd	%sys_tick_cmpr,	%o0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x00B, 	%hsys_tick_cmpr
	rdhpr	%hsys_tick_cmpr,	%o3
	rd	%pc,	%l5
	alignaddrl	%g5,	%i5,	%l1
	alignaddr	%i0,	%i4,	%g2
	rd	%fprs,	%g7
	rdpr	%tba,	%g4
	set	0x44, %o2
	stwa	%l4,	[%l7 + %o2] 0x2f
	membar	#Sync
	fble,a	%fcc3,	loop_341
	rdhpr	%hpstate,	%o6
	rd	%pc,	%i7
	andncc	%g1,	%g3,	%l3
loop_341:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xED1, 	%hsys_tick_cmpr
	rd	%asi,	%g6
	rdhpr	%hsys_tick_cmpr,	%o5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%g0,	0x89,	%asi
	stha	%l6,	[%l7 + 0x38] %asi
	rdhpr	%hsys_tick_cmpr,	%i6
	rd	%softint,	%o7
	andncc	%o2,	%o1,	%i1
	wrpr	%o0,	%o4,	%pil
	movvc	%icc,	%l2,	%o3
	fbug	%fcc3,	loop_342
	andncc	%g5,	%i5,	%l5
	rd	%y,	%l1
	wr	%i0,	%i4,	%y
loop_342:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%hsys_tick_cmpr,	%o6
	wr	%l4,	0x0D65,	%y

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x3C2, 	%hsys_tick_cmpr
	fbe	%fcc1,	loop_343
	rd	%sys_tick_cmpr,	%i7
	rdpr	%wstate,	%g3
	fsrc1	%f2,	%f18
loop_343:
	fandnot2	%f24,	%f10,	%f8
	rdpr	%cleanwin,	%i3
	tge	%icc,	0x1
	sra	%l3,	0x14,	%o5
	edge16	%g6,	%l0,	%i2
	fpadd16	%f10,	%f24,	%f18
	movgu	%icc,	%i6,	%l6
	wrpr	%o7,	%o1,	%cwp
	tl	%xcc,	0x7
	edge16n	%i1,	%o2,	%o4
	rdpr	%tl,	%o0
	movcs	%xcc,	%l2,	%o3
	orn	%i5,	0x18AF,	%l5
	rdpr	%cwp,	%g5
	rd	%ccr,	%i0
	wr	%l1,	%g2,	%pic
	wrpr	%g7,	0x1AFE,	%cwp
	rdhpr	%hpstate,	%i4
	fxnor	%f14,	%f6,	%f16
	taddcctv	%o6,	0x0506,	%g4
	array8	%l4,	%g1,	%g3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%canrestore,	%i3
	orncc	%o5,	%g6,	%l3
	fbge,a	%fcc3,	loop_344
	rdhpr	%hpstate,	%l0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x308, 	%hsys_tick_cmpr
	wr	%i6,	%o7,	%y
loop_344:
	fnot2	%f28,	%f18
	rdpr	%cleanwin,	%l6
	movrne	%i1,	%o1,	%o4
	tpos	%xcc,	0x3
	fornot1s	%f13,	%f18,	%f12
	wr	%g0,	0xe2,	%asi
	stda	%o0,	[%l7 + 0x70] %asi
	membar	#Sync
	rdpr	%wstate,	%l2
	rdhpr	%hintp,	%o3
	wrpr	%o2,	0x14E1,	%cwp
	add	%l7,	0x18,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] %asi,	%i5,	%l5
	or	%g5,	0x1E6F,	%l1
	andcc	%g2,	0x0ADF,	%g7
	fmovrslez	%i0,	%f27,	%f1
	rdhpr	%hsys_tick_cmpr,	%o6
	rd	%tick_cmpr,	%g4
	wrpr	%i4,	%g1,	%cwp
	rdhpr	%hpstate,	%g3
	rdhpr	%hpstate,	%l4
	fmovsge	%xcc,	%f8,	%f9

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x8F2, 	%hsys_tick_cmpr
	rdpr	%wstate,	%i3
	set	0x2A, %o5
	lduha	[%l7 + %o5] 0x04,	%g6
	rd	%sys_tick_cmpr,	%o5
	rdhpr	%hsys_tick_cmpr,	%l0
	stw	%i2,	[%l7 + 0x6C]
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	rd	%softint,	%l3
	rdpr	%cansave,	%o7
	fbe,a	%fcc3,	loop_345
	array8	%l6,	%i6,	%o1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	movge	%xcc,	%l2,	%o0
loop_345:
	srlx	%o3,	%i5,	%l5
	rdhpr	%hpstate,	%g5
	movneg	%icc,	%o2,	%l1
	rdhpr	%hsys_tick_cmpr,	%g2
	movrgez	%g7,	0x1C1,	%i0
	rdhpr	%hpstate,	%g4
	rdpr	%tba,	%i4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	rd	%ccr,	%g3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	flushw
	wr	%o6,	%i3,	%clear_softint
	fpadd32	%f30,	%f22,	%f30
	rd	%y,	%i7
	rdpr	%cwp,	%g6
	pdist	%f20,	%f28,	%f0
	movvs	%icc,	%o5,	%l0
	rdpr	%tl,	%l3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%sys_tick_cmpr,	%l6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%hsys_tick_cmpr,	%o1
	rd	%ccr,	%i1
	rdhpr	%hintp,	%o0
	bcs	loop_346
	rd	%y,	%o3
	pdist	%f4,	%f30,	%f6
	wr	%i5,	%l5,	%y
loop_346:
	tgu	%xcc,	0x4
	rdhpr	%hpstate,	%l2
	rdhpr	%hpstate,	%g5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%fprs,	%g7
	rdhpr	%hsys_tick_cmpr,	%i0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x6E7, 	%sys_tick_cmpr
	fmovsvc	%xcc,	%f17,	%f19
	fabss	%f29,	%f27
	tgu	%icc,	0x7
	tle	%xcc,	0x4
	wrpr	%i4,	%g4,	%cwp
	wrpr	%g3,	0x0512,	%cwp
	addcc	%g1,	%o6,	%i3
	movrgez	%l4,	0x3FE,	%i7
	rdhpr	%hsys_tick_cmpr,	%g6
	wr 	%g0, 	0x5, 	%fprs
	movpos	%xcc,	%o7,	%i2
	rdhpr	%hsys_tick_cmpr,	%l6
	rdhpr	%htba,	%i6
	subc	%o4,	%o5,	%o1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x33F, 	%hsys_tick_cmpr
	rdpr	%tl,	%i5
	rdhpr	%hsys_tick_cmpr,	%l2
	rdhpr	%hsys_tick_cmpr,	%g5
	bpos,a	loop_347
	rdpr	%tba,	%l5
	rdhpr	%htba,	%g2
	subccc	%g7,	0x0E1A,	%i0
loop_347:
	rdpr	%tl,	%o2
	smulcc	%i4,	%l1,	%g3
	rd	%ccr,	%g1
	sub	%o6,	%i3,	%g4
	movvc	%xcc,	%l4,	%g6
	movrlz	%l0,	0x3B3,	%l3
	set	0x58, %o3
	prefetcha	[%l7 + %o3] 0x18,	 0x2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%i6,	%o4,	%sys_tick
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x4E6, 	%hsys_tick_cmpr
	edge16l	%i2,	%o3,	%o0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xDE0, 	%hsys_tick_cmpr
	rdhpr	%hpstate,	%l2
	edge16	%l5,	%g2,	%g7
	movleu	%icc,	%g5,	%o2
	fornot1s	%f31,	%f13,	%f28
	movvs	%icc,	%i0,	%l1
	tpos	%xcc,	0x3
	tsubcctv	%g3,	0x0218,	%g1
	stbar
	rd	%y,	%i4
	rd	%pc,	%i3
	bneg,pn	%xcc,	loop_348
	wrpr	%g4,	%o6,	%pil
	wr	%g6,	%l0,	%ccr
	xnorcc	%l3,	%i7,	%o7
loop_348:
	wrpr	%l4,	0x03DF,	%tick
	edge16ln	%l6,	%o4,	%i6
	rd	%fprs,	%o1
	bneg,a,pn	%xcc,	loop_349
	add	%o5,	%i2,	%o3
	ld	[%l7 + 0x10],	%f6
	lduh	[%l7 + 0x7A],	%o0
loop_349:
	flushw
	rd	%asi,	%i1
	rdpr	%cwp,	%i5
	rdpr	%cwp,	%l2
	tneg	%icc,	0x1
	wr	%g0,	0x04,	%asi
	lduwa	[%l7 + 0x20] %asi,	%g2
	set	0x78, %g3
	lduba	[%l7 + %g3] 0x89,	%l5
	fandnot1s	%f15,	%f19,	%f3
	edge16	%g7,	%o2,	%g5
	rdhpr	%htba,	%i0
	rdhpr	%hpstate,	%g3
	fmuld8ulx16	%f23,	%f25,	%f14
	nop
	setx loop_350, %l0, %l1
	jmpl %l1, %l1
	wr	%i4,	0x0280,	%softint
	rdhpr	%hpstate,	%i3
	movcc	%xcc,	%g4,	%o6
loop_350:
	flush	%l7 + 0x14

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fones	%f23
	brgez	%l0,	loop_351
	ldsb	[%l7 + 0x2C],	%i7
	call	loop_352
	tsubcctv	%l3,	%l4,	%o7
loop_351:
	fmovsgu	%icc,	%f28,	%f30
	brgez	%o4,	loop_353
loop_352:
	rdhpr	%htba,	%l6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%hsys_tick_cmpr,	%i2
loop_353:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xD9A, 	%hsys_tick_cmpr
	rdpr	%otherwin,	%o0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xA4A, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x0CA, 	%sys_tick_cmpr
	wr	%o1,	0x0E7B,	%ccr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x24F, 	%hsys_tick_cmpr
	bcc,a	%icc,	loop_354
	rdhpr	%hintp,	%g2
	rd	%softint,	%g7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
loop_354:
	rdhpr	%hintp,	%g5
	rdpr	%canrestore,	%i0
	rd	%y,	%g3
	wrpr	%i4,	%l1,	%pil
	wr	%i3,	%o6,	%softint
	movl	%xcc,	%g4,	%g1
	rdpr	%cleanwin,	%g6
	srl	%i7,	0x08,	%l0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	edge8n	%o4,	%o7,	%l6
	rdhpr	%hsys_tick_cmpr,	%o5
	subccc	%i6,	%o3,	%o0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	andn	%i5,	0x1BB7,	%i1
	wrpr	%l2,	%o1,	%cwp
	tge	%xcc,	0x0
	rd	%sys_tick_cmpr,	%l5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	mulx	%o2,	%g5,	%g2
	membar	0x03
	fpmerge	%f24,	%f12,	%f14
	fmovrdne	%i0,	%f12,	%f14
	fbule	%fcc2,	loop_355
	sra	%i4,	%g3,	%l1
	rd	%y,	%i3
	set	0x18, %i7
	lduba	[%l7 + %i7] 0x19,	%g4
loop_355:
	rdhpr	%hpstate,	%o6
	wrpr	%g6,	0x18C2,	%cwp
	edge32l	%i7,	%g1,	%l3
	wrpr	%l4,	0x035D,	%cwp
	fmovda	%xcc,	%f31,	%f11
	wrpr	%l0,	0x03F1,	%cwp
	rdhpr	%hintp,	%o7
	fsrc1	%f18,	%f4
	stx	%l6,	[%l7 + 0x10]
	fbe,a	%fcc0,	loop_356
	taddcctv	%o5,	0x10C8,	%o4
	wr	%o3,	0x0A29,	%y
	fbue	%fcc1,	loop_357
loop_356:
	rd	%fprs,	%i6
	sdiv	%i2,	0x0CF4,	%o0
	wrpr	%i1,	%l2,	%cwp
loop_357:
	nop
	wr	%g0,	0x18,	%asi
	lduha	[%l7 + 0x74] %asi,	%o1
	movge	%xcc,	%l5,	%i5
	fmovscc	%icc,	%f6,	%f1
	set	0x62, %i0
	lduba	[%l7 + %i0] 0x10,	%g7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	bvc	%icc,	loop_358
	rdpr	%cansave,	%i0
	set	0x0C, %g1
	sta	%f23,	[%l7 + %g1] 0x14
loop_358:
	movcs	%icc,	%g2,	%g3
	fsrc1	%f26,	%f4
	rd	%pc,	%l1
	fmovsneg	%icc,	%f9,	%f23
	rd	%tick_cmpr,	%i3
	rd	%tick_cmpr,	%i4
	wrpr	%o6,	%g4,	%tick
	rdpr	%canrestore,	%i7
	std	%f30,	[%l7 + 0x08]

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	sethi	0x0D82,	%g1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fnors	%f22,	%f23,	%f22

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	membar	0x58
	rdpr	%cwp,	%o7
	fbl,a	%fcc3,	loop_359
	rdpr	%canrestore,	%l6
	fbule	%fcc1,	loop_360
	wr	%o4,	%o5,	%softint
loop_359:
	fmovsg	%xcc,	%f6,	%f27
	rdhpr	%hpstate,	%i6
loop_360:
	rdpr	%tl,	%i2
	rdpr	%wstate,	%o3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	fmovsleu	%icc,	%f12,	%f15
	rdpr	%cwp,	%o1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%g0,	0x23,	%asi
	stha	%g7,	[%l7 + 0x70] %asi
	membar	#Sync
	fmovsg	%icc,	%f22,	%f17
	fandnot2	%f22,	%f16,	%f26
	edge8n	%g5,	%o2,	%i0
	movcs	%xcc,	%g2,	%g3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x908, 	%hsys_tick_cmpr
	rdpr	%pil,	%i3
	wrpr	%i4,	0x02D2,	%tick
	alignaddrl	%o6,	%i5,	%i7
	brlz	%g4,	loop_361
	wr	%g6,	%g1,	%ccr
	mulx	%l0,	%l4,	%o7
	rdhpr	%hpstate,	%l6
loop_361:
	andcc	%o4,	0x0FB7,	%o5
	rdhpr	%hintp,	%i6
	wr 	%g0, 	0x4, 	%fprs
	fzeros	%f19
	srlx	%i2,	%o3,	%l2
	rd	%softint,	%o1
	wr	%i1,	0x0478,	%softint

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xF90, 	%sys_tick_cmpr
	movrgez	%l5,	0x1FD,	%g5
	fornot2s	%f24,	%f26,	%f14
	edge32l	%o2,	%g7,	%g2
	fmovsn	%icc,	%f30,	%f23
	rdpr	%wstate,	%g3
	rdpr	%cwp,	%l1
	wr 	%g0, 	0x5, 	%fprs
	edge32	%i0,	%i4,	%i5
	rdpr	%cleanwin,	%i7
	wrpr	%g4,	0x1A66,	%tick
	movle	%xcc,	%o6,	%g1
	bleu,a	loop_362
	wrpr	%l0,	0x09C7,	%tick
	wr	%g6,	%l4,	%set_softint
	taddcc	%l6,	%o4,	%o7
loop_362:
	rdhpr	%hintp,	%i6
	rdhpr	%hsys_tick_cmpr,	%l3
	rd	%pc,	%i2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xC3B, 	%hsys_tick_cmpr
	rdhpr	%htba,	%o3
	wrpr	%i1,	%o0,	%cwp
	andncc	%o1,	%g5,	%l5
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x2E] %asi,	%g7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%pc,	%g3
	rdpr	%canrestore,	%o2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	bge	%icc,	loop_363
	rdhpr	%hpstate,	%i4
	wr	%i0,	%i5,	%softint
	wr	%g4,	0x047B,	%set_softint
loop_363:
	rdhpr	%hsys_tick_cmpr,	%i7
	rdhpr	%hsys_tick_cmpr,	%o6
	rdhpr	%hsys_tick_cmpr,	%g1
	fands	%f19,	%f5,	%f4
	fones	%f21
	wrpr	%g6,	0x1C2A,	%pil
	wrpr	%l0,	%l4,	%cwp
	tl	%xcc,	0x1
	wr	%o4,	%l6,	%softint
	tl	%xcc,	0x7
	wrpr	%i6,	%l3,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fpack32	%f10,	%f2,	%f6
	movrne	%o5,	%l2,	%o7
	brlz,a	%o3,	loop_364
	brnz,a	%o0,	loop_365
	wr	%o1,	%i1,	%clear_softint
	wr	%l5,	%g5,	%set_softint
loop_364:
	rdhpr	%htba,	%g7
loop_365:
	fbul,a	%fcc1,	loop_366
	be,a	%xcc,	loop_367
	addccc	%g3,	0x178C,	%g2
	wr	%o2,	%l1,	%pic
loop_366:
	wr	%i3,	0x025D,	%y
loop_367:
	movrne	%i4,	%i5,	%g4
	fmul8x16au	%f19,	%f12,	%f28
	wrpr	%i0,	0x002D,	%tick
	bge,pt	%icc,	loop_368
	fmovsneg	%xcc,	%f10,	%f29
	ta	%xcc,	0x4
	fpadd32s	%f13,	%f1,	%f21
loop_368:
	udivx	%i7,	0x1D11,	%g1
	set	0x40, %i3
	ldswa	[%l7 + %i3] 0x88,	%o6
	fornot1s	%f23,	%f16,	%f24
	rd	%fprs,	%l0
	bpos	%xcc,	loop_369
	or	%l4,	0x121F,	%o4
	rd	%ccr,	%g6
	wrpr	%i6,	%l3,	%pil
loop_369:
	sethi	0x141D,	%l6
	rdpr	%gl,	%i2
	wrpr	%o5,	%o7,	%cwp
	wrpr	%l2,	0x02BC,	%tick
	movneg	%icc,	%o0,	%o3
	edge16n	%o1,	%l5,	%g5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wrpr	%i1,	0x1DC2,	%pil
	wrpr	%g3,	%g7,	%pil
	fmovsvc	%xcc,	%f7,	%f13
	wrpr	%g2,	0x0606,	%pil
	fnand	%f2,	%f6,	%f14
	wr	%l1,	%o2,	%sys_tick
	umulcc	%i4,	%i3,	%g4
	rd	%ccr,	%i0
	movg	%icc,	%i7,	%i5
	stbar
	rdpr	%otherwin,	%g1
	sethi	0x193B,	%o6
	fcmpes	%fcc0,	%f14,	%f7
	wrpr	%l0,	%l4,	%tick
	fba,a	%fcc3,	loop_370
	rdhpr	%hintp,	%o4
	wrpr	%g6,	%i6,	%tick
	tcs	%xcc,	0x0
loop_370:
	tg	%xcc,	0x7
	fmovda	%icc,	%f23,	%f5
	fmul8x16au	%f28,	%f7,	%f18
	nop
	setx	loop_371,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	rdpr	%cansave,	%l6
	movl	%xcc,	%l3,	%o5
	movleu	%xcc,	%o7,	%i2
loop_371:
	nop
	setx	loop_372,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	rd	%sys_tick_cmpr,	%o0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x9BA, 	%hsys_tick_cmpr
	rd	%asi,	%o1
loop_372:
	rdhpr	%hsys_tick_cmpr,	%l5
	tne	%icc,	0x3
	rdpr	%canrestore,	%g5
	movg	%xcc,	%l2,	%g3
	rdpr	%otherwin,	%g7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xA0F, 	%hsys_tick_cmpr
	taddcc	%l1,	0x0956,	%o2
	bge,a	%xcc,	loop_373
	rdpr	%otherwin,	%i4
	edge32	%i3,	%g4,	%i0
	wr	%i7,	0x19BA,	%clear_softint
loop_373:
	rd	%y,	%g2
	rdpr	%wstate,	%g1
	wrpr	%i5,	%l0,	%tick
	wr	%o6,	0x1347,	%softint
	andn	%o4,	0x1F59,	%g6
	ldd	[%l7 + 0x38],	%f22
	movne	%icc,	%l4,	%i6
	wrpr	%l6,	%l3,	%pil
	edge32	%o7,	%o5,	%o0
	wr	%o3,	%o1,	%softint
	addc	%i2,	%l5,	%l2
	rd	%sys_tick_cmpr,	%g5
	rdhpr	%htba,	%g3
	wr	%g7,	%l1,	%pic
	wrpr	%i1,	%i4,	%cwp
	rdhpr	%hpstate,	%i3
	rd	%sys_tick_cmpr,	%g4
	sdiv	%o2,	0x0511,	%i0
	rd	%asi,	%g2
	rd	%softint,	%i7
	xnorcc	%g1,	%i5,	%o6
	wr	%l0,	0x0544,	%softint
	rdhpr	%hintp,	%g6
	set	0x60, %l0
	stxa	%l4,	[%l7 + %l0] 0x27
	membar	#Sync
	fones	%f17
	lduh	[%l7 + 0x62],	%o4
	array32	%i6,	%l3,	%l6
	fandnot1	%f14,	%f30,	%f20
	rdpr	%tl,	%o5
	sra	%o7,	0x0A,	%o0
	rdpr	%gl,	%o3
	wrpr	%i2,	%o1,	%pil
	fsrc1s	%f13,	%f1
	wrpr	%l2,	%l5,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x2CF, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xAF2, 	%hsys_tick_cmpr
	fbo,a	%fcc3,	loop_374
	wrpr	%l1,	0x1E53,	%pil
	tleu	%xcc,	0x3
	taddcc	%i1,	%i4,	%i3
loop_374:
	rd	%ccr,	%g4
	wr	%g0,	0x10,	%asi
	ldsba	[%l7 + 0x27] %asi,	%o2
	rdpr	%canrestore,	%g2
	fornot1s	%f30,	%f29,	%f24
	rd	%fprs,	%i7
	rd	%tick_cmpr,	%g1
	xnor	%i5,	%o6,	%l0
	rdhpr	%hintp,	%g6
	wrpr	%i0,	%l4,	%tick
	sdivx	%o4,	0x078D,	%i6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	fsrc2	%f10,	%f10
	wr	%o5,	0x014C,	%softint
	wr	%o7,	%o0,	%set_softint
	rd	%fprs,	%l6
	xnor	%o3,	%i2,	%l2
	wrpr	%l5,	0x0888,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	rdhpr	%hsys_tick_cmpr,	%g7
	rdhpr	%hsys_tick_cmpr,	%l1
	wr	%i1,	%i4,	%y
	tvs	%xcc,	0x0
	rd	%softint,	%g3
	tvc	%icc,	0x0
	wrpr	%i3,	%g4,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xEA6, 	%hsys_tick_cmpr
	te	%icc,	0x7
	rdhpr	%hintp,	%i7
	rdhpr	%hsys_tick_cmpr,	%g1
	wrpr	%i5,	0x1C67,	%tick
	te	%icc,	0x6
	rdhpr	%htba,	%o6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%g6,	%i0,	%cwp
	wr	%l4,	%l0,	%ccr
	rdhpr	%hintp,	%o4
	srax	%i6,	0x00,	%l3
	movre	%o5,	0x071,	%o0
	wrpr	%l6,	%o7,	%tick
	tpos	%xcc,	0x0
	sub	%i2,	%l2,	%l5
	fands	%f1,	%f26,	%f3
	wr	%o1,	0x0A9A,	%y
	wrpr	%o3,	%g5,	%cwp
	fbue	%fcc0,	loop_375
	rdpr	%pil,	%l1
	edge8ln	%g7,	%i1,	%g3
	tg	%icc,	0x1
loop_375:
	subcc	%i4,	%g4,	%i3
	fcmped	%fcc3,	%f6,	%f2
	edge8	%g2,	%i7,	%g1
	udiv	%i5,	0x0C1C,	%o2
	bpos,a,pt	%icc,	loop_376
	fmovsne	%xcc,	%f12,	%f5
	rdpr	%tl,	%o6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
loop_376:
	rdhpr	%htba,	%l4
	wrpr	%o4,	0x1F28,	%tick
	rdhpr	%htba,	%i6
	fcmpes	%fcc2,	%f29,	%f16
	set	0x74, %l5
	ldswa	[%l7 + %l5] 0x04,	%l3
	andn	%o5,	%o0,	%l6
	wr	%l0,	%o7,	%pic
	array16	%l2,	%i2,	%o1
	rdpr	%cwp,	%o3
	rd	%sys_tick_cmpr,	%g5
	sub	%l1,	%l5,	%g7
	wrpr	%g3,	%i1,	%tick
	fpsub32s	%f22,	%f29,	%f20
	fnot1s	%f2,	%f6
	wr	%i4,	%g4,	%pic
	wrpr	%i3,	%g2,	%cwp
	rdhpr	%hintp,	%i7
	rd	%tick_cmpr,	%i5
	umulcc	%g1,	%o6,	%o2
	array16	%g6,	%l4,	%o4
	rdhpr	%htba,	%i6
	rdpr	%otherwin,	%l3
	rdpr	%cleanwin,	%o5
	for	%f0,	%f22,	%f26
	rd	%tick_cmpr,	%i0
	sll	%o0,	%l0,	%o7
	rdpr	%canrestore,	%l6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xD9E, 	%hsys_tick_cmpr
	orncc	%i2,	%o3,	%g5
	rd	%asi,	%o1
	alignaddrl	%l1,	%g7,	%g3
	rd	%sys_tick_cmpr,	%l5
	rdpr	%tl,	%i4
	fandnot2s	%f16,	%f7,	%f25
	wr	%g4,	0x0ADB,	%clear_softint
	rdhpr	%htba,	%i3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%tba,	%g2
	rd	%fprs,	%i7
	wr	%i5,	0x0F69,	%pic
	ble,pt	%xcc,	loop_377
	subcc	%g1,	0x092E,	%o6
	wrpr	%o2,	0x12FA,	%tick
	nop
	setx loop_378, %l0, %l1
	jmpl %l1, %l4
loop_377:
	st	%f5,	[%l7 + 0x54]
	stw	%g6,	[%l7 + 0x30]
	movgu	%icc,	%o4,	%l3
loop_378:
	edge32l	%o5,	%i0,	%o0
	wr	%i6,	0x12CA,	%pic
	wr 	%g0, 	0x7, 	%fprs
	umulcc	%l6,	%l2,	%i2
	rdpr	%otherwin,	%o3
	wrpr	%o7,	0x1DD6,	%pil
	movvc	%xcc,	%o1,	%g5
	wrpr	%l1,	0x0FC0,	%pil
	wr	%g0,	0x89,	%asi
	stda	%f16,	[%l7 + 0x40] %asi

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	orn	%g4,	0x1C1F,	%i3
	wr	%i1,	%i4,	%set_softint
	rdpr	%wstate,	%i7
	fmovdcs	%xcc,	%f23,	%f17
	rdhpr	%hsys_tick_cmpr,	%i5
	alignaddr	%g2,	%o6,	%o2
	fmovd	%f20,	%f8
	rdpr	%otherwin,	%l4
	sllx	%g6,	0x18,	%g1
	orncc	%o4,	0x0D51,	%o5
	add	%l3,	0x182C,	%o0
	fcmps	%fcc0,	%f19,	%f2
	rdhpr	%htba,	%i6
	tcs	%xcc,	0x0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x230, 	%hsys_tick_cmpr
	wrpr	%l6,	0x0406,	%tick
	fmovrslez	%i2,	%f15,	%f13
	rdpr	%cwp,	%l2
	fbuge,a	%fcc1,	loop_379
	alignaddr	%o7,	%o3,	%g5
	wrpr	%o1,	0x1B4D,	%pil
	movrgz	%l1,	0x329,	%l5
loop_379:
	lduw	[%l7 + 0x2C],	%g3
	movge	%icc,	%g4,	%i3
	rdpr	%otherwin,	%g7
	rd	%asi,	%i1
	wr	%i7,	%i5,	%set_softint
	fmovd	%f20,	%f22
	wr	%g0,	0x2b,	%asi
	stba	%i4,	[%l7 + 0x5A] %asi
	membar	#Sync
	fmovde	%xcc,	%f9,	%f9
	taddcctv	%o6,	0x1A0F,	%o2
	rdpr	%otherwin,	%l4
	sllx	%g2,	%g6,	%g1
	fnors	%f29,	%f20,	%f8
	alignaddrl	%o4,	%o5,	%o0
	rdpr	%tba,	%i6
	wr	%l3,	%l0,	%pic
	alignaddr	%l6,	%i2,	%l2
	wrpr	%i0,	0x06C0,	%pil
	andncc	%o7,	%o3,	%g5
	set	0x74, %o1
	ldswa	[%l7 + %o1] 0x15,	%l1
	rdpr	%tl,	%l5
	rdhpr	%hsys_tick_cmpr,	%g3
	wr	%o1,	%i3,	%ccr
	movcs	%xcc,	%g7,	%i1
	movrgez	%g4,	0x217,	%i5
	fornot2	%f4,	%f24,	%f30
	edge32n	%i7,	%o6,	%i4
	rd	%pc,	%o2
	rd	%pc,	%l4
	rd	%y,	%g6
	wr	%g2,	%g1,	%clear_softint
	array16	%o4,	%o0,	%o5
	rd	%fprs,	%l3
	edge8n	%i6,	%l6,	%i2
	wr	%l0,	0x1A47,	%pic
	rdhpr	%htba,	%l2
	rdpr	%gl,	%i0
	movre	%o7,	0x05D,	%o3
	edge16n	%g5,	%l1,	%g3
	rd	%pc,	%l5
	udivx	%o1,	0x1D37,	%i3
	rdhpr	%htba,	%g7
	te	%xcc,	0x3
	movcs	%xcc,	%i1,	%i5
	andcc	%i7,	%g4,	%i4
	wrpr	%o2,	%o6,	%tick
	wr	%g6,	%l4,	%set_softint
	rd	%asi,	%g2
	edge16l	%g1,	%o4,	%o5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xDA7, 	%hsys_tick_cmpr
	rdhpr	%hsys_tick_cmpr,	%i6
	ldub	[%l7 + 0x14],	%l6
	addc	%i0,	%l0,	%o3
	and	%g5,	0x08BD,	%o7
	addcc	%l1,	0x0D6E,	%l5
	wr	%g3,	0x0D21,	%clear_softint
	rdpr	%pil,	%i3
	rdpr	%canrestore,	%o1
	rdhpr	%hpstate,	%g7
	wrpr	%i5,	%i7,	%pil
	rdpr	%tba,	%i1
	set	0x44, %l6
	ldsha	[%l7 + %l6] 0x15,	%i4
	wrpr	%o2,	0x1E4F,	%pil
	rd	%tick_cmpr,	%o6
	stx	%g4,	[%l7 + 0x38]
	fmovdgu	%icc,	%f22,	%f31
	fmovrde	%g6,	%f26,	%f26
	movvs	%icc,	%l4,	%g1
	rd	%y,	%g2
	rdhpr	%htba,	%o4
	fcmpgt16	%f22,	%f8,	%o5
	rdhpr	%hsys_tick_cmpr,	%l3
	wrpr	%i6,	%o0,	%tick
	rd	%y,	%i2
	rdpr	%canrestore,	%l6
	fmovsl	%icc,	%f8,	%f23

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x578, 	%hsys_tick_cmpr
	sllx	%i0,	0x08,	%o3
	rdpr	%cleanwin,	%l0
	rdpr	%tl,	%g5
	movrne	%o7,	%l1,	%l5
	wr	%g0,	0x80,	%asi
	ldsba	[%l7 + 0x57] %asi,	%g3
	wr	%o1,	%i3,	%sys_tick
	bpos,a,pt	%icc,	loop_380
	wr	%i7,	%g7,	%clear_softint
	wrpr	%i4,	%o2,	%cwp
loop_380:
	rd	%softint,	%o6
	fbg,a	%fcc1,	loop_381
	fba,a	%fcc0,	loop_382
	edge8	%g4,	%i1,	%l4
	ldstub	[%l7 + 0x0E],	%g1
loop_381:
	subccc	%g6,	0x0AA9,	%o4
loop_382:
	rdpr	%canrestore,	%g2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x37D, 	%hsys_tick_cmpr
	fsrc1s	%f26,	%f24
	rdpr	%pil,	%l3
	movre	%i6,	%o0,	%l6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%ccr,	%i0
	rdhpr	%hpstate,	%o3
	fmovd	%f18,	%f12
	rdhpr	%htba,	%i2
	rdhpr	%hintp,	%l0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x778, 	%sys_tick_cmpr
	movle	%icc,	%l1,	%l5
	wrpr	%o7,	%o1,	%pil
	and	%g3,	0x134B,	%i3
	rd	%tick_cmpr,	%i5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x628, 	%hsys_tick_cmpr
	nop
	setx	loop_383,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	rdhpr	%hsys_tick_cmpr,	%i4
	tneg	%icc,	0x5
	rdpr	%otherwin,	%o2
loop_383:
	sth	%g4,	[%l7 + 0x3A]
	wrpr	%o6,	0x178A,	%pil
	rdpr	%gl,	%l4
	sdivx	%g1,	0x1256,	%i1
	rd	%pc,	%g6
	array16	%g2,	%o5,	%o4
	rd	%tick_cmpr,	%i6
	edge32l	%o0,	%l6,	%l2
	rd	%pc,	%i0
	edge16n	%o3,	%i2,	%l0
	srlx	%g5,	0x00,	%l3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x37B, 	%hsys_tick_cmpr
	rdpr	%canrestore,	%o1
	tl	%xcc,	0x6
	rd	%sys_tick_cmpr,	%l1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x135, 	%hsys_tick_cmpr
	edge32ln	%i7,	%i5,	%i4
	add	%o2,	0x0BE2,	%g4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x9B8, 	%hsys_tick_cmpr
	rdpr	%canrestore,	%g1
	wr 	%g0, 	0x5, 	%fprs
	rdhpr	%hpstate,	%g6
	rd	%ccr,	%g2
	rd	%softint,	%i1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x2F5, 	%hsys_tick_cmpr
	nop
	setx loop_384, %l0, %l1
	jmpl %l1, %o0
	fmovsl	%xcc,	%f26,	%f9
	rdhpr	%hintp,	%o5
	rdhpr	%hsys_tick_cmpr,	%l2
loop_384:
	mulx	%l6,	%i0,	%i2
	wrpr	%o3,	%l0,	%cwp
	tvc	%xcc,	0x7
	rdhpr	%hpstate,	%l3
	wrpr	%l5,	%o7,	%pil
	bge	%icc,	loop_385
	rdpr	%pil,	%l1
	rd	%tick_cmpr,	%g3
loop_385:
	fmovda	%icc,	%f11,	%f16
	wr	%i3,	%i7,	%set_softint
	andncc	%i4,	%i5,	%g4
	wr	%g7,	%o6,	%softint
	orncc	%o2,	%g1,	%g6
	rd	%softint,	%g2
	rdpr	%cleanwin,	%l4
	rdpr	%canrestore,	%i1
	fmovspos	%icc,	%f12,	%f23
	rdpr	%cwp,	%i6
	ldub	[%l7 + 0x1E],	%o0
	sir	0x0643
	rdpr	%pil,	%o4
	fbug	%fcc1,	loop_386
	rd	%tick_cmpr,	%l2
	rdpr	%cansave,	%o5
	set	0x1C, %i4
	stba	%l6,	[%l7 + %i4] 0x19
loop_386:
	fmovrsgez	%i0,	%f3,	%f10
	rdhpr	%hpstate,	%o3
	rd	%softint,	%i2
	edge32ln	%l0,	%l3,	%l5
	wr	%g0,	0x80,	%asi
	stda	%o6,	[%l7 + 0x10] %asi

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%hintp,	%g3
	andcc	%g5,	%i7,	%i3
	rdpr	%canrestore,	%i5
	fbul,a	%fcc1,	loop_387
	wr	%g4,	%g7,	%y
	rd	%y,	%i4
	rdhpr	%htba,	%o2
loop_387:
	rdpr	%pil,	%o6
	rd	%sys_tick_cmpr,	%g1
	wr	%g2,	%g6,	%y
	fcmpeq32	%f4,	%f26,	%l4
	rdhpr	%hpstate,	%i6
	wr	%g0,	0x80,	%asi
	ldswa	[%l7 + 0x58] %asi,	%o0
	movvs	%icc,	%i1,	%o4
	xnorcc	%l2,	0x07E1,	%o5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	fba	%fcc1,	loop_388
	wr	%i2,	0x19F0,	%clear_softint
	wr	%l6,	%l0,	%set_softint
	rdhpr	%hintp,	%l5
loop_388:
	rdhpr	%hpstate,	%l3
	tgu	%xcc,	0x0
	xorcc	%o1,	0x1FDF,	%l1
	fmovspos	%icc,	%f25,	%f23

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xBBB, 	%hsys_tick_cmpr
	rdpr	%wstate,	%i7
	xnorcc	%i3,	%o7,	%g4
	srl	%i5,	%g7,	%o2
	wr	%g0,	0x0c,	%asi
	ldsba	[%l7 + 0x14] %asi,	%o6
	wr	%g0,	0x80,	%asi
	ldsba	[%l7 + 0x62] %asi,	%g1
	sllx	%i4,	0x0C,	%g6
	rd	%sys_tick_cmpr,	%l4
	wrpr	%g2,	0x0423,	%tick
	taddcc	%i6,	%i1,	%o4
	fmovrslez	%o0,	%f29,	%f18
	rd	%ccr,	%o5
	wr	%l2,	0x0137,	%pic
	ldsh	[%l7 + 0x4C],	%i0
	tneg	%icc,	0x1
	wr 	%g0, 	0x5, 	%fprs

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xC0D, 	%hsys_tick_cmpr
	rdhpr	%hintp,	%l5
	faligndata	%f8,	%f16,	%f2
	rdhpr	%hintp,	%l0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x129, 	%hsys_tick_cmpr
	rdpr	%tl,	%l1
	smul	%o1,	%g3,	%g5
	rdhpr	%hintp,	%i7
	mulx	%o7,	0x1147,	%i3
	fmovrslz	%i5,	%f15,	%f2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	xnor	%o2,	%g4,	%o6
	rdpr	%wstate,	%i4
	rd	%asi,	%g1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x711, 	%hsys_tick_cmpr
	nop
	setx loop_389, %l0, %l1
	jmpl %l1, %g6
	rdpr	%cwp,	%g2
	fmul8x16au	%f28,	%f26,	%f4
	rdpr	%pil,	%i1
loop_389:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	srax	%o0,	0x12,	%o5
	wrpr	%o4,	%i0,	%tick
	rdpr	%otherwin,	%i2
	bg	loop_390
	taddcctv	%o3,	%l6,	%l2
	wr	%l0,	%l3,	%set_softint
	rd	%softint,	%l1
loop_390:
	fbul	%fcc2,	loop_391
	wr	%o1,	0x1A21,	%sys_tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xF4E, 	%hsys_tick_cmpr
	smulcc	%g5,	%g3,	%i7
loop_391:
	tn	%xcc,	0x2
	sethi	0x1215,	%i3
	rd	%tick_cmpr,	%i5
	wrpr	%o7,	%g7,	%pil
	tleu	%icc,	0x0
	rdpr	%tl,	%o2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xD30, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	rdpr	%otherwin,	%g1
	rdpr	%wstate,	%o0
	std	%f12,	[%l7 + 0x78]
	rdpr	%tl,	%i6
	umul	%o4,	%i0,	%i2
	array32	%o5,	%o3,	%l2
	tpos	%icc,	0x4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	tvs	%xcc,	0x4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	sdiv	%l1,	0x085E,	%l0
	wrpr	%o1,	%g5,	%cwp
	rdpr	%wstate,	%l5
	and	%i7,	0x19E0,	%g3
	or	%i3,	0x174F,	%o7
	rd	%ccr,	%i5
	wrpr	%o2,	%g4,	%cwp
	array8	%o6,	%g7,	%i4
	fpadd16	%f20,	%f8,	%f12
	fcmpgt16	%f24,	%f12,	%g6
	tsubcctv	%g2,	%i1,	%l4
	bvs,pt	%icc,	loop_392
	rd	%tick_cmpr,	%o0
	wrpr	%g1,	%o4,	%tick
	set	0x5C, %g2
	stwa	%i6,	[%l7 + %g2] 0x04
loop_392:
	wr	%i0,	0x1080,	%clear_softint
	wr	%g0,	0xf1,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
	rd	%softint,	%i2
	rd	%softint,	%o5
	wr 	%g0, 	0x4, 	%fprs
	rd	%y,	%l3
	tn	%xcc,	0x5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%o3,	0x1D2F,	%pil
	set	0x74, %l1
	ldsha	[%l7 + %l1] 0x81,	%g5
	wr	%l5,	%i7,	%y
	fcmpeq32	%f28,	%f2,	%g3
	tvs	%xcc,	0x3
	wr	%i3,	%o7,	%pic
	wrpr	%i5,	0x0BDB,	%pil
	sdivcc	%g4,	0x135E,	%o6
	rdpr	%cwp,	%g7
	movleu	%icc,	%o2,	%g6
	swap	[%l7 + 0x64],	%g2
	wrpr	%i1,	0x00CF,	%cwp
	wr	%l4,	%i4,	%softint
	rdhpr	%hintp,	%g1
	wr	%o0,	%o4,	%ccr
	bpos,a	loop_393
	wr	%i0,	%i6,	%sys_tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%l2,	%i2,	%pil
loop_393:
	ldstub	[%l7 + 0x39],	%l6
	fnors	%f25,	%f25,	%f2
	wrpr	%l1,	0x1CB5,	%cwp
	ta	%icc,	0x5
	array8	%l3,	%o3,	%l0
	rdpr	%otherwin,	%g5
	movvc	%xcc,	%l5,	%o1
	tcs	%xcc,	0x2
	rdhpr	%htba,	%g3
	tg	%xcc,	0x3
	wr	%i7,	0x033D,	%set_softint
	wrpr	%o7,	%i3,	%cwp
	wr	%g0,	0x0c,	%asi
	lduba	[%l7 + 0x42] %asi,	%g4
	wr	%o6,	%g7,	%pic
	rdpr	%otherwin,	%o2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x692, 	%hsys_tick_cmpr
	fnot2	%f18,	%f2
	sdivx	%g2,	0x0C4E,	%i1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x0C6, 	%hsys_tick_cmpr
	wr	%i4,	0x1CD7,	%set_softint
	rdhpr	%hpstate,	%g6
	ldub	[%l7 + 0x2E],	%o0
	rdhpr	%hsys_tick_cmpr,	%g1
	tsubcc	%i0,	%o4,	%i6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%sys_tick_cmpr,	%o5
	movrne	%l6,	%l3,	%l1
	wrpr	%l0,	%o3,	%pil
	wr	%g5,	0x08C1,	%ccr
	mulx	%l5,	%g3,	%i7
	movne	%icc,	%o1,	%o7
	rdpr	%canrestore,	%i3
	ldsh	[%l7 + 0x36],	%o6
	fxnor	%f30,	%f28,	%f30
	wrpr	%g7,	%g4,	%tick
	set	0x50, %o6
	stda	%i4,	[%l7 + %o6] 0xe2
	membar	#Sync
	rdhpr	%hsys_tick_cmpr,	%g2
	rd	%sys_tick_cmpr,	%o2
	edge32ln	%l4,	%i1,	%i4
	fmuld8sux16	%f4,	%f3,	%f10

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	movrlz	%g6,	%g1,	%i0
	wrpr	%i6,	0x19F2,	%tick
	wr	%l2,	0x1C6E,	%softint
	tvs	%icc,	0x3
	tne	%icc,	0x4
	rdpr	%tl,	%i2
	fmovde	%icc,	%f0,	%f6
	rd	%sys_tick_cmpr,	%o5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xEDF, 	%hsys_tick_cmpr
	wr	%g0,	0x04,	%asi
	ldswa	[%l7 + 0x54] %asi,	%o4
	rdpr	%tba,	%l0
	rdhpr	%hsys_tick_cmpr,	%l1
	wr 	%g0, 	0x4, 	%fprs
	bcs,pn	%xcc,	loop_394
	rdpr	%cwp,	%g5
	rdpr	%tba,	%g3
	movrlz	%i7,	0x021,	%l5
loop_394:
	fandnot2	%f12,	%f16,	%f18
	wrpr	%o1,	%i3,	%pil
	wr	%o6,	%g7,	%clear_softint
	tpos	%xcc,	0x5
	rd	%sys_tick_cmpr,	%g4
	or	%o7,	0x1279,	%g2
	rdpr	%cleanwin,	%o2
	rdhpr	%hintp,	%i5
	wrpr	%i1,	%l4,	%cwp
	fsrc2s	%f13,	%f31
	tn	%icc,	0x2
	edge8l	%i4,	%g6,	%o0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x7C6, 	%hsys_tick_cmpr
	movleu	%icc,	%l2,	%i6
	wrpr	%i2,	%o5,	%tick
	add	%l7,	0x24,	%l6
	wr	%g0,	0x10,	%asi
	casa	[%l6] %asi,	%l6,	%l3
	movrlez	%o4,	0x262,	%l0
	wrpr	%l1,	%o3,	%tick
	wrpr	%g3,	%i7,	%cwp
	rd	%ccr,	%l5
	subc	%g5,	%i3,	%o1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	rd	%sys_tick_cmpr,	%o7
	tl	%icc,	0x4
	fcmpes	%fcc2,	%f14,	%f4
	bvs,a	loop_395
	wr	%g4,	0x1DC8,	%sys_tick
	edge8l	%g2,	%i5,	%i1
	array8	%o2,	%i4,	%l4
loop_395:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xFD6, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%l2,	%g6,	%softint
	rd	%softint,	%i6
	fnands	%f13,	%f10,	%f3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%hpstate,	%l3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x503, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	flushw
	bleu,a	loop_396
	umulcc	%l1,	0x1CD8,	%i2
	bne	loop_397
	rdhpr	%hintp,	%o3
loop_396:
	nop
	add	%l7,	0x78,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] %asi,	%i7,	%l5
loop_397:
	fmovsl	%xcc,	%f12,	%f17
	tne	%xcc,	0x4
	rdhpr	%hintp,	%g5
	rdpr	%otherwin,	%g3
	wrpr	%o1,	0x1579,	%pil
	fand	%f28,	%f24,	%f16
	fble	%fcc0,	loop_398
	fabss	%f24,	%f15
	rdhpr	%hintp,	%i3
	fmovsvs	%icc,	%f22,	%f9
loop_398:
	rdpr	%cansave,	%g7
	rd	%fprs,	%o7
	rd	%fprs,	%g4
	rdpr	%pil,	%g2
	rd	%ccr,	%i5
	ldsb	[%l7 + 0x75],	%o6
	rdhpr	%htba,	%i1
	fmovsvs	%xcc,	%f19,	%f2
	fnor	%f20,	%f4,	%f4
	wr	%o2,	%l4,	%sys_tick
	rd	%ccr,	%i4
	wrpr	%o0,	%i0,	%pil
	udivx	%l2,	0x0D48,	%g1
	fbo,a	%fcc0,	loop_399
	lduw	[%l7 + 0x68],	%g6
	rdhpr	%htba,	%o5
	subccc	%l6,	%i6,	%l3
loop_399:
	rdpr	%gl,	%l0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%pil,	%o4
	movvs	%icc,	%i7,	%o3
	movrne	%l5,	%g5,	%g3
	rd	%sys_tick_cmpr,	%i3
	rdhpr	%hsys_tick_cmpr,	%g7
	addcc	%o1,	0x098D,	%g4
	ldsh	[%l7 + 0x70],	%o7
	fba	%fcc3,	loop_400
	wr	%g2,	%i5,	%y
	smul	%o6,	%i1,	%o2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x553, 	%hsys_tick_cmpr
loop_400:
	movrlez	%l4,	%o0,	%l2
	rdhpr	%hintp,	%g1
	rd	%ccr,	%g6
	rdhpr	%hpstate,	%i0
	rdpr	%otherwin,	%o5
	rd	%asi,	%l6
	sth	%l3,	[%l7 + 0x08]
	tge	%xcc,	0x4
	rdpr	%cleanwin,	%l0
	rdpr	%wstate,	%l1
	wrpr	%i2,	0x0640,	%cwp
	wrpr	%i6,	0x1A83,	%cwp
	wrpr	%i7,	0x0A39,	%tick
	fmovdpos	%xcc,	%f6,	%f11
	rd	%y,	%o3
	rdhpr	%hintp,	%l5
	rdpr	%cleanwin,	%g5
	rdpr	%cleanwin,	%o4
	rdhpr	%hsys_tick_cmpr,	%g3
	wr	%i3,	0x19BF,	%set_softint
	movrne	%o1,	%g4,	%g7
	fble,a	%fcc1,	loop_401
	wr	%g2,	0x04A6,	%sys_tick
	rd	%asi,	%o7
	sir	0x0D3A
loop_401:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	edge16ln	%i1,	%o2,	%o6
	ta	%icc,	0x5
	movge	%xcc,	%i4,	%l4
	fnegd	%f14,	%f6
	addc	%l2,	%o0,	%g1
	rd	%asi,	%g6
	alignaddr	%o5,	%i0,	%l6
	edge32ln	%l0,	%l3,	%l1
	mulx	%i6,	0x0C97,	%i7
	taddcctv	%i2,	0x098E,	%o3
	addc	%l5,	%g5,	%o4
	andn	%i3,	0x18C9,	%o1
	rd	%softint,	%g3
	tgu	%xcc,	0x0
	wrpr	%g4,	%g2,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xA85, 	%hsys_tick_cmpr
	rdhpr	%htba,	%i1
	wrpr	%o2,	%o6,	%pil
	wr	%i4,	%l4,	%clear_softint
	rdpr	%gl,	%g7
	rd	%y,	%o0
	movrne	%l2,	0x00B,	%g1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x001, 	%hsys_tick_cmpr
	alignaddrl	%i0,	%l6,	%l0
	wr	%l3,	%g6,	%clear_softint
	rd	%fprs,	%l1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%i7,	%i2,	%ccr
	rdpr	%otherwin,	%o3
	movgu	%xcc,	%g5,	%o4
	fmovrslz	%i3,	%f3,	%f26
	mulx	%l5,	%g3,	%g4
	fcmped	%fcc1,	%f20,	%f18
	wr 	%g0, 	0x6, 	%fprs
	fandnot2s	%f15,	%f23,	%f18
	wrpr	%o7,	0x1CC5,	%cwp
	movl	%xcc,	%i1,	%o2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x4B8, 	%hsys_tick_cmpr
	fnor	%f12,	%f10,	%f30
	wr	%i4,	0x1CA9,	%pic
	movleu	%icc,	%o6,	%g7
	rd	%fprs,	%l4
	fmovdneg	%xcc,	%f13,	%f31
	rdpr	%otherwin,	%l2
	sth	%o0,	[%l7 + 0x1A]
	mulscc	%g1,	0x14D0,	%o5
	wr	%i0,	0x1D1E,	%clear_softint
	wr	%l0,	0x1C57,	%sys_tick
	rd	%fprs,	%l3
	mulx	%l6,	%g6,	%l1
	fmuld8ulx16	%f0,	%f19,	%f16
	fbu	%fcc2,	loop_402
	tsubcc	%i7,	0x142C,	%i2
	rdpr	%cansave,	%i6
	rdhpr	%hpstate,	%o3
loop_402:
	wr	%g5,	0x102B,	%set_softint
	mulx	%i3,	%l5,	%o4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%g3,	%g2,	%cwp
	rdhpr	%hpstate,	%i1
	rdhpr	%hpstate,	%o7
	wrpr	%i5,	0x18E7,	%tick
	movvc	%icc,	%i4,	%o2
	wr	%g0,	0x89,	%asi
	stha	%o6,	[%l7 + 0x28] %asi

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xABB, 	%hsys_tick_cmpr
	set	0x68, %i6
	ldswa	[%l7 + %i6] 0x81,	%o0
	rdpr	%canrestore,	%l2
	wr	%o5,	%i0,	%y
	wr	%l0,	%g1,	%set_softint
	and	%l6,	%g6,	%l1
	movne	%xcc,	%i7,	%l3
	rd	%ccr,	%i6
	xnorcc	%o3,	0x1AA0,	%i2
	rd	%pc,	%i3
	rdpr	%cwp,	%l5
	rdpr	%canrestore,	%g5
	rdhpr	%hsys_tick_cmpr,	%g4
	add	%l7,	0x20,	%l6
	wr	%g0,	0x0c,	%asi
	lda	[%l6] %asi,	%o4
	casa	[%l6] 0x0c,	%o4,	%g3
	wr	%o1,	%i1,	%clear_softint
	rdhpr	%hsys_tick_cmpr,	%o7
	andncc	%i5,	%i4,	%o2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%g0,	0x80,	%asi
	ldstuba	[%l7 + 0x0A] %asi,	%l4
	rdhpr	%htba,	%g7
	rdhpr	%htba,	%l2
	fbne	%fcc3,	loop_403
	rdpr	%gl,	%o0
	rdpr	%canrestore,	%o5
	wrpr	%i0,	0x0444,	%pil
loop_403:
	rd	%pc,	%g1
	srl	%l6,	%l0,	%l1
	movrlz	%g6,	0x298,	%i7
	faligndata	%f6,	%f12,	%f8

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	set	0x48, %g4
	stwa	%i2,	[%l7 + %g4] 0xea
	membar	#Sync
	call	loop_404
	fmovd	%f12,	%f12
	wr 	%g0, 	0x5, 	%fprs

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x59B, 	%hsys_tick_cmpr
loop_404:
	tcs	%xcc,	0x1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%i3,	0x09AE,	%set_softint
	wrpr	%o4,	0x1D8A,	%tick
	wrpr	%o1,	0x1E2C,	%pil
	rd	%ccr,	%i1
	edge8l	%g3,	%i5,	%o7
	wr	%g0,	0x11,	%asi
	ldswa	[%l7 + 0x40] %asi,	%i4
	wrpr	%o2,	%g2,	%cwp
	wr	%l4,	0x19C9,	%clear_softint
	wr	%g0,	0x10,	%asi
	ldxa	[%l7 + 0x40] %asi,	%o6
	fmovdpos	%icc,	%f23,	%f3
	subc	%g7,	%o0,	%o5
	rdpr	%tl,	%i0
	fands	%f26,	%f11,	%f29
	wrpr	%l0,	0x1B2D,	%tick
	udivcc	%l1,	0x01A7,	%l6
	fmovsge	%icc,	%f7,	%f21
	rd	%pc,	%g6
	fsrc2	%f18,	%f4
	wr	%i6,	0x0149,	%y
	wrpr	%i7,	%o3,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%asi,	%g5
	rd	%fprs,	%g4
	wrpr	%i3,	%o4,	%cwp
	ldd	[%l7 + 0x28],	%l4
	rdpr	%pil,	%o1
	bleu,pt	%icc,	loop_405
	rd	%fprs,	%i1
	rd	%pc,	%g3
	array16	%i5,	%i4,	%o2
loop_405:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sra	%g2,	0x03,	%l4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%o0,	%o5,	%tick
	rdpr	%cwp,	%o7
	wr	%i0,	0x1142,	%set_softint
	add	%l2,	0x0AC8,	%g1
	movleu	%icc,	%l0,	%l1
	wr	%g6,	%l6,	%set_softint
	fmovsle	%xcc,	%f1,	%f20

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x003, 	%hsys_tick_cmpr
	movge	%icc,	%l3,	%o3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%i2,	0x1E72,	%ccr
	movneg	%xcc,	%g4,	%o4
	taddcctv	%l5,	%i3,	%o1
	wrpr	%i1,	0x0527,	%tick
	smulcc	%i5,	0x19C0,	%i4
	rdhpr	%hintp,	%o2
	movrlez	%g3,	0x36B,	%g2
	rd	%pc,	%o6
	rdhpr	%hintp,	%l4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x453, 	%hsys_tick_cmpr
	wrpr	%o5,	0x0399,	%tick
	rdpr	%cansave,	%o7
	mova	%icc,	%i0,	%l2
	fpsub32	%f0,	%f30,	%f30
	rd	%fprs,	%g1
	rdhpr	%hintp,	%l0
	rdhpr	%hintp,	%g6
	wrpr	%l1,	0x11DB,	%pil
	mulscc	%l6,	%i6,	%l3
	movrgez	%o3,	%i7,	%i2
	fmovrsne	%g4,	%f4,	%f9
	set	0x10, %i2
	ldda	[%l7 + %i2] 0x14,	%o4
	std	%l4,	[%l7 + 0x60]
	set	0x4C, %g7
	stwa	%g5,	[%l7 + %g7] 0xe2
	membar	#Sync
	wrpr	%i3,	0x0919,	%cwp
	fmovsle	%icc,	%f2,	%f11

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xBAE, 	%hsys_tick_cmpr
	movpos	%icc,	%i5,	%i4
	rd	%tick_cmpr,	%g3
	rdpr	%canrestore,	%o2
	subc	%o6,	0x1248,	%g2
	wrpr	%o0,	%g7,	%tick
	edge16	%l4,	%o7,	%o5
	sdiv	%l2,	0x0464,	%g1
	rd	%y,	%l0
	brz,a	%i0,	loop_406
	rd	%tick_cmpr,	%l1
	wrpr	%l6,	0x09E8,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
loop_406:
	nop
	set	0x38, %l3
	ldswa	[%l7 + %l3] 0x88,	%l3
	rd	%pc,	%g6
	movcs	%xcc,	%o3,	%i7
	rdpr	%tl,	%i2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	movre	%l5,	0x2F2,	%i3
	edge8n	%g5,	%i1,	%i5
	rd	%sys_tick_cmpr,	%o1
	rd	%pc,	%i4
	wr	%o2,	%g3,	%sys_tick
	wr	%g0,	0x80,	%asi
	lduba	[%l7 + 0x7F] %asi,	%o6
	tge	%icc,	0x0
	movcc	%xcc,	%g2,	%o0
	fcmpgt16	%f4,	%f22,	%l4
	ldx	[%l7 + 0x60],	%g7
	set	0x60, %o0
	sta	%f1,	[%l7 + %o0] 0x88
	move	%xcc,	%o7,	%l2
	tleu	%xcc,	0x2
	wr	%o5,	0x0FF6,	%ccr
	rdpr	%tba,	%l0
	wrpr	%i0,	0x177C,	%cwp
	rdhpr	%hpstate,	%l1
	rdpr	%wstate,	%g1
	fxnors	%f30,	%f27,	%f5
	wr	%l6,	0x1181,	%ccr
	rdpr	%tl,	%l3
	tge	%xcc,	0x4
	membar	#Sync
	wr	%g0,	0x1e,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	xorcc	%g6,	%i6,	%o3
	rd	%y,	%i2
	stw	%g4,	[%l7 + 0x44]
	edge32	%o4,	%i7,	%i3
	rd	%y,	%l5
	wr 	%g0, 	0x7, 	%fprs
	wrpr	%o1,	%g5,	%pil
	wr	%o2,	%i4,	%clear_softint
	mova	%icc,	%g3,	%o6
	rd	%asi,	%g2
	sub	%l4,	0x1890,	%g7
	brlez,a	%o0,	loop_407
	for	%f4,	%f28,	%f26
	wrpr	%l2,	%o5,	%pil
	rd	%tick_cmpr,	%o7
loop_407:
	alignaddrl	%l0,	%l1,	%i0
	edge8ln	%l6,	%g1,	%g6
	xor	%i6,	%o3,	%i2
	rd	%sys_tick_cmpr,	%l3
	rd	%y,	%g4
	umul	%i7,	0x08F2,	%i3
	fpack16	%f24,	%f22
	rdpr	%gl,	%l5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbl,a	%fcc3,	loop_408
	rdpr	%tba,	%i1
	movpos	%icc,	%i5,	%o1
	bleu,pt	%xcc,	loop_409
loop_408:
	rdpr	%pil,	%o4
	movvc	%icc,	%g5,	%i4
	udiv	%g3,	0x0DE4,	%o2
loop_409:
	tge	%icc,	0x5
	edge32n	%o6,	%l4,	%g2
	wrpr	%g7,	0x1803,	%cwp
	movgu	%icc,	%l2,	%o5
	bneg	%xcc,	loop_410
	alignaddrl	%o0,	%o7,	%l0
	rdpr	%cansave,	%l1
	mulscc	%l6,	0x0026,	%i0
loop_410:
	wr	%g1,	0x0A31,	%sys_tick
	rd	%fprs,	%g6
	movn	%icc,	%i6,	%i2
	rdpr	%cwp,	%l3
	rd	%asi,	%o3
	smul	%g4,	0x164F,	%i3
	tleu	%xcc,	0x7
	add	%l7,	0x50,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%l5
	casxa	[%l6] %asi,	%l5,	%i7
	rdhpr	%hsys_tick_cmpr,	%i5
	movrne	%i1,	%o1,	%o4
	sethi	0x13C4,	%g5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x130, 	%hsys_tick_cmpr
	movg	%xcc,	%o6,	%i4
	subccc	%l4,	%g7,	%l2
	fpackfix	%f2,	%f1
	wrpr	%g2,	%o0,	%pil
	wrpr	%o7,	%o5,	%tick
	rdhpr	%hpstate,	%l0
	edge32n	%l6,	%i0,	%l1
	edge8n	%g1,	%i6,	%i2
	add	%l3,	0x0CD5,	%o3
	srlx	%g6,	0x1E,	%i3
	wrpr	%g4,	0x0EE1,	%cwp
	fmovdne	%xcc,	%f11,	%f14
	movle	%icc,	%i7,	%i5
	wr	%i1,	%l5,	%clear_softint
	set	0x78, %i5
	sta	%f28,	[%l7 + %i5] 0x18
	rdhpr	%htba,	%o1
	alignaddr	%g5,	%o4,	%o2
	tg	%xcc,	0x4
	rd	%fprs,	%g3
	tge	%icc,	0x5
	rdpr	%otherwin,	%o6
	rdhpr	%hintp,	%i4
	wr	%g7,	0x141A,	%softint
	fones	%f25

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x98D, 	%hsys_tick_cmpr
	be,a,pt	%xcc,	loop_411
	bne	loop_412
	xorcc	%g2,	%o0,	%l4
	or	%o5,	0x1B1E,	%o7
loop_411:
	xorcc	%l0,	%l6,	%l1
loop_412:
	rd	%tick_cmpr,	%g1
	wrpr	%i0,	0x0CCB,	%cwp
	fmovrdlez	%i6,	%f22,	%f18
	fpackfix	%f18,	%f25
	flush	%l7 + 0x28
	wr	%l3,	%o3,	%pic
	rdpr	%cleanwin,	%i2
	wrpr	%g6,	0x1C54,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%hintp,	%i7
	fbne,a	%fcc0,	loop_413
	wr	%i5,	%l5,	%pic
	rdhpr	%hpstate,	%i1
	fands	%f6,	%f7,	%f24
loop_413:
	nop
	wr	%g0,	0x81,	%asi
	lduwa	[%l7 + 0x7C] %asi,	%g5
	edge16	%o1,	%o2,	%o4
	edge8ln	%o6,	%g3,	%g7
	movpos	%xcc,	%l2,	%g2
	fmul8ulx16	%f6,	%f16,	%f24
	wrpr	%o0,	0x1A39,	%cwp
	fmovrsgz	%l4,	%f19,	%f22
	flushw
	edge8n	%i4,	%o5,	%l0
	wr	%o7,	0x062B,	%pic
	fpsub16s	%f8,	%f12,	%f9

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xAD1, 	%hsys_tick_cmpr
	wrpr	%i6,	%o3,	%cwp
	edge16	%i2,	%l3,	%g6
	be,a	loop_414
	movrlz	%g4,	0x1B4,	%i7
	wr	%i3,	%i5,	%softint
	fbule	%fcc1,	loop_415
loop_414:
	rdpr	%wstate,	%i1
	bn,a,pn	%icc,	loop_416
	wrpr	%g5,	0x002B,	%pil
loop_415:
	tcc	%icc,	0x2
	wr	%g0,	0x80,	%asi
	lduha	[%l7 + 0x0A] %asi,	%o1
loop_416:
	subc	%l5,	%o2,	%o6
	rd	%pc,	%g3
	wr	%o4,	0x12DB,	%y
	orncc	%l2,	0x0F44,	%g2
	rd	%softint,	%g7
	ldsh	[%l7 + 0x7A],	%o0
	movge	%xcc,	%i4,	%l4
	rdpr	%cansave,	%l0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	wrpr	%l1,	%g1,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%cwp,	%l6
	rdhpr	%htba,	%i0
	andcc	%o3,	0x1287,	%i6
	orcc	%l3,	0x1A04,	%g6
	rdhpr	%hpstate,	%g4
	rd	%tick_cmpr,	%i7
	bleu,a,pn	%xcc,	loop_417
	wrpr	%i2,	%i3,	%tick
	fmovrde	%i1,	%f8,	%f26
	rdhpr	%hsys_tick_cmpr,	%i5
loop_417:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x074, 	%hsys_tick_cmpr
	fmovspos	%xcc,	%f25,	%f13

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x4E8, 	%hsys_tick_cmpr
	wr	%o1,	0x02DB,	%ccr
	rdhpr	%hsys_tick_cmpr,	%o4
	rd	%ccr,	%l2
	tvs	%xcc,	0x2
	movn	%xcc,	%g2,	%g7
	array16	%o0,	%i4,	%g3
	tsubcc	%l4,	%l0,	%o7
	wrpr	%l1,	0x18AB,	%pil
	fornot1	%f24,	%f28,	%f10
	fmovsvc	%icc,	%f10,	%f17
	wrpr	%o5,	0x114C,	%cwp
	fnands	%f30,	%f7,	%f16
	brgez,a	%g1,	loop_418
	movre	%l6,	0x213,	%o3
	rd	%pc,	%i0
	fba	%fcc2,	loop_419
loop_418:
	bvc	%xcc,	loop_420
	brlez,a	%l3,	loop_421
	rd	%pc,	%i6
loop_419:
	wr	%g6,	%g4,	%ccr
loop_420:
	rdhpr	%hpstate,	%i2
loop_421:
	rd	%y,	%i7
	ld	[%l7 + 0x3C],	%f19
	set	0x42, %g6
	ldsba	[%l7 + %g6] 0x80,	%i1
	rdhpr	%hsys_tick_cmpr,	%i3
	fandnot2s	%f11,	%f3,	%f27
	set	0x19, %l4
	ldstuba	[%l7 + %l4] 0x81,	%g5
	alignaddr	%i5,	%l5,	%o2
	wrpr	%o1,	0x0ABA,	%tick
	rdpr	%tba,	%o6
	fbule	%fcc1,	loop_422
	fmovsleu	%xcc,	%f26,	%f25
	wrpr	%o4,	0x1740,	%cwp
	sll	%l2,	%g2,	%g7
loop_422:
	rd	%ccr,	%i4
	wr	%g0,	0x04,	%asi
	stda	%g2,	[%l7 + 0x18] %asi
	rdpr	%tba,	%l4
	wrpr	%o0,	%o7,	%cwp
	fcmpeq16	%f0,	%f12,	%l0
	ba,a,pt	%xcc,	loop_423
	wrpr	%l1,	%o5,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x7D2, 	%sys_tick_cmpr
	wrpr	%o3,	%l3,	%pil
loop_423:
	array16	%i6,	%g6,	%g4
	wr	%i2,	%i7,	%ccr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x799, 	%hsys_tick_cmpr
	umul	%i0,	0x1860,	%i3
	wr	%g0,	0x18,	%asi
	ldsha	[%l7 + 0x42] %asi,	%g5
	rdpr	%cleanwin,	%i5
	tvs	%xcc,	0x5
	nop
	set	0x78, %o7
	prefetch	[%l7 + %o7],	 0x3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xFC1, 	%hsys_tick_cmpr
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andcc	%o2,	%o6,	%o4
	rdpr	%cleanwin,	%l2
	rdpr	%cwp,	%g7
	rd	%softint,	%g2
	srlx	%g3,	%i4,	%l4
	wr	%o0,	%o7,	%set_softint
	xnorcc	%l1,	%l0,	%g1
	wr	%o5,	0x0D76,	%ccr
	fbn,a	%fcc0,	loop_424
	movcs	%xcc,	%o3,	%l6
	taddcctv	%l3,	%i6,	%g6
	stbar
loop_424:
	tleu	%xcc,	0x2
	edge32l	%g4,	%i7,	%i2
	edge32l	%i1,	%i3,	%g5
	fmuld8sux16	%f9,	%f26,	%f14
	movcs	%icc,	%i0,	%i5
	rdpr	%pil,	%l5
	tn	%icc,	0x7
	fabss	%f23,	%f12

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xE3E, 	%tick_cmpr
	srl	%o4,	%o1,	%l2
	tn	%icc,	0x0
	subcc	%g2,	%g7,	%i4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fornot1	%f16,	%f2,	%f30
	rdhpr	%hintp,	%l4
	tvc	%xcc,	0x1
	fnors	%f29,	%f31,	%f21
	wr	%l1,	%l0,	%y
	edge32	%o7,	%g1,	%o5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x95F, 	%hsys_tick_cmpr
	wrpr	%l3,	0x0758,	%cwp
	fmovsge	%xcc,	%f1,	%f6
	brgz	%i6,	loop_425
	subc	%g6,	0x1815,	%i7
	tne	%xcc,	0x3
	fands	%f28,	%f6,	%f8
loop_425:
	movleu	%xcc,	%g4,	%i1
	rdhpr	%hpstate,	%i3
	fbuge	%fcc0,	loop_426
	rd	%pc,	%i2
	rdhpr	%htba,	%g5
	fcmpgt32	%f8,	%f0,	%i0
loop_426:
	sll	%i5,	0x15,	%l5
	wr	%o2,	%o4,	%sys_tick
	fornot1	%f22,	%f22,	%f0
	wrpr	%l2,	0x12A7,	%cwp
	wrpr	%g7,	%i4,	%pil
	rdpr	%tba,	%g3
	nop
	setx	loop_427,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	edge32n	%o0,	%l4,	%g2
	wrpr	%l1,	0x10EF,	%pil
	rdhpr	%hsys_tick_cmpr,	%o7
loop_427:
	rdhpr	%hsys_tick_cmpr,	%l0
	rd	%y,	%g1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%tl,	%o3
	rd	%y,	%l3
	rdhpr	%hsys_tick_cmpr,	%i6
	ldd	[%l7 + 0x78],	%g6
	wrpr	%o5,	%g4,	%cwp
	wr	%i7,	0x068D,	%y

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xA9B, 	%hsys_tick_cmpr
	wr	%i2,	0x1AD0,	%clear_softint
	xnor	%g5,	0x076A,	%i0
	rd	%y,	%l5
	wr	%o2,	0x0C37,	%ccr
	addcc	%o4,	%o6,	%o1
	wr	%g0,	0x04,	%asi
	ldstuba	[%l7 + 0x73] %asi,	%i5
	wrpr	%l2,	%i4,	%pil
	nop
	set	0x78, %l2
	std	%f28,	[%l7 + %l2]
	andn	%g3,	%g7,	%l4
	wr	%o0,	%g2,	%softint
	tl	%icc,	0x1
	rdhpr	%hintp,	%o7
	fmovdvc	%xcc,	%f17,	%f18
	movle	%icc,	%l1,	%g1
	wrpr	%l0,	0x0FDA,	%cwp
	wrpr	%l6,	0x13CA,	%pil
	rdpr	%tba,	%o3
	wr	%i6,	%g6,	%y
	orncc	%l3,	0x1B48,	%o5
	rdhpr	%htba,	%g4
	fmovrdgz	%i3,	%f24,	%f22
	udivcc	%i1,	0x1914,	%i7
	wr	%i2,	0x0D5E,	%set_softint
	wr 	%g0, 	0x4, 	%fprs
	wrpr	%g5,	%o4,	%cwp
	lduh	[%l7 + 0x08],	%o6
	movge	%xcc,	%o1,	%i5
	set	0x38, %o4
	ldsba	[%l7 + %o4] 0x14,	%l2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x05B, 	%hsys_tick_cmpr
	fmul8sux16	%f12,	%f4,	%f16
	smulcc	%g3,	0x14AB,	%g7
	movge	%xcc,	%l4,	%g2
	movge	%xcc,	%o7,	%l1
	wrpr	%o0,	%g1,	%pil
	rdpr	%otherwin,	%l6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fblg	%fcc1,	loop_428
	rdhpr	%hsys_tick_cmpr,	%i6
	rd	%softint,	%o3
	movcs	%icc,	%g6,	%l3
loop_428:
	umulcc	%o5,	%g4,	%i1
	addccc	%i3,	0x18BD,	%i7
	sdivcc	%i0,	0x1D15,	%i2
	fcmpes	%fcc0,	%f12,	%f13
	array32	%l5,	%g5,	%o6
	wrpr	%o1,	0x0B01,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	nop
	setx	loop_429,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	sdivcc	%i5,	0x066C,	%l2
	rdpr	%tba,	%o2
	edge32	%i4,	%g3,	%l4
loop_429:
	sethi	0x059F,	%g2
	wr	%g0,	0x10,	%asi
	stda	%g6,	[%l7 + 0x08] %asi
	fcmpgt32	%f30,	%f12,	%o7
	rdhpr	%hpstate,	%o0
	rd	%sys_tick_cmpr,	%g1
	std	%l0,	[%l7 + 0x78]
	movg	%icc,	%l6,	%i6
	edge16	%l3,	%o5,	%g4
	rdhpr	%htba,	%i1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x8B0, 	%hsys_tick_cmpr
	fmovde	%xcc,	%f18,	%f4
	rdpr	%cwp,	%i7
	sra	%i0,	0x08,	%l5
	fsrc2s	%f21,	%f24
	sra	%i2,	0x10,	%g5
	wrpr	%o6,	%o1,	%tick
	fsrc2s	%f22,	%f26
	fabss	%f5,	%f3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x495, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x050, 	%hsys_tick_cmpr
	fcmps	%fcc0,	%f26,	%f29
	set	0x10, %i1
	lduba	[%l7 + %i1] 0x04,	%i4
	movvc	%icc,	%o2,	%g3
	wr	%l4,	0x1107,	%sys_tick
	rd	%asi,	%g2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xE23, 	%hsys_tick_cmpr
	rdpr	%otherwin,	%g7
	rd	%pc,	%g1
	wr	%o0,	%l6,	%clear_softint

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fnot1	%f22,	%f16
	tgu	%icc,	0x7
	wr	%i6,	0x013E,	%y
	rdhpr	%hpstate,	%g6
	rdhpr	%hpstate,	%l3
	alignaddrl	%o5,	%g4,	%i1
	wr	%l0,	0x0435,	%softint
	rd	%pc,	%o3
	rd	%tick_cmpr,	%i3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x43A, 	%hsys_tick_cmpr
	tg	%xcc,	0x4
	bpos	%icc,	loop_430
	subccc	%i7,	0x132E,	%i2
	wrpr	%o6,	%g5,	%cwp
	wrpr	%i5,	0x1D4D,	%cwp
loop_430:
	fpsub32	%f10,	%f12,	%f18
	wr	%l2,	0x1227,	%clear_softint
	rd	%asi,	%o1
	rdpr	%otherwin,	%i4
	umulcc	%o4,	%g3,	%l4
	wr	%o2,	%g2,	%set_softint
	wr	%g0,	0x80,	%asi
	ldda	[%l7 + 0x20] %asi,	%g6
	wrpr	%o7,	0x0D73,	%cwp
	wrpr	%o0,	0x0F63,	%pil
	set	0x0B, %g5
	lduba	[%l7 + %g5] 0x15,	%g1
	be,pn	%icc,	loop_431
	rdhpr	%hintp,	%l6
	fmovsgu	%xcc,	%f18,	%f8
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_431:
	rd	%ccr,	%i6
	wr	%g6,	0x0913,	%ccr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fmovrslz	%o5,	%f16,	%f15
	wr	%g4,	%i1,	%set_softint
	array32	%l3,	%o3,	%i3
	wrpr	%i0,	%l0,	%pil
	wrpr	%l5,	%i2,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	edge16ln	%g5,	%i5,	%l2
	rdhpr	%htba,	%o1
	rdpr	%cansave,	%i4
	rdhpr	%htba,	%g3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	smulcc	%o2,	%g2,	%g7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x94E, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x6B9, 	%hsys_tick_cmpr
	rdhpr	%htba,	%l6
	nop
	setx	loop_432,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movg	%icc,	%i6,	%g6
	wrpr	%g1,	0x0AD2,	%pil
	rd	%y,	%l1
loop_432:
	wr	%g4,	%o5,	%sys_tick
	wrpr	%l3,	0x1E74,	%tick
	tle	%xcc,	0x7
	pdist	%f0,	%f24,	%f2
	tpos	%icc,	0x5
	set	0x68, %o5
	prefetcha	[%l7 + %o5] 0x18,	 0x1
	rd	%fprs,	%o3
	wr	%i3,	%i0,	%pic
	rdhpr	%hpstate,	%l0
	rdpr	%pil,	%i2
	rdhpr	%hsys_tick_cmpr,	%g5
	rdpr	%pil,	%i7
	edge16n	%i5,	%o1,	%i4
	rdhpr	%hpstate,	%l2
	wrpr	%o4,	%o2,	%tick
	wr	%g2,	%g3,	%set_softint
	wrpr	%o7,	%g7,	%tick
	bgu,a,pt	%xcc,	loop_433
	rdpr	%pil,	%o0
	rd	%y,	%l6
	wr	%i6,	%l4,	%ccr
loop_433:
	movpos	%xcc,	%g1,	%l1
	wrpr	%g6,	%g4,	%tick
	rdhpr	%hpstate,	%l3
	bne,pn	%icc,	loop_434
	rdpr	%cansave,	%o5
	rdhpr	%htba,	%o3
	rdhpr	%hsys_tick_cmpr,	%i1
loop_434:
	wr	%i3,	0x194E,	%sys_tick
	fmovdg	%xcc,	%f10,	%f23
	rdpr	%tba,	%i0
	fmovsne	%icc,	%f27,	%f30
	rdpr	%cleanwin,	%l0
	wrpr	%l5,	%o6,	%pil
	wr	%g5,	%i2,	%sys_tick
	xnor	%i5,	0x1651,	%i7
	rdpr	%canrestore,	%i4
	rdhpr	%htba,	%o1
	movl	%icc,	%o4,	%o2
	movvc	%icc,	%g2,	%l2
	rd	%softint,	%o7
	stbar
	rdhpr	%hsys_tick_cmpr,	%g3
	rdpr	%cwp,	%g7
	wr	%l6,	%i6,	%ccr
	subccc	%l4,	0x1E5C,	%o0
	tge	%xcc,	0x3
	wr	%l1,	0x190A,	%clear_softint
	wrpr	%g6,	%g4,	%pil
	wrpr	%g1,	%o5,	%cwp
	rdhpr	%htba,	%l3
	rdhpr	%hpstate,	%o3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%hsys_tick_cmpr,	%l0
	fmovrdlez	%i1,	%f16,	%f22
	wr	%o6,	%l5,	%softint
	rdhpr	%hpstate,	%i2
	movgu	%icc,	%i5,	%i7
	ldd	[%l7 + 0x48],	%i4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	movcc	%icc,	%o4,	%o2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x18C, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	popc	0x1519,	%g7
	udiv	%l6,	0x0A78,	%g3
	nop
	set	0x48, %o2
	std	%f12,	[%l7 + %o2]
	rdhpr	%htba,	%l4
	wrpr	%o0,	0x1A32,	%tick
	sdiv	%l1,	0x1F8B,	%i6
	wrpr	%g4,	0x1557,	%cwp
	rd	%pc,	%g1
	subcc	%o5,	0x161D,	%l3
	xor	%g6,	0x141A,	%i3
	wr	%o3,	%l0,	%y

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x633, 	%hsys_tick_cmpr
	xnor	%i1,	0x1B96,	%i2
	rd	%softint,	%i5
	brgez,a	%l5,	loop_435
	wr	%i4,	%i7,	%softint
	fpadd32s	%f26,	%f13,	%f1
	fsrc1	%f8,	%f24
loop_435:
	rd	%fprs,	%o4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xE84, 	%hsys_tick_cmpr
	edge32l	%o1,	%g2,	%o7
	rd	%sys_tick_cmpr,	%l2
	rd	%tick_cmpr,	%l6
	xorcc	%g3,	%l4,	%g7
	fsrc1	%f30,	%f0
	wr	%l1,	0x126D,	%ccr
	wr	%i6,	0x0CFA,	%set_softint

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	bge,a	loop_436
	wrpr	%g4,	%l3,	%pil
	prefetch	[%l7 + 0x30],	 0x1
	ldsh	[%l7 + 0x52],	%o5
loop_436:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xCB8, 	%hsys_tick_cmpr
	addccc	%i0,	%l0,	%o6
	rdhpr	%hpstate,	%i1
	rdhpr	%hsys_tick_cmpr,	%i2
	fmovdge	%icc,	%f6,	%f21
	wr	%i5,	%l5,	%clear_softint
	rdhpr	%htba,	%i4
	set	0x40, %g3
	lduwa	[%l7 + %g3] 0x18,	%o4
	rdpr	%cansave,	%i7
	rd	%y,	%g5
	wr	%g0,	0x0c,	%asi
	ldstuba	[%l7 + 0x2F] %asi,	%o1
	movvs	%xcc,	%o2,	%g2
	rdpr	%cwp,	%l2
	add	%l6,	0x0199,	%g3
	edge32ln	%l4,	%g7,	%o7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	rd	%softint,	%g1
	rd	%sys_tick_cmpr,	%g4
	wrpr	%l3,	%o5,	%pil
	wrpr	%g6,	0x1677,	%cwp
	movgu	%icc,	%o0,	%o3
	rd	%softint,	%i0
	tn	%icc,	0x0
	wr	%i3,	%o6,	%pic
	rd	%asi,	%l0
	rd	%pc,	%i1
	add	%i5,	%i2,	%i4
	udivcc	%o4,	0x08FD,	%i7
	fcmpne32	%f8,	%f22,	%l5
	stx	%g5,	[%l7 + 0x20]
	wr	%o1,	%o2,	%ccr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x5CD, 	%hsys_tick_cmpr
	rd	%softint,	%l6
	edge32ln	%l2,	%g3,	%l4
	wr	%o7,	0x13CF,	%ccr
	ta	%xcc,	0x5
	wr	%i6,	0x12CF,	%clear_softint
	fbuge	%fcc1,	loop_437
	rdhpr	%hpstate,	%g7
	rd	%sys_tick_cmpr,	%l1
	be,a	loop_438
loop_437:
	rd	%fprs,	%g1
	wr	%g4,	%o5,	%sys_tick
	rdpr	%pil,	%g6
loop_438:
	rd	%sys_tick_cmpr,	%o0
	andcc	%o3,	0x1D1A,	%i0
	wrpr	%i3,	0x0444,	%tick
	addcc	%o6,	0x0FB9,	%l0
	smul	%i1,	%i5,	%i2
	subccc	%i4,	0x078C,	%o4
	edge32	%i7,	%g5,	%o1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	edge16n	%o2,	%l6,	%l2
	alignaddr	%g2,	%g3,	%o7
	rdhpr	%hintp,	%i6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x58F, 	%hsys_tick_cmpr
	movrgz	%g1,	0x05A,	%l1
	umul	%o5,	%g6,	%o0
	rdpr	%tba,	%g4
	sethi	0x059C,	%l3
	rdpr	%tl,	%i0
	taddcc	%i3,	%o3,	%o6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x5B4, 	%hsys_tick_cmpr
	wr	%i5,	%i4,	%softint
	wrpr	%o4,	0x1813,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	smul	%o1,	%i7,	%o2
	fornot1s	%f12,	%f18,	%f11
	rd	%tick_cmpr,	%l6
	rd	%pc,	%l2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x24F, 	%sys_tick_cmpr
	wrpr	%g2,	%o7,	%cwp
	edge16	%i6,	%g3,	%l4
	movvs	%icc,	%g7,	%g1
	wrpr	%l1,	%g6,	%cwp
	tvc	%xcc,	0x0
	wr	%o5,	%o0,	%softint
	wrpr	%l3,	0x0F8A,	%tick
	srl	%i0,	%i3,	%o3
	edge32ln	%g4,	%o6,	%i1
	wrpr	%l0,	0x1DE1,	%pil
	wr	%i5,	0x067E,	%sys_tick
	rd	%sys_tick_cmpr,	%o4
	brlz	%i4,	loop_439
	rd	%softint,	%g5
	wr	%g0,	0x2f,	%asi
	stha	%o1,	[%l7 + 0x4A] %asi
	membar	#Sync
loop_439:
	swap	[%l7 + 0x48],	%i7
	tl	%xcc,	0x3
	wrpr	%i2,	0x00C4,	%tick
	mulx	%l6,	0x0874,	%l2
	rd	%softint,	%o2
	wr	%g0,	0x81,	%asi
	lda	[%l7 + 0x48] %asi,	%f28

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xA41, 	%hsys_tick_cmpr
	rd	%ccr,	%o7
	fmovrslez	%l5,	%f6,	%f30
	fmovrde	%g3,	%f8,	%f18
	movrgz	%i6,	%g7,	%l4
	addcc	%l1,	%g6,	%g1
	membar	0x67
	wr	%g0,	0x18,	%asi
	ldswa	[%l7 + 0x48] %asi,	%o5
	siam	0x6
	rdhpr	%hsys_tick_cmpr,	%l3
	wrpr	%i3,	%i0,	%cwp
	rdhpr	%hpstate,	%o3
	ble,a	%icc,	loop_440
	andcc	%g4,	0x0DCC,	%o6
	orcc	%i1,	0x0797,	%i5
	rdpr	%cansave,	%l0
loop_440:
	edge16ln	%o4,	%g5,	%o1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	stw	%i4,	[%l7 + 0x74]
	rdhpr	%htba,	%l6
	wrpr	%o2,	0x0B6B,	%tick
	rdhpr	%hpstate,	%g2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xE59, 	%sys_tick_cmpr
	rd	%y,	%o7
	fors	%f2,	%f8,	%f1
	ble	%icc,	loop_441
	wr	%i6,	0x1AD8,	%ccr
	rdhpr	%hsys_tick_cmpr,	%g3
	rdpr	%otherwin,	%l4
loop_441:
	tleu	%xcc,	0x1
	rdpr	%tl,	%l1
	wr	%g6,	%g7,	%softint
	rd	%pc,	%g1
	lduw	[%l7 + 0x78],	%o5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x662, 	%hsys_tick_cmpr
	or	%i0,	%o3,	%l3
	rdhpr	%hsys_tick_cmpr,	%g4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%o6,	0x0D4F,	%cwp
	rdpr	%tba,	%i5
	wrpr	%l0,	0x1758,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x49D, 	%tick_cmpr
	rdpr	%cleanwin,	%o4
	wr	%i7,	0x1FAB,	%sys_tick
	wrpr	%o1,	0x1B88,	%tick
	fzero	%f12
	wr	%i2,	%l6,	%set_softint
	rdpr	%pil,	%o2
	rd	%tick_cmpr,	%g2
	rdpr	%tba,	%l2
	st	%f19,	[%l7 + 0x2C]
	membar	0x4F
	tge	%icc,	0x0
	rdpr	%pil,	%l5
	wrpr	%o7,	%i4,	%cwp
	wr	%i6,	%l4,	%y
	movne	%xcc,	%g3,	%g6
	wr	%l1,	%g1,	%sys_tick
	rdhpr	%hpstate,	%g7
	rd	%tick_cmpr,	%o5
	wr	%g0,	0x18,	%asi
	stwa	%o0,	[%l7 + 0x18] %asi
	fnegd	%f8,	%f6
	smul	%i3,	%o3,	%i0
	fbu	%fcc1,	loop_442
	tneg	%icc,	0x0
	rdpr	%gl,	%l3
	fmovsgu	%xcc,	%f8,	%f25
loop_442:
	tg	%xcc,	0x3
	wrpr	%i1,	%g4,	%tick
	mova	%xcc,	%i5,	%l0
	fmul8x16	%f31,	%f16,	%f10
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldub	[%l7 + 0x46],	%o6
	rdpr	%gl,	%g5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xC0C, 	%hsys_tick_cmpr
	wr	%o1,	0x084A,	%softint
	rd	%softint,	%i2
	rdpr	%cansave,	%l6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xD7D, 	%hsys_tick_cmpr
	rdhpr	%hsys_tick_cmpr,	%l2
	srlx	%o2,	%l5,	%i4
	rd	%asi,	%i6
	rdpr	%canrestore,	%l4
	rd	%ccr,	%g3
	smul	%g6,	%o7,	%g1
	bleu,a	%xcc,	loop_443
	movleu	%xcc,	%l1,	%o5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	or	%g7,	0x0F4D,	%i0
loop_443:
	movrlez	%o3,	0x11B,	%i1
	rdpr	%cansave,	%g4
	bvc,a,pt	%xcc,	loop_444
	rdpr	%cwp,	%i5
	nop
	setx loop_445, %l0, %l1
	jmpl %l1, %l3
	rd	%asi,	%o6
loop_444:
	rd	%tick_cmpr,	%l0
	rd	%tick_cmpr,	%g5
loop_445:
	movvs	%icc,	%o4,	%i2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xE9F, 	%tick_cmpr
	rdhpr	%hpstate,	%o1
	sethi	0x00CF,	%i7
	rdpr	%cansave,	%g2
	sdivcc	%l2,	0x1E8C,	%l5
	fsrc1	%f6,	%f22
	rdpr	%tl,	%o2
	rdpr	%tba,	%i4
	fbo	%fcc2,	loop_446
	rdpr	%tba,	%i6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x827, 	%hsys_tick_cmpr
	fbo,a	%fcc1,	loop_447
loop_446:
	wr	%o7,	0x0B84,	%clear_softint
	set	0x10, %i7
	ldxa	[%l7 + %i7] 0x10,	%g6
loop_447:
	ldsh	[%l7 + 0x2A],	%l1
	or	%g1,	0x1447,	%o5
	taddcc	%o0,	0x1607,	%g7
	andncc	%i3,	%o3,	%i0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	ldd	[%l7 + 0x68],	%f10
	alignaddrl	%i5,	%o6,	%l0
	fpsub16	%f12,	%f16,	%f20
	rdpr	%wstate,	%g5
	smul	%o4,	%i2,	%l6
	rd	%softint,	%o1
	rdhpr	%hpstate,	%i7
	fmovse	%icc,	%f2,	%f30

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%tba,	%l5
	fmovsa	%icc,	%f8,	%f2
	rdpr	%wstate,	%l2
	wrpr	%i4,	%o2,	%tick
	sdivcc	%l4,	0x1D90,	%g3
	edge8	%o7,	%i6,	%g6
	rd	%softint,	%g1
	wr	%o5,	%l1,	%y
	tn	%xcc,	0x2
	wrpr	%g7,	%o0,	%tick
	subccc	%i3,	%i0,	%g4
	rd	%sys_tick_cmpr,	%o3
	set	0x18, %i0
	prefetcha	[%l7 + %i0] 0x0c,	 0x2
	rdhpr	%htba,	%i5
	std	%o6,	[%l7 + 0x50]
	rd	%softint,	%i1
	subccc	%g5,	%l0,	%o4
	wr	%l6,	0x1709,	%pic
	fzeros	%f9
	rd	%sys_tick_cmpr,	%o1
	wr	%i7,	%i2,	%set_softint
	umulcc	%g2,	%l5,	%i4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%cansave,	%g3
	rdpr	%tl,	%o2
	orcc	%i6,	0x0BAF,	%o7
	rdhpr	%hintp,	%g1
	wr	%g6,	0x18CB,	%y
	sethi	0x1B37,	%o5
	andn	%l1,	%g7,	%o0
	rdhpr	%hsys_tick_cmpr,	%i0
	edge16n	%i3,	%o3,	%l3
	tl	%icc,	0x3
	rdpr	%wstate,	%g4
	wr	%o6,	0x009A,	%clear_softint
	wrpr	%i1,	%i5,	%tick
	stx	%l0,	[%l7 + 0x78]
	nop
	setx	loop_448,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	rdpr	%canrestore,	%o4
	wr	%g0,	0xe3,	%asi
	stxa	%g5,	[%l7 + 0x60] %asi
	membar	#Sync
loop_448:
	pdist	%f8,	%f26,	%f12
	movre	%o1,	%l6,	%i7
	wr	%i2,	0x0F4E,	%sys_tick
	wr	%l5,	0x0B2D,	%clear_softint
	subc	%g2,	%i4,	%l4
	nop
	set	0x2E, %o3
	ldub	[%l7 + %o3],	%l2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xCED, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	array16	%i6,	%g6,	%o5
	edge16	%g1,	%l1,	%o0
	rd	%tick_cmpr,	%g7
	rdpr	%canrestore,	%i0
	rdpr	%cleanwin,	%i3
	set	0x18, %i3
	ldswa	[%l7 + %i3] 0x80,	%o3
	fbo	%fcc1,	loop_449
	rd	%sys_tick_cmpr,	%l3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x1FF, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xE85, 	%hsys_tick_cmpr
loop_449:
	rdpr	%cwp,	%o4
	udivcc	%g5,	0x1E51,	%i5
	or	%o1,	0x1905,	%l6
	fmovrdgz	%i2,	%f26,	%f14
	rdhpr	%hpstate,	%l5
	fzeros	%f11
	umulcc	%i7,	0x1835,	%g2
	set	0x40, %g1
	ldda	[%l7 + %g1] 0x88,	%f0
	fmovsgu	%xcc,	%f16,	%f4
	edge8n	%l4,	%i4,	%o2
	movge	%icc,	%g3,	%o7
	rdhpr	%hpstate,	%l2
	prefetch	[%l7 + 0x40],	 0x2
	rdhpr	%htba,	%i6
	orn	%o5,	0x0387,	%g6
	array32	%g1,	%l1,	%o0
	lduw	[%l7 + 0x58],	%i0
	wrpr	%i3,	0x111A,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x1EC, 	%hsys_tick_cmpr
	xorcc	%l3,	%i1,	%l0
	xnor	%g4,	0x1D27,	%g5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x9AD, 	%hsys_tick_cmpr
	rd	%asi,	%l6
	rdhpr	%hsys_tick_cmpr,	%l5
	ld	[%l7 + 0x6C],	%f13

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x90F, 	%hsys_tick_cmpr
	fabss	%f1,	%f27

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xD41, 	%hsys_tick_cmpr
	rd	%softint,	%o2
	fbn	%fcc3,	loop_450
	movleu	%icc,	%g2,	%g3
	wrpr	%o7,	0x19C0,	%tick
	and	%l2,	%o5,	%g6
loop_450:
	fcmpgt16	%f6,	%f14,	%g1
	rdhpr	%htba,	%l1
	rdpr	%otherwin,	%o0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x308, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x789, 	%hsys_tick_cmpr
	fmuld8sux16	%f3,	%f16,	%f28
	rdhpr	%hsys_tick_cmpr,	%o6
	wr	%i3,	%i1,	%softint
	orn	%l0,	0x1B33,	%l3
	rd	%ccr,	%g4
	ldd	[%l7 + 0x18],	%f12
	rdpr	%cansave,	%i5
	edge8n	%g5,	%o1,	%l6
	rdhpr	%hintp,	%l5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	rdpr	%canrestore,	%l4
	flushw
	fmovsneg	%xcc,	%f27,	%f23
	rd	%tick_cmpr,	%i7
	fpsub16	%f14,	%f12,	%f20
	wrpr	%o2,	0x04DD,	%cwp
	movle	%icc,	%i4,	%g2
	wr	%o7,	0x08B3,	%sys_tick
	brnz,a	%l2,	loop_451
	tvs	%xcc,	0x1
	rdpr	%otherwin,	%o5
	wr	%g6,	%g3,	%y
loop_451:
	addcc	%l1,	0x1B63,	%o0
	rdpr	%canrestore,	%g1
	tcs	%icc,	0x7
	rd	%fprs,	%i0
	wrpr	%g7,	%i6,	%tick
	srlx	%o3,	%i3,	%i1
	rdpr	%gl,	%o6
	brlez	%l0,	loop_452
	rd	%ccr,	%g4
	rdpr	%cwp,	%l3
	fnot2s	%f3,	%f16
loop_452:
	rd	%pc,	%g5
	wrpr	%i5,	0x03DA,	%tick
	fmovs	%f23,	%f18
	rdpr	%canrestore,	%o1
	rdpr	%pil,	%l5
	rdhpr	%hsys_tick_cmpr,	%o4
	rdhpr	%hintp,	%i2
	orn	%l4,	%i7,	%l6
	rdpr	%tba,	%i4
	wr	%o2,	%g2,	%clear_softint
	subc	%o7,	%l2,	%g6
	edge32	%g3,	%o5,	%o0
	rdhpr	%hsys_tick_cmpr,	%l1
	rd	%sys_tick_cmpr,	%i0
	bshuffle	%f20,	%f20,	%f0
	wrpr	%g7,	0x0807,	%tick
	st	%f20,	[%l7 + 0x7C]
	stb	%g1,	[%l7 + 0x21]
	fbn	%fcc2,	loop_453
	wrpr	%i6,	0x095B,	%pil
	wrpr	%i3,	%o3,	%tick
	wrpr	%i1,	0x0752,	%pil
loop_453:
	rdpr	%wstate,	%o6
	movvc	%icc,	%g4,	%l3
	rd	%y,	%l0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%htba,	%i5
	stw	%l5,	[%l7 + 0x48]
	rdpr	%otherwin,	%o4
	rdhpr	%hpstate,	%o1
	taddcctv	%i2,	%i7,	%l6
	rdpr	%gl,	%i4
	wr	%o2,	0x0597,	%sys_tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%o7,	0x00C9,	%pil
	wrpr	%l2,	0x0275,	%cwp
	wr	%g3,	0x0B7F,	%set_softint
	sllx	%g6,	0x02,	%o0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	xnor	%o5,	0x0F7E,	%i0
	edge16n	%g1,	%i6,	%i3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	subcc	%o3,	%i1,	%g4
	movne	%xcc,	%o6,	%l3
	wr	%g0,	0xea,	%asi
	stba	%l0,	[%l7 + 0x51] %asi
	membar	#Sync

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%pc,	%l5
	rdhpr	%hpstate,	%o4
	array32	%g5,	%o1,	%i7
	rdhpr	%hpstate,	%l6
	sll	%i4,	%o2,	%i2
	rd	%ccr,	%g2
	rd	%tick_cmpr,	%l4
	fblg	%fcc1,	loop_454
	wrpr	%o7,	%l2,	%cwp
	wrpr	%g3,	%g6,	%pil
	rdhpr	%hpstate,	%l1
loop_454:
	rdpr	%canrestore,	%o5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x7C5, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fpadd16	%f24,	%f2,	%f20
	fmul8x16	%f9,	%f28,	%f10
	rdpr	%wstate,	%o0
	ldstub	[%l7 + 0x66],	%g7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	tne	%icc,	0x4
	ba,pn	%xcc,	loop_455
	wr	%i1,	%o6,	%pic
	rdhpr	%hintp,	%g4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x153, 	%hsys_tick_cmpr
loop_455:
	fmovsn	%xcc,	%f2,	%f7
	rd	%tick_cmpr,	%l0
	rd	%fprs,	%i5
	rdpr	%canrestore,	%o4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x89C, 	%hsys_tick_cmpr
	edge8n	%i7,	%i4,	%l6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fornot2s	%f30,	%f16,	%f1
	orcc	%o2,	%g2,	%l4
	rdpr	%otherwin,	%o7
	array16	%g3,	%g6,	%l2
	fcmped	%fcc2,	%f6,	%f26
	srax	%l1,	0x19,	%i0
	rdhpr	%htba,	%o5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%pc,	%g1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%g0,	0x11,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	rdpr	%cleanwin,	%o3
	sub	%i1,	%o6,	%g4
	rdpr	%cleanwin,	%l3
	rdhpr	%hsys_tick_cmpr,	%o0
	fmovde	%xcc,	%f24,	%f15
	wrpr	%i5,	0x001A,	%tick
	rd	%tick_cmpr,	%l0
	rd	%softint,	%l5
	tge	%xcc,	0x1
	fzero	%f14
	swap	[%l7 + 0x08],	%g5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xB22, 	%hsys_tick_cmpr
	edge32l	%o4,	%i7,	%i4
	wrpr	%l6,	0x0969,	%tick
	fmul8ulx16	%f22,	%f16,	%f12
	xnorcc	%i2,	0x0A65,	%o2
	stx	%l4,	[%l7 + 0x50]
	movrne	%g2,	%g3,	%g6
	wr	%g0,	0x22,	%asi
	stha	%o7,	[%l7 + 0x62] %asi
	membar	#Sync
	rdpr	%wstate,	%l2
	rdpr	%otherwin,	%l1
	fmovdleu	%xcc,	%f27,	%f4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xE71, 	%hsys_tick_cmpr
	bvc,a	%icc,	loop_456
	move	%icc,	%i0,	%i3
	rdpr	%cleanwin,	%i6
	rdhpr	%hpstate,	%g7
loop_456:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xED2, 	%hsys_tick_cmpr
	rd	%fprs,	%i1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	xnorcc	%l3,	%g4,	%i5
	fbne,a	%fcc0,	loop_457
	wr	%l0,	0x0F1B,	%pic
	wr	%o0,	0x071B,	%sys_tick
	set	0x7E, %l0
	ldsha	[%l7 + %l0] 0x89,	%l5
loop_457:
	srax	%g5,	0x18,	%o1
	rdhpr	%hsys_tick_cmpr,	%i7
	wrpr	%i4,	0x0078,	%tick
	fcmple32	%f2,	%f20,	%l6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xEA5, 	%hsys_tick_cmpr
	tvs	%xcc,	0x4
	rdhpr	%hintp,	%o2
	wrpr	%l4,	0x01D3,	%pil
	movcc	%xcc,	%g2,	%g3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	set	0x58, %l5
	sta	%f6,	[%l7 + %l5] 0x0c
	wr 	%g0, 	0x5, 	%fprs

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x313, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x1D4, 	%hsys_tick_cmpr
	rdpr	%tl,	%o5
	fmovdge	%icc,	%f3,	%f30
	rdpr	%cleanwin,	%i3
	rd	%tick_cmpr,	%i6
	sir	0x1474
	wr	%g7,	0x173C,	%softint
	movl	%xcc,	%o3,	%g1
	wrpr	%i1,	0x0AF3,	%cwp
	rdpr	%cansave,	%o6
	rdpr	%gl,	%g4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	edge16n	%l0,	%o0,	%l5
	rd	%asi,	%i5
	wr	%o1,	%i7,	%sys_tick
	rdhpr	%htba,	%g5
	fnot2	%f10,	%f4
	srlx	%l6,	%i4,	%i2
	ldsb	[%l7 + 0x1D],	%o2
	fbn	%fcc3,	loop_458
	edge8l	%l4,	%g3,	%o4
	xor	%g6,	%o7,	%l2
	rdpr	%wstate,	%l1
loop_458:
	wrpr	%g2,	%i0,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x89E, 	%tick_cmpr
	wrpr	%i3,	0x1524,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	edge16l	%i6,	%g1,	%o6
	edge8n	%g4,	%i1,	%l3
	xnor	%o0,	0x1B30,	%l5
	fxnors	%f21,	%f3,	%f24
	bg,a,pn	%xcc,	loop_459
	movl	%xcc,	%l0,	%o1
	movrgez	%i7,	%g5,	%i5
	bpos	%icc,	loop_460
loop_459:
	rdhpr	%hpstate,	%i4
	rdhpr	%hpstate,	%l6
	tvs	%icc,	0x1
loop_460:
	rdhpr	%htba,	%o2
!Yo - got one - imm_asi 0x52 
!And yo - immediate is 0x118
	set	0x118, %o1
	ldxa	[%g0 + %o1] 0x52,	%l4
	wrpr	%g3,	0x040F,	%cwp
	rdhpr	%hpstate,	%o4
	rdpr	%wstate,	%g6
	rdpr	%cwp,	%o7
	fmovsge	%xcc,	%f14,	%f18
	bl,a,pn	%icc,	loop_461
	movneg	%icc,	%l2,	%i2
	movleu	%icc,	%l1,	%g2
	rdhpr	%hintp,	%i0
loop_461:
	rdhpr	%hpstate,	%i3
	wr	%g7,	%o3,	%sys_tick
	ldx	[%l7 + 0x38],	%i6
	wr	%o5,	0x1C47,	%set_softint
	edge8ln	%o6,	%g4,	%i1
	wr	%g1,	%l3,	%sys_tick
	rd	%fprs,	%o0
	tsubcctv	%l5,	%o1,	%l0
	movl	%xcc,	%i7,	%g5
	rd	%sys_tick_cmpr,	%i4
	wr	%l4,	%i5,	%y
	fblg,a	%fcc1,	loop_462
	edge8ln	%g3,	%g6,	%o4
	sra	%o7,	0x07,	%i2
	rd	%sys_tick_cmpr,	%l2
loop_462:
	movre	%g2,	%l1,	%i3
	rd	%sys_tick_cmpr,	%i0
	rd	%fprs,	%o3
	wr	%i6,	0x1392,	%y
	movvs	%xcc,	%g7,	%o5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xF8D, 	%hsys_tick_cmpr
	fbg	%fcc1,	loop_463
	rd	%sys_tick_cmpr,	%g1
	edge32	%g4,	%o0,	%l3
	wr 	%g0, 	0x5, 	%fprs
loop_463:
	bl	%icc,	loop_464
	tsubcctv	%i7,	%l5,	%i4
	tcc	%xcc,	0x2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_464:
	rdhpr	%hsys_tick_cmpr,	%g5
	fnands	%f18,	%f17,	%f11

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x589, 	%hsys_tick_cmpr
	fpadd32	%f26,	%f24,	%f30
	fabsd	%f16,	%f14
	lduh	[%l7 + 0x50],	%o2
	tn	%icc,	0x5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x3C4, 	%hsys_tick_cmpr
	wr	%o4,	0x04F0,	%set_softint
	rdhpr	%hintp,	%i5
	rdpr	%cwp,	%o7
	tsubcctv	%i2,	%l2,	%l1
	edge16l	%i3,	%g2,	%i0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	brlez	%o5,	loop_465
	taddcc	%o6,	0x0516,	%i1
	mova	%xcc,	%g1,	%o3
	rdpr	%canrestore,	%o0
loop_465:
	te	%icc,	0x5
	fmovd	%f0,	%f16

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	or	%l3,	%l0,	%i7
	fmovdcs	%xcc,	%f10,	%f6
	udiv	%l5,	0x017C,	%o1
	tsubcctv	%i4,	0x0B3E,	%l6
	tcc	%icc,	0x7
	sethi	0x13B9,	%l4
	sub	%g5,	%o2,	%g6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	wr	%o7,	%o4,	%pic
	rdpr	%canrestore,	%l2
	rdhpr	%hintp,	%i2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnot1s	%f4,	%f17
	rdhpr	%htba,	%l1
	fmovsvs	%icc,	%f3,	%f19
	rdhpr	%hsys_tick_cmpr,	%i3
	nop
	setx	loop_466,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	wr	%g2,	0x1988,	%sys_tick
	wrpr	%i6,	%g7,	%cwp
	wr	%i0,	0x10BB,	%pic
loop_466:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x920, 	%hsys_tick_cmpr
	fpadd32	%f6,	%f22,	%f6
	prefetch	[%l7 + 0x78],	 0x3
	rd	%softint,	%o6
	rdpr	%cansave,	%i1
	fpadd32	%f18,	%f6,	%f0
	fcmple16	%f16,	%f14,	%o3
	wrpr	%g1,	0x01E4,	%cwp
	brgz	%g4,	loop_467
	tne	%xcc,	0x4
	wr	%o0,	%l0,	%softint
	wr	%l3,	0x17F6,	%sys_tick
loop_467:
	tpos	%icc,	0x0
	fxnors	%f17,	%f0,	%f9
	movpos	%xcc,	%l5,	%i7
	rdhpr	%hsys_tick_cmpr,	%o1
	set	0x40, %i4
	prefetcha	[%l7 + %i4] 0x11,	 0x0
	rdpr	%wstate,	%l4
	wr	%g5,	0x098E,	%sys_tick
	rdpr	%wstate,	%i4
	wrpr	%g6,	%g3,	%pil
	movrlez	%i5,	0x2D4,	%o2
	rd	%ccr,	%o4
	umul	%l2,	%i2,	%o7
	flush	%l7 + 0x3C

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fcmpeq32	%f18,	%f28,	%l1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xAB7, 	%sys_tick_cmpr
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	rdhpr	%hsys_tick_cmpr,	%g7
	rd	%ccr,	%i0
	std	%f26,	[%l7 + 0x78]
	wr	%o5,	%g2,	%ccr
	wrpr	%o6,	%o3,	%cwp
	rdhpr	%htba,	%g1
	lduw	[%l7 + 0x14],	%g4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	tsubcctv	%l0,	%l5,	%i7
	fmovdn	%icc,	%f24,	%f8
	wrpr	%l3,	%o1,	%tick
	rdhpr	%hpstate,	%l6
	wr	%l4,	0x1D6F,	%y
	rdpr	%pil,	%i4
	rd	%pc,	%g6
	xnor	%g3,	%g5,	%o2
	fornot1s	%f21,	%f14,	%f26
	fmovsl	%icc,	%f7,	%f1
	rd	%sys_tick_cmpr,	%o4
	bvs,pt	%icc,	loop_468
	rd	%tick_cmpr,	%i5
	movre	%i2,	%l2,	%o7
	ldd	[%l7 + 0x68],	%l0
loop_468:
	wrpr	%i6,	%g7,	%tick
	rdpr	%otherwin,	%i0
	fmovrsne	%i3,	%f10,	%f22
	rd	%pc,	%g2
	wrpr	%o6,	%o5,	%tick
	rdhpr	%htba,	%o3
	stb	%g1,	[%l7 + 0x5B]
	rdhpr	%hpstate,	%o0
	edge16n	%g4,	%l0,	%l5
	wr	%i7,	0x0D06,	%pic
	rdpr	%gl,	%i1
	xnor	%l3,	0x02E3,	%o1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x049, 	%hsys_tick_cmpr
	rdpr	%cwp,	%i4
	rd	%y,	%l4
	wrpr	%g6,	0x180C,	%cwp
	wrpr	%g3,	0x0CC1,	%pil
	rdhpr	%hintp,	%o2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xD24, 	%hsys_tick_cmpr
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xAE4, 	%hsys_tick_cmpr
	sdivx	%l2,	0x16E6,	%i5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xAC1, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x744, 	%tick_cmpr
	fbe	%fcc2,	loop_469
	srlx	%i0,	%i6,	%g2
	rd	%pc,	%o6
	wrpr	%o5,	0x0359,	%tick
loop_469:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%g1,	0x0708,	%cwp
	rdpr	%canrestore,	%o0
	fnands	%f27,	%f31,	%f24

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x182, 	%hsys_tick_cmpr
	fmovsvc	%icc,	%f20,	%f11
	wrpr	%i3,	%l5,	%tick
	edge8	%i7,	%i1,	%l0
	movpos	%xcc,	%l3,	%l6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fbuge,a	%fcc2,	loop_470
	fmovdcs	%icc,	%f11,	%f13
	rdpr	%pil,	%i4
	rd	%ccr,	%l4
loop_470:
	fsrc2s	%f7,	%f1
	tgu	%xcc,	0x1
	set	0x0C, %l6
	ldsha	[%l7 + %l6] 0x15,	%g3
	or	%g6,	%o2,	%o4
	rdhpr	%hintp,	%i2
	rdpr	%wstate,	%g5
	fcmpgt32	%f12,	%f18,	%i5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%y,	%o7
	rdhpr	%hpstate,	%g7
	fmovsvs	%icc,	%f5,	%f2
	rd	%sys_tick_cmpr,	%i6
	bn,a	loop_471
	wr	%o6,	%o5,	%ccr
	movvc	%xcc,	%g1,	%o0
loop_471:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%i3,	0x19EE,	%cwp
	wrpr	%g4,	0x0458,	%pil
	mova	%icc,	%i7,	%i1
	rdpr	%tl,	%l5
	wrpr	%l0,	0x1C29,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x9AB, 	%hsys_tick_cmpr
	rdhpr	%hpstate,	%l3
	wr 	%g0, 	0x4, 	%fprs
	rdpr	%cleanwin,	%l4
	movn	%icc,	%g3,	%i4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fornot2s	%f0,	%f21,	%f18
	fxnors	%f28,	%f2,	%f2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x22D, 	%hsys_tick_cmpr
	rdpr	%cansave,	%i2
	rdhpr	%hsys_tick_cmpr,	%g6
	wr	%g5,	%i5,	%softint
	bneg	loop_472
	edge32	%l2,	%o7,	%g7
	wrpr	%l1,	0x02A5,	%pil
	set	0x08, %g2
	stda	%i0,	[%l7 + %g2] 0xea
	membar	#Sync
loop_472:
	edge32	%g2,	%o6,	%i6
	rd	%pc,	%g1
	pdist	%f10,	%f0,	%f14
	wrpr	%o0,	0x01B0,	%tick
	wrpr	%o3,	%o5,	%pil
	rdhpr	%htba,	%g4
	fmovdleu	%xcc,	%f5,	%f9
	rd	%tick_cmpr,	%i3
	srax	%i1,	%i7,	%l0
	rdpr	%otherwin,	%l5
	umulcc	%l6,	0x1FF6,	%o1
	movle	%xcc,	%l4,	%l3
	rdhpr	%hsys_tick_cmpr,	%i4
	rd	%fprs,	%g3
	rd	%softint,	%o2
	fmul8ulx16	%f22,	%f18,	%f14

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%tick_cmpr,	%g6
	fmovrdlez	%i5,	%f2,	%f16
	rdpr	%canrestore,	%l2
	rd	%softint,	%o7
	mova	%icc,	%g5,	%l1
	fbge	%fcc1,	loop_473
	rd	%tick_cmpr,	%i0
	rdhpr	%htba,	%g2
	fnot2s	%f12,	%f31
loop_473:
	rdhpr	%hintp,	%i6
!Yo - got one - imm_asi 0x40 
!And yo - immediate is 0x358
	set	0x358, %l1
	nop 	! 	nop 	! 	ldxa	[%g0 + %l1] 0x40,	%g1 ripped by fixASI40.pl ripped by fixASI40.pl
	fnegd	%f0,	%f18
	wr	%o6,	%o3,	%softint
	rd	%pc,	%o0
	rdhpr	%htba,	%o5
	rdpr	%canrestore,	%i3
	wr	%g4,	0x0FF1,	%pic
	fcmpeq16	%f8,	%f14,	%i7
	rd	%asi,	%i1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	sdivx	%o1,	0x11E4,	%l4
	wrpr	%l3,	0x030F,	%cwp
	wr 	%g0, 	0x6, 	%fprs
	tle	%xcc,	0x6
	rdpr	%pil,	%o2
	wrpr	%i2,	0x1FE8,	%cwp
	tgu	%icc,	0x0
	fmul8x16al	%f1,	%f7,	%f10
	mova	%icc,	%i5,	%g6
	wr	%o7,	0x192E,	%softint
	rd	%tick_cmpr,	%g5
	rdpr	%tba,	%l1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%pc,	%g2
	for	%f4,	%f4,	%f2
	wrpr	%g7,	0x17E5,	%cwp
	wrpr	%i6,	0x1279,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fmul8x16al	%f14,	%f30,	%f22
	orncc	%o3,	0x101F,	%o6
	ldstub	[%l7 + 0x5D],	%o0
	addc	%i3,	%g4,	%o5
	rd	%ccr,	%i1
	wr	%i7,	%l6,	%sys_tick
	fmovrdlez	%o1,	%f4,	%f18
	wrpr	%l4,	0x0046,	%pil
	andncc	%l0,	%l5,	%l3
	fmul8ulx16	%f2,	%f4,	%f20
	rdhpr	%hintp,	%o2
	wrpr	%i2,	%o4,	%pil
	rdpr	%wstate,	%g3
	rdhpr	%hpstate,	%i4
	umul	%g6,	%o7,	%i5
	rdpr	%tba,	%g5
	rdhpr	%htba,	%l1
	fands	%f28,	%f9,	%f3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x53C, 	%hsys_tick_cmpr
	rd	%tick_cmpr,	%g2
	rd	%fprs,	%g7
	tsubcc	%i0,	0x193C,	%g1
	bleu	%icc,	loop_474
	rdhpr	%hsys_tick_cmpr,	%o0
	rdpr	%pil,	%o6
loop_474:
	tneg	%xcc,	0x4
	wr	%g0,	0x80,	%asi
	ldxa	[%l7 + 0x10] %asi,	%g4
	fands	%f15,	%f3,	%f23
	bleu,a,pn	%xcc,	loop_475
	rd	%y,	%i3
	rdhpr	%hsys_tick_cmpr,	%o5
	fand	%f26,	%f16,	%f18
loop_475:
	tle	%icc,	0x2
	wrpr	%i7,	0x0152,	%cwp
	wr	%i1,	%l6,	%set_softint
	addc	%l4,	0x1A01,	%l0
	xorcc	%l5,	0x1C67,	%l3
	wrpr	%o1,	%o2,	%cwp
	array8	%o4,	%g3,	%i4
	rdpr	%gl,	%g6
	alignaddrl	%i2,	%o7,	%g5
	wrpr	%l1,	0x0A9B,	%tick
	wrpr	%l2,	0x1A7F,	%pil
	wrpr	%i5,	0x1772,	%tick
	rdpr	%cwp,	%g7
	rdpr	%canrestore,	%i0
	fbl	%fcc2,	loop_476
	rdhpr	%hpstate,	%g1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x9EF, 	%hsys_tick_cmpr
	array32	%i6,	%o0,	%o6
loop_476:
	rdhpr	%hsys_tick_cmpr,	%g4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	rd	%fprs,	%i7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	fmovdvs	%icc,	%f10,	%f26
	fbu	%fcc0,	loop_477
	wrpr	%l4,	%l0,	%cwp
	sdivx	%l5,	0x09DB,	%l3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x665, 	%hsys_tick_cmpr
loop_477:
	rdhpr	%htba,	%o4
	edge8ln	%g3,	%o2,	%i4
	tge	%icc,	0x1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x5A7, 	%hsys_tick_cmpr
	sdivx	%g5,	0x146B,	%l1
	wrpr	%l2,	0x01FF,	%tick
	move	%icc,	%o7,	%g7
	srl	%i5,	%g1,	%i0
	rdhpr	%hintp,	%i6
	wrpr	%o0,	0x13B6,	%pil
	rd	%ccr,	%g2
	rdhpr	%htba,	%g4
	rdpr	%gl,	%o3
	membar	#Sync
	set	0x40, %i6
	ldda	[%l7 + %i6] 0x1e,	%f0
	rdpr	%canrestore,	%o6
	udivcc	%i3,	0x0B22,	%o5
	rdpr	%tba,	%i7
	rdhpr	%hsys_tick_cmpr,	%l4
	wrpr	%l0,	0x1364,	%pil
	wrpr	%i1,	%l3,	%pil
	wrpr	%l6,	0x1F24,	%tick
	edge32n	%l5,	%o1,	%o4
	te	%xcc,	0x4
	rdhpr	%htba,	%o2
	fba	%fcc0,	loop_478
	fba	%fcc1,	loop_479
	rdhpr	%hpstate,	%i4
	addc	%i2,	%g3,	%g5
loop_478:
	wr	%l1,	%l2,	%pic
loop_479:
	rd	%fprs,	%g6
	rd	%asi,	%o7
	wr	%i5,	%g7,	%ccr
	rdpr	%tl,	%i0
	fbo,a	%fcc0,	loop_480
	umul	%o0,	0x05B5,	%g2
	edge32n	%i6,	%g4,	%o3
loop_480:
	fba	%fcc3,	loop_481
	wr	%o6,	0x0747,	%pic
	rdhpr	%hintp,	%i3
	rdhpr	%htba,	%i7
loop_481:
	rd	%y,	%o5
	rdhpr	%htba,	%l0
	rdpr	%cwp,	%i1
	rdpr	%tl,	%l4
	sdivx	%l6,	0x1AD3,	%l3
	rdhpr	%hpstate,	%l5
	rd	%fprs,	%o4
	rdpr	%gl,	%o2
	rd	%pc,	%i4
	taddcctv	%o1,	%g3,	%g5
	rdhpr	%hsys_tick_cmpr,	%i2
	rdpr	%cleanwin,	%l1
	ba	loop_482
	move	%xcc,	%o7,	%i5
	tneg	%xcc,	0x0
loop_482:
	orn	%g7,	%l2,	%g1
	rdpr	%tl,	%o0
	rdpr	%wstate,	%g2
	bg,pt	%xcc,	loop_483
	rdpr	%cansave,	%i6
	movcs	%icc,	%i0,	%g4
	rd	%pc,	%o6
loop_483:
	rdhpr	%hsys_tick_cmpr,	%o3
	membar	#Sync
	set	0x40, %o6
	ldda	[%l7 + %o6] 0x17,	%f16
	wrpr	%i3,	0x02B5,	%tick
	swap	[%l7 + 0x18],	%i7
	wr 	%g0, 	0x7, 	%fprs
	rdhpr	%hintp,	%i1
	rd	%fprs,	%l0
	edge32l	%l4,	%l3,	%l5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	rdpr	%tba,	%l6
	wr	%o2,	%i4,	%set_softint
	rdpr	%tba,	%g3
	tsubcc	%o1,	%i2,	%l1
	rd	%y,	%g6
	wr	%o7,	%i5,	%softint
	rdpr	%cwp,	%g5
	udivcc	%l2,	0x0726,	%g7
	mulx	%g1,	%g2,	%o0
	wrpr	%i0,	%i6,	%cwp
	fblg,a	%fcc2,	loop_484
	andcc	%o6,	%g4,	%o3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x09D, 	%hsys_tick_cmpr
	fmovse	%xcc,	%f26,	%f4
loop_484:
	fmovsneg	%xcc,	%f29,	%f11
	rdpr	%otherwin,	%o5
	edge8n	%i1,	%l4,	%l3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%pil,	%o4
	tvs	%icc,	0x5
	rdpr	%otherwin,	%o2
	fmul8ulx16	%f16,	%f4,	%f10
	rdpr	%tba,	%i4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	edge32ln	%l6,	%o1,	%i2
	wrpr	%g6,	%l1,	%cwp
	rd	%softint,	%o7
	wrpr	%g5,	0x095F,	%cwp
	tg	%icc,	0x5
	edge16l	%i5,	%g7,	%g1
	wrpr	%g2,	0x0D6C,	%pil
	rdhpr	%hintp,	%l2
	udivx	%i0,	0x1132,	%i6
	rd	%y,	%o0
	wr	%o6,	0x09B6,	%set_softint

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%htba,	%g4
	rdhpr	%hpstate,	%i3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%o5,	%l3,	%pil
	taddcc	%l4,	0x143C,	%l5
	rdhpr	%htba,	%l0
	alignaddr	%o2,	%i4,	%o4
	tcs	%icc,	0x4
	set	0x3E, %g4
	lduha	[%l7 + %g4] 0x18,	%l6
	rdhpr	%hsys_tick_cmpr,	%g3
	fblg	%fcc2,	loop_485
	wr	%o1,	%g6,	%softint
	rd	%asi,	%i2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_485:
	xnorcc	%g5,	0x18BD,	%g7
	st	%f14,	[%l7 + 0x44]
	brlz,a	%g1,	loop_486
	rd	%y,	%g2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	xnor	%i0,	0x0958,	%o0
loop_486:
	rdpr	%pil,	%i6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x24F, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%hsys_tick_cmpr,	%i3
	fnors	%f12,	%f28,	%f29

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x700, 	%hsys_tick_cmpr
	fmovdgu	%icc,	%f22,	%f17

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	ldsh	[%l7 + 0x2C],	%i1
	ble,a	%xcc,	loop_487
	rdpr	%gl,	%l5
	rdpr	%wstate,	%o2
	movneg	%icc,	%l0,	%o4
loop_487:
	rdhpr	%htba,	%l6
	rdpr	%otherwin,	%g3
	taddcc	%i4,	0x1D06,	%o1
	rdpr	%otherwin,	%g6
	mova	%xcc,	%i2,	%o7
	fmovdcs	%icc,	%f2,	%f8
	movcs	%icc,	%g5,	%g7
	tgu	%icc,	0x0
	wr	%g0,	0x88,	%asi
	ldda	[%l7 + 0x60] %asi,	%l0
	umul	%g2,	%g1,	%i5
	wr	%i0,	0x1616,	%ccr
	edge16l	%l2,	%o0,	%o6
	rdpr	%otherwin,	%g4
	lduw	[%l7 + 0x38],	%i6
	fcmple16	%f4,	%f16,	%o3
	edge32n	%i7,	%i3,	%o5
	rdpr	%cwp,	%l4
	wr 	%g0, 	0x7, 	%fprs
	tle	%icc,	0x0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	movleu	%icc,	%l3,	%o4
	addc	%l0,	%g3,	%o1
	wrpr	%g6,	%i2,	%pil
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	rdhpr	%htba,	%i4
	lduh	[%l7 + 0x36],	%g5
	rdhpr	%hsys_tick_cmpr,	%o7
	fmovdne	%icc,	%f17,	%f30
	move	%icc,	%g7,	%g2
	rdhpr	%hpstate,	%g1
	rdpr	%cleanwin,	%l1
	rd	%asi,	%i0
	rdpr	%cwp,	%l2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xA8A, 	%hsys_tick_cmpr
	taddcc	%g4,	%i6,	%o3
	rdpr	%canrestore,	%i7
	fmovrsne	%o0,	%f28,	%f15

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	srlx	%l4,	0x1B,	%i3
	movvs	%icc,	%i1,	%l5
	wrpr	%l3,	0x1DAD,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	rd	%softint,	%o2
	rdpr	%tba,	%g3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	edge32n	%g6,	%o1,	%i4
	wr	%i2,	%o7,	%set_softint
	rdhpr	%htba,	%g7
	tne	%xcc,	0x1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%tick_cmpr,	%g2
	udivx	%i0,	0x1206,	%l2
	fpsub32	%f28,	%f26,	%f30
	rd	%softint,	%l1
	movleu	%xcc,	%i5,	%o6
	wrpr	%i6,	0x0469,	%tick
	wr	%g4,	0x0B73,	%clear_softint
	rdhpr	%hpstate,	%o3
	stb	%i7,	[%l7 + 0x43]
	addccc	%o5,	0x0F04,	%o0
	rd	%pc,	%l4
	rdpr	%pil,	%i1
	fmovdleu	%xcc,	%f13,	%f30
	rdpr	%gl,	%l5
	rdhpr	%hsys_tick_cmpr,	%l3
	tpos	%xcc,	0x1
	rd	%pc,	%i3
	rdpr	%cansave,	%o4
	rdhpr	%hintp,	%o2
	wr	%g3,	%l0,	%pic
	rd	%asi,	%l6
	rdpr	%cansave,	%o1
	fmovrsne	%g6,	%f0,	%f26
	membar	0x48
	addc	%i2,	0x0A01,	%o7
	rdhpr	%hintp,	%g7
	wrpr	%g5,	0x008D,	%cwp
	rdpr	%wstate,	%i4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%htba,	%g1
	set	0x74, %i2
	ldswa	[%l7 + %i2] 0x14,	%i0
	wr	%l1,	0x1F10,	%pic

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	addccc	%i5,	%g4,	%i6
	rd	%asi,	%i7
	alignaddrl	%o5,	%o0,	%l4
	membar	0x48
	wr	%o3,	%l5,	%clear_softint
	fmovrsgez	%l3,	%f19,	%f8
	set	0x20, %g7
	ldda	[%l7 + %g7] 0xeb,	%i2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x0A5, 	%hsys_tick_cmpr
	mulscc	%o2,	%o4,	%g3
	set	0x44, %o0
	stwa	%l0,	[%l7 + %o0] 0x27
	membar	#Sync
	stbar
	wr 	%g0, 	0x7, 	%fprs

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x7B5, 	%hsys_tick_cmpr
	rdpr	%canrestore,	%i2
	sir	0x05F7
	smulcc	%o7,	%g5,	%i4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x4E4, 	%hsys_tick_cmpr
	movrne	%g1,	%g7,	%i0
	orn	%l1,	0x011A,	%l2
	rd	%fprs,	%i5
	movvc	%xcc,	%g4,	%i6
	rd	%pc,	%i7
	movne	%icc,	%o5,	%o0
	rdhpr	%hintp,	%l4
	rdhpr	%htba,	%o3
	rdhpr	%hsys_tick_cmpr,	%o6
	rdhpr	%htba,	%l3
	tpos	%icc,	0x3
	fmovdne	%icc,	%f8,	%f4
	rd	%sys_tick_cmpr,	%i3
	ldstub	[%l7 + 0x0B],	%i1
	movvc	%icc,	%o2,	%l5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xF88, 	%hsys_tick_cmpr
	or	%o4,	%o1,	%l0
	bshuffle	%f8,	%f20,	%f20
	rdhpr	%hpstate,	%g6
	fbuge	%fcc1,	loop_488
	te	%icc,	0x1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	xnorcc	%o7,	0x16CC,	%g5
loop_488:
	tge	%xcc,	0x2
	popc	%i4,	%g2
	array16	%g1,	%i2,	%g7
	movrgz	%i0,	0x122,	%l1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%g4,	0x0D83,	%cwp
	rdpr	%otherwin,	%l2
	rd	%softint,	%i6
	swap	[%l7 + 0x3C],	%o5
	wrpr	%o0,	%i7,	%tick
	call	loop_489
	and	%o3,	%l4,	%o6
	rd	%asi,	%i3
	wrpr	%i1,	%l3,	%tick
loop_489:
	rd	%tick_cmpr,	%o2
	tneg	%xcc,	0x7
	wrpr	%l5,	0x11C0,	%pil
	rdpr	%wstate,	%g3
	alignaddrl	%o1,	%o4,	%g6
	bl,a,pt	%icc,	loop_490
	rdhpr	%hpstate,	%l6
	rdhpr	%hintp,	%l0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
loop_490:
	wr	%o7,	%i4,	%set_softint
	wr	%g1,	%g2,	%softint
	rd	%sys_tick_cmpr,	%i2
	wr	%i0,	0x01C5,	%sys_tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	tcc	%xcc,	0x7
	movle	%icc,	%g7,	%i5
	orn	%l2,	0x07CA,	%i6
	rdpr	%pil,	%g4
	fba,a	%fcc3,	loop_491
	edge32	%o0,	%o5,	%i7
	rd	%fprs,	%l4
	rd	%tick_cmpr,	%o3
loop_491:
	fmovrsgz	%i3,	%f31,	%f22
	rdpr	%cwp,	%o6
	wr	%i1,	%o2,	%softint
	fxors	%f12,	%f12,	%f7
	fones	%f11
	rd	%tick_cmpr,	%l5
	wrpr	%l3,	0x1DD6,	%cwp
	edge16l	%g3,	%o4,	%g6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	edge32ln	%g5,	%o7,	%l6
	rd	%y,	%i4
	wrpr	%g2,	%g1,	%pil
	wrpr	%i0,	0x1B3C,	%cwp
	rd	%sys_tick_cmpr,	%l1
	wrpr	%i2,	0x17BC,	%tick
	wrpr	%i5,	0x18A3,	%pil
	rd	%y,	%l2
	set	0x40, %i5
	stda	%f0,	[%l7 + %i5] 0x16
	membar	#Sync
	fpsub32s	%f1,	%f5,	%f1
	edge32n	%g7,	%g4,	%o0
	rdpr	%gl,	%i6
	fpack32	%f2,	%f28,	%f10

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	movvc	%xcc,	%l4,	%o3
	rdhpr	%hintp,	%o5
	fnegd	%f24,	%f26
	movrgez	%o6,	%i1,	%i3
	rdhpr	%htba,	%o2
	wr	%l3,	0x0235,	%ccr
	movvs	%icc,	%l5,	%o4
	wrpr	%g6,	0x1F34,	%cwp
	movne	%xcc,	%g3,	%o1
	wr 	%g0, 	0x6, 	%fprs
	fnot2s	%f4,	%f30
	rdhpr	%hpstate,	%o7
	rd	%tick_cmpr,	%g5
	rd	%ccr,	%i4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fble	%fcc3,	loop_492
	fornot2s	%f4,	%f0,	%f16
	wrpr	%i0,	%l1,	%tick
	fbg,a	%fcc1,	loop_493
loop_492:
	popc	%i2,	%i5
	rdhpr	%hpstate,	%g1
	orcc	%l2,	%g4,	%g7
loop_493:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x333, 	%hsys_tick_cmpr
	ldstub	[%l7 + 0x39],	%l4
	umulcc	%i6,	0x0064,	%o5
	fnands	%f23,	%f21,	%f2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%o6,	%o2,	%tick
	rdhpr	%hpstate,	%l3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xD9E, 	%sys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	rdhpr	%hpstate,	%g6
	wrpr	%g3,	%l0,	%cwp
	and	%o7,	0x0000,	%g5
	tneg	%icc,	0x2
	fbul,a	%fcc1,	loop_494
	tneg	%icc,	0x1
	fmul8ulx16	%f16,	%f4,	%f18
	wr	%o1,	%i4,	%clear_softint
loop_494:
	rdpr	%canrestore,	%l6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x6B7, 	%sys_tick_cmpr
	movre	%i2,	0x2C8,	%i5
	rdpr	%pil,	%i0
	wr	%l2,	0x06C9,	%sys_tick
	xnorcc	%g4,	0x0983,	%g7
	rdpr	%cansave,	%o0
	fsrc2s	%f23,	%f13

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%pc,	%i7
	wrpr	%i6,	0x1EF6,	%cwp
	rd	%sys_tick_cmpr,	%l4
	rdhpr	%hsys_tick_cmpr,	%o5
	movrlz	%i1,	%o3,	%o2
	add	%l5,	%l3,	%i3
	rdhpr	%hsys_tick_cmpr,	%g6
	wrpr	%o4,	0x02A8,	%cwp
	fandnot1s	%f18,	%f16,	%f29

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x49D, 	%hsys_tick_cmpr
	rdhpr	%htba,	%o7
	smulcc	%g3,	0x03F2,	%o1
	xnorcc	%i4,	0x1D78,	%l6
	tvc	%icc,	0x0
	edge32ln	%g2,	%l1,	%g5
	tvc	%xcc,	0x1
	ba,pt	%xcc,	loop_495
	rdpr	%wstate,	%i2
	fnegd	%f12,	%f6
	wrpr	%i0,	%l2,	%pil
loop_495:
	wrpr	%i5,	%g7,	%cwp
	subc	%o0,	%g1,	%i7
	edge16n	%i6,	%l4,	%g4
	fabss	%f1,	%f17
	fcmple32	%f20,	%f8,	%o5
	srax	%i1,	%o2,	%o3
	rdhpr	%hpstate,	%o6
	popc	0x0365,	%l3
	bge,pt	%xcc,	loop_496
	rd	%ccr,	%i3
	fbuge,a	%fcc0,	loop_497
	addcc	%l5,	0x0B22,	%o4
loop_496:
	wr	%g6,	0x00A6,	%softint
	xor	%o7,	%g3,	%o1
loop_497:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xF37, 	%hsys_tick_cmpr
	movl	%xcc,	%l0,	%g2
	srlx	%l1,	%g5,	%i2
	rd	%asi,	%i0
	edge8l	%l2,	%i5,	%g7
	wr	%g0,	0x27,	%asi
	stwa	%l6,	[%l7 + 0x14] %asi
	membar	#Sync

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%asi,	%o0
	and	%i6,	0x0F8E,	%i7
	fnand	%f4,	%f26,	%f12
	flush	%l7 + 0x10

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x78A, 	%hsys_tick_cmpr
	fbg	%fcc2,	loop_498
	fmovse	%xcc,	%f27,	%f3
	movneg	%xcc,	%i1,	%o2
	rdpr	%pil,	%o3
loop_498:
	rd	%ccr,	%l4
	mulx	%o6,	%i3,	%l5
	sth	%l3,	[%l7 + 0x78]
	wr	%g6,	0x0BE5,	%clear_softint
	sir	0x0D30

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xD17, 	%hsys_tick_cmpr
	rd	%y,	%o1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xEB3, 	%sys_tick_cmpr
	wrpr	%i4,	0x05BD,	%pil
	wr	%g0,	0x0c,	%asi
	lduha	[%l7 + 0x64] %asi,	%g2
	ldx	[%l7 + 0x28],	%l0
	rd	%fprs,	%g5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%l2,	0x0C46,	%cwp
	wrpr	%i5,	%i0,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x5E4, 	%hsys_tick_cmpr
	wrpr	%o0,	0x0BCE,	%pil
	wrpr	%i6,	0x0EEF,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%htba,	%l6
	rdhpr	%htba,	%g4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	tle	%icc,	0x4
	rdpr	%otherwin,	%o2
	bcs	loop_499
	smulcc	%l4,	0x1AEC,	%o3
	tsubcctv	%o6,	0x0445,	%l5
	rd	%pc,	%i3
loop_499:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x89D, 	%hsys_tick_cmpr
	edge8l	%g6,	%o1,	%o7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x628, 	%hsys_tick_cmpr
	xorcc	%g2,	0x07D8,	%g5
	movne	%xcc,	%i2,	%l1
	andn	%l0,	0x1FEC,	%l2
	tcc	%xcc,	0x2
	sir	0x08C4
	rdhpr	%hintp,	%i0
	rdhpr	%hintp,	%i5
	wrpr	%g7,	%g1,	%pil
	wrpr	%o0,	0x0809,	%tick
	rd	%asi,	%i6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%i1,	0x1AAC,	%pil
	wrpr	%g4,	%o5,	%tick
	tl	%xcc,	0x6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x588, 	%hsys_tick_cmpr
	rdhpr	%hsys_tick_cmpr,	%o3
	fmovdgu	%xcc,	%f21,	%f29
	flushw

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xCA0, 	%hsys_tick_cmpr
	movrlz	%l5,	%i3,	%o4
	rdpr	%otherwin,	%l3
	rdhpr	%hpstate,	%o1
	array16	%o7,	%g6,	%i4
	subccc	%g3,	0x090D,	%g2
	rdhpr	%hsys_tick_cmpr,	%g5
	fbul	%fcc1,	loop_500
	wrpr	%i2,	%l0,	%tick
	fble	%fcc0,	loop_501
	brgz	%l2,	loop_502
loop_500:
	wr	%l1,	%i0,	%ccr
loop_501:
	call	loop_503
loop_502:
	rdhpr	%htba,	%g1
	rdpr	%cwp,	%o0
	edge32n	%g7,	%i7,	%l6
loop_503:
	xorcc	%i1,	%i6,	%o5
	fbuge,a	%fcc2,	loop_504
	wr 	%g0, 	0x7, 	%fprs
	rdhpr	%hintp,	%o3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_504:
	fpsub32	%f10,	%f24,	%f16
	rdhpr	%htba,	%l5
	movrgez	%o6,	0x15B,	%o4
	movge	%xcc,	%i3,	%o1
	movg	%icc,	%l3,	%o7
	fand	%f28,	%f20,	%f14
	ldsb	[%l7 + 0x77],	%i4
	movpos	%xcc,	%g6,	%g2
	rdhpr	%htba,	%g3
	wr	%g5,	0x0B6E,	%pic

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fpack16	%f8,	%f5
	rdhpr	%hintp,	%i2
	rdpr	%otherwin,	%l1
	fornot2s	%f2,	%f18,	%f18
	edge32n	%i0,	%l2,	%i5
	rdpr	%tl,	%g1
	fsrc1	%f0,	%f24
	andncc	%g7,	%i7,	%l6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x3A5, 	%hsys_tick_cmpr
	movn	%icc,	%i1,	%o5
	fblg	%fcc3,	loop_505
	tcc	%xcc,	0x1
	wrpr	%i6,	0x06F4,	%tick
	addc	%l4,	%o3,	%g4
loop_505:
	rd	%asi,	%o2
	wrpr	%l5,	%o4,	%tick
	prefetch	[%l7 + 0x18],	 0x1
	rdpr	%tl,	%i3
	wrpr	%o1,	0x1340,	%cwp
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmpeq32	%f24,	%f30,	%l3
	rdhpr	%hsys_tick_cmpr,	%o7
	sir	0x0A40

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x0FE, 	%hsys_tick_cmpr
	rdhpr	%hintp,	%i4
	rdpr	%pil,	%g2
	rdhpr	%htba,	%g5
	rdpr	%canrestore,	%l0
	move	%xcc,	%i2,	%l1
	wrpr	%i0,	0x1457,	%pil
	rd	%sys_tick_cmpr,	%i5
	stb	%g1,	[%l7 + 0x31]
	fmul8x16au	%f17,	%f8,	%f14
	wrpr	%g7,	%i7,	%cwp
	umulcc	%l2,	0x0B3D,	%l6
	srax	%o0,	0x01,	%o5
	rdpr	%pil,	%i6
	wrpr	%l4,	%i1,	%pil
	rd	%tick_cmpr,	%o3
	fmovrsne	%g4,	%f13,	%f5
	wrpr	%o2,	0x04B3,	%tick
	fmovsa	%icc,	%f18,	%f11
	rd	%sys_tick_cmpr,	%l5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x8A4, 	%tick_cmpr
	wr	%l3,	%o1,	%y
	wrpr	%o7,	0x0BE7,	%pil
	or	%o6,	%g6,	%i4
	rd	%y,	%g3
	wrpr	%g2,	0x1AF7,	%pil
	andncc	%l0,	%g5,	%l1
	rdhpr	%hpstate,	%i2
	and	%i5,	0x146E,	%g1
	rd	%ccr,	%i0
	rd	%y,	%i7
	wrpr	%g7,	%l6,	%cwp
	rdhpr	%htba,	%l2
	fbule,a	%fcc1,	loop_506
	move	%icc,	%o0,	%o5
	wrpr	%i6,	%l4,	%cwp
	wrpr	%o3,	0x17FC,	%pil
loop_506:
	fmovdle	%icc,	%f31,	%f7
	edge16	%g4,	%i1,	%o2
	wr	%l5,	%o4,	%clear_softint
	movl	%icc,	%i3,	%l3
	wr	%o1,	0x0AA6,	%set_softint
	bvc,pn	%xcc,	loop_507
	rdpr	%cansave,	%o7
	rdpr	%canrestore,	%o6
	fcmpne32	%f0,	%f8,	%i4
loop_507:
	rdpr	%pil,	%g3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x230, 	%tick_cmpr
	rd	%softint,	%l0
	edge8n	%g5,	%i2,	%l1
	wr	%i5,	0x15A1,	%y
	edge16n	%g1,	%i7,	%g7
	addcc	%i0,	%l6,	%l2
	udiv	%o0,	0x0466,	%i6
	xnorcc	%o5,	%l4,	%g4
	rdhpr	%htba,	%i1
	wrpr	%o3,	%o2,	%tick
	wr	%o4,	%l5,	%set_softint
	fmovsvc	%icc,	%f20,	%f6
	edge8n	%l3,	%o1,	%o7
	rdhpr	%hpstate,	%o6
	wr	%i4,	0x0A4D,	%set_softint
	mulscc	%g3,	0x046B,	%i3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	sub	%l0,	0x0384,	%i2
	wrpr	%l1,	%g5,	%cwp
	edge16	%g1,	%i7,	%g7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%g0,	0x11,	%asi
	sta	%f17,	[%l7 + 0x6C] %asi
	wrpr	%l6,	0x159F,	%pil
	rd	%y,	%i5
	rdhpr	%hpstate,	%l2
	rd	%ccr,	%o0
	andn	%i6,	0x11DF,	%o5
	wrpr	%g4,	0x12DF,	%tick
	rdhpr	%hsys_tick_cmpr,	%i1
	ldsb	[%l7 + 0x18],	%l4
	rdhpr	%hpstate,	%o3
	flush	%l7 + 0x40
	rdpr	%otherwin,	%o2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x47A, 	%tick_cmpr
	sub	%l3,	%o1,	%l5
	rd	%pc,	%o6
	rdhpr	%hintp,	%i4
	rd	%tick_cmpr,	%g3
	fnot2	%f22,	%f20
	movg	%icc,	%o7,	%i3
	xorcc	%g6,	0x08E1,	%l0
	andn	%g2,	0x1FDB,	%l1
	rd	%ccr,	%g5
	rd	%asi,	%g1
	tsubcctv	%i7,	0x051E,	%g7
	rdhpr	%hintp,	%i2
	wrpr	%l6,	%i5,	%cwp
	membar	0x5F
	rdpr	%cansave,	%l2
	movcs	%icc,	%i0,	%o0
	rd	%pc,	%o5
	rdpr	%tba,	%g4
	sllx	%i6,	%l4,	%i1
	rdhpr	%hsys_tick_cmpr,	%o3
	rd	%pc,	%o4
	udivx	%l3,	0x0FB6,	%o1
	rdhpr	%hintp,	%o2
	fmuld8sux16	%f16,	%f9,	%f20
	wr 	%g0, 	0x6, 	%fprs
	tsubcctv	%g3,	%o7,	%i3
	sub	%g6,	%l0,	%i4
	rdhpr	%hsys_tick_cmpr,	%l1
	wrpr	%g2,	0x0C66,	%pil
	wrpr	%g5,	%i7,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x305, 	%hsys_tick_cmpr
	rdhpr	%htba,	%l6
	fornot1s	%f31,	%f6,	%f18

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xA96, 	%hsys_tick_cmpr
	wrpr	%g1,	0x008D,	%pil
	fxnor	%f16,	%f30,	%f14
	nop
	setx	loop_508,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	rd	%y,	%i0
	wrpr	%o0,	%l2,	%pil
	bvc	%xcc,	loop_509
loop_508:
	srlx	%o5,	0x1F,	%g4
	rdpr	%gl,	%l4
	wrpr	%i1,	%o3,	%cwp
loop_509:
	rd	%asi,	%i6
	wrpr	%l3,	0x18E0,	%cwp
	wr	%o1,	0x0317,	%ccr
	wrpr	%o4,	%o6,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x4F2, 	%hsys_tick_cmpr
	wrpr	%l5,	%o7,	%pil
	rd	%asi,	%i3
	popc	0x0822,	%g6
	fmovsl	%icc,	%f24,	%f1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	movre	%g2,	%g5,	%i7
	tne	%xcc,	0x0
	ldd	[%l7 + 0x68],	%f0
	wr	%l1,	0x12E3,	%set_softint
	wrpr	%g7,	0x12F6,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%i2,	%g1,	%pil
	wr	%i0,	%o0,	%ccr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x98A, 	%hsys_tick_cmpr
	andncc	%g4,	%l4,	%l2
	fmovspos	%icc,	%f28,	%f8
	rdhpr	%hintp,	%i1
	rd	%sys_tick_cmpr,	%o3
	rd	%softint,	%l3
	ldstub	[%l7 + 0x0F],	%i6
	udivx	%o4,	0x0374,	%o1
	set	0x50, %l3
	ldxa	[%l7 + %l3] 0x11,	%o2
	mulscc	%g3,	0x07A3,	%l5
	fbule	%fcc0,	loop_510
	wr	%o7,	0x1E8C,	%softint
	te	%xcc,	0x1
	fmovrde	%o6,	%f28,	%f16
loop_510:
	rdhpr	%htba,	%i3
	brgez	%g6,	loop_511
	movpos	%xcc,	%i4,	%g2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_511:
	rdhpr	%hintp,	%i7
	wrpr	%l6,	%i2,	%tick
	rd	%y,	%i5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xBD4, 	%hsys_tick_cmpr
	tsubcc	%l4,	0x1814,	%o5
	wrpr	%l2,	0x1937,	%tick
	srlx	%i1,	%l3,	%i6
	rdhpr	%hintp,	%o4
	ldd	[%l7 + 0x58],	%o0
	rdhpr	%hintp,	%o3
	subccc	%g3,	0x1B25,	%l5
	tg	%xcc,	0x6
	addccc	%o2,	%o6,	%i3
	wrpr	%o7,	0x1C51,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x574, 	%hsys_tick_cmpr
	fsrc2s	%f19,	%f13
	set	0x10, %l4
	ldsha	[%l7 + %l4] 0x89,	%l0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xE31, 	%hsys_tick_cmpr
	tvc	%icc,	0x1
	wrpr	%g5,	0x1FDF,	%pil
	rdhpr	%htba,	%g7
	movleu	%xcc,	%l1,	%i7
	rdhpr	%hsys_tick_cmpr,	%l6
	edge16l	%i2,	%g1,	%i5
	bpos	%xcc,	loop_512
	movrlez	%i0,	0x013,	%g4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%o5,	%l2,	%y
loop_512:
	fmovscs	%icc,	%f18,	%f19
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wrpr	%i1,	0x123A,	%cwp
	orcc	%l3,	%i6,	%l4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	and	%o1,	0x0221,	%o3
	rdpr	%cwp,	%g3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%wstate,	%o6
	movcs	%xcc,	%i3,	%l5
	tleu	%xcc,	0x7
	membar	0x5E
	rdhpr	%hsys_tick_cmpr,	%o7
	wrpr	%i4,	0x0338,	%pil
	fmovsvc	%xcc,	%f15,	%f22
	wr	%l0,	%g2,	%set_softint
	movrlz	%g6,	%g5,	%l1
	movg	%icc,	%i7,	%g7
	alignaddr	%i2,	%g1,	%l6
	rdpr	%otherwin,	%i5
	wrpr	%g4,	%i0,	%pil
	wr 	%g0, 	0x7, 	%fprs
	bcs,a,pt	%xcc,	loop_513
	fand	%f14,	%f2,	%f16
	wr	%l2,	0x194C,	%y

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x34D, 	%hsys_tick_cmpr
loop_513:
	rd	%pc,	%l3
	fmovsvc	%xcc,	%f31,	%f7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%pil,	%l4
	xor	%o4,	0x0E91,	%o1
	xor	%o3,	%g3,	%o6
	rdhpr	%htba,	%o2
	rdhpr	%htba,	%i3
	rdpr	%cwp,	%l5
	fornot2s	%f30,	%f3,	%f12
	wr	%o7,	%i4,	%clear_softint
	tge	%icc,	0x7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x221, 	%hsys_tick_cmpr
	rdpr	%cansave,	%g6
	set	0x30, %o7
	stha	%g5,	[%l7 + %o7] 0x88
	wrpr	%l1,	%i7,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	srl	%g1,	0x1D,	%l6
	rdhpr	%hpstate,	%g7
	tleu	%icc,	0x6
	tvc	%icc,	0x2
	array16	%i5,	%g4,	%o0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	movle	%xcc,	%i1,	%i0
	fmovdle	%xcc,	%f5,	%f9
	tle	%xcc,	0x3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fnot2s	%f25,	%f13
	fxnor	%f28,	%f4,	%f16
	wrpr	%i6,	0x145F,	%cwp
	edge16l	%o5,	%l4,	%o4
	wrpr	%o3,	%o1,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%ccr,	%o6
	rd	%tick_cmpr,	%l5
	fmovscc	%xcc,	%f31,	%f16
	rdhpr	%htba,	%i3
	wrpr	%i4,	%o7,	%cwp
	rd	%asi,	%g6
	fpsub32s	%f2,	%f11,	%f26

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x90A, 	%hsys_tick_cmpr
	fbug	%fcc3,	loop_514
	wr	%l0,	0x1BC1,	%sys_tick
	andn	%i7,	0x04A9,	%l1
	fmovscs	%icc,	%f17,	%f15
loop_514:
	movrne	%i2,	0x088,	%g1
	wr	%g2,	%g7,	%softint
	rdhpr	%htba,	%l6
	wr	%i5,	%o0,	%sys_tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%l2,	%i1,	%tick
	rd	%sys_tick_cmpr,	%l3
	sethi	0x1DDE,	%i6
	sra	%i0,	%o5,	%o4
	rdhpr	%hintp,	%g3
	subc	%l4,	0x0F09,	%o6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	alignaddrl	%l5,	%i3,	%o7
	wr	%g6,	%g5,	%set_softint
	rdhpr	%hpstate,	%i4
	rdhpr	%hpstate,	%l0
	wr	%i7,	0x04BA,	%ccr
	rd	%fprs,	%l1
	set	0x08, %l2
	stxa	%i2,	[%l7 + %l2] 0x18
	sllx	%g1,	0x1F,	%g2
	xor	%l6,	0x1888,	%i5
	rdpr	%tl,	%o0
	fmovrdgz	%g7,	%f24,	%f30
	rdhpr	%hpstate,	%g4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xEEB, 	%hsys_tick_cmpr
	smul	%l3,	%i6,	%l2
	rdpr	%cleanwin,	%o5
	srlx	%o4,	%o3,	%i0
	wr	%g3,	%o1,	%set_softint
	rdhpr	%hpstate,	%l4
	te	%icc,	0x6
	udiv	%o6,	0x09CC,	%l5
	wr	%o2,	%o7,	%set_softint
	rdhpr	%hpstate,	%i3
	brnz	%g5,	loop_515
	fblg	%fcc3,	loop_516
	fmovsg	%xcc,	%f18,	%f27
	move	%icc,	%i4,	%l0
loop_515:
	fcmpgt32	%f0,	%f6,	%i7
loop_516:
	rd	%ccr,	%l1
	tge	%icc,	0x0
	wrpr	%g6,	0x11B8,	%tick
	rd	%asi,	%i2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xD79, 	%sys_tick_cmpr
	movle	%xcc,	%i5,	%g2
	ba,pt	%icc,	loop_517
	rd	%fprs,	%o0
	wr	%g4,	%g7,	%softint
	or	%i1,	0x07D1,	%l3
loop_517:
	taddcc	%i6,	0x1366,	%o5
	rd	%asi,	%l2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%g0,	0x80,	%asi
	stda	%i0,	[%l7 + 0x08] %asi
	array16	%o6,	%l5,	%o2
	wr	%o7,	%l4,	%y
	wr	%g5,	%i3,	%pic
	fxor	%f0,	%f22,	%f30
	sdiv	%i7,	0x1283,	%g6
	wrpr	%l1,	0x0110,	%cwp
	tg	%xcc,	0x2
	rdpr	%cansave,	%i2
	rdpr	%otherwin,	%l6
	rdhpr	%hintp,	%i5
	fmovdn	%xcc,	%f27,	%f14
	fbg,a	%fcc3,	loop_518
	mulx	%g1,	%o0,	%g2
	rdpr	%pil,	%g4
	tvs	%icc,	0x2
loop_518:
	rdhpr	%hpstate,	%g7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%wstate,	%i1
	fandnot1s	%f22,	%f13,	%f19
	movl	%icc,	%l2,	%o5
	wrpr	%o4,	%g3,	%cwp
	wr	%o3,	0x0042,	%sys_tick
	wrpr	%o1,	%i0,	%tick
	wrpr	%o6,	%l5,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	std	%o6,	[%l7 + 0x48]
	fba,a	%fcc0,	loop_519
	rdpr	%cwp,	%i3
	rd	%fprs,	%i4
	mulx	%l0,	0x1466,	%g5
loop_519:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xA4E, 	%hsys_tick_cmpr
	wrpr	%i2,	0x0E28,	%cwp
	add	%l7,	0x3C,	%l6
	wr	%g0,	0x0c,	%asi
	casa	[%l6] %asi,	%l6,	%l1
	st	%f7,	[%l7 + 0x74]

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%softint,	%g2
	rd	%tick_cmpr,	%g4
	bneg,a,pt	%xcc,	loop_520
	rdhpr	%hsys_tick_cmpr,	%g7
	fnands	%f12,	%f5,	%f16
	wrpr	%i5,	%l3,	%cwp
loop_520:
	ldd	[%l7 + 0x08],	%f14

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x07A, 	%hsys_tick_cmpr
	popc	%l2,	%i1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x18F, 	%hsys_tick_cmpr
	fbo	%fcc2,	loop_521
	ble,pt	%xcc,	loop_522
	fmovsn	%xcc,	%f13,	%f11
	rdhpr	%hsys_tick_cmpr,	%o3
loop_521:
	tcc	%xcc,	0x3
loop_522:
	rdhpr	%hsys_tick_cmpr,	%o1
	movrne	%g3,	%o6,	%l5
	fbl,a	%fcc3,	loop_523
	nop
	setx	loop_524,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movne	%xcc,	%i0,	%o2
loop_523:
	wrpr	%i3,	0x15A5,	%pil
loop_524:
	bcc,pt	%xcc,	loop_525
	wrpr	%o7,	0x070F,	%pil
	wr	%l0,	0x08D2,	%set_softint
	wrpr	%g5,	%g6,	%tick
loop_525:
	fpadd16	%f4,	%f24,	%f16
	wrpr	%i4,	%i2,	%cwp
	rdhpr	%htba,	%i7
	rd	%y,	%l6
	edge16n	%l1,	%g1,	%o0
	rdhpr	%hintp,	%g2
	movge	%xcc,	%g4,	%i5
	alignaddr	%l3,	%i6,	%l2
	edge16n	%g7,	%i1,	%o4
	membar	0x14
	fmovrde	%o5,	%f12,	%f8
	rd	%tick_cmpr,	%o3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fmovrsgez	%l5,	%f15,	%f6
	rdhpr	%hpstate,	%g3
	rd	%y,	%i0
	fcmpeq32	%f22,	%f14,	%l4
	tgu	%xcc,	0x2
	xnorcc	%o2,	0x0820,	%i3
	rdhpr	%hintp,	%o7
	tne	%xcc,	0x3
	rdhpr	%htba,	%l0
	wr	%g0,	0x17,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
	wrpr	%g5,	0x1AF6,	%tick
	set	0x45, %g6
	lduba	[%l7 + %g6] 0x15,	%i4
	fmovsneg	%xcc,	%f26,	%f13
	movre	%i2,	0x1F0,	%i7
	tleu	%xcc,	0x7
	rdhpr	%htba,	%g6
	tg	%icc,	0x4
	fpmerge	%f17,	%f29,	%f10
	rdpr	%cleanwin,	%l6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	tn	%xcc,	0x6
	sethi	0x157C,	%g2
	wr	%g1,	0x04C2,	%set_softint
	movrlez	%g4,	0x296,	%l3
	wr 	%g0, 	0x4, 	%fprs
	andcc	%g7,	0x0BE0,	%i1
	udivx	%o4,	0x11DE,	%l2
	or	%o3,	%o5,	%o6
	fcmpgt16	%f4,	%f24,	%l5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xB28, 	%hsys_tick_cmpr
	wr	%i0,	%l4,	%pic
	wrpr	%o2,	0x0B0E,	%cwp
	rdpr	%cwp,	%o1
	wrpr	%o7,	0x0BB8,	%cwp
	wrpr	%i3,	%g5,	%pil
	wr 	%g0, 	0x5, 	%fprs

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	lduw	[%l7 + 0x08],	%i7
	rdhpr	%hintp,	%i4
	sllx	%l6,	%l1,	%g6
	movrlez	%o0,	0x27C,	%g2
	rd	%ccr,	%g4
	te	%icc,	0x4
	rdpr	%cleanwin,	%l3
	edge8n	%i5,	%g1,	%g7
	fpackfix	%f22,	%f0
	rdpr	%cwp,	%i1
	wr	%o4,	%i6,	%pic
	wrpr	%l2,	0x0847,	%tick
	rd	%y,	%o5
	rdpr	%canrestore,	%o3
	alignaddrl	%o6,	%g3,	%i0
	wrpr	%l4,	%l5,	%cwp
	fbg,a	%fcc3,	loop_526
	wr	%o2,	0x09BC,	%softint
	wr	%o7,	%o1,	%sys_tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xFFC, 	%hsys_tick_cmpr
loop_526:
	fmovdge	%icc,	%f23,	%f13
	wrpr	%l0,	%g5,	%tick
	fnors	%f26,	%f8,	%f20
	fcmpeq32	%f0,	%f6,	%i7
	tsubcc	%i4,	%i2,	%l6
	rdpr	%canrestore,	%l1
	tleu	%xcc,	0x5
	wr	%g0,	0x27,	%asi
	stha	%o0,	[%l7 + 0x4E] %asi
	membar	#Sync
	mova	%xcc,	%g6,	%g2
	tle	%xcc,	0x0
	sllx	%l3,	%i5,	%g1
	fmovs	%f3,	%f13
	rd	%softint,	%g7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fnot1s	%f4,	%f13
	xorcc	%i1,	0x0F97,	%o4
	rdpr	%gl,	%i6
	rdhpr	%hpstate,	%l2
	fmovdvs	%xcc,	%f18,	%f19
	wr	%o3,	%o6,	%clear_softint
	rdpr	%pil,	%o5
	wrpr	%g3,	0x1CE7,	%pil
	rdpr	%otherwin,	%l4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xAB4, 	%hsys_tick_cmpr
	wr	%o7,	%i0,	%softint

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xC51, 	%hsys_tick_cmpr
	fornot1s	%f12,	%f18,	%f15
	wrpr	%i3,	0x17A7,	%cwp
	wrpr	%g5,	%l0,	%tick
	bshuffle	%f12,	%f0,	%f22
	fmul8x16al	%f3,	%f24,	%f0
	edge32ln	%i4,	%i7,	%l6
	rdpr	%wstate,	%l1
	andcc	%o0,	%i2,	%g2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x598, 	%hsys_tick_cmpr
	rdhpr	%hpstate,	%g6
	rdhpr	%hsys_tick_cmpr,	%g1
	te	%icc,	0x1
	rdhpr	%hpstate,	%g7
	rdpr	%cansave,	%g4
	udivcc	%i1,	0x075C,	%o4
	srl	%i6,	0x14,	%l2
	bneg	%icc,	loop_527
	wrpr	%o3,	0x1F86,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xD13, 	%hsys_tick_cmpr
loop_527:
	bvs,pt	%xcc,	loop_528
	tvc	%xcc,	0x3
	rd	%ccr,	%l4
	tneg	%icc,	0x7
loop_528:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fpsub16s	%f27,	%f20,	%f14
	movle	%xcc,	%o2,	%i0
	rd	%asi,	%o7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	movg	%icc,	%g5,	%i3
	rdhpr	%hintp,	%i4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%htba,	%l1
	wr	%o0,	0x1A56,	%pic
	wrpr	%l6,	%g2,	%pil
	or	%l3,	0x0200,	%i2
	wrpr	%g6,	%g1,	%pil
	fcmpd	%fcc1,	%f24,	%f22
	tvs	%icc,	0x4
	rdhpr	%hsys_tick_cmpr,	%g7
	ble,a	%icc,	loop_529
	rdhpr	%htba,	%i1
	rdpr	%canrestore,	%g4
	udivx	%i6,	0x0EED,	%l2
loop_529:
	array32	%o4,	%o3,	%o6
	movge	%xcc,	%i5,	%g3
	rdpr	%cleanwin,	%l4
	brgez	%o5,	loop_530
	bpos,a,pt	%icc,	loop_531
	tcs	%xcc,	0x7
	movneg	%icc,	%l5,	%o2
loop_530:
	rdhpr	%hpstate,	%i0
loop_531:
	rdpr	%cansave,	%o7
	wr 	%g0, 	0x7, 	%fprs

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	set	0x1C, %o4
	lduwa	[%l7 + %o4] 0x88,	%l0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	smul	%o0,	0x1BEA,	%g2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpsub32	%f22,	%f14,	%f0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%pc,	%g7
	rd	%y,	%i1
	rdhpr	%hsys_tick_cmpr,	%i2
	rdhpr	%hsys_tick_cmpr,	%i6
	rdhpr	%hintp,	%l2
	movne	%xcc,	%g4,	%o3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%hpstate,	%i5
	wr	%o6,	0x1F94,	%ccr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x6C8, 	%hsys_tick_cmpr
	rd	%ccr,	%o5
	movvs	%xcc,	%o2,	%l5
	rdhpr	%htba,	%i0
	wrpr	%g5,	%i3,	%tick
	rd	%ccr,	%i4
	fand	%f30,	%f28,	%f26
	subcc	%o7,	0x1CE6,	%l0
	wrpr	%o1,	0x1D0E,	%tick
	ldsh	[%l7 + 0x28],	%i7
	rdpr	%cansave,	%o0
	tneg	%xcc,	0x5
	edge16l	%l1,	%g2,	%l6
	fcmpne32	%f2,	%f18,	%l3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x3F8, 	%hsys_tick_cmpr
	fmovdge	%xcc,	%f3,	%f31
	alignaddrl	%g6,	%i1,	%i6
	movg	%icc,	%i2,	%g4
	wrpr	%l2,	0x047B,	%tick
	rdpr	%cansave,	%o4
	movrgz	%o3,	%i5,	%g3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xFD5, 	%hsys_tick_cmpr
	rdpr	%cansave,	%o5
	taddcc	%o2,	%l5,	%i0
	rdpr	%gl,	%o6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xCAA, 	%hsys_tick_cmpr
	rd	%y,	%o7
	bcs,a,pn	%xcc,	loop_532
	wrpr	%i4,	0x0BEB,	%cwp
	fmovdge	%icc,	%f0,	%f19
	wrpr	%o1,	0x1CEB,	%tick
loop_532:
	rdpr	%cansave,	%l0
	fble	%fcc0,	loop_533
	fbu	%fcc3,	loop_534
	rdpr	%tba,	%i7
	rd	%y,	%l1
loop_533:
	wrpr	%o0,	%l6,	%tick
loop_534:
	rdpr	%gl,	%g2
	rd	%fprs,	%g1
	movge	%xcc,	%g7,	%l3
	wrpr	%i1,	%i6,	%cwp
	fmul8x16	%f11,	%f4,	%f0
	std	%i2,	[%l7 + 0x08]
	rdpr	%gl,	%g4
	move	%icc,	%l2,	%g6
	rd	%y,	%o4
	rdpr	%tl,	%o3
	rdhpr	%htba,	%g3
	edge32	%i5,	%l4,	%o2
	rdpr	%otherwin,	%o5
	wrpr	%l5,	0x18C1,	%tick
	tcc	%icc,	0x3
	subcc	%o6,	0x1127,	%g5
	wr	%i3,	%i0,	%clear_softint
	andncc	%i4,	%o1,	%l0
	wrpr	%i7,	%l1,	%tick
	array32	%o0,	%o7,	%g2
	fcmpgt32	%f18,	%f22,	%g1
	rdhpr	%hpstate,	%l6
	fcmps	%fcc2,	%f11,	%f5
	srl	%l3,	0x19,	%g7
	rd	%pc,	%i1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	set	0x5C, %i1
	ldsha	[%l7 + %i1] 0x89,	%i6
	wrpr	%g4,	%g6,	%pil
	wr	%l2,	%o4,	%softint
	rdhpr	%hsys_tick_cmpr,	%o3
	rd	%sys_tick_cmpr,	%i5
	set	0x40, %g5
	stda	%f0,	[%l7 + %g5] 0x04
	ldstub	[%l7 + 0x1A],	%l4
	fpsub16	%f2,	%f24,	%f12
	set	0x40, %o2
	ldda	[%l7 + %o2] 0x10,	%f16
	rdhpr	%hintp,	%o2
	movcs	%xcc,	%l5,	%o5
	wr	%g5,	%o6,	%ccr
	bg,a	loop_535
	fblg,a	%fcc1,	loop_536
	rdhpr	%hintp,	%i0
	movcc	%icc,	%i3,	%o1
loop_535:
	rdhpr	%hsys_tick_cmpr,	%l0
loop_536:
	movneg	%icc,	%i4,	%l1
	popc	0x0E42,	%i7
	fbule,a	%fcc2,	loop_537
	rdhpr	%hsys_tick_cmpr,	%o7
	tle	%xcc,	0x7
	rdhpr	%hpstate,	%g2
loop_537:
	or	%g1,	0x1757,	%o0
	fmovsne	%icc,	%f23,	%f28

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xEFB, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xC50, 	%tick_cmpr
	wr	%g0,	0x10,	%asi
	lda	[%l7 + 0x24] %asi,	%f1
	rdhpr	%hsys_tick_cmpr,	%i2
	addcc	%i1,	0x0250,	%g4
	tcc	%icc,	0x0
	rdpr	%tba,	%i6
	rdhpr	%htba,	%g6
	fmovdn	%icc,	%f19,	%f22
	fandnot2	%f6,	%f0,	%f20
	rd	%fprs,	%o4
	set	0x65, %o5
	ldsba	[%l7 + %o5] 0x80,	%l2
	fmovrslez	%i5,	%f4,	%f14
	fpsub16	%f26,	%f4,	%f30
	subccc	%o3,	0x1386,	%g3
	fnands	%f29,	%f13,	%f31
	rdpr	%tba,	%l4
	rdhpr	%hpstate,	%l5
	movle	%xcc,	%o5,	%o2
	tle	%xcc,	0x2
	rdhpr	%htba,	%g5
	sllx	%o6,	0x1F,	%i0
	set	0x20, %i7
	prefetcha	[%l7 + %i7] 0x19,	 0x1
	fand	%f26,	%f4,	%f2
	movvc	%icc,	%l0,	%i4
	fpack16	%f12,	%f30
	rd	%sys_tick_cmpr,	%o1
	sir	0x04E8
	rd	%y,	%i7
	rdhpr	%hintp,	%l1
	rdhpr	%htba,	%o7
	movg	%icc,	%g2,	%g1
	wrpr	%o0,	%l6,	%cwp
	rdhpr	%hsys_tick_cmpr,	%g7
	movl	%icc,	%i2,	%l3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x2DA, 	%hsys_tick_cmpr
	wr	%g6,	0x070C,	%clear_softint
	rd	%asi,	%o4
	rdpr	%cwp,	%i6
	fpsub16s	%f12,	%f18,	%f29
	wr	%i5,	%l2,	%y
	sdivx	%o3,	0x14C5,	%g3
	fornot2	%f18,	%f4,	%f24
	rdpr	%otherwin,	%l4
	edge32n	%o5,	%l5,	%g5
	rdpr	%canrestore,	%o2
	wrpr	%i0,	0x1112,	%tick
	rdhpr	%hintp,	%o6
	edge8ln	%l0,	%i4,	%i3
	te	%icc,	0x0
	wr	%i7,	0x1F27,	%clear_softint
	movneg	%icc,	%l1,	%o1
	rd	%softint,	%g2
	fmovrsgez	%g1,	%f30,	%f6
	array16	%o7,	%l6,	%g7
	membar	0x39
	wrpr	%i2,	%o0,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	movne	%xcc,	%i1,	%g4
	wr	%o4,	0x1695,	%clear_softint

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xFD1, 	%hsys_tick_cmpr
	fble	%fcc2,	loop_538
	wrpr	%l2,	%g6,	%cwp
	wr	%g3,	%l4,	%pic
	stw	%o5,	[%l7 + 0x54]
loop_538:
	sra	%o3,	%g5,	%l5
	rdpr	%pil,	%i0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	umul	%o2,	%l0,	%o6
	movge	%xcc,	%i3,	%i4
	wrpr	%i7,	0x0E9A,	%cwp
	wrpr	%l1,	0x1AEC,	%cwp
	edge8l	%o1,	%g1,	%g2
	tn	%icc,	0x0
	rdpr	%gl,	%l6
	rdpr	%pil,	%o7
	andn	%i2,	%g7,	%o0
	rdpr	%pil,	%l3
	wrpr	%i1,	0x1684,	%pil
	sllx	%o4,	0x1E,	%g4
	array16	%i6,	%l2,	%g6
	fmul8x16al	%f24,	%f22,	%f10
	rdhpr	%hpstate,	%i5
	srlx	%l4,	0x06,	%g3
	fexpand	%f18,	%f6
	wr	%o3,	%g5,	%softint
	xnorcc	%o5,	0x1000,	%i0
	tvs	%icc,	0x0
	add	%o2,	%l0,	%l5
	rdpr	%cleanwin,	%i3
	rd	%pc,	%o6
	fnors	%f18,	%f11,	%f12

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	rd	%pc,	%i7
	fmovscc	%icc,	%f23,	%f17
	xorcc	%l1,	0x0515,	%g1
	rdpr	%gl,	%g2
	xorcc	%o1,	0x074F,	%l6
	wr	%i2,	%o7,	%pic

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x32C, 	%hsys_tick_cmpr
	rdhpr	%hsys_tick_cmpr,	%o0
	wr	%g0,	0x19,	%asi
	ldsba	[%l7 + 0x5E] %asi,	%i1
	wrpr	%o4,	0x14A1,	%tick
	rdpr	%cansave,	%i6
	wrpr	%g4,	0x00C8,	%cwp
	tsubcc	%l2,	0x1DE0,	%g6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xFA5, 	%hsys_tick_cmpr
	wrpr	%g3,	0x0E79,	%tick
	rdpr	%cleanwin,	%l4
	wr	%o3,	0x0926,	%pic
	mulscc	%g5,	0x0A7E,	%o5
	rdpr	%cwp,	%o2
	rd	%sys_tick_cmpr,	%l0
	siam	0x2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xA29, 	%hsys_tick_cmpr
	tsubcc	%i3,	%i7,	%l1
	rd	%tick_cmpr,	%g1
	fmovd	%f12,	%f14
	ble,a,pn	%xcc,	loop_539
	ba	loop_540
	wr 	%g0, 	0x5, 	%fprs
	tcc	%xcc,	0x7
loop_539:
	rdhpr	%hintp,	%i4
loop_540:
	wrpr	%l6,	%o1,	%tick
	rdhpr	%htba,	%i2
	rdhpr	%hintp,	%g7
	rdhpr	%hpstate,	%o7
	wrpr	%l3,	%o0,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%canrestore,	%i6
	wr 	%g0, 	0x5, 	%fprs
	movrne	%l2,	%g6,	%i5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fmovsleu	%xcc,	%f10,	%f7
	rdhpr	%hpstate,	%o4
	wr	%g0,	0x19,	%asi
	stba	%l4,	[%l7 + 0x09] %asi
	wr	%g5,	%o5,	%softint
	orn	%o2,	0x0FDD,	%l0
	ldub	[%l7 + 0x45],	%o3
	rdpr	%canrestore,	%i0
	rd	%sys_tick_cmpr,	%o6
	rdhpr	%hintp,	%i3
	wr	%i7,	%l5,	%pic
	wr	%g1,	0x1DEC,	%softint
	movleu	%icc,	%l1,	%g2
	rd	%y,	%i4
	rd	%pc,	%o1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fmovdleu	%icc,	%f24,	%f28
	rd	%ccr,	%g7
	wr	%l6,	%l3,	%y
	wrpr	%o0,	%o7,	%cwp
	fbue,a	%fcc1,	loop_541
	andncc	%i6,	%i1,	%g4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x8F9, 	%hsys_tick_cmpr
	rd	%softint,	%i5
loop_541:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x688, 	%hsys_tick_cmpr
	andncc	%l4,	%g5,	%o2
	movpos	%icc,	%o5,	%l0
	rd	%y,	%o3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x209, 	%hsys_tick_cmpr
	mulscc	%i3,	0x1668,	%i7
	wrpr	%l5,	0x0B01,	%tick
	rdhpr	%hsys_tick_cmpr,	%g1
	rdhpr	%hpstate,	%g2
	taddcctv	%i4,	0x0AAE,	%o1
	and	%i2,	%l1,	%g7
	flush	%l7 + 0x14
	rd	%softint,	%l6
	wrpr	%l3,	0x1783,	%pil
	rd	%softint,	%o0
	rd	%fprs,	%i6
	rdpr	%canrestore,	%o7
	rdhpr	%hintp,	%i1
	rdhpr	%htba,	%g4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x1E8, 	%hsys_tick_cmpr
	fbge,a	%fcc3,	loop_542
	fbul,a	%fcc1,	loop_543
	udivx	%g3,	0x0432,	%i5
	rd	%asi,	%o4
loop_542:
	rd	%y,	%g5
loop_543:
	ta	%icc,	0x3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xEEF, 	%hsys_tick_cmpr
	sub	%o5,	0x1A3F,	%o2
	rd	%softint,	%l0
	tneg	%icc,	0x2
	fmovdne	%xcc,	%f20,	%f4
	movl	%icc,	%o3,	%i0
	rd	%pc,	%o6
	fnegs	%f18,	%f31

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%htba,	%g1
	wrpr	%i3,	%g2,	%cwp
	wrpr	%i4,	0x19F5,	%cwp
	fsrc2	%f6,	%f4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x0A8, 	%hsys_tick_cmpr
	sdiv	%i2,	0x0EA7,	%l1
	rd	%sys_tick_cmpr,	%l6
	sir	0x164F
	wr	%g7,	0x03AA,	%set_softint
	wr	%o0,	0x074A,	%pic
	rd	%asi,	%i6
	bcs,a,pn	%xcc,	loop_544
	wrpr	%l3,	0x0D45,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%hpstate,	%g4
loop_544:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xFF8, 	%hsys_tick_cmpr
	rdhpr	%hpstate,	%l2
	rdhpr	%hsys_tick_cmpr,	%g3
	popc	%i5,	%g6
	rdhpr	%hsys_tick_cmpr,	%o4
	brgz	%l4,	loop_545
	fmovdle	%xcc,	%f30,	%f16

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xE44, 	%hsys_tick_cmpr
loop_545:
	rd	%sys_tick_cmpr,	%l0
	fpack16	%f8,	%f22
	rdhpr	%hintp,	%o2
	wr	%g0,	0x19,	%asi
	stba	%o3,	[%l7 + 0x62] %asi
	edge8n	%i0,	%i7,	%l5
	tleu	%xcc,	0x2
	flushw
	brlez,a	%g1,	loop_546
	wr	%i3,	%o6,	%set_softint
	wrpr	%i4,	%o1,	%tick
	fandnot2s	%f28,	%f28,	%f2
loop_546:
	fbu,a	%fcc2,	loop_547
	wr	%i2,	0x02AA,	%sys_tick
	wrpr	%g2,	%l6,	%pil
	rdhpr	%hsys_tick_cmpr,	%l1
loop_547:
	fmovrslez	%g7,	%f5,	%f14

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	xnorcc	%i1,	0x1083,	%g4
	rdhpr	%hsys_tick_cmpr,	%o7
	rd	%fprs,	%l3
	fands	%f7,	%f27,	%f0
	taddcc	%l2,	%i5,	%g6
	xnor	%o4,	%l4,	%g5
	edge8ln	%o5,	%g3,	%o2
	udivcc	%o3,	0x1B5A,	%l0
	wrpr	%i7,	%i0,	%pil
	wr	%g1,	%l5,	%pic

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x508, 	%sys_tick_cmpr
	wrpr	%o6,	%o1,	%cwp
	rdpr	%pil,	%i4
	fones	%f6
	wrpr	%g2,	0x10D4,	%tick
	fmovscs	%icc,	%f8,	%f23

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x9BA, 	%hsys_tick_cmpr
	std	%f14,	[%l7 + 0x10]
	nop
	setx	loop_548,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	sethi	0x17A6,	%l1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x04E, 	%hsys_tick_cmpr
	movn	%icc,	%i2,	%o0
loop_548:
	rdpr	%pil,	%g4
	mova	%icc,	%o7,	%l3
	fbue	%fcc2,	loop_549
	rdpr	%cwp,	%i1
	movre	%l2,	%i5,	%g6
	rdpr	%canrestore,	%l4
loop_549:
	taddcc	%g5,	%o4,	%g3
	wr	%o2,	%o5,	%softint
	rdpr	%pil,	%i7
	fmul8ulx16	%f6,	%f14,	%f2
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 0:
!
!	Type l   	: 521
!	Type a   	: 5327
!	Type x   	: 261
!	Type cti   	: 549
!	Type f   	: 857
!	Type i   	: 2485
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


	EXIT_GOOD	/* test finish  */

/************************************************************************
   Test case data start
 ************************************************************************/
.data
user_data_start:
scratch_area:
.word 0xD84F512F
.word 0x3F361144
.word 0xC9ED7AC1
.word 0xCACA42E0
.word 0x2EC1C106
.word 0x995CDB0F
.word 0xD974BA78
.word 0xD02A0B9B
.word 0x8B994B66
.word 0xE2050956
.word 0xEB242E82
.word 0xAA3D7908
.word 0xBA12CD5F
.word 0x097D36D8
.word 0xFA2C2903
.word 0xE5AECA9F
.word 0xDC24FE74
.word 0xCCD0F33B
.word 0xCFDEAEE8
.word 0x380AAB18
.word 0xB2E50293
.word 0x75097A38
.word 0x0C1C7E8E
.word 0x919BE562
.word 0x5F6CE820
.word 0xDD94BBD4
.word 0x91AE8228
.word 0x17FF65DF
.word 0x671B1F32
.word 0x2ED259F6
.word 0x750313DF
.word 0x50D4C677
.word 0x83F4030C
.word 0x926AB1D5
.word 0x1B094C9A
.word 0xFE264BB1
.word 0x91F25398
.word 0x691510A9
.word 0xDFD13780
.word 0x6D0E7F7A
.word 0x551873FD
.word 0x8DC5ACF5
.word 0x313DA8F0
.word 0xC1927F92
.word 0x37BA0BC5
.word 0x3F9EBD44
.word 0x33A87AFF
.word 0x36BEE2C9
.word 0xCD526CEB
.word 0xD4E45295
.word 0x8D22BAE1
.word 0x3619BC93
.word 0x6A2B2F6C
.word 0x3B8CBAE6
.word 0xFA66E9D2
.word 0x839EF3EF
.word 0x8446A791
.word 0x1201DB99
.word 0x9673B34F
.word 0xBA6DBD2C
.word 0x9B4831B1
.word 0x4304DB93
.word 0xDE18986F
.word 0xBEE8AD56
.end
