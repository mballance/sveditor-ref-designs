/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: isa3_asr_pr_hpr_f6.s
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
.ident "FOCUSCASE: focus.pm,v 1.1 2003/04/23 17:53:39 somePerson Exp somePerson $ ../focus/spc_basic_isa3.pl FOCUS_SEED=44886650"
.ident "BY gg137162 ON Tue Sep  9 16:40:50 CDT 2003"
.ident "Using Instruction Hash for Focus :$Id: isa3_asr_pr_hpr_f6.s,v 1.2 2007/07/05 21:59:53 drp Exp $"
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
	set	0x9,	%g1
	set	0xD,	%g2
	set	0x1,	%g3
	set	0x7,	%g4
	set	0x7,	%g5
	set	0x7,	%g6
	set	0xF,	%g7
	!# Input registers
	set	-0x8,	%i0
	set	-0xA,	%i1
	set	-0xF,	%i2
	set	-0x4,	%i3
	set	-0x4,	%i4
	set	-0x2,	%i5
	set	-0x3,	%i6
	set	-0xC,	%i7
	!# Local registers
	set	0x50E750B9,	%l0
	set	0x206FCC1D,	%l1
	set	0x2A510B97,	%l2
	set	0x4C5993CF,	%l3
	set	0x5650C170,	%l4
	set	0x0D6B85DF,	%l5
	set	0x1225BFC3,	%l6
	!# Output registers
	set	-0x198E,	%o0
	set	-0x0601,	%o1
	set	-0x1038,	%o2
	set	-0x1E41,	%o3
	set	0x1312,	%o4
	set	-0x0B8F,	%o5
	set	-0x00E3,	%o6
	set	-0x1EF2,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x9E7C9F9E6CD9D260)
	INIT_TH_FP_REG(%l7,%f2,0x4319F96717D4B337)
	INIT_TH_FP_REG(%l7,%f4,0xB0A4ADB2F043FCB7)
	INIT_TH_FP_REG(%l7,%f6,0xCDE1BFFD1B7C866E)
	INIT_TH_FP_REG(%l7,%f8,0x25A86CA922335AC4)
	INIT_TH_FP_REG(%l7,%f10,0xEB2029F0B7758FA9)
	INIT_TH_FP_REG(%l7,%f12,0xDE7343FCAE12D7D7)
	INIT_TH_FP_REG(%l7,%f14,0xE4A4241B06965ACF)
	INIT_TH_FP_REG(%l7,%f16,0x09D6E73415A4D243)
	INIT_TH_FP_REG(%l7,%f18,0x42305BDA7F6CE8A0)
	INIT_TH_FP_REG(%l7,%f20,0x2380613669D682E3)
	INIT_TH_FP_REG(%l7,%f22,0xC1612338B8C29E97)
	INIT_TH_FP_REG(%l7,%f24,0x808BF4BCF27826C5)
	INIT_TH_FP_REG(%l7,%f26,0xF58F89D68B0C1222)
	INIT_TH_FP_REG(%l7,%f28,0xC0D25EFBB670BFBB)
	INIT_TH_FP_REG(%l7,%f30,0x3185789CF8DCEEE0)
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
	fcmpgt32	%f30,	%f28,	%l4
	wrpr	%i1,	0x1C16,	%cwp
	fmovrslez	%g1,	%f12,	%f11
	wr	%g5,	0x006E,	%sys_tick
	srlx	%o1,	%i5,	%i7
	wrpr	%o4,	%i0,	%cwp
	movrlez	%l1,	0x399,	%l5
	tpos	%xcc,	0x4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x33A, 	%hsys_tick_cmpr
	rdpr	%otherwin,	%i3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x9B9, 	%hsys_tick_cmpr
	rd	%ccr,	%g2
	rdpr	%tl,	%l2
	ldx	[%l7 + 0x20],	%o2
	wrpr	%g7,	%i2,	%tick
	rd	%fprs,	%o6
	movge	%xcc,	%l0,	%g3
	movne	%icc,	%o0,	%i6
	rd	%tick_cmpr,	%o7
	fpsub32	%f16,	%f8,	%f8
	fnands	%f29,	%f12,	%f7
	fexpand	%f29,	%f14
	lduw	[%l7 + 0x14],	%l3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	rdpr	%pil,	%l6
	rdhpr	%hpstate,	%i4
	rdhpr	%hsys_tick_cmpr,	%l4
        wr    %g0,    0xe,    %pcr    ! changed.

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	tcs	%xcc,	0x2
	rdhpr	%hintp,	%g5
	bcs	loop_1
	movcs	%icc,	%o1,	%i5
	brgz,a	%i7,	loop_2
	rdhpr	%hintp,	%o4
loop_1:
	taddcctv	%o5,	%l1,	%i0
	popc	%g4,	%l5
loop_2:
	fmovrse	%i3,	%f4,	%f25
	rdhpr	%hsys_tick_cmpr,	%o3
	rdhpr	%hintp,	%g6
	rd	%tick_cmpr,	%l2
	wr	%g2,	0x0D3E,	%clear_softint
	wr	%g7,	0x1613,	%softint
	wrpr	%o2,	0x0C30,	%tick
	rdhpr	%hsys_tick_cmpr,	%i2
	wr	%l0,	%o6,	%set_softint
	rdhpr	%hsys_tick_cmpr,	%o0
	wr	%g3,	0x0416,	%set_softint
	rd	%y,	%o7
	fmovsvc	%xcc,	%f21,	%f1
	rdpr	%cwp,	%l3
	rd	%softint,	%i6
	addccc	%i4,	%l6,	%i1
	bpos,a,pn	%xcc,	loop_3
	rdpr	%otherwin,	%g1
	rdpr	%tl,	%g5
	fnegs	%f26,	%f19
loop_3:
	wrpr	%l4,	0x17A0,	%cwp
	wr	%o1,	0x0FAF,	%pic
	call	loop_4
	movl	%icc,	%i5,	%i7
	wr	%o5,	%l1,	%sys_tick
	ldstub	[%l7 + 0x6D],	%o4
loop_4:
	array8	%g4,	%i0,	%l5
	xor	%i3,	%g6,	%l2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	add	%o3,	0x122E,	%g7
	brlz,a	%o2,	loop_5
	rd	%sys_tick_cmpr,	%l0
	movle	%xcc,	%o6,	%o0
	wr	%g0,	0x18,	%asi
	ldswa	[%l7 + 0x08] %asi,	%g3
loop_5:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xB54, 	%hsys_tick_cmpr
	movle	%xcc,	%i2,	%i6
	ta	%xcc,	0x5
	ta	%xcc,	0x2
	rdpr	%cansave,	%i4
	flush	%l7 + 0x74
	rd	%ccr,	%i1
	popc	0x03C5,	%l6
	mova	%icc,	%g5,	%l4
	brlez,a	%g1,	loop_6
	flush	%l7 + 0x30
	wrpr	%o1,	%i7,	%pil
	rdpr	%cansave,	%i5
loop_6:
	movrlz	%o5,	%o4,	%g4
	rd	%y,	%i0
	set	0x54, %g4
	lda	[%l7 + %g4] 0x18,	%f25
	subc	%l5,	0x1029,	%l1
        wr    %g0,    0xe,    %pcr    ! changed.
	fxors	%f7,	%f23,	%f7
	bvc	%xcc,	loop_7
        wr    %g0,    0xe,    %pcr    ! changed.
	movrgez	%o3,	0x36F,	%g2
	rd	%softint,	%o2
loop_7:
	rd	%y,	%g7
	wrpr	%o6,	0x08DE,	%pil
	fcmpgt16	%f10,	%f28,	%l0
	sll	%g3,	0x08,	%o7
	sdivx	%o0,	0x14C7,	%i2
	set	0x34, %o0
	lduha	[%l7 + %o0] 0x19,	%i6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x988, 	%hsys_tick_cmpr
	wr	%g0,	0x11,	%asi
	ldsba	[%l7 + 0x1E] %asi,	%l6
	fzeros	%f30
	sth	%g5,	[%l7 + 0x30]
	stbar
	rdpr	%pil,	%i1
	wrpr	%g1,	0x09C7,	%pil
	sra	%o1,	0x03,	%l4
	rdhpr	%hsys_tick_cmpr,	%i5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fandnot1s	%f7,	%f24,	%f15
	fbe,a	%fcc3,	loop_8
	wr	%i7,	0x17B6,	%y
	subcc	%o4,	%g4,	%o5
	orn	%i0,	%l1,	%i3
loop_8:
	smulcc	%g6,	%l2,	%l5
	rdpr	%tba,	%g2
	rdhpr	%hpstate,	%o2
	wrpr	%o3,	%g7,	%pil
	wr	%o6,	%g3,	%y
	fmovrdgz	%l0,	%f28,	%f12
	movrlz	%o7,	0x3C7,	%i2
	movvc	%icc,	%o0,	%i6
	rdpr	%pil,	%l3
	rd	%asi,	%i4
	mulx	%l6,	0x04B0,	%g5
	wrpr	%i1,	%o1,	%pil
	fbe	%fcc2,	loop_9
	stx	%l4,	[%l7 + 0x70]
	rd	%y,	%i5
	umul	%g1,	%o4,	%g4
loop_9:
	wrpr	%i7,	0x1838,	%cwp
	movg	%icc,	%o5,	%i0
	udiv	%l1,	0x1239,	%i3
	edge8ln	%l2,	%g6,	%l5
	alignaddrl	%g2,	%o2,	%o3
	addccc	%g7,	%g3,	%l0
	movrgz	%o7,	0x1A9,	%o6
	fbug,a	%fcc2,	loop_10
	fands	%f23,	%f24,	%f24

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xD57, 	%hsys_tick_cmpr
	fsrc1s	%f12,	%f2
loop_10:
	wrpr	%o0,	0x0E8A,	%pil
	edge8ln	%l3,	%i4,	%g5
	rdpr	%otherwin,	%l6
	rdpr	%tl,	%i1
	wrpr	%l4,	%o1,	%tick
	rd	%y,	%i5
	rd	%tick_cmpr,	%o4
	rdhpr	%hsys_tick_cmpr,	%g4
	rd	%softint,	%i7
	rdhpr	%hpstate,	%g1
	and	%o5,	0x0896,	%i0
	rdhpr	%hpstate,	%l1
	tvs	%xcc,	0x3
	rdhpr	%hsys_tick_cmpr,	%l2
	rdpr	%cleanwin,	%i3
	taddcctv	%l5,	%g2,	%o2
	movne	%icc,	%o3,	%g6
	movge	%icc,	%g3,	%g7
	wrpr	%o7,	0x002F,	%tick
	fxors	%f11,	%f15,	%f23
	movg	%xcc,	%o6,	%l0
	rdpr	%otherwin,	%i2
	fabss	%f7,	%f10
	movvc	%xcc,	%i6,	%l3
	wrpr	%o0,	0x0B96,	%tick
	fsrc2	%f8,	%f14

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fbule	%fcc2,	loop_11
	tpos	%icc,	0x0
	fbg,a	%fcc1,	loop_12
	bg,a,pn	%xcc,	loop_13
loop_11:
	wrpr	%i5,	%o4,	%tick
	tge	%xcc,	0x6
loop_12:
	fbge,a	%fcc1,	loop_14
loop_13:
	brgz,a	%g4,	loop_15
	rd	%tick_cmpr,	%i7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
loop_14:
	movleu	%xcc,	%o5,	%i0
loop_15:
	fbge,a	%fcc1,	loop_16
	movg	%xcc,	%l1,	%l2
	rdpr	%cansave,	%g1
	tge	%xcc,	0x4
loop_16:
	rd	%y,	%l5
	srax	%i3,	%g2,	%o3
	wrpr	%o2,	%g3,	%pil
	rd	%fprs,	%g6
	rdpr	%pil,	%o7
	array8	%o6,	%l0,	%g7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x017, 	%hsys_tick_cmpr
	rdpr	%otherwin,	%i6
	bcc,a,pt	%xcc,	loop_17
	rdhpr	%hintp,	%l3
	wrpr	%o0,	%g5,	%pil
	wr	%i4,	%l6,	%y
loop_17:
	fbne,a	%fcc0,	loop_18
	wrpr	%l4,	%i1,	%pil
	wrpr	%i5,	0x183C,	%pil
	fbue,a	%fcc2,	loop_19
loop_18:
	udivcc	%o4,	0x104E,	%i7
	fmovrdne	%o1,	%f26,	%f20
	rdpr	%cleanwin,	%o5
loop_19:
	fmovrdlz	%g4,	%f0,	%f2
	wrpr	%l1,	0x0AE3,	%cwp
	rdhpr	%hsys_tick_cmpr,	%l2
	wrpr	%g1,	%l5,	%cwp
	fnors	%f27,	%f27,	%f3
	wrpr	%i3,	%g2,	%pil
	sdiv	%o3,	0x0EF4,	%o2
	taddcctv	%g3,	0x09D7,	%i0
	tge	%xcc,	0x1
	sdivcc	%g6,	0x1985,	%o7
	rdhpr	%hsys_tick_cmpr,	%l0
	rdhpr	%hintp,	%o6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x05C, 	%hsys_tick_cmpr
	rdpr	%cwp,	%i2
	edge16l	%l3,	%o0,	%i6
	udivcc	%i4,	0x05CB,	%g5
	rd	%softint,	%l4
	rd	%pc,	%i1
	fmovsvs	%icc,	%f22,	%f15
	bneg,a,pt	%xcc,	loop_20
	rdpr	%otherwin,	%i5
	tcs	%xcc,	0x3
	fbule,a	%fcc0,	loop_21
loop_20:
	edge32	%l6,	%i7,	%o4
	movcc	%xcc,	%o1,	%o5
	wr	%g4,	%l1,	%pic
loop_21:
	nop
	setx	loop_22,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fexpand	%f26,	%f2
	move	%icc,	%l2,	%l5
	andn	%i3,	%g2,	%o3
loop_22:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	tsubcctv	%g3,	0x103D,	%i0
	andcc	%o7,	%g6,	%l0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%l3,	0x1D17,	%ccr
	set	0x28, %o2
	ldstuba	[%l7 + %o2] 0x11,	%i2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xC42, 	%hsys_tick_cmpr
	nop
	setx	loop_23,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movgu	%xcc,	%o0,	%l4
	fmovsl	%icc,	%f30,	%f3
	wr	%i1,	%i5,	%softint
loop_23:
	popc	0x02AF,	%g5
	fmovsvc	%xcc,	%f4,	%f13
	rdhpr	%hsys_tick_cmpr,	%i7
	wrpr	%l6,	%o4,	%pil
	wr	%o1,	0x1BE1,	%pic
	tvc	%icc,	0x5
	rdpr	%wstate,	%g4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x829, 	%hsys_tick_cmpr
	wr	%l1,	%l5,	%clear_softint
	wrpr	%g2,	%o3,	%tick
	movgu	%icc,	%g1,	%o2
	array32	%g3,	%i3,	%i0
	lduh	[%l7 + 0x1C],	%g6
	wr	%o7,	0x1D7C,	%set_softint
	wrpr	%l0,	%o6,	%cwp
	movrne	%l3,	%g7,	%i2
	rd	%asi,	%i4
	wrpr	%o0,	%i6,	%pil
	fmovrdgz	%l4,	%f28,	%f4
	add	%l7,	0x1C,	%l6
	wr	%g0,	0x04,	%asi
	casa	[%l6] %asi,	%i1,	%i5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%i7,	0x168B,	%pic
	rdhpr	%hsys_tick_cmpr,	%l6
	rdpr	%tl,	%o1
	movvs	%icc,	%g4,	%o4
	wrpr	%l2,	0x149F,	%cwp
	fpack16	%f26,	%f15
	wr	%l1,	%l5,	%clear_softint
	rdpr	%cansave,	%o5
	rd	%tick_cmpr,	%o3
	or	%g2,	%g1,	%g3
	rd	%pc,	%o2
	fand	%f16,	%f12,	%f4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xC88, 	%hsys_tick_cmpr
	rdhpr	%htba,	%o7
	rd	%tick_cmpr,	%l0
	add	%g6,	%l3,	%o6
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x30
	wr	%g0,	0x4f,	%asi
	ldxa	[%g0 + 0x30] %asi,	%g7
	wrpr	%i4,	0x06CD,	%tick
	rdhpr	%hintp,	%o0
	wrpr	%i2,	0x1CF5,	%cwp
	rdpr	%tba,	%i6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xCB8, 	%hsys_tick_cmpr
	rdhpr	%hsys_tick_cmpr,	%g5
	sdivcc	%i7,	0x1865,	%i5
	rd	%fprs,	%l6
	rdhpr	%hsys_tick_cmpr,	%o1
	rdhpr	%hpstate,	%g4
	wr	%l2,	0x0D22,	%softint
	rd	%tick_cmpr,	%l1
	orncc	%o4,	0x1ED9,	%o5
	addccc	%o3,	0x1B22,	%g2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x946, 	%hsys_tick_cmpr
	wr	%l5,	%g3,	%ccr
	wrpr	%o2,	%i3,	%cwp
	fmovrsgz	%o7,	%f17,	%f20
	alignaddr	%i0,	%g6,	%l3
	movgu	%xcc,	%o6,	%g7
	rd	%y,	%l0
	rd	%y,	%i4
	rdpr	%canrestore,	%o0
	wr	%i6,	0x185A,	%ccr
	wr	%i2,	0x12A4,	%y
	wr	%i1,	%l4,	%sys_tick
	rdpr	%wstate,	%g5
	wrpr	%i7,	%l6,	%pil
	add	%l7,	0x38,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%i5,	%o1
	wrpr	%g4,	0x150A,	%tick
	rd	%softint,	%l2
	wr	%g0,	0x10,	%asi
	stha	%l1,	[%l7 + 0x32] %asi
	rdpr	%tl,	%o5
	rdpr	%tl,	%o4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	srl	%o3,	0x0E,	%g1
	rdpr	%cwp,	%l5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x6A2, 	%hsys_tick_cmpr
	taddcc	%g3,	%i3,	%i0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%wstate,	%l3
	array32	%o6,	%g7,	%l0
	rdpr	%cwp,	%o7
	wrpr	%o0,	%i6,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x62B, 	%hsys_tick_cmpr
	rd	%y,	%i4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	xnorcc	%i7,	0x0E5C,	%i5
	wr	%o1,	%g4,	%pic
	rdpr	%gl,	%l2
	rdhpr	%hsys_tick_cmpr,	%l1
	movge	%xcc,	%o5,	%l6
	tn	%icc,	0x0
	fmovdneg	%icc,	%f15,	%f6
	wr	%g2,	%o3,	%sys_tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x837, 	%sys_tick_cmpr
	rd	%softint,	%o2
	movgu	%xcc,	%g3,	%i3
        wr    %g0,    0xe,    %pcr    ! changed.
	fmovde	%icc,	%f2,	%f15
	nop
	setx	loop_24,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	wrpr	%i0,	0x0FDC,	%pil
	rdhpr	%hintp,	%l3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x460, 	%hsys_tick_cmpr
loop_24:
	rdhpr	%hsys_tick_cmpr,	%o6
	move	%xcc,	%o7,	%o0
	rd	%y,	%l0
	rd	%asi,	%i6
	sth	%i2,	[%l7 + 0x0C]
	fors	%f14,	%f26,	%f25

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	fxnors	%f0,	%f4,	%f16
	set	0x74, %o4
	stwa	%l4,	[%l7 + %o4] 0x19
	rdhpr	%hsys_tick_cmpr,	%i7
	addccc	%i5,	%o1,	%i1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x1CB, 	%hsys_tick_cmpr
	rdpr	%canrestore,	%g4
	umul	%o5,	%l1,	%g2
	rd	%tick_cmpr,	%l6
	tsubcctv	%o4,	%l5,	%o3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	wrpr	%g3,	0x038D,	%cwp
	rdpr	%cwp,	%i3
	sra	%i0,	%l3,	%g1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%o6,	0x1D06,	%set_softint
	rdhpr	%hpstate,	%g6
	fmovrdlez	%o0,	%f24,	%f6
	rdhpr	%hintp,	%l0
	wr	%o7,	0x014D,	%ccr
	rdpr	%pil,	%i2
	tgu	%icc,	0x0
	edge16l	%i4,	%g5,	%l4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x322, 	%hsys_tick_cmpr
	rd	%pc,	%i5
	add	%l7,	0x68,	%l6
	wr	%g0,	0x04,	%asi
	casxa	[%l6] 0x04,	%i7,	%o1
	andcc	%i1,	0x1403,	%g4
	rdhpr	%hintp,	%l2
	tn	%xcc,	0x7
	rdhpr	%hsys_tick_cmpr,	%o5
	te	%icc,	0x5
	rd	%softint,	%g2
	rd	%sys_tick_cmpr,	%l6
	fmovscs	%icc,	%f20,	%f12
	wrpr	%o4,	0x1A39,	%tick
	rdhpr	%hintp,	%l5
	rdpr	%cleanwin,	%l1
	wr 	%g0, 	0x4, 	%fprs
	rdpr	%cwp,	%i3
	wr	%o3,	0x1C5B,	%clear_softint
	or	%l3,	0x1E34,	%g1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xA49, 	%hsys_tick_cmpr
	rd	%pc,	%o6
	edge32n	%g6,	%i0,	%l0
	sllx	%o0,	0x16,	%i2
	tne	%icc,	0x5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x966, 	%hsys_tick_cmpr
	wr	%o7,	0x043B,	%sys_tick
	be,pt	%icc,	loop_25
	bge,pn	%xcc,	loop_26
	brgz,a	%l4,	loop_27
	rdpr	%tl,	%g5
loop_25:
	rdpr	%cwp,	%i5
loop_26:
	fcmple32	%f6,	%f4,	%i7
loop_27:
	bgu	loop_28
	wrpr	%i6,	0x0138,	%cwp
	orn	%i1,	0x00BC,	%o1
	mulx	%g4,	0x0AB0,	%l2
loop_28:
	sir	0x011C
	rdpr	%tba,	%g2
	ldd	[%l7 + 0x50],	%f0
	rdhpr	%htba,	%o5
	brz,a	%l6,	loop_29
	sethi	0x19E2,	%o4
	bg,a	%xcc,	loop_30
	fmovrslez	%l1,	%f29,	%f4
loop_29:
	wrpr	%l5,	0x0610,	%pil
	wr	%o2,	0x0725,	%sys_tick
loop_30:
	nop
	setx	loop_31,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movrgez	%i3,	%g3,	%l3
	fxnor	%f16,	%f0,	%f10
	rd	%y,	%o3
loop_31:
	rd	%softint,	%g1
	fxor	%f26,	%f24,	%f24
	movcs	%icc,	%g7,	%g6
	movvc	%xcc,	%o6,	%l0
	fornot1s	%f25,	%f29,	%f6
	rd	%ccr,	%o0
	rdpr	%tl,	%i0
	udiv	%i2,	0x021B,	%o7
	rdpr	%canrestore,	%i4
	rdpr	%tl,	%g5
	add	%i5,	0x1F55,	%l4
	addccc	%i7,	0x15F8,	%i6
	wr	%o1,	0x193D,	%pic
	rdhpr	%hpstate,	%g4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	rd	%ccr,	%g2
	rdpr	%cleanwin,	%o5
	addcc	%l6,	0x1096,	%o4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xEB3, 	%hsys_tick_cmpr
	rd	%y,	%o2
	rdhpr	%hpstate,	%l5
	rdpr	%otherwin,	%i3
	rd	%asi,	%l3
	rd	%pc,	%o3
	edge32l	%g1,	%g7,	%g3
	wrpr	%o6,	0x1169,	%tick
	edge16	%g6,	%l0,	%o0
	sdiv	%i0,	0x0706,	%o7
	andncc	%i2,	%g5,	%i5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x581, 	%sys_tick_cmpr
	array32	%i4,	%i7,	%o1
	sethi	0x0AC7,	%g4
	fpack16	%f24,	%f25
	rd	%asi,	%i1
	rd	%softint,	%i6
	fnegs	%f25,	%f7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x475, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%l1,	%o5,	%pil
	taddcc	%o2,	%l5,	%i3
	wrpr	%l3,	0x1BC1,	%pil
	taddcc	%l2,	0x1723,	%g1
	sll	%o3,	%g7,	%o6
	rdpr	%cwp,	%g3
	rd	%fprs,	%g6
	rd	%asi,	%o0
	membar	0x76

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	tn	%icc,	0x7
	stb	%o7,	[%l7 + 0x48]

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xD33, 	%tick_cmpr
	fcmpne32	%f30,	%f30,	%l0
	alignaddrl	%g5,	%l4,	%i5
	std	%i6,	[%l7 + 0x38]
	rdhpr	%hsys_tick_cmpr,	%o1
	movpos	%icc,	%i4,	%i1
	ldsw	[%l7 + 0x18],	%g4
	call	loop_32
	rd	%y,	%i6
	rdpr	%cleanwin,	%l6
	movgu	%xcc,	%g2,	%l1
loop_32:
	edge8ln	%o4,	%o5,	%l5
	wr	%i3,	%l3,	%clear_softint
	movrlez	%l2,	0x1D2,	%o2
	rd	%asi,	%g1
	fbn,a	%fcc3,	loop_33
	rd	%ccr,	%o3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x1E2, 	%hsys_tick_cmpr
	umulcc	%g6,	0x15C3,	%o0
loop_33:
	fbue	%fcc3,	loop_34
	std	%i0,	[%l7 + 0x10]
	nop
	setx loop_35, %l0, %l1
	jmpl %l1, %o7
	wrpr	%i2,	0x0252,	%pil
loop_34:
	ldsh	[%l7 + 0x46],	%g3
	rd	%ccr,	%l0
loop_35:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xCEA, 	%sys_tick_cmpr
	rdpr	%wstate,	%i7
	rdpr	%cleanwin,	%o1
	tsubcc	%i5,	%i1,	%i4
	tsubcctv	%i6,	0x104E,	%l6
	wr	%g2,	0x16A6,	%clear_softint

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x486, 	%hsys_tick_cmpr
	wrpr	%g4,	0x0067,	%pil
	rdpr	%canrestore,	%o4
	tvs	%icc,	0x5
	rdpr	%wstate,	%l5
	bcs,a,pn	%icc,	loop_36
	rd	%y,	%i3
	wr	%o5,	0x007C,	%clear_softint
	wr	%l2,	%l3,	%y
loop_36:
	st	%f25,	[%l7 + 0x14]
	wrpr	%g1,	%o2,	%pil
	rdhpr	%hpstate,	%o3
	xorcc	%o6,	0x0075,	%g7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	rdhpr	%hpstate,	%i0
	popc	0x1280,	%o7
	mulscc	%o0,	0x100F,	%i2
	wrpr	%g3,	%l0,	%tick
	rd	%tick_cmpr,	%l4
	edge8ln	%i7,	%g5,	%i5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xAE6, 	%sys_tick_cmpr
	fpadd32s	%f10,	%f29,	%f28
	rdhpr	%hsys_tick_cmpr,	%i6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%g0,	0x89,	%asi
	lduba	[%l7 + 0x47] %asi,	%l6
	edge32n	%g2,	%g4,	%l1
	array8	%l5,	%i3,	%o5
	wr	%o4,	%l3,	%sys_tick
	rdpr	%wstate,	%l2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xFC7, 	%hsys_tick_cmpr
	rdhpr	%htba,	%o6
	umulcc	%o3,	0x0E40,	%g7
	wrpr	%g6,	0x1D01,	%cwp
	fbule,a	%fcc0,	loop_37
	nop
	setx	loop_38,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	wr	%o7,	%i0,	%ccr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xA0D, 	%hsys_tick_cmpr
loop_37:
	wrpr	%l0,	%i2,	%tick
loop_38:
	rdhpr	%hsys_tick_cmpr,	%l4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xB92, 	%hsys_tick_cmpr
	wrpr	%i5,	%i4,	%cwp
	fnot1	%f16,	%f26

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	subc	%i6,	%l6,	%g2
	umulcc	%g4,	%l1,	%i1
	wr	%i3,	0x12E5,	%set_softint
	movge	%icc,	%o5,	%o4
	rdpr	%gl,	%l3
	rdhpr	%hpstate,	%l5
	wrpr	%o2,	0x095B,	%cwp
	rdpr	%cwp,	%l2
	rdhpr	%hpstate,	%g1
        wr    %g0,    0xe,    %pcr    ! changed.
	movrlz	%o6,	%g7,	%g6
	wrpr	%i0,	%o0,	%pil
	rdpr	%cansave,	%o7
	orn	%g3,	0x0C9B,	%l0
	sllx	%i2,	0x07,	%l4
	fcmpd	%fcc2,	%f24,	%f24

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xDEA, 	%hsys_tick_cmpr
	tl	%icc,	0x4
	flush	%l7 + 0x2C
	movpos	%xcc,	%i5,	%g5
	rdhpr	%hsys_tick_cmpr,	%o1
	wrpr	%i4,	0x0011,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%i6,	0x04CA,	%pil
	wr 	%g0, 	0x4, 	%fprs
	wrpr	%i3,	0x1354,	%pil
	sll	%o5,	%i1,	%l3
	rdpr	%tba,	%o4
	fbo,a	%fcc1,	loop_39
	wr	%o2,	0x05A6,	%y

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x00A, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x213, 	%hsys_tick_cmpr
loop_39:
	movpos	%icc,	%o6,	%g7
	fpadd32	%f20,	%f14,	%f4
	tgu	%icc,	0x5
	tvs	%xcc,	0x2
	tg	%icc,	0x3
	wr	%g0,	0x80,	%asi
	lda	[%l7 + 0x60] %asi,	%f31
	rdpr	%tba,	%g6
	rd	%pc,	%l5
	taddcctv	%i0,	%o7,	%g3
	tle	%xcc,	0x7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xFE5, 	%hsys_tick_cmpr
	rdhpr	%hpstate,	%l4
	wr	%i7,	0x1698,	%y
	rdhpr	%hpstate,	%l0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	wrpr	%i4,	%o1,	%cwp
	wr	%l6,	0x1FCE,	%sys_tick
	rd	%ccr,	%i6
	rd	%softint,	%l1
	rdpr	%wstate,	%g2
	rdhpr	%hpstate,	%i3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%hsys_tick_cmpr,	%i1
	rd	%ccr,	%l3
	rdpr	%tba,	%o2
	rdhpr	%hsys_tick_cmpr,	%o4
	wr	%g1,	%l2,	%ccr
	rd	%asi,	%o6
	rdhpr	%hpstate,	%o3
	rdpr	%wstate,	%g6
	wr	%g0,	0x0c,	%asi
	lduha	[%l7 + 0x44] %asi,	%l5
	te	%icc,	0x2
	orncc	%g7,	0x1D05,	%o7
	rd	%tick_cmpr,	%g3
	popc	%i0,	%i2
	movvs	%icc,	%l4,	%i7
	rd	%ccr,	%o0
	movvc	%xcc,	%l0,	%i5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x521, 	%hsys_tick_cmpr
	movg	%xcc,	%l6,	%i6
	rdhpr	%htba,	%g5
	fmovdg	%icc,	%f17,	%f1
	fmul8x16au	%f18,	%f17,	%f30
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wrpr	%l1,	%i3,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	movcs	%icc,	%i1,	%g4
	subccc	%o2,	0x1A13,	%o4
	rdpr	%canrestore,	%l3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%hpstate,	%o3
	rdpr	%cleanwin,	%g6
	taddcctv	%l2,	0x0587,	%l5
	rdpr	%cwp,	%o7
	rd	%softint,	%g3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	orncc	%l4,	%i2,	%o0
	rdhpr	%hintp,	%l0
	sllx	%i5,	%i7,	%i4
	wrpr	%o1,	%i6,	%pil
	wrpr	%g5,	%l1,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xD05, 	%hsys_tick_cmpr
	rd	%tick_cmpr,	%o5
	orncc	%i1,	%l6,	%g4
	wr	%o2,	0x15E9,	%sys_tick
	rdpr	%cwp,	%o4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x9D6, 	%hsys_tick_cmpr
	wrpr	%o3,	%g6,	%tick
	rdpr	%cleanwin,	%g1
	rd	%softint,	%l2
	rdpr	%cwp,	%l5
	movpos	%xcc,	%g3,	%g7
	rdpr	%cwp,	%i0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr 	%g0, 	0x7, 	%fprs
	movcs	%icc,	%l0,	%o0
	ble,a	loop_40
	rd	%ccr,	%i5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x149, 	%hsys_tick_cmpr
loop_40:
	rd	%pc,	%g5
	rdpr	%pil,	%i6
	rdhpr	%hsys_tick_cmpr,	%l1
	fpackfix	%f16,	%f30
	rd	%ccr,	%g2
	wr	%i3,	%o5,	%set_softint
	rdpr	%cwp,	%i1
	movrne	%l6,	0x3B8,	%o2
	wrpr	%g4,	%o4,	%tick
	bgu	loop_41
	rdhpr	%hpstate,	%o6
	brz	%l3,	loop_42
	fbue,a	%fcc1,	loop_43
loop_41:
	wrpr	%g6,	%g1,	%cwp
	movg	%xcc,	%l2,	%o3
loop_42:
	movrne	%l5,	%g3,	%g7
loop_43:
	smul	%i0,	%i2,	%o7
	wrpr	%l0,	0x122C,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fandnot2s	%f25,	%f27,	%f29
	movrne	%i4,	%o0,	%o1
	std	%i6,	[%l7 + 0x10]
	edge8	%i6,	%l1,	%g2
	andncc	%i3,	%g5,	%i1
	rdpr	%gl,	%o5
	xor	%o2,	%g4,	%l6
	rdhpr	%hpstate,	%o4
	alignaddr	%o6,	%g6,	%l3
	movneg	%xcc,	%g1,	%o3
	tg	%icc,	0x0
	mova	%xcc,	%l5,	%g3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x0D0, 	%hsys_tick_cmpr
	fmul8x16	%f16,	%f26,	%f10
	movvc	%icc,	%i2,	%i0
	rdhpr	%htba,	%l0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x017, 	%hsys_tick_cmpr
	membar	0x0E
	rdhpr	%hsys_tick_cmpr,	%i4
	movle	%icc,	%o0,	%o1
	wrpr	%i5,	0x1596,	%tick
	rdpr	%cleanwin,	%i6
	rdpr	%cwp,	%l1
	set	0x1C, %l6
	ldsha	[%l7 + %l6] 0x88,	%i7
	rdpr	%cansave,	%i3
	sethi	0x1414,	%g2
	rdhpr	%hpstate,	%g5
	umulcc	%i1,	%o2,	%o5
	fmovdneg	%icc,	%f5,	%f2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fpadd16s	%f5,	%f24,	%f6
	rd	%sys_tick_cmpr,	%o4
	wr	%o6,	0x1E01,	%ccr
	edge16ln	%g4,	%g6,	%l3
	rdhpr	%hpstate,	%g1
	mulx	%o3,	%g3,	%l5
	rdpr	%cleanwin,	%g7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xC9A, 	%hsys_tick_cmpr
	wrpr	%l2,	%i0,	%cwp
	xorcc	%l0,	0x1202,	%l4
	lduw	[%l7 + 0x30],	%o7
	st	%f7,	[%l7 + 0x44]
	smulcc	%o0,	%i4,	%i5
	rd	%ccr,	%i6
	bpos,pt	%icc,	loop_44
	wr	%o1,	%i7,	%clear_softint
	wrpr	%i3,	%l1,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_44:
	fmovrdgz	%g2,	%f14,	%f30
	wrpr	%i1,	0x1FB7,	%pil
	wr	%o2,	%o5,	%set_softint
	rdhpr	%htba,	%o4
	rdpr	%canrestore,	%o6
        wr    %g0,    0xe,    %pcr    ! changed.
	stb	%g6,	[%l7 + 0x5F]
	tvc	%icc,	0x6
	wrpr	%g4,	%g1,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%tba,	%o3
	rd	%asi,	%g7
	wrpr	%i2,	0x0353,	%tick
	wr	%g0,	0x2a,	%asi
	ldda	[%l7 + 0x60] %asi,	%l4
	rdpr	%canrestore,	%i0
        wr    %g0,    0xe,    %pcr    ! changed.
	alignaddrl	%l4,	%l0,	%o7
	fmovrsgz	%o0,	%f20,	%f6
	fnegs	%f18,	%f27
	rd	%asi,	%i5
	rdpr	%cansave,	%i6
	rdpr	%canrestore,	%o1
	rd	%ccr,	%i7
	edge8l	%i4,	%l1,	%i3
	wr 	%g0, 	0x4, 	%fprs

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%o5,	0x0230,	%tick
	tneg	%xcc,	0x0
	rdpr	%tba,	%o4
	wrpr	%o6,	%l6,	%pil
	movl	%xcc,	%g6,	%i1
	flush	%l7 + 0x70
	movrlez	%g4,	0x31D,	%l3
	rdpr	%pil,	%g1
	umul	%o3,	0x0B7A,	%g7
	rdhpr	%hpstate,	%g3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x651, 	%hsys_tick_cmpr
	add	%l7,	0x48,	%l6
	wr	%g0,	0x10,	%asi
	casa	[%l6] %asi,	%l2,	%i2
	fmovdne	%icc,	%f31,	%f5
	movrlez	%l4,	0x056,	%o7
	wr 	%g0, 	0x5, 	%fprs
	tvs	%icc,	0x1
	rdpr	%cwp,	%i6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x0E3, 	%hsys_tick_cmpr
	andn	%i5,	0x0D86,	%i7
	fcmple16	%f22,	%f24,	%l1
	fxnors	%f8,	%f8,	%f24
	rdpr	%otherwin,	%i3
	udivx	%g2,	0x1691,	%i4
	wrpr	%o2,	%g5,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	sllx	%l6,	%o6,	%i1
	ldx	[%l7 + 0x08],	%g4
	wr	%g6,	%l3,	%set_softint
	flush	%l7 + 0x7C
	fmovdpos	%xcc,	%f20,	%f21
	fornot2	%f14,	%f12,	%f18
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	rd	%asi,	%g1
	st	%f25,	[%l7 + 0x0C]
	rdpr	%canrestore,	%o3
	bne,a,pt	%xcc,	loop_45
	xnor	%g7,	0x1E00,	%g3
	wr	%g0,	0x16,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
loop_45:
	rd	%asi,	%i0
	rd	%sys_tick_cmpr,	%l5
	rdpr	%cleanwin,	%i2
	membar	#Sync
	wr	%g0,	0xf9,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	rdpr	%pil,	%l2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x5D0, 	%hsys_tick_cmpr
	udivcc	%o7,	0x1D52,	%i6
	wr	%g0,	0x88,	%asi
	prefetcha	[%l7 + 0x50] %asi,	 0x0
	rd	%pc,	%i5
	mova	%icc,	%i7,	%l1
	rd	%asi,	%o0
	rdhpr	%hintp,	%g2
	xor	%i3,	%i4,	%g5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	taddcc	%o4,	0x1425,	%o5
	rd	%sys_tick_cmpr,	%l6
	rdpr	%canrestore,	%o6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr 	%g0, 	0x6, 	%fprs
	wr	%g6,	0x0E39,	%y
	rd	%sys_tick_cmpr,	%l3
	wr	%o3,	0x02CA,	%clear_softint

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x461, 	%hsys_tick_cmpr
	srax	%l5,	0x07,	%i2
	bl,a	%xcc,	loop_46
	fblg,a	%fcc2,	loop_47
	wr	%g1,	0x0894,	%clear_softint
	rdpr	%cansave,	%l2
loop_46:
	edge16l	%l0,	%o7,	%i6
loop_47:
	fmovsneg	%icc,	%f18,	%f29
	wrpr	%o1,	0x1DB0,	%tick
	wrpr	%i5,	0x0AB9,	%tick
	rd	%asi,	%l4
	fmovdcs	%icc,	%f25,	%f31
	smulcc	%i7,	0x1718,	%l1
	rdhpr	%hsys_tick_cmpr,	%g2
	rdhpr	%hsys_tick_cmpr,	%i3
	alignaddrl	%i4,	%g5,	%o2
	rdhpr	%hintp,	%o0
	wr	%o4,	%o5,	%pic
	rdhpr	%hintp,	%o6
	wrpr	%i1,	%g4,	%pil
	movrlz	%l6,	%g6,	%o3
	wrpr	%g7,	%g3,	%cwp
	wr	%i0,	%l5,	%softint
	stbar
	rdhpr	%hintp,	%i2
	umul	%g1,	0x18F1,	%l2
	wrpr	%l0,	%l3,	%tick
	fbge	%fcc2,	loop_48
	edge16n	%i6,	%o7,	%o1
	fsrc1s	%f8,	%f7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xA72, 	%hsys_tick_cmpr
loop_48:
	rdpr	%gl,	%l4
	rdpr	%pil,	%i7
	tneg	%xcc,	0x2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	ldsb	[%l7 + 0x5E],	%i3
        wr    %g0,    0xe,    %pcr    ! changed.
	fexpand	%f10,	%f26
	wr 	%g0, 	0x5, 	%fprs
	rd	%fprs,	%o4
	rd	%y,	%o0
	rd	%tick_cmpr,	%o5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xE95, 	%hsys_tick_cmpr
	rdhpr	%hintp,	%l6
	wrpr	%g6,	0x14DD,	%tick
	alignaddrl	%i1,	%g7,	%g3
	subc	%o3,	%i0,	%i2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%y,	%l2
	edge16n	%l0,	%l3,	%l5
	edge32ln	%o7,	%o1,	%i6
	fmovdleu	%xcc,	%f16,	%f12
	fpsub16	%f26,	%f28,	%f8
	wrpr	%i5,	0x1AC6,	%tick
	wr	%i7,	0x0F35,	%softint
	nop
	setx	loop_49,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movcs	%xcc,	%l1,	%l4
	fnegs	%f19,	%f14
	taddcctv	%i3,	%g2,	%g5
loop_49:
	smul	%o2,	0x04C7,	%i4
	rdpr	%wstate,	%o0
	bg,a,pt	%icc,	loop_50
	rdhpr	%hintp,	%o5
	wr	%g0,	0xe2,	%asi
	stda	%o4,	[%l7 + 0x40] %asi
	membar	#Sync
loop_50:
	fnot2s	%f29,	%f19
	fmovrdgez	%o6,	%f28,	%f0
	wrpr	%g4,	%l6,	%cwp
	rdpr	%tba,	%g6
	fandnot2s	%f2,	%f19,	%f20
	wr	%i1,	%g3,	%softint
	rd	%pc,	%o3
	brz,a	%i0,	loop_51
	rdpr	%gl,	%g7
	movge	%icc,	%i2,	%g1
	fmovsg	%xcc,	%f10,	%f29
loop_51:
	smul	%l0,	0x0B60,	%l2
	rd	%fprs,	%l3
	tg	%xcc,	0x7
	rdpr	%pil,	%l5
	rd	%y,	%o1
	edge32	%i6,	%o7,	%i5
	rdhpr	%hintp,	%i7
	movneg	%xcc,	%l1,	%i3
	sll	%l4,	0x06,	%g5
	rd	%ccr,	%o2
	fbuge	%fcc1,	loop_52
	umul	%g2,	%o0,	%i4
	sir	0x13C8
	fpsub32s	%f5,	%f8,	%f25
loop_52:
	rdhpr	%hintp,	%o5
	and	%o6,	0x150C,	%g4
	tle	%xcc,	0x0
	bgu,a	%xcc,	loop_53
	rdhpr	%hsys_tick_cmpr,	%o4
	sllx	%l6,	%g6,	%g3
	rdpr	%tl,	%i1
loop_53:
	wrpr	%i0,	0x1C82,	%tick
	fmovdle	%xcc,	%f17,	%f19

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x56F, 	%hsys_tick_cmpr
	rdpr	%tl,	%i2
	wrpr	%l0,	%g1,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xB0A, 	%hsys_tick_cmpr
	wr	%l2,	%l5,	%y
	andn	%i6,	0x1F17,	%o1
	movg	%xcc,	%o7,	%i7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%l4,	0x186F,	%tick
	edge8	%l1,	%g5,	%g2
	ldsh	[%l7 + 0x6E],	%o2
	rd	%tick_cmpr,	%i4
	wr	%o5,	0x060D,	%pic
	rdhpr	%hpstate,	%o6
	rdpr	%gl,	%g4
	umul	%o0,	0x0DF1,	%o4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x2A5, 	%hsys_tick_cmpr
	edge32n	%i1,	%g3,	%g7
	fmovrsgz	%o3,	%f9,	%f17
	wrpr	%i2,	0x0174,	%cwp
	bl,a	loop_54
	bpos,pt	%icc,	loop_55
	or	%i0,	0x0D7D,	%l0
	popc	0x09B2,	%g1
loop_54:
	or	%l2,	0x09CD,	%l5
loop_55:
	wr	%i6,	%o1,	%y
	rd	%ccr,	%o7
	fsrc1	%f24,	%f2
	rd	%sys_tick_cmpr,	%i7
	rdhpr	%hpstate,	%l3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x682, 	%hsys_tick_cmpr
	orcc	%i3,	0x17BA,	%l1
	rd	%y,	%g5
	movpos	%xcc,	%g2,	%l4
	xnorcc	%o2,	0x08EA,	%o5
	wr	%o6,	0x18E4,	%pic
	membar	0x69
	mova	%icc,	%g4,	%o0
	wr	%i4,	0x1B4A,	%clear_softint
	wr	%o4,	%l6,	%set_softint
	fmovde	%icc,	%f20,	%f0
	rdhpr	%hintp,	%g6
	wr	%g0,	0x18,	%asi
	lduba	[%l7 + 0x26] %asi,	%g3
	mulx	%g7,	%i1,	%i2
	wr 	%g0, 	0x5, 	%fprs
	rd	%tick_cmpr,	%o3
	rd	%fprs,	%l2
	rdhpr	%hintp,	%g1
	tleu	%icc,	0x5
	fzero	%f22
	bgu,pt	%xcc,	loop_56
	rdhpr	%hintp,	%l5
	ldub	[%l7 + 0x0E],	%o1
	rdpr	%cleanwin,	%o7
loop_56:
	xorcc	%i6,	0x1C93,	%i7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%pc,	%l1
	fmuld8sux16	%f1,	%f9,	%f28
	sethi	0x1620,	%g5
	wrpr	%l4,	0x1F2E,	%tick
	sub	%g2,	%o5,	%o6
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 0:
!
!	Type l   	: 52
!	Type a   	: 534
!	Type x   	: 22
!	Type cti   	: 56
!	Type f   	: 80
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
.word 0x9E864B35
.word 0xA8836F42
.word 0xB25BF8DA
.word 0x3DEC2AAB
.word 0xE393E8B0
.word 0xC6A11E21
.word 0x73860C33
.word 0xEF33F42F
.word 0x948A207D
.word 0x6D1C8F80
.word 0xC202F77E
.word 0x7912EB7B
.word 0xA9CE43B9
.word 0x5DBBA76C
.word 0xE9980A7C
.word 0xAD5350DB
.word 0x3CFCCDEC
.word 0xBF530804
.word 0xFB4ADE0C
.word 0x1F76422C
.word 0x65D224C1
.word 0x2C946FE2
.word 0xE898011D
.word 0xB770B69B
.word 0x1EB20F59
.word 0xC1C59641
.word 0x1FF40554
.word 0x8A7E4A56
.word 0xB5426A34
.word 0xD6B7B984
.word 0x55718C9C
.word 0xAD949B4C
.word 0x0D90DB9D
.word 0x69B33C91
.word 0xDF80C132
.word 0x6363353E
.word 0x8EF735EF
.word 0xFD86B653
.word 0x04CE865F
.word 0x4A56EF0A
.word 0x777E1A63
.word 0xBC01117C
.word 0x1A006E97
.word 0x97A2D5EB
.word 0x3FB21AC9
.word 0x163BF4E0
.word 0x7D0093D5
.word 0xC7481C99
.word 0xCB63CE19
.word 0x3F842C13
.word 0x83727E10
.word 0xC0755E9C
.word 0x2620448A
.word 0xBF13883D
.word 0xCB35B92B
.word 0x46335997
.word 0x32C13753
.word 0xCA166749
.word 0x0AF23539
.word 0xA7A8195D
.word 0xE5EADFD9
.word 0x1AF646CD
.word 0x55B860E9
.word 0x3E2CA035
.end
