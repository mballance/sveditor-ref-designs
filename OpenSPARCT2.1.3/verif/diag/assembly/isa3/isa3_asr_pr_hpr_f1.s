/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: isa3_asr_pr_hpr_f1.s
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
.ident "FOCUSCASE: focus.pm,v 1.1 2003/04/23 17:53:39 somePerson Exp somePerson $ ../focus/spc_basic_isa3.pl FOCUS_SEED=624840395"
.ident "BY gg137162 ON Wed Sep 10 10:57:11 CDT 2003"
.ident "Using Instruction Hash for Focus :$Id: isa3_asr_pr_hpr_f1.s,v 1.2 2007/07/05 21:59:45 drp Exp $"
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
	set	0xB,	%g1
	set	0x4,	%g2
	set	0xD,	%g3
	set	0x6,	%g4
	set	0x5,	%g5
	set	0xC,	%g6
	set	0xB,	%g7
	!# Input registers
	set	-0x3,	%i0
	set	-0x5,	%i1
	set	-0xF,	%i2
	set	-0x8,	%i3
	set	-0xB,	%i4
	set	-0xA,	%i5
	set	-0xB,	%i6
	set	-0x9,	%i7
	!# Local registers
	set	0x437C34B9,	%l0
	set	0x1A7669F1,	%l1
	set	0x64816251,	%l2
	set	0x5E53A901,	%l3
	set	0x423DA444,	%l4
	set	0x2A201D96,	%l5
	set	0x4825D9CE,	%l6
	!# Output registers
	set	-0x0E81,	%o0
	set	0x1065,	%o1
	set	0x1D7C,	%o2
	set	0x01B8,	%o3
	set	0x109A,	%o4
	set	-0x1939,	%o5
	set	-0x1308,	%o6
	set	-0x11B8,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0xAF317B7453EAF8DA)
	INIT_TH_FP_REG(%l7,%f2,0xBD0EA8315ADBC06D)
	INIT_TH_FP_REG(%l7,%f4,0xCFB97FCC9C6936DD)
	INIT_TH_FP_REG(%l7,%f6,0x8C479EDD4249B5AC)
	INIT_TH_FP_REG(%l7,%f8,0x6B2ECA97B28730C1)
	INIT_TH_FP_REG(%l7,%f10,0x94DFF5F3B398CC12)
	INIT_TH_FP_REG(%l7,%f12,0xFAE4642A47ACDC2F)
	INIT_TH_FP_REG(%l7,%f14,0xBE83EECB5C995860)
	INIT_TH_FP_REG(%l7,%f16,0xC45AE746F06D5856)
	INIT_TH_FP_REG(%l7,%f18,0x72EAC436888693E4)
	INIT_TH_FP_REG(%l7,%f20,0x0DE86A09E6AD9BBA)
	INIT_TH_FP_REG(%l7,%f22,0xBE65275693612B98)
	INIT_TH_FP_REG(%l7,%f24,0x3C578D34E4A3AB71)
	INIT_TH_FP_REG(%l7,%f26,0xE3083133CFB45BAE)
	INIT_TH_FP_REG(%l7,%f28,0x1E6C1820E57142B2)
	INIT_TH_FP_REG(%l7,%f30,0x9F8197F258A5E0C7)
	!# Other state
	
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x533, 	%hsys_tick_cmpr


	!# Execute Main Diag ..

	wrpr	%l4,	0x00DB,	%tick
	nop
	set	0x77, %l1
	ldsb	[%l7 + %l1],	%g2
	srlx	%o2,	%l5,	%o7
	xnor	%g4,	%g5,	%l6
	fmul8x16	%f22,	%f14,	%f10
	rdhpr	%hintp,	%i7
	wr 	%g0, 	0x7, 	%fprs
	fmovsg	%xcc,	%f11,	%f26
	rd	%ccr,	%i5
	rdpr	%gl,	%i4
	fands	%f17,	%f25,	%f31
	fmul8x16au	%f22,	%f11,	%f6
	fmovrslz	%o6,	%f22,	%f22
	nop
	set	0x70, %o7
	ldx	[%l7 + %o7],	%l0
	rd	%sys_tick_cmpr,	%o3
	bne,pt	%xcc,	loop_1
	rdpr	%tl,	%l2
	rd	%ccr,	%i2
	taddcctv	%l1,	%i6,	%g6
loop_1:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	movl	%xcc,	%i1,	%g3
	rdpr	%cwp,	%i0
	subccc	%g1,	%o0,	%o5
	popc	0x12D9,	%i3
	wr	%o4,	0x0384,	%softint
	rdpr	%otherwin,	%g7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x039, 	%hsys_tick_cmpr
	set	0x30, %l6
	stda	%l4,	[%l7 + %l6] 0xea
	membar	#Sync
	andncc	%o7,	%g2,	%g5
	array32	%g4,	%l6,	%l3
	addc	%i5,	%i7,	%i4
	wrpr	%o6,	%o3,	%tick
	wr	%l2,	0x0014,	%ccr
	edge32ln	%i2,	%l1,	%l0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	edge16l	%g6,	%i1,	%g3
	wrpr	%g1,	%o0,	%tick
	tsubcctv	%i0,	%i3,	%o5
	call	loop_2
	rdpr	%pil,	%g7
	fmovda	%xcc,	%f27,	%f29
        wr    %g0,    0xe,    %pcr    ! changed.
loop_2:
	fzero	%f6
        wr    %g0,    0xe,    %pcr    ! changed.
	movleu	%icc,	%o7,	%l5
	smul	%g2,	%g4,	%l6
	wr	%l3,	%g5,	%clear_softint
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	rdpr	%cwp,	%i7
	fexpand	%f24,	%f26

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	fcmped	%fcc2,	%f26,	%f20
	rdpr	%canrestore,	%o6
	rdhpr	%hpstate,	%i5
	rdhpr	%hsys_tick_cmpr,	%o3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x524, 	%hsys_tick_cmpr
	umul	%i2,	0x1A16,	%l1
	wrpr	%i6,	0x07A5,	%tick
	tle	%icc,	0x1
	membar	0x01
	srax	%l0,	%g6,	%i1
	edge32l	%o1,	%g1,	%g3
	fornot2s	%f29,	%f29,	%f30
	wr	%g0,	0xe3,	%asi
	stda	%o0,	[%l7 + 0x08] %asi
	membar	#Sync
	lduh	[%l7 + 0x18],	%i3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x53D, 	%hsys_tick_cmpr
	rdhpr	%hsys_tick_cmpr,	%o5
	fbe,a	%fcc2,	loop_3
	wr	%g7,	0x1D97,	%clear_softint
	rdpr	%tba,	%l4
	udiv	%o4,	0x0A5C,	%o7
loop_3:
	edge16n	%o2,	%l5,	%g2
	wrpr	%g4,	%l3,	%pil
	rd	%ccr,	%l6
	tpos	%icc,	0x5
	xorcc	%i7,	0x0D89,	%i4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xF17, 	%hsys_tick_cmpr
	movrlez	%o3,	0x1B8,	%l2
	membar	0x7C
	wrpr	%g5,	%l1,	%pil
	rdhpr	%hsys_tick_cmpr,	%i6
	wrpr	%l0,	%i2,	%pil
	rdhpr	%hsys_tick_cmpr,	%g6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	sll	%g3,	0x1D,	%i1
	rdhpr	%hpstate,	%o0
	sllx	%i0,	0x14,	%o5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fmovdgu	%icc,	%f24,	%f24
	rd	%tick_cmpr,	%i3
	rdpr	%tba,	%o7
	rdhpr	%htba,	%o4
	rd	%sys_tick_cmpr,	%o2
	rdhpr	%hsys_tick_cmpr,	%l5
	rd	%sys_tick_cmpr,	%g4
	tn	%xcc,	0x2
	edge8n	%l3,	%g2,	%l6
	srlx	%i4,	0x09,	%o6
	rd	%fprs,	%i5
	wr	%o3,	0x1F4E,	%ccr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x90D, 	%hsys_tick_cmpr
	rd	%asi,	%g5
	xnor	%l1,	0x1DAA,	%i6
	fmovd	%f16,	%f16
	fmovsgu	%icc,	%f4,	%f5
	rdhpr	%hsys_tick_cmpr,	%l0
	rd	%pc,	%i2
	rdpr	%canrestore,	%o1
	fba	%fcc2,	loop_4
	wr	%g1,	%g3,	%softint
	fcmped	%fcc2,	%f2,	%f8
	edge32n	%i1,	%g6,	%o0
loop_4:
	movleu	%icc,	%i0,	%g7
	fmovsleu	%icc,	%f15,	%f22
	rd	%y,	%l4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x34A, 	%hsys_tick_cmpr
	rd	%ccr,	%o7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x154, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	taddcctv	%l5,	0x1BB4,	%g4
	tvc	%xcc,	0x7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x478, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	nop
	setx	loop_5,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	rd	%asi,	%g5
	wr	%l2,	0x0E80,	%clear_softint
	ta	%xcc,	0x2
loop_5:
	wrpr	%i6,	0x1196,	%pil
	rdpr	%pil,	%l1
	rdpr	%otherwin,	%l0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x2D0, 	%hsys_tick_cmpr
	rd	%tick_cmpr,	%g1
	fbul	%fcc2,	loop_6
	smulcc	%g3,	0x0923,	%i1
	rdpr	%cansave,	%g6
	edge16ln	%o0,	%o1,	%g7
loop_6:
	tvs	%xcc,	0x1
	andn	%i0,	0x0F48,	%o5
	fpackfix	%f30,	%f12
	wrpr	%l4,	0x081E,	%tick
	subc	%i3,	%o4,	%o7
	rd	%asi,	%l5
	membar	0x6A
	rdhpr	%htba,	%g4
	fmul8x16	%f22,	%f26,	%f10
	rdhpr	%htba,	%g2
	wrpr	%o2,	%l6,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%l3,	%i5,	%set_softint

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xCC7, 	%tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x70E, 	%tick_cmpr
	rdhpr	%htba,	%i7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x58D, 	%hsys_tick_cmpr
	wrpr	%l1,	0x1D34,	%tick
	udivcc	%l0,	0x1208,	%i6
	fcmped	%fcc1,	%f24,	%f28
	fcmple32	%f22,	%f0,	%g1
	nop
	setx loop_7, %l0, %l1
	jmpl %l1, %i2
	rdhpr	%htba,	%g3
	rdpr	%tba,	%g6
	tvc	%icc,	0x1
loop_7:
	fandnot1	%f2,	%f2,	%f30

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xCEE, 	%hsys_tick_cmpr
	rd	%y,	%g7
	rd	%asi,	%o1
	rdpr	%pil,	%i0
	sllx	%o5,	0x08,	%i3
	fmovrdlez	%o4,	%f24,	%f2
	rdpr	%tba,	%l4
	std	%f24,	[%l7 + 0x18]
	rdhpr	%htba,	%l5
	rdpr	%otherwin,	%g4
	wr	%o7,	%g2,	%sys_tick
	fone	%f0
	wrpr	%l6,	0x174C,	%cwp
	rdhpr	%hsys_tick_cmpr,	%o6
	subccc	%l3,	0x0E1D,	%i5
	rd	%y,	%o3
	edge8	%o2,	%i7,	%i4
	fpmerge	%f6,	%f9,	%f12
	rdhpr	%hpstate,	%l2
	sdiv	%l1,	0x0EA2,	%l0
	wrpr	%g5,	%i6,	%tick
	bvc,pt	%icc,	loop_8
        wr    %g0,    0xe,    %pcr    ! changed.
	rdpr	%pil,	%i2
	tge	%xcc,	0x1
loop_8:
	edge8l	%g3,	%o0,	%i1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%g6,	%i0,	%set_softint
	fxnors	%f19,	%f19,	%f6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x7AE, 	%sys_tick_cmpr
	wr 	%g0, 	0x7, 	%fprs
	wrpr	%o4,	0x10FA,	%cwp
	fcmpne32	%f10,	%f22,	%i3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%l4,	0x0699,	%tick
	rdpr	%gl,	%g2
	fmovrsgez	%o7,	%f13,	%f31
	andcc	%l6,	%l3,	%i5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	movrne	%i7,	%i4,	%l2
	rdhpr	%hintp,	%o3
	rd	%fprs,	%l0
	rd	%fprs,	%l1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xBE8, 	%hsys_tick_cmpr
	fmovsvs	%xcc,	%f14,	%f15
	fornot1	%f12,	%f18,	%f4
	rd	%softint,	%i6
	brnz,a	%g3,	loop_9
	rdpr	%gl,	%i2
	rdhpr	%htba,	%o0
	ldd	[%l7 + 0x38],	%f8
loop_9:
	wrpr	%i1,	%g6,	%tick
	call	loop_10
	addcc	%g7,	%i0,	%o1
	fmovsvc	%xcc,	%f8,	%f23
	rdhpr	%hsys_tick_cmpr,	%o5
loop_10:
        wr    %g0,    0xe,    %pcr    ! changed.
	tgu	%icc,	0x3
	wrpr	%i3,	0x0088,	%cwp
	be,pn	%xcc,	loop_11
	rdpr	%pil,	%g4
	fmovdle	%xcc,	%f24,	%f27
	rd	%asi,	%l5
loop_11:
	andn	%g2,	0x1E86,	%o7
	wr	%l6,	%l4,	%ccr
	wr	%l3,	%i5,	%sys_tick
	ta	%xcc,	0x7
	udivcc	%o6,	0x11CA,	%i7
	wrpr	%i4,	0x147B,	%cwp
	rd	%y,	%o2
	rd	%tick_cmpr,	%o3
	rd	%asi,	%l2
	rd	%asi,	%l0
	xnorcc	%l1,	0x0BA3,	%g1
	wrpr	%i6,	%g5,	%pil
	bneg,a	%icc,	loop_12
	movrgez	%g3,	%i2,	%i1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x957, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x02A, 	%hsys_tick_cmpr
loop_12:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	movrne	%i0,	%o5,	%i3
	edge8ln	%o4,	%g4,	%l5
	rdpr	%cwp,	%o7
	rdpr	%cansave,	%l6
	addc	%g2,	%l3,	%i5
	wrpr	%l4,	0x053D,	%tick
	rdpr	%cleanwin,	%i7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x546, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x311, 	%hsys_tick_cmpr
	edge32	%o3,	%l0,	%l2
	rd	%ccr,	%l1
	movne	%icc,	%g1,	%i6
	membar	0x5F
	rdpr	%pil,	%g3
	orn	%i2,	%i1,	%g6
	std	%f12,	[%l7 + 0x48]
	alignaddr	%g5,	%o0,	%g7
	edge8n	%i0,	%o5,	%o1
	edge8ln	%o4,	%i3,	%g4
	sir	0x1741
	brlez,a	%l5,	loop_13
	fble	%fcc2,	loop_14
	sdivcc	%l6,	0x0442,	%o7
	rdhpr	%htba,	%l3
loop_13:
	te	%xcc,	0x7
loop_14:
	wrpr	%i5,	%g2,	%pil
	wr	%i7,	0x0681,	%pic
	rd	%ccr,	%o6
	sir	0x1C09
	wrpr	%l4,	0x18FB,	%cwp
	wrpr	%o2,	%o3,	%cwp
	wrpr	%l0,	0x0900,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xA59, 	%hsys_tick_cmpr
	rdpr	%cansave,	%l2
	rd	%ccr,	%i6
	edge32n	%g1,	%i2,	%i1
	rdhpr	%htba,	%g6
	rdpr	%cleanwin,	%g3
	wr	%o0,	%g7,	%softint
	nop
	setx	loop_15,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	rd	%ccr,	%g5
	fcmpeq32	%f26,	%f18,	%o5
	fpadd16s	%f24,	%f29,	%f30
loop_15:
	edge8ln	%o1,	%o4,	%i3
	wr	%g0,	0x81,	%asi
	ldsha	[%l7 + 0x32] %asi,	%g4
	movrlez	%l5,	0x24B,	%i0
	tleu	%icc,	0x7
	rd	%asi,	%o7
	rdhpr	%hpstate,	%l6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xB3D, 	%hsys_tick_cmpr
	rdhpr	%hsys_tick_cmpr,	%g2
	rdhpr	%htba,	%i5
	rdhpr	%hintp,	%i7
	flush	%l7 + 0x68

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%o2,	%l0,	%softint
	wrpr	%l1,	%i4,	%pil
	rdpr	%wstate,	%l2
	rdhpr	%hpstate,	%g1
	wrpr	%i6,	%i2,	%pil
	fbug,a	%fcc3,	loop_16
	ldsh	[%l7 + 0x4E],	%i1
	smul	%g6,	0x0161,	%o0
	wrpr	%g3,	%g5,	%tick
loop_16:
	bg	%xcc,	loop_17
	wrpr	%g7,	0x1372,	%pil
	wr	%o1,	%o4,	%pic
	movcs	%xcc,	%o5,	%g4
loop_17:
	fmovrdgez	%i3,	%f26,	%f24
	wrpr	%l5,	%o7,	%pil
	fbue,a	%fcc3,	loop_18
	lduh	[%l7 + 0x08],	%l6
	fornot1s	%f8,	%f20,	%f17
	rdhpr	%htba,	%l3
loop_18:
	ldub	[%l7 + 0x2F],	%i0
	xor	%i5,	%g2,	%l4
	wrpr	%o6,	0x1A74,	%cwp
	rdhpr	%hsys_tick_cmpr,	%o3
	rdpr	%wstate,	%i7
	rd	%asi,	%o2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	rd	%ccr,	%i4
	rd	%tick_cmpr,	%l2
	sir	0x188E
	movre	%i6,	0x35E,	%i2
	wrpr	%i1,	0x1E07,	%pil
	rdpr	%tl,	%g6
	fcmpne16	%f12,	%f24,	%o0
	rdpr	%tl,	%g1
	sra	%g5,	%g3,	%o1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	edge8ln	%o5,	%g4,	%o4
	andcc	%l5,	0x0190,	%i3
	tleu	%xcc,	0x4
	wrpr	%o7,	0x08C6,	%pil
	fble	%fcc0,	loop_19
	addccc	%l6,	0x05AC,	%l3
	movg	%xcc,	%i5,	%g2
	movg	%icc,	%i0,	%o6
loop_19:
	wr	%l4,	%i7,	%sys_tick
	rd	%asi,	%o3
	wr	%o2,	%l0,	%clear_softint
	wrpr	%i4,	0x11D5,	%tick
	rd	%fprs,	%l2
	fmul8ulx16	%f20,	%f24,	%f24
	wrpr	%l1,	0x152E,	%cwp
	rdhpr	%hpstate,	%i2
	rdpr	%cleanwin,	%i6
	subcc	%i1,	0x1CF0,	%o0
	edge32n	%g1,	%g5,	%g3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	rdpr	%cleanwin,	%o5
	orcc	%g4,	0x1CE6,	%o4
	wrpr	%l5,	0x0B24,	%cwp
	edge32ln	%i3,	%g7,	%l6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x513, 	%hsys_tick_cmpr
	xor	%o7,	%i5,	%g2
	rd	%sys_tick_cmpr,	%o6
	wr 	%g0, 	0x4, 	%fprs

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xAE6, 	%hsys_tick_cmpr
	wr	%o2,	%i4,	%sys_tick
	xnorcc	%l2,	%l0,	%l1
	fmovdpos	%icc,	%f3,	%f18
	rdhpr	%hsys_tick_cmpr,	%i6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x6E6, 	%hsys_tick_cmpr
	rdpr	%cansave,	%o0
	wr	%g5,	0x153D,	%softint
	wr	%g3,	%o1,	%set_softint

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xA6C, 	%hsys_tick_cmpr
	wr	%g0,	0x10,	%asi
	stda	%g4,	[%l7 + 0x38] %asi
	rdpr	%otherwin,	%o4
	fcmple32	%f8,	%f4,	%l5
	rdpr	%pil,	%i3
	fmovde	%xcc,	%f9,	%f15
	move	%xcc,	%g7,	%l6
	movneg	%xcc,	%g1,	%o7
	wr	%l3,	%g2,	%clear_softint
	fxnor	%f28,	%f16,	%f20

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x918, 	%hsys_tick_cmpr
	rdhpr	%hintp,	%i7
	move	%icc,	%i5,	%o3
	movpos	%xcc,	%o2,	%i0
	wr 	%g0, 	0x4, 	%fprs
	wrpr	%l0,	0x0CF7,	%pil
	rdhpr	%htba,	%l1
	tvc	%xcc,	0x7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xE71, 	%hsys_tick_cmpr
	rdpr	%cwp,	%i1
	orn	%i6,	0x0778,	%o0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x54C, 	%hsys_tick_cmpr
	rdhpr	%hintp,	%g3
	fsrc2s	%f7,	%f8

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	rdpr	%tl,	%o1
	bg,a	loop_20
	bn,pt	%icc,	loop_21
	xorcc	%o5,	0x08B4,	%g4
	movg	%icc,	%o4,	%i3
loop_20:
	wrpr	%l5,	0x153D,	%tick
loop_21:
	wrpr	%l6,	0x0D9B,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x898, 	%tick_cmpr
	wr	%o7,	%l3,	%clear_softint
	rdpr	%tl,	%o6
	edge8l	%g2,	%i7,	%l4
	rd	%sys_tick_cmpr,	%o3
	edge8	%o2,	%i5,	%i0
	fmovrsne	%l0,	%f30,	%f20
	rdpr	%cleanwin,	%l2
	sllx	%i4,	0x1A,	%l1
	wr	%i6,	%i1,	%clear_softint
	flush	%l7 + 0x74
	rd	%ccr,	%o0
	tg	%xcc,	0x2
	rd	%sys_tick_cmpr,	%g5
	wr 	%g0, 	0x5, 	%fprs
	rdpr	%otherwin,	%o1
	tleu	%icc,	0x6
	rd	%fprs,	%g3
	rd	%softint,	%o5
	wr	%o4,	%g4,	%pic
	rdpr	%tl,	%l5
	wrpr	%l6,	%i3,	%tick
	movrgez	%g7,	%o7,	%l3
	wrpr	%o6,	%g2,	%pil
	rd	%sys_tick_cmpr,	%i7
	wrpr	%g1,	%o3,	%pil
	fpadd16s	%f24,	%f0,	%f7
	sll	%l4,	%i5,	%o2
	rdhpr	%hintp,	%l0
	rdpr	%cansave,	%i0
	rdpr	%gl,	%l2
	rd	%softint,	%l1
	array16	%i4,	%i1,	%o0
	rdpr	%cleanwin,	%i6
	rd	%sys_tick_cmpr,	%g5
	wrpr	%g6,	%i2,	%tick
	rdpr	%wstate,	%g3
	wr	%g0,	0x04,	%asi
	ldswa	[%l7 + 0x20] %asi,	%o1
	andn	%o5,	%g4,	%l5
	movrlez	%o4,	%l6,	%g7
	wrpr	%i3,	%o7,	%tick
	te	%xcc,	0x1
	wrpr	%l3,	%o6,	%pil
	rdpr	%gl,	%g2
	rdpr	%cwp,	%g1
	sethi	0x0745,	%o3
	tpos	%xcc,	0x4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x2C9, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	mova	%icc,	%l0,	%i0
	rdpr	%pil,	%i7
	orcc	%l1,	%l2,	%i1
	wr	%g0,	0x18,	%asi
	swapa	[%l7 + 0x60] %asi,	%i4
	rdhpr	%hsys_tick_cmpr,	%i6
	stw	%o0,	[%l7 + 0x58]
	faligndata	%f28,	%f10,	%f6
	srax	%g6,	%i2,	%g5
	fpack32	%f16,	%f0,	%f6
	movgu	%icc,	%o1,	%o5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xBF3, 	%hsys_tick_cmpr
	wrpr	%g4,	0x1773,	%cwp
	rd	%sys_tick_cmpr,	%o4
	wrpr	%g7,	0x0B2B,	%pil
	tcs	%xcc,	0x0
	xnor	%l6,	%i3,	%l3
	wr	%o7,	0x1BD3,	%softint

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fmovs	%f12,	%f25
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srlx	%o3,	%g2,	%i5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%cwp,	%l0
	rdpr	%cansave,	%i0
	tn	%xcc,	0x4
	wrpr	%i7,	0x1CA4,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x964, 	%hsys_tick_cmpr
	movn	%icc,	%l2,	%i4
	wrpr	%i6,	%o0,	%cwp
	wr	%g6,	%i1,	%sys_tick
	wrpr	%g5,	0x17F8,	%pil
	mulscc	%i2,	0x0887,	%o1
	fmovsl	%xcc,	%f2,	%f31
	fpackfix	%f12,	%f30
	movge	%xcc,	%o5,	%g3
	rd	%ccr,	%l5
	rd	%pc,	%o4
	sll	%g4,	0x07,	%g7
	wr	%i3,	0x101A,	%sys_tick
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbo,a	%fcc3,	loop_22
	wrpr	%l3,	0x171E,	%pil
	movne	%xcc,	%o7,	%o6
	set	0x78, %o2
	stda	%g0,	[%l7 + %o2] 0xe2
	membar	#Sync
loop_22:
	rdpr	%otherwin,	%l6
	wrpr	%g2,	%o3,	%cwp
	rdpr	%tba,	%l4
	xnorcc	%i5,	0x1BA0,	%o2
	bvc,pt	%icc,	loop_23
	ldsb	[%l7 + 0x38],	%i0
	wrpr	%l0,	%l1,	%tick
	rdpr	%tl,	%l2
loop_23:
	fbu	%fcc3,	loop_24
	rdpr	%wstate,	%i4
	fsrc1s	%f6,	%f10
	rdpr	%cleanwin,	%i6
loop_24:
	fpsub16s	%f10,	%f25,	%f15
	rdpr	%tba,	%i7
	brgz,a	%g6,	loop_25
	wrpr	%o0,	%i1,	%pil
	fbl,a	%fcc1,	loop_26
	rd	%softint,	%i2
loop_25:
	array16	%g5,	%o1,	%g3
	rdhpr	%htba,	%l5
loop_26:
	rdhpr	%hpstate,	%o5
	sdiv	%o4,	0x185F,	%g7
	tsubcc	%i3,	%g4,	%l3
	rdpr	%wstate,	%o7
	movneg	%xcc,	%g1,	%l6
	ba,pn	%xcc,	loop_27
	bleu,a,pt	%icc,	loop_28
	rdpr	%cwp,	%g2
	rdhpr	%htba,	%o3
loop_27:
	andcc	%o6,	0x0122,	%i5
loop_28:
	edge8ln	%o2,	%i0,	%l4
	rdpr	%tl,	%l1
	rdhpr	%hsys_tick_cmpr,	%l0
	edge32l	%i4,	%l2,	%i7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	tn	%xcc,	0x7
	rd	%fprs,	%g6
	fpack16	%f8,	%f16
	wrpr	%i1,	0x0553,	%tick
	rdpr	%wstate,	%i2
	rd	%fprs,	%o1
	fcmpd	%fcc2,	%f22,	%f0
	rdhpr	%htba,	%g5
	fmovdl	%xcc,	%f27,	%f9
	rdpr	%cansave,	%l5
	bshuffle	%f6,	%f20,	%f4
	set	0x40, %l3
	ldda	[%l7 + %l3] 0x88,	%g2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x247, 	%hsys_tick_cmpr
	membar	0x0B
	rdhpr	%hsys_tick_cmpr,	%o5
	rd	%sys_tick_cmpr,	%g4
	wr	%g0,	0xeb,	%asi
	ldda	[%l7 + 0x20] %asi,	%l2
	movneg	%xcc,	%i3,	%o7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xA33, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%o3,	%o6,	%cwp
	fand	%f26,	%f10,	%f14

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x0F2, 	%sys_tick_cmpr
	add	%l7,	0x38,	%l6
	wr	%g0,	0x11,	%asi
	casa	[%l6] 0x11,	%l4,	%i0
	rdpr	%tba,	%l1
	rd	%softint,	%l0
	rdpr	%wstate,	%i4
	array8	%i7,	%l2,	%i6
	rdhpr	%hintp,	%g6
	fmovsneg	%xcc,	%f4,	%f1
	wrpr	%i1,	0x1C88,	%cwp
	tsubcctv	%i2,	%o0,	%o1
	rdhpr	%hsys_tick_cmpr,	%l5
	smul	%g3,	0x1733,	%o4
	rdpr	%wstate,	%g7
	rdpr	%pil,	%g5
	umulcc	%o5,	%g4,	%i3
	rdhpr	%hpstate,	%l3
	mulscc	%g1,	%l6,	%g2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xB32, 	%hsys_tick_cmpr
	rdhpr	%hpstate,	%o6
	wrpr	%i5,	0x1F15,	%tick
	wrpr	%o3,	%o2,	%cwp
	rd	%tick_cmpr,	%l4
	rd	%sys_tick_cmpr,	%l1
	rdhpr	%hintp,	%i0
	mova	%icc,	%i4,	%l0
	wrpr	%i7,	0x08E2,	%tick
	rdpr	%pil,	%i6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	rdhpr	%hintp,	%g6
	bpos	loop_29
	rd	%y,	%i1
	rdhpr	%hintp,	%i2
	umul	%o0,	%l2,	%l5
loop_29:
	movcs	%xcc,	%g3,	%o4
	fcmped	%fcc2,	%f16,	%f8

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	edge32	%g5,	%o5,	%o1
	taddcc	%g4,	%l3,	%g1
	rdpr	%gl,	%l6
	fxnors	%f4,	%f24,	%f29

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%hpstate,	%i3
	rdhpr	%hpstate,	%i5
	mova	%icc,	%o3,	%o6
	movcc	%xcc,	%o2,	%l4
	fsrc1s	%f10,	%f8

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%l0,	%l1,	%tick
	rd	%sys_tick_cmpr,	%i6
	wr	%g6,	0x0C06,	%pic
	edge16	%i1,	%i2,	%i7
	rdpr	%pil,	%l2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x057, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xD1F, 	%hsys_tick_cmpr
	wrpr	%o4,	0x19BB,	%cwp
	rdhpr	%hpstate,	%g3
	smul	%g7,	%o5,	%o1
	rdhpr	%hintp,	%g4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr 	%g0, 	0x5, 	%fprs
	rdpr	%gl,	%l6
	wrpr	%g2,	0x1FC5,	%tick
	wrpr	%g1,	%i3,	%pil
	std	%o6,	[%l7 + 0x70]
	wrpr	%o3,	0x1B21,	%cwp
	fcmpgt16	%f8,	%f20,	%i5
	rdpr	%tba,	%o2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%softint,	%i4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	tl	%xcc,	0x3
	std	%f10,	[%l7 + 0x70]
	fmovsneg	%icc,	%f28,	%f23
	wrpr	%l0,	0x04FE,	%tick
	wr	%l1,	%i6,	%softint
	wr	%g6,	0x18CE,	%ccr
	stb	%i2,	[%l7 + 0x6A]
	sir	0x01AC

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%hpstate,	%i1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x881, 	%hsys_tick_cmpr
	rd	%ccr,	%o0
	rdhpr	%hpstate,	%o4
	wrpr	%g3,	%g7,	%tick
	wr	%g0,	0x10,	%asi
	lduwa	[%l7 + 0x58] %asi,	%o5
	fbug,a	%fcc3,	loop_30
	rd	%tick_cmpr,	%g4
	wr	%o1,	%g5,	%ccr
	tge	%icc,	0x2
loop_30:
	rdhpr	%hsys_tick_cmpr,	%l3
	rdhpr	%hpstate,	%g2
	rd	%pc,	%g1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xACE, 	%hsys_tick_cmpr
	tsubcc	%o7,	0x1767,	%i3
	fbe	%fcc3,	loop_31
	movcc	%icc,	%o3,	%i5
	tn	%icc,	0x3
	andncc	%o2,	%i0,	%o6
loop_31:
	fbe	%fcc3,	loop_32
	wr	%l4,	0x0946,	%y
	srax	%l0,	%l1,	%i6
	rdhpr	%hintp,	%g6
loop_32:
	rd	%fprs,	%i4
	fornot1s	%f19,	%f26,	%f0
	tneg	%icc,	0x4
	sra	%i2,	0x0E,	%i7
	taddcctv	%i1,	0x10E8,	%l2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	edge16	%o4,	%o0,	%g3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	tg	%xcc,	0x4
	rd	%fprs,	%g4
	rd	%softint,	%g7
	wrpr	%g5,	0x19DB,	%tick
	sllx	%l3,	0x00,	%g2
	fbul,a	%fcc2,	loop_33
	udiv	%o1,	0x05C4,	%l6
	tvc	%xcc,	0x2
	rdpr	%wstate,	%g1
loop_33:
	subc	%o7,	0x17D0,	%i3
	rdhpr	%hintp,	%o3
	movrgz	%i5,	0x210,	%o2
	mulscc	%i0,	0x1161,	%l4
	subcc	%l0,	%o6,	%l1
	wr	%g6,	0x18A2,	%set_softint
	wrpr	%i6,	%i2,	%cwp
	wrpr	%i7,	%i1,	%cwp
	fbn,a	%fcc0,	loop_34
	udivx	%l2,	0x144F,	%l5
	wr	%o4,	0x1931,	%y
	prefetch	[%l7 + 0x64],	 0x0
loop_34:
	edge32n	%o0,	%g3,	%o5
	fmovdleu	%xcc,	%f16,	%f5
	edge16	%i4,	%g7,	%g4
	wr	%l3,	%g5,	%clear_softint
	rd	%sys_tick_cmpr,	%g2
	sll	%o1,	0x1D,	%g1
	sub	%l6,	0x1924,	%i3
	rdhpr	%htba,	%o3
	wr	%g0,	0x89,	%asi
	lduwa	[%l7 + 0x58] %asi,	%i5
	rdpr	%tba,	%o2
	movrgz	%o7,	0x3E3,	%i0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xE2F, 	%hsys_tick_cmpr
	rd	%softint,	%o6
	fnegs	%f8,	%f16
	sub	%l0,	%l1,	%g6
	wr	%i2,	%i6,	%pic
	xnorcc	%i1,	%i7,	%l2
	tvc	%icc,	0x3
	movleu	%icc,	%o4,	%l5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xC2A, 	%hsys_tick_cmpr
	movg	%xcc,	%i4,	%o0
	wrpr	%g7,	0x080C,	%tick
	wrpr	%g4,	0x06BD,	%tick
	rd	%fprs,	%l3
	rdhpr	%hintp,	%g2
	fmovdl	%icc,	%f26,	%f26
	wrpr	%o1,	0x1638,	%tick
	rdhpr	%hintp,	%g1
	sir	0x1D7A
	or	%g5,	0x0431,	%l6
	wrpr	%i3,	0x0C8E,	%tick
	wrpr	%o3,	%o2,	%pil
	rd	%sys_tick_cmpr,	%i5
	movrgez	%i0,	%o7,	%l4
	bneg,a,pn	%icc,	loop_35
	rdhpr	%htba,	%o6
	edge16l	%l1,	%g6,	%i2
	rd	%tick_cmpr,	%l0
loop_35:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	ldsb	[%l7 + 0x6D],	%i1
	fpsub32s	%f30,	%f0,	%f14
	rdhpr	%hintp,	%i7
	rd	%sys_tick_cmpr,	%l2
	rdpr	%cwp,	%l5
	popc	%o4,	%g3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xC7E, 	%hsys_tick_cmpr
	rdhpr	%htba,	%i4
	movg	%icc,	%o0,	%g4
	fxnors	%f1,	%f21,	%f5
	bl,a,pt	%xcc,	loop_36
	movleu	%xcc,	%g7,	%l3
	fmovdvs	%xcc,	%f24,	%f31
	set	0x34, %g6
	lduha	[%l7 + %g6] 0x15,	%g2
loop_36:
	rd	%pc,	%g1
	wr	%g5,	0x1470,	%y
	rdpr	%tl,	%o1
	subccc	%l6,	0x1B0A,	%o3
	wr	%g0,	0x2f,	%asi
	stxa	%i3,	[%l7 + 0x08] %asi
	membar	#Sync
	wr	%i5,	0x067A,	%y
	wrpr	%o2,	0x1F89,	%pil
	tn	%icc,	0x5
	edge16n	%i0,	%o7,	%o6
	fmul8x16al	%f0,	%f22,	%f8
	movge	%icc,	%l1,	%l4
	brnz,a	%i2,	loop_37
	rdhpr	%hintp,	%g6
	movl	%icc,	%i6,	%l0
	alignaddr	%i1,	%i7,	%l2
loop_37:
	rdhpr	%hpstate,	%l5
	rdpr	%cleanwin,	%o4
	rdpr	%cleanwin,	%o5
	wrpr	%g3,	%i4,	%cwp
	set	0x66, %i5
	stba	%o0,	[%l7 + %i5] 0xe2
	membar	#Sync
	addcc	%g7,	%g4,	%g2
	srl	%g1,	%l3,	%g5
	fcmpgt32	%f20,	%f30,	%o1
	edge32l	%l6,	%o3,	%i5
	ldd	[%l7 + 0x60],	%f20
	rdpr	%cansave,	%i3
	wrpr	%o2,	0x08DA,	%pil
	wrpr	%o7,	%o6,	%pil
	fmovsvc	%icc,	%f1,	%f18
	fsrc2	%f2,	%f28
	wr 	%g0, 	0x5, 	%fprs
	fbge	%fcc3,	loop_38
	wr	%i2,	0x1C3F,	%softint
	rd	%ccr,	%i0
	rd	%tick_cmpr,	%g6
loop_38:
	ld	[%l7 + 0x40],	%f19
	rd	%softint,	%l0
	rd	%fprs,	%i1
	rdpr	%wstate,	%i6
	movre	%i7,	%l2,	%l5
	orncc	%o5,	0x1B80,	%o4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%gl,	%o0
	rdpr	%wstate,	%g7
	edge32l	%i4,	%g2,	%g1
	wr	%g4,	%g5,	%y
	nop
	setx	loop_39,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	edge8l	%o1,	%l6,	%o3
	tsubcc	%i5,	0x1025,	%i3
	array16	%l3,	%o7,	%o6
loop_39:
	rdhpr	%hpstate,	%l1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x569, 	%hsys_tick_cmpr
	xnor	%i2,	%g6,	%l0
	rdpr	%gl,	%i1
	rdpr	%gl,	%i6
	rdhpr	%htba,	%i7
	sir	0x0C4D
	membar	0x17
	rdpr	%gl,	%l2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x5F3, 	%hsys_tick_cmpr
	fbuge	%fcc0,	loop_40
	wr	%o5,	%g3,	%set_softint
	fmovrdlez	%o0,	%f16,	%f10
	fmovsleu	%xcc,	%f17,	%f22
loop_40:
	wr	%o4,	0x0AA9,	%set_softint
	wr	%i4,	0x0C1E,	%sys_tick
	wrpr	%g2,	0x1714,	%cwp
	rd	%pc,	%g7
	movneg	%xcc,	%g4,	%g5
	rdhpr	%hintp,	%o1
	rdhpr	%htba,	%l6
	movgu	%xcc,	%o3,	%g1
	wrpr	%i5,	%i3,	%pil
	rdhpr	%hpstate,	%l3
	xnor	%o6,	0x1882,	%o7
	edge16n	%l1,	%l4,	%o2
	rdhpr	%hsys_tick_cmpr,	%g6
        wr    %g0,    0xe,    %pcr    ! changed.
	fcmple32	%f2,	%f30,	%i2
	rdhpr	%htba,	%i7
	rdpr	%tba,	%i6
	movvs	%xcc,	%l5,	%i0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xF92, 	%hsys_tick_cmpr
	andncc	%l2,	%g3,	%o0
	movgu	%icc,	%i4,	%g2
	sra	%o4,	%g4,	%g5
	wr	%o1,	0x1341,	%sys_tick
	fmovscc	%xcc,	%f27,	%f18
	rd	%tick_cmpr,	%g7
	fbg	%fcc0,	loop_41
	wrpr	%o3,	0x147A,	%cwp
	andncc	%g1,	%i5,	%i3
	rdpr	%cwp,	%l3
loop_41:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xC91, 	%hsys_tick_cmpr
	rd	%tick_cmpr,	%l1
	wr	%l4,	%o2,	%y
	brlz,a	%g6,	loop_42
	popc	%l0,	%i1
	rdpr	%cansave,	%o6
!Yo - got one - imm_asi 0x21 
!And yo - immediate is 0x8
	wr	%g0,	0x21,	%asi
	stxa	%i2,	[%g0 + 0x8] %asi
loop_42:
	tcc	%xcc,	0x3
	tge	%xcc,	0x5
	fmovdleu	%xcc,	%f19,	%f15
	bleu,a	loop_43
	edge32	%i6,	%i7,	%l5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x1CE, 	%tick_cmpr
loop_43:
	tge	%icc,	0x3
	orcc	%g3,	0x1C89,	%g2
	bleu,a,pn	%xcc,	loop_44
	fornot1s	%f10,	%f14,	%f17
	rd	%ccr,	%o4
	udivcc	%g4,	0x0A68,	%g5
loop_44:
	rdhpr	%hsys_tick_cmpr,	%i4
	edge32	%g7,	%o1,	%g1
	wr	%g0,	0x18,	%asi
	stba	%o3,	[%l7 + 0x1E] %asi
	tcc	%xcc,	0x5
	rd	%asi,	%i3
	edge32n	%i5,	%l6,	%l3
	wrpr	%l1,	%l4,	%tick
	rdpr	%cleanwin,	%o7
	wrpr	%g6,	%o2,	%cwp
	wr	%l0,	0x1D71,	%pic

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x786, 	%hsys_tick_cmpr
	wrpr	%i2,	0x00EE,	%cwp
	sdiv	%i6,	0x1946,	%i1
	fcmple32	%f14,	%f2,	%l5
	edge8l	%o5,	%i0,	%i7
	alignaddr	%o0,	%l2,	%g3
	bvc,a,pn	%icc,	loop_45
	rdhpr	%hpstate,	%g2
	ldx	[%l7 + 0x28],	%o4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x2F8, 	%hsys_tick_cmpr
loop_45:
	wrpr	%g7,	0x0298,	%cwp
	and	%g5,	%o1,	%o3
	wr 	%g0, 	0x5, 	%fprs
	wrpr	%l6,	%l3,	%tick
	wrpr	%l1,	0x136F,	%pil
	wrpr	%l4,	%o7,	%tick
	rd	%fprs,	%g6
	fands	%f2,	%f0,	%f14
	rd	%asi,	%o2
	lduh	[%l7 + 0x3C],	%l0
	rdpr	%tl,	%i5
	rdhpr	%hintp,	%i2
	movre	%i6,	%i1,	%l5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xB74, 	%hsys_tick_cmpr
	rdpr	%pil,	%i7
	taddcctv	%o0,	%l2,	%o6
	tle	%icc,	0x6
	fcmpeq16	%f30,	%f28,	%g3
	wr	%g2,	0x0DC8,	%sys_tick
	wr	%o4,	%i4,	%pic
	movl	%xcc,	%g7,	%g4
	wrpr	%g5,	%o3,	%pil
	wrpr	%g1,	0x1B5B,	%tick
	rdpr	%gl,	%i3
	wrpr	%o1,	0x0F9D,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%cansave,	%l4
	sir	0x0DFC
	rd	%pc,	%o7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	rdhpr	%hpstate,	%g6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x4BF, 	%hsys_tick_cmpr
	rd	%asi,	%l0
	wr	%g0,	0x18,	%asi
	ldsha	[%l7 + 0x6A] %asi,	%i1
	fmovrdgez	%l5,	%f20,	%f12
	nop
	setx	loop_46,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	smulcc	%o5,	%i0,	%i6
	wr	%g0,	0x88,	%asi
	stxa	%i7,	[%l7 + 0x78] %asi
loop_46:
	movl	%icc,	%l2,	%o0
	rd	%fprs,	%o6
	bne	loop_47
	rdhpr	%hintp,	%g3
	rdhpr	%hsys_tick_cmpr,	%o4
	fmovrdgez	%g2,	%f26,	%f24
loop_47:
	sub	%g7,	%g4,	%i4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xC5F, 	%hsys_tick_cmpr
	wr	%g0,	0x89,	%asi
	lduba	[%l7 + 0x40] %asi,	%g1
	rdpr	%otherwin,	%i3
	mulscc	%g5,	%o1,	%l6
	wr	%l4,	%o7,	%clear_softint
	ta	%icc,	0x3
	rdpr	%gl,	%l1
	rdhpr	%hpstate,	%l3
	fmovdl	%xcc,	%f15,	%f29
	subc	%o2,	0x19B1,	%g6
	wrpr	%i2,	%i5,	%cwp
	wr	%i1,	0x1E1F,	%ccr
	movrlz	%l5,	0x007,	%l0
	bn	loop_48
	rdpr	%tba,	%o5
	rdhpr	%htba,	%i6
	rdhpr	%htba,	%i7
loop_48:
	rdhpr	%hsys_tick_cmpr,	%i0
	rdhpr	%hintp,	%l2
	set	0x20, %l5
	ldda	[%l7 + %l5] 0x15,	%o0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%softint,	%o4
	rd	%tick_cmpr,	%g3
	rdpr	%tl,	%g7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%i4,	0x0012,	%pil
	andn	%g2,	%g1,	%i3
	tsubcctv	%g5,	0x099B,	%o3
	wr	%g0,	0x10,	%asi
	lduwa	[%l7 + 0x7C] %asi,	%l6
	rdhpr	%hsys_tick_cmpr,	%o1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xAA8, 	%hsys_tick_cmpr
	rd	%softint,	%o7
	tge	%xcc,	0x7
	rdhpr	%htba,	%o2
	rd	%asi,	%l3
	movrne	%g6,	%i5,	%i1
	rdhpr	%hpstate,	%l5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	rdhpr	%hpstate,	%l0
	rdhpr	%hintp,	%o5
	tpos	%xcc,	0x0
	wr	%g0,	0x88,	%asi
	stxa	%i6,	[%l7 + 0x70] %asi
	wr	%i2,	%i7,	%y
	fmovsge	%xcc,	%f0,	%f27
	rdhpr	%htba,	%l2
	lduh	[%l7 + 0x0E],	%o0
	rd	%tick_cmpr,	%i0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xDB8, 	%hsys_tick_cmpr
	wrpr	%g7,	0x1B83,	%pil
	wrpr	%g3,	%g4,	%tick
	rdhpr	%hsys_tick_cmpr,	%g2
	fbu	%fcc0,	loop_49
	wr	%i4,	0x1048,	%sys_tick
	rdpr	%wstate,	%g1
	movpos	%xcc,	%g5,	%o3
loop_49:
	nop
	set	0x08, %l0
	prefetch	[%l7 + %l0],	 0x2
	rdhpr	%hintp,	%i3
	ba	loop_50
	wrpr	%o1,	%l4,	%tick
loop_50:
	nop

	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 0:
!
!	Type l   	: 47
!	Type a   	: 539
!	Type x   	: 23
!	Type cti   	: 50
!	Type f   	: 85
!	Type i   	: 256
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


	EXIT_GOOD	/* test finish  */

/************************************************************************
   Test case data start
 ************************************************************************/
.data
user_data_start:
scratch_area:
.word 0x153B7ED0
.word 0xB49E25B6
.word 0x5BFF81D8
.word 0x611FB51D
.word 0xDE271F23
.word 0xE527F0AB
.word 0x5173827F
.word 0xF58E53B4
.word 0x44524E4E
.word 0x772D66BE
.word 0x618C57FE
.word 0xCBC93379
.word 0xFF3E5C45
.word 0x4CFA6E96
.word 0x91FC4DC8
.word 0x5AD29A75
.word 0x3E494500
.word 0x412004F6
.word 0xF2DEBF49
.word 0x1CC4B92B
.word 0x396CBFE8
.word 0x897CD876
.word 0xD484FD31
.word 0x2E12F2CE
.word 0x771746CB
.word 0x063F42E3
.word 0x20F763C3
.word 0x9FB92DC6
.word 0x4B153111
.word 0xAED588B3
.word 0x11260B73
.word 0x7BA0666F
.word 0x30E49991
.word 0x96BEA5F2
.word 0xA59400A6
.word 0xEBD26DC6
.word 0x47063E63
.word 0x06974BFB
.word 0x34AF10C5
.word 0x2FB2386D
.word 0x1AE974EB
.word 0x83E9396E
.word 0xBCE00666
.word 0x9F5E408A
.word 0x22DE4FC0
.word 0x6BA9E624
.word 0x899B085B
.word 0x880D4D21
.word 0x2E9B71B5
.word 0xB0B83321
.word 0xCF85F48A
.word 0x159E38EE
.word 0xF3DF190B
.word 0x08DFFD27
.word 0xB9269451
.word 0x39AF1088
.word 0xDE27A0CC
.word 0x28D421F7
.word 0x9873D8EF
.word 0xCF02CB82
.word 0xD9AB147F
.word 0xE183BEB8
.word 0x973DAFEE
.word 0x66C2E9A6
.end
