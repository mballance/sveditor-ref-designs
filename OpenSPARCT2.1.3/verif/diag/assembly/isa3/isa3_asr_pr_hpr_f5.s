/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: isa3_asr_pr_hpr_f5.s
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
.ident "FOCUSCASE: focus.pm,v 1.1 2003/04/23 17:53:39 somePerson Exp somePerson $ ../focus/spc_basic_isa3.pl FOCUS_SEED=1005502269"
.ident "BY gg137162 ON Wed Sep 10 10:54:10 CDT 2003"
.ident "Using Instruction Hash for Focus :$Id: isa3_asr_pr_hpr_f5.s,v 1.2 2007/07/05 21:59:52 drp Exp $"
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
	set	0x4,	%g2
	set	0x6,	%g3
	set	0x9,	%g4
	set	0x2,	%g5
	set	0x2,	%g6
	set	0x1,	%g7
	!# Input registers
	set	-0x9,	%i0
	set	-0x9,	%i1
	set	-0x2,	%i2
	set	-0x4,	%i3
	set	-0xC,	%i4
	set	-0x7,	%i5
	set	-0xA,	%i6
	set	-0x2,	%i7
	!# Local registers
	set	0x147C5C81,	%l0
	set	0x53644174,	%l1
	set	0x19A5F40D,	%l2
	set	0x2BC16A28,	%l3
	set	0x158A5D69,	%l4
	set	0x21BCCDBB,	%l5
	set	0x681AAF54,	%l6
	!# Output registers
	set	-0x0B37,	%o0
	set	-0x103F,	%o1
	set	-0x1A9F,	%o2
	set	-0x0BD9,	%o3
	set	0x0C95,	%o4
	set	-0x1FBC,	%o5
	set	0x1129,	%o6
	set	0x00AD,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x626E867F1115612F)
	INIT_TH_FP_REG(%l7,%f2,0x768791F79F18548D)
	INIT_TH_FP_REG(%l7,%f4,0x7F37F7F409A2B43B)
	INIT_TH_FP_REG(%l7,%f6,0x639C7AC1EF27A05B)
	INIT_TH_FP_REG(%l7,%f8,0xE2A38E2A5362D1E0)
	INIT_TH_FP_REG(%l7,%f10,0xB8F83744D3D84CB5)
	INIT_TH_FP_REG(%l7,%f12,0x9296EEA208303B15)
	INIT_TH_FP_REG(%l7,%f14,0x7009A71C05ED59FC)
	INIT_TH_FP_REG(%l7,%f16,0x163660D4CD389474)
	INIT_TH_FP_REG(%l7,%f18,0x413BCE75542B017B)
	INIT_TH_FP_REG(%l7,%f20,0x34219C3E95DE26A9)
	INIT_TH_FP_REG(%l7,%f22,0x4D085CC032C37DE6)
	INIT_TH_FP_REG(%l7,%f24,0x56C8B05F1464D2C7)
	INIT_TH_FP_REG(%l7,%f26,0x4A38CFED637031B1)
	INIT_TH_FP_REG(%l7,%f28,0x8929F663E3A95357)
	INIT_TH_FP_REG(%l7,%f30,0xC27189A7BAB01F04)
	!# Other state
	
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xC0E, 	%hsys_tick_cmpr


	!# Execute Main Diag ..

	srl	%i7,	%l0,	%i5
	rdhpr	%hsys_tick_cmpr,	%i1
	fba,a	%fcc0,	loop_1
	fpsub16	%f2,	%f0,	%f22
	rd	%sys_tick_cmpr,	%l5
	wrpr	%o0,	%i3,	%cwp
loop_1:
	rdpr	%tl,	%o1
	wr	%i4,	%g2,	%sys_tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%hintp,	%o4
	rdhpr	%hsys_tick_cmpr,	%g5
	rdpr	%cansave,	%g7
	fpadd16	%f26,	%f22,	%f6
	rd	%softint,	%l2
	rdpr	%wstate,	%l4
	wr	%o3,	0x00CC,	%sys_tick
	edge8ln	%g1,	%i0,	%o5
	wr	%o6,	0x1CD1,	%pic

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x940, 	%hsys_tick_cmpr
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
        wr    %g0,    0xe,    %pcr    ! changed.

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x4D0, 	%hsys_tick_cmpr
	bleu,pt	%xcc,	loop_2
	wr 	%g0, 	0x4, 	%fprs
	wrpr	%l6,	%i7,	%tick
	rdpr	%canrestore,	%l0
loop_2:
	tg	%xcc,	0x0
	wrpr	%i5,	%i1,	%cwp
	wr	%l5,	%o0,	%y
	rd	%sys_tick_cmpr,	%i2
	rdpr	%cansave,	%i3
	movrlez	%i4,	0x2B2,	%g2
	wrpr	%g6,	%o1,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x83E, 	%sys_tick_cmpr
	rdpr	%tl,	%o4
	std	%f2,	[%l7 + 0x18]
	movne	%xcc,	%g5,	%l2
	wrpr	%l4,	0x0505,	%cwp
	wrpr	%g7,	%o3,	%tick
	rdhpr	%hintp,	%i0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	alignaddrl	%g1,	%i6,	%o7
	rdpr	%cwp,	%o2
	rdpr	%wstate,	%l1
	taddcctv	%l3,	%g4,	%i7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%tl,	%l0
	rdhpr	%hintp,	%i1
	sll	%l5,	%o0,	%i5
	wrpr	%i2,	%i3,	%pil
	sdivcc	%i4,	0x03EB,	%g6
	wrpr	%o1,	0x1953,	%cwp
	movne	%xcc,	%g2,	%g3
	rdhpr	%htba,	%o4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xF82, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x594, 	%hsys_tick_cmpr
	rdpr	%cwp,	%o3
	wr	%l4,	0x1D50,	%y

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%tick_cmpr,	%o6
	sir	0x03BA
	fexpand	%f1,	%f8
	tgu	%xcc,	0x0
	rdhpr	%hpstate,	%g1
	fmovdvc	%icc,	%f8,	%f28

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	edge32ln	%i0,	%o2,	%l1
	sethi	0x101E,	%o7
	rdpr	%tl,	%g4
	rdhpr	%htba,	%l3
	rdpr	%tl,	%i7
	array16	%l0,	%i1,	%l5
	rdhpr	%hsys_tick_cmpr,	%o0
	rdpr	%gl,	%i5
	bvc,pt	%icc,	loop_3
	wr	%l6,	%i2,	%set_softint
	add	%l7,	0x58,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] %asi,	%i3,	%i4
loop_3:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%hintp,	%o1
	wr	%g2,	0x04FF,	%clear_softint
	sdiv	%o4,	0x0039,	%g3
	brlez	%l2,	loop_4
	rd	%softint,	%g5
	wrpr	%o3,	0x1CE2,	%cwp
	rdpr	%cleanwin,	%g7
loop_4:
	nop
	set	0x28, %o4
	stw	%o5,	[%l7 + %o4]

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xE1D, 	%hsys_tick_cmpr
	rdhpr	%hpstate,	%g1
	sra	%o6,	%i0,	%o2
	array8	%l1,	%i6,	%g4
	xorcc	%l3,	%i7,	%l0
	movvs	%icc,	%o7,	%l5
	brz,a	%i1,	loop_5
	rd	%sys_tick_cmpr,	%o0
	rdpr	%cwp,	%l6
	rd	%asi,	%i2
loop_5:
	rdpr	%cleanwin,	%i5
	wrpr	%i3,	0x0140,	%cwp
	rdhpr	%hsys_tick_cmpr,	%g6
	wrpr	%o1,	0x15B3,	%pil
	movne	%xcc,	%g2,	%i4
	edge32l	%g3,	%l2,	%o4
	fnor	%f24,	%f8,	%f16

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xB9C, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%hpstate,	%l4
	wr	%o5,	0x12EA,	%softint
	membar	0x09
	srl	%g1,	%o6,	%i0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fpadd32s	%f17,	%f28,	%f25
        wr    %g0,    0xe,    %pcr    ! changed.
	alignaddr	%l3,	%i7,	%l0
	rd	%sys_tick_cmpr,	%i6
	rdpr	%tba,	%l5
	fmovspos	%xcc,	%f9,	%f5
	fcmps	%fcc1,	%f9,	%f15
	rd	%sys_tick_cmpr,	%o7
	wrpr	%o0,	%i1,	%cwp
	rd	%asi,	%l6
	fmovdneg	%icc,	%f30,	%f3
	fbge,a	%fcc1,	loop_6
	smul	%i5,	%i3,	%i2
	tcs	%xcc,	0x1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x613, 	%hsys_tick_cmpr
loop_6:
	ldsb	[%l7 + 0x73],	%g6
	rd	%ccr,	%i4
	edge8ln	%g3,	%l2,	%o4
	tcs	%xcc,	0x0
	wr	%g2,	0x0C61,	%y
	rd	%sys_tick_cmpr,	%g7
	rdpr	%pil,	%o3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	sub	%l4,	%o5,	%o6
	wr	%g1,	0x1EE3,	%pic
	bl,pt	%xcc,	loop_7
	sethi	0x05DC,	%o2
	rd	%tick_cmpr,	%i0
	rd	%fprs,	%g4
loop_7:
	rdpr	%wstate,	%l3
        wr    %g0,    0xe,    %pcr    ! changed.
	rdhpr	%hintp,	%l0
	rdhpr	%htba,	%i6
	rd	%softint,	%l5
	rd	%ccr,	%l1
	fmovdvs	%icc,	%f31,	%f23
	or	%o7,	%i1,	%l6
	rdhpr	%htba,	%i5
	rdhpr	%htba,	%o0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	tleu	%xcc,	0x0
	rdpr	%otherwin,	%i3
	rdhpr	%htba,	%g6
	wrpr	%g3,	0x1A26,	%tick
	udivcc	%i4,	0x1457,	%l2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%tba,	%o3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fmovscs	%icc,	%f1,	%f7
	movre	%g5,	%o5,	%o6
	movrgez	%l4,	%g1,	%o2
	movle	%icc,	%i0,	%g4
        wr    %g0,    0xe,    %pcr    ! changed.
	rdpr	%tl,	%i6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%hpstate,	%l5
	bgu,a,pn	%xcc,	loop_8
	rdpr	%cleanwin,	%o7
	move	%icc,	%i1,	%l6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x050, 	%hsys_tick_cmpr
loop_8:
	edge16n	%o0,	%i5,	%i2
	taddcctv	%o1,	%i3,	%g6
	smul	%i4,	0x15D9,	%l2
	rdpr	%gl,	%o4
	sll	%g2,	0x09,	%g3
	rdhpr	%hpstate,	%g7
	fandnot2	%f30,	%f20,	%f2
	rdhpr	%htba,	%o3
	rdhpr	%hpstate,	%o5
	wr	%o6,	0x162F,	%set_softint
	rdpr	%canrestore,	%g5
	fmovdne	%xcc,	%f6,	%f6
	rd	%asi,	%g1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%g4,	%l4,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	edge16	%l3,	%i7,	%l5
	rdpr	%tba,	%i6
	fbn	%fcc1,	loop_9
	rdpr	%tl,	%o7
	rdpr	%canrestore,	%i1
	rdpr	%canrestore,	%l6
loop_9:
	sllx	%l1,	%o0,	%i5
	rd	%sys_tick_cmpr,	%o1
	rd	%sys_tick_cmpr,	%i3
	fpadd32s	%f25,	%f5,	%f17

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	orn	%g6,	0x0D86,	%l2
	fmovsle	%icc,	%f7,	%f11
	wrpr	%o4,	%g2,	%pil
	wrpr	%g3,	%g7,	%cwp
	wr	%o3,	0x0025,	%clear_softint
	fpsub32s	%f12,	%f22,	%f16
	rdhpr	%hintp,	%o5
	rdhpr	%hintp,	%o6
	edge32n	%g1,	%g5,	%o2
	fbul	%fcc0,	loop_10
	rdhpr	%hsys_tick_cmpr,	%i0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%l3,	%l0,	%cwp
loop_10:
	wr	%i7,	%l5,	%set_softint
	wr 	%g0, 	0x6, 	%fprs
	nop
	set	0x24, %g7
	lduw	[%l7 + %g7],	%o7
	rd	%tick_cmpr,	%l6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%cansave,	%o0
	andn	%i5,	%o1,	%i3
	rd	%asi,	%i4
	wrpr	%g6,	%i2,	%cwp
	bvs	loop_11
	tneg	%xcc,	0x0
	wr	%l2,	%g2,	%ccr
	tg	%xcc,	0x4
loop_11:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	taddcc	%g3,	%o3,	%o6
	sdivcc	%g1,	0x17F3,	%o5
	rdhpr	%hintp,	%g5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x5BE, 	%hsys_tick_cmpr
	rd	%asi,	%l4
	wrpr	%l3,	0x1508,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x988, 	%sys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x805, 	%sys_tick_cmpr
	rdhpr	%htba,	%i6
	fbne	%fcc1,	loop_12
	edge16	%o7,	%i7,	%i1
	fornot2s	%f6,	%f26,	%f24
	fandnot1	%f30,	%f14,	%f2
loop_12:
	tsubcctv	%l1,	%l6,	%i5
	fxors	%f22,	%f14,	%f18
	edge8ln	%o1,	%o0,	%i3
	movle	%xcc,	%i4,	%i2
	rdpr	%tba,	%l2
	tcs	%icc,	0x0
	wrpr	%g2,	0x16CA,	%cwp
	fbue,a	%fcc3,	loop_13
	rdhpr	%hintp,	%o4
	wr	%g0,	0x04,	%asi
	ldxa	[%l7 + 0x48] %asi,	%g6
loop_13:
	nop
	setx loop_14, %l0, %l1
	jmpl %l1, %g3
	smulcc	%g7,	%o3,	%g1
	rdpr	%gl,	%o5
	movcc	%xcc,	%o6,	%i0
loop_14:
	wrpr	%o2,	%g5,	%pil
	movge	%xcc,	%l4,	%l3
        wr    %g0,    0xe,    %pcr    ! changed.
	fnands	%f11,	%f15,	%f16
	andncc	%l5,	%i6,	%g4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xF5D, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	ta	%xcc,	0x3
	siam	0x5
	subc	%l6,	%i5,	%o1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fbu	%fcc1,	loop_15
	movg	%icc,	%o0,	%i3
	rdhpr	%hintp,	%i2
	fxor	%f30,	%f2,	%f22
loop_15:
	xor	%i4,	%g2,	%o4
	srlx	%l2,	0x05,	%g3
	mova	%icc,	%g6,	%o3
	rdpr	%tl,	%g7
	rdpr	%cansave,	%g1
	rdhpr	%hintp,	%o6
	lduw	[%l7 + 0x18],	%o5
	rdpr	%tl,	%i0
	orcc	%o2,	0x10F3,	%g5
	fcmps	%fcc1,	%f26,	%f20
	rdhpr	%htba,	%l3
	fsrc1	%f28,	%f10
	rdpr	%gl,	%l0
	tl	%xcc,	0x1
	add	%l7,	0x34,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%l5,	%l4
	andncc	%g4,	%i7,	%i6
	bpos,pt	%xcc,	loop_16
	rd	%asi,	%l1
	rdhpr	%hpstate,	%l6
	wrpr	%i5,	0x1009,	%cwp
loop_16:
	fmovsn	%icc,	%f26,	%f30

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	rdpr	%pil,	%i1
	wr	%g0,	0x04,	%asi
	stxa	%o7,	[%l7 + 0x50] %asi
	rd	%ccr,	%o0
	movre	%i3,	0x2E6,	%i2
	fpack16	%f4,	%f22
	rdhpr	%htba,	%g2
	andncc	%o4,	%i4,	%g3
	movrgz	%l2,	0x06F,	%g6
	wr	%o3,	%g1,	%clear_softint
	wr 	%g0, 	0x4, 	%fprs
	tne	%xcc,	0x1
	fbn,a	%fcc1,	loop_17
	wr	%o5,	0x070F,	%clear_softint
	fbl,a	%fcc0,	loop_18
	rd	%softint,	%i0
loop_17:
	wr	%g7,	%o2,	%softint
	rdhpr	%hsys_tick_cmpr,	%l3
loop_18:
	fpack32	%f12,	%f24,	%f28
	fbg	%fcc3,	loop_19
	rd	%fprs,	%l0
	rdpr	%pil,	%l5
	alignaddrl	%g5,	%g4,	%i7
loop_19:
	xorcc	%i6,	%l4,	%l1
	udiv	%l6,	0x13DC,	%o1
	rdhpr	%hpstate,	%i5
	wr	%i1,	0x07BC,	%sys_tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%cansave,	%i3
	xnorcc	%o0,	0x1A51,	%g2
	wr	%i2,	%o4,	%y
	srlx	%i4,	0x0D,	%l2
	wrpr	%g6,	0x1499,	%cwp
	edge32ln	%o3,	%g1,	%g3
	wrpr	%o5,	%o6,	%cwp
	fsrc1s	%f30,	%f17
	wrpr	%g7,	0x0E90,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%l0,	0x177D,	%pil
	rdhpr	%hsys_tick_cmpr,	%l3
	wrpr	%l5,	%g5,	%pil
	rdhpr	%hintp,	%g4
	subccc	%i6,	0x1EB7,	%i7
	rdhpr	%hintp,	%l4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xB86, 	%hsys_tick_cmpr
	rdhpr	%hsys_tick_cmpr,	%l6
	subccc	%i5,	0x06C5,	%o1
	sdivx	%i1,	0x14B1,	%i3
	nop
	setx loop_20, %l0, %l1
	jmpl %l1, %o7
	tvs	%xcc,	0x6
	rdpr	%gl,	%g2
	wr 	%g0, 	0x7, 	%fprs
loop_20:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%l2,	0x02FB,	%pil
	bleu,a	%icc,	loop_21
	and	%g6,	%o3,	%g1
	array32	%o4,	%o5,	%o6
	tvs	%icc,	0x0
loop_21:
	rd	%fprs,	%g3
	wr	%g7,	%i0,	%ccr
	wr	%o2,	%l3,	%pic
	ldstub	[%l7 + 0x20],	%l5
	fmovdleu	%icc,	%f13,	%f24
	andn	%g5,	0x0CF6,	%l0
	rdpr	%tba,	%i6
	fmul8x16al	%f27,	%f4,	%f18
	movpos	%icc,	%i7,	%g4
	wrpr	%l4,	%l6,	%cwp
	rdhpr	%hintp,	%i5
	umulcc	%o1,	%i1,	%l1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	addcc	%o0,	%i4,	%g6
	rd	%tick_cmpr,	%l2
	fmovsgu	%xcc,	%f8,	%f9
	fpack32	%f8,	%f22,	%f26
	fmovsvc	%xcc,	%f2,	%f28
        wr    %g0,    0xe,    %pcr    ! changed.

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	tn	%xcc,	0x5
	rd	%fprs,	%o6
	bn	loop_22
	array8	%o4,	%g7,	%i0
	call	loop_23
	tne	%xcc,	0x2
loop_22:
	fpmerge	%f29,	%f5,	%f14
	fxnor	%f8,	%f24,	%f22
loop_23:
	wr	%g3,	%l3,	%softint
	tn	%xcc,	0x2
	udivx	%o2,	0x17D4,	%l5
	srlx	%l0,	0x04,	%g5
	rd	%fprs,	%i7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xBA3, 	%tick_cmpr
	bg,a	loop_24
	tcs	%icc,	0x7
	sdivcc	%l4,	0x015D,	%l6
	rdpr	%cwp,	%i5
loop_24:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fexpand	%f27,	%f10

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	brnz,a	%o7,	loop_25
	wr	%l1,	0x1FC7,	%softint
	movn	%xcc,	%i3,	%i2
	rd	%sys_tick_cmpr,	%g2
loop_25:
	fmul8sux16	%f24,	%f22,	%f18
	bpos	%icc,	loop_26
	fmovsgu	%icc,	%f13,	%f13
	andcc	%i4,	%g6,	%l2
	rdpr	%wstate,	%o3
loop_26:
	subcc	%g1,	0x0EB8,	%o5
	addcc	%o6,	%o4,	%g7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x767, 	%hsys_tick_cmpr
	rdpr	%cansave,	%g3
	fcmpgt32	%f10,	%f10,	%l3
	rd	%fprs,	%o2
	movpos	%xcc,	%l5,	%g5
        wr    %g0,    0xe,    %pcr    ! changed.
	ldstub	[%l7 + 0x5F],	%g4
	rdhpr	%hintp,	%l4
	rdpr	%cwp,	%l6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x741, 	%tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%o1,	%i1,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x66C, 	%sys_tick_cmpr
	wr	%o7,	%i3,	%pic
	edge16l	%g2,	%i4,	%g6
	wr 	%g0, 	0x4, 	%fprs
	wrpr	%o3,	0x187A,	%tick
	wr	%g1,	0x13DA,	%y
	faligndata	%f28,	%f28,	%f20

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%tick_cmpr,	%l2
	fbug	%fcc3,	loop_27
	andn	%o4,	%o6,	%i0
        wr    %g0,    0xe,    %pcr    ! changed.
	wrpr	%l3,	%g3,	%pil
loop_27:
	edge32	%l5,	%o2,	%g5
	bvs,a	%icc,	loop_28
	wrpr	%g4,	%l0,	%tick
	rd	%tick_cmpr,	%l4
	set	0x59, %l5
	ldsba	[%l7 + %l5] 0x18,	%l6
loop_28:
	wr	%i7,	0x12EB,	%pic
	wr 	%g0, 	0x6, 	%fprs
	rdpr	%gl,	%o1
	rdpr	%tl,	%i5
	rdhpr	%hsys_tick_cmpr,	%l1
	std	%f12,	[%l7 + 0x08]
	move	%xcc,	%o7,	%i1
	rd	%pc,	%g2
	rdhpr	%hpstate,	%i3
	wrpr	%i4,	%g6,	%cwp
	rdpr	%otherwin,	%o3
	ldsw	[%l7 + 0x50],	%g1
	wrpr	%i2,	%o5,	%pil
	stw	%l2,	[%l7 + 0x48]
	rdhpr	%htba,	%o4
	be,a,pn	%icc,	loop_29
	rdhpr	%htba,	%i0
	brgz	%o6,	loop_30
	rd	%pc,	%g7
loop_29:
	rdhpr	%hintp,	%o0
	edge32	%l3,	%g3,	%o2
loop_30:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	rd	%pc,	%l5
        wr    %g0,    0xe,    %pcr    ! changed.
	rdpr	%cansave,	%l0
	tne	%icc,	0x5
	rdpr	%tl,	%l4
	rdpr	%gl,	%g5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xC7C, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x5D9, 	%hsys_tick_cmpr
	brlz	%o1,	loop_31
	xnor	%l6,	0x00D6,	%l1
	add	%i5,	%o7,	%g2
	fmovsne	%icc,	%f24,	%f4
loop_31:
	rdpr	%canrestore,	%i1
	fmovscs	%icc,	%f3,	%f11
	sethi	0x0F01,	%i4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%g1,	%i2,	%tick
	rdpr	%pil,	%o5
	rdpr	%otherwin,	%g6
	wrpr	%o4,	0x11E9,	%cwp
	wrpr	%l2,	%o6,	%tick
	rdhpr	%hintp,	%g7
	fnot2s	%f10,	%f15
	alignaddrl	%o0,	%l3,	%i0
	tsubcctv	%o2,	0x1E2C,	%g3
	orcc	%g4,	%l0,	%l5
	edge16	%l4,	%g5,	%i7
	addcc	%o1,	0x1457,	%i6
	edge16l	%l6,	%i5,	%o7
	wr 	%g0, 	0x7, 	%fprs
	tge	%icc,	0x6
	mova	%xcc,	%i1,	%l1
	wr 	%g0, 	0x6, 	%fprs
	wrpr	%o3,	%i3,	%tick
	rdhpr	%hpstate,	%g1
	rdpr	%otherwin,	%i2
	rdpr	%cansave,	%g6
	wr 	%g0, 	0x5, 	%fprs
	mova	%xcc,	%l2,	%o4
	brgz	%o6,	loop_32
	edge8ln	%g7,	%o0,	%i0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xDD3, 	%hsys_tick_cmpr
	wrpr	%o2,	0x1A09,	%pil
loop_32:
	nop
	set	0x20, %i6
	lda	[%l7 + %i6] 0x11,	%f26
	movcc	%icc,	%g4,	%g3
	fpadd32	%f28,	%f4,	%f22
	udivcc	%l5,	0x140B,	%l0
	rd	%fprs,	%l4
	movrgez	%g5,	0x168,	%o1
	set	0x64, %g6
	lda	[%l7 + %g6] 0x88,	%f10

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	movrgz	%i5,	0x020,	%l6
	fmovrdgez	%g2,	%f8,	%f16
	xnorcc	%i1,	0x1BDB,	%o7
	movge	%icc,	%i4,	%o3
	wr	%i3,	0x18C2,	%y
	andcc	%g1,	%i2,	%g6
	udiv	%o5,	0x1CC8,	%l2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xA3D, 	%hsys_tick_cmpr
	edge16l	%o4,	%o6,	%o0
	rdhpr	%htba,	%g7
	rdhpr	%htba,	%l3
	rd	%fprs,	%o2
	wr	%g4,	%g3,	%softint
	ldstub	[%l7 + 0x67],	%l5
	move	%xcc,	%l0,	%i0
	and	%l4,	0x0384,	%g5
	rdhpr	%htba,	%o1
	rdhpr	%hsys_tick_cmpr,	%i6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	movpos	%xcc,	%g2,	%i1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x8C4, 	%hsys_tick_cmpr
	wr	%o3,	%i3,	%pic
	rdhpr	%htba,	%g1
	rdhpr	%htba,	%i4
	rdhpr	%hsys_tick_cmpr,	%i2
	wr	%g0,	0x11,	%asi
	stwa	%g6,	[%l7 + 0x58] %asi
	rdhpr	%hintp,	%l2
	mulx	%l1,	0x0880,	%o5
	rdpr	%tba,	%o6
	rdhpr	%hpstate,	%o4
	rdhpr	%hsys_tick_cmpr,	%g7
	fmovsle	%icc,	%f29,	%f20
	rd	%pc,	%l3
	taddcc	%o0,	0x1713,	%o2
	movne	%xcc,	%g3,	%l5
	wrpr	%g4,	0x0D44,	%tick
	wr	%i0,	0x1D75,	%sys_tick
	rdhpr	%hintp,	%l0
	edge8ln	%g5,	%l4,	%i6
	wr	%i5,	%i7,	%ccr
	addc	%o1,	%g2,	%i1
	wrpr	%o7,	%o3,	%pil
	movvc	%icc,	%i3,	%g1
	tneg	%xcc,	0x5
	wrpr	%i4,	%l6,	%tick
	tl	%icc,	0x5
	wrpr	%i2,	%g6,	%cwp
	ldsw	[%l7 + 0x78],	%l1
	rdhpr	%hsys_tick_cmpr,	%o5
	rd	%pc,	%o6
	rdhpr	%hpstate,	%o4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sethi	0x02D5,	%g7
	rd	%fprs,	%l2
	edge32ln	%l3,	%o0,	%g3
	fmovdleu	%icc,	%f29,	%f8

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xD7D, 	%hsys_tick_cmpr
	rdpr	%cwp,	%i0
	movpos	%icc,	%l0,	%g4
	rdhpr	%hpstate,	%g5
	rdpr	%canrestore,	%l4
	tvs	%icc,	0x6
	movrgez	%i6,	%i7,	%i5
	rd	%sys_tick_cmpr,	%o1
	rdhpr	%htba,	%g2
	wr	%o7,	0x19C3,	%clear_softint
	rdpr	%tl,	%o3
	wr	%i3,	0x079A,	%y
	edge8ln	%g1,	%i1,	%l6
	fbuge,a	%fcc1,	loop_33
	rd	%ccr,	%i4
	nop
	setx loop_34, %l0, %l1
	jmpl %l1, %g6
	sdiv	%l1,	0x1242,	%o5
loop_33:
	fmovsn	%icc,	%f0,	%f14
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_34:
	sethi	0x15E1,	%o6
	wrpr	%o4,	%i2,	%tick
	rdhpr	%hsys_tick_cmpr,	%l2
	wrpr	%g7,	0x1A51,	%cwp
	membar	0x1F
	rdhpr	%hpstate,	%l3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x8CD, 	%hsys_tick_cmpr
	wrpr	%g3,	%l5,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xE1E, 	%hsys_tick_cmpr
	rdhpr	%hpstate,	%i0
	fpackfix	%f8,	%f6
	edge8n	%g4,	%l4,	%g5
	movcc	%icc,	%i6,	%i7
	rd	%fprs,	%i5
	edge32ln	%g2,	%o1,	%o3
	rdhpr	%hpstate,	%i3
	wr	%g1,	%o7,	%sys_tick
	rdpr	%otherwin,	%i1
	rd	%fprs,	%i4
	edge8ln	%g6,	%l6,	%l1
	fmovspos	%icc,	%f15,	%f12
	tvs	%icc,	0x0
	rdpr	%tba,	%o6
	wrpr	%o4,	%o5,	%pil
	wrpr	%i2,	0x0CA0,	%cwp
	movpos	%xcc,	%g7,	%l3
	rdhpr	%hpstate,	%l2
	orncc	%o0,	%g3,	%o2
	rd	%softint,	%l5
	taddcctv	%l0,	%i0,	%l4
	rd	%asi,	%g4
	rdpr	%tl,	%g5
	set	0x10, %i1
	stda	%i6,	[%l7 + %i1] 0x15
	array8	%i7,	%i5,	%o1
	fble,a	%fcc2,	loop_35
	rdpr	%otherwin,	%o3
	movrlz	%g2,	%g1,	%i3
	sethi	0x1271,	%i1
loop_35:
	wrpr	%o7,	%g6,	%tick
	fands	%f23,	%f1,	%f19
	rdpr	%otherwin,	%i4
	wr	%g0,	0x88,	%asi
	sta	%f3,	[%l7 + 0x40] %asi

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xC75, 	%hsys_tick_cmpr
	wr 	%g0, 	0x7, 	%fprs
	wrpr	%o4,	%o6,	%tick
	rdpr	%tba,	%o5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%fprs,	%i2
	rd	%tick_cmpr,	%l2
	wrpr	%o0,	0x1553,	%cwp
	fba	%fcc3,	loop_36
	movvs	%xcc,	%g3,	%l3
	fands	%f24,	%f15,	%f13

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_36:
	fmul8x16al	%f8,	%f11,	%f18

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
        wr    %g0,    0xe,    %pcr    ! changed.
	fmovdpos	%icc,	%f29,	%f9
	rd	%tick_cmpr,	%l0
	sub	%g4,	%g5,	%i6
	wr	%i5,	%i7,	%softint

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x7F5, 	%hsys_tick_cmpr
	sllx	%g1,	%o1,	%i1
	subc	%i3,	0x0415,	%o7
	rdhpr	%hsys_tick_cmpr,	%i4
	nop
	set	0x15, %i2
	ldub	[%l7 + %i2],	%l1
	fbn	%fcc3,	loop_37
	mova	%icc,	%l6,	%o4
	rdpr	%tba,	%o6
	rdhpr	%hpstate,	%g6
loop_37:
	rd	%y,	%o5
	rd	%tick_cmpr,	%i2
	rdhpr	%hsys_tick_cmpr,	%g7
	taddcctv	%o0,	0x128A,	%g3
	fmovscs	%icc,	%f31,	%f31
	wr	%g0,	0x80,	%asi
	sta	%f6,	[%l7 + 0x1C] %asi
	pdist	%f18,	%f16,	%f12

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
        wr    %g0,    0xe,    %pcr    ! changed.
	fandnot1s	%f16,	%f11,	%f23
	movre	%l4,	0x28F,	%i0
	fmuld8ulx16	%f5,	%f16,	%f14
	rdpr	%tba,	%g4
	rd	%y,	%g5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%pil,	%i7
	rdhpr	%hsys_tick_cmpr,	%o3
	array8	%i5,	%g2,	%g1
	wrpr	%o1,	0x1D0A,	%pil
	prefetch	[%l7 + 0x58],	 0x1
	rdhpr	%hintp,	%i3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x4C1, 	%hsys_tick_cmpr
	rdhpr	%hintp,	%l1
	wrpr	%l6,	%i4,	%cwp
	fsrc2s	%f5,	%f0
	rd	%y,	%o4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%softint,	%o5
	wr	%g6,	%g7,	%ccr
	smulcc	%o0,	%g3,	%l3
	te	%icc,	0x6
	tvc	%xcc,	0x3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x482, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x61B, 	%hsys_tick_cmpr
	edge32	%l2,	%l4,	%i0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%g5,	%g4,	%pil
	brnz,a	%i6,	loop_38
	st	%f3,	[%l7 + 0x64]
	bl,a	loop_39
	mulscc	%l0,	0x1138,	%i7
loop_38:
	alignaddrl	%o3,	%g2,	%i5
	rdhpr	%htba,	%o1
loop_39:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xF15, 	%hsys_tick_cmpr
	wrpr	%g1,	%i1,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	movrlz	%l6,	%o7,	%o4
	wrpr	%o6,	0x04DC,	%cwp
	andcc	%i4,	%g6,	%o5
	edge16n	%o0,	%g7,	%l3
	rd	%tick_cmpr,	%g3
	rdhpr	%htba,	%i2
	tn	%icc,	0x0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	rdhpr	%hsys_tick_cmpr,	%l5
	rdpr	%cleanwin,	%i0
	wrpr	%l4,	%g5,	%cwp
	rd	%pc,	%g4
	wrpr	%o2,	0x1BAA,	%tick
	rdhpr	%hpstate,	%i6
	fnegd	%f8,	%f20
	bg	loop_40
	rd	%ccr,	%i7
	rdpr	%cwp,	%o3
	wrpr	%l0,	%i5,	%pil
loop_40:
	rdhpr	%htba,	%o1
	movrne	%i3,	%g1,	%i1
	rdhpr	%htba,	%l1
	orcc	%g2,	%l6,	%o4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x4C9, 	%hsys_tick_cmpr
	tge	%xcc,	0x3
	wrpr	%i4,	0x12B8,	%pil
	subcc	%o6,	%o5,	%o0
	fmovsge	%icc,	%f2,	%f1
	rdpr	%tl,	%g6
	swap	[%l7 + 0x54],	%g7
	rdhpr	%hpstate,	%g3
	rdhpr	%hpstate,	%l3
	wrpr	%i2,	%l2,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%softint,	%l5
	udiv	%g4,	0x1EFF,	%g5
	sra	%o2,	0x14,	%i7
	rdhpr	%hsys_tick_cmpr,	%o3
	rd	%fprs,	%i6
	rd	%tick_cmpr,	%l0
	edge8	%o1,	%i5,	%i3
	rdhpr	%hpstate,	%g1
	rdhpr	%hpstate,	%l1
	tvc	%xcc,	0x3
	wr 	%g0, 	0x5, 	%fprs
	rd	%fprs,	%l6
	wrpr	%o7,	%o4,	%cwp
	wrpr	%i4,	0x1BA1,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%htba,	%o0
	rdpr	%pil,	%g6
	rdhpr	%htba,	%g3
	addcc	%g7,	0x1158,	%l3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	brlz,a	%l5,	loop_41
	movvc	%icc,	%i0,	%g5
	fmuld8sux16	%f4,	%f8,	%f4
	fmovdvc	%xcc,	%f5,	%f25
loop_41:
	fmovdne	%xcc,	%f8,	%f2
	wr 	%g0, 	0x5, 	%fprs
	rdhpr	%htba,	%o3
	fcmps	%fcc0,	%f3,	%f22
	wr	%i6,	%l0,	%ccr
	rd	%softint,	%o1
	fblg	%fcc1,	loop_42
	rdpr	%tba,	%o2
	set	0x40, %o0
	stda	%f16,	[%l7 + %o0] 0x80
loop_42:
	nop
	wr	%g0,	0xe3,	%asi
	ldda	[%l7 + 0x60] %asi,	%i4
	wrpr	%g1,	%l1,	%tick
	wrpr	%g2,	0x0BA4,	%cwp
	rdhpr	%hsys_tick_cmpr,	%i1
	rd	%pc,	%l6
	set	0x7E, %o7
	lduha	[%l7 + %o7] 0x11,	%o7
	tne	%icc,	0x6
	wr	%o4,	%i3,	%softint
	movg	%icc,	%o5,	%o6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x587, 	%hsys_tick_cmpr
	rdpr	%cansave,	%g3
	nop
	set	0x28, %g3
	ldd	[%l7 + %g3],	%f6
	movneg	%xcc,	%o0,	%g7
	rdpr	%tl,	%i2
	wr	%l2,	%l4,	%pic
	xnorcc	%l5,	0x1CD8,	%l3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	call	loop_43
	wr	%g4,	%o3,	%pic
	prefetch	[%l7 + 0x50],	 0x3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_43:
	rdpr	%tba,	%o1
	fcmpeq16	%f6,	%f14,	%o2
	wrpr	%i5,	0x18BD,	%cwp
	rdhpr	%hintp,	%i7
	wr	%l1,	%g1,	%sys_tick
	wr	%i1,	%l6,	%softint

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x5C4, 	%tick_cmpr
	rdpr	%wstate,	%o7
	fnor	%f0,	%f30,	%f4
	rdpr	%pil,	%o4
	wr	%o5,	0x027D,	%softint
	udivcc	%i3,	0x00BF,	%o6
	wrpr	%i4,	0x01D7,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	rd	%pc,	%o0
	movcc	%icc,	%i2,	%l2
	umul	%g7,	%l5,	%l4
	wrpr	%l3,	%g5,	%cwp
	rdhpr	%hintp,	%i0
	movrgez	%o3,	%g4,	%l0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x2B2, 	%hsys_tick_cmpr
	subccc	%o2,	0x0059,	%i5
	rd	%y,	%l1
	rdpr	%cansave,	%g1
	fbn	%fcc3,	loop_44
	wr	%i1,	0x1C1A,	%softint
	wrpr	%l6,	0x193C,	%tick
	fbule,a	%fcc2,	loop_45
loop_44:
        wr    %g0,    0xe,    %pcr    ! changed.
	wr	%o4,	0x193D,	%y
	popc	0x00C4,	%g2
loop_45:
	ld	[%l7 + 0x18],	%f14

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xC88, 	%hsys_tick_cmpr
	fcmpeq32	%f16,	%f28,	%i4
	set	0x38, %o2
	prefetcha	[%l7 + %o2] 0x80,	 0x0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	rdhpr	%hintp,	%g3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x5CA, 	%hsys_tick_cmpr
	wrpr	%i2,	0x1DCF,	%pil
	tleu	%icc,	0x5
	wr	%o0,	0x1CD5,	%y
	movrgez	%g7,	%l2,	%l5
	sub	%l4,	0x1F5E,	%l3
	rd	%softint,	%g5
	wrpr	%o3,	%g4,	%cwp
	rdhpr	%hpstate,	%l0
	fmovrdgz	%i6,	%f30,	%f2
	nop
	set	0x64, %i4
	lduh	[%l7 + %i4],	%i0
	wr 	%g0, 	0x7, 	%fprs

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xD5C, 	%hsys_tick_cmpr
	fornot2s	%f0,	%f29,	%f7
	movrgz	%g1,	%i1,	%o1
	rdhpr	%hintp,	%l6
	rd	%fprs,	%o7
	rdpr	%pil,	%o4
	wr 	%g0, 	0x4, 	%fprs
	alignaddrl	%i7,	%i3,	%i4
	wrpr	%o5,	%o6,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x319, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xE1C, 	%hsys_tick_cmpr
	rd	%pc,	%o0
	rdpr	%canrestore,	%l5
	tsubcctv	%l4,	0x192B,	%l2
	rdhpr	%hsys_tick_cmpr,	%l3
	wrpr	%g5,	0x107D,	%tick
	wrpr	%o3,	0x018C,	%tick
	fmovrdlez	%l0,	%f26,	%f22
        wr    %g0,    0xe,    %pcr    ! changed.

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xA78, 	%sys_tick_cmpr
	membar	#Sync
	wr	%g0,	0x17,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	rdhpr	%hsys_tick_cmpr,	%i0
	wrpr	%l1,	%i5,	%tick
	wr 	%g0, 	0x5, 	%fprs
	rd	%fprs,	%o1
	edge16n	%l6,	%o7,	%g1
	movcs	%xcc,	%g2,	%i7
	rdpr	%tba,	%i3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xF3D, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x0EF, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xFD4, 	%tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	bpos	%xcc,	loop_46
	mulx	%g3,	%o0,	%g7
	brlz,a	%l4,	loop_47
	rdpr	%gl,	%l5
loop_46:
	rdpr	%wstate,	%l2
	tpos	%xcc,	0x3
loop_47:
	rdpr	%pil,	%g5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x1EA, 	%sys_tick_cmpr
	rdpr	%gl,	%l3
	rd	%pc,	%l0
	udivx	%i6,	0x172C,	%g4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%canrestore,	%o2
	rdhpr	%hpstate,	%i1
	movleu	%xcc,	%o1,	%l6
	fmovdl	%icc,	%f16,	%f20
	movrlez	%i5,	0x192,	%g1
	movvc	%xcc,	%o7,	%g2
	movl	%xcc,	%i7,	%o4
	rdpr	%tba,	%i4
	or	%i3,	%o6,	%g6
	rdpr	%otherwin,	%o5
	brgez	%g3,	loop_48
	fmul8x16al	%f23,	%f9,	%f14
	add	%i2,	%g7,	%o0
	rd	%tick_cmpr,	%l5
loop_48:
	wrpr	%l2,	%g5,	%cwp
	rdhpr	%hintp,	%l4
	rdhpr	%hsys_tick_cmpr,	%l3
	ldstub	[%l7 + 0x2F],	%o3
	movgu	%xcc,	%i6,	%g4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%l1,	0x0C9C,	%softint
	wr	%g0,	0x81,	%asi
	lduba	[%l7 + 0x0D] %asi,	%i0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x783, 	%hsys_tick_cmpr
	fzero	%f2
	add	%l7,	0x08,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%o1,	%o2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	sdivx	%g1,	0x149D,	%o7
	edge32n	%i7,	%g2,	%o4
	wrpr	%i3,	0x0CD1,	%pil
	umul	%o6,	0x1402,	%g6
	movpos	%xcc,	%i4,	%o5
	lduw	[%l7 + 0x2C],	%i2
	wr	%g7,	%o0,	%sys_tick
	rdhpr	%hintp,	%g3
	rdhpr	%hsys_tick_cmpr,	%l5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xB24, 	%hsys_tick_cmpr
	rdpr	%gl,	%l4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	tle	%xcc,	0x7
	wrpr	%i6,	0x02EC,	%pil
	std	%f0,	[%l7 + 0x28]
	fbne,a	%fcc3,	loop_49
	fbu,a	%fcc3,	loop_50
	wrpr	%o3,	0x10C1,	%cwp
	rdhpr	%hintp,	%g4
loop_49:
	rd	%fprs,	%l1
loop_50:
	wrpr	%i0,	0x165C,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	edge16ln	%i1,	%o2,	%o1
	fbue	%fcc0,	loop_51
	wrpr	%i5,	%l6,	%pil
	andncc	%g1,	%i7,	%g2
	wrpr	%o7,	%i3,	%pil
loop_51:
	edge32	%o4,	%g6,	%i4
	wr	%g0,	0x80,	%asi
	stwa	%o5,	[%l7 + 0x38] %asi
	rdpr	%cleanwin,	%o6
	orn	%i2,	0x0FB8,	%g7
	array16	%o0,	%g3,	%g5
	rd	%asi,	%l5
	rd	%fprs,	%l4
	brgez	%l2,	loop_52
	edge8	%i6,	%l3,	%g4
	rd	%softint,	%o3
	wrpr	%l1,	0x1C92,	%pil
loop_52:
	wr 	%g0, 	0x6, 	%fprs

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	fmovrslez	%i0,	%f11,	%f29
	edge16	%i5,	%o1,	%g1
	wrpr	%i7,	0x193B,	%tick
	edge32ln	%g2,	%l6,	%o7
	fmul8ulx16	%f26,	%f20,	%f24
	rdpr	%tba,	%i3
	fmovdgu	%icc,	%f4,	%f22
	lduw	[%l7 + 0x3C],	%g6
        wr    %g0,    0xe,    %pcr    ! changed.
	rdpr	%cwp,	%o6
	wr	%o5,	%g7,	%set_softint
	fpsub32	%f0,	%f22,	%f14
	rdpr	%cansave,	%o0
	sdiv	%g3,	0x010F,	%i2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x6D9, 	%hsys_tick_cmpr
	bge	loop_53
	fors	%f31,	%f28,	%f5
	edge32ln	%l5,	%i6,	%l3
	fornot2	%f4,	%f0,	%f24
loop_53:
	rdhpr	%hpstate,	%g4
	wrpr	%o3,	0x1958,	%tick
	wrpr	%l2,	0x0557,	%pil
	rd	%pc,	%l1
	wrpr	%i1,	%o2,	%pil
	fble,a	%fcc0,	loop_54
	rdpr	%gl,	%l0
	fpsub32s	%f14,	%f29,	%f3
	set	0x50, %o3
	stwa	%i5,	[%l7 + %o3] 0xea
	membar	#Sync
loop_54:
	rd	%sys_tick_cmpr,	%i0
	rdhpr	%hintp,	%o1
	rdpr	%tl,	%g1
	rdhpr	%hpstate,	%g2
	fpsub16	%f10,	%f28,	%f24
	wr	%l6,	0x0931,	%ccr
	andn	%o7,	%i3,	%i7
	fornot1s	%f25,	%f18,	%f20
	rd	%pc,	%i4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	prefetch	[%l7 + 0x1C],	 0x0
	rdpr	%cleanwin,	%o5
	wr	%g7,	0x08D4,	%set_softint
	sdivx	%o0,	0x0933,	%o4
	wr	%i2,	%g5,	%sys_tick
	fmovsvc	%xcc,	%f2,	%f10
	wrpr	%l4,	%l5,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xA98, 	%tick_cmpr
	smul	%g4,	%o3,	%l2
	rd	%pc,	%l1
	wrpr	%g3,	0x0BC5,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	subccc	%i5,	%i0,	%o1
	stb	%o2,	[%l7 + 0x7C]
	wrpr	%g2,	%l6,	%cwp
	andncc	%o7,	%i3,	%i7
	set	0x6C, %l1
	ldsha	[%l7 + %l1] 0x89,	%i4
	wrpr	%g1,	0x07F8,	%pil
	tg	%xcc,	0x6
	array16	%g6,	%o5,	%g7
	flush	%l7 + 0x54
	fble,a	%fcc2,	loop_55
	wr 	%g0, 	0x6, 	%fprs
	rdhpr	%hsys_tick_cmpr,	%o4
	tcs	%xcc,	0x3
loop_55:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xC7E, 	%hsys_tick_cmpr
	xor	%i2,	%i6,	%l5
	rdhpr	%hsys_tick_cmpr,	%l3
	rdpr	%tba,	%o3
	rd	%asi,	%l2
	array32	%l1,	%g4,	%i1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	bshuffle	%f28,	%f20,	%f20
	rdhpr	%hpstate,	%o1
	wrpr	%g2,	0x01B3,	%cwp
	edge32n	%l6,	%o2,	%o7
	bcc,pt	%xcc,	loop_56
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x8CF, 	%hsys_tick_cmpr
	wrpr	%i7,	0x0923,	%cwp
loop_56:
	edge32l	%g6,	%g1,	%g7
	fbug	%fcc0,	loop_57
	wr 	%g0, 	0x7, 	%fprs
	xor	%o6,	0x02F5,	%o0
	wr	%g5,	%o4,	%y
loop_57:
	rdhpr	%hpstate,	%l4
	wrpr	%i6,	0x1CFB,	%pil
	fands	%f20,	%f11,	%f27
	edge8n	%l5,	%l3,	%o3
	rdpr	%tba,	%i2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fandnot1s	%f0,	%f25,	%f30

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x7E2, 	%hsys_tick_cmpr
	fpsub16	%f12,	%f10,	%f0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xADB, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%i1,	%i5,	%cwp
	rd	%fprs,	%g2
	sll	%o1,	0x0F,	%o2
	rdhpr	%htba,	%o7
	wrpr	%i3,	%i4,	%tick
	movge	%xcc,	%i7,	%l6
	rd	%fprs,	%g1
	wrpr	%g7,	0x07AF,	%tick
	rd	%y,	%o5
	fpadd16s	%f29,	%f8,	%f20
	wr	%g6,	0x0DDF,	%softint
	brgez	%o0,	loop_58
	tle	%xcc,	0x6
	rdpr	%otherwin,	%o6
	tne	%icc,	0x4
loop_58:
	wr	%g5,	0x0E09,	%softint
	tcs	%xcc,	0x3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xC2C, 	%hsys_tick_cmpr
	rdhpr	%hpstate,	%l5
	wrpr	%l4,	0x0517,	%tick
	rd	%sys_tick_cmpr,	%o3
	rd	%ccr,	%l3
	rdpr	%cwp,	%i2
	wrpr	%l2,	%g4,	%tick
	wrpr	%g3,	%l0,	%pil
	wr	%i0,	0x0A37,	%softint

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	smulcc	%l1,	%i5,	%g2
	rdpr	%canrestore,	%o1
	fbu,a	%fcc2,	loop_59
	wr	%o7,	0x0070,	%set_softint
	wr	%o2,	%i3,	%y

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xB93, 	%hsys_tick_cmpr
loop_59:
	fbe,a	%fcc3,	loop_60
	bn,a	loop_61
	edge32ln	%g1,	%g7,	%o5
	rdpr	%gl,	%g6
loop_60:
	fbge	%fcc2,	loop_62
loop_61:
	sll	%i4,	0x1A,	%o6
	wr	%o0,	%o4,	%set_softint
	srax	%i6,	0x19,	%l5
loop_62:
	wr	%l4,	0x1970,	%y
	xnor	%o3,	%g5,	%l3
	rd	%y,	%l2
	edge32l	%i2,	%g4,	%g3
	wrpr	%i0,	0x068F,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x6D1, 	%hsys_tick_cmpr
	fmovsa	%icc,	%f25,	%f1
	rd	%tick_cmpr,	%i5
	rdhpr	%hpstate,	%l0
	rdhpr	%hintp,	%g2
	wr	%o1,	%o7,	%set_softint
	rdpr	%gl,	%o2
	rd	%fprs,	%i7
	rdpr	%gl,	%l6
	rdhpr	%hintp,	%g1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x171, 	%hsys_tick_cmpr
	bne,a,pt	%icc,	loop_63
	rdpr	%cwp,	%o5
	rdhpr	%hintp,	%i4
	rdpr	%gl,	%g6
loop_63:
	rd	%asi,	%o0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%y,	%l4
	wr	%o3,	0x0BA1,	%sys_tick
	flush	%l7 + 0x14

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xCC8, 	%sys_tick_cmpr
	movg	%icc,	%l3,	%l5
	movrgz	%i2,	%l2,	%g4
	wrpr	%g3,	0x1225,	%cwp
	sllx	%i0,	%i1,	%l1
	nop
	set	0x40, %g5
	stx	%l0,	[%l7 + %g5]
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ble,a	%icc,	loop_64
	te	%xcc,	0x1
	fabss	%f24,	%f9
	fblg,a	%fcc2,	loop_65
loop_64:
	rdhpr	%hsys_tick_cmpr,	%i5
	add	%o1,	0x15F2,	%o7
	wr	%g0,	0x88,	%asi
	ldda	[%l7 + 0x50] %asi,	%g2
loop_65:
	wr	%o2,	%l6,	%sys_tick
	rd	%tick_cmpr,	%i7
	wr	%i3,	%g1,	%softint
	rd	%asi,	%g7
	rdpr	%wstate,	%i4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	rdhpr	%hsys_tick_cmpr,	%o0
	wrpr	%o6,	0x1A10,	%tick
	fnot2	%f28,	%f12
	wrpr	%g6,	%i6,	%pil
	andcc	%o4,	%l4,	%g5
	rdhpr	%htba,	%o3
	rdhpr	%hintp,	%l5
	tge	%xcc,	0x5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	mulscc	%l2,	%g4,	%g3
	fble	%fcc1,	loop_66
	udivx	%i2,	0x0A0C,	%i1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	taddcc	%i5,	%i0,	%o1
loop_66:
	fsrc2s	%f16,	%f3
	wr	%o7,	%o2,	%y
	rd	%ccr,	%g2
	wrpr	%l6,	0x00BF,	%cwp
	movn	%xcc,	%i7,	%i3
	wr	%g0,	0x0c,	%asi
	sta	%f29,	[%l7 + 0x48] %asi
	rd	%ccr,	%g1
	fzeros	%f25
	fbule	%fcc0,	loop_67
	wrpr	%i4,	0x07BA,	%pil
	rdhpr	%hpstate,	%g7
	bgu	%xcc,	loop_68
loop_67:
	rdhpr	%hintp,	%o0
	tl	%xcc,	0x6
	bne,pt	%xcc,	loop_69
loop_68:
	membar	0x21
	rdpr	%tba,	%o6
	rdpr	%cleanwin,	%o5
loop_69:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x9B4, 	%hsys_tick_cmpr
	rdpr	%cwp,	%g6
	rdpr	%otherwin,	%l4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%l5,	%l3,	%cwp
	rdhpr	%hpstate,	%l2
	rd	%sys_tick_cmpr,	%g5
	wrpr	%g4,	0x0774,	%cwp
	set	0x3C, %i7
	lduwa	[%l7 + %i7] 0x89,	%i2
	movvc	%icc,	%i1,	%l1
	fzero	%f0
	rdpr	%cleanwin,	%l0
	fmovrdgez	%i5,	%f10,	%f10
	rdhpr	%hintp,	%i0
	movcs	%xcc,	%g3,	%o7
	wr	%o1,	%o2,	%clear_softint
	rdhpr	%htba,	%g2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x205, 	%hsys_tick_cmpr
	rdhpr	%hsys_tick_cmpr,	%i7
	wrpr	%i4,	%g7,	%pil
	rdpr	%cleanwin,	%o0
	rd	%sys_tick_cmpr,	%o6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%y,	%g6
	wrpr	%l4,	0x00DD,	%cwp
	wr	%o4,	0x0026,	%clear_softint
	subc	%o5,	0x1C27,	%o3
	tpos	%xcc,	0x1
	bl,pn	%xcc,	loop_70
	addcc	%l5,	0x05CF,	%l2
	wr	%g5,	0x1BFC,	%clear_softint
	tpos	%icc,	0x6
loop_70:
	rdhpr	%hsys_tick_cmpr,	%g4
	rd	%ccr,	%i2
	rd	%sys_tick_cmpr,	%i1
	xor	%l3,	0x0BD3,	%l1
	movvs	%icc,	%l0,	%i5
	ba,pt	%icc,	loop_71
	brgez,a	%i0,	loop_72
	rd	%pc,	%o7
	wr	%o1,	0x0990,	%pic
loop_71:
	nop
	setx	loop_73,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_72:
	udivx	%o2,	0x1944,	%g3
	tpos	%xcc,	0x0
	rdhpr	%hsys_tick_cmpr,	%l6
loop_73:
	addc	%i3,	0x1036,	%i7
	edge32	%g2,	%i4,	%g7
	wr	%g0,	0x11,	%asi
	lduwa	[%l7 + 0x40] %asi,	%o0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%cwp,	%g6
	mova	%xcc,	%l4,	%o4
	rdpr	%otherwin,	%g1
	rdhpr	%htba,	%o3
	edge32n	%o5,	%l5,	%l2
	rdhpr	%hpstate,	%g4
	xorcc	%g5,	%i2,	%i1
	addc	%l3,	%l0,	%i5
	rd	%softint,	%l1
	rdhpr	%hpstate,	%i0
	orncc	%o1,	%o7,	%o2
	rdpr	%canrestore,	%g3
	smul	%l6,	%i7,	%g2
	popc	%i3,	%g7
	movgu	%icc,	%o0,	%i4
	umul	%i6,	0x1915,	%o6
	movrne	%l4,	%g6,	%g1
	rdpr	%cansave,	%o3
	tneg	%icc,	0x6
	fcmpgt16	%f30,	%f28,	%o5
	fcmpne32	%f2,	%f26,	%o4
	sdivcc	%l2,	0x0CEE,	%l5
	movvc	%icc,	%g4,	%i2
	bneg	%icc,	loop_74
	wrpr	%g5,	%l3,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fand	%f14,	%f24,	%f26
loop_74:
	rd	%softint,	%i5
	lduh	[%l7 + 0x0E],	%l0
	rd	%sys_tick_cmpr,	%i0
	fzeros	%f2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	edge16	%o2,	%o1,	%g3
	fmovdg	%icc,	%f2,	%f25

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x59B, 	%hsys_tick_cmpr
	edge16ln	%i3,	%g7,	%o0
	movvc	%icc,	%i4,	%i7
	rdhpr	%hpstate,	%i6
	fmovsgu	%xcc,	%f28,	%f3
	wrpr	%o6,	0x0FE7,	%pil
	membar	0x4B
	alignaddrl	%l4,	%g1,	%o3
	tcc	%xcc,	0x6
	movre	%g6,	%o5,	%o4
	ble,a,pt	%icc,	loop_75
	wr	%l2,	%l5,	%softint

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	umulcc	%l3,	0x1FB9,	%g5
loop_75:
	rdpr	%wstate,	%i5
	rd	%ccr,	%l0
	wr 	%g0, 	0x5, 	%fprs
	tpos	%icc,	0x5
	rdhpr	%hsys_tick_cmpr,	%o7
	wr	%o2,	%l1,	%set_softint
	rd	%asi,	%o1
	fornot2	%f16,	%f16,	%f6
	rd	%softint,	%g3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x4C8, 	%hsys_tick_cmpr
	xor	%i3,	%g7,	%o0
	rdpr	%cansave,	%i4
	tvs	%xcc,	0x5
	bpos,pt	%icc,	loop_76
	wrpr	%i7,	0x13C6,	%tick
	rdhpr	%hintp,	%i6
	rdhpr	%htba,	%l6
loop_76:
	rdhpr	%hintp,	%o6
	rd	%ccr,	%g1
	rd	%pc,	%l4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	rdpr	%cleanwin,	%o5
	rd	%y,	%l2
	rd	%tick_cmpr,	%o4
	rdhpr	%hintp,	%l5
	prefetch	[%l7 + 0x78],	 0x2
	mulx	%g4,	0x1DAB,	%l3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x450, 	%hsys_tick_cmpr
	wrpr	%i5,	0x18CB,	%pil
	wrpr	%i0,	%i1,	%pil
	movvc	%icc,	%o2,	%o7
	fmovsgu	%icc,	%f7,	%f3
	xorcc	%o1,	%g3,	%g2
	wr	%i3,	0x0A70,	%softint
	rdpr	%cwp,	%g7
	wrpr	%l1,	0x1C5D,	%tick
	wrpr	%i4,	0x16BD,	%tick
	wrpr	%o0,	0x16A8,	%cwp
	sethi	0x1A13,	%i6
	wrpr	%l6,	0x12A6,	%pil
	rdpr	%tl,	%i7
	edge32ln	%g1,	%o6,	%o3
	wrpr	%l4,	0x17C7,	%pil
	brlz,a	%o5,	loop_77
	wrpr	%l2,	%g6,	%pil
	fexpand	%f5,	%f30
	rdhpr	%htba,	%l5
loop_77:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	wrpr	%l3,	0x04C1,	%cwp
	movgu	%xcc,	%g4,	%g5
	fmovse	%icc,	%f24,	%f11

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	edge32	%i1,	%o2,	%o7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%hintp,	%g3
	rdpr	%tba,	%o1
	rd	%sys_tick_cmpr,	%g2
	wrpr	%g7,	0x11A0,	%cwp
	rd	%fprs,	%i3
	fmovdn	%icc,	%f31,	%f27
	rdhpr	%htba,	%i4
	rd	%y,	%o0
	wrpr	%l1,	%i6,	%pil
	rdhpr	%hpstate,	%l6
	wr	%i7,	%o6,	%sys_tick
	wr 	%g0, 	0x7, 	%fprs
	edge8n	%o3,	%l4,	%l2
	subcc	%g6,	0x19BD,	%o5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fmovdvs	%xcc,	%f16,	%f15
	wr	%g4,	%g5,	%y
	wrpr	%i2,	%i5,	%cwp
	rdpr	%cwp,	%i0
	wrpr	%i1,	0x11F5,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x8FA, 	%hsys_tick_cmpr
	popc	0x137A,	%l3
	sdivx	%o7,	0x13C7,	%l0
	tneg	%icc,	0x1
	wr	%g3,	%g2,	%set_softint
	wr	%g7,	0x10A4,	%clear_softint
	wr	%i3,	0x03FB,	%y
	wr	%g0,	0x81,	%asi
	ldsba	[%l7 + 0x64] %asi,	%o1
	movgu	%xcc,	%i4,	%l1
	bleu	loop_78
	bvc,a	%icc,	loop_79
	alignaddr	%i6,	%o0,	%i7
	sll	%o6,	%l6,	%o3
loop_78:
	tsubcc	%l4,	0x0694,	%g1
loop_79:
	fmovdcs	%icc,	%f4,	%f11
	rdhpr	%htba,	%l2
	tpos	%xcc,	0x7
	fmovdcc	%xcc,	%f7,	%f2
	edge16ln	%g6,	%o4,	%l5
	rdpr	%cleanwin,	%o5
	rdhpr	%hsys_tick_cmpr,	%g5
	wrpr	%g4,	%i5,	%pil
	wrpr	%i0,	0x1A4B,	%pil
	add	%l7,	0x54,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] %asi,	%i2,	%o2
	tsubcc	%i1,	%o7,	%l3
	rdpr	%gl,	%g3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x9E8, 	%sys_tick_cmpr
	fpsub32	%f22,	%f22,	%f16
	wrpr	%i3,	0x0823,	%pil
	fmovrslez	%l0,	%f14,	%f10
	alignaddr	%i4,	%o1,	%i6
	wrpr	%l1,	0x04AC,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xC1E, 	%hsys_tick_cmpr
	rd	%asi,	%i7
	bvs,a,pt	%icc,	loop_80
	smulcc	%o6,	%o3,	%l4
	rdpr	%canrestore,	%l6
	bvs,pt	%xcc,	loop_81
loop_80:
	wr	%g1,	0x06A7,	%clear_softint

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x265, 	%hsys_tick_cmpr
	movrgez	%o4,	%l2,	%l5
loop_81:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
        wr    %g0,    0xe,    %pcr    ! changed.
	rdpr	%cwp,	%i5
	wr	%i0,	0x1A5F,	%clear_softint
	rd	%softint,	%i2
	fbl	%fcc0,	loop_82
	rdpr	%cleanwin,	%o2
	rdhpr	%hintp,	%g4
	array8	%i1,	%o7,	%g3
loop_82:
	rdhpr	%hsys_tick_cmpr,	%g2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	subcc	%l0,	0x1ADA,	%l3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	edge32	%o1,	%i6,	%o0
	fornot2	%f24,	%f26,	%f10

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x948, 	%hsys_tick_cmpr
	rdpr	%tba,	%l1
	wr	%o6,	%l4,	%set_softint

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x77B, 	%hsys_tick_cmpr
	rdpr	%canrestore,	%g1
	wr	%o3,	0x0B84,	%softint
	wrpr	%g6,	0x196A,	%cwp
	wrpr	%o4,	0x084B,	%cwp
	stbar

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x01E, 	%sys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%g5,	%o5,	%tick
	for	%f10,	%f6,	%f22
	edge16l	%i5,	%i0,	%i2
	rd	%softint,	%o2
	tpos	%icc,	0x6
	fnot1	%f24,	%f24
	tn	%icc,	0x0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x9BA, 	%hsys_tick_cmpr
	tvs	%xcc,	0x0
	rdpr	%gl,	%i1
	rdpr	%pil,	%g2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xF4D, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x6A1, 	%hsys_tick_cmpr
	nop
	set	0x54, %l3
	prefetch	[%l7 + %l3],	 0x0
	sll	%l0,	%l3,	%o1
	movge	%icc,	%i4,	%o0
	wrpr	%i7,	0x1575,	%cwp
	movcc	%icc,	%i6,	%l1
	wr	%l4,	0x0C52,	%softint

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x230, 	%tick_cmpr
	rdpr	%cwp,	%o6
	tvs	%icc,	0x3
	fmul8x16	%f2,	%f2,	%f0
	movne	%icc,	%o3,	%g1
	rdhpr	%htba,	%g6
	wrpr	%l2,	%l5,	%cwp
	edge32	%g5,	%o4,	%i5
	addccc	%o5,	%i0,	%i2
	rd	%softint,	%g4
	edge16l	%o2,	%o7,	%g2
	wr	%i1,	%g7,	%pic
	rdhpr	%htba,	%g3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fnor	%f16,	%f26,	%f22
	wr	%o1,	0x1165,	%pic
	flush	%l7 + 0x6C
	rdhpr	%hsys_tick_cmpr,	%l3
	edge16l	%i4,	%o0,	%i6
	tcs	%icc,	0x6
	wrpr	%l1,	%l4,	%pil
	movvs	%icc,	%l6,	%i7
	fnegs	%f19,	%f21
	rdpr	%cansave,	%o6
	fbule	%fcc1,	loop_83
	edge8n	%g1,	%o3,	%l2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xAF2, 	%hsys_tick_cmpr
	fmovdleu	%xcc,	%f24,	%f8
loop_83:
	wrpr	%g5,	0x1253,	%tick
	subccc	%o4,	0x00B1,	%o5
	andncc	%i0,	%i2,	%g4
	fmul8x16	%f29,	%f20,	%f8
	rd	%ccr,	%o2
	wrpr	%i5,	0x1FC6,	%cwp
	wr	%g2,	0x122C,	%clear_softint

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x163, 	%hsys_tick_cmpr
	movvs	%xcc,	%g3,	%l0
	fba,a	%fcc2,	loop_84
	brlz,a	%g7,	loop_85
	rdhpr	%hintp,	%i3
	rd	%softint,	%l3
loop_84:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x56B, 	%hsys_tick_cmpr
loop_85:
	wrpr	%o1,	%i6,	%cwp
	movrlz	%l1,	%o0,	%l4
	rdhpr	%htba,	%l6
	rd	%tick_cmpr,	%o6
	rdpr	%cwp,	%g1
	wrpr	%i7,	0x11C2,	%cwp
	fbg,a	%fcc1,	loop_86
	rdpr	%gl,	%o3
	lduh	[%l7 + 0x2C],	%l2
	fabss	%f19,	%f27
loop_86:
	movleu	%xcc,	%g6,	%g5
	tneg	%xcc,	0x2
	wrpr	%o4,	0x01BF,	%pil
	edge32n	%o5,	%i0,	%i2
	mulscc	%g4,	%l5,	%o2
	movne	%xcc,	%i5,	%i1
	fmovdge	%icc,	%f9,	%f31
	rd	%tick_cmpr,	%o7

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
	wrpr	%g3,	0x055F,	%tick
	wrpr	%l0,	%i3,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x97E, 	%hsys_tick_cmpr
	wr	%g0,	0x04,	%asi
	prefetcha	[%l7 + 0x20] %asi,	 0x1
	fnegd	%f24,	%f10
	rd	%y,	%i6
	sub	%l3,	%l1,	%o0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x638, 	%hsys_tick_cmpr
	rd	%asi,	%o6
	addccc	%g1,	%l4,	%i7
	or	%l2,	0x1928,	%o3
	sir	0x14F8
	wrpr	%g5,	%g6,	%tick
	wrpr	%o5,	%i0,	%tick
	wr	%o4,	%g4,	%softint
	wrpr	%l5,	%i2,	%tick
	wr 	%g0, 	0x6, 	%fprs

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x658, 	%hsys_tick_cmpr
	ldub	[%l7 + 0x1F],	%i1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x03F, 	%hsys_tick_cmpr
	fmovsge	%icc,	%f8,	%f30
	movleu	%xcc,	%g3,	%i3
	wr	%l0,	%i4,	%sys_tick
	rd	%y,	%g7
	tl	%icc,	0x5
	sra	%o1,	%l3,	%i6
	wr	%o0,	%l1,	%softint
	brgez	%l6,	loop_87
	alignaddrl	%g1,	%o6,	%l4
	tpos	%xcc,	0x0
	wr	%l2,	0x12D3,	%pic
loop_87:
	fmovdg	%icc,	%f2,	%f25

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	wrpr	%g5,	%g6,	%tick
	fsrc1s	%f29,	%f4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x9D7, 	%sys_tick_cmpr
	andn	%i0,	%o4,	%g4
	rdhpr	%hsys_tick_cmpr,	%l5
	wr	%g0,	0x89,	%asi
	stba	%i5,	[%l7 + 0x3F] %asi
	wrpr	%o2,	0x0706,	%pil
	wr	%i1,	%i2,	%sys_tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fmovsneg	%icc,	%f8,	%f20
	rdhpr	%htba,	%g3
	wr	%i3,	0x191E,	%pic

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x55B, 	%hsys_tick_cmpr
	rdhpr	%htba,	%g7
	array8	%l0,	%l3,	%i6
	fnegs	%f2,	%f30

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	wr	%l1,	0x19BA,	%sys_tick
	fmovrdgz	%o1,	%f20,	%f16
	rd	%ccr,	%g1
	fmovsl	%icc,	%f28,	%f19
	wr	%o6,	%l4,	%sys_tick
	rdhpr	%htba,	%l2
	edge32n	%l6,	%o3,	%g6
	stb	%g5,	[%l7 + 0x71]

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	rd	%sys_tick_cmpr,	%o5
	fmovdcs	%xcc,	%f26,	%f20
	fones	%f19
	udiv	%g4,	0x0093,	%l5
	orn	%o4,	%o2,	%i5
	rdhpr	%hintp,	%i2
	fbne	%fcc3,	loop_88
	wrpr	%g2,	%g3,	%cwp
	umul	%i1,	%o7,	%i3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_88:
        wr    %g0,    0xe,    %pcr    ! changed.
	fmuld8ulx16	%f6,	%f25,	%f2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x2C5, 	%hsys_tick_cmpr
	sub	%i6,	0x12A0,	%o0
	rd	%y,	%l1
	wrpr	%g1,	0x0A7A,	%tick
	rdpr	%pil,	%o6
	rdhpr	%hsys_tick_cmpr,	%o1
	rd	%fprs,	%l4
	fmovsgu	%xcc,	%f16,	%f15

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fbu	%fcc1,	loop_89
	addccc	%g6,	%l2,	%i7
	wr	%g5,	0x04F0,	%set_softint
	bvc,a,pn	%xcc,	loop_90
loop_89:
	ta	%xcc,	0x1
	edge16l	%o5,	%g4,	%l5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x4B8, 	%hsys_tick_cmpr
loop_90:
	addccc	%i0,	%o2,	%i5
	fcmpne16	%f16,	%f28,	%g2
	tgu	%icc,	0x1
	wrpr	%g3,	0x0F32,	%cwp
	rdpr	%cleanwin,	%i2
	rdhpr	%hintp,	%i1
	wr	%o7,	0x188D,	%ccr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	srax	%i3,	0x09,	%l3
	rdpr	%gl,	%i6
	rd	%y,	%o0
	rd	%sys_tick_cmpr,	%l0
	wrpr	%g1,	0x0459,	%pil
	sdivx	%l1,	0x02CE,	%o1
	tge	%xcc,	0x1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x8DB, 	%hsys_tick_cmpr
	fble	%fcc0,	loop_91
	rdhpr	%hintp,	%o3
	ldstub	[%l7 + 0x10],	%l6
	edge8	%g6,	%i7,	%l2
loop_91:
	rdhpr	%hsys_tick_cmpr,	%g5
	movl	%icc,	%o5,	%g4
	udiv	%o4,	0x1E91,	%l5
	umulcc	%o2,	0x1429,	%i5
	movre	%g2,	0x042,	%i0
	fnot1s	%f1,	%f0
	wrpr	%i2,	%g3,	%tick
	fmovdpos	%xcc,	%f26,	%f25
	rdhpr	%hpstate,	%o7
	rdpr	%canrestore,	%i4
	rdhpr	%hpstate,	%i1
	fors	%f7,	%f9,	%f21
	rdpr	%cleanwin,	%i3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x348, 	%hsys_tick_cmpr
	tleu	%icc,	0x5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	or	%i6,	%o0,	%g1
	wrpr	%l1,	%o1,	%cwp
	fmovdcc	%xcc,	%f16,	%f28
	movrlz	%l4,	%o6,	%o3
	wr	%l6,	%g6,	%y
	xnor	%l0,	%i7,	%g5
	bge,a,pt	%xcc,	loop_92
	wrpr	%o5,	0x0B8D,	%cwp
	rdpr	%tl,	%g4
	tleu	%icc,	0x3
loop_92:
	sra	%o4,	0x16,	%l2
	fandnot2	%f8,	%f4,	%f20
	rdpr	%wstate,	%o2
	fmul8x16au	%f13,	%f31,	%f20
	rd	%y,	%l5
	movrgez	%g2,	%i5,	%i0
	wr	%i2,	0x024D,	%y
	tne	%icc,	0x6
	wr	%g3,	0x03C3,	%set_softint
	rdpr	%tl,	%i4
	movneg	%xcc,	%o7,	%i1
	taddcctv	%i3,	%g7,	%l3
	rdhpr	%hintp,	%i6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%l1,	%l4,	%cwp
	udivcc	%o6,	0x0F1A,	%o3
	rdhpr	%hintp,	%l6
	fbo,a	%fcc0,	loop_93
	rdpr	%canrestore,	%o1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xCAC, 	%hsys_tick_cmpr
	wrpr	%g5,	0x089E,	%cwp
loop_93:
	smulcc	%i7,	0x09A4,	%o5
	fmovsl	%icc,	%f30,	%f27
	wr	%g0,	0x81,	%asi
	lduha	[%l7 + 0x36] %asi,	%o4
	wrpr	%g4,	0x0F80,	%pil
	tvc	%xcc,	0x0
	add	%l7,	0x3C,	%l6
	wr	%g0,	0x19,	%asi
	lda	[%l6] %asi,	%l2
	casa	[%l6] 0x19,	%l2,	%l5
	mulscc	%g2,	%o2,	%i0
	rdpr	%otherwin,	%i5
	edge8ln	%g3,	%i2,	%o7
	ldd	[%l7 + 0x40],	%i4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	edge16l	%g7,	%i1,	%i6
	tgu	%xcc,	0x1
	wrpr	%l3,	%o0,	%pil
	rdpr	%wstate,	%l1
	fmovsa	%icc,	%f3,	%f11
	rdpr	%pil,	%g1
	rdpr	%tba,	%o6
	rd	%y,	%l4
	rd	%sys_tick_cmpr,	%l6
	rd	%asi,	%o3
	wrpr	%o1,	0x17DB,	%tick
	fpadd32	%f0,	%f18,	%f2
	srax	%g6,	%l0,	%i7
	wrpr	%g5,	0x1CEF,	%cwp
	rdhpr	%hpstate,	%o5
	wrpr	%o4,	%g4,	%pil
	tg	%xcc,	0x4
	wr	%l2,	0x18E3,	%clear_softint

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xF06, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x623, 	%hsys_tick_cmpr
	rdhpr	%htba,	%g3
	wr	%i2,	%o7,	%clear_softint

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	array16	%g2,	%i1,	%g7
	te	%xcc,	0x1
	rdpr	%gl,	%i6
	rd	%softint,	%o0
	rd	%pc,	%l1
	movrne	%l3,	0x231,	%g1
	wrpr	%o6,	0x0B16,	%pil
	movvc	%xcc,	%l4,	%o3
	wr	%g0,	0x19,	%asi
	stba	%l6,	[%l7 + 0x2D] %asi

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%g6,	0x142F,	%cwp
	add	%l7,	0x38,	%l6
	wr	%g0,	0x0c,	%asi
	casxa	[%l6] 0x0c,	%i7,	%l0
	bg,a	loop_94
	tneg	%xcc,	0x3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x18B, 	%hsys_tick_cmpr
	mulscc	%g4,	%g5,	%l5
loop_94:
	nop
	add	%l7,	0x50,	%l6
	wr	%g0,	0x04,	%asi
	casxa	[%l6] %asi,	%o2,	%i0
	rdhpr	%hintp,	%l2
	array16	%g3,	%i5,	%i2
	fmovdge	%xcc,	%f6,	%f17
	movpos	%xcc,	%o7,	%i4
	edge8n	%g2,	%i3,	%g7
	wrpr	%i1,	%i6,	%cwp
	addccc	%l1,	%o0,	%g1
	ble,a	%icc,	loop_95
	rd	%fprs,	%o6
	lduh	[%l7 + 0x6C],	%l4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x39C, 	%hsys_tick_cmpr
loop_95:
	nop
	set	0x70, %o1
	stxa	%l6,	[%l7 + %o1] 0x19
	edge32ln	%g6,	%o1,	%i7
	edge16l	%o5,	%l0,	%g4
	edge32ln	%g5,	%o4,	%o2
	rdpr	%cwp,	%i0
	rdpr	%tl,	%l2
	rdpr	%wstate,	%g3
	rdhpr	%hintp,	%l5
	sdivx	%i5,	0x11A8,	%o7
	tne	%xcc,	0x0
	rd	%fprs,	%i2
	wr	%i4,	0x166E,	%ccr
	brlz,a	%g2,	loop_96
	sethi	0x03DB,	%i3
	rdpr	%tba,	%i1
	fmovsle	%xcc,	%f31,	%f9
loop_96:
	fmovdcc	%icc,	%f22,	%f10
	rdhpr	%hsys_tick_cmpr,	%g7
	movvc	%xcc,	%i6,	%o0
	rd	%y,	%g1
	wr 	%g0, 	0x7, 	%fprs

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	sethi	0x0EE3,	%l4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x45C, 	%hsys_tick_cmpr
	wrpr	%l3,	0x0F4C,	%pil
	rd	%pc,	%g6
	rdhpr	%htba,	%i7
	rdhpr	%htba,	%o1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fmovrdlez	%l0,	%f12,	%f8

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xD90, 	%hsys_tick_cmpr
	rdhpr	%hpstate,	%g4
	ldsh	[%l7 + 0x32],	%i0
	rdpr	%tl,	%l2
	rd	%fprs,	%g3
	fmovdg	%xcc,	%f5,	%f28
        wr    %g0,    0xe,    %pcr    ! changed.
	nop
	setx loop_97, %l0, %l1
	jmpl %l1, %o2
	rdhpr	%htba,	%o7
	movrgez	%i5,	0x021,	%i2
	wr	%g0,	0x89,	%asi
	lduba	[%l7 + 0x1B] %asi,	%i4
loop_97:
	rdpr	%gl,	%g2
	rdhpr	%hsys_tick_cmpr,	%i3
	wr	%g0,	0x80,	%asi
	ldsba	[%l7 + 0x1B] %asi,	%i1
	wr	%g7,	0x03AD,	%clear_softint
	wrpr	%o0,	%i6,	%cwp
	rdhpr	%hsys_tick_cmpr,	%g1
	wrpr	%l1,	0x0EBF,	%tick
	rdpr	%cansave,	%o3
	movrgz	%l4,	0x04E,	%o6
	rdhpr	%htba,	%l6
	rdpr	%canrestore,	%l3
	fcmped	%fcc1,	%f0,	%f4
	wrpr	%g6,	0x0F1F,	%tick
	nop
	setx	loop_98,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	wrpr	%o1,	%i7,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%hsys_tick_cmpr,	%o4
loop_98:
	rdpr	%cleanwin,	%g4
	xorcc	%i0,	%l2,	%g3
	and	%l5,	%o2,	%o7
	rdhpr	%htba,	%i5
	or	%i2,	0x1221,	%i4
	umul	%g5,	%i3,	%g2
	fnor	%f2,	%f22,	%f30
	ld	[%l7 + 0x0C],	%f27
	wrpr	%i1,	%o0,	%pil
	wrpr	%g7,	0x1B90,	%cwp
	set	0x70, %i3
	stxa	%i6,	[%l7 + %i3] 0x27
	membar	#Sync
	brlz,a	%g1,	loop_99
	rdpr	%tl,	%l1
	add	%l4,	0x05BF,	%o3
	movgu	%xcc,	%o6,	%l6
loop_99:
	edge8n	%l3,	%o1,	%i7
	wrpr	%o5,	0x16FE,	%cwp
	fpmerge	%f1,	%f15,	%f20

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xF6A, 	%hsys_tick_cmpr
	rdpr	%cwp,	%o4
	wr	%g4,	%l0,	%ccr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	membar	#Sync
	wr	%g0,	0x16,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	ta	%icc,	0x1
	rdpr	%canrestore,	%l2
	rd	%y,	%g3
	fbug	%fcc2,	loop_100
	wr	%o2,	0x13F5,	%softint
	rdhpr	%htba,	%l5
	fcmpeq32	%f2,	%f12,	%o7
loop_100:
	rdhpr	%hsys_tick_cmpr,	%i5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x3F7, 	%hsys_tick_cmpr
	xnorcc	%g5,	0x02D8,	%i2
	wrpr	%i3,	0x00ED,	%pil
	edge32n	%g2,	%o0,	%g7
	tvc	%icc,	0x4
	sdivcc	%i6,	0x02E0,	%i1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	bn,pn	%icc,	loop_101
	tleu	%xcc,	0x7
	rd	%sys_tick_cmpr,	%l4
	fbl	%fcc1,	loop_102
loop_101:
	rdhpr	%htba,	%l1
	wr	%o3,	0x155B,	%softint
	wrpr	%o6,	0x0EE1,	%pil
loop_102:
	rdhpr	%hintp,	%l6
	wrpr	%o1,	0x0402,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xB1C, 	%hsys_tick_cmpr
	wr 	%g0, 	0x7, 	%fprs
	sll	%o4,	%g4,	%l0
	fbule	%fcc3,	loop_103
	rd	%y,	%i0
	wr	%l2,	0x1A79,	%sys_tick
	sir	0x1690
loop_103:
	rdhpr	%htba,	%g3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xCCD, 	%hsys_tick_cmpr
	brz,a	%o2,	loop_104
	rd	%ccr,	%l5
	rdpr	%wstate,	%i5
	rdhpr	%htba,	%i4
loop_104:
	stw	%o7,	[%l7 + 0x64]
	rdpr	%wstate,	%i2
	nop
	setx	loop_105,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fmovsa	%icc,	%f4,	%f22
	edge16l	%g5,	%i3,	%o0
	rd	%fprs,	%g2
loop_105:
	mulx	%g7,	%i1,	%g1
	rdhpr	%htba,	%i6
	subcc	%l4,	%l1,	%o3
	wrpr	%l6,	0x1A36,	%tick
	fnand	%f6,	%f16,	%f4
	rdpr	%tba,	%o1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	rd	%ccr,	%o6
	wrpr	%l3,	0x0F59,	%cwp
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
	andcc	%o4,	0x067E,	%g6
	rdpr	%otherwin,	%g4
	mulx	%l0,	%i0,	%l2
	rdpr	%tba,	%o5
	rd	%sys_tick_cmpr,	%g3
	movg	%icc,	%o2,	%l5
	udivcc	%i5,	0x03E9,	%i4
	rdhpr	%htba,	%i2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	andcc	%i3,	%o0,	%g2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x940, 	%hsys_tick_cmpr
	andcc	%i1,	%g1,	%l4
	fxnors	%f21,	%f17,	%f27
	wrpr	%l1,	%o3,	%pil
	rdpr	%cleanwin,	%i6
	rdpr	%pil,	%l6
	wrpr	%o6,	%l3,	%pil
	wr	%o1,	%i7,	%set_softint
	rd	%y,	%o4
	wr	%g4,	%g6,	%sys_tick
	rdhpr	%hintp,	%i0
	movn	%xcc,	%l0,	%o5
	rdhpr	%htba,	%l2
	fbl,a	%fcc0,	loop_106
	movn	%xcc,	%o2,	%l5
	rdhpr	%htba,	%i5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x7F8, 	%hsys_tick_cmpr
loop_106:
	fandnot1s	%f4,	%f28,	%f30
	bneg,pt	%icc,	loop_107
	rd	%asi,	%i2
	movrgez	%o7,	%g5,	%i3
	rdhpr	%hpstate,	%o0
loop_107:
	movneg	%icc,	%i4,	%g2
	rdpr	%canrestore,	%g7
	rdhpr	%hpstate,	%g1
	movge	%xcc,	%l4,	%l1
	rd	%softint,	%i1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xA39, 	%hsys_tick_cmpr
	wrpr	%o6,	0x0B01,	%cwp
	udiv	%l3,	0x0C76,	%l6
	rdhpr	%hsys_tick_cmpr,	%o1
	wrpr	%i7,	%g4,	%tick
	ldx	[%l7 + 0x40],	%o4
	edge8	%g6,	%l0,	%o5
	tvc	%xcc,	0x1
	fmuld8ulx16	%f29,	%f7,	%f28

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x8C7, 	%sys_tick_cmpr
	wr 	%g0, 	0x4, 	%fprs
	rdpr	%gl,	%l5
	sdiv	%l2,	0x1558,	%g3
	wrpr	%i5,	0x12CC,	%cwp
	rd	%softint,	%i2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xFAC, 	%hsys_tick_cmpr
	movneg	%icc,	%o0,	%i3
	bleu,a	loop_108
	tge	%icc,	0x2
	movg	%xcc,	%g2,	%g7
	addccc	%i4,	%l4,	%g1
loop_108:
	edge8l	%i1,	%l1,	%o3
	wrpr	%i6,	0x1D57,	%tick
	movgu	%xcc,	%o6,	%l6
	sdivx	%o1,	0x0458,	%i7
	array32	%g4,	%o4,	%l3
	rdhpr	%hpstate,	%g6
	wrpr	%l0,	%o5,	%pil
	rdhpr	%htba,	%i0
	fmuld8sux16	%f19,	%f16,	%f20
	rdhpr	%hpstate,	%l5
	ble,pn	%icc,	loop_109
	mulx	%l2,	%o2,	%i5
	tsubcc	%i2,	0x091C,	%g3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_109:
	sub	%g5,	%g2,	%i3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xD76, 	%hsys_tick_cmpr
	wrpr	%g7,	0x0031,	%tick
	edge16ln	%g1,	%l4,	%l1
	wrpr	%i1,	%i6,	%pil
	bcs,pt	%icc,	loop_110
	rd	%softint,	%o6
	rdpr	%pil,	%o3
	wr	%l6,	%i7,	%sys_tick
loop_110:
	rd	%tick_cmpr,	%g4
	movg	%icc,	%o4,	%l3
	rdhpr	%hpstate,	%o1
	ldsb	[%l7 + 0x31],	%l0
	xnorcc	%g6,	%o5,	%l5
	rd	%sys_tick_cmpr,	%i0
	wr	%g0,	0xe2,	%asi
	stda	%o2,	[%l7 + 0x08] %asi
	membar	#Sync
	fornot1	%f24,	%f20,	%f18

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x980, 	%hsys_tick_cmpr
	wrpr	%i5,	0x0E32,	%cwp
	bn	%xcc,	loop_111
	rd	%sys_tick_cmpr,	%o7
	wr	%g0,	0x89,	%asi
	prefetcha	[%l7 + 0x48] %asi,	 0x3
loop_111:
	edge16l	%g3,	%g5,	%g2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%ccr,	%g7
	rdpr	%canrestore,	%g1
	rd	%sys_tick_cmpr,	%l4
	rdpr	%pil,	%i3
	rdpr	%cwp,	%i1
	wr	%l1,	%i6,	%y
	wr	%o3,	0x1DB5,	%ccr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fble	%fcc1,	loop_112
	wrpr	%l6,	%g4,	%tick
	srl	%o4,	0x10,	%l3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_112:
	sdivx	%l0,	0x1926,	%i7
	wr	%o5,	0x0C18,	%set_softint
	rd	%ccr,	%g6
	wrpr	%l5,	0x02EC,	%pil
	addcc	%i0,	%o2,	%i2
	wr	%l2,	0x04EE,	%ccr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xC01, 	%tick_cmpr
	rd	%fprs,	%g3
	udivx	%o7,	0x0027,	%g5
	rdhpr	%hsys_tick_cmpr,	%i4
        wr    %g0,    0xe,    %pcr    ! changed.
	sir	0x19AD
	wr	%g7,	%l4,	%sys_tick
	rd	%softint,	%i3
	fsrc2s	%f21,	%f22
	edge32	%g1,	%l1,	%i1
	wrpr	%o3,	%i6,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x7E7, 	%hsys_tick_cmpr
	wrpr	%o4,	%l6,	%tick
	subc	%l3,	0x1F62,	%l0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	std	%o4,	[%l7 + 0x68]
	tcc	%xcc,	0x0
	rdhpr	%htba,	%g6
	rdhpr	%hpstate,	%l5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	bshuffle	%f12,	%f10,	%f18

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%g0,	0x2b,	%asi
	stba	%o0,	[%l7 + 0x2C] %asi
	membar	#Sync
	fmovrdlz	%i5,	%f18,	%f16
	brlez	%g3,	loop_113
	rd	%softint,	%o7
	wrpr	%g5,	%g2,	%pil
	rdhpr	%hintp,	%i4
loop_113:
	tvc	%icc,	0x2
	wr 	%g0, 	0x5, 	%fprs
	fzero	%f30

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x5C5, 	%tick_cmpr
	rdhpr	%hsys_tick_cmpr,	%i1
	rdhpr	%hpstate,	%o3
	rdhpr	%hsys_tick_cmpr,	%i6
!Yo - got one - imm_asi 0x52 
!And yo - immediate is 0x110
	wr	%g0,	0x52,	%asi
	stxa	%i3,	[%g0 + 0x110] %asi

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	taddcctv	%o6,	0x1455,	%l6
	tsubcc	%l3,	%o4,	%i7
	wr	%o1,	0x04DB,	%sys_tick
	fmul8sux16	%f24,	%f20,	%f18
	stx	%o5,	[%l7 + 0x10]
	rdpr	%pil,	%g6
	rdpr	%pil,	%l5
	edge8ln	%l0,	%i0,	%o2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fblg,a	%fcc1,	loop_114
	rd	%softint,	%l2
	rdpr	%cwp,	%o0
	wr	%g3,	0x0A2E,	%y
loop_114:
	rdhpr	%htba,	%i5
	te	%xcc,	0x4
	wr	%g5,	0x0696,	%sys_tick
        wr    %g0,    0xe,    %pcr    ! changed.

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x8FC, 	%hsys_tick_cmpr
	set	0x08, %l6
	ldxa	[%l7 + %l6] 0x89,	%i4
	mova	%xcc,	%g1,	%i1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xC31, 	%hsys_tick_cmpr
	rdhpr	%hpstate,	%l1
	wr	%i3,	0x00E1,	%set_softint
	movpos	%xcc,	%o6,	%g4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%tl,	%o4
	wrpr	%l6,	%i7,	%tick
	rd	%asi,	%o5
	edge32ln	%o1,	%l5,	%l0
	subccc	%g6,	0x0C8B,	%i0
	udiv	%o2,	0x049C,	%i2
	wr	%o0,	0x1AFC,	%ccr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	sdivcc	%g5,	0x0965,	%o7
	edge16	%g2,	%g7,	%l4
	rdpr	%pil,	%i4
	rdhpr	%hsys_tick_cmpr,	%g1
	wr	%g0,	0x10,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	fornot2s	%f29,	%f17,	%f11
	rdhpr	%hintp,	%l2
	rdhpr	%hsys_tick_cmpr,	%i1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x130, 	%hsys_tick_cmpr
	rd	%asi,	%l1
	edge32ln	%i3,	%i6,	%g4
	nop
	setx	loop_115,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	sdiv	%l3,	0x1EE0,	%o6
	fmovdge	%icc,	%f0,	%f27
	fnot1s	%f15,	%f30
loop_115:
	wr	%l6,	%i7,	%set_softint
	edge32l	%o5,	%o1,	%l5
	rdhpr	%hsys_tick_cmpr,	%o4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x04E, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x746, 	%hsys_tick_cmpr
	xnorcc	%o2,	%o0,	%g3
	fbn	%fcc1,	loop_116
	popc	0x023D,	%i5
	st	%f20,	[%l7 + 0x70]
	bpos,pt	%xcc,	loop_117
loop_116:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	rd	%sys_tick_cmpr,	%i2
	movre	%o7,	0x2A5,	%g5
loop_117:
	rd	%pc,	%g2
	fba	%fcc3,	loop_118
	rdpr	%gl,	%l4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xA43, 	%hsys_tick_cmpr
	fmovdg	%icc,	%f17,	%f15
loop_118:
	bn,pn	%xcc,	loop_119
	rdpr	%canrestore,	%g7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x4E2, 	%hsys_tick_cmpr
	wrpr	%l2,	0x0AA2,	%cwp
loop_119:
	srlx	%i1,	%l1,	%i3
	wr 	%g0, 	0x7, 	%fprs
	edge32	%g4,	%l3,	%l6
	rd	%asi,	%i7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x2ED, 	%tick_cmpr
	rdpr	%tl,	%l5
	wrpr	%o4,	0x0D36,	%pil
	rdhpr	%htba,	%g6
	tpos	%xcc,	0x2
	addc	%i0,	0x0ECA,	%l0
	wr	%o6,	%o0,	%sys_tick
	rdhpr	%hintp,	%g3
	rd	%softint,	%i5
	rdpr	%cwp,	%o2
	tge	%icc,	0x5
	sra	%i2,	%g5,	%o7
	rdhpr	%hpstate,	%g2
	alignaddr	%i4,	%l4,	%g1
	movrgz	%g7,	%i1,	%l1
	wr	%g0,	0x80,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x30C, 	%hsys_tick_cmpr
	umulcc	%i6,	0x0401,	%g4
	edge32	%l3,	%l2,	%l6
	ta	%xcc,	0x7
	movl	%xcc,	%i7,	%o5
	wr	%l5,	%o1,	%set_softint
	wr	%g0,	0xe3,	%asi
	stwa	%g6,	[%l7 + 0x48] %asi
	membar	#Sync
	wr	%i0,	%l0,	%set_softint
	taddcctv	%o4,	0x092D,	%o6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	movg	%xcc,	%o0,	%o2
	udiv	%g5,	0x1006,	%i2
	rdhpr	%hpstate,	%o7
	rdhpr	%htba,	%g2
	rdpr	%canrestore,	%l4
	wr 	%g0, 	0x5, 	%fprs
	rdpr	%tl,	%g7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x4D5, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x4C7, 	%hsys_tick_cmpr
	fxnor	%f28,	%f6,	%f6
	fcmpeq16	%f24,	%f16,	%o3
	orncc	%l1,	%g4,	%l3
	rdpr	%cansave,	%l2
	fmuld8ulx16	%f14,	%f8,	%f12

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x461, 	%hsys_tick_cmpr
	wr	%l6,	%o5,	%y
	rdpr	%wstate,	%l5
	edge8n	%i7,	%o1,	%i0
	bneg,a,pt	%icc,	loop_120
	wrpr	%l0,	%g6,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fbe,a	%fcc2,	loop_121
loop_120:
	rd	%asi,	%g3
	rd	%softint,	%o4
	rd	%ccr,	%o0
loop_121:
	nop
	wr	%g0,	0x80,	%asi
	lduwa	[%l7 + 0x2C] %asi,	%o2
	wr	%i5,	%i2,	%y
	wr	%g5,	%g2,	%clear_softint
	wrpr	%l4,	0x1E24,	%cwp
	rdpr	%tba,	%o7
	subccc	%g7,	%i4,	%i1
	rdhpr	%hpstate,	%g1
	rdhpr	%htba,	%o3
	tvc	%icc,	0x5
	edge32	%l1,	%g4,	%i3
	fbuge,a	%fcc3,	loop_122
	smul	%l2,	%i6,	%l6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	array32	%l5,	%i7,	%o1
loop_122:
	fcmpgt32	%f24,	%f22,	%l3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xFAE, 	%tick_cmpr
	rd	%tick_cmpr,	%i0
	fmovdpos	%icc,	%f30,	%f27
	fpmerge	%f1,	%f11,	%f28
	fbg	%fcc1,	loop_123
        wr    %g0,    0xe,    %pcr    ! changed.
	addcc	%g6,	0x0751,	%o4
	wr	%o0,	0x0979,	%pic
loop_123:
	rdhpr	%htba,	%o2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xAD9, 	%hsys_tick_cmpr
	wrpr	%i2,	0x098D,	%tick
	movg	%icc,	%i5,	%g5
	array16	%l4,	%o7,	%g2
	wrpr	%i4,	0x04BF,	%cwp
	add	%i1,	0x1603,	%g7
        wr    %g0,    0xe,    %pcr    ! changed.
	wrpr	%g1,	%l1,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x6BD, 	%hsys_tick_cmpr
	fbuge,a	%fcc1,	loop_124
	rd	%tick_cmpr,	%i6
	sub	%l6,	%o5,	%g4
	ldx	[%l7 + 0x50],	%l5
loop_124:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x397, 	%hsys_tick_cmpr
	array16	%i7,	%l3,	%i0
	fbu,a	%fcc3,	loop_125
	wrpr	%l0,	0x082F,	%pil
	wrpr	%o6,	%g6,	%tick
	fnot2	%f30,	%f18
loop_125:
	movgu	%icc,	%o4,	%o2
	wr	%o0,	0x09D2,	%sys_tick
	fzeros	%f10
	wrpr	%g3,	0x1850,	%cwp
	wr	%i2,	0x0E2E,	%ccr
	tpos	%icc,	0x5
	rd	%pc,	%i5
	wr	%g5,	%l4,	%softint
	xnorcc	%g2,	0x065E,	%o7
	fbl,a	%fcc0,	loop_126
	umulcc	%i4,	0x1F0E,	%g7
	wrpr	%i1,	0x07D7,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_126:
	rd	%tick_cmpr,	%g1
	array16	%i3,	%l1,	%l2
	subcc	%i6,	0x1755,	%o5
	wrpr	%g4,	0x156D,	%cwp
	edge8l	%l5,	%o1,	%l6
	wrpr	%i7,	%l3,	%cwp
	sub	%i0,	%o6,	%g6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x65A, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x190, 	%hsys_tick_cmpr
	fone	%f22
	tvs	%icc,	0x1
	rdhpr	%hpstate,	%o0
	edge16	%g3,	%o2,	%i2
	wrpr	%g5,	%l4,	%tick
	rd	%tick_cmpr,	%g2
	rdhpr	%hintp,	%i5
	brz,a	%o7,	loop_127
	tneg	%xcc,	0x6
	lduh	[%l7 + 0x2A],	%g7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_127:
	wr	%o3,	%g1,	%clear_softint
	rdhpr	%hintp,	%i3
	wr	%i4,	%l2,	%set_softint
	nop
	set	0x70, %o5
	ldd	[%l7 + %o5],	%f22
	wr	%i6,	0x14D0,	%sys_tick
	edge8n	%o5,	%l1,	%l5
	udivx	%o1,	0x1FC6,	%g4
	movpos	%icc,	%i7,	%l3
	set	0x22, %o6
	ldsha	[%l7 + %o6] 0x80,	%i0
	rd	%y,	%o6
	udivcc	%g6,	0x11CC,	%l6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	rdpr	%tba,	%g3
	rdhpr	%hpstate,	%o4
	fmovdgu	%xcc,	%f31,	%f20

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%hsys_tick_cmpr,	%i2
	rd	%softint,	%g2
	wr	%o7,	0x021F,	%sys_tick
	wrpr	%g7,	%i1,	%pil
	addccc	%i5,	%g1,	%o3
	fmuld8sux16	%f12,	%f30,	%f24
	wr	%i3,	%l2,	%sys_tick
	rd	%y,	%i6
	rdhpr	%hintp,	%o5
	wrpr	%i4,	%l5,	%tick
	fpmerge	%f3,	%f13,	%f6
	brlez	%l1,	loop_128
	tl	%xcc,	0x0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xA17, 	%hsys_tick_cmpr
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_128:
	wrpr	%i7,	%l3,	%tick
	rd	%ccr,	%o6
	edge16ln	%g6,	%l6,	%i0
	rdhpr	%hpstate,	%l0
	rd	%pc,	%g3
	fmovscs	%xcc,	%f23,	%f14
	rdpr	%otherwin,	%o0
	rd	%pc,	%o4
	movrgez	%g5,	%o2,	%l4
	udivx	%g2,	0x118E,	%o7
	rd	%y,	%g7
	edge8	%i2,	%i5,	%g1
	ble	%xcc,	loop_129
	wrpr	%i1,	%i3,	%cwp
	wrpr	%l2,	%i6,	%cwp
	movrgz	%o3,	%i4,	%o5
loop_129:
	rd	%pc,	%l1
	mulscc	%l5,	0x1716,	%g4
	rd	%softint,	%o1
	rdhpr	%hsys_tick_cmpr,	%i7
	stw	%o6,	[%l7 + 0x14]

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%g6,	0x1F5D,	%pil
	set	0x40, %l0
	ldswa	[%l7 + %l0] 0x11,	%g3
	edge16l	%l0,	%o0,	%o4
	rdhpr	%htba,	%o2
	wr 	%g0, 	0x4, 	%fprs
	subc	%g2,	0x1034,	%g7
	edge8n	%o7,	%i5,	%i2
	wr	%g1,	0x0F53,	%ccr
	edge32l	%i1,	%l2,	%i3
	set	0x3C, %i5
	lduwa	[%l7 + %i5] 0x10,	%i6
	rd	%softint,	%o3
	rdpr	%pil,	%o5
	fmuld8sux16	%f20,	%f12,	%f20
	rdhpr	%hsys_tick_cmpr,	%i4
	wrpr	%l1,	%g4,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	movrgez	%o6,	%l3,	%l6
	rd	%y,	%i0
	wrpr	%i7,	%g6,	%pil
	rd	%pc,	%l0
	rd	%y,	%o0
	nop
	setx loop_130, %l0, %l1
	jmpl %l1, %g3
	fbge,a	%fcc1,	loop_131
	rdhpr	%hsys_tick_cmpr,	%o4
	srl	%l4,	%o2,	%g2
loop_130:
	rdhpr	%hintp,	%g7
loop_131:
	wrpr	%g5,	0x105C,	%pil
	movn	%icc,	%o7,	%i5
	wr	%i2,	%i1,	%softint
	fbu,a	%fcc2,	loop_132
	wrpr	%l2,	%i3,	%pil
	move	%icc,	%g1,	%o3
	rd	%sys_tick_cmpr,	%i6
loop_132:
	wrpr	%o5,	%i4,	%cwp
	rd	%asi,	%l1
	rdhpr	%hintp,	%o1
	wrpr	%g4,	%o6,	%pil
	wrpr	%l3,	0x0EAC,	%cwp
	rdpr	%tba,	%l5
	wr	%i0,	0x063F,	%ccr
	set	0x10, %g4
	ldda	[%l7 + %g4] 0x80,	%i6
	wr	%g0,	0x88,	%asi
	lda	[%l7 + 0x70] %asi,	%f22

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x6B8, 	%hsys_tick_cmpr
	movrne	%i7,	0x28B,	%o0
	array8	%g3,	%o4,	%l4
	wr	%g0,	0x18,	%asi
	swapa	[%l7 + 0x7C] %asi,	%o2
	nop
	set	0x22, %g2
	stb	%g7,	[%l7 + %g2]
	movrlez	%g5,	%o7,	%g2
	sub	%i5,	%i1,	%l2
	rdhpr	%hpstate,	%i2
	rdpr	%cwp,	%i3
	set	0x78, %i0
	lduwa	[%l7 + %i0] 0x0c,	%o3
	fnor	%f18,	%f22,	%f30
	rd	%sys_tick_cmpr,	%g1
	prefetch	[%l7 + 0x08],	 0x3
	fmul8x16al	%f18,	%f12,	%f6
	rdpr	%otherwin,	%i6
	rd	%asi,	%i4
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x30
	set	0x30, %l4
	ldxa	[%g0 + %l4] 0x20,	%l1
	fnand	%f12,	%f24,	%f26
	fones	%f17
	taddcc	%o1,	0x1EB5,	%g4
	fmovsle	%xcc,	%f4,	%f4
	set	0x48, %g1
	stda	%o4,	[%l7 + %g1] 0x2b
	membar	#Sync
	orncc	%o6,	%l3,	%l5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	sethi	0x1544,	%i0
	movl	%icc,	%l0,	%i7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x353, 	%hsys_tick_cmpr
	andncc	%g3,	%o4,	%o2
	rdpr	%cansave,	%g7
	movg	%xcc,	%g5,	%o7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x21F, 	%hsys_tick_cmpr
	fones	%f9
	rdpr	%tba,	%i1
	rdpr	%cansave,	%l2
	wr	%g0,	0x88,	%asi
	swapa	[%l7 + 0x4C] %asi,	%i2
	wrpr	%l4,	0x094F,	%tick
	fmovrslez	%o3,	%f9,	%f29

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xC31, 	%hsys_tick_cmpr
	wr	%i3,	0x17BC,	%clear_softint
	umul	%i4,	%i6,	%o1
	tn	%xcc,	0x7
	wrpr	%l1,	%o5,	%tick
	wrpr	%g4,	%l3,	%tick
	sir	0x0909
	rdhpr	%hsys_tick_cmpr,	%l5
	wrpr	%l6,	0x05F8,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	sdivcc	%l0,	0x1B15,	%i7
	fmul8x16al	%f23,	%f8,	%f8
	bneg,a	loop_133
	orn	%i0,	%o0,	%g6
	array8	%o4,	%g3,	%g7
	rdpr	%tl,	%g5
loop_133:
	smulcc	%o2,	0x1AFF,	%o7
	wrpr	%g2,	0x0B3C,	%cwp
	taddcc	%i5,	%i1,	%i2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xDCF, 	%hsys_tick_cmpr
	rdpr	%otherwin,	%g1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x908, 	%hsys_tick_cmpr
	wrpr	%i6,	%l1,	%cwp
	rdpr	%pil,	%o5
	rdhpr	%hintp,	%g4
	rdhpr	%hintp,	%o1
	tle	%icc,	0x2
	rdpr	%otherwin,	%l5
	edge16ln	%l3,	%l6,	%l0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x325, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x652, 	%hsys_tick_cmpr
	addc	%o0,	%g6,	%g3
	subcc	%g7,	0x0712,	%o4
	rdpr	%tl,	%o2
	edge16n	%o7,	%g5,	%i5
	rdpr	%cansave,	%g2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x5DE, 	%hsys_tick_cmpr
	rdhpr	%hpstate,	%i2
	bpos,pt	%icc,	loop_134
	wrpr	%o3,	0x1E12,	%cwp
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbule	%fcc1,	loop_135
loop_134:
	fba,a	%fcc0,	loop_136
	array16	%l4,	%l2,	%i3
	ldub	[%l7 + 0x1B],	%i4
loop_135:
	nop
	wr	%g0,	0x22,	%asi
	stha	%g1,	[%l7 + 0x4E] %asi
	membar	#Sync
loop_136:
	tle	%icc,	0x3
	sir	0x0A6D
	rdhpr	%htba,	%i6
        wr    %g0,    0xe,    %pcr    ! changed.
	rdpr	%pil,	%g4
	tvc	%xcc,	0x0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xE40, 	%hsys_tick_cmpr
	rd	%y,	%l1
	movrgz	%l3,	%l0,	%o6
	wr	%i0,	0x0565,	%ccr
	rdpr	%cwp,	%l6
	rdpr	%cwp,	%i7
	rdpr	%gl,	%g6
	set	0x68, %o4
	stda	%o0,	[%l7 + %o4] 0x22
	membar	#Sync
	rdhpr	%hintp,	%g7
	bvc,a,pn	%xcc,	loop_137
	andcc	%g3,	%o4,	%o2
	rdhpr	%hsys_tick_cmpr,	%o7
	wrpr	%i5,	0x1299,	%tick
loop_137:
	rd	%tick_cmpr,	%g5
	fornot2s	%f2,	%f17,	%f22
	wrpr	%i1,	0x058F,	%cwp
	addc	%i2,	0x1AB4,	%o3
	wr 	%g0, 	0x4, 	%fprs
	wr	%l4,	%i3,	%sys_tick
	fblg,a	%fcc3,	loop_138
	wr	%i4,	%g1,	%y
	wrpr	%o5,	%i6,	%tick
	wr 	%g0, 	0x7, 	%fprs
loop_138:
	rd	%fprs,	%l5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x19A, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x274, 	%hsys_tick_cmpr
	rdhpr	%hpstate,	%g4
	fandnot1	%f14,	%f30,	%f12
	movgu	%xcc,	%i0,	%l6
	wr	%o6,	%i7,	%sys_tick
	edge8n	%g6,	%g7,	%g3
	edge16n	%o4,	%o0,	%o2
	fmovsgu	%icc,	%f8,	%f30
	array32	%o7,	%g5,	%i1
	rdpr	%cansave,	%i2
	rdpr	%cwp,	%i5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x914, 	%hsys_tick_cmpr
	xnorcc	%g2,	%l4,	%i3
	rdhpr	%htba,	%i4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%l2,	0x0591,	%tick
	tl	%xcc,	0x2
	array8	%o5,	%o1,	%l5
	wrpr	%i6,	0x19B8,	%tick
	std	%l2,	[%l7 + 0x50]
	wr	%g0,	0x89,	%asi
	prefetcha	[%l7 + 0x40] %asi,	 0x1
        wr    %g0,    0xe,    %pcr    ! changed.
	rdpr	%wstate,	%l6
	movrlz	%i0,	%o6,	%g6
	edge32l	%g7,	%i7,	%o4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xF86, 	%hsys_tick_cmpr
	wr	%g0,	0x10,	%asi
	ldda	[%l7 + 0x20] %asi,	%g2
	rdpr	%cansave,	%o7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	movleu	%xcc,	%i2,	%i5
	mulx	%i1,	0x1B11,	%o3
	wr	%g0,	0x04,	%asi
	lduba	[%l7 + 0x1C] %asi,	%g2
	fors	%f16,	%f18,	%f11
	umul	%i3,	%l4,	%i4
	wrpr	%g1,	%o5,	%pil
	rd	%softint,	%l2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%i6,	0x0FB5,	%pil
	wr	%l1,	%l3,	%softint
	prefetch	[%l7 + 0x74],	 0x3
	umulcc	%l0,	%l6,	%g4
	wr	%i0,	%g6,	%sys_tick
	wrpr	%g7,	0x1F7D,	%pil
	sir	0x1A61
	array16	%o6,	%o4,	%i7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x83E, 	%tick_cmpr
	set	0x50, %l2
	ldda	[%l7 + %l2] 0xeb,	%g2
	wrpr	%o2,	%g5,	%cwp
	wr	%i2,	0x03C8,	%softint
	wr	%o7,	0x1883,	%set_softint

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x289, 	%sys_tick_cmpr
	wrpr	%i5,	%i3,	%pil
	rd	%asi,	%l4
	andcc	%i4,	%g1,	%o5
	rdpr	%wstate,	%l2
	nop
	set	0x1C, %l5
	ldub	[%l7 + %l5],	%l5
	array16	%g2,	%o1,	%i6
	fmovrdgz	%l3,	%f6,	%f6
	fnands	%f4,	%f10,	%f1
	fmuld8ulx16	%f26,	%f22,	%f16

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%l0,	0x021F,	%clear_softint
	tl	%icc,	0x7
	wrpr	%l6,	%g4,	%tick
	fbuge,a	%fcc0,	loop_139
	orn	%g6,	0x0D0D,	%i0
	rdpr	%cansave,	%g7
	rdhpr	%htba,	%o6
loop_139:
	rdhpr	%hintp,	%o4
	rd	%ccr,	%o0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	rd	%asi,	%g5
	rdpr	%tba,	%o2
	wrpr	%o7,	0x1F24,	%cwp
	fxnor	%f14,	%f16,	%f24
	bvs,a,pn	%icc,	loop_140
	wrpr	%i2,	%i1,	%cwp
	rd	%tick_cmpr,	%i5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_140:
	fpsub32s	%f30,	%f10,	%f11
	tvc	%xcc,	0x7
	rdpr	%cwp,	%o3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x7E7, 	%hsys_tick_cmpr
	movrgez	%g1,	%o5,	%l5
	wr	%l2,	0x1F5D,	%pic
	rd	%softint,	%g2
	fmovdvs	%icc,	%f22,	%f30
	rd	%softint,	%o1
	wrpr	%l3,	0x19FB,	%tick
	rd	%softint,	%l1
	be,a,pt	%icc,	loop_141
	wr	%l0,	%l6,	%sys_tick
	tneg	%icc,	0x5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_141:
	wr	%g6,	0x1FCE,	%pic
	rdpr	%otherwin,	%i0
	wrpr	%g7,	0x0808,	%cwp
	tge	%xcc,	0x7
	smul	%o6,	0x07D9,	%i6
	rdhpr	%hintp,	%o0
	set	0x6D, %i6
	ldsba	[%l7 + %i6] 0x19,	%g3
	wrpr	%o4,	0x1F80,	%tick
	fpmerge	%f9,	%f9,	%f4
	fzeros	%f7
	ldx	[%l7 + 0x30],	%i7
	wr	%g5,	%o7,	%set_softint
	fba	%fcc1,	loop_142
	mulx	%i2,	%i1,	%o2
	rdhpr	%hintp,	%i5
	rdhpr	%htba,	%o3
loop_142:
	rdhpr	%hsys_tick_cmpr,	%i3
	wr	%i4,	0x1202,	%sys_tick
	rdpr	%gl,	%l4
	rdhpr	%hintp,	%g1
	addccc	%l5,	0x13BF,	%l2
	rdpr	%tl,	%o5
	wrpr	%o1,	%l3,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x695, 	%hsys_tick_cmpr
	fmovs	%f15,	%f18
	movrne	%l0,	%g4,	%l6
	wr	%i0,	%g7,	%pic
	std	%g6,	[%l7 + 0x08]

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%o0,	0x1F30,	%y
	wrpr	%o6,	%g3,	%tick
	rd	%fprs,	%o4
	fcmpeq16	%f28,	%f16,	%g5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%pil,	%i1
	movrgz	%i7,	%i5,	%o3
	wrpr	%o2,	0x0E0B,	%pil
	rd	%y,	%i3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%l4,	%g1,	%sys_tick
	rdhpr	%hpstate,	%l5
	bcc	%xcc,	loop_143
	movrgz	%l2,	%o5,	%o1
	mulx	%g2,	0x112C,	%l1
	rd	%asi,	%l0
loop_143:
	orncc	%l3,	0x1CE7,	%l6
	array8	%i0,	%g4,	%g7
	fandnot1s	%f2,	%f3,	%f31
	rdpr	%cwp,	%g6
	wr	%g0,	0x81,	%asi
	ldsba	[%l7 + 0x2B] %asi,	%o0
	popc	0x06AF,	%i6
	wrpr	%g3,	0x0398,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x7DC, 	%hsys_tick_cmpr
	rd	%ccr,	%o4
	rd	%fprs,	%o7
	wrpr	%i1,	0x1499,	%tick
	rdpr	%otherwin,	%i7
	set	0x40, %g6
	stda	%i2,	[%l7 + %g6] 0x10

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x0FF, 	%hsys_tick_cmpr
	tn	%xcc,	0x1
	membar	0x11
	tg	%icc,	0x6
	sir	0x0D09
	fmovsle	%icc,	%f0,	%f25
	wr	%g0,	0x10,	%asi
	stda	%o2,	[%l7 + 0x60] %asi
	tge	%icc,	0x6
	movg	%icc,	%i4,	%i3
	andn	%g1,	%l4,	%l5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xE03, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	bg	loop_144
	rdpr	%cwp,	%o5
	umul	%l3,	0x06A2,	%l0
	wrpr	%l6,	0x0871,	%pil
loop_144:
	add	%i0,	0x0140,	%g7
	rdpr	%canrestore,	%g6
	rdhpr	%hsys_tick_cmpr,	%o0
	edge32n	%i6,	%g4,	%g3
	wrpr	%o6,	0x00E6,	%tick
	rdhpr	%htba,	%o4
	wrpr	%g5,	%i1,	%tick
	ble,a	%xcc,	loop_145
	fmul8x16al	%f10,	%f4,	%f26
	wr	%g0,	0x89,	%asi
	lduwa	[%l7 + 0x40] %asi,	%i7
loop_145:
	ble	loop_146
	fmovsl	%xcc,	%f0,	%f23

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x342, 	%hsys_tick_cmpr
	set	0x18, %g7
	prefetcha	[%l7 + %g7] 0x81,	 0x1
loop_146:
	movn	%icc,	%i5,	%i4
	tcc	%icc,	0x7
	fcmple16	%f26,	%f22,	%o2
	tg	%icc,	0x4
	umul	%i3,	%g1,	%l4
	rdhpr	%hsys_tick_cmpr,	%l5
	rdhpr	%hpstate,	%l2
	fbn,a	%fcc0,	loop_147
	rdhpr	%htba,	%g2
	addcc	%o1,	0x1CA2,	%o5
	rd	%ccr,	%l3
loop_147:
	rdpr	%cansave,	%l1
	fmovsg	%xcc,	%f0,	%f19
	fmovdgu	%xcc,	%f0,	%f25
	bshuffle	%f6,	%f24,	%f18
	orncc	%l0,	%i0,	%l6
	rdpr	%cwp,	%g6
	wr	%g0,	0x10,	%asi
	prefetcha	[%l7 + 0x30] %asi,	 0x1
	wr	%i6,	%g7,	%sys_tick
	tleu	%xcc,	0x3
	rd	%sys_tick_cmpr,	%g4
	or	%g3,	%o4,	%g5
	array16	%i1,	%o6,	%o7
	fpmerge	%f21,	%f22,	%f2
	wr	%i7,	0x1535,	%set_softint

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xEEE, 	%hsys_tick_cmpr
	fcmpne32	%f6,	%f26,	%i5
	wr	%i2,	%o2,	%softint
	rdpr	%cansave,	%i3
	rdhpr	%hsys_tick_cmpr,	%g1
	wrpr	%i4,	0x06AD,	%tick
	bn	%icc,	loop_148
	wrpr	%l5,	%l2,	%pil
	andncc	%g2,	%o1,	%o5
	ldstub	[%l7 + 0x29],	%l4
loop_148:
	wr	%l1,	%l3,	%set_softint
	xnor	%i0,	0x09C1,	%l0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fxnor	%f6,	%f2,	%f14
	rd	%pc,	%o0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%htba,	%o4
	wr	%g5,	0x0363,	%ccr
	fbu	%fcc2,	loop_149
	wrpr	%g3,	0x0DBA,	%cwp
	bl,a,pt	%xcc,	loop_150
	tleu	%icc,	0x7
loop_149:
	wrpr	%o6,	%i1,	%cwp
	alignaddr	%o7,	%i7,	%i5
loop_150:
	wr	%o3,	%i2,	%set_softint
	fmul8sux16	%f20,	%f12,	%f28
	or	%o2,	%g1,	%i4
	bn,pn	%icc,	loop_151
	rdpr	%canrestore,	%i3
	te	%xcc,	0x4
	prefetch	[%l7 + 0x28],	 0x1
loop_151:
	rd	%asi,	%l2
	rdhpr	%hintp,	%l5
	rdpr	%cwp,	%g2
	rdpr	%cleanwin,	%o1
	rdpr	%otherwin,	%o5
	wrpr	%l1,	%l3,	%tick
	bne,a,pt	%xcc,	loop_152
	fmovsvs	%icc,	%f11,	%f12
	rdpr	%wstate,	%l4
	wrpr	%l0,	%l6,	%tick
loop_152:
        wr    %g0,    0xe,    %pcr    ! changed.
	wrpr	%i0,	%i6,	%tick
	rdpr	%gl,	%g7
	edge32	%o4,	%g5,	%g3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	movgu	%icc,	%i1,	%o7
	rdpr	%gl,	%i5
	rdhpr	%hsys_tick_cmpr,	%i7
	alignaddrl	%o3,	%o2,	%g1
	wrpr	%i4,	%i2,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%l5,	0x1570,	%tick
	tn	%xcc,	0x7
	fmovrsgz	%g2,	%f8,	%f17
	tn	%xcc,	0x1
	bpos,a,pt	%xcc,	loop_153
	wr	%o5,	0x13B6,	%clear_softint
	tge	%icc,	0x7
	rd	%fprs,	%o1
loop_153:
	rdhpr	%hsys_tick_cmpr,	%l1
	wr	%l3,	%l4,	%ccr
	wr	%l0,	%o0,	%clear_softint
	rdhpr	%hintp,	%g6
	wr	%i0,	%l6,	%softint
	edge16n	%g7,	%o4,	%i6
	set	0x28, %i2
	stwa	%g5,	[%l7 + %i2] 0x15
	rdhpr	%hpstate,	%g3
	wrpr	%o6,	0x0E5D,	%pil
	tge	%icc,	0x1
	add	%l7,	0x30,	%l6
	wr	%g0,	0x04,	%asi
	casa	[%l6] 0x04,	%g4,	%o7
	rdpr	%tba,	%i5
	wrpr	%i7,	%o3,	%pil
	movrne	%i1,	0x2D2,	%o2
	addcc	%g1,	0x1E0D,	%i2
	ba,pt	%icc,	loop_154
	brnz	%i3,	loop_155
	rd	%pc,	%i4
	addccc	%l2,	0x0065,	%g2
loop_154:
	fcmpne16	%f14,	%f20,	%o5
loop_155:
	rdhpr	%hintp,	%o1
	bg	loop_156
	wrpr	%l5,	%l1,	%cwp
	rd	%ccr,	%l4
	rd	%softint,	%l3
loop_156:
	wrpr	%o0,	%l0,	%tick
	fcmpd	%fcc1,	%f18,	%f8
	rdpr	%cleanwin,	%g6
	rd	%ccr,	%i0
	alignaddr	%g7,	%o4,	%l6
	wr	%i6,	0x13F5,	%set_softint
	rdpr	%cwp,	%g3
	edge8ln	%g5,	%o6,	%g4
	rd	%fprs,	%i5
	std	%o6,	[%l7 + 0x40]

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	movge	%icc,	%o2,	%i7
	umul	%i2,	%i3,	%g1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	edge8n	%l2,	%o5,	%o1
	fpackfix	%f10,	%f25
	rd	%sys_tick_cmpr,	%l1
	sethi	0x12CD,	%l4
	rd	%asi,	%l5
	brnz,a	%l3,	loop_157
	wr	%o0,	%g6,	%y
	stbar
	wr	%l0,	%g7,	%softint
loop_157:
	wrpr	%o4,	%i0,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	xnorcc	%g3,	%g5,	%i6
	fble,a	%fcc1,	loop_158
	wrpr	%g4,	%i5,	%cwp
	rd	%asi,	%o6
	wrpr	%o7,	0x0B87,	%tick
loop_158:
	fnor	%f26,	%f26,	%f2
	rd	%pc,	%i1
	wr	%o2,	0x0133,	%sys_tick
	wrpr	%i7,	0x1AB0,	%tick
	te	%xcc,	0x5
	wrpr	%i2,	%i3,	%pil
	edge8n	%o3,	%i4,	%g2
	rdhpr	%hpstate,	%l2
	wr 	%g0, 	0x6, 	%fprs
	movle	%icc,	%l1,	%l4
	fmul8ulx16	%f8,	%f6,	%f26
	wrpr	%g1,	0x1E9E,	%tick
	sra	%l5,	%l3,	%o0
	ldsw	[%l7 + 0x20],	%g6
	fpadd16s	%f10,	%f22,	%f6
        wr    %g0,    0xe,    %pcr    ! changed.
	lduh	[%l7 + 0x2A],	%i0
	wr	%l6,	%l0,	%ccr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x3E8, 	%sys_tick_cmpr
	wr	%g4,	0x18F9,	%sys_tick
	rd	%ccr,	%i6
	rdpr	%cansave,	%o6
	orncc	%o7,	%i1,	%o2
	rdpr	%cansave,	%i7
	movgu	%xcc,	%i5,	%i2
	fble	%fcc3,	loop_159
	rd	%ccr,	%o3
	or	%i4,	%i3,	%g2
	rd	%asi,	%o5
loop_159:
	fandnot2	%f6,	%f30,	%f0
	stbar

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	mulx	%l4,	0x0361,	%o1
	movneg	%xcc,	%g1,	%l5
	rd	%tick_cmpr,	%o0
	rdhpr	%hpstate,	%g6
	bcs,a	loop_160
	rdhpr	%htba,	%g7
	wrpr	%l3,	%o4,	%pil
	rdpr	%tba,	%i0
loop_160:
	sethi	0x06FC,	%l6
	rd	%fprs,	%g3
	rd	%fprs,	%l0
	bpos,pt	%icc,	loop_161
	fbu	%fcc1,	loop_162
	wr	%g4,	%g5,	%softint
	mulscc	%i6,	0x17CE,	%o7
loop_161:
	tg	%icc,	0x6
loop_162:
	std	%f10,	[%l7 + 0x40]
	rd	%y,	%i1
	rdpr	%gl,	%o6
	tcs	%xcc,	0x3
	rdpr	%tl,	%i7
	movrgz	%o2,	0x3DA,	%i2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%hpstate,	%i4
	stw	%i3,	[%l7 + 0x28]

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%o5,	%l4,	%sys_tick
	wr	%g0,	0x10,	%asi
	lduwa	[%l7 + 0x30] %asi,	%l1
	ldsh	[%l7 + 0x52],	%o1
	addccc	%g1,	0x1A68,	%l5
	add	%l7,	0x08,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%o0
	casxa	[%l6] 0x81,	%o0,	%g7
	rdpr	%tl,	%l3
	tl	%xcc,	0x4
	tn	%xcc,	0x0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x5F0, 	%sys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x8D9, 	%hsys_tick_cmpr
	wrpr	%g3,	0x1DB8,	%cwp
	membar	0x39
	rdhpr	%htba,	%g4
	addc	%l0,	%g5,	%i6
	fnot2	%f28,	%f18
	wrpr	%i1,	0x03E8,	%cwp
	edge16	%o7,	%o6,	%o2
	wr 	%g0, 	0x4, 	%fprs
	rdpr	%cansave,	%o3
	tleu	%icc,	0x7
        wr    %g0,    0xe,    %pcr    ! changed.
	te	%xcc,	0x5
	rdpr	%gl,	%i4
	rd	%y,	%i5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	ldub	[%l7 + 0x21],	%l2
	rdhpr	%hpstate,	%o5
	wr 	%g0, 	0x6, 	%fprs

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	and	%g2,	%o1,	%g1
	wrpr	%l5,	0x14F3,	%pil
	rdpr	%cleanwin,	%o0
	orcc	%l3,	%g7,	%g6
	rd	%y,	%i0
	bgu	loop_163
	edge32ln	%l6,	%g3,	%g4
	rdpr	%cleanwin,	%o4
	rdpr	%tl,	%l0
loop_163:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	te	%icc,	0x2
	rdpr	%wstate,	%g5
	rdhpr	%htba,	%o7
	std	%i0,	[%l7 + 0x78]
	rdhpr	%hpstate,	%o2
	tl	%xcc,	0x0
	wr	%g0,	0x19,	%asi
	ldxa	[%l7 + 0x58] %asi,	%i7
	rdpr	%gl,	%o3
	rd	%y,	%i2
	fbu,a	%fcc2,	loop_164
	wrpr	%o6,	%i5,	%cwp
	umul	%i4,	%l2,	%i3
	subccc	%o5,	%l4,	%g2
loop_164:
	rdhpr	%hpstate,	%o1
	rdpr	%wstate,	%l1
	rd	%ccr,	%l5
	edge8l	%g1,	%l3,	%o0
	fmovrsgez	%g6,	%f5,	%f24
	sdivx	%g7,	0x1B2C,	%i0
	fcmpeq32	%f28,	%f10,	%g3
	wrpr	%l6,	0x12AB,	%pil
	wrpr	%g4,	0x1F77,	%tick
	rdpr	%canrestore,	%o4
	wrpr	%i6,	0x0F50,	%cwp
	edge16n	%l0,	%g5,	%i1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr 	%g0, 	0x4, 	%fprs
	edge32l	%i7,	%o3,	%i2
	rdpr	%wstate,	%o6
	rdpr	%cleanwin,	%i5
	rd	%fprs,	%i4
	edge8	%i3,	%l2,	%l4
	edge16n	%o5,	%g2,	%o1
	wr	%l1,	0x12B7,	%set_softint
	edge32	%g1,	%l3,	%l5
	wrpr	%g6,	%g7,	%tick
	movleu	%xcc,	%o0,	%g3
	wrpr	%l6,	0x108B,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%hpstate,	%g4
	movle	%xcc,	%i6,	%l0
	wrpr	%g5,	%o4,	%cwp
	wr	%i1,	%o2,	%set_softint

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x2B2, 	%hsys_tick_cmpr
	movleu	%xcc,	%i7,	%o3
	sethi	0x0586,	%i2
	rd	%fprs,	%o6
	wrpr	%i5,	0x1E55,	%tick
	wrpr	%i4,	0x0A53,	%tick
	rd	%fprs,	%l2
	rd	%ccr,	%i3
	rdhpr	%htba,	%o5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sllx	%l4,	0x08,	%o1
	movcc	%xcc,	%l1,	%g2
	wrpr	%g1,	0x0932,	%tick
	rd	%tick_cmpr,	%l5
	edge8l	%l3,	%g7,	%g6
	fbuge	%fcc2,	loop_165
	movrgz	%g3,	0x302,	%o0
	set	0x35, %o0
	lduba	[%l7 + %o0] 0x0c,	%l6
loop_165:
	fbe,a	%fcc1,	loop_166
	fmovspos	%xcc,	%f26,	%f28
	fmovscc	%icc,	%f29,	%f28
	rd	%fprs,	%i0
loop_166:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	sethi	0x1A41,	%i6
	nop
	setx loop_167, %l0, %l1
	jmpl %l1, %l0
	rdpr	%tba,	%g5
	rd	%fprs,	%i1
	xorcc	%o2,	%o4,	%i7
loop_167:
	fmovscc	%icc,	%f19,	%f22
	wr	%o3,	0x1202,	%sys_tick
	wrpr	%i2,	0x0613,	%cwp
	rdpr	%tl,	%o7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x488, 	%hsys_tick_cmpr
	fmovrdne	%i5,	%f24,	%f24
	fornot2	%f4,	%f6,	%f18

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%cansave,	%l4
	bvc,a,pt	%xcc,	loop_168
	rdhpr	%htba,	%o1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x80F, 	%hsys_tick_cmpr
	tvs	%icc,	0x4
loop_168:
	wrpr	%l1,	0x13F0,	%cwp
	array32	%g2,	%l5,	%g1
	fmul8sux16	%f26,	%f28,	%f12
	movre	%g7,	0x347,	%g6
	rdpr	%tba,	%l3
	wr 	%g0, 	0x6, 	%fprs

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xDC9, 	%hsys_tick_cmpr
	udivcc	%g4,	0x1FAB,	%g3
	fblg	%fcc0,	loop_169
	rdpr	%gl,	%l0
	wr	%i6,	0x0C3B,	%y
	wr	%i1,	0x0229,	%clear_softint
loop_169:
	rdpr	%cleanwin,	%o2
	ldx	[%l7 + 0x78],	%g5
	edge16n	%o4,	%o3,	%i7
	wr	%i2,	%o7,	%ccr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x193, 	%hsys_tick_cmpr
	rdpr	%tba,	%o6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%canrestore,	%o1
	rdpr	%tl,	%l2
	andcc	%o5,	%g2,	%l5
	wr 	%g0, 	0x5, 	%fprs
	set	0x10, %i1
	stda	%g6,	[%l7 + %i1] 0x0c
	wrpr	%l3,	%o0,	%tick
	rdpr	%tl,	%l1
	edge8	%l6,	%g4,	%g3
	tvs	%icc,	0x6
	wr	%i0,	0x0AC9,	%clear_softint
	tleu	%xcc,	0x1
	rdpr	%gl,	%i6
	xor	%i1,	%l0,	%o2
	set	0x70, %g3
	swapa	[%l7 + %g3] 0x0c,	%g5
	xnorcc	%o3,	%i7,	%o4
	pdist	%f8,	%f20,	%f24
	faligndata	%f18,	%f24,	%f22
	rdhpr	%hintp,	%o7
	wr	%i2,	0x1C72,	%pic
	umul	%i4,	%i5,	%i3
	wrpr	%l4,	0x1DAC,	%cwp
	rdhpr	%htba,	%o1
	movne	%icc,	%l2,	%o6
	bvs,a,pt	%icc,	loop_170
	fmovdleu	%xcc,	%f29,	%f27
	bcc,a,pt	%icc,	loop_171
	rd	%pc,	%o5
loop_170:
	rd	%fprs,	%g2
	prefetch	[%l7 + 0x18],	 0x3
loop_171:
        wr    %g0,    0xe,    %pcr    ! changed.
	wr	%g7,	%g6,	%sys_tick
	movne	%xcc,	%g1,	%o0
	rd	%y,	%l1
	wrpr	%l3,	0x1DCE,	%cwp
	wrpr	%l6,	%g4,	%cwp
	rd	%ccr,	%i0
	rdhpr	%hpstate,	%g3
	rdhpr	%hpstate,	%i1
	rdpr	%canrestore,	%i6
	wrpr	%o2,	0x10F5,	%cwp
	wrpr	%l0,	0x0279,	%cwp
	rdpr	%tba,	%g5
	add	%o3,	%o4,	%i7
	fnot1	%f24,	%f18
	wrpr	%o7,	%i2,	%tick
	udivx	%i4,	0x0911,	%i3
	wr	%i5,	%l4,	%set_softint
	udivcc	%l2,	0x0E2E,	%o1
	fmovdn	%xcc,	%f9,	%f0
	mova	%icc,	%o5,	%o6
	tsubcctv	%l5,	0x1F61,	%g7
	rdpr	%canrestore,	%g6
	set	0x1C, %o2
	ldswa	[%l7 + %o2] 0x14,	%g2
	wr	%o0,	0x0952,	%y
	wrpr	%g1,	%l3,	%pil
	sub	%l1,	0x0598,	%g4
	rdpr	%canrestore,	%l6
	rdpr	%otherwin,	%i0
	wr	%i1,	%g3,	%y
	fand	%f28,	%f0,	%f4
	rdhpr	%hintp,	%i6
	rdpr	%wstate,	%l0
	movl	%icc,	%g5,	%o3
	tn	%icc,	0x4
	nop
	setx	loop_172,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	rd	%asi,	%o2
	wr	%i7,	%o7,	%clear_softint
	wrpr	%i2,	0x01FB,	%cwp
loop_172:
	ldx	[%l7 + 0x20],	%i4
	rdhpr	%hintp,	%o4
	movn	%icc,	%i5,	%l4
	rdhpr	%htba,	%l2
	rd	%y,	%i3
	wr	%o1,	0x00EC,	%sys_tick
	wrpr	%o5,	%o6,	%pil
	bl	loop_173
	rd	%y,	%g7
	wr	%g6,	%g2,	%sys_tick
	rd	%ccr,	%o0
loop_173:
	rdpr	%tba,	%g1
	rdhpr	%hpstate,	%l5
	rdpr	%wstate,	%l3
	movrne	%l1,	0x077,	%g4
	fmovde	%icc,	%f24,	%f28
	for	%f26,	%f16,	%f12
	fba	%fcc0,	loop_174
	rdhpr	%hintp,	%l6
	ld	[%l7 + 0x6C],	%f19
	fba,a	%fcc0,	loop_175
loop_174:
	faligndata	%f26,	%f8,	%f6
	rdhpr	%hsys_tick_cmpr,	%i0
	rdpr	%cleanwin,	%i1
loop_175:
	rdhpr	%hpstate,	%g3
	movcc	%xcc,	%l0,	%i6
	mova	%icc,	%g5,	%o2
	orn	%o3,	%o7,	%i7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x954, 	%hsys_tick_cmpr
	fmovspos	%xcc,	%f15,	%f24
	rdpr	%tba,	%i5
	rdpr	%wstate,	%o4
	wrpr	%l4,	0x10F2,	%cwp
	wr	%g0,	0xe2,	%asi
	stda	%l2,	[%l7 + 0x58] %asi
	membar	#Sync
	rd	%softint,	%i3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x366, 	%tick_cmpr
	fbe	%fcc1,	loop_176
	nop
	setx loop_177, %l0, %l1
	jmpl %l1, %g7
	andcc	%g6,	0x0071,	%g2
	sdiv	%o6,	0x0B18,	%o0
loop_176:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_177:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x461, 	%hsys_tick_cmpr
	rdpr	%canrestore,	%l3
	wrpr	%g1,	%g4,	%pil
	fble	%fcc2,	loop_178
	edge16l	%l1,	%l6,	%i1
	tcs	%icc,	0x6
	mulx	%i0,	0x04A7,	%g3
loop_178:
	movpos	%xcc,	%l0,	%g5
	rd	%asi,	%o2
	rd	%softint,	%o3
	fbl,a	%fcc3,	loop_179
	wrpr	%i6,	0x19FB,	%tick
	rdhpr	%hpstate,	%i7
	fbge	%fcc0,	loop_180
loop_179:
	movrlz	%i4,	0x3BF,	%o7
        wr    %g0,    0xe,    %pcr    ! changed.
	udivx	%i5,	0x0BFD,	%o4
loop_180:
	array8	%l4,	%l2,	%o1
	rd	%pc,	%i3
	wrpr	%g7,	%g6,	%cwp
	ldsw	[%l7 + 0x44],	%g2
	andncc	%o6,	%o0,	%l5
	wrpr	%l3,	0x0BC7,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	tge	%icc,	0x6
	wrpr	%o5,	%l6,	%cwp
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x10
	set	0x10, %i4
	stxa	%l1,	[%g0 + %i4] 0x20

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fbg,a	%fcc0,	loop_181
	brlez	%g3,	loop_182
	rd	%pc,	%i1
	rdhpr	%hintp,	%l0
loop_181:
	nop
	wr	%g0,	0x80,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
loop_182:
	rdpr	%pil,	%g5
	wrpr	%o2,	%o3,	%pil
	rdhpr	%hsys_tick_cmpr,	%i7
	tneg	%icc,	0x7
        wr    %g0,    0xe,    %pcr    ! changed.
	wrpr	%i2,	%i5,	%cwp
	rdhpr	%hsys_tick_cmpr,	%o7
	array8	%l4,	%o4,	%o1
	rd	%ccr,	%l2
	array16	%g7,	%g6,	%i3
	rd	%y,	%o6
	wr	%g2,	0x1FEB,	%sys_tick
	rdhpr	%hintp,	%l5
	wr	%o0,	%g1,	%pic
	xnorcc	%l3,	0x0430,	%g4
	wr	%o5,	0x094E,	%sys_tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xCB3, 	%hsys_tick_cmpr
	sethi	0x040A,	%l1
	wr	%i0,	0x0C83,	%softint
	fpadd32	%f22,	%f26,	%f10
	fmul8sux16	%f10,	%f6,	%f22
	movre	%g3,	%i1,	%l0
	rdpr	%cansave,	%g5
	rd	%pc,	%o3
	udivx	%o2,	0x0422,	%i7
	brz	%i6,	loop_183
	wrpr	%i4,	0x0FE5,	%cwp
	wr	%i2,	0x12C3,	%sys_tick
	tne	%xcc,	0x3
loop_183:
	wr	%o7,	0x1149,	%softint
	rd	%pc,	%i5
	wrpr	%o4,	%l4,	%tick
	umul	%l2,	%g7,	%o1
	brnz,a	%g6,	loop_184
	udivx	%o6,	0x03A1,	%i3
	tpos	%icc,	0x6
	sdivx	%g2,	0x1213,	%o0
loop_184:
	rdhpr	%hintp,	%g1
	xorcc	%l5,	0x1AF3,	%l3
	set	0x70, %o7
	ldda	[%l7 + %o7] 0x2e,	%g4
	rdpr	%cansave,	%l6
	swap	[%l7 + 0x40],	%o5
	movrgez	%i0,	0x19F,	%g3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	mova	%xcc,	%l0,	%g5
	edge16n	%l1,	%o3,	%i7
	rdhpr	%hpstate,	%i6
	movcc	%xcc,	%i4,	%o2
	rd	%pc,	%o7
	add	%l7,	0x6C,	%l6
	wr	%g0,	0x19,	%asi
	casa	[%l6] 0x19,	%i5,	%i2
	edge8l	%o4,	%l4,	%g7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%o1,	0x1AC8,	%softint
	add	%i3,	%g2,	%o0
	tle	%xcc,	0x3
	wr	%o6,	%g1,	%set_softint
	rdpr	%canrestore,	%l3
	rdhpr	%htba,	%l5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x9E1, 	%hsys_tick_cmpr
	wr	%g4,	0x0462,	%y
	fmovsgu	%icc,	%f9,	%f25
	nop
	set	0x10, %l1
	stx	%g3,	[%l7 + %l1]
	rd	%y,	%i0
	fbule	%fcc0,	loop_185
	xor	%l0,	%i1,	%g5
	sir	0x111F
	wrpr	%o3,	%l1,	%pil
loop_185:
	nop
	wr	%g0,	0x89,	%asi
	ldsba	[%l7 + 0x1B] %asi,	%i7
	rdhpr	%hsys_tick_cmpr,	%i4
	rd	%asi,	%i6
	rdhpr	%htba,	%o2
	rdhpr	%hintp,	%i5
	rdhpr	%hintp,	%i2
	rdpr	%otherwin,	%o7
	rd	%pc,	%o4
	stx	%l4,	[%l7 + 0x70]
	sub	%g7,	%l2,	%g6
	andcc	%o1,	%g2,	%o0
	movvc	%xcc,	%o6,	%i3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	sir	0x0E46
	wrpr	%l5,	0x0B27,	%pil
	orcc	%l6,	%g4,	%g3
	tsubcctv	%o5,	0x013E,	%i0
	taddcc	%i1,	%l0,	%g5
	tgu	%xcc,	0x4
	fbue	%fcc3,	loop_186
	wrpr	%o3,	0x0509,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x3BC, 	%hsys_tick_cmpr
	tpos	%icc,	0x6
loop_186:
	wr	%i4,	%o2,	%set_softint
	rdhpr	%hpstate,	%i6
	bpos,a	%xcc,	loop_187
	wrpr	%i2,	0x12D9,	%cwp
	sir	0x0E70
	fmovdcc	%icc,	%f25,	%f4
loop_187:
	rdhpr	%hintp,	%o7
	movl	%icc,	%o4,	%l4
	wrpr	%g7,	0x0A4A,	%cwp
	wr	%g0,	0x80,	%asi
	stba	%i5,	[%l7 + 0x09] %asi
	rdpr	%otherwin,	%g6
	rd	%tick_cmpr,	%o1
	wrpr	%g2,	0x0083,	%cwp
	rdhpr	%hpstate,	%o0
	sra	%o6,	0x17,	%i3
	nop
	setx loop_188, %l0, %l1
	jmpl %l1, %g1
	fbuge	%fcc1,	loop_189
	rdhpr	%hintp,	%l3
	lduw	[%l7 + 0x6C],	%l2
loop_188:
	siam	0x7
loop_189:
	fnor	%f22,	%f16,	%f20
	rd	%tick_cmpr,	%l5
	movgu	%xcc,	%g4,	%g3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	add	%l7,	0x38,	%l6
	wr	%g0,	0x0c,	%asi
	lda	[%l6] %asi,	%i1
	casa	[%l6] %asi,	%i1,	%l0
	tvc	%xcc,	0x7
	rd	%y,	%g5
	rdpr	%otherwin,	%l6
	smul	%o3,	0x196B,	%i7
	std	%f0,	[%l7 + 0x58]
	fand	%f30,	%f0,	%f14
	wrpr	%i4,	0x182A,	%tick
	rd	%y,	%l1
	rd	%pc,	%o2
	st	%f3,	[%l7 + 0x14]
	fpsub16s	%f22,	%f1,	%f1
	wrpr	%i6,	%o7,	%cwp
	wrpr	%o4,	0x1CE8,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x4C2, 	%hsys_tick_cmpr
	or	%g7,	0x0EBB,	%i5
	edge32l	%i2,	%o1,	%g6
	srax	%o0,	%o6,	%g2
	movvc	%xcc,	%i3,	%g1
	fnegd	%f26,	%f22

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%g4,	0x080A,	%pil
	rdpr	%cleanwin,	%l5
	std	%o4,	[%l7 + 0x60]
	tvc	%icc,	0x2
	movvs	%icc,	%i0,	%g3
	tn	%icc,	0x6
	nop
	set	0x2C, %g5
	ldub	[%l7 + %g5],	%i1
	rdhpr	%hpstate,	%l0
	call	loop_190
	rdpr	%cwp,	%g5
	wr	%g0,	0x04,	%asi
	stba	%l6,	[%l7 + 0x24] %asi
loop_190:
	movrlez	%i7,	0x01B,	%i4
	fand	%f24,	%f8,	%f8
	movcc	%icc,	%o3,	%o2
	rd	%pc,	%l1
        wr    %g0,    0xe,    %pcr    ! changed.
	rd	%y,	%o7
	rdpr	%cansave,	%o4
	subcc	%l4,	%g7,	%i5
	taddcc	%i2,	%o1,	%o0
	rd	%tick_cmpr,	%g6
	fmovsgu	%xcc,	%f21,	%f10
	move	%xcc,	%g2,	%o6
	rd	%fprs,	%g1
	movcs	%xcc,	%i3,	%l3
	rd	%ccr,	%g4
	rdpr	%canrestore,	%l2
	xnorcc	%o5,	%l5,	%g3
	edge32n	%i1,	%l0,	%i0
	taddcctv	%l6,	0x08D1,	%g5
	wrpr	%i7,	0x11F4,	%tick
	bge,a	%xcc,	loop_191
	movge	%xcc,	%i4,	%o3
	brz	%o2,	loop_192
	smul	%l1,	%o7,	%o4
loop_191:
	rdhpr	%hpstate,	%i6
	rdpr	%cleanwin,	%g7
loop_192:
	rdpr	%cansave,	%l4
	udiv	%i5,	0x00AB,	%o1
	rd	%y,	%i2
	rdhpr	%hintp,	%o0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x9FB, 	%hsys_tick_cmpr
	rdhpr	%hsys_tick_cmpr,	%o6
	rdpr	%pil,	%g6
	ta	%xcc,	0x1
	set	0x40, %o3
	stda	%f16,	[%l7 + %o3] 0x18
	udivx	%i3,	0x0583,	%l3
	rd	%sys_tick_cmpr,	%g1
	rd	%tick_cmpr,	%l2
	movn	%icc,	%g4,	%o5
	tn	%icc,	0x0
	wr	%g3,	0x1601,	%ccr
	fmovsneg	%icc,	%f8,	%f16
	bneg,a,pn	%icc,	loop_193
	rdpr	%wstate,	%l5
	wrpr	%i1,	%l0,	%tick
	sra	%i0,	0x05,	%l6
loop_193:
	subcc	%i7,	0x1213,	%i4
	rd	%asi,	%o3
	rdhpr	%hpstate,	%g5
	xor	%l1,	%o7,	%o2
	rd	%pc,	%o4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x66F, 	%hsys_tick_cmpr
        wr    %g0,    0xe,    %pcr    ! changed.

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	ldstub	[%l7 + 0x69],	%o0
	rd	%tick_cmpr,	%g2
	rdpr	%wstate,	%o6
	lduw	[%l7 + 0x18],	%i6
	movne	%icc,	%i3,	%l3
	fcmpne16	%f16,	%f22,	%g1
	rdpr	%tba,	%l2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x8CB, 	%hsys_tick_cmpr
	tg	%icc,	0x7
	brnz	%o5,	loop_194
	wrpr	%l5,	0x0219,	%tick
	rd	%pc,	%g3
	rd	%sys_tick_cmpr,	%l0
loop_194:
	nop
	setx loop_195, %l0, %l1
	jmpl %l1, %i0
	rdpr	%tl,	%i1
	rdhpr	%htba,	%i7
	rdhpr	%htba,	%l6
loop_195:
	wrpr	%o3,	0x0F31,	%cwp
	fandnot2s	%f10,	%f16,	%f14
	rdpr	%tl,	%i4
	rd	%fprs,	%g5
	ldstub	[%l7 + 0x46],	%o7
	wr	%o2,	%l1,	%pic
	lduw	[%l7 + 0x08],	%g7
	rd	%tick_cmpr,	%o4
	bcc,a,pt	%icc,	loop_196
	brlz,a	%l4,	loop_197
        wr    %g0,    0xe,    %pcr    ! changed.
	wrpr	%i2,	%o1,	%tick
loop_196:
	udiv	%o0,	0x1D5A,	%o6
loop_197:
	edge8l	%g2,	%i3,	%l3
	rdhpr	%hintp,	%i6
	wrpr	%l2,	%g1,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xFC3, 	%tick_cmpr
	wrpr	%g4,	0x06AF,	%pil
	rdhpr	%hsys_tick_cmpr,	%l5
	tne	%icc,	0x6
	wr	%l0,	0x01C8,	%set_softint
	edge8l	%g3,	%i1,	%i0
	fmovdleu	%xcc,	%f18,	%f19
	rdpr	%gl,	%i7
	edge16n	%l6,	%i4,	%g5
	rdpr	%cleanwin,	%o7
	rdpr	%cansave,	%o2
	movre	%o3,	%l1,	%g7
	wr	%o4,	0x0B77,	%y

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x1C6, 	%sys_tick_cmpr
	brgz,a	%i2,	loop_198
	rdpr	%tba,	%l4
	movpos	%icc,	%o0,	%o6
	orcc	%g2,	%i3,	%o1
loop_198:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%l3,	%l2,	%softint
	sir	0x1CDC
	and	%g6,	0x18DD,	%o5
	membar	#Sync
	set	0x40, %i7
	ldda	[%l7 + %i7] 0xf8,	%f0
	wrpr	%g1,	%g4,	%cwp
	rd	%pc,	%l5
	wrpr	%g3,	0x1CB6,	%cwp
	rdhpr	%htba,	%i1
	wrpr	%i0,	%i7,	%cwp
        wr    %g0,    0xe,    %pcr    ! changed.
	brlez,a	%g5,	loop_199
	rdhpr	%hsys_tick_cmpr,	%l0
	mova	%xcc,	%o7,	%o2
	wr	%l1,	%o3,	%ccr
loop_199:
	rdhpr	%hsys_tick_cmpr,	%g7
	edge16ln	%i5,	%i2,	%o4
	wrpr	%l4,	0x19E1,	%tick
	wrpr	%o6,	%g2,	%pil
	edge16	%i3,	%o0,	%i6
	fpadd32s	%f16,	%f26,	%f12
	rdpr	%gl,	%o1
	taddcc	%l2,	0x02DB,	%l3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	edge16n	%g4,	%g6,	%g3
	sethi	0x1FD3,	%i1
	rd	%tick_cmpr,	%l5
	wr 	%g0, 	0x5, 	%fprs
	rdhpr	%hintp,	%i0
	wrpr	%i4,	%l0,	%cwp
	wr	%o7,	0x1626,	%sys_tick
	subc	%o2,	0x0D34,	%g5
	xorcc	%l1,	0x02F8,	%o3
	and	%g7,	%i2,	%o4
	fble,a	%fcc2,	loop_200
	wrpr	%l4,	0x1F85,	%tick
	tvs	%icc,	0x6
	fmovscc	%xcc,	%f29,	%f12
loop_200:
	rdhpr	%hsys_tick_cmpr,	%i5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fnegd	%f12,	%f18
	movrlz	%o0,	0x366,	%i3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x88C, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xA3D, 	%hsys_tick_cmpr
	wrpr	%l3,	0x1C2F,	%tick
	wr 	%g0, 	0x7, 	%fprs
	wr	%g0,	0x04,	%asi
	lduwa	[%l7 + 0x48] %asi,	%g4
	wrpr	%g3,	%i1,	%cwp
	fexpand	%f26,	%f10
	rd	%tick_cmpr,	%l5
	wr	%g6,	%l6,	%ccr
	movrgez	%i7,	%i4,	%i0
        wr    %g0,    0xe,    %pcr    ! changed.
	wrpr	%o2,	%o7,	%pil
	rdhpr	%hpstate,	%l1
	wr	%g5,	%g7,	%pic

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	taddcctv	%i2,	%l4,	%i5
	tcs	%xcc,	0x2
	fmovs	%f4,	%f12
	rd	%tick_cmpr,	%o6
	wr	%o0,	0x09EC,	%softint
	rdpr	%gl,	%i3
	rdpr	%canrestore,	%i6
	tcs	%icc,	0x0
	wr	%l2,	%o1,	%pic
	rdpr	%gl,	%l3
	orcc	%g2,	0x01B5,	%o5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%hintp,	%i1
	rdpr	%wstate,	%g1
	edge8ln	%l5,	%g6,	%l6
	fmovda	%icc,	%f14,	%f6
	wrpr	%i4,	0x130C,	%tick
	fcmpeq16	%f14,	%f10,	%i0
	tcs	%xcc,	0x1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	fmul8x16au	%f22,	%f12,	%f6
	rd	%sys_tick_cmpr,	%o2
	fpsub16s	%f27,	%f27,	%f1
	rdhpr	%htba,	%o7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x0D9, 	%hsys_tick_cmpr
	wrpr	%g5,	%g7,	%pil
	wrpr	%l1,	0x1250,	%cwp
	fmovrsgz	%o3,	%f31,	%f7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	umul	%o4,	%i5,	%o6
	wr	%l4,	0x12F1,	%set_softint
	orcc	%i3,	0x136A,	%o0
	tg	%xcc,	0x6
	rd	%ccr,	%l2
	wrpr	%o1,	0x126C,	%pil
	wr	%l3,	%i6,	%ccr
	rdhpr	%hintp,	%o5
	wr	%g4,	%g3,	%sys_tick
	fbo,a	%fcc2,	loop_201
	xorcc	%g2,	%i1,	%g1
	stw	%g6,	[%l7 + 0x1C]

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_201:
	fbuge,a	%fcc2,	loop_202
	fbug,a	%fcc0,	loop_203
	movrgez	%i4,	0x1C1,	%l5
	array8	%l0,	%i0,	%o7
loop_202:
	rdhpr	%hintp,	%o2
loop_203:
	rdpr	%cansave,	%i7
	mulx	%g7,	0x00A6,	%g5
	movge	%xcc,	%o3,	%i2
	wr	%l1,	0x00EB,	%y
	add	%i5,	%o4,	%l4
	edge16l	%i3,	%o0,	%l2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpack32	%f8,	%f4,	%f16
	wrpr	%o1,	%l3,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fmovdle	%xcc,	%f15,	%f3
	rd	%ccr,	%o6
	rdpr	%pil,	%o5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	te	%icc,	0x5
	set	0x6E, %o1
	stha	%i1,	[%l7 + %o1] 0x0c
	wr	%g4,	0x177D,	%clear_softint

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x398, 	%sys_tick_cmpr
	movrlz	%i4,	0x3DE,	%l5
	wrpr	%l6,	%i0,	%pil
	wrpr	%l0,	%o7,	%cwp
	alignaddr	%i7,	%o2,	%g7
	fmovsvs	%xcc,	%f28,	%f1
	sllx	%o3,	0x1F,	%i2
	edge16l	%l1,	%i5,	%o4
	rd	%y,	%g5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xADD, 	%hsys_tick_cmpr
	movrlz	%l2,	%o1,	%o0
	wrpr	%i6,	0x09A2,	%pil
	ldsb	[%l7 + 0x21],	%l3
	rdpr	%tl,	%o5
	fmovsge	%icc,	%f8,	%f27

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x0DD, 	%sys_tick_cmpr
        wr    %g0,    0xe,    %pcr    ! changed.
	fmuld8sux16	%f19,	%f15,	%f28
	wrpr	%g4,	0x1AB4,	%cwp
	wr	%g2,	%g1,	%pic
	rd	%softint,	%g6
	wr	%l5,	0x09D2,	%clear_softint

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	prefetch	[%l7 + 0x38],	 0x2
	wr	%g0,	0x11,	%asi
	swapa	[%l7 + 0x34] %asi,	%l6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	smul	%o2,	%g7,	%i7
	wrpr	%i2,	%o3,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xA7F, 	%hsys_tick_cmpr
	rdpr	%tl,	%g5
	rdpr	%cwp,	%i3
	rdhpr	%htba,	%l4
	movrlz	%i5,	%o1,	%l2
	wrpr	%o0,	%l3,	%tick
	wr	%o5,	%g3,	%sys_tick
	swap	[%l7 + 0x34],	%o6
	wr	%i6,	0x196B,	%pic

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xB61, 	%hsys_tick_cmpr
	rd	%ccr,	%i1
	fmovrsgez	%g1,	%f4,	%f10
	rdpr	%wstate,	%g2
	rdhpr	%htba,	%l5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x885, 	%sys_tick_cmpr
	rdpr	%tba,	%i0
	wr	%l6,	0x09F0,	%ccr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x5F2, 	%hsys_tick_cmpr
	te	%xcc,	0x5
	rdpr	%tl,	%g6
	rdhpr	%htba,	%o7
	rdhpr	%htba,	%o2
	wr	%g7,	0x060C,	%softint
	wr	%i2,	%i7,	%softint
	rdpr	%cwp,	%o3
	movrne	%o4,	0x3D9,	%l1
	rd	%sys_tick_cmpr,	%g5
	andn	%l4,	%i5,	%i3
	tsubcc	%o1,	0x1D9C,	%l2
	rd	%y,	%o0
	rd	%tick_cmpr,	%l3
	move	%icc,	%o5,	%o6
	rdpr	%canrestore,	%g3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x76B, 	%hsys_tick_cmpr
	tsubcctv	%g2,	0x03FD,	%g1
	wr	%g0,	0x80,	%asi
	sta	%f23,	[%l7 + 0x30] %asi
	wrpr	%i4,	0x18BE,	%cwp
	rdhpr	%htba,	%l5
	edge16	%i0,	%l0,	%l6
	fmovse	%xcc,	%f13,	%f24
	movg	%xcc,	%g6,	%o2
	rdpr	%cwp,	%g7
	edge16	%o7,	%i2,	%i7
	addccc	%o3,	%o4,	%l1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fmovdn	%icc,	%f30,	%f28
	rd	%sys_tick_cmpr,	%i5
	taddcctv	%g5,	%i3,	%l2
	rd	%y,	%o0
	srlx	%l3,	%o1,	%o5
	umul	%g3,	%o6,	%i1
	movg	%icc,	%i6,	%g2
	rd	%ccr,	%g4
	rdpr	%cansave,	%g1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xA54, 	%hsys_tick_cmpr
	wr	%i0,	%l0,	%clear_softint
	movneg	%xcc,	%l6,	%g6
	wrpr	%o2,	0x00D4,	%pil
	rdhpr	%hsys_tick_cmpr,	%l5
	rdhpr	%htba,	%o7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	brz	%g7,	loop_204
	rdhpr	%hintp,	%i2
	fpackfix	%f16,	%f25
	bcs	%icc,	loop_205
loop_204:
	ldstub	[%l7 + 0x3E],	%o3
	smulcc	%o4,	0x1318,	%l1
	andncc	%l4,	%i5,	%i7
loop_205:
	tg	%icc,	0x3
	wrpr	%i3,	0x0A77,	%tick
	rdpr	%cansave,	%g5
	rdhpr	%hsys_tick_cmpr,	%l2
	fnand	%f26,	%f8,	%f0
	rdpr	%tl,	%l3
	rdhpr	%hintp,	%o1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%pc,	%g3
	wr	%o6,	%o0,	%clear_softint
	rdhpr	%hintp,	%i1
	fmovrdlez	%i6,	%f14,	%f12

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xE94, 	%hsys_tick_cmpr
	rdhpr	%hpstate,	%i4
	rd	%fprs,	%i0
	rdpr	%tba,	%l0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	sdivx	%l5,	0x1037,	%o7
	fbne	%fcc1,	loop_206
	fmovsg	%icc,	%f16,	%f6
	rdhpr	%hpstate,	%g7
	wr	%o2,	%o3,	%ccr
loop_206:
	rdhpr	%hsys_tick_cmpr,	%i2
	rdpr	%cleanwin,	%l1
	wrpr	%o4,	%i5,	%tick
	rdpr	%pil,	%l4
	rd	%pc,	%i3
	movgu	%icc,	%i7,	%l2
	taddcc	%g5,	%l3,	%o5
	mulx	%g3,	0x0292,	%o6
	rdhpr	%htba,	%o1
	alignaddr	%i1,	%i6,	%g4
	wr	%o0,	0x048F,	%set_softint
	rdhpr	%hpstate,	%g1
	mulscc	%g2,	%i0,	%l0
	fbule	%fcc0,	loop_207
	bcs,a,pt	%xcc,	loop_208
	rdhpr	%hsys_tick_cmpr,	%i4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
loop_207:
	fmul8x16	%f8,	%f8,	%f0
loop_208:
	rd	%tick_cmpr,	%l5
	rdhpr	%hsys_tick_cmpr,	%o7
	lduw	[%l7 + 0x20],	%g7
	rdpr	%pil,	%l6
	rdhpr	%htba,	%o2
	fmovs	%f18,	%f7
	rdhpr	%hsys_tick_cmpr,	%i2
	orn	%o3,	%l1,	%o4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%i5,	%i7,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xCCC, 	%hsys_tick_cmpr
	fpadd16	%f28,	%f30,	%f0
	rdhpr	%htba,	%o5
	edge16ln	%g3,	%o6,	%o1
	wr	%g0,	0x0c,	%asi
	sta	%f21,	[%l7 + 0x1C] %asi
	bleu,a,pt	%xcc,	loop_209
	rdpr	%wstate,	%l2
	wrpr	%i1,	%g4,	%pil
	subcc	%i6,	%o0,	%g1
loop_209:
	xnor	%i0,	0x1A8D,	%l0
	rdhpr	%hintp,	%i4
	set	0x50, %l3
	stda	%g2,	[%l7 + %l3] 0x0c
	movg	%icc,	%l5,	%g6
	edge16l	%g7,	%l6,	%o2
	tn	%xcc,	0x0
	tne	%icc,	0x3
	fnot2	%f18,	%f28
	wr 	%g0, 	0x5, 	%fprs
	sethi	0x0680,	%o3
	rdhpr	%hsys_tick_cmpr,	%l1
	andn	%i2,	0x0115,	%o4
	wrpr	%i3,	0x0914,	%cwp
	wr	%g0,	0x89,	%asi
	stxa	%i5,	[%l7 + 0x70] %asi
	addc	%i7,	0x11F5,	%g5
	fsrc2	%f0,	%f16
	wrpr	%l3,	%o5,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x911, 	%hsys_tick_cmpr
	wr	%o1,	%l2,	%pic
	fpadd32	%f16,	%f22,	%f22
	ld	[%l7 + 0x74],	%f24
	sub	%i1,	0x0CBA,	%g3
	set	0x5C, %i3
	sta	%f3,	[%l7 + %i3] 0x18
	mulx	%i6,	0x04F6,	%g4
	rdhpr	%hsys_tick_cmpr,	%g1
	wr	%o0,	%i0,	%softint
	xorcc	%i4,	0x0E3E,	%l0
	popc	0x0194,	%l5
	rd	%fprs,	%g6
	udiv	%g2,	0x1769,	%l6
	rd	%sys_tick_cmpr,	%o2
	fands	%f5,	%f20,	%f29
	rdpr	%wstate,	%o7
	rd	%tick_cmpr,	%g7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	tle	%icc,	0x1
	rd	%tick_cmpr,	%l1
	rdhpr	%hpstate,	%o4
	tgu	%xcc,	0x7
        wr    %g0,    0xe,    %pcr    ! changed.
        wr    %g0,    0xe,    %pcr    ! changed.
	rdhpr	%hsys_tick_cmpr,	%l3
	rdpr	%cleanwin,	%i7
	fbne,a	%fcc0,	loop_210
	rdhpr	%hsys_tick_cmpr,	%l4
	movle	%icc,	%o5,	%o6
	edge8	%l2,	%o1,	%i1
loop_210:
	rd	%tick_cmpr,	%i6
	fnands	%f13,	%f21,	%f17
	sllx	%g4,	0x05,	%g1
	rdpr	%cleanwin,	%o0
	rd	%pc,	%i0
	rd	%softint,	%i4
	mulx	%g3,	0x0B82,	%l0
	subccc	%l5,	0x0896,	%g6
	wrpr	%g2,	%l6,	%tick
	rd	%tick_cmpr,	%o2
	or	%g7,	%o7,	%i2
	fpsub32s	%f27,	%f23,	%f3
	rdpr	%cleanwin,	%o3
	wr	%l1,	%i3,	%sys_tick
	wrpr	%o4,	%g5,	%tick
	brgez	%l3,	loop_211
	rdhpr	%hintp,	%i7
	rdhpr	%hsys_tick_cmpr,	%i5
	fmovdcs	%xcc,	%f19,	%f22
loop_211:
	orcc	%l4,	0x1C37,	%o6
	rdpr	%canrestore,	%l2
        wr    %g0,    0xe,    %pcr    ! changed.
	wr	%g0,	0x11,	%asi
	ldswa	[%l7 + 0x64] %asi,	%o5
	rdpr	%canrestore,	%i6
	alignaddr	%i1,	%g1,	%g4
	add	%i0,	%i4,	%g3
	rd	%pc,	%o0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x1BD, 	%hsys_tick_cmpr
	move	%icc,	%g2,	%g6
	rdhpr	%htba,	%o2
	wr	%l6,	0x1D6B,	%ccr
	rdhpr	%hsys_tick_cmpr,	%g7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x7E0, 	%hsys_tick_cmpr
	rdpr	%canrestore,	%o7
	movrgez	%o3,	%l1,	%o4
	rdhpr	%htba,	%i3
	fbue	%fcc1,	loop_212
	call	loop_213
	and	%l3,	0x00DD,	%g5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x265, 	%hsys_tick_cmpr
loop_212:
	std	%o6,	[%l7 + 0x78]
loop_213:
	rdhpr	%hpstate,	%l4
	rd	%softint,	%l2
	rdpr	%otherwin,	%o5
	fmovdcs	%xcc,	%f10,	%f17
	fnands	%f24,	%f4,	%f23
	rd	%softint,	%o1
	rdpr	%otherwin,	%i6
	wrpr	%i1,	0x11B1,	%pil
	wrpr	%g4,	%g1,	%pil
	wrpr	%i4,	%g3,	%tick
	wrpr	%o0,	0x1AA3,	%tick
	or	%i0,	0x1F16,	%l0
	nop
	setx loop_214, %l0, %l1
	jmpl %l1, %l5
	rdpr	%cwp,	%g2
	rdhpr	%hintp,	%o2
	wr	%l6,	%g7,	%y
loop_214:
	alignaddr	%g6,	%i2,	%o3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x817, 	%hsys_tick_cmpr
	fmovdg	%icc,	%f2,	%f26
	fcmpne32	%f10,	%f6,	%o7
	movrlz	%o4,	%i3,	%l3
	wrpr	%g5,	%i5,	%tick
	rdpr	%canrestore,	%i7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xA3A, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xC3E, 	%hsys_tick_cmpr
	sdivx	%o6,	0x1119,	%o1
	rd	%softint,	%i6
	rdhpr	%hintp,	%g4
	wr	%i1,	0x1C22,	%y

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	movne	%icc,	%i4,	%o0
	rdpr	%cansave,	%i0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x66F, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%g2,	%g7,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xBB6, 	%hsys_tick_cmpr
	fnot1	%f2,	%f30
	wr 	%g0, 	0x6, 	%fprs
	wrpr	%g6,	%l1,	%cwp
	rdpr	%pil,	%o4
	wrpr	%i3,	0x0C89,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%g5,	%o7,	%y

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x9DC, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xD16, 	%hsys_tick_cmpr
	wr	%l2,	0x155C,	%y
	for	%f4,	%f0,	%f14
	fmul8x16au	%f16,	%f8,	%f26
	rdhpr	%hpstate,	%o5
	wr	%i7,	%o6,	%pic
	fzeros	%f22

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x775, 	%hsys_tick_cmpr
	wrpr	%g4,	%i6,	%tick
	rdpr	%canrestore,	%g1
	rdpr	%wstate,	%i4
	taddcc	%i1,	0x19BF,	%i0
	fmuld8sux16	%f25,	%f15,	%f16
	rd	%softint,	%g3
	rdpr	%otherwin,	%o0
	wrpr	%l0,	%o2,	%pil
	alignaddrl	%g2,	%g7,	%l5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fmovdl	%xcc,	%f24,	%f5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	alignaddr	%l1,	%o4,	%i3
	rdhpr	%hintp,	%l3
	fbn	%fcc2,	loop_215
	wr	%g5,	%l6,	%clear_softint
	fmovrdgez	%i5,	%f6,	%f12
	rdhpr	%hpstate,	%o7
loop_215:
	movvs	%xcc,	%l2,	%o5
	fand	%f30,	%f28,	%f26
	rdpr	%canrestore,	%l4
	edge32l	%i7,	%o1,	%g4
	array32	%o6,	%i6,	%g1
	wr	%g0,	0x89,	%asi
	ldsha	[%l7 + 0x58] %asi,	%i1
	fmovrslez	%i0,	%f27,	%f4
	rdpr	%cleanwin,	%i4
	wr	%g3,	%l0,	%y
	rdpr	%cansave,	%o2
	rdhpr	%htba,	%g2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	wrpr	%o0,	%i2,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x54B, 	%hsys_tick_cmpr
	stx	%g6,	[%l7 + 0x30]
	udivx	%l1,	0x051B,	%o4
	rdpr	%wstate,	%i3
	fmovrsne	%l3,	%f29,	%f18
	bge,pt	%icc,	loop_216
	movneg	%xcc,	%o3,	%l6
	rdhpr	%hintp,	%i5
	taddcctv	%o7,	0x1B9B,	%l2
loop_216:
	edge16ln	%o5,	%g5,	%l4
	and	%o1,	%g4,	%i7
	fpsub32s	%f9,	%f12,	%f24

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x9EA, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%gl,	%i0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x028, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xF0F, 	%tick_cmpr
	fmovse	%xcc,	%f7,	%f31
	umul	%i4,	%l0,	%g2
	subccc	%g7,	0x0889,	%o0
	wrpr	%o2,	%i2,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x142, 	%hsys_tick_cmpr
	rdpr	%cleanwin,	%l1
	sdivx	%o4,	0x1756,	%g6
	rdpr	%cleanwin,	%l3
	ldstub	[%l7 + 0x54],	%o3
	rdhpr	%hsys_tick_cmpr,	%l6
	fnot1	%f26,	%f26

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	ldub	[%l7 + 0x53],	%i5
	rdpr	%otherwin,	%o5
	fpadd32s	%f25,	%f2,	%f19
	movn	%icc,	%l2,	%g5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	rdhpr	%hintp,	%o1
	array8	%l4,	%i7,	%i6
	fcmpeq32	%f0,	%f12,	%g1
	movne	%xcc,	%i1,	%i0
	andcc	%o6,	%g4,	%g3
	set	0x57, %o5
	stba	%l0,	[%l7 + %o5] 0x11
	tpos	%icc,	0x1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fmovsleu	%xcc,	%f24,	%f28

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	mova	%icc,	%o0,	%o2
	wrpr	%l5,	%l1,	%tick
	rdhpr	%htba,	%o4
	set	0x50, %o6
	swapa	[%l7 + %o6] 0x18,	%g6
	addcc	%l3,	0x0A17,	%i2
	rdpr	%cleanwin,	%l6
	rd	%y,	%i3
	rdhpr	%hsys_tick_cmpr,	%o3
	rdpr	%tba,	%i5
	mova	%icc,	%o5,	%l2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	orn	%l4,	0x1E3E,	%o7
	udivcc	%i7,	0x0775,	%i6
	wrpr	%i1,	0x0ECD,	%tick
	wrpr	%i0,	0x1C20,	%pil
	movle	%icc,	%o6,	%g1
	rdhpr	%hpstate,	%g3
	rd	%sys_tick_cmpr,	%l0
	tsubcc	%g2,	0x09B5,	%g7
	rdpr	%cleanwin,	%g4
	fexpand	%f15,	%f20
	rd	%fprs,	%i4
	rd	%softint,	%o0
	fmovsne	%xcc,	%f15,	%f14
	brz,a	%l5,	loop_217
	rd	%fprs,	%o2
	be,a	%icc,	loop_218
	array8	%l1,	%g6,	%o4
loop_217:
	rd	%softint,	%i2
	wr	%l6,	%l3,	%ccr
loop_218:
	movle	%xcc,	%o3,	%i5
	wrpr	%o5,	0x176D,	%cwp
	rdhpr	%hsys_tick_cmpr,	%l2
	umul	%i3,	%g5,	%l4
	set	0x0C, %l0
	ldstuba	[%l7 + %l0] 0x89,	%o1
	tge	%xcc,	0x3
	rdhpr	%htba,	%i7
	movgu	%xcc,	%i6,	%o7
	movne	%icc,	%i0,	%i1
	rdhpr	%hintp,	%o6
	ba,a,pt	%xcc,	loop_219
	tsubcctv	%g3,	0x1E94,	%g1
	addccc	%l0,	0x168E,	%g7
	wrpr	%g4,	0x0F1B,	%pil
loop_219:
	wr	%i4,	0x04D2,	%softint
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tne	%xcc,	0x7
	edge16l	%g2,	%o0,	%l5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xC46, 	%tick_cmpr
	array32	%o4,	%g6,	%l6
	wr	%l3,	0x1656,	%pic
	fba,a	%fcc3,	loop_220
	fcmpes	%fcc0,	%f5,	%f6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xE66, 	%hsys_tick_cmpr
	wrpr	%i5,	0x06FE,	%pil
loop_220:
	fbu,a	%fcc1,	loop_221
	rdpr	%otherwin,	%o5
	fmovse	%icc,	%f7,	%f17
	andn	%i3,	%l2,	%g5
loop_221:
	ld	[%l7 + 0x0C],	%f2
	tl	%icc,	0x2
	rd	%pc,	%l4
	wrpr	%i7,	0x084B,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x2C6, 	%hsys_tick_cmpr
	movre	%o7,	%o1,	%i0
	rdhpr	%htba,	%o6
	wrpr	%i1,	%g3,	%cwp
	fandnot1s	%f15,	%f7,	%f22

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x18D, 	%hsys_tick_cmpr
	edge32ln	%g1,	%g4,	%g7
	movre	%g2,	%i4,	%l5
	rd	%tick_cmpr,	%o0
	movrlez	%o2,	0x299,	%l1
	fcmps	%fcc2,	%f9,	%f29
	tge	%icc,	0x6
	fnot2s	%f15,	%f15
	wr	%g6,	0x1018,	%set_softint
	wr	%l6,	%o4,	%sys_tick
	rdpr	%gl,	%o3
	swap	[%l7 + 0x64],	%l3
	ld	[%l7 + 0x34],	%f9
	rd	%softint,	%i5
	ta	%xcc,	0x0
	ldd	[%l7 + 0x60],	%f14
	fmovrdgez	%o5,	%f12,	%f28
	rd	%pc,	%i3
	rd	%fprs,	%l2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wrpr	%i2,	%l4,	%cwp
	wrpr	%g5,	%i6,	%cwp
	movvc	%xcc,	%i7,	%o7
	edge32ln	%o1,	%i0,	%o6
	wrpr	%g3,	0x1ADA,	%pil
	umulcc	%l0,	0x040F,	%g1
	rd	%fprs,	%i1
	rdhpr	%htba,	%g4
	rdpr	%cwp,	%g2
	fbule	%fcc3,	loop_222
	wr 	%g0, 	0x5, 	%fprs
	wr	%o0,	%g7,	%clear_softint
	rdhpr	%htba,	%l1
loop_222:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tleu	%icc,	0x7
	rdhpr	%hintp,	%g6
	add	%o2,	0x0607,	%l6
	fmul8ulx16	%f24,	%f12,	%f14
	set	0x6C, %i5
	stwa	%o4,	[%l7 + %i5] 0x2b
	membar	#Sync
	tne	%xcc,	0x6
	wrpr	%o3,	0x0E4D,	%tick
	tn	%icc,	0x1
	wr	%i5,	%o5,	%clear_softint
	movcc	%icc,	%l3,	%i3
	rdpr	%cwp,	%l2
	fbl	%fcc2,	loop_223
	sub	%i2,	%g5,	%l4
	addccc	%i7,	%i6,	%o1
	rd	%sys_tick_cmpr,	%o7
loop_223:
	add	%i0,	%g3,	%o6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%cwp,	%g4
	array8	%g1,	%i4,	%l5
	edge16l	%g2,	%g7,	%l1
	wrpr	%o0,	%o2,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr 	%g0, 	0x4, 	%fprs
	sra	%o3,	%o4,	%o5
	edge8ln	%i5,	%l3,	%l2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x840, 	%hsys_tick_cmpr
	rdpr	%otherwin,	%g5
	rdpr	%canrestore,	%i2
	alignaddrl	%l4,	%i6,	%o1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	brlz	%o7,	loop_224
	rdpr	%cansave,	%i0
	rdhpr	%hpstate,	%g3
	rd	%fprs,	%l0
loop_224:
	nop
	wr	%g0,	0x89,	%asi
	lduwa	[%l7 + 0x4C] %asi,	%o6
	rdpr	%tl,	%i1
	rdhpr	%hsys_tick_cmpr,	%g4
	wrpr	%g1,	%i4,	%cwp
	fmovdvs	%xcc,	%f13,	%f6
	tleu	%icc,	0x7
	wrpr	%l5,	%g7,	%cwp
	rd	%asi,	%l1
	wr	%o0,	%g2,	%y
	tsubcctv	%l6,	0x0531,	%g6
	rdhpr	%hintp,	%o2
	fcmpes	%fcc2,	%f26,	%f10
	fnor	%f18,	%f26,	%f16
	subccc	%o4,	%o5,	%i5
	wrpr	%l3,	%l2,	%cwp
	sra	%i3,	0x09,	%o3
	prefetch	[%l7 + 0x5C],	 0x3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x66A, 	%hsys_tick_cmpr
	edge8	%i2,	%i6,	%o1
	rdhpr	%hsys_tick_cmpr,	%i7
	tcs	%xcc,	0x5
	wrpr	%o7,	0x0765,	%tick
	wr	%i0,	%l4,	%ccr
	rd	%y,	%g3
	wr 	%g0, 	0x6, 	%fprs

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fcmpeq16	%f24,	%f8,	%g1
	wr	%g0,	0x80,	%asi
	lduwa	[%l7 + 0x74] %asi,	%l5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xBE4, 	%hsys_tick_cmpr
	add	%l1,	%g7,	%g2
	edge32l	%o0,	%l6,	%g6
	fzero	%f12
	tvc	%icc,	0x2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%htba,	%o4
	fmovdpos	%xcc,	%f2,	%f26
	fcmpgt32	%f10,	%f14,	%i5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xE05, 	%hsys_tick_cmpr
	edge16n	%l2,	%o5,	%i3
	rdhpr	%hintp,	%o3
	wrpr	%g5,	%i6,	%pil
	fmul8ulx16	%f8,	%f4,	%f8
	rdpr	%pil,	%i2
	alignaddr	%o1,	%i7,	%o7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	rd	%pc,	%l4
	bn	loop_225
	fcmple32	%f4,	%f2,	%o6
	fnegs	%f30,	%f10
	move	%icc,	%g4,	%l0
loop_225:
	rdhpr	%hintp,	%i1
	rd	%asi,	%g1
	rdpr	%cansave,	%l5
	fbue	%fcc1,	loop_226
	wr	%l1,	0x199A,	%pic
	rdhpr	%hsys_tick_cmpr,	%i4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xBC9, 	%hsys_tick_cmpr
loop_226:
	rd	%asi,	%o0
	tg	%xcc,	0x5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x322, 	%hsys_tick_cmpr
	rdpr	%pil,	%g7
	rdhpr	%hintp,	%i5
	udiv	%o4,	0x08DE,	%l3
	nop
	setx	loop_227,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fbul	%fcc3,	loop_228
	brz	%o5,	loop_229
	movpos	%xcc,	%l2,	%i3
loop_227:
	subc	%g5,	%o3,	%i6
loop_228:
	fsrc2s	%f22,	%f19
loop_229:
	rdpr	%cleanwin,	%o1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%i2,	0x05D2,	%set_softint
	ldx	[%l7 + 0x58],	%o7
	wrpr	%g3,	%l4,	%cwp
	rdpr	%tl,	%i0
	fcmpgt16	%f6,	%f0,	%o6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x7FD, 	%hsys_tick_cmpr
	wrpr	%g4,	%i1,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%sys_tick_cmpr,	%g1
	wr	%l1,	%i4,	%pic
	ldsh	[%l7 + 0x36],	%o0
	wrpr	%l6,	%g6,	%pil
	rdhpr	%hpstate,	%o2
	rdpr	%tl,	%g7
	rd	%ccr,	%g2
	wr	%o4,	0x08AF,	%y
	array32	%l3,	%i5,	%o5
	rd	%softint,	%l2
	rdpr	%tba,	%i3
	mova	%icc,	%g5,	%i6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x9A3, 	%hsys_tick_cmpr
	tsubcc	%o3,	0x0EBA,	%i7
	wrpr	%i2,	%o7,	%cwp
	rdpr	%tl,	%l4
	rd	%softint,	%i0
	tpos	%xcc,	0x1
	fmovsleu	%xcc,	%f7,	%f15
	rdhpr	%htba,	%g3
	tcc	%icc,	0x4
	wrpr	%l0,	0x0DF8,	%pil
	rd	%fprs,	%g4
	add	%o6,	%i1,	%g1
	fblg,a	%fcc1,	loop_230
	rdpr	%otherwin,	%l1
	rd	%softint,	%i4
	wr	%l5,	%o0,	%pic
loop_230:
	nop
	set	0x1B, %g4
	ldstuba	[%l7 + %g4] 0x89,	%g6
	fcmpgt16	%f16,	%f18,	%l6
	fnor	%f6,	%f22,	%f26
	rdhpr	%hintp,	%o2
        wr    %g0,    0xe,    %pcr    ! changed.
	andcc	%o4,	0x0BAE,	%g2
	rd	%tick_cmpr,	%i5
	rdpr	%pil,	%l3
	edge8ln	%l2,	%o5,	%g5
	sdivcc	%i3,	0x05BB,	%o1
	wr	%o3,	%i7,	%clear_softint
	rdpr	%otherwin,	%i6
	brlez	%o7,	loop_231
	pdist	%f30,	%f12,	%f20
	bn,a	loop_232
	add	%l4,	0x0DF2,	%i0
loop_231:
	movleu	%icc,	%g3,	%i2
	rd	%tick_cmpr,	%l0
loop_232:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x3B7, 	%sys_tick_cmpr
	rd	%pc,	%g4
	rd	%pc,	%i1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fmovrdgez	%g1,	%f2,	%f26

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x7D0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	movneg	%icc,	%g6,	%o2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	bleu	loop_233
	wrpr	%g7,	%g2,	%tick
	rdhpr	%htba,	%i5
	tg	%xcc,	0x7
loop_233:
	edge8ln	%o4,	%l3,	%l2
	movl	%icc,	%o5,	%i3
	fble	%fcc0,	loop_234
	wr	%o1,	%o3,	%pic
	fpsub32	%f24,	%f22,	%f20
	wr	%g5,	%i7,	%softint
loop_234:
	subcc	%i6,	%o7,	%i0
	edge16ln	%l4,	%g3,	%i2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x4FA, 	%tick_cmpr
	andncc	%g4,	%l0,	%l1
	rd	%tick_cmpr,	%g1
	set	0x70, %l6
	ldda	[%l7 + %l6] 0x04,	%i0
	rdhpr	%hintp,	%o0
	rdhpr	%hintp,	%l5
	rdhpr	%hpstate,	%i4
        wr    %g0,    0xe,    %pcr    ! changed.
	xorcc	%l6,	%g2,	%g7
	wr	%o4,	%l3,	%ccr
	brz,a	%l2,	loop_235
	movn	%icc,	%o5,	%i5
	rdpr	%pil,	%i3
	prefetch	[%l7 + 0x38],	 0x1
loop_235:
	rdpr	%otherwin,	%o3
	wrpr	%g5,	%o1,	%pil
	addcc	%i7,	%o7,	%i0
	fandnot1s	%f1,	%f30,	%f0
	rdpr	%cleanwin,	%l4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x2D4, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	movrlz	%i2,	0x3A5,	%g4
	wrpr	%l1,	%l0,	%tick
	rd	%asi,	%i1
	edge16ln	%o0,	%l5,	%g1
	rdhpr	%htba,	%g6
	fornot1s	%f24,	%f20,	%f29
	rd	%softint,	%o2
	wr	%l6,	%i4,	%set_softint
	addccc	%g7,	0x0A75,	%o4
	wr	%l3,	0x0ADF,	%softint
	ldub	[%l7 + 0x4B],	%g2
	wrpr	%o5,	0x0ADA,	%cwp
	rdhpr	%htba,	%i5
	wrpr	%i3,	%o3,	%tick
	fsrc2s	%f19,	%f2
	sdivx	%g5,	0x0DA7,	%o1
	rdpr	%cwp,	%l2
	rdpr	%pil,	%i7
	rd	%asi,	%o7
	subc	%i0,	%l4,	%i6
	wrpr	%o6,	%g3,	%tick
	fmovrde	%g4,	%f14,	%f8
	nop
	set	0x14, %i0
	lduw	[%l7 + %i0],	%l1
	movcs	%icc,	%i2,	%l0
	rdhpr	%hpstate,	%o0
	ldd	[%l7 + 0x70],	%i0
	rd	%sys_tick_cmpr,	%l5
	tn	%xcc,	0x6
	udivcc	%g6,	0x0472,	%o2
	ble,pn	%icc,	loop_236
	fcmped	%fcc2,	%f16,	%f8
	rdpr	%otherwin,	%l6
	fbu	%fcc2,	loop_237
loop_236:
	wr	%g1,	%g7,	%softint
        wr    %g0,    0xe,    %pcr    ! changed.
	rdpr	%cansave,	%l3
loop_237:
	rdpr	%canrestore,	%o4
	rd	%softint,	%o5
	xorcc	%i5,	0x165F,	%g2
	rdhpr	%htba,	%o3
	rd	%pc,	%i3
	rdhpr	%hintp,	%g5
	andn	%l2,	0x1886,	%i7
	edge8l	%o1,	%i0,	%o7
	smul	%l4,	0x1832,	%i6
	rdpr	%cansave,	%o6
	nop
	setx loop_238, %l0, %l1
	jmpl %l1, %g4
	wr	%g3,	0x1DD3,	%sys_tick
	srax	%l1,	%l0,	%o0
	sdivcc	%i2,	0x0D41,	%l5
loop_238:
	rd	%softint,	%g6
	pdist	%f30,	%f6,	%f4
	rd	%asi,	%i1
	rd	%pc,	%l6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	rd	%softint,	%g1
	rdpr	%tba,	%i4
	rd	%ccr,	%g7
	tn	%xcc,	0x6
	wr	%l3,	%o5,	%pic
	tvc	%xcc,	0x5
	rdpr	%cwp,	%i5
	wrpr	%g2,	%o4,	%tick
	rdpr	%otherwin,	%i3
	wr	%o3,	%l2,	%sys_tick
	fxors	%f15,	%f13,	%f7
	tne	%xcc,	0x4
	edge8ln	%g5,	%o1,	%i0
	rd	%sys_tick_cmpr,	%o7
	wrpr	%i7,	0x1B4B,	%pil
	rdpr	%otherwin,	%l4
	wr	%i6,	0x1426,	%clear_softint
	edge32n	%g4,	%o6,	%l1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	rdhpr	%hpstate,	%l0
	wrpr	%g3,	0x1BA4,	%pil
	rdpr	%tba,	%i2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xE3D, 	%hsys_tick_cmpr
	movgu	%xcc,	%l5,	%i1
	membar	0x72
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mulscc	%g6,	0x1FC8,	%l6
	rdpr	%canrestore,	%g1
	edge16l	%i4,	%g7,	%l3
	rd	%softint,	%o5
	rd	%fprs,	%i5
	smul	%o2,	0x1077,	%g2
	set	0x54, %l4
	lda	[%l7 + %l4] 0x0c,	%f27
	fandnot1s	%f28,	%f8,	%f11
	rdhpr	%hpstate,	%i3
	fbu	%fcc1,	loop_239
	wr	%o3,	%l2,	%pic
	rd	%fprs,	%o4
	wr	%o1,	%g5,	%sys_tick
loop_239:
	rdhpr	%hsys_tick_cmpr,	%i0
	wrpr	%o7,	0x04F2,	%tick
        wr    %g0,    0xe,    %pcr    ! changed.
	tcs	%xcc,	0x5
	wr 	%g0, 	0x5, 	%fprs
	movrlz	%g4,	%l1,	%l0
	rdpr	%cwp,	%g3
	rdpr	%cwp,	%i2
	rdpr	%wstate,	%o0
	fpackfix	%f10,	%f30
	fandnot2s	%f22,	%f11,	%f25
	wrpr	%l5,	0x1E28,	%pil
        wr    %g0,    0xe,    %pcr    ! changed.
	rdpr	%tba,	%i1
	wr 	%g0, 	0x5, 	%fprs
	rdhpr	%hpstate,	%l6
	wr	%i4,	%g1,	%y
	edge8n	%l3,	%g7,	%i5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	xnor	%g2,	%o5,	%o3
	rdpr	%pil,	%l2
	rd	%fprs,	%o4
	rdhpr	%hintp,	%i3
	rdpr	%otherwin,	%o1
	set	0x6D, %g1
	stba	%i0,	[%l7 + %g1] 0x15
	rdpr	%tl,	%g5
	movl	%icc,	%o7,	%i7
	set	0x20, %o4
	ldda	[%l7 + %o4] 0x11,	%l4
	rdpr	%otherwin,	%g4
	rdhpr	%hsys_tick_cmpr,	%l1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%i6,	0x0E9E,	%cwp
        wr    %g0,    0xe,    %pcr    ! changed.
	rdpr	%tl,	%o0
	rdpr	%otherwin,	%l5
	wr	%i1,	%g6,	%set_softint
	wr	%l6,	0x0C18,	%clear_softint
	subc	%i4,	%g1,	%o6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	edge32n	%i5,	%g7,	%o2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	movvs	%icc,	%l2,	%o4
	nop
	set	0x30, %l2
	stx	%o3,	[%l7 + %l2]
	rdpr	%tba,	%i3
	fmovscc	%icc,	%f27,	%f10
	wr	%o1,	0x1BB8,	%softint
	fnot1s	%f11,	%f16

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	set	0x20, %g2
	stda	%i6,	[%l7 + %g2] 0x80
	rdhpr	%hsys_tick_cmpr,	%o7
	rd	%tick_cmpr,	%l4
	addccc	%g4,	0x1873,	%l1
	fands	%f4,	%f24,	%f1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	swap	[%l7 + 0x74],	%i2
	wr	%l0,	0x1600,	%pic
	rd	%asi,	%g3
	rdhpr	%hpstate,	%l5
	wr	%i1,	%g6,	%ccr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x289, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x047, 	%hsys_tick_cmpr
	movgu	%xcc,	%g1,	%o6
	wr	%l3,	%i5,	%ccr
	fmul8x16al	%f8,	%f18,	%f8
	wrpr	%i4,	%g7,	%pil
	tgu	%xcc,	0x4
	fmovsg	%icc,	%f14,	%f12
	wr	%g2,	0x1023,	%ccr
	rdpr	%cansave,	%o5
	wrpr	%o2,	0x0260,	%tick
	andn	%l2,	%o4,	%i3
	wr	%o1,	0x0C83,	%set_softint
	rd	%tick_cmpr,	%o3
	mulx	%g5,	0x09FD,	%i0
	tpos	%xcc,	0x2
	tcs	%xcc,	0x4
	wrpr	%o7,	0x1096,	%pil
	brlez	%l4,	loop_240
	movleu	%icc,	%i7,	%l1
	rd	%fprs,	%i6
	te	%icc,	0x1
loop_240:
	smulcc	%g4,	%l0,	%g3
	andn	%i2,	%l5,	%i1
	sth	%g6,	[%l7 + 0x7E]
	wr	%g0,	0x10,	%asi
	swapa	[%l7 + 0x1C] %asi,	%o0
	wrpr	%l6,	%g1,	%pil
	flush	%l7 + 0x6C
	fmuld8ulx16	%f29,	%f26,	%f2
	rdpr	%gl,	%o6
	wr	%l3,	0x015D,	%clear_softint
	move	%icc,	%i5,	%g7
	rdpr	%cansave,	%i4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x414, 	%hsys_tick_cmpr
	bne,pn	%xcc,	loop_241
	movn	%xcc,	%l2,	%o2
	rdpr	%cwp,	%o4
	rdpr	%cansave,	%i3
loop_241:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xE00, 	%hsys_tick_cmpr
	rdpr	%otherwin,	%o3
	alignaddr	%g5,	%i0,	%o7
	edge8l	%i7,	%l4,	%l1
	wrpr	%i6,	0x06C2,	%tick
	edge8ln	%l0,	%g4,	%g3
	rdhpr	%htba,	%l5
	tn	%icc,	0x3
	rd	%softint,	%i1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x569, 	%hsys_tick_cmpr
	rdhpr	%hsys_tick_cmpr,	%g6
	rdpr	%gl,	%l6
	wrpr	%g1,	0x18A4,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xFA9, 	%tick_cmpr
	rdhpr	%hintp,	%l3
	wrpr	%g7,	0x1695,	%tick
	movrlez	%i4,	%g2,	%o5
	rd	%ccr,	%i5
	std	%f20,	[%l7 + 0x10]

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%cleanwin,	%l2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%o4,	%o1,	%sys_tick
	rdhpr	%hintp,	%g5
	rdpr	%tl,	%o3
	movleu	%icc,	%i0,	%i7
	rdpr	%otherwin,	%l4
	rdhpr	%hpstate,	%o7
	wrpr	%i6,	0x11B7,	%tick
	wrpr	%l1,	%g4,	%pil
	fmovrse	%l0,	%f17,	%f11
	sll	%g3,	0x0D,	%i1
	movrlz	%l5,	0x2A8,	%i2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x534, 	%hsys_tick_cmpr
	fmovdl	%xcc,	%f0,	%f23
	wrpr	%o0,	0x0A56,	%pil
	rdpr	%cansave,	%l6
	wrpr	%g1,	0x1E8B,	%cwp
	wrpr	%l3,	0x048B,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x65B, 	%tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xB0E, 	%sys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xBB5, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xADA, 	%hsys_tick_cmpr
	fcmpeq32	%f10,	%f6,	%l2
	wr	%i3,	%o2,	%y
	set	0x40, %i6
	stda	%f0,	[%l7 + %i6] 0x18
	wr	%o4,	0x11BD,	%clear_softint
	wr	%g0,	0x89,	%asi
	stda	%o0,	[%l7 + 0x58] %asi
	fmovsleu	%xcc,	%f2,	%f15
	rdhpr	%htba,	%o3
	array16	%g5,	%i0,	%l4
	rdpr	%cleanwin,	%i7
	tle	%icc,	0x2
	wr	%o7,	%l1,	%softint
	bl	%xcc,	loop_242
	fmul8x16au	%f24,	%f9,	%f0
	fmovsle	%icc,	%f31,	%f9
	wr	%i6,	%g4,	%softint
loop_242:
	ldstub	[%l7 + 0x36],	%g3
	rdpr	%wstate,	%l0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbne,a	%fcc0,	loop_243
	fxnor	%f12,	%f14,	%f22
	rdpr	%pil,	%i1
	rd	%tick_cmpr,	%l5
loop_243:
	tvc	%xcc,	0x6
	rdhpr	%hpstate,	%i2
	rdpr	%cwp,	%g6
	stbar
	wr	%l6,	0x035D,	%y
	xnorcc	%g1,	%o0,	%l3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	be	loop_244
	bpos	loop_245
	rd	%ccr,	%g2
	sir	0x1FBC
loop_244:
	brlez,a	%o6,	loop_246
loop_245:
	rdpr	%gl,	%o5
	rd	%softint,	%l2
	wr	%g0,	0x89,	%asi
	ldda	[%l7 + 0x70] %asi,	%i4
loop_246:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%g5,	0x08DE,	%pil
	movneg	%icc,	%o3,	%i0
	fmovrdlez	%l4,	%f12,	%f8
	wr	%i7,	%l1,	%softint
	rd	%pc,	%i6
	tl	%icc,	0x5
	wr	%o7,	0x0186,	%ccr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%y,	%g3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x995, 	%tick_cmpr
	tvc	%icc,	0x1
	movneg	%icc,	%i1,	%g6
	movre	%i2,	%l6,	%o0
	orncc	%l3,	%g1,	%i4
	rdhpr	%hsys_tick_cmpr,	%g2
	movrgez	%o6,	0x200,	%o5
	rd	%asi,	%g7
	rd	%ccr,	%i5
	rdhpr	%hintp,	%l2
	bvs,pt	%xcc,	loop_247
	wrpr	%o4,	%o2,	%cwp
	xorcc	%i3,	%g5,	%o1
	bvc,a,pt	%icc,	loop_248
loop_247:
	membar	0x2C
	rdhpr	%hintp,	%i0
	edge16ln	%l4,	%o3,	%l1
loop_248:
	array16	%i6,	%o7,	%g4
	wrpr	%i7,	0x0EBC,	%cwp
	stb	%g3,	[%l7 + 0x43]
	wrpr	%l5,	%i1,	%cwp
	srlx	%l0,	0x19,	%i2
	wr	%g6,	0x1D82,	%set_softint
	bleu,a,pt	%icc,	loop_249
	or	%o0,	%l6,	%l3
	subc	%g1,	0x1469,	%i4
	addcc	%o6,	0x1111,	%g2
loop_249:
	rd	%softint,	%g7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x2DF, 	%hsys_tick_cmpr
	sdiv	%l2,	0x04A8,	%o4
	rd	%ccr,	%i3
	bg,pn	%icc,	loop_250
	mova	%xcc,	%o2,	%o1
	rdhpr	%htba,	%g5
	wr	%i0,	0x12DF,	%softint
loop_250:
	wr 	%g0, 	0x5, 	%fprs
	fbge,a	%fcc0,	loop_251
	wr	%i6,	0x1E02,	%clear_softint
	set	0x48, %g6
	stha	%o7,	[%l7 + %g6] 0x10
loop_251:
	rd	%softint,	%g4
	wrpr	%o3,	%g3,	%tick
	wrpr	%i7,	0x0536,	%cwp
	rdhpr	%hsys_tick_cmpr,	%i1
	rdpr	%canrestore,	%l5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%softint,	%g6
	fbo,a	%fcc2,	loop_252
	stx	%o0,	[%l7 + 0x20]
	rdpr	%otherwin,	%l6
	andcc	%l3,	%g1,	%i4
loop_252:
	nop
	set	0x6A, %g7
	lduha	[%l7 + %g7] 0x14,	%i2
	rdhpr	%hsys_tick_cmpr,	%o6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x513, 	%hsys_tick_cmpr
	tn	%icc,	0x3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x49A, 	%hsys_tick_cmpr
	rdhpr	%hintp,	%o5
	rd	%ccr,	%i3
	movvc	%icc,	%o2,	%o1
	fsrc2	%f8,	%f12
	fmovsl	%xcc,	%f3,	%f4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x25E, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	sllx	%i6,	%o7,	%o3
	alignaddr	%g4,	%g3,	%i7
	edge32n	%l5,	%l0,	%g6
	addcc	%i1,	%o0,	%l3
	edge8l	%g1,	%i4,	%l6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xF0C, 	%hsys_tick_cmpr
	rdhpr	%hpstate,	%o6
	fcmple32	%f22,	%f30,	%i5
	rdpr	%pil,	%g2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xE5B, 	%hsys_tick_cmpr
	tvc	%xcc,	0x2
	rdpr	%cansave,	%o5
	wrpr	%o4,	0x161D,	%tick
	orn	%i3,	%o1,	%g5
	bvc,pn	%icc,	loop_253
	fpsub16s	%f11,	%f16,	%f27
	wr	%l4,	%o2,	%set_softint

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
loop_253:
	wr	%i0,	%i6,	%clear_softint
	subccc	%o3,	0x1149,	%g4
	or	%o7,	0x0876,	%i7
	popc	%g3,	%l5
	rdhpr	%hintp,	%g6
	sll	%i1,	0x1B,	%l0
	fmovd	%f30,	%f4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%g1,	0x08F8,	%tick
	rdpr	%canrestore,	%i4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%ccr,	%i2
	move	%xcc,	%g7,	%o6
	rd	%pc,	%g2
	fmovscs	%xcc,	%f30,	%f29
	rdhpr	%hintp,	%l2
	rd	%fprs,	%i5
	wrpr	%o4,	0x187F,	%tick
	wrpr	%i3,	%o1,	%cwp
	wrpr	%o5,	%l4,	%pil
	wrpr	%g5,	0x0DE0,	%tick
	wr	%o2,	0x1847,	%ccr
	rdpr	%tba,	%l1
	wrpr	%i6,	%i0,	%cwp
	srl	%g4,	%o3,	%o7
	wr	%g3,	%l5,	%softint
	fbu,a	%fcc2,	loop_254
	wrpr	%g6,	%i1,	%tick
	andcc	%l0,	0x0752,	%l3
	srl	%i7,	%g1,	%o0
loop_254:
	wrpr	%i4,	%i2,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x4F4, 	%hsys_tick_cmpr
	edge16n	%l6,	%g2,	%l2
	rd	%softint,	%i5
	sethi	0x0465,	%o4
	movvs	%xcc,	%i3,	%o6
	edge8l	%o5,	%l4,	%o1
	rd	%tick_cmpr,	%o2
	wr	%l1,	%i6,	%clear_softint
	rdpr	%cansave,	%g5
	movpos	%xcc,	%g4,	%o3
	movre	%i0,	%g3,	%l5
	xnorcc	%o7,	0x0472,	%g6
	fmovda	%xcc,	%f0,	%f28
	ldsb	[%l7 + 0x79],	%l0
	fmovsn	%icc,	%f5,	%f17
	rd	%pc,	%i1
	or	%l3,	%g1,	%i7
	rdpr	%cwp,	%i4
	sra	%o0,	0x1A,	%i2
	udiv	%l6,	0x09E0,	%g7
	movle	%icc,	%l2,	%i5
	wrpr	%g2,	0x1E79,	%tick
	wrpr	%o4,	0x0CC0,	%pil
	rdhpr	%hintp,	%o6
	wrpr	%i3,	%l4,	%tick
	sir	0x0F67
	rdhpr	%hpstate,	%o1
	fandnot1s	%f28,	%f3,	%f22
	fcmpgt32	%f8,	%f16,	%o2
	tg	%icc,	0x2
	taddcctv	%o5,	%i6,	%g5
	wrpr	%g4,	0x07C7,	%tick
	fmovda	%icc,	%f25,	%f13
	xnorcc	%l1,	%i0,	%g3
	stx	%o3,	[%l7 + 0x38]
	edge32ln	%o7,	%l5,	%g6
	sdivx	%l0,	0x1943,	%l3
	subc	%i1,	0x1091,	%i7
	rd	%softint,	%g1
	wrpr	%i4,	0x05DD,	%cwp
	wr 	%g0, 	0x5, 	%fprs
	wr	%g7,	0x19F6,	%clear_softint
	rdpr	%tl,	%l6
	rdpr	%canrestore,	%l2
	taddcc	%g2,	0x06A1,	%i5
	wrpr	%o4,	%i3,	%cwp
	rd	%sys_tick_cmpr,	%l4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x57A, 	%hsys_tick_cmpr
	rdpr	%canrestore,	%o5
	ldub	[%l7 + 0x21],	%i6
	wr	%g5,	0x1EE4,	%pic
	rd	%sys_tick_cmpr,	%g4
	rdpr	%tl,	%l1
	bgu,pn	%xcc,	loop_255
	fandnot2	%f2,	%f0,	%f10

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x134, 	%hsys_tick_cmpr
	srl	%g3,	%i0,	%o7
loop_255:
	rdpr	%gl,	%l5
	bge,a	loop_256
	wrpr	%g6,	0x1176,	%tick
	wr	%g0,	0x81,	%asi
	ldsha	[%l7 + 0x58] %asi,	%o3
loop_256:
	tg	%xcc,	0x7
	wrpr	%l0,	0x0D7E,	%tick
	rdhpr	%htba,	%l3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x53E, 	%hsys_tick_cmpr
	rd	%pc,	%i4
	ldsw	[%l7 + 0x40],	%o0
	rdhpr	%hintp,	%i2
	move	%icc,	%g1,	%g7
	fmul8x16	%f25,	%f24,	%f26
	rdhpr	%hpstate,	%l2
	tpos	%xcc,	0x7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x8A1, 	%hsys_tick_cmpr
	rdpr	%canrestore,	%o4
	wrpr	%i5,	0x0FF7,	%pil
	rdhpr	%htba,	%i3
	rdhpr	%hpstate,	%o1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	rdpr	%wstate,	%l4
	wrpr	%o5,	%i6,	%pil
	movrlz	%o6,	%g4,	%l1
	tsubcctv	%o2,	0x1D86,	%g5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x4A7, 	%tick_cmpr
	alignaddr	%g3,	%o7,	%g6
	wrpr	%l5,	%o3,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x06B, 	%hsys_tick_cmpr
	rd	%pc,	%i7
	ldd	[%l7 + 0x70],	%f30
	rdhpr	%htba,	%i4
	rd	%asi,	%i1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xB7D, 	%hsys_tick_cmpr
	rd	%pc,	%g7
	rdhpr	%hpstate,	%l2
	wr	%g2,	%l6,	%softint
	wrpr	%o4,	0x14AB,	%pil
	wrpr	%i2,	0x113F,	%tick
	wr	%i3,	%o1,	%y
	wrpr	%i5,	%l4,	%tick
	rdpr	%tl,	%o5
	rdhpr	%htba,	%i6
	tvc	%xcc,	0x0
	fcmpeq16	%f2,	%f26,	%g4
	andcc	%o6,	0x0744,	%o2
	faligndata	%f0,	%f10,	%f14
	tneg	%icc,	0x3
	rdpr	%tba,	%g5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	popc	%l1,	%g3
	rdhpr	%hintp,	%g6
	fnor	%f8,	%f2,	%f16
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbule	%fcc1,	loop_257
	rdhpr	%hintp,	%o7
	rd	%softint,	%l5
	rd	%asi,	%o3
loop_257:
	fbu	%fcc3,	loop_258
	rd	%asi,	%l0
	edge16	%l3,	%i4,	%i1
	edge32	%i7,	%o0,	%g1
loop_258:
	wrpr	%l2,	0x0DAC,	%cwp
	wrpr	%g2,	0x12F8,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%g0,	0x19,	%asi
	stha	%o4,	[%l7 + 0x10] %asi
	movleu	%xcc,	%i2,	%i3
        wr    %g0,    0xe,    %pcr    ! changed.
	rdhpr	%hintp,	%i5
	movneg	%icc,	%l4,	%i6
	set	0x7C, %l5
	sta	%f24,	[%l7 + %l5] 0x14
	rdpr	%canrestore,	%o5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	rdhpr	%hpstate,	%o2
	wrpr	%g5,	%i0,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xA3F, 	%hsys_tick_cmpr
	fbo	%fcc3,	loop_259
	wrpr	%g3,	%o7,	%tick
	rd	%fprs,	%l5
	fbn,a	%fcc3,	loop_260
loop_259:
	subc	%g6,	0x17E6,	%o3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	movcs	%xcc,	%l0,	%i1
loop_260:
	rdpr	%pil,	%i7
	wrpr	%o0,	0x115C,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
        wr    %g0,    0xe,    %pcr    ! changed.
	fbo	%fcc2,	loop_261
	rd	%softint,	%l6
	wrpr	%l2,	0x0CDF,	%tick
	fbo,a	%fcc2,	loop_262
loop_261:
	popc	%o4,	%i2
	set	0x48, %i2
	ldswa	[%l7 + %i2] 0x11,	%g7
loop_262:
	fnegd	%f20,	%f24
	wrpr	%o1,	0x1834,	%cwp
	movl	%icc,	%i5,	%l4
	andncc	%i3,	%i6,	%o5
	rdhpr	%hsys_tick_cmpr,	%g4
	fbe,a	%fcc2,	loop_263
	tgu	%icc,	0x1
	movvs	%icc,	%g5,	%o2
	wr	%l1,	0x1EAE,	%clear_softint
loop_263:
	edge16ln	%i0,	%o6,	%g3
	rd	%tick_cmpr,	%o7
	addc	%l5,	0x14EB,	%o3
	edge32l	%l3,	%l0,	%i1
	rdpr	%otherwin,	%i7
	rdpr	%tba,	%g6
	sdiv	%g1,	0x02BE,	%o0
	rd	%asi,	%g2
	set	0x50, %o0
	lduha	[%l7 + %o0] 0x11,	%i4
	fcmpne16	%f22,	%f30,	%l2
	fbn	%fcc1,	loop_264
	wr	%l6,	0x1965,	%ccr
	rdpr	%canrestore,	%i2
	bleu,pn	%xcc,	loop_265
loop_264:
	wr	%g7,	%o4,	%set_softint
	rd	%pc,	%i5
	fornot1	%f24,	%f22,	%f10
loop_265:
	rdhpr	%hpstate,	%l4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xD4E, 	%hsys_tick_cmpr
	wr 	%g0, 	0x4, 	%fprs
	wr	%g5,	%o2,	%pic
	movn	%icc,	%l1,	%i0
	rdhpr	%hsys_tick_cmpr,	%g4
	rdpr	%cwp,	%o6
	rdhpr	%htba,	%o7
	wr	%l5,	0x0A0C,	%y
	tcs	%icc,	0x7
	ldx	[%l7 + 0x10],	%o3
	rd	%ccr,	%l3
	rdhpr	%hsys_tick_cmpr,	%l0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xC1E, 	%hsys_tick_cmpr
	movleu	%icc,	%i7,	%g6
	wrpr	%o0,	0x0C9F,	%tick
	rdpr	%wstate,	%g1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x806, 	%sys_tick_cmpr
	fpadd16	%f28,	%f30,	%f12
	bvs,a	%xcc,	loop_266
	fmovs	%f20,	%f11
	orcc	%l2,	0x0339,	%l6
	rdpr	%otherwin,	%i4
loop_266:
	wrpr	%i2,	0x13C8,	%pil
	rdhpr	%hsys_tick_cmpr,	%o4
	rd	%asi,	%g7
	rdpr	%tl,	%i5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x65C, 	%hsys_tick_cmpr
	rd	%pc,	%o5
	rdpr	%otherwin,	%l4
	rdhpr	%htba,	%o1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%i0,	%g4,	%clear_softint
	bcc,pt	%xcc,	loop_267
        wr    %g0,    0xe,    %pcr    ! changed.
	wrpr	%g5,	%o3,	%cwp
	wrpr	%l3,	%l5,	%pil
loop_267:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x643, 	%hsys_tick_cmpr
	array32	%o0,	%g6,	%g1
	sdivx	%l2,	0x01A5,	%g2
	wrpr	%i4,	%l6,	%cwp
	wrpr	%o4,	0x0B77,	%cwp
	movle	%xcc,	%g7,	%i5
	wrpr	%i3,	%i6,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x9F0, 	%hsys_tick_cmpr
	wr	%o5,	0x16E6,	%set_softint
	rdhpr	%hpstate,	%o2
	rd	%pc,	%l1
	rdhpr	%hsys_tick_cmpr,	%i0
	fbg	%fcc2,	loop_268
	edge8	%o1,	%g4,	%o7
	rd	%asi,	%o6
	rdhpr	%htba,	%o3
loop_268:
	edge32ln	%g5,	%l3,	%l0
	rd	%fprs,	%i1
	fmuld8sux16	%f20,	%f22,	%f22
	wr	%i7,	0x1709,	%pic
	andncc	%g3,	%o0,	%l5
	andn	%g1,	0x0086,	%l2
	tle	%icc,	0x1
	fmovsle	%icc,	%f29,	%f25
	xnor	%g6,	%i4,	%g2
	tneg	%xcc,	0x6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	rdpr	%cansave,	%i5
	rdhpr	%hsys_tick_cmpr,	%o4
	rdpr	%wstate,	%i6
	fmul8x16au	%f18,	%f4,	%f24
	wr	%i2,	0x149A,	%clear_softint
        wr    %g0,    0xe,    %pcr    ! changed.
	movvs	%xcc,	%o5,	%l4
	wrpr	%l1,	%i0,	%tick
	rdpr	%cansave,	%o1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xDFF, 	%hsys_tick_cmpr
	rdhpr	%hintp,	%o6
	rdhpr	%hsys_tick_cmpr,	%o7
	srax	%o3,	0x18,	%g5
	udivx	%l3,	0x1199,	%l0
	fpsub16	%f28,	%f0,	%f30
	udivcc	%i7,	0x0245,	%g3
	rdpr	%cansave,	%o0
	wrpr	%l5,	%i1,	%pil
	udiv	%g1,	0x06DE,	%g6
	wr	%i4,	%g2,	%clear_softint
	rdhpr	%htba,	%l6
	rdhpr	%hintp,	%g7
	rdpr	%cleanwin,	%l2
	rd	%sys_tick_cmpr,	%o4
	wr	%i5,	%i2,	%sys_tick
	rdpr	%cwp,	%i6
	fbn,a	%fcc3,	loop_269
	rd	%fprs,	%i3
	subcc	%o5,	0x1F55,	%l4
	movrne	%i0,	0x2B5,	%o1
loop_269:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x41E, 	%hsys_tick_cmpr
	rd	%ccr,	%g4
	rdpr	%cansave,	%o2
	ble,pt	%xcc,	loop_270
	movcc	%xcc,	%o7,	%o3
	rdhpr	%hintp,	%o6
	fornot1s	%f28,	%f19,	%f23
loop_270:
	tne	%icc,	0x5
	edge16l	%l3,	%l0,	%g5
	rdhpr	%hintp,	%g3
	rdhpr	%hsys_tick_cmpr,	%o0
	fmovspos	%xcc,	%f3,	%f30
	array8	%i7,	%l5,	%g1
	tcs	%icc,	0x7
	subccc	%g6,	0x0451,	%i1
	be,a,pn	%icc,	loop_271
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	rdpr	%cwp,	%g2
	te	%icc,	0x2
loop_271:
	rdhpr	%hsys_tick_cmpr,	%i4
	edge16ln	%l6,	%g7,	%o4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xECF, 	%hsys_tick_cmpr
	rdpr	%cansave,	%l2
	wrpr	%i2,	0x0561,	%pil
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	rdpr	%cwp,	%i3
	wr	%o5,	0x155F,	%pic
	swap	[%l7 + 0x18],	%i6
	edge16	%l4,	%i0,	%l1
	fcmpeq32	%f22,	%f30,	%g4
	rdhpr	%hintp,	%o2
	rd	%pc,	%o7
	rd	%y,	%o1
	wr	%o6,	%l3,	%ccr
	rdhpr	%hpstate,	%l0
	wrpr	%g5,	0x0707,	%tick
	wr	%g0,	0xe2,	%asi
	stxa	%g3,	[%l7 + 0x18] %asi
	membar	#Sync
	mulscc	%o3,	0x1D27,	%i7
	rdpr	%cleanwin,	%o0
	ldsb	[%l7 + 0x3D],	%l5
	wrpr	%g6,	%i1,	%pil
	wr	%g0,	0x80,	%asi
	lduha	[%l7 + 0x22] %asi,	%g1
	bcc,a,pn	%xcc,	loop_272
	wrpr	%i4,	%g2,	%pil
	rdhpr	%hsys_tick_cmpr,	%l6
	mova	%xcc,	%o4,	%i5
loop_272:
	wr	%l2,	%g7,	%softint
	fzeros	%f19
	rd	%asi,	%i3
	movvc	%xcc,	%o5,	%i2
	rd	%y,	%i6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	wr	%g4,	%o2,	%clear_softint
	sll	%o7,	%o1,	%o6
	fors	%f23,	%f26,	%f10
	set	0x60, %g3
	stxa	%l3,	[%l7 + %g3] 0x80
	wr	%l1,	0x0C03,	%set_softint
	wrpr	%l0,	0x0F50,	%pil
	edge32n	%g5,	%o3,	%i7
	movneg	%icc,	%g3,	%o0
	fsrc2s	%f29,	%f16
	rdhpr	%hpstate,	%g6
	andn	%i1,	%l5,	%g1
        wr    %g0,    0xe,    %pcr    ! changed.

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	ble,pt	%icc,	loop_273
	tsubcc	%i5,	0x04E7,	%l2
	fnors	%f17,	%f28,	%f6
	rdpr	%gl,	%g7
loop_273:
	fcmpeq16	%f6,	%f0,	%i3
	fbuge	%fcc0,	loop_274
	wrpr	%o5,	0x1AF5,	%cwp
	wr 	%g0, 	0x4, 	%fprs
	wrpr	%l4,	%i0,	%pil
loop_274:
	fandnot2s	%f8,	%f27,	%f20
	wrpr	%i2,	%g4,	%pil
	bpos	%xcc,	loop_275
	rdhpr	%htba,	%o2
	rd	%softint,	%o1
	wrpr	%o6,	0x1B31,	%pil
loop_275:
	fmovrsne	%o7,	%f26,	%f21
	wrpr	%l3,	%l1,	%cwp
        wr    %g0,    0xe,    %pcr    ! changed.
	rdhpr	%htba,	%i7
	alignaddr	%g3,	%o3,	%g6
	taddcc	%o0,	0x08A7,	%l5
	fmovrdlz	%g1,	%f24,	%f28
	udiv	%g2,	0x13A5,	%i4
	wrpr	%i1,	0x03BB,	%cwp
	xor	%l6,	0x1BD2,	%i5
	wrpr	%l2,	0x0B9C,	%pil
	rd	%tick_cmpr,	%g7
	rdhpr	%hintp,	%o4
	edge8n	%i3,	%i6,	%o5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fmovdn	%xcc,	%f11,	%f11
	tle	%icc,	0x2
	rdhpr	%hpstate,	%l4
	wrpr	%g4,	0x0D03,	%tick
	tgu	%icc,	0x7
	rdhpr	%hsys_tick_cmpr,	%o2
	fpsub32s	%f19,	%f8,	%f29
	tvs	%icc,	0x6
	fcmpeq16	%f14,	%f12,	%o1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	movpos	%icc,	%l3,	%o7
	tgu	%icc,	0x4
	rdhpr	%hsys_tick_cmpr,	%l0
	wr	%g5,	%i7,	%y
	movrlez	%l1,	%g3,	%o3
	subcc	%o0,	%g6,	%l5
	taddcc	%g1,	0x15A5,	%i4
	rdhpr	%hsys_tick_cmpr,	%g2
	stw	%i1,	[%l7 + 0x64]
	rdhpr	%hsys_tick_cmpr,	%i5
	ldx	[%l7 + 0x70],	%l6
	wr	%g7,	%l2,	%sys_tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	srl	%i3,	%o5,	%i6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x4A5, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x604, 	%hsys_tick_cmpr
	wrpr	%i0,	0x1C9B,	%cwp
	rdpr	%otherwin,	%o6
	bg,pt	%xcc,	loop_276
	bshuffle	%f16,	%f6,	%f8
	rdpr	%cleanwin,	%l3
	rdhpr	%htba,	%l0
loop_276:
	rd	%softint,	%o7
	fmovsg	%xcc,	%f6,	%f13
	movvc	%icc,	%g5,	%l1
	andn	%g3,	%i7,	%o0
	sdivcc	%g6,	0x1454,	%o3
	orn	%l5,	0x0840,	%i4
	rdhpr	%hsys_tick_cmpr,	%g1
	rd	%ccr,	%i1
	subccc	%g2,	0x0495,	%i5
	rdhpr	%htba,	%g7
	fnot1s	%f24,	%f22
	rd	%sys_tick_cmpr,	%l2
	fmovsg	%xcc,	%f19,	%f27
	rdpr	%tba,	%l6
	movrgez	%i3,	0x3C0,	%o5
	wr 	%g0, 	0x5, 	%fprs
	tsubcc	%l4,	0x08CB,	%i2
	nop
	set	0x20, %o2
	ldd	[%l7 + %o2],	%f12
	fmovsle	%xcc,	%f3,	%f25
	fxors	%f19,	%f8,	%f3
	ldsh	[%l7 + 0x74],	%g4
	rdpr	%pil,	%o1
	wrpr	%i0,	%o6,	%cwp
	brz,a	%o2,	loop_277
	wrpr	%l0,	%l3,	%pil
	orncc	%g5,	%o7,	%l1
	rdhpr	%hpstate,	%g3
loop_277:
	rdpr	%cansave,	%i7
	sub	%g6,	%o0,	%l5
	taddcc	%o3,	%g1,	%i1
	wr	%g2,	0x1C85,	%clear_softint
	rdhpr	%htba,	%i5
	wr	%g0,	0x19,	%asi
	lduba	[%l7 + 0x71] %asi,	%g7
	rd	%sys_tick_cmpr,	%l2
	fmovspos	%xcc,	%f0,	%f12

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x300, 	%hsys_tick_cmpr
	ldsb	[%l7 + 0x50],	%o5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x7D2, 	%hsys_tick_cmpr
	tle	%xcc,	0x4
	rdpr	%wstate,	%i6
	alignaddrl	%o4,	%l4,	%i2
	fmovrsgz	%o1,	%f15,	%f16
	sllx	%g4,	%o6,	%i0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	orncc	%o2,	0x1261,	%o7
	or	%g5,	%l1,	%i7
	wr	%g3,	0x12AE,	%softint
	swap	[%l7 + 0x54],	%g6
	wrpr	%o0,	%l5,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	rdhpr	%hsys_tick_cmpr,	%g1
	rdhpr	%htba,	%i5
	rdhpr	%hintp,	%g2
	rdhpr	%hintp,	%l2
	nop
	set	0x68, %i1
	ldd	[%l7 + %i1],	%f16
	wrpr	%g7,	0x0F0E,	%pil
	wr	%i4,	%l6,	%clear_softint
	fmovdle	%icc,	%f23,	%f8
	fsrc1	%f26,	%f8
	fba	%fcc2,	loop_278
	rdpr	%otherwin,	%o5
	fblg	%fcc1,	loop_279
	rdpr	%wstate,	%i3
loop_278:
	fcmple32	%f22,	%f8,	%i6
	fmovsn	%icc,	%f17,	%f17
loop_279:
	wr	%l4,	%o4,	%ccr
	rd	%y,	%o1
	rdpr	%cwp,	%i2
	xnorcc	%g4,	%o6,	%l0
	or	%l3,	%i0,	%o2
	sdivcc	%g5,	0x1984,	%l1
	wr	%o7,	%g3,	%ccr
	xor	%i7,	%g6,	%o0
	rdhpr	%hsys_tick_cmpr,	%l5
	rdhpr	%htba,	%i1
	membar	0x0E
	wrpr	%g1,	0x1C03,	%cwp
	rd	%ccr,	%o3
	bvs,a,pn	%icc,	loop_280
	swap	[%l7 + 0x4C],	%g2
	rdpr	%pil,	%l2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_280:
	rd	%tick_cmpr,	%i5
	movvc	%xcc,	%g7,	%i4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fmovdcs	%icc,	%f12,	%f22
	wr	%i6,	0x0803,	%pic
	rdhpr	%htba,	%i3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x201, 	%hsys_tick_cmpr
	edge8n	%i2,	%o6,	%g4
	wrpr	%l0,	0x08B6,	%pil
	wr	%l3,	%o2,	%set_softint
	rdhpr	%hintp,	%i0
	rd	%sys_tick_cmpr,	%g5
	wr	%o7,	0x0EEC,	%set_softint

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x33E, 	%hsys_tick_cmpr
	rd	%softint,	%g6
	rdpr	%wstate,	%i7
	movvc	%xcc,	%l5,	%i1
	edge16	%o0,	%o3,	%g2
	udivcc	%l2,	0x124A,	%g1
	wrpr	%g7,	0x1F0B,	%cwp
	rdpr	%canrestore,	%i4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x1A0, 	%hsys_tick_cmpr
	tl	%xcc,	0x4
	wrpr	%o5,	0x00B2,	%pil
	fbl	%fcc0,	loop_281
	xnorcc	%i3,	%i6,	%l4
	fmovdle	%icc,	%f0,	%f28
	wrpr	%o1,	%i2,	%pil
loop_281:
	rd	%sys_tick_cmpr,	%o4
	prefetch	[%l7 + 0x20],	 0x1
	set	0x28, %o7
	stxa	%g4,	[%l7 + %o7] 0x2a
	membar	#Sync
	wrpr	%l0,	0x0626,	%cwp
	wr	%l3,	%o6,	%ccr
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x7D9, 	%hsys_tick_cmpr
	wr	%g5,	0x0D9D,	%set_softint
	rdpr	%tl,	%i0
	rdhpr	%htba,	%g3
	orncc	%l1,	0x1394,	%o7
	wrpr	%g6,	%l5,	%pil
	umulcc	%i1,	%o0,	%o3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fpadd32s	%f30,	%f18,	%f11
	wrpr	%l2,	0x14D2,	%pil
	wrpr	%g1,	%i4,	%tick
	rdhpr	%hsys_tick_cmpr,	%g7
	wr	%i5,	%o5,	%clear_softint
	wrpr	%l6,	0x1750,	%pil
	movne	%icc,	%i6,	%l4
	fnand	%f12,	%f24,	%f2
	rdpr	%wstate,	%i3
	rdhpr	%hpstate,	%o1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	tl	%icc,	0x6
	rd	%fprs,	%g4
	wr	%o4,	%l3,	%pic

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x9DA, 	%hsys_tick_cmpr
	fmovsn	%icc,	%f3,	%f2
	fmovdpos	%icc,	%f0,	%f15
	wrpr	%l0,	0x1CF7,	%tick
	wr	%o2,	%i0,	%clear_softint
	rdpr	%pil,	%g5
	rd	%pc,	%l1
	fbug	%fcc0,	loop_282
	wrpr	%o7,	%g3,	%pil
	wrpr	%g6,	%l5,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_282:
	rdhpr	%hpstate,	%o3
	fmovdle	%icc,	%f22,	%f8
	rd	%asi,	%i7
	wrpr	%g2,	0x1A85,	%cwp
	fandnot2	%f22,	%f26,	%f24
	fmovsa	%xcc,	%f16,	%f24
	wrpr	%g1,	0x0872,	%pil
	rdpr	%cwp,	%l2
	wr	%g0,	0x0c,	%asi
	ldsba	[%l7 + 0x15] %asi,	%i4
	fmovsne	%icc,	%f10,	%f9
	rd	%y,	%i5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x5E1, 	%hsys_tick_cmpr
	rd	%pc,	%l6
	fbe	%fcc1,	loop_283
	rdhpr	%htba,	%i6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xDD4, 	%sys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xCE5, 	%hsys_tick_cmpr
loop_283:
	rdhpr	%hsys_tick_cmpr,	%i3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%hsys_tick_cmpr,	%o1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x159, 	%tick_cmpr
	sll	%o4,	0x15,	%o6
	tsubcctv	%l3,	0x1974,	%l0
	srl	%i0,	0x1F,	%o2
	fmovse	%icc,	%f28,	%f28
	edge8l	%g5,	%o7,	%l1
	rdpr	%canrestore,	%g6
	andn	%g3,	0x1726,	%i1
	wr	%o0,	0x0EFA,	%ccr
	wrpr	%l5,	0x1EF6,	%tick
	fpsub32s	%f12,	%f21,	%f13
	bvc	loop_284
	wrpr	%o3,	%i7,	%pil
	tcc	%xcc,	0x3
	add	%l7,	0x38,	%l6
	wr	%g0,	0x11,	%asi
	ldxa	[%l6] %asi,	%g1
	casxa	[%l6] %asi,	%g1,	%g2
loop_284:
	rdhpr	%htba,	%i4
	wr	%l2,	0x0938,	%clear_softint
	udiv	%i5,	0x0309,	%l6
	wr	%g0,	0xf8,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
	rdpr	%cwp,	%i6
	udivcc	%l4,	0x02B8,	%g7
	rdhpr	%htba,	%i3
	edge32	%i2,	%o5,	%o1
	wrpr	%g4,	%o4,	%pil
	rdhpr	%hintp,	%l3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x460, 	%hsys_tick_cmpr
	fbne	%fcc0,	loop_285
	rdpr	%pil,	%i0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%asi,	%o7
loop_285:
	subcc	%g5,	0x1517,	%g6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x8DD, 	%hsys_tick_cmpr
	fcmpd	%fcc2,	%f8,	%f14
	wr	%g0,	0xe2,	%asi
	stha	%i1,	[%l7 + 0x12] %asi
	membar	#Sync
	tleu	%icc,	0x0
	set	0x72, %l1
	ldstuba	[%l7 + %l1] 0x11,	%o0
	rdhpr	%hintp,	%o3
	fxors	%f3,	%f14,	%f7
	wrpr	%l5,	0x0802,	%cwp
	rd	%y,	%i7
	wr	%g1,	%i4,	%ccr
	wr 	%g0, 	0x6, 	%fprs
	rdhpr	%hintp,	%i5
	membar	0x54

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%tick_cmpr,	%i6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	edge32ln	%l4,	%g7,	%i2
	tpos	%icc,	0x1
	wrpr	%i3,	%o1,	%pil
	wrpr	%g4,	%o5,	%tick
	rd	%softint,	%o4
	fbge	%fcc1,	loop_286
	rd	%sys_tick_cmpr,	%l3
        wr    %g0,    0xe,    %pcr    ! changed.
	rd	%asi,	%o2
loop_286:
	wrpr	%o6,	%o7,	%pil
	wr	%i0,	0x1514,	%ccr
	ldd	[%l7 + 0x28],	%g4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%tl,	%g3
	wr	%i1,	%o0,	%set_softint

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xE07, 	%hsys_tick_cmpr
	rdhpr	%htba,	%l5
	rdhpr	%hpstate,	%i7
	ta	%icc,	0x5
	wr	%g1,	%i4,	%y
	rdhpr	%htba,	%g6
	wrpr	%l2,	0x0436,	%cwp
	or	%g2,	%i6,	%i5
	wrpr	%l6,	0x0A7C,	%pil
	rd	%tick_cmpr,	%l4
	fsrc1	%f12,	%f10
	lduh	[%l7 + 0x20],	%g7
	rd	%tick_cmpr,	%i2
	xorcc	%o1,	0x10EB,	%i3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xF9C, 	%hsys_tick_cmpr
	rdpr	%cansave,	%o4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x71B, 	%hsys_tick_cmpr
	or	%l0,	%o2,	%o6
	udivx	%o5,	0x05EF,	%o7
	tne	%icc,	0x2
	wr 	%g0, 	0x5, 	%fprs
	wrpr	%g5,	0x1673,	%pil
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdivcc	%i1,	0x0D33,	%o0
	wrpr	%o3,	%g3,	%cwp
	wr	%l5,	%i7,	%y
	wrpr	%i4,	0x1B40,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xD1D, 	%sys_tick_cmpr
	fbug,a	%fcc1,	loop_287
	rdhpr	%hintp,	%l2
	ldsh	[%l7 + 0x22],	%i6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_287:
	wrpr	%l6,	0x01DC,	%tick
	tl	%icc,	0x0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xDD2, 	%hsys_tick_cmpr
	rdhpr	%hpstate,	%l4
	fmovdvc	%icc,	%f27,	%f7
	rdhpr	%hpstate,	%i2
	rd	%softint,	%o1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	smul	%g4,	%o4,	%l3
	tcs	%icc,	0x7
	mulscc	%o2,	%o6,	%o5
	udivcc	%o7,	0x12BC,	%l0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x584, 	%hsys_tick_cmpr
	fnot2s	%f6,	%f21
	smulcc	%g5,	%i0,	%i1
	ldub	[%l7 + 0x7F],	%o0
	taddcctv	%o3,	%g3,	%l5
	movle	%xcc,	%i4,	%g6
	nop
	setx loop_288, %l0, %l1
	jmpl %l1, %i7
	ba,a	loop_289
	rd	%ccr,	%g1
	wrpr	%l2,	%g2,	%cwp
loop_288:
	andn	%l6,	%i5,	%i6
loop_289:
	srlx	%i2,	%l4,	%o1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	wr	%o4,	0x1672,	%sys_tick
	rdpr	%cwp,	%l3
	fmovrdne	%g4,	%f4,	%f28
	wrpr	%o6,	0x0103,	%pil
	rd	%ccr,	%o2
	sll	%o5,	%l0,	%o7
	fabss	%f19,	%f8
	rdhpr	%htba,	%g5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x3E9, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%o0,	0x17EE,	%sys_tick
	wr	%i1,	%g3,	%y
	rdpr	%cleanwin,	%o3
	fpsub32s	%f31,	%f2,	%f15
	wrpr	%l5,	%g6,	%pil
	edge32l	%i4,	%g1,	%i7
	fmovdle	%icc,	%f5,	%f10
	fmovs	%f9,	%f1
	rd	%sys_tick_cmpr,	%l2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%g2,	0x0984,	%tick
	rdpr	%wstate,	%i6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	orn	%g7,	0x0C22,	%i2
	wrpr	%o4,	%i3,	%tick
	rdpr	%gl,	%l3
	rdhpr	%hsys_tick_cmpr,	%g4
	movgu	%icc,	%o2,	%o6
	rdhpr	%htba,	%o5
	edge16ln	%o7,	%l0,	%l1
	bcs,a	loop_290
	fcmps	%fcc0,	%f1,	%f26
	fmovde	%icc,	%f13,	%f22
	rd	%y,	%g5
loop_290:
	rdpr	%gl,	%o0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x6AC, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	movvs	%icc,	%i1,	%g6
	wr	%l5,	0x1256,	%set_softint
	set	0x2E, %g5
	lduha	[%l7 + %g5] 0x10,	%i4
	fmovd	%f30,	%f14
	rd	%softint,	%i7
	wr	%g1,	%l6,	%sys_tick
	fpsub32s	%f28,	%f12,	%f22
	addcc	%i5,	0x054B,	%g2
	brz	%l2,	loop_291
	sth	%i6,	[%l7 + 0x64]
	edge16n	%o1,	%l4,	%i2
	rdpr	%cwp,	%o4
loop_291:
	wr	%g7,	0x07FC,	%set_softint
	wr 	%g0, 	0x5, 	%fprs
	subccc	%o2,	0x02C6,	%l3
	rdpr	%cleanwin,	%o6
	array32	%o7,	%l0,	%l1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x29B, 	%tick_cmpr
	wrpr	%o0,	%i0,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xE95, 	%sys_tick_cmpr
	rdhpr	%hpstate,	%i1
	alignaddrl	%g6,	%o5,	%i4
	wrpr	%l5,	0x0E83,	%tick
	fmovda	%xcc,	%f23,	%f20
	srax	%i7,	%g1,	%l6
	wrpr	%i5,	%l2,	%cwp
	wr	%g0,	0x0c,	%asi
	prefetcha	[%l7 + 0x08] %asi,	 0x1
	rdpr	%otherwin,	%o1
	rdhpr	%htba,	%i6
	rd	%y,	%i2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x1AF, 	%hsys_tick_cmpr
	rd	%asi,	%g7
	array8	%i3,	%g4,	%o2
	wrpr	%l3,	%o6,	%tick
	fbo	%fcc1,	loop_292
	fmuld8sux16	%f20,	%f7,	%f8
	movrgez	%l4,	0x01B,	%l0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xFEE, 	%tick_cmpr
loop_292:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andncc	%g5,	%o0,	%l1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x241, 	%hsys_tick_cmpr
	mulscc	%i0,	%i1,	%g6
	rd	%fprs,	%o3
	rdhpr	%hintp,	%i4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%wstate,	%i7
	edge16	%l6,	%i5,	%g1
	fmovdcs	%xcc,	%f17,	%f26
	fmuld8ulx16	%f19,	%f25,	%f4
	wrpr	%l2,	%o1,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xCFD, 	%hsys_tick_cmpr
	wrpr	%o4,	0x06DF,	%tick
	rdpr	%tl,	%g7
	smul	%i3,	%g4,	%g2
	rdpr	%otherwin,	%o2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%o6,	%l0,	%pic
	wr	%o7,	0x0067,	%pic
	rdhpr	%hpstate,	%l4
	add	%l7,	0x74,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%o0
	casa	[%l6] %asi,	%o0,	%l1
	rdpr	%gl,	%g3
	rd	%softint,	%g5
	rdhpr	%htba,	%i0
	rdpr	%cwp,	%i1
	rd	%tick_cmpr,	%o3
	movg	%xcc,	%g6,	%i4
	srax	%l5,	%o5,	%i7
	movne	%icc,	%i5,	%l6
	fsrc2s	%f9,	%f11
	rd	%asi,	%g1
	array32	%o1,	%l2,	%i2
	xnorcc	%i6,	%o4,	%i3
	rd	%asi,	%g4
	wrpr	%g2,	0x00BB,	%tick
	wr	%o2,	0x0101,	%set_softint
	subcc	%l3,	%g7,	%o6
	rdhpr	%hintp,	%l0
	addcc	%o7,	0x19BF,	%l4
	edge32	%l1,	%o0,	%g3
	fands	%f2,	%f30,	%f3
	for	%f24,	%f26,	%f26
	movpos	%icc,	%g5,	%i1
	set	0x10, %i4
	ldda	[%l7 + %i4] 0x24,	%o2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xDC3, 	%sys_tick_cmpr
	fabsd	%f14,	%f26
	rdhpr	%hsys_tick_cmpr,	%g6
	ba,pn	%icc,	loop_293
	edge8n	%o5,	%i7,	%i5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	bpos	%icc,	loop_294
loop_293:
	rdhpr	%hpstate,	%o1
	andncc	%l2,	%i2,	%l5
	rd	%ccr,	%i6
loop_294:
	rd	%ccr,	%o4
	sdiv	%g4,	0x0EAC,	%g2
	andcc	%i3,	0x0F69,	%o2
	orcc	%g7,	%o6,	%l3
	rd	%sys_tick_cmpr,	%o7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x141, 	%sys_tick_cmpr
	wr	%l1,	%o0,	%softint

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%g5,	0x0756,	%y
	edge16l	%o3,	%i0,	%i1
	orcc	%i4,	0x1C87,	%g6
	xorcc	%o5,	%i7,	%i5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xC93, 	%hsys_tick_cmpr
	rd	%pc,	%l2
	movvc	%icc,	%g1,	%i2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x5B9, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x288, 	%hsys_tick_cmpr
	subccc	%i3,	%g7,	%o2
	edge8n	%o6,	%o7,	%l4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xF70, 	%hsys_tick_cmpr
	edge16n	%l1,	%l3,	%o0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
        wr    %g0,    0xe,    %pcr    ! changed.
	wrpr	%i1,	0x0B01,	%pil
	rdhpr	%htba,	%i4
	fbl	%fcc0,	loop_295
	edge16	%o3,	%o5,	%i7
	tle	%icc,	0x1
	wrpr	%g6,	0x02A6,	%tick
loop_295:
	te	%xcc,	0x5
	set	0x30, %i7
	ldda	[%l7 + %i7] 0xe3,	%i4
	set	0x60, %o3
	ldda	[%l7 + %o3] 0x2c,	%o0
	rdpr	%tba,	%l6
	fmovs	%f12,	%f18
	rdpr	%tba,	%l2
	alignaddr	%g1,	%l5,	%i6
	tneg	%icc,	0x5
	rd	%fprs,	%o4
	wr	%g0,	0x19,	%asi
	ldsha	[%l7 + 0x64] %asi,	%g2
	rdhpr	%hintp,	%i2
	rdpr	%tba,	%g4
	nop
	set	0x57, %l3
	ldub	[%l7 + %l3],	%g7
	ldstub	[%l7 + 0x3B],	%i3
	edge32n	%o2,	%o6,	%l4
	wrpr	%l0,	0x1C3C,	%tick
	rd	%y,	%o7
	andncc	%l1,	%l3,	%o0
	wr	%g5,	0x1DA5,	%pic
	mulx	%i0,	0x005B,	%g3
	wr	%i1,	0x0BA9,	%sys_tick
	st	%f2,	[%l7 + 0x44]
	set	0x78, %i3
	stxa	%o3,	[%l7 + %i3] 0x19

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%g6,	%i5,	%pil
	sdivcc	%i7,	0x0A4E,	%o1
	ldd	[%l7 + 0x60],	%f14

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%l6,	%g1,	%set_softint
	wrpr	%i6,	0x0027,	%tick
	wrpr	%l5,	%o4,	%tick
	rdpr	%cansave,	%i2
	rd	%softint,	%g2
	wrpr	%g4,	0x0C18,	%cwp
	addccc	%g7,	0x0ABC,	%o2
	rdhpr	%hintp,	%i3
	wr	%l4,	%l0,	%set_softint
	fmovdle	%xcc,	%f12,	%f7
	wr	%o6,	0x0CCC,	%y
	tn	%icc,	0x3
	subc	%l1,	0x16A8,	%o7
	wr	%o0,	0x0637,	%pic
	wrpr	%l3,	%g5,	%pil
	edge8n	%i0,	%i1,	%o3
	wr	%g0,	0xeb,	%asi
	stha	%g3,	[%l7 + 0x70] %asi
	membar	#Sync
	tsubcctv	%i4,	%g6,	%o5
	smul	%i5,	%o1,	%i7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	xor	%l2,	0x0A35,	%i6
	fmovrsgz	%g1,	%f2,	%f15
	fmovsvs	%xcc,	%f31,	%f28
	wr	%o4,	%i2,	%ccr
	rdhpr	%hintp,	%g2
	movvs	%icc,	%g4,	%g7
	nop
	set	0x39, %o1
	stb	%o2,	[%l7 + %o1]
	ldsh	[%l7 + 0x72],	%i3
	fmovdge	%icc,	%f4,	%f16
	subc	%l4,	%l5,	%o6
	sdivcc	%l1,	0x0346,	%o7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	tgu	%icc,	0x7
	tle	%xcc,	0x5
	edge8n	%l3,	%l0,	%i0
	rd	%fprs,	%g5
	rdhpr	%hintp,	%o3
	rd	%tick_cmpr,	%g3
	rd	%fprs,	%i1
	rd	%asi,	%i4
	rdhpr	%hintp,	%o5
	fbul,a	%fcc2,	loop_296
	movvs	%icc,	%i5,	%g6
	wrpr	%o1,	%l6,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xE21, 	%tick_cmpr
loop_296:
	rdpr	%cansave,	%i6
	fmovse	%xcc,	%f31,	%f27
	umul	%i7,	%g1,	%i2
	bneg,a,pn	%xcc,	loop_297
	bcs,pt	%xcc,	loop_298
	umulcc	%g2,	%g4,	%g7
	sllx	%o2,	0x18,	%o4
loop_297:
	bshuffle	%f12,	%f14,	%f2
loop_298:
	movvc	%xcc,	%l4,	%l5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xA00, 	%hsys_tick_cmpr
	tle	%icc,	0x3
	bvc,a,pn	%icc,	loop_299
	andn	%l1,	0x0740,	%o6
	wr	%o7,	0x0F4C,	%set_softint

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x142, 	%hsys_tick_cmpr
loop_299:
	rdpr	%canrestore,	%i0
	fzero	%f26
	rd	%asi,	%g5
	wrpr	%l0,	%g3,	%tick
	bcs	loop_300
	fmovdn	%icc,	%f10,	%f23
	edge32	%o3,	%i1,	%o5
	udivcc	%i5,	0x1366,	%g6
loop_300:
	fxor	%f18,	%f22,	%f14
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%o1,	%l6,	%ccr
	rdhpr	%htba,	%l2
	tsubcc	%i6,	%i4,	%g1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xB8D, 	%hsys_tick_cmpr
	rdpr	%cleanwin,	%i2
	fblg	%fcc3,	loop_301
	fblg	%fcc3,	loop_302
	wrpr	%g4,	0x1CB2,	%pil
	rd	%fprs,	%g2
loop_301:
	ld	[%l7 + 0x7C],	%f16
loop_302:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	tvc	%xcc,	0x6
	fmovspos	%icc,	%f10,	%f11
	wrpr	%g7,	%l4,	%cwp
	rd	%fprs,	%l5
	rdhpr	%htba,	%i3
	ldx	[%l7 + 0x68],	%l1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fmovda	%xcc,	%f3,	%f5
	wr 	%g0, 	0x5, 	%fprs
	rdhpr	%htba,	%l3
	tvs	%xcc,	0x2
	sub	%o4,	%o0,	%i0
	wr	%l0,	%g3,	%ccr
	fmovda	%xcc,	%f18,	%f16
	xorcc	%o3,	%g5,	%o5
	wr	%i5,	%i1,	%pic
	udiv	%o1,	0x0192,	%g6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	rd	%y,	%l2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	edge32ln	%g1,	%i2,	%i7
	rdpr	%tba,	%g4
	array32	%o2,	%g2,	%l4
	fandnot1	%f18,	%f18,	%f28

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xCC1, 	%hsys_tick_cmpr
	rdhpr	%hsys_tick_cmpr,	%i3
	sethi	0x0DCF,	%l1
	tvs	%xcc,	0x2
	rdhpr	%hsys_tick_cmpr,	%o6
	rd	%ccr,	%o7
	rd	%pc,	%l3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%softint,	%i0
	edge16	%l0,	%g3,	%o0
	wr	%g5,	%o5,	%sys_tick
	rd	%tick_cmpr,	%i5
	tn	%icc,	0x3
	tsubcc	%o3,	%i1,	%o1
	tcs	%icc,	0x6
	rdpr	%canrestore,	%g6
	movl	%icc,	%l6,	%i4
	rdhpr	%hintp,	%i6
	rd	%asi,	%l2
	rdpr	%cansave,	%i2
	wr	%g1,	%i7,	%ccr
	fmovrse	%o2,	%f11,	%f1
	rd	%fprs,	%g2
	rd	%y,	%l4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x88B, 	%hsys_tick_cmpr
	fmovsvc	%icc,	%f31,	%f8

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xCB4, 	%hsys_tick_cmpr
	rdhpr	%hpstate,	%o6
	fmovdneg	%icc,	%f28,	%f7
	wrpr	%g4,	0x0806,	%cwp
	sub	%o7,	%l3,	%o4
	wr	%i0,	%g7,	%ccr
	rd	%pc,	%g3
	rd	%pc,	%l0
	wr 	%g0, 	0x4, 	%fprs

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	tneg	%xcc,	0x5
	rdpr	%gl,	%i5
	edge32	%o3,	%i1,	%o1
	wrpr	%l6,	%g6,	%cwp
	edge8l	%i4,	%l2,	%i2
	fcmps	%fcc3,	%f16,	%f19
	rdpr	%wstate,	%g1
	rdpr	%pil,	%i7
	and	%o2,	0x000A,	%g2
	rdpr	%pil,	%l4
	rd	%asi,	%i6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	rdpr	%canrestore,	%l5
	fmovsge	%icc,	%f14,	%f23
	movvc	%xcc,	%o6,	%l1
	wr	%g4,	%o7,	%y

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	addccc	%i0,	%g7,	%g3
	rdhpr	%htba,	%l0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x079, 	%sys_tick_cmpr
	fmovdcs	%icc,	%f6,	%f21
	rdpr	%tba,	%g5
	rdpr	%pil,	%i5
	wr	%o3,	0x0EC1,	%ccr
	rdpr	%wstate,	%i1
	stb	%o1,	[%l7 + 0x26]
	sdiv	%l6,	0x1D0E,	%g6
	wrpr	%o5,	%l2,	%pil
	movvc	%icc,	%i4,	%i2
	wr	%g1,	%o2,	%ccr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xC49, 	%hsys_tick_cmpr
	wr	%l4,	0x1BB2,	%softint
	wr	%i6,	%i3,	%softint
	stw	%l5,	[%l7 + 0x60]
        wr    %g0,    0xe,    %pcr    ! changed.
	wrpr	%o6,	%g4,	%pil
	fmul8x16al	%f5,	%f28,	%f22
	wr	%g0,	0x2b,	%asi
	stda	%o6,	[%l7 + 0x48] %asi
	membar	#Sync
	udivx	%l3,	0x049D,	%i0
	rdhpr	%hintp,	%g7
	xnor	%l0,	0x1BED,	%g3
	rdpr	%tl,	%o4
	movre	%g5,	0x0DB,	%o0
	tleu	%icc,	0x7
	edge8	%o3,	%i5,	%i1
	tcc	%xcc,	0x2
	fbu,a	%fcc1,	loop_303
	rd	%asi,	%o1
	wrpr	%g6,	0x174B,	%cwp
	taddcctv	%o5,	0x0B6D,	%l6
loop_303:
	wr	%l2,	0x0DC3,	%ccr
	and	%i2,	%i4,	%o2
	wrpr	%g1,	%i7,	%pil
	bne	loop_304
	rd	%tick_cmpr,	%i6
	wr	%i3,	%l4,	%softint
	rd	%y,	%l5
loop_304:
	edge8ln	%l1,	%o6,	%g4
	membar	0x48
	rd	%sys_tick_cmpr,	%o7
	rdpr	%gl,	%g2
	mova	%icc,	%i0,	%l3
	wrpr	%l0,	%g7,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%g5,	%o3,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%i1,	%g6,	%cwp
	wrpr	%o5,	%o1,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%sys_tick_cmpr,	%l2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%ccr,	%i4
	rd	%softint,	%o2
	fnors	%f12,	%f3,	%f26
	add	%l7,	0x14,	%l6
	wr	%g0,	0x18,	%asi
	lda	[%l6] %asi,	%g1
	casa	[%l6] %asi,	%g1,	%i6
	edge16ln	%i7,	%i3,	%l5
	addccc	%l1,	%l4,	%o6
	wrpr	%g4,	%g2,	%pil
	subccc	%o7,	%i0,	%l3
	fmovrdlez	%g7,	%f24,	%f10
	rdpr	%cleanwin,	%l0
	rdpr	%cleanwin,	%o4
	membar	0x27
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8n	%g5,	%g3,	%o3
	rdpr	%cwp,	%o0
	siam	0x5
	tge	%icc,	0x5
	rdhpr	%hsys_tick_cmpr,	%i5
	tleu	%icc,	0x5
	fbge,a	%fcc2,	loop_305
	and	%i1,	0x0856,	%o5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x32F, 	%hsys_tick_cmpr
	rdpr	%pil,	%g6
loop_305:
	membar	0x4F
	rdpr	%pil,	%l6
        wr    %g0,    0xe,    %pcr    ! changed.
	rd	%fprs,	%i2
	fabsd	%f22,	%f22

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	subc	%i4,	%i6,	%i7
	fmovsgu	%icc,	%f16,	%f11
	rdpr	%pil,	%l5
	umul	%l1,	0x0752,	%l4
	rd	%y,	%i3
	rdhpr	%hpstate,	%g4
	rd	%ccr,	%o6
	rdpr	%pil,	%g2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	fxors	%f15,	%f24,	%f15

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	umulcc	%g7,	%o7,	%l0
	rd	%sys_tick_cmpr,	%o4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%tl,	%g5
	lduh	[%l7 + 0x64],	%o0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%i1,	0x10CA,	%tick
	fzeros	%f22
	rdhpr	%hintp,	%o5
	movl	%xcc,	%i5,	%g6
	rdhpr	%hpstate,	%o1
	rdhpr	%htba,	%l6
	wrpr	%i2,	%l2,	%cwp
	ld	[%l7 + 0x38],	%f17
	add	%o2,	%g1,	%i4
	tpos	%xcc,	0x7
	rdpr	%cansave,	%i6
	brnz	%i7,	loop_306
	popc	%l5,	%l4
	wr	%g0,	0x0c,	%asi
	lduha	[%l7 + 0x78] %asi,	%l1
loop_306:
	prefetch	[%l7 + 0x54],	 0x3
	wrpr	%g4,	0x0244,	%cwp
	movneg	%icc,	%i3,	%o6
	fpadd32	%f18,	%f4,	%f4
	rd	%fprs,	%i0
	popc	0x0903,	%l3
	bleu,pn	%icc,	loop_307
	rdhpr	%hpstate,	%g7
	tcs	%icc,	0x6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_307:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xDAF, 	%hsys_tick_cmpr
	wrpr	%g5,	0x15AA,	%cwp
	rd	%tick_cmpr,	%g3
	fcmped	%fcc2,	%f12,	%f4
	rd	%ccr,	%o3
	wrpr	%i1,	%o0,	%pil
	wrpr	%i5,	0x0D65,	%pil
	fones	%f1
	wrpr	%o5,	0x0313,	%tick
	rd	%asi,	%o1
	fbge,a	%fcc1,	loop_308
	orncc	%l6,	%g6,	%l2
	edge16ln	%i2,	%g1,	%i4
	rd	%tick_cmpr,	%i6
loop_308:
	brlez	%i7,	loop_309
	movrlez	%o2,	0x352,	%l4
	tpos	%icc,	0x2
	subccc	%l5,	0x0D19,	%l1
loop_309:
	fnot2s	%f24,	%f15
	rdpr	%gl,	%i3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x31A, 	%sys_tick_cmpr
	orncc	%i0,	0x1DE7,	%l3
	rdhpr	%hsys_tick_cmpr,	%g4
	fmovrsne	%g7,	%f18,	%f29
	wr	%g0,	0x19,	%asi
	ldsba	[%l7 + 0x40] %asi,	%g2
	tne	%icc,	0x5
	wrpr	%l0,	0x01F4,	%tick
	rdpr	%cwp,	%o4
	fmovse	%icc,	%f2,	%f20

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x1E5, 	%hsys_tick_cmpr
	rdhpr	%hsys_tick_cmpr,	%o7
	movn	%icc,	%o3,	%g3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x6D1, 	%hsys_tick_cmpr
	sdiv	%o5,	0x1154,	%o1
	wr	%i5,	0x0235,	%set_softint
	rdhpr	%htba,	%g6
	set	0x20, %o6
	ldda	[%l7 + %o6] 0x81,	%l2
	smulcc	%l6,	0x09E7,	%g1
	edge32	%i2,	%i4,	%i6
	edge8l	%o2,	%i7,	%l5
	tgu	%xcc,	0x0
	edge32l	%l1,	%i3,	%l4
	wr	%o6,	0x1D33,	%clear_softint
	movcs	%icc,	%i0,	%l3
	rdpr	%cansave,	%g7
	wrpr	%g2,	0x00BE,	%pil
	set	0x2C, %l0
	ldsba	[%l7 + %l0] 0x14,	%l0
	rdhpr	%hintp,	%o4
	wr	%g5,	0x0E05,	%y

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fmovse	%xcc,	%f3,	%f15
	rd	%ccr,	%o3
	wrpr	%g3,	%g4,	%tick
	rdpr	%gl,	%o0
	bne	loop_310
	tpos	%icc,	0x1
	rd	%pc,	%i1
	udivcc	%o1,	0x0FCF,	%o5
loop_310:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%htba,	%l6
	xnorcc	%g1,	%i2,	%i4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x8C3, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fmovsleu	%icc,	%f3,	%f25
	movrgez	%l5,	%l1,	%i3
	rd	%pc,	%l4
!Yo - got one - imm_asi 0x50 
!And yo - immediate is 0x30
	set	0x30, %o5
	ldxa	[%g0 + %o5] 0x50,	%i7
	wr 	%g0, 	0x6, 	%fprs
	fmovrdne	%l3,	%f30,	%f16

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%o4,	%g7,	%pil
	fmovrdgez	%o7,	%f2,	%f2
	fnot1s	%f24,	%f4
	rd	%ccr,	%g5
	rd	%asi,	%g3
	wr	%o3,	%g4,	%clear_softint
	wr	%i1,	%o1,	%y

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	orcc	%i5,	%g6,	%l6
	wrpr	%g1,	0x1399,	%cwp
	wr	%o0,	0x17E4,	%pic
	movne	%icc,	%i2,	%i4
	rd	%ccr,	%i6
	rdpr	%cleanwin,	%o2
	fnegs	%f1,	%f4
	set	0x0C, %g4
	lduwa	[%l7 + %g4] 0x80,	%l5
	wrpr	%l1,	0x0A39,	%cwp
	rdpr	%tba,	%l2
	subcc	%l4,	0x113E,	%i3
	edge16	%o6,	%i7,	%i0
	rdpr	%tl,	%g2
	rd	%tick_cmpr,	%l0
	rdhpr	%hsys_tick_cmpr,	%o4
	add	%l3,	%g7,	%g5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x0F0, 	%hsys_tick_cmpr
	tne	%xcc,	0x5
	fxnor	%f22,	%f22,	%f2
	wr	%g4,	%i1,	%clear_softint
	wr	%g0,	0x10,	%asi
	ldxa	[%l7 + 0x48] %asi,	%o3
	wrpr	%o5,	%o1,	%pil
	wrpr	%g6,	%i5,	%pil
	orn	%g1,	%o0,	%l6
	fcmpeq32	%f30,	%f6,	%i4
	tl	%icc,	0x0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xEBC, 	%hsys_tick_cmpr
	rdpr	%gl,	%i2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x357, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fcmpne32	%f22,	%f12,	%l2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x24F, 	%hsys_tick_cmpr
	rd	%fprs,	%l4
	move	%icc,	%i0,	%i7
	rdpr	%cansave,	%l0
	orncc	%o4,	%g2,	%g7
	wrpr	%g5,	%l3,	%pil
	call	loop_311
	edge32	%o7,	%g3,	%i1
	rd	%ccr,	%g4
	subc	%o5,	%o1,	%g6
loop_311:
	nop
	add	%l7,	0x24,	%l6
	wr	%g0,	0x19,	%asi
	lda	[%l6] %asi,	%o3
	casa	[%l6] %asi,	%o3,	%g1
	sllx	%i5,	0x1B,	%l6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x871, 	%tick_cmpr
	wrpr	%i6,	%o2,	%pil
	fnot1s	%f31,	%f28
	rdpr	%canrestore,	%l5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x036, 	%hsys_tick_cmpr
	wrpr	%l1,	%i3,	%pil
	rdpr	%pil,	%l4
	ldx	[%l7 + 0x40],	%o6
	fnot1s	%f19,	%f29
	fmovdcs	%icc,	%f31,	%f20

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	udiv	%l0,	0x1E46,	%o4
	rdhpr	%hintp,	%g7
	tcc	%icc,	0x1
	rdhpr	%hintp,	%g5
	add	%l7,	0x48,	%l6
	wr	%g0,	0x0c,	%asi
	casxa	[%l6] %asi,	%l3,	%o7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x69C, 	%hsys_tick_cmpr
	set	0x58, %i5
	ldswa	[%l7 + %i5] 0x10,	%i1
	fbl	%fcc3,	loop_312
	rdpr	%cansave,	%g4
	wrpr	%o5,	%o1,	%cwp
	wrpr	%o3,	0x1092,	%tick
loop_312:
	rd	%tick_cmpr,	%g1
	sdiv	%g6,	0x09F2,	%i5
	fmuld8ulx16	%f13,	%f8,	%f12
	rdpr	%gl,	%o0
	set	0x18, %l6
	stda	%i6,	[%l7 + %l6] 0xe3
	membar	#Sync
	movre	%i4,	0x2AD,	%i6
	rd	%y,	%o2
	rd	%sys_tick_cmpr,	%i2
	fmovrdgz	%l2,	%f24,	%f6
	udiv	%l5,	0x16F5,	%i3
	ldub	[%l7 + 0x43],	%l1
	rdpr	%otherwin,	%l4
	wrpr	%i0,	%o6,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xFD9, 	%hsys_tick_cmpr
	rd	%tick_cmpr,	%l0
	rdhpr	%htba,	%g7
	tneg	%icc,	0x6
	nop
	set	0x60, %l4
	lduw	[%l7 + %l4],	%g5
	rdhpr	%hpstate,	%l3
	rdhpr	%hpstate,	%o7
	wr	%g2,	0x0A65,	%clear_softint
	edge32n	%g3,	%i1,	%g4
	rd	%pc,	%o5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x4D4, 	%hsys_tick_cmpr
	subcc	%g1,	0x112C,	%o4
	lduw	[%l7 + 0x60],	%i5
	fbl,a	%fcc0,	loop_313
	tsubcc	%g6,	0x1C75,	%l6
	movle	%xcc,	%o0,	%i4
	wr	%g0,	0x17,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
loop_313:
	rdpr	%canrestore,	%o2
	set	0x40, %i0
	ldda	[%l7 + %i0] 0x18,	%f16
	wr	%i6,	%l2,	%ccr
	fmuld8sux16	%f21,	%f31,	%f10
	wr	%i2,	0x1D2F,	%pic
	wr	%l5,	0x1091,	%sys_tick
	wr	%g0,	0x80,	%asi
	prefetcha	[%l7 + 0x20] %asi,	 0x1
	rd	%tick_cmpr,	%i3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%y,	%i0
	wrpr	%i7,	0x0AF9,	%tick
	rd	%ccr,	%g7
	wrpr	%g5,	0x1462,	%pil
	rd	%fprs,	%l0
	ldd	[%l7 + 0x18],	%f18
	rd	%softint,	%l3
	sllx	%o7,	0x00,	%g2
	wr	%i1,	%g3,	%sys_tick
	wrpr	%g4,	0x114C,	%tick
	movrgez	%o5,	%o3,	%g1
	rd	%y,	%o4
	wrpr	%o1,	%g6,	%tick
	fnegd	%f20,	%f16

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x950, 	%sys_tick_cmpr
	rdhpr	%hpstate,	%i4
	wrpr	%o0,	%o2,	%tick
!Yo - got one - imm_asi 0x52 
!And yo - immediate is 0x118
	set	0x118, %o4
	ldxa	[%g0 + %o4] 0x52,	%l2
	wrpr	%i6,	%l5,	%cwp
	rdpr	%canrestore,	%i2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	fmovsle	%icc,	%f29,	%f26

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	movre	%i0,	0x070,	%i7
	wr	%g7,	%o6,	%softint
	movn	%icc,	%g5,	%l0
	edge8n	%l3,	%g2,	%o7
	sll	%i1,	0x18,	%g4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x312, 	%hsys_tick_cmpr
	addccc	%g3,	0x02EC,	%g1
	edge16n	%o4,	%o1,	%g6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	addccc	%i5,	0x0A0E,	%l6
	rd	%asi,	%i4
	movvs	%icc,	%o0,	%l2
	fornot2	%f8,	%f14,	%f18
	wr	%i6,	%l5,	%clear_softint
	rdhpr	%hsys_tick_cmpr,	%o2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	alignaddrl	%l1,	%l4,	%i0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x478, 	%hsys_tick_cmpr
	movgu	%xcc,	%o6,	%g5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%l3,	%o7,	%softint
	tne	%xcc,	0x2
	fcmpne32	%f22,	%f8,	%i1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xD29, 	%hsys_tick_cmpr
	ld	[%l7 + 0x30],	%f28
	wrpr	%o5,	0x1AB1,	%tick
	rd	%pc,	%g3
	wr 	%g0, 	0x5, 	%fprs

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%o1,	%o3,	%tick
	rdhpr	%hpstate,	%g6
	tgu	%xcc,	0x3
	rdpr	%cansave,	%i5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x695, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x2CD, 	%hsys_tick_cmpr
	rdhpr	%hpstate,	%l2
	rdpr	%wstate,	%i6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%i2,	%i3,	%tick
	edge8	%l1,	%i0,	%g7
	wr	%l4,	0x0303,	%sys_tick
	fpack16	%f2,	%f19
	wr	%o6,	0x010E,	%softint
	movgu	%xcc,	%i7,	%l0
	bge,pn	%xcc,	loop_314
	rdhpr	%hsys_tick_cmpr,	%l3
	fmovsleu	%xcc,	%f18,	%f0
	rdpr	%cwp,	%o7
loop_314:
	rdhpr	%hsys_tick_cmpr,	%i1
	edge16	%g5,	%g2,	%o5
	rd	%asi,	%g4
	addcc	%g3,	%o4,	%o1
	movle	%icc,	%o3,	%g1
	wr	%i5,	%g6,	%sys_tick
	sdivx	%l6,	0x181F,	%o0
	rdpr	%cwp,	%l2
	rdhpr	%htba,	%i4
	addcc	%i6,	%l5,	%i2
	nop
	set	0x20, %g1
	stw	%i3,	[%l7 + %g1]
	tle	%icc,	0x0
	fbge,a	%fcc2,	loop_315
	wr 	%g0, 	0x4, 	%fprs
	membar	0x1D
	subc	%i0,	0x1ED7,	%g7
loop_315:
	mulscc	%o2,	%l4,	%o6
	add	%l0,	0x0B19,	%i7
	fmovs	%f2,	%f14
	rd	%ccr,	%l3
	wr 	%g0, 	0x6, 	%fprs
	wrpr	%g5,	%o7,	%cwp
	addc	%g2,	%o5,	%g3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	andncc	%g4,	%o3,	%i5
	brnz	%g6,	loop_316
	rd	%asi,	%l6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xD71, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_316:
	rdhpr	%htba,	%g1
	edge32l	%l5,	%i2,	%i6
	and	%i3,	0x16CB,	%l1
	sdiv	%i0,	0x13CD,	%o2
	fbe	%fcc1,	loop_317
	fmovsgu	%xcc,	%f20,	%f17
	fmovrdlz	%g7,	%f22,	%f30

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x455, 	%hsys_tick_cmpr
loop_317:
	wr	%l4,	0x1764,	%softint
	rdpr	%cleanwin,	%i7
	wr	%l3,	0x143A,	%ccr
        wr    %g0,    0xe,    %pcr    ! changed.
	wrpr	%i1,	0x1BD4,	%pil
	fors	%f23,	%f14,	%f15
	rdpr	%cleanwin,	%o7
	edge16l	%g5,	%o5,	%g3
	wr	%g2,	%o4,	%softint
	rdhpr	%hpstate,	%o1
	rd	%tick_cmpr,	%g4
	fcmpgt16	%f12,	%f12,	%o3
	fmovsgu	%icc,	%f10,	%f24
	wr 	%g0, 	0x5, 	%fprs
	set	0x24, %g2
	lda	[%l7 + %g2] 0x11,	%f12
	tneg	%icc,	0x4
	fpadd16s	%f1,	%f1,	%f10
	udivx	%o0,	0x0ECE,	%l2
	taddcctv	%l6,	%i4,	%g1
	add	%l7,	0x68,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%i2,	%l5
	rdpr	%cwp,	%i3
	wr	%i6,	0x0215,	%ccr
	rd	%y,	%l1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	rd	%pc,	%o2
	rdhpr	%htba,	%g7
	rd	%tick_cmpr,	%o6
	tle	%xcc,	0x1
	rd	%ccr,	%i0
	rdpr	%cwp,	%l4
	fbn	%fcc1,	loop_318
	wrpr	%i7,	%l3,	%pil
	movcc	%xcc,	%l0,	%i1
	fmovrdne	%g5,	%f26,	%f22
loop_318:
	bcc	loop_319
	fnot2s	%f11,	%f29
	wrpr	%o5,	0x10D9,	%tick
	tle	%icc,	0x5
loop_319:
	rd	%sys_tick_cmpr,	%g3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x58B, 	%hsys_tick_cmpr
	wr	%o4,	%g2,	%sys_tick
	rd	%softint,	%o1
	wrpr	%o3,	0x0AD5,	%tick
	fand	%f0,	%f8,	%f0
	movrne	%g4,	%i5,	%o0
	orncc	%g6,	%l2,	%l6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x391, 	%hsys_tick_cmpr
	umul	%i2,	%l5,	%i3
	fcmpgt32	%f12,	%f0,	%i6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x3CE, 	%hsys_tick_cmpr
	wr	%g0,	0x19,	%asi
	sta	%f16,	[%l7 + 0x18] %asi
	bne,a,pn	%xcc,	loop_320
	rdpr	%wstate,	%o2
	rd	%softint,	%g7
	wr 	%g0, 	0x7, 	%fprs
loop_320:
	te	%icc,	0x3
	fbuge	%fcc3,	loop_321
	rdpr	%tba,	%l4
	rdhpr	%hpstate,	%i0
	wrpr	%i7,	%l0,	%tick
loop_321:
	fpsub32s	%f26,	%f20,	%f6
	udiv	%l3,	0x01FF,	%i1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%g3,	%g5,	%sys_tick
	wr	%o7,	%o4,	%sys_tick
	rdpr	%cleanwin,	%o1
	rdhpr	%hpstate,	%o3
	rd	%ccr,	%g2
	wrpr	%i5,	%g4,	%cwp
	fmul8x16al	%f27,	%f4,	%f20
	ta	%xcc,	0x3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x8AB, 	%hsys_tick_cmpr
	rdhpr	%hsys_tick_cmpr,	%o0
	rd	%softint,	%l6
	rd	%fprs,	%i4
	rd	%fprs,	%l2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x7C2, 	%hsys_tick_cmpr
	for	%f28,	%f18,	%f24
	movvc	%xcc,	%i3,	%i6
	rd	%softint,	%l1
	rd	%asi,	%i2
	wr	%o2,	0x04DE,	%set_softint
	movne	%xcc,	%g7,	%g1
	orncc	%l4,	0x06F0,	%i0
	rd	%pc,	%o6
	movcs	%xcc,	%i7,	%l0
	lduw	[%l7 + 0x24],	%i1
	xorcc	%l3,	0x136C,	%g3
	movrlez	%o5,	%g5,	%o4
	tsubcc	%o1,	%o3,	%g2
	rdpr	%tba,	%o7
	movg	%icc,	%i5,	%g4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%hpstate,	%o0
	rd	%asi,	%i4
	wrpr	%l5,	0x11DD,	%pil
	rdpr	%tl,	%i3
	ldd	[%l7 + 0x50],	%f28
	tpos	%xcc,	0x3
	srl	%i6,	0x08,	%l1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x4B7, 	%tick_cmpr
	tge	%xcc,	0x6
	rdpr	%pil,	%l2
	rdpr	%gl,	%g7
	rd	%softint,	%o2
	rd	%sys_tick_cmpr,	%l4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x5E7, 	%hsys_tick_cmpr
	rdhpr	%hsys_tick_cmpr,	%i0
	edge16ln	%i7,	%o6,	%l0
	rdhpr	%hintp,	%i1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%tl,	%l3
	wrpr	%o5,	%g5,	%tick
	fbge	%fcc1,	loop_322
	wr	%o4,	%o1,	%y
	wrpr	%o3,	0x15E1,	%pil
	ba	loop_323
loop_322:
	wr	%o7,	0x01AE,	%y

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x6A9, 	%hsys_tick_cmpr
	fnegd	%f24,	%f10
loop_323:
	rdhpr	%hintp,	%g6
	edge8ln	%l6,	%o0,	%i4
	rdpr	%cleanwin,	%i5
	rdpr	%canrestore,	%i3
	rdpr	%tl,	%i6
	edge32ln	%l5,	%l1,	%i2
	rdhpr	%hpstate,	%l2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%g7,	0x127A,	%pil
	wr	%i0,	0x0D60,	%set_softint
	rdhpr	%hintp,	%g1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	lduh	[%l7 + 0x62],	%l0
	srax	%i1,	0x05,	%g3
	tvc	%xcc,	0x3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%fprs,	%o5
	fmovde	%xcc,	%f31,	%f23
	srl	%g5,	%o4,	%o1
	wr	%o3,	0x0F90,	%set_softint
	wrpr	%o7,	%g2,	%tick
	fpsub16	%f24,	%f16,	%f4
	rd	%tick_cmpr,	%g4
	movcs	%icc,	%l6,	%o0
	tvc	%icc,	0x0
	fnand	%f26,	%f30,	%f24
	wr	%g6,	%i5,	%ccr
	rd	%asi,	%i4
	movn	%icc,	%i6,	%l5
	wr	%g0,	0x04,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	wrpr	%i3,	%i2,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xE15, 	%hsys_tick_cmpr
	rdpr	%cleanwin,	%o2
	wrpr	%g7,	0x0035,	%cwp
	wr	%i0,	%g1,	%set_softint
        wr    %g0,    0xe,    %pcr    ! changed.
	edge8	%o6,	%l0,	%i1
	wrpr	%g3,	%i7,	%pil
	ldd	[%l7 + 0x48],	%o4
	rdhpr	%hintp,	%l3
	edge32	%g5,	%o4,	%o1
	wr 	%g0, 	0x7, 	%fprs
	fabsd	%f30,	%f16
	rdhpr	%hintp,	%o3
	fxors	%f9,	%f9,	%f8
	wr	%g2,	0x0B24,	%softint
	movcc	%icc,	%g4,	%o0
	brnz	%l6,	loop_324
	tcc	%xcc,	0x7
	rdhpr	%hsys_tick_cmpr,	%i5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
loop_324:
	wrpr	%i6,	0x0454,	%pil
	rdpr	%gl,	%l5
	rdhpr	%hsys_tick_cmpr,	%i3
	wr	%i2,	%l1,	%ccr
	rdhpr	%htba,	%l2
	rdpr	%pil,	%o2
	rdhpr	%hintp,	%i0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	rdpr	%tba,	%g1
	edge16ln	%l4,	%g7,	%l0
	rdhpr	%hintp,	%o6
	movcc	%icc,	%i1,	%g3
	rdhpr	%hpstate,	%o5
	rdhpr	%hsys_tick_cmpr,	%i7
	rdhpr	%hpstate,	%g5
	wr	%o4,	0x135D,	%ccr
	movleu	%icc,	%l3,	%o1
	wrpr	%o3,	%o7,	%cwp
	tle	%xcc,	0x5
	set	0x43, %i6
	lduba	[%l7 + %i6] 0x14,	%g2
	fornot1	%f12,	%f8,	%f26
	wrpr	%g4,	0x11A9,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xDA4, 	%hsys_tick_cmpr
	rdhpr	%hpstate,	%l6
	rd	%asi,	%i4
	wr	%g0,	0x27,	%asi
	ldda	[%l7 + 0x50] %asi,	%i6
	fbo,a	%fcc0,	loop_325
	rdhpr	%hsys_tick_cmpr,	%l5
	wr	%g6,	0x1014,	%pic

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_325:
	wr 	%g0, 	0x6, 	%fprs
	tcc	%icc,	0x1
	rdpr	%tl,	%l2
	wrpr	%i3,	%i0,	%pil
	sll	%o2,	%g1,	%g7
	fmovdneg	%xcc,	%f26,	%f10
	rdpr	%tba,	%l4
	wr	%o6,	0x04A4,	%softint
	rdpr	%tl,	%l0
	fmovrsne	%i1,	%f1,	%f0
	rdhpr	%hpstate,	%g3
	wr	%i7,	%o5,	%y
	rd	%pc,	%g5
	rdhpr	%hintp,	%l3
	fmul8x16al	%f18,	%f30,	%f12
	fnot2s	%f26,	%f24
	wrpr	%o1,	0x1BFD,	%tick
	umulcc	%o4,	%o7,	%g2
	bneg,a	loop_326
	movrgz	%o3,	0x059,	%o0
	wr	%g0,	0xe2,	%asi
	stba	%g4,	[%l7 + 0x71] %asi
	membar	#Sync
loop_326:
	prefetch	[%l7 + 0x30],	 0x3
	rdhpr	%hpstate,	%i5
	wrpr	%l6,	%i4,	%pil
	orncc	%i6,	0x160D,	%g6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fmul8sux16	%f8,	%f26,	%f20
	fone	%f4
	rd	%softint,	%l1
	brz,a	%l2,	loop_327
	fbuge	%fcc2,	loop_328
	movge	%xcc,	%l5,	%i0
	rdhpr	%htba,	%o2
loop_327:
	sub	%g1,	%g7,	%i3
loop_328:
	fmovrse	%l4,	%f13,	%f9
	edge8n	%o6,	%l0,	%g3
	rd	%fprs,	%i7
	sir	0x0CC7
	rdhpr	%hsys_tick_cmpr,	%i1
	wr	%o5,	%l3,	%sys_tick
	array32	%o1,	%o4,	%o7
	set	0x4C, %g6
	stwa	%g5,	[%l7 + %g6] 0x27
	membar	#Sync
	rd	%ccr,	%g2
	rd	%asi,	%o3
	tl	%xcc,	0x0
	wr	%g4,	%o0,	%ccr
	tsubcctv	%l6,	%i5,	%i6
	rdhpr	%hpstate,	%g6
	rdpr	%tl,	%i4
	wrpr	%l1,	0x1F79,	%cwp
	wrpr	%l2,	%l5,	%cwp
	tcs	%xcc,	0x3
	wrpr	%i2,	%i0,	%pil
	fbne	%fcc3,	loop_329
	rdpr	%tl,	%o2
	fmovsne	%xcc,	%f1,	%f14
	wrpr	%g7,	0x09E8,	%tick
loop_329:
	rd	%pc,	%g1
	wr	%i3,	0x1AFD,	%pic
	wrpr	%l4,	%o6,	%cwp
	rdhpr	%hpstate,	%l0
	rdpr	%cleanwin,	%g3
	sth	%i1,	[%l7 + 0x3E]
	fabss	%f7,	%f3
	wr	%o5,	%l3,	%clear_softint
	rdhpr	%hsys_tick_cmpr,	%o1
	add	%i7,	0x10C6,	%o4
	move	%xcc,	%o7,	%g5
        wr    %g0,    0xe,    %pcr    ! changed.
	wr	%g0,	0x11,	%asi
	lduwa	[%l7 + 0x38] %asi,	%g2
	rd	%y,	%g4
	fmovsn	%icc,	%f15,	%f22
	movneg	%icc,	%o0,	%i5
	wrpr	%i6,	%g6,	%cwp
	rdhpr	%hpstate,	%i4
	umulcc	%l6,	0x198A,	%l1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x4E8, 	%hsys_tick_cmpr
	be	loop_330
	wrpr	%i0,	0x04F9,	%pil
	rdhpr	%hintp,	%i2
	movvs	%xcc,	%o2,	%g7
loop_330:
	rdpr	%gl,	%i3
	subc	%g1,	%o6,	%l0
	movrne	%l4,	%i1,	%g3
	fmovrde	%l3,	%f12,	%f8
	orn	%o5,	%o1,	%i7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xF79, 	%hsys_tick_cmpr
	rdpr	%cansave,	%g5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xCB4, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x4D3, 	%hsys_tick_cmpr
	smul	%g4,	0x0D18,	%g2
	fcmpeq16	%f26,	%f22,	%i5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x954, 	%hsys_tick_cmpr
	tgu	%icc,	0x5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%l6,	0x07F5,	%cwp
	te	%icc,	0x4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x9FF, 	%hsys_tick_cmpr
	xnorcc	%l5,	0x095C,	%l2
	wr	%i0,	%l1,	%clear_softint

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	fxnor	%f22,	%f24,	%f16
	movrne	%i2,	0x065,	%g1
	fblg	%fcc3,	loop_331
	bcs	loop_332
	tpos	%xcc,	0x1
	wrpr	%i3,	%o6,	%pil
loop_331:
	tpos	%icc,	0x0
loop_332:
	edge8	%l0,	%i1,	%g3
	rdhpr	%htba,	%l3
	rd	%sys_tick_cmpr,	%o5
	rdhpr	%hintp,	%l4
	rdpr	%canrestore,	%i7
	rdhpr	%htba,	%o1
	rd	%asi,	%g5
	rdpr	%cleanwin,	%o4
	edge16n	%o7,	%g4,	%g2
	wr	%g0,	0x2f,	%asi
	stha	%o3,	[%l7 + 0x68] %asi
	membar	#Sync
	rdpr	%otherwin,	%i5
	wr	%g0,	0xea,	%asi
	ldda	[%l7 + 0x40] %asi,	%i6
	array16	%o0,	%l6,	%g6
	rdpr	%canrestore,	%l5
	fmovdne	%xcc,	%f3,	%f20
	wrpr	%i4,	0x0310,	%cwp
	rd	%tick_cmpr,	%l2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	tn	%xcc,	0x4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xECA, 	%hsys_tick_cmpr
	xor	%g7,	%g1,	%i2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x0A5, 	%hsys_tick_cmpr
	wr	%i1,	0x00C6,	%softint
	wr 	%g0, 	0x4, 	%fprs
	tn	%icc,	0x6
	udiv	%g3,	0x1D07,	%l4
	fmovrdgz	%i7,	%f28,	%f24
	rdhpr	%hintp,	%o5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	mulscc	%o7,	%o4,	%g4
	fcmpne32	%f14,	%f14,	%g2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	movpos	%icc,	%i6,	%l6
	fbu,a	%fcc1,	loop_333
	alignaddr	%g6,	%o0,	%i4
	rdpr	%otherwin,	%l2
	rd	%softint,	%l5
loop_333:
	tvc	%icc,	0x3
	wrpr	%l1,	0x141C,	%cwp
	rdhpr	%hsys_tick_cmpr,	%i0
	fmovde	%xcc,	%f7,	%f10
	wr	%o2,	%g1,	%y
	rd	%ccr,	%g7
	rdhpr	%htba,	%i2
	wrpr	%l0,	%i3,	%pil
	sll	%i1,	0x08,	%o6
	rdpr	%cwp,	%l3
	wr	%l4,	%i7,	%y
	rdpr	%otherwin,	%g3
	rdhpr	%hsys_tick_cmpr,	%o1
	rdpr	%cansave,	%o5
	tl	%xcc,	0x6
	rdpr	%cwp,	%g5
	set	0x10, %g7
	ldda	[%l7 + %g7] 0xea,	%o6
	wr	%o4,	%g4,	%set_softint
	rd	%asi,	%i5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	movpos	%xcc,	%i6,	%o3
	rdhpr	%hsys_tick_cmpr,	%g6
	wr 	%g0, 	0x4, 	%fprs
	movl	%xcc,	%i4,	%l2
	stbar
	movne	%icc,	%l5,	%l1
	rd	%asi,	%l6
	rd	%asi,	%o2
	bleu,a	%icc,	loop_334
	fxnors	%f9,	%f17,	%f0
	addcc	%g1,	%g7,	%i0
	rdpr	%tba,	%i2
loop_334:
	movl	%icc,	%l0,	%i3
	rdhpr	%hsys_tick_cmpr,	%o6
	rdpr	%cwp,	%i1
	stbar
	tvc	%icc,	0x1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x0A6, 	%hsys_tick_cmpr
	wr	%l4,	0x1325,	%pic
	edge32l	%o1,	%o5,	%g5
	set	0x4C, %l5
	lduwa	[%l7 + %l5] 0x0c,	%o7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x376, 	%hsys_tick_cmpr
	rd	%pc,	%g4
	rd	%sys_tick_cmpr,	%g2
	wrpr	%i5,	%o3,	%tick
	rdhpr	%hsys_tick_cmpr,	%i6
	rd	%softint,	%g6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x78E, 	%hsys_tick_cmpr
	srlx	%o0,	%l1,	%l6
	rdpr	%wstate,	%o2
	wr	%g1,	0x07B3,	%set_softint

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xC16, 	%sys_tick_cmpr
	wr 	%g0, 	0x5, 	%fprs

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fmovrdgez	%o6,	%f18,	%f4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xBCA, 	%hsys_tick_cmpr
	rdpr	%canrestore,	%l4
	rdhpr	%htba,	%o1
	rdpr	%canrestore,	%o5
	rd	%fprs,	%l0
	fmovdcs	%icc,	%f25,	%f20
	or	%g5,	%o7,	%g3
	edge32ln	%g4,	%o4,	%g2
	srlx	%i5,	%i6,	%o3
	add	%i4,	0x0962,	%g6
	rdhpr	%hsys_tick_cmpr,	%l2
	movvc	%xcc,	%l1,	%o0
	orncc	%l6,	%g1,	%g7
	rdpr	%tba,	%i0
	rd	%softint,	%o2
	wr	%i2,	0x0B62,	%softint
	tgu	%icc,	0x7
	rdhpr	%hpstate,	%l5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xCF1, 	%hsys_tick_cmpr
	rdpr	%canrestore,	%i3
	flush	%l7 + 0x28
	wrpr	%l4,	0x1A87,	%pil
	rdpr	%pil,	%i7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%wstate,	%l0
	wrpr	%o7,	%g3,	%tick
	wr	%g4,	0x1427,	%sys_tick
	rdhpr	%hsys_tick_cmpr,	%o4
	wr	%g5,	0x02FA,	%softint
	wrpr	%i5,	0x0CCF,	%pil
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bl	%xcc,	loop_335
	fxnor	%f26,	%f2,	%f26
	srl	%g2,	0x1E,	%o3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
loop_335:
	wr	%l2,	%i4,	%pic
	rdhpr	%hintp,	%o0
	fzero	%f26
	movrlz	%l1,	%l6,	%g1
	rdhpr	%hintp,	%g7
	fblg,a	%fcc0,	loop_336
	rdpr	%cleanwin,	%i0
	rd	%tick_cmpr,	%o2
	bleu,a	%xcc,	loop_337
loop_336:
	wrpr	%l5,	0x126B,	%cwp
	umul	%o6,	0x0DDF,	%i2
	rd	%pc,	%i1
loop_337:
	fpsub32	%f6,	%f12,	%f12
	edge16n	%i3,	%l3,	%l4
	udivcc	%i7,	0x003C,	%o5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x533, 	%sys_tick_cmpr
	wr 	%g0, 	0x6, 	%fprs

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%i5,	0x055F,	%sys_tick
	rdpr	%tba,	%g2
	array8	%g4,	%o3,	%g6
	fornot1	%f14,	%f20,	%f0
	xor	%i6,	0x1C8B,	%i4
	fmovsle	%icc,	%f20,	%f20
	movgu	%xcc,	%l2,	%l1
	fmovdge	%icc,	%f1,	%f28
	wrpr	%o0,	0x0280,	%tick
	fornot2s	%f0,	%f22,	%f6
	fnors	%f25,	%f25,	%f5
	rdhpr	%hintp,	%l6
	wr	%g7,	0x0541,	%set_softint
	fnors	%f16,	%f23,	%f30
	rdpr	%wstate,	%i0
	rdhpr	%htba,	%o2
	fandnot2s	%f2,	%f18,	%f21
	movg	%icc,	%l5,	%o6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%l3,	0x0E3C,	%cwp
	and	%l4,	%i7,	%o5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	movcs	%xcc,	%g3,	%o7
	rd	%y,	%o4
	subcc	%g5,	0x0365,	%i5
	te	%icc,	0x4
	rdhpr	%hsys_tick_cmpr,	%g2
	edge16n	%g4,	%o3,	%g6
	rdhpr	%hsys_tick_cmpr,	%i6
	wrpr	%o1,	0x1C02,	%cwp
	rd	%asi,	%l2
	wr	%g0,	0x10,	%asi
	lduba	[%l7 + 0x3D] %asi,	%i4
	rdpr	%tba,	%l1
	brz	%o0,	loop_338
	rdhpr	%hpstate,	%g7
	edge32l	%i0,	%l6,	%l5
	rdpr	%tba,	%o2
loop_338:
	rd	%y,	%g1
	rdpr	%pil,	%i2
	fmovsle	%xcc,	%f20,	%f17
	rd	%asi,	%o6
	wr	%l3,	0x0A0D,	%pic
	fmovsge	%xcc,	%f26,	%f20

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x8ED, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	rdpr	%tba,	%i1
	movvs	%icc,	%l0,	%o7
	rdhpr	%hintp,	%o4
	fsrc2	%f28,	%f4
	wrpr	%g5,	%g3,	%pil
	set	0x58, %i2
	ldswa	[%l7 + %i2] 0x89,	%g2
	sdivcc	%g4,	0x1EB5,	%o3
	edge8ln	%i5,	%g6,	%i6
	wrpr	%o1,	%i4,	%cwp
	st	%f10,	[%l7 + 0x6C]

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x4DC, 	%hsys_tick_cmpr
	addccc	%l1,	%g7,	%i0
	rdpr	%cansave,	%l6
	movneg	%xcc,	%o2,	%g1
	rdhpr	%htba,	%l5
	wr	%o6,	%i2,	%y
	fones	%f31
	rdpr	%wstate,	%l4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fmul8x16al	%f19,	%f15,	%f22
	rd	%asi,	%i3
	wrpr	%l3,	0x1BCF,	%pil
	rdpr	%gl,	%o5
	rdpr	%wstate,	%i1
	bg	%xcc,	loop_339
	bpos,pt	%icc,	loop_340
	movg	%xcc,	%o7,	%o4
	rdhpr	%hintp,	%l0
loop_339:
	movge	%xcc,	%g5,	%g2
loop_340:
	rd	%sys_tick_cmpr,	%g4
	rdpr	%wstate,	%o3
	wrpr	%g3,	0x0A62,	%cwp
	rdhpr	%hintp,	%g6
	rdhpr	%hsys_tick_cmpr,	%i6
	rdpr	%canrestore,	%i5
	rdhpr	%hsys_tick_cmpr,	%o1
	rdpr	%tba,	%l2
	tvc	%xcc,	0x6
	wr	%i4,	0x02F7,	%y
	movneg	%icc,	%l1,	%g7
	rd	%pc,	%i0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x6CA, 	%hsys_tick_cmpr
	wr	%o0,	0x13EB,	%clear_softint
	stw	%l5,	[%l7 + 0x2C]

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xA27, 	%hsys_tick_cmpr
	xnorcc	%i2,	0x15FB,	%o6
	rdhpr	%hsys_tick_cmpr,	%i7
	wrpr	%l4,	0x027B,	%cwp
	te	%xcc,	0x1
	rdhpr	%htba,	%i3
	set	0x69, %o0
	ldsba	[%l7 + %o0] 0x89,	%o5
	fmovrse	%l3,	%f21,	%f23
	wrpr	%o7,	%i1,	%pil
	wr	%l0,	0x0B51,	%softint
	wrpr	%g5,	%o4,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%o3,	%g4,	%tick
	wrpr	%g6,	0x017C,	%tick
	wrpr	%g3,	%i5,	%tick
	tcc	%icc,	0x7
	udiv	%i6,	0x0AE5,	%o1
	rdpr	%cleanwin,	%l2
	set	0x34, %g3
	swapa	[%l7 + %g3] 0x81,	%l1
	wr	%g7,	0x1A95,	%softint
	ldstub	[%l7 + 0x4F],	%i0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x04E, 	%hsys_tick_cmpr
	rd	%softint,	%o2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	movgu	%icc,	%i4,	%g1
	rd	%ccr,	%l5
	rd	%asi,	%i2
	brlez,a	%o6,	loop_341
	wrpr	%i7,	%l4,	%cwp
	wrpr	%o5,	%l3,	%tick
	rdpr	%pil,	%i3
loop_341:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xE38, 	%hsys_tick_cmpr
	rdhpr	%hintp,	%g5
	fblg	%fcc2,	loop_342
	wrpr	%l0,	%g2,	%tick
	tleu	%icc,	0x0
	rd	%tick_cmpr,	%o4
loop_342:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x2A6, 	%hsys_tick_cmpr
	rdhpr	%hintp,	%o3
	wr	%i6,	0x1680,	%y
	wrpr	%l2,	0x02E7,	%tick
	addc	%l1,	0x1E21,	%o1
	andn	%i0,	0x19E6,	%l6
	array16	%o2,	%o0,	%g7
	orncc	%g1,	0x0008,	%l5
	te	%icc,	0x3
	wrpr	%i4,	%o6,	%cwp
	rdhpr	%hintp,	%i7
	wr	%l4,	%i2,	%clear_softint

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	mulscc	%i3,	0x099B,	%l3
	wrpr	%i1,	%g5,	%cwp
	wr	%g0,	0x04,	%asi
	lduha	[%l7 + 0x32] %asi,	%o7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	addc	%o4,	%g6,	%g4
	movvc	%icc,	%i5,	%o3
	fmovdvc	%icc,	%f16,	%f8
	wr	%g0,	0x88,	%asi
	swapa	[%l7 + 0x3C] %asi,	%g3
	rdhpr	%htba,	%l2
	fbo,a	%fcc0,	loop_343
	stbar
	nop
	set	0x19, %l2
	stb	%i6,	[%l7 + %l2]
	fbule	%fcc3,	loop_344
loop_343:
	wr	%l1,	0x162E,	%y
	sdivx	%o1,	0x14F0,	%l6
	rd	%ccr,	%i0
loop_344:
	nop
	wr	%g0,	0x81,	%asi
	stba	%o0,	[%l7 + 0x40] %asi
	rd	%softint,	%g7
	edge16l	%g1,	%o2,	%l5
	fmovscc	%icc,	%f21,	%f6
	fmovspos	%xcc,	%f13,	%f19
	movrgez	%i4,	%i7,	%l4
	wrpr	%o6,	%i2,	%cwp
	rdhpr	%hpstate,	%i3
	wr	%o5,	%i1,	%y
	rdhpr	%hintp,	%g5
	add	%l7,	0x70,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%o7
	casa	[%l6] 0x89,	%o7,	%l3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x96A, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xDEB, 	%hsys_tick_cmpr
	subccc	%g4,	0x12DB,	%g2
	fbg,a	%fcc1,	loop_345
	rdhpr	%hpstate,	%o3
	movge	%xcc,	%g3,	%l2
	rdhpr	%hintp,	%i5
loop_345:
	rdpr	%wstate,	%i6
	ble	loop_346
	rdpr	%cansave,	%o1
	rdhpr	%hpstate,	%l1
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x0
	wr	%g0,	0x20,	%asi
	ldxa	[%g0 + 0x0] %asi,	%l6
loop_346:
	movcs	%xcc,	%i0,	%o0
	rdpr	%cwp,	%g1
	brlez,a	%o2,	loop_347
	fmovsvc	%xcc,	%f4,	%f8

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fmovrslz	%l5,	%f17,	%f18
loop_347:
	wr	%i4,	0x09A6,	%sys_tick
	brgz	%l4,	loop_348
	nop
	setx	loop_349,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fcmps	%fcc2,	%f16,	%f5
	rd	%sys_tick_cmpr,	%o6
loop_348:
	fbue,a	%fcc0,	loop_350
loop_349:
	rdpr	%otherwin,	%i2
	rdhpr	%hpstate,	%i7
	wrpr	%i3,	%i1,	%tick
loop_350:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	movpos	%icc,	%o7,	%l3
	fmovrdgez	%l0,	%f0,	%f28
	rdpr	%tl,	%o4
	udivcc	%g6,	0x1330,	%g5
	srl	%g2,	%g4,	%g3
	movl	%icc,	%l2,	%i5
	rd	%fprs,	%o3
	wrpr	%i6,	%l1,	%pil
	udiv	%o1,	0x0E77,	%i0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	smulcc	%g1,	0x0662,	%o2
	rdpr	%cansave,	%l6
	or	%l5,	%i4,	%l4
	alignaddrl	%g7,	%o6,	%i2
	rdpr	%tba,	%i3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xEFF, 	%tick_cmpr
	rd	%tick_cmpr,	%o7
	set	0x3D, %o2
	ldsba	[%l7 + %o2] 0x0c,	%i1
	rd	%fprs,	%l3
	tsubcc	%o4,	%l0,	%g5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xE16, 	%hsys_tick_cmpr
	brgz,a	%g4,	loop_351
	rd	%ccr,	%g2
	fbule,a	%fcc3,	loop_352
	wr 	%g0, 	0x4, 	%fprs
loop_351:
	rd	%ccr,	%l2
	movpos	%icc,	%o3,	%i6
loop_352:
	ldsw	[%l7 + 0x14],	%l1
	rdhpr	%hsys_tick_cmpr,	%i0
	wr	%o1,	0x163A,	%set_softint
	xnor	%g1,	0x1000,	%o2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fbn	%fcc0,	loop_353
	faligndata	%f22,	%f2,	%f10
	rd	%y,	%l6
	rd	%fprs,	%l5
loop_353:
	subc	%l4,	%g7,	%i4
	mulx	%o6,	%i3,	%i2
	srax	%i7,	0x12,	%o5
	rdpr	%otherwin,	%i1
	edge32ln	%o7,	%l3,	%o4
	rdpr	%pil,	%l0
	rdpr	%gl,	%g6
	movpos	%xcc,	%g5,	%g4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%wstate,	%g3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	tne	%xcc,	0x7
	rdpr	%cleanwin,	%i6
	rdhpr	%hintp,	%l1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xFE3, 	%hsys_tick_cmpr
	wr	%i0,	0x09DD,	%pic
	call	loop_354
	tsubcctv	%g1,	0x033A,	%o0
	wrpr	%o2,	%l6,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_354:
	movneg	%icc,	%l5,	%i4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%ccr,	%i3
	ldsb	[%l7 + 0x4B],	%i7
	rdpr	%cleanwin,	%o5
	taddcctv	%i2,	%o7,	%l3
	brgez,a	%i1,	loop_355
	fnand	%f26,	%f4,	%f28
	rdpr	%otherwin,	%o4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
loop_355:
	orn	%g6,	0x0E53,	%g4
	wrpr	%g5,	%g3,	%tick
	wr	%l2,	%i5,	%pic
	sll	%i6,	%l1,	%g2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xD17, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	mova	%icc,	%g1,	%l6
	rdpr	%tba,	%l4
	rdpr	%tba,	%g7
	rd	%sys_tick_cmpr,	%o2
	wr	%g0,	0xf0,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
	rd	%fprs,	%l5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xA91, 	%hsys_tick_cmpr
	fmovrsgz	%i3,	%f3,	%f2
	wrpr	%i7,	0x04F1,	%pil
	rdpr	%cwp,	%o5
	wrpr	%o6,	0x0323,	%tick
	rdpr	%cleanwin,	%i2
	rdpr	%pil,	%o7
	wrpr	%i1,	%l3,	%tick
	swap	[%l7 + 0x28],	%o4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	andcc	%g5,	%g4,	%g3
	movrgz	%l2,	0x000,	%i6
	fpsub32	%f14,	%f28,	%f30
	taddcc	%i5,	0x06D5,	%g2
	tvs	%xcc,	0x7
	rdpr	%cansave,	%l1
	wr	%o1,	%o3,	%y
	rd	%pc,	%o0
	edge16l	%g1,	%i0,	%l4
	edge32ln	%g7,	%o2,	%l5
	fmovrslz	%i4,	%f0,	%f3
	tgu	%xcc,	0x7
	fcmped	%fcc0,	%f2,	%f28
	movge	%icc,	%l6,	%i7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xE8D, 	%hsys_tick_cmpr
	edge16n	%o7,	%l3,	%i1
	andn	%g6,	%l0,	%o4
	fcmpeq32	%f30,	%f10,	%g5
	movpos	%icc,	%g4,	%l2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x3FD, 	%tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x17E, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%asi,	%o1
	sll	%o0,	%o3,	%g1
	rdhpr	%htba,	%i0
	edge8	%g7,	%o2,	%l4
	wr	%l5,	%i4,	%clear_softint
	wrpr	%l6,	0x0CF9,	%pil
	alignaddr	%i7,	%o6,	%i3
	orncc	%o5,	%i2,	%o7
	nop
	setx loop_356, %l0, %l1
	jmpl %l1, %i1
	movg	%icc,	%l3,	%g6
	rdhpr	%hsys_tick_cmpr,	%l0
	wrpr	%g5,	%g4,	%cwp
loop_356:
	rdpr	%tba,	%o4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x675, 	%hsys_tick_cmpr
	fandnot2s	%f4,	%f24,	%f12
	wrpr	%i6,	0x1C76,	%tick
	ldsw	[%l7 + 0x78],	%i5
	rdpr	%otherwin,	%g3
	popc	0x115F,	%l1
	nop
	setx	loop_357,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	rdpr	%otherwin,	%o1
	sdivx	%o0,	0x10D9,	%g2
	movrlz	%o3,	0x00D,	%g1
loop_357:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xDEB, 	%hsys_tick_cmpr
	xor	%o2,	0x006C,	%g7
	rdpr	%tl,	%l5
	wrpr	%l4,	0x12F9,	%cwp
	wrpr	%l6,	0x1343,	%pil
	rdpr	%cansave,	%i4
	stw	%o6,	[%l7 + 0x74]
	rdpr	%pil,	%i7
	subccc	%o5,	0x1A18,	%i3
	rdhpr	%hpstate,	%o7
	fpadd16	%f30,	%f16,	%f16
	tvc	%icc,	0x1
	srlx	%i1,	0x09,	%l3
	rdpr	%gl,	%g6
	rdhpr	%hpstate,	%i2
	rdpr	%cleanwin,	%g5
	wr	%g0,	0x89,	%asi
	swapa	[%l7 + 0x78] %asi,	%g4
	rdhpr	%htba,	%o4
	rd	%ccr,	%l0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%hpstate,	%l2
	wr	%g3,	0x077E,	%set_softint
	fcmpeq32	%f2,	%f6,	%l1
	taddcc	%i5,	0x05D0,	%o0
	brlz	%g2,	loop_358
	wr	%o1,	0x154D,	%sys_tick
	array8	%o3,	%g1,	%i0
	rdpr	%tl,	%g7
loop_358:
	rdpr	%tba,	%l5
	movrlz	%l4,	0x2B2,	%o2

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
	fmovdle	%icc,	%f6,	%f5
	rdhpr	%hsys_tick_cmpr,	%i7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	tgu	%xcc,	0x4
	fpsub32s	%f17,	%f6,	%f4
	rdpr	%pil,	%o5
	rd	%pc,	%i1
	set	0x40, %o7
	stda	%f16,	[%l7 + %o7] 0x14
	wr	%o7,	0x03A5,	%sys_tick
	movre	%l3,	0x088,	%i2
	wrpr	%g6,	0x158C,	%tick
	rd	%softint,	%g5
	wr	%o4,	0x0865,	%pic
	bvc,a	%xcc,	loop_359
	wr	%l0,	0x0816,	%set_softint
	taddcc	%g4,	0x159A,	%l2
	tl	%icc,	0x5
loop_359:
	wr	%g3,	%i6,	%y
	rdpr	%gl,	%l1
	rdhpr	%hsys_tick_cmpr,	%i5
	fcmple16	%f24,	%f2,	%o0
	fmovrsne	%g2,	%f31,	%f28
	set	0x10, %l1
	stxa	%o3,	[%l7 + %l1] 0x0c
	wr	%g1,	0x0256,	%sys_tick
	membar	#Sync
	wr	%g0,	0x17,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	rdpr	%otherwin,	%o1
	rdpr	%cansave,	%i0
	ta	%icc,	0x0
	fnegd	%f14,	%f16
	rd	%tick_cmpr,	%l5
	fmul8x16	%f27,	%f24,	%f10
	fmovs	%f11,	%f26
	subcc	%g7,	%l4,	%l6
	wrpr	%o2,	0x0750,	%tick
	rdpr	%tl,	%i7
	subc	%i4,	%o6,	%i3
	wrpr	%i1,	0x1D17,	%pil
	fbul	%fcc1,	loop_360
	movrgz	%o7,	0x2CD,	%o5
	wrpr	%l3,	0x08DE,	%pil
	movrlz	%i2,	%g5,	%g6
loop_360:
	movn	%xcc,	%l0,	%o4
	alignaddr	%l2,	%g3,	%g4
	wr	%l1,	0x082B,	%softint

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%canrestore,	%o0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x139, 	%hsys_tick_cmpr
	wr	%g0,	0x80,	%asi
	lduwa	[%l7 + 0x60] %asi,	%o1
	rdhpr	%hpstate,	%i0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xC3C, 	%hsys_tick_cmpr
	udivx	%g1,	0x0500,	%g7
        wr    %g0,    0xe,    %pcr    ! changed.
	movrlez	%o2,	%l4,	%i4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%i3,	%i7,	%tick
	fmovdl	%xcc,	%f1,	%f20
	rdhpr	%htba,	%i1
	mova	%icc,	%o5,	%o7
	wr	%i2,	0x0317,	%softint
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fone	%f4
	rdpr	%cansave,	%g5
	wrpr	%l3,	%l0,	%pil
	rdpr	%canrestore,	%g6
	fba,a	%fcc1,	loop_361
	rdhpr	%hsys_tick_cmpr,	%o4
	rd	%pc,	%l2
	wrpr	%g3,	0x1C1C,	%pil
loop_361:
	fpsub32s	%f9,	%f28,	%f26
	fcmpgt32	%f22,	%f28,	%g4
	wr	%i6,	0x0555,	%y

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	subc	%o3,	%o0,	%g2
	rd	%asi,	%i0
	mova	%xcc,	%l5,	%g1
	bl,pn	%xcc,	loop_362
	movle	%xcc,	%o1,	%l6
	fbne	%fcc1,	loop_363
	tneg	%xcc,	0x1
loop_362:
	rdhpr	%hpstate,	%g7
	rdpr	%wstate,	%l4
loop_363:
	tg	%icc,	0x7
	wr	%o2,	%i4,	%set_softint

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fmovsl	%xcc,	%f17,	%f2
	wrpr	%i7,	%i1,	%tick
	subc	%i3,	0x0E23,	%o7
	rdpr	%cleanwin,	%i2
	rdhpr	%hpstate,	%o5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x2BD, 	%hsys_tick_cmpr
	wrpr	%g6,	%o4,	%tick
	rd	%softint,	%l2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xA79, 	%hsys_tick_cmpr
	wr 	%g0, 	0x4, 	%fprs
	sll	%i5,	0x16,	%o3
	wrpr	%o0,	0x0AC7,	%cwp
	rdpr	%wstate,	%l1
	wrpr	%g2,	%i0,	%cwp
	rd	%y,	%g1
	fmovrde	%l5,	%f10,	%f14
	movn	%icc,	%o1,	%l6
	rdpr	%cleanwin,	%g7
	movrlez	%l4,	0x058,	%o2
	fpsub32	%f18,	%f20,	%f30
	rd	%sys_tick_cmpr,	%i4
	movn	%xcc,	%o6,	%i7
	movre	%i1,	%o7,	%i3
	movn	%xcc,	%i2,	%o5
	sra	%g5,	0x09,	%g6
	rdhpr	%hpstate,	%o4
	edge32l	%l3,	%g3,	%l2
	wr	%l0,	0x18A3,	%softint
	fcmps	%fcc1,	%f3,	%f19
	wr	%g4,	0x0A0D,	%y
	or	%i5,	0x0E34,	%i6
	rd	%tick_cmpr,	%o0
	rd	%fprs,	%l1
	wr	%o3,	%i0,	%softint
	rdhpr	%hpstate,	%g2
	wrpr	%g1,	0x1F7F,	%tick
	fmovsa	%icc,	%f16,	%f25
	bvc,pt	%icc,	loop_364
	alignaddr	%l5,	%o1,	%g7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%htba,	%i4
loop_364:
	rd	%pc,	%o6
	edge8ln	%l4,	%i7,	%o7
	movrgz	%i3,	0x1E3,	%i1
	edge32l	%o5,	%g5,	%g6
	fxors	%f15,	%f17,	%f22
	set	0x30, %g5
	prefetcha	[%l7 + %g5] 0x88,	 0x2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%g3,	%l2,	%y

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xF12, 	%hsys_tick_cmpr
	tne	%icc,	0x6
	movrne	%i2,	0x2BF,	%i5
	addcc	%g4,	0x03EB,	%i6
	wr	%o0,	%l1,	%sys_tick
	wr 	%g0, 	0x7, 	%fprs
	rdhpr	%htba,	%i0
	std	%g2,	[%l7 + 0x08]
	xnorcc	%g1,	0x05B2,	%l5
	wrpr	%o1,	%g7,	%pil
	wrpr	%l6,	%o2,	%cwp
	wrpr	%i4,	0x0084,	%pil
	array16	%o6,	%l4,	%o7
	wr	%i3,	0x17B4,	%set_softint
	fandnot2s	%f22,	%f30,	%f28
	tn	%xcc,	0x5
	xor	%i1,	0x16CF,	%i7
	rd	%softint,	%o5
	rd	%tick_cmpr,	%g6
	andncc	%g5,	%o4,	%g3
	sllx	%l3,	0x1A,	%l0
	fmovsvs	%xcc,	%f27,	%f20
	rdhpr	%hsys_tick_cmpr,	%l2
	rd	%y,	%i5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x097, 	%hsys_tick_cmpr
	te	%xcc,	0x7
	wrpr	%o0,	%l1,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x380, 	%sys_tick_cmpr
	taddcctv	%o3,	0x0689,	%g2
	alignaddrl	%i0,	%g1,	%l5
	umul	%o1,	0x1878,	%l6
	rd	%ccr,	%o2
	brz,a	%g7,	loop_365
	fmovsge	%xcc,	%f21,	%f26
	rdhpr	%hpstate,	%o6
	tge	%xcc,	0x0
loop_365:
	nop
	set	0x58, %i1
	lduwa	[%l7 + %i1] 0x14,	%l4
	movrne	%o7,	0x389,	%i4
	movcs	%icc,	%i1,	%i3
	fmovdg	%xcc,	%f21,	%f25
	wrpr	%o5,	%i7,	%cwp
	wrpr	%g6,	%g5,	%pil
	rdhpr	%hsys_tick_cmpr,	%g3
	fpadd32	%f12,	%f28,	%f24
	rdpr	%wstate,	%o4
	orncc	%l3,	0x0739,	%l0
	smul	%l2,	%i2,	%g4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x03C, 	%hsys_tick_cmpr
	fsrc2s	%f2,	%f14
	nop
	set	0x50, %i4
	ldd	[%l7 + %i4],	%f0
	nop
	set	0x26, %i7
	ldsh	[%l7 + %i7],	%i6
	wrpr	%o3,	%i5,	%cwp
	ldsb	[%l7 + 0x62],	%i0
	wr	%g1,	0x015A,	%clear_softint

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xCAA, 	%hsys_tick_cmpr
	rdhpr	%htba,	%l5
	smul	%l6,	0x1D13,	%o2
	lduh	[%l7 + 0x6A],	%o6
	rd	%pc,	%g7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x95E, 	%hsys_tick_cmpr
	edge32ln	%i1,	%o7,	%i3
	wr 	%g0, 	0x7, 	%fprs
	wrpr	%g6,	%i7,	%pil
	array8	%g5,	%g3,	%o4
	rdhpr	%htba,	%l0
	add	%l7,	0x28,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%l3,	%i2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	membar	0x41

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%otherwin,	%i6
	rdhpr	%htba,	%o0
	fornot2	%f2,	%f28,	%f20
	fcmpgt16	%f30,	%f24,	%i5
	wrpr	%i0,	%g1,	%cwp
	tvs	%xcc,	0x5
	umulcc	%g2,	0x0A63,	%o1
	rdhpr	%hpstate,	%l5
	sdivx	%o3,	0x1235,	%o2
	fmovsleu	%xcc,	%f30,	%f8
	rdpr	%otherwin,	%l6
	wr	%g0,	0x2b,	%asi
	stba	%o6,	[%l7 + 0x6B] %asi
	membar	#Sync
	tpos	%xcc,	0x5
	smulcc	%l4,	%g7,	%i4
	fmovsvs	%icc,	%f27,	%f27
	ble,pt	%icc,	loop_366
	tgu	%icc,	0x1
	wr	%g0,	0x0c,	%asi
	lduwa	[%l7 + 0x58] %asi,	%i1
loop_366:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xA01, 	%hsys_tick_cmpr
	nop
	setx loop_367, %l0, %l1
	jmpl %l1, %g6
	rdpr	%cansave,	%i7
	rd	%tick_cmpr,	%o5
	brz	%g3,	loop_368
loop_367:
	rdpr	%canrestore,	%g5
	fmovsgu	%icc,	%f31,	%f26
	tpos	%icc,	0x4
loop_368:
	sdivx	%l0,	0x0185,	%o4
	rdhpr	%hsys_tick_cmpr,	%l3
	rdpr	%canrestore,	%l2
	bl,a	loop_369
	fornot1	%f0,	%f10,	%f12
	rdhpr	%hintp,	%i2
	fones	%f29
loop_369:
	membar	0x3A
	wrpr	%l1,	0x1E3F,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	movcs	%icc,	%i5,	%i0
	sub	%o0,	0x1DFC,	%g2
	rdhpr	%htba,	%o1
	wrpr	%l5,	0x1B8D,	%pil
	rd	%pc,	%o3
	fexpand	%f27,	%f8
	tleu	%icc,	0x5
	fmovspos	%xcc,	%f10,	%f18
	rdhpr	%hsys_tick_cmpr,	%o2
	fnot1	%f4,	%f6
	rd	%asi,	%g1
	subccc	%o6,	0x0F75,	%l4
	lduh	[%l7 + 0x4A],	%l6
	edge8n	%i4,	%g7,	%i3
	rdpr	%cansave,	%o7
	rd	%softint,	%i1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	edge32	%o5,	%i7,	%g5
	rdpr	%wstate,	%l0
	wr	%g0,	0x04,	%asi
	ldxa	[%l7 + 0x28] %asi,	%g3
	set	0x24, %l3
	stwa	%l3,	[%l7 + %l3] 0x22
	membar	#Sync
	taddcctv	%l2,	0x1D66,	%o4
	rdhpr	%htba,	%i2
	movre	%g4,	0x3AB,	%i6
	rdpr	%wstate,	%l1
	wr	%i5,	0x1F2F,	%softint
	wr	%o0,	%i0,	%set_softint
	fornot2	%f12,	%f6,	%f14
	wr 	%g0, 	0x7, 	%fprs
	wrpr	%l5,	%g2,	%pil
	movre	%o2,	0x338,	%g1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%sys_tick_cmpr,	%l4
	wrpr	%o6,	%i4,	%cwp
	rd	%tick_cmpr,	%l6
	rdhpr	%hintp,	%g7
	wrpr	%o7,	%i1,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x3BE, 	%hsys_tick_cmpr
	tcs	%xcc,	0x2
	rd	%tick_cmpr,	%o5
	taddcc	%i7,	%g5,	%g3
	wrpr	%l0,	%l3,	%cwp
	rdhpr	%hpstate,	%o4
	brlz	%i2,	loop_370
	brnz	%l2,	loop_371
	edge16	%g4,	%i6,	%l1
	array8	%o0,	%i5,	%o1
loop_370:
	mulscc	%i0,	0x08A5,	%l5
loop_371:
	rdpr	%wstate,	%g2
	movre	%g1,	0x2C6,	%o2
	wr	%l4,	%o6,	%softint
	bg,a	loop_372
	bvs,a,pn	%icc,	loop_373
	rdpr	%wstate,	%i4
	rdhpr	%hpstate,	%o3
loop_372:
	wrpr	%g7,	0x0859,	%tick
loop_373:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	rd	%tick_cmpr,	%i3
	rdhpr	%htba,	%i1
	rd	%sys_tick_cmpr,	%g6
	wr	%o5,	%g5,	%pic
	rdpr	%cleanwin,	%i7
	rdpr	%cansave,	%g3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	orcc	%l0,	%i2,	%o4
	flush	%l7 + 0x60
	wr	%g4,	0x0CAA,	%ccr
	taddcctv	%l2,	%l1,	%i6
	ldstub	[%l7 + 0x51],	%o0
	rdhpr	%hsys_tick_cmpr,	%o1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	mulx	%i0,	%l5,	%g2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x7B6, 	%hsys_tick_cmpr
	rdhpr	%hsys_tick_cmpr,	%l4
	rdhpr	%hpstate,	%o6
	rdpr	%otherwin,	%o2
	edge8	%i4,	%o3,	%g7
	alignaddr	%o7,	%i3,	%l6
	wr	%g6,	0x1CA5,	%softint

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x0B5, 	%hsys_tick_cmpr
	rdpr	%tba,	%i1
	tg	%icc,	0x0
	wr	%g5,	0x1AE5,	%y
	movn	%xcc,	%g3,	%l3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%otherwin,	%i7
	edge16ln	%o4,	%i2,	%l2
	addccc	%g4,	0x0F5F,	%i6
	wrpr	%o0,	0x06AB,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xA3A, 	%hsys_tick_cmpr
	rdpr	%gl,	%i5
	rd	%pc,	%o1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x5F1, 	%hsys_tick_cmpr
	umul	%g2,	%g1,	%i0
	rdpr	%tl,	%l4
	mulx	%o6,	%i4,	%o3
	nop
	setx	loop_374,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fpack16	%f20,	%f11
	edge16n	%g7,	%o2,	%o7
	rdpr	%cansave,	%i3
loop_374:
	edge16l	%l6,	%g6,	%i1
	wr	%o5,	%g5,	%ccr
	array32	%l3,	%l0,	%i7
	rdpr	%canrestore,	%g3
	rdhpr	%htba,	%o4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	rdpr	%gl,	%l2
	brgez	%g4,	loop_375
	orcc	%o0,	0x1178,	%l1
	rd	%y,	%i6
	ba,a,pt	%icc,	loop_376
loop_375:
	wr	%o1,	0x192C,	%set_softint
	add	%l7,	0x30,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] %asi,	%l5,	%g2
loop_376:
	rdhpr	%htba,	%i5
	rd	%ccr,	%i0
	fcmpes	%fcc2,	%f25,	%f29
	wr	%g1,	%l4,	%softint
	wrpr	%i4,	0x1B01,	%pil
	movl	%xcc,	%o6,	%o3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x39C, 	%hsys_tick_cmpr
	add	%l7,	0x48,	%l6
	wr	%g0,	0x04,	%asi
	ldxa	[%l6] %asi,	%o2
	casxa	[%l6] %asi,	%o2,	%i3
	wrpr	%o7,	0x17FC,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x9C8, 	%tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x834, 	%hsys_tick_cmpr
	bleu,a,pn	%icc,	loop_377
	rdpr	%pil,	%g5
	rd	%ccr,	%l3
	call	loop_378
loop_377:
	rdhpr	%hsys_tick_cmpr,	%o5
	rdhpr	%htba,	%l0
	movrgez	%g3,	0x108,	%o4
loop_378:
	nop
	wr	%g0,	0x88,	%asi
	ldswa	[%l7 + 0x48] %asi,	%i2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	and	%g4,	0x1B17,	%o0
	edge16ln	%i7,	%i6,	%o1
	rd	%ccr,	%l1
	rd	%tick_cmpr,	%g2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmul8ulx16	%f12,	%f14,	%f0
	movn	%xcc,	%i5,	%l5
	wr	%i0,	%g1,	%softint
	wrpr	%i4,	%l4,	%tick
	or	%o6,	0x1600,	%o3
	fnot1s	%f11,	%f0
	ble	%xcc,	loop_379
	fbule,a	%fcc0,	loop_380
	rd	%tick_cmpr,	%g7
	movrlz	%o2,	%i3,	%o7
loop_379:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xE60, 	%tick_cmpr
loop_380:
	srl	%i1,	%g5,	%l3
	sllx	%o5,	0x15,	%l0
	rdhpr	%hintp,	%l6
	rdpr	%otherwin,	%o4
	rdhpr	%hintp,	%g3
	rdpr	%canrestore,	%i2
	wr	%l2,	%o0,	%sys_tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fcmple32	%f30,	%f10,	%g4
	wr	%g0,	0x80,	%asi
	prefetcha	[%l7 + 0x40] %asi,	 0x2
	rdpr	%otherwin,	%o1
	wrpr	%g2,	0x0319,	%tick
	rd	%sys_tick_cmpr,	%l1
	rd	%sys_tick_cmpr,	%l5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x38C, 	%hsys_tick_cmpr
	set	0x68, %o3
	stda	%i4,	[%l7 + %o3] 0x23
	membar	#Sync
	fbn,a	%fcc3,	loop_381
	mova	%xcc,	%i5,	%l4
	rdhpr	%hintp,	%o6
	bpos,a	%xcc,	loop_382
loop_381:
	udivcc	%g7,	0x0E8D,	%o3
	rd	%softint,	%o2
	rdpr	%pil,	%i3
loop_382:
	addccc	%g6,	0x066F,	%o7
	wr	%i1,	%l3,	%ccr
        wr    %g0,    0xe,    %pcr    ! changed.
	wrpr	%l0,	0x130E,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x504, 	%tick_cmpr
	rd	%fprs,	%o4
	wrpr	%l6,	%g3,	%cwp
	xorcc	%l2,	%o0,	%i7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%i6,	0x10E7,	%tick
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sra	%o1,	0x1C,	%g2
	fmovsvs	%xcc,	%f7,	%f13
	fpmerge	%f28,	%f19,	%f14
	fands	%f1,	%f13,	%f11
	rdpr	%tba,	%g4
	wrpr	%l1,	%i0,	%pil
	rd	%sys_tick_cmpr,	%l5
	edge32	%g1,	%i5,	%l4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	rdpr	%cleanwin,	%o6
	tg	%xcc,	0x0
	tgu	%icc,	0x5
	rdpr	%tba,	%i4
	movrgz	%o3,	%g7,	%i3
	edge8	%o2,	%o7,	%g6
	wr	%i1,	0x0A97,	%sys_tick
	rdhpr	%htba,	%l3
	rdhpr	%hintp,	%o5
	tvc	%icc,	0x1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	bcc	loop_383
	rdhpr	%hsys_tick_cmpr,	%l0
	rd	%sys_tick_cmpr,	%o4
	rdpr	%tl,	%g3
loop_383:
	fbne	%fcc1,	loop_384
	wrpr	%l6,	0x137A,	%cwp
	wrpr	%l2,	%i7,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_384:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	movge	%icc,	%i6,	%g2
	rdpr	%pil,	%g4
	te	%icc,	0x1
	wrpr	%i0,	%l1,	%pil
	rdpr	%gl,	%l5
	fcmpeq32	%f22,	%f22,	%g1
	wr 	%g0, 	0x7, 	%fprs
	fand	%f2,	%f18,	%f0
	te	%icc,	0x1
	rdhpr	%hintp,	%i4
	rdhpr	%hpstate,	%o3
	wr	%g7,	%i3,	%clear_softint
	subcc	%o2,	0x0AB1,	%o7
	rd	%ccr,	%o6
	edge8ln	%g6,	%i1,	%o5
	wr	%g0,	0x80,	%asi
	prefetcha	[%l7 + 0x78] %asi,	 0x3
	move	%xcc,	%g5,	%l0
	wr	%o4,	0x17FF,	%sys_tick
	sth	%l6,	[%l7 + 0x38]
	rd	%fprs,	%l2
	tsubcctv	%g3,	0x1B3A,	%o0
	wrpr	%i7,	0x1827,	%cwp
	rdpr	%otherwin,	%i2
	rdpr	%canrestore,	%o1
	rdhpr	%hsys_tick_cmpr,	%i6
	sllx	%g4,	0x13,	%g2
	rdpr	%tl,	%l1
	rdhpr	%htba,	%i0
	rd	%sys_tick_cmpr,	%l5
	rdpr	%otherwin,	%g1
	wrpr	%i5,	0x0DD3,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fbn	%fcc2,	loop_385
	srlx	%o3,	%l4,	%g7
	wr	%g0,	0x11,	%asi
	lduha	[%l7 + 0x54] %asi,	%o2
loop_385:
	wrpr	%o7,	0x135D,	%pil
	ldx	[%l7 + 0x08],	%i3
	srl	%g6,	0x09,	%o6
	wr	%i1,	%l3,	%y
	umulcc	%g5,	%l0,	%o5
	wr	%l6,	0x1173,	%clear_softint
	rd	%fprs,	%o4
	fmovdleu	%xcc,	%f14,	%f28
	wrpr	%g3,	%l2,	%pil
	fmovrdlez	%o0,	%f4,	%f14
	xorcc	%i7,	%i2,	%o1
	rd	%fprs,	%g4
	call	loop_386
	rd	%pc,	%g2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xA2F, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_386:
	rd	%y,	%l5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	andncc	%l4,	%g7,	%o2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	andcc	%o3,	%o6,	%g6
	wrpr	%i1,	0x1425,	%pil
	wrpr	%l3,	%g5,	%cwp
	wrpr	%l0,	0x1DDE,	%cwp
	rdhpr	%hintp,	%l6
	rd	%tick_cmpr,	%o5
	move	%icc,	%g3,	%o4
	wr	%o0,	%i7,	%ccr
	rd	%ccr,	%l2
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
	rdpr	%otherwin,	%i2
	wrpr	%o1,	%g2,	%pil
	wrpr	%g4,	%l1,	%cwp
loop_387:
	fornot2	%f22,	%f26,	%f30
	rd	%ccr,	%i6
	rd	%asi,	%g1
	brnz,a	%l5,	loop_388
	rdpr	%wstate,	%i5
	wr	%i4,	%l4,	%y
	wrpr	%g7,	%i0,	%tick
loop_388:
	xnorcc	%o2,	%o7,	%i3
	mulx	%o6,	0x1CBF,	%g6
	fba,a	%fcc3,	loop_389
	xor	%i1,	%o3,	%l3
	tge	%icc,	0x4
	movne	%icc,	%g5,	%l6
loop_389:
	wr	%o5,	0x0F48,	%pic
	wrpr	%g3,	0x086B,	%tick
	xnorcc	%l0,	%o0,	%o4
	wrpr	%i7,	%l2,	%cwp
	rdpr	%tl,	%o1
	rdhpr	%htba,	%i2
	sethi	0x11DC,	%g4
	edge32	%l1,	%g2,	%i6
	ldd	[%l7 + 0x78],	%g0
	wr	%i5,	%l5,	%sys_tick
	rdpr	%cansave,	%i4
	wr	%l4,	0x0AB6,	%y
	tg	%icc,	0x6
	wr	%g7,	0x0B03,	%sys_tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x9EE, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	rd	%y,	%i3
	rdhpr	%hintp,	%i1
	mulx	%g6,	%l3,	%o3
	fbo	%fcc1,	loop_390
	fbn,a	%fcc0,	loop_391
	wrpr	%l6,	%g5,	%tick
	rd	%sys_tick_cmpr,	%o5
loop_390:
	edge16	%l0,	%o0,	%o4
loop_391:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	bvs,pn	%xcc,	loop_392
	smulcc	%i7,	0x163E,	%l2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x804, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
loop_392:
	sllx	%l1,	%g2,	%g1
	rdpr	%cwp,	%i5
	wrpr	%l5,	0x0315,	%cwp
	bn,a,pt	%icc,	loop_393
	wr	%i4,	0x0032,	%set_softint
	wrpr	%i6,	0x1288,	%tick
	orn	%g7,	%l4,	%o7
loop_393:
	udivcc	%o2,	0x0DE6,	%i0
	wrpr	%i3,	%i1,	%tick
	rd	%pc,	%g6
	rdpr	%cansave,	%l3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xE6E, 	%tick_cmpr
	sll	%o6,	%l6,	%o5
	siam	0x5
	fbu	%fcc2,	loop_394
	brlez,a	%l0,	loop_395
	tg	%xcc,	0x3
	fnot1s	%f28,	%f17
loop_394:
	rd	%ccr,	%g5
loop_395:
	rdhpr	%hpstate,	%o0
	wrpr	%g3,	0x1C3F,	%pil
	rdpr	%cleanwin,	%i7
	udivcc	%o4,	0x1E13,	%o1
	fbu	%fcc1,	loop_396
	rd	%pc,	%g4
	wrpr	%l2,	0x1EC6,	%pil
	orn	%l1,	0x1A2F,	%g2
loop_396:
	fmul8x16au	%f19,	%f15,	%f6
	wrpr	%i2,	%i5,	%tick
	movre	%g1,	%i4,	%l5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%l4,	0x06D4,	%cwp
	rd	%y,	%o7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%g7,	%i3,	%tick
	sth	%i1,	[%l7 + 0x3C]

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%hsys_tick_cmpr,	%o3
	rdpr	%cwp,	%o6
	sub	%g6,	0x13EB,	%l6
	bvc,a	%xcc,	loop_397
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wrpr	%o5,	%g5,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xA5A, 	%hsys_tick_cmpr
loop_397:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	movre	%o4,	%i7,	%o1
	xorcc	%g4,	%l2,	%g2
	addc	%i2,	0x1659,	%l1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	rd	%asi,	%i4
	wrpr	%i5,	0x09E2,	%pil
	brlez	%i6,	loop_398
	orn	%l4,	%o7,	%l5
	set	0x34, %o1
	swapa	[%l7 + %o1] 0x04,	%o2
loop_398:
	rdhpr	%hpstate,	%i3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	tpos	%xcc,	0x2
	set	0x18, %i3
	stda	%i0,	[%l7 + %i3] 0xe3
	membar	#Sync
	orncc	%l3,	%o6,	%g6
	rd	%pc,	%l6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	rdpr	%gl,	%o5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x5A4, 	%hsys_tick_cmpr
	fandnot1s	%f17,	%f17,	%f5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xBB3, 	%hsys_tick_cmpr
	rdhpr	%hsys_tick_cmpr,	%l0
	rdhpr	%hsys_tick_cmpr,	%i7
	tgu	%xcc,	0x0
	rdhpr	%htba,	%o1
	rdhpr	%hsys_tick_cmpr,	%g4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x408, 	%hsys_tick_cmpr
	wr	%g0,	0x04,	%asi
	lduwa	[%l7 + 0x08] %asi,	%g2
	tg	%icc,	0x5
	wrpr	%l1,	%i2,	%cwp
	rdpr	%cansave,	%g1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x2CD, 	%hsys_tick_cmpr
	rdpr	%cleanwin,	%i6
	be,pt	%xcc,	loop_399
	wr	%l4,	%i4,	%pic
	srl	%l5,	%o2,	%i3
	tneg	%xcc,	0x1
loop_399:
	rdhpr	%htba,	%i1
	tneg	%icc,	0x7
	rdpr	%tba,	%g7
	fnot2	%f28,	%f22
	fmovsvs	%icc,	%f14,	%f19
	rdpr	%otherwin,	%o7
	tvc	%icc,	0x3
	array16	%i0,	%l3,	%g6
	stbar
	wr	%l6,	%o6,	%softint

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xC36, 	%hsys_tick_cmpr
	fcmped	%fcc0,	%f20,	%f4
	fornot2s	%f14,	%f21,	%f27
	wrpr	%o3,	0x1771,	%cwp
	wr	%o5,	0x00A3,	%softint
	movleu	%icc,	%o0,	%g3
	wrpr	%i7,	%l0,	%cwp
	fbge,a	%fcc1,	loop_400
	rd	%y,	%g4
	wrpr	%o1,	%l2,	%cwp
	stx	%o4,	[%l7 + 0x78]
loop_400:
	subc	%g2,	%i2,	%g1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x5BA, 	%hsys_tick_cmpr
	rdpr	%tl,	%l1
	rdhpr	%hintp,	%i6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x568, 	%hsys_tick_cmpr
	fpsub16s	%f28,	%f1,	%f7
	andn	%l4,	0x06C8,	%o2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%g7,	0x1AC4,	%clear_softint
	rdhpr	%hsys_tick_cmpr,	%o7
	fpsub16	%f4,	%f28,	%f12
	rd	%asi,	%i0
	wrpr	%l3,	0x1893,	%tick
	movvs	%xcc,	%g6,	%i1
	fcmpeq32	%f0,	%f14,	%o6
	rdpr	%canrestore,	%g5
	rdhpr	%htba,	%o3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x59F, 	%hsys_tick_cmpr
	movpos	%icc,	%g3,	%o5
	rdhpr	%hintp,	%l0
	wr	%g4,	%o1,	%set_softint
	rd	%tick_cmpr,	%i7
	addcc	%l2,	%o4,	%i2
	rdhpr	%htba,	%g1
	bleu,a,pt	%xcc,	loop_401
	fmovsn	%icc,	%f20,	%f2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x147, 	%hsys_tick_cmpr
loop_401:
	nop
	set	0x20, %o6
	lduwa	[%l7 + %o6] 0x88,	%i6
	fcmpgt32	%f8,	%f0,	%i4
	rdpr	%tl,	%l4
	rdhpr	%htba,	%o2
	rdpr	%pil,	%l5
	rdhpr	%hintp,	%g7
	tne	%icc,	0x6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x881, 	%hsys_tick_cmpr
	set	0x40, %l0
	ldda	[%l7 + %l0] 0x80,	%g6
	subccc	%i0,	0x11D6,	%o6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x7ED, 	%sys_tick_cmpr
	wrpr	%l6,	0x0B6B,	%tick
	fmovscs	%xcc,	%f5,	%f31
	ldd	[%l7 + 0x70],	%f2
	wr	%o0,	0x0D40,	%y
	tl	%xcc,	0x4
	tvc	%xcc,	0x2
	edge16l	%g3,	%o3,	%l0
	rd	%asi,	%o5
	wr	%g0,	0x19,	%asi
	stba	%g4,	[%l7 + 0x52] %asi
	wr	%i7,	0x0468,	%set_softint
	set	0x63, %g4
	ldstuba	[%l7 + %g4] 0x89,	%o1
	wr	%g0,	0x2c,	%asi
	ldda	[%l7 + 0x70] %asi,	%o4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x69F, 	%hsys_tick_cmpr
	rdhpr	%hpstate,	%i2
	rdpr	%gl,	%i5
	rd	%pc,	%l1
	rd	%softint,	%i6
	rd	%softint,	%g2
	wrpr	%l4,	%o2,	%cwp
	wrpr	%l5,	%i4,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xB73, 	%hsys_tick_cmpr
	wrpr	%i3,	0x1FAD,	%cwp
	sethi	0x0630,	%g7
	rd	%softint,	%l3
        wr    %g0,    0xe,    %pcr    ! changed.
	wr	%o6,	%g6,	%y
	edge8	%g5,	%l6,	%o0
	sdiv	%i1,	0x0454,	%g3
	rdpr	%cansave,	%o3
	fmovsl	%icc,	%f17,	%f30
	orncc	%o5,	%l0,	%g4
	edge16l	%o1,	%o4,	%l2
	wr	%g0,	0x88,	%asi
	sta	%f31,	[%l7 + 0x08] %asi
	fbl	%fcc0,	loop_402
	tcc	%icc,	0x0
	rd	%asi,	%g1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xC04, 	%hsys_tick_cmpr
loop_402:
	andncc	%l1,	%i6,	%g2
	wr	%l4,	0x1A2E,	%sys_tick
	rdpr	%tl,	%i2
        wr    %g0,    0xe,    %pcr    ! changed.
	rdpr	%gl,	%o7
	popc	0x1061,	%i4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xF83, 	%hsys_tick_cmpr
	edge32l	%g7,	%i0,	%g6
	udivx	%g5,	0x028F,	%o6
	movrgez	%o0,	0x077,	%l6
	wrpr	%g3,	%o3,	%tick
	std	%o4,	[%l7 + 0x48]
	wr	%l0,	%i1,	%set_softint
	udiv	%g4,	0x133A,	%o1
	rd	%sys_tick_cmpr,	%l2
	wr	%g0,	0xe2,	%asi
	stda	%g0,	[%l7 + 0x38] %asi
	membar	#Sync
	rdhpr	%hintp,	%i7
	wr	%g0,	0x81,	%asi
	swapa	[%l7 + 0x18] %asi,	%o4
	rdhpr	%hsys_tick_cmpr,	%i5
	rdpr	%otherwin,	%l1
	movge	%xcc,	%g2,	%i6
	rd	%asi,	%i2
	rd	%softint,	%o2
	movrgz	%l4,	%o7,	%i4
	wrpr	%l5,	%l3,	%cwp
	wrpr	%i3,	0x185A,	%pil
	ldd	[%l7 + 0x30],	%g6
	wr	%i0,	0x1274,	%ccr
	membar	0x04

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xEF6, 	%hsys_tick_cmpr
	wrpr	%o0,	%l6,	%cwp
	umul	%g3,	%o6,	%o3
	rd	%ccr,	%o5
	wr	%l0,	%i1,	%pic
	fmovdpos	%xcc,	%f16,	%f27
	rdpr	%pil,	%g4
	movvs	%icc,	%l2,	%g1
	wrpr	%i7,	0x1A79,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x5A2, 	%hsys_tick_cmpr
	wr	%o4,	%g2,	%pic
	movrlz	%l1,	%i2,	%i6
	wr	%l4,	%o7,	%clear_softint
	sdiv	%o2,	0x1673,	%l5
	std	%i4,	[%l7 + 0x30]
	xnor	%i3,	0x1C3C,	%l3
	wr	%g0,	0x81,	%asi
	stba	%g7,	[%l7 + 0x2C] %asi

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%tba,	%g6
	fbge,a	%fcc2,	loop_403
	lduh	[%l7 + 0x0A],	%o0
	rd	%tick_cmpr,	%g5
	sdivcc	%g3,	0x1768,	%l6
loop_403:
	rd	%y,	%o3
	movneg	%icc,	%o6,	%l0
        wr    %g0,    0xe,    %pcr    ! changed.
	smulcc	%i1,	0x0A1F,	%g1
	rdpr	%otherwin,	%i7
	set	0x34, %i5
	sta	%f24,	[%l7 + %i5] 0x18
	rdhpr	%hpstate,	%o1
	movneg	%icc,	%i5,	%o4
	wrpr	%g2,	%l1,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	bg,a,pn	%xcc,	loop_404
	lduh	[%l7 + 0x3A],	%i2
	rd	%sys_tick_cmpr,	%i6
	rdpr	%otherwin,	%l4
loop_404:
	nop
	set	0x70, %o5
	ldswa	[%l7 + %o5] 0x11,	%o7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xD89, 	%sys_tick_cmpr
	movl	%xcc,	%l5,	%i3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fmovsn	%xcc,	%f21,	%f10
	tcc	%xcc,	0x6
	edge32	%g7,	%i4,	%g6
	mulscc	%o0,	0x083C,	%g5
	fbug	%fcc1,	loop_405
	wr 	%g0, 	0x7, 	%fprs

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xC97, 	%hsys_tick_cmpr
	movl	%xcc,	%o3,	%o6
loop_405:
	fbne	%fcc3,	loop_406
	sdiv	%l6,	0x0453,	%l0
	rdpr	%gl,	%o5
	rdpr	%wstate,	%i1
loop_406:
        wr    %g0,    0xe,    %pcr    ! changed.
	fmovsle	%icc,	%f31,	%f2
	rd	%pc,	%g4
	movleu	%xcc,	%o1,	%i7
	tpos	%xcc,	0x6
	edge8n	%o4,	%g2,	%l1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	xor	%i6,	%i5,	%l4
	wrpr	%o7,	0x1765,	%cwp
	orcc	%o2,	%l5,	%i3
	wrpr	%l3,	0x1204,	%pil
	wrpr	%i4,	%g7,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	brz,a	%o0,	loop_407
	sir	0x01FE
	wr	%g5,	0x0BC2,	%clear_softint
	rdpr	%cansave,	%g3
loop_407:
	move	%xcc,	%o3,	%i0
	rd	%sys_tick_cmpr,	%o6
	move	%xcc,	%l6,	%o5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	edge8	%l0,	%g1,	%g4
	wrpr	%i7,	%o4,	%pil
	bgu,a,pt	%xcc,	loop_408
	mulx	%g2,	%o1,	%l2
	edge16n	%l1,	%i6,	%i5
	rdpr	%tl,	%l4
loop_408:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%o2,	%i2,	%softint
        wr    %g0,    0xe,    %pcr    ! changed.

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%cleanwin,	%g5
	rdhpr	%hintp,	%g3
	fmovspos	%icc,	%f0,	%f23
	wr	%o3,	0x0524,	%y
	add	%l7,	0x70,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%i0,	%g7
	edge16ln	%o6,	%o5,	%i1
	rd	%sys_tick_cmpr,	%l0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	membar	0x01
	rdhpr	%htba,	%g1
	movvs	%icc,	%g4,	%o4
	udivcc	%g2,	0x0F94,	%o1
	rd	%sys_tick_cmpr,	%i7
	wrpr	%l2,	0x1800,	%tick
	rdhpr	%hintp,	%i6
	taddcctv	%l1,	%i5,	%o7
	wrpr	%l4,	%o2,	%cwp
	rd	%fprs,	%l5
	rd	%asi,	%i3
	tcs	%icc,	0x6
	rd	%sys_tick_cmpr,	%i4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	sir	0x142D
	rd	%ccr,	%l3
	be,pn	%xcc,	loop_409
	wr	%o0,	0x0615,	%ccr
	wr 	%g0, 	0x7, 	%fprs
	rdhpr	%hpstate,	%g6
loop_409:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%o3,	0x16A5,	%y
	wr	%g7,	%i0,	%y
	alignaddrl	%o5,	%o6,	%l0
	rdpr	%tba,	%l6
	rdpr	%gl,	%g1
	wrpr	%g4,	%i1,	%tick
	rdpr	%wstate,	%g2
	wr	%g0,	0x04,	%asi
	lduwa	[%l7 + 0x2C] %asi,	%o1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xF8D, 	%hsys_tick_cmpr
        wr    %g0,    0xe,    %pcr    ! changed.
	wr	%o4,	%l1,	%pic
	wrpr	%o7,	%l4,	%tick
	rdpr	%cansave,	%o2
	membar	0x62
	ldd	[%l7 + 0x30],	%i4
	rd	%ccr,	%i3
	stb	%i4,	[%l7 + 0x71]
	fmovdcc	%xcc,	%f28,	%f2
	srax	%i2,	%l5,	%o0
	rdhpr	%hsys_tick_cmpr,	%g5
	fabss	%f0,	%f13
	fmovdl	%icc,	%f5,	%f19
	sdivcc	%g6,	0x1C69,	%l3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xCD2, 	%hsys_tick_cmpr
	ba,a,pt	%icc,	loop_410
	wrpr	%i0,	%g7,	%pil
	rd	%sys_tick_cmpr,	%o6
	tg	%icc,	0x6
loop_410:
	rd	%fprs,	%o5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	set	0x3C, %l6
	ldswa	[%l7 + %l6] 0x11,	%g1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	srlx	%g4,	0x0C,	%o1
	wrpr	%l2,	0x1C7F,	%cwp
	wr	%i6,	0x06C9,	%ccr
	edge32ln	%i7,	%o4,	%l1
	wr 	%g0, 	0x6, 	%fprs
	edge32	%o2,	%i5,	%i3
	array16	%i4,	%l5,	%o0
	addcc	%g5,	0x1779,	%g6
	fbu	%fcc3,	loop_411
	fmuld8ulx16	%f6,	%f0,	%f26
	rdhpr	%htba,	%i2
	rd	%softint,	%l3
loop_411:
	tgu	%xcc,	0x7
	movcs	%xcc,	%o3,	%g3
	fmovscc	%xcc,	%f5,	%f20
	brnz	%i0,	loop_412
	wrpr	%g7,	0x0456,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xAAF, 	%hsys_tick_cmpr
	fblg,a	%fcc3,	loop_413
loop_412:
	wr	%l6,	0x119B,	%y

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%htba,	%l0
loop_413:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x5B8, 	%hsys_tick_cmpr
	fbl	%fcc2,	loop_414
	xorcc	%o1,	0x0220,	%g4
	umul	%l2,	0x1F56,	%i7
	wrpr	%o4,	%i6,	%pil
loop_414:
	sdiv	%o7,	0x0366,	%l1
	mulscc	%l4,	%i5,	%i3
	umulcc	%i4,	%o2,	%o0
	alignaddr	%l5,	%g5,	%i2
	srl	%l3,	%g6,	%o3
	wr	%g0,	0x81,	%asi
	lda	[%l7 + 0x40] %asi,	%f26
!Yo - got one - imm_asi 0x21 
!And yo - immediate is 0x108
	wr	%g0,	0x21,	%asi
	ldxa	[%g0 + 0x108] %asi,	%g3
	xnorcc	%i0,	0x17FB,	%o5
	add	%g7,	0x08CA,	%l6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	array8	%g1,	%g2,	%i1
	rd	%sys_tick_cmpr,	%g4
	fornot2s	%f4,	%f5,	%f4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xC4B, 	%hsys_tick_cmpr
	movvc	%xcc,	%l2,	%i7
	wrpr	%i6,	%o4,	%pil
	bshuffle	%f12,	%f26,	%f18
	wrpr	%l1,	%o7,	%pil
	wrpr	%i5,	%i3,	%cwp
	alignaddrl	%i4,	%l4,	%o0
	fbu	%fcc2,	loop_415
	rd	%asi,	%l5
	fxnor	%f26,	%f10,	%f22
	wr	%o2,	0x1572,	%pic
loop_415:
	movg	%icc,	%i2,	%g5
	movneg	%icc,	%l3,	%o3
	fcmps	%fcc3,	%f17,	%f20
	rdhpr	%hsys_tick_cmpr,	%g6
	rd	%y,	%g3
	wr	%g0,	0x81,	%asi
	lduha	[%l7 + 0x28] %asi,	%i0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x63F, 	%hsys_tick_cmpr
	edge16ln	%g7,	%o6,	%g1
	rd	%fprs,	%l0
	sllx	%i1,	%g4,	%o1
	rdpr	%tl,	%g2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	bgu	%xcc,	loop_416
	rdpr	%cansave,	%i7
	rdpr	%tba,	%l1
	wrpr	%o4,	0x09BB,	%tick
loop_416:
	xnorcc	%i5,	%i3,	%i4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fcmple32	%f30,	%f16,	%o0
	rd	%sys_tick_cmpr,	%l5
	alignaddrl	%l4,	%i2,	%o2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	array8	%g6,	%g3,	%i0
	wr 	%g0, 	0x5, 	%fprs
	srl	%l6,	%o5,	%g7
	lduh	[%l7 + 0x30],	%o6
	ldx	[%l7 + 0x50],	%g1
	srl	%l0,	%i1,	%g4
	fcmpes	%fcc2,	%f16,	%f18
	rdhpr	%hpstate,	%g2
	rdhpr	%htba,	%l2
	add	%i6,	%i7,	%o1
	rdhpr	%hintp,	%o4
	fcmpeq16	%f14,	%f22,	%l1
	fornot2s	%f27,	%f24,	%f6
	rd	%pc,	%i5
	rd	%asi,	%i3
	rd	%tick_cmpr,	%i4
	movn	%xcc,	%o0,	%l5
	wrpr	%l4,	0x00C1,	%tick
	for	%f18,	%f12,	%f4
	wrpr	%o7,	0x024D,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xE47, 	%tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xF73, 	%hsys_tick_cmpr
	fornot1	%f4,	%f30,	%f30
	wrpr	%g6,	0x150D,	%pil
	fbule,a	%fcc1,	loop_417
	rd	%asi,	%l3
	mulx	%g3,	0x13AD,	%i0
	xnorcc	%o3,	0x1C79,	%l6
loop_417:
	wrpr	%g7,	0x0AF9,	%tick
	rdhpr	%hintp,	%o6
	tcc	%xcc,	0x4
	smul	%o5,	%l0,	%i1
	wrpr	%g4,	%g2,	%cwp
	mulx	%l2,	%i6,	%i7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xEEF, 	%hsys_tick_cmpr
	sll	%o1,	0x13,	%l1
	movg	%icc,	%o4,	%i5
	mova	%icc,	%i4,	%i3
	rdpr	%wstate,	%l5
	fpadd32	%f8,	%f20,	%f6
	nop
	setx	loop_418,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tsubcctv	%l4,	%o0,	%o2
	fbule,a	%fcc1,	loop_419
	edge16	%i2,	%g5,	%o7
loop_418:
	rdpr	%pil,	%g6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_419:
	rdhpr	%hsys_tick_cmpr,	%g3
	rd	%fprs,	%i0
	wr	%o3,	%g7,	%y
	and	%l6,	%o6,	%o5
	fpsub16s	%f4,	%f26,	%f3
	wrpr	%l0,	%i1,	%cwp
	rd	%softint,	%g2
	wr	%g4,	0x1CB3,	%clear_softint
	rdhpr	%htba,	%l2
	udivcc	%i7,	0x0090,	%i6
	wrpr	%o1,	%l1,	%cwp
	rdhpr	%htba,	%g1
	movg	%icc,	%i5,	%i4
	fblg	%fcc2,	loop_420
	rdpr	%cwp,	%o4
	mulx	%i3,	%l5,	%o0
	alignaddr	%o2,	%l4,	%g5
loop_420:
	and	%o7,	0x1E4B,	%g6
	wrpr	%i2,	0x1914,	%pil
	wrpr	%l3,	%g3,	%cwp
	wrpr	%i0,	%g7,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x938, 	%hsys_tick_cmpr
	tne	%icc,	0x6
	stw	%o5,	[%l7 + 0x24]
	brgz	%l0,	loop_421
	wr	%i1,	%l6,	%ccr
	wr	%g4,	%g2,	%clear_softint
	wrpr	%l2,	0x1E7A,	%tick
loop_421:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%fprs,	%i6
	edge16ln	%l1,	%g1,	%o1
	fmovdneg	%xcc,	%f16,	%f21
	rdhpr	%htba,	%i4
	fmovsgu	%xcc,	%f0,	%f14
	fcmpgt16	%f28,	%f10,	%o4
	rdpr	%otherwin,	%i5
	smulcc	%i3,	0x0489,	%l5
	rd	%pc,	%o0
	wr	%o2,	%g5,	%set_softint
	alignaddrl	%o7,	%g6,	%i2
	fbuge	%fcc0,	loop_422
	rdpr	%pil,	%l3
	rdpr	%tl,	%l4
	fcmpes	%fcc1,	%f10,	%f15
loop_422:
	fcmpne16	%f20,	%f22,	%i0
	rd	%fprs,	%g3
	rdhpr	%hsys_tick_cmpr,	%g7
	sdivx	%o6,	0x1396,	%o5
	rd	%ccr,	%o3
	fbn,a	%fcc3,	loop_423
	wr	%i1,	0x121F,	%ccr
	wrpr	%l0,	0x1319,	%tick
	fbu,a	%fcc1,	loop_424
loop_423:
	fcmpgt16	%f10,	%f4,	%g4
	rd	%sys_tick_cmpr,	%g2
	rdpr	%cansave,	%l2
loop_424:
	wr	%l6,	%i6,	%y
	smul	%i7,	%l1,	%g1
	rdpr	%cansave,	%i4
	rdpr	%cansave,	%o4
	rdpr	%otherwin,	%o1
	rdpr	%cleanwin,	%i5
	fmovscc	%icc,	%f20,	%f22
	fnegs	%f19,	%f8
	smulcc	%i3,	%o0,	%l5
	edge8n	%g5,	%o7,	%o2
	membar	0x48

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	tvs	%xcc,	0x6
	rd	%y,	%g6
	wrpr	%l3,	%l4,	%tick
	smul	%i0,	0x0CB6,	%g3
	fornot1	%f0,	%f20,	%f14
	wrpr	%o6,	%o5,	%pil
	rdpr	%cansave,	%o3
	rdpr	%cleanwin,	%i1
	movrne	%l0,	%g7,	%g2
	rdpr	%cleanwin,	%g4
	move	%icc,	%l2,	%l6
	rd	%y,	%i7
	movl	%icc,	%l1,	%g1
	wrpr	%i6,	%o4,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%hpstate,	%i5
	mulscc	%i3,	0x011C,	%o0
	rdhpr	%hpstate,	%l5
	taddcctv	%g5,	0x03A4,	%o1
	wrpr	%o2,	0x0F99,	%tick
	fpack16	%f2,	%f12
	tn	%xcc,	0x7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x134, 	%hsys_tick_cmpr
	fble	%fcc3,	loop_425
	edge8n	%g6,	%l3,	%i2
	rdpr	%canrestore,	%l4
	ldx	[%l7 + 0x10],	%g3
loop_425:
	wr	%i0,	0x0CDA,	%set_softint
	rdpr	%tl,	%o5
	rdpr	%gl,	%o3
	rdpr	%gl,	%i1
	movn	%xcc,	%l0,	%o6
	array16	%g7,	%g4,	%g2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xB0D, 	%hsys_tick_cmpr
	fzero	%f4
	fnand	%f6,	%f8,	%f28
	sdiv	%i7,	0x0556,	%l1
	tne	%xcc,	0x6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x847, 	%hsys_tick_cmpr
	fpadd16s	%f10,	%f27,	%f26
	wr	%g0,	0x10,	%asi
	ldda	[%l7 + 0x10] %asi,	%o4
	wr	%g0,	0x19,	%asi
	ldda	[%l7 + 0x40] %asi,	%i4
	rdhpr	%hpstate,	%i5
	wr	%o0,	0x011D,	%clear_softint
	move	%xcc,	%l5,	%i3
	rdhpr	%hpstate,	%g5
	rdpr	%tl,	%o1
	fnot2	%f30,	%f26
	fpack32	%f28,	%f8,	%f28
	wr	%o2,	0x0B90,	%sys_tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x514, 	%hsys_tick_cmpr
	fmovsg	%xcc,	%f31,	%f29

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	rdpr	%wstate,	%l3
	rdhpr	%hpstate,	%g3
	add	%l7,	0x74,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%l4
	casa	[%l6] %asi,	%l4,	%i0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%hpstate,	%i1
	movvc	%icc,	%o6,	%g7
	tge	%icc,	0x0
	smul	%l0,	%g4,	%g2
	fpadd16s	%f0,	%f31,	%f30
	fabsd	%f22,	%f18
	fands	%f23,	%f12,	%f18
	wrpr	%l2,	%i7,	%cwp
	movpos	%icc,	%l6,	%i6
	rdpr	%otherwin,	%l1
	rd	%softint,	%g1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%hpstate,	%o0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	array32	%i3,	%g5,	%o2
	rd	%softint,	%g6
	set	0x40, %i0
	stda	%f16,	[%l7 + %i0] 0x1e
	membar	#Sync
	rdhpr	%hintp,	%o7
	wrpr	%o1,	%l3,	%cwp
	wrpr	%g3,	%l4,	%pil
	wr 	%g0, 	0x6, 	%fprs
	tl	%xcc,	0x0
	wr	%o3,	0x011A,	%pic
	rdhpr	%hpstate,	%o5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	ldub	[%l7 + 0x66],	%i0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x3B1, 	%hsys_tick_cmpr
	rdhpr	%hsys_tick_cmpr,	%g4
	mulx	%l2,	0x02CB,	%g2
	rdpr	%cleanwin,	%l6
	fmul8sux16	%f16,	%f10,	%f26
	membar	#Sync
	set	0x40, %l4
	ldda	[%l7 + %l4] 0x1e,	%f16
	rdhpr	%hintp,	%i7
	sllx	%l1,	0x05,	%i6
	rd	%pc,	%g1
	wr	%o4,	%i4,	%clear_softint
	mulscc	%l5,	0x146E,	%o0
	wrpr	%i5,	0x08B5,	%tick
	fcmpgt32	%f26,	%f18,	%g5
	bn	loop_426
	add	%o2,	0x1D17,	%g6
	fbl	%fcc2,	loop_427
	rd	%ccr,	%i3
loop_426:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xFF7, 	%hsys_tick_cmpr
	fmovrsne	%l3,	%f13,	%f28
loop_427:
	fmuld8sux16	%f8,	%f0,	%f10
	rdhpr	%htba,	%l4
	movg	%xcc,	%g3,	%o3
	rd	%fprs,	%o5
	rd	%fprs,	%i1
	wr	%i0,	%i2,	%sys_tick
	fnand	%f6,	%f6,	%f30
	wr 	%g0, 	0x7, 	%fprs
	rd	%pc,	%l0
	swap	[%l7 + 0x40],	%g4
	rdhpr	%hsys_tick_cmpr,	%l2
	rdpr	%tl,	%g2
	tl	%icc,	0x2
	wr	%l6,	%l1,	%y
	tsubcc	%i7,	0x167C,	%i6
	movge	%xcc,	%g1,	%o4
	alignaddr	%i4,	%l5,	%o0
	mulscc	%i5,	%g5,	%g6
	wrpr	%i3,	0x104E,	%tick
	wr	%o2,	%o7,	%ccr
	fbe,a	%fcc1,	loop_428
	movrne	%o1,	%l3,	%l4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%pil,	%i1
loop_428:
	rdpr	%gl,	%i0
	wrpr	%o3,	%o6,	%pil
	wr	%i2,	%l0,	%ccr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%g2,	%l6,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	xnorcc	%i7,	0x189B,	%i6
	rd	%softint,	%l2
	rd	%softint,	%g1
	bn,pt	%icc,	loop_429
	rdpr	%tba,	%o4
	wrpr	%i4,	%l5,	%pil
	wr	%i5,	0x1CAB,	%clear_softint
loop_429:
	rdhpr	%hsys_tick_cmpr,	%g5
	wr	%o0,	0x0386,	%ccr
	wrpr	%i3,	0x1708,	%tick
	tvc	%xcc,	0x0
	wrpr	%g6,	0x0647,	%tick
	fmul8x16al	%f19,	%f20,	%f18
	nop
	setx	loop_430,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	rd	%y,	%o7
	rdhpr	%hsys_tick_cmpr,	%o1
	mulscc	%o2,	0x105A,	%l3
loop_430:
	movre	%g3,	0x3AD,	%l4
	rd	%fprs,	%i1
	nop
	set	0x7C, %g1
	ldsb	[%l7 + %g1],	%o5
	ldub	[%l7 + 0x0B],	%i0
	movgu	%icc,	%o6,	%i2
	movl	%xcc,	%o3,	%l0
	wrpr	%g4,	%g2,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x0EB, 	%hsys_tick_cmpr
	sdivx	%g7,	0x1196,	%l1
	wrpr	%i6,	%i7,	%cwp
	fbuge,a	%fcc2,	loop_431
	wrpr	%l2,	0x0340,	%cwp
	nop
	setx loop_432, %l0, %l1
	jmpl %l1, %o4
	smul	%i4,	0x0D31,	%g1
loop_431:
	movre	%i5,	0x2A1,	%g5
	rdpr	%gl,	%l5
loop_432:
	fcmpeq16	%f22,	%f4,	%o0
	brnz,a	%i3,	loop_433
	ldd	[%l7 + 0x08],	%g6
	rdpr	%pil,	%o7
	sdivx	%o2,	0x1D43,	%l3
loop_433:
	fmovrdlz	%o1,	%f4,	%f4
	wrpr	%g3,	0x1577,	%pil
	rdhpr	%htba,	%l4
	rdhpr	%hintp,	%o5
	wrpr	%i0,	0x04DD,	%cwp
	tcc	%icc,	0x4
	rdhpr	%htba,	%i1
	rdpr	%cwp,	%o6
	rdhpr	%hpstate,	%i2
	rdhpr	%hpstate,	%o3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x096, 	%hsys_tick_cmpr
	tn	%icc,	0x4
	wr 	%g0, 	0x4, 	%fprs
	rd	%tick_cmpr,	%g7
	taddcctv	%l6,	%i6,	%l1
	movleu	%xcc,	%l2,	%i7
	fbg	%fcc3,	loop_434
	rdhpr	%hpstate,	%i4
	wrpr	%g1,	0x1220,	%pil
	wrpr	%i5,	0x1549,	%pil
loop_434:
	fmovsne	%xcc,	%f18,	%f19
	rdpr	%gl,	%o4
	wr	%g5,	0x1220,	%sys_tick
	rdpr	%tba,	%o0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fors	%f0,	%f17,	%f2
	wr 	%g0, 	0x5, 	%fprs
	rdpr	%otherwin,	%o2
	rd	%tick_cmpr,	%l3
	sllx	%g3,	%o1,	%l4
	wrpr	%i0,	%o5,	%cwp
	wrpr	%o6,	0x0779,	%tick
	sra	%i2,	0x1F,	%i1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xBBC, 	%hsys_tick_cmpr
	rd	%softint,	%g2
	wrpr	%l0,	%l6,	%tick
	fmuld8sux16	%f31,	%f6,	%f28
	wr	%i6,	%g7,	%clear_softint

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xCE0, 	%hsys_tick_cmpr
	wr	%g1,	0x02F8,	%set_softint
	wrpr	%i7,	%o4,	%tick
	array16	%g5,	%i5,	%o0
	wrpr	%l5,	%g6,	%cwp
	wr	%i3,	%o2,	%pic
	rdpr	%pil,	%o7
	movvs	%xcc,	%g3,	%o1
	rdhpr	%htba,	%l4
	rdpr	%tl,	%l3
	fbuge,a	%fcc0,	loop_435
	edge32ln	%o5,	%i0,	%o6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xCD3, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x007, 	%hsys_tick_cmpr
loop_435:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%hsys_tick_cmpr,	%l2
	rdpr	%wstate,	%g7
	edge32l	%i4,	%l1,	%i7
	wrpr	%g1,	%g5,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%cwp,	%l5
	wr	%g0,	0x04,	%asi
	ldsha	[%l7 + 0x7A] %asi,	%o4
	xor	%i3,	0x0A75,	%o2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	edge8	%g3,	%o1,	%l4
	wrpr	%l3,	0x0F0F,	%pil
	bge	loop_436
	sdivx	%o7,	0x156F,	%o5
	movrgez	%o6,	0x02D,	%i2
	fnot2s	%f13,	%f28
loop_436:
	nop
	set	0x68, %g2
	ldsw	[%l7 + %g2],	%i1
	wr	%o3,	%i0,	%pic
	rdhpr	%hpstate,	%g4
	edge32ln	%g2,	%i6,	%l0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%htba,	%g7
	rd	%sys_tick_cmpr,	%l6
	wrpr	%i4,	0x1412,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x21A, 	%hsys_tick_cmpr
	rdhpr	%hintp,	%i7
	rd	%y,	%i5
	rdpr	%pil,	%g5
	std	%f26,	[%l7 + 0x28]
	edge32l	%l5,	%o0,	%i3
	wrpr	%o2,	%o4,	%cwp
	fmovsgu	%xcc,	%f11,	%f29
	wrpr	%g6,	0x0888,	%tick
	wrpr	%g3,	0x1CA7,	%cwp
	bn,a	loop_437
	movvs	%xcc,	%l4,	%l3
	edge32	%o1,	%o7,	%o5
	fcmple16	%f8,	%f0,	%i2
loop_437:
	rd	%pc,	%o6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fmovsvc	%xcc,	%f4,	%f31
	wr	%g0,	0x80,	%asi
	ldsba	[%l7 + 0x2D] %asi,	%i0
	wr	%g4,	0x1B63,	%clear_softint
	wr	%i6,	0x1F0A,	%pic
	rdhpr	%hsys_tick_cmpr,	%l0
	rd	%y,	%l2
	udivx	%g7,	0x0159,	%l6
        wr    %g0,    0xe,    %pcr    ! changed.
	edge32l	%l1,	%i4,	%i7
	rdhpr	%hsys_tick_cmpr,	%i5
	wr	%g1,	0x1DB7,	%softint
	subccc	%l5,	0x0D3E,	%o0
	wrpr	%g5,	%i3,	%cwp
	sdivcc	%o4,	0x08E1,	%g6
	fmovs	%f2,	%f9
	andncc	%o2,	%g3,	%l3
	wrpr	%l4,	%o1,	%pil
	edge8n	%o7,	%o5,	%o6
	fnands	%f31,	%f3,	%f7
	tleu	%icc,	0x2
	wrpr	%i2,	0x139C,	%pil
	ble,a	%icc,	loop_438
	tsubcctv	%o3,	%i0,	%g4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xE4D, 	%hsys_tick_cmpr
	rdpr	%gl,	%i1
loop_438:
	move	%xcc,	%l2,	%g7
	addccc	%l6,	%g2,	%i4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	addccc	%l1,	0x15BA,	%g1
	add	%l5,	0x0989,	%i5
	ldd	[%l7 + 0x48],	%f0
	rd	%asi,	%o0
	rdpr	%cwp,	%g5
	wrpr	%o4,	0x1E78,	%pil
	wr	%i3,	%g6,	%ccr
	wr 	%g0, 	0x7, 	%fprs
	fcmpes	%fcc0,	%f22,	%f15
	rd	%tick_cmpr,	%g3
	wr	%l4,	%o1,	%set_softint

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fmovrsgz	%o6,	%f11,	%f3
	rd	%sys_tick_cmpr,	%i2
	rd	%ccr,	%o3
	wr	%i0,	%g4,	%clear_softint
	wr	%o5,	%l0,	%pic
	fpadd16	%f18,	%f28,	%f20
	wrpr	%i1,	0x0B8C,	%pil
	sth	%i6,	[%l7 + 0x54]
	umul	%l2,	0x0952,	%g7
	taddcctv	%l6,	%i4,	%g2
	wrpr	%i7,	0x19D5,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x1EF, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x8E2, 	%hsys_tick_cmpr
	wr 	%g0, 	0x6, 	%fprs
	bvc,a,pn	%icc,	loop_439
	wrpr	%g5,	%g6,	%pil
	rdpr	%cwp,	%o2
	orncc	%g3,	0x0F15,	%i3
loop_439:
	movl	%icc,	%l4,	%o1
	fpmerge	%f5,	%f16,	%f0
	te	%xcc,	0x5
	rd	%ccr,	%o7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%o6,	0x1551,	%cwp
	sub	%g4,	%i0,	%o5
	alignaddrl	%l0,	%i6,	%i1
	rdhpr	%htba,	%l2
	st	%f5,	[%l7 + 0x70]
	bvc,a,pn	%xcc,	loop_440
	wrpr	%g7,	%i4,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x42B, 	%hsys_tick_cmpr
	bne	%xcc,	loop_441
loop_440:
	subcc	%g1,	0x13FF,	%l1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%cansave,	%o0
loop_441:
	wr	%i5,	0x1CB4,	%softint
	wrpr	%g5,	0x17C1,	%tick
	rd	%y,	%o4
	fpsub16	%f0,	%f16,	%f28
	rd	%ccr,	%g6
	wr 	%g0, 	0x7, 	%fprs
	fpack32	%f8,	%f6,	%f16

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%o7,	%l3,	%y
	fpack16	%f2,	%f4
	fabsd	%f0,	%f26
	fmovsvs	%icc,	%f10,	%f18

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x783, 	%hsys_tick_cmpr
        wr    %g0,    0xe,    %pcr    ! changed.
	wr	%g4,	%o3,	%ccr
	wr 	%g0, 	0x6, 	%fprs
	bl,pn	%icc,	loop_442
	wrpr	%l0,	0x05B7,	%tick
	rd	%sys_tick_cmpr,	%i6
	rdhpr	%htba,	%i0
loop_442:
	be,pt	%icc,	loop_443
	rd	%pc,	%i1
	rdpr	%cwp,	%l2
	fpsub16	%f2,	%f8,	%f6
loop_443:
	rdhpr	%hpstate,	%i4
	xor	%l6,	%g2,	%g7
	tne	%xcc,	0x0
	fpack32	%f16,	%f16,	%f22
        wr    %g0,    0xe,    %pcr    ! changed.
	fzeros	%f29
	sdivcc	%g1,	0x0765,	%l5
	movvc	%xcc,	%i7,	%i5
	wr	%g0,	0x88,	%asi
	ldsha	[%l7 + 0x6A] %asi,	%g5
	movpos	%icc,	%o0,	%g6
	edge8n	%o4,	%i3,	%o2
	wrpr	%g3,	%o7,	%cwp
	rd	%tick_cmpr,	%l4
	fba,a	%fcc2,	loop_444
	wr	%l3,	%o1,	%set_softint
	rd	%pc,	%o6
	set	0x7C, %i6
	ldstuba	[%l7 + %i6] 0x89,	%g4
loop_444:
	movg	%icc,	%o3,	%o5
	wr	%g0,	0x18,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	array8	%i2,	%l0,	%i0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	udivcc	%i4,	0x1C77,	%l6
	fpack32	%f28,	%f2,	%f26

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%g7,	%l1,	%clear_softint
	wrpr	%l5,	%i7,	%pil
	rdpr	%gl,	%i5
	andncc	%g5,	%g1,	%g6
	wrpr	%o0,	0x0434,	%pil
	wr	%i3,	%o4,	%y
	fcmpne16	%f24,	%f18,	%g3
	wrpr	%o7,	0x1A7E,	%cwp
	wrpr	%o2,	%l4,	%tick
	rdpr	%gl,	%o1
	movvs	%icc,	%o6,	%l3
	rd	%fprs,	%g4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x0D9, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%tba,	%l0
	wrpr	%i0,	0x0321,	%tick
        wr    %g0,    0xe,    %pcr    ! changed.
	rdhpr	%hintp,	%i1
	wrpr	%l6,	%l2,	%tick
	rdpr	%tl,	%g2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	wr	%l5,	%i7,	%ccr
	rd	%y,	%i4
	rd	%ccr,	%i5
	wr	%g1,	0x1F3E,	%sys_tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%ccr,	%g6
	fpadd16	%f12,	%f2,	%f10

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xBD6, 	%hsys_tick_cmpr
	rdhpr	%hsys_tick_cmpr,	%o0
	srlx	%o2,	%l4,	%o1
	alignaddrl	%o6,	%o7,	%l3
	rdpr	%gl,	%o5
	xnorcc	%i2,	0x06A3,	%l0
	rdpr	%canrestore,	%i0
	fandnot2s	%f6,	%f13,	%f11

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	set	0x40, %g6
	stda	%i6,	[%l7 + %g6] 0x2f
	membar	#Sync
	rdpr	%tl,	%l6
	rdhpr	%htba,	%l2
	fabss	%f19,	%f29
	andncc	%i1,	%g2,	%g7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xE2D, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x55F, 	%hsys_tick_cmpr
	movrlz	%i4,	%i5,	%i7
	wrpr	%g1,	0x1A50,	%pil
	fbu,a	%fcc3,	loop_445
	wrpr	%g5,	0x058D,	%tick
	wr	%i3,	%o4,	%sys_tick
	lduw	[%l7 + 0x10],	%g3
loop_445:
        wr    %g0,    0xe,    %pcr    ! changed.
	rdhpr	%hsys_tick_cmpr,	%l4
	wr	%o1,	0x0140,	%ccr
	membar	0x73
	ldsb	[%l7 + 0x50],	%g6
	fmovrse	%o7,	%f6,	%f13

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x31F, 	%hsys_tick_cmpr
	array16	%o6,	%o5,	%l0
	rdhpr	%htba,	%i0
	movpos	%icc,	%i2,	%o3
	rdhpr	%htba,	%i6
	bvs,a,pt	%icc,	loop_446
	wr	%l6,	0x0514,	%pic

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%y,	%i1
loop_446:
	movrgz	%g2,	0x1E2,	%g7
	tsubcc	%l2,	0x0E77,	%l1
	rdhpr	%hpstate,	%l5
	wr	%i5,	0x1D2E,	%ccr
	fmovsne	%xcc,	%f25,	%f0
	edge16	%i4,	%i7,	%g1
	bneg,a,pn	%xcc,	loop_447
	rd	%fprs,	%i3
	wr	%o4,	%g5,	%clear_softint
	fmovse	%xcc,	%f29,	%f26
loop_447:
	wr	%g3,	%o2,	%ccr
	set	0x7D, %o4
	lduba	[%l7 + %o4] 0x10,	%l4
	wr	%o1,	%o0,	%set_softint
	rd	%fprs,	%g6
	rdpr	%cleanwin,	%l3
	rd	%ccr,	%o6
	fpack16	%f22,	%f30
	wrpr	%o5,	0x0550,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	fpadd32	%f30,	%f18,	%f20
	rdhpr	%hpstate,	%i2
	rdhpr	%htba,	%i6
	move	%icc,	%l6,	%o3
	tn	%xcc,	0x0
	wr	%g4,	0x169D,	%y
	rd	%asi,	%i1
	rd	%y,	%g2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x7DE, 	%sys_tick_cmpr
	wrpr	%g7,	0x12F3,	%tick
	rd	%pc,	%l5
	rdpr	%cwp,	%i5
	fpsub16	%f22,	%f28,	%f24
	fnegs	%f28,	%f2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	set	0x10, %g7
	stwa	%i7,	[%l7 + %g7] 0x19
	rdhpr	%hintp,	%l1
	rd	%asi,	%g1
	bg,a	loop_448
	rdhpr	%hintp,	%i3
	sdivcc	%g5,	0x1BFD,	%o4
	fmul8x16au	%f19,	%f13,	%f24
loop_448:
	bne,a	%icc,	loop_449
	movrlez	%g3,	0x216,	%o2
!Yo - got one - imm_asi 0x50 
!And yo - immediate is 0x00
	set	0x00, %l5
	ldxa	[%g0 + %l5] 0x50,	%l4
loop_449:
	rdhpr	%hsys_tick_cmpr,	%o1
	wr	%o0,	0x0824,	%pic
	add	%l3,	%o6,	%o5
	wr	%o7,	0x0DEB,	%softint
	rdpr	%tl,	%g6
	rdhpr	%hpstate,	%i0
	fcmpeq32	%f20,	%f6,	%l0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x7FF, 	%hsys_tick_cmpr
	tvs	%icc,	0x6
	fbuge	%fcc2,	loop_450
	call	loop_451
	rdpr	%cwp,	%l6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x1B9, 	%tick_cmpr
loop_450:
	rdhpr	%hpstate,	%i1
loop_451:
	rd	%softint,	%g2
	rdhpr	%hintp,	%l2
	rdhpr	%hpstate,	%g7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x5B7, 	%hsys_tick_cmpr
	wr 	%g0, 	0x7, 	%fprs
	fblg,a	%fcc0,	loop_452
	wrpr	%i4,	%i7,	%tick
	rdpr	%cansave,	%i5
	move	%icc,	%g1,	%i3
loop_452:
	rdpr	%tl,	%g5
	and	%o4,	%l1,	%g3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x09F, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xDA6, 	%hsys_tick_cmpr
	wrpr	%l3,	0x00C1,	%tick
	rd	%ccr,	%o6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xC38, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xDB6, 	%hsys_tick_cmpr
	membar	0x4E

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%l0,	%l6,	%cwp
	rdhpr	%hpstate,	%i2
	rd	%softint,	%i6
	rdpr	%tba,	%i1
	rdpr	%gl,	%g2
	rd	%sys_tick_cmpr,	%g4
	rdhpr	%htba,	%g7
	rd	%asi,	%l5
	fmul8x16	%f17,	%f18,	%f28
	rdpr	%gl,	%o3
	tgu	%xcc,	0x0
	mulx	%l2,	%i4,	%i5
	fmovscs	%icc,	%f15,	%f21
	edge16	%g1,	%i3,	%g5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xDE8, 	%hsys_tick_cmpr
	fmovdge	%icc,	%f22,	%f5
	movrgz	%g3,	%o4,	%l4
	and	%o0,	0x1318,	%l3
	rd	%sys_tick_cmpr,	%o6
	rdpr	%tl,	%o2
	wrpr	%o1,	0x0128,	%tick
	fmovdneg	%icc,	%f5,	%f22
	edge32n	%o7,	%g6,	%o5
	rd	%pc,	%i0
	rdpr	%cwp,	%l0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%softint,	%l6
	brlz,a	%g7,	loop_453
	movvs	%icc,	%g4,	%o3
	rd	%tick_cmpr,	%l2
	ldsh	[%l7 + 0x1C],	%l5
loop_453:
	fmuld8sux16	%f23,	%f18,	%f24
	tne	%xcc,	0x0
	xorcc	%i4,	0x1697,	%g1
	rd	%pc,	%i3
	rd	%fprs,	%i5
	edge8n	%i7,	%g5,	%g3
	brz,a	%l1,	loop_454
	rdhpr	%hintp,	%o4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mulscc	%o0,	%l4,	%o6
loop_454:
	tcs	%icc,	0x7
	fbu,a	%fcc3,	loop_455
	subc	%o2,	0x06EE,	%l3
	set	0x0F, %i2
	lduba	[%l7 + %i2] 0x15,	%o7
loop_455:
	rdhpr	%hsys_tick_cmpr,	%o1
	movne	%icc,	%g6,	%o5
	fble	%fcc0,	loop_456
	rd	%softint,	%l0
	rd	%asi,	%i2
	subcc	%i6,	0x14A4,	%i1
loop_456:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	array32	%g7,	%g4,	%l6
	rdhpr	%htba,	%o3
	andncc	%l2,	%i4,	%l5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x7A7, 	%sys_tick_cmpr
	rdpr	%tba,	%i3
	rd	%asi,	%i7
	xor	%i5,	%g5,	%g3
	rd	%softint,	%l1
	taddcctv	%o4,	%l4,	%o6
	bl,a	%icc,	loop_457
	fmovda	%icc,	%f29,	%f11
	movgu	%icc,	%o0,	%l3
	movrne	%o2,	%o1,	%o7
loop_457:
	bge,pn	%icc,	loop_458
	tge	%icc,	0x0
	fmovrde	%o5,	%f6,	%f14

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xD5B, 	%hsys_tick_cmpr
loop_458:
	rd	%ccr,	%i6
	fpsub16s	%f21,	%f12,	%f9

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x04A, 	%hsys_tick_cmpr
	fabss	%f13,	%f2
	rdpr	%gl,	%g2
	wr	%g7,	0x0BEE,	%softint
	rd	%y,	%i0
	set	0x40, %o0
	stda	%f16,	[%l7 + %o0] 0x81
	rdpr	%tba,	%g4
	fbe	%fcc2,	loop_459
	rd	%ccr,	%o3
	wrpr	%l2,	0x1562,	%pil
	rd	%fprs,	%l6
loop_459:
	wr	%l5,	0x0B42,	%softint
	fmovrdlz	%g1,	%f26,	%f26
	rdhpr	%hintp,	%i3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	orncc	%i4,	0x0C8F,	%i5
	sdivcc	%g5,	0x019A,	%g3
	be	%icc,	loop_460
	lduw	[%l7 + 0x0C],	%o4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%o6,	0x07D1,	%cwp
loop_460:
	wrpr	%o0,	%o2,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x3A9, 	%hsys_tick_cmpr
	sllx	%o5,	0x1E,	%l0
	rdpr	%pil,	%g6
	rdpr	%otherwin,	%o7
	movleu	%xcc,	%i6,	%i1
	rdpr	%wstate,	%i2
	set	0x26, %l2
	ldsha	[%l7 + %l2] 0x89,	%g7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	movpos	%icc,	%g2,	%o3
	movn	%icc,	%g4,	%l6
	subcc	%l5,	0x100D,	%l2
	rdhpr	%htba,	%i3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	nop
	setx	loop_461,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movn	%icc,	%g1,	%i5
	edge32n	%g5,	%i4,	%o4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_461:
	rdpr	%wstate,	%l4
	wrpr	%g3,	%o0,	%tick
	rd	%softint,	%o2
	rdhpr	%htba,	%l3
	wrpr	%o1,	0x1FA9,	%pil
	rd	%y,	%o6
	wr	%l0,	0x1F9F,	%clear_softint
	wrpr	%g6,	0x0CDD,	%pil
	popc	0x074D,	%o5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x369, 	%hsys_tick_cmpr
	fmovdle	%icc,	%f4,	%f16
	rd	%sys_tick_cmpr,	%i1
	rd	%fprs,	%g7
	wrpr	%i0,	%i2,	%pil
	rd	%softint,	%o3
	addcc	%g2,	0x19DD,	%g4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fbg,a	%fcc3,	loop_462
	rd	%sys_tick_cmpr,	%l2
	rdhpr	%hintp,	%l6
	sra	%i3,	%g1,	%i7
loop_462:
	fpsub16s	%f16,	%f28,	%f5
	rdpr	%otherwin,	%i5
	fcmpeq32	%f4,	%f22,	%i4
	fxnor	%f30,	%f30,	%f28
	rdhpr	%hsys_tick_cmpr,	%o4
	movgu	%xcc,	%l1,	%g5
	rdpr	%gl,	%g3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x59A, 	%tick_cmpr
	wr	%l4,	%l3,	%clear_softint

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fbge	%fcc0,	loop_463
	wr	%o1,	%o6,	%softint
	brgez	%l0,	loop_464
	lduh	[%l7 + 0x0E],	%g6
loop_463:
	movrlz	%o5,	%o7,	%i6
	rd	%softint,	%g7
loop_464:
	rdhpr	%hintp,	%i0
	fbo	%fcc1,	loop_465
	rdhpr	%htba,	%i2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xEDB, 	%hsys_tick_cmpr
	wrpr	%g2,	0x1953,	%pil
loop_465:
	rd	%y,	%o3
	add	%l7,	0x48,	%l6
	wr	%g0,	0x0c,	%asi
	ldxa	[%l6] %asi,	%g4
	casxa	[%l6] 0x0c,	%g4,	%l2
	rdhpr	%hpstate,	%l6
	alignaddrl	%l5,	%i3,	%i7
	edge32	%g1,	%i4,	%o4
	rd	%asi,	%l1
	tle	%xcc,	0x0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	add	%l7,	0x10,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] %asi,	%g3,	%g5
	rdhpr	%htba,	%o0
	rdpr	%canrestore,	%l4
	rdpr	%otherwin,	%o2
	fbn,a	%fcc0,	loop_466
	tleu	%xcc,	0x4
	wr	%l3,	0x1830,	%pic
	movrne	%o6,	%l0,	%g6
loop_466:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	tne	%xcc,	0x6
	rdpr	%cansave,	%o7
	sdivcc	%i6,	0x01F1,	%o1
	add	%l7,	0x28,	%l6
	wr	%g0,	0x10,	%asi
	casxa	[%l6] %asi,	%i0,	%g7
	rdhpr	%hpstate,	%i1
	andcc	%i2,	%o3,	%g4
	add	%l7,	0x5C,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] %asi,	%g2,	%l6
	rdhpr	%hsys_tick_cmpr,	%l5
	set	0x21, %o2
	ldsba	[%l7 + %o2] 0x81,	%i3
	mova	%xcc,	%l2,	%i7
	rdpr	%cansave,	%g1
	rdhpr	%hpstate,	%i4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x18E, 	%hsys_tick_cmpr
	fba	%fcc3,	loop_467
	addccc	%g3,	%o4,	%g5
	membar	0x0E
	rdpr	%tl,	%l4
loop_467:
	add	%o0,	%o2,	%o6
	rd	%ccr,	%l3
	wr	%g6,	0x1DE7,	%set_softint

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	tg	%xcc,	0x2
	mova	%icc,	%i6,	%o1
	subccc	%l0,	0x07C5,	%g7
	orncc	%i1,	%i2,	%i0
	wr	%o3,	%g2,	%set_softint
	rd	%ccr,	%l6
	wrpr	%g4,	%i3,	%cwp
	rdpr	%canrestore,	%l5
	xor	%i7,	%l2,	%i4
	rd	%asi,	%g1
	wr	%i5,	%l1,	%ccr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	rdpr	%pil,	%o4
	fornot2	%f28,	%f6,	%f16
	rd	%softint,	%o0
	wr	%l4,	0x07C5,	%softint
	rd	%tick_cmpr,	%o2
	udivx	%o6,	0x0422,	%g6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%hpstate,	%o5
	sll	%o1,	%i6,	%l0
	edge8n	%g7,	%i2,	%i1
	wr	%o3,	0x038E,	%pic
	wrpr	%i0,	%l6,	%pil
	fmovrsgez	%g4,	%f11,	%f7
	wrpr	%i3,	0x00E2,	%cwp
	rdpr	%tba,	%g2
	wrpr	%l5,	0x1B54,	%tick
	te	%xcc,	0x0
	rdhpr	%hsys_tick_cmpr,	%l2
	rd	%y,	%i7
	wrpr	%g1,	%i5,	%tick
	edge16l	%i4,	%l1,	%g5
	rdhpr	%hintp,	%g3
	rdpr	%pil,	%o4
	rd	%sys_tick_cmpr,	%o0
	rdpr	%cleanwin,	%o2
	rd	%sys_tick_cmpr,	%o6
	xor	%l4,	0x00E2,	%g6
	fmul8ulx16	%f30,	%f24,	%f2
	addccc	%l3,	0x1746,	%o7
	rd	%fprs,	%o5
	bvc,a	%xcc,	loop_468
	rdhpr	%hsys_tick_cmpr,	%i6
	rd	%softint,	%l0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x111, 	%hsys_tick_cmpr
loop_468:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x335, 	%hsys_tick_cmpr
	srl	%i2,	0x11,	%o3
	sdivcc	%l6,	0x1715,	%i0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	movl	%icc,	%g4,	%l5
	rd	%softint,	%i7
	srl	%g1,	0x04,	%l2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x200, 	%hsys_tick_cmpr
	ta	%icc,	0x2
	fmovsneg	%xcc,	%f19,	%f19
	rd	%sys_tick_cmpr,	%g5
	wrpr	%g3,	0x0112,	%pil
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	rdhpr	%htba,	%o4
	array8	%o0,	%l1,	%o2
	ble,a,pn	%xcc,	loop_469
	fandnot1	%f14,	%f0,	%f28
	movne	%icc,	%l4,	%o6
	edge16n	%g6,	%l3,	%o5
loop_469:
	edge16ln	%o7,	%l0,	%g7
	rdpr	%cwp,	%i6
	wrpr	%o1,	0x0524,	%pil
	fbu,a	%fcc3,	loop_470
	movre	%i1,	%i2,	%l6
	rdhpr	%hintp,	%o3
	rdhpr	%hsys_tick_cmpr,	%i3
loop_470:
	fmovsvs	%icc,	%f8,	%f28
	rdpr	%wstate,	%i0
	fmovsvs	%xcc,	%f11,	%f25

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x226, 	%hsys_tick_cmpr
	set	0x40, %g3
	lduba	[%l7 + %g3] 0x04,	%i7
	rdhpr	%htba,	%l5
	fxnors	%f23,	%f11,	%f2
	rdhpr	%hpstate,	%g1
	movleu	%icc,	%i5,	%i4
	rdpr	%pil,	%g5
	ta	%icc,	0x7
	rd	%ccr,	%g3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fbue	%fcc1,	loop_471
	rdpr	%tl,	%o0
	rdpr	%pil,	%l2
	fsrc1s	%f31,	%f2
loop_471:
	rdhpr	%hintp,	%l1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xB45, 	%hsys_tick_cmpr
	tne	%xcc,	0x4
	set	0x20, %o7
	ldxa	[%l7 + %o7] 0x19,	%l4
	tne	%xcc,	0x7
	andcc	%o6,	%g6,	%l3
	taddcctv	%o5,	%l0,	%g7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	orncc	%i6,	%i2,	%i1
	sdivcc	%l6,	0x01FB,	%o3
	movrlez	%i0,	%g4,	%g2
	edge8l	%i3,	%i7,	%l5
	rdpr	%canrestore,	%g1
	movle	%icc,	%i4,	%g5
	taddcctv	%g3,	0x0C72,	%o4
	rdhpr	%htba,	%i5
	nop
	set	0x50, %g5
	std	%l2,	[%l7 + %g5]

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	std	%f10,	[%l7 + 0x40]
	rd	%softint,	%l4
	fmovrdne	%o2,	%f22,	%f6
	edge32l	%o6,	%l3,	%g6
	sllx	%l0,	%g7,	%o7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x757, 	%tick_cmpr
	tn	%icc,	0x2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x796, 	%tick_cmpr
	wrpr	%i2,	0x055A,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%htba,	%l6
	wr 	%g0, 	0x7, 	%fprs
	wrpr	%g2,	%i3,	%cwp
	move	%xcc,	%i7,	%i0
	rd	%pc,	%l5
	rd	%ccr,	%i4
	rd	%sys_tick_cmpr,	%g5
	taddcc	%g3,	0x0A0B,	%g1
	ldsh	[%l7 + 0x10],	%i5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xAAF, 	%tick_cmpr
	rd	%softint,	%o0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fpackfix	%f20,	%f28

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x56D, 	%hsys_tick_cmpr
	rd	%tick_cmpr,	%l1
	fmuld8ulx16	%f27,	%f27,	%f0
	wr	%g6,	%g7,	%set_softint
	bgu,a,pn	%xcc,	loop_472
	rdpr	%tba,	%o7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x0CA, 	%tick_cmpr
	set	0x20, %l1
	lduwa	[%l7 + %l1] 0x10,	%i6
loop_472:
	st	%f12,	[%l7 + 0x50]
	fmovda	%xcc,	%f9,	%f17
	rd	%y,	%o1
	rdhpr	%hintp,	%i2
	wrpr	%o5,	%i1,	%pil
	xnor	%l6,	0x18C8,	%o3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%i7,	%i0,	%tick
	tsubcc	%l5,	%i4,	%g5
	fbue,a	%fcc3,	loop_473
	andcc	%g2,	%g3,	%g1
	rd	%y,	%o4
	andcc	%i5,	0x0FFA,	%l2
loop_473:
	lduh	[%l7 + 0x2E],	%o0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xC51, 	%sys_tick_cmpr
	subcc	%o2,	%l3,	%o6
	tpos	%xcc,	0x0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%l1,	%o7,	%pil
	fmovsne	%xcc,	%f24,	%f18
	rdhpr	%hintp,	%i6
	sllx	%o1,	%l0,	%i2
	wr	%i1,	0x179D,	%clear_softint
	wrpr	%o5,	0x1D42,	%tick
	tgu	%xcc,	0x3
	rd	%asi,	%o3
	flush	%l7 + 0x2C
	tsubcctv	%l6,	0x0420,	%g4
	rd	%asi,	%i3
	rdpr	%canrestore,	%i0
	sethi	0x1B6F,	%l5
	wrpr	%i7,	0x1366,	%cwp
	movleu	%icc,	%i4,	%g5
	nop
	set	0x40, %i4
	ldd	[%l7 + %i4],	%f16
	movle	%icc,	%g3,	%g2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%hsys_tick_cmpr,	%i5
	array16	%l2,	%o0,	%o2
	fnot2	%f14,	%f16

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x9D3, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	srl	%l1,	%g6,	%o7
	rdpr	%cleanwin,	%i6
	rdhpr	%hpstate,	%o1
	tle	%xcc,	0x7
	rdhpr	%htba,	%i2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xA4C, 	%hsys_tick_cmpr
	movre	%l0,	0x1C4,	%o3
	wrpr	%l6,	%o5,	%tick
	wrpr	%i3,	0x0ED0,	%pil
	sll	%g4,	0x12,	%i0
	call	loop_474
	rd	%y,	%l5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	srl	%g5,	0x05,	%i7
loop_474:
	rdhpr	%hintp,	%g2
	mulx	%o4,	0x11F5,	%g1
	ldd	[%l7 + 0x40],	%f28
	edge32	%i5,	%l2,	%o0
	wr	%g3,	0x10E3,	%softint
	fmovdl	%icc,	%f12,	%f19
	rd	%ccr,	%l4
	movrne	%l3,	0x133,	%o6
	wr	%g7,	0x15D9,	%y

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xD82, 	%hsys_tick_cmpr
	wr	%o7,	0x1875,	%softint
	rd	%y,	%i6
	movcs	%icc,	%g6,	%i2
	smul	%i1,	0x08A1,	%l0
	fcmple16	%f28,	%f28,	%o1
	edge32	%l6,	%o5,	%i3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xE6D, 	%hsys_tick_cmpr
	wrpr	%g4,	%l5,	%tick
	rd	%pc,	%i0
	rdhpr	%hpstate,	%g5
	move	%icc,	%i4,	%i7
	ldub	[%l7 + 0x12],	%o4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x1C5, 	%hsys_tick_cmpr
	rdhpr	%htba,	%g2
	fmovsle	%xcc,	%f14,	%f15
	fpadd32s	%f19,	%f7,	%f29
	fand	%f10,	%f24,	%f28
	rdpr	%gl,	%l2
	andncc	%o0,	%g3,	%l3
	fbue,a	%fcc1,	loop_475
	wrpr	%o6,	%g7,	%tick
	tsubcc	%l4,	%l1,	%o7
	srl	%i6,	0x16,	%g6
loop_475:
	srl	%o2,	0x03,	%i2
	tn	%icc,	0x7
	fbu,a	%fcc0,	loop_476
	sdivx	%i1,	0x1A04,	%o1
	rdpr	%cleanwin,	%l0
	umul	%l6,	0x1566,	%o5
loop_476:
	rdhpr	%hsys_tick_cmpr,	%i3
	wr	%o3,	%l5,	%pic
	edge32	%g4,	%i0,	%i4
	fabsd	%f20,	%f10
	fmuld8ulx16	%f20,	%f18,	%f12
	wr	%g0,	0x89,	%asi
	lda	[%l7 + 0x28] %asi,	%f21
	rdhpr	%hintp,	%i7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x3EA, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x56F, 	%hsys_tick_cmpr
	sethi	0x1D64,	%g1
	rdhpr	%hpstate,	%g2
	rdpr	%gl,	%o0
	wrpr	%l2,	%g3,	%cwp
	wrpr	%o6,	%g7,	%cwp
	wr	%l3,	%l1,	%pic

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xBB3, 	%hsys_tick_cmpr
	set	0x34, %i7
	swapa	[%l7 + %i7] 0x18,	%i6
	rd	%softint,	%o7
	rdpr	%pil,	%o2
	fnot1	%f28,	%f18

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%y,	%l0
	movge	%xcc,	%o1,	%l6
	wrpr	%o5,	0x079D,	%tick
	bvc	loop_477
	rdpr	%cwp,	%i3
	xnorcc	%o3,	%l5,	%g4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x42C, 	%hsys_tick_cmpr
loop_477:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	nop
	set	0x34, %i1
	ldsw	[%l7 + %i1],	%g5
	rdpr	%cansave,	%g1
	rd	%tick_cmpr,	%i5
	movcs	%xcc,	%o0,	%l2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xF78, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%htba,	%o6
	wr	%g0,	0xe2,	%asi
	stha	%l1,	[%l7 + 0x46] %asi
	membar	#Sync
	rd	%tick_cmpr,	%l3
	array32	%l4,	%i6,	%o7
	tgu	%icc,	0x5
	andn	%o2,	%i2,	%i1
	rd	%sys_tick_cmpr,	%g6
	rdpr	%tl,	%o1
	movvc	%xcc,	%l6,	%l0
	wrpr	%o5,	0x0CF6,	%pil
	rdhpr	%hsys_tick_cmpr,	%i3
	rd	%sys_tick_cmpr,	%l5
	movrne	%o3,	0x0AF,	%i0
	rd	%softint,	%i4
	bcc,a	%xcc,	loop_478
	wr	%g4,	0x03DD,	%pic
	rd	%y,	%i7
	rdpr	%cleanwin,	%g5
loop_478:
        wr    %g0,    0xe,    %pcr    ! changed.
	fbul	%fcc1,	loop_479
	rd	%fprs,	%i5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	add	%l2,	%o0,	%g3
loop_479:
	wrpr	%g7,	0x17D6,	%cwp
	rd	%pc,	%o6
        wr    %g0,    0xe,    %pcr    ! changed.

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	edge32	%l4,	%l1,	%i6
	wr	%o7,	%o2,	%y
	nop
	setx	loop_480,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	wr	%i1,	0x1267,	%softint
	rdpr	%cwp,	%i2
	rdhpr	%hpstate,	%o1
loop_480:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%cleanwin,	%l0
	tn	%xcc,	0x0
	rdhpr	%hintp,	%i3
	st	%f27,	[%l7 + 0x64]
	rd	%fprs,	%o5
	std	%f10,	[%l7 + 0x08]
	brz,a	%l5,	loop_481
	rdpr	%tba,	%o3
	tvs	%xcc,	0x6
	wr	%i4,	%g4,	%sys_tick
loop_481:
	rdhpr	%hsys_tick_cmpr,	%i0
	rd	%softint,	%i7
	wrpr	%g5,	0x08DF,	%pil
	rd	%y,	%g1
	bgu,pn	%xcc,	loop_482
	rd	%sys_tick_cmpr,	%o4
	udivcc	%l2,	0x1ACA,	%o0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_482:
	rd	%y,	%g7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	fmul8x16	%f3,	%f4,	%f28
	rd	%ccr,	%g3
	rd	%pc,	%l3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x958, 	%hsys_tick_cmpr
	fmovsne	%xcc,	%f26,	%f15
	udivx	%i6,	0x1D42,	%l1
	sllx	%o7,	%i1,	%o2
	rdhpr	%htba,	%i2
	wrpr	%l6,	0x168C,	%tick
	rdpr	%wstate,	%g6
	movgu	%icc,	%l0,	%o1
	rdhpr	%htba,	%o5
	wr	%i3,	0x030F,	%softint
	fcmpgt16	%f26,	%f14,	%o3
	wr	%l5,	%g4,	%softint
	wrpr	%i4,	%i0,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x6F4, 	%hsys_tick_cmpr
	rdpr	%canrestore,	%l2
	rdpr	%cleanwin,	%o4
	movge	%xcc,	%o0,	%g7
	wr	%o6,	0x123B,	%y
	wr	%i5,	0x1244,	%sys_tick
	wr	%g3,	0x1AE0,	%set_softint
	movvs	%xcc,	%g2,	%l3
	taddcctv	%i6,	0x0BA7,	%l1
	wr	%g0,	0x80,	%asi
	stha	%l4,	[%l7 + 0x6C] %asi
	fmovd	%f4,	%f8
	lduh	[%l7 + 0x78],	%i1
	wr	%o2,	0x1D5C,	%softint
	wr	%i2,	%l6,	%y
	rd	%tick_cmpr,	%o7
	rdpr	%cleanwin,	%g6
	wr	%l0,	0x190C,	%ccr
	sdivx	%o1,	0x1F3F,	%i3
	rd	%fprs,	%o5
	tsubcctv	%l5,	%o3,	%g4
	sra	%i4,	0x07,	%i7
	rdpr	%gl,	%i0
	sll	%g5,	0x03,	%l2
	rd	%asi,	%o4
	rdpr	%pil,	%g1
	wr	%g7,	0x0312,	%ccr
	bge,a,pn	%xcc,	loop_483
	edge8ln	%o0,	%i5,	%g3
	rdhpr	%htba,	%g2
	fbl,a	%fcc1,	loop_484
loop_483:
	wrpr	%o6,	0x1A35,	%pil
	wr 	%g0, 	0x4, 	%fprs

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
loop_484:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	set	0x58, %o3
	stxa	%i1,	[%l7 + %o3] 0x23
	membar	#Sync
	rd	%tick_cmpr,	%o2
	nop
	setx	loop_485,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	rdhpr	%hintp,	%i2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xDF3, 	%hsys_tick_cmpr
	rdhpr	%hsys_tick_cmpr,	%l4
loop_485:
	rdpr	%pil,	%o7
	rdhpr	%hintp,	%g6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xE6D, 	%hsys_tick_cmpr
	sllx	%o5,	%i3,	%o3
	wrpr	%l5,	0x050E,	%pil
	rdhpr	%hsys_tick_cmpr,	%g4
	wrpr	%i7,	%i4,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	sdiv	%g1,	0x05C0,	%o4
	wrpr	%o0,	0x1A75,	%tick
	membar	0x1E
	edge8l	%i5,	%g7,	%g2
	mulscc	%o6,	0x03F1,	%l3
	bcs,a,pt	%icc,	loop_486
	wrpr	%g3,	0x12F5,	%cwp
	rdhpr	%hpstate,	%l1
	wr	%i1,	0x05D7,	%y
loop_486:
	rdpr	%otherwin,	%o2
	rd	%asi,	%i6
	tg	%xcc,	0x1
	movgu	%icc,	%i2,	%l6
	subc	%l4,	0x1906,	%g6
	wrpr	%l0,	%o1,	%pil
	te	%icc,	0x0
	rdhpr	%hsys_tick_cmpr,	%o7
	sdivcc	%o5,	0x116F,	%o3
	movvc	%icc,	%l5,	%i3
	rdpr	%wstate,	%i7
	rdhpr	%hsys_tick_cmpr,	%i4
	edge8	%g4,	%g5,	%i0
	rdhpr	%hintp,	%g1
	fnot1s	%f9,	%f29
	umul	%l2,	0x0448,	%o0
	fmuld8sux16	%f31,	%f31,	%f30
	wr	%o4,	%g7,	%clear_softint
	rd	%y,	%i5
        wr    %g0,    0xe,    %pcr    ! changed.
	wrpr	%g3,	%l3,	%cwp
	tg	%icc,	0x7
	te	%icc,	0x4
	rd	%softint,	%i1
	rdpr	%canrestore,	%o2
	taddcctv	%l1,	%i2,	%i6
	wrpr	%l4,	0x13C3,	%pil
	movrgz	%g6,	%l0,	%l6
	nop
	setx	loop_487,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	rd	%fprs,	%o1
	wrpr	%o7,	0x117D,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_487:
	rd	%ccr,	%o3
	taddcc	%l5,	%i3,	%i7
	rdhpr	%hsys_tick_cmpr,	%g4
	wrpr	%g5,	0x17C5,	%tick
	ldstub	[%l7 + 0x56],	%i0
	rd	%pc,	%g1
	wrpr	%i4,	0x108A,	%pil
	wrpr	%o0,	0x0CB2,	%pil
        wr    %g0,    0xe,    %pcr    ! changed.
	wrpr	%g7,	0x1452,	%pil
	for	%f16,	%f2,	%f4
	fornot1s	%f23,	%f28,	%f26
	fmovscc	%icc,	%f24,	%f6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xB03, 	%hsys_tick_cmpr
	rdpr	%tba,	%o6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xA6A, 	%hsys_tick_cmpr
	rd	%pc,	%o4
	rdpr	%tl,	%i1
	wrpr	%o2,	0x0F54,	%tick
	rdpr	%gl,	%l1
	fnor	%f24,	%f20,	%f0
	xnorcc	%i2,	%l3,	%l4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x441, 	%hsys_tick_cmpr
	fmovrslez	%l0,	%f19,	%f28
	fpadd16	%f12,	%f24,	%f24
	movgu	%icc,	%l6,	%o1
	rdhpr	%hintp,	%i6
	set	0x78, %l3
	prefetcha	[%l7 + %l3] 0x80,	 0x1
	udiv	%o7,	0x0C44,	%l5
	movre	%i3,	0x1A4,	%i7
	rdhpr	%hintp,	%o3
	rdpr	%otherwin,	%g4
	sub	%i0,	%g5,	%g1
	bgu,pn	%xcc,	loop_488
	rdhpr	%htba,	%o0
	rdhpr	%hintp,	%i4
	xnor	%g7,	%l2,	%o6
loop_488:
	rd	%tick_cmpr,	%g2
	siam	0x4
	wr	%g0,	0x89,	%asi
	ldsha	[%l7 + 0x5E] %asi,	%g3
	edge16l	%o4,	%i5,	%i1
	fcmpes	%fcc2,	%f3,	%f31
	rd	%sys_tick_cmpr,	%o2
	rdpr	%cleanwin,	%i2
	rdpr	%wstate,	%l1
	wrpr	%l4,	%l3,	%tick
	wr	%g0,	0x19,	%asi
	lduha	[%l7 + 0x4E] %asi,	%l0
	rd	%ccr,	%g6
	wrpr	%o1,	%l6,	%pil
	set	0x12, %o1
	lduha	[%l7 + %o1] 0x0c,	%o5
	fmovdvs	%xcc,	%f31,	%f12
	popc	%i6,	%l5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%o3,	%i0,	%y

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%pc,	%o0
	wrpr	%g1,	%g7,	%cwp
        wr    %g0,    0xe,    %pcr    ! changed.
	subccc	%g2,	0x05FF,	%l2
	array16	%o4,	%i5,	%g3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fpadd16s	%f13,	%f18,	%f8
	bl,a,pn	%icc,	loop_489
	ldstub	[%l7 + 0x23],	%o2
	rdpr	%tba,	%l1
	stb	%i2,	[%l7 + 0x69]
loop_489:
	edge16ln	%l4,	%l3,	%l0
	rdpr	%cleanwin,	%g6
	xor	%o1,	0x1596,	%o5
	wr	%g0,	0x11,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	rd	%fprs,	%i6
	tl	%xcc,	0x4
	wr	%l6,	%i3,	%sys_tick
	tvc	%icc,	0x5
	or	%l5,	%o7,	%o3
	rd	%softint,	%i0
	sdivx	%g4,	0x0C42,	%i7
	rd	%asi,	%o0
	rdhpr	%hsys_tick_cmpr,	%g5
	rdhpr	%hpstate,	%g1
	rdpr	%tba,	%i4
	be	%icc,	loop_490
	wrpr	%o6,	0x0EEA,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	sdiv	%g7,	0x1B07,	%l2
loop_490:
	wrpr	%i5,	0x0D0B,	%cwp
	movl	%xcc,	%o4,	%i1
        wr    %g0,    0xe,    %pcr    ! changed.
	or	%o2,	0x073E,	%i2
	udiv	%l1,	0x07E0,	%l4
	ldx	[%l7 + 0x10],	%l3
	rd	%y,	%l0
	wrpr	%g6,	%o5,	%cwp
	ldsw	[%l7 + 0x1C],	%o1
	wrpr	%l6,	%i6,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	movcc	%icc,	%o3,	%l5
	rdpr	%pil,	%g4
	bvs,pn	%xcc,	loop_491
	st	%f8,	[%l7 + 0x30]
	rd	%tick_cmpr,	%i0
	rdpr	%cleanwin,	%i7
loop_491:
	nop
	set	0x5E, %o6
	stha	%o0,	[%l7 + %o6] 0x14
	wr	%g5,	%i4,	%y
	rd	%sys_tick_cmpr,	%g1
	rdhpr	%htba,	%g2
	rdpr	%cleanwin,	%g7
	sub	%l2,	0x1575,	%i5
	rdhpr	%hpstate,	%o6
	for	%f30,	%f8,	%f2
	rdhpr	%htba,	%i1
	wrpr	%g3,	0x1A5B,	%cwp
	rd	%ccr,	%o2
	wrpr	%i2,	0x04EC,	%cwp
	fmovdneg	%xcc,	%f29,	%f26

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xB4F, 	%hsys_tick_cmpr
	rdhpr	%htba,	%l4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	andn	%o5,	%o1,	%g6
	membar	0x09

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xC04, 	%hsys_tick_cmpr
	fandnot1s	%f20,	%f0,	%f27
	membar	0x4C
	rd	%sys_tick_cmpr,	%i6
	rd	%softint,	%o3
	rd	%tick_cmpr,	%l5
	rd	%asi,	%g4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
        wr    %g0,    0xe,    %pcr    ! changed.
	wrpr	%i7,	%g5,	%tick
	rd	%tick_cmpr,	%i4
	wrpr	%g1,	%o0,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xC59, 	%hsys_tick_cmpr
	smulcc	%g7,	%l2,	%i5
	wrpr	%i1,	0x1D42,	%cwp
	rd	%tick_cmpr,	%o6
	sllx	%g3,	%i2,	%l1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	udivx	%o4,	0x1B79,	%l3
	rdpr	%tl,	%o5
	wrpr	%l0,	%o1,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x327, 	%hsys_tick_cmpr
	bne,pn	%xcc,	loop_492
	edge8ln	%i3,	%i6,	%l6
        wr    %g0,    0xe,    %pcr    ! changed.
	wrpr	%g4,	0x14E8,	%tick
loop_492:
	flush	%l7 + 0x54
	wr	%g0,	0x19,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	fnand	%f6,	%f18,	%f18
	wr	%l5,	0x08B2,	%softint
	rd	%tick_cmpr,	%i0
	edge16n	%o7,	%g5,	%i4
	andn	%g1,	0x0B69,	%o0
	fnands	%f3,	%f7,	%f9
	wr	%i7,	%g7,	%sys_tick
	tge	%icc,	0x1
	edge8l	%l2,	%i5,	%i1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x4AB, 	%hsys_tick_cmpr
	rdhpr	%hintp,	%g2
	wrpr	%i2,	%l1,	%pil
	rd	%sys_tick_cmpr,	%o2
	array16	%o4,	%l3,	%l4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x7C6, 	%hsys_tick_cmpr
	edge8	%g6,	%i3,	%i6
	wr 	%g0, 	0x5, 	%fprs
	movre	%g4,	%l5,	%i0
	edge8ln	%l6,	%g5,	%o7
	rd	%ccr,	%i4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x895, 	%sys_tick_cmpr
	subccc	%g7,	%l2,	%i5
	te	%icc,	0x3
	movleu	%xcc,	%i1,	%i7
	fmovsgu	%xcc,	%f17,	%f0
	rd	%fprs,	%o6
	rdhpr	%hintp,	%g2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xA5A, 	%hsys_tick_cmpr
	rdhpr	%hsys_tick_cmpr,	%l1
	rdhpr	%hsys_tick_cmpr,	%o2
	wr	%i2,	%o4,	%pic

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	wrpr	%o5,	0x043A,	%cwp
	ba,pn	%xcc,	loop_493
	rdpr	%cwp,	%g6
	edge8	%l3,	%i3,	%i6
	wrpr	%o3,	0x10AC,	%tick
loop_493:
	wrpr	%o1,	%l5,	%tick
	fpadd32	%f6,	%f16,	%f30

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fand	%f24,	%f2,	%f20
	movrlez	%g5,	%i0,	%i4
	tpos	%xcc,	0x3
	movg	%xcc,	%o0,	%g1
	bg,a,pt	%xcc,	loop_494
	tvc	%xcc,	0x6
	wrpr	%g7,	%l2,	%cwp
	fmuld8sux16	%f2,	%f5,	%f20
loop_494:
	movrgez	%i5,	0x1C8,	%i1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%softint,	%o6
	fmovrdlz	%o7,	%f12,	%f28
	rdhpr	%hintp,	%g2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xB03, 	%hsys_tick_cmpr
	movge	%icc,	%g3,	%i2
	bneg,pt	%icc,	loop_495
	brlz	%o2,	loop_496
	subccc	%l4,	0x1078,	%l0
	tcs	%icc,	0x5
loop_495:
	udivcc	%o4,	0x0B33,	%g6
loop_496:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x431, 	%sys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x061, 	%sys_tick_cmpr
	srlx	%o1,	0x13,	%i6
	edge8ln	%l5,	%l6,	%g4
	rdpr	%cleanwin,	%g5
	tcc	%xcc,	0x4
	umulcc	%i4,	0x1676,	%o0
	fmovdle	%icc,	%f16,	%f23
	rdhpr	%hsys_tick_cmpr,	%g1
	wrpr	%i0,	0x0515,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x045, 	%hsys_tick_cmpr
	ldsb	[%l7 + 0x4A],	%g7
	be,pt	%icc,	loop_497
	stw	%i5,	[%l7 + 0x58]
	rd	%asi,	%i1
	fmul8x16al	%f7,	%f30,	%f2
loop_497:
	rd	%pc,	%i7
	wrpr	%o6,	%o7,	%tick
	rdhpr	%hpstate,	%l1
	rdhpr	%hsys_tick_cmpr,	%g2
	edge16	%i2,	%g3,	%o2
	wrpr	%l4,	0x005B,	%pil
	fmovsne	%icc,	%f15,	%f16
	wrpr	%l0,	%o4,	%tick
	popc	0x0114,	%l3
	wrpr	%g6,	0x16ED,	%tick
	wr	%i3,	0x0AAA,	%clear_softint

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fnand	%f6,	%f20,	%f2
	wr	%o3,	0x03F2,	%sys_tick
	rd	%ccr,	%o1
	rdhpr	%hintp,	%i6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xBE4, 	%sys_tick_cmpr
	movre	%g5,	0x389,	%i4
	nop
	setx	loop_498,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	wr 	%g0, 	0x5, 	%fprs
	brgez	%g1,	loop_499
	fmovsgu	%icc,	%f18,	%f0
loop_498:
	wrpr	%i0,	%g7,	%cwp
	rd	%ccr,	%l2
loop_499:
	faligndata	%f4,	%f14,	%f30
	edge32n	%i1,	%i5,	%o6
	xorcc	%i7,	0x0C72,	%o7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	wr	%g3,	%o2,	%sys_tick
	wrpr	%l4,	0x0453,	%tick
        wr    %g0,    0xe,    %pcr    ! changed.
	fone	%f28
	wrpr	%l3,	0x1980,	%cwp
	fmovdn	%icc,	%f4,	%f23
	rdpr	%cansave,	%o4
	rd	%asi,	%i3
	rd	%sys_tick_cmpr,	%o5
	tg	%xcc,	0x2
	addccc	%g6,	0x1D71,	%o3
	taddcctv	%i6,	0x1B0B,	%o1
	rdhpr	%hintp,	%l6
	rdhpr	%hpstate,	%l5
	andcc	%i4,	0x1B04,	%g5
	bl,a,pt	%icc,	loop_500
	rdpr	%tba,	%g4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_500:
	wr	%g1,	%l2,	%softint
	fmul8x16	%f6,	%f4,	%f28

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fpackfix	%f6,	%f18
	wr 	%g0, 	0x6, 	%fprs
	mova	%icc,	%o7,	%i7
	ldsh	[%l7 + 0x3E],	%i2
	rd	%fprs,	%g3
	alignaddr	%o2,	%l4,	%l1
	edge32ln	%l0,	%l3,	%g2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	andn	%o4,	%g6,	%o3
	wrpr	%o5,	0x14D7,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xB71, 	%tick_cmpr
	rdhpr	%htba,	%l6
	sdivx	%i4,	0x0AD3,	%g5
	fmovsn	%xcc,	%f18,	%f23
	rdpr	%cansave,	%l5
	wr	%g0,	0x81,	%asi
	sta	%f14,	[%l7 + 0x10] %asi
	andncc	%g4,	%o0,	%i0
	umulcc	%l2,	%g1,	%i5
	edge16	%i1,	%g7,	%o7
	movl	%xcc,	%i7,	%i2
	fcmpne32	%f8,	%f28,	%g3
	wr	%o2,	0x002E,	%set_softint

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xA25, 	%hsys_tick_cmpr
	wrpr	%l0,	%l3,	%cwp
	rdpr	%otherwin,	%g2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x037, 	%hsys_tick_cmpr
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	rdhpr	%hsys_tick_cmpr,	%i3
	fcmpgt16	%f8,	%f22,	%o4
	tsubcc	%g6,	0x063A,	%o3
	wrpr	%o5,	0x1F89,	%tick
	rd	%sys_tick_cmpr,	%i6
	rd	%pc,	%o1
        wr    %g0,    0xe,    %pcr    ! changed.
	rdpr	%cleanwin,	%i4
	sub	%l5,	%g4,	%o0
	rdhpr	%hpstate,	%i0
	rd	%tick_cmpr,	%l2
	xor	%g1,	0x1832,	%i1
	rd	%y,	%i5
	set	0x5F, %l0
	lduba	[%l7 + %l0] 0x80,	%o7
	bn,a,pt	%icc,	loop_501
	wrpr	%g7,	%i2,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%hintp,	%o2
loop_501:
	wr	%o6,	%l0,	%softint

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x136, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x717, 	%hsys_tick_cmpr
	wrpr	%l1,	0x10DA,	%cwp
	umul	%i3,	0x0044,	%g6
	fcmpeq32	%f20,	%f30,	%o4
	wr	%o5,	%i6,	%ccr
	movrne	%o1,	0x3BD,	%l6
	fcmple32	%f28,	%f6,	%o3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x951, 	%hsys_tick_cmpr
	add	%l7,	0x38,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%l5
	casxa	[%l6] %asi,	%l5,	%o0
	rd	%asi,	%g4
	wr	%l2,	0x18DA,	%sys_tick
	wr	%i0,	0x1248,	%sys_tick
	wrpr	%g1,	%i1,	%tick
	ldsb	[%l7 + 0x1E],	%o7
	fcmpgt16	%f0,	%f22,	%g7
	fmul8sux16	%f16,	%f14,	%f4
	brlez	%i5,	loop_502
	udivx	%i2,	0x0185,	%g3
	fblg,a	%fcc3,	loop_503
	std	%f28,	[%l7 + 0x30]
loop_502:
	movgu	%icc,	%i7,	%o2
	add	%l0,	%l3,	%o6
loop_503:
	edge32	%l4,	%g2,	%i3
	wrpr	%g6,	%l1,	%tick
	wrpr	%o4,	%i6,	%cwp
	bvs,a,pn	%icc,	loop_504
	edge16ln	%o5,	%o1,	%l6
	wrpr	%o3,	0x0900,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_504:
	wr	%l5,	0x1F0D,	%ccr
	fmul8x16au	%f16,	%f0,	%f20
	rdhpr	%hintp,	%i4
	andcc	%o0,	%g4,	%l2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x341, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x3E4, 	%hsys_tick_cmpr
	wr	%g7,	%i5,	%ccr
	rd	%pc,	%i2
	rdhpr	%hsys_tick_cmpr,	%g3
	rd	%asi,	%o2
	set	0x62, %g4
	lduba	[%l7 + %g4] 0x89,	%i7
	rdpr	%tl,	%l3
	fmul8x16al	%f2,	%f26,	%f30
	rd	%pc,	%o6
	rdhpr	%hsys_tick_cmpr,	%l4
	fpmerge	%f21,	%f23,	%f24
	rdpr	%cleanwin,	%g2
	rd	%fprs,	%i3
	rdpr	%tba,	%g6
	fcmpeq16	%f12,	%f12,	%l0
	rdhpr	%hpstate,	%o4
	sub	%l1,	%i6,	%o5
	rd	%asi,	%l6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xAFD, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	sll	%i4,	%g4,	%o0
	rdhpr	%hsys_tick_cmpr,	%i0
	rdpr	%cleanwin,	%g1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xB28, 	%hsys_tick_cmpr
	rd	%pc,	%l2
	rdpr	%pil,	%g7
	orn	%i1,	0x1A2E,	%i5
        wr    %g0,    0xe,    %pcr    ! changed.
	rd	%pc,	%i7
	rd	%sys_tick_cmpr,	%l3
	edge32ln	%o2,	%o6,	%l4
	edge8	%i3,	%g6,	%l0
	xnor	%o4,	%g2,	%l1
	brz,a	%o5,	loop_505
	rdhpr	%htba,	%l6
	rdhpr	%htba,	%i6
	tpos	%icc,	0x6
loop_505:
	rdpr	%wstate,	%o3
	wr	%g5,	0x0496,	%softint

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x363, 	%hsys_tick_cmpr
	rdhpr	%hsys_tick_cmpr,	%i4
	edge16l	%i0,	%o0,	%o7
	wr	%l2,	%g7,	%sys_tick
	fcmpes	%fcc2,	%f1,	%f25
	wrpr	%i1,	%g1,	%cwp
	rdhpr	%hsys_tick_cmpr,	%i5
	stw	%i2,	[%l7 + 0x20]
	edge32	%g3,	%l3,	%o2
	ba,a	%icc,	loop_506
	brz,a	%o6,	loop_507
	rdpr	%wstate,	%i7
	and	%i3,	0x1A22,	%g6
loop_506:
        wr    %g0,    0xe,    %pcr    ! changed.
loop_507:
	nop
	wr	%g0,	0x89,	%asi
	ldsba	[%l7 + 0x2B] %asi,	%l0
	fexpand	%f18,	%f10
	ta	%icc,	0x2
	xor	%o4,	%l1,	%o5
	rdhpr	%htba,	%g2
	wr 	%g0, 	0x6, 	%fprs
	xor	%l6,	0x0AFF,	%o3
	rdhpr	%htba,	%o1
	rd	%fprs,	%g5
	rd	%tick_cmpr,	%g4
	fmovsgu	%xcc,	%f27,	%f11
	udivx	%l5,	0x126D,	%i0
	wr	%o0,	0x0C2F,	%pic
	orncc	%o7,	0x0817,	%i4
	rd	%tick_cmpr,	%g7
	rd	%softint,	%i1
	fornot1s	%f19,	%f8,	%f8
	fnot2s	%f22,	%f6
	smulcc	%l2,	%i5,	%i2
	wrpr	%g3,	0x124A,	%cwp
	andn	%l3,	%o2,	%g1
	tl	%xcc,	0x1
	or	%o6,	%i7,	%i3
	rdpr	%otherwin,	%g6
	wrpr	%l0,	0x035F,	%cwp
	ldub	[%l7 + 0x3B],	%o4
	move	%xcc,	%l4,	%o5
	tvc	%xcc,	0x4
	wrpr	%l1,	0x1E64,	%pil
	rdpr	%otherwin,	%i6
	movgu	%xcc,	%l6,	%o3
	fbn	%fcc2,	loop_508
	movle	%xcc,	%o1,	%g2
	wr	%g0,	0x89,	%asi
	lduha	[%l7 + 0x5A] %asi,	%g4
loop_508:
	rd	%fprs,	%g5
	nop
	setx	loop_509,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	rdpr	%cleanwin,	%i0
	rd	%asi,	%l5
	rdpr	%cleanwin,	%o0
loop_509:
	rdpr	%pil,	%o7
	rdhpr	%hpstate,	%g7
	rd	%tick_cmpr,	%i4
	fbne,a	%fcc1,	loop_510
	and	%l2,	%i1,	%i5
	movrgz	%g3,	%l3,	%o2
	rdhpr	%hsys_tick_cmpr,	%g1
loop_510:
	membar	0x60
	rdhpr	%hsys_tick_cmpr,	%i2
	rdhpr	%htba,	%i7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	sdiv	%g6,	0x06A5,	%i3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fbul,a	%fcc0,	loop_511
	ldsw	[%l7 + 0x74],	%l4
	edge32	%o4,	%l1,	%o5
	movn	%icc,	%l6,	%o3
loop_511:
	wr 	%g0, 	0x4, 	%fprs

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x268, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	ldd	[%l7 + 0x40],	%f30
	rdpr	%wstate,	%g2
	wr	%i0,	0x19AE,	%set_softint
	movne	%icc,	%l5,	%o7
	wr	%g7,	0x0A19,	%set_softint

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x8E4, 	%tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%cwp,	%i5
	rd	%tick_cmpr,	%g3
	wrpr	%i1,	0x08D9,	%tick
	std	%f18,	[%l7 + 0x70]
	movpos	%icc,	%o2,	%g1
	rd	%y,	%l3
	addcc	%i2,	%o6,	%i7
	rdpr	%cleanwin,	%g6
	nop
	set	0x68, %i5
	std	%i2,	[%l7 + %i5]
	xnorcc	%l4,	%o4,	%l0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%l6,	0x14F8,	%tick
	rd	%fprs,	%o5
	taddcctv	%o3,	0x092E,	%i6
	set	0x43, %i3
	lduba	[%l7 + %i3] 0x10,	%g4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x706, 	%hsys_tick_cmpr
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	rdhpr	%hintp,	%g5
	fmovde	%icc,	%f24,	%f20
	rd	%sys_tick_cmpr,	%l5
	rdhpr	%hintp,	%o7
	wrpr	%i0,	%g7,	%tick
	rdhpr	%hsys_tick_cmpr,	%i4
	mulx	%o0,	0x117E,	%l2
	membar	0x4A
	wr	%i5,	%g3,	%pic
	rd	%y,	%o2
	or	%i1,	%g1,	%i2
	fmul8x16au	%f14,	%f10,	%f12

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xCFE, 	%sys_tick_cmpr
	fxors	%f13,	%f28,	%f30
	wr 	%g0, 	0x7, 	%fprs
	ldd	[%l7 + 0x58],	%f30
	fmul8x16au	%f24,	%f22,	%f22
	fmovsneg	%xcc,	%f2,	%f16
	wrpr	%i3,	0x12D5,	%tick
	rdhpr	%htba,	%l4
	addc	%o4,	%l0,	%i7
	rdhpr	%hpstate,	%l6
	rdhpr	%hpstate,	%l1
	rd	%pc,	%o5
	rdhpr	%hintp,	%o3
	rdhpr	%hintp,	%g4
	set	0x70, %o5
	stxa	%o1,	[%l7 + %o5] 0x18
	rdhpr	%hpstate,	%g2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	and	%o7,	0x0D14,	%i0
	sdivx	%g7,	0x12F0,	%i6
	wrpr	%i4,	%o0,	%tick
	rdhpr	%hpstate,	%l2
	rd	%asi,	%g3
	sra	%o2,	%i1,	%i5
	rdhpr	%htba,	%g1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xFE0, 	%hsys_tick_cmpr
	rdpr	%pil,	%g6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x9EF, 	%hsys_tick_cmpr
	wr	%i3,	%l0,	%softint
	array32	%i7,	%o4,	%l1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x970, 	%hsys_tick_cmpr
	wrpr	%o3,	%l6,	%pil
	rdpr	%pil,	%g4
	rdhpr	%htba,	%o1
	fcmpeq16	%f12,	%f24,	%g5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	wr	%g0,	0x10,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	rdhpr	%hpstate,	%g2
	tpos	%xcc,	0x6
	rd	%pc,	%g7
	rdpr	%canrestore,	%i0
	fnot2s	%f8,	%f25
	wrpr	%i6,	%o0,	%pil
	wr 	%g0, 	0x7, 	%fprs

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	rd	%fprs,	%i1
	rdhpr	%hintp,	%i5
	rdhpr	%hsys_tick_cmpr,	%g3
	te	%icc,	0x7
	brlez	%o6,	loop_512
	sdivx	%l3,	0x0EDC,	%g6
	movrgz	%i2,	0x2AD,	%l4
	fnor	%f28,	%f28,	%f16
loop_512:
	rdpr	%otherwin,	%g1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	fsrc1	%f4,	%f16
	rd	%ccr,	%o4
	faligndata	%f10,	%f24,	%f6
	rd	%fprs,	%l1
	rdpr	%gl,	%l0
	brlz,a	%o3,	loop_513
	fbne	%fcc2,	loop_514
	rdhpr	%hintp,	%l6
	wr	%g4,	0x08DE,	%softint
loop_513:
	subc	%o5,	0x1F5A,	%g5
loop_514:
	nop
	wr	%g0,	0x18,	%asi
	lduwa	[%l7 + 0x48] %asi,	%o1
	wrpr	%l5,	0x0F05,	%tick
	fba,a	%fcc1,	loop_515
	alignaddrl	%g2,	%g7,	%o7
	movrgez	%i6,	%i0,	%i4
	rd	%fprs,	%o0
loop_515:
	brnz	%l2,	loop_516
	rdhpr	%htba,	%o2
	wr	%i1,	%g3,	%clear_softint
	fnors	%f10,	%f7,	%f17
loop_516:
	rdhpr	%htba,	%o6
	bcs	loop_517
	ldsh	[%l7 + 0x30],	%l3
	fmovdne	%icc,	%f24,	%f5
	rdhpr	%hintp,	%i5
loop_517:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%g0,	0x19,	%asi
	lda	[%l7 + 0x58] %asi,	%f22
	sll	%i2,	0x18,	%g1
	set	0x10, %i0
	ldstuba	[%l7 + %i0] 0x04,	%l4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xF4A, 	%hsys_tick_cmpr
	tn	%xcc,	0x1
	tvs	%icc,	0x4
	wr 	%g0, 	0x7, 	%fprs
	tn	%icc,	0x5
	sdivcc	%l1,	0x1983,	%l0
	udiv	%o3,	0x0E9D,	%l6
	rdpr	%tba,	%o4
	fbul,a	%fcc1,	loop_518
	wrpr	%g4,	0x0FCD,	%tick
	rdhpr	%hsys_tick_cmpr,	%o5
	wrpr	%g5,	%o1,	%pil
loop_518:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x1FD, 	%hsys_tick_cmpr
	set	0x58, %l6
	stxa	%l5,	[%l7 + %l6] 0x2b
	membar	#Sync

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	popc	0x008C,	%i6
	rdpr	%cansave,	%g7
	rdhpr	%htba,	%i4
	fmovsneg	%xcc,	%f9,	%f5
	wr	%o0,	%i0,	%pic

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x00B, 	%hsys_tick_cmpr
	wr	%l2,	%i1,	%softint
	fbul,a	%fcc2,	loop_519
	rd	%sys_tick_cmpr,	%g3
	rdpr	%gl,	%o6
	wr	%l3,	0x0195,	%sys_tick
loop_519:
	rdpr	%cleanwin,	%g6
	rdpr	%cleanwin,	%i2
	movn	%icc,	%i5,	%g1
	wr 	%g0, 	0x6, 	%fprs
	rd	%sys_tick_cmpr,	%l4
	fones	%f18
	array32	%l1,	%i3,	%l0
	wrpr	%l6,	%o4,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x87A, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	ldsb	[%l7 + 0x1A],	%o3
	rdpr	%cansave,	%o1
	rdpr	%cleanwin,	%g2
	rdhpr	%hsys_tick_cmpr,	%l5
	umul	%o7,	0x1609,	%i6
	set	0x68, %g1
	prefetcha	[%l7 + %g1] 0x11,	 0x3
	wrpr	%o0,	0x076A,	%tick
	rd	%tick_cmpr,	%i0
	wr	%g7,	%l2,	%clear_softint

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%g3,	%o6,	%pil
	rdpr	%otherwin,	%l3
	orncc	%o2,	%i2,	%i5
	fcmpes	%fcc3,	%f14,	%f6
	wr	%g6,	0x1311,	%y
	set	0x64, %g2
	sta	%f27,	[%l7 + %g2] 0x81
	fbn,a	%fcc1,	loop_520
	rdhpr	%htba,	%g1
	brz	%i7,	loop_521
	movrlez	%l4,	%l1,	%i3
loop_520:
	sll	%l0,	0x10,	%o4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_521:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x7E5, 	%hsys_tick_cmpr
	tvs	%xcc,	0x3
	movge	%icc,	%g5,	%o1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x9EF, 	%hsys_tick_cmpr
	wrpr	%l5,	0x02BC,	%tick
	rdpr	%gl,	%o3
	rdpr	%cleanwin,	%o7
	movl	%icc,	%i6,	%o0
	rdpr	%canrestore,	%i0
	te	%xcc,	0x5
	rdhpr	%hpstate,	%g7
	edge32	%l2,	%i1,	%g3
	rdpr	%gl,	%o6
	rd	%softint,	%l3
	rdpr	%cwp,	%o2
	wrpr	%i2,	%i5,	%cwp
	brgez,a	%g6,	loop_522
	alignaddrl	%g1,	%i4,	%l4
	fmovsneg	%icc,	%f31,	%f25
	bvs,a,pt	%icc,	loop_523
loop_522:
	wrpr	%i7,	%i3,	%pil
	rdhpr	%hintp,	%l0
	rd	%fprs,	%o4
loop_523:
	nop
	set	0x24, %l4
	stwa	%l1,	[%l7 + %l4] 0x0c
	ble	%xcc,	loop_524
	fpsub32s	%f12,	%f31,	%f13

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x777, 	%tick_cmpr
	fbuge,a	%fcc3,	loop_525
loop_524:
	rdpr	%cansave,	%l6
	movrgez	%o1,	%g5,	%l5
	rdpr	%wstate,	%o3
loop_525:
	rdhpr	%hpstate,	%g2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	membar	0x09
	edge32ln	%i0,	%o0,	%g7
	wrpr	%i1,	%g3,	%cwp
	fxnors	%f28,	%f25,	%f26
	alignaddr	%o6,	%l3,	%o2
	fbule	%fcc0,	loop_526
	fxors	%f10,	%f11,	%f19
	tvs	%xcc,	0x5
	rdpr	%tba,	%i2
loop_526:
	movl	%xcc,	%l2,	%g6
	movneg	%icc,	%g1,	%i5
	wrpr	%i4,	%l4,	%pil
	popc	0x06FD,	%i3
	xorcc	%l0,	0x149E,	%i7
	rd	%y,	%o4
	wrpr	%g4,	0x1B47,	%tick
	wr	%o5,	0x0B95,	%pic
	rdhpr	%hpstate,	%l1
	udivx	%l6,	0x03B2,	%o1
	rd	%asi,	%g5
	fmovsle	%xcc,	%f24,	%f12
	wrpr	%l5,	0x04E9,	%pil
	smulcc	%o3,	0x0DB1,	%o7
	fmovdl	%icc,	%f16,	%f30
	srax	%g2,	0x0C,	%i6
	st	%f6,	[%l7 + 0x6C]
	wrpr	%o0,	0x19EB,	%cwp
	rdhpr	%hpstate,	%i0
	rdpr	%cleanwin,	%g7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%l3,	0x0902,	%set_softint
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16l	%o2,	%i2,	%i1
	rdpr	%cwp,	%l2
	rdpr	%tl,	%g6
	rdhpr	%htba,	%i5
	fmovdcc	%icc,	%f31,	%f24
	edge32ln	%g1,	%i4,	%i3
	rd	%sys_tick_cmpr,	%l0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xAE2, 	%hsys_tick_cmpr
	fmovdn	%icc,	%f21,	%f5
	rd	%softint,	%o4
	movgu	%icc,	%g4,	%i7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%hsys_tick_cmpr,	%l1
	rd	%sys_tick_cmpr,	%g5
	rd	%pc,	%o1
	rd	%y,	%o3
	rd	%fprs,	%l5
	wrpr	%o7,	0x194E,	%pil
	fbu,a	%fcc3,	loop_527
	rdpr	%canrestore,	%g2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	edge8n	%i0,	%g3,	%g7
loop_527:
	fmovsvc	%icc,	%f8,	%f24

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	xorcc	%i2,	0x02E8,	%o6
	fabss	%f3,	%f6
	fxor	%f8,	%f24,	%f22
	rdhpr	%htba,	%i1
	wrpr	%l2,	0x1B70,	%cwp
	rdhpr	%hpstate,	%g6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	bpos,pn	%icc,	loop_528
	wr	%g1,	%l0,	%ccr
	wrpr	%l4,	%i3,	%tick
	rd	%ccr,	%g4
loop_528:
	movcc	%icc,	%o4,	%i7
	wr	%g0,	0x10,	%asi
	lda	[%l7 + 0x64] %asi,	%f10
	rd	%y,	%l6
	array8	%l1,	%o5,	%g5
	rd	%sys_tick_cmpr,	%o1
	rdhpr	%htba,	%l5
	wr	%g0,	0x89,	%asi
	swapa	[%l7 + 0x30] %asi,	%o3
	movle	%xcc,	%o7,	%g2
	rdpr	%tba,	%o0
	rd	%tick_cmpr,	%i0
	rdpr	%cwp,	%i6
	wrpr	%g3,	0x1CC8,	%cwp
	fmovrde	%l3,	%f2,	%f4
	umul	%o2,	%i2,	%o6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xED0, 	%hsys_tick_cmpr
	rd	%fprs,	%i1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fnot2	%f16,	%f4
	fpackfix	%f16,	%f18
	edge16ln	%g6,	%g1,	%l0
	wrpr	%i4,	%i3,	%pil
	rdhpr	%htba,	%g4
	wrpr	%l4,	%o4,	%tick
	orcc	%l6,	%l1,	%o5
	rdhpr	%hpstate,	%g5
	edge8	%o1,	%l5,	%o3
	ldd	[%l7 + 0x28],	%o6
	movpos	%icc,	%g2,	%o0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fmul8ulx16	%f22,	%f24,	%f6
	movcs	%xcc,	%i6,	%i7
	set	0x28, %g6
	stxa	%g3,	[%l7 + %g6] 0x23
	membar	#Sync
	wrpr	%l3,	0x0D10,	%pil
	rdpr	%canrestore,	%o2
	rd	%ccr,	%o6
	bne	loop_529
	rdpr	%wstate,	%i2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%g0,	0x22,	%asi
	stwa	%l2,	[%l7 + 0x78] %asi
	membar	#Sync
loop_529:
	rd	%fprs,	%i5
	fmovsleu	%xcc,	%f2,	%f12
	wr	%g0,	0x89,	%asi
	sta	%f7,	[%l7 + 0x40] %asi
	rd	%sys_tick_cmpr,	%g1
	rdhpr	%hpstate,	%g6
	rd	%tick_cmpr,	%l0
	bgu,pt	%icc,	loop_530
	ba	%icc,	loop_531
	addc	%i4,	%g4,	%l4
	set	0x30, %o4
	stha	%i3,	[%l7 + %o4] 0x18
loop_530:
	wrpr	%l6,	0x18CC,	%pil
loop_531:
	wr	%o4,	%o5,	%clear_softint
	ldsw	[%l7 + 0x6C],	%l1
	rdpr	%cleanwin,	%o1
	alignaddrl	%g5,	%o3,	%l5
	fblg,a	%fcc2,	loop_532
	alignaddrl	%o7,	%o0,	%i0
	rd	%softint,	%g2
	addcc	%i6,	0x08D2,	%g3
loop_532:
	edge32n	%l3,	%i7,	%o2
	be	loop_533
	rd	%y,	%i2
	umulcc	%g7,	0x08CE,	%o6
	wr	%l2,	%i1,	%y
loop_533:
	xorcc	%g1,	%i5,	%l0
	wrpr	%g6,	%g4,	%pil
	rd	%fprs,	%l4
	bne,a	loop_534
	rdpr	%cwp,	%i4
	wr	%l6,	0x0C94,	%clear_softint
	rd	%asi,	%o4
loop_534:
	wrpr	%i3,	0x186A,	%tick
	rdhpr	%hpstate,	%o5
	smulcc	%o1,	0x06B6,	%l1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%ccr,	%o7
	wr	%o0,	0x1BB9,	%y
	movvs	%icc,	%i0,	%l5
	rdhpr	%hintp,	%i6
	rd	%pc,	%g2
	and	%l3,	%i7,	%o2
	movgu	%xcc,	%g3,	%g7
	rdpr	%gl,	%o6
	fcmpd	%fcc0,	%f0,	%f26
	rdpr	%wstate,	%l2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%wstate,	%i2
	rd	%sys_tick_cmpr,	%i5
	wrpr	%l0,	0x19A2,	%tick
	movcs	%xcc,	%g1,	%g6
	wrpr	%g4,	0x0F85,	%tick
	srax	%i4,	%l6,	%o4
	rdhpr	%hsys_tick_cmpr,	%i3
	rdpr	%gl,	%o5
	rdpr	%otherwin,	%l4
	rdpr	%pil,	%o1
	rdpr	%otherwin,	%g5
	movre	%l1,	%o3,	%o7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	rdpr	%gl,	%o0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xC5D, 	%hsys_tick_cmpr
	movvs	%xcc,	%i0,	%g2
	rdpr	%tba,	%l3
	sir	0x12E0
	rd	%sys_tick_cmpr,	%i7
	rd	%y,	%g3
	fzero	%f4
	rdhpr	%hintp,	%o2
	movcs	%xcc,	%o6,	%g7
	sllx	%l2,	0x01,	%i2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x1EC, 	%hsys_tick_cmpr
	ldsb	[%l7 + 0x75],	%i1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x229, 	%hsys_tick_cmpr
	set	0x2E, %g7
	stba	%g4,	[%l7 + %g7] 0x23
	membar	#Sync

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%tick_cmpr,	%g1
	call	loop_535
	rdpr	%gl,	%o4
	rd	%pc,	%i3
	fmovsle	%icc,	%f25,	%f29
loop_535:
	edge32l	%o5,	%l4,	%l6
	rdhpr	%hsys_tick_cmpr,	%o1
	or	%l1,	0x096D,	%o3
	xnor	%o7,	0x0AE1,	%g5
	wr 	%g0, 	0x4, 	%fprs
	fmovrsne	%o0,	%f19,	%f22
	rd	%sys_tick_cmpr,	%i0
	wrpr	%g2,	%l3,	%cwp
	ldd	[%l7 + 0x18],	%i6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x36B, 	%tick_cmpr
	edge8ln	%g3,	%o6,	%o2
	rdpr	%pil,	%l2
	nop
	setx loop_536, %l0, %l1
	jmpl %l1, %i2
	wrpr	%i5,	%g7,	%pil
	fbu,a	%fcc1,	loop_537
	lduh	[%l7 + 0x16],	%l0
loop_536:
	rdhpr	%htba,	%i1
	wr	%g6,	%g4,	%clear_softint
loop_537:
	rdpr	%wstate,	%i4
	fmovdpos	%xcc,	%f19,	%f15
	rdpr	%cleanwin,	%o4
	rdhpr	%hsys_tick_cmpr,	%i3
	wrpr	%g1,	%o5,	%cwp
	rdhpr	%htba,	%l4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	edge8ln	%l1,	%o3,	%o7
	rd	%fprs,	%l5
	tleu	%icc,	0x5
	wr	%o0,	%g5,	%y
	rdhpr	%hpstate,	%i0
	rdhpr	%hsys_tick_cmpr,	%g2
	flush	%l7 + 0x28
	wr	%l3,	%i6,	%ccr
	rd	%pc,	%i7
	wr	%g0,	0x80,	%asi
	ldda	[%l7 + 0x50] %asi,	%o6
	rd	%ccr,	%o2
	movle	%xcc,	%g3,	%l2
	rdhpr	%htba,	%i2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	rd	%softint,	%i1
	rdhpr	%hpstate,	%g6
	wrpr	%g4,	%i4,	%cwp
	rdpr	%pil,	%l0
	stbar
	rdhpr	%hintp,	%o4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fcmpeq32	%f2,	%f14,	%i3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x883, 	%hsys_tick_cmpr
	rd	%ccr,	%l6
	stw	%o1,	[%l7 + 0x50]
	rdpr	%cleanwin,	%o3
	movrne	%l1,	0x1C1,	%o7
	rd	%y,	%o0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xC90, 	%hsys_tick_cmpr
	fmovsl	%xcc,	%f29,	%f5
	edge32n	%l5,	%g2,	%l3
	wrpr	%i7,	%i6,	%cwp
	rd	%tick_cmpr,	%o2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	edge8	%g3,	%i2,	%l2
	movrgz	%i5,	0x046,	%g7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xA40, 	%tick_cmpr
	wr	%i4,	0x152F,	%set_softint
	rd	%asi,	%g6
	fcmpne32	%f6,	%f18,	%l0
	rdhpr	%hsys_tick_cmpr,	%o4
	wrpr	%g1,	0x0138,	%tick
	wr	%o5,	0x18DA,	%softint
	rd	%ccr,	%i3
	wrpr	%l6,	0x1D03,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x915, 	%tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%softint,	%o1
	or	%o7,	%o0,	%l1
	fbn	%fcc0,	loop_538
	call	loop_539
	edge8ln	%i0,	%g5,	%l5
	rdhpr	%hintp,	%l3
loop_538:
	add	%i7,	0x120E,	%g2
loop_539:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%htba,	%i6
	wr 	%g0, 	0x5, 	%fprs
	wr	%i5,	0x03F3,	%softint
	srlx	%g7,	0x12,	%i2
	wrpr	%i1,	%g4,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xF26, 	%hsys_tick_cmpr
	taddcctv	%l0,	%i4,	%g1
	wr	%o4,	0x1E4A,	%set_softint
	wrpr	%o5,	%l6,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	and	%o0,	0x0093,	%o7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%cansave,	%g5
	nop
	setx	loop_540,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	rd	%pc,	%l5
	rdhpr	%htba,	%i7
	rd	%tick_cmpr,	%l3
loop_540:
	fmovdgu	%icc,	%f18,	%f0
	rd	%softint,	%g2
	rd	%y,	%o6
	wrpr	%i6,	0x0045,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xA14, 	%hsys_tick_cmpr
	edge8l	%o2,	%l2,	%g7
	rdpr	%tl,	%i5
	rd	%asi,	%i1
	wrpr	%i2,	%g6,	%cwp
	rdpr	%wstate,	%g4
	tne	%xcc,	0x4
	rdhpr	%hintp,	%i4
	rdpr	%otherwin,	%g1
	rdpr	%canrestore,	%l0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fmovd	%f20,	%f24
	rd	%sys_tick_cmpr,	%l6
	tgu	%icc,	0x1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xD14, 	%hsys_tick_cmpr
	ldstub	[%l7 + 0x7A],	%i3
	orn	%l4,	%o0,	%o7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x500, 	%hsys_tick_cmpr
	brlez,a	%l1,	loop_541
	andncc	%i0,	%l5,	%g5
	rdpr	%cwp,	%i7
	set	0x08, %l5
	swapa	[%l7 + %l5] 0x19,	%g2
loop_541:
	rd	%fprs,	%o6
	fbule	%fcc0,	loop_542
	rdhpr	%htba,	%l3
	edge32n	%i6,	%o2,	%l2
	srlx	%g3,	0x10,	%g7
loop_542:
	fnors	%f20,	%f0,	%f30
	rd	%sys_tick_cmpr,	%i1
	rd	%softint,	%i2
	rdhpr	%htba,	%g6
	rdpr	%otherwin,	%i5
	sra	%g4,	%i4,	%l0
	wrpr	%g1,	%o5,	%pil
	tpos	%xcc,	0x6
	rdhpr	%hpstate,	%l6
	fba	%fcc1,	loop_543
	rdpr	%cansave,	%o3
	rd	%y,	%o4
	rdhpr	%htba,	%l4
loop_543:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	wrpr	%o1,	0x0EC7,	%pil
	rd	%y,	%l1
	fmovrsgez	%i0,	%f25,	%f12

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x791, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	subcc	%g2,	%l3,	%o6
	mulx	%o2,	%i6,	%l2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	andn	%i2,	%i1,	%i5
	rdpr	%tl,	%g4
	fpsub16s	%f25,	%f10,	%f4
	wrpr	%g6,	0x08B5,	%cwp
	wrpr	%i4,	0x1DE1,	%cwp
	rdpr	%cleanwin,	%l0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	rd	%pc,	%o3
	rdhpr	%hsys_tick_cmpr,	%l6
	wrpr	%l4,	0x058A,	%tick
	wrpr	%i3,	%o0,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x937, 	%hsys_tick_cmpr
	rdpr	%wstate,	%l1
	fblg	%fcc3,	loop_544
	rdpr	%pil,	%o4
	pdist	%f6,	%f22,	%f12
	edge32l	%i0,	%g5,	%l5
loop_544:
	tcs	%icc,	0x0
	fba,a	%fcc0,	loop_545
	bvs,pn	%xcc,	loop_546
	rd	%ccr,	%o7
	rdpr	%wstate,	%g2
loop_545:
	wrpr	%l3,	%i7,	%pil
loop_546:
	rd	%sys_tick_cmpr,	%o2
	alignaddr	%i6,	%l2,	%g3
	bleu	%xcc,	loop_547
	fbo,a	%fcc2,	loop_548
	rd	%sys_tick_cmpr,	%o6
	rdhpr	%hintp,	%g7
loop_547:
	rdpr	%wstate,	%i2
loop_548:
	bleu	%icc,	loop_549
	wr	%i5,	0x1BD1,	%sys_tick
	wrpr	%i1,	0x1CC4,	%cwp
	srl	%g6,	0x10,	%i4
loop_549:
	tn	%xcc,	0x1
	rdpr	%tba,	%g4
	tleu	%xcc,	0x6
	wrpr	%l0,	0x18C5,	%tick
	rdhpr	%hsys_tick_cmpr,	%g1
	wrpr	%o3,	%o5,	%tick
	rdpr	%canrestore,	%l6
	rdhpr	%hpstate,	%i3
	rd	%pc,	%l4
	rdhpr	%hintp,	%o0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x8C3, 	%hsys_tick_cmpr
	wr 	%g0, 	0x7, 	%fprs
        wr    %g0,    0xe,    %pcr    ! changed.

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	rdhpr	%hpstate,	%g5
	alignaddrl	%g2,	%i7,	%l3
	rdpr	%cwp,	%i6
	subccc	%o2,	0x1952,	%g3
	add	%o6,	%g7,	%i2
	rdhpr	%hpstate,	%i5
	fmovrsgz	%l2,	%f13,	%f12
	fmovdle	%icc,	%f27,	%f0
	alignaddrl	%g6,	%i1,	%i4
	udiv	%l0,	0x0F0D,	%g4
	rd	%fprs,	%o3
	wrpr	%g1,	0x0B3E,	%cwp
	xor	%l6,	%i3,	%o5
	tge	%icc,	0x2
	rdhpr	%htba,	%o0
	array32	%l4,	%o1,	%l1
	fbo	%fcc2,	loop_550
	tcs	%xcc,	0x0
	nop
	set	0x0E, %i2
	sth	%o4,	[%l7 + %i2]
	and	%l5,	%o7,	%i0
loop_550:
	fcmple16	%f14,	%f6,	%g5
	wr	%i7,	%g2,	%sys_tick
	orncc	%l3,	0x12A4,	%o2
	wr	%i6,	0x0918,	%pic
	movcs	%xcc,	%o6,	%g3
	wrpr	%g7,	%i5,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%hintp,	%l2
	udiv	%g6,	0x0189,	%i1
	set	0x72, %o0
	lduha	[%l7 + %o0] 0x88,	%i4
	rd	%asi,	%g4
	wrpr	%l0,	0x1A7E,	%cwp
	wrpr	%g1,	0x0BAC,	%pil
	movn	%xcc,	%o3,	%l6
	fmovd	%f30,	%f26
	rdhpr	%hpstate,	%i3
	movle	%xcc,	%o0,	%l4
	edge8ln	%o1,	%o5,	%o4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fandnot2	%f28,	%f18,	%f6
	rdhpr	%hintp,	%l1
	rdhpr	%hsys_tick_cmpr,	%o7
	fxnor	%f26,	%f16,	%f8
	edge8l	%g5,	%i7,	%i0
	rd	%softint,	%l3
	rd	%ccr,	%g2
	rdpr	%cansave,	%o2
	movcs	%xcc,	%o6,	%g3
	rd	%pc,	%g7
	wrpr	%i5,	0x0A81,	%cwp
	wr	%i6,	%i2,	%ccr
	andncc	%g6,	%l2,	%i4
        wr    %g0,    0xe,    %pcr    ! changed.
	wr	%l0,	0x04F0,	%y

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%fprs,	%g1
	edge16l	%i3,	%l6,	%l4
	wr	%o1,	%o5,	%clear_softint
	edge8ln	%o0,	%l5,	%o4
	rd	%tick_cmpr,	%o7
	wrpr	%l1,	0x14CD,	%tick
	rdhpr	%hsys_tick_cmpr,	%g5
	rd	%softint,	%i7
	wrpr	%l3,	%i0,	%pil
	wr	%o2,	0x06A7,	%ccr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x9EE, 	%hsys_tick_cmpr
	stx	%g7,	[%l7 + 0x30]
	wrpr	%i5,	0x023B,	%tick
	bshuffle	%f12,	%f2,	%f10
	andncc	%g2,	%i6,	%i2
	rdpr	%tba,	%g6
	rdhpr	%hintp,	%i4
	bvc,a,pt	%xcc,	loop_551
	swap	[%l7 + 0x7C],	%i1
	subccc	%l0,	%l2,	%o3
	rd	%softint,	%g1
loop_551:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x802, 	%hsys_tick_cmpr
	fmovdgu	%xcc,	%f18,	%f16
	fbu	%fcc0,	loop_552
	orncc	%l6,	0x0612,	%i3
	rd	%ccr,	%l4
	bvs,a,pt	%icc,	loop_553
loop_552:
	movcs	%xcc,	%o1,	%o5
	wrpr	%l5,	%o0,	%tick
	fnot2	%f24,	%f18
loop_553:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fbule,a	%fcc2,	loop_554
	wr	%g5,	%l1,	%ccr
	nop
	setx loop_555, %l0, %l1
	jmpl %l1, %i7
        wr    %g0,    0xe,    %pcr    ! changed.
loop_554:
	rdpr	%wstate,	%o2
	wrpr	%o6,	0x114F,	%cwp
loop_555:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xC8B, 	%hsys_tick_cmpr
	wr	%i0,	0x1321,	%ccr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x9D8, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%i5,	%g6,	%y
	rdpr	%gl,	%i4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x138, 	%hsys_tick_cmpr
	rdpr	%pil,	%l2
	andn	%o3,	0x0A29,	%g1
	fmovrdgz	%i1,	%f16,	%f12
	wrpr	%g4,	0x1710,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x252, 	%hsys_tick_cmpr
	fmuld8ulx16	%f24,	%f15,	%f24
	rd	%fprs,	%l4
	rd	%fprs,	%o1
	rdpr	%canrestore,	%o5
	orn	%l5,	%o0,	%o7
	tge	%xcc,	0x0
	rdpr	%cleanwin,	%o4
	movcc	%xcc,	%g5,	%i3
        wr    %g0,    0xe,    %pcr    ! changed.
	edge32n	%l1,	%o2,	%l3
	bcc,pn	%xcc,	loop_556
	rdpr	%tl,	%g3
	rdhpr	%hsys_tick_cmpr,	%o6
	rdhpr	%htba,	%i0
loop_556:
	wr	%g2,	%g7,	%set_softint
	rdhpr	%htba,	%i6
	wr	%i5,	%i2,	%set_softint
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16l	%i4,	%l0,	%g6
	wr	%l2,	0x0E63,	%ccr
	rd	%ccr,	%g1
	fabss	%f11,	%f12
	fbne,a	%fcc2,	loop_557
	wr	%i1,	%o3,	%pic
	rdhpr	%hsys_tick_cmpr,	%g4
	wrpr	%l6,	0x192E,	%tick
loop_557:
	ldsh	[%l7 + 0x08],	%l4
	rd	%pc,	%o1
	srl	%l5,	%o5,	%o0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ba,a	loop_558
	fmovrdlz	%o4,	%f26,	%f4
	movge	%icc,	%g5,	%o7
	stx	%i3,	[%l7 + 0x30]
loop_558:
	membar	0x3F
	rdpr	%pil,	%l1
	rd	%ccr,	%i7
	rdpr	%wstate,	%l3
	wrpr	%o2,	0x0FE7,	%cwp
	tpos	%xcc,	0x0
	rd	%softint,	%g3
	subccc	%i0,	0x0F32,	%o6
	wr	%g2,	0x1C87,	%set_softint
	wrpr	%g7,	0x122A,	%cwp
	rdpr	%cleanwin,	%i5
	edge32l	%i2,	%i4,	%l0
	fnor	%f10,	%f14,	%f24
	alignaddr	%g6,	%l2,	%g1
	sdivx	%i1,	0x04A9,	%o3
	rd	%asi,	%i6
	fmovrsgez	%l6,	%f26,	%f0
	rdhpr	%hsys_tick_cmpr,	%l4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x436, 	%hsys_tick_cmpr
	rdpr	%cleanwin,	%l5
	set	0x44, %l2
	lduwa	[%l7 + %l2] 0x88,	%g4
	ldsh	[%l7 + 0x36],	%o5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	rdpr	%gl,	%g5
	rd	%asi,	%o7
	rdpr	%cleanwin,	%o4
	rdpr	%otherwin,	%i3
	wr	%i7,	0x186C,	%softint
	umul	%l3,	0x1E6E,	%l1
	wrpr	%g3,	0x1FD7,	%cwp
	tcs	%icc,	0x0
	edge16l	%o2,	%i0,	%g2
	srl	%o6,	0x05,	%g7
	rdhpr	%htba,	%i2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%htba,	%l0
	rdpr	%cansave,	%i4
	rdhpr	%hintp,	%l2
	rd	%fprs,	%g6
	rdpr	%pil,	%g1
	fmovdg	%xcc,	%f5,	%f14
	andn	%i1,	0x1DC9,	%i6
	ldd	[%l7 + 0x48],	%o2
	rdhpr	%hintp,	%l6
	rdpr	%otherwin,	%l4
	andncc	%o1,	%g4,	%l5
	rdhpr	%hsys_tick_cmpr,	%o0
	edge32n	%g5,	%o7,	%o4
	rdhpr	%hpstate,	%o5
	rdhpr	%hpstate,	%i3
	rdpr	%otherwin,	%i7
	rd	%pc,	%l1
	movvs	%xcc,	%l3,	%o2
	rdhpr	%hsys_tick_cmpr,	%i0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x0D6, 	%hsys_tick_cmpr
	wrpr	%o6,	0x062C,	%pil
	wrpr	%g3,	%i2,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%l0,	%i4,	%clear_softint
	rdpr	%cleanwin,	%l2
	set	0x48, %i6
	lduwa	[%l7 + %i6] 0x11,	%g6
	fbug	%fcc1,	loop_559
	wrpr	%g1,	%i5,	%pil
	udivcc	%i6,	0x0215,	%o3
	rdpr	%pil,	%i1
loop_559:
	rdpr	%wstate,	%l6
	addcc	%o1,	0x065A,	%l4
	fbuge	%fcc3,	loop_560
	wr	%l5,	%o0,	%ccr
	ldsw	[%l7 + 0x68],	%g4
	edge8n	%o7,	%o4,	%o5
loop_560:
	brnz,a	%g5,	loop_561
	rdhpr	%hpstate,	%i7
	add	%l7,	0x14,	%l6
	wr	%g0,	0x18,	%asi
	lda	[%l6] %asi,	%i3
	casa	[%l6] 0x18,	%i3,	%l3
loop_561:
	wrpr	%o2,	0x061E,	%pil
	rdhpr	%hintp,	%i0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x780, 	%hsys_tick_cmpr
	rdhpr	%hpstate,	%g3
	rdpr	%canrestore,	%o6
	tle	%icc,	0x3
	rdpr	%gl,	%i2
	fbuge	%fcc3,	loop_562
	mulx	%g7,	0x00B9,	%l0
	movcc	%xcc,	%i4,	%l2
	wrpr	%g6,	0x1B73,	%pil
loop_562:
	sir	0x15B0
	srax	%g1,	0x1A,	%i6
	rdpr	%wstate,	%i5
	brnz	%i1,	loop_563
	wr 	%g0, 	0x7, 	%fprs
	wr	%o1,	0x166B,	%sys_tick
	sll	%o3,	0x0E,	%l4
loop_563:
	subcc	%o0,	0x0F21,	%l5
	wr	%g4,	%o4,	%softint
	movge	%icc,	%o7,	%o5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x547, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	set	0x1C, %o2
	stba	%l3,	[%l7 + %o2] 0x22
	membar	#Sync
	set	0x7C, %o7
	ldsba	[%l7 + %o7] 0x80,	%g5
	stbar
	rdpr	%pil,	%i0
	fbe	%fcc0,	loop_564
	wrpr	%g2,	%l1,	%cwp
	fandnot1s	%f10,	%f5,	%f6
	rd	%tick_cmpr,	%g3
loop_564:
	bgu,a,pn	%icc,	loop_565
	wrpr	%o6,	0x1FA0,	%pil
	rd	%softint,	%i2
	fbule	%fcc2,	loop_566
loop_565:
	tg	%xcc,	0x4
	mulscc	%g7,	%o2,	%l0
	fbg,a	%fcc0,	loop_567
loop_566:
	rdhpr	%hpstate,	%l2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xE04, 	%tick_cmpr
	wrpr	%i6,	%g6,	%pil
loop_567:
	fmovrsgez	%i5,	%f5,	%f5
	addcc	%l6,	0x0C30,	%i1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x7D7, 	%hsys_tick_cmpr
	bvs	%icc,	loop_568
	addccc	%o0,	%l5,	%o3
	rdpr	%otherwin,	%o4
	wr	%o7,	%g4,	%softint
loop_568:
	rdpr	%cleanwin,	%i7
	prefetch	[%l7 + 0x3C],	 0x2
	rdpr	%pil,	%o5
	fzero	%f26
	wr	%l3,	%g5,	%set_softint
	fmovrsne	%i0,	%f3,	%f27
	set	0x48, %g3
	stxa	%g2,	[%l7 + %g3] 0xea
	membar	#Sync

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xE94, 	%hsys_tick_cmpr
	fbul,a	%fcc3,	loop_569
	rd	%asi,	%i2
	ld	[%l7 + 0x44],	%f21
	nop
	setx	loop_570,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_569:
	rd	%y,	%g7
	fmul8x16al	%f17,	%f31,	%f18
	wr	%o6,	%l0,	%set_softint
loop_570:
	rdpr	%pil,	%o2
	tneg	%xcc,	0x5
	wrpr	%i4,	%l2,	%pil
	wr	%g1,	0x04C5,	%pic
	rd	%asi,	%i6
	fbg	%fcc3,	loop_571
	rdpr	%cleanwin,	%g6
	rdpr	%gl,	%i5
	rd	%fprs,	%l6
loop_571:
	rd	%sys_tick_cmpr,	%i1
	taddcc	%l4,	%o1,	%l5
	bpos	%xcc,	loop_572
	bleu	loop_573
	fpack16	%f20,	%f21

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_572:
	tvc	%xcc,	0x1
loop_573:
	rd	%sys_tick_cmpr,	%o3
	rd	%asi,	%o4
	rdpr	%pil,	%o7
	rdhpr	%hintp,	%g4
	wrpr	%i7,	%o5,	%cwp
	ld	[%l7 + 0x70],	%f30
	fmovs	%f1,	%f5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	srl	%i0,	0x09,	%i3
	rdhpr	%htba,	%l1
	fpadd16s	%f7,	%f27,	%f25
	movcc	%icc,	%g3,	%i2
	edge16ln	%g2,	%o6,	%l0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xA55, 	%hsys_tick_cmpr
	sllx	%i4,	%g7,	%g1
	wrpr	%l2,	%i6,	%pil
	rd	%asi,	%i5
	wrpr	%g6,	%i1,	%tick
	wrpr	%l4,	%o1,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x474, 	%sys_tick_cmpr
	fbe,a	%fcc2,	loop_574
	rdhpr	%hpstate,	%o0
	wrpr	%o3,	%l6,	%tick
	srlx	%o4,	0x06,	%g4
loop_574:
	wrpr	%o7,	%o5,	%tick
	rd	%sys_tick_cmpr,	%i7
	fba,a	%fcc1,	loop_575
	fba,a	%fcc3,	loop_576
	array32	%g5,	%i0,	%l3
	rd	%asi,	%i3
loop_575:
	ldsh	[%l7 + 0x52],	%l1
loop_576:
	wrpr	%i2,	%g2,	%cwp
	fmovsn	%icc,	%f31,	%f17

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%cansave,	%l0
	rdpr	%tba,	%o2
	rdpr	%cwp,	%i4
	tneg	%icc,	0x1
	movl	%icc,	%g1,	%l2
	fmovrdlz	%g7,	%f24,	%f18
	wrpr	%i6,	0x1240,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%i5,	0x0CDE,	%tick
	fmovdge	%xcc,	%f7,	%f17

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	bcc,a	%xcc,	loop_577
	ldsb	[%l7 + 0x2C],	%l5
	rd	%softint,	%l4
	wrpr	%o0,	0x1F99,	%tick
loop_577:
	movcc	%icc,	%o3,	%o4
	fcmpeq32	%f22,	%f30,	%g4
	rd	%y,	%o7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%i7,	%g5,	%pil
	sllx	%i0,	%i3,	%l3
	rdpr	%cleanwin,	%i2
	rdpr	%canrestore,	%l1
	brz	%g2,	loop_578
	rd	%ccr,	%g3
	rdpr	%cwp,	%o6
	edge8	%l0,	%o2,	%i4
loop_578:
	fnands	%f0,	%f23,	%f17

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x862, 	%hsys_tick_cmpr
	rd	%y,	%g6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x3BD, 	%hsys_tick_cmpr
	rd	%y,	%l4
	rd	%softint,	%o0
	rd	%fprs,	%o1
	wrpr	%o3,	%g4,	%pil
	fmovdvs	%icc,	%f17,	%f3
	movneg	%xcc,	%o4,	%o7
	rd	%asi,	%o5
	std	%i6,	[%l7 + 0x28]

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x69B, 	%hsys_tick_cmpr
	rdhpr	%hpstate,	%i3
	xorcc	%l3,	%i0,	%i2
	wr 	%g0, 	0x7, 	%fprs
	rd	%pc,	%g3
	sra	%l0,	%o2,	%i4
	wr	%o6,	%l2,	%softint
	tge	%icc,	0x7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xB86, 	%hsys_tick_cmpr
	membar	0x3E
	andncc	%i1,	%g7,	%i5
	rdpr	%cleanwin,	%l5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x63F, 	%sys_tick_cmpr
	rdpr	%tl,	%o0
	fmul8x16	%f12,	%f14,	%f22
	rdpr	%pil,	%o1
	sir	0x10AE
	rdpr	%wstate,	%o3
	tge	%xcc,	0x6
	rdhpr	%htba,	%l4
	wr	%g4,	%o4,	%set_softint
	rdhpr	%hsys_tick_cmpr,	%o7
	wr	%g0,	0x80,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	rdhpr	%htba,	%l6
	wrpr	%o5,	0x0297,	%cwp
	array16	%g5,	%i7,	%i3
	wrpr	%i0,	%l3,	%tick
	rdpr	%cleanwin,	%l1
	fabsd	%f2,	%f24
	wrpr	%i2,	0x0B03,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%hintp,	%o2
	rd	%pc,	%g2
	taddcctv	%i4,	0x1308,	%o6
	wrpr	%l2,	%g1,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xCE2, 	%sys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	fmovsneg	%icc,	%f30,	%f8
	wr 	%g0, 	0x5, 	%fprs
	wrpr	%i5,	%g6,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xCB4, 	%tick_cmpr
	wr	%o1,	0x1F93,	%clear_softint
	smulcc	%o3,	%g4,	%o4
	wrpr	%l4,	0x08C8,	%cwp
	rd	%fprs,	%o7
	rdpr	%cwp,	%o5
	rdpr	%cansave,	%g5
	rdpr	%cansave,	%i7
	rd	%tick_cmpr,	%l6
	addcc	%i3,	%l3,	%l1
	set	0x0C, %l1
	lduwa	[%l7 + %l1] 0x11,	%i0
	sethi	0x0A05,	%i2
	rd	%softint,	%g3
	movrlz	%l0,	0x009,	%g2
	tge	%xcc,	0x5
	rdpr	%cansave,	%i4
	te	%xcc,	0x0
	rdpr	%otherwin,	%o2
	rdpr	%gl,	%o6
	fpsub16s	%f29,	%f31,	%f1
	rd	%ccr,	%l2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xFEB, 	%hsys_tick_cmpr
	st	%f28,	[%l7 + 0x28]
        wr    %g0,    0xe,    %pcr    ! changed.
	fbl	%fcc0,	loop_579
	orcc	%g6,	0x1698,	%o0
	rd	%fprs,	%l5
	fcmpne16	%f18,	%f12,	%o1
loop_579:
	rdpr	%pil,	%i5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fmovdpos	%icc,	%f8,	%f19
	rdhpr	%hpstate,	%o4
	smulcc	%l4,	%o7,	%o5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	bpos,a	%xcc,	loop_580
	rdpr	%wstate,	%i7
	tsubcc	%i3,	0x1B87,	%l3
	andncc	%l6,	%i0,	%i2
loop_580:
	umulcc	%g3,	0x03E0,	%l0
	nop
	set	0x14, %i4
	lduh	[%l7 + %i4],	%g2
	xnor	%l1,	%o2,	%i4
	rdpr	%cansave,	%o6
	wrpr	%i6,	%l2,	%cwp
	wrpr	%g1,	0x03DE,	%tick
	rdhpr	%htba,	%g7
	smul	%i1,	%o0,	%g6
	movre	%l5,	0x231,	%i5
	taddcc	%o3,	%o4,	%o1
	movrlz	%o7,	0x05B,	%l4
	taddcctv	%g5,	%g4,	%i7
	rdpr	%tl,	%o5
	rdhpr	%hpstate,	%i3
	fbg	%fcc2,	loop_581
	mulx	%l3,	%l6,	%i0
	wrpr	%g3,	0x083F,	%pil
	tge	%icc,	0x7
loop_581:
	rdhpr	%hintp,	%l0
	nop
	setx	loop_582,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	edge32ln	%i2,	%g2,	%o2
	movgu	%icc,	%i4,	%o6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_582:
	rdpr	%wstate,	%g1
	movge	%icc,	%g7,	%l2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x342, 	%hsys_tick_cmpr
	andncc	%o0,	%l5,	%i5
	fnot1	%f30,	%f6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x0F6, 	%hsys_tick_cmpr
	rdpr	%otherwin,	%o4
	movgu	%icc,	%o7,	%l4
	tvc	%icc,	0x0
	rd	%asi,	%o1
	wr	%g5,	0x02B0,	%set_softint

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
	rdpr	%wstate,	%i7
	wr	%g0,	0x89,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	andncc	%i3,	%l3,	%l6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%cwp,	%l0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	movvs	%icc,	%o5,	%o2
	lduh	[%l7 + 0x48],	%o6
	rdhpr	%hintp,	%l1
	rd	%sys_tick_cmpr,	%i6
	wrpr	%g1,	0x007B,	%pil
	rdpr	%tba,	%g7
	rd	%y,	%i4
	tn	%xcc,	0x3
	bg,a,pn	%xcc,	loop_583
	wr	%i1,	%l2,	%set_softint
	set	0x68, %g5
	ldstuba	[%l7 + %g5] 0x89,	%l5
loop_583:
	rdpr	%wstate,	%i5
	tneg	%icc,	0x1
	rd	%pc,	%o0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x433, 	%hsys_tick_cmpr
	nop
	setx	loop_584,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fmovdle	%xcc,	%f1,	%f31
	tsubcctv	%o4,	%o7,	%l4
	mulx	%o3,	0x187C,	%o1
loop_584:
	wrpr	%g5,	%i7,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	add	%l3,	%l6,	%i0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	brgez,a	%g3,	loop_585
	movl	%xcc,	%g2,	%o5
	wr	%i2,	%o6,	%set_softint
	fones	%f28
loop_585:
	movcc	%xcc,	%o2,	%l1
	rdhpr	%hsys_tick_cmpr,	%g1
	rdhpr	%hpstate,	%i6
	movleu	%xcc,	%g7,	%i1
	fcmple32	%f10,	%f10,	%i4
	movcc	%xcc,	%l5,	%i5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xB4A, 	%sys_tick_cmpr
	edge16l	%g6,	%o4,	%o0
	nop
	setx	loop_586,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	rdpr	%gl,	%l4
	wrpr	%o7,	%o1,	%cwp
	rdpr	%cansave,	%o3
loop_586:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x00B, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xABD, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%i3,	0x1E95,	%pil
	wr	%l3,	%g3,	%clear_softint
	rdpr	%canrestore,	%l0
	and	%g2,	%i2,	%o6
	rd	%tick_cmpr,	%o2
	wrpr	%l1,	%g1,	%cwp
	stw	%o5,	[%l7 + 0x5C]
	wr	%i6,	0x1942,	%ccr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%g0,	0x0c,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x2DE, 	%sys_tick_cmpr
	wr	%g0,	0x11,	%asi
	ldsba	[%l7 + 0x0C] %asi,	%l5
	wr	%l2,	%g6,	%y
	rdpr	%cleanwin,	%o4
	wr	%o0,	%i5,	%softint
	wr	%o7,	0x1EB6,	%softint

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	xor	%l4,	%i7,	%o3
	wrpr	%g5,	0x11C8,	%pil
	rdhpr	%hintp,	%g4
	rdpr	%cwp,	%l6
	rdpr	%wstate,	%i3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	sdivx	%l3,	0x03EC,	%g3
	and	%l0,	%g2,	%o6
	wr	%i2,	%l1,	%softint
	rdpr	%cansave,	%g1
	wrpr	%o2,	%o5,	%tick
	rdpr	%tl,	%i1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	faligndata	%f10,	%f10,	%f12
	movcs	%xcc,	%i4,	%l5
	umul	%g6,	%o4,	%l2
	rd	%ccr,	%i5
	for	%f26,	%f16,	%f0
	wrpr	%o7,	%o1,	%cwp
	rd	%ccr,	%o0
	rdhpr	%hintp,	%i7
	rdpr	%canrestore,	%o3
	rd	%pc,	%l4
	rdhpr	%hintp,	%g4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array16	%l6,	%i3,	%i0
	rdpr	%pil,	%g5
	wr	%l3,	0x18F0,	%sys_tick
	bne,pt	%xcc,	loop_587
	fmovde	%xcc,	%f15,	%f3
	movrne	%g3,	0x078,	%l0
	rdhpr	%htba,	%g2
loop_587:
	wrpr	%i2,	0x160F,	%pil
	orcc	%l1,	0x0DAA,	%o6
	wr	%g1,	0x1280,	%ccr
	rd	%ccr,	%o2
	wr 	%g0, 	0x5, 	%fprs
	wrpr	%i6,	%o5,	%tick
	tg	%xcc,	0x0
	xnor	%g7,	0x10C9,	%l5
	wrpr	%i4,	0x063A,	%pil
	andncc	%g6,	%o4,	%i5
	fmovdneg	%icc,	%f15,	%f11
	rdhpr	%hpstate,	%o7
	alignaddrl	%l2,	%o1,	%o0
	tpos	%icc,	0x2
	st	%f19,	[%l7 + 0x50]
	rd	%pc,	%o3
	fble,a	%fcc0,	loop_588
	rd	%pc,	%i7
	ldd	[%l7 + 0x20],	%f0
	wrpr	%g4,	%l4,	%pil
loop_588:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	bgu,a,pn	%xcc,	loop_589
	fornot1	%f22,	%f20,	%f0
	rdpr	%gl,	%g5
	rdpr	%cansave,	%i3
loop_589:
	wrpr	%l3,	%l0,	%pil
	for	%f30,	%f18,	%f10
	membar	0x3A
	rd	%tick_cmpr,	%g3
	edge16	%g2,	%i2,	%l1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x4BD, 	%hsys_tick_cmpr
	wrpr	%o6,	%i1,	%pil
	rdhpr	%htba,	%i6
	rdpr	%otherwin,	%o2
	rd	%fprs,	%o5
	movleu	%icc,	%g7,	%i4
	fcmpgt32	%f8,	%f26,	%g6
	movleu	%icc,	%l5,	%o4
	tcc	%icc,	0x6
	alignaddr	%i5,	%l2,	%o7
	movre	%o0,	%o3,	%o1
	wrpr	%g4,	0x1603,	%pil
	orcc	%i7,	0x06BC,	%l6
	nop
	setx	loop_590,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	mova	%xcc,	%i0,	%g5
	wr	%i3,	%l4,	%pic
	wrpr	%l3,	0x1474,	%cwp
loop_590:
	wr	%g3,	0x0576,	%softint

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xB92, 	%hsys_tick_cmpr
	tvs	%icc,	0x4
	rd	%tick_cmpr,	%i2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%hintp,	%i1
	movvc	%xcc,	%i6,	%o5
	xorcc	%g7,	%o2,	%g6
	sub	%l5,	0x0F42,	%o4
	rd	%y,	%i5
	xnorcc	%i4,	%o7,	%o0
	fbn	%fcc3,	loop_591
	rdpr	%cwp,	%l2
	rdhpr	%hintp,	%o1
	wrpr	%o3,	0x1407,	%pil
loop_591:
	edge32	%i7,	%l6,	%i0
	bcs,a	loop_592
	edge16n	%g4,	%i3,	%g5
	fnegd	%f2,	%f26
	movg	%xcc,	%l4,	%l3
loop_592:
	rd	%asi,	%l0
	wr 	%g0, 	0x5, 	%fprs
	fbe	%fcc1,	loop_593
	andncc	%l1,	%g1,	%g2
	fors	%f23,	%f7,	%f26
	fmovsg	%xcc,	%f16,	%f16
loop_593:
	fornot1s	%f11,	%f23,	%f1
	rdpr	%tl,	%o6
	rd	%sys_tick_cmpr,	%i6
	tvc	%xcc,	0x4
	wr	%g0,	0x18,	%asi
	lduba	[%l7 + 0x6D] %asi,	%i1
	wrpr	%o5,	%g7,	%pil
	fbuge	%fcc2,	loop_594
	rdpr	%wstate,	%g6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	movn	%xcc,	%l5,	%o4
loop_594:
	tsubcc	%i4,	%o7,	%o0
	rdhpr	%hpstate,	%i5
	sir	0x172C
	fmovspos	%icc,	%f8,	%f21

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xF0D, 	%sys_tick_cmpr
	ba,pt	%xcc,	loop_595
	wr	%l2,	%o3,	%softint
	fnegs	%f8,	%f5
	rd	%softint,	%i7
loop_595:
	sethi	0x0336,	%l6
	tsubcc	%i0,	0x15BB,	%i3
	wrpr	%g5,	%l4,	%pil
	flush	%l7 + 0x2C
	nop
	setx	loop_596,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	rdhpr	%htba,	%l3
	wrpr	%g4,	%g3,	%tick
	rdpr	%gl,	%l0
loop_596:
	fmovdcs	%xcc,	%f30,	%f15
	mulscc	%l1,	0x1A6B,	%g1
	add	%l7,	0x28,	%l6
	wr	%g0,	0x19,	%asi
	lda	[%l6] %asi,	%i2
	casa	[%l6] %asi,	%i2,	%g2
	rdhpr	%htba,	%o6
	fpadd32s	%f3,	%f0,	%f15
	rd	%ccr,	%i1
	nop
	setx	loop_597,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	rd	%asi,	%i6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%htba,	%g6
loop_597:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fbge	%fcc1,	loop_598
	rdpr	%pil,	%g7
	rd	%tick_cmpr,	%o4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_598:
	wrpr	%i4,	0x0258,	%tick
	wr 	%g0, 	0x4, 	%fprs
	wrpr	%o0,	0x046B,	%pil
	brgez,a	%o7,	loop_599
	wrpr	%o1,	0x1BA6,	%pil
	tl	%icc,	0x7
	rdhpr	%htba,	%l2
loop_599:
	rd	%fprs,	%i5
	rdpr	%tl,	%o3
	rdhpr	%htba,	%l6
	rd	%asi,	%i0
	movneg	%xcc,	%i7,	%i3
	rdpr	%pil,	%g5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x72E, 	%hsys_tick_cmpr
	rdhpr	%hintp,	%g4
	tleu	%icc,	0x5
	sra	%l4,	0x1B,	%l0
	wr	%l1,	0x1CD6,	%y
	fbul	%fcc0,	loop_600
	tge	%icc,	0x1
	udivx	%g3,	0x15F9,	%i2
	tle	%xcc,	0x3
loop_600:
	rdpr	%cleanwin,	%g1
	array8	%g2,	%i1,	%i6
        wr    %g0,    0xe,    %pcr    ! changed.
	tle	%icc,	0x5
	wr	%g0,	0x04,	%asi
	ldswa	[%l7 + 0x50] %asi,	%o5
	rdpr	%cleanwin,	%g6
	taddcctv	%o2,	%g7,	%o4
	tsubcc	%l5,	0x1096,	%o0
	movg	%icc,	%o7,	%o1
	fblg,a	%fcc1,	loop_601
	fmovrsgez	%l2,	%f24,	%f14
	rdhpr	%hsys_tick_cmpr,	%i5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x790, 	%sys_tick_cmpr
loop_601:
	tsubcctv	%l6,	%i7,	%i0
	wrpr	%i3,	0x0E92,	%pil
	wrpr	%g5,	0x0A56,	%pil
	movvc	%xcc,	%g4,	%l3
	fmovdne	%xcc,	%f18,	%f9
	rd	%ccr,	%l4
	fmovdn	%xcc,	%f4,	%f15
	be	%xcc,	loop_602
	subccc	%l0,	0x1060,	%g3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x03A, 	%tick_cmpr
	tvs	%xcc,	0x6
loop_602:
	fzero	%f24
	rdpr	%cleanwin,	%g1
	wr	%g2,	%l1,	%set_softint
	rd	%ccr,	%i1
	rdhpr	%hpstate,	%o6
	rdpr	%canrestore,	%i6
	rdpr	%otherwin,	%g6
	rd	%softint,	%o5
	rd	%softint,	%g7
	rdhpr	%hsys_tick_cmpr,	%o2
	bleu,a	loop_603
	movn	%xcc,	%o4,	%o0
	and	%o7,	0x0D51,	%o1
	tl	%icc,	0x6
loop_603:
	edge32ln	%l5,	%l2,	%i5
	rd	%y,	%o3
	rdpr	%pil,	%i4
	fmovdn	%icc,	%f2,	%f20
	fbo	%fcc3,	loop_604
	wrpr	%l6,	0x114C,	%pil
	wrpr	%i7,	%i3,	%cwp
	wrpr	%i0,	%g4,	%tick
loop_604:
	te	%icc,	0x7
	tn	%xcc,	0x2
	rdhpr	%hintp,	%g5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	mulx	%l0,	0x14D4,	%g3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fmovdneg	%icc,	%f21,	%f28
	wrpr	%l1,	%g1,	%cwp
	wrpr	%i1,	0x0BE5,	%tick
	fmovsg	%xcc,	%f4,	%f27
	rdhpr	%hsys_tick_cmpr,	%i6
	wrpr	%g6,	0x1E73,	%cwp
	fone	%f2
	wrpr	%o6,	0x0D22,	%tick
	subc	%o5,	%g7,	%o2
	orcc	%o0,	0x1945,	%o7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%l2,	%o3,	%set_softint
	subccc	%i5,	0x0FA5,	%i4
	rdpr	%cleanwin,	%i7
	tvs	%icc,	0x5
	rd	%asi,	%l6
	andn	%i0,	0x0A75,	%g4
	fmovsge	%xcc,	%f14,	%f26
	wrpr	%g5,	0x00B6,	%cwp
	rdpr	%cansave,	%l3
	wr	%i3,	%l0,	%softint
	mova	%xcc,	%g3,	%l4
	rdpr	%canrestore,	%i2
	fmovsle	%xcc,	%f4,	%f23
	srax	%g2,	%l1,	%g1
	fpadd32s	%f3,	%f25,	%f12
	set	0x26, %i7
	stha	%i6,	[%l7 + %i7] 0x22
	membar	#Sync
	tpos	%xcc,	0x5
	edge32n	%i1,	%g6,	%o6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	srlx	%o2,	%o0,	%o4
	add	%l5,	0x0DB0,	%o1
	wrpr	%l2,	0x0580,	%tick
	stw	%o3,	[%l7 + 0x7C]
	tsubcctv	%o7,	0x157F,	%i5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	edge8ln	%l6,	%g4,	%g5
	wr	%i0,	0x0DD3,	%clear_softint
	tl	%icc,	0x2
	wrpr	%l3,	0x1979,	%cwp
	rdhpr	%hpstate,	%l0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xFA9, 	%hsys_tick_cmpr
	fmovscs	%icc,	%f24,	%f16
	rdpr	%tba,	%g3
        wr    %g0,    0xe,    %pcr    ! changed.
	bcc	loop_605
	rdhpr	%hpstate,	%l4
	wrpr	%g1,	0x03FF,	%cwp
	wr	%l1,	0x1412,	%pic
loop_605:
	fmuld8sux16	%f5,	%f8,	%f16
	or	%i1,	0x1C80,	%i6
	srlx	%g6,	0x06,	%o5
	mulx	%o6,	%o2,	%g7
	andcc	%o0,	0x08AA,	%o4
	rd	%pc,	%o1
	tne	%icc,	0x5
	or	%l2,	0x049E,	%l5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	wrpr	%i7,	%o7,	%tick
	rdpr	%wstate,	%l6
	rdhpr	%hintp,	%g4
	fxnors	%f28,	%f5,	%f7
	fbne,a	%fcc1,	loop_606
	srax	%i4,	0x1B,	%g5
	edge32ln	%l3,	%i0,	%l0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
loop_606:
	rd	%pc,	%g3
	rdpr	%tl,	%i2
	wr	%l4,	%g1,	%pic
	rd	%ccr,	%g2
	lduh	[%l7 + 0x7A],	%i1
	rdhpr	%hpstate,	%l1
	set	0x7C, %i1
	stha	%i6,	[%l7 + %i1] 0x10
	rdhpr	%htba,	%g6
	rdpr	%gl,	%o6
	fbul,a	%fcc2,	loop_607
	fmovspos	%xcc,	%f17,	%f21
	fandnot1	%f18,	%f24,	%f22
	edge16l	%o2,	%o5,	%o0
loop_607:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	wrpr	%l2,	0x034A,	%cwp
	addcc	%l5,	0x0EAC,	%o3
	wrpr	%o1,	%i7,	%cwp
	bne,pt	%icc,	loop_608
	fxors	%f30,	%f7,	%f22
	fmovdneg	%xcc,	%f21,	%f13
	wrpr	%i5,	%l6,	%cwp
loop_608:
	wr	%o7,	0x1E35,	%softint
	wr	%i4,	0x0DA2,	%y
	alignaddrl	%g5,	%g4,	%l3
	movpos	%xcc,	%i0,	%i3
	fxnors	%f4,	%f26,	%f19
	rd	%y,	%l0
	rdpr	%tl,	%g3
	tge	%icc,	0x1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	tsubcctv	%g1,	%g2,	%i2
	ldx	[%l7 + 0x08],	%i1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	rdpr	%tba,	%o6
	rdpr	%pil,	%l1
	rd	%fprs,	%o2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x586, 	%hsys_tick_cmpr
	rd	%softint,	%o4
	alignaddrl	%g7,	%l5,	%l2
	tle	%icc,	0x5
	wr	%o1,	%o3,	%softint
	fmovrsgz	%i7,	%f20,	%f25
	rdpr	%cansave,	%l6
	stx	%o7,	[%l7 + 0x58]
	wrpr	%i4,	%i5,	%pil
	rdhpr	%hpstate,	%g5
	rd	%sys_tick_cmpr,	%g4
	edge16	%i0,	%l3,	%i3
	fnot1s	%f21,	%f8

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xB27, 	%hsys_tick_cmpr
	array16	%g2,	%i2,	%g1
	rd	%fprs,	%i6
	rdhpr	%hsys_tick_cmpr,	%g6
	fbo,a	%fcc0,	loop_609
	rd	%softint,	%o6
	wrpr	%i1,	0x0B00,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_609:
	rdpr	%pil,	%o2
	fcmpeq32	%f24,	%f10,	%o4
	fpsub16s	%f18,	%f26,	%f24
	rdpr	%otherwin,	%o0
	wrpr	%g7,	0x0E41,	%tick
	sdivcc	%l5,	0x0669,	%o1
	ldstub	[%l7 + 0x61],	%l2
	movre	%i7,	%o3,	%l6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movneg	%xcc,	%o7,	%i5
	rd	%tick_cmpr,	%i4
	rdpr	%otherwin,	%g5
	sdiv	%i0,	0x1851,	%g4
	rd	%fprs,	%l3
	fmul8x16au	%f20,	%f29,	%f2
	wr	%l0,	0x053F,	%ccr
	move	%xcc,	%i3,	%l4
	wrpr	%g3,	%i2,	%cwp
	umulcc	%g1,	0x1B44,	%g2
	edge32	%g6,	%o6,	%i1
	movrgez	%l1,	%o5,	%i6
	fxnor	%f10,	%f6,	%f6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fble,a	%fcc2,	loop_610
	rdhpr	%hpstate,	%g7
	rdhpr	%htba,	%l5
	fmovsvs	%icc,	%f0,	%f18
loop_610:
	sdiv	%o0,	0x0180,	%o1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%htba,	%o3
	bcs	%xcc,	loop_611
	fmovsgu	%xcc,	%f16,	%f3
	rdpr	%otherwin,	%l6
	umul	%o7,	0x1893,	%l2
loop_611:
	rdhpr	%hintp,	%i5
	rdhpr	%hpstate,	%i4
	edge32n	%g5,	%g4,	%l3
	wr	%l0,	%i3,	%y

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	movrgez	%g3,	%g1,	%g2
	rdhpr	%hpstate,	%g6
	rdpr	%tba,	%i1
	rdhpr	%htba,	%o6
	rdpr	%otherwin,	%o5
	bcs	loop_612
	wr	%l1,	%o2,	%clear_softint
	wrpr	%o4,	%i6,	%cwp
	movgu	%xcc,	%g7,	%l5
loop_612:
	rd	%asi,	%o1
	rdpr	%cwp,	%o0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	and	%o3,	%i7,	%o7
	wrpr	%l6,	0x0570,	%cwp
	fbu,a	%fcc1,	loop_613
	ldd	[%l7 + 0x78],	%f18
	rdhpr	%hsys_tick_cmpr,	%i5
	wrpr	%i4,	0x03D9,	%tick
loop_613:
	fpsub16	%f12,	%f14,	%f0
	fbule	%fcc3,	loop_614
	sir	0x0CB3
	wr 	%g0, 	0x4, 	%fprs
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_614:
	rdpr	%otherwin,	%l3
	rd	%ccr,	%g5
	rdpr	%otherwin,	%l0
	swap	[%l7 + 0x34],	%l4
	ldub	[%l7 + 0x61],	%i3
	rd	%fprs,	%i2
	movneg	%xcc,	%i0,	%g1
	bge,pn	%icc,	loop_615
	wr	%g2,	%g6,	%set_softint
	rdhpr	%hintp,	%i1
	ldx	[%l7 + 0x18],	%g3
loop_615:
	rd	%pc,	%o6
	wrpr	%o5,	%o2,	%cwp
	bgu	%xcc,	loop_616
	rdhpr	%htba,	%l1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xCC4, 	%hsys_tick_cmpr
	bgu,pn	%icc,	loop_617
loop_616:
	rdpr	%cwp,	%g7
	movg	%xcc,	%o4,	%l5
	orcc	%o0,	0x1D7F,	%o3
loop_617:
	fpsub32	%f4,	%f4,	%f4
	movneg	%icc,	%i7,	%o1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	te	%icc,	0x2
        wr    %g0,    0xe,    %pcr    ! changed.
	wrpr	%l2,	0x0934,	%tick
	edge8ln	%i4,	%g4,	%g5
	rdpr	%cleanwin,	%l3
	fpsub16	%f8,	%f20,	%f26
	wr	%g0,	0x10,	%asi
	ldswa	[%l7 + 0x30] %asi,	%l4
	edge8	%i3,	%i2,	%i0
	rdhpr	%hpstate,	%g1
	andcc	%l0,	%g2,	%i1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x1E0, 	%hsys_tick_cmpr
	rd	%tick_cmpr,	%o6
	wrpr	%o2,	%l1,	%cwp
	be	%xcc,	loop_618
	brgez,a	%i6,	loop_619
	wr	%o5,	%o4,	%ccr
	rd	%ccr,	%l5
loop_618:
	rd	%ccr,	%o0
loop_619:
	brz	%o3,	loop_620
	rd	%y,	%i7
	rdhpr	%htba,	%o1
	rdhpr	%hintp,	%l6
loop_620:
	rdpr	%cansave,	%g7
	tg	%xcc,	0x2
	fmovde	%xcc,	%f2,	%f15
	wr	%o7,	0x1005,	%softint
	tsubcc	%i5,	%l2,	%i4
	rdpr	%cwp,	%g4
	rdpr	%cleanwin,	%l3
	sdivcc	%l4,	0x0BE8,	%i3
	wrpr	%g5,	0x15C2,	%tick
	wr	%i2,	%g1,	%sys_tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xE06, 	%hsys_tick_cmpr
	fabss	%f12,	%f26
	wrpr	%g2,	0x154E,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xD00, 	%hsys_tick_cmpr
	rdpr	%tba,	%l0
	rdpr	%cansave,	%o6
	movne	%icc,	%g3,	%o2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%o5,	%i6,	%set_softint
	rdhpr	%hsys_tick_cmpr,	%o4
	sdivx	%l5,	0x06F2,	%o3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fmovrse	%l6,	%f31,	%f0
	tl	%icc,	0x7
	or	%g7,	0x1622,	%o7
	rdhpr	%htba,	%i5
	wrpr	%o0,	%l2,	%tick
	rdpr	%otherwin,	%g4
	rd	%softint,	%l3
	fmul8sux16	%f24,	%f2,	%f22
	rdpr	%cleanwin,	%i4
	ldstub	[%l7 + 0x45],	%i3
	edge8ln	%g5,	%l4,	%i2
	array8	%g1,	%g2,	%i1
	fpackfix	%f26,	%f28

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	fbe	%fcc2,	loop_621
	rd	%y,	%l0
	movrgez	%o6,	0x18E,	%i0
        wr    %g0,    0xe,    %pcr    ! changed.
loop_621:
	nop
	set	0x6D, %o3
	ldsba	[%l7 + %o3] 0x18,	%o2
	rdhpr	%hintp,	%l1
	udiv	%i6,	0x194C,	%o4
	rd	%sys_tick_cmpr,	%l5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	alignaddr	%i7,	%o1,	%o3
	move	%xcc,	%g7,	%l6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xA18, 	%hsys_tick_cmpr
	move	%xcc,	%l2,	%o0
	andcc	%l3,	0x1920,	%i4
	rdhpr	%hsys_tick_cmpr,	%i3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x897, 	%hsys_tick_cmpr
	array16	%g5,	%i2,	%g1
	rdpr	%tba,	%g2
	fands	%f18,	%f21,	%f18
	wr	%g0,	0x19,	%asi
	lduba	[%l7 + 0x0C] %asi,	%i1
	rdpr	%tba,	%g6
	rdhpr	%hintp,	%l4
	rdpr	%tba,	%o6
	fmovrdlez	%i0,	%f20,	%f28
        wr    %g0,    0xe,    %pcr    ! changed.
	brgez	%l1,	loop_622
	sllx	%o2,	0x00,	%o4
	movrlez	%l5,	%i6,	%o5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_622:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%g7,	0x0CCD,	%cwp
	rdpr	%otherwin,	%i5
	fmovsvc	%icc,	%f1,	%f3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x648, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xEF1, 	%hsys_tick_cmpr
	be,a	%xcc,	loop_623
	rd	%fprs,	%o0
	wrpr	%l3,	0x0C24,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_623:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x8FE, 	%hsys_tick_cmpr
	wr	%g0,	0x89,	%asi
	ldxa	[%l7 + 0x18] %asi,	%g5
	rdpr	%canrestore,	%i3
	bne,a,pt	%xcc,	loop_624
	rdhpr	%hintp,	%i2
	rdhpr	%hintp,	%g2
	wr	%g0,	0x80,	%asi
	ldsba	[%l7 + 0x6F] %asi,	%i1
loop_624:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%cleanwin,	%l4
	movg	%icc,	%o6,	%i0
	fmovda	%xcc,	%f24,	%f8
	rdhpr	%hpstate,	%l0
	rd	%y,	%l1
	orn	%o2,	0x1646,	%o4
	wrpr	%l5,	%g3,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fornot2s	%f23,	%f27,	%f19
	membar	0x02
	wr	%i6,	%o3,	%clear_softint
	wrpr	%o1,	0x156B,	%tick
	fxnor	%f20,	%f2,	%f14
	wrpr	%i7,	%g7,	%tick
	rdhpr	%htba,	%i5
	rdpr	%cwp,	%o7
	wrpr	%o0,	%l3,	%tick
	set	0x30, %o1
	stda	%l2,	[%l7 + %o1] 0xe3
	membar	#Sync
	sllx	%l6,	0x0F,	%i4
	set	0x38, %o6
	sta	%f17,	[%l7 + %o6] 0x88
	fmovdle	%xcc,	%f14,	%f14
	smulcc	%g5,	0x0018,	%g4
	wrpr	%i3,	0x1B7B,	%cwp
	subcc	%i2,	%i1,	%g6
	taddcc	%g1,	0x0425,	%g2
	rdpr	%cwp,	%l4
	wrpr	%i0,	%l0,	%cwp
	rdhpr	%htba,	%l1
	nop
	set	0x42, %l0
	sth	%o2,	[%l7 + %l0]
	ta	%xcc,	0x3
	wr	%o4,	%l5,	%set_softint
	wrpr	%g3,	%o6,	%tick
	rd	%softint,	%o5
	wrpr	%o3,	%o1,	%tick
	taddcc	%i6,	0x0159,	%i7
	tn	%icc,	0x6
	fmovrdlez	%g7,	%f14,	%f0
	array8	%i5,	%o0,	%l3
	flush	%l7 + 0x5C
	wrpr	%l2,	0x1B6B,	%tick
	fsrc2s	%f30,	%f25
	ldsh	[%l7 + 0x2A],	%o7
	rdhpr	%hintp,	%i4
	rdhpr	%hintp,	%g5
	rd	%sys_tick_cmpr,	%g4
	subccc	%l6,	0x0EF4,	%i3
	rdpr	%cwp,	%i2
	rdhpr	%hpstate,	%i1
	wrpr	%g1,	0x1D6F,	%pil
	rdhpr	%htba,	%g6
	smul	%g2,	%l4,	%l0
	edge16ln	%i0,	%l1,	%o4
	orn	%l5,	0x1164,	%g3
	tsubcctv	%o6,	0x1E4C,	%o2
	alignaddrl	%o3,	%o1,	%i6
	rd	%asi,	%o5
	nop
	setx loop_625, %l0, %l1
	jmpl %l1, %i7
	wr	%g7,	0x00BA,	%set_softint
	subcc	%o0,	%i5,	%l3
	rdpr	%tl,	%o7
loop_625:
	wr	%i4,	%l2,	%ccr
	subc	%g4,	0x1C5B,	%g5
	edge8ln	%i3,	%l6,	%i1
	fpadd32s	%f4,	%f24,	%f11
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
	fnot1s	%f23,	%f1
	orn	%g2,	%l4,	%l0
	fmovsvs	%icc,	%f16,	%f12
	rdpr	%canrestore,	%g6
	rd	%tick_cmpr,	%i0
	bl,a	loop_626
	wrpr	%o4,	0x03A5,	%tick
	rdhpr	%htba,	%l1
	rdhpr	%hpstate,	%g3
loop_626:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xA28, 	%hsys_tick_cmpr
	ta	%icc,	0x3
	rd	%pc,	%o6
	rd	%asi,	%o3
	wr	%o1,	0x0D37,	%softint
	rdpr	%wstate,	%i6
	fandnot2s	%f3,	%f28,	%f25

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	nop
	set	0x38, %l3
	std	%i6,	[%l7 + %l3]
	wr	%o0,	%l3,	%set_softint
	wrpr	%i5,	%i4,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x42F, 	%hsys_tick_cmpr
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	setx	loop_627,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fbule,a	%fcc2,	loop_628
	wr 	%g0, 	0x7, 	%fprs
	set	0x0C, %g4
	ldstuba	[%l7 + %g4] 0x89,	%l6
loop_627:
	fabss	%f3,	%f7
loop_628:
	fxnor	%f24,	%f22,	%f0
	tne	%icc,	0x7
	rdpr	%cleanwin,	%i3
	rd	%asi,	%g1
	fbule,a	%fcc1,	loop_629
	popc	%i1,	%g2
	rdpr	%tba,	%i2
	fmovsg	%icc,	%f11,	%f6
loop_629:
	brnz	%l4,	loop_630
	array8	%l0,	%g6,	%o4
	fbg	%fcc3,	loop_631
        wr    %g0,    0xe,    %pcr    ! changed.
loop_630:
	wr 	%g0, 	0x4, 	%fprs
	rdpr	%tl,	%g3
loop_631:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xEA6, 	%hsys_tick_cmpr
	brz	%o3,	loop_632
	rd	%pc,	%o6
	wr	%o1,	%o5,	%ccr
	wrpr	%g7,	%i6,	%pil
loop_632:
	rdpr	%cleanwin,	%i7
	rdpr	%otherwin,	%l3
	wrpr	%o0,	%i4,	%pil
	rdpr	%tl,	%i5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	smul	%l2,	%g5,	%l6
	sth	%o7,	[%l7 + 0x1C]
	array8	%i3,	%i1,	%g1
	bpos	%icc,	loop_633
	rdhpr	%hintp,	%i2
	wrpr	%l4,	%g2,	%cwp
	wr	%g6,	0x171A,	%y
loop_633:
	rd	%ccr,	%o4
	rdpr	%pil,	%l1
	rd	%y,	%l0
	rdpr	%wstate,	%g3
	rd	%y,	%l5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	edge8	%i0,	%o6,	%o5
	rdpr	%wstate,	%o1
	rdpr	%pil,	%g7
	rdpr	%pil,	%i7
	rdhpr	%hpstate,	%i6
	rd	%tick_cmpr,	%o0
	movcs	%xcc,	%l3,	%i5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x680, 	%hsys_tick_cmpr
	wrpr	%i4,	%l2,	%pil
	sub	%l6,	%g5,	%i3
	fmovdvc	%xcc,	%f30,	%f23
	tsubcctv	%o7,	%g1,	%i1
	smulcc	%i2,	%l4,	%g6
	rdpr	%otherwin,	%o4
	array16	%l1,	%l0,	%g2
	tvs	%xcc,	0x4
	wr	%g3,	%l5,	%sys_tick
	movle	%icc,	%o3,	%o2
	rdpr	%cwp,	%i0
	edge16l	%o5,	%o1,	%g7
	rd	%y,	%i7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	xor	%i6,	%l3,	%o0
	wr	%i5,	%i4,	%y
	rdhpr	%hsys_tick_cmpr,	%g4
	bvs	%xcc,	loop_634
	sll	%l6,	0x15,	%l2
	rdpr	%wstate,	%g5
	rdhpr	%htba,	%i3
loop_634:
	nop
	set	0x64, %i3
	sta	%f23,	[%l7 + %i3] 0x18
	wr	%o7,	%i1,	%y
	addccc	%g1,	%i2,	%l4
	rdpr	%tba,	%o4
	wrpr	%l1,	%l0,	%cwp
	wr	%g6,	%g3,	%ccr
	rdhpr	%htba,	%l5
	fnor	%f22,	%f10,	%f12
	fmovrsgz	%o3,	%f3,	%f0
	udivx	%g2,	0x09C9,	%o2
	fbo,a	%fcc3,	loop_635
	rd	%asi,	%i0
	fpsub16s	%f28,	%f12,	%f2
	fmul8ulx16	%f16,	%f22,	%f18
loop_635:
	wrpr	%o1,	0x05E6,	%cwp
	rdpr	%otherwin,	%o5
	wrpr	%i7,	0x0148,	%cwp
	fbuge	%fcc3,	loop_636
	udivcc	%o6,	0x1290,	%g7
	rdhpr	%hintp,	%l3
	fmuld8sux16	%f24,	%f27,	%f22
loop_636:
	wrpr	%o0,	%i5,	%tick
	rdpr	%cansave,	%i4
	rdpr	%cleanwin,	%g4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x6E3, 	%hsys_tick_cmpr
	rdhpr	%hsys_tick_cmpr,	%l6
	edge32	%g5,	%o7,	%i1
	orn	%g1,	0x13C7,	%i3
	andcc	%i2,	0x080F,	%l4
	bneg,a,pt	%icc,	loop_637
	tn	%icc,	0x6
	rd	%tick_cmpr,	%o4
	sra	%l0,	%g6,	%l1
loop_637:
	wr	%l5,	%g3,	%ccr
	rd	%tick_cmpr,	%g2
	rd	%asi,	%o3
	umul	%o2,	0x0E29,	%o1
	fnands	%f13,	%f14,	%f17
	set	0x18, %o5
	prefetcha	[%l7 + %o5] 0x81,	 0x2
	wrpr	%o5,	0x1CEA,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x037, 	%hsys_tick_cmpr
	movrlez	%g7,	%l3,	%o6
	nop
	setx loop_638, %l0, %l1
	jmpl %l1, %i5
	smul	%i4,	%g4,	%i6
	edge16	%o0,	%l6,	%l2
	taddcc	%g5,	0x0A1E,	%o7
loop_638:
	wr	%i1,	0x1D80,	%softint
	rdpr	%otherwin,	%g1
	wr	%i3,	%i2,	%clear_softint
	fmovdgu	%xcc,	%f22,	%f31
	rdpr	%wstate,	%l4
	sdivcc	%l0,	0x18E4,	%g6
	rdhpr	%hsys_tick_cmpr,	%l1
	sethi	0x0417,	%l5
	edge16	%o4,	%g2,	%o3
	fmovsgu	%xcc,	%f14,	%f0
	subccc	%o2,	0x134D,	%o1
	rdpr	%pil,	%g3
	wr	%o5,	%i7,	%clear_softint
	rd	%pc,	%i0
	umul	%g7,	%l3,	%o6
	rdhpr	%hsys_tick_cmpr,	%i4
	wr	%i5,	%i6,	%clear_softint
	wr	%g0,	0x80,	%asi
	lduwa	[%l7 + 0x44] %asi,	%o0
	fpack32	%f28,	%f20,	%f14
	rd	%y,	%g4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x1AC, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%o7,	0x0529,	%pil
	fcmple16	%f0,	%f6,	%g5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	sir	0x1A73
	rdpr	%gl,	%i2
	rd	%fprs,	%l4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	edge32n	%g6,	%l0,	%l1
	rdpr	%pil,	%l5
	rd	%ccr,	%o4
	wr	%g2,	%o3,	%pic
	rd	%y,	%o1
	sdiv	%o2,	0x17B1,	%o5
	rdhpr	%hintp,	%i7
	rdpr	%wstate,	%g3
	rd	%softint,	%g7
        wr    %g0,    0xe,    %pcr    ! changed.
	rdpr	%otherwin,	%i4
	wr	%i0,	0x18A6,	%ccr
	fnand	%f26,	%f0,	%f4
	tge	%icc,	0x2
	rd	%asi,	%i5
	taddcctv	%i6,	%g4,	%o0
	wrpr	%l6,	0x01AF,	%tick
	te	%xcc,	0x5
	rdhpr	%hintp,	%o7
        wr    %g0,    0xe,    %pcr    ! changed.
	rdpr	%canrestore,	%g1
	tle	%xcc,	0x1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x130, 	%hsys_tick_cmpr
	wr	%l4,	0x0003,	%softint
	rdpr	%tba,	%i1
	bcc	%icc,	loop_639
	wr	%i3,	%g6,	%set_softint
	rd	%y,	%l1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x0DB, 	%hsys_tick_cmpr
loop_639:
	rd	%tick_cmpr,	%g2
	nop
	set	0x23, %i5
	ldsb	[%l7 + %i5],	%o3
	wr	%o1,	0x058B,	%sys_tick
	fmovscs	%icc,	%f29,	%f0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	andn	%i7,	0x0C33,	%o2
	wrpr	%g3,	0x1FDB,	%tick
	subcc	%g7,	%o6,	%l3
	tneg	%icc,	0x1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xFE3, 	%hsys_tick_cmpr
	rdpr	%otherwin,	%i6
	wrpr	%i0,	0x0D34,	%tick
	smulcc	%g4,	0x1BAD,	%o0
	edge16n	%o7,	%g5,	%g1
	fbue	%fcc1,	loop_640
	wrpr	%l2,	0x0516,	%cwp
	wrpr	%i2,	%l6,	%cwp
	rdhpr	%hintp,	%l4
loop_640:
	rdpr	%otherwin,	%i1
	rd	%tick_cmpr,	%i3
	rdhpr	%htba,	%g6
	tl	%xcc,	0x1
	fmovrsgz	%l0,	%f15,	%f20

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x85E, 	%sys_tick_cmpr
	tle	%icc,	0x4
	wrpr	%g2,	%o4,	%pil
	rdpr	%otherwin,	%o3
	fandnot2s	%f11,	%f4,	%f13

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%htba,	%l5
	ba,a	loop_641
	tvs	%icc,	0x3
	fmovsleu	%xcc,	%f16,	%f15
	movrgz	%o5,	%i7,	%g3
loop_641:
	rdpr	%cleanwin,	%o2
	wrpr	%g7,	0x06B8,	%tick
	movrne	%l3,	%i4,	%o6
	wrpr	%i6,	%i5,	%tick
	wrpr	%i0,	0x195D,	%cwp
	rdpr	%cansave,	%g4
	rdpr	%pil,	%o0
	sllx	%o7,	%g1,	%g5
	lduw	[%l7 + 0x08],	%i2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%fprs,	%l2
	rdpr	%cwp,	%i3
	wr	%i1,	%l0,	%sys_tick
	rdhpr	%htba,	%g6
	wr	%l1,	%o4,	%y
	wrpr	%o3,	0x1D97,	%tick
	rdpr	%pil,	%g2
	wr	%l5,	0x0FBE,	%clear_softint
	wr	%o1,	%i7,	%y
	orncc	%g3,	%o5,	%g7
	rd	%y,	%o2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xFD1, 	%hsys_tick_cmpr
	rd	%ccr,	%o6
	fmovsn	%icc,	%f20,	%f31
	rdpr	%cwp,	%l3
	tne	%icc,	0x0
	fmovda	%xcc,	%f5,	%f6
	rd	%pc,	%i6
	movne	%icc,	%i0,	%i5
	rd	%tick_cmpr,	%g4
	rd	%ccr,	%o0
	movcs	%xcc,	%g1,	%o7
	rdhpr	%htba,	%g5
	edge8n	%l6,	%i2,	%l2
	orn	%l4,	%i3,	%l0
	fandnot2s	%f26,	%f25,	%f4
	bpos,a	%icc,	loop_642
	wrpr	%g6,	%l1,	%pil
	rdpr	%cleanwin,	%o4
	rd	%sys_tick_cmpr,	%o3
loop_642:
	fmovsl	%xcc,	%f21,	%f15
	rdhpr	%htba,	%i1
	tvs	%xcc,	0x7
	wrpr	%l5,	0x1A12,	%cwp
	srax	%o1,	%g2,	%i7
	rdpr	%tl,	%o5
	rdhpr	%htba,	%g7
	rd	%tick_cmpr,	%g3
	rdpr	%otherwin,	%i4
	fbug,a	%fcc3,	loop_643
	wr	%o2,	%l3,	%pic
	add	%i6,	0x1BC3,	%o6
	rd	%asi,	%i5
loop_643:
	rdpr	%pil,	%g4
	fors	%f18,	%f5,	%f20
	udivcc	%o0,	0x0D0B,	%i0
	array16	%g1,	%g5,	%l6
	set	0x7F, %l6
	lduba	[%l7 + %l6] 0x89,	%i2
	rdhpr	%hintp,	%o7
	fmovrde	%l4,	%f4,	%f10
	wr	%l2,	%i3,	%set_softint
	fnot1s	%f18,	%f29

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x9BF, 	%hsys_tick_cmpr
	movrlez	%g6,	0x1C3,	%o4
        wr    %g0,    0xe,    %pcr    ! changed.
	udivcc	%l1,	0x0745,	%i1
	mulscc	%o1,	%l5,	%g2
	wr	%i7,	%g7,	%ccr
	edge16n	%o5,	%g3,	%o2
	rdhpr	%hpstate,	%i4
	wrpr	%i6,	0x026C,	%cwp
	wrpr	%o6,	%i5,	%tick
	rdpr	%cansave,	%g4
	fmovdgu	%icc,	%f22,	%f3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%tl,	%l3
	rdpr	%cleanwin,	%g1
	fornot2s	%f26,	%f28,	%f14
	wrpr	%i0,	0x0BBF,	%tick
	fexpand	%f5,	%f12
	sub	%g5,	0x0779,	%l6
	andncc	%o7,	%i2,	%l4
	rd	%fprs,	%i3
	wrpr	%l2,	%g6,	%cwp
	fmovsle	%icc,	%f13,	%f8

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	rdpr	%cleanwin,	%l1
	rd	%pc,	%o3
	edge16	%o1,	%i1,	%g2
	wrpr	%l5,	%i7,	%pil
	rd	%asi,	%o5
	wrpr	%g7,	%g3,	%tick
	tvc	%icc,	0x6
	rdpr	%cwp,	%o2
	swap	[%l7 + 0x14],	%i6
	wr	%i4,	0x0867,	%ccr
	rdhpr	%htba,	%i5
	rd	%softint,	%g4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x2C7, 	%hsys_tick_cmpr
	rdhpr	%hpstate,	%g1
	bneg,a	%xcc,	loop_644
	tne	%xcc,	0x7
	rdhpr	%htba,	%o0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xADC, 	%hsys_tick_cmpr
loop_644:
	wrpr	%l6,	%o7,	%cwp
	sir	0x0D4A
	tneg	%icc,	0x3
	wrpr	%g5,	%l4,	%cwp
	rd	%asi,	%i3
	andcc	%i2,	%g6,	%l2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	udiv	%o4,	0x1453,	%o3
	movrne	%i1,	%g2,	%l5
	rdhpr	%htba,	%i7
	popc	0x1A6A,	%o5
	rd	%tick_cmpr,	%o1
	andn	%g7,	0x0666,	%o2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%hsys_tick_cmpr,	%i4
	fbuge	%fcc0,	loop_645
	rdpr	%canrestore,	%i5
	wr	%g0,	0x89,	%asi
	lduba	[%l7 + 0x41] %asi,	%g4
loop_645:
	rd	%ccr,	%o6
	rd	%sys_tick_cmpr,	%g3
	rd	%fprs,	%g1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x846, 	%hsys_tick_cmpr
	wr	%i0,	0x0C8F,	%pic

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xE26, 	%hsys_tick_cmpr
	rdpr	%cansave,	%g5
	rd	%softint,	%l4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%pil,	%l2
	fbl	%fcc0,	loop_646
	wrpr	%g6,	%l1,	%pil
	flush	%l7 + 0x28
	xnor	%o4,	%l0,	%o3
loop_646:
	edge16ln	%i1,	%g2,	%i7
	or	%l5,	0x1993,	%o5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x902, 	%hsys_tick_cmpr
	wrpr	%i6,	0x15A6,	%pil
	rdpr	%cleanwin,	%o2
	rd	%ccr,	%i4
	wr	%g4,	0x0B4C,	%clear_softint
	fzeros	%f3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x7B3, 	%hsys_tick_cmpr
	wr	%g3,	0x1E0D,	%softint
	fxors	%f24,	%f24,	%f4
	rd	%y,	%g1
	fnot1s	%f16,	%f17
	popc	%o0,	%l6
	rdpr	%otherwin,	%i0
	sub	%g5,	0x1613,	%l3
	wr	%l4,	%o7,	%softint
	wrpr	%i3,	%i2,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x253, 	%hsys_tick_cmpr
	tcs	%icc,	0x5
	rdhpr	%hsys_tick_cmpr,	%g6
	rdpr	%tba,	%l0
        wr    %g0,    0xe,    %pcr    ! changed.
	rd	%tick_cmpr,	%o4
	fpackfix	%f30,	%f26
	rd	%asi,	%g2
	rd	%tick_cmpr,	%l5
	movpos	%icc,	%o5,	%i7
	wr	%o1,	0x1CC7,	%pic

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x3E3, 	%hsys_tick_cmpr
        wr    %g0,    0xe,    %pcr    ! changed.
	fnot1s	%f11,	%f10
	sir	0x1839
	rdhpr	%hpstate,	%o2
	fmovsne	%xcc,	%f22,	%f29
	rd	%pc,	%i5
	xnor	%o6,	0x0511,	%g4
	rdhpr	%hintp,	%g3
	rdhpr	%hpstate,	%o0
	wr	%g1,	0x177F,	%clear_softint
	umulcc	%l6,	0x1709,	%i0
	wrpr	%l3,	0x1F27,	%pil
	wrpr	%g5,	%o7,	%pil
	wrpr	%i3,	0x1203,	%cwp
	rdpr	%otherwin,	%l4
	movl	%xcc,	%i2,	%l1
	te	%xcc,	0x1
	fbule	%fcc1,	loop_647
	tle	%xcc,	0x2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	orncc	%l0,	%g6,	%o3
loop_647:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xC2E, 	%hsys_tick_cmpr
	rdhpr	%hintp,	%o4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	flush	%l7 + 0x28
	wrpr	%i7,	%o1,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%i4,	0x1E41,	%tick
	edge32l	%o2,	%i6,	%i5
	move	%icc,	%o6,	%g3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%tl,	%g1
	xnorcc	%i0,	0x0D7F,	%l6
	rdhpr	%hintp,	%l3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x182, 	%hsys_tick_cmpr
	tvc	%icc,	0x2
	bvs,pn	%icc,	loop_648
	edge16n	%l4,	%i2,	%l1
	wrpr	%i3,	%l2,	%cwp
	rdpr	%canrestore,	%l0
loop_648:
	rdpr	%otherwin,	%g6
	fmovsl	%xcc,	%f4,	%f19
	rdpr	%tl,	%o3
	wr	%g0,	0x80,	%asi
	ldstuba	[%l7 + 0x0A] %asi,	%g2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xC29, 	%hsys_tick_cmpr
	rdhpr	%htba,	%i7
	ldub	[%l7 + 0x08],	%i1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x37A, 	%hsys_tick_cmpr
	tn	%xcc,	0x5
	rdhpr	%hintp,	%i4
	swap	[%l7 + 0x50],	%g7
	rd	%sys_tick_cmpr,	%o2
	rdpr	%cwp,	%i6
	wrpr	%i5,	%o6,	%tick
	tn	%icc,	0x6
	fmovdl	%icc,	%f5,	%f14
	wrpr	%g3,	0x0C95,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xB9E, 	%tick_cmpr
	tneg	%xcc,	0x2
	wrpr	%o0,	0x0263,	%cwp
	fsrc2s	%f11,	%f24

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x378, 	%hsys_tick_cmpr
	wrpr	%l6,	0x14B0,	%cwp
	rdhpr	%hpstate,	%g1
	ta	%icc,	0x2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xF79, 	%tick_cmpr
	rd	%pc,	%l3
	rdpr	%tba,	%g5
	umulcc	%i2,	0x0776,	%l1
	rd	%asi,	%l4
        wr    %g0,    0xe,    %pcr    ! changed.

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	set	0x40, %i0
	ldda	[%l7 + %i0] 0x81,	%g6
	wr	%g0,	0x88,	%asi
	ldstuba	[%l7 + 0x58] %asi,	%o3
	rdhpr	%hintp,	%g2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x143, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	edge8ln	%i7,	%l5,	%o1
	sll	%o5,	0x19,	%i1
	rdhpr	%hpstate,	%i4
	rdpr	%cansave,	%g7
	lduw	[%l7 + 0x30],	%i6
	fxnors	%f16,	%f9,	%f26
	rdhpr	%htba,	%i5
        wr    %g0,    0xe,    %pcr    ! changed.
	wr	%g0,	0x10,	%asi
	ldsha	[%l7 + 0x18] %asi,	%o2
	rdhpr	%hsys_tick_cmpr,	%g3
	rdpr	%cleanwin,	%g4
	udivx	%o0,	0x059B,	%l6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%softint,	%o7
	tl	%icc,	0x6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	alignaddr	%i2,	%l1,	%i3
	rdhpr	%hpstate,	%l4
	xorcc	%g6,	%l2,	%g2
	fmovdgu	%xcc,	%f5,	%f9
	edge8l	%o3,	%o4,	%i7
	rdhpr	%hsys_tick_cmpr,	%l0
	srlx	%o1,	%o5,	%l5
	brnz	%i1,	loop_649
	sdivcc	%g7,	0x065B,	%i4
	movn	%xcc,	%i5,	%i6
	wrpr	%o2,	%o6,	%tick
loop_649:
	nop
	add	%l7,	0x10,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%g4,	%o0
	rdhpr	%hintp,	%l6
	edge16n	%g3,	%g1,	%o7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xA07, 	%hsys_tick_cmpr
	fmovda	%xcc,	%f22,	%f9
	srl	%g5,	0x19,	%i2
	rdpr	%wstate,	%l1
	wrpr	%l3,	0x03A2,	%tick
	wr	%l4,	%i3,	%clear_softint
	ble	%icc,	loop_650
	rd	%pc,	%g6
	rdpr	%cansave,	%l2
	popc	%g2,	%o4
loop_650:
	rdpr	%otherwin,	%o3
	rdhpr	%hpstate,	%i7
	rdpr	%tba,	%o1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	rd	%tick_cmpr,	%o5
	set	0x78, %g2
	lduha	[%l7 + %g2] 0x19,	%l5
	rd	%sys_tick_cmpr,	%i1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%htba,	%l0
	wr	%i5,	0x09C3,	%pic
	bg	loop_651
	rdpr	%tl,	%o2
	mulx	%i6,	%o6,	%g4
	rd	%y,	%l6
loop_651:
	edge16ln	%g3,	%g1,	%o0
	fnot2s	%f13,	%f31
	rdhpr	%hintp,	%i0
	xor	%g5,	%o7,	%i2
	tleu	%xcc,	0x7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%l4,	0x0F98,	%tick
	wrpr	%l3,	0x031B,	%tick
	subc	%i3,	%g6,	%l2
	fmovdgu	%xcc,	%f10,	%f20
	wr	%g2,	0x14FE,	%pic
	fmovse	%icc,	%f21,	%f22
	rdhpr	%hpstate,	%o3
	rdpr	%cansave,	%o4
	tneg	%icc,	0x4
	wr 	%g0, 	0x7, 	%fprs

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x841, 	%hsys_tick_cmpr
	rd	%y,	%l5
	sdiv	%o1,	0x1EC3,	%i1
	tg	%icc,	0x0
	fbue,a	%fcc2,	loop_652
	rd	%tick_cmpr,	%i4
	edge32ln	%g7,	%i5,	%l0
	rd	%sys_tick_cmpr,	%i6
loop_652:
	rdhpr	%htba,	%o2
	movg	%icc,	%o6,	%l6
	edge8n	%g3,	%g4,	%o0
	ldd	[%l7 + 0x28],	%i0
	bgu,a	%icc,	loop_653
	fpadd32s	%f2,	%f31,	%f5
	rd	%pc,	%g5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xFE2, 	%sys_tick_cmpr
loop_653:
	wr	%o7,	%l4,	%softint
	rdhpr	%hintp,	%l3
	te	%icc,	0x6
	wrpr	%l1,	%g6,	%cwp
	edge16	%i3,	%l2,	%o3
	fone	%f10
	prefetch	[%l7 + 0x24],	 0x0
	wr	%o4,	0x1115,	%clear_softint

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x234, 	%sys_tick_cmpr
	array8	%l5,	%o1,	%o5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xAEB, 	%hsys_tick_cmpr
	rd	%y,	%g7
	rdpr	%cleanwin,	%l0
	rd	%fprs,	%i6
	rd	%tick_cmpr,	%o2
	wr	%o6,	0x00E0,	%y
	rdpr	%canrestore,	%l6
	wrpr	%i5,	0x11AB,	%tick
	fmovsneg	%icc,	%f18,	%f25
	rdhpr	%htba,	%g4
	rd	%tick_cmpr,	%o0
	edge16l	%i0,	%g5,	%g3
	fmovdvc	%icc,	%f20,	%f16
	wrpr	%g1,	0x0668,	%cwp
	ldub	[%l7 + 0x43],	%i2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x754, 	%hsys_tick_cmpr
	rdhpr	%hpstate,	%l4
	rd	%asi,	%l1
	rdpr	%canrestore,	%g6
	movvs	%xcc,	%l2,	%i3
	fbul	%fcc0,	loop_654
	fmovdvc	%xcc,	%f7,	%f26

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%tl,	%o4
loop_654:
	tle	%xcc,	0x0
	rdpr	%wstate,	%g2
	taddcc	%l5,	%o1,	%o5
	rd	%y,	%i4
        wr    %g0,    0xe,    %pcr    ! changed.
	rd	%tick_cmpr,	%l0
	rd	%fprs,	%i6
	movvc	%icc,	%o2,	%o6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%tick_cmpr,	%g4
	rd	%ccr,	%l6
	rdhpr	%hpstate,	%o0
	wr	%i0,	%g5,	%ccr
	mulscc	%g3,	%g1,	%o7
	rdhpr	%htba,	%i2
	wrpr	%l4,	%l3,	%pil
	rd	%y,	%l1
	fmul8sux16	%f6,	%f22,	%f14
	wrpr	%g6,	%i3,	%cwp
	rdhpr	%htba,	%l2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%i7,	0x10D2,	%tick
	xnorcc	%g2,	%o4,	%o1
	rdpr	%tba,	%l5
	rdhpr	%hpstate,	%i4
	fmovdvs	%icc,	%f29,	%f13
	fmovdg	%xcc,	%f20,	%f11
	rdhpr	%hsys_tick_cmpr,	%o5
	wrpr	%l0,	0x0EEB,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	movrgez	%o6,	0x09D,	%g7
	wrpr	%i5,	%g4,	%tick
	edge32n	%i1,	%l6,	%o0
	edge32ln	%g5,	%g3,	%g1
	rdhpr	%hintp,	%i0
	fbo	%fcc1,	loop_655
	rdhpr	%htba,	%i2
	wr	%o7,	0x140D,	%set_softint
	movrgz	%l4,	0x192,	%l3
loop_655:
	wrpr	%l1,	%g6,	%cwp
	rdpr	%cwp,	%l2
	tg	%xcc,	0x0
	ta	%xcc,	0x2
	rdpr	%cwp,	%i3
	lduh	[%l7 + 0x0C],	%i7
	wr	%g2,	0x04B4,	%softint
	rdpr	%otherwin,	%o4
	xnor	%o1,	0x1A79,	%o3
	wr	%i4,	0x18B5,	%sys_tick
	wr	%l5,	0x06AE,	%y
	sdivcc	%l0,	0x1A42,	%i6
	movge	%xcc,	%o2,	%o6
	wr	%g0,	0x88,	%asi
	stha	%g7,	[%l7 + 0x1E] %asi

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xD9B, 	%sys_tick_cmpr
	wrpr	%i1,	0x17F0,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%softint,	%g5
	andn	%g3,	0x1BC4,	%l6
	rdhpr	%htba,	%i0
	rdhpr	%hintp,	%i2
	brz	%g1,	loop_656
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array8	%o7,	%l3,	%l4
	movg	%icc,	%g6,	%l2
loop_656:
	rdpr	%otherwin,	%i3
	wr	%l1,	0x045C,	%sys_tick
	wrpr	%i7,	0x02BD,	%tick
	xorcc	%g2,	0x1C81,	%o1
	wrpr	%o3,	0x1FC2,	%cwp
	wrpr	%i4,	0x0EC3,	%tick
	rd	%fprs,	%o4
	wrpr	%l0,	%i6,	%cwp
	srax	%l5,	%o2,	%g7
	rdhpr	%htba,	%o5
	movgu	%icc,	%i5,	%o6
	array8	%g4,	%i1,	%g5
	sll	%g3,	%o0,	%l6
	wrpr	%i0,	0x0FC9,	%pil
	wrpr	%i2,	0x0D30,	%pil
	wrpr	%g1,	0x15A8,	%tick
	rdpr	%pil,	%o7
	tcs	%icc,	0x5
	wrpr	%l3,	%g6,	%tick
	fbue	%fcc2,	loop_657
	orncc	%l4,	%l2,	%i3
	tsubcctv	%l1,	%i7,	%o1
	udivx	%o3,	0x0F64,	%i4
loop_657:
	ldstub	[%l7 + 0x26],	%o4
	rdpr	%cansave,	%l0
	rdpr	%pil,	%g2
	wrpr	%l5,	0x0364,	%cwp
	wrpr	%o2,	0x0C75,	%tick
	flush	%l7 + 0x20
	wrpr	%g7,	0x19C6,	%tick
	rdpr	%cleanwin,	%i6
	rdhpr	%hsys_tick_cmpr,	%i5
	stbar
	movneg	%icc,	%o5,	%g4
	edge32	%i1,	%g5,	%o6
	rdhpr	%hintp,	%o0
	rdhpr	%hpstate,	%l6
	sdivcc	%g3,	0x13FD,	%i0
	ble,a	%xcc,	loop_658
	wrpr	%g1,	0x0692,	%tick
	rd	%softint,	%i2
        wr    %g0,    0xe,    %pcr    ! changed.
loop_658:
	edge32n	%l4,	%g6,	%l2
	wr	%l1,	0x1211,	%softint
	fcmpd	%fcc0,	%f14,	%f8
	call	loop_659
	rdpr	%gl,	%i3
	rd	%sys_tick_cmpr,	%i7
	movne	%xcc,	%o1,	%o3
loop_659:
	movneg	%icc,	%o4,	%l0
	wrpr	%g2,	%i4,	%pil
	rd	%sys_tick_cmpr,	%o2
	std	%f0,	[%l7 + 0x58]
	lduh	[%l7 + 0x58],	%g7
	rdhpr	%hpstate,	%l5
	movrgez	%i5,	0x018,	%o5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x0E0, 	%hsys_tick_cmpr
	tge	%icc,	0x7
	wrpr	%i1,	0x0B1E,	%tick
	rdpr	%cansave,	%i6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	subccc	%o0,	%l6,	%g3
	rdhpr	%htba,	%o6
	membar	0x11
	rdpr	%cleanwin,	%i0
	rdhpr	%htba,	%i2
	wrpr	%o7,	%l3,	%cwp
	rdpr	%cwp,	%l4
	andn	%g1,	0x0B0E,	%g6
	rdhpr	%htba,	%l2
	move	%icc,	%l1,	%i3
	movrlez	%o1,	0x0C2,	%i7
	mulx	%o3,	%o4,	%l0
	movrgz	%i4,	0x282,	%o2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdiv	%g2,	0x1F3D,	%g7
	wrpr	%l5,	0x04C0,	%pil
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x58, %g1
	ldswa	[%l7 + %g1] 0x10,	%i5
	wrpr	%o5,	%g4,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	sllx	%o0,	%l6,	%i6
	rd	%asi,	%o6
	membar	0x3F
	rdhpr	%htba,	%g3
	movge	%xcc,	%i2,	%o7
	taddcc	%l3,	0x1977,	%l4
	edge8l	%g1,	%i0,	%l2
	wrpr	%g6,	%l1,	%cwp
	rdpr	%pil,	%i3
	wrpr	%o1,	%o3,	%cwp
	addcc	%i7,	%l0,	%o4
	rdhpr	%hintp,	%o2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xA79, 	%hsys_tick_cmpr
	movl	%icc,	%l5,	%i5
	set	0x78, %g6
	prefetcha	[%l7 + %g6] 0x89,	 0x3
	edge16n	%g4,	%g7,	%g5
	rdhpr	%hsys_tick_cmpr,	%i1
        wr    %g0,    0xe,    %pcr    ! changed.
	fbg,a	%fcc2,	loop_660
	wr	%o6,	%i6,	%y
	movl	%icc,	%g3,	%o7
	tcs	%icc,	0x4
loop_660:
	nop
	wr	%g0,	0x11,	%asi
	stba	%i2,	[%l7 + 0x56] %asi
	wrpr	%l3,	%g1,	%tick
	orncc	%l4,	0x0ACF,	%i0
	tsubcc	%l2,	0x1E30,	%l1
	fpmerge	%f13,	%f5,	%f14

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%sys_tick_cmpr,	%o1
	edge16n	%i7,	%o3,	%l0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x0D2, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x769, 	%tick_cmpr
	rdpr	%otherwin,	%i4
	movn	%icc,	%g2,	%l5
	nop
	setx	loop_661,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fbo	%fcc3,	loop_662
	rdhpr	%hsys_tick_cmpr,	%i5
	rdhpr	%hpstate,	%o5
loop_661:
	wrpr	%g7,	0x0272,	%cwp
loop_662:
	fmovdneg	%xcc,	%f11,	%f31
	wrpr	%g4,	%g5,	%pil
	call	loop_663
	array8	%l6,	%o0,	%o6
	st	%f30,	[%l7 + 0x6C]
	rd	%y,	%i6
loop_663:
	brz	%g3,	loop_664
	wrpr	%o7,	%i1,	%cwp
	wr	%l3,	0x1731,	%pic
	rdhpr	%hsys_tick_cmpr,	%g1
loop_664:
	rdpr	%cleanwin,	%i2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xBB2, 	%hsys_tick_cmpr
	wrpr	%l2,	%l1,	%tick
	rdhpr	%htba,	%i0
	wrpr	%g6,	0x0E7A,	%tick
	movre	%o1,	%i3,	%i7
	wr	%l0,	%o4,	%softint

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x578, 	%hsys_tick_cmpr
	wr	%i4,	%o2,	%softint
	rd	%tick_cmpr,	%g2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xBD4, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xB24, 	%hsys_tick_cmpr
	stb	%g4,	[%l7 + 0x66]
	lduh	[%l7 + 0x78],	%g7
	wrpr	%l6,	0x033A,	%tick
	rdpr	%cansave,	%o0
	rd	%softint,	%g5
	movvs	%icc,	%i6,	%o6
	rdpr	%pil,	%g3
	lduh	[%l7 + 0x78],	%o7
	fpack16	%f16,	%f29
	rdpr	%canrestore,	%l3
	movg	%xcc,	%i1,	%g1
	wr	%i2,	%l2,	%clear_softint
	rd	%asi,	%l4
	edge8ln	%l1,	%i0,	%o1
	add	%g6,	0x03E6,	%i7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x905, 	%tick_cmpr
	wr	%i3,	%o3,	%y
	movn	%xcc,	%o4,	%o2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x7AB, 	%sys_tick_cmpr
	movne	%xcc,	%o5,	%i5
	rdhpr	%htba,	%l5
	rd	%fprs,	%g4
	tle	%xcc,	0x0
	alignaddrl	%g7,	%l6,	%g5
	edge32	%i6,	%o0,	%o6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x7E4, 	%hsys_tick_cmpr
	tneg	%icc,	0x6
	edge8n	%i1,	%g1,	%i2
	fexpand	%f14,	%f0
	taddcc	%l2,	%l4,	%l1
	fmovsvs	%xcc,	%f30,	%f1
	fpadd32	%f24,	%f14,	%f12
	taddcctv	%i0,	0x0BA7,	%l3
	std	%g6,	[%l7 + 0x38]
	fbl,a	%fcc2,	loop_665
	rd	%sys_tick_cmpr,	%o1
	rdpr	%cansave,	%i7
	movge	%icc,	%l0,	%i3
loop_665:
	rdpr	%otherwin,	%o3
	wrpr	%o2,	%o4,	%cwp
	rdhpr	%htba,	%i4
	rd	%sys_tick_cmpr,	%o5
	movrne	%i5,	%g2,	%g4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xCFD, 	%sys_tick_cmpr
	rd	%y,	%l6
	brgez	%g5,	loop_666
	fmovsg	%xcc,	%f26,	%f6
	wr	%g7,	0x1140,	%sys_tick
	bvs,pn	%icc,	loop_667
loop_666:
	fnegs	%f20,	%f19
	movrgz	%o0,	%i6,	%o6
	addccc	%g3,	0x19D1,	%i1
loop_667:
	fnot1	%f26,	%f10
	wr	%g1,	0x0609,	%clear_softint
	rdpr	%wstate,	%i2
	wr	%g0,	0x89,	%asi
	ldstuba	[%l7 + 0x1F] %asi,	%o7
        wr    %g0,    0xe,    %pcr    ! changed.
	fmovdn	%icc,	%f7,	%f13
	wrpr	%l2,	%i0,	%pil
	alignaddr	%g6,	%l3,	%o1
	orcc	%l0,	0x034C,	%i7
	rdhpr	%htba,	%i3
	set	0x64, %o4
	swapa	[%l7 + %o4] 0x80,	%o3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	or	%i4,	0x1BEC,	%o4
	sdivcc	%i5,	0x0FE6,	%g2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x88D, 	%hsys_tick_cmpr
	bneg,pt	%xcc,	loop_668
	rd	%fprs,	%l5
	rd	%fprs,	%l6
	fbug	%fcc3,	loop_669
loop_668:
	tsubcc	%g4,	%g5,	%o0
	wr	%g7,	%i6,	%ccr
	fbul,a	%fcc3,	loop_670
loop_669:
	rdhpr	%htba,	%o6
	subcc	%i1,	0x1C98,	%g1
	fmuld8ulx16	%f4,	%f30,	%f0
loop_670:
	fmovsne	%xcc,	%f12,	%f31
	orncc	%i2,	0x14D4,	%o7
	fpmerge	%f22,	%f3,	%f8
	rdpr	%cansave,	%g3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%wstate,	%i0
	fnegs	%f24,	%f16
	fmovspos	%xcc,	%f17,	%f16
	ldd	[%l7 + 0x08],	%f8
	wrpr	%g6,	0x1BB6,	%cwp
	smul	%l4,	%o1,	%l3
	movcs	%xcc,	%i7,	%i3
	rdpr	%wstate,	%l0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xD19, 	%hsys_tick_cmpr
	wrpr	%o2,	%i4,	%pil
	stx	%o4,	[%l7 + 0x78]
	fmovdne	%icc,	%f11,	%f27
	sir	0x0C58
	fbne	%fcc2,	loop_671
	movn	%xcc,	%g2,	%o5
	rd	%tick_cmpr,	%i5
	subcc	%l5,	%l6,	%g4
loop_671:
	wrpr	%o0,	0x0D6C,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fbul	%fcc2,	loop_672
	rdpr	%cleanwin,	%g5
	fbul	%fcc2,	loop_673
	rdhpr	%hsys_tick_cmpr,	%i1
loop_672:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fsrc2	%f24,	%f24
loop_673:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xE23, 	%hsys_tick_cmpr
	smulcc	%o7,	0x1AC2,	%g3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fmovrse	%i0,	%f3,	%f21
	rdpr	%otherwin,	%g6
	tvc	%xcc,	0x1
	fcmpes	%fcc0,	%f22,	%f30
	wr	%o1,	0x18EB,	%ccr
	wrpr	%l3,	0x0BF8,	%tick
	movgu	%xcc,	%l4,	%i7
	movre	%l0,	0x2D8,	%i3
	rd	%ccr,	%o3
	wr	%o2,	%o4,	%y
	rdhpr	%htba,	%g2
	tsubcc	%i4,	%i5,	%l5
	edge16n	%o5,	%g4,	%l6
	movn	%xcc,	%o0,	%g7
	tne	%xcc,	0x5
	nop
	setx loop_674, %l0, %l1
	jmpl %l1, %i6
	rd	%y,	%i1
	rd	%softint,	%g5
	andn	%g1,	%o6,	%i2
loop_674:
	rdhpr	%htba,	%o7
	rd	%y,	%g3
	fabsd	%f6,	%f14
	fmovdge	%xcc,	%f7,	%f30
	rd	%y,	%l1
	movrgez	%l2,	%g6,	%o1
	rd	%y,	%l3
	movcc	%xcc,	%l4,	%i7
	rd	%tick_cmpr,	%i0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x853, 	%hsys_tick_cmpr
	fnot1	%f30,	%f20
	rdhpr	%hsys_tick_cmpr,	%o2
	wr	%o4,	%l0,	%ccr
	std	%f8,	[%l7 + 0x28]
	call	loop_675
	rdhpr	%hsys_tick_cmpr,	%i4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x6F8, 	%hsys_tick_cmpr
	siam	0x0
loop_675:
	rd	%pc,	%g2
	edge16	%o5,	%g4,	%l6
	ta	%xcc,	0x1
	rdhpr	%htba,	%o0
	wrpr	%l5,	%i6,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x92C, 	%sys_tick_cmpr
	membar	0x7D
	sra	%g1,	%i1,	%o6
	fmovsn	%xcc,	%f13,	%f24
	umulcc	%i2,	%g3,	%l1
	sir	0x0F00
	rdhpr	%hintp,	%l2
	rdhpr	%hintp,	%o7
	andn	%o1,	0x14C1,	%l3
	mulx	%l4,	0x174C,	%g6
	wrpr	%i7,	0x0914,	%cwp
	movn	%xcc,	%i0,	%o3
	rdpr	%gl,	%i3
	edge16	%o4,	%o2,	%i4
	rdpr	%wstate,	%l0
	tle	%xcc,	0x1
	ta	%icc,	0x2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%otherwin,	%g4
        wr    %g0,    0xe,    %pcr    ! changed.
	rdpr	%cansave,	%o5
	movpos	%xcc,	%l5,	%i6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xC2A, 	%hsys_tick_cmpr
	mulscc	%i1,	0x1BC0,	%g7
	swap	[%l7 + 0x2C],	%o6
	sub	%i2,	0x1B9D,	%l1
	array8	%l2,	%o7,	%g3
	rdpr	%otherwin,	%l3
	fmovsneg	%icc,	%f18,	%f0
	rdpr	%canrestore,	%o1
	xnorcc	%g6,	%l4,	%i7
	subc	%o3,	%i0,	%o4
	mova	%icc,	%i3,	%o2
	rd	%asi,	%i4
	rdpr	%wstate,	%i5
	rdhpr	%hpstate,	%l0
	rdpr	%tba,	%g2
	movvs	%icc,	%l6,	%o0
	ta	%icc,	0x4
	rdpr	%cansave,	%o5
	rdpr	%pil,	%l5
	stw	%g4,	[%l7 + 0x64]
	siam	0x2
	fbg,a	%fcc3,	loop_676
	fmovdne	%icc,	%f14,	%f10
	fmovse	%xcc,	%f8,	%f3
	sra	%g5,	%g1,	%i1
loop_676:
	rd	%tick_cmpr,	%i6
	rd	%ccr,	%o6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	fbn	%fcc3,	loop_677
	rdhpr	%hsys_tick_cmpr,	%i2
	set	0x70, %l4
	ldswa	[%l7 + %l4] 0x15,	%o7
loop_677:
	wrpr	%l2,	0x0A86,	%cwp
	rdhpr	%htba,	%g3
	ba	%xcc,	loop_678
	srl	%o1,	0x12,	%g6
	rdhpr	%hintp,	%l3
	wrpr	%l4,	0x1986,	%cwp
loop_678:
	rd	%ccr,	%i7
	rd	%pc,	%i0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x0F9, 	%sys_tick_cmpr
	rd	%y,	%o2
	wr	%g0,	0x81,	%asi
	ldstuba	[%l7 + 0x1D] %asi,	%o3
	rd	%y,	%i4
	brz,a	%l0,	loop_679
	tge	%xcc,	0x4
	rdhpr	%hpstate,	%i5
	rd	%asi,	%l6
loop_679:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	sdivx	%o5,	0x1C24,	%g4
	wr	%g5,	%l5,	%ccr
	be	%icc,	loop_680
	fbo,a	%fcc1,	loop_681
	wrpr	%i1,	%i6,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_680:
	rdpr	%cansave,	%l1
loop_681:
	movne	%icc,	%g7,	%i2
	rdpr	%tba,	%l2
	wr	%g3,	0x0326,	%ccr
	rd	%y,	%o7
	rdpr	%cleanwin,	%g6
	rd	%softint,	%l3
	edge32l	%o1,	%l4,	%i7
	nop
	set	0x6A, %l5
	sth	%o4,	[%l7 + %l5]
	rdhpr	%hintp,	%i3
	rdpr	%otherwin,	%o2
	fandnot2s	%f14,	%f20,	%f3
	tcc	%xcc,	0x0
	rdhpr	%hintp,	%i0
	edge8	%i4,	%o3,	%i5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x363, 	%hsys_tick_cmpr
	rdpr	%tba,	%l0
	andncc	%o0,	%g4,	%o5
	rd	%tick_cmpr,	%l5
	rdhpr	%hsys_tick_cmpr,	%g5
	movleu	%icc,	%i1,	%o6
	ldstub	[%l7 + 0x4B],	%g1
	bl,pt	%icc,	loop_682
	nop
	set	0x18, %i2
	std	%i6,	[%l7 + %i2]
	fbe,a	%fcc2,	loop_683
	rdhpr	%htba,	%l1
loop_682:
	rd	%ccr,	%g7
	rdpr	%cwp,	%l2
loop_683:
	rd	%pc,	%i2
	wrpr	%g3,	%g6,	%cwp
	rd	%y,	%o7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	rdpr	%tba,	%l3
	rd	%tick_cmpr,	%l4
	rd	%sys_tick_cmpr,	%i7
	rd	%asi,	%o4
	wr	%i3,	0x07F0,	%sys_tick
	wr 	%g0, 	0x4, 	%fprs
	rdpr	%tl,	%o2
	mulscc	%i0,	0x066F,	%o3
	fpack32	%f12,	%f0,	%f10
	wrpr	%i4,	%l6,	%tick
	mova	%xcc,	%g2,	%l0
	wrpr	%o0,	%g4,	%tick
	wr	%o5,	%l5,	%ccr
	rdhpr	%hpstate,	%i5
	rdpr	%canrestore,	%i1
	rd	%ccr,	%o6
	movle	%icc,	%g1,	%g5
	rdhpr	%htba,	%i6
	bl,pt	%icc,	loop_684
	wrpr	%l1,	0x0600,	%cwp
	bgu,pt	%xcc,	loop_685
	call	loop_686
loop_684:
	fnot1s	%f16,	%f19
	sllx	%l2,	0x14,	%g7
loop_685:
	rdhpr	%hintp,	%i2
loop_686:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fble,a	%fcc0,	loop_687
	addccc	%l3,	0x03D0,	%l4
	andn	%i7,	0x067E,	%g6
	nop
	setx	loop_688,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_687:
	rd	%fprs,	%i3
	tvs	%xcc,	0x2
	wrpr	%o1,	%o4,	%pil
loop_688:
	nop
	wr	%g0,	0x04,	%asi
	ldsba	[%l7 + 0x21] %asi,	%o2
	bl,a	loop_689
	ldsb	[%l7 + 0x37],	%i0
	wr	%i4,	0x0231,	%set_softint
	wrpr	%l6,	0x0C62,	%pil
loop_689:
	rd	%fprs,	%o3
	fmovrse	%l0,	%f11,	%f13
	tleu	%xcc,	0x5
	wr	%o0,	%g2,	%y
	orncc	%o5,	0x1D15,	%g4
	alignaddr	%l5,	%i1,	%i5
	rdhpr	%htba,	%g1
	fpsub16	%f20,	%f10,	%f18
	fbue,a	%fcc0,	loop_690
	rd	%y,	%o6
	fmovrdgez	%g5,	%f2,	%f14
	alignaddrl	%l1,	%i6,	%g7
loop_690:
	rd	%y,	%l2
	wr	%g3,	%i2,	%set_softint
	tsubcc	%l3,	0x16D9,	%l4
	fexpand	%f25,	%f26
	wrpr	%i7,	0x0787,	%cwp
	rdpr	%wstate,	%g6
	xor	%o7,	%i3,	%o1
	rdpr	%cwp,	%o2
	rdhpr	%hsys_tick_cmpr,	%i0
	fbn	%fcc1,	loop_691
	brlez,a	%o4,	loop_692
	smulcc	%i4,	%l6,	%o3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x412, 	%hsys_tick_cmpr
loop_691:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
loop_692:
	fmovrsne	%o5,	%f29,	%f11
	mulx	%g4,	%i1,	%i5
	rdhpr	%hsys_tick_cmpr,	%g1
	wr	%o6,	0x1CE3,	%y
	rdhpr	%hpstate,	%g5
	rdpr	%cwp,	%l1
	wrpr	%i6,	0x007C,	%tick
	rdhpr	%hsys_tick_cmpr,	%l5
	ldsb	[%l7 + 0x40],	%g7
	rdpr	%cwp,	%l2
	bvc,pn	%xcc,	loop_693
	wrpr	%g3,	%l3,	%tick
	udivcc	%i2,	0x163B,	%i7
	wrpr	%l4,	0x1128,	%pil
loop_693:
	rdhpr	%hpstate,	%g6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%pc,	%i3
	prefetch	[%l7 + 0x70],	 0x0
	fones	%f21
	wrpr	%i0,	0x168E,	%cwp
	sub	%o4,	%i4,	%o2
	wr	%o3,	%l6,	%y

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fpack16	%f4,	%f31
	rdhpr	%hsys_tick_cmpr,	%o5
	mova	%icc,	%l0,	%i1
	addcc	%g4,	0x1191,	%g1
	wrpr	%i5,	%o6,	%tick
	fcmple16	%f26,	%f12,	%l1
	rdpr	%gl,	%i6
	rd	%sys_tick_cmpr,	%g5
	rdpr	%canrestore,	%g7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x9CC, 	%hsys_tick_cmpr
	rd	%ccr,	%g3
	wrpr	%l3,	%i7,	%tick
	wrpr	%i2,	0x0581,	%pil
	rd	%asi,	%g6
	rdhpr	%hintp,	%l4
        wr    %g0,    0xe,    %pcr    ! changed.
	wrpr	%i3,	%o7,	%tick
	rdhpr	%htba,	%o4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x988, 	%hsys_tick_cmpr
	array8	%i4,	%l6,	%o3
	ldd	[%l7 + 0x68],	%f20
	fmovsvc	%xcc,	%f26,	%f22
	rd	%sys_tick_cmpr,	%o0
	wrpr	%g2,	%l0,	%tick
	rdhpr	%htba,	%i1
	bl	%icc,	loop_694
	or	%g4,	0x1668,	%g1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	membar	0x7C
loop_694:
	movleu	%icc,	%o5,	%o6
	array8	%i6,	%l1,	%g7
	wrpr	%g5,	0x01D4,	%tick
	sdivcc	%l5,	0x0466,	%g3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xCED, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xCBF, 	%hsys_tick_cmpr
	fmovrse	%i2,	%f15,	%f25
	wrpr	%g6,	%l4,	%tick
	edge32l	%o1,	%o7,	%i3
	wrpr	%i0,	%o4,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	rdhpr	%hintp,	%l6
	tsubcc	%o2,	0x1A8B,	%o0
	rdhpr	%hpstate,	%o3
	sdivx	%l0,	0x0216,	%g2
	rdpr	%cleanwin,	%g4
	fandnot2s	%f13,	%f24,	%f20
	movne	%xcc,	%i1,	%i5
	tcc	%icc,	0x5
	wrpr	%g1,	0x08D0,	%tick
	movre	%o6,	0x10D,	%i6
	movvc	%icc,	%o5,	%g7
	rdpr	%pil,	%g5
	movne	%icc,	%l1,	%l5
	mulscc	%g3,	%l3,	%l2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xC4F, 	%hsys_tick_cmpr
	sethi	0x113D,	%l4
	tge	%xcc,	0x4
	wrpr	%o1,	0x11D8,	%pil
	wrpr	%g6,	%i3,	%pil
	or	%i0,	0x1949,	%o4
	rdpr	%cleanwin,	%o7
	edge32n	%i4,	%o2,	%l6
	wr	%g0,	0x89,	%asi
	ldda	[%l7 + 0x30] %asi,	%o0
	movrlez	%o3,	%l0,	%g4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x5CA, 	%hsys_tick_cmpr
	bvs	%icc,	loop_695
	rdhpr	%hsys_tick_cmpr,	%i5
	rdpr	%cleanwin,	%o6
	rd	%ccr,	%i6
loop_695:
	sra	%o5,	0x1F,	%g1
	rdpr	%cleanwin,	%g7
	wrpr	%g5,	0x080D,	%tick
	sdivcc	%l5,	0x090B,	%g3
	set	0x40, %o0
	ldda	[%l7 + %o0] 0x89,	%f16
	rd	%ccr,	%l1
	bvs,pn	%xcc,	loop_696
	edge8n	%l3,	%l2,	%i7
	wrpr	%l4,	%o1,	%pil
	movcs	%icc,	%g6,	%i3
loop_696:
	rdhpr	%hintp,	%i2
	rdhpr	%hpstate,	%i0
	movre	%o7,	%o4,	%i4
	wrpr	%o2,	0x1EF8,	%cwp
	tvs	%xcc,	0x0
	rdhpr	%htba,	%l6
	rdhpr	%hintp,	%o3
	st	%f2,	[%l7 + 0x0C]
	wrpr	%l0,	0x1643,	%cwp
	array16	%o0,	%i1,	%g4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fandnot1	%f6,	%f12,	%f20
	rdpr	%cwp,	%g2
	movleu	%icc,	%o6,	%o5
	fpmerge	%f15,	%f23,	%f30
	wr	%g1,	%g7,	%set_softint
	or	%i6,	%g5,	%l5
	movl	%icc,	%g3,	%l1
	rd	%sys_tick_cmpr,	%l3
	rdhpr	%hsys_tick_cmpr,	%i7
	array32	%l4,	%o1,	%l2
	wrpr	%i3,	0x1ACC,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	sdivx	%i0,	0x01A6,	%o7
	tle	%icc,	0x1
	rdhpr	%hintp,	%o4
	fmul8x16	%f17,	%f8,	%f24
	rdpr	%cwp,	%i4
	wrpr	%g6,	0x133F,	%cwp
	rdpr	%wstate,	%l6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%hpstate,	%o0
	subc	%i1,	%o2,	%g4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%hsys_tick_cmpr,	%g2
	rdhpr	%hintp,	%o6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x7B0, 	%hsys_tick_cmpr
	rdhpr	%hsys_tick_cmpr,	%g1
	fbl	%fcc2,	loop_697
	movg	%xcc,	%i6,	%g7
	rd	%pc,	%l5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_697:
	wrpr	%g3,	0x0FC6,	%pil
	rdpr	%cansave,	%l1
	rdpr	%tl,	%i7
	rdhpr	%hpstate,	%l4
	tne	%icc,	0x5
	rdhpr	%hintp,	%o1
	rdpr	%cleanwin,	%l3
	movpos	%icc,	%l2,	%i3
	rd	%asi,	%i0
	wrpr	%o7,	%i2,	%tick
	rdhpr	%hsys_tick_cmpr,	%o4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	movrlez	%l6,	0x2EA,	%i4
	bgu,a,pt	%xcc,	loop_698
	rdpr	%tba,	%l0
	rdhpr	%htba,	%o0
	fcmps	%fcc2,	%f27,	%f12
loop_698:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xBD7, 	%hsys_tick_cmpr
	rd	%sys_tick_cmpr,	%o3
	rdhpr	%hsys_tick_cmpr,	%g4
	rdpr	%cansave,	%o2
	subcc	%g2,	0x17C2,	%o6
	wrpr	%i5,	%o5,	%tick
	tle	%xcc,	0x7
	rd	%ccr,	%i6
	array16	%g1,	%g7,	%g5
	fsrc2s	%f27,	%f13
	rdpr	%cwp,	%g3
	movl	%icc,	%l1,	%i7
	movcs	%icc,	%l4,	%o1
	tvc	%icc,	0x4
	rdhpr	%hpstate,	%l5
	wrpr	%l2,	0x093B,	%cwp
	srlx	%l3,	0x01,	%i3
	wr	%o7,	0x11D6,	%y
	rd	%asi,	%i0
	ldsw	[%l7 + 0x0C],	%i2
	fandnot1s	%f6,	%f23,	%f10
	srax	%g6,	0x05,	%l6
	rdpr	%tba,	%i4
	fmuld8ulx16	%f18,	%f14,	%f14
	rd	%y,	%o4
	rdpr	%gl,	%l0
	wr	%i1,	%o3,	%set_softint
	rdpr	%tba,	%g4
	sdiv	%o0,	0x0093,	%o2
	movrgz	%g2,	0x1C4,	%i5
	sub	%o5,	0x0D21,	%o6
	rdhpr	%hintp,	%i6
	wrpr	%g1,	0x13F0,	%cwp
	wr	%g7,	%g3,	%softint
	rdhpr	%htba,	%l1
	brlz,a	%i7,	loop_699
	fbuge	%fcc1,	loop_700
	wrpr	%g5,	0x007C,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_699:
	bleu,a	loop_701
loop_700:
	rdpr	%cwp,	%o1
	edge8ln	%l2,	%l3,	%i3
	rdpr	%canrestore,	%i0
loop_701:
	movre	%i2,	0x14B,	%o7
	edge32	%l6,	%g6,	%i4
	srl	%o4,	%l0,	%i1
	rdhpr	%hsys_tick_cmpr,	%g4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x473, 	%hsys_tick_cmpr
	rd	%tick_cmpr,	%i5
	orn	%o0,	0x0A29,	%o6
	rd	%asi,	%o5
	add	%l7,	0x74,	%l6
	wr	%g0,	0x18,	%asi
	lda	[%l6] %asi,	%g1
	casa	[%l6] 0x18,	%g1,	%g7
	sllx	%i6,	%g3,	%i7
	st	%f29,	[%l7 + 0x08]
	rd	%asi,	%l1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%o1,	%l2,	%pil
	srlx	%l3,	%i3,	%i0
	tcs	%xcc,	0x4
	rdpr	%gl,	%l5
	andn	%i2,	0x1575,	%l6
	rdpr	%cansave,	%o7
	rd	%softint,	%i4
	tn	%icc,	0x3
	rdhpr	%htba,	%g6
	rdhpr	%htba,	%l0
	wrpr	%o4,	0x17E8,	%cwp
	sth	%i1,	[%l7 + 0x76]
	rdhpr	%hsys_tick_cmpr,	%o3
	rd	%fprs,	%o2
	fbge,a	%fcc0,	loop_702
	tpos	%icc,	0x0
	movre	%g2,	0x01B,	%g4
        wr    %g0,    0xe,    %pcr    ! changed.
loop_702:
	rd	%softint,	%i5
	rd	%asi,	%o6
	tcc	%xcc,	0x2
	rdhpr	%hsys_tick_cmpr,	%o5
	fmuld8ulx16	%f17,	%f22,	%f20
	wr	%g7,	0x17E3,	%sys_tick
	wr	%i6,	%g3,	%pic
        wr    %g0,    0xe,    %pcr    ! changed.
	rdhpr	%hpstate,	%g5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x604, 	%tick_cmpr
	wrpr	%l4,	0x1774,	%cwp
	wrpr	%o1,	0x009D,	%cwp
	rd	%sys_tick_cmpr,	%l2
	array32	%i3,	%i0,	%l5
	pdist	%f2,	%f2,	%f14
	rdhpr	%hpstate,	%i2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xAED, 	%hsys_tick_cmpr
	wr	%i4,	%g6,	%softint
	set	0x58, %g7
	lduha	[%l7 + %g7] 0x14,	%l0
	wr	%l3,	0x11E9,	%softint
	fmovrdlez	%i1,	%f14,	%f4
	rdpr	%cansave,	%o4
	call	loop_703
	wrpr	%o2,	0x025E,	%tick
	rd	%ccr,	%o3
	bcs,a,pn	%xcc,	loop_704
loop_703:
	bgu	%icc,	loop_705
	alignaddrl	%g4,	%g2,	%o0
	wr 	%g0, 	0x7, 	%fprs
loop_704:
	fabss	%f9,	%f14
loop_705:
	wr	%o5,	%g7,	%softint
	movg	%icc,	%i5,	%g3
	wr	%g1,	0x168B,	%ccr
	fmovsgu	%icc,	%f16,	%f11

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xA73, 	%hsys_tick_cmpr
	fba,a	%fcc0,	loop_706
	tvc	%icc,	0x2
	membar	0x61
	wrpr	%g5,	0x181B,	%cwp
loop_706:
	andncc	%l4,	%o1,	%l2
	rdhpr	%hpstate,	%i3
	wrpr	%i7,	0x0079,	%cwp
	rdpr	%otherwin,	%i0
	tg	%icc,	0x0
	sra	%l5,	0x1D,	%l6
	rdpr	%tba,	%o7
	fornot2s	%f17,	%f2,	%f1
	rd	%fprs,	%i4
	st	%f6,	[%l7 + 0x24]
	wr 	%g0, 	0x5, 	%fprs
	rd	%ccr,	%i2
	rdhpr	%hsys_tick_cmpr,	%l0
	popc	0x0781,	%i1
	rd	%sys_tick_cmpr,	%l3
	wrpr	%o4,	0x0054,	%pil
	fornot1	%f24,	%f6,	%f6
	tcs	%xcc,	0x5
	rdpr	%tl,	%o3
	fmovdcs	%icc,	%f26,	%f8
	bvs,pt	%xcc,	loop_707
	move	%icc,	%o2,	%g2
	fmovd	%f4,	%f14
	wrpr	%g4,	%o0,	%tick
loop_707:
	fabss	%f28,	%f17
	rdhpr	%hintp,	%o6
	rdpr	%tl,	%o5
	edge8n	%i5,	%g3,	%g7
	rd	%ccr,	%g1
	fpmerge	%f26,	%f13,	%f26
	wrpr	%l1,	%g5,	%cwp
	fnot1s	%f3,	%f15
	rdhpr	%hpstate,	%i6
	ta	%icc,	0x7
	rdhpr	%hintp,	%l4
	wr	%o1,	%i3,	%set_softint
	rdpr	%otherwin,	%l2
	wrpr	%i0,	%l5,	%tick
	sth	%l6,	[%l7 + 0x48]
	alignaddrl	%o7,	%i4,	%g6
	rdhpr	%hintp,	%i2
	std	%f20,	[%l7 + 0x28]

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%l0,	%o4,	%pil
	fmovrsgez	%o3,	%f13,	%f6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%htba,	%g2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x329, 	%sys_tick_cmpr
	fone	%f18
	edge8n	%o0,	%o5,	%i5
	wrpr	%g7,	0x1CBB,	%cwp
	wr	%g3,	%g1,	%y
	fbuge,a	%fcc1,	loop_708
	movle	%icc,	%l1,	%i6
	fmovrsgez	%l4,	%f8,	%f21
	set	0x33, %i6
	ldstuba	[%l7 + %i6] 0x10,	%g5
loop_708:
	fmovrsgz	%o1,	%f29,	%f0
	rd	%tick_cmpr,	%l2
	sll	%i3,	0x04,	%l5
	rdpr	%canrestore,	%l6
	fmovdn	%xcc,	%f24,	%f7
	tneg	%xcc,	0x6
	rd	%softint,	%o7
	rdhpr	%hpstate,	%i4
	tcc	%icc,	0x1
	sra	%g6,	%i0,	%i2
	sdivx	%i1,	0x18F1,	%i7
	lduw	[%l7 + 0x08],	%l0
	and	%o4,	0x16A1,	%o3
	wrpr	%o2,	0x1350,	%tick
	rd	%softint,	%g2
	wrpr	%l3,	0x121D,	%pil
	movvc	%icc,	%g4,	%o0
	rd	%fprs,	%o5
	movpos	%icc,	%o6,	%i5
	fbe,a	%fcc1,	loop_709
	flush	%l7 + 0x6C
	wr	%g0,	0x89,	%asi
	stba	%g3,	[%l7 + 0x0E] %asi
loop_709:
	bvs,pt	%icc,	loop_710
	fnot2s	%f30,	%f25
	rdpr	%wstate,	%g1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_710:
	fbg,a	%fcc2,	loop_711
	rdhpr	%hpstate,	%l4
	wr	%g0,	0x10,	%asi
	sta	%f26,	[%l7 + 0x44] %asi
loop_711:
	add	%g5,	0x13C2,	%o1
	bg,a	%icc,	loop_712
	std	%l2,	[%l7 + 0x60]
	rdhpr	%hpstate,	%i3
	tsubcctv	%l5,	0x0D8E,	%l6
loop_712:
	rd	%fprs,	%o7
	rdpr	%tba,	%l1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x679, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xB18, 	%hsys_tick_cmpr
	nop
	set	0x20, %l2
	ldx	[%l7 + %l2],	%i7
	wr	%i1,	%o4,	%ccr
	rd	%softint,	%o3
	rd	%softint,	%l0
	tcc	%icc,	0x1
	wrpr	%o2,	%l3,	%pil
	subcc	%g2,	%o0,	%g4
	smulcc	%o6,	%i5,	%g3
	wrpr	%o5,	%g7,	%cwp
	fmovsg	%xcc,	%f9,	%f22
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	and	%i6,	%l4,	%g1
	edge16ln	%o1,	%g5,	%i3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	flush	%l7 + 0x08
	fone	%f18
	edge8n	%o7,	%l1,	%g6
	fcmpeq32	%f0,	%f28,	%i0
	udivcc	%l5,	0x0576,	%i2
	tpos	%icc,	0x3
	fnegs	%f28,	%f30
	wrpr	%i7,	0x161C,	%cwp
	fbu	%fcc1,	loop_713
	sub	%i1,	%o4,	%o3
	sll	%l0,	0x0D,	%i4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_713:
	rdpr	%tl,	%o2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fbo	%fcc3,	loop_714
	srl	%g4,	%o6,	%g2
	fornot1	%f14,	%f14,	%f6
	wr	%g3,	%i5,	%clear_softint
loop_714:
	edge32	%o5,	%i6,	%l4
	call	loop_715
	tcs	%icc,	0x0
	rd	%asi,	%g7
	rdpr	%cwp,	%o1
loop_715:
	rd	%y,	%g1
	wrpr	%i3,	%l2,	%pil
	membar	#Sync
	wr	%g0,	0x1e,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	wrpr	%g5,	0x0E8E,	%tick
	rdhpr	%htba,	%o7
	wrpr	%l1,	%l6,	%cwp
	udivcc	%g6,	0x1880,	%i0
	rd	%y,	%i2
	wr	%l5,	0x1928,	%softint
	rdpr	%otherwin,	%i7
	wrpr	%o4,	0x0EFE,	%cwp
	fbge,a	%fcc1,	loop_716
	fbg	%fcc3,	loop_717
	wrpr	%i1,	0x150C,	%pil
	edge8	%l0,	%o3,	%l3
loop_716:
	rd	%fprs,	%i4
loop_717:
	wr	%o2,	0x1CF9,	%ccr
	set	0x70, %o7
	sta	%f3,	[%l7 + %o7] 0x18
	fpadd16s	%f12,	%f15,	%f12
	tne	%icc,	0x0
	membar	0x7C
	subccc	%o0,	0x0745,	%g4
	rdhpr	%hsys_tick_cmpr,	%o6
	rdhpr	%hpstate,	%g3
	std	%f14,	[%l7 + 0x50]
	fpadd16s	%f13,	%f13,	%f10
	movg	%xcc,	%i5,	%g2
	fmovsvc	%xcc,	%f17,	%f23
	fmul8sux16	%f26,	%f20,	%f10
	call	loop_718
	tgu	%icc,	0x6
	wrpr	%o5,	%i6,	%cwp
	smul	%g7,	%o1,	%g1
loop_718:
	nop
	wr	%g0,	0xe3,	%asi
	stha	%l4,	[%l7 + 0x32] %asi
	membar	#Sync
	tpos	%xcc,	0x3
	rd	%fprs,	%l2
	rdpr	%tl,	%i3
	sir	0x1078
	fmovsle	%xcc,	%f0,	%f4
	rdhpr	%hpstate,	%o7
	rdhpr	%hsys_tick_cmpr,	%g5
	xnor	%l1,	0x0460,	%l6
	rdpr	%cwp,	%g6
	rd	%tick_cmpr,	%i2
	tsubcc	%i0,	0x1E0B,	%i7
	nop
	set	0x7E, %g3
	lduh	[%l7 + %g3],	%l5
	rd	%pc,	%o4
	rd	%y,	%i1
	bg,a,pn	%xcc,	loop_719
	rd	%pc,	%o3
	edge8	%l3,	%l0,	%i4
	rd	%asi,	%o2
loop_719:
	movrlz	%g4,	0x36D,	%o6
	rd	%pc,	%g3
	rdhpr	%hintp,	%o0
	movvc	%icc,	%i5,	%g2
	sdiv	%o5,	0x179D,	%i6
	rdpr	%gl,	%o1
	set	0x40, %o2
	ldda	[%l7 + %o2] 0x15,	%f0
	lduw	[%l7 + 0x24],	%g1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x4E6, 	%hsys_tick_cmpr
	array32	%g7,	%o7,	%g5
	rdhpr	%hsys_tick_cmpr,	%i3
	rdpr	%otherwin,	%l1
	rdhpr	%hsys_tick_cmpr,	%g6
	fbue,a	%fcc0,	loop_720
	mova	%xcc,	%l6,	%i0
	rdhpr	%hsys_tick_cmpr,	%i7
	rdpr	%cwp,	%i2
loop_720:
	wrpr	%l5,	0x1746,	%pil
	wrpr	%o4,	%i1,	%pil
	fcmpd	%fcc1,	%f2,	%f6
	rd	%asi,	%o3
	wrpr	%l3,	%i4,	%cwp
	rdhpr	%hintp,	%l0
	rdpr	%canrestore,	%g4
	wr	%o6,	%g3,	%clear_softint

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%hsys_tick_cmpr,	%g2
	bge	loop_721
	rd	%asi,	%o5
	tpos	%icc,	0x2
	rd	%y,	%i5
loop_721:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x22A, 	%hsys_tick_cmpr
	tl	%xcc,	0x2
	rdpr	%cansave,	%g1
	fand	%f18,	%f8,	%f6
	tn	%xcc,	0x0
	rd	%ccr,	%l4
	wr	%g7,	0x0C60,	%ccr
	xor	%o7,	0x0F41,	%g5
	rd	%pc,	%l2
	fmovsvs	%icc,	%f2,	%f27
	rdpr	%canrestore,	%l1
	fmovsg	%xcc,	%f8,	%f25
	set	0x0C, %l1
	lduwa	[%l7 + %l1] 0x80,	%i3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xCE1, 	%hsys_tick_cmpr
	rdpr	%cleanwin,	%i0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wrpr	%l6,	%i7,	%pil
	te	%icc,	0x5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x6EF, 	%hsys_tick_cmpr
	fcmple16	%f26,	%f30,	%i1
	wr	%i2,	%l3,	%clear_softint
	wr 	%g0, 	0x6, 	%fprs
	rdhpr	%hpstate,	%l0
	fmovdleu	%xcc,	%f19,	%f30
	rdhpr	%hpstate,	%g4
	rd	%y,	%o6
	flush	%l7 + 0x38
	wrpr	%g3,	%o2,	%tick
	fnor	%f22,	%f16,	%f4
	rdhpr	%htba,	%i4
	movrne	%g2,	%o0,	%o5
	rd	%fprs,	%i5
	rdpr	%cwp,	%i6
	movleu	%icc,	%g1,	%o1
	rdpr	%canrestore,	%g7
	edge32l	%l4,	%o7,	%l2
	srl	%l1,	0x1C,	%g5
	movcc	%xcc,	%i3,	%i0
	rd	%pc,	%g6
	wrpr	%l6,	%l5,	%tick
	rd	%tick_cmpr,	%i7
	fmovrdgez	%i1,	%f14,	%f28
	rdpr	%tba,	%o4
	wr 	%g0, 	0x5, 	%fprs
	bn,pt	%icc,	loop_722
	rdpr	%pil,	%o3
	subcc	%l0,	0x0641,	%g4
	rdpr	%canrestore,	%o6
loop_722:
	rdpr	%pil,	%g3
	rd	%pc,	%i2
	rdhpr	%hintp,	%i4
	rdhpr	%hintp,	%g2
	fcmpd	%fcc0,	%f0,	%f10
	rdhpr	%htba,	%o2
	wrpr	%o5,	0x12C9,	%tick
	ldsb	[%l7 + 0x72],	%o0
	rd	%y,	%i6
	wr	%g1,	%i5,	%y
	wr	%g7,	%l4,	%ccr
	rdhpr	%hsys_tick_cmpr,	%o7
	rd	%ccr,	%o1
	wrpr	%l1,	%g5,	%tick
	tneg	%xcc,	0x7
	fbue	%fcc2,	loop_723
	fnor	%f16,	%f20,	%f0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x479, 	%hsys_tick_cmpr
	edge32n	%i3,	%l6,	%g6
loop_723:
	rd	%sys_tick_cmpr,	%i7
	rdpr	%wstate,	%l5
	rd	%fprs,	%i1
	udiv	%o4,	0x0F27,	%o3
	wr	%l3,	0x1A73,	%clear_softint
	rd	%tick_cmpr,	%l0
	ldub	[%l7 + 0x21],	%g4
	bvs	loop_724
	bl,pt	%xcc,	loop_725
	tvs	%xcc,	0x4
	wrpr	%o6,	0x0EEC,	%cwp
loop_724:
	rdhpr	%hsys_tick_cmpr,	%g3
loop_725:
	rdpr	%cleanwin,	%i4
	or	%g2,	%i2,	%o5
	fxnor	%f12,	%f12,	%f4
	sra	%o0,	%o2,	%g1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	edge16n	%i6,	%l4,	%o7
	wrpr	%g7,	%o1,	%tick
	wrpr	%g5,	%l1,	%pil
	wrpr	%i0,	0x153F,	%cwp
	wrpr	%i3,	0x03FF,	%tick
	add	%l7,	0x3C,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%l6,	%l2
	wr	%g6,	%i7,	%ccr
	wrpr	%i1,	%o4,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fpsub16s	%f17,	%f19,	%f9
	brlz,a	%l3,	loop_726
	rd	%fprs,	%g4
	fmul8ulx16	%f28,	%f28,	%f14

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_726:
	orcc	%l0,	0x1AE4,	%i4
	sethi	0x1028,	%g2
	rdhpr	%hintp,	%g3
	stx	%i2,	[%l7 + 0x28]
	rd	%softint,	%o0
	wr	%o5,	0x18D2,	%set_softint
	bgu,a,pn	%icc,	loop_727
	xorcc	%o2,	0x199F,	%g1
	fxnor	%f26,	%f12,	%f4
	fmuld8sux16	%f13,	%f15,	%f0
loop_727:
	rdhpr	%htba,	%i5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x7E2, 	%hsys_tick_cmpr
	bcs	loop_728
	rdpr	%wstate,	%l4
	rdhpr	%hsys_tick_cmpr,	%o7
	rdhpr	%hintp,	%g7
loop_728:
	bl,a,pt	%xcc,	loop_729
	subccc	%o1,	0x1A08,	%g5
	wrpr	%l1,	%i3,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xD43, 	%tick_cmpr
loop_729:
	movneg	%xcc,	%g6,	%l2
	rdhpr	%hsys_tick_cmpr,	%i7
	rdpr	%gl,	%i1
	tg	%icc,	0x1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xC83, 	%hsys_tick_cmpr
	rd	%pc,	%l3
	wrpr	%g4,	0x18BD,	%pil
	andncc	%o6,	%o3,	%l0
	rd	%softint,	%i4
	sub	%g2,	0x0CBB,	%g3
	rd	%fprs,	%i2
	wr	%o5,	0x05FF,	%set_softint
	fmovsne	%xcc,	%f24,	%f30
	rdpr	%wstate,	%o0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array32	%g1,	%i5,	%o2
	fmovrde	%i6,	%f22,	%f26
	rdhpr	%hpstate,	%o7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%o1,	%g5,	%cwp
	rdpr	%gl,	%l4
	taddcctv	%i3,	%l1,	%l6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xFDA, 	%hsys_tick_cmpr
	rdpr	%tba,	%l2
	tsubcc	%i7,	%l5,	%o4
	rdhpr	%hintp,	%l3
	wrpr	%i1,	%g4,	%tick
	wrpr	%o6,	%o3,	%tick
	fmul8ulx16	%f10,	%f22,	%f22
	fxors	%f5,	%f24,	%f11
	rdhpr	%hsys_tick_cmpr,	%i4
	fnot2	%f16,	%f4
	rdhpr	%hsys_tick_cmpr,	%g2
	movn	%icc,	%g3,	%l0
	fmovsvs	%xcc,	%f29,	%f31
	rdpr	%otherwin,	%o5
	wr	%o0,	%g1,	%set_softint
	set	0x32, %g5
	ldsha	[%l7 + %g5] 0x81,	%i2
	rd	%pc,	%i5
	rdpr	%canrestore,	%i6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%o2,	%g7,	%softint
	fnot2	%f24,	%f4
	rdpr	%cansave,	%g5
	nop
	setx	loop_730,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	rdhpr	%htba,	%o1
	rd	%asi,	%l4
	rdpr	%gl,	%l1
loop_730:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fblg,a	%fcc0,	loop_731
	fpsub16s	%f30,	%f20,	%f0
	rd	%pc,	%i0
	rdpr	%tl,	%g6
loop_731:
	movpos	%xcc,	%i7,	%l2
	wrpr	%o4,	%l5,	%tick
	edge32n	%l3,	%g4,	%i1
	fmovdne	%xcc,	%f20,	%f2
	rd	%fprs,	%o6
	udivcc	%o3,	0x0D4F,	%i4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x9B6, 	%hsys_tick_cmpr
	rdhpr	%htba,	%o5
	set	0x10, %i4
	lda	[%l7 + %i4] 0x18,	%f25

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x0AD, 	%hsys_tick_cmpr
	movpos	%icc,	%g1,	%o0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%i6,	%o7,	%cwp
	brz	%g7,	loop_732
	wr	%g5,	0x06E3,	%y
	rdpr	%cwp,	%o1
	set	0x44, %i1
	ldsha	[%l7 + %i1] 0x14,	%l4
loop_732:
	fble,a	%fcc2,	loop_733
	wrpr	%l1,	0x1185,	%tick
	wr	%i3,	0x104C,	%clear_softint
	stbar
loop_733:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xDDF, 	%hsys_tick_cmpr
	wr	%g6,	0x1D40,	%clear_softint
	nop
	setx	loop_734,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	wrpr	%i7,	0x0E81,	%pil
	wrpr	%l6,	%l2,	%pil
	fmovsleu	%xcc,	%f3,	%f28
loop_734:
	rdhpr	%hpstate,	%o4
	wr	%l5,	0x0642,	%clear_softint
	rdpr	%wstate,	%g4
	rdhpr	%hpstate,	%l3
	add	%l7,	0x0C,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%i1
	casa	[%l6] %asi,	%i1,	%o3
	fexpand	%f18,	%f0
	rd	%softint,	%i4
	wr	%o6,	%g2,	%sys_tick
	set	0x3C, %o3
	ldsba	[%l7 + %o3] 0x0c,	%g3
	wr	%l0,	0x0950,	%y
	fxnor	%f18,	%f6,	%f8

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%htba,	%o0
	fmul8sux16	%f6,	%f20,	%f6
	fmovdvc	%xcc,	%f27,	%f9
	taddcc	%g1,	%i2,	%i6
	fcmple16	%f8,	%f20,	%o7
	wrpr	%i5,	%g5,	%pil
	rd	%softint,	%g7
	tcc	%xcc,	0x2
	fxor	%f0,	%f24,	%f14
	wrpr	%l4,	%o1,	%pil
	rd	%softint,	%l1
	fmovrsne	%o2,	%f5,	%f26
	fbu	%fcc1,	loop_735
	rdhpr	%hpstate,	%i0
	tleu	%xcc,	0x4
	rdhpr	%hintp,	%i3
loop_735:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x16E, 	%hsys_tick_cmpr
        wr    %g0,    0xe,    %pcr    ! changed.
	wrpr	%l2,	%g4,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xE1B, 	%hsys_tick_cmpr
	fbne	%fcc1,	loop_736
	rd	%asi,	%o3
	rdpr	%cleanwin,	%i4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_736:
	fmovsn	%icc,	%f8,	%f9

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	edge32l	%g2,	%g3,	%l0
	fmovrsgz	%i1,	%f29,	%f21
	rdpr	%wstate,	%o0
	rdhpr	%hintp,	%o5
	rd	%sys_tick_cmpr,	%i2
	wr	%g1,	%o7,	%softint
	rd	%y,	%i6
	wrpr	%g5,	0x0BE2,	%tick
	movrlz	%g7,	%i5,	%l4
	rdhpr	%hsys_tick_cmpr,	%o1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x849, 	%tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	movre	%g6,	%i7,	%l6
        wr    %g0,    0xe,    %pcr    ! changed.
	rd	%ccr,	%g4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x07E, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xAAF, 	%hsys_tick_cmpr
	rdhpr	%hpstate,	%o6
	rdhpr	%hintp,	%g2
	edge8ln	%i4,	%l0,	%g3
	wrpr	%i1,	%o5,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fnot2	%f22,	%f12
	ld	[%l7 + 0x4C],	%f30
	swap	[%l7 + 0x4C],	%o7
	fones	%f17

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%pc,	%g5
	ldd	[%l7 + 0x18],	%g6
	wr	%g1,	%i5,	%clear_softint
	wrpr	%l4,	0x04CC,	%pil
	rdpr	%cwp,	%o2
	rd	%pc,	%o1
        wr    %g0,    0xe,    %pcr    ! changed.

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	set	0x10, %o1
	ldda	[%l7 + %o1] 0x04,	%g6
	wr	%i0,	%i7,	%y
	set	0x48, %o6
	ldswa	[%l7 + %o6] 0x81,	%l6
	tleu	%icc,	0x6
	tcc	%icc,	0x6
	wr	%l2,	%o4,	%pic
	xor	%l3,	0x0687,	%g4
	mulx	%o3,	0x14E0,	%o6
	bge	%icc,	loop_737
	rd	%pc,	%g2
	movvc	%xcc,	%i4,	%l0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xC6D, 	%hsys_tick_cmpr
loop_737:
	rdhpr	%htba,	%i1
	edge8l	%o5,	%o0,	%l5
	rd	%asi,	%i2
	rdhpr	%hintp,	%i6
	bvc,a,pn	%xcc,	loop_738
	rdhpr	%hsys_tick_cmpr,	%g5
	tne	%icc,	0x1
	rd	%fprs,	%g7
loop_738:
	rdhpr	%htba,	%o7
	bneg,a,pt	%icc,	loop_739
	rdpr	%tba,	%g1
	rdpr	%cwp,	%l4
	rd	%pc,	%i5
loop_739:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xCA7, 	%hsys_tick_cmpr
	wr	%o2,	%l1,	%ccr
	fbo	%fcc1,	loop_740
	rd	%softint,	%i3
	rdpr	%tba,	%i0
	fbl,a	%fcc2,	loop_741
loop_740:
	rd	%tick_cmpr,	%g6
	sir	0x03D9
	fmovsne	%xcc,	%f23,	%f7
loop_741:
	mulx	%l6,	%i7,	%o4
	tpos	%xcc,	0x4
	rd	%tick_cmpr,	%l2
	wr	%g4,	0x0A59,	%y
	movn	%xcc,	%o3,	%o6
	wr	%g2,	0x1003,	%ccr
	wrpr	%l3,	%i4,	%cwp
	wrpr	%g3,	0x0942,	%pil
	fmovsle	%xcc,	%f9,	%f30

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x101, 	%hsys_tick_cmpr
	rdhpr	%htba,	%o0
	movrgz	%l0,	%l5,	%i6
	rdpr	%cwp,	%g5
	wrpr	%i2,	%o7,	%cwp
	rdpr	%cwp,	%g1
	wrpr	%l4,	%g7,	%tick
	fornot2s	%f28,	%f5,	%f3
	tge	%xcc,	0x4
	fmovdneg	%icc,	%f18,	%f18
	fabsd	%f30,	%f2
	wrpr	%o1,	0x12F8,	%tick
	rdpr	%canrestore,	%i5
	fmovsvs	%xcc,	%f28,	%f4
	wrpr	%l1,	%o2,	%tick
	rdhpr	%hpstate,	%i3
	set	0x34, %l0
	lduwa	[%l7 + %l0] 0x81,	%i0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	and	%l6,	%l2,	%o4
	rdhpr	%hsys_tick_cmpr,	%g4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	ba,a,pt	%icc,	loop_742
	wrpr	%g2,	0x0889,	%cwp
	andncc	%l3,	%o3,	%i4
	fmovrsgz	%i1,	%f5,	%f16
loop_742:
	rdpr	%otherwin,	%o5
	tcc	%xcc,	0x2
	edge32l	%g3,	%o0,	%l5
	and	%i6,	0x043E,	%g5
	rdhpr	%hsys_tick_cmpr,	%i2
	udivcc	%o7,	0x1734,	%g1
	tne	%xcc,	0x3
	fbo	%fcc3,	loop_743
	wrpr	%l0,	%l4,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xE9B, 	%sys_tick_cmpr
	rdpr	%gl,	%o1
loop_743:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xE52, 	%sys_tick_cmpr
	wr	%g0,	0x89,	%asi
	stda	%l0,	[%l7 + 0x20] %asi
	fmovsle	%xcc,	%f17,	%f6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fnegs	%f19,	%f19
	rdhpr	%htba,	%i3
	fzero	%f10
	rd	%asi,	%i7
	fpsub16s	%f30,	%f1,	%f10
	rd	%pc,	%l6
	sethi	0x1C38,	%g6
	wr	%o4,	0x1A7B,	%softint
	rd	%fprs,	%l2
        wr    %g0,    0xe,    %pcr    ! changed.
	wrpr	%g2,	0x0AA7,	%pil
	rdpr	%cleanwin,	%o3
	andn	%l3,	%i1,	%o5
	rdhpr	%hpstate,	%g3
	movneg	%icc,	%i4,	%o0
	orcc	%l5,	0x00DE,	%g5
	rdpr	%tl,	%i6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x036, 	%hsys_tick_cmpr
	rdhpr	%htba,	%g1
	fbul	%fcc0,	loop_744
	rd	%fprs,	%l0
	fsrc1	%f0,	%f12
	tg	%xcc,	0x2
loop_744:
	fornot1	%f24,	%f8,	%f14
	wrpr	%l4,	0x0530,	%tick
	rdhpr	%hsys_tick_cmpr,	%o7
	taddcc	%g7,	%i5,	%o1
	wr	%l1,	0x1D45,	%clear_softint
	std	%f16,	[%l7 + 0x70]
	fmovsvs	%xcc,	%f7,	%f22
	wr	%o2,	0x17FB,	%y

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	popc	%i0,	%o6
	bn,a	loop_745
	rdhpr	%hpstate,	%g4
	bcs	%xcc,	loop_746
	edge32ln	%g2,	%o3,	%i1
loop_745:
	rdhpr	%hintp,	%l3
	rdpr	%wstate,	%o5
loop_746:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x108, 	%hsys_tick_cmpr
	rdpr	%pil,	%l5
	ldub	[%l7 + 0x71],	%g5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xE60, 	%hsys_tick_cmpr
	movge	%icc,	%l0,	%l4
	rdpr	%cansave,	%i6
	ble,a	loop_747
	xnor	%g7,	%o7,	%o1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x58E, 	%hsys_tick_cmpr
loop_747:
	wrpr	%i3,	%i7,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x3B6, 	%tick_cmpr
	fcmpgt16	%f10,	%f30,	%i5
	rdhpr	%hintp,	%g6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x352, 	%hsys_tick_cmpr
	rdpr	%gl,	%o4
	fornot1	%f22,	%f8,	%f16
	wrpr	%g4,	%g2,	%cwp
        wr    %g0,    0xe,    %pcr    ! changed.
	tsubcc	%l3,	%o5,	%i1
	fmovrdne	%g3,	%f16,	%f14
	rd	%pc,	%o0
	bvs	%icc,	loop_748
	edge32	%i4,	%l5,	%g5
	edge8n	%i2,	%l0,	%g1
	movcs	%xcc,	%l4,	%i6
loop_748:
	srl	%g7,	0x08,	%o1
	rdhpr	%hintp,	%o7
	set	0x70, %i7
	ldxa	[%l7 + %i7] 0x89,	%o2
	sra	%l1,	0x15,	%i7
	edge16n	%i3,	%i5,	%g6
	tvc	%xcc,	0x4
	rd	%ccr,	%l6
	wrpr	%l2,	0x00F6,	%cwp
	rdpr	%tl,	%i0
	rd	%fprs,	%o4
	tn	%xcc,	0x6
	sll	%g4,	%g2,	%o3
	wrpr	%o6,	0x083B,	%tick
	rd	%fprs,	%l3
	rdhpr	%hsys_tick_cmpr,	%o5
	rd	%softint,	%g3
	rd	%fprs,	%o0
	wrpr	%i4,	0x0028,	%pil
	movrgz	%l5,	%g5,	%i1
	rd	%y,	%l0
	wr	%g0,	0x81,	%asi
	lduwa	[%l7 + 0x08] %asi,	%i2
	fba,a	%fcc3,	loop_749
	rd	%sys_tick_cmpr,	%g1
	wr	%l4,	0x1300,	%y
	nop
	set	0x28, %l3
	ldd	[%l7 + %l3],	%g6
loop_749:
	fcmpne16	%f10,	%f18,	%i6
	rdhpr	%htba,	%o7
	rdpr	%cleanwin,	%o2
	edge8l	%l1,	%o1,	%i3
	wr	%i7,	%g6,	%clear_softint
	rdhpr	%htba,	%i5
	rdhpr	%hsys_tick_cmpr,	%l2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	umulcc	%g4,	%g2,	%l6
	wrpr	%o3,	0x11D6,	%pil
	smul	%o6,	%o5,	%g3
	rdhpr	%hintp,	%l3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tsubcctv	%i4,	%l5,	%o0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x4C8, 	%hsys_tick_cmpr
	movcc	%icc,	%g5,	%g1
	rdpr	%canrestore,	%i2
	movrgz	%g7,	0x3A4,	%l4
	tcc	%icc,	0x1
	edge32l	%i6,	%o7,	%l1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xFD3, 	%hsys_tick_cmpr
	xorcc	%i3,	%o2,	%g6
	wr	%i5,	0x1413,	%clear_softint
	rdhpr	%hpstate,	%i7
	st	%f29,	[%l7 + 0x68]
	rd	%sys_tick_cmpr,	%i0
	movrgz	%l2,	%g4,	%o4
	taddcc	%l6,	0x0FB9,	%o3
	te	%xcc,	0x1
	rdpr	%tba,	%o6
	wr	%g2,	0x1994,	%ccr
	umul	%o5,	0x07C2,	%l3
	fmovsne	%icc,	%f20,	%f12
	fsrc1s	%f24,	%f18

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x73E, 	%hsys_tick_cmpr
	fxors	%f2,	%f4,	%f18
	edge16ln	%l5,	%o0,	%i4
	fnegs	%f8,	%f6
	fxor	%f24,	%f12,	%f10
	wrpr	%i1,	%l0,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%canrestore,	%i2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fmovsvc	%icc,	%f19,	%f15
	rd	%sys_tick_cmpr,	%g5
	fmul8x16al	%f28,	%f21,	%f12
	fcmpne32	%f12,	%f18,	%o7
	ble	%icc,	loop_750
	udiv	%i6,	0x13C6,	%l1
	rdhpr	%hintp,	%i3
	array8	%o2,	%g6,	%o1
loop_750:
	wrpr	%i7,	0x1E62,	%pil
	wr 	%g0, 	0x4, 	%fprs
	wrpr	%g4,	%l2,	%pil
	set	0x0A, %g4
	stba	%l6,	[%l7 + %g4] 0x11
	wr	%g0,	0x80,	%asi
	ldsba	[%l7 + 0x51] %asi,	%o3
	taddcc	%o6,	%g2,	%o4
	subccc	%o5,	%g3,	%l3
	rd	%fprs,	%l5
	bgu,a,pt	%icc,	loop_751
	rdhpr	%hintp,	%i4
	subc	%o0,	0x13B7,	%l0
	rd	%tick_cmpr,	%i1
loop_751:
	rdhpr	%htba,	%g1
	set	0x54, %i3
	lda	[%l7 + %i3] 0x14,	%f16
	fabsd	%f28,	%f30
	wr	%i2,	0x144B,	%y
	tgu	%icc,	0x1
	orncc	%g7,	0x0809,	%g5
	wr	%o7,	0x03FD,	%ccr
	addc	%l4,	0x1428,	%i6
	wrpr	%l1,	%i3,	%cwp
	fble,a	%fcc2,	loop_752
	tcc	%xcc,	0x5
	wrpr	%o2,	%g6,	%cwp
	xnor	%i7,	0x1CC3,	%i0
loop_752:
	movg	%xcc,	%i5,	%g4
	wrpr	%o1,	0x1990,	%cwp
	tneg	%icc,	0x6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x549, 	%hsys_tick_cmpr
	fsrc2s	%f7,	%f9
	movg	%icc,	%l2,	%o6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tgu	%xcc,	0x4
	wrpr	%o4,	0x0489,	%pil
	fpack32	%f12,	%f14,	%f30

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%cansave,	%g3
	wr	%g2,	0x1ECC,	%set_softint

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%o0,	%l0,	%pil
	fcmpgt32	%f12,	%f4,	%l5
	call	loop_753
	fbul,a	%fcc3,	loop_754
	fmul8sux16	%f8,	%f8,	%f30

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xC50, 	%hsys_tick_cmpr
loop_753:
	tvs	%icc,	0x7
loop_754:
	ld	[%l7 + 0x18],	%f3
	fmovs	%f17,	%f12
	sll	%i2,	%g1,	%g7
	rdpr	%wstate,	%g5
	rdpr	%cansave,	%o7
	sub	%l4,	0x13AC,	%l1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x689, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	nop
	set	0x78, %o5
	stw	%g6,	[%l7 + %o5]
	fbug,a	%fcc0,	loop_755
	rd	%asi,	%i3
	rdhpr	%hsys_tick_cmpr,	%i7
	lduh	[%l7 + 0x3E],	%i5
loop_755:
	rdpr	%cleanwin,	%i0
	movne	%xcc,	%g4,	%l6
	set	0x60, %l6
	ldda	[%l7 + %l6] 0x04,	%o2
	wrpr	%l2,	0x1E1B,	%cwp
	wr	%o6,	0x0532,	%clear_softint
	tvc	%icc,	0x1
	wrpr	%o4,	0x0E42,	%cwp
	set	0x58, %i0
	lda	[%l7 + %i0] 0x18,	%f25
	wr	%o1,	0x12F3,	%ccr
	rdhpr	%hintp,	%g3
	xor	%g2,	%o5,	%i4
	movl	%xcc,	%o0,	%l0
	wr	%g0,	0x10,	%asi
	lduha	[%l7 + 0x3C] %asi,	%l3
	nop
	set	0x6E, %i5
	stb	%l5,	[%l7 + %i5]
	sdivx	%i1,	0x0669,	%g1
	rd	%ccr,	%g7
	andcc	%g5,	%i2,	%l4
	rd	%ccr,	%l1
	brgz	%i6,	loop_756
	fmovdvs	%xcc,	%f3,	%f22
	rd	%sys_tick_cmpr,	%o2
	bneg,pt	%icc,	loop_757
loop_756:
	smul	%o7,	0x167D,	%g6
	wr	%g0,	0x10,	%asi
	lduba	[%l7 + 0x74] %asi,	%i7
loop_757:
	rdhpr	%htba,	%i5
	fcmple32	%f16,	%f26,	%i3
	prefetch	[%l7 + 0x78],	 0x0
	movvc	%icc,	%g4,	%i0
	fsrc1	%f16,	%f8
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	rd	%asi,	%o3
	movrgz	%l2,	0x3C0,	%l6
	rd	%softint,	%o6
	wr 	%g0, 	0x7, 	%fprs
	udiv	%o4,	0x0FD8,	%g2
	rd	%pc,	%o5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xB21, 	%hsys_tick_cmpr
	fnot2s	%f12,	%f23
	move	%xcc,	%o0,	%l0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x1FB, 	%hsys_tick_cmpr
	rdhpr	%hsys_tick_cmpr,	%i1
	rd	%fprs,	%i4
	fornot1s	%f29,	%f10,	%f26
	rd	%tick_cmpr,	%g1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x8B7, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x261, 	%hsys_tick_cmpr
	wrpr	%i6,	0x0AEE,	%tick
	rdpr	%pil,	%o2
	wr	%g0,	0xe3,	%asi
	stba	%o7,	[%l7 + 0x20] %asi
	membar	#Sync
	tge	%icc,	0x5
	add	%l7,	0x18,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%g5
	casxa	[%l6] 0x89,	%g5,	%i7
	sdivcc	%g6,	0x1A6C,	%i5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%tick_cmpr,	%i3
	wrpr	%o3,	0x1219,	%tick
	rdpr	%otherwin,	%l2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x556, 	%tick_cmpr
	rdhpr	%htba,	%o6
	fsrc2	%f18,	%f12
	addcc	%o1,	%o4,	%l6
	subcc	%g2,	%g3,	%o0
	sdiv	%l0,	0x13CC,	%l3
	rdhpr	%hsys_tick_cmpr,	%l5
	fxnors	%f1,	%f13,	%f15
	rdhpr	%htba,	%i1
	wr 	%g0, 	0x5, 	%fprs
	rdhpr	%hintp,	%g1
	addc	%i4,	0x11B7,	%i2
	rdpr	%tl,	%l4
	wr	%l1,	%i6,	%y

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x3CC, 	%hsys_tick_cmpr
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	rd	%asi,	%o2
	fbu,a	%fcc0,	loop_758
	rdhpr	%hpstate,	%i7
	wr	%g6,	0x09EE,	%clear_softint
	rd	%y,	%i5
loop_758:
	rd	%pc,	%g5
	wrpr	%i3,	0x054B,	%tick
	addcc	%g4,	0x0253,	%o3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x602, 	%hsys_tick_cmpr
	wr	%l2,	%o1,	%sys_tick
	rdhpr	%htba,	%l6
	fabsd	%f26,	%f16
	wrpr	%o4,	%g3,	%tick
	fmovrdgez	%o0,	%f12,	%f20
	movrgz	%l0,	%g2,	%l3
	andcc	%i1,	0x1202,	%o5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x0B7, 	%hsys_tick_cmpr
	bvc,a,pn	%icc,	loop_759
	rd	%ccr,	%i4
	or	%i2,	%g1,	%l1
	rd	%sys_tick_cmpr,	%i6
loop_759:
	wrpr	%l4,	%o7,	%pil
	srl	%g7,	%o2,	%i7
	fnands	%f24,	%f24,	%f15
	nop
	set	0x48, %g2
	sth	%g6,	[%l7 + %g2]
	movrlz	%g5,	%i3,	%g4
	rdhpr	%hsys_tick_cmpr,	%o3
	fornot2	%f14,	%f22,	%f26

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x829, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xD4F, 	%hsys_tick_cmpr
	edge8n	%l2,	%o4,	%g3
	wr	%l6,	0x08B4,	%y
	wrpr	%o0,	%g2,	%tick
	subccc	%l3,	%l0,	%i1
	subc	%o5,	%i4,	%i2
	wrpr	%g1,	%l1,	%tick
	wrpr	%l5,	%i6,	%tick
	sdivcc	%l4,	0x140C,	%o7
	fmovsl	%icc,	%f15,	%f15
	wrpr	%o2,	%g7,	%cwp
	tvc	%icc,	0x2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%tl,	%i7
	fpsub32s	%f8,	%f9,	%f27
	fmovdcc	%icc,	%f13,	%f12
	rd	%asi,	%i3
	addcc	%g4,	%o3,	%g5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xD41, 	%hsys_tick_cmpr
	movcs	%xcc,	%o1,	%i5
	wrpr	%o4,	0x0913,	%cwp
	rd	%fprs,	%l2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%ccr,	%g2
	rdpr	%wstate,	%l6
	rd	%tick_cmpr,	%l0
	fbuge	%fcc0,	loop_760
	tvs	%xcc,	0x1
	tneg	%xcc,	0x5
	wr	%i1,	%l3,	%softint
loop_760:
        wr    %g0,    0xe,    %pcr    ! changed.
	rdpr	%tl,	%i2
	move	%xcc,	%g1,	%l1
	fmovsge	%icc,	%f24,	%f21
	wrpr	%i4,	%i6,	%cwp
	fbule	%fcc0,	loop_761
	edge32	%l5,	%o7,	%o2
	rdhpr	%hpstate,	%l4
	alignaddr	%g7,	%g6,	%i7
loop_761:
	rdhpr	%htba,	%i3
	add	%l7,	0x30,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%g4
	casa	[%l6] 0x80,	%g4,	%o3
	xnor	%i0,	%g5,	%o6
	tcc	%xcc,	0x2
	sra	%o1,	%i5,	%l2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x1F3, 	%hsys_tick_cmpr
	movg	%xcc,	%o0,	%g2
	rd	%asi,	%l6
	wr	%i1,	0x1236,	%clear_softint
	rdpr	%wstate,	%l0
	tg	%xcc,	0x7
	ba,a	loop_762
	rd	%pc,	%l3
	rdhpr	%hintp,	%i2
	rdhpr	%hpstate,	%g1
loop_762:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xF01, 	%tick_cmpr
	rd	%softint,	%l1
	edge32n	%i4,	%i6,	%o7
	wr	%l5,	0x0E20,	%clear_softint
	wrpr	%l4,	0x1DD7,	%cwp
	fexpand	%f27,	%f2
	wr	%o2,	0x1588,	%set_softint
	movvc	%xcc,	%g6,	%g7
	wrpr	%i7,	%g4,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x257, 	%hsys_tick_cmpr
	rd	%y,	%i3
	movpos	%icc,	%g5,	%o1
	rd	%softint,	%i5
	movrlez	%o6,	0x2F2,	%l2
	rdpr	%gl,	%o4
	rdhpr	%hpstate,	%o0
	wr 	%g0, 	0x7, 	%fprs
	array32	%i1,	%l6,	%l0
	array8	%l3,	%i2,	%o5
	rd	%fprs,	%l1
	wrpr	%i4,	0x12FD,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%hpstate,	%l5
	rdpr	%canrestore,	%o7
	fcmpeq16	%f24,	%f24,	%o2
	wrpr	%g6,	0x0D53,	%tick
	rdhpr	%htba,	%g7
	rdhpr	%htba,	%l4
	andn	%i7,	0x013E,	%g4
	rdpr	%tba,	%i0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%softint,	%g5
	movvc	%icc,	%i3,	%o1
	brz	%i5,	loop_763
	rdhpr	%hsys_tick_cmpr,	%o6
	rd	%tick_cmpr,	%l2
	xnor	%o0,	0x0427,	%o4
loop_763:
	brlz,a	%g3,	loop_764
	fcmple16	%f2,	%f30,	%i1
	wrpr	%g2,	0x10EC,	%pil
	rd	%pc,	%l6
loop_764:
	rd	%asi,	%l0
	rd	%fprs,	%i2
	wrpr	%l3,	%l1,	%pil
	rd	%softint,	%i4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%hpstate,	%l5
	fmuld8sux16	%f16,	%f6,	%f22
	ldd	[%l7 + 0x60],	%o4
	wrpr	%o2,	%g6,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%i7,	%g7,	%pil
	ldd	[%l7 + 0x18],	%i0
	rdpr	%gl,	%o3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%softint,	%g4
	fand	%f26,	%f14,	%f14
	tsubcc	%i5,	%o6,	%o1
	rdhpr	%htba,	%o0
	rd	%sys_tick_cmpr,	%o4
	rdhpr	%hpstate,	%l2
	tleu	%icc,	0x6
	fpadd16s	%f8,	%f5,	%f13
	tvc	%xcc,	0x0
	edge8ln	%i1,	%g2,	%g3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xD3B, 	%hsys_tick_cmpr
	rd	%sys_tick_cmpr,	%l3
	bn,pt	%icc,	loop_765
	wr	%l6,	0x0C6B,	%pic

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x666, 	%hsys_tick_cmpr
	orncc	%i4,	%g1,	%l5
loop_765:
	rd	%tick_cmpr,	%o5
	movn	%xcc,	%o2,	%i6
	addccc	%g6,	0x1E6F,	%o7
	rdpr	%tl,	%i7
	sdivx	%g7,	0x1C97,	%i0
	rdpr	%canrestore,	%o3
	fpadd16s	%f31,	%f30,	%f31
	rdhpr	%hintp,	%g5
	wrpr	%l4,	%g4,	%tick
	nop
	setx	loop_766,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	wr	%i3,	0x0DA0,	%softint

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	bneg	loop_767
loop_766:
	wrpr	%o1,	0x0020,	%cwp
	rd	%pc,	%o0
	rdpr	%pil,	%o4
loop_767:
	rdpr	%cansave,	%l2
	wr	%i1,	%g2,	%pic
	for	%f26,	%f24,	%f30
	movrgez	%o6,	0x3C3,	%l0
	wrpr	%i2,	%g3,	%tick
	wr	%l3,	%l1,	%y
	rdhpr	%hpstate,	%i4
	wrpr	%l6,	%g1,	%cwp
	wrpr	%o5,	0x163A,	%tick
	wr	%o2,	%l5,	%clear_softint
	fcmped	%fcc2,	%f2,	%f28
	fabsd	%f26,	%f10
	mulx	%g6,	%i6,	%o7
	wrpr	%g7,	0x06E6,	%pil
	fnor	%f8,	%f2,	%f0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xB72, 	%tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	fbge	%fcc3,	loop_768
	brlez,a	%l4,	loop_769
	rd	%y,	%i3
	wr 	%g0, 	0x6, 	%fprs
loop_768:
	udivcc	%o0,	0x1D90,	%o1
loop_769:
	fcmpgt16	%f4,	%f20,	%l2
	rdhpr	%hsys_tick_cmpr,	%o4
	fmovdgu	%xcc,	%f17,	%f18
	fones	%f30
	wr	%g2,	0x1402,	%clear_softint

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x1CE, 	%hsys_tick_cmpr
	edge16n	%i1,	%l0,	%g3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x4A6, 	%hsys_tick_cmpr
	rdpr	%cleanwin,	%l1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x6FB, 	%hsys_tick_cmpr
	fpack32	%f28,	%f24,	%f10
	rdpr	%wstate,	%o5
	wr	%o2,	0x025C,	%clear_softint

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	tn	%icc,	0x7
	movvc	%icc,	%i6,	%g6
	fmovdcc	%xcc,	%f5,	%f21
	edge8ln	%o7,	%g7,	%o3
	rdpr	%pil,	%g5
	rdhpr	%hpstate,	%i0
	wrpr	%l4,	0x05D2,	%tick
	wr	%i3,	%i5,	%y
	wr	%g4,	%o0,	%y
	rdhpr	%hpstate,	%i7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%cwp,	%o4
	wrpr	%g2,	0x1A85,	%tick
	orcc	%o6,	0x1AD2,	%o1
	fexpand	%f31,	%f4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x5A9, 	%hsys_tick_cmpr
	wr	%g3,	%l3,	%y
	rdhpr	%hsys_tick_cmpr,	%i2
	movvc	%xcc,	%l6,	%l1
	fmovdle	%xcc,	%f26,	%f31
	rdhpr	%htba,	%i4
	andcc	%o5,	%o2,	%l5
	wrpr	%i6,	0x1C9F,	%tick
	brgz	%g1,	loop_770
	rdpr	%canrestore,	%o7
	wrpr	%g6,	0x0D28,	%cwp
	fmovdvs	%icc,	%f7,	%f5
loop_770:
	edge16l	%g7,	%g5,	%o3
	wr	%i0,	0x1158,	%sys_tick
	srlx	%l4,	0x11,	%i3
	sdiv	%g4,	0x09D4,	%o0
	wr	%g0,	0x18,	%asi
	sta	%f21,	[%l7 + 0x30] %asi
	rdhpr	%hpstate,	%i7
	sll	%i5,	0x0A,	%l2
	move	%xcc,	%o4,	%o6
	wr	%g2,	0x1AF1,	%ccr
	wrpr	%i1,	%o1,	%tick
	fbu,a	%fcc3,	loop_771
	wr	%l0,	%l3,	%set_softint
	movge	%xcc,	%i2,	%l6
	wr	%g3,	0x0216,	%ccr
loop_771:
	tg	%xcc,	0x6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%sys_tick_cmpr,	%o2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x882, 	%hsys_tick_cmpr
	fmovsgu	%xcc,	%f20,	%f17
	fmovdcc	%xcc,	%f19,	%f0
	fmovrdgz	%i6,	%f26,	%f26
	wr	%l1,	%g1,	%softint
	fnand	%f8,	%f22,	%f8
	rd	%softint,	%o7
	fmovrde	%g7,	%f0,	%f20
	set	0x24, %g6
	lda	[%l7 + %g6] 0x04,	%f1
	rd	%ccr,	%g5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x336, 	%hsys_tick_cmpr
	rdpr	%pil,	%i0
	wrpr	%l4,	%g4,	%cwp
	wr	%o0,	0x0EAC,	%softint
	te	%icc,	0x3
	srl	%i7,	0x12,	%i5
	alignaddrl	%i3,	%o4,	%l2
	rdhpr	%hpstate,	%g2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xA8C, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%wstate,	%l0
	rd	%asi,	%l3
	fnor	%f26,	%f6,	%f8
	rd	%pc,	%i2
	wrpr	%o1,	%l6,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x48B, 	%hsys_tick_cmpr
	rd	%sys_tick_cmpr,	%g3
	rdhpr	%htba,	%o5
	rdpr	%cansave,	%l5
	rdhpr	%hintp,	%o2
	rdpr	%gl,	%l1
	rd	%y,	%g1
	fmovsl	%xcc,	%f20,	%f15
	fxnors	%f29,	%f21,	%f7
	movrgez	%o7,	0x3E9,	%g7
	fbul	%fcc1,	loop_772
	prefetch	[%l7 + 0x08],	 0x2
	wrpr	%g5,	%o3,	%tick
	fbl,a	%fcc3,	loop_773
loop_772:
	bg,a	loop_774
	rdpr	%wstate,	%i6
	brlez	%i0,	loop_775
loop_773:
	rdhpr	%hpstate,	%g6
loop_774:
	wrpr	%l4,	%o0,	%tick
	wrpr	%i7,	0x0E1D,	%pil
loop_775:
	edge8l	%i5,	%g4,	%i3
	fxor	%f22,	%f28,	%f4
	rdpr	%otherwin,	%l2
	rd	%pc,	%o4
	udivcc	%o6,	0x04DC,	%g2
	wr	%l0,	0x1164,	%y
	wrpr	%i1,	0x1A78,	%cwp
	wr	%i2,	%l3,	%y
	rdpr	%gl,	%l6
	rdpr	%otherwin,	%o1
	fmovdl	%xcc,	%f29,	%f7
	bvc	%icc,	loop_776
	tneg	%xcc,	0x7
	sll	%i4,	0x00,	%g3
	wr	%g0,	0x80,	%asi
	sta	%f6,	[%l7 + 0x14] %asi
loop_776:
	rdpr	%gl,	%l5
	wrpr	%o5,	0x1528,	%pil
	fones	%f31
	srlx	%o2,	0x0D,	%l1
	wr	%g0,	0x2a,	%asi
	stha	%o7,	[%l7 + 0x58] %asi
	membar	#Sync
	edge8ln	%g1,	%g7,	%o3
	tn	%icc,	0x0
	rd	%y,	%i6
	fmovdcc	%xcc,	%f0,	%f0
	rd	%pc,	%i0
	rdpr	%tba,	%g5
	rd	%fprs,	%g6
	tl	%icc,	0x2
	tcs	%icc,	0x1
	bvs,a	loop_777
	rd	%y,	%l4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%htba,	%i7
loop_777:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xF31, 	%hsys_tick_cmpr
	std	%f18,	[%l7 + 0x18]
	movg	%xcc,	%l2,	%g4
	taddcc	%o4,	0x11AA,	%o6
	bn,pn	%icc,	loop_778
	tleu	%icc,	0x5
	tge	%icc,	0x2
	rd	%pc,	%l0
loop_778:
	fbu,a	%fcc2,	loop_779
	udiv	%g2,	0x1FC8,	%i2
	rdpr	%pil,	%i1
        wr    %g0,    0xe,    %pcr    ! changed.
loop_779:
	andncc	%l6,	%o1,	%g3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x175, 	%hsys_tick_cmpr
	rd	%asi,	%i4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%pil,	%o2
	fsrc1	%f24,	%f26
	rdhpr	%hpstate,	%l1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%o7,	%g7,	%set_softint
	wrpr	%g1,	0x0FD0,	%pil
	srax	%i6,	%i0,	%g5
	wrpr	%g6,	%l4,	%cwp
	add	%o0,	%i5,	%o3
	rdpr	%tl,	%i3
	rd	%asi,	%i7
	fmul8sux16	%f12,	%f16,	%f16
	fbu	%fcc2,	loop_780
	mulscc	%l2,	%o4,	%o6
	st	%f23,	[%l7 + 0x6C]
	wr	%g4,	0x0779,	%y
loop_780:
	rdpr	%otherwin,	%l0
	rdhpr	%hintp,	%i2
	wr	%i1,	%l3,	%y

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x98E, 	%hsys_tick_cmpr
	movne	%icc,	%g2,	%l5
	rd	%tick_cmpr,	%i4
	rd	%sys_tick_cmpr,	%o5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x8E7, 	%hsys_tick_cmpr
	rdpr	%cansave,	%l1
	movne	%xcc,	%o2,	%o7
	rdpr	%pil,	%g7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	movpos	%xcc,	%i6,	%i0
	rd	%asi,	%g5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fornot1s	%f4,	%f23,	%f21
	rdpr	%otherwin,	%o0
	rdhpr	%hpstate,	%i5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x26F, 	%hsys_tick_cmpr
	nop
	setx	loop_781,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	umul	%i7,	0x106F,	%o6
	rdpr	%pil,	%o4
	wr	%g4,	0x040D,	%clear_softint
loop_781:
        wr    %g0,    0xe,    %pcr    ! changed.

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	movgu	%xcc,	%l6,	%o1
	rd	%asi,	%l0
	rdpr	%otherwin,	%g2
	rdhpr	%hintp,	%l5
	fors	%f28,	%f29,	%f23
	tcc	%xcc,	0x4
	brlez	%o5,	loop_782
	rd	%fprs,	%g3
	rdpr	%cleanwin,	%l1
	fpsub16	%f6,	%f30,	%f10
loop_782:
	rd	%pc,	%o2
	fmovsne	%xcc,	%f17,	%f11
	rd	%ccr,	%o7
	ldd	[%l7 + 0x40],	%i4
	wr	%g7,	0x0967,	%y
	be,a,pn	%icc,	loop_783
	movrne	%i6,	0x398,	%g1
	fmuld8sux16	%f26,	%f13,	%f8
	rd	%fprs,	%g5
loop_783:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x842, 	%hsys_tick_cmpr
	fblg	%fcc1,	loop_784
	tl	%xcc,	0x1
	rdpr	%cwp,	%i5
	alignaddr	%g6,	%o0,	%i3
loop_784:
	rdpr	%canrestore,	%l2
	rdhpr	%htba,	%o3
	ldsh	[%l7 + 0x16],	%i7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	set	0x54, %o4
	stwa	%i2,	[%l7 + %o4] 0x2a
	membar	#Sync
	flush	%l7 + 0x24

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x816, 	%hsys_tick_cmpr
	te	%xcc,	0x6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x28F, 	%hsys_tick_cmpr
	wrpr	%g4,	0x0B44,	%cwp
	bg,pn	%icc,	loop_785
	fmovrdgez	%o1,	%f4,	%f0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x774, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
loop_785:
	mulscc	%o5,	%g2,	%l1
	wrpr	%o2,	0x1B72,	%pil
	wrpr	%o7,	0x078A,	%tick
	movg	%xcc,	%g3,	%g7
	rd	%sys_tick_cmpr,	%i4
	wr	%i6,	0x1E4E,	%set_softint
	rdpr	%canrestore,	%g5
	fbe	%fcc1,	loop_786
	alignaddrl	%i0,	%g1,	%i5
	brlez,a	%g6,	loop_787
	movrgz	%l4,	0x024,	%o0
loop_786:
	rd	%tick_cmpr,	%l2
	rdpr	%gl,	%i3
loop_787:
	fandnot1s	%f20,	%f5,	%f0
	edge32l	%o3,	%o6,	%i7
	fcmpeq32	%f0,	%f30,	%i2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%canrestore,	%l3
	wr	%g4,	%o4,	%clear_softint
!Yo - got one - imm_asi 0x50 
!And yo - immediate is 0x18
	set	0x18, %g1
	ldxa	[%g0 + %g1] 0x50,	%l6
	fmovspos	%icc,	%f11,	%f0
	rdpr	%cwp,	%l0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fsrc2s	%f3,	%f4
	fnot1s	%f17,	%f2
	wrpr	%g2,	%l1,	%tick
	rdhpr	%hpstate,	%o5
	rdpr	%tl,	%o7
	rdpr	%cwp,	%o2
	bl,pn	%icc,	loop_788
	subc	%g7,	%i4,	%g3
	sll	%g5,	%i0,	%g1
	xnor	%i5,	0x0B23,	%i6
loop_788:
	fones	%f26
	movle	%icc,	%g6,	%l4
	taddcc	%o0,	0x033C,	%i3
	rdpr	%otherwin,	%o3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	fnegd	%f22,	%f18
	mulx	%i2,	0x10BD,	%o6
	rdpr	%tba,	%l3
	bge,a	loop_789
	wr	%i1,	%g4,	%clear_softint
	wr 	%g0, 	0x7, 	%fprs

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
loop_789:
	rdhpr	%hintp,	%l0
	fbo	%fcc1,	loop_790
	nop
	setx	loop_791,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	wr	%o1,	0x0FD7,	%set_softint
	rdhpr	%hsys_tick_cmpr,	%l5
loop_790:
	add	%l1,	%g2,	%o7
loop_791:
	rdpr	%cleanwin,	%o2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xE28, 	%hsys_tick_cmpr
	rd	%pc,	%o5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	wr	%g0,	0x18,	%asi
	swapa	[%l7 + 0x48] %asi,	%g3
	wrpr	%g5,	0x124A,	%cwp
	wr	%i0,	%g1,	%pic
	rdhpr	%hpstate,	%i5
	rdpr	%otherwin,	%g6
	ld	[%l7 + 0x48],	%f19
	wr 	%g0, 	0x6, 	%fprs
	rdpr	%wstate,	%o0
	wrpr	%i3,	0x0A1B,	%tick
	wr	%i6,	0x05C7,	%ccr
	movrne	%l2,	0x325,	%o3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bcc,a	%icc,	loop_792
	prefetch	[%l7 + 0x18],	 0x1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x625, 	%hsys_tick_cmpr
	rdpr	%gl,	%l3
loop_792:
	wr	%o6,	0x0476,	%y
	sub	%i1,	%o4,	%l6
	rdhpr	%hintp,	%g4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%hsys_tick_cmpr,	%l5
	fblg,a	%fcc2,	loop_793
	fabss	%f21,	%f20
	array8	%o1,	%g2,	%l1
	lduw	[%l7 + 0x2C],	%o7
loop_793:
	srlx	%o2,	0x1E,	%g7
	rd	%sys_tick_cmpr,	%o5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xA49, 	%hsys_tick_cmpr
	wr	%g0,	0xe3,	%asi
	ldda	[%l7 + 0x20] %asi,	%i4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fcmple16	%f12,	%f0,	%o0
	andncc	%i3,	%l4,	%i6
	array32	%l2,	%o3,	%i7
	rdpr	%cansave,	%i2
	rdpr	%cleanwin,	%l3
	fpadd16s	%f23,	%f20,	%f3
	subcc	%i1,	%o6,	%l6
	wr	%g4,	%o4,	%clear_softint
	std	%l4,	[%l7 + 0x50]
	rdpr	%otherwin,	%l0
	brgz	%g2,	loop_794
	movre	%l1,	%o7,	%o2
	stw	%g7,	[%l7 + 0x30]

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_794:
	wrpr	%g5,	%i0,	%tick
	bn,a	%xcc,	loop_795
	fpadd32	%f14,	%f20,	%f22
	edge16l	%g1,	%g3,	%i4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x538, 	%hsys_tick_cmpr
loop_795:
	wr	%o0,	%i5,	%sys_tick
	rdhpr	%hsys_tick_cmpr,	%i3
	rd	%ccr,	%i6
	rdpr	%gl,	%l4
	movn	%xcc,	%l2,	%i7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x6EE, 	%hsys_tick_cmpr
	fnor	%f2,	%f14,	%f2
	wrpr	%i1,	0x08C8,	%tick
	edge32l	%o6,	%i2,	%g4
	wrpr	%o4,	%l5,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	bl,a	loop_796
	wr	%l6,	%l1,	%clear_softint
	tl	%icc,	0x5
	orcc	%g2,	%o7,	%o2
loop_796:
	tn	%icc,	0x4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x899, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	movneg	%xcc,	%i0,	%g1
	wrpr	%g5,	%i4,	%cwp
	movre	%g6,	%o0,	%i5
	brgez	%i3,	loop_797
	wrpr	%i6,	0x0E2D,	%pil
	wr	%g3,	0x0356,	%clear_softint
	rdpr	%gl,	%l4
loop_797:
	wr	%l2,	0x0D6F,	%set_softint

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x247, 	%hsys_tick_cmpr
	rd	%y,	%o3
	fnot2	%f18,	%f22
	wrpr	%l3,	0x1102,	%tick
	xorcc	%i1,	0x10A9,	%o6
	umul	%i2,	0x0863,	%o4
	membar	0x2B
	fbn,a	%fcc1,	loop_798
	edge16n	%l5,	%g4,	%l6
	ba,pn	%icc,	loop_799
	rdpr	%gl,	%l1
loop_798:
	wr	%g2,	%l0,	%set_softint
	rdhpr	%hintp,	%o7
loop_799:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xA4E, 	%hsys_tick_cmpr
	rdpr	%gl,	%g7
	rdhpr	%htba,	%o1
	wr	%o5,	%g1,	%pic
	rdpr	%cleanwin,	%i0
	fbge	%fcc0,	loop_800
	xnorcc	%i4,	0x152E,	%g5
	smulcc	%g6,	%i5,	%o0
	fmovda	%icc,	%f0,	%f15
loop_800:
	wr	%i6,	%g3,	%softint
	rd	%ccr,	%l4
	movrne	%l2,	0x32B,	%i7
	rdhpr	%hsys_tick_cmpr,	%o3
	tl	%icc,	0x7
	rd	%y,	%i3
	rdhpr	%hintp,	%l3
	array8	%o6,	%i2,	%o4
	rdhpr	%hpstate,	%l5
	rd	%pc,	%g4
	rdhpr	%hpstate,	%i1
	wr	%l1,	0x08D5,	%set_softint
	mova	%xcc,	%g2,	%l6
	rd	%ccr,	%o7
	fbue	%fcc0,	loop_801
	wrpr	%o2,	%l0,	%tick
	addcc	%o1,	%g7,	%o5
	rdhpr	%htba,	%g1
loop_801:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%wstate,	%g6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xAAF, 	%hsys_tick_cmpr
	bn	loop_802
	rdpr	%canrestore,	%o0
	rd	%tick_cmpr,	%i5
	rdhpr	%htba,	%g3
loop_802:
	rdhpr	%htba,	%l4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x3A5, 	%hsys_tick_cmpr
	rd	%tick_cmpr,	%o3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xCE2, 	%hsys_tick_cmpr
	wr	%i7,	%o6,	%ccr
	set	0x40, %l4
	stda	%f16,	[%l7 + %l4] 0x81
	fmovsleu	%xcc,	%f19,	%f29
	stbar
	wr	%i2,	0x01E7,	%pic
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	smul	%o4,	%l5,	%g4
	wr	%g0,	0x0c,	%asi
	ldstuba	[%l7 + 0x5C] %asi,	%l1
	udiv	%i1,	0x0C3D,	%g2
	fmovdne	%xcc,	%f28,	%f20
	bvc	%icc,	loop_803
	wrpr	%o7,	%o2,	%cwp
	andn	%l0,	0x1BF4,	%o1
	movcc	%icc,	%l6,	%g7
loop_803:
	nop
	wr	%g0,	0x80,	%asi
	lduha	[%l7 + 0x44] %asi,	%o5
	rd	%ccr,	%i0
	srl	%g1,	%g6,	%i4
	rdpr	%otherwin,	%g5
	wrpr	%o0,	%g3,	%pil
	rd	%asi,	%i5
	fbl,a	%fcc0,	loop_804
	rdpr	%cleanwin,	%l4
	udiv	%i6,	0x149A,	%l2
	membar	0x42
loop_804:
	smul	%i3,	%o3,	%l3
	fpadd16	%f2,	%f0,	%f2
	tcs	%icc,	0x7
	edge16n	%i7,	%i2,	%o4
	srax	%l5,	%g4,	%o6
	rd	%ccr,	%i1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xE60, 	%hsys_tick_cmpr
	fmovdn	%icc,	%f5,	%f2
	edge16ln	%l1,	%o2,	%l0
	rdpr	%cleanwin,	%o1
	fbul	%fcc0,	loop_805
	wr	%l6,	%g7,	%pic
	call	loop_806
	alignaddrl	%o5,	%i0,	%g1
loop_805:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	set	0x78, %l5
	sta	%f8,	[%l7 + %l5] 0x18
loop_806:
	wrpr	%g5,	%g6,	%pil
	rd	%sys_tick_cmpr,	%g3
	xnor	%i5,	0x0141,	%o0
	rdhpr	%hpstate,	%l4
	std	%i6,	[%l7 + 0x30]
	bl,a,pn	%icc,	loop_807
	brlz,a	%l2,	loop_808
	mulx	%i3,	%l3,	%i7
	rdhpr	%hsys_tick_cmpr,	%o3
loop_807:
	rdpr	%cwp,	%o4
loop_808:
	rd	%ccr,	%i2
	rdhpr	%hintp,	%g4
	ta	%icc,	0x0
	wrpr	%o6,	%i1,	%pil
	srax	%l5,	0x10,	%g2
	wr	%l1,	0x14D1,	%softint
	movneg	%xcc,	%o2,	%o1
	wr	%l6,	0x1578,	%ccr
	add	%g7,	%o5,	%l0
	wrpr	%g1,	0x180E,	%pil
	movneg	%xcc,	%i0,	%i4
	rdhpr	%hpstate,	%o7
	umul	%g5,	0x0DE0,	%g6
	wr 	%g0, 	0x4, 	%fprs

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	xor	%l4,	%o0,	%l2
	rdpr	%canrestore,	%i3
        wr    %g0,    0xe,    %pcr    ! changed.
	fmovs	%f28,	%f27
	rdhpr	%hpstate,	%o3
	rdhpr	%hpstate,	%o4
	fandnot2	%f18,	%f4,	%f24
	rdpr	%cansave,	%i7
	subccc	%g4,	%o6,	%i1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%l1,	%g2,	%set_softint
	wrpr	%o2,	%l6,	%tick
	wrpr	%g7,	0x0272,	%tick
	ldx	[%l7 + 0x48],	%o1
	wr	%o5,	%g1,	%pic
	rdhpr	%hintp,	%i0
	movg	%icc,	%i4,	%l0
	wrpr	%g5,	%o7,	%pil
        wr    %g0,    0xe,    %pcr    ! changed.
	and	%g6,	%l4,	%o0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x38E, 	%hsys_tick_cmpr
	wrpr	%i5,	%i6,	%cwp
	andncc	%l3,	%o3,	%i3
	rdhpr	%hsys_tick_cmpr,	%i7
	wr	%g4,	%o6,	%set_softint
	mulscc	%o4,	0x1756,	%l5
	rdhpr	%hpstate,	%i2
	rd	%sys_tick_cmpr,	%i1
	fbu	%fcc3,	loop_809
	fmovrslz	%l1,	%f2,	%f8
	rdpr	%otherwin,	%g2
	wr 	%g0, 	0x7, 	%fprs
loop_809:
	tgu	%icc,	0x1
	stw	%l6,	[%l7 + 0x7C]

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x63F, 	%sys_tick_cmpr
	rd	%softint,	%g7
	rd	%asi,	%o5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	movrlz	%i0,	0x361,	%i4
	mulx	%l0,	0x0408,	%g5
	xorcc	%o7,	%g6,	%g3
	rdhpr	%hsys_tick_cmpr,	%l4
	rd	%tick_cmpr,	%l2
	rdhpr	%htba,	%o0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%o3,	0x0E65,	%tick
	fbn,a	%fcc3,	loop_810
	lduh	[%l7 + 0x48],	%i6
	smul	%i3,	%i7,	%g4
	rd	%tick_cmpr,	%o4
loop_810:
	nop
	set	0x50, %o0
	stwa	%l5,	[%l7 + %o0] 0x2f
	membar	#Sync
	wrpr	%i2,	0x03E9,	%tick
	xnor	%o6,	%i1,	%l1
	nop
	set	0x48, %i2
	ldsw	[%l7 + %i2],	%g2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%hpstate,	%o2
	rdhpr	%hpstate,	%g7
	ld	[%l7 + 0x1C],	%f10
	lduh	[%l7 + 0x68],	%o1
	andncc	%g1,	%o5,	%i4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	subccc	%g5,	%o7,	%g6
	fbg,a	%fcc1,	loop_811
        wr    %g0,    0xe,    %pcr    ! changed.
        wr    %g0,    0xe,    %pcr    ! changed.
	rdpr	%tba,	%l4
loop_811:
	rdpr	%cleanwin,	%o0
	rdhpr	%htba,	%l2
	rdpr	%wstate,	%i5
	rd	%y,	%l3
	move	%xcc,	%i6,	%i3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%htba,	%o4
	nop
	setx	loop_812,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	wr 	%g0, 	0x6, 	%fprs
	call	loop_813
	fnot1	%f28,	%f10
loop_812:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xD6B, 	%hsys_tick_cmpr
	movvc	%xcc,	%i1,	%l1
loop_813:
	rd	%softint,	%o6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%htba,	%g2
	rdhpr	%hsys_tick_cmpr,	%g7
	rdpr	%tba,	%g1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xA80, 	%tick_cmpr
	rdpr	%wstate,	%o1
	wrpr	%i4,	0x13BC,	%cwp
        wr    %g0,    0xe,    %pcr    ! changed.
	tl	%icc,	0x5
	rdpr	%cwp,	%o7
	wr	%g3,	0x1F69,	%y
	subccc	%l0,	%g6,	%o0
	wr	%l2,	0x0BAA,	%clear_softint
	fcmpne16	%f12,	%f12,	%l4
	wrpr	%l3,	0x14EF,	%pil
	edge8	%i5,	%i6,	%i7
	brgz	%o3,	loop_814
	wr	%o4,	%g4,	%sys_tick
	wrpr	%i3,	%i2,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_814:
        wr    %g0,    0xe,    %pcr    ! changed.
	rdhpr	%hintp,	%i1
	rdpr	%cwp,	%o2
	movrlz	%l6,	%g7,	%g2
	wrpr	%g1,	%o5,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	pdist	%f14,	%f30,	%f28
	ldx	[%l7 + 0x10],	%g5
	movrlez	%i0,	0x3E1,	%o7
	fcmped	%fcc1,	%f12,	%f2
	rdpr	%tba,	%i4
	wrpr	%g3,	0x179C,	%pil
	set	0x20, %i6
	ldda	[%l7 + %i6] 0x2e,	%l0
	andn	%g6,	%o0,	%l2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	rdpr	%tl,	%l3
	array16	%i6,	%i5,	%o3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x810, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	array8	%i2,	%g4,	%l5
	rdpr	%cansave,	%l1
	rdhpr	%hintp,	%o6
	wr	%o2,	%l6,	%clear_softint

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x7FF, 	%hsys_tick_cmpr
	rd	%y,	%g1
	fnand	%f0,	%f14,	%f18
	wr	%o5,	%o1,	%set_softint

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	rdhpr	%hintp,	%i4
	alignaddrl	%i0,	%l0,	%g6
	edge16	%o0,	%l2,	%g3
	rdhpr	%hpstate,	%l4
	wrpr	%l3,	%i6,	%cwp
	wr	%o3,	0x0108,	%sys_tick
	udivx	%i5,	0x00C1,	%o4
	fmovrslz	%i3,	%f20,	%f28
	fmovd	%f18,	%f18
	stbar
	fmovsle	%icc,	%f14,	%f30
	orcc	%i7,	0x0973,	%g4
	wrpr	%i2,	0x09BF,	%cwp
	wr	%l5,	%l1,	%clear_softint
	wr	%o2,	0x18B3,	%ccr
	rd	%softint,	%o6
	fpsub16s	%f24,	%f2,	%f25

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xEFF, 	%hsys_tick_cmpr
	rdhpr	%hintp,	%g2
	tpos	%icc,	0x6
	fcmpgt32	%f20,	%f14,	%i1
	subccc	%o5,	%g1,	%g5
	rd	%ccr,	%o1
	bn,a,pt	%icc,	loop_815
	rd	%fprs,	%i4
!Yo - got one - imm_asi 0x52 
!And yo - immediate is 0x108
	wr	%g0,	0x52,	%asi
	stxa	%i0,	[%g0 + 0x108] %asi
loop_815:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%o0,	%l2,	%cwp
	edge32l	%g3,	%g6,	%l4
	tn	%xcc,	0x7
	rdhpr	%hpstate,	%l3
	alignaddr	%o3,	%i6,	%o4
	sdiv	%i5,	0x0DFB,	%i3
	wr	%g0,	0x81,	%asi
	ldswa	[%l7 + 0x2C] %asi,	%g4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	brlz	%l5,	loop_816
	rdpr	%cwp,	%i7
	fcmpgt16	%f24,	%f26,	%l1
	wrpr	%o6,	0x038A,	%tick
loop_816:
	bleu,a,pt	%xcc,	loop_817
	rd	%sys_tick_cmpr,	%l6
	rdpr	%cwp,	%g7
	rdpr	%gl,	%g2
loop_817:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x7C9, 	%sys_tick_cmpr
	fble,a	%fcc3,	loop_818
	rd	%fprs,	%o2
	rd	%ccr,	%g5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
loop_818:
	or	%g1,	%i4,	%i0
	rd	%fprs,	%o7
	ba,a,pn	%xcc,	loop_819
	wrpr	%l0,	%o0,	%tick
	wrpr	%l2,	%g3,	%pil
	tpos	%xcc,	0x3
loop_819:
	edge32n	%g6,	%l4,	%l3
	rd	%softint,	%o3
	rdhpr	%hpstate,	%o4
	rdhpr	%hsys_tick_cmpr,	%i6
	sra	%i3,	0x02,	%g4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	subc	%l5,	0x0041,	%i7
	swap	[%l7 + 0x54],	%o6
	wrpr	%l6,	0x057E,	%tick
	wrpr	%l1,	%g7,	%cwp
	rdpr	%gl,	%i1
	wrpr	%g2,	0x1CBD,	%pil
	fand	%f4,	%f20,	%f22
	rd	%sys_tick_cmpr,	%o5
	rd	%asi,	%o2
	tg	%xcc,	0x7
	movpos	%icc,	%o1,	%g1
	rd	%sys_tick_cmpr,	%i4
	rdhpr	%hsys_tick_cmpr,	%i0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xEB7, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr 	%g0, 	0x5, 	%fprs
	rdhpr	%hpstate,	%g6
	tneg	%xcc,	0x3
	faligndata	%f20,	%f0,	%f22
	tl	%icc,	0x3
	movl	%xcc,	%l4,	%g3
	movge	%icc,	%l3,	%o3
	wrpr	%o4,	%i3,	%tick
	add	%i6,	0x035D,	%g4
	sll	%i2,	0x1B,	%i5
	stbar
	movg	%xcc,	%l5,	%i7
	rdpr	%tl,	%l6
	rd	%sys_tick_cmpr,	%o6
	fcmpes	%fcc2,	%f31,	%f14
	rd	%asi,	%l1
	orncc	%g7,	0x0246,	%g2
	movg	%xcc,	%i1,	%o2
	rdhpr	%htba,	%o5
	set	0x54, %l2
	stwa	%o1,	[%l7 + %l2] 0x27
	membar	#Sync
	wr	%g1,	%i0,	%clear_softint
	alignaddr	%o7,	%i4,	%o0
	rd	%pc,	%g5
	edge8	%l2,	%l0,	%l4
	rdpr	%wstate,	%g3
	orncc	%g6,	%o3,	%l3
	wr	%o4,	%i3,	%clear_softint
	rd	%softint,	%i6
	wr	%i2,	%g4,	%pic

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xC99, 	%hsys_tick_cmpr
	wrpr	%l6,	0x0790,	%pil
	wr	%l1,	0x1AF7,	%set_softint
	movneg	%icc,	%o6,	%g7
	mulscc	%g2,	0x1F78,	%o2
	rdpr	%cleanwin,	%i1
	wrpr	%o5,	0x1D6F,	%tick
	udivx	%g1,	0x0E7A,	%o1
	movrlz	%i0,	%i4,	%o7
	mulx	%o0,	0x17F9,	%l2
	wrpr	%g5,	0x1420,	%cwp
	fmovdgu	%icc,	%f4,	%f20
	edge8n	%l4,	%g3,	%g6
	wr	%l0,	%l3,	%set_softint
	edge32ln	%o4,	%o3,	%i3
	movleu	%xcc,	%i2,	%i6
	fbuge,a	%fcc2,	loop_820
	popc	0x1D04,	%g4
	wrpr	%i7,	%l5,	%cwp
	edge32	%l6,	%l1,	%o6
loop_820:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%hintp,	%g2
	rdpr	%cwp,	%i5
	rdpr	%cleanwin,	%o2
	fand	%f12,	%f4,	%f22
	bgu	%xcc,	loop_821
	wr	%o5,	%g1,	%y
	rd	%y,	%i1
	rd	%y,	%o1
loop_821:
	fbu,a	%fcc0,	loop_822
	rdhpr	%htba,	%i0
	smul	%i4,	0x0315,	%o7
	rdpr	%cleanwin,	%o0
loop_822:
	wrpr	%g5,	%l2,	%pil
	fzeros	%f11
	wr	%l4,	0x1B34,	%y
	fbug,a	%fcc2,	loop_823
	movleu	%icc,	%g6,	%l0
	rdpr	%wstate,	%g3
	fmovsleu	%xcc,	%f23,	%f13
loop_823:
	fone	%f8
	movn	%icc,	%l3,	%o4
	ldsb	[%l7 + 0x19],	%i3
	wr	%o3,	0x19E7,	%y
	rd	%tick_cmpr,	%i6
	wrpr	%g4,	0x14AB,	%pil
	rdpr	%cleanwin,	%i7
	edge8n	%i2,	%l5,	%l6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x7AD, 	%hsys_tick_cmpr
	ldsb	[%l7 + 0x28],	%g2
	wrpr	%i5,	0x067F,	%cwp
	wr	%g7,	0x0FD2,	%softint
	fone	%f8
	rdhpr	%hsys_tick_cmpr,	%o5
	sdiv	%o2,	0x10B7,	%g1
	tle	%icc,	0x3
	wrpr	%i1,	%i0,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	movgu	%xcc,	%o7,	%o1
	wr	%o0,	%l2,	%set_softint

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x895, 	%hsys_tick_cmpr
	sdivx	%l4,	0x14F8,	%l0
	movrlz	%g3,	%g6,	%o4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	tne	%xcc,	0x0
	fmovsleu	%icc,	%f19,	%f20
	movgu	%xcc,	%o3,	%i6
	wr	%g4,	0x0EEA,	%pic
	wr	%i7,	0x0940,	%clear_softint
	rdpr	%tl,	%i3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x0E3, 	%hsys_tick_cmpr
	sll	%l6,	%l1,	%o6
	rdpr	%tl,	%i5
	wrpr	%g7,	0x1432,	%cwp
	rd	%softint,	%g2
	fmul8sux16	%f18,	%f24,	%f26
	rdpr	%pil,	%o5
	fmovdl	%icc,	%f29,	%f4
	addccc	%g1,	%i1,	%o2
	rdhpr	%htba,	%i0
	udiv	%o7,	0x03D9,	%i4
	stx	%o0,	[%l7 + 0x48]

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xEA0, 	%sys_tick_cmpr
	rdpr	%cwp,	%l4
	wrpr	%g3,	0x07F9,	%cwp
	wrpr	%g6,	0x1E99,	%tick
	smul	%l0,	0x1947,	%l3
	rd	%y,	%o3
	te	%xcc,	0x3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x6C0, 	%hsys_tick_cmpr
	udivx	%g4,	0x0E68,	%i6
	taddcc	%i7,	%i3,	%l5
	move	%icc,	%l6,	%i2
	orncc	%o6,	0x0A33,	%i5
	bvc,a	loop_824
	fpadd32	%f0,	%f30,	%f12
	movrgz	%g7,	%l1,	%o5
	rdhpr	%htba,	%g2
loop_824:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x988, 	%sys_tick_cmpr
	rdpr	%cleanwin,	%i0
	sra	%o7,	%i4,	%o0
	membar	0x45
	bvs,pn	%xcc,	loop_825
	rd	%softint,	%l2
	wr	%o1,	%o2,	%set_softint
	ldd	[%l7 + 0x10],	%f4
loop_825:
	fcmpne16	%f0,	%f26,	%g5
	alignaddr	%l4,	%g6,	%g3
	tpos	%icc,	0x2
	rd	%sys_tick_cmpr,	%l0
	movneg	%icc,	%o3,	%l3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x37A, 	%hsys_tick_cmpr
	fbge	%fcc1,	loop_826
	rdhpr	%hintp,	%i7
	wr 	%g0, 	0x6, 	%fprs
	movg	%icc,	%g4,	%l5
loop_826:
	sub	%i2,	%o6,	%i5
	wr	%l6,	%g7,	%ccr
	wr	%o5,	%g2,	%clear_softint
	movn	%icc,	%l1,	%g1
	wr	%g0,	0x81,	%asi
	ldsba	[%l7 + 0x4B] %asi,	%i1
	fbule	%fcc1,	loop_827
	wr	%o7,	0x0C42,	%softint
	wr	%i0,	%i4,	%softint
	rdpr	%wstate,	%l2
loop_827:
	rdpr	%wstate,	%o0
	movvs	%icc,	%o1,	%g5
	rdhpr	%hintp,	%l4
	fpadd16	%f30,	%f4,	%f8

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%pil,	%g3
	rdhpr	%hsys_tick_cmpr,	%g6
	rdhpr	%hpstate,	%l0
	fnot1	%f2,	%f10
	movvc	%icc,	%l3,	%o4
	edge16l	%i6,	%o3,	%i3
	wrpr	%i7,	0x0631,	%cwp
	wrpr	%l5,	0x11EB,	%tick
	bg,a	%icc,	loop_828
	xnorcc	%g4,	%o6,	%i2
	fmovsleu	%icc,	%f24,	%f24
	rdhpr	%htba,	%l6
loop_828:
	bvs,a	%icc,	loop_829
	udivcc	%i5,	0x0937,	%o5
	andcc	%g2,	0x1923,	%l1
	fone	%f28
loop_829:
	fnot2s	%f30,	%f26
	wrpr	%g7,	0x1F78,	%pil
	rdhpr	%hintp,	%g1
	rdhpr	%hpstate,	%o7
	bl,a	%xcc,	loop_830
	rd	%sys_tick_cmpr,	%i0
	wrpr	%i1,	%i4,	%cwp
	call	loop_831
loop_830:
	rd	%pc,	%l2
	movleu	%icc,	%o1,	%o0
	be,pn	%icc,	loop_832
loop_831:
	edge32n	%l4,	%o2,	%g5
	rdpr	%otherwin,	%g3
	wrpr	%l0,	0x03FF,	%cwp
loop_832:
	rdpr	%pil,	%l3
	bpos,pt	%xcc,	loop_833
	rd	%fprs,	%g6
	wr	%o4,	%i6,	%ccr
	umul	%i3,	%o3,	%i7
loop_833:
	ldub	[%l7 + 0x31],	%g4
	rdhpr	%htba,	%o6
	fornot2	%f26,	%f6,	%f8
	rdhpr	%hpstate,	%i2
	wr	%g0,	0x11,	%asi
	ldxa	[%l7 + 0x60] %asi,	%l5
	fmovdcc	%icc,	%f5,	%f26
	movrne	%i5,	0x19B,	%l6
	rd	%y,	%g2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xFB8, 	%tick_cmpr
	srax	%l1,	0x11,	%o7
	sir	0x05B3
	or	%g1,	%i1,	%i0
	fabsd	%f6,	%f18
	rdpr	%otherwin,	%i4
	rdhpr	%htba,	%l2
	wr	%g0,	0x2a,	%asi
	stha	%o1,	[%l7 + 0x62] %asi
	membar	#Sync
	rd	%sys_tick_cmpr,	%l4
	rdpr	%canrestore,	%o2
	wrpr	%g5,	%g3,	%tick
	rdpr	%cleanwin,	%o0
	fmovsneg	%icc,	%f26,	%f21
	rdhpr	%hpstate,	%l3
	rdpr	%pil,	%l0
	tvs	%icc,	0x2
	sethi	0x1CFF,	%o4
	alignaddrl	%i6,	%i3,	%o3
	rdhpr	%hpstate,	%i7
	rdpr	%tba,	%g4
	edge32	%g6,	%o6,	%i2
	te	%xcc,	0x5
	ldd	[%l7 + 0x68],	%l4
	rd	%tick_cmpr,	%i5
	fmovrslez	%g2,	%f19,	%f26
	rdpr	%cansave,	%l6
	fmovdgu	%icc,	%f7,	%f10
	subccc	%o5,	0x1F4D,	%g7
	mova	%xcc,	%o7,	%l1
	rdpr	%tba,	%i1
	edge16ln	%i0,	%g1,	%l2
	edge32	%o1,	%i4,	%l4
	wrpr	%o2,	%g3,	%cwp
	std	%f0,	[%l7 + 0x10]
	wrpr	%o0,	0x1C58,	%tick
	wrpr	%g5,	0x0337,	%pil
	and	%l0,	0x0E4E,	%o4
	udivx	%i6,	0x0805,	%l3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	rdhpr	%hpstate,	%i3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%g0,	0x88,	%asi
	ldswa	[%l7 + 0x14] %asi,	%i7
	fbe,a	%fcc2,	loop_834
	rdpr	%gl,	%g6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xEA9, 	%hsys_tick_cmpr
	move	%icc,	%i2,	%l5
loop_834:
	wrpr	%i5,	%g4,	%tick
	orcc	%l6,	%o5,	%g2
	rdhpr	%hpstate,	%o7
	wrpr	%g7,	%i1,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%hintp,	%o1
	rdhpr	%hpstate,	%l4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xB1C, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%wstate,	%i4
	call	loop_835
	rd	%softint,	%g5
	rdhpr	%hpstate,	%o0
	rdpr	%canrestore,	%l0
loop_835:
	fornot2s	%f12,	%f5,	%f16
	wrpr	%i6,	0x08CC,	%tick
	fpsub16s	%f4,	%f5,	%f31
	umul	%l3,	0x0306,	%i3
	wrpr	%o4,	%i7,	%cwp
	fbn,a	%fcc2,	loop_836
	rdhpr	%hpstate,	%g6
	wrpr	%o6,	0x0B52,	%tick
	rdhpr	%hsys_tick_cmpr,	%o3
loop_836:
	nop
	setx loop_837, %l0, %l1
	jmpl %l1, %i2
	wr	%i5,	0x01F8,	%clear_softint
	fxor	%f14,	%f12,	%f26

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xCB9, 	%hsys_tick_cmpr
loop_837:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x7E1, 	%hsys_tick_cmpr
	wrpr	%g2,	0x0234,	%pil
	sub	%l5,	0x03F4,	%o7
	sdivx	%g7,	0x14A9,	%i1
	rd	%fprs,	%i0
	sll	%l1,	0x00,	%l2
	tsubcc	%g1,	%o1,	%l4
	ldsb	[%l7 + 0x26],	%o2
	tg	%icc,	0x2
	wrpr	%g3,	0x0835,	%cwp
	wr	%i4,	0x18A4,	%pic
	rdpr	%canrestore,	%o0
	tcc	%icc,	0x2
	fmovsa	%icc,	%f29,	%f2
	fpadd32	%f24,	%f2,	%f28
	wr	%l0,	0x0DD2,	%sys_tick
	rd	%fprs,	%g5
	rdpr	%cwp,	%l3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x7B5, 	%hsys_tick_cmpr
	nop
	set	0x24, %o7
	ldstub	[%l7 + %o7],	%i6
	te	%xcc,	0x4
	rd	%fprs,	%g6
	ta	%icc,	0x5
	rdpr	%wstate,	%o6
	rdhpr	%hintp,	%i7
        wr    %g0,    0xe,    %pcr    ! changed.
	fpack16	%f30,	%f6
	array32	%i2,	%l6,	%o5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fandnot1	%f16,	%f20,	%f22

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x861, 	%tick_cmpr
	tleu	%xcc,	0x0
	siam	0x2
	wr 	%g0, 	0x5, 	%fprs
	rd	%y,	%i1
	rdpr	%tl,	%l1
        wr    %g0,    0xe,    %pcr    ! changed.

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xFB0, 	%hsys_tick_cmpr
	wr	%g1,	0x1543,	%sys_tick
	rdpr	%tba,	%g3
	wrpr	%o2,	0x112A,	%cwp
	wr	%i4,	0x056F,	%pic
	tle	%xcc,	0x2
	rdhpr	%hpstate,	%l0
	movvs	%xcc,	%g5,	%l3
	rdpr	%otherwin,	%o0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	movrgez	%i6,	0x246,	%g6
	sdiv	%i7,	0x02BC,	%o6
	tneg	%xcc,	0x1
	rdpr	%cwp,	%o3
	taddcctv	%i5,	%l6,	%i2
	addcc	%g4,	%l5,	%g2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xDFA, 	%sys_tick_cmpr
	rd	%softint,	%l1
	set	0x6A, %g7
	stha	%i1,	[%l7 + %g7] 0xeb
	membar	#Sync

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	movneg	%icc,	%o1,	%l4
	wr	%g0,	0x80,	%asi
	swapa	[%l7 + 0x38] %asi,	%g1
	rd	%y,	%o2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	tle	%icc,	0x4
	movge	%xcc,	%i4,	%g5
	udivx	%l0,	0x0FDD,	%l3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%o4,	0x1D73,	%y
	fandnot1s	%f12,	%f23,	%f27
	movrgz	%g6,	0x31C,	%i6
	rdpr	%wstate,	%o6
	edge32ln	%o3,	%i7,	%l6
	rd	%y,	%i2
	wr	%g4,	%l5,	%pic
	wrpr	%i5,	0x1FC7,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x131, 	%hsys_tick_cmpr
	wrpr	%o5,	%o7,	%cwp
	movge	%icc,	%l1,	%i1
	tge	%icc,	0x6
	stb	%l2,	[%l7 + 0x5E]
	addccc	%o1,	%i0,	%g1
	rdpr	%canrestore,	%l4
	andcc	%g3,	0x1A57,	%i4
	fmovrsne	%o2,	%f13,	%f20
	wrpr	%l0,	%g5,	%tick
	fbue	%fcc1,	loop_838
	taddcc	%o0,	%l3,	%i3
	rdpr	%gl,	%o4
	sir	0x07AC
loop_838:
	tsubcc	%g6,	0x1A8D,	%o6
	fmovrde	%o3,	%f18,	%f30
	rd	%fprs,	%i6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xEC5, 	%sys_tick_cmpr
	wrpr	%i2,	0x01E3,	%pil
	bcc,a,pt	%xcc,	loop_839
	rd	%sys_tick_cmpr,	%g4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x343, 	%hsys_tick_cmpr
	rd	%ccr,	%l6
loop_839:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x8A0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	movcc	%xcc,	%g7,	%o7
	edge8ln	%o5,	%l1,	%l2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xD89, 	%hsys_tick_cmpr
	rd	%tick_cmpr,	%i1
	wr	%g0,	0x89,	%asi
	lda	[%l7 + 0x28] %asi,	%f21
	rdhpr	%hsys_tick_cmpr,	%g1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	rdhpr	%htba,	%o2
	edge16n	%l4,	%l0,	%o0
	rd	%asi,	%l3
	rd	%asi,	%g5
	wrpr	%o4,	0x1CFA,	%cwp
	rdhpr	%hsys_tick_cmpr,	%i3
	alignaddrl	%o6,	%g6,	%o3
	rd	%fprs,	%i6
	smulcc	%i2,	%g4,	%l5
	bneg,a,pn	%icc,	loop_840
	wr	%i7,	%g2,	%sys_tick
	rdpr	%tba,	%l6
	bvs,a,pn	%xcc,	loop_841
loop_840:
	rdpr	%tl,	%g7
	add	%l7,	0x08,	%l6
	wr	%g0,	0x11,	%asi
	casa	[%l6] %asi,	%i5,	%o7
loop_841:
	mulx	%o5,	%l1,	%o1
	movcs	%icc,	%i0,	%l2
	rd	%y,	%g1
	wr	%i1,	0x0DA7,	%sys_tick
	fpadd32	%f0,	%f16,	%f10
	ldsh	[%l7 + 0x64],	%i4
	rdpr	%cansave,	%o2
	movvc	%icc,	%g3,	%l0
	fbo,a	%fcc1,	loop_842
	rd	%sys_tick_cmpr,	%o0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
        wr    %g0,    0xe,    %pcr    ! changed.
loop_842:
	wr	%g5,	%o4,	%ccr
	tn	%icc,	0x3
	bge,a,pt	%xcc,	loop_843
	taddcc	%i3,	0x17BC,	%g6
	te	%icc,	0x2
	addcc	%o3,	%i6,	%o6
loop_843:
	rdpr	%canrestore,	%g4
	wrpr	%i2,	%i7,	%cwp
	set	0x12, %g3
	ldsba	[%l7 + %g3] 0x88,	%g2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	movgu	%icc,	%g7,	%o7
	wrpr	%i5,	%o5,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%i0,	0x0406,	%cwp
	rd	%ccr,	%l2
	rd	%y,	%l1
	swap	[%l7 + 0x74],	%i1
	sll	%i4,	%g1,	%g3
	rdpr	%pil,	%o2
	rdpr	%canrestore,	%o0
	alignaddrl	%l4,	%l3,	%l0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%tick_cmpr,	%i3
	rd	%y,	%g6
	xor	%i6,	%o3,	%g4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xBC9, 	%hsys_tick_cmpr
	andcc	%i7,	0x01EF,	%l5
	edge32l	%g2,	%g7,	%l6
	fbule	%fcc3,	loop_844
	rd	%asi,	%o7
	udivx	%i5,	0x1E7E,	%o1
	edge8n	%o5,	%l2,	%l1
loop_844:
	tg	%xcc,	0x2
	rd	%softint,	%i0
	fmovrsne	%i4,	%f11,	%f6
	fmovrdlez	%g1,	%f10,	%f30
	rdhpr	%hintp,	%i1
	wrpr	%g3,	0x1BC1,	%cwp
	fbg	%fcc1,	loop_845
	rdhpr	%htba,	%o2
	rdpr	%gl,	%l4
	rdpr	%tba,	%o0
loop_845:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x6FE, 	%hsys_tick_cmpr
	tneg	%xcc,	0x2
	rdhpr	%hsys_tick_cmpr,	%o4
	fmul8x16au	%f30,	%f0,	%f26
	fand	%f4,	%f30,	%f0
	fmovse	%xcc,	%f11,	%f18
	rd	%fprs,	%i3
	brlz,a	%g5,	loop_846
	fbl,a	%fcc2,	loop_847
	wrpr	%g6,	0x1481,	%cwp
	brz	%o3,	loop_848
loop_846:
	bge,pt	%icc,	loop_849
loop_847:
	rdhpr	%hintp,	%i6
	rd	%y,	%i2
loop_848:
	sub	%g4,	%o6,	%i7
loop_849:
	wrpr	%g2,	0x006F,	%cwp
	rdpr	%cwp,	%l5
	tcs	%xcc,	0x5
	addcc	%g7,	%o7,	%l6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xB31, 	%hsys_tick_cmpr
	fmovse	%xcc,	%f28,	%f15
	rdhpr	%hsys_tick_cmpr,	%i5
	rdpr	%cansave,	%l2
	fmovspos	%icc,	%f31,	%f6
	rdpr	%pil,	%l1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	udivx	%i0,	0x07D1,	%g1
	rd	%sys_tick_cmpr,	%i1
	tpos	%icc,	0x0
	rdhpr	%hsys_tick_cmpr,	%i4
	movg	%xcc,	%o2,	%g3
	subcc	%l4,	0x175A,	%l0
	rd	%fprs,	%l3
	srlx	%o0,	0x17,	%i3
	rd	%y,	%o4
	rdhpr	%hsys_tick_cmpr,	%g5
        wr    %g0,    0xe,    %pcr    ! changed.
	set	0x5C, %o2
	ldswa	[%l7 + %o2] 0x15,	%i2
	wrpr	%g6,	%o6,	%cwp
	move	%icc,	%i7,	%g4
	rd	%tick_cmpr,	%g2
	edge16l	%l5,	%o7,	%g7
	wr	%o1,	0x1659,	%sys_tick
	rd	%softint,	%l6
	rdpr	%wstate,	%i5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	fmovdvs	%xcc,	%f31,	%f30
	rdpr	%otherwin,	%l1
	add	%l7,	0x78,	%l6
	wr	%g0,	0x18,	%asi
	casxa	[%l6] %asi,	%o5,	%g1
	fmovsg	%icc,	%f14,	%f31
	rd	%softint,	%i1
	rdhpr	%hintp,	%i4
	fmovrslez	%o2,	%f4,	%f24
	fmovsa	%xcc,	%f22,	%f13
	xnor	%i0,	0x1B7B,	%g3
	wr	%l4,	0x0290,	%sys_tick
	bn,pt	%icc,	loop_850
	wrpr	%l3,	%l0,	%cwp
	xor	%i3,	0x147B,	%o4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_850:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x43D, 	%hsys_tick_cmpr
	rdpr	%cansave,	%i2
	wr 	%g0, 	0x7, 	%fprs
	rdhpr	%hpstate,	%o6
	wrpr	%i7,	0x02E1,	%cwp
	movleu	%xcc,	%g6,	%g2
	rd	%tick_cmpr,	%g4
	addccc	%o7,	0x0343,	%g7
	rd	%asi,	%o1
	wrpr	%l5,	0x0178,	%pil
	tsubcctv	%l6,	0x14B3,	%l2
	fble	%fcc2,	loop_851
	rdpr	%cansave,	%l1
	edge8n	%i5,	%g1,	%i1
	rd	%pc,	%o5
loop_851:
	or	%i4,	0x0DCE,	%o2
	popc	%i0,	%g3
	wr	%g0,	0xeb,	%asi
	stda	%l4,	[%l7 + 0x20] %asi
	membar	#Sync
	set	0x4E, %l1
	ldstuba	[%l7 + %l1] 0x89,	%l0
	rdhpr	%hsys_tick_cmpr,	%i3
	rd	%ccr,	%o4
	tg	%icc,	0x7
	rdpr	%tl,	%l3
	fpmerge	%f7,	%f16,	%f4
	taddcc	%o3,	%o0,	%i2
	fbl	%fcc1,	loop_852
	rdhpr	%hintp,	%i6
	movle	%xcc,	%o6,	%i7
	pdist	%f16,	%f12,	%f6
loop_852:
	wrpr	%g5,	%g2,	%pil
        wr    %g0,    0xe,    %pcr    ! changed.
	rdhpr	%htba,	%g7
	std	%f12,	[%l7 + 0x40]
	rdhpr	%hintp,	%o7
	alignaddr	%o1,	%l5,	%l6
	rdhpr	%hpstate,	%l1
	rdpr	%tba,	%l2
	fmovdn	%icc,	%f23,	%f12
	ldsb	[%l7 + 0x20],	%i5
	rdpr	%tba,	%g1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x84E, 	%hsys_tick_cmpr
	srax	%o2,	%i0,	%i4
	tleu	%xcc,	0x6
	ta	%xcc,	0x0
	edge16l	%l4,	%l0,	%i3
	orn	%g3,	%o4,	%l3
	movcc	%xcc,	%o0,	%o3
	rd	%y,	%i2
	fcmple32	%f14,	%f28,	%i6
	rd	%y,	%i7
	sdiv	%g5,	0x13D5,	%g2
	xorcc	%g6,	0x0B0D,	%g4
	nop
	setx	loop_853,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	wr	%o6,	0x0C93,	%clear_softint
	rdpr	%cansave,	%g7
	wrpr	%o1,	%l5,	%tick
loop_853:
	rdpr	%otherwin,	%l6
	rdpr	%canrestore,	%o7
	wrpr	%l2,	%i5,	%pil
	wrpr	%l1,	0x00D5,	%cwp
	rdpr	%tl,	%i1
	rdpr	%cleanwin,	%g1
	xnor	%o2,	%o5,	%i0
	wr	%i4,	0x0087,	%ccr
	edge16	%l4,	%i3,	%l0
	alignaddr	%g3,	%o4,	%l3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xA82, 	%hsys_tick_cmpr
	rdhpr	%htba,	%o0
	fcmple16	%f16,	%f2,	%i6
	rd	%ccr,	%i7
	rd	%tick_cmpr,	%g5
	rdhpr	%hintp,	%g2
	orncc	%g6,	%o6,	%g4
	fcmpd	%fcc3,	%f2,	%f4
	fnegs	%f15,	%f30
	alignaddrl	%g7,	%o1,	%l5
	fmovdneg	%icc,	%f6,	%f19
	edge8	%l6,	%o7,	%i5
	move	%icc,	%l1,	%i1
	fandnot2	%f4,	%f8,	%f10
	fbge,a	%fcc2,	loop_854
	rdhpr	%hsys_tick_cmpr,	%g1
	wrpr	%o2,	0x0F74,	%tick
	fcmpeq16	%f4,	%f18,	%o5
loop_854:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	movleu	%icc,	%i4,	%l4
	brlz	%l2,	loop_855
        wr    %g0,    0xe,    %pcr    ! changed.

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xB24, 	%sys_tick_cmpr
	movg	%xcc,	%o3,	%i2
loop_855:
	wr	%l0,	0x0E0F,	%softint
	wrpr	%i6,	0x04B4,	%pil
	wrpr	%i7,	0x0CDD,	%tick
	rdhpr	%hpstate,	%g5
	tvc	%xcc,	0x5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%g6,	0x1758,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xE30, 	%hsys_tick_cmpr
	edge16	%o6,	%l5,	%l6
	rdhpr	%htba,	%o1
	movpos	%xcc,	%i5,	%o7
	wr	%i1,	0x1611,	%sys_tick
	fmovrdlez	%l1,	%f6,	%f0
	fmovdcc	%xcc,	%f16,	%f17
	fcmple32	%f22,	%f16,	%g1
	fnegs	%f21,	%f26
	prefetch	[%l7 + 0x6C],	 0x1
	rd	%y,	%o5
	edge8n	%i0,	%i4,	%l4
	rd	%softint,	%l2
	add	%l7,	0x30,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%o2,	%g3
	rdpr	%pil,	%o4
	rdpr	%canrestore,	%i3
	tsubcctv	%l3,	%i2,	%o3
	rdhpr	%hsys_tick_cmpr,	%l0
	rdpr	%cwp,	%i6
	rdpr	%cwp,	%g5
	subc	%o0,	0x1CB6,	%g2
	wrpr	%g6,	%g4,	%pil
	wrpr	%g7,	0x0175,	%pil
	edge16	%o6,	%i7,	%l6
	edge8n	%l5,	%o1,	%o7
	rdhpr	%htba,	%i1
	set	0x40, %g5
	sta	%f6,	[%l7 + %g5] 0x0c
	rdhpr	%hintp,	%i5
	wrpr	%g1,	%o5,	%cwp
	rd	%y,	%l1
	movne	%xcc,	%i0,	%i4
	fmovsg	%icc,	%f8,	%f27
	umulcc	%l4,	0x1F60,	%l2
	rdpr	%canrestore,	%o2
	rdpr	%cwp,	%g3
	wrpr	%i3,	%l3,	%tick
	wr	%o4,	0x0741,	%softint
	fmovrsgz	%o3,	%f5,	%f31
	sll	%l0,	0x1A,	%i2
	wrpr	%g5,	0x12BA,	%tick
	rdhpr	%hpstate,	%i6
	wrpr	%o0,	0x12C3,	%tick
	movle	%icc,	%g6,	%g2
	bvs,pt	%icc,	loop_856
	edge8ln	%g7,	%o6,	%g4
	sra	%l6,	%i7,	%l5
	fcmps	%fcc0,	%f25,	%f0
loop_856:
	ldx	[%l7 + 0x10],	%o7
	wrpr	%i1,	%o1,	%pil
	rdhpr	%hsys_tick_cmpr,	%g1
	fpsub32s	%f20,	%f2,	%f18
	wr	%i5,	%l1,	%set_softint
	tvc	%icc,	0x4
	sra	%o5,	0x0C,	%i4
	edge16n	%l4,	%l2,	%o2
	wr	%i0,	%i3,	%softint
	rdhpr	%hpstate,	%g3
	wr	%g0,	0x10,	%asi
	ldstuba	[%l7 + 0x5F] %asi,	%l3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x480, 	%hsys_tick_cmpr
	ldsh	[%l7 + 0x28],	%i2
	rdhpr	%hpstate,	%o4
	addccc	%g5,	0x0A3D,	%o0
	wrpr	%g6,	%i6,	%pil
	array8	%g2,	%o6,	%g7
	andcc	%g4,	0x0494,	%l6
	bleu,pn	%xcc,	loop_857
	wrpr	%l5,	0x0910,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%softint,	%i7
loop_857:
	fble	%fcc1,	loop_858
	fandnot1	%f16,	%f0,	%f22
	rdpr	%tl,	%o1
	bleu	%icc,	loop_859
loop_858:
	movrne	%i1,	0x064,	%i5
	fba,a	%fcc1,	loop_860
	andncc	%l1,	%g1,	%o5
loop_859:
	fbge,a	%fcc0,	loop_861
	sdiv	%l4,	0x1F27,	%i4
loop_860:
	wrpr	%o2,	%l2,	%pil
	movn	%xcc,	%i0,	%i3
loop_861:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	tgu	%xcc,	0x2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%sys_tick_cmpr,	%l0
	wr	%i2,	%o4,	%set_softint
	rd	%pc,	%g5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xE3D, 	%hsys_tick_cmpr
	rdhpr	%htba,	%i6
	rdhpr	%hpstate,	%g2
	wr	%o6,	%o0,	%y
	orncc	%g7,	0x03C0,	%l6
	wrpr	%g4,	0x1E5C,	%cwp
	wr 	%g0, 	0x6, 	%fprs
	rdhpr	%hintp,	%o1
	wrpr	%i7,	0x0060,	%cwp
	rd	%sys_tick_cmpr,	%i1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	brgez	%i5,	loop_862
	rdhpr	%htba,	%l4
	wrpr	%o5,	0x18EB,	%cwp
	fmovdg	%xcc,	%f24,	%f6
loop_862:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x28F, 	%hsys_tick_cmpr
	tle	%xcc,	0x2
	rd	%ccr,	%i4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	rd	%softint,	%l2
	wrpr	%i0,	%i3,	%pil
	wr	%l3,	0x0B04,	%clear_softint
	movrlz	%o3,	0x3D4,	%l0
	rdhpr	%hpstate,	%o4
	rdhpr	%htba,	%g5
	movcs	%icc,	%i2,	%g6
	rdpr	%wstate,	%g3
	tsubcctv	%i6,	%o6,	%g2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xBA4, 	%hsys_tick_cmpr
	sll	%o0,	0x09,	%l5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xF7A, 	%sys_tick_cmpr
	addccc	%g4,	%i7,	%i1
	tcc	%icc,	0x3
	rd	%fprs,	%l1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%hintp,	%l4
	rdhpr	%hpstate,	%o5
	rd	%tick_cmpr,	%g1
	rdpr	%gl,	%o2
	wrpr	%l2,	%i4,	%cwp
	rdhpr	%hintp,	%i3
	wr	%g0,	0x81,	%asi
	ldda	[%l7 + 0x30] %asi,	%i0
	rdpr	%gl,	%l3
	andn	%o3,	0x08D5,	%o4
	rdpr	%tl,	%g5
	siam	0x0
	array32	%l0,	%i2,	%g6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x85E, 	%hsys_tick_cmpr
	edge32	%g2,	%o6,	%l6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xC27, 	%hsys_tick_cmpr
	rdpr	%gl,	%l5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%o7,	0x01A6,	%sys_tick
	fpadd16	%f30,	%f16,	%f6
	edge32l	%o1,	%i7,	%i1
	addc	%l1,	%g4,	%l4
	rd	%y,	%o5
	rdhpr	%hsys_tick_cmpr,	%i5
	rd	%fprs,	%o2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xC31, 	%hsys_tick_cmpr
	tvc	%icc,	0x5
	wr	%g1,	0x1646,	%softint
	wrpr	%i3,	0x0A78,	%pil
        wr    %g0,    0xe,    %pcr    ! changed.
	wrpr	%l3,	%i0,	%pil
	rd	%ccr,	%o3
	sll	%g5,	%l0,	%i2
	wr	%o4,	%g3,	%sys_tick
	wr	%i6,	%g6,	%ccr
	tg	%xcc,	0x1
	stb	%g2,	[%l7 + 0x31]
	wr	%o6,	0x0539,	%set_softint
	rdpr	%wstate,	%l6
	rdhpr	%hintp,	%o0
	tleu	%icc,	0x5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x6BD, 	%hsys_tick_cmpr
	edge8ln	%g7,	%o1,	%i7
	wrpr	%i1,	%o7,	%cwp
	stbar
	rd	%asi,	%g4
	movge	%xcc,	%l1,	%l4
	rdpr	%gl,	%o5
	wr	%i5,	0x1754,	%set_softint

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xF60, 	%hsys_tick_cmpr
	fmovrdlez	%o2,	%f2,	%f28
	udiv	%i3,	0x1027,	%i4
	wr	%l3,	%g1,	%clear_softint
	tle	%xcc,	0x2
	wr	%o3,	0x17B9,	%sys_tick
	edge8n	%i0,	%g5,	%l0
	rd	%ccr,	%o4
	rd	%softint,	%i2
	wrpr	%i6,	0x0E94,	%tick
	bpos,a,pn	%icc,	loop_863
	wr	%g3,	0x0A46,	%clear_softint
	rdhpr	%hsys_tick_cmpr,	%g2
	fpsub32	%f12,	%f6,	%f26
loop_863:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x94D, 	%hsys_tick_cmpr
	wrpr	%l6,	%o0,	%pil
	tcc	%xcc,	0x4
	rdpr	%tba,	%g6
	brlez,a	%l5,	loop_864
	xorcc	%g7,	0x1F1E,	%i7
	rd	%ccr,	%i1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xB47, 	%hsys_tick_cmpr
loop_864:
	brgz	%l1,	loop_865
	rdpr	%wstate,	%l4
	tvs	%icc,	0x1
	sll	%g4,	%o5,	%i5
loop_865:
	wr	%l2,	%i3,	%y
	rdhpr	%hintp,	%i4
	fmovdge	%icc,	%f28,	%f1
	edge16l	%o2,	%g1,	%l3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x38E, 	%sys_tick_cmpr
	wrpr	%o3,	%l0,	%cwp
	rd	%tick_cmpr,	%g5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	bvc	%icc,	loop_866
	edge16n	%i6,	%g2,	%o6
	wr	%g3,	%l6,	%set_softint
	fandnot1	%f6,	%f26,	%f8
loop_866:
	srlx	%g6,	%o0,	%l5
	rd	%y,	%i7
	rd	%asi,	%i1
	fcmple32	%f6,	%f30,	%o7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x270, 	%hsys_tick_cmpr
	wrpr	%l4,	0x16E2,	%tick
	rdpr	%gl,	%l1
	tn	%xcc,	0x0
	smulcc	%o5,	%i5,	%l2
	tneg	%xcc,	0x7
	rdhpr	%hsys_tick_cmpr,	%i3
	wrpr	%g4,	0x136F,	%cwp
	wrpr	%o2,	%i4,	%cwp
	rd	%y,	%g1
	orncc	%i0,	%l3,	%l0
	rd	%sys_tick_cmpr,	%g5
	rdpr	%tl,	%o4
	wrpr	%i2,	%o3,	%pil
	udivx	%i6,	0x06A7,	%g2
	fmovsleu	%icc,	%f11,	%f25
	xnorcc	%g3,	0x12FA,	%o6
	add	%l7,	0x7C,	%l6
	wr	%g0,	0x0c,	%asi
	casa	[%l6] %asi,	%g6,	%o0
	rdpr	%otherwin,	%l6
	rdpr	%pil,	%l5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	movg	%xcc,	%i7,	%o1
	sdivcc	%g7,	0x0E88,	%l4
	movneg	%xcc,	%l1,	%o7
	fpsub32s	%f24,	%f0,	%f10
	fpadd16	%f16,	%f0,	%f4
	rdpr	%tl,	%i5
	rdhpr	%hsys_tick_cmpr,	%l2
	array32	%o5,	%g4,	%o2
	fcmple32	%f8,	%f6,	%i4
	umulcc	%i3,	0x0571,	%g1
	rdpr	%tba,	%l3
	wrpr	%l0,	0x1C11,	%pil
	wrpr	%i0,	%o4,	%tick
	movl	%xcc,	%i2,	%g5
	fmovscc	%xcc,	%f25,	%f9
	rdhpr	%hpstate,	%i6
	movrlez	%o3,	%g3,	%g2
	addcc	%o6,	0x0423,	%g6
	edge8	%l6,	%l5,	%i1
	umulcc	%o0,	%o1,	%g7
	movg	%xcc,	%l4,	%i7
	wrpr	%o7,	0x13CF,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%hpstate,	%i5
	tn	%xcc,	0x6
	rdhpr	%hpstate,	%o5
	fornot2	%f24,	%f26,	%f20
	rdhpr	%hpstate,	%l2
	wrpr	%o2,	0x0B0E,	%tick
	fbue	%fcc0,	loop_867
	rdhpr	%hsys_tick_cmpr,	%g4
	wrpr	%i3,	0x1A5B,	%cwp
	fblg	%fcc0,	loop_868
loop_867:
	edge16l	%i4,	%l3,	%g1
	rdpr	%cleanwin,	%l0
	set	0x3C, %i4
	lduha	[%l7 + %i4] 0x89,	%o4
loop_868:
	rd	%sys_tick_cmpr,	%i0
	rd	%fprs,	%i2
	rdpr	%wstate,	%g5
	rdpr	%tl,	%i6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	fmovrsgez	%g3,	%f0,	%f8
	rdpr	%cwp,	%g6
	rdpr	%cansave,	%l6
	ld	[%l7 + 0x5C],	%f2
	rd	%pc,	%o6
	wrpr	%i1,	%l5,	%tick
	wr	%o0,	%o1,	%clear_softint
	rd	%tick_cmpr,	%l4
	wrpr	%i7,	%o7,	%pil
	rd	%sys_tick_cmpr,	%l1
	rdpr	%gl,	%i5
	rdpr	%otherwin,	%o5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x8B7, 	%hsys_tick_cmpr
	rdpr	%cleanwin,	%o2
	sll	%g7,	%g4,	%i3
	rdhpr	%hsys_tick_cmpr,	%l3
	rdhpr	%hsys_tick_cmpr,	%i4
	wr	%g0,	0x19,	%asi
	sta	%f24,	[%l7 + 0x14] %asi
	rd	%asi,	%l0
	fmovrsgz	%g1,	%f3,	%f2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	rdpr	%canrestore,	%i0
	rd	%y,	%g5
	bcs,a,pt	%icc,	loop_869
	rd	%tick_cmpr,	%i2
	fba,a	%fcc3,	loop_870
	for	%f20,	%f0,	%f8
loop_869:
	rd	%sys_tick_cmpr,	%o3
	set	0x30, %o3
	prefetcha	[%l7 + %o3] 0x0c,	 0x1
loop_870:
	smulcc	%g2,	%g3,	%g6
	rd	%y,	%o6
	wrpr	%i1,	%l5,	%tick
	sdivx	%l6,	0x118A,	%o1
	rdpr	%otherwin,	%l4
	bgu	loop_871
	rdhpr	%hsys_tick_cmpr,	%o0
	fbn	%fcc0,	loop_872
	sdiv	%o7,	0x1E45,	%l1
loop_871:
	rd	%tick_cmpr,	%i5
	membar	0x13
loop_872:
	fsrc1s	%f30,	%f10
	rd	%softint,	%o5
	mova	%icc,	%l2,	%o2
	wrpr	%g7,	%g4,	%pil
	subcc	%i3,	%i7,	%l3
	rdpr	%canrestore,	%i4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	set	0x40, %i1
	ldda	[%l7 + %i1] 0x0c,	%f0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%g0,	0x11,	%asi
	ldsba	[%l7 + 0x59] %asi,	%i0
	be	%xcc,	loop_873
	xor	%i2,	0x0F75,	%g5
	smul	%o3,	%i6,	%g3
	wrpr	%g6,	%o6,	%cwp
loop_873:
	edge16n	%g2,	%i1,	%l6
	srl	%l5,	%o1,	%o0
	rdhpr	%hsys_tick_cmpr,	%o7
	rdpr	%wstate,	%l1
	wrpr	%l4,	0x07E2,	%tick
	udivcc	%i5,	0x041A,	%o5
	rd	%y,	%l2
	rdpr	%otherwin,	%o2
	rdhpr	%hsys_tick_cmpr,	%g4
	edge16	%i3,	%i7,	%l3
	rd	%fprs,	%g7
	rdpr	%canrestore,	%g1
	fands	%f28,	%f29,	%f12
	wr	%o4,	0x19E5,	%y
	rdhpr	%htba,	%i4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%ccr,	%i2
	rdhpr	%hpstate,	%o3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	array8	%i6,	%o6,	%g2
	rdpr	%tl,	%i1
	fpadd16s	%f12,	%f29,	%f21
	movcs	%xcc,	%l6,	%l5
	rdhpr	%hpstate,	%g6
	tpos	%icc,	0x1
        wr    %g0,    0xe,    %pcr    ! changed.
	tsubcc	%o7,	0x1114,	%o1
	set	0x48, %o1
	prefetcha	[%l7 + %o1] 0x18,	 0x1
	array8	%l1,	%o5,	%i5
	rd	%y,	%o2
	rdhpr	%htba,	%g4
	movgu	%xcc,	%i3,	%i7
	fornot2s	%f30,	%f10,	%f24
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x0AA, 	%hsys_tick_cmpr
	set	0x30, %l0
	lda	[%l7 + %l0] 0x04,	%f23
	wrpr	%g7,	0x1075,	%pil
	fmovdneg	%icc,	%f5,	%f5
	wr	%g1,	0x022B,	%clear_softint
	orcc	%l3,	0x1093,	%o4
	fba	%fcc2,	loop_874
	or	%i0,	%l0,	%i4
	sdivx	%i2,	0x05CB,	%o3
	umul	%g3,	%i6,	%o6
loop_874:
	srax	%g2,	%i1,	%l6
	rdpr	%pil,	%g5
	addcc	%g6,	0x101B,	%o0
	rd	%softint,	%o7
	rdpr	%cleanwin,	%o1
	wrpr	%l4,	%l5,	%pil
	wrpr	%l1,	%i5,	%cwp
	fcmpgt32	%f28,	%f22,	%o2
	fmovdvs	%xcc,	%f29,	%f9
	xnorcc	%o5,	0x1959,	%i3
	wr	%g4,	%i7,	%set_softint
	sra	%l2,	0x04,	%g7
	rdpr	%tl,	%l3
	wr	%o4,	%i0,	%softint

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%l0,	0x02FA,	%cwp
	sdivx	%i4,	0x02F0,	%i2
	umul	%g3,	%i6,	%o6
	rd	%pc,	%g2
	edge32	%o3,	%i1,	%g5
	wr	%g6,	%o0,	%set_softint
	wrpr	%o7,	0x0714,	%tick
	brnz	%l6,	loop_875
	movrlz	%l4,	0x26A,	%o1
	rd	%y,	%l5
	rd	%y,	%i5
loop_875:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%i3,	0x168A,	%clear_softint
	nop
	setx	loop_876,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	stb	%o5,	[%l7 + 0x76]
	alignaddr	%g4,	%i7,	%g7
	rd	%y,	%l3
loop_876:
	rdhpr	%hsys_tick_cmpr,	%l2
	brgez	%o4,	loop_877
	movge	%xcc,	%g1,	%l0
	sdiv	%i0,	0x090A,	%i2
	fmovsvc	%icc,	%f29,	%f31
loop_877:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xFB0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x392, 	%hsys_tick_cmpr
	fnot1	%f30,	%f8
	tleu	%xcc,	0x6
	edge8n	%i6,	%g2,	%i1
	rdpr	%wstate,	%o3
	wrpr	%g6,	0x09D3,	%cwp
	wr	%g5,	0x1B71,	%set_softint
	rd	%softint,	%o7
	wrpr	%l6,	%l4,	%pil
	rd	%y,	%o0
	rdhpr	%hintp,	%l5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xB57, 	%hsys_tick_cmpr
	rdpr	%tba,	%i5
	rd	%softint,	%i3
	rdhpr	%hsys_tick_cmpr,	%o5
	wr	%g4,	0x12DD,	%clear_softint
	rdpr	%cleanwin,	%i7
	wrpr	%l1,	0x0EE8,	%tick
	wrpr	%l3,	0x1946,	%tick
	andncc	%g7,	%o4,	%l2
	rdhpr	%hpstate,	%g1
	wr 	%g0, 	0x5, 	%fprs

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xFAB, 	%hsys_tick_cmpr
	wrpr	%i4,	0x1C77,	%tick
	fbne	%fcc1,	loop_878
	rdhpr	%hpstate,	%i0
	fmovdg	%icc,	%f26,	%f3
	stx	%i6,	[%l7 + 0x38]
loop_878:
	rdhpr	%htba,	%g2
	rdpr	%pil,	%o6
	movrlz	%o3,	%i1,	%g6
	srax	%g5,	0x19,	%o7
	rdpr	%otherwin,	%l6
	udiv	%l4,	0x149C,	%o0
	set	0x70, %i7
	ldda	[%l7 + %i7] 0x10,	%l4
	rdhpr	%htba,	%o2
	rdpr	%pil,	%o1
	rdhpr	%hpstate,	%i3
	nop
	set	0x40, %l3
	ldd	[%l7 + %l3],	%f28
	wr	%o5,	%i5,	%set_softint
	fpadd16	%f14,	%f12,	%f6
	rd	%sys_tick_cmpr,	%i7
	rd	%sys_tick_cmpr,	%g4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fmovrslez	%l2,	%f1,	%f6
	subcc	%g1,	%l0,	%i2
	xorcc	%g3,	%i4,	%i0
	nop
	setx	loop_879,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	wr 	%g0, 	0x6, 	%fprs
	addccc	%i6,	%o3,	%i1
	wrpr	%o6,	0x0366,	%pil
loop_879:
	rd	%y,	%g6
	rdhpr	%hintp,	%g5
	wrpr	%o7,	0x1F2F,	%pil
	movrlz	%l4,	%o0,	%l5
	rdhpr	%htba,	%l6
	wr	%o1,	%o2,	%set_softint
	std	%f24,	[%l7 + 0x48]

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%hintp,	%i5
	fpack32	%f14,	%f30,	%f24

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xF7A, 	%hsys_tick_cmpr
	rdhpr	%hpstate,	%g7
	wrpr	%l1,	%l3,	%pil
	wrpr	%l2,	0x19E5,	%pil
	movrne	%o4,	%l0,	%i2
	addcc	%g1,	0x1909,	%i4
	wr	%i0,	0x1E79,	%y
	rd	%tick_cmpr,	%g2
	wr 	%g0, 	0x5, 	%fprs
!Yo - got one - imm_asi 0x52 
!And yo - immediate is 0x110
	wr	%g0,	0x52,	%asi
	ldxa	[%g0 + 0x110] %asi,	%g3
	rdpr	%tl,	%o3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x539, 	%hsys_tick_cmpr
	umul	%g6,	0x106B,	%g5
	bcc,a	loop_880
	st	%f4,	[%l7 + 0x54]
	popc	0x054E,	%i1
	tge	%icc,	0x1
loop_880:
	rd	%y,	%o7
	rd	%tick_cmpr,	%l4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	popc	%o0,	%o2
	wrpr	%i3,	0x0019,	%cwp
	sra	%o5,	0x11,	%o1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x549, 	%hsys_tick_cmpr
	rd	%ccr,	%g7
	rd	%tick_cmpr,	%i7
	tge	%icc,	0x3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x9D2, 	%hsys_tick_cmpr
	rdhpr	%htba,	%l2
	rd	%pc,	%o4
	rd	%ccr,	%l0
	rd	%tick_cmpr,	%i2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xCDF, 	%hsys_tick_cmpr
	rd	%y,	%l3
	wrpr	%i4,	0x0C20,	%tick
	wr	%i0,	0x01FD,	%clear_softint
	wrpr	%g2,	%g3,	%cwp
	rdhpr	%hintp,	%o3
	rdpr	%gl,	%i6
	wrpr	%g6,	0x1052,	%pil
	wr	%o6,	0x1E3B,	%softint
	bpos,a	%icc,	loop_881
	wr	%i1,	0x08CF,	%y
	rdpr	%cwp,	%o7
	rdpr	%tl,	%l4
loop_881:
	rd	%fprs,	%g5
	rd	%ccr,	%l5
	rdpr	%tl,	%l6
	fmovspos	%icc,	%f13,	%f6
	rd	%ccr,	%o0
	sir	0x14C4
	wrpr	%i3,	%o2,	%pil
	wrpr	%o1,	0x1FF7,	%cwp
	edge16n	%g4,	%i5,	%o5
	wrpr	%i7,	0x0EF4,	%tick
	smulcc	%l1,	%g7,	%l2
	fmovsn	%xcc,	%f2,	%f18
        wr    %g0,    0xe,    %pcr    ! changed.
	set	0x10, %o6
	ldstuba	[%l7 + %o6] 0x81,	%l0
	subcc	%i2,	%l3,	%g1
	tsubcctv	%i0,	%g2,	%g3
	rd	%pc,	%o3
	rd	%pc,	%i6
	rdpr	%cansave,	%i4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xA18, 	%hsys_tick_cmpr
	wr	%o6,	%o7,	%ccr
	movg	%icc,	%l4,	%g5
	rd	%ccr,	%l5
        wr    %g0,    0xe,    %pcr    ! changed.
	addccc	%i3,	0x042D,	%o0
	tcs	%xcc,	0x5
	fbug	%fcc0,	loop_882
	sdiv	%o1,	0x014C,	%o2
	rd	%asi,	%g4
	ld	[%l7 + 0x30],	%f23
loop_882:
	tn	%xcc,	0x1
	wrpr	%o5,	%i7,	%pil
	wrpr	%l1,	%g7,	%tick
	sdivcc	%i5,	0x1441,	%o4
	movleu	%xcc,	%l0,	%l2
	sdivx	%l3,	0x1FBA,	%i2
	popc	%g1,	%i0
	for	%f22,	%f4,	%f30
	rdpr	%cleanwin,	%g3
	wr	%o3,	%g2,	%clear_softint
	fmovrsne	%i6,	%f5,	%f21
	movrne	%g6,	0x3B3,	%i4
	rd	%sys_tick_cmpr,	%o6
	fmovrsgz	%o7,	%f9,	%f16
	move	%icc,	%g5,	%l4
	wrpr	%l5,	0x1D80,	%cwp
	rdhpr	%hpstate,	%l6
	orncc	%i3,	0x1D55,	%o0
	wrpr	%o1,	%o2,	%pil
	rdhpr	%hsys_tick_cmpr,	%g4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x950, 	%hsys_tick_cmpr
	rdhpr	%hpstate,	%o5
	rdpr	%tl,	%l1
	fone	%f20
	movcs	%icc,	%g7,	%i5
	tle	%xcc,	0x0
	fble,a	%fcc0,	loop_883
	edge32l	%i7,	%o4,	%l0
	sub	%l3,	%i2,	%l2
	rd	%y,	%g1
loop_883:
	wrpr	%g3,	0x17D0,	%cwp
	wrpr	%i0,	%g2,	%pil
	rdpr	%cansave,	%i6
	bl	loop_884
	sll	%o3,	0x1F,	%g6
        wr    %g0,    0xe,    %pcr    ! changed.
	rdpr	%pil,	%o6
loop_884:
	brgez,a	%g5,	loop_885
	rd	%fprs,	%l4
	fbul	%fcc1,	loop_886
	wr	%l5,	0x1878,	%clear_softint
loop_885:
	nop
	add	%l7,	0x08,	%l6
	wr	%g0,	0x0c,	%asi
	lda	[%l6] %asi,	%o7
	casa	[%l6] 0x0c,	%o7,	%i3
loop_886:
	and	%o0,	%l6,	%o1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x82B, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x5C1, 	%hsys_tick_cmpr
	wr	%l1,	%g7,	%clear_softint
	rdhpr	%hintp,	%o2
	or	%i5,	%i7,	%l0
	fbe,a	%fcc0,	loop_887
	te	%icc,	0x7
	wrpr	%l3,	%i2,	%pil
	fmul8sux16	%f22,	%f10,	%f14
loop_887:
	sra	%l2,	%o4,	%g3
	tge	%xcc,	0x0
	rdhpr	%hpstate,	%i0
	smulcc	%g1,	%g2,	%o3
	wrpr	%i6,	0x1470,	%tick
	sir	0x11C8
	edge32l	%i4,	%o6,	%g5
	movl	%xcc,	%g6,	%l5
	wr	%o7,	%l4,	%softint
	rdpr	%gl,	%i3
	fexpand	%f10,	%f20
	tpos	%icc,	0x1
	rdhpr	%hintp,	%o0
	wr	%l6,	%g4,	%ccr
	tn	%icc,	0x7
	add	%o1,	%o5,	%l1
	rd	%fprs,	%i1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	rd	%softint,	%i7
	te	%icc,	0x6
	wr	%l0,	%l3,	%sys_tick
	rdhpr	%hsys_tick_cmpr,	%i2
	wrpr	%l2,	%o4,	%cwp
	fblg,a	%fcc1,	loop_888
	rd	%asi,	%i5
	ldsw	[%l7 + 0x24],	%g3
	rd	%tick_cmpr,	%g1
loop_888:
	bcc	loop_889
	wrpr	%g2,	0x0C75,	%pil
	sethi	0x16E8,	%o3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xC02, 	%hsys_tick_cmpr
loop_889:
	rd	%sys_tick_cmpr,	%i0
	wrpr	%i4,	0x0F96,	%pil
	wr	%g5,	%o6,	%ccr
	rdhpr	%htba,	%l5
	te	%icc,	0x0
	wrpr	%g6,	%o7,	%tick
	fpack32	%f0,	%f24,	%f28
	rdpr	%otherwin,	%l4
	subccc	%o0,	0x19A9,	%i3
	wr 	%g0, 	0x4, 	%fprs

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x320, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x88E, 	%hsys_tick_cmpr
	fcmple16	%f0,	%f14,	%l1
	rd	%asi,	%o5
	wrpr	%o2,	0x11C1,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xD08, 	%hsys_tick_cmpr
	rdpr	%tba,	%i7
	rd	%sys_tick_cmpr,	%l0
	andncc	%l3,	%i2,	%l2
	movn	%xcc,	%o4,	%i5
	tcs	%icc,	0x2
	fbn,a	%fcc3,	loop_890
	rdhpr	%hpstate,	%g3

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
loop_890:
	bge,a	loop_891
	tvs	%icc,	0x1
	for	%f20,	%f12,	%f0
	rdpr	%tba,	%g2
loop_891:
	movcc	%xcc,	%o3,	%i0
	rd	%ccr,	%i6
	fexpand	%f10,	%f4
	fnot2s	%f23,	%f20
	wr	%g0,	0x80,	%asi
	lduha	[%l7 + 0x76] %asi,	%g5
	movg	%icc,	%i4,	%o6
	fmuld8ulx16	%f23,	%f9,	%f14
	wr	%l5,	%g6,	%clear_softint
	wr	%g0,	0x80,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	movleu	%icc,	%o7,	%l4
	wr	%i3,	0x1629,	%clear_softint
	wrpr	%o0,	0x1A77,	%cwp
	subc	%g4,	0x01BC,	%o1
	wr	%l6,	0x0712,	%set_softint
	rdhpr	%hintp,	%l1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x518, 	%hsys_tick_cmpr
	rdhpr	%htba,	%i1
	rdpr	%cwp,	%l0
	wrpr	%l3,	%i7,	%cwp
	rdpr	%tl,	%l2
	fmovscs	%xcc,	%f10,	%f5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xA6E, 	%hsys_tick_cmpr
	udivx	%o4,	0x15F2,	%g3
	rd	%y,	%i5
	rd	%y,	%g1
	rd	%softint,	%g7
	wrpr	%o3,	0x1C6C,	%pil
	edge16n	%i0,	%g2,	%g5
	smul	%i6,	%o6,	%l5
	bcc,pt	%icc,	loop_892
	wrpr	%g6,	%o7,	%tick
	wr	%g0,	0x80,	%asi
	swapa	[%l7 + 0x30] %asi,	%i4
loop_892:
	wr	%i3,	%l4,	%pic
	rdhpr	%hpstate,	%g4
	sir	0x09D4
	fpsub32	%f24,	%f26,	%f22
	rd	%y,	%o0
	rd	%asi,	%l6
	fmovrdne	%l1,	%f10,	%f30

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xB7C, 	%hsys_tick_cmpr
	rdpr	%tba,	%i1
	rd	%tick_cmpr,	%o2
	wr	%l3,	0x12A2,	%softint
	rd	%pc,	%i7
	flush	%l7 + 0x4C
	wr	%l0,	0x081E,	%pic
	rd	%sys_tick_cmpr,	%i2
	wr	%l2,	%o4,	%clear_softint
	ble,a	%xcc,	loop_893
	movne	%icc,	%i5,	%g3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x8C9, 	%hsys_tick_cmpr
	rdpr	%cansave,	%i0
loop_893:
	wr	%g2,	0x1F55,	%softint
	edge16n	%g5,	%i6,	%g7
	rdpr	%canrestore,	%l5
	wrpr	%g6,	%o6,	%pil
	rd	%softint,	%o7
	sdiv	%i3,	0x1FF3,	%l4
	tsubcctv	%g4,	0x070F,	%i4
	fmovda	%xcc,	%f15,	%f10
	rdhpr	%hsys_tick_cmpr,	%l6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%o5,	%o1,	%cwp
        wr    %g0,    0xe,    %pcr    ! changed.
	rdpr	%cwp,	%i1
	taddcctv	%l3,	%o2,	%i7
	membar	0x7E
	smulcc	%l0,	0x18D7,	%i2
	rdpr	%otherwin,	%o4
	umulcc	%l2,	%g3,	%i5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x19C, 	%hsys_tick_cmpr
	rdhpr	%hintp,	%g5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x86A, 	%tick_cmpr
	wr	%i6,	0x0469,	%pic
	rdhpr	%hintp,	%l5
	rdpr	%canrestore,	%o6
	movle	%icc,	%o7,	%g6
	st	%f23,	[%l7 + 0x08]
	brgez	%i3,	loop_894
	rdpr	%cansave,	%g4
	rdpr	%cwp,	%i4
	tvc	%xcc,	0x2
loop_894:
	fmovscc	%icc,	%f7,	%f11
	umulcc	%l4,	0x0811,	%l6
	rdpr	%cansave,	%o0
	edge16ln	%o1,	%o5,	%l1
	fmovdvc	%icc,	%f0,	%f13
	or	%l3,	0x1A3D,	%o2
	wrpr	%i1,	0x09C7,	%tick
	rdhpr	%hintp,	%i7
	rd	%y,	%l0
	movre	%i2,	0x228,	%o4
	wrpr	%l2,	0x1C62,	%cwp
	rdpr	%otherwin,	%i5
	mova	%xcc,	%g3,	%g1
	rd	%ccr,	%o3
	wr	%i0,	%g2,	%set_softint
	add	%l7,	0x48,	%l6
	wr	%g0,	0x0c,	%asi
	casa	[%l6] 0x0c,	%g7,	%g5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x677, 	%sys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fbue,a	%fcc3,	loop_895
	wrpr	%g6,	%i3,	%cwp
	fmovdcc	%icc,	%f10,	%f10
	fmovsg	%icc,	%f25,	%f2
loop_895:
	fnands	%f8,	%f8,	%f19
	wrpr	%g4,	0x0721,	%pil
	rdpr	%otherwin,	%o6
	fxnor	%f18,	%f6,	%f12

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xD7E, 	%hsys_tick_cmpr
	edge16l	%l4,	%o0,	%o1
	set	0x68, %g4
	lduwa	[%l7 + %g4] 0x04,	%l6
	wrpr	%o5,	0x1DDD,	%tick
	rdhpr	%hsys_tick_cmpr,	%l1
	tcc	%xcc,	0x7
	fbu	%fcc1,	loop_896
	fbul,a	%fcc2,	loop_897
	wr	%l3,	%o2,	%y
	fpackfix	%f26,	%f13
loop_896:
	alignaddrl	%i1,	%l0,	%i2
loop_897:
	fxnors	%f18,	%f10,	%f17
	wrpr	%o4,	0x0780,	%cwp
	movgu	%icc,	%l2,	%i7
	rdhpr	%hintp,	%g3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	edge8ln	%i5,	%g2,	%g7
	edge32n	%g5,	%i0,	%l5
	rdpr	%cleanwin,	%i6
	sllx	%g6,	%o7,	%g4
	wr	%i3,	%o6,	%set_softint
	wr	%i4,	0x12CE,	%ccr
	movre	%o0,	0x00B,	%l4
	movrlz	%l6,	%o1,	%l1
	rdhpr	%hsys_tick_cmpr,	%o5
	wrpr	%o2,	0x1108,	%cwp
	edge32ln	%i1,	%l0,	%l3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	movl	%icc,	%i7,	%i2
	set	0x70, %i3
	ldda	[%l7 + %i3] 0x26,	%g2
	wr 	%g0, 	0x6, 	%fprs
	wrpr	%g2,	0x16D1,	%tick
	fbe	%fcc1,	loop_898
	fbne	%fcc0,	loop_899
	movle	%xcc,	%o3,	%g7
	wrpr	%i0,	%g5,	%cwp
loop_898:
	movneg	%xcc,	%i6,	%g6
loop_899:
	wr	%l5,	%g4,	%set_softint

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xAED, 	%hsys_tick_cmpr
	andncc	%o6,	%i4,	%o7
	set	0x60, %o5
	prefetcha	[%l7 + %o5] 0x14,	 0x2
	swap	[%l7 + 0x28],	%o0
	rd	%ccr,	%l6
	or	%o1,	0x187F,	%o5
	wr	%g0,	0x80,	%asi
	ldsba	[%l7 + 0x4D] %asi,	%l1
	nop
	set	0x70, %i0
	ldd	[%l7 + %i0],	%i0
	rdpr	%cleanwin,	%o2
	wrpr	%l3,	0x0A6C,	%pil
	rdpr	%cansave,	%l0
	rdpr	%gl,	%o4
	mova	%icc,	%i7,	%i2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xD66, 	%hsys_tick_cmpr
	te	%icc,	0x3
	fpsub32	%f22,	%f20,	%f2
	wr	%g1,	0x037F,	%set_softint
	edge8ln	%i5,	%l2,	%g2
	fmovrsgez	%o3,	%f14,	%f2
	edge8ln	%i0,	%g7,	%i6
	fmovsle	%xcc,	%f8,	%f9
	taddcctv	%g6,	%l5,	%g5
	array8	%i3,	%o6,	%i4
	rdhpr	%hintp,	%g4
	stw	%o7,	[%l7 + 0x24]
	rdhpr	%hpstate,	%l4
	wrpr	%l6,	%o1,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	sdiv	%l1,	0x1477,	%o5
	wr	%o2,	0x0AD8,	%sys_tick
	rd	%y,	%i1
	brz,a	%l3,	loop_900
	addc	%l0,	%o4,	%i2
	rdhpr	%hsys_tick_cmpr,	%g3
	rdpr	%pil,	%i7
loop_900:
	move	%icc,	%g1,	%i5
	rdpr	%tba,	%g2
	nop
	set	0x50, %i5
	ldd	[%l7 + %i5],	%f12
	wr	%o3,	%l2,	%sys_tick
	ldub	[%l7 + 0x6C],	%g7
	rd	%softint,	%i6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xCA9, 	%hsys_tick_cmpr
	wr	%l5,	0x0883,	%clear_softint
	tneg	%xcc,	0x0
	fmovsn	%xcc,	%f21,	%f27
	bg	%xcc,	loop_901
	srl	%i3,	%g5,	%o6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x4C4, 	%hsys_tick_cmpr
	ta	%icc,	0x2
loop_901:
	edge32l	%g4,	%l4,	%o7
	rd	%y,	%l6
	fsrc2s	%f10,	%f2
	bne	%icc,	loop_902
	array32	%o0,	%o1,	%o5
	wrpr	%o2,	0x0F5A,	%pil
	movleu	%icc,	%l1,	%l3
loop_902:
	wrpr	%i1,	0x0512,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x625, 	%hsys_tick_cmpr
	movcs	%icc,	%l0,	%i2
	xor	%g3,	%i7,	%i5
	fbul	%fcc0,	loop_903
	movne	%xcc,	%g2,	%g1
	alignaddr	%o3,	%l2,	%i6
	wr	%g6,	0x1260,	%y
loop_903:
	rdpr	%pil,	%i0
	rd	%softint,	%g7
	rd	%asi,	%l5
	rdhpr	%hintp,	%g5
	wrpr	%i3,	0x1610,	%pil
	bleu	%xcc,	loop_904
	taddcctv	%i4,	%g4,	%o6
        wr    %g0,    0xe,    %pcr    ! changed.
	taddcctv	%o0,	0x160D,	%l6
loop_904:
	rd	%ccr,	%o5
	rdhpr	%htba,	%o1
	rd	%softint,	%l1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%tl,	%l3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xBFF, 	%hsys_tick_cmpr
	fbue,a	%fcc2,	loop_905
	tvs	%xcc,	0x4
	wrpr	%g3,	%i7,	%tick
	fnands	%f14,	%f4,	%f12
loop_905:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x166, 	%hsys_tick_cmpr
	edge8n	%g1,	%g2,	%l2
	fandnot1	%f4,	%f12,	%f28
	wrpr	%o3,	%i6,	%tick
	fmul8ulx16	%f8,	%f22,	%f18
	wr	%g6,	%g7,	%pic
	rd	%softint,	%i0
	rd	%sys_tick_cmpr,	%g5
	movrne	%i3,	%i4,	%g4
	movrgez	%l5,	0x296,	%o6
	xnorcc	%o7,	%o0,	%l4
	rdhpr	%hsys_tick_cmpr,	%l6
	wr	%o1,	%o5,	%ccr
	edge32n	%o2,	%l1,	%l3
	movrlz	%o4,	%l0,	%i2
	fcmpd	%fcc0,	%f30,	%f22

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	xnor	%i1,	%i5,	%g2
	fornot1s	%f20,	%f8,	%f10
	rd	%softint,	%l2
	taddcc	%g1,	0x03D4,	%i6
	wrpr	%o3,	%g6,	%pil
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	rdpr	%cansave,	%i0
	rd	%asi,	%g7
	rdpr	%gl,	%i3
	fmovdpos	%xcc,	%f19,	%f16
	rdhpr	%hpstate,	%i4
	membar	0x20
	fmovdleu	%xcc,	%f4,	%f24
	addcc	%g5,	%g4,	%o6
	rdpr	%gl,	%l5
	rd	%asi,	%o7
	set	0x40, %l6
	ldda	[%l7 + %l6] 0x88,	%f16
	wr 	%g0, 	0x5, 	%fprs
	or	%o1,	%o5,	%o2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	tl	%icc,	0x1
	wr	%o4,	0x14F5,	%y
	wr	%g0,	0xeb,	%asi
	stba	%l3,	[%l7 + 0x63] %asi
	membar	#Sync
	rdpr	%canrestore,	%i2
	sllx	%g3,	0x0F,	%l0
	wr 	%g0, 	0x7, 	%fprs

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	pdist	%f16,	%f18,	%f14

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x017, 	%hsys_tick_cmpr
	smul	%l2,	0x0A46,	%i6
	rdhpr	%hsys_tick_cmpr,	%g1
	wr	%o3,	0x1DA6,	%softint
	edge32	%i0,	%g6,	%g7
	wr	%i4,	%i3,	%y
	set	0x10, %g2
	ldswa	[%l7 + %g2] 0x15,	%g5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	subc	%o6,	0x12BB,	%o7
	mulx	%o0,	0x0CC4,	%l6
	wrpr	%l5,	%o1,	%tick
	andcc	%o2,	%l4,	%l1
	movre	%o4,	%o5,	%i2
	wrpr	%g3,	0x1B3A,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	set	0x10, %o4
	lduwa	[%l7 + %o4] 0x19,	%i1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x41E, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x620, 	%tick_cmpr
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmpne16	%f16,	%f10,	%i6
	movrlez	%g1,	0x335,	%i5
	rd	%softint,	%o3
	rd	%softint,	%g6
	fmovsvc	%icc,	%f31,	%f1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x397, 	%hsys_tick_cmpr
	tn	%xcc,	0x1
	edge16l	%i4,	%i3,	%i0
	rdhpr	%hpstate,	%g5
	movvs	%icc,	%o6,	%o7
	rd	%softint,	%g4
	fbuge	%fcc3,	loop_906
	rdhpr	%hintp,	%o0
	wrpr	%l6,	0x1719,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_906:
	wrpr	%o2,	%l5,	%cwp
	sll	%l4,	%o4,	%l1
	andncc	%i2,	%o5,	%l0
	fand	%f8,	%f18,	%f10
	fmul8x16	%f1,	%f10,	%f14
	wrpr	%g3,	%i1,	%tick
	rdhpr	%htba,	%l3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x974, 	%hsys_tick_cmpr
	wrpr	%l2,	0x045F,	%cwp
	rd	%y,	%i6
	rdpr	%gl,	%g1
	movleu	%xcc,	%i5,	%i7
	rd	%asi,	%g6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xAB8, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%cansave,	%i3
	rdhpr	%hpstate,	%g5
	rdhpr	%hpstate,	%o6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x6DA, 	%hsys_tick_cmpr
	wrpr	%o0,	%g4,	%cwp
	stx	%l6,	[%l7 + 0x38]
	rdhpr	%hsys_tick_cmpr,	%o1
	smul	%o2,	0x158E,	%l4
	udivx	%l5,	0x00E9,	%l1
	add	%i2,	%o4,	%l0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xF38, 	%hsys_tick_cmpr
	rdhpr	%hintp,	%g3
	rdhpr	%htba,	%l3
	rdhpr	%hsys_tick_cmpr,	%g2
	rdpr	%cleanwin,	%i1
	wrpr	%i6,	0x1014,	%pil
	addcc	%l2,	%g1,	%i5
	subc	%i7,	%g6,	%o3
	sra	%g7,	0x12,	%i4
	edge16l	%i0,	%i3,	%o6
	wrpr	%g5,	%o0,	%cwp
	fmovsle	%xcc,	%f14,	%f14
	rdhpr	%htba,	%g4
	rdhpr	%hintp,	%l6
	rdhpr	%hpstate,	%o1
	fcmpgt16	%f8,	%f26,	%o2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x31D, 	%hsys_tick_cmpr
	umul	%l4,	%l1,	%i2
	array8	%l5,	%o4,	%l0
	wr	%g3,	%o5,	%y
	addccc	%l3,	%g2,	%i6
	rdhpr	%hpstate,	%i1
	wrpr	%g1,	0x0C80,	%cwp
        wr    %g0,    0xe,    %pcr    ! changed.

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	popc	0x16CD,	%g7
	wr	%i4,	%i0,	%sys_tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	rdhpr	%hintp,	%o3
	rdhpr	%hsys_tick_cmpr,	%g5
	ldd	[%l7 + 0x20],	%f30
	fblg,a	%fcc1,	loop_907
	rd	%ccr,	%o0
        wr    %g0,    0xe,    %pcr    ! changed.
	tgu	%icc,	0x0
loop_907:
	rdpr	%cwp,	%o2
	movrlez	%o1,	0x136,	%l4
	rdpr	%cwp,	%l1
	rd	%ccr,	%i2
	bgu,a	%icc,	loop_908
	wrpr	%l5,	%o4,	%pil
	wrpr	%o7,	0x0E74,	%cwp
	rd	%asi,	%g3
loop_908:
	fmovrsgez	%o5,	%f22,	%f1
	movgu	%xcc,	%l0,	%l3
	sra	%g2,	0x17,	%i6
	brgz	%i1,	loop_909
	fmovsge	%xcc,	%f8,	%f10
	fmovde	%xcc,	%f13,	%f6
	mulx	%l2,	0x13EE,	%i7
loop_909:
	wrpr	%g1,	%i5,	%tick
	rd	%fprs,	%g7
	mulscc	%i4,	0x1609,	%i0
	fnot1s	%f25,	%f25
	fands	%f27,	%f30,	%f12
	smul	%g6,	%i3,	%o6
	wr	%o3,	%g5,	%ccr
	rdhpr	%hintp,	%l6
	wr	%o0,	0x1EE2,	%sys_tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	wr	%o1,	0x0F1F,	%pic
	tn	%xcc,	0x3
	fbul,a	%fcc3,	loop_910
	movrlz	%l4,	%g4,	%i2
	rd	%asi,	%l1
	mulx	%l5,	0x111D,	%o7
loop_910:
	rdhpr	%hintp,	%g3
	fmovrdlz	%o4,	%f24,	%f16
	nop
	set	0x1A, %g6
	ldsb	[%l7 + %g6],	%l0
	rdhpr	%htba,	%o5
	rdhpr	%hsys_tick_cmpr,	%l3
	brgz,a	%i6,	loop_911
	rdpr	%pil,	%g2
	fbue	%fcc1,	loop_912
	addcc	%l2,	0x08E8,	%i1
loop_911:
	bpos	loop_913
	alignaddr	%i7,	%g1,	%g7
loop_912:
	fpadd16s	%f23,	%f27,	%f31
	fbe	%fcc2,	loop_914
loop_913:
	wrpr	%i4,	0x0BF5,	%pil
	rd	%y,	%i0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_914:
	movpos	%icc,	%g6,	%o3
	wrpr	%o6,	%g5,	%pil
	rdhpr	%hpstate,	%l6
	movpos	%icc,	%o0,	%o2
	edge16l	%l4,	%g4,	%i2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%fprs,	%l5
	addcc	%o7,	%o4,	%l0
	wr	%o5,	0x1007,	%clear_softint
	rdhpr	%htba,	%l3
	rdpr	%tba,	%g3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xB0C, 	%hsys_tick_cmpr
	wrpr	%i1,	%i7,	%cwp
	wr	%g2,	%g7,	%sys_tick
	rdpr	%tba,	%i4
	wr	%i0,	0x1E75,	%ccr
	rdhpr	%htba,	%i5
	wr 	%g0, 	0x6, 	%fprs
	rd	%sys_tick_cmpr,	%o3
	rd	%fprs,	%g6
	wr	%o6,	%g5,	%clear_softint

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%o2,	%l4,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%g4,	0x1326,	%sys_tick
	rd	%ccr,	%i2
	fmovde	%xcc,	%f4,	%f10

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x275, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%o4,	%l0,	%tick
	fmovd	%f0,	%f0
	rdpr	%cansave,	%o5
	rdhpr	%hintp,	%l1
	movvs	%icc,	%l3,	%i6
	edge16l	%l2,	%i1,	%i7
	nop
	set	0x30, %g1
	prefetch	[%l7 + %g1],	 0x3
	subccc	%g2,	%g7,	%g3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xBEF, 	%hsys_tick_cmpr
	rdpr	%tl,	%i4
	rdhpr	%hintp,	%i3
	rdpr	%cleanwin,	%o3
	wr	%g6,	0x155A,	%set_softint
	wr	%g0,	0x19,	%asi
	swapa	[%l7 + 0x74] %asi,	%o6
	rdpr	%pil,	%g1
	wrpr	%o0,	0x1F9B,	%cwp
	rdhpr	%hsys_tick_cmpr,	%g5
	tn	%xcc,	0x0
	fpack16	%f0,	%f14
	rdhpr	%hsys_tick_cmpr,	%o2
	movrne	%l6,	0x0D1,	%l4
	wrpr	%g4,	%o1,	%tick
	rd	%pc,	%i2
	edge16	%o7,	%o4,	%l5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x7F3, 	%hsys_tick_cmpr
	wr	%l1,	%l3,	%pic
	movneg	%icc,	%o5,	%l2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%hintp,	%i6
	rdpr	%cleanwin,	%g2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xE87, 	%hsys_tick_cmpr
	wr	%i0,	%i5,	%clear_softint

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	edge32n	%i3,	%g7,	%g6
	rdpr	%wstate,	%o3
	wr	%g1,	%o0,	%softint
	te	%xcc,	0x5
	fpmerge	%f29,	%f4,	%f8
	tg	%icc,	0x0
	srlx	%o6,	0x0A,	%o2
	wrpr	%l6,	%l4,	%pil
	rd	%fprs,	%g4
	wrpr	%o1,	%i2,	%cwp
	rdhpr	%hsys_tick_cmpr,	%g5
	movvs	%xcc,	%o4,	%l5
	mova	%icc,	%o7,	%l0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xE86, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	xor	%i1,	%i7,	%i6
	wrpr	%g2,	%l3,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x7A1, 	%tick_cmpr
	subccc	%i5,	%i4,	%i3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x11E, 	%hsys_tick_cmpr
	rdpr	%canrestore,	%o3
	movneg	%icc,	%g1,	%o0
	tcc	%xcc,	0x4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%otherwin,	%o2
	tn	%icc,	0x1
	wrpr	%l4,	%l6,	%tick
	bne,a	loop_915
	fmovrslz	%g4,	%f21,	%f2
	rdpr	%tl,	%i2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_915:
	movrlez	%g5,	0x053,	%l5
	set	0x14, %l4
	lduha	[%l7 + %l4] 0x89,	%l0
	rdhpr	%htba,	%o7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	umulcc	%i1,	0x09A3,	%l1
	fmul8ulx16	%f22,	%f22,	%f10
	wrpr	%i6,	%g2,	%tick
	rd	%asi,	%i7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x3B8, 	%hsys_tick_cmpr
	wr	%g0,	0x17,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
	rdpr	%otherwin,	%i5
	xnor	%i4,	%i3,	%g7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xE75, 	%hsys_tick_cmpr
	movcc	%icc,	%g1,	%o0
	rd	%sys_tick_cmpr,	%l3
	rdpr	%canrestore,	%g6
	bne,a	loop_916
	rdhpr	%hintp,	%o2
	tcc	%icc,	0x4
	wr	%o6,	%l4,	%clear_softint
loop_916:
	rdpr	%canrestore,	%l6
	edge16n	%g4,	%i2,	%o4
	wr	%o1,	%l5,	%y
	rd	%asi,	%l0
	rd	%sys_tick_cmpr,	%o7
	popc	0x1D11,	%g5
	wr	%l2,	%o5,	%pic
	xnor	%i1,	%l1,	%i6
	fmul8x16	%f22,	%f30,	%f14
	rd	%y,	%g2
	rd	%tick_cmpr,	%g3
	addcc	%i7,	0x0C21,	%i0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x728, 	%hsys_tick_cmpr
	wrpr	%i5,	0x0200,	%tick
	fpadd16	%f24,	%f30,	%f2
	srl	%i3,	0x0C,	%g7
	rd	%pc,	%o3
	rdhpr	%hintp,	%o0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x398, 	%hsys_tick_cmpr
	rdhpr	%htba,	%l3
	rd	%ccr,	%o2
	rdpr	%otherwin,	%o6
	rdhpr	%htba,	%l6
	fmovdne	%icc,	%f5,	%f17
	edge16	%g4,	%i2,	%o4
	movrne	%l4,	%o1,	%l0
	rdhpr	%hintp,	%o7
	wrpr	%l5,	0x1ABE,	%cwp
	wrpr	%g5,	%l2,	%tick
	fmovdne	%icc,	%f30,	%f4
	rd	%tick_cmpr,	%o5
	tcc	%xcc,	0x0
	fcmpeq16	%f4,	%f18,	%l1
	fmovdcc	%xcc,	%f18,	%f0
	rdpr	%canrestore,	%i1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x887, 	%hsys_tick_cmpr
	wr	%g2,	%g3,	%pic

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fbne,a	%fcc2,	loop_917
	fmovrde	%i5,	%f30,	%f24
	wr	%i3,	0x0550,	%set_softint
	rd	%pc,	%g7
loop_917:
	wrpr	%o3,	0x00DA,	%pil
	fabsd	%f18,	%f30
	edge32l	%o0,	%g1,	%i7
	rdhpr	%hsys_tick_cmpr,	%g6
	srl	%l3,	%o2,	%o6
	orcc	%l6,	0x1B0A,	%i2
	rdpr	%otherwin,	%g4
	addc	%o4,	0x1019,	%l4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x98F, 	%hsys_tick_cmpr
	tpos	%xcc,	0x2
	fpsub32s	%f30,	%f27,	%f27
	edge16ln	%l0,	%l5,	%g5
	wrpr	%l2,	%l1,	%tick
	wrpr	%i1,	0x19E6,	%cwp
	nop
	setx loop_918, %l0, %l1
	jmpl %l1, %o5
	wrpr	%i6,	%g3,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%hsys_tick_cmpr,	%i5
loop_918:
	wr	%i0,	0x158A,	%y
	stx	%g7,	[%l7 + 0x20]
	srax	%o3,	0x16,	%i3
	xorcc	%o0,	%i7,	%g6
	fandnot1	%f28,	%f10,	%f10
	srl	%g1,	%l3,	%o6
	wrpr	%o2,	0x1E73,	%pil
	rdpr	%cansave,	%i2
	rd	%tick_cmpr,	%l6
	fzero	%f4
	brz,a	%o4,	loop_919
	rdhpr	%htba,	%g4
	udivcc	%o1,	0x0846,	%o7
	fmovdvc	%icc,	%f20,	%f23
loop_919:
	fmovspos	%icc,	%f24,	%f6
	fmovrse	%l4,	%f2,	%f15

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x03E, 	%hsys_tick_cmpr
	rd	%y,	%l1
	wrpr	%i1,	0x06CA,	%tick
	rd	%y,	%o5
	rd	%softint,	%l2
	tsubcctv	%g3,	0x194C,	%i6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%g2,	0x07B0,	%cwp
	smulcc	%i0,	0x1342,	%i5
	movrlez	%g7,	0x069,	%i3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x8B2, 	%hsys_tick_cmpr
	edge32	%i7,	%g6,	%l3
	mulscc	%o6,	%g1,	%o2
	membar	0x24
	umul	%l6,	0x15DB,	%i2
	fabss	%f3,	%f12
	tl	%xcc,	0x3
	rdhpr	%hpstate,	%g4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16l	%o4,	%o7,	%o1
	rdpr	%tba,	%l5
	andncc	%l0,	%g5,	%l1
	rd	%fprs,	%l4
	movgu	%icc,	%i1,	%o5
	movrlez	%l2,	0x069,	%g3
	fmovrdgez	%i6,	%f28,	%f10
	fxnor	%f2,	%f14,	%f30
	wrpr	%i4,	%g2,	%pil
	rd	%asi,	%i5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xEAF, 	%hsys_tick_cmpr
	edge32l	%i0,	%o0,	%o3
	fpsub16s	%f21,	%f26,	%f8
	rdpr	%cwp,	%g6
	rd	%fprs,	%l3
	movcc	%xcc,	%o6,	%i7
	wr	%g1,	0x02C7,	%set_softint
	wrpr	%l6,	%o2,	%cwp
	fnands	%f5,	%f11,	%f7
	rd	%asi,	%i2
	wr	%o4,	%g4,	%pic
	sdivcc	%o7,	0x0DAD,	%l5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	rdpr	%pil,	%l0
	wr	%g5,	%l4,	%set_softint
	tleu	%xcc,	0x1
	mulx	%i1,	0x10EA,	%o5
	rdpr	%canrestore,	%l1
	rd	%asi,	%l2
	wrpr	%g3,	%i6,	%pil
	wr 	%g0, 	0x7, 	%fprs
	rd	%pc,	%g2
	brlz,a	%g7,	loop_920
	ble	loop_921
	wr	%i5,	%i0,	%sys_tick
	edge16l	%i3,	%o0,	%o3
loop_920:
	fbo,a	%fcc0,	loop_922
loop_921:
	wrpr	%l3,	%o6,	%cwp
	rdpr	%cleanwin,	%g6
	movrgz	%g1,	0x1D7,	%i7
loop_922:
	rdpr	%cleanwin,	%l6
	rd	%fprs,	%o2
	rdhpr	%htba,	%i2
	orncc	%g4,	%o7,	%l5
	movrgz	%o1,	0x214,	%l0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x7C8, 	%hsys_tick_cmpr
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tleu	%icc,	0x5
	fabss	%f31,	%f1
	movrgz	%l4,	%g5,	%o5
	wrpr	%l1,	0x1EF2,	%pil
	tl	%icc,	0x6
	rd	%sys_tick_cmpr,	%i1
	wrpr	%l2,	0x0409,	%tick
	rd	%asi,	%i6
	fbu	%fcc0,	loop_923
	rdpr	%gl,	%i4
	rdhpr	%htba,	%g3
	udivx	%g2,	0x0352,	%i5
loop_923:
	rdhpr	%hpstate,	%i0
	rd	%fprs,	%g7
	edge8l	%i3,	%o3,	%o0
	wr	%g0,	0x81,	%asi
	stba	%o6,	[%l7 + 0x78] %asi
	ble,pt	%icc,	loop_924
	brlz	%g6,	loop_925
	edge32l	%l3,	%i7,	%l6
	alignaddrl	%o2,	%i2,	%g4
loop_924:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
loop_925:
	nop
	set	0x5C, %o0
	lduha	[%l7 + %o0] 0x11,	%o1
	fbne	%fcc3,	loop_926
	rd	%ccr,	%l5
	fmovsn	%xcc,	%f0,	%f13
	bvs,a,pn	%xcc,	loop_927
loop_926:
	rdpr	%cansave,	%o4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x0F2, 	%hsys_tick_cmpr
	rdhpr	%hintp,	%g5
loop_927:
	edge8	%l1,	%i1,	%l2
	tvs	%icc,	0x4
	wr	%i6,	%i4,	%pic
	srl	%o5,	%g2,	%g3
	fbue	%fcc3,	loop_928
	wrpr	%i0,	0x1199,	%cwp
	set	0x33, %l5
	ldsba	[%l7 + %l5] 0x18,	%g7
loop_928:
	rd	%tick_cmpr,	%i5
	mulx	%i3,	%o3,	%o0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	tl	%xcc,	0x1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xDD9, 	%hsys_tick_cmpr
	movrne	%o2,	0x030,	%o6
	fblg,a	%fcc0,	loop_929
	edge8n	%i2,	%o7,	%g4
	fmovdcs	%xcc,	%f21,	%f28
	fbe	%fcc3,	loop_930
loop_929:
	udivx	%o1,	0x1FED,	%g1
	rd	%tick_cmpr,	%l5
	fbg,a	%fcc0,	loop_931
loop_930:
	rdpr	%cansave,	%l4
	wr	%g0,	0x18,	%asi
	ldsha	[%l7 + 0x74] %asi,	%o4
loop_931:
	wr	%l0,	%l1,	%clear_softint
	rdhpr	%hsys_tick_cmpr,	%i1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x7F7, 	%sys_tick_cmpr
	swap	[%l7 + 0x5C],	%l2
	wr	%i4,	0x0CA7,	%sys_tick
	wr 	%g0, 	0x6, 	%fprs
	tsubcc	%i6,	0x1CE1,	%i0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fpmerge	%f9,	%f5,	%f18
	rd	%tick_cmpr,	%g3
	alignaddrl	%i3,	%i5,	%o0
	bl	loop_932
	rd	%asi,	%o3
	wrpr	%g6,	%i7,	%pil
	wr	%g0,	0x89,	%asi
	swapa	[%l7 + 0x68] %asi,	%l6
loop_932:
	fmovsg	%xcc,	%f10,	%f31
	rd	%y,	%o2
	wr	%g0,	0x11,	%asi
	ldsba	[%l7 + 0x1B] %asi,	%l3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%tba,	%o7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xC68, 	%hsys_tick_cmpr
	fnot2	%f12,	%f30
	wrpr	%g1,	%o4,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%hpstate,	%l4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x09F, 	%hsys_tick_cmpr
	fabss	%f17,	%f26
	wr	%g5,	%l2,	%ccr
	ldub	[%l7 + 0x10],	%i4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x6EF, 	%hsys_tick_cmpr
	fbne,a	%fcc3,	loop_933
	rdpr	%wstate,	%g2
	rdpr	%tl,	%o5
	tleu	%icc,	0x4
loop_933:
	rd	%ccr,	%i0
	andncc	%i6,	%g7,	%g3
	smulcc	%i3,	%o0,	%i5
	rd	%y,	%o3
	wrpr	%g6,	%i7,	%tick
	rd	%pc,	%l6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x5C6, 	%hsys_tick_cmpr
	tvs	%xcc,	0x5
	udiv	%i2,	0x08FA,	%o2
	te	%xcc,	0x7
	wrpr	%o7,	0x198A,	%tick
	fmovdleu	%icc,	%f3,	%f21
	fnegd	%f12,	%f22
	rdhpr	%hpstate,	%g4
	wrpr	%o1,	%l5,	%cwp
	wr	%g1,	%o6,	%pic
	addccc	%o4,	%l4,	%l0
	subcc	%g5,	%i1,	%i4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x56C, 	%hsys_tick_cmpr
	rd	%fprs,	%l1
	movne	%icc,	%g2,	%o5
	tgu	%xcc,	0x4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	orn	%g7,	%g3,	%i0
	fmul8x16	%f14,	%f4,	%f24
	fcmpne16	%f10,	%f6,	%i3
	movpos	%icc,	%o0,	%i5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fmovsvc	%icc,	%f5,	%f10
	wr	%o3,	0x14B9,	%ccr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x549, 	%sys_tick_cmpr
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movre	%i7,	0x398,	%i2
	wrpr	%o2,	0x0302,	%cwp
	brlz	%o7,	loop_934
	andn	%o1,	0x1CD7,	%g4
	rdpr	%otherwin,	%g1
	tle	%xcc,	0x7
loop_934:
	rdpr	%cleanwin,	%l5
	brlez	%o4,	loop_935
	tne	%icc,	0x3
	wrpr	%l4,	0x0EB2,	%tick
	rd	%asi,	%l0
loop_935:
	wr	%g5,	%o6,	%pic
	wrpr	%i4,	%l2,	%cwp
	membar	0x53
	rdpr	%otherwin,	%i1
	wrpr	%l1,	0x1865,	%cwp
	rdhpr	%hsys_tick_cmpr,	%g2
	and	%i6,	%o5,	%g3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xB5D, 	%sys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	mulx	%o0,	%g6,	%i5
	brnz	%l6,	loop_936
	wr	%o3,	%i7,	%set_softint
	rdhpr	%htba,	%i2
	lduh	[%l7 + 0x64],	%l3
loop_936:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x34D, 	%hsys_tick_cmpr
	rdhpr	%hsys_tick_cmpr,	%o1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	membar	0x12
	smulcc	%o4,	0x04F9,	%l4
	fpsub16s	%f23,	%f23,	%f14
	fbge	%fcc2,	loop_937
	wrpr	%l0,	%g4,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_937:
	rd	%tick_cmpr,	%i4
	fcmpgt16	%f18,	%f26,	%i1
	rdpr	%cansave,	%l1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	call	loop_938
	rdpr	%tba,	%g2
	xor	%g7,	%g3,	%i0
	wr 	%g0, 	0x5, 	%fprs
loop_938:
	wrpr	%o0,	%l6,	%cwp
	wr	%i5,	%i7,	%ccr
        wr    %g0,    0xe,    %pcr    ! changed.
	nop
	set	0x2C, %i6
	ldsw	[%l7 + %i6],	%o2
	wr	%g0,	0x11,	%asi
	prefetcha	[%l7 + 0x60] %asi,	 0x1
	umul	%o7,	%o1,	%l5
	tne	%xcc,	0x3
	fmovrde	%g1,	%f8,	%f18

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xEB1, 	%hsys_tick_cmpr
	bne,pn	%icc,	loop_939
	rdhpr	%hpstate,	%l4
	tvs	%icc,	0x0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x239, 	%hsys_tick_cmpr
loop_939:
	wrpr	%l0,	%g5,	%pil
	fble,a	%fcc1,	loop_940
	rd	%pc,	%o6
	rdpr	%tba,	%l2
	rdhpr	%hsys_tick_cmpr,	%i4
loop_940:
	wr	%l1,	0x1D11,	%clear_softint
	edge32l	%i1,	%o5,	%g2
	edge8l	%g7,	%g3,	%i0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	movneg	%icc,	%g6,	%l6
	rdhpr	%hpstate,	%i5
	wr	%i7,	0x16ED,	%pic
	mova	%icc,	%o3,	%o0
	fexpand	%f2,	%f22
	rdhpr	%hpstate,	%i2
	wr	%g0,	0xeb,	%asi
	stha	%l3,	[%l7 + 0x1A] %asi
	membar	#Sync
	wrpr	%o2,	%o7,	%tick
	movgu	%icc,	%o1,	%g1
	rd	%sys_tick_cmpr,	%l5
	fornot2	%f8,	%f24,	%f14
	rdpr	%canrestore,	%l4
	rdpr	%canrestore,	%g4
	rdhpr	%hintp,	%l0
	tcc	%xcc,	0x1
	tcs	%icc,	0x1
	fmovrsne	%o4,	%f18,	%f9
	lduw	[%l7 + 0x78],	%o6
	brlz,a	%l2,	loop_941
	movleu	%icc,	%i4,	%l1
	rdpr	%tl,	%g5
	wrpr	%o5,	%i1,	%tick
loop_941:
	rd	%softint,	%g2
	bvc,a	loop_942
	alignaddr	%g3,	%i0,	%g7
	brgez	%i3,	loop_943
	movcs	%xcc,	%i6,	%l6
loop_942:
	rdhpr	%hsys_tick_cmpr,	%i5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x0ED, 	%hsys_tick_cmpr
loop_943:
	rd	%tick_cmpr,	%i7
	rdpr	%otherwin,	%i2
	movvc	%icc,	%o0,	%l3
	wrpr	%o2,	%o1,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x106, 	%hsys_tick_cmpr
	rd	%y,	%l5
	rd	%softint,	%l4
	wrpr	%l0,	0x170A,	%cwp
	wrpr	%o4,	%o6,	%cwp
	rdpr	%canrestore,	%l2
	edge32l	%g4,	%l1,	%g5
	wrpr	%i4,	%i1,	%cwp
	wrpr	%g2,	0x0AA2,	%cwp
	rdhpr	%htba,	%o5
	flush	%l7 + 0x18
	rd	%tick_cmpr,	%g3
	wr	%g7,	0x044A,	%ccr
	srax	%i3,	0x1A,	%i0
	udivx	%i6,	0x1E9B,	%i5
	wrpr	%l6,	0x015D,	%pil
	xnor	%g6,	0x0D58,	%i7
	wr	%o3,	0x161C,	%pic
	rd	%softint,	%o0
	ldub	[%l7 + 0x1B],	%l3
	wrpr	%o2,	%i2,	%cwp
	rd	%softint,	%o1
	movrgz	%o7,	%l5,	%g1
	rdpr	%pil,	%l4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
        wr    %g0,    0xe,    %pcr    ! changed.
	edge32	%g4,	%l1,	%g5
	orncc	%l0,	%i1,	%i4
	rd	%fprs,	%o5
	rdpr	%pil,	%g3
	addc	%g2,	0x1DD4,	%g7
	ldstub	[%l7 + 0x38],	%i0
	andcc	%i3,	0x0322,	%i5
	rdpr	%cleanwin,	%l6
	wr 	%g0, 	0x4, 	%fprs
	fsrc2s	%f11,	%f20
	rdhpr	%htba,	%o3
	rdpr	%tl,	%g6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	rdhpr	%htba,	%o2
	wrpr	%i2,	%o7,	%pil
	udivx	%o1,	0x0023,	%g1
	rdpr	%pil,	%l5
	wrpr	%o4,	%o6,	%tick
	rd	%sys_tick_cmpr,	%l2
	wr	%l4,	%l1,	%pic
	st	%f21,	[%l7 + 0x54]
	fsrc2	%f12,	%f22
	fsrc2	%f12,	%f8

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%hpstate,	%i1
	movre	%i4,	0x1AE,	%l0
	std	%g2,	[%l7 + 0x50]

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x6F5, 	%hsys_tick_cmpr
	rd	%sys_tick_cmpr,	%g7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x439, 	%sys_tick_cmpr
	taddcctv	%i5,	%l6,	%i6
	membar	#Sync
	set	0x40, %i2
	ldda	[%l7 + %i2] 0x1f,	%f0
	rd	%tick_cmpr,	%i7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%cleanwin,	%o3
	rdhpr	%hsys_tick_cmpr,	%g6
	wrpr	%l3,	0x0122,	%pil
	rdhpr	%hintp,	%o2
	rdhpr	%htba,	%o0
	fbuge,a	%fcc1,	loop_944
	rd	%pc,	%o7
	rd	%y,	%o1
	rdpr	%cansave,	%g1
loop_944:
	edge8l	%l5,	%o4,	%i2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xDD1, 	%hsys_tick_cmpr
	wr 	%g0, 	0x6, 	%fprs
	rdhpr	%htba,	%l1
        wr    %g0,    0xe,    %pcr    ! changed.
	rd	%ccr,	%i1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%hpstate,	%g3
	tneg	%xcc,	0x7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%g0,	0x2a,	%asi
	stxa	%o5,	[%l7 + 0x78] %asi
	membar	#Sync
	wrpr	%g4,	%g7,	%tick
	movre	%i5,	%i3,	%l6
	xnorcc	%i6,	0x14BB,	%i7
	array32	%i0,	%o3,	%l3
	orn	%o2,	%o0,	%o7
	edge16	%o1,	%g1,	%g6
	wrpr	%l5,	%i2,	%cwp
	wr	%o4,	%o6,	%sys_tick
	wr	%l2,	0x1F36,	%softint
	brlz	%l1,	loop_945
	fcmpeq32	%f6,	%f30,	%g5
	rdpr	%wstate,	%i1
        wr    %g0,    0xe,    %pcr    ! changed.
loop_945:
	wr	%i4,	0x0B1D,	%ccr
	rd	%asi,	%g3
	prefetch	[%l7 + 0x6C],	 0x3
	rdpr	%wstate,	%g2
	rd	%fprs,	%o5
	movrlez	%g4,	%l0,	%i5
	rd	%asi,	%g7
	wrpr	%i3,	0x0E02,	%cwp
	fmovda	%xcc,	%f18,	%f3
	wr	%g0,	0x80,	%asi
	ldswa	[%l7 + 0x08] %asi,	%l6
	wr	%i6,	%i7,	%softint
	rd	%ccr,	%o3
	tne	%xcc,	0x3
	movpos	%xcc,	%l3,	%i0
	wr	%o0,	0x1689,	%softint
	bgu	%icc,	loop_946
	fxnors	%f7,	%f11,	%f31
	rdhpr	%hintp,	%o7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_946:
	rdpr	%wstate,	%g1
	movrgz	%g6,	%l5,	%i2
	rdpr	%otherwin,	%o6
	rdhpr	%hpstate,	%o4
	fxors	%f29,	%f27,	%f0
	rdpr	%pil,	%l2
	fpsub16s	%f29,	%f9,	%f11
	fba	%fcc2,	loop_947
	wrpr	%l1,	0x042B,	%tick
	nop
	set	0x10, %l2
	stw	%i1,	[%l7 + %l2]
	edge16l	%l4,	%g5,	%g3
loop_947:
	fmovsle	%xcc,	%f27,	%f11
	rd	%asi,	%g2
	popc	%i4,	%g4
	wr	%g0,	0x19,	%asi
	sta	%f8,	[%l7 + 0x20] %asi
	wrpr	%o5,	%i5,	%tick
	set	0x66, %o7
	lduha	[%l7 + %o7] 0x11,	%g7
	set	0x48, %g7
	ldxa	[%l7 + %g7] 0x81,	%l0
	wr 	%g0, 	0x5, 	%fprs
	move	%icc,	%i6,	%i7
	rdhpr	%hpstate,	%i3
	rd	%fprs,	%o3
	smul	%i0,	0x14FD,	%o0
	sth	%o7,	[%l7 + 0x58]
	set	0x08, %g3
	prefetcha	[%l7 + %g3] 0x10,	 0x2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x2EB, 	%tick_cmpr
	udivcc	%g1,	0x01D7,	%g6
	rdhpr	%hsys_tick_cmpr,	%l5
	set	0x3C, %o2
	ldsha	[%l7 + %o2] 0x11,	%o6
	wrpr	%i2,	%l2,	%pil
	subcc	%o4,	0x18A4,	%l1
	rdhpr	%hsys_tick_cmpr,	%i1
	rdpr	%canrestore,	%l4
	fpadd32s	%f11,	%f7,	%f1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xD1B, 	%hsys_tick_cmpr
	edge32l	%g2,	%i4,	%g4
	smulcc	%o5,	%g7,	%i5
	and	%l0,	0x03AD,	%i6
	rd	%ccr,	%i7
	tl	%icc,	0x6
	fpmerge	%f16,	%f4,	%f8
	rdpr	%tba,	%i3
	rd	%softint,	%l6
	movpos	%icc,	%i0,	%o0
	fmovde	%xcc,	%f20,	%f3
	rdhpr	%hintp,	%o7
	rdhpr	%hintp,	%o3
	wr	%o2,	%o1,	%clear_softint
	rdhpr	%htba,	%l3
	movrgez	%g6,	%g1,	%o6
	bgu,a	loop_948
	wr	%i2,	%l5,	%ccr
	rd	%pc,	%o4
	fbne	%fcc0,	loop_949
loop_948:
	wrpr	%l1,	0x1A3D,	%pil
	edge8l	%l2,	%l4,	%g5
	nop
	setx	loop_950,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_949:
	edge16l	%i1,	%g3,	%i4
	fmul8x16au	%f6,	%f29,	%f10

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xD57, 	%hsys_tick_cmpr
loop_950:
	wrpr	%o5,	0x1B0C,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xDDE, 	%hsys_tick_cmpr
	umul	%i5,	%i6,	%l0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%hintp,	%i3
	edge32ln	%i0,	%l6,	%o7
	subcc	%o3,	0x16FA,	%o2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr 	%g0, 	0x6, 	%fprs

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	swap	[%l7 + 0x78],	%g6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%htba,	%i2
	call	loop_951
	orn	%l5,	%o4,	%l1
	rdpr	%cansave,	%l4
	srl	%g5,	0x0D,	%i1
loop_951:
	edge16n	%l2,	%i4,	%g3
	wrpr	%o5,	0x1467,	%cwp
	rdpr	%canrestore,	%g2
	fmovdle	%xcc,	%f8,	%f7
	brlez,a	%g7,	loop_952
	rd	%ccr,	%g4
	tvs	%xcc,	0x7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_952:
	rd	%y,	%i7
        wr    %g0,    0xe,    %pcr    ! changed.
	taddcctv	%i0,	%l6,	%o7
	edge16ln	%o3,	%o2,	%i5
	add	%o0,	%l3,	%g6
	smul	%o1,	%g1,	%i2
	wrpr	%o6,	0x010A,	%pil
	tl	%xcc,	0x1
	rdpr	%tba,	%l5
	rdpr	%gl,	%l1
	rd	%pc,	%o4
	fsrc1	%f2,	%f14
	rdhpr	%htba,	%l4
	wrpr	%g5,	0x0180,	%tick
	rdhpr	%hsys_tick_cmpr,	%l2
	rdhpr	%hintp,	%i4
	rd	%asi,	%i1
	movrne	%g3,	%o5,	%g2
	rdhpr	%hsys_tick_cmpr,	%g7
	rdhpr	%htba,	%g4
	bvc,a	loop_953
	rd	%softint,	%l0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x66C, 	%hsys_tick_cmpr
	fabsd	%f30,	%f26
loop_953:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	and	%i0,	0x107C,	%l6
	fcmple32	%f14,	%f14,	%o7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x5E1, 	%hsys_tick_cmpr
	wrpr	%i5,	%o3,	%cwp
	movne	%xcc,	%o0,	%l3
	rdpr	%cleanwin,	%g6
	rdhpr	%hpstate,	%g1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	movrlz	%l5,	%l1,	%o6
	tge	%xcc,	0x2
	fmul8x16au	%f31,	%f13,	%f22
	fcmple32	%f10,	%f18,	%l4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	wrpr	%l2,	0x0CFE,	%cwp
	wr	%o4,	0x18B5,	%clear_softint
        wr    %g0,    0xe,    %pcr    ! changed.
	rdpr	%otherwin,	%i1
	tne	%icc,	0x0
	wr	%g3,	%g2,	%ccr
	tpos	%icc,	0x0
	movle	%icc,	%o5,	%g7
	wr	%g0,	0x18,	%asi
	lduha	[%l7 + 0x54] %asi,	%g4
	ldstub	[%l7 + 0x13],	%i6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%hpstate,	%i3
	wrpr	%l6,	0x01D4,	%cwp
	fpadd16	%f16,	%f20,	%f4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%tick_cmpr,	%i5
	wrpr	%o2,	0x127C,	%tick
	wrpr	%o0,	0x0F14,	%pil
	rd	%ccr,	%l3
	wr	%g6,	0x01BE,	%sys_tick
	rd	%sys_tick_cmpr,	%o3
	wr	%g1,	%o1,	%y
	movne	%icc,	%i2,	%l5
	wrpr	%o6,	0x1E2D,	%tick
	rdhpr	%hintp,	%l4
	movleu	%xcc,	%l1,	%l2
	rd	%tick_cmpr,	%o4
	fble,a	%fcc0,	loop_954
	rdpr	%tl,	%g5
	rd	%ccr,	%i1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x01C, 	%hsys_tick_cmpr
loop_954:
	tl	%icc,	0x3
	rdpr	%wstate,	%i4
	sth	%g2,	[%l7 + 0x10]
	stb	%o5,	[%l7 + 0x2F]
	fcmped	%fcc2,	%f2,	%f28
	fmovdne	%xcc,	%f23,	%f11
	edge8ln	%g7,	%i6,	%g4
	nop
	setx	loop_955,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movleu	%xcc,	%l0,	%i3
	rdhpr	%hpstate,	%l6
	wrpr	%o7,	0x0096,	%cwp
loop_955:
	rdhpr	%hsys_tick_cmpr,	%i7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xE98, 	%tick_cmpr
	brnz	%o0,	loop_956
	rd	%asi,	%l3
	rdhpr	%htba,	%g6
	wr	%o3,	0x078E,	%y
loop_956:
	rdhpr	%hsys_tick_cmpr,	%o1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x37F, 	%hsys_tick_cmpr
	rdhpr	%hpstate,	%l5
	rdpr	%otherwin,	%o6
	rd	%softint,	%l1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x47A, 	%hsys_tick_cmpr
	edge16ln	%o4,	%g5,	%g3
	movcc	%icc,	%i1,	%i4
	rd	%softint,	%o5
	rd	%asi,	%g2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	udivcc	%g4,	0x0422,	%i3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fble,a	%fcc1,	loop_957
	wrpr	%l0,	%i7,	%tick
	wrpr	%i0,	0x0111,	%pil
	popc	%i5,	%o2
loop_957:
	rd	%ccr,	%o0
	srl	%g6,	%l3,	%o3
	movle	%icc,	%g1,	%i2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movvs	%icc,	%l5,	%o1
	wr	%l1,	0x0B91,	%y
	move	%icc,	%l2,	%l4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xE49, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%o4,	0x14CE,	%pic
	tleu	%xcc,	0x0
	udiv	%i1,	0x146F,	%o5
	fsrc1s	%f5,	%f1
	rd	%tick_cmpr,	%i4
	wr	%i6,	0x0B96,	%y
	wrpr	%g2,	0x10B4,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	popc	0x0150,	%i3
	rd	%y,	%g4
	bn	%xcc,	loop_958
	sdiv	%o7,	0x0DBB,	%l0
	rdpr	%gl,	%i7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x22D, 	%hsys_tick_cmpr
loop_958:
	swap	[%l7 + 0x10],	%o2
	and	%i5,	%g6,	%l3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%hintp,	%o0
	rd	%fprs,	%g1
	udivx	%l5,	0x0756,	%i2
	rdhpr	%htba,	%l1
	wrpr	%o1,	%l4,	%tick
	fpadd32	%f10,	%f30,	%f30
	add	%l7,	0x10,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%l2,	%g5
	rd	%y,	%o6
	rdhpr	%htba,	%g3
	xnorcc	%i1,	0x0255,	%o5
	rd	%ccr,	%o4
	movrlz	%i4,	0x1C9,	%i6
	rdpr	%tl,	%g2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x54C, 	%hsys_tick_cmpr
	tvs	%xcc,	0x4
	rd	%pc,	%g4
	wrpr	%o7,	0x1798,	%pil
	rdhpr	%hintp,	%g7
	fmovrdgez	%i7,	%f16,	%f2
	wrpr	%l0,	%i0,	%tick
	movre	%o2,	0x1F2,	%l6
	srl	%g6,	%i5,	%o3
	rdhpr	%hsys_tick_cmpr,	%l3
	wrpr	%g1,	%l5,	%pil
	rdhpr	%hsys_tick_cmpr,	%i2
        wr    %g0,    0xe,    %pcr    ! changed.

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x958, 	%hsys_tick_cmpr
	fabsd	%f14,	%f6
	rdhpr	%htba,	%o1
	rdpr	%otherwin,	%l2
	wr	%g0,	0x23,	%asi
	stda	%o6,	[%l7 + 0x10] %asi
	membar	#Sync
	tleu	%xcc,	0x4
	tgu	%icc,	0x3
	edge16n	%g5,	%i1,	%o5
	fbul	%fcc2,	loop_959
	wr	%o4,	0x12DF,	%clear_softint
	wrpr	%g3,	0x17FC,	%pil
	nop
	set	0x6C, %g5
	lduw	[%l7 + %g5],	%i4
loop_959:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%g2,	%g4,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xA2F, 	%hsys_tick_cmpr
	rdhpr	%htba,	%g7
	wr	%l0,	0x1B74,	%softint
	wrpr	%i0,	0x094D,	%tick
	andncc	%o2,	%l6,	%i7
	wrpr	%i5,	0x04DB,	%tick
	rdpr	%canrestore,	%g6
	ldub	[%l7 + 0x24],	%l3
	rd	%softint,	%g1
	tne	%xcc,	0x0
	andcc	%o3,	0x0845,	%i2
	fexpand	%f23,	%f14
	wrpr	%l1,	%o0,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	ble,a	%xcc,	loop_960
	rdpr	%wstate,	%l2
	rdhpr	%htba,	%l4
	movcs	%xcc,	%o6,	%i1
loop_960:
	wr	%g5,	0x0EE0,	%y

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	bvc	%xcc,	loop_961
	movleu	%icc,	%i4,	%o4
	mulscc	%i6,	0x1B2B,	%i3
	wrpr	%g4,	%g2,	%cwp
loop_961:
	wrpr	%g7,	%l0,	%cwp
	rdpr	%tba,	%o7
	wrpr	%o2,	0x193D,	%tick
	wr	%i0,	%i7,	%pic

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x7DA, 	%hsys_tick_cmpr
	wrpr	%l6,	%l3,	%tick
	tvc	%icc,	0x1
	fpadd16	%f24,	%f20,	%f0
	rd	%tick_cmpr,	%g1
	rd	%y,	%g6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	movcc	%xcc,	%o3,	%l1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x56F, 	%sys_tick_cmpr
	fone	%f6
	wrpr	%l2,	%l4,	%cwp
	move	%xcc,	%o6,	%o1
	fmul8x16	%f17,	%f30,	%f2
	wrpr	%g5,	0x07F1,	%cwp
	brnz	%i1,	loop_962
        wr    %g0,    0xe,    %pcr    ! changed.
	rdhpr	%hpstate,	%o4
	andncc	%i4,	%i3,	%i6
loop_962:
	andcc	%g2,	%g7,	%g4
	rdpr	%wstate,	%o7
	array8	%l0,	%i0,	%i7
	brlez	%o2,	loop_963
	fnot1s	%f18,	%f20
	rdpr	%cansave,	%i5
	srlx	%l3,	0x1A,	%g1
loop_963:
	rdhpr	%hsys_tick_cmpr,	%l6
	edge8	%i2,	%o3,	%g6
	rdhpr	%hsys_tick_cmpr,	%l5
	rdpr	%cleanwin,	%l1
	wr	%o0,	%l2,	%pic
	rdhpr	%hintp,	%o6
	xnorcc	%o1,	%g5,	%l4
	rdhpr	%hintp,	%i1
	rdhpr	%hsys_tick_cmpr,	%o5
	movn	%xcc,	%o4,	%g3
	wr 	%g0, 	0x7, 	%fprs
	mulx	%i4,	%g2,	%g4
	wrpr	%o7,	%g7,	%tick
	wrpr	%l0,	%i7,	%cwp
	rdhpr	%hsys_tick_cmpr,	%o2
	ldd	[%l7 + 0x70],	%i4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bpos	%xcc,	loop_964
	wrpr	%l3,	0x1BC5,	%pil
	stb	%i0,	[%l7 + 0x21]
	wrpr	%g1,	%l6,	%pil
loop_964:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	movvs	%icc,	%g6,	%l5
	wr	%o0,	%l2,	%set_softint
	subcc	%l1,	0x1DAC,	%o6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xD6A, 	%hsys_tick_cmpr
	and	%o1,	%l4,	%i1
	wrpr	%o4,	0x19F9,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%hintp,	%i3
	fmovda	%xcc,	%f17,	%f9
	rdpr	%cansave,	%o5
	rd	%sys_tick_cmpr,	%i6
	wrpr	%i4,	%g4,	%tick
	tneg	%xcc,	0x7
	wr	%g2,	%o7,	%sys_tick
	wrpr	%g7,	0x14B1,	%tick
	wr	%i7,	%l0,	%ccr
	rdhpr	%htba,	%o2
	rd	%pc,	%i5
	sethi	0x1AA0,	%l3
	rdhpr	%htba,	%i0
	brlez	%l6,	loop_965
	rdhpr	%hpstate,	%o3
	rdpr	%tl,	%g1
	fone	%f22
loop_965:
	rdhpr	%hpstate,	%i2
	fmovsn	%icc,	%f22,	%f11
	movge	%icc,	%l5,	%g6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr 	%g0, 	0x4, 	%fprs
	fcmpd	%fcc2,	%f10,	%f28
	stb	%l1,	[%l7 + 0x20]
	rd	%y,	%g5
	move	%xcc,	%o1,	%l4
	stb	%i1,	[%l7 + 0x46]
	wr	%o4,	0x14E3,	%sys_tick
	movneg	%xcc,	%o6,	%i3
	fornot1	%f2,	%f30,	%f14
	movle	%xcc,	%o5,	%g3
	edge32n	%i6,	%g4,	%i4
	rdhpr	%htba,	%g2
	fmovsvc	%icc,	%f9,	%f20
	rdhpr	%htba,	%g7
	bl,a,pn	%xcc,	loop_966
	rd	%asi,	%o7
	rdhpr	%htba,	%l0
	wr	%o2,	%i5,	%sys_tick
loop_966:
	rdhpr	%hsys_tick_cmpr,	%i7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%cansave,	%i0
	rdhpr	%htba,	%o3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x479, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%fprs,	%l2
	fmuld8sux16	%f11,	%f2,	%f4
	orn	%l5,	0x0F30,	%l1
	membar	0x17

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%fprs,	%o1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xDB1, 	%hsys_tick_cmpr
	fbuge	%fcc0,	loop_967
	bge,a	%xcc,	loop_968
	fmovsgu	%xcc,	%f15,	%f17
	wrpr	%o0,	%o6,	%tick
loop_967:
	wr	%o4,	0x016F,	%y
loop_968:
	orncc	%o5,	0x1743,	%g3
	rdhpr	%htba,	%i3
	srl	%i6,	0x12,	%g4
	fornot1	%f14,	%f0,	%f28
	movpos	%icc,	%g2,	%i4
	udiv	%o7,	0x174A,	%l0
	rdpr	%tl,	%o2
	rd	%softint,	%g7
	rdhpr	%htba,	%i5
	mova	%xcc,	%l3,	%l6
	rdhpr	%hsys_tick_cmpr,	%i0
	wr	%o3,	0x10C3,	%clear_softint
	rd	%sys_tick_cmpr,	%i7
	set	0x52, %i4
	ldsba	[%l7 + %i4] 0x80,	%i2
	rdhpr	%hpstate,	%g1
	rdhpr	%hsys_tick_cmpr,	%g6
	rd	%y,	%l5
	rdpr	%pil,	%l2
	andncc	%g5,	%o1,	%l4
	wrpr	%i1,	0x0354,	%pil
	wr	%l1,	%o0,	%clear_softint
	bl,a,pn	%xcc,	loop_969
	subc	%o4,	0x1BD5,	%o5
	rdhpr	%hintp,	%g3
	rdpr	%tba,	%i3
loop_969:
	nop
	setx	loop_970,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movgu	%icc,	%o6,	%g4
	rdpr	%tba,	%g2
	sub	%i4,	0x0031,	%i6
loop_970:
	fpack16	%f24,	%f29
	alignaddr	%l0,	%o2,	%g7
	fbn,a	%fcc1,	loop_971
	rdpr	%tba,	%i5
	fnot1s	%f21,	%f23
	nop
	setx	loop_972,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_971:
	edge8n	%l3,	%l6,	%o7
	rdhpr	%htba,	%o3
	edge32	%i0,	%i2,	%i7
loop_972:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x02E, 	%hsys_tick_cmpr
	fmovsg	%xcc,	%f9,	%f28

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x463, 	%sys_tick_cmpr
	rdhpr	%hpstate,	%g5
	array8	%i1,	%o0,	%l1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	rdhpr	%hpstate,	%o4
	tvs	%xcc,	0x6
	rd	%sys_tick_cmpr,	%g3
	udiv	%i3,	0x1181,	%o6
	wr	%o5,	%g2,	%sys_tick
	wr	%i4,	0x00E1,	%sys_tick
	fbl,a	%fcc0,	loop_973
	fmovrdgz	%i6,	%f0,	%f12
	rdhpr	%hintp,	%g4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_973:
	wrpr	%l0,	%o2,	%tick
	rdhpr	%hsys_tick_cmpr,	%g7
	rdpr	%pil,	%l3
	wrpr	%i5,	0x1B32,	%cwp
	rdhpr	%hintp,	%l6
	rdpr	%gl,	%o3
	rd	%sys_tick_cmpr,	%i0
	rd	%ccr,	%o7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x8A8, 	%hsys_tick_cmpr
	fmovrdgez	%i7,	%f2,	%f28
	fmovda	%xcc,	%f6,	%f14
	edge32l	%l5,	%g1,	%g6
	movcc	%icc,	%o1,	%l4
	movcs	%xcc,	%l2,	%i1
	wr	%g5,	%l1,	%softint
	rd	%asi,	%o0
	movneg	%icc,	%o4,	%i3
	sdivx	%o6,	0x0966,	%o5
	umulcc	%g2,	0x1EE2,	%g3
	lduh	[%l7 + 0x4C],	%i6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	movcs	%icc,	%i4,	%o2
	rdpr	%cwp,	%l0
	rdpr	%wstate,	%l3
	wrpr	%i5,	0x0E6A,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x3BA, 	%hsys_tick_cmpr
	rdhpr	%hsys_tick_cmpr,	%o3
	fmovdvs	%xcc,	%f7,	%f22
	rdpr	%cwp,	%l6
	tne	%icc,	0x3
	edge16	%i0,	%i2,	%i7
	wr	%l5,	0x0087,	%clear_softint
	fornot1s	%f21,	%f6,	%f24
	or	%o7,	0x008A,	%g6
	movrne	%g1,	0x096,	%l4
	sdiv	%o1,	0x0A32,	%i1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	umulcc	%l1,	%o0,	%o4
!Yo - got one - imm_asi 0x52 
!And yo - immediate is 0x210
	set	0x210, %l1
	stxa	%o6,	[%g0 + %l1] 0x52
	wr 	%g0, 	0x4, 	%fprs
	rdhpr	%htba,	%g2
	rd	%asi,	%g3
	mova	%xcc,	%i3,	%i6
	rd	%tick_cmpr,	%g4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x371, 	%hsys_tick_cmpr
	mova	%icc,	%i4,	%l0
	nop
	setx loop_974, %l0, %l1
	jmpl %l1, %l3
	rdpr	%cansave,	%g7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	ble	loop_975
loop_974:
	rdhpr	%hpstate,	%o3
	andncc	%i0,	%i2,	%l5
	rdpr	%wstate,	%i7
loop_975:
	xorcc	%g6,	0x0B1A,	%g1
	sth	%o7,	[%l7 + 0x1E]
	wrpr	%o1,	0x03A1,	%pil
	wr	%g0,	0x88,	%asi
	ldda	[%l7 + 0x30] %asi,	%i0
	rd	%fprs,	%g5
	rd	%fprs,	%l4
	st	%f17,	[%l7 + 0x20]
	rdpr	%canrestore,	%l1
	orncc	%o0,	%o4,	%l2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	udiv	%g2,	0x11E6,	%i3
	rdhpr	%htba,	%i6
	fbl,a	%fcc1,	loop_976
	nop
	setx	loop_977,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	edge32ln	%g3,	%g4,	%o2
	and	%l0,	0x169C,	%l3
loop_976:
	movn	%icc,	%i4,	%i5
loop_977:
	rd	%ccr,	%l6
	fmovrdne	%g7,	%f20,	%f6
	rd	%fprs,	%o3
	wr	%g0,	0x04,	%asi
	ldswa	[%l7 + 0x58] %asi,	%i0
	rd	%y,	%l5
	fornot2s	%f23,	%f1,	%f1
	rd	%ccr,	%i7
	rdpr	%gl,	%i2
	array8	%g1,	%o7,	%o1
	rd	%ccr,	%i1
	wr	%g5,	%g6,	%set_softint
	movre	%l4,	%o0,	%l1
	rdhpr	%htba,	%l2
	wrpr	%o5,	0x0232,	%cwp
	wrpr	%o4,	%g2,	%tick
	brlz	%i3,	loop_978
	bl,a,pn	%icc,	loop_979
	alignaddrl	%i6,	%o6,	%g4
	rdhpr	%hintp,	%o2
loop_978:
	rdhpr	%hintp,	%g3
loop_979:
	movrgz	%l3,	%i4,	%l0
	tn	%icc,	0x5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x6E3, 	%hsys_tick_cmpr
	orcc	%o3,	0x168B,	%g7
	subcc	%i0,	0x0651,	%i7
	rd	%sys_tick_cmpr,	%l5
	ble,pn	%icc,	loop_980
	xorcc	%g1,	%i2,	%o7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x8B3, 	%hsys_tick_cmpr
	wrpr	%g6,	%g5,	%cwp
loop_980:
	wr	%l4,	0x1296,	%clear_softint
	alignaddrl	%o0,	%l2,	%l1
	fbuge,a	%fcc0,	loop_981
	wrpr	%o5,	0x048E,	%cwp
	rdpr	%cansave,	%o4
	rdhpr	%htba,	%i3
loop_981:
	fcmpeq16	%f4,	%f24,	%g2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x024, 	%hsys_tick_cmpr
	fnegs	%f15,	%f16
	wrpr	%o2,	%i6,	%tick
	std	%f28,	[%l7 + 0x28]
	fmovsn	%xcc,	%f21,	%f3
	movrgz	%l3,	0x1E9,	%i4
	rdpr	%canrestore,	%g3
	rdhpr	%hpstate,	%l0
	wrpr	%i5,	%l6,	%cwp
	rd	%pc,	%g7
	rd	%y,	%i0
	rdhpr	%hpstate,	%o3
	tn	%icc,	0x0
	rd	%pc,	%l5
	rdhpr	%hintp,	%g1
	wrpr	%i7,	0x18DB,	%tick
	fnegs	%f2,	%f11
	wrpr	%i2,	0x02E0,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	wrpr	%o1,	%g6,	%cwp
	tvc	%xcc,	0x7
	fnegd	%f22,	%f0
	ldub	[%l7 + 0x1F],	%i1
	bn,a	%icc,	loop_982
	rdpr	%wstate,	%g5
	tpos	%xcc,	0x0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_982:
	rdpr	%cwp,	%l2
	rdpr	%gl,	%o5
	fandnot2	%f6,	%f24,	%f0
	rdpr	%gl,	%l1
	rdpr	%tba,	%i3
	wrpr	%g2,	%o6,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xB7D, 	%tick_cmpr
	rdpr	%pil,	%o2
	fmovrslez	%i6,	%f0,	%f4
	umul	%i4,	%g3,	%l3
	wrpr	%i5,	0x0235,	%tick
	movne	%icc,	%l6,	%l0
	st	%f12,	[%l7 + 0x50]
	rd	%ccr,	%g7
	wrpr	%o3,	%i0,	%tick
	rdpr	%pil,	%g1
	fornot1	%f18,	%f30,	%f10
	wrpr	%i7,	%i2,	%tick
	lduw	[%l7 + 0x64],	%o7
	fmovsneg	%icc,	%f4,	%f24
	rdpr	%cleanwin,	%l5
        wr    %g0,    0xe,    %pcr    ! changed.
	wrpr	%g5,	0x0E7D,	%pil
	rd	%ccr,	%l4
	fandnot1	%f8,	%f6,	%f30
	rd	%softint,	%g6
	pdist	%f22,	%f22,	%f28
	rd	%tick_cmpr,	%o0
	fmovrdne	%l2,	%f6,	%f26
	rdhpr	%hsys_tick_cmpr,	%l1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xBFA, 	%hsys_tick_cmpr
	wr	%g0,	0x11,	%asi
	ldsba	[%l7 + 0x18] %asi,	%g2
	wr	%o6,	0x0E54,	%pic
	brlez,a	%o5,	loop_983
	wrpr	%g4,	0x1620,	%cwp
	bn	%xcc,	loop_984
	movne	%xcc,	%o2,	%i6
loop_983:
	srl	%i4,	0x08,	%o4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xF49, 	%hsys_tick_cmpr
loop_984:
	wrpr	%l6,	0x0F10,	%pil
	rdhpr	%htba,	%l0
	wr	%g3,	%o3,	%set_softint

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x3A6, 	%hsys_tick_cmpr
	sub	%g7,	%g1,	%i2
	rdpr	%tl,	%i7
	wr	%g0,	0x89,	%asi
	lduha	[%l7 + 0x4C] %asi,	%l5
	rdhpr	%htba,	%o7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xC69, 	%hsys_tick_cmpr
	rdhpr	%hintp,	%g5
	wrpr	%g6,	%l4,	%tick
	rdpr	%cleanwin,	%o0
	rdpr	%cansave,	%l2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fexpand	%f5,	%f10

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%ccr,	%g2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xA87, 	%tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x02B, 	%hsys_tick_cmpr
	rdhpr	%htba,	%o2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%i6,	%o4,	%set_softint
	edge8ln	%i4,	%l3,	%l6
	te	%icc,	0x4
	wrpr	%i5,	%g3,	%pil
	wrpr	%l0,	%i0,	%pil
	rd	%tick_cmpr,	%o3
	fblg,a	%fcc0,	loop_985
	fbul,a	%fcc1,	loop_986
	rd	%softint,	%g7
	rdpr	%canrestore,	%i2
loop_985:
	fandnot1s	%f24,	%f25,	%f22
loop_986:
	fmul8sux16	%f10,	%f2,	%f12
	fsrc2s	%f8,	%f18
	wrpr	%i7,	0x1960,	%cwp
	rdhpr	%hpstate,	%g1
	sub	%l5,	0x08FE,	%i1
	addcc	%o7,	%o1,	%g5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	brz	%o0,	loop_987
	movg	%icc,	%i3,	%l2
	fmovd	%f14,	%f26
	rdpr	%otherwin,	%g2
loop_987:
	fnot1s	%f21,	%f10
	fpadd16s	%f4,	%f6,	%f2
	rdpr	%tl,	%o6
	sllx	%o5,	%o2,	%g4
	wrpr	%l1,	%o4,	%tick
	fmovdvc	%icc,	%f15,	%f6
	rd	%fprs,	%i6
	rdhpr	%hsys_tick_cmpr,	%i4
	fandnot1s	%f8,	%f14,	%f31
	bl,a,pn	%xcc,	loop_988
	mulscc	%l6,	0x1DBF,	%i5
	wr	%g0,	0x89,	%asi
	stha	%l3,	[%l7 + 0x0E] %asi
loop_988:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x1F5, 	%sys_tick_cmpr
	bgu,pn	%xcc,	loop_989
	wrpr	%l0,	%i0,	%tick
	rdpr	%wstate,	%o3
	fbg,a	%fcc2,	loop_990
loop_989:
	tge	%xcc,	0x6
	add	%l7,	0x28,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%g7,	%i7
loop_990:
	array8	%g1,	%i2,	%i1
	rd	%pc,	%l5
	rd	%asi,	%o7
	tneg	%icc,	0x1
	bgu,a,pn	%xcc,	loop_991
	wrpr	%o1,	%g6,	%tick
	rdhpr	%htba,	%l4
	rd	%fprs,	%o0
loop_991:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	tg	%xcc,	0x5
	rdpr	%tl,	%l2
	sllx	%g2,	%o6,	%o5
	move	%xcc,	%g5,	%o2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x2D5, 	%hsys_tick_cmpr
	bcs,a,pt	%xcc,	loop_992
	fmovsleu	%icc,	%f21,	%f23
	tleu	%xcc,	0x5
	wr	%l1,	%i6,	%y
loop_992:
	fbn	%fcc2,	loop_993
	tle	%xcc,	0x6
	rdpr	%pil,	%i4
	tne	%icc,	0x5
loop_993:
	rdhpr	%htba,	%o4
	rdhpr	%htba,	%i5
	rdhpr	%hpstate,	%l3
	faligndata	%f22,	%f24,	%f16

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr 	%g0, 	0x7, 	%fprs
	rdpr	%cansave,	%o3
	rd	%pc,	%l0
	rdpr	%gl,	%i7
	wr	%g7,	%i2,	%softint
	fmovdcc	%xcc,	%f0,	%f18
	rdhpr	%htba,	%i1
	ble,a,pn	%xcc,	loop_994
	wrpr	%l5,	0x07BD,	%tick
	ldd	[%l7 + 0x78],	%f28
	fcmps	%fcc1,	%f27,	%f15
loop_994:
	rd	%ccr,	%g1
	pdist	%f30,	%f16,	%f26
	wrpr	%o7,	%o1,	%cwp
	wrpr	%g6,	%o0,	%tick
	rdpr	%tl,	%l4
	fzeros	%f29
	wr	%i3,	0x10F6,	%pic
	nop
	setx	loop_995,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	orn	%g2,	0x170F,	%o6
	smul	%o5,	%l2,	%g5
	rdhpr	%hintp,	%g4
loop_995:
	subc	%o2,	%l1,	%i4
	wrpr	%o4,	%i6,	%pil
	fsrc1s	%f8,	%f30
	rd	%y,	%l3
	nop
	set	0x1C, %o3
	lduw	[%l7 + %o3],	%i5
	subcc	%g3,	0x0B11,	%l6
	wrpr	%i0,	0x1C13,	%tick
	wrpr	%l0,	0x07B9,	%tick
	wrpr	%i7,	%g7,	%cwp
	rdpr	%otherwin,	%o3
	wr	%g0,	0x11,	%asi
	ldsba	[%l7 + 0x19] %asi,	%i2
	wrpr	%i1,	%g1,	%pil
	andcc	%o7,	%l5,	%o1
	wr	%g0,	0x04,	%asi
	ldsha	[%l7 + 0x52] %asi,	%g6
	rdpr	%cansave,	%l4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xA72, 	%hsys_tick_cmpr
	orcc	%o0,	%o6,	%o5
	and	%g5,	%l2,	%g4
	rdhpr	%hpstate,	%l1
	sra	%o2,	%o4,	%i4
	wr	%i6,	0x07EB,	%clear_softint
	rdhpr	%hpstate,	%i5
	smul	%l3,	%l6,	%g3
	wrpr	%l0,	%i7,	%tick
	rdpr	%otherwin,	%i0
	array16	%g7,	%i2,	%i1
	movvc	%xcc,	%o3,	%o7
	bcc,pn	%xcc,	loop_996
	rdpr	%cwp,	%g1
	wrpr	%l5,	%g6,	%cwp
	tleu	%icc,	0x4
loop_996:
	wr	%l4,	%i3,	%set_softint
	wr 	%g0, 	0x7, 	%fprs

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x0B5, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	addccc	%o5,	0x1D2F,	%l2
	wr 	%g0, 	0x7, 	%fprs
	rdpr	%gl,	%l1
	wrpr	%o2,	0x0DE5,	%cwp
	rd	%y,	%o4
	edge8l	%i4,	%g5,	%i6
	add	%l3,	%i5,	%l6
	wrpr	%g3,	%l0,	%cwp
	xnor	%i0,	%i7,	%g7
	rdhpr	%hintp,	%i1
	rd	%sys_tick_cmpr,	%i2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x2FE, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xE1F, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xAC5, 	%tick_cmpr
	wrpr	%i3,	%l4,	%pil
	fmul8x16	%f18,	%f30,	%f26
	wr	%o0,	%o6,	%y
	tpos	%xcc,	0x1
	rdpr	%otherwin,	%o1
	rd	%tick_cmpr,	%g2
	wrpr	%l2,	%g4,	%pil
	wr	%l1,	0x083F,	%y
	rd	%ccr,	%o2
	xnorcc	%o5,	0x0197,	%i4
	xor	%o4,	%g5,	%l3
	wrpr	%i6,	0x0F4A,	%tick
	rd	%sys_tick_cmpr,	%i5
	mova	%icc,	%g3,	%l0
	rd	%fprs,	%i0
	rdpr	%cleanwin,	%i7
	rdhpr	%hpstate,	%g7
	wrpr	%l6,	0x0186,	%cwp
	rd	%tick_cmpr,	%i2
	rdhpr	%hintp,	%o7
	wrpr	%g1,	0x0D6D,	%pil
	rdhpr	%hpstate,	%o3
	fbul	%fcc1,	loop_997
	rdpr	%cansave,	%i1
	rd	%ccr,	%g6
	edge16	%i3,	%l4,	%l5
loop_997:
	fmovsleu	%xcc,	%f4,	%f23
	wr	%o6,	%o0,	%sys_tick
	wrpr	%g2,	%o1,	%tick
	rdhpr	%hsys_tick_cmpr,	%g4
	umul	%l1,	%l2,	%o2
	ta	%icc,	0x2
	wrpr	%o5,	0x0730,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xD78, 	%hsys_tick_cmpr
	rdpr	%cwp,	%l3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xA52, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xF91, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x9D9, 	%hsys_tick_cmpr
	rdhpr	%htba,	%g7
	fmovsg	%icc,	%f11,	%f1
	udivcc	%l6,	0x04E5,	%i7
	rdhpr	%htba,	%o7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xD1A, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	fmovsleu	%xcc,	%f6,	%f19
	fmovrdgez	%i1,	%f4,	%f26
	nop
	set	0x57, %o1
	stb	%i3,	[%l7 + %o1]
	tvc	%xcc,	0x2
	rdhpr	%hintp,	%l4
	edge16n	%g6,	%l5,	%o6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xB6D, 	%sys_tick_cmpr
	fbn,a	%fcc0,	loop_998
	xor	%g4,	0x094E,	%o0
	xnor	%l1,	0x05B9,	%l2
	rdhpr	%hintp,	%o2
loop_998:
	add	%o5,	0x1F26,	%g5
	rd	%sys_tick_cmpr,	%o4
	rdpr	%otherwin,	%i6
	wr	%l3,	%i5,	%clear_softint

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fpadd32s	%f23,	%f21,	%f0
	and	%l0,	%g7,	%l6
	wrpr	%i7,	%i2,	%tick
	lduh	[%l7 + 0x6C],	%g1
	andcc	%o7,	0x1C0A,	%o3
	wrpr	%i1,	%i3,	%pil
	prefetch	[%l7 + 0x4C],	 0x0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr 	%g0, 	0x6, 	%fprs
	rd	%tick_cmpr,	%g2
	fmovsne	%icc,	%f7,	%f4
	rd	%sys_tick_cmpr,	%l4
	movvc	%icc,	%o1,	%o0
	rdhpr	%htba,	%l1
	orcc	%l2,	%o2,	%g4
	rdpr	%tl,	%g5
	wrpr	%o4,	%o5,	%tick
	fmovrdgz	%i6,	%f4,	%f22
	rdpr	%cwp,	%i5
	rd	%pc,	%g3
	wr	%i4,	0x1AD9,	%set_softint
	wr	%i0,	%l3,	%softint
	rdpr	%cansave,	%l0
	wrpr	%l6,	%i7,	%cwp
	rdhpr	%hsys_tick_cmpr,	%i2
	wr	%g1,	0x0C79,	%sys_tick
	rdpr	%otherwin,	%g7
	movvs	%xcc,	%o3,	%o7
	fmuld8sux16	%f10,	%f0,	%f16
	add	%l7,	0x68,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%i1
	casxa	[%l6] %asi,	%i1,	%i3
	rd	%y,	%g6
	fnegd	%f10,	%f24
	ba,a	%xcc,	loop_999
	wr	%o6,	0x1740,	%y
	rdpr	%tl,	%l5
	rd	%sys_tick_cmpr,	%l4
loop_999:
	movre	%o1,	0x3B3,	%g2
	movcs	%xcc,	%l1,	%o0
	bge,a	%icc,	loop_1000
	srax	%l2,	0x13,	%g4
	edge32	%g5,	%o4,	%o5
	wr 	%g0, 	0x7, 	%fprs
loop_1000:
	nop
	set	0x3C, %i1
	lduwa	[%l7 + %i1] 0x15,	%i5
	wrpr	%i4,	0x1571,	%pil
	fmovdgu	%icc,	%f10,	%f9
	xorcc	%i0,	%l3,	%l0
	ldd	[%l7 + 0x40],	%g2
	tvc	%xcc,	0x0
	andcc	%i7,	0x0769,	%l6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xF62, 	%hsys_tick_cmpr
	and	%g1,	%o3,	%o7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x46F, 	%hsys_tick_cmpr
	fmovdleu	%xcc,	%f17,	%f18
	edge16	%i1,	%o6,	%g6
	edge16ln	%l5,	%o1,	%l4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x09E, 	%sys_tick_cmpr
	wr	%l2,	0x1DA8,	%ccr
	fba	%fcc3,	loop_1001
	movcc	%icc,	%o0,	%g4
	rd	%tick_cmpr,	%o4
	addc	%g5,	%i6,	%o2
loop_1001:
	rd	%fprs,	%o5
	te	%xcc,	0x4
	tn	%icc,	0x0
	wrpr	%i4,	%i5,	%pil
	ble,pt	%xcc,	loop_1002
	rdpr	%gl,	%l3
	fbne,a	%fcc1,	loop_1003
	fcmpeq32	%f20,	%f2,	%i0
loop_1002:
	rd	%sys_tick_cmpr,	%g3
	tneg	%icc,	0x6
loop_1003:
	subccc	%i7,	0x12D3,	%l6
	rd	%asi,	%l0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x0BD, 	%sys_tick_cmpr
	set	0x38, %l0
	stda	%o2,	[%l7 + %l0] 0x04
	rdpr	%cwp,	%o7
	fbule	%fcc1,	loop_1004
	wrpr	%g7,	0x0008,	%cwp
	te	%icc,	0x4
	rdpr	%cwp,	%g1
loop_1004:
	ldd	[%l7 + 0x48],	%i2
	rdpr	%tba,	%i1
	wrpr	%g6,	0x0081,	%pil
	tvc	%icc,	0x0
	movgu	%icc,	%l5,	%o6
	rd	%pc,	%o1
	tcc	%icc,	0x4
	nop
	setx	loop_1005,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	edge8ln	%l4,	%l1,	%l2
	rdhpr	%htba,	%o0
	wrpr	%g2,	%o4,	%tick
loop_1005:
	movrne	%g4,	%g5,	%o2
	rdhpr	%hpstate,	%i6
	rd	%sys_tick_cmpr,	%i4
	wrpr	%o5,	%l3,	%cwp
	flush	%l7 + 0x68
	bvc,a,pt	%icc,	loop_1006
	sub	%i5,	0x0279,	%g3
	stbar
	bpos,a,pn	%xcc,	loop_1007
loop_1006:
	movcs	%xcc,	%i7,	%i0
	movrlz	%l0,	0x0B9,	%i2
	fmovsneg	%xcc,	%f20,	%f11
loop_1007:
	movvc	%xcc,	%l6,	%o7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%softint,	%i3
	movcs	%icc,	%i1,	%g1
	movrlz	%l5,	0x075,	%g6
	xnorcc	%o1,	%o6,	%l1
	rdhpr	%hsys_tick_cmpr,	%l4
	mulscc	%o0,	%g2,	%o4
	fmovdneg	%xcc,	%f31,	%f2
	rd	%y,	%g4
	rd	%y,	%g5
	andncc	%l2,	%i6,	%o2
	movre	%o5,	%i4,	%l3
	rd	%y,	%i5
	sdiv	%g3,	0x0280,	%i7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x7D0, 	%hsys_tick_cmpr
	be,pt	%xcc,	loop_1008
	rdpr	%otherwin,	%i0
	rdhpr	%hintp,	%l6
	rdpr	%wstate,	%g7
loop_1008:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	ldstub	[%l7 + 0x54],	%o7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	movneg	%icc,	%i3,	%l5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x625, 	%hsys_tick_cmpr
	umul	%o6,	0x1268,	%l4
	rdpr	%tl,	%l1
	fbo	%fcc0,	loop_1009
	rd	%softint,	%o0
	call	loop_1010
	rdpr	%gl,	%g2
loop_1009:
	nop
	wr	%g0,	0x19,	%asi
	stha	%g4,	[%l7 + 0x2C] %asi
loop_1010:
	fmovdvs	%icc,	%f9,	%f14
	rd	%fprs,	%o4
	sll	%l2,	%g5,	%o2
	rd	%asi,	%o5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x1CC, 	%hsys_tick_cmpr
	rdhpr	%htba,	%l3
	wrpr	%i6,	%g3,	%tick
	rdpr	%canrestore,	%i7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xD35, 	%hsys_tick_cmpr
	edge32ln	%i2,	%l0,	%i0
	udiv	%l6,	0x18CA,	%o3
	wrpr	%g7,	0x0033,	%cwp
	wrpr	%o7,	%g1,	%pil
	movne	%xcc,	%i3,	%i1
	fmovdvs	%xcc,	%f18,	%f10

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x15C, 	%hsys_tick_cmpr
	udiv	%l4,	0x1461,	%o0
	wrpr	%l1,	%g4,	%cwp
	rdpr	%otherwin,	%g2
	fabsd	%f20,	%f6
	wr	%l2,	0x1AAD,	%sys_tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%hintp,	%o4
	rdpr	%canrestore,	%o5
	rdhpr	%hintp,	%i4
	rdpr	%cleanwin,	%i6
	taddcctv	%g3,	0x10DE,	%i7
	umulcc	%i5,	0x061F,	%i2
	movl	%icc,	%l3,	%i0
	movn	%xcc,	%l0,	%o3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr 	%g0, 	0x5, 	%fprs
	rdhpr	%hintp,	%i3
	wrpr	%i1,	%o7,	%tick
	bcc,pn	%icc,	loop_1011
	rdhpr	%htba,	%g6
	tne	%xcc,	0x3
	rd	%fprs,	%o1
loop_1011:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xB5E, 	%hsys_tick_cmpr
	wrpr	%l4,	0x0226,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fcmpes	%fcc0,	%f22,	%f20
	wr	%l1,	%o0,	%pic
	wrpr	%g4,	%l2,	%pil
	movre	%g5,	0x2F6,	%g2
	ble,a,pt	%xcc,	loop_1012
	rdpr	%pil,	%o2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x236, 	%hsys_tick_cmpr
	array8	%i4,	%i6,	%g3
loop_1012:
	tg	%xcc,	0x3
	movrlez	%o4,	0x23C,	%i7
	sdivcc	%i2,	0x1222,	%i5
	wr	%l3,	0x047B,	%ccr
	fpmerge	%f16,	%f15,	%f24
	fxnors	%f9,	%f14,	%f10
	rdpr	%canrestore,	%l0
	wrpr	%o3,	%l6,	%tick
	rd	%y,	%i0
	call	loop_1013
	rd	%y,	%g1
	rdhpr	%hsys_tick_cmpr,	%i3
	array16	%g7,	%i1,	%o7
loop_1013:
	bg	loop_1014
	edge32ln	%o1,	%o6,	%l4
	wr 	%g0, 	0x6, 	%fprs

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_1014:
	fmovrdgez	%o0,	%f16,	%f22
	taddcc	%l5,	%g4,	%l2
	wr 	%g0, 	0x6, 	%fprs
	array16	%g5,	%i4,	%i6
	wrpr	%o5,	%o4,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	movl	%icc,	%i2,	%i5
	movleu	%xcc,	%l3,	%g3
	rdhpr	%hsys_tick_cmpr,	%o3
	fmuld8ulx16	%f15,	%f25,	%f18
	wrpr	%l0,	0x175D,	%pil
	wr	%l6,	%g1,	%set_softint
	edge32n	%i0,	%i3,	%i1
	rd	%sys_tick_cmpr,	%g7
	wr	%g0,	0xf1,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
	rdpr	%otherwin,	%o1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	set	0x40, %i7
	ldda	[%l7 + %i7] 0x10,	%f0
        wr    %g0,    0xe,    %pcr    ! changed.
	rdhpr	%hpstate,	%o0
	subc	%l1,	0x1944,	%l5
	rdhpr	%hsys_tick_cmpr,	%g4
	rdhpr	%hintp,	%l2
	fxnor	%f24,	%f22,	%f8
	addcc	%g2,	%g5,	%o2
	sllx	%i4,	%o5,	%i6
	wrpr	%o4,	0x0631,	%tick
	movn	%xcc,	%i2,	%i7
	subcc	%i5,	%l3,	%g3
	edge16ln	%o3,	%l0,	%g1
	wrpr	%i0,	0x0995,	%tick
	rdhpr	%hsys_tick_cmpr,	%i3
	wr	%g0,	0x19,	%asi
	prefetcha	[%l7 + 0x38] %asi,	 0x3
	rd	%ccr,	%l6
	fba	%fcc2,	loop_1015
	wrpr	%g7,	%o6,	%pil
	wrpr	%o7,	0x0629,	%pil
	wrpr	%g6,	%o1,	%pil
loop_1015:
	rdhpr	%htba,	%l4
	wrpr	%o0,	%l5,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	tsubcc	%g2,	0x1D1A,	%g5
	ldx	[%l7 + 0x28],	%l1
	wrpr	%o2,	0x1C54,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fand	%f24,	%f0,	%f2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x5AF, 	%hsys_tick_cmpr
	rdpr	%tba,	%i2
	rd	%asi,	%i5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x7B2, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x604, 	%hsys_tick_cmpr
	fmovsl	%xcc,	%f0,	%f27
	edge16	%g1,	%l0,	%i0
	fmovda	%icc,	%f14,	%f27
	sdivx	%i1,	0x14DD,	%l6
	rd	%fprs,	%i3
	rdpr	%wstate,	%o6
	fmovdcc	%xcc,	%f23,	%f8
	sdivx	%o7,	0x11BF,	%g7
	lduw	[%l7 + 0x68],	%o1
	add	%l4,	%o0,	%g6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fnot1s	%f15,	%f11
	wr	%g2,	0x0070,	%clear_softint
	fblg	%fcc2,	loop_1016
	rdpr	%cleanwin,	%l2
	or	%l1,	%o2,	%g5
	bge,pt	%xcc,	loop_1017
loop_1016:
	wr	%i6,	0x0E75,	%set_softint

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%o5,	%i2,	%set_softint
loop_1017:
	nop
	set	0x1E, %l3
	ldsha	[%l7 + %l3] 0x14,	%i5
	rd	%sys_tick_cmpr,	%o4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrsne	%g3,	%f15,	%f22
	rdhpr	%hpstate,	%i7
	movle	%icc,	%l3,	%g1
	wr	%o3,	%l0,	%y
	rd	%softint,	%i1
	wr 	%g0, 	0x5, 	%fprs
	rd	%asi,	%l6
	wrpr	%o6,	0x0599,	%pil
	sub	%o7,	%g7,	%o1
	fnot1s	%f26,	%f21
        wr    %g0,    0xe,    %pcr    ! changed.
	wrpr	%g6,	%g4,	%pil
	movneg	%icc,	%l5,	%l2
	wr	%l1,	%o2,	%clear_softint
	movleu	%icc,	%g5,	%i6
	movrgez	%i4,	0x394,	%g2
	movrne	%o5,	0x0F4,	%i5
	rdpr	%cleanwin,	%i2
	movl	%icc,	%o4,	%g3
	movn	%xcc,	%l3,	%g1
	rdhpr	%hintp,	%o3
	fmovrsgz	%l0,	%f8,	%f29
	wr	%i1,	%i0,	%softint
	faligndata	%f2,	%f10,	%f18
	rdpr	%otherwin,	%i7
	call	loop_1018
	alignaddrl	%l6,	%i3,	%o7
	rd	%pc,	%g7
	srax	%o6,	%o1,	%l4
loop_1018:
	sethi	0x07B7,	%g6
	rd	%ccr,	%o0
	tleu	%xcc,	0x2
	tsubcc	%g4,	0x1FAC,	%l5
	stx	%l2,	[%l7 + 0x78]
	rd	%sys_tick_cmpr,	%o2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%htba,	%l1
	wr	%g0,	0x10,	%asi
	lduwa	[%l7 + 0x74] %asi,	%i6
	bvc,a	loop_1019
	movgu	%xcc,	%g2,	%o5
	wrpr	%i5,	0x0F75,	%tick
	movle	%icc,	%i2,	%o4
loop_1019:
	rdpr	%otherwin,	%g3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xBA4, 	%hsys_tick_cmpr
	fbu	%fcc1,	loop_1020
	wrpr	%g1,	%o3,	%tick
	fbule	%fcc0,	loop_1021
	fmovsle	%xcc,	%f12,	%f14
loop_1020:
	wr	%l0,	%i4,	%set_softint
	rd	%y,	%i0
loop_1021:
	ta	%icc,	0x4
	udiv	%i7,	0x055D,	%i1
	fcmpeq16	%f22,	%f8,	%i3
        wr    %g0,    0xe,    %pcr    ! changed.
	movvs	%icc,	%o7,	%o6
	wrpr	%o1,	0x16CB,	%cwp
	rd	%pc,	%l4
	rdpr	%gl,	%g7
	rdhpr	%hpstate,	%o0
	srl	%g6,	%l5,	%l2
	fmovsn	%icc,	%f7,	%f14
	fmovdn	%xcc,	%f18,	%f22
	tcs	%icc,	0x3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	add	%g4,	%o2,	%l1
	rdhpr	%hpstate,	%g5
	rd	%y,	%i6
        wr    %g0,    0xe,    %pcr    ! changed.
	andncc	%i2,	%i5,	%o4
	wr	%l3,	%g3,	%ccr
	edge16n	%o3,	%g1,	%l0
	fsrc1	%f10,	%f0
	rdpr	%cwp,	%i0
	wrpr	%i4,	%i1,	%pil
	srl	%i3,	%i7,	%l6
	movne	%xcc,	%o6,	%o7
	wrpr	%l4,	%o1,	%tick
	wr	%g7,	0x0BAB,	%softint
	rd	%asi,	%o0
	add	%l5,	%g6,	%g4
	rdhpr	%htba,	%l2
	tcs	%icc,	0x3
	rdpr	%canrestore,	%l1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xAC1, 	%hsys_tick_cmpr
	fnegd	%f22,	%f16
	fmovrsne	%o2,	%f9,	%f18
	edge32l	%i6,	%o5,	%i2
	rd	%fprs,	%g2
	sll	%i5,	0x0D,	%l3
	rdpr	%otherwin,	%o4
	rd	%asi,	%g3
	be,a	loop_1022
	wrpr	%o3,	%l0,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%hintp,	%i4
loop_1022:
	rd	%fprs,	%i1
	addcc	%i3,	%i7,	%o6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	edge32	%l4,	%g7,	%o1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	rd	%softint,	%o0
	wr	%l5,	0x16BC,	%softint
	wr	%g0,	0xf0,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
	wr	%g6,	0x084E,	%clear_softint
	rdhpr	%hsys_tick_cmpr,	%g4
	rdhpr	%hintp,	%l1
	sdiv	%g5,	0x171E,	%l2
	movg	%icc,	%i6,	%o5
	rdhpr	%hsys_tick_cmpr,	%o2
	rdpr	%tl,	%g2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	wrpr	%o4,	%i2,	%cwp
	membar	#Sync
	wr	%g0,	0x1e,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	fnegs	%f21,	%f2
	wrpr	%o3,	0x0C41,	%cwp
	wr	%l0,	%g3,	%y

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x037, 	%hsys_tick_cmpr
	brz	%g1,	loop_1023
	bvc	%xcc,	loop_1024
	movrne	%i1,	%i3,	%i7
	rdpr	%cleanwin,	%o6
loop_1023:
	rdhpr	%hintp,	%o7
loop_1024:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%hintp,	%l6
	rd	%pc,	%o1
	wr	%g7,	0x0985,	%ccr
	fcmpne16	%f10,	%f18,	%o0
	rd	%fprs,	%l5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	std	%l0,	[%l7 + 0x58]
	wrpr	%g5,	%g4,	%cwp
	wrpr	%i6,	%o5,	%pil
	movcs	%xcc,	%o2,	%g2
	fmovdpos	%icc,	%f29,	%f18
	rdhpr	%hpstate,	%l2
	tvc	%xcc,	0x5
	movle	%xcc,	%l3,	%o4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x23C, 	%hsys_tick_cmpr
	edge32	%i5,	%g3,	%l0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%i0,	0x1214,	%ccr
	movcc	%icc,	%i3,	%i7
	rd	%softint,	%i1
	rdpr	%wstate,	%o6
	rdpr	%canrestore,	%i4
	fpadd16	%f22,	%f4,	%f14
	rdpr	%cleanwin,	%o7
	fbul,a	%fcc1,	loop_1025
	wrpr	%l4,	%o1,	%cwp
	wr 	%g0, 	0x5, 	%fprs
	add	%l7,	0x20,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%o0,	%g6
loop_1025:
	rdpr	%tl,	%l5
	array32	%l1,	%g4,	%i6
	rdpr	%gl,	%g5
	fnegs	%f27,	%f31
	rdhpr	%hpstate,	%o2
	wrpr	%g2,	0x0CAE,	%pil
	edge16l	%o5,	%l3,	%o4
	rdhpr	%hsys_tick_cmpr,	%l2
	fmovdneg	%icc,	%f19,	%f23
	wr	%o3,	%i5,	%sys_tick
	wr	%i2,	%l0,	%y
	movrgez	%g3,	%i0,	%i3
	popc	%g1,	%i7
	rd	%asi,	%o6
	move	%xcc,	%i1,	%o7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%l6,	%l4,	%ccr
	rd	%asi,	%g7
	wr	%g6,	0x1E1B,	%clear_softint
	movge	%xcc,	%l5,	%o0
	fcmpeq16	%f22,	%f22,	%l1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x13F, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x265, 	%hsys_tick_cmpr
	edge16	%o2,	%o5,	%o4
	wrpr	%l3,	%l2,	%cwp
	andcc	%i5,	%i2,	%o3
	mova	%icc,	%g3,	%l0
	edge32	%i0,	%i3,	%g1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x688, 	%hsys_tick_cmpr
	rdpr	%otherwin,	%i7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	movrlz	%o1,	0x0CC,	%l6
	xnorcc	%l4,	%g7,	%i4
	andn	%g6,	0x093C,	%o0
	subccc	%l1,	0x01A4,	%l5
	fmovdne	%xcc,	%f31,	%f3
	rdhpr	%hpstate,	%i6
	wr	%g4,	%g5,	%pic
	rdpr	%cansave,	%o2
	movge	%icc,	%o5,	%o4
	wrpr	%g2,	%l2,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%ccr,	%i2
	xnor	%l3,	0x0B2B,	%o3
	wr	%l0,	0x0AA2,	%softint

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xF86, 	%tick_cmpr
	alignaddrl	%i3,	%g1,	%o6
	flush	%l7 + 0x78
	tle	%icc,	0x5
	rdhpr	%htba,	%o7
	rdpr	%gl,	%i1
	rd	%asi,	%i7
	sll	%l6,	%o1,	%l4
	umul	%g7,	0x082D,	%g6
	rdpr	%cansave,	%i4
	wr	%o0,	%l1,	%y
	wrpr	%i6,	0x04B8,	%pil
	fones	%f27
	brlz	%l5,	loop_1026
	rdpr	%pil,	%g5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wrpr	%o2,	%o5,	%tick
loop_1026:
	wrpr	%o4,	%g4,	%tick
	rd	%ccr,	%g2
	taddcc	%l2,	%i2,	%i5
	rdhpr	%hpstate,	%o3
	rd	%ccr,	%l0
	rd	%softint,	%l3
	rd	%fprs,	%g3
	andcc	%i3,	0x04AC,	%g1
	rd	%asi,	%o6
	te	%icc,	0x5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%i1,	0x1D21,	%pil
	brlz	%o7,	loop_1027
	movneg	%icc,	%i7,	%o1
	movrlz	%l4,	0x124,	%l6
	edge8l	%g6,	%g7,	%o0
loop_1027:
	edge32l	%i4,	%l1,	%l5
	stb	%g5,	[%l7 + 0x7B]
	tcc	%icc,	0x7
	fornot1	%f8,	%f14,	%f16
	mulx	%o2,	0x1B22,	%i6
	rd	%asi,	%o4
	wr	%g0,	0x2f,	%asi
	stba	%g4,	[%l7 + 0x69] %asi
	membar	#Sync
	rdhpr	%htba,	%g2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x61F, 	%hsys_tick_cmpr
	add	%l7,	0x50,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%o5
	casxa	[%l6] %asi,	%o5,	%i5
	fmovrde	%l0,	%f16,	%f0
	rdhpr	%htba,	%o3
	tcs	%icc,	0x6
	fsrc2s	%f8,	%f24
	rdhpr	%hintp,	%l3
	rdhpr	%hintp,	%i3
	movge	%xcc,	%g1,	%o6
	rd	%y,	%g3
	alignaddr	%i0,	%o7,	%i1
	ldd	[%l7 + 0x10],	%i6
	te	%xcc,	0x7
	rdpr	%cleanwin,	%l4
	srl	%l6,	%o1,	%g6
	srlx	%g7,	%o0,	%l1
        wr    %g0,    0xe,    %pcr    ! changed.
	nop
	set	0x41, %g4
	ldstub	[%l7 + %g4],	%g5
	wrpr	%i4,	0x15E8,	%pil
	fmovrdgez	%o2,	%f14,	%f4
	rd	%y,	%o4
	wrpr	%g4,	0x1DAA,	%cwp
	tsubcctv	%i6,	0x0399,	%g2
	membar	#Sync
	set	0x40, %i3
	ldda	[%l7 + %i3] 0x17,	%f16
	wrpr	%i2,	0x15CE,	%cwp
	rdpr	%wstate,	%l2
	wrpr	%o5,	%i5,	%cwp
	wrpr	%l0,	%l3,	%cwp
	rdpr	%canrestore,	%i3
	mova	%xcc,	%o3,	%o6
	wr	%g1,	%i0,	%ccr
	rdhpr	%htba,	%g3
	rd	%pc,	%o7
	xor	%i1,	0x06BD,	%i7
	tn	%xcc,	0x4
	brnz	%l4,	loop_1028
	fnands	%f15,	%f7,	%f19
	wr	%g0,	0x11,	%asi
	stwa	%o1,	[%l7 + 0x10] %asi
loop_1028:
	rdpr	%gl,	%g6
	rd	%fprs,	%l6
	rdhpr	%hintp,	%g7
	st	%f5,	[%l7 + 0x7C]
	rdhpr	%hsys_tick_cmpr,	%o0
	rdpr	%gl,	%l5
	nop
	setx loop_1029, %l0, %l1
	jmpl %l1, %l1
	ta	%icc,	0x5
	movne	%xcc,	%g5,	%i4
	movre	%o4,	0x353,	%g4
loop_1029:
	umulcc	%o2,	0x13D2,	%i6
	wr	%g0,	0x89,	%asi
	stba	%i2,	[%l7 + 0x7E] %asi
	wr	%g2,	%l2,	%pic
	rd	%pc,	%i5
	wr	%l0,	%o5,	%ccr
	rdpr	%cwp,	%i3
	rd	%fprs,	%o3
	xnorcc	%o6,	0x170F,	%g1
	rdhpr	%hsys_tick_cmpr,	%i0
	edge8	%l3,	%g3,	%i1
	rdpr	%cwp,	%i7
	tvs	%xcc,	0x3
	rd	%y,	%l4
	rd	%ccr,	%o1
	rdpr	%cleanwin,	%g6
	bgu,a,pt	%icc,	loop_1030
	rdpr	%gl,	%o7
	rd	%softint,	%g7
	wr 	%g0, 	0x4, 	%fprs
loop_1030:
	wr 	%g0, 	0x4, 	%fprs
	tl	%icc,	0x0
	array16	%l1,	%o0,	%i4
	wrpr	%o4,	%g4,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	edge16ln	%i6,	%i2,	%l2
	tge	%icc,	0x6
	orcc	%g2,	%i5,	%o5
	tneg	%icc,	0x6
	rdhpr	%hintp,	%l0
	mulscc	%i3,	%o3,	%g1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x701, 	%hsys_tick_cmpr
	fmovrdlez	%i0,	%f16,	%f2
	lduh	[%l7 + 0x20],	%l3
	rdhpr	%htba,	%i1
	rdhpr	%htba,	%g3
	srax	%i7,	0x18,	%l4
	wrpr	%o1,	0x108C,	%tick
	stx	%g6,	[%l7 + 0x20]
	sethi	0x0FB6,	%g7
	movvs	%xcc,	%o7,	%l5
	nop
	setx	loop_1031,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fmovdge	%icc,	%f24,	%f22

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x955, 	%hsys_tick_cmpr
	ld	[%l7 + 0x74],	%f9
loop_1031:
	movg	%icc,	%i4,	%o4
	fbn	%fcc3,	loop_1032
	rdhpr	%htba,	%o0
	alignaddrl	%g4,	%o2,	%g5
	rdpr	%gl,	%i2
loop_1032:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x8A7, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	rd	%asi,	%i5
	bneg,a	loop_1033
	rdhpr	%hpstate,	%l0
	movre	%i3,	0x0DE,	%o5
	wrpr	%o3,	0x147A,	%pil
loop_1033:
	orcc	%o6,	%g1,	%l3
	wrpr	%i1,	%i0,	%tick
	rdhpr	%hintp,	%i7
	fba,a	%fcc1,	loop_1034
	rdhpr	%hsys_tick_cmpr,	%l4
	wrpr	%g3,	0x0058,	%pil
	fandnot2s	%f7,	%f0,	%f3
loop_1034:
	brlz	%o1,	loop_1035
	rd	%sys_tick_cmpr,	%g7
	wrpr	%g6,	%l5,	%tick
	umulcc	%l1,	0x163C,	%l6
loop_1035:
	fmovsleu	%xcc,	%f9,	%f13
	fcmpeq16	%f8,	%f26,	%o7
	wrpr	%o4,	%o0,	%cwp
	sllx	%g4,	0x1E,	%o2
	rd	%y,	%g5
	rdpr	%cleanwin,	%i2
	fmul8x16al	%f7,	%f2,	%f22
	rd	%asi,	%i4
	wrpr	%i6,	%g2,	%tick
	for	%f8,	%f30,	%f8
	fone	%f28
	rdhpr	%htba,	%l2
        wr    %g0,    0xe,    %pcr    ! changed.
	bg,a	%xcc,	loop_1036
	rdpr	%gl,	%o5
	bcs,a	loop_1037
	rd	%sys_tick_cmpr,	%i3
loop_1036:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	sdivcc	%l3,	0x1E09,	%i1
loop_1037:
	nop
	wr	%g0,	0xea,	%asi
	ldda	[%l7 + 0x20] %asi,	%i0
	set	0x18, %o6
	ldxa	[%l7 + %o6] 0x04,	%g1
	wrpr	%i7,	%g3,	%tick
	rdhpr	%hsys_tick_cmpr,	%o1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xB5C, 	%hsys_tick_cmpr
	fble	%fcc3,	loop_1038
	rdpr	%cwp,	%l4
	fxors	%f24,	%f26,	%f16
	rdpr	%otherwin,	%g6
loop_1038:
	wrpr	%l1,	0x0470,	%tick
	rdpr	%gl,	%l5
	fcmped	%fcc2,	%f2,	%f22
	wrpr	%o7,	0x032C,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fcmpne16	%f16,	%f30,	%o4
	wr 	%g0, 	0x7, 	%fprs
	fandnot2	%f26,	%f22,	%f16
	rd	%tick_cmpr,	%o2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xF2C, 	%tick_cmpr
	fmovdneg	%xcc,	%f13,	%f27
	tcs	%xcc,	0x7
	fors	%f25,	%f27,	%f23
	fbo	%fcc2,	loop_1039
	rdhpr	%hintp,	%i2
	wrpr	%i6,	0x1FA9,	%pil
	edge16	%i4,	%l2,	%g2
loop_1039:
	bcs,a	loop_1040
	tle	%xcc,	0x4
	rd	%sys_tick_cmpr,	%i5
	wrpr	%l0,	0x12FB,	%tick
loop_1040:
	rd	%y,	%o5
	wr	%o6,	%i3,	%sys_tick
	rdhpr	%htba,	%l3
	udiv	%i1,	0x0CF8,	%o3
	wrpr	%g1,	%i7,	%pil
	rd	%tick_cmpr,	%i0
	tpos	%xcc,	0x7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	wrpr	%l4,	0x1EC8,	%tick
	tne	%icc,	0x5
	wr	%o1,	%l1,	%ccr
	rd	%fprs,	%g6
	te	%xcc,	0x3
	fmovrse	%o7,	%f3,	%f29

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	be,pn	%icc,	loop_1041
	edge8n	%l6,	%o0,	%g4
	wr	%o2,	0x165A,	%clear_softint
	rdpr	%tl,	%o4
loop_1041:
	rdpr	%cansave,	%g5
	or	%i6,	0x11FA,	%i2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%i4,	0x106D,	%set_softint
	fbl	%fcc0,	loop_1042
	array16	%i5,	%l0,	%o5
	brz	%o6,	loop_1043
	wr 	%g0, 	0x7, 	%fprs
loop_1042:
	wr	%g2,	%l3,	%pic
	mulscc	%i1,	0x0E2B,	%o3
loop_1043:
	rd	%fprs,	%g1
	fbuge	%fcc1,	loop_1044
	tne	%xcc,	0x5
	rdhpr	%hintp,	%i7
	bne,pn	%xcc,	loop_1045
loop_1044:
	rdpr	%wstate,	%i0
	fcmpgt16	%f6,	%f6,	%g3
	edge8l	%l4,	%o1,	%l1
loop_1045:
	rdpr	%otherwin,	%g6
	tcs	%icc,	0x0
	fbu	%fcc0,	loop_1046
	move	%icc,	%g7,	%o7
	fmovdleu	%xcc,	%f21,	%f17
	fands	%f31,	%f17,	%f16
loop_1046:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x471, 	%hsys_tick_cmpr
	rd	%fprs,	%g4
	wr	%g0,	0x04,	%asi
	ldda	[%l7 + 0x20] %asi,	%o2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x206, 	%hsys_tick_cmpr
	fbule,a	%fcc0,	loop_1047
	movrlz	%g5,	%i6,	%i2
	fnot2	%f14,	%f26
	rdpr	%otherwin,	%l5
loop_1047:
	wr 	%g0, 	0x7, 	%fprs
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	umulcc	%i4,	0x1C3D,	%l0
	nop
	setx	loop_1048,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	wr	%o5,	%i5,	%softint
	fpmerge	%f2,	%f6,	%f26
	wrpr	%i3,	%o6,	%pil
loop_1048:
	tcs	%xcc,	0x1
	orn	%l3,	0x110B,	%i1
	sir	0x1B2F
	edge16	%o3,	%g1,	%i7
	fnors	%f1,	%f21,	%f29
	smulcc	%g2,	%g3,	%l4
	mulx	%i0,	0x10B3,	%o1
	movre	%g6,	0x2FD,	%g7
	wrpr	%o7,	%l6,	%tick
	brnz	%o0,	loop_1049
	wr	%l1,	%g4,	%set_softint
	rd	%y,	%o4
	fcmpd	%fcc2,	%f14,	%f4
loop_1049:
	rd	%y,	%o2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x012, 	%hsys_tick_cmpr
	movvc	%xcc,	%i2,	%g5
	tcc	%icc,	0x5
	wr	%l5,	0x1FF8,	%softint
	rd	%sys_tick_cmpr,	%l2
	rdpr	%tba,	%l0
	set	0x62, %o5
	ldsba	[%l7 + %o5] 0x89,	%o5
	umul	%i4,	0x009C,	%i5
	movg	%xcc,	%o6,	%l3
	fbu,a	%fcc0,	loop_1050
	wrpr	%i3,	%o3,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x29A, 	%tick_cmpr
	edge8l	%i1,	%g2,	%i7
loop_1050:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x034, 	%hsys_tick_cmpr
	wrpr	%g3,	0x16B9,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xBCF, 	%hsys_tick_cmpr
	fmovrdgez	%o1,	%f26,	%f6
	tl	%icc,	0x1
	rdhpr	%hsys_tick_cmpr,	%o7
	add	%l7,	0x30,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%l6,	%g7
	tge	%xcc,	0x4
	rdhpr	%hintp,	%o0
	rdhpr	%hintp,	%g4
	tsubcctv	%l1,	0x0163,	%o4
	wrpr	%o2,	%i2,	%pil
	rdpr	%canrestore,	%i6
	rd	%pc,	%l5
	wrpr	%l2,	0x022D,	%tick
	rdpr	%cleanwin,	%g5
	movrne	%l0,	0x29A,	%i4
	smul	%o5,	%o6,	%i5
	rdpr	%cwp,	%l3
	rdhpr	%hintp,	%i3
	wr	%g0,	0x04,	%asi
	lduwa	[%l7 + 0x28] %asi,	%g1
	wr	%o3,	0x1359,	%y
	fbug	%fcc3,	loop_1051
	wrpr	%i1,	0x0842,	%tick
	ta	%icc,	0x4
	mova	%icc,	%g2,	%i7
loop_1051:
	rdhpr	%htba,	%l4
	wr	%g3,	0x0C21,	%set_softint

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x392, 	%hsys_tick_cmpr
	rdhpr	%hsys_tick_cmpr,	%o7
	wr	%g0,	0x81,	%asi
	prefetcha	[%l7 + 0x60] %asi,	 0x3
	rdhpr	%hpstate,	%l6
	rdpr	%cleanwin,	%o0
	fmovdcc	%icc,	%f1,	%f1
	rd	%pc,	%g7
	rdpr	%gl,	%l1
	wrpr	%g4,	%o4,	%tick
	rd	%ccr,	%i2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	movvs	%icc,	%o2,	%l5
	ldstub	[%l7 + 0x55],	%l2
	fbl	%fcc3,	loop_1052
	rdpr	%tl,	%g5
	rdpr	%wstate,	%i4
	ldd	[%l7 + 0x08],	%l0
loop_1052:
	rdpr	%cleanwin,	%o5
	sdivx	%i5,	0x08A0,	%o6
	rd	%tick_cmpr,	%i3
	rdhpr	%hsys_tick_cmpr,	%l3
	rd	%y,	%o3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	rdpr	%wstate,	%i7
	sdivx	%l4,	0x1735,	%g3
	fmovdle	%xcc,	%f24,	%f29

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xA49, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xC40, 	%hsys_tick_cmpr
	fbg	%fcc1,	loop_1053
	wrpr	%o1,	0x170E,	%tick
	wrpr	%i0,	%o7,	%cwp
	wr	%l6,	0x11E2,	%ccr
loop_1053:
	fbg,a	%fcc0,	loop_1054
	andncc	%o0,	%g7,	%l1
	fmovdl	%xcc,	%f3,	%f24
	rd	%asi,	%o4
loop_1054:
	rdpr	%pil,	%g4
	tle	%icc,	0x5
	movne	%xcc,	%i2,	%o2
	rdhpr	%hpstate,	%l5
	wr	%g0,	0x81,	%asi
	lduha	[%l7 + 0x1E] %asi,	%l2
	fbul,a	%fcc0,	loop_1055
	wrpr	%i6,	0x1185,	%cwp
	edge16	%g5,	%l0,	%i4
	wrpr	%o5,	%i5,	%tick
loop_1055:
	rd	%sys_tick_cmpr,	%i3
	rdpr	%tl,	%o6
	movrne	%o3,	%g1,	%l3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x8C7, 	%hsys_tick_cmpr
	movne	%icc,	%l4,	%g3
	rdpr	%canrestore,	%g2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fcmpgt16	%f0,	%f22,	%o1
	rdpr	%gl,	%o7
	set	0x20, %i5
	ldswa	[%l7 + %i5] 0x88,	%l6
	wrpr	%o0,	%i0,	%tick
	fcmpgt32	%f12,	%f20,	%g7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%o4,	%g4,	%cwp
	ldsh	[%l7 + 0x26],	%i2
	edge16ln	%l5,	%o2,	%i6
	rdpr	%gl,	%l2
	sra	%l0,	%i4,	%o5
	wrpr	%g5,	%i3,	%pil
	tpos	%xcc,	0x6
	rdhpr	%hsys_tick_cmpr,	%i5
	fnand	%f22,	%f2,	%f20
	rdhpr	%hintp,	%o3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%htba,	%g1
	tne	%icc,	0x5
	rdpr	%canrestore,	%l4
	rdhpr	%htba,	%g3
	sir	0x01DF
	bgu	%icc,	loop_1056
	wrpr	%g2,	0x06DE,	%pil
	wr	%g6,	0x1C77,	%clear_softint
	rdhpr	%htba,	%i1
loop_1056:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	movrgz	%o7,	%o1,	%o0
	tl	%xcc,	0x2
	rdhpr	%hpstate,	%i0
	andcc	%g7,	%l6,	%o4
	wr	%l1,	0x018B,	%clear_softint
	rd	%tick_cmpr,	%i2
	rd	%fprs,	%g4
	fmovsl	%icc,	%f11,	%f14
	mulscc	%o2,	0x1FB5,	%i6
	te	%xcc,	0x2
	umulcc	%l5,	%l2,	%l0
	fmovrdgz	%i4,	%f8,	%f16
	nop
	set	0x38, %i0
	ldd	[%l7 + %i0],	%g4
	rdpr	%tl,	%i3
	rd	%tick_cmpr,	%i5
	fmovrsgz	%o3,	%f1,	%f8
	rdhpr	%hpstate,	%o5
	udivx	%o6,	0x0A64,	%g1
	wr	%l3,	0x1715,	%y
	brlez	%l4,	loop_1057
	rdpr	%tl,	%g2
	fbul,a	%fcc1,	loop_1058
	nop
	setx	loop_1059,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_1057:
	udiv	%g3,	0x1A72,	%g6
	ldub	[%l7 + 0x1E],	%i1
loop_1058:
	fmovsgu	%icc,	%f3,	%f21
loop_1059:
	movrgez	%i7,	0x2A0,	%o7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x0D6, 	%hsys_tick_cmpr
	fmovscs	%xcc,	%f13,	%f22
	wrpr	%g7,	%l6,	%pil
	set	0x78, %l6
	stha	%i0,	[%l7 + %l6] 0x14
	wrpr	%l1,	%o4,	%pil
	xorcc	%g4,	0x0E0E,	%i2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x47E, 	%hsys_tick_cmpr
	rdpr	%cleanwin,	%i6
	rdhpr	%hsys_tick_cmpr,	%l2
	rdpr	%cwp,	%i4
	rd	%fprs,	%g5
	rdpr	%pil,	%l0
	fones	%f24
	tn	%icc,	0x2
	movn	%icc,	%i5,	%o3
	wrpr	%o5,	0x043E,	%cwp
	rdhpr	%hpstate,	%i3
	fbug	%fcc0,	loop_1060
	rdpr	%pil,	%o6
	rdhpr	%htba,	%g1
	wrpr	%l3,	%l4,	%cwp
loop_1060:
	wrpr	%g3,	%g6,	%cwp
	rdpr	%canrestore,	%i1
	subcc	%g2,	%o7,	%o1
	rd	%asi,	%o0
	movgu	%icc,	%g7,	%l6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x40E, 	%hsys_tick_cmpr
	subc	%o4,	0x077B,	%g4
	bg,a	%icc,	loop_1061
	fnot2s	%f5,	%f11
	fbn,a	%fcc2,	loop_1062
	wr	%i2,	%o2,	%clear_softint
loop_1061:
	rdhpr	%htba,	%l5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x9FF, 	%hsys_tick_cmpr
loop_1062:
	be	%icc,	loop_1063
	wrpr	%i4,	0x01F3,	%tick
	rdhpr	%hsys_tick_cmpr,	%g5
	rdpr	%canrestore,	%l2
loop_1063:
	rd	%fprs,	%i5
	udiv	%o3,	0x13CF,	%o5
	rdhpr	%hpstate,	%l0
	tn	%icc,	0x2
	movcs	%icc,	%i3,	%o6
	call	loop_1064
	wrpr	%l3,	%l4,	%tick
	fbug	%fcc1,	loop_1065
	rd	%sys_tick_cmpr,	%g1
loop_1064:
	wrpr	%g3,	0x10E9,	%tick
	fmul8x16al	%f6,	%f0,	%f0
loop_1065:
	fbuge	%fcc1,	loop_1066
	fmovrdlz	%i1,	%f12,	%f16
	rdpr	%tl,	%g2
	rdpr	%otherwin,	%o7
loop_1066:
	for	%f20,	%f6,	%f12
	fblg,a	%fcc2,	loop_1067
	wr 	%g0, 	0x7, 	%fprs
	tcs	%icc,	0x7
	fbo,a	%fcc0,	loop_1068
loop_1067:
	srlx	%o1,	%l6,	%i7
	edge16ln	%i0,	%g7,	%o4
	rdpr	%cwp,	%g4
loop_1068:
	wrpr	%o2,	0x1A0B,	%pil
	tcc	%xcc,	0x6
	fandnot1s	%f15,	%f14,	%f18
	std	%l4,	[%l7 + 0x78]
	fmovdcc	%xcc,	%f1,	%f8
	rdhpr	%hpstate,	%i6
	wr	%i2,	%l1,	%set_softint
	rd	%tick_cmpr,	%g5
	tg	%xcc,	0x2
	movvc	%xcc,	%l2,	%i5
	xorcc	%i4,	0x1A76,	%o3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%hintp,	%o6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fnot2s	%f3,	%f25
	brnz	%l3,	loop_1069
	rdpr	%tl,	%g2
	rd	%asi,	%i1
	set	0x4D, %g2
	ldstuba	[%l7 + %g2] 0x04,	%g6
loop_1069:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x95E, 	%hsys_tick_cmpr
	brgz	%l6,	loop_1070
	rdpr	%pil,	%i7
	rdpr	%cwp,	%i0
	tgu	%icc,	0x1
loop_1070:
	movrne	%o1,	0x25B,	%g7
	wr	%g4,	%o4,	%clear_softint
	orncc	%l5,	%i6,	%o2
	fbule,a	%fcc2,	loop_1071
	nop
	setx	loop_1072,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	smulcc	%i2,	0x19B4,	%g5
	orncc	%l2,	%l1,	%i5
loop_1071:
	wrpr	%i4,	%o3,	%pil
loop_1072:
	rdpr	%gl,	%o5
	movrgz	%o6,	%i3,	%l0
	fbuge,a	%fcc0,	loop_1073
	srax	%l4,	0x16,	%g3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%tba,	%g2
loop_1073:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fmul8x16al	%f7,	%f12,	%f20
	wrpr	%g6,	0x1249,	%pil
	tle	%xcc,	0x6
	movgu	%xcc,	%o7,	%o0
	rdpr	%cleanwin,	%l6
	wrpr	%i0,	%i7,	%cwp
	wrpr	%g7,	0x00A9,	%pil
	wr	%g0,	0x80,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	wr	%g0,	0x18,	%asi
	ldsha	[%l7 + 0x16] %asi,	%g4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xC8D, 	%hsys_tick_cmpr
	rd	%fprs,	%o4
	tvs	%icc,	0x2
	membar	0x6D
	movcc	%xcc,	%i6,	%i2
	tleu	%icc,	0x0
	brgez	%o2,	loop_1074
	rd	%sys_tick_cmpr,	%g5
	wr	%l1,	0x03CA,	%sys_tick
	wr	%g0,	0x2a,	%asi
	stba	%l2,	[%l7 + 0x54] %asi
	membar	#Sync
loop_1074:
	add	%i5,	0x07CC,	%i4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	movvs	%icc,	%o3,	%o6
	edge16l	%i3,	%l0,	%l4
	movre	%g3,	0x205,	%g1
	edge16l	%g2,	%i1,	%g6
	rdhpr	%htba,	%o7
	rd	%sys_tick_cmpr,	%o0
	rdpr	%gl,	%l3
	wr	%l6,	0x0CF2,	%ccr
	brz,a	%i0,	loop_1075
	rdpr	%tba,	%g7
	bcc	loop_1076
	sra	%i7,	%o1,	%l5
loop_1075:
	rdpr	%tl,	%g4
	fmovsne	%icc,	%f1,	%f16
loop_1076:
	rd	%ccr,	%i6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	edge8n	%g5,	%l1,	%l2
	bg	loop_1077
	fmovsgu	%icc,	%f20,	%f26
	udiv	%o2,	0x02BD,	%i4
	bl	%xcc,	loop_1078
loop_1077:
	wrpr	%i5,	%o3,	%pil
	taddcc	%o6,	0x130D,	%o5
	edge16ln	%l0,	%l4,	%g3
loop_1078:
	rdhpr	%hsys_tick_cmpr,	%i3
	rdhpr	%hpstate,	%g2
	rdpr	%pil,	%g1
	addcc	%i1,	0x1457,	%g6
	wrpr	%o0,	%l3,	%tick
	rdhpr	%htba,	%o7
	rd	%pc,	%i0
	popc	%l6,	%i7
	rdpr	%pil,	%o1
	wrpr	%g7,	0x1CCA,	%pil
	fmuld8sux16	%f17,	%f11,	%f8
	wr	%g4,	0x00ED,	%pic
	rdpr	%otherwin,	%l5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	xnor	%g5,	%l1,	%i6
	fcmpne16	%f0,	%f20,	%o2
	edge8ln	%i4,	%l2,	%i5
	fexpand	%f19,	%f20
	wrpr	%o3,	%o5,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x559, 	%sys_tick_cmpr
	rdhpr	%hsys_tick_cmpr,	%l4
	fmovrsgez	%i3,	%f26,	%f22
	ldub	[%l7 + 0x14],	%g3
	orncc	%g1,	0x017F,	%g2
	fcmpeq16	%f20,	%f0,	%g6
	rd	%y,	%i1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x113, 	%hsys_tick_cmpr
	wrpr	%o7,	0x1F53,	%pil
	mova	%xcc,	%l3,	%i0
	movg	%icc,	%i7,	%o1
	rdpr	%wstate,	%g7
	rd	%asi,	%g4
	rdhpr	%hsys_tick_cmpr,	%l6
	rd	%softint,	%i2
	tsubcc	%l5,	%g5,	%o4
	subccc	%i6,	0x15BA,	%l1
	rdpr	%canrestore,	%o2
	flush	%l7 + 0x60
	te	%xcc,	0x3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x9C7, 	%hsys_tick_cmpr
	movge	%xcc,	%i5,	%o3
	bvc,pn	%xcc,	loop_1079
	rd	%pc,	%o6
	rdhpr	%hpstate,	%o5
	wrpr	%l4,	0x04DD,	%cwp
loop_1079:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	set	0x60, %g6
	lda	[%l7 + %g6] 0x11,	%f5
	fmovrsgez	%g3,	%f20,	%f8
	wrpr	%g2,	%g6,	%cwp
	addcc	%g1,	%o0,	%o7
	rdpr	%wstate,	%i1
	rd	%pc,	%i0
	rdpr	%tba,	%l3
	sdivx	%o1,	0x11FA,	%i7
	set	0x68, %o4
	ldswa	[%l7 + %o4] 0x89,	%g7
	rd	%ccr,	%g4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%l6,	%g5,	%y
	fbe	%fcc2,	loop_1080
	wr	%l5,	0x086D,	%y

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x698, 	%tick_cmpr
	brnz	%o4,	loop_1081
loop_1080:
	rdpr	%gl,	%i4
	rd	%y,	%o2
	umul	%l2,	0x18D5,	%o3
loop_1081:
	rdpr	%cwp,	%i5
	wr	%o6,	0x0C63,	%softint

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	tleu	%icc,	0x3
	rdhpr	%htba,	%l0
	sdivx	%g3,	0x07E4,	%g2
	call	loop_1082
	rdpr	%otherwin,	%i3
	popc	%g6,	%g1
	wrpr	%o7,	%i1,	%tick
loop_1082:
	andncc	%i0,	%l3,	%o1
	movrne	%o0,	%g7,	%g4
	wrpr	%i7,	%i2,	%pil
	wrpr	%l6,	0x1594,	%pil
	movre	%l5,	%i6,	%g5
	fmovrsgz	%l1,	%f24,	%f23
	wrpr	%i4,	%o4,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x01F, 	%tick_cmpr
	rdhpr	%htba,	%o3
	rdhpr	%hpstate,	%o2
	movle	%xcc,	%o6,	%l4
	rd	%tick_cmpr,	%i5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x75D, 	%hsys_tick_cmpr
	movleu	%xcc,	%l0,	%g3
	fsrc1s	%f0,	%f24
	wrpr	%i3,	0x1071,	%tick
	rd	%fprs,	%g6
	rd	%softint,	%g2
	wrpr	%o7,	0x1CB3,	%cwp
	bleu	loop_1083
	rdhpr	%htba,	%i1
	movcc	%xcc,	%g1,	%l3
	tg	%icc,	0x0
loop_1083:
	alignaddr	%i0,	%o0,	%g7
	movrgz	%o1,	%i7,	%i2
	wr	%l6,	0x11B2,	%y

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xE84, 	%hsys_tick_cmpr
	rd	%y,	%i4
	fmul8x16al	%f8,	%f31,	%f16
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x47E, 	%tick_cmpr
	fbge,a	%fcc1,	loop_1084
	rdhpr	%hpstate,	%o4
	movcs	%xcc,	%l2,	%o2
	rdpr	%cwp,	%o3
loop_1084:
	brgez,a	%l4,	loop_1085
	rdhpr	%hintp,	%o6
	rdpr	%cleanwin,	%i5
	addc	%l0,	%g3,	%i3
loop_1085:
	edge16l	%g6,	%g2,	%o5
	rdhpr	%htba,	%o7
	wrpr	%g1,	0x1534,	%pil
	rdpr	%wstate,	%l3
	fpsub32	%f16,	%f0,	%f28
	st	%f7,	[%l7 + 0x58]
	sub	%i1,	%i0,	%g7
	fmovsle	%icc,	%f17,	%f17
	wrpr	%o0,	0x1353,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	mulscc	%l6,	0x0EE6,	%l5
	movvs	%xcc,	%i6,	%i7
	tsubcc	%l1,	%g4,	%g5
	rdhpr	%htba,	%o4
	rdpr	%cleanwin,	%l2
	wr	%i4,	%o3,	%ccr
	rdpr	%cansave,	%o2
	nop
	setx	loop_1086,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	brgz	%l4,	loop_1087
	srax	%o6,	%l0,	%g3
	rdpr	%otherwin,	%i5
loop_1086:
	rdhpr	%hsys_tick_cmpr,	%g6
loop_1087:
	rd	%softint,	%i3
	rdhpr	%hintp,	%o5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x22C, 	%hsys_tick_cmpr
	mova	%icc,	%g1,	%l3
	rd	%pc,	%i1
	wrpr	%i0,	0x1032,	%tick
	rdhpr	%hpstate,	%g7
	rdhpr	%htba,	%o7
	wr	%o0,	%o1,	%pic
	umul	%l6,	%l5,	%i6
	bcs	%xcc,	loop_1088
	wrpr	%i7,	%i2,	%pil
	umulcc	%g4,	%l1,	%o4
	rdpr	%tba,	%g5
loop_1088:
	rdhpr	%htba,	%i4
	rdpr	%cansave,	%o3
	rdpr	%wstate,	%o2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x4FE, 	%hsys_tick_cmpr
	srl	%l4,	%l0,	%g3
	orn	%i5,	0x1FB3,	%o6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%pc,	%i3
	edge32l	%g2,	%g1,	%o5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x09D, 	%sys_tick_cmpr
	wr 	%g0, 	0x7, 	%fprs
	sdiv	%g7,	0x12FF,	%o7
	set	0x1C, %g1
	stha	%o0,	[%l7 + %g1] 0x15
	flush	%l7 + 0x54
	wr	%o1,	%l6,	%softint
	rdpr	%cansave,	%l5
	rdhpr	%htba,	%i6
	wrpr	%i7,	%g4,	%tick
	rdhpr	%hsys_tick_cmpr,	%i2
	swap	[%l7 + 0x1C],	%l1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xB3F, 	%hsys_tick_cmpr
	wrpr	%o3,	%o2,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x70B, 	%hsys_tick_cmpr
	rdpr	%canrestore,	%l4
	rd	%sys_tick_cmpr,	%i4
	wr 	%g0, 	0x5, 	%fprs

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xF39, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%canrestore,	%g6
	wr	%g0,	0x10,	%asi
	stxa	%i3,	[%l7 + 0x40] %asi

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%pil,	%o5
	rdhpr	%htba,	%l3
	rd	%ccr,	%i0
	addc	%i1,	%g1,	%o7
	rdhpr	%hsys_tick_cmpr,	%o0
	rdhpr	%hsys_tick_cmpr,	%o1
	ble,a	loop_1089
	wrpr	%g7,	%l6,	%cwp
	wrpr	%l5,	%i7,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x76D, 	%hsys_tick_cmpr
loop_1089:
	rdhpr	%htba,	%i6
	wrpr	%i2,	0x10E9,	%cwp
	andncc	%g5,	%o4,	%l1
	rdpr	%cansave,	%o2
	ba,a	%xcc,	loop_1090
	rd	%softint,	%o3
	wr	%l4,	%l2,	%clear_softint

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x249, 	%hsys_tick_cmpr
loop_1090:
	rdhpr	%htba,	%i5
	wr	%g0,	0x11,	%asi
	stda	%o6,	[%l7 + 0x48] %asi
	fbe,a	%fcc2,	loop_1091
	edge8n	%g6,	%g3,	%i3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%o5,	0x0449,	%y
loop_1091:
	fmovdl	%icc,	%f26,	%f30
	fmovdpos	%xcc,	%f24,	%f19
	call	loop_1092
	ld	[%l7 + 0x3C],	%f1
	wrpr	%l3,	0x11F5,	%cwp
	wr	%i1,	0x1EBF,	%softint
loop_1092:
	wr 	%g0, 	0x4, 	%fprs
	wr	%i0,	%o7,	%ccr
	movrgz	%o0,	0x0E3,	%g7
	set	0x18, %l4
	stha	%l6,	[%l7 + %l4] 0x19
	sll	%o1,	0x10,	%i7
	rdhpr	%hintp,	%l5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x9CB, 	%hsys_tick_cmpr
	rdhpr	%hsys_tick_cmpr,	%g4
	fpadd16	%f10,	%f18,	%f20

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x377, 	%hsys_tick_cmpr
	xorcc	%g5,	%l1,	%o2
	rdpr	%wstate,	%o4
        wr    %g0,    0xe,    %pcr    ! changed.
	tcs	%xcc,	0x1
	bn,a	loop_1093
	taddcc	%l2,	0x0467,	%i4
	siam	0x1
	rd	%softint,	%l0
loop_1093:
	rdpr	%cwp,	%l4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	fcmpgt32	%f22,	%f16,	%g6
	tge	%icc,	0x0
	wr	%g3,	%i3,	%y

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x17F, 	%hsys_tick_cmpr
	wr 	%g0, 	0x7, 	%fprs
	fzeros	%f1
	tl	%icc,	0x4
	wrpr	%i1,	0x063F,	%cwp
	rdpr	%canrestore,	%g1
	fnot2	%f4,	%f6
	rdhpr	%htba,	%o5
	rdhpr	%hintp,	%i0
	fpadd32	%f6,	%f8,	%f30
	bneg,pt	%xcc,	loop_1094
	rdhpr	%hpstate,	%o0
	rdpr	%otherwin,	%o7
	bg,pn	%xcc,	loop_1095
loop_1094:
	rdhpr	%hintp,	%g7
	edge8ln	%o1,	%l6,	%i7
	set	0x1C, %l5
	sta	%f8,	[%l7 + %l5] 0x19
loop_1095:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xDF7, 	%hsys_tick_cmpr
	taddcc	%i2,	%g4,	%g5
	wr	%l1,	0x1E21,	%softint
	rd	%pc,	%o2
	rdpr	%pil,	%o3
	wr 	%g0, 	0x4, 	%fprs

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x081, 	%hsys_tick_cmpr
	rdhpr	%hpstate,	%l2
	wrpr	%l4,	%g6,	%pil
	wrpr	%i5,	0x043A,	%tick
	tgu	%icc,	0x6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fcmpes	%fcc2,	%f31,	%f4
	tl	%xcc,	0x3
	fbue,a	%fcc3,	loop_1096
	fornot1	%f16,	%f26,	%f26
	tg	%xcc,	0x4
	rdpr	%cwp,	%o6
loop_1096:
	nop
	wr	%g0,	0x81,	%asi
	lduba	[%l7 + 0x72] %asi,	%l3
	rdhpr	%hpstate,	%i1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fbuge,a	%fcc0,	loop_1097
	rdhpr	%hsys_tick_cmpr,	%g2
	wr	%o0,	%o7,	%set_softint

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x17A, 	%hsys_tick_cmpr
loop_1097:
	rd	%y,	%l6
	wrpr	%g7,	%l5,	%pil
	rd	%sys_tick_cmpr,	%i7
	tsubcctv	%i2,	%g4,	%i6
	fcmple32	%f14,	%f24,	%g5
	movg	%xcc,	%o2,	%o3

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
	movrlez	%l1,	%i4,	%l2
	wrpr	%l0,	0x183E,	%pil
	rdhpr	%htba,	%g6
	rdpr	%tl,	%i5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	movl	%icc,	%g3,	%l3
	fpack16	%f2,	%f13
	umulcc	%o6,	%g1,	%o5
	wr	%i1,	0x0384,	%softint
	add	%o0,	%o7,	%g2
	rdhpr	%hintp,	%i0
	ba,a,pn	%xcc,	loop_1098
	rdpr	%pil,	%o1
	rdpr	%otherwin,	%l6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_1098:
	movcc	%xcc,	%l5,	%g4
	fmovspos	%icc,	%f3,	%f29
	wrpr	%i2,	%i6,	%tick
	rd	%asi,	%o2
	andncc	%o3,	%o4,	%l1
	rdpr	%cwp,	%i4
	edge16n	%g5,	%l0,	%l2
	rdhpr	%hintp,	%i5
	rd	%tick_cmpr,	%g6
	fbl	%fcc0,	loop_1099
	fornot1s	%f8,	%f10,	%f28
	nop
	setx	loop_1100,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movrgz	%l4,	0x030,	%i3
loop_1099:
	tl	%xcc,	0x5
	add	%l7,	0x44,	%l6
	wr	%g0,	0x0c,	%asi
	casa	[%l6] 0x0c,	%l3,	%g3
loop_1100:
	fbl,a	%fcc0,	loop_1101
	wrpr	%g1,	%o5,	%pil
	movcs	%xcc,	%i1,	%o6
	rdpr	%tl,	%o0
loop_1101:
	fcmple16	%f8,	%f30,	%o7
	rd	%tick_cmpr,	%g2
	set	0x24, %i6
	ldswa	[%l7 + %i6] 0x0c,	%o1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xA2F, 	%hsys_tick_cmpr
	rdhpr	%hpstate,	%l6
	rd	%softint,	%g7
	fnand	%f22,	%f0,	%f10
	rd	%softint,	%l5
	rd	%fprs,	%i7
	rd	%fprs,	%i2
	wr	%g4,	%i6,	%sys_tick
	rdhpr	%hpstate,	%o3
	mulx	%o4,	0x1596,	%o2
	movre	%i4,	0x346,	%l1
	rd	%tick_cmpr,	%l0
	tvc	%xcc,	0x7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x3C0, 	%hsys_tick_cmpr
	rd	%asi,	%i5
	fsrc1	%f14,	%f8
	edge8n	%l4,	%i3,	%g6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%y,	%g1
	wr	%i1,	0x0386,	%y
	ldub	[%l7 + 0x18],	%o6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fzeros	%f22
	fand	%f16,	%f30,	%f28
	rdhpr	%hsys_tick_cmpr,	%o7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xB9A, 	%hsys_tick_cmpr
	bn,a	%icc,	loop_1102
	srl	%i0,	%l6,	%g7
	wrpr	%i7,	0x1A16,	%pil
	edge32	%i2,	%l5,	%i6
loop_1102:
	tcc	%xcc,	0x7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xF65, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x5A2, 	%hsys_tick_cmpr
	membar	0x1A

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%htba,	%l0
	rdpr	%cansave,	%l2
	wrpr	%g5,	%l4,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%tba,	%g3
	wrpr	%l3,	%g1,	%cwp
	edge32	%i1,	%o6,	%o0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x381, 	%hsys_tick_cmpr
	sra	%g6,	0x1F,	%o5
	taddcc	%o1,	0x1B20,	%g2
	movg	%icc,	%i0,	%g7
	movcs	%xcc,	%l6,	%i2
	rd	%tick_cmpr,	%l5
	rd	%tick_cmpr,	%i7
	rdpr	%cansave,	%g4
	rdhpr	%hintp,	%o3
	set	0x60, %i2
	lduwa	[%l7 + %i2] 0x10,	%o4
	fzero	%f2
	wrpr	%i6,	0x0144,	%tick
	wrpr	%i4,	0x1722,	%cwp
	wrpr	%o2,	0x05C2,	%pil
	xorcc	%l0,	0x1A56,	%l1
	fcmple16	%f4,	%f4,	%l2
	movn	%icc,	%l4,	%g5
	wr	%g0,	0x10,	%asi
	ldsba	[%l7 + 0x30] %asi,	%i5
	ldsb	[%l7 + 0x5B],	%g3
	rd	%sys_tick_cmpr,	%l3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	rdhpr	%hpstate,	%o0
	rd	%y,	%o7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x57B, 	%hsys_tick_cmpr
	wrpr	%o6,	0x0D41,	%tick
	wrpr	%o1,	0x12A3,	%tick
	fcmpgt16	%f10,	%f22,	%g2
	rd	%asi,	%i0
	andn	%g7,	0x1C31,	%l6
	rd	%softint,	%i2
	movleu	%icc,	%l5,	%o5
	movgu	%xcc,	%i7,	%o3
	rdpr	%pil,	%o4
	rd	%fprs,	%i6
	sub	%g4,	0x0630,	%o2
	wrpr	%l0,	%i4,	%cwp
	tpos	%icc,	0x7
	rd	%sys_tick_cmpr,	%l1
	wr	%l4,	0x0AD8,	%sys_tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fmovdvc	%icc,	%f29,	%f6
	tsubcc	%g5,	0x0B9F,	%g3
	brgez,a	%l3,	loop_1103
	addc	%g1,	%i5,	%i3
	rd	%asi,	%i1
	rdpr	%tl,	%o0
loop_1103:
	rdpr	%cansave,	%g6
	andcc	%o7,	0x17B7,	%o1
	movpos	%icc,	%g2,	%o6
	movrlez	%g7,	0x0CC,	%i0
	wrpr	%i2,	0x041E,	%pil
	move	%xcc,	%l5,	%l6
	movg	%xcc,	%o5,	%o3
	wr	%i7,	0x008B,	%pic
	sdivx	%i6,	0x098A,	%o4
	rdhpr	%htba,	%o2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%l1,	0x0B6B,	%cwp
	rdpr	%wstate,	%l4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xEB5, 	%hsys_tick_cmpr
	bpos,a,pt	%xcc,	loop_1104
	fpsub16	%f20,	%f4,	%f20

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x030, 	%hsys_tick_cmpr
	fmovspos	%icc,	%f3,	%f2
loop_1104:
	fbg	%fcc1,	loop_1105
	andcc	%g3,	0x1E29,	%l2
	fmovdle	%icc,	%f0,	%f26
	wr	%l3,	%g1,	%set_softint
loop_1105:
	movrgez	%i3,	0x1DB,	%i1
	wr 	%g0, 	0x6, 	%fprs
	movle	%xcc,	%g6,	%o7
	tl	%icc,	0x1
	movrlz	%o0,	0x11E,	%o1
	rd	%sys_tick_cmpr,	%o6
	rdhpr	%hpstate,	%g2
	sra	%g7,	%i0,	%i2
	te	%xcc,	0x5
	rdpr	%otherwin,	%l6
	wr	%l5,	0x0F85,	%y
	wr	%g0,	0x19,	%asi
	stda	%o4,	[%l7 + 0x38] %asi
	rdhpr	%htba,	%o3
	movle	%xcc,	%i6,	%o4
	mulscc	%o2,	%i7,	%l0
	rdpr	%canrestore,	%l1
	bpos,a	loop_1106
	rdhpr	%htba,	%g4
	fbug,a	%fcc3,	loop_1107
	fmovsvs	%icc,	%f21,	%f4
loop_1106:
	rdhpr	%hintp,	%i4
	bneg	loop_1108
loop_1107:
	wrpr	%l4,	%g5,	%cwp
	std	%l2,	[%l7 + 0x60]
	bshuffle	%f10,	%f16,	%f4
loop_1108:
	movrlz	%l3,	0x1F1,	%g1
	fmovrsgez	%g3,	%f8,	%f11
	wrpr	%i3,	%i5,	%tick
	rdpr	%wstate,	%i1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x515, 	%tick_cmpr
	fmovdg	%xcc,	%f30,	%f8
	taddcctv	%o1,	0x0D7C,	%o6
	tne	%icc,	0x7
	taddcctv	%g2,	0x106F,	%o7
	tcs	%icc,	0x3
	rd	%pc,	%i0
	fpsub32	%f14,	%f30,	%f4
	tge	%xcc,	0x7
	wrpr	%g7,	%i2,	%tick
	fmovsl	%icc,	%f17,	%f13
	rdpr	%tba,	%l5
	and	%l6,	%o3,	%i6
	fmovspos	%icc,	%f26,	%f16
	tneg	%xcc,	0x3
        wr    %g0,    0xe,    %pcr    ! changed.

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x888, 	%hsys_tick_cmpr
	wrpr	%l0,	%i7,	%tick
	xor	%l1,	%g4,	%i4
	wr	%l4,	0x17A5,	%y
	wr	%l2,	0x0F52,	%y
	rdhpr	%htba,	%g5
	wrpr	%g1,	%l3,	%cwp
	sethi	0x0ADC,	%g3
	rdpr	%otherwin,	%i3
	brz	%i5,	loop_1109
	st	%f6,	[%l7 + 0x14]
	movre	%i1,	0x341,	%g6
	movvs	%icc,	%o1,	%o6
loop_1109:
	nop
	setx	loop_1110,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fxnor	%f0,	%f18,	%f18
	rd	%asi,	%o0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x924, 	%hsys_tick_cmpr
loop_1110:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%cwp,	%i0
	orcc	%i2,	%g7,	%l6
	movle	%icc,	%o3,	%i6
	fbg,a	%fcc3,	loop_1111
	ba,pn	%icc,	loop_1112
	rd	%pc,	%l5
	rdhpr	%hpstate,	%o5
loop_1111:
	rd	%pc,	%o4
loop_1112:
	rdpr	%gl,	%l0
	wr	%i7,	0x07A5,	%y
	addccc	%o2,	%g4,	%l1
	rdpr	%canrestore,	%i4
	wr	%l2,	%g5,	%y
	bvs,a	%xcc,	loop_1113
	std	%g0,	[%l7 + 0x68]
	rdpr	%pil,	%l4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xE1E, 	%hsys_tick_cmpr
loop_1113:
	tvs	%icc,	0x4
	rdhpr	%hintp,	%l3
	rdpr	%gl,	%i1
	wr	%i5,	%o1,	%y

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xFC5, 	%hsys_tick_cmpr
	wr	%o7,	0x1140,	%softint
	fbu	%fcc1,	loop_1114
	rdhpr	%htba,	%g2
	movl	%icc,	%o0,	%i2
	wrpr	%g7,	%i0,	%pil
loop_1114:
	wr	%o3,	%l6,	%clear_softint
	udivcc	%l5,	0x125D,	%o5
	ldsw	[%l7 + 0x3C],	%i6
	rd	%y,	%l0
	set	0x28, %l2
	sta	%f14,	[%l7 + %l2] 0x89
	udiv	%i7,	0x0B8B,	%o4
	rdhpr	%hsys_tick_cmpr,	%g4
	movge	%icc,	%l1,	%o2
	rd	%asi,	%l2
	membar	0x04
	taddcc	%g5,	%i4,	%l4
	wrpr	%g1,	%i3,	%pil
	fmovrslez	%l3,	%f18,	%f4
	wrpr	%g3,	0x072D,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xCD6, 	%hsys_tick_cmpr
	wr	%i5,	%o6,	%ccr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xBED, 	%hsys_tick_cmpr
	wr	%o7,	%o0,	%pic
	fand	%f24,	%f4,	%f6
	wr	%i2,	0x04B1,	%clear_softint
	wrpr	%g2,	0x0CA5,	%tick
	wrpr	%i0,	0x08FB,	%pil
	bvc,pt	%xcc,	loop_1115
	tvc	%icc,	0x2
	wrpr	%o3,	0x16AE,	%pil
	tcc	%icc,	0x4
loop_1115:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	sra	%l5,	0x1C,	%o5
	rd	%pc,	%i6
	wrpr	%l0,	%i7,	%cwp
	fmovdvs	%xcc,	%f0,	%f9
	rdhpr	%hintp,	%g4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	sra	%o2,	%l1,	%l2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	fandnot2	%f6,	%f16,	%f22
	fbe	%fcc2,	loop_1116
	fandnot2s	%f0,	%f17,	%f7
	rd	%fprs,	%l4
	rd	%asi,	%g1
loop_1116:
	fbu	%fcc1,	loop_1117
	udivcc	%i3,	0x0219,	%i4
	rdpr	%cwp,	%l3
	lduh	[%l7 + 0x10],	%i1
loop_1117:
	rd	%softint,	%g3
	rdpr	%tl,	%o1
	movpos	%icc,	%o6,	%i5
	rdhpr	%hpstate,	%o7
	rdhpr	%htba,	%g6
	wr	%o0,	%i2,	%ccr
	fpsub32	%f4,	%f26,	%f30
	fbne,a	%fcc2,	loop_1118
	fmovdne	%icc,	%f4,	%f4
	fblg	%fcc0,	loop_1119
	rd	%asi,	%g2
loop_1118:
	rd	%y,	%o3
	edge16n	%i0,	%l6,	%l5
loop_1119:
	wr	%g7,	%i6,	%ccr
	wrpr	%o5,	%l0,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	wr	%o4,	0x0BD9,	%clear_softint
	rd	%asi,	%o2
	edge8	%g4,	%l1,	%l2
	andn	%g5,	0x09AD,	%l4
	rdpr	%pil,	%g1
	fexpand	%f21,	%f22
	wr	%i3,	0x1D2C,	%set_softint
	wrpr	%i4,	%i1,	%cwp
	xor	%g3,	0x1C0B,	%l3
	fpsub16	%f20,	%f30,	%f30
	nop
	setx loop_1120, %l0, %l1
	jmpl %l1, %o1
	wrpr	%o6,	%i5,	%cwp
	rdhpr	%hsys_tick_cmpr,	%g6
	wrpr	%o7,	0x0BE0,	%cwp
loop_1120:
	fpackfix	%f8,	%f19
	movvc	%icc,	%o0,	%i2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%g2,	%l6,	%pil
	rdhpr	%hpstate,	%l5
	rdhpr	%htba,	%i6
	srl	%g7,	%l0,	%o5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x415, 	%tick_cmpr
	wr	%o4,	0x1F9F,	%pic
	tg	%xcc,	0x7
	xor	%l1,	%l2,	%g4
	ldub	[%l7 + 0x49],	%g5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x2C9, 	%hsys_tick_cmpr
	brnz,a	%i4,	loop_1121
	fmovdcc	%xcc,	%f25,	%f14
	wrpr	%g1,	0x0980,	%pil
	tneg	%xcc,	0x5
loop_1121:
	taddcctv	%i1,	%g3,	%o1
	taddcctv	%o6,	0x1EE8,	%l3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x298, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	tle	%icc,	0x2
	rd	%tick_cmpr,	%i5
	rd	%ccr,	%o0
	rd	%pc,	%i2
	wrpr	%i0,	0x0992,	%pil
	rd	%fprs,	%g2
	tsubcctv	%o3,	%l5,	%l6
	rd	%tick_cmpr,	%g7
	rd	%pc,	%i6
	fnot1s	%f2,	%f30
	rd	%ccr,	%o5
	bgu,a	loop_1122
	rdhpr	%hpstate,	%l0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
        wr    %g0,    0xe,    %pcr    ! changed.
loop_1122:
	wrpr	%l2,	%g4,	%cwp
	wr	%l1,	0x0D17,	%set_softint
	andncc	%l4,	%i3,	%i4
	rd	%y,	%g1
	rdhpr	%hsys_tick_cmpr,	%i1
	tcc	%xcc,	0x6
	wrpr	%g3,	0x1BFF,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	movrgez	%o6,	%l3,	%g6
	rd	%sys_tick_cmpr,	%o1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xDFE, 	%tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%y,	%o0
	fornot2s	%f16,	%f25,	%f0
	rd	%y,	%o3
	rd	%softint,	%g2
	wrpr	%l6,	%g7,	%pil
	rdhpr	%hintp,	%l5
	array32	%i6,	%o5,	%l0
	rd	%pc,	%o2
	srlx	%o4,	0x09,	%i7
	bcs,a	%xcc,	loop_1123
	fbne,a	%fcc2,	loop_1124
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
loop_1123:
	rd	%sys_tick_cmpr,	%l2
loop_1124:
	movleu	%icc,	%l4,	%i3
	wrpr	%g1,	0x1DA7,	%tick
	wrpr	%i4,	0x17FC,	%cwp
	umulcc	%i1,	%g5,	%o6
	sethi	0x1BA8,	%g3
	rdpr	%cleanwin,	%l3
	set	0x20, %o7
	ldxa	[%l7 + %o7] 0x19,	%g6
	alignaddrl	%i5,	%o7,	%o1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%cwp,	%o0
	fmovda	%xcc,	%f12,	%f17
	wr	%g0,	0x11,	%asi
	ldsha	[%l7 + 0x46] %asi,	%o3
	sdiv	%g2,	0x15DD,	%i2
	fmovrslz	%g7,	%f6,	%f9
	or	%l5,	0x038B,	%l6
	srax	%o5,	%i6,	%o2
	swap	[%l7 + 0x14],	%l0
	movpos	%icc,	%o4,	%g4
	wr	%l1,	0x0435,	%sys_tick
	wr	%i7,	0x1796,	%pic
	rdpr	%otherwin,	%l4
	wr	%l2,	0x02BB,	%pic
	or	%i3,	%i4,	%i1
	fmovrdlez	%g5,	%f0,	%f2
	xorcc	%g1,	%o6,	%l3
	wrpr	%g6,	0x09EE,	%cwp
	rdhpr	%hintp,	%g3
	ldd	[%l7 + 0x30],	%f12
	rd	%y,	%o7
	edge16	%o1,	%i5,	%i0
	umul	%o0,	%o3,	%i2
	movne	%icc,	%g2,	%g7
	wrpr	%l5,	%l6,	%cwp
	wr	%i6,	0x0518,	%sys_tick
	fmuld8ulx16	%f10,	%f29,	%f22
	rd	%asi,	%o2
	set	0x40, %o0
	stda	%f16,	[%l7 + %o0] 0x89
	rd	%ccr,	%o5
	sub	%l0,	0x147F,	%g4
	fandnot1s	%f0,	%f23,	%f31
	wrpr	%o4,	%i7,	%tick
	rdhpr	%hsys_tick_cmpr,	%l1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	fmovdvs	%xcc,	%f26,	%f20
	rdhpr	%htba,	%l4
	rd	%asi,	%i4
	rdpr	%tl,	%g5
	fmul8x16	%f18,	%f2,	%f22
	rdhpr	%hintp,	%g1
	rdhpr	%hintp,	%i1
	wrpr	%o6,	0x18DA,	%cwp
	rdhpr	%hsys_tick_cmpr,	%l3
	rdhpr	%hintp,	%g3
	rd	%ccr,	%o7
	fnands	%f14,	%f22,	%f14
	fors	%f5,	%f14,	%f26
	rdhpr	%hsys_tick_cmpr,	%o1
	wr	%i5,	0x1154,	%ccr
	add	%g6,	0x1E89,	%i0
	tle	%xcc,	0x4
	movl	%xcc,	%o3,	%i2
	fabsd	%f10,	%f0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	sdivx	%l5,	0x0BB4,	%l6
	wrpr	%g2,	0x1971,	%tick
	rd	%sys_tick_cmpr,	%i6
	wr	%o5,	%o2,	%clear_softint
	umulcc	%g4,	%l0,	%o4
	udivx	%i7,	0x192F,	%l1
	rd	%softint,	%l2
	wr	%l4,	%i4,	%clear_softint
	wr	%i3,	%g5,	%clear_softint
	rd	%asi,	%g1
	ble,pt	%icc,	loop_1125
	rdpr	%cansave,	%o6
	rd	%pc,	%l3
	fpmerge	%f14,	%f18,	%f30
loop_1125:
	fmovrdlz	%i1,	%f2,	%f12
	wr	%o7,	%o1,	%set_softint
	rdhpr	%htba,	%i5
	fandnot2	%f10,	%f22,	%f18
	ldx	[%l7 + 0x08],	%g6
	rd	%asi,	%i0
	rdpr	%cansave,	%o3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x2BC, 	%hsys_tick_cmpr
	rdpr	%otherwin,	%g3
	be	%xcc,	loop_1126
	wrpr	%g7,	0x01D0,	%pil
	wrpr	%o0,	0x0515,	%tick
	sethi	0x0403,	%l5
loop_1126:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x507, 	%hsys_tick_cmpr
	fbge,a	%fcc2,	loop_1127
	wr	%l6,	%i6,	%clear_softint
	wr	%o2,	%o5,	%pic
	rdhpr	%hpstate,	%l0
loop_1127:
	wrpr	%o4,	0x0CCD,	%cwp
	wr 	%g0, 	0x4, 	%fprs
	edge32n	%l1,	%l4,	%i4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%canrestore,	%g1
	movg	%xcc,	%o6,	%i3
	ble,a,pt	%icc,	loop_1128
	rdpr	%cansave,	%i1
	xor	%o7,	%l3,	%o1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1128:
	mova	%xcc,	%i5,	%i0
	rdpr	%gl,	%g6
	rdhpr	%htba,	%i2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x811, 	%hsys_tick_cmpr
        wr    %g0,    0xe,    %pcr    ! changed.
	rdhpr	%htba,	%o0
	wr	%g0,	0x89,	%asi
	stda	%g2,	[%l7 + 0x20] %asi
	fandnot2	%f0,	%f0,	%f28
	wrpr	%l5,	0x00D2,	%tick
	stb	%l6,	[%l7 + 0x2D]

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	sllx	%o5,	%i6,	%l0
	rd	%y,	%o4
	rdpr	%tl,	%i7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fmovsvc	%xcc,	%f20,	%f6
	movcs	%icc,	%i4,	%l2
	tleu	%icc,	0x3
	rd	%tick_cmpr,	%g5
	fnot1s	%f6,	%f11
	fcmpeq16	%f18,	%f14,	%g4
	wrpr	%g1,	%i3,	%cwp
	wr	%g0,	0x18,	%asi
	prefetcha	[%l7 + 0x38] %asi,	 0x3
	rdpr	%tl,	%o7
	pdist	%f2,	%f28,	%f28
	wrpr	%l3,	0x1F34,	%pil
	rdpr	%tl,	%o6
	rdhpr	%htba,	%o1
	rd	%softint,	%i5
	fpack32	%f22,	%f16,	%f16
	rdhpr	%hintp,	%g6
	ldub	[%l7 + 0x6A],	%i0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x4A3, 	%sys_tick_cmpr
	bvc,pt	%xcc,	loop_1129
	addc	%g3,	%g7,	%o0
	fsrc2	%f10,	%f10
	rd	%asi,	%g2
loop_1129:
	wrpr	%o3,	%l5,	%pil
	wrpr	%o2,	0x032C,	%tick
	tneg	%icc,	0x4
	rdpr	%tl,	%l6
	taddcc	%i6,	%o5,	%o4
	wrpr	%i7,	0x0D9E,	%tick
	rdhpr	%hsys_tick_cmpr,	%l1
	rdpr	%gl,	%l4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	set	0x60, %g7
	lda	[%l7 + %g7] 0x14,	%f3
	movg	%icc,	%g5,	%l0
	wrpr	%g4,	%i3,	%tick
	wr	%g1,	0x19CF,	%pic
	rd	%y,	%i1
	rd	%pc,	%l3
	tle	%icc,	0x2
	lduh	[%l7 + 0x20],	%o6
	bcc,a,pt	%icc,	loop_1130
	rdhpr	%hpstate,	%o7
        wr    %g0,    0xe,    %pcr    ! changed.

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_1130:
	movg	%xcc,	%i0,	%g6
	orncc	%g3,	0x130A,	%i2
	movvs	%xcc,	%o0,	%g2
	tleu	%xcc,	0x5
	set	0x46, %g3
	stha	%o3,	[%l7 + %g3] 0x18
	rd	%ccr,	%g7
	fpmerge	%f0,	%f12,	%f12
	wr	%g0,	0x10,	%asi
	stxa	%o2,	[%l7 + 0x50] %asi
	rdhpr	%hintp,	%l5
	wr 	%g0, 	0x5, 	%fprs
	rd	%tick_cmpr,	%l6
	wr	%o5,	0x0D6E,	%softint
	edge16l	%o4,	%l1,	%l4
	fbne,a	%fcc1,	loop_1131
	wr	%i7,	%i4,	%pic
	rdpr	%cansave,	%g5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x691, 	%hsys_tick_cmpr
loop_1131:
	rdhpr	%hpstate,	%i3
	wrpr	%g4,	%g1,	%tick
	rdhpr	%htba,	%l3
	fbule	%fcc0,	loop_1132
	movle	%xcc,	%o6,	%i1
	udivcc	%o7,	0x1BC8,	%o1
	edge32ln	%i0,	%g6,	%i5
loop_1132:
	rdpr	%cwp,	%g3
	membar	0x2C
	add	%o0,	%i2,	%o3
	rdpr	%wstate,	%g7
	wr	%o2,	0x0B4B,	%y
	rd	%ccr,	%l5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xDEA, 	%hsys_tick_cmpr
	xor	%i6,	0x0EC2,	%l6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	st	%f26,	[%l7 + 0x68]
	nop
	setx	loop_1133,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	wrpr	%l1,	%o4,	%cwp
	wrpr	%l4,	%i7,	%tick
	sllx	%i4,	%g5,	%l0
loop_1133:
	rdhpr	%htba,	%l2
	tneg	%icc,	0x2
	bge,pn	%icc,	loop_1134
	smulcc	%i3,	0x17E2,	%g4
	umul	%l3,	%g1,	%i1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x233, 	%hsys_tick_cmpr
loop_1134:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%o1,	0x139B,	%set_softint
	fmovrdlz	%g6,	%f14,	%f0
	fcmpne32	%f20,	%f18,	%i5
	wr	%g3,	%o0,	%clear_softint

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x242, 	%tick_cmpr
	wr	%o2,	%o3,	%sys_tick
	orcc	%l5,	0x15E5,	%i6
	orn	%l6,	0x0F6C,	%g2
	movle	%xcc,	%o5,	%l1
	umul	%o4,	%l4,	%i4
	rdpr	%tl,	%i7
	orcc	%l0,	%l2,	%g5
	wr	%g0,	0x11,	%asi
	ldsha	[%l7 + 0x4C] %asi,	%i3
	tcc	%icc,	0x4
	rdhpr	%hpstate,	%g4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%fprs,	%l3
	wr	%o6,	%i1,	%ccr
	edge32n	%i0,	%o7,	%o1
	fbg	%fcc0,	loop_1135
	fmovdle	%xcc,	%f0,	%f12
	fzero	%f2
	rdpr	%cwp,	%g6
loop_1135:
	wrpr	%g3,	%i5,	%cwp
	rdpr	%cansave,	%o0
	sra	%i2,	0x05,	%o2
	rd	%tick_cmpr,	%g7
	rdpr	%otherwin,	%o3
	wr	%i6,	0x177F,	%ccr
	rdhpr	%hintp,	%l5
	wrpr	%g2,	0x053F,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x96F, 	%hsys_tick_cmpr
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	rdhpr	%htba,	%l6
	movcs	%icc,	%o4,	%l1
        wr    %g0,    0xe,    %pcr    ! changed.
	fxnors	%f30,	%f2,	%f3
	rdhpr	%hintp,	%l4
	bl,a,pt	%xcc,	loop_1136
	wrpr	%l0,	0x10A4,	%cwp
	wr	%g0,	0x10,	%asi
	prefetcha	[%l7 + 0x50] %asi,	 0x0
loop_1136:
	fbu	%fcc0,	loop_1137
	movvs	%icc,	%i7,	%g5
	rd	%asi,	%g4
	wr	%g1,	0x1E81,	%ccr
loop_1137:
	rdpr	%canrestore,	%l3
	rd	%asi,	%i3
	rdhpr	%hsys_tick_cmpr,	%i1
	wr	%o6,	0x143B,	%clear_softint
	wrpr	%i0,	0x1B2B,	%tick
	wrpr	%o1,	%o7,	%cwp
	wrpr	%g3,	%g6,	%tick
	ta	%icc,	0x5
	movn	%icc,	%i5,	%i2
	wr 	%g0, 	0x4, 	%fprs
	rdhpr	%hsys_tick_cmpr,	%g7
	taddcc	%o3,	%i6,	%g2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrlz	%o5,	0x1FA,	%l5
	edge16	%o4,	%l1,	%l6
	add	%i4,	0x071B,	%l4
	wr	%l0,	%i7,	%ccr
	smulcc	%g5,	%g4,	%l2
	movcc	%xcc,	%g1,	%i3
	rd	%ccr,	%i1
	fmovdvs	%icc,	%f7,	%f28

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	bl,a,pn	%icc,	loop_1138
	rdpr	%cansave,	%l3
	rd	%tick_cmpr,	%o7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xAE7, 	%hsys_tick_cmpr
loop_1138:
	rdpr	%gl,	%o1
	rdhpr	%htba,	%g6
	brgez	%i2,	loop_1139
	rd	%softint,	%i5
	rdpr	%pil,	%o0
	swap	[%l7 + 0x68],	%o2
loop_1139:
	rd	%ccr,	%g7
	bne,a	%icc,	loop_1140
	xorcc	%o3,	%i6,	%o5
	rd	%pc,	%l5
	wrpr	%o4,	0x0960,	%cwp
loop_1140:
	rdhpr	%hintp,	%g2
	movvc	%icc,	%l1,	%l6
	rdhpr	%hsys_tick_cmpr,	%i4
	bneg,a,pt	%icc,	loop_1141
	wr 	%g0, 	0x5, 	%fprs
	rdpr	%gl,	%i7
	wr	%g4,	0x0712,	%softint
loop_1141:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdg	%xcc,	%f18,	%f24
	movne	%xcc,	%g5,	%g1
	rdpr	%canrestore,	%i3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	edge32n	%i0,	%l3,	%o6
	rdpr	%tba,	%o7
	edge32n	%g3,	%g6,	%i2
	movle	%xcc,	%i5,	%o1
	wr 	%g0, 	0x6, 	%fprs
	smulcc	%o0,	0x002D,	%g7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fbul	%fcc0,	loop_1142
	rd	%ccr,	%o3
	wr	%o5,	0x042C,	%ccr
	rdhpr	%hpstate,	%o4
loop_1142:
	wrpr	%l5,	0x1734,	%tick
	rd	%ccr,	%l1
	fandnot1s	%f30,	%f5,	%f2
	rd	%asi,	%g2
	rd	%fprs,	%l6
	wrpr	%l0,	0x0B7C,	%cwp
	movre	%i4,	%i7,	%g4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%l4,	0x17D8,	%pic
	wrpr	%i3,	%g1,	%cwp
	nop
	set	0x08, %o2
	ldd	[%l7 + %o2],	%f26
	ldsb	[%l7 + 0x75],	%l2
	wr	%g0,	0x11,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	fbl	%fcc3,	loop_1143
	swap	[%l7 + 0x18],	%i0
	wr	%l3,	%o6,	%y
	rdhpr	%hintp,	%o7
loop_1143:
	lduw	[%l7 + 0x0C],	%i1
	rdhpr	%htba,	%g6
	rd	%softint,	%g3
	wrpr	%i5,	%i2,	%pil
	srl	%o2,	%o1,	%g7
	fmovsleu	%xcc,	%f30,	%f3
	wr	%i6,	0x01D2,	%y
	rdhpr	%htba,	%o3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fsrc2	%f16,	%f10
	movcc	%xcc,	%o4,	%l5
	fnegd	%f18,	%f8
	fbe,a	%fcc0,	loop_1144
	wrpr	%o5,	%g2,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xDCE, 	%hsys_tick_cmpr
	wr	%i4,	%l0,	%clear_softint
loop_1144:
	wr	%i7,	%g5,	%clear_softint
	smulcc	%l4,	%i3,	%g1
	wrpr	%l2,	%i0,	%tick
	edge32	%g4,	%l3,	%o7
	rd	%ccr,	%o6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%pil,	%i5
	wr	%g0,	0x22,	%asi
	stha	%g6,	[%l7 + 0x2C] %asi
	membar	#Sync
	tg	%xcc,	0x7
	rdpr	%cleanwin,	%o2
	tl	%icc,	0x2
	rdhpr	%hpstate,	%i2
	wr	%o1,	0x00BA,	%pic
	rdpr	%cansave,	%i6
	wr 	%g0, 	0x6, 	%fprs
	srlx	%g7,	0x02,	%o4
	rdhpr	%hsys_tick_cmpr,	%l5
	wrpr	%o5,	%l1,	%pil
	wrpr	%g2,	0x1277,	%tick
	movrgez	%l6,	%i4,	%i7
	srl	%l0,	%l4,	%i3
	rdpr	%gl,	%g1
	edge16n	%l2,	%g5,	%g4
	rdhpr	%hsys_tick_cmpr,	%l3
	movgu	%icc,	%o7,	%i0
	wr	%i1,	%o6,	%y
	rdhpr	%hsys_tick_cmpr,	%i5
	wrpr	%g3,	0x16D0,	%tick
	rd	%pc,	%g6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xF95, 	%hsys_tick_cmpr
	rd	%sys_tick_cmpr,	%i6
	subccc	%o1,	0x0CE0,	%o0
	wr	%g7,	0x0131,	%sys_tick
	wrpr	%o3,	0x1673,	%cwp
	wr	%o4,	%l5,	%set_softint
	ldx	[%l7 + 0x40],	%o5
	edge16l	%g2,	%l6,	%i4
	rd	%fprs,	%i7
	rd	%sys_tick_cmpr,	%l0
	bne	%icc,	loop_1145
	flush	%l7 + 0x18
	rdhpr	%hsys_tick_cmpr,	%l1
	wr	%l4,	0x0514,	%ccr
loop_1145:
	wrpr	%g1,	0x0E37,	%pil
	brlez,a	%l2,	loop_1146
	edge32	%i3,	%g5,	%g4
	fmul8x16	%f13,	%f30,	%f20

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_1146:
	rdhpr	%htba,	%i1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	subccc	%i5,	%g3,	%g6
	wr	%g0,	0x88,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	fbl	%fcc3,	loop_1147
	edge8n	%o6,	%o2,	%i6
	fmovsleu	%xcc,	%f31,	%f8
	rd	%fprs,	%o1
loop_1147:
	srax	%o0,	0x02,	%i2
	rdpr	%cansave,	%o3
	rdpr	%cwp,	%o4
	addc	%l5,	%o5,	%g7
	wrpr	%g2,	0x1543,	%tick
	wr 	%g0, 	0x7, 	%fprs
	rdpr	%tba,	%i7
	swap	[%l7 + 0x68],	%l1
	sethi	0x1928,	%l0
	edge16	%g1,	%l2,	%i3
	movvc	%xcc,	%l4,	%g5
	rdpr	%pil,	%l3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xA8F, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%htba,	%i5
	fcmpgt16	%f14,	%f6,	%g3
	rdhpr	%htba,	%i0
	rdhpr	%htba,	%o6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x30B, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	subc	%i2,	0x1ADA,	%o3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xC11, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	subccc	%o5,	%g2,	%l6
	and	%g7,	0x1528,	%i4
	fnands	%f28,	%f23,	%f12
	rdpr	%cansave,	%l1
	srax	%i7,	%l0,	%l2
	add	%i3,	0x18A3,	%g1
	rdhpr	%hintp,	%g5
	udiv	%l4,	0x0CDB,	%o7
	set	0x48, %i4
	sta	%f26,	[%l7 + %i4] 0x81
	rdpr	%gl,	%l3
	rdpr	%cansave,	%g4
	movrgez	%i5,	%i1,	%g3
	rd	%asi,	%o6
	rdhpr	%htba,	%g6
	rdpr	%cwp,	%o2
	rdhpr	%hintp,	%i0
	subccc	%o0,	%i6,	%i2
	rdpr	%wstate,	%o3
	rd	%y,	%o1
	wr 	%g0, 	0x6, 	%fprs
	sra	%o4,	%g2,	%o5
	fnot2s	%f12,	%f31
	rdhpr	%htba,	%l6
	wrpr	%i4,	0x08FB,	%cwp
	wrpr	%l1,	0x02EE,	%tick
	rd	%sys_tick_cmpr,	%i7
	rd	%pc,	%g7
	xnorcc	%l0,	%i3,	%g1
	set	0x60, %l1
	stxa	%l2,	[%l7 + %l1] 0x2a
	membar	#Sync
	rd	%ccr,	%l4
	rdpr	%cwp,	%o7
	set	0x48, %o3
	ldxa	[%l7 + %o3] 0x15,	%l3
	rdpr	%canrestore,	%g4
	tcc	%icc,	0x0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	wrpr	%i1,	%g5,	%tick
	rdhpr	%hintp,	%o6
	fmovdn	%icc,	%f26,	%f26
	rdhpr	%hintp,	%g3
	andncc	%g6,	%o2,	%i0
	sdivx	%i6,	0x064C,	%o0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x291, 	%hsys_tick_cmpr
	rdhpr	%hintp,	%o1
	wrpr	%l5,	%i2,	%tick
	sth	%g2,	[%l7 + 0x3E]
	addcc	%o5,	%l6,	%i4
	sir	0x0F6A
	rdpr	%canrestore,	%l1
	wr	%i7,	%o4,	%set_softint

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xC2F, 	%tick_cmpr
	sllx	%g7,	0x19,	%g1
	fmovdpos	%icc,	%f13,	%f10
	tne	%icc,	0x3
	fmovrslez	%i3,	%f30,	%f28
	rdpr	%tba,	%l4
	rdpr	%cansave,	%o7
	rdhpr	%htba,	%l3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x2E5, 	%tick_cmpr
	sdivx	%g4,	0x1503,	%i5
	rdhpr	%hintp,	%g5
	call	loop_1148
	rd	%y,	%o6
	rdpr	%canrestore,	%g3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x6AF, 	%hsys_tick_cmpr
loop_1148:
	rd	%fprs,	%o2
	taddcc	%i0,	0x10A1,	%i1
	rd	%ccr,	%o0
	wr	%i6,	%o1,	%clear_softint
	fbuge	%fcc3,	loop_1149
	wrpr	%o3,	%i2,	%cwp
	wr	%g2,	%o5,	%softint
	edge8	%l5,	%l6,	%i4
loop_1149:
	rdhpr	%hpstate,	%l1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xA72, 	%hsys_tick_cmpr
	wr	%o4,	%g7,	%y

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xE24, 	%hsys_tick_cmpr
	wrpr	%i3,	%l3,	%tick
	ldsh	[%l7 + 0x46],	%o7
	movcs	%xcc,	%g4,	%l2
	movneg	%icc,	%g5,	%i5
	rdpr	%gl,	%o6
	udivx	%g6,	0x0130,	%g3
	wrpr	%o2,	0x1D91,	%cwp
	rdhpr	%htba,	%i0
	sdiv	%i1,	0x02FD,	%o0
	rd	%asi,	%i6
	rd	%pc,	%o3
	rdhpr	%hpstate,	%o1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x16E, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%htba,	%l6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x7A7, 	%hsys_tick_cmpr
	rd	%sys_tick_cmpr,	%i7
	fnot2	%f22,	%f18
	subcc	%i4,	0x177B,	%l0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x875, 	%hsys_tick_cmpr
	wrpr	%l3,	%o7,	%cwp
	rd	%fprs,	%g1
	rdpr	%tl,	%l2
	movgu	%xcc,	%g4,	%g5
	taddcc	%o6,	0x0600,	%g6
	rdhpr	%hintp,	%i5
	movrlez	%g3,	%i0,	%i1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%hsys_tick_cmpr,	%i6
	wr 	%g0, 	0x6, 	%fprs
	fmovdvs	%xcc,	%f6,	%f31
	tneg	%icc,	0x6
	wr	%g2,	%o1,	%ccr
	andncc	%i2,	%l6,	%o5
	movgu	%xcc,	%l5,	%i7
	wr	%i4,	%l1,	%ccr
	wr	%l0,	0x0DB7,	%ccr
	ldstub	[%l7 + 0x27],	%g7
	wrpr	%o4,	0x1886,	%pil
	rdpr	%tl,	%l4
	rdhpr	%htba,	%l3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x36D, 	%hsys_tick_cmpr
	smulcc	%g1,	0x186E,	%l2
	wrpr	%g4,	0x034D,	%tick
	wrpr	%o7,	0x1AF6,	%pil
	movvc	%xcc,	%g5,	%o6
	tvs	%xcc,	0x1
	fornot2s	%f24,	%f12,	%f10
	array8	%i5,	%g3,	%i0
	rdpr	%canrestore,	%i1
	wr	%g0,	0x2f,	%asi
	stda	%g6,	[%l7 + 0x28] %asi
	membar	#Sync
	rdpr	%wstate,	%o0
	rdhpr	%hpstate,	%i6
	rdpr	%cansave,	%o3
	fnot1s	%f4,	%f2
	movl	%icc,	%o2,	%g2
	movneg	%icc,	%i2,	%o1
	movge	%icc,	%l6,	%o5
	rdpr	%otherwin,	%l5
	brgez,a	%i4,	loop_1150
	edge8	%l1,	%l0,	%g7
	nop
	set	0x5C, %o1
	lduw	[%l7 + %o1],	%o4
	wrpr	%l4,	%l3,	%cwp
loop_1150:
	rdpr	%tba,	%i7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xEC1, 	%hsys_tick_cmpr
	brnz	%l2,	loop_1151
	sllx	%g4,	0x0C,	%g5
	movgu	%icc,	%o6,	%o7
	fmovdcc	%icc,	%f15,	%f8
loop_1151:
	tl	%icc,	0x0
	set	0x30, %g5
	stda	%g2,	[%l7 + %g5] 0x2b
	membar	#Sync
	bneg,pn	%icc,	loop_1152
	rdpr	%canrestore,	%i5
	wrpr	%i1,	%i0,	%tick
	rd	%softint,	%g6
loop_1152:
	wr	%i6,	%o0,	%softint
	subc	%o3,	%g2,	%i2
	taddcctv	%o1,	%l6,	%o5
	wrpr	%l5,	0x1933,	%pil
	wrpr	%i4,	%l1,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	set	0x58, %i1
	swapa	[%l7 + %i1] 0x80,	%g7
	ldd	[%l7 + 0x38],	%f16
	rdpr	%cansave,	%o4
	wr	%l4,	%i7,	%y
	wr	%l3,	%g1,	%clear_softint
	edge16l	%i3,	%g4,	%l2
	rdpr	%tba,	%o6
	movcs	%xcc,	%o7,	%g3
	rdhpr	%hsys_tick_cmpr,	%i5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xA76, 	%hsys_tick_cmpr
	rdhpr	%hintp,	%i1
	rd	%softint,	%i6
	wr 	%g0, 	0x5, 	%fprs
	rdhpr	%htba,	%g2
        wr    %g0,    0xe,    %pcr    ! changed.
	fmovrsgz	%i2,	%f6,	%f5
	wrpr	%o1,	0x00AE,	%pil
	rdhpr	%hpstate,	%o5
	wr 	%g0, 	0x4, 	%fprs
	wr	%l5,	0x08E8,	%y
	rd	%softint,	%l1
	and	%l0,	0x0779,	%g7
	movrgez	%o4,	%o2,	%i7
	fcmps	%fcc2,	%f24,	%f18
	wrpr	%l4,	%g1,	%pil
	movrgz	%i3,	0x15D,	%g4
	fmovs	%f4,	%f23
	rdpr	%cwp,	%l2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xE3D, 	%tick_cmpr
	wr	%o6,	0x0BCC,	%softint
	tn	%icc,	0x6
	rdpr	%cwp,	%o7
	wrpr	%i5,	0x1D9C,	%pil
	rd	%sys_tick_cmpr,	%g3
	wrpr	%g5,	%i0,	%tick
	wrpr	%i1,	0x06AA,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x137, 	%sys_tick_cmpr
	rdpr	%tl,	%o3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%tba,	%g6
	movleu	%icc,	%g2,	%o1
	subc	%i2,	0x023C,	%o5
	rdpr	%cansave,	%i4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x11F, 	%hsys_tick_cmpr
	rdhpr	%hsys_tick_cmpr,	%l1
	fmovrsgz	%l5,	%f3,	%f4
	rdhpr	%htba,	%l0
	tneg	%icc,	0x1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%sys_tick_cmpr,	%o2
	rdpr	%otherwin,	%l4
	rdpr	%otherwin,	%g1
	umul	%i7,	%g4,	%i3
	udivcc	%l2,	0x1445,	%l3
	rdpr	%tba,	%o6
	rdhpr	%hintp,	%o7
	tcs	%xcc,	0x4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fmovrsgz	%g5,	%f20,	%f13
	fmovsn	%xcc,	%f9,	%f11
	tsubcc	%i5,	%i0,	%o0
	smulcc	%i1,	%o3,	%i6
	fpack16	%f30,	%f23
	rdpr	%otherwin,	%g2
	rdpr	%otherwin,	%g6
	fmovrslez	%o1,	%f22,	%f19
	edge32ln	%i2,	%o5,	%i4
	fabss	%f10,	%f1
	fbg,a	%fcc2,	loop_1153
	brz	%l6,	loop_1154
	wr	%l1,	%l0,	%softint
	nop
	setx loop_1155, %l0, %l1
	jmpl %l1, %l5
loop_1153:
	wr	%g7,	%o4,	%sys_tick
loop_1154:
	move	%icc,	%o2,	%l4
	wr	%g0,	0x81,	%asi
	ldda	[%l7 + 0x20] %asi,	%i6
loop_1155:
	wr	%g4,	%g1,	%sys_tick
	nop
	setx loop_1156, %l0, %l1
	jmpl %l1, %l2
	andn	%i3,	0x1EB6,	%o6
	fornot2s	%f0,	%f28,	%f2
	rdhpr	%htba,	%o7
loop_1156:
	rdhpr	%hintp,	%l3
	rdhpr	%hsys_tick_cmpr,	%g5
	subc	%i5,	%i0,	%g3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	umul	%o0,	%i6,	%g2
	movrlez	%g6,	0x160,	%o3
	rd	%tick_cmpr,	%o1
	wrpr	%o5,	%i2,	%pil
	rdhpr	%hpstate,	%l6
	tg	%xcc,	0x1
	rdpr	%canrestore,	%i4
	set	0x70, %l0
	ldsha	[%l7 + %l0] 0x14,	%l1
	rd	%ccr,	%l5
	rd	%ccr,	%g7
	fnot1	%f26,	%f26
	rd	%ccr,	%o4
	fmovscs	%icc,	%f15,	%f20
	wr	%l0,	0x190E,	%clear_softint
	wrpr	%o2,	0x1A9B,	%tick
	wr	%i7,	%g4,	%ccr
	bne,pt	%icc,	loop_1157
	wr	%g1,	0x0A61,	%set_softint

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%otherwin,	%l2
loop_1157:
	fbuge,a	%fcc0,	loop_1158
	rdpr	%cwp,	%o6
	wr	%i3,	0x1B72,	%y
	tcc	%icc,	0x4
loop_1158:
	tvc	%xcc,	0x1
	andncc	%l3,	%g5,	%i5
	rdhpr	%hintp,	%o7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%g0,	0x23,	%asi
	ldda	[%l7 + 0x70] %asi,	%o0
	movn	%xcc,	%i6,	%g2
	rdpr	%cwp,	%i0
	rdpr	%gl,	%g6
	stb	%o3,	[%l7 + 0x19]

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xD0D, 	%tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	mulscc	%i4,	0x082A,	%l6
	fpsub16s	%f9,	%f23,	%f27

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xEF0, 	%hsys_tick_cmpr
	edge8n	%l5,	%g7,	%o4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%htba,	%g4
	membar	0x42

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	subccc	%l0,	%l2,	%o6
	xnor	%l4,	%i3,	%g5
	rdhpr	%hsys_tick_cmpr,	%i5
	rdpr	%otherwin,	%o7
	rd	%softint,	%l3
	wr	%g3,	0x14F1,	%clear_softint
	rdhpr	%htba,	%o0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xA12, 	%hsys_tick_cmpr
	set	0x30, %i7
	stda	%i0,	[%l7 + %i7] 0x2b
	membar	#Sync
	fmovsa	%xcc,	%f9,	%f22
	te	%xcc,	0x3
	rdpr	%tl,	%g6
	ldstub	[%l7 + 0x5A],	%o3
	rdpr	%otherwin,	%o5
	rdhpr	%hsys_tick_cmpr,	%i2
	rdhpr	%hpstate,	%o1
	popc	0x0089,	%i4
	rd	%tick_cmpr,	%l6
	movvs	%xcc,	%g2,	%l5
	wr	%g7,	%o4,	%sys_tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	orncc	%i7,	%g4,	%l1
	movrgez	%l0,	0x27F,	%g1
	fmovdcc	%icc,	%f30,	%f19
	rd	%pc,	%l2
	tgu	%xcc,	0x2
	mulx	%o6,	%i3,	%g5
	brgz	%i5,	loop_1159
	tge	%icc,	0x1
	wrpr	%o7,	0x0020,	%cwp
	rdhpr	%hintp,	%l3
loop_1159:
	wr	%l4,	%g3,	%ccr
	bgu,a	loop_1160
	tne	%xcc,	0x0
	xnorcc	%i1,	%o0,	%i6
	stw	%i0,	[%l7 + 0x10]
loop_1160:
	rdpr	%cwp,	%g6
	wrpr	%o5,	%i2,	%cwp
	rdpr	%otherwin,	%o3
	brgez	%o1,	loop_1161
	movre	%l6,	0x0E6,	%g2
	sir	0x02AD

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_1161:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	addc	%o2,	%g7,	%g4
	wrpr	%l1,	0x1ABA,	%tick
	rd	%tick_cmpr,	%i7
	wrpr	%g1,	%l2,	%tick
	movneg	%xcc,	%l0,	%i3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x032, 	%hsys_tick_cmpr
	xor	%g5,	%o7,	%l4
	fexpand	%f20,	%f12
	rdhpr	%hsys_tick_cmpr,	%l3
	rd	%pc,	%g3
	edge16l	%i1,	%o0,	%i0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x3A3, 	%hsys_tick_cmpr
	wrpr	%g6,	%i2,	%pil
	sllx	%o3,	0x0D,	%o5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	movrlz	%g2,	%i4,	%l6
	rd	%pc,	%o4
	rdhpr	%hsys_tick_cmpr,	%o2
	rdhpr	%htba,	%g7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xBDE, 	%hsys_tick_cmpr
	stw	%l1,	[%l7 + 0x74]
	brnz	%g1,	loop_1162
	array8	%l2,	%i7,	%l0
	bpos,a	%xcc,	loop_1163
	rdpr	%tba,	%i3
loop_1162:
	rdpr	%otherwin,	%i5
	rdhpr	%hsys_tick_cmpr,	%g5
loop_1163:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	taddcctv	%l4,	%o7,	%l3
	subcc	%i1,	0x12A4,	%g3
	rd	%sys_tick_cmpr,	%i0
	edge8l	%o0,	%i6,	%g6
	fcmpgt16	%f16,	%f4,	%i2
	subccc	%o3,	%o5,	%g2
	edge32ln	%i4,	%l6,	%o1
	rd	%asi,	%o2
	rd	%softint,	%g7
	rd	%fprs,	%o4
	wr	%l5,	%l1,	%softint
	wr	%g4,	0x11E6,	%y
	te	%icc,	0x6
	set	0x38, %l3
	lda	[%l7 + %l3] 0x0c,	%f31
	xorcc	%g1,	%l2,	%l0
	tge	%icc,	0x0
	sdivcc	%i7,	0x1BA2,	%i5
	orcc	%g5,	%o6,	%i3
	fba,a	%fcc3,	loop_1164
	ldd	[%l7 + 0x40],	%f10
	ldsh	[%l7 + 0x16],	%o7
	stx	%l3,	[%l7 + 0x78]
loop_1164:
	wrpr	%i1,	%g3,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%ccr,	%o0
	tneg	%xcc,	0x4
	rd	%tick_cmpr,	%i6
	brlz	%i2,	loop_1165
	wrpr	%g6,	%o5,	%cwp
	tleu	%xcc,	0x6
	rd	%sys_tick_cmpr,	%g2
loop_1165:
	wrpr	%i4,	%l6,	%tick
	tpos	%xcc,	0x5
	wrpr	%o3,	0x06A9,	%tick
	wr	%o1,	%g7,	%set_softint
	rdpr	%pil,	%o2
	andncc	%l5,	%l1,	%o4
	rd	%ccr,	%g1
	orcc	%g4,	0x1795,	%l2
	rd	%softint,	%l0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x5B5, 	%hsys_tick_cmpr
	wrpr	%g5,	%o6,	%pil
	rd	%fprs,	%i3
	ta	%icc,	0x0
	rd	%tick_cmpr,	%i5
	fpsub32s	%f15,	%f19,	%f23
	wrpr	%l3,	0x11DF,	%cwp
	rdpr	%cleanwin,	%i1
	bl,pt	%icc,	loop_1166
	popc	%o7,	%i0
	rdpr	%cansave,	%g3
	fmovsvc	%icc,	%f25,	%f9
loop_1166:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%asi,	%i6
	movn	%xcc,	%g6,	%i2
	tvc	%icc,	0x6
	rdhpr	%hpstate,	%o5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%l6,	0x1B51,	%ccr
	wrpr	%o3,	0x1BA1,	%tick
	wr	%o1,	0x1C67,	%pic
	wr	%g7,	0x0995,	%clear_softint
	wr	%o2,	%l5,	%softint

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xD49, 	%tick_cmpr
	movvs	%xcc,	%l1,	%l2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%pc,	%g5
	bn,a,pt	%xcc,	loop_1167
	rdpr	%tl,	%o6
	fmovrsne	%i3,	%f0,	%f14
	fmovrslz	%i5,	%f6,	%f0
loop_1167:
	array8	%i7,	%i1,	%o7
	rd	%fprs,	%i0
	alignaddr	%g3,	%o0,	%l3
	tn	%xcc,	0x2
	wrpr	%l4,	%g6,	%tick
	wr 	%g0, 	0x4, 	%fprs
	tgu	%xcc,	0x7
	wr	%i2,	0x01F3,	%softint
	rdpr	%gl,	%o5
	rd	%y,	%i4
	wr	%g2,	0x0056,	%ccr
	srax	%o3,	0x00,	%l6
	tcs	%icc,	0x5
	be,a,pt	%xcc,	loop_1168
	rdpr	%gl,	%o1
	movrlz	%g7,	0x32F,	%o2
	rdpr	%canrestore,	%l5
loop_1168:
	rd	%asi,	%o4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	set	0x3C, %g4
	swapa	[%l7 + %g4] 0x04,	%g1
	rd	%y,	%g4
	fmul8x16au	%f20,	%f3,	%f10
	fnand	%f2,	%f8,	%f30
	taddcc	%l0,	0x03C6,	%l2
	fbge,a	%fcc2,	loop_1169
	rdpr	%cansave,	%g5
	fpadd16s	%f27,	%f7,	%f19
	sll	%i3,	%i5,	%o6
loop_1169:
	edge16	%i7,	%i1,	%o7
	orncc	%i0,	0x02F0,	%o0
	rdpr	%cansave,	%l3
	rd	%fprs,	%g3
	tne	%icc,	0x0
	tg	%xcc,	0x3
	rdhpr	%hpstate,	%g6
	rdhpr	%hpstate,	%l4
	rd	%y,	%i6
	rdhpr	%hsys_tick_cmpr,	%o5
	wr	%i4,	%i2,	%ccr
	rd	%softint,	%o3
	taddcc	%l6,	0x084E,	%o1
        wr    %g0,    0xe,    %pcr    ! changed.
	movl	%xcc,	%g7,	%l5
	edge8	%o4,	%l1,	%o2
	rdhpr	%hsys_tick_cmpr,	%g1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	siam	0x0
	and	%l2,	0x1CED,	%g5
	wrpr	%i3,	0x1D03,	%tick
	rdhpr	%htba,	%i5
	rd	%ccr,	%l0
	wrpr	%i7,	0x08BD,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%g0,	0x04,	%asi
	lda	[%l7 + 0x08] %asi,	%f2
	edge8l	%o7,	%i0,	%o6
	rdpr	%tl,	%l3
	brlz	%g3,	loop_1170
	rdhpr	%htba,	%g6
	wr 	%g0, 	0x7, 	%fprs
	rdhpr	%hintp,	%i6
loop_1170:
	rdpr	%tba,	%o5
	array8	%i2,	%i4,	%l6
	tn	%xcc,	0x5
	subccc	%o1,	0x0429,	%g2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%tick_cmpr,	%o4
        wr    %g0,    0xe,    %pcr    ! changed.
	rdpr	%otherwin,	%g1
	wr	%l2,	%g4,	%set_softint
	movle	%icc,	%i3,	%g5
	edge8	%i5,	%i7,	%i1
	tne	%xcc,	0x7
	movpos	%icc,	%o7,	%i0
	wr	%o6,	0x0656,	%y
	wr	%l3,	%l0,	%pic
	rdpr	%pil,	%g3
	sethi	0x0B56,	%o0
	sra	%g6,	0x15,	%l4
	sub	%i6,	0x00D5,	%o5
	rdpr	%wstate,	%i4
	rd	%pc,	%l6
	udivx	%i2,	0x01EC,	%o1
	xnorcc	%o3,	%l5,	%g7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x8C7, 	%hsys_tick_cmpr
	rdhpr	%hsys_tick_cmpr,	%l1
	rd	%asi,	%o2
	edge8n	%l2,	%g1,	%g4
	rdhpr	%hpstate,	%i3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x48A, 	%hsys_tick_cmpr
	rdpr	%cansave,	%i5
	movvc	%icc,	%i1,	%o7
	std	%f26,	[%l7 + 0x48]
	srax	%i0,	0x19,	%i7
	wrpr	%o6,	%l3,	%pil
	addcc	%l0,	0x0F65,	%o0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xD63, 	%hsys_tick_cmpr
	fmovdne	%xcc,	%f28,	%f19
	bg,a,pt	%xcc,	loop_1171
	fpack32	%f20,	%f10,	%f18

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%htba,	%o5
loop_1171:
	rd	%asi,	%l6
	rdhpr	%hintp,	%i4
	wr	%o1,	0x1CA4,	%clear_softint
	fpadd32	%f2,	%f24,	%f8
	rd	%ccr,	%i2
	sll	%l5,	%g7,	%o3
	srlx	%o4,	0x08,	%l1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	rd	%asi,	%l2
	movvc	%icc,	%g4,	%i3
	rdpr	%canrestore,	%g1
	rdhpr	%hpstate,	%i5
	edge32ln	%g5,	%i1,	%i0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	add	%o7,	0x1540,	%l0
	fbule	%fcc0,	loop_1172
	wr 	%g0, 	0x7, 	%fprs
	rd	%sys_tick_cmpr,	%o0
	rd	%asi,	%l4
loop_1172:
	movpos	%xcc,	%g3,	%o5
	tg	%icc,	0x3
	wr	%l6,	%i4,	%clear_softint
	fabsd	%f18,	%f28
	edge16l	%i6,	%o1,	%l5
	movge	%xcc,	%i2,	%g7
	andn	%o4,	%l1,	%g2
	popc	%o2,	%l2
!Yo - got one - imm_asi 0x52 
!And yo - immediate is 0x218
	wr	%g0,	0x52,	%asi
	ldxa	[%g0 + 0x218] %asi,	%o3
	rdpr	%wstate,	%g4
	orcc	%i3,	%i5,	%g5
	rdpr	%tl,	%i1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
!Yo - got one - imm_asi 0x57 
!And yo - immediate is 0x0
	set	0x0, %o6
	stxa	%g1,	[%g0 + %o6] 0x57
	rdhpr	%hsys_tick_cmpr,	%i7
	rdpr	%cwp,	%o7
	rd	%softint,	%l0
	add	%l7,	0x18,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%l3
	casa	[%l6] 0x89,	%l3,	%g6
	wrpr	%o0,	0x0556,	%tick
	rd	%ccr,	%o6
	rd	%tick_cmpr,	%g3
	wr	%l4,	%l6,	%sys_tick
	mulscc	%i4,	%i6,	%o1
	movle	%icc,	%l5,	%i2
	fmovdg	%xcc,	%f2,	%f1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	tle	%icc,	0x3
	rd	%ccr,	%l1
	te	%icc,	0x4
	rdpr	%tba,	%g2
	wr	%o2,	0x1C72,	%sys_tick
	rdhpr	%htba,	%l2
	xorcc	%o3,	0x14BF,	%g4
	bne,a	%xcc,	loop_1173
	movleu	%xcc,	%i3,	%o5
	rdhpr	%hintp,	%i5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
loop_1173:
	nop
	set	0x68, %o5
	stwa	%i0,	[%l7 + %o5] 0x2b
	membar	#Sync
	rdhpr	%hpstate,	%g5
	rdpr	%cwp,	%g1
	add	%l7,	0x50,	%l6
	wr	%g0,	0x0c,	%asi
	ldxa	[%l6] %asi,	%i7
	casxa	[%l6] %asi,	%i7,	%o7
	tcs	%xcc,	0x0
	wrpr	%l3,	%l0,	%cwp
	wr	%o0,	0x05EF,	%clear_softint
	movle	%icc,	%o6,	%g3
	edge32	%g6,	%l6,	%l4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
        wr    %g0,    0xe,    %pcr    ! changed.
	tsubcctv	%o1,	0x123F,	%l5
	rdpr	%cleanwin,	%g7
	rd	%sys_tick_cmpr,	%o4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xC19, 	%hsys_tick_cmpr
	rdhpr	%hintp,	%i2
	tg	%icc,	0x1
	rdhpr	%hintp,	%l2
	udivx	%o3,	0x1798,	%g4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	array32	%i3,	%i5,	%o5
	wrpr	%i1,	%g5,	%pil
	rd	%asi,	%g1
	rdhpr	%htba,	%i7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fmovdgu	%icc,	%f23,	%f1
	set	0x40, %i3
	stda	%f0,	[%l7 + %i3] 0x81

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%ccr,	%i0
	edge32n	%o6,	%g3,	%o0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xEFB, 	%hsys_tick_cmpr
	wr	%i4,	0x0292,	%y
	tvs	%xcc,	0x7
	wrpr	%i6,	0x0456,	%pil
	tg	%xcc,	0x5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	tne	%icc,	0x5
        wr    %g0,    0xe,    %pcr    ! changed.
	wrpr	%g2,	0x0DF5,	%cwp
	rdpr	%cleanwin,	%i2
	andcc	%l1,	0x1A92,	%l2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xE49, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x0BA, 	%sys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	rdhpr	%hsys_tick_cmpr,	%o5
	subcc	%i1,	%g1,	%i7
	rdpr	%wstate,	%g5
	rd	%asi,	%l3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x9B2, 	%hsys_tick_cmpr
	rdpr	%tba,	%i0
	rd	%sys_tick_cmpr,	%o6
	wrpr	%g3,	0x05BB,	%tick
	taddcc	%o0,	0x09A8,	%l6
        wr    %g0,    0xe,    %pcr    ! changed.
	fandnot1	%f12,	%f24,	%f6
	ld	[%l7 + 0x58],	%f17
	bge,pn	%icc,	loop_1174
	orn	%i6,	%g6,	%l4
	rd	%asi,	%g7
	array8	%l5,	%o4,	%o1
loop_1174:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%ccr,	%g2
	wrpr	%l2,	%l1,	%tick
	smulcc	%o3,	%o2,	%i3
	rd	%tick_cmpr,	%i5
	wr	%g0,	0x2e,	%asi
	ldda	[%l7 + 0x40] %asi,	%g4
	rdpr	%cleanwin,	%o5
	alignaddr	%i1,	%g1,	%i7
	subc	%g5,	0x04B4,	%o7
	wr	%l0,	0x03E6,	%y
	rdpr	%pil,	%l3
	udivx	%o6,	0x1531,	%g3
	udivcc	%o0,	0x08B1,	%l6
	wr	%i0,	0x0D3B,	%softint
	subccc	%i6,	%i4,	%g6
	rdhpr	%hsys_tick_cmpr,	%l4
	wrpr	%l5,	0x0CE1,	%pil
	wrpr	%g7,	0x1EA9,	%pil
	rdhpr	%hsys_tick_cmpr,	%o4
	xorcc	%i2,	%g2,	%l2
	subc	%l1,	0x1068,	%o1
	rd	%softint,	%o3
	fmovrslez	%i3,	%f2,	%f29
	sra	%i5,	0x06,	%g4
	fpackfix	%f8,	%f20
	rdhpr	%hintp,	%o5
	move	%icc,	%i1,	%o2
	wr	%i7,	%g1,	%ccr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x309, 	%tick_cmpr
	bneg	loop_1175
	wrpr	%l0,	0x1A7E,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x46B, 	%hsys_tick_cmpr
	rdpr	%cleanwin,	%g3
loop_1175:
	edge16n	%o6,	%o0,	%l6
	wrpr	%i6,	0x1A39,	%tick
	rdhpr	%hintp,	%i4
	rd	%asi,	%g6
	srl	%i0,	%l5,	%g7
	srl	%l4,	0x14,	%o4
	add	%l7,	0x0C,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%g2
	casa	[%l6] %asi,	%g2,	%l2
	std	%l0,	[%l7 + 0x20]

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%o3,	%i2,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xDD6, 	%hsys_tick_cmpr
	rd	%pc,	%i5
	popc	%o5,	%i1
	udiv	%i7,	0x0FCD,	%g1
	std	%f12,	[%l7 + 0x18]
	rdpr	%pil,	%o2
	wr	%g5,	0x1074,	%ccr
	rd	%pc,	%l0
	movge	%icc,	%l3,	%o7
	rdpr	%gl,	%o6
	rdpr	%wstate,	%o0
	fmovrdlz	%l6,	%f4,	%f16

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x706, 	%hsys_tick_cmpr
	rd	%ccr,	%g6
	tsubcctv	%i6,	%i0,	%g7
	edge32l	%l5,	%l4,	%g2
	set	0x0A, %i0
	stha	%o4,	[%l7 + %i0] 0x04
	fpsub32	%f14,	%f28,	%f18
	fmovdle	%icc,	%f16,	%f30
	wr	%g0,	0x2a,	%asi
	stxa	%l2,	[%l7 + 0x50] %asi
	membar	#Sync
	rdhpr	%htba,	%l1
	bgu,a	%xcc,	loop_1176
	wr	%o1,	%o3,	%set_softint

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x98C, 	%sys_tick_cmpr
	wr	%i5,	0x1BF1,	%set_softint
loop_1176:
	edge32ln	%g4,	%o5,	%i1
	rd	%tick_cmpr,	%g1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbule	%fcc2,	loop_1177
	bcc	loop_1178
	fnegd	%f10,	%f16
	wr	%o2,	0x1AB3,	%ccr
loop_1177:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xB95, 	%hsys_tick_cmpr
loop_1178:
	stbar
	orn	%g5,	0x19BF,	%o7
	wrpr	%o6,	0x0FB8,	%tick
	rd	%asi,	%o0
	tpos	%icc,	0x6
	movrlez	%l6,	%l3,	%g3
	xorcc	%g6,	0x1B8D,	%i6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x72F, 	%hsys_tick_cmpr
	rdpr	%cleanwin,	%i0
	tcs	%xcc,	0x7
	fpsub16s	%f27,	%f21,	%f17
	ldd	[%l7 + 0x58],	%g6
	rdhpr	%htba,	%l4
	fnegs	%f31,	%f7
	st	%f28,	[%l7 + 0x20]
	rdhpr	%hpstate,	%l5
	rd	%y,	%g2
	wr 	%g0, 	0x4, 	%fprs
	ldub	[%l7 + 0x40],	%o1
	bneg	%icc,	loop_1179
	fabsd	%f2,	%f4
	rdhpr	%hintp,	%l1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x22D, 	%hsys_tick_cmpr
loop_1179:
	ta	%icc,	0x1
	ldsh	[%l7 + 0x0A],	%i3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x15A, 	%hsys_tick_cmpr
	subc	%o5,	0x113E,	%i5
	wr	%g1,	0x05BF,	%y

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fmovse	%icc,	%f0,	%f30
	umulcc	%o2,	0x03AC,	%l0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x068, 	%hsys_tick_cmpr
	fornot1s	%f2,	%f10,	%f18
	fexpand	%f2,	%f8
	wrpr	%o7,	%i7,	%cwp
	rdpr	%otherwin,	%o0
	fnor	%f12,	%f2,	%f8
	rd	%softint,	%l6
	wr	%g0,	0x22,	%asi
	stda	%o6,	[%l7 + 0x68] %asi
	membar	#Sync
	rdpr	%cansave,	%g3
	sdivcc	%l3,	0x004D,	%g6
	bneg,pt	%icc,	loop_1180
	rdhpr	%htba,	%i4
	fmovde	%icc,	%f17,	%f13
	movpos	%icc,	%i0,	%g7
loop_1180:
	rd	%pc,	%l4
	array32	%l5,	%i6,	%l2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	subc	%g2,	0x1DE5,	%l1
	fcmple16	%f20,	%f0,	%i2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	wr 	%g0, 	0x4, 	%fprs

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x597, 	%hsys_tick_cmpr
	andncc	%i5,	%i1,	%g1
	wr	%o2,	0x0161,	%sys_tick
	movleu	%icc,	%g5,	%l0
	rdhpr	%hpstate,	%o7
	rd	%y,	%o0
	xnorcc	%i7,	0x12B4,	%l6
	edge8n	%o6,	%l3,	%g6
	wrpr	%i4,	0x1DD3,	%cwp
	set	0x1C, %i5
	lduwa	[%l7 + %i5] 0x0c,	%g3
	tne	%icc,	0x4
	sethi	0x1577,	%g7
	rdpr	%pil,	%i0
	fcmpne16	%f0,	%f28,	%l4
	rdhpr	%hintp,	%i6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xB55, 	%hsys_tick_cmpr
	rd	%fprs,	%g2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x56A, 	%hsys_tick_cmpr
	wr	%l5,	0x144B,	%pic
	fnot1	%f22,	%f0
	fmovsneg	%icc,	%f26,	%f9
	fsrc2s	%f27,	%f23
	brz	%o1,	loop_1181
	tne	%xcc,	0x6
	wrpr	%i2,	%g4,	%pil
        wr    %g0,    0xe,    %pcr    ! changed.
loop_1181:
	tne	%xcc,	0x5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x42F, 	%hsys_tick_cmpr
	wrpr	%o3,	0x1DE2,	%tick
	edge32	%i1,	%o2,	%g1
	sdivx	%l0,	0x0666,	%o7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	umulcc	%l6,	0x0862,	%o6
	rdhpr	%hpstate,	%l3
	tgu	%xcc,	0x7
	tl	%xcc,	0x7
	orncc	%g5,	%i4,	%g6
	rd	%pc,	%g3
	wrpr	%i0,	0x08BA,	%tick
	fands	%f8,	%f17,	%f4
	rd	%fprs,	%l4
	wr	%i6,	0x0C3E,	%ccr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%g2,	0x047B,	%softint
	rdhpr	%htba,	%l2
	movre	%l1,	%o1,	%l5
	rd	%asi,	%g4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x626, 	%hsys_tick_cmpr
	rdhpr	%htba,	%i3
	rdhpr	%hsys_tick_cmpr,	%i5
	wr 	%g0, 	0x5, 	%fprs
	rdhpr	%htba,	%o3
	rd	%pc,	%g1
	nop
	set	0x78, %g2
	ldd	[%l7 + %g2],	%f18
	sll	%o2,	0x0E,	%o7
	movvs	%xcc,	%l0,	%o0
	tsubcc	%l6,	0x1EBC,	%i7
	rdhpr	%hsys_tick_cmpr,	%l3
	wr	%g5,	0x14B3,	%sys_tick
	rd	%ccr,	%i4
	movrgez	%o6,	0x3B6,	%g3
	rdpr	%canrestore,	%i0
	rdhpr	%htba,	%l4
	wr	%i6,	%g7,	%y
	srlx	%g6,	0x00,	%g2
	fbne	%fcc1,	loop_1182
	rdhpr	%hintp,	%o4
	rd	%pc,	%l2
	wr	%l1,	%o1,	%softint
loop_1182:
	rd	%asi,	%l5
	sdivcc	%i2,	0x1769,	%g4
	sdivx	%i3,	0x05B8,	%o5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x485, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	udiv	%o2,	0x0189,	%o7
	rdpr	%cleanwin,	%l0
	wr	%o0,	%l6,	%sys_tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xC21, 	%hsys_tick_cmpr
	wrpr	%l3,	%i4,	%cwp
	rd	%asi,	%g5
	tgu	%icc,	0x3
	smulcc	%o6,	%i0,	%l4
	move	%icc,	%i6,	%g7
	tvc	%icc,	0x2
	wr	%g0,	0x88,	%asi
	lduwa	[%l7 + 0x14] %asi,	%g3
	wr	%g6,	%g2,	%set_softint
	sdivcc	%l2,	0x1B8B,	%o4
	movrlez	%l1,	0x3CD,	%o1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	rdpr	%canrestore,	%g4
	fornot2	%f26,	%f28,	%f28
	fandnot1s	%f31,	%f21,	%f26
	rdpr	%canrestore,	%i3
	rd	%y,	%l5
	andn	%o5,	%i5,	%i1
	rdpr	%tl,	%o2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x717, 	%hsys_tick_cmpr
	rd	%asi,	%l0
	te	%icc,	0x2
	fandnot1s	%f9,	%f18,	%f25
	fsrc2	%f16,	%f14
	wrpr	%o0,	0x0B22,	%cwp
	fmovsge	%icc,	%f30,	%f27

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x1E4, 	%hsys_tick_cmpr
	tsubcc	%l3,	%i7,	%i4
	wr	%o6,	%i0,	%softint
	wr	%l4,	%g5,	%set_softint
	andcc	%i6,	%g3,	%g6
	rdpr	%gl,	%g7
	xnor	%l2,	%g2,	%l1
	tg	%icc,	0x6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x73D, 	%hsys_tick_cmpr
	rdhpr	%hsys_tick_cmpr,	%i2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%pil,	%l5
	rd	%y,	%g4
	rdhpr	%hpstate,	%o5
	edge32	%i5,	%i1,	%o7
	srax	%l0,	%o0,	%o2
	rdpr	%tl,	%g1
	sdiv	%o3,	0x184E,	%l6
	rdhpr	%hpstate,	%l3
	edge8	%i4,	%i7,	%i0
	mulx	%l4,	0x00CB,	%o6
	fxors	%f31,	%f9,	%f24
	membar	0x45
	lduw	[%l7 + 0x1C],	%i6
	bg,a	%xcc,	loop_1183
	rd	%fprs,	%g5
	wr	%g3,	%g7,	%pic
	wrpr	%g6,	0x0042,	%tick
loop_1183:
	rd	%ccr,	%g2
	tcc	%xcc,	0x3
	movgu	%icc,	%l2,	%l1
	rdpr	%cwp,	%o1
	wrpr	%o4,	%i3,	%cwp
	rdpr	%cansave,	%l5
	mulx	%g4,	%o5,	%i2
	fsrc2	%f8,	%f4
	rdhpr	%hsys_tick_cmpr,	%i5
	movvc	%xcc,	%o7,	%i1
	rd	%pc,	%l0
	mulscc	%o2,	0x0DAC,	%g1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%o0,	0x1213,	%y
	mulscc	%i4,	0x0FEE,	%i7
	movleu	%icc,	%l3,	%l4
	rdhpr	%hsys_tick_cmpr,	%o6
	rdhpr	%hsys_tick_cmpr,	%i6
	movn	%icc,	%g5,	%i0
	mulx	%g3,	0x02C4,	%g6
	rd	%ccr,	%g7
	fnegd	%f16,	%f30
	bneg	loop_1184
	wrpr	%g2,	0x008E,	%cwp
	edge16n	%l1,	%o1,	%l2
	srlx	%o4,	%l5,	%i3
loop_1184:
	wr	%o5,	%g4,	%clear_softint
	rdpr	%canrestore,	%i2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xBC5, 	%hsys_tick_cmpr
	movvc	%xcc,	%l0,	%o2
	bcs	%xcc,	loop_1185
	lduw	[%l7 + 0x60],	%g1
	fsrc2s	%f22,	%f10
	rdhpr	%htba,	%i1
loop_1185:
	rd	%fprs,	%o3
	movvs	%xcc,	%o0,	%i4
	ta	%icc,	0x3
	xorcc	%i7,	0x1D03,	%l6
	membar	0x57
	wrpr	%l3,	0x087C,	%cwp
	rdpr	%canrestore,	%l4
	fsrc2	%f12,	%f10
	xor	%i6,	0x1635,	%g5
	tneg	%icc,	0x0
	wrpr	%o6,	0x1F4C,	%pil
	rdhpr	%hintp,	%i0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%g2,	0x0DB8,	%pic
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	std	%f10,	[%l7 + 0x48]
	srl	%l1,	0x01,	%o1
	wr	%l2,	0x14FB,	%sys_tick
	umulcc	%g3,	0x0332,	%o4
	addccc	%i3,	%o5,	%l5
	rdpr	%otherwin,	%i2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x294, 	%hsys_tick_cmpr
	bpos,pn	%icc,	loop_1186
	rdhpr	%hpstate,	%o7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x9AD, 	%hsys_tick_cmpr
	sethi	0x16C2,	%o2
loop_1186:
	xorcc	%i1,	%o3,	%g1
	rdhpr	%hpstate,	%i4
	wrpr	%o0,	0x1C62,	%pil
	smulcc	%l6,	0x0B72,	%i7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x696, 	%hsys_tick_cmpr
	smulcc	%g5,	%o6,	%l3
	tleu	%icc,	0x4
	rd	%asi,	%i0
	addccc	%g6,	0x1BF5,	%g7
	rd	%y,	%l1
	rdhpr	%hintp,	%o1
	fsrc2s	%f30,	%f18
	membar	0x67
	taddcc	%g2,	%l2,	%o4
	wr	%g3,	%i3,	%clear_softint
	rdpr	%tba,	%o5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	wr	%l5,	0x0C93,	%set_softint
	wrpr	%o7,	0x17A1,	%pil
	wrpr	%l0,	0x0A87,	%pil
	subccc	%i5,	%g4,	%o2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	st	%f28,	[%l7 + 0x14]
	fcmps	%fcc0,	%f11,	%f26
	alignaddrl	%g1,	%i4,	%i1
	wrpr	%o0,	%l6,	%tick
	edge16n	%l4,	%i7,	%i6
	wrpr	%g5,	%o6,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x2D1, 	%hsys_tick_cmpr
	rd	%tick_cmpr,	%i0
	wrpr	%g7,	%l1,	%tick
	fmovrslz	%o1,	%f27,	%f24
	fmovsn	%icc,	%f22,	%f15
	udivcc	%g6,	0x0B7C,	%l2
	brgez,a	%g2,	loop_1187
	wrpr	%g3,	0x0060,	%pil
	rdpr	%wstate,	%o4
	fbuge,a	%fcc3,	loop_1188
loop_1187:
	wrpr	%i3,	0x1306,	%cwp
	ldstub	[%l7 + 0x5F],	%o5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_1188:
	rd	%sys_tick_cmpr,	%i2
	rdpr	%wstate,	%i5
	rdpr	%cleanwin,	%l0
	rd	%pc,	%g4
	bcs,a,pn	%icc,	loop_1189
	wrpr	%o2,	%o3,	%cwp
	wr	%i4,	%i1,	%ccr
	ldd	[%l7 + 0x70],	%g0
loop_1189:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%l4,	%i7,	%pil
	rdhpr	%hsys_tick_cmpr,	%g5
	wrpr	%i6,	0x12A2,	%tick
	bl	%icc,	loop_1190
	tneg	%icc,	0x7
	set	0x40, %l6
	ldda	[%l7 + %l6] 0x04,	%f16
loop_1190:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x0A5, 	%hsys_tick_cmpr
	srl	%g7,	%l1,	%o6
	rdpr	%canrestore,	%g6
	fsrc1s	%f6,	%f31
	rdhpr	%hsys_tick_cmpr,	%o1
	addcc	%g2,	%l2,	%g3
	tl	%icc,	0x4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	ldd	[%l7 + 0x28],	%f20
	fmovrdgz	%l5,	%f24,	%f30
	fmovdcs	%xcc,	%f5,	%f10
	ta	%icc,	0x4
	rd	%softint,	%o7
	fbg	%fcc2,	loop_1191
	rdpr	%wstate,	%o5
	edge8l	%i5,	%i2,	%g4
	rdpr	%pil,	%l0
loop_1191:
	rdhpr	%hintp,	%o2
	add	%l7,	0x78,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%o3
	casxa	[%l6] 0x89,	%o3,	%i1
	rdhpr	%htba,	%g1
	edge32l	%o0,	%l6,	%i4
	sub	%l4,	0x1105,	%i7
	sll	%i6,	0x15,	%g5
	wr	%l3,	0x0F54,	%clear_softint
	wrpr	%i0,	%g7,	%cwp
	wr	%g0,	0x80,	%asi
	sta	%f16,	[%l7 + 0x34] %asi
	rdhpr	%hintp,	%l1
	rdhpr	%hintp,	%o6
	rd	%fprs,	%o1
	bvc	%icc,	loop_1192
	fmovsvc	%xcc,	%f6,	%f5
	brnz	%g6,	loop_1193
	edge32ln	%g2,	%l2,	%g3
loop_1192:
	edge32l	%o4,	%l5,	%o7
	rdhpr	%htba,	%o5
loop_1193:
	fpmerge	%f9,	%f29,	%f22
	wrpr	%i5,	0x1BC9,	%pil
	tg	%xcc,	0x6
	wr	%i2,	0x083E,	%pic
	wrpr	%i3,	0x04BF,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	sdiv	%g4,	0x1A19,	%o3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xDCD, 	%hsys_tick_cmpr
	wrpr	%o2,	%g1,	%tick
	ta	%icc,	0x6
	rdhpr	%hintp,	%o0
	fmovsle	%icc,	%f17,	%f16
	wr	%i4,	0x145A,	%set_softint
	rd	%ccr,	%l6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x9A4, 	%hsys_tick_cmpr
	rdhpr	%hsys_tick_cmpr,	%g5
	fones	%f20
	brnz	%l4,	loop_1194
	wrpr	%i0,	0x1B3C,	%pil
	movvs	%xcc,	%g7,	%l3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_1194:
	rdpr	%gl,	%g6
	movrlez	%l1,	0x127,	%g2
	subc	%g3,	0x1E41,	%o4
	wrpr	%l5,	%l2,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	movrne	%i2,	0x377,	%o7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xC50, 	%hsys_tick_cmpr
	taddcctv	%l0,	%o3,	%g4
	fnands	%f1,	%f24,	%f16

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%cansave,	%o0
	wrpr	%i4,	%l6,	%pil
	rdpr	%wstate,	%g1
	add	%l7,	0x38,	%l6
	wr	%g0,	0x19,	%asi
	casa	[%l6] %asi,	%i7,	%g5
	brz	%l4,	loop_1195
	fmovse	%xcc,	%f0,	%f19

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x4D4, 	%hsys_tick_cmpr
	rdhpr	%hpstate,	%l3
loop_1195:
	fba,a	%fcc3,	loop_1196
	udivx	%i0,	0x0D9F,	%o6
	rdhpr	%hsys_tick_cmpr,	%g6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x8AB, 	%hsys_tick_cmpr
loop_1196:
	movrne	%l1,	%g3,	%l5
	rdpr	%canrestore,	%l2
	mova	%xcc,	%o5,	%o4
	rdpr	%cleanwin,	%i2
	fpsub32s	%f22,	%f6,	%f2
	array16	%o7,	%i5,	%i3
	taddcc	%l0,	%g4,	%o3
	fbe	%fcc0,	loop_1197
	alignaddrl	%o2,	%o0,	%i4
	rd	%pc,	%i1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xC9F, 	%hsys_tick_cmpr
loop_1197:
	rdpr	%pil,	%g5
	alignaddrl	%l4,	%i7,	%i6
	rdhpr	%htba,	%l3
	wrpr	%i0,	0x02B6,	%pil
	movrgz	%g7,	%g6,	%o6
	rd	%sys_tick_cmpr,	%g2
	rdpr	%wstate,	%o1
	movrne	%l1,	0x2ED,	%l5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	ta	%xcc,	0x2
	andcc	%o5,	%l2,	%o4
	bl,a,pn	%xcc,	loop_1198
	rdhpr	%hintp,	%i2
	fmul8x16au	%f5,	%f23,	%f0
	rd	%tick_cmpr,	%o7
loop_1198:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	movle	%xcc,	%l0,	%g4
	stb	%o3,	[%l7 + 0x30]
	sub	%i3,	0x1946,	%o2
	wrpr	%o0,	0x1986,	%pil
	rd	%asi,	%i4
	fmovdl	%icc,	%f1,	%f9
	taddcctv	%l6,	%g1,	%g5
	rd	%y,	%i1
	ldsb	[%l7 + 0x40],	%l4
	tleu	%icc,	0x5
	xnor	%i6,	0x02DA,	%l3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	udivcc	%g6,	0x19BF,	%o6
	rdpr	%tba,	%g2
	tvc	%icc,	0x0
	addc	%l1,	%l5,	%g3
	fmovsleu	%xcc,	%f30,	%f29
	fmovdgu	%xcc,	%f17,	%f6
	rdpr	%tl,	%o5
	srlx	%l2,	0x04,	%o4
	nop
	setx loop_1199, %l0, %l1
	jmpl %l1, %o1
	tl	%icc,	0x6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%hsys_tick_cmpr,	%o7
loop_1199:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	rdpr	%wstate,	%i5
	fnegs	%f25,	%f30
	rdhpr	%hsys_tick_cmpr,	%g4
	rdhpr	%hsys_tick_cmpr,	%o3
	wrpr	%l0,	0x0E55,	%pil
	tleu	%xcc,	0x0
	orncc	%i3,	%o0,	%i4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%tba,	%o2
	movvs	%xcc,	%g1,	%i1
	call	loop_1200
	fmovsl	%xcc,	%f3,	%f2
	fzeros	%f13
	wrpr	%l4,	%g5,	%cwp
loop_1200:
	tge	%xcc,	0x2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x94B, 	%hsys_tick_cmpr
	wrpr	%i7,	%g7,	%tick
	rd	%tick_cmpr,	%i0
	rd	%softint,	%o6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x720, 	%hsys_tick_cmpr
	wrpr	%g2,	0x0BD7,	%tick
	lduh	[%l7 + 0x68],	%l5
	ldsh	[%l7 + 0x74],	%l1
	rdpr	%cwp,	%g3
	rd	%tick_cmpr,	%l2
	orcc	%o4,	0x1812,	%o1
	umulcc	%o5,	0x0DFD,	%o7
	fmovrdne	%i5,	%f20,	%f30

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xC18, 	%hsys_tick_cmpr
	tge	%xcc,	0x4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x223, 	%tick_cmpr
	srl	%i3,	%o3,	%o0
	rdpr	%cleanwin,	%l6
	alignaddr	%i4,	%o2,	%g1
	addc	%l4,	0x0DB2,	%i1
	rdpr	%tba,	%i6
	wrpr	%l3,	0x0A58,	%tick
	swap	[%l7 + 0x50],	%g5
	rd	%pc,	%g7
	orcc	%i0,	0x1A53,	%o6
	rd	%tick_cmpr,	%i7
	set	0x78, %g6
	stxa	%g2,	[%l7 + %g6] 0x2f
	membar	#Sync
	fmovsn	%icc,	%f26,	%f19
	smul	%g6,	%l1,	%l5
	rd	%pc,	%g3
	wrpr	%l2,	0x1B19,	%cwp
	subcc	%o4,	%o1,	%o5
	rdhpr	%hpstate,	%o7
	movvc	%icc,	%i2,	%i5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%o3,	0x07CB,	%y
	movrlez	%o0,	0x25F,	%g4
	udivx	%l6,	0x1DFF,	%i4
	wr	%g0,	0x04,	%asi
	sta	%f11,	[%l7 + 0x44] %asi
	bvs,a	%xcc,	loop_1201
	bge	%icc,	loop_1202
	rdhpr	%hsys_tick_cmpr,	%o2
	xnorcc	%g1,	%l4,	%i1
loop_1201:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x951, 	%hsys_tick_cmpr
loop_1202:
	rdhpr	%hpstate,	%g5
	andncc	%g7,	%i0,	%i7
	wrpr	%g2,	0x0D7D,	%tick
	fcmpgt32	%f16,	%f10,	%o6
	rdhpr	%hpstate,	%g6
	rd	%asi,	%l1
	sir	0x0C65
	wrpr	%l5,	%g3,	%pil
	smulcc	%o4,	0x01EA,	%o1
	tl	%xcc,	0x7
	wr	%g0,	0x10,	%asi
	ldsba	[%l7 + 0x4E] %asi,	%o5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x7ED, 	%hsys_tick_cmpr
	rdhpr	%hpstate,	%i5
	wrpr	%i2,	0x1167,	%cwp
	wr	%i3,	0x078C,	%ccr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x180, 	%hsys_tick_cmpr
	movvc	%icc,	%g4,	%l6
	rdpr	%pil,	%i4
	wr	%o3,	0x04DF,	%y
	wrpr	%o2,	%l4,	%tick
	rdhpr	%htba,	%i1
	andn	%g1,	%i6,	%l3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%softint,	%i0
	wr	%i7,	%g2,	%pic
	movvc	%icc,	%o6,	%g7
	rdpr	%tba,	%l1
	bge,pn	%icc,	loop_1203
	tle	%xcc,	0x5
	rdpr	%cleanwin,	%g6
	movge	%icc,	%g3,	%l5
loop_1203:
	rdpr	%cwp,	%o4
	fba,a	%fcc0,	loop_1204
	movrne	%o5,	%o1,	%o7
	nop
	set	0x40, %o4
	ldsw	[%l7 + %o4],	%i5
	wr	%i2,	%l2,	%sys_tick
loop_1204:
	addcc	%l0,	0x1A1B,	%o0
	rd	%ccr,	%i3
	wr	%g4,	0x12D3,	%pic
	smul	%l6,	0x0F9C,	%i4
	rd	%ccr,	%o2
	lduh	[%l7 + 0x0A],	%o3
	movgu	%icc,	%i1,	%g1
	rd	%ccr,	%l4
	wr 	%g0, 	0x4, 	%fprs
	fabsd	%f4,	%f24
	smulcc	%i6,	%i0,	%i7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x0A6, 	%sys_tick_cmpr
	rd	%fprs,	%l1
	rdhpr	%hsys_tick_cmpr,	%g7
	edge32n	%g3,	%l5,	%o4
	rd	%sys_tick_cmpr,	%o5
	wr	%g6,	0x02F0,	%clear_softint
	movrlez	%o7,	0x04A,	%i5
	fmovdneg	%xcc,	%f16,	%f16
	rd	%pc,	%o1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	swap	[%l7 + 0x6C],	%i2
	std	%f30,	[%l7 + 0x48]
	rdhpr	%hintp,	%l0
	rdpr	%tba,	%l2
	wr	%i3,	0x0F81,	%sys_tick
	rdhpr	%htba,	%o0
	wrpr	%g4,	0x1603,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x641, 	%sys_tick_cmpr
	wr	%g0,	0x22,	%asi
	stxa	%o2,	[%l7 + 0x48] %asi
	membar	#Sync
	rdhpr	%htba,	%l6
	sdivx	%o3,	0x1633,	%g1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xA4F, 	%hsys_tick_cmpr
	addcc	%l4,	0x1F62,	%i6
	rdhpr	%hintp,	%l3
	edge16	%i0,	%i7,	%g5
	ldd	[%l7 + 0x08],	%f20
	umul	%g2,	0x011A,	%l1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x79F, 	%sys_tick_cmpr
	rdhpr	%hsys_tick_cmpr,	%g7
	wr	%o5,	%o4,	%softint
	fmovsge	%xcc,	%f4,	%f29
	sra	%g6,	0x0B,	%o7
	rd	%pc,	%o1
	bshuffle	%f24,	%f30,	%f8
	fbn,a	%fcc2,	loop_1205
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addcc	%i2,	0x1888,	%l0
	rdpr	%tl,	%l2
loop_1205:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	movne	%icc,	%o0,	%i3
	wr	%i4,	%g4,	%set_softint
	fmovdneg	%icc,	%f22,	%f12
	wrpr	%o2,	0x19E1,	%cwp
	fmovsvc	%xcc,	%f9,	%f3
	rd	%ccr,	%o3
	brlz,a	%l6,	loop_1206
	rd	%fprs,	%g1
	fmovsvc	%icc,	%f9,	%f7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_1206:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	wrpr	%l3,	%i0,	%tick
	wr	%g0,	0x0c,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	fbu,a	%fcc3,	loop_1207
	rd	%softint,	%i6
	wrpr	%g5,	0x015A,	%pil
	wrpr	%i7,	%g2,	%cwp
loop_1207:
	nop
	set	0x68, %g1
	stwa	%o6,	[%l7 + %g1] 0x2a
	membar	#Sync

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xBC2, 	%hsys_tick_cmpr
	tl	%icc,	0x1
	wrpr	%g3,	0x12C1,	%pil
	rdpr	%tba,	%o5
	rdpr	%pil,	%g7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%g6,	0x0AC1,	%sys_tick
	add	%o1,	0x1D04,	%o7
	sdiv	%i2,	0x0F75,	%l0
	rdpr	%cwp,	%i5
	rdhpr	%hpstate,	%l2
	alignaddr	%i3,	%o0,	%i4
	rdhpr	%htba,	%g4
	and	%o2,	%o3,	%g1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%ccr,	%l4
	rdhpr	%hpstate,	%l3
	movcs	%icc,	%i0,	%i6
	alignaddrl	%i7,	%g5,	%o6
	bvs,a	%icc,	loop_1208
	wrpr	%l1,	%l5,	%pil
	fbl,a	%fcc1,	loop_1209
	edge16	%g3,	%o5,	%g2
loop_1208:
	rdpr	%tl,	%g7
	rdhpr	%hintp,	%g6
loop_1209:
	rd	%y,	%o4
	alignaddr	%o7,	%o1,	%i2
	rdhpr	%hsys_tick_cmpr,	%i5
	wr	%l2,	%i3,	%ccr
	move	%icc,	%l0,	%o0
	rdhpr	%hsys_tick_cmpr,	%g4
	rdpr	%gl,	%i4
	wr 	%g0, 	0x7, 	%fprs
	wr 	%g0, 	0x7, 	%fprs
	movcs	%icc,	%i1,	%o3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xED1, 	%hsys_tick_cmpr
	wr	%l4,	%i0,	%pic
	set	0x24, %l5
	lduha	[%l7 + %l5] 0x10,	%i7
	rdpr	%otherwin,	%g5
	set	0x30, %l4
	ldda	[%l7 + %l4] 0x81,	%o6
	fmovse	%xcc,	%f23,	%f19
	xnor	%l1,	%i6,	%g3
	fba,a	%fcc3,	loop_1210
	movrlez	%o5,	%g2,	%l5
	add	%g6,	%o4,	%o7
	rdhpr	%htba,	%o1
loop_1210:
	rdpr	%tba,	%g7
	rd	%sys_tick_cmpr,	%i2
	tcs	%icc,	0x0
	st	%f8,	[%l7 + 0x58]
	udivcc	%l2,	0x0AB4,	%i5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x865, 	%tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x2BC, 	%hsys_tick_cmpr
	rdhpr	%hpstate,	%o2
	orncc	%g1,	%l6,	%i3
	rdpr	%canrestore,	%i1
	rd	%y,	%o3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x623, 	%hsys_tick_cmpr
	xorcc	%i0,	%i7,	%l4
	or	%g5,	0x129C,	%o6
	rdhpr	%hsys_tick_cmpr,	%l1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x5D6, 	%hsys_tick_cmpr
	orcc	%o5,	%l5,	%g6
	fpadd16s	%f31,	%f28,	%f3
	fbule	%fcc2,	loop_1211
	movrgz	%o4,	0x2E2,	%o7
	fbo	%fcc1,	loop_1212
	rdhpr	%hpstate,	%o1
loop_1211:
	wr	%g2,	0x0561,	%pic
	ble,pn	%icc,	loop_1213
loop_1212:
	tsubcc	%g7,	0x1158,	%i2
	rd	%y,	%l2
	rdpr	%pil,	%i5
loop_1213:
	rdhpr	%htba,	%l0
	sllx	%g4,	%o0,	%o2
	rd	%sys_tick_cmpr,	%i4
	bge	loop_1214
	umulcc	%l6,	%i3,	%i1
	andncc	%g1,	%l3,	%i0
	fbg	%fcc2,	loop_1215
loop_1214:
	wrpr	%o3,	0x0E6A,	%cwp
	rdhpr	%htba,	%i7
	rd	%sys_tick_cmpr,	%l4
loop_1215:
	wrpr	%g5,	%l1,	%tick
	rd	%fprs,	%o6
	rdpr	%canrestore,	%i6
	rd	%softint,	%o5
	rdpr	%tba,	%l5
	rdpr	%cleanwin,	%g6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%cleanwin,	%o1
	wr	%o7,	%g7,	%ccr
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	rd	%y,	%i2
	wrpr	%g2,	%i5,	%tick
	wr	%l0,	0x1294,	%softint
	wrpr	%g4,	%l2,	%tick
	call	loop_1216
	rdpr	%otherwin,	%o0
	fors	%f12,	%f2,	%f8
	set	0x5C, %i6
	stwa	%i4,	[%l7 + %i6] 0xeb
	membar	#Sync
loop_1216:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	fmovde	%icc,	%f26,	%f26
	wr	%i3,	0x0224,	%set_softint
	tgu	%xcc,	0x4
	rd	%fprs,	%l6
	edge8	%i1,	%l3,	%i0
	wr	%o3,	0x0F49,	%clear_softint
	rd	%tick_cmpr,	%g1
	wrpr	%i7,	0x1E5E,	%pil
	movneg	%xcc,	%g5,	%l1
	fpackfix	%f14,	%f13
	udivx	%o6,	0x1FBE,	%l4
	rd	%pc,	%o5
	wr	%l5,	%i6,	%softint
	tleu	%icc,	0x2
	rd	%fprs,	%g6
	rdhpr	%hintp,	%o4
	rdhpr	%hsys_tick_cmpr,	%o1
	add	%l7,	0x70,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%o7,	%g3
	add	%i2,	%g7,	%g2
	add	%i5,	%g4,	%l2
	sir	0x0B43
	rd	%pc,	%l0
	andcc	%i4,	%o0,	%i3
	mova	%icc,	%l6,	%o2
	rdhpr	%hpstate,	%i1
	smulcc	%l3,	0x144A,	%o3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fpsub16s	%f11,	%f14,	%f14
	fbu,a	%fcc2,	loop_1217
	rd	%y,	%i7
	rdhpr	%hpstate,	%g5
	wr	%l1,	%o6,	%softint
loop_1217:
	wr	%l4,	0x09CE,	%clear_softint
	nop
	setx loop_1218, %l0, %l1
	jmpl %l1, %i0
	rdpr	%canrestore,	%o5
	tg	%xcc,	0x1
	wr	%i6,	0x14E8,	%ccr
loop_1218:
	wrpr	%l5,	0x04F4,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	subc	%o1,	%g6,	%g3
	edge32l	%i2,	%g7,	%g2
	rd	%y,	%o7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x9DC, 	%hsys_tick_cmpr
	wrpr	%i5,	0x0694,	%cwp
	rd	%pc,	%l0
	tle	%icc,	0x0
	edge16l	%l2,	%i4,	%o0
        wr    %g0,    0xe,    %pcr    ! changed.
	swap	[%l7 + 0x50],	%o2
	movl	%xcc,	%l3,	%o3
	srax	%g1,	%i1,	%i7
	wrpr	%l1,	%g5,	%tick
	rdhpr	%hintp,	%l4
	wr	%g0,	0x04,	%asi
	ldswa	[%l7 + 0x5C] %asi,	%o6
	movn	%xcc,	%o5,	%i0
	orn	%i6,	0x0240,	%o4
	rdhpr	%hpstate,	%o1
	wr	%g0,	0x11,	%asi
	stwa	%g6,	[%l7 + 0x08] %asi

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xB0B, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	sdiv	%g3,	0x0A0C,	%g4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%pc,	%l2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	wrpr	%o0,	0x1594,	%pil
	rd	%softint,	%i3
	rdpr	%cwp,	%o7
	wr	%g0,	0x23,	%asi
	stda	%i6,	[%l7 + 0x18] %asi
	membar	#Sync

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	rdpr	%cansave,	%o2
	rdpr	%gl,	%g1
	rd	%fprs,	%o3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xF04, 	%hsys_tick_cmpr
	movn	%icc,	%i7,	%g5
	rd	%softint,	%l1
	fmovsvc	%xcc,	%f8,	%f28
	bpos	%xcc,	loop_1219
	fpadd16s	%f1,	%f13,	%f1
	tpos	%icc,	0x7
	wr	%l4,	0x0516,	%y
loop_1219:
	rdpr	%cwp,	%o5
	wr	%o6,	%i0,	%pic

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xC6D, 	%hsys_tick_cmpr
	rd	%tick_cmpr,	%o1
	wr	%g0,	0x89,	%asi
	ldswa	[%l7 + 0x44] %asi,	%g6
	wr	%l5,	%g7,	%y
	wrpr	%i2,	0x1E3A,	%pil
	ba,a	%icc,	loop_1220
	rdpr	%cwp,	%g2
	bvc,pt	%icc,	loop_1221
	wr	%g3,	%g4,	%sys_tick
loop_1220:
	xor	%i5,	%l0,	%l2
	tleu	%icc,	0x4
loop_1221:
	wr	%i4,	%o0,	%softint
	subc	%o7,	0x0D67,	%i3
	fnot2s	%f4,	%f19
	rdpr	%pil,	%l3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%tick_cmpr,	%o2
	rd	%y,	%o3
	fmovde	%icc,	%f24,	%f10
	wr 	%g0, 	0x7, 	%fprs
	popc	0x0BDB,	%g5
	xnor	%l1,	0x19D5,	%i1
	rdpr	%gl,	%o5
	wrpr	%l4,	%o6,	%cwp
	fmul8x16al	%f17,	%f17,	%f28
	rd	%asi,	%i0
	rdpr	%pil,	%i6
	bpos,pt	%xcc,	loop_1222
	rdhpr	%htba,	%o4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%pc,	%l5
loop_1222:
	fcmpne16	%f2,	%f26,	%o1
	tge	%xcc,	0x5
	xor	%i2,	0x105E,	%g2
	rdpr	%pil,	%g3
	lduw	[%l7 + 0x5C],	%g7
	rd	%asi,	%i5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%hintp,	%l2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%sys_tick_cmpr,	%o7
	wr	%g0,	0x81,	%asi
	stda	%i2,	[%l7 + 0x48] %asi

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xB76, 	%hsys_tick_cmpr
	rdpr	%tba,	%l3
	wrpr	%o3,	0x1957,	%tick
	rd	%asi,	%i7
	fsrc2s	%f30,	%f30
	wrpr	%g5,	%l1,	%tick
	edge32	%o2,	%o5,	%i1
	alignaddrl	%l4,	%o6,	%i6
	wr	%o4,	%i0,	%pic
	edge16l	%g6,	%l5,	%i2
	fbe,a	%fcc1,	loop_1223
	rdhpr	%hintp,	%g2
	rd	%y,	%g3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1223:
	rd	%asi,	%g7
	rdhpr	%htba,	%i5
	rd	%fprs,	%g4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x276, 	%hsys_tick_cmpr
	fmovrslez	%l0,	%f2,	%f17

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x147, 	%hsys_tick_cmpr
	rdpr	%cansave,	%o7
	movrlez	%i3,	0x336,	%l6
	rdhpr	%hsys_tick_cmpr,	%i4
	rd	%y,	%g1
	wrpr	%o3,	0x198F,	%tick
	rdhpr	%hintp,	%i7
	edge32n	%l3,	%g5,	%l1
	movne	%icc,	%o5,	%i1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%o6,	0x1E1E,	%sys_tick
	rdhpr	%htba,	%i6
	rd	%y,	%l4
	wr	%i0,	0x0D51,	%pic
	fmuld8ulx16	%f16,	%f5,	%f0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x7DD, 	%hsys_tick_cmpr
	rd	%asi,	%o4
	wr	%g0,	0x18,	%asi
	stha	%l5,	[%l7 + 0x0A] %asi
	wr	%g0,	0x80,	%asi
	stwa	%g2,	[%l7 + 0x58] %asi
	rdpr	%gl,	%i2
	tcc	%icc,	0x3
	rdhpr	%hintp,	%g7
	rd	%tick_cmpr,	%g3
	fmovrsne	%i5,	%f8,	%f18
	rd	%fprs,	%g4
	rdhpr	%hintp,	%o1
	wr	%l2,	0x1719,	%y
	fpackfix	%f26,	%f26
	sllx	%o0,	0x1E,	%o7
	rdpr	%canrestore,	%i3
	wrpr	%l6,	0x1E58,	%pil
	rdpr	%cwp,	%i4
	wrpr	%l0,	0x0686,	%cwp
	rdpr	%otherwin,	%o3
	rdpr	%canrestore,	%i7
	rdpr	%tba,	%l3
	fornot2s	%f22,	%f27,	%f7
	ldsb	[%l7 + 0x63],	%g5
	fmovsleu	%icc,	%f24,	%f2
	rd	%asi,	%l1
	wr	%o5,	0x13BD,	%set_softint
	mulx	%g1,	0x02CD,	%o2
	tvc	%xcc,	0x7
	rd	%asi,	%o6
	wr	%i6,	0x1B64,	%pic

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x099, 	%hsys_tick_cmpr
	rd	%fprs,	%l4
	ta	%xcc,	0x6
	rdpr	%tl,	%o4
	ldd	[%l7 + 0x08],	%g6
	rd	%pc,	%l5
	rd	%pc,	%g2
	alignaddrl	%i2,	%g7,	%g3
	rd	%pc,	%i5
	rdpr	%otherwin,	%o1
	add	%l7,	0x44,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%g4
	casa	[%l6] %asi,	%g4,	%o0
	movvc	%icc,	%o7,	%l2
	rd	%pc,	%i3
	fpack16	%f12,	%f8
	fbue	%fcc0,	loop_1224
	sllx	%l6,	%l0,	%o3
	fsrc1	%f28,	%f20
	fandnot2s	%f28,	%f28,	%f0
loop_1224:
	tcs	%icc,	0x4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x166, 	%hsys_tick_cmpr
	fmovdneg	%xcc,	%f17,	%f21
	and	%l3,	0x1EE2,	%i4
	subccc	%l1,	%o5,	%g5
	udivx	%g1,	0x0750,	%o6
	wr	%g0,	0x80,	%asi
	stha	%o2,	[%l7 + 0x6E] %asi
	xnorcc	%i6,	0x1C54,	%i1
	rdpr	%cleanwin,	%l4
	rdhpr	%hintp,	%o4
	add	%l7,	0x40,	%l6
	wr	%g0,	0x11,	%asi
	ldxa	[%l6] %asi,	%g6
	casxa	[%l6] 0x11,	%g6,	%l5
	flush	%l7 + 0x7C
	wrpr	%i0,	0x05BE,	%tick
	rd	%softint,	%g2
	std	%f16,	[%l7 + 0x28]
	bl	%icc,	loop_1225
	rdhpr	%hsys_tick_cmpr,	%i2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrde	%g7,	%f16,	%f22
loop_1225:
	te	%icc,	0x0
	nop
	setx	loop_1226,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	bvs,a	loop_1227
	tn	%icc,	0x4
	prefetch	[%l7 + 0x54],	 0x3
loop_1226:
	wrpr	%g3,	0x1066,	%pil
loop_1227:
	rdpr	%cwp,	%i5
	mulx	%o1,	0x15E0,	%g4
	rd	%tick_cmpr,	%o7
	rdpr	%cleanwin,	%o0
	or	%i3,	0x1DCD,	%l6
	rd	%fprs,	%l2
	rdhpr	%hintp,	%l0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x34F, 	%hsys_tick_cmpr
	sll	%i4,	0x1F,	%l1
	rdhpr	%hintp,	%o3
	rdpr	%tl,	%g5
	fsrc1s	%f9,	%f20
	wr	%o5,	0x183B,	%sys_tick
	rdpr	%otherwin,	%o6
	smulcc	%g1,	0x199A,	%i6
	membar	0x1D
	brgz,a	%o2,	loop_1228
	udiv	%l4,	0x11DD,	%o4
	movleu	%xcc,	%i1,	%l5
	flush	%l7 + 0x68
loop_1228:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xB70, 	%hsys_tick_cmpr
	edge32n	%i0,	%g2,	%g7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x6EB, 	%hsys_tick_cmpr
	rdhpr	%hsys_tick_cmpr,	%i2
	rd	%fprs,	%g4
	sdiv	%o7,	0x09B5,	%o0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addc	%o1,	0x09D1,	%l6
	rd	%sys_tick_cmpr,	%l2
	fpsub32s	%f6,	%f25,	%f23
	rd	%y,	%i3
	rdpr	%otherwin,	%i7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	wrpr	%l3,	0x1E52,	%cwp
	rdhpr	%hsys_tick_cmpr,	%i4
	rd	%pc,	%o3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x752, 	%hsys_tick_cmpr
	rd	%sys_tick_cmpr,	%g1
	st	%f3,	[%l7 + 0x28]
	rdhpr	%htba,	%o2
	mulscc	%i6,	0x0FD8,	%l4
	fandnot1s	%f29,	%f0,	%f2
	fcmple32	%f12,	%f16,	%i1
	sra	%o4,	0x04,	%g6
	fnot1s	%f18,	%f15
	fzero	%f2
	movgu	%icc,	%l5,	%i0
	rdhpr	%hintp,	%g7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	srl	%i5,	%g4,	%i2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%ccr,	%o7
	wr	%g0,	0x80,	%asi
	stba	%l6,	[%l7 + 0x44] %asi
	wrpr	%o1,	0x0011,	%pil
	rdpr	%cansave,	%i3
	addccc	%i7,	0x17E9,	%l0
	wr 	%g0, 	0x5, 	%fprs
	add	%l7,	0x20,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%i4
	casxa	[%l6] 0x80,	%i4,	%l2
	rdhpr	%hintp,	%l1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x0CD, 	%hsys_tick_cmpr
	sdiv	%g5,	0x1E93,	%g1
	brnz	%o2,	loop_1229
	tcs	%xcc,	0x7
	fmovsg	%xcc,	%f26,	%f29
	rdhpr	%htba,	%i6
loop_1229:
	rdpr	%gl,	%l4
	fmovdgu	%icc,	%f8,	%f7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xEEB, 	%hsys_tick_cmpr
	tne	%icc,	0x0
	subc	%o4,	%i1,	%g6
	fpack16	%f10,	%f30
	wr	%l5,	0x1088,	%set_softint

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	tcs	%xcc,	0x4
	movpos	%icc,	%g3,	%g7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	rdpr	%otherwin,	%g4
	rdpr	%cleanwin,	%o7
	rdhpr	%hsys_tick_cmpr,	%o0
	mulx	%o1,	%l6,	%i7
	wr	%i3,	%l3,	%set_softint
	brz	%i4,	loop_1230
	rd	%sys_tick_cmpr,	%l0
	fbuge	%fcc2,	loop_1231
	tpos	%xcc,	0x5
loop_1230:
	rdhpr	%hpstate,	%l2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_1231:
	taddcctv	%o3,	%g1,	%g5
	stx	%o2,	[%l7 + 0x48]
	wr	%i6,	%l4,	%ccr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x22C, 	%hsys_tick_cmpr
	mulx	%g6,	0x0484,	%i1
	wr	%g0,	0x19,	%asi
	ldxa	[%l7 + 0x28] %asi,	%i0
	smulcc	%g3,	0x1E3C,	%l5
	rdpr	%tl,	%i5
        wr    %g0,    0xe,    %pcr    ! changed.
	rd	%softint,	%g7
	fsrc1	%f24,	%f22
	wr	%i2,	%g4,	%softint
	wr	%o7,	%o1,	%clear_softint
	rdhpr	%htba,	%o0
	rd	%fprs,	%i7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x59A, 	%hsys_tick_cmpr
	wr	%g0,	0x89,	%asi
	lduba	[%l7 + 0x6C] %asi,	%i4
	rdhpr	%hsys_tick_cmpr,	%l3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x4F7, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x99F, 	%hsys_tick_cmpr
	wr	%o5,	0x0BDD,	%pic
	rd	%pc,	%o3
	rd	%softint,	%g1
	fpackfix	%f24,	%f19
	rd	%ccr,	%l1
	alignaddr	%o2,	%g5,	%i6
	wr	%l4,	0x1D59,	%ccr
	movvs	%xcc,	%o4,	%o6
	fbl	%fcc3,	loop_1232
	wr 	%g0, 	0x7, 	%fprs
	rdpr	%wstate,	%i1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x017, 	%hsys_tick_cmpr
loop_1232:
	wrpr	%i0,	%i5,	%tick
	rdhpr	%hpstate,	%g2
	rdpr	%tba,	%g7
	wr	%i2,	%g4,	%softint
	fand	%f26,	%f14,	%f30
	fbue,a	%fcc2,	loop_1233
	fmovsvc	%icc,	%f19,	%f29
	xorcc	%l5,	0x164A,	%o1
	array16	%o7,	%i7,	%l6
loop_1233:
	rd	%softint,	%o0
	nop
	set	0x70, %i2
	ldx	[%l7 + %i2],	%i3
	array16	%l3,	%i4,	%l2
	fmovsneg	%icc,	%f18,	%f30
	sdivx	%l0,	0x1B3C,	%o5
	brlez,a	%o3,	loop_1234
	fmovdgu	%icc,	%f14,	%f2
	xorcc	%g1,	%o2,	%l1
	wrpr	%i6,	%l4,	%tick
loop_1234:
	rd	%fprs,	%g5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x5EE, 	%hsys_tick_cmpr
	fbn	%fcc2,	loop_1235
	bn,pt	%icc,	loop_1236
	array8	%o4,	%i1,	%i0
	tleu	%xcc,	0x6
loop_1235:
	wr	%g3,	%g2,	%sys_tick
loop_1236:
	wrpr	%g7,	%i2,	%tick
	rdhpr	%htba,	%g4
	addccc	%i5,	%o1,	%o7
	rdpr	%cwp,	%i7
	rdpr	%otherwin,	%l5
	and	%l6,	0x016D,	%i3
	nop
	setx	loop_1237,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	sdivcc	%o0,	0x0DAF,	%i4
	wrpr	%l2,	%l3,	%tick
	wr	%g0,	0x11,	%asi
	ldswa	[%l7 + 0x50] %asi,	%l0
loop_1237:
	wrpr	%o3,	0x0B80,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	be,a	%icc,	loop_1238
	wr	%g1,	%o2,	%set_softint
	tg	%icc,	0x3
	wrpr	%l1,	%i6,	%tick
loop_1238:
	rdpr	%otherwin,	%g5
	tneg	%xcc,	0x1
	bne,a	loop_1239
	fpadd32	%f4,	%f4,	%f14
	rd	%softint,	%o6
	tsubcctv	%g6,	0x11CF,	%l4
loop_1239:
	wr	%o4,	0x06E6,	%set_softint
	rdhpr	%hintp,	%i0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%g0,	0x80,	%asi
	prefetcha	[%l7 + 0x58] %asi,	 0x1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%htba,	%g7
	alignaddr	%i2,	%i5,	%o1
	edge32n	%g4,	%i7,	%l5
	movrgez	%l6,	0x303,	%o7
	fandnot2s	%f7,	%f26,	%f30
	subccc	%o0,	%i4,	%i3
	wrpr	%l2,	%l0,	%cwp
	bshuffle	%f22,	%f24,	%f14
	nop
	setx loop_1240, %l0, %l1
	jmpl %l1, %o3
	andncc	%l3,	%g1,	%o5
	rdhpr	%htba,	%l1
	fcmpeq16	%f30,	%f20,	%i6
loop_1240:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	sll	%g6,	0x05,	%o6
	set	0x28, %o7
	sta	%f24,	[%l7 + %o7] 0x19
	fbuge,a	%fcc2,	loop_1241
	rd	%ccr,	%o4
	add	%l4,	%i1,	%i0
	udivcc	%g3,	0x1660,	%g7
loop_1241:
	fsrc2s	%f15,	%f23
	popc	0x0BDC,	%i2
	wrpr	%g2,	0x1285,	%pil
	fcmped	%fcc0,	%f8,	%f14
	addccc	%o1,	%g4,	%i7
	movrne	%l5,	0x3B5,	%i5
	rd	%y,	%o7
	rdpr	%otherwin,	%o0
	membar	0x37
	rdpr	%cleanwin,	%i4
	rdpr	%canrestore,	%i3
	wr	%l2,	0x0161,	%y
	rd	%tick_cmpr,	%l6
	movre	%l0,	0x11A,	%o3
	tsubcc	%g1,	0x059B,	%o5
	srlx	%l3,	0x06,	%i6
	rd	%y,	%l1
	rdpr	%gl,	%g5
	wrpr	%g6,	0x027C,	%pil
	fmovsvc	%icc,	%f29,	%f31
	rd	%y,	%o6
	rdpr	%gl,	%o4
	rdpr	%tba,	%l4
	fblg	%fcc1,	loop_1242
	rd	%ccr,	%i1
        wr    %g0,    0xe,    %pcr    ! changed.
	xorcc	%g7,	%i2,	%g2
loop_1242:
	tsubcc	%o1,	%g4,	%i0
	rd	%y,	%l5
	fnegd	%f18,	%f16
	rd	%tick_cmpr,	%i5
	nop
	setx	loop_1243,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	wr	%o7,	0x03FA,	%set_softint
	fmovrsne	%i7,	%f16,	%f16
	rdpr	%cwp,	%o0
loop_1243:
	edge16l	%i3,	%i4,	%l6
	rdpr	%tba,	%l0
	rd	%ccr,	%o3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%o5,	0x0B24,	%softint
	movre	%l3,	0x0A5,	%g1
	wrpr	%l1,	%i6,	%tick
	orn	%g6,	0x039F,	%g5
	movvs	%icc,	%o6,	%o4
	xor	%l4,	%i1,	%o2
	fbul,a	%fcc0,	loop_1244
	rdhpr	%hintp,	%g7
	edge8n	%g3,	%g2,	%i2
	rdhpr	%hsys_tick_cmpr,	%g4
loop_1244:
	rd	%asi,	%i0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%cansave,	%l5
	te	%icc,	0x2
	rdpr	%gl,	%o7
	rdpr	%cleanwin,	%i7
	rd	%sys_tick_cmpr,	%i5
	rdpr	%wstate,	%o0
	sllx	%i4,	%i3,	%l0
	rdhpr	%hintp,	%l6
	fbu,a	%fcc2,	loop_1245
	fnot2s	%f3,	%f5
	sub	%o3,	%o5,	%l3
	rdpr	%cansave,	%g1
loop_1245:
	rd	%ccr,	%l1
	wr	%l2,	%i6,	%softint
	wr	%g6,	%o6,	%ccr
	edge16	%g5,	%l4,	%i1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x55F, 	%hsys_tick_cmpr
	movl	%icc,	%o2,	%g2
	fpsub32	%f6,	%f20,	%f2
	sdivx	%g3,	0x15E8,	%g4
	fxor	%f24,	%f28,	%f20
	rd	%y,	%i0
	fmovrde	%o1,	%f26,	%f10
	ldsb	[%l7 + 0x58],	%i2
	orncc	%o7,	0x1A5D,	%l5
	rd	%y,	%i7
	fmovrsne	%o0,	%f2,	%f19
	rd	%fprs,	%i4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x1FA, 	%hsys_tick_cmpr
	bn	loop_1246
	edge16l	%i3,	%l6,	%o3
	fnor	%f14,	%f28,	%f6
	wrpr	%l0,	%l3,	%pil
loop_1246:
	rdpr	%gl,	%g1
	rdpr	%cleanwin,	%l1
	rdhpr	%htba,	%o5
	fbg,a	%fcc3,	loop_1247
	rd	%softint,	%i6
	rdpr	%gl,	%l2
	movrlez	%g6,	0x110,	%g5
loop_1247:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%i1,	%o4,	%sys_tick
	edge16n	%o2,	%g2,	%g7
	tle	%xcc,	0x0
	wr	%g3,	0x15A9,	%set_softint
	wr	%i0,	0x0C31,	%y
	stbar
	rdhpr	%hintp,	%g4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%asi,	%l5
	rdhpr	%htba,	%i7
	rdpr	%cleanwin,	%o7
	wrpr	%i4,	0x1CD1,	%pil
	movg	%xcc,	%i5,	%o0
	wrpr	%i3,	%o3,	%pil
	wrpr	%l0,	0x0996,	%tick
	edge32l	%l6,	%g1,	%l1
	rdhpr	%hintp,	%o5
	smul	%i6,	%l3,	%l2
	rd	%sys_tick_cmpr,	%g6
	rdpr	%cwp,	%g5
	rd	%asi,	%l4
	rd	%fprs,	%i1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wrpr	%o4,	0x1AD2,	%pil
	ldsh	[%l7 + 0x1A],	%o2
	rd	%sys_tick_cmpr,	%g2
	rdhpr	%hsys_tick_cmpr,	%o6
	rdpr	%cansave,	%g3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%i0,	%o1,	%softint
	wr	%l5,	0x12ED,	%pic
	wr	%g0,	0x2b,	%asi
	ldda	[%l7 + 0x30] %asi,	%i6
	ldd	[%l7 + 0x50],	%o6
        wr    %g0,    0xe,    %pcr    ! changed.
	wrpr	%i5,	%i4,	%tick
	fpsub16	%f30,	%f6,	%f4
	wrpr	%o0,	0x0A78,	%cwp
	nop
	setx loop_1248, %l0, %l1
	jmpl %l1, %i3
	rdhpr	%hpstate,	%l0
	wrpr	%l6,	0x09EE,	%tick
	rd	%y,	%g1
loop_1248:
	ba,pt	%icc,	loop_1249
	rdhpr	%hsys_tick_cmpr,	%l1
	rdpr	%otherwin,	%o3
	fbn	%fcc3,	loop_1250
loop_1249:
	udivx	%i6,	0x107F,	%o5
	wr	%l2,	0x0F27,	%sys_tick
	taddcc	%g6,	%g5,	%l4
loop_1250:
	bn,pt	%icc,	loop_1251
	fmovrse	%l3,	%f31,	%f16
	ldd	[%l7 + 0x18],	%f0
	rdpr	%canrestore,	%i1
loop_1251:
        wr    %g0,    0xe,    %pcr    ! changed.
	wrpr	%g2,	%o2,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xF04, 	%tick_cmpr
	movrgz	%g3,	0x1C3,	%g7
	rd	%tick_cmpr,	%g4
	rdpr	%cwp,	%i0
	rdhpr	%hpstate,	%l5
	srax	%i7,	0x14,	%o7
	alignaddr	%i2,	%i5,	%o1
	edge16l	%o0,	%i4,	%l0
	rdhpr	%hpstate,	%l6
	wr	%g0,	0x80,	%asi
	lduha	[%l7 + 0x2A] %asi,	%g1
	rdpr	%pil,	%i3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xB30, 	%hsys_tick_cmpr
	wrpr	%i6,	%o5,	%pil
	fnegs	%f0,	%f6
	bl,a	%xcc,	loop_1252
	wr	%l2,	%g5,	%pic

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xEEC, 	%hsys_tick_cmpr
loop_1252:
	wr	%o4,	0x039C,	%ccr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%hpstate,	%o2
	rdhpr	%htba,	%o6
	fpack16	%f28,	%f4
	wrpr	%g3,	%g7,	%pil
	rdhpr	%hintp,	%i0
	wr 	%g0, 	0x4, 	%fprs

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xA16, 	%hsys_tick_cmpr
	rd	%y,	%l5
	tle	%icc,	0x1
	rd	%softint,	%i2
	add	%l7,	0x08,	%l6
	wr	%g0,	0x04,	%asi
	lda	[%l6] %asi,	%i5
	casa	[%l6] %asi,	%i5,	%o1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x738, 	%tick_cmpr
	and	%i4,	0x168A,	%l0
	rdpr	%tl,	%o7
	fmovdge	%xcc,	%f9,	%f27
	movg	%icc,	%l6,	%g1
	sll	%i3,	0x1E,	%l1
	wrpr	%o3,	0x0731,	%cwp
	wrpr	%i6,	0x15CD,	%cwp
	wrpr	%o5,	%l2,	%tick
	rdhpr	%hpstate,	%g5
	smul	%g6,	0x1049,	%i1
	wr	%o4,	%g2,	%sys_tick
	sdiv	%l4,	0x0C88,	%o2
	lduh	[%l7 + 0x26],	%l3
	fornot2	%f26,	%f10,	%f20
	fblg,a	%fcc2,	loop_1253
	wrpr	%g3,	%o6,	%cwp
	tcs	%icc,	0x4
	wrpr	%g7,	%g4,	%tick
loop_1253:
	movre	%i7,	%i0,	%i2
	edge8n	%l5,	%i5,	%o0
	tvc	%icc,	0x7
	rdpr	%tba,	%o1
	wr	%l0,	%o7,	%y
	rdpr	%gl,	%l6
!Yo - got one - imm_asi 0x57 
!And yo - immediate is 0x0
	set	0x0, %o0
	stxa	%i4,	[%g0 + %o0] 0x57
	rdhpr	%hintp,	%g1
	rdhpr	%htba,	%l1
	rd	%asi,	%o3
	wr	%i3,	%i6,	%ccr
	tvs	%xcc,	0x5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	ta	%xcc,	0x3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%hsys_tick_cmpr,	%o4
	edge32l	%g2,	%i1,	%o2
	rdhpr	%hintp,	%l3
	wr	%g0,	0x80,	%asi
	lduba	[%l7 + 0x73] %asi,	%g3
	edge32n	%o6,	%l4,	%g4
	bg,a	loop_1254
	xor	%g7,	0x1805,	%i7
	movgu	%icc,	%i0,	%l5
	rd	%pc,	%i2
loop_1254:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x487, 	%tick_cmpr
	fpsub32	%f8,	%f18,	%f14
	ldd	[%l7 + 0x30],	%l0
	fnors	%f19,	%f15,	%f16
	tleu	%icc,	0x5
	edge32ln	%o7,	%i5,	%i4
	subc	%g1,	%l6,	%l1
	fmovdpos	%icc,	%f3,	%f26
	membar	0x38
	rd	%tick_cmpr,	%o3
	rdpr	%cwp,	%i6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	movle	%icc,	%g5,	%g6
	wr	%o5,	0x0E86,	%sys_tick
	wr 	%g0, 	0x4, 	%fprs
	fmovrsgz	%o4,	%f3,	%f26
	rdpr	%cwp,	%o2
	subccc	%i1,	0x0228,	%l3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x528, 	%sys_tick_cmpr
	fbu	%fcc1,	loop_1255
	tgu	%icc,	0x2
	rdhpr	%hsys_tick_cmpr,	%o6
	wr	%l4,	%g7,	%clear_softint
loop_1255:
	nop
	wr	%g0,	0x0c,	%asi
	ldswa	[%l7 + 0x5C] %asi,	%i7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	array32	%g4,	%l5,	%i2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x63D, 	%hsys_tick_cmpr
	sra	%o7,	%o1,	%i4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%hsys_tick_cmpr,	%o3
	umulcc	%i6,	%l2,	%g6
	addccc	%o5,	0x0FA7,	%g5
	orn	%i3,	%g2,	%o4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x83F, 	%hsys_tick_cmpr
	fxors	%f7,	%f24,	%f14
	fones	%f27
	fsrc1s	%f5,	%f31
	wrpr	%l3,	0x1B55,	%tick
	add	%l7,	0x60,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%g3
	casxa	[%l6] %asi,	%g3,	%o6
	movgu	%icc,	%o2,	%g7
	sll	%l4,	%i7,	%g4
	bneg,a	%xcc,	loop_1256
	fandnot2	%f8,	%f24,	%f12
	wrpr	%i0,	%l5,	%pil
	fmovrdlez	%i2,	%f20,	%f10
loop_1256:
	rd	%y,	%o0
	movg	%icc,	%o7,	%o1
	fblg	%fcc3,	loop_1257
	rd	%ccr,	%i4
	edge8	%i5,	%l6,	%g1
	wrpr	%l1,	%l0,	%tick
loop_1257:
	rd	%softint,	%i6
	wr	%o3,	0x163E,	%y
	wrpr	%g6,	%o5,	%pil
	wr	%g5,	0x0267,	%y
	fmovse	%xcc,	%f14,	%f6
	wrpr	%i3,	%g2,	%cwp
	smul	%o4,	0x0100,	%l2
	addc	%l3,	%g3,	%i1
	rd	%softint,	%o6
	srl	%g7,	%o2,	%i7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x92E, 	%hsys_tick_cmpr
	rdhpr	%hintp,	%i0
	sdivx	%l5,	0x1D3A,	%l4
	wrpr	%i2,	0x0922,	%tick
	fbne	%fcc3,	loop_1258
	fbl,a	%fcc1,	loop_1259
	movrlez	%o7,	%o1,	%o0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_1258:
	wrpr	%i4,	%g1,	%pil
loop_1259:
	brnz,a	%l0,	loop_1260
	rdpr	%pil,	%l1
	rdpr	%pil,	%i6
	array8	%g6,	%o3,	%o5
loop_1260:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xC15, 	%hsys_tick_cmpr
	rdhpr	%hpstate,	%o4
	edge16	%l2,	%l3,	%g5
	rd	%tick_cmpr,	%g3
	wrpr	%o6,	%i1,	%cwp
	rdhpr	%hpstate,	%o2
	rd	%fprs,	%g7
	move	%xcc,	%g4,	%i0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xD17, 	%hsys_tick_cmpr
	rdhpr	%hsys_tick_cmpr,	%i7
	wr 	%g0, 	0x4, 	%fprs
	fmovdcc	%xcc,	%f31,	%f14
	edge16	%i2,	%o7,	%o0
	rdhpr	%hsys_tick_cmpr,	%i5
	fbe	%fcc3,	loop_1261
	srax	%l6,	%o1,	%i4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x19F, 	%hsys_tick_cmpr
	xnor	%g1,	%l1,	%i6
loop_1261:
	rdhpr	%hpstate,	%g6
	or	%o5,	%o3,	%g2
	orncc	%o4,	0x184A,	%i3
	rdhpr	%hintp,	%l3
	wrpr	%g5,	%g3,	%tick
	move	%xcc,	%l2,	%o6
	fbg	%fcc1,	loop_1262
	rdhpr	%hintp,	%i1
	rd	%softint,	%g7
	rd	%ccr,	%o2
loop_1262:
	rd	%y,	%g4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xD1C, 	%hsys_tick_cmpr
	rd	%y,	%l4
	rd	%y,	%i2
	rdhpr	%hpstate,	%i7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x957, 	%hsys_tick_cmpr
	alignaddr	%i5,	%o1,	%l6
	edge16n	%l0,	%i4,	%l1
	addc	%g1,	%i6,	%o5
	rdhpr	%hintp,	%g6
	rdpr	%wstate,	%o3
	edge32n	%o4,	%g2,	%i3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xC0B, 	%tick_cmpr
	rdpr	%otherwin,	%g3
	edge16l	%l2,	%l3,	%i1
	wrpr	%g7,	0x015D,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xFDE, 	%hsys_tick_cmpr
	rdpr	%gl,	%g4
	rdhpr	%hpstate,	%l5
	tsubcctv	%l4,	0x11F9,	%i0
	be,a	%xcc,	loop_1263
	wrpr	%i2,	%i7,	%cwp
	rdpr	%gl,	%o0
	rdpr	%cansave,	%o7
loop_1263:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%cwp,	%i5
	wr	%l6,	%i4,	%pic
	edge16	%l1,	%g1,	%l0
	rdpr	%canrestore,	%i6
	brlz,a	%o5,	loop_1264
	rd	%y,	%o3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x032, 	%hsys_tick_cmpr
	bgu,pt	%xcc,	loop_1265
loop_1264:
	edge32n	%g2,	%g5,	%g3
	sethi	0x1619,	%l2
	rdpr	%cleanwin,	%l3
loop_1265:
	movl	%icc,	%i3,	%i1
	rdhpr	%hintp,	%g7
	fpadd32s	%f27,	%f9,	%f24
	rdhpr	%hintp,	%o6
	rdhpr	%hintp,	%g4
	rdpr	%canrestore,	%l5
	rdhpr	%htba,	%l4
	rdhpr	%hintp,	%i0
	wrpr	%o2,	0x1DDE,	%cwp
	alignaddr	%i7,	%o0,	%i2
	siam	0x3
	fcmpne32	%f14,	%f2,	%o7
	udivcc	%i5,	0x0457,	%o1
	movle	%xcc,	%l6,	%i4
	rdpr	%cwp,	%g1
	wrpr	%l1,	0x1290,	%tick
	rdpr	%gl,	%i6
	wr 	%g0, 	0x5, 	%fprs
	rdhpr	%hpstate,	%o3
	lduh	[%l7 + 0x7A],	%o5
	fsrc1s	%f11,	%f9
	rdhpr	%htba,	%g6
	set	0x44, %g7
	swapa	[%l7 + %g7] 0x0c,	%o4
	alignaddr	%g5,	%g3,	%l2
	rdpr	%tl,	%l3
	edge8ln	%g2,	%i3,	%g7
	wrpr	%i1,	0x02D4,	%cwp
	rdhpr	%hintp,	%o6
	wrpr	%g4,	0x0292,	%pil
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addcc	%l5,	%l4,	%i0
	wrpr	%o2,	0x1985,	%pil
	rd	%fprs,	%o0
	bne,pt	%icc,	loop_1266
	ta	%icc,	0x7
	tl	%xcc,	0x6
	fandnot1s	%f3,	%f6,	%f25
loop_1266:
	wr 	%g0, 	0x4, 	%fprs

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%hintp,	%i5
	flush	%l7 + 0x3C
	rdpr	%cansave,	%i7
	membar	0x64
	rd	%y,	%l6
	fmovde	%icc,	%f14,	%f26
	wrpr	%i4,	%g1,	%cwp
	alignaddr	%l1,	%o1,	%l0
	be,a,pt	%xcc,	loop_1267
	wrpr	%o3,	%o5,	%pil
	rdhpr	%hsys_tick_cmpr,	%g6
	wr	%g0,	0x89,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
loop_1267:
	sdivx	%i6,	0x1872,	%g5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x6AE, 	%hsys_tick_cmpr
	edge32	%l3,	%g3,	%i3
	smulcc	%g2,	%g7,	%o6
	wrpr	%g4,	0x0410,	%tick
	std	%l4,	[%l7 + 0x68]
	wrpr	%i1,	0x026F,	%tick
	umul	%i0,	0x1DFD,	%o2
	rdpr	%wstate,	%l4
	rd	%fprs,	%o0
	rd	%pc,	%o7
	smul	%i2,	%i7,	%l6
	wrpr	%i4,	0x0DF3,	%tick
	alignaddr	%i5,	%l1,	%o1
	edge8n	%g1,	%l0,	%o3
	rdhpr	%htba,	%o5
	srax	%g6,	%g5,	%o4
	wr	%i6,	0x0576,	%clear_softint
	rd	%pc,	%l2
	wrpr	%g3,	0x034D,	%cwp
	rd	%tick_cmpr,	%i3
	rdhpr	%hpstate,	%g2
	fmuld8ulx16	%f26,	%f14,	%f10
	udiv	%g7,	0x1E7A,	%l3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x763, 	%hsys_tick_cmpr
	wrpr	%g4,	%l5,	%cwp
	set	0x16, %g3
	ldsha	[%l7 + %g3] 0x11,	%i0
	movrlez	%o2,	%l4,	%o0
	fmovdleu	%xcc,	%f1,	%f25
	ldsw	[%l7 + 0x50],	%i1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	fmovdgu	%icc,	%f26,	%f18
	rdhpr	%hsys_tick_cmpr,	%l6
	movrlez	%i4,	%i7,	%l1
	stw	%i5,	[%l7 + 0x3C]

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	rd	%y,	%o1
	fmovrslez	%o3,	%f18,	%f8
	fsrc2	%f26,	%f0
	fpackfix	%f12,	%f7
	movle	%xcc,	%g6,	%g5
	edge32	%o5,	%o4,	%l2
	rdhpr	%hintp,	%i6
	fpsub16	%f30,	%f22,	%f12
	wrpr	%g3,	%g2,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x11E, 	%hsys_tick_cmpr
	rd	%fprs,	%l3
	addc	%g7,	%o6,	%l5
	rdpr	%cansave,	%i0
	mulx	%g4,	0x12EA,	%o2
	swap	[%l7 + 0x78],	%l4
	movgu	%icc,	%o0,	%i2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x782, 	%sys_tick_cmpr
	rd	%ccr,	%i4
	fmovrsgz	%i7,	%f15,	%f3
	wr	%l1,	%l6,	%softint
	wrpr	%g1,	0x1ED7,	%cwp
	taddcctv	%l0,	0x1980,	%i5
	rd	%sys_tick_cmpr,	%o1
	tneg	%icc,	0x0
	orcc	%o3,	%g5,	%o5
	movle	%icc,	%o4,	%g6
	sll	%l2,	0x0E,	%g3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x7C6, 	%hsys_tick_cmpr
	sethi	0x198E,	%g2
	movrlz	%g7,	%l3,	%o6
	rdhpr	%hsys_tick_cmpr,	%l5
	fpadd16s	%f31,	%f20,	%f7
	tle	%xcc,	0x0
	mova	%icc,	%g4,	%i0
	wr	%l4,	%o2,	%clear_softint
	te	%xcc,	0x2
	rd	%fprs,	%i2
	rd	%y,	%i1
	tcs	%icc,	0x1
	edge8n	%o7,	%o0,	%i4
	fpadd16	%f28,	%f2,	%f16

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x6D1, 	%hsys_tick_cmpr
	fbue	%fcc1,	loop_1268
	movrlz	%l6,	0x245,	%g1
	wrpr	%l0,	0x014D,	%cwp
	wr	%l1,	%i5,	%sys_tick
loop_1268:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	tvc	%xcc,	0x2
	fbne	%fcc2,	loop_1269
	rd	%y,	%g5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	array32	%l2,	%g3,	%o5
loop_1269:
	rdpr	%gl,	%i3
	wrpr	%i6,	%g2,	%tick
	wr	%g7,	%o6,	%ccr
	fmovsgu	%icc,	%f20,	%f1
	rdhpr	%htba,	%l3
	wrpr	%l5,	0x0614,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x22B, 	%hsys_tick_cmpr
	movpos	%icc,	%i0,	%o2
	subcc	%i2,	%l4,	%i1
	orn	%o0,	%o7,	%i4
	tpos	%xcc,	0x1
	edge16ln	%l6,	%i7,	%l0
	rd	%y,	%l1
	rdhpr	%hintp,	%i5
	rdhpr	%hintp,	%o1
	movgu	%icc,	%g1,	%g5
	wr	%g0,	0xe3,	%asi
	stwa	%o3,	[%l7 + 0x10] %asi
	membar	#Sync
	wr	%o4,	0x1CAF,	%y
	umulcc	%l2,	0x07A4,	%g6
	tvc	%xcc,	0x5
	wrpr	%o5,	%g3,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xABE, 	%tick_cmpr
	wr	%g2,	%i3,	%y
	wr	%g7,	%o6,	%pic
	rdhpr	%hpstate,	%l5
	rdhpr	%htba,	%g4
	orn	%l3,	0x1BCD,	%o2
	sdivcc	%i0,	0x0E21,	%l4
	rd	%sys_tick_cmpr,	%i1
	wrpr	%o0,	0x1583,	%cwp
	array8	%i2,	%o7,	%i4
	rd	%tick_cmpr,	%l6
	array16	%i7,	%l0,	%l1
	rd	%pc,	%i5
	sdivx	%o1,	0x076E,	%g5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fbg,a	%fcc2,	loop_1270
	wrpr	%o4,	0x013B,	%pil
	mova	%icc,	%l2,	%o3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x27C, 	%hsys_tick_cmpr
loop_1270:
	fnand	%f20,	%f16,	%f0
	rdhpr	%htba,	%i6
	rd	%asi,	%g3
	rdpr	%pil,	%i3
	edge16	%g7,	%g2,	%o6
	bvs	loop_1271
	fmovspos	%icc,	%f23,	%f20
	umulcc	%l5,	0x1D79,	%g4
	rd	%tick_cmpr,	%o2
loop_1271:
	rdpr	%tl,	%l3
	rdpr	%otherwin,	%l4
	set	0x30, %l2
	ldda	[%l7 + %l2] 0x23,	%i0
	wrpr	%o0,	%i2,	%cwp
	fbn	%fcc1,	loop_1272
        wr    %g0,    0xe,    %pcr    ! changed.
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wrpr	%o7,	0x0895,	%tick
loop_1272:
	rdpr	%otherwin,	%i4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x354, 	%hsys_tick_cmpr
	rdpr	%cleanwin,	%l0
	subc	%l1,	%i5,	%o1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%o5,	0x0315,	%cwp
	orncc	%o4,	0x06F6,	%g6
	rdpr	%wstate,	%g3
	rdhpr	%hintp,	%i3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x93A, 	%tick_cmpr
	wrpr	%g2,	%i6,	%pil
	rd	%softint,	%o6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x5BF, 	%hsys_tick_cmpr
	edge8ln	%l3,	%l4,	%i0
	fbo,a	%fcc1,	loop_1273
	rd	%softint,	%o0
	subcc	%i2,	%o2,	%i1
	fabss	%f12,	%f9
loop_1273:
	edge8	%i4,	%i7,	%l6
	wr 	%g0, 	0x7, 	%fprs
	brnz,a	%l0,	loop_1274
	edge8ln	%i5,	%o1,	%g1
	rd	%ccr,	%l2
	rdpr	%gl,	%o3
loop_1274:
	rd	%softint,	%o5
	edge8ln	%o4,	%g5,	%g3
	rdhpr	%hintp,	%i3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x630, 	%hsys_tick_cmpr
	fmul8ulx16	%f0,	%f10,	%f12
	edge8l	%g2,	%i6,	%l5
	movre	%g4,	%l3,	%o6
	movcc	%icc,	%i0,	%l4
	wr	%g0,	0x18,	%asi
	lduba	[%l7 + 0x13] %asi,	%i2
	fmovsn	%icc,	%f20,	%f19
	wr	%o0,	%i1,	%softint
	wrpr	%i4,	%o2,	%tick
	rdhpr	%hintp,	%l6
	prefetch	[%l7 + 0x2C],	 0x0
	wrpr	%o7,	%i7,	%pil
	sethi	0x1B07,	%l1
	wrpr	%l0,	0x16E5,	%cwp
	wr 	%g0, 	0x7, 	%fprs
	fbul,a	%fcc3,	loop_1275
	wrpr	%g1,	%l2,	%cwp
	rd	%pc,	%o5
	rdhpr	%hpstate,	%o3
loop_1275:
	fbue,a	%fcc3,	loop_1276
	srax	%g5,	0x10,	%g3
	rdpr	%cwp,	%o4
	fmul8x16	%f16,	%f16,	%f26
loop_1276:
	rdhpr	%hsys_tick_cmpr,	%g7
	wr	%i3,	0x1213,	%ccr
	wrpr	%g6,	0x0EDC,	%tick
	rdhpr	%hsys_tick_cmpr,	%i6
	rdpr	%canrestore,	%l5
	tge	%icc,	0x2
	set	0x54, %i4
	lduwa	[%l7 + %i4] 0x15,	%g2
	rd	%softint,	%g4
	tg	%icc,	0x5
	rd	%ccr,	%o6
	movrgez	%l3,	0x1CD,	%i0
	rdhpr	%hpstate,	%l4
	wrpr	%o0,	0x0384,	%tick
	wr	%i1,	%i4,	%pic
	rdhpr	%hpstate,	%i2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fbe,a	%fcc2,	loop_1277
	xnor	%o7,	0x17C2,	%l1
	srax	%i7,	0x04,	%i5
	movle	%icc,	%l0,	%g1
loop_1277:
	edge32n	%l2,	%o5,	%o3
	fone	%f20
	rd	%sys_tick_cmpr,	%o1
	rdpr	%gl,	%g5
	wr	%o4,	0x03E1,	%clear_softint
	fmovs	%f15,	%f5
	wr	%g3,	%g7,	%softint
	rdpr	%cleanwin,	%i3
	umulcc	%i6,	%g6,	%g2
	rd	%ccr,	%l5
	stx	%g4,	[%l7 + 0x30]
	rd	%ccr,	%o6
	fcmps	%fcc3,	%f5,	%f23
	rdhpr	%hintp,	%i0
	bgu,a,pn	%icc,	loop_1278
	rdpr	%cwp,	%l4
	movgu	%icc,	%o0,	%i1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_1278:
	fbul	%fcc0,	loop_1279
	fmovsvs	%xcc,	%f26,	%f31
	movleu	%xcc,	%o2,	%l6
	bneg,a	loop_1280
loop_1279:
	movneg	%icc,	%o7,	%l1
	rd	%fprs,	%i7
	rd	%asi,	%i5
loop_1280:
	rdhpr	%htba,	%l0
	fmovrsgez	%l3,	%f17,	%f27
	wrpr	%g1,	0x09AA,	%pil
	mulx	%o5,	0x106F,	%l2
	wr	%o1,	%g5,	%sys_tick
	rdhpr	%hintp,	%o4
	rdpr	%canrestore,	%g3
	brgz	%g7,	loop_1281
	fpack32	%f16,	%f28,	%f18
	fbue	%fcc0,	loop_1282
	faligndata	%f0,	%f4,	%f16
loop_1281:
	movcs	%xcc,	%i3,	%o3
	fpsub32	%f10,	%f20,	%f22
loop_1282:
	tvc	%xcc,	0x4
	rdhpr	%hpstate,	%i6
	fnot2	%f8,	%f26
	wr	%g0,	0x81,	%asi
	stxa	%g2,	[%l7 + 0x50] %asi
	smulcc	%l5,	%g4,	%o6
	rdpr	%pil,	%g6
	rdhpr	%hpstate,	%l4
	rdhpr	%htba,	%i0
	smul	%i1,	%o0,	%i2
	rd	%pc,	%i4
	rd	%pc,	%l6
	rdhpr	%hsys_tick_cmpr,	%o2
	udivcc	%l1,	0x0D72,	%o7
	ta	%xcc,	0x2
	wr	%g0,	0x80,	%asi
	lduwa	[%l7 + 0x08] %asi,	%i5
	movl	%xcc,	%i7,	%l3
	orcc	%l0,	%o5,	%g1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xEF6, 	%tick_cmpr
	rd	%ccr,	%o1
	smul	%g3,	%o4,	%g7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x085, 	%hsys_tick_cmpr
	rd	%tick_cmpr,	%o3
	andcc	%i6,	%g2,	%l5
	fmovsle	%xcc,	%f31,	%f31

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%htba,	%g6
	fmovdgu	%icc,	%f17,	%f24

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	for	%f10,	%f2,	%f28
	wr	%i0,	%i1,	%set_softint
	rd	%softint,	%o0
	rdpr	%cwp,	%o6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x230, 	%hsys_tick_cmpr
	rdhpr	%hintp,	%i4
	rd	%tick_cmpr,	%l1
	edge16ln	%o2,	%o7,	%i7
	wr	%i5,	%l3,	%ccr
	rdpr	%cwp,	%l0
	rd	%ccr,	%g1
	fmovrsgz	%o5,	%f22,	%f11

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xADB, 	%hsys_tick_cmpr
	set	0x28, %o2
	stda	%o0,	[%l7 + %o2] 0x2a
	membar	#Sync
	rdpr	%otherwin,	%l2
	rdpr	%pil,	%o4
	rdpr	%gl,	%g7
	sdiv	%g3,	0x0C3A,	%o3
	tcs	%icc,	0x5
	rd	%y,	%i3
	movl	%xcc,	%g2,	%l5
	add	%l7,	0x78,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] %asi,	%g4,	%g6
	taddcc	%i6,	%i0,	%i1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x388, 	%tick_cmpr
	fmovdn	%xcc,	%f10,	%f4
	array16	%l4,	%i2,	%l6
	bne,pt	%icc,	loop_1283
	membar	0x6B
	rdpr	%cleanwin,	%o6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_1283:
	orncc	%o2,	0x061B,	%i4
	wrpr	%o7,	0x098A,	%cwp
	fmovdle	%icc,	%f7,	%f8
	xnorcc	%i5,	%i7,	%l0
	rd	%pc,	%l3
	wrpr	%g1,	0x075B,	%pil
	rd	%fprs,	%g5
	fandnot2s	%f7,	%f12,	%f19

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fmovspos	%icc,	%f18,	%f4
	rd	%sys_tick_cmpr,	%o1
	set	0x68, %l1
	prefetcha	[%l7 + %l1] 0x89,	 0x0
	movleu	%xcc,	%l2,	%g7
	rdpr	%cwp,	%g3
	rdhpr	%hpstate,	%o3
	wrpr	%g2,	0x12A2,	%tick
	rd	%tick_cmpr,	%i3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xC20, 	%hsys_tick_cmpr
	edge32ln	%l5,	%i6,	%i0
	edge16l	%i1,	%g6,	%l4
	wr 	%g0, 	0x6, 	%fprs
	wrpr	%l6,	0x07FD,	%tick
	fnands	%f5,	%f26,	%f9
	fmovdcc	%icc,	%f29,	%f0
	rdpr	%canrestore,	%i2
	wr 	%g0, 	0x4, 	%fprs
	rdpr	%gl,	%l1
	ldx	[%l7 + 0x38],	%i4
	rdhpr	%hpstate,	%o7
	rd	%sys_tick_cmpr,	%o2
	rdpr	%gl,	%i7
	rdpr	%cansave,	%i5
	movvc	%xcc,	%l3,	%l0
	ldd	[%l7 + 0x48],	%g4
        wr    %g0,    0xe,    %pcr    ! changed.
	wr	%o5,	0x0FBF,	%softint
	or	%o4,	%l2,	%g3
	wr	%o3,	%g2,	%clear_softint
	rd	%pc,	%i3
	fmovsgu	%icc,	%f23,	%f7
	rd	%sys_tick_cmpr,	%g4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fbg	%fcc3,	loop_1284
	subcc	%g7,	0x1685,	%i0
	array8	%g6,	%i1,	%l4
	fmul8x16al	%f21,	%f8,	%f26
loop_1284:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	xor	%i2,	0x1931,	%l1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%pc,	%i5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x47C, 	%sys_tick_cmpr
	set	0x7C, %o1
	swapa	[%l7 + %o1] 0x89,	%l0
	rdpr	%gl,	%g5
	bge	loop_1285
	rd	%asi,	%o1
	srax	%o5,	%o4,	%l2
	wrpr	%g1,	%o3,	%pil
loop_1285:
	movge	%icc,	%g2,	%i3
	tvs	%xcc,	0x7
	udivcc	%g4,	0x03A8,	%l5
	fmovdg	%icc,	%f15,	%f2
	rd	%fprs,	%g3
	edge8l	%i6,	%g7,	%g6
	mova	%icc,	%i0,	%l4
	edge16l	%i1,	%l6,	%o0
	edge8l	%i2,	%l1,	%o6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x2DB, 	%hsys_tick_cmpr
	rdpr	%otherwin,	%i4
	rdpr	%canrestore,	%i5
	wr	%l3,	%l0,	%softint
	xor	%i7,	%o1,	%o5
	bg,a	%xcc,	loop_1286
	wrpr	%g5,	%o4,	%pil
	wrpr	%g1,	%l2,	%cwp
	movcs	%icc,	%g2,	%i3
loop_1286:
	rdpr	%tl,	%o3
	set	0x3B, %g5
	stba	%g4,	[%l7 + %g5] 0x2a
	membar	#Sync
	movleu	%xcc,	%l5,	%i6
	edge16n	%g3,	%g6,	%i0
	alignaddrl	%g7,	%l4,	%i1
	udiv	%o0,	0x05E5,	%l6
	rdhpr	%hsys_tick_cmpr,	%l1
	wr	%i2,	0x1208,	%y
	fabsd	%f30,	%f30
	addcc	%o6,	%o2,	%o7
	wrpr	%i5,	%i4,	%cwp
	rdpr	%canrestore,	%l0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%asi,	%o5
	rdpr	%wstate,	%g5
	rd	%softint,	%o4
	movneg	%xcc,	%g1,	%i7
	rdpr	%cleanwin,	%g2
	rd	%softint,	%i3
	tvs	%icc,	0x7
	rdhpr	%hsys_tick_cmpr,	%l2
	set	0x20, %i1
	swapa	[%l7 + %i1] 0x80,	%o3
	rd	%pc,	%g4
	wr	%l5,	%g3,	%y
	tg	%xcc,	0x5
	wr	%i6,	%g6,	%sys_tick
	movgu	%xcc,	%i0,	%l4
	movrgez	%g7,	%o0,	%i1
	srax	%l6,	0x05,	%i2
	movge	%icc,	%o6,	%l1
	wrpr	%o7,	0x1105,	%tick
	tvs	%icc,	0x1
	rdhpr	%hintp,	%i5
	stx	%o2,	[%l7 + 0x28]
	rd	%pc,	%i4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x924, 	%hsys_tick_cmpr
	tn	%icc,	0x3
	rd	%asi,	%l0
	movl	%icc,	%o5,	%g5
	edge32n	%o4,	%g1,	%o1
	rdhpr	%htba,	%i7
	rd	%y,	%g2
	rd	%y,	%i3
	rd	%tick_cmpr,	%l2
	rd	%tick_cmpr,	%o3
	rdhpr	%hintp,	%g4
	rd	%ccr,	%g3
	rd	%y,	%i6
	rd	%asi,	%g6
	fnot1	%f10,	%f18
	rd	%asi,	%l5
	subc	%i0,	0x1B14,	%l4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x474, 	%hsys_tick_cmpr
	and	%l6,	0x0FCB,	%g7
	wrpr	%i2,	%o6,	%cwp
	rdhpr	%hsys_tick_cmpr,	%o7
	rd	%y,	%l1
	rdpr	%cansave,	%i5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%l3,	%l0,	%ccr
	nop
	setx loop_1287, %l0, %l1
	jmpl %l1, %o5
	wrpr	%o2,	0x1C4E,	%cwp
	edge8n	%g5,	%g1,	%o1
	wr	%g0,	0x89,	%asi
	prefetcha	[%l7 + 0x78] %asi,	 0x0
loop_1287:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x71D, 	%tick_cmpr
	wrpr	%l2,	0x03EA,	%cwp
	wrpr	%i3,	%g4,	%cwp
	wr	%g3,	%i6,	%ccr
	wrpr	%g6,	0x0F4E,	%cwp
	wrpr	%o3,	%i0,	%cwp
	rdhpr	%hintp,	%l5
	movcc	%xcc,	%l4,	%o0
	wrpr	%i1,	0x14FC,	%cwp
	movrgz	%g7,	%i2,	%o6
	ta	%xcc,	0x3
	movneg	%xcc,	%o7,	%l6
        wr    %g0,    0xe,    %pcr    ! changed.

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xAC3, 	%hsys_tick_cmpr
	wrpr	%l0,	%o5,	%cwp
	wr	%o2,	0x1C9B,	%pic
	alignaddr	%g5,	%l3,	%o1
	rdhpr	%hintp,	%g1
	movge	%icc,	%i7,	%o4
	rd	%ccr,	%l2
	wrpr	%i3,	%g4,	%tick
	wr	%g3,	%i6,	%softint
	rdhpr	%hpstate,	%g2
	add	%l7,	0x40,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%g6
	casxa	[%l6] 0x89,	%g6,	%o3
	rd	%softint,	%l5
	wrpr	%l4,	0x0611,	%tick
	stbar
	fxnor	%f12,	%f10,	%f0
	addcc	%i0,	0x1F23,	%i1
	rd	%ccr,	%g7
	rdhpr	%htba,	%o0
	wr	%o6,	%i2,	%sys_tick
	fnot2s	%f6,	%f19
	fmovdl	%icc,	%f30,	%f4
	fcmple16	%f10,	%f28,	%l6
	rd	%softint,	%o7
	tge	%xcc,	0x1
	wr	%l1,	%i5,	%sys_tick
	rdhpr	%htba,	%i4
	bl,pt	%icc,	loop_1288
	fpack32	%f14,	%f14,	%f18
	stb	%o5,	[%l7 + 0x58]

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x98F, 	%hsys_tick_cmpr
loop_1288:
	fmovrdne	%g5,	%f8,	%f6
	orncc	%l3,	%o1,	%o2
	orncc	%i7,	%g1,	%l2
	rd	%fprs,	%o4
	rdpr	%wstate,	%i3
	wrpr	%g3,	%i6,	%pil
	andcc	%g4,	0x1B5D,	%g2
	rd	%asi,	%o3
	stb	%l5,	[%l7 + 0x78]
	rd	%asi,	%l4
	addccc	%i0,	%g6,	%g7
	rdhpr	%hpstate,	%o0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%cleanwin,	%o7
	wr 	%g0, 	0x7, 	%fprs
	wr	%l6,	0x18DF,	%clear_softint
	rdpr	%tl,	%i5
	wr	%i4,	0x1A8D,	%sys_tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xE64, 	%hsys_tick_cmpr
	rdpr	%cwp,	%l3
	smulcc	%o1,	0x07B3,	%g5
	ldsh	[%l7 + 0x46],	%i7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%g1,	0x0EFD,	%pil
	edge8ln	%l2,	%o4,	%g3
	ldsh	[%l7 + 0x1E],	%i3
	addc	%i6,	%g2,	%o3
	wrpr	%l5,	%g4,	%tick
	tcc	%xcc,	0x1
	ldstub	[%l7 + 0x1D],	%l4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x81D, 	%hsys_tick_cmpr
	ble,a,pt	%icc,	loop_1289
	rd	%y,	%g7
	rdhpr	%hsys_tick_cmpr,	%o0
	fnor	%f14,	%f12,	%f18
loop_1289:
	rd	%y,	%o6
	wrpr	%i1,	0x0C41,	%pil
	rdpr	%cleanwin,	%i2
	set	0x4C, %o3
	lda	[%l7 + %o3] 0x80,	%f12
	wr	%g6,	%l1,	%sys_tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xE86, 	%hsys_tick_cmpr
	wr	%g0,	0x0c,	%asi
	ldsha	[%l7 + 0x60] %asi,	%l6
	wr	%i4,	%i5,	%softint
	rdhpr	%hintp,	%o5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%canrestore,	%l3
	rd	%tick_cmpr,	%i7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%htba,	%g5
	rdpr	%canrestore,	%l2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xFE5, 	%hsys_tick_cmpr
	fmovrsgez	%i6,	%f14,	%f3
	rdhpr	%htba,	%i3
	tg	%xcc,	0x6
	rdhpr	%hintp,	%g2
	fmovde	%icc,	%f12,	%f28
	tcc	%xcc,	0x0
	fmul8x16al	%f24,	%f31,	%f12
	fmovdl	%icc,	%f6,	%f14
	tvc	%xcc,	0x4
	rd	%softint,	%l5
	rdpr	%wstate,	%o3
	rdpr	%cansave,	%l4
	rd	%tick_cmpr,	%i0
	rdhpr	%hsys_tick_cmpr,	%g7
	rdpr	%cansave,	%o0
	wr	%o6,	%g4,	%y
	fmovsge	%icc,	%f1,	%f28
	rd	%y,	%i2
	rdpr	%tl,	%g6
	array8	%i1,	%o7,	%l6
	tvc	%icc,	0x3
	rd	%asi,	%i4
	wrpr	%i5,	0x0A74,	%cwp
	orcc	%l1,	%o5,	%o1
	tgu	%xcc,	0x5
	fpsub32s	%f31,	%f0,	%f9
	fcmps	%fcc2,	%f14,	%f19
	wrpr	%l0,	%i7,	%pil
	rdpr	%otherwin,	%o2
	or	%l3,	%g5,	%l2
	rdhpr	%htba,	%g1
	wr	%g3,	%o4,	%pic
	mova	%icc,	%i6,	%g2
	fandnot2s	%f31,	%f27,	%f13
	rdhpr	%hpstate,	%i3
	rdpr	%cwp,	%l5
	set	0x14, %i7
	swapa	[%l7 + %i7] 0x89,	%l4
	bge	loop_1290
	fxnor	%f0,	%f4,	%f24

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	alignaddrl	%o0,	%o6,	%g7
loop_1290:
	rdhpr	%hpstate,	%i2
	tgu	%xcc,	0x0
	ldx	[%l7 + 0x40],	%g6
	sir	0x050C
	rdhpr	%hsys_tick_cmpr,	%g4
	edge16l	%i1,	%o7,	%i4
	rd	%pc,	%l6
	wr	%g0,	0x2b,	%asi
	stha	%i5,	[%l7 + 0x1C] %asi
	membar	#Sync
	tne	%xcc,	0x4
	fcmps	%fcc1,	%f24,	%f14
	edge32	%l1,	%o5,	%l0
	rdpr	%canrestore,	%o1
	addccc	%o2,	0x1BD3,	%i7
	rd	%y,	%g5
	wr	%l3,	0x13CA,	%softint
	sll	%g1,	%g3,	%l2
	movcc	%xcc,	%i6,	%g2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x0FA, 	%hsys_tick_cmpr
	wr 	%g0, 	0x5, 	%fprs
	andncc	%o3,	%o0,	%o6
	andncc	%i0,	%g7,	%i2
	subccc	%g6,	0x02DE,	%g4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	udiv	%o7,	0x1C57,	%i4
	rdhpr	%hpstate,	%l6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	rdpr	%cwp,	%i5
	rdpr	%pil,	%o5
	rd	%softint,	%l1
	rd	%pc,	%o1
	movne	%icc,	%o2,	%i7
	srax	%l0,	0x04,	%g5
	sra	%g1,	%g3,	%l3
	wrpr	%l2,	%g2,	%tick
	rdhpr	%hpstate,	%o4
	rd	%pc,	%l5
	stbar
	tge	%icc,	0x6
	mulx	%i3,	0x1475,	%l4
	andn	%i6,	%o3,	%o6
	movne	%icc,	%o0,	%i0
	rdpr	%cleanwin,	%i2
	fornot2s	%f14,	%f19,	%f0
	rdhpr	%hintp,	%g7
	ldd	[%l7 + 0x18],	%f8

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x670, 	%hsys_tick_cmpr
	fbne	%fcc3,	loop_1291
	move	%xcc,	%g4,	%i1
	movrlz	%o7,	0x3B3,	%l6
	fmovdn	%icc,	%f5,	%f3
loop_1291:
	rdpr	%wstate,	%i4
	rdpr	%cansave,	%i5
	wrpr	%o5,	0x01B6,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fble	%fcc3,	loop_1292
	rdpr	%pil,	%l1
	rdhpr	%hpstate,	%i7
	wrpr	%l0,	0x0E58,	%tick
loop_1292:
	wrpr	%o2,	0x1ADE,	%cwp
	rdhpr	%hsys_tick_cmpr,	%g5
	andcc	%g3,	0x00C7,	%g1
	alignaddrl	%l3,	%g2,	%l2
	taddcc	%l5,	%o4,	%i3
	rdhpr	%hintp,	%i6
	rdhpr	%hsys_tick_cmpr,	%o3
	fbuge	%fcc3,	loop_1293
	movcc	%xcc,	%o6,	%l4
	rdhpr	%hpstate,	%o0
	smul	%i0,	%g7,	%i2
loop_1293:
	rd	%fprs,	%g6
	rdhpr	%hsys_tick_cmpr,	%i1
	edge8	%o7,	%l6,	%g4
	tsubcc	%i4,	%o5,	%i5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xD1E, 	%hsys_tick_cmpr
	wr	%l0,	%l1,	%pic

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%pc,	%g3
	edge8n	%g1,	%g2,	%l2
	wrpr	%l3,	%l5,	%pil
	rdpr	%canrestore,	%i3
	wrpr	%o4,	0x0D0C,	%cwp
	rd	%softint,	%o3
	wrpr	%i6,	%l4,	%cwp
	rd	%pc,	%o0
	wrpr	%i0,	%o6,	%tick
	fmovdl	%icc,	%f27,	%f17
	wr	%i2,	0x037B,	%clear_softint
	edge16l	%g7,	%g6,	%o7
	rdhpr	%hpstate,	%l6
	rdpr	%wstate,	%i1
	wr	%g4,	0x1425,	%ccr
	tl	%icc,	0x2
	fcmpgt32	%f26,	%f4,	%i4
	rdhpr	%htba,	%o5
	fxnors	%f13,	%f30,	%f6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x3F4, 	%tick_cmpr
	rd	%fprs,	%o1
	wrpr	%l0,	%g5,	%tick
	movn	%xcc,	%o2,	%g3
	edge8l	%l1,	%g1,	%l2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xC9E, 	%tick_cmpr
	wr	%l5,	%g2,	%softint
	rdhpr	%hsys_tick_cmpr,	%i3
	wrpr	%o3,	0x1B02,	%tick
	tsubcctv	%i6,	0x0E5C,	%l4
	set	0x7C, %l0
	lduwa	[%l7 + %l0] 0x04,	%o4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%o6,	0x0C65,	%pil
	wrpr	%i2,	0x12FD,	%pil
	rdhpr	%hpstate,	%i0
	fpack32	%f4,	%f20,	%f24
	fnand	%f12,	%f0,	%f26
	wrpr	%g7,	0x0A52,	%pil
	wrpr	%g6,	0x0B20,	%tick
	smulcc	%l6,	0x022A,	%o7
	wr	%i1,	0x1437,	%sys_tick
	wr	%g0,	0x80,	%asi
	stba	%g4,	[%l7 + 0x0F] %asi
	fbue,a	%fcc2,	loop_1294
	rdhpr	%htba,	%i4
	edge8n	%i5,	%o5,	%i7
	ldsh	[%l7 + 0x5C],	%o1
loop_1294:
	rdpr	%pil,	%g5
	wrpr	%o2,	0x1F4C,	%tick
	rdhpr	%htba,	%g3
	movg	%xcc,	%l0,	%l1
	rdhpr	%hsys_tick_cmpr,	%g1
	rd	%fprs,	%l2
	wr	%g0,	0x2a,	%asi
	stba	%l5,	[%l7 + 0x40] %asi
	membar	#Sync
	edge8l	%g2,	%i3,	%l3
	fmovsgu	%icc,	%f2,	%f15
	rd	%tick_cmpr,	%o3
	wr	%l4,	%i6,	%set_softint
	rdhpr	%hintp,	%o4
	wrpr	%o6,	%o0,	%pil
	wrpr	%i0,	0x05A6,	%tick
	rdhpr	%htba,	%i2
	rdhpr	%hsys_tick_cmpr,	%g6
	rdpr	%canrestore,	%l6
	array16	%g7,	%i1,	%g4
	wrpr	%i4,	0x0616,	%cwp
	fmul8ulx16	%f14,	%f26,	%f26
	rd	%ccr,	%i5
	rd	%fprs,	%o5
	wrpr	%o7,	%i7,	%pil
	brnz	%o1,	loop_1295
	mulscc	%g5,	%g3,	%l0
	wrpr	%o2,	0x059F,	%tick
	rdhpr	%htba,	%g1
loop_1295:
	ldd	[%l7 + 0x10],	%f22

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	wrpr	%l1,	0x0288,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fmovdl	%icc,	%f7,	%f9
	rdhpr	%hpstate,	%l3
	rdpr	%gl,	%i3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xE89, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x793, 	%hsys_tick_cmpr
	fmovrdne	%o6,	%f12,	%f20
	wrpr	%o0,	0x1406,	%pil
	fmovdneg	%icc,	%f4,	%f21
	xnor	%i0,	%i2,	%o4
	fornot1s	%f24,	%f2,	%f29
	rdpr	%cansave,	%g6
	wrpr	%g7,	%i1,	%tick
	wrpr	%g4,	0x097F,	%tick
	rdpr	%tl,	%l6
	tpos	%icc,	0x7
	rd	%pc,	%i5
	rdpr	%cwp,	%o5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x093, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x781, 	%hsys_tick_cmpr
	wr	%i7,	0x1A20,	%clear_softint
	rd	%sys_tick_cmpr,	%o1
	membar	0x59
	edge32	%g3,	%l0,	%o2
	subccc	%g5,	%l2,	%g1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	ta	%icc,	0x6
	move	%xcc,	%l5,	%g2
	wrpr	%l3,	0x03DF,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xA33, 	%hsys_tick_cmpr
	ld	[%l7 + 0x50],	%f29

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x580, 	%tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%pc,	%o0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x8EF, 	%hsys_tick_cmpr
	rd	%tick_cmpr,	%g6
	rdhpr	%hintp,	%i1
	rdhpr	%hintp,	%g7
	rdpr	%wstate,	%l6
	rd	%softint,	%g4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x390, 	%hsys_tick_cmpr
	rd	%pc,	%i4
	bshuffle	%f6,	%f30,	%f24
	fmovdvc	%icc,	%f29,	%f5
	movgu	%icc,	%i5,	%o1
	rd	%fprs,	%i7
	srax	%g3,	%o2,	%g5
	move	%xcc,	%l2,	%l0
	sdivx	%l1,	0x11DA,	%l5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x731, 	%hsys_tick_cmpr
	wr	%g1,	%i3,	%y
	wrpr	%l4,	%o3,	%tick
	prefetch	[%l7 + 0x34],	 0x0
	edge32ln	%i6,	%i0,	%o6
	tn	%icc,	0x7
	set	0x74, %g4
	lduwa	[%l7 + %g4] 0x10,	%o0
	wrpr	%o4,	%g6,	%tick
	rdhpr	%hsys_tick_cmpr,	%i2
	fpackfix	%f8,	%f7
	fmovsgu	%xcc,	%f27,	%f15
	wr	%i1,	%l6,	%ccr
	wrpr	%g4,	%g7,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xC97, 	%hsys_tick_cmpr
	fbne,a	%fcc0,	loop_1296
	fcmpd	%fcc1,	%f14,	%f12
	fmovd	%f6,	%f18
	wrpr	%o5,	0x0BCE,	%pil
loop_1296:
	rd	%softint,	%i5
	addc	%i4,	%i7,	%o1
	fabsd	%f24,	%f4
	rdhpr	%htba,	%o2
	rdpr	%tl,	%g3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x788, 	%hsys_tick_cmpr
	edge32	%g5,	%l1,	%l0
	lduh	[%l7 + 0x3E],	%l5
	rd	%pc,	%l3
	wrpr	%g2,	0x16D7,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%l4,	0x1BBC,	%cwp
	edge16n	%o3,	%i6,	%o6
	subcc	%o0,	%o4,	%g6
	rd	%sys_tick_cmpr,	%i0
	subc	%i2,	%l6,	%g4
	rdpr	%cleanwin,	%g7
	rd	%pc,	%i1
	rdpr	%tba,	%o7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x32C, 	%hsys_tick_cmpr
	bl,pt	%icc,	loop_1297
	wrpr	%i7,	%o1,	%pil
	umul	%o2,	0x12C5,	%g3
	rdpr	%cansave,	%l2
loop_1297:
	nop
	wr	%g0,	0x2a,	%asi
	stha	%i4,	[%l7 + 0x40] %asi
	membar	#Sync
	edge32	%l1,	%g5,	%l0
	rdpr	%tl,	%l5
	movneg	%icc,	%g2,	%i3
	fbu,a	%fcc2,	loop_1298
	rd	%fprs,	%g1
	edge16n	%l4,	%o3,	%i6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_1298:
	nop
	wr	%g0,	0x18,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	rd	%softint,	%o4
	orn	%l3,	%g6,	%i0
	wrpr	%i2,	0x1081,	%tick
	smul	%g4,	%l6,	%g7
	fpadd16s	%f15,	%f6,	%f0
	andn	%o7,	%i5,	%i1
	rdhpr	%htba,	%i7
	fandnot2s	%f29,	%f26,	%f11
	rdpr	%tl,	%o5
	rd	%ccr,	%o2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%tba,	%g3
	wr	%l1,	0x1C96,	%clear_softint
	rdhpr	%hsys_tick_cmpr,	%g5
	wrpr	%l0,	%l5,	%pil
	wr	%g0,	0x80,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	wrpr	%i4,	%i3,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xDFA, 	%hsys_tick_cmpr
	rdhpr	%hsys_tick_cmpr,	%g1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xFA5, 	%hsys_tick_cmpr
	wr	%o3,	%i6,	%sys_tick
	fcmps	%fcc2,	%f1,	%f22
	wr	%g0,	0x80,	%asi
	stha	%o0,	[%l7 + 0x16] %asi
	tleu	%xcc,	0x4
	rdhpr	%hsys_tick_cmpr,	%o4
	movrlz	%l3,	%o6,	%i0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	tvc	%xcc,	0x3
	rdpr	%gl,	%g6
	wrpr	%g4,	%l6,	%cwp
	rd	%ccr,	%g7
	rd	%sys_tick_cmpr,	%o7
	wrpr	%i1,	%i7,	%pil
	movrlez	%i5,	%o2,	%o1
	wr	%l2,	%o5,	%softint
	rd	%asi,	%g3
	fmovdgu	%icc,	%f16,	%f5
	smul	%g5,	0x11D7,	%l0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%l1,	0x1324,	%cwp
	rdpr	%gl,	%i3
	rd	%ccr,	%i4
	rd	%y,	%g2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	sll	%o3,	0x04,	%i6
	rd	%pc,	%o0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	edge16	%l4,	%o6,	%i2
	rdhpr	%htba,	%g6
	fmovse	%xcc,	%f26,	%f5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xDFB, 	%hsys_tick_cmpr
	prefetch	[%l7 + 0x48],	 0x2
	array32	%l6,	%g7,	%i0
	wrpr	%o7,	0x13F1,	%tick
	rdhpr	%hpstate,	%i7
	rdpr	%canrestore,	%i5
	wrpr	%o2,	0x118B,	%tick
	wr 	%g0, 	0x5, 	%fprs
	smul	%i1,	0x1B1A,	%o5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%g0,	0x19,	%asi
	ldswa	[%l7 + 0x68] %asi,	%l0
	rdhpr	%hpstate,	%g5
	wrpr	%l1,	%l5,	%pil
	set	0x1C, %o6
	ldswa	[%l7 + %o6] 0x18,	%i4
	rdpr	%otherwin,	%i3
	movleu	%xcc,	%g2,	%o3
	movvs	%icc,	%i6,	%o0
        wr    %g0,    0xe,    %pcr    ! changed.
	wr	%g0,	0x89,	%asi
	stwa	%g1,	[%l7 + 0x28] %asi
	rdpr	%canrestore,	%l4
	movcs	%icc,	%o6,	%g6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x6B4, 	%hsys_tick_cmpr
	wrpr	%i2,	%g7,	%pil
	wr 	%g0, 	0x7, 	%fprs

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	movrne	%o7,	%o2,	%i5
	alignaddrl	%i1,	%o1,	%o5
	fbge	%fcc3,	loop_1299
	ldd	[%l7 + 0x70],	%f16
	ldsw	[%l7 + 0x14],	%g3
	rd	%sys_tick_cmpr,	%l2
loop_1299:
	rdpr	%pil,	%g5
	edge8l	%l0,	%l1,	%l5
	wrpr	%i3,	0x0C2D,	%cwp
        wr    %g0,    0xe,    %pcr    ! changed.
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movvc	%icc,	%o3,	%o0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xCE1, 	%hsys_tick_cmpr
	edge16ln	%i6,	%l3,	%g1
	wrpr	%l4,	%g6,	%cwp
	rdpr	%cwp,	%g4
	wr	%i2,	%g7,	%set_softint
	edge8n	%l6,	%o6,	%i7
	wr	%o7,	%i0,	%ccr
	edge8	%o2,	%i1,	%i5
	tleu	%icc,	0x3
	tvs	%icc,	0x5
	wrpr	%o5,	0x1BFF,	%cwp
	smul	%g3,	0x0FFD,	%l2
	bneg,a	%icc,	loop_1300
	rdhpr	%hsys_tick_cmpr,	%g5
	rd	%pc,	%l0
	udivx	%l1,	0x1B9F,	%o1
loop_1300:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	pdist	%f0,	%f18,	%f16
	fbne	%fcc0,	loop_1301
	wrpr	%i3,	%l5,	%cwp
	movrlz	%i4,	0x2C0,	%g2
	movg	%icc,	%o0,	%o4
loop_1301:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x915, 	%hsys_tick_cmpr
	wr 	%g0, 	0x4, 	%fprs
	rd	%fprs,	%g1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	bg,pn	%xcc,	loop_1302
	sdivx	%o3,	0x0715,	%g4
	membar	#Sync
	wr	%g0,	0xf1,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
loop_1302:
	tle	%icc,	0x7
	rdhpr	%htba,	%i2
	rdhpr	%hpstate,	%l6
	fbe,a	%fcc2,	loop_1303
	wr	%o6,	%g7,	%set_softint
	rdpr	%tba,	%o7
	sllx	%i0,	0x1B,	%o2
loop_1303:
	wrpr	%i1,	0x1534,	%cwp
	rdhpr	%hpstate,	%i7
	wr 	%g0, 	0x7, 	%fprs
	rdhpr	%hsys_tick_cmpr,	%o5
	wrpr	%g3,	0x0FFA,	%cwp
	smulcc	%g5,	0x097B,	%l2
	rdhpr	%hsys_tick_cmpr,	%l0
	xnorcc	%l1,	%i3,	%l5
	wrpr	%i4,	0x1C39,	%tick
	wr	%o1,	%o0,	%softint
	movleu	%icc,	%o4,	%g2
	bshuffle	%f30,	%f22,	%f10
	fand	%f30,	%f24,	%f12
	fmul8sux16	%f22,	%f0,	%f20
	rd	%sys_tick_cmpr,	%l3
	rdhpr	%hintp,	%g1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x662, 	%hsys_tick_cmpr
	wrpr	%o3,	0x02CB,	%tick
	smulcc	%g4,	%g6,	%i2
	ta	%icc,	0x5
	andcc	%o6,	0x1787,	%g7
	rdpr	%pil,	%o7
	brz,a	%i0,	loop_1304
	array16	%o2,	%l6,	%i1
	wr	%g0,	0x0c,	%asi
	ldsha	[%l7 + 0x3E] %asi,	%i7
loop_1304:
	wr	%i5,	%g3,	%set_softint

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x6E3, 	%hsys_tick_cmpr
	rdhpr	%htba,	%l0
	wrpr	%l2,	%l1,	%pil
	sllx	%i3,	%i4,	%o1
	rd	%softint,	%l5
	wrpr	%o4,	0x0FFD,	%cwp
	and	%o0,	0x150F,	%g2
	rdpr	%gl,	%l3
	wr	%l4,	0x1F76,	%softint
	rd	%pc,	%g1
	ta	%xcc,	0x1
	alignaddrl	%o3,	%g4,	%i6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xC0D, 	%hsys_tick_cmpr
	wrpr	%o6,	%o7,	%tick
	wrpr	%i0,	%g7,	%cwp
	wrpr	%o2,	0x158B,	%tick
	set	0x28, %l3
	stwa	%l6,	[%l7 + %l3] 0x2f
	membar	#Sync
	bvs,a,pn	%icc,	loop_1305
	fnot1	%f16,	%f0
	andn	%i1,	0x19DB,	%i7
	bleu,a,pn	%xcc,	loop_1306
loop_1305:
	fmovsle	%icc,	%f1,	%f16
	add	%g3,	%i5,	%o5
	bn,pn	%icc,	loop_1307
loop_1306:
	edge8ln	%l0,	%g5,	%l2
	rdpr	%cwp,	%i3
	rdhpr	%hsys_tick_cmpr,	%l1
loop_1307:
	ld	[%l7 + 0x2C],	%f8
	wrpr	%i4,	0x1F28,	%cwp
	rdpr	%gl,	%o1
	addc	%l5,	0x0661,	%o4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fpmerge	%f21,	%f2,	%f0
	rd	%pc,	%l3
	movrgez	%g1,	0x0D1,	%o3
	rdpr	%tba,	%l4
	rdhpr	%hpstate,	%g4
	rd	%sys_tick_cmpr,	%g6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xD53, 	%hsys_tick_cmpr
	bn,a,pt	%icc,	loop_1308
	xor	%i0,	%g7,	%o2
	rdhpr	%hpstate,	%l6
	fexpand	%f31,	%f0
loop_1308:
	ldsb	[%l7 + 0x1F],	%o7
	wr	%i7,	%i1,	%sys_tick
	wrpr	%g3,	0x05AA,	%pil
	rd	%y,	%o5
	movrne	%l0,	%g5,	%i5
	wrpr	%i3,	%l2,	%pil
	tvs	%xcc,	0x4
	brlz,a	%l1,	loop_1309
	rdhpr	%hintp,	%i4
	edge16	%l5,	%o1,	%g2
	rdpr	%pil,	%o4
loop_1309:
	wr	%o0,	0x1240,	%y
	wr	%l3,	0x15A6,	%set_softint
	wr	%g1,	%l4,	%pic
	rd	%tick_cmpr,	%o3
	rd	%ccr,	%g4
	wrpr	%i6,	0x1B8A,	%tick
	wrpr	%o6,	0x189B,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	call	loop_1310
	rd	%y,	%g7
	wrpr	%o2,	%l6,	%cwp
	popc	0x0D99,	%i2
loop_1310:
	fabsd	%f26,	%f2
	wr	%i7,	%i1,	%y

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	set	0x10, %o5
	ldda	[%l7 + %o5] 0x11,	%g2
	rdpr	%otherwin,	%g5
	wrpr	%l0,	%i5,	%tick
	rdpr	%tba,	%i3
	movle	%xcc,	%l1,	%i4
	rdpr	%tba,	%l2
	rdpr	%canrestore,	%l5
	umul	%g2,	%o4,	%o0
	edge8l	%o1,	%g1,	%l3
	movn	%xcc,	%l4,	%o3
	rdhpr	%hpstate,	%g4
	xnorcc	%o6,	0x0547,	%g6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xB01, 	%hsys_tick_cmpr
	nop
	setx loop_1311, %l0, %l1
	jmpl %l1, %i0
	wrpr	%o2,	0x0B6A,	%tick
	rdpr	%cansave,	%g7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x6CD, 	%hsys_tick_cmpr
loop_1311:
	edge8	%l6,	%i1,	%i7
	edge32l	%o7,	%o5,	%g5
	xnorcc	%g3,	%l0,	%i5
	wrpr	%i3,	0x0624,	%cwp
	wrpr	%l1,	%i4,	%tick
	rdhpr	%hpstate,	%l5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	subcc	%g2,	0x0089,	%o4
	bshuffle	%f2,	%f20,	%f24
        wr    %g0,    0xe,    %pcr    ! changed.
	rdpr	%tba,	%o0
	movg	%xcc,	%g1,	%l3
	tl	%icc,	0x0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x98C, 	%hsys_tick_cmpr
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x70, %i0
	stda	%g4,	[%l7 + %i0] 0x80
	wrpr	%o6,	0x140B,	%pil
	fbn	%fcc0,	loop_1312
	array32	%i6,	%i0,	%g6
	rdhpr	%hintp,	%g7
	wrpr	%o2,	%i2,	%tick
loop_1312:
	rdpr	%cleanwin,	%l6
	rdhpr	%hintp,	%i7
	andn	%o7,	0x07FB,	%o5
	sdivx	%i1,	0x0632,	%g5
	wrpr	%l0,	0x1B71,	%cwp
	flush	%l7 + 0x54
	tcc	%icc,	0x0
	wr	%i5,	%i3,	%sys_tick
	rdpr	%tl,	%l1
	mova	%icc,	%i4,	%g3
	brgz,a	%l5,	loop_1313
	rdhpr	%hintp,	%g2
	movrgz	%o4,	%o1,	%l2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x920, 	%hsys_tick_cmpr
loop_1313:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	nop
	setx	loop_1314,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	wr	%o3,	0x116E,	%set_softint
	rdhpr	%hpstate,	%o6
	movgu	%xcc,	%i6,	%i0
loop_1314:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xE36, 	%hsys_tick_cmpr
	fsrc2	%f20,	%f4
	rd	%tick_cmpr,	%g7
	subc	%i2,	%o2,	%l6
	rdpr	%gl,	%o7
	tcc	%icc,	0x5
	wrpr	%i7,	0x16D2,	%pil
	mulscc	%o5,	%g5,	%l0
	wrpr	%i1,	%i5,	%pil
	tle	%xcc,	0x5
	smul	%l1,	0x0CC0,	%i4
	rdpr	%cleanwin,	%g3
	umulcc	%i3,	%l5,	%g2
	tsubcc	%o1,	%o4,	%l2
	rdhpr	%hintp,	%o0
	bge,a,pn	%icc,	loop_1315
	nop
	set	0x10, %i5
	ldsw	[%l7 + %i5],	%l3
	rd	%pc,	%g1
	rdpr	%tba,	%l4
loop_1315:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%o3,	%i0,	%cwp
	wrpr	%i6,	0x1CDD,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xAB9, 	%hsys_tick_cmpr
	rdpr	%tl,	%g6
	tleu	%xcc,	0x0
	wr	%i2,	%l6,	%ccr
	movcs	%icc,	%o2,	%o7
	nop
	setx	loop_1316,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	rdpr	%tl,	%o5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xDB1, 	%sys_tick_cmpr
	rdpr	%cansave,	%l0
loop_1316:
	rdhpr	%htba,	%i1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	movgu	%xcc,	%l1,	%g5
	rd	%tick_cmpr,	%i4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	set	0x40, %i3
	ldswa	[%l7 + %i3] 0x10,	%i3
	fble,a	%fcc2,	loop_1317
	move	%icc,	%l5,	%g2
	tvs	%xcc,	0x4
	rd	%sys_tick_cmpr,	%o1
loop_1317:
	addcc	%o4,	0x14CE,	%l2
	wrpr	%l3,	0x0C92,	%tick
	wr	%o0,	%g1,	%pic
        wr    %g0,    0xe,    %pcr    ! changed.
	movn	%icc,	%o6,	%i6
	fblg	%fcc0,	loop_1318
	fbg	%fcc0,	loop_1319
	fxnor	%f22,	%f30,	%f16
	set	0x4C, %g2
	stwa	%g4,	[%l7 + %g2] 0x10
loop_1318:
	wrpr	%i0,	%g7,	%tick
loop_1319:
	rd	%fprs,	%g6
	rdhpr	%hsys_tick_cmpr,	%l6
	wrpr	%i2,	0x125C,	%tick
	rd	%sys_tick_cmpr,	%o2
	wrpr	%o5,	0x0928,	%cwp
	add	%l7,	0x38,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%i7,	%l0
	rd	%y,	%i1
	fnot2	%f24,	%f4
	wr 	%g0, 	0x5, 	%fprs
	wr	%l1,	%o7,	%sys_tick
	rdpr	%cleanwin,	%i4
	tl	%xcc,	0x3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%softint,	%g2
	rdpr	%cwp,	%o1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x1E6, 	%hsys_tick_cmpr
	sllx	%l3,	%o0,	%g1
	rdhpr	%hintp,	%l2
	rdpr	%cansave,	%l4
	wr	%o3,	0x1CCA,	%set_softint
	edge8n	%o6,	%g4,	%i6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wrpr	%i0,	0x0CBF,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xE9D, 	%hsys_tick_cmpr
	wr	%g7,	0x0911,	%clear_softint

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x839, 	%hsys_tick_cmpr
	subccc	%o5,	0x1955,	%i7
	and	%l0,	%i1,	%o2
	rdpr	%tba,	%l1
	wrpr	%o7,	%i4,	%cwp
	edge16n	%g5,	%i5,	%l5
	rdpr	%cleanwin,	%g2
	rdpr	%tba,	%o1
	rdhpr	%hsys_tick_cmpr,	%i3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x009, 	%hsys_tick_cmpr
	smul	%l3,	0x0558,	%o0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr 	%g0, 	0x6, 	%fprs
	rd	%softint,	%l4
	or	%o3,	%o6,	%g4
	wr	%i6,	%i0,	%y

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x3A3, 	%hsys_tick_cmpr
	movleu	%xcc,	%g6,	%l6
	rdhpr	%htba,	%o5
	edge32l	%i7,	%l0,	%i1
	rd	%sys_tick_cmpr,	%o2
	sllx	%o7,	%i4,	%l1
	tg	%icc,	0x1
	rdhpr	%htba,	%i5
	xnor	%l5,	%g5,	%g2
	rdhpr	%hintp,	%o1
	nop
	set	0x60, %g6
	ldd	[%l7 + %g6],	%f6
	rdpr	%gl,	%i3
	fmovd	%f30,	%f2
	rdpr	%cansave,	%o4
	rd	%pc,	%l3
	rd	%y,	%g1
	wr 	%g0, 	0x5, 	%fprs
	rdhpr	%hsys_tick_cmpr,	%l2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x45F, 	%hsys_tick_cmpr
	andcc	%o3,	0x008D,	%o6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%cansave,	%i6
	fmovrsne	%i0,	%f16,	%f21
	rdhpr	%hpstate,	%i2
	wrpr	%g7,	%g6,	%pil
	rdpr	%wstate,	%o5
	std	%i6,	[%l7 + 0x70]
	rdhpr	%htba,	%i7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x53D, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x5F3, 	%hsys_tick_cmpr
	rd	%ccr,	%o7
	be,a	%xcc,	loop_1320
	rdpr	%cleanwin,	%i4
	movrlez	%i5,	0x2C0,	%l1
	fbug,a	%fcc3,	loop_1321
loop_1320:
	wrpr	%g5,	0x000C,	%tick
	wrpr	%g2,	0x192D,	%pil
	fpack16	%f24,	%f8
loop_1321:
	sdivcc	%o1,	0x1CA8,	%l5
	rd	%y,	%i3
	rd	%y,	%l3
	rdpr	%cansave,	%g1
	rd	%y,	%o0
	sdivcc	%o4,	0x02C1,	%l2
	movrlez	%o3,	%o6,	%g3
	rdpr	%wstate,	%g4
	fmovdcc	%xcc,	%f5,	%f16

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x044, 	%hsys_tick_cmpr
	wrpr	%i0,	0x0695,	%pil
	rd	%tick_cmpr,	%l4
	wr	%g7,	0x129F,	%ccr
	edge32ln	%g6,	%o5,	%i2
	brlez	%l6,	loop_1322
	tne	%xcc,	0x0
	subc	%i1,	%i7,	%l0
	brgez,a	%o7,	loop_1323
loop_1322:
	rdpr	%tba,	%o2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xDB5, 	%hsys_tick_cmpr
	ldub	[%l7 + 0x4B],	%i4
loop_1323:
	fbl	%fcc2,	loop_1324
	rd	%asi,	%g5
	rdpr	%cwp,	%g2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x1AE, 	%hsys_tick_cmpr
loop_1324:
	rdpr	%otherwin,	%l5
	rd	%ccr,	%i3
	tgu	%icc,	0x5
	rdhpr	%hintp,	%o1
	movrgz	%l3,	0x0E6,	%g1
	fmovsn	%xcc,	%f18,	%f16
	fpsub32	%f0,	%f20,	%f28
	wr	%o4,	%o0,	%clear_softint
	rd	%y,	%o3
	movcs	%icc,	%l2,	%o6
	wr 	%g0, 	0x4, 	%fprs
	rdpr	%canrestore,	%i0
	fbl,a	%fcc2,	loop_1325
	rdhpr	%htba,	%l4
	wrpr	%g7,	%i6,	%pil
	rdhpr	%hpstate,	%o5
loop_1325:
	fornot1	%f30,	%f16,	%f12
	wrpr	%i2,	%l6,	%pil
	rdhpr	%hintp,	%g6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%tba,	%i1
	movn	%xcc,	%o7,	%o2
	rdpr	%cwp,	%l0
	rdhpr	%hpstate,	%i5
	sll	%g5,	%i4,	%l1
	fzero	%f6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xF9C, 	%hsys_tick_cmpr
	sdivx	%i3,	0x088A,	%o1
	sllx	%g2,	%g1,	%l3
	add	%o0,	%o3,	%o4
	fmovrslz	%l2,	%f16,	%f9
	rd	%asi,	%g4
	rd	%y,	%g3
	wr	%g0,	0x0c,	%asi
	lduba	[%l7 + 0x7A] %asi,	%o6
	fnors	%f20,	%f11,	%f21
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	or	%l4,	0x0B65,	%i0
	rd	%y,	%i6
	wrpr	%g7,	%o5,	%cwp
	rdpr	%cleanwin,	%l6
	edge32l	%g6,	%i7,	%i2
	rd	%pc,	%i1
	rdpr	%cansave,	%o7
	fornot2s	%f16,	%f11,	%f23
	wrpr	%o2,	0x1629,	%pil
	tcs	%xcc,	0x4
	rdpr	%gl,	%i5
	mova	%icc,	%l0,	%i4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	move	%icc,	%g5,	%l5
	taddcc	%i3,	%o1,	%g2
	andcc	%g1,	%l3,	%o0
	movneg	%icc,	%o3,	%o4
	srl	%g4,	%l2,	%o6
	edge8n	%g3,	%l4,	%i6
	rdpr	%cansave,	%i0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x01F, 	%hsys_tick_cmpr
	rd	%y,	%g6
	rdhpr	%hpstate,	%i7
	rdhpr	%hintp,	%l6
	rdpr	%gl,	%i1
	fmovrdlez	%i2,	%f6,	%f8
	fmovsg	%xcc,	%f10,	%f30
	rdhpr	%hintp,	%o7
	fsrc2	%f28,	%f20
	wr	%o2,	0x0FF4,	%y

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xD80, 	%hsys_tick_cmpr
	umul	%i4,	0x0A6D,	%g5
	set	0x4C, %l6
	lda	[%l7 + %l6] 0x80,	%f8
	sdiv	%l5,	0x1D8B,	%i3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%g0,	0x88,	%asi
	lda	[%l7 + 0x7C] %asi,	%f11
	rdpr	%otherwin,	%g1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdiv	%o1,	0x0713,	%o0
	andcc	%l3,	0x18A3,	%o4
	movvc	%icc,	%o3,	%g4
	rdpr	%tl,	%o6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	edge16l	%i6,	%i0,	%o5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	set	0x50, %g1
	sta	%f24,	[%l7 + %g1] 0x14
	brnz,a	%g7,	loop_1326
	rdhpr	%hsys_tick_cmpr,	%g6
	fpackfix	%f18,	%f30
	tg	%icc,	0x7
loop_1326:
	movleu	%icc,	%i7,	%i1
	ldub	[%l7 + 0x48],	%l6
	rdhpr	%htba,	%o7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x631, 	%sys_tick_cmpr
	edge32n	%o2,	%l0,	%i5
	set	0x74, %o4
	lda	[%l7 + %o4] 0x14,	%f3
	smul	%g5,	%i4,	%l5
	wr	%i3,	%l1,	%y
	rdhpr	%hintp,	%g2
	rd	%sys_tick_cmpr,	%g1
	rdhpr	%hsys_tick_cmpr,	%o0
	nop
	set	0x78, %l5
	stx	%o1,	[%l7 + %l5]
	rdhpr	%hintp,	%o4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	stbar
	tg	%icc,	0x6
	wrpr	%l3,	0x1C51,	%pil
	rdhpr	%htba,	%g4
	rdpr	%pil,	%g3
	tleu	%xcc,	0x5
	add	%l7,	0x68,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%o6
	casa	[%l6] %asi,	%o6,	%i6
	fabss	%f21,	%f10
	bcs	loop_1327
	fnegd	%f12,	%f14
	rdpr	%tl,	%i0
	rd	%asi,	%o5
loop_1327:
	nop
	set	0x4D, %l4
	ldsba	[%l7 + %l4] 0x0c,	%l2
	set	0x20, %i6
	sta	%f29,	[%l7 + %i6] 0x14
	rdpr	%cwp,	%g7
	wr	%l4,	%i7,	%softint
	sdiv	%i1,	0x1AF9,	%l6
	rdhpr	%hsys_tick_cmpr,	%g6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xA07, 	%hsys_tick_cmpr
	fbug,a	%fcc3,	loop_1328
	umulcc	%l0,	%i5,	%o2
	tpos	%xcc,	0x5
	fmovsl	%xcc,	%f27,	%f25
loop_1328:
	wrpr	%i4,	0x029E,	%pil
	umul	%g5,	%l5,	%l1
	wrpr	%i3,	%g1,	%cwp
	wrpr	%g2,	0x18CF,	%cwp
	orn	%o1,	%o0,	%o3
	tgu	%xcc,	0x7
	rdhpr	%hintp,	%l3
	wr	%g4,	0x188D,	%y
	movl	%xcc,	%o4,	%o6
	movn	%xcc,	%g3,	%i6
	rd	%pc,	%o5
	fbe,a	%fcc3,	loop_1329
	rd	%sys_tick_cmpr,	%i0
	movne	%xcc,	%l2,	%l4
	fmovrdne	%g7,	%f12,	%f26
loop_1329:
	std	%i6,	[%l7 + 0x40]

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xBEB, 	%hsys_tick_cmpr
	wrpr	%o7,	0x1450,	%tick
	fmovrdlz	%l0,	%f18,	%f4
	tgu	%xcc,	0x1
	wrpr	%i5,	%o2,	%cwp
	rd	%y,	%g6
	rd	%softint,	%g5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x4CD, 	%hsys_tick_cmpr
	wrpr	%l5,	0x1E16,	%cwp
	fmovsneg	%icc,	%f13,	%f30
	wr	%i3,	%l1,	%pic
	tgu	%icc,	0x4
	std	%g0,	[%l7 + 0x18]

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	tn	%icc,	0x4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	movvc	%icc,	%o1,	%o3
	rdhpr	%hpstate,	%g4
	sll	%o4,	0x14,	%l3
	tcc	%icc,	0x6
	fmovsne	%xcc,	%f20,	%f2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x824, 	%hsys_tick_cmpr
	orcc	%g3,	0x18C6,	%o5
	wr	%g0,	0x11,	%asi
	ldstuba	[%l7 + 0x17] %asi,	%i6
	subcc	%i0,	0x06B7,	%l2
	wrpr	%l4,	%g7,	%tick
	fones	%f14

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	movrgz	%i7,	%i2,	%i1
	fcmpeq16	%f24,	%f12,	%l0
	fbule,a	%fcc3,	loop_1330
	rd	%pc,	%i5
	wrpr	%o2,	0x0E8C,	%cwp
	wr	%g6,	0x0831,	%softint
loop_1330:
	rdhpr	%htba,	%o7
	rdhpr	%hpstate,	%g5
	tneg	%icc,	0x6
	fbue,a	%fcc0,	loop_1331
	rdpr	%tl,	%i4
	wr	%i3,	%l5,	%set_softint
	orcc	%l1,	0x0537,	%g1
loop_1331:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x8EA, 	%hsys_tick_cmpr
	rd	%pc,	%o1
	rdpr	%tl,	%o3
        wr    %g0,    0xe,    %pcr    ! changed.
	wr	%l3,	0x0D2E,	%softint
	addccc	%o4,	0x0CFB,	%g3
	wr	%o5,	%i6,	%set_softint
	rd	%y,	%o6
	edge8l	%l2,	%l4,	%g7
	rdhpr	%hsys_tick_cmpr,	%i0
	edge32l	%i7,	%l6,	%i2
	rdpr	%cwp,	%i1
	wrpr	%i5,	%l0,	%tick
	wrpr	%o2,	0x0C93,	%pil
	wr	%o7,	%g5,	%sys_tick
	wr	%i4,	%g6,	%clear_softint
	rd	%asi,	%i3
	array8	%l5,	%g1,	%o0
	fbul,a	%fcc1,	loop_1332
	fpadd16	%f16,	%f0,	%f20
	rdpr	%cwp,	%l1
	edge16n	%g2,	%o3,	%g4
loop_1332:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	std	%l2,	[%l7 + 0x08]
	brgz	%g3,	loop_1333
	wr	%o4,	0x1076,	%pic
	rdpr	%cleanwin,	%o5
	tg	%icc,	0x7
loop_1333:
	rdpr	%cwp,	%i6
	rdhpr	%hintp,	%o6
	fbg	%fcc0,	loop_1334
	wrpr	%l2,	%l4,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x5A2, 	%sys_tick_cmpr
	andcc	%l6,	0x0A2B,	%i2
loop_1334:
	array8	%i7,	%i5,	%i1
	tle	%xcc,	0x3
	set	0x11, %i2
	ldsba	[%l7 + %i2] 0x89,	%o2
	rd	%softint,	%o7
	fpadd32	%f0,	%f16,	%f28
	rdhpr	%hsys_tick_cmpr,	%g5
	wrpr	%l0,	%i4,	%cwp
	nop
	set	0x2F, %o7
	ldstub	[%l7 + %o7],	%i3
	rd	%asi,	%g6
	wrpr	%l5,	%o0,	%pil
	sdivx	%l1,	0x00F8,	%g1
	edge16ln	%g2,	%g4,	%o1
	srl	%o3,	0x13,	%g3
	edge32	%l3,	%o5,	%o4
	wrpr	%o6,	%i6,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x730, 	%hsys_tick_cmpr
	rd	%tick_cmpr,	%i0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%hsys_tick_cmpr,	%g7
	smulcc	%i2,	0x093D,	%i7
	rd	%asi,	%l6
	wrpr	%i1,	0x119D,	%pil
	wr	%o2,	%i5,	%ccr
	movleu	%xcc,	%g5,	%l0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	sdiv	%i3,	0x1B10,	%i4
	wrpr	%g6,	0x1115,	%cwp
	wrpr	%o0,	%l5,	%tick
	rd	%fprs,	%l1
	rdhpr	%hsys_tick_cmpr,	%g1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xC8B, 	%hsys_tick_cmpr
	rdpr	%wstate,	%g4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	orcc	%l3,	0x1D6D,	%o3
	fmovsa	%icc,	%f17,	%f8
	fmovdle	%xcc,	%f17,	%f7
	movgu	%xcc,	%o4,	%o6
	tleu	%xcc,	0x5
	membar	0x49
	rd	%sys_tick_cmpr,	%i6
	rdpr	%tl,	%l4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%i0,	%l2,	%pil
	tvc	%icc,	0x1
	movne	%xcc,	%i2,	%i7
	rdpr	%cansave,	%l6
	wrpr	%g7,	%o2,	%tick
	fpsub32s	%f22,	%f3,	%f9

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%asi,	%i1
	movleu	%icc,	%l0,	%o7
	brnz	%g5,	loop_1335
	brz	%i3,	loop_1336
	fmovdvc	%xcc,	%f0,	%f17
	andn	%i4,	0x11C9,	%o0
loop_1335:
	rdhpr	%hpstate,	%l5
loop_1336:
	edge16l	%l1,	%g6,	%g2
	tgu	%icc,	0x6
	fbg,a	%fcc0,	loop_1337
	fornot2	%f6,	%f4,	%f28
	rdpr	%cleanwin,	%g1
	tsubcctv	%g4,	%o1,	%g3
loop_1337:
	wrpr	%o3,	0x0921,	%tick
	wr	%o4,	%o6,	%sys_tick
	wr	%l3,	0x16D2,	%softint
	set	0x40, %o0
	ldda	[%l7 + %o0] 0xe3,	%i6
	rd	%pc,	%l4
	sdivx	%i0,	0x16DC,	%l2
	fbe,a	%fcc2,	loop_1338
	rdhpr	%htba,	%i2
	rdhpr	%hpstate,	%o5
	rd	%tick_cmpr,	%i7
loop_1338:
	brz	%l6,	loop_1339
	membar	0x4D
	or	%o2,	0x02D2,	%g7
	rdhpr	%hintp,	%i5
loop_1339:
	rd	%asi,	%i1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xBE4, 	%tick_cmpr
	wrpr	%g5,	0x0521,	%tick
	sdiv	%i4,	0x1018,	%l5
	rdhpr	%hpstate,	%l1
	wr	%g6,	0x0296,	%pic
	rdhpr	%hintp,	%o0
	array8	%g1,	%g2,	%g4
	xnor	%g3,	0x02C0,	%o1
	bvs	%xcc,	loop_1340
	srax	%o4,	0x0A,	%o6
	edge16n	%l3,	%i6,	%l4
	fabss	%f10,	%f27
loop_1340:
	fmovrsne	%i0,	%f16,	%f11
	udivcc	%l2,	0x1E12,	%o3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x658, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xFF5, 	%tick_cmpr
	nop
	setx loop_1341, %l0, %l1
	jmpl %l1, %o5
	wr	%o2,	0x1CAD,	%clear_softint
	rdpr	%otherwin,	%g7
	set	0x30, %g3
	lda	[%l7 + %g3] 0x14,	%f4
loop_1341:
	rdpr	%tba,	%i1
	wr	%g0,	0xe2,	%asi
	stxa	%o7,	[%l7 + 0x40] %asi
	membar	#Sync

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x815, 	%hsys_tick_cmpr
	wr 	%g0, 	0x7, 	%fprs
	rdpr	%otherwin,	%g5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	mova	%xcc,	%l5,	%g6
	tpos	%icc,	0x1
	wr	%l1,	0x1E94,	%pic

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x617, 	%hsys_tick_cmpr
	fmovdl	%icc,	%f27,	%f20
	edge16n	%g2,	%g1,	%g3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x760, 	%hsys_tick_cmpr
	alignaddrl	%o6,	%o4,	%i6
	tge	%xcc,	0x1
	rdpr	%gl,	%l4
	movcc	%icc,	%i0,	%l3
	array32	%l2,	%i2,	%i7
	rdpr	%cansave,	%o3
	brz	%o5,	loop_1342
	rd	%asi,	%l6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%hintp,	%o7
loop_1342:
	wr	%l0,	%i1,	%clear_softint
	udiv	%i5,	0x0048,	%g5
	bneg,a,pn	%icc,	loop_1343
	wrpr	%i3,	%i4,	%cwp
	rdpr	%gl,	%g6
	wr	%l1,	%o0,	%ccr
loop_1343:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%cansave,	%l5
	rdhpr	%hintp,	%g3
	bcs,pt	%icc,	loop_1344
	fmovrdgez	%g1,	%f4,	%f22
	ta	%xcc,	0x1
	rdhpr	%hintp,	%g4
loop_1344:
	fpack16	%f8,	%f29
	rdhpr	%hsys_tick_cmpr,	%o1
	rdpr	%otherwin,	%o6
	wrpr	%i6,	%l4,	%pil
	rdpr	%cwp,	%i0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	edge32	%i2,	%l2,	%o3
	fmovd	%f18,	%f26
	wr	%o5,	%i7,	%pic
	wrpr	%g7,	0x0B6E,	%pil
	rdhpr	%htba,	%o2
	tne	%icc,	0x0
	or	%l6,	%l0,	%o7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%i5,	0x05AB,	%tick
	wrpr	%g5,	0x12CF,	%pil
	andn	%i4,	%g6,	%i3
	movpos	%xcc,	%l1,	%g2
	ld	[%l7 + 0x6C],	%f19
	rd	%tick_cmpr,	%l5
	rd	%softint,	%o0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%fprs,	%g3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xF59, 	%hsys_tick_cmpr
	sll	%l4,	0x07,	%i6
	rdhpr	%hsys_tick_cmpr,	%i0
	rdhpr	%hintp,	%o4
	fmovsge	%icc,	%f29,	%f1
	fcmple16	%f30,	%f10,	%l3
	rdhpr	%hpstate,	%l2
	ldsb	[%l7 + 0x5D],	%o3
	wr 	%g0, 	0x5, 	%fprs
	fbg,a	%fcc2,	loop_1345
	rd	%sys_tick_cmpr,	%g7
	rdpr	%cansave,	%o2
	rdpr	%gl,	%o5
loop_1345:
	ba	%icc,	loop_1346
	tg	%xcc,	0x7
	rdpr	%otherwin,	%l6
	rdpr	%pil,	%o7
loop_1346:
	udivcc	%i1,	0x154D,	%i5
	rdhpr	%hsys_tick_cmpr,	%l0
	wrpr	%g5,	%g6,	%cwp
	set	0x60, %l2
	ldda	[%l7 + %l2] 0x81,	%i2
	ldsh	[%l7 + 0x76],	%l1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	subccc	%i4,	%g1,	%o0
	orn	%g3,	0x13E9,	%o6
	movrgez	%g4,	0x267,	%l4
	tgu	%xcc,	0x0
	umul	%o1,	%i0,	%i6
	array8	%l3,	%l2,	%o3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xC19, 	%tick_cmpr
	rd	%asi,	%i2
	rdpr	%wstate,	%g7
	rd	%fprs,	%o2
	udiv	%o5,	0x094D,	%l6
	orncc	%o7,	0x16DD,	%i5
	sdiv	%i1,	0x08A8,	%g5
	wr	%l0,	0x11CC,	%pic
	fmovdgu	%icc,	%f4,	%f4
	wrpr	%g6,	0x0D99,	%cwp
	rd	%ccr,	%l1
	rdhpr	%hintp,	%i3
	andcc	%g2,	0x1F55,	%l5
	rdhpr	%hsys_tick_cmpr,	%g1
	flush	%l7 + 0x1C
	rdhpr	%hsys_tick_cmpr,	%i4
	array32	%o0,	%o6,	%g4
	rd	%ccr,	%l4
	fcmple16	%f28,	%f24,	%g3
	tsubcctv	%i0,	%i6,	%o1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	tneg	%xcc,	0x7
	rdpr	%otherwin,	%o3
	tsubcctv	%o4,	%l2,	%i7
	wrpr	%i2,	0x1444,	%cwp
	rd	%fprs,	%o2
	fbl,a	%fcc1,	loop_1347
	rd	%ccr,	%o5
        wr    %g0,    0xe,    %pcr    ! changed.
	wr	%g7,	%i5,	%pic
loop_1347:
	fmovrdgez	%o7,	%f20,	%f26
	fble	%fcc3,	loop_1348
	edge16l	%i1,	%g5,	%g6
	fbule,a	%fcc3,	loop_1349
	nop
	setx loop_1350, %l0, %l1
	jmpl %l1, %l1
loop_1348:
	wrpr	%l0,	%i3,	%pil
	movgu	%icc,	%l5,	%g1
loop_1349:
	wr	%i4,	0x07E2,	%softint
loop_1350:
	umul	%g2,	%o6,	%o0
	rdpr	%otherwin,	%l4
	fxnor	%f4,	%f18,	%f30
	nop
	setx	loop_1351,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	rdpr	%otherwin,	%g3
	fnand	%f28,	%f26,	%f14
	xnorcc	%g4,	0x0A31,	%i0
loop_1351:
	nop
	set	0x20, %g7
	prefetcha	[%l7 + %g7] 0x81,	 0x0
	rdhpr	%htba,	%l3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	movpos	%icc,	%o4,	%l2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x773, 	%sys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	movrgz	%o5,	%l6,	%i6
	andn	%i5,	%g7,	%o7
	wrpr	%g5,	%g6,	%tick
	rd	%tick_cmpr,	%l1
	tvc	%xcc,	0x2
	wrpr	%l0,	0x1D1C,	%pil
	rd	%sys_tick_cmpr,	%i3
	rdhpr	%htba,	%l5
	udivx	%g1,	0x05BE,	%i1
	wrpr	%i4,	%g2,	%pil
	fcmple32	%f4,	%f22,	%o0
	rd	%softint,	%l4
	rdpr	%cwp,	%g3
	rd	%sys_tick_cmpr,	%g4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x252, 	%hsys_tick_cmpr
	orncc	%o1,	0x0760,	%l3
	wr	%o3,	%o4,	%ccr
	movleu	%xcc,	%i0,	%i7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fpack16	%f24,	%f17
	rdhpr	%hsys_tick_cmpr,	%o2
	rd	%softint,	%i2
	wr	%g0,	0x89,	%asi
	stwa	%l6,	[%l7 + 0x60] %asi
	rdpr	%canrestore,	%i6
	rdhpr	%hsys_tick_cmpr,	%i5
	rdhpr	%htba,	%o5
	fandnot2	%f30,	%f20,	%f22
	rd	%pc,	%g7
	wrpr	%o7,	0x17C3,	%pil
	rdpr	%cwp,	%g5
	movg	%xcc,	%g6,	%l0
	rdpr	%otherwin,	%i3
	edge8l	%l5,	%g1,	%i1
	wr	%l1,	%i4,	%pic
	rdpr	%pil,	%o0
	rdpr	%wstate,	%l4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x45D, 	%hsys_tick_cmpr
	rd	%softint,	%g2
	bneg,a,pt	%xcc,	loop_1352
	sir	0x055B

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x7FF, 	%hsys_tick_cmpr
	fbo	%fcc1,	loop_1353
loop_1352:
	rdpr	%gl,	%l3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
        wr    %g0,    0xe,    %pcr    ! changed.
loop_1353:
	rdhpr	%hsys_tick_cmpr,	%i0
	rdhpr	%hsys_tick_cmpr,	%l2
	rdpr	%wstate,	%i7
	tcc	%icc,	0x3
	sdivcc	%i2,	0x00D5,	%l6
	rdhpr	%hsys_tick_cmpr,	%i6
	wrpr	%o2,	0x04A9,	%tick
	wrpr	%i5,	%o5,	%tick
	fba	%fcc3,	loop_1354
	taddcc	%o7,	0x0340,	%g7
	fpsub32	%f20,	%f30,	%f28
	and	%g6,	0x14B7,	%l0
loop_1354:
	fzeros	%f27
	rdhpr	%htba,	%g5
	rdhpr	%hpstate,	%l5
	array8	%g1,	%i3,	%l1
	tl	%xcc,	0x4
	rdhpr	%hintp,	%i4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xF08, 	%hsys_tick_cmpr
	fmovrdne	%i1,	%f2,	%f14
	stw	%g3,	[%l7 + 0x68]
	rdhpr	%hsys_tick_cmpr,	%g2
	rdpr	%canrestore,	%o6
	addc	%o1,	0x1280,	%l3
	umulcc	%g4,	%o4,	%o3
	wrpr	%l4,	0x164A,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%hsys_tick_cmpr,	%i0
	fmovdvs	%xcc,	%f27,	%f20
	fbg,a	%fcc3,	loop_1355
	rdhpr	%hpstate,	%i2
	rdhpr	%hsys_tick_cmpr,	%i7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_1355:
	fbge,a	%fcc1,	loop_1356
	rdpr	%otherwin,	%i5
	rdpr	%cansave,	%o2
	wrpr	%o5,	0x1A1C,	%tick
loop_1356:
	rdhpr	%hpstate,	%o7
	bpos,a	loop_1357
	orncc	%g7,	%l0,	%g6
	addc	%g5,	0x1058,	%l5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_1357:
	rdpr	%canrestore,	%l1
	fbule,a	%fcc1,	loop_1358
	rd	%pc,	%i4
	sdivx	%i3,	0x1914,	%o0
	wrpr	%g3,	%g2,	%pil
loop_1358:
	xor	%o6,	%i1,	%o1
	fpmerge	%f10,	%f20,	%f4
	sll	%g4,	%o4,	%o3
	wr	%l3,	0x10BF,	%ccr
	orn	%l4,	%l2,	%i0
	bpos,a	%xcc,	loop_1359
	wr	%i2,	0x0D0D,	%y
	rdpr	%wstate,	%l6
	rd	%y,	%i7
loop_1359:
	addcc	%i5,	0x0D89,	%i6
	rdpr	%tl,	%o5
	rdpr	%cleanwin,	%o2
	rdhpr	%hpstate,	%g7
	tsubcc	%o7,	%l0,	%g6
	nop
	set	0x4C, %i4
	ldsw	[%l7 + %i4],	%l5
	rd	%pc,	%g1
	fbuge	%fcc1,	loop_1360
	wr	%g5,	0x0B62,	%y
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movgu	%xcc,	%i4,	%i3
loop_1360:
        wr    %g0,    0xe,    %pcr    ! changed.
	rdhpr	%hintp,	%g3
	wrpr	%o0,	%g2,	%tick
	rd	%softint,	%i1
	umul	%o6,	0x11D3,	%o1
	rd	%ccr,	%o4
        wr    %g0,    0xe,    %pcr    ! changed.
	rdhpr	%hsys_tick_cmpr,	%l3
	fsrc1s	%f31,	%f1
	rd	%tick_cmpr,	%l2
	rdpr	%wstate,	%i0
	wrpr	%l4,	0x0FEC,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	movgu	%icc,	%i7,	%i2
	rd	%fprs,	%i6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x24A, 	%hsys_tick_cmpr
	rdpr	%cwp,	%g7
	stbar
	fones	%f27

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%pc,	%i5
	wr	%g6,	%l5,	%pic
	rdhpr	%htba,	%g1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%canrestore,	%g5
	edge32n	%i3,	%g3,	%o0
	rdpr	%cansave,	%g2
	rd	%pc,	%i1
	wrpr	%o6,	0x106D,	%pil
	wrpr	%o1,	0x1DBB,	%cwp
	rd	%ccr,	%l1
	wr	%o4,	0x1578,	%y
	rd	%sys_tick_cmpr,	%o3
	ta	%icc,	0x6
	rdhpr	%htba,	%g4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xE5C, 	%hsys_tick_cmpr
	fmovse	%icc,	%f26,	%f7
	rd	%asi,	%l3
	rdhpr	%hintp,	%l4
	wr	%l6,	0x1963,	%y

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xE1E, 	%sys_tick_cmpr
	fxnors	%f11,	%f10,	%f12
	fxnor	%f20,	%f14,	%f30
	wrpr	%i6,	0x12B5,	%tick
	wr	%o5,	%o2,	%y
	taddcctv	%g7,	%o7,	%l0
	rd	%pc,	%i5
	rdpr	%canrestore,	%i0
	edge32	%l5,	%g6,	%g1
	movl	%icc,	%i4,	%g5
	rdpr	%otherwin,	%g3
	rdhpr	%hintp,	%i3
	tn	%xcc,	0x6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	ta	%xcc,	0x0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	movpos	%xcc,	%o4,	%o3
	rdhpr	%htba,	%g4
	fabsd	%f12,	%f4
	rd	%pc,	%l2
	fba	%fcc0,	loop_1361
	wrpr	%o1,	%l4,	%pil
	addc	%l6,	0x030F,	%i7
	sll	%i2,	0x1E,	%l3
loop_1361:
	and	%i6,	%o5,	%g7
	rd	%fprs,	%o7
	rdhpr	%hpstate,	%l0
	edge16ln	%i5,	%i0,	%o2
	fbo	%fcc3,	loop_1362
	fone	%f0
	fandnot1	%f16,	%f26,	%f0
	xnorcc	%l5,	%g6,	%i4
loop_1362:
	rdpr	%cwp,	%g5
	wrpr	%g3,	%i3,	%pil
	rd	%sys_tick_cmpr,	%g2
	rdpr	%cleanwin,	%g1
	bgu,a	%icc,	loop_1363
	movrlz	%o0,	%i1,	%l1
	rdpr	%gl,	%o4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x6E7, 	%hsys_tick_cmpr
loop_1363:
	brlez,a	%l2,	loop_1364
	alignaddr	%g4,	%o1,	%l4
	rdpr	%canrestore,	%l6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xC08, 	%hsys_tick_cmpr
loop_1364:
	movn	%icc,	%i7,	%i6
	rdhpr	%hsys_tick_cmpr,	%o5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%htba,	%l0
	edge32n	%i5,	%o2,	%i0
	movneg	%xcc,	%g6,	%l5
	wrpr	%i4,	%g3,	%cwp
	rdpr	%pil,	%i3
	fcmple32	%f10,	%f12,	%g2
	wrpr	%g5,	%o0,	%tick
	ldd	[%l7 + 0x58],	%f14
	brz	%g1,	loop_1365
	wr	%l1,	0x0A11,	%set_softint
	wrpr	%o4,	%i1,	%pil
	rdpr	%cleanwin,	%o6
loop_1365:
	fones	%f12
	rd	%sys_tick_cmpr,	%l2
	wrpr	%o3,	0x009A,	%tick
	alignaddrl	%o1,	%g4,	%l4
	tn	%icc,	0x4
	rd	%tick_cmpr,	%l6
	wrpr	%l3,	%i7,	%pil
	rdhpr	%hpstate,	%i2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	xnorcc	%o7,	%g7,	%i6
	wr	%l0,	%o2,	%pic

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x889, 	%hsys_tick_cmpr
	fmovdne	%xcc,	%f25,	%f29
	wrpr	%g6,	%l5,	%pil
	movneg	%icc,	%i5,	%g3
	rdhpr	%hsys_tick_cmpr,	%i4
	wr	%g2,	0x1D79,	%y
	rdpr	%tl,	%i3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	wrpr	%i1,	%o4,	%tick
	wr	%o6,	%o3,	%softint
	rd	%sys_tick_cmpr,	%o1
	add	%l2,	%g4,	%l4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	bneg,a,pt	%icc,	loop_1366
	rdhpr	%htba,	%i7
	wr	%i2,	%o5,	%sys_tick
	wrpr	%o7,	0x1293,	%tick
loop_1366:
	wr	%g7,	%l0,	%clear_softint
	wr	%o2,	0x0D69,	%clear_softint
	wr	%i6,	%i0,	%sys_tick
	andncc	%l5,	%g6,	%g3
	rdhpr	%hpstate,	%i4
	xor	%i5,	0x031E,	%i3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x8A2, 	%hsys_tick_cmpr
	rdhpr	%hintp,	%l1
	rd	%sys_tick_cmpr,	%i1
	addccc	%o6,	%o3,	%o4
	wrpr	%l2,	%o1,	%pil
	rdhpr	%hpstate,	%l4
	alignaddrl	%g4,	%l3,	%i7
	rd	%y,	%l6
	fzeros	%f25
	rd	%ccr,	%i2
	rd	%tick_cmpr,	%o7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xDFE, 	%hsys_tick_cmpr
	rd	%fprs,	%o2
	fzero	%f2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x11A, 	%hsys_tick_cmpr
	wrpr	%i0,	0x141C,	%pil
	wr	%i6,	%g6,	%y
	wr	%l5,	%i4,	%clear_softint
	fpadd32	%f8,	%f10,	%f10
	brgz	%g3,	loop_1367
	fmovsgu	%icc,	%f1,	%f12
	fmovrdgz	%i3,	%f18,	%f8
	edge8	%o0,	%g1,	%g2
loop_1367:
	rdhpr	%hpstate,	%g5
	rd	%pc,	%i5
	rdpr	%cleanwin,	%l1
	udivcc	%i1,	0x001A,	%o6
	rdpr	%canrestore,	%o3
	rd	%fprs,	%o4
	tgu	%xcc,	0x6
	rdpr	%cwp,	%l2
	wrpr	%l4,	0x09C3,	%tick
	brlz,a	%g4,	loop_1368
	wr	%l3,	%o1,	%sys_tick
	set	0x30, %o2
	lduwa	[%l7 + %o2] 0x0c,	%l6
loop_1368:
	rdpr	%pil,	%i7
	fbul	%fcc1,	loop_1369
	edge16n	%i2,	%o7,	%o5
	rdhpr	%hsys_tick_cmpr,	%l0
	rd	%asi,	%o2
loop_1369:
	smulcc	%i0,	0x0C8A,	%i6
	rdhpr	%hpstate,	%g7
	array32	%l5,	%g6,	%g3
	fpack16	%f14,	%f29

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xBB5, 	%hsys_tick_cmpr
	add	%i4,	0x0848,	%o0
	fmovdn	%icc,	%f19,	%f8
	srlx	%g2,	0x00,	%g1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%i5,	0x1D35,	%cwp
	wrpr	%i1,	0x1EA9,	%pil
	sllx	%o3,	0x13,	%o6
	fcmpgt32	%f28,	%f30,	%l2
	edge16l	%l4,	%o4,	%l3
	rdpr	%cwp,	%o1
	wrpr	%g4,	0x1F7D,	%pil
	sdivcc	%i7,	0x056F,	%l6
	stw	%o7,	[%l7 + 0x3C]
	wr	%i2,	0x014C,	%sys_tick
	wrpr	%o5,	%l0,	%cwp
	rd	%y,	%i0
	fbo,a	%fcc2,	loop_1370
	xor	%i6,	%g7,	%o2
	fbne,a	%fcc2,	loop_1371
	rdpr	%wstate,	%g6
loop_1370:
	rd	%y,	%l5
	movleu	%xcc,	%g3,	%i4
loop_1371:
	wrpr	%i3,	0x17A5,	%tick
	rd	%asi,	%g2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	bg,a,pn	%xcc,	loop_1372
	sdiv	%g5,	0x1C51,	%i5
	or	%l1,	0x0BC8,	%o3
	wrpr	%i1,	0x18BE,	%tick
loop_1372:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fbul,a	%fcc1,	loop_1373
	wrpr	%l4,	%o4,	%pil
	rdhpr	%hpstate,	%l3
	fpadd32	%f14,	%f0,	%f0
loop_1373:
	addc	%o1,	%g4,	%l6
	wrpr	%i7,	%i2,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	movrlez	%i0,	%i6,	%o2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	udiv	%g7,	0x02BD,	%g3
	rd	%y,	%i3
	edge32n	%g2,	%o0,	%g1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	movrlz	%i5,	%l1,	%o3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xCA5, 	%hsys_tick_cmpr
	rdhpr	%htba,	%o6
	rdhpr	%htba,	%i1
	wrpr	%l4,	0x063B,	%cwp
	rdhpr	%htba,	%l3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x5C7, 	%sys_tick_cmpr
	set	0x20, %l1
	swapa	[%l7 + %l1] 0x80,	%l6
	fbug	%fcc2,	loop_1374
	rdpr	%cwp,	%g4
	wrpr	%i2,	%o5,	%tick
	wr	%i7,	%o7,	%softint
loop_1374:
	nop
	set	0x5B, %g5
	ldsba	[%l7 + %g5] 0x0c,	%i0
	wr	%l0,	%o2,	%clear_softint

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x16D, 	%tick_cmpr
	rdhpr	%htba,	%l5
	wrpr	%g7,	%i3,	%pil
	bl,a	%xcc,	loop_1375
	rdpr	%pil,	%g2
	andcc	%o0,	0x16EE,	%g3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
loop_1375:
	wr	%g1,	%l1,	%clear_softint
	rd	%y,	%o3
	rdhpr	%hpstate,	%i4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x009, 	%hsys_tick_cmpr
	rdpr	%pil,	%i1
	tcc	%icc,	0x2
	fand	%f10,	%f28,	%f16
	umul	%o6,	0x1D13,	%l4
	wrpr	%o4,	0x0E31,	%cwp
	fmovrse	%o1,	%f11,	%f5
	wr	%l6,	%g4,	%set_softint

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%tl,	%i7
	rdhpr	%htba,	%o7
	movrgez	%i2,	0x346,	%i0
	mova	%xcc,	%l0,	%g6
	subccc	%i6,	%l5,	%g7
	wr	%i3,	%g2,	%set_softint
	rdhpr	%hintp,	%o0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x378, 	%sys_tick_cmpr
	stw	%i5,	[%l7 + 0x6C]
	wr	%g1,	0x12B2,	%clear_softint
	rd	%pc,	%l1
	wrpr	%g3,	0x1412,	%cwp
	fnand	%f2,	%f30,	%f14
	fmovdl	%xcc,	%f17,	%f15
	wr	%g0,	0x1f,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
	wr	%i4,	0x10F8,	%ccr
	stb	%l2,	[%l7 + 0x14]
	fnot1s	%f0,	%f3
	rdpr	%cansave,	%i1
	tgu	%xcc,	0x6
	wrpr	%o6,	%l4,	%cwp
	fmovsne	%icc,	%f20,	%f29
	movvs	%icc,	%o4,	%o1
	fmul8x16	%f28,	%f10,	%f2
	edge16	%o3,	%g4,	%l3
	taddcc	%o5,	0x099B,	%l6
	rd	%softint,	%o7
	rdpr	%wstate,	%i7
	rd	%ccr,	%i2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x17A, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x911, 	%hsys_tick_cmpr
	fbe,a	%fcc1,	loop_1376
	wr	%l5,	%g7,	%pic
	rdpr	%cansave,	%i3
	wrpr	%g2,	%i6,	%cwp
loop_1376:
	alignaddrl	%o0,	%g5,	%o2
	edge8l	%i5,	%g1,	%g3
	fmovsgu	%xcc,	%f24,	%f23
	sub	%l1,	0x18F3,	%l2
	edge16n	%i4,	%o6,	%l4
	rd	%ccr,	%o4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%softint,	%i1
	set	0x30, %i1
	ldda	[%l7 + %i1] 0x81,	%g4
	wr	%l3,	%o5,	%sys_tick
	popc	%l6,	%o7
	rdhpr	%htba,	%i7
	rdhpr	%hintp,	%o3
	srax	%i0,	0x1C,	%g6
	tcc	%icc,	0x3
	srl	%i2,	0x16,	%l0
	rd	%ccr,	%g7
	movcc	%xcc,	%l5,	%g2
	fbue,a	%fcc2,	loop_1377
	rd	%pc,	%i6
	rd	%pc,	%i3
	wrpr	%g5,	%o2,	%pil
loop_1377:
	fabss	%f1,	%f2
	wr	%i5,	0x1CC4,	%set_softint
	wr	%g0,	0x11,	%asi
	stba	%o0,	[%l7 + 0x40] %asi
	wrpr	%g1,	0x1CBB,	%pil
	wr	%g3,	0x056A,	%y
	wrpr	%l2,	%i4,	%pil
	rdpr	%wstate,	%o6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%l4,	%o1,	%tick
	rd	%pc,	%i1
	wrpr	%g4,	%l3,	%cwp
	movne	%xcc,	%o4,	%o5
	rdhpr	%hintp,	%o7
	fpmerge	%f10,	%f1,	%f6
	xor	%l6,	%o3,	%i7
	rdpr	%cleanwin,	%g6
	movrgez	%i0,	0x07C,	%i2
	popc	0x15E1,	%g7
	rdpr	%gl,	%l0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x916, 	%hsys_tick_cmpr
	rdhpr	%hsys_tick_cmpr,	%l5
	fmuld8sux16	%f14,	%f21,	%f6
	alignaddr	%i6,	%g5,	%o2
	tge	%icc,	0x4
	wr	%g0,	0x04,	%asi
	stxa	%i5,	[%l7 + 0x70] %asi
        wr    %g0,    0xe,    %pcr    ! changed.
	rdpr	%cansave,	%g3
	rdhpr	%htba,	%l2
	set	0x40, %o1
	stda	%f0,	[%l7 + %o1] 0x11
	rdhpr	%hintp,	%g1
	wrpr	%i4,	%o6,	%cwp
	movgu	%xcc,	%l4,	%o1
	rdpr	%cwp,	%l1
	rd	%y,	%i1
	add	%l3,	0x04EA,	%o4
	std	%o4,	[%l7 + 0x20]
	wrpr	%o7,	0x1B43,	%cwp
	rd	%tick_cmpr,	%l6
	std	%f16,	[%l7 + 0x18]
	rdpr	%tba,	%g4
	call	loop_1378
	fnor	%f20,	%f14,	%f24
	rdpr	%canrestore,	%i7
	fmovsn	%xcc,	%f28,	%f16
loop_1378:
	udiv	%g6,	0x033F,	%i0
	rd	%fprs,	%o3
	rdhpr	%hpstate,	%g7
	rdhpr	%htba,	%i2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	bcs,a	%xcc,	loop_1379
	fsrc2s	%f17,	%f18

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fnors	%f12,	%f8,	%f11
loop_1379:
	wrpr	%o2,	0x0F58,	%cwp
	fmovdcc	%icc,	%f1,	%f18
	wrpr	%g2,	0x13D5,	%cwp
	rd	%tick_cmpr,	%o0
	rd	%sys_tick_cmpr,	%i3
	wrpr	%i5,	%g3,	%pil
	movn	%xcc,	%g1,	%l2
	orncc	%o6,	0x1C37,	%l4
	fpmerge	%f5,	%f23,	%f6
	rdpr	%otherwin,	%o1
	rd	%sys_tick_cmpr,	%l1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x1C7, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xF7C, 	%hsys_tick_cmpr
	xnor	%o4,	0x0B8F,	%i4
	andncc	%o5,	%o7,	%l6
	wrpr	%i7,	%g6,	%pil
	fbuge,a	%fcc1,	loop_1380
	nop
	set	0x5C, %o3
	stb	%g4,	[%l7 + %o3]
	orncc	%o3,	0x0DEA,	%i0
	edge32n	%i2,	%l0,	%l5
loop_1380:
	bleu,a	loop_1381
	udivx	%g7,	0x1107,	%i6
	movpos	%icc,	%g5,	%o2
	wr	%g0,	0x18,	%asi
	lduwa	[%l7 + 0x34] %asi,	%g2
loop_1381:
	movrgz	%o0,	%i5,	%i3
	rdpr	%tba,	%g1
	wrpr	%l2,	0x1AC5,	%cwp
	rdpr	%wstate,	%g3
	wr	%o6,	0x0BCC,	%ccr
	wrpr	%o1,	0x0DD2,	%pil
	movrgez	%l4,	0x24C,	%i1
	mulscc	%l1,	%o4,	%l3
	edge8l	%i4,	%o5,	%o7
	fone	%f6
	addcc	%l6,	0x0116,	%i7
	movcc	%xcc,	%g6,	%o3
	wrpr	%g4,	0x1328,	%pil
	wrpr	%i0,	0x15A7,	%pil
	subccc	%l0,	%i2,	%l5
	tle	%icc,	0x4
	rdhpr	%hpstate,	%i6
	set	0x28, %i7
	ldswa	[%l7 + %i7] 0x04,	%g5
	movne	%icc,	%o2,	%g2
	wr	%g7,	%i5,	%y
	wr	%i3,	%o0,	%clear_softint
	wrpr	%g1,	0x1638,	%cwp
	wrpr	%g3,	0x1C4E,	%pil
	movgu	%xcc,	%l2,	%o1
	wrpr	%l4,	0x186E,	%pil
	fcmpne32	%f24,	%f10,	%o6
	movne	%xcc,	%i1,	%o4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	movne	%icc,	%i4,	%l3
	wrpr	%o5,	%l6,	%pil
	wrpr	%i7,	0x0E3A,	%tick
	pdist	%f4,	%f6,	%f24
	wr	%g6,	%o7,	%y
	fmovse	%icc,	%f3,	%f5
	ldsb	[%l7 + 0x4A],	%o3
	membar	0x4C
	set	0x34, %g4
	lduha	[%l7 + %g4] 0x10,	%g4
	sir	0x17B5
	alignaddr	%l0,	%i2,	%l5
	rdpr	%cleanwin,	%i6
	rd	%softint,	%g5
	wr	%i0,	%g2,	%sys_tick
	rdhpr	%hsys_tick_cmpr,	%g7
	wr 	%g0, 	0x5, 	%fprs
	xorcc	%i3,	%o0,	%o2
	rd	%ccr,	%g3
	fnor	%f12,	%f4,	%f24
	set	0x24, %o6
	sta	%f12,	[%l7 + %o6] 0x10

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fmovdvs	%icc,	%f27,	%f17

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	wrpr	%g1,	%o6,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x77D, 	%hsys_tick_cmpr
	movleu	%icc,	%o4,	%l1
	wrpr	%i4,	%o5,	%cwp
        wr    %g0,    0xe,    %pcr    ! changed.

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xAA5, 	%hsys_tick_cmpr
	set	0x58, %l3
	lduba	[%l7 + %l3] 0x04,	%l6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xC15, 	%hsys_tick_cmpr
	tvc	%xcc,	0x1
	wrpr	%g6,	%g4,	%pil
	st	%f1,	[%l7 + 0x78]
	rdpr	%wstate,	%l0
	movle	%xcc,	%i2,	%o3
	wr	%l5,	%i6,	%pic
	mulx	%i0,	%g2,	%g5
	sir	0x0C8C
	tn	%xcc,	0x6
	wr	%g7,	0x1FA6,	%pic

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fxnors	%f13,	%f25,	%f8
	sir	0x10D9
	edge8n	%i5,	%o2,	%o0
	wrpr	%l2,	0x0542,	%cwp
	rdhpr	%hpstate,	%g3
	set	0x7C, %o5
	lduha	[%l7 + %o5] 0x80,	%g1
	rdpr	%pil,	%o6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x4F2, 	%hsys_tick_cmpr
	tsubcc	%i1,	0x001C,	%l4
	wrpr	%o4,	0x039B,	%tick
	rdhpr	%hpstate,	%i4
	wr	%o5,	0x1540,	%y
	bg,pn	%xcc,	loop_1382
	rdhpr	%hintp,	%l1
	rdhpr	%hintp,	%l3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_1382:
	rdhpr	%hsys_tick_cmpr,	%i7
	rd	%pc,	%g6
	fmovdle	%xcc,	%f0,	%f31
	wrpr	%g4,	%o7,	%tick
	wrpr	%l0,	0x0E26,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	rdpr	%tba,	%l5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x3B0, 	%tick_cmpr
	rdhpr	%htba,	%i0
	tpos	%icc,	0x2
	sll	%g5,	%i3,	%i5
	rdpr	%otherwin,	%g7
	edge32	%o2,	%o0,	%l2
	swap	[%l7 + 0x14],	%g1
	rdpr	%tba,	%o6
	rdhpr	%hsys_tick_cmpr,	%g3
	wrpr	%o1,	0x1895,	%cwp
	wr	%l4,	0x0F4B,	%softint
	tne	%xcc,	0x6
	tneg	%xcc,	0x3
	add	%l7,	0x20,	%l6
	wr	%g0,	0x19,	%asi
	ldxa	[%l6] %asi,	%o4
	casxa	[%l6] 0x19,	%o4,	%i1
	wrpr	%i4,	0x0CE5,	%pil
	prefetch	[%l7 + 0x20],	 0x3
	fmul8x16al	%f13,	%f20,	%f0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x022, 	%hsys_tick_cmpr
	wrpr	%l6,	%i7,	%pil
	wrpr	%g6,	0x0AA4,	%tick
	rdhpr	%hintp,	%g4
	rdpr	%pil,	%l3
	sdivx	%l0,	0x1B54,	%o3
	nop
	set	0x18, %i0
	ldd	[%l7 + %i0],	%i2
	tl	%xcc,	0x7
	rdhpr	%hintp,	%l5
	wrpr	%o7,	%g2,	%tick
	tpos	%icc,	0x4
	fmovsleu	%icc,	%f20,	%f30

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	ta	%xcc,	0x1
	xorcc	%i0,	%g5,	%i3
	wrpr	%i5,	%o2,	%tick
	xnor	%g7,	%l2,	%o0
	rdhpr	%hpstate,	%g1
	stb	%g3,	[%l7 + 0x38]
	wrpr	%o6,	%l4,	%pil
	prefetch	[%l7 + 0x14],	 0x2
	fmovrse	%o4,	%f6,	%f0
	edge8n	%i1,	%i4,	%o1
	rdhpr	%hsys_tick_cmpr,	%o5
        wr    %g0,    0xe,    %pcr    ! changed.
	rdpr	%otherwin,	%l6
        wr    %g0,    0xe,    %pcr    ! changed.
	rd	%sys_tick_cmpr,	%l3
	tg	%xcc,	0x5
	rdhpr	%hpstate,	%l0
	rdpr	%canrestore,	%o3
	rdpr	%pil,	%i2
	rdhpr	%hsys_tick_cmpr,	%g4
	wr	%l5,	0x0278,	%sys_tick
	wrpr	%o7,	%g2,	%tick
	movneg	%xcc,	%i6,	%g5
	rd	%sys_tick_cmpr,	%i3
	wrpr	%i0,	%o2,	%tick
	rdhpr	%hsys_tick_cmpr,	%g7
	wr 	%g0, 	0x4, 	%fprs
	wrpr	%o0,	0x08FA,	%pil
	fnors	%f26,	%f22,	%f23
	movl	%xcc,	%l2,	%g1
	lduw	[%l7 + 0x50],	%o6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x8D2, 	%hsys_tick_cmpr
	wrpr	%i1,	0x07F9,	%pil
	fmovrslz	%l4,	%f15,	%f3
	rd	%asi,	%o1
	wr	%i4,	%o5,	%ccr
	wrpr	%l6,	%i7,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	rdhpr	%hintp,	%l3
	rd	%fprs,	%l1
	rdhpr	%hsys_tick_cmpr,	%o3
	fbn	%fcc2,	loop_1383
	brlz,a	%l0,	loop_1384
	movvc	%icc,	%i2,	%g4
	movne	%xcc,	%l5,	%o7
loop_1383:
	rdpr	%tba,	%i6
loop_1384:
	wrpr	%g5,	%g2,	%tick
	rdhpr	%hpstate,	%i0
	wr	%o2,	%i3,	%clear_softint
	wrpr	%i5,	%o0,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%ccr,	%g1
	rdhpr	%hintp,	%o6
	rdpr	%tba,	%g3
	bn,a,pt	%xcc,	loop_1385
	movge	%icc,	%g7,	%o4
	smul	%l4,	0x171F,	%i1
	subccc	%o1,	0x0B83,	%i4
loop_1385:
	rdpr	%cleanwin,	%l6
	rdhpr	%htba,	%o5
	fmul8x16au	%f31,	%f0,	%f26
	wr	%g6,	0x0589,	%set_softint
	rdpr	%tba,	%i7
	orcc	%l3,	0x06B7,	%o3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%hintp,	%g4
	wrpr	%l5,	0x1860,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	sdiv	%i6,	0x1E94,	%o7
	wr	%g2,	%i0,	%softint
	tle	%icc,	0x5
	rdhpr	%hsys_tick_cmpr,	%g5
	rd	%asi,	%o2
	rd	%y,	%i5
	movn	%icc,	%i3,	%o0
	rdpr	%tl,	%g1
	wrpr	%l2,	%o6,	%tick
	rdhpr	%hpstate,	%g7
	rdpr	%canrestore,	%g3
	std	%o4,	[%l7 + 0x08]
	rd	%y,	%l4
	rd	%softint,	%o1
	rdhpr	%htba,	%i1
	st	%f25,	[%l7 + 0x0C]
	fmovsa	%icc,	%f8,	%f20
	mova	%icc,	%i4,	%o5
	xor	%g6,	%i7,	%l3
	wrpr	%o3,	%l1,	%pil
	rdpr	%wstate,	%l0
	rdpr	%cansave,	%g4
	smulcc	%l5,	%i2,	%i6
	rdpr	%pil,	%l6
	rdhpr	%hintp,	%g2
	wrpr	%o7,	%g5,	%tick
	edge8ln	%o2,	%i5,	%i3
        wr    %g0,    0xe,    %pcr    ! changed.
	ldx	[%l7 + 0x20],	%g1
	rdpr	%wstate,	%o6
	wrpr	%g7,	0x185F,	%cwp
	sir	0x02B1
	rdhpr	%hpstate,	%g3
	wr	%o4,	%l4,	%pic
	rdpr	%gl,	%l2
	rd	%y,	%i1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	sub	%o5,	0x102F,	%i4
	swap	[%l7 + 0x60],	%i7
	rdpr	%pil,	%l3
	fbl,a	%fcc2,	loop_1386
	wrpr	%g6,	%o3,	%cwp
	rd	%asi,	%l0
	wr 	%g0, 	0x6, 	%fprs
loop_1386:
	fones	%f27
	wr	%g0,	0x11,	%asi
	lduba	[%l7 + 0x32] %asi,	%l5
	rdpr	%cwp,	%g4
	wr	%i2,	0x1136,	%softint
	wrpr	%i6,	0x13C8,	%tick
	rdpr	%cleanwin,	%l6
	set	0x0F, %l0
	ldstuba	[%l7 + %l0] 0x11,	%g2
	movre	%g5,	%o2,	%o7
	fmovsa	%xcc,	%f6,	%f22
	rdhpr	%hsys_tick_cmpr,	%i3
	rdpr	%cansave,	%i5
	rdhpr	%hsys_tick_cmpr,	%o0
	wrpr	%g1,	%o6,	%pil
	add	%i0,	0x04C3,	%g7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x789, 	%tick_cmpr
	set	0x48, %i3
	lduha	[%l7 + %i3] 0x89,	%l2
	std	%f14,	[%l7 + 0x38]
	rdhpr	%htba,	%i1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x1AC, 	%tick_cmpr
	rdpr	%gl,	%o4
	wrpr	%i4,	%i7,	%pil
	wr	%l3,	%g6,	%sys_tick
	rd	%y,	%o5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x342, 	%hsys_tick_cmpr
	rdpr	%otherwin,	%l1
	add	%l7,	0x54,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%g4,	%l5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%cansave,	%l6
	rd	%ccr,	%g2
	fpsub32s	%f21,	%f29,	%f22
	rdpr	%pil,	%i6
	rdpr	%gl,	%g5
	edge16ln	%o7,	%i3,	%o2
	rdpr	%tba,	%i5
	rdpr	%cansave,	%o0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xC54, 	%hsys_tick_cmpr
	fmovdcs	%xcc,	%f2,	%f19
	set	0x14, %i5
	lduwa	[%l7 + %i5] 0x14,	%i0
	movgu	%xcc,	%g7,	%l4
	movrgez	%l2,	%i1,	%o1
	rdhpr	%hsys_tick_cmpr,	%o4
	fmovsn	%icc,	%f28,	%f21
	wr	%i4,	%g3,	%sys_tick
	rdhpr	%hintp,	%l3
	wr	%i7,	%g6,	%ccr
	addc	%o3,	0x01AA,	%l0
	edge16n	%l1,	%o5,	%g4
	wrpr	%i2,	%l6,	%tick
	lduw	[%l7 + 0x48],	%l5
	wr	%i6,	%g5,	%clear_softint
	tg	%icc,	0x7
	xnorcc	%o7,	0x1E6B,	%i3
	fpack32	%f0,	%f28,	%f4
	call	loop_1387
	wr	%g2,	0x1037,	%y
	rdhpr	%hpstate,	%i5
	rdpr	%wstate,	%o2
loop_1387:
	nop
	set	0x27, %g2
	lduba	[%l7 + %g2] 0x18,	%o0
	wr	%o6,	%i0,	%y

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x06C, 	%tick_cmpr
	rdhpr	%hintp,	%l4
	tge	%xcc,	0x0
	mova	%icc,	%l2,	%g1
	orn	%o1,	0x1D9C,	%o4
        wr    %g0,    0xe,    %pcr    ! changed.
	wrpr	%g3,	0x19C5,	%cwp
	move	%xcc,	%l3,	%i7
	tg	%xcc,	0x4
	tcc	%icc,	0x7
	add	%l7,	0x58,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%i1
	casxa	[%l6] %asi,	%i1,	%o3
	tpos	%xcc,	0x5
	wrpr	%g6,	%l0,	%cwp
	wrpr	%l1,	%o5,	%pil
	xorcc	%i2,	%l6,	%g4
	edge32l	%i6,	%l5,	%g5
	subccc	%o7,	0x1BB3,	%g2
	rd	%asi,	%i5
	fba	%fcc0,	loop_1388
	fors	%f30,	%f11,	%f14

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%hpstate,	%o2
loop_1388:
	rdhpr	%hintp,	%o6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xFFA, 	%sys_tick_cmpr
	edge32ln	%l4,	%i0,	%g1
	wr	%l2,	0x07AD,	%y
	taddcc	%o4,	0x0786,	%i4
	taddcc	%o1,	0x12E7,	%g3
	rd	%asi,	%i7
	movrne	%i1,	0x3B4,	%l3
	rdpr	%cleanwin,	%o3
	rdhpr	%hsys_tick_cmpr,	%g6
	xnorcc	%l1,	0x1839,	%o5
	wrpr	%l0,	0x08A9,	%pil
	orn	%i2,	0x0F90,	%l6
	rdpr	%pil,	%g4
	xnorcc	%l5,	%g5,	%o7
	mulx	%g2,	%i5,	%i3
	brnz	%o2,	loop_1389
	rdpr	%tl,	%i6
	fbo,a	%fcc2,	loop_1390
	brgez	%o6,	loop_1391
loop_1389:
	fmovrdgz	%o0,	%f8,	%f2
	rd	%ccr,	%g7
loop_1390:
	rd	%softint,	%l4
loop_1391:
	fmovdpos	%icc,	%f13,	%f12
	movl	%xcc,	%i0,	%l2
	set	0x2C, %l6
	ldswa	[%l7 + %l6] 0x89,	%g1
	rd	%fprs,	%i4
	nop
	setx loop_1392, %l0, %l1
	jmpl %l1, %o4
	rd	%softint,	%o1
	tvc	%icc,	0x4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_1392:
	wrpr	%l3,	%i1,	%cwp
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x76] %asi,	%g6
	movleu	%xcc,	%o3,	%o5
	edge16l	%l0,	%l1,	%i2
	wr	%g0,	0x89,	%asi
	lduwa	[%l7 + 0x60] %asi,	%l6
	fcmps	%fcc1,	%f11,	%f19
	fands	%f26,	%f29,	%f15
	rd	%softint,	%g4
	brgez	%l5,	loop_1393
	rdpr	%cansave,	%o7
	udivx	%g2,	0x1E4B,	%g5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_1393:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	set	0x38, %g1
	stxa	%i5,	[%l7 + %g1] 0x0c
	rdhpr	%hpstate,	%o0
	tle	%icc,	0x3
	rdpr	%wstate,	%o6
	ldsb	[%l7 + 0x40],	%g7
	fmovdl	%xcc,	%f11,	%f13
	wrpr	%i0,	%l2,	%cwp
	fone	%f28

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x867, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	bpos,pt	%icc,	loop_1394
	rd	%tick_cmpr,	%o1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fexpand	%f22,	%f20
loop_1394:
	fmovsne	%xcc,	%f31,	%f7
	edge16	%i1,	%g6,	%o3
	rdpr	%tba,	%o5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xE6C, 	%hsys_tick_cmpr
	subc	%g3,	%l1,	%i2
	nop
	set	0x79, %o4
	ldstub	[%l7 + %o4],	%l6
	popc	%l5,	%o7
	rdpr	%cleanwin,	%g2
	smul	%g5,	0x0B67,	%g4
	set	0x60, %l5
	stwa	%o2,	[%l7 + %l5] 0x0c
	rdhpr	%hpstate,	%i6
	bcc,a	loop_1395
	flush	%l7 + 0x70
	wr	%i3,	0x07D9,	%ccr
	rdhpr	%hpstate,	%o0
loop_1395:
	rdpr	%tba,	%o6
	or	%g7,	%i5,	%i0
	add	%l2,	%g1,	%l4
        wr    %g0,    0xe,    %pcr    ! changed.
	wrpr	%i4,	%i7,	%pil
	udiv	%o1,	0x0933,	%l3
	rd	%y,	%g6
	add	%i1,	0x1F99,	%o3
	nop
	setx	loop_1396,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	rdhpr	%htba,	%l0
	rdpr	%cleanwin,	%o5
	rdpr	%canrestore,	%g3
loop_1396:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fzero	%f20
	rdhpr	%hpstate,	%l5
	edge32l	%o7,	%l6,	%g2
	rd	%ccr,	%g5
	rd	%sys_tick_cmpr,	%g4
	rd	%softint,	%i6
	wr	%o2,	0x02FB,	%softint
	wrpr	%o0,	0x198E,	%tick
	fpack16	%f10,	%f1
	sdivcc	%i3,	0x0102,	%g7
	rdhpr	%hpstate,	%i5
	rd	%tick_cmpr,	%o6
	set	0x18, %l4
	prefetcha	[%l7 + %l4] 0x80,	 0x2
	alignaddrl	%l2,	%g1,	%l4
	rdpr	%cleanwin,	%i4
	sdivcc	%i7,	0x0F4D,	%o4
	wr	%o1,	%l3,	%softint
	for	%f10,	%f12,	%f14
	umulcc	%i1,	%o3,	%g6
	wr	%l0,	0x1CD6,	%pic
	bpos,a	%icc,	loop_1397
	rdpr	%cansave,	%g3
	movneg	%icc,	%o5,	%i2
	wrpr	%l5,	0x08D8,	%cwp
loop_1397:
	nop
	set	0x74, %i6
	lduwa	[%l7 + %i6] 0x19,	%o7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xB6C, 	%hsys_tick_cmpr
	set	0x20, %i2
	stda	%g2,	[%l7 + %i2] 0x80

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%hpstate,	%l1
	rd	%softint,	%i6
	rd	%pc,	%o2
	stbar
	fbul	%fcc1,	loop_1398
	rd	%pc,	%g4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xB61, 	%hsys_tick_cmpr
	wr	%g7,	%i3,	%ccr
loop_1398:
	rd	%asi,	%o6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x366, 	%hsys_tick_cmpr
	tcc	%xcc,	0x2
	rdhpr	%htba,	%i5
	rdhpr	%hpstate,	%g1
	rd	%softint,	%l4
	wrpr	%l2,	%i7,	%pil
	ldsh	[%l7 + 0x46],	%o4
	movle	%xcc,	%i4,	%l3
	fmovsgu	%icc,	%f4,	%f13
	wrpr	%i1,	%o1,	%pil
	smul	%g6,	%o3,	%l0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	tpos	%xcc,	0x7
	rdpr	%pil,	%o7
	rdhpr	%hpstate,	%l5
	fmovdcc	%xcc,	%f11,	%f17
	edge16ln	%g2,	%l6,	%g5
	fxnor	%f20,	%f12,	%f24
	sub	%l1,	%i6,	%o2
	udivx	%g4,	0x0432,	%g7
	wrpr	%i3,	%o0,	%cwp
	wr	%i0,	0x0CAA,	%set_softint
	rdpr	%wstate,	%i5
	rd	%asi,	%g1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movcc	%xcc,	%o6,	%l2
	rdpr	%pil,	%l4
	rdhpr	%hpstate,	%i7
	fbge	%fcc0,	loop_1399
	fmovda	%icc,	%f24,	%f3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	edge16l	%l3,	%i1,	%o1
loop_1399:
	rd	%sys_tick_cmpr,	%g6
	sra	%o4,	0x1C,	%o3
	wrpr	%l0,	0x120C,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%i2,	0x0665,	%pil
	rd	%pc,	%o5
	tn	%icc,	0x0
	fmovsa	%icc,	%f22,	%f24
	rdhpr	%htba,	%l5
	rd	%ccr,	%o7
	swap	[%l7 + 0x5C],	%l6
	addc	%g2,	0x1DCF,	%l1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x413, 	%hsys_tick_cmpr
	rdpr	%wstate,	%g5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x2AD, 	%sys_tick_cmpr
	fbo	%fcc3,	loop_1400
	wrpr	%g4,	0x042B,	%cwp
	rd	%ccr,	%g7
	rdpr	%tba,	%i3
loop_1400:
	nop
	set	0x74, %g6
	ldsha	[%l7 + %g6] 0x80,	%o0
	wrpr	%i0,	0x0399,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fbul	%fcc2,	loop_1401
	rd	%pc,	%l2
	rdpr	%cansave,	%l4
	tpos	%icc,	0x6
loop_1401:
	rd	%tick_cmpr,	%g1
	rd	%sys_tick_cmpr,	%i7
	sdivcc	%l3,	0x17BA,	%i4
	wr	%o1,	%g6,	%ccr
	andcc	%o4,	%i1,	%o3
	sethi	0x09A6,	%g3
	st	%f6,	[%l7 + 0x18]
	edge32	%i2,	%o5,	%l5
	wrpr	%o7,	0x13DE,	%tick
	rdhpr	%hpstate,	%l0
	wrpr	%l6,	0x1267,	%cwp
	fbne,a	%fcc3,	loop_1402
	mulx	%l1,	0x1C2E,	%i6
	tcc	%xcc,	0x6
	movgu	%xcc,	%g5,	%g2
loop_1402:
	nop
	setx	loop_1403,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	rdhpr	%hintp,	%o2
	rdhpr	%hsys_tick_cmpr,	%g4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x6FA, 	%hsys_tick_cmpr
loop_1403:
	tleu	%xcc,	0x2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x53F, 	%hsys_tick_cmpr
	fnot2	%f14,	%f10
	rdhpr	%hpstate,	%l2
	wr	%g1,	0x1670,	%softint
	wrpr	%l4,	0x1F25,	%tick
	rdpr	%cleanwin,	%l3
	movpos	%icc,	%i7,	%o1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x08F, 	%hsys_tick_cmpr
	fcmpd	%fcc1,	%f8,	%f24
	rdhpr	%hpstate,	%i1
	movpos	%xcc,	%i4,	%o3
	rdhpr	%hintp,	%i2
	rdhpr	%htba,	%o5
	edge8n	%g3,	%l5,	%l0
	rdhpr	%hsys_tick_cmpr,	%l6
	rd	%ccr,	%o7
	rdhpr	%hintp,	%i6
	rdpr	%otherwin,	%l1
	rdhpr	%hintp,	%g2
	wr 	%g0, 	0x7, 	%fprs
	tn	%xcc,	0x5
	rd	%asi,	%g5
	rd	%y,	%o0
	rdpr	%cleanwin,	%i0
	orncc	%i3,	0x02E3,	%i5
	bne,pn	%icc,	loop_1404
	wrpr	%o6,	0x068C,	%pil
	edge32l	%g7,	%l2,	%l4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x335, 	%hsys_tick_cmpr
loop_1404:
	rdpr	%canrestore,	%g1
	bleu,pt	%xcc,	loop_1405
	rdpr	%tba,	%o1
	subc	%o4,	%i1,	%g6
	wrpr	%o3,	%i2,	%cwp
loop_1405:
	rd	%softint,	%i4
	movneg	%icc,	%g3,	%o5
	edge8l	%l5,	%l6,	%o7
	rdpr	%tba,	%l0
	wrpr	%i6,	0x06F7,	%tick
	wrpr	%g2,	0x04C3,	%cwp
	edge32l	%l1,	%g4,	%g5
	bpos,a	loop_1406
	rdpr	%otherwin,	%o2
	rdhpr	%hsys_tick_cmpr,	%i0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x6F8, 	%hsys_tick_cmpr
loop_1406:
	rdpr	%cwp,	%i5
	rdpr	%tba,	%g7
	rd	%pc,	%l2
	rdhpr	%htba,	%l4
	bl,pt	%icc,	loop_1407
	brnz	%o6,	loop_1408
	sdiv	%i7,	0x1FF5,	%g1
	fcmple32	%f24,	%f6,	%l3
loop_1407:
        wr    %g0,    0xe,    %pcr    ! changed.
loop_1408:
	rdpr	%cansave,	%g6
	array8	%i1,	%i2,	%i4
	fnors	%f5,	%f26,	%f3
	rdpr	%tba,	%o3
	rdpr	%otherwin,	%o5
	sdiv	%l5,	0x0054,	%g3
	rdhpr	%htba,	%o7
	movne	%icc,	%l6,	%l0
	rd	%sys_tick_cmpr,	%i6
	rdpr	%tba,	%l1
	wr	%g2,	%g4,	%y
	rdpr	%canrestore,	%g5
	rd	%softint,	%o2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x3B0, 	%hsys_tick_cmpr
	rdpr	%otherwin,	%i3
	rdpr	%tba,	%i5
	rdpr	%otherwin,	%g7
	rd	%y,	%i0
	rd	%y,	%l4
	wrpr	%o6,	%i7,	%cwp
	rdhpr	%hsys_tick_cmpr,	%l2
	rdhpr	%hintp,	%l3
	prefetch	[%l7 + 0x78],	 0x1
	rd	%tick_cmpr,	%g1
	movrgz	%o4,	%g6,	%o1
	tgu	%icc,	0x7
	rdhpr	%hintp,	%i2
	xorcc	%i4,	%i1,	%o3
	rdpr	%canrestore,	%o5
	rdpr	%wstate,	%g3
	set	0x30, %o7
	ldxa	[%l7 + %o7] 0x19,	%l5
	rdpr	%pil,	%l6
	rdhpr	%hintp,	%l0
	rdhpr	%hintp,	%i6
	fmovdle	%icc,	%f20,	%f0
	wrpr	%l1,	0x09F5,	%pil
	bcs	loop_1409
	rdhpr	%hintp,	%o7
	rd	%fprs,	%g2
	rdhpr	%hpstate,	%g5
loop_1409:
	bg,a,pt	%xcc,	loop_1410
	rdhpr	%htba,	%g4
	edge16l	%o0,	%o2,	%i3
	set	0x67, %g3
	stba	%g7,	[%l7 + %g3] 0x80
loop_1410:
	subccc	%i0,	%l4,	%i5
	rdhpr	%hintp,	%i7
	edge32n	%o6,	%l3,	%l2
	sir	0x0F3E
	wrpr	%o4,	0x087A,	%tick
	tneg	%xcc,	0x5
	set	0x4A, %o0
	stha	%g1,	[%l7 + %o0] 0x15
	set	0x58, %l2
	stxa	%o1,	[%l7 + %l2] 0x23
	membar	#Sync
	bneg,a,pt	%icc,	loop_1411
	ta	%xcc,	0x1
	rdpr	%otherwin,	%g6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x079, 	%hsys_tick_cmpr
loop_1411:
	membar	0x0C
	taddcc	%i2,	0x0DF4,	%o5
	fpadd32s	%f6,	%f4,	%f8
	fandnot1	%f16,	%f18,	%f16
	sllx	%g3,	%l5,	%o3
	rdhpr	%hintp,	%l0
	sdivcc	%l6,	0x08F2,	%i6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x9FD, 	%sys_tick_cmpr
	wrpr	%l1,	%g5,	%pil
	wr 	%g0, 	0x4, 	%fprs
	fmovdneg	%icc,	%f1,	%f17

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x32E, 	%hsys_tick_cmpr
	fsrc1	%f10,	%f26

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%g0,	0x22,	%asi
	stha	%l4,	[%l7 + 0x26] %asi
	membar	#Sync
	rdhpr	%htba,	%g7
	rdhpr	%hsys_tick_cmpr,	%i7
	edge32ln	%o6,	%i5,	%l3
	fmovrse	%l2,	%f11,	%f3
	fmovdne	%xcc,	%f17,	%f16
	edge8ln	%g1,	%o4,	%o1
	rdhpr	%hsys_tick_cmpr,	%g6
	rdpr	%wstate,	%i4
	rdpr	%cleanwin,	%i1
	popc	%o5,	%i2
	bn,pn	%xcc,	loop_1412
	ble	loop_1413
	rdpr	%tl,	%l5
	rd	%tick_cmpr,	%g3
loop_1412:
	sll	%o3,	%l0,	%l6
loop_1413:
	wrpr	%o7,	0x1D25,	%cwp
	wrpr	%i6,	0x0781,	%cwp
	rdhpr	%htba,	%l1
	rd	%tick_cmpr,	%g2
	wr 	%g0, 	0x4, 	%fprs
	udivcc	%g5,	0x0B42,	%i3
	fnand	%f16,	%f8,	%f28
	rd	%asi,	%o2
	rdhpr	%htba,	%i0
	sdiv	%g7,	0x16A3,	%i7
	smulcc	%l4,	%i5,	%l3
	rdhpr	%hsys_tick_cmpr,	%l2
	tsubcc	%o6,	%o4,	%g1
	edge32	%g6,	%i4,	%o1
	rd	%ccr,	%i1
	movrgz	%o5,	%i2,	%l5
	fmovrsgez	%g3,	%f24,	%f16
	wrpr	%o3,	0x0B3E,	%cwp
	movleu	%icc,	%l0,	%l6
	fpack16	%f18,	%f18
	array32	%i6,	%o7,	%l1
	alignaddr	%g2,	%o0,	%g4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%pil,	%i3
	rd	%tick_cmpr,	%o2
	fcmps	%fcc3,	%f13,	%f1
	rd	%tick_cmpr,	%g7
	rd	%y,	%i0
	tsubcc	%i7,	0x023E,	%l4
	rd	%fprs,	%l3
	fornot2	%f6,	%f20,	%f20

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	tsubcctv	%o6,	0x1966,	%g1
	wrpr	%o4,	0x0439,	%tick
	rdpr	%cansave,	%g6
	rdhpr	%hpstate,	%i4
	rdhpr	%hsys_tick_cmpr,	%o1
	rdpr	%pil,	%i1
	wrpr	%o5,	%i2,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%hpstate,	%l6
	mulx	%l0,	%i6,	%o7
	rdpr	%canrestore,	%l1
	wr	%g2,	%g4,	%sys_tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x959, 	%hsys_tick_cmpr
	popc	%i3,	%o0
	rdhpr	%hpstate,	%g7
	rdpr	%otherwin,	%o2
	wr	%i7,	%i0,	%set_softint
	rd	%tick_cmpr,	%l4
	wr	%i5,	%l2,	%clear_softint
	fcmps	%fcc1,	%f7,	%f0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xF37, 	%hsys_tick_cmpr
	rd	%pc,	%i4
	tleu	%icc,	0x2
	srlx	%o1,	%i1,	%o5
	wr 	%g0, 	0x5, 	%fprs
	wr	%g0,	0x10,	%asi
	ldstuba	[%l7 + 0x43] %asi,	%g6
	fmovscs	%xcc,	%f11,	%f7
	rdhpr	%hsys_tick_cmpr,	%o3
	wr	%l6,	0x1321,	%ccr
	fbug	%fcc1,	loop_1414
	rdpr	%tl,	%l0
	wr	%i6,	%l5,	%sys_tick
	wrpr	%o7,	%g2,	%cwp
loop_1414:
	bpos,a,pt	%xcc,	loop_1415
	wr 	%g0, 	0x5, 	%fprs
	rdhpr	%hsys_tick_cmpr,	%g4
	wrpr	%o0,	%i3,	%cwp
loop_1415:
	wrpr	%g7,	0x0B38,	%pil
	movge	%xcc,	%o2,	%i7
	fmovdl	%xcc,	%f29,	%f28
	rd	%softint,	%i0
        wr    %g0,    0xe,    %pcr    ! changed.
	edge16ln	%l4,	%o6,	%l2
	ldsb	[%l7 + 0x2F],	%l3
	fpsub32s	%f19,	%f31,	%f9
	fmul8ulx16	%f14,	%f18,	%f28
	edge32	%g1,	%o4,	%o1
	fmovdn	%icc,	%f6,	%f1
	fpack16	%f20,	%f21
	mulscc	%i1,	0x0F3A,	%i4
	fmovsa	%xcc,	%f28,	%f3
	rd	%fprs,	%i2
	wr 	%g0, 	0x5, 	%fprs
	fpack32	%f2,	%f14,	%f14

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	set	0x7C, %g7
	lda	[%l7 + %g7] 0x11,	%f16
	rdpr	%gl,	%l6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	wr	%l0,	%l5,	%pic
	movrgez	%g2,	%l1,	%o7
	rd	%pc,	%g5
	edge32ln	%o0,	%g4,	%g7
	array32	%i3,	%o2,	%i0
	movn	%xcc,	%i5,	%i7
	wrpr	%l4,	0x0CE0,	%tick
	andncc	%o6,	%l3,	%g1
	andncc	%l2,	%o4,	%o1
	movcs	%xcc,	%i1,	%i4
	fba	%fcc1,	loop_1416
	rdhpr	%hsys_tick_cmpr,	%o5
	membar	0x44
	rd	%y,	%g3
loop_1416:
	array8	%o3,	%i2,	%g6
	wrpr	%i6,	%l6,	%cwp
	movge	%xcc,	%l0,	%l5
	rdpr	%pil,	%l1
	rdhpr	%hintp,	%g2
	bneg,pt	%xcc,	loop_1417
	fble	%fcc3,	loop_1418
	wrpr	%g5,	%o0,	%pil
	fmovrsgez	%g4,	%f13,	%f9
loop_1417:
	smul	%o7,	0x1DD1,	%g7
loop_1418:
	nop
	wr	%g0,	0x18,	%asi
	ldsba	[%l7 + 0x65] %asi,	%o2
	wrpr	%i3,	0x177B,	%tick
	fands	%f4,	%f3,	%f15
	fbge	%fcc0,	loop_1419
	mulx	%i5,	%i0,	%l4
	wr	%o6,	%i7,	%clear_softint
	sra	%l3,	%l2,	%o4
loop_1419:
	wrpr	%g1,	%o1,	%tick
	rdpr	%gl,	%i1
	fsrc1	%f0,	%f14
	rdhpr	%hsys_tick_cmpr,	%i4
	ta	%icc,	0x1
	fsrc2s	%f28,	%f0
	nop
	setx	loop_1420,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	rd	%fprs,	%o5
	rdpr	%canrestore,	%o3
	wrpr	%i2,	0x0025,	%cwp
loop_1420:
	wrpr	%g3,	%g6,	%pil
	wr	%l6,	0x093C,	%set_softint
	wr	%i6,	%l0,	%sys_tick
	rdpr	%cwp,	%l5
	rdpr	%wstate,	%g2
	rdpr	%cwp,	%g5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x16B, 	%hsys_tick_cmpr
	fexpand	%f9,	%f20
	rdhpr	%htba,	%g4
	movvs	%icc,	%o7,	%g7
	movvc	%icc,	%i3,	%o2
	wrpr	%i5,	0x1DCD,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xA19, 	%hsys_tick_cmpr
	wr	%o6,	%l3,	%softint
	fbu,a	%fcc3,	loop_1421
	rd	%y,	%l2
	rdpr	%pil,	%o4
	rdhpr	%htba,	%i7
loop_1421:
	wr	%g1,	%i1,	%ccr
	fmovsvc	%icc,	%f6,	%f16
	srl	%o1,	0x1C,	%o5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x271, 	%hsys_tick_cmpr
	rdhpr	%hpstate,	%i4
	array8	%g6,	%l6,	%g3
	bleu	loop_1422
	fpmerge	%f31,	%f28,	%f6
	rdhpr	%htba,	%l0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_1422:
	smul	%g5,	%l1,	%o0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xCE3, 	%hsys_tick_cmpr
	wr	%g7,	%i3,	%y
	rd	%tick_cmpr,	%o7
	array8	%o2,	%l4,	%i0
	rdhpr	%hintp,	%o6
	wr	%l3,	%i5,	%softint
	movrne	%o4,	%i7,	%g1
	smul	%l2,	%i1,	%o5
	rd	%y,	%o3
	rdpr	%canrestore,	%i2
	udivx	%i4,	0x1AF5,	%o1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	rd	%softint,	%g3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xBD7, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x3AD, 	%hsys_tick_cmpr
	fcmpeq32	%f30,	%f24,	%g2
	rd	%y,	%o0
	rdpr	%pil,	%g4
	rdhpr	%htba,	%g7
	wrpr	%i3,	0x1656,	%pil
	edge16n	%o7,	%o2,	%i6
	stb	%i0,	[%l7 + 0x17]
	rdpr	%cwp,	%o6
	wrpr	%l4,	%i5,	%tick
	rdpr	%wstate,	%o4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	movrgez	%g1,	%l3,	%l2
	tvs	%icc,	0x1
	wrpr	%i1,	%o3,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xBFF, 	%hsys_tick_cmpr
	wr	%i4,	%o1,	%ccr
	fxor	%f0,	%f26,	%f18
	nop
	setx	loop_1423,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	rd	%fprs,	%l6
	edge8n	%g3,	%i2,	%l0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_1423:
	and	%l5,	%g5,	%g2
	lduw	[%l7 + 0x34],	%l1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xD0D, 	%hsys_tick_cmpr
	orn	%g7,	0x14D3,	%i3
	wr	%o7,	0x116D,	%ccr
	taddcc	%o0,	%i6,	%i0
	fmul8sux16	%f0,	%f14,	%f22
	edge32	%o6,	%l4,	%i5
	rdhpr	%hpstate,	%o2
	smul	%i7,	%o4,	%g1
	rdpr	%cansave,	%l2
	srl	%l3,	%o3,	%o5
	rd	%fprs,	%i4
	wr	%o1,	%l6,	%y
	add	%g3,	0x112A,	%i2
	rdhpr	%hsys_tick_cmpr,	%i1
	wr	%g0,	0x88,	%asi
	stha	%g6,	[%l7 + 0x4C] %asi
	fmovscc	%xcc,	%f4,	%f5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%l0,	%g2,	%set_softint
	edge8l	%g5,	%l1,	%g7
	addc	%g4,	0x18D6,	%o7
	movrne	%i3,	0x161,	%i6
	fbuge	%fcc2,	loop_1424
	wr	%i0,	%o6,	%sys_tick
	wrpr	%o0,	0x04B9,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_1424:
	bleu,a,pn	%xcc,	loop_1425
	fmovspos	%xcc,	%f13,	%f29
	fbl,a	%fcc0,	loop_1426
	alignaddrl	%i7,	%l4,	%g1
loop_1425:
	fnot1	%f20,	%f26
	rd	%fprs,	%l2
loop_1426:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x9B0, 	%hsys_tick_cmpr
	fmovdn	%icc,	%f13,	%f13
	fandnot2	%f0,	%f12,	%f8
	bcc,a	loop_1427
	stw	%o4,	[%l7 + 0x58]
	rdpr	%pil,	%o5
	rdpr	%cansave,	%i4
loop_1427:
	brlz,a	%o1,	loop_1428
	ta	%icc,	0x4
	sllx	%o3,	%g3,	%l6
	wr	%i1,	0x15F8,	%y
loop_1428:
	fmovdpos	%icc,	%f19,	%f22
	wr	%g0,	0xeb,	%asi
	stba	%i2,	[%l7 + 0x64] %asi
	membar	#Sync
	rdpr	%canrestore,	%g6
	rdhpr	%htba,	%l0
	wrpr	%l5,	0x12F8,	%pil
	movpos	%icc,	%g5,	%g2
	rdhpr	%hsys_tick_cmpr,	%l1
	alignaddrl	%g4,	%g7,	%o7
	rd	%pc,	%i6
	fandnot2s	%f12,	%f8,	%f26
	rd	%pc,	%i3
	wrpr	%o6,	%i0,	%tick
	ldd	[%l7 + 0x30],	%f20

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%o2,	%i5,	%tick
	rdpr	%cwp,	%i7
	wrpr	%l4,	%g1,	%tick
	movvc	%icc,	%l3,	%o4
	alignaddrl	%l2,	%o5,	%o1
	array8	%i4,	%o3,	%l6
	sdivcc	%g3,	0x14C9,	%i1
	wrpr	%g6,	%l0,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xC2C, 	%hsys_tick_cmpr
	orn	%g5,	0x1B42,	%l5
	rdhpr	%hsys_tick_cmpr,	%g2
	fornot1	%f18,	%f22,	%f20
	sra	%g4,	%g7,	%o7
	fmovsvs	%icc,	%f30,	%f14
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	rdpr	%tl,	%l1
	rd	%softint,	%i3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	sdiv	%i0,	0x0C0F,	%o0
	rdhpr	%hpstate,	%i5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	bne	loop_1429
	rdpr	%tl,	%l4
	bl	%xcc,	loop_1430
	fmovrsne	%l3,	%f20,	%f20
loop_1429:
	wrpr	%g1,	0x1339,	%cwp
	rdpr	%cansave,	%o4
loop_1430:
	wrpr	%l2,	0x0248,	%cwp
	rdpr	%tl,	%o5
	wrpr	%i4,	0x0129,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%sys_tick_cmpr,	%l6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fbg	%fcc3,	loop_1431
	wr	%g6,	%i2,	%softint
	rdpr	%canrestore,	%g5
	rd	%fprs,	%l5
loop_1431:
	rd	%pc,	%l0
	wrpr	%g4,	%g7,	%pil
	rd	%fprs,	%g2
	fmovsvs	%icc,	%f17,	%f12

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xDCC, 	%hsys_tick_cmpr
	wr	%i6,	0x0FBA,	%y
	wrpr	%o6,	0x07C5,	%pil
	rd	%softint,	%i0
	ld	[%l7 + 0x24],	%f5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%o0,	%i5,	%set_softint
	rdpr	%gl,	%o2
	movpos	%xcc,	%i7,	%l3
	udivx	%l4,	0x117F,	%g1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%o5,	%i4,	%cwp
	wrpr	%o1,	0x151B,	%tick
	wrpr	%l6,	0x1386,	%tick
	wr	%o3,	0x06E8,	%sys_tick
	rdhpr	%hpstate,	%g3
	wrpr	%g6,	0x0077,	%pil
	rdpr	%canrestore,	%i1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xFDD, 	%hsys_tick_cmpr
	rdhpr	%hpstate,	%i2
	wr	%l0,	%l5,	%ccr
	alignaddrl	%g7,	%g2,	%g4
	set	0x58, %o2
	stda	%l0,	[%l7 + %o2] 0x23
	membar	#Sync
	edge32ln	%o7,	%o6,	%i0
	edge32ln	%i3,	%i6,	%o0
	bl,pt	%icc,	loop_1432
	wr	%i5,	%i7,	%pic

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	addcc	%l4,	%o2,	%g1
loop_1432:
	movrgez	%o4,	0x3F7,	%o5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x752, 	%tick_cmpr
	wr	%g0,	0x89,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	fmovse	%icc,	%f2,	%f20
	xnorcc	%o1,	%o3,	%g3
	nop
	set	0x24, %i4
	ldsw	[%l7 + %i4],	%l6
	wrpr	%i1,	%g5,	%pil
	ba	%xcc,	loop_1433
        wr    %g0,    0xe,    %pcr    ! changed.
	bneg,a	loop_1434
	rdpr	%tl,	%g6
loop_1433:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x55C, 	%hsys_tick_cmpr
	wrpr	%g7,	%g2,	%pil
loop_1434:
	edge8l	%l5,	%l1,	%g4
	xorcc	%o7,	0x1A16,	%o6
	wr	%i3,	0x1E85,	%softint
	rdhpr	%hintp,	%i0
!Yo - got one - imm_asi 0x40 
!And yo - immediate is 0x1f8
	nop 	! 	nop 	! 	wr	%g0,	0x40,	%asi ripped by fixASI40.pl ripped by fixASI40.pl
	nop 	! 	nop 	! 	ldxa	[%g0 + 0x1f8] %asi,	%o0 ripped by fixASI40.pl ripped by fixASI40.pl
	addcc	%i6,	0x1DD0,	%i7
	tsubcc	%l3,	0x05CE,	%l4
	rd	%sys_tick_cmpr,	%i5
	bpos,pn	%xcc,	loop_1435
	rdhpr	%hsys_tick_cmpr,	%o2
!Yo - got one - imm_asi 0x50 
!And yo - immediate is 0x30
	set	0x30, %l1
	ldxa	[%g0 + %l1] 0x50,	%g1
loop_1435:
	rdhpr	%hintp,	%o5
	wrpr	%l2,	0x00B1,	%pil
	fbe,a	%fcc3,	loop_1436
	xnorcc	%i4,	0x097D,	%o1
	fcmpeq32	%f28,	%f16,	%o4
	wrpr	%o3,	0x179E,	%pil
loop_1436:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%g5,	%i1,	%pil
	wr	%g6,	%l0,	%softint
	ldd	[%l7 + 0x10],	%f10
	fnor	%f16,	%f20,	%f6
	edge8ln	%i2,	%g2,	%g7
	rdhpr	%htba,	%l5
	rdhpr	%hsys_tick_cmpr,	%g4
	rdhpr	%hsys_tick_cmpr,	%l1
	rdpr	%tba,	%o6
	rd	%tick_cmpr,	%i3
	rdhpr	%hpstate,	%i0
	fcmpne32	%f8,	%f4,	%o0
	smulcc	%i6,	0x1533,	%o7
	udivcc	%l3,	0x184A,	%i7
	rd	%asi,	%l4
	movge	%icc,	%o2,	%g1
	rd	%y,	%o5
	edge8	%i5,	%i4,	%o1
	rdpr	%tl,	%l2
	smul	%o4,	0x1A4E,	%l6
	wrpr	%o3,	%g5,	%cwp
	call	loop_1437
	fbuge	%fcc1,	loop_1438
	rdpr	%cwp,	%i1
	movre	%g6,	0x113,	%g3
loop_1437:
	array32	%l0,	%i2,	%g2
loop_1438:
	xnorcc	%g7,	%g4,	%l5
	andncc	%o6,	%i3,	%l1
	wrpr	%i0,	%o0,	%cwp
	rdhpr	%hsys_tick_cmpr,	%o7
	set	0x14, %g5
	sta	%f19,	[%l7 + %g5] 0x88
	fcmple16	%f14,	%f8,	%i6
	nop
	set	0x1A, %i1
	ldsh	[%l7 + %i1],	%i7
	set	0x5C, %o3
	stwa	%l4,	[%l7 + %o3] 0x23
	membar	#Sync
	wr	%o2,	%g1,	%softint
	movcc	%icc,	%l3,	%o5
	bge,a,pn	%xcc,	loop_1439
	xor	%i5,	%i4,	%l2
	fmovdgu	%xcc,	%f21,	%f24

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_1439:
	movrlez	%l6,	0x260,	%o3
	rdhpr	%hsys_tick_cmpr,	%o1
	rdpr	%cleanwin,	%i1
	rd	%tick_cmpr,	%g6
	rdpr	%canrestore,	%g5
	wrpr	%l0,	%i2,	%pil
	wrpr	%g2,	%g7,	%tick
	rdpr	%tba,	%g3
	rdhpr	%hsys_tick_cmpr,	%g4
	set	0x0E, %o1
	lduha	[%l7 + %o1] 0x04,	%l5
	set	0x40, %i7
	ldda	[%l7 + %i7] 0x18,	%f16
	rdhpr	%hsys_tick_cmpr,	%o6
	fba	%fcc1,	loop_1440
	xor	%i3,	0x12C6,	%l1
	wr	%i0,	0x1CD6,	%softint
	rdpr	%tl,	%o7
loop_1440:
	rd	%pc,	%o0
	set	0x40, %g4
	ldda	[%l7 + %g4] 0x15,	%f0
	umul	%i6,	%l4,	%i7
	fbne	%fcc3,	loop_1441
	wrpr	%o2,	0x16DE,	%cwp
	rdhpr	%hsys_tick_cmpr,	%g1
	tne	%icc,	0x6
loop_1441:
	wrpr	%l3,	%i5,	%pil
	wrpr	%i4,	0x0AAF,	%tick
	rdpr	%otherwin,	%o5
	subc	%o4,	%l2,	%l6
	rdhpr	%htba,	%o3
	or	%i1,	%g6,	%o1
	array8	%g5,	%l0,	%i2
	ldd	[%l7 + 0x28],	%g2
	tsubcc	%g3,	0x0753,	%g4
	rd	%softint,	%g7
	rdpr	%tba,	%o6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%htba,	%i0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xD04, 	%hsys_tick_cmpr
	sir	0x19B9

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x380, 	%hsys_tick_cmpr
	fbul,a	%fcc0,	loop_1442
	wr	%i6,	%l4,	%clear_softint
	rdhpr	%htba,	%o0
	flush	%l7 + 0x3C
loop_1442:
	tsubcctv	%i7,	%o2,	%l3
	fbne,a	%fcc3,	loop_1443
	wrpr	%i5,	0x0500,	%pil
	subcc	%g1,	0x146F,	%o5
	rd	%ccr,	%i4
loop_1443:
	rdpr	%cwp,	%o4
	rd	%sys_tick_cmpr,	%l2
	fmovdne	%icc,	%f0,	%f23
	fmovd	%f26,	%f24
	edge8n	%o3,	%i1,	%g6
	andcc	%l6,	0x114E,	%o1
	wrpr	%g5,	0x05B4,	%cwp
	fmovrdne	%i2,	%f10,	%f14
	wrpr	%g2,	%l0,	%pil
	wrpr	%g3,	0x1C5B,	%pil
	membar	0x14
	wr 	%g0, 	0x4, 	%fprs

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%y,	%i0
	rdpr	%cleanwin,	%o7
	fnors	%f20,	%f10,	%f28
	wrpr	%i6,	0x1C0C,	%pil
	rdhpr	%hsys_tick_cmpr,	%l5
	wrpr	%o0,	0x1EF0,	%tick
	rd	%softint,	%l4
	tleu	%icc,	0x7
	prefetch	[%l7 + 0x08],	 0x1
	wr	%i7,	%o2,	%sys_tick
	wrpr	%i5,	%g1,	%tick
	addccc	%l3,	%i4,	%o5
	edge16ln	%o4,	%o3,	%i1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	rd	%sys_tick_cmpr,	%l2
	rdhpr	%hpstate,	%g5
	rd	%y,	%i2
	subccc	%o1,	0x09BA,	%l0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	andcc	%g2,	%g4,	%i3
	fbne	%fcc2,	loop_1444
	rdhpr	%hintp,	%o6
	rdhpr	%hpstate,	%l1
	rd	%asi,	%i0
loop_1444:
	sethi	0x04C4,	%o7
	fmovrslez	%i6,	%f15,	%f1
	set	0x51, %o6
	stba	%g7,	[%l7 + %o6] 0x0c
	fbule	%fcc1,	loop_1445
	tcs	%icc,	0x6
	brnz	%o0,	loop_1446
	rdpr	%canrestore,	%l5
loop_1445:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xB3C, 	%hsys_tick_cmpr
loop_1446:
	wrpr	%i7,	%i5,	%pil
        wr    %g0,    0xe,    %pcr    ! changed.
	movvs	%icc,	%i4,	%l3
	wr	%o4,	%o3,	%pic
	rdpr	%cansave,	%o5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x15C, 	%hsys_tick_cmpr
	rd	%asi,	%i1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x2C3, 	%hsys_tick_cmpr
	rdpr	%cleanwin,	%g5
	srlx	%o1,	0x1D,	%l0
	rdhpr	%hintp,	%i2
	rd	%asi,	%g3
	wrpr	%g4,	0x1966,	%pil
	rdpr	%tl,	%i3
	rdhpr	%hintp,	%o6
	bvc,pt	%icc,	loop_1447
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr 	%g0, 	0x5, 	%fprs
	brlz,a	%o7,	loop_1448
loop_1447:
	wrpr	%i6,	%l1,	%cwp
	set	0x40, %l3
	stda	%f0,	[%l7 + %l3] 0x1e
	membar	#Sync
loop_1448:
	rdhpr	%hintp,	%o0
	sdivx	%g7,	0x0425,	%l5
	rd	%asi,	%o2
	fbuge,a	%fcc3,	loop_1449
	wr	%l4,	%i5,	%clear_softint
	wr	%i7,	%g1,	%pic
	wrpr	%i4,	%o4,	%tick
loop_1449:
	wr	%o3,	%l3,	%softint
	movre	%g6,	0x0B5,	%l6
	rd	%softint,	%o5
	rd	%ccr,	%l2
	rdpr	%canrestore,	%g5
	edge8l	%o1,	%i1,	%i2
	rdpr	%tba,	%l0
	tle	%xcc,	0x0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x92E, 	%hsys_tick_cmpr
	fmovdgu	%icc,	%f23,	%f26
	bg,a	loop_1450
        wr    %g0,    0xe,    %pcr    ! changed.
	wr 	%g0, 	0x7, 	%fprs
	wr	%o6,	0x062A,	%softint
loop_1450:
	andn	%i0,	%i6,	%o7
	tleu	%xcc,	0x5
	tcs	%xcc,	0x3
	rdhpr	%hsys_tick_cmpr,	%l1
	rd	%sys_tick_cmpr,	%g7
	lduw	[%l7 + 0x74],	%l5
	rdpr	%otherwin,	%o0
	fpadd16s	%f21,	%f26,	%f23

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	fmovsl	%xcc,	%f27,	%f15
	nop
	set	0x4B, %i0
	ldstub	[%l7 + %i0],	%l4
	wr	%g1,	%i4,	%softint
	rdhpr	%hintp,	%o4
	rdhpr	%hintp,	%i7
	wrpr	%l3,	0x0F21,	%pil
	mulscc	%o3,	%l6,	%g6
	rd	%sys_tick_cmpr,	%o5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	rd	%pc,	%g5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x899, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%cleanwin,	%g3
	wr	%g4,	0x07BA,	%clear_softint
	movvc	%xcc,	%i2,	%i3
	rdhpr	%htba,	%o6
	wrpr	%g2,	0x081B,	%cwp
	and	%i0,	0x04D5,	%i6
	rd	%asi,	%o7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	te	%icc,	0x6
	rdhpr	%hintp,	%g7
	rdhpr	%htba,	%o2
        wr    %g0,    0xe,    %pcr    ! changed.
	wrpr	%g1,	%o0,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xB99, 	%hsys_tick_cmpr
	wrpr	%i7,	%l3,	%cwp
	alignaddrl	%o3,	%l6,	%i4
	rdpr	%tl,	%g6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x1BC, 	%tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%l2,	0x07ED,	%softint
	orn	%l0,	%g3,	%g4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x2B7, 	%hsys_tick_cmpr
	fabsd	%f4,	%f28
	rd	%ccr,	%o6
	smul	%i2,	%i0,	%g2
	tcc	%icc,	0x1
	fmovdcc	%xcc,	%f23,	%f7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x323, 	%hsys_tick_cmpr
	rdhpr	%hpstate,	%l1
	rd	%softint,	%l5
	set	0x4C, %o5
	ldsha	[%l7 + %o5] 0x10,	%o2
	edge32ln	%g7,	%i5,	%g1
	rdhpr	%hpstate,	%o0
	tsubcc	%l4,	%i7,	%o4
	rdpr	%tba,	%o3
	rd	%pc,	%l3
	subccc	%i4,	%l6,	%g6
	fmovsneg	%icc,	%f18,	%f4
	wr	%g5,	%o1,	%clear_softint
	rd	%softint,	%l2
	rdhpr	%htba,	%l0
	fmuld8sux16	%f25,	%f15,	%f10
	wrpr	%o5,	%g4,	%cwp
	be,a,pt	%icc,	loop_1451
	rdpr	%pil,	%i1
	brgz,a	%g3,	loop_1452
	wrpr	%i3,	%o6,	%pil
loop_1451:
	rdhpr	%htba,	%i2
	subc	%i0,	%g2,	%i6
loop_1452:
	rdhpr	%hintp,	%l1
	flush	%l7 + 0x2C
	wrpr	%o7,	0x0F6C,	%tick
	andcc	%o2,	%g7,	%i5
	smulcc	%l5,	%g1,	%l4
	udiv	%i7,	0x1A88,	%o0
	wrpr	%o4,	0x0343,	%tick
	fone	%f10
	fmovrse	%o3,	%f23,	%f28
	rdpr	%otherwin,	%i4
	set	0x20, %l0
	swapa	[%l7 + %l0] 0x18,	%l3
	subcc	%g6,	%l6,	%o1
	rd	%tick_cmpr,	%l2
	wrpr	%l0,	%o5,	%pil
	rdhpr	%htba,	%g5
	rd	%softint,	%i1
	wrpr	%g3,	0x064A,	%cwp
	rdpr	%tl,	%g4
	rdhpr	%hintp,	%i3
	array32	%i2,	%o6,	%i0
	sdivx	%g2,	0x1714,	%l1
	xorcc	%i6,	0x12E8,	%o7
	move	%icc,	%g7,	%o2
	bneg,pn	%icc,	loop_1453
	tg	%icc,	0x3
	fmovsleu	%xcc,	%f17,	%f9

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_1453:
	rdpr	%pil,	%g1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x923, 	%hsys_tick_cmpr
	alignaddr	%o0,	%l4,	%o4
	wrpr	%i4,	%o3,	%cwp
	rd	%y,	%g6
	swap	[%l7 + 0x78],	%l3
	fbo,a	%fcc2,	loop_1454
	wr	%l6,	0x1F04,	%pic
	rdhpr	%hintp,	%l2
        wr    %g0,    0xe,    %pcr    ! changed.
loop_1454:
	fbul,a	%fcc2,	loop_1455
	fmul8ulx16	%f6,	%f8,	%f0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x2D4, 	%hsys_tick_cmpr
	taddcc	%i1,	%g5,	%g3
loop_1455:
	rd	%ccr,	%i3
	wrpr	%g4,	%o6,	%pil
	rd	%pc,	%i2
	wrpr	%g2,	%i0,	%cwp
        wr    %g0,    0xe,    %pcr    ! changed.
	mova	%icc,	%g7,	%o2
	rdpr	%canrestore,	%l5
	fbe,a	%fcc3,	loop_1456
	rdhpr	%hpstate,	%i5
	wr	%o7,	%g1,	%ccr
	rdpr	%canrestore,	%o0
loop_1456:
	tgu	%icc,	0x0
	fmovsneg	%icc,	%f30,	%f14
	fcmps	%fcc3,	%f15,	%f14
	popc	%i7,	%o4
	bne	%xcc,	loop_1457
	wrpr	%i4,	%o3,	%pil
	rd	%tick_cmpr,	%l4
	rdhpr	%hintp,	%l3
loop_1457:
	add	%l6,	%l2,	%g6
	rdpr	%tba,	%o1
	rdpr	%cansave,	%o5
	movpos	%xcc,	%l0,	%g5
	rdhpr	%hpstate,	%g3
	fmovsl	%icc,	%f30,	%f4
	wrpr	%i3,	%g4,	%cwp
	andcc	%i1,	0x0299,	%i2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xDBB, 	%hsys_tick_cmpr
	wrpr	%l1,	%i6,	%cwp
	rd	%ccr,	%o6
	udivx	%o2,	0x17BA,	%l5
	ba,pt	%xcc,	loop_1458
	lduh	[%l7 + 0x0E],	%i5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wrpr	%g7,	0x0C49,	%cwp
loop_1458:
	fmovdgu	%xcc,	%f20,	%f4
	rdpr	%cansave,	%g1
	wrpr	%o0,	0x07C8,	%cwp
	rdpr	%wstate,	%i7
	movle	%icc,	%o7,	%i4
	tn	%icc,	0x6
	wr	%o3,	0x0413,	%softint
	srlx	%l4,	0x0B,	%l3
	rd	%tick_cmpr,	%o4
	wr	%l6,	%l2,	%clear_softint
	rdhpr	%htba,	%g6
	rd	%softint,	%o5
	sdivcc	%o1,	0x0173,	%g5
	rdpr	%wstate,	%g3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	add	%g4,	%i1,	%i2
	fmovrsgz	%g2,	%f2,	%f15
	wr 	%g0, 	0x7, 	%fprs
	wrpr	%i6,	0x03A4,	%cwp
	wr	%o6,	%o2,	%ccr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	wr	%i5,	%g7,	%softint
	rd	%y,	%g1
	umulcc	%l1,	0x0AB8,	%o0
	wrpr	%i7,	%o7,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fbg	%fcc2,	loop_1459
	wr	%l4,	0x05B9,	%ccr
	andncc	%l3,	%o4,	%l6
	wrpr	%l2,	0x0C13,	%cwp
loop_1459:
	nop
	add	%l7,	0x30,	%l6
	wr	%g0,	0x11,	%asi
	casxa	[%l6] %asi,	%g6,	%i4
	andn	%o1,	%g5,	%o5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	xor	%g4,	%g3,	%i2
	fbuge,a	%fcc1,	loop_1460
	ldsw	[%l7 + 0x60],	%i1
	wrpr	%i3,	0x1868,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xCB8, 	%hsys_tick_cmpr
loop_1460:
	tvc	%icc,	0x4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	tn	%xcc,	0x4
	wrpr	%o2,	%l5,	%cwp
	wrpr	%g7,	0x117A,	%tick
	tcs	%xcc,	0x1
	wr	%g0,	0x10,	%asi
	ldsba	[%l7 + 0x1B] %asi,	%g1
	rd	%tick_cmpr,	%l1
	movge	%icc,	%o0,	%i5
	rdhpr	%hintp,	%o7
	fmovdne	%xcc,	%f21,	%f19
	rd	%y,	%o3
	wrpr	%l4,	%i7,	%tick
	rdhpr	%hsys_tick_cmpr,	%l3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	std	%l2,	[%l7 + 0x10]
	edge8l	%g6,	%l6,	%i4
	bvc,pn	%icc,	loop_1461
	tl	%icc,	0x3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xF24, 	%hsys_tick_cmpr
	fba	%fcc3,	loop_1462
loop_1461:
	rd	%ccr,	%o1
	brnz,a	%g4,	loop_1463
	wrpr	%l0,	0x1905,	%cwp
loop_1462:
	rd	%sys_tick_cmpr,	%i2
	fcmple16	%f26,	%f2,	%g3
loop_1463:
	rd	%tick_cmpr,	%i1
        wr    %g0,    0xe,    %pcr    ! changed.
	wr	%i6,	0x16A2,	%softint
	ta	%xcc,	0x0
	rdpr	%wstate,	%o6
	udivx	%g2,	0x17BC,	%o2
	smul	%g7,	0x028C,	%l5
	tcc	%xcc,	0x1
        wr    %g0,    0xe,    %pcr    ! changed.
	wrpr	%i5,	0x13F9,	%pil
	or	%o7,	0x04F7,	%o0
	movvc	%xcc,	%o3,	%l4
	wrpr	%l3,	%o4,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	sth	%i7,	[%l7 + 0x26]
	xor	%l6,	0x062A,	%i4
	rd	%asi,	%g6
	fba	%fcc3,	loop_1464
	wr	%o5,	0x0E82,	%sys_tick
	rdpr	%otherwin,	%o1
	subccc	%g4,	%g5,	%i2
loop_1464:
	movgu	%icc,	%l0,	%g3
	movrne	%i1,	%i0,	%i6
	fmovrslez	%i3,	%f1,	%f11
	or	%o6,	0x103D,	%o2
	array8	%g2,	%l5,	%g7
	add	%l7,	0x10,	%l6
	wr	%g0,	0x0c,	%asi
	ldxa	[%l6] %asi,	%l1
	casxa	[%l6] %asi,	%l1,	%i5
	rdpr	%pil,	%g1
	tle	%xcc,	0x3
	rdpr	%wstate,	%o7
	fcmps	%fcc1,	%f0,	%f16
	rdhpr	%hsys_tick_cmpr,	%o3
	wrpr	%l4,	0x0FBB,	%pil
	umul	%o0,	%l3,	%l2
	wr	%i7,	%l6,	%set_softint
	bcc	loop_1465
	fxors	%f19,	%f0,	%f24
        wr    %g0,    0xe,    %pcr    ! changed.
	add	%l7,	0x18,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%o5
	casxa	[%l6] 0x88,	%o5,	%g6
loop_1465:
	tvc	%xcc,	0x6
	wr	%o1,	%g4,	%y
	tsubcctv	%i2,	0x1967,	%g5
	edge32ln	%g3,	%l0,	%i1
	edge32	%i6,	%i0,	%i3
	rdpr	%tl,	%o6
	wr	%o2,	%l5,	%y
	rdpr	%gl,	%g2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	sdiv	%i5,	0x0378,	%g1
	rd	%tick_cmpr,	%o7
	movcs	%xcc,	%l4,	%o3
	wrpr	%l3,	%o0,	%pil
	rd	%sys_tick_cmpr,	%l2
	rdpr	%pil,	%i7
	edge8l	%i4,	%o4,	%l6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xF04, 	%hsys_tick_cmpr
	wrpr	%o1,	%i2,	%pil
	movvs	%xcc,	%g5,	%g4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x1DC, 	%sys_tick_cmpr
	fmovsg	%xcc,	%f14,	%f16
	rdpr	%cleanwin,	%i6
	fbl,a	%fcc3,	loop_1466
	rdhpr	%htba,	%g3
	edge16l	%i3,	%i0,	%o6
	wrpr	%l5,	%o2,	%tick
loop_1466:
	wrpr	%g2,	0x0FB4,	%cwp
	movvc	%icc,	%l1,	%g7
	ldd	[%l7 + 0x68],	%g0
	wrpr	%i5,	0x0783,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fnot1s	%f1,	%f25

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x104, 	%hsys_tick_cmpr
	fbuge,a	%fcc3,	loop_1467
	rd	%pc,	%l2
	rdpr	%otherwin,	%o7
	wrpr	%i7,	%i4,	%tick
loop_1467:
	array8	%o4,	%g6,	%l6
	rdpr	%cwp,	%o5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%canrestore,	%g4
	rdhpr	%hpstate,	%l0
	edge16l	%g5,	%i6,	%g3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%i3,	0x09FB,	%pic
	wrpr	%i0,	0x1521,	%cwp
	bpos,a,pt	%icc,	loop_1468
	nop
	setx	loop_1469,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	rd	%fprs,	%o6
	te	%icc,	0x5
loop_1468:
	rdhpr	%hpstate,	%o2
loop_1469:
	rdhpr	%htba,	%l5
	orncc	%l1,	%g2,	%g7
	wr	%g1,	0x1B1C,	%clear_softint
	rdhpr	%htba,	%l4
	rdhpr	%hintp,	%o3
	rdpr	%canrestore,	%l3
	lduw	[%l7 + 0x3C],	%i5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%hsys_tick_cmpr,	%i4
	rd	%ccr,	%o4
	movle	%icc,	%i7,	%g6
	rdpr	%canrestore,	%l6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%o1,	0x1F51,	%cwp
	rdpr	%otherwin,	%g4
	wr 	%g0, 	0x6, 	%fprs
	xorcc	%i6,	%g5,	%g3
	sdivx	%i3,	0x13C1,	%i0
	wr	%o6,	0x0616,	%ccr
	tsubcc	%o2,	0x0351,	%i1
	rdhpr	%hpstate,	%l5
	tl	%xcc,	0x3
	orn	%l1,	%g2,	%g1
	faligndata	%f0,	%f4,	%f8
	bne,pt	%icc,	loop_1470
	movgu	%icc,	%l4,	%g7
	tne	%xcc,	0x7
	ba,a	loop_1471
loop_1470:
	movneg	%icc,	%l3,	%i5
	movcs	%xcc,	%o0,	%o7
	fnors	%f24,	%f15,	%f18
loop_1471:
	fones	%f28

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xA5A, 	%hsys_tick_cmpr
	rd	%pc,	%o3
	wrpr	%o4,	%i7,	%cwp
	wrpr	%l6,	%o5,	%pil
	rd	%asi,	%g6
	nop
	setx	loop_1472,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	rd	%asi,	%o1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x8B6, 	%hsys_tick_cmpr
	wrpr	%l0,	0x1BDE,	%tick
loop_1472:
	wr	%i6,	0x0A6A,	%pic

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	sllx	%g3,	0x11,	%i3
	rd	%sys_tick_cmpr,	%i0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
        wr    %g0,    0xe,    %pcr    ! changed.
	wr	%l1,	0x1013,	%ccr
	rdhpr	%hsys_tick_cmpr,	%o2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	rd	%ccr,	%l4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	wrpr	%i5,	%o7,	%cwp
	rdpr	%gl,	%l2
	rdpr	%canrestore,	%i4
	rdpr	%gl,	%o0
	fmul8x16	%f31,	%f14,	%f6
	rdhpr	%htba,	%o4
	taddcc	%o3,	%i7,	%o5
	movge	%icc,	%l6,	%o1
	tgu	%icc,	0x2
	wrpr	%g4,	0x1855,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x2CC, 	%tick_cmpr
	movrlz	%i2,	%l0,	%i6
	rdpr	%canrestore,	%g3
	umul	%g5,	0x0F83,	%i3
	rd	%y,	%o6
	tgu	%icc,	0x7
	bg,a	%icc,	loop_1473
	rd	%pc,	%i1
	wrpr	%l5,	%l1,	%tick
	rd	%fprs,	%i0
loop_1473:
	nop
	set	0x78, %i5
	ldub	[%l7 + %i5],	%g2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fmovsg	%xcc,	%f24,	%f6
	wr	%g1,	%l3,	%sys_tick
	wrpr	%g7,	0x1104,	%tick
	orn	%i5,	%l4,	%l2
	wr	%o7,	%o0,	%clear_softint
	rdhpr	%htba,	%i4
	fpack32	%f28,	%f4,	%f30
	wrpr	%o4,	%i7,	%cwp
	wr 	%g0, 	0x5, 	%fprs

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	edge32ln	%o1,	%g4,	%i2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	ldstub	[%l7 + 0x08],	%g3
	edge8ln	%i6,	%i3,	%o6
	rd	%softint,	%i1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	move	%xcc,	%l1,	%i0
	rdpr	%canrestore,	%l5
	wrpr	%o2,	0x01B6,	%tick
	set	0x48, %i3
	ldxa	[%l7 + %i3] 0x88,	%g2
	add	%l7,	0x58,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%l3
	casxa	[%l6] 0x88,	%l3,	%g7
	tpos	%xcc,	0x4
	movneg	%icc,	%i5,	%l4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	tl	%xcc,	0x4
	bcc,a	loop_1474
	fmul8sux16	%f4,	%f4,	%f4
	lduw	[%l7 + 0x28],	%l2
	rdhpr	%hsys_tick_cmpr,	%o0
loop_1474:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr 	%g0, 	0x6, 	%fprs
	rdhpr	%hpstate,	%o5
	udivcc	%o3,	0x064B,	%i7
	wr	%l6,	0x0CF6,	%pic
	fmovsg	%icc,	%f16,	%f11
	fones	%f20
	tvs	%icc,	0x4
	edge16ln	%g4,	%i2,	%l0
	rdhpr	%hsys_tick_cmpr,	%g6
	wr	%g3,	0x0BF9,	%set_softint
	wrpr	%i6,	0x0042,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fmovsl	%xcc,	%f26,	%f11
	membar	0x68
	rdhpr	%hpstate,	%g5
	rd	%fprs,	%l1
	wrpr	%i3,	%l5,	%pil
	rdhpr	%hpstate,	%o2
	tge	%xcc,	0x6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x75E, 	%hsys_tick_cmpr
	rdhpr	%hpstate,	%l3
	wr 	%g0, 	0x7, 	%fprs

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%l2,	0x1C03,	%sys_tick
	fbul	%fcc0,	loop_1475
	bvc,a	loop_1476
	sra	%l4,	0x04,	%o7
	fmovdg	%xcc,	%f22,	%f17
loop_1475:
	movrne	%o0,	%o4,	%i4
loop_1476:
	rdpr	%tba,	%o5
	rd	%pc,	%i7
	wrpr	%o3,	%g4,	%tick
	fmovrsgez	%l6,	%f29,	%f7
	andn	%l0,	0x05E5,	%i2
	membar	#Sync
	set	0x40, %g2
	ldda	[%l7 + %g2] 0x1f,	%f16
	fmovdgu	%icc,	%f0,	%f5
	movg	%icc,	%g6,	%g3
	wrpr	%i6,	0x0D39,	%tick
	wr	%o1,	%i1,	%clear_softint
	rdpr	%otherwin,	%g5
	rd	%asi,	%o6
	flush	%l7 + 0x30
	rdhpr	%hintp,	%i3
	rd	%tick_cmpr,	%l5
	movneg	%xcc,	%l1,	%i0
	rdhpr	%hintp,	%o2
	rdhpr	%htba,	%l3
	rdpr	%tl,	%g2
	and	%i5,	0x1830,	%g1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%o7,	%o0,	%cwp
	fpack16	%f10,	%f17
	rdpr	%cansave,	%o4
	wrpr	%i4,	%g7,	%pil
	std	%o4,	[%l7 + 0x20]
	xor	%o3,	%g4,	%i7
	wr	%l6,	0x0C4A,	%sys_tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x0EA, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x399, 	%sys_tick_cmpr
	edge32	%i6,	%o1,	%i2
	rd	%sys_tick_cmpr,	%i1
	rdhpr	%htba,	%o6
	movre	%i3,	%g5,	%l5
	rdpr	%gl,	%i0
	edge8ln	%l1,	%l3,	%o2
	rdpr	%cansave,	%g2
	sethi	0x1630,	%i5
	sra	%g1,	0x16,	%l4
	smul	%l2,	0x0F4E,	%o0
	fpmerge	%f9,	%f16,	%f16
	set	0x38, %l6
	prefetcha	[%l7 + %l6] 0x18,	 0x2
	rd	%tick_cmpr,	%o7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%o3,	0x1D72,	%sys_tick
	wrpr	%g7,	0x10AE,	%cwp
	wr	%g4,	0x17C0,	%clear_softint

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%cwp,	%l6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	edge32	%g3,	%i6,	%o1
	edge32n	%i1,	%o6,	%i2
	rdpr	%tl,	%i3
	fmovrde	%l5,	%f28,	%f20
	rd	%y,	%g5
	wrpr	%i0,	%l1,	%cwp
	rdhpr	%hintp,	%l3
	ldsb	[%l7 + 0x34],	%g2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	array16	%i5,	%l4,	%g1
	rd	%tick_cmpr,	%l2
	rdhpr	%htba,	%o0
	subcc	%o4,	%i4,	%o7
	wrpr	%o3,	%g7,	%cwp
	rdpr	%pil,	%o5
	rd	%sys_tick_cmpr,	%g4
	rdhpr	%hintp,	%l0
	ble	%xcc,	loop_1477
	rd	%ccr,	%i7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xB8E, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_1477:
	tvs	%icc,	0x3
	rdhpr	%hpstate,	%o1
	ba,a,pt	%icc,	loop_1478
	wrpr	%i6,	0x1982,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x465, 	%hsys_tick_cmpr
	wrpr	%i2,	0x14E4,	%cwp
loop_1478:
	nop
	wr	%g0,	0x0c,	%asi
	ldstuba	[%l7 + 0x24] %asi,	%i3
	wrpr	%o6,	0x04B8,	%tick
	rdhpr	%htba,	%l5
	rdpr	%pil,	%i0
	rdpr	%pil,	%l1
	umulcc	%l3,	0x1891,	%g2
	rdpr	%cleanwin,	%o2
        wr    %g0,    0xe,    %pcr    ! changed.
	rdhpr	%hpstate,	%g1
	rd	%asi,	%l2
	umul	%l4,	%o4,	%o0
	wrpr	%o7,	%i4,	%tick
	rdpr	%cansave,	%g7
	tn	%icc,	0x2
	edge8n	%o5,	%g4,	%l0
	or	%i7,	%g6,	%l6
	rdpr	%pil,	%g3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	fbge,a	%fcc3,	loop_1479
	wr	%i6,	%i1,	%sys_tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xF83, 	%hsys_tick_cmpr
	rdpr	%wstate,	%o1
loop_1479:
	rdpr	%gl,	%o6
	wr 	%g0, 	0x6, 	%fprs
	rdhpr	%hsys_tick_cmpr,	%i0
	rdpr	%wstate,	%i3
	rdhpr	%hintp,	%l1
	rdpr	%cansave,	%l3
	edge16n	%g2,	%o2,	%i5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	stw	%l2,	[%l7 + 0x3C]
	fmovsleu	%xcc,	%f3,	%f9
	rdpr	%canrestore,	%o4
	rdpr	%cleanwin,	%l4
	movrgz	%o0,	0x3A3,	%i4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	edge32ln	%o5,	%l0,	%i7
	be	%xcc,	loop_1480
	rdhpr	%hintp,	%l6
	wrpr	%g3,	%o3,	%tick
	andn	%g6,	0x1B77,	%i6
loop_1480:
	umul	%i1,	0x1503,	%o1
	brlez	%i2,	loop_1481
	fblg,a	%fcc0,	loop_1482
	wr	%o6,	%l5,	%ccr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x8A2, 	%hsys_tick_cmpr
loop_1481:
	rd	%sys_tick_cmpr,	%l3
loop_1482:
	rd	%sys_tick_cmpr,	%g2
	rdpr	%cleanwin,	%o2
	wr	%g0,	0x04,	%asi
	ldstuba	[%l7 + 0x43] %asi,	%i5
	rdpr	%gl,	%g5
	rdpr	%canrestore,	%g1
	udivcc	%l2,	0x1AA9,	%o4
	rd	%tick_cmpr,	%i3
	wrpr	%o0,	0x1019,	%cwp
	rdpr	%pil,	%i4
	rdhpr	%hsys_tick_cmpr,	%g7
	wr	%o7,	%l4,	%pic
	wrpr	%g4,	%l0,	%tick
	fbu,a	%fcc3,	loop_1483
	wr	%i7,	%o5,	%set_softint
	rdhpr	%hpstate,	%l6
	wr	%g3,	%g6,	%ccr
loop_1483:
	sth	%i6,	[%l7 + 0x0E]
	rdpr	%tba,	%i1
	add	%l7,	0x28,	%l6
	wr	%g0,	0x0c,	%asi
	casa	[%l6] 0x0c,	%o3,	%i2
	brgez,a	%o1,	loop_1484
	wrpr	%l5,	%o6,	%tick
	rdpr	%tba,	%i0
	rdpr	%cwp,	%l1
loop_1484:
	tl	%xcc,	0x4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%g2,	%g5,	%tick
	rd	%asi,	%i5
	edge16n	%g1,	%l2,	%o4
	fcmpgt32	%f30,	%f10,	%i3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%hsys_tick_cmpr,	%i4
	stw	%l4,	[%l7 + 0x18]
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	rd	%y,	%o7
	movrlez	%g4,	%i7,	%o5
	rd	%y,	%l0
	fcmpd	%fcc0,	%f30,	%f4
	rdhpr	%hsys_tick_cmpr,	%l6
	rd	%pc,	%g3
	fba,a	%fcc0,	loop_1485
	subc	%g6,	0x1B19,	%i6
	tvs	%xcc,	0x1
	sir	0x14F1
loop_1485:
	fnands	%f6,	%f22,	%f6
	add	%l7,	0x30,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%i1,	%o3
	fmovdcc	%xcc,	%f12,	%f8
	umulcc	%i2,	0x0907,	%l5
	brgez,a	%o1,	loop_1486
	rdhpr	%hsys_tick_cmpr,	%i0
	wrpr	%o6,	0x154B,	%tick
	fornot1	%f2,	%f18,	%f16
loop_1486:
	std	%f6,	[%l7 + 0x28]
	tcc	%icc,	0x2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xBA6, 	%hsys_tick_cmpr
	smul	%o2,	0x18AE,	%g2
	wrpr	%i5,	0x1157,	%tick
	rdhpr	%hintp,	%g1
	rd	%y,	%g5
	wr	%o4,	0x0436,	%ccr
	rdhpr	%hsys_tick_cmpr,	%l2
	rdhpr	%hpstate,	%i3
	tvc	%xcc,	0x3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xFEF, 	%sys_tick_cmpr
	sdiv	%i4,	0x0CF0,	%o7
	edge16n	%g4,	%i7,	%o5
	ldd	[%l7 + 0x60],	%l4
	wrpr	%l0,	%g3,	%cwp
	wrpr	%g6,	0x0C94,	%tick
	movn	%xcc,	%i6,	%l6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%y,	%i1
	wrpr	%i2,	0x1AC1,	%pil
	rd	%y,	%o1
	rd	%ccr,	%l5
	rdpr	%pil,	%o6
	rdpr	%canrestore,	%i0
	rdhpr	%htba,	%l1
	orcc	%o2,	0x184F,	%g2
	wrpr	%i5,	0x1F36,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	wr	%g0,	0x89,	%asi
	lduwa	[%l7 + 0x54] %asi,	%g1
	bg,a	loop_1487
	fnegs	%f15,	%f0
	rdhpr	%hpstate,	%l2
	fmovdpos	%icc,	%f14,	%f22
loop_1487:
	ldd	[%l7 + 0x60],	%i2
	movre	%o4,	0x1F4,	%o0
	umulcc	%i4,	0x1C85,	%g7
	tvs	%icc,	0x6
	taddcctv	%o7,	%i7,	%o5
	rdpr	%canrestore,	%g4
	wr	%l4,	0x189E,	%set_softint
	lduw	[%l7 + 0x54],	%g3
	rdpr	%gl,	%l0
	wrpr	%g6,	0x07ED,	%pil
	rdhpr	%hintp,	%i6
	rd	%sys_tick_cmpr,	%l6
	nop
	setx	loop_1488,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	sth	%i1,	[%l7 + 0x6E]
	fpadd32s	%f10,	%f22,	%f26
	fmovdg	%icc,	%f27,	%f27
loop_1488:
	add	%i2,	%o1,	%l5
	wr	%o3,	0x1BB5,	%ccr
	fmovrsgz	%o6,	%f31,	%f19

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xAD3, 	%hsys_tick_cmpr
	tvs	%icc,	0x7
	tcs	%xcc,	0x3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fmovrdgez	%o2,	%f18,	%f12

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	rdhpr	%hsys_tick_cmpr,	%l3
	sll	%g5,	%g1,	%l2
	wrpr	%i3,	%o4,	%pil
	ldsb	[%l7 + 0x52],	%o0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x525, 	%hsys_tick_cmpr
	rdhpr	%hpstate,	%g7
	rdhpr	%hintp,	%i7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xC8A, 	%tick_cmpr
	movge	%icc,	%g4,	%l4
	wr	%g0,	0x0c,	%asi
	ldxa	[%l7 + 0x48] %asi,	%o5
	rdhpr	%hpstate,	%l0
	wrpr	%g3,	0x1910,	%pil
	edge32l	%g6,	%l6,	%i6
	rdpr	%cansave,	%i1
	fmovrde	%i2,	%f28,	%f12
	sth	%l5,	[%l7 + 0x50]
	rdpr	%pil,	%o1
	rdhpr	%hintp,	%o6
	xnor	%o3,	%i0,	%g2
	wrpr	%l1,	%o2,	%cwp
	rdpr	%cleanwin,	%l3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x5C7, 	%hsys_tick_cmpr
	rd	%softint,	%g1
	wr	%i3,	0x1B1C,	%y
	wr	%o4,	%o0,	%softint
	rdpr	%cleanwin,	%i4
	rd	%y,	%l2
	wr	%i7,	0x01C9,	%y
	rdpr	%canrestore,	%o7
	fmovrsne	%g4,	%f0,	%f10
	brgez,a	%g7,	loop_1489
	edge32n	%l4,	%o5,	%l0
	fsrc2	%f4,	%f6
	nop
	set	0x50, %g1
	ldd	[%l7 + %g1],	%g6
loop_1489:
	rd	%sys_tick_cmpr,	%l6
	wr	%i6,	%g3,	%set_softint
	sdivx	%i1,	0x0F61,	%i2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xC91, 	%hsys_tick_cmpr
	wrpr	%o6,	%o3,	%pil
	wr	%i0,	0x0709,	%y
	sdivcc	%l5,	0x11BF,	%l1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%l3,	0x1955,	%y
	ldx	[%l7 + 0x30],	%o2
	orn	%i5,	%g5,	%g1
	rdhpr	%hsys_tick_cmpr,	%o4
	movneg	%icc,	%o0,	%i3
	rd	%asi,	%i4
	ldd	[%l7 + 0x60],	%l2
	wr	%i7,	%g4,	%y
	wr	%g7,	%o7,	%y

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	andncc	%g6,	%l0,	%l6
	mulscc	%i6,	0x0621,	%i1
	wr	%g3,	0x1A47,	%clear_softint
	or	%i2,	0x1A53,	%o1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%hsys_tick_cmpr,	%o6
	rdhpr	%hsys_tick_cmpr,	%l5
	rdpr	%cwp,	%i0
	wrpr	%g2,	%l1,	%pil
	mova	%icc,	%o2,	%l3
	wr	%i5,	%g5,	%set_softint
	rd	%tick_cmpr,	%g1
	sdiv	%o0,	0x0C61,	%o4
	rd	%y,	%i3
	rd	%tick_cmpr,	%l2
	rdpr	%cansave,	%i7
	rd	%ccr,	%g4
	rdhpr	%hsys_tick_cmpr,	%g7
	array8	%i4,	%o7,	%o5
	fsrc2s	%f8,	%f28
	rdhpr	%htba,	%l4
	wr	%g6,	%l6,	%set_softint
	rdhpr	%hsys_tick_cmpr,	%l0
	movg	%icc,	%i1,	%g3
	sra	%i6,	%i2,	%o3
	wr	%o1,	%l5,	%softint
	wrpr	%o6,	0x0109,	%tick
	fnot2s	%f22,	%f21
	rdpr	%tba,	%i0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnegs	%f27,	%f29
	rd	%y,	%l1
	wr 	%g0, 	0x4, 	%fprs
	fbue,a	%fcc1,	loop_1490
	movneg	%icc,	%g2,	%i5
	rd	%softint,	%g1
	rdhpr	%htba,	%o0
loop_1490:
	wrpr	%o4,	0x12AF,	%cwp
	bne,a,pt	%icc,	loop_1491
	rd	%asi,	%i3
	brgz,a	%g5,	loop_1492
	bne,a,pn	%xcc,	loop_1493
loop_1491:
	sub	%i7,	%g4,	%g7
	rdhpr	%hsys_tick_cmpr,	%l2
loop_1492:
	fmovsvc	%icc,	%f26,	%f12
loop_1493:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x4D3, 	%hsys_tick_cmpr
	fnands	%f14,	%f19,	%f14

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x21A, 	%hsys_tick_cmpr
	wr	%g0,	0x88,	%asi
	ldda	[%l7 + 0x50] %asi,	%i6
	rdhpr	%hintp,	%g6
	wr	%i1,	0x0B1D,	%ccr
	rdhpr	%htba,	%l0
	rdpr	%otherwin,	%g3
	rdpr	%cleanwin,	%i2
	rdhpr	%htba,	%i6
	rdhpr	%htba,	%o3
	rdhpr	%hsys_tick_cmpr,	%o1
	rdpr	%wstate,	%o6
	array8	%l5,	%l1,	%i0
	rdpr	%tl,	%l3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x18B, 	%hsys_tick_cmpr
	bneg	%icc,	loop_1494
	fandnot1	%f8,	%f0,	%f0
	wrpr	%o2,	0x026A,	%pil
	wr	%g1,	0x190F,	%softint
loop_1494:
	srl	%i5,	0x0E,	%o0
	movrlz	%o4,	0x363,	%g5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xCD5, 	%hsys_tick_cmpr
	stw	%g4,	[%l7 + 0x48]
	bcc	%icc,	loop_1495
	fmuld8sux16	%f23,	%f31,	%f2
	rd	%sys_tick_cmpr,	%i7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xBBA, 	%hsys_tick_cmpr
loop_1495:
        wr    %g0,    0xe,    %pcr    ! changed.
	wrpr	%i4,	%l6,	%pil
	rdpr	%gl,	%l4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x309, 	%hsys_tick_cmpr
	wr	%l0,	%g3,	%clear_softint
	fpsub32s	%f12,	%f7,	%f20
	rdhpr	%hpstate,	%i2
	srlx	%i1,	%o3,	%o1
	set	0x27, %l5
	ldstuba	[%l7 + %l5] 0x18,	%i6
	movrlz	%o6,	%l1,	%i0
        wr    %g0,    0xe,    %pcr    ! changed.
	wr	%o2,	%g1,	%clear_softint
	movcs	%xcc,	%i5,	%o0
	rdhpr	%hsys_tick_cmpr,	%l5
	rd	%fprs,	%o4
	tcs	%xcc,	0x7
	movge	%xcc,	%i3,	%g5
	fxnors	%f28,	%f9,	%f5
	bneg,a	%xcc,	loop_1496
	movne	%icc,	%g4,	%i7
	movvs	%icc,	%o7,	%l2
	set	0x40, %o4
	ldda	[%l7 + %o4] 0x10,	%f16
loop_1496:
	rdpr	%tba,	%o5
	addccc	%i4,	%l6,	%l4
	rdhpr	%hsys_tick_cmpr,	%g7
	wr	%g6,	0x0054,	%y
	ldsb	[%l7 + 0x1A],	%g3
	wrpr	%l0,	%i1,	%cwp
	tn	%xcc,	0x4
	rdpr	%cwp,	%o3
	rd	%softint,	%i2
	rdhpr	%hsys_tick_cmpr,	%o1
	rdpr	%wstate,	%i6
	sir	0x1A3B
	edge16ln	%l1,	%i0,	%l3
	andncc	%g2,	%o6,	%g1
	taddcctv	%o2,	0x0459,	%o0
	tvc	%xcc,	0x5
	wr	%i5,	%o4,	%sys_tick
	sll	%l5,	0x03,	%i3
	tge	%xcc,	0x4
	move	%xcc,	%g4,	%g5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%tick_cmpr,	%i7
	fpack32	%f4,	%f28,	%f18
	rdhpr	%hpstate,	%i4
	fnegd	%f24,	%f16
	bneg,a	%xcc,	loop_1497
	bne	loop_1498
	rd	%tick_cmpr,	%l6
	wrpr	%o5,	0x1B67,	%cwp
loop_1497:
	wr	%l4,	0x1F1C,	%clear_softint
loop_1498:
	rdhpr	%hpstate,	%g7
	movneg	%icc,	%g3,	%l0
	wr	%i1,	%g6,	%ccr
	edge8l	%i2,	%o1,	%i6
	wr	%g0,	0x23,	%asi
	stda	%o2,	[%l7 + 0x58] %asi
	membar	#Sync
	tg	%xcc,	0x0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xB75, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xFCF, 	%hsys_tick_cmpr
	rdhpr	%hpstate,	%l3
	taddcc	%o6,	%g1,	%g2
	wr	%o2,	0x10DB,	%y
	rdpr	%wstate,	%o0
	wrpr	%i5,	%l5,	%cwp
	bvc,a	loop_1499
	rdhpr	%hsys_tick_cmpr,	%i3
	wrpr	%g4,	%g5,	%pil
	wr	%o7,	%o4,	%pic
loop_1499:
	stx	%i7,	[%l7 + 0x18]
	wrpr	%i4,	%l6,	%tick
	wr	%g0,	0x11,	%asi
	stwa	%o5,	[%l7 + 0x5C] %asi
	tpos	%icc,	0x4
	rdhpr	%hpstate,	%l4
	srl	%l2,	%g7,	%g3
	wrpr	%l0,	%i1,	%pil
	fcmpeq16	%f0,	%f18,	%i2
	sdiv	%o1,	0x0008,	%i6
	rdpr	%gl,	%o3
	rd	%y,	%g6
	add	%l7,	0x2C,	%l6
	wr	%g0,	0x10,	%asi
	casa	[%l6] 0x10,	%l1,	%l3
	array32	%i0,	%o6,	%g2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x32F, 	%hsys_tick_cmpr
	tge	%icc,	0x6
	fpackfix	%f22,	%f28
        wr    %g0,    0xe,    %pcr    ! changed.
	rdpr	%tl,	%i5
	wrpr	%i3,	0x1851,	%pil
	lduh	[%l7 + 0x2A],	%l5
	nop
	setx	loop_1500,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	rd	%y,	%g5
	mulx	%o7,	%g4,	%i7
	rdpr	%canrestore,	%i4
loop_1500:
	edge32ln	%o4,	%l6,	%o5
	fcmpes	%fcc3,	%f11,	%f13
	wrpr	%l2,	%g7,	%cwp
	rd	%y,	%g3
	fmul8x16	%f29,	%f22,	%f22
	fmovdneg	%xcc,	%f22,	%f1
	wrpr	%l4,	%i1,	%cwp
	rdhpr	%hpstate,	%l0
	rd	%y,	%i2
	movgu	%xcc,	%o1,	%i6
        wr    %g0,    0xe,    %pcr    ! changed.
	add	%l7,	0x70,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%l1
	casxa	[%l6] 0x80,	%l1,	%g6
	nop
	setx loop_1501, %l0, %l1
	jmpl %l1, %l3
	subc	%i0,	%o6,	%g2
	ta	%icc,	0x6
	movrne	%o2,	0x341,	%g1
loop_1501:
	tpos	%xcc,	0x7
	rd	%fprs,	%i5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%o0,	%g5,	%sys_tick
	wr	%l5,	%o7,	%softint
	rdhpr	%htba,	%g4
	wrpr	%i7,	%o4,	%pil
	wrpr	%l6,	%i4,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%htba,	%l2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xD7A, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xA06, 	%hsys_tick_cmpr
	srax	%i2,	%o1,	%l0
	sra	%i6,	%o3,	%g6
	stw	%l3,	[%l7 + 0x4C]
	rdpr	%canrestore,	%i0
	edge8l	%o6,	%l1,	%g2
	ble,pt	%xcc,	loop_1502
	wrpr	%g1,	%i5,	%cwp
	addccc	%i3,	%o0,	%o2
	array16	%l5,	%g5,	%g4
loop_1502:
	bleu,a	%xcc,	loop_1503
	sllx	%o7,	0x05,	%o4
	rdpr	%tl,	%l6
	wrpr	%i4,	%o5,	%tick
loop_1503:
	rdhpr	%hintp,	%i7
	fmovdleu	%icc,	%f0,	%f0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	srl	%l4,	0x19,	%g3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	rd	%pc,	%i2
	wr	%o1,	%l0,	%sys_tick
	wr	%i1,	%o3,	%ccr
	wrpr	%i6,	0x178B,	%tick
	rdhpr	%hintp,	%g6
	rdpr	%cleanwin,	%i0
	edge8ln	%o6,	%l3,	%l1
	array16	%g2,	%g1,	%i3
	wrpr	%o0,	%o2,	%cwp
	addccc	%l5,	0x1F51,	%g5
	rdhpr	%hpstate,	%i5
	movge	%icc,	%o7,	%o4
	edge16l	%g4,	%l6,	%i4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tvs	%xcc,	0x7
	fornot1	%f20,	%f8,	%f26

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fmovdn	%xcc,	%f30,	%f5
	fmovsl	%icc,	%f6,	%f1
	wrpr	%o5,	%l2,	%pil
	udiv	%g3,	0x1F51,	%i2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xC47, 	%hsys_tick_cmpr
	wr	%l0,	%i1,	%pic
	mova	%icc,	%o1,	%o3
	ta	%xcc,	0x2
	rd	%tick_cmpr,	%i6
	wrpr	%g6,	0x1A17,	%cwp
	rdhpr	%hpstate,	%o6
	wrpr	%i0,	0x0A15,	%cwp
	flush	%l7 + 0x10
	tvs	%xcc,	0x4
	fbug	%fcc2,	loop_1504
	wr	%l1,	%l3,	%sys_tick
	rdhpr	%hsys_tick_cmpr,	%g2
	fcmpeq32	%f26,	%f2,	%i3
loop_1504:
	fmovrslz	%g1,	%f10,	%f19
	movrlez	%o0,	%o2,	%l5
	ta	%icc,	0x0
	tg	%xcc,	0x6
	bpos,a	loop_1505
	rdpr	%cansave,	%g5
	array32	%i5,	%o4,	%g4
	bg,a	loop_1506
loop_1505:
	rdpr	%cansave,	%l6
	fmovd	%f18,	%f26
	rdhpr	%hintp,	%o7
loop_1506:
	fcmps	%fcc0,	%f4,	%f16

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xC65, 	%tick_cmpr
	rdhpr	%hpstate,	%g7
	bleu,a,pn	%xcc,	loop_1507
	rdpr	%pil,	%i7
	wrpr	%l2,	0x1D0A,	%tick
	rdhpr	%hsys_tick_cmpr,	%o5
loop_1507:
	wrpr	%i2,	0x1983,	%tick
	movg	%icc,	%l4,	%g3
	rdhpr	%hintp,	%i1
	wr	%l0,	%o3,	%pic
	wr	%i6,	0x12B7,	%softint
	set	0x2C, %l4
	ldsha	[%l7 + %l4] 0x15,	%g6
	wrpr	%o1,	0x0168,	%tick
	subc	%o6,	0x05E2,	%l1
	wrpr	%l3,	%g2,	%cwp
	addc	%i3,	%g1,	%i0
	wrpr	%o0,	0x02BA,	%tick
	rd	%ccr,	%o2
	rdpr	%cleanwin,	%l5
	rd	%sys_tick_cmpr,	%g5
	ta	%icc,	0x6
	rd	%softint,	%i5
	wr	%o4,	%l6,	%softint
	wr	%g4,	0x00A7,	%softint
	movne	%xcc,	%i4,	%g7
	rdpr	%gl,	%i7
	edge16ln	%o7,	%l2,	%i2
	rdhpr	%hintp,	%o5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x012, 	%hsys_tick_cmpr
	fmovsle	%icc,	%f12,	%f16
	movg	%icc,	%l4,	%l0
	edge32l	%i6,	%g6,	%o3
	orn	%o6,	%l1,	%o1
	sub	%g2,	%l3,	%i3
	rdhpr	%hpstate,	%g1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	rdhpr	%htba,	%o2
	set	0x20, %i2
	stwa	%o0,	[%l7 + %i2] 0x04
	wrpr	%l5,	0x1BEB,	%pil
	wrpr	%g5,	%o4,	%tick
	rdpr	%cleanwin,	%i5
	rdhpr	%hsys_tick_cmpr,	%g4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%tl,	%g7
	wr	%i7,	0x01D8,	%y
	edge8ln	%l6,	%l2,	%i2
	wr	%g0,	0x10,	%asi
	lda	[%l7 + 0x7C] %asi,	%f14

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fmovsneg	%xcc,	%f31,	%f5
	wrpr	%o5,	%g3,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xA25, 	%tick_cmpr
	wrpr	%l0,	0x1D6F,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	ta	%icc,	0x5
	rdhpr	%htba,	%i1
	fbul,a	%fcc0,	loop_1508
	fmovdvc	%icc,	%f26,	%f28
	wr	%g0,	0x89,	%asi
	stwa	%o6,	[%l7 + 0x54] %asi
loop_1508:
	sdivcc	%o3,	0x10B4,	%l1
	wr 	%g0, 	0x4, 	%fprs
	movn	%xcc,	%o1,	%i3
	wr	%i0,	0x0768,	%set_softint
	srl	%g1,	%o2,	%o0
	mulscc	%g5,	%l5,	%i5
	te	%xcc,	0x1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xC99, 	%sys_tick_cmpr
	wrpr	%i4,	%g4,	%pil
	rdhpr	%hpstate,	%g7
	edge32	%l6,	%i7,	%i2
	wr	%l2,	%o5,	%y
	tpos	%icc,	0x5
	rd	%pc,	%o7
	fnot2	%f26,	%f8
	fblg,a	%fcc0,	loop_1509
	wrpr	%g3,	0x0AB2,	%tick
	wrpr	%l4,	%l0,	%cwp
	rdhpr	%hintp,	%g6
loop_1509:
	nop
	set	0x70, %g6
	ldda	[%l7 + %g6] 0x2c,	%i6
	rdpr	%canrestore,	%o6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fmovdvs	%xcc,	%f13,	%f1
	fcmpes	%fcc2,	%f11,	%f5
	rdhpr	%hpstate,	%l1
	wrpr	%i1,	0x18F7,	%cwp
	rd	%tick_cmpr,	%l3
	fbe	%fcc1,	loop_1510
	wrpr	%o1,	0x1E93,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	ldub	[%l7 + 0x3D],	%i0
loop_1510:
	wrpr	%g1,	%o0,	%pil
	wr	%g0,	0xeb,	%asi
	stwa	%o2,	[%l7 + 0x4C] %asi
	membar	#Sync
	fbl,a	%fcc0,	loop_1511
	fcmple16	%f14,	%f16,	%g5
	alignaddrl	%i5,	%o4,	%i4
	rdhpr	%hsys_tick_cmpr,	%g4
loop_1511:
	wr	%l5,	0x1F78,	%pic
	rd	%tick_cmpr,	%g7
	rd	%softint,	%i7
	wrpr	%l6,	0x0644,	%pil
	rdhpr	%hpstate,	%l2
	edge32	%i2,	%o5,	%o7
	fnands	%f24,	%f4,	%f29

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xBD0, 	%hsys_tick_cmpr
        wr    %g0,    0xe,    %pcr    ! changed.
	movcc	%xcc,	%i6,	%o6
	swap	[%l7 + 0x1C],	%o3
	rd	%fprs,	%l1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xC2E, 	%tick_cmpr
	rdpr	%otherwin,	%l3
	rd	%y,	%g2
	wrpr	%i3,	0x19CA,	%cwp
	rdpr	%pil,	%i0
	tsubcc	%g1,	0x1117,	%o1
	rdhpr	%htba,	%o2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%i5,	0x0BCE,	%pil
	rdhpr	%hsys_tick_cmpr,	%o4
	rdhpr	%hpstate,	%i4
	wr	%g0,	0x0c,	%asi
	ldsba	[%l7 + 0x29] %asi,	%o0
	rdpr	%pil,	%g4
	add	%g7,	%i7,	%l5
	rdpr	%pil,	%l6
	xorcc	%i2,	0x1D32,	%l2
	fmul8x16	%f6,	%f28,	%f24
	ldsb	[%l7 + 0x51],	%o5
	fcmped	%fcc0,	%f8,	%f28
	rdpr	%tba,	%o7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%i6,	%g3,	%ccr
	rdpr	%cwp,	%o6
	edge16ln	%o3,	%l1,	%i1
	wr	%g6,	0x1D19,	%softint
	rd	%asi,	%g2
	sra	%i3,	0x1A,	%l3
	wr	%g1,	%i0,	%ccr
	rdpr	%otherwin,	%o2
	orcc	%g5,	0x0E1E,	%i5
	ldub	[%l7 + 0x31],	%o4
	rdpr	%tba,	%o1
	rdhpr	%hpstate,	%i4
	rd	%pc,	%g4
	movg	%icc,	%g7,	%i7
	wr	%l5,	%o0,	%pic
	fnegd	%f6,	%f2
	bne	loop_1512
	wr	%i2,	0x060C,	%clear_softint
	andcc	%l6,	0x1BE5,	%o5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_1512:
	fmovdle	%xcc,	%f13,	%f14
	sdivx	%l2,	0x107A,	%i6
	wr	%g0,	0x81,	%asi
	stda	%l0,	[%l7 + 0x58] %asi
	rd	%ccr,	%g3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	movrgz	%g2,	%g6,	%l3
	set	0x35, %i6
	lduba	[%l7 + %i6] 0x15,	%g1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%g5,	0x0110,	%cwp
	fbuge,a	%fcc0,	loop_1513
	sethi	0x0D78,	%i3
	fbo	%fcc2,	loop_1514
	rd	%fprs,	%i5
loop_1513:
        wr    %g0,    0xe,    %pcr    ! changed.
	wrpr	%i4,	%g4,	%tick
loop_1514:
	rdpr	%canrestore,	%g7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xDFA, 	%hsys_tick_cmpr
	call	loop_1515
	fmovse	%icc,	%f25,	%f9
	fmovdn	%xcc,	%f18,	%f21
	tneg	%icc,	0x4
loop_1515:
	udivcc	%o0,	0x18EB,	%i2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%hsys_tick_cmpr,	%l6
	wr	%o7,	%l4,	%clear_softint
	tne	%icc,	0x5
	or	%i6,	%l0,	%l2
	wrpr	%o6,	0x1E3A,	%pil
	rdpr	%otherwin,	%g3
	rd	%softint,	%o3
	wrpr	%l1,	0x020D,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	tcc	%xcc,	0x3
	rdpr	%cwp,	%g6
	rdhpr	%hintp,	%l3
	wr	%i1,	%g1,	%y
	add	%l7,	0x38,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%i0
	casxa	[%l6] 0x81,	%i0,	%o2
	rdpr	%wstate,	%i3
	wr	%g5,	0x110A,	%softint
	wrpr	%i5,	0x0F46,	%pil
	wr	%o4,	0x0D45,	%softint

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x587, 	%hsys_tick_cmpr
	fmovda	%icc,	%f31,	%f24
	rd	%sys_tick_cmpr,	%g4
	rdpr	%gl,	%i7
	tvs	%icc,	0x1
	rd	%sys_tick_cmpr,	%o0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xD6A, 	%hsys_tick_cmpr
	movrlz	%i2,	%l5,	%l6
	movl	%xcc,	%o5,	%l4
	fmovde	%icc,	%f8,	%f12
	te	%icc,	0x7
	rdhpr	%hintp,	%o7
	udiv	%l0,	0x125D,	%l2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	rd	%pc,	%i6
	movge	%xcc,	%o3,	%l1
	bgu	loop_1516
	movrgz	%g2,	%g6,	%g3
	fxors	%f7,	%f6,	%f18
	rd	%fprs,	%i1
loop_1516:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	tcc	%xcc,	0x2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x141, 	%hsys_tick_cmpr
	rdhpr	%hpstate,	%g1
	swap	[%l7 + 0x4C],	%i3
	array16	%i5,	%g5,	%o4
	rdpr	%cansave,	%o1
	for	%f2,	%f30,	%f16
	rdpr	%tl,	%i4
	set	0x10, %o7
	ldda	[%l7 + %o7] 0xeb,	%g4
	xor	%o0,	%g7,	%i7
	rdhpr	%hsys_tick_cmpr,	%i2
	wrpr	%l6,	0x0067,	%cwp
	rdpr	%gl,	%l5
	bn,pt	%xcc,	loop_1517
	rdpr	%tba,	%o5
	rdhpr	%htba,	%l4
	fmovsvs	%xcc,	%f3,	%f21
loop_1517:
	wr	%l0,	0x034D,	%pic
	edge8l	%l2,	%o7,	%o6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%cansave,	%l1
	wrpr	%i6,	%g6,	%pil
	wrpr	%g3,	0x09B2,	%pil
	wr 	%g0, 	0x6, 	%fprs
	wr	%g2,	0x170B,	%clear_softint
	rdhpr	%hintp,	%i0
	set	0x74, %o0
	ldsha	[%l7 + %o0] 0x19,	%l3
	wr 	%g0, 	0x4, 	%fprs
	edge8l	%o2,	%i5,	%g5
	set	0x57, %g3
	ldstuba	[%l7 + %g3] 0x80,	%o4
	wrpr	%o1,	%i4,	%cwp
	flush	%l7 + 0x20
        wr    %g0,    0xe,    %pcr    ! changed.
	nop
	setx	loop_1518,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	mova	%xcc,	%o0,	%g7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xE02, 	%hsys_tick_cmpr
	wr	%l6,	0x0BDE,	%pic
loop_1518:
	rdhpr	%htba,	%i2
	wrpr	%o5,	%l4,	%cwp
	rd	%sys_tick_cmpr,	%l5
	fba	%fcc2,	loop_1519
	tl	%icc,	0x1
	wr	%l0,	%l2,	%set_softint

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xC33, 	%hsys_tick_cmpr
loop_1519:
	fmovsvs	%xcc,	%f28,	%f16
	sll	%o6,	%l1,	%i6
	wrpr	%g6,	0x0B56,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x902, 	%hsys_tick_cmpr
	rdhpr	%hintp,	%i1
	wrpr	%g2,	0x1466,	%tick
	fmovdle	%icc,	%f18,	%f11
	tneg	%xcc,	0x2
	rdhpr	%htba,	%i0
	bgu,pt	%xcc,	loop_1520
	wr	%l3,	0x016A,	%softint
	rd	%fprs,	%o3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_1520:
	rdhpr	%htba,	%g5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xF4E, 	%hsys_tick_cmpr
	fxnor	%f10,	%f8,	%f22
	tge	%icc,	0x6
	movrne	%o1,	%g4,	%o0
	fmovsleu	%icc,	%f28,	%f23
        wr    %g0,    0xe,    %pcr    ! changed.
	wrpr	%i3,	%l6,	%cwp
	rdhpr	%hintp,	%i7
	rdhpr	%htba,	%i2
	rdpr	%cleanwin,	%l4
	rdpr	%pil,	%l5
	wrpr	%o5,	0x0E11,	%cwp
	wr	%l2,	%l0,	%ccr
	fpsub32s	%f7,	%f2,	%f11

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%y,	%i6
	rdhpr	%htba,	%g6
	fpadd32	%f14,	%f4,	%f4
	wr	%g3,	%g2,	%y
	wr	%i1,	0x07C9,	%pic

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x466, 	%hsys_tick_cmpr
	sub	%o2,	%i5,	%i0
	rd	%softint,	%g5
	rdhpr	%hpstate,	%o4
	wrpr	%g1,	0x0215,	%cwp
	rd	%softint,	%o1
	wrpr	%g4,	%i4,	%cwp
	wr	%g0,	0x2c,	%asi
	ldda	[%l7 + 0x40] %asi,	%g6
	bleu,a,pn	%xcc,	loop_1521
	edge8n	%o0,	%l6,	%i3
	mulx	%i2,	%i7,	%l4
	movrlz	%l5,	0x350,	%l2
loop_1521:
	nop
	wr	%g0,	0x04,	%asi
	ldswa	[%l7 + 0x18] %asi,	%o5
	fmovsa	%icc,	%f12,	%f9
	wrpr	%l0,	0x1380,	%cwp
	subc	%o6,	%l1,	%o7
	wrpr	%i6,	0x1261,	%pil
	rdhpr	%hintp,	%g6
	rd	%y,	%g2
	sir	0x09EC

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	tl	%icc,	0x6
	wrpr	%i1,	%l3,	%pil
	fpsub16	%f28,	%f28,	%f2
	rdpr	%tl,	%o2
	set	0x4C, %g7
	swapa	[%l7 + %g7] 0x11,	%i5
	fcmple16	%f4,	%f26,	%i0
	movl	%icc,	%g5,	%o4
	rd	%sys_tick_cmpr,	%o3
	rd	%softint,	%g1
	fmovdge	%icc,	%f18,	%f27
	or	%g4,	%o1,	%i4
	rdhpr	%htba,	%g7
	rd	%y,	%l6
	fpadd16s	%f25,	%f23,	%f29
	rdhpr	%hsys_tick_cmpr,	%o0
	rdhpr	%hintp,	%i3
	orn	%i7,	0x13E5,	%i2
	rdhpr	%hintp,	%l5
	fmovsneg	%xcc,	%f25,	%f7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x26C, 	%hsys_tick_cmpr
	wr	%l0,	0x055A,	%softint
	rdpr	%cansave,	%o6
	fmovrdlez	%l1,	%f30,	%f8
	fbug	%fcc2,	loop_1522
	wr	%o5,	%i6,	%pic
!Yo - got one - imm_asi 0x21 
!And yo - immediate is 0x108
	set	0x108, %l2
	ldxa	[%g0 + %l2] 0x21,	%g6
loop_1522:
	fmovsneg	%icc,	%f22,	%f7
	wr	%g2,	%o7,	%set_softint
	fmuld8ulx16	%f19,	%f22,	%f8
	smulcc	%g3,	0x09FD,	%i1
	taddcctv	%o2,	0x1411,	%i5
	bn	%icc,	loop_1523
	movrlz	%i0,	0x2BD,	%g5
	wr	%l3,	%o3,	%clear_softint

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
loop_1523:
	rdpr	%wstate,	%o1
	rdpr	%cleanwin,	%g4
	rdpr	%tba,	%g7
	rdpr	%cwp,	%l6
	rdpr	%cleanwin,	%i4
	rdpr	%tl,	%i3
	fcmple16	%f10,	%f14,	%o0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x83D, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x5F9, 	%hsys_tick_cmpr
	wr 	%g0, 	0x7, 	%fprs
	wrpr	%l0,	0x1003,	%pil
	rdpr	%pil,	%l2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xC62, 	%tick_cmpr
	tvc	%icc,	0x0
	rdhpr	%hsys_tick_cmpr,	%o5
	add	%l7,	0x6C,	%l6
	wr	%g0,	0x04,	%asi
	lda	[%l6] %asi,	%o6
	casa	[%l6] %asi,	%o6,	%g6
	wr	%i6,	%o7,	%y
	rdhpr	%htba,	%g3
	xnorcc	%g2,	%i1,	%i5
	fmovscs	%xcc,	%f7,	%f16

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x2C1, 	%hsys_tick_cmpr
	be,pt	%icc,	loop_1524
	rdhpr	%hpstate,	%l3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	set	0x3C, %i4
	ldsha	[%l7 + %i4] 0x81,	%o2
loop_1524:
	rdhpr	%hintp,	%o1
	fmovrsgez	%g4,	%f6,	%f29
	prefetch	[%l7 + 0x3C],	 0x0
	stw	%g7,	[%l7 + 0x60]
	rd	%asi,	%o4
	movle	%xcc,	%l6,	%i3
	wrpr	%i4,	%o0,	%tick
	rdpr	%tba,	%i7
	fba,a	%fcc1,	loop_1525
	rdhpr	%hpstate,	%l5
	edge32n	%i2,	%l4,	%l2
	flush	%l7 + 0x7C
loop_1525:
	fpadd32s	%f17,	%f18,	%f14
	wrpr	%l1,	%l0,	%pil
	wr 	%g0, 	0x7, 	%fprs
	rdhpr	%htba,	%g6
	rdhpr	%htba,	%i6
	fmovda	%xcc,	%f16,	%f28
	rdpr	%otherwin,	%o7
	rdpr	%tba,	%g3
	rdpr	%wstate,	%g2
	wr	%i1,	0x014B,	%pic
	set	0x40, %l1
	sta	%f20,	[%l7 + %l1] 0x81
	fands	%f19,	%f16,	%f5
	movpos	%xcc,	%i0,	%g5
	wrpr	%l3,	%i5,	%tick
	fmovrdne	%o3,	%f24,	%f18
	wr	%o2,	%o1,	%set_softint
	subc	%g1,	%g7,	%g4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	prefetch	[%l7 + 0x10],	 0x0
	rdhpr	%hintp,	%i3
	brlez	%o0,	loop_1526
	movvc	%xcc,	%i4,	%i7
	subccc	%l5,	0x0A7B,	%l4
	rdpr	%otherwin,	%l2
loop_1526:
	or	%l1,	0x1E21,	%i2
	rdpr	%cleanwin,	%l0
	movne	%xcc,	%o6,	%g6
	bn,a,pt	%icc,	loop_1527
	rd	%softint,	%o5
	xorcc	%o7,	%g3,	%i6
	rdhpr	%hpstate,	%i1
loop_1527:
	movcc	%xcc,	%i0,	%g5
	wr	%l3,	%g2,	%sys_tick
	movvc	%xcc,	%i5,	%o3
	array32	%o2,	%o1,	%g7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x56B, 	%hsys_tick_cmpr
	rd	%fprs,	%l6
	rdhpr	%hsys_tick_cmpr,	%o4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%i4,	0x08D6,	%cwp
	fbue	%fcc3,	loop_1528
	sub	%i7,	%l5,	%g4
	tvc	%xcc,	0x2
	subccc	%l4,	%l1,	%l2
loop_1528:
	ta	%xcc,	0x6
	set	0x40, %o2
	ldda	[%l7 + %o2] 0x19,	%f0
	taddcc	%i2,	0x0809,	%o6
	fabsd	%f26,	%f12
	wr	%g6,	0x0052,	%y
	smul	%o5,	0x0B63,	%l0
	rdhpr	%hintp,	%g3
	bg,a,pn	%icc,	loop_1529
	wrpr	%i6,	%o7,	%cwp
	movgu	%icc,	%i1,	%i0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x54E, 	%sys_tick_cmpr
loop_1529:
	tvs	%xcc,	0x4
	wrpr	%g2,	%l3,	%pil
	rd	%ccr,	%i5
	rd	%y,	%o2
	rd	%pc,	%o3
	bn,a,pt	%xcc,	loop_1530
	wrpr	%o1,	%g7,	%cwp
	fornot1s	%f12,	%f8,	%f25
	siam	0x5
loop_1530:
	edge8l	%l6,	%g1,	%i3
	movg	%xcc,	%o0,	%i4
	wr 	%g0, 	0x5, 	%fprs
	bneg	loop_1531
	rdpr	%cwp,	%g4
	rdpr	%otherwin,	%l5
	stbar
loop_1531:
	sdivx	%l1,	0x0A59,	%l4
	rdpr	%gl,	%i2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xB83, 	%hsys_tick_cmpr
	wrpr	%o5,	%l2,	%pil
	wrpr	%l0,	0x0460,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x882, 	%hsys_tick_cmpr
	wrpr	%g5,	0x1713,	%cwp
	wrpr	%i0,	%l3,	%pil
	fble,a	%fcc3,	loop_1532
	wrpr	%i5,	%o2,	%pil
	brgez,a	%g2,	loop_1533
	rdhpr	%htba,	%o1
loop_1532:
	rd	%softint,	%o3
	wr	%g7,	%l6,	%set_softint
loop_1533:
	rd	%fprs,	%g1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x444, 	%sys_tick_cmpr
	rdhpr	%htba,	%i7
	ba,a,pt	%xcc,	loop_1534
	wrpr	%o4,	%g4,	%pil
	edge32	%o0,	%l5,	%l1
	fblg	%fcc3,	loop_1535
loop_1534:
	srlx	%i2,	%l4,	%o6
	rdhpr	%htba,	%g6
	wrpr	%o5,	0x0EA5,	%pil
loop_1535:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x485, 	%tick_cmpr
	wrpr	%o7,	0x1261,	%pil
	fmovsa	%xcc,	%f4,	%f27

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xF8A, 	%hsys_tick_cmpr
	edge16ln	%g5,	%g3,	%i0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xD44, 	%hsys_tick_cmpr
	wrpr	%g2,	0x1403,	%pil
	tvs	%icc,	0x6
	fbo,a	%fcc3,	loop_1536
	smul	%o2,	%o3,	%g7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xBF7, 	%hsys_tick_cmpr
	wr	%o1,	%i3,	%softint
loop_1536:
	movle	%icc,	%g1,	%i4
	fbo,a	%fcc1,	loop_1537
	brnz,a	%o4,	loop_1538
	wr 	%g0, 	0x6, 	%fprs
	ldsh	[%l7 + 0x44],	%i7
loop_1537:
	wr	%l5,	0x1526,	%set_softint
loop_1538:
	rd	%fprs,	%i2
	tleu	%icc,	0x1
	rdpr	%cansave,	%l4
	sllx	%o6,	0x0F,	%g6
	movrgz	%o5,	%l1,	%l2
	edge8ln	%o7,	%l0,	%i6
	rd	%sys_tick_cmpr,	%i1
	sdiv	%g3,	0x11C8,	%g5
	wrpr	%i0,	0x1B36,	%tick
	and	%i5,	%g2,	%l3
	udivcc	%o3,	0x18E3,	%o2
	rd	%sys_tick_cmpr,	%g7
	rd	%fprs,	%l6
	fmovsge	%xcc,	%f27,	%f12
	rd	%ccr,	%o1
	edge8l	%g1,	%i4,	%i3
	rdhpr	%hintp,	%g4
	wr	%o4,	0x1D3F,	%y
	rdhpr	%hpstate,	%o0
	fand	%f20,	%f18,	%f14

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	rdpr	%tl,	%l4
	rdpr	%pil,	%o6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x6A3, 	%hsys_tick_cmpr
	fmuld8ulx16	%f8,	%f13,	%f24
	wrpr	%g6,	0x132B,	%cwp
	rdhpr	%hpstate,	%l1
	wrpr	%o5,	0x02E4,	%pil
	srax	%l2,	0x0A,	%l0
	wr	%i6,	0x03A7,	%pic
	rdhpr	%hpstate,	%i1
	wr	%o7,	%g5,	%y

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%hpstate,	%i5
	rdpr	%canrestore,	%l3
	wrpr	%o3,	0x1B4F,	%cwp
	movpos	%icc,	%o2,	%g2
	rdpr	%tba,	%l6
	rd	%ccr,	%g7
	bvs,pn	%icc,	loop_1539
	subc	%g1,	0x14BB,	%i4
	wr	%i3,	%g4,	%pic
	rdpr	%canrestore,	%o4
loop_1539:
	wrpr	%o1,	0x0032,	%cwp
	edge32	%l5,	%i2,	%l4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xF90, 	%hsys_tick_cmpr
	membar	#Sync
	set	0x40, %g5
	ldda	[%l7 + %g5] 0xf8,	%f16
	alignaddrl	%g6,	%i7,	%o5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
        wr    %g0,    0xe,    %pcr    ! changed.
	rd	%asi,	%l2
	rd	%y,	%o7
	sra	%g5,	%g3,	%i1
	rdhpr	%htba,	%i0
	tsubcc	%i5,	%o3,	%o2
	wrpr	%l3,	%l6,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	set	0x57, %o3
	ldsba	[%l7 + %o3] 0x14,	%g1
	wrpr	%g7,	%i4,	%tick
	popc	%i3,	%o4
        wr    %g0,    0xe,    %pcr    ! changed.
	rdhpr	%hpstate,	%g4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x0C8, 	%hsys_tick_cmpr
	bl,a,pt	%xcc,	loop_1540
	nop
	setx	loop_1541,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fmovsge	%xcc,	%f12,	%f20
	rdpr	%wstate,	%l4
loop_1540:
	mulx	%o6,	%o0,	%g6
loop_1541:
	edge8	%i7,	%o5,	%l1
	rd	%y,	%i2
	taddcc	%i6,	%l0,	%o7
	wrpr	%l2,	0x0202,	%tick
	wr 	%g0, 	0x6, 	%fprs
	rdpr	%cansave,	%g3
	ldsw	[%l7 + 0x58],	%i0
	fmovdn	%icc,	%f10,	%f22
	tsubcc	%o3,	%i5,	%o2
	movrgz	%l6,	0x2F8,	%l3
	te	%xcc,	0x7
	orcc	%g1,	0x1195,	%g7
	rdhpr	%hpstate,	%i4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fmovdn	%xcc,	%f10,	%f23
	fcmpgt32	%f18,	%f24,	%o1
	rd	%pc,	%o4
	wr	%l5,	0x1DBA,	%softint
	wrpr	%g4,	0x113E,	%cwp
	wr 	%g0, 	0x7, 	%fprs
	movcc	%xcc,	%g6,	%o0
	wr	%o5,	%i7,	%ccr
	membar	0x3F

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x954, 	%hsys_tick_cmpr
	rdpr	%cansave,	%i6
	rdpr	%cwp,	%l0
	bvs,pt	%icc,	loop_1542
	fands	%f16,	%f27,	%f8
	rdpr	%otherwin,	%o7
	nop
	setx	loop_1543,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_1542:
	rdhpr	%hintp,	%l2
	andncc	%i2,	%g5,	%i1
	fmovsgu	%xcc,	%f16,	%f23
loop_1543:
	fexpand	%f1,	%f24
	rd	%tick_cmpr,	%g3
	fmovdg	%icc,	%f0,	%f25
	rdhpr	%hintp,	%o3
	rdhpr	%hsys_tick_cmpr,	%i5
	smulcc	%o2,	%l6,	%i0
	fbug	%fcc0,	loop_1544
	rd	%fprs,	%l3
	rdhpr	%hsys_tick_cmpr,	%g1
	rd	%pc,	%i4
loop_1544:
	wr	%i3,	0x07B0,	%clear_softint
	bne,a	loop_1545
	rd	%y,	%g2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	nop
	set	0x21, %i1
	stb	%g7,	[%l7 + %i1]
loop_1545:
	wrpr	%g4,	%o6,	%cwp
	wrpr	%l4,	%l5,	%cwp
	andcc	%o0,	%o5,	%g6
	set	0x19, %o1
	ldstuba	[%l7 + %o1] 0x80,	%i7
	fandnot1	%f28,	%f18,	%f26
	alignaddrl	%l1,	%i6,	%l0
	wrpr	%o7,	0x1546,	%cwp
	sdivx	%i2,	0x0298,	%l2
	edge16l	%i1,	%g5,	%g3
	rd	%tick_cmpr,	%i5
	wrpr	%o2,	%o3,	%pil
	movg	%icc,	%i0,	%l6
	bvs	%xcc,	loop_1546
	wr	%g1,	%i4,	%set_softint
	rd	%pc,	%i3
	fbul,a	%fcc3,	loop_1547
loop_1546:
	ldd	[%l7 + 0x10],	%g2
	rdpr	%tba,	%o1
	brgez	%o4,	loop_1548
loop_1547:
	rdpr	%otherwin,	%l3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%tba,	%o6
loop_1548:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	bpos,pt	%xcc,	loop_1549
	addc	%l4,	0x1E6B,	%o5
	for	%f26,	%f18,	%f26
	tge	%xcc,	0x4
loop_1549:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%tl,	%l1
	rd	%ccr,	%i6
        wr    %g0,    0xe,    %pcr    ! changed.
	rd	%y,	%l0
	tcc	%icc,	0x7
	rd	%tick_cmpr,	%i1
	wrpr	%g5,	%g3,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	tl	%xcc,	0x5
	wr	%o3,	0x10C4,	%set_softint

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x580, 	%hsys_tick_cmpr
	wrpr	%i0,	0x142C,	%tick
	rdhpr	%hintp,	%l6
	brgez,a	%i4,	loop_1550
	wrpr	%g1,	%i3,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x870, 	%hsys_tick_cmpr
	rdhpr	%hintp,	%o4
loop_1550:
	rdhpr	%hsys_tick_cmpr,	%l3
	tg	%xcc,	0x5
	wrpr	%g2,	%g7,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	brlz,a	%l5,	loop_1551
	wrpr	%o0,	%l4,	%pil
	rdhpr	%hsys_tick_cmpr,	%o5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_1551:
	array16	%g6,	%i6,	%l1
	wr	%o7,	%l0,	%set_softint
	rd	%pc,	%i2
	rdpr	%pil,	%g5
	pdist	%f24,	%f26,	%f30
	rd	%tick_cmpr,	%i1
	add	%l7,	0x64,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%l2
	casa	[%l6] 0x88,	%l2,	%i5
	fbge,a	%fcc1,	loop_1552
	wr	%o3,	0x1483,	%set_softint
	fbug,a	%fcc1,	loop_1553
	wrpr	%o2,	0x02D9,	%pil
loop_1552:
	wrpr	%i0,	%l6,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xDD6, 	%hsys_tick_cmpr
loop_1553:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	andncc	%o1,	%o4,	%i3
	rd	%asi,	%l3
	fmovrslez	%g2,	%f6,	%f14
	fpsub32s	%f13,	%f18,	%f17
	rd	%ccr,	%g7
	rd	%sys_tick_cmpr,	%g4
	fzeros	%f3
	wrpr	%l5,	0x04B2,	%pil
	ld	[%l7 + 0x3C],	%f15

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xE7A, 	%hsys_tick_cmpr
	wrpr	%o5,	0x18CD,	%tick
	rd	%ccr,	%l4
	movcs	%xcc,	%i7,	%i6
	rd	%pc,	%g6
	wr	%o7,	0x0C23,	%ccr
	rd	%pc,	%l1
	rd	%sys_tick_cmpr,	%i2
	flush	%l7 + 0x78
	taddcc	%l0,	0x173F,	%g5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x8A2, 	%tick_cmpr
	wrpr	%i1,	%o3,	%cwp
	rd	%fprs,	%i5
	rdpr	%tba,	%o2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	and	%i0,	%g3,	%i4
	rdpr	%canrestore,	%o1
	rd	%y,	%g1
	wr	%i3,	%o4,	%set_softint
	tcc	%icc,	0x7
	wr	%g2,	0x1360,	%softint
	fcmpeq16	%f22,	%f0,	%g7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%canrestore,	%l5
	rdpr	%canrestore,	%g4
	bcc,a	loop_1554
	wrpr	%o6,	%o0,	%pil
	membar	#Sync
	set	0x40, %i7
	ldda	[%l7 + %i7] 0xf1,	%f16
loop_1554:
	ldd	[%l7 + 0x58],	%f8
	taddcctv	%o5,	0x161D,	%l4
	rdhpr	%hpstate,	%i6
	fmovd	%f14,	%f10

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%hintp,	%i7
	move	%icc,	%i2,	%l0
	wrpr	%l1,	%g5,	%pil
	fnands	%f0,	%f30,	%f16
	rd	%softint,	%l2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fpackfix	%f28,	%f26

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fbge,a	%fcc0,	loop_1555
	andncc	%o2,	%l6,	%g3
	sllx	%i0,	%o1,	%i4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_1555:
	wrpr	%i3,	0x0874,	%pil
	wr	%g7,	%g2,	%pic
	tl	%icc,	0x6
	tvc	%xcc,	0x4
	wr	%l3,	%l5,	%pic
	rdpr	%canrestore,	%g4
	rdhpr	%hpstate,	%o0
	sub	%o6,	%l4,	%o5
	fpadd16s	%f15,	%f31,	%f12
	movcc	%icc,	%g6,	%i6
	fand	%f12,	%f10,	%f4
	fones	%f21
	rdhpr	%hintp,	%o7
	rdhpr	%htba,	%i2
	rdhpr	%hpstate,	%i7
	mova	%xcc,	%l0,	%l1
	rd	%sys_tick_cmpr,	%l2
	sir	0x0B5D

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	set	0x10, %o6
	lduha	[%l7 + %o6] 0x89,	%i1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xA50, 	%hsys_tick_cmpr
	sdivcc	%o2,	0x003A,	%i5
	wr	%g0,	0x04,	%asi
	lda	[%l7 + 0x64] %asi,	%f17
	subc	%g3,	0x1CD5,	%l6
	wrpr	%i0,	0x067F,	%cwp
	movn	%xcc,	%o1,	%i4
	wr	%g1,	%o4,	%ccr
	fone	%f18
	rd	%fprs,	%g7
	rdhpr	%hintp,	%g2
	set	0x65, %g4
	lduba	[%l7 + %g4] 0x04,	%l3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x003, 	%hsys_tick_cmpr
	fbu	%fcc2,	loop_1556
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wrpr	%l5,	%o0,	%pil
	ba	%icc,	loop_1557
loop_1556:
	wrpr	%g4,	0x09D7,	%pil
	rd	%fprs,	%l4
	stbar
loop_1557:
	movrlez	%o6,	%o5,	%i6
	rdpr	%pil,	%o7
	sdivx	%i2,	0x08A9,	%i7
	wrpr	%l0,	%l1,	%tick
	fpsub32	%f0,	%f12,	%f18
	wr	%g0,	0x89,	%asi
	lduba	[%l7 + 0x20] %asi,	%l2
	wrpr	%g6,	0x0292,	%tick
	tvs	%xcc,	0x5
	wrpr	%i1,	%g5,	%cwp
	wrpr	%o2,	0x09E5,	%pil
	addcc	%i5,	0x03C3,	%o3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	edge16n	%i0,	%o1,	%i4
	rdpr	%cleanwin,	%g1
	rdhpr	%htba,	%l6
	fxor	%f30,	%f30,	%f18
	rdpr	%tba,	%g7
	movge	%xcc,	%o4,	%g2
	rdpr	%gl,	%l3
	rdpr	%cansave,	%l5
	edge32n	%i3,	%o0,	%g4
	or	%o6,	%o5,	%l4
	fbule	%fcc0,	loop_1558
	udiv	%i6,	0x1E2E,	%o7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%hintp,	%l1
loop_1558:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	bvc,a	loop_1559
	fsrc1	%f4,	%f12
	fmovdl	%icc,	%f21,	%f13
	wr	%l0,	0x1ADB,	%clear_softint
loop_1559:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x85F, 	%hsys_tick_cmpr
	wrpr	%i1,	%o2,	%tick
	array8	%i5,	%o3,	%g3
	rdhpr	%hpstate,	%i0
	wr	%g5,	0x1CB8,	%sys_tick
	movrgz	%i4,	0x128,	%o1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xDC8, 	%hsys_tick_cmpr
	movpos	%icc,	%o4,	%g2
	rdpr	%pil,	%l6
	wr	%g0,	0x89,	%asi
	stha	%l5,	[%l7 + 0x76] %asi
	bvs,pt	%icc,	loop_1560
	fmovdneg	%xcc,	%f14,	%f22
	rdhpr	%htba,	%l3
	rd	%pc,	%o0
loop_1560:
	rdpr	%cleanwin,	%i3
	rd	%asi,	%g4
	set	0x2C, %l3
	swapa	[%l7 + %l3] 0x0c,	%o5
	fmovscs	%icc,	%f12,	%f5
	rdhpr	%hsys_tick_cmpr,	%l4
	fcmpes	%fcc3,	%f22,	%f23

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	sethi	0x0C55,	%o7
	te	%xcc,	0x6
	rd	%softint,	%o6
	rdhpr	%htba,	%i2
	movpos	%xcc,	%i7,	%l1
	nop
	setx loop_1561, %l0, %l1
	jmpl %l1, %l0
	rd	%pc,	%l2
	brgez,a	%g6,	loop_1562
	rdpr	%gl,	%i1
loop_1561:
	brgez,a	%o2,	loop_1563
	mulx	%i5,	%o3,	%g3
loop_1562:
	movcc	%icc,	%i0,	%g5
	fsrc2s	%f19,	%f24
loop_1563:
	siam	0x1
	rd	%pc,	%o1
	fandnot2s	%f31,	%f31,	%f15

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xCD9, 	%hsys_tick_cmpr
	move	%icc,	%g7,	%o4
	edge8n	%g2,	%g1,	%l5
	rdpr	%tl,	%l3
	edge32	%o0,	%i3,	%g4
	fblg	%fcc3,	loop_1564
	wrpr	%l6,	0x045F,	%tick
	rd	%softint,	%o5
	addcc	%l4,	%i6,	%o6
loop_1564:
	rd	%sys_tick_cmpr,	%i2
	membar	0x7C
	rdpr	%cleanwin,	%o7
	xnorcc	%l1,	0x184C,	%l0
	edge16n	%l2,	%i7,	%i1
	fandnot1	%f14,	%f26,	%f6
	add	%g6,	%o2,	%o3
        wr    %g0,    0xe,    %pcr    ! changed.
	edge8	%g3,	%i0,	%o1
	rdhpr	%hpstate,	%i4
	wrpr	%g7,	0x04BC,	%tick
	bcs,pn	%xcc,	loop_1565
	wr	%o4,	0x1263,	%y
	popc	0x0B75,	%g5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xC36, 	%hsys_tick_cmpr
loop_1565:
	andncc	%g2,	%l3,	%o0
	subccc	%i3,	0x016F,	%g4
	fbuge	%fcc1,	loop_1566
	srl	%l6,	%o5,	%i6
	udivcc	%o6,	0x1AD7,	%i2
	sdivx	%o7,	0x0814,	%l1
loop_1566:
	brgez,a	%l4,	loop_1567
	sll	%l2,	%i7,	%l0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%fprs,	%g6
loop_1567:
	array8	%o2,	%i5,	%g3
	movle	%xcc,	%o3,	%o1
	andn	%i0,	%i4,	%o4
	wrpr	%g5,	0x1FAD,	%tick
	tgu	%icc,	0x2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	movrne	%g2,	0x26A,	%l3
	rdhpr	%hpstate,	%o0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x832, 	%sys_tick_cmpr
	tpos	%icc,	0x6
	wrpr	%g4,	0x150B,	%pil
	rdhpr	%hintp,	%l6
	rdhpr	%hpstate,	%g1
	rd	%asi,	%o5
	rd	%ccr,	%i6
	wrpr	%i2,	0x19BD,	%tick
	rdpr	%pil,	%o6
	rdpr	%cwp,	%o7
	rd	%sys_tick_cmpr,	%l1
	rd	%asi,	%l4
	sethi	0x117F,	%l2
	movneg	%icc,	%i7,	%i1
	udivx	%l0,	0x02E4,	%o2
	rdhpr	%hpstate,	%i5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%htba,	%g3
	fmovrdlz	%i0,	%f4,	%f12
	bl,a,pt	%xcc,	loop_1568
	nop
	set	0x1C, %o5
	ldsw	[%l7 + %o5],	%i4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	set	0x0B, %l0
	stba	%o4,	[%l7 + %l0] 0x11
loop_1568:
	rdpr	%tl,	%g7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x3A4, 	%hsys_tick_cmpr
	fmovs	%f10,	%f2
	rdhpr	%hsys_tick_cmpr,	%l3
	fandnot2s	%f10,	%f13,	%f9

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%cleanwin,	%i3
	array8	%o0,	%g4,	%l6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xDE9, 	%hsys_tick_cmpr
	rdpr	%pil,	%i2
	fandnot2s	%f12,	%f16,	%f4
	sll	%o5,	%o6,	%o7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x5FF, 	%hsys_tick_cmpr
	rdhpr	%hpstate,	%l2
	tvc	%icc,	0x6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	andcc	%i1,	%l1,	%o2
	wrpr	%l0,	%g6,	%pil
	rd	%tick_cmpr,	%o3
	alignaddrl	%g3,	%i0,	%i4
	ldsw	[%l7 + 0x10],	%i5
	rdpr	%cansave,	%o1
	rdpr	%pil,	%o4
	tl	%xcc,	0x1
	rdhpr	%hintp,	%g5
	fnand	%f20,	%f16,	%f2
	fmovdvs	%icc,	%f25,	%f13

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fbne	%fcc3,	loop_1569
	rdhpr	%hpstate,	%l3
	fpack16	%f12,	%f18
	wrpr	%l5,	0x03C4,	%cwp
loop_1569:
	rdhpr	%hintp,	%g2
	rdhpr	%htba,	%o0
	movrlez	%g4,	0x3A7,	%l6
	brlz,a	%i3,	loop_1570
	rd	%fprs,	%i6
	wrpr	%g1,	0x1926,	%cwp
	nop
	setx	loop_1571,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_1570:
	rdpr	%gl,	%o5
	rd	%fprs,	%i2
	wr 	%g0, 	0x6, 	%fprs
loop_1571:
	rdpr	%otherwin,	%l4
	rdhpr	%hintp,	%l2
	rdhpr	%htba,	%i7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	ldsw	[%l7 + 0x3C],	%o6
	siam	0x3
	rdpr	%cansave,	%l1
	rdpr	%canrestore,	%l0
	wrpr	%o2,	0x16FC,	%cwp
	umul	%o3,	%g3,	%i0
	array16	%g6,	%i5,	%o1
	wrpr	%o4,	%i4,	%pil
	xnor	%g5,	%g7,	%l3
	rdpr	%tl,	%g2
	edge8	%l5,	%o0,	%g4
	wr	%i3,	0x14C2,	%softint
	andncc	%l6,	%g1,	%o5
	ta	%icc,	0x7
	wr	%i6,	0x1991,	%softint
	wrpr	%i2,	0x0FEA,	%tick
	orncc	%o7,	0x0105,	%l2
	movge	%icc,	%i7,	%i1
	rdpr	%gl,	%l4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x329, 	%hsys_tick_cmpr
	faligndata	%f28,	%f2,	%f10
	rdpr	%cwp,	%o6
	rdhpr	%hpstate,	%l0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	fcmpne16	%f30,	%f26,	%o3
	fbu	%fcc0,	loop_1572
	wr	%g6,	%i5,	%softint

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%pil,	%o1
loop_1572:
	array32	%o4,	%g5,	%g7
	rdpr	%cwp,	%l3
	or	%i4,	%g2,	%l5
	wrpr	%g4,	%o0,	%tick
	wr	%l6,	%i3,	%ccr
	fblg	%fcc3,	loop_1573
	wr 	%g0, 	0x4, 	%fprs
	rdpr	%wstate,	%g1
	rd	%sys_tick_cmpr,	%i6
loop_1573:
	wr	%i2,	%l2,	%y
	nop
	set	0x10, %i5
	ldd	[%l7 + %i5],	%f20
	tne	%icc,	0x4
	wr	%i7,	%o7,	%sys_tick
	wr	%l4,	0x01A4,	%y
	movge	%icc,	%i1,	%l1
	rdpr	%otherwin,	%l0
	rd	%softint,	%o6
	umulcc	%o2,	0x151C,	%o3
	lduh	[%l7 + 0x2E],	%g6
	fmovrdgz	%i5,	%f16,	%f6
	wr	%g3,	0x104B,	%softint

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	fpack32	%f12,	%f30,	%f30
	wr	%o4,	%i0,	%set_softint
	rd	%asi,	%g7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x872, 	%sys_tick_cmpr
	fble	%fcc3,	loop_1574
	rdpr	%gl,	%l3
	rdhpr	%hpstate,	%g2
	xorcc	%l5,	0x000C,	%g4
loop_1574:
	wr 	%g0, 	0x4, 	%fprs
	ldsw	[%l7 + 0x54],	%l6
	add	%i3,	%o5,	%g1
	rdpr	%canrestore,	%i4
	wrpr	%i2,	%l2,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%i7,	%o7,	%cwp
	ldub	[%l7 + 0x0A],	%l4
	tne	%icc,	0x7
	tcs	%xcc,	0x3
	bg	%xcc,	loop_1575
	rd	%fprs,	%l1
	subcc	%l0,	%o6,	%i1
	rdhpr	%hpstate,	%o3
loop_1575:
	movvc	%icc,	%g6,	%i5
	wr	%o2,	0x1849,	%ccr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x50E, 	%hsys_tick_cmpr
	rd	%ccr,	%g5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x189, 	%sys_tick_cmpr
	wrpr	%g2,	%l5,	%pil
	taddcctv	%g4,	0x065C,	%i0
	rdhpr	%hpstate,	%l6
	wrpr	%o0,	0x1850,	%cwp
	tgu	%xcc,	0x0
	wrpr	%o5,	%i3,	%tick
	wr	%i4,	%i2,	%pic
	rd	%fprs,	%l2
	movrlez	%g1,	0x27D,	%i6
	movrlz	%i7,	%l4,	%o7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xC20, 	%hsys_tick_cmpr
	fmovde	%icc,	%f3,	%f4
	andcc	%l1,	0x0CB1,	%i1
	fbg,a	%fcc3,	loop_1576
	wr	%g6,	%i5,	%pic
	udivx	%o3,	0x13E0,	%g3
	rd	%y,	%o4
loop_1576:
	nop
	set	0x10, %i3
	ldda	[%l7 + %i3] 0x0c,	%o0
	fmovdcs	%icc,	%f31,	%f24
	wrpr	%g7,	%g5,	%pil
	fmovrdne	%l3,	%f2,	%f16

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%l5,	%i0,	%sys_tick
	and	%l6,	0x0442,	%g4
	fmovda	%xcc,	%f15,	%f15
        wr    %g0,    0xe,    %pcr    ! changed.
	rd	%sys_tick_cmpr,	%i3
	umul	%i4,	%i2,	%l2
	rd	%tick_cmpr,	%g1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	bleu,a,pn	%icc,	loop_1577
	rdpr	%tba,	%i7
	sdivcc	%o5,	0x0BC0,	%o7
	wrpr	%l0,	%o6,	%pil
loop_1577:
	wrpr	%l4,	0x1100,	%cwp
	edge32l	%l1,	%g6,	%i1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x25B, 	%hsys_tick_cmpr
	fbue	%fcc2,	loop_1578
	rdpr	%otherwin,	%o3
	wrpr	%g3,	0x011E,	%cwp
	movneg	%icc,	%o1,	%g7
loop_1578:
	mova	%icc,	%o4,	%l3
	movle	%xcc,	%o2,	%g2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	rd	%softint,	%i0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x6BD, 	%hsys_tick_cmpr
	wr 	%g0, 	0x4, 	%fprs
	fandnot2	%f16,	%f28,	%f4
	andncc	%o0,	%i3,	%g4
	wrpr	%i4,	0x18B9,	%tick
	wr 	%g0, 	0x5, 	%fprs
	rdpr	%cwp,	%i6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x0B6, 	%hsys_tick_cmpr
	taddcc	%o7,	%o5,	%o6
	array32	%l4,	%l1,	%g6
	wr	%i1,	%l0,	%clear_softint
	edge16	%i5,	%o3,	%o1
	rdpr	%wstate,	%g7
	wr	%o4,	%l3,	%pic
	wrpr	%o2,	%g2,	%pil
	edge8n	%g3,	%l5,	%l6
	bleu,a	%xcc,	loop_1579
	rdhpr	%hsys_tick_cmpr,	%g5
	membar	0x1C

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
loop_1579:
	add	%i3,	0x18CF,	%g4
	edge8	%i4,	%l2,	%g1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x51B, 	%hsys_tick_cmpr
	add	%i2,	%i6,	%i7
	bn,a	%icc,	loop_1580
	tsubcctv	%o7,	0x0AAB,	%o5
	wrpr	%l4,	%l1,	%pil
	rdpr	%cansave,	%o6
loop_1580:
	rdpr	%wstate,	%g6
	bvc	%xcc,	loop_1581
	fpmerge	%f1,	%f10,	%f12
	rd	%pc,	%i1
	tvc	%xcc,	0x6
loop_1581:
	nop
	set	0x50, %g2
	ldda	[%l7 + %g2] 0x18,	%i4
	rd	%sys_tick_cmpr,	%l0
	wrpr	%o3,	%o1,	%tick
	edge16l	%g7,	%o4,	%o2
	edge16l	%g2,	%l3,	%g3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	call	loop_1582
	edge16ln	%g5,	%l6,	%i3
	rd	%y,	%g4
	be,a	loop_1583
loop_1582:
	rdhpr	%hintp,	%o0
	edge32l	%l2,	%g1,	%i0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x41E, 	%hsys_tick_cmpr
loop_1583:
	wrpr	%i6,	%i4,	%pil
	srl	%i7,	%o5,	%l4
	rd	%sys_tick_cmpr,	%l1
	fmovd	%f4,	%f14
	brlez	%o7,	loop_1584
	fbule,a	%fcc0,	loop_1585
	subcc	%g6,	%o6,	%i1
	rd	%y,	%i5
loop_1584:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xB2D, 	%hsys_tick_cmpr
loop_1585:
	bg,a	loop_1586
	sdivx	%g7,	0x0803,	%o1
	edge8	%o4,	%o2,	%g2
	wrpr	%g3,	%l3,	%cwp
loop_1586:
	srlx	%l5,	%l6,	%i3
	movn	%icc,	%g4,	%g5
	rd	%pc,	%o0
	bcc,a	%xcc,	loop_1587
	movrgez	%l2,	%i0,	%i2
	fmovs	%f12,	%f0
	wr	%g1,	%i6,	%sys_tick
loop_1587:
	rdpr	%cansave,	%i4
	rdpr	%tl,	%i7
	wr	%o5,	%l1,	%y
	ldsw	[%l7 + 0x0C],	%o7
	umulcc	%g6,	0x14ED,	%o6
	fmovsn	%xcc,	%f16,	%f4
	wr	%i1,	0x0EBE,	%sys_tick
	wrpr	%l4,	%l0,	%pil
	srlx	%o3,	%g7,	%o1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%pc,	%g2
	rdhpr	%hpstate,	%g3
	wrpr	%i5,	%l3,	%cwp
	rdpr	%cleanwin,	%l5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
        wr    %g0,    0xe,    %pcr    ! changed.
	rdpr	%otherwin,	%o0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%i2,	0x1C83,	%cwp
	tn	%icc,	0x3
	wr	%g0,	0x27,	%asi
	stba	%i6,	[%l7 + 0x6F] %asi
	membar	#Sync
	rdhpr	%hpstate,	%g1
	bcc,a	%icc,	loop_1588
	rdpr	%otherwin,	%i4
	wrpr	%i7,	0x1E5B,	%pil
	wrpr	%l1,	%o7,	%pil
loop_1588:
	wr	%o5,	0x1DF5,	%set_softint
	rdpr	%cansave,	%o6
	fcmple32	%f6,	%f16,	%g6
	wrpr	%i1,	%l0,	%pil
	srlx	%o3,	0x1C,	%l4
	tvs	%icc,	0x2
	brnz,a	%g7,	loop_1589
	smul	%o4,	0x1A16,	%o1
	ta	%icc,	0x2
	rdhpr	%hpstate,	%g2
loop_1589:
	edge16ln	%g3,	%i5,	%o2
	movgu	%xcc,	%l3,	%l5
	bshuffle	%f16,	%f16,	%f8
	bn,a	loop_1590
	addccc	%g4,	%i3,	%g5
	rdpr	%cwp,	%o0
	tleu	%icc,	0x3
loop_1590:
	rd	%tick_cmpr,	%i0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%i2,	0x084C,	%tick
	rdpr	%tl,	%i6
	wrpr	%l2,	0x1D0D,	%tick
	rd	%fprs,	%g1
	fpack16	%f2,	%f12
	wr	%i7,	%i4,	%sys_tick
	xorcc	%l1,	0x04AE,	%o7
	sra	%o6,	0x0C,	%g6
	std	%o4,	[%l7 + 0x30]
	rdhpr	%htba,	%l0
	fble,a	%fcc1,	loop_1591
	wr	%i1,	0x1881,	%sys_tick
	wrpr	%o3,	0x07CC,	%pil
        wr    %g0,    0xe,    %pcr    ! changed.
loop_1591:
	wrpr	%o1,	%g7,	%pil
	wrpr	%g2,	%g3,	%tick
	rdhpr	%hsys_tick_cmpr,	%o2
	wrpr	%i5,	0x0E65,	%tick
	fmovrdgz	%l3,	%f22,	%f16
	rdpr	%otherwin,	%l5
	wr	%i3,	0x14FE,	%sys_tick
	bcs,pt	%icc,	loop_1592
	subcc	%g5,	%o0,	%i0
	srlx	%g4,	%l6,	%i2
	fpadd16s	%f19,	%f30,	%f12
loop_1592:
	fbo	%fcc0,	loop_1593
	rdhpr	%htba,	%l2
	wrpr	%i6,	%i7,	%cwp
	edge16ln	%i4,	%g1,	%l1
loop_1593:
	sth	%o6,	[%l7 + 0x74]
	wrpr	%g6,	0x01BD,	%pil
	fble	%fcc3,	loop_1594
	fmul8x16	%f24,	%f14,	%f24

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%otherwin,	%i1
loop_1594:
        wr    %g0,    0xe,    %pcr    ! changed.
	wr	%g0,	0x89,	%asi
	lda	[%l7 + 0x68] %asi,	%f20
	umulcc	%l4,	0x1C98,	%o4
	rd	%softint,	%o1
	edge16l	%o3,	%g2,	%g3
	wrpr	%g7,	0x05EF,	%cwp
	rdpr	%cansave,	%o2
	rd	%asi,	%i5
	rdpr	%tl,	%l5
	subcc	%i3,	%g5,	%o0
	wrpr	%i0,	%g4,	%tick
	rd	%ccr,	%l3
	wrpr	%i2,	%l2,	%pil
	rdpr	%tl,	%l6
	taddcctv	%i7,	0x04B3,	%i6
	rdpr	%cwp,	%g1
	set	0x74, %l6
	ldsba	[%l7 + %l6] 0x04,	%i4
	fmovsle	%icc,	%f17,	%f17

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	andn	%o6,	0x0711,	%g6
	wrpr	%o7,	%l0,	%cwp
	wr	%o5,	0x14A5,	%softint
	movcc	%xcc,	%l4,	%i1
	add	%o1,	%o4,	%g2
	fbe	%fcc0,	loop_1595
	rdpr	%tba,	%g3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x339, 	%hsys_tick_cmpr
	rd	%y,	%o2
loop_1595:
	sll	%i5,	0x07,	%i3
	rdpr	%wstate,	%g5
	rdpr	%cansave,	%l5
	rd	%pc,	%i0
	rdhpr	%htba,	%o0
	rd	%softint,	%g4
	sdivcc	%l3,	0x0C83,	%i2
	fbge	%fcc0,	loop_1596
	alignaddr	%l6,	%i7,	%i6
	rdhpr	%htba,	%l2
	wr	%g1,	%l1,	%clear_softint
loop_1596:
	orn	%i4,	%g6,	%o6
	movrne	%l0,	0x143,	%o5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	sth	%i1,	[%l7 + 0x50]
	movgu	%xcc,	%o1,	%o4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x2CC, 	%hsys_tick_cmpr
	tvs	%icc,	0x1
	sth	%g3,	[%l7 + 0x3C]
	rd	%tick_cmpr,	%g7
	fcmpd	%fcc0,	%f22,	%f22
	tcc	%icc,	0x5
	rdhpr	%hintp,	%o2
	wrpr	%o3,	%i5,	%tick
	tcc	%icc,	0x1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x9E4, 	%hsys_tick_cmpr
	wrpr	%g5,	%i0,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x322, 	%hsys_tick_cmpr
	wrpr	%o0,	%l3,	%cwp
	call	loop_1597
	rdhpr	%hintp,	%l6
	wrpr	%i2,	%i6,	%tick
	movvc	%xcc,	%l2,	%g1
loop_1597:
	wrpr	%i7,	0x1037,	%pil
	wr	%i4,	0x116C,	%sys_tick
	wr	%l1,	0x041C,	%pic
	wrpr	%o6,	0x001A,	%tick
	rdpr	%pil,	%l0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	movcc	%xcc,	%o7,	%g6
	set	0x3F, %g1
	ldstuba	[%l7 + %g1] 0x11,	%i1
	rd	%softint,	%o4
	rd	%y,	%g2
	fbo	%fcc1,	loop_1598
	fmovsl	%icc,	%f31,	%f14

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%o1,	0x054D,	%pic
loop_1598:
	fxnors	%f16,	%f23,	%f22
	wrpr	%g7,	0x1AC6,	%pil
	fornot1s	%f8,	%f7,	%f8
	rd	%fprs,	%o2
        wr    %g0,    0xe,    %pcr    ! changed.

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xA9E, 	%sys_tick_cmpr
	rd	%softint,	%i3
	fornot1	%f8,	%f10,	%f2
	rdhpr	%hsys_tick_cmpr,	%o3
	wrpr	%l5,	%i0,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%hsys_tick_cmpr,	%l3
	rdpr	%cansave,	%l6
	movrne	%i2,	0x121,	%i6
	wr	%g5,	%l2,	%ccr
	rdpr	%canrestore,	%g1
	rdpr	%cansave,	%i7
	rdhpr	%htba,	%l1
	tleu	%xcc,	0x3
	srax	%i4,	0x05,	%l0
	rd	%softint,	%o5
	rd	%fprs,	%o7
	rd	%softint,	%g6
	rdhpr	%hpstate,	%o6
	fmovdleu	%xcc,	%f26,	%f24
	andcc	%o4,	%g2,	%i1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	andcc	%g7,	0x172A,	%i5
	rdpr	%gl,	%i3
	fmul8x16au	%f14,	%f11,	%f30
	fmovsa	%xcc,	%f21,	%f8
	rdhpr	%hsys_tick_cmpr,	%o3
	wr	%l5,	%g3,	%softint
	bn,a,pt	%icc,	loop_1599
	wr	%i0,	%o0,	%y
	rdpr	%gl,	%g4
	rd	%y,	%l3
loop_1599:
	rd	%pc,	%l6
	rdhpr	%htba,	%i2
	andcc	%g5,	%l2,	%g1
	rdpr	%cwp,	%i6
	wrpr	%i7,	%l1,	%tick
	fnegs	%f8,	%f11
	array16	%l0,	%o5,	%o7
	addccc	%i4,	0x07D5,	%g6
	fsrc1	%f8,	%f24
	fcmpgt16	%f12,	%f24,	%o4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fbe	%fcc2,	loop_1600
	udivx	%i1,	0x0632,	%l4
	rd	%softint,	%g2
	rd	%sys_tick_cmpr,	%o2
loop_1600:
	rdpr	%cwp,	%g7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x15B, 	%tick_cmpr
	smulcc	%o1,	0x161E,	%o3
	udiv	%i3,	0x1935,	%g3
	brz,a	%i0,	loop_1601
	rd	%pc,	%o0
	rdpr	%cleanwin,	%l5
	movpos	%xcc,	%g4,	%l6
loop_1601:
	mulscc	%l3,	0x046B,	%g5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%hsys_tick_cmpr,	%g1
	fba,a	%fcc1,	loop_1602
	rd	%tick_cmpr,	%i6
	rd	%ccr,	%i7
	rdpr	%otherwin,	%l2
loop_1602:
	fmovd	%f30,	%f4
	xnor	%l0,	0x06DC,	%o5
	edge32	%o7,	%l1,	%g6
	fnor	%f4,	%f30,	%f26
	rd	%asi,	%i4
	wr	%o6,	0x08D0,	%y

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xECF, 	%hsys_tick_cmpr
	rd	%tick_cmpr,	%l4
	brz,a	%g2,	loop_1603
	rdpr	%cansave,	%o2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%g0,	0x04,	%asi
	ldda	[%l7 + 0x40] %asi,	%o0
loop_1603:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x12E, 	%hsys_tick_cmpr
	wrpr	%o3,	%g3,	%tick
	rd	%asi,	%o0
	bvs	loop_1604
	popc	0x0498,	%l5
	wr	%i0,	%l6,	%ccr
	tcs	%icc,	0x0
loop_1604:
!Yo - got one - imm_asi 0x57 
!And yo - immediate is 0x0
	nop
	wr	%g0,	0x57,	%asi
	stxa	%l3,	[%g0 + 0x0] %asi
	fblg,a	%fcc2,	loop_1605
	brnz	%g5,	loop_1606
	rdpr	%tl,	%i2
	rd	%fprs,	%g4
loop_1605:
	rd	%asi,	%g1
loop_1606:
	rdpr	%cwp,	%i6
	rd	%ccr,	%i7
	rd	%asi,	%l0
	rdpr	%wstate,	%l2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x928, 	%hsys_tick_cmpr
	array16	%o5,	%l1,	%i4
	rdhpr	%hpstate,	%g6
	wrpr	%o4,	0x0B1D,	%tick
	andncc	%i1,	%o6,	%l4
	fpack16	%f20,	%f16

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xED0, 	%tick_cmpr
	rdpr	%wstate,	%i5
	movrlez	%g2,	0x3E6,	%o1
	rdhpr	%htba,	%g7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x429, 	%hsys_tick_cmpr
	fmovrsne	%i3,	%f13,	%f22
	wrpr	%o0,	0x0D22,	%tick
	sub	%g3,	0x167B,	%i0
	rd	%asi,	%l5
	sdivx	%l3,	0x1354,	%g5
	rdhpr	%hsys_tick_cmpr,	%l6
	wrpr	%i2,	0x03F8,	%cwp
	orcc	%g1,	%i6,	%i7
	rd	%pc,	%g4
	wr	%l0,	%l2,	%pic
	wr	%o7,	0x0736,	%set_softint
	rd	%ccr,	%l1
	wr	%g0,	0x10,	%asi
	lduwa	[%l7 + 0x5C] %asi,	%i4
	movpos	%xcc,	%o5,	%o4
	rd	%softint,	%i1
	rdpr	%canrestore,	%g6
	rd	%y,	%l4
	fmovdcc	%icc,	%f9,	%f25
	rdpr	%tl,	%o6
	umul	%i5,	0x0D38,	%o2
	nop
	setx	loop_1607,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	rd	%y,	%o1
	rd	%pc,	%g7
	wrpr	%o3,	%i3,	%pil
loop_1607:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xD76, 	%sys_tick_cmpr
	subccc	%g3,	%i0,	%l3
	rdhpr	%hpstate,	%l5
	rdpr	%cansave,	%l6
	rdpr	%otherwin,	%g5
	movne	%icc,	%g1,	%i6
	fmovdvs	%xcc,	%f21,	%f4
	rd	%sys_tick_cmpr,	%i7
	rd	%ccr,	%i2
	rdpr	%tba,	%l0
	wr	%g0,	0x89,	%asi
	stha	%g4,	[%l7 + 0x0C] %asi
	rdpr	%tba,	%o7
	movrlz	%l2,	0x347,	%l1
	movge	%icc,	%i4,	%o4
	fmovrsne	%i1,	%f24,	%f2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%hsys_tick_cmpr,	%o5
	rdpr	%cansave,	%l4
	wr	%i5,	0x1748,	%y
	fbl,a	%fcc1,	loop_1608
	movle	%icc,	%o6,	%o2
	lduh	[%l7 + 0x0C],	%g7
	rd	%fprs,	%o3
loop_1608:
	tle	%xcc,	0x1
	wr	%g0,	0x10,	%asi
	prefetcha	[%l7 + 0x30] %asi,	 0x3
	edge32ln	%o0,	%g2,	%i3
	mulx	%i0,	%l3,	%g3
	movgu	%xcc,	%l6,	%l5
	rd	%tick_cmpr,	%g5
	fnand	%f2,	%f28,	%f14
	rdhpr	%hpstate,	%g1
	fornot1s	%f6,	%f28,	%f29
	wrpr	%i6,	%i2,	%cwp
	fzeros	%f2
	rdpr	%canrestore,	%i7
	rd	%fprs,	%g4
	rd	%y,	%l0
	rdhpr	%hintp,	%l2
	wr	%o7,	%l1,	%sys_tick
	fornot1s	%f31,	%f21,	%f1
	fmovdl	%xcc,	%f30,	%f21
	rd	%sys_tick_cmpr,	%o4
	wr	%i1,	%g6,	%ccr
	ba,a,pn	%xcc,	loop_1609
	bgu,pt	%xcc,	loop_1610
	wr	%o5,	%l4,	%ccr
	fmovspos	%icc,	%f19,	%f8
loop_1609:
	wr 	%g0, 	0x4, 	%fprs
loop_1610:
	rdpr	%tl,	%o6
	wr	%g7,	0x0E10,	%softint
	fmovsne	%icc,	%f0,	%f8
	wr	%o3,	%o1,	%ccr
	wr	%o0,	0x0304,	%ccr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xAC4, 	%hsys_tick_cmpr
	rdpr	%tl,	%i0
	brgz	%l3,	loop_1611
	rdpr	%otherwin,	%i3
        wr    %g0,    0xe,    %pcr    ! changed.
	wr	%l5,	%g5,	%set_softint
loop_1611:
	wrpr	%g1,	%i6,	%tick
	wrpr	%g3,	%i2,	%pil
	rdpr	%tl,	%g4
	rdpr	%cleanwin,	%l0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%ccr,	%l1
	movleu	%xcc,	%o4,	%i1
	fmovsvs	%xcc,	%f26,	%f8

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%asi,	%o5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%i4,	%g7,	%pil
	wr	%o6,	%o3,	%set_softint
	edge32ln	%o0,	%o1,	%o2
	rd	%fprs,	%i0
	wrpr	%g2,	0x0FBA,	%pil
	wrpr	%i3,	0x10C4,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fba,a	%fcc0,	loop_1612
	rdhpr	%hpstate,	%l6
	wr	%l5,	0x0F32,	%pic
	wrpr	%g1,	%g5,	%cwp
loop_1612:
	tgu	%xcc,	0x6
	tsubcc	%g3,	%i2,	%g4
	rdhpr	%htba,	%l0
	fnands	%f31,	%f9,	%f28
	tn	%icc,	0x7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%hintp,	%l2
	orn	%o4,	%i1,	%g6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%o5,	0x115D,	%y
	wrpr	%l4,	0x1003,	%cwp
	tge	%xcc,	0x6
	edge32ln	%i4,	%g7,	%o6
	fmovda	%xcc,	%f6,	%f6
	sllx	%o3,	0x06,	%i5
	fnor	%f14,	%f26,	%f4
	rdpr	%tl,	%o0
	rdhpr	%hintp,	%o2
	fbue	%fcc1,	loop_1613
	rd	%ccr,	%o1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	rdpr	%pil,	%l3
loop_1613:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x990, 	%hsys_tick_cmpr
	rdpr	%wstate,	%g1
	wrpr	%g5,	0x0E30,	%tick
	rdpr	%cleanwin,	%g3
	fpadd32s	%f24,	%f16,	%f19
	andncc	%l5,	%g4,	%l0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	tgu	%icc,	0x4
	ldd	[%l7 + 0x30],	%f8
	rdhpr	%hpstate,	%i6
	rdhpr	%htba,	%l2
	wr	%i7,	0x0904,	%sys_tick
	rdhpr	%hpstate,	%i1
	orn	%g6,	0x114A,	%o4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xB78, 	%hsys_tick_cmpr
	wr	%g0,	0x89,	%asi
	stba	%o7,	[%l7 + 0x20] %asi
	movn	%xcc,	%o5,	%i4
	fmul8x16	%f31,	%f18,	%f26

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fmovrslz	%g7,	%f9,	%f23
	rdpr	%tba,	%i5
	rdhpr	%hpstate,	%o3
	wrpr	%o2,	0x1634,	%cwp
	ldd	[%l7 + 0x58],	%o0
	movg	%icc,	%o1,	%i3
	rdhpr	%hintp,	%g2
	xor	%l3,	0x0697,	%l6
	tl	%icc,	0x1
	edge16n	%g1,	%g5,	%g3
	rd	%pc,	%l5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	xnor	%g4,	%l0,	%i2
	rdhpr	%hsys_tick_cmpr,	%l2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	movcc	%icc,	%g6,	%o4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x28A, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%ccr,	%o5
	fcmpd	%fcc3,	%f16,	%f10
	edge32l	%l4,	%i4,	%g7
	bn,a,pn	%icc,	loop_1614
	edge16l	%o6,	%o3,	%o2
	rd	%tick_cmpr,	%i5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xE72, 	%hsys_tick_cmpr
loop_1614:
	ble,a	loop_1615
	fxnor	%f6,	%f22,	%f22
	wr	%o0,	0x1A9A,	%pic

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xAA7, 	%hsys_tick_cmpr
loop_1615:
	fnot2	%f6,	%f4
	rdpr	%cwp,	%l3
	udivcc	%i3,	0x1BAF,	%g1
	rdpr	%pil,	%g5
	wrpr	%g3,	%l5,	%cwp
	edge8ln	%l6,	%g4,	%i0
	rdpr	%wstate,	%i2
	fbl	%fcc0,	loop_1616
	taddcctv	%l2,	0x06B4,	%i7
	fandnot2	%f28,	%f18,	%f26
	rd	%tick_cmpr,	%i6
loop_1616:
	rdhpr	%hintp,	%l0
	rdpr	%tl,	%o4
	wrpr	%g6,	0x1B13,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x52B, 	%hsys_tick_cmpr
	tsubcc	%l1,	%o5,	%o7
	fnor	%f18,	%f8,	%f4
	movneg	%xcc,	%l4,	%i4
	fmovsne	%xcc,	%f11,	%f7
	fsrc1s	%f30,	%f24
	array8	%g7,	%o3,	%o2
	rdhpr	%hsys_tick_cmpr,	%i5
	rd	%sys_tick_cmpr,	%o1
	wrpr	%o0,	%g2,	%pil
	wrpr	%l3,	%o6,	%tick
	tcs	%icc,	0x1
	rdpr	%cansave,	%g1
	wrpr	%g5,	%g3,	%cwp
	wrpr	%i3,	%l6,	%tick
	wrpr	%l5,	%g4,	%cwp
	smulcc	%i2,	%i0,	%i7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fmovrslz	%l0,	%f12,	%f13

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xE55, 	%hsys_tick_cmpr
	fbg	%fcc2,	loop_1617
	edge8	%o4,	%l1,	%i1
	ldsw	[%l7 + 0x6C],	%o5
	tsubcc	%l4,	0x03C4,	%i4
loop_1617:
	fmovrslez	%g7,	%f16,	%f24
	wr	%o7,	0x0264,	%ccr
	rdpr	%cansave,	%o3
	wrpr	%o2,	%o1,	%pil
	brlez	%i5,	loop_1618
	rdpr	%otherwin,	%o0
	wrpr	%l3,	0x08F7,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_1618:
	rd	%ccr,	%g5
	wr	%g0,	0x19,	%asi
	sta	%f17,	[%l7 + 0x6C] %asi
	rdpr	%canrestore,	%g2
	rdhpr	%htba,	%g3
	wr	%i3,	%l5,	%softint
	wrpr	%g4,	%l6,	%pil
	rd	%y,	%i2
	wrpr	%i7,	0x16AE,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xFE9, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x08C, 	%hsys_tick_cmpr
	wrpr	%l0,	%g6,	%pil
	brnz	%i6,	loop_1619
	wrpr	%o4,	0x0789,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x967, 	%hsys_tick_cmpr
loop_1619:
	movne	%xcc,	%o5,	%i4
	wrpr	%g7,	0x1867,	%cwp
	tle	%xcc,	0x2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	ldstub	[%l7 + 0x2D],	%o1
	array8	%i5,	%o2,	%l3
	pdist	%f2,	%f16,	%f4
	fbg	%fcc0,	loop_1620
	fmovspos	%icc,	%f1,	%f8
	movvc	%xcc,	%o6,	%g1
	array16	%o0,	%g2,	%g3
loop_1620:
	rdhpr	%hsys_tick_cmpr,	%g5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	srl	%l6,	%g4,	%i2
	rdhpr	%htba,	%i0
	wrpr	%l2,	0x1BE5,	%pil
	xorcc	%l0,	0x1DF1,	%i7
	rdpr	%otherwin,	%i6
	rdhpr	%htba,	%g6
	move	%icc,	%o4,	%l1
	wr	%l4,	%o5,	%ccr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%tick_cmpr,	%i4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%tick_cmpr,	%o7
	rdpr	%cansave,	%o1
        wr    %g0,    0xe,    %pcr    ! changed.
	std	%f24,	[%l7 + 0x10]

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xBB8, 	%hsys_tick_cmpr
	wrpr	%l3,	0x0F66,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	movrgz	%o6,	%o0,	%g2
	edge16l	%g5,	%l5,	%i3
	rd	%y,	%l6
	fmovdle	%icc,	%f15,	%f16
	wr	%g4,	0x0B2C,	%y
	rd	%softint,	%g3
	set	0x2E, %l5
	ldsba	[%l7 + %l5] 0x81,	%i2
	taddcc	%i0,	%l2,	%i7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xD2B, 	%hsys_tick_cmpr
	tge	%xcc,	0x7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fmovdleu	%icc,	%f28,	%f18
	wrpr	%o4,	0x0523,	%cwp
	wrpr	%l1,	0x19B8,	%cwp
	ld	[%l7 + 0x3C],	%f10
	array8	%l0,	%l4,	%i1
	rdpr	%gl,	%o5
	addccc	%i4,	%o7,	%g7
	rd	%y,	%o1
	movrgez	%i5,	%o2,	%l3
	rdhpr	%htba,	%g1
	rdhpr	%hsys_tick_cmpr,	%o3
	srl	%o0,	0x00,	%o6
	movvc	%icc,	%g2,	%l5
	movpos	%icc,	%i3,	%g5
	edge8n	%l6,	%g4,	%g3
	tvs	%xcc,	0x7
	rdhpr	%hpstate,	%i0
	wrpr	%l2,	%i2,	%pil
	sub	%i7,	0x03E0,	%g6
	fsrc2s	%f28,	%f30
        wr    %g0,    0xe,    %pcr    ! changed.
	alignaddrl	%l1,	%l0,	%i6
	rd	%pc,	%i1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xE6C, 	%hsys_tick_cmpr
	wr 	%g0, 	0x5, 	%fprs
	smulcc	%o7,	0x17E8,	%o1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%canrestore,	%l3
	rd	%asi,	%g1
	xorcc	%o3,	%o6,	%g2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x720, 	%hsys_tick_cmpr
	rd	%pc,	%i3
	fbule,a	%fcc0,	loop_1621
	rdhpr	%htba,	%o0
	wr	%g0,	0x04,	%asi
	sta	%f25,	[%l7 + 0x28] %asi
loop_1621:
	nop
	setx	loop_1622,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	wrpr	%g5,	%l6,	%tick
	edge8n	%g3,	%g4,	%l2
	array16	%i2,	%i0,	%i7
loop_1622:
	wr	%g6,	%l1,	%clear_softint
	tcs	%xcc,	0x3
	rdpr	%otherwin,	%o4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x16B, 	%hsys_tick_cmpr
	wrpr	%l0,	%l4,	%tick
	wrpr	%i4,	%g7,	%tick
	rdpr	%gl,	%o7
	rdpr	%cleanwin,	%o1
	rdhpr	%hsys_tick_cmpr,	%o5
	sdivcc	%i5,	0x13E4,	%o2
	add	%l7,	0x28,	%l6
	wr	%g0,	0x0c,	%asi
	ldxa	[%l6] %asi,	%l3
	casxa	[%l6] 0x0c,	%l3,	%o3
	wrpr	%g1,	%o6,	%pil
	fnand	%f30,	%f24,	%f2
	wrpr	%g2,	0x0F44,	%cwp
	array32	%i3,	%l5,	%o0
	set	0x70, %i0
	ldsha	[%l7 + %i0] 0x19,	%l6
	rdpr	%cleanwin,	%g5
	wrpr	%g4,	%l2,	%tick
	rdpr	%cleanwin,	%g3
	tleu	%xcc,	0x1
	fbul,a	%fcc3,	loop_1623
	rd	%fprs,	%i0
	rdhpr	%hsys_tick_cmpr,	%i2
	rdhpr	%hsys_tick_cmpr,	%i7
loop_1623:
	rdhpr	%hsys_tick_cmpr,	%l1
	mulscc	%o4,	%g6,	%i6
	tgu	%icc,	0x7
	rdhpr	%htba,	%l0
	te	%xcc,	0x1
	lduh	[%l7 + 0x0C],	%l4
	wrpr	%i4,	%i1,	%pil
	wrpr	%g7,	0x036C,	%pil
	edge32ln	%o7,	%o1,	%i5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fbg,a	%fcc1,	loop_1624
	wrpr	%o3,	0x03A5,	%tick
	bvc	loop_1625
	rdhpr	%hsys_tick_cmpr,	%g1
loop_1624:
	edge32l	%l3,	%g2,	%o6
	rdhpr	%hsys_tick_cmpr,	%l5
loop_1625:
	rdpr	%cleanwin,	%o0
	rdpr	%gl,	%l6
	nop
	setx	loop_1626,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	rdpr	%cwp,	%g5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%l2,	%i3,	%cwp
loop_1626:
	rdpr	%pil,	%i0
	rd	%softint,	%g3
	fornot2s	%f2,	%f29,	%f7
	rdpr	%pil,	%i2
	umulcc	%i7,	0x1120,	%o4
	rdpr	%wstate,	%g6
	wr	%i6,	0x06C7,	%set_softint
	fmovrsgez	%l0,	%f16,	%f12
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsgu	%icc,	%f14,	%f9
	sir	0x0AAA
	sub	%l1,	%i4,	%l4
	wrpr	%g7,	%o7,	%tick
	wr	%i1,	%i5,	%y

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x6F8, 	%sys_tick_cmpr
	wr	%o5,	0x08BD,	%set_softint
	wr	%o3,	%o1,	%softint
	rd	%ccr,	%g1
	movrgz	%g2,	%o6,	%l5
	mulx	%o0,	%l6,	%l3
	fabsd	%f28,	%f0
	umul	%g4,	%g5,	%l2
	rdpr	%tba,	%i3
	stb	%g3,	[%l7 + 0x28]
	movleu	%icc,	%i0,	%i2
	wr	%g0,	0x11,	%asi
	ldswa	[%l7 + 0x74] %asi,	%i7
	edge8n	%o4,	%g6,	%l0
	rdhpr	%hintp,	%i6
	bcs	%icc,	loop_1627
	wrpr	%i4,	0x1DB8,	%cwp
	wrpr	%l1,	0x16ED,	%tick
	addccc	%g7,	%o7,	%l4
loop_1627:
	nop
	add	%l7,	0x14,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%i1
	casa	[%l6] 0x89,	%i1,	%i5
	wrpr	%o2,	%o3,	%cwp
	rdpr	%cleanwin,	%o5
	edge32	%o1,	%g1,	%g2
	fnot1s	%f22,	%f27

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x72B, 	%hsys_tick_cmpr
	rdpr	%wstate,	%l3
	movn	%xcc,	%g4,	%g5
	fbue	%fcc1,	loop_1628
	udivx	%l2,	0x0C63,	%o6
	fnands	%f27,	%f4,	%f25
	wr	%g0,	0x81,	%asi
	stha	%i3,	[%l7 + 0x0E] %asi
loop_1628:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xB85, 	%hsys_tick_cmpr
	wr	%i0,	0x01D0,	%sys_tick
	add	%i7,	0x1724,	%o4
	rdpr	%wstate,	%g6
	wr	%l0,	%i2,	%sys_tick
	wrpr	%i4,	0x1F6E,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x944, 	%tick_cmpr
	orcc	%l1,	%o7,	%l4
	ldstub	[%l7 + 0x44],	%i1
	tvc	%xcc,	0x6
	rd	%pc,	%i5
	wrpr	%g7,	%o2,	%pil
	fba	%fcc0,	loop_1629
	rdhpr	%hintp,	%o5
	xor	%o1,	0x00FD,	%o3
	sdivcc	%g1,	0x0DF9,	%l5
loop_1629:
	wr	%o0,	%g2,	%clear_softint
	rd	%sys_tick_cmpr,	%l3
	movpos	%xcc,	%l6,	%g5
	rdhpr	%hsys_tick_cmpr,	%l2
	wr	%g4,	%o6,	%y
	rd	%softint,	%i3
	alignaddrl	%g3,	%i7,	%i0
	fmovrde	%g6,	%f22,	%f26

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xE9D, 	%hsys_tick_cmpr
	wrpr	%l0,	%i6,	%pil
	rdhpr	%hsys_tick_cmpr,	%i4
	wrpr	%l1,	0x0A8A,	%pil
	rdpr	%tl,	%l4
	rdpr	%tba,	%i1
	tne	%icc,	0x4
        wr    %g0,    0xe,    %pcr    ! changed.

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x2D0, 	%sys_tick_cmpr
	fbe	%fcc3,	loop_1630
	rdhpr	%hsys_tick_cmpr,	%g7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x62D, 	%hsys_tick_cmpr
	rd	%asi,	%o5
loop_1630:
	wrpr	%o1,	0x1832,	%tick
	rdpr	%cwp,	%g1
	rd	%y,	%l5
	rdpr	%tba,	%o3
	rd	%fprs,	%g2
	tneg	%icc,	0x4
	ldstub	[%l7 + 0x44],	%o0
	fmovdneg	%icc,	%f28,	%f20
	wrpr	%l3,	%g5,	%pil
	fzero	%f30

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x8AA, 	%hsys_tick_cmpr
	fmovsle	%xcc,	%f7,	%f24
	bg,pt	%icc,	loop_1631
	wr	%g4,	0x0FC4,	%pic
	movle	%xcc,	%l6,	%i3
	wr	%g3,	%i7,	%clear_softint
loop_1631:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xFAA, 	%tick_cmpr
	wr 	%g0, 	0x7, 	%fprs

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xB3F, 	%hsys_tick_cmpr
	movvs	%icc,	%g6,	%l0
	wrpr	%i6,	0x0BCF,	%cwp
	wrpr	%l1,	0x139F,	%pil
	fblg,a	%fcc2,	loop_1632
	fbul,a	%fcc1,	loop_1633
	edge8ln	%l4,	%i4,	%i1
	set	0x67, %o4
	ldsba	[%l7 + %o4] 0x80,	%o7
loop_1632:
	rd	%tick_cmpr,	%i5
loop_1633:
	movrne	%g7,	%o2,	%o1
	taddcc	%o5,	%l5,	%o3
	fmuld8ulx16	%f0,	%f9,	%f18
	wrpr	%g2,	0x16E8,	%tick
	rd	%tick_cmpr,	%g1
	rd	%ccr,	%o0
	wr	%g5,	%l3,	%clear_softint
	wrpr	%g4,	0x157B,	%cwp
	fbu	%fcc3,	loop_1634
	fandnot2	%f6,	%f24,	%f10
	fmovrdgz	%l6,	%f28,	%f2
	wr	%i3,	%g3,	%clear_softint
loop_1634:
	rdhpr	%hintp,	%l2
	fmul8x16au	%f21,	%f12,	%f28

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x5C0, 	%hsys_tick_cmpr
	orcc	%o6,	%o4,	%g6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x718, 	%hsys_tick_cmpr
	rdhpr	%hintp,	%i6
	fandnot1	%f2,	%f14,	%f12
	brlez,a	%i2,	loop_1635
	fba	%fcc3,	loop_1636
	rd	%softint,	%l4
	sdivcc	%i4,	0x19B6,	%i1
loop_1635:
	wrpr	%o7,	%l1,	%pil
loop_1636:
	wrpr	%i5,	0x08C0,	%cwp
	rd	%sys_tick_cmpr,	%g7
	sdiv	%o2,	0x1285,	%o5
	fmul8x16	%f24,	%f14,	%f22
	fnor	%f16,	%f10,	%f26
	wr 	%g0, 	0x4, 	%fprs
	subccc	%g2,	%o1,	%o0
	srax	%g5,	0x03,	%l3
	fbo,a	%fcc0,	loop_1637
        wr    %g0,    0xe,    %pcr    ! changed.

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%hsys_tick_cmpr,	%i3
loop_1637:
	rdpr	%wstate,	%g1
	rdhpr	%htba,	%g3
	wr	%l2,	0x15DB,	%clear_softint
	fcmple16	%f22,	%f16,	%i0
	wr 	%g0, 	0x5, 	%fprs
	mulscc	%o4,	%i7,	%g6
	and	%i6,	0x0DEA,	%i2
	wr	%l0,	0x192A,	%sys_tick
	wr	%l4,	0x03A9,	%set_softint
	rd	%sys_tick_cmpr,	%i4
	rd	%softint,	%i1
	addc	%o7,	%i5,	%g7
	rd	%pc,	%l1
	rd	%softint,	%o2
	fbne,a	%fcc0,	loop_1638
	rd	%pc,	%l5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x484, 	%hsys_tick_cmpr
	membar	0x28
loop_1638:
	rdhpr	%hintp,	%o3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fmovsvs	%icc,	%f25,	%f17
	wr	%g0,	0x04,	%asi
	ldsba	[%l7 + 0x69] %asi,	%o0
	rdhpr	%hsys_tick_cmpr,	%g2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	wr	%l3,	%i3,	%y
	rdpr	%otherwin,	%g1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%hpstate,	%l2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%g3,	0x05E0,	%tick
	wr	%i7,	%o4,	%set_softint
	bne,a	loop_1639
	wrpr	%g6,	%i2,	%tick
	andncc	%l0,	%i6,	%l4
	rdhpr	%hpstate,	%i1
loop_1639:
	rdhpr	%hintp,	%o7
	wr	%i4,	0x0493,	%ccr
	array16	%g7,	%l1,	%i5
	wrpr	%l5,	%o2,	%cwp
	tge	%icc,	0x1
	srl	%o5,	%o1,	%o0
	wr	%o3,	%g2,	%set_softint
	fmovdgu	%xcc,	%f18,	%f8
	rdpr	%otherwin,	%g5
	rd	%ccr,	%l3
	wrpr	%i3,	%g4,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%htba,	%g1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%g3,	0x191C,	%pil
	rd	%y,	%i7
	rdhpr	%hintp,	%g6
	bge,a,pt	%xcc,	loop_1640
	fmovda	%icc,	%f26,	%f14
	wrpr	%i2,	0x1AD5,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xC33, 	%hsys_tick_cmpr
loop_1640:
	rdpr	%cansave,	%o4
	orcc	%l4,	%i1,	%o7
        wr    %g0,    0xe,    %pcr    ! changed.
	wr	%g0,	0x81,	%asi
	ldxa	[%l7 + 0x10] %asi,	%l1
	rd	%fprs,	%i5
	rdhpr	%htba,	%g7
	rd	%asi,	%l5
	fmovrsgz	%o5,	%f18,	%f16
	rd	%y,	%o2
	wrpr	%o0,	%o3,	%tick
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	membar	0x73
	fmovdcc	%xcc,	%f16,	%f31
	srax	%o1,	0x08,	%g5
	array16	%g2,	%l3,	%g4
	rdpr	%tba,	%i3
	bg	loop_1641
	rdhpr	%htba,	%l2
	rd	%tick_cmpr,	%l6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x9B5, 	%hsys_tick_cmpr
loop_1641:
	bpos,pn	%icc,	loop_1642
	wrpr	%o6,	%i7,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%pc,	%g6
loop_1642:
	wr	%i2,	0x1863,	%clear_softint
	fabss	%f13,	%f25
	ld	[%l7 + 0x60],	%f24
	tneg	%icc,	0x4
	array32	%o4,	%l0,	%i1
	rdpr	%wstate,	%l4
	xnor	%o7,	0x1AFD,	%i6
	fnors	%f21,	%f29,	%f10
	wr	%i4,	%i5,	%softint
	set	0x60, %i2
	stda	%g6,	[%l7 + %i2] 0x18
	srl	%l5,	%o5,	%o2
	wr	%l1,	0x033A,	%y
	rdhpr	%htba,	%o3
	fmovdg	%xcc,	%f15,	%f14
	ldd	[%l7 + 0x08],	%o0
	fmovdne	%xcc,	%f31,	%f16

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x022, 	%hsys_tick_cmpr
	subcc	%o0,	0x10EC,	%l3
	wr	%g4,	0x0F49,	%pic
	fmovrdne	%i3,	%f16,	%f12
	popc	%l2,	%l6
	movrlez	%g2,	0x0F3,	%g1
	rd	%pc,	%o6
	rdpr	%cleanwin,	%i7
	rdpr	%cansave,	%g3
	wr	%g0,	0x81,	%asi
	ldsba	[%l7 + 0x3A] %asi,	%i0
	set	0x4E, %g6
	ldsha	[%l7 + %g6] 0x10,	%i2
	brz	%g6,	loop_1643
	wr	%o4,	%i1,	%pic

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	sll	%i6,	%o7,	%i4
loop_1643:
	rd	%softint,	%g7
	brlez,a	%l5,	loop_1644
	wr	%o5,	%i5,	%set_softint
	fornot1	%f4,	%f30,	%f26

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x2C3, 	%sys_tick_cmpr
loop_1644:
	orncc	%o1,	0x086C,	%o3
	rd	%pc,	%g5
	rd	%y,	%o0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	add	%l2,	0x11AA,	%g4
	wrpr	%l6,	%g1,	%tick
	rdpr	%gl,	%g2
	movg	%xcc,	%i7,	%g3
	rdpr	%pil,	%o6
	wrpr	%i0,	%i2,	%tick
	fba	%fcc0,	loop_1645
	rdhpr	%hpstate,	%o4
	rdhpr	%htba,	%i1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_1645:
	sub	%i6,	%g6,	%o7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x1D5, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%ccr,	%o5
	wrpr	%g7,	0x0229,	%cwp
	fbe	%fcc2,	loop_1646
	udivx	%o2,	0x1B34,	%l1
	wrpr	%i5,	0x0876,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_1646:
	wr	%g5,	0x17F1,	%sys_tick
	wrpr	%o1,	0x175F,	%cwp
	fxor	%f22,	%f18,	%f0
	rdhpr	%hpstate,	%o0
	movleu	%icc,	%l3,	%l2
	fmovdpos	%xcc,	%f13,	%f16
	fbe	%fcc3,	loop_1647
	rdpr	%canrestore,	%g4
	rd	%y,	%i3
	wrpr	%g1,	0x06FE,	%tick
loop_1647:
	ldd	[%l7 + 0x60],	%f4
	rdpr	%tl,	%l6
	wr	%g2,	%g3,	%pic
	wr 	%g0, 	0x6, 	%fprs
        wr    %g0,    0xe,    %pcr    ! changed.
	edge8	%i0,	%i1,	%o4
	rdhpr	%hsys_tick_cmpr,	%l0
	rdpr	%cansave,	%l4
	wrpr	%g6,	0x1C61,	%cwp
	rdhpr	%hintp,	%i6
	rd	%asi,	%o7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x67B, 	%hsys_tick_cmpr
	wrpr	%i4,	%o5,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	movleu	%icc,	%i5,	%o3
	rd	%ccr,	%o2
	fmovsl	%icc,	%f11,	%f6
	taddcctv	%g5,	0x0155,	%o1
	wrpr	%l3,	%o0,	%cwp
	fnor	%f8,	%f14,	%f28
	fba,a	%fcc3,	loop_1648
	lduh	[%l7 + 0x50],	%l2
	edge16l	%g4,	%g1,	%l6
	wr	%i3,	0x0B43,	%set_softint
loop_1648:
	wrpr	%g2,	0x14B4,	%cwp
	sub	%o6,	%i7,	%i2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x24E, 	%hsys_tick_cmpr
	lduh	[%l7 + 0x18],	%g3
	bg	loop_1649
	fmovrslz	%o4,	%f27,	%f17
	edge16l	%i1,	%l0,	%l4
	wr	%i6,	%g6,	%y
loop_1649:
	wrpr	%o7,	%l5,	%cwp
	wr 	%g0, 	0x4, 	%fprs
	rdpr	%wstate,	%l1
	te	%xcc,	0x4
	edge32	%i5,	%o3,	%o2
	ldsb	[%l7 + 0x36],	%g5
	rdpr	%pil,	%o1
	rd	%softint,	%g7
	add	%o0,	%l3,	%g4
	rdpr	%gl,	%g1
        wr    %g0,    0xe,    %pcr    ! changed.
	wr	%g0,	0x80,	%asi
	swapa	[%l7 + 0x38] %asi,	%i3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xB1C, 	%hsys_tick_cmpr
	rd	%y,	%g2
	bpos,a	loop_1650
	wr	%i7,	0x0511,	%ccr
	edge8	%i2,	%g3,	%o4
	rdpr	%tba,	%i1
loop_1650:
	wr	%l0,	%l4,	%sys_tick
	subccc	%i6,	0x0213,	%i0
	rd	%softint,	%o7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	fmovdneg	%xcc,	%f15,	%f31
	rd	%y,	%i4
	fzeros	%f2
	wrpr	%o5,	%i5,	%cwp
	wrpr	%l1,	%o2,	%tick
	ldd	[%l7 + 0x68],	%g4
	rdhpr	%hpstate,	%o3
	xnor	%o1,	%o0,	%l3
	wrpr	%g7,	%g4,	%pil
	wrpr	%l2,	%l6,	%tick
	set	0x62, %i6
	lduba	[%l7 + %i6] 0x15,	%g1
	wr	%o6,	0x1A36,	%set_softint

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x39B, 	%hsys_tick_cmpr
	sdiv	%i2,	0x139C,	%i7
	rd	%asi,	%g3
	umulcc	%i1,	%o4,	%l4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x6C3, 	%hsys_tick_cmpr
	edge16ln	%i0,	%l0,	%g6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%tick_cmpr,	%o5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x664, 	%hsys_tick_cmpr
	rd	%tick_cmpr,	%l1
	rdpr	%otherwin,	%o2
	tcc	%icc,	0x1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x43B, 	%tick_cmpr
	rdhpr	%hsys_tick_cmpr,	%i5
	rdhpr	%hintp,	%o3
	wrpr	%o0,	0x028D,	%cwp
	wr	%o1,	%g7,	%clear_softint
	rdpr	%tba,	%l3
	ldsb	[%l7 + 0x33],	%l2
	rdhpr	%hsys_tick_cmpr,	%g4
	std	%f2,	[%l7 + 0x08]

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xD9B, 	%hsys_tick_cmpr
	rdpr	%cwp,	%o6
	rdpr	%wstate,	%i3
	wr	%g2,	0x0D02,	%set_softint
	wr	%i7,	%g3,	%softint
	sub	%i2,	%o4,	%l4
	ldstub	[%l7 + 0x4F],	%i6
	rdhpr	%hintp,	%i1
	fcmpd	%fcc1,	%f6,	%f0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	rdhpr	%htba,	%l0
	rdpr	%pil,	%o7
	add	%l5,	0x0FD9,	%o5
        wr    %g0,    0xe,    %pcr    ! changed.
	rdpr	%canrestore,	%l1
	edge16ln	%g5,	%i5,	%o0
	wrpr	%o1,	%o3,	%pil
	mulx	%g7,	%l2,	%l3
	wrpr	%g1,	0x094A,	%tick
	edge32	%g4,	%l6,	%i3
	rdpr	%cwp,	%g2
	subc	%o6,	0x1D71,	%i7
	wrpr	%g3,	0x1EA8,	%tick
	addcc	%o4,	%l4,	%i2
	fnot1s	%f15,	%f23
	movrne	%i1,	%i6,	%g6
	rdpr	%tl,	%i0
	rd	%sys_tick_cmpr,	%o7
	wr	%l0,	0x176E,	%sys_tick
	rd	%ccr,	%o5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%tick_cmpr,	%o2
	rdhpr	%hpstate,	%l1
	fands	%f7,	%f23,	%f25
	fones	%f7
	rd	%pc,	%i4
	wrpr	%i5,	%o0,	%pil
	and	%g5,	0x061B,	%o3
	wrpr	%g7,	0x1AE7,	%cwp
	rdhpr	%htba,	%o1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%hintp,	%g4
	fmovrsne	%l6,	%f9,	%f19

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xCEF, 	%hsys_tick_cmpr
	tpos	%icc,	0x5
	tsubcctv	%l3,	%g2,	%o6
	rdpr	%cleanwin,	%i7
	rdhpr	%htba,	%g3
	popc	%o4,	%l4
	ba,pt	%icc,	loop_1651
	rd	%ccr,	%i1
	andncc	%i6,	%g6,	%i0
	std	%i2,	[%l7 + 0x40]
loop_1651:
	fnegs	%f3,	%f22
	rdhpr	%hintp,	%o7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fsrc1	%f8,	%f8
	umulcc	%o5,	0x1B2D,	%o2
	tvc	%xcc,	0x2
	fabsd	%f30,	%f2
	array16	%i4,	%l1,	%o0
	rd	%tick_cmpr,	%g5
	rd	%tick_cmpr,	%i5
	lduw	[%l7 + 0x44],	%g7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%tl,	%o3
	addcc	%g1,	%g4,	%l2
	rd	%sys_tick_cmpr,	%l6
	rdpr	%canrestore,	%i3
	fmul8sux16	%f4,	%f26,	%f16
	set	0x36, %l4
	lduha	[%l7 + %l4] 0x11,	%l3
	fba	%fcc3,	loop_1652
	rdhpr	%hpstate,	%g2
	alignaddrl	%i7,	%g3,	%o4
	rdhpr	%hintp,	%o6
loop_1652:
	edge8n	%i1,	%i6,	%l4
	wr	%g6,	0x1C8E,	%y
	wr	%i0,	0x03CB,	%clear_softint
	wr	%i2,	0x0A66,	%ccr
	wrpr	%l0,	0x18CA,	%tick
	rdhpr	%hpstate,	%l5
	srl	%o5,	0x06,	%o7
	wrpr	%i4,	%l1,	%pil
	alignaddr	%o0,	%o2,	%i5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xE7A, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%o3,	%l2,	%set_softint
	brgez,a	%l6,	loop_1653
	move	%icc,	%i3,	%l3
	rdpr	%pil,	%g4
	rd	%y,	%g2
loop_1653:
	rdpr	%cleanwin,	%i7
	smul	%o4,	0x1E38,	%g3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x6E0, 	%tick_cmpr
	pdist	%f8,	%f6,	%f26
	edge32	%l4,	%i6,	%i0
        wr    %g0,    0xe,    %pcr    ! changed.
	rd	%tick_cmpr,	%l5
	wr 	%g0, 	0x5, 	%fprs
        wr    %g0,    0xe,    %pcr    ! changed.
	rdpr	%tl,	%i4
	rd	%tick_cmpr,	%o7
	andn	%l1,	%o0,	%o2
	lduh	[%l7 + 0x5C],	%g5
	fmovsneg	%icc,	%f20,	%f2
	edge16ln	%o1,	%i5,	%g7
	rdhpr	%hpstate,	%o3
	wr	%g1,	%l2,	%y
	movrgz	%l6,	0x334,	%i3
	wrpr	%l3,	0x1A45,	%pil
	smul	%g2,	0x0F60,	%g4
	wr	%i7,	0x04B7,	%pic
	rdpr	%otherwin,	%g3
	for	%f4,	%f24,	%f22
	wrpr	%o6,	0x1FB2,	%tick
	wrpr	%o4,	%l4,	%tick
	rd	%tick_cmpr,	%i6
	wr 	%g0, 	0x6, 	%fprs
	rd	%tick_cmpr,	%i1
	movcc	%icc,	%l0,	%l5
	wrpr	%i2,	%o5,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x86B, 	%hsys_tick_cmpr
	array32	%g6,	%o7,	%o0
	tsubcctv	%l1,	%g5,	%o1
	rdhpr	%hpstate,	%o2
	tn	%xcc,	0x5
	rdhpr	%hintp,	%i5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	sdivx	%g1,	0x0A5A,	%l2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x93C, 	%hsys_tick_cmpr
	fmovsne	%icc,	%f24,	%f25
	rdpr	%wstate,	%l6
	wrpr	%i3,	0x15D9,	%cwp
	fbul	%fcc1,	loop_1654
	rdhpr	%htba,	%g2
	wrpr	%l3,	%i7,	%tick
	rdhpr	%htba,	%g4
loop_1654:
	movge	%xcc,	%o6,	%o4
	rdpr	%wstate,	%g3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fmovdpos	%icc,	%f9,	%f1
	movne	%icc,	%i6,	%i0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xBB0, 	%hsys_tick_cmpr
	rdpr	%otherwin,	%l5
	rdhpr	%hsys_tick_cmpr,	%i2
	fnand	%f14,	%f24,	%f16
	fsrc2s	%f2,	%f12
	brlz	%i1,	loop_1655
	rd	%sys_tick_cmpr,	%o5
	nop
	setx	loop_1656,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	smul	%g6,	0x17D1,	%o7
loop_1655:
        wr    %g0,    0xe,    %pcr    ! changed.
	rdhpr	%hpstate,	%l1
loop_1656:
	fbg	%fcc2,	loop_1657
	stx	%g5,	[%l7 + 0x08]
	edge8l	%o1,	%o2,	%i5
	wrpr	%o3,	0x12C1,	%cwp
loop_1657:
	rdpr	%canrestore,	%i4
	rd	%pc,	%l2
	rdpr	%otherwin,	%g7
	wr	%g1,	%i3,	%softint
	tvc	%xcc,	0x6
	rdhpr	%hintp,	%g2
	rd	%softint,	%l6
	movleu	%xcc,	%i7,	%l3
	alignaddr	%g4,	%o6,	%o4
	fbuge	%fcc1,	loop_1658
	wr 	%g0, 	0x4, 	%fprs
	fcmps	%fcc0,	%f17,	%f15
	fbule,a	%fcc1,	loop_1659
loop_1658:
	rd	%tick_cmpr,	%i6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	rdpr	%cleanwin,	%l5
loop_1659:
	rdpr	%cwp,	%i0
	rdpr	%cwp,	%i1
	edge32	%i2,	%o5,	%o7
	wrpr	%g6,	%l1,	%cwp
	fpadd16	%f14,	%f12,	%f16
	rdpr	%cwp,	%o0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xBDA, 	%hsys_tick_cmpr
	movcc	%xcc,	%i5,	%o3
	tge	%icc,	0x0
	movrgz	%i4,	0x3DA,	%l2
	rdhpr	%htba,	%o2
	fmovspos	%xcc,	%f14,	%f22
	call	loop_1660
	rdhpr	%hintp,	%g1
	addccc	%i3,	%g2,	%l6
	fmovdgu	%icc,	%f11,	%f2
loop_1660:
	rdpr	%cansave,	%i7
	rdpr	%cleanwin,	%l3
	rdhpr	%hsys_tick_cmpr,	%g7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	xnor	%o4,	0x1871,	%l4
	wrpr	%g3,	0x0D1A,	%pil
	rdpr	%tl,	%l0
	rd	%tick_cmpr,	%i6
	fpadd32s	%f13,	%f23,	%f7
	rdhpr	%hsys_tick_cmpr,	%i0
	udivx	%i1,	0x00C7,	%l5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xA5E, 	%hsys_tick_cmpr
	rdpr	%otherwin,	%o7
	movrlz	%g6,	%l1,	%o5
	movrgz	%g5,	%o1,	%i5
	movrgz	%o3,	%i4,	%l2
	edge8l	%o0,	%g1,	%i3
	ldsh	[%l7 + 0x62],	%g2
	rdpr	%otherwin,	%o2
	movpos	%icc,	%l6,	%l3
	rd	%ccr,	%i7
	rd	%tick_cmpr,	%g7
	fmovdcc	%xcc,	%f11,	%f22
	rd	%softint,	%g4
	movrlez	%o4,	%l4,	%g3
	andncc	%l0,	%i6,	%i0
	sdivx	%o6,	0x015B,	%l5
	rd	%sys_tick_cmpr,	%i1
	rdpr	%cleanwin,	%o7
	rd	%asi,	%g6
	movcs	%icc,	%l1,	%o5
	fbl,a	%fcc2,	loop_1661
	taddcctv	%g5,	0x1435,	%i2
	wr	%o1,	0x1FBF,	%set_softint
	sllx	%o3,	%i4,	%i5
loop_1661:
	swap	[%l7 + 0x78],	%o0
	wr	%g1,	0x03F5,	%set_softint
	fmovdne	%icc,	%f29,	%f8
	wr	%g0,	0x80,	%asi
	lduwa	[%l7 + 0x30] %asi,	%l2
	tg	%icc,	0x3
	rdpr	%cwp,	%i3
	rdhpr	%hintp,	%o2
	bne,a,pt	%xcc,	loop_1662
	wr	%l6,	%l3,	%pic

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x8FE, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x3CF, 	%hsys_tick_cmpr
loop_1662:
	wrpr	%o4,	%l4,	%tick
	fmuld8ulx16	%f3,	%f6,	%f20
	rdpr	%wstate,	%g7
	wr 	%g0, 	0x6, 	%fprs

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%o6,	%i6,	%set_softint
	rd	%asi,	%i1
	wrpr	%l5,	%g6,	%pil
	bleu,a	%icc,	loop_1663
	wrpr	%l1,	0x0861,	%tick
	rdpr	%gl,	%o5
	fmovdle	%xcc,	%f5,	%f31
loop_1663:
	wr	%o7,	0x19CF,	%softint
	movgu	%xcc,	%g5,	%o1
	bneg,pt	%icc,	loop_1664
	sth	%i2,	[%l7 + 0x48]
	wr	%o3,	%i4,	%clear_softint

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
loop_1664:
	wrpr	%o0,	%l2,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x95D, 	%hsys_tick_cmpr
	rdhpr	%hintp,	%o2
	bpos,a	loop_1665
	bleu,a,pn	%xcc,	loop_1666
	rdpr	%cleanwin,	%l6
	rdhpr	%htba,	%g1
loop_1665:
	srlx	%i7,	0x13,	%l3
loop_1666:
	subcc	%g4,	0x18A6,	%g2
	tle	%icc,	0x6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xB0A, 	%hsys_tick_cmpr
	rdhpr	%hsys_tick_cmpr,	%l0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	movvs	%xcc,	%i6,	%i1
	rdhpr	%htba,	%l5
	rdhpr	%hintp,	%g6
	tne	%icc,	0x6
	wrpr	%l1,	0x026B,	%tick
	mulx	%g3,	%o7,	%o5
	edge16l	%g5,	%o1,	%o3
	wrpr	%i4,	0x1460,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%o0,	0x0280,	%pil
	wrpr	%i3,	0x0A92,	%tick
	fornot2s	%f6,	%f11,	%f24
	wrpr	%o2,	%l6,	%cwp
	wrpr	%l2,	0x06BD,	%cwp
	rdhpr	%hintp,	%g1
	rdpr	%canrestore,	%i7
	sethi	0x04A7,	%g4
	ba,a,pn	%xcc,	loop_1667
	fcmps	%fcc0,	%f16,	%f21
	rdpr	%gl,	%l3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_1667:
	tneg	%xcc,	0x7
	rd	%y,	%l4
	subc	%g2,	0x1A12,	%l0
	rd	%tick_cmpr,	%i0
	addc	%o6,	0x1A15,	%i6
	rdhpr	%hsys_tick_cmpr,	%g7
	sdivcc	%l5,	0x12E4,	%i1
	movvs	%icc,	%g6,	%g3
	tg	%xcc,	0x2
	fpsub32	%f0,	%f14,	%f12

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x2BC, 	%hsys_tick_cmpr
	movleu	%icc,	%o5,	%g5
	rd	%fprs,	%l1
	edge16ln	%o3,	%i4,	%i5
	xor	%i2,	0x04B9,	%o0
	fcmpeq16	%f26,	%f16,	%o1
	rdpr	%cwp,	%i3
	tvc	%icc,	0x7
	fmovsvs	%icc,	%f21,	%f14
	wr	%o2,	0x1A27,	%set_softint
	addcc	%l2,	0x0F3E,	%g1
	ta	%icc,	0x6
	std	%f10,	[%l7 + 0x10]
	wrpr	%i7,	%l6,	%pil
	wrpr	%l3,	%o4,	%pil
	fnand	%f8,	%f8,	%f18
	edge16ln	%l4,	%g4,	%g2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x1D2, 	%tick_cmpr
	lduw	[%l7 + 0x20],	%i6
	rd	%softint,	%g7
	edge8n	%l0,	%l5,	%i1
	rd	%tick_cmpr,	%g6
	edge8ln	%g3,	%o5,	%g5
	rdhpr	%hpstate,	%l1
	edge32n	%o3,	%o7,	%i5
	tneg	%icc,	0x4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xAE1, 	%hsys_tick_cmpr
	move	%icc,	%o0,	%o1
	bcs,a,pt	%xcc,	loop_1668
	rdpr	%canrestore,	%i4
	rdpr	%tba,	%o2
	and	%i3,	%g1,	%i7
loop_1668:
	lduh	[%l7 + 0x4E],	%l2
	set	0x28, %o0
	sta	%f21,	[%l7 + %o0] 0x15
	set	0x40, %o7
	stda	%f16,	[%l7 + %o7] 0x19
	wr	%l3,	0x1213,	%ccr
	andn	%o4,	%l4,	%g4
	nop
	setx	loop_1669,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tge	%icc,	0x6
	wr 	%g0, 	0x6, 	%fprs
	rdpr	%gl,	%g2
loop_1669:
	wrpr	%o6,	0x1936,	%cwp
	sth	%i6,	[%l7 + 0x58]

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x678, 	%hsys_tick_cmpr
	fcmpeq32	%f0,	%f0,	%g7
	movle	%icc,	%l0,	%l5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x0D9, 	%tick_cmpr
	andn	%g6,	%o5,	%l1
	ldx	[%l7 + 0x38],	%o3
	wrpr	%g5,	0x1E13,	%tick
	fmovsl	%xcc,	%f10,	%f30
	movg	%xcc,	%o7,	%i5
	fbug	%fcc0,	loop_1670
	movrgez	%i2,	%o0,	%o1
	edge32l	%o2,	%i3,	%i4
	edge16	%g1,	%l2,	%i7
loop_1670:
	sll	%l3,	%o4,	%l4
	te	%icc,	0x2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%softint,	%g4
	edge32	%o6,	%i6,	%g7
	rdpr	%wstate,	%l0
	fbne,a	%fcc1,	loop_1671
	andcc	%l5,	0x0355,	%i0
	alignaddrl	%i1,	%g3,	%g6
	rdhpr	%hsys_tick_cmpr,	%l1
loop_1671:
	rdhpr	%hsys_tick_cmpr,	%o3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g5,	0x1DDC,	%sys_tick
	rdhpr	%htba,	%o5
	wrpr	%i5,	%i2,	%tick
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	rdpr	%pil,	%o7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%hintp,	%o2
	andncc	%i3,	%i4,	%l2
	subcc	%i7,	0x043F,	%l3
	rd	%ccr,	%g1
	wrpr	%o4,	%l6,	%pil
	lduh	[%l7 + 0x2A],	%g2
	wrpr	%l4,	0x10E8,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%fprs,	%i6
	fornot2s	%f3,	%f22,	%f31
	sir	0x19A6
	rdpr	%wstate,	%l0
	tneg	%xcc,	0x6
	fand	%f4,	%f26,	%f0
	wr	%g0,	0x0c,	%asi
	lduha	[%l7 + 0x0C] %asi,	%l5
	rdhpr	%htba,	%g7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%i1,	%g6,	%sys_tick
	rd	%sys_tick_cmpr,	%l1
	rdpr	%otherwin,	%g5
	rd	%ccr,	%o3
	fornot1	%f24,	%f30,	%f24
	rd	%asi,	%i5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	fmovrdlz	%o7,	%f10,	%f24
	stbar
	stx	%i2,	[%l7 + 0x40]

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%o2,	0x136D,	%sys_tick
	fors	%f9,	%f5,	%f12
	wrpr	%i3,	0x08F0,	%tick
	rd	%ccr,	%i4
	rd	%fprs,	%o1
	rd	%pc,	%l2
	rdpr	%canrestore,	%l3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x542, 	%hsys_tick_cmpr
	rdpr	%tba,	%o4
	fbe,a	%fcc2,	loop_1672
        wr    %g0,    0xe,    %pcr    ! changed.
	fxor	%f20,	%f30,	%f26
	wr	%g2,	0x11A0,	%y
loop_1672:
	wr 	%g0, 	0x5, 	%fprs
	mulscc	%o6,	0x0902,	%l4
	wr	%g4,	%i6,	%pic

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%i0,	0x1836,	%cwp
	rdpr	%tl,	%g3
	wr	%i1,	%g6,	%set_softint
	wr	%g7,	%l1,	%clear_softint
	for	%f0,	%f30,	%f6
	ble,a,pn	%icc,	loop_1673
	wr 	%g0, 	0x5, 	%fprs
	srax	%g5,	%i5,	%o7
	lduh	[%l7 + 0x7E],	%i2
loop_1673:
	nop
	set	0x58, %g3
	swapa	[%l7 + %g3] 0x10,	%o0
	rdhpr	%hpstate,	%o2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%g0,	0x19,	%asi
	swapa	[%l7 + 0x60] %asi,	%o1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xD74, 	%sys_tick_cmpr
	fmovsgu	%xcc,	%f13,	%f2
	wrpr	%l2,	%i7,	%pil
	andn	%l3,	%l6,	%g2
	rdpr	%cansave,	%o4
	rdhpr	%hintp,	%g1
	rdpr	%cwp,	%o6
	bpos	loop_1674
	sdiv	%g4,	0x1D54,	%l4
	rd	%asi,	%l5
	rdpr	%otherwin,	%l0
loop_1674:
	tl	%xcc,	0x7
	rdhpr	%hpstate,	%i0
	rdhpr	%hintp,	%i6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xDBC, 	%hsys_tick_cmpr
	set	0x62, %l2
	stha	%g7,	[%l7 + %l2] 0x81
	wr 	%g0, 	0x7, 	%fprs

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	membar	#Sync
	set	0x40, %g7
	ldda	[%l7 + %g7] 0x1e,	%f16
	rd	%asi,	%o7
	rdhpr	%hsys_tick_cmpr,	%i2
	edge16	%o0,	%o2,	%i3
	fmovrdlez	%i4,	%f0,	%f0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xB2B, 	%hsys_tick_cmpr
	rdpr	%tl,	%o1
	rd	%fprs,	%i7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x930, 	%hsys_tick_cmpr
	wrpr	%l6,	%l2,	%pil
	wrpr	%g2,	%g1,	%cwp
	rd	%asi,	%o6
	taddcc	%g4,	0x09EC,	%o4
	movrlz	%l4,	%l5,	%l0
	movleu	%icc,	%i0,	%i1
	wrpr	%i6,	%g7,	%pil
	addcc	%l1,	0x1748,	%g3
	rd	%ccr,	%o3
	rdpr	%cleanwin,	%g6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%ccr,	%i2
	rdpr	%cleanwin,	%o0
	udivx	%o2,	0x0D80,	%i3
	wrpr	%i5,	0x0E26,	%cwp
	movg	%icc,	%g5,	%o5
	fbo,a	%fcc2,	loop_1675
	fcmped	%fcc3,	%f4,	%f16
	movpos	%xcc,	%o1,	%i4
	edge16	%l3,	%l6,	%i7
loop_1675:
	fbule,a	%fcc3,	loop_1676
	rd	%y,	%g2
	wrpr	%g1,	0x0A6E,	%cwp
	fpsub32	%f24,	%f8,	%f2
loop_1676:
	tneg	%xcc,	0x3
	wr	%l2,	0x1F30,	%sys_tick
	edge16n	%o6,	%g4,	%l4
	wrpr	%o4,	0x1F25,	%pil
	wr	%l5,	%l0,	%ccr
	edge32ln	%i1,	%i0,	%g7
	rdhpr	%hintp,	%i6
	rdhpr	%htba,	%g3
	edge32n	%o3,	%g6,	%o7
	rdpr	%gl,	%l1
	rdpr	%cwp,	%o0
	mova	%xcc,	%i2,	%i3
	rdhpr	%hintp,	%o2
	rdpr	%otherwin,	%g5
	array8	%o5,	%i5,	%i4
	fmovsa	%icc,	%f31,	%f19
	movpos	%xcc,	%l3,	%l6
	addccc	%o1,	%g2,	%i7
	rd	%asi,	%g1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x8CD, 	%hsys_tick_cmpr
	xnor	%g4,	%l4,	%l2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x2E8, 	%hsys_tick_cmpr
	tvc	%xcc,	0x1
	bl,pn	%icc,	loop_1677
	rdpr	%tba,	%l0
	sth	%i1,	[%l7 + 0x1C]
	wrpr	%l5,	0x145D,	%pil
loop_1677:
	rdpr	%otherwin,	%g7
	rd	%softint,	%i0
	fba	%fcc2,	loop_1678
	movg	%xcc,	%i6,	%o3
	wr	%g6,	%g3,	%set_softint
	fbul,a	%fcc3,	loop_1679
loop_1678:
        wr    %g0,    0xe,    %pcr    ! changed.
	rd	%asi,	%i2
	rdpr	%tba,	%o7
loop_1679:
	rdhpr	%hsys_tick_cmpr,	%i3
	fbge	%fcc1,	loop_1680
	wrpr	%g5,	0x1688,	%cwp
	fnors	%f18,	%f20,	%f21
	wr	%o2,	0x18AA,	%set_softint
loop_1680:
	taddcctv	%i5,	%i4,	%o5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%cleanwin,	%o1
	wrpr	%l6,	0x0350,	%cwp
	rdpr	%cansave,	%i7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%otherwin,	%g2
	faligndata	%f26,	%f2,	%f24
	fones	%f7
	wr	%l4,	%l2,	%softint
	fpsub32	%f4,	%f22,	%f2
	wrpr	%o4,	%g4,	%pil
	wrpr	%i1,	%l0,	%cwp
	rdpr	%pil,	%g7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xC86, 	%hsys_tick_cmpr
	rdhpr	%hpstate,	%i6
	wr	%g0,	0x81,	%asi
	lduha	[%l7 + 0x42] %asi,	%l5
	wr	%g6,	0x13DA,	%y
	rdhpr	%hsys_tick_cmpr,	%o3
	rdpr	%cleanwin,	%g3
	rdhpr	%hintp,	%o0
	fmovrsgz	%l1,	%f8,	%f12
	fnors	%f30,	%f6,	%f8
	wrpr	%o7,	0x047F,	%pil
	movrne	%i2,	%g5,	%o2
	brlez	%i3,	loop_1681
	rdpr	%wstate,	%i4
	rdpr	%cleanwin,	%o5
	movgu	%icc,	%l3,	%i5
loop_1681:
	rdhpr	%hintp,	%o1
	rd	%tick_cmpr,	%l6
	wr	%g1,	%i7,	%pic
	rd	%pc,	%g2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x18F, 	%hsys_tick_cmpr
	rd	%asi,	%o4
	edge16	%g4,	%l4,	%l0
	fpsub16s	%f7,	%f7,	%f10
	rdhpr	%hpstate,	%g7
	rd	%ccr,	%i0
	rdpr	%cwp,	%i6
	rd	%sys_tick_cmpr,	%l5
	wr	%g0,	0x1e,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
	rdhpr	%hintp,	%g6
	rdpr	%wstate,	%i1
	wrpr	%o3,	%o0,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	rdpr	%pil,	%i2
	rdhpr	%hintp,	%g3
	rdpr	%cwp,	%o2
	wrpr	%i3,	%i4,	%tick
	rd	%sys_tick_cmpr,	%g5
	rd	%pc,	%o5
	wrpr	%l3,	0x1888,	%pil
	rdhpr	%htba,	%o1
	wr	%l6,	%g1,	%clear_softint
	rdhpr	%htba,	%i7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x939, 	%hsys_tick_cmpr
	wrpr	%o6,	%l2,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xF6B, 	%hsys_tick_cmpr
	fmovse	%icc,	%f12,	%f5
	movvc	%icc,	%o4,	%l4
	fbule,a	%fcc0,	loop_1682
	wrpr	%l0,	0x08B4,	%cwp
	bg,pn	%icc,	loop_1683
	wr	%g4,	0x1D9B,	%ccr
loop_1682:
	wrpr	%g7,	0x00B9,	%cwp
	subc	%i0,	%l5,	%i6
loop_1683:
	wr	%g6,	%i1,	%sys_tick
	wrpr	%o3,	%o0,	%cwp
	edge16l	%o7,	%l1,	%i2
	bge,a,pn	%icc,	loop_1684
	wr	%o2,	0x1761,	%softint
	rdpr	%tl,	%g3
	rd	%ccr,	%i4
loop_1684:
	udiv	%i3,	0x1A72,	%o5
	umul	%l3,	%o1,	%l6
	wrpr	%g5,	%g1,	%tick
	fxnors	%f9,	%f10,	%f13
	xorcc	%i7,	0x0FE7,	%o6
	wrpr	%l2,	0x171B,	%pil
	wrpr	%i5,	0x18FE,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x41B, 	%hsys_tick_cmpr
	rdpr	%canrestore,	%l0
	rdhpr	%hpstate,	%g4
	andn	%g7,	0x03FF,	%o4
	rdhpr	%htba,	%i0
	fpack32	%f18,	%f20,	%f24
	wrpr	%l5,	0x11F9,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%i1,	%i6,	%cwp
	fcmple32	%f30,	%f14,	%o0
	wr	%o7,	0x0D97,	%pic
	fbe,a	%fcc0,	loop_1685
	wr	%o3,	%i2,	%set_softint
	rd	%y,	%o2
	rd	%fprs,	%l1
loop_1685:
	umulcc	%g3,	%i4,	%i3
	fbne,a	%fcc1,	loop_1686
	array16	%l3,	%o1,	%l6
	rdpr	%cwp,	%g5
	rdpr	%wstate,	%o5
loop_1686:
	brnz	%i7,	loop_1687
	andcc	%o6,	%l2,	%i5
	wrpr	%g2,	%g1,	%cwp
	fcmped	%fcc3,	%f16,	%f18
loop_1687:
        wr    %g0,    0xe,    %pcr    ! changed.
	fnands	%f14,	%f0,	%f21

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xAA2, 	%hsys_tick_cmpr
	rd	%asi,	%g7
	rd	%softint,	%o4
	fcmpne32	%f26,	%f26,	%l4
	fmovscs	%xcc,	%f3,	%f30
	tleu	%icc,	0x3
	sdiv	%i0,	0x1F1D,	%l5
	move	%xcc,	%g6,	%i6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	addccc	%i1,	%o3,	%o7
	rdhpr	%hsys_tick_cmpr,	%i2
	rdhpr	%hpstate,	%o2
	rdpr	%tl,	%l1
	wr 	%g0, 	0x5, 	%fprs
	rdhpr	%hpstate,	%i4
	rd	%y,	%i3
	pdist	%f0,	%f6,	%f16
	std	%f4,	[%l7 + 0x40]
	rdhpr	%htba,	%l3
	flush	%l7 + 0x4C

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	fand	%f4,	%f4,	%f0
	edge16n	%o5,	%i7,	%l6
	tsubcctv	%l2,	0x0E7A,	%o6
	wrpr	%i5,	0x1A24,	%cwp
	wr	%g1,	%g2,	%softint
	rdhpr	%hsys_tick_cmpr,	%l0
	swap	[%l7 + 0x30],	%g4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xABD, 	%hsys_tick_cmpr
	wrpr	%l4,	0x1DD1,	%cwp
	tge	%icc,	0x3
	wr	%i0,	0x0D6D,	%sys_tick
	wrpr	%g7,	%l5,	%tick
	array32	%i6,	%g6,	%i1
	edge32	%o0,	%o7,	%i2
	sra	%o3,	%l1,	%g3
	rd	%softint,	%o2
	fmovdvc	%icc,	%f15,	%f8
	add	%l7,	0x68,	%l6
	wr	%g0,	0x04,	%asi
	casxa	[%l6] %asi,	%i4,	%l3
	stw	%i3,	[%l7 + 0x50]
	xnorcc	%g5,	%o1,	%o5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	rdhpr	%hintp,	%l6
	wrpr	%i7,	0x15C3,	%pil
	rd	%y,	%o6
	wrpr	%l2,	%i5,	%tick
	sllx	%g2,	0x15,	%l0
	wr	%g0,	0x89,	%asi
	ldsha	[%l7 + 0x58] %asi,	%g4
	wr	%g1,	%o4,	%sys_tick
	tg	%xcc,	0x4
	umul	%i0,	%l4,	%l5
	wr	%g7,	0x0852,	%set_softint
	rd	%tick_cmpr,	%g6
	rdpr	%cleanwin,	%i1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xDCE, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	edge8l	%i2,	%g3,	%l1
	rdhpr	%hsys_tick_cmpr,	%o2
	rd	%y,	%i4
	fbo,a	%fcc2,	loop_1688
	tle	%xcc,	0x2
	rd	%fprs,	%l3
	srax	%g5,	%o1,	%i3
loop_1688:
	wr	%o5,	%i7,	%set_softint
	rd	%ccr,	%l6
	wrpr	%o6,	%i5,	%pil
	wrpr	%l2,	0x0082,	%tick
	wr	%g0,	0x2a,	%asi
	stda	%l0,	[%l7 + 0x08] %asi
	membar	#Sync
	wrpr	%g4,	%g2,	%pil
	rdhpr	%hpstate,	%g1
	sdivcc	%i0,	0x1DD5,	%l4
	wr	%o4,	%l5,	%ccr
	rdpr	%tba,	%g7
	set	0x30, %i4
	ldswa	[%l7 + %i4] 0x80,	%g6
	wrpr	%i1,	0x0D41,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x0B0, 	%hsys_tick_cmpr
	fmovsg	%xcc,	%f30,	%f6
	wrpr	%o7,	0x18F1,	%pil
	membar	0x29
	tleu	%xcc,	0x1
	rdhpr	%hintp,	%o0
        wr    %g0,    0xe,    %pcr    ! changed.
	wr 	%g0, 	0x5, 	%fprs
	rd	%fprs,	%l1
	rdpr	%tba,	%o2
	wrpr	%i4,	0x1468,	%tick
	mulx	%o3,	%g5,	%o1
	addccc	%i3,	0x0096,	%l3
	bneg,a	%xcc,	loop_1689
	edge8l	%i7,	%o5,	%l6
	movl	%icc,	%o6,	%l2
	rd	%fprs,	%i5
loop_1689:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xD17, 	%sys_tick_cmpr
	andn	%g2,	0x050F,	%i0
	bleu,pt	%xcc,	loop_1690
	wrpr	%g1,	%o4,	%tick
	rdpr	%cansave,	%l4
	sll	%l5,	0x04,	%g6
loop_1690:
	ldstub	[%l7 + 0x31],	%g7
	wr	%g0,	0x88,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	mova	%xcc,	%i6,	%o7
	rd	%softint,	%i1
	movl	%xcc,	%o0,	%i2
	movge	%icc,	%g3,	%l1
	wrpr	%o2,	%i4,	%cwp
	umulcc	%g5,	%o3,	%i3
	bn,a,pn	%icc,	loop_1691
	rdhpr	%hpstate,	%l3
	fbuge,a	%fcc1,	loop_1692
	fpadd32	%f24,	%f0,	%f6
loop_1691:
	array8	%i7,	%o1,	%o5
	xnor	%l6,	%o6,	%l2
loop_1692:
	edge32n	%i5,	%l0,	%g4
	xorcc	%g2,	%g1,	%i0
	movrne	%l4,	0x0D2,	%o4
	rd	%sys_tick_cmpr,	%l5
	fzeros	%f4
	brgz	%g7,	loop_1693
	bpos,pt	%icc,	loop_1694
	wrpr	%i6,	%g6,	%pil
	tsubcc	%i1,	%o0,	%i2
loop_1693:
        wr    %g0,    0xe,    %pcr    ! changed.
loop_1694:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	rdhpr	%hpstate,	%l1
!Yo - got one - imm_asi 0x21 
!And yo - immediate is 0x110
	wr	%g0,	0x21,	%asi
	ldxa	[%g0 + 0x110] %asi,	%i4
	move	%xcc,	%o3,	%g5
	fcmpes	%fcc1,	%f1,	%f8

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%tl,	%i7
	fcmpeq16	%f12,	%f0,	%o1
	rdpr	%pil,	%i3
	srax	%l6,	%o5,	%o6
	rd	%asi,	%i5
	sdivx	%l0,	0x1800,	%g4
	bne	%icc,	loop_1695
	wrpr	%l2,	%g2,	%pil
	wr	%g0,	0x18,	%asi
	sta	%f10,	[%l7 + 0x6C] %asi
loop_1695:
	rdpr	%cansave,	%i0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xB5D, 	%hsys_tick_cmpr
	nop
	setx	loop_1696,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_1696:
	nop

	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 0:
!
!	Type l   	: 1566
!	Type a   	: 16270
!	Type x   	: 787
!	Type cti   	: 1696
!	Type f   	: 2504
!	Type i   	: 7177
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


	EXIT_GOOD	/* test finish  */

/************************************************************************
   Test case data start
 ************************************************************************/
.data
user_data_start:
scratch_area:
.word 0x470F6926
.word 0x06DD26A3
.word 0xC72E471A
.word 0x4F484C34
.word 0xCC7DAD17
.word 0x319F8F1C
.word 0x5552281B
.word 0xB8DD992D
.word 0xB2AAB273
.word 0xB33362A2
.word 0x21D6DA34
.word 0x1D4F92DA
.word 0x8B978F7E
.word 0xD1BC340D
.word 0x88DB8397
.word 0x86DAE41F
.word 0x0748C4FE
.word 0x472B8031
.word 0xCE51902B
.word 0x78BFD0D9
.word 0x83428FB2
.word 0xB143F539
.word 0x24D92EE2
.word 0x987949D4
.word 0x16B5C6E8
.word 0x5F2DD7F5
.word 0x7C2A0A02
.word 0x949B8483
.word 0x68571CB3
.word 0xA94A9606
.word 0x29B2FB89
.word 0xFEE60752
.word 0x892282AA
.word 0x4FFF88F6
.word 0x95151E44
.word 0x839FD7DB
.word 0x3A071F11
.word 0x430B9B59
.word 0x600DE1DC
.word 0xE48AF4B0
.word 0x8A4817DF
.word 0x7BA4AC6C
.word 0x24E7779E
.word 0xC72005FE
.word 0xCD843261
.word 0x876F9AB3
.word 0xAA0E40AF
.word 0xB97C9226
.word 0xFA2B460A
.word 0x085241C1
.word 0x02A70F71
.word 0xABECBBDE
.word 0x99F363CC
.word 0xC55584B0
.word 0x65ECB7FB
.word 0x7599289F
.word 0x6322B2E3
.word 0x3099DC75
.word 0xDF3F383F
.word 0x23B80F6E
.word 0x3222EB75
.word 0x383B9185
.word 0x51CDCBD0
.word 0xBC62533F
.end
