/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: isa3_asr_pr_hpr_f7.s
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
.ident "FOCUSCASE: focus.pm,v 1.1 2003/04/23 17:53:39 somePerson Exp somePerson $ ../focus/spc_basic_isa3.pl FOCUS_SEED=24717195"
.ident "BY gg137162 ON Tue Sep  9 16:38:43 CDT 2003"
.ident "Using Instruction Hash for Focus :$Id: isa3_asr_pr_hpr_f7.s,v 1.2 2007/07/05 21:59:54 drp Exp $"
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
	set	0x2,	%g1
	set	0xF,	%g2
	set	0x3,	%g3
	set	0x0,	%g4
	set	0x7,	%g5
	set	0x7,	%g6
	set	0xE,	%g7
	!# Input registers
	set	-0x2,	%i0
	set	-0x4,	%i1
	set	-0x9,	%i2
	set	-0x3,	%i3
	set	-0xC,	%i4
	set	-0x4,	%i5
	set	-0xD,	%i6
	set	-0x7,	%i7
	!# Local registers
	set	0x478A818D,	%l0
	set	0x4BADB52C,	%l1
	set	0x611AC5B7,	%l2
	set	0x6E1A2E3C,	%l3
	set	0x03107077,	%l4
	set	0x19A31DE2,	%l5
	set	0x7B2A18B4,	%l6
	!# Output registers
	set	-0x04F3,	%o0
	set	0x03A2,	%o1
	set	0x0AB5,	%o2
	set	0x1F77,	%o3
	set	-0x17A2,	%o4
	set	-0x0CD5,	%o5
	set	0x04A9,	%o6
	set	-0x0EBB,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0xA3FD4CAC4022B391)
	INIT_TH_FP_REG(%l7,%f2,0x6470FD6B6AAB120D)
	INIT_TH_FP_REG(%l7,%f4,0x7CE6428F9F5CCF26)
	INIT_TH_FP_REG(%l7,%f6,0x23E9EEFC8E57A68E)
	INIT_TH_FP_REG(%l7,%f8,0x763850AC174345DB)
	INIT_TH_FP_REG(%l7,%f10,0xCE75276BB07FED1D)
	INIT_TH_FP_REG(%l7,%f12,0xEF5FDCD42A7408D1)
	INIT_TH_FP_REG(%l7,%f14,0x404D6A82D3262A84)
	INIT_TH_FP_REG(%l7,%f16,0x1392DA03FA797D4D)
	INIT_TH_FP_REG(%l7,%f18,0xBFE13B0B5DDE416C)
	INIT_TH_FP_REG(%l7,%f20,0x6159C43001C9ECDE)
	INIT_TH_FP_REG(%l7,%f22,0xDDC6CF5A8AB6B7F6)
	INIT_TH_FP_REG(%l7,%f24,0x6210385062011878)
	INIT_TH_FP_REG(%l7,%f26,0xB246989BD15D823F)
	INIT_TH_FP_REG(%l7,%f28,0x8E483F08741F926D)
	INIT_TH_FP_REG(%l7,%f30,0x918B1BD42AEE9AC0)
	!# Other state
	
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xD35, 	%hsys_tick_cmpr


	!# Execute Main Diag ..

	wr	%g6,	%g3,	%sys_tick
	wr	%i2,	%o3,	%clear_softint
	fexpand	%f23,	%f6
	rdhpr	%hsys_tick_cmpr,	%i6
	tsubcctv	%g1,	%o0,	%l4
	andn	%l2,	%i1,	%i0
	wr	%g4,	%o1,	%sys_tick
	rdhpr	%hintp,	%i7
	wrpr	%o7,	%l5,	%pil
	rd	%softint,	%l3
	umul	%i3,	0x02E6,	%l6
	rd	%y,	%o2
	wr	%g7,	%o6,	%set_softint
	xnor	%g2,	%i5,	%i4
	fnors	%f23,	%f1,	%f12
	rd	%pc,	%l0
	ldd	[%l7 + 0x40],	%o4
	udivcc	%l1,	0x1DDC,	%g5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	wr	%i2,	0x1F54,	%clear_softint
	wrpr	%o3,	%i6,	%cwp
	rdhpr	%hsys_tick_cmpr,	%o5
	faligndata	%f22,	%f12,	%f24
	rdpr	%pil,	%o0
	fmul8x16au	%f9,	%f9,	%f20
	fbg	%fcc1,	loop_1
	rdpr	%cansave,	%l4
	rd	%tick_cmpr,	%g1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x590, 	%hsys_tick_cmpr
loop_1:
	wr	%g4,	%o1,	%y
	fbule	%fcc0,	loop_2
	tneg	%icc,	0x0
	tvs	%xcc,	0x6
	rd	%fprs,	%i7
loop_2:
	wrpr	%o7,	0x127E,	%cwp
	tneg	%xcc,	0x4
	movvs	%icc,	%l2,	%l3
	rd	%ccr,	%l5
	rdhpr	%hsys_tick_cmpr,	%i3
	array32	%o2,	%l6,	%g7
	st	%f31,	[%l7 + 0x0C]
	orcc	%g2,	%o6,	%i5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sth	%l0,	[%l7 + 0x32]
	rdpr	%otherwin,	%i4
	rdpr	%cleanwin,	%o4
	wr	%g5,	0x0B82,	%clear_softint
	wr	%l1,	0x1BE5,	%ccr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x54F, 	%hsys_tick_cmpr
	rdpr	%gl,	%g3
	edge8n	%i2,	%o3,	%o5
	wrpr	%o0,	0x1C02,	%pil
	xorcc	%i6,	%l4,	%i1
	wrpr	%g1,	0x18A0,	%cwp
	fpack32	%f22,	%f0,	%f2
	rdpr	%gl,	%g4
	rdpr	%tba,	%o1
	rdhpr	%hpstate,	%i0
	wr	%o7,	%l2,	%clear_softint
	rdpr	%canrestore,	%l3
	rd	%softint,	%i7
	wrpr	%i3,	0x144C,	%cwp
	rd	%asi,	%o2
	subcc	%l6,	%g7,	%l5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fmul8x16	%f16,	%f0,	%f4
	wr	%l0,	%i4,	%set_softint
	fcmpes	%fcc0,	%f20,	%f1
	fnand	%f0,	%f12,	%f26
	alignaddrl	%o4,	%i5,	%l1
	andncc	%g5,	%g6,	%i2
	rdhpr	%hintp,	%o3
	brlz	%o5,	loop_3
	fmovsvs	%icc,	%f7,	%f1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	set	0x1C, %l2
	swapa	[%l7 + %l2] 0x10,	%o0
loop_3:
	wr	%i6,	%l4,	%ccr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xF05, 	%hsys_tick_cmpr
	sethi	0x05A7,	%i1
	set	0x58, %o7
	stda	%o0,	[%l7 + %o7] 0x23
	membar	#Sync
	rdpr	%cwp,	%i0
	rdhpr	%htba,	%o7
	wr	%g4,	0x151F,	%set_softint
	fmovs	%f2,	%f3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	flushw
	rdpr	%wstate,	%l2
	edge32l	%i7,	%o2,	%l6
	movn	%icc,	%i3,	%g7
	rdpr	%wstate,	%l5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x47C, 	%hsys_tick_cmpr
	rd	%tick_cmpr,	%l0
	wrpr	%i4,	0x0C74,	%tick
	wrpr	%i5,	0x08E2,	%cwp
	wrpr	%l1,	0x10EE,	%tick
	fbg,a	%fcc3,	loop_4
	tge	%xcc,	0x4
	wrpr	%o4,	0x0E63,	%pil
	rd	%sys_tick_cmpr,	%g5
loop_4:
	sethi	0x1204,	%i2
	wrpr	%g6,	0x169F,	%tick
	edge8ln	%o3,	%o5,	%o0
	rdpr	%canrestore,	%i6
	prefetch	[%l7 + 0x7C],	 0x2
	wrpr	%g3,	0x1102,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%htba,	%g1
	sub	%o1,	%i1,	%i0
	wr	%o7,	%g4,	%clear_softint
	udivcc	%l2,	0x0B9D,	%l3
	movleu	%xcc,	%o2,	%l6
	rdhpr	%hintp,	%i3
	rdhpr	%htba,	%g7
	wrpr	%i7,	%l5,	%tick
	rdpr	%cleanwin,	%g2
	movne	%xcc,	%l0,	%i4
	wr	%i5,	%l1,	%clear_softint
	edge8l	%o4,	%o6,	%g5
	tcs	%xcc,	0x6
	tn	%xcc,	0x7
	bne	%xcc,	loop_5
	fmovrdgz	%i2,	%f14,	%f4
	sdivx	%g6,	0x0DD0,	%o5
	ldsh	[%l7 + 0x3A],	%o0
loop_5:
	rdpr	%pil,	%i6
	rdpr	%canrestore,	%o3
	rdhpr	%hintp,	%l4
	rdpr	%wstate,	%g3
	subccc	%g1,	%o1,	%i0
	set	0x72, %g4
	stha	%i1,	[%l7 + %g4] 0x2a
	membar	#Sync
	fabsd	%f30,	%f2
	rdpr	%tba,	%o7
	fbne	%fcc3,	loop_6
	rd	%tick_cmpr,	%l2
	tne	%icc,	0x3
	rd	%softint,	%l3
loop_6:
	movleu	%xcc,	%g4,	%o2
	rdhpr	%hpstate,	%l6
	rdpr	%pil,	%g7
	movl	%icc,	%i3,	%l5
	movleu	%icc,	%g2,	%i7
	fmovrsgz	%l0,	%f4,	%f26
	or	%i4,	%l1,	%o4
	rdpr	%canrestore,	%o6
	rdhpr	%hpstate,	%g5
	wrpr	%i2,	0x0947,	%pil
	fbule,a	%fcc2,	loop_7
	wrpr	%g6,	0x070E,	%pil
	udivx	%i5,	0x18A9,	%o5
	fbul	%fcc0,	loop_8
loop_7:
	fnot2s	%f16,	%f19
	rd	%sys_tick_cmpr,	%i6
	wrpr	%o0,	%l4,	%pil
loop_8:
	rdpr	%tba,	%o3
	rd	%sys_tick_cmpr,	%g3
	ldub	[%l7 + 0x3E],	%o1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xE67, 	%hsys_tick_cmpr
	rd	%tick_cmpr,	%i1
	rdhpr	%htba,	%o7
	movvs	%icc,	%l2,	%l3
	stx	%o2,	[%l7 + 0x68]
	fornot1	%f0,	%f20,	%f18
	movpos	%xcc,	%g4,	%l6
	movrlz	%i3,	%l5,	%g7
	rd	%pc,	%i7
	rdhpr	%hsys_tick_cmpr,	%l0
	rdhpr	%hsys_tick_cmpr,	%g2
	fmovrdgez	%l1,	%f6,	%f14
	edge32ln	%o4,	%i4,	%g5
	wr	%i2,	0x0DAE,	%ccr
	ldub	[%l7 + 0x15],	%o6
	fmul8x16au	%f3,	%f31,	%f28
	rdhpr	%hpstate,	%g6
	wr	%g0,	0x0c,	%asi
	prefetcha	[%l7 + 0x28] %asi,	 0x3
	fcmpgt32	%f26,	%f26,	%i6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x2F5, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%g3,	0x0568,	%softint
	bvs,pt	%icc,	loop_9
	wr	%o0,	%g1,	%sys_tick
	fnegs	%f1,	%f9
	tsubcctv	%o1,	%i0,	%o7
loop_9:
	wrpr	%i1,	%l2,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x4D4, 	%hsys_tick_cmpr
	wrpr	%l3,	0x0E0E,	%cwp
	wrpr	%g4,	%i3,	%pil
	wr	%l5,	0x0AC4,	%set_softint

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%ccr,	%i7
	fmovspos	%xcc,	%f23,	%f26
	rdhpr	%htba,	%l0
	wrpr	%o4,	%i4,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%hintp,	%o6
	wrpr	%g7,	%i5,	%cwp
	movl	%xcc,	%i6,	%g6
	rdhpr	%hsys_tick_cmpr,	%o5
	nop
	setx	loop_10,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	bshuffle	%f18,	%f24,	%f12
	bshuffle	%f2,	%f2,	%f22
	rdhpr	%hpstate,	%o3
loop_10:
	rd	%asi,	%l4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xDDA, 	%hsys_tick_cmpr
	fandnot1s	%f24,	%f6,	%f15
	rd	%softint,	%o1
	rdhpr	%hpstate,	%o0
	rd	%ccr,	%i0
	rd	%tick_cmpr,	%o7
	fandnot1	%f18,	%f6,	%f20
	rdpr	%canrestore,	%l2
	wrpr	%o2,	0x0F95,	%pil
	tleu	%xcc,	0x6
	sllx	%i1,	0x17,	%l3
	rdhpr	%hpstate,	%g4
	wr	%i3,	%l5,	%pic

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xA21, 	%hsys_tick_cmpr
	rd	%sys_tick_cmpr,	%i7
	srl	%l1,	0x13,	%o4
	wrpr	%g2,	%g5,	%tick
	wrpr	%i4,	0x0703,	%tick
	edge32	%i2,	%o6,	%g7
	tne	%xcc,	0x1
	wrpr	%i5,	%i6,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xE67, 	%sys_tick_cmpr
	movl	%xcc,	%g3,	%l4
	rdpr	%canrestore,	%o1
	rdhpr	%hpstate,	%o0
	rdpr	%gl,	%i0
	fandnot1	%f12,	%f8,	%f14
	set	0x20, %i2
	ldda	[%l7 + %i2] 0x2b,	%g0
	fmovdne	%icc,	%f5,	%f12
	fmovs	%f11,	%f11
	rdpr	%gl,	%l2
	fmovdl	%xcc,	%f5,	%f3
	rdhpr	%hsys_tick_cmpr,	%o2
	rd	%y,	%o7
	rd	%sys_tick_cmpr,	%i1
	wrpr	%l3,	0x1676,	%tick
	rdhpr	%hintp,	%i3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xEF9, 	%hsys_tick_cmpr
	fxnor	%f26,	%f24,	%f14
	xnorcc	%l5,	%l1,	%o4
	popc	0x0123,	%i7
	bl,a	%icc,	loop_11
	tcc	%xcc,	0x6
	rdhpr	%htba,	%g5
	wrpr	%i4,	0x1C05,	%tick
loop_11:
	tpos	%xcc,	0x6
	rdpr	%cleanwin,	%i2
	rdhpr	%hsys_tick_cmpr,	%o6
	fmovdg	%xcc,	%f11,	%f8
	fbe,a	%fcc3,	loop_12
	movvs	%xcc,	%g2,	%i5
	te	%xcc,	0x4
	rd	%y,	%g7
loop_12:
	tne	%xcc,	0x2
	rd	%sys_tick_cmpr,	%i6
	rdpr	%cwp,	%o5
	rdpr	%gl,	%o3
	nop
	setx	loop_13,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movne	%xcc,	%g3,	%g6
	rdpr	%gl,	%l4
	edge32ln	%o1,	%o0,	%i0
loop_13:
	wrpr	%g1,	0x1D8F,	%tick
	brnz,a	%l2,	loop_14
	tleu	%xcc,	0x2
	rd	%fprs,	%o2
	rdpr	%pil,	%o7
loop_14:
	wrpr	%i1,	0x061A,	%tick
	wrpr	%l3,	%i3,	%cwp
	andn	%g4,	0x13EA,	%l0
	sethi	0x0C34,	%l5
	rdhpr	%hsys_tick_cmpr,	%l6
	membar	#Sync
	set	0x40, %l0
	ldda	[%l7 + %l0] 0x1e,	%f0
	rd	%pc,	%l1
	movn	%icc,	%i7,	%g5
	wr	%i4,	0x040F,	%ccr
	wrpr	%i2,	0x01E8,	%pil
	rdpr	%wstate,	%o4
	fmul8sux16	%f24,	%f24,	%f20
	orncc	%g2,	%o6,	%i5
	ba,pn	%xcc,	loop_15
	nop
	setx loop_16, %l0, %l1
	jmpl %l1, %g7
	rd	%ccr,	%o5
	edge16n	%o3,	%g3,	%g6
loop_15:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x6FD, 	%hsys_tick_cmpr
loop_16:
	move	%icc,	%o1,	%o0
	tvs	%xcc,	0x0
	fzeros	%f11
	rdhpr	%hsys_tick_cmpr,	%g1
	brlz	%l2,	loop_17
	wr	%o2,	0x1909,	%clear_softint
	wr	%i0,	0x1792,	%set_softint
	orn	%i1,	0x140A,	%l3
loop_17:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	fmul8sux16	%f18,	%f0,	%f28
	rdpr	%otherwin,	%g4
	sethi	0x00A1,	%l0
	st	%f21,	[%l7 + 0x58]
	wr	%i7,	0x0663,	%pic
	bne,a,pn	%icc,	loop_18
	wrpr	%l6,	%i4,	%tick
	wr	%g0,	0x0c,	%asi
	ldsba	[%l7 + 0x5D] %asi,	%g5
loop_18:
	rd	%y,	%i2
	wrpr	%g2,	%o4,	%cwp
	array16	%o6,	%i5,	%o5
	array8	%g7,	%o3,	%g3
	fmovsa	%xcc,	%f5,	%f22
	lduh	[%l7 + 0x78],	%i6
	movleu	%xcc,	%g6,	%l4
	rdpr	%gl,	%o0
	tcs	%icc,	0x0
	rdpr	%cansave,	%o1
	rdpr	%cleanwin,	%g1
	addc	%o2,	%l2,	%i1
	srlx	%l3,	%i0,	%o7
	fbu	%fcc1,	loop_19
	rd	%asi,	%i3
	wrpr	%g4,	%l5,	%tick
	wrpr	%l1,	%i7,	%tick
loop_19:
	bleu,a,pn	%icc,	loop_20
	xor	%l6,	%i4,	%g5
	bvs,pn	%xcc,	loop_21
	wr	%l0,	0x0CB2,	%softint
loop_20:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_21:
	srl	%o5,	%g7,	%i5
	rdpr	%cwp,	%o3
	wr	%g0,	0x80,	%asi
	ldxa	[%l7 + 0x20] %asi,	%i6
	fmovsl	%xcc,	%f7,	%f18
	fmovrslez	%g3,	%f23,	%f6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xC2F, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	ba	loop_22
	edge32l	%l4,	%o2,	%g1
	subccc	%i1,	0x1261,	%l3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x5FC, 	%hsys_tick_cmpr
loop_22:
	brlez	%i3,	loop_23
	fbule	%fcc1,	loop_24
	rdhpr	%hintp,	%i0
	rdhpr	%hsys_tick_cmpr,	%l5
loop_23:
	fbo	%fcc1,	loop_25
loop_24:
	rdpr	%wstate,	%l1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x7BA, 	%hsys_tick_cmpr
	rdpr	%pil,	%i4
loop_25:
	rdhpr	%hintp,	%g5
	rdhpr	%htba,	%l6
	rdpr	%cwp,	%l0
	movne	%icc,	%i2,	%g2
	rdpr	%canrestore,	%o4
	wrpr	%o6,	%g7,	%pil
	ldd	[%l7 + 0x68],	%f20
	ba,pn	%icc,	loop_26
	fpsub16s	%f19,	%f12,	%f31
	bneg	loop_27
	orn	%o5,	0x0163,	%o3
loop_26:
	rdpr	%wstate,	%i6
	fnor	%f0,	%f14,	%f14
loop_27:
	tcc	%icc,	0x5
	rdpr	%wstate,	%g3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	fnot1	%f16,	%f8
	fmovdcs	%xcc,	%f6,	%f4
	movne	%icc,	%o0,	%i5
	wr	%o1,	%l4,	%y
	edge32	%o2,	%i1,	%g1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x50E, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x350, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	andncc	%i0,	%l1,	%l5
	edge8l	%i7,	%g4,	%g5
	fxnors	%f11,	%f0,	%f20
	wrpr	%l6,	%l0,	%cwp
	membar	0x3E
	rdhpr	%htba,	%i2
	rdhpr	%htba,	%i4
	rd	%sys_tick_cmpr,	%o4
	flush	%l7 + 0x34
	edge16l	%g2,	%g7,	%o5
	wrpr	%o6,	0x0FFB,	%pil
	rdpr	%canrestore,	%o3
	rdpr	%tl,	%i6
	rd	%ccr,	%g6
	rdpr	%pil,	%o0
	rdhpr	%hsys_tick_cmpr,	%g3
	rdpr	%otherwin,	%i5
	rdhpr	%hintp,	%l4
	set	0x1C, %l1
	ldswa	[%l7 + %l1] 0x15,	%o2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xE36, 	%hsys_tick_cmpr
	rd	%softint,	%l2
	rdhpr	%htba,	%o1
	wr	%g0,	0x17,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
	xorcc	%l3,	0x0665,	%o7
	set	0x7F, %o2
	stba	%i0,	[%l7 + %o2] 0x18
	srlx	%l1,	0x0E,	%i3
	fbo,a	%fcc3,	loop_28
	rdhpr	%hpstate,	%l5
	addc	%i7,	%g5,	%g4
	wrpr	%l6,	%l0,	%pil
loop_28:
	wr	%i4,	0x0517,	%y
	wrpr	%i2,	0x0345,	%tick
	srlx	%g2,	0x06,	%o4
	brnz	%o5,	loop_29
	rdpr	%gl,	%o6
	or	%g7,	%o3,	%i6
	rdhpr	%htba,	%g6
loop_29:
	rd	%ccr,	%g3
	rdhpr	%hpstate,	%o0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%o2,	%i1,	%pil
	rdhpr	%hintp,	%l4
	rdpr	%canrestore,	%l2
	rd	%tick_cmpr,	%o1
	rdpr	%tl,	%g1
	rdhpr	%htba,	%l3
	rd	%ccr,	%o7
	rdpr	%cansave,	%l1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%i7,	%g5,	%softint
	rdpr	%cansave,	%g4
	tcs	%xcc,	0x3
	rdhpr	%hsys_tick_cmpr,	%i0
	wrpr	%l6,	%i4,	%pil
	movvc	%icc,	%i2,	%g2
	wrpr	%o4,	%o5,	%tick
	set	0x40, %i1
	ldda	[%l7 + %i1] 0x10,	%f0
	sdivx	%l0,	0x078F,	%g7
	bg,a	loop_30
	rdpr	%tl,	%o3
	fxnor	%f28,	%f14,	%f18
	rdhpr	%htba,	%i6
loop_30:
	movne	%icc,	%o6,	%g3
	wr 	%g0, 	0x5, 	%fprs
	brnz,a	%i5,	loop_31
	tneg	%icc,	0x7
	nop
	setx loop_32, %l0, %l1
	jmpl %l1, %o2
	rdhpr	%hpstate,	%g6
loop_31:
	wrpr	%i1,	0x0035,	%cwp
	wrpr	%l2,	%o1,	%pil
loop_32:
	tvc	%xcc,	0x5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x61B, 	%hsys_tick_cmpr
	wrpr	%o7,	0x194C,	%cwp
	wr	%l3,	0x1C77,	%ccr
	rdhpr	%htba,	%l1
	rdpr	%pil,	%l5
	tvc	%xcc,	0x5
	array32	%i3,	%g5,	%i7
	wr	%g4,	%l6,	%sys_tick
	fmovscs	%icc,	%f1,	%f15
	sub	%i4,	%i2,	%i0
	edge32n	%o4,	%g2,	%o5
	wr	%g7,	0x0409,	%ccr
	edge16ln	%l0,	%i6,	%o6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xA70, 	%tick_cmpr
	fbl,a	%fcc2,	loop_33
	fmovde	%xcc,	%f20,	%f31
	movrlz	%o0,	%o2,	%g6
	mulx	%i1,	0x0CB1,	%i5
loop_33:
	wr	%l2,	0x11D1,	%set_softint
	prefetch	[%l7 + 0x7C],	 0x1
	fornot1s	%f10,	%f5,	%f8
	rdpr	%pil,	%l4
	rdhpr	%hintp,	%o1
	set	0x76, %g3
	lduba	[%l7 + %g3] 0x89,	%g1
	lduw	[%l7 + 0x78],	%o7
	rd	%ccr,	%l1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%tba,	%l3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x98C, 	%sys_tick_cmpr
	fnor	%f24,	%f0,	%f12
	rd	%pc,	%i7
	wr	%g0,	0x19,	%asi
	ldswa	[%l7 + 0x30] %asi,	%g4
	rd	%softint,	%g5
	rd	%y,	%i4
	add	%l6,	0x014A,	%i2
	movg	%icc,	%o4,	%i0
	tsubcctv	%o5,	%g7,	%l0
	subc	%i6,	0x07C0,	%o6
	flushw
	fones	%f12
	umul	%g2,	%o3,	%o0
	wr	%g3,	0x1F73,	%softint
	fpsub16	%f20,	%f12,	%f16
	andcc	%o2,	0x0E4E,	%g6
	bvs,pt	%xcc,	loop_34
	be	%icc,	loop_35
	mulscc	%i1,	%i5,	%l4
	movge	%icc,	%l2,	%o1
loop_34:
	movle	%icc,	%g1,	%o7
loop_35:
	pdist	%f8,	%f4,	%f4
	rd	%tick_cmpr,	%l5
	wr	%l1,	%i3,	%ccr
	wr	%l3,	0x0DC9,	%pic
	prefetch	[%l7 + 0x18],	 0x2
	rd	%asi,	%g4
	tneg	%icc,	0x5
	ta	%icc,	0x5
	wr 	%g0, 	0x7, 	%fprs
	rd	%softint,	%i4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%o4,	%i0,	%clear_softint
	rdhpr	%hsys_tick_cmpr,	%o5
	addcc	%g7,	%l0,	%l6
	wr	%o6,	%g2,	%y
	tpos	%xcc,	0x6
	rdhpr	%hsys_tick_cmpr,	%i6
	edge8n	%o0,	%g3,	%o3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x080, 	%hsys_tick_cmpr
	brgz,a	%i1,	loop_36
	rd	%pc,	%l4
	set	0x40, %g5
	stda	%f16,	[%l7 + %g5] 0x04
loop_36:
	std	%i4,	[%l7 + 0x38]
	rd	%asi,	%o1
	tcs	%xcc,	0x2
	rdpr	%canrestore,	%g1
	fba	%fcc1,	loop_37
	rdhpr	%hintp,	%o7
	rd	%sys_tick_cmpr,	%l2
	rdhpr	%hpstate,	%l5
loop_37:
	fbule,a	%fcc0,	loop_38
	rdhpr	%hintp,	%i3
	fmovrdlz	%l3,	%f0,	%f6
	umulcc	%l1,	0x189B,	%g4
loop_38:
	rdpr	%tl,	%i7
	rd	%pc,	%i4
	wrpr	%g5,	%o4,	%tick
	fxors	%f17,	%f25,	%f26
	movleu	%xcc,	%i2,	%o5
	wr	%g7,	0x14AC,	%pic

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x344, 	%hsys_tick_cmpr
	rdpr	%otherwin,	%o6
	wrpr	%g2,	0x1381,	%pil
	rdhpr	%hintp,	%i6
	movle	%icc,	%l6,	%o0
	fmovrsgez	%g3,	%f28,	%f28
	ta	%icc,	0x7
	wrpr	%o2,	%g6,	%pil
	edge16ln	%o3,	%l4,	%i1
	bvs,a,pt	%icc,	loop_39
	wrpr	%i5,	0x0CB2,	%pil
	rd	%fprs,	%g1
	rd	%sys_tick_cmpr,	%o7
loop_39:
	popc	%l2,	%o1
	rdhpr	%hpstate,	%l3
	movge	%xcc,	%l1,	%g4
	rdhpr	%htba,	%i4
	wrpr	%i7,	0x028B,	%cwp
	edge8	%o4,	%i2,	%g5
	wr	%g0,	0x88,	%asi
	ldxa	[%l7 + 0x18] %asi,	%o5
	orcc	%i0,	0x0362,	%l0
	wrpr	%g7,	%g2,	%cwp
	rdhpr	%htba,	%i6
	rdhpr	%hintp,	%l6
	srax	%o0,	0x00,	%o6
	rd	%y,	%g3
	movleu	%icc,	%g6,	%o3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x97E, 	%hsys_tick_cmpr
	tneg	%xcc,	0x6
	rd	%y,	%i1
	rdpr	%tl,	%g1
	fpadd32s	%f4,	%f16,	%f28
	rdpr	%canrestore,	%o7
	wrpr	%l2,	0x030D,	%pil
	rdpr	%pil,	%o1
	fmul8ulx16	%f30,	%f0,	%f6
	wrpr	%i3,	%l5,	%pil
	wrpr	%l3,	%l1,	%tick
	bne,a	loop_40
	movrlz	%i5,	0x31B,	%g4
	set	0x38, %o5
	lda	[%l7 + %o5] 0x10,	%f31
loop_40:
	rdhpr	%hsys_tick_cmpr,	%i7
	wr	%o4,	0x154D,	%clear_softint
	movne	%icc,	%i4,	%g5
	edge8ln	%i2,	%o5,	%i0
	rdpr	%tba,	%l0
	movcc	%xcc,	%g2,	%g7
	tge	%xcc,	0x3
	rdhpr	%hsys_tick_cmpr,	%l6
	edge16ln	%o0,	%i6,	%g3
	wr	%o6,	%o3,	%softint
	wrpr	%g6,	%l4,	%tick
	tl	%icc,	0x5
	tcs	%icc,	0x5
	wr 	%g0, 	0x7, 	%fprs
	tleu	%xcc,	0x7
	ldstub	[%l7 + 0x30],	%g1
	edge32ln	%o7,	%i1,	%o1
	rdpr	%gl,	%l2
	rdhpr	%hpstate,	%l5
	wr 	%g0, 	0x6, 	%fprs
	edge32	%l3,	%l1,	%i5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xDAC, 	%hsys_tick_cmpr
	movne	%xcc,	%i7,	%i4
	edge16ln	%g5,	%o4,	%o5
	rdpr	%tba,	%l0
	movvc	%xcc,	%g7,	%g2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fmovsl	%xcc,	%f6,	%f22
	fmovrsgz	%l6,	%f26,	%f25
	fpadd32s	%f13,	%f27,	%f3
	wr	%g3,	0x0EB1,	%clear_softint
	ldstub	[%l7 + 0x53],	%o6
	movvc	%xcc,	%i6,	%o3
	bge,a	%xcc,	loop_41
	ta	%xcc,	0x6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x0A3, 	%hsys_tick_cmpr
	fmovdle	%xcc,	%f12,	%f28
loop_41:
	movg	%xcc,	%l4,	%o2
	movgu	%xcc,	%o7,	%g1
	wrpr	%i1,	0x1EB7,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%l5,	%i3,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%i7,	%i4,	%clear_softint
	rdhpr	%hpstate,	%g5
	movle	%icc,	%i5,	%o5
	rdhpr	%htba,	%o4
	stbar
	rd	%asi,	%i0
	wrpr	%i2,	0x0B6A,	%tick
	rd	%y,	%g7
	rdpr	%cleanwin,	%g2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xDAF, 	%sys_tick_cmpr
	movge	%icc,	%l0,	%g3
	flushw
	subc	%o6,	%o3,	%g6
	wr	%i6,	0x0433,	%set_softint
	fmovsleu	%xcc,	%f24,	%f14
	rd	%fprs,	%o2
	wrpr	%l4,	0x079C,	%pil
	popc	%g1,	%i1
	rdpr	%tba,	%o1
	udivcc	%l2,	0x1FB7,	%l5
	orn	%i3,	0x0532,	%o7
	bg,a	%icc,	loop_42
	rd	%pc,	%l3
	and	%l1,	%g4,	%i4
	wr	%i7,	0x08D5,	%y
loop_42:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	wrpr	%o4,	0x0679,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%y,	%i2
	wrpr	%i0,	0x1C84,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	wr	%g7,	0x18AC,	%ccr
	wr	%g0,	0x10,	%asi
	ldxa	[%l7 + 0x58] %asi,	%l6
	wrpr	%o0,	0x0C42,	%pil
	wr	%g3,	%l0,	%set_softint
	tleu	%xcc,	0x6
	movgu	%xcc,	%o6,	%o3
	edge8l	%g6,	%i6,	%o2
	nop
	set	0x10, %o0
	stw	%g1,	[%l7 + %o0]
	rdpr	%tl,	%i1
	fmovrsne	%l4,	%f10,	%f25
	rdhpr	%hsys_tick_cmpr,	%l2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x568, 	%hsys_tick_cmpr
	edge32ln	%i3,	%o7,	%l5
	rdhpr	%hintp,	%l3
	rdpr	%cleanwin,	%l1
	fbuge	%fcc3,	loop_43
	rdhpr	%htba,	%i4
	wr	%g0,	0xeb,	%asi
	stwa	%i7,	[%l7 + 0x7C] %asi
	membar	#Sync
loop_43:
	fmovrsgz	%g5,	%f20,	%f2
	rdpr	%cansave,	%i5
	rd	%ccr,	%o4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	taddcc	%o5,	0x0455,	%g2
	wrpr	%i0,	%g7,	%pil
	tsubcc	%l6,	%o0,	%g3
	te	%icc,	0x1
	rdhpr	%hsys_tick_cmpr,	%o6
	fbu,a	%fcc0,	loop_44
	wr 	%g0, 	0x6, 	%fprs
	tvc	%xcc,	0x5
	fbl	%fcc1,	loop_45
loop_44:
	sdivcc	%g6,	0x1C32,	%o3
	wrpr	%i6,	%g1,	%cwp
	rd	%ccr,	%i1
loop_45:
	rd	%pc,	%l4
	wr	%g0,	0xea,	%asi
	stba	%l2,	[%l7 + 0x19] %asi
	membar	#Sync
	tsubcc	%o2,	%o1,	%i3
	brlz	%o7,	loop_46
	udivcc	%l3,	0x1902,	%l1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xF97, 	%hsys_tick_cmpr
	or	%i7,	0x1633,	%i5
loop_46:
	move	%xcc,	%g5,	%g4
	rd	%y,	%o4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xD08, 	%hsys_tick_cmpr
	rdpr	%cleanwin,	%i0
	rdhpr	%hsys_tick_cmpr,	%g2
	rdhpr	%hsys_tick_cmpr,	%g7
	rdpr	%cansave,	%l6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xB2E, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%hsys_tick_cmpr,	%i6
	fmovdgu	%icc,	%f3,	%f12
	rdpr	%pil,	%g1
	brlz,a	%o3,	loop_47
	fpadd32	%f30,	%f8,	%f14
	edge32ln	%i1,	%l2,	%o2
	rdhpr	%hpstate,	%l4
loop_47:
	rdpr	%otherwin,	%i3
	wrpr	%o7,	0x0CE6,	%cwp
	fmovdvs	%xcc,	%f11,	%f24
	stx	%o1,	[%l7 + 0x78]

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr 	%g0, 	0x7, 	%fprs
	fandnot1s	%f18,	%f15,	%f5
	wrpr	%i5,	%g5,	%cwp
	wrpr	%i4,	0x0656,	%pil
	wrpr	%g4,	%o4,	%tick
	taddcc	%o5,	0x02BD,	%i2
	rd	%sys_tick_cmpr,	%g2
	rdhpr	%hintp,	%i0
	wrpr	%g7,	0x0AB7,	%pil
	tl	%icc,	0x2
	edge8ln	%o0,	%g3,	%l0
	rdpr	%gl,	%o6
	rd	%pc,	%g6
	rdhpr	%hsys_tick_cmpr,	%i6
	wrpr	%l6,	%o3,	%pil
	bne,a,pt	%xcc,	loop_48
	rdpr	%cleanwin,	%i1
	rdpr	%gl,	%g1
	rdhpr	%hsys_tick_cmpr,	%l2
loop_48:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xE87, 	%hsys_tick_cmpr
	fble,a	%fcc0,	loop_49
	movrgez	%i3,	0x0C4,	%l4
	edge32ln	%o1,	%o7,	%l1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
loop_49:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%l5,	0x09AD,	%tick
	movg	%icc,	%i5,	%i4
	rdhpr	%hintp,	%g4
	rd	%y,	%o4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x0EC, 	%sys_tick_cmpr
	ta	%icc,	0x7
	rdhpr	%hpstate,	%g2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x4F7, 	%hsys_tick_cmpr
	rdpr	%cwp,	%g7
	rdpr	%tl,	%i0
	rd	%softint,	%g3
	rdhpr	%hintp,	%l0
	rdhpr	%hpstate,	%o0
	bgu	%icc,	loop_50
	be,a	loop_51
	ta	%xcc,	0x6
	andcc	%o6,	0x1A47,	%i6
loop_50:
	srax	%l6,	%o3,	%g6
loop_51:
	rd	%sys_tick_cmpr,	%i1
	ble,pt	%icc,	loop_52
	wrpr	%i3,	0x00E5,	%pil
	rd	%y,	%o2
	ldd	[%l7 + 0x28],	%f28
loop_52:
	rdpr	%canrestore,	%o1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x076, 	%hsys_tick_cmpr
	srl	%l1,	%l3,	%i7
	rdpr	%cansave,	%l5
	udivx	%i4,	0x0B04,	%g4
	taddcc	%o4,	0x0A2B,	%i5
	ld	[%l7 + 0x44],	%f12
	popc	0x0D31,	%o5
	orncc	%g5,	%g2,	%i2
	wrpr	%g7,	0x1989,	%tick
	rd	%pc,	%i0
	fmovrsne	%g3,	%f13,	%f16
	brlz	%o0,	loop_53
	rd	%asi,	%o6
	wrpr	%l0,	%i6,	%cwp
	wrpr	%l6,	%o3,	%pil
loop_53:
	fmovrsgz	%g6,	%f0,	%f3
	mulscc	%i1,	%g1,	%i3
	movrgez	%l2,	%o1,	%o7
	wrpr	%o2,	%l4,	%pil
	rdpr	%pil,	%l1
	rdhpr	%hsys_tick_cmpr,	%i7
	mova	%icc,	%l5,	%i4
	rdpr	%wstate,	%l3
	wrpr	%g4,	%i5,	%tick
	movl	%xcc,	%o5,	%g5
	alignaddr	%o4,	%g2,	%i2
	nop
	setx	loop_54,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	pdist	%f2,	%f2,	%f16
	wrpr	%g7,	%g3,	%tick
	xnor	%i0,	%o0,	%l0
loop_54:
	rdpr	%tl,	%o6
	rdpr	%cansave,	%l6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xCC2, 	%hsys_tick_cmpr
	rdhpr	%hpstate,	%i1
	movre	%g1,	%i3,	%l2
	rdpr	%cansave,	%o1
	rdpr	%tba,	%o7
	rd	%asi,	%g6
	wr	%g0,	0x81,	%asi
	swapa	[%l7 + 0x50] %asi,	%o2
	movleu	%xcc,	%l4,	%i7
	udivx	%l1,	0x10E9,	%i4
	rdhpr	%hsys_tick_cmpr,	%l3
	move	%xcc,	%l5,	%g4
	edge32ln	%o5,	%i5,	%g5
	rdpr	%tl,	%g2
	wrpr	%i2,	%o4,	%tick
	rdpr	%gl,	%g7
	rdhpr	%hpstate,	%i0
	wrpr	%o0,	0x0A22,	%tick
	rdhpr	%hintp,	%l0
	fbe,a	%fcc3,	loop_55
	sdivx	%g3,	0x0ED6,	%o6
	siam	0x6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x361, 	%hsys_tick_cmpr
loop_55:
	rd	%ccr,	%i1
	movn	%xcc,	%g1,	%i3
	fbo,a	%fcc1,	loop_56
	fmovsgu	%icc,	%f26,	%f24
	taddcctv	%l2,	%o1,	%l6
	fmovscs	%icc,	%f10,	%f27
loop_56:
	rdpr	%pil,	%o7
	wr	%l4,	0x18DA,	%pic
	rdhpr	%hpstate,	%g6
	membar	0x53
	wrpr	%l1,	0x1AD7,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%htba,	%l5
	rdpr	%gl,	%l3
	orncc	%g4,	%o5,	%i5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	membar	0x7D
	edge32n	%o4,	%g2,	%g7
	fbue,a	%fcc3,	loop_57
	sdiv	%i0,	0x0E1B,	%l0
	rdpr	%pil,	%o0
	edge8n	%o6,	%g3,	%o3
loop_57:
	fmovrdlez	%i1,	%f18,	%f24
	wrpr	%i6,	0x1390,	%tick
	wrpr	%i3,	0x0FED,	%tick
	tsubcctv	%g1,	%o1,	%l6
	rdpr	%gl,	%o7
	sethi	0x194E,	%l2
	wr	%o2,	0x0B6F,	%set_softint
	wrpr	%g6,	0x0675,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	edge32	%i4,	%i7,	%l3
	addcc	%g4,	0x154B,	%l5
	nop
	set	0x78, %i0
	stb	%o5,	[%l7 + %i0]
	wr	%i5,	%g5,	%set_softint
	rdpr	%cwp,	%i2
	rd	%sys_tick_cmpr,	%o4
	ble,a,pn	%xcc,	loop_58
	wr	%g2,	0x11ED,	%pic
	set	0x78, %g7
	lduba	[%l7 + %g7] 0x19,	%g7
loop_58:
	srl	%i0,	0x02,	%o0
	rd	%tick_cmpr,	%l0
	rdhpr	%hpstate,	%g3
	ldub	[%l7 + 0x2F],	%o6
	edge8	%o3,	%i1,	%i6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xACD, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x1D5, 	%hsys_tick_cmpr
	wrpr	%o7,	0x088C,	%pil
	movneg	%icc,	%l2,	%o2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xEE3, 	%sys_tick_cmpr
	tl	%icc,	0x4
	rdhpr	%hsys_tick_cmpr,	%l4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	andn	%i7,	%l3,	%g6
	edge32n	%g4,	%l5,	%o5
	movcs	%icc,	%g5,	%i5
	wrpr	%i2,	%g2,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xF74, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x326, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xFB2, 	%sys_tick_cmpr
	bpos,pt	%xcc,	loop_59
	wrpr	%o6,	0x0249,	%tick
	wrpr	%i1,	0x1A02,	%cwp
	rd	%pc,	%i6
loop_59:
	flushw
	rdhpr	%htba,	%o3
	rdpr	%wstate,	%g1
	fmuld8ulx16	%f13,	%f29,	%f26
	rdhpr	%hintp,	%l6
	wrpr	%i3,	0x19EC,	%tick
	rd	%pc,	%o7
	rdpr	%cansave,	%l2
	rdhpr	%hpstate,	%o1
	smulcc	%l4,	%l1,	%o2
	faligndata	%f16,	%f22,	%f14
	rd	%ccr,	%i4
	rdpr	%cwp,	%l3
	wrpr	%g6,	0x112D,	%pil
	xorcc	%i7,	%l5,	%g4
	taddcc	%o5,	0x0241,	%i5
	wrpr	%g5,	%g2,	%cwp
	rdhpr	%hsys_tick_cmpr,	%i2
	rdhpr	%hpstate,	%g7
	rd	%fprs,	%o0
	fmovdpos	%xcc,	%f14,	%f12
	set	0x40, %g2
	stda	%f16,	[%l7 + %g2] 0xf1
	membar	#Sync
	wrpr	%l0,	0x109D,	%tick
	rd	%sys_tick_cmpr,	%g3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%tba,	%o6
	orncc	%i6,	0x0422,	%i1
	xnorcc	%o3,	%l6,	%g1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	rdhpr	%htba,	%i3
	rdhpr	%htba,	%l2
	rd	%asi,	%o1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	addccc	%l4,	%o2,	%i4
	wr	%l1,	%l3,	%clear_softint
	rdhpr	%hsys_tick_cmpr,	%g6
	alignaddr	%i7,	%g4,	%l5
	edge8ln	%i5,	%g5,	%g2
	rdpr	%otherwin,	%i2
	wrpr	%o5,	%o0,	%cwp
	rd	%tick_cmpr,	%l0
	wrpr	%g7,	0x1CA2,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%sys_tick_cmpr,	%o4
	wrpr	%o6,	0x1532,	%tick
	membar	0x75
	bl	loop_60
	tcs	%xcc,	0x1
	rd	%sys_tick_cmpr,	%i1
	ldsb	[%l7 + 0x4E],	%i6
loop_60:
	tne	%icc,	0x5
	rd	%pc,	%l6
	rdhpr	%hintp,	%g1
	subc	%i3,	%o3,	%o1
	rdhpr	%hintp,	%l2
	wrpr	%o7,	%o2,	%pil
	movl	%icc,	%l4,	%i4
	rdhpr	%hsys_tick_cmpr,	%l1
	rdhpr	%hintp,	%l3
	addccc	%i7,	0x1D4E,	%g6
	rd	%sys_tick_cmpr,	%l5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	movcs	%xcc,	%g4,	%g5
	rd	%pc,	%g2
	smul	%i2,	%o0,	%o5
	rd	%ccr,	%g7
	rd	%fprs,	%i0
	sub	%g3,	%l0,	%o4
	rdpr	%otherwin,	%i1
	movcs	%icc,	%o6,	%l6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x02D, 	%hsys_tick_cmpr
	mova	%icc,	%i3,	%g1
	bpos,a	%xcc,	loop_61
	fbo,a	%fcc3,	loop_62
	umulcc	%o3,	0x1522,	%o1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_61:
	fmovsneg	%icc,	%f1,	%f27
loop_62:
	fandnot1	%f0,	%f24,	%f16
	rdhpr	%hsys_tick_cmpr,	%o7
	rdpr	%pil,	%i4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%fprs,	%l3
	rdhpr	%hsys_tick_cmpr,	%i7
	fmovrse	%g6,	%f27,	%f2
	rd	%fprs,	%l4
	rdpr	%wstate,	%i5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x075, 	%hsys_tick_cmpr
	brz	%g5,	loop_63
	wrpr	%g4,	0x09D6,	%pil
	prefetch	[%l7 + 0x6C],	 0x1
	wrpr	%g2,	0x041A,	%tick
loop_63:
	wrpr	%o0,	0x18DF,	%tick
	fcmpd	%fcc0,	%f10,	%f18
	fmovspos	%xcc,	%f10,	%f12
	wr	%i2,	0x14B5,	%y
	tvs	%icc,	0x1
	movvs	%icc,	%g7,	%i0
	rdhpr	%hintp,	%o5
	and	%g3,	0x04D3,	%o4
	fblg,a	%fcc2,	loop_64
	movl	%xcc,	%l0,	%o6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsgu	%icc,	%f8,	%f23
loop_64:
	rd	%sys_tick_cmpr,	%i1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x43F, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%i3,	0x0243,	%cwp
	fmovse	%xcc,	%f9,	%f1
	set	0x70, %l5
	swapa	[%l7 + %l5] 0x0c,	%o1
	rdpr	%tl,	%l2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fnegs	%f23,	%f21
	rdhpr	%htba,	%o7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x2E6, 	%hsys_tick_cmpr
	bvs,pn	%icc,	loop_65
	rdpr	%tba,	%l1
	rd	%tick_cmpr,	%i7
	movg	%xcc,	%g6,	%l3
loop_65:
	xor	%i5,	0x1D03,	%l5
	rdhpr	%hintp,	%g5
	wr	%g4,	0x0B94,	%ccr
	ta	%icc,	0x7
	array8	%g2,	%o0,	%l4
	bleu,a	%xcc,	loop_66
	fba,a	%fcc1,	loop_67
	andcc	%i2,	%i0,	%g7
	umulcc	%o5,	0x1376,	%o4
loop_66:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x1F1, 	%hsys_tick_cmpr
loop_67:
	fbuge	%fcc0,	loop_68
	orncc	%l0,	0x115A,	%o6
	rd	%asi,	%l6
	rd	%ccr,	%i6
loop_68:
	rdhpr	%htba,	%g1
	tvs	%xcc,	0x0
	wrpr	%i1,	0x06B3,	%pil
	rdpr	%cansave,	%i3
	fmovda	%icc,	%f3,	%f18

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fpack32	%f6,	%f4,	%f12
	sdivcc	%i4,	0x05F2,	%o7
	set	0x40, %l4
	stda	%f16,	[%l7 + %l4] 0x17
	membar	#Sync
	rdpr	%cwp,	%l1
	sub	%i7,	%g6,	%i5
	wrpr	%l5,	%l3,	%cwp
	rdhpr	%hpstate,	%g4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%htba,	%g5
	wr	%o0,	0x0CF4,	%pic
	fbug	%fcc0,	loop_69
	taddcc	%l4,	0x04A2,	%i2
	wrpr	%g7,	0x1D83,	%cwp
	rdhpr	%hintp,	%o5
loop_69:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fmul8x16au	%f16,	%f1,	%f22

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	edge8ln	%l0,	%o6,	%g3
	lduh	[%l7 + 0x2C],	%i6
	wrpr	%g1,	0x0DA9,	%pil
	wr	%l6,	%i3,	%set_softint
	movne	%icc,	%i1,	%o1
	fbl,a	%fcc3,	loop_70
	ta	%xcc,	0x1
	wrpr	%l2,	%o2,	%tick
	rdpr	%tl,	%i4
loop_70:
	rd	%fprs,	%o7
	wr	%o3,	%i7,	%clear_softint
	wrpr	%l1,	0x1C1C,	%tick
	wrpr	%i5,	%g6,	%pil
	wr	%l5,	0x014D,	%softint
	rdpr	%cleanwin,	%l3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xF34, 	%hsys_tick_cmpr
	fxnor	%f20,	%f30,	%f24
	wr	%g5,	%o0,	%ccr
	wr	%g0,	0x18,	%asi
	ldstuba	[%l7 + 0x56] %asi,	%i2
	wr	%g7,	%o5,	%sys_tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%l4,	0x1DBE,	%set_softint
	rdpr	%otherwin,	%o4
	rdhpr	%hintp,	%o6
	rd	%pc,	%l0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x2BF, 	%hsys_tick_cmpr
	rdpr	%canrestore,	%l6
	movrgez	%g3,	0x154,	%i1
	wr	%i3,	%l2,	%pic
	fbul,a	%fcc0,	loop_71
	rd	%ccr,	%o1
	rd	%y,	%i4
	rd	%fprs,	%o7
loop_71:
	movneg	%icc,	%o3,	%o2
	fmovsgu	%xcc,	%f3,	%f3
	set	0x70, %i5
	stwa	%i7,	[%l7 + %i5] 0xeb
	membar	#Sync
	wr	%i5,	%g6,	%clear_softint
	fmovsle	%icc,	%f5,	%f3
	andcc	%l1,	%l3,	%l5
	rdpr	%gl,	%g2
	mulx	%g5,	%o0,	%i2
	rdhpr	%hintp,	%g7
	subcc	%o5,	0x0F0C,	%g4
	sth	%l4,	[%l7 + 0x12]
	rdpr	%cwp,	%o4
	subcc	%i0,	%o6,	%i6
	set	0x30, %g6
	ldda	[%l7 + %g6] 0x2e,	%l0
	fornot1	%f4,	%f28,	%f14
	wr	%g0,	0x11,	%asi
	sta	%f1,	[%l7 + 0x5C] %asi
	wr 	%g0, 	0x4, 	%fprs
	srax	%g3,	0x03,	%g1
	rdpr	%pil,	%i3
	rdhpr	%hintp,	%i1
	bleu,pt	%xcc,	loop_72
	ta	%xcc,	0x1
	fba	%fcc1,	loop_73
	rdpr	%cansave,	%l2
loop_72:
	rdhpr	%htba,	%i4
	fnands	%f25,	%f5,	%f29
loop_73:
	bvs,pt	%xcc,	loop_74
	wrpr	%o1,	%o7,	%pil
	movrgez	%o2,	%i7,	%i5
	and	%o3,	0x0EAD,	%l1
loop_74:
	wr	%l3,	0x03C0,	%clear_softint
	fmovsleu	%xcc,	%f11,	%f6
	tcs	%xcc,	0x6
	rd	%fprs,	%g6
	rd	%tick_cmpr,	%g2
	rdpr	%cwp,	%l5
	smul	%o0,	%i2,	%g7
	ldstub	[%l7 + 0x27],	%g5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xF04, 	%tick_cmpr
	fpsub32	%f20,	%f22,	%f10
	wr 	%g0, 	0x7, 	%fprs
	srlx	%g4,	%o4,	%o6
	rd	%ccr,	%i6
	rd	%ccr,	%l0
	stx	%l6,	[%l7 + 0x78]
	wrpr	%g3,	0x0C6C,	%pil
	wrpr	%i0,	%i3,	%pil
	wr	%g0,	0x11,	%asi
	stwa	%g1,	[%l7 + 0x1C] %asi
	movn	%xcc,	%i1,	%i4
	fnot2s	%f5,	%f0
	wr	%g0,	0x89,	%asi
	ldda	[%l7 + 0x30] %asi,	%l2
	rd	%ccr,	%o1
	wrpr	%o7,	%i7,	%pil
	rdpr	%tba,	%i5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x43D, 	%hsys_tick_cmpr
	ble,a,pt	%xcc,	loop_75
	xnorcc	%l3,	0x0ABE,	%o2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xDEC, 	%hsys_tick_cmpr
	rd	%ccr,	%l5
loop_75:
	rd	%tick_cmpr,	%o0
	fmovdleu	%xcc,	%f25,	%f14
	rd	%pc,	%i2
	sra	%g7,	%g5,	%o5
	orcc	%l4,	0x18A2,	%g6
	rdpr	%gl,	%o4
	wr	%g4,	0x1796,	%ccr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x3D0, 	%hsys_tick_cmpr
	rd	%pc,	%o6
	wrpr	%l6,	%g3,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	edge16ln	%g1,	%i1,	%l0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x2AF, 	%sys_tick_cmpr
	wr	%o7,	%i7,	%set_softint
	rdhpr	%hsys_tick_cmpr,	%i5
	rdpr	%cansave,	%o3
	rdpr	%tl,	%o1
	rdhpr	%htba,	%l3
	orcc	%o2,	0x00D6,	%g2
	rdpr	%tl,	%l5
	move	%xcc,	%l1,	%o0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x458, 	%hsys_tick_cmpr
	fbg,a	%fcc0,	loop_76
	tcs	%xcc,	0x1
	movvc	%icc,	%o5,	%g5
	wrpr	%g6,	0x0A48,	%pil
loop_76:
	movn	%xcc,	%o4,	%g4
	fmovdne	%xcc,	%f21,	%f24
	edge32ln	%i6,	%o6,	%l6
	rdhpr	%htba,	%l4
	rdpr	%tba,	%g3
	wrpr	%i0,	0x0B1F,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fmovsa	%xcc,	%f20,	%f9
	fmul8x16al	%f14,	%f21,	%f20
	wr	%l0,	0x09B0,	%sys_tick
	movcc	%icc,	%i4,	%i1
	sethi	0x0010,	%o7
	wrpr	%i7,	%i5,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x24D, 	%sys_tick_cmpr
	rd	%ccr,	%o3
	srax	%o1,	%o2,	%l3
	wrpr	%l5,	0x0CAB,	%cwp
	membar	0x3C
	addc	%g2,	0x0270,	%l1
	call	loop_77
	rd	%fprs,	%o0
	wrpr	%i2,	0x0C02,	%cwp
	wr	%g7,	%g5,	%y
loop_77:
	rdpr	%tl,	%g6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%canrestore,	%i6
	rdpr	%wstate,	%o6
	rdpr	%cleanwin,	%o5
	wrpr	%l4,	0x179F,	%cwp
	stw	%g3,	[%l7 + 0x74]
	rdhpr	%hsys_tick_cmpr,	%l6
	wrpr	%i3,	%g1,	%pil
	rd	%asi,	%l0
	rd	%softint,	%i4
	rd	%sys_tick_cmpr,	%i0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%canrestore,	%i7
	move	%icc,	%i1,	%l2
	wrpr	%o3,	%o1,	%pil
	sdivx	%i5,	0x0E0E,	%o2
	rdhpr	%hpstate,	%l3
	alignaddrl	%l5,	%g2,	%o0
	rdpr	%cansave,	%i2
	wrpr	%l1,	%g5,	%cwp
	fcmps	%fcc1,	%f31,	%f7
	wrpr	%g7,	0x1370,	%tick
	fcmps	%fcc3,	%f12,	%f6
	rdhpr	%htba,	%g6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x64D, 	%hsys_tick_cmpr
	rd	%asi,	%o6
	rdhpr	%hsys_tick_cmpr,	%o4
	rd	%y,	%l4
	rdpr	%tba,	%o5
	orncc	%l6,	0x158A,	%g3
	wrpr	%g1,	0x0277,	%pil
	ta	%icc,	0x5
	edge8ln	%l0,	%i4,	%i3
	rdpr	%cansave,	%i0
	umulcc	%i7,	0x1E1B,	%i1
	rd	%tick_cmpr,	%o7
	taddcc	%o3,	0x18F7,	%o1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x230, 	%tick_cmpr
	membar	0x5E
	wr	%l2,	%g2,	%sys_tick
	wrpr	%o0,	%l5,	%pil
	brlez	%i2,	loop_78
	rd	%ccr,	%l1
	wr	%g7,	0x1E5C,	%sys_tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x1D2, 	%hsys_tick_cmpr
loop_78:
	rdhpr	%hpstate,	%g4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x8D6, 	%hsys_tick_cmpr
	wrpr	%o5,	0x1F92,	%tick
	brnz,a	%g1,	loop_79
	fbue,a	%fcc2,	loop_80
	rdhpr	%hsys_tick_cmpr,	%g3
	rdhpr	%htba,	%l0
loop_79:
	fmovsleu	%icc,	%f18,	%f26
loop_80:
	rdhpr	%hsys_tick_cmpr,	%i4
	sdivx	%i0,	0x0BD5,	%i7
	wrpr	%i3,	%i1,	%tick
	edge8l	%o7,	%o1,	%o3
	wrpr	%i5,	0x0230,	%pil
	mulscc	%l3,	%l2,	%o2
	tge	%icc,	0x4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x09D, 	%hsys_tick_cmpr
	rd	%softint,	%l5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xBDF, 	%hsys_tick_cmpr
	bn,pn	%icc,	loop_81
	rdpr	%cwp,	%g7
	lduh	[%l7 + 0x4E],	%g6
	fmovsvc	%xcc,	%f7,	%f22
loop_81:
	movl	%icc,	%g4,	%i6
	rd	%ccr,	%o4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x77B, 	%hsys_tick_cmpr
	wr	%o6,	%l6,	%pic
	orcc	%l4,	%o5,	%g3
	movvs	%icc,	%g1,	%l0
	tcc	%xcc,	0x7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%cansave,	%i4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%i1,	0x1147,	%tick
	edge32l	%o1,	%o3,	%o7
	wrpr	%l3,	0x19C7,	%tick
	ldsw	[%l7 + 0x48],	%l2
	rdpr	%wstate,	%o2
	wrpr	%i5,	0x015C,	%tick
	rdpr	%tba,	%o0
	ldd	[%l7 + 0x50],	%i2
	tvc	%xcc,	0x4
	orn	%l1,	%g2,	%l5
	rd	%ccr,	%g6
	rdhpr	%hpstate,	%g4
	rd	%sys_tick_cmpr,	%g7
	wr	%i6,	%g5,	%sys_tick
	wrpr	%o6,	%o4,	%pil
	movpos	%xcc,	%l6,	%l4
	movneg	%xcc,	%g3,	%g1
	rd	%tick_cmpr,	%l0
	rdhpr	%hintp,	%i0
	rdpr	%pil,	%i4
	rdhpr	%hintp,	%o5
	rdhpr	%htba,	%i7
	bcs	loop_82
	wr	%i1,	0x1F72,	%sys_tick
	fsrc2s	%f27,	%f4
	rd	%sys_tick_cmpr,	%i3
loop_82:
	tsubcctv	%o1,	%o7,	%o3
	rd	%tick_cmpr,	%l3
	rdhpr	%hintp,	%o2
	rd	%sys_tick_cmpr,	%i5
	xnor	%l2,	%i2,	%o0
	rd	%asi,	%g2
	rdpr	%canrestore,	%l5
	rdpr	%pil,	%l1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%wstate,	%g6
	rdpr	%canrestore,	%g7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x69A, 	%hsys_tick_cmpr
	fcmps	%fcc0,	%f24,	%f16
	fbuge	%fcc2,	loop_83
	sra	%o6,	0x10,	%o4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%otherwin,	%l4
loop_83:
	smulcc	%g3,	%g1,	%i0
	be,a,pt	%icc,	loop_84
	wr 	%g0, 	0x4, 	%fprs

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x89E, 	%hsys_tick_cmpr
	rdpr	%otherwin,	%i1
loop_84:
	tsubcctv	%o5,	0x1150,	%o1
	rd	%y,	%o7
	andn	%o3,	%i3,	%o2
	wr	%l3,	0x147E,	%pic
	wr	%l2,	0x1128,	%y
	sth	%i2,	[%l7 + 0x30]
	rdhpr	%htba,	%i5
	tpos	%xcc,	0x3
	wrpr	%o0,	%l5,	%cwp
	wrpr	%l1,	0x1005,	%pil
	rdpr	%pil,	%g2
	fmuld8sux16	%f16,	%f10,	%f26
	ldsw	[%l7 + 0x54],	%g7
	sllx	%i6,	0x08,	%g5
	rdhpr	%hpstate,	%o6
	rd	%ccr,	%l6
	rdpr	%gl,	%o4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xC55, 	%hsys_tick_cmpr
	rd	%softint,	%g1
	fmovdcc	%icc,	%f15,	%f6
	fmovrslez	%i0,	%f11,	%f2
	wrpr	%i4,	%l0,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xDC2, 	%hsys_tick_cmpr
	edge16n	%o5,	%i7,	%o7
	wr	%o1,	0x01E1,	%clear_softint

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%hintp,	%o2
	rdhpr	%hintp,	%i3
	fpack32	%f16,	%f14,	%f28
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wrpr	%l2,	%i2,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xEA5, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x077, 	%hsys_tick_cmpr
	udivx	%l5,	0x061E,	%g2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xEF7, 	%hsys_tick_cmpr
	rdhpr	%hsys_tick_cmpr,	%g6
	rdpr	%otherwin,	%i6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%cleanwin,	%l4
	sra	%g3,	%o4,	%g1
	sub	%i4,	%l0,	%i1
	wr	%i0,	0x1E6B,	%sys_tick
	rdpr	%canrestore,	%o5
	edge32	%i7,	%o1,	%o3
	set	0x50, %i4
	ldxa	[%l7 + %i4] 0x88,	%o2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xDB1, 	%hsys_tick_cmpr
	rdpr	%gl,	%i3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%i2,	%i5,	%tick
	rdhpr	%hintp,	%l3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	rdpr	%gl,	%o0
	rdhpr	%hsys_tick_cmpr,	%g2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xE31, 	%hsys_tick_cmpr
	rdhpr	%hsys_tick_cmpr,	%i6
	wrpr	%g6,	0x06D9,	%cwp
	rd	%pc,	%o6
	movre	%g5,	0x31A,	%l6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%otherwin,	%g3
	movl	%icc,	%g1,	%i4
	be,pn	%icc,	loop_85
	rdhpr	%hsys_tick_cmpr,	%o4
	wr	%g0,	0x10,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
loop_85:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	brlz	%i0,	loop_86
	smul	%o5,	%i7,	%l0
	fmovrsgz	%o1,	%f12,	%f10
	wrpr	%o3,	0x1D8C,	%pil
loop_86:
	rd	%ccr,	%o7
	xor	%o2,	0x1E53,	%l2
	rd	%softint,	%i3
	fabsd	%f4,	%f12
	edge8l	%i5,	%i2,	%l3
	movrgez	%l5,	0x30D,	%g2
	edge8	%g4,	%l1,	%i6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xD03, 	%hsys_tick_cmpr
	wr	%o6,	%g6,	%y
	addccc	%l6,	0x1C15,	%l4
	wrpr	%g7,	0x0EF8,	%tick
	fmovs	%f9,	%f30
	rd	%sys_tick_cmpr,	%g5
	wr	%g1,	%g3,	%y
	rd	%ccr,	%o4
	edge32n	%i1,	%i4,	%i0
	rd	%tick_cmpr,	%i7
	andn	%l0,	%o5,	%o1
	fmovrsgz	%o3,	%f0,	%f5
	rdpr	%pil,	%o7
	tsubcc	%l2,	0x1019,	%i3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%o2,	%l3,	%pil
	rdpr	%pil,	%i2
	rd	%fprs,	%g2
	rdhpr	%hpstate,	%l5
	rdpr	%cwp,	%g4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xE00, 	%hsys_tick_cmpr
	rd	%softint,	%o0
	wr 	%g0, 	0x6, 	%fprs
	movl	%icc,	%g6,	%l6
	rdpr	%cwp,	%g7
	tvc	%xcc,	0x3
	wrpr	%g5,	0x14CD,	%cwp
	tl	%icc,	0x7
	wr	%g1,	%l4,	%ccr
	edge16ln	%o4,	%i1,	%i4
	rd	%sys_tick_cmpr,	%g3
	movgu	%icc,	%i7,	%l0
	fmovsn	%xcc,	%f5,	%f27

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x24D, 	%hsys_tick_cmpr
	wr	%o3,	%o5,	%softint
	wrpr	%o7,	%l2,	%cwp
	fmovsgu	%xcc,	%f15,	%f18

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x084, 	%hsys_tick_cmpr
	fmovrse	%o2,	%f31,	%f31
	rd	%tick_cmpr,	%l3
	rdpr	%otherwin,	%g2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%hpstate,	%g4
	set	0x40, %l6
	stda	%f0,	[%l7 + %l6] 0x0c

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x0D2, 	%hsys_tick_cmpr
	rd	%pc,	%i6
	rdpr	%tl,	%o0
	sll	%l1,	0x14,	%g6
	wrpr	%o6,	%l6,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	add	%l7,	0x78,	%l6
	wr	%g0,	0x11,	%asi
	ldxa	[%l6] %asi,	%l4
	casxa	[%l6] 0x11,	%l4,	%o4
	bge	%xcc,	loop_87
	fmovd	%f26,	%f16
	srax	%g5,	%i1,	%i4
	wrpr	%g3,	%i7,	%pil
loop_87:
	bne,a	loop_88
	rdhpr	%hpstate,	%l0
	rdpr	%cwp,	%o1
	movge	%icc,	%i0,	%o5
loop_88:
	wrpr	%o7,	0x1BD9,	%tick
	rd	%pc,	%o3
	rdpr	%wstate,	%i5
	wr 	%g0, 	0x4, 	%fprs
	movle	%xcc,	%i3,	%o2
	wrpr	%g2,	%l3,	%pil
	tcc	%icc,	0x2
	rdhpr	%hintp,	%g4
	membar	#Sync
	set	0x40, %i7
	ldda	[%l7 + %i7] 0x1e,	%f16
	ldstub	[%l7 + 0x5D],	%i2
	bgu,pn	%xcc,	loop_89
	fpackfix	%f28,	%f7
	rd	%pc,	%i6
	ble,a,pn	%xcc,	loop_90
loop_89:
	rd	%sys_tick_cmpr,	%o0
	fmovrslz	%l1,	%f27,	%f11
	fcmpgt16	%f20,	%f4,	%g6
loop_90:
	rdhpr	%htba,	%l5
	addccc	%o6,	%g7,	%g1
	movvc	%icc,	%l6,	%o4
	fmovsne	%icc,	%f13,	%f30
	orcc	%l4,	0x0BF1,	%g5
	mulscc	%i4,	%i1,	%i7
	wr	%l0,	0x1C9B,	%softint
	fnegd	%f30,	%f16
	rd	%pc,	%o1
	rdhpr	%hpstate,	%i0
	wr	%g0,	0x89,	%asi
	lduwa	[%l7 + 0x68] %asi,	%o5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x060, 	%hsys_tick_cmpr
	wrpr	%o3,	0x1154,	%tick
	wr	%o7,	0x14EB,	%ccr
	wrpr	%l2,	%i5,	%cwp
	rd	%pc,	%o2
	rdpr	%cleanwin,	%g2
	umul	%i3,	0x11C3,	%g4
	ldd	[%l7 + 0x48],	%i2
	rdpr	%wstate,	%l3
	bpos,a,pn	%xcc,	loop_91
	rdhpr	%htba,	%o0
	fmovscs	%xcc,	%f15,	%f22
	fbug,a	%fcc1,	loop_92
loop_91:
	movn	%xcc,	%l1,	%i6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xE34, 	%hsys_tick_cmpr
	rdpr	%tba,	%g6
loop_92:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x7F9, 	%tick_cmpr
	sub	%l6,	%o4,	%l4
	edge32l	%g5,	%o6,	%i1
	rdhpr	%hsys_tick_cmpr,	%i7
	rd	%softint,	%i4
	tcs	%icc,	0x5
	fones	%f11
	rdhpr	%hpstate,	%o1
	brlez,a	%l0,	loop_93
	ldsh	[%l7 + 0x70],	%o5
	rd	%sys_tick_cmpr,	%g3
	wr	%i0,	0x0C58,	%set_softint
loop_93:
	rd	%fprs,	%o3
	fbge,a	%fcc1,	loop_94
	wrpr	%l2,	%i5,	%pil
	movrlez	%o7,	%o2,	%g2
	rd	%y,	%i3
loop_94:
	nop

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

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%hpstate,	%g4
	rd	%asi,	%l1
	subcc	%i6,	%o0,	%g6
	set	0x3A, %i6
	ldsha	[%l7 + %i6] 0x04,	%g7
	fpackfix	%f26,	%f7
	fpsub16s	%f23,	%f1,	%f31
	wrpr	%g1,	0x1C65,	%tick
	fone	%f12
	umul	%l5,	0x173C,	%l6
	rdhpr	%hintp,	%o4
	movrgez	%g5,	%l4,	%i1
	tge	%icc,	0x1
	rdpr	%pil,	%i7
	wrpr	%o6,	%i4,	%pil
	fbo,a	%fcc3,	loop_95
	wr	%l0,	0x16B6,	%ccr
	rdpr	%cleanwin,	%o5
	alignaddrl	%g3,	%o1,	%i0
loop_95:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%ccr,	%l2
	wr	%i5,	%o7,	%y
	tcc	%xcc,	0x2
	mulscc	%g2,	0x1031,	%o2
	rd	%asi,	%i2
	wrpr	%l3,	%g4,	%cwp
	srax	%l1,	0x14,	%i6
	movgu	%xcc,	%i3,	%o0
	rdpr	%cwp,	%g6
	sll	%g1,	%g7,	%l5
	wrpr	%l6,	%g5,	%tick
	alignaddrl	%l4,	%o4,	%i1
	wrpr	%o6,	%i4,	%tick
	rdpr	%pil,	%l0
	wrpr	%o5,	%g3,	%tick
	mulscc	%i7,	0x1FAA,	%o1
	tcc	%xcc,	0x0
	wrpr	%i0,	%o3,	%cwp
	wr	%i5,	0x1271,	%ccr
	ldx	[%l7 + 0x78],	%o7
	rdpr	%canrestore,	%l2
	wr	%o2,	%g2,	%ccr
	fmovrsne	%l3,	%f3,	%f28
	rdhpr	%hpstate,	%g4
	fpsub32	%f4,	%f10,	%f14
	rdhpr	%hpstate,	%l1
	edge16ln	%i6,	%i3,	%i2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xC58, 	%hsys_tick_cmpr
	faligndata	%f20,	%f22,	%f2
	rdhpr	%hsys_tick_cmpr,	%g7
	fmovsn	%icc,	%f3,	%f19
	tsubcc	%l5,	%l6,	%g6
	wr	%g5,	0x12B2,	%pic
	rdpr	%canrestore,	%l4
	wrpr	%o4,	%i1,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	bg,pt	%xcc,	loop_96
	smul	%l0,	0x04AE,	%o6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	brnz,a	%o5,	loop_97
loop_96:
	ldx	[%l7 + 0x38],	%i0
	wrpr	%o3,	0x05C7,	%pil
	sethi	0x05B7,	%o1
loop_97:
	fzero	%f6
	movrlez	%l2,	%g2,	%o2
	rdpr	%gl,	%l3
	rdhpr	%hsys_tick_cmpr,	%l1
	wr	%i6,	%i3,	%pic
	movcc	%icc,	%g4,	%i2
	edge32n	%o0,	%g7,	%g1
	wrpr	%l6,	0x12AD,	%tick
	edge16	%g6,	%l5,	%l4
	movpos	%xcc,	%o4,	%i1
	rdhpr	%hsys_tick_cmpr,	%g5
	fzero	%f22
	movge	%icc,	%i4,	%l0
	rd	%sys_tick_cmpr,	%g3
	rdpr	%tba,	%i7
	addccc	%o5,	%o6,	%i0
	fble,a	%fcc0,	loop_98
	rdpr	%gl,	%o3
	movrgez	%o1,	0x3C7,	%o7
	xorcc	%l2,	%g2,	%i5
loop_98:
	wrpr	%l3,	%o2,	%cwp
	movvc	%icc,	%i3,	%g4
	rdhpr	%hsys_tick_cmpr,	%o0
	stw	%i2,	[%l7 + 0x6C]
	rd	%y,	%g1
	movcs	%icc,	%g7,	%l6
	rd	%fprs,	%g6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x556, 	%hsys_tick_cmpr
	wrpr	%i1,	%o4,	%cwp
	rdhpr	%hintp,	%g5
	array16	%l0,	%i4,	%i7
	fba	%fcc1,	loop_99
	rdhpr	%hpstate,	%o5
	rdhpr	%hsys_tick_cmpr,	%o6
	rd	%y,	%g3
loop_99:
	wrpr	%i0,	0x0D03,	%cwp
	edge32	%o1,	%o7,	%o3
	fble	%fcc1,	loop_100
	pdist	%f16,	%f6,	%f6
	fands	%f8,	%f8,	%f16
	ldd	[%l7 + 0x30],	%f28
loop_100:
	movne	%xcc,	%l2,	%i5
	wrpr	%g2,	%l3,	%cwp
	wrpr	%i6,	0x11E2,	%cwp
	movrgez	%o2,	0x3F6,	%l1
	fbo,a	%fcc0,	loop_101
	fmovdneg	%icc,	%f24,	%f16
	wr	%i3,	%g4,	%sys_tick
	movrgez	%i2,	0x2B9,	%g1
loop_101:
	rdhpr	%hsys_tick_cmpr,	%o0
	rdpr	%pil,	%l6
	fmovsgu	%xcc,	%f6,	%f15
	edge32n	%g7,	%g6,	%l4
	movl	%icc,	%i1,	%l5
	brnz	%g5,	loop_102
	wrpr	%o4,	%i4,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xD53, 	%hsys_tick_cmpr
	membar	#Sync
	set	0x40, %o6
	ldda	[%l7 + %o6] 0x16,	%f16
loop_102:
	rdpr	%cleanwin,	%i7
	rdpr	%wstate,	%g3
	tl	%xcc,	0x0
	wrpr	%o6,	%i0,	%tick
	mulx	%o1,	0x1AFC,	%o7
	rd	%ccr,	%l2
	rd	%sys_tick_cmpr,	%o3
	mulx	%g2,	%i5,	%i6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xE6B, 	%sys_tick_cmpr
	rdpr	%otherwin,	%l1
	rdpr	%pil,	%o2
	rdhpr	%htba,	%i3
	udivx	%g4,	0x1E34,	%g1
	stx	%i2,	[%l7 + 0x28]
	wr	%o0,	0x1636,	%y
	rd	%fprs,	%l6
	rdpr	%cansave,	%g7
	fmovdvs	%icc,	%f16,	%f23
	movcc	%icc,	%g6,	%i1
	wrpr	%l5,	%l4,	%tick
	rd	%pc,	%o4
	rdhpr	%hintp,	%g5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x44D, 	%hsys_tick_cmpr
	add	%o5,	%i7,	%l0
	sdivx	%g3,	0x0AC8,	%o6
	fmovda	%icc,	%f21,	%f18
	rdhpr	%hsys_tick_cmpr,	%i0
	fbo,a	%fcc3,	loop_103
	rdpr	%tba,	%o7
	rdpr	%pil,	%l2
	wrpr	%o1,	%o3,	%cwp
loop_103:
	movrlez	%g2,	0x053,	%i6
	wr	%l3,	0x0873,	%clear_softint
	fbl,a	%fcc3,	loop_104
	rdpr	%tl,	%i5
	rdhpr	%hpstate,	%o2
	subccc	%i3,	%g4,	%l1
loop_104:
	tne	%xcc,	0x6
	wr 	%g0, 	0x7, 	%fprs
	ldub	[%l7 + 0x2C],	%o0
	rdhpr	%hsys_tick_cmpr,	%g7
	wrpr	%g6,	%i1,	%pil
	fxnors	%f30,	%f23,	%f16
	wr	%l6,	%l4,	%ccr
	wrpr	%o4,	%l5,	%tick
	rdhpr	%hpstate,	%i4
	fbl	%fcc2,	loop_105
	tgu	%icc,	0x2
	wr	%g5,	%o5,	%y
	wr	%l0,	%g3,	%set_softint
loop_105:
	wrpr	%o6,	0x1AAA,	%cwp
	add	%i7,	0x1C0F,	%o7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x631, 	%hsys_tick_cmpr
	rd	%tick_cmpr,	%o3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%o1,	%i6,	%pil
	wr	%i5,	%o2,	%pic
	mova	%icc,	%l3,	%i3
	rdpr	%gl,	%l1
	xnor	%i2,	%g1,	%g4
	srax	%g7,	0x18,	%o0
	fbue	%fcc0,	loop_106
	wrpr	%g6,	0x0B58,	%pil
	rdhpr	%htba,	%i1
	movrlz	%l6,	0x139,	%o4
loop_106:
	wr	%l5,	%i4,	%pic
	rdpr	%canrestore,	%l4
	fones	%f11
	udivcc	%o5,	0x174B,	%l0
	fmovdpos	%icc,	%f4,	%f25
	rdhpr	%hintp,	%g5
	fcmpne16	%f18,	%f28,	%o6
	bne,a,pn	%icc,	loop_107
	mova	%icc,	%g3,	%i7
	rd	%asi,	%o7
	rdpr	%tl,	%i0
loop_107:
	wrpr	%l2,	%o3,	%tick
	edge8l	%o1,	%g2,	%i5
	rdpr	%cleanwin,	%i6
	wr	%o2,	0x1AF8,	%ccr
	wrpr	%l3,	%i3,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%softint,	%i2
	sdivcc	%g4,	0x1FAC,	%g1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xC8B, 	%hsys_tick_cmpr
	rdpr	%canrestore,	%o0
	flushw
	fbl,a	%fcc0,	loop_108
	rd	%sys_tick_cmpr,	%i1
	rdhpr	%hsys_tick_cmpr,	%l6
	bneg,a,pn	%icc,	loop_109
loop_108:
	andncc	%l5,	%o4,	%i4
	rdpr	%tba,	%l4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xA3F, 	%hsys_tick_cmpr
loop_109:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	add	%g5,	0x1090,	%o6
	rd	%fprs,	%g3
	set	0x20, %o1
	ldda	[%l7 + %o1] 0x15,	%i6
	prefetch	[%l7 + 0x40],	 0x1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x856, 	%hsys_tick_cmpr
	wrpr	%l2,	0x17BD,	%pil
	set	0x7C, %l3
	lda	[%l7 + %l3] 0x80,	%f11
	wrpr	%i0,	%o3,	%pil
	rdhpr	%hpstate,	%g2
	rd	%softint,	%i5
	fmovrdgz	%o1,	%f28,	%f6
	fmovrslez	%i6,	%f17,	%f19
	fmovscs	%xcc,	%f26,	%f21
	rdpr	%canrestore,	%o2
	wrpr	%i3,	0x1D8F,	%tick
	membar	0x6B
	fmovrdlz	%l3,	%f30,	%f18
	brlez,a	%i2,	loop_110
	tne	%icc,	0x4
	set	0x40, %g1
	stda	%f0,	[%l7 + %g1] 0x10
loop_110:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xB0F, 	%hsys_tick_cmpr
	set	0x28, %o3
	stxa	%g1,	[%l7 + %o3] 0x2a
	membar	#Sync
	rdhpr	%hpstate,	%g4
	tvc	%icc,	0x5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x690, 	%hsys_tick_cmpr
	taddcctv	%g6,	0x0262,	%l6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x46E, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x788, 	%hsys_tick_cmpr
	edge8l	%i4,	%o4,	%l4
	ta	%xcc,	0x7
	wrpr	%o5,	%o6,	%pil
	rdhpr	%hsys_tick_cmpr,	%g3
	wr	%g5,	%l0,	%pic
	movneg	%xcc,	%o7,	%i7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%hpstate,	%o3
	andncc	%i5,	%o1,	%g2
	wrpr	%i6,	0x06F2,	%pil
	wr	%i3,	0x0385,	%sys_tick
	wrpr	%l3,	%o2,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%l1,	%o0,	%pil
	wr 	%g0, 	0x6, 	%fprs
	tvc	%xcc,	0x2
	rd	%tick_cmpr,	%g7
	rdhpr	%hsys_tick_cmpr,	%l6
	rdhpr	%hpstate,	%l5
	fmovdcs	%xcc,	%f0,	%f31

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	movneg	%xcc,	%o4,	%l4
	rdhpr	%hintp,	%o5
	orn	%o6,	0x087C,	%i1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x53D, 	%hsys_tick_cmpr
	rd	%pc,	%l0
	wrpr	%g3,	0x17CE,	%cwp
	rdhpr	%hpstate,	%i7
	nop
	setx loop_111, %l0, %l1
	jmpl %l1, %i0
	fcmpd	%fcc0,	%f28,	%f4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fmovdneg	%icc,	%f25,	%f10
loop_111:
	movne	%icc,	%l2,	%o1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x8B6, 	%hsys_tick_cmpr
	fmovde	%icc,	%f11,	%f13
	umul	%g2,	%i3,	%i6
	srlx	%l3,	0x04,	%o2
	fzero	%f8
	wr	%g0,	0x80,	%asi
	ldswa	[%l7 + 0x78] %asi,	%g1
	add	%l7,	0x28,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%g4
	casa	[%l6] 0x80,	%g4,	%i2
	rd	%asi,	%l1
	rdpr	%cleanwin,	%o0
	edge8l	%g6,	%g7,	%l5
	fmovdl	%xcc,	%f15,	%f12
	wrpr	%l6,	0x069F,	%cwp
	rd	%fprs,	%o4
	rdhpr	%hintp,	%i4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	array8	%l4,	%i1,	%g5
	sub	%l0,	0x0D70,	%g3
	rdhpr	%hpstate,	%i7
	fmul8x16al	%f15,	%f6,	%f24
	fpsub32s	%f30,	%f20,	%f18
	rdpr	%tl,	%o7
	wr	%i0,	%o3,	%y
	rd	%ccr,	%l2
	rdhpr	%hpstate,	%i5
	wrpr	%o1,	0x052F,	%cwp
	wrpr	%i3,	%i6,	%tick
	fzero	%f6
	wr	%g2,	%l3,	%ccr
	sdivcc	%g1,	0x1353,	%g4
	edge8ln	%i2,	%o2,	%o0
	bneg,pn	%icc,	loop_112
	movn	%icc,	%g6,	%l1
	rdpr	%cleanwin,	%g7
	fandnot2	%f28,	%f24,	%f6
loop_112:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x636, 	%hsys_tick_cmpr
	popc	0x0A1F,	%i4
	fnors	%f29,	%f10,	%f4
	rdhpr	%hsys_tick_cmpr,	%o5
	edge8	%o6,	%l5,	%i1
	fmovdcc	%xcc,	%f9,	%f14
	bcs,a	loop_113
	sir	0x1F9D
	bl	%icc,	loop_114
	rdhpr	%hpstate,	%l4
loop_113:
	wr	%l0,	0x0B1E,	%pic
	sir	0x0948
loop_114:
	rdhpr	%hsys_tick_cmpr,	%g3
	fmovdn	%xcc,	%f8,	%f13
	move	%xcc,	%i7,	%o7
	rdhpr	%hpstate,	%i0
	set	0x41, %o4
	ldstuba	[%l7 + %o4] 0x10,	%o3
	subc	%g5,	%i5,	%l2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x654, 	%hsys_tick_cmpr
	fmovsne	%icc,	%f3,	%f12
	rdpr	%gl,	%g2
	rdhpr	%hpstate,	%l3
	rd	%asi,	%o1
	brlz	%g1,	loop_115
	rdhpr	%hsys_tick_cmpr,	%g4
	fnand	%f20,	%f24,	%f28
	subccc	%i2,	0x17BD,	%o2
loop_115:
	rdhpr	%hpstate,	%o0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x8F3, 	%hsys_tick_cmpr
	wr	%g0,	0x04,	%asi
	ldsba	[%l7 + 0x18] %asi,	%g6
	ld	[%l7 + 0x40],	%f25
	wr	%g7,	%o4,	%y
	xnorcc	%i4,	%o5,	%o6
	wr	%g0,	0x04,	%asi
	stxa	%l5,	[%l7 + 0x30] %asi
	rdhpr	%htba,	%i1
	rdhpr	%hintp,	%l6
	taddcctv	%l4,	%l0,	%g3
	set	0x54, %l2
	sta	%f20,	[%l7 + %l2] 0x18
	rdpr	%canrestore,	%i7
	wrpr	%i0,	%o7,	%pil
	movpos	%xcc,	%o3,	%i5
	edge8n	%l2,	%i3,	%g5
	fpadd32	%f14,	%f12,	%f6
	wr	%i6,	%l3,	%pic
	membar	0x39
	fbne,a	%fcc0,	loop_116
	array16	%o1,	%g2,	%g1
	array32	%i2,	%g4,	%o0
	fpadd16	%f2,	%f16,	%f22
loop_116:
	te	%icc,	0x0
	xorcc	%o2,	%g6,	%g7
	sir	0x024E
	tsubcc	%o4,	0x1E23,	%i4
	wrpr	%l1,	0x1BDA,	%cwp
	rd	%softint,	%o6
	fmovrslz	%o5,	%f4,	%f17
	movrlez	%l5,	%l6,	%l4
	wrpr	%i1,	0x09A1,	%pil
	fornot1s	%f24,	%f21,	%f30
	fcmpne32	%f18,	%f16,	%l0
	mova	%xcc,	%g3,	%i7
	wrpr	%o7,	%o3,	%pil
	movleu	%xcc,	%i5,	%i0
	wr 	%g0, 	0x6, 	%fprs
	rdpr	%cleanwin,	%i6
	fcmpes	%fcc0,	%f1,	%f17
	ta	%icc,	0x4
	xnorcc	%g5,	%o1,	%g2
	wr	%l3,	0x086C,	%pic
	taddcctv	%g1,	0x0998,	%i2
	fmovda	%xcc,	%f1,	%f7
	wr	%g4,	%o2,	%sys_tick
	rdpr	%canrestore,	%o0
	sub	%g6,	%o4,	%g7
	ldd	[%l7 + 0x30],	%i4
	tvs	%xcc,	0x5
	membar	0x23
	rdhpr	%htba,	%o6
	wr	%l1,	%o5,	%ccr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xFC7, 	%hsys_tick_cmpr
	flushw
	rd	%y,	%i1
	std	%l4,	[%l7 + 0x70]

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%hintp,	%o7
	andn	%i7,	%i5,	%o3
	flushw
	rdpr	%tba,	%i3
	fcmpgt16	%f12,	%f28,	%l2
	wrpr	%i6,	%i0,	%tick
	rdpr	%gl,	%g5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	smul	%g2,	0x069D,	%l3
	taddcctv	%i2,	%g4,	%g1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xD48, 	%hsys_tick_cmpr
	rdhpr	%htba,	%o0
	fmovde	%icc,	%f22,	%f24
	tge	%icc,	0x5
	wrpr	%o4,	0x0E80,	%tick
	udivcc	%g7,	0x195D,	%g6
	fmovs	%f26,	%f18
	rd	%y,	%o6
	fors	%f28,	%f19,	%f3
	fbug,a	%fcc1,	loop_117
	sth	%i4,	[%l7 + 0x6E]
	fbue	%fcc3,	loop_118
	fbo,a	%fcc2,	loop_119
loop_117:
	rdpr	%wstate,	%l1
	bshuffle	%f0,	%f18,	%f18
loop_118:
	nop
	set	0x40, %i3
	stda	%f16,	[%l7 + %i3] 0x1f
	membar	#Sync
loop_119:
	subc	%l5,	%l6,	%o5
	tvc	%xcc,	0x5
	tpos	%icc,	0x3
	wrpr	%l0,	%l4,	%tick
	wrpr	%g3,	0x0803,	%pil
	wr 	%g0, 	0x4, 	%fprs
	fnot1	%f16,	%f28
	fmovsge	%icc,	%f14,	%f23
	wr	%o3,	%i3,	%set_softint

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%cansave,	%i6
	rdpr	%wstate,	%i5
	nop
	setx	loop_120,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movle	%icc,	%g5,	%o1
	wr	%g0,	0x89,	%asi
	ldstuba	[%l7 + 0x33] %asi,	%i0
loop_120:
	wr	%g2,	%l3,	%set_softint
	addcc	%g4,	0x1B40,	%g1
	movl	%xcc,	%i2,	%o2
	rdpr	%tba,	%o4
	edge32ln	%o0,	%g7,	%g6
	te	%xcc,	0x4
	rd	%softint,	%i4
	wrpr	%l1,	0x1D12,	%cwp
	te	%icc,	0x4
	fmovdgu	%icc,	%f25,	%f10
	fxor	%f12,	%f20,	%f28
	fmul8sux16	%f14,	%f30,	%f14

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x7CD, 	%tick_cmpr
	sdiv	%l6,	0x0A49,	%o5
	ta	%icc,	0x0
	wr	%g0,	0x19,	%asi
	swapa	[%l7 + 0x38] %asi,	%i1
	rdpr	%gl,	%l0
	edge16	%g3,	%o7,	%l4
	flushw
	te	%xcc,	0x6
	rd	%pc,	%o3
	rdpr	%cwp,	%i7
	wrpr	%l2,	%i3,	%tick
	wrpr	%i5,	0x02FC,	%cwp
	udivcc	%i6,	0x11DC,	%o1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xE6C, 	%hsys_tick_cmpr
	fzero	%f30
	movrgz	%i0,	0x0AE,	%g4
	wr	%g1,	%i2,	%y
	wrpr	%o2,	0x09D1,	%tick
	wrpr	%l3,	%o4,	%tick
	rd	%asi,	%g7
	wr	%o0,	%g6,	%clear_softint
	wrpr	%l1,	%o6,	%cwp
	rd	%tick_cmpr,	%l6
	movvs	%xcc,	%i4,	%o5
	rdhpr	%hsys_tick_cmpr,	%l0
	tpos	%xcc,	0x7
	subcc	%i1,	%g3,	%l5
	wr	%o7,	%o3,	%ccr
	rdpr	%tba,	%l4
	wrpr	%l2,	%i7,	%tick
	wrpr	%i3,	%i5,	%cwp
	wrpr	%i6,	%o1,	%tick
	movrgez	%g2,	0x086,	%i0
	rdhpr	%htba,	%g4
	tvs	%xcc,	0x4
	rd	%softint,	%g5
	rd	%pc,	%g1
	fmuld8ulx16	%f3,	%f5,	%f18
	rdhpr	%hintp,	%i2
	rdhpr	%htba,	%o2
	tle	%xcc,	0x4
	udiv	%o4,	0x015A,	%g7
	rdpr	%gl,	%l3
	rd	%sys_tick_cmpr,	%o0
	rdpr	%pil,	%l1
	movg	%xcc,	%g6,	%o6
	movleu	%xcc,	%l6,	%i4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x9D6, 	%hsys_tick_cmpr
	rdpr	%cansave,	%l0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x1EB, 	%tick_cmpr
	movrlz	%o7,	%l4,	%o3
	array8	%l2,	%i7,	%i5
	rdpr	%cleanwin,	%i6
	rdhpr	%htba,	%o1
	wrpr	%g2,	0x0A92,	%cwp
	wr	%i3,	%i0,	%set_softint
	rd	%asi,	%g5
	rdpr	%cansave,	%g1
	wrpr	%i2,	0x15A7,	%cwp
	tcs	%icc,	0x0
	srl	%o2,	0x00,	%o4
	rd	%tick_cmpr,	%g7
	move	%icc,	%l3,	%o0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x8DC, 	%hsys_tick_cmpr
	wrpr	%g6,	%o6,	%pil
	rdpr	%cwp,	%l6
	wr	%i4,	0x1E32,	%pic
	nop
	set	0x3A, %g4
	ldsh	[%l7 + %g4],	%o5
	rd	%tick_cmpr,	%i1
	rd	%tick_cmpr,	%l1
	fcmple32	%f26,	%f16,	%l5
	rd	%pc,	%l0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%htba,	%o7
	bneg	%xcc,	loop_121
	rdpr	%cansave,	%l4
	rdhpr	%hintp,	%l2
	rd	%y,	%i7
loop_121:
	wrpr	%o3,	0x0AA6,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	movleu	%xcc,	%g2,	%o1
	rdpr	%canrestore,	%i0
	wrpr	%i3,	%g1,	%tick
	edge8	%i2,	%g5,	%o4
	wrpr	%g7,	%o2,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%hpstate,	%g6
	rdhpr	%hpstate,	%l6
	rd	%pc,	%o5
	rd	%asi,	%i1
	rdpr	%otherwin,	%i4
	tgu	%icc,	0x4
	ldub	[%l7 + 0x29],	%l1
	edge16l	%l0,	%l5,	%o7
	rdhpr	%hintp,	%g3
	sdiv	%l2,	0x0448,	%i7
	umul	%o3,	%l4,	%i5
	wr	%g2,	%o1,	%ccr
	fmovsl	%icc,	%f1,	%f19

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%g0,	0x89,	%asi
	ldstuba	[%l7 + 0x0C] %asi,	%i3
	rdpr	%cleanwin,	%i0
	rd	%tick_cmpr,	%g1
	rd	%ccr,	%g5
	rdpr	%cansave,	%i2
	rdhpr	%hpstate,	%g7
	rdpr	%otherwin,	%o4
	wrpr	%l3,	%o2,	%tick
	bg,a,pt	%icc,	loop_122
	rd	%ccr,	%g4
	rd	%fprs,	%o0
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x68] %asi,	%g6
loop_122:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%hintp,	%l6
	tge	%icc,	0x0
	rdpr	%tba,	%o5
	wr	%i4,	0x0E47,	%ccr
	bl,pn	%xcc,	loop_123
	movg	%icc,	%l1,	%i1
	set	0x40, %i2
	stda	%f0,	[%l7 + %i2] 0x1f
	membar	#Sync
loop_123:
	rdpr	%cwp,	%l5
	fbule,a	%fcc1,	loop_124
	fmovsge	%xcc,	%f23,	%f1
	rdpr	%cleanwin,	%l0
	wr	%g3,	%l2,	%ccr
loop_124:
	umul	%i7,	0x113A,	%o7
	wrpr	%o3,	%l4,	%tick
	movpos	%icc,	%g2,	%o1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x631, 	%hsys_tick_cmpr
	rdhpr	%hpstate,	%i6
	movvs	%icc,	%i0,	%g1
	add	%l7,	0x58,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] %asi,	%i3,	%g5
	tsubcc	%g7,	0x0930,	%o4
	brnz	%l3,	loop_125
	fbn,a	%fcc2,	loop_126
	move	%xcc,	%i2,	%g4
	tsubcc	%o0,	0x160E,	%o2
loop_125:
	wr	%g6,	%l6,	%ccr
loop_126:
	alignaddrl	%o5,	%i4,	%l1
	rdhpr	%hsys_tick_cmpr,	%i1
	wr	%l5,	%o6,	%y

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x3A5, 	%hsys_tick_cmpr
	xorcc	%l0,	%l2,	%i7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%fprs,	%g2
	wr	%l4,	%i5,	%pic
	rd	%pc,	%i6
	andn	%o1,	%i0,	%g1
	bl,a,pn	%xcc,	loop_127
	xor	%i3,	%g7,	%g5
	movneg	%xcc,	%l3,	%i2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_127:
	fsrc2s	%f18,	%f14
	rdhpr	%hsys_tick_cmpr,	%o0
	edge16	%o4,	%o2,	%g6
	rdpr	%gl,	%l6
	rdpr	%otherwin,	%o5
	rdhpr	%hpstate,	%i4
	rdhpr	%htba,	%l1
	wrpr	%i1,	%o6,	%tick
	rdpr	%otherwin,	%g3
	wr	%g0,	0x0c,	%asi
	stwa	%l0,	[%l7 + 0x54] %asi
	wrpr	%l5,	0x0B18,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%o3,	%l2,	%pic
	stbar
	wrpr	%o7,	0x0F8D,	%cwp
	sethi	0x0118,	%g2
	xnorcc	%i5,	0x01E8,	%l4
	set	0x24, %o7
	lduwa	[%l7 + %o7] 0x81,	%o1
	wrpr	%i0,	0x1B64,	%tick
	wrpr	%g1,	%i3,	%cwp
	wr	%i6,	0x1B48,	%pic
	udivx	%g5,	0x1339,	%g7
	xnorcc	%l3,	%g4,	%i2
	wrpr	%o4,	%o2,	%tick
	fmovdcc	%icc,	%f30,	%f30
	fandnot2s	%f8,	%f31,	%f1
	brlz,a	%o0,	loop_128
	fmovdgu	%xcc,	%f31,	%f20
	wr	%g6,	0x11D6,	%clear_softint
	subccc	%o5,	0x01D6,	%l6
loop_128:
	nop
	set	0x50, %l1
	prefetcha	[%l7 + %l1] 0x15,	 0x0
	edge8	%i1,	%o6,	%l1
	rdhpr	%hintp,	%g3
	wrpr	%l5,	0x043D,	%pil
	rdpr	%tl,	%l0
	tvc	%icc,	0x0
	fxnors	%f2,	%f27,	%f6
	wr	%g0,	0x89,	%asi
	lduba	[%l7 + 0x42] %asi,	%o3
	rd	%asi,	%i7
	fmovsg	%icc,	%f8,	%f26
	wrpr	%l2,	0x117F,	%tick
	rdhpr	%hsys_tick_cmpr,	%o7
	mulscc	%g2,	0x1DC4,	%l4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%asi,	%i5
	fmovsgu	%xcc,	%f8,	%f2
	bl,pn	%xcc,	loop_129
	tcc	%icc,	0x6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x01C, 	%hsys_tick_cmpr
	rdpr	%tl,	%g1
loop_129:
	subcc	%g5,	0x1535,	%g7
	rdpr	%gl,	%l3
	wr 	%g0, 	0x5, 	%fprs

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xA46, 	%sys_tick_cmpr
	rd	%asi,	%g6
	wrpr	%o0,	0x0647,	%pil
	wr 	%g0, 	0x6, 	%fprs
	wr	%i4,	%l6,	%clear_softint
	wrpr	%i1,	%o6,	%tick
	wr	%g3,	%l5,	%ccr
	fxors	%f13,	%f1,	%f7
	wr	%l0,	0x0D5C,	%ccr
	rdpr	%cansave,	%l1
	rdhpr	%htba,	%o3
	bneg,a	loop_130
	wr	%i7,	0x0A60,	%softint
	edge32l	%o7,	%l2,	%l4
	rdhpr	%htba,	%g2
loop_130:
	xnorcc	%i0,	0x0D7F,	%o1
	fmovdcc	%icc,	%f27,	%f31

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%tl,	%i5
	ldd	[%l7 + 0x28],	%f6
	edge16ln	%g1,	%g5,	%i6
	fmul8ulx16	%f8,	%f20,	%f6
	orn	%g4,	0x1DC1,	%g7
	rdhpr	%hpstate,	%o4
	fxnor	%f28,	%f30,	%f30
	rd	%y,	%i4
	prefetch	[%l7 + 0x50],	 0x2
	bcc,pn	%icc,	loop_131
	movgu	%icc,	%l6,	%o6
	rd	%softint,	%i1
	rdhpr	%hsys_tick_cmpr,	%g3
loop_131:
	rdpr	%tba,	%l5
	rdpr	%tl,	%l1
	xor	%o3,	0x1B6A,	%l0
	rdpr	%gl,	%i7
	fble	%fcc3,	loop_132
	tne	%icc,	0x5
	tgu	%icc,	0x4
	movle	%xcc,	%o7,	%l4
loop_132:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	wrpr	%i0,	%i3,	%pil
	tpos	%icc,	0x3
	wr	%o1,	0x05FE,	%y
	wrpr	%i5,	%g5,	%cwp
	wr	%i6,	%g1,	%sys_tick
	addc	%i2,	%g4,	%g7
	fnot1s	%f18,	%f22

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xCFC, 	%hsys_tick_cmpr
	edge32l	%o0,	%l3,	%o5
	rdhpr	%hpstate,	%o2
	rdhpr	%hintp,	%i4
	rdhpr	%htba,	%o6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x250, 	%hsys_tick_cmpr
	edge32l	%g3,	%i1,	%l1
	rd	%tick_cmpr,	%o3
	wrpr	%l5,	%i7,	%cwp
	ldsw	[%l7 + 0x24],	%l0
	rdhpr	%hsys_tick_cmpr,	%o7
	wrpr	%g2,	%l2,	%pil
	wrpr	%l4,	0x11B6,	%pil
	fands	%f7,	%f4,	%f30
	wr	%i3,	%i0,	%pic
	wrpr	%i5,	0x14E4,	%pil
	movrgez	%o1,	0x111,	%i6
	wr 	%g0, 	0x4, 	%fprs

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x8B9, 	%hsys_tick_cmpr
	membar	0x0D
	ldx	[%l7 + 0x60],	%g7
	movleu	%icc,	%o4,	%o0
	nop
	setx	loop_133,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	rdpr	%tl,	%l3
	move	%icc,	%o5,	%g6
	rdhpr	%hsys_tick_cmpr,	%i4
loop_133:
	rdhpr	%hpstate,	%o6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xCC2, 	%hsys_tick_cmpr
	movrlz	%l6,	0x281,	%l1
	wr 	%g0, 	0x5, 	%fprs
	rd	%fprs,	%l5
	rd	%ccr,	%i1
	rdhpr	%hpstate,	%l0
	srax	%o7,	0x03,	%g2
	rdpr	%tba,	%i7
	rdhpr	%hintp,	%l2
	set	0x08, %l0
	swapa	[%l7 + %l0] 0x80,	%i3
	smul	%i0,	0x08F8,	%i5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x791, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x43E, 	%hsys_tick_cmpr
	tcc	%xcc,	0x3
	rdpr	%cwp,	%o1
	fble,a	%fcc0,	loop_134
	movge	%xcc,	%i2,	%g1
	rdhpr	%hpstate,	%g5
	wrpr	%g4,	%g7,	%pil
loop_134:
	fmovdn	%xcc,	%f5,	%f23
	rdpr	%pil,	%o0
	rdpr	%tba,	%o4
	rd	%ccr,	%o5
	tle	%xcc,	0x4
	bl,a,pt	%xcc,	loop_135
	tcc	%icc,	0x6
	wr	%g6,	%i4,	%sys_tick
	rd	%softint,	%l3
loop_135:
	wrpr	%o6,	%g3,	%tick
	wrpr	%l6,	0x1575,	%pil
	rdpr	%canrestore,	%l1
	brnz	%o2,	loop_136
	wrpr	%o3,	0x12AD,	%tick
	rd	%softint,	%i1
	ldstub	[%l7 + 0x63],	%l0
loop_136:
	rd	%sys_tick_cmpr,	%l5
	fbn,a	%fcc1,	loop_137
	rdpr	%otherwin,	%o7
	rdhpr	%hsys_tick_cmpr,	%g2
	wrpr	%i7,	%i3,	%pil
loop_137:
	orncc	%i0,	0x1ACF,	%i5
	rdpr	%cansave,	%l2
	rdpr	%wstate,	%l4
	array32	%o1,	%i6,	%i2
	edge16ln	%g5,	%g4,	%g1
	rdhpr	%hintp,	%g7
	rdhpr	%htba,	%o0
	fmul8x16al	%f19,	%f6,	%f12
	ta	%icc,	0x7
	wrpr	%o5,	0x0593,	%cwp
	wrpr	%g6,	0x0DD3,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x2F2, 	%hsys_tick_cmpr
	rdhpr	%hintp,	%o4
	wr	%l3,	0x1729,	%y
	movrgez	%g3,	0x0CC,	%l6
	addc	%o6,	%o2,	%o3
	membar	0x77
	fmovsle	%xcc,	%f26,	%f1
	wr	%i1,	%l0,	%set_softint
	taddcc	%l5,	%o7,	%l1
	tneg	%xcc,	0x7
	wr	%i7,	0x115D,	%ccr
	rdpr	%canrestore,	%i3
	rdhpr	%hintp,	%g2
	ta	%xcc,	0x2
	wr	%i5,	%i0,	%pic
	movrgz	%l2,	0x01B,	%l4
	rd	%fprs,	%o1
	rd	%sys_tick_cmpr,	%i6
	rdhpr	%htba,	%i2
	rd	%asi,	%g5
	rdpr	%cleanwin,	%g4
	fornot2	%f28,	%f28,	%f6
	tge	%xcc,	0x4
	alignaddrl	%g1,	%g7,	%o5
	rdpr	%gl,	%o0
	sdivcc	%i4,	0x07EB,	%o4
	wrpr	%l3,	%g3,	%cwp
	rdhpr	%hpstate,	%g6
	wrpr	%o6,	%o2,	%tick
	fmovsvs	%icc,	%f14,	%f13
	rdhpr	%hsys_tick_cmpr,	%l6
	rd	%fprs,	%o3
	fbue	%fcc3,	loop_138
	rdpr	%cwp,	%l0
	fmovrdgz	%l5,	%f0,	%f0
	sth	%o7,	[%l7 + 0x7E]
loop_138:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xC38, 	%hsys_tick_cmpr
	fmovdg	%icc,	%f16,	%f7
	rdpr	%tba,	%l1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%gl,	%g2
	wrpr	%i0,	0x1D75,	%cwp
	wrpr	%l2,	%l4,	%tick
	wrpr	%i5,	0x18AD,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x184, 	%hsys_tick_cmpr
	ldstub	[%l7 + 0x71],	%i2
	edge8n	%g5,	%g4,	%o1
	edge8	%g1,	%g7,	%o0
	rdpr	%cleanwin,	%i4
	wrpr	%o4,	0x09B4,	%cwp
	nop
	set	0x5B, %o2
	ldsb	[%l7 + %o2],	%o5
	wr	%l3,	%g3,	%pic
	rdpr	%otherwin,	%o6
	wrpr	%g6,	0x0FE8,	%cwp
	srl	%l6,	%o2,	%o3
	rdpr	%canrestore,	%l0
	rd	%y,	%o7
	tleu	%icc,	0x2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x79E, 	%sys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xCC8, 	%hsys_tick_cmpr
	ldd	[%l7 + 0x68],	%i2
	add	%l7,	0x30,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%i7
	casxa	[%l6] %asi,	%i7,	%i0
	set	0x1B, %g3
	ldstuba	[%l7 + %g3] 0x89,	%g2
	wr	%l4,	0x088B,	%ccr
	popc	%i5,	%i6
	rdhpr	%hpstate,	%l2
	rdpr	%cansave,	%g5
	rdpr	%wstate,	%i2
	wrpr	%o1,	%g1,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xCA4, 	%tick_cmpr
	sllx	%o0,	0x0A,	%i4
	set	0x78, %g5
	ldsba	[%l7 + %g5] 0x81,	%g4
	fcmpd	%fcc0,	%f12,	%f12
	rdhpr	%hsys_tick_cmpr,	%o5
	sll	%l3,	%o4,	%o6
	wrpr	%g3,	%l6,	%pil
	tsubcctv	%g6,	%o2,	%l0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xD48, 	%hsys_tick_cmpr
	wrpr	%i1,	%l1,	%cwp
	fandnot2s	%f25,	%f11,	%f9

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%tick_cmpr,	%i0
	edge16n	%i7,	%g2,	%l4
	rdhpr	%hsys_tick_cmpr,	%i5
	fmovdl	%xcc,	%f5,	%f11

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	edge8l	%i6,	%g5,	%i2
	nop
	setx	loop_139,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	ld	[%l7 + 0x34],	%f30
	wrpr	%g1,	0x02A7,	%cwp
	movcc	%xcc,	%o1,	%o0
loop_139:
	rdpr	%otherwin,	%g7
	wrpr	%g4,	0x1DF7,	%pil
	rdhpr	%hsys_tick_cmpr,	%o5
	wr	%l3,	0x05DE,	%pic
	wrpr	%o4,	%o6,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	or	%g6,	%g3,	%l0
	std	%f20,	[%l7 + 0x68]
	rdpr	%cwp,	%o7
	rdhpr	%hsys_tick_cmpr,	%o3
	wr 	%g0, 	0x6, 	%fprs
	movl	%xcc,	%l1,	%i3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x3ED, 	%tick_cmpr
	add	%l7,	0x70,	%l6
	wr	%g0,	0x10,	%asi
	casxa	[%l6] %asi,	%i7,	%g2
	rdpr	%cleanwin,	%l4
	fbl,a	%fcc1,	loop_140
	wr	%l2,	0x1F2B,	%pic

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	popc	0x0B40,	%i2
loop_140:
	fmovsn	%icc,	%f20,	%f1
	sdivcc	%g1,	0x01AF,	%i6
	fmovs	%f0,	%f0
	wr	%o0,	0x0722,	%clear_softint
	wrpr	%g7,	%g4,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	rdpr	%pil,	%o5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	set	0x57, %i1
	ldsba	[%l7 + %i1] 0x89,	%o6
	fbe,a	%fcc3,	loop_141
	rdhpr	%hintp,	%l6
	rdpr	%cwp,	%g6
	fpsub16s	%f27,	%f14,	%f2
loop_141:
	rdhpr	%hpstate,	%l0
	rdhpr	%hsys_tick_cmpr,	%o7
	movge	%icc,	%g3,	%o3
	fble,a	%fcc3,	loop_142
	fxors	%f20,	%f20,	%f27

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x5C6, 	%hsys_tick_cmpr
	srlx	%i3,	%l5,	%l1
loop_142:
	rdhpr	%hintp,	%i1
	tge	%xcc,	0x7
	edge32l	%i7,	%i0,	%l4
	fcmpne16	%f18,	%f20,	%g2
	tl	%xcc,	0x1
	tleu	%icc,	0x4
	wr	%i5,	%l2,	%ccr
	rdhpr	%hpstate,	%g5
	rdhpr	%hintp,	%g1
	movrlz	%i6,	0x2F0,	%o0
	wr	%i2,	0x1F65,	%pic
	rd	%sys_tick_cmpr,	%g4
	sub	%g7,	0x09B1,	%l3
	movne	%icc,	%o1,	%o4
	sethi	0x192C,	%o5
	wrpr	%i4,	0x0D87,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x1E4, 	%hsys_tick_cmpr
	rdhpr	%hpstate,	%g6
	wr	%l0,	%o7,	%set_softint

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%hintp,	%o3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fones	%f29
	fmovdleu	%icc,	%f2,	%f20
	fmul8x16al	%f23,	%f5,	%f10
	rd	%softint,	%o2
	wr	%i3,	%g3,	%pic
	rd	%ccr,	%l5
	rdpr	%gl,	%l1
	movg	%xcc,	%i7,	%i1
	rd	%sys_tick_cmpr,	%l4
	wrpr	%i0,	0x1512,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x493, 	%hsys_tick_cmpr
	rd	%ccr,	%l2
	edge8	%g2,	%g1,	%g5
	rdpr	%cansave,	%o0
	rdhpr	%htba,	%i2
	rd	%sys_tick_cmpr,	%g4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x370, 	%hsys_tick_cmpr
	wr	%l3,	%o4,	%set_softint
	tvc	%icc,	0x5
	rd	%softint,	%o1
	rdpr	%cansave,	%o5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x177, 	%hsys_tick_cmpr
	rdhpr	%hintp,	%l0
	bpos	loop_143
	fcmpgt32	%f6,	%f14,	%o7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xEA7, 	%hsys_tick_cmpr
	brgez,a	%o3,	loop_144
loop_143:
	fpsub16s	%f24,	%f7,	%f23

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	tcc	%xcc,	0x1
loop_144:
	wrpr	%o6,	%i3,	%tick
	rd	%softint,	%l5
	fcmpeq32	%f30,	%f18,	%g3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x616, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%gl,	%i7
	wrpr	%l4,	0x1BE3,	%cwp
	rdhpr	%hsys_tick_cmpr,	%i5
	fbuge	%fcc1,	loop_145
	edge16n	%l2,	%g2,	%i0
	tvc	%icc,	0x6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_145:
	rdhpr	%hsys_tick_cmpr,	%i2
	rdhpr	%hsys_tick_cmpr,	%g4
	rdpr	%canrestore,	%o0
	rd	%asi,	%g7
	andn	%i6,	%l3,	%o1
	rdpr	%gl,	%o5
	rdpr	%cleanwin,	%o4
	rdpr	%gl,	%l6
	srlx	%g6,	0x1C,	%o7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xF9E, 	%hsys_tick_cmpr
	orncc	%o3,	%o2,	%i4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	stx	%l5,	[%l7 + 0x10]
	fmovsle	%icc,	%f3,	%f18
	alignaddrl	%g3,	%l1,	%i3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x8D6, 	%hsys_tick_cmpr
	rdhpr	%hsys_tick_cmpr,	%i5
	rdpr	%cansave,	%l2
	rdhpr	%htba,	%i7
	rdpr	%wstate,	%i0
	fmovsle	%icc,	%f16,	%f17
	rdpr	%tl,	%g5
	rd	%sys_tick_cmpr,	%g1
	add	%g2,	0x040C,	%g4
	ta	%xcc,	0x4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%hpstate,	%o0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%htba,	%i6
	wrpr	%o1,	%o5,	%pil
	rd	%tick_cmpr,	%o4
	prefetch	[%l7 + 0x28],	 0x1
	rdpr	%gl,	%l3
	sth	%l6,	[%l7 + 0x20]
	wr 	%g0, 	0x6, 	%fprs
	fmovrdlez	%o3,	%f8,	%f26
	add	%o7,	0x1A5B,	%o2
	wr	%i4,	%l5,	%sys_tick
	tpos	%icc,	0x0
	ldsw	[%l7 + 0x08],	%g3
	srax	%o6,	%i3,	%l1
	move	%icc,	%l4,	%i5
	rd	%asi,	%l2
	rdhpr	%htba,	%i7
	rdpr	%gl,	%i1
	wrpr	%g5,	0x0C46,	%tick
	rdpr	%tl,	%g1
	rdpr	%cleanwin,	%i0
	andn	%g4,	%g2,	%o0
	sll	%g7,	0x11,	%i6
	fbg,a	%fcc2,	loop_146
	rd	%fprs,	%o1
	orncc	%o5,	%i2,	%o4
	taddcc	%l3,	%l6,	%g6
loop_146:
	rdpr	%cansave,	%l0
	addc	%o7,	0x168D,	%o2
	rd	%fprs,	%o3
	movre	%l5,	%g3,	%o6
	fcmpes	%fcc3,	%f23,	%f19
	movn	%icc,	%i4,	%l1
	xorcc	%i3,	0x1E4B,	%l4
	rd	%softint,	%i5
	wrpr	%i7,	0x0EBA,	%tick
	srax	%i1,	0x08,	%g5
	wr	%l2,	%i0,	%pic
	tvs	%xcc,	0x7
	wrpr	%g4,	0x0E16,	%pil
	sth	%g2,	[%l7 + 0x60]
	alignaddr	%g1,	%g7,	%i6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%gl,	%o1
	rd	%y,	%o4
	smul	%i2,	%l6,	%l3
	tge	%icc,	0x5
	rdpr	%wstate,	%g6
	wrpr	%o7,	0x0255,	%pil
	rdhpr	%hintp,	%o2
	xnorcc	%l0,	0x1982,	%l5
	fmovsne	%icc,	%f25,	%f14

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x8B5, 	%hsys_tick_cmpr
	rdpr	%cwp,	%o6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xFF9, 	%hsys_tick_cmpr
	bcc	%xcc,	loop_147
	fcmpes	%fcc2,	%f25,	%f18
	rd	%tick_cmpr,	%i4
	rdhpr	%htba,	%i3
loop_147:
	rd	%softint,	%l4
	rdhpr	%hintp,	%i7
	ldsw	[%l7 + 0x40],	%i5
	movre	%g5,	%l2,	%i1
	sir	0x1E78
	sub	%i0,	%g2,	%g1
	rd	%sys_tick_cmpr,	%g4
	tneg	%icc,	0x2
	fpadd16s	%f26,	%f22,	%f31
	edge16	%g7,	%o0,	%i6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xEA9, 	%hsys_tick_cmpr
	ldd	[%l7 + 0x30],	%f26
	rdhpr	%htba,	%i2
	rdpr	%pil,	%l6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x4BF, 	%tick_cmpr
	ldstub	[%l7 + 0x15],	%o2
	wr	%l5,	0x07D1,	%y
	array8	%o3,	%o6,	%g3
	bg	%xcc,	loop_148
	rd	%softint,	%l0
	ldx	[%l7 + 0x40],	%l1
	orn	%i4,	0x026F,	%l4
loop_148:
	bn	%xcc,	loop_149
	wrpr	%i3,	%i7,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x7E9, 	%hsys_tick_cmpr
	tge	%icc,	0x5
loop_149:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x75D, 	%hsys_tick_cmpr
	rd	%pc,	%l2
	wrpr	%i0,	%g2,	%cwp
	rd	%pc,	%g4
	sir	0x1313
	rd	%y,	%g1
	wrpr	%o0,	%i6,	%cwp
	fmovsleu	%icc,	%f1,	%f21
	ba	%xcc,	loop_150
	wrpr	%g7,	0x0065,	%cwp
	taddcc	%o1,	0x0A9A,	%i2
	rd	%asi,	%o4
loop_150:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x975, 	%hsys_tick_cmpr
	rdhpr	%hpstate,	%o5
	add	%l7,	0x08,	%l6
	wr	%g0,	0x11,	%asi
	ldxa	[%l6] %asi,	%g6
	casxa	[%l6] 0x11,	%g6,	%o7
	subccc	%o2,	0x1A1F,	%l5
	rd	%sys_tick_cmpr,	%o3
	bneg,a	%icc,	loop_151
	srax	%o6,	0x0F,	%g3
	mova	%icc,	%l0,	%l3
	fornot2s	%f11,	%f18,	%f31
loop_151:
	wrpr	%i4,	%l1,	%cwp
	set	0x28, %o0
	ldstuba	[%l7 + %o0] 0x88,	%i3
	wrpr	%l4,	0x064C,	%pil
	rdpr	%otherwin,	%i7
	call	loop_152
	wr	%i5,	%i1,	%clear_softint
	edge32n	%l2,	%i0,	%g5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x2E4, 	%hsys_tick_cmpr
loop_152:
	fmovse	%xcc,	%f18,	%f28
	rd	%asi,	%g4
	orncc	%o0,	0x0C33,	%g1
	wrpr	%g7,	0x1204,	%tick
	wrpr	%i6,	%o1,	%tick
	rdhpr	%htba,	%o4
	pdist	%f20,	%f8,	%f12
	tcc	%icc,	0x4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%asi,	%l6
	movvc	%icc,	%o5,	%g6
	fmul8x16al	%f13,	%f18,	%f28
	movl	%xcc,	%o2,	%o7
	wr	%o3,	0x1E73,	%set_softint
	sll	%o6,	0x1F,	%l5
	wr	%g3,	0x196F,	%set_softint
	xor	%l0,	%i4,	%l1
	movcc	%xcc,	%i3,	%l3
	fpadd16	%f22,	%f24,	%f4
	rdpr	%canrestore,	%i7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%htba,	%i5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%wstate,	%i1
	rdpr	%pil,	%i0
	wrpr	%g5,	%g4,	%tick
	xor	%g2,	%g1,	%g7
	movleu	%xcc,	%o0,	%i6
	edge16n	%o1,	%i2,	%l6
	wr	%o4,	0x1A64,	%clear_softint

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x8F2, 	%tick_cmpr
	smulcc	%g6,	%o3,	%o6
	rdhpr	%hpstate,	%o7
	wr	%l5,	0x029F,	%y
	brgez,a	%g3,	loop_153
	rdpr	%canrestore,	%l0
	srax	%i4,	0x05,	%l1
	wrpr	%i3,	0x1694,	%tick
loop_153:
	rdhpr	%htba,	%l3
	wrpr	%i7,	0x0195,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%htba,	%l2
	fcmpne16	%f10,	%f14,	%i5
	rd	%asi,	%i0
	umulcc	%i1,	0x159D,	%g5
	fpadd16s	%f16,	%f31,	%f29
	fble	%fcc3,	loop_154
	wr 	%g0, 	0x5, 	%fprs
	rdpr	%otherwin,	%g7
	rdhpr	%htba,	%g1
loop_154:
	rdhpr	%hintp,	%i6
	array8	%o1,	%o0,	%i2
	tle	%xcc,	0x0
	sll	%o4,	%o5,	%l6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x7B6, 	%hsys_tick_cmpr
	move	%xcc,	%g6,	%o3
	fpmerge	%f20,	%f0,	%f30

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fpadd16s	%f22,	%f25,	%f15
	rd	%y,	%g3
	rd	%softint,	%l5
	fmovsa	%icc,	%f10,	%f16
	bn,pn	%icc,	loop_155
	edge8n	%i4,	%l0,	%l1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x077, 	%hsys_tick_cmpr
	fandnot1	%f22,	%f22,	%f16
loop_155:
	fnors	%f27,	%f29,	%f24
	rdhpr	%hpstate,	%i7
	fone	%f0
	rdpr	%gl,	%l2
	umul	%i5,	%l4,	%i1
	rdhpr	%hsys_tick_cmpr,	%i0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xFCB, 	%hsys_tick_cmpr
	wrpr	%g4,	%g5,	%tick
	brlez,a	%g7,	loop_156
	fornot2	%f12,	%f0,	%f26
	sethi	0x081C,	%i6
	rd	%ccr,	%g1
loop_156:
	wr	%o0,	0x1E44,	%y
	fpackfix	%f28,	%f30
	rdhpr	%htba,	%i2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fpadd16	%f0,	%f20,	%f22
	xorcc	%o4,	%l6,	%o5
	sll	%g6,	0x10,	%o2
	fmovrdne	%o6,	%f2,	%f10
	wr	%o3,	0x157D,	%set_softint
	rd	%ccr,	%g3
	wrpr	%o7,	%i4,	%cwp
	rdhpr	%htba,	%l5
	rd	%asi,	%l1
	wr	%g0,	0xeb,	%asi
	stba	%l3,	[%l7 + 0x77] %asi
	membar	#Sync
	rd	%softint,	%i3
	edge16ln	%i5,	%i7,	%i1
	ldsw	[%l7 + 0x78],	%l4
	rdpr	%canrestore,	%g2
	rdhpr	%hpstate,	%g5
	movne	%icc,	%g7,	%g1
	movge	%icc,	%i6,	%i2
	xnorcc	%o0,	%o1,	%o4
	fone	%f0
	movneg	%xcc,	%l6,	%o5
	wrpr	%g6,	0x0373,	%cwp
	fmovsleu	%xcc,	%f22,	%f25
	array16	%o2,	%o6,	%o3
	rdpr	%otherwin,	%g3
	rdhpr	%htba,	%i4
	add	%l7,	0x64,	%l6
	wr	%g0,	0x04,	%asi
	casa	[%l6] 0x04,	%o7,	%l1
	movvc	%xcc,	%l5,	%l3
	wr	%l0,	0x0B3E,	%pic
	rdpr	%cansave,	%i3
	rdhpr	%htba,	%l2
	array8	%i5,	%i7,	%i1
	sub	%l4,	0x1346,	%g2
	rdpr	%cansave,	%i0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	andcc	%g4,	%g7,	%g1
	rdpr	%otherwin,	%i2
	rdpr	%otherwin,	%i6
	set	0x10, %o5
	prefetcha	[%l7 + %o5] 0x04,	 0x1
	rdhpr	%htba,	%o1
	rdpr	%gl,	%l6
	wrpr	%o5,	%o4,	%cwp
	wr	%o2,	%g6,	%pic
	rdhpr	%htba,	%o6
	rdpr	%pil,	%o3
	rdhpr	%hintp,	%i4
	wr	%g3,	%l1,	%sys_tick
	tleu	%xcc,	0x7
	array8	%l5,	%o7,	%l0
	sll	%l3,	%i3,	%l2
	wr	%i7,	0x10B7,	%softint
	rd	%softint,	%i1
	rdhpr	%htba,	%l4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%i0,	%g5,	%cwp
	edge16	%g4,	%g1,	%g7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	mulx	%i2,	%l6,	%o5
	fpadd32	%f16,	%f8,	%f12
	movleu	%xcc,	%o1,	%o2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x166, 	%hsys_tick_cmpr
	srl	%o6,	%o3,	%i4
	rdhpr	%hpstate,	%l1
	xor	%g3,	%l5,	%o7
	movge	%icc,	%l3,	%l0
	wr	%l2,	%i7,	%y
	wrpr	%i3,	0x105C,	%pil
	udivx	%i1,	0x0158,	%l4
	rdhpr	%hintp,	%i5
	and	%i0,	0x0AD7,	%g5
	orcc	%g2,	0x0784,	%g4
	movleu	%xcc,	%g1,	%g7
	movn	%xcc,	%o0,	%i6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xE31, 	%hsys_tick_cmpr
	edge8ln	%o1,	%l6,	%o4
	wrpr	%o2,	0x195F,	%pil
	rdhpr	%hsys_tick_cmpr,	%o6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%i4,	%g3,	%cwp
	srlx	%l1,	%o7,	%l5
	wrpr	%l0,	%l3,	%tick
	rdpr	%canrestore,	%l2
	tl	%xcc,	0x5
	rdhpr	%hpstate,	%i3
	fbge	%fcc3,	loop_157

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%y,	%l4
loop_157:
	udiv	%i5,	0x1F6F,	%i0
	umul	%g2,	%g4,	%g5
	fmovsn	%icc,	%f25,	%f2
	srl	%g7,	%o0,	%g1
	rdhpr	%htba,	%i6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x110, 	%hsys_tick_cmpr
	orcc	%i2,	%o2,	%o6
	rdhpr	%htba,	%g6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	movvs	%xcc,	%g3,	%i4
	rdpr	%wstate,	%l1
	rdhpr	%hintp,	%l5
	rd	%asi,	%o7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	tgu	%icc,	0x5
	sub	%l0,	0x04F4,	%i3
	rdhpr	%hpstate,	%l2
	wrpr	%i1,	0x0BB1,	%cwp
	wrpr	%i7,	%l4,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x62F, 	%tick_cmpr
	wr	%g4,	%g5,	%y
	rd	%asi,	%g2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	brnz	%o0,	loop_158
	rd	%y,	%g1
	popc	%i6,	%o5
	fpadd32	%f18,	%f20,	%f0
loop_158:
	taddcctv	%o1,	0x13F4,	%l6
	andn	%g7,	0x0823,	%i2
	wr 	%g0, 	0x5, 	%fprs
	udiv	%o6,	0x1CEB,	%o4
	taddcctv	%o3,	0x056E,	%g6
	wrpr	%l1,	0x04FE,	%tick
	rdhpr	%hpstate,	%l5
	fmovd	%f2,	%f30
	wrpr	%i4,	%o7,	%cwp
	wr 	%g0, 	0x6, 	%fprs
	rd	%softint,	%i3
	rd	%pc,	%l2
	movrgz	%l0,	0x132,	%i1
	wr	%i7,	%i5,	%ccr
	wrpr	%i0,	%g4,	%pil
	fbu	%fcc3,	loop_159
	rdhpr	%hsys_tick_cmpr,	%l4
	rdpr	%tba,	%g2
	fbne,a	%fcc0,	loop_160
loop_159:
	wr	%o0,	0x121D,	%pic
	brz	%g1,	loop_161
	fmovd	%f26,	%f14
loop_160:
	fbue,a	%fcc2,	loop_162
	sir	0x1B24
loop_161:
	udiv	%g5,	0x122F,	%i6
	set	0x58, %i0
	ldxa	[%l7 + %i0] 0x88,	%o1
loop_162:
	subcc	%l6,	0x121F,	%g7
	rd	%tick_cmpr,	%o5
	wrpr	%o2,	%i2,	%pil
	bcc	loop_163
	movvs	%xcc,	%o6,	%o3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	rdpr	%cwp,	%g3
loop_163:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	tvs	%icc,	0x0
	rd	%asi,	%l5
	rdpr	%gl,	%i4
	orncc	%o7,	%i3,	%l2
	wrpr	%l3,	0x12C5,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xB8F, 	%hsys_tick_cmpr
	fmovse	%xcc,	%f11,	%f4
	rdhpr	%hpstate,	%i1
	wrpr	%i5,	0x11B0,	%pil
	umul	%i0,	%g4,	%g2
	tne	%icc,	0x6
	wr	%l4,	%o0,	%softint
	rdpr	%pil,	%g1
	sllx	%i6,	%o1,	%l6
	rdhpr	%hintp,	%g5
	bge,a,pt	%xcc,	loop_164
	wrpr	%o5,	0x06F1,	%cwp
	fmovspos	%xcc,	%f7,	%f7
	rd	%fprs,	%o2
loop_164:
	brlez,a	%i2,	loop_165
	wr	%g7,	0x1E89,	%pic
	set	0x54, %g7
	swapa	[%l7 + %g7] 0x19,	%o6
loop_165:
	wrpr	%o3,	%g6,	%tick
	add	%l7,	0x4C,	%l6
	wr	%g0,	0x19,	%asi
	casa	[%l6] %asi,	%g3,	%l1
	rdpr	%cleanwin,	%l5
	wr	%o4,	%o7,	%pic

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	sir	0x0204
	srl	%i3,	0x19,	%l0
	rd	%softint,	%l3
	rdhpr	%hpstate,	%i1
	edge16l	%i5,	%i7,	%i0
	tcc	%icc,	0x6
	fbe,a	%fcc3,	loop_166
	rdpr	%tl,	%g4
	fmovsvc	%icc,	%f6,	%f18
	swap	[%l7 + 0x18],	%g2
loop_166:
	movrgz	%l4,	%o0,	%g1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x968, 	%sys_tick_cmpr
	edge16l	%o1,	%l6,	%g5
	rdpr	%cleanwin,	%o2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xA51, 	%hsys_tick_cmpr
	umulcc	%i2,	%o6,	%o3
	wr	%g7,	%g6,	%y
	bg,a,pn	%xcc,	loop_167
	rdpr	%cwp,	%g3
	tcc	%icc,	0x1
	andcc	%l5,	0x1EFE,	%l1
loop_167:
	fmovrsne	%o7,	%f4,	%f12
	wrpr	%i4,	0x1EE9,	%tick
	std	%o4,	[%l7 + 0x20]
	brgz,a	%i3,	loop_168
	movre	%l2,	%l0,	%i1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mova	%xcc,	%l3,	%i7
loop_168:
	rd	%asi,	%i5
	add	%g4,	%i0,	%l4
	rdpr	%canrestore,	%g2
	wr	%g0,	0x89,	%asi
	lduba	[%l7 + 0x08] %asi,	%g1
	tne	%icc,	0x0
	tcs	%xcc,	0x1
	wrpr	%i6,	%o1,	%tick
	wrpr	%l6,	%o0,	%tick
	rdpr	%pil,	%o2
	taddcctv	%o5,	%g5,	%o6
	tne	%icc,	0x3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x008, 	%hsys_tick_cmpr
	wrpr	%i2,	%g7,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	edge32	%l5,	%g6,	%o7
	movn	%icc,	%i4,	%o4
	subc	%l1,	0x136B,	%l2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	movvc	%icc,	%i1,	%l3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x7DC, 	%hsys_tick_cmpr
	tgu	%xcc,	0x5
	movcs	%icc,	%i5,	%g4
	rdhpr	%hintp,	%i0
	wr	%i7,	0x0418,	%ccr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xABD, 	%sys_tick_cmpr
	array8	%i6,	%o1,	%l6
	wr	%g1,	0x15F6,	%set_softint

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x568, 	%hsys_tick_cmpr
	wrpr	%g5,	%o0,	%pil
	fcmple16	%f4,	%f24,	%o6
	wrpr	%o3,	0x1F4B,	%tick
	rd	%softint,	%g7
	wr 	%g0, 	0x6, 	%fprs
	bl,a	loop_169
	sllx	%g6,	%l5,	%o7
	wrpr	%i4,	0x095C,	%cwp
	sth	%o4,	[%l7 + 0x72]
loop_169:
	rd	%sys_tick_cmpr,	%l1
	rdpr	%wstate,	%l2
	mulscc	%i3,	0x135C,	%l3
	addcc	%l0,	%i5,	%i1
	fmovs	%f25,	%f11
	rdhpr	%htba,	%g4
	rdhpr	%htba,	%i0
	rd	%fprs,	%i7
	rdhpr	%hpstate,	%g2
	nop
	setx	loop_170,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	rdhpr	%hsys_tick_cmpr,	%i6
	rd	%sys_tick_cmpr,	%o1
	wr	%l6,	0x1618,	%ccr
loop_170:
	be	%icc,	loop_171
	wrpr	%g1,	%o2,	%tick
	tvc	%icc,	0x5
	rdpr	%tl,	%l4
loop_171:
	wrpr	%o5,	%g5,	%cwp
	orncc	%o0,	0x1A75,	%o6
	wrpr	%g7,	%o3,	%cwp
	ldd	[%l7 + 0x48],	%g2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xDB4, 	%hsys_tick_cmpr
	pdist	%f12,	%f14,	%f0
	movge	%xcc,	%l5,	%i4
	wr	%o4,	0x17AC,	%softint
	rdhpr	%hintp,	%o7
	rd	%pc,	%l2
	rdpr	%cwp,	%l1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%i5,	0x0805,	%cwp
	rd	%sys_tick_cmpr,	%g4
	rdpr	%otherwin,	%i1
	wr 	%g0, 	0x7, 	%fprs
	movle	%xcc,	%g2,	%i6
	bg,a	loop_172
	rdhpr	%hpstate,	%i0
	wrpr	%o1,	%g1,	%cwp
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_172:
	edge8n	%o2,	%l4,	%o5
	wrpr	%l6,	0x1BB7,	%pil
	wr 	%g0, 	0x7, 	%fprs
	popc	%o0,	%g7
	edge16	%o6,	%g3,	%o3
	rdhpr	%hintp,	%i2
	movl	%xcc,	%l5,	%i4
	rdpr	%otherwin,	%g6
	rdpr	%tba,	%o4
	wr	%g0,	0x26,	%asi
	ldda	[%l7 + 0x70] %asi,	%l2
	rd	%softint,	%l1
	wr	%g0,	0x27,	%asi
	stba	%o7,	[%l7 + 0x3A] %asi
	membar	#Sync
	wrpr	%l0,	%i3,	%tick
	nop
	set	0x0C, %l5
	prefetch	[%l7 + %l5],	 0x0
	wrpr	%i5,	0x0F16,	%tick
	rdhpr	%htba,	%l3
	mulx	%i1,	0x0DA8,	%i7
	fbu,a	%fcc1,	loop_173
	rd	%asi,	%g2
	rd	%tick_cmpr,	%g4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xE31, 	%hsys_tick_cmpr
loop_173:
	sll	%g1,	0x14,	%o1
	rdpr	%cwp,	%o2
	movleu	%icc,	%l4,	%l6
	sdivcc	%o5,	0x1DB2,	%g5
	wrpr	%g7,	0x036C,	%cwp
	rdpr	%cleanwin,	%o0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x0FF, 	%sys_tick_cmpr
	rd	%ccr,	%i2
	sdivx	%o6,	0x145C,	%l5
	rd	%y,	%g6
	sll	%o4,	0x13,	%i4
	std	%f26,	[%l7 + 0x40]
	wrpr	%l2,	0x07AC,	%cwp
	rdhpr	%hpstate,	%l1
	rdhpr	%htba,	%l0
	rd	%asi,	%o7
	wrpr	%i3,	%i5,	%tick
	andn	%l3,	%i7,	%i1
	rdhpr	%htba,	%g4
	bne,pn	%icc,	loop_174
	wrpr	%g2,	%i6,	%cwp
	wr 	%g0, 	0x4, 	%fprs
	tsubcc	%o2,	0x0DB6,	%l4
loop_174:
	wr 	%g0, 	0x5, 	%fprs

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xD06, 	%tick_cmpr
	rd	%y,	%o5
	rdpr	%tl,	%g7
	wrpr	%g5,	%g3,	%pil
	fbug,a	%fcc3,	loop_175
	udiv	%o0,	0x0F3D,	%o3
	wr 	%g0, 	0x4, 	%fprs
	xor	%l5,	0x1806,	%g6
loop_175:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xCE7, 	%sys_tick_cmpr
	wr	%i2,	%l2,	%y
	wrpr	%l1,	0x1DD1,	%pil
	wrpr	%i4,	%l0,	%pil
	wr	%i3,	%i5,	%ccr
	rd	%tick_cmpr,	%o7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x843, 	%hsys_tick_cmpr
	rdhpr	%hpstate,	%i1
	rdhpr	%hsys_tick_cmpr,	%g4
	fmovdl	%icc,	%f25,	%f9
	wrpr	%i7,	0x1026,	%pil
	or	%g2,	0x0440,	%i0
	wr	%g0,	0x81,	%asi
	sta	%f11,	[%l7 + 0x20] %asi
	fbug,a	%fcc2,	loop_176
	rdpr	%cansave,	%i6
	ta	%icc,	0x0
	smul	%g1,	0x0CCE,	%l4
loop_176:
	rdhpr	%hintp,	%o2
	rdpr	%tl,	%l6
	rdhpr	%hpstate,	%o5
	sir	0x1444

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%canrestore,	%o1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	bneg,a	%icc,	loop_177
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fsrc2s	%f24,	%f19
	wrpr	%g5,	0x0C3F,	%cwp
loop_177:
	rdpr	%canrestore,	%o3
	bne,pt	%icc,	loop_178
	wrpr	%o6,	0x0D63,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xF55, 	%hsys_tick_cmpr
	ta	%icc,	0x4
loop_178:
	edge8n	%l5,	%i2,	%o4
	wr	%l1,	%l2,	%clear_softint
	bne	loop_179
	udivcc	%i4,	0x196A,	%l0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%hsys_tick_cmpr,	%i3
loop_179:
	rd	%asi,	%l3
	alignaddr	%i1,	%g4,	%o7
	fzeros	%f25
	rdhpr	%hintp,	%g2
	umul	%i0,	%i6,	%g1
	rdpr	%cwp,	%l4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xAD3, 	%sys_tick_cmpr
	bpos	%icc,	loop_180
	sir	0x1CAB
	wrpr	%l6,	0x03CD,	%pil
	rdhpr	%hpstate,	%g7
loop_180:
	wr	%o1,	0x14F6,	%sys_tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%hsys_tick_cmpr,	%g5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xDCA, 	%hsys_tick_cmpr
	wrpr	%o3,	0x1E05,	%pil
	wr 	%g0, 	0x5, 	%fprs
	taddcc	%g6,	0x1B8A,	%i2
	rd	%sys_tick_cmpr,	%o4
	membar	0x0B
	stbar
	wrpr	%l1,	0x12C1,	%tick
	set	0x32, %l4
	stba	%i4,	[%l7 + %l4] 0x81
	rdhpr	%hsys_tick_cmpr,	%l0
	rdpr	%otherwin,	%i5
	edge16n	%l2,	%l3,	%i3
	srax	%i1,	0x01,	%o7
	rdhpr	%htba,	%g4
	taddcc	%g2,	0x1102,	%i6
	andcc	%i0,	%g1,	%l4
	rd	%tick_cmpr,	%o2
	tn	%xcc,	0x3
	wr	%i7,	0x0930,	%ccr
	tcc	%xcc,	0x1
	rdpr	%pil,	%l6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	te	%xcc,	0x0
	movrlz	%g7,	%o0,	%g5
	rdpr	%cwp,	%o5
	rd	%tick_cmpr,	%o6
	sra	%o3,	0x1D,	%g3
	popc	0x060A,	%l5
	wr	%i2,	%o4,	%ccr
	popc	%l1,	%g6
	rdpr	%cansave,	%l0
	sdivx	%i4,	0x1BF1,	%i5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%cansave,	%i3
	movrgz	%l3,	%i1,	%o7
	mulscc	%g4,	0x1D51,	%i6
	rdpr	%gl,	%g2
	wrpr	%l4,	%g1,	%cwp
	rdhpr	%hintp,	%i7
	udivcc	%l6,	0x17DD,	%o1
	rdpr	%wstate,	%o2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x18C, 	%hsys_tick_cmpr
	rdhpr	%htba,	%o5
	tg	%icc,	0x5
	wrpr	%o6,	%g5,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x74B, 	%hsys_tick_cmpr
	movneg	%xcc,	%o3,	%i2
	rd	%softint,	%l1
	fsrc1s	%f27,	%f15
	wrpr	%g6,	0x1CB0,	%pil
	wrpr	%l0,	%i4,	%cwp
	wrpr	%i5,	%l2,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	rdpr	%gl,	%l3
	ldd	[%l7 + 0x38],	%f16
	rd	%ccr,	%i1
	bvc,a,pt	%icc,	loop_181
	movrlez	%o7,	%g4,	%i6
	set	0x74, %g2
	ldswa	[%l7 + %g2] 0x14,	%g2
loop_181:
	fbul	%fcc0,	loop_182
	wrpr	%i0,	0x06D2,	%pil
	rd	%asi,	%g1
	orn	%l4,	0x1D49,	%i7
loop_182:
	rd	%pc,	%l6
	wrpr	%o1,	%o2,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%o5,	0x0093,	%tick
	rdpr	%wstate,	%o6
	tleu	%xcc,	0x1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x94B, 	%tick_cmpr
	fbu	%fcc0,	loop_183
	fsrc2s	%f27,	%f13
	wr	%g3,	%i2,	%set_softint
	wr	%o3,	0x0DE4,	%softint
loop_183:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%fprs,	%l1
	swap	[%l7 + 0x24],	%i4
	fmovsn	%xcc,	%f16,	%f7
	rd	%tick_cmpr,	%l0
	rdpr	%tl,	%i5
	array8	%o4,	%l3,	%i3
	rdhpr	%hpstate,	%i1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%g2,	%i0,	%pil
	wrpr	%o7,	%g1,	%tick
	fmovsne	%icc,	%f19,	%f26
	rd	%asi,	%i7
	rdpr	%pil,	%l6
	movcc	%icc,	%l4,	%o2
	fblg	%fcc0,	loop_184
	edge32n	%o1,	%o0,	%o5
	wr	%g0,	0x89,	%asi
	stda	%o6,	[%l7 + 0x40] %asi
loop_184:
	wr 	%g0, 	0x6, 	%fprs
	fmovdleu	%icc,	%f8,	%f9
	rdhpr	%hintp,	%i2
	rd	%softint,	%l5
	wr	%o3,	0x1406,	%clear_softint
	wr	%g6,	0x0EA0,	%pic
	wr	%i4,	%l0,	%ccr
	wr 	%g0, 	0x5, 	%fprs
	alignaddrl	%l2,	%o4,	%i5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xB78, 	%hsys_tick_cmpr
	fnot1s	%f21,	%f13
	lduh	[%l7 + 0x4C],	%i3
	tneg	%xcc,	0x3
	brgez	%g4,	loop_185
	wrpr	%i6,	%i1,	%cwp
	rdpr	%wstate,	%g2
	wr	%o7,	0x1566,	%pic
loop_185:
	wr	%i0,	%i7,	%ccr
	andcc	%l6,	0x1F4C,	%l4
	rd	%y,	%g1

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
	wr	%o0,	%o5,	%ccr
	taddcctv	%o6,	%o1,	%g7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xF62, 	%tick_cmpr
	wr	%g5,	%l5,	%softint
	orcc	%o3,	%i2,	%g6
	rdpr	%tl,	%i4
	subc	%l1,	0x0B2A,	%l2
	membar	0x0C
	wrpr	%l0,	0x16CD,	%tick
	std	%o4,	[%l7 + 0x10]
	ldsw	[%l7 + 0x74],	%l3
	rdpr	%cwp,	%i3
	addccc	%i5,	%i6,	%i1
	edge32n	%g2,	%g4,	%o7
	wr	%i7,	%l6,	%set_softint
	wr	%i0,	%g1,	%set_softint
	rd	%tick_cmpr,	%l4
	rdhpr	%htba,	%o2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x0D5, 	%hsys_tick_cmpr
	xnor	%o1,	0x1B75,	%o5
	wr	%g7,	0x1E45,	%ccr
	orcc	%g3,	0x0AB8,	%l5
	wrpr	%g5,	%o3,	%cwp
	and	%i2,	0x1D00,	%i4
	and	%l1,	%g6,	%l2
	tvc	%xcc,	0x1
	rdpr	%cleanwin,	%o4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x863, 	%hsys_tick_cmpr
	set	0x78, %g6
	lduwa	[%l7 + %g6] 0x15,	%i3
	edge32l	%i5,	%i6,	%i1
	array8	%l3,	%g4,	%g2
	rdpr	%pil,	%i7
	fabsd	%f0,	%f8
	rdpr	%otherwin,	%o7
	array16	%l6,	%g1,	%i0
!Yo - got one - imm_asi 0x5f 
!And yo - immediate is 0x0
	set	0x0, %i4
	stxa	%o2,	[%g0 + %i4] 0x5f
	rdhpr	%hintp,	%o0
	wr	%l4,	%o6,	%ccr
	rdhpr	%hsys_tick_cmpr,	%o5
	set	0x48, %l6
	stda	%o0,	[%l7 + %l6] 0x89

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x0B3, 	%hsys_tick_cmpr
	sir	0x1E98
	rdpr	%pil,	%g5
	subccc	%g3,	0x07BD,	%o3
	smulcc	%i4,	%i2,	%l1
	rdhpr	%hpstate,	%l2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x23C, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	subcc	%i5,	0x0324,	%i1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xD41, 	%hsys_tick_cmpr
	rd	%fprs,	%l3
	orn	%i7,	%o7,	%g2
	fones	%f8
	rdhpr	%hpstate,	%g1
	fpadd32s	%f18,	%f9,	%f26
	wr	%l6,	0x052C,	%y
	wrpr	%i0,	0x0BFA,	%pil
	wr	%g0,	0x10,	%asi
	swapa	[%l7 + 0x14] %asi,	%o0
	set	0x17, %i7
	lduba	[%l7 + %i7] 0x88,	%l4
	set	0x30, %i5
	stba	%o2,	[%l7 + %i5] 0x89
	rdpr	%canrestore,	%o5
	wr	%o1,	%g7,	%clear_softint
	wr	%l5,	%g5,	%set_softint
	brgez	%g3,	loop_186
	wr	%o6,	0x19A5,	%sys_tick
	rd	%fprs,	%o3
	rdhpr	%hsys_tick_cmpr,	%i2
loop_186:
	sdivx	%i4,	0x092B,	%l2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x6A2, 	%hsys_tick_cmpr
	movn	%icc,	%l1,	%i3
	rdhpr	%htba,	%g6
	rd	%pc,	%i5
	wrpr	%i1,	%i6,	%tick
	array16	%l0,	%g4,	%l3
	fpackfix	%f10,	%f22
	rd	%asi,	%i7
	rd	%softint,	%g2
	umulcc	%g1,	0x1A80,	%o7
	umulcc	%i0,	0x05EB,	%o0
	wrpr	%l4,	%o2,	%tick
	rd	%sys_tick_cmpr,	%o5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xF8C, 	%tick_cmpr
	fmovrslez	%g7,	%f3,	%f19

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xD40, 	%tick_cmpr
	rd	%softint,	%o6
	set	0x30, %o6
	lda	[%l7 + %o6] 0x11,	%f30
	rd	%pc,	%l5
	movleu	%icc,	%i2,	%o3
	rd	%sys_tick_cmpr,	%i4
	ldstub	[%l7 + 0x64],	%l2
	wr	%g0,	0x19,	%asi
	lduwa	[%l7 + 0x30] %asi,	%o4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%cleanwin,	%i3
	rdhpr	%hsys_tick_cmpr,	%g6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x859, 	%hsys_tick_cmpr
	wr	%i5,	0x0A59,	%ccr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x33E, 	%sys_tick_cmpr
	rdhpr	%hpstate,	%i6
	rdpr	%tba,	%l3
	ta	%icc,	0x1
	ldd	[%l7 + 0x10],	%g4
	sll	%g2,	0x14,	%i7
	rd	%pc,	%o7
	wrpr	%i0,	0x0701,	%pil
	fzeros	%f25
	edge8ln	%g1,	%o0,	%l4
	edge16ln	%o5,	%l6,	%o2
	rdhpr	%hintp,	%o1
	wr	%g0,	0x89,	%asi
	sta	%f12,	[%l7 + 0x44] %asi
	rd	%fprs,	%g7
	rd	%ccr,	%g5
	subc	%o6,	0x0BED,	%l5
	fbug,a	%fcc0,	loop_187
	edge16ln	%i2,	%o3,	%i4
	subcc	%l2,	0x03EA,	%o4
	rdhpr	%hsys_tick_cmpr,	%g3
loop_187:
	movpos	%icc,	%i3,	%l1
	wrpr	%g6,	%i1,	%tick
	tvc	%xcc,	0x6
	rdhpr	%hintp,	%l0
	rdhpr	%hsys_tick_cmpr,	%i5
	andcc	%l3,	0x081E,	%i6
	tsubcc	%g4,	0x18C0,	%g2
	rdhpr	%hpstate,	%o7
	wrpr	%i0,	0x0154,	%tick
	rdpr	%pil,	%g1
	edge32	%o0,	%l4,	%o5
	wr 	%g0, 	0x6, 	%fprs
	rdpr	%cwp,	%o2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x410, 	%sys_tick_cmpr
	ldsb	[%l7 + 0x72],	%g7
	addcc	%l6,	%g5,	%l5
	movle	%icc,	%o6,	%o3
	swap	[%l7 + 0x64],	%i2
	andn	%l2,	%i4,	%o4
	wrpr	%i3,	0x0FA3,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	movle	%icc,	%l1,	%i1
	rdhpr	%htba,	%l0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%l3,	0x0E23,	%ccr
	rdpr	%tl,	%g4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wrpr	%i6,	0x09DA,	%tick
	wrpr	%o7,	%i0,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fmovsn	%icc,	%f11,	%f14
	rdhpr	%hpstate,	%o0
	movrgez	%l4,	0x27D,	%g2
	fcmpeq32	%f30,	%f12,	%i7
	srax	%o2,	%o5,	%g7
	rdpr	%canrestore,	%o1
	flushw
	wr 	%g0, 	0x6, 	%fprs
	rdhpr	%hintp,	%l6
	rdhpr	%hsys_tick_cmpr,	%o6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	flush	%l7 + 0x34
	tcc	%xcc,	0x0
	nop
	setx loop_188, %l0, %l1
	jmpl %l1, %i4
	fors	%f25,	%f11,	%f20
	taddcc	%l2,	%o4,	%g3
	bg,pn	%icc,	loop_189
loop_188:
	movre	%i3,	%l1,	%i1
	set	0x40, %o1
	ldswa	[%l7 + %o1] 0x18,	%g6
loop_189:
	wr	%g4,	0x185F,	%y
	sll	%i6,	0x1C,	%l3
	wrpr	%o7,	%g1,	%tick
	movrgez	%i0,	0x018,	%o0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	rd	%pc,	%i7
	rdhpr	%hintp,	%g2
	wr	%o2,	%g7,	%clear_softint
	rdpr	%pil,	%o1
	udiv	%o5,	0x02D4,	%l5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x634, 	%hsys_tick_cmpr
	fandnot1s	%f13,	%f14,	%f22
	rdpr	%gl,	%i2
	orncc	%o6,	0x1EB0,	%o3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	addccc	%o4,	%g3,	%i3
	wrpr	%l1,	0x0C99,	%cwp
	sir	0x040E
	taddcc	%g6,	%i5,	%i1
	wrpr	%g4,	%l0,	%cwp
	rdhpr	%hpstate,	%i6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xD4F, 	%hsys_tick_cmpr
	sethi	0x10E9,	%g1
	smul	%l3,	%i0,	%l4
	fmovrse	%o0,	%f8,	%f23
	faligndata	%f8,	%f28,	%f6
	ba,pn	%xcc,	loop_190
	movle	%icc,	%o2,	%g7
	tg	%icc,	0x2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_190:
	bgu,a,pt	%xcc,	loop_191
	wr	%g2,	%l6,	%clear_softint
	rdpr	%cwp,	%l5
	rdpr	%cansave,	%i2
loop_191:
	tsubcctv	%g5,	0x1E57,	%o3
	fornot2	%f6,	%f14,	%f24
	rd	%softint,	%o6
	rdhpr	%hsys_tick_cmpr,	%l2
	movpos	%xcc,	%o4,	%i4
	rdhpr	%hintp,	%g3
	movpos	%icc,	%l1,	%i3
	set	0x56, %i6
	ldsba	[%l7 + %i6] 0x11,	%g6
	fmovsge	%icc,	%f18,	%f27
	wr	%i5,	%g4,	%pic
	rdhpr	%htba,	%l0
	sethi	0x017D,	%i6
	fone	%f28
	stw	%i1,	[%l7 + 0x40]

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xC91, 	%hsys_tick_cmpr
	tsubcc	%l3,	0x011F,	%i0
	rdpr	%wstate,	%o0
	rdhpr	%hsys_tick_cmpr,	%l4
	rdhpr	%hsys_tick_cmpr,	%o2
	rdpr	%tl,	%i7
	orncc	%g7,	0x15E0,	%o5
	wrpr	%o1,	%g2,	%pil
	sllx	%l6,	%i2,	%l5
	tn	%icc,	0x3
	rd	%fprs,	%o3
	wr	%g0,	0xea,	%asi
	stda	%g4,	[%l7 + 0x38] %asi
	membar	#Sync
	rd	%fprs,	%l2
	srlx	%o6,	%o4,	%g3
	fandnot1	%f28,	%f8,	%f10
	fbn	%fcc3,	loop_192
	fxnors	%f17,	%f15,	%f17
	fmovdvc	%xcc,	%f7,	%f23
	call	loop_193
loop_192:
	sdiv	%l1,	0x14A4,	%i4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	udiv	%i5,	0x019A,	%i3
loop_193:
	fand	%f14,	%f4,	%f24
	wr	%g0,	0x88,	%asi
	ldda	[%l7 + 0x70] %asi,	%g4
	rd	%sys_tick_cmpr,	%l0
	rdpr	%wstate,	%i1
	rdpr	%tl,	%i6
	rdhpr	%hintp,	%o7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fmovdneg	%xcc,	%f23,	%f10
	add	%l7,	0x78,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] %asi,	%i0,	%l4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
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
	and	%i7,	%o5,	%g2
	fpack16	%f8,	%f1
	wr	%l6,	0x1881,	%pic
	wr	%i2,	0x0466,	%y
	fbu,a	%fcc3,	loop_194
	fmovrde	%l5,	%f18,	%f0
	rdpr	%cansave,	%o1
	rd	%tick_cmpr,	%o3
loop_194:
	rdpr	%cleanwin,	%g5
	smulcc	%o6,	0x11C9,	%o4
	brlz	%g3,	loop_195
	wrpr	%l2,	0x0A09,	%tick
	fmovrsgez	%l1,	%f8,	%f27
	rdpr	%tl,	%i4
loop_195:
	rdpr	%pil,	%i5
	rd	%asi,	%i3
	rd	%tick_cmpr,	%g4
	rd	%pc,	%g6
	movrgz	%i1,	0x379,	%i6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%tba,	%l0
	edge8n	%l3,	%i0,	%g1
	bshuffle	%f30,	%f4,	%f0
	rd	%ccr,	%l4
	rdhpr	%hintp,	%o2
	fbg,a	%fcc1,	loop_196
	bn	%xcc,	loop_197
	nop
	setx	loop_198,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	mulscc	%g7,	%o0,	%i7
loop_196:
	alignaddr	%g2,	%l6,	%o5
loop_197:
	rdhpr	%htba,	%i2
loop_198:
	wr	%o1,	0x1B15,	%pic

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%g5,	%o4,	%sys_tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fmul8ulx16	%f26,	%f18,	%f10
	stb	%l1,	[%l7 + 0x4C]
	wrpr	%l2,	%i5,	%cwp
	tge	%xcc,	0x7
	mulscc	%i3,	0x1A4D,	%g4
	std	%f6,	[%l7 + 0x68]
	umul	%i4,	%g6,	%i6
	rdpr	%gl,	%i1
	wr 	%g0, 	0x5, 	%fprs

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xF66, 	%sys_tick_cmpr
	rd	%asi,	%i0
	rd	%ccr,	%l3
	wr	%l4,	0x0593,	%clear_softint
	rdpr	%pil,	%o2
	edge32	%g1,	%o0,	%i7
	rd	%asi,	%g7
	fmul8x16al	%f18,	%f7,	%f14
	add	%l7,	0x30,	%l6
	wr	%g0,	0x04,	%asi
	casa	[%l6] %asi,	%l6,	%o5
	bn,pt	%icc,	loop_199
	rdhpr	%hpstate,	%i2
	brz	%g2,	loop_200
	edge32n	%o1,	%o3,	%g5
loop_199:
	rdpr	%wstate,	%l5
	movgu	%xcc,	%o4,	%o6
loop_200:
	movle	%xcc,	%l1,	%g3
	rd	%softint,	%l2
	rdhpr	%hintp,	%i5
	rdpr	%cwp,	%g4
	movrne	%i4,	0x01E,	%i3
	mova	%xcc,	%i6,	%i1
	wr	%l0,	0x02C0,	%ccr
	rd	%ccr,	%g6
	fmovs	%f29,	%f17
	movn	%icc,	%i0,	%o7
	taddcctv	%l4,	%o2,	%l3
	wrpr	%o0,	%i7,	%cwp
	ldsw	[%l7 + 0x7C],	%g7
	rdpr	%tl,	%g1
	xnorcc	%o5,	0x157C,	%l6
	wr	%i2,	0x0941,	%ccr
	rdpr	%cansave,	%g2
	rd	%y,	%o3
	srax	%g5,	%o1,	%l5
	fmovs	%f6,	%f12
	fnot1	%f14,	%f12
	wrpr	%o6,	%l1,	%tick
	fbue	%fcc1,	loop_201
	bgu,a,pn	%xcc,	loop_202
	wr	%o4,	%g3,	%sys_tick
	rd	%ccr,	%l2
loop_201:
	rdhpr	%htba,	%i5
loop_202:
	wrpr	%i4,	%g4,	%cwp
	movge	%xcc,	%i6,	%i1
	fpadd32	%f26,	%f10,	%f12
	wr	%i3,	0x1AE5,	%softint

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%pc,	%l4
	tcc	%xcc,	0x5
	wr	%o7,	0x103B,	%pic
	wrpr	%o2,	0x1336,	%tick
	movrne	%o0,	%l3,	%g7
	rdhpr	%htba,	%i7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x164, 	%hsys_tick_cmpr
	move	%xcc,	%l6,	%i2
	rdpr	%tba,	%g2
	rd	%sys_tick_cmpr,	%o5
	wr	%o3,	%o1,	%softint
	rdpr	%cwp,	%l5
	popc	%o6,	%l1
	fsrc2	%f4,	%f24
	fmovdl	%xcc,	%f14,	%f14
	andncc	%g5,	%g3,	%l2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x1FB, 	%hsys_tick_cmpr
	rdpr	%tl,	%o4
	rdhpr	%htba,	%g4
	ldd	[%l7 + 0x48],	%f12
	rdpr	%gl,	%i3
	rdhpr	%hsys_tick_cmpr,	%i1
	rd	%ccr,	%g6
	rdhpr	%hsys_tick_cmpr,	%i0
	wrpr	%l0,	0x0E91,	%cwp
	srl	%o7,	0x19,	%l4
	rdpr	%gl,	%o0
	rdhpr	%hpstate,	%o2
	rdpr	%gl,	%l3
	wr	%g7,	%g1,	%sys_tick
	fnor	%f26,	%f14,	%f2
	bcc,a	loop_203
	fcmple16	%f12,	%f2,	%l6
	wrpr	%i7,	%i2,	%cwp
	rdhpr	%hintp,	%g2
loop_203:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x3F9, 	%hsys_tick_cmpr
	rdpr	%gl,	%o3
	rdpr	%wstate,	%o1
	wrpr	%l5,	0x0BA6,	%tick
	bleu	loop_204
	fmovdcs	%xcc,	%f25,	%f16
	rdhpr	%hsys_tick_cmpr,	%o6
	rdhpr	%hsys_tick_cmpr,	%g5
loop_204:
	sllx	%l1,	%g3,	%i5
	rd	%y,	%o4
	rdhpr	%hintp,	%g4
	edge8ln	%l2,	%i4,	%i6
	fcmpeq16	%f0,	%f30,	%i1
	rdpr	%gl,	%i3
	movne	%icc,	%g6,	%i0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xEEA, 	%hsys_tick_cmpr
	fmovdl	%xcc,	%f10,	%f23
	fmovrdgez	%l4,	%f16,	%f8

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x511, 	%hsys_tick_cmpr
	movrgz	%g7,	%o2,	%l6
	rdhpr	%hsys_tick_cmpr,	%g1
	rdpr	%cwp,	%i7
	rd	%pc,	%i2
	array32	%g2,	%o3,	%o1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x2B4, 	%hsys_tick_cmpr
	udivcc	%o6,	0x0E6F,	%l1
	fzeros	%f2
	rdhpr	%hpstate,	%g5
	wrpr	%g3,	%i5,	%cwp
	rd	%softint,	%o4
	movrlez	%g4,	%i4,	%i6
	rdhpr	%hintp,	%i1
	stb	%i3,	[%l7 + 0x3A]
	rdhpr	%htba,	%g6
	edge8ln	%i0,	%l2,	%l0
	fbne	%fcc3,	loop_205
	rd	%softint,	%o7
	movrlz	%o0,	0x1FD,	%l3
	array16	%g7,	%l4,	%l6
loop_205:
	rdpr	%cansave,	%o2
	wrpr	%i7,	%g1,	%cwp
	wrpr	%i2,	0x14E2,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x5DA, 	%tick_cmpr
	xorcc	%g2,	%o5,	%l5
	wrpr	%o6,	%g5,	%pil
	rd	%y,	%l1
	wr	%g0,	0xea,	%asi
	stda	%g2,	[%l7 + 0x10] %asi
	membar	#Sync
	rd	%tick_cmpr,	%i5
	wrpr	%g4,	%o4,	%cwp
	wrpr	%i6,	%i1,	%tick
	rdpr	%pil,	%i3
	ldstub	[%l7 + 0x25],	%g6
	sdiv	%i4,	0x14F9,	%l2
	rdpr	%otherwin,	%l0
	wrpr	%o7,	%i0,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x38E, 	%tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	tsubcc	%l4,	0x0938,	%o2
	rd	%ccr,	%g1
	srax	%i7,	0x1B,	%i2
	fmovdge	%xcc,	%f8,	%f7
	rdpr	%cleanwin,	%o1
	umul	%g2,	%o5,	%l5
	rdhpr	%htba,	%o6
	popc	%g5,	%l1
	rdpr	%pil,	%o3
	and	%g3,	0x06FE,	%i5
	ta	%xcc,	0x4
	rd	%ccr,	%g4
	rd	%y,	%i6
	tneg	%xcc,	0x3
	rd	%sys_tick_cmpr,	%o4
	bcs,pt	%icc,	loop_206
	tsubcctv	%i1,	%i3,	%i4
	sra	%l2,	%g6,	%l0
	movvs	%xcc,	%i0,	%o7
loop_206:
	rdhpr	%htba,	%o0
	tne	%icc,	0x7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x92A, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x354, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x8FC, 	%hsys_tick_cmpr
	rd	%ccr,	%g1
	wrpr	%i7,	0x1FAF,	%pil
	rdhpr	%hsys_tick_cmpr,	%o2
	wrpr	%i2,	%o1,	%pil
	fbuge,a	%fcc2,	loop_207
	rdpr	%tba,	%o5
	fbge,a	%fcc0,	loop_208
	movle	%xcc,	%l5,	%o6
loop_207:
	fbn,a	%fcc0,	loop_209
	rdpr	%tl,	%g5
loop_208:
	bgu,a,pt	%icc,	loop_210
	wr	%g2,	%l1,	%sys_tick
loop_209:
	nop
	wr	%g0,	0x10,	%asi
	ldswa	[%l7 + 0x1C] %asi,	%o3
loop_210:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xBFC, 	%tick_cmpr
	movrgz	%i6,	%g4,	%o4
	rdpr	%canrestore,	%i1
	mova	%xcc,	%i4,	%i3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x966, 	%hsys_tick_cmpr
	wr	%g0,	0x10,	%asi
	stba	%l0,	[%l7 + 0x76] %asi
	edge16n	%g6,	%o7,	%i0
	rd	%pc,	%o0
	tpos	%xcc,	0x2
	rd	%pc,	%g7
	fbne,a	%fcc3,	loop_211
	popc	0x1193,	%l4
	rdhpr	%hpstate,	%l6
	wrpr	%l3,	%i7,	%cwp
loop_211:
	subccc	%g1,	0x177B,	%o2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x108, 	%hsys_tick_cmpr
	wr	%g0,	0x89,	%asi
	stwa	%o6,	[%l7 + 0x74] %asi
	rdpr	%tl,	%g5
	wr	%l5,	%l1,	%pic
	movgu	%xcc,	%o3,	%i5
	be,a	%icc,	loop_212
	fmovs	%f12,	%f18
	move	%icc,	%g3,	%g2
	wrpr	%g4,	%i6,	%cwp
loop_212:
	sll	%i1,	%i4,	%o4
	fmovrsgz	%i3,	%f14,	%f5
	move	%xcc,	%l0,	%l2
	movrlz	%g6,	0x217,	%o7
	edge16ln	%o0,	%g7,	%i0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xB7E, 	%hsys_tick_cmpr
	set	0x70, %g1
	ldda	[%l7 + %g1] 0x24,	%l2
	rdpr	%wstate,	%l6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	rdhpr	%hsys_tick_cmpr,	%i7
	set	0x0A, %o3
	ldsha	[%l7 + %o3] 0x88,	%o1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x29F, 	%tick_cmpr
	rdpr	%gl,	%o6
	rd	%asi,	%o5
	rd	%fprs,	%l5
	rd	%tick_cmpr,	%l1
	set	0x28, %l3
	prefetcha	[%l7 + %l3] 0x11,	 0x1
	wrpr	%g5,	%i5,	%cwp
	fandnot2	%f16,	%f0,	%f8
	orncc	%g3,	0x0569,	%g4
	movleu	%xcc,	%i6,	%g2
	orncc	%i4,	0x0682,	%o4
	ba	%icc,	loop_213
	rd	%y,	%i3
	rdhpr	%hsys_tick_cmpr,	%l0
	fpsub32	%f16,	%f28,	%f22
loop_213:
	wrpr	%i1,	%l2,	%cwp
	rdhpr	%hsys_tick_cmpr,	%o7
	rdpr	%canrestore,	%g6
	bvc,pn	%icc,	loop_214
	rdpr	%pil,	%g7
	ldd	[%l7 + 0x30],	%i0
	rdpr	%gl,	%l4
loop_214:
	addcc	%o0,	0x177C,	%l3
	rd	%pc,	%g1
	andncc	%l6,	%i7,	%o1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	subccc	%o2,	%l5,	%l1
	ldx	[%l7 + 0x08],	%o3
	rdhpr	%hintp,	%o5
	rdhpr	%hsys_tick_cmpr,	%i5
	rdhpr	%hpstate,	%g5
	rd	%asi,	%g3
	wrpr	%g4,	0x0E50,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%o4,	0x0F0A,	%tick
	rdpr	%cansave,	%g2
	fpsub16s	%f22,	%f8,	%f19
	rdpr	%gl,	%l0
	rdpr	%cansave,	%i1
	movrne	%l2,	%i3,	%o7
	fone	%f26
	membar	#Sync
	wr	%g0,	0x1e,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	sllx	%g7,	%g6,	%l4
	movn	%xcc,	%i0,	%l3
	movleu	%icc,	%o0,	%g1
	fand	%f20,	%f14,	%f0
	rdpr	%cwp,	%i7
	rdpr	%pil,	%o1
	tgu	%xcc,	0x2
	fcmps	%fcc0,	%f1,	%f24
	rdhpr	%htba,	%i2
	sub	%o6,	%l6,	%l5
	fmovrsgz	%l1,	%f12,	%f2
	subccc	%o3,	%o2,	%i5
	rd	%sys_tick_cmpr,	%o5
	fmovrsgz	%g5,	%f21,	%f22

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xB59, 	%sys_tick_cmpr
	ble,a,pt	%icc,	loop_215
	fmovrsgez	%i4,	%f29,	%f1
	tneg	%xcc,	0x7
	edge16n	%o4,	%g2,	%l0
loop_215:
	rdhpr	%hpstate,	%i1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x962, 	%tick_cmpr
	rdpr	%otherwin,	%i3
	edge16l	%o7,	%i6,	%g7
	fcmps	%fcc0,	%f30,	%f15
	wrpr	%g6,	%i0,	%cwp
	rdpr	%gl,	%l3
	wr	%l4,	%o0,	%softint
	ldd	[%l7 + 0x50],	%f20
	fbo,a	%fcc3,	loop_216
	rdhpr	%hpstate,	%i7
	rdhpr	%hintp,	%g1
	rdpr	%cleanwin,	%i2
loop_216:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x538, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xB3D, 	%hsys_tick_cmpr
	fmovsle	%xcc,	%f10,	%f9
	umul	%l1,	0x13A2,	%o2
	rd	%softint,	%o3
	rdpr	%pil,	%o5
	wrpr	%i5,	0x178A,	%pil
	rdhpr	%hpstate,	%g5
	wr	%g4,	0x1CB5,	%sys_tick
	fbule,a	%fcc1,	loop_217
	wrpr	%g3,	0x1A89,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	srlx	%i4,	%i1,	%l0
loop_217:
	fmovsleu	%icc,	%f27,	%f12
	rd	%tick_cmpr,	%i3
	fmovdleu	%xcc,	%f22,	%f6
	rdpr	%otherwin,	%l2
	addc	%o7,	0x18D6,	%i6
	movrgez	%g7,	%i0,	%l3
	andn	%l4,	%g6,	%i7
	edge8ln	%o0,	%g1,	%o6
	rdpr	%otherwin,	%i2
	rd	%ccr,	%o1
	tneg	%xcc,	0x0
	subccc	%l5,	0x0F8F,	%l1
	fmovrse	%o2,	%f29,	%f27
	rdpr	%cansave,	%o3
	smul	%l6,	%o5,	%g5
	wrpr	%g4,	0x172F,	%cwp
	rdhpr	%hsys_tick_cmpr,	%i5
	fmuld8ulx16	%f7,	%f13,	%f2
	wrpr	%o4,	0x0B5A,	%cwp
	add	%g3,	0x18F4,	%i4
	wrpr	%i1,	%l0,	%tick
	tle	%xcc,	0x1
	xor	%g2,	%i3,	%l2
	membar	0x59
	rd	%tick_cmpr,	%i6
	movne	%xcc,	%o7,	%g7
	rdpr	%cleanwin,	%i0
	fmovrslz	%l3,	%f30,	%f1
	xor	%g6,	%l4,	%o0
	fbn	%fcc1,	loop_218
	rdpr	%otherwin,	%i7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	rdhpr	%hpstate,	%o6
loop_218:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	movcs	%xcc,	%l1,	%i2
	movneg	%xcc,	%o2,	%o3
	rd	%y,	%l6
	sir	0x0646
	fsrc2	%f28,	%f28

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%ccr,	%o5
	rd	%y,	%o4
	rdhpr	%hpstate,	%i5
	rdhpr	%hintp,	%i4
	wrpr	%i1,	0x178F,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x726, 	%sys_tick_cmpr
	tsubcc	%g3,	%l2,	%i6
	rd	%tick_cmpr,	%o7
	rdpr	%wstate,	%g7
	wrpr	%i3,	%l3,	%pil
	fpsub16	%f12,	%f4,	%f28
	rdpr	%cleanwin,	%g6
	rd	%sys_tick_cmpr,	%l4
	sll	%i0,	%o0,	%i7
	subcc	%o6,	%g1,	%l5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xC7B, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	set	0x40, %o4
	stda	%o2,	[%l7 + %o4] 0x23
	membar	#Sync

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xFDE, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xC7B, 	%hsys_tick_cmpr
	ldstub	[%l7 + 0x79],	%g4
	fmovrdne	%l6,	%f28,	%f14
	wrpr	%o4,	0x0EE2,	%pil
	addccc	%i5,	%i4,	%o5
	mulx	%i1,	0x0E48,	%l0
	rdpr	%cleanwin,	%g2
	rdhpr	%hintp,	%l2
	rdpr	%canrestore,	%g3
	rd	%tick_cmpr,	%o7
	rdpr	%cansave,	%g7
	subcc	%i3,	0x1088,	%l3
	set	0x70, %l2
	stwa	%i6,	[%l7 + %l2] 0x15
	ldsb	[%l7 + 0x70],	%g6
	sra	%i0,	%l4,	%i7
	rdpr	%canrestore,	%o0
	wr	%g0,	0x88,	%asi
	ldstuba	[%l7 + 0x15] %asi,	%o6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%tick_cmpr,	%l1
	andcc	%o1,	%g1,	%i2
	rdpr	%cansave,	%o2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x525, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%i5,	0x024E,	%pil
	wrpr	%o3,	%i4,	%pil
	wr	%g0,	0x89,	%asi
	stha	%o5,	[%l7 + 0x72] %asi
	movle	%xcc,	%i1,	%l0
	rdpr	%cwp,	%g2
	rdhpr	%htba,	%g3
	fornot2	%f4,	%f4,	%f24
	rdpr	%cleanwin,	%o7
	rdhpr	%hpstate,	%l2
	rdpr	%cleanwin,	%g7
	rd	%pc,	%l3
	fzero	%f8
	rdpr	%otherwin,	%g6
	rdpr	%cleanwin,	%i0
	rdhpr	%hpstate,	%l4
	tg	%xcc,	0x2
	rdpr	%cleanwin,	%i6
	fbug	%fcc3,	loop_219
	wr	%o0,	0x0B0A,	%softint
	move	%xcc,	%o6,	%i7
	set	0x6F, %g4
	lduba	[%l7 + %g4] 0x15,	%l5
loop_219:
	rd	%y,	%o1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	fbo	%fcc3,	loop_220
	lduw	[%l7 + 0x3C],	%i2
	rd	%sys_tick_cmpr,	%o2
	rdhpr	%hpstate,	%l1
loop_220:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%sys_tick_cmpr,	%l6
	wr	%o4,	%g4,	%ccr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	sllx	%o5,	%i4,	%l0
	wr	%g2,	%i1,	%y
	rd	%asi,	%o7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fmovsle	%icc,	%f23,	%f0
	rd	%fprs,	%g3
	rdpr	%tba,	%l3
	wrpr	%i3,	%g6,	%cwp
	rdpr	%cleanwin,	%i0
	or	%l4,	%g7,	%o0
	rdhpr	%hintp,	%o6
	wrpr	%i7,	%l5,	%tick
	fpmerge	%f19,	%f4,	%f2
	fmovsvc	%icc,	%f22,	%f13
	tl	%xcc,	0x3
	movgu	%icc,	%i6,	%o1
	set	0x28, %i3
	stxa	%i2,	[%l7 + %i3] 0x19
	rdhpr	%htba,	%o2
	rdpr	%pil,	%g1
	movrgez	%g5,	%l1,	%o4
	taddcc	%l6,	0x14B0,	%g4
	srax	%o3,	%o5,	%i4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%pc,	%g2
	fxnors	%f17,	%f28,	%f7
	movre	%i5,	0x273,	%i1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x55A, 	%hsys_tick_cmpr
	wr	%g3,	0x1749,	%softint
	rd	%asi,	%i3
	wr	%l3,	0x0FF7,	%set_softint
	wrpr	%g6,	%l4,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	udiv	%i0,	0x0A4E,	%o0
	sdivx	%o6,	0x00B9,	%i7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x687, 	%hsys_tick_cmpr
	rd	%pc,	%o1
	rdhpr	%hintp,	%l5
	rdhpr	%hsys_tick_cmpr,	%i2
	rd	%y,	%g1
	andcc	%o2,	%l1,	%o4
	tvs	%xcc,	0x7
	tge	%icc,	0x7
	rdpr	%tl,	%g5
	fbg,a	%fcc1,	loop_221
	andncc	%l6,	%g4,	%o3
	tsubcctv	%o5,	0x08E6,	%l0
	fsrc2	%f18,	%f30
loop_221:
	rd	%ccr,	%i4
	and	%i5,	0x0758,	%g2
	move	%xcc,	%l2,	%o7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%l3,	0x1E12,	%tick
	movleu	%icc,	%g6,	%i3
	bn,pt	%xcc,	loop_222
	orn	%l4,	%g7,	%i0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	tne	%icc,	0x4
loop_222:
	movrne	%i7,	%i6,	%o1
	wr	%g0,	0x04,	%asi
	ldsha	[%l7 + 0x6A] %asi,	%l5
	rdpr	%gl,	%i2
	movcc	%icc,	%g1,	%o6
	rdhpr	%hintp,	%l1
	rdpr	%otherwin,	%o2
	rd	%ccr,	%o4
	movvs	%xcc,	%g5,	%l6
	tcc	%icc,	0x1
	wrpr	%g4,	0x0FBE,	%cwp
	fcmped	%fcc2,	%f30,	%f16
	wr	%l0,	%i4,	%y
	fors	%f18,	%f6,	%f5
	rd	%sys_tick_cmpr,	%i5
	ldsw	[%l7 + 0x0C],	%g2
	rdhpr	%hpstate,	%o7
	fmuld8sux16	%f7,	%f18,	%f2
	wr	%l2,	0x1687,	%y
	rdpr	%gl,	%i1
	rd	%fprs,	%g3
	edge32l	%l3,	%i3,	%g6
	ta	%xcc,	0x4
	sethi	0x19C3,	%l4
	rdpr	%cansave,	%g7
	brgz,a	%i0,	loop_223
	faligndata	%f28,	%f22,	%f4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xC9F, 	%tick_cmpr
	movgu	%icc,	%i7,	%l5
loop_223:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x685, 	%hsys_tick_cmpr
	edge32	%o6,	%o1,	%l1
	bn,a,pt	%xcc,	loop_224
	rdhpr	%htba,	%o2
	wrpr	%g5,	0x156E,	%pil
	rdpr	%cansave,	%o4
loop_224:
	fmovsa	%icc,	%f20,	%f8
	rdpr	%wstate,	%l6
	subcc	%o5,	%g4,	%o3
	rdpr	%pil,	%l0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x903, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%g3,	%l3,	%cwp
	te	%xcc,	0x7
	wrpr	%o7,	%g6,	%pil
	wrpr	%l4,	0x088D,	%tick
	te	%xcc,	0x4
	tsubcc	%g7,	0x0F3E,	%i0
	rdpr	%canrestore,	%o0
	stx	%i6,	[%l7 + 0x78]
	wrpr	%i3,	%l5,	%cwp
	fmovsg	%icc,	%f9,	%f10

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xAEC, 	%tick_cmpr
	rd	%fprs,	%i2
	wr	%o1,	0x1858,	%sys_tick
	udiv	%l1,	0x0592,	%o2
	rdhpr	%hpstate,	%g5
	rd	%tick_cmpr,	%o6
	rd	%y,	%o4
	rdhpr	%hpstate,	%o5
	rdhpr	%hsys_tick_cmpr,	%g4
	rdhpr	%hsys_tick_cmpr,	%l6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%i5,	%i4,	%y
	rdhpr	%hsys_tick_cmpr,	%l2
	rd	%softint,	%i1
	umul	%g2,	%l3,	%g3
	smul	%o7,	0x0660,	%l4
	rd	%ccr,	%g7
	membar	0x17
	mulscc	%i0,	0x19BA,	%g6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xDA4, 	%hsys_tick_cmpr
	rdpr	%tl,	%l5
	tpos	%xcc,	0x1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xC13, 	%hsys_tick_cmpr
	tle	%xcc,	0x6
	sdivx	%g1,	0x094E,	%i6
	wrpr	%i2,	%o1,	%pil
	wrpr	%l1,	0x0268,	%cwp
	wrpr	%g5,	0x0141,	%pil
	bg,pn	%icc,	loop_225
	rdpr	%cleanwin,	%o6
	fnands	%f6,	%f13,	%f1
	tvc	%icc,	0x6
loop_225:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	movrgez	%o3,	%l6,	%l0
	fsrc1s	%f24,	%f16
	fbule,a	%fcc0,	loop_226
	ldsb	[%l7 + 0x77],	%i5
	or	%i4,	0x05A5,	%l2
	rd	%softint,	%i1
loop_226:
	rd	%asi,	%g2
	mulx	%g3,	%l3,	%o7
	bpos	%xcc,	loop_227
	tneg	%icc,	0x7
	rdpr	%wstate,	%l4
	umulcc	%g7,	0x14FE,	%g6
loop_227:
	rdhpr	%hpstate,	%o0
	rdhpr	%hintp,	%i3
	wr	%i0,	%i7,	%clear_softint
	rd	%asi,	%g1
	edge32l	%l5,	%i2,	%o1
	movvs	%xcc,	%i6,	%l1
	siam	0x2
	bl	%icc,	loop_228
	wrpr	%g5,	%o4,	%tick
	subccc	%o6,	0x0095,	%o2
	rdpr	%tba,	%g4
loop_228:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	tleu	%xcc,	0x6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fmovscs	%xcc,	%f19,	%f28

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x1B6, 	%hsys_tick_cmpr
	te	%icc,	0x2
	membar	0x30
	fbge,a	%fcc2,	loop_229
	wrpr	%l2,	0x149A,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	wrpr	%g2,	0x1427,	%pil
loop_229:
	fbule	%fcc2,	loop_230
	wrpr	%g3,	%i4,	%pil
	add	%l7,	0x58,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] %asi,	%l3,	%o7
loop_230:
	fbug,a	%fcc2,	loop_231
	tvs	%icc,	0x6
	rd	%asi,	%l4
	fmovsge	%xcc,	%f11,	%f21
loop_231:
	movrgz	%g6,	0x396,	%g7
	rdhpr	%hpstate,	%o0
	movneg	%xcc,	%i3,	%i0
	sdivx	%i7,	0x080D,	%g1
	ldx	[%l7 + 0x08],	%i2
	wrpr	%o1,	%i6,	%cwp
	wr	%l1,	0x130B,	%y
	sra	%o4,	0x01,	%o6
	rdhpr	%hsys_tick_cmpr,	%g5
	fnot2s	%f3,	%f18
	tvc	%xcc,	0x5
	rdhpr	%htba,	%g4
	sra	%l6,	%l0,	%i5
	ldsw	[%l7 + 0x74],	%o5
	umul	%o3,	%l2,	%g2
	wrpr	%i1,	0x0AD9,	%pil
	wr	%i4,	0x1A05,	%softint
	rd	%y,	%g3
	wrpr	%o7,	%l3,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%hintp,	%o0
	rdhpr	%htba,	%i3
	wr	%i0,	%g6,	%ccr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x42B, 	%hsys_tick_cmpr
	popc	%i2,	%l5
	rdpr	%pil,	%o1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x73A, 	%hsys_tick_cmpr
	xorcc	%g1,	%o4,	%o6
	fbo,a	%fcc2,	loop_232
	wr	%o2,	0x1D13,	%sys_tick
	rd	%pc,	%g4
	wr 	%g0, 	0x6, 	%fprs
loop_232:
	wrpr	%l0,	%i5,	%cwp
	edge8ln	%o5,	%g5,	%o3
	tpos	%xcc,	0x3
	rd	%asi,	%l2
	wrpr	%i1,	0x1129,	%tick
	tn	%icc,	0x3
	movle	%icc,	%g2,	%i4
	rd	%ccr,	%g3
	movpos	%xcc,	%l3,	%o7
	rd	%ccr,	%g7
	fnegd	%f24,	%f4
	movge	%icc,	%o0,	%l4
	array16	%i0,	%i3,	%i7
	rdpr	%pil,	%g6
	rd	%softint,	%l5
	andncc	%i2,	%i6,	%g1
	wrpr	%o1,	0x07FD,	%tick
	movg	%xcc,	%o6,	%o4
	wrpr	%l1,	0x1EEA,	%cwp
	movpos	%icc,	%o2,	%g4
	rdpr	%wstate,	%l6
	fsrc2	%f18,	%f12
	wrpr	%i5,	%l0,	%pil
	fornot2s	%f7,	%f6,	%f26
	movg	%xcc,	%o5,	%g5
	tsubcctv	%o3,	0x12A5,	%i1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subc	%l2,	0x179F,	%g3
	sllx	%i4,	0x0F,	%o7
	bn,pn	%icc,	loop_233
	fmovrse	%g7,	%f27,	%f27
	rdhpr	%hintp,	%l3
	wrpr	%l4,	%i0,	%pil
loop_233:
	membar	0x4B
	fbul	%fcc0,	loop_234
	wr	%o0,	0x0EF5,	%pic
	rd	%tick_cmpr,	%i7
	bneg	%icc,	loop_235
loop_234:
	wr	%i3,	0x0D1B,	%set_softint
	fmovsn	%xcc,	%f7,	%f8
loop_235:
	nop
	set	0x40, %o7
	ldda	[%l7 + %o7] 0x27,	%g6
	movcc	%xcc,	%g1,	%i6
	rdpr	%cansave,	%o1
	rd	%asi,	%o4
	membar	#Sync
	wr	%g0,	0x1f,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	bcc,pt	%icc,	loop_236
	subccc	%l1,	0x0A44,	%o6
	wr 	%g0, 	0x5, 	%fprs
	movrne	%i5,	0x37F,	%o2
loop_236:
	rdhpr	%htba,	%l0
	wrpr	%o5,	%o3,	%tick
	rdpr	%cleanwin,	%i1
	wr	%g2,	%g5,	%clear_softint
	rd	%tick_cmpr,	%l2
	wrpr	%i4,	0x0B66,	%tick
	wr	%o7,	0x087B,	%clear_softint
	mova	%xcc,	%g7,	%l3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xFD5, 	%hsys_tick_cmpr
	rdhpr	%hsys_tick_cmpr,	%i0
	wr	%g0,	0x19,	%asi
	lduwa	[%l7 + 0x30] %asi,	%i7
	fble	%fcc3,	loop_237
	rdhpr	%hsys_tick_cmpr,	%l5
	ble	%icc,	loop_238
	sll	%i2,	0x0B,	%g6
loop_237:
	movrne	%g1,	0x363,	%i6
	fpackfix	%f8,	%f15
loop_238:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	addccc	%o4,	%l1,	%o1
	fmovrslez	%o6,	%f14,	%f31
	fpack16	%f22,	%f0
	wr	%l6,	0x03B3,	%softint

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%pil,	%o2
	mulx	%l0,	0x0F95,	%o5
	wrpr	%o3,	0x19A2,	%cwp
	rdpr	%otherwin,	%i1
	subccc	%g2,	0x1E6D,	%g5
	popc	%l2,	%i4
	tn	%icc,	0x2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%wstate,	%o7
	wrpr	%g7,	0x1588,	%tick
	rdhpr	%hintp,	%l3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	wrpr	%o0,	%g4,	%cwp
	fbo	%fcc3,	loop_239
	tsubcc	%i0,	%i7,	%i2
	call	loop_240
	wr	%g6,	0x0C6A,	%pic
loop_239:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	umul	%i6,	%i3,	%o4
loop_240:
	or	%l1,	0x0546,	%o6
	tleu	%icc,	0x1
	subc	%l6,	%i5,	%o2
	smulcc	%o1,	0x06BF,	%l0
	movvs	%xcc,	%o5,	%i1
	rdpr	%otherwin,	%g2
	umul	%o3,	%g5,	%l2
	rd	%tick_cmpr,	%i4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	array8	%g3,	%l3,	%g7
	wr 	%g0, 	0x5, 	%fprs
	rdhpr	%hsys_tick_cmpr,	%g4
	nop
	setx loop_241, %l0, %l1
	jmpl %l1, %i0
	wrpr	%i7,	%i2,	%cwp
	tg	%xcc,	0x0
	st	%f6,	[%l7 + 0x1C]
loop_241:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xB09, 	%hsys_tick_cmpr
	fmovsg	%icc,	%f18,	%f29
	rd	%softint,	%g6
	wr	%g1,	%i6,	%pic
	rdpr	%wstate,	%o4
	rdpr	%otherwin,	%i3
	rdpr	%pil,	%l1
	fcmpes	%fcc2,	%f4,	%f1
	rdpr	%pil,	%l6
	fpadd32	%f18,	%f20,	%f18
	array8	%o6,	%i5,	%o2
	wr	%g0,	0x04,	%asi
	lduwa	[%l7 + 0x48] %asi,	%l0
	rdhpr	%hintp,	%o5
	wr	%o1,	%g2,	%pic
	swap	[%l7 + 0x24],	%o3
	rdhpr	%hintp,	%g5
	sdivx	%i1,	0x1DA3,	%l2
	fxnor	%f14,	%f12,	%f4
	rd	%tick_cmpr,	%o7
	wrpr	%g3,	%l3,	%cwp
	wr	%i4,	0x111C,	%pic
	wrpr	%o0,	0x0A2B,	%tick
	rdhpr	%hintp,	%g7
	rdpr	%cansave,	%g4
	fpackfix	%f0,	%f21
	movrlez	%i7,	0x202,	%i2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%hintp,	%i0
	wrpr	%l5,	%g1,	%cwp
	rdpr	%pil,	%i6
	edge32ln	%g6,	%i3,	%o4
	mulscc	%l6,	%l1,	%o6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	edge8n	%o5,	%o1,	%i5
	wr	%o3,	%g5,	%softint
	rd	%tick_cmpr,	%i1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tsubcctv	%g2,	%o7,	%g3
	wr	%l2,	%l3,	%softint
	wr	%g0,	0xe3,	%asi
	stwa	%i4,	[%l7 + 0x1C] %asi
	membar	#Sync
	rdpr	%cansave,	%o0
	rdpr	%canrestore,	%g4
	rdpr	%cansave,	%g7
	sdivcc	%i2,	0x0DAC,	%l4
	wr	%i0,	%l5,	%pic
	subcc	%g1,	0x0316,	%i6
	wrpr	%i7,	%i3,	%cwp
	wrpr	%g6,	%l6,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x84D, 	%hsys_tick_cmpr
	rdhpr	%hintp,	%o6
	wrpr	%l0,	%o5,	%pil
	fmovrdgz	%o1,	%f22,	%f18
	fmovdne	%icc,	%f12,	%f20
	xorcc	%o2,	0x0D35,	%i5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%o3,	%o7,	%ccr
	edge32l	%g3,	%l2,	%g2
	rdpr	%gl,	%l3
	rd	%pc,	%i4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xDB9, 	%hsys_tick_cmpr
	fbu,a	%fcc2,	loop_242
	bne,a,pn	%icc,	loop_243
	wrpr	%i2,	%g7,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x517, 	%hsys_tick_cmpr
loop_242:
	rd	%fprs,	%i0
loop_243:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%i6,	0x1D42,	%tick
	fmovscs	%icc,	%f16,	%f13
	edge32n	%i3,	%g6,	%l6
	rdpr	%cansave,	%l1
	rdpr	%pil,	%o4
	udivcc	%l0,	0x0B00,	%o6
	addcc	%o1,	%o5,	%i5
	wr	%g5,	%i1,	%clear_softint
	tvs	%icc,	0x3
	orcc	%o2,	%o7,	%g3
	rd	%sys_tick_cmpr,	%l2
	fmovsl	%icc,	%f9,	%f24
	rdhpr	%hsys_tick_cmpr,	%o3
	sdiv	%g2,	0x1DEA,	%i4
	ldsb	[%l7 + 0x0C],	%g4
	rdpr	%tba,	%l3
	edge32l	%i2,	%g7,	%o0
	ldx	[%l7 + 0x58],	%l5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x7EB, 	%hsys_tick_cmpr
	xnorcc	%i0,	%i7,	%g1
	alignaddr	%i6,	%i3,	%g6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xF44, 	%hsys_tick_cmpr
	movg	%icc,	%l0,	%o6
	brlez	%o1,	loop_244
	rd	%softint,	%o5
	or	%l1,	0x0C22,	%i5
	wrpr	%g5,	0x04CF,	%cwp
loop_244:
	smulcc	%i1,	0x1F9A,	%o7
	rdhpr	%hsys_tick_cmpr,	%o2
	rd	%y,	%l2
	wr	%o3,	0x03AA,	%pic
	rdpr	%wstate,	%g3
	rd	%sys_tick_cmpr,	%g2
	tl	%xcc,	0x0
	andn	%g4,	%i4,	%l3
	wr 	%g0, 	0x4, 	%fprs
	rdpr	%cleanwin,	%o0
	wrpr	%l5,	%i2,	%cwp
	rdpr	%cansave,	%i0
	rdpr	%canrestore,	%i7
	rd	%softint,	%g1
	brz,a	%i6,	loop_245
	wr	%i3,	0x045D,	%set_softint
	std	%l4,	[%l7 + 0x28]
	fbge,a	%fcc0,	loop_246
loop_245:
	wrpr	%l6,	0x1335,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xF82, 	%hsys_tick_cmpr
	movrgez	%o4,	%o1,	%o5
loop_246:
	tcc	%xcc,	0x6
	rdhpr	%htba,	%o6
	rdhpr	%hsys_tick_cmpr,	%l1
	movge	%icc,	%i5,	%i1
	rdhpr	%hintp,	%g5
	fcmpne32	%f0,	%f4,	%o2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udivcc	%l2,	0x1163,	%o3
	edge32n	%g3,	%g2,	%g4
	rdpr	%tba,	%o7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x48B, 	%hsys_tick_cmpr
	rd	%tick_cmpr,	%g7
	fmovrde	%i4,	%f0,	%f12
	rdpr	%cwp,	%l5
	brlz	%i2,	loop_247
	umulcc	%o0,	%i0,	%g1
	rdhpr	%hintp,	%i7
	bvs,a,pt	%icc,	loop_248
loop_247:
	wr	%i6,	0x1AB2,	%set_softint
	rd	%asi,	%l4
	flushw
loop_248:
	edge32n	%l6,	%g6,	%i3
	wr	%o4,	%l0,	%pic
	udiv	%o5,	0x0CA0,	%o1
	wrpr	%o6,	%l1,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%g0,	0x80,	%asi
	lda	[%l7 + 0x18] %asi,	%f14
	rdhpr	%htba,	%i5
	smul	%o2,	0x1B4B,	%g5
	membar	0x2E
	fmovdleu	%xcc,	%f0,	%f27
	ldx	[%l7 + 0x58],	%o3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x41E, 	%hsys_tick_cmpr
	edge32	%g2,	%g4,	%o7
	rdhpr	%hpstate,	%l3
	rdhpr	%hsys_tick_cmpr,	%g3
	rdpr	%cleanwin,	%i4
	wrpr	%g7,	%i2,	%cwp
	rd	%softint,	%l5
	edge8l	%o0,	%i0,	%g1
	te	%xcc,	0x7
	udiv	%i6,	0x0F03,	%i7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x54C, 	%hsys_tick_cmpr
	rdhpr	%htba,	%g6
	wr	%l6,	%o4,	%clear_softint
	sll	%i3,	0x18,	%l0
	srlx	%o5,	0x1E,	%o1
	movrgz	%l1,	%o6,	%i1
	rdhpr	%hintp,	%i5
	rdpr	%canrestore,	%g5
	movrlez	%o3,	%l2,	%g2
	rd	%fprs,	%o2
	rd	%asi,	%o7
	flushw

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x07B, 	%hsys_tick_cmpr
	umul	%l3,	0x1644,	%i4
	rdpr	%pil,	%g7
	movne	%xcc,	%i2,	%l5
	tg	%xcc,	0x1
	st	%f4,	[%l7 + 0x48]
	andncc	%o0,	%g3,	%i0
	udiv	%i6,	0x05AB,	%i7
	tsubcc	%g1,	0x0F2E,	%l4
	set	0x14, %i2
	lduha	[%l7 + %i2] 0x18,	%g6
	sdivx	%o4,	0x1BF6,	%i3
	tvc	%xcc,	0x0
	taddcctv	%l6,	0x0A69,	%o5
	rdpr	%cwp,	%l0
	wrpr	%o1,	0x1E75,	%cwp
	movrgez	%o6,	0x06B,	%i1
	andncc	%i5,	%g5,	%l1
	move	%icc,	%l2,	%o3
	wrpr	%o2,	0x1FF3,	%pil
	flushw
	rdpr	%cwp,	%o7
	orn	%g2,	%l3,	%i4
	rdpr	%tl,	%g7
	sllx	%g4,	0x12,	%l5
	fpsub16	%f18,	%f0,	%f28

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	fbu,a	%fcc0,	loop_249
	rd	%asi,	%g3
	wrpr	%i0,	%i6,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x95C, 	%hsys_tick_cmpr
loop_249:
	edge16	%l4,	%g1,	%o4
	rdpr	%canrestore,	%i3
	rdhpr	%hsys_tick_cmpr,	%l6
	wr	%g6,	0x1896,	%clear_softint
	rd	%softint,	%l0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fandnot2	%f10,	%f8,	%f20

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%htba,	%g5
	wr	%l2,	0x0B34,	%pic
	or	%o3,	0x00D7,	%l1
	wr	%o2,	%o7,	%y
	fmovsa	%xcc,	%f15,	%f22
	wrpr	%l3,	%i4,	%tick
	wr	%g2,	0x1547,	%ccr
	wr	%g7,	0x03DE,	%set_softint
	rdhpr	%hintp,	%g4
	wr	%l5,	0x0637,	%set_softint
	wr	%i2,	%o0,	%y
	movrne	%g3,	%i6,	%i0
	rd	%tick_cmpr,	%i7
	rd	%ccr,	%l4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x395, 	%hsys_tick_cmpr
	faligndata	%f6,	%f0,	%f20
	ld	[%l7 + 0x24],	%f18
	rdhpr	%htba,	%l6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x983, 	%hsys_tick_cmpr
	wr	%g0,	0x18,	%asi
	ldsha	[%l7 + 0x52] %asi,	%o1
	fpsub32	%f30,	%f0,	%f26
	array32	%l0,	%i1,	%i5
	wr	%g5,	0x0D99,	%sys_tick
	wr	%o5,	%o6,	%set_softint
	wrpr	%o3,	%l1,	%tick
	fmovrslez	%l2,	%f9,	%f30
	edge32n	%o2,	%o7,	%i4
	rdhpr	%htba,	%g2
	andn	%g7,	0x1DA3,	%g4
	rdhpr	%hintp,	%l5
	wr	%i2,	%l3,	%ccr
	ldsh	[%l7 + 0x56],	%g3
	rdpr	%cwp,	%i6
	alignaddr	%i0,	%o0,	%l4
	rdpr	%tba,	%o4
	addcc	%i3,	0x0CC5,	%i7
	rd	%tick_cmpr,	%g1
	rdhpr	%hintp,	%g6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%i1,	0x0B73,	%y
	stw	%i5,	[%l7 + 0x0C]
	movge	%icc,	%g5,	%o5
	fcmpgt16	%f30,	%f6,	%o3
	rdhpr	%htba,	%o6
	mova	%xcc,	%l2,	%l1
	rdpr	%tba,	%o2
	movvc	%icc,	%o7,	%g2
	array16	%g7,	%i4,	%g4
	rd	%asi,	%l5
	rdhpr	%hpstate,	%i2
	rd	%pc,	%l3
	movvc	%xcc,	%i0,	%o0
	rd	%y,	%i6
	movvc	%xcc,	%o4,	%i3
	rdpr	%cansave,	%l4
	fcmpne16	%f16,	%f24,	%g1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	tvc	%xcc,	0x7
	addc	%o1,	0x05C1,	%l6
	srax	%l0,	0x0F,	%i5
	rdhpr	%hpstate,	%i1
	movcc	%icc,	%o5,	%g5
	wrpr	%o3,	%o6,	%tick
	andncc	%l2,	%o2,	%o7
	movge	%xcc,	%l1,	%g2
	wrpr	%g7,	%g4,	%tick
	rd	%tick_cmpr,	%l5
	wrpr	%i4,	0x1829,	%pil
	rd	%tick_cmpr,	%g3
	rd	%y,	%i2
	membar	0x69
	rd	%softint,	%i0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%hpstate,	%o0
	fbue	%fcc2,	loop_250
	tcs	%icc,	0x2
	rdpr	%wstate,	%o4
	rdhpr	%hintp,	%i3
loop_250:
	fpsub32	%f10,	%f4,	%f0
	movl	%icc,	%g1,	%l4
	rdpr	%wstate,	%i7
	rdhpr	%hintp,	%o1
	wr	%g0,	0x81,	%asi
	lduha	[%l7 + 0x68] %asi,	%g6
	andn	%l0,	0x1080,	%l6
	tge	%icc,	0x3
	wr	%i1,	0x00F0,	%pic

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x47C, 	%hsys_tick_cmpr
	for	%f8,	%f2,	%f24
	rdpr	%cwp,	%i5
	wr	%o6,	0x1B34,	%clear_softint
	fmovscs	%icc,	%f19,	%f25
	tvs	%xcc,	0x4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x703, 	%hsys_tick_cmpr
	tsubcctv	%o7,	%o3,	%g2
	rd	%pc,	%l1
	rd	%fprs,	%g4
	movrne	%l5,	%i4,	%g7
	flushw
	ldsh	[%l7 + 0x60],	%g3
	movrlez	%i2,	0x2C5,	%l3
	rdpr	%pil,	%i6
	addccc	%o0,	0x1EC7,	%o4
	rd	%pc,	%i3
	rd	%ccr,	%i0
	umulcc	%g1,	%i7,	%o1
	rdpr	%wstate,	%g6
	move	%xcc,	%l4,	%l0
	rdpr	%pil,	%i1
	movre	%l6,	0x1FA,	%g5
	movg	%icc,	%i5,	%o6
	wr	%l2,	%o2,	%set_softint
	std	%f4,	[%l7 + 0x08]
	rdpr	%cwp,	%o5
	fbne	%fcc2,	loop_251
	popc	0x0361,	%o3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%o7,	0x02B5,	%pil
loop_251:
	umulcc	%l5,	0x196C,	%i4
	udivcc	%i2,	0x0352,	%g3
	rdpr	%tba,	%l3
	edge8l	%o0,	%i6,	%i3
	fones	%f10
	std	%f26,	[%l7 + 0x58]
	nop
	set	0x7C, %l1
	lduw	[%l7 + %l1],	%i0
	fbe	%fcc0,	loop_252
	rdhpr	%hpstate,	%o4
	stb	%g1,	[%l7 + 0x1E]
	wrpr	%o1,	0x1A92,	%tick
loop_252:
	rd	%asi,	%i7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x5E0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x8E9, 	%hsys_tick_cmpr
	rdhpr	%hintp,	%l6
	wrpr	%i1,	0x0D08,	%cwp
	rdpr	%otherwin,	%g5
	wr	%g0,	0x11,	%asi
	sta	%f4,	[%l7 + 0x28] %asi
	fmovdl	%xcc,	%f17,	%f11

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x333, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x5C6, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%sys_tick_cmpr,	%o5
	wrpr	%g2,	%l1,	%cwp
	rd	%fprs,	%o7
	wr	%l5,	%o3,	%set_softint
	andcc	%g7,	0x1B93,	%g4
	rdhpr	%hpstate,	%i2
	wrpr	%i4,	%l3,	%pil
	fmovsneg	%xcc,	%f3,	%f0
	rdhpr	%hintp,	%o0
	wrpr	%i6,	0x1752,	%tick
	wr	%i3,	0x1A6A,	%clear_softint
	fbl,a	%fcc3,	loop_253
	rdpr	%tl,	%i0
	rdhpr	%htba,	%o4
	wrpr	%g1,	%g3,	%tick
loop_253:
	wr	%o1,	%i7,	%set_softint

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x811, 	%hsys_tick_cmpr
	udiv	%l6,	0x003B,	%i1
	umul	%g5,	0x1D6E,	%l0
	rdhpr	%hpstate,	%l2
	wr	%o6,	0x0DE3,	%sys_tick
	and	%i5,	%o2,	%g2
	tcc	%xcc,	0x1
	wrpr	%o5,	0x1978,	%cwp
	be,a,pt	%icc,	loop_254
	wr 	%g0, 	0x7, 	%fprs
	udivx	%o7,	0x0BB1,	%l5
	addcc	%o3,	0x112A,	%g4
loop_254:
	ldx	[%l7 + 0x70],	%i2
	addccc	%g7,	0x13C1,	%i4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xFD1, 	%hsys_tick_cmpr
	ba,pt	%icc,	loop_255
	wr	%i6,	%i3,	%sys_tick
	rdhpr	%hsys_tick_cmpr,	%i0
	rdhpr	%hpstate,	%o4
loop_255:
	tn	%xcc,	0x0
	fmovrsgez	%l3,	%f23,	%f10
	fbne	%fcc3,	loop_256
	wrpr	%g3,	0x03DD,	%pil
	nop
	setx loop_257, %l0, %l1
	jmpl %l1, %o1
	wr 	%g0, 	0x5, 	%fprs
loop_256:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x31E, 	%hsys_tick_cmpr
	orn	%l6,	%l4,	%g5
loop_257:
	andn	%l0,	0x1E60,	%l2
	rd	%tick_cmpr,	%o6
	wrpr	%i5,	0x015E,	%tick
	wrpr	%o2,	0x1774,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%tba,	%o5
	wrpr	%l1,	0x0371,	%cwp
	rd	%tick_cmpr,	%o7
	rdpr	%otherwin,	%l5
	fmovsne	%icc,	%f24,	%f8
	sdivx	%o3,	0x1654,	%g4
	nop
	set	0x70, %o2
	std	%i0,	[%l7 + %o2]
	wrpr	%i2,	%g7,	%pil
	andn	%i4,	%i6,	%i3
	edge8	%i0,	%o0,	%o4
	andncc	%g3,	%o1,	%l3
	rdhpr	%hsys_tick_cmpr,	%i7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	rdpr	%pil,	%g1
	rd	%softint,	%g6
	rdpr	%cansave,	%l6
	movg	%xcc,	%l4,	%l0
	add	%l7,	0x70,	%l6
	wr	%g0,	0x19,	%asi
	ldxa	[%l6] %asi,	%l2
	casxa	[%l6] %asi,	%l2,	%g5
	fmovrdne	%o6,	%f16,	%f16
	wrpr	%i5,	%o2,	%pil
	tneg	%xcc,	0x1
	set	0x40, %g3
	stda	%f0,	[%l7 + %g3] 0x19
	movcc	%xcc,	%g2,	%l1
	fzero	%f10
	rdhpr	%htba,	%o7
	wrpr	%l5,	%o5,	%tick
	wrpr	%o3,	%i1,	%pil
	move	%icc,	%i2,	%g4
	rd	%fprs,	%i4
	wrpr	%i6,	0x10F7,	%cwp
	fbul	%fcc1,	loop_258
	rdpr	%gl,	%i3
	smulcc	%i0,	0x1410,	%o0
	wrpr	%o4,	0x1916,	%tick
loop_258:
	wrpr	%g3,	0x03C7,	%tick
	wr	%o1,	%l3,	%y
	rd	%tick_cmpr,	%i7
	wrpr	%g6,	%l6,	%cwp
	movvc	%icc,	%l4,	%l0
	rdpr	%wstate,	%g1
	wrpr	%g5,	0x1A08,	%pil
	rd	%y,	%o6
	rd	%y,	%i5
	wr	%l2,	%g2,	%softint
	sdivx	%l1,	0x07AC,	%o2
	wr	%o7,	%l5,	%ccr
	movge	%xcc,	%o5,	%i1
	rd	%ccr,	%i2
	rd	%pc,	%o3
	fandnot2	%f24,	%f14,	%f20
	movl	%icc,	%g4,	%g7
	bgu,a	%icc,	loop_259
	rd	%tick_cmpr,	%i6
	rd	%tick_cmpr,	%i4
	rd	%pc,	%i0
loop_259:
	rdpr	%canrestore,	%o0
	rdhpr	%hpstate,	%i3
	wrpr	%g3,	0x1875,	%pil
	rdpr	%cleanwin,	%o4
	ble,pn	%icc,	loop_260
	fmul8x16al	%f20,	%f6,	%f28
	faligndata	%f6,	%f22,	%f4
	rdpr	%tl,	%o1
loop_260:
	wr	%i7,	%l3,	%clear_softint
	fmovdcs	%icc,	%f29,	%f26

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x1D0, 	%hsys_tick_cmpr
	udivcc	%g6,	0x19F3,	%l0
	rd	%tick_cmpr,	%g1
	fnot2	%f18,	%f20
	edge16ln	%g5,	%l4,	%i5
	movle	%icc,	%o6,	%g2
	wr	%l1,	0x10A4,	%sys_tick
	fmovrdlez	%o2,	%f22,	%f30
	ba,pn	%xcc,	loop_261
	movl	%icc,	%l2,	%l5
	tsubcctv	%o5,	0x1A31,	%o7
	rd	%pc,	%i1
loop_261:
	nop
	wr	%g0,	0x0c,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	movvs	%icc,	%i2,	%g4
	rdpr	%cwp,	%o3
	rd	%pc,	%g7
	rdhpr	%hsys_tick_cmpr,	%i6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x670, 	%hsys_tick_cmpr
	std	%f20,	[%l7 + 0x58]
	wrpr	%i4,	%i3,	%cwp
	rdhpr	%hpstate,	%o4
	wr	%o1,	%g3,	%pic

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	ldsb	[%l7 + 0x5A],	%l6
	rd	%ccr,	%i7
	mulscc	%g6,	0x062A,	%g1
	rd	%softint,	%g5
	wr 	%g0, 	0x7, 	%fprs

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	movleu	%icc,	%l1,	%o2
	fmovdneg	%xcc,	%f25,	%f21
	orn	%g2,	0x10A1,	%l2
	rdhpr	%htba,	%l5
	rdhpr	%hsys_tick_cmpr,	%o5
	umul	%o7,	0x1EA7,	%i1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	flushw

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%softint,	%i6
	rdhpr	%hpstate,	%g7
	rdpr	%canrestore,	%o0
	set	0x19, %l0
	ldsba	[%l7 + %l0] 0x81,	%i0
	rdpr	%canrestore,	%i4
	move	%icc,	%i3,	%o1
	movgu	%icc,	%o4,	%l3
	movrlez	%g3,	%i7,	%l6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x6E0, 	%hsys_tick_cmpr
	mulscc	%g5,	%l4,	%g1
	wrpr	%l0,	0x0DA4,	%pil
	subc	%o6,	%l1,	%i5
	wrpr	%g2,	%l2,	%cwp
	alignaddrl	%l5,	%o2,	%o5
	wr	%i1,	0x14EB,	%clear_softint
	fmovdge	%icc,	%f22,	%f12
	rdpr	%cwp,	%i2
	umulcc	%o7,	%o3,	%g4
	add	%g7,	%o0,	%i6
	wrpr	%i0,	0x1931,	%tick
	wr	%i3,	%o1,	%clear_softint
	wrpr	%o4,	0x072F,	%pil
	rd	%tick_cmpr,	%l3
	wrpr	%i4,	0x174E,	%cwp
	fsrc2s	%f29,	%f19
	edge16ln	%i7,	%l6,	%g6
	rdhpr	%hintp,	%g3
	wrpr	%l4,	0x0F84,	%cwp
	udivcc	%g5,	0x04A0,	%g1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%hpstate,	%l1
	rd	%fprs,	%g2
	rd	%sys_tick_cmpr,	%l2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%o2,	%o5,	%y
	rd	%pc,	%i2
	wrpr	%i1,	%o7,	%cwp
	wr 	%g0, 	0x6, 	%fprs
	subcc	%o0,	%i6,	%i0
	rdpr	%tl,	%g4
	tl	%icc,	0x4
	rdhpr	%hsys_tick_cmpr,	%o4
	xor	%o1,	%i4,	%l3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	edge16	%g6,	%l6,	%l4
	rd	%sys_tick_cmpr,	%g3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	tge	%icc,	0x0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	set	0x40, %i1
	ldda	[%l7 + %i1] 0x19,	%f0
	rd	%y,	%l0
	edge8	%g2,	%l5,	%l2
	wrpr	%o2,	%i5,	%pil
	umulcc	%i2,	%o5,	%i1
	rd	%pc,	%o3
	rd	%softint,	%o7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x312, 	%sys_tick_cmpr
	wr	%i6,	0x1DEF,	%softint
	rdpr	%pil,	%i0
	movle	%icc,	%g4,	%o0
	tsubcctv	%o4,	%i3,	%i4
	fbl	%fcc1,	loop_262
	ta	%xcc,	0x4
	rdhpr	%htba,	%l3
	rdhpr	%hintp,	%o1
loop_262:
	wrpr	%g6,	%i7,	%cwp
	wr	%l4,	0x1FC9,	%pic

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%hintp,	%g1
	fmovrslez	%o6,	%f20,	%f30
	udiv	%g5,	0x0ED0,	%l1
	and	%l6,	0x0A8B,	%g2
	fbo,a	%fcc0,	loop_263
	orcc	%l5,	0x1376,	%l2
	xnorcc	%o2,	%l0,	%i5
	rdhpr	%hsys_tick_cmpr,	%i2
loop_263:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x1F4, 	%hsys_tick_cmpr
	rdpr	%cwp,	%o3
	wr	%i1,	%o7,	%y
	tvs	%icc,	0x7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	rd	%pc,	%g7
	smulcc	%i0,	0x0CD0,	%i6
	rdpr	%gl,	%g4
	fmovrslz	%o0,	%f1,	%f30
	edge32l	%o4,	%i3,	%l3
	set	0x63, %o0
	stba	%i4,	[%l7 + %o0] 0x14
	faligndata	%f12,	%f14,	%f14
	rd	%pc,	%o1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x2E6, 	%tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%sys_tick_cmpr,	%i7
	sdiv	%g3,	0x033E,	%o6
	tvs	%icc,	0x7
	fcmps	%fcc3,	%f23,	%f31
	rd	%sys_tick_cmpr,	%g1
	wr	%g5,	0x1B7C,	%set_softint
	wr	%l1,	0x19CC,	%clear_softint
	wr	%l6,	%l5,	%set_softint
	addccc	%l2,	%o2,	%l0
	smulcc	%i5,	%g2,	%o5
	fandnot2	%f16,	%f30,	%f2
	srl	%i2,	%i1,	%o3
	rdhpr	%hsys_tick_cmpr,	%g7
	pdist	%f24,	%f0,	%f0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%i0,	%g4,	%tick
	tn	%xcc,	0x1
	rdhpr	%hintp,	%i6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xF5A, 	%hsys_tick_cmpr
	rdhpr	%hpstate,	%o0
	rdhpr	%hintp,	%l3
	fbuge	%fcc0,	loop_264
	rd	%asi,	%i4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	sir	0x01EC
loop_264:
	rdhpr	%htba,	%g6
	movge	%xcc,	%l4,	%i7
	edge16ln	%o1,	%g3,	%g1
	sub	%g5,	0x00A5,	%o6
	wrpr	%l6,	%l1,	%cwp
	set	0x1C, %g5
	swapa	[%l7 + %g5] 0x10,	%l5
	wrpr	%l2,	0x0B7E,	%pil
	movneg	%icc,	%l0,	%i5
	rdpr	%cleanwin,	%o2
	wrpr	%o5,	%i2,	%cwp
	rd	%asi,	%g2
	rdhpr	%hintp,	%i1
	rdpr	%tl,	%g7
	rdhpr	%hsys_tick_cmpr,	%o3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x654, 	%hsys_tick_cmpr
	fmovdgu	%xcc,	%f4,	%f18

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x105, 	%hsys_tick_cmpr
	wrpr	%l3,	0x0658,	%pil
	tn	%icc,	0x2
	movle	%xcc,	%o0,	%i3
	rdhpr	%hpstate,	%i4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x520, 	%hsys_tick_cmpr
	mulx	%o1,	0x1726,	%g3
	rdpr	%cwp,	%g1
	rdpr	%tba,	%g5
	movvs	%xcc,	%o6,	%l4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x61F, 	%hsys_tick_cmpr
	fmovdn	%icc,	%f3,	%f13
	stb	%l1,	[%l7 + 0x28]
	wrpr	%l2,	%l0,	%tick
	movleu	%xcc,	%l5,	%i5
	brlez	%o2,	loop_265
	wr	%o5,	0x065B,	%softint
	udiv	%i2,	0x0B92,	%i1
	fexpand	%f16,	%f16
loop_265:
	membar	0x3F
	fmovdn	%xcc,	%f16,	%f0
	movvc	%icc,	%g7,	%o3
	movne	%icc,	%o7,	%g2
	movrne	%i0,	0x03A,	%o4
	ld	[%l7 + 0x20],	%f15
	wr	%i6,	%l3,	%pic
	rdhpr	%htba,	%o0
	rdhpr	%hpstate,	%g4
	rdhpr	%hpstate,	%i4
	lduw	[%l7 + 0x7C],	%g6
	rd	%softint,	%i7
	rdpr	%cansave,	%o1
	st	%f30,	[%l7 + 0x7C]
	stb	%i3,	[%l7 + 0x37]
	fsrc1s	%f0,	%f4
	rdhpr	%hpstate,	%g1
	smul	%g5,	0x1415,	%o6
	wrpr	%l4,	%g3,	%tick
	rd	%y,	%l1
	movle	%xcc,	%l6,	%l0
	rdhpr	%hpstate,	%l5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x63B, 	%hsys_tick_cmpr
	wr	%g0,	0x89,	%asi
	ldsha	[%l7 + 0x34] %asi,	%o5
	wrpr	%i2,	%i1,	%tick
	wr	%g7,	0x09D1,	%set_softint
	rd	%ccr,	%o3
	tgu	%xcc,	0x6
	rdhpr	%hpstate,	%o7
	rdhpr	%hsys_tick_cmpr,	%o2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xDD5, 	%sys_tick_cmpr
	rdpr	%gl,	%g2
	rd	%sys_tick_cmpr,	%i6
	fbule	%fcc3,	loop_266
	andncc	%l3,	%g4,	%i4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	set	0x3C, %i0
	swapa	[%l7 + %i0] 0x0c,	%o1
loop_266:
	rdpr	%tba,	%g6
	sdivx	%g1,	0x1F2E,	%i3
	rdpr	%pil,	%o6
	rdpr	%pil,	%g5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	xorcc	%g3,	%l6,	%l1
	fpack16	%f14,	%f29
	wrpr	%l5,	%l2,	%tick
	rdhpr	%hsys_tick_cmpr,	%l0
	wr	%o5,	%i5,	%ccr
	rdpr	%canrestore,	%i1
	rdpr	%cansave,	%g7
	rdhpr	%hsys_tick_cmpr,	%i2
	rdhpr	%hpstate,	%o3
	rdhpr	%hpstate,	%o7
	udivx	%o2,	0x0038,	%o4
	rd	%asi,	%g2
	array32	%i0,	%l3,	%g4
	rdhpr	%hsys_tick_cmpr,	%i4
	edge8	%i6,	%o0,	%o1
	nop
	setx loop_267, %l0, %l1
	jmpl %l1, %i7
	rdpr	%cleanwin,	%g6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x741, 	%hsys_tick_cmpr
loop_267:
	ble,a,pn	%xcc,	loop_268
	wr	%g5,	0x02C8,	%ccr
	membar	#Sync
	set	0x40, %g7
	ldda	[%l7 + %g7] 0xf8,	%f0
loop_268:
	rd	%sys_tick_cmpr,	%g1
	movrlz	%g3,	%l6,	%l1
	tne	%xcc,	0x4
	rd	%asi,	%l4
	set	0x75, %l5
	ldstuba	[%l7 + %l5] 0x89,	%l5
	wrpr	%l2,	0x0069,	%cwp
	movre	%l0,	0x027,	%i5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%y,	%i2
	movge	%icc,	%o3,	%o5
	rd	%ccr,	%o2
	wr	%g0,	0x18,	%asi
	lduba	[%l7 + 0x55] %asi,	%o7
	subccc	%o4,	0x0584,	%i0
	wrpr	%l3,	%g2,	%cwp
	fmovda	%xcc,	%f1,	%f21
	wrpr	%g4,	0x17A7,	%pil
	udivx	%i4,	0x1EE3,	%i6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x5E0, 	%hsys_tick_cmpr
	movcc	%icc,	%i7,	%g6
	fbu,a	%fcc1,	loop_269
	fmovsneg	%icc,	%f3,	%f18
	fblg,a	%fcc3,	loop_270
	rdhpr	%htba,	%o6
loop_269:
	wr	%i3,	0x157B,	%pic
	fsrc2s	%f11,	%f17
loop_270:
	rd	%asi,	%g1
	rd	%pc,	%g5
	addcc	%l6,	0x1352,	%g3
	movrlz	%l1,	0x1CA,	%l5
	set	0x60, %l4
	swapa	[%l7 + %l4] 0x80,	%l2
	smul	%l0,	0x1A3D,	%l4
	rd	%tick_cmpr,	%i5
	wrpr	%g7,	%i2,	%cwp
	rd	%ccr,	%o3
	rdpr	%cansave,	%o5
	rdpr	%cleanwin,	%o2
	set	0x28, %g2
	stha	%i1,	[%l7 + %g2] 0x80
	rdhpr	%hintp,	%o4
	fcmple16	%f6,	%f2,	%i0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x49F, 	%hsys_tick_cmpr
	rdpr	%wstate,	%o7
	subccc	%g4,	%g2,	%i4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fmul8x16	%f19,	%f26,	%f14
	movg	%xcc,	%o0,	%i6
	set	0x44, %g6
	sta	%f24,	[%l7 + %g6] 0x88

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%ccr,	%o6
	fbue	%fcc3,	loop_271
	rdpr	%cwp,	%i3
	wrpr	%i7,	%g5,	%pil
	rdhpr	%hsys_tick_cmpr,	%g1
loop_271:
	movg	%icc,	%l6,	%l1
	andcc	%g3,	%l2,	%l0
	andncc	%l5,	%i5,	%g7
	edge32l	%i2,	%o3,	%o5
	rdpr	%tl,	%o2
	rd	%pc,	%l4
	sllx	%i1,	%i0,	%l3
	movle	%xcc,	%o7,	%o4
	rdpr	%cleanwin,	%g2
	add	%i4,	%o1,	%g4
	rdhpr	%htba,	%i6
	rdpr	%cansave,	%g6
	ldsh	[%l7 + 0x66],	%i3
	bn,pn	%icc,	loop_272
	orncc	%i7,	0x11EC,	%o6
	fmuld8ulx16	%f6,	%f13,	%f12

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_272:
	wr	%l6,	%g5,	%sys_tick
	fcmped	%fcc3,	%f20,	%f8
	rdhpr	%hpstate,	%l1
	rdpr	%pil,	%l2
	wr	%l0,	%g3,	%y
	movge	%icc,	%i5,	%l5
	siam	0x3
	edge8n	%i2,	%o3,	%o5
	rd	%fprs,	%g7
	rd	%fprs,	%l4
	rdpr	%cwp,	%i1
	fble	%fcc2,	loop_273
	movcs	%xcc,	%i0,	%o2
	rdpr	%otherwin,	%l3
	wrpr	%o4,	0x083D,	%tick
loop_273:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	addc	%i4,	0x1B5E,	%o7
	wr	%g4,	0x1EC7,	%pic
	wr	%o1,	0x16EF,	%ccr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xBDB, 	%hsys_tick_cmpr
	edge16l	%g6,	%i3,	%i7
	wr	%o6,	%g1,	%clear_softint

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xA21, 	%hsys_tick_cmpr
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	set	0x38, %o5
	prefetch	[%l7 + %o5],	 0x2
	wr	%l1,	%l6,	%set_softint
	edge16n	%l2,	%g3,	%l0
	edge8l	%i5,	%l5,	%o3
	wr	%o5,	0x162F,	%set_softint
	rdhpr	%hsys_tick_cmpr,	%i2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fmovsg	%xcc,	%f5,	%f18
	rdhpr	%hintp,	%g7
	wrpr	%i0,	0x1377,	%tick
	mova	%xcc,	%i1,	%l3
	fandnot1s	%f30,	%f18,	%f12
	fmul8x16	%f23,	%f18,	%f24
	mulscc	%o2,	%o4,	%g2
	rdpr	%cansave,	%i4
	smul	%o7,	0x018A,	%g4
	bcc,a,pt	%xcc,	loop_274
	rd	%ccr,	%i6
	wrpr	%g6,	0x1DBA,	%pil
	movvs	%icc,	%i3,	%o1
loop_274:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%hintp,	%o6
	fbul,a	%fcc3,	loop_275
	rd	%sys_tick_cmpr,	%g1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	orcc	%i7,	0x1AB4,	%l1
loop_275:
	move	%xcc,	%l6,	%l2
	or	%l0,	0x0695,	%i5
	rdpr	%tl,	%g3
	fble,a	%fcc1,	loop_276
	fblg	%fcc1,	loop_277
	edge32	%l5,	%o5,	%o3
	bcs,a,pt	%icc,	loop_278
loop_276:
	te	%icc,	0x5
loop_277:
	wr	%i2,	0x1404,	%pic
	fmuld8ulx16	%f8,	%f26,	%f2
loop_278:
	rdpr	%tl,	%g7
	rdhpr	%hsys_tick_cmpr,	%l4
	tle	%icc,	0x1
	mova	%icc,	%i0,	%l3
	wr	%i1,	%o4,	%pic
	rdpr	%cansave,	%o2
	wrpr	%g2,	%o7,	%cwp
	rd	%ccr,	%g4
	wrpr	%i6,	%g6,	%cwp
	fblg,a	%fcc0,	loop_279
	orn	%i4,	%i3,	%o1
	and	%o6,	0x18EB,	%g1
	fmul8x16	%f19,	%f10,	%f8
loop_279:
	rdhpr	%htba,	%g5
	wr	%i7,	0x039C,	%clear_softint
	rdpr	%canrestore,	%l1
	tsubcctv	%l6,	%o0,	%l2
	xorcc	%l0,	0x1054,	%g3
	bvc,pt	%xcc,	loop_280
	fmovrslez	%l5,	%f18,	%f18
	rdpr	%cwp,	%o5
	taddcctv	%i5,	%i2,	%g7
loop_280:
	fpsub32	%f24,	%f20,	%f26
	fmovsl	%icc,	%f3,	%f16
	wr	%o3,	0x0D09,	%softint
	xor	%i0,	%l4,	%i1
	umulcc	%o4,	%o2,	%l3
	std	%f12,	[%l7 + 0x30]
	subccc	%o7,	%g2,	%g4
	rdhpr	%hpstate,	%i6
	movrne	%g6,	0x2FF,	%i3
	rdpr	%gl,	%i4
	rd	%asi,	%o1
	smul	%g1,	%g5,	%o6
	rdpr	%tl,	%l1
	rdhpr	%hsys_tick_cmpr,	%l6
	rdhpr	%htba,	%i7
	wr	%o0,	0x1A06,	%y
	tne	%xcc,	0x7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xBF3, 	%hsys_tick_cmpr
	fmovsl	%xcc,	%f31,	%f8
	wr	%i5,	%l5,	%sys_tick
	add	%g7,	%i2,	%i0
	wrpr	%l4,	%i1,	%cwp
	wrpr	%o4,	%o2,	%tick
	rdhpr	%hsys_tick_cmpr,	%o3
	brz,a	%o7,	loop_281
	movl	%xcc,	%l3,	%g4
	addc	%g2,	0x19D4,	%g6
	wr	%i6,	%i4,	%sys_tick
loop_281:
	fcmpgt32	%f6,	%f26,	%o1
	udiv	%g1,	0x1E1F,	%g5
	wrpr	%o6,	%l1,	%pil
	rdhpr	%htba,	%i3
	wrpr	%i7,	0x1E28,	%cwp
	movg	%icc,	%l6,	%l2
	rd	%softint,	%g3
	wrpr	%l0,	%o5,	%cwp
	rdpr	%pil,	%i5
	rdhpr	%hpstate,	%o0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xC7E, 	%hsys_tick_cmpr
	smul	%g7,	0x0C75,	%i2
	sdiv	%i0,	0x1A64,	%l4
	rdhpr	%htba,	%i1
	nop
	setx	loop_282,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	prefetch	[%l7 + 0x18],	 0x0
	te	%icc,	0x7
	wrpr	%o4,	%o2,	%tick
loop_282:
	movleu	%xcc,	%o7,	%o3
	ldsb	[%l7 + 0x1C],	%g4
	rdpr	%cansave,	%g2
	wrpr	%g6,	0x0CF6,	%tick
	rdhpr	%hpstate,	%l3
	wr	%i6,	0x18E3,	%softint
	wr	%i4,	%g1,	%softint
	movg	%icc,	%o1,	%o6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x93A, 	%tick_cmpr
	sub	%i7,	0x06CE,	%l6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xDF5, 	%hsys_tick_cmpr
	rdpr	%cansave,	%l1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	fmovde	%xcc,	%f7,	%f23
	udiv	%l0,	0x0BEA,	%o5
	movn	%icc,	%o0,	%l5
	rd	%ccr,	%i5
	wrpr	%i2,	%g7,	%tick
	rdhpr	%htba,	%i0
	rdhpr	%hintp,	%l4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x603, 	%tick_cmpr
	movpos	%icc,	%o2,	%i1
	sethi	0x1413,	%o7
	wr	%g0,	0x10,	%asi
	ldsha	[%l7 + 0x2A] %asi,	%o3
	set	0x3D, %i4
	lduba	[%l7 + %i4] 0x88,	%g4
	rd	%asi,	%g2
	bn,a,pt	%xcc,	loop_283
	brgez,a	%l3,	loop_284
	movpos	%xcc,	%i6,	%i4
	mulscc	%g6,	0x0122,	%o1
loop_283:
	wrpr	%o6,	0x15F3,	%tick
loop_284:
	rd	%fprs,	%g5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	orncc	%l6,	0x09AE,	%l2
	edge32	%l1,	%i7,	%l0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	prefetch	[%l7 + 0x74],	 0x2
	rdhpr	%hintp,	%g3
	wr	%o0,	0x094E,	%softint
	rdhpr	%hintp,	%i5
	rd	%pc,	%l5
	fmovrslz	%i2,	%f29,	%f3
	edge8ln	%g7,	%l4,	%o4
	wrpr	%i0,	0x0066,	%cwp
	set	0x38, %l6
	prefetcha	[%l7 + %l6] 0x18,	 0x0
	wr 	%g0, 	0x6, 	%fprs
	tsubcc	%g4,	0x07CC,	%o3
	fcmpeq32	%f26,	%f2,	%g2
	rd	%softint,	%l3
	rdhpr	%hintp,	%i4
	andcc	%i6,	0x191C,	%o1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xD04, 	%hsys_tick_cmpr
	rd	%ccr,	%o6
	tg	%icc,	0x2
	edge8ln	%g5,	%i3,	%l6
	fand	%f10,	%f12,	%f0
	edge16n	%l2,	%l1,	%g1
	ble,a	loop_285
	brgez	%i7,	loop_286
	xorcc	%l0,	0x02E6,	%g3
	add	%l7,	0x10,	%l6
	wr	%g0,	0x19,	%asi
	ldxa	[%l6] %asi,	%o0
	casxa	[%l6] %asi,	%o0,	%o5
loop_285:
	edge8	%i5,	%i2,	%l5
loop_286:
	fmovsn	%xcc,	%f12,	%f23
	rdhpr	%hpstate,	%g7
	wrpr	%l4,	%i0,	%cwp
	movcs	%xcc,	%o2,	%o4
	rd	%pc,	%o7
	fpadd16	%f16,	%f10,	%f18
	rdpr	%pil,	%g4
	andn	%i1,	%o3,	%l3
	rd	%softint,	%i4
	rdpr	%tl,	%g2
	wrpr	%i6,	0x1AE4,	%cwp
	set	0x6C, %i7
	lda	[%l7 + %i7] 0x04,	%f22
	rdhpr	%htba,	%g6
	smul	%o1,	%o6,	%i3
	popc	%l6,	%l2
	andn	%l1,	%g1,	%g5
	rdhpr	%htba,	%i7
	rdpr	%canrestore,	%l0
	rd	%ccr,	%g3
	movcs	%icc,	%o0,	%i5
	rdhpr	%hintp,	%o5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xE98, 	%hsys_tick_cmpr
	rd	%ccr,	%l4
	fbule,a	%fcc3,	loop_287
	wr	%i0,	%l5,	%y
	andcc	%o2,	0x1F7D,	%o4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x85D, 	%hsys_tick_cmpr
loop_287:
	rdhpr	%hintp,	%i1
	wrpr	%l3,	0x10D9,	%cwp
	fnands	%f5,	%f13,	%f28
	rd	%ccr,	%o3
	movre	%i4,	%g2,	%i6
	rd	%ccr,	%o1
	rdhpr	%hsys_tick_cmpr,	%g6
	wr	%o6,	0x0879,	%pic
	fmul8sux16	%f10,	%f20,	%f2
	rdpr	%otherwin,	%i3
	tcs	%icc,	0x0
	rdpr	%cansave,	%l2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%htba,	%g1
	wr	%g5,	0x18E4,	%sys_tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x98D, 	%hsys_tick_cmpr
	edge8ln	%g3,	%i5,	%o0
	movle	%icc,	%i2,	%o5
	fbl,a	%fcc3,	loop_288
	array16	%g7,	%i0,	%l5
	rd	%y,	%o2
	rdpr	%canrestore,	%l4
loop_288:
	wrpr	%o7,	%o4,	%tick
	movvc	%xcc,	%i1,	%l3
	fpack32	%f2,	%f8,	%f20
	rdhpr	%hintp,	%g4
	wrpr	%i4,	%o3,	%cwp
	wr 	%g0, 	0x7, 	%fprs
	rd	%sys_tick_cmpr,	%i6
	fsrc1	%f12,	%f6
	rd	%ccr,	%o1
	fmovsvs	%icc,	%f2,	%f15
	movre	%g6,	%i3,	%o6
	rd	%ccr,	%l1
	rd	%softint,	%l6
	tle	%icc,	0x1
	ta	%icc,	0x2
	rdhpr	%hpstate,	%l2
	rd	%y,	%g1
	set	0x48, %i5
	sta	%f21,	[%l7 + %i5] 0x11
	prefetch	[%l7 + 0x7C],	 0x3
	nop
	setx	loop_289,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movcc	%xcc,	%l0,	%g5
	fxnors	%f13,	%f19,	%f22
	wr	%g0,	0x89,	%asi
	lduha	[%l7 + 0x42] %asi,	%i7
loop_289:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	wrpr	%o0,	0x0EA8,	%tick
	wrpr	%g3,	%o5,	%pil
	array32	%g7,	%i2,	%i0
	wrpr	%o2,	%l4,	%cwp
	wr	%l5,	0x02B2,	%softint
	rd	%asi,	%o4
	fbn	%fcc1,	loop_290
	rd	%y,	%o7
	edge8l	%i1,	%l3,	%g4
	rdpr	%pil,	%i4
loop_290:
	rd	%asi,	%g2
	subc	%i6,	%o3,	%o1
	addcc	%g6,	%o6,	%l1
	rdpr	%otherwin,	%i3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x482, 	%hsys_tick_cmpr
	wrpr	%g1,	0x0BC0,	%pil
	rd	%pc,	%l0
	movge	%xcc,	%i7,	%g5
	rd	%y,	%i5
	subcc	%g3,	0x048F,	%o5
	smulcc	%o0,	%i2,	%i0
	srax	%g7,	%l4,	%l5
	rd	%tick_cmpr,	%o2
	fmovse	%icc,	%f24,	%f5
	rdpr	%cwp,	%o7
	wrpr	%i1,	0x07F7,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%sys_tick_cmpr,	%l3
	rd	%y,	%g2
	wrpr	%i6,	%i4,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	orn	%o6,	0x164A,	%o3
	addc	%l1,	%i3,	%l2
	wrpr	%g1,	%l0,	%tick
	nop
	setx	loop_291,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	wr	%l6,	0x11F2,	%y
	rdhpr	%htba,	%i7
	movneg	%icc,	%g5,	%i5
loop_291:
	edge8	%o5,	%g3,	%i2
	fpsub16	%f0,	%f10,	%f30
	lduw	[%l7 + 0x58],	%i0
	stb	%g7,	[%l7 + 0x48]
	rdhpr	%hintp,	%l4
	rd	%pc,	%o0
	rd	%softint,	%o2
	wr	%o7,	0x1CAD,	%ccr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	tn	%icc,	0x1
	wr	%l5,	0x047D,	%sys_tick
	fexpand	%f1,	%f18
	edge16l	%g4,	%l3,	%i6
	wrpr	%i4,	0x196C,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%asi,	%o6
	wr	%g2,	0x0209,	%ccr
	rdhpr	%hintp,	%l1
	subccc	%i3,	%o3,	%g1
	wr	%g0,	0x80,	%asi
	lduwa	[%l7 + 0x2C] %asi,	%l0
	ldub	[%l7 + 0x6B],	%l2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	bneg,a,pn	%xcc,	loop_292
	rd	%ccr,	%g5
	rdpr	%otherwin,	%o5
	wr	%i5,	%g3,	%y
loop_292:
	addc	%i0,	0x1ED0,	%g7
	rdpr	%otherwin,	%i2
	wrpr	%o0,	0x0AD9,	%pil
	wr	%g0,	0x2a,	%asi
	stba	%o2,	[%l7 + 0x36] %asi
	membar	#Sync
	umulcc	%o7,	%l4,	%i1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xE19, 	%tick_cmpr
	stb	%l3,	[%l7 + 0x31]
	set	0x78, %o1
	ldxa	[%l7 + %o1] 0x81,	%i6
	movcc	%icc,	%i4,	%o4
	rdhpr	%htba,	%g6
	rdpr	%cansave,	%o1
	srlx	%g2,	0x00,	%l1
	std	%f30,	[%l7 + 0x48]
	call	loop_293
	wrpr	%o6,	0x0DE7,	%tick
	rdpr	%tba,	%o3
	umulcc	%i3,	%l0,	%g1
loop_293:
	ldsh	[%l7 + 0x24],	%l2
	rdhpr	%hintp,	%l6
	sth	%g5,	[%l7 + 0x76]
	rd	%softint,	%o5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x67D, 	%tick_cmpr
	rdhpr	%hsys_tick_cmpr,	%i0
	rd	%asi,	%g7
	fbg	%fcc1,	loop_294
	fbg	%fcc1,	loop_295
	smulcc	%i5,	%i2,	%o2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x3D1, 	%tick_cmpr
loop_294:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_295:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%hpstate,	%i1
	wrpr	%l3,	0x0B53,	%tick
	wrpr	%i6,	%i4,	%pil
	rdpr	%pil,	%o4
	rdhpr	%hintp,	%o1
	movgu	%xcc,	%g6,	%g2
	edge8n	%l1,	%o6,	%o3
	rdpr	%tba,	%i3
	brgz,a	%g1,	loop_296
	wr	%l0,	%l2,	%ccr
	tle	%icc,	0x1
	wrpr	%g5,	%l6,	%cwp
loop_296:
	wrpr	%o5,	%g3,	%pil
	wr	%g0,	0x89,	%asi
	ldswa	[%l7 + 0x50] %asi,	%i0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x163, 	%hsys_tick_cmpr
	srl	%i5,	%i2,	%o0
	te	%xcc,	0x3
	movle	%xcc,	%o2,	%l4
	rdhpr	%htba,	%l5
	tsubcctv	%o7,	%g4,	%i1
	rdpr	%tl,	%i6
	rdhpr	%hpstate,	%l3
	rdhpr	%hintp,	%i4
	set	0x16, %o6
	stba	%o4,	[%l7 + %o6] 0x0c
	wr	%g6,	0x199D,	%pic

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xD9D, 	%hsys_tick_cmpr
	rdhpr	%htba,	%o3
	wr	%i3,	%g1,	%softint
	rdpr	%tl,	%o6
	wrpr	%l0,	%g5,	%cwp
	wr	%l6,	0x0433,	%ccr
	wrpr	%o5,	%g3,	%tick
	rd	%softint,	%l2
	ldsh	[%l7 + 0x40],	%i0
	rdpr	%otherwin,	%g7
	rd	%pc,	%i7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	movne	%icc,	%i5,	%o2
	wr	%l5,	%l4,	%pic
	rd	%sys_tick_cmpr,	%g4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	rdhpr	%hintp,	%o7
	wr	%l3,	%o4,	%y
	rd	%tick_cmpr,	%i4
	fnot1	%f30,	%f24
	fmovsge	%xcc,	%f30,	%f21
	rd	%fprs,	%g6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%htba,	%g1
	wr	%i3,	%o6,	%softint
	movvc	%icc,	%l0,	%l6
	rdhpr	%hpstate,	%o5
	wr	%g5,	%l2,	%set_softint
	movcc	%xcc,	%g3,	%i0
	wr	%i7,	%i2,	%set_softint
	wrpr	%o0,	0x054B,	%pil
	movle	%xcc,	%i5,	%o2
	wr	%g7,	0x1F20,	%softint
	wr	%l4,	%l5,	%y
	rdhpr	%hintp,	%i1
	rdhpr	%htba,	%g4
	orcc	%o7,	%i6,	%o4
	fmovrdlez	%l3,	%f30,	%f12
	andn	%g6,	0x0EA8,	%i4
	rdpr	%tba,	%o1
	rdhpr	%hpstate,	%g2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x038, 	%hsys_tick_cmpr
	rdhpr	%hsys_tick_cmpr,	%g1
	set	0x1C, %i6
	sta	%f19,	[%l7 + %i6] 0x0c
	flushw

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x2F1, 	%hsys_tick_cmpr
	rdpr	%otherwin,	%o6
	wr	%l0,	0x0ABC,	%softint
	array32	%l6,	%o5,	%l2
	mova	%icc,	%g3,	%g5
	rdhpr	%hpstate,	%i7
	rdpr	%cleanwin,	%i0
	rdhpr	%htba,	%o0
	wrpr	%i5,	%i2,	%cwp
	movgu	%xcc,	%g7,	%o2
	brnz	%l4,	loop_297
	srl	%l5,	%i1,	%g4
	rdpr	%pil,	%i6
	rd	%tick_cmpr,	%o7
loop_297:
	tvc	%xcc,	0x7
	fbe,a	%fcc3,	loop_298
	fmovdleu	%xcc,	%f10,	%f14
	rdhpr	%htba,	%o4
	fabss	%f23,	%f30
loop_298:
	rdhpr	%hsys_tick_cmpr,	%g6
	edge32	%i4,	%o1,	%l3
	addccc	%o3,	%l1,	%g1
	wr	%g2,	0x10E1,	%softint

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x9BF, 	%hsys_tick_cmpr
	movvs	%icc,	%i3,	%l0
	rd	%softint,	%o5
	wr 	%g0, 	0x7, 	%fprs
	fmovsn	%icc,	%f3,	%f6
	wr	%l6,	%g5,	%pic
	movn	%xcc,	%i7,	%i0
	rdpr	%tl,	%i5
	rd	%sys_tick_cmpr,	%o0
	brgz	%i2,	loop_299
	rdpr	%cwp,	%o2
	tcc	%icc,	0x2
	mulscc	%g7,	%l5,	%i1
loop_299:
	umul	%g4,	%i6,	%l4
	rd	%ccr,	%o7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%htba,	%i4
	xnor	%l3,	0x1909,	%o3
	srlx	%l1,	0x1E,	%g1
	wr	%o1,	%g2,	%pic
	rd	%y,	%i3
	fmuld8sux16	%f0,	%f27,	%f6
	rdpr	%otherwin,	%l0
	rdpr	%wstate,	%o5
	prefetch	[%l7 + 0x50],	 0x0
	brz,a	%o6,	loop_300
	sdivx	%g3,	0x1DA5,	%l6
	rdhpr	%hpstate,	%g5
	wrpr	%l2,	0x1FFD,	%pil
loop_300:
	tcs	%icc,	0x5
	wr	%i7,	%i0,	%ccr
	tcs	%icc,	0x6
	sub	%i5,	0x036E,	%i2
	fpadd32s	%f18,	%f18,	%f20
	wr	%o2,	%g7,	%clear_softint
	tle	%icc,	0x4
	alignaddrl	%l5,	%i1,	%o0
	stw	%i6,	[%l7 + 0x20]
	rdhpr	%hsys_tick_cmpr,	%g4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x65C, 	%hsys_tick_cmpr
	wrpr	%l4,	0x13EC,	%pil
	tg	%xcc,	0x2
	sethi	0x056C,	%g6
	and	%i4,	%l3,	%o4
	wrpr	%o3,	0x1528,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x4A8, 	%sys_tick_cmpr
	rd	%tick_cmpr,	%g2
	rdhpr	%hpstate,	%o1
	smulcc	%l0,	0x1561,	%o5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fmovdcs	%xcc,	%f15,	%f15
	fmovrse	%g3,	%f28,	%f26
	rdhpr	%hsys_tick_cmpr,	%l6
	wr	%g5,	0x0F02,	%y
	andncc	%l2,	%i7,	%i5
	fmovdleu	%xcc,	%f26,	%f3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xDDE, 	%hsys_tick_cmpr
	popc	%g7,	%l5
	rdhpr	%hintp,	%i1
	tvs	%xcc,	0x2
	rdpr	%tba,	%o2
	mulx	%o0,	%i6,	%g4
	rdpr	%canrestore,	%l4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xAFB, 	%hsys_tick_cmpr
	xnorcc	%o4,	0x05FA,	%l1
	alignaddr	%g1,	%g2,	%o3
	rdpr	%pil,	%l0
	fsrc1s	%f13,	%f31
	addcc	%o1,	0x1B5A,	%o6
	rdpr	%wstate,	%o5
	and	%g3,	0x0E90,	%l6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%l2,	%i7,	%cwp
	fpadd32s	%f15,	%f20,	%f21
	rdpr	%wstate,	%i5
	brnz,a	%i3,	loop_301
	rdpr	%tba,	%i2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	tle	%xcc,	0x1
loop_301:
	rdpr	%otherwin,	%l5
	wrpr	%o2,	%i1,	%pil
	fandnot2	%f28,	%f24,	%f24
	fbg,a	%fcc1,	loop_302
	xor	%i6,	%g4,	%o0
	rdpr	%wstate,	%o7
	rdhpr	%hpstate,	%i4
loop_302:
	rdpr	%cleanwin,	%l4
	nop
	set	0x10, %g1
	stb	%g6,	[%l7 + %g1]
	subcc	%o4,	%l1,	%g1
	add	%l3,	%g2,	%l0
	movge	%icc,	%o3,	%o1
	wrpr	%o5,	%g3,	%tick
	rd	%softint,	%l6
	edge32ln	%o6,	%l2,	%g5
	rdhpr	%hpstate,	%i5
	wrpr	%i7,	%i3,	%pil
	edge32ln	%i2,	%i0,	%g7
	fmovsgu	%icc,	%f31,	%f11
	wr	%l5,	%o2,	%pic
	rdhpr	%hsys_tick_cmpr,	%i1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x2A8, 	%hsys_tick_cmpr
	edge16l	%o0,	%o7,	%i4
	fcmpgt16	%f28,	%f0,	%i6
	fxnor	%f18,	%f6,	%f0
	mulscc	%g6,	0x1F14,	%l4
	bvs,a,pt	%icc,	loop_303
	rd	%y,	%o4
	edge32	%g1,	%l3,	%l1
	rdpr	%pil,	%g2
loop_303:
	be,pt	%icc,	loop_304
	wrpr	%l0,	0x0731,	%cwp
	wr	%g0,	0x04,	%asi
	prefetcha	[%l7 + 0x38] %asi,	 0x2
loop_304:
	rd	%asi,	%o1
	tl	%xcc,	0x2
	rdpr	%pil,	%o5
	rdpr	%tl,	%g3
	fbge,a	%fcc1,	loop_305
	rdhpr	%hsys_tick_cmpr,	%o6
	wr	%l6,	0x14AB,	%y

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x9EC, 	%hsys_tick_cmpr
loop_305:
	rd	%asi,	%i5
	rdhpr	%hpstate,	%i3
	fnot1s	%f13,	%f31
	fble	%fcc1,	loop_306
	rdhpr	%htba,	%i7
	rd	%ccr,	%i0
	rd	%tick_cmpr,	%g7
loop_306:
	tcc	%xcc,	0x0
	xor	%l5,	%i2,	%i1
	fmuld8sux16	%f15,	%f6,	%f28

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	ta	%icc,	0x1
	rdhpr	%hsys_tick_cmpr,	%o0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xEBC, 	%hsys_tick_cmpr
	rdpr	%tba,	%i6
	rdhpr	%hintp,	%i4
	ta	%xcc,	0x4
	sra	%l4,	0x05,	%g6
	brlez	%o4,	loop_307
	tleu	%icc,	0x6
	movn	%xcc,	%l3,	%l1
	tsubcc	%g1,	%g2,	%o3
loop_307:
	nop
	wr	%g0,	0x11,	%asi
	ldswa	[%l7 + 0x08] %asi,	%o1
	rdhpr	%hintp,	%o5
	rd	%pc,	%l0
	rd	%softint,	%o6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x69E, 	%hsys_tick_cmpr
	subcc	%g5,	0x1AA6,	%l6
	fblg,a	%fcc0,	loop_308
	alignaddrl	%l2,	%i3,	%i7
	wr	%i0,	0x1C2B,	%sys_tick
	ta	%icc,	0x5
loop_308:
	fmovrslez	%g7,	%f17,	%f29
	rd	%y,	%l5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%o2,	%o0,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x017, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%asi,	%i6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	udivx	%g4,	0x09F2,	%g6
	rdhpr	%htba,	%l3
	edge32n	%l1,	%o4,	%g2
	sir	0x1577
	tne	%xcc,	0x3
	movne	%icc,	%g1,	%o1
	fbule,a	%fcc1,	loop_309
	rdhpr	%hintp,	%o3
	rdpr	%wstate,	%o5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
loop_309:
	rdhpr	%hpstate,	%g5
	rdpr	%cwp,	%l6
	mulscc	%l2,	0x1EF9,	%i3
	wrpr	%i7,	%g3,	%cwp
	rdhpr	%hsys_tick_cmpr,	%i0
	edge32	%l5,	%i2,	%i5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x4CD, 	%hsys_tick_cmpr
	addccc	%o0,	0x1813,	%g7
	movrgez	%o7,	0x33C,	%i6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xB9B, 	%sys_tick_cmpr
	taddcc	%i1,	%g4,	%l3
	rd	%asi,	%g6
	set	0x60, %o3
	ldda	[%l7 + %o3] 0x2f,	%o4
	wrpr	%l1,	%g2,	%tick
	rdhpr	%hintp,	%o1
	rdpr	%canrestore,	%g1
	movrgz	%o5,	0x01C,	%o3
	for	%f12,	%f28,	%f26
	rdhpr	%hintp,	%l0
	wrpr	%o6,	%g5,	%pil
	movgu	%xcc,	%l2,	%i3
	mulscc	%i7,	0x067E,	%g3
	movg	%xcc,	%i0,	%l6
	udivcc	%i2,	0x0338,	%l5
	std	%o2,	[%l7 + 0x68]
	addcc	%o0,	0x08C4,	%i5
	rdhpr	%hintp,	%g7
	wr	%o7,	0x10D8,	%clear_softint
	sdiv	%i6,	0x0607,	%i4
	fornot2	%f24,	%f14,	%f0
	rdpr	%cansave,	%i1
	addccc	%l4,	%g4,	%g6
	wr	%o4,	0x1475,	%clear_softint
	wrpr	%l1,	%g2,	%tick
	rdhpr	%hsys_tick_cmpr,	%l3
	faligndata	%f20,	%f20,	%f26

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xCE8, 	%hsys_tick_cmpr
	rdpr	%tba,	%o5
	rdhpr	%hsys_tick_cmpr,	%o3
	rdpr	%tl,	%g1
	tpos	%xcc,	0x2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%hpstate,	%g5
	wrpr	%l2,	0x0ACB,	%tick
	rdpr	%tba,	%i7
	fors	%f9,	%f22,	%f28

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x8DB, 	%hsys_tick_cmpr
	rdpr	%canrestore,	%g3
	wrpr	%l6,	0x00A8,	%cwp
	fandnot2	%f16,	%f0,	%f28
	fornot1s	%f28,	%f5,	%f30

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xD2A, 	%hsys_tick_cmpr
	brgez	%o2,	loop_310
	rdpr	%cleanwin,	%i2
	wr	%i5,	%o0,	%sys_tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x039, 	%hsys_tick_cmpr
loop_310:
	wrpr	%i6,	%o7,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%hpstate,	%l4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x64E, 	%hsys_tick_cmpr
	rdpr	%otherwin,	%o4
	rdhpr	%htba,	%g2
	wr	%l3,	%l1,	%softint
	subc	%o1,	%o3,	%o5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%softint,	%g5
	ta	%xcc,	0x0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x84F, 	%tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%tba,	%l6
	wr	%i3,	%l5,	%ccr
	rd	%asi,	%i0
	edge32	%i2,	%i5,	%o2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x087, 	%sys_tick_cmpr
	wrpr	%i6,	0x0125,	%tick
	movrgez	%g7,	0x144,	%o7
	tgu	%icc,	0x5
	rdpr	%gl,	%i1
	edge32ln	%i4,	%l4,	%g4
	fbu,a	%fcc1,	loop_311
	wrpr	%o4,	0x1677,	%cwp
	edge32	%g2,	%l3,	%l1
	membar	0x07
loop_311:
	popc	0x1FEB,	%o1
	rdhpr	%htba,	%o3
	tneg	%xcc,	0x5
	rdhpr	%hsys_tick_cmpr,	%o5
	wrpr	%g6,	0x07F9,	%pil
	rdpr	%canrestore,	%g1
	rdhpr	%htba,	%g5
	rd	%softint,	%l0
	wr 	%g0, 	0x6, 	%fprs
	sllx	%l2,	%l6,	%g3
	fxnor	%f18,	%f4,	%f4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x9E7, 	%hsys_tick_cmpr
	movpos	%xcc,	%i2,	%i5
	rdhpr	%hintp,	%o2
	fcmpgt32	%f12,	%f24,	%i0
	wr	%o0,	%i6,	%clear_softint

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	tvs	%icc,	0x2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x849, 	%tick_cmpr
	movge	%xcc,	%l4,	%g4
	rdhpr	%htba,	%i4
	rdpr	%pil,	%g2
	wr 	%g0, 	0x7, 	%fprs
	or	%o1,	0x1E93,	%o3
	or	%o5,	%g6,	%l1
	fcmpeq16	%f14,	%f4,	%g5
	rdhpr	%hpstate,	%l0
	edge16ln	%g1,	%o6,	%i7
	fcmpgt16	%f22,	%f8,	%l2
	wr	%g0,	0x18,	%asi
	ldstuba	[%l7 + 0x0D] %asi,	%g3
	rd	%asi,	%i3
	wrpr	%l6,	%i2,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%o0,	%i6,	%pil
	tgu	%xcc,	0x7
	movne	%icc,	%g7,	%i1
	fbug,a	%fcc0,	loop_312
	rd	%fprs,	%o7
	wr	%i0,	%g4,	%y
	ta	%icc,	0x4
loop_312:
	fmovscs	%icc,	%f14,	%f23
	rdhpr	%hsys_tick_cmpr,	%l4
	array16	%g2,	%i4,	%o4
	wrpr	%o1,	%l3,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%l1,	%g5,	%pil
	fbg	%fcc2,	loop_313
	rd	%fprs,	%l0
	fmovdn	%icc,	%f10,	%f11
	rdhpr	%hpstate,	%g6
loop_313:
	rdhpr	%hintp,	%g1
	fmovsleu	%icc,	%f20,	%f1
	rd	%ccr,	%o6
	wr	%g0,	0x81,	%asi
	prefetcha	[%l7 + 0x08] %asi,	 0x0
	wrpr	%g3,	%i3,	%tick
	rdhpr	%hintp,	%l2
	movrgez	%i2,	0x1AC,	%l6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xC55, 	%hsys_tick_cmpr
	fandnot1s	%f10,	%f31,	%f1
	std	%l4,	[%l7 + 0x30]
	wrpr	%o0,	0x167F,	%cwp
	brgez	%o2,	loop_314
	rdhpr	%hpstate,	%g7
	rdpr	%cwp,	%i6
	rdhpr	%hpstate,	%o7
loop_314:
	rdhpr	%htba,	%i1
	rd	%asi,	%g4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xF45, 	%tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x8FE, 	%hsys_tick_cmpr
	rdpr	%pil,	%g2
	bvs,pt	%xcc,	loop_315
	rdhpr	%hintp,	%o4
	rdpr	%canrestore,	%o1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_315:
	rdpr	%tl,	%l3
	movrlz	%o3,	0x063,	%l1
	rdhpr	%hintp,	%g5
	sllx	%o5,	%g6,	%l0
	wrpr	%g1,	%o6,	%pil
	fpadd32s	%f19,	%f4,	%f3
	rdhpr	%hpstate,	%i7
	rdhpr	%hintp,	%g3
	rdpr	%cansave,	%i3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%pc,	%l6
	rd	%asi,	%i5
	rdhpr	%htba,	%o0
	taddcctv	%l5,	%o2,	%g7
	wrpr	%o7,	%i1,	%pil
	rd	%ccr,	%i6
	fcmpgt32	%f22,	%f4,	%l4
	fmovdvs	%icc,	%f30,	%f24
	rdhpr	%hsys_tick_cmpr,	%g4
	movrne	%g2,	0x0AF,	%o4
	wr	%i0,	0x0311,	%pic
	rdpr	%pil,	%i4
	wrpr	%o1,	0x1DFB,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xD9B, 	%hsys_tick_cmpr
	wrpr	%l1,	0x1328,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x0E0, 	%hsys_tick_cmpr
	bge,a	loop_316
	wrpr	%l0,	%g6,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%htba,	%i7
loop_316:
	fmovsleu	%icc,	%f23,	%f26
	swap	[%l7 + 0x10],	%g1
	movneg	%xcc,	%i3,	%i2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xBF5, 	%hsys_tick_cmpr
	fcmps	%fcc1,	%f28,	%f18
	movn	%icc,	%l6,	%l2
	fnot1s	%f31,	%f0
	wrpr	%o0,	0x1849,	%tick
	wrpr	%i5,	0x1935,	%cwp
	smul	%l5,	0x000A,	%o2
	flushw
	rdpr	%canrestore,	%o7
	wr	%g0,	0x88,	%asi
	ldsba	[%l7 + 0x34] %asi,	%i1
	rd	%ccr,	%g7
	wr	%i6,	0x13FC,	%y
	flushw

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x0DF, 	%tick_cmpr
	rdhpr	%htba,	%l4
	set	0x68, %l3
	stda	%o4,	[%l7 + %l3] 0x10
	fornot1s	%f27,	%f7,	%f0
	xnor	%i0,	%i4,	%g2
	set	0x14, %l2
	ldswa	[%l7 + %l2] 0x18,	%o1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wrpr	%l3,	0x0D19,	%tick
	addccc	%l1,	0x1469,	%g5
	brnz	%o5,	loop_317
	bge,pn	%icc,	loop_318
	wrpr	%o3,	%g6,	%tick
	lduh	[%l7 + 0x12],	%l0
loop_317:
	rd	%sys_tick_cmpr,	%o6
loop_318:
	rdhpr	%hintp,	%g1
	wr	%i7,	%i2,	%set_softint
	wrpr	%g3,	%i3,	%pil
	wr	%l2,	%o0,	%pic
	mulx	%l6,	%l5,	%i5
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x10
	wr	%g0,	0x20,	%asi
	stxa	%o2,	[%g0 + 0x10] %asi
	add	%o7,	0x08FA,	%i1
	nop
	setx	loop_319,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	brgz,a	%i6,	loop_320
	fmuld8ulx16	%f31,	%f3,	%f16

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_319:
	fbl	%fcc2,	loop_321
loop_320:
	edge16n	%g4,	%i0,	%o4
	taddcc	%g2,	%o1,	%l3
	edge32	%i4,	%l1,	%o5
loop_321:
	wr	%g5,	0x0771,	%ccr
	rdpr	%cwp,	%g6
	rd	%softint,	%o3
	wrpr	%l0,	%g1,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x1DE, 	%hsys_tick_cmpr
	wrpr	%g3,	0x075F,	%pil
	wrpr	%i3,	0x015F,	%pil
	fcmpne16	%f28,	%f8,	%i2
	wr	%o0,	0x109D,	%pic
	tgu	%xcc,	0x5
	movrne	%l2,	%l5,	%i5
	wr	%g0,	0x19,	%asi
	stha	%o2,	[%l7 + 0x28] %asi
	tge	%icc,	0x3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x674, 	%hsys_tick_cmpr
	tg	%icc,	0x1
	udivcc	%i1,	0x003E,	%l6
	wrpr	%g7,	%i6,	%tick
	rdpr	%tba,	%g4
	taddcctv	%l4,	0x03C5,	%i0
	bleu,pn	%icc,	loop_322
	smulcc	%g2,	0x1997,	%o1
	wr	%g0,	0x04,	%asi
	ldswa	[%l7 + 0x34] %asi,	%o4
loop_322:
	udivx	%l3,	0x0780,	%l1
	rd	%y,	%o5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x0D7, 	%hsys_tick_cmpr
	sll	%i4,	0x16,	%g6
	std	%l0,	[%l7 + 0x40]
	fmovsge	%icc,	%f9,	%f2
	srlx	%o3,	0x16,	%g1
	rdpr	%tba,	%o6
	fcmpne16	%f6,	%f22,	%i7
	fornot2	%f24,	%f4,	%f10
	umul	%g3,	%i3,	%i2
	rdhpr	%htba,	%l2
	fbul,a	%fcc0,	loop_323
	membar	0x50
	set	0x34, %g4
	swapa	[%l7 + %g4] 0x19,	%l5
loop_323:
	tvc	%xcc,	0x1
	sll	%i5,	0x19,	%o2
	rdpr	%tba,	%o0
	udivx	%o7,	0x1885,	%l6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x80E, 	%hsys_tick_cmpr
	fbug	%fcc3,	loop_324
	wr	%g7,	%l4,	%pic
	wrpr	%i0,	0x11EF,	%pil
	rd	%ccr,	%g4
loop_324:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	add	%l3,	%l1,	%o5
	andncc	%o1,	%i4,	%g5
	andcc	%g6,	%l0,	%o3
	wr 	%g0, 	0x4, 	%fprs
	sll	%i7,	0x14,	%i3
	edge32	%i2,	%g3,	%l2
	wrpr	%l5,	0x11A3,	%pil
	wrpr	%o2,	%o7,	%cwp
	rdpr	%tl,	%o0
	rdhpr	%htba,	%i1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	orcc	%l4,	0x1E09,	%i6
	fands	%f15,	%f4,	%f11

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x0C2, 	%hsys_tick_cmpr
	edge8ln	%l3,	%g2,	%l1
	rdpr	%cansave,	%o5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	orn	%g5,	%o1,	%l0
	nop
	setx	loop_325,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	rdpr	%tl,	%g6
	fcmps	%fcc0,	%f18,	%f24
	rd	%sys_tick_cmpr,	%o6
loop_325:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	orcc	%i3,	%i2,	%g1
	mova	%xcc,	%g3,	%l2
	subcc	%l5,	%i5,	%o7
	edge8l	%o2,	%o0,	%l6
	rd	%pc,	%i1
	tsubcc	%l4,	%g7,	%i0
	bneg,a,pn	%xcc,	loop_326
	rdpr	%canrestore,	%i6
	rd	%fprs,	%o4
	fmovscc	%xcc,	%f9,	%f30
loop_326:
	edge8	%g4,	%l3,	%l1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%i4,	%g5,	%pic

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%o1,	%g6,	%y
	rdhpr	%htba,	%l0
	sdiv	%o3,	0x1D3A,	%o6
	wrpr	%i7,	0x04B1,	%cwp
	wrpr	%i3,	%g1,	%tick
	wrpr	%g3,	%l2,	%tick
	fmul8x16	%f25,	%f22,	%f28
	fmovdn	%xcc,	%f22,	%f22
	brgz	%l5,	loop_327
	ldub	[%l7 + 0x73],	%i5
	tge	%xcc,	0x7
	edge16	%i2,	%o7,	%o2
loop_327:
	wrpr	%o0,	0x042C,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xE9B, 	%sys_tick_cmpr
	wr	%l6,	%i0,	%set_softint
	sllx	%g7,	0x05,	%i6
	tle	%icc,	0x6
	wr	%o4,	0x1ED9,	%set_softint
	movrgz	%l3,	0x1F8,	%g4
	tsubcctv	%l1,	%o5,	%i4
	smul	%g5,	0x0D21,	%g2
	wrpr	%o1,	%g6,	%cwp
	rdpr	%cwp,	%o3
	wr	%g0,	0x2f,	%asi
	stxa	%o6,	[%l7 + 0x20] %asi
	membar	#Sync
	rdpr	%tba,	%l0
	rdpr	%gl,	%i3
	tl	%icc,	0x6
	rd	%tick_cmpr,	%g1
	sra	%i7,	%l2,	%l5
	bpos,a	loop_328
	fmovdge	%xcc,	%f22,	%f6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fbug,a	%fcc1,	loop_329
loop_328:
	rdhpr	%hintp,	%o7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x005, 	%hsys_tick_cmpr
	rd	%ccr,	%o0
loop_329:
	udiv	%l4,	0x1F48,	%i1
	fmovdpos	%xcc,	%f13,	%f16
	movge	%xcc,	%i0,	%g7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	bg	%xcc,	loop_330
	fsrc2	%f10,	%f24
	edge16n	%l6,	%l3,	%o4
	rdhpr	%hpstate,	%g4
loop_330:
	rdhpr	%hintp,	%l1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%hintp,	%g6
	fmovrdgz	%i4,	%f10,	%f30
	wr	%g0,	0x0c,	%asi
	swapa	[%l7 + 0x10] %asi,	%o3
	fsrc2	%f20,	%f12
	fbg,a	%fcc3,	loop_331
	wr	%o6,	%i3,	%set_softint
	rdhpr	%hsys_tick_cmpr,	%l0
	fpsub32	%f10,	%f10,	%f16
loop_331:
	wr	%i7,	%g1,	%y
	edge16l	%l2,	%l5,	%g3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	fnors	%f20,	%f20,	%f26
	brz	%o7,	loop_332
	fsrc1s	%f17,	%f12
	wrpr	%i2,	%o2,	%pil
	rdhpr	%hintp,	%l4
loop_332:
	or	%o0,	0x0F14,	%i1
	edge8ln	%i0,	%g7,	%l6
	fcmps	%fcc1,	%f5,	%f21
	xnor	%i6,	%l3,	%o4
	brz	%l1,	loop_333
	edge32l	%o5,	%g5,	%g4
	rdhpr	%hsys_tick_cmpr,	%o1
	wr	%g6,	0x117D,	%softint
loop_333:
	nop
	add	%l7,	0x08,	%l6
	wr	%g0,	0x10,	%asi
	casa	[%l6] 0x10,	%i4,	%o3
	nop
	setx loop_334, %l0, %l1
	jmpl %l1, %g2
	movrgz	%i3,	%o6,	%i7
	sub	%l0,	%g1,	%l5
	tvs	%xcc,	0x0
loop_334:
	xnorcc	%l2,	0x044D,	%i5
	tpos	%xcc,	0x0
	orn	%g3,	%i2,	%o2
	rd	%tick_cmpr,	%l4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	addc	%o0,	0x065C,	%i0
	rdhpr	%hintp,	%g7
	wr	%i6,	%l3,	%softint
	movg	%icc,	%l6,	%l1
	rd	%ccr,	%o4
	fcmpgt16	%f26,	%f0,	%g5
	brgez,a	%g4,	loop_335
	rdpr	%gl,	%o1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x92E, 	%sys_tick_cmpr
	rdhpr	%hsys_tick_cmpr,	%i4
loop_335:
	wrpr	%o5,	%o3,	%tick
	wr	%g0,	0x18,	%asi
	ldsba	[%l7 + 0x0B] %asi,	%i3
	movrgz	%g2,	%o6,	%i7
	fxors	%f1,	%f3,	%f5
	rd	%y,	%l0
	st	%f28,	[%l7 + 0x64]
	rdpr	%tl,	%l5
	tvc	%icc,	0x5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xF56, 	%hsys_tick_cmpr
	wrpr	%i5,	%g3,	%tick
	rdhpr	%htba,	%g1
	wrpr	%i2,	%l4,	%tick
	rdpr	%cleanwin,	%o7
	movn	%icc,	%o2,	%i1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	bvc,a	loop_336
	rdhpr	%hsys_tick_cmpr,	%g7
	wr	%l3,	%l6,	%pic
	rdpr	%cwp,	%i6
loop_336:
	bvc,a	loop_337
	rdpr	%otherwin,	%l1
	tgu	%icc,	0x0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_337:
	sir	0x08DC
	edge8	%g5,	%o1,	%g6
	andcc	%g4,	%i4,	%o5
	wr	%o3,	%i3,	%softint
	wr 	%g0, 	0x4, 	%fprs
	nop
	setx	loop_338,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	tgu	%xcc,	0x6
	rdhpr	%hsys_tick_cmpr,	%l0
	ldsb	[%l7 + 0x48],	%o6
loop_338:
	fmovdneg	%xcc,	%f11,	%f28
	fsrc2	%f12,	%f28
	fmovscc	%xcc,	%f10,	%f9

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	subcc	%i5,	%g3,	%i2
	fand	%f8,	%f12,	%f8
	wr	%l4,	0x05B5,	%set_softint

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xDAB, 	%hsys_tick_cmpr
	wrpr	%g1,	%i1,	%pil
	rd	%y,	%i0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xDA3, 	%hsys_tick_cmpr
	wr	%o0,	0x0AE0,	%clear_softint
	rdpr	%canrestore,	%l3
	rdpr	%cwp,	%l6
	wrpr	%l1,	%o4,	%tick
	sub	%i6,	%o1,	%g6
	bge,a,pn	%xcc,	loop_339
	orn	%g5,	%g4,	%i4
	std	%o2,	[%l7 + 0x40]
	wrpr	%o5,	%g2,	%cwp
loop_339:
	rd	%ccr,	%i7
	umul	%l0,	0x11F4,	%o6
	wrpr	%l2,	%l5,	%pil
	rd	%pc,	%i3
	wr	%i5,	%i2,	%clear_softint
	bleu,pn	%xcc,	loop_340
	addcc	%l4,	%g3,	%o2
	wrpr	%o7,	0x0D2D,	%cwp
	rdpr	%cleanwin,	%i1
loop_340:
	rdpr	%tl,	%g1
	rd	%tick_cmpr,	%g7
	rdpr	%cansave,	%o0
	wr	%l3,	0x1E0F,	%y
	edge16	%l6,	%l1,	%i0
	wrpr	%o4,	0x0ED6,	%cwp
	edge32ln	%o1,	%i6,	%g6
	rdhpr	%hsys_tick_cmpr,	%g5
	rdhpr	%htba,	%o3
	rdhpr	%hsys_tick_cmpr,	%o5
	wrpr	%g2,	0x07E6,	%cwp
	wr 	%g0, 	0x5, 	%fprs
	rdpr	%cansave,	%l2
	bshuffle	%f8,	%f24,	%f8
	std	%o6,	[%l7 + 0x68]
	fpsub16s	%f14,	%f5,	%f3
	wr	%i3,	%i5,	%clear_softint
	sra	%i2,	0x01,	%l5
	rdhpr	%hintp,	%g3
	xorcc	%o2,	0x02D1,	%l4
	fcmpd	%fcc3,	%f16,	%f28
	rdpr	%tba,	%i1
	wr	%o7,	0x05EA,	%set_softint
	wrpr	%g1,	%o0,	%cwp
	rd	%fprs,	%g7
	rd	%tick_cmpr,	%l3
	rdhpr	%hintp,	%l6
	rdpr	%wstate,	%l1
	rdhpr	%hintp,	%o4
	orn	%o1,	%i0,	%i6
	brlez,a	%g6,	loop_341
	sub	%g5,	%g4,	%o3
	set	0x61, %i3
	ldstuba	[%l7 + %i3] 0x10,	%i4
loop_341:
	bgu,a	%icc,	loop_342
	wr	%g2,	%i7,	%y
	wr	%o5,	0x1D96,	%y
	rd	%pc,	%l2
loop_342:
	rdpr	%tba,	%l0
	rdpr	%gl,	%o6
	fbuge,a	%fcc2,	loop_343
	popc	%i5,	%i2
	fpmerge	%f4,	%f21,	%f20
	fcmpgt16	%f2,	%f0,	%i3
loop_343:
	rdhpr	%hintp,	%l5
	bgu,pt	%xcc,	loop_344
	fone	%f28
	wrpr	%o2,	%g3,	%tick
	fmovrdlz	%i1,	%f14,	%f8
loop_344:
	rdhpr	%hsys_tick_cmpr,	%o7
	wrpr	%l4,	0x09CA,	%cwp
	fmovrslz	%o0,	%f18,	%f1
	nop
	setx	loop_345,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	umulcc	%l3,	0x1D8F,	%g7
	rdhpr	%hpstate,	%l1
	ldd	[%l7 + 0x50],	%o4
loop_345:
	alignaddrl	%l6,	%o1,	%i6
	bvc,pn	%xcc,	loop_346
	swap	[%l7 + 0x74],	%g6
	wrpr	%i0,	%g4,	%pil
	wr	%g5,	0x1467,	%set_softint
loop_346:
	nop
	wr	%g0,	0x81,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	rdpr	%tl,	%i4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xCA5, 	%tick_cmpr
	wrpr	%g2,	%o5,	%pil
	rd	%tick_cmpr,	%i7
	rdpr	%otherwin,	%l0
	wrpr	%l2,	%i5,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x154, 	%hsys_tick_cmpr
	edge32ln	%o6,	%l5,	%o2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xF4F, 	%hsys_tick_cmpr
	rd	%pc,	%g3
	wrpr	%o7,	0x04DA,	%cwp
	rdpr	%otherwin,	%i1
	sub	%o0,	%g1,	%l4
	wrpr	%g7,	%l3,	%pil
	smul	%o4,	0x1919,	%l1
	rdpr	%canrestore,	%o1
	fnors	%f25,	%f0,	%f5
	tpos	%icc,	0x5
	rd	%sys_tick_cmpr,	%i6
	tvc	%xcc,	0x1
	array8	%l6,	%i0,	%g4
	bg,pt	%xcc,	loop_347
	rdhpr	%hintp,	%g5
	rd	%fprs,	%g6
	movgu	%icc,	%i4,	%g2
loop_347:
	rd	%asi,	%o5
	rd	%tick_cmpr,	%o3
	wr	%i7,	0x0D25,	%ccr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	tvs	%xcc,	0x4
	rdhpr	%hintp,	%i2
	fmovsa	%xcc,	%f23,	%f29
	taddcc	%i5,	0x155E,	%l5
	movgu	%icc,	%o6,	%o2
	wr	%g3,	0x1FD1,	%ccr
	rdhpr	%hpstate,	%i3
	wr	%g0,	0x88,	%asi
	lduwa	[%l7 + 0x30] %asi,	%o7
	smul	%i1,	%g1,	%o0
	fmovrsne	%g7,	%f7,	%f5
	rdpr	%cansave,	%l4
	rdpr	%cansave,	%o4
	rdpr	%pil,	%l3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fmovdleu	%icc,	%f20,	%f25

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xE89, 	%hsys_tick_cmpr
	rdpr	%pil,	%i0
	tpos	%xcc,	0x3
	movg	%xcc,	%i6,	%g4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x01C, 	%hsys_tick_cmpr
	rdhpr	%hintp,	%g5
	rdpr	%tl,	%g2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x30D, 	%hsys_tick_cmpr
	rd	%fprs,	%o3
	tle	%icc,	0x5
	wr	%i7,	%l2,	%sys_tick
	wrpr	%l0,	0x00B3,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	std	%f16,	[%l7 + 0x20]

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	sir	0x05FD
	movre	%o6,	0x12E,	%i4
	set	0x48, %o4
	sta	%f6,	[%l7 + %o4] 0x88
	wr	%o2,	%i3,	%ccr
	array32	%o7,	%i1,	%g3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%g7,	0x0E8E,	%set_softint
	fpsub16	%f22,	%f20,	%f30
	wr	%g1,	%o4,	%softint
	fbn,a	%fcc0,	loop_348
	srax	%l3,	0x17,	%l4
	ta	%icc,	0x2
	tne	%icc,	0x0
loop_348:
	rd	%y,	%o1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	membar	#Sync
	set	0x40, %i2
	ldda	[%l7 + %i2] 0x1f,	%f16
	movge	%xcc,	%l6,	%g4
	wrpr	%i6,	%g6,	%cwp
	udivcc	%g2,	0x1AC9,	%i7
	rdhpr	%htba,	%l2
	sethi	0x1E0D,	%o3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xBCE, 	%hsys_tick_cmpr
	sll	%l5,	%i5,	%o6
	fbul,a	%fcc2,	loop_349
	tpos	%xcc,	0x5
	rdpr	%cansave,	%i4
	rdpr	%canrestore,	%i3
loop_349:
	fsrc1s	%f10,	%f7
	rdpr	%tba,	%o2
	wr	%o7,	0x02D7,	%y
	wrpr	%i1,	%o0,	%pil
	wr	%g7,	%g1,	%y
	rd	%tick_cmpr,	%o4
	rd	%tick_cmpr,	%l3
	tcs	%xcc,	0x7
	udivx	%l4,	0x112C,	%o1
	fmovrslz	%g3,	%f3,	%f11
	rd	%y,	%i0
	wrpr	%l6,	%l1,	%cwp
	rdhpr	%htba,	%i6
	fmovsn	%icc,	%f27,	%f26
	rdhpr	%hpstate,	%g4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xA65, 	%sys_tick_cmpr
	rdpr	%wstate,	%g2
	rdhpr	%hpstate,	%i7
	rdpr	%cleanwin,	%o5
	wrpr	%l2,	%i2,	%tick
	popc	%o3,	%l0
	edge16ln	%l5,	%i5,	%i4
	tvs	%icc,	0x6
	mova	%xcc,	%i3,	%o2
	rd	%fprs,	%o6
	andcc	%o7,	%o0,	%g7
	rdhpr	%hsys_tick_cmpr,	%g1
	rdhpr	%htba,	%i1
	rdpr	%tba,	%l3
	tcs	%xcc,	0x0
	sdivx	%o4,	0x19C7,	%o1
	rdhpr	%htba,	%g3
	wrpr	%l4,	%i0,	%cwp
	fnands	%f5,	%f8,	%f0
	rd	%fprs,	%l6
	fmovdle	%icc,	%f15,	%f22
	wrpr	%i6,	%g4,	%pil
	rdhpr	%hintp,	%l1
	rdhpr	%hsys_tick_cmpr,	%g6
	wr	%g0,	0x89,	%asi
	lda	[%l7 + 0x14] %asi,	%f8
	wrpr	%g5,	0x1C00,	%tick
	rd	%ccr,	%i7
	bg	loop_350
	rdhpr	%hsys_tick_cmpr,	%o5
	wr 	%g0, 	0x6, 	%fprs
	xor	%o3,	0x1B86,	%l0
loop_350:
	nop
	set	0x7C, %l1
	ldsba	[%l7 + %l1] 0x18,	%l5
	rdhpr	%hpstate,	%i5
	tpos	%icc,	0x4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fbge	%fcc2,	loop_351
	sdivcc	%i3,	0x0B1C,	%o2
	rdhpr	%hpstate,	%g2
	te	%icc,	0x0
loop_351:
	nop
	setx loop_352, %l0, %l1
	jmpl %l1, %o6
	wrpr	%o0,	0x0892,	%cwp
	fmovdg	%icc,	%f2,	%f3
	ble,a,pt	%icc,	loop_353
loop_352:
	rdpr	%tba,	%g7
	rd	%sys_tick_cmpr,	%g1
	addccc	%i1,	%l3,	%o7
loop_353:
	fbne	%fcc1,	loop_354
	wr	%o1,	%o4,	%softint

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x3C6, 	%hsys_tick_cmpr
	bg	loop_355
loop_354:
	rdhpr	%hintp,	%l4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x05B, 	%hsys_tick_cmpr
	rdpr	%tba,	%l6
loop_355:
	rdhpr	%hpstate,	%g4
	udivx	%i6,	0x12E2,	%l1
	smul	%g6,	%g5,	%i7
	edge16n	%o5,	%i2,	%o3
	rd	%pc,	%l0
	addccc	%l5,	%i5,	%i4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xFD4, 	%hsys_tick_cmpr
	nop
	setx	loop_356,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movn	%xcc,	%o2,	%g2
	fmuld8sux16	%f1,	%f9,	%f12

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x657, 	%hsys_tick_cmpr
loop_356:
	wrpr	%o6,	%i1,	%cwp
	rdpr	%cleanwin,	%l3
	wrpr	%o7,	0x17CC,	%cwp
	rdhpr	%hsys_tick_cmpr,	%g1
	bvs,pt	%icc,	loop_357
	edge16	%o1,	%g3,	%l4
	wrpr	%o4,	0x1074,	%cwp
	orcc	%l6,	%i0,	%i6
loop_357:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%hpstate,	%g6
	wr	%g5,	%i7,	%ccr
	subccc	%l1,	%o5,	%i2
	nop
	set	0x50, %o7
	std	%f18,	[%l7 + %o7]
	wr	%l0,	0x163A,	%sys_tick
	brnz,a	%l5,	loop_358
	wrpr	%i5,	%i4,	%pil
	wrpr	%i3,	%o3,	%cwp
	smul	%l2,	0x1BBF,	%g2
loop_358:
	bg,pn	%xcc,	loop_359
	rd	%softint,	%o0
	movneg	%xcc,	%g7,	%o6
	stbar
loop_359:
	fmovspos	%xcc,	%f27,	%f19
	wr	%o2,	0x0F16,	%sys_tick
	fands	%f23,	%f4,	%f9
	ble,pt	%xcc,	loop_360
	movneg	%icc,	%i1,	%l3
	wr	%o7,	0x1075,	%clear_softint
	nop
	setx loop_361, %l0, %l1
	jmpl %l1, %o1
loop_360:
	wrpr	%g3,	0x1C30,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%l6,	%l4,	%ccr
loop_361:
	fnot1s	%f3,	%f13
	sethi	0x1A99,	%i0
	wrpr	%i6,	0x14EC,	%tick
	fnot2	%f18,	%f2
	rdpr	%cansave,	%g4
	movleu	%xcc,	%g6,	%i7
	rd	%asi,	%g5
	fmovsa	%xcc,	%f6,	%f31
	rdhpr	%hintp,	%o5
	sdivcc	%i2,	0x093E,	%l1
	wr	%g0,	0x18,	%asi
	swapa	[%l7 + 0x5C] %asi,	%l0
	wrpr	%l5,	%i4,	%tick
	wrpr	%i5,	0x0DA1,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x076, 	%hsys_tick_cmpr
	edge16	%l2,	%g2,	%g7
	movvs	%icc,	%o0,	%o6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xDB6, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%canrestore,	%o1
	movneg	%xcc,	%l3,	%g1
	wrpr	%g3,	0x0BF2,	%cwp
	xnor	%l6,	%o4,	%l4
	edge16ln	%i6,	%g4,	%g6
	rd	%fprs,	%i0
	call	loop_362
	bvc,a	loop_363
	wrpr	%g5,	0x081E,	%tick
	rdpr	%gl,	%o5
loop_362:
	rdpr	%cwp,	%i7
loop_363:
	wr 	%g0, 	0x5, 	%fprs
	wrpr	%l0,	0x1F60,	%pil
	fabsd	%f14,	%f6
	rdpr	%cwp,	%i2
	movcc	%xcc,	%i4,	%l5
	sdiv	%i5,	0x026B,	%i3
	te	%icc,	0x5
	rdpr	%cleanwin,	%o3
	rd	%pc,	%g2
	fmovdl	%xcc,	%f29,	%f21
	rdpr	%tba,	%g7
	wrpr	%o0,	0x0341,	%tick
	rdpr	%otherwin,	%o6
	fblg	%fcc2,	loop_364
	fpsub32s	%f20,	%f28,	%f4
	movne	%xcc,	%i1,	%o2
	movvs	%icc,	%o7,	%o1
loop_364:
	movn	%xcc,	%l3,	%g1
	edge16	%l2,	%l6,	%g3
	fmovdneg	%icc,	%f31,	%f31

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x064, 	%hsys_tick_cmpr
	wrpr	%g4,	%o4,	%pil
	rdhpr	%hsys_tick_cmpr,	%g6
	rd	%pc,	%g5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xDC7, 	%hsys_tick_cmpr
	rdhpr	%htba,	%l1
	rd	%pc,	%i0
	movl	%xcc,	%l0,	%i2
	rdhpr	%htba,	%i4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	edge8	%l5,	%o3,	%i3
	sub	%g2,	0x16EF,	%o0
	wrpr	%g7,	%o6,	%cwp
	movcc	%icc,	%o2,	%i1
	bn,a,pn	%icc,	loop_365
	rd	%fprs,	%o7
	fmovrslez	%o1,	%f14,	%f6
	rd	%asi,	%l3
loop_365:
	fmul8ulx16	%f18,	%f6,	%f10
	tl	%xcc,	0x6
	rd	%ccr,	%g1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%tick_cmpr,	%l2
	tge	%icc,	0x0
	rd	%pc,	%l4
	subccc	%i6,	%g3,	%o4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%g4,	%g5,	%pil
	wrpr	%i7,	0x02FA,	%pil
	wrpr	%o5,	%l1,	%tick
	siam	0x4
	rdhpr	%hpstate,	%l0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xBC4, 	%hsys_tick_cmpr
	wrpr	%i5,	0x178A,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fbg,a	%fcc1,	loop_366
	rdhpr	%htba,	%i2
	orncc	%i3,	%g2,	%o0
	xor	%o3,	%g7,	%o2
loop_366:
	rd	%softint,	%i1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	movleu	%icc,	%o6,	%l3
	fmovrslez	%g1,	%f7,	%f18
	move	%xcc,	%o1,	%l6
	fmul8x16au	%f8,	%f5,	%f26
	andn	%l2,	0x1540,	%l4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	array16	%g3,	%g6,	%g4
	rdpr	%gl,	%g5
	rdhpr	%hpstate,	%o4
	std	%i6,	[%l7 + 0x08]

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%hintp,	%l5
	and	%i5,	%i2,	%i3
	rdpr	%cansave,	%g2
	wrpr	%o0,	%o3,	%tick
	edge32l	%o2,	%i1,	%o7
	rdpr	%gl,	%o6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%otherwin,	%g1
	movge	%xcc,	%o1,	%l2
	fbl	%fcc1,	loop_367
	fbne,a	%fcc0,	loop_368
	fbl,a	%fcc2,	loop_369
	wrpr	%l4,	%l6,	%cwp
loop_367:
	sdiv	%g3,	0x0E7B,	%g6
loop_368:
	rd	%y,	%g4
loop_369:
	wrpr	%g5,	%o4,	%cwp
	sdivx	%i7,	0x0E3A,	%i6
	wrpr	%l0,	0x11C3,	%tick
	rd	%softint,	%l1
	smul	%o5,	0x0F10,	%i0
	rd	%tick_cmpr,	%l5
	or	%i5,	0x00A9,	%i2
	ldsh	[%l7 + 0x0A],	%i3
	wrpr	%g2,	%i4,	%tick
	taddcctv	%o3,	%o2,	%o0
	smul	%i1,	0x1064,	%o6
	stb	%l3,	[%l7 + 0x18]
	umul	%g7,	0x0813,	%g1
	tvs	%xcc,	0x6
	rdpr	%canrestore,	%o7
	rd	%softint,	%l2
	wrpr	%o1,	%l4,	%tick
	wrpr	%l6,	0x0FC4,	%pil
	rd	%y,	%g3
	fmovdg	%xcc,	%f23,	%f16
	fmovrslez	%g4,	%f21,	%f27
	tsubcc	%g6,	%o4,	%g5
	fbne,a	%fcc0,	loop_370
	taddcctv	%i7,	0x180A,	%l0
	popc	%l1,	%o5
	rdpr	%otherwin,	%i0
loop_370:
	rdpr	%otherwin,	%i6
	bshuffle	%f8,	%f6,	%f8
	fmovsne	%xcc,	%f9,	%f26
	fmovdvs	%icc,	%f17,	%f20
	rdhpr	%htba,	%i5
	fmovdvs	%icc,	%f26,	%f11
	fble,a	%fcc3,	loop_371
	mulscc	%i2,	%l5,	%i3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	sdivx	%o2,	0x1241,	%i4
loop_371:
	wrpr	%o0,	%i1,	%cwp
	mulx	%l3,	%g7,	%g1
	movgu	%icc,	%o7,	%o6
	fmovse	%icc,	%f15,	%f24
	addc	%o1,	0x1CEB,	%l2
	rd	%sys_tick_cmpr,	%l6
	ta	%xcc,	0x1
	sll	%g3,	%g4,	%l4
	te	%xcc,	0x1
	wrpr	%g6,	0x138E,	%cwp
	rdpr	%gl,	%g5
	fcmple32	%f28,	%f26,	%i7
	sllx	%o4,	%l0,	%o5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xED0, 	%hsys_tick_cmpr
	wrpr	%i6,	%i5,	%cwp
	rd	%fprs,	%i0
	fmovsge	%icc,	%f20,	%f0
	rdhpr	%hpstate,	%l5
	sra	%i3,	%g2,	%i2
	prefetch	[%l7 + 0x78],	 0x3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x31B, 	%hsys_tick_cmpr
	edge32	%o0,	%i1,	%l3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g7,	%i4,	%sys_tick
	srl	%o7,	%g1,	%o1
	mulscc	%l2,	0x052D,	%l6
	rdpr	%otherwin,	%g3
	sdiv	%g4,	0x0F8D,	%o6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%g0,	0x0c,	%asi
	ldsha	[%l7 + 0x6E] %asi,	%i7
	movg	%icc,	%o4,	%g6
	movne	%xcc,	%l0,	%l1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xDBD, 	%hsys_tick_cmpr
	rd	%y,	%i5
	rdpr	%tl,	%i6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%cansave,	%g2
	alignaddrl	%i0,	%i2,	%o3
	movle	%icc,	%o0,	%i1
	fmovdpos	%xcc,	%f31,	%f1
	umul	%o2,	%g7,	%i4
	wrpr	%o7,	0x014F,	%cwp
	wr	%g1,	%o1,	%softint
	rd	%softint,	%l3
	rdhpr	%hpstate,	%l2
	rdpr	%pil,	%g3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%g0,	0x04,	%asi
	swapa	[%l7 + 0x48] %asi,	%l4
	fandnot1	%f8,	%f18,	%f4
	wrpr	%g5,	0x047F,	%pil
	fmovsa	%xcc,	%f29,	%f17
	wrpr	%o6,	%o4,	%pil
	xorcc	%i7,	%g6,	%l0
	wrpr	%l1,	%i5,	%tick
	rd	%fprs,	%i6
	movgu	%icc,	%l5,	%o5
	wrpr	%i3,	%i0,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x538, 	%hsys_tick_cmpr
	wr	%g0,	0x0c,	%asi
	stba	%i2,	[%l7 + 0x23] %asi
	wr	%o0,	0x0FDD,	%clear_softint
	rdpr	%pil,	%i1
	rdpr	%cansave,	%o2
	rdhpr	%htba,	%g7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xBD3, 	%hsys_tick_cmpr
	rdhpr	%htba,	%o7
	wr	%o3,	%g1,	%ccr
	rdpr	%cwp,	%o1
	and	%l3,	%g3,	%g4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x86D, 	%hsys_tick_cmpr
	rdhpr	%hpstate,	%l6
	addc	%g5,	0x10CC,	%o6
	movre	%o4,	%l4,	%g6
	rd	%pc,	%i7
	fmovdn	%icc,	%f16,	%f10
	fbge	%fcc2,	loop_372
	rdhpr	%hintp,	%l0
	move	%icc,	%i5,	%i6
	wr	%l1,	%l5,	%y
loop_372:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	wrpr	%g2,	%i2,	%tick
	rdpr	%tba,	%o0
	rdpr	%tl,	%i0
	tl	%xcc,	0x2
	wrpr	%i1,	%o2,	%pil
	ldd	[%l7 + 0x70],	%f18

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	fmovda	%xcc,	%f15,	%f14

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fmovrsne	%g1,	%f2,	%f15
	rdpr	%cwp,	%o3
	wrpr	%l3,	0x1D3D,	%cwp
	fble	%fcc2,	loop_373
	xnorcc	%g3,	0x13B1,	%o1
	wrpr	%g4,	%l2,	%tick
	rdpr	%cansave,	%g5
loop_373:
	rdpr	%tl,	%l6
	xor	%o6,	0x1538,	%o4
	rdpr	%cwp,	%l4
	edge8	%i7,	%g6,	%i5
	fmovrdgz	%i6,	%f22,	%f18
	rdpr	%canrestore,	%l0
	rd	%softint,	%l1
	wrpr	%l5,	0x1D59,	%tick
	or	%o5,	%g2,	%i3
	rd	%softint,	%i2
	rdpr	%tl,	%i0
	xnorcc	%i1,	%o0,	%o2
	wrpr	%i4,	%o7,	%pil
	sethi	0x0796,	%g1
	wrpr	%g7,	0x186C,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%g0,	0x89,	%asi
	ldsba	[%l7 + 0x28] %asi,	%g3
	edge32	%l3,	%g4,	%l2
	rdpr	%cleanwin,	%g5
	xnor	%o1,	%l6,	%o4
	fbne,a	%fcc0,	loop_374
	fandnot1	%f6,	%f28,	%f8
	fbe	%fcc1,	loop_375
	tleu	%xcc,	0x1
loop_374:
	wrpr	%o6,	0x04DE,	%tick
	smul	%i7,	%g6,	%l4
loop_375:
	wrpr	%i5,	0x0B6A,	%pil
	wrpr	%l0,	%i6,	%pil
	wrpr	%l5,	0x132F,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x4B5, 	%tick_cmpr
	rd	%ccr,	%g2
	wrpr	%i2,	0x0E40,	%pil
	wr	%i0,	%i1,	%ccr
	rdpr	%cansave,	%i3
	membar	0x5A
	fmovscs	%xcc,	%f11,	%f17
	rdpr	%tl,	%o0
	wr	%g0,	0x88,	%asi
	ldstuba	[%l7 + 0x48] %asi,	%i4
	rdhpr	%htba,	%o2
	std	%f20,	[%l7 + 0x08]
	rdpr	%wstate,	%g1
	rdhpr	%hintp,	%g7
	rd	%ccr,	%o7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x802, 	%sys_tick_cmpr
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x5C] %asi,	%g4
	std	%l2,	[%l7 + 0x58]

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xC1D, 	%hsys_tick_cmpr
	rdpr	%gl,	%l6
	rdhpr	%hpstate,	%g6
	fnot2s	%f10,	%f10
	wrpr	%i7,	0x19FC,	%cwp
	rdhpr	%hintp,	%i5
	rd	%asi,	%i6
	rd	%asi,	%l5
	ldsw	[%l7 + 0x54],	%o5
	array8	%g2,	%l1,	%i2
	bleu,a	%icc,	loop_376
	rd	%fprs,	%i0
	wr	%i1,	%i3,	%y
	add	%l7,	0x30,	%l6
	wr	%g0,	0x19,	%asi
	casxa	[%l6] %asi,	%o0,	%o2
loop_376:
	rd	%sys_tick_cmpr,	%i4
	flush	%l7 + 0x28
	movne	%xcc,	%g7,	%g1
	mova	%icc,	%o7,	%o3
	orcc	%g3,	0x0FD7,	%l3
	rdpr	%cwp,	%g4
	rd	%softint,	%g5
	ta	%xcc,	0x4
	rdhpr	%htba,	%l2
	fabss	%f14,	%f0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xB46, 	%hsys_tick_cmpr
	fmovspos	%icc,	%f6,	%f20
	wrpr	%o6,	%l6,	%pil
	fmovsvc	%icc,	%f24,	%f3
	nop
	set	0x74, %g3
	ldsh	[%l7 + %g3],	%o1
	addccc	%g6,	0x0CE8,	%i7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	flushw
	fmovrdgez	%l4,	%f24,	%f18
	rdhpr	%hpstate,	%i6
	edge8	%l5,	%l0,	%o5
	fxors	%f29,	%f8,	%f13
	rd	%pc,	%g2
	wr	%l1,	%i2,	%y
	stx	%i0,	[%l7 + 0x40]
	wr	%i3,	0x0921,	%clear_softint
	ta	%xcc,	0x1
	rdhpr	%hpstate,	%o0
	rdhpr	%hintp,	%i1
	orn	%i4,	%o2,	%g1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x447, 	%hsys_tick_cmpr
	fpadd32s	%f29,	%f7,	%f29
	edge16	%o3,	%g3,	%g4
	fpsub16	%f14,	%f12,	%f4
	andncc	%g5,	%l2,	%o4
	nop
	setx loop_377, %l0, %l1
	jmpl %l1, %o6
	rdpr	%canrestore,	%l3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	add	%l7,	0x30,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] %asi,	%g6,	%i7
loop_377:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%l4,	0x15A6,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xFD2, 	%tick_cmpr
	fblg	%fcc0,	loop_378
	and	%l0,	%o5,	%l1
	rdpr	%gl,	%g2
	rdhpr	%htba,	%i2
loop_378:
	rdpr	%cansave,	%i0
	rd	%ccr,	%o0
	fbo	%fcc0,	loop_379
	brlz	%i3,	loop_380
	rdhpr	%hsys_tick_cmpr,	%i4
	rdhpr	%htba,	%o2
loop_379:
	nop
	set	0x12, %l0
	stha	%g1,	[%l7 + %l0] 0x04
loop_380:
	orn	%g7,	%o7,	%i1
	orncc	%g3,	%o3,	%g5
	smulcc	%g4,	%o4,	%l2
	wr	%o6,	%l3,	%clear_softint
	rd	%sys_tick_cmpr,	%o1
	wrpr	%l6,	0x186A,	%pil
	edge32n	%g6,	%i7,	%i5
	wr 	%g0, 	0x4, 	%fprs

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x322, 	%hsys_tick_cmpr
	wrpr	%o5,	%l5,	%pil
	rdhpr	%hsys_tick_cmpr,	%l1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x6F1, 	%hsys_tick_cmpr
	rdpr	%pil,	%o0
	move	%xcc,	%i3,	%i4
	rd	%tick_cmpr,	%o2
	movcc	%xcc,	%i0,	%g1
	rdhpr	%hintp,	%o7
	movre	%g7,	0x189,	%g3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	wr 	%g0, 	0x6, 	%fprs
	wr	%o4,	0x09C7,	%softint
	rd	%softint,	%o3
	movrlez	%o6,	%l2,	%o1
	rdhpr	%hintp,	%l6
	rd	%sys_tick_cmpr,	%l3
	wrpr	%i7,	0x1750,	%cwp
	fmovrdlez	%i5,	%f0,	%f8
	rd	%pc,	%g6
	subc	%i6,	%l4,	%o5
	wr	%l5,	0x19FD,	%softint
	rdpr	%cleanwin,	%l0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x365, 	%sys_tick_cmpr
	edge16n	%g2,	%i4,	%i3
	rdpr	%tba,	%i0
	rd	%y,	%o2
	rdpr	%tba,	%g1
	rdpr	%canrestore,	%g7
	wr	%o7,	0x0E73,	%sys_tick
	fabsd	%f24,	%f14
	rdhpr	%hintp,	%g3
	rdpr	%cleanwin,	%i1
	rdhpr	%hpstate,	%g5
	swap	[%l7 + 0x58],	%g4
	smulcc	%o3,	%o4,	%l2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	tvs	%xcc,	0x6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%softint,	%l6
	wrpr	%i5,	%i7,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	andn	%o5,	0x1AF8,	%l4
	subcc	%l0,	0x1FBB,	%l5
	wrpr	%i2,	%l1,	%cwp
	srax	%o0,	%i4,	%i3
	tle	%xcc,	0x1
	movvs	%icc,	%g2,	%i0
	rdpr	%wstate,	%g1
	set	0x6C, %o2
	swapa	[%l7 + %o2] 0x0c,	%g7
	wr	%o2,	%o7,	%pic
	rdhpr	%hintp,	%g3
	rdpr	%cansave,	%g5
	wr	%i1,	%o3,	%ccr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%o6,	0x07CA,	%y
	tleu	%icc,	0x5
	udivx	%l2,	0x0ACF,	%l3
	rdpr	%tba,	%o1
	rdhpr	%htba,	%i5
	rdhpr	%hintp,	%l6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xAA0, 	%hsys_tick_cmpr
	tne	%icc,	0x3
	popc	%o5,	%i6
	move	%xcc,	%l4,	%l5
	fcmpgt16	%f22,	%f26,	%l0
	fnand	%f8,	%f4,	%f14
	rdhpr	%hsys_tick_cmpr,	%i2
	nop
	set	0x6C, %i1
	prefetch	[%l7 + %i1],	 0x0
	fpack16	%f4,	%f15
	movl	%icc,	%l1,	%o0
	wr	%i3,	0x1D43,	%clear_softint
	add	%l7,	0x48,	%l6
	wr	%g0,	0x18,	%asi
	casa	[%l6] 0x18,	%g2,	%i4
	wr 	%g0, 	0x7, 	%fprs

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%o7,	%g5,	%softint
	rdpr	%cwp,	%g3
	rdhpr	%htba,	%i1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x86D, 	%hsys_tick_cmpr
	srax	%o6,	%l2,	%g4
	xor	%l3,	%o1,	%l6
	rdpr	%cleanwin,	%g6
	wrpr	%i7,	%i5,	%tick
	edge32ln	%i6,	%o5,	%l5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	rdpr	%gl,	%l4
	wrpr	%l0,	%l1,	%cwp
	rdhpr	%hintp,	%i2
	fmovs	%f27,	%f17

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x663, 	%hsys_tick_cmpr
	tvs	%xcc,	0x5
	ble,a,pt	%xcc,	loop_381
	brgz	%g2,	loop_382
	edge8	%i4,	%i0,	%o0
	edge8ln	%o2,	%g1,	%g7
loop_381:
	wrpr	%g5,	%o7,	%cwp
loop_382:
	ldsw	[%l7 + 0x3C],	%i1
	move	%icc,	%o3,	%g3
	rdhpr	%hpstate,	%o6
	wrpr	%l2,	%g4,	%tick
	rdpr	%cleanwin,	%l3
	brgez,a	%o1,	loop_383
	bcs,a,pt	%xcc,	loop_384
	rdpr	%canrestore,	%o4
	wrpr	%g6,	0x1B7D,	%tick
loop_383:
	movpos	%icc,	%l6,	%i5
loop_384:
	wr	%i6,	%i7,	%set_softint

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%pc,	%l4
	fmul8x16al	%f23,	%f5,	%f14
	wrpr	%l5,	%l0,	%pil
	rd	%y,	%i2
	tle	%icc,	0x3
	rd	%asi,	%l1
	movrlz	%i3,	0x0C9,	%i4
	bleu	%icc,	loop_385
	fmovdvs	%icc,	%f22,	%f31
	addcc	%i0,	%g2,	%o0
	wr	%o2,	0x1AB6,	%softint
loop_385:
	fnand	%f6,	%f20,	%f14
	rdpr	%otherwin,	%g7
	tleu	%xcc,	0x3
	addcc	%i1,	0x123B,	%o3
	wrpr	%o7,	0x18D2,	%tick
	rd	%softint,	%o6
	rd	%ccr,	%l2
	rdhpr	%hintp,	%g4
	rd	%fprs,	%l3
	wrpr	%o1,	%o4,	%tick
	rdhpr	%hpstate,	%g3
	rdpr	%cansave,	%g6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	array8	%i7,	%i6,	%l4
	rdhpr	%htba,	%l5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x150, 	%hsys_tick_cmpr
	rdhpr	%hpstate,	%l1
	fmovsl	%xcc,	%f26,	%f2
	wr	%i3,	0x0CFA,	%sys_tick
	set	0x68, %o0
	stda	%i4,	[%l7 + %o0] 0x15
	rdhpr	%hsys_tick_cmpr,	%i0
	wr	%i2,	%g2,	%set_softint
	rdhpr	%htba,	%o2
	rdhpr	%hintp,	%g7
	wr	%g1,	0x049C,	%ccr
	flushw
	rdhpr	%hintp,	%g5
	sra	%o0,	0x0B,	%i1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%wstate,	%l2
	rdpr	%tl,	%g4
	rdhpr	%hpstate,	%o6
	xor	%l3,	0x1332,	%o4
	rdpr	%pil,	%g3
	rd	%ccr,	%g6
	wr	%o1,	0x0A86,	%y
	tleu	%icc,	0x3
	wrpr	%l6,	0x1AB5,	%tick
	movneg	%xcc,	%i5,	%i7
	rd	%sys_tick_cmpr,	%l4
	wrpr	%i6,	0x118E,	%cwp
	wr	%o5,	%l5,	%sys_tick
	stbar
	rdhpr	%htba,	%l0
	movgu	%xcc,	%l1,	%i3
	movn	%icc,	%i0,	%i2
	rdhpr	%htba,	%g2
	wr	%i4,	%g7,	%pic

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	rd	%tick_cmpr,	%g5
	wr	%o0,	%g1,	%pic
	wrpr	%o7,	0x0A62,	%pil
	rd	%sys_tick_cmpr,	%i1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%o3,	%l3,	%softint
	wr	%o4,	%o6,	%clear_softint
	add	%l7,	0x58,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%g3
	casa	[%l6] 0x89,	%g3,	%g6
	fmovsg	%icc,	%f26,	%f3
	rdhpr	%hsys_tick_cmpr,	%o1
	wrpr	%i5,	%l6,	%pil
	addccc	%l4,	0x0FFF,	%i6
	rd	%tick_cmpr,	%o5
	wrpr	%l5,	%l0,	%cwp
	movvc	%xcc,	%i7,	%l1
	lduw	[%l7 + 0x08],	%i0
	rd	%sys_tick_cmpr,	%i2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xFD2, 	%hsys_tick_cmpr
	wrpr	%g7,	%o2,	%tick
	array8	%i3,	%o0,	%g5
	fnot1	%f18,	%f30
	mulx	%g1,	0x0DFF,	%o7
	rd	%y,	%l2
	rdpr	%canrestore,	%g4
	fmovsvs	%xcc,	%f29,	%f29
	set	0x40, %g5
	stda	%f0,	[%l7 + %g5] 0xf0
	membar	#Sync

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fmovrdgz	%l3,	%f20,	%f2
	wr	%o4,	%o6,	%pic
	rd	%asi,	%g3
	rdhpr	%hpstate,	%o1
	rdpr	%cansave,	%i5
	rdpr	%tl,	%l6
	movgu	%xcc,	%g6,	%l4
	brlez,a	%o5,	loop_386
	nop
	setx	loop_387,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fmovscs	%xcc,	%f22,	%f23
	fxnor	%f20,	%f8,	%f30
loop_386:
	rd	%asi,	%i6
loop_387:
	rdhpr	%hintp,	%l0
	wr	%l5,	%l1,	%sys_tick
	wr	%i7,	0x18AB,	%softint
	rdpr	%cansave,	%i2
	rd	%softint,	%g2
	array16	%i0,	%i4,	%g7
	rdhpr	%htba,	%i3
	std	%f30,	[%l7 + 0x40]
	fmovdn	%icc,	%f14,	%f25
	rdpr	%cansave,	%o2
	subccc	%g5,	0x1872,	%g1
	tcs	%icc,	0x2
	wrpr	%o7,	%o0,	%pil
	rdhpr	%hintp,	%l2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	ldub	[%l7 + 0x71],	%g4
	rdpr	%pil,	%l3
	fmovdgu	%icc,	%f30,	%f22
	wrpr	%i1,	0x0F3F,	%pil
	wrpr	%o6,	0x0A00,	%pil
	udiv	%o4,	0x0979,	%o1
	stx	%i5,	[%l7 + 0x20]
	rdhpr	%hintp,	%l6
	rd	%pc,	%g3
	fmovrslz	%g6,	%f12,	%f14
	edge16l	%o5,	%i6,	%l4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x7B0, 	%hsys_tick_cmpr
	wr	%g0,	0x11,	%asi
	lduba	[%l7 + 0x2A] %asi,	%l0
	movne	%xcc,	%i7,	%i2
	edge8ln	%i0,	%i4,	%g7
	wr	%i3,	0x1E62,	%softint
	fnegd	%f2,	%f8
	xnor	%g2,	0x030C,	%o2
	wr	%g5,	0x0FCF,	%softint
	wr	%g1,	%o7,	%ccr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x876, 	%hsys_tick_cmpr
	nop
	set	0x78, %g7
	stw	%g4,	[%l7 + %g7]
	wrpr	%o3,	%i1,	%tick
	taddcctv	%o6,	%o4,	%o1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x058, 	%tick_cmpr
	edge32n	%l6,	%g6,	%g3
	fmovsg	%xcc,	%f24,	%f29

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%gl,	%l4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%sys_tick_cmpr,	%l1
	rdpr	%canrestore,	%l0
	rdhpr	%hsys_tick_cmpr,	%o5
	movn	%xcc,	%i7,	%i2
	rd	%softint,	%i4
	wr	%i0,	%i3,	%set_softint

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x2C2, 	%hsys_tick_cmpr
	rdpr	%wstate,	%g7
	rdpr	%tl,	%o2
	rdhpr	%hintp,	%g1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	st	%f7,	[%l7 + 0x68]

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xAE0, 	%hsys_tick_cmpr
	fxnors	%f20,	%f5,	%f23
	fnot2s	%f16,	%f22
	fmul8ulx16	%f6,	%f18,	%f30
	wrpr	%g4,	0x00BD,	%cwp
	fmovdg	%icc,	%f14,	%f20
	umul	%l2,	%o3,	%o6
	nop
	set	0x78, %i0
	ldsw	[%l7 + %i0],	%i1
	fmovrdlz	%o1,	%f2,	%f2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x3FD, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x797, 	%hsys_tick_cmpr
	fbo,a	%fcc3,	loop_388
	taddcctv	%l6,	%g6,	%g3
	rd	%ccr,	%i6
	wr	%l4,	%l5,	%softint
loop_388:
	rd	%ccr,	%l1
	rdhpr	%hpstate,	%l0
	be,a,pn	%xcc,	loop_389
	rdpr	%pil,	%i7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xF3B, 	%hsys_tick_cmpr
	fornot2s	%f10,	%f20,	%f24
loop_389:
	wr	%i4,	0x1CE5,	%clear_softint
	sth	%i0,	[%l7 + 0x18]
	rd	%y,	%i3
	wrpr	%o5,	%g7,	%pil
	fsrc1s	%f10,	%f13
	srax	%g2,	0x0C,	%o2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x734, 	%hsys_tick_cmpr
	umulcc	%g1,	%g4,	%o0
	fpadd16	%f8,	%f10,	%f2
	wrpr	%l2,	0x0987,	%cwp
	wrpr	%o3,	%i1,	%cwp
	movcs	%icc,	%o1,	%o6
	rdhpr	%hsys_tick_cmpr,	%i5
	wrpr	%o4,	0x1F32,	%pil
	rdhpr	%hsys_tick_cmpr,	%l6
	wr	%l3,	0x19B6,	%ccr
	rd	%y,	%g3
	wr	%g0,	0x89,	%asi
	sta	%f24,	[%l7 + 0x10] %asi
	addc	%g6,	0x127A,	%l4
	faligndata	%f22,	%f14,	%f10
	rd	%asi,	%i6
	rd	%softint,	%l5
	wr 	%g0, 	0x7, 	%fprs
	movne	%xcc,	%l0,	%i2
	sra	%i7,	%i4,	%i0
	edge16n	%i3,	%o5,	%g7
	edge8	%o2,	%g2,	%g5
	umulcc	%g1,	0x19D7,	%o7
	movleu	%icc,	%g4,	%l2
	wrpr	%o3,	0x0AD8,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x61A, 	%tick_cmpr
	sdivcc	%o0,	0x1D38,	%o6
	rdhpr	%hpstate,	%i5
	rdhpr	%hsys_tick_cmpr,	%o4
	faligndata	%f2,	%f16,	%f20
	rd	%softint,	%l6
	add	%l7,	0x44,	%l6
	wr	%g0,	0x18,	%asi
	casa	[%l6] 0x18,	%o1,	%l3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%otherwin,	%l4
	rdpr	%pil,	%l5
	sdiv	%i6,	0x1C77,	%l0
	rdhpr	%hpstate,	%i2
	set	0x70, %l4
	stxa	%l1,	[%l7 + %l4] 0x18
	bne,pn	%icc,	loop_390
	rd	%pc,	%i7
	rdhpr	%hsys_tick_cmpr,	%i0
	tge	%icc,	0x4
loop_390:
	fornot2	%f6,	%f6,	%f18
	rdpr	%pil,	%i3
	alignaddr	%i4,	%o5,	%g7
	wrpr	%o2,	0x1674,	%cwp
	wr 	%g0, 	0x5, 	%fprs
	fmovrdgz	%g1,	%f6,	%f16
	movn	%icc,	%o7,	%g4
	rdpr	%canrestore,	%l2
	sll	%o3,	0x1D,	%g2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	movne	%xcc,	%l6,	%l3
	edge16l	%g6,	%l4,	%g3
	fmovde	%icc,	%f5,	%f26
	rdhpr	%htba,	%l5
	rd	%sys_tick_cmpr,	%i6
	tvs	%xcc,	0x4
	andcc	%i2,	%l0,	%i7
	rdhpr	%hpstate,	%l1
	movl	%xcc,	%i3,	%i0
	wrpr	%i4,	0x0086,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x001, 	%hsys_tick_cmpr
	wrpr	%o2,	0x05D3,	%pil
	wr	%g0,	0x19,	%asi
	prefetcha	[%l7 + 0x58] %asi,	 0x3
	rd	%softint,	%o5
	fones	%f1
	fmovdl	%xcc,	%f5,	%f30

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xC8A, 	%hsys_tick_cmpr
	and	%o7,	0x0679,	%g4
	wrpr	%o3,	%l2,	%tick
	fmovrsgez	%g2,	%f20,	%f9
	fsrc2s	%f24,	%f28
	tge	%xcc,	0x0
	wrpr	%o0,	0x1051,	%pil
	rd	%pc,	%o6
	movrne	%i1,	0x22B,	%i5
	ldsw	[%l7 + 0x1C],	%o1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xD55, 	%hsys_tick_cmpr
	tvs	%xcc,	0x0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x12E, 	%hsys_tick_cmpr
	fmovdvc	%icc,	%f2,	%f26
	fmovsge	%icc,	%f13,	%f1
	edge8l	%l4,	%g3,	%o4
	orn	%l5,	0x081E,	%i6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	ta	%icc,	0x5
	nop
	set	0x58, %l5
	ldd	[%l7 + %l5],	%f10
	rdhpr	%hintp,	%i7
	fmovde	%icc,	%f23,	%f20
	wr	%i3,	0x068F,	%softint
	wrpr	%i0,	0x18AD,	%tick
	edge16l	%l1,	%i4,	%o2
	wrpr	%g5,	%g7,	%tick
	edge32	%g1,	%o7,	%o5
	rdpr	%pil,	%o3
	fmovdleu	%icc,	%f3,	%f13
	udivcc	%g4,	0x003C,	%l2
	rdpr	%otherwin,	%g2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%o6,	%i1,	%set_softint
	wr 	%g0, 	0x7, 	%fprs
	tsubcc	%o1,	%o0,	%l6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fmovdl	%icc,	%f4,	%f13
	wrpr	%l4,	%g3,	%pil
	flushw
	rdpr	%cansave,	%o4
	ldd	[%l7 + 0x08],	%f14

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	xnor	%i7,	0x1D94,	%i3
	xnorcc	%i0,	0x0BA1,	%l0
	srlx	%i4,	%l1,	%o2
	fcmple32	%f26,	%f8,	%g5
	fornot1	%f28,	%f6,	%f6
	wr	%g7,	%g1,	%pic
	wrpr	%o7,	%o3,	%cwp
	sllx	%g4,	0x02,	%o5
	rdhpr	%htba,	%l2
	fcmpgt16	%f4,	%f30,	%g2
	tg	%icc,	0x3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xA8F, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	fmovd	%f4,	%f16
	movle	%icc,	%i1,	%o0
	movrgz	%l6,	0x3E1,	%g6
	rdhpr	%hsys_tick_cmpr,	%o1
	tge	%xcc,	0x1
	te	%icc,	0x1
	rdhpr	%hsys_tick_cmpr,	%l3
	orn	%g3,	0x0AB9,	%l4
	udivx	%o4,	0x1A89,	%l5
	rd	%pc,	%i2
	rd	%asi,	%i7
	tn	%icc,	0x1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x29F, 	%hsys_tick_cmpr
	rd	%tick_cmpr,	%l0
	sdiv	%i4,	0x1ED6,	%l1
	movne	%xcc,	%o2,	%g5
	sdivcc	%g7,	0x0813,	%i3
	udiv	%o7,	0x0147,	%o3
	stw	%g4,	[%l7 + 0x54]
	sth	%g1,	[%l7 + 0x30]
	wr	%l2,	0x18A9,	%y
	rd	%sys_tick_cmpr,	%g2
	wrpr	%o5,	0x0ACE,	%cwp
	rdhpr	%hintp,	%i5
	rdhpr	%hintp,	%i1
	movleu	%xcc,	%o6,	%o0
	fmovsleu	%icc,	%f30,	%f24
	srlx	%l6,	0x1A,	%o1
	wr	%g0,	0x89,	%asi
	ldxa	[%l7 + 0x70] %asi,	%g6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	bl,a	loop_391
	fbue	%fcc0,	loop_392
	wrpr	%l3,	0x15FE,	%cwp
	fmovsvs	%xcc,	%f8,	%f12
loop_391:
	fbul	%fcc2,	loop_393
loop_392:
	wrpr	%o4,	%i6,	%tick
	or	%l5,	%i2,	%i0
	rdpr	%gl,	%l0
loop_393:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnorcc	%i7,	%l1,	%o2
	rd	%y,	%g5
	rdpr	%cansave,	%i4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%hsys_tick_cmpr,	%g7
	fmovrslez	%o7,	%f27,	%f10
	rdhpr	%hintp,	%g4
	rdpr	%cleanwin,	%o3
	rdpr	%pil,	%l2
	rd	%softint,	%g2
	set	0x17, %g6
	lduba	[%l7 + %g6] 0x04,	%o5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xB69, 	%hsys_tick_cmpr
	fpmerge	%f8,	%f16,	%f22
	wrpr	%i1,	0x0C4D,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	or	%o6,	0x0FC5,	%l6
	rdhpr	%hsys_tick_cmpr,	%o1
	wrpr	%o0,	0x13F4,	%cwp
	te	%icc,	0x2
	rd	%ccr,	%g3
	taddcctv	%l4,	%g6,	%l3
	fmovdle	%xcc,	%f22,	%f6
	wrpr	%o4,	0x08D6,	%cwp
	edge16ln	%l5,	%i6,	%i0
	add	%i2,	%i7,	%l0
	add	%o2,	%l1,	%g5
	rdhpr	%hsys_tick_cmpr,	%i3
	movvc	%xcc,	%g7,	%o7
	addc	%g4,	0x1B4D,	%i4
	flushw
	set	0x1C, %g2
	ldsha	[%l7 + %g2] 0x88,	%o3
	movrgez	%l2,	0x0F5,	%g2
	rdhpr	%hsys_tick_cmpr,	%i5
	srlx	%o5,	0x19,	%i1
	wrpr	%o6,	%g1,	%pil
	srlx	%l6,	%o0,	%g3
	rdhpr	%htba,	%l4
	rdpr	%cleanwin,	%g6
	movge	%xcc,	%o1,	%o4
	stx	%l3,	[%l7 + 0x70]
	wr	%l5,	0x0632,	%softint
	rdpr	%cansave,	%i6
	lduh	[%l7 + 0x4C],	%i2
	stw	%i0,	[%l7 + 0x3C]
	rd	%ccr,	%l0
	rdpr	%tl,	%o2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%tick_cmpr,	%l1
	rdhpr	%htba,	%g7
	rdpr	%tba,	%i3
	wr	%g4,	0x0AF3,	%pic
	wr	%i4,	%o3,	%pic
	wr	%l2,	0x0A6F,	%y
	edge8ln	%o7,	%i5,	%o5
	fnors	%f9,	%f25,	%f26
	wrpr	%g2,	0x06D3,	%cwp
	rdpr	%cleanwin,	%i1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xF4E, 	%hsys_tick_cmpr
	rdhpr	%hsys_tick_cmpr,	%g1
	rdhpr	%htba,	%o0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	set	0x1C, %o5
	ldsha	[%l7 + %o5] 0x88,	%l6
	rd	%asi,	%g6
!Yo - got one - imm_asi 0x5f 
!And yo - immediate is 0x0
	set	0x0, %i4
	stxa	%l4,	[%g0 + %i4] 0x5f
	rdhpr	%htba,	%o1
	smulcc	%o4,	%l3,	%l5
	fpadd32s	%f25,	%f20,	%f0
	lduw	[%l7 + 0x2C],	%i6
	fbne,a	%fcc0,	loop_394
	fnand	%f22,	%f14,	%f20
	fbe,a	%fcc3,	loop_395
	nop
	setx loop_396, %l0, %l1
	jmpl %l1, %i2
loop_394:
	fblg,a	%fcc2,	loop_397
	fornot2s	%f7,	%f24,	%f4
loop_395:
	rdpr	%wstate,	%i0
loop_396:
	edge16	%o2,	%l0,	%g5
loop_397:
	rdhpr	%htba,	%l1
	tvs	%icc,	0x6
	rdpr	%gl,	%g7
	rd	%pc,	%i7
	flushw
	array16	%i3,	%i4,	%o3
	fmovdleu	%icc,	%f6,	%f4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%i5,	%o5,	%ccr
	bgu,pt	%xcc,	loop_398
	wr	%i1,	0x0968,	%pic
	movpos	%icc,	%g2,	%o6
	wrpr	%g1,	%o0,	%pil
loop_398:
	wr	%g3,	%l6,	%ccr
	tge	%icc,	0x3
	add	%g6,	0x1A62,	%o1
	movn	%icc,	%l4,	%o4
	rdpr	%pil,	%l5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x75C, 	%tick_cmpr
	rdhpr	%htba,	%i2
	rdpr	%otherwin,	%i0
	srlx	%l0,	0x16,	%o2
	rdhpr	%htba,	%g5
	wrpr	%g7,	0x0020,	%tick
	rdhpr	%hintp,	%l1
	rd	%ccr,	%i7
	lduw	[%l7 + 0x10],	%i3
	bvc	%icc,	loop_399
	wrpr	%o3,	0x09E5,	%pil
	rdhpr	%hintp,	%i4
	fzero	%f28
loop_399:
	rdhpr	%hsys_tick_cmpr,	%l2
	siam	0x6
	bpos,pt	%xcc,	loop_400
	rd	%sys_tick_cmpr,	%g4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x3D2, 	%hsys_tick_cmpr
	wr 	%g0, 	0x6, 	%fprs
loop_400:
	sub	%g2,	%i1,	%g1
	wrpr	%o6,	0x006A,	%pil
	rd	%asi,	%g3
	wr	%o0,	0x0D11,	%ccr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	orn	%o1,	%l4,	%o4
	fmovsn	%icc,	%f8,	%f2
	rd	%fprs,	%l5
	fmul8x16al	%f22,	%f25,	%f0
	movneg	%xcc,	%i6,	%i2
	edge16n	%l3,	%i0,	%o2
	rd	%pc,	%g5
	rdpr	%pil,	%l0
	rd	%sys_tick_cmpr,	%l1
	lduw	[%l7 + 0x70],	%i7
	bcc,pt	%xcc,	loop_401
	rdpr	%gl,	%i3
	movvc	%icc,	%g7,	%i4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_401:
	rdpr	%cwp,	%i5
	andn	%o7,	0x1778,	%g4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x50C, 	%hsys_tick_cmpr
	rdhpr	%htba,	%i1
	sir	0x097D

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	and	%o0,	%g1,	%g6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	bl,pt	%icc,	loop_402
	wr	%l4,	0x0BEC,	%softint
	rd	%ccr,	%o4
	movleu	%xcc,	%l5,	%i6
loop_402:
	fzeros	%f16
	movne	%icc,	%l3,	%i2
	rdhpr	%hintp,	%o2
	nop
	set	0x68, %l6
	ldx	[%l7 + %l6],	%i0
	bvc,a,pn	%xcc,	loop_403
	fmovrsgz	%g5,	%f20,	%f15
	rd	%ccr,	%l1
	addc	%l0,	0x0FCB,	%i3
loop_403:
	fandnot1	%f8,	%f4,	%f20
	tn	%xcc,	0x4
	fands	%f24,	%f12,	%f11
	rdpr	%otherwin,	%g7
	andcc	%i7,	%i4,	%o3
	rd	%ccr,	%i5
	rdpr	%canrestore,	%o7
	rdpr	%otherwin,	%l2
	wr 	%g0, 	0x6, 	%fprs
	set	0x78, %i7
	lda	[%l7 + %i7] 0x14,	%f15
	rdpr	%pil,	%g2
	rdhpr	%hintp,	%i1
	rdhpr	%hsys_tick_cmpr,	%o6
	tl	%xcc,	0x4
	wr	%o0,	%g3,	%y
	taddcc	%g1,	%g6,	%l6
	fnors	%f4,	%f23,	%f11
	wr 	%g0, 	0x5, 	%fprs
	tcs	%icc,	0x5
	brgz	%o4,	loop_404
	edge32	%o1,	%i6,	%l5
	fmovsl	%xcc,	%f30,	%f17
	rdhpr	%hsys_tick_cmpr,	%i2
loop_404:
	rdhpr	%hsys_tick_cmpr,	%o2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	mulx	%g5,	%l1,	%l0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%i7,	0x1BBA,	%y
	addcc	%i4,	%i5,	%o7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xDF7, 	%hsys_tick_cmpr
	tcs	%icc,	0x0
	rdhpr	%hsys_tick_cmpr,	%o5
	rd	%softint,	%g4
	fbu,a	%fcc0,	loop_405
	fbue,a	%fcc3,	loop_406
	array32	%l2,	%i1,	%g2
	wrpr	%o6,	%g3,	%cwp
loop_405:
	fabss	%f11,	%f28
loop_406:
	rdpr	%tba,	%o0
	tvc	%xcc,	0x5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	wrpr	%l6,	0x1E7A,	%cwp
	fbne,a	%fcc3,	loop_407
	stw	%g1,	[%l7 + 0x64]
	rd	%tick_cmpr,	%o4
	ldd	[%l7 + 0x08],	%f30
loop_407:
	wr	%l4,	0x0A0A,	%set_softint
	srlx	%i6,	0x04,	%o1
	rdpr	%otherwin,	%l5
	movge	%xcc,	%o2,	%i2
	fbu	%fcc0,	loop_408
	rdpr	%canrestore,	%i0
	rdhpr	%hsys_tick_cmpr,	%g5
	xor	%l1,	%l0,	%g7
loop_408:
	rd	%tick_cmpr,	%i3
	edge32l	%i7,	%i4,	%i5
	rdhpr	%hintp,	%l3
	fmovdgu	%xcc,	%f24,	%f29
	rd	%y,	%o7
	wr	%g0,	0x88,	%asi
	prefetcha	[%l7 + 0x20] %asi,	 0x1
	wr	%g0,	0x2b,	%asi
	ldda	[%l7 + 0x70] %asi,	%o4
	popc	%l2,	%g4
	fcmpes	%fcc2,	%f6,	%f22
	rd	%asi,	%g2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xDA2, 	%hsys_tick_cmpr
	fornot2	%f4,	%f24,	%f0
	rdhpr	%hpstate,	%o0
	xor	%g6,	0x1A65,	%g3
	rd	%fprs,	%l6
	ldub	[%l7 + 0x21],	%o4
	rdhpr	%hsys_tick_cmpr,	%g1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	edge8l	%l5,	%i6,	%o2
	rdpr	%cwp,	%i0
	fmul8x16au	%f13,	%f21,	%f20
	srl	%i2,	0x1D,	%l1
	wr	%l0,	%g5,	%ccr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x323, 	%hsys_tick_cmpr
	wrpr	%i7,	%i4,	%tick
	edge32l	%i5,	%i3,	%o7
	fmovrde	%l3,	%f16,	%f6
	rdpr	%cwp,	%o3
	udiv	%o5,	0x1473,	%l2
	xorcc	%g2,	0x19DE,	%g4
	fbge	%fcc1,	loop_409
	rdpr	%canrestore,	%i1
	wr	%o6,	%o0,	%y
	sra	%g6,	%l6,	%g3
loop_409:
	srl	%g1,	%l4,	%o1
	movrlez	%l5,	0x140,	%o4
	tn	%xcc,	0x0
	rdhpr	%htba,	%i6
	wr	%i0,	0x1126,	%set_softint
	or	%i2,	0x110A,	%o2
	movrne	%l0,	0x06F,	%l1
	wrpr	%g5,	%i7,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x403, 	%hsys_tick_cmpr
	std	%f8,	[%l7 + 0x08]
	rd	%asi,	%i4
	tge	%xcc,	0x3
	rdpr	%cwp,	%i3
	rdpr	%otherwin,	%o7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%cansave,	%o5
	fbe	%fcc2,	loop_410
	fbug	%fcc2,	loop_411
	rdhpr	%hsys_tick_cmpr,	%l3
	rd	%sys_tick_cmpr,	%g2
loop_410:
	andcc	%g4,	0x04E6,	%l2
loop_411:
	wrpr	%o6,	%i1,	%cwp
	ldd	[%l7 + 0x20],	%f16

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	set	0x52, %i5
	stha	%g3,	[%l7 + %i5] 0x81
	wr	%g1,	0x0D51,	%sys_tick
	fpadd16	%f20,	%f4,	%f8
	edge16	%l4,	%o1,	%l5
	xor	%l6,	0x0B9F,	%o4
	rdhpr	%htba,	%i6
	tl	%xcc,	0x7
	fmovdge	%icc,	%f3,	%f13
	wr	%i0,	%i2,	%y
	movn	%icc,	%l0,	%o2
	wr	%g5,	%l1,	%pic
	edge32n	%i7,	%i5,	%i4
	tg	%icc,	0x4
	smulcc	%g7,	0x1675,	%i3
	rdhpr	%hintp,	%o3
	edge8	%o7,	%o5,	%l3
	tsubcctv	%g4,	%g2,	%o6
	rdpr	%canrestore,	%i1
	rdhpr	%hintp,	%o0
	fpsub32	%f2,	%f10,	%f10
	fmovrdlez	%l2,	%f22,	%f2
	rdpr	%cansave,	%g6
	fandnot1	%f18,	%f2,	%f18
	rd	%sys_tick_cmpr,	%g3
	wrpr	%g1,	0x0130,	%pil
	rd	%sys_tick_cmpr,	%l4
	wr	%g0,	0x23,	%asi
	stha	%o1,	[%l7 + 0x6E] %asi
	membar	#Sync
	brgz,a	%l6,	loop_412
	fmovspos	%xcc,	%f28,	%f30
	rdhpr	%hsys_tick_cmpr,	%l5
	wrpr	%i6,	%i0,	%pil
loop_412:
	rdpr	%cansave,	%i2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xFFB, 	%hsys_tick_cmpr
	wrpr	%l0,	0x07AF,	%cwp
	wr	%g5,	0x04AD,	%clear_softint
	wrpr	%i7,	0x18BB,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%fprs,	%i4
	rd	%pc,	%g7
	rdpr	%canrestore,	%i3
	srl	%l1,	%o3,	%o5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xBDC, 	%tick_cmpr
	rd	%ccr,	%g4
	edge32ln	%o6,	%i1,	%o0
	ldx	[%l7 + 0x38],	%l2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x9CF, 	%hsys_tick_cmpr
	wrpr	%g1,	%l4,	%tick
	rdpr	%cwp,	%o1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%i6,	0x1A86,	%y
	rd	%y,	%i0
	rdpr	%cleanwin,	%g3
	fabss	%f31,	%f9
	sdiv	%i2,	0x17E6,	%o2
	fcmps	%fcc1,	%f27,	%f31

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	membar	0x44
	rdpr	%otherwin,	%l0
	fornot1	%f28,	%f16,	%f18
	flush	%l7 + 0x30
	wr	%g5,	%i7,	%pic
	rdpr	%tl,	%i3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x564, 	%hsys_tick_cmpr
	wrpr	%o3,	0x1AAE,	%cwp
	edge16	%i5,	%o5,	%o7
	wr	%g4,	%l3,	%sys_tick
	rdhpr	%hintp,	%i1
	rdpr	%canrestore,	%o6
	addc	%l2,	%o0,	%g6
	siam	0x2
	te	%xcc,	0x7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x78A, 	%hsys_tick_cmpr
	wr	%l4,	0x0937,	%y

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x7DF, 	%hsys_tick_cmpr
	siam	0x0
	orcc	%o1,	0x0263,	%i0
	rd	%fprs,	%g3
	movneg	%xcc,	%i2,	%i6
	xnor	%o2,	0x0160,	%o4
	popc	0x0373,	%g5
	fnot1s	%f19,	%f1
	subc	%l0,	%i4,	%i7
	fsrc1	%f18,	%f22
	wrpr	%i3,	%g7,	%cwp
	tsubcc	%o3,	0x0AE0,	%i5
	taddcctv	%o5,	0x01D0,	%l1
	sethi	0x1D6F,	%o7
	rdhpr	%hintp,	%l3
	movrgz	%i1,	0x1B9,	%g4
	srlx	%o6,	%l2,	%o0
	popc	0x0BA4,	%g2
	rdhpr	%htba,	%g1
	alignaddrl	%g6,	%l4,	%l6
	wr	%o1,	0x0F9A,	%clear_softint
	tg	%icc,	0x3
	wr	%i0,	%l5,	%set_softint
	rdpr	%otherwin,	%g3
	srax	%i2,	0x12,	%i6
	rdhpr	%hsys_tick_cmpr,	%o2
	srl	%o4,	0x1A,	%l0
	wrpr	%g5,	%i4,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%ccr,	%i7
	rdhpr	%htba,	%g7
	wrpr	%o3,	0x0B13,	%cwp
	tneg	%xcc,	0x2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	rd	%pc,	%o5
	rd	%softint,	%l1
	rdpr	%cwp,	%o7
	movrgez	%i1,	0x26A,	%g4
	rdhpr	%hsys_tick_cmpr,	%l3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%htba,	%o6
	array16	%o0,	%g1,	%g6
	rdpr	%tba,	%g2
	wr	%l4,	%o1,	%ccr
	rdhpr	%hsys_tick_cmpr,	%l6
	rdpr	%tba,	%i0
	rdpr	%otherwin,	%g3
	rdpr	%wstate,	%l5
	fpmerge	%f19,	%f0,	%f24
	wrpr	%i6,	0x1653,	%tick
	rd	%y,	%i2
	wrpr	%o2,	0x1EA4,	%tick
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movge	%xcc,	%l0,	%g5
	wr	%o4,	%i4,	%pic
	rd	%pc,	%i3
	fmovd	%f22,	%f12
	tvc	%xcc,	0x1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x50B, 	%hsys_tick_cmpr
	ta	%icc,	0x2
	fmovdleu	%icc,	%f25,	%f4
	wr	%o3,	0x0265,	%y
	subcc	%i5,	%o5,	%l1
	rdpr	%canrestore,	%g7
	tleu	%icc,	0x6
	fmul8x16au	%f12,	%f7,	%f16
	rdpr	%otherwin,	%o7
	wrpr	%g4,	0x1E05,	%tick
	wrpr	%l3,	%l2,	%tick
	rd	%softint,	%i1
	set	0x6C, %o6
	sta	%f24,	[%l7 + %o6] 0x81
	rdpr	%otherwin,	%o0
	rdhpr	%hintp,	%g1
	rdpr	%cansave,	%g6
	set	0x28, %o1
	ldxa	[%l7 + %o1] 0x04,	%g2
	fmovsleu	%icc,	%f12,	%f31
	taddcc	%l4,	%o1,	%o6
	rdpr	%canrestore,	%i0
	rd	%fprs,	%g3
	array16	%l5,	%i6,	%l6
	wr	%i2,	0x085D,	%sys_tick
	fmovrdgz	%o2,	%f10,	%f16

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x9D2, 	%hsys_tick_cmpr
	orncc	%i4,	0x0278,	%o4
	movrlez	%i3,	%i7,	%i5
	umulcc	%o5,	%l1,	%o3
	wr	%g7,	%g4,	%sys_tick
	rd	%sys_tick_cmpr,	%l3
	rdpr	%gl,	%o7
	rdpr	%pil,	%i1
	movpos	%icc,	%l2,	%g1
	movg	%xcc,	%g6,	%o0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x401, 	%hsys_tick_cmpr
	edge32n	%o1,	%o6,	%i0
	wr	%l5,	0x037F,	%set_softint
	wr	%g3,	%l6,	%softint
	andcc	%i6,	%o2,	%i2
	srax	%l0,	0x10,	%g5
	wrpr	%i4,	0x0441,	%cwp
	sra	%i3,	%i7,	%o4
	set	0x1C, %g1
	stwa	%i5,	[%l7 + %g1] 0xe2
	membar	#Sync

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	orcc	%g7,	0x0EEA,	%o3
	wrpr	%l3,	0x0E87,	%pil
	rdhpr	%hpstate,	%g4
	fbge,a	%fcc1,	loop_413
	fmovdn	%xcc,	%f1,	%f0
	add	%i1,	0x0C55,	%o7
	nop
	setx loop_414, %l0, %l1
	jmpl %l1, %g1
loop_413:
	rdpr	%wstate,	%l2
	wr	%g6,	%l4,	%sys_tick
	wr	%o0,	0x1272,	%softint
loop_414:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fornot1	%f0,	%f6,	%f8

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x511, 	%tick_cmpr
	movvs	%icc,	%g3,	%l6
	wrpr	%i6,	%l5,	%tick
	rdhpr	%htba,	%o2
	wrpr	%i2,	0x0E53,	%pil
	tcc	%icc,	0x0
	movre	%g5,	%i4,	%l0
	wrpr	%i3,	0x1C7C,	%pil
	orncc	%i7,	%o4,	%i5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x9F9, 	%hsys_tick_cmpr
	rdpr	%gl,	%l1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x578, 	%hsys_tick_cmpr
	movne	%icc,	%g4,	%i1
	rdhpr	%hintp,	%o7
	fcmple16	%f6,	%f2,	%g1
	wrpr	%l2,	%g7,	%cwp
	edge16n	%g6,	%l4,	%o0
	rdhpr	%hpstate,	%g2
	fmovrslez	%i0,	%f2,	%f3
	andn	%o6,	0x1A1B,	%o1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fxnor	%f16,	%f2,	%f10
	rdpr	%wstate,	%g3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x4F6, 	%hsys_tick_cmpr
	ldd	[%l7 + 0x18],	%f24

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%y,	%o2
	fmovsa	%xcc,	%f8,	%f2
	movrlz	%g5,	0x073,	%i4
	rdpr	%pil,	%l0
	rdpr	%otherwin,	%i7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x4CC, 	%tick_cmpr
	wrpr	%o5,	0x14D3,	%tick
	wrpr	%l1,	0x1B7F,	%pil
	bneg	%icc,	loop_415
	tpos	%xcc,	0x0
	bge,a,pt	%xcc,	loop_416
	fmovda	%xcc,	%f3,	%f21
loop_415:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x8A8, 	%hsys_tick_cmpr
loop_416:
	fnegs	%f8,	%f16
	fblg,a	%fcc3,	loop_417
	rd	%pc,	%o7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xAA2, 	%hsys_tick_cmpr
	rd	%tick_cmpr,	%l2
loop_417:
	fbg,a	%fcc0,	loop_418
	rdhpr	%htba,	%g6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	bge,a	%xcc,	loop_419
loop_418:
	edge32n	%l4,	%g2,	%o6
	rd	%fprs,	%i0
	tge	%xcc,	0x7
loop_419:
	fmovdl	%icc,	%f3,	%f27
	rdpr	%gl,	%o1
	popc	0x160F,	%l6
	wrpr	%l5,	0x0A40,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	udivx	%g3,	0x1565,	%o2
	movne	%icc,	%i4,	%g5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	rdpr	%cansave,	%l0
	wrpr	%i2,	%i3,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	addcc	%i7,	%o5,	%o4
	andcc	%l1,	0x1860,	%o3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xCFB, 	%hsys_tick_cmpr
	rdpr	%cansave,	%o7
	fbug	%fcc3,	loop_420
	bvc,pt	%xcc,	loop_421
	fpsub32s	%f15,	%f28,	%f30
	edge32n	%g1,	%l2,	%i1
loop_420:
	move	%icc,	%g6,	%o0
loop_421:
	rdpr	%gl,	%l4
	rd	%y,	%g7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%hpstate,	%i0
	rdhpr	%hintp,	%l6
	array32	%l5,	%o1,	%i6
	rdpr	%tba,	%g3
	flush	%l7 + 0x78
	udiv	%i4,	0x050F,	%g5
	rdpr	%tl,	%l0
	fmovrdgz	%i2,	%f0,	%f12
	rdpr	%tba,	%i3
	rdpr	%tl,	%i5
	wr	%i7,	%o5,	%sys_tick
	rdhpr	%hpstate,	%o4
	rd	%asi,	%l1
	wrpr	%o3,	%g4,	%pil
	rdhpr	%hpstate,	%o2
	addcc	%o7,	0x1BE0,	%g1
	andcc	%l3,	%i1,	%g6
	fmul8x16	%f16,	%f20,	%f8
	fmovdcc	%xcc,	%f17,	%f29
	sdiv	%l2,	0x1D83,	%o0
	wr	%g7,	0x0921,	%pic
	wr	%l4,	0x196C,	%clear_softint
	tl	%xcc,	0x5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xA0A, 	%hsys_tick_cmpr
	rdpr	%tba,	%l6
	udivx	%l5,	0x023D,	%o1
	tleu	%xcc,	0x4
	sir	0x17A6
	umulcc	%i4,	%g2,	%g5
	srl	%i2,	%i3,	%i5
	rd	%pc,	%l0
	xnorcc	%o5,	%o4,	%l1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%canrestore,	%g4
	fmovrsne	%o2,	%f3,	%f31
	rd	%fprs,	%o7
	ta	%xcc,	0x7
	rdpr	%cleanwin,	%o3
	rdhpr	%hsys_tick_cmpr,	%g1
	wrpr	%i1,	0x0666,	%pil
	ldd	[%l7 + 0x08],	%l2
	wrpr	%l2,	0x1E66,	%pil
	rdhpr	%hsys_tick_cmpr,	%g6
	rdhpr	%hpstate,	%o0
	rd	%ccr,	%l4
	rdhpr	%htba,	%o6
	andn	%i0,	0x0C56,	%l5
	set	0x7C, %o3
	stba	%o1,	[%l7 + %o3] 0x80
	fmovrslez	%l6,	%f7,	%f2
	rd	%y,	%i6
	wrpr	%g3,	0x10F9,	%tick
	rdpr	%gl,	%g2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	alignaddr	%g5,	%i3,	%i5
	rdhpr	%hsys_tick_cmpr,	%o5
	tcc	%icc,	0x1
	rdpr	%cansave,	%o4
	fbul,a	%fcc0,	loop_422
	popc	0x1291,	%l1
	rdpr	%tl,	%l0
loop_422:
	rdpr	%tba,	%o2
	udivx	%o7,	0x1A76,	%o3
	fcmple32	%f2,	%f6,	%g1
	addccc	%g4,	0x1C99,	%l3
	xorcc	%l2,	%i1,	%g7
	rd	%tick_cmpr,	%g6
	rdpr	%cansave,	%l4
	rdhpr	%hsys_tick_cmpr,	%o6
	rdpr	%tl,	%i0
	rdpr	%cleanwin,	%l5
	wr	%o1,	%l6,	%ccr
	lduh	[%l7 + 0x42],	%o0
	wr	%g0,	0x81,	%asi
	stxa	%i6,	[%l7 + 0x58] %asi
	wrpr	%g3,	0x11FD,	%tick
	stw	%i4,	[%l7 + 0x50]
	wr	%g2,	0x0EFB,	%sys_tick
	sra	%g5,	0x0D,	%i2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	movrlz	%i5,	%o4,	%l1
	wr	%o5,	%l0,	%softint
	std	%i6,	[%l7 + 0x50]
	ldsh	[%l7 + 0x5C],	%o2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fmovrse	%o7,	%f8,	%f12
	set	0x64, %l3
	stba	%l3,	[%l7 + %l3] 0x15
	rd	%tick_cmpr,	%l2
	rdhpr	%htba,	%g4
	tge	%icc,	0x7
	rdpr	%pil,	%g7
	wrpr	%l4,	0x1AFC,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	edge16n	%g6,	%l5,	%i0
	rdpr	%cansave,	%l6
	fmovda	%icc,	%f11,	%f26

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%tick_cmpr,	%o0
	wrpr	%i6,	%i4,	%tick
	rdpr	%tba,	%g3
	rdhpr	%hpstate,	%g5
	tge	%xcc,	0x7
	wr	%i2,	%i3,	%clear_softint

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x400, 	%sys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%hpstate,	%o5
	ta	%xcc,	0x1
	st	%f12,	[%l7 + 0x0C]
	movrgez	%l1,	0x340,	%l0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fornot1s	%f26,	%f31,	%f5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	fbne	%fcc1,	loop_423
	rdpr	%tl,	%o2
	fmovda	%xcc,	%f7,	%f2
	movrlez	%o7,	%l3,	%g4
loop_423:
	fabss	%f13,	%f9

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x103, 	%hsys_tick_cmpr
	wr	%l4,	0x0A4D,	%pic
	rd	%y,	%o6
	wr	%g6,	0x110A,	%y
	rdpr	%tba,	%l5
	rd	%tick_cmpr,	%g7
	movcs	%icc,	%i0,	%l6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%wstate,	%i6
	rdhpr	%htba,	%o0
	rd	%softint,	%g3
	addccc	%g5,	%i4,	%i3
	tne	%icc,	0x5
	rdhpr	%hpstate,	%i5
	tvs	%xcc,	0x7
	array32	%g2,	%i2,	%o4
	rdhpr	%hsys_tick_cmpr,	%l1
	rdpr	%pil,	%l0
	rdpr	%tba,	%i7
	rdhpr	%htba,	%o5
	fmuld8sux16	%f28,	%f0,	%f6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xC5A, 	%hsys_tick_cmpr
	fmovrdlez	%o7,	%f4,	%f26
	fzeros	%f8
	fnors	%f9,	%f25,	%f17
	fmovsn	%xcc,	%f9,	%f22
	rd	%fprs,	%o3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	udivx	%l2,	0x0573,	%i1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%softint,	%g6
	rd	%sys_tick_cmpr,	%o6
	wrpr	%g7,	%l5,	%tick
	andcc	%l6,	0x0FAC,	%o1
	taddcctv	%i0,	%o0,	%i6
	wrpr	%g3,	%g5,	%cwp
	rdhpr	%hpstate,	%i4
	rdpr	%otherwin,	%i3
	wrpr	%i5,	%g2,	%pil
	rdhpr	%hpstate,	%o4
	wrpr	%l1,	%l0,	%pil
	fmovrslz	%i7,	%f24,	%f23
	wrpr	%o5,	0x03C2,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xA61, 	%hsys_tick_cmpr
	stb	%o2,	[%l7 + 0x57]
	xor	%o7,	0x0EDC,	%o3
	rdpr	%cleanwin,	%l3
	wrpr	%g4,	%l2,	%cwp
	tn	%xcc,	0x0
	wr	%i1,	%l4,	%sys_tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xB16, 	%hsys_tick_cmpr
	sdivcc	%l5,	0x15AE,	%g7
	rdpr	%wstate,	%l6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	set	0x77, %i6
	stba	%i6,	[%l7 + %i6] 0x23
	membar	#Sync
	subcc	%g3,	0x0A94,	%i0
	movre	%i4,	0x172,	%g5
	wr	%g0,	0x88,	%asi
	ldsba	[%l7 + 0x5D] %asi,	%i5
	wrpr	%i3,	%g2,	%pil
	rd	%tick_cmpr,	%l1
	wr	%o4,	0x18D3,	%pic
	rd	%sys_tick_cmpr,	%i7
	wr	%g0,	0x18,	%asi
	lduba	[%l7 + 0x0A] %asi,	%l0
	wr	%g0,	0x89,	%asi
	stda	%o4,	[%l7 + 0x70] %asi
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wrpr	%g1,	0x05AB,	%cwp
	sir	0x1073
	rd	%y,	%i2
	rdpr	%pil,	%o2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	movg	%icc,	%o7,	%g4
	nop
	setx loop_424, %l0, %l1
	jmpl %l1, %i1
	rd	%pc,	%l4
	bge,a	%icc,	loop_425
	wrpr	%o6,	%g6,	%pil
loop_424:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xA01, 	%hsys_tick_cmpr
	rdhpr	%hintp,	%l6
loop_425:
	lduw	[%l7 + 0x38],	%g7
	wrpr	%o0,	0x1BC9,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%otherwin,	%i0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x6DD, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x168, 	%hsys_tick_cmpr
	rdhpr	%hsys_tick_cmpr,	%g2
	wrpr	%i3,	0x1B3E,	%tick
	movl	%icc,	%l1,	%i7
	rdhpr	%hintp,	%o4
	movge	%icc,	%o5,	%l0
	ta	%xcc,	0x6
	rd	%tick_cmpr,	%g1
	rdhpr	%hpstate,	%o2
	fmovdvs	%icc,	%f25,	%f6
	wrpr	%o3,	0x04D1,	%pil
	nop
	setx	loop_426,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	rdhpr	%htba,	%l3
	rdpr	%tl,	%o7
	rdhpr	%htba,	%g4
loop_426:
	rd	%ccr,	%i2
	rd	%asi,	%i1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%l2,	0x06B1,	%tick
	rdhpr	%hintp,	%l4
	rd	%tick_cmpr,	%l5
	fcmpeq16	%f14,	%f8,	%l6
	wrpr	%g7,	%o0,	%pil
	fmovdpos	%icc,	%f5,	%f14
	te	%icc,	0x1
	taddcc	%i6,	%i0,	%o1
	rdhpr	%hsys_tick_cmpr,	%g5
	wr	%g0,	0x89,	%asi
	ldsha	[%l7 + 0x3C] %asi,	%i4
	rdhpr	%hpstate,	%g3
	ldsb	[%l7 + 0x7A],	%g2
	popc	0x1FB4,	%i5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xD26, 	%hsys_tick_cmpr
	srl	%o4,	%i7,	%o5
	fbuge	%fcc3,	loop_427
	rd	%ccr,	%g1
	rdpr	%wstate,	%l0
	sethi	0x1EBC,	%o2
loop_427:
	wrpr	%o3,	%l3,	%tick
	and	%g4,	0x0A5F,	%o7
	movneg	%xcc,	%i1,	%i2
	wrpr	%g6,	%l2,	%pil
	fbl	%fcc2,	loop_428
	rdhpr	%hpstate,	%l4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xDBD, 	%hsys_tick_cmpr
	rdhpr	%htba,	%l6
loop_428:
	rdpr	%canrestore,	%o6
	fmuld8ulx16	%f30,	%f4,	%f16
	wr	%o0,	%i6,	%set_softint
	rdpr	%cleanwin,	%g7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x86E, 	%hsys_tick_cmpr
	rdpr	%wstate,	%g5
	rd	%pc,	%o1
	wr	%i4,	0x173F,	%softint

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x7C9, 	%hsys_tick_cmpr
	wr	%g0,	0x04,	%asi
	stba	%g3,	[%l7 + 0x61] %asi
	bvc,pt	%xcc,	loop_429
	rdhpr	%hsys_tick_cmpr,	%i3
	rdpr	%wstate,	%l1
	rdhpr	%hintp,	%i5
loop_429:
	edge8	%i7,	%o4,	%o5
	rdhpr	%htba,	%l0
	fmuld8ulx16	%f22,	%f12,	%f24
	wr	%g1,	%o2,	%sys_tick
	rd	%y,	%l3
	srl	%o3,	%g4,	%o7
	wr	%i2,	0x01E1,	%softint
	movpos	%xcc,	%g6,	%l2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	brlz	%o6,	loop_430
	rdpr	%canrestore,	%l6
	rdpr	%canrestore,	%i6
	rdhpr	%hpstate,	%g7
loop_430:
	array8	%o0,	%i0,	%g5
	wrpr	%o1,	0x0630,	%tick
	tsubcctv	%g2,	%g3,	%i3
	tne	%xcc,	0x4
	rdpr	%tba,	%i4
	wrpr	%i5,	%i7,	%cwp
	rdpr	%cansave,	%o4
	wr	%g0,	0x18,	%asi
	ldswa	[%l7 + 0x18] %asi,	%o5
	rdhpr	%hsys_tick_cmpr,	%l1
	wr	%g1,	%o2,	%softint
	rdhpr	%hpstate,	%l0
	rdpr	%canrestore,	%l3
	sll	%o3,	%o7,	%g4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ble,a	loop_431
	movleu	%xcc,	%g6,	%l2
	stw	%i2,	[%l7 + 0x74]

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_431:
	rdhpr	%htba,	%i1
	subcc	%o6,	%i6,	%g7
	rd	%softint,	%o0
	nop
	setx loop_432, %l0, %l1
	jmpl %l1, %i0
	rdpr	%tba,	%l6
	wrpr	%o1,	%g2,	%cwp
	rd	%ccr,	%g5
loop_432:
	xorcc	%g3,	0x1D4D,	%i4
	fxors	%f18,	%f13,	%f25
	rdpr	%pil,	%i3
	rd	%tick_cmpr,	%i7
	wr	%o4,	%o5,	%pic
	rd	%pc,	%l1
	wrpr	%g1,	0x0725,	%pil
	wrpr	%o2,	%l0,	%cwp
	sdiv	%l3,	0x1ED6,	%i5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x1CC, 	%hsys_tick_cmpr
	wrpr	%g4,	%o7,	%pil
	prefetch	[%l7 + 0x7C],	 0x0
	rdpr	%canrestore,	%g6
	fmovsn	%xcc,	%f20,	%f30
	subc	%l2,	%i2,	%l5
	fmovs	%f16,	%f14
	bn,pt	%icc,	loop_433
	rd	%tick_cmpr,	%i1
	rd	%tick_cmpr,	%o6
	udiv	%l4,	0x0035,	%g7
loop_433:
	array8	%i6,	%o0,	%l6
	rd	%y,	%o1
	tpos	%icc,	0x4
	rd	%softint,	%i0
	rd	%softint,	%g5
	rdpr	%pil,	%g3
	wrpr	%i4,	%i3,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fsrc1	%f4,	%f6
	wrpr	%g2,	0x10D9,	%tick
	wrpr	%l1,	0x1669,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x7F8, 	%hsys_tick_cmpr
	wrpr	%l0,	0x03C2,	%pil
	rdpr	%wstate,	%o5
	rdpr	%cleanwin,	%l3
	rdhpr	%hpstate,	%i5
	wr	%g4,	0x156D,	%pic
	srax	%l2,	%i2,	%o3
	tgu	%icc,	0x4
	fnegd	%f0,	%f2
	xorcc	%l5,	0x0A7A,	%i1
	rdhpr	%htba,	%o6
	rd	%tick_cmpr,	%g7
	rdpr	%pil,	%l4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%l6,	0x0949,	%cwp
	rdhpr	%htba,	%i0
	rdpr	%pil,	%o1
	rdpr	%canrestore,	%g5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xC41, 	%hsys_tick_cmpr
	taddcc	%i7,	%i3,	%o4
	umul	%l1,	0x0FE6,	%g2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xFE7, 	%hsys_tick_cmpr
	sllx	%o2,	%l3,	%o5
	rd	%ccr,	%i5
	wrpr	%o7,	0x1EBE,	%cwp
	srlx	%g4,	%g6,	%i2
	wr	%l2,	%o3,	%ccr
	movrne	%l5,	0x0E2,	%i1
	nop
	set	0x46, %l2
	lduh	[%l7 + %l2],	%o6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x1CD, 	%hsys_tick_cmpr
	edge32l	%i6,	%l6,	%o1
	fzeros	%f19
	sethi	0x1D74,	%i0
	wrpr	%g3,	0x0961,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	tcs	%xcc,	0x7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x2F7, 	%hsys_tick_cmpr
	wrpr	%i7,	0x15C6,	%pil
	rdhpr	%hintp,	%l1
	stw	%o4,	[%l7 + 0x74]
	tne	%icc,	0x7
	mulx	%g1,	%g2,	%o2
	xnorcc	%l3,	0x0763,	%o5
	rdpr	%canrestore,	%l0
	rdhpr	%hintp,	%i5
	wrpr	%o7,	%g4,	%pil
	edge32l	%i2,	%g6,	%l2
	rdpr	%tba,	%l5
	rdhpr	%hsys_tick_cmpr,	%o3
	brlez	%o6,	loop_434
	bl,a	%xcc,	loop_435
	tn	%icc,	0x2
	rd	%asi,	%i1
loop_434:
	bne,a,pn	%xcc,	loop_436
loop_435:
	fcmple32	%f20,	%f10,	%l4
	movrgez	%g7,	0x27E,	%o0
	tsubcc	%l6,	%i6,	%i0
loop_436:
	call	loop_437
	wr	%g3,	%o1,	%pic
	sll	%i4,	0x13,	%g5
	rdpr	%otherwin,	%i3
loop_437:
	bn,pt	%icc,	loop_438
	rd	%fprs,	%i7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	bcs,a	%xcc,	loop_439
loop_438:
	wr	%l1,	0x10BD,	%set_softint
!Yo - got one - imm_asi 0x58 
!And yo - immediate is 0x18
	wr	%g0,	0x58,	%asi
	ldxa	[%g0 + 0x18] %asi,	%g1
loop_439:
	rd	%tick_cmpr,	%g2
	wr	%o2,	%l3,	%ccr
	rd	%y,	%l0
	rdhpr	%htba,	%o5
	stx	%i5,	[%l7 + 0x08]
	udiv	%o7,	0x04AC,	%g4
	rd	%y,	%g6
	fcmpd	%fcc0,	%f4,	%f10
	wrpr	%l2,	%i2,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	rd	%asi,	%o3
	movpos	%icc,	%o6,	%l4
	rdhpr	%hsys_tick_cmpr,	%i1
	rd	%pc,	%o0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%asi,	%i6
	srax	%g7,	0x0A,	%i0
	fmovsleu	%xcc,	%f6,	%f30
	fmovdvs	%xcc,	%f12,	%f8
	edge32l	%o1,	%i4,	%g5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fbue,a	%fcc3,	loop_440
	movle	%xcc,	%i3,	%l1
	ldub	[%l7 + 0x54],	%g1
	rdpr	%pil,	%o4
loop_440:
	sra	%g2,	0x04,	%l3
	edge8ln	%o2,	%l0,	%i5
	wrpr	%o7,	0x0D42,	%pil
	wrpr	%o5,	0x1786,	%tick
	rdpr	%wstate,	%g6
	xnorcc	%l2,	0x0BF0,	%i2
	call	loop_441
	rdpr	%wstate,	%l5
	orncc	%o3,	0x0645,	%g4
	brlz,a	%l4,	loop_442
loop_441:
	fmul8x16al	%f27,	%f26,	%f16
	fba	%fcc1,	loop_443
	wrpr	%o6,	%o0,	%tick
loop_442:
	edge16n	%i1,	%i6,	%g7
	fbe	%fcc1,	loop_444
loop_443:
	rd	%softint,	%i0
	fmovsneg	%icc,	%f21,	%f9
	rdpr	%canrestore,	%o1
loop_444:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fbuge	%fcc1,	loop_445
	fmovsge	%icc,	%f17,	%f17
	wr	%g3,	%i7,	%ccr
	movrgz	%i3,	0x058,	%l6
loop_445:
	and	%g1,	%l1,	%g2
	tcs	%xcc,	0x6
	movne	%xcc,	%o4,	%l3
	fandnot1s	%f9,	%f26,	%f2
	edge32	%o2,	%i5,	%l0
	sub	%o5,	%o7,	%g6
	stb	%i2,	[%l7 + 0x09]
	rd	%tick_cmpr,	%l2
	fmovde	%xcc,	%f18,	%f2
	fbge,a	%fcc2,	loop_446
	wr	%o3,	%g4,	%ccr
	wrpr	%l4,	0x157A,	%tick
	rdhpr	%hpstate,	%o6
loop_446:
	rdhpr	%hintp,	%o0
	rdhpr	%hpstate,	%l5
	rd	%softint,	%i1
	edge32n	%i6,	%i0,	%g7
	wrpr	%i4,	%g5,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%i3,	%o1,	%pil
	fble,a	%fcc1,	loop_447
	fxnor	%f20,	%f4,	%f26
	tpos	%xcc,	0x1
	wr	%g0,	0x2f,	%asi
	ldda	[%l7 + 0x30] %asi,	%i6
loop_447:
	wr 	%g0, 	0x7, 	%fprs

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	sub	%o4,	0x151B,	%g2
	edge16ln	%l3,	%i5,	%l0
	movne	%icc,	%o2,	%o7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fcmps	%fcc1,	%f1,	%f14
	array16	%i2,	%o5,	%l2
	wr	%g4,	0x199D,	%pic
	udivx	%o3,	0x1ED2,	%o6
	wrpr	%o0,	0x19B9,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x7DC, 	%hsys_tick_cmpr
	rdhpr	%htba,	%i6
	ta	%icc,	0x0
	alignaddr	%l5,	%i0,	%i4
	wrpr	%g7,	%g5,	%cwp
	wr	%g3,	0x1852,	%softint
	wrpr	%i3,	0x0A90,	%cwp
	rdpr	%tl,	%o1
	andn	%l6,	%i7,	%g1
	array16	%l1,	%o4,	%l3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%o2,	0x011D,	%tick
	rdhpr	%htba,	%o7
	fmul8x16	%f20,	%f20,	%f22
	rdhpr	%hpstate,	%i5
	rdpr	%tba,	%g6
	fzero	%f4
	rdhpr	%htba,	%i2
	rd	%tick_cmpr,	%l2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%tl,	%o5
	wrpr	%o0,	%o6,	%cwp
	wrpr	%l4,	%i6,	%pil
	orncc	%l5,	0x0DB7,	%i0
	movgu	%icc,	%i1,	%i4
	rd	%y,	%g5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x4D1, 	%hsys_tick_cmpr
	wrpr	%i3,	%g3,	%pil
	ldstub	[%l7 + 0x3C],	%o1
	wrpr	%i7,	%l6,	%pil
	movrlz	%l1,	%o4,	%l3
	rdhpr	%hsys_tick_cmpr,	%g2
	edge8n	%l0,	%g1,	%o2
	wrpr	%o7,	%g6,	%tick
	wrpr	%i5,	%l2,	%cwp
	rdhpr	%hintp,	%i2
	wrpr	%o3,	0x1C28,	%cwp
	wrpr	%g4,	%o5,	%tick
	fmovsl	%icc,	%f2,	%f20
	wrpr	%o0,	%l4,	%pil
	rd	%tick_cmpr,	%o6
	fbue,a	%fcc0,	loop_448
	edge8ln	%i6,	%l5,	%i0
	wr	%i1,	%g5,	%y
	rdpr	%cwp,	%g7
loop_448:
	rdpr	%gl,	%i3
	wr	%g3,	0x141E,	%clear_softint
	rd	%softint,	%i4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xCDE, 	%tick_cmpr
	subccc	%l1,	0x06D6,	%o4
	rd	%sys_tick_cmpr,	%l6
	rd	%asi,	%g2
	fble,a	%fcc2,	loop_449
	wr	%l3,	%g1,	%sys_tick
	rd	%sys_tick_cmpr,	%l0
	wrpr	%o7,	%o2,	%pil
loop_449:
	rd	%sys_tick_cmpr,	%g6
	wrpr	%i5,	%i2,	%pil
	sdivx	%l2,	0x0C23,	%o3
	rdhpr	%hpstate,	%o5
	fmovrdgz	%g4,	%f0,	%f24
	rd	%asi,	%o0
	edge8ln	%o6,	%l4,	%l5
	sdiv	%i0,	0x0ED4,	%i1
	ldub	[%l7 + 0x2F],	%g5
	rd	%tick_cmpr,	%g7
	rdhpr	%hintp,	%i3
	fpadd32s	%f8,	%f24,	%f13
	rdpr	%wstate,	%i6
	orncc	%i4,	0x020B,	%i7
	rdpr	%canrestore,	%o1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x3F9, 	%hsys_tick_cmpr
	rd	%sys_tick_cmpr,	%o4
	lduh	[%l7 + 0x1A],	%l6
	wrpr	%g3,	0x1D33,	%cwp
	rd	%ccr,	%l3
	wr	%g1,	0x015F,	%y
	wrpr	%g2,	%o7,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%g6,	0x097E,	%clear_softint
	wrpr	%l0,	0x06BF,	%pil
	xorcc	%i5,	%l2,	%o3
	stx	%o5,	[%l7 + 0x30]
	rdhpr	%htba,	%i2
	add	%l7,	0x68,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] %asi,	%o0,	%g4
	wrpr	%o6,	%l4,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	umul	%l5,	0x1826,	%g5
	taddcctv	%g7,	0x077C,	%i3
	wrpr	%i6,	%i4,	%tick
	rd	%y,	%o1
	wrpr	%i7,	0x0D93,	%cwp
	smulcc	%o4,	0x008B,	%l1
	rdhpr	%htba,	%g3
	rdpr	%gl,	%l3
	popc	0x1806,	%l6
	mulscc	%g2,	%g1,	%o2
	ldsb	[%l7 + 0x4E],	%g6
	edge8l	%l0,	%o7,	%l2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xB05, 	%hsys_tick_cmpr
	udiv	%o3,	0x0C07,	%i2
	rdhpr	%hsys_tick_cmpr,	%o0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	movle	%xcc,	%l5,	%i0
	rd	%sys_tick_cmpr,	%g5
	movg	%icc,	%i3,	%g7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	tsubcctv	%o1,	0x1EC9,	%i7
	te	%icc,	0x3
	edge16n	%o4,	%l1,	%i6
	wr	%g3,	0x19E7,	%y

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fornot2	%f26,	%f8,	%f14
	rdhpr	%hpstate,	%g2
	bvs	loop_450
	rdhpr	%hpstate,	%o2
	rd	%pc,	%l0
loop_450:
	bgu,a,pt	%xcc,	loop_451
	wrpr	%o7,	%l2,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xC68, 	%tick_cmpr
	rd	%sys_tick_cmpr,	%o5
loop_451:
	rdpr	%gl,	%i5
	xnor	%i2,	%o0,	%o3
	rdhpr	%hintp,	%l4
	addccc	%o6,	0x0654,	%g4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x153, 	%tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%i4,	%o1,	%pic
	std	%g6,	[%l7 + 0x58]
	rdpr	%cansave,	%o4
	fone	%f20
	rdpr	%gl,	%i7
	rdhpr	%hintp,	%i6
	wrpr	%l1,	0x0C5A,	%tick
	wrpr	%l6,	0x06E2,	%cwp
	wr	%g0,	0x2f,	%asi
	stda	%g2,	[%l7 + 0x30] %asi
	membar	#Sync
	bvc,a,pt	%icc,	loop_452
	wrpr	%g2,	%o2,	%pil
	wr	%g6,	%l3,	%set_softint
	tvs	%xcc,	0x1
loop_452:
	wrpr	%o7,	0x1D2C,	%pil
	wrpr	%l0,	%g1,	%pil
	taddcctv	%l2,	0x1172,	%o5
	rdpr	%otherwin,	%i5
	wrpr	%i2,	0x188D,	%tick
	rdhpr	%htba,	%o3
	rdhpr	%hsys_tick_cmpr,	%l4
	rdhpr	%hpstate,	%o0
	rd	%sys_tick_cmpr,	%g4
	std	%f16,	[%l7 + 0x68]
	wr	%g0,	0x2a,	%asi
	ldda	[%l7 + 0x40] %asi,	%o6
	movg	%xcc,	%l5,	%i0
	movvs	%icc,	%i3,	%i1
	fmovsleu	%icc,	%f19,	%f0
	rd	%tick_cmpr,	%g5
	edge32n	%o1,	%i4,	%g7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	sub	%i6,	%o4,	%l6
	fmovsgu	%xcc,	%f23,	%f3
	wrpr	%g3,	0x1E17,	%cwp
	rdhpr	%hintp,	%l1
	fba,a	%fcc3,	loop_453
	wrpr	%g2,	%g6,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x7B3, 	%hsys_tick_cmpr
	wr	%l0,	0x0F72,	%sys_tick
loop_453:
	fnors	%f27,	%f16,	%f17
	wr	%o2,	0x10FD,	%pic
	movpos	%xcc,	%g1,	%l2
	edge32ln	%o5,	%i2,	%o3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fmovsne	%xcc,	%f18,	%f23
	wr	%o0,	%g4,	%y
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srlx	%o6,	%l5,	%i5
	movl	%xcc,	%i0,	%i3
	rd	%ccr,	%g5
	fzero	%f0
	wr	%g0,	0xeb,	%asi
	ldda	[%l7 + 0x70] %asi,	%o0
	wrpr	%i4,	0x0793,	%cwp
	rdpr	%otherwin,	%g7
	st	%f24,	[%l7 + 0x54]
	rdhpr	%hintp,	%i7
	fpsub16s	%f4,	%f11,	%f16
	wrpr	%i6,	0x0B90,	%pil
	wr	%o4,	0x03ED,	%pic
	wr	%l6,	%i1,	%sys_tick
	rd	%pc,	%g3
	rdhpr	%hintp,	%l1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	nop
	set	0x1A, %i3
	ldsb	[%l7 + %i3],	%g2
	rdpr	%wstate,	%o7
	bneg	loop_454
	wr	%l3,	0x1681,	%sys_tick
	brlez	%l0,	loop_455
	lduw	[%l7 + 0x18],	%o2
loop_454:
	rdhpr	%hpstate,	%l2
	set	0x30, %o4
	swapa	[%l7 + %o4] 0x89,	%g1
loop_455:
	swap	[%l7 + 0x1C],	%o5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xD3F, 	%hsys_tick_cmpr
	call	loop_456
	alignaddrl	%l4,	%o0,	%g4
	wr	%o6,	0x094E,	%clear_softint
	fmovdg	%xcc,	%f23,	%f20
loop_456:
	rd	%asi,	%l5
	fnegs	%f15,	%f5
	andcc	%i2,	0x0BE4,	%i5
	rd	%fprs,	%i0
	ta	%xcc,	0x0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x184, 	%hsys_tick_cmpr
	rd	%softint,	%i3
	rd	%sys_tick_cmpr,	%g7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	sethi	0x1BC2,	%o4
	brz,a	%i6,	loop_457
	bcc,pt	%icc,	loop_458
	rd	%y,	%l6
	movl	%icc,	%g3,	%i1
loop_457:
	tsubcc	%g6,	%l1,	%o7
loop_458:
	prefetch	[%l7 + 0x44],	 0x3
	xorcc	%l3,	%o2,	%l2
	movleu	%icc,	%o5,	%o3
	fands	%f25,	%f27,	%f6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	lduh	[%l7 + 0x6A],	%o0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	nop
	setx loop_459, %l0, %l1
	jmpl %l1, %g4
	fmovsge	%icc,	%f16,	%f7
	movcs	%icc,	%l5,	%i2
	rdpr	%canrestore,	%o6
loop_459:
	movrgz	%i5,	0x158,	%g5
	movne	%xcc,	%i0,	%i3
	wr	%g7,	%o1,	%softint
	wr	%g0,	0x19,	%asi
	ldsba	[%l7 + 0x6D] %asi,	%i7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x388, 	%hsys_tick_cmpr
	rd	%pc,	%o4
	rdhpr	%hintp,	%i6
	rdhpr	%hpstate,	%g3
	rdhpr	%hintp,	%i1
	move	%icc,	%l6,	%l1
	rd	%sys_tick_cmpr,	%o7
	orncc	%g6,	0x0829,	%g2
	rdhpr	%hintp,	%l3
	popc	%o2,	%l2
	wr	%o5,	%l0,	%y
	rd	%pc,	%o3
	rdhpr	%htba,	%l4
	fcmps	%fcc3,	%f11,	%f3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x68E, 	%tick_cmpr
	rdhpr	%hintp,	%g4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xF14, 	%hsys_tick_cmpr
	edge32ln	%g1,	%i5,	%o6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x496, 	%hsys_tick_cmpr
	movrlz	%g7,	0x35E,	%o1
	wrpr	%i7,	%o4,	%cwp
	rdhpr	%htba,	%i4
	movpos	%icc,	%g3,	%i6
	tcc	%xcc,	0x4
	rdhpr	%hintp,	%i1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x066, 	%hsys_tick_cmpr
	wr	%g0,	0x0c,	%asi
	stba	%g6,	[%l7 + 0x3D] %asi
	te	%icc,	0x7
	ldstub	[%l7 + 0x17],	%g2
	rdhpr	%hsys_tick_cmpr,	%l3
	rd	%softint,	%l6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xB9C, 	%hsys_tick_cmpr
	edge16ln	%o2,	%o5,	%o3
	rdpr	%tl,	%l4
	wrpr	%o0,	0x06E3,	%pil
	fmovsleu	%xcc,	%f20,	%f21
	fandnot1s	%f8,	%f19,	%f29
	rdhpr	%hpstate,	%g4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%canrestore,	%i2
	edge16l	%g1,	%i5,	%o6
	rd	%ccr,	%i0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%tl,	%g7
	fcmple16	%f30,	%f4,	%o1
	rd	%pc,	%i7
	fbu,a	%fcc2,	loop_460

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x4FC, 	%hsys_tick_cmpr
	membar	0x11
loop_460:
	wr	%i6,	0x1EF9,	%clear_softint
	edge8l	%i4,	%l1,	%o7
	rdhpr	%htba,	%g6
	rdhpr	%hpstate,	%g2
	fbuge,a	%fcc3,	loop_461
	wrpr	%l3,	%l6,	%cwp
	bcc,pn	%icc,	loop_462
	xnor	%i1,	0x1B02,	%o2
loop_461:
	wrpr	%l2,	0x092B,	%tick
	sdiv	%o5,	0x0EA4,	%o3
loop_462:
	wrpr	%l4,	0x0C20,	%tick
	fmovsvc	%xcc,	%f19,	%f3
	tg	%icc,	0x3
	rdhpr	%htba,	%g4
	rdhpr	%hintp,	%o0
	wrpr	%i2,	%l0,	%tick
	or	%i5,	0x1D26,	%g1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xC26, 	%hsys_tick_cmpr
	wrpr	%l5,	0x0B69,	%cwp
	rd	%ccr,	%g5
	rdpr	%otherwin,	%o1
	wrpr	%g7,	0x0888,	%tick
	bshuffle	%f20,	%f28,	%f6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xD2D, 	%hsys_tick_cmpr
	rdhpr	%hintp,	%g3
	sdivcc	%i7,	0x1FC8,	%i6
	wrpr	%i4,	0x07E9,	%cwp
	movcc	%icc,	%o7,	%l1
	rdpr	%canrestore,	%g6
	rdhpr	%hintp,	%g2
	faligndata	%f6,	%f12,	%f8
	wr	%l6,	%i1,	%ccr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x5B3, 	%tick_cmpr
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	rd	%pc,	%l3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%o3,	0x1DCE,	%ccr
	fsrc2s	%f2,	%f29
	wrpr	%l4,	%l2,	%tick
	wr	%g4,	%i2,	%sys_tick
	add	%l7,	0x40,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%l0
	casxa	[%l6] 0x80,	%l0,	%o0
	fnegs	%f3,	%f12
	wr	%g1,	%i5,	%y
	movcs	%icc,	%o6,	%l5
	movrne	%i0,	%o1,	%g5
	flushw
	rd	%tick_cmpr,	%g7
	tsubcc	%o4,	%g3,	%i3
	wrpr	%i6,	%i4,	%cwp
	wrpr	%i7,	0x0FAF,	%cwp
	rdhpr	%hintp,	%l1
	movleu	%xcc,	%o7,	%g6
	addc	%g2,	0x0DBA,	%i1
	wr 	%g0, 	0x6, 	%fprs
	rd	%sys_tick_cmpr,	%o5
	rd	%pc,	%o3
	wr	%o2,	%l2,	%sys_tick
	rdhpr	%hpstate,	%g4
	rd	%tick_cmpr,	%i2
	orcc	%l4,	%o0,	%l0
	tgu	%icc,	0x1
	rd	%ccr,	%g1
	rdpr	%cwp,	%i5
	wrpr	%o6,	0x090E,	%tick
	array16	%i0,	%o1,	%l5
	brlz,a	%g5,	loop_463
	tn	%xcc,	0x5
	rdpr	%otherwin,	%g7
	rdpr	%tl,	%g3
loop_463:
	rdpr	%tl,	%i3
	fsrc2	%f24,	%f28
	wrpr	%o4,	%i4,	%tick
	fbuge	%fcc3,	loop_464
	tcs	%xcc,	0x4
	nop
	set	0x64, %g4
	prefetch	[%l7 + %g4],	 0x3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_464:
	fmovd	%f20,	%f24
	movl	%icc,	%i6,	%i7
	ldsb	[%l7 + 0x4E],	%l1
	udivx	%g6,	0x1410,	%o7
	rdhpr	%hsys_tick_cmpr,	%g2
	rdpr	%cleanwin,	%i1
	rdpr	%gl,	%l3
	rdpr	%cansave,	%l6
	rd	%softint,	%o5
	movcc	%xcc,	%g4,	%l2
	rd	%ccr,	%i2
	fbl	%fcc0,	loop_465
	wr	%l4,	0x06C1,	%sys_tick
	set	0x13, %l1
	stba	%o0,	[%l7 + %l1] 0x10
loop_465:
	wrpr	%g1,	%l0,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%o1,	0x0C9D,	%tick
	wr	%i0,	%l5,	%softint
	rdpr	%gl,	%g5
	wr	%g7,	0x1CCD,	%ccr
	rdhpr	%htba,	%i3
	rdhpr	%hintp,	%g3
	movpos	%icc,	%i6,	%i7
	wrpr	%i4,	0x0B99,	%tick
	rdhpr	%hpstate,	%g6
	rdpr	%canrestore,	%o7
	sdiv	%l1,	0x009D,	%i1
	rd	%y,	%l3
	rdpr	%otherwin,	%g2
	mulscc	%o5,	0x16D4,	%o2
	fpsub16	%f30,	%f28,	%f28
	tgu	%icc,	0x4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xBEA, 	%hsys_tick_cmpr
	rdhpr	%hpstate,	%o3
	rd	%pc,	%g4
	udivcc	%i2,	0x06FA,	%l2
	movcc	%icc,	%o0,	%l4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fbo,a	%fcc0,	loop_466
	rdhpr	%htba,	%l0
	srlx	%o6,	0x10,	%i0
	alignaddrl	%o1,	%l5,	%g5
loop_466:
	rdpr	%tba,	%i3
	subcc	%g7,	0x11AF,	%g3
	edge8n	%i6,	%o4,	%i7
	add	%l7,	0x60,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%g6,	%o7
	andncc	%i4,	%i1,	%l3
	wr	%l1,	%g2,	%set_softint
	bvs,a,pn	%xcc,	loop_467
	wrpr	%o5,	0x09DD,	%tick
	wr	%o2,	%l6,	%y
	add	%l7,	0x28,	%l6
	wr	%g0,	0x0c,	%asi
	ldxa	[%l6] %asi,	%o3
	casxa	[%l6] %asi,	%o3,	%i2
loop_467:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xD97, 	%tick_cmpr
	rd	%sys_tick_cmpr,	%g4
	wrpr	%l4,	0x0121,	%pil
	rdhpr	%hpstate,	%o0
	wrpr	%g1,	%i5,	%cwp
	wrpr	%o6,	%i0,	%cwp
	rdpr	%cansave,	%o1
	fbne	%fcc0,	loop_468
	fcmpd	%fcc1,	%f22,	%f2
	edge32l	%l5,	%l0,	%i3
	fbuge	%fcc1,	loop_469
loop_468:
	bvs,pn	%icc,	loop_470
	wr	%g5,	%g3,	%set_softint
	te	%xcc,	0x7
loop_469:
	wrpr	%g7,	%o4,	%cwp
loop_470:
	movneg	%icc,	%i7,	%i6
	rdpr	%cansave,	%o7
	wr	%l3,	%i1,	%softint
	fcmpes	%fcc0,	%f11,	%f10
	rdhpr	%hpstate,	%g2
	wrpr	%o5,	%l1,	%pil
	orncc	%o2,	%o3,	%l6
	rdpr	%canrestore,	%l2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wrpr	%i2,	%l4,	%pil
	rdhpr	%hpstate,	%o0
	wr	%g1,	0x04FB,	%softint
	rdhpr	%hpstate,	%g4
	tl	%icc,	0x2
	wr	%g0,	0x11,	%asi
	ldxa	[%l7 + 0x70] %asi,	%i5
	fpadd32	%f4,	%f0,	%f10
	rdpr	%canrestore,	%o6
	wr	%i0,	0x0235,	%ccr
	wrpr	%o1,	0x0510,	%pil
	rdhpr	%hsys_tick_cmpr,	%l5
	movgu	%icc,	%l0,	%g5
	array8	%g3,	%i3,	%o4
	rd	%ccr,	%g7
	rdhpr	%hpstate,	%i6
	wr	%i7,	%i4,	%ccr
	rdhpr	%hsys_tick_cmpr,	%o7
	sdivcc	%g6,	0x16AA,	%l3
	array16	%g2,	%i1,	%o5
	fcmped	%fcc1,	%f26,	%f0
	rdpr	%canrestore,	%o2
	tleu	%icc,	0x3
	tle	%xcc,	0x5
	rdpr	%canrestore,	%o3
	rd	%ccr,	%l6
	wr 	%g0, 	0x5, 	%fprs
	wrpr	%i2,	%l4,	%pil
	alignaddr	%o0,	%l1,	%g4
	movrgz	%i5,	%o6,	%i0
	fornot1	%f12,	%f28,	%f12

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	rd	%y,	%l0
	rd	%ccr,	%g5
	rdhpr	%htba,	%g1
	set	0x40, %i2
	ldda	[%l7 + %i2] 0x24,	%g2
	rd	%pc,	%i3
	wrpr	%o4,	0x186A,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x864, 	%hsys_tick_cmpr
	set	0x7A, %g3
	lduba	[%l7 + %g3] 0x81,	%i4
	edge32l	%o7,	%g6,	%l3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	movgu	%xcc,	%g7,	%i1
	rdhpr	%hintp,	%o5
	wrpr	%o3,	0x01F4,	%tick
	rdhpr	%hpstate,	%l6
	tvc	%icc,	0x3
	stx	%o2,	[%l7 + 0x58]

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fnot1s	%f22,	%f4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xE6B, 	%hsys_tick_cmpr
	mulx	%o0,	0x05AC,	%l1
	movleu	%icc,	%g4,	%i5
	mulscc	%i2,	0x03F2,	%o6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xC1C, 	%hsys_tick_cmpr
	sllx	%i0,	%l5,	%l0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%asi,	%g3
	andcc	%g1,	%o4,	%i3
	rdhpr	%hsys_tick_cmpr,	%i7
	sll	%i4,	%i6,	%o7
	bvc,a,pn	%icc,	loop_471
	rd	%softint,	%g6
	rdpr	%wstate,	%g2
	wr	%l3,	%g7,	%ccr
loop_471:
	rdhpr	%hpstate,	%i1
	addc	%o5,	0x09F0,	%o3
	rdpr	%otherwin,	%o2
	and	%l2,	%l6,	%o0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	rdhpr	%hpstate,	%l1
	rd	%asi,	%l4
	fbule,a	%fcc1,	loop_472
	rdpr	%cleanwin,	%g4
	wrpr	%i2,	0x14D1,	%cwp
	fmovsl	%icc,	%f1,	%f11
loop_472:
	rd	%asi,	%o6
	rdpr	%gl,	%o1
	rdpr	%cansave,	%i5
	wrpr	%l5,	%i0,	%pil
	movgu	%icc,	%l0,	%g5
	rdhpr	%hsys_tick_cmpr,	%g1
	wr	%g0,	0x11,	%asi
	ldsha	[%l7 + 0x4E] %asi,	%o4
	rd	%ccr,	%g3
	rdpr	%gl,	%i3
	rdpr	%pil,	%i7
	set	0x68, %l0
	lduwa	[%l7 + %l0] 0x10,	%i6
	bcs,a	%icc,	loop_473
	movre	%o7,	%i4,	%g2
	rdhpr	%htba,	%l3
	rdpr	%cleanwin,	%g6
loop_473:
	fmovdge	%icc,	%f25,	%f29

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xBFE, 	%hsys_tick_cmpr
	rdpr	%cleanwin,	%o5
	wrpr	%o3,	%o2,	%tick
	edge16n	%l2,	%g7,	%o0
	tleu	%xcc,	0x7
	mova	%xcc,	%l6,	%l4
	addccc	%g4,	0x09BA,	%i2
	sllx	%o6,	0x14,	%o1
	rdpr	%canrestore,	%i5
	wr	%l1,	%i0,	%set_softint
	mulscc	%l5,	%l0,	%g5
	ldsw	[%l7 + 0x38],	%o4
	rd	%asi,	%g3
	xnorcc	%g1,	0x0A8B,	%i3
	fmovrdne	%i6,	%f22,	%f8
	rdpr	%cansave,	%o7
	lduw	[%l7 + 0x18],	%i7
	brgez,a	%g2,	loop_474
	taddcctv	%i4,	%l3,	%g6
	wrpr	%o5,	%i1,	%cwp
	rdhpr	%hsys_tick_cmpr,	%o2
loop_474:
	andncc	%l2,	%o3,	%o0
	movne	%xcc,	%l6,	%g7
	rd	%fprs,	%l4
	wr	%i2,	%o6,	%sys_tick
	fbg	%fcc2,	loop_475
	rdpr	%otherwin,	%g4
	smul	%o1,	0x1C83,	%i5
	wrpr	%i0,	0x04B4,	%pil
loop_475:
	rd	%pc,	%l1
	rd	%asi,	%l5
	rd	%sys_tick_cmpr,	%l0
	tsubcctv	%o4,	%g3,	%g5
	wr	%i3,	0x1D89,	%ccr
	rd	%fprs,	%g1
	movn	%xcc,	%i6,	%i7
	tsubcc	%g2,	0x092D,	%o7
	flushw
	rdpr	%otherwin,	%l3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fmovdcs	%xcc,	%f1,	%f2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x147, 	%hsys_tick_cmpr
	be,pn	%icc,	loop_476
	movleu	%icc,	%o5,	%o3
	rdpr	%cleanwin,	%o0
	fcmpeq32	%f10,	%f18,	%l6
loop_476:
	rd	%fprs,	%g7
	rdpr	%cleanwin,	%l2
	rdpr	%canrestore,	%l4
	ldsw	[%l7 + 0x78],	%o6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%canrestore,	%o1
	rd	%tick_cmpr,	%i5
	fmovdneg	%icc,	%f7,	%f12

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	mulscc	%i0,	0x02EC,	%l5
	tge	%icc,	0x6
	rd	%y,	%l1
	rdhpr	%hintp,	%o4
	wr	%g3,	0x131D,	%ccr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x64F, 	%sys_tick_cmpr
	mulx	%l0,	%g1,	%i6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x85A, 	%hsys_tick_cmpr
	brgz	%g2,	loop_477
	xor	%o7,	0x0EF4,	%i3
	fba	%fcc0,	loop_478
	rdhpr	%htba,	%g6
loop_477:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xB5C, 	%hsys_tick_cmpr
	wr	%i1,	0x0A50,	%pic
loop_478:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	srl	%o5,	0x0D,	%o2
	addcc	%o0,	%o3,	%g7
	fmovdle	%xcc,	%f22,	%f19
	set	0x40, %o2
	swapa	[%l7 + %o2] 0x0c,	%l2
	movne	%icc,	%l4,	%l6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%cwp,	%i5
	fbge,a	%fcc1,	loop_479
	fornot1s	%f14,	%f19,	%f16
	rdhpr	%hsys_tick_cmpr,	%o1
	movrne	%g4,	%l5,	%l1
loop_479:
	rd	%softint,	%o4
	nop
	set	0x3C, %o7
	ldsh	[%l7 + %o7],	%i0
	taddcctv	%g5,	%l0,	%g3
	ldsb	[%l7 + 0x43],	%g1
	wrpr	%i6,	0x03CC,	%cwp
	bvs,pt	%icc,	loop_480
	wr	%i7,	%g2,	%clear_softint
	srlx	%o7,	0x1C,	%g6
	rd	%softint,	%i3
loop_480:
	swap	[%l7 + 0x2C],	%i1
	wr	%i4,	0x0706,	%y
	rdpr	%cansave,	%l3
	fmovsgu	%xcc,	%f6,	%f30
	movne	%xcc,	%o5,	%o2
	rdpr	%cwp,	%o3
	move	%xcc,	%g7,	%l2
	rd	%sys_tick_cmpr,	%o0
	sdivcc	%l6,	0x021B,	%i2
	set	0x1C, %o0
	ldsba	[%l7 + %o0] 0x14,	%l4
	rdhpr	%htba,	%o6
	rdpr	%canrestore,	%o1
	wrpr	%i5,	0x0085,	%cwp
	wr	%g0,	0x18,	%asi
	ldstuba	[%l7 + 0x10] %asi,	%g4
	addcc	%l5,	%o4,	%l1
	brgez,a	%g5,	loop_481
	fpmerge	%f24,	%f27,	%f14
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wrpr	%i0,	0x0E2A,	%cwp
loop_481:
	rdpr	%cansave,	%l0
	orcc	%g1,	%g3,	%i6
	movpos	%icc,	%g2,	%i7
	rd	%sys_tick_cmpr,	%g6
	brlez,a	%i3,	loop_482
	rdhpr	%htba,	%i1
	rdpr	%otherwin,	%i4
	fbue	%fcc0,	loop_483
loop_482:
	tn	%xcc,	0x1
	rdhpr	%hintp,	%o7
	ldsb	[%l7 + 0x2A],	%o5
loop_483:
	sdivcc	%l3,	0x1E28,	%o2
	rd	%sys_tick_cmpr,	%g7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fmovdne	%icc,	%f29,	%f6
	edge32n	%o3,	%l6,	%i2
	wrpr	%l4,	%o0,	%cwp
	wr	%o1,	%i5,	%sys_tick
	rd	%pc,	%g4
	movleu	%icc,	%l5,	%o4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%cansave,	%l1
	tleu	%xcc,	0x6
	stx	%i0,	[%l7 + 0x50]
	rd	%fprs,	%l0
	brlz	%g3,	loop_484
	popc	%i6,	%g2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xD65, 	%hsys_tick_cmpr
	rd	%pc,	%i3
loop_484:
	fcmpne16	%f24,	%f12,	%g6
	addc	%i1,	%i4,	%o5
	fmovs	%f23,	%f30
	fnands	%f17,	%f8,	%f6
	brlez	%l3,	loop_485
	wr	%o2,	%o7,	%sys_tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	or	%g7,	0x0AC6,	%l6
loop_485:
	rdpr	%pil,	%i2
	rd	%tick_cmpr,	%l4
	movl	%icc,	%o3,	%o1
	andcc	%i5,	0x1A34,	%g4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%l5,	0x1176,	%pil
	rdpr	%cleanwin,	%o6
	add	%l7,	0x20,	%l6
	wr	%g0,	0x18,	%asi
	casxa	[%l6] 0x18,	%o4,	%i0
	wr	%l1,	0x0496,	%sys_tick
	rdhpr	%hsys_tick_cmpr,	%l0
	fmovrse	%g5,	%f14,	%f11
	or	%g3,	0x1F48,	%g2
	rdhpr	%htba,	%g1
	rdhpr	%hpstate,	%i6
	fmovrdne	%i3,	%f30,	%f18
	bge	%icc,	loop_486
	wr 	%g0, 	0x6, 	%fprs
	rdhpr	%hsys_tick_cmpr,	%i1
	rdpr	%tl,	%o5
loop_486:
	rd	%fprs,	%l3
	wrpr	%i4,	%o7,	%cwp
	bl,a	loop_487
	stw	%o2,	[%l7 + 0x70]
	fmovdcs	%icc,	%f29,	%f22
	wr	%g7,	0x03D4,	%y
loop_487:
	rd	%y,	%l6
	movne	%icc,	%l2,	%l4
	sdivx	%i2,	0x016A,	%o3
	wr	%i5,	0x1383,	%sys_tick
	wrpr	%g4,	%o1,	%cwp
	wrpr	%l5,	0x132E,	%cwp
	swap	[%l7 + 0x3C],	%o6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x8AA, 	%hsys_tick_cmpr
	wr	%g0,	0x11,	%asi
	sta	%f18,	[%l7 + 0x10] %asi
	rd	%softint,	%o4
	andcc	%l1,	%l0,	%i0
	rd	%fprs,	%g5
	rdpr	%otherwin,	%g2
	fpackfix	%f12,	%f6
	movge	%xcc,	%g3,	%i6
	sir	0x0E4E
	fmovrdne	%i3,	%f6,	%f14
	edge8	%g1,	%g6,	%i1
	rdhpr	%htba,	%o5
	srl	%i7,	%l3,	%o7
	ldsb	[%l7 + 0x1E],	%i4
	wr	%g0,	0x10,	%asi
	ldswa	[%l7 + 0x24] %asi,	%l6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	wrpr	%o3,	%i5,	%pil
	rdpr	%wstate,	%g4
	tleu	%icc,	0x7
	rdhpr	%hpstate,	%o1
	edge32ln	%i2,	%l5,	%o6
	rdhpr	%hintp,	%o4
	wr	%g0,	0x89,	%asi
	ldstuba	[%l7 + 0x60] %asi,	%o0
	wr	%l0,	%l1,	%pic
	movrne	%i0,	%g2,	%g3
	rd	%fprs,	%g5
	orcc	%i6,	%i3,	%g6
	sdivx	%g1,	0x036B,	%i1
	tsubcc	%i7,	0x0B43,	%o5
	rd	%ccr,	%o7
	rdpr	%otherwin,	%l3
	movvs	%xcc,	%i4,	%o2
	bl,pn	%xcc,	loop_488
	wr	%l6,	%l2,	%sys_tick
	addc	%g7,	%o3,	%i5
	rdhpr	%hpstate,	%g4
loop_488:
	tneg	%xcc,	0x1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x742, 	%hsys_tick_cmpr
	wr	%l4,	0x0182,	%clear_softint
	movneg	%icc,	%i2,	%l5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x210, 	%tick_cmpr
	edge16ln	%o6,	%l0,	%o0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	tsubcc	%g5,	%i6,	%g6
	stw	%i3,	[%l7 + 0x74]
	udivcc	%i1,	0x1B05,	%i7
	wrpr	%g1,	0x1E1B,	%cwp
	smulcc	%o7,	0x16DE,	%o5
	rdhpr	%hsys_tick_cmpr,	%l3
	umulcc	%i4,	0x1A41,	%o2
	rdhpr	%htba,	%l6
	rdhpr	%hintp,	%g7
	movrne	%o3,	0x0F9,	%i5
	rdpr	%pil,	%l2
	tvs	%xcc,	0x2
	brz,a	%o1,	loop_489
	tvc	%xcc,	0x3
	rdhpr	%hpstate,	%g4
	wrpr	%l4,	0x1309,	%tick
loop_489:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	edge8	%o6,	%l5,	%l0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%l1,	0x0F0B,	%softint
	movneg	%xcc,	%g3,	%i0
	rdhpr	%hintp,	%g2
	sll	%i6,	0x03,	%g5
	xnorcc	%i3,	0x108F,	%g6
	rdpr	%canrestore,	%i1
	movg	%icc,	%g1,	%o7
	wr	%o5,	%i7,	%softint
	rdpr	%cwp,	%l3
	set	0x24, %g5
	lda	[%l7 + %g5] 0x18,	%f21
	rdhpr	%hpstate,	%o2
	rd	%softint,	%l6
	wrpr	%i4,	%o3,	%cwp
	addccc	%i5,	%g7,	%l2
	smulcc	%o1,	0x056A,	%l4
	rdhpr	%htba,	%g4
	fmovdne	%xcc,	%f1,	%f13
	sll	%o4,	%o6,	%i2
	movl	%icc,	%l5,	%o0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xC61, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	flushw
	tne	%xcc,	0x0
	rdpr	%gl,	%g2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	alignaddr	%i6,	%g6,	%i1
	flushw
	set	0x08, %i1
	ldsha	[%l7 + %i1] 0x19,	%i3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	tpos	%icc,	0x6
	edge16n	%o5,	%i7,	%l3
	rd	%tick_cmpr,	%g1
	rd	%sys_tick_cmpr,	%l6
	rdpr	%cansave,	%i4
	rd	%sys_tick_cmpr,	%o3
	wr	%i5,	0x1E42,	%sys_tick
	xnor	%o2,	0x04E5,	%l2
	andcc	%o1,	%l4,	%g7
	rdpr	%tba,	%g4
	rdpr	%cleanwin,	%o6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xCAB, 	%hsys_tick_cmpr
	nop
	setx	loop_490,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	rdhpr	%hsys_tick_cmpr,	%o0
	add	%l7,	0x78,	%l6
	wr	%g0,	0x10,	%asi
	ldxa	[%l6] %asi,	%l0
	casxa	[%l6] %asi,	%l0,	%g3
loop_490:
	array32	%i0,	%l5,	%l1
	fcmpgt16	%f22,	%f14,	%g5
	membar	0x7E
	rd	%softint,	%i6
	bge	%xcc,	loop_491
	rdhpr	%htba,	%g6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	rd	%pc,	%g2
loop_491:
	subccc	%i3,	%o7,	%i1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xC4F, 	%hsys_tick_cmpr
	wr	%l3,	%i7,	%sys_tick
	movg	%xcc,	%l6,	%i4
	nop
	set	0x5C, %i0
	stw	%o3,	[%l7 + %i0]
	wrpr	%i5,	0x1DFB,	%cwp
	wrpr	%o2,	%g1,	%tick
	be	%xcc,	loop_492
	rd	%tick_cmpr,	%l2
	wrpr	%o1,	0x0C0E,	%pil
loop_492:
	fxors	%f4,	%f1,	%f12
	wr	%o6,	0x0D2D,	%ccr
	nop
	setx loop_493, %l0, %l1
	jmpl %l1, %g4
	orcc	%o4,	0x0764,	%i2
	wrpr	%o0,	0x1F0E,	%pil
	edge8l	%l0,	%g3,	%l5
loop_493:
	wr	%i0,	%l1,	%sys_tick
	rd	%sys_tick_cmpr,	%g5
	wr	%g0,	0x10,	%asi
	lduba	[%l7 + 0x3C] %asi,	%g6
	rd	%fprs,	%g2
	fexpand	%f17,	%f4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x0BD, 	%hsys_tick_cmpr
	wrpr	%i1,	0x1DD1,	%pil
	wr	%g0,	0x19,	%asi
	ldsba	[%l7 + 0x34] %asi,	%i3
	wrpr	%o5,	0x19D4,	%pil
	movneg	%icc,	%l3,	%i7
	or	%i4,	0x1F40,	%l6
	wr	%o3,	%i5,	%pic
	movre	%o2,	%g1,	%o1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%asi,	%o6
	fnot2s	%f12,	%f25
	rdhpr	%hpstate,	%l2
	wr 	%g0, 	0x5, 	%fprs
	wrpr	%g4,	%i2,	%tick
	wr	%g0,	0x04,	%asi
	prefetcha	[%l7 + 0x78] %asi,	 0x3
	sir	0x1083

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x70D, 	%hsys_tick_cmpr
	movneg	%icc,	%i0,	%l1
	sth	%o0,	[%l7 + 0x1C]
	wrpr	%g6,	0x057D,	%tick
	bneg,a,pt	%icc,	loop_494
	std	%g4,	[%l7 + 0x68]
	st	%f22,	[%l7 + 0x40]
	tne	%xcc,	0x3
loop_494:
	nop
	wr	%g0,	0x0c,	%asi
	ldda	[%l7 + 0x10] %asi,	%g2
	rd	%sys_tick_cmpr,	%i6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	set	0x58, %g7
	ldsba	[%l7 + %g7] 0x80,	%o7
	alignaddr	%i3,	%o5,	%i7
	wr	%g0,	0x89,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	fpack16	%f14,	%f9
	tge	%xcc,	0x2
	movcc	%icc,	%l3,	%l6
	fmovdg	%icc,	%f22,	%f4
	rdhpr	%hsys_tick_cmpr,	%i4
	rdhpr	%hsys_tick_cmpr,	%i5
	wr	%g0,	0x18,	%asi
	stha	%o3,	[%l7 + 0x7C] %asi
	rdhpr	%htba,	%g1
	smul	%o2,	%o1,	%l4
	wrpr	%o6,	%l2,	%tick
	edge16n	%o4,	%g7,	%g4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xC83, 	%sys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	ta	%xcc,	0x1
	orcc	%g6,	0x1B3D,	%g5
	rd	%ccr,	%o0
	subcc	%g2,	%i6,	%i1
	fmovsgu	%xcc,	%f4,	%f27
	umulcc	%i3,	%o5,	%i7
	bvc,a	%icc,	loop_495
	rd	%asi,	%l3
	ta	%xcc,	0x4
	wrpr	%l6,	%o7,	%tick
loop_495:
	wr	%i4,	0x04ED,	%clear_softint
	wrpr	%i5,	%g1,	%pil
	wr	%o2,	0x0EAD,	%softint
	movleu	%icc,	%o1,	%l4
	xorcc	%o6,	0x0EEF,	%o3
	wrpr	%l2,	%o4,	%pil
	rdpr	%gl,	%g7
	wr 	%g0, 	0x6, 	%fprs
	rdpr	%canrestore,	%i2
	stw	%g3,	[%l7 + 0x54]
	wr	%i0,	0x0411,	%clear_softint

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x200, 	%hsys_tick_cmpr
	rd	%ccr,	%l1
	wr	%g6,	0x109B,	%clear_softint
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	rdhpr	%hintp,	%g5
	rd	%asi,	%g2
	fcmpeq16	%f22,	%f4,	%o0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%sys_tick_cmpr,	%i3
	wr	%o5,	0x124C,	%pic
	fcmpd	%fcc0,	%f18,	%f10
	rdhpr	%hsys_tick_cmpr,	%i7
	movrgez	%l6,	%l3,	%o7
	movl	%xcc,	%i4,	%i5
	fnors	%f9,	%f31,	%f11
	rdpr	%cleanwin,	%g1
	wrpr	%o2,	%l4,	%pil
	edge8ln	%o1,	%o6,	%o3
	fbge,a	%fcc2,	loop_496
	wr	%l2,	%o4,	%pic
	wrpr	%g7,	0x1DCB,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xEB2, 	%hsys_tick_cmpr
loop_496:
	movvc	%icc,	%g3,	%l0
	set	0x22, %l5
	lduba	[%l7 + %l5] 0x10,	%i0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%htba,	%g5
	tsubcc	%g2,	0x0155,	%g6
	rdpr	%cansave,	%i6
	fmovdl	%icc,	%f0,	%f1
	rdhpr	%hsys_tick_cmpr,	%o0
	and	%i1,	%o5,	%i3
	movrgez	%l6,	0x3AA,	%l3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x618, 	%hsys_tick_cmpr
	wr	%o7,	%i5,	%set_softint
	wr	%i4,	0x062B,	%pic
	stx	%g1,	[%l7 + 0x28]
	rdhpr	%hintp,	%l4
	rdpr	%pil,	%o1
	smulcc	%o2,	0x1C70,	%o3
	wr	%o6,	%o4,	%ccr
	wr	%g7,	%g4,	%softint
	wr	%l2,	%i2,	%pic

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	movne	%icc,	%i0,	%l1
	edge32n	%l5,	%l0,	%g2
	movrgz	%g5,	0x16A,	%i6
	tn	%icc,	0x3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fmovsneg	%icc,	%f26,	%f14
	fmovrdlz	%o5,	%f12,	%f6
	rdhpr	%hintp,	%o0
	srlx	%i3,	0x14,	%l3
	wrpr	%i7,	0x10EA,	%tick
	umul	%l6,	0x0EDC,	%o7
	edge8ln	%i5,	%i4,	%l4
	rdpr	%tba,	%o1
	rdhpr	%hpstate,	%o2
	rdpr	%cwp,	%o3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	wrpr	%g1,	0x0F65,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xE50, 	%hsys_tick_cmpr
	xnor	%g7,	0x1378,	%l2
	rdhpr	%htba,	%g4
	bg,pn	%xcc,	loop_497
	rdpr	%canrestore,	%i2
	tle	%icc,	0x4
	alignaddrl	%g3,	%l1,	%i0
loop_497:
	rd	%y,	%l0
	rdhpr	%hpstate,	%l5
	rdpr	%otherwin,	%g5
	fmul8x16au	%f21,	%f6,	%f28
	sra	%g2,	0x1D,	%g6
	rdpr	%tl,	%i1
	rd	%ccr,	%i6
	rd	%ccr,	%o0
	fmovscs	%icc,	%f19,	%f29

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%g0,	0x2f,	%asi
	stha	%i3,	[%l7 + 0x22] %asi
	membar	#Sync
	wrpr	%i7,	%l3,	%tick
	wrpr	%l6,	%o7,	%pil
	edge32	%i5,	%i4,	%l4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	wrpr	%o3,	%o6,	%tick
	rdpr	%wstate,	%g1
	fcmpne16	%f28,	%f0,	%o4
	rdhpr	%htba,	%o2
	sir	0x12AF

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x639, 	%tick_cmpr
	movre	%g4,	%l2,	%g3
	siam	0x3
	rd	%fprs,	%i2
	rd	%y,	%l1
	wrpr	%i0,	0x1838,	%pil
	rdpr	%tl,	%l0
	bg,a,pt	%icc,	loop_498
	rd	%y,	%l5
	wrpr	%g5,	0x108F,	%tick
	rd	%fprs,	%g2
loop_498:
	ta	%xcc,	0x6
	movneg	%xcc,	%i1,	%g6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	tvc	%xcc,	0x5
	rd	%asi,	%o5
	udiv	%i6,	0x106B,	%i3
	rdpr	%cleanwin,	%i7
	rdpr	%canrestore,	%l3
	rdhpr	%hpstate,	%o7
	rdhpr	%htba,	%i5
	orn	%l6,	%l4,	%o1
	lduh	[%l7 + 0x1C],	%o3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xE1A, 	%hsys_tick_cmpr
	rd	%pc,	%i4
	andcc	%o4,	0x0AA4,	%g1
	fbne,a	%fcc3,	loop_499
	sub	%o2,	%g4,	%g7
	wr	%g0,	0x80,	%asi
	stha	%l2,	[%l7 + 0x4E] %asi
loop_499:
	rdhpr	%hpstate,	%i2
	tsubcctv	%l1,	%i0,	%g3
	srl	%l5,	0x16,	%g5
	wrpr	%l0,	%g2,	%pil
	fcmps	%fcc1,	%f14,	%f25
	edge8	%i1,	%g6,	%o0
	fmul8x16al	%f20,	%f17,	%f16

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fnegs	%f18,	%f11
	wrpr	%i7,	0x1CFF,	%cwp
	be,a	%xcc,	loop_500
	wrpr	%l3,	%o7,	%pil
	bg,a,pt	%icc,	loop_501
	std	%f22,	[%l7 + 0x68]
loop_500:
	rdpr	%pil,	%i5
	rdhpr	%hsys_tick_cmpr,	%i3
loop_501:
	movcc	%icc,	%l4,	%o1
	rd	%fprs,	%l6
	rd	%softint,	%o3
	rdhpr	%hsys_tick_cmpr,	%o6
	tge	%icc,	0x5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x1A4, 	%hsys_tick_cmpr
	wr 	%g0, 	0x7, 	%fprs
	stbar
	rdhpr	%hsys_tick_cmpr,	%o2
	fmovscc	%icc,	%f5,	%f9
	rd	%asi,	%g4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	rd	%softint,	%l2
	rdpr	%gl,	%i2
	rdpr	%wstate,	%l1
	fmul8sux16	%f22,	%f22,	%f16
	edge8	%i0,	%g3,	%g7
	rdhpr	%hsys_tick_cmpr,	%l5
	fbug,a	%fcc1,	loop_502
	or	%l0,	0x03A0,	%g2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xD1A, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_502:
	wrpr	%i6,	%i7,	%tick
	wr	%l3,	%o5,	%set_softint
	rdhpr	%hsys_tick_cmpr,	%i5
	wr	%i3,	0x1A21,	%sys_tick
	rdhpr	%htba,	%l4
	rd	%asi,	%o1
	wrpr	%o7,	0x1370,	%cwp
	rd	%ccr,	%o3
	wr	%g0,	0x80,	%asi
	swapa	[%l7 + 0x20] %asi,	%l6
	fornot2	%f26,	%f28,	%f28

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	andn	%o6,	0x174A,	%g1
	fcmple32	%f22,	%f4,	%g4
	sdivx	%o4,	0x1089,	%l2
	wr	%o2,	0x06D2,	%clear_softint
	fmovdge	%xcc,	%f6,	%f7
	fbl	%fcc1,	loop_503
	bl,a	loop_504
	rdpr	%cleanwin,	%l1
	umulcc	%i0,	0x0D97,	%i2
loop_503:
	rd	%fprs,	%g7
loop_504:
	bg,pn	%xcc,	loop_505
	fbg,a	%fcc2,	loop_506
	wrpr	%l5,	0x0B77,	%cwp
	edge32ln	%l0,	%g2,	%g5
loop_505:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_506:
	te	%icc,	0x7
	rdhpr	%htba,	%o0
	rdhpr	%hintp,	%i1
	rdhpr	%hintp,	%g6
	rdhpr	%hintp,	%i6
	wrpr	%l3,	0x0094,	%pil
	brnz,a	%o5,	loop_507
	rd	%sys_tick_cmpr,	%i5
	add	%l7,	0x58,	%l6
	wr	%g0,	0x10,	%asi
	ldxa	[%l6] %asi,	%i7
	casxa	[%l6] %asi,	%i7,	%i3
loop_507:
	wrpr	%l4,	%o1,	%tick
	wr	%o3,	%o7,	%y
	wr	%g0,	0x04,	%asi
	ldxa	[%l7 + 0x48] %asi,	%i4
	fcmps	%fcc3,	%f20,	%f17
	rd	%pc,	%l6
	wr	%o6,	0x175C,	%clear_softint
	set	0x40, %l4
	ldda	[%l7 + %l4] 0x27,	%g0
	rd	%softint,	%g4
	xorcc	%o4,	%l2,	%o2
	rdpr	%otherwin,	%i0
	rd	%tick_cmpr,	%i2
	ldd	[%l7 + 0x28],	%l0
	rdhpr	%hintp,	%l5
	smulcc	%g2,	0x1618,	%g3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x5EC, 	%hsys_tick_cmpr
	rd	%fprs,	%i1
	rd	%fprs,	%i6
	wrpr	%g6,	0x1DA2,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%i5,	%i7,	%tick
	fone	%f6
	fmovscc	%xcc,	%f13,	%f10
	fmul8ulx16	%f24,	%f28,	%f8
	subccc	%l3,	0x1655,	%l4
	rdpr	%canrestore,	%o1
	fmovsn	%icc,	%f22,	%f31
	rd	%y,	%i3
	rdpr	%gl,	%o3
	rd	%sys_tick_cmpr,	%i4
	rdpr	%gl,	%o7
	fnot2	%f12,	%f22
	movleu	%icc,	%l6,	%o6
	fbo	%fcc1,	loop_508
	wrpr	%g4,	0x0DD9,	%tick
	bleu,a,pn	%icc,	loop_509
	rd	%y,	%g1
loop_508:
	orn	%o4,	0x0EE3,	%o2
	and	%l2,	0x03DB,	%i0
loop_509:
	wr 	%g0, 	0x5, 	%fprs
	edge32ln	%l5,	%l1,	%l0
	fmovsleu	%xcc,	%f13,	%f9
	rdhpr	%hsys_tick_cmpr,	%g7
	and	%g2,	0x06B5,	%g3
	rdpr	%pil,	%o0
	prefetch	[%l7 + 0x10],	 0x2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x7AE, 	%hsys_tick_cmpr
	ble	loop_510
	udivx	%i6,	0x06A3,	%g6
	rdpr	%cleanwin,	%o5
	wrpr	%i7,	%i5,	%tick
loop_510:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xA0F, 	%hsys_tick_cmpr
	rdhpr	%hintp,	%l3
	rd	%tick_cmpr,	%o1
	rdhpr	%hpstate,	%o3
	movpos	%xcc,	%i4,	%i3
	fpadd16	%f4,	%f10,	%f2
	brgz,a	%l6,	loop_511
	rd	%pc,	%o6
	nop
	setx	loop_512,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fbg	%fcc1,	loop_513
loop_511:
	rdhpr	%htba,	%o7
	rd	%asi,	%g1
loop_512:
	wr	%g4,	%o4,	%pic
loop_513:
	tl	%icc,	0x7
	ba,a	loop_514
	wrpr	%o2,	0x0242,	%pil
	rdhpr	%htba,	%l2
	sethi	0x1A68,	%i2
loop_514:
	fble	%fcc1,	loop_515
	wr	%i0,	%l5,	%softint
	wrpr	%l0,	%l1,	%tick
	rdpr	%otherwin,	%g2
loop_515:
	bge,pn	%xcc,	loop_516
	rdpr	%cleanwin,	%g7
	fcmpeq32	%f14,	%f26,	%g3
	rd	%fprs,	%i1
loop_516:
	stx	%g5,	[%l7 + 0x58]
	sir	0x0B58
	addccc	%o0,	%g6,	%o5
	te	%xcc,	0x5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%tba,	%i5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%hpstate,	%i7
	wrpr	%l3,	%o1,	%cwp
	smul	%i4,	%o3,	%i3
	add	%o6,	0x18C1,	%l6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xE7C, 	%hsys_tick_cmpr
	fmovse	%icc,	%f7,	%f13
	sll	%o2,	%o7,	%l2
	sdiv	%i2,	0x05CA,	%i0
	xnorcc	%l0,	0x115E,	%l5
	rd	%sys_tick_cmpr,	%l1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xADA, 	%hsys_tick_cmpr
	or	%g2,	0x1B46,	%g3
	rd	%tick_cmpr,	%g5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	sethi	0x07F2,	%o0
	move	%icc,	%o5,	%g6
	fmovdn	%icc,	%f23,	%f10
	fandnot1s	%f10,	%f20,	%f29
	tneg	%xcc,	0x5
	rd	%ccr,	%i6
	umul	%l4,	0x1216,	%i7
	rd	%softint,	%i5
	udivcc	%l3,	0x06CD,	%i4
	wrpr	%o1,	0x0976,	%pil
	fmovsn	%xcc,	%f29,	%f18
	edge32	%o3,	%i3,	%l6
	fmovs	%f15,	%f23
	subccc	%o6,	%g1,	%o4
	bvc,a,pn	%xcc,	loop_517
	wrpr	%o2,	0x004F,	%tick
	rdhpr	%hsys_tick_cmpr,	%g4
	movpos	%xcc,	%o7,	%l2
loop_517:
	bshuffle	%f24,	%f28,	%f6
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x28
	wr	%g0,	0x4f,	%asi
	ldxa	[%g0 + 0x28] %asi,	%i0
	brlez	%i2,	loop_518
	movrgez	%l0,	0x284,	%l5
	rdpr	%tl,	%l1
	rdpr	%cleanwin,	%g7
loop_518:
	sub	%g3,	0x12F9,	%g2
	fmovrde	%i1,	%f4,	%f6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	movle	%xcc,	%o0,	%i6
	sir	0x021A
	wr 	%g0, 	0x6, 	%fprs
	wrpr	%l3,	%i4,	%cwp
	smul	%i5,	%o1,	%i3
	wrpr	%l6,	%o6,	%tick
	wrpr	%g1,	0x010B,	%pil
	wrpr	%o3,	0x1FAB,	%cwp
	rd	%ccr,	%o4
	srlx	%g4,	0x08,	%o7
	movgu	%xcc,	%l2,	%o2
	movrlz	%i2,	%i0,	%l0
	wr	%g0,	0xf9,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
	flush	%l7 + 0x38
	edge8	%l1,	%g7,	%l5
	wr	%g0,	0x10,	%asi
	stda	%g2,	[%l7 + 0x78] %asi
	wr	%i1,	%g3,	%softint
	wr	%g0,	0x89,	%asi
	prefetcha	[%l7 + 0x30] %asi,	 0x3
	fmovsneg	%icc,	%f4,	%f9
	wrpr	%g5,	0x1761,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%g6,	0x1990,	%set_softint

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%tick_cmpr,	%l3
	rdpr	%canrestore,	%i7
	movne	%icc,	%i4,	%i5
	movge	%xcc,	%o1,	%l6
	movn	%icc,	%i3,	%o6
	rd	%sys_tick_cmpr,	%o3
	subc	%o4,	%g1,	%o7
	edge32n	%g4,	%l2,	%o2
	fmovrslez	%i2,	%f16,	%f29
	wr	%g0,	0x19,	%asi
	ldstuba	[%l7 + 0x6C] %asi,	%i0
	wrpr	%l0,	%l1,	%cwp
	rdhpr	%hsys_tick_cmpr,	%l5
	bleu,a,pn	%xcc,	loop_519
	edge16n	%g7,	%g2,	%g3
	or	%i1,	0x0321,	%o5
	wr	%g5,	%o0,	%softint
loop_519:
	bg,a	%icc,	loop_520
	wrpr	%g6,	%l4,	%cwp
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	set	0x38, %g2
	ldx	[%l7 + %g2],	%i6
loop_520:
	wrpr	%l3,	%i4,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xBF5, 	%hsys_tick_cmpr
	edge16ln	%o1,	%i7,	%i3
	rdpr	%wstate,	%l6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x9C9, 	%hsys_tick_cmpr
	swap	[%l7 + 0x18],	%g1
	rd	%y,	%o4
	rd	%pc,	%g4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%asi,	%i2
	rdhpr	%hsys_tick_cmpr,	%o2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	alignaddrl	%i0,	%g7,	%l5
	fzero	%f4
	alignaddr	%g3,	%i1,	%o5
	wrpr	%g5,	%g2,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%cwp,	%l4
	rdhpr	%htba,	%i6
	rdhpr	%htba,	%i4
	wr 	%g0, 	0x6, 	%fprs
	wrpr	%l3,	%o1,	%tick
	orn	%i7,	%l6,	%i3
	wrpr	%o3,	%o6,	%tick
	movrne	%o4,	%g1,	%g4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xB02, 	%hsys_tick_cmpr
	fmovda	%xcc,	%f26,	%f14

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	rdpr	%wstate,	%l1
	fmovdvc	%xcc,	%f19,	%f13
	rdhpr	%hintp,	%i0
	fcmped	%fcc1,	%f22,	%f18
	rdpr	%gl,	%l5
	tsubcctv	%g3,	%i1,	%o5
	rd	%sys_tick_cmpr,	%g7
	edge32ln	%g5,	%g2,	%o0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xED3, 	%hsys_tick_cmpr
	tleu	%icc,	0x4
	prefetch	[%l7 + 0x78],	 0x3
	ldsb	[%l7 + 0x22],	%g6
	taddcc	%i6,	%i4,	%i5
	rdhpr	%htba,	%l3
	rdhpr	%htba,	%o1
	rdhpr	%hintp,	%i7
	movpos	%xcc,	%l6,	%i3
	wrpr	%o6,	%o4,	%tick
	movne	%icc,	%o3,	%g4
	for	%f14,	%f8,	%f0
	alignaddrl	%o7,	%g1,	%o2
	srax	%l2,	%l0,	%i2
	edge16ln	%l1,	%l5,	%g3
	rd	%y,	%i0
	wrpr	%o5,	0x194E,	%tick
	rdpr	%otherwin,	%g7
	wr	%g5,	0x063D,	%clear_softint
	rdhpr	%hintp,	%i1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%l4,	0x1ACD,	%clear_softint
	rdhpr	%htba,	%o0
	rd	%tick_cmpr,	%i6
	rd	%fprs,	%i5
	rdpr	%tba,	%l3
	rdpr	%cwp,	%i7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	movrgez	%i3,	0x3A3,	%l6
	rdhpr	%htba,	%o4
	rdhpr	%hsys_tick_cmpr,	%o3
	rd	%tick_cmpr,	%o6
	add	%l7,	0x40,	%l6
	wr	%g0,	0x18,	%asi
	ldxa	[%l6] %asi,	%o7
	casxa	[%l6] 0x18,	%o7,	%g1
	rd	%softint,	%o2
	udivx	%g4,	0x17A8,	%l2
	rdpr	%tba,	%i2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xB43, 	%tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x7BD, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x2DD, 	%sys_tick_cmpr
	rdhpr	%hintp,	%g7
	mulscc	%i1,	%g5,	%l4
	wr	%o0,	%i6,	%sys_tick
	tvs	%icc,	0x3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xDE1, 	%hsys_tick_cmpr
	rdpr	%canrestore,	%g6
	wr	%i5,	%i4,	%set_softint
	wrpr	%i7,	0x04CF,	%cwp
	tvc	%icc,	0x1
	fsrc2s	%f13,	%f25
	lduw	[%l7 + 0x3C],	%l3
	wr	%o1,	0x06DE,	%clear_softint

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	rd	%ccr,	%o3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	wr	%o4,	%g1,	%pic
	rdhpr	%htba,	%o7
	subcc	%o2,	0x13C6,	%g4
	wr	%g0,	0x80,	%asi
	stwa	%i2,	[%l7 + 0x5C] %asi
	rdhpr	%htba,	%l2
	rdpr	%tl,	%l0
	xorcc	%l1,	0x00DB,	%g3
	xorcc	%o5,	0x1AAD,	%i0
	rd	%sys_tick_cmpr,	%g7
	rdpr	%tba,	%i1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x3A4, 	%hsys_tick_cmpr
	bne,a,pn	%icc,	loop_521
	rdhpr	%hsys_tick_cmpr,	%o0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	andncc	%g6,	%g2,	%i4
loop_521:
	rdhpr	%htba,	%i5
	bleu,pn	%icc,	loop_522
	rdpr	%gl,	%l3
	fmovsleu	%icc,	%f9,	%f27
	tcs	%xcc,	0x6
loop_522:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	movleu	%icc,	%l6,	%o1
	wrpr	%o3,	0x0169,	%pil
	movrgz	%o6,	%i3,	%o4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xB85, 	%hsys_tick_cmpr
	fbe	%fcc2,	loop_523
	wr	%o2,	0x1813,	%clear_softint
	wr 	%g0, 	0x6, 	%fprs
	rdpr	%wstate,	%o7
loop_523:
	wrpr	%l2,	0x1DA8,	%tick
	rd	%fprs,	%i2
	wr	%l0,	%l1,	%y
	rd	%fprs,	%g3
	tsubcc	%i0,	%g7,	%i1
	rd	%y,	%g5
	ld	[%l7 + 0x7C],	%f17
	bvc,pn	%xcc,	loop_524
	tl	%icc,	0x0
	tleu	%icc,	0x5
	sra	%o5,	%l4,	%o0
loop_524:
	rdpr	%otherwin,	%i6
	fcmple16	%f26,	%f20,	%l5
	srlx	%g2,	%g6,	%i4
	wrpr	%i5,	0x15BE,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x96E, 	%hsys_tick_cmpr
	fpack16	%f28,	%f28
	rdhpr	%hpstate,	%l6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%canrestore,	%o1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%tl,	%o3
	wr	%g0,	0x80,	%asi
	stda	%g0,	[%l7 + 0x70] %asi
	set	0x18, %g6
	lduwa	[%l7 + %g6] 0x14,	%o4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fmovrde	%l2,	%f2,	%f24

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%o2,	0x015F,	%tick
	wr 	%g0, 	0x6, 	%fprs
	sdivx	%g3,	0x146E,	%i0
	fmovsne	%icc,	%f2,	%f11
	wr	%i1,	0x038E,	%clear_softint
	wrpr	%g7,	%g5,	%cwp
	bgu	loop_525
	edge8l	%o5,	%o0,	%l4
	rd	%pc,	%l5
	wrpr	%g2,	%g6,	%tick
loop_525:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%htba,	%i5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x066, 	%hsys_tick_cmpr
	fbug,a	%fcc3,	loop_526
	rdpr	%canrestore,	%l6
	wrpr	%l3,	%o1,	%pil
	rd	%softint,	%o6
loop_526:
	taddcc	%o3,	%g1,	%o4
	edge8ln	%i3,	%o7,	%l2
	fmovdvc	%xcc,	%f10,	%f23
	fmovsle	%xcc,	%f17,	%f3
	set	0x50, %o5
	ldda	[%l7 + %o5] 0x18,	%g4
	fblg	%fcc3,	loop_527
	rd	%sys_tick_cmpr,	%i2
	rd	%asi,	%o2
	movle	%xcc,	%l0,	%l1
loop_527:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%i1,	%g3,	%pil
	wrpr	%g5,	%o5,	%pil
	movrgz	%o0,	%g7,	%l5
	rdhpr	%hintp,	%g2
	xnor	%g6,	0x17C7,	%l4
	movrgz	%i5,	%i6,	%i4
	rd	%pc,	%l6
	fbule,a	%fcc2,	loop_528
	tvs	%xcc,	0x1
	movl	%xcc,	%i7,	%l3
	rdhpr	%hsys_tick_cmpr,	%o6
loop_528:
	smul	%o1,	0x0D49,	%g1
	orcc	%o3,	0x010E,	%i3
	rdpr	%canrestore,	%o4
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 0:
!
!	Type l   	: 543
!	Type a   	: 5378
!	Type x   	: 268
!	Type cti   	: 528
!	Type f   	: 815
!	Type i   	: 2468
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


	EXIT_GOOD	/* test finish  */

/************************************************************************
   Test case data start
 ************************************************************************/
.data
user_data_start:
scratch_area:
.word 0xEA60446C
.word 0xB952F0DA
.word 0x6889A5BC
.word 0x357B3017
.word 0x1BB7FE0B
.word 0xDCF782F0
.word 0xE83AA84F
.word 0xFBD49D4B
.word 0x468B7F85
.word 0x764033CF
.word 0xEF8D56E6
.word 0x6CFB160C
.word 0xEC87B2BC
.word 0x786BEBC8
.word 0xF651C874
.word 0x2ABEA9F8
.word 0x6A1ADBB3
.word 0xE677DC91
.word 0xF4B651C2
.word 0x1CFD3685
.word 0x1F6D3255
.word 0x6AE826FB
.word 0x42000DBD
.word 0x964080D6
.word 0xFAD7BE36
.word 0x6633B0C8
.word 0x79D656BD
.word 0xC9EEA53B
.word 0xCC349440
.word 0xDFACC201
.word 0x6E18E877
.word 0xD265D488
.word 0x473D2D37
.word 0x4EEEC89A
.word 0x75927D5E
.word 0xE782ABB0
.word 0x419A6264
.word 0x5C94FB1E
.word 0xFBF8CC67
.word 0x534B7E39
.word 0xC11F7740
.word 0xFA909B5A
.word 0x83588F94
.word 0xD0BEFA4E
.word 0xCCB64A05
.word 0xF524612B
.word 0x96CFC936
.word 0x87451827
.word 0x9836C389
.word 0xEF54A960
.word 0xE858BD45
.word 0xC159872A
.word 0xBDE0704D
.word 0x9F1AE3FD
.word 0xBC0A4DA9
.word 0xDD1C2F6C
.word 0x70D7F1F2
.word 0xB90864EF
.word 0x3820B5D5
.word 0x20AF0C0C
.word 0x5021EA17
.word 0xE61A1C6A
.word 0x6F5F7A41
.word 0xF709F95A
.end
