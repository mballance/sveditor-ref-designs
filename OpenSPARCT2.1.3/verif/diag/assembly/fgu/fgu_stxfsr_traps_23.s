/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: fgu_stxfsr_traps_23.s
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
.ident "FOCUSCASE: focus.pm,v 1.1 2003/04/23 17:53:39 somePerson Exp somePerson $ spc_basic_isa3.pl FOCUS_SEED=1238790"
.ident "Mon Dec  8 19:56:46 CST 2003"
.ident "Using Instruction Hash for Focus :$Id: fgu_stxfsr_traps_23.s,v 1.4 2007/07/27 21:45:32 drp Exp $"
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
	set	0x7,	%g1
	set	0x4,	%g2
	set	0xB,	%g3
	set	0x1,	%g4
	set	0xA,	%g5
	set	0xE,	%g6
	set	0x0,	%g7
	!# Input registers
	set	-0x1,	%i0
	set	-0xC,	%i1
	set	-0xD,	%i2
	set	-0xB,	%i3
	set	-0x4,	%i4
	set	-0x9,	%i5
	set	-0x8,	%i6
	set	-0x6,	%i7
	!# Local registers
	set	0x64163A83,	%l0
	set	0x3050C94B,	%l1
	set	0x550190D2,	%l2
	set	0x4315A51E,	%l3
	set	0x1A17E749,	%l4
	set	0x28A15890,	%l5
	set	0x4AECE499,	%l6
	!# Output registers
	set	-0x0DB0,	%o0
	set	0x0001,	%o1
	set	0x07D8,	%o2
	set	0x09EF,	%o3
	set	-0x17F7,	%o4
	set	-0x000E,	%o5
	set	0x1EB6,	%o6
	set	-0x0F5E,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x5CDEBE004C9316D6)
	INIT_TH_FP_REG(%l7,%f2,0x5AF70778F0C4B088)
	INIT_TH_FP_REG(%l7,%f4,0x8D7526625EC515A4)
	INIT_TH_FP_REG(%l7,%f6,0xE02F1C846E8760CC)
	INIT_TH_FP_REG(%l7,%f8,0x0321EB208EE2B95B)
	INIT_TH_FP_REG(%l7,%f10,0x2389D1100A6649F3)
	INIT_TH_FP_REG(%l7,%f12,0x67131F7252CC89E3)
	INIT_TH_FP_REG(%l7,%f14,0xE9E42F7A627F9BF1)
	INIT_TH_FP_REG(%l7,%f16,0x768EE71D99271671)
	INIT_TH_FP_REG(%l7,%f18,0x7E12787768E2C912)
	INIT_TH_FP_REG(%l7,%f20,0x308AE9F847B82508)
	INIT_TH_FP_REG(%l7,%f22,0x4821D99235B5284B)
	INIT_TH_FP_REG(%l7,%f24,0xE1625C0F20759DEE)
	INIT_TH_FP_REG(%l7,%f26,0x376BF26EBED9E858)
	INIT_TH_FP_REG(%l7,%f28,0x3F3211F11C669311)
	INIT_TH_FP_REG(%l7,%f30,0xEE9DF5D905EBEBD1)

	!# Execute Main Diag ..

	edge8ln	%o3,	%l3,	%i5
	fcmpeq16	%f6,	%f22,	%l4
	edge16ln	%g5,	%l1,	%g4
	fbe,a	%fcc1,	loop_1
	fbe,pt	%fcc3,	loop_2
	brz,a,pt	%o2,	loop_3
	nop
	set	0x60, %l1
	stx	%fsr,	[%l7 + %l1]
loop_1:
	movrgez	%g1,	0x0AB,	%g3
loop_2:
	movl	%fcc3,	%i6,	%l2
loop_3:
	movcc	%icc,	%o7,	%i2
	edge8	%g6,	%i4,	%o4
	tn	%xcc,	0x2
	wrpr	%i0,	0x0EEC,	%cwp
	ldsh	[%l7 + 0x4C],	%g7
	alignaddr	%i1,	%l5,	%g2
	nop
	setx	0x173F,	%l0,	%i7
	udiv	%o5,	%i7,	%l0
	fnot1s	%f14,	%f6
	stx	%fsr,	[%l7 + 0x10]
	rdhpr	%ver,	%o6
	fmovsn	%fcc0,	%f21,	%f8
	wr	%o1,	0x1AD4,	%y
	subc	%i3,	0x0F40,	%o0
	edge32	%l6,	%l3,	%i5
	nop
	set	0x50, %l5
	stx	%fsr,	[%l7 + %l5]
	fnors	%f27,	%f0,	%f31
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	rdpr	%canrestore,	%o3
	tneg	%xcc,	0x2
	nop
	setx	0xEC18A098,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f20
	setx	0xAFDEA40A,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f13
	fdivs	%f13,	%f20,	%f30
	fabss	%f12,	%f15
	nop
	setx	0xD4213CB55FC65762,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0x636BE8DAFAE076F1,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	fdivd	%f24,	%f16,	%f4
	nop
	set	0x08, %o1
	stx	%fsr,	[%l7 + %o1]
	wrpr	%l4,	%l1,	%cwp
	edge8n	%g5,	%o2,	%g1
	ble,a	%icc,	loop_4
	nop
	set	0x78, %l4
	stx	%fsr,	[%l7 + %l4]
	stx	%fsr,	[%l7 + 0x58]
	fmovsgu	%xcc,	%f27,	%f25
loop_4:
	fcmped	%fcc1,	%f16,	%f26
	movule	%fcc0,	0x246,	%g4
	tn	%xcc,	0x6
	nop
	fitos	%f7,	%f8
	rd	%softint,	%g3
	fnegs	%f0,	%f26
	tneg	%xcc,	0x7
	fmovrdlz	%i6,	%f18,	%f30
	tl	%xcc,	0x3
	fmovdo	%fcc0,	%f16,	%f26
	orncc	%l2,	%o7,	%g6
	nop
	fitod	%f0,	%f20
	fdtox	%f20,	%f28
	ldx	[%l7 + 0x40],	%i4
	nop
	set	0x48, %o6
	stx	%i2,	[%l7 + %o6]
	fandnot2	%f20,	%f30,	%f18
	be,pt	%xcc,	loop_5
	brz	%o4,	loop_6
	fmovda	%fcc1,	%f10,	%f2
	fmovsgu	%icc,	%f10,	%f27
loop_5:
	fxors	%f16,	%f3,	%f21
loop_6:
	nop
	set	0x70, %g3
	stx	%fsr,	[%l7 + %g3]
	nop
	set	0x20, %l0
	ldd	[%l7 + %l0],	%g6
	rd	%sys_tick_cmpr,	%i1
	pdist	%f6,	%f26,	%f28
	fmovrsgz	%i0,	%f28,	%f15
	fmovd	%f28,	%f14
	set	0x40, %o2
	stda	%f0,	[%l7 + %o2] 0xf9
	membar	#Sync
	mulx	%g2,	%o5,	%l5
	nop
	setx	0x0C59,	%l1,	%l0
	sdivx	%i7,	%l0,	%o1
	fornot2s	%f17,	%f13,	%f22
	movg	%icc,	%o6,	%o0
	nop
	set	0x40, %i0
	stx	%fsr,	[%l7 + %i0]
	fpack16	%f18,	%f19
	xor	%i3,	%l6,	%l3
	stx	%fsr,	[%l7 + 0x50]
	mulscc	%i5,	%l4,	%l1
	nop
	set	0x08, %i6
	stx	%fsr,	[%l7 + %i6]
	nop
	set	0x78, %o3
	stx	%fsr,	[%l7 + %o3]
	orncc	%o3,	%g5,	%o2
	srax	%g1,	0x0A,	%g4
	nop
	set	0x20, %g2
	stx	%fsr,	[%l7 + %g2]
	nop
	set	0x78, %i4
	stx	%fsr,	[%l7 + %i4]
	ba,a	%icc,	loop_7
	nop
	setx	loop_8,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x011100001402,	%l0,	%l1
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
	nop
	set	0x08, %l2
	stx	%fsr,	[%l7 + %l2]
	nop
	fitod	%f12,	%f14
	fdtoi	%f14,	%f30
loop_7:
	subcc	%i6,	%l2,	%g3
loop_8:
	nop
	set	0x40, %g1
	stx	%fsr,	[%l7 + %g1]
	fbue,pt	%fcc1,	loop_9
	tcs	%xcc,	0x5
	brgz,a,pn	%o7,	loop_10
	movule	%fcc2,	0x3EC,	%i4
loop_9:
	std	%f30,	[%l7 + 0x50]
	movo	%fcc2,	0x138,	%g6
loop_10:
	bvs,a	%xcc,	loop_11
	siam	0x4
	siam	0x3
	stx	%fsr,	[%l7 + 0x30]
loop_11:
	stx	%fsr,	[%l7 + 0x70]
	tsubcctv	%o4,	%i2,	%i1
	movuge	%fcc2,	%g7,	%i0
	edge16l	%o5,	%l5,	%g2
	tne	%xcc,	0x7
	set	0x50, %i5
	lda	[%l7 + %i5] 0x81,	%f16
	wr	%i7,	0x0A2B,	%y
	array32	%l0,	%o6,	%o1
	stx	%fsr,	[%l7 + 0x20]
	wrpr	%o0,	0x0F90,	%tick
	nop
	fitos	%f18,	%f1
	movrne	%i3,	%l6,	%i5
	fmovd	%f2,	%f28
	fmovdug	%fcc0,	%f0,	%f30
	fmovdug	%fcc2,	%f20,	%f12
	tsubcctv	%l3,	%l4,	%l1
	nop
	set	0x58, %g6
	stx	%fsr,	[%l7 + %g6]
	nop
	set	0x58, %i1
	stx	%fsr,	[%l7 + %i1]
	rdhpr	%hpstate,	%o3
	fmovdue	%fcc3,	%f18,	%f2
	fmul8ulx16	%f0,	%f22,	%f24
	fmovrsne	%g5,	%f30,	%f19
	fbul,a,pn	%fcc3,	loop_12
	stx	%fsr,	[%l7 + 0x78]
	rdpr	%canrestore,	%g1
	array32	%g4,	%o2,	%l2
loop_12:
	nop
	set	0x70, %o7
	stx	%fsr,	[%l7 + %o7]
	andcc	%g3,	0x1957,	%i6
	taddcc	%o7,	0x0CC7,	%i4
	fmovrse	%g6,	%f20,	%f24
	fmul8ulx16	%f12,	%f18,	%f26
	set	0x78, %g7
	stxa	%i2,	[%l7 + %g7] 0x0c
	wr	%g0,	0x50,	%asi
	ldxa	[%g0 + 0x00] %asi,	%o4
	nop
	set	0x28, %g5
	stx	%fsr,	[%l7 + %g5]
	fpack32	%f20,	%f10,	%f10
	fmul8sux16	%f16,	%f6,	%f26
	fbul,pt	%fcc1,	loop_13
	bl,pt	%icc,	loop_14
	fzeros	%f14
	fnands	%f12,	%f27,	%f4
loop_13:
	nop
	set	0x78, %o5
	stx	%fsr,	[%l7 + %o5]
loop_14:
	nop
	setx	0x377AD13AD769BF4F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	fsqrtd	%f26,	%f26
	fands	%f19,	%f15,	%f26
	nop
	setx	0xBC10249F2EBA34D4,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0xE0C6671FC357E567,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	fdivd	%f6,	%f6,	%f24
	tge	%xcc,	0x0
	ba,a	%icc,	loop_15
	xnor	%g7,	0x1EFD,	%i0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x73A, 	%hsys_tick_cmpr
	ld	[%l7 + 0x64],	%f27
loop_15:
	fmovdue	%fcc0,	%f6,	%f6
	movrgz	%i1,	0x184,	%g2
	stx	%fsr,	[%l7 + 0x28]
	fnegd	%f2,	%f30

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x5C9, 	%hsys_tick_cmpr
	stx	%fsr,	[%l7 + 0x50]
	stx	%fsr,	[%l7 + 0x08]
	fnand	%f12,	%f6,	%f4
	fmovsvc	%xcc,	%f18,	%f0
	stx	%fsr,	[%l7 + 0x40]
	tneg	%xcc,	0x0
	movle	%xcc,	0x0E6,	%o6
	fpack16	%f18,	%f30
	stx	%fsr,	[%l7 + 0x60]

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x639, 	%hsys_tick_cmpr
	fmovs	%f26,	%f24
	stx	%fsr,	[%l7 + 0x28]
	orncc	%i3,	%l0,	%i5
	rdhpr	%ver,	%l6
	fmovrslez	%l3,	%f5,	%f17
	faligndata	%f18,	%f22,	%f26
	fmovdle	%fcc3,	%f8,	%f6
	nop
	fitod	%f2,	%f8
	fdtoi	%f8,	%f0
	movrne	%l4,	%o3,	%l1
	rdhpr	%htba,	%g1
	nop
	set	0x28, %o4
	stx	%fsr,	[%l7 + %o4]
	stx	%fsr,	[%l7 + 0x78]
	nop
	fitod	%f8,	%f0
	fdtoi	%f0,	%f3
	nop
	set	0x30, %i7
	stx	%fsr,	[%l7 + %i7]
	pdist	%f0,	%f4,	%f18
	fand	%f22,	%f8,	%f30
	nop
	set	0x20, %i2
	stx	%fsr,	[%l7 + %i2]
	fone	%f24
	rd	%y,	%g4
	movgu	%xcc,	0x244,	%o2
	fxnors	%f20,	%f5,	%f8
	srlx	%g5,	0x0E,	%g3
	stx	%fsr,	[%l7 + 0x50]
	nop
	set	0x40, %g4
	stx	%fsr,	[%l7 + %g4]
	fmovdge	%xcc,	%f4,	%f30
	nop
	set	0x40, %o0
	stx	%fsr,	[%l7 + %o0]
	tsubcc	%i6,	%l2,	%i4
	nop
	setx	0x0198,	%l0,	%o7
	sdivx	%g6,	%o7,	%i2
	fornot1s	%f4,	%f28,	%f28
	nop
	setx	loop_16,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x004400001404,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fmovdue	%fcc0,	%f26,	%f30
	fmovsl	%fcc3,	%f14,	%f17
	stx	%fsr,	[%l7 + 0x28]
loop_16:
	stx	%fsr,	[%l7 + 0x58]
	nop
	fitos	%f5,	%f27
	fstod	%f27,	%f24
	edge8n	%g7,	%i0,	%o5
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 0:
!
!	Type l   	: 49
!	Type a   	: 17
!	Type x   	: 4
!	Type cti   	: 16
!	Type f   	: 62
!	Type i   	: 52
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
	set	0x9,	%g1
	set	0x7,	%g2
	set	0x2,	%g3
	set	0x9,	%g4
	set	0x3,	%g5
	set	0xC,	%g6
	set	0x9,	%g7
	!# Input registers
	set	-0x1,	%i0
	set	-0x3,	%i1
	set	-0x1,	%i2
	set	-0x0,	%i3
	set	-0xF,	%i4
	set	-0x7,	%i5
	set	-0x7,	%i6
	set	-0x6,	%i7
	!# Local registers
	set	0x7F46F6FB,	%l0
	set	0x62B750F9,	%l1
	set	0x76588A0C,	%l2
	set	0x0126A0FB,	%l3
	set	0x7B23A0CD,	%l4
	set	0x6014B0D5,	%l5
	set	0x28D6F064,	%l6
	!# Output registers
	set	-0x1790,	%o0
	set	0x1FB3,	%o1
	set	-0x1F12,	%o2
	set	-0x1E92,	%o3
	set	-0x1726,	%o4
	set	-0x1847,	%o5
	set	0x1FBC,	%o6
	set	0x18D4,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x5CDEBE004C9316D6)
	INIT_TH_FP_REG(%l7,%f2,0x5AF70778F0C4B088)
	INIT_TH_FP_REG(%l7,%f4,0x8D7526625EC515A4)
	INIT_TH_FP_REG(%l7,%f6,0xE02F1C846E8760CC)
	INIT_TH_FP_REG(%l7,%f8,0x0321EB208EE2B95B)
	INIT_TH_FP_REG(%l7,%f10,0x2389D1100A6649F3)
	INIT_TH_FP_REG(%l7,%f12,0x67131F7252CC89E3)
	INIT_TH_FP_REG(%l7,%f14,0xE9E42F7A627F9BF1)
	INIT_TH_FP_REG(%l7,%f16,0x768EE71D99271671)
	INIT_TH_FP_REG(%l7,%f18,0x7E12787768E2C912)
	INIT_TH_FP_REG(%l7,%f20,0x308AE9F847B82508)
	INIT_TH_FP_REG(%l7,%f22,0x4821D99235B5284B)
	INIT_TH_FP_REG(%l7,%f24,0xE1625C0F20759DEE)
	INIT_TH_FP_REG(%l7,%f26,0x376BF26EBED9E858)
	INIT_TH_FP_REG(%l7,%f28,0x3F3211F11C669311)
	INIT_TH_FP_REG(%l7,%f30,0xEE9DF5D905EBEBD1)

	!# Execute Main Diag ..

	nop
	set	0x70, %i3
	stx	%fsr,	[%l7 + %i3]
	stw	%o4,	[%l7 + 0x64]
	mulx	%i1,	0x07BD,	%g2
	movcs	%xcc,	%l5,	%i7
	set	0x52, %l6
	stha	%o1,	[%l7 + %l6] 0x23
	membar	#Sync
	wr	%o6,	0x05B0,	%pic
	fmovsule	%fcc2,	%f1,	%f8
	xnorcc	%i3,	0x03A8,	%o0
	tg	%icc,	0x1
	nop
	set	0x58, %l3
	stx	%fsr,	[%l7 + %l3]
	fmul8x16au	%f4,	%f20,	%f24
	fbg	%fcc2,	loop_17
	movvc	%xcc,	0x500,	%i5
	fmovsneg	%icc,	%f28,	%f27
	subcc	%l0,	%l6,	%l3
loop_17:
	fmovsneg	%icc,	%f1,	%f12
	stx	%fsr,	[%l7 + 0x70]
	fmul8x16au	%f6,	%f30,	%f28
	nop
	set	0x68, %l1
	stx	%fsr,	[%l7 + %l1]
	fmovrsgz	%l4,	%f23,	%f15
	stx	%fsr,	[%l7 + 0x30]
	movcc	%xcc,	%l1,	%g1
	edge16n	%o3,	%o2,	%g4
	bge	%xcc,	loop_18
	stx	%fsr,	[%l7 + 0x28]
	fpadd32s	%f13,	%f26,	%f13
	bge	%xcc,	loop_19
loop_18:
	fxnors	%f17,	%f11,	%f4
	stx	%fsr,	[%l7 + 0x50]
	fmovsg	%fcc0,	%f4,	%f4
loop_19:
	array16	%g5,	%i6,	%g3
	nop
	set	0x78, %o1
	stx	%fsr,	[%l7 + %o1]
	nop
	set	0x58, %l4
	stx	%fsr,	[%l7 + %l4]
	nop
	set	0x47, %o6
	ldsb	[%l7 + %o6],	%l2
	wr	%g0,	0x88,	%asi
	ldsha	[%l7 + 0x42] %asi,	%g6
	sra	%o7,	%i2,	%i4
	fxor	%f18,	%f22,	%f10
	movcs	%icc,	0x5FF,	%g7
	stx	%fsr,	[%l7 + 0x50]
	taddcctv	%i0,	%o4,	%o5
	fmovs	%f5,	%f25
	nop
	set	0x08, %g3
	stx	%fsr,	[%l7 + %g3]
	movpos	%xcc,	%i1,	%g2
	taddcc	%l5,	%i7,	%o6
	movneg	%xcc,	0x0A9,	%i3
	fnand	%f26,	%f20,	%f24
	movvc	%xcc,	%o1,	%i5
	fmovdneg	%xcc,	%f8,	%f10
	nop
	set	0x50, %l0
	stx	%fsr,	[%l7 + %l0]
	tsubcctv	%o0,	%l6,	%l3
	nop
	fitos	%f11,	%f10
	nop
	set	0x40, %o2
	stx	%fsr,	[%l7 + %o2]
	add	%l7,	0x1C,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%l4,	%l0
	fmovsue	%fcc0,	%f11,	%f27
	fmovdcc	%xcc,	%f8,	%f10
	st	%fsr,	[%l7 + 0x34]
	alignaddr	%g1,	%l1,	%o2
	fblg,pt	%fcc1,	loop_20
	nop
	set	0x20, %i0
	stx	%fsr,	[%l7 + %i0]
	nop
	setx loop_21, %l0, %l1
	jmpl %l1, %g4
	wr	%o3,	%i6,	%set_softint
loop_20:
	fcmpne32	%f30,	%f28,	%g5
	nop
	set	0x68, %i6
	stx	%fsr,	[%l7 + %i6]
loop_21:
	movre	%l2,	0x1BC,	%g3
	fmovsneg	%xcc,	%f20,	%f31
	fxors	%f21,	%f29,	%f0
	rd	%sys_tick_cmpr,	%o7
	mulx	%g6,	%i2,	%i4
	add	%l7,	0x50,	%l6
	wr	%g0,	0x0c,	%asi
	lda	[%l6] %asi,	%g7
	casa	[%l6] %asi,	%g7,	%o4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fnot1	%f26,	%f0
	bleu,a,pt	%icc,	loop_22
	fmovrslez	%g2,	%f8,	%f16
	fmovdule	%fcc3,	%f30,	%f0
	stx	%fsr,	[%l7 + 0x50]
loop_22:
	nop
	set	0x20, %o3
	stx	%fsr,	[%l7 + %o3]
	nop
	set	0x38, %g2
	ldd	[%l7 + %g2],	%i0
	bleu,a,pt	%xcc,	loop_23
	movrne	%i7,	0x1B9,	%l5
	fmovdn	%fcc2,	%f10,	%f16
	pdist	%f16,	%f12,	%f20
loop_23:
	nop
	setx	0x434C2936,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f23
	setx	0x5A93855D,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f16
	fmuls	%f16,	%f23,	%f4
	fmovdl	%xcc,	%f22,	%f24
	fmovrdlez	%i3,	%f0,	%f30
	fmovdneg	%xcc,	%f22,	%f8
	fmovsgu	%xcc,	%f0,	%f2
	stx	%fsr,	[%l7 + 0x78]
	bcc,a,pn	%icc,	loop_24
	fmovse	%icc,	%f5,	%f19
	stx	%fsr,	[%l7 + 0x50]
	rd	%tick_cmpr,	%o1
loop_24:
	bne,pn	%icc,	loop_25
	nop
	set	0x78, %l5
	stx	%fsr,	[%l7 + %l5]
	stx	%fsr,	[%l7 + 0x28]
	fmovsgu	%xcc,	%f13,	%f31
loop_25:
	subc	%o6,	%o0,	%l6
	wrpr 	%g0, 	0x3, 	%gl
	membar	0x3E
	brgez,pn	%l0,	loop_26
	array16	%l4,	%g1,	%l1
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	array32	%o2,	%g4,	%o3
loop_26:
	nop
	set	0x78, %l2
	stx	%fsr,	[%l7 + %l2]
	movl	%icc,	%i6,	%l2
	tvs	%icc,	0x2
	stx	%fsr,	[%l7 + 0x38]
	movge	%xcc,	0x5A3,	%g3
	fpsub32	%f14,	%f18,	%f24
	fcmpd	%fcc2,	%f14,	%f0
	tcc	%xcc,	0x1
	nop
	set	0x18, %i4
	stx	%fsr,	[%l7 + %i4]
	sir	0x1449
	rd	%y,	%g5
	nop
	set	0x50, %g1
	stx	%fsr,	[%l7 + %g1]
	fcmple16	%f14,	%f12,	%o7
	fcmpeq32	%f10,	%f2,	%g6
	nop
	setx	0xC878E0898DCC43C9,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0xFCE62E2BD6961C96,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	faddd	%f30,	%f14,	%f0
	movg	%fcc3,	0x367,	%i4
	stx	%fsr,	[%l7 + 0x10]
	stx	%fsr,	[%l7 + 0x50]
	wrpr	%i2,	%g7,	%cwp
	wrpr	%o4,	0x1BB3,	%tick
	nop
	set	0x38, %g6
	stx	%fsr,	[%l7 + %g6]
	movrlz	%i1,	0x0C1,	%g2
	stx	%fsr,	[%l7 + 0x18]
	edge8	%i0,	%o5,	%i7
	stx	%fsr,	[%l7 + 0x18]
	stx	%fsr,	[%l7 + 0x28]
	fornot1	%f28,	%f4,	%f16
	nop
	set	0x30, %i1
	stx	%fsr,	[%l7 + %i1]
	stx	%fsr,	[%l7 + 0x30]
	fcmple16	%f0,	%f4,	%i3
	movcc	%icc,	0x3EA,	%l5
	edge8n	%o1,	%o0,	%l6
	movneg	%xcc,	0x6C4,	%o6
	orcc	%l3,	%l0,	%l4
	nop
	set	0x10, %i5
	stx	%fsr,	[%l7 + %i5]
	stx	%fsr,	[%l7 + 0x28]
	bg,a,pt	%xcc,	loop_27
	movvc	%xcc,	%i5,	%g1
	alignaddr	%l1,	%o2,	%o3
	tvc	%icc,	0x4
loop_27:
	bgu	%xcc,	loop_28
	movg	%fcc1,	%g4,	%i6
	subcc	%g3,	%g5,	%l2
	nop
	setx	0xD88BF5C83B209EEC,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	fsqrtd	%f0,	%f8
loop_28:
	rd	%tick_cmpr,	%g6
	fmovdvc	%icc,	%f28,	%f2
	fone	%f16
	nop
	set	0x58, %o7
	stx	%fsr,	[%l7 + %o7]
	bge,a,pn	%icc,	loop_29
	fnot1s	%f4,	%f0
	sll	%o7,	%i2,	%g7
	stx	%fsr,	[%l7 + 0x30]
loop_29:
	wr	%i4,	0x00DB,	%sys_tick
	nop
	set	0x3E, %g5
	lduh	[%l7 + %g5],	%i1
	movgu	%xcc,	0x3CC,	%g2
	nop
	set	0x68, %g7
	stx	%fsr,	[%l7 + %g7]
	wr	%g0,	0x04,	%asi
	lduwa	[%l7 + 0x5C] %asi,	%o4
	fba	%fcc1,	loop_30
	fmovrse	%i0,	%f1,	%f27
	add	%l7,	0x50,	%l6
	wr	%g0,	0x11,	%asi
	casa	[%l6] 0x11,	%i7,	%i3
loop_30:
	stx	%fsr,	[%l7 + 0x58]
	nop
	fitod	%f2,	%f6
	fdtox	%f6,	%f2
	fxtod	%f2,	%f26
	movrne	%o5,	%l5,	%o0
	stx	%fsr,	[%l7 + 0x08]
	edge16l	%o1,	%o6,	%l6
	stx	%fsr,	[%l7 + 0x20]
	fmovrdgz	%l3,	%f30,	%f4
	flushw
	fmovrse	%l0,	%f24,	%f0
	fmovscc	%xcc,	%f17,	%f29
	nop
	setx	0xEBB10800F0384EE0,	%l0,	%l6
	stx	%l6,	[%l7 + 0x10]
	ldx	[%l7 + 0x10],	%fsr
	nop
	set	0x08, %o5
	stx	%fsr,	[%l7 + %o5]
	movo	%fcc3,	%i5,	%l4
	add	%l1,	%g1,	%o3
	nop
	fitos	%f5,	%f15
	fstox	%f15,	%f16
	movne	%xcc,	0x4F2,	%g4
	fmuld8ulx16	%f30,	%f1,	%f28
	nop
	set	0x58, %i7
	stx	%fsr,	[%l7 + %i7]
	fmovrse	%i6,	%f18,	%f4
	ldsb	[%l7 + 0x4D],	%o2
	andcc	%g3,	0x0911,	%g5
	nop
	fitos	%f13,	%f23
	fstox	%f23,	%f26
	stx	%fsr,	[%l7 + 0x20]
	fpadd16s	%f20,	%f17,	%f23
	stx	%fsr,	[%l7 + 0x58]
	movrlez	%g6,	0x0D2,	%l2
	fpackfix	%f20,	%f29
	stx	%fsr,	[%l7 + 0x10]
	movo	%fcc1,	0x58A,	%i2
	subcc	%g7,	%i4,	%i1
	stx	%fsr,	[%l7 + 0x68]
	andcc	%g2,	0x0223,	%o4
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 1:
!
!	Type l   	: 60
!	Type a   	: 11
!	Type cti   	: 14
!	Type x   	: 6
!	Type f   	: 53
!	Type i   	: 56
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
	set	0xF,	%g1
	set	0xA,	%g2
	set	0x4,	%g3
	set	0xC,	%g4
	set	0xB,	%g5
	set	0xC,	%g6
	set	0xB,	%g7
	!# Input registers
	set	-0x0,	%i0
	set	-0x8,	%i1
	set	-0x4,	%i2
	set	-0xA,	%i3
	set	-0x9,	%i4
	set	-0x2,	%i5
	set	-0x2,	%i6
	set	-0x7,	%i7
	!# Local registers
	set	0x0F2978F3,	%l0
	set	0x04C42D3B,	%l1
	set	0x1C751CE8,	%l2
	set	0x40B227FD,	%l3
	set	0x3A3FB002,	%l4
	set	0x778A0471,	%l5
	set	0x7DF096D6,	%l6
	!# Output registers
	set	0x183C,	%o0
	set	0x0477,	%o1
	set	-0x13D6,	%o2
	set	-0x00C1,	%o3
	set	0x1B01,	%o4
	set	-0x1C7A,	%o5
	set	0x198D,	%o6
	set	-0x0E78,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x5CDEBE004C9316D6)
	INIT_TH_FP_REG(%l7,%f2,0x5AF70778F0C4B088)
	INIT_TH_FP_REG(%l7,%f4,0x8D7526625EC515A4)
	INIT_TH_FP_REG(%l7,%f6,0xE02F1C846E8760CC)
	INIT_TH_FP_REG(%l7,%f8,0x0321EB208EE2B95B)
	INIT_TH_FP_REG(%l7,%f10,0x2389D1100A6649F3)
	INIT_TH_FP_REG(%l7,%f12,0x67131F7252CC89E3)
	INIT_TH_FP_REG(%l7,%f14,0xE9E42F7A627F9BF1)
	INIT_TH_FP_REG(%l7,%f16,0x768EE71D99271671)
	INIT_TH_FP_REG(%l7,%f18,0x7E12787768E2C912)
	INIT_TH_FP_REG(%l7,%f20,0x308AE9F847B82508)
	INIT_TH_FP_REG(%l7,%f22,0x4821D99235B5284B)
	INIT_TH_FP_REG(%l7,%f24,0xE1625C0F20759DEE)
	INIT_TH_FP_REG(%l7,%f26,0x376BF26EBED9E858)
	INIT_TH_FP_REG(%l7,%f28,0x3F3211F11C669311)
	INIT_TH_FP_REG(%l7,%f30,0xEE9DF5D905EBEBD1)

	!# Execute Main Diag ..

	stx	%fsr,	[%l7 + 0x68]
	ldub	[%l7 + 0x29],	%i0
	fble,pn	%fcc3,	loop_31
	andcc	%i7,	0x060F,	%i3
	edge32	%o5,	%l5,	%o7
	stx	%fsr,	[%l7 + 0x70]
loop_31:
	fmovsvs	%icc,	%f10,	%f11
	tvc	%icc,	0x5
	sllx	%o1,	%o0,	%o6
	stx	%fsr,	[%l7 + 0x18]
	nop
	set	0x10, %i2
	stx	%fsr,	[%l7 + %i2]
	stx	%fsr,	[%l7 + 0x50]
	nop
	setx	0xF4437BDB,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f25
	fsqrts	%f25,	%f29
	fmovrdlez	%l3,	%f6,	%f6
	nop
	set	0x60, %o4
	stx	%fsr,	[%l7 + %o4]
	fpack16	%f18,	%f7
	nop
	set	0x60, %g4
	stx	%fsr,	[%l7 + %g4]
	nop
	set	0x58, %i3
	stx	%fsr,	[%l7 + %i3]
	taddcctv	%l6,	%l0,	%l4
	fmovrsne	%i5,	%f5,	%f28
	fmovsule	%fcc2,	%f10,	%f24
	faligndata	%f10,	%f20,	%f16
	edge8n	%l1,	%o3,	%g4
	fones	%f19
	tsubcctv	%i6,	%g1,	%g3
	subcc	%g5,	0x1F29,	%o2
	smul	%l2,	%i2,	%g6
	nop
	setx	0x736D74D2EA2D6D26,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0x4749FDB9E3AC2725,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	fsubd	%f22,	%f28,	%f22
	wr	%g0,	0x11,	%asi
	prefetcha	[%l7 + 0x78] %asi,	 1
	movuge	%fcc0,	0x0B7,	%g7
	fmuld8ulx16	%f14,	%f18,	%f0
	wrpr	%i1,	0x0877,	%pil
	taddcc	%g2,	0x0DAB,	%o4
	nop
	set	0x28, %o0
	stx	%i0,	[%l7 + %o0]
	addc	%i3,	0x13F0,	%o5
	nop
	set	0x60, %l3
	stx	%fsr,	[%l7 + %l3]
	bgu,a,pn	%xcc,	loop_32
	fmovdn	%fcc3,	%f30,	%f22
	fmovsu	%fcc3,	%f7,	%f13
	te	%icc,	0x7
loop_32:
	fmovrslez	%l5,	%f6,	%f8
	fzeros	%f14
	smul	%o7,	0x1F4C,	%i7
	tvc	%icc,	0x2
	nop
	set	0x3C, %l1
	ldsw	[%l7 + %l1],	%o1
	sll	%o6,	0x0F,	%o0
	movue	%fcc0,	%l3,	%l0
	stx	%fsr,	[%l7 + 0x48]
	wr	%g0,	0x10,	%asi
	lduwa	[%l7 + 0x2C] %asi,	%l6
	set	0x4A, %o1
	stha	%l4,	[%l7 + %o1] 0x2a
	membar	#Sync
	tleu	%xcc,	0x0
	stx	%fsr,	[%l7 + 0x70]
	bleu,pn	%icc,	loop_33
	nop
	set	0x40, %l4
	stx	%fsr,	[%l7 + %l4]
	stx	%fsr,	[%l7 + 0x60]
	movrgez	%l1,	0x388,	%i5
loop_33:
	stx	%fsr,	[%l7 + 0x30]
	fmovsvs	%icc,	%f17,	%f4
	nop
	set	0x48, %o6
	stx	%fsr,	[%l7 + %o6]
	stx	%fsr,	[%l7 + 0x58]
	set	0x40, %l6
	ldda	[%l7 + %l6] 0x81,	%f0
	nop
	set	0x60, %g3
	stx	%fsr,	[%l7 + %g3]
	fmovdo	%fcc3,	%f24,	%f6
	stx	%fsr,	[%l7 + 0x68]
	fcmple32	%f0,	%f30,	%o3
	edge32l	%i6,	%g4,	%g1
	nop
	setx	0x2D6B2756,	%l0,	%l6
	st	%l6,	[%l7 + 0x44]
	ld	[%l7 + 0x44],	%fsr
	fmovdule	%fcc3,	%f30,	%f26
	ta	%xcc,	0x7
	fmovrsne	%g3,	%f5,	%f6
	nop
	set	0x60, %o2
	stx	%fsr,	[%l7 + %o2]
	rdpr	%wstate,	%o2
	nop
	set	0x38, %l0
	stx	%fsr,	[%l7 + %l0]
	wr	%g5,	%i2,	%softint
	stx	%fsr,	[%l7 + 0x08]
	nop
	fitod	%f4,	%f20
	fdtos	%f20,	%f7
	fmovrdgz	%g6,	%f14,	%f14
	nop
	set	0x78, %i6
	stx	%fsr,	[%l7 + %i6]
	udivcc	%i4,	0x1845,	%l2
	wrpr	%g7,	0x066B,	%pil
	nop
	setx	loop_34,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x024400001402,	%l0,	%l1
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
	fmovsgu	%icc,	%f28,	%f26
	nop
	set	0x30, %o3
	stx	%fsr,	[%l7 + %o3]
	stx	%fsr,	[%l7 + 0x68]
loop_34:
	fpadd16	%f20,	%f4,	%f30
	nop
	set	0x20, %i0
	stx	%fsr,	[%l7 + %i0]
	nop
	set	0x4F, %g2
	ldsb	[%l7 + %g2],	%g2
	nop
	set	0x2E, %l2
	lduh	[%l7 + %l2],	%i1
	fmovs	%f0,	%f6
	stx	%fsr,	[%l7 + 0x40]
	stx	%fsr,	[%l7 + 0x58]
	fmovslg	%fcc2,	%f12,	%f20
	membar	0x7E
	nop
	setx	0x0E0137C7134099E0,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0x7121AA3A62FA7665,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	fdivd	%f16,	%f4,	%f2
	fmovsn	%xcc,	%f27,	%f5
	movrgez	%i0,	%i3,	%o4
	rdhpr	%hsys_tick_cmpr,	%o5
	nop
	setx	0x78C6241469C311C6,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0x5855B8B51EAA5758,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	fmuld	%f10,	%f0,	%f22
	ta	%icc,	0x2
	nop
	set	0x60, %i4
	stx	%fsr,	[%l7 + %i4]
	fpsub32	%f18,	%f22,	%f8
	bge,a,pn	%icc,	loop_35
	fzero	%f20
	stx	%fsr,	[%l7 + 0x18]
	movrne	%o7,	0x2EF,	%i7
loop_35:
	tcs	%xcc,	0x3
	nop
	setx	0x1E0D,	%l0,	%o1
	udivx	%l5,	%o1,	%o6
	nop
	set	0x60, %g1
	stx	%fsr,	[%l7 + %g1]
	nop
	set	0x3A, %g6
	ldstub	[%l7 + %g6],	%o0
	orncc	%l3,	%l6,	%l0
	nop
	set	0x78, %l5
	stx	%fsr,	[%l7 + %l5]
	tvs	%xcc,	0x0
	ldx	[%l7 + 0x08],	%l1
	nop
	set	0x58, %i5
	stx	%fsr,	[%l7 + %i5]
	fpadd16s	%f30,	%f8,	%f10
	movn	%fcc0,	%i5,	%l4
	fbe,pn	%fcc1,	loop_36
	fmovdlg	%fcc1,	%f24,	%f26
	nop
	setx	0xF9B9AFF3407EF547,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0x1EF0D84162EC9615,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	faddd	%f10,	%f22,	%f8
	set	0x40, %i1
	stda	%f0,	[%l7 + %i1] 0xcc
loop_36:
	nop
	setx	0x8C7F36DD4823220F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0x894A62941D7DDB35,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	fdivd	%f6,	%f8,	%f2
	andncc	%o3,	%i6,	%g1
	fpsub16	%f20,	%f2,	%f8
	nop
	set	0x08, %g5
	stx	%fsr,	[%l7 + %g5]
	fpack32	%f20,	%f0,	%f6
	fone	%f26
	fbule,pt	%fcc3,	loop_37
	bn,pn	%icc,	loop_38
	sub	%g4,	%o2,	%g5
	nop
	set	0x08, %o7
	stx	%fsr,	[%l7 + %o7]
loop_37:
	flushw
loop_38:
	nop
	setx	0x3D113F5D7A00CD2F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0xBE157ECC919DD793,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	faddd	%f12,	%f0,	%f4
	addcc	%g3,	0x1778,	%g6
	ld	[%l7 + 0x44],	%f20
	rdpr	%otherwin,	%i4
	rdhpr	%hsys_tick_cmpr,	%i2
	movrne	%l2,	0x286,	%g2
	fmovrslez	%i1,	%f30,	%f3
	nop
	set	0x38, %o5
	stx	%fsr,	[%l7 + %o5]
	or	%i0,	0x1065,	%g7
	rd	%asi,	%o4
	stx	%fsr,	[%l7 + 0x50]
	nop
	setx	0x88F56BCA,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f13
	setx	0xE2C76047,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f0
	fadds	%f0,	%f13,	%f11
	stx	%fsr,	[%l7 + 0x08]
	movrne	%o5,	0x223,	%o7
	fmovdne	%xcc,	%f30,	%f2
	tg	%icc,	0x6
	fmovdule	%fcc3,	%f24,	%f30
	tge	%icc,	0x0
	te	%icc,	0x6
	fnors	%f21,	%f30,	%f11
	lduw	[%l7 + 0x0C],	%i7
	nop
	set	0x30, %g7
	stx	%fsr,	[%l7 + %g7]
	orncc	%i3,	0x0C29,	%l5
	fmovsge	%fcc0,	%f8,	%f1
	membar	#Sync
	set	0x40, %i2
	ldda	[%l7 + %i2] 0xf1,	%f16
	fsrc2	%f26,	%f10
	fcmps	%fcc2,	%f7,	%f25
	edge32l	%o6,	%o0,	%o1
	umulcc	%l3,	%l6,	%l0
	stx	%fsr,	[%l7 + 0x30]
	fmovdl	%fcc1,	%f16,	%f30
	fmul8ulx16	%f22,	%f16,	%f6
	fands	%f6,	%f13,	%f9
	fmovdue	%fcc1,	%f4,	%f22
	set	0x2C, %i7
	sta	%f7,	[%l7 + %i7] 0x80
	fmovsle	%icc,	%f10,	%f17
	nop
	set	0x68, %g4
	stx	%fsr,	[%l7 + %g4]
	wrpr	%i5,	%l1,	%tick
	mulscc	%l4,	%i6,	%g1
	fcmpes	%fcc1,	%f30,	%f21
	orn	%o3,	%o2,	%g4
	movo	%fcc1,	%g3,	%g5
	nop
	fitos	%f9,	%f31
	fstox	%f31,	%f16
	sll	%g6,	0x0A,	%i2
	fmovscs	%icc,	%f2,	%f31
	stx	%fsr,	[%l7 + 0x78]
	fors	%f12,	%f29,	%f17
	nop
	fitod	%f8,	%f6
	fdtos	%f6,	%f8
	fmovrdlez	%i4,	%f2,	%f20
	fmovscs	%xcc,	%f29,	%f0
	subccc	%g2,	%l2,	%i1
	mulx	%g7,	0x0494,	%i0
	fmovrdgez	%o4,	%f22,	%f18

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	edge16n	%o7,	%i3,	%i7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%pil,	%o0
	fmovdlg	%fcc2,	%f30,	%f12
	nop
	set	0x68, %o4
	stx	%fsr,	[%l7 + %o4]
	fmovdug	%fcc2,	%f26,	%f12

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr 	%g0, 	0x3, 	%gl
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 2:
!
!	Type l   	: 59
!	Type a   	: 14
!	Type x   	: 7
!	Type cti   	: 8
!	Type f   	: 61
!	Type i   	: 51
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
	set	0xA,	%g1
	set	0x5,	%g2
	set	0xF,	%g3
	set	0x4,	%g4
	set	0x3,	%g5
	set	0xF,	%g6
	set	0x9,	%g7
	!# Input registers
	set	-0x6,	%i0
	set	-0xA,	%i1
	set	-0x0,	%i2
	set	-0xF,	%i3
	set	-0xB,	%i4
	set	-0xB,	%i5
	set	-0xE,	%i6
	set	-0xB,	%i7
	!# Local registers
	set	0x29C1DA74,	%l0
	set	0x0F2B0339,	%l1
	set	0x6CED2356,	%l2
	set	0x7ED745F0,	%l3
	set	0x7495764C,	%l4
	set	0x714ABACD,	%l5
	set	0x287AC8C4,	%l6
	!# Output registers
	set	-0x0B61,	%o0
	set	-0x14CE,	%o1
	set	0x1F90,	%o2
	set	0x1CBC,	%o3
	set	-0x1AB6,	%o4
	set	-0x194C,	%o5
	set	-0x078D,	%o6
	set	-0x1A90,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x5CDEBE004C9316D6)
	INIT_TH_FP_REG(%l7,%f2,0x5AF70778F0C4B088)
	INIT_TH_FP_REG(%l7,%f4,0x8D7526625EC515A4)
	INIT_TH_FP_REG(%l7,%f6,0xE02F1C846E8760CC)
	INIT_TH_FP_REG(%l7,%f8,0x0321EB208EE2B95B)
	INIT_TH_FP_REG(%l7,%f10,0x2389D1100A6649F3)
	INIT_TH_FP_REG(%l7,%f12,0x67131F7252CC89E3)
	INIT_TH_FP_REG(%l7,%f14,0xE9E42F7A627F9BF1)
	INIT_TH_FP_REG(%l7,%f16,0x768EE71D99271671)
	INIT_TH_FP_REG(%l7,%f18,0x7E12787768E2C912)
	INIT_TH_FP_REG(%l7,%f20,0x308AE9F847B82508)
	INIT_TH_FP_REG(%l7,%f22,0x4821D99235B5284B)
	INIT_TH_FP_REG(%l7,%f24,0xE1625C0F20759DEE)
	INIT_TH_FP_REG(%l7,%f26,0x376BF26EBED9E858)
	INIT_TH_FP_REG(%l7,%f28,0x3F3211F11C669311)
	INIT_TH_FP_REG(%l7,%f30,0xEE9DF5D905EBEBD1)

	!# Execute Main Diag ..

	fmovdleu	%xcc,	%f2,	%f28
	stx	%fsr,	[%l7 + 0x50]
	wrpr	%l6,	0x0B8E,	%cwp
	fbn	%fcc2,	loop_39
	addccc	%i5,	%l1,	%l0
	fmovsvs	%icc,	%f16,	%f3
	te	%xcc,	0x7
loop_39:
	fmul8x16al	%f4,	%f12,	%f28
	fabss	%f18,	%f19
	nop
	set	0x68, %i3
	stx	%fsr,	[%l7 + %i3]
	nop
	set	0x48, %o0
	stx	%fsr,	[%l7 + %o0]
	tcc	%icc,	0x5
	edge16l	%i6,	%l4,	%o3
	mulx	%g1,	%g4,	%g3
	wr	%g0,	0x19,	%asi
	ldsba	[%l7 + 0x37] %asi,	%o2
	fcmps	%fcc0,	%f30,	%f18
	fpmerge	%f6,	%f10,	%f24
	fones	%f16
	movpos	%icc,	0x6C0,	%g6
	alignaddrl	%g5,	%i4,	%i2
	nop
	set	0x2C, %l1
	lduh	[%l7 + %l1],	%l2
	stx	%fsr,	[%l7 + 0x18]
	fandnot1	%f4,	%f16,	%f24
	movn	%icc,	%g2,	%i1
	movrgez	%i0,	0x24E,	%g7
	tcc	%xcc,	0x2
	nop
	setx	loop_40,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x034100001400,	%l0,	%l1
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
	brz	%o5,	loop_41
	nop
	set	0x28, %o1
	stx	%fsr,	[%l7 + %o1]
	rd	%sys_tick_cmpr,	%o7
loop_40:
	fors	%f24,	%f9,	%f23
loop_41:
	nop
	set	0x38, %l3
	lduw	[%l7 + %l3],	%i3
	stx	%fsr,	[%l7 + 0x30]
	array32	%o4,	%i7,	%o6
	fmuld8ulx16	%f30,	%f14,	%f10
	fmovsul	%fcc1,	%f9,	%f6
	fsrc2	%f28,	%f26
	nop
	setx	0x035E,	%l0,	%o1
	sdivx	%o0,	%o1,	%l3
	nop
	set	0x60, %l4
	stx	%fsr,	[%l7 + %l4]
	fors	%f31,	%f27,	%f10
	set	0x6C, %l6
	swapa	[%l7 + %l6] 0x80,	%l5
	nop
	set	0x38, %g3
	stx	%fsr,	[%l7 + %g3]
	edge16l	%l6,	%i5,	%l0
	fmovsul	%fcc3,	%f7,	%f27
	nop
	setx	0x0148,	%l0,	%i6
	udiv	%l1,	%i6,	%o3
	nop
	set	0x18, %o2
	stx	%fsr,	[%l7 + %o2]
	nop
	set	0x58, %l0
	stx	%fsr,	[%l7 + %l0]
	nop
	set	0x20, %o6
	stx	%fsr,	[%l7 + %o6]
	fblg,a,pt	%fcc3,	loop_42
	fmovrsne	%g1,	%f29,	%f9
	tcs	%icc,	0x1
	smulcc	%g4,	0x155F,	%g3
loop_42:
	nop
	fitod	%f12,	%f28
	fdtos	%f28,	%f28
	stx	%fsr,	[%l7 + 0x18]
	nop
	setx	0xBC9B47A810065044,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0x05736AA2E1DA0DFF,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	faddd	%f2,	%f30,	%f18
	fmovsg	%xcc,	%f5,	%f14
	movrlez	%l4,	%g6,	%o2
	tcs	%icc,	0x5
	nop
	set	0x58, %o3
	stx	%fsr,	[%l7 + %o3]
	nop
	set	0x50, %i0
	stx	%fsr,	[%l7 + %i0]
	xnor	%i4,	%g5,	%i2
	fpsub32s	%f17,	%f14,	%f18
	fandnot1	%f0,	%f4,	%f28
	nop
	fitod	%f4,	%f2
	fdtos	%f2,	%f14
	wr	%g2,	%l2,	%ccr
	tleu	%xcc,	0x5
	rd	%ccr,	%i1
	fmovdlg	%fcc2,	%f22,	%f14
	fmovsleu	%xcc,	%f2,	%f6
	fmovd	%f30,	%f6
	stx	%fsr,	[%l7 + 0x38]
	stx	%fsr,	[%l7 + 0x28]
	fandnot2s	%f4,	%f11,	%f1
	stx	%fsr,	[%l7 + 0x68]
	fmovrdgez	%g7,	%f20,	%f30
	nop
	set	0x68, %i6
	stx	%fsr,	[%l7 + %i6]
	fnands	%f16,	%f15,	%f6
	tl	%icc,	0x7
	fandnot1	%f14,	%f4,	%f14
	bg	%icc,	loop_43
	movne	%fcc3,	%i0,	%o7
	srax	%i3,	0x06,	%o4
	stx	%fsr,	[%l7 + 0x60]
loop_43:
	addcc	%o5,	%i7,	%o6
	sdivx	%o0,	0x0E2E,	%o1
	wrpr	%l5,	%l6,	%cwp
	stx	%fsr,	[%l7 + 0x40]
	fmovsn	%icc,	%f31,	%f21
	fornot1s	%f15,	%f2,	%f20
	fcmpgt32	%f6,	%f20,	%l3
	fsrc2	%f18,	%f2
	nop
	set	0x30, %g2
	stx	%fsr,	[%l7 + %g2]
	fmovspos	%icc,	%f14,	%f5
	pdist	%f18,	%f18,	%f24
	fmovsneg	%xcc,	%f8,	%f4
	nop
	set	0x28, %i4
	stx	%fsr,	[%l7 + %i4]
	nop
	setx	loop_44,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x004100001402,	%l0,	%l1
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
	edge8l	%l0,	%l1,	%i5
	nop
	set	0x68, %g1
	stx	%fsr,	[%l7 + %g1]
	fnegd	%f0,	%f12
loop_44:
	membar	0x55
	nop
	set	0x20, %l2
	stx	%fsr,	[%l7 + %l2]
	set	0x40, %l5
	stda	%f0,	[%l7 + %l5] 0xd0
	fnegs	%f16,	%f22
	bmask	%i6,	%o3,	%g4
	nop
	setx	0x195B,	%l0,	%g1
	sdiv	%g3,	%g1,	%l4
	stx	%fsr,	[%l7 + 0x40]
	fbuge,pt	%fcc0,	loop_45
	bne,a	%xcc,	loop_46
	edge8l	%g6,	%o2,	%i4
	stx	%fsr,	[%l7 + 0x58]
loop_45:
	fmovda	%fcc0,	%f20,	%f24
loop_46:
	srlx	%g5,	0x12,	%g2
	rd	%tick_cmpr,	%i2
	stx	%fsr,	[%l7 + 0x58]
	nop
	set	0x48, %g6
	ldd	[%l7 + %g6],	%f30
	nop
	set	0x60, %i1
	stx	%fsr,	[%l7 + %i1]
	fors	%f19,	%f28,	%f1
	fandnot2s	%f11,	%f27,	%f3
	fmovsgu	%xcc,	%f9,	%f10
	nop
	set	0x40, %i5
	stx	%fsr,	[%l7 + %i5]
	fpsub16	%f26,	%f6,	%f16
	fcmpne32	%f24,	%f28,	%l2
	brz	%i1,	loop_47
	fcmpeq16	%f6,	%f28,	%i0
	fmovdo	%fcc0,	%f4,	%f6
	nop
	set	0x68, %g5
	stx	%fsr,	[%l7 + %g5]
loop_47:
	bcs,a,pt	%xcc,	loop_48
	stx	%fsr,	[%l7 + 0x18]
	nop
	setx	0xD4791362B17C9775,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0x86CB6473DB31D295,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	fmuld	%f8,	%f30,	%f30
	stx	%fsr,	[%l7 + 0x50]
loop_48:
	nop
	setx	0x4196931D,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f12
	setx	0x6142EC7C,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f7
	fmuls	%f7,	%f12,	%f27
	fmovrslez	%o7,	%f22,	%f22
	nop
	setx	0x46A0C04A1D215696,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0x2A590414C395CE1C,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	fsubd	%f18,	%f24,	%f2
	fcmple16	%f12,	%f30,	%g7
	fmovso	%fcc0,	%f22,	%f30
	nop
	fitos	%f7,	%f1
	fstox	%f1,	%f24
	fxtos	%f24,	%f13
	nop
	set	0x48, %o7
	stx	%fsr,	[%l7 + %o7]
	fmovd	%f16,	%f10
	tvs	%xcc,	0x7
	fmovs	%f2,	%f9

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xCAD, 	%hsys_tick_cmpr
	fmovrse	%o4,	%f18,	%f22
	fmovsge	%xcc,	%f15,	%f28
	sdivcc	%o5,	0x17E9,	%i7
	movvc	%icc,	%o0,	%o1
	fmovdge	%fcc0,	%f2,	%f0
	tn	%xcc,	0x3
	subccc	%o6,	%l6,	%l3
	movule	%fcc2,	%l0,	%l5
	movul	%fcc3,	%l1,	%i5
	mulx	%i6,	%o3,	%g3
	st	%f9,	[%l7 + 0x50]
	fcmpgt32	%f22,	%f20,	%g4
	membar	0x1C
	nop
	set	0x58, %g7
	stx	%fsr,	[%l7 + %g7]
	fmovdvs	%xcc,	%f6,	%f14
	nop
	set	0x70, %o5
	ldsh	[%l7 + %o5],	%g1
	move	%icc,	0x621,	%l4
	fblg,a,pn	%fcc0,	loop_49
	nop
	set	0x20, %i2
	stx	%fsr,	[%l7 + %i2]
	nop
	set	0x40, %i7
	stx	%fsr,	[%l7 + %i7]
	stx	%fsr,	[%l7 + 0x70]
loop_49:
	fmovrdlez	%g6,	%f14,	%f0
	nop
	set	0x58, %g4
	stx	%fsr,	[%l7 + %g4]
	nop
	fitod	%f28,	%f28
	fabss	%f19,	%f0
	nop
	fitod	%f4,	%f28
	fdtoi	%f28,	%f28
	set	0x5F, %o4
	lduba	[%l7 + %o4] 0x81,	%o2
	fmovdpos	%icc,	%f22,	%f4
	movo	%fcc2,	0x39E,	%i4
	nop
	set	0x58, %o0
	stx	%fsr,	[%l7 + %o0]
	fone	%f2
	nop
	setx	0x535ED520,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f3
	setx	0x507C260B,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f14
	fmuls	%f14,	%f3,	%f24
	nop
	set	0x18, %l1
	stx	%fsr,	[%l7 + %l1]
	fmovso	%fcc1,	%f2,	%f20
	wr	%g2,	%i2,	%ccr
	sdiv	%l2,	0x1089,	%i1
	stx	%fsr,	[%l7 + 0x50]
	nop
	set	0x30, %o1
	stx	%fsr,	[%l7 + %o1]
	stb	%g5,	[%l7 + 0x1C]
	edge8ln	%o7,	%i0,	%g7
	fcmpeq16	%f14,	%f12,	%o4
	fmovrsne	%i3,	%f15,	%f13
	fmovrdgez	%i7,	%f22,	%f20
	stx	%fsr,	[%l7 + 0x58]
	movug	%fcc0,	%o0,	%o5
	stx	%fsr,	[%l7 + 0x78]
	fandnot1	%f0,	%f26,	%f24
	bneg,a	%icc,	loop_50
	fmovsleu	%xcc,	%f14,	%f4
	fxnor	%f30,	%f18,	%f14
	fmovdneg	%xcc,	%f14,	%f24
loop_50:
	fbg,a,pn	%fcc0,	loop_51
	movne	%icc,	%o1,	%o6
	movul	%fcc2,	%l6,	%l3
loop_51:
	nop

	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 3:
!
!	Type l   	: 54
!	Type a   	: 8
!	Type x   	: 4
!	Type cti   	: 13
!	Type f   	: 74
!	Type i   	: 47
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
	set	0xB,	%g1
	set	0x0,	%g2
	set	0x2,	%g3
	set	0xD,	%g4
	set	0x1,	%g5
	set	0xC,	%g6
	set	0xC,	%g7
	!# Input registers
	set	-0x8,	%i0
	set	-0x1,	%i1
	set	-0x6,	%i2
	set	-0xD,	%i3
	set	-0x0,	%i4
	set	-0x2,	%i5
	set	-0x9,	%i6
	set	-0x4,	%i7
	!# Local registers
	set	0x4E1177C4,	%l0
	set	0x5D80D7D3,	%l1
	set	0x1E7580B7,	%l2
	set	0x74C32E0F,	%l3
	set	0x2D891145,	%l4
	set	0x7D326465,	%l5
	set	0x250770FA,	%l6
	!# Output registers
	set	0x1B2E,	%o0
	set	0x0817,	%o1
	set	-0x133C,	%o2
	set	-0x0848,	%o3
	set	0x1E71,	%o4
	set	-0x000B,	%o5
	set	-0x07ED,	%o6
	set	0x05D2,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x5CDEBE004C9316D6)
	INIT_TH_FP_REG(%l7,%f2,0x5AF70778F0C4B088)
	INIT_TH_FP_REG(%l7,%f4,0x8D7526625EC515A4)
	INIT_TH_FP_REG(%l7,%f6,0xE02F1C846E8760CC)
	INIT_TH_FP_REG(%l7,%f8,0x0321EB208EE2B95B)
	INIT_TH_FP_REG(%l7,%f10,0x2389D1100A6649F3)
	INIT_TH_FP_REG(%l7,%f12,0x67131F7252CC89E3)
	INIT_TH_FP_REG(%l7,%f14,0xE9E42F7A627F9BF1)
	INIT_TH_FP_REG(%l7,%f16,0x768EE71D99271671)
	INIT_TH_FP_REG(%l7,%f18,0x7E12787768E2C912)
	INIT_TH_FP_REG(%l7,%f20,0x308AE9F847B82508)
	INIT_TH_FP_REG(%l7,%f22,0x4821D99235B5284B)
	INIT_TH_FP_REG(%l7,%f24,0xE1625C0F20759DEE)
	INIT_TH_FP_REG(%l7,%f26,0x376BF26EBED9E858)
	INIT_TH_FP_REG(%l7,%f28,0x3F3211F11C669311)
	INIT_TH_FP_REG(%l7,%f30,0xEE9DF5D905EBEBD1)

	!# Execute Main Diag ..

	fmovrdlz	%l5,	%f22,	%f8
	nop
	setx	0xA828630FEA7A40C6,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0xF8AA743E9BA84DB0,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	faddd	%f2,	%f14,	%f30
	nop
	set	0x50, %l3
	stx	%fsr,	[%l7 + %l3]
	fornot2s	%f20,	%f9,	%f6
	stx	%fsr,	[%l7 + 0x30]
	wr	%g0,	0x89,	%asi
	stxa	%l1,	[%l7 + 0x78] %asi
	move	%fcc2,	0x450,	%l0
	fmul8sux16	%f26,	%f18,	%f20
	fmovd	%f12,	%f18
	stx	%fsr,	[%l7 + 0x78]
	sllx	%i5,	0x0F,	%i6
	nop
	setx	0x98CFA505CD088D1E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0xB4A2027F31FCEE99,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	fmuld	%f26,	%f10,	%f10
	nop
	setx	0x2B275F710EE19C76,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0xB397FD2C5C567ABB,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	fmuld	%f6,	%f26,	%f16
	fmovdug	%fcc3,	%f22,	%f12
	lduw	[%l7 + 0x3C],	%g3
	set	0x40, %l4
	stda	%f16,	[%l7 + %l4] 0xc8
	xnorcc	%g4,	%g1,	%l4
	bne,a	%icc,	loop_52
	fmovsule	%fcc3,	%f10,	%f10
	fcmps	%fcc0,	%f31,	%f10
	xnor	%o3,	%o2,	%i4
loop_52:
	nop
	setx	0x1F6FEB8B,	%l0,	%l6
	st	%l6,	[%l7 + 0x34]
	ld	[%l7 + 0x34],	%fsr
	nop
	setx	loop_53,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x001200001402,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	rdhpr	%hpstate,	%g2
	and	%i2,	%l2,	%i1
	movcs	%icc,	%g6,	%o7
loop_53:
	stx	%fsr,	[%l7 + 0x70]
	stx	%fsr,	[%l7 + 0x20]
	nop
	setx	0x71C42B98,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f16
	setx	0xDD03FB54,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f30
	fsubs	%f30,	%f16,	%f16
	fmovsu	%fcc3,	%f5,	%f22
	bvc	%xcc,	loop_54
	nop
	setx	0x089E,	%l0,	%g7
	sdivcc	%g5,	%g7,	%o4
	stx	%fsr,	[%l7 + 0x10]
	nop
	set	0x38, %i3
	stb	%i3,	[%l7 + %i3]
loop_54:
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	stx	%fsr,	[%l7 + 0x40]
	stx	%fsr,	[%l7 + 0x50]
	stx	%fsr,	[%l7 + 0x08]
	nop
	set	0x6C, %g3
	lduh	[%l7 + %g3],	%i0
	edge32	%i7,	%o0,	%o1
	nop
	setx	0x15D80CD2,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f16
	fsqrts	%f16,	%f24
	fbne,a	%fcc1,	loop_55
	fnor	%f22,	%f26,	%f14
	fmovdneg	%icc,	%f6,	%f28
	nop
	set	0x08, %o2
	stx	%fsr,	[%l7 + %o2]
loop_55:
	nop
	setx	0xD5BCB566A1E3641F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0x82321E2C101E2605,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	fdivd	%f28,	%f14,	%f10
	fzeros	%f6
	be,pn	%icc,	loop_56
	nop
	set	0x18, %l0
	stx	%fsr,	[%l7 + %l0]
	nop
	setx	0xC8EC2F814D44F2BB,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0x1ADDE6417031C37E,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	fmuld	%f28,	%f16,	%f8
	stx	%fsr,	[%l7 + 0x48]
loop_56:
	fnot2	%f28,	%f14
	taddcc	%o6,	0x1154,	%l6
	siam	0x6
	stx	%fsr,	[%l7 + 0x78]
	nop
	set	0x20, %l6
	stx	%fsr,	[%l7 + %l6]
	fbul	%fcc2,	loop_57
	movrgez	%o5,	0x197,	%l5
	stx	%fsr,	[%l7 + 0x68]
	nop
	set	0x20, %o3
	stx	%fsr,	[%l7 + %o3]
loop_57:
	fmovsle	%icc,	%f1,	%f1
	smulcc	%l3,	%l1,	%l0
	wrpr	%i5,	0x0014,	%tick
	nop
	set	0x28, %o6
	stx	%fsr,	[%l7 + %o6]
	tleu	%icc,	0x0
	movneg	%xcc,	%g3,	%g4
	rdpr	%cleanwin,	%i6
	edge32	%g1,	%l4,	%o2
	fmovrdlez	%i4,	%f2,	%f12
	ldsw	[%l7 + 0x30],	%o3
	fnot2	%f0,	%f26
	stx	%fsr,	[%l7 + 0x70]
	array8	%i2,	%l2,	%g2
	nop
	set	0x70, %i0
	stx	%fsr,	[%l7 + %i0]
	nop
	setx	0xCA157025,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f15
	setx	0x0618B439,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f19
	fdivs	%f19,	%f15,	%f19
	stx	%fsr,	[%l7 + 0x38]
	movne	%fcc2,	0x528,	%i1
	orncc	%o7,	%g6,	%g5
	stx	%fsr,	[%l7 + 0x58]
	sll	%g7,	0x17,	%o4
	fmovdue	%fcc2,	%f18,	%f6
	nop
	set	0x70, %g2
	stx	%fsr,	[%l7 + %g2]
	nop
	set	0x58, %i6
	stx	%fsr,	[%l7 + %i6]
	nop
	set	0x38, %g1
	stx	%fsr,	[%l7 + %g1]
	fmovsu	%fcc0,	%f24,	%f22
	andcc	%i3,	%i0,	%i7
	nop
	setx	0x39DC0AB2,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f31
	fsqrts	%f31,	%f4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xADA, 	%hsys_tick_cmpr
	nop
	set	0x28, %i4
	stx	%fsr,	[%l7 + %i4]
	fcmped	%fcc0,	%f24,	%f26
	fbe	%fcc2,	loop_58
	nop
	set	0x30, %l2
	stx	%fsr,	[%l7 + %l2]
	nop
	set	0x18, %g6
	stx	%fsr,	[%l7 + %g6]
	udivcc	%o0,	0x070D,	%o6
loop_58:
	bmask	%l6,	%l5,	%o5
	fbue	%fcc3,	loop_59
	stx	%fsr,	[%l7 + 0x60]
	rd	%pc,	%l3
	fornot1s	%f13,	%f12,	%f8
loop_59:
	be,pt	%xcc,	loop_60
	fabss	%f7,	%f14
	stx	%fsr,	[%l7 + 0x58]
	fmovsa	%fcc3,	%f4,	%f18
loop_60:
	stx	%fsr,	[%l7 + 0x50]
	nop
	set	0x10, %l5
	stx	%fsr,	[%l7 + %l5]
	fmul8x16	%f27,	%f2,	%f20
	nop
	set	0x20, %i1
	stx	%fsr,	[%l7 + %i1]
	rdpr	%tl,	%l1
	fpack32	%f28,	%f4,	%f8
	brnz	%i5,	loop_61
	stx	%fsr,	[%l7 + 0x78]
	fmovdleu	%icc,	%f24,	%f4
	tgu	%icc,	0x5
loop_61:
	fmovsvs	%xcc,	%f2,	%f11
	fmovsle	%xcc,	%f3,	%f11
	fpadd32s	%f25,	%f21,	%f8
	tg	%xcc,	0x0
	mova	%xcc,	0x40A,	%g3
	rdpr	%tba,	%l0
	movrgez	%i6,	0x253,	%g1
	stx	%fsr,	[%l7 + 0x10]
	be,a	%icc,	loop_62
	fmovsule	%fcc0,	%f29,	%f21
	tsubcctv	%l4,	%o2,	%i4
	fmul8x16	%f16,	%f2,	%f6
loop_62:
	stx	%fsr,	[%l7 + 0x78]
	stx	%fsr,	[%l7 + 0x38]
	add	%o3,	0x1B13,	%g4
	fabsd	%f22,	%f4
	fcmpne32	%f20,	%f28,	%l2
	nop
	set	0x68, %i5
	stx	%fsr,	[%l7 + %i5]
	sdiv	%g2,	0x17A1,	%i2
	fmovdlg	%fcc3,	%f20,	%f22
	fcmpne32	%f16,	%f12,	%i1
	std	%f20,	[%l7 + 0x40]
	bn,pt	%icc,	loop_63
	nop
	set	0x70, %g5
	stx	%fsr,	[%l7 + %g5]
	nop
	set	0x08, %g7
	stx	%fsr,	[%l7 + %g7]
	fmovrslz	%g6,	%f29,	%f6
loop_63:
	fsrc2	%f2,	%f16
	nop
	set	0x08, %o5
	stx	%fsr,	[%l7 + %o5]
	fpadd16	%f16,	%f18,	%f18
	fnot1s	%f0,	%f3
	fmul8x16	%f3,	%f14,	%f26
	nop
	setx	0xB26A6B26B4C5E67B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0x02686B0B3FA1D30A,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	fdivd	%f30,	%f10,	%f4
	nop
	set	0x58, %o7
	stx	%fsr,	[%l7 + %o7]
	rdpr	%pil,	%o7
	andcc	%g7,	%o4,	%i3
	nop
	set	0x3C, %i7
	ldsh	[%l7 + %i7],	%g5
	ldsb	[%l7 + 0x6E],	%i7
	nop
	set	0x70, %i2
	stx	%fsr,	[%l7 + %i2]
	rd	%pc,	%i0
	movrne	%o1,	%o0,	%o6
	nop
	setx	0xC879016F,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f26
	setx	0xA3373D1E,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f19
	fmuls	%f19,	%f26,	%f3
	movug	%fcc1,	%l5,	%l6
	sllx	%o5,	0x00,	%l1
	stx	%fsr,	[%l7 + 0x58]
	fnegd	%f18,	%f18
	fmovrde	%l3,	%f22,	%f16
	stx	%fsr,	[%l7 + 0x28]
	rd	%y,	%g3
	brgez	%i5,	loop_64
	stx	%fsr,	[%l7 + 0x50]
	add	%l0,	0x18FB,	%g1
	fmovdg	%fcc1,	%f22,	%f30
loop_64:
	fmovrsne	%l4,	%f17,	%f9
	fxnors	%f5,	%f23,	%f18
	fble,pt	%fcc0,	loop_65
	fmovdge	%fcc2,	%f0,	%f24
	movlg	%fcc1,	%i6,	%i4
	stx	%fsr,	[%l7 + 0x48]
loop_65:
	subccc	%o2,	0x03FE,	%o3
	stx	%fsr,	[%l7 + 0x20]
	tgu	%icc,	0x2
	tneg	%icc,	0x4
	nop
	set	0x52, %o4
	ldub	[%l7 + %o4],	%l2
	fpadd16	%f24,	%f24,	%f20
	nop
	fitod	%f2,	%f4
	fdtox	%f4,	%f20
	bgu,pn	%xcc,	loop_66
	tcs	%icc,	0x6
	membar	0x5B
	xnor	%g2,	0x1E69,	%i2
loop_66:
	fornot1s	%f0,	%f14,	%f28
	nop
	set	0x40, %g4
	stx	%fsr,	[%l7 + %g4]
	fmovdcc	%icc,	%f6,	%f2
	fpadd16	%f24,	%f8,	%f22
	nop
	set	0x58, %o0
	stx	%fsr,	[%l7 + %o0]
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	nop
	fitod	%f12,	%f10
	fdtos	%f10,	%f24
	movneg	%icc,	0x209,	%g4
	fxors	%f7,	%f3,	%f9
	fmovrsgz	%i1,	%f15,	%f24
	stx	%fsr,	[%l7 + 0x60]
	fmovsue	%fcc0,	%f4,	%f19
	fmovrdgz	%o7,	%f12,	%f26
	rdpr	%gl,	%g6
	tvs	%xcc,	0x7
	stx	%fsr,	[%l7 + 0x50]
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 4:
!
!	Type l   	: 62
!	Type a   	: 11
!	Type cti   	: 15
!	Type x   	: 2
!	Type f   	: 66
!	Type i   	: 44
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
	set	0xA,	%g1
	set	0x5,	%g2
	set	0xF,	%g3
	set	0x0,	%g4
	set	0xC,	%g5
	set	0x9,	%g6
	set	0xB,	%g7
	!# Input registers
	set	-0x1,	%i0
	set	-0x0,	%i1
	set	-0x4,	%i2
	set	-0x2,	%i3
	set	-0x4,	%i4
	set	-0x3,	%i5
	set	-0x4,	%i6
	set	-0x0,	%i7
	!# Local registers
	set	0x54A38682,	%l0
	set	0x6E36BF7F,	%l1
	set	0x19E81C99,	%l2
	set	0x430A293F,	%l3
	set	0x2B1F37CE,	%l4
	set	0x498EBD25,	%l5
	set	0x378B7E21,	%l6
	!# Output registers
	set	0x1277,	%o0
	set	-0x0E0B,	%o1
	set	0x0BBB,	%o2
	set	-0x0314,	%o3
	set	-0x1156,	%o4
	set	-0x0191,	%o5
	set	-0x05ED,	%o6
	set	-0x138D,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x5CDEBE004C9316D6)
	INIT_TH_FP_REG(%l7,%f2,0x5AF70778F0C4B088)
	INIT_TH_FP_REG(%l7,%f4,0x8D7526625EC515A4)
	INIT_TH_FP_REG(%l7,%f6,0xE02F1C846E8760CC)
	INIT_TH_FP_REG(%l7,%f8,0x0321EB208EE2B95B)
	INIT_TH_FP_REG(%l7,%f10,0x2389D1100A6649F3)
	INIT_TH_FP_REG(%l7,%f12,0x67131F7252CC89E3)
	INIT_TH_FP_REG(%l7,%f14,0xE9E42F7A627F9BF1)
	INIT_TH_FP_REG(%l7,%f16,0x768EE71D99271671)
	INIT_TH_FP_REG(%l7,%f18,0x7E12787768E2C912)
	INIT_TH_FP_REG(%l7,%f20,0x308AE9F847B82508)
	INIT_TH_FP_REG(%l7,%f22,0x4821D99235B5284B)
	INIT_TH_FP_REG(%l7,%f24,0xE1625C0F20759DEE)
	INIT_TH_FP_REG(%l7,%f26,0x376BF26EBED9E858)
	INIT_TH_FP_REG(%l7,%f28,0x3F3211F11C669311)
	INIT_TH_FP_REG(%l7,%f30,0xEE9DF5D905EBEBD1)

	!# Execute Main Diag ..

	edge16ln	%g7,	%o4,	%i3
	subcc	%g5,	%i7,	%o1
	fcmped	%fcc3,	%f10,	%f6
	set	0x40, %o1
	stda	%f16,	[%l7 + %o1] 0x81
	rd	%sys_tick_cmpr,	%i0
	nop
	set	0x38, %l3
	stx	%fsr,	[%l7 + %l3]
	bmask	%o6,	%o0,	%l6
	fcmpeq16	%f20,	%f20,	%l5
	nop
	set	0x10, %l4
	stx	%fsr,	[%l7 + %l4]
	stx	%fsr,	[%l7 + 0x50]
	nop
	set	0x66, %l1
	ldsb	[%l7 + %l1],	%l1
	tleu	%icc,	0x4
	nop
	fitod	%f8,	%f22
	fdtoi	%f22,	%f0
	tvc	%xcc,	0x4
	tg	%xcc,	0x5
	bgu	%xcc,	loop_67
	nop
	setx loop_68, %l0, %l1
	jmpl %l1, %l3
	fnor	%f12,	%f24,	%f28
	stx	%fsr,	[%l7 + 0x60]
loop_67:
	stx	%fsr,	[%l7 + 0x30]
loop_68:
	srax	%g3,	0x05,	%i5
	stx	%fsr,	[%l7 + 0x38]
	fsrc2	%f26,	%f22
	tsubcc	%l0,	0x19A9,	%g1
	sethi	0x1AE5,	%l4
	fmovs	%f16,	%f11
	fabss	%f17,	%f1
	orcc	%o5,	%i6,	%o2
	fmul8x16au	%f24,	%f21,	%f8
	fmovde	%fcc0,	%f20,	%f28
	nop
	setx	0x19C06B9A9BCD44A9,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0xAC8DD347291EEC06,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	fdivd	%f4,	%f12,	%f22
	fmovdo	%fcc0,	%f26,	%f28
	fmovsule	%fcc0,	%f3,	%f14
	fnot2	%f4,	%f24
	fcmpeq16	%f22,	%f4,	%o3
	nop
	set	0x10, %g3
	stx	%fsr,	[%l7 + %g3]
	tsubcc	%i4,	0x0EF5,	%l2
	popc	%g2,	%g4
	nop
	set	0x60, %i3
	stx	%fsr,	[%l7 + %i3]
	fcmpeq32	%f16,	%f22,	%i1
	stx	%fsr,	[%l7 + 0x48]
	stx	%fsr,	[%l7 + 0x30]
	fnegs	%f4,	%f3
	nop
	set	0x40, %l0
	stx	%fsr,	[%l7 + %l0]
	fabss	%f27,	%f15
	edge16l	%i2,	%g6,	%o7
	tge	%icc,	0x4
	stx	%fsr,	[%l7 + 0x08]
	ldsh	[%l7 + 0x08],	%g7
	nop
	set	0x18, %o2
	stx	%fsr,	[%l7 + %o2]
	nop
	setx	0xEB32FB59,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f24
	setx	0x9D24357E,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f0
	fsubs	%f0,	%f24,	%f15
	edge16	%o4,	%i3,	%g5
	stx	%fsr,	[%l7 + 0x78]
	rdhpr	%ver,	%i7
	nop
	fitod	%f0,	%f6
	fdtoi	%f6,	%f13
	fmovdlg	%fcc2,	%f16,	%f26
	nop
	set	0x50, %o3
	stx	%fsr,	[%l7 + %o3]
	srax	%o1,	0x06,	%i0
	fmovsule	%fcc2,	%f11,	%f14
	stx	%fsr,	[%l7 + 0x08]
	fpsub32	%f20,	%f12,	%f14
	stx	%fsr,	[%l7 + 0x20]
	nop
	setx	loop_69,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x011400001402,	%l0,	%l1
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
	fmovdl	%fcc2,	%f18,	%f30
	fmuld8sux16	%f16,	%f4,	%f2
	edge8n	%o0,	%l6,	%o6
loop_69:
	fbug,a	%fcc1,	loop_70
	ble,a,pn	%xcc,	loop_71
	sir	0x1E18
	fabsd	%f26,	%f28
loop_70:
	fornot2	%f10,	%f22,	%f14
loop_71:
	fbne,a	%fcc1,	loop_72
	fandnot2	%f30,	%f22,	%f6
	fnands	%f29,	%f3,	%f1
	fmovdge	%icc,	%f28,	%f10
loop_72:
	fmovsu	%fcc1,	%f9,	%f20
	fmuld8sux16	%f13,	%f11,	%f6
	array8	%l1,	%l3,	%l5
	fmovdvc	%xcc,	%f20,	%f28
	movuge	%fcc2,	0x737,	%g3
	stx	%fsr,	[%l7 + 0x50]
	stx	%fsr,	[%l7 + 0x58]
	rdpr	%wstate,	%i5
	movlg	%fcc2,	%l0,	%g1
	tneg	%icc,	0x6
	nop
	setx	0x5CD49D7881DEB3C5,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0x00E998C4478AEA12,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	fsubd	%f28,	%f16,	%f12
	movuge	%fcc3,	0x0AE,	%o5
	tpos	%xcc,	0x4
	ldd	[%l7 + 0x40],	%f8
	tle	%xcc,	0x5
	fmovs	%f12,	%f18
	fmovsvc	%xcc,	%f23,	%f25
	rdpr	%tl,	%l4
	fone	%f2
	nop
	setx loop_73, %l0, %l1
	jmpl %l1, %i6
	nop
	set	0x30, %l6
	stx	%fsr,	[%l7 + %l6]
	membar	0x58
	edge8n	%o3,	%o2,	%l2
loop_73:
	fbuge,a,pn	%fcc1,	loop_74
	stx	%fsr,	[%l7 + 0x68]
	fands	%f19,	%f16,	%f31
	movrne	%i4,	0x0AA,	%g2
loop_74:
	fmovrslez	%i1,	%f7,	%f6
	wrpr	%g4,	%g6,	%pil
	nop
	set	0x40, %i0
	stx	%fsr,	[%l7 + %i0]
	srax	%o7,	0x00,	%g7
	rdhpr	%hsys_tick_cmpr,	%i2
	rdpr	%tl,	%o4
	fmovdue	%fcc2,	%f28,	%f28
	fmovrdlez	%g5,	%f20,	%f0
	stx	%fsr,	[%l7 + 0x08]
	wr	%i3,	0x1CD7,	%y
	movn	%xcc,	%i7,	%o1
	fcmpne16	%f12,	%f22,	%o0
	andcc	%l6,	%i0,	%l1
	nop
	set	0x28, %g2
	stx	%fsr,	[%l7 + %g2]
	edge16ln	%l3,	%l5,	%o6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x477, 	%hsys_tick_cmpr
	nop
	set	0x30, %o6
	stx	%fsr,	[%l7 + %o6]
	fmovrdgez	%i5,	%f24,	%f0
	nop
	set	0x48, %g1
	stx	%fsr,	[%l7 + %g1]
	fnors	%f13,	%f1,	%f30
	fnot2s	%f13,	%f23
	be	%xcc,	loop_75
	nop
	set	0x40, %i4
	stx	%fsr,	[%l7 + %i4]
	fmovrdgz	%l0,	%f12,	%f24
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
loop_75:
	fmovspos	%icc,	%f24,	%f31
	stx	%fsr,	[%l7 + 0x50]
	nop
	set	0x50, %i6
	stx	%fsr,	[%l7 + %i6]
	tg	%xcc,	0x7
	movn	%icc,	0x2BC,	%o5
	wr	%g0,	0x80,	%asi
	swapa	[%l7 + 0x28] %asi,	%l4
	fnegd	%f24,	%f6
	movneg	%icc,	0x0C5,	%i6
	tn	%icc,	0x7
	wr	%g0,	0x04,	%asi
	stha	%o3,	[%l7 + 0x1A] %asi
	fba,a	%fcc1,	loop_76
	fbu	%fcc2,	loop_77
	nop
	set	0x28, %g6
	stx	%fsr,	[%l7 + %g6]
	nop
	set	0x5C, %l5
	ldsw	[%l7 + %l5],	%g1
loop_76:
	fornot1s	%f4,	%f0,	%f22
loop_77:
	brz,pt	%l2,	loop_78
	edge32ln	%o2,	%i4,	%g2
	rdpr	%pil,	%i1
	tvc	%icc,	0x4
loop_78:
	nop
	set	0x10, %i1
	stx	%fsr,	[%l7 + %i1]
	ldstub	[%l7 + 0x41],	%g6
	nop
	set	0x18, %i5
	stx	%fsr,	[%l7 + %i5]
	rdhpr	%hsys_tick_cmpr,	%o7
	wr	%g0,	0x81,	%asi
	lduha	[%l7 + 0x12] %asi,	%g7
	rd	%tick_cmpr,	%g4
	fbo,a,pn	%fcc0,	loop_79
	fmovdcs	%icc,	%f20,	%f26
	fmovdul	%fcc3,	%f16,	%f30
	umulcc	%i2,	%g5,	%o4
loop_79:
	ld	[%l7 + 0x34],	%f27
	fbuge,pt	%fcc3,	loop_80
	nop
	fitos	%f8,	%f26
	fstoi	%f26,	%f14
	stx	%fsr,	[%l7 + 0x38]
	alignaddrl	%i3,	%i7,	%o0
loop_80:
	add	%o1,	0x15B9,	%l6
	nop
	fitos	%f2,	%f26
	fstoi	%f26,	%f11
	fmovsg	%fcc0,	%f6,	%f13
	or	%i0,	0x0620,	%l1
	array8	%l5,	%o6,	%g3
	stx	%fsr,	[%l7 + 0x48]
	fmuld8sux16	%f29,	%f3,	%f10
	nop
	set	0x30, %l2
	stx	%fsr,	[%l7 + %l2]
	subccc	%l3,	0x0183,	%l0
	ta	%icc,	0x4
	movrlez	%i5,	%l4,	%i6
	nop
	setx	0x64AC9993,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f30
	setx	0x2FC45311,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f16
	fdivs	%f16,	%f30,	%f8
	lduh	[%l7 + 0x42],	%o3
	rdpr	%gl,	%g1
	stx	%fsr,	[%l7 + 0x28]
	edge32l	%l2,	%o2,	%i4
	add	%l7,	0x38,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] %asi,	%g2,	%i1
	subcc	%g6,	%o7,	%g7
	flushw
	nop
	set	0x30, %g7
	stx	%fsr,	[%l7 + %g7]
	flushw
	nop
	set	0x68, %o5
	stx	%fsr,	[%l7 + %o5]
	stx	%fsr,	[%l7 + 0x18]
	fmovsg	%icc,	%f28,	%f19
	ldsh	[%l7 + 0x6C],	%g4
	nop
	set	0x10, %g5
	stx	%fsr,	[%l7 + %g5]
	sethi	0x0675,	%o5
	nop
	set	0x08, %o7
	stx	%fsr,	[%l7 + %o7]
	movne	%icc,	0x13E,	%i2
	movge	%icc,	%g5,	%i3
	mova	%fcc2,	%o4,	%i7
	fcmps	%fcc0,	%f0,	%f13
	udiv	%o1,	0x0347,	%l6
	stx	%o0,	[%l7 + 0x78]
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 5:
!
!	Type l   	: 55
!	Type a   	: 13
!	Type cti   	: 14
!	Type x   	: 5
!	Type f   	: 57
!	Type i   	: 56
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
	set	0x1,	%g1
	set	0x8,	%g2
	set	0xB,	%g3
	set	0xC,	%g4
	set	0x8,	%g5
	set	0x8,	%g6
	set	0x4,	%g7
	!# Input registers
	set	-0x0,	%i0
	set	-0x2,	%i1
	set	-0x1,	%i2
	set	-0x3,	%i3
	set	-0xE,	%i4
	set	-0x1,	%i5
	set	-0xB,	%i6
	set	-0x6,	%i7
	!# Local registers
	set	0x1FD5E5EE,	%l0
	set	0x317A3C43,	%l1
	set	0x54B10D7B,	%l2
	set	0x6893FB67,	%l3
	set	0x78C57DF6,	%l4
	set	0x571D578D,	%l5
	set	0x1DFF2BA2,	%l6
	!# Output registers
	set	-0x0B59,	%o0
	set	-0x0585,	%o1
	set	-0x0E1B,	%o2
	set	0x18C4,	%o3
	set	-0x0260,	%o4
	set	0x023E,	%o5
	set	-0x1A5F,	%o6
	set	-0x0BFF,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x5CDEBE004C9316D6)
	INIT_TH_FP_REG(%l7,%f2,0x5AF70778F0C4B088)
	INIT_TH_FP_REG(%l7,%f4,0x8D7526625EC515A4)
	INIT_TH_FP_REG(%l7,%f6,0xE02F1C846E8760CC)
	INIT_TH_FP_REG(%l7,%f8,0x0321EB208EE2B95B)
	INIT_TH_FP_REG(%l7,%f10,0x2389D1100A6649F3)
	INIT_TH_FP_REG(%l7,%f12,0x67131F7252CC89E3)
	INIT_TH_FP_REG(%l7,%f14,0xE9E42F7A627F9BF1)
	INIT_TH_FP_REG(%l7,%f16,0x768EE71D99271671)
	INIT_TH_FP_REG(%l7,%f18,0x7E12787768E2C912)
	INIT_TH_FP_REG(%l7,%f20,0x308AE9F847B82508)
	INIT_TH_FP_REG(%l7,%f22,0x4821D99235B5284B)
	INIT_TH_FP_REG(%l7,%f24,0xE1625C0F20759DEE)
	INIT_TH_FP_REG(%l7,%f26,0x376BF26EBED9E858)
	INIT_TH_FP_REG(%l7,%f28,0x3F3211F11C669311)
	INIT_TH_FP_REG(%l7,%f30,0xEE9DF5D905EBEBD1)

	!# Execute Main Diag ..

	mulscc	%l1,	0x0C72,	%i0
	fornot2	%f6,	%f30,	%f10
	or	%l5,	0x1994,	%o6
	nop
	set	0x50, %i2
	stx	%fsr,	[%l7 + %i2]
	fmovda	%fcc0,	%f4,	%f16
	subc	%g3,	%l0,	%l3
	subc	%i5,	0x1D45,	%l4
	tcc	%icc,	0x7
	taddcctv	%o3,	%i6,	%l2
	stx	%fsr,	[%l7 + 0x10]
	movleu	%icc,	%o2,	%g1
	smul	%g2,	0x0AFE,	%i1
	nop
	setx	0x0865,	%l0,	%o7
	sdivcc	%g6,	%o7,	%g7
	fnot1s	%f23,	%f29
	fcmps	%fcc2,	%f12,	%f6
	movrgz	%i4,	%g4,	%o5
	fnands	%f17,	%f8,	%f19
	stx	%fsr,	[%l7 + 0x18]
	fxors	%f24,	%f15,	%f15
	nop
	set	0x50, %o4
	stx	%fsr,	[%l7 + %o4]
	fcmps	%fcc0,	%f22,	%f31
	movuge	%fcc0,	%g5,	%i2
	stx	%fsr,	[%l7 + 0x70]
	stx	%fsr,	[%l7 + 0x70]
	ldd	[%l7 + 0x50],	%f6
	bpos	%icc,	loop_81
	stx	%fsr,	[%l7 + 0x48]
	fandnot2	%f22,	%f14,	%f12
	fmovrdgez	%i3,	%f24,	%f12
loop_81:
	fsrc1	%f0,	%f20
	set	0x64, %i7
	ldsha	[%l7 + %i7] 0x89,	%i7
	movrlez	%o4,	0x17E,	%l6
	popc	%o0,	%l1
	wrpr	%i0,	%o1,	%cwp
	orn	%o6,	0x1909,	%l5
	stx	%fsr,	[%l7 + 0x20]
	nop
	fitod	%f2,	%f22
	fdtos	%f22,	%f2
	sub	%g3,	0x1AD7,	%l3
	fbge	%fcc1,	loop_82
	fmovdlg	%fcc1,	%f8,	%f4
	nop
	set	0x68, %o0
	prefetch	[%l7 + %o0],	 1
	wr	%g0,	0x88,	%asi
	stha	%l0,	[%l7 + 0x3A] %asi
loop_82:
	nop
	set	0x60, %g4
	stx	%fsr,	[%l7 + %g4]
	movuge	%fcc0,	0x460,	%i5
	array16	%l4,	%o3,	%l2
	fsrc1s	%f26,	%f3
	flushw
	fcmpne32	%f10,	%f20,	%i6
	wrpr	%o2,	0x1C96,	%pil
	nop
	set	0x50, %l3
	stx	%fsr,	[%l7 + %l3]
	stx	%fsr,	[%l7 + 0x58]
	fmovslg	%fcc1,	%f1,	%f20
	movrgz	%g1,	%i1,	%g2
	fmovdul	%fcc1,	%f24,	%f24
	movrne	%g6,	%o7,	%i4
	fmovsuge	%fcc1,	%f1,	%f22
	sll	%g4,	0x0E,	%o5
	stx	%fsr,	[%l7 + 0x30]
	fands	%f29,	%f5,	%f13
	fornot1	%f26,	%f0,	%f12
	tn	%icc,	0x5
	fmovdgu	%xcc,	%f6,	%f6
	fcmpne16	%f22,	%f12,	%g5
	nop
	setx	0xEF7A84682230CE9F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0xFA310361AFAC31B2,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	fsubd	%f12,	%f4,	%f18
	fandnot1	%f20,	%f8,	%f30
	bvs,a,pt	%xcc,	loop_83
	rdpr	%gl,	%g7
	nop
	fitos	%f7,	%f4
	fstox	%f4,	%f24
	array32	%i3,	%i2,	%o4
loop_83:
	stx	%fsr,	[%l7 + 0x50]
	nop
	set	0x58, %o1
	stx	%fsr,	[%l7 + %o1]
	fmovdu	%fcc1,	%f10,	%f14
	movleu	%xcc,	%i7,	%o0
	tge	%xcc,	0x0
	fone	%f12
	fands	%f22,	%f9,	%f23
	movo	%fcc1,	0x6A4,	%l1
	fpadd16	%f4,	%f30,	%f22
	stx	%fsr,	[%l7 + 0x30]
	rdpr	%gl,	%l6
	fmovsule	%fcc2,	%f6,	%f24
	stx	%fsr,	[%l7 + 0x60]
	smulcc	%i0,	%o6,	%l5
	nop
	set	0x50, %l1
	stx	%fsr,	[%l7 + %l1]
	movl	%fcc2,	%g3,	%o1
	movuge	%fcc0,	0x462,	%l3
	nop
	set	0x78, %g3
	stx	%fsr,	[%l7 + %g3]
	rdpr	%wstate,	%i5
	fmovrslez	%l0,	%f16,	%f3
	fmovsa	%fcc1,	%f15,	%f24
	rdpr	%gl,	%o3
	xnorcc	%l4,	%l2,	%o2
	movrlz	%i6,	0x06D,	%i1
	fmul8ulx16	%f14,	%f24,	%f6
	sra	%g1,	%g2,	%g6
	nop
	set	0x10, %i3
	stx	%fsr,	[%l7 + %i3]
	edge8l	%i4,	%g4,	%o7
	fmul8ulx16	%f30,	%f12,	%f20
	array32	%o5,	%g7,	%g5
	fmovsgu	%icc,	%f31,	%f14
	nop
	set	0x10, %l0
	stx	%fsr,	[%l7 + %l0]
	movvs	%xcc,	0x4AA,	%i3
	tvc	%xcc,	0x0
	fsrc1s	%f12,	%f22
	nop
	fitod	%f4,	%f14
	fdtox	%f14,	%f0
	fxtod	%f0,	%f10
	tgu	%xcc,	0x2
	fmovscc	%xcc,	%f3,	%f12
	movn	%fcc3,	0x560,	%o4
	movvs	%icc,	%i2,	%i7
	tcc	%icc,	0x7
	nop
	set	0x58, %l4
	stx	%fsr,	[%l7 + %l4]
	nop
	fitod	%f8,	%f28
	fdtoi	%f28,	%f20
	movlg	%fcc2,	%l1,	%o0
	nop
	set	0x18, %o2
	stx	%fsr,	[%l7 + %o2]
	stx	%fsr,	[%l7 + 0x58]
	fnors	%f24,	%f16,	%f7
	fpsub16s	%f8,	%f0,	%f29
	sdiv	%l6,	0x118D,	%o6
	fmovscc	%icc,	%f30,	%f30
	nop
	set	0x30, %l6
	stx	%fsr,	[%l7 + %l6]
	edge16ln	%i0,	%l5,	%g3
	bvs,pn	%icc,	loop_84
	movcs	%icc,	%l3,	%o1
	fmovrse	%i5,	%f1,	%f28
	rdpr	%gl,	%o3
loop_84:
	nop
	setx	0xDE6EEDC09B91D341,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0xF6E03B37E7D6FF83,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	fdivd	%f24,	%f4,	%f8
	addc	%l4,	0x1E67,	%l0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	andcc	%i6,	%i1,	%l2
	stx	%fsr,	[%l7 + 0x60]
	wr	%g0,	0x11,	%asi
	ldswa	[%l7 + 0x34] %asi,	%g2
	stx	%fsr,	[%l7 + 0x08]
	nop
	fitod	%f10,	%f14
	fdtoi	%f14,	%f15
	wr	%g1,	%i4,	%y
	nop
	setx	0x794ECBA6EAF1C7AE,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0x41B247F21FBD2AA4,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	faddd	%f18,	%f10,	%f4
	nop
	set	0x10, %i0
	stx	%fsr,	[%l7 + %i0]
	fmuld8ulx16	%f19,	%f10,	%f4
	xnorcc	%g6,	0x0508,	%o7
	bgu	%xcc,	loop_85
	bl,a	%xcc,	loop_86
	fandnot2	%f18,	%f10,	%f24
	nop
	fitod	%f29,	%f8
loop_85:
	nop
	setx	0xB1FA8A75,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f18
	fsqrts	%f18,	%f7
loop_86:
	fmovsleu	%icc,	%f18,	%f19
	nop
	set	0x4C, %g2
	swap	[%l7 + %g2],	%g4
	wr	%o5,	0x11F5,	%pic
	fmovscs	%xcc,	%f25,	%f0
	fcmpeq32	%f30,	%f28,	%g7
	nop
	set	0x20, %o6
	stx	%fsr,	[%l7 + %o6]
	stx	%fsr,	[%l7 + 0x68]
	fbug,a	%fcc1,	loop_87
	fmovsue	%fcc2,	%f14,	%f27
	tvs	%icc,	0x1
	movneg	%icc,	%g5,	%o4
loop_87:
	movrgez	%i3,	0x18C,	%i7
	edge32	%i2,	%o0,	%l1
	stx	%fsr,	[%l7 + 0x38]
	add	%l7,	0x30,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] %asi,	%o6,	%l6
	stx	%fsr,	[%l7 + 0x10]
	array32	%i0,	%l5,	%l3
	fandnot2s	%f9,	%f4,	%f6
	nop
	set	0x10, %g1
	stx	%fsr,	[%l7 + %g1]
	fbu	%fcc2,	loop_88
	edge32	%g3,	%o1,	%i5
	mulx	%l4,	%l0,	%o3
	nop
	set	0x08, %i4
	stx	%fsr,	[%l7 + %i4]
loop_88:
	fxors	%f13,	%f26,	%f12
	nop
	set	0x18, %o3
	stx	%fsr,	[%l7 + %o3]
	stx	%fsr,	[%l7 + 0x10]
	stx	%fsr,	[%l7 + 0x40]
	nop
	fitos	%f3,	%f1
	fstoi	%f1,	%f29
	add	%o2,	%i6,	%l2
	movrlz	%g2,	%g1,	%i4
	movue	%fcc1,	%i1,	%g6
	rd	%sys_tick_cmpr,	%o7
	fmovrdgez	%o5,	%f30,	%f2
	stx	%fsr,	[%l7 + 0x30]
	wr	%g7,	0x07C4,	%set_softint
	set	0x68, %i6
	stxa	%g5,	[%l7 + %i6] 0x81
	fpsub32s	%f4,	%f14,	%f31
	stx	%fsr,	[%l7 + 0x30]
	fmovsl	%fcc2,	%f22,	%f10
	stx	%fsr,	[%l7 + 0x50]
	stx	%fsr,	[%l7 + 0x60]
	nop
	setx	0x3FE5DC7462E859B8,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	fsqrtd	%f18,	%f10
	nop
	set	0x58, %g6
	flush	%l7 + %g6
	bcc,pn	%icc,	loop_89
	nop
	set	0x40, %l5
	stx	%fsr,	[%l7 + %l5]
	nop
	set	0x20, %i1
	stx	%fsr,	[%l7 + %i1]
	fbg,a,pt	%fcc1,	loop_90
loop_89:
	nop
	set	0x78, %i5
	stx	%fsr,	[%l7 + %i5]
	stx	%fsr,	[%l7 + 0x40]
	set	0x0C, %l2
	swapa	[%l7 + %l2] 0x88,	%o4
loop_90:
	orncc	%g4,	%i7,	%i2
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 6:
!
!	Type l   	: 54
!	Type a   	: 12
!	Type x   	: 6
!	Type cti   	: 10
!	Type f   	: 60
!	Type i   	: 58
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
	set	0x1,	%g1
	set	0x7,	%g2
	set	0x3,	%g3
	set	0x2,	%g4
	set	0x9,	%g5
	set	0xA,	%g6
	set	0xD,	%g7
	!# Input registers
	set	-0xA,	%i0
	set	-0x5,	%i1
	set	-0x6,	%i2
	set	-0x4,	%i3
	set	-0x2,	%i4
	set	-0x6,	%i5
	set	-0x7,	%i6
	set	-0x3,	%i7
	!# Local registers
	set	0x4F13B718,	%l0
	set	0x2D12A4A7,	%l1
	set	0x12307B21,	%l2
	set	0x53417FC7,	%l3
	set	0x32A41835,	%l4
	set	0x2F52F856,	%l5
	set	0x229377C2,	%l6
	!# Output registers
	set	-0x0A13,	%o0
	set	0x0E90,	%o1
	set	0x1F95,	%o2
	set	-0x1927,	%o3
	set	0x1595,	%o4
	set	-0x1614,	%o5
	set	0x00C6,	%o6
	set	0x1188,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x5CDEBE004C9316D6)
	INIT_TH_FP_REG(%l7,%f2,0x5AF70778F0C4B088)
	INIT_TH_FP_REG(%l7,%f4,0x8D7526625EC515A4)
	INIT_TH_FP_REG(%l7,%f6,0xE02F1C846E8760CC)
	INIT_TH_FP_REG(%l7,%f8,0x0321EB208EE2B95B)
	INIT_TH_FP_REG(%l7,%f10,0x2389D1100A6649F3)
	INIT_TH_FP_REG(%l7,%f12,0x67131F7252CC89E3)
	INIT_TH_FP_REG(%l7,%f14,0xE9E42F7A627F9BF1)
	INIT_TH_FP_REG(%l7,%f16,0x768EE71D99271671)
	INIT_TH_FP_REG(%l7,%f18,0x7E12787768E2C912)
	INIT_TH_FP_REG(%l7,%f20,0x308AE9F847B82508)
	INIT_TH_FP_REG(%l7,%f22,0x4821D99235B5284B)
	INIT_TH_FP_REG(%l7,%f24,0xE1625C0F20759DEE)
	INIT_TH_FP_REG(%l7,%f26,0x376BF26EBED9E858)
	INIT_TH_FP_REG(%l7,%f28,0x3F3211F11C669311)
	INIT_TH_FP_REG(%l7,%f30,0xEE9DF5D905EBEBD1)

	!# Execute Main Diag ..

	fzero	%f22
	fcmple16	%f10,	%f22,	%o0
	srl	%l1,	0x1F,	%i3
	stx	%fsr,	[%l7 + 0x70]
	rdhpr	%hsys_tick_cmpr,	%l6
	fmovdule	%fcc0,	%f2,	%f2
	movule	%fcc1,	%o6,	%i0
	andcc	%l3,	%l5,	%g3
	wr	%i5,	0x194B,	%y
	fmovs	%f27,	%f24
	movcs	%xcc,	%o1,	%l4
	stx	%fsr,	[%l7 + 0x68]
	move	%fcc0,	%l0,	%o3
	sdivcc	%i6,	0x155A,	%o2
	mulscc	%g2,	%l2,	%i4
	sra	%i1,	0x02,	%g1
	orcc	%g6,	%o7,	%o5
	fbuge	%fcc0,	loop_91
	srl	%g5,	0x1F,	%g7
	stx	%fsr,	[%l7 + 0x48]
	bge,a	%icc,	loop_92
loop_91:
	movgu	%icc,	%g4,	%i7
	subcc	%o4,	%o0,	%l1
	wrpr	%i2,	%l6,	%pil
loop_92:
	edge8	%o6,	%i3,	%i0
	movrgez	%l3,	0x2A2,	%l5
	pdist	%f22,	%f20,	%f12
	fmovrde	%i5,	%f10,	%f12
	movleu	%xcc,	%o1,	%l4
	wr	%g3,	%l0,	%set_softint
	nop
	set	0x60, %o5
	stx	%fsr,	[%l7 + %o5]
	bvs	%icc,	loop_93
	mova	%xcc,	0x414,	%i6
	nop
	setx	0x0853,	%l0,	%o3
	udivx	%o2,	%o3,	%g2
	andn	%i4,	%l2,	%g1
loop_93:
	fmovsug	%fcc3,	%f17,	%f17
	stx	%fsr,	[%l7 + 0x48]
	fabsd	%f12,	%f8
	nop
	setx	0x95B675D13208857F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0xDC74FFE388B651FC,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	fmuld	%f18,	%f28,	%f22
	fandnot2	%f16,	%f20,	%f30
	ta	%xcc,	0x2
	fmovsug	%fcc2,	%f26,	%f22
	fmovscc	%icc,	%f12,	%f25
	for	%f6,	%f12,	%f4
	stx	%fsr,	[%l7 + 0x60]
	nop
	fitos	%f0,	%f27
	fstox	%f27,	%f4
	stx	%fsr,	[%l7 + 0x60]
	bg,a,pn	%xcc,	loop_94
	nop
	set	0x60, %g7
	stx	%fsr,	[%l7 + %g7]

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x46D, 	%hsys_tick_cmpr
	stx	%fsr,	[%l7 + 0x38]
loop_94:
	wr	%o5,	%g5,	%clear_softint
	bpos,pt	%icc,	loop_95
	subccc	%g7,	%i1,	%g4
	nop
	set	0x28, %g5
	stx	%fsr,	[%l7 + %g5]
	movrgez	%i7,	%o4,	%o0
loop_95:
	stx	%fsr,	[%l7 + 0x48]
	stx	%fsr,	[%l7 + 0x48]
	call	loop_96
	fbue,a	%fcc3,	loop_97
	fmovslg	%fcc2,	%f18,	%f13
	nop
	fitos	%f3,	%f21
	fstod	%f21,	%f2
loop_96:
	nop
	set	0x58, %i2
	stx	%fsr,	[%l7 + %i2]
loop_97:
	siam	0x6
	sra	%i2,	0x03,	%l1
	nop
	set	0x28, %o4
	stx	%fsr,	[%l7 + %o4]
	nop
	set	0x10, %i7
	stx	%fsr,	[%l7 + %i7]
	nop
	set	0x10, %o7
	stx	%fsr,	[%l7 + %o7]
	fabss	%f19,	%f3
	nop
	setx	0x0395,	%l0,	%o6
	udivcc	%l6,	%o6,	%i3
	add	%l3,	0x0A5C,	%l5
	stx	%fsr,	[%l7 + 0x10]
	fmovsgu	%xcc,	%f21,	%f18
	nop
	set	0x60, %g4
	stx	%fsr,	[%l7 + %g4]
	fcmple16	%f20,	%f10,	%i5
	stx	%fsr,	[%l7 + 0x28]
	fornot2s	%f2,	%f8,	%f27
	stx	%fsr,	[%l7 + 0x68]
	fsrc2	%f8,	%f16
	movrlz	%o1,	%i0,	%l4
	stx	%fsr,	[%l7 + 0x50]
	fmovsa	%icc,	%f24,	%f21
	bcs,a,pn	%xcc,	loop_98
	fmovsne	%xcc,	%f18,	%f24
	movlg	%fcc2,	0x751,	%g3
	nop
	set	0x28, %o0
	stx	%fsr,	[%l7 + %o0]
loop_98:
	fmovsue	%fcc1,	%f19,	%f30
	rdpr	%pil,	%l0
	fmovscc	%icc,	%f9,	%f20
	fbg,pn	%fcc2,	loop_99
	ta	%xcc,	0x0
	fmovrdgez	%o2,	%f28,	%f14
	stx	%fsr,	[%l7 + 0x48]
loop_99:
	fornot1	%f30,	%f0,	%f22
	fmovsvc	%icc,	%f23,	%f11
	fmovslg	%fcc0,	%f9,	%f5
	nop
	set	0x40, %l3
	stx	%fsr,	[%l7 + %l3]
	fbo	%fcc3,	loop_100
	movle	%icc,	%o3,	%i6
	nop
	setx	0x9D8A80AE,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f3
	setx	0xCE450B4E,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f21
	fmuls	%f21,	%f3,	%f0
	andn	%i4,	%g2,	%g1
loop_100:
	stx	%fsr,	[%l7 + 0x70]
	fcmpgt16	%f2,	%f2,	%l2
	nop
	set	0x20, %o1
	stx	%fsr,	[%l7 + %o1]
	rdpr	%pil,	%o7
	edge32l	%g6,	%g5,	%o5
	tg	%xcc,	0x5
	nop
	setx	0x802F6A2256A3A5FD,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0x7F5DA66632A9B09C,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	fdivd	%f4,	%f6,	%f4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xCB6, 	%tick_cmpr
	fmovda	%fcc2,	%f10,	%f14
	nop
	set	0x50, %g3
	stx	%fsr,	[%l7 + %g3]
	wr	%g4,	0x0FE6,	%set_softint
	nop
	set	0x30, %i3
	stx	%fsr,	[%l7 + %i3]
	taddcctv	%g7,	0x15CE,	%o4
	rdpr	%cleanwin,	%i7
	fcmpd	%fcc0,	%f20,	%f16
	movg	%fcc3,	0x056,	%i2
	fand	%f20,	%f10,	%f28
	rd	%fprs,	%o0
	fbn,a,pt	%fcc3,	loop_101
	fmovdvc	%icc,	%f16,	%f6
	wr	%g0,	0xe2,	%asi
	stxa	%l1,	[%l7 + 0x38] %asi
	membar	#Sync
loop_101:
	bne	%xcc,	loop_102
	fmovdl	%icc,	%f22,	%f12
	ldd	[%l7 + 0x08],	%f12
	fmovdug	%fcc0,	%f18,	%f30
loop_102:
	nop
	fitos	%f10,	%f7
	fstox	%f7,	%f16
	fxtos	%f16,	%f18
	nop
	setx	0x1EA7,	%l0,	%i3
	sdivx	%l6,	%i3,	%l3
	edge16n	%o6,	%l5,	%o1
	fmovdcc	%icc,	%f2,	%f10
	fmovrsgz	%i0,	%f28,	%f21
	smul	%l4,	%g3,	%l0
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	edge8l	%o2,	%o3,	%i6
	nop
	set	0x18, %l0
	stx	%fsr,	[%l7 + %l0]
	rdpr	%wstate,	%i4
	tle	%icc,	0x1
	stx	%fsr,	[%l7 + 0x58]
	fbue	%fcc2,	loop_103
	bmask	%g2,	%i5,	%l2
	fbl,a,pn	%fcc2,	loop_104
	fmovsvc	%icc,	%f8,	%f20
loop_103:
	nop
	set	0x28, %l4
	stx	%fsr,	[%l7 + %l4]
	wr	%g0,	0x0c,	%asi
	stxa	%o7,	[%l7 + 0x68] %asi
loop_104:
	edge32l	%g1,	%g6,	%g5
	set	0x68, %l1
	ldswa	[%l7 + %l1] 0x88,	%i1
	fmovsg	%xcc,	%f12,	%f11
	stx	%fsr,	[%l7 + 0x78]
	fmovrsne	%o5,	%f23,	%f24
	bneg	%icc,	loop_105
	edge8n	%g7,	%g4,	%i7
	fnot1	%f8,	%f24
	udivx	%o4,	0x0C90,	%i2
loop_105:
	fmovdcc	%xcc,	%f14,	%f2
	set	0x28, %o2
	stda	%l0,	[%l7 + %o2] 0xeb
	membar	#Sync
	fnands	%f22,	%f22,	%f2
	fnands	%f31,	%f6,	%f13
	fmul8x16au	%f13,	%f0,	%f30
	sub	%o0,	0x0B03,	%i3
	stx	%fsr,	[%l7 + 0x28]
	fnands	%f24,	%f26,	%f10
	movl	%fcc2,	0x750,	%l6
	stx	%fsr,	[%l7 + 0x48]
	wrpr	%l3,	0x1174,	%pil
	nop
	set	0x64, %i0
	ldsw	[%l7 + %i0],	%l5
	fsrc1s	%f9,	%f20
	nop
	set	0x38, %g2
	stx	%fsr,	[%l7 + %g2]

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xC29, 	%hsys_tick_cmpr
	move	%xcc,	%i0,	%l4
	taddcctv	%o6,	0x1A37,	%g3
	fcmpes	%fcc1,	%f24,	%f3
	fbge,a,pt	%fcc2,	loop_106
	nop
	set	0x14, %l6
	ldstub	[%l7 + %l6],	%l0
	alignaddrl	%o2,	%i6,	%o3
	fmovscc	%xcc,	%f23,	%f1
loop_106:
	fmovsgu	%xcc,	%f23,	%f18
	fbug,pt	%fcc3,	loop_107
	stx	%fsr,	[%l7 + 0x30]
	add	%g2,	%i5,	%i4
	nop
	set	0x68, %o6
	stx	%fsr,	[%l7 + %o6]
loop_107:
	nop
	set	0x78, %g1
	stx	%fsr,	[%l7 + %g1]
	stx	%fsr,	[%l7 + 0x78]
	sll	%l2,	%g1,	%g6
	movn	%xcc,	%o7,	%i1
	movne	%fcc3,	%g5,	%g7
	sethi	0x0C74,	%o5
	edge32	%i7,	%o4,	%i2
	nop
	setx	0x5580E7568B0F7D03,	%l0,	%l6
	stx	%l6,	[%l7 + 0x38]
	ldx	[%l7 + 0x38],	%fsr
	te	%icc,	0x1
	nop
	set	0x40, %i4
	stx	%fsr,	[%l7 + %i4]
	bcc,a	%icc,	loop_108
	wr 	%g0, 	0x4, 	%fprs
	fpackfix	%f14,	%f5
	fmovsle	%xcc,	%f14,	%f9
loop_108:
	bmask	%i3,	%l6,	%l3
	fmovdg	%xcc,	%f4,	%f14
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 7:
!
!	Type l   	: 48
!	Type a   	: 16
!	Type x   	: 4
!	Type cti   	: 18
!	Type f   	: 58
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
.word 0x4F038F7E
.word 0x59AD8E35
.word 0x47154752
.word 0x0582082C
.word 0x8EC2FD84
.word 0x8A1B2712
.word 0x09DA7F5A
.word 0xFFF360AB
.word 0x6E60B5DF
.word 0xC7F34AC3
.word 0xA2F5C26A
.word 0x34C4D3B9
.word 0xE13BCC6E
.word 0x5C304E45
.word 0xD28D3334
.word 0xDE999812
.word 0xAF83AB51
.word 0x346EEE31
.word 0xD9F5F318
.word 0x0109166D
.word 0x6B350FB4
.word 0x462CAF1E
.word 0x9C8E9B92
.word 0x8A4FD604
.word 0xEF0D03F2
.word 0xEFCEB4DF
.word 0x1892238E
.word 0xF990C067
.word 0x74D39EF7
.word 0x9BCABC53
.word 0x180F7A76
.word 0x8EAA6F83
.word 0x72F5288E
.word 0x433A8197
.word 0x896EF5B0
.word 0x86012CE6
.word 0xFA7592F6
.word 0x94985A73
.word 0x114BE7C9
.word 0x97F0D9B8
.word 0x2F1876DC
.word 0x0C59B589
.word 0x84AB4625
.word 0xDEFD5E3B
.word 0xD8F86E1A
.word 0x35790508
.word 0xD5B76A03
.word 0x767FE98E
.word 0xA292ED36
.word 0x3A6858DF
.word 0xF5B0D4B6
.word 0xEE395E25
.word 0xBD2ECB67
.word 0x810F8503
.word 0x7F89E537
.word 0xF8B02438
.word 0xC163552F
.word 0x010E8C6F
.word 0xFF72E895
.word 0x346856AF
.word 0x4E88F81E
.word 0x88E38DD5
.word 0x0F24855E
.word 0x55C227F7
.end
