/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: isa3_asr_pr_hpr_f2.s
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
.ident "FOCUSCASE: focus.pm,v 1.1 2003/04/23 17:53:39 somePerson Exp somePerson $ ../spc_basic_isa3.pl FOCUS_SEED=708236897"
.ident "BY gg137162 ON Thu Sep  4 09:40:17 CDT 2003"
.ident "Using Instruction Hash for Focus :$Id: isa3_asr_pr_hpr_f2.s,v 1.3 2007/07/05 21:59:47 drp Exp $"
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
	set	0x1,	%g1
	set	0x2,	%g2
	set	0x0,	%g3
	set	0xF,	%g4
	set	0x8,	%g5
	set	0x4,	%g6
	set	0x7,	%g7
	!# Input registers
	set	-0x8,	%i0
	set	-0xF,	%i1
	set	-0xD,	%i2
	set	-0x2,	%i3
	set	-0x7,	%i4
	set	-0x4,	%i5
	set	-0x9,	%i6
	set	-0x1,	%i7
	!# Local registers
	set	0x4C6B3E3E,	%l0
	set	0x6E916616,	%l1
	set	0x13CD3B03,	%l2
	set	0x63821BB5,	%l3
	set	0x3316B37C,	%l4
	set	0x3C2B25F1,	%l5
	set	0x65536A05,	%l6
	!# Output registers
	set	-0x0555,	%o0
	set	-0x1D23,	%o1
	set	0x004C,	%o2
	set	-0x0F14,	%o3
	set	0x164B,	%o4
	set	0x1772,	%o5
	set	-0x13F1,	%o6
	set	-0x09AC,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x291B9A6FA977ADAC)
	INIT_TH_FP_REG(%l7,%f2,0x9703828066906152)
	INIT_TH_FP_REG(%l7,%f4,0x7CEC34E55280E5C8)
	INIT_TH_FP_REG(%l7,%f6,0x7068AB1C4A5BA43E)
	INIT_TH_FP_REG(%l7,%f8,0x88672C361E77B589)
	INIT_TH_FP_REG(%l7,%f10,0xF53330B0C21A78E1)
	INIT_TH_FP_REG(%l7,%f12,0x0FDFFF8FCA12F1AD)
	INIT_TH_FP_REG(%l7,%f14,0x050AED513405D81D)
	INIT_TH_FP_REG(%l7,%f16,0x6599516EC8DE9C44)
	INIT_TH_FP_REG(%l7,%f18,0x75D191B9318BA45A)
	INIT_TH_FP_REG(%l7,%f20,0xB1D603B0A74E02F8)
	INIT_TH_FP_REG(%l7,%f22,0x11C2C30102653AD9)
	INIT_TH_FP_REG(%l7,%f24,0x204817C77A396EB9)
	INIT_TH_FP_REG(%l7,%f26,0x30E65E44FAE92C9E)
	INIT_TH_FP_REG(%l7,%f28,0xE7A863728064603C)
	INIT_TH_FP_REG(%l7,%f30,0x0F741542D367A798)
	!# Other state
	
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr


	!# Execute Main Diag ..


	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	sdivx	%o6,	0x09B4,	%o4
	movrlz	%i5,	0x230,	%l5
	movneg	%icc,	%o1,	%i0
	rd	%tick_cmpr,	%g6
	wrpr	%o0,	%g5,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%htba,	%i2
	xorcc	%o2,	0x1BA7,	%g3
	movrlez	%i1,	%i7,	%o7
	edge16	%l3,	%g2,	%l0
	rdpr	%cleanwin,	%l4
	rd	%softint,	%g7
	wr	%l6,	%i3,	%ccr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xC8A, 	%hsys_tick_cmpr
	rdhpr	%hsys_tick_cmpr,	%g1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xF61, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x530, 	%hsys_tick_cmpr
	wr	%g0,	0x0c,	%asi
	lda	[%l7 + 0x10] %asi,	%f19
	array8	%o4,	%o3,	%o6
	wrpr	%i5,	0x0C63,	%tick
	wr 	%g0, 	0x6, 	%fprs
	wr	%l5,	%o0,	%set_softint
	rdpr	%tba,	%g5
	rd	%asi,	%g6
	rd	%asi,	%i2
	movge	%xcc,	%l1,	%g3
	rdpr	%cleanwin,	%o2
	addcc	%i7,	0x1511,	%i1
	fmovs	%f19,	%f11
	mulscc	%l3,	0x0099,	%o7
	fpsub16s	%f30,	%f11,	%f15
	rd	%y,	%l0
	wrpr	%l4,	%g7,	%pil
	fpmerge	%f18,	%f27,	%f0
	edge32	%i3,	%i6,	%g2
	nop
	set	0x70, %i2
	std	%g0,	[%l7 + %i2]

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x148, 	%hsys_tick_cmpr
	wr	%o5,	0x191F,	%softint
	tvc	%xcc,	0x6
	prefetch	[%l7 + 0x7C],	 0x2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%g4,	0x13B2,	%set_softint
	movcs	%xcc,	%o3,	%i5
	rdhpr	%hintp,	%o6
	rdhpr	%hintp,	%l5
	rdhpr	%hsys_tick_cmpr,	%i0
	subccc	%o0,	%g6,	%g5
	movge	%icc,	%i2,	%g3
	wrpr	%o2,	%l1,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%htba,	%o7
	wrpr	%l3,	0x17C7,	%cwp
	rdhpr	%hsys_tick_cmpr,	%l0
	wr	%g7,	%l4,	%sys_tick
	wrpr	%l6,	0x1168,	%cwp
        wr    %g0,    0xe,    %pcr    ! changed.
	rd	%tick_cmpr,	%g2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	sethi	0x0677,	%o5
	ldstub	[%l7 + 0x39],	%i4
	andcc	%o4,	0x0911,	%l2
	srl	%g4,	0x1E,	%o3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x6F3, 	%hsys_tick_cmpr
	xor	%o6,	%i5,	%i0
	rdpr	%tl,	%o0
	rdpr	%cleanwin,	%g6
	rdhpr	%hsys_tick_cmpr,	%l5
	fmovrsne	%g5,	%f28,	%f0
        wr    %g0,    0xe,    %pcr    ! changed.
	rdhpr	%hpstate,	%g3
	tsubcctv	%i7,	%i1,	%l1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xE2B, 	%hsys_tick_cmpr
	rd	%tick_cmpr,	%o7
	nop
	set	0x18, %i7
	std	%f18,	[%l7 + %i7]
	smulcc	%l0,	%g7,	%l4
	fblg	%fcc1,	loop_1
	rdpr	%tba,	%i6
	movvs	%icc,	%g2,	%i3
	rdpr	%tba,	%g1
loop_1:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	xnor	%l6,	%l2,	%g4
	addc	%o3,	%o4,	%o1
	set	0x77, %o2
	lduba	[%l7 + %o2] 0x11,	%i5
	wrpr	%i0,	%o0,	%pil
	rdhpr	%hintp,	%o6
	wrpr	%l5,	0x177B,	%tick
	bvs,a	loop_2
	bgu,pt	%xcc,	loop_3
	edge16l	%g6,	%i2,	%o2
	wr	%g0,	0x22,	%asi
	stwa	%g3,	[%l7 + 0x50] %asi
	membar	#Sync
loop_2:
	rdhpr	%hsys_tick_cmpr,	%i7
loop_3:
	rdpr	%tba,	%g5
	wrpr	%i1,	%l1,	%tick
	xnorcc	%o7,	%l0,	%l3
	popc	%l4,	%g7
	udivcc	%i6,	0x0782,	%g2
	popc	0x13CC,	%g1
	fmuld8sux16	%f7,	%f3,	%f10
	udivcc	%o5,	0x0E74,	%i3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%htba,	%g4
	wr	%g0,	0x0c,	%asi
	ldswa	[%l7 + 0x38] %asi,	%l2
	fcmpne16	%f2,	%f8,	%o4
	wr	%o3,	%o1,	%softint

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xD08, 	%hsys_tick_cmpr
	rdpr	%tl,	%o6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xB51, 	%hsys_tick_cmpr
	fpadd16	%f18,	%f8,	%f20

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xA82, 	%hsys_tick_cmpr
	edge8l	%g6,	%o2,	%i2
	wr	%i7,	%g3,	%set_softint
	fbu,a	%fcc1,	loop_4
	rd	%fprs,	%i1
	movcc	%xcc,	%g5,	%o7
	sdivx	%l1,	0x0BCB,	%l0
loop_4:
	fmovdneg	%icc,	%f3,	%f7
	bcs,a	%icc,	loop_5
	rdhpr	%htba,	%l3
	flushw
	movneg	%xcc,	%g7,	%i6
loop_5:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xE9D, 	%hsys_tick_cmpr
	subc	%g1,	%g2,	%i3
	wr	%l6,	%o5,	%set_softint
	rd	%y,	%g4
	movn	%xcc,	%i4,	%o4
	wrpr	%l2,	0x0E77,	%cwp
	rdhpr	%hsys_tick_cmpr,	%o1
	wr	%i0,	0x1E09,	%y
	rdhpr	%hpstate,	%o3
	alignaddrl	%o6,	%i5,	%o0
	std	%g6,	[%l7 + 0x18]
	sdivcc	%o2,	0x1B3E,	%l5
	bne	loop_6
	wrpr	%i7,	0x1C19,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	movcs	%icc,	%g5,	%g3
loop_6:
	rdpr	%cwp,	%l1
	stbar
	wrpr	%l0,	0x12FF,	%pil
	wrpr	%o7,	0x0BDB,	%cwp
	fnegd	%f2,	%f24

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x98F, 	%hsys_tick_cmpr
	fbule,a	%fcc2,	loop_7
	fmovdne	%icc,	%f6,	%f22
	rd	%fprs,	%l4
	rdhpr	%hsys_tick_cmpr,	%i6
loop_7:
	tg	%icc,	0x5
	movvs	%xcc,	%g1,	%i3
	wr	%g2,	0x12D6,	%y
	brlz	%g4,	loop_8
	taddcctv	%o5,	0x03AB,	%o4
	fmovdcc	%icc,	%f26,	%f17
	rdhpr	%htba,	%i4
loop_8:
	wrpr	%l2,	0x0D5B,	%cwp
	rdpr	%gl,	%i0
	fmovdle	%xcc,	%f2,	%f24
	rd	%ccr,	%o3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x0A3, 	%sys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x24F, 	%hsys_tick_cmpr
	wr	%o0,	%o1,	%y
	membar	0x4D

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xCAF, 	%hsys_tick_cmpr
	umul	%i7,	0x0C80,	%i2
	rdhpr	%hsys_tick_cmpr,	%l5
	rd	%sys_tick_cmpr,	%i1
	rd	%fprs,	%g3
	rdhpr	%hintp,	%l1
	udivx	%g5,	0x151B,	%l0
	rdhpr	%hpstate,	%o7
	edge8l	%g7,	%l3,	%i6
	wrpr	%g1,	%i3,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	wrpr	%g2,	%g4,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	sll	%i4,	%l6,	%i0
	movle	%xcc,	%o3,	%o6
	edge8n	%i5,	%o0,	%l2
	rd	%pc,	%o1
	nop
	setx	loop_9,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	wrpr	%g6,	%i7,	%cwp
	rd	%sys_tick_cmpr,	%o2
	fcmple32	%f16,	%f22,	%l5
loop_9:
	rd	%softint,	%i2
	fmul8x16al	%f15,	%f26,	%f4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fmuld8ulx16	%f30,	%f8,	%f0
	popc	0x1CF6,	%i1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x128, 	%hsys_tick_cmpr
	fmovsvc	%xcc,	%f8,	%f26
	tvc	%icc,	0x6
	wrpr	%g5,	%g7,	%pil
	rdhpr	%htba,	%l3
	addccc	%g1,	%i3,	%l4
	edge32ln	%i6,	%g2,	%g4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xB68, 	%tick_cmpr
	rdpr	%cwp,	%o4
	rdpr	%cleanwin,	%l6
	tneg	%xcc,	0x1
	wrpr	%i4,	0x1D58,	%cwp
	rdpr	%tba,	%o3
	wr	%o6,	%i0,	%ccr
	edge8	%o0,	%l2,	%i5
	movrlez	%g6,	0x07A,	%i7
	rd	%fprs,	%o2
	rdhpr	%hsys_tick_cmpr,	%o1
	wr	%l5,	0x13CB,	%set_softint
	rdpr	%otherwin,	%g3
	sth	%i2,	[%l7 + 0x78]
	array32	%l1,	%l0,	%o7
	wr	%i1,	%g5,	%set_softint

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x9B2, 	%hsys_tick_cmpr
	fbne,a	%fcc1,	loop_10
	rd	%pc,	%g1
	bg,a,pt	%icc,	loop_11
loop_10:
	rd	%tick_cmpr,	%l4
	rdhpr	%htba,	%i3
	sra	%g2,	0x11,	%g4
loop_11:
	rdhpr	%hsys_tick_cmpr,	%o5
	wrpr	%o4,	0x0BF2,	%pil
	wrpr	%i6,	0x12AC,	%pil
	lduh	[%l7 + 0x56],	%l6
	and	%o3,	%i4,	%i0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movvc	%xcc,	%o0,	%l2
	sdiv	%i5,	0x1B47,	%g6
	movge	%xcc,	%i7,	%o6
        wr    %g0,    0xe,    %pcr    ! changed.
	rd	%pc,	%o1
	movn	%xcc,	%i2,	%l1
	fmovse	%xcc,	%f19,	%f23
	wrpr	%l0,	%o7,	%tick
	rd	%pc,	%i1
	fnors	%f12,	%f23,	%f26
	rdpr	%tba,	%g5
	wrpr	%g3,	%g1,	%tick
	stbar

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	mulscc	%l4,	0x17F9,	%i3
	rdhpr	%hpstate,	%g2
	movg	%icc,	%g4,	%o5
	rdpr	%gl,	%i6
	rd	%tick_cmpr,	%o4
	rdhpr	%htba,	%l6
	rd	%ccr,	%i4
	bgu,a,pn	%icc,	loop_12
	rdpr	%cleanwin,	%i0
	wr	%g0,	0x23,	%asi
	stha	%o3,	[%l7 + 0x76] %asi
	membar	#Sync
loop_12:
	nop
	set	0x2C, %o1
	ldswa	[%l7 + %o1] 0x80,	%o0
	rd	%softint,	%i5
	rdhpr	%htba,	%i7
	set	0x60, %l5
	ldda	[%l7 + %l5] 0xeb,	%o6
	fmovd	%f6,	%f14
	rd	%tick_cmpr,	%l2
	array16	%o2,	%l5,	%o1
	edge16l	%l1,	%l0,	%i2
	fpadd32s	%f6,	%f25,	%f2
	rdpr	%tba,	%i1
	wr	%o7,	%g3,	%y
	fnegd	%f18,	%f30
	bleu,pn	%xcc,	loop_13
	nop
	set	0x74, %g6
	lduw	[%l7 + %g6],	%g1
	rdhpr	%hsys_tick_cmpr,	%g7
	sir	0x1DC3
loop_13:
	rdhpr	%htba,	%g5
	brlz	%l3,	loop_14
	wrpr	%i3,	%l4,	%cwp
	rdpr	%gl,	%g2
	rdpr	%cleanwin,	%o5
loop_14:
	wr	%g4,	%i6,	%y
	wrpr	%l6,	0x1F46,	%cwp
	wr	%g0,	0x18,	%asi
	sta	%f5,	[%l7 + 0x38] %asi
	wr	%o4,	%i4,	%sys_tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x0C5, 	%hsys_tick_cmpr
	bne,pt	%xcc,	loop_15
	tneg	%xcc,	0x7
	rdhpr	%hintp,	%o0
	fbu,a	%fcc0,	loop_16
loop_15:
	move	%icc,	%i5,	%g6
	fmovrslez	%i7,	%f14,	%f29
	movrne	%o6,	0x0D2,	%l2
loop_16:
	rd	%asi,	%l5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xE60, 	%tick_cmpr
	wrpr	%l1,	0x0CCA,	%cwp
	edge16	%i2,	%l0,	%i1
	rdhpr	%hpstate,	%g3
	rd	%softint,	%o7
	rdpr	%tba,	%g7
	rdhpr	%hintp,	%g5
	wrpr	%l3,	0x1765,	%tick
	wrpr	%i3,	0x034B,	%cwp
	andcc	%g1,	%g2,	%o5
	add	%l7,	0x40,	%l6
	wr	%g0,	0x18,	%asi
	casxa	[%l6] 0x18,	%l4,	%i6
	and	%g4,	%o4,	%i4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xB0E, 	%tick_cmpr
	movvc	%xcc,	%o0,	%o3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xDFF, 	%hsys_tick_cmpr
	rdhpr	%htba,	%g6
        wr    %g0,    0xe,    %pcr    ! changed.
	rd	%sys_tick_cmpr,	%i7
	wr	%l5,	0x005F,	%set_softint
	edge8	%o2,	%l1,	%o1
	rdhpr	%htba,	%l0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	rdpr	%pil,	%o7
	rd	%pc,	%g7
	wr 	%g0, 	0x6, 	%fprs
	movcs	%icc,	%i3,	%g1
	mulx	%g2,	0x1FC8,	%l3
	wr	%o5,	%l4,	%softint

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x5D4, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xB0A, 	%hsys_tick_cmpr
	tleu	%icc,	0x7
	bneg,pt	%xcc,	loop_17
	wr	%i4,	%o4,	%softint
	rdhpr	%htba,	%i0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_17:
	rdpr	%pil,	%o3
	movgu	%xcc,	%i5,	%l6
	wr	%o6,	%l2,	%sys_tick
	ldd	[%l7 + 0x40],	%g6
	rdhpr	%hpstate,	%l5
	rd	%pc,	%i7
	fbge	%fcc1,	loop_18
	rd	%y,	%l1
	bg,pt	%icc,	loop_19
	rdhpr	%hpstate,	%o1
loop_18:
	ldsw	[%l7 + 0x6C],	%l0
	rd	%softint,	%o2
loop_19:
	wrpr	%g3,	%o7,	%cwp
	edge16	%g7,	%i1,	%i2
	wrpr	%i3,	%g5,	%cwp
	umulcc	%g1,	0x12ED,	%g2
	rdpr	%cleanwin,	%o5
	rdhpr	%hintp,	%l3
	rdpr	%gl,	%i6
	edge16n	%l4,	%g4,	%o4
	andcc	%i0,	0x0314,	%i4
	wr 	%g0, 	0x4, 	%fprs
	rdpr	%wstate,	%o0
	rdhpr	%hpstate,	%i5
	wr 	%g0, 	0x7, 	%fprs
	tvs	%xcc,	0x1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr 	%g0, 	0x5, 	%fprs
	rdhpr	%hpstate,	%i7
	rdhpr	%hsys_tick_cmpr,	%l5
	addcc	%l1,	%l0,	%o2
	fsrc1	%f20,	%f12

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x63A, 	%sys_tick_cmpr
	movneg	%xcc,	%g7,	%g3
	rd	%asi,	%i3
	fmovda	%xcc,	%f8,	%f21
	wrpr	%i1,	0x14EF,	%cwp
	rdpr	%cleanwin,	%g5
	rdpr	%tl,	%g1
	wr	%g2,	%l3,	%softint
	array32	%i6,	%l4,	%g4
	edge32l	%o5,	%o4,	%i0
	rdpr	%cleanwin,	%i4
	fbl	%fcc3,	loop_20
	fmovsg	%icc,	%f5,	%f19
	rdpr	%pil,	%o0
	movvs	%xcc,	%i5,	%o3
loop_20:
	array8	%o6,	%l6,	%g6
	andcc	%i7,	0x16F4,	%l5
	rdpr	%otherwin,	%l2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x499, 	%hsys_tick_cmpr
	fpsub16s	%f5,	%f16,	%f16
	rdhpr	%hintp,	%o1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%fprs,	%l1
	umulcc	%g3,	%g7,	%i3
	addc	%i2,	0x1282,	%i1
	sub	%g1,	%g2,	%l3
	rdpr	%tl,	%g5
	edge16l	%l4,	%i6,	%o5
	st	%f1,	[%l7 + 0x24]
	flushw
	movn	%icc,	%o4,	%i0
	rd	%softint,	%g4
	tpos	%xcc,	0x6
	wr	%o0,	%i5,	%softint
	wr	%g0,	0x1d,	%asi
	stwa	%i4,	[%l7 + 0x2C] %asi
	rdhpr	%hintp,	%o6
	rdhpr	%hsys_tick_cmpr,	%o3
	rdpr	%tl,	%l6
	wr	%i7,	%l5,	%ccr
	wrpr	%g6,	0x09EA,	%tick
	ldsw	[%l7 + 0x6C],	%l2
	membar	0x4F
	rd	%y,	%o2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xA5E, 	%hsys_tick_cmpr
	rdpr	%otherwin,	%o7
	wr	%g0,	0x80,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	nop
	set	0x77, %g3
	stb	%g7,	[%l7 + %g3]
	wr	%g0,	0xe3,	%asi
	stxa	%g3,	[%l7 + 0x18] %asi
	membar	#Sync
	stx	%i2,	[%l7 + 0x08]
	rd	%sys_tick_cmpr,	%i3
	wr	%i1,	0x19DA,	%pic
	sdivcc	%g1,	0x079D,	%l3
	rdhpr	%hintp,	%g5
	rd	%y,	%l4
	wrpr	%i6,	0x00BA,	%tick
	ldsw	[%l7 + 0x70],	%o5
	movle	%icc,	%g2,	%o4
	smul	%i0,	0x1192,	%g4
	rdhpr	%hsys_tick_cmpr,	%o0
	wrpr	%i5,	0x0DB3,	%tick
	rdpr	%cwp,	%i4
	xnor	%o6,	0x0254,	%o3
	fmovrdne	%i7,	%f4,	%f14
	wr 	%g0, 	0x5, 	%fprs
	xnor	%l5,	0x1DDC,	%l2
	rdpr	%wstate,	%g6
	wr	%o1,	0x1954,	%sys_tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x735, 	%hsys_tick_cmpr
	wr	%o7,	0x0582,	%pic
	wr	%g0,	0x0c,	%asi
	ldsha	[%l7 + 0x2C] %asi,	%l0
	rdhpr	%hpstate,	%g3
	rdpr	%otherwin,	%i2
	fmul8ulx16	%f24,	%f30,	%f26
	fmovdg	%icc,	%f31,	%f22
	rdhpr	%hsys_tick_cmpr,	%g7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fpsub16	%f28,	%f8,	%f30
	wrpr	%g1,	0x1058,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	tgu	%xcc,	0x6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xBCA, 	%hsys_tick_cmpr
	rdhpr	%hintp,	%i6
	brgz	%l3,	loop_21
	wr	%g2,	%o4,	%pic

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%i0,	%o0,	%clear_softint
loop_21:
	bvc	loop_22
	rdpr	%gl,	%i5
	rd	%fprs,	%o6
	rdpr	%gl,	%o3
loop_22:
	wr	%i7,	%i4,	%clear_softint
	rd	%pc,	%l5
	fabsd	%f14,	%f24

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%htba,	%o2
	taddcctv	%o1,	%l1,	%o7
	rd	%sys_tick_cmpr,	%l0
	rdpr	%tl,	%g3
	tcc	%xcc,	0x7
	wrpr	%g7,	%i3,	%tick
	fmul8x16al	%f10,	%f30,	%f16
	rd	%softint,	%i1
	bn,pn	%icc,	loop_23
	rd	%y,	%g1
	ld	[%l7 + 0x50],	%f16
	mulscc	%g5,	0x01A8,	%l4
loop_23:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	xorcc	%g2,	%i6,	%o5
	wrpr	%o4,	%i0,	%pil
	rd	%sys_tick_cmpr,	%o0
	wr	%i5,	%g4,	%y
	rd	%fprs,	%o3
	wrpr	%o6,	%i4,	%pil
	rd	%pc,	%i7
	nop
	setx	loop_24,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	edge32ln	%l5,	%g6,	%l6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x1BC, 	%hsys_tick_cmpr
	edge8n	%o1,	%l1,	%o7
loop_24:
	nop
	set	0x7E, %i6
	lduha	[%l7 + %i6] 0x89,	%l2
	rd	%asi,	%l0
	rd	%tick_cmpr,	%i2
	rd	%tick_cmpr,	%g7
	rdpr	%tba,	%g3
	rdhpr	%hsys_tick_cmpr,	%i1
	tge	%icc,	0x3
	wr	%i3,	0x0668,	%clear_softint
	tpos	%xcc,	0x7
	wr	%g0,	0x1d,	%asi
	ldswa	[%l7 + 0x68] %asi,	%g1
	fcmpeq16	%f0,	%f2,	%l3
	fpsub16s	%f30,	%f28,	%f6
	wr	%g0,	0x80,	%asi
	stba	%g2,	[%l7 + 0x0D] %asi
	rdhpr	%hintp,	%i6
	rdpr	%gl,	%l4
	rdhpr	%hpstate,	%o5
	fnegd	%f8,	%f16

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%i5,	%g4,	%pil
	rdpr	%otherwin,	%o0
	subc	%o6,	0x079E,	%o3
	call	loop_25
	rdhpr	%hpstate,	%i7
	wr	%i4,	%g6,	%pic
	fbge	%fcc3,	loop_26
loop_25:
	wrpr	%l6,	0x1CCE,	%tick
	rdpr	%tl,	%l5
	wrpr	%o2,	%l1,	%tick
loop_26:
	rd	%tick_cmpr,	%o7
	wrpr	%o1,	%l2,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x3B0, 	%hsys_tick_cmpr
	brz	%i2,	loop_27
	taddcc	%g3,	0x1898,	%i1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%hsys_tick_cmpr,	%g5
loop_27:
	rdhpr	%hpstate,	%g1
	wr	%i3,	0x0C79,	%ccr
	rdpr	%tl,	%g2
	edge16ln	%i6,	%l3,	%o5
	rd	%ccr,	%i0
	sll	%o4,	0x10,	%i5
	fxor	%f8,	%f26,	%f16
	wr	%g4,	0x02C6,	%set_softint
	sub	%o0,	%l4,	%o6
	rd	%tick_cmpr,	%i7
	add	%i4,	%g6,	%o3
	alignaddr	%l6,	%o2,	%l1
	wrpr	%l5,	%o1,	%pil
	tl	%xcc,	0x0
	rd	%pc,	%l2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%wstate,	%g3
	taddcc	%l0,	%g7,	%g5
	orncc	%g1,	%i3,	%i1
	wrpr	%g2,	%l3,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%o5,	0x07A0,	%pic
	ldd	[%l7 + 0x30],	%o4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x850, 	%tick_cmpr
	rdhpr	%hintp,	%o6
	rdpr	%cwp,	%i7
	rdhpr	%hsys_tick_cmpr,	%o0
	movrgz	%g6,	0x37E,	%i4
	movn	%xcc,	%l6,	%o3
	rdhpr	%hintp,	%l1
	rdhpr	%hsys_tick_cmpr,	%l5
	sir	0x126A
	addcc	%o1,	%l2,	%o7
	wr	%i2,	%g3,	%softint

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%l0,	%g7,	%softint
	srl	%g1,	0x1E,	%g5
	rdhpr	%hsys_tick_cmpr,	%i3
	rd	%ccr,	%g2
	rd	%fprs,	%i1
	rd	%ccr,	%l3
	edge16ln	%i0,	%i6,	%o5
	wrpr	%g4,	0x19C7,	%cwp
	tpos	%xcc,	0x5
	rdhpr	%htba,	%o4
	rd	%pc,	%i5
	smulcc	%l4,	0x0EB7,	%i7
	wr	%o0,	0x1446,	%ccr
	wrpr	%o6,	%i4,	%pil
	wr	%g6,	%l6,	%pic

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x0F4, 	%hsys_tick_cmpr
	rdhpr	%hintp,	%l1
	wrpr	%l5,	0x12EB,	%cwp
	ta	%icc,	0x6
	movrne	%l2,	%o1,	%i2
	alignaddrl	%g3,	%o2,	%l0
	rd	%tick_cmpr,	%o7
	add	%l7,	0x70,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%g1
	casa	[%l6] 0x81,	%g1,	%g7
	rd	%pc,	%g5
	movrne	%g2,	%i1,	%l3
	rdpr	%cleanwin,	%i3
	addc	%i6,	0x0636,	%i0
	wrpr	%g4,	0x0733,	%cwp
	rdpr	%cleanwin,	%o5
	wrpr	%l4,	0x0640,	%cwp
	rd	%softint,	%o4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x0CA, 	%hsys_tick_cmpr
	wr	%o0,	0x019D,	%set_softint
	brlz	%i4,	loop_28
	rd	%pc,	%o6
	rdhpr	%hintp,	%g6
	tl	%xcc,	0x7
loop_28:
	rd	%ccr,	%o3
	wrpr	%l6,	0x06DE,	%tick
	taddcc	%l1,	0x18A5,	%l2
	rdhpr	%hintp,	%o1
	wrpr	%i2,	%g3,	%cwp
	rdpr	%otherwin,	%l5
	rd	%sys_tick_cmpr,	%l0
	rd	%tick_cmpr,	%o7
	rdhpr	%htba,	%o2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	movl	%xcc,	%g7,	%i1
	rd	%sys_tick_cmpr,	%g2
	rd	%ccr,	%l3
	rd	%softint,	%i6
	for	%f2,	%f4,	%f4
	tsubcctv	%i3,	0x1686,	%i0
	lduh	[%l7 + 0x4A],	%g4
	rd	%pc,	%o5
	rdhpr	%hpstate,	%l4
	rdpr	%cleanwin,	%i5
	movre	%o4,	%i7,	%i4
	rd	%tick_cmpr,	%o0
	rd	%sys_tick_cmpr,	%o6
	rd	%sys_tick_cmpr,	%g6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x5D7, 	%hsys_tick_cmpr
	wrpr	%l1,	%l2,	%cwp
	flush	%l7 + 0x28
	tpos	%xcc,	0x0
	tcc	%xcc,	0x3
	move	%xcc,	%o3,	%o1
	sll	%i2,	%g3,	%l0
	rdpr	%cwp,	%l5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x04D, 	%hsys_tick_cmpr
	subc	%o7,	0x1061,	%g5
	wrpr	%g7,	%i1,	%cwp
	rdpr	%gl,	%g2
	rdhpr	%hpstate,	%i6
	rdpr	%otherwin,	%i3
	tsubcctv	%i0,	0x13C1,	%g4
	rdhpr	%hpstate,	%o5
	rd	%sys_tick_cmpr,	%l3
	set	0x20, %g1
	prefetcha	[%l7 + %g1] 0x1c,	 0x3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%i4,	0x0639,	%pil
	fbl	%fcc0,	loop_29
	tle	%icc,	0x0
	wrpr	%o0,	%i7,	%cwp
	wr	%g6,	%o6,	%ccr
loop_29:
	bneg,pt	%xcc,	loop_30
	rdhpr	%hintp,	%l6
	tvs	%icc,	0x5
	rdhpr	%hsys_tick_cmpr,	%l1
loop_30:
	wrpr	%o3,	%o1,	%tick
	fmovrdgz	%l2,	%f12,	%f22
	flushw
	fmovsne	%xcc,	%f22,	%f25
	movcc	%xcc,	%i2,	%l0
	wr	%g3,	0x137D,	%ccr
	wr	%o2,	0x1B79,	%y
	tg	%xcc,	0x7
	wr 	%g0, 	0x7, 	%fprs
	tcc	%xcc,	0x0
	rdhpr	%hpstate,	%o7
	wrpr	%g5,	0x09B8,	%cwp
	ldsw	[%l7 + 0x60],	%g7
	alignaddr	%g1,	%g2,	%i1
	wr	%i6,	%i3,	%softint
	wrpr	%i0,	%g4,	%tick
	rd	%ccr,	%o5
	and	%i5,	0x14E1,	%l3
	fmovsne	%icc,	%f17,	%f15
	rdhpr	%hintp,	%l4
	edge32n	%i4,	%o4,	%o0
	rdhpr	%hpstate,	%i7
	fcmpgt32	%f14,	%f18,	%o6
	lduw	[%l7 + 0x38],	%l6
	wr	%l1,	0x0D32,	%sys_tick
	wrpr	%g6,	%o3,	%pil
	andn	%l2,	0x180B,	%i2
	rd	%ccr,	%l0
	te	%icc,	0x7
	bge,pn	%icc,	loop_31
	wrpr	%o1,	0x1E06,	%pil
	fmovdl	%xcc,	%f2,	%f22
loop_31:
	wrpr	%l5,	%o7,	%tick
	rd	%pc,	%g7
	xnorcc	%g5,	0x1837,	%g1
	movcs	%xcc,	%i1,	%i6
	rdhpr	%htba,	%g2
	rdpr	%gl,	%i0
	faligndata	%f2,	%f12,	%f22
	sdivcc	%g4,	0x064F,	%i3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xD74, 	%hsys_tick_cmpr
	rdhpr	%hintp,	%l3
	fmuld8ulx16	%f26,	%f19,	%f18
	sra	%o5,	0x09,	%l4
	tvs	%xcc,	0x1
	wr	%o4,	0x1AC7,	%sys_tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%sys_tick_cmpr,	%i7
	set	0x10, %l2
	ldda	[%l7 + %l2] 0x24,	%o6
	rdhpr	%hintp,	%o0
	rd	%softint,	%l6
	stb	%g6,	[%l7 + 0x25]

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xC08, 	%hsys_tick_cmpr
	umul	%l2,	%i2,	%o1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x7D6, 	%hsys_tick_cmpr
	fmovrde	%o7,	%f22,	%f22
	xnorcc	%g3,	%o2,	%g7
	rdhpr	%hsys_tick_cmpr,	%g5
	rd	%fprs,	%i1
	movrlez	%i6,	0x1BC,	%g1
	ldx	[%l7 + 0x58],	%g2
	taddcc	%i0,	0x0C88,	%g4
	fxnor	%f24,	%f22,	%f18
	wr	%i5,	0x0FF0,	%softint
	addcc	%l3,	%i3,	%o5
	fbue,a	%fcc2,	loop_32
	movleu	%icc,	%l4,	%o4
	fbule	%fcc1,	loop_33
	addc	%i7,	%i4,	%o6
loop_32:
	rdhpr	%hpstate,	%o0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_33:
	rdhpr	%hintp,	%l1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xFF0, 	%hsys_tick_cmpr
	wrpr	%i2,	%o1,	%tick
	wr	%l0,	0x0FA1,	%y
	rd	%pc,	%l5
	umul	%g6,	0x1932,	%o7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xD68, 	%hsys_tick_cmpr
	wr	%g5,	%i1,	%set_softint
	fzero	%f26
	fxnors	%f17,	%f9,	%f6
	brgz,a	%g7,	loop_34
	rdhpr	%htba,	%g1
	rd	%pc,	%g2
	fbl	%fcc3,	loop_35
loop_34:
	rdpr	%gl,	%i0
	edge16ln	%i5,	%l3,	%g4
	tge	%icc,	0x0
loop_35:
	fcmped	%fcc1,	%f2,	%f14
	rdpr	%otherwin,	%o5
	rd	%sys_tick_cmpr,	%i3
	srlx	%o4,	0x0B,	%i7
	wr	%l4,	0x0129,	%pic
	fmovs	%f16,	%f16
	faligndata	%f26,	%f12,	%f26
	wrpr	%l6,	0x1EFE,	%cwp
	rdpr	%wstate,	%o3
	wrpr	%l1,	%o0,	%cwp
	fnot1s	%f11,	%f4
	wrpr	%i2,	%l2,	%pil
	movgu	%xcc,	%o1,	%l5
	rdhpr	%hintp,	%g6
	srax	%o7,	%l0,	%o2
	rd	%sys_tick_cmpr,	%g5
	tcc	%xcc,	0x7
	wr	%g3,	0x11E6,	%softint
	ldx	[%l7 + 0x48],	%i6
	fnors	%f14,	%f22,	%f29
	fmovrsne	%g7,	%f11,	%f27
	bleu	loop_36
	tge	%xcc,	0x6
	fmovdvc	%xcc,	%f4,	%f28

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xDDC, 	%hsys_tick_cmpr
loop_36:
	fmul8sux16	%f22,	%f14,	%f22
	rd	%ccr,	%g2
	rdhpr	%hsys_tick_cmpr,	%i1
	edge8n	%i0,	%l3,	%g4
	andncc	%i5,	%o4,	%i7
	rdhpr	%hintp,	%l4
	wrpr	%i3,	0x09D1,	%cwp
	sethi	0x1D71,	%o6
	fmovdge	%xcc,	%f8,	%f26

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%htba,	%l6
	bg,a	loop_37
	rdhpr	%hintp,	%o3
	ldsw	[%l7 + 0x54],	%o0
	wr	%i2,	%l2,	%pic
loop_37:
	umulcc	%l1,	%o1,	%g6
	tge	%xcc,	0x2
	wrpr	%o7,	0x11A5,	%tick
	fxnor	%f24,	%f22,	%f4
	wrpr	%l5,	%o2,	%pil
	edge8	%l0,	%g3,	%g5
	wr	%i6,	%g1,	%softint
	udivx	%g7,	0x07DD,	%i1
	umul	%i0,	0x0DA7,	%g2
	rdpr	%cleanwin,	%l3
	mulx	%g4,	0x0292,	%o5
	fnor	%f22,	%f28,	%f28
	alignaddr	%i7,	%o4,	%i3
	rd	%fprs,	%l4
	wrpr	%o6,	0x0712,	%tick
        wr    %g0,    0xe,    %pcr    ! changed.
	fbule,a	%fcc3,	loop_38
	rd	%asi,	%o3
	fbge	%fcc1,	loop_39
	wrpr	%o0,	%i2,	%cwp
loop_38:
	rd	%ccr,	%l2
	rd	%pc,	%o1
loop_39:
	wrpr	%g6,	0x1498,	%tick
	edge32l	%o7,	%l1,	%o2
	bleu,a,pn	%xcc,	loop_40
	subcc	%l5,	0x0AE6,	%g3
	fmovdge	%xcc,	%f2,	%f23
	subcc	%l0,	0x0AC8,	%g5
loop_40:
	rd	%sys_tick_cmpr,	%i6
	tsubcctv	%g7,	%i1,	%i0
	sdiv	%g1,	0x02A8,	%g2
	movneg	%icc,	%l3,	%o5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xD77, 	%hsys_tick_cmpr
	tcc	%icc,	0x0
	rdpr	%tba,	%o4
	rdpr	%gl,	%i3
	smul	%l4,	%o6,	%i7
	edge32l	%l6,	%o3,	%i4
	bcc,a	loop_41
	wr	%i2,	%o0,	%ccr
	rd	%softint,	%o1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_41:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	movvc	%icc,	%l1,	%o2
	fbl	%fcc0,	loop_42
	rd	%sys_tick_cmpr,	%l5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	sllx	%l2,	0x06,	%l0
loop_42:
	rd	%tick_cmpr,	%g5
	fsrc2s	%f24,	%f30

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	taddcc	%i6,	%i1,	%g1
	edge32ln	%i0,	%g2,	%l3
	alignaddr	%g4,	%i5,	%o4
	wrpr	%o5,	0x18DF,	%pil
	wrpr	%l4,	%i3,	%tick
	wr	%o6,	0x1F41,	%clear_softint
	wrpr	%i7,	0x0207,	%pil
	rd	%pc,	%o3
	wrpr	%l6,	%i4,	%tick
	rdhpr	%hintp,	%o0
	srax	%o1,	%i2,	%o7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xDFF, 	%hsys_tick_cmpr
	wr	%l1,	%g3,	%ccr
	alignaddr	%l2,	%l5,	%g5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fcmpne32	%f2,	%f24,	%i1
	wr 	%g0, 	0x7, 	%fprs
	fbge	%fcc1,	loop_43
	fmovdle	%xcc,	%f23,	%f4
	wrpr	%l0,	%l3,	%pil
	movrne	%g4,	0x20D,	%g2
loop_43:
	wr	%i5,	0x1608,	%softint
	rdpr	%wstate,	%o4
	wr	%l4,	%o5,	%softint
	rdhpr	%hpstate,	%i3
	rdhpr	%hpstate,	%o6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%cwp,	%o3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x4F2, 	%hsys_tick_cmpr
	rdpr	%gl,	%i4
	tneg	%icc,	0x3
        wr    %g0,    0xe,    %pcr    ! changed.
	alignaddrl	%o7,	%o2,	%g6
	tleu	%icc,	0x7
	rdhpr	%hpstate,	%l1
        wr    %g0,    0xe,    %pcr    ! changed.

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x5F2, 	%tick_cmpr
	rdhpr	%hsys_tick_cmpr,	%g5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x7CF, 	%hsys_tick_cmpr
	udivcc	%g7,	0x0AD6,	%i0
	sir	0x06D4
	addccc	%l0,	0x1E7C,	%g2
	mova	%icc,	%i5,	%o4
	set	0x13, %l1
	ldsba	[%l7 + %l1] 0x80,	%g4
	edge8ln	%l4,	%o5,	%i3
	rd	%tick_cmpr,	%o6
	rd	%softint,	%i7
	movneg	%icc,	%o3,	%l6
	rdhpr	%hsys_tick_cmpr,	%i4
	alignaddr	%o1,	%o0,	%o7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x6E3, 	%hsys_tick_cmpr
	rdpr	%otherwin,	%g6
	rd	%pc,	%l1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x4BD, 	%sys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%g5,	%g1,	%tick
	wrpr	%i1,	0x0B9F,	%cwp
	rd	%pc,	%g7
	rd	%pc,	%l3
	wrpr	%g2,	%l0,	%pil
	wr	%i5,	0x1EDF,	%clear_softint
	wrpr	%o4,	%g4,	%tick
	wrpr	%o5,	%l4,	%tick
	rd	%pc,	%o6
	rd	%asi,	%i3
	wr 	%g0, 	0x6, 	%fprs
	fmovs	%f23,	%f9
	ta	%xcc,	0x3
	rdhpr	%htba,	%l6
	rdpr	%cleanwin,	%i4
	rdhpr	%hsys_tick_cmpr,	%o1
	tgu	%icc,	0x4
	ld	[%l7 + 0x28],	%f6
	fandnot1	%f0,	%f0,	%f14
	alignaddr	%o0,	%o7,	%i7
	rd	%sys_tick_cmpr,	%i2
	rdhpr	%hpstate,	%g6
	fmovdge	%icc,	%f15,	%f2
	rd	%sys_tick_cmpr,	%o2
        wr    %g0,    0xe,    %pcr    ! changed.
	rdpr	%tba,	%l5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x7A3, 	%tick_cmpr
	rdhpr	%hsys_tick_cmpr,	%g1
	wr	%i1,	%g5,	%softint

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%g2,	0x1CCE,	%ccr
	rd	%softint,	%l0
	fands	%f11,	%f21,	%f25
	rdhpr	%hsys_tick_cmpr,	%i0
	ldsh	[%l7 + 0x3C],	%i5
	wrpr	%g4,	0x0C46,	%pil
	fnegs	%f26,	%f8
	wrpr	%o5,	%o4,	%tick
	fsrc2	%f22,	%f2
	wr	%l4,	%i3,	%sys_tick
	wrpr	%o3,	0x0989,	%tick
	rdpr	%gl,	%o6
	stb	%i4,	[%l7 + 0x7C]
	wr	%o1,	0x1582,	%y
        wr    %g0,    0xe,    %pcr    ! changed.
	movl	%xcc,	%o7,	%o0
	wrpr	%i7,	0x0031,	%pil
	rdpr	%cleanwin,	%i2
	rd	%softint,	%o2
	swap	[%l7 + 0x68],	%g6
	subc	%l1,	0x1BE8,	%l5
	rdhpr	%htba,	%i6
	movcc	%icc,	%g3,	%g1
	fexpand	%f15,	%f30
	rdpr	%pil,	%i1
	rd	%softint,	%l2
	xorcc	%g5,	0x0626,	%l3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xAC0, 	%hsys_tick_cmpr
	wrpr	%g2,	0x1D1A,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	rd	%ccr,	%o5
	pdist	%f4,	%f16,	%f0
	addccc	%o4,	0x0394,	%l4
	rd	%tick_cmpr,	%i3
	rdhpr	%hsys_tick_cmpr,	%o3
	wrpr	%i4,	0x0FE0,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	movg	%xcc,	%o0,	%i7
	wrpr	%i2,	%o2,	%cwp
	rdpr	%otherwin,	%g6
	wrpr	%o1,	%l5,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xBA3, 	%tick_cmpr
	taddcctv	%g3,	%g1,	%l1
	wr	%l2,	0x149D,	%pic
	rd	%fprs,	%g5
	fbge,a	%fcc1,	loop_44
	rd	%y,	%i1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x901, 	%hsys_tick_cmpr
	rdpr	%wstate,	%g7
loop_44:
	rdhpr	%hsys_tick_cmpr,	%i0
	tsubcctv	%g2,	%o5,	%o4
	tvs	%xcc,	0x1
	tcc	%xcc,	0x0
	wrpr	%l4,	%i3,	%tick
	rdpr	%cleanwin,	%g4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xA04, 	%hsys_tick_cmpr
	wrpr	%o3,	0x1B2B,	%tick
	fmovse	%icc,	%f22,	%f2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x7C9, 	%hsys_tick_cmpr
	rdhpr	%htba,	%o6
	rd	%tick_cmpr,	%o7
	fsrc1s	%f18,	%f10
	rd	%pc,	%o0
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 0:
!
!	Type l   	: 51
!	Type a   	: 581
!	Type cti   	: 44
!	Type x   	: 20
!	Type f   	: 73
!	Type i   	: 231
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


	EXIT_GOOD	/* test finish  */

/************************************************************************
   Test case data start
 ************************************************************************/
.data
user_data_start:
scratch_area:
.word 0xADAF2728
.word 0x81F69C28
.word 0xD78138A8
.word 0xCD6BF964
.word 0xF499036D
.word 0xA257C1B1
.word 0xD6B1558D
.word 0xC1AEB835
.word 0x6E59A533
.word 0x127A2876
.word 0xF17C881D
.word 0xD8379B83
.word 0xB52C1052
.word 0xDA0D1E47
.word 0x42E84BD0
.word 0xF9CCBB0B
.word 0xAF0504B3
.word 0x39E4CE7A
.word 0x3C62FA7C
.word 0xBBED9952
.word 0x8C6D3121
.word 0xEACF3A57
.word 0xA4CABF19
.word 0x9939028E
.word 0x55A40C25
.word 0x0824754D
.word 0x059A2C08
.word 0x20B85D21
.word 0x4D7B9B1E
.word 0xED22C921
.word 0xDF1A24B8
.word 0x6E4AAAC5
.word 0x9461AC28
.word 0xE5BDF5B6
.word 0xD4052A37
.word 0xDE7A5B10
.word 0x09E44E0B
.word 0x77C4C57C
.word 0x9BE5EF1F
.word 0xE4358642
.word 0x6E4D2530
.word 0xFB44EB50
.word 0xFD0FCF11
.word 0xD9B3503A
.word 0xE33F9907
.word 0x98B0B1B3
.word 0xAC8787E7
.word 0xFBE8496B
.word 0xB7BFA9F7
.word 0xCB11DDF3
.word 0x9EECBD69
.word 0xDA68765D
.word 0xAB4CFC40
.word 0x8C5E9C8E
.word 0xC26C79DE
.word 0x01EF1DE7
.word 0xB42DA45C
.word 0x0C7FF769
.word 0x02B55458
.word 0x9FE71C60
.word 0xAFBB6671
.word 0x9079BAA1
.word 0xE55730F2
.word 0x247CD664
.end
