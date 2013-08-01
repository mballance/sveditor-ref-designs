/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: isa3_asr_pr_hpr_f4.s
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
.ident "FOCUSCASE: focus.pm,v 1.1 2003/04/23 17:53:39 somePerson Exp somePerson $ ../focus/spc_basic_isa3.pl FOCUS_SEED=527114806"
.ident "BY gg137162 ON Wed Sep 17 21:06:29 CDT 2003"
.ident "Using Instruction Hash for Focus :$Id: isa3_asr_pr_hpr_f4.s,v 1.2 2007/07/05 21:59:50 drp Exp $"
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
	nop
	setx	0x10E8A8DF904D1592,	%l0,	%l6
	stx	%l6,	[%l7 + 0x0]
	ldx	[%l7 + 0x0],	%fsr
!
! Thread 0 Start
!
main_t0:

	!# Initialize registers ..

	!# Global registers
	set	0xF,	%g1
	set	0x2,	%g2
	set	0x1,	%g3
	set	0xF,	%g4
	set	0x7,	%g5
	set	0xE,	%g6
	set	0x2,	%g7
	!# Input registers
	set	-0xE,	%i0
	set	-0xF,	%i1
	set	-0xE,	%i2
	set	-0xA,	%i3
	set	-0x1,	%i4
	set	-0x1,	%i5
	set	-0x3,	%i6
	set	-0x3,	%i7
	!# Local registers
	set	0x4F58F571,	%l0
	set	0x2FBAF941,	%l1
	set	0x0896FA43,	%l2
	set	0x76B5EF1A,	%l3
	set	0x764B5795,	%l4
	set	0x20934A6D,	%l5
	set	0x6699ADBF,	%l6
	!# Output registers
	set	-0x00FC,	%o0
	set	-0x042A,	%o1
	set	-0x1F84,	%o2
	set	0x11FB,	%o3
	set	-0x11B0,	%o4
	set	0x1019,	%o5
	set	-0x141A,	%o6
	set	0x1EE5,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x2ADD3D0226E58F7D)
	INIT_TH_FP_REG(%l7,%f2,0x971546F1C515C6E3)
	INIT_TH_FP_REG(%l7,%f4,0x0E096B55A6AF0151)
	INIT_TH_FP_REG(%l7,%f6,0x57CB4E7B0CDBCA22)
	INIT_TH_FP_REG(%l7,%f8,0x2EB7715417C9FBD0)
	INIT_TH_FP_REG(%l7,%f10,0x49F1B037783CF13B)
	INIT_TH_FP_REG(%l7,%f12,0x33C3D67F7C422626)
	INIT_TH_FP_REG(%l7,%f14,0x2BA2FD4824FF1B3F)
	INIT_TH_FP_REG(%l7,%f16,0xA60E6B3CCFE50BBB)
	INIT_TH_FP_REG(%l7,%f18,0x94C7E9AF50211843)
	INIT_TH_FP_REG(%l7,%f20,0x8B635E197700109F)
	INIT_TH_FP_REG(%l7,%f22,0x94B8899E507E2DB7)
	INIT_TH_FP_REG(%l7,%f24,0xF50E6AF7C1D327D5)
	INIT_TH_FP_REG(%l7,%f26,0x51682D4629B558E5)
	INIT_TH_FP_REG(%l7,%f28,0xC30388308DB7DBAF)
	INIT_TH_FP_REG(%l7,%f30,0xED3EE3D5606158E2)
	!# Other state
	
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr


	!# Execute Main Diag ..

	add	%l7,	0x68,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%i2
	casxa	[%l6] 0x89,	%i2,	%o2
	wr	%g3,	%l6,	%pic
	wr	%g0,	0x19,	%asi
	stwa	%g4,	[%l7 + 0x54] %asi
	wrpr	%l5,	%o5,	%cwp
	fmul8x16au	%f15,	%f17,	%f16
	rdpr	%cwp,	%i6
	rdhpr	%hpstate,	%g2
	fandnot2s	%f29,	%f26,	%f15
	movle	%icc,	%i5,	%l4
	orncc	%o1,	0x1715,	%i1
	smulcc	%i0,	0x1D05,	%g1
	udivcc	%o0,	0x041E,	%i3
	fand	%f16,	%f0,	%f30
	rdhpr	%htba,	%i7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x99D, 	%hsys_tick_cmpr
	fnegd	%f12,	%f20
	wr	%l0,	%o3,	%set_softint
	rdhpr	%htba,	%g5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%otherwin,	%o7
	edge32	%o6,	%i4,	%l1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	wr	%i2,	%g3,	%pic
	wr	%o2,	%l6,	%y
	edge16ln	%g4,	%l5,	%o5
	or	%g2,	0x1BE4,	%i5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%i6,	0x0AE4,	%tick
	rdhpr	%hintp,	%i1
	edge8	%o1,	%g1,	%i0
	rdpr	%cwp,	%o0
	wrpr	%i7,	0x1828,	%pil
	rd	%y,	%g6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x37B, 	%tick_cmpr
	rd	%fprs,	%l0
	fnor	%f14,	%f16,	%f26
	wr 	%g0, 	0x4, 	%fprs
	wr	%g0,	0x2b,	%asi
	stwa	%g7,	[%l7 + 0x2C] %asi
	membar	#Sync
	add	%l7,	0x48,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%o7
	casxa	[%l6] 0x89,	%o7,	%o6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fbne	%fcc1,	loop_1
	smulcc	%l2,	%i4,	%o4
        wr    %g0,    0xe,    %pcr    ! changed.
	rdhpr	%hintp,	%i2
loop_1:
	tsubcctv	%o2,	0x0592,	%l6
	edge8n	%g4,	%l5,	%o5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fmovdgu	%xcc,	%f8,	%f19
	rdhpr	%hsys_tick_cmpr,	%i6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x4E3, 	%hsys_tick_cmpr
	addc	%i1,	0x153E,	%o1
	sdiv	%g1,	0x176C,	%i0
	wr 	%g0, 	0x5, 	%fprs

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xEF9, 	%hsys_tick_cmpr
	brlz,a	%i3,	loop_2
	fmovsn	%icc,	%f18,	%f27
	wr	%l0,	%o3,	%pic
	rdpr	%cleanwin,	%g5
loop_2:
	rd	%ccr,	%g7
	rdhpr	%htba,	%o7
	array16	%g6,	%l3,	%l1
        wr    %g0,    0xe,    %pcr    ! changed.
	wr	%l2,	%g3,	%set_softint

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x587, 	%hsys_tick_cmpr
	bcs,a	%xcc,	loop_3
	rdhpr	%hpstate,	%i2
	rd	%tick_cmpr,	%g4
	wrpr	%l6,	%l5,	%cwp
loop_3:
	fsrc1	%f4,	%f28
	orcc	%g2,	%o5,	%i5
	move	%xcc,	%l4,	%i1
	rdpr	%cleanwin,	%o1
	rd	%softint,	%i6
	rd	%tick_cmpr,	%g1
	wrpr	%i0,	%i7,	%cwp
	rd	%sys_tick_cmpr,	%o0
	rdpr	%pil,	%i3
	andn	%l0,	0x1CDB,	%g5
	fsrc1	%f4,	%f14
	wr	%g7,	%o7,	%ccr
	wr	%o3,	0x1614,	%pic
	wr	%l3,	%g6,	%ccr
	wrpr	%l1,	%i4,	%tick
	bcc,pn	%xcc,	loop_4
	rdhpr	%hintp,	%l2
	sub	%o6,	%o4,	%o2
	alignaddr	%i2,	%g3,	%l6
loop_4:
	edge16l	%g4,	%g2,	%l5
	xnor	%i5,	0x09D0,	%o5
	rd	%pc,	%l4
	xorcc	%i1,	%i6,	%g1
	movleu	%icc,	%o1,	%i7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	add	%l7,	0x38,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%i3,	%o0
	rdpr	%tba,	%g5
	fandnot1s	%f10,	%f19,	%f25
	rdhpr	%htba,	%l0
	fmovrdne	%g7,	%f0,	%f18
	movpos	%icc,	%o3,	%o7
	wrpr	%g6,	%l1,	%tick
	wrpr	%l3,	0x05EB,	%cwp
	rd	%ccr,	%l2
	mova	%xcc,	%o6,	%i4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%htba,	%g3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%canrestore,	%g4
	srax	%i2,	0x13,	%g2
	xnorcc	%l5,	0x08ED,	%o5
	movrne	%i5,	%i1,	%i6
	movrlez	%l4,	%o1,	%i7
	rdhpr	%hpstate,	%g1
	edge8ln	%i0,	%o0,	%g5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x49C, 	%hsys_tick_cmpr
	pdist	%f18,	%f28,	%f10
	rdpr	%otherwin,	%l0
	wr	%g7,	%o3,	%y
	sir	0x1963
	tgu	%xcc,	0x1
	edge16	%o7,	%g6,	%l3
	ldsh	[%l7 + 0x34],	%l1
	rd	%softint,	%o6
	wr	%i4,	%l2,	%y
	wrpr	%o4,	0x0F1E,	%tick
	movre	%g3,	0x17F,	%l6
	wr	%o2,	0x0134,	%clear_softint
	edge16ln	%i2,	%g2,	%l5
	movrne	%o5,	%i5,	%i1
	edge8ln	%g4,	%l4,	%o1
	set	0x27, %l5
	ldstuba	[%l7 + %l5] 0x18,	%i6
	wr	%g1,	%i7,	%y
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x18
	wr	%g0,	0x20,	%asi
	ldxa	[%g0 + 0x18] %asi,	%o0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x921, 	%hsys_tick_cmpr
	srl	%i3,	0x13,	%l0
	addccc	%o3,	0x1064,	%g7
        wr    %g0,    0xe,    %pcr    ! changed.
	ble,pn	%icc,	loop_5
	rdhpr	%hintp,	%l3
	rdhpr	%hintp,	%l1
	wrpr	%o6,	%i4,	%tick
loop_5:
	rdpr	%cwp,	%l2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	wrpr	%l6,	0x0529,	%cwp
	subccc	%o2,	%g2,	%l5
	rdpr	%cansave,	%o5
	rdpr	%gl,	%i5
	movre	%i1,	0x09B,	%g4
	rdhpr	%hintp,	%i2
	fand	%f0,	%f14,	%f26
	rdhpr	%hsys_tick_cmpr,	%o1
	rdhpr	%htba,	%i6
	fble,a	%fcc2,	loop_6
	bn,a,pt	%xcc,	loop_7
	bge,a	loop_8
	fbge	%fcc3,	loop_9
loop_6:
	rd	%asi,	%l4
loop_7:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_8:
	wrpr	%g1,	%i0,	%cwp
loop_9:
	rd	%fprs,	%g5
	rdhpr	%hsys_tick_cmpr,	%o0
	set	0x4E, %g4
	ldstuba	[%l7 + %g4] 0x18,	%i3
	rd	%y,	%o3
	tn	%xcc,	0x2
	sdivx	%l0,	0x11F5,	%g7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%canrestore,	%l3
	sdiv	%l1,	0x187F,	%o7
	edge16	%i4,	%l2,	%o6
	tcs	%icc,	0x3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	bne,a,pn	%xcc,	loop_10
	wr	%o4,	%o2,	%y
	edge32	%l5,	%g2,	%i5
        wr    %g0,    0xe,    %pcr    ! changed.
loop_10:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tg	%icc,	0x5
	rdpr	%pil,	%g4
	wr	%o1,	0x1DE0,	%softint
	wrpr	%i2,	0x1F06,	%pil
	popc	0x0348,	%i6
	rdhpr	%hsys_tick_cmpr,	%l4
	rdpr	%gl,	%i7
	fornot2s	%f27,	%f29,	%f2
	fcmpes	%fcc1,	%f1,	%f25
	rd	%fprs,	%g1
	sdivcc	%i0,	0x0FE0,	%g5
	rd	%fprs,	%o0
	rdpr	%canrestore,	%o3
	orn	%l0,	%g7,	%i3
	fba	%fcc3,	loop_11
	wr	%g6,	0x094E,	%y
	rd	%softint,	%l3
	rd	%asi,	%o7
loop_11:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x749, 	%sys_tick_cmpr
	rdpr	%tl,	%l1
	move	%icc,	%o6,	%l2
	rdhpr	%hsys_tick_cmpr,	%l6
	rdpr	%wstate,	%g3
	fornot1	%f6,	%f14,	%f18
	wr	%o4,	%l5,	%softint
	membar	0x45
	fmovrdgz	%g2,	%f4,	%f30

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	tl	%xcc,	0x3
	rdpr	%canrestore,	%o2
	rdhpr	%hsys_tick_cmpr,	%i1
	movgu	%icc,	%g4,	%o5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	ble,pn	%icc,	loop_12
	rdhpr	%hsys_tick_cmpr,	%l4
	sub	%i7,	%g1,	%o1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_12:
	fxor	%f12,	%f8,	%f4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x457, 	%hsys_tick_cmpr
	rdhpr	%hpstate,	%g7
	fbul,a	%fcc0,	loop_13
	fpsub16	%f20,	%f30,	%f0
	movl	%xcc,	%o3,	%i3
	rd	%sys_tick_cmpr,	%g6
loop_13:
	fxor	%f0,	%f12,	%f26
	subccc	%o7,	%l3,	%i4
	rdpr	%cwp,	%l1
	wr	%l2,	0x1B4E,	%set_softint
	fble	%fcc1,	loop_14
	ldx	[%l7 + 0x68],	%o6
	wrpr	%g3,	%l6,	%pil
	tcc	%xcc,	0x2
loop_14:
	fmovdle	%xcc,	%f23,	%f16
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	rdpr	%cansave,	%o4
	rd	%tick_cmpr,	%l5
	rdpr	%cansave,	%i5
	wr	%g2,	%o2,	%y
	rdpr	%otherwin,	%g4
	smul	%o5,	%i1,	%i6
	fmul8x16	%f6,	%f12,	%f24
	rdhpr	%htba,	%i2
	wr	%i7,	0x0D72,	%pic
	wr	%g1,	0x0469,	%sys_tick
	fmovrslz	%o1,	%f7,	%f3
	tpos	%xcc,	0x2
	brz	%g5,	loop_15
	addc	%i0,	%l4,	%l0
	fpackfix	%f0,	%f15

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_15:
	bvc,a,pt	%xcc,	loop_16
	fmovrdgz	%o3,	%f2,	%f8
	rdpr	%pil,	%i3
	flush	%l7 + 0x40
loop_16:
	sra	%o0,	0x08,	%o7
	orncc	%l3,	0x0C38,	%g6
	rd	%fprs,	%l1
	movcc	%xcc,	%l2,	%o6
	bvs,pt	%xcc,	loop_17
	rdpr	%pil,	%i4
	udivcc	%l6,	0x1762,	%g3
	rdhpr	%hintp,	%o4
loop_17:
	popc	0x1CF5,	%l5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x296, 	%sys_tick_cmpr
	fpackfix	%f4,	%f3
	edge32ln	%o2,	%i5,	%g4
	fmovspos	%xcc,	%f27,	%f7
	fornot1	%f0,	%f4,	%f26
        wr    %g0,    0xe,    %pcr    ! changed.

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%htba,	%i2
	wr	%i7,	%g1,	%ccr
	tgu	%icc,	0x3
	rdhpr	%hsys_tick_cmpr,	%o1
	rdpr	%wstate,	%g5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x2C1, 	%hsys_tick_cmpr
	rdhpr	%hpstate,	%g7
	sdivcc	%o3,	0x0D87,	%i3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fbge,a	%fcc3,	loop_18
	tn	%icc,	0x4
	bcc,a	%xcc,	loop_19
	sdiv	%l3,	0x18CA,	%o7
loop_18:
	rdhpr	%hsys_tick_cmpr,	%g6
	tsubcctv	%l1,	%o6,	%i4
loop_19:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%pc,	%l6
	tne	%icc,	0x3
	wr 	%g0, 	0x7, 	%fprs
	wr	%l5,	0x0BAC,	%sys_tick
	bn,a,pt	%xcc,	loop_20
	alignaddrl	%o2,	%i5,	%g4
	rdhpr	%htba,	%o5
	movrgz	%i6,	0x3E4,	%i1
loop_20:
	rd	%y,	%i2
	rd	%tick_cmpr,	%g2
	wrpr	%i7,	0x01AD,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	mulx	%o1,	0x1BFD,	%i0
	rdpr	%otherwin,	%g5
        wr    %g0,    0xe,    %pcr    ! changed.
	fmovrdne	%o3,	%f10,	%f22
	fbul,a	%fcc3,	loop_21
	rdhpr	%hsys_tick_cmpr,	%i3
	orncc	%g7,	0x121F,	%o0
	fmovdg	%xcc,	%f0,	%f30
loop_21:
	wrpr	%l0,	0x0D0F,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xCD9, 	%hsys_tick_cmpr
	edge8n	%o7,	%l1,	%g6
	fmul8x16	%f0,	%f28,	%f14

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	rdpr	%otherwin,	%l2
	rdhpr	%htba,	%o4
	taddcctv	%g3,	0x1412,	%l5
	rdhpr	%hintp,	%o2
	rdpr	%pil,	%i5
	alignaddrl	%l6,	%g4,	%o5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x4A8, 	%tick_cmpr
	rd	%pc,	%i2
	movre	%i1,	0x317,	%i7
	rdpr	%cansave,	%g1

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
	fbu,a	%fcc0,	loop_22
	edge32	%g5,	%o1,	%o3
	fmovdn	%icc,	%f14,	%f16
	movrgez	%l4,	0x19B,	%i3
loop_22:
	wr	%g7,	%o0,	%ccr
	wr	%l3,	0x17FA,	%pic
	wr	%o7,	%l1,	%y
	wrpr	%l0,	%g6,	%tick
	smulcc	%o6,	%i4,	%o4
        wr    %g0,    0xe,    %pcr    ! changed.
	bg,pn	%icc,	loop_23
	wr	%l2,	%l5,	%set_softint
	addccc	%i5,	%l6,	%g4
	fornot1	%f24,	%f12,	%f12
loop_23:
	rdpr	%canrestore,	%o5
	rd	%y,	%i6
	rdpr	%canrestore,	%o2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x89C, 	%hsys_tick_cmpr
	bne,pt	%icc,	loop_24
	rd	%tick_cmpr,	%i2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%canrestore,	%i7
loop_24:
	wrpr	%i0,	0x1A68,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%o3,	%l4,	%tick
	wrpr	%i3,	%g7,	%tick
	tpos	%xcc,	0x1
	set	0x21, %l3
	stba	%g2,	[%l7 + %l3] 0x10
	rd	%ccr,	%l3
	movrlz	%o7,	0x28A,	%l1
	wr	%l0,	%o0,	%softint
	bpos,a,pn	%xcc,	loop_25
	udivcc	%g6,	0x065F,	%i4
	wr	%o4,	%o6,	%pic
	rdpr	%gl,	%l2
loop_25:
	srl	%g3,	0x1C,	%l5
	fbue,a	%fcc2,	loop_26
	tsubcctv	%i5,	%l6,	%g4
	tpos	%xcc,	0x0
	tl	%icc,	0x4
loop_26:
	xnor	%o5,	0x0C37,	%i6
	wr	%o2,	0x0668,	%y
	rdhpr	%hsys_tick_cmpr,	%i1
	rd	%tick_cmpr,	%g1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xC7B, 	%hsys_tick_cmpr
	movge	%icc,	%i0,	%i7
	movre	%o1,	0x135,	%o3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xB4B, 	%tick_cmpr
	rd	%asi,	%i3
	rd	%fprs,	%g2
	wr	%g7,	0x09AF,	%clear_softint
	rdhpr	%hpstate,	%o7
	wrpr	%l1,	0x159A,	%cwp
	wrpr	%l0,	0x1D99,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%sys_tick_cmpr,	%i4
	rdhpr	%hsys_tick_cmpr,	%o4
	tvc	%icc,	0x3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	add	%l2,	%g3,	%l5
	or	%i5,	0x1280,	%o6
	fbul	%fcc1,	loop_27
	or	%l6,	0x0F29,	%g4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fmovrdgz	%o2,	%f4,	%f26
loop_27:
	wrpr	%i6,	0x00A6,	%tick
	bl,pn	%xcc,	loop_28
	movl	%xcc,	%g1,	%i2
	movne	%icc,	%i0,	%i7
	wr	%o1,	0x0211,	%y
loop_28:
	tle	%icc,	0x3
	wr	%o3,	%i1,	%clear_softint
	sethi	0x10BD,	%l4
	fba,a	%fcc1,	loop_29
	rd	%softint,	%g5
	rdpr	%canrestore,	%g2
	wr	%g0,	0x10,	%asi
	lduha	[%l7 + 0x18] %asi,	%i3
loop_29:
	wrpr	%o7,	0x17F4,	%tick
	wrpr	%g7,	0x1C05,	%pil
	stw	%l0,	[%l7 + 0x3C]
	rd	%ccr,	%l1
	sdivcc	%g6,	0x145E,	%l3
	wrpr	%o4,	0x0138,	%tick
	membar	0x38
	tcs	%icc,	0x5
	tne	%xcc,	0x3
	rdpr	%tl,	%i4
	sdivcc	%l2,	0x02FD,	%g3
	fmovrde	%o0,	%f26,	%f22
	udivx	%l5,	0x06B4,	%i5
	rd	%fprs,	%o6
	rdpr	%cansave,	%g4
	fmovrdlz	%l6,	%f30,	%f6
	sub	%o2,	%o5,	%g1
	tsubcc	%i2,	0x1C4C,	%i0
	fba	%fcc2,	loop_30
	wrpr	%i7,	0x1DF2,	%pil
	move	%icc,	%i6,	%o1
	fbue	%fcc1,	loop_31
loop_30:
	xor	%i1,	0x0E7E,	%o3
	sethi	0x12A9,	%l4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x365, 	%hsys_tick_cmpr
loop_31:
	rdhpr	%htba,	%i3
	bleu,pn	%xcc,	loop_32
	wrpr	%g7,	%o7,	%tick
	wrpr	%l1,	0x19D4,	%tick
	wrpr	%g6,	0x02D0,	%pil
loop_32:
	tne	%icc,	0x7
	rdpr	%pil,	%l0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%hsys_tick_cmpr,	%o4
	fmovdpos	%icc,	%f24,	%f1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x6FD, 	%hsys_tick_cmpr
	rdpr	%cansave,	%o0
	fcmpgt16	%f30,	%f14,	%l5
	fbo	%fcc1,	loop_33
	srax	%l2,	0x0A,	%i5
	wrpr	%o6,	%l6,	%tick
	fbule,a	%fcc3,	loop_34
loop_33:
	wrpr	%o2,	0x170F,	%tick
	tvs	%xcc,	0x1
	stw	%g4,	[%l7 + 0x2C]
loop_34:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x632, 	%hsys_tick_cmpr
	orn	%i0,	0x0090,	%i7
	rd	%pc,	%i6
	flush	%l7 + 0x20
	sdivx	%o1,	0x06B0,	%g1
	fmovscc	%xcc,	%f9,	%f4
	wr	%g0,	0xeb,	%asi
	stda	%o2,	[%l7 + 0x20] %asi
	membar	#Sync
	call	loop_35
	rd	%pc,	%l4
	rd	%y,	%i1
	bcc	loop_36
loop_35:
	rd	%sys_tick_cmpr,	%g5
	rdhpr	%hintp,	%g2
	wrpr	%g7,	0x01C0,	%tick
loop_36:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xB7F, 	%hsys_tick_cmpr
	edge16	%l1,	%g6,	%o7
	movrgez	%l3,	0x2D5,	%l0
	sethi	0x0835,	%o4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xBDD, 	%hsys_tick_cmpr
	rd	%fprs,	%l5
	rd	%tick_cmpr,	%g3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x3A6, 	%hsys_tick_cmpr
	addc	%l6,	%o2,	%l2
	tcs	%xcc,	0x0
	add	%o5,	%g4,	%i2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmpne32	%f26,	%f12,	%i0
	wr	%i6,	%o1,	%pic
	sll	%g1,	0x1D,	%i7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	movrgz	%l4,	0x260,	%i1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	movrgz	%g7,	%i3,	%g5
	rdpr	%cwp,	%g6
	wrpr	%o7,	%l3,	%tick
	wrpr	%l0,	0x1FAC,	%pil
	rd	%asi,	%l1
	wrpr	%i4,	0x05EA,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	rdhpr	%hintp,	%l5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	addccc	%i5,	%g3,	%l6
	wrpr	%o6,	0x0147,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x4D6, 	%hsys_tick_cmpr
	rdpr	%tba,	%g4
	rd	%ccr,	%l2
	nop
	set	0x5C, %o5
	prefetch	[%l7 + %o5],	 0x1
	rdpr	%pil,	%i2
	ta	%xcc,	0x6
	wrpr	%i0,	%o1,	%pil
	rd	%sys_tick_cmpr,	%g1
	rdhpr	%hintp,	%i6
	wrpr	%i7,	0x023E,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xB58, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fbule	%fcc1,	loop_37
	tgu	%xcc,	0x2
	mulscc	%g7,	%i3,	%g5
	edge32	%g6,	%o7,	%l3
loop_37:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xDE1, 	%hsys_tick_cmpr
	tne	%icc,	0x6
	rd	%ccr,	%l1
	fones	%f17
	tge	%icc,	0x1
	wrpr	%i4,	%o4,	%cwp
	edge16n	%l5,	%g2,	%i5
	rdpr	%wstate,	%g3
	smulcc	%l6,	0x177B,	%o6
	wrpr	%o2,	%o0,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x02F, 	%hsys_tick_cmpr
	rdpr	%cwp,	%g4
	bleu,a	loop_38
	udivx	%i0,	0x061E,	%o1
	wrpr	%g1,	%i6,	%pil
	rd	%ccr,	%i7
loop_38:
	rdhpr	%htba,	%l4
	lduh	[%l7 + 0x48],	%i2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xAD0, 	%hsys_tick_cmpr
	popc	0x05A6,	%i3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xB0B, 	%sys_tick_cmpr
	array8	%o7,	%l3,	%g6
	rd	%pc,	%l1
	wr	%l0,	0x1A61,	%y
	fbuge,a	%fcc3,	loop_39
	movge	%icc,	%i4,	%l5
	wrpr	%g2,	0x1402,	%cwp
	wr	%i5,	0x1942,	%set_softint
loop_39:
	wr	%o4,	%g3,	%sys_tick
	rdpr	%canrestore,	%o6
	xnor	%l6,	0x0AF6,	%o0
	rdpr	%canrestore,	%o2
	wrpr	%l2,	0x1CB0,	%cwp
	ldx	[%l7 + 0x70],	%g4
	rdhpr	%hsys_tick_cmpr,	%i0
	sethi	0x1723,	%o1
	wr	%g1,	%i6,	%set_softint

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xA04, 	%hsys_tick_cmpr
	wr	%i2,	%o5,	%pic
	fzeros	%f0
	rd	%sys_tick_cmpr,	%o3
	wr	%g0,	0x89,	%asi
	lda	[%l7 + 0x24] %asi,	%f24
	tcc	%xcc,	0x1
	rdhpr	%htba,	%i3
	rdpr	%cwp,	%g7
	rd	%y,	%g5
	brlez	%o7,	loop_40
	rdhpr	%hsys_tick_cmpr,	%l3
	rd	%tick_cmpr,	%g6
	movvs	%icc,	%l1,	%l0
loop_40:
	mova	%xcc,	%i4,	%l5
	wr	%i1,	%g2,	%ccr
	fone	%f28
	srax	%o4,	0x1B,	%i5
	brgez	%o6,	loop_41
	edge32	%l6,	%o0,	%g3
	xor	%l2,	0x0D22,	%o2
	wrpr	%i0,	0x0CD8,	%tick
loop_41:
	rdhpr	%hintp,	%o1
	rd	%tick_cmpr,	%g4
	fnegs	%f20,	%f13
	rd	%fprs,	%g1
	rdpr	%wstate,	%i6
	wr	%i7,	%i2,	%sys_tick
	sllx	%o5,	0x01,	%o3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xCB6, 	%hsys_tick_cmpr
	rdpr	%tba,	%i3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	movneg	%xcc,	%o7,	%l3
	movle	%icc,	%g7,	%g6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	tgu	%xcc,	0x0
	wrpr	%l1,	0x13D2,	%pil
	movvc	%xcc,	%l5,	%i1
	udivcc	%g2,	0x1495,	%o4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	ld	[%l7 + 0x18],	%f8
	wrpr	%l6,	%o0,	%pil
	movre	%g3,	%l2,	%i5
	rdhpr	%htba,	%o2
	ta	%xcc,	0x4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	alignaddr	%o1,	%g4,	%i6
	rd	%fprs,	%g1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	andn	%i7,	0x03C0,	%o3
	wrpr	%l4,	%i3,	%pil
	brnz	%g5,	loop_42
	fandnot1	%f8,	%f22,	%f20
	rdhpr	%hpstate,	%o7
	rd	%pc,	%o5
loop_42:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr 	%g0, 	0x7, 	%fprs

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xACE, 	%tick_cmpr
	ldd	[%l7 + 0x58],	%f6
	andcc	%l0,	%i1,	%o4
	fmovdn	%xcc,	%f27,	%f2
	rd	%sys_tick_cmpr,	%i4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xB60, 	%sys_tick_cmpr
	wr	%o6,	%o0,	%set_softint

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xE62, 	%hsys_tick_cmpr
	rdpr	%tl,	%i5
	addccc	%o2,	%o1,	%g4
	rdhpr	%htba,	%i6
	rdhpr	%hintp,	%g1
	fcmpeq32	%f10,	%f22,	%i0
	movg	%icc,	%i2,	%i7
	rdhpr	%htba,	%o3
	te	%icc,	0x5
	fpack32	%f16,	%f16,	%f16
	movre	%l4,	0x265,	%i3
	wr	%o7,	%o5,	%softint

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x4A5, 	%hsys_tick_cmpr
	edge8	%l3,	%l1,	%g6
	wrpr	%l0,	%i1,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	tgu	%xcc,	0x0
	fcmpne16	%f22,	%f18,	%i4
	wrpr	%l6,	0x021B,	%pil
	or	%g2,	%o6,	%o0
	fbug	%fcc1,	loop_43
	rd	%y,	%g3
	wrpr	%i5,	%l2,	%cwp
	wrpr	%o1,	0x0F1B,	%cwp
loop_43:
	wrpr	%o2,	0x0186,	%cwp
	wrpr	%g4,	%i6,	%tick
	and	%g1,	%i2,	%i7
	rd	%fprs,	%i0
	rd	%sys_tick_cmpr,	%l4
	rdpr	%canrestore,	%o3
	udivcc	%i3,	0x0C52,	%o5
	rdhpr	%htba,	%g5
	brlez,a	%o7,	loop_44
	wrpr	%l3,	%l1,	%tick
	tle	%xcc,	0x1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xD77, 	%hsys_tick_cmpr
loop_44:
	rdhpr	%htba,	%l0
	rdpr	%tl,	%i1
	rd	%ccr,	%g6
	rdhpr	%hsys_tick_cmpr,	%o4
	tvc	%icc,	0x3
	rdhpr	%hintp,	%i4
	rd	%tick_cmpr,	%l5
	wr	%l6,	0x1A72,	%set_softint
	xnorcc	%o6,	%o0,	%g3
	rdhpr	%hintp,	%i5
	fandnot2s	%f25,	%f7,	%f30
	rdpr	%cleanwin,	%l2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x85E, 	%hsys_tick_cmpr
	movcs	%xcc,	%o1,	%o2
	fcmpeq32	%f6,	%f10,	%i6
	udivcc	%g1,	0x0A76,	%i2
	taddcctv	%g4,	0x17F4,	%i7
	rd	%pc,	%l4
	fbe	%fcc2,	loop_45
	fmovde	%icc,	%f14,	%f23
	or	%o3,	%i3,	%o5
	rdpr	%cwp,	%g5
loop_45:
	rd	%tick_cmpr,	%o7
	fpackfix	%f16,	%f14
	std	%f4,	[%l7 + 0x50]
	nop
	setx loop_46, %l0, %l1
	jmpl %l1, %l3
	rd	%softint,	%l1
	fnor	%f14,	%f16,	%f22
	rdpr	%wstate,	%g7
loop_46:
	rdpr	%cansave,	%l0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x67B, 	%hsys_tick_cmpr
	rd	%y,	%o4
	fmovdgu	%xcc,	%f7,	%f18
	movge	%xcc,	%i4,	%l5
	rdpr	%cansave,	%l6
	fmovsn	%icc,	%f13,	%f12
	rdhpr	%htba,	%o6
	wrpr	%o0,	%i1,	%pil
	fbl	%fcc3,	loop_47
	rd	%y,	%i5
	rdpr	%wstate,	%g3
	tge	%icc,	0x5
loop_47:
	rdpr	%cwp,	%g2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xB85, 	%hsys_tick_cmpr
	udivx	%o2,	0x009D,	%i6
	fbl,a	%fcc0,	loop_48
	smulcc	%o1,	0x12A2,	%i2
	rdhpr	%hintp,	%g1
	sll	%g4,	0x0A,	%i7
loop_48:
	rdpr	%gl,	%o3
	wrpr	%l4,	0x05C0,	%cwp
	ldsw	[%l7 + 0x6C],	%i3
	nop
	setx loop_49, %l0, %l1
	jmpl %l1, %g5
	wrpr	%o5,	%l3,	%cwp
	rd	%y,	%l1
	wr	%g7,	0x08FE,	%set_softint
loop_49:
	std	%f14,	[%l7 + 0x30]
	rdhpr	%hsys_tick_cmpr,	%l0
	wr	%g0,	0x89,	%asi
	stwa	%i0,	[%l7 + 0x40] %asi
	rd	%ccr,	%o7
	ta	%xcc,	0x1
	sdivcc	%g6,	0x14FD,	%o4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	umul	%l6,	0x16AD,	%o6
	fbl	%fcc3,	loop_50
	rdhpr	%hsys_tick_cmpr,	%o0
	add	%l7,	0x48,	%l6
	wr	%g0,	0x04,	%asi
	ldxa	[%l6] %asi,	%i1
	casxa	[%l6] %asi,	%i1,	%i5
loop_50:
	rdpr	%pil,	%g3
	bvs,pt	%icc,	loop_51
	fnors	%f30,	%f28,	%f3
	fpadd16s	%f11,	%f28,	%f19
	srax	%l5,	%l2,	%g2
loop_51:
	wrpr	%o2,	%i6,	%tick
        wr    %g0,    0xe,    %pcr    ! changed.
	wrpr	%g1,	0x0215,	%tick
	rd	%fprs,	%g4
	rdhpr	%hpstate,	%o1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xE4C, 	%tick_cmpr
	rdpr	%gl,	%l4
	rdpr	%cleanwin,	%g5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	lduh	[%l7 + 0x14],	%l3
	wr	%o5,	%l1,	%clear_softint
	rdhpr	%hpstate,	%l0
	nop
	set	0x4E, %i2
	ldstub	[%l7 + %i2],	%g7
	movcc	%icc,	%o7,	%g6
	movpos	%xcc,	%i0,	%i4
	fbl	%fcc3,	loop_52
	rdpr	%tl,	%o4
	wr	%l6,	0x133B,	%clear_softint
	rdpr	%pil,	%o6
loop_52:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x9C8, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%otherwin,	%l5
	umulcc	%g2,	%o2,	%i6
	wr 	%g0, 	0x5, 	%fprs
	rdhpr	%hintp,	%g1
	movleu	%xcc,	%g4,	%l2
	rdpr	%tba,	%o1
	rdhpr	%hsys_tick_cmpr,	%o3
	sdiv	%l4,	0x0777,	%i7
	rdpr	%cwp,	%g5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xC33, 	%hsys_tick_cmpr
	rd	%pc,	%l3
	rdpr	%cleanwin,	%l1
	rd	%asi,	%o5
	set	0x48, %l4
	lda	[%l7 + %l4] 0x81,	%f15
	movrgez	%g7,	0x06E,	%l0
	rdhpr	%hsys_tick_cmpr,	%o7
	edge8l	%g6,	%i0,	%o4
	mulscc	%i4,	0x05D3,	%l6
	smulcc	%i1,	%o6,	%g3
	wrpr	%o0,	0x04FD,	%cwp
	sdivcc	%l5,	0x03A0,	%i5
	xor	%o2,	0x097D,	%g2
	membar	0x05
	tleu	%xcc,	0x6
	fmovdneg	%icc,	%f19,	%f0
	wr	%i6,	%i2,	%clear_softint
	rd	%pc,	%g4
	movn	%xcc,	%g1,	%l2
	wr	%o3,	%l4,	%set_softint
	fnot1	%f20,	%f4
	rdhpr	%hintp,	%o1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xB92, 	%sys_tick_cmpr
	rdpr	%cleanwin,	%l3
	wr	%g5,	%o5,	%sys_tick
	array16	%g7,	%l1,	%o7
	rd	%tick_cmpr,	%g6
	rdpr	%canrestore,	%i0
	mulx	%o4,	%i4,	%l6
	rdpr	%otherwin,	%l0
	nop
	setx loop_53, %l0, %l1
	jmpl %l1, %i1
	rdhpr	%hintp,	%o6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%l5,	0x1B03,	%pic
loop_53:
	fors	%f30,	%f31,	%f17

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xCFC, 	%hsys_tick_cmpr
	taddcc	%i6,	0x1076,	%i2
	movg	%icc,	%i5,	%g1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	tge	%icc,	0x1
	wrpr	%o3,	0x197C,	%pil
	alignaddrl	%o1,	%l4,	%i7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x220, 	%tick_cmpr
	wrpr	%i3,	%o5,	%pil
	wrpr	%g7,	%l1,	%cwp
	rd	%softint,	%o7
        wr    %g0,    0xe,    %pcr    ! changed.
	rdpr	%cansave,	%o4
	rd	%softint,	%g5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xA9E, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%g0,	0x89,	%asi
	stha	%l0,	[%l7 + 0x54] %asi
	udiv	%o6,	0x1DD0,	%g3
	rdpr	%tl,	%o0
	umulcc	%l5,	%i1,	%g2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x6E1, 	%sys_tick_cmpr
	alignaddr	%i2,	%g1,	%i5
	rdpr	%tl,	%g4
	rdhpr	%hsys_tick_cmpr,	%o3
	siam	0x5
	fsrc1	%f12,	%f4
	rdpr	%cansave,	%l2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fmovrdlz	%i7,	%f18,	%f2
	std	%l2,	[%l7 + 0x48]
	rdhpr	%hpstate,	%i3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	udiv	%g7,	0x0C6B,	%l1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%o7,	0x02EB,	%cwp
	rdhpr	%hpstate,	%g6
	edge32	%o4,	%i0,	%g5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%o6,	%g3,	%tick
	rdhpr	%hsys_tick_cmpr,	%o0
        wr    %g0,    0xe,    %pcr    ! changed.
	wr	%i1,	0x09CF,	%clear_softint
	wrpr	%g2,	%l5,	%tick
	rdpr	%tba,	%i6
	rd	%y,	%o2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	st	%f29,	[%l7 + 0x44]
	rdhpr	%hintp,	%i2
	rdhpr	%htba,	%g4
	rdpr	%cleanwin,	%o3
	tcc	%icc,	0x6
	fcmpne16	%f26,	%f10,	%l2
	tsubcc	%i7,	0x1E73,	%o1
	wrpr	%i3,	%l4,	%cwp
	edge16ln	%l3,	%l1,	%o5
	edge16	%o7,	%g7,	%o4
	sdiv	%i0,	0x17D2,	%g5
	fand	%f10,	%f6,	%f18
	add	%l6,	0x004D,	%l0
	rdhpr	%hsys_tick_cmpr,	%o6
	array32	%g3,	%o0,	%i4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	popc	%g2,	%l5
	rdpr	%gl,	%g6
	sir	0x0C57
	wr	%i6,	0x1993,	%ccr
	rdhpr	%htba,	%g1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x758, 	%hsys_tick_cmpr
	rdhpr	%hintp,	%o2
	wrpr	%g4,	%o3,	%cwp
	rdpr	%cansave,	%i7
	rd	%tick_cmpr,	%o1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	tvc	%xcc,	0x4
	fmovrdlz	%l3,	%f16,	%f0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x1C0, 	%hsys_tick_cmpr
	fmovsn	%xcc,	%f3,	%f13
	rdhpr	%htba,	%o7
	movvs	%xcc,	%g7,	%o4
	fmovrdlz	%i0,	%f2,	%f8
	set	0x48, %l1
	lduwa	[%l7 + %l1] 0x19,	%l4
	rd	%tick_cmpr,	%g5
	wrpr	%l6,	0x04DB,	%pil
	wrpr	%o6,	%g3,	%pil
	add	%o0,	0x1AB1,	%i4
	edge32	%i1,	%l0,	%l5
	wrpr	%g6,	%g2,	%cwp
	fmovrslez	%i6,	%f19,	%f26

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	orcc	%i2,	0x0C31,	%i5
	rd	%tick_cmpr,	%o2
	rdpr	%otherwin,	%g4
	addcc	%o3,	%o1,	%i7
	fmul8x16al	%f28,	%f26,	%f26
	rdhpr	%hsys_tick_cmpr,	%i3
	movle	%xcc,	%l3,	%l2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x7EB, 	%sys_tick_cmpr
	wrpr	%l1,	%i0,	%cwp
	subc	%o4,	0x1B74,	%l4
	fmovrse	%g5,	%f17,	%f3
	rdhpr	%hintp,	%l6
	wrpr	%o6,	0x1EA3,	%tick
	rdhpr	%hsys_tick_cmpr,	%g3
	andncc	%i4,	%o0,	%i1
	fpadd32s	%f28,	%f22,	%f20
	rd	%ccr,	%l5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x0B8, 	%hsys_tick_cmpr
	wr	%g0,	0x19,	%asi
	stha	%i6,	[%l7 + 0x12] %asi
	bpos	loop_54
	wrpr	%g1,	0x0692,	%pil
	rd	%sys_tick_cmpr,	%i2
	rdhpr	%hintp,	%i5
loop_54:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xA89, 	%hsys_tick_cmpr
	wr	%o3,	0x1006,	%clear_softint
	rdhpr	%hsys_tick_cmpr,	%o1
	nop
	setx loop_55, %l0, %l1
	jmpl %l1, %i7
	fmovspos	%xcc,	%f22,	%f8
	rdpr	%pil,	%i3
	wrpr	%o2,	%l2,	%pil
loop_55:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x213, 	%hsys_tick_cmpr
	srax	%g7,	0x15,	%l1
	rd	%ccr,	%i0
	rdpr	%gl,	%o4
	rdpr	%wstate,	%l4
	wr	%o7,	0x19B9,	%set_softint
	fbue	%fcc0,	loop_56
	fmovsne	%xcc,	%f28,	%f24
	wrpr	%g5,	%o6,	%tick
	wr	%l6,	0x05BC,	%ccr
loop_56:
	rd	%tick_cmpr,	%i4
	rdhpr	%hintp,	%o0
	rdhpr	%hpstate,	%i1
	alignaddrl	%l5,	%l0,	%g6
	wr	%g3,	%i6,	%y
	wr	%i2,	%g1,	%ccr
	rdhpr	%hpstate,	%g2
	addcc	%g4,	%i5,	%o3
	tne	%icc,	0x7
	fnors	%f23,	%f16,	%f23
	rdpr	%tba,	%o1
	movle	%icc,	%i7,	%i3
	fmovrdlez	%o2,	%f24,	%f16
	rdhpr	%hpstate,	%l3
	bl,a,pt	%icc,	loop_57
	wr	%l2,	%g7,	%pic
	tle	%icc,	0x6
	fcmple16	%f8,	%f30,	%l1
loop_57:
	tgu	%xcc,	0x2
	fnor	%f18,	%f16,	%f18
	xnor	%i0,	0x0F43,	%o4
	ldstub	[%l7 + 0x27],	%l4
	edge32	%o5,	%g5,	%o7
	fcmple32	%f24,	%f26,	%o6
	fmovrdgez	%i4,	%f4,	%f0
	rdhpr	%hintp,	%l6
	wrpr	%i1,	%l5,	%tick
	alignaddr	%l0,	%o0,	%g3
	wrpr	%i6,	0x09B7,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%i2,	%g1,	%ccr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xDD7, 	%hsys_tick_cmpr
	wrpr	%o3,	0x097E,	%pil
	wrpr	%o1,	0x1113,	%cwp
	udivx	%i7,	0x04FE,	%g4
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
	wr	%i3,	0x0504,	%pic
	edge16n	%o2,	%l2,	%g7
	wr	%l3,	0x1C23,	%pic
loop_58:
	bpos,a	loop_59
	brgez,a	%i0,	loop_60
	wr	%o4,	0x1081,	%softint
	fmovrdlez	%l4,	%f4,	%f0
loop_59:
        wr    %g0,    0xe,    %pcr    ! changed.
loop_60:
	fcmple32	%f28,	%f10,	%g5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xD9F, 	%hsys_tick_cmpr
	rd	%ccr,	%o7
	stb	%l6,	[%l7 + 0x71]
	tsubcctv	%i4,	0x0D89,	%i1
	fmovrsgez	%l0,	%f11,	%f5
	rdpr	%gl,	%l5
	wr 	%g0, 	0x4, 	%fprs
	array32	%o0,	%i6,	%g6
	rdhpr	%hsys_tick_cmpr,	%i2
	wr	%g1,	0x00FB,	%y
	wrpr	%i5,	%g2,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	edge32n	%g4,	%i3,	%o1
	andcc	%l2,	0x196F,	%g7
	ldd	[%l7 + 0x70],	%f18
	wrpr	%o2,	%i0,	%tick
	wrpr	%o4,	%l3,	%tick
	rdhpr	%hsys_tick_cmpr,	%l4
	xnor	%g5,	%o5,	%o6
	fmovdleu	%icc,	%f9,	%f24
        wr    %g0,    0xe,    %pcr    ! changed.
	rd	%asi,	%l6
	brz,a	%i4,	loop_61
	wr	%i1,	%l0,	%pic
	fbu,a	%fcc0,	loop_62
	rd	%softint,	%l5
loop_61:
	rdhpr	%hintp,	%o0
	fmovsneg	%xcc,	%f19,	%f7
loop_62:
	rdhpr	%hpstate,	%i6
	movleu	%xcc,	%g3,	%i2
	movneg	%icc,	%g6,	%g1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x34A, 	%hsys_tick_cmpr
	wr	%o3,	0x167A,	%pic
	wr	%g2,	0x11ED,	%softint
	smul	%g4,	%i3,	%o1
	wrpr	%l2,	%g7,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x3F0, 	%hsys_tick_cmpr
	tl	%icc,	0x7
	rdpr	%cwp,	%o2
	wr	%i0,	%o4,	%clear_softint

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%l3,	%o5,	%sys_tick
	wr	%o6,	%o7,	%ccr
	bpos	%xcc,	loop_63
	wrpr	%l1,	%l6,	%tick
	rdpr	%tba,	%i4
	umulcc	%g5,	0x03EB,	%i1
loop_63:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x2CC, 	%sys_tick_cmpr
	rdhpr	%htba,	%l0
	fmovdn	%icc,	%f20,	%f17
	movrlez	%i6,	%g3,	%o0
	fpsub32	%f30,	%f18,	%f6
	rdhpr	%htba,	%i2
	rdpr	%tl,	%g1
	fbo	%fcc3,	loop_64
	rdpr	%pil,	%i5
	wr 	%g0, 	0x5, 	%fprs
	fbne	%fcc3,	loop_65
loop_64:
	subccc	%g6,	%g4,	%g2
	rdpr	%tba,	%o1
	rd	%sys_tick_cmpr,	%l2
loop_65:
	nop
	set	0x2D, %l6
	ldsba	[%l7 + %l6] 0x10,	%i3
	wrpr	%g7,	%o2,	%cwp
	alignaddr	%i7,	%o4,	%l4
	wrpr	%l3,	%o5,	%cwp
	nop
	set	0x16, %g2
	lduh	[%l7 + %g2],	%i0
	sth	%o7,	[%l7 + 0x4E]
	tn	%icc,	0x0
	alignaddrl	%o6,	%l1,	%l6
	movrgez	%i4,	%i1,	%g5
	rdhpr	%hsys_tick_cmpr,	%l5
	wrpr	%i6,	0x1A42,	%tick
	wr 	%g0, 	0x5, 	%fprs
	wrpr	%o0,	0x011B,	%tick
	rdhpr	%hintp,	%g1
	wr	%i2,	%i5,	%softint
	rdhpr	%hsys_tick_cmpr,	%g6
	wr	%g4,	0x105E,	%clear_softint
	fmovrdgz	%g2,	%f16,	%f14
	addc	%o3,	0x01A7,	%l2
	rdpr	%pil,	%o1
	popc	0x059D,	%i3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	subccc	%o2,	0x15D5,	%i7
	wrpr	%o4,	0x012F,	%pil
	fmovsg	%icc,	%f0,	%f8
	fones	%f16
	movle	%icc,	%l4,	%o5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	set	0x74, %i0
	ldswa	[%l7 + %i0] 0x19,	%i0
	fandnot2	%f24,	%f20,	%f28
	wrpr	%o6,	0x1558,	%tick
	fmovscc	%xcc,	%f19,	%f28
	rd	%softint,	%l1
	edge32n	%l6,	%i1,	%g5
	rd	%sys_tick_cmpr,	%l5
	wrpr	%i6,	0x1659,	%tick
	rd	%asi,	%i4
	ldsb	[%l7 + 0x13],	%l0
        wr    %g0,    0xe,    %pcr    ! changed.
	std	%f20,	[%l7 + 0x68]
	rdpr	%gl,	%g3
	lduw	[%l7 + 0x4C],	%g1
	movvc	%xcc,	%i5,	%g6
	rdhpr	%hintp,	%i2
	sdivcc	%g4,	0x17BD,	%o3
	rdpr	%gl,	%l2
	sdiv	%g2,	0x1E2F,	%o1
	wrpr	%i3,	%o2,	%pil
	bg	%xcc,	loop_66
	rd	%asi,	%g7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	array16	%l4,	%o4,	%l3
loop_66:
	sdivcc	%o7,	0x1DA4,	%o5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	bne	%icc,	loop_67
	move	%xcc,	%l6,	%o6
	mulscc	%g5,	%i1,	%i6
	membar	0x34
loop_67:
	rd	%ccr,	%i4
	array16	%l0,	%l5,	%g3
	rdpr	%canrestore,	%o0
	wr	%g1,	%i5,	%clear_softint

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x2E5, 	%hsys_tick_cmpr
	movge	%xcc,	%i2,	%o3
	edge16n	%g4,	%l2,	%o1
	andn	%g2,	0x1665,	%o2
	rdpr	%tl,	%g7
	rdhpr	%hintp,	%i7
	tge	%icc,	0x7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	rdhpr	%hpstate,	%i3
	tvs	%xcc,	0x4
	fcmpne32	%f24,	%f28,	%o7
	rd	%y,	%l3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xFAF, 	%hsys_tick_cmpr
	wrpr	%l6,	%i0,	%cwp
	rd	%y,	%g5
	rd	%ccr,	%o6
	rdpr	%cansave,	%i6
	fbge,a	%fcc2,	loop_68
	sdiv	%i1,	0x14AF,	%l0
	addc	%i4,	%g3,	%o0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x0F3, 	%hsys_tick_cmpr
loop_68:
	tsubcc	%g1,	%g6,	%i5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xC89, 	%hsys_tick_cmpr
        wr    %g0,    0xe,    %pcr    ! changed.
	fcmps	%fcc3,	%f29,	%f21
	orncc	%o1,	%i2,	%g2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	taddcctv	%g7,	0x09CF,	%l4
	subcc	%o4,	%o7,	%i3
	rdpr	%otherwin,	%o5
	movgu	%xcc,	%l3,	%l6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x38B, 	%hsys_tick_cmpr
	rdpr	%tba,	%g5
	rd	%y,	%i0
	array16	%i6,	%i1,	%o6
	tg	%icc,	0x3
	fbue,a	%fcc0,	loop_69
	xnorcc	%l0,	0x0CB3,	%g3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x76E, 	%hsys_tick_cmpr
	wr	%i4,	0x1112,	%softint
loop_69:
        wr    %g0,    0xe,    %pcr    ! changed.
	swap	[%l7 + 0x38],	%l5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xE9D, 	%hsys_tick_cmpr
	umulcc	%i5,	%l2,	%g4
	rdpr	%gl,	%i2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x994, 	%hsys_tick_cmpr
	orncc	%i7,	0x0DD9,	%g2
	fblg,a	%fcc2,	loop_70
	rdhpr	%hintp,	%l4
	orn	%g7,	%o4,	%i3
	movcc	%icc,	%o5,	%o7
loop_70:
	movleu	%icc,	%l6,	%l3
	rdhpr	%htba,	%g5
	rdhpr	%hsys_tick_cmpr,	%l1
	lduh	[%l7 + 0x5E],	%i0
	wrpr	%i6,	0x0603,	%pil
	brnz,a	%o6,	loop_71
	wrpr	%l0,	0x02AA,	%tick
	wrpr	%g3,	%i1,	%cwp
	rd	%ccr,	%i4
loop_71:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	movle	%xcc,	%g1,	%g6
	wr	%l5,	0x12BD,	%pic

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x6E5, 	%hsys_tick_cmpr
	bgu,pt	%icc,	loop_72
	rd	%fprs,	%l2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x919, 	%hsys_tick_cmpr
	edge16n	%i2,	%o1,	%i7
loop_72:
	nop
	set	0x24, %o3
	stba	%o2,	[%l7 + %o3] 0x80
	wrpr	%l4,	%g2,	%pil
	rdpr	%tl,	%o4
	wrpr	%i3,	%o5,	%pil
	taddcc	%g7,	%o7,	%l6
	rdpr	%otherwin,	%l3
	lduw	[%l7 + 0x38],	%g5
	rdhpr	%hintp,	%i0
	rd	%asi,	%i6
	sdivx	%l1,	0x15BF,	%o6
	wrpr	%l0,	0x0460,	%pil
	rd	%pc,	%g3
	fsrc1	%f0,	%f2
	fbge,a	%fcc1,	loop_73
	rdhpr	%htba,	%i1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movvs	%icc,	%i4,	%o0
loop_73:
	rdhpr	%hsys_tick_cmpr,	%g6
	rd	%asi,	%l5
	wr	%g1,	0x1ED0,	%clear_softint
	wrpr	%i5,	%l2,	%pil
	wr	%g4,	%o3,	%y
	wrpr	%i2,	0x1EE8,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	sllx	%l4,	0x03,	%g2
        wr    %g0,    0xe,    %pcr    ! changed.
	rdpr	%tba,	%o5
	wr	%g0,	0x18,	%asi
	lduba	[%l7 + 0x7C] %asi,	%g7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x258, 	%hsys_tick_cmpr
	wr	%g0,	0x19,	%asi
	lduwa	[%l7 + 0x58] %asi,	%o4
	rd	%sys_tick_cmpr,	%l3
	rdhpr	%hsys_tick_cmpr,	%l6
	wr	%g0,	0x10,	%asi
	sta	%f4,	[%l7 + 0x58] %asi
	fble	%fcc1,	loop_74
	rd	%tick_cmpr,	%g5
	rdpr	%pil,	%i6
	wrpr	%l1,	%o6,	%pil
loop_74:
	rdpr	%cleanwin,	%i0
	sdivx	%g3,	0x14F5,	%i1
	rdhpr	%hsys_tick_cmpr,	%l0
	fmovsvs	%icc,	%f18,	%f6
	set	0x18, %o7
	lduha	[%l7 + %o7] 0x18,	%i4
	movneg	%xcc,	%o0,	%g6
	wrpr	%g1,	0x074A,	%pil
	rd	%pc,	%i5
	fmovdge	%xcc,	%f30,	%f30
	addc	%l5,	%g4,	%o3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	sth	%i2,	[%l7 + 0x08]
	add	%o2,	%l4,	%i7
	wr	%i3,	%g2,	%set_softint
	mova	%icc,	%o5,	%o7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x64] %asi,	%l3
	rd	%fprs,	%l6
	wr	%o4,	%i6,	%y
	alignaddrl	%l1,	%g5,	%o6
	fbul,a	%fcc1,	loop_75
	xnorcc	%i0,	%g3,	%i1
	movrlez	%i4,	0x10A,	%o0
	movrgez	%l0,	0x2FE,	%g1
loop_75:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x08D, 	%sys_tick_cmpr
	wr	%g4,	0x0696,	%y
	rdpr	%canrestore,	%i5
	popc	%o3,	%l2
	set	0x4C, %i5
	ldsba	[%l7 + %i5] 0x88,	%o1
	rdpr	%wstate,	%i2
	rdpr	%pil,	%o2
	rdhpr	%hsys_tick_cmpr,	%i7
	taddcctv	%l4,	%g2,	%o5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	addccc	%i3,	0x15DC,	%g7
	sdivx	%l6,	0x1740,	%l3
	alignaddrl	%o4,	%l1,	%g5
	rdpr	%wstate,	%i6
	tl	%xcc,	0x1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xCBC, 	%hsys_tick_cmpr
	rdhpr	%htba,	%g3
	sdivx	%i1,	0x025D,	%i0
	rd	%ccr,	%o0
	rdhpr	%htba,	%l0
	fpsub32	%f22,	%f12,	%f24
	fmovse	%xcc,	%f31,	%f27

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xFF8, 	%hsys_tick_cmpr
	rdpr	%canrestore,	%i4
	fpsub32	%f12,	%f0,	%f22
	wrpr	%g6,	0x10FA,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	membar	0x79
	std	%i4,	[%l7 + 0x10]
	rd	%asi,	%g4
	rdhpr	%hintp,	%l2
	wrpr	%o1,	%i2,	%cwp
	wrpr	%o2,	0x1E65,	%pil
	edge16	%o3,	%l4,	%i7
	wrpr	%o5,	%o7,	%pil
	rd	%y,	%i3
	sllx	%g2,	0x08,	%l6
	rdpr	%otherwin,	%l3
	wrpr	%o4,	0x0993,	%cwp
	nop
	set	0x0E, %o6
	stb	%l1,	[%l7 + %o6]
	rdhpr	%htba,	%g7
	xnorcc	%g5,	%i6,	%g3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x21B, 	%hsys_tick_cmpr
	rdhpr	%hintp,	%i0
	movrlz	%l0,	%g1,	%i4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	ldub	[%l7 + 0x1D],	%g6
	movgu	%icc,	%i5,	%l5
	array8	%l2,	%g4,	%o1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fmul8sux16	%f8,	%f14,	%f12

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x398, 	%sys_tick_cmpr
	rd	%ccr,	%o3
	andn	%o5,	%i7,	%o7
	rdpr	%cansave,	%g2
	rdpr	%cleanwin,	%l6
	edge8	%i3,	%l3,	%o4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movgu	%xcc,	%g7,	%g5
	wr	%l1,	0x01E1,	%set_softint
	sub	%g3,	%i6,	%o6
	sdivcc	%i1,	0x0611,	%l0
	rdpr	%cleanwin,	%i0
	rd	%sys_tick_cmpr,	%g1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%asi,	%o0
	wr	%i5,	%l5,	%set_softint
	rd	%softint,	%g4
	fnegd	%f16,	%f26
	rdhpr	%htba,	%l2
	edge32ln	%o1,	%i2,	%o2
	wrpr	%l4,	0x1B9E,	%cwp
	rdhpr	%hintp,	%o3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xAEC, 	%hsys_tick_cmpr
	rdhpr	%htba,	%o5
	movne	%icc,	%g2,	%o7
	wrpr	%l6,	%i3,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x9FA, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x719, 	%hsys_tick_cmpr
	wrpr	%g3,	%i6,	%pil
	st	%f15,	[%l7 + 0x20]
	tcc	%xcc,	0x0
	fpackfix	%f14,	%f27
	stbar
	wrpr	%l1,	0x1D10,	%pil
	fcmpes	%fcc1,	%f16,	%f21
	andcc	%o6,	%i1,	%i0
	fbl,a	%fcc1,	loop_76
	sub	%g1,	%i4,	%l0
	wrpr	%o0,	0x0FB2,	%tick
	rdpr	%otherwin,	%i5
loop_76:
	rd	%softint,	%l5
	move	%xcc,	%g4,	%l2
	wrpr	%g6,	0x0650,	%pil
	smul	%i2,	0x17ED,	%o2
	rd	%asi,	%o1
	wr	%l4,	%o3,	%sys_tick
	mulscc	%i7,	%g2,	%o5
	edge32l	%l6,	%i3,	%o7
	wr	%l3,	%g7,	%set_softint
	rdhpr	%hsys_tick_cmpr,	%g5
	wr	%o4,	0x1F2B,	%pic
	rdpr	%tba,	%i6
	xor	%g3,	%o6,	%l1
	rd	%asi,	%i0
	xor	%g1,	%i1,	%l0
	taddcc	%o0,	0x056F,	%i4
	wrpr	%l5,	0x0E66,	%cwp
	rdhpr	%htba,	%i5
	add	%l7,	0x28,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%g4
	casxa	[%l6] %asi,	%g4,	%l2
	rd	%asi,	%g6
	rd	%pc,	%i2
	wr 	%g0, 	0x7, 	%fprs

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fmovdg	%xcc,	%f18,	%f31
	rdpr	%pil,	%i7
	rd	%y,	%g2
	rdpr	%cansave,	%o5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xFFA, 	%hsys_tick_cmpr
	rdhpr	%hpstate,	%i3
	sra	%o7,	%l3,	%g7
	wrpr	%g5,	0x048C,	%pil
	rd	%fprs,	%o4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	edge8n	%o3,	%o6,	%g3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16	%l1,	%g1,	%i0
	rd	%asi,	%l0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%softint,	%i4
	rd	%asi,	%l5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x4EB, 	%sys_tick_cmpr
	ldsw	[%l7 + 0x18],	%g6
	xorcc	%i5,	%o1,	%l4
	addcc	%i2,	%o2,	%i7
	edge16n	%g2,	%o5,	%i3
	subccc	%o7,	%l3,	%l6
	wrpr	%g7,	0x0552,	%pil
	wr	%g5,	0x1DD1,	%sys_tick
	edge8	%o4,	%o3,	%i6
	mulx	%g3,	0x1CF1,	%o6
	rdhpr	%hintp,	%l1
	set	0x3C, %g3
	ldswa	[%l7 + %g3] 0x18,	%i0
	tge	%xcc,	0x1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x10C, 	%hsys_tick_cmpr
	wr	%i1,	%o0,	%clear_softint
	ldsw	[%l7 + 0x44],	%i4
	wrpr	%l5,	0x0C1E,	%tick
	movvs	%icc,	%g1,	%g4
	udiv	%l2,	0x0B91,	%g6
	wr	%i5,	%l4,	%sys_tick
	fba,a	%fcc1,	loop_77
	movrlez	%i2,	0x326,	%o1
	fxnor	%f22,	%f8,	%f22
	brgz	%i7,	loop_78
loop_77:
	rdhpr	%hintp,	%g2
	rd	%ccr,	%o5
	array8	%o2,	%i3,	%o7
loop_78:
	rdpr	%pil,	%l6
	rdhpr	%hpstate,	%l3
	rd	%asi,	%g7
	wrpr	%o4,	0x1E8A,	%tick
	membar	0x4C

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xC9A, 	%hsys_tick_cmpr
	smul	%i6,	0x07CB,	%g5
	ldsb	[%l7 + 0x7C],	%g3
	rdhpr	%hintp,	%o6
	orncc	%i0,	0x079C,	%l0
	wrpr	%i1,	0x19E6,	%cwp
	wrpr	%l1,	0x05C2,	%pil
	rdpr	%otherwin,	%o0
	wr	%l5,	%i4,	%set_softint
	srax	%g4,	%g1,	%g6
	rdpr	%cansave,	%i5
	ba,a	%icc,	loop_79
	ldsh	[%l7 + 0x5E],	%l4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	movpos	%xcc,	%i7,	%l2
loop_79:
	brgez,a	%o5,	loop_80
	rdpr	%canrestore,	%o2
	rdhpr	%hintp,	%g2
	wrpr	%i3,	0x0035,	%cwp
loop_80:
	wr 	%g0, 	0x5, 	%fprs
	rd	%sys_tick_cmpr,	%l3
	rdpr	%wstate,	%g7
	wr	%o4,	0x1975,	%clear_softint
	rdpr	%gl,	%o3
	rdhpr	%hsys_tick_cmpr,	%o7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%hsys_tick_cmpr,	%g3
	rdhpr	%hintp,	%i0
	rd	%softint,	%o6
	rd	%asi,	%i1
	wr	%l0,	0x0018,	%set_softint
	wrpr	%l1,	%o0,	%cwp
	andn	%l5,	%i4,	%g1
	swap	[%l7 + 0x40],	%g6
	movpos	%xcc,	%i5,	%l4
	rdhpr	%hpstate,	%g4
	wr	%i2,	%i7,	%clear_softint
	rd	%pc,	%l2
	sll	%o5,	%o2,	%g2
	fmovrde	%o1,	%f0,	%f18

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%l3,	0x090A,	%pil
	tneg	%xcc,	0x5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x4EC, 	%hsys_tick_cmpr
	rdhpr	%hpstate,	%o3
	xnor	%g7,	0x0A4B,	%o7
	tg	%xcc,	0x5
	tl	%xcc,	0x1
	rdpr	%canrestore,	%i6
	wr	%g5,	0x130E,	%softint
	rdpr	%otherwin,	%g3
	tsubcctv	%o6,	%i0,	%l0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x033, 	%hsys_tick_cmpr
	rd	%asi,	%l5
	bcs	loop_81
	fmovse	%xcc,	%f19,	%f14
	rdpr	%cwp,	%i4
	edge32n	%g1,	%l1,	%g6
loop_81:
	rdpr	%canrestore,	%l4
	rdpr	%cwp,	%i5
	tg	%icc,	0x5
	tn	%xcc,	0x4
	movleu	%xcc,	%g4,	%i7
	fcmps	%fcc1,	%f31,	%f26
	rd	%ccr,	%i2
	wr	%l2,	%o5,	%y
	rdpr	%tl,	%o2
	wrpr	%o1,	0x185F,	%tick
	wrpr	%g2,	%i3,	%pil
	edge32ln	%l3,	%o4,	%l6
	fsrc2s	%f10,	%f1
	rdpr	%pil,	%o3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%g0,	0x18,	%asi
	stda	%o6,	[%l7 + 0x38] %asi
	rd	%tick_cmpr,	%g3
	rdpr	%gl,	%g5
	wr	%o6,	%l0,	%softint
	wrpr	%i0,	0x10DE,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x02E, 	%hsys_tick_cmpr
	set	0x76, %i7
	ldsha	[%l7 + %i7] 0x80,	%l5
	fble	%fcc2,	loop_82
	wr	%i4,	%i1,	%ccr
	fnands	%f6,	%f2,	%f17
	alignaddrl	%l1,	%g1,	%g6
loop_82:
	rdhpr	%hsys_tick_cmpr,	%l4
	rdpr	%canrestore,	%g4
	fnors	%f1,	%f19,	%f18
	wr	%i7,	0x1B6C,	%ccr
	wr	%i2,	%l2,	%clear_softint
	rdpr	%canrestore,	%o5
	tg	%xcc,	0x5
	wr	%o2,	0x1DAC,	%pic
	wr	%i5,	%g2,	%sys_tick
	edge8	%i3,	%l3,	%o4
	tneg	%xcc,	0x7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x15D, 	%hsys_tick_cmpr
	rdhpr	%hpstate,	%o3
	edge16n	%o1,	%g7,	%i6
	edge16n	%o7,	%g3,	%o6
	wrpr	%l0,	%g5,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%hpstate,	%o0
	edge8	%i4,	%l5,	%l1
	fnot1	%f24,	%f12
	rdhpr	%htba,	%g1
	fblg	%fcc0,	loop_83
	wr	%i1,	%l4,	%clear_softint

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	subc	%i7,	0x1C29,	%g4
loop_83:
	alignaddrl	%i2,	%o5,	%o2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xAE9, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	sethi	0x0F62,	%i3
	add	%l7,	0x40,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] %asi,	%g2,	%l3
	sra	%o4,	0x05,	%o3
	wr	%g0,	0x88,	%asi
	ldstuba	[%l7 + 0x32] %asi,	%l6
	and	%g7,	0x138B,	%o1
	bn,a,pn	%xcc,	loop_84
	bge,a,pt	%icc,	loop_85
	rd	%sys_tick_cmpr,	%o7
	rdpr	%tba,	%g3
loop_84:
	fmul8x16au	%f30,	%f28,	%f8
loop_85:
	edge16	%i6,	%o6,	%g5
	wrpr	%i0,	%o0,	%cwp
	fnot2s	%f5,	%f26
	set	0x52, %g5
	ldstuba	[%l7 + %g5] 0x18,	%i4
	rdpr	%cansave,	%l0
	rdhpr	%hintp,	%l5
	edge32l	%g1,	%i1,	%l1
	rd	%pc,	%l4
	rdpr	%tba,	%i7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xB1D, 	%hsys_tick_cmpr
	fbuge,a	%fcc2,	loop_86
	fpsub16s	%f4,	%f24,	%f25
	rd	%ccr,	%i2
	and	%g4,	0x0670,	%o5
loop_86:
	xnor	%i5,	%l2,	%o2
	rdpr	%canrestore,	%g2
        wr    %g0,    0xe,    %pcr    ! changed.
	rdpr	%canrestore,	%o3
	rdpr	%wstate,	%o4
	array16	%g7,	%o1,	%o7
	movrgez	%l6,	0x09B,	%i6
	wr	%g0,	0xe3,	%asi
	stwa	%o6,	[%l7 + 0x28] %asi
	membar	#Sync
	rdpr	%tl,	%g3
	rdhpr	%hsys_tick_cmpr,	%i0
	rd	%sys_tick_cmpr,	%g5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	movcc	%icc,	%l0,	%l5
	wrpr	%o0,	%g1,	%tick
	brgez,a	%i1,	loop_87
	fpackfix	%f24,	%f12
	umulcc	%l1,	0x014E,	%i7
	rd	%tick_cmpr,	%l4
loop_87:
	fbule,a	%fcc3,	loop_88
	rd	%y,	%i2
	edge16ln	%g6,	%g4,	%i5
	tvs	%xcc,	0x3
loop_88:
	rd	%sys_tick_cmpr,	%o5
	rdpr	%cansave,	%o2
	rdpr	%tba,	%g2
	fpackfix	%f18,	%f20

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	edge16n	%o3,	%l3,	%o4
	xnor	%o1,	%o7,	%l6
	rdpr	%canrestore,	%i6
	rd	%asi,	%g7
	tne	%xcc,	0x5
	fmovdvs	%xcc,	%f19,	%f9
	sdivx	%o6,	0x1D77,	%g3
	fmovsvs	%xcc,	%f15,	%f1
	fmovsg	%icc,	%f20,	%f21
	tcs	%xcc,	0x1
	bvc	loop_89
	wrpr	%g5,	0x0C46,	%cwp
	movcs	%icc,	%i0,	%l0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xDA6, 	%hsys_tick_cmpr
loop_89:
	wr 	%g0, 	0x5, 	%fprs
	rdhpr	%hintp,	%i1
	sth	%l1,	[%l7 + 0x24]
	movre	%l5,	%l4,	%i2
	srax	%i7,	0x1D,	%g6
	tvs	%xcc,	0x7
	fmovsg	%xcc,	%f2,	%f15
	wrpr	%i5,	0x0255,	%tick
	addc	%o5,	%g4,	%g2
	rdhpr	%htba,	%i3
        wr    %g0,    0xe,    %pcr    ! changed.
	sllx	%l2,	0x1D,	%o3
	rdhpr	%hpstate,	%o4
	sth	%o1,	[%l7 + 0x60]
	wrpr	%l3,	0x0416,	%tick
	wr	%l6,	0x0875,	%clear_softint
	rdpr	%gl,	%o7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%fprs,	%o6
	addcc	%g3,	0x0E9C,	%g7
	mova	%xcc,	%i0,	%l0
	wrpr	%g5,	%o0,	%pil
	movg	%icc,	%g1,	%i1
	stb	%l1,	[%l7 + 0x57]
	rdpr	%tba,	%l5
	wr	%l4,	%i2,	%pic
	addcc	%i7,	0x15C5,	%g6
	fandnot2	%f2,	%f8,	%f20
	rd	%pc,	%i5
	rdhpr	%htba,	%o5
	rdhpr	%hsys_tick_cmpr,	%g4
	fbule,a	%fcc1,	loop_90
	taddcc	%i4,	%g2,	%o2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%i3,	%o4,	%tick
loop_90:
	movpos	%xcc,	%o1,	%l6
	wrpr	%l3,	0x1EFD,	%pil
	ldub	[%l7 + 0x3C],	%o7
	subccc	%i6,	%g3,	%o6
	rdhpr	%hpstate,	%i0
	fpmerge	%f25,	%f22,	%f22
	movrne	%l0,	0x1D1,	%g7
	srlx	%g5,	%o0,	%i1
	movgu	%xcc,	%g1,	%l1
	fcmps	%fcc1,	%f20,	%f19
	wrpr	%l4,	0x174C,	%cwp
	wrpr	%l5,	%i2,	%cwp
	fpmerge	%f4,	%f8,	%f16
	rd	%ccr,	%g6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x4D6, 	%hsys_tick_cmpr
	subc	%g4,	%i7,	%i4
	edge16ln	%g2,	%l2,	%o3
	rd	%asi,	%o2
	fbuge	%fcc2,	loop_91
	rdhpr	%hintp,	%i3
	wrpr	%o4,	0x1025,	%cwp
	movl	%icc,	%o1,	%l3
loop_91:
	srax	%l6,	0x05,	%i6
	rdhpr	%hintp,	%o7
	rdpr	%tba,	%g3
	tsubcctv	%o6,	0x19A1,	%i0
	edge32ln	%g7,	%g5,	%o0
	ldstub	[%l7 + 0x6A],	%l0
	wrpr	%g1,	%i1,	%pil
	rdpr	%wstate,	%l1
	wrpr	%l4,	0x1150,	%tick
	taddcc	%l5,	%g6,	%i2
	be,pt	%xcc,	loop_92
	edge16l	%o5,	%i5,	%i7
	fmovdvs	%xcc,	%f7,	%f13
	rdpr	%otherwin,	%g4
loop_92:
	wrpr	%i4,	0x1D32,	%tick
	rdpr	%tba,	%l2
	rdpr	%tba,	%g2
	set	0x60, %g7
	stwa	%o3,	[%l7 + %g7] 0xe3
	membar	#Sync
	umulcc	%i3,	0x0E36,	%o2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x58E, 	%hsys_tick_cmpr
	fsrc2	%f14,	%f22
	fcmpgt32	%f0,	%f12,	%l6
	rd	%sys_tick_cmpr,	%i6
	subc	%o7,	%o1,	%o6
	rdpr	%tba,	%i0
	wrpr	%g7,	%g3,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	edge32l	%g1,	%l0,	%l1
	rdpr	%tba,	%l4
	rdhpr	%hintp,	%l5
	tne	%icc,	0x1
	wrpr	%i1,	0x17AF,	%cwp
	stb	%i2,	[%l7 + 0x0F]
	umulcc	%g6,	%i5,	%i7
	movg	%icc,	%o5,	%i4
	rdhpr	%hintp,	%g4
	wrpr	%l2,	%o3,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	smul	%o2,	%o4,	%l3
	rdhpr	%htba,	%i3
	andcc	%l6,	0x195A,	%i6
	fandnot2s	%f24,	%f6,	%f12
	wrpr	%o1,	%o7,	%pil
	fbue	%fcc1,	loop_93
	sdivcc	%o6,	0x1D4E,	%g7
	wrpr	%i0,	%g3,	%pil
	wr 	%g0, 	0x5, 	%fprs
loop_93:
	movrgz	%g1,	%l0,	%l4
	wr	%l5,	%i1,	%y
	fmovdleu	%xcc,	%f13,	%f9
	fbge	%fcc3,	loop_94
	tleu	%icc,	0x5
	wr	%l1,	0x024E,	%y
	udivcc	%g6,	0x0CE7,	%i2
loop_94:
	wr	%i7,	0x147C,	%set_softint
	fmovdne	%icc,	%f26,	%f15

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x584, 	%hsys_tick_cmpr
	wrpr	%o5,	%g4,	%pil
	sra	%l2,	%o3,	%o2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x1C9, 	%hsys_tick_cmpr
	wrpr	%l3,	0x19CB,	%pil
	rdpr	%tba,	%l6
	movre	%i3,	%o1,	%i6
	brlez,a	%o7,	loop_95
	fpsub16	%f14,	%f8,	%f24
	wr	%g7,	0x0014,	%ccr
	fmul8ulx16	%f22,	%f18,	%f10
loop_95:
	tvs	%icc,	0x5
	rdpr	%canrestore,	%o6
	xnorcc	%i0,	0x06A3,	%g3
	movleu	%icc,	%o0,	%g1
	wr	%g5,	%l4,	%set_softint
	udivx	%l5,	0x0AE2,	%i1
	rdpr	%cleanwin,	%l1
	fbul,a	%fcc1,	loop_96
	bpos,a,pt	%icc,	loop_97
	rd	%sys_tick_cmpr,	%g6
	movn	%xcc,	%i2,	%i7
loop_96:
        wr    %g0,    0xe,    %pcr    ! changed.
loop_97:
	wr	%i4,	0x0617,	%softint
	rdhpr	%htba,	%g4
	wr	%g0,	0x04,	%asi
	ldstuba	[%l7 + 0x57] %asi,	%l2
	rd	%ccr,	%o3
	wrpr	%o5,	0x0FAE,	%tick
	rdhpr	%hpstate,	%o2
	orn	%g2,	%o4,	%l6
	bneg,pt	%xcc,	loop_98
	alignaddrl	%l3,	%o1,	%i3
	fone	%f26
	andncc	%i6,	%g7,	%o6
loop_98:
	udivx	%o7,	0x0ECA,	%g3
	wr	%i0,	0x1AAF,	%ccr
	sdivcc	%o0,	0x0E3E,	%g1
	rd	%y,	%l4
	rd	%y,	%l5
	rdpr	%tba,	%i1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xFDD, 	%hsys_tick_cmpr
	tvs	%xcc,	0x4
	wrpr	%l1,	%g6,	%cwp
	addc	%i2,	%i7,	%l0
	set	0x40, %o1
	ldda	[%l7 + %o1] 0xd0,	%f0
	rd	%y,	%i5
	rdhpr	%hsys_tick_cmpr,	%g4
	ble,a,pn	%xcc,	loop_99
	rdhpr	%hpstate,	%l2
	wr	%o3,	%i4,	%set_softint
	bvc	loop_100
loop_99:
	rd	%ccr,	%o5
	brz,a	%g2,	loop_101
	rdhpr	%hsys_tick_cmpr,	%o2
loop_100:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xA31, 	%hsys_tick_cmpr
	rdhpr	%hpstate,	%l6
loop_101:
	rdhpr	%hintp,	%o1
	move	%xcc,	%i6,	%g7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x21E, 	%hsys_tick_cmpr
	rdhpr	%hpstate,	%g3
	nop
	set	0x42, %o2
	ldsh	[%l7 + %o2],	%i3
	xor	%o0,	%i0,	%g1
	std	%l4,	[%l7 + 0x48]
	xnor	%i1,	0x1087,	%g5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x27C, 	%hsys_tick_cmpr
	rdhpr	%hpstate,	%l1
	ldd	[%l7 + 0x40],	%f2
	rdpr	%wstate,	%i2
	rdpr	%cansave,	%g6
	srax	%l0,	0x13,	%i5
	wrpr	%i7,	%l2,	%tick
	rdhpr	%htba,	%g4
	edge16ln	%i4,	%o5,	%o3
	movrgz	%o2,	%g2,	%o4
	movre	%l3,	%l6,	%o1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x0A2, 	%hsys_tick_cmpr
	wr	%g7,	%o6,	%sys_tick
	wr	%g3,	0x0E0D,	%pic
	wr 	%g0, 	0x6, 	%fprs

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xC9F, 	%tick_cmpr
	rd	%ccr,	%i0
	umulcc	%l5,	%g5,	%l4
	andn	%i1,	%i2,	%g6
	wr	%l0,	0x1FEF,	%pic
	xorcc	%l1,	%i7,	%i5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x91A, 	%hsys_tick_cmpr
	fmovspos	%xcc,	%f29,	%f2
	fmovdgu	%icc,	%f22,	%f0
	smulcc	%i4,	%g4,	%o5
	rdpr	%wstate,	%o2
	rdhpr	%hintp,	%g2
	rdpr	%otherwin,	%o3
	rdpr	%wstate,	%o4
	alignaddrl	%l6,	%o1,	%l3
	rdpr	%cleanwin,	%g7
	rd	%asi,	%i6
	fabsd	%f4,	%f0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbl	%fcc3,	loop_102
	rdpr	%canrestore,	%o6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xFF6, 	%tick_cmpr
	orcc	%o0,	0x1BE4,	%o7
loop_102:
	wr	%g1,	0x1879,	%sys_tick
	fbul,a	%fcc1,	loop_103
	rdpr	%cleanwin,	%i0
	wrpr	%l5,	0x06FD,	%cwp
	movrlez	%g5,	0x032,	%g3
loop_103:
	rdpr	%pil,	%l4
	membar	0x3F
	tpos	%icc,	0x7
	movvc	%xcc,	%i1,	%i2
	rdhpr	%hpstate,	%g6
	rdpr	%tba,	%l1
	wrpr	%i7,	%l0,	%pil
	fcmpgt16	%f20,	%f18,	%l2
	wr	%i4,	%i5,	%clear_softint

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xA3C, 	%hsys_tick_cmpr
	wrpr	%g4,	0x02F8,	%tick
	ta	%xcc,	0x0
	andcc	%g2,	0x1BD5,	%o2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fcmple32	%f24,	%f20,	%l6
	rdpr	%gl,	%o3
	membar	0x4B
	wrpr	%l3,	0x12D4,	%tick
	rd	%asi,	%g7
	tsubcc	%o1,	%i6,	%i3
	udivcc	%o6,	0x04E1,	%o7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	add	%l7,	0x54,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] %asi,	%i0,	%o0
	rd	%tick_cmpr,	%g5
	andcc	%g3,	0x10E2,	%l5
	rdhpr	%hsys_tick_cmpr,	%l4
	brz,a	%i2,	loop_104
	wrpr	%i1,	%g6,	%tick
	wrpr	%l1,	%i7,	%tick
	rdhpr	%htba,	%l2
loop_104:
	rdpr	%cwp,	%i4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	mulscc	%o5,	0x0AF7,	%g4
	wr	%o2,	%o4,	%sys_tick
	wr	%g2,	0x058C,	%clear_softint
	rdpr	%gl,	%o3
	rdpr	%tl,	%l6
	lduh	[%l7 + 0x60],	%g7
	wrpr	%o1,	%i6,	%tick
	wr	%l3,	%i3,	%softint

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x261, 	%hsys_tick_cmpr
	rdhpr	%hsys_tick_cmpr,	%g1
	rd	%ccr,	%i0
	wr	%g5,	0x166B,	%clear_softint
	sdivcc	%o0,	0x09C3,	%g3
	rd	%ccr,	%l4
	rdhpr	%hintp,	%l5
	rdpr	%cleanwin,	%i1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x376, 	%hsys_tick_cmpr
	fabsd	%f6,	%f30
	fbne	%fcc1,	loop_105
	tcc	%icc,	0x6
	rd	%sys_tick_cmpr,	%l1
	smulcc	%i7,	0x08C1,	%g6
loop_105:
	rdpr	%cleanwin,	%i4
	orncc	%i5,	0x0B21,	%l0
	fmovrdlz	%l2,	%f14,	%f4
	movpos	%icc,	%o5,	%o2
	fcmpd	%fcc1,	%f14,	%f4
	rd	%tick_cmpr,	%o4
	rdpr	%cansave,	%g4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x97B, 	%hsys_tick_cmpr
	rd	%pc,	%g7
	rd	%sys_tick_cmpr,	%o1
	fcmpgt32	%f26,	%f10,	%o3
	rdpr	%cleanwin,	%l3
	fbuge,a	%fcc0,	loop_106
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	rd	%tick_cmpr,	%i3
	wrpr	%o6,	0x1111,	%pil
loop_106:
	edge16n	%o7,	%i6,	%i0
	and	%g5,	0x168C,	%o0
	rdpr	%otherwin,	%g1
	rdpr	%tba,	%g3
	movrgz	%l4,	%l5,	%i1
	fcmpeq16	%f30,	%f4,	%i2
	wrpr	%i7,	%l1,	%pil
	wrpr	%i4,	0x03D8,	%tick
	wr	%i5,	0x03E0,	%sys_tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	prefetch	[%l7 + 0x34],	 0x3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	movcc	%icc,	%o2,	%l0
	wrpr	%g4,	%o4,	%cwp
	orn	%l6,	%g2,	%o1
	wrpr	%g7,	0x0213,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	bg,a	%icc,	loop_107
	movrgez	%l3,	0x00C,	%i3
	movneg	%icc,	%o7,	%o6
	fmovde	%xcc,	%f5,	%f0
loop_107:
	rd	%y,	%i0
        wr    %g0,    0xe,    %pcr    ! changed.

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	smulcc	%g3,	0x0859,	%l4
	membar	#Sync
	set	0x40, %i6
	ldda	[%l7 + %i6] 0x16,	%f16
	movrlez	%i1,	%l5,	%i2
	wr	%i7,	0x191B,	%y
	rdhpr	%hsys_tick_cmpr,	%l1
	mova	%icc,	%i5,	%i4
	edge16	%l2,	%g6,	%o5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xB39, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x667, 	%hsys_tick_cmpr
	fsrc2s	%f13,	%f20

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x910, 	%hsys_tick_cmpr
	rdhpr	%hsys_tick_cmpr,	%g2
	rdpr	%tba,	%o1
	rd	%y,	%l6
	rd	%tick_cmpr,	%g7
	movleu	%icc,	%l3,	%i3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fcmpeq16	%f12,	%f10,	%o7
        wr    %g0,    0xe,    %pcr    ! changed.
	wr	%i6,	%o0,	%clear_softint
	mulx	%g1,	0x0242,	%g5
	fmovdn	%icc,	%f0,	%f27
	rd	%sys_tick_cmpr,	%l4
	rdpr	%wstate,	%g3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xE8C, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%pil,	%l1
	std	%f24,	[%l7 + 0x08]
	wr	%i2,	0x1D52,	%ccr
	ldsb	[%l7 + 0x79],	%i4
	fbo	%fcc0,	loop_108
	rdhpr	%htba,	%i5
	fmovsl	%xcc,	%f25,	%f19
	rdhpr	%htba,	%l2
loop_108:
	rd	%y,	%g6
	wrpr	%o5,	0x0F0F,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xFEB, 	%hsys_tick_cmpr
	wrpr	%g4,	0x0340,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x994, 	%hsys_tick_cmpr
	wrpr	%g2,	%o1,	%tick
	edge8n	%g7,	%l3,	%l6
	nop
	setx loop_109, %l0, %l1
	jmpl %l1, %i3
	brlz,a	%o3,	loop_110
	mulscc	%o7,	%o6,	%i6
	subcc	%i0,	0x1B2F,	%o0
loop_109:
	rdhpr	%hpstate,	%g5
loop_110:
	ldx	[%l7 + 0x60],	%l4
	tl	%xcc,	0x5
	rdpr	%pil,	%g1
	wrpr	%g3,	%l5,	%pil
	movcs	%xcc,	%i7,	%i1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x959, 	%hsys_tick_cmpr
	edge8n	%i2,	%i5,	%l2
	rdhpr	%hintp,	%g6
	rd	%tick_cmpr,	%o5
	fxnor	%f16,	%f10,	%f28
	set	0x68, %i1
	prefetcha	[%l7 + %i1] 0x14,	 0x0
	wrpr	%l0,	%g4,	%pil
	udivcc	%i4,	0x02B3,	%g2
	rd	%sys_tick_cmpr,	%o4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x3E4, 	%hsys_tick_cmpr
	movcc	%xcc,	%o1,	%l6
	mulscc	%i3,	%l3,	%o3
	add	%o7,	0x10BB,	%i6
	rdhpr	%htba,	%o6
	fbge,a	%fcc2,	loop_111
	wrpr	%i0,	%o0,	%tick
	tne	%xcc,	0x5
	rdpr	%cleanwin,	%l4
loop_111:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	movrlz	%g1,	0x072,	%l5
	wrpr	%i1,	0x0484,	%cwp
	wr	%g0,	0x26,	%asi
	ldda	[%l7 + 0x10] %asi,	%l0
	wrpr	%i2,	0x1EEA,	%tick
	wr	%i5,	0x1FB4,	%ccr
	movvc	%xcc,	%i7,	%l2
	array32	%g6,	%o5,	%o2
	nop
	setx loop_112, %l0, %l1
	jmpl %l1, %l0
	rd	%asi,	%g4
	tl	%xcc,	0x0
	rd	%softint,	%i4
loop_112:
	fnot2s	%f17,	%f9
        wr    %g0,    0xe,    %pcr    ! changed.
	wrpr	%g2,	%l6,	%cwp
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	rdhpr	%htba,	%i3
	movneg	%xcc,	%l3,	%o1
	wr	%o7,	0x0C5D,	%y
	rdpr	%wstate,	%i6
	ldd	[%l7 + 0x50],	%o2
	fble	%fcc2,	loop_113
	ble	loop_114
	rd	%fprs,	%o6
	fmovdcc	%icc,	%f25,	%f5
loop_113:
	rdpr	%wstate,	%o0
loop_114:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	stx	%g3,	[%l7 + 0x50]
	fbul	%fcc2,	loop_115
	sdiv	%g1,	0x1244,	%l5
	fnor	%f2,	%f14,	%f14
	rdhpr	%hsys_tick_cmpr,	%i1
loop_115:
	rdpr	%gl,	%i0
	rd	%asi,	%l1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	edge8l	%i7,	%l2,	%g6
	fmovsleu	%icc,	%f9,	%f2
	rd	%pc,	%o2
	wrpr	%o5,	0x1404,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%cwp,	%i4
	rdpr	%gl,	%o4
	and	%l0,	0x1CC1,	%g7
	fmovdg	%xcc,	%f20,	%f5
	wrpr	%l6,	0x05C2,	%cwp
	sllx	%g2,	%i3,	%l3
	rdpr	%pil,	%o1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x145, 	%hsys_tick_cmpr
	rdhpr	%hsys_tick_cmpr,	%o3
	rd	%sys_tick_cmpr,	%o0
	rdpr	%cwp,	%g5
	wr	%g3,	0x07F9,	%softint
	wr	%g1,	%l5,	%pic
	be	%icc,	loop_116
	rd	%ccr,	%l4
	fmovscs	%xcc,	%f4,	%f10
	wr	%i1,	%l1,	%y
loop_116:
	rdpr	%otherwin,	%i2
	rd	%ccr,	%i0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%l2,	0x114B,	%tick
	fmovrslez	%o2,	%f10,	%f8
	wrpr	%g6,	%g4,	%pil
	wr	%o5,	%i4,	%set_softint
	tleu	%icc,	0x0
	wr	%g0,	0x04,	%asi
	swapa	[%l7 + 0x34] %asi,	%o4
	wrpr	%g7,	%l6,	%tick
	edge8ln	%l0,	%i3,	%l3
	fmul8x16au	%f9,	%f6,	%f30
	tleu	%icc,	0x1
	wrpr	%g2,	0x17EC,	%pil
	subcc	%o1,	0x0547,	%o7
	wr	%o6,	%o3,	%ccr
	wrpr	%i6,	%o0,	%cwp
	mulscc	%g5,	0x0378,	%g1
	wr	%l5,	%g3,	%set_softint
	rdpr	%tl,	%l4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	subcc	%i2,	0x1410,	%i1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x3EA, 	%hsys_tick_cmpr
	addc	%i7,	0x0E03,	%i5
	rdhpr	%hintp,	%o2
	or	%l2,	%g6,	%g4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	ldd	[%l7 + 0x48],	%o4
	fmovrdgz	%g7,	%f0,	%f22
	or	%l0,	0x1CD5,	%i3
	rdpr	%tba,	%l6
	srlx	%g2,	%o1,	%l3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x437, 	%hsys_tick_cmpr
	rd	%sys_tick_cmpr,	%o3
	tcs	%icc,	0x1
	tg	%xcc,	0x3
	wrpr	%i6,	%o0,	%cwp
	fmovdle	%icc,	%f19,	%f14
	wrpr	%g5,	%o6,	%pil
	rd	%y,	%l5
	rd	%fprs,	%g3
	orncc	%l4,	%g1,	%i2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	wr	%l1,	0x1993,	%y
	bl,a	%xcc,	loop_117
	st	%f27,	[%l7 + 0x2C]
	tge	%icc,	0x3
	wr	%g0,	0xd9,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
loop_117:
	nop
	set	0x30, %l0
	stwa	%i7,	[%l7 + %l0] 0x27
	membar	#Sync
	rdpr	%tba,	%i0
	rdpr	%pil,	%o2
	rdpr	%canrestore,	%l2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%o5,	%i4,	%set_softint
	rd	%tick_cmpr,	%o4
	tl	%xcc,	0x7
	brz,a	%g7,	loop_118
	ble,a	%xcc,	loop_119
	umul	%g4,	%i3,	%l6
	ldsw	[%l7 + 0x38],	%l0
loop_118:
	rdpr	%cleanwin,	%o1
loop_119:
	fmovsne	%icc,	%f7,	%f20
	wrpr	%l3,	0x136D,	%cwp
	rd	%pc,	%o7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	subcc	%o0,	%g5,	%o6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x47F, 	%hsys_tick_cmpr
	tge	%icc,	0x2
	fcmpeq16	%f12,	%f12,	%l4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x05C, 	%hsys_tick_cmpr
	move	%icc,	%i2,	%g3
	fsrc2	%f18,	%f18
	andn	%i1,	0x0000,	%l1
	ldx	[%l7 + 0x40],	%i7
	tn	%icc,	0x6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x4BE, 	%hsys_tick_cmpr
	wr	%g6,	0x1F71,	%set_softint
	wrpr	%o5,	0x1606,	%cwp
	and	%i4,	%o4,	%g4
	addc	%i3,	0x1AEE,	%g7
	fmovsvc	%xcc,	%f29,	%f20

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	srax	%l3,	%o7,	%g2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	sllx	%o0,	0x07,	%g5
	fpadd32s	%f6,	%f12,	%f16
	rdhpr	%hsys_tick_cmpr,	%l6
	fbug,a	%fcc1,	loop_120
	rdhpr	%hpstate,	%o3
	rd	%fprs,	%o6
	rdpr	%cleanwin,	%l4
loop_120:
	rdpr	%cansave,	%l5
	edge16	%g1,	%i2,	%i1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%canrestore,	%i7
	rdpr	%wstate,	%i0
	rdpr	%wstate,	%g3
	rdpr	%wstate,	%l2
	sdiv	%i5,	0x1C5F,	%o2
	rdpr	%cleanwin,	%g6
	rd	%y,	%i4
	rd	%asi,	%o4
	wrpr	%o5,	0x110F,	%pil
	wrpr	%i3,	%g4,	%pil
	wrpr	%l0,	%o1,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%y,	%o7
	wr	%g0,	0x18,	%asi
	lduha	[%l7 + 0x28] %asi,	%g2
	wrpr	%i6,	%o0,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%hpstate,	%g5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x5A3, 	%hsys_tick_cmpr
	fbug,a	%fcc0,	loop_121
	fbge,a	%fcc1,	loop_122
	rd	%tick_cmpr,	%l4
	set	0x32, %o4
	lduha	[%l7 + %o4] 0x81,	%l5
loop_121:
	wrpr	%i2,	%g1,	%tick
loop_122:
	wrpr	%l1,	%i1,	%tick
	wrpr	%i7,	0x053C,	%tick
	rdpr	%pil,	%i0
	tsubcctv	%l2,	%i5,	%g3
	fors	%f6,	%f0,	%f9
	rdhpr	%htba,	%o2
	wrpr	%i4,	0x0181,	%cwp
	rdpr	%canrestore,	%g6
	fmovda	%icc,	%f13,	%f17

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xCC9, 	%hsys_tick_cmpr
	rdhpr	%htba,	%i3
	wrpr	%o4,	0x1942,	%tick
	brgz	%g4,	loop_123
	tsubcc	%l0,	%l3,	%g7
	fbul	%fcc2,	loop_124
	brgz,a	%o1,	loop_125
loop_123:
	wr	%o7,	0x16DC,	%sys_tick
	wr	%g2,	%o0,	%clear_softint
loop_124:
	rdhpr	%hintp,	%i6
loop_125:
	addccc	%l6,	0x18E9,	%o6
	wrpr	%g5,	%l4,	%cwp
	alignaddrl	%o3,	%l5,	%i2
	wrpr	%g1,	0x04BD,	%tick
	rdpr	%gl,	%i1
	rdhpr	%hsys_tick_cmpr,	%i7
	movrgz	%i0,	%l2,	%i5
	fands	%f22,	%f23,	%f23
	wr	%g0,	0x19,	%asi
	stda	%g2,	[%l7 + 0x20] %asi
	andncc	%o2,	%i4,	%l1
	fxor	%f6,	%f20,	%f16
	sll	%o5,	%g6,	%i3
	rdpr	%pil,	%g4
	sir	0x1BCF
	rdhpr	%hintp,	%o4
	fxnor	%f14,	%f6,	%f26
	wr	%l3,	%l0,	%clear_softint
	movvc	%xcc,	%g7,	%o1
	wr	%g0,	0x89,	%asi
	lduwa	[%l7 + 0x54] %asi,	%o7
	sir	0x1BE5
	be	loop_126
	rd	%tick_cmpr,	%o0
	smul	%g2,	0x0271,	%i6
	wr	%o6,	0x0921,	%clear_softint
loop_126:
        wr    %g0,    0xe,    %pcr    ! changed.
	sir	0x1F01
	fornot1s	%f22,	%f3,	%f5
	rdhpr	%hintp,	%l6
	rd	%pc,	%l4
	rdhpr	%hpstate,	%l5
	wr	%o3,	0x1313,	%set_softint
	fmovscc	%xcc,	%f20,	%f2
	fbg	%fcc0,	loop_127
	rdpr	%canrestore,	%i2
	edge32n	%g1,	%i7,	%i1
	rd	%fprs,	%l2
loop_127:
	xorcc	%i0,	%g3,	%o2
	wr	%i4,	%i5,	%softint

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%cwp,	%l1
	rd	%asi,	%i3
	wrpr	%o4,	0x000D,	%cwp
	rd	%tick_cmpr,	%l3
	rdpr	%tl,	%l0
	edge16	%g4,	%g7,	%o7
	wr	%o0,	0x0F00,	%ccr
	rdpr	%pil,	%o1
	for	%f22,	%f6,	%f0
	brnz	%i6,	loop_128
	edge8l	%g2,	%o6,	%l6
	wr	%g5,	0x177A,	%pic

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_128:
	fpadd32s	%f18,	%f8,	%f5
	wr	%g0,	0x88,	%asi
	lduwa	[%l7 + 0x1C] %asi,	%l5
	rdpr	%cansave,	%i2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xF6B, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%g0,	0x10,	%asi
	lduha	[%l7 + 0x4C] %asi,	%l2
	movne	%xcc,	%i0,	%g3
	rdhpr	%hpstate,	%i4
	rd	%sys_tick_cmpr,	%o2
	andcc	%i5,	%o5,	%g6
	fmovsleu	%xcc,	%f13,	%f16
	edge32ln	%i3,	%o4,	%l1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fnand	%f8,	%f30,	%f16
	rd	%pc,	%g7
	fpadd16	%f10,	%f10,	%f24
	wr	%g4,	%o0,	%clear_softint
	fbn	%fcc1,	loop_129
	movre	%o7,	%o1,	%i6
	array32	%o6,	%g2,	%l6
	wr 	%g0, 	0x5, 	%fprs
loop_129:
	edge32ln	%l4,	%l5,	%i2
	movleu	%icc,	%g1,	%i7
	or	%l2,	%i1,	%i0
	wrpr	%i4,	0x0EB8,	%tick
	fblg,a	%fcc1,	loop_130
	movgu	%xcc,	%o2,	%g3
	rdhpr	%htba,	%i5
	fpmerge	%f22,	%f20,	%f6
loop_130:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	tgu	%xcc,	0x4
	st	%f14,	[%l7 + 0x3C]
	rdhpr	%htba,	%o5
	rd	%tick_cmpr,	%o4
	rdpr	%otherwin,	%l1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x440, 	%hsys_tick_cmpr
	rdhpr	%hpstate,	%l3
	fble,a	%fcc1,	loop_131
	wr	%g4,	%g7,	%set_softint
	fmovscc	%xcc,	%f17,	%f18
	andn	%o0,	0x0974,	%o7
loop_131:
	addccc	%o1,	%o6,	%g2
	rd	%pc,	%l6
	rd	%sys_tick_cmpr,	%i6
	rdpr	%tl,	%g5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xB42, 	%hsys_tick_cmpr
	rd	%softint,	%o3
	movcc	%icc,	%i2,	%g1
	fmuld8sux16	%f18,	%f31,	%f6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x907, 	%sys_tick_cmpr
	rdhpr	%hpstate,	%i1
	udivx	%i7,	0x09F8,	%i0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x640, 	%tick_cmpr
	set	0x10, %g1
	prefetcha	[%l7 + %g1] 0x11,	 0x3
	wrpr	%i5,	0x17F6,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%o4,	0x19C5,	%tick
	rdpr	%tba,	%l1
	nop
	set	0x40, %o0
	ldsw	[%l7 + %o0],	%i3
	std	%f18,	[%l7 + 0x60]
	edge16	%o5,	%l3,	%g4
	wr	%g7,	0x15F8,	%set_softint
	wrpr	%o0,	0x1C33,	%tick
	wr	%o7,	%l0,	%clear_softint
	array8	%o6,	%g2,	%l6
	addc	%o1,	%i6,	%g5
	fbo	%fcc3,	loop_132
	sdivx	%l5,	0x1FB8,	%o3
	mulscc	%i2,	%l4,	%g1
	lduh	[%l7 + 0x08],	%l2
loop_132:
	wr	%i1,	0x0038,	%set_softint
	lduh	[%l7 + 0x22],	%i0
	fornot2s	%f28,	%f13,	%f11
	movpos	%icc,	%i4,	%i7
	rdpr	%cansave,	%o2
	rdhpr	%hsys_tick_cmpr,	%g3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xA81, 	%hsys_tick_cmpr
	rdhpr	%hintp,	%o4
	wr	%i3,	0x07D5,	%pic
	wrpr	%o5,	%l1,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	set	0x70, %i3
	stda	%g4,	[%l7 + %i3] 0x14
	rd	%asi,	%o0
	wr	%g7,	0x1313,	%set_softint
	bg,a,pt	%icc,	loop_133
	ta	%icc,	0x7
	rdpr	%cwp,	%l0
	rd	%tick_cmpr,	%o6
loop_133:
	fzero	%f2
	wr	%o7,	%g2,	%clear_softint
	brz,a	%o1,	loop_134
	and	%i6,	0x1382,	%l6
	rdpr	%otherwin,	%l5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xED3, 	%sys_tick_cmpr
loop_134:
	ble,a,pn	%icc,	loop_135
	popc	0x0054,	%g5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tvs	%icc,	0x1
loop_135:
	rd	%y,	%i2
	movcs	%xcc,	%g1,	%l2
	rdpr	%tl,	%i1
	movvs	%xcc,	%i0,	%l4
	wrpr	%i7,	%i4,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	ba,a,pt	%xcc,	loop_136
	wrpr	%o2,	0x1323,	%pil
	tsubcctv	%g6,	%i5,	%o4
	tle	%xcc,	0x2
loop_136:
	fmovrslz	%i3,	%f18,	%f9
	lduh	[%l7 + 0x74],	%l1
	rdhpr	%hintp,	%o5
	rd	%pc,	%g4
	rdpr	%tba,	%l3
	wr	%g7,	%o0,	%y
	nop
	setx	loop_137,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	rd	%sys_tick_cmpr,	%o6
	rd	%fprs,	%l0
	ba,pn	%icc,	loop_138
loop_137:
	or	%g2,	%o1,	%o7
	wr	%i6,	0x0C28,	%clear_softint
	subccc	%l5,	0x16B2,	%o3
loop_138:
	rdpr	%cwp,	%g5
	bcs,pt	%xcc,	loop_139
	wrpr	%i2,	%l6,	%pil
	rdpr	%tba,	%l2
	rd	%y,	%g1
loop_139:
	nop
	set	0x5C, %g6
	lduha	[%l7 + %g6] 0x80,	%i1
	rdhpr	%hsys_tick_cmpr,	%l4
	ta	%icc,	0x1
	rd	%y,	%i0
	move	%xcc,	%i7,	%i4
	rdhpr	%hsys_tick_cmpr,	%g3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	lduw	[%l7 + 0x1C],	%o4
	rdpr	%otherwin,	%g6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%cleanwin,	%l1
	wr	%g4,	0x13B7,	%sys_tick
	wrpr	%o5,	0x1D30,	%cwp
	wrpr	%l3,	%g7,	%cwp
	wrpr	%o6,	0x0833,	%cwp
	wrpr	%o0,	%l0,	%tick
	alignaddr	%g2,	%o7,	%o1
	sdiv	%l5,	0x089B,	%o3
	array32	%g5,	%i6,	%l6
	wr	%i2,	0x0E25,	%ccr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x8EB, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x153, 	%hsys_tick_cmpr
	smul	%i1,	%l4,	%i0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x937, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	orncc	%i5,	0x1288,	%g6
	fbne,a	%fcc1,	loop_140
	bg,a,pn	%xcc,	loop_141
	std	%o4,	[%l7 + 0x58]
	fmovdcs	%icc,	%f24,	%f25
loop_140:
	movge	%icc,	%i3,	%g4
loop_141:
	rdpr	%otherwin,	%o5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xEC0, 	%hsys_tick_cmpr
	ble,a,pn	%xcc,	loop_142
	tcc	%xcc,	0x0
	sir	0x17D9

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x89A, 	%hsys_tick_cmpr
loop_142:
	rdpr	%cwp,	%l0
	sdivx	%o6,	0x190F,	%g2
	movcc	%xcc,	%o1,	%l5
	rd	%tick_cmpr,	%o7
	rdpr	%cleanwin,	%o3
	fpadd16s	%f11,	%f31,	%f3
	movrlez	%i6,	0x2DB,	%l6
	alignaddr	%g5,	%l2,	%i2
	rdpr	%otherwin,	%g1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xF44, 	%hsys_tick_cmpr
	wrpr	%i0,	%l4,	%tick
	ldsb	[%l7 + 0x24],	%g3
	wr	%i4,	0x1673,	%pic
	fnands	%f25,	%f1,	%f14
	rd	%softint,	%i7
	edge16l	%o2,	%i5,	%o4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fsrc2	%f20,	%f10
	rdpr	%tl,	%g6
	rd	%ccr,	%o5
	wrpr	%l3,	0x1A16,	%cwp
	nop
	set	0x1C, %l2
	lduw	[%l7 + %l2],	%g7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x65F, 	%hsys_tick_cmpr
	wrpr	%o6,	%g2,	%cwp
	srlx	%l0,	0x1E,	%o1
	edge8n	%o7,	%l5,	%o3
	mulx	%l6,	0x1512,	%i6
	movrlz	%l2,	%g5,	%i2
	rdpr	%pil,	%g1
	rdpr	%wstate,	%i0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%g3,	0x0E52,	%pil
	edge8	%i4,	%i7,	%i5
	fmovse	%xcc,	%f6,	%f7
	tneg	%xcc,	0x3
	fmovsneg	%xcc,	%f1,	%f31
	rd	%ccr,	%o4
	fbg	%fcc2,	loop_143
	fpack16	%f26,	%f1
	wr	%i3,	0x16CD,	%clear_softint
	fxnors	%f16,	%f11,	%f1
loop_143:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x32B, 	%hsys_tick_cmpr
	fmul8ulx16	%f24,	%f8,	%f18
	rdpr	%wstate,	%g6
	wr	%g7,	%l3,	%set_softint
	rdpr	%tl,	%l1
	tcc	%xcc,	0x6
	te	%icc,	0x7
	fbul	%fcc0,	loop_144
	wr	%o0,	%o6,	%set_softint

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x79A, 	%hsys_tick_cmpr
	rdhpr	%htba,	%o1
loop_144:
	nop
	wr	%g0,	0x19,	%asi
	stxa	%o7,	[%l7 + 0x18] %asi
	wrpr	%l5,	%o3,	%tick
	ta	%icc,	0x6
	rd	%fprs,	%g2
	array32	%i6,	%l6,	%l2
	rd	%pc,	%g5
	rdhpr	%hsys_tick_cmpr,	%g1
	movn	%icc,	%i2,	%i0
	movrgz	%i1,	0x385,	%l4
	call	loop_145
	rd	%pc,	%i4
	fbu,a	%fcc3,	loop_146
	rd	%y,	%g3
loop_145:
	rdhpr	%htba,	%i5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x838, 	%hsys_tick_cmpr
loop_146:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%o4,	%g6,	%pil
	orcc	%o5,	0x1B2F,	%g7
	wrpr	%l3,	0x1ECE,	%tick
	fmovsneg	%icc,	%f7,	%f24
	rdpr	%tl,	%l1
	sra	%o6,	%g4,	%l0
	tcc	%xcc,	0x2
	rd	%asi,	%o1
	rdpr	%otherwin,	%o7
	rdhpr	%htba,	%o0
	sll	%o3,	%g2,	%l5
	fandnot2s	%f26,	%f6,	%f11

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	mulscc	%i6,	%l2,	%g5
	nop
	setx	loop_147,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	edge32l	%g1,	%i0,	%i2
	fmovdne	%xcc,	%f5,	%f1
	fble,a	%fcc2,	loop_148
loop_147:
	wrpr	%i1,	0x1336,	%cwp
	tgu	%icc,	0x6
	rdpr	%wstate,	%i4
loop_148:
	or	%l4,	0x1B2B,	%i5
	fones	%f19
	wr	%g3,	0x13AD,	%softint
	be	loop_149
	movl	%xcc,	%i7,	%o2
	rd	%fprs,	%o4
	ld	[%l7 + 0x2C],	%f16
loop_149:
	fabsd	%f4,	%f4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	sllx	%o5,	0x0A,	%g7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x009, 	%hsys_tick_cmpr
	rdhpr	%hpstate,	%o6
	movcc	%xcc,	%g4,	%l0
	rdhpr	%htba,	%o1
	fcmpgt16	%f22,	%f30,	%o7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xD99, 	%sys_tick_cmpr
	rdhpr	%hsys_tick_cmpr,	%g2
	edge16l	%l5,	%l6,	%l3
	sdivx	%l2,	0x1074,	%g5
	rd	%asi,	%i6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	movvc	%xcc,	%i2,	%i0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xDAA, 	%hsys_tick_cmpr
	wr	%l4,	0x1C57,	%sys_tick
	rdhpr	%htba,	%i5
	wr	%g3,	%i7,	%pic
	sth	%o4,	[%l7 + 0x2C]
	rd	%asi,	%i3
	add	%l7,	0x20,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%g6
	casxa	[%l6] 0x89,	%g6,	%o2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x43D, 	%hsys_tick_cmpr
	movre	%l1,	%g7,	%g4
	wrpr	%l0,	%o1,	%tick
	array8	%o6,	%o0,	%o3
	taddcctv	%g2,	%l5,	%o7
	rdpr	%tba,	%l6
	wrpr	%l2,	0x146E,	%pil
	wrpr	%l3,	0x0367,	%cwp
	rdpr	%cwp,	%i6
	tpos	%icc,	0x5
	rdhpr	%hintp,	%g5
	movrgz	%i2,	0x0CF,	%g1
	rd	%y,	%i4
	fbg	%fcc0,	loop_150
	smul	%i1,	%i0,	%i5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%o4,	%i3,	%sys_tick
loop_150:
	bvs,a,pn	%icc,	loop_151
	taddcctv	%g6,	%i7,	%o5
	subccc	%l1,	0x0143,	%g7
	rdhpr	%hintp,	%g4
loop_151:
	nop
	membar	#Sync
	wr	%g0,	0x16,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x9F8, 	%hsys_tick_cmpr
	rdpr	%pil,	%o2
	rd	%softint,	%o6
	bl,a,pt	%xcc,	loop_152
	rdpr	%tba,	%o0
	rd	%softint,	%o3
	movvc	%icc,	%o1,	%g2
loop_152:
	tpos	%xcc,	0x6
	rdhpr	%hpstate,	%l5
	wrpr	%l6,	0x0248,	%tick
	wrpr	%o7,	0x0CC0,	%pil
	rdhpr	%hpstate,	%l3
	rd	%pc,	%i6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xBA4, 	%hsys_tick_cmpr
	rd	%softint,	%g5
	fabss	%f22,	%f19
	rdhpr	%hsys_tick_cmpr,	%g1
	movpos	%icc,	%i4,	%i2
	fcmpgt16	%f24,	%f16,	%i0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x67C, 	%hsys_tick_cmpr
	fmovrdgz	%g3,	%f30,	%f26
	sll	%i1,	0x17,	%l4
	wrpr	%i3,	0x083E,	%cwp
	wrpr	%g6,	0x1EA4,	%tick
	rdpr	%pil,	%i7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	sir	0x07CC
	rdpr	%canrestore,	%g7
	be,a	loop_153
	bgu,pt	%icc,	loop_154
	rd	%pc,	%g4
	rd	%pc,	%l0
loop_153:
	tne	%xcc,	0x3
loop_154:
	rdpr	%canrestore,	%l1
	movn	%icc,	%o6,	%o0
	wrpr	%o2,	%o1,	%pil
	movrne	%g2,	%l5,	%l6
	wrpr	%o7,	0x0365,	%tick
	fble,a	%fcc2,	loop_155
	rdhpr	%htba,	%l3
	wrpr	%i6,	%l2,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_155:
        wr    %g0,    0xe,    %pcr    ! changed.
	orncc	%i0,	0x1CFC,	%i5
	fmovd	%f28,	%f18
	edge8	%g3,	%i2,	%i1
	wr	%i3,	%l4,	%pic
	subccc	%g6,	0x0A8D,	%o5
	rdhpr	%hsys_tick_cmpr,	%i7
	umulcc	%g7,	%g4,	%l0
	rd	%y,	%l1
	rdhpr	%hsys_tick_cmpr,	%o4
	tvs	%icc,	0x1
	array16	%o0,	%o6,	%o1
	rdpr	%pil,	%o2
	faligndata	%f22,	%f12,	%f28
	rd	%softint,	%l5
	rd	%ccr,	%g2
	bge	%icc,	loop_156
	rdpr	%cansave,	%l6
	wr	%g0,	0x18,	%asi
	ldxa	[%l7 + 0x78] %asi,	%o7
loop_156:
	wrpr	%l3,	0x09AE,	%cwp
	wrpr	%i6,	%g5,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	move	%icc,	%l2,	%g1
	and	%i4,	%i5,	%g3
	rdpr	%cleanwin,	%i0
	movge	%icc,	%i1,	%i2
	sdiv	%l4,	0x0059,	%g6
	rdhpr	%hpstate,	%o5
	rdpr	%tl,	%i7
	rdpr	%tba,	%i3
	wrpr	%g7,	0x05CD,	%pil
	wr	%g0,	0x18,	%asi
	lduwa	[%l7 + 0x4C] %asi,	%g4
	rdhpr	%hintp,	%l1
	tneg	%xcc,	0x0
	wrpr	%o4,	%o0,	%cwp
	rdpr	%tba,	%o6
	wr	%l0,	0x0A92,	%y
	sdivcc	%o1,	0x18D2,	%l5
	lduw	[%l7 + 0x10],	%g2
	fbge	%fcc2,	loop_157
	fabsd	%f16,	%f18
	tcc	%xcc,	0x4
	wr	%l6,	%o7,	%set_softint
loop_157:
	rdpr	%canrestore,	%l3
	umulcc	%o2,	%g5,	%i6
	wrpr	%l2,	0x1B4E,	%tick
	ldx	[%l7 + 0x68],	%g1
	rd	%fprs,	%i4
	rdhpr	%htba,	%i5
	rdhpr	%htba,	%g3
	rdpr	%canrestore,	%i0
	fmuld8ulx16	%f12,	%f21,	%f16
	wr	%o3,	%i1,	%ccr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x3E9, 	%hsys_tick_cmpr
	rd	%sys_tick_cmpr,	%g6
	wrpr	%i2,	%o5,	%pil
	tgu	%icc,	0x7
	wr	%i7,	%g7,	%clear_softint
	rdpr	%canrestore,	%g4
	rdhpr	%hintp,	%l1
	sethi	0x0B0C,	%o4
	rd	%asi,	%o0
	edge8ln	%i3,	%l0,	%o1
	fornot2	%f8,	%f2,	%f4
	rdpr	%wstate,	%l5
	addccc	%o6,	%g2,	%l6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x868, 	%hsys_tick_cmpr
	fbge,a	%fcc2,	loop_158
	fmovsleu	%xcc,	%f4,	%f19

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%gl,	%g5
loop_158:
	fmovsl	%icc,	%f5,	%f23
	bpos,a	loop_159
	wrpr	%l2,	0x1AB9,	%tick
	rdhpr	%hpstate,	%g1
	movcs	%icc,	%i4,	%i6
loop_159:
	orn	%i5,	%i0,	%o3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x3D4, 	%hsys_tick_cmpr
	wrpr	%i1,	%i2,	%cwp
	popc	%o5,	%i7
	rd	%pc,	%g7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xB38, 	%hsys_tick_cmpr
	rd	%tick_cmpr,	%o4
	sdiv	%o0,	0x1E8A,	%i3
	wr	%l1,	0x147C,	%clear_softint

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr 	%g0, 	0x4, 	%fprs
	rdhpr	%hpstate,	%o6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	sdiv	%g2,	0x0DDD,	%l3
	wr	%o7,	0x0B5C,	%set_softint
	movg	%icc,	%g5,	%o2
	nop
	set	0x10, %l5
	ldsw	[%l7 + %l5],	%g1
	orn	%l2,	0x0E8C,	%i4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%g0,	0x22,	%asi
	ldda	[%l7 + 0x50] %asi,	%i6
	bne	loop_160
	andcc	%i0,	0x0CF4,	%g3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%l4,	0x1840,	%ccr
loop_160:
	rdpr	%cleanwin,	%i1
	fcmpne32	%f6,	%f18,	%i2
	rdpr	%cansave,	%i7
	edge32l	%g7,	%g4,	%o5
	wrpr	%g6,	0x0ACA,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	tge	%xcc,	0x7
	rdpr	%canrestore,	%o4
	edge16l	%i3,	%o1,	%l1
	tleu	%icc,	0x2
	rd	%pc,	%l5
	fbne	%fcc1,	loop_161
	wrpr	%o6,	0x0DF5,	%pil
	or	%l6,	0x0660,	%g2
	wr	%l3,	0x13B9,	%pic
loop_161:
	taddcctv	%l0,	%g5,	%o7
	rdhpr	%hsys_tick_cmpr,	%g1
	taddcctv	%o2,	%l2,	%i4
	rd	%pc,	%i6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xD3D, 	%sys_tick_cmpr
	fmovsge	%icc,	%f6,	%f26
	wr	%o3,	%g3,	%y

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%canrestore,	%i7
	fmovrdlez	%i1,	%f2,	%f0
	fandnot1	%f12,	%f8,	%f16
	wr	%g4,	0x0C65,	%softint
	wrpr	%g7,	%g6,	%cwp
	andncc	%o5,	%o0,	%i3
	rdhpr	%hintp,	%o4
	fcmps	%fcc0,	%f17,	%f14
	rd	%asi,	%o1
	addcc	%l5,	%l1,	%l6
	rd	%pc,	%g2
	wrpr	%l3,	%o6,	%pil
	andn	%g5,	%l0,	%o7
	edge16ln	%g1,	%o2,	%l2
	xnorcc	%i6,	0x18B8,	%i4
	wr	%i5,	0x17A4,	%clear_softint
	wr	%i0,	0x148B,	%sys_tick
	brlez,a	%g3,	loop_162
	rdpr	%tba,	%l4
	smul	%i2,	0x0E17,	%i7
	fmovsl	%xcc,	%f15,	%f11
loop_162:
	rdhpr	%hsys_tick_cmpr,	%i1
	wr	%g4,	%g7,	%y
	rdpr	%cleanwin,	%o3
	set	0x14, %i4
	ldstuba	[%l7 + %i4] 0x18,	%o5
	umulcc	%g6,	0x142B,	%o0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%i3,	%l5,	%ccr
	rd	%fprs,	%o1
	edge32ln	%l6,	%g2,	%l1
	ldsw	[%l7 + 0x38],	%l3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%o6,	%g5,	%pic
	lduw	[%l7 + 0x2C],	%l0
	rdhpr	%htba,	%g1
	rd	%fprs,	%o7
	rd	%tick_cmpr,	%o2
	rd	%ccr,	%i6
	wrpr	%i4,	0x1B2D,	%tick
	rdpr	%cleanwin,	%l2
	membar	0x1A
	nop
	setx	loop_163,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fmovse	%xcc,	%f25,	%f30
	rdhpr	%htba,	%i5
	wr	%i0,	0x1515,	%y
loop_163:
	wr	%l4,	%i2,	%y
	movpos	%xcc,	%i7,	%i1
	rdhpr	%htba,	%g4
	edge32n	%g3,	%g7,	%o3
	wr	%o5,	%g6,	%sys_tick
	addc	%o4,	%o0,	%l5
	wrpr	%o1,	0x028B,	%pil
	fmuld8ulx16	%f6,	%f24,	%f28
	edge8l	%i3,	%g2,	%l6
	xnor	%l3,	%l1,	%g5
	rd	%ccr,	%o6
	tle	%icc,	0x5
	rdpr	%cansave,	%g1
	edge32	%o7,	%l0,	%i6
        wr    %g0,    0xe,    %pcr    ! changed.
	edge8ln	%i5,	%o2,	%i0
	rdpr	%cleanwin,	%l4
	rdpr	%canrestore,	%i2
	xor	%i7,	%g4,	%g3
	movleu	%xcc,	%i1,	%g7
	movre	%o3,	0x2A5,	%g6
	wr	%o5,	0x059E,	%softint
	rdhpr	%htba,	%o4
	rd	%softint,	%l5
	smul	%o1,	%i3,	%g2
	edge8ln	%o0,	%l3,	%l1
	rdpr	%cansave,	%g5
	andcc	%o6,	%g1,	%l6
	rdhpr	%htba,	%o7
	rdhpr	%htba,	%i6
	rdpr	%pil,	%i4
	fsrc2s	%f11,	%f8
	rdhpr	%hsys_tick_cmpr,	%l0
	rdpr	%cansave,	%i5
	fbne	%fcc1,	loop_164
	orcc	%l2,	0x026E,	%o2
	movl	%icc,	%l4,	%i2
	wr	%g0,	0x81,	%asi
	lduwa	[%l7 + 0x5C] %asi,	%i0
loop_164:
	rdpr	%cwp,	%i7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xE4A, 	%hsys_tick_cmpr
	swap	[%l7 + 0x74],	%g3
	wr	%g7,	0x01A7,	%y
	rdhpr	%hsys_tick_cmpr,	%o3
	tvc	%icc,	0x0
	wr	%g6,	0x0C24,	%clear_softint
	rd	%ccr,	%i1
	rdpr	%gl,	%o4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fbo,a	%fcc0,	loop_165
	movrlez	%l5,	0x11E,	%o1
	edge16n	%g2,	%o0,	%i3
	rdhpr	%htba,	%l1
loop_165:
	sth	%l3,	[%l7 + 0x1A]
	wrpr	%o6,	0x0169,	%cwp
	wrpr	%g1,	0x0855,	%pil
	sdiv	%l6,	0x06A9,	%g5
	rdpr	%gl,	%o7
	wr 	%g0, 	0x5, 	%fprs
	movle	%icc,	%l0,	%l2
	wrpr	%i5,	0x12D2,	%tick
	fpsub32s	%f10,	%f12,	%f21
	wrpr	%l4,	0x0076,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	addc	%i0,	%i7,	%g4
	fnot1	%f20,	%f22

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fba,a	%fcc0,	loop_166
	rdhpr	%hsys_tick_cmpr,	%g3
	fcmped	%fcc1,	%f20,	%f0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xB17, 	%sys_tick_cmpr
loop_166:
	rdpr	%cwp,	%o5
	edge16n	%l5,	%i1,	%o1
	rd	%asi,	%o0
	sdiv	%g2,	0x1139,	%l1
	swap	[%l7 + 0x40],	%i3
	rd	%ccr,	%o6
	wr	%l3,	0x1B0B,	%pic
	sdivcc	%g1,	0x04CD,	%g5
	brnz,a	%o7,	loop_167
	rdpr	%tl,	%l6
	srl	%i4,	0x1A,	%i6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_167:
	or	%i5,	%l2,	%l4
	rdpr	%tl,	%i2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%cleanwin,	%o2
	wr 	%g0, 	0x5, 	%fprs
	rdhpr	%hsys_tick_cmpr,	%g3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x655, 	%hsys_tick_cmpr
	rdhpr	%hintp,	%g6
	alignaddrl	%l5,	%i1,	%o1
	sra	%o0,	0x18,	%o5
	rdhpr	%hintp,	%l1
	wr	%g2,	%o6,	%set_softint
	fpadd16s	%f14,	%f1,	%f24
	wr	%l3,	0x01EB,	%clear_softint
	wrpr	%g1,	0x13A7,	%tick
	edge8	%i3,	%o7,	%l6
	wr	%g0,	0x04,	%asi
	swapa	[%l7 + 0x74] %asi,	%g5
	or	%i4,	0x107C,	%i6
	rd	%y,	%i5
	movge	%xcc,	%l0,	%l2
	wr	%i2,	%l4,	%sys_tick
	wr	%i0,	%i7,	%ccr
	wrpr	%o2,	0x1C8A,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%o4,	%g6,	%softint
	taddcctv	%o3,	0x0F42,	%i1
	wrpr	%o1,	0x0922,	%cwp
	alignaddr	%l5,	%o0,	%o5
	rdpr	%tl,	%l1
	wrpr	%g2,	%o6,	%tick
	ldd	[%l7 + 0x50],	%f2
	tsubcc	%g1,	%i3,	%o7
	rd	%tick_cmpr,	%l3
	rdhpr	%hpstate,	%l6
	rdhpr	%hintp,	%g5
	set	0x38, %l3
	ldstuba	[%l7 + %l3] 0x89,	%i4
	array16	%i5,	%l0,	%i6
	wr	%i2,	%l2,	%clear_softint
	rd	%sys_tick_cmpr,	%l4
	tle	%xcc,	0x0
	rdhpr	%hintp,	%i0
	rdpr	%otherwin,	%i7
	fmovdn	%icc,	%f21,	%f8

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%cwp,	%g3
	fnegd	%f6,	%f26
	rd	%fprs,	%o2
	wr	%o4,	%g6,	%clear_softint
	wr	%g4,	%o3,	%set_softint
	rdhpr	%hpstate,	%o1
	rdpr	%tl,	%i1
	ldd	[%l7 + 0x48],	%l4
	movrgz	%o0,	%o5,	%l1
	movrlez	%o6,	0x2C6,	%g2
	rdpr	%gl,	%g1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x048, 	%sys_tick_cmpr
	fmovdgu	%xcc,	%f28,	%f17
	rdhpr	%hintp,	%l6
	wrpr	%o7,	%i4,	%pil
	rdhpr	%htba,	%g5
	bleu,a,pt	%xcc,	loop_168
	fpack32	%f0,	%f12,	%f18
	wr	%i5,	%l0,	%softint
	wr	%i2,	%i6,	%pic
loop_168:
	brz,a	%l4,	loop_169
	rdpr	%cansave,	%i0
	xorcc	%i7,	0x0D11,	%l2
	rd	%softint,	%g7
loop_169:
	sllx	%g3,	0x0A,	%o2
	rdpr	%canrestore,	%o4
	rdpr	%cwp,	%g6
	srl	%o3,	%o1,	%g4
	mova	%icc,	%l5,	%o0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xBEA, 	%hsys_tick_cmpr
	wr 	%g0, 	0x6, 	%fprs
	edge32l	%o6,	%i3,	%l3
	rd	%ccr,	%l6
	xor	%g1,	%i4,	%o7
	umulcc	%i5,	%l0,	%i2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%hsys_tick_cmpr,	%i0
	bg	%xcc,	loop_170
	rdpr	%wstate,	%g5
	wr	%l2,	%i7,	%ccr
	rd	%y,	%g7
loop_170:
	array32	%g3,	%o4,	%g6
	fcmped	%fcc3,	%f0,	%f8
	fcmpeq32	%f16,	%f26,	%o3
	rdpr	%wstate,	%o2
	ble,a,pn	%icc,	loop_171
	addccc	%o1,	0x0D24,	%l5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x336, 	%tick_cmpr
	pdist	%f10,	%f10,	%f6
loop_171:
	popc	0x177C,	%i1
	rdhpr	%hintp,	%l1
	wrpr	%g4,	0x0F7F,	%tick

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
	wrpr	%o6,	0x009A,	%tick
	wrpr	%l3,	0x1FA8,	%cwp
	ld	[%l7 + 0x3C],	%f22
	rd	%pc,	%l6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x7E3, 	%hsys_tick_cmpr
	faligndata	%f10,	%f0,	%f30

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x7CE, 	%tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fcmpne32	%f18,	%f20,	%i5
	movpos	%xcc,	%i4,	%i2
	edge16l	%l0,	%i6,	%i0
	fbge,a	%fcc3,	loop_172
	movgu	%xcc,	%g5,	%l4
	udiv	%l2,	0x1211,	%i7
	fbe,a	%fcc1,	loop_173
loop_172:
	edge32n	%g7,	%o4,	%g6
	wrpr	%o3,	%g3,	%cwp
	wrpr	%o2,	%o1,	%cwp
loop_173:
	umulcc	%o0,	0x0197,	%l5
	rdpr	%tba,	%i1
	set	0x28, %g4
	prefetcha	[%l7 + %g4] 0x0c,	 0x1
	rdpr	%cwp,	%g2
	wr 	%g0, 	0x7, 	%fprs
	tvs	%icc,	0x3
	rd	%pc,	%o6
	rd	%y,	%l3
	tsubcctv	%l1,	0x08A7,	%i3
	fxnors	%f29,	%f11,	%f15
	edge32ln	%g1,	%o7,	%i5
	movgu	%icc,	%l6,	%i4
	rdhpr	%hpstate,	%l0
	rdpr	%pil,	%i6
	xnorcc	%i0,	0x172C,	%g5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x193, 	%hsys_tick_cmpr
	rdpr	%wstate,	%i2
	rdhpr	%htba,	%l2
	sdiv	%i7,	0x1800,	%g7
	movl	%xcc,	%o4,	%o3
	rdhpr	%hpstate,	%g3
	fbue	%fcc0,	loop_174
	rdpr	%tba,	%g6
	wr	%o1,	%o0,	%pic
	wrpr	%o2,	%l5,	%cwp
loop_174:
	rdpr	%tl,	%g4
	wr	%g2,	0x1F6E,	%softint
	fbne	%fcc2,	loop_175
	wr	%o5,	0x002F,	%sys_tick
	tn	%xcc,	0x5
	alignaddrl	%i1,	%l3,	%l1
loop_175:
	wr	%o6,	0x09FA,	%y
	srl	%g1,	%i3,	%o7
	rd	%pc,	%i5
	set	0x22, %i2
	stha	%l6,	[%l7 + %i2] 0x14
	rdhpr	%hpstate,	%l0
	rdhpr	%hsys_tick_cmpr,	%i6
	wrpr	%i4,	0x0119,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%pc,	%l4
	rdpr	%cansave,	%i2
	orncc	%i0,	0x1220,	%l2
	wrpr	%i7,	0x15BC,	%tick
	rd	%y,	%g7
	fcmpd	%fcc0,	%f8,	%f24
	rdhpr	%hpstate,	%o3
	wr	%o4,	0x10E9,	%sys_tick
	rdpr	%tl,	%g6
	wr	%o1,	0x1B86,	%y
	rdpr	%cwp,	%o0
	set	0x40, %l4
	stba	%o2,	[%l7 + %l4] 0xe2
	membar	#Sync
	rdpr	%tba,	%l5
	bvc,a	loop_176
	rdhpr	%htba,	%g4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xC41, 	%hsys_tick_cmpr
	wrpr	%o5,	0x048B,	%tick
loop_176:
	wr	%i1,	%l3,	%softint
	wrpr	%o6,	%g1,	%cwp
	wrpr	%i3,	%o7,	%tick
	wr	%l1,	%l6,	%set_softint
	wrpr	%l0,	0x0666,	%cwp
	tl	%icc,	0x7
	rdpr	%canrestore,	%i6
	edge16n	%i4,	%i5,	%g5
	wrpr	%i2,	0x1F16,	%pil
	rdhpr	%htba,	%l4
	mulx	%i0,	%l2,	%g7
	fmovsn	%icc,	%f30,	%f23
	wrpr	%o3,	0x1409,	%tick
	lduh	[%l7 + 0x1C],	%o4
	ta	%xcc,	0x2
	subccc	%i7,	%o1,	%g6
	wrpr	%o0,	0x07C9,	%cwp
	tl	%xcc,	0x0
	rdpr	%cwp,	%l5
	wrpr	%g4,	0x15F5,	%cwp
	array8	%g3,	%o2,	%o5
	fmovdpos	%xcc,	%f22,	%f23
	array32	%g2,	%i1,	%l3
	fba,a	%fcc3,	loop_177
	rdhpr	%hintp,	%o6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%cwp,	%g1
loop_177:
	wr	%l1,	0x0BEB,	%set_softint
	rd	%asi,	%l6
	fmovsg	%xcc,	%f24,	%f31
	wr	%l0,	0x0C3D,	%softint
	udiv	%i6,	0x086F,	%o7
	fcmpgt16	%f6,	%f10,	%i5
	tle	%icc,	0x3
	rdhpr	%hsys_tick_cmpr,	%g5
	rdpr	%cleanwin,	%i2
	rdhpr	%hpstate,	%i4
	smul	%i0,	0x0440,	%l4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x33D, 	%hsys_tick_cmpr
	taddcctv	%o3,	%l2,	%o4
	wr	%i7,	%g6,	%softint
	movl	%icc,	%o0,	%l5
	move	%icc,	%o1,	%g4
	wrpr	%g3,	0x1296,	%cwp
	movle	%icc,	%o2,	%g2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xC28, 	%tick_cmpr
	addcc	%i1,	0x13AD,	%o6
	fmovsneg	%xcc,	%f16,	%f20
	rdpr	%tba,	%g1
	wrpr	%i3,	0x12A2,	%pil
	fpack16	%f2,	%f12
	fbge,a	%fcc3,	loop_178
	rdhpr	%hsys_tick_cmpr,	%l6
	wr	%l0,	0x02CB,	%softint
	rdpr	%tba,	%i6
loop_178:
	fbuge,a	%fcc3,	loop_179
	fmovdne	%xcc,	%f24,	%f6
	fmuld8ulx16	%f26,	%f11,	%f2
	edge16	%l1,	%i5,	%g5
loop_179:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x5D7, 	%sys_tick_cmpr
	edge16l	%i4,	%i2,	%l4
	rdhpr	%hintp,	%i0
	rd	%softint,	%g7
	wrpr	%l2,	%o4,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x36D, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xC97, 	%hsys_tick_cmpr
	rdhpr	%htba,	%o0
	rdhpr	%hpstate,	%l5
	rd	%ccr,	%o1
	ldsh	[%l7 + 0x16],	%g4
	edge16	%g3,	%o3,	%o2
	wrpr	%g2,	%l3,	%pil
	wrpr	%i1,	0x1185,	%cwp
	rd	%asi,	%o6
	tneg	%icc,	0x6
	wrpr	%o5,	%i3,	%pil
	rdhpr	%hpstate,	%g1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	edge32l	%i6,	%l0,	%i5
	bneg,pt	%xcc,	loop_180
	rdhpr	%hpstate,	%g5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xE2B, 	%hsys_tick_cmpr
loop_180:
	fmovsleu	%icc,	%f20,	%f4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x42C, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	rdpr	%tba,	%l2
	movrlz	%o4,	%i7,	%i4
	xnorcc	%o0,	%l5,	%o1
	tge	%icc,	0x1
	and	%g4,	0x1E9D,	%g6
	movg	%xcc,	%o3,	%g3
	tleu	%icc,	0x1
	wrpr	%g2,	%o2,	%tick
	rdpr	%otherwin,	%i1
	bvc,a	loop_181
	fbue,a	%fcc2,	loop_182
	rdhpr	%hsys_tick_cmpr,	%l3
	rdhpr	%hintp,	%o5
loop_181:
	rd	%pc,	%i3
loop_182:
	nop
	setx	loop_183,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fpack32	%f14,	%f24,	%f2
	rdpr	%tl,	%o6
	sra	%l6,	0x05,	%g1
loop_183:
	rd	%y,	%l0
	set	0x4F, %l1
	stba	%i6,	[%l7 + %l1] 0x23
	membar	#Sync
	rdhpr	%htba,	%g5
	tneg	%xcc,	0x2
	rdhpr	%hsys_tick_cmpr,	%o7
	array16	%l1,	%i5,	%l4
	rdpr	%gl,	%i2
	nop
	setx	loop_184,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	mulscc	%i0,	%l2,	%g7
	wr	%i7,	%i4,	%softint
	movrgz	%o4,	%o0,	%l5
loop_184:
	wr	%o1,	%g6,	%set_softint
	array32	%g4,	%g3,	%o3
	movvc	%icc,	%g2,	%o2
	movrne	%l3,	0x238,	%o5
	tl	%icc,	0x3
	wr	%i3,	0x01FA,	%set_softint
	fmovsvs	%icc,	%f26,	%f12
	wrpr	%i1,	%l6,	%cwp
	fmovse	%icc,	%f3,	%f18

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	sir	0x0770
	rdhpr	%htba,	%i6
	rdpr	%tl,	%o6
	wrpr	%g5,	%l1,	%tick
	rd	%tick_cmpr,	%i5
	edge8	%o7,	%l4,	%i2
	wr	%g0,	0xd8,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%l2,	0x0A7F,	%y
	rdpr	%canrestore,	%g7
	wr	%i7,	%i0,	%clear_softint
	movvs	%icc,	%o4,	%o0
	popc	%i4,	%o1
	rdpr	%cwp,	%g6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%g3,	%g4,	%cwp
	sth	%g2,	[%l7 + 0x1E]
	rdpr	%cansave,	%o3
	rdpr	%tba,	%l3
	rdpr	%wstate,	%o5
	rd	%fprs,	%o2
	srax	%i1,	0x02,	%l6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fba,a	%fcc1,	loop_185
	wr	%i6,	%o6,	%y
	wr	%l0,	0x17F1,	%clear_softint
	wr	%g5,	%l1,	%ccr
loop_185:
	movpos	%xcc,	%i5,	%o7
	fmovrse	%i2,	%f13,	%f16
	edge32	%l2,	%g7,	%i7
	rdpr	%tba,	%l4
	rdhpr	%hsys_tick_cmpr,	%i0
	wr	%o4,	0x00FE,	%clear_softint
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tcc	%xcc,	0x6
	wr	%i4,	0x0ACF,	%sys_tick
	rdpr	%tl,	%o1
	wr	%g0,	0x18,	%asi
	ldsba	[%l7 + 0x48] %asi,	%g6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	alignaddr	%o0,	%g2,	%g4
	rd	%sys_tick_cmpr,	%o3
	wr	%g0,	0xeb,	%asi
	stwa	%l3,	[%l7 + 0x0C] %asi
	membar	#Sync

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x627, 	%tick_cmpr
	fnands	%f13,	%f31,	%f11
	brgez,a	%i1,	loop_186
	rdpr	%cwp,	%l6
	wr	%o2,	%i3,	%sys_tick
	be,a,pn	%xcc,	loop_187
loop_186:
	rdpr	%cwp,	%g1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
        wr    %g0,    0xe,    %pcr    ! changed.
loop_187:
	nop
	set	0x44, %o5
	stb	%g5,	[%l7 + %o5]

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	xnorcc	%o7,	0x05B5,	%i2
	rd	%ccr,	%l2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x5B1, 	%hsys_tick_cmpr
	rdhpr	%hintp,	%g7
	taddcc	%l4,	0x12D4,	%i0
	rdpr	%cwp,	%o4
	edge32n	%i7,	%i4,	%g6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fpadd16	%f12,	%f0,	%f0
	wrpr	%l5,	0x1FA1,	%tick
	rd	%pc,	%o0
	fmovrde	%g2,	%f18,	%f24
	rd	%pc,	%g4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xB41, 	%hsys_tick_cmpr
	rdhpr	%hintp,	%o5
	rd	%tick_cmpr,	%i1
	ldd	[%l7 + 0x60],	%f8
	call	loop_188
	sdiv	%l6,	0x1E66,	%o3
	ta	%icc,	0x6
	wr	%o2,	%g1,	%clear_softint
loop_188:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xF66, 	%hsys_tick_cmpr
	wrpr	%o6,	0x02AB,	%pil
	wrpr	%l0,	%g5,	%tick
	movge	%icc,	%i5,	%o7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x414, 	%hsys_tick_cmpr
	fbuge	%fcc1,	loop_189
	wr	%l1,	%g7,	%sys_tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	tvc	%icc,	0x4
loop_189:
	rdpr	%tl,	%i0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x605, 	%hsys_tick_cmpr
	umulcc	%i4,	%i7,	%o1
	popc	0x0533,	%g6
	rd	%pc,	%l5
	sdivx	%g2,	0x1D64,	%o0
	wr	%g3,	%g4,	%set_softint
	movneg	%xcc,	%o5,	%l3
	nop
	setx	loop_190,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	be,a	%xcc,	loop_191
	rdpr	%canrestore,	%l6
	rd	%sys_tick_cmpr,	%o3
loop_190:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
loop_191:
	rd	%pc,	%g1
	rdpr	%gl,	%i3
	rd	%sys_tick_cmpr,	%o6
	rd	%y,	%o2
	wrpr	%g5,	0x0CB4,	%pil
	ble,a	loop_192
	movcc	%icc,	%i5,	%l0
	set	0x74, %g2
	lda	[%l7 + %g2] 0x88,	%f15
loop_192:
	sth	%o7,	[%l7 + 0x3C]
	set	0x10, %l6
	ldda	[%l7 + %l6] 0xeb,	%i2
	rdhpr	%hintp,	%i6
	wr	%l1,	0x09EE,	%y
	wrpr	%g7,	0x122D,	%tick
	tleu	%xcc,	0x3
	rdpr	%otherwin,	%i0
	subccc	%l4,	%l2,	%i4
	fmuld8ulx16	%f24,	%f2,	%f28
	rd	%tick_cmpr,	%i7
	wrpr	%o1,	0x1290,	%pil
	movcc	%icc,	%g6,	%l5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x0BE, 	%hsys_tick_cmpr
	wr	%g2,	0x03B0,	%pic
	tl	%xcc,	0x4
	rd	%y,	%g3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x4DC, 	%hsys_tick_cmpr
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tgu	%icc,	0x3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x9C7, 	%sys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x852, 	%hsys_tick_cmpr
	wr	%o3,	0x12C0,	%softint
	bne	%xcc,	loop_193
	rdpr	%cwp,	%g1
	set	0x20, %o3
	swapa	[%l7 + %o3] 0x0c,	%i1
loop_193:
	ldd	[%l7 + 0x58],	%f14
	rd	%softint,	%o6
	movre	%i3,	%g5,	%i5
	rd	%ccr,	%o2
	st	%f3,	[%l7 + 0x5C]
	rd	%y,	%l0
	fnegd	%f10,	%f20
	rdhpr	%hpstate,	%i2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	movge	%icc,	%l1,	%o7
	bn	%xcc,	loop_194
	movne	%icc,	%g7,	%l4
	rdhpr	%hpstate,	%i0
	tne	%icc,	0x0
loop_194:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fpsub16	%f6,	%f26,	%f4
	movre	%i4,	%g6,	%o1
	tn	%xcc,	0x3
	wr 	%g0, 	0x6, 	%fprs
	tsubcc	%l5,	%g2,	%g3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x29D, 	%hsys_tick_cmpr
	wrpr	%l3,	0x15DC,	%pil
	movl	%xcc,	%o5,	%l6
	wrpr	%o3,	0x1CAF,	%tick
	tcc	%xcc,	0x0
	fnot2s	%f18,	%f19
	rd	%y,	%g4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stbar
	lduw	[%l7 + 0x3C],	%g1
	bcs	%icc,	loop_195
	fpsub16	%f16,	%f12,	%f2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	bshuffle	%f14,	%f30,	%f22
loop_195:
	rd	%fprs,	%g5
	andncc	%i5,	%i3,	%l0
	rdhpr	%hsys_tick_cmpr,	%o2
	edge32l	%i2,	%i6,	%o7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fbe,a	%fcc0,	loop_196
	rd	%asi,	%l1
	rdpr	%wstate,	%l4
	move	%icc,	%l2,	%i7
loop_196:
	rdhpr	%hintp,	%i0
	array8	%i4,	%o1,	%g6
	wrpr	%l5,	0x0C21,	%cwp
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x20
	wr	%g0,	0x20,	%asi
	ldxa	[%g0 + 0x20] %asi,	%o4
	fmovdg	%xcc,	%f9,	%f27

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x3DB, 	%sys_tick_cmpr
	movpos	%icc,	%o0,	%l3
	xor	%o5,	%l6,	%g2
	wrpr	%o3,	%g4,	%pil
	rdpr	%gl,	%i1
	tvc	%xcc,	0x3
	brnz	%g1,	loop_197
	rdhpr	%hsys_tick_cmpr,	%g5
	wr	%o6,	0x03C2,	%sys_tick
	rd	%tick_cmpr,	%i3
loop_197:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x832, 	%sys_tick_cmpr
	array16	%o2,	%i2,	%i6
	rdpr	%gl,	%i5
	siam	0x6
	sllx	%o7,	%l1,	%g7
	alignaddrl	%l4,	%i7,	%i0
	rd	%ccr,	%i4
	rd	%pc,	%l2
	wr	%g0,	0x80,	%asi
	ldstuba	[%l7 + 0x7E] %asi,	%o1
	bgu,a	loop_198
	nop
	setx loop_199, %l0, %l1
	jmpl %l1, %l5
	fornot2	%f16,	%f8,	%f28
	subcc	%g6,	%g3,	%o0
loop_198:
	wrpr	%l3,	%o5,	%tick
loop_199:
	wr	%o4,	%l6,	%set_softint
	umul	%o3,	%g2,	%g4
	rdpr	%cwp,	%i1
	rd	%asi,	%g5
	rd	%asi,	%g1
	rdhpr	%htba,	%o6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xDBE, 	%hsys_tick_cmpr
	rd	%tick_cmpr,	%i6
	taddcctv	%o2,	0x14C2,	%i5
	rdhpr	%hintp,	%o7
	stbar
	wrpr	%g7,	%l4,	%tick
	wr	%i7,	0x0E89,	%clear_softint
	fmovsleu	%icc,	%f7,	%f11
	fmovsleu	%xcc,	%f30,	%f4
	rd	%ccr,	%i0
	rdpr	%otherwin,	%l1
	sdivx	%l2,	0x08F2,	%i4
	brnz,a	%o1,	loop_200
	movn	%icc,	%g6,	%g3
	movcc	%icc,	%o0,	%l5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x323, 	%hsys_tick_cmpr
loop_200:
	srlx	%o4,	0x14,	%o5
	wrpr	%l6,	0x06CE,	%cwp
	fmul8sux16	%f12,	%f28,	%f26
	rdhpr	%htba,	%o3
	and	%g2,	0x1CDA,	%i1
	wrpr	%g5,	0x0478,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fbo,a	%fcc2,	loop_201
	rd	%ccr,	%l0
	wr	%o6,	%i3,	%ccr
	wr	%i6,	%i2,	%set_softint
loop_201:
	wrpr	%i5,	%o2,	%pil
	andncc	%g7,	%o7,	%i7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fmovsneg	%icc,	%f9,	%f31
	wrpr	%i0,	0x0A70,	%tick
	addccc	%l1,	0x1088,	%i4
	wr	%o1,	%l2,	%sys_tick
	rdpr	%otherwin,	%g6
	fba,a	%fcc0,	loop_202
	wrpr	%o0,	0x159F,	%cwp
	membar	0x2D
	set	0x3C, %i0
	lda	[%l7 + %i0] 0x15,	%f7
loop_202:
	tpos	%xcc,	0x3
	tcc	%xcc,	0x0
	or	%g3,	0x0087,	%l3
	tsubcctv	%l5,	0x0D2F,	%o4
	wrpr	%o5,	0x198E,	%cwp
	rd	%fprs,	%l6
	fornot1s	%f5,	%f30,	%f0
	set	0x28, %i5
	lda	[%l7 + %i5] 0x18,	%f1
	rd	%softint,	%g2
	andn	%o3,	%i1,	%g5
	ta	%icc,	0x4
	fmovrslz	%g1,	%f21,	%f29
	wrpr	%l0,	0x0C0F,	%pil
	rdhpr	%hsys_tick_cmpr,	%o6
	sethi	0x0AF2,	%i3
	or	%g4,	0x0813,	%i2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%ccr,	%o2
	rdhpr	%htba,	%i6
	tcc	%icc,	0x7
	rdpr	%cleanwin,	%g7
	rdhpr	%htba,	%i7
	tcs	%xcc,	0x0
	edge8l	%o7,	%l4,	%i0
	rdpr	%pil,	%i4
	rdpr	%cwp,	%o1
	rd	%sys_tick_cmpr,	%l1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xA6C, 	%hsys_tick_cmpr
	array32	%g6,	%l3,	%g3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x4B2, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x877, 	%hsys_tick_cmpr
	rdhpr	%hpstate,	%l5
	fsrc2	%f14,	%f0
	rdhpr	%hpstate,	%l6
	rdpr	%pil,	%g2
	rd	%sys_tick_cmpr,	%o3
	wrpr	%g5,	%i1,	%pil
	rdpr	%otherwin,	%g1
	array16	%l0,	%i3,	%g4
	rdhpr	%hintp,	%i2
	tg	%icc,	0x5
	fmovrdlz	%o6,	%f0,	%f22
	wr	%g0,	0x11,	%asi
	lduba	[%l7 + 0x7E] %asi,	%o2
	edge16	%i6,	%i5,	%i7
	add	%l7,	0x10,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%g7
	casxa	[%l6] %asi,	%g7,	%l4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x934, 	%hsys_tick_cmpr
	rdpr	%cleanwin,	%i4
	wr	%i0,	%l1,	%set_softint
	subc	%o1,	0x1FA1,	%o0
	taddcctv	%g6,	0x1432,	%l2
	wrpr	%l3,	0x1724,	%cwp
	bneg,a	%icc,	loop_203
	rd	%y,	%g3
	edge8l	%o5,	%o4,	%l5
	set	0x34, %o6
	lduba	[%l7 + %o6] 0x15,	%l6
loop_203:
	wrpr	%g2,	%g5,	%pil
	rd	%sys_tick_cmpr,	%o3
	wr	%g1,	0x007A,	%pic

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%g4,	%i3,	%pil
	rd	%softint,	%o6
	wrpr	%i2,	0x0722,	%cwp
	andncc	%o2,	%i6,	%i5
	fmovdl	%icc,	%f10,	%f14
	wrpr	%g7,	0x027E,	%cwp
	wr	%g0,	0x88,	%asi
	ldsba	[%l7 + 0x22] %asi,	%i7
	mova	%xcc,	%o7,	%l4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	movrgez	%l1,	0x0F9,	%o1
	rd	%fprs,	%g6
	sub	%o0,	%l2,	%l3
	addcc	%g3,	%o4,	%l5
	rdpr	%wstate,	%l6
	wrpr	%o5,	%g5,	%pil
	rdpr	%wstate,	%g2
	sub	%g1,	%l0,	%o3
	edge16	%g4,	%i1,	%i3
	rdpr	%cwp,	%i2
	rd	%ccr,	%o6
        wr    %g0,    0xe,    %pcr    ! changed.
	fmovdn	%icc,	%f7,	%f13
	movvs	%xcc,	%g7,	%i7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xC56, 	%hsys_tick_cmpr
	edge16l	%i0,	%i4,	%o7
	mova	%icc,	%l1,	%o1
	wr	%g6,	0x1B3F,	%clear_softint
	move	%icc,	%o0,	%l3
	nop
	setx loop_204, %l0, %l1
	jmpl %l1, %g3
	tgu	%xcc,	0x3
	rdpr	%gl,	%o4
	movpos	%icc,	%l5,	%l6
loop_204:
	rdpr	%cansave,	%o5
	rdpr	%tba,	%l2
	wrpr	%g5,	0x0685,	%cwp
	wrpr	%g2,	0x1582,	%cwp
	rdpr	%tba,	%g1
	rdhpr	%hsys_tick_cmpr,	%l0
	subc	%g4,	0x08CE,	%i1
	taddcctv	%i3,	%i2,	%o3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x192, 	%tick_cmpr
	fabsd	%f12,	%f30
	fmovsvs	%icc,	%f13,	%f24

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x032, 	%hsys_tick_cmpr
	wrpr	%i7,	%i6,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xFE0, 	%hsys_tick_cmpr
	edge8ln	%l4,	%i4,	%i0
	udiv	%o7,	0x1E0B,	%l1
	set	0x48, %o7
	sta	%f28,	[%l7 + %o7] 0x88

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x626, 	%tick_cmpr
	rdhpr	%htba,	%g3
	rd	%ccr,	%o4
	rdpr	%pil,	%l5
	edge32n	%l6,	%l3,	%l2
	fbe,a	%fcc3,	loop_205
	orn	%g5,	0x02DD,	%g2
	subcc	%g1,	0x0DCE,	%o5
	wrpr	%l0,	%g4,	%pil
loop_205:
	fpmerge	%f4,	%f28,	%f16
	siam	0x1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	bvs,a	%icc,	loop_206
	wrpr	%i3,	0x0A5F,	%cwp
	wr	%g0,	0xe2,	%asi
	stxa	%o3,	[%l7 + 0x28] %asi
	membar	#Sync
loop_206:
	array8	%o6,	%i5,	%g7
	rdhpr	%hpstate,	%i2
	rd	%ccr,	%i7
	tcc	%icc,	0x7
	fmovdn	%xcc,	%f29,	%f20
	rdhpr	%hsys_tick_cmpr,	%i6
	wr 	%g0, 	0x5, 	%fprs
	edge8ln	%l4,	%i0,	%l1
	rdpr	%gl,	%g6
	or	%o7,	0x105A,	%o0
	tgu	%xcc,	0x7
	set	0x40, %g3
	stda	%f16,	[%l7 + %g3] 0x15
	wr	%o1,	%g3,	%ccr
	ldd	[%l7 + 0x68],	%f22
	edge32ln	%o4,	%l6,	%l3
	rdhpr	%hintp,	%l2
	rd	%sys_tick_cmpr,	%l5
	wr	%g5,	%g1,	%sys_tick
	wr	%g2,	%o5,	%y
	mulx	%l0,	%g4,	%i3
	rd	%y,	%i1
	rdpr	%otherwin,	%o3
	add	%l7,	0x28,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%i5,	%g7
	fnot2	%f4,	%f22
	movleu	%icc,	%i2,	%o6
	rdpr	%otherwin,	%i6
	rdhpr	%htba,	%o2
	edge8ln	%i4,	%l4,	%i0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	tl	%icc,	0x2
	brlz	%g6,	loop_207
	rdpr	%otherwin,	%o0
	popc	%o7,	%g3
	wr	%o4,	%l6,	%softint
loop_207:
	movpos	%icc,	%l3,	%l2
	wrpr	%o1,	0x01DA,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x23F, 	%hsys_tick_cmpr
	rd	%asi,	%g5
	rd	%sys_tick_cmpr,	%g1
	rdhpr	%hpstate,	%g2
	wr	%g0,	0x89,	%asi
	stda	%l0,	[%l7 + 0x38] %asi
	wr	%o5,	%g4,	%softint
	rdhpr	%htba,	%i1
	rd	%ccr,	%o3
	rd	%pc,	%i5
	wrpr	%i3,	%i2,	%tick
	wrpr	%g7,	0x12C0,	%cwp
	lduh	[%l7 + 0x28],	%i6
	addccc	%o6,	%i4,	%o2
	wr	%l4,	%i7,	%y
	lduw	[%l7 + 0x5C],	%l1
	add	%i0,	%g6,	%o0
	edge16	%g3,	%o4,	%l6
	wrpr	%o7,	0x06AB,	%cwp
	fmul8sux16	%f16,	%f6,	%f16
	rd	%tick_cmpr,	%l2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xFCA, 	%hsys_tick_cmpr
	wrpr	%l5,	%g5,	%pil
	tcs	%icc,	0x4
	rd	%fprs,	%l3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x683, 	%hsys_tick_cmpr
	wrpr	%o5,	0x13B7,	%pil
	wr 	%g0, 	0x4, 	%fprs
	rdhpr	%hpstate,	%l0
	movle	%icc,	%i1,	%o3
	rdhpr	%hsys_tick_cmpr,	%i5
	rd	%sys_tick_cmpr,	%i2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x8F1, 	%hsys_tick_cmpr
	rdhpr	%hpstate,	%g7
	movrgez	%o6,	0x3DD,	%i6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x772, 	%hsys_tick_cmpr
	movrne	%i4,	%i7,	%l1
	rd	%asi,	%l4
	sub	%i0,	0x1168,	%g6
	wrpr	%o0,	%g3,	%cwp
	prefetch	[%l7 + 0x18],	 0x2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	xnor	%l6,	%l2,	%o7
	rd	%pc,	%o1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	rdpr	%gl,	%l5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	st	%f29,	[%l7 + 0x50]
	wrpr	%o5,	0x023D,	%cwp
	tvs	%xcc,	0x0
	fpack16	%f22,	%f24
	edge8	%g4,	%l0,	%i1
	edge8	%g1,	%i5,	%i2
	set	0x39, %g5
	ldsba	[%l7 + %g5] 0x18,	%i3
	wr	%g7,	%o3,	%set_softint

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x1E2, 	%hsys_tick_cmpr
	rdpr	%canrestore,	%o2
	rdpr	%pil,	%i4
	wr	%o6,	0x0F19,	%y
	rd	%fprs,	%l1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	movrgez	%g6,	%o0,	%g3
	array8	%i0,	%l6,	%l2
	wr	%o4,	0x1866,	%y
	udivx	%o1,	0x00F0,	%l5
	wr 	%g0, 	0x5, 	%fprs
	fxnors	%f26,	%f17,	%f0
	taddcctv	%g5,	0x0679,	%l3
	rd	%asi,	%g4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xA14, 	%hsys_tick_cmpr
	movle	%icc,	%o5,	%g1
	wr	%i1,	%i5,	%ccr
	rd	%ccr,	%i3
	fbge	%fcc0,	loop_208
	wr 	%g0, 	0x5, 	%fprs
	rdpr	%otherwin,	%o3
	rdpr	%tl,	%i2
loop_208:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%i6,	%o6,	%pil
	ldsw	[%l7 + 0x10],	%l4
	rdhpr	%hintp,	%i7
	fmovdvs	%xcc,	%f29,	%f6
	orncc	%l1,	0x1959,	%o0
	wr	%g0,	0x89,	%asi
	ldsha	[%l7 + 0x2C] %asi,	%g3
	rd	%fprs,	%i0
	rdpr	%otherwin,	%l6
	stbar
	wr	%l2,	%g6,	%set_softint
	rdhpr	%hintp,	%o4
	rdpr	%cansave,	%l5
	fmul8x16al	%f4,	%f11,	%f6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
!Yo - got one - imm_asi 0x40 
!And yo - immediate is 0x318
	nop 	! 	nop 	! 	wr	%g0,	0x40,	%asi ripped by fixASI40.pl ripped by fixASI40.pl
	nop 	! 	nop 	! 	ldxa	[%g0 + 0x318] %asi,	%g2 ripped by fixASI40.pl ripped by fixASI40.pl
	tsubcc	%g5,	0x06EA,	%l3
	rdpr	%tba,	%g4
	rd	%ccr,	%l0
	tvs	%xcc,	0x1
	movrgez	%o5,	%o1,	%g1
	add	%l7,	0x60,	%l6
	wr	%g0,	0x04,	%asi
	lda	[%l6] %asi,	%i5
	casa	[%l6] %asi,	%i5,	%i3
	wr	%g7,	0x13A1,	%clear_softint
	fmovrsgz	%i1,	%f15,	%f23
	wrpr	%o3,	%o2,	%pil
	rdhpr	%hintp,	%i4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fabss	%f13,	%f25
	and	%o6,	%i7,	%l1
	fnot2	%f20,	%f16
	sdivcc	%l4,	0x019F,	%o0
	rd	%y,	%g3
	rdhpr	%hsys_tick_cmpr,	%i0
	fmovdvc	%xcc,	%f3,	%f6
	wrpr	%l6,	%l2,	%cwp
	fpsub32s	%f2,	%f20,	%f5
	rdhpr	%htba,	%o4
	be,a,pn	%xcc,	loop_209
	rdhpr	%hsys_tick_cmpr,	%g6
	wrpr	%l5,	0x0E9A,	%pil
	wrpr	%o7,	0x0587,	%pil
loop_209:
	udivcc	%g5,	0x0F95,	%g2
	subc	%l3,	0x176B,	%g4
	rd	%asi,	%l0
	fmovse	%xcc,	%f21,	%f17
	swap	[%l7 + 0x24],	%o1
	fmul8ulx16	%f30,	%f2,	%f14
	rdpr	%cwp,	%g1
	fblg,a	%fcc3,	loop_210
	rdhpr	%hintp,	%i5
	fbule	%fcc0,	loop_211
	rdpr	%pil,	%i3
loop_210:
	rdpr	%cwp,	%g7
	rdpr	%canrestore,	%o5
loop_211:
	rdhpr	%hpstate,	%o3
	popc	%o2,	%i4
	fmovrsgez	%i1,	%f27,	%f0
	fmul8x16al	%f26,	%f22,	%f28

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x819, 	%hsys_tick_cmpr
	udivx	%l1,	0x19D4,	%l4
	umul	%o0,	0x05E1,	%g3
	movle	%icc,	%i0,	%l2
	rd	%y,	%l6
	rdhpr	%hintp,	%o4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ble	loop_212
	rdhpr	%hintp,	%g6
	wr	%o7,	0x1E32,	%pic
	fcmped	%fcc2,	%f6,	%f20
loop_212:
	rdpr	%cleanwin,	%g5
	sdivcc	%l5,	0x0836,	%g2
	wrpr	%l3,	%l0,	%pil
	xorcc	%g4,	%o1,	%i5
	bne	%icc,	loop_213
	wr	%g1,	0x0E3E,	%sys_tick
	fmul8x16au	%f22,	%f17,	%f16
	ldsw	[%l7 + 0x08],	%i3
loop_213:
	rdhpr	%hintp,	%g7
	rdhpr	%hpstate,	%o5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	udivcc	%i1,	0x0293,	%i4
	wr	%i6,	0x1925,	%y
	rdhpr	%htba,	%i2
	membar	0x72
	rdpr	%tba,	%o6
	rdhpr	%hpstate,	%i7
	rdhpr	%hintp,	%l1
	rdhpr	%hintp,	%l4
	udivx	%o0,	0x082C,	%g3
	rdpr	%cwp,	%i0
	rdpr	%otherwin,	%l6
	smul	%l2,	0x1A53,	%g6
	rd	%asi,	%o4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	udivx	%g5,	0x171F,	%g2
	rdhpr	%hpstate,	%l0
	movn	%xcc,	%l3,	%o1
	rdpr	%cleanwin,	%i5
	fblg,a	%fcc3,	loop_214
	fmovdge	%xcc,	%f0,	%f9
	rdpr	%otherwin,	%g4
	fmovsvs	%icc,	%f0,	%f4
loop_214:
	or	%g1,	0x055B,	%g7
	udiv	%o5,	0x1444,	%o2
	tn	%xcc,	0x4
	wr 	%g0, 	0x7, 	%fprs
	movrne	%i4,	%i6,	%i2
	fornot1	%f10,	%f2,	%f28

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	brnz	%o3,	loop_215
	wr 	%g0, 	0x5, 	%fprs
	fmovrdlz	%l4,	%f28,	%f18
	bg,a,pt	%xcc,	loop_216
loop_215:
	rd	%sys_tick_cmpr,	%l1
	wr 	%g0, 	0x4, 	%fprs

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_216:
	rdpr	%canrestore,	%l6
	wr	%l2,	%g6,	%ccr
	rd	%y,	%o7
	edge8	%l5,	%g5,	%g2
	rdhpr	%hsys_tick_cmpr,	%o4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xB96, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	srlx	%g7,	%g1,	%o5
	wrpr	%i3,	0x14BF,	%cwp
	rdhpr	%hintp,	%i1
	movrgez	%i4,	%o2,	%i2
	rdpr	%canrestore,	%i6
	wr	%o3,	0x0160,	%set_softint
	fbl	%fcc1,	loop_217
	ta	%icc,	0x6
	ldsh	[%l7 + 0x3E],	%o6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_217:
	ble,a,pt	%icc,	loop_218
	wr	%l1,	%o0,	%pic
	rdpr	%wstate,	%i0
	fmovrsgez	%l4,	%f31,	%f10
loop_218:
	movle	%icc,	%g3,	%l6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x5C4, 	%hsys_tick_cmpr
	tgu	%icc,	0x3
	fmul8sux16	%f24,	%f16,	%f14
	alignaddr	%o7,	%g5,	%l5
	wr	%o4,	0x1911,	%softint
	call	loop_219
	tvc	%xcc,	0x4
	fcmple32	%f20,	%f28,	%g2
	rdpr	%pil,	%o1
loop_219:
	fbue,a	%fcc3,	loop_220
	rdpr	%tl,	%l3
	mova	%xcc,	%i5,	%l0
	wr	%g7,	%g4,	%sys_tick
loop_220:
	rdhpr	%hsys_tick_cmpr,	%g1
	add	%o5,	0x0961,	%i1
	fbuge	%fcc3,	loop_221
	tne	%icc,	0x6
	wrpr	%i4,	0x1E1C,	%cwp
	rdpr	%otherwin,	%i3
loop_221:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x483, 	%hsys_tick_cmpr
	rdpr	%gl,	%o2
	rd	%softint,	%i6
	wrpr	%o3,	%i7,	%cwp
	rdhpr	%htba,	%o6
	rd	%softint,	%l1
	rdhpr	%hintp,	%i0
	edge16	%o0,	%g3,	%l6
	wr	%l4,	0x0BE7,	%sys_tick
	movre	%l2,	0x14E,	%o7
	tcc	%icc,	0x5
	ble,a	%xcc,	loop_222
	rdpr	%otherwin,	%g6
	rdpr	%tl,	%g5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x87B, 	%hsys_tick_cmpr
loop_222:
	rdhpr	%hpstate,	%o4
	rd	%sys_tick_cmpr,	%g2
	addcc	%l3,	0x12A5,	%o1
	rdpr	%tl,	%l0
        wr    %g0,    0xe,    %pcr    ! changed.
	rdpr	%tl,	%g4
	rdhpr	%hpstate,	%g1
	fcmpgt16	%f26,	%f2,	%o5
	fcmpeq32	%f28,	%f24,	%i1
	rdhpr	%hsys_tick_cmpr,	%i4
	rdhpr	%hsys_tick_cmpr,	%i5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	movrgz	%o2,	%i2,	%o3
	rdhpr	%hsys_tick_cmpr,	%i6
	wrpr	%i7,	0x1B0C,	%pil
	te	%xcc,	0x1
	fbue	%fcc2,	loop_223
	fba	%fcc2,	loop_224
	sra	%l1,	0x1E,	%i0
	movpos	%icc,	%o6,	%o0
loop_223:
	fmuld8ulx16	%f25,	%f17,	%f16
loop_224:
	subc	%l6,	0x0729,	%g3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xB40, 	%tick_cmpr
	taddcctv	%l4,	0x02FC,	%o7
	std	%g6,	[%l7 + 0x38]
	wrpr	%g5,	0x1976,	%tick
	rdhpr	%hintp,	%o4
	ldd	[%l7 + 0x18],	%f30
	rdpr	%cwp,	%l5
	array16	%g2,	%l3,	%l0
	tsubcc	%g7,	0x1AA0,	%g4
	fcmpne16	%f16,	%f20,	%g1
	rdhpr	%hsys_tick_cmpr,	%o1
	rdhpr	%htba,	%i1
	rdhpr	%hpstate,	%o5
	rdpr	%tba,	%i5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x89E, 	%hsys_tick_cmpr
	rd	%pc,	%o2
	udivcc	%i2,	0x0F35,	%i4
	rdhpr	%hpstate,	%o3
	wr	%i7,	0x1287,	%y
	wr	%i6,	0x0C20,	%softint
	rdpr	%canrestore,	%l1
	brlez,a	%i0,	loop_225
	wr	%o0,	0x0041,	%sys_tick
	rdhpr	%hsys_tick_cmpr,	%o6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xEF2, 	%hsys_tick_cmpr
loop_225:
	rdpr	%cleanwin,	%g3
	movne	%icc,	%l4,	%o7
	srlx	%g5,	%o4,	%g6
	rdpr	%pil,	%l5
	rd	%fprs,	%g2
	addccc	%l0,	0x143F,	%l3
	wrpr	%g7,	0x003F,	%cwp
	wrpr	%g4,	0x13AE,	%tick
	fpsub32	%f18,	%f22,	%f24
	xor	%o1,	%i1,	%g1
	ld	[%l7 + 0x40],	%f10
	wr	%o5,	%i3,	%y
	prefetch	[%l7 + 0x4C],	 0x1
	rd	%softint,	%i5
	rdpr	%tba,	%i2
	rdpr	%pil,	%o2
	rdhpr	%hsys_tick_cmpr,	%o3
	wr	%i7,	0x02E2,	%clear_softint
	subccc	%i4,	0x1FF6,	%i6
	wrpr	%i0,	%o0,	%cwp
	wr	%l1,	0x17E2,	%pic
	movvs	%icc,	%o6,	%l6
	brnz	%l2,	loop_226
	rdpr	%cleanwin,	%l4
	sethi	0x0012,	%o7
	tle	%xcc,	0x7
loop_226:
	rdpr	%tba,	%g3
	movrlez	%g5,	0x122,	%o4
	rdpr	%wstate,	%g6
	set	0x30, %i7
	ldstuba	[%l7 + %i7] 0x19,	%g2
	movrne	%l0,	%l5,	%l3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%o1,	%i1,	%tick
	wr	%o5,	%i3,	%clear_softint
	rd	%fprs,	%i5
	wrpr	%i2,	0x1DE1,	%cwp
	wrpr	%g1,	%o3,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xED7, 	%hsys_tick_cmpr
	wr	%i6,	%i4,	%clear_softint
	rdpr	%cwp,	%i0
	edge16	%l1,	%o6,	%o0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x7AF, 	%sys_tick_cmpr
	fbn	%fcc0,	loop_227
	rdhpr	%hsys_tick_cmpr,	%l6
	fmovsvs	%xcc,	%f18,	%f21
	rdpr	%tl,	%g3
loop_227:
	rd	%y,	%o7
	rdhpr	%hsys_tick_cmpr,	%o4
	stw	%g6,	[%l7 + 0x74]

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	array8	%g5,	%l5,	%g7
	rd	%ccr,	%g4
	rdpr	%cleanwin,	%l3
	rd	%y,	%o1
	rdhpr	%hpstate,	%i1
	fblg	%fcc3,	loop_228
	fnor	%f14,	%f20,	%f20
	fbu,a	%fcc2,	loop_229
	rdpr	%canrestore,	%i3
loop_228:
	wrpr	%i5,	0x12FA,	%cwp
	fbul	%fcc1,	loop_230
loop_229:
	fnot1s	%f15,	%f20
	taddcc	%i2,	0x09A2,	%g1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xBCB, 	%hsys_tick_cmpr
loop_230:
	ldd	[%l7 + 0x78],	%f22
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%o2,	%i6,	%set_softint
	set	0x68, %o1
	prefetcha	[%l7 + %o1] 0x0c,	 0x3
	rdhpr	%hintp,	%i0
	wr	%l1,	%o6,	%clear_softint

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	movvs	%icc,	%l4,	%l2
	rd	%tick_cmpr,	%g3
	wrpr	%o7,	%l6,	%cwp
	fbule,a	%fcc2,	loop_231
	andcc	%g6,	0x0AE8,	%g2
	fbul	%fcc0,	loop_232
	rd	%pc,	%o4
loop_231:
	stb	%l0,	[%l7 + 0x57]
	array32	%l5,	%g5,	%g4
loop_232:
	wrpr	%g7,	%o1,	%tick
	rd	%fprs,	%i1
	fmovrdne	%l3,	%f14,	%f28
	mulx	%i5,	0x0249,	%i2
	fmovdvs	%xcc,	%f7,	%f14
	rdpr	%pil,	%g1
	fsrc2s	%f23,	%f28

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xC54, 	%hsys_tick_cmpr
	tleu	%xcc,	0x4
	edge8ln	%i7,	%o2,	%o3
	fble,a	%fcc2,	loop_233
	rdhpr	%htba,	%i0
	stb	%l1,	[%l7 + 0x42]
	movleu	%xcc,	%o6,	%i6
loop_233:
	rdpr	%cwp,	%o0
	movrlz	%i4,	%l2,	%l4
	rdhpr	%hintp,	%o7
	alignaddrl	%l6,	%g6,	%g3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x61F, 	%hsys_tick_cmpr
	fandnot1	%f0,	%f12,	%f20
	wr	%g0,	0x80,	%asi
	lda	[%l7 + 0x50] %asi,	%f26
	rdpr	%cansave,	%g2
	wr	%g5,	0x1071,	%y

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xD50, 	%hsys_tick_cmpr
	orncc	%g7,	%g4,	%o1
	wr	%i1,	0x1D77,	%softint
	rd	%asi,	%l3
	rdhpr	%htba,	%i2
	tg	%xcc,	0x7
	wrpr	%i5,	%g1,	%tick
	brgez	%o5,	loop_234
	lduw	[%l7 + 0x08],	%i3
	wr	%g0,	0xe3,	%asi
	stba	%i7,	[%l7 + 0x6B] %asi
	membar	#Sync
loop_234:
	rdhpr	%hintp,	%o2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x1E4, 	%hsys_tick_cmpr
	rdpr	%tl,	%l1
	wr	%o6,	%o0,	%pic
	rdhpr	%hpstate,	%i6
	fcmpne16	%f8,	%f14,	%l2
	rdpr	%cleanwin,	%l4
	rd	%tick_cmpr,	%o7
	rdhpr	%hintp,	%i4
	edge32l	%g6,	%l6,	%o4
	rdhpr	%hpstate,	%g3
	wr	%g2,	%g5,	%ccr
	rdpr	%wstate,	%l0
	rd	%pc,	%g7
	rdhpr	%hpstate,	%l5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xAF9, 	%hsys_tick_cmpr
	fcmple32	%f2,	%f4,	%o1
	rd	%asi,	%i1
	wrpr	%l3,	%i2,	%cwp
	rdpr	%canrestore,	%g1
	movleu	%icc,	%i5,	%i3
	mulscc	%o5,	0x0EEE,	%o2
	set	0x68, %o2
	stha	%i7,	[%l7 + %o2] 0x22
	membar	#Sync
	andcc	%i0,	0x1AF5,	%l1
	wrpr	%o6,	0x01D4,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xDB8, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x839, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xE00, 	%hsys_tick_cmpr
	fzero	%f16
	rdhpr	%hintp,	%o7
	rdhpr	%htba,	%l4
	movvc	%icc,	%g6,	%l6
	rdhpr	%hpstate,	%o4
	wr 	%g0, 	0x7, 	%fprs
	rdpr	%tl,	%g2
	fcmpeq32	%f4,	%f26,	%g5
	rdhpr	%htba,	%l0
	rd	%fprs,	%g7
	fmovdcc	%icc,	%f31,	%f9
	wr	%g4,	%o1,	%clear_softint
	movne	%icc,	%l5,	%i1
	rdhpr	%hintp,	%i2
	smul	%g1,	%l3,	%i3
	rdpr	%cleanwin,	%i5
	rdhpr	%hsys_tick_cmpr,	%o5
	wr	%o2,	0x1128,	%pic
	movge	%xcc,	%i0,	%l1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xC16, 	%hsys_tick_cmpr
	fpack32	%f18,	%f14,	%f0
	brgz	%o0,	loop_235
	wr	%l2,	%o3,	%clear_softint
	rdhpr	%hpstate,	%i6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x1E6, 	%hsys_tick_cmpr
loop_235:
	wrpr	%l6,	%l4,	%cwp
	faligndata	%f14,	%f26,	%f0
	wrpr	%o4,	0x1639,	%cwp
	wrpr	%i4,	0x082E,	%cwp
        wr    %g0,    0xe,    %pcr    ! changed.
	rdhpr	%hintp,	%g5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x09C, 	%hsys_tick_cmpr
	rdhpr	%hintp,	%g4
	rdhpr	%hsys_tick_cmpr,	%o1
	wrpr	%l5,	0x1709,	%pil
	tn	%xcc,	0x2
        wr    %g0,    0xe,    %pcr    ! changed.
	tsubcctv	%i2,	0x0023,	%g1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x00B, 	%hsys_tick_cmpr
	fpackfix	%f16,	%f21
	sethi	0x1389,	%i5
	wr	%g0,	0x18,	%asi
	ldswa	[%l7 + 0x10] %asi,	%o5
	wrpr	%i3,	%o2,	%cwp
	wrpr	%l1,	%i0,	%tick
	rdhpr	%hintp,	%i7
	edge32ln	%o6,	%l2,	%o0
	movrlz	%o3,	0x12B,	%i6
	movrne	%g6,	%o7,	%l6
	rdhpr	%hpstate,	%l4
	smulcc	%i4,	0x0970,	%o4
	edge16	%g2,	%g3,	%g5
	alignaddr	%g7,	%o1,	%l5
	subcc	%g4,	0x0B16,	%i2
	rdhpr	%hintp,	%l0
	fors	%f16,	%f9,	%f31
	movleu	%xcc,	%l3,	%g1
	srl	%i5,	%i1,	%o5
	membar	0x4E
	rdpr	%cwp,	%o2
	rdhpr	%hpstate,	%i3
	call	loop_236
	wr	%l1,	0x1155,	%softint
	wrpr	%i7,	0x048F,	%cwp
	movrlz	%i0,	0x220,	%l2
loop_236:
	wr	%o6,	%o3,	%pic
	rd	%pc,	%i6
	smul	%g6,	%o7,	%o0
	brnz,a	%l6,	loop_237
	fcmpgt16	%f0,	%f18,	%l4
	rdpr	%wstate,	%o4
	edge16l	%i4,	%g2,	%g5
loop_237:
	subccc	%g3,	%o1,	%l5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	add	%i2,	0x13D2,	%l3
	alignaddrl	%i5,	%i1,	%o5
	array16	%o2,	%g1,	%l1
	rdpr	%gl,	%i7
	xor	%i0,	0x1174,	%i3
	wr	%l2,	%o3,	%set_softint
	sdivcc	%i6,	0x174A,	%o6
	rd	%pc,	%o7
	rdpr	%canrestore,	%o0
	rd	%ccr,	%l6
	set	0x26, %i6
	stba	%g6,	[%l7 + %i6] 0xeb
	membar	#Sync
	fmovdne	%icc,	%f24,	%f31
	rd	%pc,	%o4
	tneg	%icc,	0x2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x182, 	%hsys_tick_cmpr
	rd	%softint,	%g2
	rd	%asi,	%g5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%o1,	0x039C,	%pic
	andcc	%g3,	0x0F59,	%l5
	subc	%g4,	0x042D,	%g7
	rd	%ccr,	%i2
	sll	%l0,	0x18,	%i5
	tle	%icc,	0x7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	tvs	%xcc,	0x3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	array32	%o2,	%g1,	%l1
	wr	%o5,	%i0,	%softint
	ldsw	[%l7 + 0x7C],	%i7
	rd	%softint,	%i3
	movneg	%xcc,	%o3,	%l2
	wrpr	%i6,	%o6,	%pil
	wrpr	%o7,	0x0E23,	%pil
	sll	%o0,	%l6,	%o4
	subc	%g6,	%g2,	%g5
	fpsub16s	%f7,	%f6,	%f10
	movvc	%icc,	%l4,	%i4
	smul	%g3,	0x1D01,	%l5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%tick_cmpr,	%g4
	wr	%i2,	%g7,	%y
	fblg	%fcc2,	loop_238
	alignaddr	%i5,	%l3,	%l0
	rd	%softint,	%i1
	rdpr	%canrestore,	%g1
loop_238:
	rd	%ccr,	%o2
	bl,a	loop_239
	rdpr	%tba,	%o5
	wrpr	%l1,	%i7,	%pil
	rd	%pc,	%i3
loop_239:
	smul	%i0,	0x0987,	%o3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x76F, 	%tick_cmpr
	rdpr	%gl,	%o0
	rdpr	%otherwin,	%l6
	fmovdleu	%icc,	%f4,	%f24
	rdhpr	%hintp,	%o7
	fbug	%fcc2,	loop_240
	tcs	%icc,	0x1
	fmovdneg	%xcc,	%f14,	%f2
	fmovrdlez	%g6,	%f28,	%f8
loop_240:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	movgu	%xcc,	%g2,	%l4
	subc	%i4,	%g5,	%l5
	srlx	%g3,	0x05,	%g4
	fand	%f16,	%f4,	%f8
	rdpr	%pil,	%i2
	bvc,a,pt	%xcc,	loop_241
	wrpr	%g7,	%i5,	%tick
	pdist	%f6,	%f6,	%f12

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_241:
	xorcc	%l3,	0x05F5,	%i1
	fpackfix	%f2,	%f5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%hintp,	%o2
	sll	%o5,	%l1,	%i7
	rdpr	%wstate,	%g1
	fmul8ulx16	%f14,	%f12,	%f30

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xE36, 	%tick_cmpr
	wrpr	%i0,	0x091C,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x8D6, 	%hsys_tick_cmpr
	rdhpr	%hsys_tick_cmpr,	%l2
	wr	%o0,	0x0C4D,	%ccr
	wr	%g0,	0x2f,	%asi
	stxa	%i6,	[%l7 + 0x40] %asi
	membar	#Sync
	edge32	%l6,	%g6,	%o7
	set	0x6E, %g7
	lduha	[%l7 + %g7] 0x04,	%o4
	fands	%f9,	%f26,	%f20
	addccc	%g2,	%i4,	%g5
	rd	%y,	%l4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%l5,	0x0D00,	%cwp
	lduh	[%l7 + 0x7A],	%g4
	wrpr	%i2,	%g7,	%tick
	fbe,a	%fcc0,	loop_242
	wrpr	%i5,	0x14D3,	%tick
	rdpr	%cleanwin,	%o1
	movne	%icc,	%l3,	%i1
loop_242:
	rdpr	%cansave,	%l0
	bne,a	%xcc,	loop_243
	bg	%icc,	loop_244
	wrpr	%o2,	%o5,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x614, 	%hsys_tick_cmpr
loop_243:
	edge8l	%i7,	%g1,	%o3
loop_244:
	rdpr	%tl,	%i0
	rdpr	%cleanwin,	%i3
	wrpr	%l2,	0x1F95,	%pil
	andcc	%o6,	0x1986,	%i6
	wrpr	%l6,	0x00A4,	%cwp
	rdhpr	%hpstate,	%g6
	andncc	%o0,	%o4,	%o7
	wrpr	%i4,	0x1FED,	%pil
	bvc,a	%icc,	loop_245
	movrne	%g2,	%l4,	%g5
	rdhpr	%hsys_tick_cmpr,	%l5
	smulcc	%g3,	0x0194,	%g4
loop_245:
	udivx	%g7,	0x0D4F,	%i5
	rd	%pc,	%o1
	fmovdne	%xcc,	%f13,	%f29
	wrpr	%l3,	0x0A37,	%pil
	movrlz	%i1,	0x2EE,	%l0
	rdhpr	%htba,	%i2
	tle	%icc,	0x0
	rdhpr	%hpstate,	%o5
	addc	%l1,	0x13C3,	%i7
	rdpr	%wstate,	%g1
	wrpr	%o3,	0x0CFE,	%tick
	tle	%xcc,	0x3
	wr	%i0,	0x1066,	%clear_softint
	rdpr	%cleanwin,	%i3
	brlez,a	%o2,	loop_246
	movleu	%xcc,	%l2,	%o6
	rd	%asi,	%l6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_246:
	rdpr	%canrestore,	%o4
	fmovsvs	%xcc,	%f10,	%f20
	alignaddr	%o7,	%i4,	%o0
	movne	%xcc,	%g2,	%g5
	stb	%l4,	[%l7 + 0x32]
	xor	%l5,	%g4,	%g7
	rdhpr	%hintp,	%i5
	rd	%tick_cmpr,	%g3
	bne,a	%xcc,	loop_247
	rd	%y,	%l3
	rdpr	%tba,	%o1
	fmovdn	%xcc,	%f3,	%f7
loop_247:
	rdhpr	%htba,	%i1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x1DD, 	%hsys_tick_cmpr
	set	0x44, %l0
	stba	%l1,	[%l7 + %l0] 0x15

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x949, 	%hsys_tick_cmpr
	rdhpr	%htba,	%o5
	wrpr	%i0,	0x0EA1,	%cwp
	fmovsvc	%xcc,	%f5,	%f24
	orncc	%i3,	0x0EF5,	%o2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	movre	%l6,	%g6,	%i6
	wr	%o4,	0x01EE,	%clear_softint
	fbu	%fcc0,	loop_248
	wrpr	%o7,	%o0,	%tick
	movle	%xcc,	%g2,	%g5
	rdhpr	%hpstate,	%i4
loop_248:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xE7E, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	addcc	%g7,	0x0F12,	%i5
	rdpr	%wstate,	%g3
	bneg,a,pn	%icc,	loop_249
	rd	%asi,	%l3
	rd	%ccr,	%o1
	rdpr	%tba,	%l0
loop_249:
	rdhpr	%hsys_tick_cmpr,	%i2
	wrpr	%i1,	%l1,	%cwp
	edge16n	%i7,	%g1,	%o5
	fble	%fcc2,	loop_250
	st	%f23,	[%l7 + 0x14]
	wr	%i0,	%o2,	%clear_softint
	rd	%tick_cmpr,	%l2
loop_250:
	tvs	%xcc,	0x3
	wr	%i3,	0x0E91,	%ccr
	fmovrdgez	%o3,	%f2,	%f8
	set	0x1C, %o4
	lduha	[%l7 + %o4] 0x81,	%o6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xFF7, 	%hsys_tick_cmpr
	rd	%tick_cmpr,	%o4
	fandnot2s	%f11,	%f24,	%f0
	rd	%ccr,	%o7
	wrpr	%o0,	%g2,	%cwp
	rdhpr	%hpstate,	%l6
	array16	%g5,	%i4,	%l4
	set	0x2A, %g1
	ldsba	[%l7 + %g1] 0x11,	%l5
	rdhpr	%hsys_tick_cmpr,	%g4
	tcs	%icc,	0x2
	sll	%g7,	%i5,	%l3
	alignaddrl	%g3,	%l0,	%i2
	rdpr	%wstate,	%o1
	rdpr	%cleanwin,	%l1
        wr    %g0,    0xe,    %pcr    ! changed.

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x9CC, 	%hsys_tick_cmpr
	fmovdvs	%icc,	%f21,	%f10
	edge32l	%i7,	%l2,	%o2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%o6,	0x085E,	%tick
	rdpr	%tba,	%o3
	xorcc	%i6,	%o4,	%g6
	rd	%pc,	%o7
	fandnot1s	%f27,	%f7,	%f22
	wr	%g0,	0x89,	%asi
	stba	%g2,	[%l7 + 0x17] %asi

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x879, 	%hsys_tick_cmpr
	fmovdgu	%icc,	%f15,	%f19
	fmul8x16al	%f25,	%f15,	%f8
	wr	%i4,	0x1A80,	%softint
	wrpr	%g5,	%l4,	%cwp
	fmovrdne	%g4,	%f22,	%f30
	edge16n	%g7,	%l5,	%l3
	rdpr	%otherwin,	%i5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xD27, 	%sys_tick_cmpr
	rdhpr	%htba,	%l0
	rd	%y,	%i2
	fbule,a	%fcc2,	loop_251
	fnand	%f22,	%f0,	%f30
	fmovrdgz	%o1,	%f16,	%f2
	sir	0x03B9
loop_251:
	alignaddr	%l1,	%g1,	%i1
	wrpr	%i0,	0x17DE,	%cwp
	fpmerge	%f27,	%f29,	%f16
	rd	%y,	%i7
	rdhpr	%htba,	%l2
	rdpr	%cansave,	%o5
	wr	%o2,	%i3,	%clear_softint
	movcc	%icc,	%o6,	%o3
	rdhpr	%hintp,	%i6
	fmovrsgez	%g6,	%f2,	%f16

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	rdpr	%gl,	%g2
	orncc	%l6,	%o0,	%o4
	wr	%g0,	0x19,	%asi
	stba	%g5,	[%l7 + 0x77] %asi
	rd	%ccr,	%l4
        wr    %g0,    0xe,    %pcr    ! changed.

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xB8B, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%hsys_tick_cmpr,	%i5
	rd	%ccr,	%l5
	rdpr	%pil,	%l0
	fmovdvs	%xcc,	%f14,	%f31
	wrpr	%g3,	%i2,	%tick
	edge8n	%l1,	%g1,	%i1
	membar	0x22
	faligndata	%f0,	%f14,	%f12

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	udivcc	%i7,	0x1655,	%l2
	rdpr	%tl,	%i0
	movle	%xcc,	%o2,	%i3
	rdhpr	%hpstate,	%o5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xA55, 	%hsys_tick_cmpr
	bgu	%icc,	loop_252
	fnor	%f26,	%f2,	%f4
	movrlez	%o6,	%g6,	%o7
	rdhpr	%hintp,	%g2
loop_252:
	nop
	wr	%g0,	0x89,	%asi
	prefetcha	[%l7 + 0x20] %asi,	 0x2
	edge8	%o0,	%g5,	%o4
	smulcc	%g4,	%l4,	%i4
	rdhpr	%htba,	%g7
	tvc	%icc,	0x7
	rdpr	%cwp,	%l3
	wr	%g0,	0x80,	%asi
	ldsba	[%l7 + 0x35] %asi,	%i5
	rdpr	%canrestore,	%l5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x45A, 	%hsys_tick_cmpr
	rd	%y,	%l0
	wrpr	%l1,	0x09EC,	%tick
	wrpr	%g1,	0x0E2A,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	smul	%i2,	0x173A,	%i7
	rd	%pc,	%o1
	wr	%g0,	0x81,	%asi
	ldsba	[%l7 + 0x2C] %asi,	%i0
	fmovsa	%xcc,	%f30,	%f12
	movle	%xcc,	%o2,	%i3
	rdhpr	%hsys_tick_cmpr,	%o5
	rdhpr	%hsys_tick_cmpr,	%o3
	fmuld8sux16	%f9,	%f4,	%f20

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x18C, 	%sys_tick_cmpr
	movge	%xcc,	%i6,	%o6
	nop
	set	0x35, %o0
	ldstub	[%l7 + %o0],	%o7
	rdpr	%canrestore,	%g6
	srlx	%g2,	%l6,	%o0
	wr	%g5,	0x1DAB,	%clear_softint
	wr	%g4,	0x1BFE,	%softint

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	xnor	%i4,	0x1DF2,	%g7
	rdhpr	%htba,	%l3
	rdpr	%tba,	%l4
	wrpr	%l5,	0x1B28,	%tick
	wrpr	%i5,	%g3,	%tick
	rd	%ccr,	%l1
	wr 	%g0, 	0x5, 	%fprs
	fbo	%fcc2,	loop_253
	edge32ln	%l0,	%i2,	%o1
	wrpr	%i0,	0x0030,	%tick
	edge8l	%i7,	%o2,	%i3
loop_253:
	wr 	%g0, 	0x4, 	%fprs
	add	%i6,	0x106C,	%o5
	wrpr	%o6,	0x0253,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xA7F, 	%tick_cmpr
	wrpr	%l6,	%o7,	%pil
	rdpr	%tba,	%o0
	tle	%xcc,	0x1
	fnor	%f24,	%f18,	%f6
	xor	%g4,	0x1AAF,	%o4
	rdhpr	%hintp,	%i4
	rd	%y,	%g7
	lduh	[%l7 + 0x7A],	%g5
	rdhpr	%hpstate,	%l3
	fmovrsgz	%l4,	%f4,	%f17
	rdhpr	%hintp,	%i5
	rd	%fprs,	%g3
	edge16	%l5,	%g1,	%i1
	movrlez	%l0,	%i2,	%o1
	array8	%l1,	%i7,	%i0
	bshuffle	%f12,	%f24,	%f4
	fnegd	%f8,	%f30
	rdhpr	%hintp,	%i3
	fmovsne	%icc,	%f15,	%f7
        wr    %g0,    0xe,    %pcr    ! changed.
	rdpr	%pil,	%i6
	array32	%o5,	%o6,	%o3
	umul	%g2,	0x18F1,	%l6
	wrpr	%g6,	0x00E1,	%tick
	wr	%o0,	0x0304,	%ccr
	movvs	%icc,	%g4,	%o7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	and	%i4,	%g7,	%g5
	wrpr	%l4,	%i5,	%cwp
	fmovdle	%xcc,	%f15,	%f20
	wr 	%g0, 	0x5, 	%fprs
	fmovdcc	%icc,	%f8,	%f20

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xD01, 	%hsys_tick_cmpr
	sll	%g1,	0x02,	%i1
	add	%l7,	0x68,	%l6
	wr	%g0,	0x18,	%asi
	casa	[%l6] 0x18,	%i2,	%l0
	rdpr	%cleanwin,	%o1
	rdhpr	%hpstate,	%l1
	udivcc	%i7,	0x0AB2,	%i3
	rdpr	%cansave,	%i0
	rd	%ccr,	%o2
	rd	%fprs,	%i6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xCEA, 	%hsys_tick_cmpr
	wrpr	%o3,	0x1E5D,	%pil
	wrpr	%o5,	%l6,	%pil
	tn	%icc,	0x7
	rdpr	%gl,	%g6
	tcc	%xcc,	0x6
	movg	%xcc,	%o0,	%g2
	fcmpne32	%f28,	%f8,	%g4
	tleu	%icc,	0x4
	wr 	%g0, 	0x6, 	%fprs
	mulx	%i4,	0x14A2,	%g7
	rdpr	%wstate,	%g5
	rdhpr	%htba,	%l4
	rdhpr	%hintp,	%g3
	fone	%f24

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x252, 	%hsys_tick_cmpr
	srlx	%l3,	0x14,	%i5
	movgu	%xcc,	%g1,	%i2
	edge32l	%i1,	%o1,	%l0
	tvc	%icc,	0x0
	membar	#Sync
	set	0x40, %i3
	ldda	[%l7 + %i3] 0xf0,	%f16

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x436, 	%hsys_tick_cmpr
	rdhpr	%hpstate,	%l1
	tvs	%xcc,	0x7
	ba,a	loop_254
	fnot2s	%f20,	%f16
	fmovdge	%icc,	%f14,	%f26
	tcc	%icc,	0x2
loop_254:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x619, 	%sys_tick_cmpr
	rd	%softint,	%o2
	wr	%i6,	%l2,	%pic
	rdpr	%wstate,	%i3
	edge8n	%o6,	%o5,	%l6
	fxor	%f16,	%f6,	%f2
	rd	%y,	%g6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xBD0, 	%hsys_tick_cmpr
	edge32n	%g4,	%o3,	%o7
	nop
	set	0x58, %i1
	ldd	[%l7 + %i1],	%f6
	brgez,a	%o4,	loop_255
	wr	%i4,	%g7,	%clear_softint

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xED9, 	%hsys_tick_cmpr
	wrpr	%g5,	0x0E63,	%tick
loop_255:
	edge8ln	%g3,	%l3,	%i5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%cwp,	%i2
	rdpr	%wstate,	%o1
	wrpr	%i1,	%l0,	%tick
	rdhpr	%hpstate,	%l1
	rdhpr	%hintp,	%i0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	sll	%o2,	%l2,	%i6
	membar	0x31
	stx	%o6,	[%l7 + 0x08]
	rdpr	%cwp,	%o5
        wr    %g0,    0xe,    %pcr    ! changed.
	rdhpr	%hintp,	%g6
	wr	%g0,	0x19,	%asi
	ldstuba	[%l7 + 0x74] %asi,	%i3
	tleu	%icc,	0x6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x04D, 	%hsys_tick_cmpr
	rd	%pc,	%g4
	wrpr	%g2,	0x17DE,	%pil
	rdhpr	%hsys_tick_cmpr,	%o3
	tneg	%icc,	0x3
	rd	%y,	%o7
	rd	%tick_cmpr,	%i4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	set	0x68, %g6
	ldsha	[%l7 + %g6] 0x11,	%l4
	or	%g5,	%g3,	%l3
	rdpr	%otherwin,	%g7
	rdhpr	%htba,	%i5
	wr	%g1,	%l5,	%sys_tick
	xorcc	%o1,	0x186A,	%i1
	wr	%i2,	%l1,	%pic
	rd	%asi,	%i0
	wr	%l0,	%o2,	%set_softint
	udivcc	%i7,	0x15E9,	%i6
	rdpr	%tl,	%l2
	xnor	%o6,	0x0818,	%o5
	addc	%l6,	0x115C,	%i3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	bg	loop_256
	wrpr	%g2,	%o3,	%tick
	rd	%fprs,	%g6
	rdhpr	%htba,	%o7
loop_256:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	addccc	%l4,	0x0E02,	%g5
	wr 	%g0, 	0x6, 	%fprs
	wrpr	%g3,	0x13C7,	%pil
	set	0x22, %l2
	stha	%i5,	[%l7 + %l2] 0x88
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	rdhpr	%hintp,	%g7
	sub	%l5,	0x0CA2,	%g1
	subcc	%i1,	0x10F4,	%i2
	wr	%o1,	0x018B,	%set_softint
	movgu	%xcc,	%i0,	%l0
	wr	%o2,	%l1,	%set_softint
	edge16n	%i6,	%i7,	%l2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	movvs	%xcc,	%l6,	%i3
	rd	%ccr,	%o0
	rd	%asi,	%g4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xDE0, 	%hsys_tick_cmpr
	rd	%softint,	%o6
	sdivx	%o3,	0x1090,	%g6
	wr	%o4,	%o7,	%pic
	wr 	%g0, 	0x7, 	%fprs
	fmovs	%f19,	%f29
	fnegd	%f24,	%f10
	wrpr	%l4,	0x0E79,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x927, 	%hsys_tick_cmpr
	rdhpr	%hsys_tick_cmpr,	%l3
	wrpr	%i5,	0x0D1E,	%tick
	rdpr	%cwp,	%l5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x278, 	%hsys_tick_cmpr
	rdpr	%tba,	%g1
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x34] %asi,	%i1
	popc	0x01A0,	%o1
	edge16	%i2,	%i0,	%o2
	rdpr	%cwp,	%l0
	fones	%f29
	ld	[%l7 + 0x70],	%f31
	mulx	%l1,	0x0105,	%i6
	movl	%xcc,	%i7,	%l2
	rd	%fprs,	%l6
	rd	%asi,	%i3
	wrpr	%o5,	0x0E50,	%cwp
	movre	%g4,	0x341,	%o0
	fmovsne	%xcc,	%f13,	%f18
	rdpr	%canrestore,	%g2
	rdpr	%pil,	%o3
	nop
	set	0x78, %i4
	ldx	[%l7 + %i4],	%o6
	fzeros	%f30
	rdpr	%canrestore,	%o4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x038, 	%hsys_tick_cmpr
	edge8n	%g5,	%o7,	%l4
	andn	%g3,	%i4,	%l3
	fbu	%fcc2,	loop_257
	fors	%f3,	%f28,	%f27
	rdhpr	%htba,	%l5
	wr	%i5,	%g7,	%pic
loop_257:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xAAE, 	%hsys_tick_cmpr
	bleu	%xcc,	loop_258
	fmul8sux16	%f0,	%f18,	%f18
	fmovs	%f26,	%f27

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x811, 	%hsys_tick_cmpr
loop_258:
	wrpr	%i2,	0x0395,	%cwp
	ta	%xcc,	0x0
	sub	%l0,	0x0AB7,	%l1
	tcc	%icc,	0x4
	addccc	%i6,	0x1626,	%o2
	wrpr	%l2,	%l6,	%tick
	wrpr	%i7,	0x1F4A,	%tick
	rd	%asi,	%i3
	rdpr	%gl,	%g4
	movvc	%xcc,	%o0,	%o5
	wr	%g0,	0x11,	%asi
	stda	%g2,	[%l7 + 0x20] %asi
	or	%o3,	0x1D4A,	%o4
	set	0x3B, %l5
	stba	%g6,	[%l7 + %l5] 0x88
	rdhpr	%hintp,	%g5
	rd	%softint,	%o7
	edge16ln	%l4,	%g3,	%o6
	edge8n	%l3,	%i4,	%l5
	xnor	%i5,	0x1E3E,	%g1
	taddcctv	%g7,	0x1FC5,	%o1
	rdpr	%canrestore,	%i0
!Yo - got one - imm_asi 0x50 
!And yo - immediate is 0x30
	set	0x30, %l3
	ldxa	[%g0 + %l3] 0x50,	%i2
	brz	%i1,	loop_259
	movcc	%icc,	%l0,	%i6
	rdhpr	%htba,	%o2
	wrpr	%l2,	0x07E5,	%cwp
loop_259:
	rdhpr	%htba,	%l6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xA17, 	%hsys_tick_cmpr
	rd	%sys_tick_cmpr,	%o0
	rd	%tick_cmpr,	%g4
	fmovrdlez	%g2,	%f16,	%f8
	fmovrslz	%o3,	%f16,	%f18
	sdiv	%o4,	0x1AF9,	%o5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x3FB, 	%sys_tick_cmpr
	rdpr	%cansave,	%g6
	fpadd16s	%f8,	%f18,	%f2
	fmul8x16	%f13,	%f26,	%f4
	tsubcctv	%l4,	0x06AF,	%g3
	wr	%o7,	0x1B60,	%clear_softint
	srl	%o6,	0x1C,	%l3
	rdpr	%cleanwin,	%i4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x66E, 	%hsys_tick_cmpr
	set	0x10, %i2
	ldxa	[%l7 + %i2] 0x81,	%g7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%i0,	0x1FEC,	%sys_tick
	rdhpr	%hintp,	%l5
	set	0x50, %l4
	ldsha	[%l7 + %l4] 0x15,	%i2
	wr	%l0,	%i6,	%ccr
	rdpr	%tl,	%o2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%sys_tick_cmpr,	%l2
	andncc	%l1,	%i3,	%i7
	wrpr	%l6,	0x1C8A,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	stbar

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fornot1	%f30,	%f30,	%f2
	edge32	%o3,	%g2,	%o5
	set	0x68, %g4
	sta	%f26,	[%l7 + %g4] 0x80
	fbue	%fcc2,	loop_260
	smulcc	%o4,	%g6,	%g5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xF13, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x4D2, 	%hsys_tick_cmpr
loop_260:
	orncc	%o7,	%o6,	%i4
	andcc	%l3,	0x065F,	%i5
	call	loop_261
	rdhpr	%hintp,	%g7
	movrgez	%o1,	0x1B7,	%g1
	rdpr	%gl,	%l5
loop_261:
	bpos	loop_262
        wr    %g0,    0xe,    %pcr    ! changed.
	udiv	%i6,	0x1555,	%o2
	bvs,pt	%icc,	loop_263
loop_262:
	rdpr	%tba,	%l0
        wr    %g0,    0xe,    %pcr    ! changed.
	fxnor	%f0,	%f30,	%f6
loop_263:
	addc	%i3,	%l1,	%i7
	movle	%icc,	%l6,	%g4
	fandnot1	%f16,	%f0,	%f30
	wrpr	%o3,	%o0,	%tick
	rd	%softint,	%o5
	rdpr	%tl,	%g2
	rdpr	%tl,	%o4
	addc	%g6,	0x0DCC,	%g5
	wrpr	%g3,	0x0901,	%tick
	rdpr	%pil,	%l4
	wrpr	%o6,	0x1E2B,	%tick
	wr	%g0,	0x89,	%asi
	swapa	[%l7 + 0x14] %asi,	%i4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	popc	0x115B,	%i5
	xor	%l3,	%o1,	%g7
	mulx	%g1,	%i0,	%i2
	wr	%l5,	%i6,	%ccr
	rd	%fprs,	%o2
	rdhpr	%hpstate,	%i1
	wrpr	%l0,	0x15BD,	%pil
	te	%xcc,	0x3
	swap	[%l7 + 0x40],	%i3
	bneg,pn	%icc,	loop_264
	taddcc	%l2,	%i7,	%l1
	bvc,pt	%icc,	loop_265
	mulx	%g4,	0x0450,	%o3
loop_264:
	std	%o0,	[%l7 + 0x18]
	wr	%g0,	0x10,	%asi
	lduha	[%l7 + 0x1E] %asi,	%o5
loop_265:
	movn	%icc,	%l6,	%g2
	tcs	%icc,	0x4
	rd	%pc,	%o4
	wrpr	%g6,	0x184B,	%tick
	fbl,a	%fcc3,	loop_266
	rdpr	%gl,	%g5
	rdpr	%cleanwin,	%g3
	wrpr	%l4,	%i4,	%pil
loop_266:
	rdpr	%cansave,	%o6
	fbue	%fcc0,	loop_267
	rd	%sys_tick_cmpr,	%o7
	addccc	%l3,	%o1,	%g7
	rd	%sys_tick_cmpr,	%g1
loop_267:
	wr 	%g0, 	0x5, 	%fprs
	taddcc	%l5,	0x0798,	%i0
	wrpr	%o2,	%i6,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%htba,	%l0
	wrpr	%i3,	0x170D,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x495, 	%hsys_tick_cmpr
	movle	%xcc,	%g4,	%o3
	fabss	%f16,	%f6
	rdhpr	%hsys_tick_cmpr,	%o0
	wrpr	%o5,	0x08D2,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x45B, 	%sys_tick_cmpr
	edge8	%g2,	%o4,	%l6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%hpstate,	%l4
	smulcc	%i4,	0x03A7,	%g5
	wrpr	%o6,	%l3,	%tick
	wr	%o1,	0x0AAC,	%clear_softint
	sdivx	%g7,	0x186B,	%g1
	fcmpes	%fcc2,	%f11,	%f7
	wr 	%g0, 	0x5, 	%fprs
	tg	%icc,	0x7
	rdpr	%wstate,	%o7
	rdpr	%wstate,	%i0
	rd	%fprs,	%o2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	subccc	%i1,	0x0E54,	%l0
	taddcc	%l5,	0x0199,	%l2
	fmovdleu	%xcc,	%f31,	%f26
	fnot1s	%f27,	%f24
	rdpr	%cansave,	%i3
	movcs	%icc,	%i7,	%o3
	rdpr	%canrestore,	%o0
	bne	loop_268
	fmovrde	%o5,	%f6,	%f0
	wrpr	%g4,	0x0FC3,	%tick
	bvc,a,pt	%icc,	loop_269
loop_268:
	fmovrdne	%g2,	%f30,	%f12
	bl	loop_270
	rdpr	%canrestore,	%o4
loop_269:
	rdhpr	%hintp,	%l6
	rdpr	%tl,	%l1
loop_270:
	edge16l	%g3,	%l4,	%i4
	fpadd16	%f10,	%f26,	%f22
	orcc	%g5,	%g6,	%o6
	wr	%o1,	%l3,	%ccr
	movcs	%xcc,	%g1,	%i5
	fmovse	%xcc,	%f23,	%f21
	rdhpr	%htba,	%g7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x645, 	%hsys_tick_cmpr
	rdhpr	%htba,	%i0
	wr	%o2,	%i6,	%ccr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%softint,	%o7
	fmovspos	%icc,	%f11,	%f18
	tle	%xcc,	0x5
	fornot1	%f10,	%f18,	%f4
	subc	%l0,	0x1939,	%l2
	fmovsne	%icc,	%f5,	%f14
	srax	%i3,	0x07,	%i7
	wrpr	%l5,	%o0,	%tick
	wr	%o3,	%g4,	%y
	bcs	loop_271
	rdhpr	%hsys_tick_cmpr,	%g2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xEA6, 	%sys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x47B, 	%tick_cmpr
loop_271:
	wrpr	%o5,	%l1,	%pil
	subccc	%g3,	%i4,	%l4
	edge16ln	%g6,	%o6,	%o1
	wrpr	%g5,	0x1155,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x3B0, 	%hsys_tick_cmpr
	wrpr	%i5,	%g7,	%pil
	fsrc2s	%f19,	%f19

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	and	%o2,	%i6,	%i1
	movl	%icc,	%l0,	%o7
	mulscc	%i3,	%i7,	%l2
	movcc	%icc,	%l5,	%o3
	brlez	%o0,	loop_272
	nop
	setx	loop_273,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fxnors	%f29,	%f24,	%f25
	andncc	%g2,	%g4,	%l6
loop_272:
	array32	%o5,	%o4,	%l1
loop_273:
	movne	%icc,	%i4,	%l4
	rdhpr	%hpstate,	%g6
	std	%f14,	[%l7 + 0x78]
	call	loop_274
	rd	%fprs,	%g3
	rdhpr	%hintp,	%o6
	wr	%o1,	%g1,	%clear_softint
loop_274:
	wrpr	%l3,	0x1D42,	%pil
	rdpr	%cansave,	%g5
	wrpr	%i5,	0x1CA1,	%cwp
	wrpr	%g7,	%i2,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x65A, 	%hsys_tick_cmpr
	sll	%o2,	0x15,	%i1
	fbul,a	%fcc3,	loop_275
	fbuge,a	%fcc2,	loop_276
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x987, 	%tick_cmpr
loop_275:
	fmul8x16	%f5,	%f16,	%f30
loop_276:
	wr	%i3,	%i6,	%y
	rd	%pc,	%i7
	wr	%l2,	%o3,	%softint
	rdhpr	%htba,	%o0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%gl,	%g4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fandnot1	%f24,	%f24,	%f26
	wrpr	%o4,	%l1,	%cwp
	rdhpr	%hpstate,	%l4
	rd	%y,	%g6
	rdhpr	%hsys_tick_cmpr,	%i4
	srlx	%o6,	%g3,	%g1
	movne	%icc,	%o1,	%l3
	fsrc1	%f8,	%f28
	sth	%g5,	[%l7 + 0x34]
	bneg,pn	%icc,	loop_277
	rdpr	%tl,	%i5
        wr    %g0,    0xe,    %pcr    ! changed.
	rdhpr	%hsys_tick_cmpr,	%g7
loop_277:
	rd	%fprs,	%i1
	rd	%fprs,	%l0
	orn	%o2,	0x179D,	%o7
	rdhpr	%hpstate,	%i6
	rd	%fprs,	%i3
	movne	%xcc,	%l2,	%i7
	bcs,pt	%icc,	loop_278
	rdpr	%wstate,	%o3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x382, 	%hsys_tick_cmpr
	rd	%y,	%l5
loop_278:
	orcc	%g4,	0x0C1C,	%o5
	rdpr	%canrestore,	%l6
	fpadd16	%f16,	%f8,	%f26
	rd	%y,	%g2
	edge8l	%o4,	%l4,	%l1
	sub	%i4,	%g6,	%o6
	bcc,pt	%icc,	loop_279
	rd	%softint,	%g3
	wr	%o1,	%l3,	%ccr
	bpos,a	%xcc,	loop_280
loop_279:
	rdpr	%cleanwin,	%g1
	sir	0x1763
	fmovrslez	%g5,	%f11,	%f5
loop_280:
	brgz	%i5,	loop_281
	edge16n	%i0,	%i2,	%i1
	movvs	%icc,	%l0,	%o2
	rdpr	%canrestore,	%o7
loop_281:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%hpstate,	%i3
	subcc	%l2,	0x1B26,	%i6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xB96, 	%hsys_tick_cmpr
	call	loop_282
	subc	%i7,	%o0,	%g4
	rdpr	%wstate,	%o5
	rdpr	%otherwin,	%l5
loop_282:
	rdhpr	%hpstate,	%g2
	rd	%ccr,	%l6
	rd	%sys_tick_cmpr,	%l4
	fmovsvs	%xcc,	%f24,	%f11
	rd	%sys_tick_cmpr,	%l1
	srlx	%o4,	%i4,	%g6
	movvc	%xcc,	%g3,	%o1
	bleu,a	loop_283
	array32	%o6,	%g1,	%g5
	rdpr	%gl,	%l3
	rdhpr	%hintp,	%i0
loop_283:
	tcc	%xcc,	0x7
	xnorcc	%i2,	0x1E26,	%i1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x83A, 	%hsys_tick_cmpr
	rd	%fprs,	%o2
	fmul8x16au	%f29,	%f22,	%f20
	fmovsvs	%xcc,	%f8,	%f21
	movrgez	%l0,	%o7,	%g7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%i3,	%i6,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x13A, 	%hsys_tick_cmpr
	rd	%y,	%g4
	rd	%asi,	%o5
	rdhpr	%htba,	%l5
	call	loop_284
	alignaddrl	%g2,	%o3,	%l6
	brnz,a	%l4,	loop_285
	rdpr	%cwp,	%l1
loop_284:
	wr	%o4,	%i4,	%ccr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_285:
	rdhpr	%hintp,	%o6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x3E6, 	%hsys_tick_cmpr
	rdpr	%cansave,	%g5
	fmovspos	%xcc,	%f22,	%f2
	rdhpr	%hpstate,	%g1
	rdhpr	%hintp,	%i0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x21C, 	%hsys_tick_cmpr
	rdhpr	%htba,	%i2
	edge32l	%o2,	%l0,	%i5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x4F7, 	%hsys_tick_cmpr
	rdpr	%tl,	%l2
	wrpr	%o7,	%i6,	%pil
	tcc	%icc,	0x1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	fmovrde	%i7,	%f26,	%f12
	set	0x40, %l1
	stda	%f0,	[%l7 + %l1] 0xd2
	fbuge,a	%fcc2,	loop_286
	rdhpr	%htba,	%g4
	membar	0x76
	fzeros	%f26
loop_286:
	rdpr	%canrestore,	%o5
	movleu	%xcc,	%l5,	%o0
	rdpr	%canrestore,	%g2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	rdpr	%canrestore,	%l4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	rdhpr	%hsys_tick_cmpr,	%g6
	rdpr	%otherwin,	%o1
	rdpr	%cansave,	%o6
	edge8	%g3,	%g5,	%i0
	wrpr	%l3,	%g1,	%pil
	rdpr	%otherwin,	%i2
	rd	%pc,	%o2
	rdhpr	%hpstate,	%l0
	ldd	[%l7 + 0x48],	%f10
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	rdpr	%gl,	%i1
	sub	%i5,	%g7,	%o7
	wr	%i6,	%i3,	%sys_tick
	rdhpr	%hpstate,	%i7
	rd	%asi,	%l2
	wrpr	%g4,	0x0E21,	%cwp
	pdist	%f10,	%f0,	%f10
	smulcc	%o5,	0x1868,	%l5
	rd	%ccr,	%g2
	wrpr	%o3,	%o0,	%pil
	movleu	%icc,	%l4,	%o4
	fmovrslz	%l6,	%f29,	%f17
	sdiv	%i4,	0x1600,	%l1
	xnor	%o1,	%o6,	%g3
	rdhpr	%hsys_tick_cmpr,	%g5
	rdhpr	%hintp,	%i0
	bn,a,pt	%xcc,	loop_287
	subc	%g6,	0x0B2B,	%g1
	mulscc	%i2,	0x1B84,	%o2
	wrpr	%l3,	%i1,	%pil
loop_287:
	wr	%l0,	%g7,	%clear_softint
	array8	%o7,	%i5,	%i6
	rdpr	%wstate,	%i7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%l2,	0x0060,	%set_softint
	nop
	set	0x10, %o5
	std	%o4,	[%l7 + %o5]
	rd	%pc,	%l5
	lduw	[%l7 + 0x18],	%g2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x65D, 	%hsys_tick_cmpr
	rdpr	%canrestore,	%o0
	rdpr	%tba,	%o3
	fmovspos	%icc,	%f13,	%f20
	srlx	%o4,	%l6,	%l4
	subcc	%l1,	%o1,	%o6
	edge32	%g3,	%g5,	%i4
	set	0x60, %g2
	ldda	[%l7 + %g2] 0xe3,	%g6
	sth	%g1,	[%l7 + 0x56]
	wr	%g0,	0x10,	%asi
	ldswa	[%l7 + 0x3C] %asi,	%i2
	rdpr	%tl,	%i0
	wrpr	%o2,	%l3,	%pil
	rd	%fprs,	%l0
	rdpr	%gl,	%i1
	fmovdne	%icc,	%f24,	%f8
	nop
	setx	loop_288,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	rd	%asi,	%o7
	rdhpr	%hintp,	%i5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x722, 	%hsys_tick_cmpr
loop_288:
	rdpr	%cleanwin,	%i3
	add	%l7,	0x34,	%l6
	wr	%g0,	0x11,	%asi
	casa	[%l6] %asi,	%i7,	%o5
	wrpr	%l2,	%g2,	%pil
	tcs	%xcc,	0x7
	movcc	%xcc,	%l5,	%g4
	movcs	%icc,	%o3,	%o0
	xor	%l6,	%l4,	%o4
	wrpr	%o1,	0x09FF,	%cwp
	rdhpr	%hsys_tick_cmpr,	%o6
	rdhpr	%htba,	%l1
	orcc	%g5,	0x192A,	%i4
	wrpr	%g3,	0x0ED9,	%tick
	array16	%g6,	%g1,	%i2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x2AF, 	%tick_cmpr
	rdhpr	%hintp,	%l0
	fmovdleu	%xcc,	%f29,	%f25
	wrpr	%i1,	0x0D69,	%tick
	wr	%g0,	0x80,	%asi
	ldstuba	[%l7 + 0x16] %asi,	%o7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	nop
	set	0x44, %o3
	lduw	[%l7 + %o3],	%g7
	wrpr	%l3,	0x1A24,	%tick
	tn	%icc,	0x7
	rd	%y,	%i6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x857, 	%hsys_tick_cmpr
	orncc	%l2,	0x0FF1,	%o5
	wr	%g2,	%l5,	%set_softint
	set	0x78, %l6
	sta	%f20,	[%l7 + %l6] 0x88
	rd	%asi,	%o3
	movvc	%icc,	%g4,	%l6
	wrpr	%o0,	%o4,	%pil
	edge8l	%l4,	%o6,	%l1
	rdhpr	%hpstate,	%o1
	rdhpr	%hsys_tick_cmpr,	%i4
	wr	%g3,	0x0AC8,	%clear_softint
	rdhpr	%hintp,	%g5
	wr	%g6,	0x1114,	%y
	rdhpr	%hsys_tick_cmpr,	%i2
	srax	%g1,	%o2,	%i0
	te	%icc,	0x3
	rdpr	%tl,	%i1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	rd	%ccr,	%i5
	tvs	%xcc,	0x0
	wrpr	%g7,	%i6,	%pil
	rdpr	%tl,	%l3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xBA5, 	%hsys_tick_cmpr
	membar	0x51
	sdiv	%i3,	0x160E,	%o5
	set	0x14, %i5
	stwa	%l2,	[%l7 + %i5] 0x2a
	membar	#Sync
	sllx	%g2,	0x0F,	%l5
	fone	%f26
	wrpr	%g4,	0x19A2,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	addccc	%o0,	%o4,	%l4
	movrgz	%l6,	%o6,	%l1
	faligndata	%f4,	%f10,	%f8
	wrpr	%i4,	%g3,	%pil
	fmovscs	%icc,	%f30,	%f10
	rdhpr	%hsys_tick_cmpr,	%o1
	brnz	%g6,	loop_289
	movg	%xcc,	%i2,	%g1
	fxors	%f1,	%f2,	%f23
	subccc	%g5,	%o2,	%i0
loop_289:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x36D, 	%hsys_tick_cmpr
	fsrc2s	%f25,	%f0
	wr	%o7,	%l0,	%sys_tick
	wr	%g7,	0x0D03,	%softint
	rdpr	%cwp,	%i6
	rdpr	%pil,	%i5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x89C, 	%hsys_tick_cmpr
	lduw	[%l7 + 0x38],	%o5
	movrgz	%i7,	%l2,	%g2
	move	%icc,	%g4,	%o3
	rdhpr	%hsys_tick_cmpr,	%o0
	movrlz	%l5,	%o4,	%l6
	orcc	%l4,	0x097A,	%o6
	rdpr	%tba,	%l1
	movneg	%xcc,	%i4,	%o1
	rdpr	%cleanwin,	%g3
	ldub	[%l7 + 0x7A],	%i2
	rdhpr	%hpstate,	%g6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%o2,	%g5,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	rdpr	%cwp,	%i0
	sllx	%o7,	0x1F,	%g7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xF0F, 	%hsys_tick_cmpr
	fmuld8ulx16	%f10,	%f28,	%f16
	ld	[%l7 + 0x48],	%f2
	wrpr	%i5,	0x13DF,	%tick
	rdpr	%tba,	%l3
	wr	%i3,	%i7,	%set_softint
	tn	%xcc,	0x4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x415, 	%hsys_tick_cmpr
	rd	%asi,	%g2
	wrpr	%l2,	0x004A,	%pil
	mulscc	%o3,	0x04C7,	%g4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x3F6, 	%tick_cmpr
	srlx	%o4,	%l4,	%l6
	bgu,pt	%xcc,	loop_290
	wr 	%g0, 	0x7, 	%fprs

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xBF1, 	%sys_tick_cmpr
	orncc	%i2,	0x1E80,	%i4
loop_290:
	rdpr	%pil,	%g1
	rdpr	%cwp,	%o2
	rdhpr	%hsys_tick_cmpr,	%g6
	rdpr	%cwp,	%i1
	rdpr	%cleanwin,	%i0
	subccc	%g5,	0x18AD,	%g7
	rd	%ccr,	%o7
	fone	%f30

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xC72, 	%hsys_tick_cmpr
	wrpr	%l3,	%i5,	%cwp
	or	%i7,	%i3,	%o5
	rd	%fprs,	%g2
	rdhpr	%htba,	%l2
	rdpr	%otherwin,	%g4
	wrpr	%o0,	0x0B03,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%cwp,	%l4
	wr	%l6,	%o3,	%y
	rdhpr	%hpstate,	%l1
	movne	%xcc,	%o6,	%o1
	wr	%g3,	0x11A4,	%y
	wrpr	%i4,	%i2,	%cwp
	rd	%y,	%o2
	rdpr	%tba,	%g6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	subc	%i0,	0x0F46,	%g7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%y,	%o7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x114, 	%hsys_tick_cmpr
	fones	%f14
	rdhpr	%hintp,	%l0
	fmovdne	%xcc,	%f19,	%f13
	wr	%i7,	0x1FE5,	%y
	nop
	setx loop_291, %l0, %l1
	jmpl %l1, %i3
	wrpr	%i5,	0x0F53,	%tick
	nop
	setx loop_292, %l0, %l1
	jmpl %l1, %g2
	rdhpr	%hsys_tick_cmpr,	%o5
loop_291:
	sllx	%g4,	0x0B,	%o0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xA46, 	%hsys_tick_cmpr
loop_292:
	rdhpr	%hpstate,	%o4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%pil,	%l1
	rdpr	%tba,	%o3
	tvs	%xcc,	0x2
	rd	%pc,	%o6
	st	%f5,	[%l7 + 0x30]
	rd	%softint,	%g3
	rd	%sys_tick_cmpr,	%i4
	wrpr	%i2,	%o2,	%pil
	ld	[%l7 + 0x74],	%f15
	rdpr	%otherwin,	%o1
	bcs,a,pn	%icc,	loop_293
	xnorcc	%g6,	%i1,	%g1
	rd	%tick_cmpr,	%g7
	wrpr	%i0,	%g5,	%tick
loop_293:
	wrpr	%i6,	%l3,	%pil
	edge16ln	%l0,	%i7,	%o7
	movrne	%i5,	0x0C9,	%g2
	rdhpr	%hintp,	%o5
	set	0x18, %i0
	prefetcha	[%l7 + %i0] 0x88,	 0x0
	rd	%y,	%g4
	rd	%fprs,	%o0
	wrpr	%l2,	0x15E9,	%cwp
	rd	%ccr,	%l5
	fmovdcc	%xcc,	%f30,	%f16
	fcmpeq32	%f8,	%f18,	%o4
	wrpr	%l6,	0x0D76,	%pil
	wrpr	%l4,	0x193D,	%pil
	rdhpr	%hsys_tick_cmpr,	%o3
	wr	%l1,	0x0662,	%pic
	bgu,pn	%xcc,	loop_294
	rd	%y,	%g3
	wr	%o6,	%i4,	%set_softint
	tpos	%xcc,	0x6
loop_294:
	rdpr	%cwp,	%o2
	rd	%tick_cmpr,	%i2
	taddcc	%g6,	0x0556,	%o1
	rdpr	%tl,	%g1
	array16	%i1,	%i0,	%g5
	movrlz	%i6,	%l3,	%l0
	array8	%g7,	%o7,	%i5
	bgu	%icc,	loop_295
	rdpr	%cwp,	%i7
	add	%l7,	0x2C,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%g2,	%o5
loop_295:
	ldub	[%l7 + 0x29],	%i3
	fmovrslz	%o0,	%f4,	%f30
	wrpr	%g4,	0x1777,	%cwp
	rdpr	%gl,	%l2
	rdpr	%gl,	%l5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xFDF, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	sdivx	%o3,	0x0EBF,	%l6
	rdhpr	%hpstate,	%g3
	fands	%f23,	%f11,	%f26
	addccc	%o6,	0x18B8,	%i4
	array8	%l1,	%o2,	%i2
	fmovdcs	%icc,	%f29,	%f21
	rdpr	%gl,	%g6
	rdpr	%tba,	%o1
	rdpr	%cwp,	%g1
	rdhpr	%htba,	%i1
	flush	%l7 + 0x54
	fbue	%fcc1,	loop_296
	sir	0x0BC7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	alignaddr	%i6,	%l3,	%g5
loop_296:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	wr	%o7,	0x0B79,	%softint
	fmovsg	%icc,	%f18,	%f19
	rd	%y,	%g7
	move	%xcc,	%i5,	%i7
	rd	%tick_cmpr,	%o5
	rdhpr	%hintp,	%g2
	movpos	%icc,	%o0,	%g4
	movrgz	%l2,	%l5,	%o4
	rd	%sys_tick_cmpr,	%i3
	fmovrde	%o3,	%f12,	%f18
	rdhpr	%hsys_tick_cmpr,	%l6
	rdpr	%tl,	%l4
	subcc	%o6,	%g3,	%i4
	ldd	[%l7 + 0x70],	%o2
	andn	%l1,	0x16EE,	%g6
	wr 	%g0, 	0x5, 	%fprs
	rd	%softint,	%g1
	wrpr	%i0,	%i1,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%hsys_tick_cmpr,	%l3
	rdpr	%tba,	%l0
	rd	%sys_tick_cmpr,	%g7
	wrpr	%o7,	%i7,	%cwp
	tg	%icc,	0x6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	fexpand	%f9,	%f22
	wr	%o0,	%i5,	%clear_softint
	edge16n	%l2,	%g4,	%o4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x69A, 	%hsys_tick_cmpr
	rdhpr	%htba,	%l5
	rdhpr	%hintp,	%l4
	udiv	%o6,	0x1955,	%l6
	wrpr	%i4,	%o2,	%tick
	or	%g3,	0x1388,	%g6
	wr	%i2,	0x14FF,	%set_softint
	rdpr	%wstate,	%l1
	taddcctv	%o1,	0x1418,	%i0
	rdpr	%otherwin,	%i1
	wrpr	%i6,	0x0A91,	%tick
	rdpr	%cleanwin,	%g1
	rd	%tick_cmpr,	%l3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%cansave,	%g7
	rdpr	%cwp,	%l0
	bneg,a	loop_297
	rdhpr	%hsys_tick_cmpr,	%i7
	fxnors	%f27,	%f22,	%f23
	rdhpr	%hintp,	%o7
loop_297:
	sdiv	%g2,	0x15B1,	%o5
	fcmpgt32	%f20,	%f18,	%o0
	fbne,a	%fcc1,	loop_298
	fba,a	%fcc0,	loop_299
	rdhpr	%hsys_tick_cmpr,	%l2
	rdpr	%cansave,	%i5
loop_298:
	nop
	set	0x44, %o6
	sta	%f2,	[%l7 + %o6] 0x89
loop_299:
	rdhpr	%hintp,	%g4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x9DB, 	%hsys_tick_cmpr
	wrpr	%o3,	0x0836,	%cwp
	rdpr	%canrestore,	%l5
	rd	%asi,	%o6
	rdpr	%gl,	%l4
	wrpr	%i4,	0x1268,	%tick
	rdpr	%tl,	%l6
	rdhpr	%htba,	%o2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xD51, 	%sys_tick_cmpr
	alignaddrl	%l1,	%o1,	%i0
	rdhpr	%hpstate,	%i2
	set	0x6B, %o7
	lduba	[%l7 + %o7] 0x11,	%i1
	rd	%fprs,	%i6
	rdpr	%pil,	%g1
	tpos	%xcc,	0x7
	rdhpr	%htba,	%g5
	rd	%sys_tick_cmpr,	%l3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x22D, 	%hsys_tick_cmpr
	rdhpr	%hintp,	%i7
	rdhpr	%htba,	%o7
	std	%g2,	[%l7 + 0x48]
	rd	%ccr,	%o0
	wr 	%g0, 	0x4, 	%fprs
	rd	%asi,	%i5
	rdhpr	%hsys_tick_cmpr,	%g4
	wrpr	%o4,	%o3,	%tick
	wr 	%g0, 	0x5, 	%fprs
	wrpr	%i3,	0x09E3,	%cwp
	tcc	%icc,	0x1
	rd	%y,	%l4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	wr 	%g0, 	0x4, 	%fprs
	fxors	%f11,	%f24,	%f0
	edge32l	%o2,	%g6,	%g3
	movg	%icc,	%l1,	%o1
	rd	%y,	%i2
	udivx	%i1,	0x179F,	%i6
	nop
	set	0x6E, %g5
	ldub	[%l7 + %g5],	%g1
	std	%i0,	[%l7 + 0x70]
	rdhpr	%htba,	%g5
	wr	%g7,	0x078D,	%clear_softint
	wr	%l3,	0x1EFC,	%sys_tick
	rdpr	%cansave,	%l0
	rdpr	%tba,	%i7
	rdhpr	%hintp,	%o7
	fmovsleu	%icc,	%f20,	%f20
	mulscc	%g2,	%l2,	%o0
	ldd	[%l7 + 0x30],	%i4
	rdhpr	%htba,	%g4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	rd	%softint,	%l5
!Yo - got one - imm_asi 0x58 
!And yo - immediate is 0x80
	set	0x80, %g3
	ldxa	[%g0 + %g3] 0x58,	%o3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%hintp,	%i4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	wrpr	%i3,	%g6,	%cwp
	ta	%xcc,	0x4
	umul	%g3,	0x1ACE,	%l1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fpadd32s	%f25,	%f2,	%f9
	edge16	%i6,	%o1,	%g1
	wrpr	%g5,	%g7,	%tick
	brlz	%i0,	loop_300
	rd	%pc,	%l3
	fpmerge	%f24,	%f4,	%f26
	wr	%i7,	%l0,	%softint
loop_300:
	rdpr	%cansave,	%g2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x3AE, 	%hsys_tick_cmpr
	wr	%g0,	0x18,	%asi
	stba	%o7,	[%l7 + 0x44] %asi
	movrlz	%o0,	0x121,	%g4
	array8	%i5,	%o5,	%o4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	xnorcc	%l4,	%l5,	%o6
	sdivcc	%l6,	0x1BF8,	%i4
	rdpr	%cwp,	%i3
	rdpr	%cleanwin,	%o2
	rd	%y,	%g3
	movcc	%icc,	%g6,	%i2
	add	%l1,	%i6,	%i1
	rdhpr	%hsys_tick_cmpr,	%g1
	wrpr	%g5,	0x0786,	%tick
	tle	%xcc,	0x0
	flush	%l7 + 0x54
	nop
	setx	loop_301,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	ble	loop_302
	movrlez	%o1,	0x107,	%g7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_301:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_302:
	popc	%g2,	%l0
	movn	%xcc,	%l2,	%o0
	wr	%g0,	0x27,	%asi
	stwa	%o7,	[%l7 + 0x54] %asi
	membar	#Sync
	te	%icc,	0x2
	rdhpr	%htba,	%g4
	movle	%xcc,	%o5,	%i5
	rdpr	%gl,	%o4
	wr	%l4,	%l5,	%softint
	add	%o6,	0x0F1D,	%o3
	rdhpr	%hintp,	%i4
	movpos	%xcc,	%l6,	%o2
	rdhpr	%hsys_tick_cmpr,	%g3
	wr	%g0,	0x11,	%asi
	ldsba	[%l7 + 0x52] %asi,	%i3
	ba,a,pn	%icc,	loop_303
	xnorcc	%i2,	%g6,	%l1
	rdhpr	%htba,	%i1
	wrpr	%i6,	%g1,	%pil
loop_303:
	rdpr	%gl,	%g5
	wr	%g7,	0x1572,	%sys_tick
	rdpr	%wstate,	%o1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x89B, 	%hsys_tick_cmpr
	sdivx	%i0,	0x112A,	%l3
	fmovsa	%icc,	%f16,	%f24
	wrpr	%l0,	%g2,	%pil
	wrpr	%o0,	0x033C,	%cwp
	rdhpr	%hsys_tick_cmpr,	%l2
	rdhpr	%hpstate,	%g4
	swap	[%l7 + 0x34],	%o7
	wr	%i5,	0x1F57,	%clear_softint
	rdpr	%tl,	%o4
	rd	%y,	%l4
	umul	%o5,	%l5,	%o3
	fmovdle	%xcc,	%f20,	%f24
	nop
	set	0x44, %i7
	stw	%i4,	[%l7 + %i7]
	wrpr	%l6,	0x0205,	%cwp
	wr	%o6,	%g3,	%sys_tick
	wrpr	%i3,	%i2,	%pil
	rdpr	%cleanwin,	%o2
	rdhpr	%hpstate,	%l1
	rdpr	%tl,	%g6
	rd	%y,	%i6
	fmovdcs	%icc,	%f27,	%f19
	movleu	%icc,	%g1,	%i1
	wr 	%g0, 	0x6, 	%fprs

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	ldsh	[%l7 + 0x16],	%o1
	fnot1	%f28,	%f8
	fbue,a	%fcc0,	loop_304
	fble,a	%fcc1,	loop_305
	wrpr	%i7,	0x0D15,	%cwp
	rdhpr	%htba,	%l3
loop_304:
	movge	%xcc,	%l0,	%i0
loop_305:
	taddcc	%g2,	%o0,	%g4
	set	0x1C, %o1
	lduwa	[%l7 + %o1] 0x04,	%o7
	fmovdvs	%icc,	%f16,	%f24
	rd	%pc,	%i5
	wr	%o4,	%l2,	%ccr
	fcmple16	%f20,	%f12,	%l4
	wr	%o5,	0x0ABC,	%y

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	movgu	%icc,	%l6,	%i4
	rdpr	%tba,	%o6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x9BA, 	%hsys_tick_cmpr
	movne	%icc,	%o2,	%g6
	rd	%asi,	%l1
	wr 	%g0, 	0x4, 	%fprs
	rdhpr	%hsys_tick_cmpr,	%g1
	wr	%i1,	%g7,	%clear_softint
	rdhpr	%hintp,	%o1
	rdhpr	%hpstate,	%g5
	rdhpr	%htba,	%i7
	rd	%asi,	%l0
	rd	%asi,	%i0
	rd	%ccr,	%g2
	array8	%l3,	%o0,	%o7
	ldx	[%l7 + 0x28],	%g4
	fmovsvc	%icc,	%f18,	%f21
	wr 	%g0, 	0x4, 	%fprs
	rd	%tick_cmpr,	%l4
	smul	%o5,	%l5,	%o3
	addccc	%l2,	0x19EB,	%l6
	rd	%asi,	%o6
	ba,a,pt	%xcc,	loop_306
	wrpr	%i4,	0x07B7,	%cwp
	wr 	%g0, 	0x7, 	%fprs
	wr	%o2,	0x095C,	%pic
loop_306:
	ldx	[%l7 + 0x68],	%g6
	sub	%l1,	%i3,	%i6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%o1,	%g5,	%pil
	rdpr	%tl,	%g7
	rd	%ccr,	%i7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%cansave,	%l0
	orcc	%g2,	%l3,	%o7
	rdpr	%canrestore,	%g4
	movn	%icc,	%o0,	%o4
        wr    %g0,    0xe,    %pcr    ! changed.

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xAB1, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xF96, 	%hsys_tick_cmpr
	sethi	0x1680,	%l2
	edge16n	%l6,	%o6,	%i4
        wr    %g0,    0xe,    %pcr    ! changed.
	wr	%o2,	0x073F,	%y
	ld	[%l7 + 0x7C],	%f9
	wr 	%g0, 	0x6, 	%fprs
	rd	%sys_tick_cmpr,	%g6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x3D0, 	%hsys_tick_cmpr
	wr	%g0,	0x89,	%asi
	lda	[%l7 + 0x5C] %asi,	%f4
	wr	%g1,	%o1,	%set_softint

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%g5,	0x09BE,	%pil
	wr	%g7,	0x1FBA,	%set_softint
	rdpr	%gl,	%i0
	orcc	%l0,	%i7,	%g2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x07A, 	%hsys_tick_cmpr
	rdpr	%cansave,	%l3
	move	%icc,	%o0,	%g4
	rd	%ccr,	%o4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x368, 	%tick_cmpr
	rdpr	%pil,	%i5
	movpos	%icc,	%l5,	%o5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xBB2, 	%hsys_tick_cmpr
	fones	%f6
	rd	%y,	%l2
	wrpr	%o3,	0x1943,	%cwp
	rdhpr	%hsys_tick_cmpr,	%g3
	smulcc	%i4,	0x17C0,	%i2
	fmovscc	%xcc,	%f24,	%f11

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	umulcc	%i3,	0x0ACA,	%o2
	wrpr	%i1,	0x0003,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%cansave,	%i6
	wrpr	%o1,	0x0942,	%tick
	wrpr	%g7,	%i0,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%tba,	%g5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16n	%i7,	%o7,	%l3
	wr	%o0,	%g2,	%ccr
	wr	%o4,	0x0746,	%set_softint
	fmovrdne	%l4,	%f20,	%f20
	wr 	%g0, 	0x4, 	%fprs

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	sdivcc	%g4,	0x06BB,	%o6
	rdpr	%tba,	%o3
	fblg,a	%fcc3,	loop_307
	rdhpr	%hsys_tick_cmpr,	%l2
	wr	%i4,	0x11FD,	%ccr
	fbg	%fcc3,	loop_308
loop_307:
	tpos	%icc,	0x0
	rdpr	%cwp,	%g3
	membar	0x48
loop_308:
	movvs	%xcc,	%l1,	%g6
	rd	%fprs,	%i3
	rdhpr	%hsys_tick_cmpr,	%i2
	rd	%softint,	%o2
	rd	%asi,	%i1
	nop
	setx	loop_309,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movcs	%icc,	%g1,	%i6
	rd	%y,	%o1
	fandnot1s	%f5,	%f10,	%f29
loop_309:
	fmovdne	%xcc,	%f14,	%f16
	rd	%sys_tick_cmpr,	%g7
	movgu	%xcc,	%l0,	%g5
	wr	%i7,	%i0,	%softint
	wr	%l3,	%o0,	%clear_softint
	rdpr	%tl,	%o7
	brlz	%g2,	loop_310
	rdhpr	%htba,	%o4
	wrpr	%i5,	0x125E,	%cwp
	rdhpr	%hsys_tick_cmpr,	%l4
loop_310:
	movneg	%icc,	%o5,	%l5
	rdpr	%wstate,	%l6
	rdpr	%cleanwin,	%o6
	lduw	[%l7 + 0x68],	%o3
	rd	%fprs,	%g4
	wrpr	%i4,	0x1CB1,	%tick
	rdpr	%tba,	%l2
	movvc	%xcc,	%g3,	%g6
	rdhpr	%hsys_tick_cmpr,	%i3
	mova	%icc,	%l1,	%i2
	movrgz	%i1,	%g1,	%i6
	rdhpr	%hintp,	%o2
	fmovsleu	%icc,	%f21,	%f9
	rdhpr	%hsys_tick_cmpr,	%g7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x556, 	%sys_tick_cmpr
	wr	%i7,	0x0BD0,	%pic
	wrpr	%i0,	%l3,	%tick
	rdhpr	%hpstate,	%g5
	fnor	%f10,	%f12,	%f16
	rd	%fprs,	%o7
	stbar
	ta	%icc,	0x3
	rdpr	%tl,	%g2
	movgu	%icc,	%o0,	%i5
	fmovsa	%icc,	%f3,	%f9
	tne	%icc,	0x4
	wrpr	%o4,	0x0824,	%cwp
	rd	%pc,	%o5
	tsubcc	%l4,	%l6,	%o6
	tcc	%icc,	0x3
	fcmpgt32	%f12,	%f2,	%l5
	movleu	%icc,	%o3,	%i4
	array8	%l2,	%g3,	%g6
	ldd	[%l7 + 0x28],	%i2
	sethi	0x08D9,	%g4
	mulx	%i2,	%l1,	%i1
	move	%icc,	%g1,	%i6
	stbar
        wr    %g0,    0xe,    %pcr    ! changed.
	wrpr	%o1,	0x1C49,	%pil
	fmovdle	%xcc,	%f18,	%f20
	rd	%tick_cmpr,	%i7
	wrpr	%o2,	%i0,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%hpstate,	%g2
	rdpr	%cwp,	%o0
	wr	%l3,	%o4,	%pic
	wr	%i5,	%o5,	%set_softint
	wrpr	%l6,	0x1DBC,	%pil
	wrpr	%l4,	0x0808,	%pil
	rd	%ccr,	%o6
	tl	%icc,	0x5
	wr	%o3,	0x0B22,	%softint
	rd	%tick_cmpr,	%l5
	fmovse	%xcc,	%f26,	%f26
	wrpr	%i4,	0x0E44,	%cwp
	rd	%pc,	%g3
        wr    %g0,    0xe,    %pcr    ! changed.
	movg	%xcc,	%l2,	%g4
	bl	%xcc,	loop_311
	fmovdvs	%xcc,	%f10,	%f15
	tsubcc	%i3,	%l1,	%i1
	fbug,a	%fcc3,	loop_312
loop_311:
	rdpr	%wstate,	%g1
	edge8l	%i2,	%i6,	%l0
	movre	%g7,	0x3AB,	%o1
loop_312:
	sub	%o2,	0x1762,	%i0
	fmovsge	%icc,	%f6,	%f19
	rdpr	%cansave,	%i7
	orncc	%g5,	0x0D72,	%g2
	wrpr	%o7,	%l3,	%tick
	orncc	%o4,	0x1D75,	%o0
	rdhpr	%hsys_tick_cmpr,	%i5
	fbl,a	%fcc2,	loop_313
	rd	%tick_cmpr,	%o5
	fpadd32s	%f3,	%f27,	%f20
	tpos	%icc,	0x5
loop_313:
	movn	%icc,	%l6,	%o6
	rd	%asi,	%o3
	fbne,a	%fcc2,	loop_314
	rdpr	%tba,	%l5
	ldsw	[%l7 + 0x28],	%l4
	fblg	%fcc1,	loop_315
loop_314:
	rdhpr	%hintp,	%i4
	taddcctv	%g6,	%l2,	%g4
	rdhpr	%hintp,	%g3
loop_315:
	tsubcctv	%l1,	%i1,	%g1
	srlx	%i2,	%i6,	%l0
	fmovsleu	%icc,	%f31,	%f1
	rdhpr	%hintp,	%g7
	umulcc	%i3,	0x08DE,	%o2
	brlz	%i0,	loop_316
	tle	%xcc,	0x2
	rd	%y,	%o1
	sdiv	%i7,	0x035A,	%g5
loop_316:
	addccc	%g2,	%o7,	%o4
	edge16l	%l3,	%i5,	%o0
	wrpr	%l6,	0x0227,	%tick
	wrpr	%o6,	%o3,	%pil
	bvc,a,pn	%xcc,	loop_317
	rd	%asi,	%o5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xAD9, 	%hsys_tick_cmpr
	rdhpr	%htba,	%i4
loop_317:
	wr	%g6,	%l5,	%ccr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x943, 	%tick_cmpr
	srlx	%l2,	0x1F,	%g3
	fnands	%f12,	%f25,	%f9
	fnand	%f14,	%f0,	%f30

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xB03, 	%hsys_tick_cmpr
	rdpr	%wstate,	%i1
	movrlz	%i6,	0x0F6,	%i2
	ble	%xcc,	loop_318
	fbue	%fcc2,	loop_319
	wrpr	%l0,	0x17A3,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xC5D, 	%hsys_tick_cmpr
loop_318:
	movgu	%icc,	%i3,	%o1
loop_319:
	ldd	[%l7 + 0x18],	%i0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x883, 	%hsys_tick_cmpr
	sethi	0x115E,	%i7
	tsubcctv	%o7,	%g2,	%l3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	tcs	%icc,	0x7
	fpadd32	%f2,	%f10,	%f22
	rdhpr	%hsys_tick_cmpr,	%o0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xDCC, 	%hsys_tick_cmpr
	wr	%o6,	0x0EC3,	%ccr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fmovdvc	%xcc,	%f19,	%f4
	fmovrdne	%i4,	%f12,	%f30
	tvc	%xcc,	0x7
	xnor	%g6,	0x1ACC,	%l5
	rdhpr	%hsys_tick_cmpr,	%l4
	rdpr	%canrestore,	%g4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xCDC, 	%hsys_tick_cmpr
	wr	%l2,	0x0489,	%softint
	rdpr	%wstate,	%l1
	sir	0x0390
	movvs	%icc,	%g1,	%i6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	brlez	%g7,	loop_320
	umul	%i1,	0x0F5B,	%o2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x5B6, 	%hsys_tick_cmpr
	rdpr	%tl,	%i0
loop_320:
	edge16n	%g5,	%i7,	%o7
	rdpr	%gl,	%l3
	udivx	%o4,	0x1A68,	%g2
	rd	%ccr,	%i5
	rd	%y,	%o0
	sll	%o3,	0x18,	%l6
	add	%o5,	%o6,	%i4
	fmovdleu	%icc,	%f4,	%f10
	rdpr	%wstate,	%l5
	edge8l	%g6,	%g4,	%l4
	tvs	%xcc,	0x1
	xorcc	%g3,	%l1,	%l2
	fmovse	%icc,	%f28,	%f24
	rdhpr	%htba,	%i6
	rd	%asi,	%g1
	wrpr	%l0,	%i2,	%cwp
	movgu	%xcc,	%g7,	%o2
	wr	%i1,	0x124D,	%softint
	edge32n	%o1,	%i3,	%i0
	rd	%tick_cmpr,	%i7
	movrgez	%g5,	%l3,	%o7
	rd	%fprs,	%g2
	rd	%asi,	%i5
	wr	%o4,	%o0,	%set_softint
	rdpr	%cwp,	%o3
	tge	%icc,	0x6
	ble,a	loop_321
	rdpr	%wstate,	%o5
	rd	%fprs,	%l6
	siam	0x1
loop_321:
	bcc,pn	%xcc,	loop_322
	movrne	%o6,	0x371,	%i4
	rd	%asi,	%l5
	wr	%g0,	0x19,	%asi
	lduha	[%l7 + 0x6C] %asi,	%g4
loop_322:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%g3,	%l1,	%pil
	taddcc	%l2,	%l4,	%g1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movle	%xcc,	%l0,	%i2
	rd	%y,	%g7
	bne,pt	%icc,	loop_323
	wr 	%g0, 	0x5, 	%fprs

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	wrpr	%o1,	0x1F48,	%tick
loop_323:
	tsubcctv	%i0,	0x04E4,	%i7
	or	%g5,	0x0B51,	%i3
	addcc	%o7,	0x0BFA,	%g2
	wr	%i5,	0x01DA,	%y

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	membar	0x18
	sir	0x05A0
	rd	%pc,	%o3
	rdhpr	%htba,	%o0
	tcc	%icc,	0x3
        wr    %g0,    0xe,    %pcr    ! changed.

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%l5,	%i4,	%pil
	wr	%g4,	%g6,	%pic
	rdhpr	%hsys_tick_cmpr,	%g3
	rdhpr	%hintp,	%l1
	rdpr	%cansave,	%l2
	movn	%icc,	%g1,	%l4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tgu	%xcc,	0x7
	edge16l	%i2,	%l0,	%o2
	sth	%g7,	[%l7 + 0x3A]
	wrpr	%i1,	%o1,	%cwp
	tleu	%icc,	0x1
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

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%i0,	%o7,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	edge8ln	%l3,	%i3,	%o3
	subccc	%o4,	0x147B,	%o0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%fprs,	%l6
	rdpr	%cwp,	%i4
	array32	%g4,	%g6,	%l5
	rdhpr	%hpstate,	%l1
	wr	%g3,	%l2,	%pic
	sir	0x1756
	rd	%ccr,	%g1
	rd	%y,	%l4
	tne	%icc,	0x7
	wrpr	%i2,	0x0DC6,	%pil
	movre	%l0,	%g7,	%i1
	wr	%o1,	%i6,	%ccr
	rd	%ccr,	%i7
	ble	loop_324
	fmovrsne	%g5,	%f1,	%f25
	wr	%o2,	0x1BEF,	%softint
	array32	%i0,	%g2,	%o7
loop_324:
	rdhpr	%hpstate,	%l3
	edge32l	%i5,	%i3,	%o3
	fones	%f21
	set	0x08, %o2
	ldswa	[%l7 + %o2] 0x19,	%o0
	mova	%icc,	%o5,	%o4
	add	%l7,	0x60,	%l6
	wr	%g0,	0x04,	%asi
	casxa	[%l6] %asi,	%o6,	%i4
	ldd	[%l7 + 0x78],	%g4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	rdhpr	%hintp,	%g6
	rdpr	%otherwin,	%l5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%g3,	0x1932,	%pil
	rdhpr	%hsys_tick_cmpr,	%l2
	tleu	%xcc,	0x2
	rdhpr	%hsys_tick_cmpr,	%l6
	rd	%asi,	%l4
	tsubcc	%g1,	%l0,	%g7
	wr	%i2,	0x09D3,	%ccr
	movg	%icc,	%i1,	%o1
	srlx	%i7,	0x0B,	%i6
	movrgz	%g5,	0x35C,	%i0
	fsrc1s	%f17,	%f9
	fmovd	%f26,	%f30
	rdpr	%otherwin,	%g2
	xnorcc	%o7,	0x1EA3,	%l3
	rdpr	%canrestore,	%i5
	wr	%i3,	0x0269,	%set_softint
	wrpr	%o2,	0x1C0B,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xD29, 	%hsys_tick_cmpr
	udivcc	%o3,	0x1BB7,	%o5
	srl	%o6,	%i4,	%g4
	sll	%o4,	0x0D,	%g6
	rdpr	%canrestore,	%l5
	ldsb	[%l7 + 0x73],	%l1
	rdpr	%otherwin,	%g3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x246, 	%hsys_tick_cmpr
	stx	%l4,	[%l7 + 0x10]
	fones	%f2
	popc	%g1,	%l6
	subcc	%g7,	%i2,	%i1
	edge32	%o1,	%i7,	%i6
	fmovdle	%xcc,	%f14,	%f31
	fmovdl	%icc,	%f5,	%f15
	tge	%icc,	0x3
	wr	%g0,	0xeb,	%asi
	ldda	[%l7 + 0x50] %asi,	%l0
	edge16n	%g5,	%i0,	%g2
	add	%l3,	0x1D64,	%i5
	rdpr	%tl,	%i3
	movcs	%icc,	%o7,	%o2
	tge	%xcc,	0x4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%o0,	%o3,	%clear_softint
	movneg	%xcc,	%o5,	%o6
	rdpr	%tl,	%g4
	wrpr	%o4,	0x0DBA,	%tick
	edge16n	%i4,	%g6,	%l5
	bvs	%icc,	loop_325
	wr	%g3,	%l1,	%y

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xAD3, 	%hsys_tick_cmpr
	wrpr	%l2,	0x1923,	%pil
loop_325:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x471, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x772, 	%hsys_tick_cmpr
	edge16ln	%i1,	%i2,	%o1
	bn,a	%icc,	loop_326
	rdpr	%gl,	%i6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x608, 	%hsys_tick_cmpr
	rd	%sys_tick_cmpr,	%g5
loop_326:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x87F, 	%hsys_tick_cmpr
	wrpr	%g2,	%i3,	%cwp
	rdpr	%cwp,	%o7
	bgu,a	loop_327
	wr	%o2,	%i5,	%ccr
	ba,pn	%icc,	loop_328
	edge32n	%o0,	%o3,	%o5
loop_327:
	umulcc	%g4,	%o4,	%o6
	fpsub16	%f20,	%f24,	%f22
loop_328:
	rd	%fprs,	%g6
	edge32ln	%i4,	%l5,	%g3
	rdhpr	%htba,	%l4
	edge32	%l1,	%l2,	%g7
	wrpr	%l6,	0x1C4C,	%cwp
	rdpr	%otherwin,	%g1
	orn	%i1,	%o1,	%i2
	rdhpr	%htba,	%i6
	rdhpr	%hsys_tick_cmpr,	%g5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x8F2, 	%hsys_tick_cmpr
	rd	%fprs,	%i0
	bl,a	%xcc,	loop_329
	wrpr	%i7,	%l3,	%tick
	wr	%i3,	0x1C12,	%pic

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xDDE, 	%hsys_tick_cmpr
loop_329:
	rdpr	%gl,	%o2
	rdhpr	%hpstate,	%o7
	mova	%xcc,	%i5,	%o0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x329, 	%hsys_tick_cmpr
	orncc	%g4,	%o5,	%o4
	xor	%o6,	0x089B,	%i4
	membar	0x3E
	wrpr	%l5,	0x00B1,	%tick
	rdpr	%tl,	%g6
	rdhpr	%hpstate,	%g3
	rdhpr	%hsys_tick_cmpr,	%l1
	movvc	%xcc,	%l2,	%l4
	lduh	[%l7 + 0x18],	%g7
	ble,a	loop_330
	wr	%g1,	%l6,	%ccr
	smulcc	%o1,	0x1E6E,	%i1
	rdhpr	%hintp,	%i6
loop_330:
	rd	%softint,	%g5
	wrpr	%l0,	%i2,	%tick
	pdist	%f20,	%f8,	%f10
	ldd	[%l7 + 0x48],	%f16
	smulcc	%i0,	0x173D,	%l3
	rdpr	%tba,	%i7
	wr 	%g0, 	0x6, 	%fprs
	edge8ln	%o2,	%o7,	%i5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x89F, 	%hsys_tick_cmpr
	bne	loop_331
	rd	%softint,	%o3
	rd	%softint,	%g4
	wrpr	%o0,	%o5,	%pil
loop_331:
	rdhpr	%hpstate,	%o6
	movl	%icc,	%o4,	%i4
	rdhpr	%htba,	%g6
	rdpr	%wstate,	%l5
	tneg	%xcc,	0x6
	or	%l1,	0x1005,	%g3
	fmovrdlez	%l4,	%f20,	%f22
	ldub	[%l7 + 0x47],	%l2
	rd	%y,	%g7
	fmovdl	%icc,	%f22,	%f21
	movpos	%xcc,	%g1,	%l6
	movgu	%icc,	%i1,	%o1
	rd	%fprs,	%i6
	fmovrslez	%l0,	%f13,	%f26
	wrpr	%i2,	0x131B,	%pil
	orncc	%g5,	%i0,	%l3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wrpr	%i3,	0x130D,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%o7,	%i7,	%pil
	array8	%g2,	%o3,	%i5
	edge32	%o0,	%o5,	%g4
	rdhpr	%hsys_tick_cmpr,	%o6
	rd	%pc,	%o4
	nop
	setx	loop_332,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fone	%f4
	wr 	%g0, 	0x5, 	%fprs
	wr	%l1,	%g3,	%sys_tick
loop_332:
	fand	%f14,	%f24,	%f2
	fmuld8ulx16	%f0,	%f20,	%f24

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fexpand	%f1,	%f30

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x35C, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xD30, 	%hsys_tick_cmpr
	taddcc	%o1,	%l0,	%g5
	rdhpr	%hsys_tick_cmpr,	%i0
	sra	%i2,	0x10,	%l3
	alignaddrl	%i3,	%o2,	%o7
	wr	%i7,	0x1B90,	%y
	tneg	%icc,	0x5
	rdpr	%cwp,	%g2
	wrpr	%i5,	0x1EFF,	%tick
	taddcctv	%o3,	%o5,	%o0
	fcmpeq32	%f22,	%f16,	%o6
	rdpr	%canrestore,	%o4
	fpadd16s	%f24,	%f0,	%f31
	fbuge,a	%fcc2,	loop_333
	movvc	%icc,	%g4,	%i4
	bne,a,pt	%icc,	loop_334
	rdpr	%gl,	%l5
loop_333:
	sethi	0x08D6,	%l1
	wr	%g3,	0x1CEE,	%clear_softint
loop_334:
	fmovdg	%xcc,	%f7,	%f19
	fbe,a	%fcc2,	loop_335
	rdhpr	%htba,	%l4
	array32	%g6,	%g1,	%l6
	edge16n	%i1,	%l2,	%g7
loop_335:
	rdpr	%cleanwin,	%o1
	umulcc	%i6,	0x0A66,	%l0
	wrpr	%g5,	%i0,	%tick
	rdhpr	%hsys_tick_cmpr,	%i2
	tgu	%xcc,	0x6
	rdhpr	%hpstate,	%i3
	fmovrsne	%o2,	%f23,	%f21
	bvs,a	%xcc,	loop_336
	rd	%softint,	%l3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	set	0x68, %g7
	stda	%o6,	[%l7 + %g7] 0x88
loop_336:
	brlez,a	%o3,	loop_337
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
	rd	%softint,	%o5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_337:
	rdhpr	%hintp,	%i5
loop_338:
	rdhpr	%htba,	%g4
	stw	%o4,	[%l7 + 0x28]
	fand	%f0,	%f28,	%f28
	lduh	[%l7 + 0x3E],	%l5
	edge8n	%i4,	%g3,	%l1
	rdhpr	%htba,	%g6
	wrpr	%g1,	%l4,	%tick
	fxnors	%f26,	%f25,	%f18

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x3D4, 	%tick_cmpr
	rd	%softint,	%g7
	movleu	%xcc,	%l2,	%i6
	wr	%o1,	0x0713,	%set_softint
	fbule	%fcc1,	loop_339
	edge8ln	%l0,	%i0,	%g5
	sethi	0x1E8D,	%i3
	wrpr	%o2,	%l3,	%pil
loop_339:
	tcc	%icc,	0x0
	rd	%ccr,	%i2
	fbule,a	%fcc1,	loop_340
	fmul8x16al	%f12,	%f30,	%f12
	fbule	%fcc0,	loop_341
	fmovsl	%xcc,	%f15,	%f5
loop_340:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	udiv	%g2,	0x0715,	%o7
loop_341:
	wrpr	%o3,	0x0A4F,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	wr	%o0,	0x1E44,	%pic
	wrpr	%g4,	%i5,	%cwp
	fmul8x16	%f4,	%f24,	%f12
	movrgez	%o4,	%i4,	%l5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	rd	%softint,	%g3
	rd	%tick_cmpr,	%g1
	mulscc	%g6,	%i1,	%l6
	rdhpr	%htba,	%g7
	wr	%g0,	0x89,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	fmovdvs	%xcc,	%f5,	%f24
	fpsub32	%f4,	%f26,	%f28
	fpsub16s	%f12,	%f20,	%f10

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%pil,	%i6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	sdiv	%l0,	0x03D6,	%i0
	rd	%y,	%g5
	rdhpr	%htba,	%i3
	wrpr	%o2,	0x1B1B,	%cwp
        wr    %g0,    0xe,    %pcr    ! changed.

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xA92, 	%hsys_tick_cmpr
	addccc	%o5,	%o3,	%o6
	tsubcc	%g4,	0x12B3,	%o0
	movvs	%xcc,	%i5,	%i4
	rd	%sys_tick_cmpr,	%l5
	wrpr	%o4,	%l1,	%tick
	wrpr	%g1,	0x1213,	%tick
	fpsub32s	%f13,	%f29,	%f4
	wrpr	%g6,	0x1418,	%tick
	st	%f13,	[%l7 + 0x28]
	wr	%g3,	0x0AF9,	%y
	set	0x49, %l0
	ldstuba	[%l7 + %l0] 0x89,	%l6
	sll	%i1,	0x17,	%g7
	movcc	%xcc,	%i6,	%o1
	rd	%softint,	%l4
	array8	%l0,	%i0,	%g5
	rdpr	%canrestore,	%l2
	rd	%asi,	%o2
	movcc	%icc,	%i2,	%i7
	fbg,a	%fcc2,	loop_342
	wrpr	%i3,	%g2,	%tick
	sub	%l3,	0x074E,	%o7
	rd	%pc,	%o5
loop_342:
	rdhpr	%hintp,	%o3
	add	%g4,	0x170C,	%o6
	fpack32	%f26,	%f20,	%f0
	rd	%pc,	%i5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xE5C, 	%hsys_tick_cmpr
	movre	%l5,	0x227,	%o4
	fnors	%f11,	%f3,	%f0
	rdhpr	%hpstate,	%o0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xC62, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x780, 	%hsys_tick_cmpr
	rdpr	%canrestore,	%i1
	tne	%xcc,	0x5
	sdiv	%g3,	0x1C73,	%g7
	bcs,pt	%xcc,	loop_343
	rd	%sys_tick_cmpr,	%i6
	alignaddr	%l4,	%o1,	%i0
	movrlez	%g5,	%l2,	%l0
loop_343:
	rdpr	%tba,	%i2
	wr	%g0,	0x19,	%asi
	ldswa	[%l7 + 0x58] %asi,	%o2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%asi,	%i3
	mulx	%l3,	%o7,	%o5
	rd	%ccr,	%o3
	wr	%g0,	0x10,	%asi
	lduha	[%l7 + 0x52] %asi,	%g2
	rd	%asi,	%o6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xB34, 	%hsys_tick_cmpr
	wrpr	%i5,	0x12A9,	%cwp
	rdhpr	%hpstate,	%o4
	wrpr	%l5,	%o0,	%tick
	movrlez	%l1,	0x067,	%g6
	rdhpr	%hpstate,	%l6
	rdpr	%cleanwin,	%i1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xB72, 	%hsys_tick_cmpr
	fmovdleu	%icc,	%f8,	%f16

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	rd	%ccr,	%i6
	tleu	%icc,	0x3
	rdhpr	%hsys_tick_cmpr,	%i0
	wrpr	%g5,	%l2,	%pil
	wrpr	%o1,	0x1FAE,	%cwp
	rdhpr	%hpstate,	%i2
	ldsw	[%l7 + 0x10],	%l0
	rdpr	%cansave,	%o2
	sethi	0x016D,	%i3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%o7,	%o5,	%softint
	wr	%l3,	0x0A20,	%clear_softint
	rd	%pc,	%g2
	wrpr	%o3,	%g4,	%pil
	sethi	0x1E69,	%o6
	wr	%i4,	0x0567,	%ccr
	array16	%i5,	%l5,	%o0
	rdhpr	%hsys_tick_cmpr,	%l1
	rd	%pc,	%o4
	movrgez	%l6,	%i1,	%g1
	array16	%g6,	%g3,	%l4
	rdhpr	%hintp,	%i6
	std	%f12,	[%l7 + 0x58]
	fmovsge	%icc,	%f0,	%f30

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x4E6, 	%sys_tick_cmpr
	rdhpr	%hpstate,	%g5
	xor	%l2,	%g7,	%o1
	sethi	0x1A0C,	%l0
	movrlez	%i2,	0x2B6,	%i3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	rd	%pc,	%o7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x87A, 	%hsys_tick_cmpr
	srax	%o3,	0x11,	%g2
	andcc	%g4,	%o6,	%i4
	wrpr	%i5,	%l5,	%pil
	fmovdpos	%icc,	%f12,	%f1
	rd	%pc,	%o0
	taddcctv	%l1,	%l6,	%o4
	wr	%g1,	0x0D74,	%sys_tick
	stx	%i1,	[%l7 + 0x18]
	movneg	%xcc,	%g3,	%l4
	sir	0x1478
	rdhpr	%hpstate,	%g6
	rdhpr	%hsys_tick_cmpr,	%i6
	movneg	%xcc,	%g5,	%i0
	movvc	%xcc,	%g7,	%o1
	wr	%l0,	%i2,	%y

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x0A3, 	%hsys_tick_cmpr
	sdiv	%i7,	0x06D8,	%o7
	movrne	%o2,	%l3,	%o3
	edge8ln	%o5,	%g4,	%o6
	rdpr	%cwp,	%i4
	rdpr	%wstate,	%i5
	rdhpr	%hpstate,	%g2
	addccc	%o0,	0x11EE,	%l1
	taddcctv	%l5,	%o4,	%g1
	umulcc	%i1,	%g3,	%l6
	rdpr	%canrestore,	%l4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x66E, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xB9D, 	%hsys_tick_cmpr
	rdhpr	%hsys_tick_cmpr,	%g7
	srl	%i0,	%o1,	%i2
	rdhpr	%hpstate,	%l0
	set	0x28, %i6
	stha	%i3,	[%l7 + %i6] 0x14
	movl	%icc,	%l2,	%o7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x597, 	%hsys_tick_cmpr
	fcmped	%fcc1,	%f18,	%f20
	tge	%icc,	0x5
	subcc	%o2,	0x16B1,	%l3
	sdiv	%o5,	0x1A8A,	%o3
	wr	%g4,	%o6,	%set_softint
	mova	%xcc,	%i4,	%i5
	fbug,a	%fcc2,	loop_344
	rd	%sys_tick_cmpr,	%o0
	rd	%y,	%g2
	call	loop_345
loop_344:
	wrpr	%l5,	0x01E6,	%cwp
	rd	%fprs,	%o4
	wrpr	%g1,	%l1,	%cwp
loop_345:
	rdhpr	%htba,	%g3
	tvs	%icc,	0x2
	wrpr	%i1,	0x180F,	%cwp
	stbar
	set	0x6D, %o4
	lduba	[%l7 + %o4] 0x10,	%l4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	rdpr	%cwp,	%i6
	tgu	%icc,	0x5
	rdhpr	%hintp,	%g7
	wr	%g5,	%o1,	%ccr
	xnor	%i0,	%i2,	%l0
	rd	%tick_cmpr,	%l2
	alignaddr	%o7,	%i7,	%i3
	rd	%y,	%l3
	wrpr	%o5,	0x0213,	%pil
	rdpr	%cwp,	%o2
	wrpr	%o3,	0x00AC,	%tick
	orcc	%g4,	%o6,	%i4
	rdhpr	%hsys_tick_cmpr,	%i5
	rdpr	%pil,	%g2
	wrpr	%l5,	%o0,	%pil
	set	0x4F, %o0
	ldstuba	[%l7 + %o0] 0x18,	%g1
	wrpr	%l1,	%o4,	%pil
	fmovrdgz	%i1,	%f18,	%f16
	wrpr	%g3,	0x0153,	%tick
	rdhpr	%hsys_tick_cmpr,	%g6
	wrpr	%l4,	0x0507,	%pil
	fmovsl	%icc,	%f28,	%f24
	edge32	%l6,	%g7,	%g5
	wr	%g0,	0xea,	%asi
	stba	%i6,	[%l7 + 0x34] %asi
	membar	#Sync
        wr    %g0,    0xe,    %pcr    ! changed.
	wrpr	%i0,	%l0,	%tick
	wr	%o7,	%i7,	%ccr
	alignaddrl	%l2,	%i3,	%l3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x35E, 	%hsys_tick_cmpr
	bcs,a	%xcc,	loop_346
	rdpr	%cansave,	%o3
	fmovrsgez	%o5,	%f1,	%f17
	rdpr	%cwp,	%g4
loop_346:
	rdhpr	%htba,	%o6
	rdhpr	%hintp,	%i4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x8FD, 	%hsys_tick_cmpr
	rdhpr	%hsys_tick_cmpr,	%i5
	rd	%tick_cmpr,	%o0
	smulcc	%g1,	%l1,	%i1
	std	%g2,	[%l7 + 0x38]

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x4FA, 	%hsys_tick_cmpr
	rdpr	%cansave,	%l6
	wrpr	%g6,	0x1166,	%pil
	rd	%asi,	%g7
	tge	%xcc,	0x5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xED7, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	set	0x40, %g1
	ldda	[%l7 + %g1] 0xd1,	%f0
	rdhpr	%htba,	%o1
	wr	%i2,	0x0D78,	%set_softint
	sdivcc	%i0,	0x115D,	%l0
	movre	%o7,	0x171,	%l2
	rd	%tick_cmpr,	%i3
	movrne	%i7,	0x134,	%o2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%y,	%g4
	wrpr	%o5,	0x03F3,	%cwp
	rdpr	%cwp,	%o6
	bvs,a,pn	%icc,	loop_347
	rdhpr	%hsys_tick_cmpr,	%i4
	movleu	%xcc,	%l5,	%g2
	rd	%fprs,	%i5
loop_347:
	umul	%o0,	0x18B0,	%g1
	rdpr	%canrestore,	%i1
	wrpr	%g3,	0x0B58,	%tick
	tcs	%xcc,	0x0
	wr	%g0,	0x0c,	%asi
	ldstuba	[%l7 + 0x30] %asi,	%o4
	wrpr	%l1,	0x0E98,	%tick
	bgu,a,pt	%xcc,	loop_348
	wr	%l6,	%l4,	%softint
	fmovsle	%icc,	%f24,	%f20
	andn	%g6,	0x0CB0,	%i6
loop_348:
	rd	%ccr,	%g7
	wrpr	%o1,	0x1207,	%pil
	rdhpr	%htba,	%i2
	wr	%g0,	0x89,	%asi
	ldsba	[%l7 + 0x4C] %asi,	%i0
	fbn,a	%fcc2,	loop_349
	rdhpr	%hsys_tick_cmpr,	%g5
	rd	%y,	%l0
	rdhpr	%hsys_tick_cmpr,	%l2
loop_349:
	rd	%asi,	%o7
	fmovdvc	%icc,	%f30,	%f22
	rdhpr	%htba,	%i3
	edge8l	%o2,	%l3,	%i7
	fmovsa	%xcc,	%f20,	%f4
	rdhpr	%htba,	%o3
	fcmpes	%fcc2,	%f24,	%f19
	wrpr	%g4,	%o6,	%cwp
	srlx	%i4,	%l5,	%g2
	rd	%asi,	%i5
	wr	%o0,	%o5,	%y
	wr	%i1,	%g3,	%ccr
	wr	%g1,	0x08D9,	%clear_softint
	wr 	%g0, 	0x4, 	%fprs
	rd	%asi,	%o4
	rd	%asi,	%l6
	fmovda	%xcc,	%f4,	%f2
	move	%xcc,	%g6,	%i6
	rdpr	%wstate,	%l4
	wrpr	%o1,	%i2,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
        wr    %g0,    0xe,    %pcr    ! changed.
	alignaddr	%l0,	%i3,	%o7
	wr	%l3,	0x13D5,	%ccr
	movle	%icc,	%i7,	%o2
	tne	%xcc,	0x0
	wrpr	%g4,	0x0519,	%pil
	rdpr	%otherwin,	%o3
	fands	%f31,	%f31,	%f22
	andcc	%i4,	0x06C7,	%l5
	fabsd	%f26,	%f0
	srlx	%o6,	0x07,	%g2
	or	%o0,	%i5,	%i1
	rdhpr	%hsys_tick_cmpr,	%o5
	fnegs	%f24,	%f2
	rdhpr	%hsys_tick_cmpr,	%g3
	xorcc	%g1,	0x1470,	%l1
	rdhpr	%hpstate,	%o4
	wr	%g6,	%l6,	%y
	edge8ln	%l4,	%i6,	%i2
	rdpr	%pil,	%o1
	movpos	%xcc,	%i0,	%g7
	wr	%g5,	%l0,	%y
	sll	%l2,	0x1F,	%o7
	rd	%sys_tick_cmpr,	%i3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%softint,	%l3
	fmovde	%xcc,	%f30,	%f29
	movpos	%xcc,	%o3,	%i4
	wr	%g4,	0x14A5,	%set_softint
	movne	%icc,	%o6,	%g2
	fornot1	%f10,	%f8,	%f28
	rd	%fprs,	%l5
	wrpr	%o0,	%i1,	%pil
        wr    %g0,    0xe,    %pcr    ! changed.
	srlx	%g3,	%o5,	%l1
	membar	0x5F
	umulcc	%g1,	0x1CD7,	%g6
	movg	%xcc,	%o4,	%l4
	andncc	%i6,	%i2,	%l6
	bcs,a	%xcc,	loop_350
	nop
	setx loop_351, %l0, %l1
	jmpl %l1, %i0
	orncc	%g7,	0x19C6,	%o1
	movgu	%icc,	%l0,	%l2
loop_350:
	nop
	set	0x58, %i3
	ldxa	[%l7 + %i3] 0x89,	%o7
loop_351:
	andcc	%g5,	%i7,	%i3
	rd	%pc,	%l3
	fxnor	%f8,	%f20,	%f16
	wrpr	%o3,	%o2,	%cwp
	subccc	%g4,	0x19C8,	%o6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%fprs,	%l5
	fmovsl	%icc,	%f31,	%f30
	orcc	%o0,	%i1,	%i5
	sra	%i4,	%o5,	%l1
	fmul8ulx16	%f30,	%f24,	%f16
        wr    %g0,    0xe,    %pcr    ! changed.

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%hsys_tick_cmpr,	%o4
	rdhpr	%hsys_tick_cmpr,	%l4
	rdhpr	%hintp,	%i6
	wr	%g6,	0x1BD6,	%pic
	srl	%l6,	%i2,	%i0
	be,pt	%icc,	loop_352
	rdhpr	%hpstate,	%o1
	fbug,a	%fcc3,	loop_353
	movle	%icc,	%g7,	%l2
loop_352:
	bneg	%icc,	loop_354
	movneg	%xcc,	%o7,	%l0
loop_353:
	wrpr	%i7,	0x049E,	%pil
	wrpr	%g5,	%i3,	%tick
loop_354:
	rdhpr	%hsys_tick_cmpr,	%o3
	rd	%pc,	%o2
	rdhpr	%htba,	%l3
	wr	%g4,	%g2,	%y
	xorcc	%l5,	%o0,	%o6
	bleu,a	loop_355
	wrpr	%i5,	%i1,	%pil
	rdpr	%cansave,	%i4
	fba,a	%fcc1,	loop_356
loop_355:
	array8	%l1,	%o5,	%g3
	rdhpr	%hsys_tick_cmpr,	%o4
	fmovdneg	%icc,	%f17,	%f18
loop_356:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xDE0, 	%hsys_tick_cmpr
	rdhpr	%hintp,	%g1
	be,a,pn	%xcc,	loop_357
	rd	%tick_cmpr,	%l6
	wrpr	%g6,	0x0C30,	%pil
	wr	%g0,	0x19,	%asi
	lduwa	[%l7 + 0x18] %asi,	%i2
loop_357:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	edge32l	%i0,	%l2,	%o7
	smul	%l0,	%i7,	%g5
	rdhpr	%hintp,	%i3
	rd	%y,	%o3
	fmovdleu	%icc,	%f16,	%f28
	wr 	%g0, 	0x7, 	%fprs
	rd	%y,	%l3
	rdhpr	%hpstate,	%g4
	rd	%sys_tick_cmpr,	%g2
	fbuge,a	%fcc0,	loop_358
	rdpr	%cwp,	%l5
	rdpr	%cansave,	%o0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_358:
	rdhpr	%hpstate,	%i5
	rd	%softint,	%i1
	wrpr	%o6,	0x18DA,	%cwp
	wr 	%g0, 	0x5, 	%fprs
	tleu	%xcc,	0x6
	wrpr	%o5,	%l1,	%cwp
	rd	%asi,	%o4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x88B, 	%tick_cmpr
	edge32l	%i6,	%l6,	%g6
	fcmpgt32	%f18,	%f14,	%i2
	rd	%pc,	%o1
	rdhpr	%hpstate,	%g1
	fxnors	%f7,	%f27,	%f7
	rd	%y,	%i0
	rdpr	%cleanwin,	%l2
	rdhpr	%htba,	%o7
	wrpr	%l0,	0x01E7,	%pil
	wr	%g5,	0x1F8D,	%ccr
	wr	%i3,	0x0A17,	%sys_tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xD81, 	%sys_tick_cmpr
	ldstub	[%l7 + 0x73],	%o2
	fba,a	%fcc3,	loop_359
	edge8	%l3,	%g4,	%i7
	tgu	%icc,	0x6
	udivx	%l5,	0x17F2,	%g2
loop_359:
	fcmpeq32	%f16,	%f0,	%g7
        wr    %g0,    0xe,    %pcr    ! changed.

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x160, 	%hsys_tick_cmpr
	rd	%fprs,	%i4
	rd	%ccr,	%o5
	subc	%o6,	%l1,	%l4
	wr	%o4,	%g3,	%sys_tick
	movgu	%icc,	%i6,	%g6
	edge8n	%l6,	%o1,	%g1
	rdpr	%canrestore,	%i0
	wrpr	%l2,	%i2,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%i3,	0x0532,	%tick
	rdhpr	%hpstate,	%o3
	membar	0x42
	rdhpr	%hsys_tick_cmpr,	%g5
	edge16n	%o2,	%l3,	%i7
	and	%g4,	0x056B,	%g2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%fprs,	%i5
	rd	%ccr,	%l5
	rdpr	%cwp,	%o0
	rdhpr	%hpstate,	%i1
	rd	%asi,	%o5
	addccc	%o6,	0x1205,	%l1
	rdhpr	%hpstate,	%i4
	edge32l	%l4,	%g3,	%i6
	sra	%g6,	0x0E,	%l6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fpadd16	%f18,	%f4,	%f4
	tgu	%icc,	0x5
	and	%i0,	%g1,	%i2
	wrpr	%l2,	0x091C,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x844, 	%hsys_tick_cmpr
	movrlz	%o3,	0x194,	%i3
	wr 	%g0, 	0x5, 	%fprs
	rdhpr	%htba,	%l3
        wr    %g0,    0xe,    %pcr    ! changed.
	xor	%g7,	0x1BC7,	%i7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xDAF, 	%tick_cmpr
	wr	%g0,	0xeb,	%asi
	stha	%o0,	[%l7 + 0x3E] %asi
	membar	#Sync
	fors	%f20,	%f3,	%f7
	rd	%tick_cmpr,	%i5
	addc	%i1,	0x017D,	%o5
	wr	%o6,	0x053E,	%clear_softint
	movcc	%xcc,	%l1,	%l4
	wrpr	%i4,	%i6,	%tick
	xor	%g6,	%g3,	%l6
	rd	%tick_cmpr,	%o1
	array32	%i0,	%o4,	%g1
	rdpr	%gl,	%l2
	fmovdvc	%icc,	%f21,	%f24
	rdhpr	%htba,	%l0
	rdhpr	%htba,	%i2
	wr	%o7,	0x1114,	%sys_tick
	wr 	%g0, 	0x7, 	%fprs
	movrne	%i3,	%o2,	%l3
	wr	%g4,	0x0835,	%ccr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%tick_cmpr,	%g7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xEE9, 	%hsys_tick_cmpr
	wr	%g2,	%l5,	%y
	wr	%o0,	%i5,	%set_softint
	fpack32	%f28,	%f10,	%f24
	wrpr	%o5,	%i1,	%tick
	rd	%fprs,	%o6
	fcmpne16	%f26,	%f26,	%l1
	rdhpr	%hpstate,	%l4
	wr 	%g0, 	0x4, 	%fprs
	rdhpr	%htba,	%i6
	rdpr	%tba,	%g3
	fzeros	%f6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%i0,	0x1B30,	%tick
	fbul	%fcc2,	loop_360
	bvc,pt	%xcc,	loop_361
	te	%xcc,	0x6
	tne	%icc,	0x5
loop_360:
	tneg	%icc,	0x6
loop_361:
	rdhpr	%hintp,	%o4
	rd	%pc,	%g1
	rd	%y,	%l2
	fexpand	%f1,	%f2
	set	0x38, %i1
	stxa	%l0,	[%l7 + %i1] 0x19
	wrpr	%g6,	0x11B8,	%pil
	xnorcc	%o7,	0x1547,	%i2
	fornot1s	%f4,	%f18,	%f13
	flush	%l7 + 0x48
	rdpr	%cansave,	%i3
	rdhpr	%htba,	%o3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xB09, 	%tick_cmpr
	movne	%xcc,	%g4,	%g7
	tneg	%icc,	0x4
	xnorcc	%g5,	%g2,	%l5
	movrlez	%i7,	%o0,	%i5
	wr	%o5,	0x03C9,	%clear_softint
	wrpr	%o6,	%i1,	%cwp
	fornot2	%f0,	%f6,	%f24
	rd	%ccr,	%l1
	rd	%tick_cmpr,	%l4
	fands	%f8,	%f13,	%f27
	wrpr	%i6,	%g3,	%tick
	rdpr	%tba,	%i4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x2C1, 	%hsys_tick_cmpr
	wrpr	%i0,	0x0CAE,	%cwp
	fmovrslez	%o4,	%f9,	%f20
	rdhpr	%hpstate,	%g1
	wr 	%g0, 	0x4, 	%fprs
	wr	%l2,	0x0D9E,	%softint
	edge32l	%l0,	%g6,	%i2
	tvs	%icc,	0x0
	fpadd16s	%f27,	%f14,	%f14
	fmovrse	%i3,	%f3,	%f13
	umulcc	%o3,	%l3,	%o7
	sethi	0x1931,	%g4
	rd	%tick_cmpr,	%g7
	fornot2	%f4,	%f0,	%f12
	array16	%o2,	%g2,	%l5
	rdpr	%otherwin,	%i7
	brlz	%o0,	loop_362
	sethi	0x113D,	%i5
	rdpr	%otherwin,	%g5
	rdhpr	%hintp,	%o6
loop_362:
        wr    %g0,    0xe,    %pcr    ! changed.
	movne	%xcc,	%l4,	%i6
	wr 	%g0, 	0x5, 	%fprs

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x78F, 	%hsys_tick_cmpr
	rd	%pc,	%i0
	fbge	%fcc1,	loop_363
	wr	%o4,	0x18C9,	%sys_tick
	tne	%icc,	0x3
	rdpr	%cwp,	%g1
loop_363:
	rd	%softint,	%l6
	fmovdneg	%icc,	%f13,	%f15

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%l0,	0x04C0,	%sys_tick
	tcs	%xcc,	0x1
	movcc	%icc,	%o1,	%g6
	xorcc	%i3,	%i2,	%l3
	wrpr	%o7,	%g4,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xD62, 	%hsys_tick_cmpr
	std	%o2,	[%l7 + 0x30]
	mova	%xcc,	%g2,	%o3
	bne,a	loop_364
	tn	%icc,	0x7
	rdhpr	%hsys_tick_cmpr,	%i7
	wrpr	%o0,	%l5,	%tick
loop_364:
	rdhpr	%hpstate,	%i5
	wr	%g5,	0x0DB3,	%pic
	rd	%softint,	%o6
	wrpr	%o5,	%i1,	%cwp
	wrpr	%l4,	%g3,	%pil
	movcc	%xcc,	%i4,	%l1
	rdpr	%tba,	%i0
	sub	%o4,	%i6,	%l6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xADF, 	%hsys_tick_cmpr
	rdhpr	%hintp,	%l0
	edge16	%o1,	%i3,	%i2
	fbn,a	%fcc1,	loop_365
	rdhpr	%htba,	%g6
	wr	%o7,	0x147B,	%sys_tick
	brz,a	%l3,	loop_366
loop_365:
	addcc	%g4,	%g7,	%g2
	wr	%g0,	0x18,	%asi
	ldsba	[%l7 + 0x44] %asi,	%o3
loop_366:
	umul	%o2,	0x1ED7,	%i7
	rdhpr	%hpstate,	%l5
	fbl,a	%fcc3,	loop_367
	wrpr	%i5,	%g5,	%pil
	rdhpr	%hpstate,	%o6
	srl	%o5,	0x0A,	%o0
loop_367:
	wrpr	%l4,	0x1B19,	%tick
	membar	0x08
	wr	%g0,	0x19,	%asi
	ldsba	[%l7 + 0x49] %asi,	%g3
	fnands	%f6,	%f23,	%f6
	rdpr	%tl,	%i1
	movrgz	%l1,	%i0,	%o4
	wr	%i6,	0x09D1,	%sys_tick
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%l6,	%i4,	%clear_softint

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%sys_tick_cmpr,	%l0
	udiv	%g1,	0x1C35,	%i3
	edge32n	%i2,	%g6,	%o1
	brgz	%o7,	loop_368
	wr	%l3,	0x1858,	%y

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%pil,	%g2
loop_368:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	set	0x1C, %g6
	swapa	[%l7 + %g6] 0x10,	%i7
	wrpr	%l5,	0x0689,	%pil
	andncc	%g5,	%o6,	%i5
	rdpr	%pil,	%o5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x2B5, 	%hsys_tick_cmpr
	tne	%xcc,	0x3
	rdpr	%tl,	%l4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x4AD, 	%sys_tick_cmpr
	tsubcc	%i0,	0x0525,	%l1
	wr	%g0,	0x88,	%asi
	swapa	[%l7 + 0x6C] %asi,	%i6
	rd	%tick_cmpr,	%o4
	tvc	%xcc,	0x5
	movl	%xcc,	%l6,	%l2
	wrpr	%i4,	0x1787,	%tick
	rdhpr	%hsys_tick_cmpr,	%g1
	rdpr	%cwp,	%l0
	rdpr	%cwp,	%i2
	rdpr	%tba,	%i3
	wr	%g6,	0x198F,	%softint
	rdpr	%gl,	%o7
	stb	%l3,	[%l7 + 0x4B]
	rdpr	%cwp,	%g4
	rdpr	%wstate,	%g7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	fmovrse	%g2,	%f21,	%f15
	wrpr	%o2,	%o3,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xD2B, 	%sys_tick_cmpr
	srlx	%l5,	0x0A,	%i5
	wr	%o5,	%o6,	%pic
	orncc	%g3,	%o0,	%i1
	wr	%l4,	%i0,	%set_softint
	fmovrdgz	%i6,	%f2,	%f22
	wrpr	%l1,	0x010D,	%cwp
	rd	%ccr,	%l6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x30B, 	%sys_tick_cmpr
	alignaddrl	%i4,	%l0,	%g1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	add	%i2,	%g6,	%o7
	rd	%sys_tick_cmpr,	%i3
	fmovdvs	%xcc,	%f3,	%f23
	rdhpr	%hsys_tick_cmpr,	%l3
	rd	%softint,	%g7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xDE7, 	%hsys_tick_cmpr
	edge32l	%g2,	%g4,	%o3
	movleu	%xcc,	%o2,	%i7
	fmovdgu	%xcc,	%f3,	%f8
	orcc	%g5,	0x0D99,	%i5
	fcmps	%fcc3,	%f14,	%f25
	srl	%o5,	%o6,	%l5
	rdpr	%canrestore,	%g3
	wrpr	%i1,	%o0,	%tick
	movrlez	%i0,	0x2A9,	%l4
	fmovsgu	%icc,	%f12,	%f4
	rd	%pc,	%l1
	rdhpr	%htba,	%i6
	udivcc	%o4,	0x1A71,	%l2
	addccc	%i4,	%l6,	%l0
	rdhpr	%hintp,	%g1
	rd	%softint,	%g6
	wrpr	%o7,	0x00F8,	%pil
	edge16	%i2,	%l3,	%g7
	movn	%xcc,	%o1,	%g2
	rd	%y,	%i3
	popc	0x180F,	%o3
	fmuld8ulx16	%f22,	%f28,	%f12
	rdpr	%cwp,	%o2
	edge16n	%i7,	%g5,	%i5
	rdpr	%tba,	%g4
	orcc	%o5,	%l5,	%g3
	tl	%xcc,	0x1
	wrpr	%o6,	%i1,	%tick
	fmovrdne	%o0,	%f0,	%f14
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddr	%l4,	%l1,	%i0
	wr	%i6,	0x18B9,	%ccr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fmovdl	%icc,	%f28,	%f11
	fmovrsne	%l2,	%f26,	%f0
	rd	%y,	%i4
	fnand	%f6,	%f8,	%f28
	wrpr	%l6,	0x0125,	%cwp
	wrpr	%g1,	%g6,	%tick
	edge32ln	%l0,	%o7,	%l3
	rdhpr	%hpstate,	%i2
	set	0x30, %l2
	ldsha	[%l7 + %l2] 0x0c,	%g7
	rdhpr	%htba,	%o1
	movrne	%g2,	%o3,	%o2
	bneg	%xcc,	loop_369
	nop
	setx loop_370, %l0, %l1
	jmpl %l1, %i7
	wr	%g5,	%i5,	%softint
	rdhpr	%htba,	%i3
loop_369:
	add	%o5,	%l5,	%g3
loop_370:
	rd	%pc,	%o6
	fnot2	%f20,	%f22
	edge32l	%i1,	%g4,	%o0
	wr	%l1,	0x016C,	%y
	rdpr	%tba,	%l4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x8DD, 	%sys_tick_cmpr
	rdhpr	%hsys_tick_cmpr,	%o4
	wr	%l2,	0x0295,	%clear_softint
	orn	%l6,	%g1,	%i4
	smulcc	%l0,	0x0FE8,	%g6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x0D9, 	%hsys_tick_cmpr
	rdpr	%cwp,	%i2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	bcs	loop_371
	srl	%l3,	%o1,	%g2
	brlez,a	%o2,	loop_372
	andcc	%i7,	%o3,	%i5
loop_371:
	wr	%i3,	%g5,	%pic
	wr	%l5,	%o5,	%pic
loop_372:
	fbe	%fcc1,	loop_373
	rdpr	%tl,	%o6
	rd	%pc,	%i1
	edge32	%g3,	%o0,	%l1
loop_373:
	stx	%g4,	[%l7 + 0x20]
	nop
	setx loop_374, %l0, %l1
	jmpl %l1, %l4
	rdpr	%canrestore,	%i6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xF4E, 	%tick_cmpr
	movvs	%icc,	%l6,	%g1
loop_374:
	fbu	%fcc1,	loop_375
	wr	%o4,	%i4,	%clear_softint
	rd	%asi,	%l0
	fmovdneg	%icc,	%f17,	%f6
loop_375:
	for	%f16,	%f0,	%f16
	fbu	%fcc1,	loop_376
	rdhpr	%hintp,	%g6
	movcs	%xcc,	%i2,	%g7
	tpos	%icc,	0x6
loop_376:
	smulcc	%l3,	0x183C,	%o1
	rdpr	%gl,	%o7
	rd	%tick_cmpr,	%g2
	wr	%i7,	0x13A8,	%softint
	rd	%ccr,	%o2
	fones	%f26
	addcc	%o3,	0x074F,	%i5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	move	%xcc,	%o5,	%l5
	wr	%i1,	0x0BFC,	%pic
	rdpr	%tl,	%o6
	brgez	%o0,	loop_377
	wr	%g3,	%l1,	%ccr
	mova	%icc,	%l4,	%g4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xAA7, 	%hsys_tick_cmpr
loop_377:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xAA3, 	%hsys_tick_cmpr
	rdpr	%otherwin,	%l6
	rd	%ccr,	%o4
	wr	%g1,	0x16D7,	%set_softint
	sdivcc	%l0,	0x1A95,	%g6
	rdpr	%canrestore,	%i4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x36E, 	%hsys_tick_cmpr
	wrpr	%l3,	%i2,	%tick
	wr	%g0,	0x18,	%asi
	sta	%f4,	[%l7 + 0x60] %asi
	orcc	%o7,	0x0BBF,	%o1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x065, 	%hsys_tick_cmpr
	rdpr	%otherwin,	%g2
	wrpr	%i5,	0x03B8,	%tick
	fsrc1s	%f4,	%f2
	wr	%o3,	0x1667,	%set_softint
	wrpr	%g5,	%o5,	%pil
	and	%l5,	0x1FD8,	%i3
	srl	%o6,	0x16,	%i1
	rdpr	%tba,	%o0
	set	0x58, %l5
	stda	%g2,	[%l7 + %l5] 0x22
	membar	#Sync

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xAE6, 	%hsys_tick_cmpr
	wr 	%g0, 	0x4, 	%fprs
	rdhpr	%hpstate,	%l2
	popc	%i0,	%l6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%htba,	%l0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xB46, 	%hsys_tick_cmpr
	wrpr	%l3,	%i2,	%tick
	movg	%xcc,	%g6,	%o1
	addcc	%o7,	%o2,	%i7
	wr	%g2,	0x0D8B,	%ccr
	wrpr	%o3,	%i5,	%pil
	orcc	%o5,	0x15BC,	%l5
	movge	%icc,	%i3,	%o6
	wrpr	%g5,	%o0,	%tick
	movpos	%xcc,	%i1,	%g3
	wrpr	%l1,	0x1303,	%tick
	rdhpr	%hsys_tick_cmpr,	%g4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fmovdne	%icc,	%f13,	%f28
	xnorcc	%i6,	%i0,	%l6
	tgu	%icc,	0x7
	rdhpr	%hsys_tick_cmpr,	%g1
	wr	%l2,	%l0,	%y
	movcs	%icc,	%i4,	%o4
        wr    %g0,    0xe,    %pcr    ! changed.
	rdhpr	%hintp,	%g6
	andncc	%l3,	%o7,	%o2
	rd	%softint,	%i7
	rdhpr	%hsys_tick_cmpr,	%o1
	tl	%xcc,	0x7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xA18, 	%hsys_tick_cmpr
	tcs	%icc,	0x7
	edge16	%o5,	%l5,	%i5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%htba,	%o0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	fmovsge	%icc,	%f14,	%f5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sir	0x056E
	tcc	%icc,	0x1
	fmovsvs	%icc,	%f30,	%f15
	wrpr	%g3,	%g5,	%cwp
	sdivcc	%l1,	0x1EAF,	%l4
	wr	%g0,	0x88,	%asi
	ldda	[%l7 + 0x20] %asi,	%g4
	rdpr	%otherwin,	%i6
	rd	%pc,	%l6
	fmovsn	%xcc,	%f10,	%f17
	rd	%pc,	%g1
	tle	%xcc,	0x5
	wr	%g0,	0x27,	%asi
	ldda	[%l7 + 0x70] %asi,	%l2
	fba	%fcc1,	loop_378
	tg	%xcc,	0x5
	ba,a,pt	%icc,	loop_379
	rdpr	%cansave,	%l0
loop_378:
	wr	%i4,	0x049E,	%y
	wrpr	%o4,	%i0,	%cwp
loop_379:
	rdhpr	%hintp,	%g7
	fbne	%fcc0,	loop_380
	fexpand	%f5,	%f8
	fbo	%fcc1,	loop_381
	sdivcc	%g6,	0x194F,	%i2
loop_380:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xE30, 	%hsys_tick_cmpr
	wrpr	%o7,	%o2,	%tick
loop_381:
	or	%o1,	0x0C7C,	%g2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x99C, 	%hsys_tick_cmpr
	rd	%y,	%o3
	mulx	%l5,	%i5,	%o5
	or	%i3,	%o6,	%o0
	rdhpr	%hintp,	%g3
	rdpr	%gl,	%g5
	tl	%icc,	0x4
	fnors	%f2,	%f8,	%f3
	edge16l	%l1,	%l4,	%i1
	rdpr	%cwp,	%g4
	add	%l7,	0x28,	%l6
	wr	%g0,	0x18,	%asi
	casxa	[%l6] 0x18,	%i6,	%l6
	wrpr	%g1,	%l0,	%tick
	set	0x18, %i4
	ldswa	[%l7 + %i4] 0x19,	%l2
	wrpr	%i4,	0x0208,	%cwp
	rd	%ccr,	%i0
	sdiv	%o4,	0x01C5,	%g6
	movrlez	%i2,	%g7,	%l3
	fabsd	%f18,	%f0
	rdhpr	%hintp,	%o7
	set	0x18, %i2
	prefetcha	[%l7 + %i2] 0x10,	 0x3
	wr	%g0,	0x18,	%asi
	lduba	[%l7 + 0x43] %asi,	%o1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%otherwin,	%i7
	fmovrse	%o3,	%f20,	%f3
	rdhpr	%htba,	%l5
	rdpr	%cleanwin,	%o5
	set	0x64, %l4
	sta	%f23,	[%l7 + %l4] 0x04
	rdhpr	%hpstate,	%i3
	wrpr	%i5,	%o0,	%tick
	andn	%o6,	%g3,	%l1
	rdpr	%wstate,	%g5
	fpack32	%f22,	%f14,	%f24
	fmul8sux16	%f22,	%f4,	%f4
	rdpr	%cansave,	%i1
	rdpr	%cansave,	%l4
	tn	%xcc,	0x4
	wrpr	%g4,	0x017D,	%pil
	rd	%ccr,	%l6
	rdhpr	%hpstate,	%g1
	fmovdle	%icc,	%f5,	%f7
	fsrc1s	%f11,	%f28
	rdhpr	%hintp,	%i6
	wrpr	%l2,	%i4,	%tick
	fnot1	%f18,	%f22
	wrpr	%i0,	0x0101,	%pil
	set	0x58, %l3
	stba	%l0,	[%l7 + %l3] 0xea
	membar	#Sync
	wrpr	%o4,	%g6,	%tick
	fexpand	%f7,	%f24
	nop
	set	0x70, %g4
	std	%f28,	[%l7 + %g4]
	fands	%f19,	%f15,	%f0
	rd	%sys_tick_cmpr,	%i2
	rd	%ccr,	%l3
        wr    %g0,    0xe,    %pcr    ! changed.
	lduh	[%l7 + 0x48],	%o1
	fbe,a	%fcc0,	loop_382
	rd	%pc,	%g7
	xnorcc	%i7,	0x0C2F,	%g2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x99F, 	%hsys_tick_cmpr
loop_382:
	rdpr	%otherwin,	%l5
	rdhpr	%hpstate,	%i3
	rd	%ccr,	%o5
	fbo	%fcc1,	loop_383
	wrpr	%o0,	0x18BF,	%pil
	wr	%i5,	0x0E39,	%ccr
	rd	%pc,	%g3
loop_383:
	wr	%o6,	0x06E3,	%sys_tick
	movrgez	%g5,	%i1,	%l4
	addcc	%g4,	%l1,	%l6
	add	%i6,	0x0137,	%l2
	andcc	%g1,	%i0,	%i4
	rdhpr	%htba,	%l0
	lduh	[%l7 + 0x7C],	%g6
	rdpr	%cleanwin,	%i2
	fmovsg	%xcc,	%f19,	%f30
	wr	%o4,	0x1732,	%y
	rd	%softint,	%l3
	movrne	%o2,	0x3E0,	%o7
	set	0x55, %o5
	lduba	[%l7 + %o5] 0x18,	%o1
	set	0x10, %g2
	ldda	[%l7 + %g2] 0x89,	%g6
	rdhpr	%hintp,	%i7
	rd	%sys_tick_cmpr,	%o3
	fnot2	%f20,	%f22
	rdpr	%pil,	%l5
	tg	%icc,	0x7
	fxors	%f15,	%f7,	%f25
	rdhpr	%hpstate,	%g2
	wr 	%g0, 	0x6, 	%fprs

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x525, 	%hsys_tick_cmpr
	rd	%pc,	%i5
	fmul8sux16	%f18,	%f8,	%f4
	wrpr	%g3,	0x017D,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xD42, 	%hsys_tick_cmpr
	srlx	%i1,	%g4,	%l4
	fmul8x16	%f18,	%f4,	%f22
	edge16	%l6,	%i6,	%l2
	rd	%softint,	%l1
	movl	%icc,	%i0,	%i4
	wrpr	%l0,	%g6,	%cwp
	stb	%i2,	[%l7 + 0x73]

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xD3A, 	%hsys_tick_cmpr
	rdpr	%wstate,	%o4
	rd	%fprs,	%o2
	tvc	%icc,	0x7
	rd	%y,	%o7
	rdhpr	%hintp,	%o1
	sethi	0x0929,	%g7
	ldsb	[%l7 + 0x58],	%o3
	rdhpr	%hsys_tick_cmpr,	%i7
	flush	%l7 + 0x50
	rdhpr	%hintp,	%l5
	flush	%l7 + 0x48
	rdpr	%pil,	%g2
	rdhpr	%hpstate,	%o5
	set	0x40, %l1
	stda	%f16,	[%l7 + %l1] 0xda
	rd	%fprs,	%i3
	wr	%o0,	0x174C,	%y
	wrpr	%g3,	%g5,	%tick
	rdpr	%tba,	%o6
	for	%f8,	%f28,	%f14
	tcs	%xcc,	0x7
	rdpr	%cleanwin,	%i1
	taddcctv	%g4,	0x060A,	%l4
	rdhpr	%htba,	%l6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	alignaddrl	%l1,	%i0,	%i4
	movrgez	%l2,	%l0,	%i2
	wr	%g1,	%l3,	%clear_softint

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x707, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x377, 	%tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xB36, 	%hsys_tick_cmpr
	wr	%g7,	%o7,	%sys_tick
	wr	%o3,	0x0E56,	%softint
	tcc	%xcc,	0x2
	sllx	%i7,	0x0C,	%l5
	sllx	%g2,	%i3,	%o5
	rdhpr	%hintp,	%g3
	rd	%fprs,	%o0
	umulcc	%g5,	%o6,	%g4
	wrpr	%i1,	%l6,	%cwp
	rdpr	%wstate,	%l4
	rdpr	%cwp,	%i6
	wrpr	%i5,	%i0,	%cwp
	fmovrdgz	%l1,	%f28,	%f14
	wrpr	%l2,	%i4,	%cwp
	rdpr	%tba,	%l0
	rdhpr	%hsys_tick_cmpr,	%g1
	popc	%l3,	%o4
	rdhpr	%hsys_tick_cmpr,	%g6
	movleu	%icc,	%o2,	%o1
	ldstub	[%l7 + 0x60],	%g7
	rd	%tick_cmpr,	%o7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x593, 	%hsys_tick_cmpr
	rd	%sys_tick_cmpr,	%i2
	rd	%y,	%i7
	orcc	%g2,	%l5,	%i3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%hpstate,	%g3
	fexpand	%f22,	%f28
	fcmpeq16	%f2,	%f10,	%g5
	and	%o0,	0x02CF,	%g4
	wr	%i1,	%o6,	%softint
	sethi	0x0DE4,	%l4
	rd	%asi,	%l6
	edge32	%i6,	%i5,	%i0
	sllx	%l1,	%l2,	%i4
	rd	%asi,	%g1
	bge,a	%xcc,	loop_384
	or	%l3,	0x02D8,	%o4
	rd	%ccr,	%l0
	edge16n	%o2,	%g6,	%o1
loop_384:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	sra	%o3,	%i2,	%i7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x750, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%htba,	%g3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%hsys_tick_cmpr,	%o0
	rdhpr	%hsys_tick_cmpr,	%i1
	wrpr	%o6,	0x0E19,	%pil
	rdpr	%cansave,	%l4
	wrpr	%g4,	%l6,	%pil
	wr	%i6,	0x10D6,	%clear_softint
	rdpr	%otherwin,	%i0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%i4,	0x1C22,	%clear_softint
	rdpr	%cwp,	%l1
	fbu,a	%fcc2,	loop_385
	fmovsneg	%icc,	%f15,	%f17
	ldd	[%l7 + 0x10],	%l2
	wrpr	%o4,	0x1AD1,	%tick
loop_385:
	srlx	%g1,	%l0,	%g6
	orcc	%o2,	0x0A2D,	%o7
	addc	%g7,	%o3,	%o1
	rdpr	%cansave,	%i2
	rdpr	%otherwin,	%l5
	rdhpr	%hsys_tick_cmpr,	%i7
	edge32	%i3,	%g2,	%g5
	sll	%g3,	0x05,	%o0
	rdhpr	%hsys_tick_cmpr,	%o5
	tge	%xcc,	0x0
	rdhpr	%htba,	%o6
	movg	%icc,	%i1,	%g4
	rdhpr	%hintp,	%l4
	rdpr	%tba,	%i6
	rd	%softint,	%i0
	fbl	%fcc0,	loop_386
	fcmple16	%f20,	%f22,	%l6
	wrpr	%l2,	%i5,	%cwp
	fornot2s	%f13,	%f18,	%f4
loop_386:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xA6E, 	%hsys_tick_cmpr
	movne	%xcc,	%o4,	%l3
	wr	%g1,	0x069B,	%y
	orcc	%l0,	%o2,	%g6
	rd	%y,	%g7
	rdpr	%canrestore,	%o3
	fmovda	%xcc,	%f22,	%f11
	addcc	%o7,	0x076B,	%o1
	fbl,a	%fcc2,	loop_387
	rdpr	%cleanwin,	%l5
	rdhpr	%hintp,	%i2
	fpack32	%f8,	%f22,	%f10
loop_387:
	umulcc	%i7,	%g2,	%g5
	fcmpeq16	%f8,	%f20,	%i3
	rdpr	%canrestore,	%g3
	fpsub16s	%f9,	%f17,	%f29
	tcs	%xcc,	0x4
	fcmps	%fcc3,	%f17,	%f30
	edge8	%o5,	%o0,	%i1
	rdpr	%wstate,	%o6
	rdpr	%gl,	%g4
	alignaddr	%i6,	%i0,	%l4
	bleu	loop_388
	and	%l2,	%l6,	%i5
	rd	%softint,	%l1
	movn	%xcc,	%i4,	%o4
loop_388:
	rdpr	%cansave,	%g1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x472, 	%hsys_tick_cmpr
	stw	%g6,	[%l7 + 0x10]

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	xnorcc	%o2,	0x1649,	%o7
	rdhpr	%hintp,	%l5
	wr	%i2,	0x1579,	%set_softint
	sdivcc	%i7,	0x118D,	%g2
	rdhpr	%hpstate,	%g5
	array32	%o1,	%g3,	%i3
	xnor	%o5,	0x10FA,	%i1
	rd	%ccr,	%o0
	edge8n	%g4,	%i6,	%o6
	edge32n	%l4,	%l2,	%i0
	edge8	%i5,	%l6,	%l1
	ld	[%l7 + 0x14],	%f8

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xFEC, 	%hsys_tick_cmpr
	rd	%asi,	%i4
        wr    %g0,    0xe,    %pcr    ! changed.
	rd	%asi,	%g6
	xnor	%g7,	0x11F6,	%o2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	wrpr	%o7,	%i2,	%pil
	movrne	%i7,	0x09F,	%g2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x384, 	%sys_tick_cmpr
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tpos	%icc,	0x0
	fbg,a	%fcc2,	loop_389
	rd	%sys_tick_cmpr,	%o1
	array16	%i3,	%g3,	%o5
	rdhpr	%htba,	%i1
loop_389:
	addccc	%g4,	0x08EF,	%i6
	rd	%tick_cmpr,	%o6
	wrpr	%o0,	%l2,	%cwp
	popc	0x153C,	%l4
	subc	%i5,	0x096B,	%i0
	rdpr	%tl,	%l1
        wr    %g0,    0xe,    %pcr    ! changed.
	wrpr	%o4,	%g1,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xCB8, 	%hsys_tick_cmpr
	movpos	%icc,	%l3,	%l0
	wr	%g6,	0x14E7,	%ccr
	set	0x46, %o3
	ldsba	[%l7 + %o3] 0x0c,	%o2
	rdpr	%otherwin,	%g7
	rdpr	%otherwin,	%o3
	rdhpr	%hpstate,	%i2
	wrpr	%o7,	0x1B00,	%tick
	brgez,a	%i7,	loop_390
	sdivx	%g2,	0x0AF6,	%g5
	rdhpr	%hsys_tick_cmpr,	%o1
	taddcctv	%i3,	0x02C3,	%l5
loop_390:
	udivcc	%g3,	0x1459,	%i1
	fcmpgt16	%f16,	%f16,	%o5
	tcc	%xcc,	0x3
	sdivx	%g4,	0x1446,	%o6
	edge32l	%i6,	%l2,	%o0
	alignaddr	%i5,	%l4,	%l1
	rd	%asi,	%i0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	or	%o4,	0x1E52,	%l6
	rd	%softint,	%i4
	wr	%g0,	0x80,	%asi
	ldsba	[%l7 + 0x15] %asi,	%l3
	tvc	%icc,	0x3
	rd	%tick_cmpr,	%g1
	wrpr	%g6,	0x1F16,	%cwp
	fmovrsgez	%l0,	%f11,	%f8
	rdpr	%tl,	%g7
	rdpr	%cleanwin,	%o3
	ld	[%l7 + 0x48],	%f12

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x055, 	%hsys_tick_cmpr
	fmovdneg	%icc,	%f18,	%f6
	prefetch	[%l7 + 0x38],	 0x0
	fmul8x16al	%f29,	%f14,	%f8
	smulcc	%o7,	%g5,	%i3
	movrgez	%l5,	%g3,	%o1
	st	%f27,	[%l7 + 0x24]
	movleu	%xcc,	%o5,	%g4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	ld	[%l7 + 0x34],	%f10
	rdpr	%canrestore,	%i1
	rdhpr	%hpstate,	%i6
	pdist	%f12,	%f10,	%f0
	rdhpr	%htba,	%o0
	wr 	%g0, 	0x7, 	%fprs

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	movre	%i0,	0x2CE,	%o4
	rdhpr	%htba,	%l1
	rdpr	%tba,	%l6
	movre	%l3,	%i4,	%g6
	rdhpr	%hintp,	%l0
	wr	%g7,	0x1C32,	%y
	rdpr	%otherwin,	%o3
	rd	%y,	%i2
	wr	%g0,	0x04,	%asi
	lduba	[%l7 + 0x47] %asi,	%g1
	wr	%g0,	0x89,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	rdhpr	%hpstate,	%i7
	array8	%o2,	%g2,	%g5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%tick_cmpr,	%o5
	movne	%icc,	%g4,	%o7
	wrpr	%i1,	%o6,	%pil
	add	%i6,	%l2,	%o0
	pdist	%f28,	%f4,	%f2
	bge,a,pn	%icc,	loop_391
	rdpr	%tl,	%i5
	movpos	%icc,	%l4,	%i0
	edge32l	%l1,	%o4,	%l3
loop_391:
	sethi	0x1DB5,	%i4
	wrpr	%g6,	%l6,	%tick
	rdhpr	%hsys_tick_cmpr,	%g7
	xnor	%o3,	%l0,	%i2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%softint,	%g1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%gl,	%i3
	wrpr	%g3,	0x1B08,	%tick
	udivx	%l5,	0x0EF3,	%o1
	fmovsgu	%xcc,	%f25,	%f25
	sir	0x0043

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xA22, 	%hsys_tick_cmpr
	fmul8sux16	%f18,	%f0,	%f10
	mova	%xcc,	%o5,	%i1
	wrpr	%o6,	0x1F2A,	%cwp
	fxor	%f16,	%f20,	%f14

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%o7,	%o0,	%pil
	rdpr	%pil,	%l2
	rdpr	%canrestore,	%l4
	fcmpgt32	%f4,	%f16,	%i0
	rdhpr	%htba,	%i5
	rd	%softint,	%o4
	wr	%g0,	0x18,	%asi
	stda	%l0,	[%l7 + 0x20] %asi
	rd	%tick_cmpr,	%i4
	edge16	%l3,	%l6,	%g6
	rdpr	%tl,	%g7
	wr	%o3,	%l0,	%ccr
	rd	%sys_tick_cmpr,	%i2
	wr 	%g0, 	0x4, 	%fprs
	wrpr	%g2,	0x1616,	%pil
	edge8ln	%g5,	%g1,	%i3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xE93, 	%hsys_tick_cmpr
	wr	%o1,	0x1A6E,	%ccr
	orcc	%g4,	%o5,	%g3
	tcc	%xcc,	0x4
	edge16	%i1,	%o6,	%i6
	rd	%ccr,	%o7
	rdpr	%tl,	%o0
	tle	%xcc,	0x7
	array32	%l2,	%l4,	%i0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	or	%l1,	0x0BF8,	%i4
	wr	%l6,	0x15EE,	%y
	rd	%tick_cmpr,	%g6
	umulcc	%l3,	0x1473,	%o3
	rdhpr	%hpstate,	%g7
	rd	%tick_cmpr,	%i2
	fsrc1	%f20,	%f24
	sll	%i7,	0x0A,	%l0
	rdpr	%otherwin,	%g2
	rdpr	%pil,	%o2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x7EF, 	%hsys_tick_cmpr
	rd	%softint,	%i3
	xorcc	%o1,	0x13BE,	%g4
	rdpr	%canrestore,	%l5
	edge16l	%g3,	%i1,	%o6
	mulx	%i6,	%o7,	%o0
	subcc	%l2,	0x17F7,	%o5
	set	0x32, %l6
	ldsha	[%l7 + %l6] 0x19,	%i0
	movrlz	%i5,	0x2BB,	%o4
	edge16	%l1,	%i4,	%l4
	rd	%y,	%l6
	movneg	%icc,	%l3,	%o3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fmovdne	%xcc,	%f23,	%f31
	rd	%ccr,	%i7
	tg	%icc,	0x3
	array32	%g7,	%g2,	%l0
	fnegd	%f28,	%f14
	xorcc	%g5,	%o2,	%g1
	andn	%o1,	%i3,	%l5
	fpmerge	%f8,	%f21,	%f20
	rdpr	%otherwin,	%g4
	tvs	%xcc,	0x2
        wr    %g0,    0xe,    %pcr    ! changed.
	movneg	%xcc,	%i6,	%o6
	edge16ln	%o7,	%l2,	%o5
	rdhpr	%hsys_tick_cmpr,	%o0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wrpr	%i0,	0x10BD,	%cwp
	addc	%i5,	0x11E8,	%l1
	wr	%i4,	0x08EC,	%softint

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	srlx	%l3,	%l6,	%o3
	rdhpr	%hintp,	%g6
	be,a,pn	%icc,	loop_392
	rdpr	%tl,	%i7
	rdhpr	%hintp,	%g7
	wrpr	%i2,	%l0,	%tick
loop_392:
	movge	%xcc,	%g5,	%o2
	wrpr	%g1,	0x16F9,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xA41, 	%sys_tick_cmpr
	set	0x20, %i5
	lduwa	[%l7 + %i5] 0x11,	%i3
        wr    %g0,    0xe,    %pcr    ! changed.
	wrpr	%l5,	0x1F01,	%tick
	rdhpr	%htba,	%g3
	move	%icc,	%i6,	%o6
	tle	%xcc,	0x3
	rdpr	%cleanwin,	%i1
	wrpr	%l2,	%o5,	%cwp
	orcc	%o0,	0x01E4,	%i0
	set	0x7E, %o6
	ldsba	[%l7 + %o6] 0x88,	%i5
	rd	%tick_cmpr,	%o7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	alignaddrl	%l1,	%o4,	%l3
	rdpr	%cwp,	%l4
	srl	%l6,	%o3,	%g6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xF82, 	%hsys_tick_cmpr
	wr	%i7,	0x0BD8,	%clear_softint
	tcc	%xcc,	0x1
	fsrc1s	%f1,	%f29
	sll	%i2,	%g5,	%l0
	wrpr	%o2,	%g1,	%tick
	rdpr	%cwp,	%g2
	rdpr	%canrestore,	%i3
	taddcc	%g4,	0x0E88,	%l5
	movn	%icc,	%o1,	%g3
	rdhpr	%hintp,	%i6
	rdhpr	%htba,	%o6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x2F2, 	%hsys_tick_cmpr
	rd	%y,	%i1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x3B7, 	%tick_cmpr
	rdpr	%gl,	%o7
	wrpr	%i4,	%i0,	%cwp
	rdhpr	%hsys_tick_cmpr,	%l1
	rdhpr	%hsys_tick_cmpr,	%o4
	rdhpr	%htba,	%l3
	rdpr	%tl,	%l4
	set	0x52, %i0
	ldsha	[%l7 + %i0] 0x89,	%o3
	addcc	%g6,	0x13F7,	%g7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x9FB, 	%hsys_tick_cmpr
	brlz	%i7,	loop_393
	rdpr	%tba,	%g5
	fcmpes	%fcc2,	%f7,	%f30
	orn	%l0,	%i2,	%g1
loop_393:
	fpack16	%f6,	%f26
	rdhpr	%hsys_tick_cmpr,	%g2
	rd	%asi,	%i3
	bpos,pn	%icc,	loop_394
	rdpr	%wstate,	%g4
	wrpr	%l5,	0x063D,	%cwp
	fblg,a	%fcc0,	loop_395
loop_394:
        wr    %g0,    0xe,    %pcr    ! changed.
	rd	%softint,	%i6
	ble,a,pn	%xcc,	loop_396
loop_395:
	rd	%pc,	%o6
	rd	%ccr,	%l2
	xnorcc	%i1,	0x1495,	%o5
loop_396:
	andncc	%o2,	%o0,	%i5
	wr	%g0,	0x19,	%asi
	ldswa	[%l7 + 0x6C] %asi,	%o7
	orcc	%i4,	%i0,	%o4
	rdpr	%tba,	%l3
	bne,a,pt	%xcc,	loop_397
	wr	%l1,	%l4,	%set_softint
	wrpr	%g6,	%g7,	%cwp
	rdhpr	%hpstate,	%o3
loop_397:
	rdhpr	%hsys_tick_cmpr,	%l6
	rdpr	%cwp,	%g5
	wr	%l0,	0x11E6,	%pic

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%sys_tick_cmpr,	%i2
	wr	%g2,	%g1,	%pic

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xE46, 	%hsys_tick_cmpr
	fzeros	%f16
	wr	%g0,	0x81,	%asi
	ldsba	[%l7 + 0x57] %asi,	%g4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%g3,	0x1AAC,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%o6,	%i1,	%cwp
	swap	[%l7 + 0x54],	%o2
	rdpr	%pil,	%o0
	rd	%softint,	%i5
	movl	%xcc,	%o7,	%o5
	rd	%y,	%i0
	brlez	%i4,	loop_398
	and	%o4,	%l3,	%l1
	wr	%g6,	0x14CE,	%pic
	wrpr	%g7,	0x072C,	%tick
loop_398:
	fmul8x16al	%f20,	%f16,	%f2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	sir	0x1AEB
	rd	%ccr,	%o3
	tne	%icc,	0x1
	wrpr	%l6,	0x0D9B,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	movcc	%xcc,	%i2,	%i7
	wrpr	%g2,	0x0781,	%pil
	wrpr	%g1,	%g4,	%cwp
	rdpr	%cleanwin,	%i3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	orn	%g3,	0x0F3E,	%o1
	ldsb	[%l7 + 0x5A],	%i6
	fnands	%f6,	%f3,	%f0
	movgu	%icc,	%l2,	%o6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%asi,	%i1
	rd	%asi,	%i5
	rd	%fprs,	%o0
	rdhpr	%htba,	%o7
	wrpr	%o5,	0x1E77,	%cwp
	fmovdl	%xcc,	%f13,	%f8
	subc	%i4,	0x15F5,	%o4
	fmovdl	%xcc,	%f0,	%f7
	wr	%i0,	%l1,	%pic

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xAEA, 	%hsys_tick_cmpr
	fsrc2s	%f15,	%f2
	rd	%asi,	%l3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%otherwin,	%g5
	wrpr	%l0,	0x02A5,	%tick
	fbl	%fcc1,	loop_399
	wr	%i2,	0x1A3E,	%pic

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x569, 	%hsys_tick_cmpr
	wr	%i7,	%g2,	%softint
loop_399:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%hpstate,	%o1
	wrpr	%i3,	0x01F4,	%pil
	rd	%y,	%i6
	fmovspos	%icc,	%f12,	%f12
	movrgez	%o6,	%l2,	%o2
	wrpr	%i5,	%i1,	%pil
	rdpr	%canrestore,	%o7
	alignaddrl	%o5,	%i4,	%o4
	rdpr	%gl,	%o0
	rdhpr	%htba,	%l1
	wr	%i0,	%g6,	%clear_softint
	wr	%l3,	0x1023,	%y

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x235, 	%hsys_tick_cmpr
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	rdpr	%pil,	%g7
	set	0x20, %g5
	stha	%l6,	[%l7 + %g5] 0x22
	membar	#Sync
	lduw	[%l7 + 0x2C],	%l0
	rdhpr	%hsys_tick_cmpr,	%g5
	fcmpd	%fcc2,	%f26,	%f2
	nop
	setx	loop_400,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fcmpeq16	%f6,	%f10,	%i2
	rdpr	%tba,	%o3
	alignaddrl	%i7,	%g1,	%g4
loop_400:
	rdpr	%wstate,	%g2
	wrpr	%l5,	0x19C0,	%cwp
	rdpr	%tl,	%g3
	wr	%o1,	%i6,	%softint
	edge16n	%i3,	%o6,	%l2
	bpos,pn	%icc,	loop_401
	rd	%softint,	%i5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr 	%g0, 	0x6, 	%fprs
loop_401:
	wr	%o5,	%o4,	%set_softint
	brz	%i4,	loop_402
	orncc	%o0,	%l1,	%i0
	rdhpr	%hpstate,	%g6
	wrpr	%l3,	0x154A,	%tick
loop_402:
	sllx	%g7,	%l6,	%l4
	edge16l	%l0,	%g5,	%o3
	wr	%i7,	%i2,	%sys_tick
	wr 	%g0, 	0x5, 	%fprs

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	edge8	%g4,	%g3,	%l5
	tge	%icc,	0x6
	fcmped	%fcc1,	%f16,	%f22
	sra	%i6,	%o1,	%o6
	fmovrsgz	%l2,	%f0,	%f29
	wr	%i3,	%i5,	%pic

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%wstate,	%o7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x539, 	%hsys_tick_cmpr
	ldx	[%l7 + 0x30],	%g6
	rdpr	%canrestore,	%l1
	fbl,a	%fcc0,	loop_403
	rdhpr	%hintp,	%g7
	wrpr	%l6,	%l3,	%pil
	movgu	%xcc,	%l4,	%g5
loop_403:
	fbu,a	%fcc2,	loop_404
	rd	%tick_cmpr,	%l0
	rd	%ccr,	%o3
	umul	%i7,	%i2,	%g2
loop_404:
	rd	%y,	%g4
	rd	%pc,	%g3
	movrgez	%g1,	%i6,	%l5
	rdpr	%tba,	%o1
	xnor	%l2,	0x1455,	%o6
	wr	%g0,	0x88,	%asi
	lda	[%l7 + 0x20] %asi,	%f31
	wrpr	%i3,	%i1,	%tick
	movl	%icc,	%o7,	%i5
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x60] %asi,	%o5
	fornot1	%f4,	%f8,	%f22
	wrpr	%o2,	%i4,	%pil
	fone	%f6
	fcmpgt32	%f28,	%f24,	%o0
	bl	loop_405
	movrgz	%i0,	%o4,	%g6
	udiv	%l1,	0x0F50,	%l6
	fmul8x16al	%f25,	%f25,	%f24
loop_405:
	rd	%tick_cmpr,	%l3
	edge32ln	%l4,	%g5,	%l0
	rd	%softint,	%o3
	array32	%i7,	%i2,	%g7
	array32	%g4,	%g3,	%g2
        wr    %g0,    0xe,    %pcr    ! changed.
	wrpr	%l5,	%o1,	%cwp
	rd	%ccr,	%l2
	umul	%o6,	0x0179,	%i3
	fbg,a	%fcc1,	loop_406
	wr	%i6,	%i1,	%ccr
	fbe	%fcc3,	loop_407
	srax	%i5,	0x04,	%o7
loop_406:
	fornot2	%f12,	%f18,	%f16

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xA1A, 	%hsys_tick_cmpr
loop_407:
	rdpr	%gl,	%o0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%i0,	0x0FAA,	%tick
	rdpr	%cleanwin,	%o4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%l6,	%l3,	%pil
	movrgz	%g5,	0x193,	%l4
	sll	%o3,	0x1A,	%l0
	rdhpr	%hsys_tick_cmpr,	%i2
	rd	%tick_cmpr,	%i7
	fzero	%f22
	wrpr	%g4,	%g3,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%hpstate,	%l2
	sdiv	%o6,	0x08D2,	%i3
	nop
	set	0x2B, %o7
	ldub	[%l7 + %o7],	%i6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x641, 	%hsys_tick_cmpr
	set	0x38, %g3
	lduwa	[%l7 + %g3] 0x19,	%i5
	rdhpr	%hsys_tick_cmpr,	%o2
	rd	%fprs,	%o5
	rdhpr	%hpstate,	%o7
	rdpr	%cwp,	%o0
	rd	%ccr,	%i4
	tsubcc	%o4,	0x15E6,	%g6
	wr	%l1,	0x045F,	%softint
	rdhpr	%hpstate,	%i0
	edge16l	%l6,	%l3,	%l4
        wr    %g0,    0xe,    %pcr    ! changed.
	wrpr	%l0,	%i2,	%tick
	wrpr	%i7,	0x178D,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x7A6, 	%hsys_tick_cmpr
	sdivx	%g2,	0x1060,	%g5
	rdhpr	%hpstate,	%l5
	rdhpr	%htba,	%g7
	fand	%f4,	%f12,	%f30
	andn	%l2,	0x046E,	%o6
	wr	%i3,	0x1E53,	%clear_softint
	edge32ln	%i6,	%i1,	%g1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%pil,	%i5
	rdhpr	%hsys_tick_cmpr,	%o5
	wrpr	%o0,	0x0D3A,	%tick
	edge16	%o7,	%o4,	%g6
	rdhpr	%hpstate,	%i4
	rdhpr	%htba,	%l1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xF7B, 	%tick_cmpr
	te	%xcc,	0x1
	edge32ln	%i0,	%l3,	%o3
	rd	%sys_tick_cmpr,	%l4
	rd	%pc,	%i2
	movcc	%xcc,	%l0,	%g4
	movle	%xcc,	%i7,	%g3
	rdhpr	%hintp,	%g2
	bleu	loop_408
	ldx	[%l7 + 0x60],	%g5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x99D, 	%hsys_tick_cmpr
	fmovsneg	%icc,	%f5,	%f19
loop_408:
	rdhpr	%hpstate,	%l2
	rdpr	%tba,	%o6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%y,	%g7
	st	%f18,	[%l7 + 0x24]
	fmul8x16	%f3,	%f0,	%f22
	sra	%i6,	0x1A,	%i1
	rd	%asi,	%g1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	movl	%xcc,	%o5,	%o0
	rdhpr	%hintp,	%o1
	set	0x40, %i7
	ldda	[%l7 + %i7] 0x10,	%o6
	fones	%f11
	wrpr	%o4,	0x1D62,	%tick
	wrpr	%g6,	0x128F,	%tick
	bvc,a	loop_409
	tcc	%xcc,	0x2
	rdpr	%canrestore,	%i4
	udiv	%l1,	0x046B,	%i0
loop_409:
	subc	%l6,	%o3,	%l3
	rdhpr	%hsys_tick_cmpr,	%i2
	rdhpr	%hintp,	%l0
	edge32l	%l4,	%i7,	%g3
	wrpr	%g4,	%g2,	%pil
	rdpr	%cleanwin,	%g5
	fmovsleu	%xcc,	%f0,	%f30
	wr	%l2,	0x1197,	%pic
	sub	%o6,	%i3,	%g7
	alignaddr	%i6,	%i1,	%g1
	rdpr	%otherwin,	%l5
	rdpr	%cleanwin,	%o2
	edge32l	%o5,	%o0,	%o1
	wr	%i5,	0x0353,	%sys_tick
	wrpr	%o4,	0x1B7D,	%pil
	rdhpr	%hsys_tick_cmpr,	%g6
	array32	%i4,	%o7,	%l1
	rdhpr	%htba,	%i0
	fpadd16s	%f2,	%f2,	%f22
        wr    %g0,    0xe,    %pcr    ! changed.
	wrpr	%l3,	%i2,	%tick
	srlx	%l0,	0x19,	%l4
	set	0x74, %o1
	lda	[%l7 + %o1] 0x10,	%f18
	or	%i7,	0x033D,	%g4
	edge32l	%g2,	%g3,	%l2
	orncc	%o6,	%g5,	%i3
	subcc	%i6,	%i1,	%g1
        wr    %g0,    0xe,    %pcr    ! changed.
	ta	%xcc,	0x5
	wr	%o5,	%g7,	%y
	array8	%o1,	%o0,	%o4
	rdhpr	%hpstate,	%i5
	rdpr	%tl,	%g6
	rdhpr	%htba,	%o7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	nop
	setx loop_410, %l0, %l1
	jmpl %l1, %i0
	wrpr	%i4,	0x0F81,	%cwp
	fmovrdgz	%o3,	%f20,	%f10
	rdhpr	%hsys_tick_cmpr,	%l6
loop_410:
	rdhpr	%hsys_tick_cmpr,	%l3
	rdhpr	%hpstate,	%l0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x9A8, 	%hsys_tick_cmpr
	subc	%i7,	%i2,	%g4
	rd	%sys_tick_cmpr,	%g2
	sir	0x0207

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x622, 	%hsys_tick_cmpr
	wrpr	%i6,	0x0AD0,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x883, 	%sys_tick_cmpr
	wrpr	%l5,	0x0624,	%pil
	rd	%fprs,	%i1
	umul	%o5,	0x01ED,	%g7
	fxnor	%f4,	%f22,	%f22
	rd	%fprs,	%o1
	smul	%o2,	%o4,	%o0
	rdpr	%gl,	%g6
	xorcc	%o7,	0x15D1,	%l1
	movrgz	%i5,	%i0,	%i4
	bn,pt	%xcc,	loop_411
	wr	%l6,	0x1B89,	%set_softint
	rdhpr	%htba,	%o3
	wr	%l3,	%l4,	%pic
loop_411:
	edge16n	%i7,	%l0,	%i2
	wrpr	%g2,	0x1F10,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x74A, 	%sys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	rd	%tick_cmpr,	%l2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmpeq16	%f4,	%f2,	%g5
	rdhpr	%hpstate,	%i6
	fba	%fcc1,	loop_412
	nop
	set	0x72, %g7
	sth	%g1,	[%l7 + %g7]
	rd	%pc,	%l5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_412:
	wrpr	%i1,	0x0FF6,	%pil
	wrpr	%o1,	0x0032,	%pil
	wr	%g0,	0x88,	%asi
	sta	%f24,	[%l7 + 0x3C] %asi
	fnegd	%f20,	%f0
	rdhpr	%hpstate,	%g7
	wr	%o4,	0x10C1,	%clear_softint
	bcc	%xcc,	loop_413
	rdpr	%pil,	%o0
	set	0x78, %o2
	lduba	[%l7 + %o2] 0x10,	%g6
loop_413:
	wrpr	%o2,	%o7,	%tick
	rdhpr	%hpstate,	%l1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%ccr,	%l6
	wr	%i0,	0x15FB,	%softint
	subccc	%o3,	%l4,	%i7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%hintp,	%g2
	mova	%xcc,	%i2,	%g4
	mulx	%g3,	%i3,	%o6
	rdhpr	%hintp,	%g5
	rd	%softint,	%l2
	bvs	%xcc,	loop_414
	srax	%g1,	0x11,	%l5
	rdpr	%canrestore,	%o5
	tvc	%icc,	0x1
loop_414:
	movleu	%xcc,	%i1,	%o1
	umul	%g7,	%o4,	%o0
	rdhpr	%hpstate,	%g6
	rd	%pc,	%o2
	popc	%i6,	%l1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xBCC, 	%hsys_tick_cmpr
	srax	%o7,	%l6,	%i4
	tn	%xcc,	0x1
	tgu	%icc,	0x6
	move	%icc,	%o3,	%l4
	movcs	%icc,	%i0,	%i7
	stw	%l0,	[%l7 + 0x58]
	wrpr	%g2,	0x01C4,	%cwp
	brz,a	%l3,	loop_415
	wrpr	%g4,	0x13D9,	%cwp
	rd	%pc,	%g3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_415:
	rdhpr	%htba,	%o6
	taddcc	%g5,	0x0F90,	%i2
	bn,pt	%icc,	loop_416
	std	%f2,	[%l7 + 0x10]
	add	%g1,	0x172B,	%l5
	rd	%sys_tick_cmpr,	%o5
loop_416:
	srax	%i1,	0x09,	%o1
	rd	%asi,	%l2
	fpsub32s	%f29,	%f5,	%f21
	rdpr	%wstate,	%o4
	wr	%o0,	%g6,	%y
	and	%o2,	%i6,	%l1
	wr	%g7,	0x09AE,	%sys_tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%htba,	%l6
	rd	%ccr,	%i4
        wr    %g0,    0xe,    %pcr    ! changed.
	wr 	%g0, 	0x5, 	%fprs
	wrpr	%i5,	%i7,	%pil
	rd	%pc,	%g2
	ldsh	[%l7 + 0x52],	%l0
	fbu	%fcc3,	loop_417
	wrpr	%l3,	0x178C,	%cwp
	array16	%g4,	%i3,	%o6
	wrpr	%g5,	%i2,	%pil
loop_417:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x099, 	%hsys_tick_cmpr
	fxors	%f7,	%f18,	%f31
	membar	#Sync
	set	0x40, %l0
	ldda	[%l7 + %l0] 0xf1,	%f0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	rdhpr	%hintp,	%i1
	fmovdcs	%xcc,	%f24,	%f12
	membar	0x7A
	popc	%o1,	%l2
	wr	%o4,	0x119D,	%softint
	fmovdcs	%icc,	%f27,	%f15
	rd	%sys_tick_cmpr,	%o0
	addcc	%o5,	0x1C59,	%g6
	rdpr	%cleanwin,	%i6
	tpos	%icc,	0x7
	brgz,a	%l1,	loop_418
	wrpr	%o2,	%g7,	%tick
	rdpr	%gl,	%l6
	fbe	%fcc3,	loop_419
loop_418:
	taddcctv	%i4,	0x11FA,	%o3
	rdpr	%otherwin,	%o7
	rdhpr	%htba,	%l4
loop_419:
	fbuge	%fcc1,	loop_420
	rd	%y,	%i5
	wrpr	%i0,	0x04B1,	%pil
	rdpr	%cansave,	%i7
loop_420:
	sdivcc	%g2,	0x112B,	%l3
	andcc	%g4,	0x1A3B,	%i3
	wr	%o6,	0x054E,	%ccr
	movg	%icc,	%g5,	%i2
	wr	%g1,	%l0,	%softint
	rdhpr	%hintp,	%g3
	subcc	%i1,	%o1,	%l2
	wrpr	%o4,	0x1571,	%cwp
	movrgez	%o0,	%o5,	%g6
	movvc	%icc,	%i6,	%l1
	ta	%icc,	0x4
	wrpr	%o2,	0x1FFC,	%pil
	tg	%icc,	0x2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x977, 	%hsys_tick_cmpr
	rdpr	%cleanwin,	%l6
	wr	%g0,	0x10,	%asi
	lda	[%l7 + 0x08] %asi,	%f24
	rdhpr	%htba,	%i4
	brlez	%g7,	loop_421
	wr	%o3,	0x00E1,	%clear_softint
	fbne,a	%fcc2,	loop_422
	orcc	%l4,	0x1F31,	%o7
loop_421:
	wrpr	%i0,	0x07CD,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xDBC, 	%hsys_tick_cmpr
loop_422:
	fcmpeq32	%f4,	%f30,	%l3
	movg	%xcc,	%i7,	%i3
	wr	%g0,	0x18,	%asi
	stwa	%g4,	[%l7 + 0x40] %asi
	rdhpr	%htba,	%g5
	wr	%o6,	%g1,	%pic
	rd	%softint,	%i2
	wrpr	%l0,	0x03D8,	%cwp
	rdhpr	%hpstate,	%i1
	wrpr	%o1,	%l2,	%tick
	rdpr	%wstate,	%g3
	rdhpr	%hsys_tick_cmpr,	%o0
	rdhpr	%hsys_tick_cmpr,	%o5
	udivx	%o4,	0x01FC,	%i6
	rdpr	%tl,	%g6
	fcmple16	%f14,	%f6,	%l1
	rdpr	%wstate,	%o2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x890, 	%sys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%hsys_tick_cmpr,	%o3
	fandnot1	%f24,	%f12,	%f30

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	wrpr	%g7,	0x0FF7,	%pil
	rd	%sys_tick_cmpr,	%o7
	fnor	%f24,	%f28,	%f30

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	srax	%g2,	%l3,	%i5
	brnz,a	%i7,	loop_423
	edge8n	%g4,	%g5,	%o6
	wrpr	%i3,	%i2,	%pil
	swap	[%l7 + 0x18],	%g1
loop_423:
	rd	%asi,	%i1
	or	%o1,	0x0139,	%l0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xFB6, 	%hsys_tick_cmpr
	edge16l	%o0,	%o4,	%o5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%softint,	%l1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xE7F, 	%hsys_tick_cmpr
	subc	%i4,	0x07FE,	%o3
	sll	%l4,	%l6,	%o7
	flush	%l7 + 0x0C
	movvc	%icc,	%g7,	%g2
	wr	%i0,	0x0ED2,	%clear_softint

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	tl	%icc,	0x2
	set	0x17, %o4
	lduba	[%l7 + %o4] 0x04,	%l3
	movre	%g4,	0x14C,	%g5
	fpadd32s	%f23,	%f17,	%f24
	edge32l	%i3,	%i2,	%o6
	wrpr	%g1,	0x027F,	%tick
	fmovs	%f8,	%f22
	bgu,a,pt	%xcc,	loop_424
	movrne	%i1,	%o1,	%g3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x9DB, 	%hsys_tick_cmpr
loop_424:
	rdpr	%canrestore,	%o4
	rdhpr	%hintp,	%o5
	wr	%g0,	0x89,	%asi
	prefetcha	[%l7 + 0x18] %asi,	 0x1
	rd	%asi,	%l1
	te	%xcc,	0x2
	rd	%softint,	%i6
	movneg	%icc,	%l5,	%o2
	rdpr	%cleanwin,	%o3
	rdhpr	%hpstate,	%l4
	wrpr	%i4,	0x0FCE,	%tick
	edge16n	%l6,	%o7,	%g2
	alignaddrl	%i0,	%i5,	%i7
	rdhpr	%htba,	%g7
	rdhpr	%hpstate,	%l3
	rdhpr	%hpstate,	%g5
	rd	%y,	%g4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	wr	%g0,	0x18,	%asi
	lda	[%l7 + 0x10] %asi,	%f12
	alignaddr	%i2,	%o6,	%g1
	sdivx	%o1,	0x1167,	%i1
	rdhpr	%hpstate,	%l0
	wrpr	%o0,	0x07B0,	%pil
	rd	%ccr,	%g3
	rdhpr	%hintp,	%o4
	rd	%softint,	%l2
	rdpr	%wstate,	%g6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xDD8, 	%hsys_tick_cmpr
	rdhpr	%hpstate,	%l1
	stw	%i6,	[%l7 + 0x1C]
	rdpr	%otherwin,	%o2
	rd	%pc,	%o3
	wr	%l5,	0x08FC,	%set_softint
	movcs	%xcc,	%l4,	%l6
	brgz,a	%i4,	loop_425
	fba	%fcc0,	loop_426
	and	%o7,	0x0D92,	%g2
	movrgz	%i5,	0x3C6,	%i0
loop_425:
	wrpr	%g7,	0x1A73,	%tick
loop_426:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x303, 	%sys_tick_cmpr
	rd	%softint,	%i7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%i2,	0x08C0,	%cwp
	tg	%xcc,	0x7
	alignaddr	%o6,	%g1,	%i1
	rdpr	%cleanwin,	%l0
	wrpr	%o0,	%o1,	%cwp
	rdpr	%tba,	%g3
	rdpr	%tl,	%o4
	edge32ln	%l2,	%o5,	%g6
	rd	%tick_cmpr,	%i6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x181, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	andn	%l5,	%l4,	%l6
	andcc	%o3,	0x1EB6,	%i4
	fblg	%fcc3,	loop_427
	rdpr	%cwp,	%o7
	rdhpr	%hpstate,	%i5
	rd	%sys_tick_cmpr,	%g2
loop_427:
	rdpr	%cleanwin,	%g7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	wr	%i7,	%i3,	%softint
	set	0x1C, %o0
	lduwa	[%l7 + %o0] 0x0c,	%i0
	rdhpr	%htba,	%i2
	rd	%softint,	%g4
	tneg	%xcc,	0x0
	wr	%g0,	0x18,	%asi
	ldstuba	[%l7 + 0x4E] %asi,	%o6
	fnegs	%f7,	%f12
	fexpand	%f27,	%f10

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xC01, 	%sys_tick_cmpr
	wr	%o0,	%o1,	%clear_softint
	fbule,a	%fcc1,	loop_428
	rdpr	%canrestore,	%i1
	addcc	%g3,	0x0662,	%o4
	move	%icc,	%l2,	%g6
loop_428:
	umulcc	%i6,	%o5,	%l1
	wr	%g0,	0x11,	%asi
	lda	[%l7 + 0x54] %asi,	%f1
	rdhpr	%htba,	%o2
	rdpr	%wstate,	%l5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x4AF, 	%sys_tick_cmpr
	andcc	%o3,	%l6,	%o7
	subcc	%i5,	0x0108,	%g2
	wrpr	%g7,	%l3,	%cwp
	edge8n	%i4,	%i7,	%g5
	rd	%softint,	%i3
	fnot2	%f0,	%f26
	wrpr	%i2,	0x0B29,	%pil
	fnot2s	%f3,	%f20
	movre	%g4,	%o6,	%i0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%tba,	%o0
	tsubcctv	%o1,	0x1FA3,	%i1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	fmovsge	%xcc,	%f11,	%f16
	rdpr	%gl,	%l2
	fpsub16	%f12,	%f8,	%f4
        wr    %g0,    0xe,    %pcr    ! changed.
	ble,a,pn	%icc,	loop_429
	rdhpr	%hpstate,	%i6
	rdpr	%cwp,	%o5
	rd	%tick_cmpr,	%l1
loop_429:
	wrpr	%o2,	%l5,	%tick
	fsrc2	%f8,	%f28
	brgez,a	%l4,	loop_430
	movg	%icc,	%o4,	%o3
	fexpand	%f11,	%f26
	bshuffle	%f14,	%f6,	%f30
loop_430:
	tleu	%xcc,	0x6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fbuge	%fcc3,	loop_431
	tl	%icc,	0x0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x355, 	%hsys_tick_cmpr
	rdhpr	%hintp,	%g7
loop_431:
	rdpr	%cwp,	%i4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x9A3, 	%hsys_tick_cmpr
	rd	%asi,	%g5
	bn,a,pn	%xcc,	loop_432
	rd	%tick_cmpr,	%i3
	wrpr	%i2,	%i7,	%tick
	bvc	loop_433
loop_432:
	rdhpr	%hsys_tick_cmpr,	%o6
	movre	%g4,	%i0,	%o0
	alignaddr	%o1,	%l0,	%g1
loop_433:
	ta	%xcc,	0x6
	andn	%g3,	%l2,	%i1
	wr	%g6,	0x0AEF,	%ccr
	fsrc2	%f24,	%f20
	wrpr	%o5,	%i6,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%htba,	%l5
	movvc	%xcc,	%l4,	%o4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x34D, 	%sys_tick_cmpr
	rdhpr	%hsys_tick_cmpr,	%l6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x3F4, 	%hsys_tick_cmpr
	rdhpr	%hpstate,	%o7
	edge16ln	%g7,	%i4,	%l3
	fmovrde	%g5,	%f2,	%f26
	rdhpr	%hintp,	%i3
	fbuge	%fcc1,	loop_434
	wr	%i5,	%i2,	%set_softint
	edge8ln	%i7,	%o6,	%i0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x7C2, 	%hsys_tick_cmpr
loop_434:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x31C, 	%hsys_tick_cmpr
	rdpr	%cwp,	%o1
	edge8	%g3,	%g1,	%i1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xF6C, 	%hsys_tick_cmpr
	rd	%y,	%o5
	tne	%icc,	0x3
	wr	%g0,	0x80,	%asi
	prefetcha	[%l7 + 0x28] %asi,	 0x2
	fmovspos	%icc,	%f8,	%f26

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x074, 	%hsys_tick_cmpr
	rdhpr	%htba,	%i6
	wr	%o4,	%l4,	%y
	rd	%tick_cmpr,	%o2
	rdpr	%otherwin,	%l6
	bl,a,pt	%xcc,	loop_435
	edge16n	%g2,	%o7,	%o3
	fbule	%fcc3,	loop_436
	movre	%i4,	0x0A8,	%l3
loop_435:
	rdpr	%tl,	%g5
	rd	%ccr,	%i3
loop_436:
	wrpr	%g7,	%i5,	%tick
	wrpr	%i7,	0x0272,	%pil
	fnands	%f13,	%f28,	%f25
	movleu	%xcc,	%i2,	%i0
	addccc	%g4,	0x156C,	%o0
	rd	%sys_tick_cmpr,	%l0
	rdhpr	%hsys_tick_cmpr,	%o1
	rdpr	%cleanwin,	%o6
	or	%g3,	0x1268,	%g1
	wr	%i1,	0x07E0,	%softint
	siam	0x3
	set	0x18, %g1
	swapa	[%l7 + %g1] 0x18,	%g6
	rd	%fprs,	%o5
	alignaddrl	%l2,	%l1,	%i6
	wrpr	%l5,	0x078D,	%cwp
	rdpr	%otherwin,	%o4
	rd	%pc,	%l4
	wrpr	%o2,	%g2,	%cwp
	rdhpr	%htba,	%o7
	tsubcctv	%o3,	%l6,	%l3
	swap	[%l7 + 0x74],	%i4
	orncc	%i3,	%g5,	%i5
	tle	%xcc,	0x5
	rdpr	%gl,	%g7
	rdpr	%otherwin,	%i2
	array16	%i0,	%i7,	%o0
	rdhpr	%hintp,	%g4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xFE2, 	%hsys_tick_cmpr
	wrpr	%l0,	%o6,	%tick
	nop
	set	0x20, %i6
	stw	%g3,	[%l7 + %i6]

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	mulscc	%g1,	%o5,	%l1
	tvc	%xcc,	0x5
	subccc	%l2,	0x1CA3,	%i6
	rdhpr	%hintp,	%l5
	rdhpr	%hintp,	%o4
	rdpr	%cansave,	%l4
	rd	%asi,	%g2
	rdhpr	%hintp,	%o7
	fmovdneg	%icc,	%f28,	%f2
	fmovdl	%icc,	%f11,	%f5
	wrpr	%o2,	%l6,	%cwp
	rdpr	%pil,	%l3
	fmovsl	%icc,	%f15,	%f1
	rdhpr	%hintp,	%o3
	brz	%i3,	loop_437
	rdpr	%wstate,	%g5
	bcs,a,pt	%icc,	loop_438
	fmovsneg	%icc,	%f4,	%f29
loop_437:
	rdhpr	%hsys_tick_cmpr,	%i5
	alignaddr	%i4,	%g7,	%i2
loop_438:
	wrpr	%i7,	%o0,	%pil
	rdhpr	%hpstate,	%g4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%g0,	0x88,	%asi
	lduha	[%l7 + 0x0E] %asi,	%l0
	fmovdle	%icc,	%f16,	%f9
	wr	%g0,	0x0c,	%asi
	ldda	[%l7 + 0x10] %asi,	%g2
	wrpr	%i1,	%o6,	%tick
	subc	%g6,	0x043B,	%g1
	prefetch	[%l7 + 0x6C],	 0x1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x529, 	%sys_tick_cmpr
	udiv	%i6,	0x009B,	%l2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x5F7, 	%hsys_tick_cmpr
	faligndata	%f16,	%f22,	%f30
	movre	%l4,	%g2,	%o7
	wrpr	%l6,	0x14AE,	%tick
	wrpr	%l3,	%o2,	%pil
	set	0x55, %i1
	ldsba	[%l7 + %i1] 0x18,	%i3
	fornot1s	%f30,	%f30,	%f26
	stx	%g5,	[%l7 + 0x48]
	stx	%o3,	[%l7 + 0x48]

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fcmpne16	%f24,	%f12,	%g7
	rdpr	%wstate,	%i2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnot1s	%f3,	%f17
	wrpr	%o0,	0x0517,	%tick
	fcmps	%fcc0,	%f22,	%f23
	rd	%tick_cmpr,	%i7
	ble,a	%icc,	loop_439
	rdpr	%pil,	%i0
	wrpr	%o1,	0x0965,	%cwp
	array16	%l0,	%g4,	%i1
loop_439:
	edge8ln	%g3,	%o6,	%g6
	ble,pt	%icc,	loop_440
	rd	%asi,	%g1
	te	%xcc,	0x3
	array32	%l1,	%o5,	%l2
loop_440:
	movneg	%icc,	%o4,	%i6
        wr    %g0,    0xe,    %pcr    ! changed.
	wr	%o7,	0x125D,	%sys_tick
	fmovse	%xcc,	%f18,	%f14
	wr	%g0,	0x88,	%asi
	lduha	[%l7 + 0x6E] %asi,	%l6
	fornot2	%f4,	%f16,	%f10
	fxnors	%f13,	%f6,	%f18
	brlez,a	%g2,	loop_441
	srlx	%l3,	0x00,	%o2
	edge32l	%g5,	%i3,	%i4
	andncc	%i5,	%g7,	%o3
loop_441:
	brz,a	%o0,	loop_442
	taddcctv	%i7,	0x095D,	%i2
	fmul8x16	%f1,	%f0,	%f22

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_442:
	rdhpr	%hpstate,	%l0
	xorcc	%g4,	%i1,	%g3
	rdpr	%cleanwin,	%o6
	movrne	%g6,	%o1,	%l1
	wrpr	%g1,	%o5,	%cwp
	rd	%pc,	%o4
	subcc	%l2,	%l4,	%i6
	orncc	%l5,	0x12E9,	%l6
	rd	%asi,	%o7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xA1E, 	%hsys_tick_cmpr
	tgu	%icc,	0x5
	move	%xcc,	%o2,	%g5
        wr    %g0,    0xe,    %pcr    ! changed.
	xnor	%i4,	0x0143,	%i5
	rdpr	%cwp,	%l3
	edge16ln	%o3,	%o0,	%g7
	rdhpr	%htba,	%i7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	fmovrdlez	%i2,	%f28,	%f26
	rdhpr	%htba,	%g4
	orncc	%l0,	%g3,	%i1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	ldd	[%l7 + 0x30],	%f10

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xE2E, 	%hsys_tick_cmpr
	fpadd16	%f14,	%f8,	%f2
	fpadd16	%f2,	%f14,	%f12
	rdhpr	%hintp,	%o1
	rdpr	%cleanwin,	%l1
	fbne	%fcc0,	loop_443
	rdpr	%pil,	%o5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x079, 	%hsys_tick_cmpr
	rdpr	%pil,	%l4
loop_443:
	bneg,a	loop_444
	rd	%softint,	%i6
	wr 	%g0, 	0x6, 	%fprs
	rdpr	%wstate,	%o7
loop_444:
	wrpr	%l5,	0x1B93,	%pil
	movpos	%xcc,	%o2,	%g5
	wrpr	%i3,	%g2,	%cwp
	rd	%ccr,	%i5
	rdpr	%cleanwin,	%l3
	rd	%fprs,	%o3
	wr	%i4,	0x14CB,	%sys_tick
	fmovsn	%icc,	%f4,	%f1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xD74, 	%hsys_tick_cmpr
	wrpr	%i7,	%g7,	%tick
	wrpr	%i0,	0x0629,	%pil
	orn	%g4,	%l0,	%g3
	wrpr	%i2,	%i1,	%cwp
	rdpr	%tl,	%o6
	set	0x68, %g6
	swapa	[%l7 + %g6] 0x81,	%g6
	movrne	%l1,	%o1,	%o5
        wr    %g0,    0xe,    %pcr    ! changed.
	wr	%l4,	0x043F,	%clear_softint
	addc	%g1,	0x0C40,	%i6
	rdpr	%cansave,	%o7
	rdhpr	%htba,	%l5
	rdpr	%cwp,	%o2
	udivx	%g5,	0x1F81,	%l6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xC3A, 	%sys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%hsys_tick_cmpr,	%i4
	wrpr	%o3,	0x03B0,	%pil
	fcmple16	%f12,	%f16,	%i7
	wrpr	%o0,	0x19AE,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xA75, 	%hsys_tick_cmpr
	movneg	%xcc,	%g4,	%g3
	andncc	%i2,	%i1,	%o6
	fbu	%fcc0,	loop_445
	rdhpr	%hsys_tick_cmpr,	%l0
	addccc	%l1,	0x0D75,	%o1
	wrpr	%o5,	0x1069,	%pil
loop_445:
	fbne	%fcc2,	loop_446
	rd	%asi,	%g6
	wr	%o4,	%l4,	%clear_softint
	rdhpr	%htba,	%l2
loop_446:
	rdhpr	%hpstate,	%i6
	rd	%y,	%g1
	rdhpr	%hpstate,	%o7
	rdpr	%wstate,	%l5
	movrgez	%g5,	0x394,	%l6
	rdhpr	%hpstate,	%g2
	set	0x10, %i3
	ldda	[%l7 + %i3] 0xeb,	%o2
	rd	%fprs,	%i3
	rdhpr	%hsys_tick_cmpr,	%l3
	and	%i4,	0x1248,	%i5
	fmovspos	%xcc,	%f27,	%f10
	rdhpr	%hsys_tick_cmpr,	%o3
	rdhpr	%htba,	%i7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%fprs,	%g7
	rdpr	%canrestore,	%g4
	ldsb	[%l7 + 0x0C],	%g3
	nop
	set	0x40, %l5
	std	%i0,	[%l7 + %l5]
	rd	%tick_cmpr,	%o6
	fone	%f8
	tneg	%icc,	0x5
	rd	%sys_tick_cmpr,	%i2
	edge32n	%l1,	%o1,	%o5
	fbue,a	%fcc3,	loop_447
	rdpr	%cwp,	%l0
	fmovspos	%xcc,	%f23,	%f1
	wrpr	%g6,	%l4,	%pil
loop_447:
	rdpr	%otherwin,	%l2
	wr	%g0,	0x88,	%asi
	ldsba	[%l7 + 0x26] %asi,	%i6
	set	0x40, %i4
	ldda	[%l7 + %i4] 0xdb,	%f0
	andcc	%g1,	0x188B,	%o7
	wrpr	%o4,	0x17A7,	%tick
	tvs	%icc,	0x3
	fsrc1	%f16,	%f24
	wr	%g5,	0x00DD,	%sys_tick
	lduh	[%l7 + 0x52],	%l6
	wrpr	%g2,	%l5,	%tick
	rdhpr	%hpstate,	%i3
	addc	%l3,	%i4,	%i5
	rd	%pc,	%o3
	array16	%o2,	%i7,	%i0
	xnorcc	%g7,	0x1AB0,	%o0
	rdhpr	%hpstate,	%g4
	rdhpr	%hpstate,	%g3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fbge,a	%fcc3,	loop_448
	wrpr	%i2,	0x1847,	%tick
	wr	%l1,	0x03BC,	%set_softint
	wr	%o6,	%o1,	%clear_softint
loop_448:
	stw	%l0,	[%l7 + 0x5C]
	addc	%o5,	%l4,	%l2
	umul	%i6,	0x0F24,	%g6
	rdpr	%gl,	%o7
	movrlez	%g1,	%g5,	%l6
	rdhpr	%hintp,	%o4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	edge8ln	%g2,	%i3,	%l3
	bg	loop_449
	ldd	[%l7 + 0x30],	%i4
	rdhpr	%hsys_tick_cmpr,	%i5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xE73, 	%hsys_tick_cmpr
loop_449:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%g7,	%g4,	%clear_softint
	rdhpr	%hpstate,	%g3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	rdhpr	%hintp,	%i2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	movrgz	%l0,	0x366,	%o5
	tsubcctv	%o1,	0x0A74,	%l4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x22C, 	%hsys_tick_cmpr
	edge16	%g6,	%o7,	%l2
	fbg	%fcc1,	loop_450
	fbo,a	%fcc1,	loop_451
	edge8	%g5,	%g1,	%o4
	sllx	%l6,	0x04,	%l5
loop_450:
	rdhpr	%hsys_tick_cmpr,	%g2
loop_451:
	addc	%l3,	0x0B28,	%i3
	rd	%pc,	%i5
	rdpr	%cwp,	%o3
	xnor	%o2,	0x1513,	%i4
	rdhpr	%htba,	%i7
	rd	%softint,	%g7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	movrgez	%i0,	0x208,	%o0
	wrpr	%i1,	%i2,	%pil
        wr    %g0,    0xe,    %pcr    ! changed.
	rd	%pc,	%l0
	wr	%o5,	%o6,	%softint
	rd	%sys_tick_cmpr,	%l4
	rdpr	%wstate,	%i6
	wr	%o1,	0x04CD,	%sys_tick
	xorcc	%o7,	%l2,	%g5
	fpsub32s	%f1,	%f25,	%f5
	rd	%softint,	%g6
	wr	%o4,	0x0A44,	%softint
	brgz,a	%g1,	loop_452
	wrpr	%l5,	%l6,	%tick
	tvs	%icc,	0x7
	edge16n	%l3,	%i3,	%i5
loop_452:
	tleu	%icc,	0x3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	movrne	%g2,	0x24D,	%o2
	rd	%asi,	%i7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x19C, 	%hsys_tick_cmpr
	rd	%ccr,	%g3
	popc	%i0,	%o0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xEDC, 	%tick_cmpr
	wr	%l1,	0x1920,	%clear_softint
	tpos	%icc,	0x7
	wrpr	%i2,	%l0,	%pil
	rd	%pc,	%o6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xFE1, 	%hsys_tick_cmpr
	fxor	%f8,	%f22,	%f22
	mulx	%o1,	0x0098,	%o7
	ldstub	[%l7 + 0x1B],	%i6
	fmovrsne	%l2,	%f19,	%f4
	fmovrdgz	%g6,	%f22,	%f8
	sll	%o4,	%g1,	%g5
	fmovsle	%icc,	%f24,	%f15
	fmovrdlez	%l5,	%f26,	%f2
	movrlz	%l3,	%i3,	%i5
	popc	%o3,	%l6
	movrgez	%o2,	%i7,	%g2
	rd	%pc,	%g7
	call	loop_453
        wr    %g0,    0xe,    %pcr    ! changed.
	wrpr	%i0,	%o0,	%tick
	wr	%g0,	0x11,	%asi
	sta	%f20,	[%l7 + 0x0C] %asi
loop_453:
	alignaddr	%i4,	%g4,	%i1
	wr	%g0,	0x89,	%asi
	lduba	[%l7 + 0x67] %asi,	%l1
	rd	%asi,	%l0
	fmovde	%xcc,	%f24,	%f22
	tn	%icc,	0x0
	rd	%asi,	%o6
	sra	%l4,	%o5,	%o1
	tvc	%xcc,	0x7
	wr	%g0,	0x11,	%asi
	lduba	[%l7 + 0x48] %asi,	%i2
	rdpr	%cwp,	%i6
	tvc	%icc,	0x1
	rdpr	%cleanwin,	%o7
	fbug	%fcc3,	loop_454
	rdpr	%pil,	%l2
	sub	%o4,	0x1348,	%g6
	rdhpr	%htba,	%g1
loop_454:
	wr	%g5,	%l5,	%clear_softint
	edge32	%l3,	%i3,	%i5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x11E, 	%hsys_tick_cmpr
	fnot1	%f28,	%f26
	movn	%icc,	%i7,	%l6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	movge	%icc,	%g2,	%i0
	fpadd16s	%f7,	%f27,	%f12
	rd	%y,	%o0
	rd	%pc,	%g4
	rd	%sys_tick_cmpr,	%i4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	orncc	%i1,	%l4,	%o6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%tl,	%i2
	alignaddrl	%o1,	%o7,	%i6
	wr	%g0,	0xe3,	%asi
	stwa	%o4,	[%l7 + 0x30] %asi
	membar	#Sync
	ldsw	[%l7 + 0x0C],	%g6
	wrpr	%l2,	0x15AD,	%pil
	sir	0x1416
	sdiv	%g5,	0x1EA6,	%g1
	fmovdle	%icc,	%f5,	%f0
	andn	%l3,	%l5,	%i5
	or	%o3,	%o2,	%i3
	movvc	%icc,	%i7,	%g7
	lduh	[%l7 + 0x08],	%l6
	wr 	%g0, 	0x6, 	%fprs
	wr	%i0,	0x1812,	%softint
	fbug	%fcc0,	loop_455
	rdpr	%cwp,	%o0
	wrpr	%g4,	0x01DD,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xF2D, 	%hsys_tick_cmpr
loop_455:
	alignaddrl	%l1,	%l0,	%l4
	fmovsn	%xcc,	%f13,	%f2
	wr	%g0,	0x0c,	%asi
	ldda	[%l7 + 0x10] %asi,	%o6
	te	%icc,	0x1
	fmovda	%icc,	%f1,	%f4
	rdhpr	%hsys_tick_cmpr,	%o5
	bgu	%xcc,	loop_456
	rd	%pc,	%i2
	wr 	%g0, 	0x6, 	%fprs
	rd	%sys_tick_cmpr,	%i1
loop_456:
	fmovda	%icc,	%f28,	%f27
	set	0x40, %i2
	stxa	%o4,	[%l7 + %i2] 0x11
	ldub	[%l7 + 0x44],	%g6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fxnors	%f18,	%f28,	%f14
	wr	%i6,	0x1059,	%softint
	wr	%l2,	%g1,	%softint
	rdpr	%pil,	%l3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x3EA, 	%hsys_tick_cmpr
	wr	%i5,	%o3,	%set_softint
	fmovdl	%xcc,	%f22,	%f3
	rdpr	%cwp,	%l5
	rdpr	%otherwin,	%o2
	wr	%i3,	0x0E01,	%set_softint
	edge8	%g7,	%l6,	%g2
	rdhpr	%hsys_tick_cmpr,	%g3
	wrpr	%i0,	%i7,	%tick
	te	%icc,	0x6
	umul	%g4,	%i4,	%o0
	rdhpr	%hpstate,	%l1
	rdhpr	%hpstate,	%l0
	tg	%xcc,	0x1
	edge8ln	%o6,	%l4,	%i2
	wrpr	%o5,	0x1E13,	%tick
	movge	%icc,	%o1,	%o7
	movvc	%icc,	%o4,	%g6
	wrpr	%i1,	0x110A,	%tick
	wrpr	%i6,	%g1,	%pil
	rdpr	%tba,	%l3
	sethi	0x1299,	%g5
	edge16ln	%i5,	%o3,	%l2
	rdhpr	%hintp,	%o2
	rdhpr	%htba,	%i3
	sub	%g7,	0x122D,	%l6
	wr 	%g0, 	0x5, 	%fprs
	fbe,a	%fcc2,	loop_457
	movgu	%xcc,	%g2,	%i0
	wrpr	%g4,	0x18E1,	%pil
	rdhpr	%hintp,	%i4
loop_457:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fmovda	%xcc,	%f30,	%f23
	nop
	set	0x0E, %l2
	lduh	[%l7 + %l2],	%l1
	rdhpr	%hsys_tick_cmpr,	%i7
	rdhpr	%hintp,	%l0
	rd	%asi,	%l4
	rd	%y,	%i2
	rdhpr	%htba,	%o6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xDC9, 	%hsys_tick_cmpr
	fmovdge	%xcc,	%f7,	%f16
	movrne	%o7,	0x398,	%o5
	wr	%g6,	%i1,	%sys_tick
	wr	%o4,	%i6,	%clear_softint
	wr 	%g0, 	0x4, 	%fprs
	wr	%g5,	%l3,	%set_softint
        wr    %g0,    0xe,    %pcr    ! changed.
	fmovsge	%icc,	%f5,	%f22

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xC4A, 	%hsys_tick_cmpr
	tvc	%xcc,	0x3
	rdhpr	%hpstate,	%o2
	wr	%i3,	%g7,	%clear_softint
	tle	%icc,	0x1
	smul	%l6,	%l5,	%g3
	rdhpr	%htba,	%g2
	rdhpr	%htba,	%i0
	fmovdn	%icc,	%f6,	%f17

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xCF9, 	%hsys_tick_cmpr
	rdhpr	%hpstate,	%i4
	wrpr	%o0,	0x1AE0,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	edge32ln	%l0,	%l1,	%l4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	rd	%fprs,	%i2
	wr	%o7,	0x1C8A,	%ccr
	movrgz	%o5,	%g6,	%o1
	udivcc	%i1,	0x151A,	%o4
	fbn,a	%fcc2,	loop_458
	umul	%i6,	%g5,	%g1
	movcc	%icc,	%l3,	%i5
	udivcc	%l2,	0x109C,	%o2
loop_458:
	wrpr	%i3,	%o3,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x1A8, 	%hsys_tick_cmpr
	nop
	set	0x2C, %l3
	prefetch	[%l7 + %l3],	 0x1
	tl	%xcc,	0x7
	bvs,a,pt	%xcc,	loop_459
	movre	%l5,	0x3A8,	%g2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	tneg	%icc,	0x3
loop_459:
	rdpr	%gl,	%g4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	tneg	%xcc,	0x3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	sdivx	%l1,	0x0511,	%l4
	bl,a	%icc,	loop_460
	rd	%y,	%o6
	wr	%i2,	0x0CCA,	%softint
	srl	%o7,	%o5,	%l0
loop_460:
	fmul8x16	%f26,	%f18,	%f6
	wr	%g6,	%i1,	%pic
        wr    %g0,    0xe,    %pcr    ! changed.
	wrpr	%o1,	0x0301,	%tick
	edge8ln	%g5,	%g1,	%l3
	rdhpr	%htba,	%l2
	fands	%f31,	%f16,	%f17
	set	0x08, %g4
	stha	%i5,	[%l7 + %g4] 0x19
	subcc	%o2,	%o3,	%i3
	wrpr	%g7,	0x0BA5,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	orn	%g2,	%i0,	%l5
	wr	%g3,	0x17CA,	%ccr
	wrpr	%o0,	%i7,	%pil
	array16	%g4,	%l1,	%i4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x091, 	%tick_cmpr
	wr	%o7,	0x0E58,	%sys_tick
	edge8n	%o6,	%o5,	%g6
	add	%l7,	0x70,	%l6
	wr	%g0,	0x0c,	%asi
	lda	[%l6] %asi,	%i1
	casa	[%l6] 0x0c,	%i1,	%o4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr 	%g0, 	0x5, 	%fprs
	wr 	%g0, 	0x7, 	%fprs
	movneg	%icc,	%g1,	%l2
	orn	%l3,	%i5,	%o2
	rd	%pc,	%o3
	wrpr	%g7,	0x04F5,	%cwp
	tsubcctv	%l6,	%i3,	%g2
	wrpr	%i0,	0x0954,	%cwp
	rd	%y,	%g3
	wrpr	%o0,	0x0BB4,	%pil
	tvc	%xcc,	0x2
	rdpr	%cleanwin,	%i7
	rdpr	%canrestore,	%l5
	edge32ln	%l1,	%i4,	%g4
	array8	%i2,	%o7,	%o6
	ld	[%l7 + 0x28],	%f4
	rdhpr	%hsys_tick_cmpr,	%o5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x08F, 	%hsys_tick_cmpr
	wrpr	%i1,	0x161F,	%pil
	rd	%sys_tick_cmpr,	%g6
	rdhpr	%hintp,	%o4
	rdhpr	%hintp,	%i6
	srl	%g5,	%o1,	%g1
	rdhpr	%hsys_tick_cmpr,	%l2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x8C1, 	%hsys_tick_cmpr
	membar	0x5B
	fmovdcs	%xcc,	%f6,	%f26
	rd	%tick_cmpr,	%l3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fmovrdlez	%i5,	%f10,	%f12
	rd	%tick_cmpr,	%o3
	rd	%y,	%l6
	addccc	%g7,	0x0C7A,	%g2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	std	%f6,	[%l7 + 0x60]
	rdpr	%tl,	%g3
	bgu,a,pn	%xcc,	loop_461
	wrpr	%o0,	0x1B57,	%pil
	xorcc	%i3,	%l5,	%l1
	rdpr	%cleanwin,	%i4
loop_461:
	wr	%i7,	%g4,	%softint
	orcc	%o7,	0x1205,	%i2
	rd	%pc,	%o5
	xnorcc	%l4,	0x155A,	%o6
	fmovsleu	%icc,	%f13,	%f27
	rdpr	%cwp,	%i1
	rdpr	%gl,	%o4
	rdpr	%wstate,	%i6
	mulscc	%g5,	%g6,	%o1
	wrpr	%l2,	%g1,	%tick
	sub	%l0,	%o2,	%i5
	stbar

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
        wr    %g0,    0xe,    %pcr    ! changed.
	fmovscc	%icc,	%f19,	%f23
	rdpr	%wstate,	%g2
	addccc	%l3,	0x0CFA,	%g3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xF49, 	%hsys_tick_cmpr
	rdhpr	%hpstate,	%o0
	rdhpr	%htba,	%l5
	rdpr	%cwp,	%i3
	fcmped	%fcc3,	%f28,	%f8
	wr	%i4,	%l1,	%y
	sll	%i7,	0x0E,	%g4
	rdhpr	%hintp,	%o7
	rd	%sys_tick_cmpr,	%i2
	add	%o5,	0x059B,	%l4
	rd	%ccr,	%i1
	tcs	%icc,	0x1
	rdpr	%cwp,	%o6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	or	%o4,	%g5,	%o1
	wr	%g6,	0x08BB,	%clear_softint
	rdpr	%tl,	%l2
	rd	%fprs,	%l0
	sir	0x126B
	mova	%icc,	%o2,	%g1
	fsrc1s	%f16,	%f2
	wr	%g0,	0x80,	%asi
	ldsba	[%l7 + 0x56] %asi,	%o3
	movrgez	%l6,	0x2C5,	%i5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x457, 	%hsys_tick_cmpr
	rdpr	%tl,	%l3
	fmovdcs	%xcc,	%f8,	%f7
	tneg	%xcc,	0x5
	edge16ln	%g3,	%g2,	%i0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xE1B, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	taddcctv	%i3,	0x1ADB,	%i7
	srl	%o7,	0x00,	%i2
	subcc	%g4,	0x0E48,	%o5
	rdhpr	%hsys_tick_cmpr,	%i1
	fornot2s	%f5,	%f31,	%f20
	movre	%o6,	%i6,	%o4
	swap	[%l7 + 0x70],	%g5
	fmovrslez	%o1,	%f25,	%f31
	rdpr	%cwp,	%l4
	edge32l	%l2,	%l0,	%g6
	movrgez	%g1,	%o3,	%o2
	wr 	%g0, 	0x6, 	%fprs
	tle	%xcc,	0x7
	orcc	%l6,	%g3,	%l3
	fpadd16s	%f14,	%f30,	%f19

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x288, 	%hsys_tick_cmpr
	movleu	%xcc,	%l5,	%i4
	rd	%y,	%l1
	stb	%i0,	[%l7 + 0x7C]
	wr	%i7,	%o7,	%clear_softint
	movrgez	%i3,	0x043,	%i2
	movg	%icc,	%g4,	%i1
	rd	%y,	%o6
	wrpr	%o5,	%i6,	%pil
	rdhpr	%hpstate,	%o4
	rd	%ccr,	%o1
	rdpr	%wstate,	%l4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	andncc	%g5,	%l0,	%g1
	rd	%pc,	%g6
	rdpr	%canrestore,	%o2
	ldsb	[%l7 + 0x34],	%o3
	rd	%softint,	%g7
	fbu,a	%fcc2,	loop_462
	movge	%xcc,	%l6,	%i5
	wr	%g0,	0x18,	%asi
	prefetcha	[%l7 + 0x20] %asi,	 0x1
loop_462:
	rd	%pc,	%g3
	rd	%tick_cmpr,	%g2
	wr	%o0,	%i4,	%set_softint
	wrpr	%l5,	%l1,	%pil
	brlez,a	%i7,	loop_463
	wr	%i0,	0x0232,	%pic
	rd	%tick_cmpr,	%o7
	tn	%icc,	0x1
loop_463:
	fxors	%f19,	%f6,	%f6
	fcmpgt16	%f20,	%f30,	%i3
	udivcc	%i2,	0x0559,	%i1
	rdpr	%gl,	%g4
	edge8n	%o5,	%i6,	%o6
	rdhpr	%hpstate,	%o1
	wr	%o4,	0x1355,	%pic
	addc	%l2,	%l4,	%l0
	rdhpr	%hsys_tick_cmpr,	%g5
	rdpr	%otherwin,	%g1
	wr	%g0,	0x19,	%asi
	lda	[%l7 + 0x40] %asi,	%f5
	tvc	%xcc,	0x0
	fmuld8ulx16	%f2,	%f21,	%f28
	rdhpr	%hsys_tick_cmpr,	%g6
	rd	%tick_cmpr,	%o3
	fbo,a	%fcc2,	loop_464
	rd	%fprs,	%g7
	fmovsvc	%icc,	%f1,	%f6
	sir	0x05BD
loop_464:
	fpadd32	%f0,	%f24,	%f30
	rd	%softint,	%l6
	wr 	%g0, 	0x6, 	%fprs
	sethi	0x0B8C,	%g3
	rdpr	%canrestore,	%g2
	movle	%icc,	%l3,	%o0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%pc,	%i7
	rdhpr	%hintp,	%l5
	wrpr	%i0,	%i3,	%cwp
	rdpr	%otherwin,	%i2
	rdhpr	%htba,	%i1
	wr	%o7,	%o5,	%sys_tick
	rd	%y,	%i6
	edge8l	%g4,	%o1,	%o6
	rdpr	%gl,	%l2
	and	%l4,	0x0F1E,	%o4
	rdhpr	%hsys_tick_cmpr,	%g5
	fmovsne	%xcc,	%f3,	%f20
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsne	%icc,	%f23,	%f4
        wr    %g0,    0xe,    %pcr    ! changed.
	rdhpr	%hsys_tick_cmpr,	%g6
	fpsub16	%f8,	%f28,	%f18
	rd	%fprs,	%g7
	rd	%sys_tick_cmpr,	%o3
	stw	%i5,	[%l7 + 0x60]
	wrpr	%l6,	0x10F8,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x48F, 	%hsys_tick_cmpr
	wrpr	%l3,	%g2,	%tick
	wr	%i4,	0x1EAE,	%softint
	tge	%icc,	0x4
	wrpr	%o0,	%i7,	%tick
	te	%icc,	0x6
	wr	%l1,	0x0EB8,	%pic
	mulx	%i0,	%l5,	%i2
	fmul8x16au	%f13,	%f21,	%f12
	wr	%i1,	%o7,	%pic
	movge	%icc,	%o5,	%i3
	nop
	setx	loop_465,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	rdhpr	%htba,	%i6
	wr	%g4,	%o6,	%clear_softint
	movleu	%xcc,	%o1,	%l4
loop_465:
	xor	%l2,	0x0DD6,	%g5
	fand	%f26,	%f18,	%f18

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x733, 	%tick_cmpr
	fbge	%fcc3,	loop_466
	rdhpr	%hsys_tick_cmpr,	%g6
	wr	%g1,	0x0DB6,	%set_softint
	wrpr	%g7,	%o3,	%tick
loop_466:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x649, 	%hsys_tick_cmpr
	wrpr	%i5,	0x192A,	%cwp
	rdpr	%pil,	%o2
	wrpr	%l3,	%g2,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	movg	%xcc,	%i4,	%o0
	fones	%f24
	rd	%y,	%i7
	rdpr	%cansave,	%i0
	brz,a	%l1,	loop_467
	rdhpr	%hintp,	%i2
	rdpr	%canrestore,	%i1
	movn	%icc,	%o7,	%l5
loop_467:
	rd	%ccr,	%i3
	wr	%i6,	0x1860,	%sys_tick
	rdhpr	%hsys_tick_cmpr,	%g4
	stx	%o6,	[%l7 + 0x30]
        wr    %g0,    0xe,    %pcr    ! changed.

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x2D9, 	%hsys_tick_cmpr
	fmovdle	%xcc,	%f25,	%f14
	rd	%softint,	%o5
	rd	%pc,	%g5
	fmuld8ulx16	%f4,	%f21,	%f0
	move	%xcc,	%o4,	%l0
	wrpr	%l2,	%g1,	%tick
	wrpr	%g6,	0x0613,	%cwp
	fblg	%fcc3,	loop_468
	rd	%sys_tick_cmpr,	%g7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%ccr,	%l6
loop_468:
	rdpr	%cansave,	%o2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xCC8, 	%hsys_tick_cmpr
        wr    %g0,    0xe,    %pcr    ! changed.
	tvs	%icc,	0x5
	rd	%ccr,	%g3
	fpadd16	%f14,	%f6,	%f2
	rdhpr	%hintp,	%o0
	rd	%fprs,	%i4
	movcs	%xcc,	%i7,	%i0
	rdpr	%otherwin,	%l1
	wrpr	%i1,	0x19AE,	%tick
	rdpr	%pil,	%o7
	wr 	%g0, 	0x5, 	%fprs
	rdpr	%gl,	%i2
	rdhpr	%hsys_tick_cmpr,	%i6
	rdpr	%cansave,	%o6
	fmovsvc	%xcc,	%f31,	%f7
	set	0x2C, %l4
	ldsba	[%l7 + %l4] 0x19,	%g4
	fbge	%fcc0,	loop_469
	wr	%l4,	%o1,	%softint
	rd	%y,	%g5
	taddcc	%o5,	0x1734,	%l0
loop_469:
	fbge,a	%fcc2,	loop_470
	wr	%l2,	%o4,	%softint

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%hpstate,	%o3
loop_470:
	array16	%l6,	%g7,	%o2
	wrpr	%g2,	0x0665,	%tick
	wrpr	%l3,	%g3,	%cwp
	movge	%icc,	%i5,	%o0
	wr	%i7,	%i4,	%pic
	rd	%tick_cmpr,	%i0
	fbg,a	%fcc0,	loop_471
	wr	%i1,	%l1,	%softint
	wrpr	%l5,	0x0297,	%tick
	rdhpr	%hintp,	%o7
loop_471:
	wrpr	%i3,	%i2,	%cwp
	sub	%o6,	0x14D6,	%g4
	wr	%i6,	0x1C9A,	%sys_tick
	add	%l7,	0x34,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%l4,	%g5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	edge32ln	%l2,	%l0,	%g1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xADF, 	%hsys_tick_cmpr
	sdiv	%g6,	0x14BC,	%l6
	xnorcc	%o2,	%g7,	%g2
	rd	%ccr,	%l3
	rd	%softint,	%g3
	rd	%ccr,	%o0
	rdhpr	%htba,	%i5
	rd	%asi,	%i4
	rd	%pc,	%i7
	wrpr	%i0,	%i1,	%tick
	rd	%fprs,	%l5
	set	0x60, %o5
	stxa	%l1,	[%l7 + %o5] 0x11
	rd	%sys_tick_cmpr,	%o7
	rdhpr	%hpstate,	%i3
	popc	%o6,	%g4
	bcc,pn	%icc,	loop_472
	fnot2s	%f15,	%f23

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	fba	%fcc0,	loop_473
loop_472:
	rd	%sys_tick_cmpr,	%l4
	brnz	%i2,	loop_474
	fcmpeq16	%f8,	%f12,	%g5
loop_473:
	fmovsleu	%xcc,	%f19,	%f11
	ldsw	[%l7 + 0x60],	%o5
loop_474:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x57A, 	%hsys_tick_cmpr
	fbug,a	%fcc2,	loop_475
	wr	%l0,	%g1,	%clear_softint
	fmovrdne	%o4,	%f4,	%f14
	movrgez	%g6,	0x33F,	%l6
loop_475:
	rd	%ccr,	%o2
	rdpr	%cleanwin,	%g7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fmovrsgez	%o3,	%f2,	%f6
        wr    %g0,    0xe,    %pcr    ! changed.
	wrpr	%i4,	0x04BC,	%cwp
	wrpr	%i7,	0x1166,	%cwp
	rdpr	%otherwin,	%i5
	rd	%sys_tick_cmpr,	%i1
	fandnot1s	%f2,	%f14,	%f26
	taddcc	%i0,	%l5,	%l1
	rd	%asi,	%o7
	tgu	%icc,	0x0
	rd	%softint,	%o6
	wrpr	%g4,	%i6,	%tick
	sll	%l4,	%i3,	%g5
	fornot2s	%f17,	%f26,	%f8
	wrpr	%i2,	%l2,	%tick
	array8	%o1,	%o5,	%l0
	flush	%l7 + 0x50
	rdpr	%otherwin,	%g1
	rd	%tick_cmpr,	%g6
	sdiv	%l6,	0x1832,	%o2
	tge	%xcc,	0x3
	addc	%g7,	%o4,	%l3
	smulcc	%g2,	%g3,	%o3
	ba,a,pt	%xcc,	loop_476
	rd	%softint,	%o0
	orncc	%i7,	0x1127,	%i4
	fmovs	%f29,	%f5
loop_476:
	rd	%tick_cmpr,	%i1
	wr	%i5,	%i0,	%set_softint
	rd	%y,	%l1
	rd	%y,	%o7
	ldub	[%l7 + 0x6E],	%l5
	movrlz	%g4,	0x028,	%i6
	xnor	%l4,	0x1B6A,	%o6
	rdhpr	%htba,	%g5
	orncc	%i3,	%i2,	%l2
	wrpr	%o1,	0x1E3D,	%pil
	edge32	%l0,	%o5,	%g1
	wrpr	%g6,	%l6,	%cwp
	edge8	%o2,	%g7,	%o4
	rdhpr	%hintp,	%l3
	mova	%icc,	%g3,	%o3
	rdhpr	%hintp,	%o0
	alignaddrl	%i7,	%g2,	%i1
	fpadd16s	%f2,	%f21,	%f9
	wr	%i5,	0x1515,	%softint
	rdhpr	%htba,	%i0
	srax	%i4,	%l1,	%l5
	fcmped	%fcc2,	%f20,	%f22

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xDEB, 	%hsys_tick_cmpr
	xnor	%o6,	%g5,	%i3
	wr	%i2,	0x02F2,	%clear_softint
	rd	%sys_tick_cmpr,	%l2
	fmovsl	%xcc,	%f14,	%f4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	smul	%l0,	0x1048,	%o5
	fandnot2s	%f15,	%f21,	%f9
	bpos,a	%xcc,	loop_477
	edge8n	%o1,	%g6,	%l6
	rdhpr	%hsys_tick_cmpr,	%g1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x0FB, 	%hsys_tick_cmpr
loop_477:
	and	%l3,	%g3,	%o4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	call	loop_478
	rdhpr	%hintp,	%o0
	rdpr	%cwp,	%g2
	alignaddrl	%i1,	%i5,	%i0
loop_478:
	tle	%xcc,	0x6
	rd	%asi,	%i4
	umul	%l5,	%g4,	%l1
	movneg	%icc,	%i6,	%o7
	rdpr	%wstate,	%o6
        wr    %g0,    0xe,    %pcr    ! changed.
	addcc	%i2,	0x04D7,	%i3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xD23, 	%hsys_tick_cmpr
	fpsub16	%f26,	%f20,	%f26
	rdhpr	%htba,	%o5
	wrpr	%o1,	0x02E9,	%cwp
	rdhpr	%hintp,	%l0
	set	0x60, %l1
	prefetcha	[%l7 + %l1] 0x14,	 0x1
	smul	%g1,	%l6,	%g7
	movcs	%xcc,	%o2,	%l3
	tne	%icc,	0x5
	for	%f16,	%f14,	%f16
	pdist	%f10,	%f4,	%f20
	movneg	%xcc,	%o4,	%g3
	ldstub	[%l7 + 0x1E],	%o3
	movcc	%icc,	%i7,	%o0
	rdhpr	%htba,	%i1
	wrpr	%g2,	%i0,	%cwp
	addccc	%i4,	0x002F,	%l5
	fmul8x16al	%f14,	%f30,	%f24
	orncc	%i5,	0x0DB3,	%l1
	umul	%i6,	%g4,	%o7
	rdpr	%otherwin,	%o6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x26A, 	%hsys_tick_cmpr
	fsrc2s	%f19,	%f18
	tg	%xcc,	0x5
	rd	%asi,	%i2
	tvs	%icc,	0x1
	fmuld8ulx16	%f7,	%f18,	%f26
	sethi	0x1F8F,	%l2
	rdhpr	%htba,	%o5
	rdpr	%otherwin,	%l4
	wrpr	%o1,	0x10E4,	%pil
	wrpr	%g6,	%g1,	%pil
	mova	%icc,	%l6,	%g7
	wrpr	%l0,	0x14BC,	%cwp
	fxnors	%f12,	%f23,	%f22

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%tick_cmpr,	%o2
	wrpr	%o4,	%g3,	%pil
	tge	%icc,	0x7
	ldd	[%l7 + 0x68],	%f2
	fornot1	%f8,	%f12,	%f28
	wrpr	%i7,	%o3,	%cwp
	rdhpr	%hsys_tick_cmpr,	%o0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	taddcctv	%g2,	0x0BFF,	%l5
	wr	%i5,	0x1421,	%ccr
	rd	%y,	%l1
	wr	%g0,	0x80,	%asi
	lduha	[%l7 + 0x24] %asi,	%i4
	te	%icc,	0x1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x634, 	%hsys_tick_cmpr
	fmul8x16	%f10,	%f20,	%f18
	sra	%i6,	0x03,	%o6
	edge32	%g5,	%i3,	%o7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%hsys_tick_cmpr,	%l4
	fmovsleu	%icc,	%f1,	%f12
	edge8	%o5,	%o1,	%g6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xBDA, 	%hsys_tick_cmpr
	wrpr	%g1,	%l0,	%cwp
	rdpr	%wstate,	%o2
	edge32	%l3,	%g3,	%i7
	fbue	%fcc2,	loop_479
	rd	%asi,	%o3
	wrpr	%o4,	0x08EF,	%pil
	wrpr	%o0,	0x1623,	%tick
loop_479:
	rd	%tick_cmpr,	%i0
	wr	%g2,	0x09B5,	%softint
	prefetch	[%l7 + 0x38],	 0x0
	array32	%l5,	%i5,	%l1
	rdhpr	%hsys_tick_cmpr,	%i1
	movrgz	%i4,	0x0BC,	%i6
	rd	%pc,	%g4
        wr    %g0,    0xe,    %pcr    ! changed.
	edge16l	%o6,	%i3,	%o7
	fmovscc	%xcc,	%f31,	%f29
	fnot2s	%f20,	%f19
	udivx	%l2,	0x195C,	%i2
	rdpr	%wstate,	%l4
	ldd	[%l7 + 0x50],	%o4
	rd	%asi,	%o1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x390, 	%hsys_tick_cmpr
	addcc	%g1,	0x15DA,	%g6
	wrpr	%l0,	%o2,	%cwp
	rd	%sys_tick_cmpr,	%g3
        wr    %g0,    0xe,    %pcr    ! changed.
	rdpr	%cansave,	%o4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	fmovrdgz	%o0,	%f16,	%f0
	rdpr	%tba,	%i0
	movg	%icc,	%l5,	%g2
	movl	%icc,	%i5,	%i1
	fmovdcc	%icc,	%f17,	%f14
	wr	%g0,	0x04,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	rd	%sys_tick_cmpr,	%i4
	rd	%fprs,	%i6
	ta	%icc,	0x1
	prefetch	[%l7 + 0x64],	 0x1
	movrne	%g4,	%l1,	%o6
	rdpr	%canrestore,	%i3
	srlx	%o7,	%l2,	%g5
	rdpr	%cansave,	%l4
	wr	%o5,	%i2,	%sys_tick
	rd	%fprs,	%l6
	wrpr	%g7,	0x1C45,	%cwp
	wrpr	%g1,	0x11E0,	%tick
	tcs	%icc,	0x2
	flush	%l7 + 0x28
	wrpr	%o1,	0x1313,	%cwp
	rd	%tick_cmpr,	%g6
	rdpr	%cwp,	%o2
	tvs	%xcc,	0x2
	rdhpr	%htba,	%l0
	wrpr	%l3,	0x14F4,	%cwp
	rdhpr	%hintp,	%o3
	wr 	%g0, 	0x6, 	%fprs
	fmovscc	%icc,	%f16,	%f28
	ldx	[%l7 + 0x08],	%o0
	fmovsvs	%icc,	%f30,	%f26
	fnor	%f8,	%f26,	%f14
	alignaddrl	%i0,	%i7,	%g2
	rdhpr	%hpstate,	%i5
	fmovde	%xcc,	%f5,	%f16
	andncc	%l5,	%i4,	%i6
	movre	%i1,	0x1BE,	%g4
	add	%l1,	0x1899,	%i3
	bleu,pn	%xcc,	loop_480
	rd	%pc,	%o7
	rd	%softint,	%l2
	rd	%fprs,	%o6
loop_480:
	edge8	%l4,	%g5,	%o5
	wr	%i2,	%l6,	%set_softint
	tsubcctv	%g1,	0x122B,	%g7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xA91, 	%hsys_tick_cmpr
	tg	%xcc,	0x5
	rdpr	%canrestore,	%o2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x73B, 	%tick_cmpr
	wr	%l3,	%o3,	%y
	rdpr	%cansave,	%g3
	brz,a	%o4,	loop_481
	fnor	%f10,	%f10,	%f4
	addccc	%o1,	0x0232,	%o0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_481:
	wrpr	%g2,	%i5,	%pil
        wr    %g0,    0xe,    %pcr    ! changed.

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%i6,	0x1CB0,	%pil
	fmovscs	%icc,	%f26,	%f24
	xorcc	%l5,	%g4,	%l1
	wrpr	%i3,	%i1,	%tick
	rdpr	%pil,	%o7
	fble,a	%fcc0,	loop_482
	mova	%icc,	%l2,	%o6
	rdhpr	%hintp,	%l4
	rdhpr	%htba,	%o5
loop_482:
	rdhpr	%hsys_tick_cmpr,	%g5
	rdpr	%tl,	%i2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%fprs,	%g7
	wr	%g0,	0xe3,	%asi
	ldda	[%l7 + 0x30] %asi,	%g6
	fmul8x16au	%f1,	%f3,	%f28
	edge32ln	%o2,	%g1,	%l3
	rdhpr	%htba,	%o3
	wrpr	%g3,	%l0,	%pil
	fbn	%fcc3,	loop_483
	wrpr	%o4,	0x1AF9,	%tick
	rdpr	%otherwin,	%o1
	rdhpr	%hintp,	%o0
loop_483:
	array16	%i7,	%g2,	%i5
	srax	%i4,	0x0D,	%i0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x304, 	%hsys_tick_cmpr
	fcmpgt16	%f18,	%f28,	%i6
	bn,a	%xcc,	loop_484
	wr	%g4,	%l1,	%sys_tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xE3A, 	%sys_tick_cmpr
	rdpr	%cleanwin,	%o7
loop_484:
	rdhpr	%hintp,	%o6
	rd	%softint,	%l2
	wr	%l4,	0x1B7F,	%ccr
	tneg	%xcc,	0x2
	rd	%ccr,	%o5
	sllx	%g5,	0x08,	%l6
	rdpr	%wstate,	%g7
	rdhpr	%hintp,	%g6
	rdpr	%tba,	%i2
	wr 	%g0, 	0x6, 	%fprs
	wrpr	%g1,	0x1D45,	%cwp
	sub	%o3,	%g3,	%l0
	addcc	%l3,	0x169D,	%o4
	movvc	%icc,	%o0,	%o1
	udivx	%i7,	0x0FC0,	%i5
	rd	%ccr,	%i4
	rd	%ccr,	%g2
	sll	%i0,	%i6,	%g4
	wrpr	%l5,	%l1,	%cwp
	tneg	%icc,	0x3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%hsys_tick_cmpr,	%i3
	wr	%o7,	0x127A,	%clear_softint
	wrpr	%l2,	%l4,	%cwp
	wrpr	%o6,	0x141A,	%cwp
	wr	%o5,	0x0AF6,	%y
	movn	%xcc,	%g5,	%g7
	rd	%ccr,	%l6
	edge32l	%g6,	%i2,	%g1
	wr 	%g0, 	0x6, 	%fprs
	tg	%icc,	0x6
	wr	%g3,	0x1751,	%set_softint
	tgu	%xcc,	0x7
	wrpr	%o3,	%l3,	%tick
	fbe	%fcc3,	loop_485
	rdhpr	%hsys_tick_cmpr,	%l0
	fmovdcc	%icc,	%f6,	%f11

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_485:
	brlz	%o1,	loop_486
	rd	%tick_cmpr,	%o0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
loop_486:
	rdhpr	%hsys_tick_cmpr,	%i4
	wrpr	%i6,	0x1830,	%pil
	fnot1s	%f26,	%f15
	rd	%fprs,	%i0
	ta	%xcc,	0x2
	orcc	%g4,	%l1,	%i1
	rd	%fprs,	%i3
	rdpr	%canrestore,	%l5
	rdpr	%canrestore,	%l2
	wr	%o7,	0x1359,	%clear_softint
	rdpr	%otherwin,	%o6
	rdpr	%canrestore,	%l4
	rd	%y,	%g5
	movrne	%g7,	0x1F0,	%l6
        wr    %g0,    0xe,    %pcr    ! changed.
	wr	%i2,	%g1,	%sys_tick
	fmovs	%f26,	%f16
	tsubcctv	%o2,	%g6,	%o3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fpsub32s	%f3,	%f7,	%f12
	fxnor	%f24,	%f2,	%f12
	rd	%sys_tick_cmpr,	%l0
	rdpr	%wstate,	%o4
	rdhpr	%htba,	%g3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x0FB, 	%hsys_tick_cmpr
	rd	%fprs,	%i7
	rdpr	%tl,	%o0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x0C5, 	%hsys_tick_cmpr
	tl	%icc,	0x0
	rdpr	%cansave,	%i6
	xnor	%g4,	%l1,	%i0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	addcc	%l2,	0x1BA5,	%l5
	srlx	%o7,	0x1B,	%l4
	rd	%sys_tick_cmpr,	%g5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%asi,	%g7
	movleu	%xcc,	%o5,	%l6
	rd	%y,	%i2
	and	%o2,	0x149B,	%g6
	fbl	%fcc1,	loop_487
	bne,a	%icc,	loop_488
	udivx	%o3,	0x1857,	%g1
	rdhpr	%hintp,	%l0
loop_487:
	edge16n	%o4,	%g3,	%o1
loop_488:
	fornot2s	%f9,	%f22,	%f6
	wr	%i7,	0x1434,	%softint

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xF9C, 	%hsys_tick_cmpr
	rd	%fprs,	%i4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xC3F, 	%hsys_tick_cmpr
	rdpr	%cansave,	%l1
	fcmple32	%f4,	%f22,	%i6
	wrpr	%i1,	%i0,	%pil
	movcc	%icc,	%i3,	%l2
	udivx	%o7,	0x1FE7,	%l4
	movl	%icc,	%g5,	%l5
	rd	%tick_cmpr,	%o6
	wr	%o5,	0x106D,	%ccr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	movleu	%icc,	%i2,	%l6
	orncc	%g6,	%o3,	%o2
	edge32ln	%g1,	%l0,	%g3
	rd	%fprs,	%o1
	addcc	%i7,	%o4,	%o0
	fmovscc	%xcc,	%f1,	%f30
	siam	0x7
	rdpr	%pil,	%l3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	rdhpr	%hsys_tick_cmpr,	%g4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x52D, 	%hsys_tick_cmpr
	rdhpr	%htba,	%i6
	set	0x78, %g2
	lda	[%l7 + %g2] 0x11,	%f30

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xA33, 	%hsys_tick_cmpr
	srax	%i3,	0x0E,	%i0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	wr	%g0,	0xd2,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	rdhpr	%htba,	%l4
	mulx	%l2,	%g5,	%o6
	wrpr	%l5,	%o5,	%cwp
	wrpr	%i2,	%l6,	%tick
	rdhpr	%hsys_tick_cmpr,	%g7
	sdiv	%g6,	0x0489,	%o3
	tne	%icc,	0x2
	subc	%o2,	%l0,	%g1
	rdpr	%cansave,	%o1
	rdpr	%otherwin,	%g3
	ldub	[%l7 + 0x52],	%i7
	fnot1s	%f6,	%f3
	sir	0x17ED
	fmovscc	%icc,	%f20,	%f27
	movl	%icc,	%o4,	%o0
	rd	%tick_cmpr,	%l3
	tne	%xcc,	0x3
	edge16n	%g2,	%i4,	%i5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x37C, 	%hsys_tick_cmpr
	brlz,a	%l1,	loop_489
	wr	%i6,	0x0361,	%ccr
        wr    %g0,    0xe,    %pcr    ! changed.
	fcmpeq32	%f14,	%f0,	%o7
loop_489:
	rdhpr	%hsys_tick_cmpr,	%i0
	edge8	%l4,	%l2,	%o6
	smul	%l5,	0x1492,	%g5
	fcmpgt32	%f14,	%f26,	%o5
	tgu	%xcc,	0x2
	rd	%y,	%l6
	wrpr	%g7,	%i2,	%tick
	wr	%g6,	0x14AA,	%sys_tick
	movle	%xcc,	%o3,	%l0
	rdpr	%tba,	%g1
	addc	%o2,	0x079E,	%o1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xB84, 	%sys_tick_cmpr
	udivcc	%o0,	0x01BF,	%l3
	udivcc	%g2,	0x0AE4,	%i4
	rdhpr	%htba,	%i5
	te	%icc,	0x4
	wrpr	%o4,	%l1,	%pil
	fba	%fcc0,	loop_490
	fmuld8ulx16	%f10,	%f22,	%f24
	rd	%asi,	%i6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x1B3, 	%sys_tick_cmpr
loop_490:
	bvs,a	%xcc,	loop_491
	swap	[%l7 + 0x68],	%o7
	rdhpr	%hsys_tick_cmpr,	%i1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x180, 	%sys_tick_cmpr
loop_491:
	nop
	wr	%g0,	0x2b,	%asi
	stha	%i0,	[%l7 + 0x40] %asi
	membar	#Sync

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%g5,	%o5,	%y
	sub	%l5,	0x116F,	%g7
	wrpr	%i2,	0x1C49,	%cwp
	wrpr	%l6,	%g6,	%tick
	move	%icc,	%l0,	%o3
	rdpr	%tba,	%g1
	add	%o1,	%i7,	%g3
	rdpr	%cwp,	%o0
	ldstub	[%l7 + 0x0A],	%o2
	rd	%asi,	%g2
	wr	%l3,	%i5,	%sys_tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xEF9, 	%hsys_tick_cmpr
	rdpr	%cwp,	%i6
	fmovrdlez	%o4,	%f14,	%f18
	edge8	%g4,	%o7,	%i1
	mova	%xcc,	%i3,	%l4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x025, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	lduh	[%l7 + 0x16],	%o5
	rd	%ccr,	%l5
	brgez	%g7,	loop_492
	rdhpr	%hpstate,	%o6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xEF8, 	%hsys_tick_cmpr
	umulcc	%g6,	0x0576,	%l6
loop_492:
	alignaddr	%l0,	%g1,	%o1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	move	%xcc,	%i7,	%o0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
        wr    %g0,    0xe,    %pcr    ! changed.
	fbug,a	%fcc1,	loop_493
	rd	%y,	%l3
	popc	0x0D04,	%i5
	rdhpr	%hintp,	%i4
loop_493:
	movcs	%xcc,	%l1,	%i6
	movpos	%icc,	%o4,	%g4
	movg	%icc,	%o7,	%i1
	rd	%tick_cmpr,	%g2
	rd	%y,	%i3
	bshuffle	%f18,	%f26,	%f20
	wrpr	%l4,	0x018F,	%cwp
	rd	%ccr,	%l2
	fcmped	%fcc3,	%f22,	%f22
	sdiv	%g5,	0x095B,	%o5
	nop
	set	0x40, %o3
	ldd	[%l7 + %o3],	%f26
	wr	%i0,	0x0004,	%y
	wrpr	%l5,	0x0C73,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xD38, 	%hsys_tick_cmpr
	wr	%i2,	0x167D,	%clear_softint

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xA2C, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x732, 	%hsys_tick_cmpr
	tleu	%icc,	0x6
	rdpr	%canrestore,	%l0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xC7A, 	%hsys_tick_cmpr
	rdpr	%canrestore,	%g1
	andn	%o3,	0x03CC,	%o0
	rdpr	%wstate,	%o2
	wrpr	%i7,	0x011B,	%tick
	rd	%fprs,	%l3
	tsubcc	%g3,	0x1A00,	%i5
	edge16l	%l1,	%i4,	%o4
	set	0x72, %i5
	ldsba	[%l7 + %i5] 0x89,	%i6
	rd	%tick_cmpr,	%g4
	wrpr	%i1,	0x1F18,	%tick
	rd	%sys_tick_cmpr,	%o7
	rd	%fprs,	%i3
	edge16l	%g2,	%l2,	%g5
	movvc	%xcc,	%l4,	%o5
	tvc	%xcc,	0x4
	wr	%g0,	0xe3,	%asi
	stda	%i0,	[%l7 + 0x50] %asi
	membar	#Sync

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%o6,	%g7,	%ccr
	rdpr	%cleanwin,	%l6
	fmovdl	%icc,	%f9,	%f4
	fmovrdne	%i2,	%f26,	%f0
	rd	%sys_tick_cmpr,	%l0
	fmovrsne	%o1,	%f11,	%f17
	rdpr	%canrestore,	%g1
	wrpr	%o3,	0x1F7B,	%tick
	movrgez	%g6,	0x196,	%o2
	movne	%icc,	%i7,	%l3
	std	%o0,	[%l7 + 0x40]
	tg	%icc,	0x2
	addcc	%g3,	0x09FD,	%l1
	wr	%i5,	0x025E,	%softint
	fcmpeq32	%f8,	%f6,	%o4
	movcs	%icc,	%i6,	%g4
	fblg	%fcc2,	loop_494
	rdpr	%tl,	%i4
	rd	%tick_cmpr,	%i1
	fors	%f0,	%f21,	%f6
loop_494:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x81A, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%y,	%l2
	rdhpr	%hsys_tick_cmpr,	%g5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%cleanwin,	%g2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	sir	0x0EF3
	rd	%tick_cmpr,	%i0
	wr	%l5,	%o6,	%softint
	rdhpr	%hsys_tick_cmpr,	%g7
	bge	%icc,	loop_495
	wr	%i2,	0x11B4,	%pic
	rd	%softint,	%l0
	rd	%asi,	%o1
loop_495:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%htba,	%l6
	rdhpr	%htba,	%o3
	siam	0x6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xDDE, 	%hsys_tick_cmpr
	rdhpr	%hsys_tick_cmpr,	%g6
	wrpr	%l3,	%g3,	%tick
	andncc	%o0,	%l1,	%i5
	wr	%i6,	%o4,	%set_softint
	tcs	%xcc,	0x2
	wrpr	%g4,	0x05D8,	%tick
	rdhpr	%hpstate,	%i4
	fmovdl	%icc,	%f6,	%f21
	wrpr	%o7,	0x1C13,	%cwp
	rd	%pc,	%i3
	edge8l	%i1,	%g5,	%l2
	rdhpr	%hsys_tick_cmpr,	%l4
	rd	%ccr,	%g2
	wr	%o5,	%i0,	%y
	ba	loop_496
	fpadd16s	%f16,	%f7,	%f26
	andn	%l5,	0x0463,	%g7
	tle	%icc,	0x5
loop_496:
	brz	%i2,	loop_497
	sdivcc	%o6,	0x0861,	%l0
	fmovdvs	%xcc,	%f23,	%f15
	subccc	%o1,	%g1,	%l6
loop_497:
	rd	%tick_cmpr,	%o3
	wr	%i7,	%g6,	%ccr
	fpadd16s	%f3,	%f1,	%f27
	fble	%fcc2,	loop_498
	rd	%fprs,	%o2
	tg	%icc,	0x0
	wrpr	%l3,	%g3,	%tick
loop_498:
	wr	%o0,	%i5,	%clear_softint
	rdhpr	%hintp,	%l1
	xnor	%i6,	%g4,	%i4
	fcmple32	%f10,	%f12,	%o7
	rd	%pc,	%o4
	andncc	%i3,	%i1,	%g5
	rdpr	%gl,	%l2
	wr	%g2,	%o5,	%clear_softint
	edge16ln	%i0,	%l4,	%g7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	movvc	%xcc,	%l0,	%o1
	rd	%fprs,	%l5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%i7,	%o3,	%tick
	wrpr	%o2,	%l3,	%pil
	array8	%g3,	%g6,	%i5
        wr    %g0,    0xe,    %pcr    ! changed.
	rdhpr	%hintp,	%i6
	wrpr	%g4,	%o7,	%pil
	subc	%i4,	%o4,	%i1
	rd	%y,	%i3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x57D, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x5D7, 	%hsys_tick_cmpr
	movg	%icc,	%i0,	%l4
	movrlez	%g7,	0x11B,	%i2
	wr	%l0,	%o6,	%set_softint
	wrpr	%o1,	%l5,	%cwp
	wrpr	%g1,	0x027E,	%tick
	te	%xcc,	0x6
	edge32n	%i7,	%o3,	%l6
	lduw	[%l7 + 0x3C],	%o2
	rd	%softint,	%g3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	set	0x5C, %o6
	lduha	[%l7 + %o6] 0x88,	%l3
	wr	%o0,	%i6,	%pic
	sdiv	%l1,	0x073A,	%o7
	orncc	%i4,	%g4,	%o4
	wr 	%g0, 	0x6, 	%fprs
	rdpr	%pil,	%g2
	rdpr	%gl,	%i3
	wr	%g0,	0x10,	%asi
	ldxa	[%l7 + 0x68] %asi,	%o5
	rdhpr	%htba,	%i0
	movrgez	%g5,	%g7,	%i2
	faligndata	%f14,	%f20,	%f4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%l0,	0x0277,	%cwp
	add	%o1,	0x06DF,	%g1
	movcc	%xcc,	%i7,	%o3
	wrpr	%l6,	0x1759,	%pil
	rd	%fprs,	%o2
	fcmpne32	%f26,	%f2,	%l5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x955, 	%hsys_tick_cmpr
	wrpr	%i5,	%o0,	%tick
	wrpr	%i6,	0x049B,	%tick
	rdpr	%pil,	%l3
	udivcc	%l1,	0x003E,	%i4
	edge16l	%g4,	%o7,	%i1
	addc	%o4,	0x00A6,	%g2
	rdhpr	%hpstate,	%i3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xF61, 	%hsys_tick_cmpr
	set	0x2E, %i0
	ldstuba	[%l7 + %i0] 0x0c,	%o5
	wrpr	%g5,	0x08A0,	%pil
	wrpr	%g7,	0x1032,	%tick
	rdpr	%cwp,	%l4
	movcc	%xcc,	%o6,	%i2
	wr	%l0,	0x1663,	%ccr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xEF6, 	%hsys_tick_cmpr
	rdhpr	%hpstate,	%o1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xD83, 	%hsys_tick_cmpr
	movg	%icc,	%o2,	%l6
	rdpr	%cwp,	%g3
	add	%l7,	0x40,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%g6
	casxa	[%l6] %asi,	%g6,	%i5
	andn	%o0,	0x082B,	%i6
	fmovrsgez	%l5,	%f11,	%f19
	wrpr	%l3,	%l1,	%pil
	wrpr	%g4,	%o7,	%pil
	wr	%g0,	0x89,	%asi
	stwa	%i4,	[%l7 + 0x18] %asi
	te	%xcc,	0x7
	fmovsge	%xcc,	%f29,	%f29
	sll	%o4,	%g2,	%i1
	wrpr	%i3,	%i0,	%tick
	rdhpr	%hpstate,	%l2
	bl,pt	%icc,	loop_499
	udiv	%o5,	0x1165,	%g7
	wr	%l4,	0x0D98,	%set_softint
	sll	%g5,	0x17,	%i2
loop_499:
	rdhpr	%hsys_tick_cmpr,	%l0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	rdpr	%cleanwin,	%g1
	bneg	%xcc,	loop_500
	alignaddrl	%o1,	%o6,	%i7
	taddcctv	%o3,	%o2,	%l6
	rdpr	%wstate,	%g3
loop_500:
	rdpr	%gl,	%g6
	rdhpr	%hsys_tick_cmpr,	%i5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%htba,	%i6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	movn	%xcc,	%l3,	%l1
	rdhpr	%htba,	%g4
	wrpr	%o7,	%i4,	%tick
	wr	%o4,	%g2,	%clear_softint
	fcmpne16	%f12,	%f4,	%i1
	andn	%i3,	0x04AF,	%l2
	rdpr	%tba,	%o5
	wrpr	%i0,	0x0756,	%pil
	brgz	%l4,	loop_501
	rdhpr	%hsys_tick_cmpr,	%g5
	rdpr	%wstate,	%i2
	add	%g7,	%l0,	%g1
loop_501:
	rdpr	%tba,	%o1
	rd	%fprs,	%o6
	te	%icc,	0x2
	wr	%o3,	%i7,	%softint
	movrlez	%l6,	%g3,	%o2
	fxors	%f6,	%f10,	%f30
	fblg	%fcc3,	loop_502
	rd	%y,	%g6
	rdhpr	%hpstate,	%i5
	rdhpr	%hsys_tick_cmpr,	%i6
loop_502:
	rd	%softint,	%l5
	edge32	%o0,	%l1,	%l3
	rd	%sys_tick_cmpr,	%o7
	rdhpr	%hintp,	%g4
	rd	%pc,	%o4
	movgu	%icc,	%i4,	%g2
	movg	%xcc,	%i1,	%l2
	rdhpr	%hsys_tick_cmpr,	%i3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	wrpr	%l4,	0x0482,	%cwp
	fpsub32s	%f16,	%f11,	%f13
	fmovscc	%xcc,	%f22,	%f8
	rdhpr	%hsys_tick_cmpr,	%g5
	rdpr	%cwp,	%i2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x47E, 	%hsys_tick_cmpr
	set	0x20, %g5
	ldda	[%l7 + %g5] 0xe3,	%g6
	rdhpr	%htba,	%l0
	rdpr	%canrestore,	%g1
	wrpr	%o6,	%o3,	%cwp
	rdpr	%pil,	%o1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x51E, 	%hsys_tick_cmpr
	wrpr	%l6,	0x05C1,	%pil
	movrgz	%g3,	0x243,	%o2
	wr	%g6,	%i6,	%softint

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x7E] %asi,	%o0
	sll	%l1,	%o7,	%l3
	tg	%xcc,	0x3
	fbule	%fcc1,	loop_503
	mova	%icc,	%o4,	%i4
	stx	%g4,	[%l7 + 0x28]
	fmovrdne	%g2,	%f0,	%f28
loop_503:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr 	%g0, 	0x4, 	%fprs

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xFE1, 	%hsys_tick_cmpr
	rdpr	%cleanwin,	%g5
	rdpr	%cleanwin,	%i2
	fblg,a	%fcc1,	loop_504
	fbu	%fcc0,	loop_505
	bge,a,pt	%xcc,	loop_506
	rd	%fprs,	%i1
loop_504:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x425, 	%hsys_tick_cmpr
loop_505:
	rdpr	%canrestore,	%g7
loop_506:
	rdhpr	%htba,	%l0
	fmovdvc	%icc,	%f5,	%f0
	movge	%icc,	%o6,	%o3
	rdpr	%pil,	%g1
	tcc	%xcc,	0x0
	wr	%o1,	%l6,	%softint
	brnz	%g3,	loop_507
	tgu	%xcc,	0x3
	rdpr	%gl,	%o2
	movrlz	%g6,	%i6,	%i7
loop_507:
	bne,pn	%icc,	loop_508
	wrpr	%i5,	%o0,	%cwp
	set	0x68, %l6
	prefetcha	[%l7 + %l6] 0x14,	 0x2
loop_508:
	wr	%o7,	%l1,	%y
	fbn	%fcc2,	loop_509
	rdhpr	%hpstate,	%o4
	wr	%i4,	%l3,	%clear_softint

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xF7F, 	%hsys_tick_cmpr
loop_509:
	wr	%l2,	0x083A,	%ccr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xA59, 	%sys_tick_cmpr
	sub	%l4,	0x1CF9,	%g5
	rdhpr	%hintp,	%i3
	rdhpr	%hsys_tick_cmpr,	%i1
	fmovrdgez	%i2,	%f22,	%f30
	rd	%asi,	%g7
	movvc	%icc,	%i0,	%o6
	std	%l0,	[%l7 + 0x60]
	wr	%g1,	%o1,	%y
	rdpr	%gl,	%l6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%hsys_tick_cmpr,	%o2
	movre	%i6,	%i7,	%i5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xECE, 	%hsys_tick_cmpr
	rdhpr	%hintp,	%g6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%sys_tick_cmpr,	%o4
	wr	%o7,	0x1BF1,	%set_softint
	wrpr	%l3,	0x1EA1,	%cwp
	wr 	%g0, 	0x4, 	%fprs
	wrpr	%g2,	0x0990,	%pil
	stx	%l2,	[%l7 + 0x50]
	or	%o5,	%g5,	%l4
	edge16n	%i3,	%i2,	%i1
	rdhpr	%hintp,	%i0
	movrgz	%g7,	0x1F5,	%o6
	rdhpr	%hsys_tick_cmpr,	%l0
	brgez	%g1,	loop_510
	edge32ln	%o1,	%l6,	%o3
	rdhpr	%htba,	%g3
	wr	%i6,	0x1C55,	%clear_softint
loop_510:
	andcc	%i7,	0x02C9,	%i5
	wrpr	%o2,	0x13BB,	%pil
	edge8	%o0,	%g6,	%l5
	wr	%l1,	%o7,	%pic

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%g0,	0x88,	%asi
	lda	[%l7 + 0x5C] %asi,	%f21
	stw	%i4,	[%l7 + 0x24]
	rd	%pc,	%g4
	te	%xcc,	0x2
        wr    %g0,    0xe,    %pcr    ! changed.
	tn	%icc,	0x4
	tsubcc	%g2,	%o5,	%l2
	fnot1s	%f26,	%f10

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xDE1, 	%tick_cmpr
	fnegd	%f20,	%f20
	ta	%xcc,	0x2
	wrpr	%g5,	0x1FD8,	%cwp
	wr	%g0,	0x88,	%asi
	ldxa	[%l7 + 0x48] %asi,	%i1
	movge	%icc,	%i0,	%g7
	wrpr	%o6,	0x061E,	%tick
        wr    %g0,    0xe,    %pcr    ! changed.
	fnegs	%f16,	%f30
	fmul8x16al	%f28,	%f30,	%f30
	fnot1	%f28,	%f8
	rdpr	%cwp,	%i2
	subcc	%o1,	0x0D94,	%l6
	rdpr	%tba,	%g3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x10C, 	%hsys_tick_cmpr
	wrpr	%i7,	0x0CF2,	%pil
	rdhpr	%hintp,	%o3
	rdhpr	%htba,	%o2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	wr	%o0,	0x14F5,	%sys_tick
	wr	%g0,	0x22,	%asi
	stba	%g6,	[%l7 + 0x0D] %asi
	membar	#Sync

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xF44, 	%hsys_tick_cmpr
	movn	%xcc,	%l1,	%l3
	array32	%i4,	%g4,	%o4
	rdpr	%otherwin,	%o5
	wrpr	%g2,	%l2,	%pil
	rdpr	%canrestore,	%l4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	srax	%i1,	%i0,	%g5
	fpadd16	%f30,	%f20,	%f24
	wrpr	%o6,	0x0FD7,	%tick
	fmul8x16	%f15,	%f12,	%f2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	srax	%l0,	0x00,	%g1
	sth	%i2,	[%l7 + 0x46]
	rdhpr	%hintp,	%o1
	rdhpr	%htba,	%l6
	wr	%g3,	0x0AEE,	%ccr
	or	%i6,	0x0A75,	%i7
	rd	%pc,	%o2
	add	%l7,	0x24,	%l6
	wr	%g0,	0x0c,	%asi
	lda	[%l6] %asi,	%i5
	casa	[%l6] 0x0c,	%i5,	%o0
	rd	%fprs,	%g6
	ba,a	%xcc,	loop_511
	rd	%asi,	%o3
	rd	%tick_cmpr,	%l5
	rd	%tick_cmpr,	%o7
loop_511:
	alignaddr	%l1,	%i4,	%l3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x64C, 	%hsys_tick_cmpr
	andn	%o5,	%g2,	%g4
	ldd	[%l7 + 0x28],	%l4
	rd	%tick_cmpr,	%i3
	addccc	%i1,	%l2,	%g5
	mova	%xcc,	%i0,	%g7
	rd	%softint,	%l0
	wrpr	%o6,	%i2,	%tick
	rd	%fprs,	%g1
	wr	%o1,	0x0AAE,	%set_softint
	srlx	%g3,	%i6,	%l6
	orcc	%i7,	0x0659,	%i5
	rd	%tick_cmpr,	%o0
	wrpr	%o2,	0x0513,	%cwp
	for	%f22,	%f10,	%f24
	rdhpr	%hpstate,	%g6
	rdhpr	%hpstate,	%o3
	fmovsg	%xcc,	%f13,	%f30
	alignaddrl	%l5,	%l1,	%o7
	rdhpr	%hsys_tick_cmpr,	%l3
	wr	%o4,	0x0015,	%pic
	edge32n	%o5,	%i4,	%g4
	fnot2	%f30,	%f0
	wr	%l4,	%i3,	%softint
	array16	%i1,	%g2,	%l2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x706, 	%hsys_tick_cmpr
	wrpr	%g7,	%g5,	%cwp
	wrpr	%l0,	0x0DBB,	%cwp
	rdpr	%tba,	%o6
	tge	%xcc,	0x5
	set	0x12, %o7
	stba	%g1,	[%l7 + %o7] 0x23
	membar	#Sync
        wr    %g0,    0xe,    %pcr    ! changed.
	wr 	%g0, 	0x5, 	%fprs
	tcs	%icc,	0x0
	rdhpr	%hsys_tick_cmpr,	%i6
	rdpr	%otherwin,	%l6
	nop
	set	0x24, %i7
	sth	%i5,	[%l7 + %i7]
	wrpr	%o0,	0x0FBA,	%pil
	rd	%y,	%i7
	rd	%ccr,	%g6
	tvs	%xcc,	0x1
	wr	%o3,	%o2,	%y
	fbu	%fcc3,	loop_512
	movvs	%xcc,	%l1,	%o7
	rdpr	%gl,	%l5
	tle	%xcc,	0x3
loop_512:
	rdhpr	%hpstate,	%o4
	edge8	%l3,	%o5,	%g4
	tg	%icc,	0x3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%sys_tick_cmpr,	%l4
	tgu	%icc,	0x6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	rdpr	%wstate,	%l2
	rd	%sys_tick_cmpr,	%i0
	wrpr	%g2,	%g5,	%pil
	sll	%l0,	0x1B,	%o6
	wr	%g7,	%i2,	%pic
	nop
	set	0x7C, %o1
	lduh	[%l7 + %o1],	%g3
	wrpr	%g1,	0x06EF,	%pil
	ble	%icc,	loop_513
	rdhpr	%hsys_tick_cmpr,	%o1
	rd	%tick_cmpr,	%l6
	udiv	%i5,	0x0869,	%i6
loop_513:
	rdhpr	%hintp,	%i7
	rdhpr	%hsys_tick_cmpr,	%g6
	fand	%f16,	%f4,	%f22
	rd	%ccr,	%o3
	rd	%ccr,	%o2
	nop
	set	0x48, %g3
	std	%f24,	[%l7 + %g3]
	or	%l1,	%o7,	%l5
	wr	%o0,	%o4,	%y

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xF37, 	%hsys_tick_cmpr
	wr	%g4,	0x0B0C,	%pic
	rd	%pc,	%l3
	fmovd	%f24,	%f14
	rdpr	%canrestore,	%l4
	wrpr	%i4,	0x1201,	%cwp
	rdpr	%tba,	%i3
	fmovdgu	%xcc,	%f4,	%f6
	fmovdpos	%xcc,	%f1,	%f19
	rd	%tick_cmpr,	%i1
	fmovda	%xcc,	%f25,	%f11
	rdpr	%cleanwin,	%i0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x8B9, 	%hsys_tick_cmpr
	rdpr	%cleanwin,	%l2
	orn	%g5,	0x0BA4,	%l0
	rd	%pc,	%g7
        wr    %g0,    0xe,    %pcr    ! changed.
	wrpr	%g3,	0x1B83,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x000, 	%hsys_tick_cmpr
	rd	%fprs,	%o1
	wr	%i2,	%l6,	%y

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x761, 	%hsys_tick_cmpr
	fcmpeq32	%f30,	%f20,	%g6
	wr	%o3,	%i5,	%y
	wrpr	%l1,	0x1B67,	%cwp
	fnot1s	%f26,	%f2
	edge16n	%o7,	%o2,	%o0
	wr	%l5,	%o5,	%y
	rdhpr	%hintp,	%o4
	rd	%pc,	%g4
	lduh	[%l7 + 0x7C],	%l4
	set	0x28, %g7
	stxa	%i4,	[%l7 + %g7] 0x0c
	xnor	%i3,	%i1,	%i0
	rdpr	%cleanwin,	%g2
	sra	%l3,	%l2,	%g5
	ldsw	[%l7 + 0x70],	%g7
	rdpr	%pil,	%l0
	lduw	[%l7 + 0x38],	%g3
	fmovdl	%icc,	%f19,	%f27
	rdhpr	%htba,	%g1
	movge	%xcc,	%o1,	%i2
	movcc	%xcc,	%l6,	%i6
	smul	%i7,	0x098F,	%g6
	std	%f26,	[%l7 + 0x60]
	rd	%sys_tick_cmpr,	%o6
	edge32ln	%i5,	%l1,	%o3
	fmovspos	%xcc,	%f24,	%f8
	wrpr	%o2,	%o0,	%tick
	alignaddr	%o7,	%o5,	%l5
	rdhpr	%hpstate,	%g4
	edge32	%l4,	%o4,	%i4
	array32	%i1,	%i0,	%g2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x720, 	%hsys_tick_cmpr
	stw	%l2,	[%l7 + 0x48]
	edge32	%l3,	%g7,	%g5
	wrpr	%g3,	%g1,	%tick
	wr	%o1,	%l0,	%y
	rdpr	%tba,	%l6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	ba	%xcc,	loop_514
	rdpr	%wstate,	%i7
	rd	%softint,	%g6
	bne	loop_515
loop_514:
	fnegs	%f18,	%f7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x6B3, 	%hsys_tick_cmpr
!Yo - got one - imm_asi 0x40 
!And yo - immediate is 0x1c0
	set	0x1c0, %o2
	nop 	! 	nop 	! 	ldxa	[%g0 + %o2] 0x40,	%i5 ripped by fixASI40.pl ripped by fixASI40.pl
loop_515:
	and	%o3,	0x00A5,	%o0
	wrpr	%o7,	0x1FA8,	%pil
	fcmple16	%f8,	%f4,	%o2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x472, 	%hsys_tick_cmpr
	wrpr	%l4,	%l5,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fmovsa	%xcc,	%f9,	%f24
	wr	%i0,	0x0459,	%softint
	wrpr	%i4,	%g2,	%tick
	fmul8x16al	%f31,	%f10,	%f8
	rdhpr	%htba,	%l2
	or	%l3,	0x0C56,	%g7
	taddcc	%i3,	%g5,	%g1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x383, 	%hsys_tick_cmpr
	swap	[%l7 + 0x18],	%l6
	movrgez	%o1,	0x252,	%i6
	rdhpr	%hintp,	%i2
	rdhpr	%htba,	%i7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%asi,	%i5
	taddcc	%o3,	%l1,	%o0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x367, 	%hsys_tick_cmpr
	tvs	%icc,	0x4
	movle	%icc,	%g4,	%l4
	wr	%l5,	0x1CD7,	%sys_tick
	wr	%o4,	%i1,	%sys_tick
	std	%o4,	[%l7 + 0x70]
	tge	%icc,	0x4
	fble	%fcc3,	loop_516
	rdpr	%wstate,	%i0
	move	%icc,	%i4,	%l2
	rd	%y,	%l3
loop_516:
	nop
	set	0x58, %o4
	stw	%g7,	[%l7 + %o4]
	wrpr	%i3,	0x070D,	%cwp
	rdhpr	%hsys_tick_cmpr,	%g5
	fsrc2	%f8,	%f26
	rdpr	%canrestore,	%g2
	popc	0x01DE,	%g1
	fnor	%f2,	%f28,	%f16
	tg	%icc,	0x4
	array8	%g3,	%l0,	%l6
	set	0x1E, %o0
	ldsha	[%l7 + %o0] 0x14,	%i6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%gl,	%i7
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x20
	wr	%g0,	0x4f,	%asi
	ldxa	[%g0 + 0x20] %asi,	%o1
	mova	%icc,	%o6,	%g6
	rd	%asi,	%i5
	wr	%l1,	%o3,	%clear_softint
	rdhpr	%htba,	%o7
	andcc	%o0,	%o2,	%l4
	movne	%xcc,	%g4,	%o4
	rdhpr	%hsys_tick_cmpr,	%i1
	wrpr	%l5,	%i0,	%tick
        wr    %g0,    0xe,    %pcr    ! changed.
	taddcc	%o5,	%l3,	%l2
	rd	%fprs,	%g7
	movcs	%xcc,	%i3,	%g5
	addccc	%g1,	0x044E,	%g2
	rdpr	%cansave,	%l0
	rdpr	%cleanwin,	%l6
	rdpr	%pil,	%g3
	rdpr	%tl,	%i6
	rdpr	%tba,	%i2
	wr	%g0,	0x80,	%asi
	stba	%i7,	[%l7 + 0x3C] %asi
	set	0x08, %g1
	prefetcha	[%l7 + %g1] 0x04,	 0x1
	movne	%xcc,	%o6,	%g6
	fmovrsgez	%i5,	%f14,	%f15
	fnegd	%f18,	%f10
	wrpr	%l1,	%o3,	%tick
	rdpr	%cleanwin,	%o0
	fmovsl	%icc,	%f15,	%f26
	andcc	%o2,	0x0E34,	%l4
	srlx	%g4,	0x07,	%o4
	rdpr	%pil,	%o7
	taddcctv	%l5,	0x1F51,	%i0
	andncc	%i4,	%i1,	%l3
	rdpr	%tba,	%l2
	subc	%g7,	0x09BF,	%o5
	set	0x26, %l0
	stha	%i3,	[%l7 + %l0] 0x15
	udivcc	%g1,	0x1523,	%g5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xEBF, 	%hsys_tick_cmpr
	wrpr	%g3,	%g2,	%pil
	tg	%xcc,	0x7
	rdpr	%cwp,	%i2
	movn	%xcc,	%i7,	%o1
	umul	%i6,	%o6,	%i5
	wr	%g6,	0x1845,	%pic
	subc	%o3,	0x0B45,	%l1
	rdhpr	%hpstate,	%o2
	rdhpr	%htba,	%l4
	wr	%g0,	0x0c,	%asi
	stba	%g4,	[%l7 + 0x59] %asi
	tcc	%xcc,	0x1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xEEC, 	%hsys_tick_cmpr
	fbe,a	%fcc2,	loop_517
	rdhpr	%hintp,	%o0
	tg	%icc,	0x0
	set	0x0C, %i1
	lda	[%l7 + %i1] 0x15,	%f12
loop_517:
	edge16	%o7,	%i0,	%l5
	wrpr	%i4,	%l3,	%pil
	wrpr	%l2,	%i1,	%pil
	movle	%xcc,	%o5,	%g7
	mulx	%g1,	0x106D,	%g5
	rd	%fprs,	%l0
	std	%f6,	[%l7 + 0x20]
	fcmped	%fcc1,	%f2,	%f14
	fbul	%fcc0,	loop_518
	tcs	%xcc,	0x1
	rdpr	%canrestore,	%l6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xD2E, 	%hsys_tick_cmpr
loop_518:
	subc	%i2,	%i7,	%o1
	wrpr	%g3,	%i6,	%tick
	wr	%i5,	0x0F7A,	%softint
	wrpr	%g6,	0x0F00,	%pil
	fmul8sux16	%f2,	%f2,	%f14
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x9C4, 	%hsys_tick_cmpr
	wrpr	%l1,	0x1EF0,	%tick
	or	%o2,	0x031C,	%l4
	rdhpr	%hintp,	%g4
	fcmpgt32	%f24,	%f24,	%o6
	fbug	%fcc1,	loop_519
	wrpr	%o0,	0x15D1,	%tick
	wr	%o7,	0x099C,	%sys_tick
	flush	%l7 + 0x4C
loop_519:
	fpmerge	%f25,	%f19,	%f10
	wrpr	%o4,	0x14DE,	%cwp
	fmovdn	%icc,	%f24,	%f9
	fmovdn	%xcc,	%f14,	%f11
	rd	%y,	%i0
	movcc	%xcc,	%l5,	%i4
	wrpr	%l2,	%i1,	%tick
	fpsub32s	%f24,	%f29,	%f8
	tneg	%icc,	0x6
	rdpr	%tba,	%o5
	rdhpr	%hsys_tick_cmpr,	%l3
	wr	%g1,	0x0D9E,	%set_softint
	bcs	loop_520
	bl,a,pt	%xcc,	loop_521
	wr	%g7,	%g5,	%clear_softint
	tne	%icc,	0x3
loop_520:
	subc	%l0,	0x141B,	%i3
loop_521:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x901, 	%hsys_tick_cmpr
	edge8	%i2,	%l6,	%i7
	rdpr	%gl,	%o1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x687, 	%hsys_tick_cmpr
        wr    %g0,    0xe,    %pcr    ! changed.
	rdpr	%pil,	%o3
	bg,pn	%xcc,	loop_522
	wrpr	%i6,	%o2,	%cwp
	movrlez	%l1,	0x0EF,	%l4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x193, 	%hsys_tick_cmpr
loop_522:
	rdpr	%cansave,	%g4
	fmovdge	%xcc,	%f10,	%f16
	fcmps	%fcc0,	%f16,	%f2
	rdhpr	%htba,	%o7
	wrpr	%o4,	%i0,	%pil
	wrpr	%l5,	%i4,	%tick
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bge,pt	%icc,	loop_523
	mulx	%i1,	0x10CE,	%o5
	rdpr	%tl,	%l2
	xor	%g1,	%g7,	%l3
loop_523:
	srl	%l0,	%g5,	%i3
	wr	%g2,	0x1BAD,	%ccr
	rdhpr	%hpstate,	%i2
	rd	%fprs,	%i7
	wr	%l6,	%g3,	%pic
	array8	%o1,	%i5,	%o3
	andn	%g6,	0x11AC,	%i6
	wrpr	%l1,	%l4,	%cwp
	rd	%softint,	%o6
	rdhpr	%hintp,	%o2
	addcc	%o0,	0x023A,	%o7
	rd	%softint,	%o4
	fpsub16s	%f22,	%f5,	%f4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%g4,	%i1,	%tick
	lduh	[%l7 + 0x3E],	%i4
	wrpr	%o5,	0x1499,	%cwp
	movrgz	%g1,	%g7,	%l3
	edge32n	%l0,	%l2,	%g5
	tg	%icc,	0x3
	wr	%g2,	0x03AE,	%y

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x0EF, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x2A5, 	%hsys_tick_cmpr
	rd	%tick_cmpr,	%g3
	set	0x6C, %g6
	ldsba	[%l7 + %g6] 0x88,	%i7
	wrpr	%o1,	0x06E5,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	smul	%i5,	%i6,	%l1
	tleu	%icc,	0x1
	fmovda	%icc,	%f12,	%f16
	bcs,pn	%xcc,	loop_524
	rd	%ccr,	%o6
	wrpr	%l4,	%o2,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x2FD, 	%hsys_tick_cmpr
loop_524:
	rdhpr	%htba,	%o4
	move	%icc,	%i0,	%o7
	rdhpr	%hpstate,	%g4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x533, 	%hsys_tick_cmpr
	andn	%o5,	%g1,	%g7
	fbge	%fcc3,	loop_525
	wr	%i4,	%l0,	%ccr
	wr	%l2,	0x0298,	%pic
	rdhpr	%hpstate,	%l3
loop_525:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%g5,	0x1BA1,	%clear_softint
	tcc	%xcc,	0x7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	brz	%l6,	loop_526
	rd	%asi,	%g3
	rdhpr	%hpstate,	%i7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xB02, 	%hsys_tick_cmpr
loop_526:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	wr	%g6,	%i5,	%sys_tick
	andn	%l1,	0x0E33,	%o6
	xnor	%l4,	%i6,	%o0
	tge	%xcc,	0x3
	movrne	%o2,	%i0,	%o7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%o4,	0x1200,	%cwp
	alignaddr	%i1,	%o5,	%l5
	fbge	%fcc2,	loop_527
	movl	%xcc,	%g1,	%i4
	rdhpr	%htba,	%g7
	std	%l0,	[%l7 + 0x20]
loop_527:
	movleu	%icc,	%l2,	%g2
	rdpr	%gl,	%g5
	rdpr	%otherwin,	%i3
	set	0x30, %i3
	ldswa	[%l7 + %i3] 0x81,	%l3
	fmovscs	%xcc,	%f31,	%f28

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x4CD, 	%hsys_tick_cmpr
	sllx	%o1,	0x0C,	%o3
	rdhpr	%hpstate,	%i2
	array16	%i7,	%i5,	%g6
	rdpr	%cansave,	%l1
	wr	%l4,	0x0A38,	%ccr
	wrpr	%i6,	0x09E9,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%o6,	0x133C,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	fbn,a	%fcc3,	loop_528
	rd	%tick_cmpr,	%o7
	umul	%i1,	0x088D,	%o5
	fcmps	%fcc1,	%f22,	%f12
loop_528:
	rd	%tick_cmpr,	%l5
	tcs	%xcc,	0x1
	bcc,a	%icc,	loop_529
	smulcc	%o4,	%i4,	%g1
	fpack32	%f6,	%f12,	%f0
	fands	%f30,	%f14,	%f2
loop_529:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x6B8, 	%hsys_tick_cmpr
	rdhpr	%hpstate,	%g2
	array8	%g7,	%i3,	%g5
	rdpr	%tl,	%l3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%o1,	0x184A,	%cwp
	array16	%g3,	%o3,	%i2
	wr	%i5,	%g6,	%set_softint
	rd	%pc,	%l1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x41D, 	%hsys_tick_cmpr
	swap	[%l7 + 0x14],	%i6
	rd	%y,	%o2
	srlx	%o6,	%o0,	%g4
	rdpr	%cwp,	%i0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%fprs,	%l5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%pil,	%g1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%o4,	0x059C,	%pil
	wr	%g0,	0x24,	%asi
	ldda	[%l7 + 0x40] %asi,	%g2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	movl	%icc,	%g7,	%l3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	fabss	%f20,	%f5
	fbule	%fcc3,	loop_530
	fbu	%fcc1,	loop_531
	wrpr	%o3,	0x1A0E,	%cwp
	rdhpr	%hintp,	%l6
loop_530:
	rd	%tick_cmpr,	%i5
loop_531:
	tgu	%xcc,	0x2
	fandnot2	%f6,	%f8,	%f8
	array16	%g6,	%i2,	%l1
	wrpr	%i7,	%l4,	%tick
	edge32n	%o2,	%i6,	%o6
	wrpr	%o0,	0x12CB,	%cwp
	subccc	%i0,	%i1,	%o7
	fmovs	%f1,	%f8
	edge16n	%g4,	%o5,	%i4
	wr	%l5,	0x148C,	%softint
	fandnot1	%f24,	%f4,	%f18
	rdhpr	%hsys_tick_cmpr,	%l0
	rd	%asi,	%g1
	wrpr	%l2,	0x144D,	%tick
	rdhpr	%hsys_tick_cmpr,	%g2
	rdpr	%cwp,	%o4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x21E, 	%hsys_tick_cmpr
	set	0x38, %i6
	stxa	%i3,	[%l7 + %i6] 0x22
	membar	#Sync
	rdpr	%cleanwin,	%l3
	brlz,a	%g7,	loop_532
	rdpr	%otherwin,	%o1
	xnor	%o3,	0x012C,	%l6
	fand	%f26,	%f18,	%f30
loop_532:
	tsubcctv	%i5,	%g6,	%g3
	faligndata	%f30,	%f30,	%f26
	wr 	%g0, 	0x4, 	%fprs
	umulcc	%i7,	%l1,	%o2
	rdpr	%cleanwin,	%l4
	fmovscs	%icc,	%f14,	%f30
	wrpr	%o6,	%i6,	%pil
	fblg,a	%fcc1,	loop_533
	stbar

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	swap	[%l7 + 0x24],	%i1
loop_533:
	tge	%xcc,	0x3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x1B5, 	%hsys_tick_cmpr
	edge16l	%g4,	%o5,	%o7
	rd	%softint,	%l5
	wrpr	%i4,	0x0564,	%pil
	umulcc	%g1,	%l0,	%g2
	fmovdle	%icc,	%f9,	%f31
	srax	%o4,	0x18,	%g5
	wrpr	%i3,	%l2,	%cwp
	rd	%softint,	%l3
	wrpr	%g7,	0x0773,	%tick
	wrpr	%o1,	0x0777,	%cwp
	movpos	%icc,	%l6,	%i5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fabsd	%f24,	%f26
	bpos,a	%icc,	loop_534
	wr	%g3,	%i7,	%pic
	fmovsn	%icc,	%f15,	%f22
	ldsw	[%l7 + 0x0C],	%l1
loop_534:
	addcc	%i2,	%l4,	%o2
	ldstub	[%l7 + 0x1F],	%i6
	movg	%xcc,	%o0,	%i1
	rdpr	%tba,	%o6
	rd	%y,	%i0
	bge	%xcc,	loop_535
	wr	%g4,	%o7,	%y
	rdpr	%gl,	%o5
	rdpr	%otherwin,	%l5
loop_535:
	rdpr	%cansave,	%g1
	wrpr	%l0,	0x13B9,	%cwp
	sdivcc	%i4,	0x18DA,	%g2
	fmovrslz	%o4,	%f30,	%f10
	rd	%pc,	%g5
	tg	%xcc,	0x3
	wr	%l2,	0x0C51,	%set_softint
	set	0x5F, %l5
	lduba	[%l7 + %l5] 0x04,	%l3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	add	%l7,	0x10,	%l6
	wr	%g0,	0x04,	%asi
	lda	[%l6] %asi,	%o1
	casa	[%l6] 0x04,	%o1,	%g7
	bpos	%xcc,	loop_536
	edge8l	%l6,	%i5,	%o3
	taddcctv	%g6,	%g3,	%i7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xD92, 	%hsys_tick_cmpr
loop_536:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x23E, 	%hsys_tick_cmpr
	nop
	setx	loop_537,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movge	%icc,	%i6,	%i2
	fbue	%fcc1,	loop_538
	fmovrdlz	%i1,	%f24,	%f26
loop_537:
	wrpr	%o6,	0x1612,	%cwp
	fblg,a	%fcc3,	loop_539
loop_538:
	rdhpr	%hintp,	%i0
	wrpr	%g4,	0x1627,	%pil
	fpsub32s	%f18,	%f10,	%f8
loop_539:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	mulscc	%o5,	0x057D,	%o0
	fnor	%f28,	%f20,	%f2
	tle	%xcc,	0x2
	edge16	%g1,	%l5,	%l0
	fxnors	%f1,	%f22,	%f19
	tvc	%icc,	0x0
	wrpr	%i4,	0x0A24,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%wstate,	%g2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x5A8, 	%hsys_tick_cmpr
	rdhpr	%htba,	%i3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%softint,	%g5
	rd	%fprs,	%g7
	rd	%y,	%i5
	rdhpr	%hintp,	%l6
	ldsb	[%l7 + 0x65],	%o3
	rd	%tick_cmpr,	%g3
	taddcctv	%g6,	0x15C3,	%l1
	edge32ln	%i7,	%l4,	%i6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	rdpr	%pil,	%o6
	wrpr	%i0,	%i1,	%tick
	rd	%y,	%o7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	movge	%icc,	%o0,	%g1
	be,pt	%icc,	loop_540
	sdivx	%g4,	0x08A5,	%l0
	fcmpgt32	%f0,	%f28,	%l5
	xnor	%i4,	%o4,	%g2
loop_540:
	wrpr	%l2,	0x0E19,	%pil
	fornot1s	%f27,	%f31,	%f25
	rd	%asi,	%i3
	srlx	%o1,	0x10,	%g5
	rdpr	%cansave,	%g7
	tpos	%icc,	0x7
	rdpr	%cwp,	%l3
	rd	%tick_cmpr,	%l6
        wr    %g0,    0xe,    %pcr    ! changed.
	rd	%y,	%g3
	fone	%f24
	tgu	%xcc,	0x4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xA76, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%tba,	%l4
	prefetch	[%l7 + 0x08],	 0x3
	rd	%softint,	%i6
	fble	%fcc1,	loop_541
	andncc	%i2,	%o6,	%o2
	alignaddrl	%i1,	%o7,	%o5
	edge8n	%o0,	%g1,	%i0
loop_541:
	rdpr	%tba,	%g4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%asi,	%o4
	movl	%icc,	%g2,	%i4
	movg	%xcc,	%l2,	%o1
	tsubcc	%i3,	0x18EB,	%g7
	fbn	%fcc2,	loop_542
	or	%l3,	0x0407,	%g5
	rdpr	%cleanwin,	%l6
	rdpr	%cwp,	%i5
loop_542:
	sdiv	%g3,	0x0F23,	%l1
	wr	%o3,	%g6,	%clear_softint
	and	%i7,	0x18E3,	%i6
	rdpr	%otherwin,	%l4
	rdpr	%cansave,	%i2
	tcs	%icc,	0x3
	fandnot2	%f24,	%f2,	%f16
	udiv	%o2,	0x025A,	%i1
	rd	%softint,	%o7
	movrlz	%o6,	0x204,	%o5
	wrpr	%g1,	0x1BF4,	%pil
	movneg	%xcc,	%o0,	%g4
	rdhpr	%htba,	%l0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x8AA, 	%hsys_tick_cmpr
	tge	%icc,	0x5
	rd	%tick_cmpr,	%i0
	sethi	0x0974,	%g2
	sub	%i4,	0x0615,	%l2
	rd	%ccr,	%o4
	movcs	%xcc,	%i3,	%g7
	edge16	%o1,	%g5,	%l6
	wr	%i5,	%l3,	%ccr
	fmovd	%f2,	%f16
	fbue,a	%fcc0,	loop_543
	rdpr	%tba,	%l1
	rdpr	%cansave,	%o3
	fsrc1	%f10,	%f28
loop_543:
	srax	%g6,	0x01,	%g3
	fand	%f30,	%f24,	%f8
	movrlz	%i7,	0x33F,	%l4
	edge16	%i6,	%o2,	%i2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x882, 	%hsys_tick_cmpr
	wr	%o5,	0x147D,	%softint
	orn	%g1,	0x10EF,	%g4
	wrpr	%o0,	%l5,	%pil
        wr    %g0,    0xe,    %pcr    ! changed.
	wr	%g2,	%l2,	%set_softint
	wrpr	%i4,	0x0A9E,	%pil
	srlx	%o4,	%i3,	%o1
	orn	%g7,	%g5,	%l6
	wrpr	%i5,	%l3,	%cwp
	membar	#Sync
	set	0x40, %i4
	ldda	[%l7 + %i4] 0xf1,	%f0
	rdhpr	%hsys_tick_cmpr,	%l1
        wr    %g0,    0xe,    %pcr    ! changed.
	rdpr	%cwp,	%g3
	wr	%l4,	%i6,	%pic
	tcs	%xcc,	0x5
	andn	%i7,	%i2,	%o7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	ta	%xcc,	0x3
	sra	%i1,	%o5,	%g4
	rdpr	%cleanwin,	%g1
	movl	%icc,	%l5,	%o0
	rd	%sys_tick_cmpr,	%l0
	fmovdvs	%xcc,	%f30,	%f20
	rd	%fprs,	%i0
	umul	%g2,	0x1E1D,	%i4
	wr	%o4,	0x0AAD,	%set_softint
	edge16ln	%l2,	%o1,	%i3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xFC1, 	%hsys_tick_cmpr
	rd	%sys_tick_cmpr,	%l6
	bn,pn	%xcc,	loop_544
	rdhpr	%htba,	%g7
	movgu	%xcc,	%l3,	%i5
	wrpr	%l1,	0x0237,	%cwp
loop_544:
	wrpr	%g6,	%g3,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fmovrdne	%i6,	%f20,	%f30
	bge,pt	%icc,	loop_545
	wr	%i7,	%l4,	%pic
	wrpr	%o7,	%o2,	%pil
	wr	%i2,	%o6,	%softint
loop_545:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fmovdne	%xcc,	%f23,	%f25
	rdpr	%pil,	%g4
	umul	%g1,	%l5,	%o0
	rdpr	%canrestore,	%i0
	nop
	set	0x20, %i2
	ldd	[%l7 + %i2],	%l0
	fmovrdgez	%g2,	%f20,	%f18

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fbe,a	%fcc2,	loop_546
	rdpr	%gl,	%o1
	rdpr	%cansave,	%i3
	movgu	%icc,	%l2,	%l6
loop_546:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x513, 	%hsys_tick_cmpr
	rd	%tick_cmpr,	%l3
	wr	%g7,	0x1243,	%pic

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%pc,	%g3
	tg	%xcc,	0x2
	set	0x70, %l2
	lduwa	[%l7 + %l2] 0x81,	%i5
	fbge	%fcc2,	loop_547
	rd	%softint,	%o3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x0B6, 	%hsys_tick_cmpr
	array8	%i6,	%l4,	%o7
loop_547:
	rdpr	%otherwin,	%i2
	sub	%o6,	%o5,	%i1
	rd	%tick_cmpr,	%g4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x118, 	%hsys_tick_cmpr
	orncc	%o0,	0x02A4,	%i0
	fmovse	%xcc,	%f4,	%f7
	wr	%l0,	%g2,	%set_softint
	rd	%y,	%o4
	fblg,a	%fcc0,	loop_548
	sir	0x0946

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x954, 	%tick_cmpr
	wrpr	%o1,	%i3,	%cwp
loop_548:
	rd	%softint,	%l2
	tsubcctv	%l5,	0x1FC8,	%g5
	wrpr	%l3,	0x19CE,	%pil
	wrpr	%g7,	0x1DEE,	%pil
	rdpr	%gl,	%l1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x66C, 	%hsys_tick_cmpr
	rdpr	%cansave,	%i5
	edge8	%o3,	%i7,	%l6
	taddcctv	%i6,	0x0576,	%l4
	wr 	%g0, 	0x7, 	%fprs
	set	0x31, %g4
	ldsba	[%l7 + %g4] 0x89,	%i2
        wr    %g0,    0xe,    %pcr    ! changed.

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	tg	%icc,	0x1
	rdhpr	%htba,	%g4
	rdhpr	%hintp,	%o2
	rd	%pc,	%g1
	rd	%y,	%i0
	edge16ln	%l0,	%g2,	%o0
	addccc	%i4,	0x1436,	%o1
	rdpr	%pil,	%o4
	wr	%i3,	0x037A,	%set_softint
	rdpr	%cansave,	%l5
	wr	%g5,	0x1653,	%y
	rd	%y,	%l2
	fbe	%fcc0,	loop_549
	wr	%g7,	0x05FB,	%pic
	wrpr	%l3,	%g6,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_549:
	nop
	add	%l7,	0x38,	%l6
	wr	%g0,	0x18,	%asi
	ldxa	[%l6] %asi,	%i5
	casxa	[%l6] %asi,	%i5,	%o3
	bge	%xcc,	loop_550
	bl,a,pn	%icc,	loop_551
	subccc	%g3,	%l6,	%i7
	fornot2s	%f9,	%f10,	%f0
loop_550:
	addcc	%l4,	0x03E4,	%o7
loop_551:
	movvc	%xcc,	%i6,	%o6
	wr	%g0,	0x80,	%asi
	prefetcha	[%l7 + 0x48] %asi,	 0x3
	rdpr	%cansave,	%i1
	tpos	%xcc,	0x0
	xnor	%g4,	0x17DE,	%o2
	tleu	%icc,	0x5
	wr	%o5,	0x13D7,	%sys_tick
	add	%l7,	0x50,	%l6
	wr	%g0,	0x11,	%asi
	lda	[%l6] %asi,	%g1
	casa	[%l6] %asi,	%g1,	%l0
	rdpr	%wstate,	%g2
	rd	%ccr,	%i0
	rdpr	%tba,	%o0
	wr 	%g0, 	0x7, 	%fprs
	rd	%asi,	%o1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x3C2, 	%hsys_tick_cmpr
	wr	%i3,	%g5,	%softint
	fsrc2s	%f0,	%f29
	wr	%l2,	%g7,	%sys_tick
	wrpr	%l5,	%l3,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xDFF, 	%hsys_tick_cmpr
	wrpr	%l1,	0x1882,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%l6,	0x1DCC,	%pil
	rdhpr	%htba,	%o3
	sir	0x0DD1
	fbg,a	%fcc2,	loop_552
	stb	%i7,	[%l7 + 0x24]
	fornot1	%f0,	%f26,	%f8
	ldd	[%l7 + 0x30],	%f22
loop_552:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%ccr,	%o6
	wr 	%g0, 	0x7, 	%fprs
	fpsub16s	%f27,	%f11,	%f15
	wrpr	%g4,	0x150F,	%pil
	wrpr	%o2,	%i1,	%tick
	edge8	%o5,	%l0,	%g2
	wr	%i0,	%o0,	%y
	fble,a	%fcc2,	loop_553
	popc	0x1334,	%i4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x642, 	%hsys_tick_cmpr
	wrpr	%o4,	%i3,	%tick
loop_553:
	rd	%softint,	%g5
	rdpr	%cansave,	%g7
	wr	%l5,	0x065F,	%softint
	tne	%icc,	0x0
	edge32l	%l2,	%l3,	%g6
	wrpr	%i5,	%l1,	%cwp
	wr 	%g0, 	0x7, 	%fprs

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%g3,	0x1EEA,	%tick
	rd	%y,	%o7
	rdpr	%wstate,	%o6
	tl	%icc,	0x6
	wr	%g0,	0x80,	%asi
	lda	[%l7 + 0x68] %asi,	%f4
	movgu	%xcc,	%i6,	%i2
	rdpr	%canrestore,	%l4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%i1,	%o2,	%y
	rdhpr	%hintp,	%o5
	umulcc	%g2,	0x15E3,	%l0
	fmovdne	%icc,	%f7,	%f3
	addc	%o0,	%i4,	%i0
	movrne	%o1,	0x367,	%o4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xFFE, 	%hsys_tick_cmpr
	fbo	%fcc1,	loop_554
	fmovsge	%icc,	%f17,	%f17
	rdpr	%tba,	%g7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x8B1, 	%sys_tick_cmpr
loop_554:
	rdhpr	%htba,	%l3
	smul	%l5,	0x04B5,	%g6
	rdpr	%otherwin,	%l1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x6AF, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xA87, 	%hsys_tick_cmpr
	wrpr	%g3,	0x1808,	%pil
	sll	%o6,	%i6,	%o7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x16E, 	%hsys_tick_cmpr
	wrpr	%i1,	%i2,	%pil
	rdpr	%wstate,	%o5
	array16	%o2,	%l0,	%g2
	wr	%o0,	0x196E,	%set_softint
	wrpr	%i0,	0x110D,	%cwp
	wrpr	%o1,	0x10DA,	%tick
	rdhpr	%hintp,	%o4
	rdpr	%pil,	%g1
	fmuld8ulx16	%f18,	%f11,	%f20
	fmovsleu	%xcc,	%f29,	%f24
	rdpr	%canrestore,	%g5
	movcc	%xcc,	%i4,	%g7
	rdhpr	%hsys_tick_cmpr,	%i3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x3BD, 	%hsys_tick_cmpr
	fmovdvs	%icc,	%f16,	%f4
	wrpr	%l5,	%l3,	%cwp
	orn	%g6,	0x1A89,	%l6
	wrpr	%l1,	0x1C7F,	%tick
	rd	%softint,	%i7
	rdpr	%tl,	%i5
	edge8n	%g3,	%o6,	%i6
	rdpr	%canrestore,	%o3
	wrpr	%o7,	0x0C77,	%pil
	wr	%l4,	%i1,	%clear_softint
	rdhpr	%hpstate,	%g4
	wr	%i2,	%o5,	%y
	fmovsvc	%icc,	%f19,	%f22
	movne	%xcc,	%l0,	%g2
	rdhpr	%hpstate,	%o2
	fmovdcs	%icc,	%f22,	%f26
	movvc	%icc,	%i0,	%o0
	wrpr	%o1,	0x0B11,	%tick
	movge	%xcc,	%o4,	%g1
	rd	%sys_tick_cmpr,	%g5
	edge16ln	%g7,	%i4,	%i3
	wrpr	%l5,	%l3,	%cwp
	rdpr	%wstate,	%l2
	wr	%g0,	0x89,	%asi
	lduba	[%l7 + 0x6E] %asi,	%l6
	rdhpr	%hsys_tick_cmpr,	%l1
	sra	%i7,	0x09,	%i5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x67F, 	%sys_tick_cmpr
	wrpr	%o6,	%i6,	%pil
	rdpr	%wstate,	%o7
	rd	%tick_cmpr,	%l4
	lduw	[%l7 + 0x2C],	%o3
	wrpr	%i1,	0x1745,	%pil
	rdpr	%canrestore,	%g4
	rdpr	%cansave,	%o5
	wr	%g0,	0x19,	%asi
	swapa	[%l7 + 0x70] %asi,	%i2
	xorcc	%l0,	0x008F,	%g2
	rd	%asi,	%i0
	rd	%y,	%o2
	wr	%o1,	0x0830,	%set_softint

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x047, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%ccr,	%g5
	fba	%fcc3,	loop_555
	ba	%xcc,	loop_556
	edge8l	%g7,	%o4,	%i3
	rdhpr	%htba,	%i4
loop_555:
	fpack16	%f22,	%f30
loop_556:
	stw	%l3,	[%l7 + 0x74]

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xC9A, 	%hsys_tick_cmpr
	movrlz	%l5,	%l6,	%i7
	rd	%y,	%i5
	wr	%g6,	%g3,	%set_softint

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xCF3, 	%sys_tick_cmpr
	rdhpr	%hintp,	%o7
	tneg	%icc,	0x0
	subc	%i6,	0x0FA7,	%l4
	movge	%icc,	%i1,	%o3
	swap	[%l7 + 0x64],	%g4
	orn	%o5,	%i2,	%l0
	wr	%g2,	%i0,	%y
	rdhpr	%hsys_tick_cmpr,	%o1
	movneg	%xcc,	%o0,	%g1
	edge16l	%g5,	%g7,	%o4
	brz,a	%o2,	loop_557
	tcc	%xcc,	0x6
	call	loop_558
	rd	%fprs,	%i3
loop_557:
	fsrc1s	%f2,	%f6
	fmovrdlz	%l3,	%f20,	%f24
loop_558:
	udiv	%l2,	0x0BDA,	%i4
	wr	%l6,	0x1BAE,	%softint
        wr    %g0,    0xe,    %pcr    ! changed.
	popc	%i5,	%g6
	fmovda	%xcc,	%f12,	%f8
	edge16n	%g3,	%l1,	%i7
	rdhpr	%hsys_tick_cmpr,	%o6
	tne	%icc,	0x5
	wrpr	%i6,	0x04D9,	%cwp
	rdhpr	%hpstate,	%o7
        wr    %g0,    0xe,    %pcr    ! changed.
	rdhpr	%htba,	%i1
	rd	%tick_cmpr,	%g4
	ldd	[%l7 + 0x40],	%f24

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x71A, 	%hsys_tick_cmpr
	mulscc	%i2,	0x1250,	%i0
	rdhpr	%hintp,	%g2
	rd	%pc,	%o0
	fnor	%f18,	%f8,	%f16
	srlx	%o1,	%g5,	%g7
	set	0x30, %l4
	stxa	%o4,	[%l7 + %l4] 0x18
	wrpr	%g1,	0x0309,	%cwp
	rd	%pc,	%i3
	std	%f24,	[%l7 + 0x08]
	stw	%o2,	[%l7 + 0x48]
	rd	%asi,	%l2
	udivx	%l3,	0x1718,	%i4
	rdhpr	%hintp,	%l6
	rd	%ccr,	%l5
	wr	%i5,	0x08FC,	%pic
	wrpr	%g3,	%l1,	%tick
	movge	%icc,	%g6,	%o6
	tgu	%icc,	0x3
	rd	%asi,	%i6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x50E, 	%hsys_tick_cmpr
	wr	%o7,	0x0AE1,	%sys_tick
	fexpand	%f10,	%f8
	array16	%o3,	%i1,	%g4
	rd	%fprs,	%l4
	rd	%softint,	%l0
	wr	%o5,	0x1DE1,	%set_softint
	rdpr	%cansave,	%i2
	rdpr	%canrestore,	%i0
	rd	%y,	%o0
	wr	%o1,	%g5,	%clear_softint
	wrpr	%g7,	0x0AC2,	%cwp
	rd	%asi,	%o4
	bneg,a,pn	%xcc,	loop_559
	fpack32	%f26,	%f24,	%f22
	std	%f22,	[%l7 + 0x20]
	wr	%g2,	%i3,	%sys_tick
loop_559:
	fpsub16s	%f24,	%f17,	%f20
	movgu	%xcc,	%o2,	%l2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x0CF, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	umul	%l6,	0x06BF,	%i5
	rdpr	%pil,	%g3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x2E8, 	%hsys_tick_cmpr
	rd	%tick_cmpr,	%i7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x585, 	%hsys_tick_cmpr
	rdhpr	%hintp,	%i6
	srl	%o3,	%i1,	%g4
	rdpr	%otherwin,	%l4
	ldub	[%l7 + 0x1B],	%l0
	wr	%i2,	0x079D,	%softint

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x1F8, 	%hsys_tick_cmpr
	rd	%asi,	%o5
	wr	%o1,	0x1F4C,	%ccr
	wrpr	%o0,	0x0FEC,	%tick
	fmovdl	%xcc,	%f15,	%f11
	fmovrse	%g7,	%f14,	%f19
	tneg	%icc,	0x4
	rd	%softint,	%g5
	rdhpr	%hintp,	%g2
	smulcc	%o4,	0x1BBA,	%i3
	rd	%asi,	%o2
	rdhpr	%htba,	%g1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xBA3, 	%hsys_tick_cmpr
	wrpr	%i4,	%l3,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x4A1, 	%hsys_tick_cmpr
	fmovdcc	%xcc,	%f16,	%f1
	rdhpr	%htba,	%g3
	rdhpr	%htba,	%i5
	rdhpr	%hpstate,	%l1
	wrpr	%l5,	%g6,	%tick
	rdhpr	%hsys_tick_cmpr,	%i7
	rdhpr	%hintp,	%o6
	smulcc	%i6,	0x0952,	%o7
	stbar
	wr	%o3,	%g4,	%softint
	rd	%fprs,	%l4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x032, 	%hsys_tick_cmpr
	fnot2s	%f10,	%f24
	wrpr	%i0,	%o5,	%tick
	wrpr	%o1,	0x19D5,	%tick
	rd	%sys_tick_cmpr,	%i2
	rdhpr	%hpstate,	%g7
	srl	%o0,	%g5,	%o4
	rdpr	%tba,	%g2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fmovdne	%xcc,	%f1,	%f5
	sir	0x0D1E
	rd	%ccr,	%o2
	tg	%xcc,	0x4
	movcc	%xcc,	%l2,	%i4
	fpadd32	%f26,	%f16,	%f8
	wrpr	%l3,	%l6,	%cwp
	rd	%asi,	%g3
	fpsub16	%f30,	%f0,	%f22
	rdhpr	%htba,	%i5
	edge16ln	%l5,	%l1,	%i7
	bgu,pt	%xcc,	loop_560
	wr	%o6,	0x0520,	%pic

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%htba,	%o3
loop_560:
	rd	%pc,	%g4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xD62, 	%hsys_tick_cmpr
	rdpr	%wstate,	%l0
	subc	%i1,	%i0,	%l4
	rdhpr	%hpstate,	%o5
	wr	%i2,	%g7,	%pic

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x528, 	%tick_cmpr
	bvc,a,pn	%xcc,	loop_561
	rdpr	%gl,	%o4
	rd	%pc,	%g2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_561:
	wrpr	%g1,	0x085A,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x191, 	%sys_tick_cmpr
	and	%l2,	%o2,	%l3
	edge32n	%l6,	%g3,	%i4
	tgu	%icc,	0x0
	rdpr	%gl,	%l5
	wr	%i5,	%l1,	%y
	rdhpr	%hsys_tick_cmpr,	%i7
	wr	%o6,	0x0A6A,	%softint
	fnors	%f4,	%f16,	%f19
	rdpr	%canrestore,	%o7
	tn	%icc,	0x6
	edge32l	%o3,	%i6,	%g4
	xnor	%l0,	0x1730,	%g6
	fmovrsgz	%i1,	%f25,	%f27
	wr	%l4,	%o5,	%sys_tick
	movcs	%icc,	%i2,	%g7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x956, 	%sys_tick_cmpr
	rdpr	%canrestore,	%g5
	fpmerge	%f11,	%f17,	%f6
	fors	%f4,	%f30,	%f5
	fmovrslez	%g2,	%f21,	%f7
	alignaddr	%o0,	%g1,	%i3
	xor	%o4,	%o2,	%l2
	wrpr	%l3,	0x0E6F,	%pil
	smulcc	%g3,	0x122D,	%i4
	wrpr	%l6,	%l5,	%pil
	smulcc	%i5,	0x1B1A,	%i7
	ldsw	[%l7 + 0x2C],	%o6
	xnor	%l1,	0x16B8,	%o7
	fbuge,a	%fcc0,	loop_562
	rd	%pc,	%i6
	fmovrdgz	%o3,	%f30,	%f16
	fbul,a	%fcc2,	loop_563
loop_562:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x40, %l3
	stda	%f16,	[%l7 + %l3] 0xdb
loop_563:
	wrpr	%l0,	0x1739,	%pil
	movrlez	%g6,	0x1C7,	%g4
	rdpr	%cwp,	%i1
	wr 	%g0, 	0x4, 	%fprs
	rdpr	%wstate,	%i2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xB52, 	%hsys_tick_cmpr
	rd	%fprs,	%o1
	wr	%i0,	0x044A,	%ccr
	andcc	%g2,	%o0,	%g5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x39C, 	%hsys_tick_cmpr
	orncc	%o2,	%o4,	%l3
	wr	%l2,	0x0BE1,	%ccr
	rd	%fprs,	%g3
	tgu	%icc,	0x1
	fmovrslez	%l6,	%f12,	%f29
	bne,a,pt	%xcc,	loop_564
	wrpr	%i4,	%i5,	%cwp
	wr	%g0,	0x04,	%asi
	stba	%i7,	[%l7 + 0x79] %asi
loop_564:
	fmovsl	%xcc,	%f11,	%f17
	rd	%y,	%o6
	rdhpr	%htba,	%l1
	smul	%o7,	%l5,	%i6
	rd	%softint,	%l0
	nop
	setx loop_565, %l0, %l1
	jmpl %l1, %o3
	movcc	%icc,	%g4,	%g6
	set	0x40, %o5
	prefetcha	[%l7 + %o5] 0x89,	 0x2
loop_565:
	rdpr	%cwp,	%i1
	rd	%asi,	%i2
	swap	[%l7 + 0x0C],	%o5
	wr	%g7,	%o1,	%pic
	fpsub32s	%f21,	%f16,	%f24

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%g2,	0x0ABC,	%clear_softint

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%ccr,	%g1
	wr	%i3,	0x0A04,	%y
	brgez	%o2,	loop_566
	rd	%sys_tick_cmpr,	%l3
	sll	%o4,	%l2,	%g3
	andn	%i4,	%i5,	%l6
loop_566:
	rdpr	%tl,	%i7
	rdhpr	%htba,	%l1
	xnor	%o6,	%o7,	%l5
	rdhpr	%hintp,	%i6
	set	0x79, %l1
	ldsba	[%l7 + %l1] 0x81,	%o3
	edge32ln	%g4,	%g6,	%l0
	wr	%g0,	0x80,	%asi
	sta	%f31,	[%l7 + 0x54] %asi
	wr 	%g0, 	0x5, 	%fprs
	fnands	%f30,	%f29,	%f28
	wrpr	%l4,	0x1826,	%pil
	move	%xcc,	%o5,	%o1
	fpack32	%f0,	%f8,	%f10
	movrgz	%g7,	0x174,	%i0
	wrpr	%g2,	0x0FC5,	%cwp
	fmovde	%xcc,	%f3,	%f22
	fbul,a	%fcc2,	loop_567
	rdpr	%gl,	%g5
	popc	%o0,	%g1
	wr	%g0,	0x89,	%asi
	ldsha	[%l7 + 0x2C] %asi,	%o2
loop_567:
	fornot1s	%f22,	%f27,	%f5
	tle	%xcc,	0x7
	rdhpr	%hintp,	%l3
	rdhpr	%htba,	%i3
	fmovsg	%xcc,	%f1,	%f25

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xD48, 	%hsys_tick_cmpr
	rdpr	%cwp,	%g3
	fbge	%fcc1,	loop_568
	rdhpr	%htba,	%o4
	te	%xcc,	0x1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x9FD, 	%hsys_tick_cmpr
loop_568:
	wrpr	%l6,	0x03BD,	%tick
	rd	%fprs,	%i7
	wr	%i4,	0x176C,	%y

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%l1,	%i6,	%tick
	movge	%xcc,	%o3,	%g4
	movl	%icc,	%l5,	%g6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x62D, 	%tick_cmpr
	movvc	%icc,	%i1,	%o5
	wrpr	%l4,	%o1,	%tick
	movrgez	%i0,	%g2,	%g5
	rdpr	%cansave,	%g7
	rdhpr	%hsys_tick_cmpr,	%o0
	fmovdcs	%icc,	%f31,	%f14
	sir	0x0C7E
	fmuld8ulx16	%f31,	%f21,	%f16
	rd	%y,	%o2
	rd	%y,	%g1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xB87, 	%hsys_tick_cmpr
	rd	%y,	%i3
	sdivx	%g3,	0x10B6,	%i5
	rdpr	%canrestore,	%o4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%hpstate,	%i4
	wrpr	%i7,	0x0F7E,	%pil
	move	%icc,	%o7,	%l1
	rdhpr	%htba,	%i6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xC80, 	%hsys_tick_cmpr
	wr	%l5,	%o6,	%softint
	rdpr	%pil,	%l0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xD69, 	%hsys_tick_cmpr
	rd	%fprs,	%i1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x1CC, 	%hsys_tick_cmpr
	srlx	%l4,	%i0,	%g5
	rdpr	%cansave,	%g2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fmovdleu	%xcc,	%f0,	%f23
	tneg	%icc,	0x1
	rdpr	%otherwin,	%o0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xFF8, 	%hsys_tick_cmpr
	rdpr	%gl,	%l3
	edge8n	%i3,	%l2,	%g3
	call	loop_569
	udiv	%i5,	0x1D8A,	%l6
	rdpr	%gl,	%i4
	rdhpr	%hsys_tick_cmpr,	%i7
loop_569:
	edge8l	%o7,	%o4,	%i6
	set	0x20, %o3
	sta	%f23,	[%l7 + %o3] 0x10
	mulscc	%l1,	%o3,	%g4
	wr	%l5,	0x185B,	%clear_softint
	rdpr	%pil,	%o6
	rdhpr	%hsys_tick_cmpr,	%l0
	rd	%softint,	%i2
	flush	%l7 + 0x20
	and	%i1,	%o5,	%g6
	rdpr	%cwp,	%l4
	rdpr	%tl,	%i0
	rdpr	%wstate,	%g5
	rdhpr	%hpstate,	%g2
	rd	%fprs,	%o1
	tvc	%xcc,	0x2
	fbe	%fcc3,	loop_570
	rdpr	%wstate,	%o0
	wrpr	%g7,	0x0EBC,	%cwp
	rdpr	%tba,	%o2
loop_570:
	flush	%l7 + 0x40
	movvs	%xcc,	%g1,	%l3
	set	0x40, %g2
	stda	%f0,	[%l7 + %g2] 0x11
	rd	%tick_cmpr,	%l2
	ta	%xcc,	0x6
	popc	0x15C3,	%g3
	fabss	%f31,	%f21
	rdhpr	%htba,	%i3
	fmovda	%xcc,	%f19,	%f4
	rdpr	%cwp,	%l6
	wr	%i4,	%i5,	%pic
	rdhpr	%htba,	%i7
	wrpr	%o4,	%i6,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x7B1, 	%sys_tick_cmpr
	fmovrse	%l1,	%f17,	%f24

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xC73, 	%hsys_tick_cmpr
	smulcc	%o6,	%o3,	%i2
	rd	%pc,	%l0
	fbul,a	%fcc3,	loop_571
	fcmple16	%f12,	%f30,	%i1
	bleu,pt	%icc,	loop_572
	wr 	%g0, 	0x5, 	%fprs
loop_571:
	wr	%o5,	0x1229,	%y
	rd	%tick_cmpr,	%i0
loop_572:
	move	%icc,	%g5,	%g2
	rdhpr	%hpstate,	%l4
	wrpr	%o0,	%o1,	%cwp
	wr	%g0,	0x23,	%asi
	stba	%g7,	[%l7 + 0x28] %asi
	membar	#Sync
	rdhpr	%hsys_tick_cmpr,	%o2
	stb	%g1,	[%l7 + 0x19]
	wr	%l3,	%l2,	%softint
	rd	%y,	%i3
	bgu,a,pn	%xcc,	loop_573
	srl	%g3,	%i4,	%l6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	smul	%o4,	0x065B,	%o7
loop_573:
	wr	%l1,	0x121A,	%set_softint
	movge	%icc,	%i6,	%g4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x077, 	%hsys_tick_cmpr
	rdhpr	%hsys_tick_cmpr,	%i2
	mulscc	%l0,	0x0C15,	%i1
	rdhpr	%hpstate,	%g6
	tl	%xcc,	0x6
	wrpr	%o5,	%l5,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%g2,	0x0C8C,	%cwp
	rd	%fprs,	%l4
	wrpr	%g5,	0x03AA,	%cwp
	xnor	%o1,	%g7,	%o2
	rdpr	%pil,	%o0
	tsubcctv	%l3,	%g1,	%i3
	rdpr	%canrestore,	%l2
	wrpr	%g3,	0x196F,	%tick
	fpack32	%f6,	%f24,	%f18
	wrpr	%i4,	%i7,	%cwp
	rd	%ccr,	%i5
	rdhpr	%htba,	%l6
	rd	%y,	%o7
	rdhpr	%hsys_tick_cmpr,	%o4
	subc	%l1,	0x09E3,	%i6
	wr	%o6,	0x0232,	%sys_tick
	rdhpr	%hintp,	%o3
	fmovrdne	%g4,	%f4,	%f2
	wrpr	%i2,	0x00C8,	%tick
	add	%l7,	0x08,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%i1
	casxa	[%l6] %asi,	%i1,	%l0
	set	0x70, %o6
	ldda	[%l7 + %o6] 0x14,	%g6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%l5,	0x0E7D,	%set_softint
	fcmps	%fcc1,	%f0,	%f6
	fmovse	%icc,	%f5,	%f2
	fbue,a	%fcc0,	loop_574
	or	%i0,	%l4,	%g5
	wr	%o1,	0x0068,	%pic
	mulscc	%g2,	0x16AD,	%o2
loop_574:
	edge16n	%o0,	%l3,	%g7
	rd	%y,	%i3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	orcc	%g3,	0x1718,	%g1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tsubcctv	%i7,	0x0E97,	%i4
	rd	%sys_tick_cmpr,	%l6
	fmovsn	%icc,	%f10,	%f26
	bleu,a,pn	%icc,	loop_575
	ldsw	[%l7 + 0x64],	%i5
	udiv	%o7,	0x060E,	%o4
	ldd	[%l7 + 0x08],	%f22
loop_575:
	ldsb	[%l7 + 0x6F],	%i6
	set	0x54, %i0
	lda	[%l7 + %i0] 0x04,	%f29
	popc	%o6,	%o3
	smul	%g4,	%l1,	%i1
	set	0x30, %i5
	ldswa	[%l7 + %i5] 0x0c,	%i2
	fbul,a	%fcc3,	loop_576
	fmovrslz	%l0,	%f14,	%f0
	rdhpr	%htba,	%g6
	rd	%fprs,	%o5
loop_576:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xC54, 	%hsys_tick_cmpr
	wrpr	%i0,	0x1EE6,	%tick
	rdhpr	%hpstate,	%g5
	rdpr	%pil,	%o1
	rdhpr	%hpstate,	%g2
	bge	loop_577
	fmovsle	%xcc,	%f12,	%f3
	rd	%pc,	%o2
	fcmpne32	%f20,	%f20,	%l4
loop_577:
	rd	%y,	%l3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%canrestore,	%o0
	rdhpr	%htba,	%l2
	wrpr	%i3,	0x12A3,	%cwp
	rd	%pc,	%g1
	rdhpr	%hsys_tick_cmpr,	%g3
	wrpr	%i4,	0x02CB,	%cwp
	wr	%i7,	0x0D42,	%y
	rdhpr	%hsys_tick_cmpr,	%i5
	rd	%y,	%l6
	movpos	%xcc,	%o7,	%i6
	ldsw	[%l7 + 0x20],	%o6
	wrpr	%o3,	0x0C86,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	ble,a,pt	%icc,	loop_578
	wr	%l1,	%i1,	%sys_tick
	rdhpr	%hsys_tick_cmpr,	%l0
	wrpr	%i2,	0x17F3,	%cwp
loop_578:
	rdpr	%pil,	%o5
	wr	%g0,	0x04,	%asi
	ldda	[%l7 + 0x20] %asi,	%g6
!Yo - got one - imm_asi 0x40 
!And yo - immediate is 0x320
	set	0x320, %g5
	nop 	! 	stxa	%i0,	[%g0 + %g5] 0x40 ripped by fixASI40.pl

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%g2,	0x1ED6,	%cwp
	tl	%xcc,	0x2
	rd	%pc,	%o2
	rdpr	%tba,	%l4
	fpack16	%f6,	%f9
	xnor	%l3,	0x144A,	%l5
	wr	%g0,	0x04,	%asi
	lda	[%l7 + 0x58] %asi,	%f29
	rd	%softint,	%g7
	wrpr	%o0,	%i3,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	udivx	%i4,	0x1145,	%g1
	add	%i7,	%i5,	%l6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x6F2, 	%hsys_tick_cmpr
	rdhpr	%hpstate,	%o6
	fbo	%fcc2,	loop_579
	rdhpr	%hpstate,	%o3
	rdpr	%tba,	%o7
	membar	0x4E
loop_579:
	wrpr	%o4,	0x0F53,	%cwp
	alignaddrl	%g4,	%i1,	%l1
	wr	%i2,	%l0,	%clear_softint
	sdivx	%g6,	0x02DE,	%o5
	edge32n	%i0,	%o1,	%g2
	fmovsa	%xcc,	%f24,	%f21
	rdhpr	%htba,	%g5
	wrpr	%l4,	0x0C2E,	%cwp
	rdpr	%tba,	%o2
	wrpr	%l3,	0x05CA,	%tick
	rd	%tick_cmpr,	%g7
	rdpr	%cwp,	%o0
	set	0x10, %o7
	ldda	[%l7 + %o7] 0x0c,	%i2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%ccr,	%l5
	add	%i4,	0x1092,	%i7
	te	%icc,	0x4
	edge16l	%g1,	%i5,	%i6
	lduw	[%l7 + 0x20],	%o6
	prefetch	[%l7 + 0x3C],	 0x2
	fornot1	%f6,	%f30,	%f24
	rdpr	%pil,	%o3
	edge8n	%o7,	%l6,	%g4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x146, 	%hsys_tick_cmpr
	wr	%g0,	0x88,	%asi
	stha	%l0,	[%l7 + 0x1E] %asi

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%hsys_tick_cmpr,	%g6
	rdpr	%gl,	%o1
	call	loop_580
	rd	%ccr,	%i0
	rd	%ccr,	%g5
	nop
	setx	loop_581,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_580:
	rd	%tick_cmpr,	%l4
	set	0x74, %i7
	lda	[%l7 + %i7] 0x80,	%f20
loop_581:
	movn	%icc,	%g2,	%l3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	nop
	setx	loop_582,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	rdhpr	%hpstate,	%g7
	bshuffle	%f18,	%f4,	%f20
	edge16ln	%i3,	%l2,	%g3
loop_582:
	wrpr	%o0,	%l5,	%tick
	rdhpr	%htba,	%i7
	wr	%i4,	0x122A,	%ccr
	addccc	%i5,	%i6,	%o6
	rd	%asi,	%g1
	movrgz	%o7,	0x1B7,	%o3
	rdhpr	%hintp,	%l6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x843, 	%hsys_tick_cmpr
	rd	%sys_tick_cmpr,	%i1
	alignaddrl	%o4,	%l0,	%l1
	wrpr	%o5,	0x1C9C,	%cwp
	rdpr	%canrestore,	%g6
	rd	%ccr,	%o1
	rdpr	%cansave,	%i0
	subc	%g5,	0x1102,	%l4
	addccc	%i2,	%l3,	%o2
	nop
	setx	loop_583,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tneg	%xcc,	0x2
	rdpr	%otherwin,	%g7
	rd	%pc,	%g2
loop_583:
	wr	%l2,	0x1CEE,	%ccr
	movrlz	%g3,	%o0,	%l5
	edge8ln	%i3,	%i4,	%i5
	rd	%asi,	%i7
	rdhpr	%hintp,	%i6
	xnor	%o6,	%o7,	%g1
	wrpr	%o3,	0x0CE7,	%pil
	rdhpr	%hintp,	%g4
	movvs	%icc,	%i1,	%l6
	fbu	%fcc1,	loop_584
	rd	%asi,	%o4
	xor	%l0,	0x1C04,	%o5
	edge16l	%l1,	%g6,	%o1
loop_584:
	bne,pt	%icc,	loop_585
	fbe,a	%fcc1,	loop_586
	wr	%g5,	0x096F,	%sys_tick
	wrpr	%i0,	0x0622,	%pil
loop_585:
	wrpr	%i2,	0x177E,	%tick
loop_586:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x329, 	%hsys_tick_cmpr
	wr	%l3,	%g7,	%sys_tick
	rdhpr	%hpstate,	%o2
	rd	%softint,	%g2
	fbo,a	%fcc1,	loop_587
	wrpr	%g3,	0x1CEE,	%pil
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpsub16s	%f16,	%f5,	%f2
loop_587:
	fxors	%f24,	%f2,	%f26
	popc	%l2,	%l5
	wr	%g0,	0xd2,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	tn	%icc,	0x7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x873, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xC78, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x30A, 	%hsys_tick_cmpr
	fnors	%f25,	%f28,	%f26
	fbn	%fcc3,	loop_588
	wrpr	%i7,	0x0D07,	%tick
	rdhpr	%hsys_tick_cmpr,	%i6
	movrlz	%o7,	%g1,	%o3
loop_588:
	addccc	%g4,	%i1,	%o6
	fzero	%f26
	sdivcc	%l6,	0x198E,	%l0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	brnz,a	%g6,	loop_589
	wr 	%g0, 	0x5, 	%fprs
	sethi	0x1BF9,	%o5
	umul	%i0,	%g5,	%i2
loop_589:
	tl	%icc,	0x1
	wrpr	%l3,	%g7,	%tick
	rd	%fprs,	%l4
	wr	%g2,	0x02A9,	%ccr
	srlx	%g3,	0x11,	%o2
	wr	%l2,	%o0,	%set_softint
	movleu	%xcc,	%i4,	%l5
	wr	%g0,	0xf8,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
	rdhpr	%htba,	%i5
	fbge,a	%fcc3,	loop_590
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	rd	%fprs,	%i3
	rd	%ccr,	%i6
loop_590:
	rd	%tick_cmpr,	%o7
	fmovsa	%icc,	%f30,	%f1
	edge32n	%g1,	%o3,	%g4
	call	loop_591
	bgu,a,pn	%icc,	loop_592
	wrpr	%i7,	0x190E,	%tick
	movle	%icc,	%i1,	%o6
loop_591:
	rd	%ccr,	%l0
loop_592:
	alignaddrl	%l6,	%l1,	%g6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	add	%l7,	0x24,	%l6
	wr	%g0,	0x0c,	%asi
	casa	[%l6] %asi,	%o5,	%i0
	movrgez	%g5,	%o1,	%l3
	rd	%pc,	%i2
	wr	%g0,	0x19,	%asi
	sta	%f0,	[%l7 + 0x18] %asi

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xC66, 	%sys_tick_cmpr
	rdhpr	%hintp,	%l2
	wrpr	%g2,	0x0D6C,	%pil
	sdivcc	%i4,	0x0189,	%l5
	sethi	0x0D71,	%o0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x83D, 	%hsys_tick_cmpr
	wr	%i6,	0x081A,	%y
	tge	%xcc,	0x3
	rdpr	%canrestore,	%o7
!Yo - got one - imm_asi 0x40 
!And yo - immediate is 0x168
	set	0x168, %l6
	nop 	! 	stxa	%g1,	[%g0 + %l6] 0x40 ripped by fixASI40.pl
	smulcc	%o3,	%i5,	%i7
	fbu	%fcc2,	loop_593
	udivx	%g4,	0x0FDA,	%i1
	wr	%l0,	%l6,	%softint
	rdpr	%otherwin,	%o6
loop_593:
	edge16ln	%g6,	%o4,	%l1
	rdpr	%cwp,	%o5
	rdhpr	%hsys_tick_cmpr,	%g5
	fbe	%fcc0,	loop_594
	fands	%f26,	%f25,	%f22
	sdivcc	%i0,	0x1C96,	%l3
	rd	%ccr,	%o1
loop_594:
	rd	%asi,	%g7
	wrpr	%l4,	%i2,	%cwp
	membar	0x73
	rdpr	%cansave,	%g3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x49E, 	%hsys_tick_cmpr
	rdhpr	%hintp,	%g2
	wrpr	%i4,	%l5,	%tick
	add	%o0,	%o2,	%i6
	rdpr	%wstate,	%o7
	rdpr	%tl,	%i3
	rd	%sys_tick_cmpr,	%g1
	rdhpr	%htba,	%i5
	fcmpgt16	%f6,	%f28,	%i7
	rd	%sys_tick_cmpr,	%o3
	smulcc	%i1,	0x0DFF,	%l0
	rdpr	%canrestore,	%g4
	rdhpr	%htba,	%l6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x893, 	%hsys_tick_cmpr
	subccc	%g6,	0x152C,	%o4
	edge16	%l1,	%o5,	%i0
	wr 	%g0, 	0x5, 	%fprs
	rd	%softint,	%g7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	wrpr	%g3,	%i2,	%tick
	tvc	%icc,	0x0
	rdhpr	%hpstate,	%l2
	movgu	%icc,	%i4,	%g2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x77A, 	%tick_cmpr
	rd	%y,	%o0
	rdhpr	%hintp,	%i6
	rdhpr	%hintp,	%o7
	movvc	%xcc,	%i3,	%i5
	umul	%g1,	%o3,	%i7
	rdhpr	%hpstate,	%i1
	fpadd32	%f0,	%f6,	%f2
	fmovrsgez	%g4,	%f3,	%f18
	taddcc	%l0,	%o6,	%l6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x64A, 	%hsys_tick_cmpr
	fsrc1s	%f27,	%f19
	subc	%g6,	0x1272,	%o5
	fmovrdgez	%l1,	%f2,	%f16
	siam	0x7
	rdhpr	%hintp,	%i0
	wr	%g0,	0x18,	%asi
	sta	%f29,	[%l7 + 0x4C] %asi
	wr	%g0,	0x89,	%asi
	lduba	[%l7 + 0x7E] %asi,	%o1
	tcs	%icc,	0x7
	movpos	%icc,	%l3,	%g5
	rdpr	%tba,	%l4
	rd	%tick_cmpr,	%g3
	wr	%i2,	%g7,	%softint
	wr	%i4,	0x15DF,	%y
	wr	%g2,	0x1BE8,	%pic
	rdpr	%otherwin,	%l5
	for	%f6,	%f30,	%f26
	rd	%asi,	%l2
	wrpr	%o2,	%o0,	%tick
	wrpr	%o7,	%i6,	%cwp
	rdhpr	%htba,	%i3
	sdiv	%g1,	0x148C,	%o3
	alignaddrl	%i7,	%i1,	%i5
	rdpr	%cwp,	%g4
	wr	%o6,	%l0,	%sys_tick
	fbn,a	%fcc1,	loop_595
	edge8l	%o4,	%l6,	%g6
	rdpr	%canrestore,	%l1
	srlx	%o5,	0x0A,	%o1
loop_595:
	nop
	wr	%g0,	0x10,	%asi
	stha	%l3,	[%l7 + 0x7E] %asi
	rdpr	%otherwin,	%g5
	rdpr	%cwp,	%l4
	wrpr	%g3,	0x0300,	%pil
	wrpr	%i2,	%i0,	%tick
	orcc	%g7,	%g2,	%l5
	rd	%softint,	%l2
	tleu	%xcc,	0x3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	rdhpr	%htba,	%o2
	rdpr	%tba,	%o0
	rd	%fprs,	%o7
	wrpr	%i6,	%i3,	%cwp
	rdpr	%gl,	%g1
	orn	%i4,	%o3,	%i7
	movrlez	%i1,	%i5,	%g4
	array8	%l0,	%o6,	%o4
        wr    %g0,    0xe,    %pcr    ! changed.
	rdpr	%tba,	%o5
	rdhpr	%hintp,	%l1
!Yo - got one - imm_asi 0x50 
!And yo - immediate is 0x00
	wr	%g0,	0x50,	%asi
	ldxa	[%g0 + 0x00] %asi,	%l3
	bneg,pt	%xcc,	loop_596
	mulx	%g5,	%l4,	%g3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x875, 	%hsys_tick_cmpr
	fmovdge	%icc,	%f5,	%f7
loop_596:
	wrpr	%g7,	%i2,	%pil
	mova	%xcc,	%g2,	%l2
	rdpr	%canrestore,	%o2
	wrpr	%l5,	0x00E3,	%pil
	tg	%xcc,	0x4
	fsrc1s	%f16,	%f11
	and	%o0,	0x004E,	%i6
	tleu	%xcc,	0x5
	rd	%tick_cmpr,	%o7
	lduh	[%l7 + 0x6A],	%g1
	fba	%fcc1,	loop_597
	rdhpr	%hpstate,	%i4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x4EA, 	%hsys_tick_cmpr
	fmovscs	%xcc,	%f18,	%f23
loop_597:
	rd	%y,	%i7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%cwp,	%g4
	fmovrsne	%i3,	%f30,	%f5
	rdhpr	%hpstate,	%l0
	be,pt	%icc,	loop_598
	rd	%sys_tick_cmpr,	%o6
	edge32ln	%l6,	%o4,	%o5
	rdhpr	%hpstate,	%l1
loop_598:
	rdhpr	%hsys_tick_cmpr,	%l3
	fmovsvs	%xcc,	%f25,	%f31

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fandnot1s	%f28,	%f4,	%f30
	movg	%icc,	%g6,	%l4
	rd	%asi,	%o1
	rdpr	%canrestore,	%g3
	wrpr	%i0,	%g7,	%pil
	flush	%l7 + 0x24
	rdpr	%tba,	%g2
	movcs	%xcc,	%l2,	%o2
	rdhpr	%hsys_tick_cmpr,	%i2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%o7,	%o0,	%tick
	wrpr	%g1,	%o3,	%pil
	rdhpr	%hintp,	%i4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x8B2, 	%sys_tick_cmpr
	taddcctv	%g4,	0x0BB6,	%i3
	wrpr	%l0,	%o6,	%tick
	mulx	%i7,	%l6,	%o5
	wrpr	%l1,	0x085B,	%pil
	rdpr	%wstate,	%l3
	set	0x48, %g3
	stxa	%g5,	[%l7 + %g3] 0x19
	edge32ln	%o4,	%g6,	%l4
	tneg	%xcc,	0x4
	fxors	%f15,	%f1,	%f18
	rdhpr	%htba,	%g3
	wrpr	%i0,	0x18BA,	%cwp
	brlez	%g7,	loop_599
	wrpr	%g2,	0x17B0,	%cwp
	wrpr	%o1,	0x1865,	%tick
	wrpr	%l2,	0x10D4,	%tick
loop_599:
	nop
	set	0x40, %g7
	ldda	[%l7 + %g7] 0xd3,	%f0
	rdhpr	%htba,	%o2
	edge32n	%i2,	%i6,	%o7
	rdhpr	%htba,	%o0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%htba,	%g1
	orncc	%i4,	0x0C4E,	%o3
	set	0x20, %o2
	prefetcha	[%l7 + %o2] 0x81,	 0x0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xF80, 	%hsys_tick_cmpr
	rdhpr	%hpstate,	%i3
	rdpr	%gl,	%l0
	wrpr	%o6,	%l6,	%tick
	subcc	%i7,	0x0524,	%l1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x242, 	%hsys_tick_cmpr
	popc	0x15B6,	%g5
	stb	%l3,	[%l7 + 0x63]

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%gl,	%g6
	brlz	%l4,	loop_600
	movcs	%xcc,	%i0,	%g7
	rdpr	%otherwin,	%g2
	wr	%g3,	0x1BE3,	%ccr
loop_600:
	rdhpr	%htba,	%o1
	rdpr	%tl,	%o2
	fbue,a	%fcc2,	loop_601
	rd	%ccr,	%i2
	rdhpr	%hpstate,	%l2
	mulscc	%o7,	0x1432,	%o0
loop_601:
	wrpr	%i6,	0x19B4,	%pil
	rdpr	%otherwin,	%g1
	wrpr	%i4,	0x03FB,	%tick
	fpadd32	%f30,	%f6,	%f2
	rd	%softint,	%l5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	sethi	0x1C6E,	%i3
	ldstub	[%l7 + 0x2D],	%l0
	rd	%sys_tick_cmpr,	%i5
	fpadd32s	%f22,	%f25,	%f19
	tsubcc	%o6,	0x0BFE,	%i7
	fbu,a	%fcc2,	loop_602
	ble	loop_603
	wrpr	%l6,	0x1CDF,	%pil
	rdpr	%gl,	%o5
loop_602:
	rdpr	%wstate,	%l1
loop_603:
	rd	%ccr,	%g5
	fandnot1	%f24,	%f18,	%f10
	ldub	[%l7 + 0x38],	%o4
	subccc	%g6,	0x1AFA,	%l4
	movgu	%xcc,	%i0,	%l3
	rd	%sys_tick_cmpr,	%g7
	srlx	%g3,	%g2,	%o2
	udiv	%i2,	0x0C9F,	%l2
	fmul8x16au	%f23,	%f0,	%f4
	edge16l	%o7,	%o0,	%i6
	rd	%fprs,	%o1
	set	0x48, %o1
	stxa	%i4,	[%l7 + %o1] 0x89
	wrpr	%l5,	0x01AC,	%pil
	sdivx	%g1,	0x0104,	%i1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr 	%g0, 	0x4, 	%fprs
	rdhpr	%htba,	%i5
	wrpr	%o6,	0x16B5,	%pil
	rdhpr	%hintp,	%i7
	movne	%xcc,	%l0,	%o5
	wrpr	%l1,	0x059E,	%cwp
	wrpr	%g5,	%l6,	%tick
	wr	%o4,	%l4,	%pic
	movcs	%xcc,	%i0,	%g6
	wrpr	%g7,	0x1AB8,	%tick
	taddcctv	%g3,	0x0D3B,	%l3
	lduw	[%l7 + 0x14],	%g2
	wr 	%g0, 	0x5, 	%fprs
	wr	%l2,	0x1CE6,	%y
	ta	%xcc,	0x5
	ldd	[%l7 + 0x38],	%f22
	wr	%o2,	0x0A27,	%clear_softint
	fmovrde	%o0,	%f0,	%f14
	wr	%g0,	0x11,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	smul	%i6,	0x0A7A,	%o7
	fcmpeq32	%f30,	%f14,	%i4
	wr	%o1,	0x1E68,	%y
	movgu	%icc,	%g1,	%i1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xA66, 	%hsys_tick_cmpr
	brlz,a	%o3,	loop_604
	rd	%sys_tick_cmpr,	%i5
	xnorcc	%o6,	0x1194,	%i3
	edge32	%i7,	%l0,	%o5
loop_604:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	array8	%g5,	%o4,	%l6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x646, 	%hsys_tick_cmpr
	smulcc	%g7,	0x13B5,	%i2
	edge32	%l2,	%o2,	%i6
	pdist	%f22,	%f28,	%f20
	udiv	%o0,	0x1076,	%i4
	movpos	%icc,	%o7,	%o1
	rdhpr	%hpstate,	%i1
	wrpr	%l5,	%g1,	%tick
	rdhpr	%htba,	%o3
	rd	%y,	%g4
	addcc	%i5,	%i3,	%o6
	rdhpr	%hintp,	%i7
	movge	%xcc,	%o5,	%l1
	wr	%g5,	0x0617,	%y
	sdivcc	%l0,	0x1860,	%o4
	rd	%sys_tick_cmpr,	%l6
	wrpr	%l4,	0x039C,	%tick
	wr	%g6,	0x0A51,	%sys_tick
	rd	%ccr,	%i0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%wstate,	%l3
	tcs	%xcc,	0x3
	rdhpr	%hintp,	%g2
	wr	%i2,	0x1AD6,	%sys_tick
	rd	%y,	%g7
	orncc	%l2,	0x0F03,	%o2
	edge32ln	%i6,	%i4,	%o0
	rdpr	%cansave,	%o1
	sdivcc	%o7,	0x1AF7,	%i1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr 	%g0, 	0x5, 	%fprs
	rd	%pc,	%l5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	fbe,a	%fcc2,	loop_605
	nop
	setx	loop_606,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	orncc	%g4,	%o6,	%i3
	rd	%fprs,	%o5
loop_605:
	udivx	%l1,	0x0059,	%g5
loop_606:
	wr	%l0,	0x05F7,	%pic
	bpos,pt	%xcc,	loop_607
	rdhpr	%hpstate,	%o4
	movrlez	%i7,	0x297,	%l4
	fcmps	%fcc3,	%f31,	%f28
loop_607:
	smulcc	%l6,	%g6,	%g3
	bg	%icc,	loop_608
	movvs	%xcc,	%l3,	%i0
	wrpr	%g2,	0x0022,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_608:
	nop
	wr	%g0,	0xea,	%asi
	ldda	[%l7 + 0x70] %asi,	%o2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xD7F, 	%hsys_tick_cmpr
	movg	%icc,	%l2,	%o0
	rdhpr	%hpstate,	%i4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x17A, 	%tick_cmpr
	andncc	%i1,	%g1,	%o3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%hpstate,	%g4
	rd	%sys_tick_cmpr,	%i5
	wr 	%g0, 	0x4, 	%fprs
	fcmpeq32	%f30,	%f20,	%o6
	call	loop_609
	movn	%xcc,	%o5,	%l1
	wrpr	%g5,	0x18F1,	%pil
	rd	%y,	%l0
loop_609:
	fbge,a	%fcc3,	loop_610
	wrpr	%o4,	0x1393,	%pil
	edge16ln	%i7,	%l6,	%l4
	rdhpr	%hsys_tick_cmpr,	%g3
loop_610:
	rdhpr	%hpstate,	%g6
	rd	%sys_tick_cmpr,	%i0
	movgu	%xcc,	%l3,	%g2
	wr	%i2,	%o2,	%softint
	wrpr	%g7,	0x1762,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x54A, 	%sys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x6F2, 	%hsys_tick_cmpr
	tvs	%icc,	0x5
	rdpr	%otherwin,	%i1
	wrpr	%g1,	0x045D,	%cwp
	rd	%sys_tick_cmpr,	%i6
	te	%xcc,	0x1
	movrlez	%l5,	%o3,	%g4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x9E7, 	%hsys_tick_cmpr
	rd	%ccr,	%o6
	wr	%i5,	0x00FE,	%y
	rdpr	%cansave,	%o5
	rdpr	%cleanwin,	%g5
	fnot1s	%f26,	%f23
	tsubcctv	%l1,	%l0,	%i7
	rdhpr	%hpstate,	%l6
	te	%xcc,	0x5
	rd	%softint,	%o4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	ldsw	[%l7 + 0x4C],	%l4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	movcc	%xcc,	%g2,	%i2
	fmovsg	%xcc,	%f19,	%f1
	rdpr	%tl,	%o2
	rdhpr	%htba,	%g7
	bl,a	%xcc,	loop_611
	rd	%sys_tick_cmpr,	%i0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xE74, 	%hsys_tick_cmpr
	fblg	%fcc1,	loop_612
loop_611:
	movrgz	%l2,	0x34A,	%i4
	fnot1	%f30,	%f22
	mulscc	%i1,	0x10BE,	%g1
loop_612:
	wrpr	%o7,	%i6,	%pil
	rdhpr	%hintp,	%o3
	rd	%tick_cmpr,	%g4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%hpstate,	%i3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%pil,	%o6
	fandnot1s	%f29,	%f15,	%f16
	tsubcc	%i5,	0x1D2D,	%o5
	rdhpr	%htba,	%g5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	rdpr	%tl,	%i7
	alignaddrl	%l6,	%o4,	%g3
	rd	%softint,	%l4
	bvs,pn	%icc,	loop_613
	rd	%ccr,	%g6
	edge32l	%g2,	%l3,	%i2
	ba,a	%icc,	loop_614
loop_613:
	taddcctv	%g7,	0x00AA,	%o2
	rd	%softint,	%i0
	rd	%pc,	%l2
loop_614:
	smul	%o0,	%i4,	%i1
	fmovdgu	%xcc,	%f28,	%f27
	fpack32	%f12,	%f24,	%f28
	wr	%o7,	%g1,	%softint
	fornot1	%f10,	%f14,	%f8

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%g4,	0x12F2,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x607, 	%hsys_tick_cmpr
	wrpr	%i3,	%l5,	%pil
	wr	%o6,	0x1EBB,	%set_softint
	smul	%i6,	%i5,	%g5
	movg	%icc,	%o5,	%l0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x079, 	%hsys_tick_cmpr
	alignaddrl	%o4,	%g3,	%l1
	lduh	[%l7 + 0x46],	%l4
	rdpr	%cleanwin,	%g2
	rdpr	%canrestore,	%g6
	wrpr	%i2,	%l3,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%hsys_tick_cmpr,	%g7
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x18
	set	0x18, %o4
	ldxa	[%g0 + %o4] 0x4f,	%l2
	rdpr	%pil,	%i4
	bge	%icc,	loop_615
	tneg	%xcc,	0x2
	array32	%i1,	%o0,	%o7
	wr 	%g0, 	0x6, 	%fprs
loop_615:
	fmovdpos	%xcc,	%f24,	%f3
	edge16n	%o1,	%g4,	%i3
	fmovrslz	%o6,	%f28,	%f31
	wr 	%g0, 	0x6, 	%fprs
	mulx	%i6,	%o5,	%l0
	rdpr	%tba,	%g5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	wrpr	%l6,	0x00D2,	%pil
	rdpr	%tl,	%g3
	rdpr	%gl,	%l4
	wrpr	%l1,	%g6,	%pil
	wr	%i2,	0x1323,	%set_softint
	tge	%xcc,	0x1
	array16	%l3,	%g2,	%o2
	fmovsvc	%icc,	%f21,	%f22
	fxnors	%f29,	%f24,	%f6
	fbge,a	%fcc0,	loop_616
	fmovdcs	%xcc,	%f30,	%f24
	fmovda	%icc,	%f4,	%f16
	rdpr	%tl,	%i0
loop_616:
	fpsub32s	%f9,	%f14,	%f1
	ldsh	[%l7 + 0x46],	%g7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xBFB, 	%hsys_tick_cmpr
	rdhpr	%htba,	%i4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wrpr	%o0,	%o7,	%tick
	rdpr	%cansave,	%i1
	movvc	%icc,	%o3,	%o1
	flush	%l7 + 0x28
	wr	%g4,	0x0B7F,	%clear_softint
	edge32	%g1,	%i3,	%l5
	rd	%ccr,	%i5
	movpos	%xcc,	%o6,	%o5
	addccc	%l0,	0x1814,	%i6
	wr	%i7,	0x008C,	%clear_softint
	wr	%g5,	%o4,	%set_softint
	rdhpr	%hintp,	%l6
	edge16ln	%g3,	%l1,	%l4
	rdhpr	%hpstate,	%i2
	wrpr	%l3,	%g2,	%pil
	fmovrde	%g6,	%f14,	%f10
	wrpr	%i0,	0x15DE,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	rdpr	%canrestore,	%o2
	rdhpr	%htba,	%o0
	wr	%o7,	%i1,	%sys_tick
	udivcc	%o3,	0x079C,	%i4
	rdpr	%cwp,	%g4
	rd	%sys_tick_cmpr,	%o1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	sdiv	%l5,	0x1FA5,	%g1
	rdhpr	%htba,	%i5
	wr	%o5,	0x1D1D,	%y
	wrpr	%l0,	%o6,	%cwp
	nop
	setx	loop_617,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fbg	%fcc1,	loop_618
	te	%icc,	0x3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x2ED, 	%hsys_tick_cmpr
loop_617:
	wrpr	%g5,	%l6,	%cwp
loop_618:
	wrpr	%o4,	%l1,	%cwp
	membar	0x04
	movrgz	%g3,	0x2AF,	%i2
	wrpr	%l4,	%l3,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x05B, 	%hsys_tick_cmpr
	movg	%xcc,	%g7,	%l2
	rdpr	%cleanwin,	%g2
	wrpr	%o0,	0x02E0,	%pil
	wrpr	%o2,	0x07E6,	%tick
	wr	%o7,	%i1,	%softint
	movleu	%xcc,	%i4,	%g4
	rdhpr	%htba,	%o3
	rdhpr	%hpstate,	%i3
	wrpr	%l5,	%g1,	%tick
	fand	%f6,	%f26,	%f6
	rd	%softint,	%o1
	wr	%i5,	%l0,	%set_softint
	wrpr	%o6,	0x1ACC,	%cwp
	rdhpr	%hintp,	%i6
	wrpr	%o5,	%g5,	%tick
	fmovd	%f12,	%f4
	fpsub16	%f18,	%f8,	%f26
	rd	%tick_cmpr,	%i7
	rdhpr	%hpstate,	%o4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xC3B, 	%hsys_tick_cmpr
	movg	%xcc,	%l1,	%g3
	ldsb	[%l7 + 0x2A],	%i2
	rd	%softint,	%l3
	fnot1s	%f15,	%f18
	wrpr	%g6,	0x02D1,	%tick
        wr    %g0,    0xe,    %pcr    ! changed.
	wr	%g7,	0x1F91,	%sys_tick
	rdpr	%tl,	%i0
	rdpr	%wstate,	%l2
	rdpr	%cleanwin,	%g2
	wr 	%g0, 	0x6, 	%fprs
	wr	%i1,	%i4,	%softint
	udivcc	%o7,	0x0111,	%o3
	rdpr	%cansave,	%g4
	edge8l	%i3,	%g1,	%o1
	movrne	%l5,	0x03C,	%i5
	movre	%l0,	%o6,	%o5
	rdhpr	%hpstate,	%i6
	rd	%asi,	%i7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	edge8n	%l6,	%l1,	%o4
	taddcctv	%i2,	%l3,	%g3
	rd	%fprs,	%g6
	rdpr	%pil,	%l4
	tleu	%icc,	0x0
	rd	%asi,	%g7
	fbul	%fcc1,	loop_619
	fxnors	%f30,	%f7,	%f14
	rd	%pc,	%i0
	rdhpr	%hintp,	%g2
loop_619:
	rd	%sys_tick_cmpr,	%l2
	wrpr	%o2,	%i1,	%tick
	movrgez	%i4,	0x0B2,	%o7
	rdhpr	%htba,	%o0
	rdpr	%otherwin,	%g4
	rd	%sys_tick_cmpr,	%i3
	wr	%g1,	%o3,	%softint
	fpsub16	%f2,	%f22,	%f14
	movvc	%xcc,	%o1,	%i5
	wr	%l5,	%l0,	%ccr
	sll	%o6,	0x1D,	%i6
	prefetch	[%l7 + 0x18],	 0x3
	movgu	%icc,	%o5,	%g5
        wr    %g0,    0xe,    %pcr    ! changed.
	fmovrdgz	%l1,	%f16,	%f6
	rdhpr	%htba,	%i7
	rd	%ccr,	%o4
	rd	%tick_cmpr,	%l3
	movg	%icc,	%g3,	%i2
	wr	%l4,	%g6,	%set_softint
	rd	%sys_tick_cmpr,	%i0
	tvc	%icc,	0x6
	rdpr	%canrestore,	%g2
	orn	%g7,	0x1808,	%l2
	sdivcc	%i1,	0x0044,	%i4
	st	%f1,	[%l7 + 0x48]
	rdpr	%tba,	%o7
	fmovdcs	%xcc,	%f4,	%f11
	fzeros	%f7
        wr    %g0,    0xe,    %pcr    ! changed.

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%tick_cmpr,	%o0
	fnot1	%f14,	%f30
	wr	%g1,	%i3,	%ccr
        wr    %g0,    0xe,    %pcr    ! changed.
	edge32n	%o3,	%l5,	%l0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	or	%i6,	0x049F,	%o5
	movle	%xcc,	%l6,	%g5
	wrpr	%l1,	0x154F,	%cwp
	rdpr	%canrestore,	%o4
	rd	%ccr,	%l3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%i2,	%i7,	%ccr
	tneg	%icc,	0x6
	wrpr	%g6,	%l4,	%pil
	brgez,a	%g2,	loop_620
	rdhpr	%hsys_tick_cmpr,	%i0
	fpsub32	%f2,	%f4,	%f4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_620:
	rd	%y,	%l2
	rd	%tick_cmpr,	%i1
	fmovdcs	%icc,	%f10,	%f12
	rd	%sys_tick_cmpr,	%i4
	fmul8x16au	%f12,	%f30,	%f16
	std	%o6,	[%l7 + 0x28]
	srlx	%g4,	%o0,	%o2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xA70, 	%hsys_tick_cmpr
	pdist	%f6,	%f28,	%f10
	edge16	%o3,	%o1,	%l0
	bneg,a	%xcc,	loop_621
	swap	[%l7 + 0x54],	%l5
	rdhpr	%hsys_tick_cmpr,	%o6
	movg	%xcc,	%i6,	%o5
loop_621:
	tg	%icc,	0x4
	movn	%xcc,	%l6,	%g5
	edge8ln	%i5,	%l1,	%o4
	andcc	%g3,	0x1254,	%l3
	wr	%i2,	%g6,	%clear_softint
	tvc	%xcc,	0x3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	edge8ln	%g7,	%i0,	%i1
	edge32n	%l2,	%o7,	%g4
	wr	%o0,	0x102F,	%softint
	wrpr	%i4,	%o2,	%cwp
	rd	%pc,	%i3
	rdpr	%wstate,	%g1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fors	%f3,	%f18,	%f17
	umulcc	%o3,	%l5,	%l0
	rdpr	%cleanwin,	%o6
	orncc	%i6,	%l6,	%g5
	sdivx	%i5,	0x1448,	%o5
	movn	%icc,	%o4,	%l1
	fpsub16s	%f28,	%f21,	%f30
	brgz	%l3,	loop_622
	rdpr	%tba,	%g3
	fnor	%f6,	%f28,	%f18
	tge	%icc,	0x4
loop_622:
	fpadd16	%f28,	%f20,	%f16
	and	%i2,	0x146D,	%l4
	fmovdcc	%xcc,	%f29,	%f7
	wrpr	%g6,	%i7,	%cwp
	andn	%g2,	0x1D9E,	%g7
	movrlez	%i1,	0x15B,	%l2
	rd	%ccr,	%i0
	wr	%o7,	0x0760,	%set_softint
	subc	%o0,	0x0804,	%g4
	st	%f19,	[%l7 + 0x7C]
	membar	0x0C
	wrpr	%i4,	%o2,	%tick
	wrpr	%g1,	0x0AB1,	%tick
	rdhpr	%htba,	%i3
	rdhpr	%hpstate,	%o3
	rd	%ccr,	%o1
	wr	%l5,	%l0,	%clear_softint
	sdivx	%i6,	0x19B4,	%o6
	movg	%xcc,	%l6,	%g5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x2B6, 	%hsys_tick_cmpr
	array32	%l1,	%g3,	%i2
	rdhpr	%hpstate,	%l4
	movn	%icc,	%g6,	%l3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%htba,	%g7
	movvs	%icc,	%i1,	%l2
	array32	%i0,	%o7,	%o0
	smul	%g2,	0x1322,	%i4
	wr	%o2,	0x1F58,	%pic
	movle	%icc,	%g1,	%g4
	rdpr	%pil,	%o3
	rd	%asi,	%i3
	wr	%g0,	0x19,	%asi
	stha	%l5,	[%l7 + 0x6E] %asi
	rdhpr	%htba,	%o1
	rd	%softint,	%l0
	wrpr	%o6,	0x0C1B,	%tick
	rd	%ccr,	%i6
	rdpr	%cansave,	%l6
	rdhpr	%hintp,	%g5
	rd	%y,	%o4
	rdhpr	%htba,	%o5
	stb	%l1,	[%l7 + 0x16]
	rd	%ccr,	%i5
	fmovda	%xcc,	%f14,	%f27
	array32	%i2,	%g3,	%l4
	movle	%xcc,	%g6,	%i7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	srl	%i1,	0x0D,	%g7
	set	0x40, %o0
	stda	%i0,	[%l7 + %o0] 0x89
	rdpr	%tba,	%o7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x1D7, 	%sys_tick_cmpr
	rdhpr	%hsys_tick_cmpr,	%i4
	rdhpr	%hsys_tick_cmpr,	%o2
	wr	%g1,	0x1EE0,	%pic
	ldsw	[%l7 + 0x18],	%g2
	rdpr	%otherwin,	%o3
	rdhpr	%hpstate,	%g4
	movvc	%icc,	%l5,	%i3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x31C, 	%tick_cmpr
	sir	0x1EBE
	sir	0x10E1
	wr	%o1,	0x0675,	%sys_tick
	wrpr	%i6,	0x1C5E,	%tick
	xorcc	%l6,	0x1029,	%g5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xF39, 	%hsys_tick_cmpr
	orncc	%l1,	0x01DF,	%i2
	sdiv	%g3,	0x095F,	%l4
	rdpr	%canrestore,	%g6
	wrpr	%i5,	%i7,	%tick
	fxnor	%f16,	%f4,	%f0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x120, 	%hsys_tick_cmpr
	tne	%xcc,	0x7
	movg	%icc,	%i0,	%o7
	wr	%g7,	%o0,	%y

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xE46, 	%hsys_tick_cmpr
	rdpr	%wstate,	%o2
	tvc	%icc,	0x6
	rdpr	%gl,	%g1
	rd	%asi,	%g2
	tl	%icc,	0x4
	rdpr	%cansave,	%i4
	rdpr	%wstate,	%g4
	rd	%tick_cmpr,	%o3
	tne	%icc,	0x5
	rd	%fprs,	%l5
	rdhpr	%htba,	%i3
	rdhpr	%hsys_tick_cmpr,	%o6
	wrpr	%o1,	0x07B5,	%tick
	rdpr	%otherwin,	%i6
	edge16	%l0,	%g5,	%o5
	fpackfix	%f26,	%f15
	sll	%o4,	0x13,	%l1
	rdpr	%tba,	%i2
	movneg	%xcc,	%l6,	%l4
	wrpr	%g3,	0x02FC,	%pil
	movle	%icc,	%g6,	%i5
	wrpr	%i7,	%i1,	%cwp
	rdhpr	%hsys_tick_cmpr,	%l3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x626, 	%hsys_tick_cmpr
	alignaddr	%o7,	%g7,	%l2
	rd	%y,	%o2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xC4A, 	%hsys_tick_cmpr
	movge	%icc,	%g1,	%i4
	movrlz	%g4,	%o3,	%l5
	orcc	%i3,	0x15B5,	%o6
	rdpr	%wstate,	%g2
	movg	%xcc,	%o1,	%i6
	fmovs	%f19,	%f3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x140, 	%hsys_tick_cmpr
	fmovsleu	%icc,	%f2,	%f6
	wr	%g5,	0x1F65,	%y
	tsubcctv	%o5,	%l1,	%i2
	rdpr	%tba,	%o4
	rdpr	%cansave,	%l4
	rdpr	%gl,	%g3
	fmovdn	%xcc,	%f21,	%f3
	umulcc	%g6,	%i5,	%i7
	wr	%i1,	%l3,	%y
	andn	%l6,	%o7,	%g7
	rd	%pc,	%l2
	tsubcc	%o2,	%i0,	%o0
	wr	%i4,	0x10F3,	%ccr
	rd	%y,	%g1
	rdhpr	%hpstate,	%g4
	fbue	%fcc3,	loop_623
	wrpr	%o3,	%i3,	%tick
	wr	%o6,	%l5,	%y

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_623:
	rdpr	%pil,	%g2
	rdhpr	%hpstate,	%l0
	wr 	%g0, 	0x6, 	%fprs
	tvc	%xcc,	0x6
	rdhpr	%hsys_tick_cmpr,	%g5
	rdhpr	%hintp,	%l1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	movl	%icc,	%l4,	%g3
	edge32	%g6,	%i2,	%i5
	fpack32	%f14,	%f26,	%f20
	wr	%g0,	0x22,	%asi
	stha	%i1,	[%l7 + 0x30] %asi
	membar	#Sync
	edge8ln	%i7,	%l3,	%o7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%hsys_tick_cmpr,	%l6
	rd	%tick_cmpr,	%o2
	rdpr	%cwp,	%i0
	brgez	%o0,	loop_624
	orncc	%i4,	0x04C6,	%l2
        wr    %g0,    0xe,    %pcr    ! changed.
	rdpr	%cleanwin,	%o3
loop_624:
	movgu	%xcc,	%o6,	%l5
	wr	%g0,	0xe3,	%asi
	stba	%o1,	[%l7 + 0x66] %asi
	membar	#Sync
	rdhpr	%hintp,	%g2
	movge	%xcc,	%l0,	%i6
	mulscc	%g5,	%l1,	%i3
	rdhpr	%hpstate,	%o4
	wrpr	%o5,	%g3,	%cwp
	fcmps	%fcc2,	%f10,	%f28
	be	%xcc,	loop_625
	rdpr	%gl,	%l4
	subccc	%i2,	%i5,	%g6
	movcc	%icc,	%i7,	%l3
loop_625:
	bneg,a	%icc,	loop_626
	movpos	%icc,	%i1,	%o7
	fmovrdne	%g7,	%f26,	%f24
	wrpr	%o2,	%i0,	%cwp
loop_626:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	edge32n	%l2,	%g1,	%g4
	rdhpr	%hsys_tick_cmpr,	%i4
	udivcc	%o3,	0x0531,	%l5
	rdhpr	%hsys_tick_cmpr,	%o6
	rdhpr	%hsys_tick_cmpr,	%g2
	ldsb	[%l7 + 0x70],	%o1
	wrpr	%i6,	%l0,	%pil
	rdpr	%tba,	%l1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x20F, 	%tick_cmpr
	brnz	%g5,	loop_627
	std	%o4,	[%l7 + 0x58]
	wr	%l4,	0x0EB4,	%set_softint
	tn	%xcc,	0x7
loop_627:
	wrpr	%g3,	%i5,	%pil
	rdpr	%cansave,	%i2
	prefetch	[%l7 + 0x30],	 0x1
	srl	%i7,	0x02,	%g6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	brnz,a	%i1,	loop_628
	fmovdgu	%icc,	%f12,	%f8
	wr	%g7,	%o2,	%sys_tick
	tvs	%xcc,	0x6
loop_628:
	rdpr	%canrestore,	%o7
	wrpr	%i0,	0x0BAA,	%pil
	movcc	%icc,	%l6,	%l2
	tne	%icc,	0x6
	prefetch	[%l7 + 0x44],	 0x2
	rdpr	%cansave,	%g1
	wrpr	%g4,	%o0,	%cwp
	movleu	%xcc,	%i4,	%l5
	smulcc	%o6,	%g2,	%o3
	rd	%tick_cmpr,	%i6
	rdpr	%otherwin,	%o1
	wrpr	%l0,	%i3,	%tick
	fbne	%fcc0,	loop_629
	rdpr	%cwp,	%o4
	popc	0x083D,	%g5
	sdivx	%l1,	0x16B9,	%l4
loop_629:
	rdpr	%gl,	%g3
	sdivcc	%i5,	0x07C8,	%i2
	alignaddr	%o5,	%i7,	%g6
	rdpr	%wstate,	%i1
	fmul8x16al	%f19,	%f23,	%f12
	brz	%l3,	loop_630
	orcc	%o2,	0x1D0A,	%g7
	movneg	%xcc,	%i0,	%l6
	ta	%icc,	0x3
loop_630:
	rdpr	%cwp,	%l2
	nop
	setx loop_631, %l0, %l1
	jmpl %l1, %g1
	fnands	%f27,	%f15,	%f16
	mulx	%o7,	%g4,	%i4
	sll	%l5,	0x1A,	%o6
loop_631:
	rd	%ccr,	%g2
	rdhpr	%hsys_tick_cmpr,	%o0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x0AC, 	%hsys_tick_cmpr
	sdivx	%o1,	0x0C60,	%l0
	wrpr	%i3,	%o3,	%pil
	wrpr	%g5,	0x11BA,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x953, 	%hsys_tick_cmpr
	rdhpr	%hintp,	%l4
	rd	%tick_cmpr,	%g3
	wr	%i2,	%i5,	%sys_tick
	rdpr	%pil,	%o5
	rd	%sys_tick_cmpr,	%g6
	rdhpr	%hintp,	%i7
	rdpr	%tba,	%l3
	wr	%g0,	0x80,	%asi
	lduba	[%l7 + 0x3D] %asi,	%o2
	udiv	%g7,	0x1351,	%i0
	rd	%pc,	%i1
	rd	%tick_cmpr,	%l6
	rd	%sys_tick_cmpr,	%g1
	rdhpr	%hintp,	%o7
	fmovsa	%icc,	%f27,	%f13
	addccc	%l2,	0x0849,	%i4
	fcmpne16	%f16,	%f20,	%l5
	rdpr	%pil,	%g4
	udivx	%o6,	0x0BAC,	%o0
	wr	%g2,	%o1,	%set_softint
	rd	%softint,	%l0
	rdhpr	%htba,	%i6
	edge32	%i3,	%o3,	%g5
	rdpr	%canrestore,	%o4
	bcs	loop_632
	rdhpr	%hsys_tick_cmpr,	%l4
	rdpr	%pil,	%l1
	bneg,a	loop_633
loop_632:
	wr	%i2,	%i5,	%pic
	movle	%icc,	%g3,	%g6
	rdhpr	%htba,	%o5
loop_633:
	movvs	%xcc,	%i7,	%l3
	edge32n	%o2,	%i0,	%i1
	wr 	%g0, 	0x4, 	%fprs
	wr 	%g0, 	0x7, 	%fprs
	fmovse	%icc,	%f29,	%f3
	prefetch	[%l7 + 0x1C],	 0x1
	rd	%tick_cmpr,	%l2
	rdhpr	%hpstate,	%l5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fmovsn	%icc,	%f27,	%f19
	wr	%g4,	0x1F32,	%sys_tick
	rdhpr	%hpstate,	%o6
	xnor	%o0,	0x05E0,	%g2
	udiv	%o1,	0x104D,	%l0
	movn	%icc,	%i6,	%o3
	rdhpr	%hpstate,	%g5
	edge16l	%o4,	%i3,	%l1
	movrgez	%l4,	0x23B,	%i2
	addccc	%i5,	%g3,	%o5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	movl	%xcc,	%o2,	%i7
	wrpr	%i1,	%l6,	%cwp
	rdpr	%otherwin,	%g7
	fnot1s	%f11,	%f26
	wr	%g0,	0x80,	%asi
	lda	[%l7 + 0x24] %asi,	%f29
	tn	%xcc,	0x7
	smulcc	%o7,	0x0C6E,	%i0
	movpos	%xcc,	%g1,	%l2
	wr	%l5,	%i4,	%ccr
	stbar
	orn	%o6,	%o0,	%g2
        wr    %g0,    0xe,    %pcr    ! changed.
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	rdpr	%cleanwin,	%i6
	prefetch	[%l7 + 0x64],	 0x2
	rdpr	%pil,	%o3
	mulscc	%g4,	%g5,	%o4
	bcc,a,pt	%xcc,	loop_634
	rdhpr	%hsys_tick_cmpr,	%l1
	rdhpr	%htba,	%i3
	rdhpr	%hsys_tick_cmpr,	%i2
loop_634:
	edge8l	%i5,	%l4,	%g3
	wr	%g6,	%o5,	%y
	bcs	loop_635
	rd	%fprs,	%o2
	wrpr	%i7,	%i1,	%cwp
	fmovdle	%icc,	%f11,	%f20
loop_635:
	nop
	setx	loop_636,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	rd	%ccr,	%l6
	bleu,a	%icc,	loop_637
	edge8	%g7,	%l3,	%o7
loop_636:
	wr	%i0,	%l2,	%y
	bg,a	%xcc,	loop_638
loop_637:
	wr	%l5,	0x0008,	%clear_softint
	bcc	loop_639
	rd	%fprs,	%g1
loop_638:
	sir	0x1F0F
	rdhpr	%hsys_tick_cmpr,	%i4
loop_639:
	fmovdge	%xcc,	%f16,	%f8
	fbuge	%fcc2,	loop_640
	rdhpr	%hpstate,	%o6
	fmovdl	%icc,	%f13,	%f20
	rd	%ccr,	%g2
loop_640:
	rd	%fprs,	%o0
	rdpr	%tl,	%l0
	wr	%i6,	%o3,	%softint
	movl	%icc,	%g4,	%o1
	tpos	%icc,	0x6
	stb	%g5,	[%l7 + 0x28]
	rd	%tick_cmpr,	%o4
	wrpr	%i3,	%l1,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%cleanwin,	%g3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	set	0x30, %g1
	ldswa	[%l7 + %g1] 0x81,	%o5
	ldsh	[%l7 + 0x74],	%o2
	orncc	%l4,	0x05EC,	%i7
	rdhpr	%hpstate,	%i1
	fmovdpos	%icc,	%f7,	%f5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	rdpr	%cwp,	%g7
	fbu,a	%fcc0,	loop_641
	edge16ln	%l6,	%o7,	%l3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%hsys_tick_cmpr,	%l2
loop_641:
	xor	%l5,	0x1D6A,	%g1
	wrpr	%i4,	0x11B5,	%pil
	andn	%o6,	%o0,	%g2
	rdpr	%canrestore,	%l0
	lduh	[%l7 + 0x4E],	%i6
	movcs	%xcc,	%o3,	%o1
	rdhpr	%hintp,	%g4
	tsubcc	%g5,	%i3,	%o4
	fmovdleu	%icc,	%f6,	%f19
	fnot1	%f30,	%f12
	rdhpr	%hpstate,	%i5
	fcmped	%fcc1,	%f16,	%f28
	rd	%sys_tick_cmpr,	%l1
	wrpr	%i2,	%g6,	%tick
	edge8	%g3,	%o2,	%l4
	set	0x68, %i1
	lduwa	[%l7 + %i1] 0x14,	%o5
	edge8n	%i1,	%g7,	%i7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x6E2, 	%hsys_tick_cmpr
	fmovrsne	%i0,	%f10,	%f19
	edge32	%l2,	%l5,	%l6
	rdpr	%otherwin,	%g1
	addc	%o6,	%o0,	%i4
	fmovdle	%xcc,	%f1,	%f6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	movre	%l0,	%i6,	%o3
        wr    %g0,    0xe,    %pcr    ! changed.
	rdhpr	%htba,	%i3
	sub	%o4,	%i5,	%g4
	wrpr	%i2,	%g6,	%cwp
	rdpr	%otherwin,	%l1
	rdpr	%tl,	%g3
	wrpr	%o2,	0x1B28,	%tick
	rdhpr	%hintp,	%o5
	edge32n	%l4,	%g7,	%i7
	wr	%o7,	%l3,	%ccr
	wrpr	%i0,	0x0706,	%pil
	rdpr	%cleanwin,	%i1
	rdpr	%cansave,	%l5
	add	%l7,	0x58,	%l6
	wr	%g0,	0x11,	%asi
	casa	[%l6] 0x11,	%l6,	%l2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	bleu,a	loop_642
	rdhpr	%hsys_tick_cmpr,	%o6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	array8	%g2,	%o0,	%l0
loop_642:
	nop
	set	0x62, %l0
	ldsba	[%l7 + %l0] 0x81,	%i6
	fbu,a	%fcc3,	loop_643
	alignaddr	%o3,	%o1,	%g5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_643:
	array16	%g4,	%i2,	%g6
	rdhpr	%hpstate,	%g3
	brgez	%l1,	loop_644
	array16	%o2,	%o5,	%g7
	tvs	%xcc,	0x6
	rd	%sys_tick_cmpr,	%l4
loop_644:
	fblg,a	%fcc1,	loop_645
        wr    %g0,    0xe,    %pcr    ! changed.
	nop
	set	0x51, %i3
	ldub	[%l7 + %i3],	%o7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x883, 	%hsys_tick_cmpr
loop_645:
	rd	%asi,	%i0
	edge8ln	%l5,	%l6,	%i1
	rdpr	%cleanwin,	%g1
	subcc	%l2,	0x160F,	%i4
	wr	%g2,	%o0,	%pic
	rd	%fprs,	%l0
	wrpr	%i6,	%o6,	%tick
	fmovsvc	%xcc,	%f21,	%f2
	movcc	%xcc,	%o3,	%o1
	sll	%g5,	%i3,	%i5
	te	%xcc,	0x2
	array32	%g4,	%o4,	%i2
	fmovscs	%icc,	%f9,	%f3
	rdpr	%cansave,	%g3
	wrpr	%l1,	%g6,	%tick
	fbg,a	%fcc0,	loop_646
	rdpr	%otherwin,	%o5
	movle	%icc,	%g7,	%o2
	fnot2s	%f27,	%f20
loop_646:
	rd	%pc,	%i7
	sdivx	%l4,	0x17AE,	%l3
	tcc	%xcc,	0x6
	rdpr	%tba,	%i0
	umulcc	%l5,	0x1763,	%o7
	tsubcctv	%i1,	%g1,	%l2
	movcc	%xcc,	%i4,	%g2
	rdpr	%canrestore,	%o0
	sethi	0x0588,	%l6
	rd	%pc,	%l0
	rd	%softint,	%i6
	sdivx	%o3,	0x0846,	%o1
	fandnot2	%f12,	%f14,	%f4
	rdpr	%wstate,	%g5
	rdhpr	%htba,	%i3
	fornot1	%f24,	%f20,	%f20
	mulx	%i5,	0x127A,	%g4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xC29, 	%hsys_tick_cmpr
	rdhpr	%htba,	%i2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x837, 	%hsys_tick_cmpr
	sub	%g6,	0x00EE,	%o5
	nop
	setx loop_647, %l0, %l1
	jmpl %l1, %g7
	fones	%f3
	rd	%pc,	%o2
	edge32n	%l1,	%l4,	%i7
loop_647:
	rdhpr	%hpstate,	%l3
	rd	%y,	%i0
	wr 	%g0, 	0x6, 	%fprs
	edge16n	%i1,	%g1,	%o7
	rd	%sys_tick_cmpr,	%i4
	fble,a	%fcc0,	loop_648
	rd	%fprs,	%l2
	rdhpr	%htba,	%g2
	edge32n	%l6,	%l0,	%i6
loop_648:
	xnor	%o0,	%o3,	%o1
	wrpr	%i3,	%g5,	%tick
	wrpr	%i5,	%g4,	%tick
	fornot2s	%f3,	%f0,	%f3
	rd	%sys_tick_cmpr,	%i2
	fabsd	%f16,	%f24
	rd	%ccr,	%o6
	addccc	%g3,	%g6,	%o5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%l4,	0x1C7A,	%tick
	wr	%g0,	0x81,	%asi
	ldda	[%l7 + 0x60] %asi,	%i6
	edge8l	%l3,	%o4,	%l5
	rdpr	%cansave,	%i0
	rdhpr	%htba,	%i1
	wr	%g0,	0xda,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xE07, 	%sys_tick_cmpr
	rdhpr	%hsys_tick_cmpr,	%o7
	rdhpr	%hsys_tick_cmpr,	%g2
	tge	%icc,	0x5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%canrestore,	%l2
	movl	%icc,	%l0,	%o0
	rdpr	%otherwin,	%o3
	rdpr	%cwp,	%o1
	rdhpr	%htba,	%i6
	set	0x50, %g6
	ldda	[%l7 + %g6] 0xe2,	%i2
	rd	%tick_cmpr,	%g5
	subc	%i5,	0x03A5,	%g4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fnot1s	%f17,	%f25
	wr	%g3,	%o6,	%clear_softint
	addccc	%g6,	0x1717,	%o5
	rdpr	%cleanwin,	%o2
	add	%l7,	0x68,	%l6
	wr	%g0,	0x04,	%asi
	ldxa	[%l6] %asi,	%l1
	casxa	[%l6] 0x04,	%l1,	%l4
	wr	%g7,	%i7,	%pic
	fpsub32s	%f15,	%f13,	%f30
	rd	%softint,	%l3
	ta	%xcc,	0x1
	movle	%xcc,	%l5,	%o4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x54E, 	%hsys_tick_cmpr
	fxors	%f13,	%f28,	%f15

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x86F, 	%sys_tick_cmpr
	rdpr	%wstate,	%g1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%asi,	%l2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
        wr    %g0,    0xe,    %pcr    ! changed.
	wrpr	%o3,	0x1765,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x57D, 	%hsys_tick_cmpr
	rd	%ccr,	%o1
	ld	[%l7 + 0x24],	%f8
	wrpr	%i3,	%i5,	%cwp
	rdpr	%gl,	%g5
	xorcc	%i2,	%g4,	%g3
	rdpr	%cwp,	%g6
	ta	%icc,	0x3
	rd	%tick_cmpr,	%o5
	fba,a	%fcc0,	loop_649
	be,pt	%xcc,	loop_650
	rdhpr	%hsys_tick_cmpr,	%o2
	wr 	%g0, 	0x5, 	%fprs
loop_649:
	orcc	%l4,	0x04E9,	%g7
loop_650:
	edge32l	%i7,	%o6,	%l3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x699, 	%hsys_tick_cmpr
	rdhpr	%hintp,	%i0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x7D8, 	%hsys_tick_cmpr
	rd	%fprs,	%o7
	fbule	%fcc2,	loop_651
	rdhpr	%hpstate,	%l6
	rdhpr	%hsys_tick_cmpr,	%g1
	wrpr	%l2,	0x07B7,	%pil
loop_651:
	wrpr	%g2,	0x0D28,	%tick
	rdhpr	%htba,	%o0
	rdpr	%otherwin,	%l0
	fcmpgt16	%f0,	%f18,	%o3
	movrlz	%i6,	%o1,	%i5
	rd	%pc,	%i3
	rdhpr	%hintp,	%g5
	wr	%g4,	%g3,	%sys_tick
	fnegd	%f2,	%f24

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%i2,	0x1E98,	%tick
	wrpr	%o2,	%l4,	%pil
	rd	%ccr,	%g7
	fcmple32	%f4,	%f20,	%i7
	rdhpr	%hsys_tick_cmpr,	%l1
	rdhpr	%hintp,	%l3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xDB7, 	%hsys_tick_cmpr
	rdpr	%cwp,	%i0
	rdhpr	%htba,	%l5
	set	0x40, %i6
	ldda	[%l7 + %i6] 0x18,	%f16
	brlez	%i4,	loop_652
	brlz,a	%o4,	loop_653
	orncc	%o7,	%l6,	%g1
	wrpr	%l2,	%o0,	%pil
loop_652:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_653:
	rdpr	%gl,	%o3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fble	%fcc3,	loop_654
	fmovdcc	%icc,	%f22,	%f18
	add	%o1,	0x19A6,	%i5
	wrpr	%i3,	%i6,	%cwp
loop_654:
	mulx	%g4,	%g3,	%g6
	umul	%g5,	%i2,	%o5
	wr	%o2,	0x176A,	%sys_tick
	rdpr	%tl,	%g7
	bge,pn	%xcc,	loop_655
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	rdpr	%otherwin,	%l4
	rd	%y,	%l1
loop_655:
	wrpr	%i7,	%o6,	%cwp
	rdhpr	%hintp,	%i1
	sethi	0x005C,	%i0
	rd	%ccr,	%l3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x712, 	%hsys_tick_cmpr
	rdhpr	%hpstate,	%l5
	rdhpr	%htba,	%l6
	fmovsa	%icc,	%f12,	%f3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%canrestore,	%l2
	rdpr	%cansave,	%o7
	wr	%o0,	%l0,	%y
	fsrc2	%f24,	%f28
	movle	%icc,	%o3,	%g2
	rd	%pc,	%i5
	rd	%pc,	%o1
	rd	%pc,	%i6
        wr    %g0,    0xe,    %pcr    ! changed.
	rdpr	%tba,	%g6
	fmovsa	%icc,	%f26,	%f4
	ldsw	[%l7 + 0x44],	%g3
	rdhpr	%hsys_tick_cmpr,	%i2
	movleu	%icc,	%g5,	%o2
	wr	%g7,	0x0525,	%set_softint
	wr 	%g0, 	0x6, 	%fprs
	rd	%ccr,	%o5
	fexpand	%f14,	%f8
	wrpr	%l1,	%i7,	%pil
	rdpr	%cansave,	%o6
	rdpr	%gl,	%i0
	rdpr	%pil,	%l3
	fpadd16s	%f5,	%f31,	%f18
	subcc	%i1,	0x0719,	%i4
	rdpr	%otherwin,	%l5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%otherwin,	%g1
	ldsw	[%l7 + 0x0C],	%o7
	fandnot2s	%f10,	%f22,	%f14
	wrpr	%o0,	0x05D4,	%cwp
	rdhpr	%hintp,	%l0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x31B, 	%hsys_tick_cmpr
	addccc	%g2,	%i5,	%o3
	wrpr	%i6,	%o1,	%tick
	fbg,a	%fcc2,	loop_656
	orcc	%i3,	%g4,	%g6
	tl	%xcc,	0x1
	movcc	%icc,	%i2,	%g3
loop_656:
	rdhpr	%hpstate,	%o2
	rd	%fprs,	%g5
	rdpr	%tba,	%l4
	movleu	%xcc,	%o5,	%g7
	wrpr	%i7,	0x0EB1,	%pil
	movn	%xcc,	%l1,	%o6
	ldsh	[%l7 + 0x40],	%l3
	rdpr	%tl,	%i1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	sra	%i4,	%o4,	%g1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	wr	%o0,	%l0,	%softint
	wrpr	%l2,	%o7,	%pil
	rdhpr	%hsys_tick_cmpr,	%g2
	subccc	%i5,	0x1685,	%o3
	rdpr	%pil,	%o1
	wr	%i6,	%i3,	%sys_tick
	udivx	%g4,	0x0CEE,	%g6
	popc	%g3,	%i2
	fmovsvc	%icc,	%f16,	%f5
	wrpr	%g5,	0x0EE0,	%cwp
	rdpr	%wstate,	%o2
	wr	%g0,	0x89,	%asi
	stha	%o5,	[%l7 + 0x7A] %asi
	orcc	%l4,	%g7,	%l1
	rd	%asi,	%o6
	rdhpr	%hsys_tick_cmpr,	%i7
	add	%l7,	0x5C,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%l3
	casa	[%l6] 0x80,	%l3,	%i1
	call	loop_657
	movn	%icc,	%i0,	%l5
	srax	%i4,	%g1,	%o4
	rdpr	%cleanwin,	%o0
loop_657:
	fornot1s	%f27,	%f23,	%f26
	fcmpd	%fcc0,	%f24,	%f6
	rdhpr	%hintp,	%l0
	rdhpr	%hsys_tick_cmpr,	%l2
	rd	%ccr,	%o7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xC55, 	%hsys_tick_cmpr
	rd	%ccr,	%o3
	rdpr	%cwp,	%o1
	rdhpr	%htba,	%i6
	rdpr	%tl,	%g2
	fmovsleu	%icc,	%f6,	%f18
	sdivcc	%i3,	0x06EA,	%g6
	rdhpr	%hpstate,	%g4
	rd	%y,	%i2
	rdhpr	%htba,	%g5
	tpos	%icc,	0x1
	wr	%g3,	0x1AD3,	%ccr
	rdpr	%gl,	%o5
	umul	%l4,	%g7,	%o2
	bgu	%xcc,	loop_658
	tn	%icc,	0x4
	edge8ln	%o6,	%l1,	%l3
	rdhpr	%htba,	%i1
loop_658:
	wr	%i0,	%i7,	%sys_tick
	movrne	%l5,	%g1,	%i4
	rdpr	%pil,	%o0
	wrpr	%l0,	%o4,	%pil
	brlez,a	%o7,	loop_659
	wrpr	%l2,	0x0C60,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	edge8l	%o3,	%l6,	%i6
loop_659:
	wrpr	%o1,	%g2,	%cwp
	rd	%sys_tick_cmpr,	%i3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	rd	%softint,	%i2
	rdpr	%gl,	%g5
	tpos	%icc,	0x0
        wr    %g0,    0xe,    %pcr    ! changed.
	wr	%o5,	0x19CA,	%y
	rdhpr	%hsys_tick_cmpr,	%g6
	wrpr	%l4,	0x06D9,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x9A8, 	%hsys_tick_cmpr
	fblg,a	%fcc0,	loop_660
	fmovdpos	%xcc,	%f21,	%f10
	rdhpr	%hpstate,	%g7
	wrpr	%l1,	%l3,	%pil
loop_660:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	udiv	%i0,	0x133F,	%i7
	rdhpr	%hsys_tick_cmpr,	%l5
	fcmpne16	%f8,	%f16,	%g1
	rdpr	%canrestore,	%o0
	sir	0x1C11
	rd	%ccr,	%l0
	tl	%icc,	0x2
	rdpr	%pil,	%o4
	rdhpr	%hsys_tick_cmpr,	%i4
	mova	%xcc,	%l2,	%o7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	tleu	%icc,	0x6
	rdhpr	%hsys_tick_cmpr,	%i6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x8E3, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x812, 	%hsys_tick_cmpr
	wrpr	%i3,	0x1C7D,	%cwp
	wr	%g0,	0x81,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	movleu	%icc,	%i2,	%g4
	wr	%g3,	%o5,	%sys_tick
	fsrc2	%f12,	%f8
	srl	%g5,	0x06,	%g6
	wr	%o2,	%l4,	%y
	sub	%o6,	0x193E,	%g7
	rdhpr	%hsys_tick_cmpr,	%l3
	rdhpr	%hsys_tick_cmpr,	%l1
	wrpr	%i1,	0x1CD2,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xF98, 	%hsys_tick_cmpr
	rd	%tick_cmpr,	%l5
	wrpr	%i0,	0x13EF,	%cwp
	set	0x55, %i4
	ldsba	[%l7 + %i4] 0x19,	%o0
	fpsub16	%f14,	%f0,	%f22
	fnegd	%f30,	%f10
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
	andn	%i4,	%o4,	%o7
	wrpr	%l2,	0x07AC,	%cwp
	wr	%i5,	%o3,	%pic
	bleu,a	%xcc,	loop_661
	rdhpr	%hpstate,	%i6
	wr	%o1,	0x0684,	%sys_tick
	wrpr	%l6,	0x1C39,	%cwp
loop_661:
	smulcc	%g2,	0x03A1,	%i3
	rd	%tick_cmpr,	%g4
	rdpr	%tba,	%i2
	edge32	%g3,	%o5,	%g6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xB42, 	%hsys_tick_cmpr
	rd	%fprs,	%o6
	mulscc	%l4,	%l3,	%l1
	wrpr	%i1,	0x1A83,	%cwp
	rdhpr	%htba,	%g7
	lduw	[%l7 + 0x44],	%i7
	wrpr	%i0,	%l5,	%tick
	brlez,a	%o0,	loop_662
	rdpr	%pil,	%l0
	sub	%i4,	0x1982,	%g1
	sethi	0x1BFD,	%o7
loop_662:
	lduh	[%l7 + 0x76],	%l2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x847, 	%sys_tick_cmpr
	subcc	%o4,	%i6,	%o1
	rd	%fprs,	%o3
	ld	[%l7 + 0x4C],	%f21
	set	0x70, %i2
	prefetcha	[%l7 + %i2] 0x0c,	 0x1
	rdpr	%wstate,	%l6
	fpack16	%f4,	%f19
	rd	%sys_tick_cmpr,	%g4
	set	0x28, %l5
	lduwa	[%l7 + %l5] 0x10,	%i2
	rd	%ccr,	%g3
	rdpr	%cwp,	%o5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fmovspos	%icc,	%f19,	%f8
	stx	%i3,	[%l7 + 0x08]
	rdpr	%gl,	%g5
	rd	%pc,	%o2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x62E, 	%tick_cmpr
	rd	%y,	%l4
	rdhpr	%hsys_tick_cmpr,	%i1
	rdpr	%otherwin,	%g7
	udivcc	%i7,	0x1264,	%l1
	brlez	%l5,	loop_663
	stw	%i0,	[%l7 + 0x08]
	wrpr	%o0,	0x0524,	%tick
	wr	%l0,	0x163F,	%sys_tick
loop_663:
	stx	%g1,	[%l7 + 0x70]
	wrpr	%i4,	0x171D,	%cwp
	add	%o7,	%i5,	%l2
	array16	%o4,	%o1,	%o3
	movn	%icc,	%g2,	%i6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x301, 	%hsys_tick_cmpr
	rdhpr	%hsys_tick_cmpr,	%g3
	rdhpr	%htba,	%o5
	wrpr	%g4,	0x1C8D,	%cwp
	fsrc2	%f30,	%f8
	taddcc	%g6,	0x1550,	%i3
	wrpr	%g5,	%o2,	%tick
	rdpr	%tba,	%l3
	umulcc	%l4,	0x02E6,	%i1
	call	loop_664
	wr	%o6,	%i7,	%ccr
	rdhpr	%hpstate,	%g7
	rdhpr	%hpstate,	%l5
loop_664:
	bne	loop_665
	sdivcc	%l1,	0x0E9C,	%i0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x6EC, 	%hsys_tick_cmpr
	rdhpr	%hintp,	%o0
loop_665:
	rd	%softint,	%i4
	movg	%xcc,	%o7,	%g1
	xor	%i5,	%l2,	%o1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xE0C, 	%hsys_tick_cmpr
	rdhpr	%hpstate,	%o3
	rdhpr	%hintp,	%i6
	andncc	%l6,	%g2,	%g3
	wr	%i2,	0x0A26,	%ccr
	rdhpr	%hsys_tick_cmpr,	%g4
	addc	%o5,	%i3,	%g5
	tl	%icc,	0x3
	rdhpr	%hintp,	%o2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	ldsb	[%l7 + 0x2A],	%l4
	tl	%xcc,	0x3
	wrpr	%o6,	%i7,	%pil
	srlx	%i1,	%l5,	%l1
	wrpr	%i0,	%l0,	%pil
	rd	%sys_tick_cmpr,	%g7
	rd	%pc,	%o0
	wr 	%g0, 	0x6, 	%fprs
	fbne,a	%fcc3,	loop_666
	fmovdn	%xcc,	%f24,	%f2
	wrpr	%o7,	0x091E,	%cwp
	rd	%sys_tick_cmpr,	%i5
loop_666:
	rdhpr	%hsys_tick_cmpr,	%l2
	rdpr	%otherwin,	%o1
	rdpr	%cleanwin,	%g1
	rd	%y,	%o3
	rd	%pc,	%i6
	subccc	%o4,	0x0326,	%g2
	lduw	[%l7 + 0x18],	%g3
	rd	%ccr,	%i2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xF86, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x0BE, 	%hsys_tick_cmpr
	rdhpr	%htba,	%i3
	popc	%g4,	%o2
	sllx	%l3,	%g5,	%l4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%i1,	0x053E,	%tick
	rdpr	%tl,	%l5
	call	loop_667
	rdhpr	%hintp,	%l1
	rdhpr	%hpstate,	%i0
	wrpr	%i7,	%g7,	%pil
loop_667:
	rdpr	%gl,	%o0
	fnot2	%f18,	%f6
	fbue	%fcc3,	loop_668
	te	%icc,	0x4
	wr	%i4,	0x0803,	%set_softint
	rd	%y,	%l0
loop_668:
	movrlez	%o7,	%l2,	%o1
	swap	[%l7 + 0x70],	%i5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x748, 	%hsys_tick_cmpr
	ldd	[%l7 + 0x20],	%i6
	rd	%tick_cmpr,	%g2
	tsubcctv	%g3,	0x0706,	%i2
	wr	%l6,	0x1CCC,	%set_softint

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	srlx	%i3,	0x09,	%g4
	smulcc	%o2,	%g5,	%l4
	membar	#Sync
	set	0x40, %l2
	ldda	[%l7 + %l2] 0x1e,	%f0
	wr	%l3,	0x10A0,	%y
	nop
	set	0x74, %l4
	stb	%o6,	[%l7 + %l4]
	rdpr	%otherwin,	%i1
	rdpr	%tl,	%l5
	rdpr	%tba,	%g6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x6A1, 	%hsys_tick_cmpr
        wr    %g0,    0xe,    %pcr    ! changed.
	edge16n	%o0,	%l0,	%o7
	membar	0x23
	fbo,a	%fcc3,	loop_669
	wr	%l2,	0x1E74,	%pic
        wr    %g0,    0xe,    %pcr    ! changed.
	nop
	setx loop_670, %l0, %l1
	jmpl %l1, %o1
loop_669:
	rdpr	%otherwin,	%g1
	rd	%y,	%i6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_670:
	be,pn	%xcc,	loop_671
	rd	%pc,	%g3
	wrpr	%l6,	0x1FAD,	%pil
	wrpr	%i2,	%o5,	%pil
loop_671:
	rd	%pc,	%i3
	subc	%g4,	0x1A8A,	%o2
	fmovspos	%xcc,	%f18,	%f19
	edge8n	%g5,	%l4,	%l3
	rdpr	%cwp,	%o6
	and	%i1,	%l5,	%o4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x101, 	%tick_cmpr
	rdhpr	%hsys_tick_cmpr,	%g7
	array32	%l1,	%i0,	%o0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%hsys_tick_cmpr,	%i4
	rdpr	%pil,	%l2
        wr    %g0,    0xe,    %pcr    ! changed.
	fbg,a	%fcc2,	loop_672
	movl	%xcc,	%g1,	%g2
	fmul8x16au	%f30,	%f11,	%f20

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_672:
	edge16ln	%g3,	%i6,	%i2
	fcmpes	%fcc1,	%f15,	%f20
	rd	%softint,	%o5
	wrpr	%l6,	0x0411,	%tick
	rd	%y,	%i3
	wr	%g4,	%g5,	%set_softint
	alignaddrl	%o2,	%l4,	%l3
	bg,pt	%icc,	loop_673
	wrpr	%o6,	0x0239,	%cwp
	rdpr	%pil,	%i1
	rd	%pc,	%l5
loop_673:
	rdhpr	%hintp,	%g6
	nop
	set	0x50, %l3
	ldd	[%l7 + %l3],	%o4
	rd	%pc,	%i7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	edge16l	%i0,	%g7,	%o7
	movge	%icc,	%l0,	%o0
	wrpr	%i4,	0x19C8,	%tick
	rdhpr	%htba,	%l2
	wr	%g0,	0x18,	%asi
	stda	%o0,	[%l7 + 0x18] %asi
	fmovsl	%icc,	%f20,	%f3
	fmul8ulx16	%f20,	%f20,	%f22
	tsubcctv	%g1,	%i5,	%o3
	rdpr	%cleanwin,	%g2
	xnorcc	%g3,	%i6,	%o5
	rd	%tick_cmpr,	%i2
	rdhpr	%hsys_tick_cmpr,	%i3
	rdhpr	%hsys_tick_cmpr,	%l6
	rd	%tick_cmpr,	%g5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xDCE, 	%hsys_tick_cmpr
	wrpr	%l4,	%l3,	%cwp
	wrpr	%i1,	0x0CF1,	%pil
	mova	%xcc,	%o6,	%l5
	tle	%xcc,	0x5
	wrpr	%o4,	%i7,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xAA9, 	%hsys_tick_cmpr
	fmul8ulx16	%f2,	%f0,	%f24
	rdhpr	%hintp,	%i0
	rdhpr	%hpstate,	%g7
	subcc	%l1,	%l0,	%o0
	rdhpr	%hpstate,	%i4
	tleu	%xcc,	0x7
	edge32ln	%o7,	%l2,	%o1
	xor	%g1,	%o3,	%i5
	bvc,pn	%xcc,	loop_674
	fandnot1	%f26,	%f4,	%f8
	wr	%g3,	0x06D1,	%softint
	rdpr	%gl,	%i6
loop_674:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	brgz,a	%l6,	loop_675
	edge32ln	%o2,	%g4,	%l4
	rdhpr	%hsys_tick_cmpr,	%g5
	alignaddrl	%l3,	%o6,	%l5
loop_675:
	wrpr	%i1,	0x10A3,	%pil
	movpos	%icc,	%i7,	%o4
	rd	%pc,	%g6
	fmovrdlz	%g7,	%f22,	%f6
	rdpr	%otherwin,	%i0
	ba,a	loop_676
	rdhpr	%htba,	%l0
	sdiv	%o0,	0x0953,	%l1
	edge32	%i4,	%o7,	%l2
loop_676:
	nop
	set	0x7E, %g4
	lduha	[%l7 + %g4] 0x88,	%o1
	movrne	%o3,	0x376,	%g1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x3AC, 	%sys_tick_cmpr
	stbar
	movneg	%icc,	%g2,	%i6
	wrpr	%i2,	%i3,	%cwp
	wr	%g0,	0x81,	%asi
	lduba	[%l7 + 0x45] %asi,	%l6
	rd	%y,	%o5
	ta	%xcc,	0x2
	wrpr	%g4,	%o2,	%cwp
	wrpr	%g5,	0x19EB,	%tick
	edge8n	%l3,	%l4,	%o6
	bgu,a	loop_677
	wrpr	%i1,	%l5,	%pil
	rdpr	%tba,	%o4
	fpsub32s	%f25,	%f21,	%f20
loop_677:
	umulcc	%g6,	0x06E7,	%i7
	sth	%g7,	[%l7 + 0x20]
	wr	%i0,	0x0629,	%ccr
	xnor	%o0,	0x02CA,	%l1
	rdhpr	%htba,	%i4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x3B5, 	%hsys_tick_cmpr
	wrpr	%l2,	%o1,	%pil
	array16	%o3,	%i5,	%g3
	subc	%g2,	%i6,	%g1
	prefetch	[%l7 + 0x6C],	 0x0
	sra	%i2,	0x13,	%i3
	movge	%xcc,	%o5,	%g4
	fpadd32	%f28,	%f8,	%f0
	rdhpr	%hintp,	%o2
	wr	%l6,	%g5,	%softint
	and	%l3,	%o6,	%l4
	addcc	%l5,	%i1,	%g6
	rd	%softint,	%i7
	fmovdg	%xcc,	%f16,	%f10
	wr	%g7,	%o4,	%pic
	rdpr	%tl,	%o0
	fmul8sux16	%f28,	%f22,	%f18
	orn	%l1,	%i0,	%l0
	rd	%pc,	%o7
	rd	%y,	%l2
	rdpr	%otherwin,	%i4
	rdpr	%wstate,	%o1
	movcc	%xcc,	%i5,	%o3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%pc,	%g1
	std	%f20,	[%l7 + 0x40]
	smul	%g2,	%i2,	%i3
	rdhpr	%hpstate,	%g4
	tleu	%xcc,	0x7
	orncc	%o5,	0x13C8,	%l6
	rdpr	%tba,	%g5
	movrlez	%l3,	0x276,	%o2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x9B9, 	%hsys_tick_cmpr
	movleu	%icc,	%l4,	%i1
	rdpr	%gl,	%l5
	wr	%i7,	0x05FD,	%y
	popc	%g7,	%o4
	rdpr	%gl,	%g6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fmuld8ulx16	%f22,	%f1,	%f8
	wrpr	%l1,	%l0,	%cwp
        wr    %g0,    0xe,    %pcr    ! changed.
	wrpr	%i0,	0x0AC1,	%pil
	rdhpr	%hintp,	%i4
	tvc	%icc,	0x0
	bl	%icc,	loop_678
	rd	%softint,	%l2
	edge8l	%i5,	%o1,	%o3
	rdpr	%cleanwin,	%i6
loop_678:
	array8	%g1,	%g3,	%g2
	wrpr	%i2,	%i3,	%cwp
	wr	%o5,	%g4,	%clear_softint
	rd	%pc,	%g5
	rdhpr	%htba,	%l6
	rdhpr	%htba,	%o2
	rd	%tick_cmpr,	%l3
	rdhpr	%hsys_tick_cmpr,	%l4
	wr 	%g0, 	0x7, 	%fprs
	movneg	%icc,	%i7,	%o6
	rdpr	%cleanwin,	%o4
	wr 	%g0, 	0x6, 	%fprs
	sllx	%l1,	0x15,	%l0
	srlx	%o0,	%i0,	%o7
	rdhpr	%hsys_tick_cmpr,	%l2
	and	%i4,	%i5,	%o1
	rdhpr	%htba,	%i6
	wrpr	%o3,	%g1,	%tick
	rd	%softint,	%g3
	tleu	%xcc,	0x3
	add	%l7,	0x58,	%l6
	wr	%g0,	0x10,	%asi
	ldxa	[%l6] %asi,	%g2
	casxa	[%l6] %asi,	%g2,	%i3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%htba,	%g4
        wr    %g0,    0xe,    %pcr    ! changed.
	array8	%o2,	%l6,	%l3
	wr	%l4,	0x0EE7,	%pic
	tneg	%xcc,	0x0
	rdpr	%canrestore,	%l5
	tn	%icc,	0x3
	rdhpr	%htba,	%i1
	xnor	%i7,	%o4,	%o6
	wrpr	%g6,	0x0684,	%cwp
	movn	%icc,	%g7,	%l0
	siam	0x2
	rdpr	%cwp,	%o0
	fmovrdlez	%l1,	%f30,	%f30
	wrpr	%i0,	%l2,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x20D, 	%hsys_tick_cmpr
	wrpr	%i5,	0x13B6,	%tick
	wrpr	%o1,	%o3,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x436, 	%sys_tick_cmpr
	rdhpr	%hpstate,	%g3
	rdpr	%tba,	%g2
	rd	%sys_tick_cmpr,	%i3
	movcs	%xcc,	%i6,	%o5
	smulcc	%g5,	%i2,	%o2
	andcc	%l6,	%g4,	%l3
	tvc	%xcc,	0x6
	rd	%ccr,	%l5
	movre	%i1,	0x21D,	%i7
	xor	%l4,	0x1607,	%o6
	rd	%pc,	%o4
	wr	%g6,	0x02EC,	%softint
	add	%g7,	0x1AB2,	%o0
	mova	%xcc,	%l1,	%l0
	rdhpr	%hpstate,	%i0
	ta	%xcc,	0x2
	wr	%l2,	%o7,	%pic
	smul	%i4,	0x16E1,	%i5
	edge32	%o3,	%g1,	%o1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x7A7, 	%hsys_tick_cmpr
	rdpr	%cwp,	%i6
	rd	%asi,	%g2
	tvs	%icc,	0x5
	wrpr	%g5,	0x1E88,	%pil
	movge	%icc,	%i2,	%o5
	wr	%o2,	0x0F16,	%set_softint
	sdivcc	%l6,	0x179E,	%g4
	edge8l	%l3,	%l5,	%i7
        wr    %g0,    0xe,    %pcr    ! changed.
	tcs	%xcc,	0x0
	subc	%i1,	0x0ABF,	%o4
	wr	%g0,	0x10,	%asi
	stha	%g6,	[%l7 + 0x44] %asi

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%hsys_tick_cmpr,	%g7
	ble,pn	%icc,	loop_679
	wr	%o0,	%l0,	%sys_tick
	fmovscs	%icc,	%f30,	%f20
	edge32n	%i0,	%l2,	%o7
loop_679:
	rdhpr	%htba,	%l1
	ldstub	[%l7 + 0x2E],	%i5
	fnot1	%f30,	%f10
	rdpr	%gl,	%o3
	sdivcc	%i4,	0x1ECF,	%o1
	wr	%g1,	0x145F,	%pic
	fbl,a	%fcc2,	loop_680
	wr	%i3,	0x1625,	%pic
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%i6,	0x110A,	%pic
loop_680:
	fands	%f10,	%f1,	%f6
	wrpr	%g2,	0x1653,	%tick
        wr    %g0,    0xe,    %pcr    ! changed.
	rd	%y,	%i2
	std	%f4,	[%l7 + 0x78]
	wr	%o5,	%o2,	%ccr
	fmovdne	%xcc,	%f5,	%f14
	tleu	%icc,	0x7
	or	%l6,	0x073C,	%g4
	wrpr	%l3,	0x0400,	%cwp
	wrpr	%l5,	0x16CA,	%pil
	rdhpr	%htba,	%g3
	rd	%fprs,	%i7
	wr	%g0,	0x89,	%asi
	stwa	%i1,	[%l7 + 0x50] %asi
	rdhpr	%hsys_tick_cmpr,	%o4
	rdhpr	%hsys_tick_cmpr,	%l4
	wrpr	%o6,	%g6,	%tick
	edge16l	%g7,	%o0,	%l0
	rdhpr	%hpstate,	%i0
	wrpr	%o7,	%l1,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%htba,	%l2
	rdhpr	%htba,	%i4
	rdpr	%pil,	%o1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xEDE, 	%hsys_tick_cmpr
	wrpr	%i6,	0x0C24,	%cwp
	sethi	0x1AEC,	%o3
	wr	%g5,	0x171D,	%ccr
	fpack16	%f12,	%f12
	fmuld8ulx16	%f10,	%f4,	%f8
	rdpr	%canrestore,	%i2
	fpack16	%f22,	%f18
	wrpr	%o5,	%o2,	%cwp
	wr	%g0,	0x88,	%asi
	lduba	[%l7 + 0x64] %asi,	%g2
	edge8	%l6,	%g4,	%l5
	rd	%pc,	%g3
	taddcctv	%i7,	%i1,	%o4
	fornot1	%f6,	%f20,	%f10
	rdpr	%tba,	%l3
	rd	%ccr,	%o6
	ldd	[%l7 + 0x70],	%f6
	movvc	%icc,	%l4,	%g6
	rdpr	%cansave,	%g7
!Yo - got one - imm_asi 0x50 
!And yo - immediate is 0x18
	set	0x18, %o5
	ldxa	[%g0 + %o5] 0x50,	%o0
	wrpr	%i0,	0x07D9,	%cwp
	xorcc	%o7,	%l0,	%i5
	bl,a,pn	%icc,	loop_681
	srlx	%l2,	%i4,	%o1
	wrpr	%l1,	%g1,	%cwp
	wr	%i3,	%i6,	%pic
loop_681:
	nop
	wr	%g0,	0x23,	%asi
	stda	%g4,	[%l7 + 0x38] %asi
	membar	#Sync
	rd	%pc,	%i2
	tgu	%xcc,	0x7
	fmovsleu	%icc,	%f8,	%f26
	rd	%fprs,	%o3
	ble,a	%icc,	loop_682
	umul	%o5,	%g2,	%l6
	fnot1	%f10,	%f8
	rdhpr	%htba,	%g4
loop_682:
	rd	%y,	%o2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	array16	%i7,	%i1,	%l5
	tvs	%xcc,	0x7
	fmovsa	%xcc,	%f25,	%f8
	movrlez	%o4,	%o6,	%l4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	nop
	setx loop_683, %l0, %l1
	jmpl %l1, %o0
	tleu	%xcc,	0x4
	wrpr	%i0,	0x0E76,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_683:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	movn	%xcc,	%i5,	%i4
	array32	%l1,	%g1,	%o1
	rdpr	%tba,	%i6
	fornot2s	%f14,	%f2,	%f19
	rdpr	%cansave,	%i3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%o5,	0x0D80,	%pil
	rd	%sys_tick_cmpr,	%g2
	wrpr	%l6,	%g4,	%pil
	fnands	%f13,	%f15,	%f26
	mova	%xcc,	%o2,	%i2
	rdhpr	%hpstate,	%i7
	fxor	%f2,	%f12,	%f14
	wr	%g0,	0x19,	%asi
	stba	%g3,	[%l7 + 0x71] %asi
	edge16	%i1,	%o4,	%o6
	movrne	%l5,	%g6,	%g7
	rdhpr	%hpstate,	%l4
	sethi	0x0855,	%o0
	sir	0x1AC2
	wrpr	%i0,	%o7,	%tick
	rdhpr	%hsys_tick_cmpr,	%l3
	fmovse	%xcc,	%f21,	%f17
	wrpr	%l0,	%i5,	%cwp
	fone	%f30
	array32	%l2,	%l1,	%i4
	addccc	%o1,	0x08B4,	%i6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xFC0, 	%hsys_tick_cmpr
	smul	%g5,	0x1D07,	%o3
	wrpr	%i3,	%g2,	%tick
	rdpr	%gl,	%l6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fmovrdlz	%o5,	%f4,	%f26
	rdpr	%tba,	%o2
	wr	%i7,	0x159B,	%clear_softint
	wrpr	%g3,	%i2,	%cwp
	wrpr	%i1,	%o6,	%cwp
	fabsd	%f14,	%f12
	xor	%l5,	%g6,	%o4
	fmovdvs	%icc,	%f20,	%f22
	array8	%g7,	%o0,	%i0
!Yo - got one - imm_asi 0x21 
!And yo - immediate is 0x110
	wr	%g0,	0x21,	%asi
	ldxa	[%g0 + 0x110] %asi,	%l4
	wrpr	%o7,	0x006C,	%tick
	bg,a,pn	%xcc,	loop_684
	rd	%sys_tick_cmpr,	%l3
	rdhpr	%hpstate,	%i5
	fmovdpos	%icc,	%f16,	%f25
loop_684:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
        wr    %g0,    0xe,    %pcr    ! changed.
	ldub	[%l7 + 0x33],	%i6
	rdpr	%canrestore,	%g1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x599, 	%sys_tick_cmpr
	movleu	%xcc,	%o1,	%i3
	set	0x37, %o3
	lduba	[%l7 + %o3] 0x04,	%g2
	rdpr	%wstate,	%l6
	edge16ln	%g4,	%o5,	%o2
	wrpr	%i7,	0x1F0D,	%tick
	fxnor	%f18,	%f10,	%f26
	stx	%i2,	[%l7 + 0x28]
	fcmpeq32	%f6,	%f4,	%g3
	wr	%g0,	0x80,	%asi
	stda	%i0,	[%l7 + 0x10] %asi

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x3F9, 	%sys_tick_cmpr
	tsubcc	%l5,	%g7,	%o4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x8D5, 	%hsys_tick_cmpr
	rd	%fprs,	%l4
	wrpr	%i0,	%l3,	%tick
	wrpr	%i5,	0x1B7B,	%pil
	wr	%o7,	%l1,	%softint
	movre	%l2,	%i4,	%i6
	orcc	%l0,	%g1,	%g5
	rdhpr	%hintp,	%o1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%pil,	%l6
	wr	%o3,	%g4,	%sys_tick
	set	0x18, %l1
	lda	[%l7 + %l1] 0x04,	%f5
	wrpr	%o2,	%i7,	%pil
	edge32n	%i2,	%g3,	%i1
	fblg,a	%fcc1,	loop_685
	smulcc	%o6,	%g6,	%l5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x182, 	%hsys_tick_cmpr
	udiv	%g7,	0x1038,	%o4
loop_685:
	fmovde	%icc,	%f17,	%f20

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x738, 	%hsys_tick_cmpr
	subcc	%l4,	0x173F,	%i0
	srlx	%l3,	%o7,	%i5
	rdhpr	%hintp,	%l1
        wr    %g0,    0xe,    %pcr    ! changed.
	movl	%xcc,	%i6,	%i4
	wrpr	%l0,	0x1B60,	%cwp
	fmovrsne	%g1,	%f8,	%f16
	wrpr	%g5,	%i3,	%pil
	addccc	%g2,	%o1,	%l6
	wr	%g0,	0x04,	%asi
	ldda	[%l7 + 0x70] %asi,	%g4
	wr	%o3,	%i7,	%set_softint
	movg	%xcc,	%i2,	%g3
	fmovde	%xcc,	%f11,	%f15
	rdpr	%cwp,	%i1
	rdhpr	%htba,	%o2
	xorcc	%o6,	0x0C8D,	%l5
	wrpr	%g6,	%o5,	%tick
	rdpr	%tl,	%o4
	wrpr	%o0,	0x0D7C,	%pil
	set	0x1C, %o6
	ldsha	[%l7 + %o6] 0x14,	%l4
	wrpr	%g7,	%i0,	%tick
	ta	%icc,	0x2
	rdhpr	%hpstate,	%l3
	rdhpr	%hintp,	%o7
	movrgez	%l1,	%l2,	%i6
	edge8ln	%i4,	%i5,	%l0
	rdpr	%tba,	%g1
	wr	%i3,	0x1F0D,	%clear_softint
	rdhpr	%htba,	%g2
	be,a	loop_686
	rdpr	%otherwin,	%g5
	set	0x70, %i0
	stwa	%o1,	[%l7 + %i0] 0x2f
	membar	#Sync
loop_686:
	fcmpeq32	%f4,	%f16,	%l6
	rd	%asi,	%g4
	std	%o2,	[%l7 + 0x50]
	wrpr	%i7,	%i2,	%cwp
	wr	%g3,	0x00AB,	%sys_tick
	rdhpr	%hintp,	%i1
	brz,a	%o6,	loop_687
	edge32n	%o2,	%g6,	%l5
	and	%o4,	0x1489,	%o0
        wr    %g0,    0xe,    %pcr    ! changed.
loop_687:
	umulcc	%g7,	0x1DF5,	%l3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xD35, 	%hsys_tick_cmpr
	rd	%fprs,	%l2
	rdhpr	%hintp,	%l1
	rdpr	%tl,	%i4
	edge8ln	%i6,	%l0,	%i5
	sir	0x0E57
	rdhpr	%hpstate,	%g1
	nop
	setx	loop_688,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	rdpr	%pil,	%g2
	rd	%tick_cmpr,	%g5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x812, 	%hsys_tick_cmpr
loop_688:
	tle	%xcc,	0x5
	edge8ln	%i3,	%g4,	%l6
	te	%icc,	0x3
	taddcc	%o3,	%i2,	%g3
	rd	%softint,	%i7
	wrpr	%o6,	0x0B14,	%pil
	edge32ln	%i1,	%o2,	%g6
	fmul8x16	%f1,	%f16,	%f30
	rd	%softint,	%l5
	add	%o0,	0x07E5,	%o4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%gl,	%g7
	udiv	%l2,	0x0026,	%l1
	fandnot1s	%f24,	%f27,	%f12
	rdhpr	%hpstate,	%o7
	udiv	%i4,	0x15AE,	%l0
	rdpr	%tba,	%i6
	fmovdvs	%xcc,	%f7,	%f19
	rdpr	%otherwin,	%i5
	wr	%g2,	0x0344,	%ccr
	fmovscc	%xcc,	%f14,	%f21
	rdpr	%otherwin,	%g5
	rdhpr	%hpstate,	%g1
	fandnot2s	%f12,	%f11,	%f2
	wr	%i3,	0x15FE,	%ccr
	rdpr	%gl,	%o1
	rd	%tick_cmpr,	%l6
	udiv	%o3,	0x0ABD,	%i2
	wr	%g4,	%g3,	%y
	rd	%fprs,	%o6
	rd	%pc,	%i7
	rdhpr	%hpstate,	%o2
	movcs	%xcc,	%g6,	%l5
	wrpr	%i1,	%o0,	%cwp
	rdhpr	%htba,	%o4
	fbuge,a	%fcc3,	loop_689
	orncc	%o5,	%l4,	%i0
	wrpr	%l3,	0x0439,	%pil
	ldub	[%l7 + 0x5B],	%g7
loop_689:
	rd	%asi,	%l1
	umulcc	%l2,	%i4,	%o7
	add	%i6,	%l0,	%i5
	rd	%softint,	%g5
	rdpr	%cansave,	%g2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	wrpr	%l6,	%o3,	%cwp
	rd	%tick_cmpr,	%g1
	movrgz	%g4,	%i2,	%o6
	rdpr	%canrestore,	%i7
	rdhpr	%hsys_tick_cmpr,	%g3
	rdpr	%tba,	%g6
	andncc	%l5,	%o2,	%i1
	rdhpr	%hsys_tick_cmpr,	%o0
	wrpr	%o5,	%o4,	%cwp
	rdhpr	%hsys_tick_cmpr,	%l4
	rdhpr	%hpstate,	%i0
	wr	%g7,	%l3,	%set_softint
	rdpr	%canrestore,	%l2
	edge32	%l1,	%i4,	%o7
	prefetch	[%l7 + 0x18],	 0x2
	rd	%tick_cmpr,	%l0
	wrpr	%i6,	%i5,	%pil
	rdpr	%cansave,	%g5
	siam	0x3
	te	%xcc,	0x1
	udiv	%i3,	0x0CC9,	%o1
	sra	%g2,	0x10,	%o3
	wrpr	%l6,	0x0146,	%cwp
	wr	%g0,	0x19,	%asi
	sta	%f3,	[%l7 + 0x18] %asi
	rdhpr	%hintp,	%g4
	rdpr	%canrestore,	%i2
	ldstub	[%l7 + 0x27],	%g1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%i7,	%g6,	%sys_tick
	rdpr	%tl,	%l5
	rdhpr	%htba,	%g3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xA1B, 	%hsys_tick_cmpr
	tge	%icc,	0x4
	rdhpr	%htba,	%o5
	rdpr	%pil,	%i1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xB78, 	%sys_tick_cmpr
	wrpr	%o4,	0x0E0A,	%pil
	rdhpr	%htba,	%g7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x7E5, 	%hsys_tick_cmpr
	fmul8ulx16	%f14,	%f24,	%f30
	rdpr	%cleanwin,	%l2
	srax	%i4,	0x01,	%o7
	sra	%l1,	0x16,	%i6
	andncc	%i5,	%l0,	%i3
	rdhpr	%hpstate,	%o1
	rdpr	%otherwin,	%g2
	fbg	%fcc2,	loop_690
	fcmpeq32	%f22,	%f12,	%g5
	array32	%l6,	%o3,	%i2
	sir	0x1202
loop_690:
	fmovrsgz	%g4,	%f30,	%f27
	fcmpne32	%f26,	%f8,	%g1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x7A7, 	%hsys_tick_cmpr
	std	%f2,	[%l7 + 0x70]
	andncc	%o6,	%l5,	%o2
	fmovdneg	%xcc,	%f7,	%f7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	rd	%sys_tick_cmpr,	%o0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xB9C, 	%sys_tick_cmpr
	rd	%sys_tick_cmpr,	%l4
	wrpr	%o5,	0x056B,	%tick
	stx	%i0,	[%l7 + 0x08]
	rdpr	%tba,	%o4
	rdhpr	%hintp,	%l3
	rd	%fprs,	%l2
	rd	%softint,	%i4
	tg	%xcc,	0x0
	fmovsg	%xcc,	%f21,	%f10
	mulx	%o7,	%g7,	%i6
	brgez,a	%i5,	loop_691
	movne	%icc,	%l1,	%i3
	fba,a	%fcc3,	loop_692
	wrpr	%l0,	0x15F4,	%pil
loop_691:
	edge16	%o1,	%g5,	%g2
	andcc	%l6,	%o3,	%g4
loop_692:
	wrpr	%i2,	0x103C,	%pil
	wrpr	%i7,	%g6,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x36D, 	%tick_cmpr
	edge16n	%o2,	%o0,	%g3
	wrpr	%l5,	%l4,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fzeros	%f18
	addccc	%i0,	%o4,	%i1
	wr	%l2,	%i4,	%clear_softint
	rdpr	%wstate,	%l3
	rdhpr	%htba,	%o7
	rdpr	%cwp,	%i6
	movcs	%icc,	%i5,	%l1
	rdhpr	%htba,	%g7
	movvc	%xcc,	%l0,	%o1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	ldd	[%l7 + 0x40],	%g4
	bcs,pt	%icc,	loop_693
	rd	%y,	%o3
	rdhpr	%hintp,	%l6
	xnor	%i2,	0x0CD5,	%g4
loop_693:
	wr	%g6,	0x0ED0,	%sys_tick
	wrpr	%o6,	%i7,	%tick
	rdpr	%pil,	%o2
	brnz	%g1,	loop_694
	movl	%icc,	%g3,	%l5
	rdpr	%tl,	%l4
	std	%o0,	[%l7 + 0x20]
loop_694:
	fnand	%f10,	%f30,	%f12
	xorcc	%o5,	%o4,	%i0
	rdpr	%canrestore,	%l2
	rdpr	%cleanwin,	%i4
	andncc	%i1,	%l3,	%o7
	smulcc	%i6,	0x0651,	%i5
	rd	%pc,	%l1
        wr    %g0,    0xe,    %pcr    ! changed.
	movle	%icc,	%o1,	%g7
	rdpr	%wstate,	%i3
	fmovdge	%xcc,	%f12,	%f23
	mulscc	%g2,	0x0529,	%g5
	srl	%o3,	%i2,	%l6
        wr    %g0,    0xe,    %pcr    ! changed.
	nop
	setx	loop_695,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fcmpne32	%f24,	%f24,	%o6
	wr	%i7,	%o2,	%pic
	st	%f24,	[%l7 + 0x58]
loop_695:
	rd	%softint,	%g6
	orcc	%g3,	0x1D2D,	%g1
	movvs	%icc,	%l5,	%o0
	rdpr	%pil,	%o5
	rd	%asi,	%o4
	rd	%tick_cmpr,	%l4
	tn	%icc,	0x2
	rdhpr	%hpstate,	%i0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xDEF, 	%hsys_tick_cmpr
	wrpr	%l2,	0x1287,	%tick
	udiv	%l3,	0x0C74,	%i1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	movgu	%icc,	%i5,	%l1
	rdhpr	%hsys_tick_cmpr,	%l0
	fmovsle	%icc,	%f30,	%f29
	rdpr	%otherwin,	%o1
	rdhpr	%hintp,	%g7
	movcc	%xcc,	%i6,	%g2
	sub	%g5,	0x0162,	%i3
	rdhpr	%htba,	%i2
	rd	%pc,	%o3
	wrpr	%l6,	%g4,	%pil
	orn	%i7,	%o6,	%g6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	addcc	%o2,	%l5,	%g1
	wrpr	%o5,	%o4,	%cwp
	rd	%softint,	%o0
	edge8l	%l4,	%i4,	%l2
	tcs	%icc,	0x3
	rd	%y,	%i0
	wrpr	%l3,	%o7,	%pil
	wrpr	%i1,	0x1034,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x01A, 	%sys_tick_cmpr
	stx	%l0,	[%l7 + 0x18]
	tpos	%icc,	0x1
	wr	%g0,	0x10,	%asi
	swapa	[%l7 + 0x3C] %asi,	%o1
	andcc	%g7,	0x1E77,	%g2
	tleu	%icc,	0x5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	subc	%i2,	0x04CA,	%i6
	srl	%o3,	0x0C,	%l6
	fblg	%fcc0,	loop_696
	srl	%g4,	%i7,	%o6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	movne	%xcc,	%g6,	%l5
loop_696:
	rdhpr	%hpstate,	%o2
	rd	%pc,	%g1
	sdivcc	%o5,	0x028A,	%o0
	movre	%l4,	%o4,	%l2
	fcmpes	%fcc3,	%f28,	%f11
	rdpr	%gl,	%i4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	rdhpr	%hsys_tick_cmpr,	%l3
	rd	%tick_cmpr,	%i1
	subcc	%o7,	%l1,	%i5
	move	%icc,	%o1,	%g7
	mulx	%l0,	%g2,	%g5
	wrpr	%i3,	0x01BF,	%cwp
	ba,a	%icc,	loop_697
	rd	%sys_tick_cmpr,	%i2
	orncc	%i6,	0x1860,	%l6
	std	%o2,	[%l7 + 0x30]
loop_697:
	rdhpr	%hintp,	%i7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	nop
	setx loop_698, %l0, %l1
	jmpl %l1, %g3
	rdpr	%pil,	%l5
	wr	%g6,	%g1,	%pic
	fmovsge	%icc,	%f23,	%f29
loop_698:
	edge8n	%o5,	%o2,	%o0
	rd	%y,	%l4
	taddcctv	%o4,	0x0571,	%i4
	array8	%i0,	%l2,	%l3
	wrpr	%o7,	%i1,	%pil
	rd	%ccr,	%i5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	rd	%pc,	%l1
	wr	%g7,	0x137A,	%ccr
	rd	%asi,	%o1
	sll	%g2,	0x03,	%g5
	rd	%ccr,	%i3
	rd	%sys_tick_cmpr,	%i2
	array16	%i6,	%l6,	%o3
	nop
	set	0x24, %i5
	ldub	[%l7 + %i5],	%l0
	rdhpr	%hintp,	%o6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xA8B, 	%hsys_tick_cmpr
	rd	%tick_cmpr,	%g3
	movge	%xcc,	%i7,	%g6
	rdpr	%canrestore,	%l5
	wrpr	%o5,	%g1,	%cwp
	umul	%o2,	0x1C7C,	%l4
	wrpr	%o0,	%o4,	%tick
	edge8ln	%i4,	%l2,	%i0
	movrlz	%o7,	%l3,	%i5
	sethi	0x142B,	%i1
	rdpr	%cwp,	%l1
	mova	%xcc,	%o1,	%g2
	rd	%pc,	%g5
	fone	%f26
	fmovs	%f22,	%f26
	wrpr	%i3,	%g7,	%pil
	rdpr	%cleanwin,	%i6
	wrpr	%i2,	0x1316,	%pil
	or	%o3,	%l6,	%l0
	fzero	%f22
	umulcc	%g4,	0x1436,	%g3
	rdpr	%gl,	%o6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x2C6, 	%hsys_tick_cmpr
	rdhpr	%hsys_tick_cmpr,	%g6
	rdpr	%cleanwin,	%o5
	movre	%g1,	0x0BA,	%l5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x49A, 	%tick_cmpr
	rdpr	%cleanwin,	%o0
	rdhpr	%hsys_tick_cmpr,	%o4
	tneg	%icc,	0x5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	udivx	%i4,	0x0015,	%i0
	fpadd16	%f6,	%f8,	%f20
	wrpr	%l3,	0x0700,	%cwp
	fbg,a	%fcc2,	loop_699
	rd	%pc,	%i5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x797, 	%hsys_tick_cmpr
	rdpr	%tba,	%o1
loop_699:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x029, 	%hsys_tick_cmpr
	fnands	%f20,	%f20,	%f17
	rdhpr	%hpstate,	%g2
	rdhpr	%hpstate,	%i3
	fcmpne32	%f28,	%f8,	%i6
	stb	%g7,	[%l7 + 0x40]
	rdpr	%cleanwin,	%o3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%hsys_tick_cmpr,	%l0
	rdpr	%otherwin,	%i2
	rd	%y,	%g4
	movrne	%o6,	%i7,	%g3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x71F, 	%tick_cmpr
	fmovdneg	%xcc,	%f19,	%f15
	rdhpr	%htba,	%l5
	udivcc	%o5,	0x1FCB,	%l4
	wrpr	%o2,	0x1E99,	%pil
	wrpr	%o0,	0x0A90,	%tick
	rd	%sys_tick_cmpr,	%o4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	rd	%asi,	%i0
	rd	%ccr,	%l3
	sth	%i5,	[%l7 + 0x38]
	edge16ln	%i1,	%o1,	%l1
	xnor	%o7,	0x1B20,	%g2
	tneg	%icc,	0x1
	edge16ln	%i3,	%g5,	%i6
	rdhpr	%hpstate,	%g7
	mova	%xcc,	%o3,	%l0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x7B6, 	%hsys_tick_cmpr
	movrlez	%l6,	0x01F,	%o6
	rd	%asi,	%g4
	fmovrdlez	%i7,	%f10,	%f10
	rd	%ccr,	%g3
	movgu	%icc,	%g6,	%l5
	wr	%o5,	0x18CB,	%sys_tick
	movleu	%xcc,	%g1,	%l4
	fblg,a	%fcc2,	loop_700
	be,a	loop_701
	subccc	%o0,	0x042D,	%o2
	fmovdcs	%xcc,	%f25,	%f7
loop_700:
	rd	%sys_tick_cmpr,	%o4
loop_701:
	xorcc	%l2,	%i0,	%l3
	smulcc	%i5,	%i4,	%i1
	wrpr	%o1,	0x08BD,	%cwp
	fmovsvc	%xcc,	%f27,	%f16
	rd	%pc,	%l1
	tneg	%xcc,	0x5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x522, 	%hsys_tick_cmpr
	edge16l	%g5,	%i6,	%o7
	movrlz	%g7,	0x3C9,	%o3
	rd	%sys_tick_cmpr,	%l0
	rdpr	%tl,	%i2
	movcc	%icc,	%o6,	%l6
	sra	%i7,	0x18,	%g4
	rdpr	%cwp,	%g6
	rdhpr	%hsys_tick_cmpr,	%l5
	rd	%softint,	%g3
	umul	%g1,	%l4,	%o5
	wr	%o2,	%o0,	%y
	taddcctv	%o4,	0x190A,	%i0
	rdhpr	%hpstate,	%l3
	movgu	%xcc,	%i5,	%l2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	wr	%g0,	0x19,	%asi
	ldsba	[%l7 + 0x51] %asi,	%l1
	wrpr	%o1,	0x1D42,	%pil
	wrpr	%g2,	0x0F4E,	%cwp
	rdhpr	%hpstate,	%g5
	te	%xcc,	0x5
	array32	%i3,	%o7,	%g7
	tcs	%icc,	0x6
	wrpr	%o3,	%l0,	%cwp
	wr	%i2,	0x09C0,	%pic
	addc	%i6,	%l6,	%i7
	rdhpr	%hsys_tick_cmpr,	%g4
	fmul8ulx16	%f0,	%f10,	%f0
	movl	%icc,	%o6,	%g6
	move	%xcc,	%l5,	%g3
	rd	%ccr,	%l4
	rd	%sys_tick_cmpr,	%o5
	rdpr	%canrestore,	%o2
	alignaddrl	%g1,	%o0,	%i0
	fmovsle	%xcc,	%f21,	%f25
	rdhpr	%hsys_tick_cmpr,	%l3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fcmpgt16	%f2,	%f28,	%l2
	array8	%o4,	%i4,	%l1
	sub	%i1,	0x05D9,	%g2
	rdhpr	%htba,	%g5
	wrpr	%o1,	0x1CA1,	%pil
	wrpr	%i3,	%o7,	%cwp
	wrpr	%g7,	%o3,	%pil
	wr	%i2,	0x0435,	%y
	rdpr	%otherwin,	%l0
	fblg	%fcc3,	loop_702
	te	%icc,	0x3
	mulscc	%i6,	%i7,	%g4
	rd	%tick_cmpr,	%o6
loop_702:
	movvs	%xcc,	%l6,	%g6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	movgu	%xcc,	%l4,	%o5
	sub	%g3,	0x1739,	%g1
	fmovscc	%icc,	%f11,	%f1
	tpos	%xcc,	0x6
	rd	%fprs,	%o2
        wr    %g0,    0xe,    %pcr    ! changed.
	wr	%i0,	0x006A,	%y
	alignaddr	%l2,	%i5,	%i4
	rdpr	%cwp,	%o4
	rdhpr	%hpstate,	%l1
	bne,pt	%xcc,	loop_703
	fpsub32s	%f4,	%f11,	%f3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
!Yo - got one - imm_asi 0x52 
!And yo - immediate is 0x120
	set	0x120, %g2
	ldxa	[%g0 + %g2] 0x52,	%g2
loop_703:
	xorcc	%g5,	%o1,	%i3
	wr	%o7,	%g7,	%pic
	rdpr	%gl,	%i1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xCFF, 	%hsys_tick_cmpr
	add	%o3,	0x06D5,	%i7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fandnot1	%f30,	%f6,	%f2
	popc	0x0F21,	%l6
	rdhpr	%htba,	%g6
	wrpr	%g4,	%l4,	%cwp
	rdpr	%otherwin,	%l5
	tge	%icc,	0x1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	rd	%ccr,	%g1
	rdpr	%tl,	%o5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x8E8, 	%hsys_tick_cmpr
	brz,a	%i0,	loop_704
	rdpr	%tl,	%l3
	set	0x28, %o7
	lduha	[%l7 + %o7] 0x18,	%i5
loop_704:
	bvc,a,pn	%icc,	loop_705
	fone	%f0
	stbar
	fmovrslez	%i4,	%f29,	%f13
loop_705:
	bl,pt	%xcc,	loop_706
	rd	%fprs,	%l2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xF55, 	%hsys_tick_cmpr
	tgu	%icc,	0x4
loop_706:
	rdhpr	%hsys_tick_cmpr,	%l1
	alignaddr	%g2,	%o1,	%g5
	rd	%sys_tick_cmpr,	%o7
	ldstub	[%l7 + 0x31],	%g7
	std	%f18,	[%l7 + 0x60]
	srlx	%i1,	0x1A,	%i3
	brlz,a	%l0,	loop_707
	wr	%o3,	%i7,	%sys_tick
	rdpr	%tl,	%i6
	te	%icc,	0x3
loop_707:
	rd	%tick_cmpr,	%i2
	rd	%fprs,	%l6
	tneg	%xcc,	0x1
	edge8n	%o6,	%g6,	%g4
	wrpr	%l4,	%g3,	%tick
	rdpr	%gl,	%g1
	rd	%pc,	%o5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	ble,pn	%icc,	loop_708
	tneg	%xcc,	0x2
	rdpr	%cleanwin,	%o0
	wr	%o2,	%i0,	%set_softint
loop_708:
	ta	%icc,	0x2
	alignaddrl	%l3,	%i5,	%i4
	wrpr	%o4,	%l2,	%pil
	set	0x68, %i7
	stxa	%g2,	[%l7 + %i7] 0xea
	membar	#Sync
	add	%l7,	0x78,	%l6
	wr	%g0,	0x11,	%asi
	casa	[%l6] 0x11,	%l1,	%o1
	array32	%g5,	%g7,	%i1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x724, 	%hsys_tick_cmpr
	rdhpr	%hintp,	%l0
	fmovdvs	%icc,	%f14,	%f9
	orcc	%o3,	0x0D34,	%i3
	wrpr	%i6,	0x14F0,	%tick
	rd	%pc,	%i7
	rd	%asi,	%i2
	umulcc	%l6,	0x0064,	%o6
	fbue	%fcc1,	loop_709
	fcmpeq32	%f4,	%f10,	%g4
	wr	%g6,	%l4,	%sys_tick
	rdpr	%tl,	%g3
loop_709:
	movcs	%xcc,	%o5,	%l5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%tba,	%g1
	stb	%i0,	[%l7 + 0x5A]
	rd	%pc,	%i5
	wr	%i4,	%l3,	%set_softint
	wrpr	%l2,	0x160D,	%tick
	fble,a	%fcc0,	loop_710
	ld	[%l7 + 0x24],	%f17
	wrpr	%o4,	%l1,	%cwp
	wr	%g2,	%o1,	%set_softint
loop_710:
	wrpr	%g5,	%i1,	%cwp
	rdpr	%wstate,	%o7
	bleu	loop_711
	wrpr	%g7,	0x1432,	%pil
	fbl	%fcc0,	loop_712
	rdhpr	%hpstate,	%l0
loop_711:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fmovrslz	%i6,	%f31,	%f24
loop_712:
	rdhpr	%htba,	%i7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%canrestore,	%o6
	rd	%asi,	%l6
	sir	0x0515
	fmul8ulx16	%f28,	%f12,	%f14
	fnors	%f21,	%f29,	%f25

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	movl	%xcc,	%l4,	%g6
	movn	%xcc,	%g3,	%l5
	rdhpr	%hpstate,	%o0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x941, 	%tick_cmpr
	wrpr	%g1,	%i0,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%g0,	0x0c,	%asi
	ldxa	[%l7 + 0x20] %asi,	%i5
	sth	%l3,	[%l7 + 0x64]
	xnor	%l2,	0x08AF,	%i4
	rdhpr	%hsys_tick_cmpr,	%l1
	fcmple16	%f30,	%f16,	%o4
	wr	%o1,	%g5,	%ccr
	bgu	%xcc,	loop_713
	umulcc	%i1,	%o7,	%g7
	rdhpr	%htba,	%g2
	rdpr	%gl,	%i3
loop_713:
	rd	%asi,	%l0
	fmovsvs	%icc,	%f30,	%f8
	fornot1s	%f31,	%f2,	%f7
	addc	%i6,	0x1D38,	%i7
	wrpr	%i2,	0x02B1,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%o6,	0x03AD,	%y
	rdpr	%tba,	%g4
	wr 	%g0, 	0x5, 	%fprs
	set	0x50, %l6
	ldda	[%l7 + %l6] 0x15,	%g6
	tne	%xcc,	0x0
	wr	%l6,	%l5,	%softint
	tvs	%xcc,	0x1
	wrpr	%g3,	0x1E5D,	%cwp
	wrpr	%o2,	0x0509,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x6AA, 	%hsys_tick_cmpr
	rdhpr	%hpstate,	%i0
	sdivx	%o0,	0x081A,	%o5
	wr 	%g0, 	0x6, 	%fprs
	wr	%i4,	0x10AE,	%clear_softint
	movneg	%xcc,	%l2,	%o4
	wrpr	%o1,	0x043C,	%pil
	sdivcc	%g5,	0x12D0,	%i1
	rdpr	%pil,	%l1
        wr    %g0,    0xe,    %pcr    ! changed.
	move	%icc,	%i3,	%g2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x34A, 	%hsys_tick_cmpr
	movrgz	%i7,	%i6,	%o3
	rd	%pc,	%i2
	std	%f18,	[%l7 + 0x18]
	wr	%g4,	0x0D10,	%sys_tick
	xnor	%l4,	%g6,	%l6
	rdpr	%pil,	%l5
	edge16l	%o6,	%g3,	%g1
	rd	%fprs,	%i0
	rdpr	%tl,	%o0
	wr	%o5,	0x0241,	%clear_softint
	fexpand	%f11,	%f30
	wrpr	%i5,	%o2,	%tick
	fbge	%fcc1,	loop_714
	rdhpr	%hsys_tick_cmpr,	%l3
	rd	%sys_tick_cmpr,	%l2
	wrpr	%o4,	%i4,	%cwp
loop_714:
	rdhpr	%hpstate,	%g5
	rd	%y,	%o1
	rd	%asi,	%i1
	rdhpr	%hintp,	%g7
	wrpr	%l1,	0x1DDF,	%pil
	call	loop_715
	tleu	%xcc,	0x0
	fmovrsgz	%o7,	%f4,	%f8
	wr	%g2,	0x08D1,	%softint
loop_715:
	rd	%pc,	%l0
	rd	%sys_tick_cmpr,	%i3
	rd	%tick_cmpr,	%i7
	fcmple32	%f16,	%f4,	%i6
	call	loop_716
	xnor	%o3,	%g4,	%l4
	ldub	[%l7 + 0x57],	%i2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_716:
	bge,a	%icc,	loop_717
	wr	%l6,	0x10FB,	%sys_tick
	or	%l5,	%g3,	%o6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
loop_717:
	rdhpr	%hintp,	%o5
	wr	%i5,	0x1B73,	%y
	wr	%o2,	%l3,	%clear_softint

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	rdpr	%wstate,	%o0
        wr    %g0,    0xe,    %pcr    ! changed.
	rd	%softint,	%i1
	udivcc	%g7,	0x1514,	%l1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fbne	%fcc0,	loop_718
	wr 	%g0, 	0x5, 	%fprs
	andncc	%i7,	%i6,	%g2
	sra	%o3,	%l4,	%g4
loop_718:
	wrpr	%g6,	%i2,	%pil
	wr	%l5,	0x007A,	%pic
	rdhpr	%hintp,	%g3
	rd	%tick_cmpr,	%l6
	bpos	%icc,	loop_719
	bleu,a,pn	%xcc,	loop_720
	array8	%i0,	%g1,	%o6
	rdpr	%canrestore,	%i5
loop_719:
	rdhpr	%hintp,	%o2
loop_720:
	brlz,a	%o5,	loop_721
	rdhpr	%hintp,	%l3
	wr	%g0,	0x80,	%asi
	ldxa	[%l7 + 0x58] %asi,	%o4
loop_721:
	rd	%ccr,	%l2
	sllx	%i4,	%o1,	%g5
	andcc	%i1,	0x1F52,	%o0
	for	%f2,	%f20,	%f16
	set	0x1C, %g5
	ldswa	[%l7 + %g5] 0x11,	%l1
	edge8	%g7,	%o7,	%i3
	fnor	%f18,	%f14,	%f24
	xnor	%l0,	%i7,	%g2
	wr	%o3,	0x0793,	%softint
	tleu	%xcc,	0x7
	set	0x20, %g7
	stda	%i6,	[%l7 + %g7] 0x81
	addc	%g4,	%g6,	%l4
	array32	%i2,	%l5,	%l6
	rdpr	%cwp,	%g3
	rdhpr	%hsys_tick_cmpr,	%g1
	tneg	%xcc,	0x6
	wr 	%g0, 	0x6, 	%fprs
	fpsub32s	%f27,	%f14,	%f23
	rd	%ccr,	%i5
	fpackfix	%f12,	%f8
	mova	%icc,	%o2,	%l3
	edge8n	%o4,	%l2,	%o5
	tsubcctv	%o1,	%g5,	%i1
	fblg,a	%fcc1,	loop_722
	array8	%i4,	%l1,	%g7
	xorcc	%o0,	%o7,	%i3
	rd	%softint,	%l0
loop_722:
	tl	%xcc,	0x5
	rdhpr	%hpstate,	%i7
	move	%xcc,	%g2,	%i6
	rd	%asi,	%g4
	sll	%g6,	0x00,	%o3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fpackfix	%f8,	%f17
	andcc	%l6,	0x1026,	%g3
        wr    %g0,    0xe,    %pcr    ! changed.
	rdhpr	%hintp,	%g1
	ldstub	[%l7 + 0x2D],	%o6
	ldx	[%l7 + 0x28],	%i5
	nop
	setx	loop_723,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	rdhpr	%hintp,	%o2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xD19, 	%hsys_tick_cmpr
	tsubcctv	%l2,	0x100A,	%o5
loop_723:
	nop
	set	0x5C, %o2
	lduwa	[%l7 + %o2] 0x80,	%o1
	rdpr	%cleanwin,	%g5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x67D, 	%hsys_tick_cmpr
	rd	%y,	%o4
	swap	[%l7 + 0x68],	%l1
	add	%l7,	0x48,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] %asi,	%g7,	%o0
	rdpr	%cleanwin,	%i4
	rdpr	%wstate,	%i3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xB20, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xBEE, 	%hsys_tick_cmpr
	wrpr	%i6,	0x1E45,	%tick
	rdhpr	%hpstate,	%g4
	array32	%l0,	%g6,	%i2
	fmovd	%f2,	%f18
	tvs	%xcc,	0x5
	bcc,a,pn	%xcc,	loop_724
	wrpr	%o3,	0x0C8F,	%pil
	fexpand	%f30,	%f28

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x596, 	%hsys_tick_cmpr
loop_724:
	fbuge	%fcc3,	loop_725
	std	%g2,	[%l7 + 0x20]
	rdhpr	%htba,	%l4
	be,a,pt	%xcc,	loop_726
loop_725:
	edge8l	%l5,	%g1,	%i0
	wr	%i5,	%o2,	%pic
	wr	%g0,	0x0c,	%asi
	lduha	[%l7 + 0x2A] %asi,	%o6
loop_726:
	tsubcc	%l2,	%l3,	%o5
	sllx	%g5,	%o1,	%i1
	wrpr	%l1,	%o4,	%cwp
	wr	%g7,	%o0,	%sys_tick
	wrpr	%i4,	%o7,	%tick
	fbu	%fcc2,	loop_727
	sllx	%i3,	%g2,	%i6
	wrpr	%g4,	%l0,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x615, 	%hsys_tick_cmpr
loop_727:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	tvc	%xcc,	0x3
	tg	%icc,	0x0
	addcc	%o3,	0x0C18,	%g3
	edge16ln	%l6,	%l5,	%g1
	rdhpr	%htba,	%l4
	rdpr	%pil,	%i5
	wrpr	%i0,	%o6,	%cwp
	umulcc	%o2,	%l3,	%l2
	rd	%fprs,	%g5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x21A, 	%hsys_tick_cmpr
	orn	%o5,	0x0F63,	%i1
	wr	%o4,	%g7,	%set_softint
	umul	%o0,	0x15D6,	%l1
	edge32n	%i4,	%o7,	%g2
	set	0x20, %g3
	ldda	[%l7 + %g3] 0x04,	%i6
	fbul,a	%fcc0,	loop_728
	move	%icc,	%g4,	%l0
	ble,pn	%xcc,	loop_729
	rdhpr	%htba,	%i3
loop_728:
	rdpr	%otherwin,	%g6
	addc	%i7,	0x168E,	%i2
loop_729:
	rdhpr	%hsys_tick_cmpr,	%g3
	wrpr	%l6,	%l5,	%pil
	brlz	%o3,	loop_730
	array32	%g1,	%i5,	%l4
	rd	%softint,	%i0
	rd	%y,	%o2
loop_730:
	rdpr	%cleanwin,	%l3
	rd	%tick_cmpr,	%l2
	movneg	%icc,	%g5,	%o6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	rdpr	%cansave,	%i1
	wrpr	%o4,	%g7,	%cwp
	edge32ln	%o5,	%l1,	%o0
	wr	%g0,	0x11,	%asi
	lduwa	[%l7 + 0x14] %asi,	%o7
	xorcc	%g2,	0x1CB5,	%i4
	wr	%g0,	0x11,	%asi
	lduba	[%l7 + 0x72] %asi,	%i6
	rd	%fprs,	%g4
	rdpr	%otherwin,	%i3
	mulx	%g6,	%l0,	%i2
	prefetch	[%l7 + 0x14],	 0x2
	taddcc	%g3,	0x14AA,	%l6
	rd	%asi,	%i7
	rd	%fprs,	%o3
	rdpr	%canrestore,	%g1
	alignaddr	%i5,	%l4,	%l5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%g0,	0x0c,	%asi
	lda	[%l7 + 0x38] %asi,	%f13
	wr	%l3,	%i0,	%sys_tick
	rdpr	%cansave,	%l2
	mova	%icc,	%o6,	%o1
	set	0x40, %o1
	stda	%g4,	[%l7 + %o1] 0xeb
	membar	#Sync
	wrpr	%o4,	%g7,	%tick
	xnor	%o5,	0x186F,	%i1
	ta	%xcc,	0x2
	set	0x20, %o0
	swapa	[%l7 + %o0] 0x80,	%l1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x851, 	%hsys_tick_cmpr
	wrpr	%i4,	%i6,	%cwp
	rdpr	%tl,	%g2
	tsubcctv	%g4,	%i3,	%l0
	wr	%g6,	%i2,	%set_softint
	wrpr	%g3,	0x1033,	%tick
	ldd	[%l7 + 0x40],	%i6
	rdhpr	%hintp,	%l6
	rdpr	%canrestore,	%g1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	smul	%o3,	0x1B43,	%i5
	brlz	%l5,	loop_731
	udiv	%l4,	0x16AA,	%l3
	orn	%o2,	%l2,	%i0
	rdpr	%cwp,	%o6
loop_731:
	rdhpr	%hintp,	%o1
	rd	%sys_tick_cmpr,	%g5
	rd	%softint,	%g7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x5B4, 	%hsys_tick_cmpr
	rdpr	%canrestore,	%i1
	fcmped	%fcc0,	%f26,	%f24
	rdpr	%tba,	%o5
	rdpr	%gl,	%o7
	fmovsa	%xcc,	%f0,	%f6
	fpsub32	%f18,	%f6,	%f0
	rd	%fprs,	%o0
	rdpr	%otherwin,	%l1
	rdhpr	%hsys_tick_cmpr,	%i4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	sdivcc	%i3,	0x1650,	%l0
	rdpr	%gl,	%g6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%l6,	0x1783,	%softint
	wr	%g1,	%o3,	%set_softint

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%i5,	%l5,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%hpstate,	%o2
        wr    %g0,    0xe,    %pcr    ! changed.
	rd	%tick_cmpr,	%o6
	rdpr	%cleanwin,	%o1
	rd	%asi,	%g5
	fpsub32s	%f0,	%f16,	%f7
	tl	%icc,	0x4
	tleu	%icc,	0x6
	wr 	%g0, 	0x7, 	%fprs
	sth	%g7,	[%l7 + 0x6A]
	edge8ln	%i1,	%o5,	%o4
	sub	%o7,	0x043B,	%o0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%softint,	%i6
	array32	%i4,	%i3,	%l0
	set	0x42, %o4
	ldsha	[%l7 + %o4] 0x14,	%g6
	wrpr	%g4,	0x1C2C,	%pil
	rdpr	%cleanwin,	%i2
	rd	%sys_tick_cmpr,	%i7
	movvs	%xcc,	%l6,	%g1
	rdpr	%cwp,	%o3
	rd	%y,	%g2
	rdhpr	%hpstate,	%i5
	ldx	[%l7 + 0x30],	%g3
	fzeros	%f16
	edge8n	%l5,	%l3,	%l4
	rd	%pc,	%l2
	wr	%o6,	%o1,	%set_softint
	wrpr	%o2,	%g5,	%cwp
	wrpr	%g7,	%i0,	%pil
	nop
	setx	loop_732,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	edge32	%o5,	%i1,	%o7
	movrlz	%o4,	0x181,	%l1
	wrpr	%o0,	0x1462,	%tick
loop_732:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xC91, 	%hsys_tick_cmpr
	movcs	%icc,	%i3,	%i6
	flush	%l7 + 0x50

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x21B, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	siam	0x1
	rdpr	%cwp,	%l6
	mulx	%g4,	%g1,	%o3
	for	%f8,	%f24,	%f10
	movrne	%g2,	%i5,	%l5
	tvs	%xcc,	0x0
	tn	%xcc,	0x6
	rd	%ccr,	%l3
	fmovrde	%l4,	%f26,	%f28
	sethi	0x0479,	%l2
	rd	%softint,	%o6
	rd	%fprs,	%o1
	st	%f4,	[%l7 + 0x74]
	set	0x7B, %g1
	ldstuba	[%l7 + %g1] 0x88,	%g3
	fmovrsne	%g5,	%f6,	%f23
	wr	%g7,	0x1A52,	%pic
	wr	%o2,	%i0,	%y
	rdpr	%cansave,	%i1
	addccc	%o5,	0x0CCE,	%o7
	fxor	%f18,	%f24,	%f4
	wrpr	%l1,	0x0FFA,	%cwp
	rdhpr	%hsys_tick_cmpr,	%o4
	udivcc	%i4,	0x13B4,	%o0
	rdhpr	%hintp,	%i3
	rd	%pc,	%i6
	orncc	%l0,	%g6,	%i7
	rd	%softint,	%l6
	edge32ln	%i2,	%g4,	%g1
	rd	%softint,	%o3
	set	0x20, %l0
	stxa	%i5,	[%l7 + %l0] 0x80
	move	%icc,	%g2,	%l3
	bcs,a	%icc,	loop_733
	rdpr	%canrestore,	%l5
	rdhpr	%htba,	%l4
	tcs	%icc,	0x2
loop_733:
        wr    %g0,    0xe,    %pcr    ! changed.
	wrpr	%l2,	%g3,	%pil
	bleu	loop_734
	rdhpr	%htba,	%g7
	edge16n	%o2,	%i0,	%g5
	bneg,a	%icc,	loop_735
loop_734:
	wr	%i1,	%o7,	%pic
	orncc	%o5,	0x1091,	%o4
	sir	0x1991
loop_735:
	rdhpr	%hsys_tick_cmpr,	%l1
	tne	%xcc,	0x0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x8C9, 	%hsys_tick_cmpr
	bcs,a,pt	%xcc,	loop_736
	rdpr	%canrestore,	%o0
	movcs	%icc,	%i3,	%i6
	rd	%sys_tick_cmpr,	%g6
loop_736:
	movvc	%xcc,	%i7,	%l6
	fmul8ulx16	%f24,	%f4,	%f10
	rdpr	%canrestore,	%i2
	sll	%g4,	0x11,	%l0
	rdpr	%cleanwin,	%g1
	wrpr	%i5,	%o3,	%pil
	wrpr	%l3,	0x1405,	%tick
	rdhpr	%hpstate,	%l5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x0A9, 	%hsys_tick_cmpr
	rdpr	%wstate,	%o6
	rdhpr	%hpstate,	%g2
	fcmple16	%f24,	%f4,	%l2
	rd	%softint,	%g3
	wrpr	%g7,	0x052F,	%tick
	rd	%softint,	%o1
	wrpr	%i0,	0x0D92,	%tick
	rdhpr	%htba,	%g5
	rd	%pc,	%i1
	alignaddr	%o2,	%o7,	%o4
	rdpr	%canrestore,	%o5
	rd	%softint,	%l1
	rdpr	%wstate,	%i4
	wr 	%g0, 	0x7, 	%fprs
	rdhpr	%hpstate,	%i3
	edge16n	%i7,	%l6,	%i2
	tgu	%xcc,	0x5
	wrpr	%g6,	%l0,	%pil
	addcc	%g1,	0x0615,	%g4
	wrpr	%i5,	%o3,	%pil
	edge16	%l3,	%l5,	%o6
	sdivx	%g2,	0x07E3,	%l4
	andcc	%g3,	0x13F7,	%g7
	movrgz	%o1,	%i0,	%l2
	wr	%g0,	0x2b,	%asi
	stha	%g5,	[%l7 + 0x16] %asi
	membar	#Sync
	set	0x30, %i1
	ldxa	[%l7 + %i1] 0x89,	%i1
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
	wrpr	%o4,	0x179E,	%tick
	rdpr	%cleanwin,	%o2
	udiv	%o5,	0x1B75,	%l1
	fmovdge	%icc,	%f7,	%f16

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x89F, 	%hsys_tick_cmpr
	rdhpr	%htba,	%i4
	andncc	%i3,	%i7,	%i6
	fmovde	%icc,	%f14,	%f17
	edge32ln	%i2,	%g6,	%l0
	rdpr	%cwp,	%g1
	sll	%g4,	0x0A,	%i5
	wr	%l6,	0x1059,	%clear_softint
	set	0x10, %i3
	stba	%l3,	[%l7 + %i3] 0x04
	subcc	%o3,	0x1F22,	%o6
	fmuld8sux16	%f9,	%f18,	%f2
	wr	%l5,	0x0CCB,	%softint
	fmovrdlez	%g2,	%f28,	%f28
	fnors	%f10,	%f28,	%f4
	bneg,a	%xcc,	loop_737
	rdhpr	%hpstate,	%g3
	wrpr	%l4,	%g7,	%pil
	fmovdge	%xcc,	%f18,	%f5
loop_737:
	wrpr	%i0,	0x1F22,	%tick
	srax	%o1,	0x00,	%l2
	rdhpr	%hsys_tick_cmpr,	%i1
	fcmpgt32	%f24,	%f26,	%o7
	rdpr	%canrestore,	%g5
        wr    %g0,    0xe,    %pcr    ! changed.
	tsubcctv	%o5,	0x028F,	%l1
	edge16l	%o0,	%i4,	%i3
	rdhpr	%hpstate,	%i6
	rdhpr	%htba,	%i2
	wr	%i7,	%g6,	%sys_tick
	stx	%l0,	[%l7 + 0x40]
	wrpr	%g4,	%g1,	%cwp
	swap	[%l7 + 0x70],	%i5
	wrpr	%l3,	%l6,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x3D9, 	%hsys_tick_cmpr
	rd	%sys_tick_cmpr,	%l5
	wrpr	%o6,	%g3,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x317, 	%sys_tick_cmpr
	wr	%g0,	0x18,	%asi
	lda	[%l7 + 0x34] %asi,	%f5
	wr	%g0,	0x18,	%asi
	ldxa	[%l7 + 0x20] %asi,	%i0
	fmovdne	%icc,	%f30,	%f7
	tcs	%icc,	0x2
	rdhpr	%htba,	%g2
	array32	%o1,	%l2,	%o7
	wr	%i1,	0x0198,	%set_softint
	add	%l7,	0x68,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%g5
	casa	[%l6] %asi,	%g5,	%o2
	rdpr	%tba,	%o5
	bge,pt	%xcc,	loop_738
	tl	%icc,	0x7
	set	0x08, %i6
	sta	%f1,	[%l7 + %i6] 0x10
loop_738:
	rdhpr	%hsys_tick_cmpr,	%l1
	orcc	%o0,	0x1E5F,	%o4
	fbu	%fcc2,	loop_739
	rd	%y,	%i4
	udivcc	%i6,	0x041D,	%i3
	fsrc1	%f2,	%f24
loop_739:
	fmovsgu	%icc,	%f15,	%f9
	wrpr	%i2,	0x11B2,	%pil
	rdhpr	%hintp,	%i7
	call	loop_740
	ldx	[%l7 + 0x30],	%l0
	movrgz	%g6,	0x227,	%g1
	wr	%i5,	0x0942,	%y
loop_740:
	rdpr	%tl,	%g4
	subcc	%l3,	0x082C,	%l6
	brnz,a	%l5,	loop_741
	fxors	%f17,	%f25,	%f31

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	brz,a	%l4,	loop_742
loop_741:
	fbne,a	%fcc0,	loop_743
	tle	%icc,	0x6
	array8	%g3,	%g7,	%i0
loop_742:
	call	loop_744
loop_743:
	rd	%softint,	%o1
	movvc	%icc,	%l2,	%g2
	rd	%pc,	%o7
loop_744:
	umul	%g5,	0x0CFE,	%o2
	rd	%fprs,	%i1
	movrgz	%l1,	0x2E1,	%o5
	movneg	%xcc,	%o0,	%o4
	rd	%ccr,	%i6
	wrpr	%i3,	0x1779,	%pil
	rdhpr	%hpstate,	%i4
	mulx	%i7,	%l0,	%g6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x0E9, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	subccc	%g4,	0x138E,	%l3
	tgu	%xcc,	0x2
	tsubcctv	%i5,	%l5,	%l6
	rdpr	%cleanwin,	%o3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	rdpr	%wstate,	%g7
	udiv	%g3,	0x188F,	%o1
	xorcc	%l2,	%i0,	%g2
	rdpr	%otherwin,	%o7
	tn	%xcc,	0x0
	st	%f14,	[%l7 + 0x40]
	wrpr	%o2,	%i1,	%cwp
	rdpr	%cansave,	%l1
	fblg	%fcc3,	loop_745
	tn	%xcc,	0x5
	fmovdleu	%xcc,	%f18,	%f6
	or	%o5,	0x1245,	%o0
loop_745:
	tneg	%icc,	0x4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x16F, 	%hsys_tick_cmpr
	rd	%asi,	%o4
	add	%l7,	0x70,	%l6
	wr	%g0,	0x11,	%asi
	casa	[%l6] %asi,	%i3,	%i4
	wrpr	%i6,	0x1C93,	%tick
	for	%f30,	%f20,	%f8
	xor	%l0,	0x00CA,	%i7
	rd	%sys_tick_cmpr,	%g6
	add	%i2,	0x0D5E,	%g1
	rdhpr	%hintp,	%l3
	rdpr	%tl,	%g4
	wrpr	%i5,	%l5,	%tick
	smulcc	%o3,	%l6,	%o6
	movrlez	%g7,	0x0ED,	%l4
	wrpr	%g3,	%l2,	%tick
	rd	%tick_cmpr,	%o1
	tg	%icc,	0x1
	rdhpr	%hpstate,	%i0
	tvs	%icc,	0x0
	rdhpr	%hintp,	%g2
	umulcc	%o2,	0x050F,	%i1
	rdpr	%gl,	%o7
	edge16	%l1,	%o0,	%o5
	wr	%g0,	0x89,	%asi
	lda	[%l7 + 0x4C] %asi,	%f24
	wr	%o4,	%i3,	%ccr
	movvs	%xcc,	%g5,	%i4
	fmovdge	%xcc,	%f12,	%f13

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	udivx	%i6,	0x192B,	%g6
	tvc	%icc,	0x2
	rdpr	%gl,	%i2
	fnor	%f22,	%f24,	%f0
	tl	%xcc,	0x4
	rdhpr	%hpstate,	%i7
	rd	%fprs,	%l3
	wrpr	%g4,	%g1,	%tick
	popc	0x06B1,	%l5
	wr	%o3,	%i5,	%set_softint
	addc	%o6,	0x062A,	%g7
	set	0x4C, %g6
	lda	[%l7 + %g6] 0x04,	%f24
	tcc	%icc,	0x6
	rdhpr	%htba,	%l6
	wr 	%g0, 	0x6, 	%fprs
	wr	%g3,	%i0,	%sys_tick
	wrpr	%o1,	%g2,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x6E1, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x050, 	%hsys_tick_cmpr
	rdhpr	%htba,	%o7
	rdhpr	%htba,	%o5
	move	%icc,	%o4,	%i3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xC4E, 	%hsys_tick_cmpr
	wrpr	%o0,	%i6,	%pil
	orn	%l0,	0x1D5E,	%i2
	rdhpr	%hintp,	%g6
	rd	%softint,	%i7
	tneg	%xcc,	0x1
	srlx	%l3,	0x13,	%g4
	wrpr	%l5,	0x053F,	%tick
	taddcc	%g1,	%i5,	%o3
	orn	%g7,	%o6,	%l6
	edge8l	%l4,	%g3,	%l2
	wrpr	%i0,	%o1,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fmul8x16	%f3,	%f2,	%f12
	ba	loop_746
	wr	%i1,	%o2,	%set_softint
	tvs	%xcc,	0x0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x9E6, 	%hsys_tick_cmpr
loop_746:
	fbne,a	%fcc0,	loop_747
	rd	%pc,	%o5
	rd	%y,	%o4
	and	%l1,	0x1E33,	%g5
loop_747:
	rd	%pc,	%i3
	wrpr	%o0,	%i6,	%cwp
	fbule	%fcc3,	loop_748
	rdpr	%otherwin,	%i4
	movcc	%xcc,	%l0,	%g6
	wr	%i7,	%l3,	%pic
loop_748:
	rdpr	%otherwin,	%g4
	movvc	%icc,	%l5,	%g1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fcmpne16	%f30,	%f30,	%g7
	subc	%o6,	0x0F75,	%l6
	rdpr	%canrestore,	%o3
	movvs	%xcc,	%g3,	%l4
	rdhpr	%hsys_tick_cmpr,	%l2
	rdhpr	%htba,	%i0
	wrpr	%g2,	0x088C,	%tick
	rdhpr	%hpstate,	%o1
	fmovsvc	%icc,	%f2,	%f18

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	rdpr	%tba,	%o2
	tn	%xcc,	0x4
	udivx	%o5,	0x12DF,	%o4
	rd	%y,	%l1
	fcmple32	%f28,	%f0,	%o7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x00B, 	%tick_cmpr
	ba,a,pt	%xcc,	loop_749
	bvs,a	loop_750
	tvs	%xcc,	0x2
	wrpr	%i3,	0x11A0,	%cwp
loop_749:
	rd	%sys_tick_cmpr,	%o0
loop_750:
	wrpr	%i6,	%l0,	%pil
	smul	%g6,	0x1175,	%i7
	fpackfix	%f8,	%f5
	siam	0x5
	wr	%g0,	0x26,	%asi
	ldda	[%l7 + 0x70] %asi,	%l2
	wrpr	%i4,	%l5,	%cwp
	rdhpr	%htba,	%g4
	rd	%fprs,	%i2
	edge16n	%g1,	%g7,	%o6
	set	0x08, %i2
	swapa	[%l7 + %i2] 0x81,	%l6
	wrpr	%o3,	0x04B6,	%pil
	rdpr	%tl,	%i5
	stx	%l4,	[%l7 + 0x50]
	fpadd16s	%f10,	%f24,	%f18
	rdpr	%cansave,	%g3
	rd	%tick_cmpr,	%i0
	wrpr	%g2,	0x00F5,	%pil
	fmovdcc	%icc,	%f8,	%f20
	add	%o1,	0x19FB,	%i1
	rdpr	%tba,	%o2
	wrpr	%l2,	%o5,	%cwp
	wr	%o4,	0x172D,	%ccr
	set	0x30, %i4
	stda	%l0,	[%l7 + %i4] 0x88
	rdpr	%cansave,	%o7
	rdhpr	%hpstate,	%i3
	fcmpne16	%f18,	%f20,	%g5
	wr	%i6,	%o0,	%softint
	wrpr	%l0,	0x1BFA,	%pil
	rd	%tick_cmpr,	%g6
	stx	%i7,	[%l7 + 0x10]
	rdpr	%cansave,	%l3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xFC2, 	%sys_tick_cmpr
	rd	%sys_tick_cmpr,	%i4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	pdist	%f22,	%f24,	%f16
	xor	%o6,	%l6,	%g7
	rd	%asi,	%o3
	wr	%l4,	%g3,	%set_softint
	ldsw	[%l7 + 0x40],	%i5
	wr	%g0,	0x89,	%asi
	ldda	[%l7 + 0x30] %asi,	%i0
	rdhpr	%hintp,	%o1
	rd	%fprs,	%i1
	rd	%ccr,	%o2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%cansave,	%o5
	rdpr	%wstate,	%o4
	wr	%g0,	0x0c,	%asi
	sta	%f16,	[%l7 + 0x64] %asi

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	udivcc	%l1,	0x0D58,	%i3
	fpsub16s	%f17,	%f12,	%f14
	st	%f18,	[%l7 + 0x10]
	fmuld8sux16	%f25,	%f26,	%f24
	orcc	%g5,	0x11CF,	%i6
	fabsd	%f26,	%f8
	tge	%icc,	0x5
	wr 	%g0, 	0x5, 	%fprs
	rdpr	%gl,	%i7
	wrpr	%l3,	0x0330,	%tick
	siam	0x3
	and	%o0,	%l5,	%i4
	tsubcc	%g4,	%i2,	%g1
	wr	%o6,	%g7,	%ccr
	wrpr	%l6,	0x1CDE,	%pil
	rdhpr	%hpstate,	%l4
	fmovdgu	%icc,	%f17,	%f29

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	for	%f28,	%f8,	%f2
	rdhpr	%hpstate,	%i5
	sra	%i0,	0x17,	%o1
	wr	%i1,	%o2,	%sys_tick
	edge32l	%o3,	%l2,	%o4
	bshuffle	%f20,	%f16,	%f18
	fpsub16	%f8,	%f2,	%f4
	rd	%asi,	%o5
	rd	%pc,	%g2
	rdpr	%cwp,	%o7
	fmovrsne	%l1,	%f4,	%f3
	wrpr	%g5,	0x1495,	%cwp
	rdhpr	%htba,	%i3
	prefetch	[%l7 + 0x64],	 0x2
	andncc	%l0,	%g6,	%i7
	rd	%fprs,	%i6
	call	loop_751
	array32	%o0,	%l5,	%i4
	mova	%icc,	%g4,	%l3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xD03, 	%hsys_tick_cmpr
loop_751:
	wrpr	%o6,	%l6,	%cwp
	rd	%ccr,	%l4
	rdhpr	%hintp,	%g7
	std	%f8,	[%l7 + 0x40]
	fand	%f30,	%f6,	%f18
	movre	%g3,	0x06D,	%i0
	fcmped	%fcc0,	%f14,	%f16
	rd	%tick_cmpr,	%i5
	rd	%asi,	%i1
	edge32l	%o1,	%o3,	%l2
	set	0x38, %l5
	stha	%o4,	[%l7 + %l5] 0x15
	wrpr	%o5,	%g2,	%cwp
	wrpr	%o7,	0x1AE8,	%cwp
	ldsw	[%l7 + 0x48],	%l1
	movcc	%xcc,	%o2,	%g5
	ldsh	[%l7 + 0x42],	%l0
	rdpr	%cansave,	%i3
	srlx	%i7,	0x1E,	%i6
	stx	%o0,	[%l7 + 0x18]
	andncc	%g6,	%l5,	%i4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xCB2, 	%sys_tick_cmpr
	rd	%y,	%g1
	fpadd32	%f14,	%f16,	%f26

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x42E, 	%hsys_tick_cmpr
	wrpr	%l4,	0x1604,	%cwp
	bpos	%xcc,	loop_752
	fornot1s	%f0,	%f12,	%f24

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_752:
	ldx	[%l7 + 0x40],	%l6
	movg	%xcc,	%i0,	%i1
	rdpr	%canrestore,	%i5
	wr	%o1,	%l2,	%sys_tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xF1A, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	fabss	%f13,	%f10
	wrpr	%o7,	%o4,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	tgu	%xcc,	0x2
	rdpr	%pil,	%l0
	rd	%ccr,	%i3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%asi,	%g5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	smulcc	%l5,	%l3,	%g4
	rdpr	%gl,	%g1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x757, 	%hsys_tick_cmpr
	fmul8x16	%f8,	%f22,	%f6
	rdpr	%wstate,	%o6
	rd	%sys_tick_cmpr,	%i4
	wrpr	%g7,	%l4,	%tick
	fones	%f17
	fnot2s	%f7,	%f4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%pc,	%g3
	rd	%ccr,	%i1
	fbule	%fcc0,	loop_753
	wr	%i0,	%o1,	%ccr
	sllx	%i5,	%o3,	%l2
	wrpr	%g2,	0x1E21,	%tick
loop_753:
	subccc	%o5,	%o7,	%o4
	fpack16	%f28,	%f11
	rdhpr	%hintp,	%l1
	rdpr	%cleanwin,	%o2
	wr	%l0,	0x0BA4,	%clear_softint
	movrlz	%i3,	0x3C6,	%i7
	wr	%g5,	%o0,	%softint
	rd	%softint,	%i6
	orn	%l5,	0x1E49,	%l3
	movrgez	%g6,	0x382,	%g1
	wr	%g4,	%i2,	%y
	membar	0x53
	sub	%o6,	%i4,	%g7
	wr	%l4,	0x1FFA,	%softint
	fba,a	%fcc0,	loop_754
	wr	%l6,	%g3,	%softint
	wr	%g0,	0x80,	%asi
	ldswa	[%l7 + 0x10] %asi,	%i1
loop_754:
	edge8	%i0,	%i5,	%o1
	rdpr	%cwp,	%l2
	fmovrde	%o3,	%f22,	%f22
	movgu	%xcc,	%o5,	%o7
	fmul8x16au	%f19,	%f11,	%f18
	wrpr	%o4,	%l1,	%tick
	rdpr	%tba,	%o2
	wr	%g2,	0x001D,	%sys_tick
	wrpr	%i3,	%l0,	%cwp
	rd	%sys_tick_cmpr,	%i7
	wr	%g5,	%i6,	%ccr
	wr	%o0,	%l5,	%sys_tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x209, 	%hsys_tick_cmpr
	rdhpr	%htba,	%l3
	rdpr	%canrestore,	%g1
	addcc	%i2,	0x19F4,	%o6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x17B, 	%hsys_tick_cmpr
	te	%xcc,	0x2
	rd	%tick_cmpr,	%g7
	wrpr	%l4,	0x1367,	%pil
	mova	%xcc,	%i4,	%g3
	fmovdneg	%icc,	%f29,	%f18
	rdpr	%pil,	%i1
	umul	%i0,	0x028B,	%l6
	movrlez	%i5,	%l2,	%o3
	movcc	%icc,	%o1,	%o5
	wr	%o7,	0x0875,	%set_softint
	wrpr	%l1,	%o2,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	rdpr	%tba,	%l0
	wrpr	%g2,	0x0B78,	%pil
	tsubcc	%g5,	%i7,	%i6
	rdhpr	%hintp,	%o0
	brnz,a	%g6,	loop_755
	fba,a	%fcc2,	loop_756
	fmovrsgz	%l5,	%f19,	%f26

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_755:
	rdpr	%pil,	%l3
loop_756:
	rd	%pc,	%g4
	wrpr	%g7,	0x18C6,	%cwp
	rd	%asi,	%l4
	rd	%asi,	%i4
	movge	%icc,	%o6,	%i1
	wr	%g3,	0x19CF,	%pic

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x940, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	bleu	loop_757
	rd	%ccr,	%o1
	mova	%xcc,	%o5,	%o3
	rdhpr	%hintp,	%o7
loop_757:
	edge32n	%o2,	%l1,	%i3
	wr	%l0,	%g2,	%clear_softint

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x368, 	%sys_tick_cmpr
	rd	%ccr,	%o4
	rdhpr	%hsys_tick_cmpr,	%o0
	rdhpr	%hpstate,	%g6
	umul	%l5,	0x01B1,	%i6
	tleu	%icc,	0x6
	wrpr	%i2,	%g1,	%tick
	ldsb	[%l7 + 0x64],	%l3
	rdpr	%cansave,	%g7
	bn,pn	%xcc,	loop_758
	fnot2	%f30,	%f8
	wr	%g4,	%i4,	%ccr
	rdhpr	%hsys_tick_cmpr,	%l4
loop_758:
	rdhpr	%htba,	%i1
	rdpr	%otherwin,	%o6
	xorcc	%l6,	0x0A68,	%g3
	edge16ln	%i5,	%l2,	%o1
	rd	%ccr,	%o5
	rdhpr	%hpstate,	%i0
	srlx	%o7,	0x0F,	%o3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%ccr,	%l1
	sllx	%l0,	%i3,	%g5
	fmovrdgz	%g2,	%f4,	%f10
	xnorcc	%i7,	%o0,	%g6
	tg	%xcc,	0x7
	rdhpr	%htba,	%l5
	brgz,a	%o4,	loop_759
	tle	%xcc,	0x2
	popc	0x0170,	%i2
	rdpr	%otherwin,	%i6
loop_759:
	fmovsl	%icc,	%f25,	%f19
	rdpr	%cansave,	%g1
	brlez,a	%l3,	loop_760
	movl	%icc,	%g4,	%i4
	rdpr	%tl,	%l4
	brnz,a	%i1,	loop_761
loop_760:
	wrpr	%g7,	0x12D7,	%pil
	rd	%asi,	%o6
	movg	%icc,	%l6,	%i5
loop_761:
	wrpr	%g3,	0x167F,	%tick
	rd	%y,	%o1
	fnegs	%f14,	%f12
	rdhpr	%hpstate,	%l2
	rdpr	%tba,	%i0
	rdpr	%tba,	%o7
	rdhpr	%hsys_tick_cmpr,	%o3
	orcc	%o5,	0x0B70,	%l1
	rdpr	%tba,	%l0
	movrlez	%i3,	%g5,	%o2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fmovrde	%o0,	%f22,	%f14
	fpsub16	%f22,	%f12,	%f16
	edge32	%l5,	%o4,	%g6
	rd	%asi,	%i6
	rd	%asi,	%g1
	rdpr	%cwp,	%i2
	movleu	%xcc,	%l3,	%g4
	array8	%l4,	%i1,	%i4
	rdpr	%wstate,	%g7
	rdpr	%tba,	%l6
	array32	%o6,	%g3,	%i5
	array8	%l2,	%i0,	%o7
	rdhpr	%hsys_tick_cmpr,	%o1
	smulcc	%o3,	0x0C02,	%l1
	rdhpr	%hintp,	%l0
	mulx	%o5,	%i3,	%o2
	fbuge	%fcc0,	loop_762
	array16	%i7,	%g2,	%g5
	rdpr	%otherwin,	%o0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xDF0, 	%hsys_tick_cmpr
loop_762:
	smul	%l5,	0x0171,	%i6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%tba,	%g6
	rdpr	%cwp,	%l3
	rdpr	%cansave,	%g4
	orncc	%i2,	%i1,	%i4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	set	0x70, %l4
	ldxa	[%l7 + %l4] 0x04,	%l6
	wrpr	%o6,	0x075D,	%pil
	wrpr	%l4,	0x1DDA,	%pil
	rd	%fprs,	%i5
	wrpr	%g3,	0x1925,	%tick
	rdpr	%wstate,	%i0
	array16	%l2,	%o7,	%o1
	wrpr	%l1,	0x11D0,	%cwp
        wr    %g0,    0xe,    %pcr    ! changed.
	wr	%o5,	0x0CB7,	%set_softint
	movre	%i3,	%o2,	%o3
	wr	%g2,	%i7,	%y
	rdhpr	%hpstate,	%o0
	subcc	%o4,	%l5,	%g5
	rd	%pc,	%i6
	rdpr	%wstate,	%g1
	rdpr	%canrestore,	%l3
	wr	%g6,	0x0EB3,	%softint
	wrpr	%g4,	0x1540,	%cwp
	rdhpr	%hpstate,	%i1
	rdhpr	%hpstate,	%i4
	edge32ln	%i2,	%l6,	%g7
	edge16	%o6,	%i5,	%g3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fornot1s	%f15,	%f27,	%f0
	set	0x63, %l3
	lduba	[%l7 + %l3] 0x81,	%l2
	fexpand	%f23,	%f24
	rdpr	%tba,	%o7
	wr	%l1,	%l0,	%set_softint
	prefetch	[%l7 + 0x40],	 0x3
	fsrc1s	%f0,	%f8
	fbne	%fcc1,	loop_763
	rdpr	%wstate,	%o1
	rd	%softint,	%i3
	rdhpr	%hintp,	%o2
loop_763:
	wr	%o3,	0x13B8,	%set_softint
	rdhpr	%hpstate,	%o5
	wr	%i7,	0x1AA3,	%set_softint
	andn	%g2,	%o0,	%o4
	rdpr	%cwp,	%l5
	rd	%softint,	%g5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%ccr,	%i6
	rdpr	%cwp,	%l3
	rdhpr	%hintp,	%g6
	rdpr	%pil,	%i1
	wr	%g4,	0x003C,	%clear_softint
	wr	%i4,	%i2,	%ccr
	wr	%g0,	0x10,	%asi
	swapa	[%l7 + 0x70] %asi,	%l6
	rdhpr	%htba,	%o6
	fornot2s	%f28,	%f25,	%f19
	wr	%i5,	%g3,	%pic

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xAB6, 	%sys_tick_cmpr
	rdhpr	%htba,	%l4
	smul	%l2,	%o7,	%l1
	rdpr	%gl,	%i0
	rdhpr	%hintp,	%l0
	fbn	%fcc3,	loop_764
	edge16	%i3,	%o1,	%o2
	orncc	%o3,	%o5,	%i7
	rd	%sys_tick_cmpr,	%o0
loop_764:
	and	%g2,	0x186C,	%l5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%i6,	0x1500,	%tick
	rd	%sys_tick_cmpr,	%g1
	rdpr	%cansave,	%l3
	wrpr	%i1,	0x03AC,	%pil
	rdpr	%cwp,	%g6
	rdpr	%cwp,	%g4
	sth	%i4,	[%l7 + 0x78]
	srlx	%l6,	%o6,	%i5
	orn	%g3,	0x0AB1,	%i2
	fornot2	%f28,	%f4,	%f6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x3E5, 	%sys_tick_cmpr
	tl	%xcc,	0x2
	edge8n	%g7,	%o7,	%l1
	movcc	%xcc,	%i0,	%l0
	wrpr	%i3,	%o2,	%pil
	fmovdneg	%xcc,	%f5,	%f19
	rdhpr	%hintp,	%o1
	fcmple16	%f14,	%f6,	%o5
	rdpr	%cwp,	%i7
	ldd	[%l7 + 0x78],	%o0
	membar	0x5F
	tl	%xcc,	0x4
	wrpr	%o3,	%g2,	%pil
	edge8l	%g5,	%o4,	%l5
	rdhpr	%hintp,	%i6
	rd	%sys_tick_cmpr,	%l3
	orcc	%i1,	0x16CA,	%g1
	movne	%icc,	%g4,	%i4
	or	%l6,	%o6,	%g6
	wr 	%g0, 	0x5, 	%fprs
	edge8	%i2,	%l4,	%g7
	rd	%tick_cmpr,	%o7
	wrpr	%l1,	%i0,	%pil
	rdpr	%otherwin,	%l2
	movg	%icc,	%i3,	%o2
	wrpr	%o1,	%o5,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fnors	%f18,	%f28,	%f20
	ta	%xcc,	0x0
	rdhpr	%htba,	%l0
	edge8l	%o3,	%g2,	%o4
	fpsub16s	%f12,	%f3,	%f2
	movcc	%icc,	%l5,	%i6
	fnegd	%f10,	%f0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x5DB, 	%hsys_tick_cmpr
	rd	%softint,	%i1
	rdpr	%pil,	%g4
	tl	%icc,	0x1
	wr	%g0,	0x89,	%asi
	ldsha	[%l7 + 0x76] %asi,	%g1
	wr	%l6,	0x19E6,	%softint
	xorcc	%i4,	%g6,	%i5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	edge16n	%g3,	%g7,	%l4
	rdpr	%pil,	%o7
	fmovsa	%icc,	%f29,	%f15
	tge	%xcc,	0x1
	movle	%icc,	%l1,	%i0
	tcs	%icc,	0x5
	wrpr	%l2,	%o2,	%cwp
	edge8l	%i3,	%o5,	%o1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x63C, 	%hsys_tick_cmpr
	wrpr	%o4,	%l5,	%pil
	rd	%y,	%g2
	orncc	%g5,	0x1D7D,	%i6
	wr	%i1,	%l3,	%y

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	umul	%i4,	0x15D3,	%l6
	rdhpr	%hpstate,	%i5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x65E, 	%hsys_tick_cmpr
	stb	%i2,	[%l7 + 0x15]
	udivx	%g3,	0x156E,	%l4
	sll	%g7,	0x17,	%l1
	fcmpeq16	%f26,	%f14,	%i0
	movcc	%icc,	%l2,	%o7
	edge8	%o2,	%i3,	%o1
	srax	%o5,	%o0,	%i7
	rd	%softint,	%l0
	movn	%icc,	%o4,	%o3
	udivx	%g2,	0x0824,	%g5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fmovrdgz	%l3,	%f4,	%f20
	movcs	%xcc,	%l5,	%g4
	udivcc	%g1,	0x1FA7,	%i4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x724, 	%hsys_tick_cmpr
	nop
	setx	loop_765,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	tle	%icc,	0x4
	tcs	%icc,	0x5
	fcmpes	%fcc1,	%f27,	%f30
loop_765:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%canrestore,	%g6
        wr    %g0,    0xe,    %pcr    ! changed.
	rdpr	%cansave,	%l1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xC18, 	%hsys_tick_cmpr
	wrpr	%o7,	%o2,	%pil
	movne	%xcc,	%g7,	%o1
	bneg,a,pn	%icc,	loop_766
	tg	%xcc,	0x3
	srlx	%i3,	%o0,	%o5
	set	0x58, %l2
	prefetcha	[%l7 + %l2] 0x10,	 0x0
loop_766:
	brnz	%i7,	loop_767
	rdhpr	%hpstate,	%o3
	rdpr	%cansave,	%o4
	umul	%g5,	%g2,	%i6
loop_767:
	rdhpr	%hsys_tick_cmpr,	%i1
	tg	%xcc,	0x6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xC30, 	%tick_cmpr
	rdpr	%otherwin,	%l3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x04C, 	%sys_tick_cmpr
	tgu	%icc,	0x3
	rdpr	%wstate,	%i5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x0F3, 	%sys_tick_cmpr
	wrpr	%o6,	%i2,	%cwp
	rdhpr	%hintp,	%g6
	wrpr	%l4,	%l1,	%pil
	edge16l	%g3,	%l2,	%i0
	rd	%fprs,	%o2
	wrpr	%o7,	0x12CE,	%cwp
	rd	%tick_cmpr,	%g7
	movrne	%i3,	%o1,	%o5
	wr 	%g0, 	0x4, 	%fprs
	nop
	set	0x47, %g4
	ldub	[%l7 + %g4],	%l0
	set	0x44, %o3
	lda	[%l7 + %o3] 0x88,	%f8
	fmovspos	%xcc,	%f3,	%f18

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%cwp,	%g5
	rdpr	%tba,	%g2
	rd	%y,	%i6
	bge,pt	%icc,	loop_768
	rdpr	%wstate,	%o4
	edge8n	%i1,	%l5,	%g4
	rdpr	%cleanwin,	%l3
loop_768:
	wrpr	%i4,	%g1,	%pil
	rdpr	%tl,	%i5
	wr 	%g0, 	0x4, 	%fprs

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	rdpr	%wstate,	%l1
	rdhpr	%hpstate,	%i2
	fnegs	%f11,	%f2
	tcc	%xcc,	0x5
	movpos	%xcc,	%g3,	%l2
	fmovsge	%icc,	%f29,	%f31
	srl	%i0,	%o7,	%g7
	rdpr	%pil,	%i3
	rdpr	%canrestore,	%o2
	tneg	%icc,	0x2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fzero	%f28
	wr	%i7,	0x0B0A,	%sys_tick
	wr	%g0,	0x23,	%asi
	stda	%l0,	[%l7 + 0x60] %asi
	membar	#Sync
	wrpr	%o3,	0x0BA1,	%cwp
	fba	%fcc3,	loop_769
	rdhpr	%hpstate,	%o0
	wr	%g5,	%g2,	%sys_tick
	rdpr	%gl,	%o4
loop_769:
	rd	%fprs,	%i6
	wr	%g0,	0x04,	%asi
	prefetcha	[%l7 + 0x18] %asi,	 0x2
	set	0x6C, %o5
	lduwa	[%l7 + %o5] 0x19,	%i1
	rd	%y,	%l3
	tl	%icc,	0x3
	rd	%pc,	%i4
	edge32	%g4,	%i5,	%o6
	movrgz	%g1,	0x1C4,	%l6
	rdhpr	%hpstate,	%l4
	mova	%xcc,	%g6,	%i2
	fmovdleu	%icc,	%f11,	%f7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%pc,	%i0
	wrpr	%o7,	0x0AF2,	%pil
	rd	%pc,	%g7
	bleu,a	%icc,	loop_770
	movle	%xcc,	%i3,	%o2
	rdhpr	%hsys_tick_cmpr,	%o1
	wrpr	%l1,	0x1590,	%cwp
loop_770:
	rdhpr	%htba,	%o5
	rdpr	%otherwin,	%l0
	rdhpr	%hpstate,	%o3
        wr    %g0,    0xe,    %pcr    ! changed.
	stx	%i7,	[%l7 + 0x28]
	rd	%pc,	%g5
	rdpr	%tba,	%g2
	tgu	%icc,	0x6
	srlx	%o4,	0x09,	%l5
	wrpr	%i6,	%l3,	%pil
	andn	%i1,	0x131D,	%i4
	fblg	%fcc3,	loop_771
	rdpr	%tl,	%g4
	wr	%o6,	0x1A59,	%clear_softint
	wrpr	%i5,	%l6,	%cwp
loop_771:
	andcc	%l4,	0x0388,	%g6
	rd	%softint,	%i2
	wrpr	%g1,	0x05F3,	%tick
	fabss	%f17,	%f27
	alignaddr	%l2,	%i0,	%o7
	fcmped	%fcc1,	%f14,	%f10
	fnors	%f7,	%f6,	%f0
	rdhpr	%hintp,	%g3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%asi,	%o1
	subccc	%o2,	0x1004,	%l1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	and	%o5,	%o3,	%o0
	tneg	%icc,	0x5
	wrpr	%g5,	%g2,	%pil
	wr 	%g0, 	0x6, 	%fprs
	rdpr	%gl,	%i7
	taddcctv	%i6,	%l3,	%l5
	fmovsg	%xcc,	%f23,	%f31
	andn	%i1,	%i4,	%o6
	rd	%ccr,	%i5
	wr	%l6,	%g4,	%ccr
	wr	%l4,	0x16FD,	%softint
	rdhpr	%hsys_tick_cmpr,	%i2
	rdpr	%cansave,	%g1
	rd	%asi,	%g6
	taddcctv	%l2,	%i0,	%o7
	rdpr	%cansave,	%g7
	fmovdcs	%icc,	%f25,	%f8
	xnor	%g3,	%i3,	%o1
	subccc	%l1,	0x0DD9,	%o2
	rdhpr	%hintp,	%o5
	orn	%o3,	%l0,	%g5
	bvs,a,pn	%xcc,	loop_772
	tne	%icc,	0x6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x09B, 	%hsys_tick_cmpr
	wrpr	%o4,	0x1BE0,	%cwp
loop_772:
	fcmpne16	%f8,	%f2,	%i7
	wr	%i6,	%l3,	%y
	rdhpr	%hintp,	%i1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x4B4, 	%hsys_tick_cmpr
	rdhpr	%hintp,	%i5
	edge32n	%l6,	%l4,	%i2
	rdpr	%cleanwin,	%g1
	wrpr	%g4,	0x0D63,	%pil
	st	%f6,	[%l7 + 0x1C]
	wrpr	%g6,	0x1557,	%tick
	rdhpr	%htba,	%l2
	wr	%o7,	0x0236,	%clear_softint
	fmovdge	%xcc,	%f9,	%f4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xD0E, 	%hsys_tick_cmpr
	rd	%fprs,	%i3
	or	%o1,	0x19B6,	%g3
	rdpr	%cansave,	%l1
	wr	%o5,	%o3,	%sys_tick
	fmovscc	%xcc,	%f27,	%f11
	rd	%softint,	%o2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x765, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x71E, 	%tick_cmpr
	wr 	%g0, 	0x5, 	%fprs
	xnorcc	%o4,	%i7,	%l3
	movrlez	%i1,	%i4,	%l5
	rdpr	%wstate,	%i6
	stw	%i5,	[%l7 + 0x0C]
	ble,a	%icc,	loop_773
	rdhpr	%htba,	%l6
	edge16	%l4,	%o6,	%g1
	rd	%asi,	%i2
loop_773:
	movvs	%icc,	%g6,	%l2
	rdhpr	%hintp,	%o7
	rdhpr	%htba,	%g4
	movneg	%xcc,	%g7,	%i0
	set	0x38, %o6
	sta	%f21,	[%l7 + %o6] 0x0c
	rdpr	%cleanwin,	%o1
	taddcctv	%i3,	%g3,	%o5
	wrpr	%l1,	0x0054,	%tick
	rdpr	%pil,	%o3
	wr	%o2,	0x0964,	%softint
	wrpr	%l0,	0x005E,	%cwp
        wr    %g0,    0xe,    %pcr    ! changed.
	orcc	%g5,	0x175C,	%g2
	edge32ln	%i7,	%o4,	%l3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x7CE, 	%hsys_tick_cmpr
	wr	%i1,	%l5,	%set_softint
	sdivx	%i5,	0x12A9,	%l6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	bn,a,pt	%icc,	loop_774
	rd	%softint,	%l4
	rdhpr	%hintp,	%o6
	fornot2	%f24,	%f30,	%f14
loop_774:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x9E7, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xA04, 	%sys_tick_cmpr
	umulcc	%g1,	%o7,	%g4
	wr	%i0,	%o1,	%softint
	wrpr	%g7,	0x0423,	%cwp
	wrpr	%i3,	%g3,	%tick
	edge16n	%l1,	%o5,	%o2
	tvs	%icc,	0x5
	fmovsl	%icc,	%f0,	%f24
	rdpr	%wstate,	%o3
	st	%f5,	[%l7 + 0x54]
	wrpr	%o0,	%l0,	%pil
	rdhpr	%hsys_tick_cmpr,	%g5
	edge32	%i7,	%o4,	%l3
	bvs	%xcc,	loop_775
	rdpr	%cleanwin,	%i4
	fbne,a	%fcc2,	loop_776
	wr 	%g0, 	0x4, 	%fprs
loop_775:
	wr 	%g0, 	0x6, 	%fprs
	fnor	%f14,	%f30,	%f2
loop_776:
	edge16l	%i5,	%i6,	%l4
	rdhpr	%hintp,	%o6
	edge8ln	%i2,	%l6,	%l2
	membar	#Sync
	set	0x40, %l1
	ldda	[%l7 + %l1] 0xf8,	%f16
	movrne	%g6,	0x34B,	%g1
	tneg	%xcc,	0x2
	wrpr	%o7,	0x0878,	%cwp
	wrpr	%g4,	%o1,	%cwp
	rd	%sys_tick_cmpr,	%g7
	brz,a	%i3,	loop_777
	fnot2s	%f0,	%f17
	edge32	%i0,	%g3,	%o5
	rdpr	%cwp,	%o2
loop_777:
	umul	%l1,	0x1FA7,	%o3
	rdpr	%cleanwin,	%l0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fmuld8ulx16	%f30,	%f28,	%f20

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x086, 	%hsys_tick_cmpr
	wr	%g5,	0x0D81,	%sys_tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%gl,	%g2
	rd	%sys_tick_cmpr,	%l5
	edge8l	%i1,	%i4,	%i6
	wr	%i5,	%o6,	%softint
	rd	%ccr,	%i2
	tsubcctv	%l6,	%l4,	%l2
	rdpr	%gl,	%g1
	fbo	%fcc0,	loop_778
	wr 	%g0, 	0x7, 	%fprs
	popc	%g4,	%g6
	wr	%o1,	%g7,	%softint
loop_778:
	wr	%i3,	0x018D,	%softint
	tpos	%xcc,	0x2
	rd	%ccr,	%g3
	tcc	%icc,	0x5
	udiv	%o5,	0x0600,	%i0
	tge	%icc,	0x0
	wr	%l1,	%o2,	%ccr
	rdhpr	%hintp,	%l0
	wrpr	%o3,	0x1E4C,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	brgz,a	%i7,	loop_779
	wr 	%g0, 	0x4, 	%fprs
	rd	%softint,	%g2
	wrpr	%l5,	%l3,	%pil
loop_779:
	fzeros	%f16

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%ccr,	%i6
	mova	%xcc,	%i5,	%i2
	rdpr	%cleanwin,	%o6
	bgu	%xcc,	loop_780
	edge32	%l4,	%l2,	%g1
	brlz,a	%o7,	loop_781
	wrpr	%g4,	0x11C2,	%tick
loop_780:
	wr	%g6,	%o1,	%softint
	rdhpr	%hpstate,	%g7
loop_781:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x6B6, 	%hsys_tick_cmpr
	movrlz	%o5,	%i0,	%l1
	rd	%y,	%l6
	movrgz	%l0,	%o2,	%o0
	fmul8sux16	%f14,	%f30,	%f26
	rd	%fprs,	%i7
	wrpr	%o4,	%o3,	%pil
	bvs,pt	%xcc,	loop_782
	rdhpr	%htba,	%g2
	rd	%fprs,	%l5
	wrpr	%l3,	0x0C4B,	%tick
loop_782:
	movle	%icc,	%g5,	%i1
	rd	%y,	%i4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x890, 	%hsys_tick_cmpr
	wrpr	%o6,	%l4,	%tick
	bge	loop_783
	mulscc	%l2,	%i2,	%o7
	tneg	%xcc,	0x4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xEDC, 	%hsys_tick_cmpr
loop_783:
	rdpr	%cwp,	%o1
	rdhpr	%hpstate,	%g6
	fornot2s	%f14,	%f15,	%f2
        wr    %g0,    0xe,    %pcr    ! changed.
	rdhpr	%hsys_tick_cmpr,	%i3
	rdpr	%canrestore,	%i0
	wr	%o5,	0x1BA9,	%y
	wrpr	%l1,	%l6,	%cwp
	rdhpr	%hsys_tick_cmpr,	%l0
	rdpr	%pil,	%o0
	membar	0x0F
	rdhpr	%hintp,	%i7
	smul	%o4,	0x0306,	%o2
	alignaddrl	%g2,	%l5,	%o3
	srlx	%l3,	0x01,	%i1
	fbu	%fcc1,	loop_784
        wr    %g0,    0xe,    %pcr    ! changed.
	fmovsneg	%xcc,	%f0,	%f15
	rdpr	%canrestore,	%g5
loop_784:
	wr	%i6,	0x0D77,	%ccr
	rd	%softint,	%l4
	rdhpr	%hsys_tick_cmpr,	%o6
	tvc	%icc,	0x1
	wrpr	%i2,	%o7,	%pil
	rdpr	%tl,	%g1
	movrgz	%l2,	0x0DF,	%g4
	rdhpr	%htba,	%o1
	tsubcc	%g7,	0x12F2,	%g6
	wr	%i3,	0x01B2,	%clear_softint
	addc	%g3,	0x0A99,	%i0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	add	%l1,	0x11AC,	%l0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xA35, 	%hsys_tick_cmpr
	rdpr	%otherwin,	%i7
	movrgz	%o4,	0x114,	%o2
	wrpr	%l5,	%g2,	%cwp
	wrpr	%o3,	%l3,	%tick
	fbe	%fcc0,	loop_785
	wrpr	%i1,	%i5,	%pil
	rd	%ccr,	%g5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xDC0, 	%hsys_tick_cmpr
loop_785:
	tn	%icc,	0x2
	rd	%sys_tick_cmpr,	%i6
	rdhpr	%htba,	%o6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xF22, 	%hsys_tick_cmpr
	edge8l	%i2,	%g1,	%l2
	wrpr	%g4,	0x0CD3,	%pil
	movleu	%xcc,	%o7,	%o1
	array16	%g7,	%g6,	%g3
	fmovrdlz	%i0,	%f28,	%f8
	wrpr	%o5,	0x1F9B,	%cwp
	wrpr	%i3,	0x0A4A,	%pil
	movre	%l0,	%l1,	%o0
	tl	%xcc,	0x0
	wr	%i7,	%o4,	%clear_softint
	rdhpr	%hsys_tick_cmpr,	%o2
	tn	%xcc,	0x3
	ta	%xcc,	0x3
	edge16l	%l5,	%g2,	%l6
	wr	%o3,	%l3,	%y
	wrpr	%i1,	0x0A5A,	%tick
	tvs	%xcc,	0x5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%cansave,	%i6
	rdpr	%cansave,	%i4
	fmovsge	%xcc,	%f12,	%f10
	alignaddr	%o6,	%i2,	%l4
	sir	0x1A8C
	xorcc	%g1,	%g4,	%l2
	xnor	%o7,	%o1,	%g6
	rdhpr	%htba,	%g7
	udivx	%i0,	0x0AA7,	%g3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x318, 	%tick_cmpr
	smul	%l0,	%l1,	%o0
	wr	%o5,	%i7,	%pic

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xCFA, 	%hsys_tick_cmpr
	membar	0x32

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fpmerge	%f22,	%f2,	%f14
	bgu,pt	%icc,	loop_786
	edge8n	%l5,	%l6,	%o3
	wr	%g0,	0x18,	%asi
	ldswa	[%l7 + 0x60] %asi,	%g2
loop_786:
	fand	%f28,	%f10,	%f0
	xnorcc	%l3,	0x0796,	%g5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x896, 	%hsys_tick_cmpr
	rdpr	%canrestore,	%i4
	rdhpr	%htba,	%i6
	rdpr	%cleanwin,	%o6
	sdivcc	%l4,	0x123D,	%g1
	taddcc	%i2,	0x0EE2,	%g4
	rdpr	%cansave,	%o7
	wrpr	%o1,	0x128E,	%cwp
	nop
	set	0x1F, %i0
	ldsb	[%l7 + %i0],	%g6
	sra	%l2,	0x10,	%g7
	tleu	%icc,	0x7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x743, 	%hsys_tick_cmpr
	rdpr	%tba,	%g3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	rd	%fprs,	%o0
	wrpr	%o5,	0x0526,	%cwp
	fpack32	%f0,	%f18,	%f8
	rd	%softint,	%l0
	set	0x10, %i5
	prefetcha	[%l7 + %i5] 0x14,	 0x3
	wrpr	%o2,	%l5,	%pil
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	rdhpr	%htba,	%i7
	wr	%o3,	%g2,	%set_softint
	edge32	%l3,	%l6,	%i5
	rd	%asi,	%g5
	rdhpr	%hpstate,	%i4
	rdpr	%tl,	%i1
	wr	%o6,	0x0F97,	%softint
	set	0x70, %o7
	sta	%f18,	[%l7 + %o7] 0x80
	sdivcc	%i6,	0x16EB,	%l4
	sdiv	%i2,	0x0329,	%g1
	fmovspos	%icc,	%f25,	%f25
	fbe,a	%fcc3,	loop_787
	tl	%xcc,	0x1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	rd	%pc,	%g6
loop_787:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	movrgz	%g7,	0x189,	%g3
	rdhpr	%hsys_tick_cmpr,	%i0
	wrpr	%i3,	%o0,	%cwp
	wrpr	%o5,	%l0,	%cwp
	fmovsvs	%xcc,	%f8,	%f5
	fmovsa	%icc,	%f7,	%f24

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%l5,	%l1,	%pil
	srl	%i7,	0x0B,	%o3
	rdpr	%tl,	%g2
        wr    %g0,    0xe,    %pcr    ! changed.
	fpadd32	%f6,	%f28,	%f10
	wr	%l6,	%g5,	%y
	wr	%i4,	%i1,	%set_softint
        wr    %g0,    0xe,    %pcr    ! changed.

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%tl,	%i2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x5ED, 	%hsys_tick_cmpr
	rdhpr	%hsys_tick_cmpr,	%o1
	wr	%g6,	%l2,	%sys_tick
	rdhpr	%hintp,	%g1
	wrpr	%g7,	0x02BD,	%pil
	rd	%pc,	%g4
	rdhpr	%hintp,	%g3
	rdpr	%pil,	%i0
	wrpr	%o0,	0x10DB,	%tick
	rdhpr	%hpstate,	%i3
	wrpr	%o5,	%l0,	%cwp
	call	loop_788
	fblg	%fcc1,	loop_789
	fexpand	%f13,	%f14
	brnz	%o4,	loop_790
loop_788:
	sethi	0x028E,	%o2
loop_789:
	wr	%l5,	%l1,	%pic
	nop
	set	0x5F, %i7
	ldstub	[%l7 + %i7],	%o3
loop_790:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	rdhpr	%hsys_tick_cmpr,	%l3
	fbule,a	%fcc3,	loop_791
	wrpr	%i7,	%l6,	%tick
	movne	%xcc,	%g5,	%i1
	ld	[%l7 + 0x18],	%f0
loop_791:
	orcc	%i5,	%i4,	%o6
	bcs	loop_792
	sllx	%i2,	0x08,	%i6
	smul	%o7,	%o1,	%g6
	rdpr	%wstate,	%l4
loop_792:
	edge16n	%g1,	%g7,	%l2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%i0,	0x1ADF,	%pil
	movpos	%xcc,	%i3,	%o0
	fpack16	%f12,	%f21
	orn	%o5,	%o4,	%o2
	andn	%l0,	0x0D3A,	%l5
	wr	%g0,	0x2f,	%asi
	stba	%o3,	[%l7 + 0x1C] %asi
	membar	#Sync
	movvs	%xcc,	%g2,	%l1
	taddcctv	%l3,	%i7,	%g5
	andncc	%i1,	%l6,	%i4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x525, 	%hsys_tick_cmpr
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movle	%icc,	%o6,	%i2
	bge	%xcc,	loop_793
	rdpr	%pil,	%o7
	addccc	%i6,	%o1,	%g6
	fpack16	%f14,	%f7
loop_793:
	tl	%xcc,	0x0
	call	loop_794
	rd	%tick_cmpr,	%l4
	wrpr	%g7,	%l2,	%pil
	umul	%g1,	%g3,	%i0
loop_794:
	smul	%i3,	0x0DCF,	%g4
	fmovdgu	%icc,	%f4,	%f20
	rdpr	%cansave,	%o0
	rdhpr	%hintp,	%o5
	ta	%xcc,	0x4
	fpsub16	%f20,	%f30,	%f16
	popc	%o2,	%o4
	wr	%l5,	0x09F3,	%ccr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	srl	%g2,	%o3,	%l1
	rd	%softint,	%l3
	rdhpr	%htba,	%g5
	wrpr	%i7,	0x070B,	%cwp
	wr	%i1,	0x1E4B,	%clear_softint
	rdhpr	%hsys_tick_cmpr,	%l6
	rdpr	%cleanwin,	%i4
	rd	%tick_cmpr,	%i5
	bvs,a,pt	%icc,	loop_795
	wr	%i2,	%o6,	%y
	stx	%o7,	[%l7 + 0x48]
	rdhpr	%htba,	%i6
loop_795:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xAAA, 	%sys_tick_cmpr
	rdpr	%cwp,	%o1
	fzero	%f8
	umulcc	%g7,	%l4,	%g1
	rdpr	%gl,	%g3
	wr 	%g0, 	0x4, 	%fprs
	sub	%i0,	%o0,	%o5
	rdpr	%otherwin,	%o2
	edge8n	%o4,	%l5,	%g4
	wr	%g0,	0x19,	%asi
	lduba	[%l7 + 0x20] %asi,	%l0
	bpos,pn	%xcc,	loop_796
	addccc	%g2,	0x0C23,	%l1
	rd	%sys_tick_cmpr,	%l3
	rd	%sys_tick_cmpr,	%o3
loop_796:
	fpadd32	%f12,	%f12,	%f28
	xnor	%i7,	0x132F,	%g5
	edge16l	%i1,	%i4,	%i5
	wrpr	%l6,	%i2,	%tick
	rdpr	%cleanwin,	%o6
	fbue	%fcc0,	loop_797
        wr    %g0,    0xe,    %pcr    ! changed.
	rdpr	%tba,	%i6
	fbule	%fcc0,	loop_798
loop_797:
	edge8ln	%g6,	%o1,	%g7
	rdhpr	%hintp,	%g1
        wr    %g0,    0xe,    %pcr    ! changed.
loop_798:
	wrpr	%i3,	%i0,	%pil
	fcmps	%fcc3,	%f24,	%f25
	wr	%o0,	0x16FD,	%y

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%htba,	%o5
	rdpr	%cleanwin,	%o4
	fbne	%fcc0,	loop_799
	smulcc	%o2,	%g4,	%l5
	wrpr	%g2,	%l1,	%pil
	rd	%tick_cmpr,	%l3
loop_799:
	wr	%l0,	%i7,	%sys_tick
	alignaddr	%g5,	%o3,	%i4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x177, 	%hsys_tick_cmpr
	rdpr	%cwp,	%i5
	rd	%asi,	%i2
	ble,pn	%icc,	loop_800
	wr 	%g0, 	0x5, 	%fprs
	set	0x20, %l6
	ldda	[%l7 + %l6] 0x2c,	%o6
loop_800:
	rdpr	%cansave,	%i6
	umulcc	%l6,	%g6,	%o1
	rdhpr	%hintp,	%g7
	wr	%g0,	0x81,	%asi
	lduha	[%l7 + 0x40] %asi,	%l4
	ldd	[%l7 + 0x48],	%g0
	fble	%fcc0,	loop_801
	rd	%y,	%i3
	sdivcc	%i0,	0x1A33,	%o0
	fcmpne16	%f12,	%f6,	%l2
loop_801:
	rdpr	%otherwin,	%o5
	wrpr	%o4,	0x01FE,	%pil
	mova	%xcc,	%g3,	%g4
	rdpr	%gl,	%o2
	wrpr	%g2,	%l1,	%cwp
	stb	%l3,	[%l7 + 0x20]
	movg	%icc,	%l0,	%i7
	wr 	%g0, 	0x7, 	%fprs
	set	0x14, %g5
	ldswa	[%l7 + %g5] 0x15,	%l5
	fmovdneg	%xcc,	%f15,	%f10
	wr	%i4,	0x11E8,	%sys_tick
	tpos	%icc,	0x3
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x30
	set	0x30, %g2
	ldxa	[%g0 + %g2] 0x4f,	%i5
	ta	%xcc,	0x0
	rdpr	%gl,	%i2
	rdpr	%otherwin,	%o6
	rdpr	%wstate,	%i1
	rdhpr	%htba,	%o7
	sdivcc	%i6,	0x074D,	%l6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x994, 	%hsys_tick_cmpr
	edge32	%g6,	%g1,	%l4
	wrpr	%i3,	0x17D4,	%pil
	smul	%o0,	0x1155,	%l2
	fabss	%f8,	%f20
	set	0x21, %g7
	ldstuba	[%l7 + %g7] 0x11,	%o5
	wr 	%g0, 	0x7, 	%fprs
	wrpr	%o4,	%g3,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	subccc	%l1,	%g2,	%l0
	wrpr	%l3,	%g5,	%tick
	wr	%g0,	0x10,	%asi
	ldstuba	[%l7 + 0x6F] %asi,	%o3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%i5,	0x16BD,	%pic
	rdpr	%otherwin,	%l5
	movrlz	%o6,	0x2B4,	%i2
	wr	%g0,	0x18,	%asi
	ldda	[%l7 + 0x40] %asi,	%i0
	wrpr	%i6,	0x146A,	%cwp
	sth	%o7,	[%l7 + 0x4E]
	wrpr	%l6,	0x0E05,	%cwp
	rdpr	%gl,	%o1
	wr	%g7,	0x1568,	%y

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xAAB, 	%hsys_tick_cmpr
	wrpr	%l4,	0x04E0,	%pil
	sdivcc	%i3,	0x018C,	%g1
	mulscc	%l2,	%o5,	%i0
	wrpr	%o0,	0x1CD0,	%cwp
	movre	%g3,	0x254,	%o2
	tl	%icc,	0x2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xEEE, 	%hsys_tick_cmpr
	rd	%sys_tick_cmpr,	%g2
	ldd	[%l7 + 0x58],	%l0
	rdpr	%tba,	%g4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xD9C, 	%hsys_tick_cmpr
	fpmerge	%f25,	%f12,	%f6
	sdiv	%i7,	0x1B99,	%i4
	tvs	%xcc,	0x1
	rdhpr	%hpstate,	%i5
	rd	%tick_cmpr,	%l5
	movrlez	%o6,	0x2CF,	%l3
	tl	%icc,	0x3
	wrpr	%i2,	0x0D28,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x327, 	%hsys_tick_cmpr
	wr	%l6,	%i1,	%set_softint

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fmovrde	%g6,	%f24,	%f10
	edge16n	%o1,	%i3,	%l4
	fmovs	%f6,	%f23
	lduh	[%l7 + 0x20],	%l2
	tg	%xcc,	0x3
	rdpr	%cansave,	%g1
	rdpr	%gl,	%o5
	wrpr	%o0,	%i0,	%tick
	fmovsne	%xcc,	%f3,	%f22
	wrpr	%o2,	0x07C2,	%tick
	rdpr	%otherwin,	%g3
	set	0x40, %g3
	stda	%f16,	[%l7 + %g3] 0x80
	rdhpr	%hintp,	%l1
	subc	%o4,	0x1D91,	%l0
	fnot2	%f0,	%f28
	rd	%pc,	%g2
	edge32n	%g4,	%g5,	%i7
	rd	%pc,	%i4
	rd	%pc,	%i5
	rdpr	%gl,	%l5
	rdpr	%tl,	%o6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%hsys_tick_cmpr,	%o3
	faligndata	%f18,	%f0,	%f2
	tl	%xcc,	0x6
	sdivx	%o7,	0x1202,	%i6
	ld	[%l7 + 0x10],	%f3
	membar	0x18
	rdhpr	%hpstate,	%i1
	rdpr	%cleanwin,	%l6
	movneg	%icc,	%g6,	%o1
	udiv	%g7,	0x1BEE,	%i3
	array8	%l2,	%g1,	%l4
	taddcc	%o5,	%i0,	%o2
	rdpr	%wstate,	%g3
	add	%o0,	%l1,	%o4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	movne	%xcc,	%g5,	%g2
	wr	%i4,	0x052C,	%softint

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	subc	%o6,	%l5,	%l3
	fbule,a	%fcc0,	loop_802
	rdhpr	%hpstate,	%o3
	rdhpr	%hpstate,	%o7
	ta	%xcc,	0x7
loop_802:
	bl,pt	%icc,	loop_803
	rd	%pc,	%i2
	brlz,a	%i1,	loop_804
	rd	%ccr,	%l6
loop_803:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%i6,	0x078D,	%y
loop_804:
	tsubcctv	%g7,	%i3,	%l2
	wrpr	%g1,	0x0212,	%tick
	rdpr	%cleanwin,	%l4
	wr	%o5,	0x115F,	%ccr
	wr	%o2,	%i0,	%pic
	bge,pn	%icc,	loop_805
	wrpr	%g3,	%o0,	%cwp
	fornot1	%f0,	%f6,	%f26
	fmovdpos	%icc,	%f27,	%f26
loop_805:
	udivcc	%o4,	0x1F24,	%l0
	bg	%xcc,	loop_806
	wr	%l1,	0x1321,	%sys_tick
	fors	%f3,	%f30,	%f25
	fpadd16s	%f8,	%f25,	%f17
loop_806:
	rdhpr	%htba,	%g4
	xorcc	%g5,	%g2,	%i7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xA19, 	%hsys_tick_cmpr
	movneg	%icc,	%l5,	%o6
	rd	%sys_tick_cmpr,	%l3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x8F9, 	%hsys_tick_cmpr
	tn	%icc,	0x2
	rdhpr	%hpstate,	%i2
	rdhpr	%hsys_tick_cmpr,	%i1
	rd	%y,	%l6
	movrlez	%o7,	0x074,	%o1
	set	0x28, %o2
	prefetcha	[%l7 + %o2] 0x81,	 0x1
	rdhpr	%hpstate,	%g7
	fmovrdne	%i3,	%f10,	%f14
	edge16n	%l2,	%g1,	%i6
	wr	%l4,	%o5,	%set_softint
	set	0x24, %o1
	stha	%i0,	[%l7 + %o1] 0x23
	membar	#Sync
	fmovsne	%xcc,	%f16,	%f12
	rd	%y,	%o2
	edge16n	%g3,	%o0,	%o4
	wr	%g0,	0x10,	%asi
	lduwa	[%l7 + 0x0C] %asi,	%l0
	wrpr	%g4,	%l1,	%cwp
	subc	%g5,	%g2,	%i4
	fbul,a	%fcc1,	loop_807
	ldd	[%l7 + 0x20],	%i4
	movne	%icc,	%l5,	%o6
	movneg	%icc,	%i7,	%o3
loop_807:
	rdhpr	%hintp,	%l3
	wrpr	%i1,	0x05AC,	%pil
	rdhpr	%hpstate,	%l6
	wr	%g0,	0xda,	%asi
	stda	%f16,	[%l7 + 0x40] %asi

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xE7D, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%hpstate,	%i3
	tg	%icc,	0x3
	rdhpr	%hintp,	%g1
	wr	%l2,	0x099B,	%pic
	xor	%i6,	%l4,	%i0
	wrpr	%o5,	%o2,	%pil
	wrpr	%g3,	%o0,	%pil
	rdhpr	%hintp,	%o4
	rd	%ccr,	%g4
	movle	%xcc,	%l1,	%g5
	wr	%g2,	%i4,	%sys_tick
	wrpr	%i5,	0x114E,	%tick
	wrpr	%l5,	0x0B1A,	%pil
	tgu	%xcc,	0x4
	wr	%o6,	0x1B5E,	%sys_tick
	addccc	%i7,	%o3,	%l0
	andcc	%i1,	0x186C,	%l3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%o1,	%i2,	%clear_softint
	tne	%icc,	0x6
	rdhpr	%hpstate,	%l6
	tge	%xcc,	0x1
	addcc	%g7,	%g6,	%i3
	wr	%g0,	0x81,	%asi
	sta	%f25,	[%l7 + 0x18] %asi
	rd	%sys_tick_cmpr,	%g1
	tne	%icc,	0x0
	stbar
	rdpr	%wstate,	%i6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xEB0, 	%hsys_tick_cmpr
	tle	%xcc,	0x7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x4BD, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	andn	%o2,	0x05C7,	%g3
	rdpr	%gl,	%i0
	fpadd32s	%f9,	%f17,	%f16
	wr	%o0,	0x14A8,	%sys_tick
	stx	%g4,	[%l7 + 0x20]

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x6A8, 	%hsys_tick_cmpr
	movre	%o4,	%g5,	%i4
	wr	%i5,	%l5,	%clear_softint
	rd	%sys_tick_cmpr,	%g2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x85C, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x3E7, 	%hsys_tick_cmpr
	wrpr	%l0,	%i7,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x50B, 	%hsys_tick_cmpr
	wrpr	%o1,	%i2,	%cwp
	rdhpr	%hsys_tick_cmpr,	%i1
	rd	%y,	%l6
	movrne	%g7,	%i3,	%g6
	membar	0x6B
	bvs	loop_808
	rd	%y,	%g1
	wrpr	%i6,	%l4,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_808:
	rdpr	%wstate,	%o2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x207, 	%hsys_tick_cmpr
	rdpr	%wstate,	%i0
	wr	%o0,	0x1380,	%clear_softint
	rdhpr	%hpstate,	%g3
	rd	%tick_cmpr,	%l1
	rdhpr	%hpstate,	%g4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x5E3, 	%hsys_tick_cmpr
	mulscc	%i5,	%i4,	%l5
	wr 	%g0, 	0x7, 	%fprs
	rd	%tick_cmpr,	%o6
	wr	%g0,	0x2a,	%asi
	stxa	%l0,	[%l7 + 0x20] %asi
	membar	#Sync
	wrpr	%o3,	0x1590,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	smulcc	%o7,	%i2,	%i1
	movl	%xcc,	%l6,	%o1
	rd	%asi,	%g7
	fcmpeq32	%f14,	%f6,	%g6
	fpsub32	%f0,	%f18,	%f0
	fnot1	%f10,	%f18
	set	0x30, %o0
	lduwa	[%l7 + %o0] 0x0c,	%i3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	rdpr	%canrestore,	%i6
	wrpr	%g1,	%l2,	%tick
	rd	%softint,	%o2
	rdhpr	%hpstate,	%o5
	fcmpd	%fcc0,	%f4,	%f18

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	sub	%o0,	0x09FF,	%l1
	movrgez	%g4,	%g3,	%g5
	edge8	%i5,	%o4,	%i4
	umulcc	%l5,	0x19B0,	%o6
	rdpr	%cleanwin,	%g2
	movneg	%xcc,	%o3,	%l0
	rdhpr	%hsys_tick_cmpr,	%l3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x2BA, 	%hsys_tick_cmpr
	edge32n	%i2,	%i1,	%l6
	rdhpr	%hsys_tick_cmpr,	%o7
	rdhpr	%htba,	%g7
	rd	%fprs,	%o1
	wrpr	%g6,	0x02D9,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fbn	%fcc0,	loop_809
	rdpr	%cwp,	%i6
	wrpr	%o2,	0x12AA,	%tick
	rd	%pc,	%o5
loop_809:
	wrpr	%i0,	0x1048,	%pil
	sdiv	%l4,	0x10AA,	%l2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	tge	%xcc,	0x3
	edge32	%l1,	%g3,	%g5
	rdhpr	%hsys_tick_cmpr,	%g4
	andcc	%i5,	0x0F62,	%i4
	rdhpr	%hintp,	%l5
	nop
	setx	loop_810,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	wr	%o4,	%g2,	%pic
	stb	%o3,	[%l7 + 0x5B]
	tgu	%xcc,	0x4
loop_810:
	movleu	%xcc,	%o6,	%l0
	sir	0x0CD0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x8E8, 	%hsys_tick_cmpr
	edge16	%l3,	%i2,	%l6
	rdhpr	%hsys_tick_cmpr,	%o7
	xor	%i1,	%g7,	%o1
	wrpr	%g6,	%i3,	%pil
	fblg,a	%fcc0,	loop_811
	srlx	%i6,	0x02,	%o2
	fbge,a	%fcc1,	loop_812
	rdpr	%wstate,	%g1
loop_811:
	fbne,a	%fcc2,	loop_813
	wr	%o5,	%i0,	%y
loop_812:
	rdhpr	%hpstate,	%l4
	wr	%l2,	%l1,	%pic
loop_813:
	rdhpr	%hintp,	%o0
	rdhpr	%hpstate,	%g3
	rdpr	%wstate,	%g5
	wr	%g0,	0x11,	%asi
	ldswa	[%l7 + 0x6C] %asi,	%g4
	rd	%y,	%i4
	wr	%l5,	%i5,	%sys_tick
	fbo,a	%fcc3,	loop_814
	nop
	setx	loop_815,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	rdhpr	%hintp,	%o4
	wr	%o3,	%o6,	%y
loop_814:
	rdpr	%pil,	%g2
loop_815:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xDBA, 	%hsys_tick_cmpr
	fbn,a	%fcc1,	loop_816
	rd	%pc,	%l6
	wr	%i2,	%i1,	%ccr
	fmovsvc	%xcc,	%f25,	%f21
loop_816:
	wrpr	%o7,	0x15AA,	%pil
	rd	%tick_cmpr,	%o1
	wrpr	%g7,	0x02A4,	%pil
	rd	%sys_tick_cmpr,	%g6
	rd	%tick_cmpr,	%i6
	brnz,a	%i3,	loop_817
	tle	%icc,	0x4
	rd	%ccr,	%o2
	wrpr	%o5,	%i0,	%cwp
loop_817:
	sllx	%g1,	%l2,	%l4
	array8	%o0,	%g3,	%l1
	wr	%g4,	%g5,	%sys_tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%tl,	%l5
	wr	%o4,	0x0318,	%set_softint
	tleu	%xcc,	0x7
	wrpr	%i5,	0x1D7B,	%tick
	fmovdcs	%xcc,	%f11,	%f16
	edge32n	%o6,	%g2,	%o3
	wr	%l0,	%i7,	%pic
	rdhpr	%hintp,	%l6
	wrpr	%l3,	0x1DE0,	%cwp
	array32	%i2,	%o7,	%i1
	tne	%icc,	0x4
	edge8	%o1,	%g7,	%g6
	smulcc	%i6,	%o2,	%o5
	movge	%xcc,	%i3,	%i0
	add	%g1,	%l2,	%o0
	bneg,pn	%xcc,	loop_818
	ba	loop_819
	tpos	%icc,	0x2
	rdpr	%wstate,	%l4
loop_818:
	fmovscc	%xcc,	%f21,	%f18
loop_819:
	sub	%g3,	0x159C,	%l1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%i4,	%g4,	%tick
	tpos	%icc,	0x7
	fbl	%fcc2,	loop_820
	movleu	%icc,	%o4,	%l5
	umulcc	%i5,	%g2,	%o6
	fmovscs	%icc,	%f8,	%f23
loop_820:
	fmovrse	%o3,	%f9,	%f28
	andcc	%i7,	%l0,	%l6
	wr	%i2,	%o7,	%y
	wrpr	%i1,	%l3,	%cwp
	wr 	%g0, 	0x6, 	%fprs
	rdhpr	%hpstate,	%g6
	rdhpr	%hsys_tick_cmpr,	%o1
	nop
	set	0x38, %o4
	std	%i6,	[%l7 + %o4]

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x9AD, 	%hsys_tick_cmpr
	set	0x2C, %l0
	stwa	%i0,	[%l7 + %l0] 0x2f
	membar	#Sync
	fmovdg	%xcc,	%f8,	%f17
	rdhpr	%hpstate,	%g1
	fcmpd	%fcc1,	%f24,	%f6
	movleu	%icc,	%l2,	%o0
	rdhpr	%htba,	%l4
	rdhpr	%hsys_tick_cmpr,	%g3
	array32	%l1,	%i3,	%g5
        wr    %g0,    0xe,    %pcr    ! changed.
	rd	%pc,	%l5
	wrpr	%g4,	%g2,	%tick
	rdhpr	%htba,	%o6
	rdhpr	%hpstate,	%o3
	orcc	%i5,	0x115D,	%l0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x55F, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xB0A, 	%hsys_tick_cmpr
	wr	%g0,	0x04,	%asi
	ldsha	[%l7 + 0x52] %asi,	%i1
	set	0x62, %i1
	lduba	[%l7 + %i1] 0x18,	%l3
	srax	%g7,	%l6,	%g6
	fmovdn	%icc,	%f17,	%f8
	srl	%o1,	0x0F,	%o2
	rdpr	%pil,	%o5
	ba,pt	%icc,	loop_821
	fornot1s	%f16,	%f15,	%f15
	udivx	%i0,	0x0120,	%i6
	rdpr	%gl,	%l2
loop_821:
	nop
	add	%l7,	0x10,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%o0
	casa	[%l6] %asi,	%o0,	%g1
	umulcc	%g3,	0x0936,	%l1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	set	0x60, %i3
	stxa	%i3,	[%l7 + %i3] 0x22
	membar	#Sync

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x47A, 	%hsys_tick_cmpr
	movle	%xcc,	%i4,	%l5
	bne,a,pn	%xcc,	loop_822
	fnands	%f17,	%f17,	%f18
	wrpr	%g4,	0x11F3,	%cwp
	addccc	%o6,	%o3,	%g2
loop_822:
	nop
	set	0x10, %g1
	ldstuba	[%l7 + %g1] 0x0c,	%i5
	wr	%l0,	0x0A1E,	%clear_softint
	rdhpr	%hsys_tick_cmpr,	%i7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x481, 	%hsys_tick_cmpr
	rdhpr	%htba,	%l3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	array8	%g6,	%o1,	%g7
	rdpr	%canrestore,	%o5
	movcs	%xcc,	%o2,	%i6
	smulcc	%i0,	0x0B8F,	%o0
	fnors	%f28,	%f17,	%f9
	tneg	%icc,	0x5
        wr    %g0,    0xe,    %pcr    ! changed.

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xB16, 	%hsys_tick_cmpr
	sethi	0x1AEC,	%l1
	tcc	%icc,	0x0
	wrpr	%l4,	%l2,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x755, 	%hsys_tick_cmpr
	wrpr	%g5,	0x11F7,	%pil
	wr	%i4,	%l5,	%clear_softint

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	edge32	%g2,	%o3,	%l0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xA64, 	%hsys_tick_cmpr
	rdpr	%tl,	%i7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x7F1, 	%hsys_tick_cmpr
	brgz,a	%o7,	loop_823
	rdpr	%wstate,	%i1
	fba,a	%fcc3,	loop_824
	wr	%g6,	%o1,	%ccr
loop_823:
	swap	[%l7 + 0x2C],	%g7
	wrpr	%l6,	%o5,	%tick
loop_824:
	mulscc	%o2,	0x04BD,	%i6
	rd	%softint,	%o0
	tvc	%xcc,	0x5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x741, 	%hsys_tick_cmpr
	rdhpr	%hpstate,	%l1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x9F6, 	%hsys_tick_cmpr
	brz	%l2,	loop_825
	fnot1s	%f25,	%f15
	fnegs	%f6,	%f24
	rdhpr	%hintp,	%l4
loop_825:
	fbug,a	%fcc1,	loop_826
	wrpr	%i3,	0x0F84,	%tick
	fzero	%f6
	wr	%g5,	%o4,	%sys_tick
loop_826:
	movcc	%xcc,	%l5,	%i4
	xor	%o6,	%g4,	%g2
	fcmpeq32	%f24,	%f16,	%o3
	edge8l	%i5,	%l0,	%i7
	brlz	%i2,	loop_827
	movle	%xcc,	%o7,	%l3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xECE, 	%tick_cmpr
	rd	%softint,	%g7
loop_827:
	addccc	%o1,	%l6,	%o2
	rdpr	%cwp,	%i6
	addccc	%o0,	0x0522,	%o5
	tneg	%xcc,	0x3
	wrpr	%g3,	%i0,	%cwp
	rdhpr	%hsys_tick_cmpr,	%l1
	fbg,a	%fcc1,	loop_828
	fexpand	%f24,	%f20
	tcs	%icc,	0x4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xB06, 	%hsys_tick_cmpr
loop_828:
	edge32n	%i3,	%g5,	%l4
	taddcctv	%o4,	%l5,	%i4
	ldub	[%l7 + 0x64],	%g4
	fmovsleu	%xcc,	%f25,	%f13
	add	%l7,	0x78,	%l6
	wr	%g0,	0x11,	%asi
	casxa	[%l6] 0x11,	%g2,	%o3
	rdpr	%cleanwin,	%o6
	add	%l7,	0x1C,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] %asi,	%i5,	%l0
	rdhpr	%hintp,	%i2
	udivcc	%o7,	0x198A,	%l3
	fmovrde	%i7,	%f10,	%f4
	rdhpr	%hintp,	%i1
	rdpr	%tba,	%g7
	wr	%g6,	0x1463,	%set_softint
	set	0x30, %g6
	lda	[%l7 + %g6] 0x0c,	%f17
	rdhpr	%htba,	%l6
	rdpr	%tba,	%o2
	rd	%ccr,	%i6
	udivcc	%o0,	0x1352,	%o1
	rdhpr	%hintp,	%o5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x6AD, 	%hsys_tick_cmpr
	andn	%l2,	%g1,	%l1
	wr	%i3,	0x05CB,	%clear_softint

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	movle	%icc,	%g5,	%l5
	smulcc	%i4,	%g4,	%o4
	wr	%o3,	%g2,	%softint
	fmovda	%icc,	%f15,	%f1
	move	%icc,	%o6,	%l0
	tneg	%xcc,	0x3
	fbug,a	%fcc0,	loop_829
	edge32ln	%i2,	%o7,	%i5
	fmovsgu	%xcc,	%f17,	%f5
	lduw	[%l7 + 0x74],	%l3
loop_829:
	fmovdg	%xcc,	%f31,	%f30

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
	rdpr	%pil,	%i7
	andcc	%g7,	0x043E,	%l6
	edge8l	%g6,	%i6,	%o0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x0EF, 	%hsys_tick_cmpr
	wrpr	%o5,	0x0FE8,	%pil
	orn	%g3,	%i0,	%l2
	fmovdcs	%icc,	%f11,	%f8
	rdpr	%cleanwin,	%o2
	edge32l	%g1,	%i3,	%l4
	fcmpeq16	%f2,	%f16,	%g5
	rd	%y,	%l5
	rdpr	%tba,	%i4
	rdhpr	%hsys_tick_cmpr,	%g4
	rdhpr	%hintp,	%l1
	st	%f30,	[%l7 + 0x50]
	wr	%g0,	0x2a,	%asi
	stha	%o3,	[%l7 + 0x58] %asi
	membar	#Sync
	rdhpr	%htba,	%g2
	tleu	%xcc,	0x2
	rd	%tick_cmpr,	%o6
	fcmps	%fcc2,	%f2,	%f17
	tl	%icc,	0x0
	wrpr	%o4,	%i2,	%pil
	rd	%pc,	%l0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x50C, 	%tick_cmpr
	rdhpr	%htba,	%i5
	rd	%y,	%i1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xCF6, 	%hsys_tick_cmpr
	wrpr	%l6,	%g6,	%pil
	movneg	%xcc,	%g7,	%o0
	alignaddrl	%i6,	%o5,	%g3
	edge32l	%i0,	%o1,	%l2
	wr	%o2,	0x0054,	%y
	rdpr	%otherwin,	%i3
	te	%icc,	0x1
	rdhpr	%hsys_tick_cmpr,	%l4
	rd	%pc,	%g1
	rdpr	%canrestore,	%l5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x410, 	%hsys_tick_cmpr
	rdpr	%wstate,	%g4
	fpsub16s	%f9,	%f18,	%f16
	rd	%asi,	%l1
	brlez	%g2,	loop_830
	rdhpr	%hsys_tick_cmpr,	%o6
	fmovsleu	%xcc,	%f13,	%f23
	mulscc	%o3,	0x0333,	%i2
loop_830:
	rd	%pc,	%l0
	movcs	%xcc,	%o4,	%i5
	wr	%o7,	%i1,	%clear_softint
	tvs	%xcc,	0x7
	brz,a	%l3,	loop_831
	movn	%icc,	%l6,	%g6
	wr	%g7,	%i7,	%pic
	movrlz	%i6,	0x320,	%o5
loop_831:
	fmul8x16au	%f28,	%f9,	%f2
	edge16n	%o0,	%g3,	%o1
	sth	%i0,	[%l7 + 0x2E]
	rd	%sys_tick_cmpr,	%l2
	fpsub16	%f22,	%f20,	%f4
	rdpr	%gl,	%i3
	rd	%pc,	%o2
	wrpr	%g1,	%l5,	%pil
	wrpr	%g5,	%i4,	%cwp
	rdhpr	%hsys_tick_cmpr,	%l4
	wrpr	%g4,	0x058E,	%tick
	st	%f3,	[%l7 + 0x20]

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	movl	%icc,	%l1,	%o3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%sys_tick_cmpr,	%i1
	wrpr	%o4,	0x1EA6,	%cwp
	rdhpr	%hsys_tick_cmpr,	%l3
	wrpr	%l6,	0x0DEA,	%tick
	rdhpr	%hpstate,	%g7
	nop
	setx	loop_832,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	rdhpr	%hintp,	%g6
	rdhpr	%htba,	%i7
	fsrc1s	%f13,	%f20
loop_832:
	fnot1s	%f16,	%f15
	srlx	%i6,	0x15,	%o0
	rd	%y,	%g3
	wrpr	%o1,	0x0C38,	%cwp
	rd	%asi,	%o5
	wrpr	%i0,	%i3,	%pil
	rd	%tick_cmpr,	%l2
	rdhpr	%hsys_tick_cmpr,	%g1
	rdpr	%gl,	%l5
	rdhpr	%htba,	%o2
	ldsh	[%l7 + 0x1C],	%i4
	set	0x68, %i2
	ldswa	[%l7 + %i2] 0x15,	%l4
	wrpr	%g4,	0x112E,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	movrlz	%o6,	%o3,	%l1
	movg	%xcc,	%l0,	%i5
	ld	[%l7 + 0x70],	%f21
	fbg,a	%fcc3,	loop_833
	wr	%i2,	0x0E0D,	%pic
	wrpr	%o7,	0x08E6,	%cwp
	rd	%softint,	%o4
loop_833:
	rdpr	%tba,	%i1
	rdpr	%wstate,	%l3
	set	0x0F, %i4
	ldstuba	[%l7 + %i4] 0x18,	%g7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xEB9, 	%hsys_tick_cmpr
	xorcc	%i6,	0x088B,	%o0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x94E, 	%hsys_tick_cmpr
	rdhpr	%hintp,	%o5
	wrpr	%i0,	%o1,	%tick
	tcc	%icc,	0x4
	rd	%ccr,	%l2
	rd	%softint,	%g1
	rdpr	%cwp,	%l5
	rd	%sys_tick_cmpr,	%i3
	rd	%y,	%i4
	rd	%sys_tick_cmpr,	%l4
	wrpr	%g4,	0x182E,	%cwp
	rd	%sys_tick_cmpr,	%g2
	rd	%tick_cmpr,	%g5
	tsubcc	%o6,	0x016A,	%o2
	rdpr	%pil,	%l1
	array16	%l0,	%i5,	%o3
	fmovsneg	%icc,	%f18,	%f30
	wrpr	%o7,	0x083A,	%pil
	rd	%y,	%i2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	subcc	%l3,	%g7,	%g6
	rdpr	%cansave,	%i6
	fnor	%f10,	%f12,	%f8
	movrlz	%o0,	%i7,	%g3
	ld	[%l7 + 0x78],	%f2
	rdhpr	%hsys_tick_cmpr,	%l6
	ba,pt	%icc,	loop_834
	rdpr	%canrestore,	%i0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xF2B, 	%hsys_tick_cmpr
	wr	%o5,	0x0AC6,	%softint
loop_834:
	fpadd32	%f10,	%f18,	%f0
	sub	%g1,	0x1C88,	%l5
	wr	%i4,	%i3,	%pic

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x8D1, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x915, 	%hsys_tick_cmpr
	mulscc	%o2,	%g5,	%l1
	wr	%i5,	0x10F4,	%pic
	tvs	%xcc,	0x1
	rdpr	%pil,	%l0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	rdhpr	%hintp,	%o3
	movcc	%xcc,	%o7,	%i1
	wr	%o4,	%l3,	%sys_tick
	movneg	%xcc,	%i2,	%g7
	rdpr	%cansave,	%i6
	ldd	[%l7 + 0x10],	%f16
	rdhpr	%htba,	%o0
	wrpr	%i7,	0x0A81,	%tick
	rdpr	%gl,	%g6
	orn	%g3,	0x106D,	%i0
	taddcctv	%o1,	%l2,	%l6
	tvc	%xcc,	0x1
	tsubcctv	%o5,	%g1,	%l5
	move	%icc,	%i3,	%i4
	movrlez	%l4,	0x0FB,	%g4
	rdpr	%cwp,	%g2
	subcc	%o6,	0x1174,	%g5
	edge8ln	%o2,	%i5,	%l0
	wrpr	%o3,	%l1,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	fblg	%fcc1,	loop_835
	wr	%o4,	0x1150,	%set_softint
	wrpr	%l3,	0x0408,	%pil
	fbue,a	%fcc3,	loop_836
loop_835:
	rdhpr	%hintp,	%g7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	edge32l	%i6,	%i7,	%g3
loop_836:
	fsrc2s	%f0,	%f31
	add	%i0,	0x18B5,	%g6
	sir	0x10E2
	rd	%fprs,	%l2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x83A, 	%hsys_tick_cmpr
        wr    %g0,    0xe,    %pcr    ! changed.
	rdhpr	%hsys_tick_cmpr,	%l5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xEFD, 	%hsys_tick_cmpr
	rdpr	%wstate,	%i3
	wrpr	%l4,	%g4,	%pil
	ldd	[%l7 + 0x20],	%i4
	wrpr	%g2,	0x1E4D,	%cwp
	rd	%ccr,	%g5
	fbo,a	%fcc1,	loop_837
	rdhpr	%htba,	%o6
	wr	%o2,	0x03A2,	%set_softint
	rdhpr	%hsys_tick_cmpr,	%i5
loop_837:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xC9D, 	%hsys_tick_cmpr
	tl	%icc,	0x1
	rd	%sys_tick_cmpr,	%i1
	fmovsn	%icc,	%f26,	%f22
	bshuffle	%f16,	%f0,	%f16
	tpos	%icc,	0x1
	fcmpgt16	%f30,	%f4,	%l0
	wrpr	%o4,	%o7,	%tick
	umulcc	%l3,	0x16F1,	%g7
	rdpr	%wstate,	%i2
	movg	%icc,	%i6,	%i7
	nop
	set	0x67, %i6
	ldsb	[%l7 + %i6],	%o0
	rd	%sys_tick_cmpr,	%g3
	wrpr	%i0,	%g6,	%cwp
	wrpr	%l2,	%l6,	%tick
	rdpr	%tl,	%o1
	wr	%l5,	%g1,	%pic

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xEBA, 	%hsys_tick_cmpr
	wr	%l4,	%g4,	%ccr
	orn	%i4,	0x1D4A,	%g2
	wrpr	%o6,	0x12C0,	%tick
	rd	%y,	%g5
	smulcc	%o2,	%i5,	%l1
	rdpr	%pil,	%i1
	set	0x2C, %l4
	ldswa	[%l7 + %l4] 0x89,	%l0
	rdhpr	%hpstate,	%o3
	rdhpr	%hsys_tick_cmpr,	%o7
	fmovse	%xcc,	%f31,	%f26
	wrpr	%o4,	0x105E,	%tick
	bshuffle	%f26,	%f22,	%f16
	fpack16	%f0,	%f6
	add	%l7,	0x18,	%l6
	wr	%g0,	0x18,	%asi
	casxa	[%l6] 0x18,	%g7,	%l3
	rdhpr	%hpstate,	%i6
	rdpr	%cwp,	%i2
	fone	%f22

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x750, 	%sys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x1D0, 	%hsys_tick_cmpr
	tge	%xcc,	0x6
	wrpr	%g6,	%l6,	%cwp
	wr	%g0,	0x0c,	%asi
	sta	%f23,	[%l7 + 0x34] %asi

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%cansave,	%l5
	add	%o5,	%i3,	%l4
	te	%icc,	0x5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x350, 	%hsys_tick_cmpr
	rdhpr	%htba,	%g2
	tg	%icc,	0x2
	rdpr	%gl,	%o6
	rdhpr	%hpstate,	%g5
	rdpr	%pil,	%o2
	addcc	%i5,	%l1,	%i1
	xor	%g1,	%o3,	%o7
	movcc	%icc,	%l0,	%g7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x1EE, 	%hsys_tick_cmpr
	wr	%i2,	0x141B,	%ccr
	wrpr	%o4,	%o0,	%pil
	sth	%g3,	[%l7 + 0x12]
	udivcc	%i7,	0x1F24,	%g6
	wr	%i0,	0x0589,	%clear_softint
	movvs	%xcc,	%l2,	%o1
	fmovsgu	%icc,	%f0,	%f8
	andn	%l6,	%o5,	%l5
	udiv	%i3,	0x0D82,	%l4
	bvs,a	loop_838
	rdpr	%otherwin,	%g4
	wr	%g2,	%o6,	%clear_softint
	rdhpr	%hpstate,	%i4
loop_838:
	ldstub	[%l7 + 0x13],	%o2
	rdhpr	%hsys_tick_cmpr,	%i5
	ldstub	[%l7 + 0x1E],	%g5
	fcmps	%fcc0,	%f15,	%f14
	umulcc	%i1,	%l1,	%g1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	array8	%l0,	%l3,	%g7
	wr	%i6,	0x194A,	%clear_softint
	rd	%ccr,	%o4
	nop
	setx	loop_839,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movrlez	%i2,	0x20C,	%g3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x980, 	%hsys_tick_cmpr
	fbge,a	%fcc3,	loop_840
loop_839:
	wr 	%g0, 	0x6, 	%fprs
	std	%f2,	[%l7 + 0x28]
	movl	%xcc,	%l2,	%o1
loop_840:
	wr	%i0,	0x004F,	%clear_softint
	rd	%softint,	%o5
	andncc	%l6,	%l5,	%l4
	wr	%i3,	0x1890,	%pic

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xBFF, 	%hsys_tick_cmpr
	sll	%o6,	0x00,	%o2
	wr	%i5,	%g5,	%y
	rd	%fprs,	%i1
	tg	%icc,	0x3
	wrpr	%l1,	0x195B,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	rdpr	%pil,	%g1
	rdhpr	%hsys_tick_cmpr,	%o7
	wrpr	%o3,	0x18D3,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fabsd	%f24,	%f22
	rdhpr	%htba,	%l0
	ble,pt	%icc,	loop_841
	tcc	%xcc,	0x7
	wr	%g0,	0x22,	%asi
	stha	%i6,	[%l7 + 0x70] %asi
	membar	#Sync
loop_841:
	rd	%y,	%i2
	rdhpr	%hintp,	%o4
	rdpr	%pil,	%o0
	tleu	%icc,	0x0
	tle	%xcc,	0x2
	wrpr	%g6,	0x0DA8,	%cwp
	nop
	setx loop_842, %l0, %l1
	jmpl %l1, %i7
	array16	%g3,	%o1,	%l2
	tvc	%icc,	0x0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xFE9, 	%hsys_tick_cmpr
loop_842:
	nop
	setx	loop_843,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	rdhpr	%hpstate,	%l6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	srlx	%i3,	%o5,	%g4
loop_843:
	edge16	%o6,	%o2,	%g2
	rdhpr	%hsys_tick_cmpr,	%g5
	rdhpr	%hsys_tick_cmpr,	%i1
	fcmpeq32	%f14,	%f0,	%l1
	rdpr	%wstate,	%i5
	fands	%f5,	%f31,	%f2
	wrpr	%g1,	%o7,	%pil
	and	%i4,	0x0A3F,	%o3
	wr 	%g0, 	0x6, 	%fprs
	rd	%fprs,	%l0
	rdhpr	%hpstate,	%l3
	xnorcc	%i2,	%i6,	%o0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%hpstate,	%g3
	std	%o0,	[%l7 + 0x38]
	tsubcc	%g6,	%i0,	%l2
	sth	%l5,	[%l7 + 0x68]
	wrpr	%l6,	%l4,	%tick
	rdpr	%tba,	%i3
	ld	[%l7 + 0x48],	%f27
	movcs	%xcc,	%o5,	%o6
	edge16n	%g4,	%g2,	%o2
	bneg,pt	%icc,	loop_844
	rd	%y,	%i1
	set	0x4E, %l5
	stha	%l1,	[%l7 + %l5] 0xe3
	membar	#Sync
loop_844:
	xorcc	%g5,	0x0141,	%i5
	rdhpr	%hpstate,	%o7
	rdhpr	%hpstate,	%g1
	wrpr	%o3,	%i4,	%tick
	fcmpgt32	%f4,	%f20,	%g7
	movpos	%xcc,	%l0,	%i2
	rdpr	%canrestore,	%l3
	tge	%xcc,	0x4
	fand	%f16,	%f0,	%f26
	wr	%i6,	%o0,	%pic
	rdpr	%wstate,	%i7
	rd	%tick_cmpr,	%g3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	tpos	%xcc,	0x1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x442, 	%hsys_tick_cmpr
	te	%xcc,	0x1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%l6,	0x0F50,	%pil
	fcmps	%fcc3,	%f15,	%f24
	sra	%l2,	%i3,	%o5
	edge16ln	%l4,	%g4,	%g2
	rd	%pc,	%o6
	sethi	0x195A,	%i1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x11F, 	%hsys_tick_cmpr
	ldsb	[%l7 + 0x3A],	%g5
	rd	%tick_cmpr,	%o7
	wrpr	%i5,	%g1,	%cwp
	wr	%i4,	%o3,	%softint
	fmovdl	%xcc,	%f21,	%f12
	wr	%g7,	0x0FD1,	%softint
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stb	%l0,	[%l7 + 0x7A]
	taddcctv	%l3,	0x0DD8,	%i6
	rdpr	%gl,	%o0
	wrpr	%i2,	%g3,	%pil
	fblg,a	%fcc3,	loop_845
	brgez,a	%o1,	loop_846
	fmovdle	%icc,	%f23,	%f9

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x60A, 	%hsys_tick_cmpr
loop_845:
	rd	%fprs,	%i7
loop_846:
	xor	%i0,	0x054E,	%l6
	movcc	%xcc,	%l5,	%l2
	andcc	%o5,	%i3,	%l4
	tcc	%icc,	0x4
	wrpr	%g2,	0x0F97,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x01F, 	%hsys_tick_cmpr
	rdhpr	%hintp,	%i1
	wrpr	%g4,	0x13A3,	%cwp
	ldsb	[%l7 + 0x6B],	%l1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x84A, 	%hsys_tick_cmpr
	tvc	%xcc,	0x1
!Yo - got one - imm_asi 0x50 
!And yo - immediate is 0x18
	set	0x18, %l3
	ldxa	[%g0 + %l3] 0x50,	%o7
	wr	%i5,	%g1,	%sys_tick
	rdhpr	%hsys_tick_cmpr,	%i4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xBE5, 	%hsys_tick_cmpr
	movcc	%xcc,	%l0,	%l3
	fmovsge	%icc,	%f4,	%f27
	orcc	%i6,	%o3,	%o0
	edge8l	%g3,	%i2,	%o4
	rdhpr	%hsys_tick_cmpr,	%o1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	rd	%ccr,	%i7
	movn	%xcc,	%i0,	%l6
	edge8ln	%l5,	%l2,	%g6
	mova	%icc,	%o5,	%l4
	sir	0x1D76
	st	%f30,	[%l7 + 0x24]
	array32	%g2,	%o6,	%i1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%fprs,	%l1
	rdpr	%tba,	%i3
	movcc	%xcc,	%o7,	%i5
	or	%g5,	0x0BD7,	%i4
	tcs	%icc,	0x3
	fmovde	%icc,	%f27,	%f3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xBA0, 	%hsys_tick_cmpr
	rd	%tick_cmpr,	%l0
	set	0x50, %l2
	stda	%l2,	[%l7 + %l2] 0xe2
	membar	#Sync
	rdpr	%cwp,	%i6
	rdpr	%tl,	%g7
	fmul8sux16	%f6,	%f26,	%f2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	movneg	%icc,	%o0,	%i2
	set	0x7A, %o3
	lduba	[%l7 + %o3] 0x10,	%g3
	rdpr	%canrestore,	%o4
	fmovsa	%icc,	%f13,	%f20
	smul	%i7,	%i0,	%l6
	fands	%f18,	%f30,	%f11
	rd	%y,	%l5
	fmul8sux16	%f30,	%f28,	%f12
	rdhpr	%hpstate,	%o1
	wrpr	%g6,	0x16EB,	%tick
	wr	%l2,	%l4,	%sys_tick
	tge	%icc,	0x6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xC4E, 	%hsys_tick_cmpr
	ta	%xcc,	0x6
	wr	%o6,	%i1,	%set_softint
	rdpr	%pil,	%o5
	rdhpr	%hpstate,	%g4
	rdhpr	%hsys_tick_cmpr,	%l1
	tle	%icc,	0x0
	fpack16	%f14,	%f24
	xnorcc	%i3,	%o7,	%g5
	tsubcc	%i5,	0x0EBE,	%g1
	rd	%pc,	%o2
	rd	%y,	%l0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	edge16	%i4,	%g7,	%o3
	wrpr	%i2,	0x07F8,	%tick
	umulcc	%g3,	0x0534,	%o0
	tn	%icc,	0x5
	movne	%xcc,	%o4,	%i0
	ble	loop_847
	rdpr	%cleanwin,	%l6
	rdpr	%pil,	%i7
	wrpr	%l5,	%o1,	%cwp
loop_847:
	rdpr	%cwp,	%g6
	rdhpr	%htba,	%l2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fmovrse	%i1,	%f2,	%f21
	rd	%fprs,	%o6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	nop
	setx loop_848, %l0, %l1
	jmpl %l1, %l1
	tcs	%icc,	0x5
	sllx	%g4,	0x1B,	%o7
	fpackfix	%f30,	%f25
loop_848:
	edge8l	%g5,	%i5,	%i3
	wrpr	%g1,	%o2,	%tick
	smul	%l3,	0x1FE3,	%l0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%fprs,	%o3
	wr	%g7,	0x0C8F,	%pic
	siam	0x1
	rdhpr	%hsys_tick_cmpr,	%g3
	set	0x14, %o5
	sta	%f2,	[%l7 + %o5] 0x10
	rd	%y,	%o0
	wr	%i2,	%o4,	%clear_softint
	addc	%i0,	%i7,	%l5
	rdhpr	%hpstate,	%l6
	brnz,a	%o1,	loop_849
	wr	%g6,	%g2,	%ccr
	movne	%icc,	%l2,	%l4
	tleu	%icc,	0x4
loop_849:
	andn	%i1,	%o5,	%l1
	bne,a,pt	%icc,	loop_850
	rdpr	%tba,	%g4
	rd	%ccr,	%o7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xBFF, 	%hsys_tick_cmpr
loop_850:
	orn	%i5,	0x1E08,	%i3
	subccc	%o2,	0x121F,	%l3
	fmovda	%xcc,	%f25,	%f26
	wr	%g1,	%l0,	%softint
	rdpr	%canrestore,	%i6
        wr    %g0,    0xe,    %pcr    ! changed.
	set	0x54, %o6
	swapa	[%l7 + %o6] 0x11,	%o3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%htba,	%o4
	smulcc	%i0,	0x0264,	%i7
	wrpr	%l5,	%l6,	%cwp
	rd	%sys_tick_cmpr,	%o1
	rdhpr	%hpstate,	%g6
	sra	%i2,	%l2,	%l4
	smulcc	%g2,	%i1,	%l1
	fbue,a	%fcc1,	loop_851
	tge	%icc,	0x5
	fsrc2	%f14,	%f4
	andncc	%o5,	%o7,	%g4
loop_851:
	nop
	wr	%g0,	0x0c,	%asi
	lduha	[%l7 + 0x24] %asi,	%g5
	fabsd	%f12,	%f26
	rdpr	%cansave,	%o6
	wr 	%g0, 	0x6, 	%fprs
	mulx	%i3,	%l3,	%g1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x494, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xB7A, 	%tick_cmpr
	rdpr	%canrestore,	%o3
	edge16n	%i4,	%o0,	%g3
	movn	%xcc,	%o4,	%i0
	rdhpr	%htba,	%i7
	rd	%tick_cmpr,	%l5
	mulscc	%o1,	0x1C1B,	%g6
	rdpr	%otherwin,	%l6
	rdhpr	%hpstate,	%i2
	wr	%l4,	0x0007,	%pic
	rdpr	%cwp,	%l2
	alignaddrl	%g2,	%i1,	%o5
	smulcc	%l1,	%o7,	%g4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x7C7, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xC30, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fmovdvc	%icc,	%f4,	%f31
        wr    %g0,    0xe,    %pcr    ! changed.
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wrpr	%l3,	%l0,	%cwp
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x410, 	%hsys_tick_cmpr
	wr	%i4,	%o0,	%set_softint

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xF6F, 	%sys_tick_cmpr
	edge32n	%i6,	%o4,	%i0
	array16	%l5,	%i7,	%o1
	wrpr	%g6,	%l6,	%pil
	tleu	%icc,	0x2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xFB9, 	%hsys_tick_cmpr
	rdpr	%pil,	%l2
	edge8n	%i2,	%g2,	%i1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%hpstate,	%l1
	movle	%xcc,	%g4,	%i5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%o6,	0x022E,	%cwp
	tleu	%xcc,	0x2
	rd	%pc,	%o2
	fandnot2	%f8,	%f0,	%f10
	wrpr	%i3,	0x055E,	%tick
	and	%l3,	%g1,	%l0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xDF2, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x916, 	%hsys_tick_cmpr
	prefetch	[%l7 + 0x54],	 0x3
	rdpr	%cansave,	%i4
	sdivx	%o0,	0x0089,	%i6
	wrpr	%g3,	0x06CE,	%tick
	wrpr	%i0,	%o4,	%tick
	wr	%l5,	0x00F6,	%y
	fmovd	%f4,	%f8
	sdivx	%o1,	0x094A,	%g6
	tle	%xcc,	0x3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x7C7, 	%hsys_tick_cmpr
	fmovsvc	%icc,	%f26,	%f15
	alignaddr	%l4,	%l2,	%l6
	or	%g2,	%i1,	%o5
	rdpr	%pil,	%o7
	wrpr	%l1,	%g4,	%pil
	movpos	%icc,	%i5,	%g5
	membar	0x02
	rdpr	%gl,	%i2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x78B, 	%hsys_tick_cmpr
	wrpr	%i3,	%l3,	%pil
	edge8n	%g1,	%g7,	%o3
	wr	%i4,	%l0,	%pic
        wr    %g0,    0xe,    %pcr    ! changed.
	fmovscc	%icc,	%f26,	%f16
	wr	%g3,	%o0,	%clear_softint
	bgu,a,pn	%xcc,	loop_852
	srax	%o4,	%l5,	%o1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xD50, 	%hsys_tick_cmpr
	rdpr	%cansave,	%i7
loop_852:
	bcc,a	loop_853
	wr	%l4,	%l6,	%clear_softint
	fmul8sux16	%f14,	%f28,	%f30
	rdhpr	%hsys_tick_cmpr,	%g2
loop_853:
	rdpr	%cansave,	%l2
	bvs	loop_854
	rdhpr	%hintp,	%i1
	fmovscs	%icc,	%f13,	%f20
	wr	%o5,	%o7,	%y
loop_854:
	rdhpr	%hsys_tick_cmpr,	%l1
	rdhpr	%hintp,	%g4
	tneg	%icc,	0x0
	movneg	%icc,	%i5,	%g5
	movgu	%icc,	%i2,	%o2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x374, 	%hsys_tick_cmpr
	brgz	%i3,	loop_855
	rd	%asi,	%g7
	fpadd32	%f28,	%f20,	%f28
	wrpr	%g1,	%o3,	%cwp
loop_855:
	wr	%i4,	0x0654,	%pic
	wrpr	%i6,	0x1A02,	%cwp
	fsrc2	%f8,	%f28
	nop
	setx loop_856, %l0, %l1
	jmpl %l1, %g3
	andcc	%l0,	%o0,	%l5
	fmovsg	%icc,	%f3,	%f5
	rd	%fprs,	%o4
loop_856:
	rdpr	%cleanwin,	%o1
	edge16	%g6,	%i7,	%i0
	fmovrdgz	%l4,	%f22,	%f8

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x1B2, 	%hsys_tick_cmpr
	bne	loop_857
	movrgz	%l2,	0x023,	%i1
	fbuge,a	%fcc0,	loop_858
	and	%o7,	0x104A,	%l1
loop_857:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%g5,	%i2,	%ccr
loop_858:
	sllx	%o5,	%o6,	%l3
	rd	%y,	%i3
	wrpr	%o2,	0x12EF,	%pil
	fone	%f10
        wr    %g0,    0xe,    %pcr    ! changed.

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x91D, 	%hsys_tick_cmpr
	rdhpr	%hpstate,	%o3
	move	%xcc,	%i4,	%i6
	set	0x30, %l1
	sta	%f28,	[%l7 + %l1] 0x04
	wr	%l0,	%g3,	%pic
	ble,pt	%icc,	loop_859
	rdpr	%gl,	%l5
	rd	%sys_tick_cmpr,	%o4
	edge16l	%o0,	%g6,	%o1
loop_859:
	wrpr	%i7,	%l4,	%tick
	rdhpr	%hsys_tick_cmpr,	%g2
	rd	%ccr,	%i0
	rd	%y,	%l2
	wr	%i1,	0x1F3E,	%clear_softint
	wr	%g0,	0x04,	%asi
	lduwa	[%l7 + 0x1C] %asi,	%o7
	rdhpr	%hsys_tick_cmpr,	%l1
	edge8l	%g4,	%l6,	%g5
	edge8l	%i5,	%i2,	%o5
	set	0x2C, %i0
	ldswa	[%l7 + %i0] 0x81,	%o6
	wr 	%g0, 	0x6, 	%fprs

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x76E, 	%hsys_tick_cmpr
	wrpr	%g7,	0x0482,	%tick
	fmovsle	%icc,	%f29,	%f4
	rdpr	%tba,	%i3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	nop
	setx	loop_860,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tvs	%icc,	0x2
	fmovsneg	%icc,	%f1,	%f6
	rdhpr	%hpstate,	%i6
loop_860:
	fmovsn	%icc,	%f15,	%f20
	tcs	%xcc,	0x5
	rd	%ccr,	%l0
	bgu,pn	%icc,	loop_861
	alignaddrl	%g3,	%i4,	%l5
	call	loop_862
	prefetch	[%l7 + 0x28],	 0x3
loop_861:
	rd	%pc,	%o4
	rdhpr	%hintp,	%o0
loop_862:
	rdpr	%canrestore,	%g6
	rdhpr	%hpstate,	%i7
	addc	%l4,	%o1,	%g2
	fmovrde	%l2,	%f14,	%f16
	fsrc2	%f18,	%f0
	wr	%i0,	0x085B,	%ccr
	wrpr	%o7,	%i1,	%cwp
	taddcctv	%g4,	0x0917,	%l6
	ta	%xcc,	0x6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x98B, 	%hsys_tick_cmpr
	add	%l7,	0x50,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%i2,	%g5
	rdhpr	%hsys_tick_cmpr,	%o5
	rdpr	%wstate,	%l3
	fblg	%fcc2,	loop_863
	orcc	%o2,	%g7,	%o6
	udiv	%o3,	0x1622,	%g1
	wr	%g0,	0xd9,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
loop_863:
	nop
	setx loop_864, %l0, %l1
	jmpl %l1, %i6
	movgu	%icc,	%l0,	%i3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x70A, 	%hsys_tick_cmpr
	rd	%asi,	%i4
loop_864:
	fmovsne	%icc,	%f5,	%f31
	edge16l	%o4,	%o0,	%i7
	bvc,pt	%icc,	loop_865
	wr	%l4,	%o1,	%clear_softint
	rd	%ccr,	%g6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_865:
	xnorcc	%o7,	%l2,	%i1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%hpstate,	%i5
	movgu	%icc,	%l1,	%g5
	edge32ln	%i2,	%l3,	%o2
	movvs	%xcc,	%g7,	%o5
	wr	%o3,	%g1,	%ccr
	fcmple16	%f8,	%f18,	%o6
	rd	%fprs,	%i6
	fmul8x16al	%f26,	%f0,	%f20
	rdhpr	%hsys_tick_cmpr,	%l0
	wr	%g3,	%i3,	%clear_softint
	te	%icc,	0x7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x80B, 	%hsys_tick_cmpr
	wr	%l5,	0x1FA7,	%pic
	edge32	%o0,	%l4,	%o1
	rdhpr	%hintp,	%g6
	subc	%g2,	0x148F,	%i0
	fmovsn	%xcc,	%f19,	%f14
	tleu	%xcc,	0x1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%o7,	%i1,	%cwp
	ta	%icc,	0x7
	wrpr	%g4,	0x19F3,	%tick
	mulscc	%l6,	%l1,	%i5
	tcc	%xcc,	0x7
	movg	%xcc,	%i2,	%g5
	wrpr	%o2,	%g7,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%g0,	0xeb,	%asi
	stda	%l2,	[%l7 + 0x38] %asi
	membar	#Sync
	rdpr	%pil,	%o6
	edge32ln	%g1,	%i6,	%g3
	set	0x60, %i5
	ldda	[%l7 + %i5] 0xea,	%l0
	umul	%i3,	%i4,	%o4
	ldx	[%l7 + 0x28],	%l5
	bne	%icc,	loop_866
	addc	%o0,	%o1,	%g6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x33C, 	%hsys_tick_cmpr
	stw	%g2,	[%l7 + 0x34]
loop_866:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x6C7, 	%hsys_tick_cmpr
	rdpr	%cansave,	%l2
	rd	%tick_cmpr,	%i1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xC81, 	%hsys_tick_cmpr
	bpos	loop_867
	wrpr	%l1,	%i2,	%pil
	wrpr	%i5,	0x0516,	%pil
	srlx	%o2,	0x0A,	%g7
loop_867:
	edge32ln	%g5,	%o5,	%l3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x66A, 	%hsys_tick_cmpr
	rdpr	%cansave,	%o3
	tpos	%xcc,	0x0
	rd	%ccr,	%g3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%hintp,	%i3
	rd	%y,	%o4
	add	%l7,	0x30,	%l6
	wr	%g0,	0x11,	%asi
	casxa	[%l6] %asi,	%i4,	%l5
	fnegs	%f11,	%f6
	smulcc	%o1,	0x05BC,	%g6
	wr 	%g0, 	0x6, 	%fprs
	bpos,a,pn	%xcc,	loop_868
	fzeros	%f18
	wr	%g2,	%i7,	%pic
	wrpr	%o7,	%l2,	%cwp
loop_868:
	bn,pt	%icc,	loop_869
	tg	%icc,	0x3
	movleu	%icc,	%i1,	%i0
	bneg	%xcc,	loop_870
loop_869:
	udiv	%g4,	0x1F38,	%l6
	sll	%i2,	%l1,	%i5
	brgz,a	%o2,	loop_871
loop_870:
	brgz	%g5,	loop_872
	bgu,pt	%xcc,	loop_873
	movcc	%icc,	%o5,	%g7
loop_871:
	wr	%o6,	%g1,	%pic
loop_872:
	fpmerge	%f9,	%f11,	%f4
loop_873:
	rdpr	%cleanwin,	%o3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%l0,	%g3,	%sys_tick
	tg	%xcc,	0x5
	fbo,a	%fcc0,	loop_874
	addc	%i3,	0x02EB,	%i4
	subccc	%l5,	0x1874,	%o1
	rd	%softint,	%g6
loop_874:
	srax	%l4,	%o4,	%o0
	movrne	%i7,	0x049,	%o7
	subcc	%g2,	0x1BDD,	%i1
	brgz,a	%l2,	loop_875
	wr 	%g0, 	0x4, 	%fprs
	rd	%sys_tick_cmpr,	%l6
	rdhpr	%htba,	%i2
loop_875:
	tsubcctv	%l1,	0x1D1C,	%g4
	rdpr	%cleanwin,	%i5
	wr	%g5,	%o2,	%y
	rdhpr	%htba,	%g7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xD11, 	%hsys_tick_cmpr
	rdpr	%cansave,	%g1
	udivcc	%o3,	0x0F28,	%l3
	rdhpr	%hpstate,	%l0
	rdpr	%cwp,	%i6
	wrpr	%g3,	0x18E6,	%cwp
	rd	%softint,	%i3
	rdhpr	%hpstate,	%l5
	wrpr	%i4,	%o1,	%pil
	bcc	%xcc,	loop_876
	ldsw	[%l7 + 0x5C],	%g6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%hpstate,	%i7
loop_876:
	fbe,a	%fcc0,	loop_877
	rd	%ccr,	%o4
	sethi	0x0BED,	%g2
	wrpr	%i1,	%l2,	%pil
loop_877:
	rd	%asi,	%i0
	wrpr	%o7,	0x11B3,	%cwp
	movrgz	%i2,	%l6,	%l1
	rdpr	%gl,	%g4
	subcc	%g5,	%i5,	%o2
	movne	%xcc,	%o6,	%o5
	movrlez	%g7,	0x310,	%g1
	fmovdneg	%xcc,	%f16,	%f29
	fmovdneg	%xcc,	%f5,	%f15
	rd	%sys_tick_cmpr,	%o3
	movgu	%icc,	%l3,	%l0
	rd	%softint,	%i6
	sll	%g3,	%i3,	%i4
	edge32n	%l5,	%o1,	%g6
	fmovrsne	%o0,	%f23,	%f11
	fmovrdlez	%l4,	%f30,	%f16
	rdhpr	%hpstate,	%i7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x895, 	%hsys_tick_cmpr
	rdpr	%cleanwin,	%g2
	nop
	setx	loop_878,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	tsubcc	%l2,	%o7,	%i0
	fmovsne	%xcc,	%f19,	%f4
	rdpr	%canrestore,	%l6
loop_878:
	rdhpr	%htba,	%i2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x358, 	%hsys_tick_cmpr
	tcc	%icc,	0x0
	rd	%ccr,	%g4
	and	%i5,	%o2,	%o6
	wr	%o5,	%g5,	%y
	bshuffle	%f10,	%f12,	%f24
	rdhpr	%hintp,	%g1
	wr	%g0,	0x89,	%asi
	ldstuba	[%l7 + 0x43] %asi,	%o3
	rdpr	%cleanwin,	%l3
	rdhpr	%hpstate,	%g7
	movne	%icc,	%l0,	%g3
	sra	%i3,	0x1B,	%i6
	rdhpr	%hpstate,	%l5
	tge	%xcc,	0x3
	rdhpr	%hsys_tick_cmpr,	%i4
	wr	%g6,	0x03D6,	%y
	tleu	%xcc,	0x3
	subcc	%o0,	0x027F,	%l4
	fmovdvs	%xcc,	%f22,	%f7
	wrpr	%i7,	%o4,	%pil
	rdpr	%cansave,	%i1
	sub	%o1,	0x1CF2,	%l2
	wr	%g2,	0x115D,	%y
	wr 	%g0, 	0x7, 	%fprs
	rd	%tick_cmpr,	%i2
	bvc,pn	%xcc,	loop_879
	sll	%l6,	%g4,	%i5
	umulcc	%o2,	0x07AE,	%l1
	fmovrdlez	%o6,	%f26,	%f14
loop_879:
	fmovsg	%xcc,	%f7,	%f15
	fmovdleu	%icc,	%f25,	%f19
	wrpr	%g5,	0x0620,	%pil
	ble,a	loop_880
	rd	%tick_cmpr,	%o5
	movle	%xcc,	%g1,	%o3
	fpadd32	%f26,	%f30,	%f6
loop_880:
	tvs	%icc,	0x0
	fone	%f14
	rdhpr	%hintp,	%g7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xDE0, 	%hsys_tick_cmpr
	rdpr	%cleanwin,	%l3
	fornot1	%f0,	%f20,	%f2
	bne,pn	%icc,	loop_881
	tpos	%icc,	0x7
	be,pt	%icc,	loop_882
	wr 	%g0, 	0x4, 	%fprs
loop_881:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x6A2, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x6F8, 	%tick_cmpr
loop_882:
	rdhpr	%hintp,	%i3
	orn	%g6,	0x1021,	%o0
	bg,a,pt	%xcc,	loop_883
	udivx	%i7,	0x11CA,	%o4
	rdpr	%wstate,	%l4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xAFC, 	%hsys_tick_cmpr
loop_883:
	wrpr	%l2,	%g2,	%tick
	rdhpr	%hpstate,	%o7
	rd	%ccr,	%i2
	add	%l6,	%i0,	%i5
	array8	%o2,	%g4,	%o6
	rd	%sys_tick_cmpr,	%l1
	rdhpr	%hsys_tick_cmpr,	%g5
	fmovdne	%icc,	%f31,	%f8
	srax	%g1,	0x01,	%o5
	ldstub	[%l7 + 0x66],	%o3
	wrpr	%g7,	%l3,	%pil
	ldsh	[%l7 + 0x6A],	%g3
	rdpr	%wstate,	%i6
	rdpr	%pil,	%l0
	rd	%fprs,	%l5
	rdhpr	%hsys_tick_cmpr,	%i3
	movneg	%xcc,	%i4,	%g6
	fba,a	%fcc1,	loop_884
	movre	%o0,	0x01F,	%o4
	rd	%fprs,	%i7
	bn,a	%icc,	loop_885
loop_884:
	wrpr	%l4,	%o1,	%tick
	rdhpr	%hpstate,	%i1
	rdpr	%gl,	%g2
loop_885:
	tsubcctv	%l2,	0x083E,	%i2
	rdpr	%otherwin,	%l6
	wrpr	%o7,	0x1689,	%cwp
	fbul	%fcc0,	loop_886
	rdhpr	%hintp,	%i5
	rdpr	%cleanwin,	%i0
	ba,a,pt	%icc,	loop_887
loop_886:
	rdpr	%otherwin,	%g4
	rdpr	%tba,	%o6
	set	0x54, %g4
	stwa	%o2,	[%l7 + %g4] 0x14
loop_887:
	brnz,a	%g5,	loop_888
	rdpr	%tba,	%l1
	array8	%o5,	%o3,	%g7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
loop_888:
	tpos	%icc,	0x0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fcmpgt16	%f30,	%f10,	%l3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x09A, 	%hsys_tick_cmpr
	wr	%l5,	%i4,	%softint
	wr	%o0,	%g6,	%clear_softint
	wrpr	%i7,	%l4,	%tick
	bvs,a,pn	%xcc,	loop_889
	movrgz	%o4,	%i1,	%g2
	edge8n	%o1,	%i2,	%l6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xE1A, 	%tick_cmpr
loop_889:
	fbuge	%fcc2,	loop_890
	fpsub32	%f2,	%f6,	%f26
	taddcctv	%i0,	%g4,	%o6
	tge	%xcc,	0x3
loop_890:
	rdpr	%cansave,	%o7
	brz,a	%o2,	loop_891
	rdhpr	%htba,	%l1
	rdpr	%pil,	%o5
	rdpr	%wstate,	%o3
loop_891:
	wrpr	%g5,	0x050E,	%pil
	rd	%tick_cmpr,	%g1
	rd	%y,	%g7
	rd	%y,	%g3
	wrpr	%i6,	%l0,	%tick
	wrpr	%i3,	0x0B99,	%tick
	srl	%l3,	0x19,	%l5
	rd	%sys_tick_cmpr,	%i4
	andcc	%o0,	%i7,	%l4
	wrpr	%g6,	0x1EE6,	%cwp
	rdpr	%otherwin,	%o4
	sra	%i1,	0x18,	%o1
	prefetch	[%l7 + 0x38],	 0x3
	ldsb	[%l7 + 0x4F],	%i2
	rd	%y,	%l6
	rdpr	%pil,	%l2
	wrpr	%i5,	%g2,	%tick
	wrpr	%i0,	0x00BC,	%tick
	rd	%asi,	%o6
	nop
	set	0x29, %o7
	ldsb	[%l7 + %o7],	%g4
	rdpr	%cwp,	%o7
	edge16	%o2,	%l1,	%o5
	wr	%o3,	0x0E5C,	%ccr
	rdhpr	%htba,	%g1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x02A, 	%hsys_tick_cmpr
	movvc	%xcc,	%g3,	%g5
	fmovrdlez	%l0,	%f8,	%f24

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fbg	%fcc3,	loop_892
	sir	0x1750
	rd	%fprs,	%l5
	or	%i4,	%l3,	%o0
loop_892:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xB89, 	%hsys_tick_cmpr
	sdivx	%l4,	0x15BD,	%g6
	bneg	%xcc,	loop_893
	rdpr	%cansave,	%i1
	rdpr	%gl,	%o1
	movpos	%icc,	%i2,	%l6
loop_893:
	stw	%o4,	[%l7 + 0x5C]
	rdpr	%gl,	%i5
	wrpr	%g2,	0x17F4,	%tick
	wrpr	%i0,	%o6,	%cwp
	movge	%icc,	%l2,	%g4
	fones	%f29
	ldx	[%l7 + 0x78],	%o2
	rdpr	%canrestore,	%l1
	movneg	%icc,	%o5,	%o3
	rdhpr	%htba,	%g1
	rd	%sys_tick_cmpr,	%o7
	fcmpgt16	%f30,	%f10,	%g3
	rd	%tick_cmpr,	%g7
	wrpr	%g5,	0x1BB4,	%cwp
	rdhpr	%htba,	%l0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x327, 	%hsys_tick_cmpr
	fornot1	%f4,	%f2,	%f22
	movpos	%xcc,	%i3,	%l5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x1B4, 	%hsys_tick_cmpr
	movrlez	%o0,	0x18A,	%i7
	rdhpr	%htba,	%l3
	wr	%l4,	%g6,	%set_softint
	set	0x74, %l6
	ldsba	[%l7 + %l6] 0x88,	%o1
	tne	%icc,	0x1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%wstate,	%l6
	rd	%softint,	%o4
	membar	0x26
	edge16n	%g2,	%i0,	%o6
	wr	%g0,	0x2b,	%asi
	stxa	%i5,	[%l7 + 0x40] %asi
	membar	#Sync
	set	0x1A, %g5
	lduha	[%l7 + %g5] 0x19,	%l2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x3CC, 	%hsys_tick_cmpr
	edge32	%o2,	%o5,	%o3
	movle	%xcc,	%o7,	%g3
	fmovrslz	%g1,	%f27,	%f17
	tvs	%xcc,	0x2
	xnorcc	%g7,	0x1888,	%l0
	srlx	%i6,	%g5,	%i3
	edge32n	%l5,	%o0,	%i7
	array8	%i4,	%l3,	%g6
	fmovrdlez	%l4,	%f20,	%f14
	wrpr	%o1,	%i2,	%tick
	edge8l	%i1,	%o4,	%g2
	srl	%i0,	0x1C,	%l6
	wrpr	%o6,	%i5,	%cwp
	wrpr	%g4,	0x046A,	%tick
	rd	%asi,	%l2
	rdhpr	%hsys_tick_cmpr,	%o2
	wrpr	%l1,	%o3,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%g1,	0x02AB,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xA4F, 	%hsys_tick_cmpr
	rd	%sys_tick_cmpr,	%l0
	ldd	[%l7 + 0x28],	%f2
	rd	%y,	%g7
	wr	%g5,	0x0849,	%softint
	rd	%softint,	%i6
	brz	%i3,	loop_894
	wr	%l5,	%i7,	%softint
	udivx	%o0,	0x1A1E,	%l3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_894:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fandnot2s	%f20,	%f31,	%f29
	rdhpr	%hintp,	%o1
	umul	%i1,	%i2,	%o4
	edge16	%g2,	%l6,	%o6
	wr	%i5,	0x1675,	%clear_softint
	movrlz	%i0,	0x219,	%l2
	wrpr	%g4,	%l1,	%pil
	rdpr	%cansave,	%o2
	rdhpr	%hintp,	%o7
	wr 	%g0, 	0x6, 	%fprs
	wr	%o3,	%g1,	%pic

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x3D9, 	%tick_cmpr
	rdhpr	%hpstate,	%g7
	fmovrslez	%g5,	%f0,	%f19

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%cleanwin,	%l5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%i7,	%o0,	%y
	udivx	%i4,	0x09C7,	%l4
	edge32	%l3,	%g6,	%i1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x12B, 	%hsys_tick_cmpr
	ta	%icc,	0x3
	andncc	%g2,	%o1,	%l6
	rdhpr	%htba,	%i5
	rdpr	%canrestore,	%o6
	fbl,a	%fcc1,	loop_895
	rdpr	%canrestore,	%i0
	srax	%l2,	%g4,	%l1
	wrpr	%o2,	%o5,	%tick
loop_895:
	wrpr	%o3,	%g1,	%cwp
	wr	%g3,	0x0E9D,	%clear_softint
	movpos	%icc,	%g7,	%g5
	ld	[%l7 + 0x3C],	%f7
	rd	%asi,	%o7
	pdist	%f14,	%f22,	%f12
	rdhpr	%htba,	%l0
	bl,a,pt	%icc,	loop_896
	fpsub32	%f10,	%f28,	%f4
	rd	%asi,	%i6
	wrpr	%l5,	0x0EC0,	%pil
loop_896:
	ldd	[%l7 + 0x78],	%f8
	tvc	%xcc,	0x5
	tvc	%icc,	0x4
	set	0x28, %i7
	sta	%f17,	[%l7 + %i7] 0x11
	sir	0x1CB3
	tneg	%xcc,	0x6
	fba	%fcc1,	loop_897
	sra	%i3,	0x0C,	%o0
	rdpr	%tl,	%i7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_897:
	rd	%pc,	%l3
	edge32ln	%g6,	%i4,	%i1
	set	0x10, %g7
	ldxa	[%l7 + %g7] 0x15,	%o4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x851, 	%hsys_tick_cmpr
	set	0x74, %g3
	sta	%f23,	[%l7 + %g3] 0x80
	wrpr	%l6,	%g2,	%cwp
	wr	%i5,	%o6,	%ccr
	rdhpr	%hsys_tick_cmpr,	%l2
	ldub	[%l7 + 0x19],	%i0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%o2,	0x1FA6,	%tick
	tsubcctv	%o5,	%g1,	%g3
	rdhpr	%hintp,	%g7
	rdpr	%gl,	%g5
	udivx	%o7,	0x1C69,	%o3
	ldstub	[%l7 + 0x3B],	%l0
	rd	%ccr,	%l5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x952, 	%hsys_tick_cmpr
	sdivcc	%o0,	0x010A,	%i7
	fbul	%fcc2,	loop_898
	or	%i3,	%l4,	%g6
	rd	%softint,	%i4
	wrpr	%i1,	0x1F18,	%pil
loop_898:
	nop
	set	0x20, %g2
	ldxa	[%l7 + %g2] 0x04,	%l3
	rd	%softint,	%o4
	fmovsneg	%xcc,	%f1,	%f31
	tsubcc	%i2,	%o1,	%g2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x6F0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	smulcc	%o6,	%g4,	%i0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xFBE, 	%hsys_tick_cmpr
	wrpr	%o2,	%o5,	%cwp
	edge32n	%g3,	%g1,	%g7
	rd	%ccr,	%g5
	rdpr	%cansave,	%o7
	wrpr	%l0,	0x047F,	%tick
	rdhpr	%hintp,	%o3
	wrpr	%l5,	0x1712,	%tick
	rdpr	%wstate,	%o0
	rd	%sys_tick_cmpr,	%i6
	xnorcc	%i3,	0x1546,	%i7
	orn	%g6,	%l4,	%i1
	subc	%i4,	%l3,	%i2
	bn,a,pt	%xcc,	loop_899
	bn,a	%icc,	loop_900
	rdpr	%wstate,	%o1
	rdpr	%pil,	%g2
loop_899:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_900:
	wrpr	%i5,	0x04E6,	%cwp
	brlz,a	%l6,	loop_901
	wrpr	%l2,	0x1E34,	%tick
	sth	%o4,	[%l7 + 0x6A]
	taddcctv	%g4,	%o6,	%i0
loop_901:
	xor	%o2,	%l1,	%g3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	tl	%icc,	0x0
	wrpr	%g1,	%g7,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%l0,	%l5,	%cwp
	set	0x28, %o1
	stxa	%o3,	[%l7 + %o1] 0x2f
	membar	#Sync
	wrpr	%o0,	%i3,	%tick
	fnands	%f23,	%f30,	%f30

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xE01, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x29E, 	%hsys_tick_cmpr
	fnors	%f5,	%f18,	%f29

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xEBB, 	%hsys_tick_cmpr
	lduw	[%l7 + 0x2C],	%l3
	bl	%xcc,	loop_902
        wr    %g0,    0xe,    %pcr    ! changed.
	rdhpr	%hsys_tick_cmpr,	%g2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_902:
	fbne,a	%fcc0,	loop_903
	rdpr	%canrestore,	%o1
	rd	%sys_tick_cmpr,	%l2
	wrpr	%o4,	0x01B4,	%cwp
loop_903:
	rdpr	%cwp,	%l6
	tvc	%xcc,	0x6
	bge,a	loop_904
	rdpr	%wstate,	%g4
	alignaddrl	%i0,	%o2,	%o6
	rdhpr	%hsys_tick_cmpr,	%l1
loop_904:
	nop
	wr	%g0,	0x80,	%asi
	stwa	%o5,	[%l7 + 0x30] %asi
	rd	%fprs,	%g1
	fnot2	%f24,	%f14
	wr	%g3,	0x12A5,	%y
	edge16ln	%g7,	%o7,	%g5
	fmovdcc	%icc,	%f24,	%f23
	fxors	%f19,	%f18,	%f20

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%wstate,	%o3
	wrpr	%o0,	%l0,	%pil
	fmul8x16al	%f22,	%f19,	%f14
	bge	loop_905
	tpos	%icc,	0x1
	wrpr	%i3,	%i6,	%pil
	fblg	%fcc0,	loop_906
loop_905:
	ba,pn	%xcc,	loop_907
	wr	%g6,	0x024E,	%softint
	fbue,a	%fcc0,	loop_908
loop_906:
	sub	%i1,	%i4,	%i7
loop_907:
	rdpr	%wstate,	%i2
	subc	%l3,	%l4,	%i5
loop_908:
	wrpr	%g2,	0x01C7,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%tl,	%l6
	wrpr	%g4,	%o4,	%cwp
	mulx	%i0,	%o2,	%o6
	rdhpr	%htba,	%o5
	fbule	%fcc0,	loop_909
	rd	%fprs,	%l1
	movvs	%icc,	%g1,	%g3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
loop_909:
	bgu	%xcc,	loop_910
	wr	%g7,	%l5,	%pic
	wr	%o3,	%o0,	%softint
	array16	%l0,	%i3,	%i6
loop_910:
	wr	%i1,	%g6,	%softint
	movrgez	%i4,	0x26E,	%i2
	rdhpr	%hintp,	%i7
	rdhpr	%htba,	%l4
	sdiv	%i5,	0x14C7,	%l3
	tleu	%xcc,	0x6
	wr 	%g0, 	0x6, 	%fprs
	fbn	%fcc1,	loop_911
	rd	%tick_cmpr,	%o1
	ldd	[%l7 + 0x28],	%f26
	rdpr	%tl,	%g4
loop_911:
	udivcc	%l6,	0x0AF6,	%i0
	rdpr	%tba,	%o2
	taddcctv	%o6,	%o5,	%o4
	wr 	%g0, 	0x5, 	%fprs
	fors	%f14,	%f28,	%f4
	edge8n	%o7,	%g1,	%g7
	tne	%xcc,	0x6
	fandnot1s	%f27,	%f21,	%f19
	wrpr	%l5,	%g5,	%pil
	rdhpr	%hintp,	%o3
	rdhpr	%hintp,	%o0
	rd	%sys_tick_cmpr,	%i3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%pil,	%i1
	fmovda	%icc,	%f17,	%f28
	rdpr	%tl,	%g6
	rdhpr	%hpstate,	%l0
	or	%i2,	%i4,	%i7
	fbul,a	%fcc3,	loop_912
	rdpr	%canrestore,	%i5
	tleu	%xcc,	0x2
	rd	%fprs,	%l3
loop_912:
	rd	%pc,	%g2
	wrpr	%l4,	0x0032,	%cwp
	movrne	%l2,	0x207,	%g4
	rd	%sys_tick_cmpr,	%l6
	wr	%o1,	%i0,	%set_softint
	wrpr	%o6,	0x1CE4,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xA73, 	%hsys_tick_cmpr
	wrpr	%o5,	0x10C8,	%cwp
	ldsb	[%l7 + 0x78],	%o4
	fba,a	%fcc1,	loop_913
	rdhpr	%hpstate,	%g3
	rd	%sys_tick_cmpr,	%o7
	smul	%l1,	0x03D1,	%g7
loop_913:
	sdiv	%g1,	0x1B48,	%g5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%htba,	%o3
	fbul	%fcc2,	loop_914
	wrpr	%i6,	%i1,	%pil
	wrpr	%g6,	%l0,	%tick
	rdpr	%tba,	%i3
loop_914:
	rdhpr	%hsys_tick_cmpr,	%i2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%htba,	%i5
	ldx	[%l7 + 0x78],	%l3
	sdiv	%g2,	0x0483,	%l4
	wrpr	%l2,	0x061B,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fbl,a	%fcc1,	loop_915
	wrpr	%g4,	%o1,	%tick
	wr	%o6,	0x0BDC,	%set_softint
	fmovda	%icc,	%f3,	%f21
loop_915:
	wr	%i0,	0x0410,	%pic
	edge32	%o2,	%o4,	%o5
	wr 	%g0, 	0x5, 	%fprs
	ld	[%l7 + 0x14],	%f14

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	bvs,a,pt	%icc,	loop_916
	wrpr	%g5,	%l5,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xC9E, 	%hsys_tick_cmpr
	movre	%o0,	0x353,	%i6
loop_916:
	stb	%i1,	[%l7 + 0x3F]
	rdpr	%cwp,	%o3
	array8	%l0,	%g6,	%i3
	wrpr	%i7,	0x001D,	%pil
	wrpr	%i5,	%l3,	%tick
	rdhpr	%htba,	%g2
	xor	%i2,	0x1CDB,	%l4
	flush	%l7 + 0x34
	rdhpr	%hsys_tick_cmpr,	%i4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x51D, 	%hsys_tick_cmpr
	wr	%o1,	%o6,	%softint
	wr	%l2,	0x1325,	%set_softint

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xF9F, 	%hsys_tick_cmpr
	fmovrdgz	%o4,	%f20,	%f2
	wr 	%g0, 	0x5, 	%fprs
	mulx	%l1,	%i0,	%g7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	wr	%g1,	0x10E5,	%sys_tick
	udivcc	%o0,	0x1D52,	%i6
	movrgz	%g3,	0x232,	%i1
	rdpr	%cansave,	%o3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%i3,	0x11DF,	%ccr
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movvs	%icc,	%g6,	%i7
	wrpr	%l3,	0x01B6,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fandnot1	%f6,	%f0,	%f20
	bvs,a,pn	%icc,	loop_917
	rd	%ccr,	%l4
	fmovsne	%xcc,	%f9,	%f28
	wr	%i2,	%l6,	%y
loop_917:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xBC8, 	%hsys_tick_cmpr
	nop
	setx loop_918, %l0, %l1
	jmpl %l1, %g4
	brlez	%o6,	loop_919
	ldd	[%l7 + 0x18],	%l2
	rdpr	%otherwin,	%o1
loop_918:
	rdpr	%gl,	%o2
loop_919:
	brlez	%o4,	loop_920
	wrpr	%o7,	0x0F95,	%cwp
	membar	0x52

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_920:
	smulcc	%o5,	%g5,	%l5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fbo	%fcc3,	loop_921
	wr	%i6,	%g3,	%ccr
	wr	%o0,	0x014C,	%clear_softint
	rdhpr	%hsys_tick_cmpr,	%o3
loop_921:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xDFE, 	%hsys_tick_cmpr
	rdhpr	%hsys_tick_cmpr,	%i1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	fbg,a	%fcc0,	loop_922
	subccc	%i7,	0x1B99,	%i5
	ba,pn	%icc,	loop_923
	rdhpr	%hsys_tick_cmpr,	%l4
loop_922:
	rd	%fprs,	%i2
	sdivx	%l6,	0x113F,	%i4
loop_923:
	rd	%asi,	%g2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x009, 	%hsys_tick_cmpr
	tneg	%xcc,	0x6
	rd	%sys_tick_cmpr,	%l2
	mulx	%o1,	%o6,	%o2
	rdhpr	%htba,	%o4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xD9A, 	%hsys_tick_cmpr
	wrpr	%l5,	%g5,	%cwp
	fmovrdlz	%g7,	%f30,	%f18

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x364, 	%hsys_tick_cmpr
	movg	%icc,	%g3,	%o0
	rd	%ccr,	%l0
	ldsw	[%l7 + 0x54],	%i3
        wr    %g0,    0xe,    %pcr    ! changed.
	wrpr	%g6,	%l3,	%cwp
	rdpr	%pil,	%i7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	udivx	%i1,	0x04EA,	%i2
	movrlez	%l6,	0x1A6,	%i4
	rdpr	%tba,	%g2
	edge32	%l2,	%g4,	%o6
	fbu,a	%fcc2,	loop_924
	rdhpr	%hpstate,	%o2
	edge16n	%o4,	%l1,	%o1
	wrpr	%o5,	0x0A6B,	%pil
loop_924:
	sll	%o7,	0x1D,	%l5
	wr	%i0,	%g7,	%ccr
	orncc	%g1,	0x05F2,	%g5
	sdivcc	%g3,	0x03CC,	%o0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%htba,	%o3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%otherwin,	%i7
	pdist	%f30,	%f28,	%f12
	rd	%ccr,	%i5
	rdhpr	%hpstate,	%l4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x5F9, 	%tick_cmpr
	movcs	%xcc,	%i2,	%i4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xF68, 	%hsys_tick_cmpr
	brlz,a	%g2,	loop_925
	fbule	%fcc2,	loop_926
	rdhpr	%hsys_tick_cmpr,	%l2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_925:
	wrpr	%g4,	0x0FC9,	%cwp
loop_926:
	wrpr	%o6,	0x0AA3,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%y,	%o4
	addcc	%l1,	0x00E5,	%o1
	rdhpr	%htba,	%o5
	be,a	loop_927
	rdhpr	%hintp,	%l5
	fbul,a	%fcc3,	loop_928
	rdhpr	%hsys_tick_cmpr,	%o7
loop_927:
	bpos,a	%xcc,	loop_929
	srl	%g7,	%i0,	%g5
loop_928:
	addccc	%g3,	0x07D9,	%g1
        wr    %g0,    0xe,    %pcr    ! changed.
loop_929:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xF93, 	%hsys_tick_cmpr
	movrne	%i7,	%i5,	%g6
	movle	%icc,	%l3,	%i1
	rdpr	%cwp,	%l4
	wrpr	%i2,	0x0E2F,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	tvc	%xcc,	0x7
	tge	%icc,	0x7
	rdhpr	%hpstate,	%g2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	add	%l7,	0x08,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] %asi,	%l2,	%o6
	fmovsgu	%xcc,	%f21,	%f1
	rdpr	%tba,	%o2
	wr	%o4,	%o1,	%ccr
	rdhpr	%htba,	%l1
	fmovsneg	%icc,	%f18,	%f18
	fmovsvs	%xcc,	%f28,	%f11
	umul	%l5,	%o7,	%o5
	rdhpr	%hintp,	%g7
	wr	%i0,	%g3,	%y
	wrpr	%g5,	%l0,	%cwp
	rd	%y,	%g1
	fmovsgu	%icc,	%f9,	%f26
	fcmple32	%f12,	%f6,	%i6
	wrpr	%o0,	%o3,	%pil
	edge16n	%i3,	%i5,	%g6
	edge8	%i7,	%i1,	%l3
	fabss	%f19,	%f31
        wr    %g0,    0xe,    %pcr    ! changed.
	tl	%icc,	0x4
	rdhpr	%hpstate,	%i4
	std	%f26,	[%l7 + 0x50]
	wr	%l6,	0x008F,	%pic
	sdivcc	%l4,	0x1667,	%g2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	mulx	%o6,	0x09BC,	%o2
	udiv	%g4,	0x1698,	%o4
	wrpr	%l1,	0x0927,	%cwp
	rdhpr	%htba,	%o1
	edge32l	%o7,	%o5,	%g7
	wr	%l5,	%g3,	%sys_tick
	ldsw	[%l7 + 0x08],	%g5
	rd	%tick_cmpr,	%i0
	rd	%fprs,	%g1
	wr	%l0,	0x07A8,	%ccr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%hintp,	%o3
	wr	%i3,	%o0,	%sys_tick
	fandnot1s	%f4,	%f20,	%f26
	rd	%pc,	%g6
	wrpr	%i5,	0x0BDD,	%pil
	wrpr	%i1,	%i7,	%tick
	rdhpr	%hintp,	%i2
	rdpr	%cwp,	%i4
	wrpr	%l3,	%l6,	%tick
	rd	%asi,	%l4
	rdhpr	%hpstate,	%g2
	fmovsgu	%xcc,	%f10,	%f6
	wrpr	%o6,	%o2,	%tick
	array8	%l2,	%g4,	%l1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x5C2, 	%hsys_tick_cmpr
	rd	%tick_cmpr,	%o7
	ldsw	[%l7 + 0x78],	%g7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	rdpr	%pil,	%g5
	sdiv	%i0,	0x054E,	%l5
	orcc	%l0,	0x16A4,	%i6
	rdpr	%cleanwin,	%g1
	wrpr	%o3,	%i3,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x276, 	%tick_cmpr
	subc	%i5,	%g6,	%i7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	addcc	%i4,	0x1523,	%l3
	fmovdn	%xcc,	%f9,	%f26
	rdpr	%tl,	%l6
	movrgez	%i2,	0x151,	%l4
	sdiv	%g2,	0x13DC,	%o2
	wrpr	%l2,	%o6,	%cwp
	brgez,a	%g4,	loop_930
	wrpr	%o1,	%l1,	%pil
	rdhpr	%hintp,	%o4
	ldd	[%l7 + 0x68],	%g6
loop_930:
	rdhpr	%hsys_tick_cmpr,	%o7
	rdpr	%cwp,	%o5
	edge32n	%g3,	%i0,	%l5
	rd	%y,	%g5
	fmul8x16	%f4,	%f16,	%f6
	fpackfix	%f22,	%f13
	fpadd32s	%f2,	%f1,	%f9
	set	0x40, %o2
	ldda	[%l7 + %o2] 0x11,	%l0
	wr 	%g0, 	0x7, 	%fprs
	fxnors	%f27,	%f30,	%f19
	wr	%o3,	%o0,	%softint
	rdpr	%otherwin,	%i5
	wrpr	%i3,	0x183D,	%cwp
	wr	%g6,	%i7,	%sys_tick
	andcc	%i4,	0x05A6,	%l3
	edge8ln	%i1,	%i2,	%l4
	bvs	%xcc,	loop_931
	smulcc	%g2,	%l6,	%o2
	fexpand	%f9,	%f10

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_931:
	rd	%ccr,	%l2
	tvc	%xcc,	0x5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fmovsne	%xcc,	%f6,	%f24

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xB3A, 	%hsys_tick_cmpr
	or	%o7,	%o5,	%g3
	swap	[%l7 + 0x2C],	%o1
	rd	%asi,	%i0
	rdhpr	%hsys_tick_cmpr,	%g5
	rdpr	%cleanwin,	%l0
	edge8n	%l5,	%g1,	%o3
	fand	%f6,	%f2,	%f22
	or	%o0,	%i5,	%i6
	wrpr	%g6,	%i7,	%cwp
	fornot1s	%f27,	%f15,	%f29

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x5CD, 	%hsys_tick_cmpr
	set	0x10, %o4
	ldda	[%l7 + %o4] 0x89,	%l2
	xor	%i1,	0x0F86,	%i2
	rdhpr	%hsys_tick_cmpr,	%l4
	fmuld8ulx16	%f1,	%f15,	%f6
	movleu	%xcc,	%g2,	%l6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	edge8	%i3,	%l2,	%g4
	wrpr	%l1,	0x163A,	%tick
	rdpr	%canrestore,	%o6
        wr    %g0,    0xe,    %pcr    ! changed.
	mova	%icc,	%o7,	%o5
	sth	%g7,	[%l7 + 0x46]
	udivcc	%o1,	0x160D,	%i0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x11B, 	%hsys_tick_cmpr
	alignaddrl	%g3,	%l5,	%o3
	rdhpr	%hintp,	%o0
	tne	%icc,	0x2
	rdpr	%wstate,	%i5
	rd	%ccr,	%g1
	for	%f2,	%f8,	%f12
	fpsub16	%f26,	%f2,	%f22
	wr	%g0,	0x81,	%asi
	prefetcha	[%l7 + 0x78] %asi,	 0x1
	rd	%ccr,	%i6
	rd	%softint,	%i7
	wrpr	%l3,	%i4,	%pil
	std	%i2,	[%l7 + 0x78]
	set	0x48, %o0
	ldswa	[%l7 + %o0] 0x80,	%l4
	movl	%xcc,	%g2,	%l6
	tsubcc	%o2,	0x0CD0,	%i1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x840, 	%tick_cmpr
	stb	%l1,	[%l7 + 0x4B]
	tn	%xcc,	0x1
	rd	%pc,	%i3
	edge16l	%o4,	%o7,	%o6
	fbuge	%fcc2,	loop_932
	wr	%g7,	%o1,	%ccr
	edge16l	%i0,	%g5,	%o5
	fcmpeq32	%f14,	%f18,	%l0
loop_932:
	array8	%l5,	%g3,	%o3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x3F4, 	%hsys_tick_cmpr
	set	0x40, %i1
	stda	%f16,	[%l7 + %i1] 0xc2
	wrpr	%g6,	0x1874,	%tick
	wrpr	%o0,	0x153F,	%pil
	wrpr	%i6,	0x1D8D,	%pil
	rdhpr	%hpstate,	%l3
	wr	%i7,	%i2,	%pic

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	nop
	setx	loop_933,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	wrpr	%l4,	%o2,	%cwp
	xnorcc	%i1,	%l6,	%l2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xD59, 	%hsys_tick_cmpr
loop_933:
	rdpr	%gl,	%l1
	subcc	%i3,	%o4,	%o7
	bg,pt	%xcc,	loop_934
	umul	%o6,	0x0C2B,	%o1
	wrpr	%i0,	%g7,	%tick
	ta	%xcc,	0x3
loop_934:
	rdhpr	%hsys_tick_cmpr,	%g5
	mova	%icc,	%l0,	%l5
	rdpr	%cwp,	%g3
	bcc,a,pt	%xcc,	loop_935
	srlx	%o3,	%o5,	%i5
	rdhpr	%hintp,	%g1
	wr 	%g0, 	0x6, 	%fprs
loop_935:
	subc	%i6,	0x146D,	%l3
	set	0x0C, %l0
	lduwa	[%l7 + %l0] 0x81,	%i7
	wrpr	%i2,	0x015C,	%cwp
	udivcc	%i4,	0x1C9A,	%g2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xD6E, 	%hsys_tick_cmpr
	wr	%o2,	%g6,	%set_softint
	popc	%i1,	%l2
	tvc	%xcc,	0x6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	bgu,pn	%icc,	loop_936
	movgu	%xcc,	%i3,	%g4
	wrpr	%o7,	%o6,	%pil
	rdhpr	%hpstate,	%o4
loop_936:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%pil,	%g5
	be,pn	%icc,	loop_937
	xnorcc	%o1,	%l5,	%l0
	wr	%g3,	%o5,	%set_softint
	rd	%fprs,	%o3
loop_937:
	te	%xcc,	0x5
	rd	%pc,	%i5
	fmovsvc	%icc,	%f3,	%f2
	wr	%g1,	0x093E,	%softint
	sir	0x0678
	rdpr	%tba,	%i6
	wr 	%g0, 	0x5, 	%fprs
	wr	%i7,	0x0B33,	%set_softint
	wrpr	%i2,	%l3,	%tick
	brgz	%g2,	loop_938
	wr	%l4,	0x17BE,	%softint
	rd	%tick_cmpr,	%i4
	rdpr	%cleanwin,	%g6
loop_938:
	wr	%i1,	%l2,	%pic
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	rd	%fprs,	%l6
	movgu	%icc,	%l1,	%i3
	rdpr	%cwp,	%g4
	fmovsgu	%icc,	%f17,	%f18
	rdpr	%cleanwin,	%o2
	subcc	%o7,	%o4,	%i0
	movcs	%icc,	%o6,	%g5
	rdhpr	%hsys_tick_cmpr,	%o1
	addc	%g7,	%l5,	%g3
	rdhpr	%hsys_tick_cmpr,	%o5
	movge	%xcc,	%o3,	%i5
	wrpr	%l0,	0x1301,	%pil
	rd	%softint,	%i6
	smul	%g1,	0x1309,	%o0
	fmovdcs	%icc,	%f24,	%f26

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%cleanwin,	%g2
	wrpr	%l4,	%i4,	%pil
	rdpr	%cwp,	%i2
	wrpr	%g6,	%i1,	%tick
	fmovdl	%icc,	%f7,	%f31
	fmovdcc	%icc,	%f3,	%f28
	wr	%l2,	%l6,	%pic
	lduw	[%l7 + 0x2C],	%l1
	mulx	%i3,	0x0588,	%o2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x700, 	%hsys_tick_cmpr
	fmovsvc	%icc,	%f9,	%f25
	smulcc	%g4,	0x021B,	%i0
	rdhpr	%htba,	%o6
	edge32n	%g5,	%o1,	%l5
	rdpr	%canrestore,	%g3
	rdhpr	%htba,	%o5
	rd	%pc,	%g7
	edge32ln	%o3,	%l0,	%i5
	rd	%ccr,	%i6
	movvc	%icc,	%o0,	%i7
	rdpr	%tba,	%g1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x661, 	%sys_tick_cmpr
	wrpr	%l3,	%i4,	%tick
	wrpr	%g6,	%i1,	%tick
	rdhpr	%htba,	%i2
	fone	%f6
	wrpr	%l6,	0x0A44,	%cwp
	sir	0x18FF
	rdhpr	%htba,	%l2
	wr	%i3,	%l1,	%pic

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	wr	%o2,	0x0F3D,	%ccr
	fandnot2s	%f20,	%f21,	%f7
	rdpr	%cwp,	%o4
	wr	%g4,	0x173B,	%softint
	rd	%ccr,	%o6
	rdhpr	%hintp,	%i0
	rd	%tick_cmpr,	%g5
	sll	%o1,	0x15,	%l5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x704, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x779, 	%hsys_tick_cmpr
	rdpr	%pil,	%l0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x4B0, 	%hsys_tick_cmpr
	wrpr	%i5,	%i6,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	tsubcc	%g1,	%g2,	%i7
	xor	%l3,	%l4,	%i4
	te	%icc,	0x5
	ta	%icc,	0x0
	wr	%i1,	%i2,	%set_softint

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x887, 	%hsys_tick_cmpr
	fmovdvs	%icc,	%f1,	%f30
        wr    %g0,    0xe,    %pcr    ! changed.
	wrpr	%o7,	0x1ABB,	%tick
	rd	%sys_tick_cmpr,	%o2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%l1,	%i0,	%y

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x359, 	%sys_tick_cmpr
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x4EE, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	srl	%o3,	0x1A,	%l0
	movcc	%icc,	%g3,	%g7
	movgu	%xcc,	%i6,	%i5
	fmovsvc	%xcc,	%f20,	%f1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xACE, 	%hsys_tick_cmpr
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wrpr	%o0,	%i7,	%tick
	rd	%fprs,	%l3
	fmovdcs	%icc,	%f17,	%f21
	fbl	%fcc0,	loop_939
	udivcc	%l4,	0x1632,	%g2
	set	0x44, %i3
	swapa	[%l7 + %i3] 0x81,	%i4
loop_939:
	fbuge,a	%fcc0,	loop_940
	fmovse	%icc,	%f31,	%f31
	rdhpr	%hintp,	%i1
	fabss	%f5,	%f6
loop_940:
	fabss	%f24,	%f20
	orncc	%i2,	0x0294,	%l6
	wr 	%g0, 	0x4, 	%fprs
	call	loop_941
	fmovrdgz	%l2,	%f24,	%f16
	rd	%ccr,	%o7
	movge	%icc,	%i3,	%o2
loop_941:
	wrpr	%g4,	%l1,	%tick
	rd	%pc,	%o4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	wrpr	%o6,	0x15A5,	%cwp
	tcc	%icc,	0x2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x702, 	%hsys_tick_cmpr
	rd	%ccr,	%o5
	rd	%tick_cmpr,	%o1
	movvs	%icc,	%l5,	%o3
	wrpr	%g3,	%g7,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x4F1, 	%hsys_tick_cmpr
	rdpr	%cansave,	%i5
	fandnot1s	%f14,	%f3,	%f9

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xC37, 	%hsys_tick_cmpr
	wrpr	%g1,	%o0,	%pil
	rdhpr	%hintp,	%l3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	movge	%icc,	%i7,	%i4
	wr	%i1,	0x1EB2,	%ccr
	rdpr	%gl,	%g2
	rdpr	%cleanwin,	%l6
	rdpr	%cansave,	%g6
	fone	%f24
	rdpr	%cansave,	%i2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%hsys_tick_cmpr,	%o7
	mova	%xcc,	%o2,	%g4
	umulcc	%o4,	%i0,	%l1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xA2B, 	%hsys_tick_cmpr
	rd	%tick_cmpr,	%o1
	rdhpr	%hpstate,	%l5
	rdhpr	%hsys_tick_cmpr,	%o3
	rd	%pc,	%o6
	rd	%softint,	%g3
	udivx	%i6,	0x05DF,	%i5
	wr	%g7,	0x0232,	%set_softint
	wrpr	%l0,	%o0,	%tick
	rd	%asi,	%l3
	ldx	[%l7 + 0x08],	%g1
	wr	%l4,	0x1CDB,	%softint
	rdhpr	%hintp,	%i4
	rd	%softint,	%i1
	edge16l	%i7,	%l6,	%g6
	movrne	%g2,	0x1DC,	%l2
	fbo	%fcc1,	loop_942
	rdhpr	%hsys_tick_cmpr,	%i2
	wrpr	%i3,	0x0122,	%cwp
	rdpr	%pil,	%o7
loop_942:
	fmovsle	%xcc,	%f3,	%f13
	wrpr	%o2,	%g4,	%cwp
	rdpr	%cansave,	%o4
	movge	%xcc,	%l1,	%g5
	fmovde	%icc,	%f27,	%f21
        wr    %g0,    0xe,    %pcr    ! changed.
	stbar
	rdpr	%canrestore,	%o1
	rdhpr	%hintp,	%i0
	rdhpr	%hintp,	%l5
	rd	%softint,	%o3
	rdpr	%pil,	%g3
	wr	%g0,	0x18,	%asi
	ldswa	[%l7 + 0x68] %asi,	%o6
	movge	%xcc,	%i5,	%i6
	fpadd32	%f2,	%f4,	%f30
	rdpr	%cansave,	%g7
	rdhpr	%hintp,	%o0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	ld	[%l7 + 0x4C],	%f30
	wrpr	%l3,	%g1,	%tick
	srax	%l4,	0x14,	%i4
	wr 	%g0, 	0x7, 	%fprs
	and	%g6,	%g2,	%l2
	alignaddr	%i7,	%i2,	%i3
	set	0x54, %g1
	swapa	[%l7 + %g1] 0x88,	%o7
	wr	%g4,	0x1101,	%set_softint
	rdhpr	%hpstate,	%o4
	wr	%g0,	0x80,	%asi
	lduba	[%l7 + 0x75] %asi,	%o2
	fbge,a	%fcc1,	loop_943
	nop
	setx	loop_944,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	addccc	%g5,	0x0BD9,	%o5
	edge32l	%o1,	%l1,	%l5
loop_943:
	wrpr	%o3,	0x1D18,	%pil
loop_944:
	movcc	%xcc,	%i0,	%o6
	wrpr	%g3,	%i6,	%tick
	rdhpr	%hpstate,	%g7
	wrpr	%i5,	0x0D8E,	%tick
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	rdhpr	%hpstate,	%o0
	sethi	0x06BD,	%l3
	rd	%asi,	%l0
	wrpr	%g1,	0x17DB,	%cwp
	ta	%icc,	0x1
	subc	%l4,	%i4,	%i1
	rdhpr	%hintp,	%l6
	rdhpr	%hintp,	%g6
        wr    %g0,    0xe,    %pcr    ! changed.
	srlx	%i2,	%i3,	%o7
	brnz,a	%g4,	loop_945
	rd	%fprs,	%o4
	rdpr	%pil,	%i7
	wrpr	%o2,	0x0456,	%cwp
loop_945:
	rdhpr	%hintp,	%o5
	wr	%o1,	%l1,	%set_softint
	set	0x18, %g6
	swapa	[%l7 + %g6] 0x88,	%l5
	rd	%asi,	%o3
	rd	%pc,	%i0
	xnorcc	%g5,	0x0EB4,	%g3
	movre	%i6,	%g7,	%o6
	wr 	%g0, 	0x4, 	%fprs
	bge,pt	%xcc,	loop_946
	rd	%ccr,	%l0
	wr	%g0,	0x10,	%asi
	sta	%f22,	[%l7 + 0x28] %asi
loop_946:
	fmovdgu	%icc,	%f11,	%f22

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x7E0, 	%hsys_tick_cmpr
	edge16n	%l4,	%i1,	%l6
	rdhpr	%hpstate,	%i4
	movrgz	%g6,	%g2,	%i2
	rd	%tick_cmpr,	%i3
	edge32n	%o7,	%g4,	%o4
	ble	%icc,	loop_947
	fpsub32s	%f27,	%f17,	%f10
	rdhpr	%htba,	%i7
	wr	%l2,	0x1721,	%clear_softint
loop_947:
	rdpr	%pil,	%o5
	fbuge	%fcc2,	loop_948
	rd	%pc,	%o1
	fmovdgu	%xcc,	%f3,	%f29
	fba	%fcc3,	loop_949
loop_948:
	movcc	%xcc,	%l1,	%o2
	wrpr	%o3,	%l5,	%tick
	rd	%y,	%i0
loop_949:
	mulscc	%g3,	0x16B7,	%g5
	pdist	%f14,	%f2,	%f14

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	ble,a	%xcc,	loop_950
	brgz	%i5,	loop_951
	wr 	%g0, 	0x4, 	%fprs
	edge16l	%l0,	%o0,	%g1
loop_950:
	wr	%l4,	%l6,	%y
loop_951:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x232, 	%tick_cmpr
	rdhpr	%hsys_tick_cmpr,	%i1
	wrpr	%g2,	%g6,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%g4,	0x0D72,	%tick
	rdhpr	%hpstate,	%o7
	fmovrsgez	%i7,	%f24,	%f27
	add	%l7,	0x60,	%l6
	wr	%g0,	0x18,	%asi
	casxa	[%l6] %asi,	%o4,	%l2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	edge32l	%l1,	%o2,	%o5
	wrpr	%o3,	0x0CCE,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xB74, 	%hsys_tick_cmpr
	movcc	%icc,	%l5,	%g5
	edge16ln	%g7,	%i6,	%i5
	udivx	%o6,	0x0E7F,	%l0
	edge16l	%o0,	%l3,	%l4
	sub	%g1,	0x12F2,	%l6
	sdivx	%i4,	0x1F47,	%i1
	wr	%g0,	0x0c,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	movne	%icc,	%g2,	%g6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x9A0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%i7,	%o4,	%cwp
	rdhpr	%htba,	%l2
	wrpr	%o1,	0x1D00,	%cwp
	wr	%o7,	%o2,	%softint
	edge16	%o5,	%o3,	%l1
	rdhpr	%hpstate,	%i0
	wrpr	%g3,	%l5,	%tick
	umulcc	%g5,	0x00D0,	%g7
	tge	%icc,	0x2
	wrpr	%i5,	%o6,	%cwp
	array8	%l0,	%i6,	%o0
	tcs	%xcc,	0x3
	orcc	%l4,	%l3,	%l6
	rd	%ccr,	%g1
	rdhpr	%htba,	%i4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%i3,	%g4,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x141, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%asi,	%g2
	wrpr	%o1,	0x156E,	%cwp
	std	%f16,	[%l7 + 0x40]

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	bvs	%icc,	loop_952
	umulcc	%o3,	%o2,	%l1
	wr	%i0,	%l5,	%clear_softint
	fble,a	%fcc0,	loop_953
loop_952:
	rd	%asi,	%g5
	fmovdle	%icc,	%f31,	%f30
	bvs,a	%xcc,	loop_954
loop_953:
	rdpr	%cleanwin,	%g3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x648, 	%hsys_tick_cmpr
	wrpr	%g7,	0x03CB,	%tick
loop_954:
	rd	%softint,	%o6
	rdhpr	%hpstate,	%i6
	rdhpr	%hintp,	%o0
	rdhpr	%hsys_tick_cmpr,	%l0
	rd	%pc,	%l3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	addcc	%g1,	0x0B11,	%i1
	edge16n	%g6,	%i4,	%g4
	wrpr	%i2,	0x1944,	%cwp
	ldd	[%l7 + 0x48],	%i2
	wrpr	%o4,	%l2,	%pil
	rdpr	%tl,	%g2
	rd	%ccr,	%i7
	addcc	%o7,	%o1,	%o5
	rdpr	%tl,	%o3
	edge32n	%o2,	%l1,	%i0
	rdpr	%canrestore,	%g5
	rdhpr	%htba,	%g3
	fpsub16	%f8,	%f24,	%f30
	wr	%i5,	0x153F,	%sys_tick
	fmovde	%xcc,	%f17,	%f14
	rdhpr	%htba,	%g7
	bl,a	%icc,	loop_955
        wr    %g0,    0xe,    %pcr    ! changed.
	tvc	%icc,	0x3
	sir	0x1277
loop_955:
	rdhpr	%hpstate,	%o0
	umulcc	%i6,	%l0,	%l6
	srl	%l3,	0x1D,	%g1
	rd	%y,	%l4
	rd	%ccr,	%g6
	subcc	%i4,	%g4,	%i2
	orncc	%i3,	0x08F0,	%i1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wrpr	%o4,	%l2,	%pil
	wrpr	%g2,	0x1240,	%cwp
	sll	%o7,	0x0E,	%i7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldd	[%l7 + 0x60],	%o0
	rd	%tick_cmpr,	%o3
	rdpr	%wstate,	%o2
	addcc	%l1,	%i0,	%g5
	wr 	%g0, 	0x7, 	%fprs
	tne	%icc,	0x7
	rd	%fprs,	%g7
	wr	%l5,	0x1A93,	%set_softint
	wr	%o6,	%o0,	%sys_tick
	movvc	%xcc,	%i6,	%g3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	set	0x30, %i2
	stda	%i6,	[%l7 + %i2] 0x2a
	membar	#Sync
	rd	%softint,	%g1
	rdhpr	%htba,	%l4
	wrpr	%g6,	%i4,	%tick
	tle	%icc,	0x2
	wrpr	%g4,	0x0B36,	%tick
	rd	%fprs,	%i2
	fands	%f14,	%f3,	%f0
	rdpr	%cwp,	%l3
	for	%f12,	%f6,	%f30

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x199, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xE77, 	%hsys_tick_cmpr
	rd	%softint,	%l2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xD28, 	%hsys_tick_cmpr
	rdpr	%pil,	%i7
	wrpr	%g2,	0x0D53,	%pil
	rd	%tick_cmpr,	%o1
	rdpr	%cwp,	%o3
	bn,pn	%icc,	loop_956
	rd	%tick_cmpr,	%o2
	movrgz	%i0,	%l1,	%o5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xC18, 	%hsys_tick_cmpr
loop_956:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%canrestore,	%o0
	wr	%o6,	0x004A,	%clear_softint
	nop
	setx	loop_957,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	rdhpr	%hpstate,	%g3
	wrpr	%i6,	%l6,	%cwp
	movrlez	%g1,	%l0,	%g6
loop_957:
	umul	%l4,	0x1DBD,	%i4
	sethi	0x00EB,	%g4
	fmovde	%icc,	%f12,	%f3
	set	0x4C, %i4
	sta	%f23,	[%l7 + %i4] 0x19

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	tg	%xcc,	0x1
	sdiv	%o4,	0x0C4F,	%l3
	nop
	setx loop_958, %l0, %l1
	jmpl %l1, %i1
	wrpr	%o7,	%i7,	%pil
	xor	%l2,	%g2,	%o3
	rdhpr	%hsys_tick_cmpr,	%o2
loop_958:
	rdhpr	%hpstate,	%i0
	rdhpr	%hsys_tick_cmpr,	%o1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	edge16	%g5,	%l1,	%g7
	rd	%fprs,	%i5
	movl	%icc,	%o0,	%o6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%hsys_tick_cmpr,	%l6
	udivx	%g1,	0x0124,	%l0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x6E6, 	%hsys_tick_cmpr
	rd	%y,	%l4
	fcmple32	%f18,	%f14,	%i4
	wr	%i2,	%g4,	%softint
	rdhpr	%htba,	%i3
	sdivx	%o4,	0x0E1E,	%l3
	wr	%o7,	%i7,	%clear_softint
	wr	%g0,	0x11,	%asi
	stda	%l2,	[%l7 + 0x70] %asi
	wrpr	%g2,	0x1260,	%pil
	movcs	%icc,	%o3,	%o2
	rdhpr	%htba,	%i1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	set	0x7E, %l4
	ldsha	[%l7 + %l4] 0x15,	%g5
	add	%o5,	0x1217,	%l1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x1FC, 	%hsys_tick_cmpr
	array32	%o6,	%g3,	%i6
	siam	0x7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xD72, 	%hsys_tick_cmpr
	rdpr	%otherwin,	%g1
	rd	%ccr,	%l0
	udivcc	%g6,	0x1243,	%l5
	rdpr	%cwp,	%l4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xFAE, 	%tick_cmpr
	tneg	%icc,	0x0
	fmovdvs	%xcc,	%f2,	%f9
	bcc,pt	%xcc,	loop_959
	udivcc	%i3,	0x13D2,	%i4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xB4F, 	%hsys_tick_cmpr
loop_959:
	fcmpd	%fcc1,	%f0,	%f6
	wrpr	%l3,	%l2,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	rdhpr	%hpstate,	%g2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%htba,	%i0
	wrpr	%g5,	0x16CF,	%cwp
	wrpr	%o1,	%l1,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%canrestore,	%o6
	tge	%xcc,	0x0
	edge32ln	%i5,	%g3,	%i6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x57B, 	%hsys_tick_cmpr
	fbo	%fcc3,	loop_960
	rdpr	%cleanwin,	%l0
	rdhpr	%hpstate,	%g1
	rdpr	%wstate,	%g6
loop_960:
	xor	%l5,	%l4,	%g4
	set	0x50, %l5
	ldda	[%l7 + %l5] 0xea,	%i2
	rdpr	%otherwin,	%i4
	movvc	%xcc,	%i3,	%o7
	wrpr	%l3,	0x0E75,	%cwp
	ldsb	[%l7 + 0x34],	%o4
	set	0x28, %i6
	swapa	[%l7 + %i6] 0x19,	%l2
	fmovdpos	%icc,	%f24,	%f18
	tn	%xcc,	0x1
	wrpr	%o3,	0x1C07,	%tick
	rdpr	%cleanwin,	%i7
	rdpr	%tl,	%o2
	rd	%y,	%i1
	wr	%g2,	0x0088,	%sys_tick
	fmul8x16au	%f6,	%f31,	%f10

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	wr 	%g0, 	0x7, 	%fprs
	wr 	%g0, 	0x4, 	%fprs
	rdpr	%cwp,	%g7
	rdhpr	%htba,	%o6
	taddcc	%o5,	%g3,	%i5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fbule	%fcc3,	loop_961
	tsubcc	%i6,	0x0FBA,	%o0
	wrpr	%g1,	%g6,	%tick
	fmovdne	%icc,	%f5,	%f18
loop_961:
	tgu	%icc,	0x6
	wrpr	%l0,	%l4,	%cwp
	wr 	%g0, 	0x5, 	%fprs
	rdhpr	%hintp,	%g4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x456, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%l3,	%o4,	%pil
	wr	%l2,	%o3,	%ccr
	wrpr	%o7,	%o2,	%tick
	rd	%y,	%i7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xBA1, 	%hsys_tick_cmpr
	wr	%o1,	%g5,	%softint
	wrpr	%i0,	0x1B60,	%pil
	rdhpr	%hpstate,	%l1
	wr 	%g0, 	0x7, 	%fprs
	fxnor	%f12,	%f30,	%f26
	sdivx	%g7,	0x0C24,	%o5
	movrlez	%g3,	0x3C8,	%l6
	wrpr	%i5,	0x06CD,	%cwp
	and	%i6,	0x03E3,	%g1
	wrpr	%o0,	%g6,	%pil
	wrpr	%l0,	0x0851,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x977, 	%hsys_tick_cmpr
	orcc	%l4,	0x0AFD,	%i4
	brz	%i3,	loop_962
	te	%icc,	0x0
	fmuld8sux16	%f9,	%f6,	%f30
	ta	%xcc,	0x1
loop_962:
	rdpr	%gl,	%g4
	rd	%y,	%i2
	wrpr	%o4,	0x0AF9,	%cwp
	wrpr	%l3,	%l2,	%pil
	wrpr	%o3,	%o7,	%pil
	rdhpr	%hsys_tick_cmpr,	%o2
	te	%icc,	0x7
	wr	%g2,	%i7,	%ccr
	rdpr	%pil,	%i1
	fpsub16s	%f7,	%f9,	%f14
	nop
	setx	loop_963,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	wr	%o1,	0x12A2,	%set_softint
	rd	%ccr,	%g5
	wr	%g0,	0x81,	%asi
	stda	%i0,	[%l7 + 0x60] %asi
loop_963:
	popc	%o6,	%g7
	rd	%softint,	%o5
	wrpr	%g3,	0x0BED,	%pil
	movne	%xcc,	%l1,	%i5
	tg	%xcc,	0x2
	fmovrsgez	%i6,	%f15,	%f2
	sir	0x10A8
	brgez	%l6,	loop_964
	wr	%o0,	%g6,	%set_softint
	rd	%y,	%l0
	wrpr	%l5,	0x15EB,	%cwp
loop_964:
	mulx	%l4,	%g1,	%i4
	rd	%tick_cmpr,	%i3
	movneg	%xcc,	%i2,	%g4
	tge	%xcc,	0x5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	addccc	%o4,	0x1FAC,	%o3
	taddcc	%o2,	0x1819,	%g2
	tgu	%xcc,	0x6
	fnegs	%f8,	%f1
	rdpr	%wstate,	%i7
	fmovrde	%i1,	%f20,	%f2
	rdpr	%pil,	%o7
	edge16l	%o1,	%g5,	%o6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x69B, 	%hsys_tick_cmpr
	fpsub16s	%f30,	%f26,	%f17
	rdpr	%cwp,	%o5
	fandnot2	%f28,	%f8,	%f24
	subc	%g3,	0x03F5,	%g7
	and	%l1,	%i6,	%i5
	rd	%fprs,	%o0
	move	%icc,	%l6,	%l0
	xnorcc	%g6,	0x1558,	%l4
	lduw	[%l7 + 0x54],	%g1
	rdpr	%cwp,	%i4
	fmovrsgez	%i3,	%f19,	%f6
	brgez	%l5,	loop_965
	wr	%g4,	%i2,	%set_softint
	edge8n	%l3,	%l2,	%o4
	sub	%o3,	0x0F48,	%g2
loop_965:
	rdhpr	%hintp,	%i7
	wrpr	%i1,	0x1FB8,	%pil
	rdpr	%tba,	%o7
	movrgz	%o2,	0x0BA,	%o1
	rd	%y,	%o6
	wrpr	%i0,	0x19DF,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x180, 	%hsys_tick_cmpr
	rd	%y,	%g7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x7DA, 	%tick_cmpr
	wrpr	%i5,	0x0D42,	%tick
	fmul8sux16	%f16,	%f10,	%f26
	bg,a	loop_966
	popc	0x0CCA,	%o0
	rdpr	%cansave,	%g3
	nop
	set	0x22, %l3
	ldsh	[%l7 + %l3],	%l0
loop_966:
	stbar
	wrpr	%g6,	%l6,	%cwp
	fpadd16	%f26,	%f8,	%f8
	andcc	%l4,	%g1,	%i3
	rdhpr	%htba,	%i4
	wr 	%g0, 	0x4, 	%fprs
	addcc	%i2,	0x05BC,	%g4
	fzeros	%f12
	rd	%pc,	%l2
	fbu	%fcc2,	loop_967
	fmovdcs	%xcc,	%f23,	%f21

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x106, 	%hsys_tick_cmpr
	rdpr	%cleanwin,	%l3
loop_967:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	rdpr	%tl,	%i7
	smul	%g2,	%i1,	%o2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	swap	[%l7 + 0x0C],	%o6
	rdhpr	%hintp,	%i0
	rdpr	%pil,	%o5
	bvc,a,pt	%icc,	loop_968
	fcmpd	%fcc1,	%f12,	%f12

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xDDD, 	%hsys_tick_cmpr
	rd	%pc,	%g7
loop_968:
	srlx	%l1,	0x19,	%o1
	addccc	%i5,	%i6,	%g3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xC1E, 	%tick_cmpr
	rdhpr	%htba,	%g6
	wrpr	%o0,	0x0B59,	%pil
	wrpr	%l4,	%g1,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x05A, 	%hsys_tick_cmpr
	wrpr	%i4,	0x15E2,	%cwp
	movrlz	%l5,	%i2,	%g4
	wr	%l6,	0x1314,	%softint
	fbe,a	%fcc2,	loop_969
	wr	%o4,	%l2,	%clear_softint
	rdpr	%pil,	%o3
	alignaddr	%l3,	%g2,	%i7
loop_969:
	wrpr	%i1,	%o7,	%pil
	rdpr	%cansave,	%o6
	fmovsge	%xcc,	%f13,	%f26
	fcmpeq16	%f22,	%f0,	%o2
	movcs	%icc,	%i0,	%o5
	call	loop_970
	ldd	[%l7 + 0x48],	%g4
	fmovsa	%xcc,	%f28,	%f25
	bg,pn	%xcc,	loop_971
loop_970:
	brgez,a	%l1,	loop_972
	edge32ln	%o1,	%g7,	%i5
	tg	%icc,	0x7
loop_971:
	fmovrsne	%i6,	%f27,	%f13
loop_972:
	rdpr	%cwp,	%l0
	ldsb	[%l7 + 0x21],	%g3
	ba,a,pn	%xcc,	loop_973
	wrpr	%o0,	0x1E0F,	%cwp
	tneg	%xcc,	0x3
	wrpr	%l4,	0x0EBC,	%tick
loop_973:
	rdhpr	%hpstate,	%g6
	wrpr	%g1,	%i4,	%cwp
	rdpr	%tba,	%i3
	wrpr	%i2,	0x01D6,	%tick
	rdhpr	%hpstate,	%l5
	rdpr	%wstate,	%g4
	bleu,pn	%xcc,	loop_974
	fmovrdne	%l6,	%f28,	%f10
	taddcctv	%o4,	0x1C63,	%l2
	rdhpr	%hpstate,	%o3
loop_974:
	nop
	add	%l7,	0x64,	%l6
	wr	%g0,	0x0c,	%asi
	casa	[%l6] %asi,	%g2,	%l3
	add	%i7,	%i1,	%o6
	rdhpr	%htba,	%o7
	tge	%xcc,	0x5
	brlz	%i0,	loop_975
	te	%xcc,	0x3
	fmovrdne	%o2,	%f0,	%f16

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x699, 	%hsys_tick_cmpr
loop_975:
	addc	%g5,	%l1,	%o1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fmul8ulx16	%f8,	%f2,	%f2
	add	%l7,	0x70,	%l6
	wr	%g0,	0x19,	%asi
	lda	[%l6] %asi,	%i6
	casa	[%l6] %asi,	%i6,	%g3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%hpstate,	%g6
	tcs	%xcc,	0x5
	sll	%l4,	%i4,	%i3
	wrpr	%g1,	0x0190,	%pil
	subcc	%l5,	%i2,	%l6
	taddcctv	%g4,	0x1521,	%l2
	rd	%y,	%o4
	subcc	%g2,	%o3,	%l3
	rdhpr	%htba,	%i1
	rdpr	%cleanwin,	%o6
	rdhpr	%htba,	%o7
        wr    %g0,    0xe,    %pcr    ! changed.
	wr	%i0,	0x1602,	%sys_tick
	fxnors	%f30,	%f6,	%f18
	wr	%o5,	0x06F1,	%pic
	rd	%sys_tick_cmpr,	%g5
	subccc	%l1,	%o1,	%g7
	subccc	%i6,	%i5,	%g3
	movcc	%icc,	%l0,	%g6
	addccc	%o0,	0x071F,	%l4
	udivcc	%i4,	0x15FF,	%i3
	rdpr	%gl,	%l5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	movgu	%icc,	%g1,	%l6
	fpackfix	%f16,	%f24
	fnor	%f14,	%f14,	%f12
	movvs	%icc,	%g4,	%l2
	wr	%g2,	0x00B2,	%pic

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x66C, 	%hsys_tick_cmpr
	std	%f26,	[%l7 + 0x40]
	tsubcctv	%l3,	%i1,	%o3
	edge8n	%o7,	%i7,	%o6
	rdhpr	%hsys_tick_cmpr,	%o2
	rdhpr	%hsys_tick_cmpr,	%i0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%canrestore,	%g5
	rd	%asi,	%g7
	fmovsneg	%xcc,	%f13,	%f24
	fmovdcs	%xcc,	%f7,	%f24
	rd	%y,	%i6
	wr	%i5,	%g3,	%y

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x4E2, 	%hsys_tick_cmpr
	movg	%xcc,	%o1,	%o0
	rd	%pc,	%g6
	rdhpr	%htba,	%l4
	edge8l	%i4,	%i3,	%l5
	rd	%pc,	%i2
	rdpr	%canrestore,	%l6
	rdpr	%cwp,	%g4
	rd	%asi,	%l2
	rdpr	%tba,	%g1
	wr	%o4,	0x0086,	%y
	xor	%g2,	%l3,	%o3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x56D, 	%hsys_tick_cmpr
	wrpr	%o6,	0x06F9,	%cwp
	wr	%g0,	0x80,	%asi
	lduba	[%l7 + 0x7B] %asi,	%i1
	movge	%xcc,	%o2,	%o5
	wr	%l1,	%i0,	%set_softint
	wrpr	%g5,	0x15FE,	%tick
	set	0x4D, %o3
	ldsba	[%l7 + %o3] 0x11,	%g7
	tcs	%xcc,	0x5
	rd	%sys_tick_cmpr,	%i5
	rd	%y,	%i6
	rdhpr	%hpstate,	%l0
	rdhpr	%hintp,	%g3
	prefetch	[%l7 + 0x48],	 0x0
	wrpr	%o0,	%g6,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fbge,a	%fcc1,	loop_976
	rdpr	%tba,	%i3
	addc	%l5,	%i2,	%o1
	rdpr	%canrestore,	%l6
loop_976:
	fmovdvc	%xcc,	%f9,	%f1
	wr	%g4,	%g1,	%set_softint
	andncc	%o4,	%g2,	%l3
	rdpr	%pil,	%l2
	xorcc	%o7,	%o3,	%o6
	rdpr	%tl,	%i7
	wr	%o2,	0x15B5,	%softint

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fornot1	%f18,	%f6,	%f24
	movrne	%i0,	0x0ED,	%g5
	rd	%softint,	%g7
	rdhpr	%htba,	%i5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x4C6, 	%hsys_tick_cmpr
	fbl	%fcc0,	loop_977
	movcs	%xcc,	%l0,	%i6
	set	0x68, %o5
	prefetcha	[%l7 + %o5] 0x88,	 0x2
loop_977:
	tsubcctv	%g3,	0x1723,	%g6
	fpadd16	%f2,	%f16,	%f4
	fcmpd	%fcc0,	%f4,	%f12

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fnands	%f21,	%f17,	%f23
	andn	%i4,	%i3,	%l5
	movle	%icc,	%o1,	%i2
	tvc	%icc,	0x4
	tcs	%xcc,	0x2
	wr	%l6,	0x04E5,	%pic
	edge8n	%g4,	%g1,	%g2
	rdpr	%pil,	%o4
	be,a	%icc,	loop_978
	bcs	%xcc,	loop_979
	xnorcc	%l2,	0x12EB,	%l3
	rd	%y,	%o3
loop_978:
	xnor	%o6,	0x153B,	%o7
loop_979:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%y,	%o5
	wr	%i7,	0x0F27,	%y
	xnorcc	%i0,	%l1,	%g7
	rdhpr	%hintp,	%i5
	fcmpne16	%f4,	%f12,	%g5
	sdivcc	%i1,	0x1BD9,	%i6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xC40, 	%hsys_tick_cmpr
	fands	%f20,	%f28,	%f16
	nop
	setx	loop_980,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	wr	%o0,	0x0BE1,	%pic
	rdhpr	%hpstate,	%g6
	rdpr	%wstate,	%l4
loop_980:
	wr 	%g0, 	0x6, 	%fprs
	rdpr	%cleanwin,	%o1
	rdpr	%canrestore,	%i3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fbe,a	%fcc2,	loop_981
	brlez	%l6,	loop_982
	stbar
	rd	%asi,	%g1
loop_981:
	rdpr	%tba,	%o4
loop_982:
	rdpr	%cwp,	%l2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xBEA, 	%hsys_tick_cmpr
	wr	%o6,	0x055A,	%softint
	xor	%l3,	%o7,	%o2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	tpos	%xcc,	0x7
	andcc	%l1,	%i7,	%i5
	wrpr	%g7,	0x138E,	%tick
	rdhpr	%hpstate,	%i1
	bneg	%xcc,	loop_983
        wr    %g0,    0xe,    %pcr    ! changed.
	subc	%l0,	%g5,	%o0
	wr	%g3,	0x1EC3,	%ccr
loop_983:
	rdhpr	%htba,	%l4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x843, 	%hsys_tick_cmpr
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x18] %asi,	%l5
	wrpr	%g6,	%i3,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%l6,	%g4,	%clear_softint
	wrpr	%o4,	0x124E,	%pil
	array32	%l2,	%g1,	%g2
	sdiv	%o3,	0x1B1F,	%o6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%ccr,	%o7
	rdhpr	%hintp,	%o5
	tleu	%xcc,	0x0
	rdpr	%wstate,	%o2
	ble,a	%icc,	loop_984
	rd	%ccr,	%i0
	wrpr	%i7,	0x0FB5,	%cwp
	rdhpr	%hsys_tick_cmpr,	%i5
loop_984:
	wrpr	%l1,	%i1,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fpsub16	%f10,	%f14,	%f20

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x279, 	%hsys_tick_cmpr
	wr	%g7,	%o0,	%y
	tpos	%xcc,	0x3
	stbar
	fnors	%f3,	%f11,	%f7
	edge32n	%g3,	%g5,	%i4
	rdpr	%tba,	%l4
	wr	%g6,	0x1AB2,	%clear_softint
	wr	%g0,	0x04,	%asi
	ldsha	[%l7 + 0x18] %asi,	%i3
	fsrc1	%f16,	%f2
	smul	%l5,	0x199D,	%o1
	tle	%icc,	0x2
	rdpr	%canrestore,	%i2
	alignaddr	%g4,	%l6,	%l2
	rdpr	%otherwin,	%g1
	rdpr	%pil,	%o4
	wrpr	%g2,	0x07CF,	%pil
	ta	%icc,	0x2
	fcmpgt32	%f16,	%f22,	%o3
	rdhpr	%hsys_tick_cmpr,	%l3
	wr	%o6,	%o5,	%sys_tick
	wrpr	%o7,	%i0,	%cwp
	rd	%y,	%i7
	fbn	%fcc1,	loop_985
	rdhpr	%htba,	%i5
	add	%l1,	0x05B9,	%i1
	wr	%i6,	%l0,	%set_softint
loop_985:
	rdpr	%tl,	%g7
	rdpr	%otherwin,	%o2
	wr	%g0,	0x11,	%asi
	lda	[%l7 + 0x10] %asi,	%f20
	membar	0x45
	membar	0x58

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xAD9, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xE48, 	%hsys_tick_cmpr
	or	%i4,	%l4,	%g6
	rdhpr	%hintp,	%i3
	wrpr	%o1,	0x0061,	%tick
	rd	%asi,	%i2
	fpack32	%f22,	%f22,	%f2
	wr	%g4,	0x1FA4,	%sys_tick
	be,a,pt	%icc,	loop_986
	te	%icc,	0x7
	rdhpr	%htba,	%l5
	wr	%g0,	0xd2,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
loop_986:
	add	%l6,	%g1,	%o4
	st	%f15,	[%l7 + 0x78]
	fmovsvc	%xcc,	%f29,	%f14
	sir	0x01FA
	rdhpr	%htba,	%l2
	rdpr	%otherwin,	%g2
	tsubcc	%o3,	%l3,	%o5
	ld	[%l7 + 0x24],	%f19
	fabss	%f23,	%f9
	set	0x40, %l2
	stda	%f0,	[%l7 + %l2] 0xd3
	rd	%asi,	%o6
	array8	%o7,	%i7,	%i5
	swap	[%l7 + 0x50],	%i0
	ldstub	[%l7 + 0x0F],	%i1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	movvc	%xcc,	%i6,	%l0
	andncc	%o2,	%g3,	%g5
	mova	%icc,	%o0,	%g7
	wrpr	%i4,	0x0A2C,	%cwp
	rdpr	%wstate,	%l4
	tge	%xcc,	0x0
	rdhpr	%htba,	%i3
	wr	%o1,	0x19C8,	%y
	rd	%sys_tick_cmpr,	%g6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x92E, 	%hsys_tick_cmpr
	movcs	%xcc,	%l6,	%i2
	smulcc	%g1,	0x142D,	%l2
	wr	%o4,	0x1E58,	%softint
	be,a	%xcc,	loop_987
	wr	%o3,	%g2,	%pic
	rdhpr	%hsys_tick_cmpr,	%o5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xB62, 	%hsys_tick_cmpr
loop_987:
	addc	%i7,	%o7,	%i5
	wr	%i1,	%l1,	%sys_tick
	fpsub16s	%f4,	%f25,	%f8
	rd	%softint,	%i6
	wrpr	%i0,	%o2,	%cwp
	rdhpr	%hsys_tick_cmpr,	%g3
	movle	%xcc,	%g5,	%o0
	fmovs	%f18,	%f18

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xBAA, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x3FE, 	%hsys_tick_cmpr
	rdpr	%tba,	%o1
	rdpr	%gl,	%g6
	tge	%icc,	0x6
	rd	%y,	%g4
	wr	%i3,	0x170D,	%set_softint
	rdpr	%canrestore,	%l5
	rdhpr	%hintp,	%l6
	edge32n	%g1,	%l2,	%i2
	sdivcc	%o4,	0x01FD,	%g2
	fcmple32	%f16,	%f4,	%o3
	rdpr	%canrestore,	%l3
	rdpr	%tl,	%o5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x1E0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%l1,	%i6,	%pil
	fmovsvs	%icc,	%f24,	%f29
	brlez	%i0,	loop_988
	nop
	set	0x5A, %l1
	sth	%o7,	[%l7 + %l1]
	movl	%xcc,	%o2,	%g3
	rdpr	%canrestore,	%o0
loop_988:
	wrpr	%g5,	0x05E7,	%cwp
	fpadd32s	%f31,	%f15,	%f12
	mulscc	%g7,	%l0,	%l4
	rdpr	%gl,	%i4
	st	%f3,	[%l7 + 0x38]
	fpadd16	%f16,	%f24,	%f10
	smulcc	%g6,	0x0C37,	%g4
	subccc	%o1,	%l5,	%l6
	stbar
	rd	%sys_tick_cmpr,	%g1
	rdhpr	%hsys_tick_cmpr,	%l2
	rdhpr	%hsys_tick_cmpr,	%i2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x535, 	%hsys_tick_cmpr
	wrpr	%o4,	0x0A73,	%cwp
	tgu	%xcc,	0x0
	alignaddr	%g2,	%o3,	%l3
	rd	%softint,	%o6
	udiv	%i7,	0x0E25,	%o5
	fmovdneg	%xcc,	%f11,	%f9
	wr	%i1,	0x013A,	%set_softint
	movrlez	%l1,	%i6,	%i0
	edge8ln	%i5,	%o2,	%o7
	orcc	%o0,	%g5,	%g3
	smul	%g7,	%l0,	%l4
	rdhpr	%hintp,	%i4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x4B2, 	%hsys_tick_cmpr
	tpos	%icc,	0x7
	wrpr	%g6,	0x0319,	%cwp
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x92A, 	%hsys_tick_cmpr
	fnor	%f30,	%f2,	%f24
	rdhpr	%hpstate,	%l6
	fmovdvs	%icc,	%f13,	%f30
	rd	%pc,	%l5
	rd	%pc,	%l2
	wr	%g1,	%i3,	%set_softint
	xnor	%i2,	0x0100,	%g2
	rd	%sys_tick_cmpr,	%o4
	tsubcc	%l3,	%o3,	%o6
	rdpr	%wstate,	%i7
	rdhpr	%hpstate,	%o5
	wrpr	%i1,	0x0808,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%i0,	%l1,	%cwp
	wr	%g0,	0xe3,	%asi
	stda	%o2,	[%l7 + 0x08] %asi
	membar	#Sync
	rd	%asi,	%i5
	wrpr	%o0,	0x1844,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%hsys_tick_cmpr,	%l0
	std	%l4,	[%l7 + 0x28]
	fbul	%fcc3,	loop_989
	mulx	%g7,	%g4,	%i4
	wr	%g6,	0x0633,	%softint
	rd	%ccr,	%o1
loop_989:
	movg	%xcc,	%l5,	%l6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x18C, 	%hsys_tick_cmpr
	wrpr	%i3,	0x1891,	%cwp
	rd	%softint,	%i2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x03F, 	%hsys_tick_cmpr
	taddcctv	%l2,	0x1F1E,	%o4
	movg	%icc,	%o3,	%o6
	rdpr	%cwp,	%i7
	rdpr	%wstate,	%o5
	rdhpr	%htba,	%i1
	add	%l3,	0x07B2,	%i0
	rdpr	%canrestore,	%l1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x308, 	%hsys_tick_cmpr
	wr 	%g0, 	0x7, 	%fprs
	wrpr	%o0,	%o7,	%pil
	wrpr	%g5,	%g3,	%cwp
	umulcc	%l4,	%l0,	%g7
	wrpr	%g4,	0x1902,	%cwp
	rd	%softint,	%g6
	wr	%o1,	0x1F16,	%clear_softint
	rd	%asi,	%l5
	alignaddr	%i4,	%g1,	%l6
	rdpr	%canrestore,	%i2
	movvs	%icc,	%i3,	%l2
	umulcc	%o4,	0x0FF2,	%g2
	rdhpr	%htba,	%o6
	wrpr	%o3,	%i7,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x75C, 	%hsys_tick_cmpr
	rdpr	%pil,	%i1
	rdpr	%otherwin,	%i0
	movpos	%xcc,	%o2,	%l1
	subccc	%i5,	0x109D,	%o0
	bshuffle	%f8,	%f16,	%f18
	prefetch	[%l7 + 0x1C],	 0x0
	sdiv	%i6,	0x1BBF,	%o7
	smulcc	%g5,	0x0553,	%l4
	set	0x64, %i0
	lduwa	[%l7 + %i0] 0x14,	%g3
	set	0x6C, %i5
	sta	%f13,	[%l7 + %i5] 0x14
	rd	%fprs,	%g7
        wr    %g0,    0xe,    %pcr    ! changed.
	edge32l	%o1,	%l5,	%i4
	rdhpr	%htba,	%g1
	rdhpr	%hpstate,	%g6
	edge16ln	%i2,	%i3,	%l2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%htba,	%l6
	prefetch	[%l7 + 0x48],	 0x1
	rdpr	%gl,	%o3
	rd	%softint,	%i7
	bl,a	%xcc,	loop_990
	wrpr	%o5,	0x1798,	%cwp
	rd	%asi,	%o6
	wrpr	%l3,	%i0,	%tick
loop_990:
	rdpr	%cansave,	%i1
	rdhpr	%hpstate,	%o2
	wrpr	%i5,	0x0B75,	%cwp
	rdhpr	%hintp,	%l1
	rd	%pc,	%i6
	rdpr	%tba,	%o0
	rdpr	%otherwin,	%g5
	udivx	%o7,	0x0F13,	%g3
	rdpr	%tl,	%g7
	rd	%sys_tick_cmpr,	%l0
	wr	%g4,	%l4,	%sys_tick
	rdhpr	%hpstate,	%l5
	wrpr	%i4,	%o1,	%tick
	rd	%tick_cmpr,	%g1
	tg	%icc,	0x2
	rd	%asi,	%i2
	fmovspos	%xcc,	%f15,	%f19
	umulcc	%g6,	0x0996,	%i3
	add	%l7,	0x44,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] %asi,	%o4,	%l2
	rdpr	%gl,	%l6
	or	%o3,	%g2,	%i7
	rdpr	%cleanwin,	%o5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x676, 	%hsys_tick_cmpr
	rd	%fprs,	%o6
	fmul8x16al	%f5,	%f20,	%f10
	rd	%ccr,	%o2
	fbuge,a	%fcc1,	loop_991
	udiv	%i5,	0x18B7,	%i1
	rdpr	%gl,	%l1
	movn	%xcc,	%o0,	%i6
loop_991:
	rdhpr	%hintp,	%g5
	edge32ln	%o7,	%g7,	%l0
	wrpr	%g3,	0x19A9,	%tick
	wrpr	%l4,	0x1950,	%tick
	fmovdcc	%xcc,	%f18,	%f30
	rdhpr	%hsys_tick_cmpr,	%g4
	umulcc	%i4,	0x09DD,	%o1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xB43, 	%hsys_tick_cmpr
	tge	%icc,	0x2
	popc	%l5,	%g6
	tne	%icc,	0x2
	wr	%i3,	0x13D9,	%ccr
	fmovrsgez	%l2,	%f30,	%f6
	movg	%xcc,	%o4,	%o3
	rd	%fprs,	%g2
	wrpr	%l6,	%i7,	%cwp
	fbe,a	%fcc2,	loop_992
	fcmpgt16	%f20,	%f4,	%l3
	fbule	%fcc0,	loop_993
	rdpr	%gl,	%i0
loop_992:
	wrpr	%o5,	%o6,	%tick
	rd	%softint,	%i5
loop_993:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x286, 	%hsys_tick_cmpr
	wrpr	%l1,	%o0,	%pil
	rdhpr	%hsys_tick_cmpr,	%i6
	movpos	%xcc,	%i1,	%g5
	wrpr	%o7,	%l0,	%cwp
	fmovrslz	%g3,	%f4,	%f20
	rdpr	%cleanwin,	%g7
	rdpr	%cleanwin,	%l4
	mulx	%i4,	%g4,	%o1
	udiv	%i2,	0x062D,	%g1
	rdpr	%cansave,	%g6
	movrne	%l5,	%l2,	%o4
	rdhpr	%hintp,	%o3
	rdpr	%cansave,	%i3
	be	loop_994
	wrpr	%l6,	0x0088,	%pil
	fbue	%fcc1,	loop_995
	tcs	%icc,	0x1
loop_994:
	rdpr	%otherwin,	%i7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_995:
	rdhpr	%htba,	%l3
	bneg	loop_996
	array16	%o5,	%o6,	%i5
	rdhpr	%hsys_tick_cmpr,	%o2
	rdhpr	%hpstate,	%l1
loop_996:
	rdpr	%cleanwin,	%o0
	rd	%softint,	%i0
	movrlz	%i1,	0x2CF,	%g5
	rdhpr	%hsys_tick_cmpr,	%o7
	tne	%icc,	0x1
	sra	%i6,	0x12,	%g3
	rdhpr	%hsys_tick_cmpr,	%g7
	bgu	loop_997
	rd	%fprs,	%l0
	call	loop_998
	movre	%i4,	%l4,	%g4
loop_997:
	edge8ln	%i2,	%o1,	%g6
	fbg,a	%fcc2,	loop_999
loop_998:
	fmovrslz	%g1,	%f22,	%f26
	rdpr	%wstate,	%l2
	ld	[%l7 + 0x54],	%f7
loop_999:
	fxor	%f2,	%f18,	%f28
	addcc	%o4,	%o3,	%i3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x7BD, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x3C4, 	%hsys_tick_cmpr
	movcs	%icc,	%g2,	%i7
	sethi	0x0A50,	%o5
	fbuge	%fcc1,	loop_1000
	sethi	0x1B61,	%l3
        wr    %g0,    0xe,    %pcr    ! changed.

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x3C6, 	%hsys_tick_cmpr
loop_1000:
	edge32n	%l1,	%i1,	%i0
	movrlez	%o7,	0x3E9,	%i6
	fmovsn	%icc,	%f6,	%f18
	fmovdne	%icc,	%f3,	%f15
	rdhpr	%hsys_tick_cmpr,	%g3
	fcmpes	%fcc0,	%f5,	%f6
	fmul8sux16	%f2,	%f26,	%f24
	subccc	%g7,	0x1E07,	%l0
	set	0x77, %o6
	ldsba	[%l7 + %o6] 0x19,	%g5
	stx	%l4,	[%l7 + 0x30]
	wrpr	%g4,	0x123B,	%cwp
	tge	%icc,	0x6
	rdpr	%wstate,	%i2
	set	0x5C, %o7
	swapa	[%l7 + %o7] 0x81,	%o1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x758, 	%hsys_tick_cmpr
	rdhpr	%htba,	%g1
	xnorcc	%l2,	0x17F1,	%o3
	wrpr	%o4,	0x1A4D,	%pil
	wr	%i3,	0x08F9,	%pic
	subccc	%l6,	0x11AD,	%g2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xBA2, 	%tick_cmpr
	fnand	%f24,	%f14,	%f20

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%i7,	%o6,	%pic
	fmovrdlez	%o2,	%f28,	%f6
	edge16n	%o0,	%i5,	%l1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x88C, 	%hsys_tick_cmpr
	wr	%i1,	0x069F,	%sys_tick
	subc	%i6,	%o7,	%g3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%htba,	%g5
	add	%l7,	0x20,	%l6
	wr	%g0,	0x04,	%asi
	casxa	[%l6] %asi,	%l0,	%g4
	wrpr	%i2,	%o1,	%cwp
	movneg	%icc,	%g6,	%i4
	rdhpr	%hpstate,	%g1
	rdpr	%cwp,	%l2
	udivcc	%o3,	0x14C6,	%l4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%tba,	%o4
	rd	%asi,	%g2
	std	%l4,	[%l7 + 0x40]
	wrpr	%o5,	%l3,	%tick
	addc	%l6,	0x025A,	%o6
	fbuge,a	%fcc0,	loop_1001
	edge8n	%i7,	%o0,	%o2
	wr	%l1,	0x103A,	%y
	fmovrdgz	%i5,	%f28,	%f20
loop_1001:
	rdpr	%canrestore,	%i1
	edge32	%i0,	%i6,	%g3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%g5,	0x0675,	%clear_softint
	wr	%g7,	0x10AA,	%pic
	xor	%l0,	0x05B8,	%i2
	rd	%softint,	%g4
	fpadd16s	%f4,	%f31,	%f11
	movcc	%xcc,	%o1,	%g6
	udivcc	%i4,	0x0C1F,	%g1
	rd	%y,	%l2
	rdhpr	%hpstate,	%o3
	addccc	%i3,	0x1C12,	%o4
	andn	%g2,	%l4,	%o5
	fandnot2s	%f2,	%f1,	%f10

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%pc,	%l6
	wr	%o6,	%i7,	%sys_tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x6C2, 	%hsys_tick_cmpr
	rdhpr	%htba,	%o2
	rd	%y,	%l3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x8F7, 	%hsys_tick_cmpr
	tleu	%icc,	0x7
	wr	%i1,	%i0,	%y
	rdpr	%cansave,	%g3
	wr	%i6,	%o7,	%pic

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fbge	%fcc1,	loop_1002
	rdpr	%tba,	%g5
	wrpr	%i2,	%l0,	%cwp
	wrpr	%g4,	0x1FF1,	%tick
loop_1002:
	fmovda	%icc,	%f15,	%f1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	tleu	%xcc,	0x5
	rd	%asi,	%g6
	tle	%icc,	0x4
	rdpr	%wstate,	%g1
	rdpr	%tl,	%i4
	wr	%l2,	%i3,	%y
	rd	%asi,	%o3
	rdhpr	%hpstate,	%g2
	movcs	%xcc,	%l4,	%o5
	bneg,pt	%icc,	loop_1003
	call	loop_1004
	taddcc	%l5,	0x0E9C,	%l6
	rdhpr	%hintp,	%o6
loop_1003:
	srl	%o4,	%o0,	%i7
loop_1004:
	fnors	%f25,	%f12,	%f8
	rd	%ccr,	%o2
	rd	%tick_cmpr,	%i5
	wrpr	%l3,	%i1,	%pil
	rdpr	%cansave,	%l1
	smul	%g3,	0x09D2,	%i6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x3F4, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%g7,	0x1936,	%tick
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	rdpr	%wstate,	%i2
	wr	%l0,	%g4,	%pic
	wrpr	%g6,	0x0CE5,	%pil
	wrpr	%o1,	%g1,	%tick
	addc	%i4,	0x0910,	%i3
	sub	%o3,	0x0BEC,	%g2
	wrpr	%l2,	%o5,	%cwp
	rdpr	%cleanwin,	%l5
	andcc	%l4,	0x1456,	%l6
	rdhpr	%hsys_tick_cmpr,	%o6
	wrpr	%o0,	0x1FA5,	%cwp
	rd	%y,	%o4
	edge8ln	%o2,	%i7,	%l3
	fmovdleu	%xcc,	%f11,	%f16

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	xnor	%g3,	0x14A6,	%i6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	movne	%xcc,	%o7,	%g5
	movcs	%xcc,	%i2,	%g7
	stx	%g4,	[%l7 + 0x58]
	rd	%pc,	%g6
	rdpr	%pil,	%l0
	movrgez	%o1,	0x06A,	%i4
	movn	%xcc,	%i3,	%g1
	wr 	%g0, 	0x7, 	%fprs
	rdpr	%gl,	%l2
	wr 	%g0, 	0x6, 	%fprs

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x225, 	%hsys_tick_cmpr
	umulcc	%g2,	0x1D34,	%l6
	fabsd	%f12,	%f2
	rdpr	%wstate,	%o6
	set	0x20, %l6
	prefetcha	[%l7 + %l6] 0x14,	 0x3
	set	0x74, %g5
	swapa	[%l7 + %g5] 0x11,	%l4
	sra	%o2,	0x14,	%i7
	rd	%ccr,	%l3
	wr 	%g0, 	0x5, 	%fprs
	fmovsg	%icc,	%f14,	%f29
	fors	%f0,	%f15,	%f7
	rdhpr	%hpstate,	%l1
	wrpr	%o4,	0x1FEB,	%cwp
	rdpr	%canrestore,	%i6
	set	0x4C, %g4
	ldswa	[%l7 + %g4] 0x11,	%g3
	fmovdle	%icc,	%f23,	%f29
	stb	%i0,	[%l7 + 0x1B]
	rd	%softint,	%o7
	wrpr	%i1,	%i2,	%cwp
	fmovdge	%icc,	%f30,	%f29
	wrpr	%g7,	0x064D,	%tick
	bge,a,pt	%xcc,	loop_1005
	subc	%g5,	0x1E50,	%g6
	rdpr	%cansave,	%l0
	rdhpr	%hsys_tick_cmpr,	%o1
loop_1005:
	bne,a	%xcc,	loop_1006
	xorcc	%g4,	%i3,	%i4
	fmovse	%icc,	%f7,	%f18

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x93B, 	%hsys_tick_cmpr
loop_1006:
	tvs	%xcc,	0x4
	wrpr	%o3,	%l2,	%pil
	wrpr	%o5,	%l5,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%o6,	0x063F,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	bne,a,pt	%icc,	loop_1007
	ldub	[%l7 + 0x12],	%o2
	rd	%y,	%i7
	rdhpr	%hintp,	%l6
loop_1007:
	rdhpr	%htba,	%l3
	wrpr	%l1,	0x18EC,	%cwp
	edge8ln	%i5,	%i6,	%o4
	wrpr	%g3,	0x1003,	%pil
	srlx	%i0,	0x06,	%i1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	taddcctv	%g5,	%g6,	%l0
	tcc	%xcc,	0x3
	wr	%i2,	%o1,	%ccr
	andcc	%g4,	%i3,	%g1
	wrpr	%i4,	0x0B4D,	%tick
	set	0x50, %g7
	ldda	[%l7 + %g7] 0x11,	%l2
	fmul8ulx16	%f24,	%f28,	%f20
	rdhpr	%hsys_tick_cmpr,	%o5
	andncc	%l5,	%o3,	%g2
	stx	%o6,	[%l7 + 0x28]
	rdpr	%tba,	%o0
	rdhpr	%hpstate,	%o2
	tpos	%xcc,	0x4
	smulcc	%l4,	0x13C9,	%i7
	tge	%icc,	0x2
	movn	%icc,	%l3,	%l6
	wr	%l1,	0x01E3,	%softint
	wrpr	%i6,	0x075B,	%pil
	wrpr	%o4,	0x0EFF,	%pil
	wrpr	%i5,	0x0ECE,	%cwp
	movn	%icc,	%g3,	%i0
	wr	%o7,	0x17E3,	%pic
	rdpr	%wstate,	%g7
	rdpr	%gl,	%g5
	nop
	setx loop_1008, %l0, %l1
	jmpl %l1, %i1
	edge32n	%g6,	%l0,	%i2
	wrpr	%g4,	0x052F,	%pil
	wr	%i3,	0x1005,	%set_softint
loop_1008:
	sll	%g1,	0x1C,	%o1
	rdhpr	%htba,	%l2
	rdhpr	%hpstate,	%o5
	rdhpr	%hpstate,	%i4
	xor	%l5,	%g2,	%o6
	rd	%asi,	%o0
	taddcc	%o3,	0x0E9D,	%l4
	fzero	%f0
	rd	%y,	%i7
	rdhpr	%hpstate,	%o2
	wrpr	%l6,	0x00CA,	%pil
	rd	%fprs,	%l1
	wrpr	%l3,	0x16D8,	%tick
	tvc	%icc,	0x6
	rd	%y,	%o4
	rd	%fprs,	%i5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x6B2, 	%hsys_tick_cmpr
	set	0x5C, %g3
	ldsha	[%l7 + %g3] 0x10,	%i6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%o7,	%g5,	%pil
	wr	%i1,	%g6,	%y
	fcmpgt32	%f24,	%f4,	%l0
	set	0x58, %g2
	stwa	%i2,	[%l7 + %g2] 0x27
	membar	#Sync
	rdpr	%cleanwin,	%g7
	wr	%g0,	0x0c,	%asi
	stba	%g4,	[%l7 + 0x71] %asi
	fmul8x16	%f16,	%f0,	%f24
	wr	%g1,	0x0DAA,	%pic

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xF07, 	%hsys_tick_cmpr
	std	%o0,	[%l7 + 0x28]
	sethi	0x1F6E,	%l2
	tne	%xcc,	0x5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x000, 	%hsys_tick_cmpr
	orncc	%l5,	0x0159,	%g2
	wr	%i4,	0x073F,	%y
	movl	%xcc,	%o0,	%o3
	nop
	set	0x4A, %o1
	sth	%o6,	[%l7 + %o1]
	rdhpr	%hpstate,	%l4
	tge	%xcc,	0x4
	rdhpr	%htba,	%o2
	rdpr	%pil,	%l6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xA6D, 	%hsys_tick_cmpr
	sir	0x10DD
	subccc	%i7,	%l3,	%i5
	rdhpr	%hpstate,	%o4
	udiv	%i6,	0x18CE,	%g3
	rd	%pc,	%o7
	rd	%tick_cmpr,	%i0
	rdhpr	%hsys_tick_cmpr,	%i1
	rd	%pc,	%g5
	rdpr	%otherwin,	%l0
	array8	%i2,	%g6,	%g7
	edge32ln	%g4,	%g1,	%o1
	fbn,a	%fcc0,	loop_1009
	wrpr	%l2,	0x15AD,	%cwp
	rdhpr	%hsys_tick_cmpr,	%i3
	rd	%asi,	%o5
loop_1009:
	rdhpr	%hpstate,	%l5
	rdhpr	%hpstate,	%i4
	tpos	%xcc,	0x3
	fbo,a	%fcc2,	loop_1010
	edge8	%g2,	%o3,	%o0
	rdpr	%cleanwin,	%o6
	fmuld8sux16	%f13,	%f10,	%f18
loop_1010:
	taddcctv	%l4,	%o2,	%l1
	movn	%icc,	%i7,	%l3
	wrpr	%l6,	0x0AA2,	%cwp
	movcs	%icc,	%o4,	%i6
	stw	%g3,	[%l7 + 0x1C]
	ldx	[%l7 + 0x30],	%i5
	fmovdcs	%icc,	%f5,	%f3
	edge16n	%o7,	%i1,	%g5
	wr	%i0,	%l0,	%ccr
	tsubcc	%g6,	0x16F5,	%g7
	array16	%g4,	%g1,	%o1
	rdhpr	%hintp,	%i2
	ldsh	[%l7 + 0x52],	%i3
	fsrc2	%f20,	%f14
	sdiv	%l2,	0x12B8,	%o5
	fabss	%f0,	%f25

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x521, 	%hsys_tick_cmpr
	wr	%g2,	0x1AEE,	%softint
	bge,pt	%xcc,	loop_1011
	srlx	%o0,	%o6,	%o3
	tneg	%icc,	0x2
	ldd	[%l7 + 0x38],	%f18
loop_1011:
	edge32	%o2,	%l4,	%i7
	wr	%l3,	0x13C0,	%clear_softint
	rd	%softint,	%l1
	fbu,a	%fcc2,	loop_1012
	wr	%l6,	%o4,	%y
	te	%icc,	0x5
	udivcc	%g3,	0x0832,	%i5
loop_1012:
	rd	%asi,	%i6
	rdpr	%cansave,	%o7
	wr	%i1,	%i0,	%pic
	fones	%f17
	fzeros	%f10

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x5F1, 	%hsys_tick_cmpr
	rdhpr	%hsys_tick_cmpr,	%g5
	wrpr	%g7,	%g4,	%pil
	fcmple32	%f8,	%f4,	%o1
	andncc	%g1,	%i2,	%i3
        wr    %g0,    0xe,    %pcr    ! changed.
	taddcctv	%o5,	0x0BF4,	%l5
	mulscc	%g2,	%i4,	%o0
	rdpr	%cwp,	%o3
	wr	%o2,	0x0714,	%set_softint
	be,a	loop_1013
	sra	%l4,	0x09,	%i7
	rdhpr	%hsys_tick_cmpr,	%o6
	wr 	%g0, 	0x5, 	%fprs
loop_1013:
	rdpr	%wstate,	%l6
	rdpr	%gl,	%o4
	addccc	%i5,	%g3,	%o7
	wr	%i1,	%i6,	%pic
	move	%xcc,	%l0,	%i0
	fmovdle	%icc,	%f11,	%f7
	rdpr	%cwp,	%g6
	tneg	%xcc,	0x7
	wr	%g5,	%g4,	%set_softint
	rdpr	%gl,	%g7
	rdhpr	%htba,	%o1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%ccr,	%i3
	wrpr	%l2,	%o5,	%pil
	rd	%tick_cmpr,	%l5
	fmovrdlez	%i4,	%f24,	%f28
	tle	%icc,	0x4
	wrpr	%g2,	0x1176,	%cwp
	wr	%o0,	0x05A7,	%pic
	addcc	%o3,	0x13FE,	%l4
	wr	%o2,	0x074C,	%pic
	tl	%xcc,	0x1
	wr	%i7,	%o6,	%set_softint
	stb	%l3,	[%l7 + 0x54]
	rdhpr	%htba,	%l6
	fbue	%fcc2,	loop_1014
	rdhpr	%hintp,	%l1
	wrpr	%i5,	0x109C,	%pil
	tne	%icc,	0x6
loop_1014:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x9EA, 	%hsys_tick_cmpr
	rdpr	%cwp,	%o7
	wrpr	%i1,	%l0,	%pil
	wrpr	%i0,	0x0FA2,	%pil
	rd	%tick_cmpr,	%g6
	fmul8x16au	%f21,	%f23,	%f30
	orn	%g5,	0x05E5,	%g4
	wr	%g7,	%i6,	%y
	rd	%tick_cmpr,	%o1
	rdpr	%cleanwin,	%i2
	wrpr	%g1,	%l2,	%tick
	wr	%o5,	0x0445,	%pic
	rdpr	%cleanwin,	%i3
	rdpr	%cwp,	%l5
	srl	%i4,	0x1A,	%g2
	rdpr	%pil,	%o3
	rd	%y,	%l4
	rd	%sys_tick_cmpr,	%o2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	sllx	%o6,	%l3,	%l6
	wrpr	%i7,	%l1,	%pil
	fmovsl	%icc,	%f11,	%f6
	movrlz	%o4,	%i5,	%o7
	fba	%fcc0,	loop_1015
	movrlz	%g3,	0x05B,	%i1
	fmovrdlez	%l0,	%f12,	%f18
	rdpr	%cansave,	%i0
loop_1015:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	brlez,a	%g4,	loop_1016
	movleu	%xcc,	%g6,	%g7
	rd	%y,	%i6
	fmovrsne	%o1,	%f27,	%f16
loop_1016:
	rdhpr	%htba,	%g1
	ldsh	[%l7 + 0x58],	%i2
	wrpr	%l2,	%i3,	%tick
	wr	%o5,	%i4,	%clear_softint
	rd	%y,	%g2
	rdpr	%tl,	%l5
	rdhpr	%hpstate,	%l4
	rd	%tick_cmpr,	%o2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%hintp,	%o0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	set	0x7C, %o2
	ldstuba	[%l7 + %o2] 0x81,	%l6
	wrpr	%i7,	%l1,	%pil
	rdhpr	%hsys_tick_cmpr,	%o4
	rd	%tick_cmpr,	%o6
	smulcc	%i5,	0x1E95,	%g3
	te	%icc,	0x5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x741, 	%hsys_tick_cmpr
	edge8l	%l0,	%i0,	%g5
	movrgez	%g4,	%o7,	%g7
	fors	%f28,	%f16,	%f12
	wr	%i6,	0x1BA5,	%sys_tick
	rdpr	%pil,	%o1
	rdhpr	%hsys_tick_cmpr,	%g6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x871, 	%hsys_tick_cmpr
	rd	%y,	%g1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x75A, 	%hsys_tick_cmpr
	fnot2	%f16,	%f22
	umulcc	%o5,	0x165D,	%g2
	bg,a,pt	%icc,	loop_1017
	bcc,a	%xcc,	loop_1018
	movrgz	%i4,	%l5,	%o2
	wrpr	%o3,	0x1CC4,	%tick
loop_1017:
	std	%f28,	[%l7 + 0x30]
loop_1018:
	alignaddrl	%l4,	%l3,	%l6
	tpos	%icc,	0x5
	fmovsneg	%icc,	%f12,	%f20
	movrlez	%i7,	%o0,	%l1
	rdhpr	%hsys_tick_cmpr,	%o6
	rdpr	%cansave,	%o4
	stw	%i5,	[%l7 + 0x50]
	wrpr	%g3,	%i1,	%cwp
	subcc	%i0,	0x1C0A,	%l0
	rdhpr	%hsys_tick_cmpr,	%g5
	smulcc	%g4,	%o7,	%i6
	fmovspos	%xcc,	%f14,	%f19

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x9E7, 	%hsys_tick_cmpr
	rdpr	%tl,	%o1
	fpackfix	%f2,	%f6
	fnot1s	%f23,	%f26
	rd	%fprs,	%g6
	rd	%y,	%g1
	wr	%l2,	%i3,	%ccr
	movgu	%xcc,	%o5,	%g2
	sdivx	%i2,	0x0658,	%i4
	rdpr	%otherwin,	%o2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x295, 	%hsys_tick_cmpr
	movn	%icc,	%l4,	%l6
	wrpr	%l3,	%i7,	%cwp
	rdhpr	%htba,	%l1
	std	%o0,	[%l7 + 0x50]
	wrpr	%o6,	0x0A94,	%cwp
	wr	%o4,	%i5,	%sys_tick
	rd	%asi,	%g3
	bne,a	loop_1019
	rdpr	%cleanwin,	%i1
	array8	%l0,	%g5,	%g4
	set	0x40, %o4
	sta	%f17,	[%l7 + %o4] 0x11
loop_1019:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x377, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x3E6, 	%hsys_tick_cmpr
	wr	%g0,	0x11,	%asi
	lduwa	[%l7 + 0x14] %asi,	%g7
	fnot2s	%f25,	%f21
	wrpr	%g6,	%g1,	%pil
	movge	%icc,	%l2,	%o5
	subc	%g2,	%i2,	%i3
	add	%i4,	%o3,	%o2
	bcc,pn	%xcc,	loop_1020
	andncc	%l4,	%l5,	%l6
	rdpr	%cansave,	%l3
	fcmpne16	%f4,	%f22,	%i7
loop_1020:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x2B7, 	%hsys_tick_cmpr
	movre	%o4,	%l1,	%g3
	wr	%g0,	0x89,	%asi
	lduwa	[%l7 + 0x24] %asi,	%i1
	rdhpr	%htba,	%i5
	wrpr	%l0,	%g5,	%cwp
	fcmps	%fcc2,	%f1,	%f22
	fbne	%fcc3,	loop_1021
	sllx	%i0,	0x10,	%g4
	rdhpr	%hintp,	%o7
	set	0x27, %i7
	ldsba	[%l7 + %i7] 0x11,	%i6
loop_1021:
	wrpr	%o1,	0x0A49,	%cwp

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%g7,	0x071B,	%cwp
	wr	%l2,	0x1EAF,	%pic
	orncc	%g2,	0x14E2,	%i2
	tvs	%icc,	0x1
	rd	%fprs,	%i3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	srax	%l4,	0x01,	%o2
	brgz	%l6,	loop_1022
	rdhpr	%hintp,	%l3
	subc	%i7,	0x04B2,	%o0
	bl,pt	%xcc,	loop_1023
loop_1022:
	ldd	[%l7 + 0x10],	%f6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xB2F, 	%hsys_tick_cmpr
	wr	%g0,	0x89,	%asi
	prefetcha	[%l7 + 0x78] %asi,	 0x2
loop_1023:
	rd	%fprs,	%l1
	movrlz	%g3,	%o4,	%i5
	edge32l	%l0,	%g5,	%i1
	fmovrdgz	%i0,	%f2,	%f20
	rdpr	%tl,	%o7
	rd	%softint,	%i6
	wr	%g4,	0x0B1A,	%y
	rdhpr	%hsys_tick_cmpr,	%o1
	wr	%g0,	0x89,	%asi
	lduwa	[%l7 + 0x48] %asi,	%g1
	wrpr	%g6,	0x02F7,	%cwp
	rdhpr	%hintp,	%g7
	rdpr	%cleanwin,	%l2
	wr	%g2,	%i2,	%clear_softint
	wr	%g0,	0x80,	%asi
	ldstuba	[%l7 + 0x22] %asi,	%i3
	fmuld8sux16	%f3,	%f12,	%f6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xFC7, 	%hsys_tick_cmpr
	rdpr	%gl,	%o3
	edge16l	%i4,	%l4,	%o2
	rdhpr	%hpstate,	%l3
	fba	%fcc2,	loop_1024
	fxor	%f18,	%f16,	%f18
	set	0x40, %o0
	stda	%f16,	[%l7 + %o0] 0xc9
loop_1024:
	edge16n	%i7,	%l6,	%l5
	rd	%softint,	%o6
	wrpr	%l1,	0x086D,	%tick
	bl,a,pt	%xcc,	loop_1025
	rd	%softint,	%g3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%y,	%l0
loop_1025:
	rdpr	%canrestore,	%g5
	brgz	%i5,	loop_1026
	fcmple16	%f2,	%f4,	%i1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%hintp,	%g4
loop_1026:
	rdhpr	%htba,	%o7
	rdpr	%otherwin,	%g1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	rdhpr	%hsys_tick_cmpr,	%l2
	tvs	%xcc,	0x5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xAD2, 	%hsys_tick_cmpr
	wrpr	%g7,	0x1A27,	%tick
	wrpr	%i3,	0x0EA7,	%pil
	wr	%g0,	0x04,	%asi
	prefetcha	[%l7 + 0x28] %asi,	 0x2
	rdhpr	%htba,	%o3
	rdpr	%gl,	%i4
	rdhpr	%hintp,	%o5
	tgu	%xcc,	0x4
	wrpr	%o2,	0x14BE,	%pil
	rdpr	%cwp,	%l4
	rdhpr	%hpstate,	%l3
	edge32ln	%l6,	%l5,	%o6
	wrpr	%i7,	0x0D03,	%cwp
	edge32	%l1,	%o0,	%o4
	udiv	%g3,	0x0A92,	%l0
        wr    %g0,    0xe,    %pcr    ! changed.
	wr	%g5,	0x03A9,	%clear_softint
	fxor	%f8,	%f30,	%f26

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x95D, 	%hsys_tick_cmpr
	rd	%softint,	%i1
	tpos	%icc,	0x4
	movrgz	%o7,	0x3C6,	%g1
	mova	%xcc,	%o1,	%g6
	fmovrdlz	%l2,	%f12,	%f2
	wrpr	%g2,	0x1A86,	%tick
	for	%f28,	%f12,	%f14

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x7CF, 	%hsys_tick_cmpr
	wrpr	%i3,	0x0BAA,	%cwp
	tneg	%icc,	0x2
	fmovsg	%icc,	%f23,	%f16
	edge16n	%g4,	%o3,	%i2
	movl	%icc,	%i4,	%o5
	rdpr	%cansave,	%o2
	wr	%l3,	%l4,	%clear_softint

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	wrpr	%i7,	%l1,	%cwp
	rd	%ccr,	%o0
	wrpr	%l5,	%g3,	%pil
	wrpr	%l0,	0x0993,	%pil
	rdhpr	%hintp,	%i5
	and	%o4,	0x1BB7,	%g5
	wrpr	%i6,	%i1,	%tick
	wrpr	%i0,	0x1BB1,	%tick
	lduh	[%l7 + 0x32],	%g1
	wrpr	%o1,	0x0D62,	%cwp
	rd	%y,	%g6
	set	0x10, %l0
	stxa	%l2,	[%l7 + %l0] 0x04

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x60E, 	%hsys_tick_cmpr
	brlez,a	%g2,	loop_1027
	movneg	%icc,	%g7,	%g4
	rdhpr	%htba,	%i3
	wr	%o3,	0x03FF,	%pic
loop_1027:
	wrpr	%i4,	%o5,	%tick
	wrpr	%i2,	%l3,	%tick
	std	%l4,	[%l7 + 0x08]
	wrpr	%o2,	%o6,	%cwp
	fzeros	%f10
	tle	%icc,	0x7
	rd	%asi,	%i7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x629, 	%hsys_tick_cmpr
	fble,a	%fcc1,	loop_1028
	rdpr	%cleanwin,	%l1
	sth	%l5,	[%l7 + 0x70]
	rd	%tick_cmpr,	%o0
loop_1028:
	movre	%l0,	%g3,	%i5
	addccc	%g5,	%i6,	%i1
	rd	%pc,	%o4
	wrpr	%i0,	%o1,	%pil
	alignaddr	%g6,	%l2,	%g1
	rdhpr	%hpstate,	%o7
	andn	%g2,	0x18EA,	%g4
	rdhpr	%hsys_tick_cmpr,	%i3
	rd	%asi,	%g7
	taddcctv	%i4,	0x0F61,	%o5
	fsrc2s	%f30,	%f4
	wrpr	%i2,	%l3,	%pil
	rdpr	%wstate,	%l4
	wrpr	%o3,	0x0BDD,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xD1E, 	%tick_cmpr
	rd	%fprs,	%i7
	rdhpr	%hpstate,	%o2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	rdhpr	%hpstate,	%o0
	wr	%l0,	%l5,	%softint
	std	%i4,	[%l7 + 0x28]

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	or	%g5,	%i1,	%i0
	rdpr	%pil,	%o4
	wr	%o1,	%g6,	%pic
	bcs,a	loop_1029
	wrpr	%l2,	0x04DC,	%tick
	wrpr	%o7,	0x1D7C,	%tick
	wrpr	%g1,	%g4,	%cwp
loop_1029:
	rdhpr	%hsys_tick_cmpr,	%i3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x832, 	%hsys_tick_cmpr
	udiv	%i4,	0x033E,	%g7
	rd	%ccr,	%i2
	wrpr	%o5,	0x1D18,	%cwp
	wr 	%g0, 	0x6, 	%fprs
	rd	%ccr,	%o6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	edge32ln	%l4,	%l6,	%o0
	rd	%y,	%l0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x76A, 	%hsys_tick_cmpr
	tvs	%xcc,	0x0
	wr	%i5,	%i6,	%set_softint
	rd	%pc,	%g5
	wr	%g3,	0x0796,	%y
	rd	%tick_cmpr,	%i1
	fmovrde	%o4,	%f14,	%f14
	call	loop_1030
	edge8l	%i0,	%o1,	%l2
	fornot1	%f14,	%f8,	%f12
	udiv	%g6,	0x1BE5,	%o7
loop_1030:
	fnegd	%f18,	%f24
	srlx	%g4,	%i3,	%g2
	xorcc	%g1,	%i4,	%g7
	sdivcc	%o5,	0x10AA,	%i2
	rdhpr	%hpstate,	%l3
	rd	%asi,	%o3
	rdhpr	%hsys_tick_cmpr,	%o6
	edge32l	%o2,	%i7,	%l4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xC19, 	%hsys_tick_cmpr
	set	0x4D, %i1
	ldsba	[%l7 + %i1] 0x11,	%i5
	wrpr	%l5,	%i6,	%pil
	tcs	%xcc,	0x4
	tneg	%xcc,	0x5
	fmovsvs	%icc,	%f0,	%f13
	rdpr	%wstate,	%g3
	movrlz	%g5,	%i1,	%o4
	edge32n	%i0,	%l2,	%g6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%g4,	%o1,	%set_softint
	and	%g2,	0x0E17,	%i3
	movvs	%icc,	%i4,	%g1
	mulscc	%o5,	%i2,	%g7
	subcc	%l3,	0x1670,	%o3
	rdhpr	%hsys_tick_cmpr,	%o2
	wr	%i7,	0x1FA6,	%sys_tick
	wr	%o6,	%l6,	%set_softint
	xnor	%l4,	%o0,	%l0
	xor	%l1,	%l5,	%i5
	rdhpr	%hintp,	%g3
	movl	%icc,	%i6,	%g5
	rdhpr	%hsys_tick_cmpr,	%o4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%pc,	%l2
	fsrc2s	%f22,	%f10
	fmovsleu	%xcc,	%f18,	%f22
	fbe	%fcc3,	loop_1031
	st	%f3,	[%l7 + 0x64]
	flush	%l7 + 0x10
	wrpr	%i1,	0x1BFE,	%cwp
loop_1031:
	tne	%xcc,	0x4
	umul	%g6,	%o7,	%o1
	wrpr	%g2,	0x038D,	%cwp
	movl	%icc,	%g4,	%i4
	fmul8x16	%f20,	%f26,	%f20
	wrpr	%g1,	%o5,	%pil
	movre	%i3,	0x058,	%g7
	wrpr	%l3,	0x0194,	%pil
	rdpr	%cwp,	%o3
	edge8	%i2,	%i7,	%o2
	fba	%fcc1,	loop_1032
	wr	%l6,	0x1630,	%softint
	alignaddrl	%l4,	%o0,	%o6
	wrpr	%l0,	0x036B,	%tick
loop_1032:
	add	%l1,	0x1C87,	%i5
	rdpr	%gl,	%g3
	wrpr	%i6,	%l5,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%g5,	%i0,	%pil
	movvc	%xcc,	%i1,	%l2
	brgez,a	%o7,	loop_1033
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subc	%o1,	0x056F,	%g6
	wrpr	%g2,	0x0495,	%pil
loop_1033:
	edge16ln	%g4,	%g1,	%o5
	wrpr	%i3,	0x0D07,	%cwp
	movg	%icc,	%g7,	%l3
	wr	%i4,	%o3,	%pic
	sll	%i7,	%i2,	%l6
	rd	%asi,	%l4
	movrlez	%o0,	0x1DD,	%o6
	wr	%g0,	0x2b,	%asi
	stwa	%o2,	[%l7 + 0x0C] %asi
	membar	#Sync
	rdhpr	%hpstate,	%l1
	rd	%asi,	%i5
	rdpr	%cleanwin,	%g3
	movre	%l0,	%i6,	%l5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xF6D, 	%hsys_tick_cmpr
	wrpr	%i1,	%l2,	%tick
	xnorcc	%o4,	%o1,	%o7
	wr	%g6,	0x08BB,	%softint
	xnorcc	%g4,	%g2,	%g1
	fpadd16	%f8,	%f16,	%f6
	rd	%ccr,	%o5
	fornot2s	%f3,	%f23,	%f12
	movrlez	%g7,	0x300,	%l3
	wrpr	%i4,	%o3,	%tick
	rdpr	%cleanwin,	%i3
	fbuge	%fcc3,	loop_1034
	rdpr	%tba,	%i2
	rd	%y,	%l6
	andncc	%l4,	%i7,	%o0
loop_1034:
	wr	%o6,	%o2,	%set_softint
	rd	%asi,	%l1
	rd	%softint,	%i5
	wr	%g0,	0x19,	%asi
	ldswa	[%l7 + 0x6C] %asi,	%g3
	fpsub16	%f18,	%f24,	%f30
	rdpr	%cleanwin,	%i6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x5B9, 	%hsys_tick_cmpr
	smul	%g5,	0x181B,	%i0
	edge8	%l5,	%i1,	%l2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xEFC, 	%hsys_tick_cmpr
	movg	%icc,	%o1,	%g6
	wr	%o7,	0x0686,	%clear_softint
	movrgz	%g2,	0x0EE,	%g4
	fsrc1s	%f29,	%f23
	array16	%g1,	%g7,	%l3
	wr 	%g0, 	0x4, 	%fprs
	xnor	%o5,	%i3,	%o3
	tne	%xcc,	0x6
	umulcc	%l6,	%i2,	%i7
	rdpr	%cwp,	%o0
	wrpr	%l4,	%o2,	%cwp
	rdpr	%gl,	%l1
	rdpr	%pil,	%o6
	rd	%asi,	%i5
	fmul8sux16	%f14,	%f8,	%f18
	wr 	%g0, 	0x7, 	%fprs

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%htba,	%i0
	sdivcc	%l5,	0x1E8F,	%l2
	srlx	%o4,	%o1,	%i1
        wr    %g0,    0xe,    %pcr    ! changed.
	wrpr	%g6,	0x19D7,	%pil
	ldsh	[%l7 + 0x6C],	%g4
	rdpr	%wstate,	%g1
	rd	%sys_tick_cmpr,	%g2
	wr	%g0,	0x81,	%asi
	stxa	%l3,	[%l7 + 0x50] %asi
	fmovrdlez	%g7,	%f14,	%f16
	wr	%o5,	0x0044,	%y
	rdhpr	%hsys_tick_cmpr,	%i4
	tleu	%icc,	0x3
	wrpr	%i3,	%o3,	%tick
	tg	%xcc,	0x0
	movl	%icc,	%i2,	%l6
	fmovsl	%xcc,	%f2,	%f7
	rdpr	%gl,	%o0
	mova	%xcc,	%l4,	%o2
	rdhpr	%hpstate,	%i7
	rdhpr	%hsys_tick_cmpr,	%l1
	wrpr	%i5,	%o6,	%pil
	movrgz	%i6,	%g3,	%g5
	wr	%l0,	0x13CF,	%set_softint
	rdpr	%cleanwin,	%i0
	rdpr	%tl,	%l2
	rdpr	%gl,	%l5
	rd	%tick_cmpr,	%o4
	wrpr	%i1,	0x1960,	%pil
	rdhpr	%hintp,	%o7
	ldd	[%l7 + 0x68],	%f12
	tn	%xcc,	0x3
	rdhpr	%hpstate,	%o1
	rdhpr	%hpstate,	%g4
	orncc	%g1,	0x05CF,	%g2
	xor	%l3,	%g6,	%o5
	rd	%pc,	%g7
	wrpr	%i4,	%i3,	%cwp
	fbn	%fcc0,	loop_1035
	movleu	%xcc,	%i2,	%o3
	rdhpr	%hpstate,	%l6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_1035:
	or	%o0,	0x0E60,	%i7
	rdpr	%gl,	%l1
	bg,a	loop_1036
	sethi	0x02B5,	%i5
	fmovdle	%icc,	%f12,	%f7
	orn	%o2,	%i6,	%o6
loop_1036:
	wrpr	%g5,	%l0,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x7C3, 	%hsys_tick_cmpr
	rd	%ccr,	%i0
	rdpr	%tl,	%l2
	wrpr	%o4,	%i1,	%cwp
	fcmple32	%f20,	%f24,	%l5
	rd	%fprs,	%o1
	fmovda	%xcc,	%f3,	%f14
	popc	0x00D9,	%g4
	wr	%g1,	%o7,	%y
	rdpr	%cansave,	%g2
	rd	%softint,	%l3
	wr	%g6,	%g7,	%clear_softint
	tn	%icc,	0x6
	rd	%asi,	%i4
	ldd	[%l7 + 0x38],	%f8
	fcmple16	%f4,	%f16,	%i3
	orcc	%i2,	%o5,	%o3
	fblg	%fcc2,	loop_1037
	wr	%l4,	%o0,	%softint
	fandnot1s	%f1,	%f23,	%f0
	rdpr	%otherwin,	%l6
loop_1037:
	rdhpr	%hintp,	%l1
	rdhpr	%hpstate,	%i5
	fpadd32s	%f10,	%f1,	%f16
	wr	%o2,	%i7,	%y
	wrpr	%i6,	%g5,	%tick
	rdpr	%tl,	%l0
	movleu	%icc,	%g3,	%i0
	edge8ln	%o6,	%l2,	%o4
	tpos	%xcc,	0x4
	te	%xcc,	0x0
	rd	%ccr,	%l5
	fcmpes	%fcc2,	%f8,	%f21
	fbue,a	%fcc0,	loop_1038
	tne	%icc,	0x1
	and	%o1,	%g4,	%g1
	wrpr	%i1,	%g2,	%cwp
loop_1038:
	rdhpr	%hpstate,	%o7
	wrpr	%g6,	0x0C5A,	%cwp
	edge16	%g7,	%l3,	%i3
	mulscc	%i4,	%i2,	%o5
	fcmpne16	%f2,	%f16,	%l4
	rd	%pc,	%o0
	rd	%ccr,	%l6
	movcc	%xcc,	%o3,	%l1
	movcc	%icc,	%i5,	%i7
	tcc	%icc,	0x2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xB44, 	%hsys_tick_cmpr
	sllx	%l0,	%g3,	%i0
	rd	%softint,	%g5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x639, 	%hsys_tick_cmpr
	rdhpr	%hpstate,	%l2
	fpadd16	%f4,	%f26,	%f16
	fmovrdgez	%o4,	%f24,	%f30
	movcs	%xcc,	%o1,	%l5
	edge16l	%g4,	%g1,	%i1
	rdhpr	%hpstate,	%o7
	wrpr	%g6,	0x1663,	%tick
	fmovspos	%icc,	%f6,	%f21
	wrpr	%g7,	0x17B7,	%pil
	wr	%g2,	0x17D4,	%set_softint
	array16	%i3,	%i4,	%l3
	fnot1s	%f13,	%f6
	wrpr	%i2,	%l4,	%pil
	movre	%o5,	0x192,	%o0
	rd	%sys_tick_cmpr,	%l6
	rd	%asi,	%o3
	movgu	%icc,	%i5,	%l1
	tvs	%icc,	0x3
	movcs	%xcc,	%i7,	%i6
	rdpr	%gl,	%o2
	faligndata	%f30,	%f26,	%f28
	fmovrslez	%l0,	%f21,	%f28
	tn	%xcc,	0x3
	wr	%g3,	%i0,	%pic
	orncc	%o6,	0x05EB,	%g5
	rdpr	%tba,	%l2
	andn	%o4,	0x1826,	%l5
	rdhpr	%hpstate,	%o1
	sll	%g4,	0x17,	%i1
	rdhpr	%hsys_tick_cmpr,	%g1
	brgez	%g6,	loop_1039
	addc	%g7,	%o7,	%i3
	fmovspos	%icc,	%f14,	%f18
	rd	%pc,	%i4
loop_1039:
	movg	%xcc,	%l3,	%i2
	membar	0x73
	fbuge	%fcc3,	loop_1040
	fpmerge	%f5,	%f19,	%f4
	fnand	%f6,	%f20,	%f6
	movg	%icc,	%l4,	%o5
loop_1040:
	movvs	%icc,	%g2,	%o0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x2A6, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fnand	%f12,	%f4,	%f10
	rdpr	%wstate,	%i5
	fmovsl	%xcc,	%f5,	%f8
	edge32l	%i7,	%o2,	%i6
	rd	%tick_cmpr,	%l0
	sir	0x055E

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x669, 	%hsys_tick_cmpr
	wrpr	%o6,	0x011B,	%cwp
	fxor	%f12,	%f2,	%f22
	rdpr	%tba,	%g3
	fpsub16s	%f17,	%f15,	%f12
	alignaddrl	%g5,	%l2,	%o4
	fabss	%f0,	%f10
	tvs	%xcc,	0x4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	bcc,pt	%icc,	loop_1041
        wr    %g0,    0xe,    %pcr    ! changed.
	rdhpr	%hpstate,	%g4
	wrpr	%g1,	0x123A,	%cwp
loop_1041:
	tge	%xcc,	0x2
	wrpr	%g7,	%g6,	%cwp
	rdhpr	%hintp,	%i3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	rdpr	%tba,	%i2
	rdpr	%wstate,	%l4
	mulscc	%o5,	0x107C,	%o7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%l6,	%o3,	%tick
	tge	%icc,	0x4
	rd	%y,	%o0
	fsrc1s	%f31,	%f25
	addc	%l1,	%i7,	%i5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x960, 	%hsys_tick_cmpr
	rd	%y,	%i6
	array8	%l0,	%i0,	%o6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	movrgz	%g5,	0x146,	%o4
	tleu	%icc,	0x1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	movle	%icc,	%i1,	%l5
	xorcc	%g4,	%g7,	%g1
	rdpr	%cleanwin,	%i3
	rdhpr	%hpstate,	%i4
	wr	%g6,	0x06A8,	%set_softint
	wrpr	%i2,	%l3,	%tick
	movcc	%xcc,	%l4,	%o7
	wrpr	%o5,	%l6,	%tick
	wrpr	%g2,	%o3,	%tick
	rdpr	%cleanwin,	%l1
	fnor	%f30,	%f6,	%f26
	alignaddrl	%o0,	%i7,	%o2
	rdhpr	%hpstate,	%i5
	rdhpr	%hintp,	%l0
	rdpr	%gl,	%i6
	rd	%tick_cmpr,	%o6
	wrpr	%i0,	%g3,	%tick
	rdhpr	%hintp,	%l2
	membar	0x41
	edge16n	%o4,	%g5,	%i1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%g4,	%g7,	%tick
	wrpr	%g1,	0x1805,	%pil
	fnot1	%f14,	%f10
	rd	%sys_tick_cmpr,	%o1
	brlz,a	%i4,	loop_1042
	bge,a,pn	%icc,	loop_1043
	rdpr	%cleanwin,	%g6
	fbl,a	%fcc0,	loop_1044
loop_1042:
	movgu	%icc,	%i2,	%l3
loop_1043:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fbug	%fcc2,	loop_1045
loop_1044:
	fmul8x16	%f0,	%f20,	%f12
	rdhpr	%hpstate,	%o7
	rd	%tick_cmpr,	%o5
loop_1045:
	smulcc	%l6,	0x1B27,	%i3
	orcc	%o3,	0x0554,	%l1
	fcmpne16	%f30,	%f14,	%g2
	wrpr	%i7,	%o0,	%pil
	wr	%i5,	%o2,	%ccr
	rd	%pc,	%i6
	ldsb	[%l7 + 0x52],	%l0
	wr 	%g0, 	0x4, 	%fprs
	rd	%tick_cmpr,	%g3
	rdhpr	%hsys_tick_cmpr,	%i0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x98A, 	%hsys_tick_cmpr
	wrpr	%g5,	%l2,	%tick
	edge32l	%i1,	%g4,	%g7
	add	%g1,	0x1A9F,	%o1
	fmovdvc	%xcc,	%f10,	%f19
	andncc	%l5,	%g6,	%i2
	fble,a	%fcc3,	loop_1046
	move	%xcc,	%l3,	%i4
	rd	%sys_tick_cmpr,	%o7
	fcmpne32	%f18,	%f12,	%l4
loop_1046:
	rdhpr	%hpstate,	%o5
	rdhpr	%hpstate,	%i3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%fprs,	%g2
	bg,pn	%xcc,	loop_1047
	rdhpr	%htba,	%l1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	tge	%xcc,	0x1
loop_1047:
	rdpr	%canrestore,	%i7
	rdhpr	%hintp,	%i5
	wrpr	%o2,	0x03BB,	%pil
	ld	[%l7 + 0x28],	%f3
	wr	%l0,	0x195F,	%softint
	brnz,a	%o6,	loop_1048
	fsrc1s	%f8,	%f29
	wrpr	%g3,	%i0,	%cwp
	wr 	%g0, 	0x4, 	%fprs
loop_1048:
	movle	%icc,	%o4,	%i1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
        wr    %g0,    0xe,    %pcr    ! changed.
	rd	%pc,	%g4
	std	%g0,	[%l7 + 0x20]
	rdhpr	%hpstate,	%l5
	tgu	%xcc,	0x3
	rd	%tick_cmpr,	%g6
	edge32ln	%o1,	%l3,	%i2
	fmovrsgez	%i4,	%f9,	%f4
	wrpr	%o7,	%l4,	%cwp
	wrpr	%i3,	%o5,	%tick
	tg	%xcc,	0x6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x621, 	%hsys_tick_cmpr
	rd	%sys_tick_cmpr,	%o3
	rdpr	%canrestore,	%l1
	movge	%icc,	%o0,	%i7
	wrpr	%g2,	%i5,	%cwp
	fxnor	%f20,	%f24,	%f22
	rdpr	%tl,	%o2
	rdpr	%otherwin,	%o6
	addc	%l0,	%i0,	%g3
	wr	%g0,	0x89,	%asi
	lduwa	[%l7 + 0x60] %asi,	%g5
	wr	%o4,	0x0EAF,	%sys_tick
	add	%l7,	0x50,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%i6,	%i1
	rdhpr	%hintp,	%g7
	rdpr	%cansave,	%l2
	rdhpr	%htba,	%g1
	wrpr	%g4,	%g6,	%pil
	movle	%xcc,	%o1,	%l3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	set	0x5F, %g1
	ldsba	[%l7 + %g1] 0x04,	%i4
	move	%xcc,	%l4,	%i3
	rdhpr	%hintp,	%o7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x2EB, 	%hsys_tick_cmpr
	mova	%icc,	%o3,	%l1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xF8B, 	%hsys_tick_cmpr
	bvc,a,pt	%xcc,	loop_1049
	wr	%g2,	0x098D,	%clear_softint
	fpadd32	%f20,	%f30,	%f14
	edge16n	%i5,	%o0,	%o2
loop_1049:
	pdist	%f24,	%f18,	%f16

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
	rdpr	%pil,	%i0
	fbg	%fcc0,	loop_1050
	fxnors	%f7,	%f21,	%f5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%g5,	0x0362,	%pil
loop_1050:
	mulx	%g3,	%o4,	%i1
	rdpr	%canrestore,	%i6
	movl	%icc,	%g7,	%g1
	rdpr	%tba,	%g4
	addcc	%g6,	0x1096,	%o1
	rdpr	%gl,	%l2
	nop
	setx loop_1051, %l0, %l1
	jmpl %l1, %l3
	nop
	set	0x70, %g6
	ldd	[%l7 + %g6],	%f8
	wrpr	%l5,	%i4,	%cwp
	rdhpr	%hsys_tick_cmpr,	%l4
loop_1051:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x888, 	%hsys_tick_cmpr
	array16	%o7,	%l6,	%o5
	wrpr	%l1,	%o3,	%tick
	fmovsge	%xcc,	%f7,	%f26
	tne	%icc,	0x3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fbne,a	%fcc1,	loop_1052
	tle	%icc,	0x3
	wrpr	%g2,	%i5,	%cwp
	tpos	%xcc,	0x4
loop_1052:
	ldd	[%l7 + 0x38],	%o0
	rd	%softint,	%o6
	movleu	%icc,	%i0,	%l0
	fmovrdlez	%o2,	%f24,	%f0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr 	%g0, 	0x7, 	%fprs
	movvc	%icc,	%g7,	%i1
	rd	%tick_cmpr,	%g1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movpos	%xcc,	%g4,	%o1
	wrpr	%l2,	0x1C26,	%cwp
	movneg	%xcc,	%g6,	%l3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xA94, 	%hsys_tick_cmpr
	fbge,a	%fcc3,	loop_1053
	tleu	%xcc,	0x6
	movg	%xcc,	%i4,	%i3
	mulscc	%i2,	%l4,	%l6
loop_1053:
	nop
	setx loop_1054, %l0, %l1
	jmpl %l1, %o5
	fbule,a	%fcc2,	loop_1055
	ldsb	[%l7 + 0x77],	%l1
	wr	%o7,	0x03F0,	%set_softint
loop_1054:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x19F, 	%hsys_tick_cmpr
loop_1055:
	sra	%i7,	0x01,	%g2
	sllx	%i5,	0x1D,	%o0
	fmovrdlz	%o6,	%f18,	%f0
	rdhpr	%hintp,	%i0
	fmul8x16	%f29,	%f12,	%f4
	taddcc	%o2,	0x0C2C,	%g5
	andncc	%l0,	%o4,	%g3
	popc	0x134D,	%g7
	rdpr	%cwp,	%i1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%pc,	%i6
	rd	%fprs,	%o1
	rdhpr	%hsys_tick_cmpr,	%l2
	wr	%g4,	0x067A,	%sys_tick
        wr    %g0,    0xe,    %pcr    ! changed.
	add	%l7,	0x40,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] %asi,	%i4,	%i3
	wrpr	%l3,	%i2,	%cwp
	wrpr	%l4,	%l6,	%tick
	rdpr	%pil,	%o5
	rd	%fprs,	%l1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%o7,	%g2,	%ccr
	rdpr	%wstate,	%i5
	rdhpr	%hpstate,	%i7
	membar	0x40
	movpos	%xcc,	%o0,	%i0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	udiv	%g5,	0x18BA,	%l0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xE4A, 	%hsys_tick_cmpr
	fba	%fcc0,	loop_1056
        wr    %g0,    0xe,    %pcr    ! changed.

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xA20, 	%tick_cmpr
	fones	%f31
loop_1056:
	wrpr	%i6,	%o1,	%pil
	rd	%y,	%g1
	bg,pn	%icc,	loop_1057
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g4,	%l2,	%clear_softint

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xEC2, 	%hsys_tick_cmpr
loop_1057:
	wr	%i3,	0x1911,	%set_softint
	ldsw	[%l7 + 0x2C],	%l3
	add	%l7,	0x48,	%l6
	wr	%g0,	0x18,	%asi
	casxa	[%l6] %asi,	%i4,	%i2
	rdpr	%otherwin,	%l4
	rd	%asi,	%l6
	alignaddrl	%o5,	%l1,	%o7
	subccc	%g2,	0x0C3A,	%o3
	edge8n	%i7,	%o0,	%i0
	fsrc1	%f0,	%f22
	fbe,a	%fcc1,	loop_1058
	rd	%fprs,	%o2
	wr	%i5,	0x0908,	%softint
	rd	%ccr,	%g5
loop_1058:
	rdhpr	%hpstate,	%l0
	edge32	%g3,	%o6,	%g7
	rdpr	%gl,	%i1
	alignaddrl	%o4,	%o1,	%g1
	wrpr	%i6,	0x0C17,	%tick
	rd	%softint,	%g4
	fbn	%fcc3,	loop_1059
	rdpr	%canrestore,	%g6
	fcmped	%fcc2,	%f8,	%f2
	tl	%icc,	0x6
loop_1059:
	rdhpr	%hintp,	%l2
	wr	%g0,	0x80,	%asi
	sta	%f6,	[%l7 + 0x48] %asi

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x19A, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xCED, 	%hsys_tick_cmpr
	rdpr	%cleanwin,	%l4
        wr    %g0,    0xe,    %pcr    ! changed.
	rd	%fprs,	%l6
	rdhpr	%htba,	%o5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	movg	%xcc,	%o7,	%o3
	fxnors	%f30,	%f5,	%f23
	orcc	%i7,	0x0284,	%i0
	andcc	%o2,	%i5,	%g5
	rdpr	%canrestore,	%l0
	wrpr	%o0,	%o6,	%tick
	wr	%g7,	0x125E,	%sys_tick
	rd	%y,	%i1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	fcmpeq16	%f30,	%f10,	%o1
	alignaddrl	%g1,	%i6,	%g4
	wr 	%g0, 	0x4, 	%fprs
	rdhpr	%hintp,	%o4
	wr	%l2,	%l3,	%clear_softint
	sethi	0x0C6A,	%i3
	add	%l5,	0x1433,	%i4
	rd	%pc,	%l4
        wr    %g0,    0xe,    %pcr    ! changed.
	be,a,pt	%icc,	loop_1060
	rd	%softint,	%o5
	rdhpr	%hintp,	%l1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x920, 	%hsys_tick_cmpr
loop_1060:
	wrpr	%o3,	%o7,	%pil
	rd	%sys_tick_cmpr,	%i0
	rdhpr	%hintp,	%i7
	movrlez	%o2,	0x128,	%g5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x448, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xACA, 	%sys_tick_cmpr
	wr	%g7,	0x162C,	%pic
	mova	%xcc,	%i1,	%g3
	rd	%ccr,	%l0
	rdpr	%canrestore,	%g1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x4EC, 	%hsys_tick_cmpr
	fnors	%f25,	%f24,	%f10
	wrpr	%i6,	%g6,	%pil
	tsubcc	%o4,	%g4,	%l2
	movn	%xcc,	%i3,	%l5
	rd	%ccr,	%i4
	wrpr	%l3,	%l4,	%tick
	brgez,a	%i2,	loop_1061
	wr 	%g0, 	0x4, 	%fprs
	rd	%ccr,	%g2
	fnands	%f17,	%f17,	%f22
loop_1061:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	mulx	%l1,	0x1A63,	%i0
	rd	%fprs,	%o7
	sir	0x0CEE

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xDC4, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	set	0x79, %i3
	ldstuba	[%l7 + %i3] 0x10,	%g5
	fcmpne16	%f24,	%f10,	%i5
	movle	%icc,	%o6,	%o0
	alignaddr	%g7,	%g3,	%i1
	rdhpr	%htba,	%g1
	fxors	%f12,	%f18,	%f14
	rdhpr	%hpstate,	%o1
	fble	%fcc1,	loop_1062
	st	%f24,	[%l7 + 0x08]
	tne	%xcc,	0x4
	rdhpr	%hpstate,	%i6
loop_1062:
	movpos	%icc,	%g6,	%o4
	wr	%g4,	%l0,	%set_softint
	fbuge,a	%fcc1,	loop_1063
	fmovsgu	%xcc,	%f27,	%f31
	rdpr	%otherwin,	%l2
        wr    %g0,    0xe,    %pcr    ! changed.
loop_1063:
        wr    %g0,    0xe,    %pcr    ! changed.
	mova	%xcc,	%l3,	%l4
	movcc	%xcc,	%l6,	%o5
	wr	%g2,	%i2,	%y
	subc	%o3,	%i0,	%l1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdhpr	%hintp,	%o7
	wrpr	%o2,	%g5,	%cwp
	movrgz	%i5,	%o6,	%g7
	edge16n	%g3,	%o0,	%i1
	sdivx	%o1,	0x1F98,	%i6
	andn	%g1,	0x0D52,	%o4
	wrpr	%g6,	0x19D0,	%tick
	te	%icc,	0x7
	sdiv	%l0,	0x0B37,	%l2
	tle	%icc,	0x6
	xnor	%i3,	0x12D6,	%l5
	wrpr	%i4,	%l3,	%cwp
	wrpr	%g4,	%l4,	%tick
	wrpr	%o5,	%g2,	%cwp
	rdhpr	%hintp,	%i2
	fsrc2s	%f24,	%f6
	alignaddr	%l6,	%o3,	%l1
	wrpr	%i0,	0x029F,	%cwp
	fbu,a	%fcc2,	loop_1064
	tsubcctv	%i7,	0x1ED3,	%o7
	srl	%g5,	%i5,	%o2
	rdhpr	%hpstate,	%o6
loop_1064:
	sethi	0x194C,	%g3
	wr	%g7,	%i1,	%y
	wrpr	%o1,	%i6,	%tick
	rd	%tick_cmpr,	%o0
	fxor	%f24,	%f2,	%f20
	rd	%ccr,	%o4
        wr    %g0,    0xe,    %pcr    ! changed.

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x007, 	%hsys_tick_cmpr
	fcmple16	%f8,	%f2,	%l2
	addcc	%i3,	%i4,	%l5
	tpos	%icc,	0x6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xD42, 	%hsys_tick_cmpr
	wrpr	%l4,	0x0936,	%tick
	rd	%pc,	%o5
	wrpr	%i2,	%g2,	%pil
	tge	%xcc,	0x4
	brnz	%o3,	loop_1065
	rdpr	%canrestore,	%l1
	udivcc	%l6,	0x1DF8,	%i7
	movneg	%xcc,	%i0,	%o7
loop_1065:
	wr	%i5,	%g5,	%pic
	wr	%o6,	0x0182,	%ccr
	rd	%asi,	%g3
	andcc	%o2,	%g7,	%o1
	nop
	set	0x40, %i2
	std	%i6,	[%l7 + %i2]
	array32	%i1,	%o4,	%g6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fmovrse	%o0,	%f30,	%f27
	wrpr	%g1,	0x0DF3,	%cwp
	nop
	setx loop_1066, %l0, %l1
	jmpl %l1, %i3
	rdhpr	%hsys_tick_cmpr,	%l2
	edge8ln	%l5,	%i4,	%g4
	fmovsleu	%icc,	%f16,	%f5
loop_1066:
	tg	%xcc,	0x6
	rdhpr	%hintp,	%l4
	wr	%l3,	0x04B2,	%sys_tick
	fnegd	%f18,	%f26
	rd	%sys_tick_cmpr,	%o5
	rdpr	%wstate,	%i2
	rdpr	%gl,	%o3
	fmul8ulx16	%f28,	%f18,	%f10
	wrpr	%l1,	0x0F6D,	%cwp
	srax	%l6,	0x1D,	%g2
	rd	%fprs,	%i0
	addcc	%o7,	0x1BBE,	%i5
	srlx	%g5,	%o6,	%g3
	rdpr	%gl,	%i7
	ble,pt	%xcc,	loop_1067
	wrpr	%g7,	%o1,	%tick
	tvs	%xcc,	0x3
	wrpr	%i6,	0x1EF8,	%cwp
loop_1067:
	rd	%sys_tick_cmpr,	%o2
	wr	%i1,	0x04F0,	%softint
	rd	%y,	%o4
	edge16ln	%l0,	%o0,	%g1
	fmovd	%f28,	%f20
	wrpr	%i3,	0x0F6E,	%pil
	fcmps	%fcc3,	%f7,	%f17
	set	0x30, %i4
	ldda	[%l7 + %i4] 0x2f,	%l2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	be,pn	%xcc,	loop_1068
loop_1068:
	nop

	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 0:
!
!	Type l   	: 1083
!	Type a   	: 10673
!	Type cti   	: 1068
!	Type x   	: 534
!	Type f   	: 1649
!	Type i   	: 4993
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


	EXIT_GOOD	/* test finish  */

/************************************************************************
   Test case data start
 ************************************************************************/
.data
user_data_start:
scratch_area:
.word 0xC9B8F322
.word 0x10D6A048
.word 0x16117660
.word 0x41D7DA69
.word 0x876642B8
.word 0x8DA9A3BB
.word 0xAB30A979
.word 0xB552E6FA
.word 0xED433AE0
.word 0x5A2C1B74
.word 0x0F0FE7A5
.word 0x351FC7B5
.word 0x9969A134
.word 0xAA90E98A
.word 0xC794ACB4
.word 0x42C00804
.word 0xE8195ABB
.word 0x90D33E32
.word 0xC0A707CD
.word 0xB1663B24
.word 0x94ADF7CE
.word 0xB6B67699
.word 0x44CA45B5
.word 0x4EE8012B
.word 0xD4A3290B
.word 0x264D998F
.word 0x56631337
.word 0x38AE761E
.word 0x5D48ADB3
.word 0xB16AEDA7
.word 0xC72A9B98
.word 0xEE190953
.word 0xA710D280
.word 0x635419DD
.word 0x94E720D5
.word 0xD576FABC
.word 0x2B2F491F
.word 0x85CDD241
.word 0x692113E6
.word 0x1C537AAA
.word 0x60EEA3EA
.word 0x46F9F78D
.word 0xF4FC3FBE
.word 0x9CB69677
.word 0x8D0BF62A
.word 0x1B559B03
.word 0xC34D10DC
.word 0xD5828A7E
.word 0x75F092FD
.word 0xE9E5EED4
.word 0xF1384B59
.word 0x7F28E14F
.word 0x4046768D
.word 0xC347D12F
.word 0xA239F209
.word 0xE7CAF715
.word 0xE0B610B8
.word 0xEB116AF1
.word 0x7E1E0EEF
.word 0xF4EB5A6F
.word 0x0566AFE4
.word 0xE6F2FEBF
.word 0xC8B840BC
.word 0x748446E2
.end
