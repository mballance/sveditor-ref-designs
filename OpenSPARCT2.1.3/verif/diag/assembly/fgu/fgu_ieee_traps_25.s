/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: fgu_ieee_traps_25.s
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
.ident "FOCUSCASE: focus.pm,v 1.1 2003/04/23 17:53:39 somePerson Exp somePerson $ spc_basic_isa3.pl FOCUS_SEED=4479012"
.ident "Mon Dec  8 19:57:35 CST 2003"
.ident "Using Instruction Hash for Focus :$Id: fgu_ieee_traps_25.s,v 1.4 2007/07/27 21:45:31 drp Exp $"
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
	set	0x4,	%g1
	set	0x7,	%g2
	set	0x8,	%g3
	set	0x4,	%g4
	set	0x9,	%g5
	set	0xC,	%g6
	set	0x0,	%g7
	!# Input registers
	set	-0xF,	%i0
	set	-0x5,	%i1
	set	-0x1,	%i2
	set	-0x3,	%i3
	set	-0x6,	%i4
	set	-0x2,	%i5
	set	-0x9,	%i6
	set	-0x7,	%i7
	!# Local registers
	set	0x01CD1987,	%l0
	set	0x601B4A70,	%l1
	set	0x3BC742E0,	%l2
	set	0x65E7B411,	%l3
	set	0x30F2204D,	%l4
	set	0x0BFCD28F,	%l5
	set	0x16E02B18,	%l6
	!# Output registers
	set	-0x0211,	%o0
	set	0x1EBD,	%o1
	set	-0x04E8,	%o2
	set	0x10B1,	%o3
	set	-0x111E,	%o4
	set	-0x0190,	%o5
	set	-0x1530,	%o6
	set	0x0864,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x2935C9E687811231)
	INIT_TH_FP_REG(%l7,%f2,0x7F66F0C3CCA58A3E)
	INIT_TH_FP_REG(%l7,%f4,0x3AEC2E41FEB9AA02)
	INIT_TH_FP_REG(%l7,%f6,0xD137B4286AC51173)
	INIT_TH_FP_REG(%l7,%f8,0xDF2A93DC6F76B7AC)
	INIT_TH_FP_REG(%l7,%f10,0x738EF5DEB9BBCDE7)
	INIT_TH_FP_REG(%l7,%f12,0xA069D47C4AE8A83A)
	INIT_TH_FP_REG(%l7,%f14,0xDEAD52076D4DD849)
	INIT_TH_FP_REG(%l7,%f16,0x290589D71269A573)
	INIT_TH_FP_REG(%l7,%f18,0x8A4D73884272FB8D)
	INIT_TH_FP_REG(%l7,%f20,0x66FF312585370073)
	INIT_TH_FP_REG(%l7,%f22,0x679745628EAF82E8)
	INIT_TH_FP_REG(%l7,%f24,0xD1C5000CAB9080BF)
	INIT_TH_FP_REG(%l7,%f26,0x6758B9BD274DD177)
	INIT_TH_FP_REG(%l7,%f28,0x81A11D697B2F9466)
	INIT_TH_FP_REG(%l7,%f30,0xB5D320B9EF520111)

	!# Execute Main Diag ..

	add	%o4,	%o0,	%g4
	fandnot2s	%f25,	%f2,	%f6
	fcmpne32	%f2,	%f16,	%l0
	fmovsuge	%fcc1,	%f31,	%f23
	wr	%g0,	0xe2,	%asi
	stba	%i2,	[%l7 + 0x66] %asi
	membar	#Sync
	fmovsuge	%fcc3,	%f17,	%f24
	orcc	%i5,	0x1DD6,	%l2
	fexpand	%f20,	%f14
	tgu	%xcc,	0x3
	mulx	%o3,	0x0BE3,	%g3
	edge16l	%l6,	%i7,	%i3
	rdpr	%tba,	%i0
	array8	%o1,	%g1,	%g7
	call	loop_1
	fmovsvc	%xcc,	%f22,	%f10
	fmovsug	%fcc0,	%f28,	%f20
	call	loop_2
loop_1:
	fabsd	%f0,	%f26
	fpack32	%f2,	%f16,	%f14
	srax	%o2,	0x0E,	%l4
loop_2:
	call	loop_3
	fand	%f18,	%f4,	%f26
	rd	%y,	%o6
	call	loop_4
loop_3:
	fmovsuge	%fcc0,	%f14,	%f11
	call	loop_5
	fmovrslez	%o7,	%f21,	%f18
loop_4:
	tg	%xcc,	0x4
	fmovrslz	%g6,	%f8,	%f7
loop_5:
	nop
	setx	0x1417,	%l0,	%l3
	sdivcc	%l1,	%l3,	%g5
	std	%i4,	[%l7 + 0x10]
	call	loop_6
	movo	%fcc2,	%i6,	%i1
	call	loop_7
	fcmpeq16	%f16,	%f26,	%g2
loop_6:
	movo	%fcc2,	0x156,	%l5
	movleu	%icc,	0x01A,	%o4
loop_7:
	rdpr	%canrestore,	%o0
	std	%f24,	[%l7 + 0x50]
	faligndata	%f22,	%f0,	%f30
	fmovdo	%fcc2,	%f26,	%f4
	call	loop_8
	fmovrdlz	%o5,	%f20,	%f16
	nop
	setx	0x78FF985F9EC6D844,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0xF57DDDF76F789F93,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	fsubd	%f4,	%f12,	%f26
	rdpr	%wstate,	%l0
loop_8:
	fbn	%fcc2,	loop_9
	array8	%g4,	%i2,	%l2
	nop
	set	0x38, %o7
	stx	%i5,	[%l7 + %o7]
	call	loop_10
loop_9:
	orncc	%o3,	%g3,	%i7
	edge16n	%l6,	%i3,	%o1
	call	loop_11
loop_10:
	fmovrde	%g1,	%f22,	%f6
	call	loop_12
	fmovdu	%fcc2,	%f8,	%f0
loop_11:
	call	loop_13
	alignaddr	%i0,	%o2,	%l4
loop_12:
	sllx	%o6,	0x02,	%o7
	fmovdpos	%icc,	%f6,	%f4
loop_13:
	fmovse	%xcc,	%f23,	%f28
	fmovsle	%fcc3,	%f24,	%f20
	ldsw	[%l7 + 0x30],	%g6
	tcs	%xcc,	0x0
	call	loop_14
	fmovsvs	%icc,	%f2,	%f25
	membar	0x1E
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
loop_14:
	nop
	setx	0x9851F077,	%l0,	%l6
	st	%l6,	[%l7 + 0x3C]
	ld	[%l7 + 0x3C],	%fsr
	popc	0x153D,	%l1
	wrpr	%g7,	%g5,	%cwp
	fbule,a	%fcc1,	loop_15
	call	loop_16
	call	loop_17
	fmovdu	%fcc3,	%f4,	%f24
loop_15:
	fmovsul	%fcc0,	%f15,	%f13
loop_16:
	fmovrdgez	%i4,	%f18,	%f4
loop_17:
	orcc	%i6,	%i1,	%g2
	wrpr 	%g0, 	0x1, 	%gl
	fmovsleu	%xcc,	%f6,	%f13
	wr	%o0,	%o5,	%sys_tick
	movge	%xcc,	%o4,	%l0
	call	loop_18
	fmovdl	%fcc3,	%f30,	%f20
	fsrc2	%f12,	%f16
	andcc	%i2,	0x079D,	%g4
loop_18:
	edge16	%l2,	%i5,	%o3
	movul	%fcc2,	%i7,	%g3
	wr	%i3,	%l6,	%softint
	rdpr	%tl,	%g1
	call	loop_19
	call	loop_20
	fmovsue	%fcc2,	%f7,	%f16
	fbo,pn	%fcc3,	loop_21
loop_19:
	nop
	fitos	%f1,	%f21
	fstox	%f21,	%f24
loop_20:
	nop
	setx	loop_22,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x011100001403,	%l0,	%l1
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
	fmovsle	%fcc2,	%f5,	%f11
loop_21:
	call	loop_23
	call	loop_24
loop_22:
	call	loop_25
	movu	%fcc2,	0x5B4,	%i0
loop_23:
	call	loop_26
loop_24:
	tl	%icc,	0x4
loop_25:
	fmovsvs	%xcc,	%f30,	%f10
	movgu	%icc,	0x6E9,	%o1
loop_26:
	edge16l	%l4,	%o6,	%o7
	fmovdge	%fcc2,	%f0,	%f2
	wrpr 	%g0, 	0x1, 	%gl
	fcmpd	%fcc1,	%f16,	%f12
	udivcc	%l1,	0x131D,	%g5
	fornot2s	%f16,	%f4,	%f29
	rdhpr	%htba,	%i4
	movrne	%i6,	0x03D,	%g7
	fmovdcs	%icc,	%f12,	%f22
	faligndata	%f4,	%f14,	%f26
	call	loop_27
	fmovdneg	%icc,	%f10,	%f28
	movneg	%xcc,	0x4AD,	%g2
	fmovduge	%fcc2,	%f6,	%f26
loop_27:
	nop
	setx	0xE556DDEA,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f25
	setx	0x08358A2C,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f24
	fsubs	%f24,	%f25,	%f12
	fnors	%f9,	%f21,	%f24
	call	loop_28
	fmovspos	%xcc,	%f18,	%f27
	call	loop_29
	fsrc2s	%f31,	%f5
loop_28:
	fmovscc	%xcc,	%f20,	%f13
	call	loop_30
loop_29:
	edge32l	%i1,	%l3,	%l5
	call	loop_31
	fbuge,a,pn	%fcc3,	loop_32
loop_30:
	nop
	set	0x38, %o1
	ldd	[%l7 + %o1],	%o4
	fmul8ulx16	%f26,	%f28,	%f26
loop_31:
	tge	%icc,	0x6
loop_32:
	call	loop_33
	fornot1s	%f1,	%f23,	%f20
	sub	%o4,	%o0,	%l0
	call	loop_34
loop_33:
	bshuffle	%f4,	%f6,	%f20
	popc	0x0A44,	%i2
	wr 	%g0, 	0x4, 	%fprs
loop_34:
	call	loop_35
	call	loop_36
	call	loop_37
	nop
	setx	loop_38,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x012400001403,	%l0,	%l1
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
loop_35:
	call	loop_39
loop_36:
	call	loop_40
loop_37:
	stx	%o3,	[%l7 + 0x70]
loop_38:
	wr 	%g0, 	0x6, 	%fprs
loop_39:
	tsubcc	%g3,	0x150C,	%i7
loop_40:
	call	loop_41
	call	loop_42
	fbug,a	%fcc2,	loop_43
	call	loop_44
loop_41:
	movpos	%xcc,	%i3,	%g1
loop_42:
	fmovdul	%fcc2,	%f28,	%f18
loop_43:
	call	loop_45
loop_44:
	move	%icc,	%l6,	%i0
	call	loop_46
	call	loop_47
loop_45:
	flushw
	rdpr	%canrestore,	%l4
loop_46:
	tne	%icc,	0x1
loop_47:
	siam	0x4
	bne,a,pn	%xcc,	loop_48
	nop
	setx	0x096F,	%l0,	%o1
	sdiv	%o6,	%o1,	%g6
	fpsub32s	%f5,	%f23,	%f13
	fpsub32	%f14,	%f18,	%f6
loop_48:
	bmask	%o2,	%l1,	%o7
	wr 	%g0, 	0x5, 	%fprs
	tge	%xcc,	0x1
	fandnot2s	%f1,	%f0,	%f27
	subc	%i4,	0x10B5,	%i6
	call	loop_49
	movue	%fcc2,	%g7,	%i1
	mulx	%l3,	0x07AC,	%g2
	call	loop_50
loop_49:
	fnot1s	%f12,	%f15
	call	loop_51
	edge32l	%o5,	%l5,	%o4
loop_50:
	nop
	set	0x40, %g7
	ldda	[%l7 + %g7] 0x10,	%f16
loop_51:
	nop
	set	0x3C, %i3
	ldsw	[%l7 + %i3],	%l0
	brlz,pt	%o0,	loop_52
	call	loop_53
	bmask	%i2,	%l2,	%o3
	fcmpne16	%f10,	%f30,	%g4
loop_52:
	nop
	wr	%g0,	0x19,	%asi
	ldda	[%l7 + 0x60] %asi,	%i4
loop_53:
	call	loop_54
	call	loop_55
	movrgz	%i7,	0x090,	%i3
	movle	%fcc0,	0x3A0,	%g1
loop_54:
	fsrc1s	%f14,	%f6
loop_55:
	movpos	%xcc,	%g3,	%l6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	nop
	setx	0xEAC33E60,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f18
	fsqrts	%f18,	%f4
	call	loop_56
	fbul,pn	%fcc0,	loop_57
	stx	%fsr,	[%l7 + 0x58]
	call	loop_58
loop_56:
	nop

loop_57:
	nop

loop_58:
	nop

	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 0:
!
!	Type l   	: 12
!	Type a   	: 16
!	Type cti   	: 58
!	Type x   	: 3
!	Type f   	: 58
!	Type i   	: 53
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
	set	0x8,	%g1
	set	0xE,	%g2
	set	0x0,	%g3
	set	0x1,	%g4
	set	0x2,	%g5
	set	0x8,	%g6
	set	0x0,	%g7
	!# Input registers
	set	-0x7,	%i0
	set	-0xF,	%i1
	set	-0x7,	%i2
	set	-0x5,	%i3
	set	-0x9,	%i4
	set	-0xB,	%i5
	set	-0x0,	%i6
	set	-0x2,	%i7
	!# Local registers
	set	0x179C6492,	%l0
	set	0x5532043A,	%l1
	set	0x5F233E42,	%l2
	set	0x7DFFB696,	%l3
	set	0x2BCD6C8F,	%l4
	set	0x2DB5DB01,	%l5
	set	0x1BFBC3F8,	%l6
	!# Output registers
	set	-0x0B59,	%o0
	set	-0x13BF,	%o1
	set	-0x0A96,	%o2
	set	0x0DD9,	%o3
	set	0x128A,	%o4
	set	-0x05AC,	%o5
	set	0x0179,	%o6
	set	0x0BD2,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x2935C9E687811231)
	INIT_TH_FP_REG(%l7,%f2,0x7F66F0C3CCA58A3E)
	INIT_TH_FP_REG(%l7,%f4,0x3AEC2E41FEB9AA02)
	INIT_TH_FP_REG(%l7,%f6,0xD137B4286AC51173)
	INIT_TH_FP_REG(%l7,%f8,0xDF2A93DC6F76B7AC)
	INIT_TH_FP_REG(%l7,%f10,0x738EF5DEB9BBCDE7)
	INIT_TH_FP_REG(%l7,%f12,0xA069D47C4AE8A83A)
	INIT_TH_FP_REG(%l7,%f14,0xDEAD52076D4DD849)
	INIT_TH_FP_REG(%l7,%f16,0x290589D71269A573)
	INIT_TH_FP_REG(%l7,%f18,0x8A4D73884272FB8D)
	INIT_TH_FP_REG(%l7,%f20,0x66FF312585370073)
	INIT_TH_FP_REG(%l7,%f22,0x679745628EAF82E8)
	INIT_TH_FP_REG(%l7,%f24,0xD1C5000CAB9080BF)
	INIT_TH_FP_REG(%l7,%f26,0x6758B9BD274DD177)
	INIT_TH_FP_REG(%l7,%f28,0x81A11D697B2F9466)
	INIT_TH_FP_REG(%l7,%f30,0xB5D320B9EF520111)

	!# Execute Main Diag ..

	call	loop_59
	edge16ln	%o1,	%g6,	%o6
	call	loop_60
	bmask	%l1,	%o2,	%o7
loop_59:
	movgu	%icc,	%i4,	%i6
	call	loop_61
loop_60:
	fpmerge	%f31,	%f25,	%f6
	fbule,a	%fcc2,	loop_62
	call	loop_63
loop_61:
	nop
	set	0x30, %o2
	ldub	[%l7 + %o2],	%g7
	fnegs	%f8,	%f19
loop_62:
	rdpr	%tba,	%g5
loop_63:
	movule	%fcc0,	%i1,	%g2
	call	loop_64
	fcmpeq32	%f24,	%f24,	%o5
	fmovrsgez	%l3,	%f28,	%f26
	call	loop_65
loop_64:
	movre	%o4,	0x377,	%l0
	call	loop_66
	call	loop_67
loop_65:
	fcmpgt32	%f14,	%f4,	%o0
	bg,a,pt	%icc,	loop_68
loop_66:
	movrgz	%i2,	%l5,	%l2
loop_67:
	movcs	%icc,	%o3,	%g4
	subccc	%i7,	0x1000,	%i3
loop_68:
	srl	%i5,	%g1,	%l6
	call	loop_69
	call	loop_70
	fpadd32	%f30,	%f10,	%f0
	fpsub32	%f0,	%f24,	%f16
loop_69:
	fbu,a,pn	%fcc1,	loop_71
loop_70:
	movlg	%fcc1,	%l4,	%g3
	call	loop_72
	array16	%i0,	%g6,	%o6
loop_71:
	addc	%l1,	%o1,	%o7
	fmovdug	%fcc2,	%f22,	%f16
loop_72:
	nop
	set	0x34, %l1
	flush	%l7 + %l1
	fmovsvc	%icc,	%f3,	%f8
	nop
	setx	0x74F94326,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f20
	setx	0x6CB08A2D,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f13
	fdivs	%f13,	%f20,	%f8
	fmovsvc	%icc,	%f21,	%f7
	rdpr	%pil,	%o2
	subc	%i4,	%i6,	%g7
	call	loop_73
	call	loop_74
	movo	%fcc2,	%g5,	%i1
	movleu	%icc,	0x318,	%g2
loop_73:
	call	loop_75
loop_74:
	fmovsle	%fcc0,	%f10,	%f5
	fmul8x16al	%f31,	%f15,	%f8
	nop
	set	0x41, %g2
	ldstub	[%l7 + %g2],	%l3
loop_75:
	call	loop_76
	move	%fcc0,	%o5,	%o4
	membar	0x6E
	movvc	%icc,	%l0,	%i2
loop_76:
	call	loop_77
	movrgez	%o0,	%l2,	%l5
	movg	%icc,	%g4,	%o3
	nop
	setx	0x4577075E,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f4
	setx	0xA630694B,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f19
	fsubs	%f19,	%f4,	%f31
loop_77:
	movu	%fcc3,	%i3,	%i5
	tg	%icc,	0x5
	fcmps	%fcc2,	%f17,	%f10
	edge16	%i7,	%l6,	%l4
	rdpr	%cleanwin,	%g1
	call	loop_78
	fmovsne	%xcc,	%f10,	%f27
	fpackfix	%f26,	%f26
	movcc	%icc,	0x344,	%i0
loop_78:
	call	loop_79
	fpack16	%f12,	%f15
	fmovdue	%fcc0,	%f14,	%f28
	fmovsgu	%icc,	%f9,	%f16
loop_79:
	fzero	%f26
	smulcc	%g6,	0x0B0C,	%g3
	faligndata	%f20,	%f10,	%f24
	sethi	0x1220,	%o6
	rdpr	%cansave,	%o1
	fmovsuge	%fcc0,	%f19,	%f28
	fcmpeq16	%f30,	%f14,	%o7
	call	loop_80
	call	loop_81
	wrpr	%o2,	0x1876,	%cwp
	fmovsg	%fcc2,	%f15,	%f12
loop_80:
	nop
	set	0x22, %g3
	ldstuba	[%l7 + %g3] 0x04,	%i4
loop_81:
	call	loop_82
	fand	%f18,	%f2,	%f16
	fmovsuge	%fcc3,	%f14,	%f8
	call	loop_83
loop_82:
	fabsd	%f12,	%f26
	call	loop_84
	movne	%fcc3,	%l1,	%g7
loop_83:
	flushw
	fbge,a	%fcc3,	loop_85
loop_84:
	edge8l	%i6,	%i1,	%g2
	nop
	setx	0xF093B6DA8FA4901B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0x392890CAEAEF5C75,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	fmuld	%f8,	%f30,	%f28
	nop
	set	0x6C, %i1
	ldsw	[%l7 + %i1],	%g5
loop_85:
	nop
	setx	0xAA57DA77,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f29
	setx	0x8FA87AC3,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f16
	fsubs	%f16,	%f29,	%f11
	fbule,a	%fcc3,	loop_86
	fmovso	%fcc1,	%f2,	%f14
	bmask	%o5,	%o4,	%l0
	fmovrslz	%i2,	%f1,	%f11
loop_86:
	nop
	set	0x70, %l3
	stda	%o0,	[%l7 + %l3] 0xe3
	membar	#Sync
	call	loop_87
	nop
	set	0x50, %g4
	ldd	[%l7 + %g4],	%l2
	call	loop_88
	fba,a,pn	%fcc1,	loop_89
loop_87:
	tn	%icc,	0x1
	call	loop_90
loop_88:
	call	loop_91
loop_89:
	udivx	%l5,	0x0BE6,	%l2
	tvs	%xcc,	0x0
loop_90:
	fandnot1	%f10,	%f6,	%f30
loop_91:
	edge32n	%o3,	%i3,	%g4
	fmovdue	%fcc0,	%f4,	%f24
	orcc	%i5,	0x1B54,	%i7
	bgu,pn	%xcc,	loop_92
	bcc,pn	%xcc,	loop_93
	orncc	%l4,	%g1,	%i0
	call	loop_94
loop_92:
	tvs	%icc,	0x2
loop_93:
	call	loop_95
	call	loop_96
loop_94:
	fmovdu	%fcc3,	%f8,	%f0
	addcc	%l6,	0x0814,	%g3
loop_95:
	movpos	%icc,	0x445,	%g6
loop_96:
	for	%f18,	%f12,	%f20
	edge16	%o6,	%o1,	%o7
	subccc	%i4,	%l1,	%o2
	be,a	%xcc,	loop_97
	tne	%icc,	0x0
	prefetch	[%l7 + 0x7C],	 4
	call	loop_98
loop_97:
	call	loop_99
	fmuld8ulx16	%f17,	%f8,	%f16
	bpos,pn	%xcc,	loop_100
loop_98:
	fmuld8ulx16	%f25,	%f18,	%f4
loop_99:
	call	loop_101
	te	%xcc,	0x4
loop_100:
	call	loop_102
	bg,a,pt	%icc,	loop_103
loop_101:
	call	loop_104
	call	loop_105
loop_102:
	fmuld8sux16	%f9,	%f15,	%f12
loop_103:
	call	loop_106
loop_104:
	fmovsle	%xcc,	%f24,	%f3
loop_105:
	fmovda	%icc,	%f30,	%f16
	call	loop_107
loop_106:
	fmovsg	%xcc,	%f9,	%f18
	andncc	%i6,	%g7,	%i1
	nop
	setx	0x0C32,	%l0,	%o5
	udivx	%g2,	%o5,	%g5
loop_107:
	fands	%f12,	%f6,	%f26
	fmovd	%f6,	%f8
	srl	%l0,	%o4,	%i2
	st	%fsr,	[%l7 + 0x24]
	sth	%o0,	[%l7 + 0x3A]
	call	loop_108
	call	loop_109
	call	loop_110
	fones	%f31
loop_108:
	call	loop_111
loop_109:
	call	loop_112
loop_110:
	ta	%icc,	0x1
	or	%l3,	0x1F28,	%l2
loop_111:
	fands	%f30,	%f22,	%f11
loop_112:
	wr	%l5,	0x01B2,	%ccr
	nop
	fitos	%f9,	%f15
	rd	%fprs,	%o3
	srlx	%i3,	0x1C,	%i5
	call	loop_113
	bgu,a,pt	%icc,	loop_114
	bpos	%xcc,	loop_115
	nop
	fitos	%f0,	%f11
	fstoi	%f11,	%f13
loop_113:
	sir	0x19B8
loop_114:
	fmuld8sux16	%f6,	%f18,	%f8
loop_115:
	call	loop_116
	fors	%f11,	%f0,	%f21
	movre	%i7,	0x03A,	%l4
	brgez	%g1,	loop_117
loop_116:
	flushw
	movuge	%fcc2,	%i0,	%g4
	and	%g3,	%l6,	%o6
loop_117:
	fcmpgt32	%f2,	%f6,	%o1
	movrgez	%g6,	0x092,	%o7
	bvs,pt	%xcc,	loop_118
	call	loop_119
	brlz,a	%i4,	loop_120
	call	loop_121
loop_118:
	nop
	setx	0xD130CF2C8EC9F7A0,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0x7945F512125B7C17,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	faddd	%f16,	%f14,	%f24
loop_119:
	call	loop_122
loop_120:
	call	loop_123
loop_121:
	call	loop_124
	call	loop_125
loop_122:
	smulcc	%o2,	0x00F9,	%i6
loop_123:
	call	loop_126
loop_124:
	fpack16	%f28,	%f3
loop_125:
	bmask	%l1,	%i1,	%g2
	sethi	0x054A,	%g7
loop_126:
	wrpr	%o5,	0x1087,	%cwp
	movrlez	%l0,	%o4,	%i2
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 1:
!
!	Type l   	: 10
!	Type a   	: 8
!	Type x   	: 2
!	Type cti   	: 68
!	Type f   	: 53
!	Type i   	: 59
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
	set	0x1,	%g2
	set	0x1,	%g3
	set	0x8,	%g4
	set	0x8,	%g5
	set	0x0,	%g6
	set	0x7,	%g7
	!# Input registers
	set	-0xA,	%i0
	set	-0x2,	%i1
	set	-0xB,	%i2
	set	-0x3,	%i3
	set	-0x8,	%i4
	set	-0xD,	%i5
	set	-0x3,	%i6
	set	-0x1,	%i7
	!# Local registers
	set	0x4796B61D,	%l0
	set	0x30B828B0,	%l1
	set	0x431A4878,	%l2
	set	0x4A065B4E,	%l3
	set	0x50E77C3C,	%l4
	set	0x0A6D34AC,	%l5
	set	0x76019E3F,	%l6
	!# Output registers
	set	0x13F1,	%o0
	set	0x1525,	%o1
	set	0x1207,	%o2
	set	0x08A3,	%o3
	set	-0x0541,	%o4
	set	0x093B,	%o5
	set	-0x0A4E,	%o6
	set	-0x02CF,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x2935C9E687811231)
	INIT_TH_FP_REG(%l7,%f2,0x7F66F0C3CCA58A3E)
	INIT_TH_FP_REG(%l7,%f4,0x3AEC2E41FEB9AA02)
	INIT_TH_FP_REG(%l7,%f6,0xD137B4286AC51173)
	INIT_TH_FP_REG(%l7,%f8,0xDF2A93DC6F76B7AC)
	INIT_TH_FP_REG(%l7,%f10,0x738EF5DEB9BBCDE7)
	INIT_TH_FP_REG(%l7,%f12,0xA069D47C4AE8A83A)
	INIT_TH_FP_REG(%l7,%f14,0xDEAD52076D4DD849)
	INIT_TH_FP_REG(%l7,%f16,0x290589D71269A573)
	INIT_TH_FP_REG(%l7,%f18,0x8A4D73884272FB8D)
	INIT_TH_FP_REG(%l7,%f20,0x66FF312585370073)
	INIT_TH_FP_REG(%l7,%f22,0x679745628EAF82E8)
	INIT_TH_FP_REG(%l7,%f24,0xD1C5000CAB9080BF)
	INIT_TH_FP_REG(%l7,%f26,0x6758B9BD274DD177)
	INIT_TH_FP_REG(%l7,%f28,0x81A11D697B2F9466)
	INIT_TH_FP_REG(%l7,%f30,0xB5D320B9EF520111)

	!# Execute Main Diag ..

	fands	%f30,	%f22,	%f7
	te	%icc,	0x7
	call	loop_127
	fmovslg	%fcc1,	%f30,	%f24
	call	loop_128
	call	loop_129
loop_127:
	fmovrdne	%o0,	%f14,	%f12
	or	%g5,	0x1DE7,	%l3
loop_128:
	tge	%xcc,	0x4
loop_129:
	call	loop_130
	call	loop_131
	call	loop_132
	fnot1s	%f4,	%f25
loop_130:
	call	loop_133
loop_131:
	call	loop_134
loop_132:
	fbul	%fcc3,	loop_135
	edge8l	%l2,	%l5,	%o3
loop_133:
	fpsub16	%f12,	%f14,	%f14
loop_134:
	addccc	%i3,	0x0A9A,	%i7
loop_135:
	fmovdu	%fcc0,	%f2,	%f4
	edge32l	%l4,	%i5,	%g1
	nop
	set	0x50, %l2
	ldd	[%l7 + %l2],	%g4
	edge16ln	%i0,	%g3,	%l6
	tvc	%icc,	0x1
	wr	%g0,	0x81,	%asi
	stwa	%o6,	[%l7 + 0x2C] %asi
	rdhpr	%hintp,	%g6
	for	%f30,	%f0,	%f30
	array32	%o7,	%o1,	%o2
	fxors	%f18,	%f6,	%f9
	call	loop_136
	fpackfix	%f0,	%f8
	call	loop_137
	andncc	%i4,	0x1EA9,	%l1
loop_136:
	alignaddrl	%i6,	%i1,	%g7
	call	loop_138
loop_137:
	rdpr	%cleanwin,	%g2
	nop
	fitod	%f6,	%f0
	fdtos	%f0,	%f2
	fbule	%fcc1,	loop_139
loop_138:
	mulx	%o5,	%l0,	%i2
	wr	%o0,	%g5,	%pic
	edge32n	%l3,	%l2,	%l5
loop_139:
	call	loop_140
	fsrc1	%f6,	%f12
	call	loop_141
	tle	%icc,	0x3
loop_140:
	edge8ln	%o4,	%o3,	%i3
	tvs	%xcc,	0x5
loop_141:
	call	loop_142
	fbn,pt	%fcc2,	loop_143
	call	loop_144
	addccc	%i7,	0x0992,	%i5
loop_142:
	call	loop_145
loop_143:
	movrlz	%l4,	0x319,	%g1
loop_144:
	call	loop_146
	nop
	setx loop_147, %l0, %l1
	jmpl %l1, %i0
loop_145:
	movug	%fcc2,	0x444,	%g3
	fbul,a,pn	%fcc1,	loop_148
loop_146:
	ldd	[%l7 + 0x68],	%g4
loop_147:
	tneg	%icc,	0x7
	call	loop_149
loop_148:
	call	loop_150
	edge32ln	%l6,	%o6,	%g6
	nop
	setx	0xC0CCD74A,	%l0,	%l6
	st	%l6,	[%l7 + 0x68]
	ld	[%l7 + 0x68],	%fsr
loop_149:
	call	loop_151
loop_150:
	movrne	%o7,	0x2B0,	%o1
	fmovscc	%icc,	%f26,	%f9
	movle	%fcc3,	0x1DB,	%i4
loop_151:
	call	loop_152
	fmovdle	%xcc,	%f4,	%f0
	call	loop_153
	edge32	%o2,	%l1,	%i1
loop_152:
	nop
	setx	0xC0A5CCD16531F3D7,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0xD98D3149EA7B504B,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	fsubd	%f6,	%f6,	%f4
	movn	%icc,	0x2FE,	%g7
loop_153:
	fmovd	%f28,	%f10
	fxor	%f18,	%f26,	%f14
	alignaddrl	%i6,	%g2,	%l0
	nop
	setx	loop_154,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x031400001400,	%l0,	%l1
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
	fitos	%f5,	%f16
	fstoi	%f16,	%f23
	tgu	%icc,	0x6
	movrgz	%o5,	%i2,	%g5
loop_154:
	movle	%fcc3,	%o0,	%l3
	call	loop_155
	fmovsl	%icc,	%f28,	%f9
	tge	%xcc,	0x5
	call	loop_156
loop_155:
	fmovrdne	%l2,	%f26,	%f26
	fbug,a,pn	%fcc2,	loop_157
	andncc	%o4,	%o3,	%l5
loop_156:
	fmovdvc	%icc,	%f6,	%f18
	fmul8ulx16	%f6,	%f14,	%f8
loop_157:
	edge16ln	%i7,	%i5,	%l4
	smulcc	%g1,	%i3,	%g3
	call	loop_158
	fmovdneg	%xcc,	%f20,	%f18
	fnands	%f15,	%f20,	%f18
	call	loop_159
loop_158:
	rd	%y,	%g4
	andcc	%l6,	0x02C9,	%i0
	call	loop_160
loop_159:
	pdist	%f12,	%f26,	%f2
	fandnot1s	%f1,	%f7,	%f15
	call	loop_161
loop_160:
	fnor	%f8,	%f10,	%f6
	fmovslg	%fcc2,	%f16,	%f6
	call	loop_162
loop_161:
	taddcc	%o6,	%o7,	%o1
	fbl,pt	%fcc3,	loop_163
	nop
	fitos	%f12,	%f19
	fstoi	%f19,	%f19
loop_162:
	call	loop_164
	or	%g6,	0x1F12,	%o2
loop_163:
	fmovdcc	%xcc,	%f8,	%f30
	call	loop_165
loop_164:
	call	loop_166
	call	loop_167
	fcmple32	%f28,	%f8,	%l1
loop_165:
	fmovrsgz	%i1,	%f11,	%f2
loop_166:
	nop
	add	%l7,	0x7C,	%l6
	wr	%g0,	0x11,	%asi
	casa	[%l6] 0x11,	%g7,	%i4
loop_167:
	call	loop_168
	movrgez	%g2,	%i6,	%o5
	call	loop_169
	fbue,a,pn	%fcc3,	loop_170
loop_168:
	call	loop_171
	alignaddrl	%i2,	%g5,	%o0
loop_169:
	fmovrse	%l3,	%f8,	%f30
loop_170:
	call	loop_172
loop_171:
	fcmpeq16	%f28,	%f22,	%l0
	nop
	set	0x30, %o4
	stw	%l2,	[%l7 + %o4]
	call	loop_173
loop_172:
	ta	%icc,	0x5
	call	loop_174
	tsubcctv	%o4,	0x0834,	%l5
loop_173:
	movne	%fcc0,	0x483,	%o3
	call	loop_175
loop_174:
	bleu,a,pn	%xcc,	loop_176
	call	loop_177
	fmul8sux16	%f6,	%f16,	%f10
loop_175:
	wrpr	%i5,	0x06AD,	%cwp
loop_176:
	call	loop_178
loop_177:
	fmovdge	%xcc,	%f0,	%f22
	fones	%f17
	rdhpr	%hsys_tick_cmpr,	%l4
loop_178:
	fmovdg	%fcc2,	%f2,	%f20
	call	loop_179
	movcs	%icc,	%i7,	%g1
	sll	%i3,	%g3,	%l6
	call	loop_180
loop_179:
	fmovsgu	%xcc,	%f21,	%f23
	call	loop_181
	wrpr	%i0,	%g4,	%pil
loop_180:
	fcmpd	%fcc1,	%f24,	%f4
	call	loop_182
loop_181:
	movre	%o7,	%o6,	%g6
	fmovdlg	%fcc3,	%f30,	%f18
	call	loop_183
loop_182:
	call	loop_184
	fsrc1s	%f21,	%f2
	fmovscs	%icc,	%f11,	%f2
loop_183:
	flushw
loop_184:
	fornot1s	%f8,	%f30,	%f17
	tle	%xcc,	0x4
	alignaddr	%o1,	%l1,	%o2
	call	loop_185
	fabss	%f21,	%f16
	subc	%i1,	0x15D6,	%g7
	nop
	fitos	%f5,	%f6
	fstod	%f6,	%f12
loop_185:
	brgez,a,pt	%i4,	loop_186
	nop
	setx	0x3B0D25140AB34FC2,	%l0,	%l6
	stx	%l6,	[%l7 + 0x30]
	ldx	[%l7 + 0x30],	%fsr
	call	loop_187
	fbn	%fcc0,	loop_188
loop_186:
	call	loop_189
	call	loop_190
loop_187:
	fandnot1s	%f12,	%f7,	%f10
loop_188:
	nop
	wr	%g0,	0xda,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
loop_189:
	rdhpr	%htba,	%i6
loop_190:
	fmul8x16au	%f20,	%f12,	%f12
	tvs	%xcc,	0x5
	fxnor	%f14,	%f30,	%f6
	fnors	%f26,	%f4,	%f5
	nop
	set	0x14, %o3
	sth	%g2,	[%l7 + %o3]
	nop
	setx loop_191, %l0, %l1
	jmpl %l1, %i2
	bn,pt	%xcc,	loop_192
	ta	%icc,	0x4
	call	loop_193
loop_191:
	call	loop_194
loop_192:
	sdivx	%o5,	0x19E1,	%g5
	be,pt	%icc,	loop_195
loop_193:
	tle	%xcc,	0x5
loop_194:
	call	loop_196
	fones	%f2
loop_195:
	rdpr	%gl,	%o0
	call	loop_197
loop_196:
	nop
	setx	0xBB30BFA6B186C813,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0x0B025656D0BB85D7,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	fsubd	%f22,	%f30,	%f18
	fmovdn	%xcc,	%f14,	%f14
	fmovso	%fcc3,	%f5,	%f16
loop_197:
	movcc	%icc,	0x1C4,	%l3
	fmovsug	%fcc2,	%f15,	%f17
	call	loop_198
loop_198:
	nop

	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 2:
!
!	Type l   	: 9
!	Type a   	: 9
!	Type x   	: 3
!	Type cti   	: 72
!	Type f   	: 54
!	Type i   	: 53
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
	set	0x5,	%g1
	set	0xC,	%g2
	set	0x9,	%g3
	set	0x5,	%g4
	set	0x2,	%g5
	set	0x3,	%g6
	set	0xC,	%g7
	!# Input registers
	set	-0x2,	%i0
	set	-0x7,	%i1
	set	-0xD,	%i2
	set	-0x6,	%i3
	set	-0x1,	%i4
	set	-0xD,	%i5
	set	-0x6,	%i6
	set	-0xB,	%i7
	!# Local registers
	set	0x6FFC76FB,	%l0
	set	0x0E403E6E,	%l1
	set	0x6DDB609F,	%l2
	set	0x5E221332,	%l3
	set	0x40244085,	%l4
	set	0x4AC87F92,	%l5
	set	0x19B6E589,	%l6
	!# Output registers
	set	0x0162,	%o0
	set	0x1DBF,	%o1
	set	-0x17C4,	%o2
	set	0x0F73,	%o3
	set	0x083B,	%o4
	set	0x14E5,	%o5
	set	0x11E9,	%o6
	set	-0x1159,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x2935C9E687811231)
	INIT_TH_FP_REG(%l7,%f2,0x7F66F0C3CCA58A3E)
	INIT_TH_FP_REG(%l7,%f4,0x3AEC2E41FEB9AA02)
	INIT_TH_FP_REG(%l7,%f6,0xD137B4286AC51173)
	INIT_TH_FP_REG(%l7,%f8,0xDF2A93DC6F76B7AC)
	INIT_TH_FP_REG(%l7,%f10,0x738EF5DEB9BBCDE7)
	INIT_TH_FP_REG(%l7,%f12,0xA069D47C4AE8A83A)
	INIT_TH_FP_REG(%l7,%f14,0xDEAD52076D4DD849)
	INIT_TH_FP_REG(%l7,%f16,0x290589D71269A573)
	INIT_TH_FP_REG(%l7,%f18,0x8A4D73884272FB8D)
	INIT_TH_FP_REG(%l7,%f20,0x66FF312585370073)
	INIT_TH_FP_REG(%l7,%f22,0x679745628EAF82E8)
	INIT_TH_FP_REG(%l7,%f24,0xD1C5000CAB9080BF)
	INIT_TH_FP_REG(%l7,%f26,0x6758B9BD274DD177)
	INIT_TH_FP_REG(%l7,%f28,0x81A11D697B2F9466)
	INIT_TH_FP_REG(%l7,%f30,0xB5D320B9EF520111)

	!# Execute Main Diag ..

	sir	0x0563
	movle	%icc,	0x4C8,	%l0
	rd	%tick_cmpr,	%l2
	fbuge,a	%fcc0,	loop_199
	fxor	%f28,	%f6,	%f20
	fxnor	%f10,	%f4,	%f16
	call	loop_200
loop_199:
	call	loop_201
	movg	%fcc0,	0x247,	%l5
	fmovdgu	%xcc,	%f18,	%f28
loop_200:
	fnors	%f5,	%f2,	%f5
loop_201:
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	rd	%sys_tick_cmpr,	%o4
	call	loop_202
	rdpr	%otherwin,	%i5
	fcmpgt32	%f28,	%f26,	%o3
	fmovdcc	%icc,	%f16,	%f6
loop_202:
	alignaddrl	%l4,	%g1,	%i3
	edge8	%i7,	%l6,	%i0
	fxor	%f8,	%f22,	%f22
	movvc	%xcc,	0x340,	%g3
	addcc	%o7,	%o6,	%g6
	call	loop_203
	call	loop_204
	fpsub16	%f16,	%f16,	%f4
	tvs	%icc,	0x2
loop_203:
	call	loop_205
loop_204:
	addccc	%o1,	0x113A,	%g4
	call	loop_206
	nop
	fitod	%f12,	%f16
	fdtoi	%f16,	%f9
loop_205:
	call	loop_207
	brgz,pn	%o2,	loop_208
loop_206:
	tneg	%icc,	0x7
	fmovde	%icc,	%f30,	%f4
loop_207:
	call	loop_209
loop_208:
	fnot1s	%f9,	%f27
	fmovdn	%icc,	%f26,	%f28

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_209:
	call	loop_210
	fmovdlg	%fcc0,	%f4,	%f16
	array32	%g7,	%l1,	%i6
	fnot2s	%f4,	%f25
loop_210:
	fcmpeq16	%f20,	%f14,	%g2
	nop
	fitos	%f6,	%f29
	fstox	%f29,	%f22
	wr	%g0,	0xf8,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
	movrgz	%i2,	%i4,	%o5
	lduw	[%l7 + 0x4C],	%o0
	ldstub	[%l7 + 0x31],	%l3
	call	loop_211
	fmovrsgz	%l0,	%f23,	%f22
	movre	%l2,	0x3C4,	%l5
	call	loop_212
loop_211:
	addccc	%g5,	0x1CEB,	%o4
	call	loop_213
	fmovsn	%fcc0,	%f17,	%f18
loop_212:
	call	loop_214
	fmovrsgz	%o3,	%f10,	%f1
loop_213:
	movrlez	%l4,	%i5,	%g1
	brgz,pn	%i3,	loop_215
loop_214:
	ldsb	[%l7 + 0x53],	%i7
	call	loop_216
	rdhpr	%ver,	%i0
loop_215:
	fmovdneg	%icc,	%f24,	%f8
	call	loop_217
loop_216:
	fbue	%fcc1,	loop_218
	faligndata	%f28,	%f14,	%f30
	call	loop_219
loop_217:
	sll	%l6,	0x01,	%o7
loop_218:
	xnor	%o6,	%g6,	%g3
	fmovrslz	%g4,	%f6,	%f4
loop_219:
	call	loop_220
	rdhpr	%ver,	%o2
	edge16n	%i1,	%g7,	%l1
	fmovsuge	%fcc3,	%f23,	%f17
loop_220:
	call	loop_221
	tle	%xcc,	0x6
	rdhpr	%htba,	%i6
	call	loop_222
loop_221:
	srlx	%o1,	%g2,	%i4
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	wr	%g0,	0x18,	%asi
	lduba	[%l7 + 0x5E] %asi,	%o5
loop_222:
	fmovsne	%xcc,	%f30,	%f23
	wr	%g0,	0x0c,	%asi
	ldstuba	[%l7 + 0x5D] %asi,	%i2
	fbge,a	%fcc1,	loop_223
	call	loop_224
	tvs	%icc,	0x1
	set	0x30, %o0
	stda	%o0,	[%l7 + %o0] 0x27
	membar	#Sync
loop_223:
	fmovdul	%fcc0,	%f28,	%f12
loop_224:
	tl	%xcc,	0x5
	bvc,a,pt	%icc,	loop_225
	fxnors	%f15,	%f1,	%f27
	call	loop_226
	fors	%f26,	%f21,	%f18
loop_225:
	nop
	setx	0x1DCB,	%l0,	%l3
	sdiv	%l0,	%l3,	%l5
	fsrc2	%f14,	%f16
loop_226:
	call	loop_227
	movrne	%l2,	0x317,	%g5
	fandnot1	%f6,	%f28,	%f20
	call	loop_228
loop_227:
	flushw
	flushw
	call	loop_229
loop_228:
	fcmpgt32	%f0,	%f14,	%o4
	edge32	%o3,	%i5,	%g1
	nop
	fitod	%f10,	%f6
	fdtos	%f6,	%f4
loop_229:
	addc	%l4,	0x0511,	%i7
	sdivcc	%i0,	0x1E92,	%i3
	array16	%l6,	%o6,	%o7
	movne	%fcc2,	%g6,	%g4
	call	loop_230
	bne	%icc,	loop_231
	mulx	%o2,	%g3,	%g7
	call	loop_232
loop_230:
	smul	%i1,	0x0E44,	%i6
loop_231:
	movue	%fcc0,	%l1,	%o1
	array32	%g2,	%i4,	%o5
loop_232:
	sub	%o0,	%i2,	%l0
	call	loop_233
	fmovda	%fcc2,	%f24,	%f22
	call	loop_234
	call	loop_235
loop_233:
	mova	%icc,	%l3,	%l2
	addcc	%l5,	0x1266,	%o4
loop_234:
	mulx	%g5,	%i5,	%g1
loop_235:
	array8	%o3,	%l4,	%i7
	sdiv	%i3,	0x0993,	%i0
	tneg	%xcc,	0x1
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	edge8ln	%o6,	%l6,	%o7
	taddcc	%g4,	0x02A2,	%o2
	popc	0x0FA8,	%g6
	fandnot2	%f0,	%f10,	%f14
	call	loop_236
	call	loop_237
	movcs	%xcc,	0x56E,	%g7
	call	loop_238
loop_236:
	fmovs	%f19,	%f14
loop_237:
	nop
	fitod	%f8,	%f20
	fdtos	%f20,	%f0
	rdhpr	%hintp,	%i1
loop_238:
	nop
	fitod	%f4,	%f18
	fdtoi	%f18,	%f4
	rdpr	%tba,	%g3
	call	loop_239
	nop
	fitos	%f11,	%f27
	fstod	%f27,	%f14
	rdhpr	%htba,	%i6
	fmuld8ulx16	%f11,	%f13,	%f16
loop_239:
	fcmpeq32	%f26,	%f16,	%o1
	fmovsle	%icc,	%f17,	%f19
	call	loop_240
	tvc	%icc,	0x5
	fmul8ulx16	%f6,	%f12,	%f26
	call	loop_241
loop_240:
	fmovrde	%g2,	%f20,	%f30
	movl	%icc,	%l1,	%i4
	brlez,a,pn	%o0,	loop_242
loop_241:
	call	loop_243
	fmovsvc	%icc,	%f21,	%f14
	subc	%o5,	0x1A8F,	%l0
loop_242:
	array32	%l3,	%l2,	%l5
loop_243:
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	call	loop_244
	call	loop_245
	wrpr	%o4,	%i2,	%tick
	fmul8sux16	%f6,	%f24,	%f4
loop_244:
	nop
	wr	%g0,	0x2f,	%asi
	stda	%g4,	[%l7 + 0x50] %asi
	membar	#Sync
loop_245:
	tsubcctv	%g1,	%o3,	%l4
	sir	0x1598
	call	loop_246
	fmovsuge	%fcc1,	%f16,	%f3
	call	loop_247
	tcc	%xcc,	0x1
loop_246:
	fbo,pn	%fcc1,	loop_248
	call	loop_249
loop_247:
	stbar
	subc	%i5,	0x1237,	%i3
loop_248:
	fmovse	%icc,	%f2,	%f6
loop_249:
	call	loop_250
	popc	0x0582,	%i0
	tgu	%icc,	0x5
	nop
	setx	0x4E210AC6,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f10
	setx	0xC398EE89,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f25
	fmuls	%f25,	%f10,	%f30
loop_250:
	movul	%fcc1,	0x53F,	%i7
	tneg	%icc,	0x4
	fsrc2	%f14,	%f16
	umul	%l6,	%o7,	%g4
	alignaddr	%o2,	%g6,	%g7
	fmovde	%xcc,	%f12,	%f6
	bcc,a	%icc,	loop_251
	rdpr	%otherwin,	%o6
	nop
	setx	0x09B7,	%l0,	%i6
	udivcc	%g3,	%i6,	%o1
	edge16l	%g2,	%l1,	%i4
loop_251:
	nop
	set	0x40, %l4
	stda	%f16,	[%l7 + %l4] 0x17
	membar	#Sync
	xorcc	%o0,	0x18E5,	%o5
	fmovdcc	%icc,	%f20,	%f20
	call	loop_252
	edge32l	%l0,	%l3,	%l2
loop_252:
	nop

	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 3:
!
!	Type l   	: 10
!	Type a   	: 12
!	Type x   	: 6
!	Type cti   	: 54
!	Type f   	: 50
!	Type i   	: 68
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
	set	0x4,	%g2
	set	0x5,	%g3
	set	0xA,	%g4
	set	0x2,	%g5
	set	0xF,	%g6
	set	0x9,	%g7
	!# Input registers
	set	-0xB,	%i0
	set	-0xA,	%i1
	set	-0x1,	%i2
	set	-0x1,	%i3
	set	-0x6,	%i4
	set	-0x9,	%i5
	set	-0xB,	%i6
	set	-0xF,	%i7
	!# Local registers
	set	0x12DB30F3,	%l0
	set	0x1147A0FE,	%l1
	set	0x640BD1F6,	%l2
	set	0x6C288FC7,	%l3
	set	0x31A09249,	%l4
	set	0x7E6F997C,	%l5
	set	0x7E902FC2,	%l6
	!# Output registers
	set	0x009C,	%o0
	set	-0x040D,	%o1
	set	-0x0B33,	%o2
	set	0x14A0,	%o3
	set	0x038D,	%o4
	set	0x0D31,	%o5
	set	0x1716,	%o6
	set	-0x1EA6,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x2935C9E687811231)
	INIT_TH_FP_REG(%l7,%f2,0x7F66F0C3CCA58A3E)
	INIT_TH_FP_REG(%l7,%f4,0x3AEC2E41FEB9AA02)
	INIT_TH_FP_REG(%l7,%f6,0xD137B4286AC51173)
	INIT_TH_FP_REG(%l7,%f8,0xDF2A93DC6F76B7AC)
	INIT_TH_FP_REG(%l7,%f10,0x738EF5DEB9BBCDE7)
	INIT_TH_FP_REG(%l7,%f12,0xA069D47C4AE8A83A)
	INIT_TH_FP_REG(%l7,%f14,0xDEAD52076D4DD849)
	INIT_TH_FP_REG(%l7,%f16,0x290589D71269A573)
	INIT_TH_FP_REG(%l7,%f18,0x8A4D73884272FB8D)
	INIT_TH_FP_REG(%l7,%f20,0x66FF312585370073)
	INIT_TH_FP_REG(%l7,%f22,0x679745628EAF82E8)
	INIT_TH_FP_REG(%l7,%f24,0xD1C5000CAB9080BF)
	INIT_TH_FP_REG(%l7,%f26,0x6758B9BD274DD177)
	INIT_TH_FP_REG(%l7,%f28,0x81A11D697B2F9466)
	INIT_TH_FP_REG(%l7,%f30,0xB5D320B9EF520111)

	!# Execute Main Diag ..

	call	loop_253
	ta	%xcc,	0x1
	add	%l7,	0x18,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%l5
	casxa	[%l6] 0x80,	%l5,	%o4
loop_253:
	popc	0x00D1,	%i1
	call	loop_254
	faligndata	%f18,	%f24,	%f26
	tcc	%icc,	0x1
	fmuld8ulx16	%f18,	%f5,	%f22
loop_254:
	wr	%g5,	%g1,	%clear_softint
	bcs	%xcc,	loop_255
	fmovspos	%icc,	%f27,	%f27
	call	loop_256
	fmuld8ulx16	%f11,	%f25,	%f2
loop_255:
	nop
	setx	0xAFC21C9C,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f16
	setx	0xEB8DF39C,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f15
	fadds	%f15,	%f16,	%f0
	fabss	%f26,	%f6
loop_256:
	addcc	%o3,	0x10F4,	%l4
	addcc	%i5,	%i3,	%i0
	move	%fcc2,	0x1CE,	%i7
	call	loop_257
	call	loop_258
	call	loop_259
	bleu,pn	%xcc,	loop_260
loop_257:
	call	loop_261
loop_258:
	udivx	%l6,	0x0618,	%i2
loop_259:
	tleu	%icc,	0x6
loop_260:
	bg,pn	%xcc,	loop_262
loop_261:
	call	loop_263
	fmovso	%fcc3,	%f10,	%f7
	call	loop_264
loop_262:
	fmovsue	%fcc2,	%f5,	%f10
loop_263:
	movue	%fcc2,	%g4,	%o7
	call	loop_265
loop_264:
	rdhpr	%hsys_tick_cmpr,	%o2
	nop
	set	0x7A, %i4
	ldstub	[%l7 + %i4],	%g7
	call	loop_266
loop_265:
	xorcc	%o6,	0x03AA,	%g6
	edge16n	%i6,	%o1,	%g2
	fmovrdgez	%g3,	%f24,	%f8
loop_266:
	tvs	%xcc,	0x1
	fzeros	%f12
	alignaddrl	%l1,	%o0,	%o5
	fornot2s	%f9,	%f26,	%f31
	tne	%xcc,	0x3
	fpadd16	%f18,	%f30,	%f28
	andcc	%l0,	0x07D9,	%i4
	fmovrsgz	%l2,	%f8,	%f28
	fmovsule	%fcc1,	%f23,	%f1
	call	loop_267
	call	loop_268
	call	loop_269
	edge8n	%l5,	%l3,	%o4
loop_267:
	call	loop_270
loop_268:
	sethi	0x1296,	%i1
loop_269:
	call	loop_271
	call	loop_272
loop_270:
	call	loop_273
	movug	%fcc3,	0x451,	%g1
loop_271:
	call	loop_274
loop_272:
	fandnot2s	%f11,	%f16,	%f25
loop_273:
	rd	%pc,	%g5
	movue	%fcc0,	0x69E,	%o3
loop_274:
	edge8	%l4,	%i3,	%i0
	fone	%f28
	call	loop_275
	call	loop_276
	srlx	%i5,	%l6,	%i2
	sll	%i7,	%g4,	%o7
loop_275:
	nop
	setx	0xFDD4867A123877F1,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0xF8E57FC3,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fsmuld	%f0,	%f30,	%f26
loop_276:
	call	loop_277
	movne	%icc,	%g7,	%o2
	call	loop_278
	alignaddrl	%g6,	%o6,	%o1
loop_277:
	mova	%fcc1,	0x215,	%i6
	call	loop_279
loop_278:
	movvs	%xcc,	%g2,	%l1
	tpos	%icc,	0x7
	nop
	fitos	%f10,	%f13
	fstox	%f13,	%f12
	fxtos	%f12,	%f28
loop_279:
	tcs	%icc,	0x1
	fxnor	%f20,	%f18,	%f24
	fxnor	%f16,	%f18,	%f4
	fmovsuge	%fcc2,	%f28,	%f1
	fmovdn	%icc,	%f26,	%f16
	call	loop_280
	call	loop_281
	stw	%o0,	[%l7 + 0x18]
	call	loop_282
loop_280:
	movuge	%fcc0,	0x25C,	%g3
loop_281:
	fmovsvc	%icc,	%f14,	%f10
	call	loop_283
loop_282:
	bpos,a	%xcc,	loop_284
	movleu	%icc,	%o5,	%i4
	movug	%fcc0,	0x6E4,	%l2
loop_283:
	fbul,pn	%fcc0,	loop_285
loop_284:
	fpack32	%f18,	%f18,	%f28
	call	loop_286
	sllx	%l0,	0x01,	%l5
loop_285:
	rd	%tick_cmpr,	%o4
	smul	%l3,	0x1DEB,	%i1
loop_286:
	wrpr	%g5,	%o3,	%cwp
	std	%f10,	[%l7 + 0x28]
	fmovdo	%fcc0,	%f4,	%f10
	call	loop_287
	fmul8sux16	%f24,	%f18,	%f26
	call	loop_288
	edge32l	%g1,	%l4,	%i0
loop_287:
	tpos	%icc,	0x4
	movl	%icc,	%i3,	%i5
loop_288:
	sllx	%l6,	0x18,	%i2
	fnands	%f26,	%f17,	%f25
	orn	%i7,	0x06E8,	%o7
	fnot2s	%f21,	%f8
	nop
	setx	0x4413DC41,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f19
	setx	0x37FF1E0C,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f23
	fmuls	%f23,	%f19,	%f16
	call	loop_289
	fnot2s	%f30,	%f23
	rd	%y,	%g4
	nop
	setx	0x12D0,	%l0,	%g6
	udivx	%g7,	%g6,	%o6
loop_289:
	movrne	%o1,	%o2,	%i6
	fmovso	%fcc1,	%f13,	%f13
	fmovslg	%fcc3,	%f13,	%f21
	fmovso	%fcc0,	%f27,	%f6
	tsubcctv	%l1,	0x1B73,	%o0
	tcc	%icc,	0x1
	wr	%g2,	0x0EEA,	%y
	set	0x1C, %l5
	lda	[%l7 + %l5] 0x11,	%f21
	movgu	%icc,	%g3,	%i4
	fnors	%f30,	%f5,	%f20
	edge32ln	%l2,	%o5,	%l5
	call	loop_290
	andn	%l0,	%o4,	%i1
	nop
	fitod	%f0,	%f16
	call	loop_291
loop_290:
	fmovrdlz	%g5,	%f30,	%f18
	wr	%o3,	%l3,	%ccr
	movvc	%icc,	0x3AC,	%g1
loop_291:
	fmovspos	%icc,	%f25,	%f28
	fmovrslz	%i0,	%f11,	%f20
	subc	%i3,	0x179F,	%l4
	wrpr	%l6,	0x01C3,	%pil
	call	loop_292
	movue	%fcc2,	%i5,	%i2
	fcmpne32	%f6,	%f6,	%o7
	andcc	%i7,	0x0078,	%g7
loop_292:
	fmovsneg	%xcc,	%f14,	%f29
	fxnors	%f15,	%f15,	%f4
	nop
	set	0x7B, %l6
	stb	%g6,	[%l7 + %l6]
	and	%g4,	%o6,	%o2
	wrpr	%i6,	0x1610,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fmovsvs	%xcc,	%f27,	%f4
	fsrc2	%f26,	%f24
	call	loop_293
	nop
	setx	0x14E41795,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f28
	fsqrts	%f28,	%f5
	fbue,a,pt	%fcc3,	loop_294
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
loop_293:
	call	loop_295
	fcmple32	%f2,	%f24,	%g2
loop_294:
	fbge,a	%fcc0,	loop_296
	call	loop_297
loop_295:
	popc	%g3,	%i4
	fpadd16	%f4,	%f18,	%f28
loop_296:
	movule	%fcc1,	%o0,	%o5
loop_297:
	bmask	%l2,	%l5,	%o4
	bgu	%xcc,	loop_298
	call	loop_299
	wrpr 	%g0, 	0x0, 	%gl
	rd	%y,	%o3
loop_298:
	udiv	%l3,	0x057B,	%g5
loop_299:
	xorcc	%g1,	0x1303,	%i0
	movn	%icc,	0x124,	%l4
	sllx	%l6,	0x10,	%i5
	fcmps	%fcc1,	%f2,	%f17
	call	loop_300
	movvc	%xcc,	0x170,	%i2
	movue	%fcc1,	%i3,	%i7
	fmovsa	%xcc,	%f20,	%f28
loop_300:
	call	loop_301
	fpmerge	%f0,	%f2,	%f0
	call	loop_302
	fpack16	%f10,	%f20
loop_301:
	rdpr	%canrestore,	%o7
	nop
	set	0x08, %g1
	ldx	[%l7 + %g1],	%g6
loop_302:
	call	loop_303
	call	loop_304
	tsubcc	%g4,	%g7,	%o2
	movcc	%xcc,	0x7C3,	%o6
loop_303:
	fmovrdlez	%o1,	%f30,	%f22
loop_304:
	smul	%i6,	%l1,	%g2
	fmovsleu	%icc,	%f12,	%f9
	call	loop_305
	fcmple32	%f28,	%f24,	%i4
	call	loop_306
	call	loop_307
loop_305:
	movvc	%xcc,	0x714,	%o0
	movcc	%icc,	0x65C,	%g3
loop_306:
	brnz,a,pt	%o5,	loop_308
loop_307:
	rdpr	%pil,	%l5
	fpadd32s	%f27,	%f26,	%f1
	fands	%f7,	%f4,	%f7
loop_308:
	nop

	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 4:
!
!	Type l   	: 7
!	Type a   	: 15
!	Type x   	: 2
!	Type cti   	: 56
!	Type f   	: 55
!	Type i   	: 65
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
	set	0x2,	%g1
	set	0x1,	%g2
	set	0xB,	%g3
	set	0x7,	%g4
	set	0x2,	%g5
	set	0xD,	%g6
	set	0x4,	%g7
	!# Input registers
	set	-0xC,	%i0
	set	-0xE,	%i1
	set	-0x1,	%i2
	set	-0xB,	%i3
	set	-0xB,	%i4
	set	-0xB,	%i5
	set	-0x7,	%i6
	set	-0xC,	%i7
	!# Local registers
	set	0x5FFD87F0,	%l0
	set	0x552A2D5B,	%l1
	set	0x41C10300,	%l2
	set	0x33CC95C3,	%l3
	set	0x7FCF67A5,	%l4
	set	0x5521CF16,	%l5
	set	0x65F3F8E9,	%l6
	!# Output registers
	set	-0x062A,	%o0
	set	-0x182C,	%o1
	set	0x063D,	%o2
	set	-0x1F92,	%o3
	set	-0x00CF,	%o4
	set	0x1F36,	%o5
	set	-0x1485,	%o6
	set	0x01EB,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x2935C9E687811231)
	INIT_TH_FP_REG(%l7,%f2,0x7F66F0C3CCA58A3E)
	INIT_TH_FP_REG(%l7,%f4,0x3AEC2E41FEB9AA02)
	INIT_TH_FP_REG(%l7,%f6,0xD137B4286AC51173)
	INIT_TH_FP_REG(%l7,%f8,0xDF2A93DC6F76B7AC)
	INIT_TH_FP_REG(%l7,%f10,0x738EF5DEB9BBCDE7)
	INIT_TH_FP_REG(%l7,%f12,0xA069D47C4AE8A83A)
	INIT_TH_FP_REG(%l7,%f14,0xDEAD52076D4DD849)
	INIT_TH_FP_REG(%l7,%f16,0x290589D71269A573)
	INIT_TH_FP_REG(%l7,%f18,0x8A4D73884272FB8D)
	INIT_TH_FP_REG(%l7,%f20,0x66FF312585370073)
	INIT_TH_FP_REG(%l7,%f22,0x679745628EAF82E8)
	INIT_TH_FP_REG(%l7,%f24,0xD1C5000CAB9080BF)
	INIT_TH_FP_REG(%l7,%f26,0x6758B9BD274DD177)
	INIT_TH_FP_REG(%l7,%f28,0x81A11D697B2F9466)
	INIT_TH_FP_REG(%l7,%f30,0xB5D320B9EF520111)

	!# Execute Main Diag ..

	brz,pn	%l2,	loop_309
	call	loop_310
	call	loop_311
	call	loop_312
loop_309:
	array32	%o4,	%i1,	%o3
loop_310:
	fzero	%f22
loop_311:
	fmovdug	%fcc2,	%f4,	%f4
loop_312:
	call	loop_313
	call	loop_314
	fmovrslez	%l3,	%f1,	%f23
	nop
	set	0x38, %i7
	prefetch	[%l7 + %i7],	 3
loop_313:
	call	loop_315
loop_314:
	ble,a,pn	%xcc,	loop_316
	fcmpne16	%f26,	%f26,	%l0
	call	loop_317
loop_315:
	fba	%fcc2,	loop_318
loop_316:
	te	%icc,	0x7
	call	loop_319
loop_317:
	edge8l	%g5,	%g1,	%l4
loop_318:
	and	%i0,	%i5,	%l6
	call	loop_320
loop_319:
	call	loop_321
	edge32l	%i3,	%i7,	%o7
	call	loop_322
loop_320:
	call	loop_323
loop_321:
	addcc	%g6,	%i2,	%g4
	brlz,a	%g7,	loop_324
loop_322:
	be,a	%xcc,	loop_325
loop_323:
	tne	%xcc,	0x5
	tleu	%xcc,	0x3
loop_324:
	pdist	%f10,	%f12,	%f26
loop_325:
	tne	%icc,	0x4
	nop
	set	0x48, %g5
	std	%o6,	[%l7 + %g5]
	fpadd16s	%f20,	%f28,	%f8
	sllx	%o1,	0x15,	%i6
	fmovdcs	%icc,	%f16,	%f8
	edge8ln	%o2,	%g2,	%l1
	fmovsleu	%icc,	%f11,	%f5
	fmovrsgz	%o0,	%f21,	%f17
	array8	%g3,	%i4,	%l5
	rdpr	%cleanwin,	%l2
	call	loop_326
	rd	%asi,	%o4
	call	loop_327
	movl	%fcc2,	0x512,	%i1
loop_326:
	call	loop_328
	tle	%icc,	0x3
loop_327:
	fone	%f30
	add	%o5,	%o3,	%l3
loop_328:
	faligndata	%f20,	%f18,	%f12
	fmovdgu	%xcc,	%f28,	%f12
	membar	0x7F
	edge16l	%l0,	%g1,	%g5
	rdhpr	%hsys_tick_cmpr,	%i0
	nop
	fitod	%f4,	%f6
	fdtox	%f6,	%f26
	call	loop_329
	fmovs	%f13,	%f20
	rd	%asi,	%l4
	movvs	%icc,	%l6,	%i3
loop_329:
	call	loop_330
	call	loop_331
	nop
	set	0x28, %l0
	stx	%fsr,	[%l7 + %l0]
	rdhpr	%ver,	%i5
loop_330:
	call	loop_332
loop_331:
	faligndata	%f12,	%f6,	%f18
	edge16ln	%i7,	%g6,	%o7
	wrpr	%i2,	%g7,	%pil
loop_332:
	smul	%g4,	%o6,	%o1
	bge,pt	%icc,	loop_333
	fblg,a,pn	%fcc0,	loop_334
	fmovsl	%xcc,	%f25,	%f19
	edge32	%i6,	%g2,	%l1
loop_333:
	movo	%fcc0,	0x575,	%o2
loop_334:
	call	loop_335
	fmovsvc	%xcc,	%f25,	%f6
	call	loop_336
	fmovdcs	%icc,	%f20,	%f24
loop_335:
	nop
	setx	0x1277A389AE897D6F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0x033BF9CE,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	fsmuld	%f10,	%f10,	%f20
	fmul8x16al	%f1,	%f11,	%f4
loop_336:
	tleu	%icc,	0x0
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	fmovse	%xcc,	%f27,	%f30
	movge	%fcc3,	0x0EA,	%g3
	call	loop_337
	fmovrdne	%i4,	%f16,	%f24
	fnors	%f20,	%f10,	%f14
	fornot1	%f16,	%f8,	%f4
loop_337:
	fmovso	%fcc1,	%f20,	%f17
	orncc	%o0,	0x03A7,	%l5
	bshuffle	%f16,	%f10,	%f8
	edge32ln	%o4,	%i1,	%l2
	add	%o3,	0x010D,	%l3
	fmovdn	%fcc2,	%f18,	%f20
	nop
	set	0x20, %i0
	stx	%o5,	[%l7 + %i0]
	set	0x10, %g6
	sta	%f1,	[%l7 + %g6] 0x89
	fbne,pn	%fcc1,	loop_338
	call	loop_339
	nop
	setx	0x14293CE9,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f22
	setx	0xF8E289A9,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f15
	fsubs	%f15,	%f22,	%f14
	fpadd16s	%f15,	%f3,	%f24
loop_338:
	fnors	%f5,	%f14,	%f30
loop_339:
	nop
	fitos	%f12,	%f4
	fstoi	%f4,	%f20
	fmovrdlz	%g1,	%f0,	%f28
	call	loop_340
	xor	%g5,	0x0F27,	%l0
	call	loop_341
	fcmpes	%fcc2,	%f21,	%f27
loop_340:
	call	loop_342
	call	loop_343
loop_341:
	fmovdug	%fcc3,	%f22,	%f6
	call	loop_344
loop_342:
	fabss	%f23,	%f28
loop_343:
	call	loop_345
	edge8ln	%l4,	%i0,	%l6
loop_344:
	fmovsue	%fcc3,	%f31,	%f3
	call	loop_346
loop_345:
	fmovdcc	%xcc,	%f24,	%f20
	call	loop_347
	smulcc	%i3,	0x09B6,	%i5
loop_346:
	udiv	%i7,	0x03BD,	%o7
	nop
	setx	0x0E04,	%l0,	%g6
	sdiv	%i2,	%g6,	%g7
loop_347:
	fxnor	%f12,	%f14,	%f14
	fmuld8sux16	%f11,	%f9,	%f20
	orcc	%o6,	0x194A,	%g4
	fzeros	%f10
	taddcctv	%o1,	%i6,	%l1
	call	loop_348
	nop
	setx	0x2DEC148A9B3EB95D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0x1F8E0046611B6D56,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	fsubd	%f2,	%f28,	%f6
	call	loop_349
	edge8ln	%o2,	%g2,	%g3
loop_348:
	call	loop_350
	fnegd	%f20,	%f14
loop_349:
	call	loop_351
	andn	%i4,	0x1FCD,	%o0
loop_350:
	smul	%l5,	%o4,	%i1
	call	loop_352
loop_351:
	fmovscs	%icc,	%f21,	%f28
	fmovs	%f11,	%f26
	fones	%f27
loop_352:
	nop
	wr	%g0,	0x1e,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
	wr	%g0,	0x19,	%asi
	sta	%f23,	[%l7 + 0x54] %asi
	wr	%g0,	0x10,	%asi
	lduha	[%l7 + 0x58] %asi,	%o3
	call	loop_353
	rdhpr	%hsys_tick_cmpr,	%l2
	call	loop_354
	call	loop_355
loop_353:
	fmovduge	%fcc0,	%f10,	%f20
	fmovsgu	%xcc,	%f4,	%f5
loop_354:
	fabsd	%f26,	%f8
loop_355:
	fsrc1s	%f13,	%f6
	edge8	%l3,	%g1,	%o5
	call	loop_356
	movrgez	%g5,	0x31D,	%l4
	rdhpr	%hintp,	%i0
	fpack32	%f8,	%f14,	%f16
loop_356:
	tn	%xcc,	0x7
	fmovdl	%icc,	%f18,	%f30
	subccc	%l6,	0x0728,	%i3
	xnorcc	%l0,	%i7,	%o7
	call	loop_357
	fmovdge	%fcc2,	%f6,	%f0
	tcc	%xcc,	0x6
	fone	%f18
loop_357:
	fmovsneg	%icc,	%f13,	%f15
	tleu	%icc,	0x1
	tleu	%icc,	0x7
	rd	%pc,	%i5
	tleu	%xcc,	0x6
	wr	%g0,	0xea,	%asi
	stxa	%g6,	[%l7 + 0x60] %asi
	membar	#Sync
	tvc	%xcc,	0x6
	call	loop_358
	fmovscc	%icc,	%f1,	%f12
	call	loop_359
	stw	%i2,	[%l7 + 0x34]
loop_358:
	nop
	setx	0xE6980867,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f2
	setx	0x680ABF0B,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f6
	fsubs	%f6,	%f2,	%f0
	wr	%o6,	%g4,	%softint
loop_359:
	movrlez	%g7,	%o1,	%i6
	wrpr 	%g0, 	0x1, 	%gl
	andcc	%o2,	%g2,	%g3
	fcmpgt16	%f30,	%f2,	%o0
	array32	%i4,	%o4,	%l5
	srl	%o3,	0x05,	%i1
	fcmpne32	%f14,	%f6,	%l3
	or	%g1,	%o5,	%l2
	addcc	%l4,	0x04AB,	%g5
	addccc	%l6,	0x16A0,	%i0
	udiv	%l0,	0x0D17,	%i7
	fmovsle	%fcc0,	%f17,	%f2
	bshuffle	%f20,	%f4,	%f24
	call	loop_360
	addccc	%o7,	%i5,	%g6
	st	%fsr,	[%l7 + 0x2C]
	movrlz	%i3,	%o6,	%i2
loop_360:
	nop
	setx	loop_361,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x021400001404,	%l0,	%l1
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
	call	loop_362
	wrpr	%g7,	0x0DEF,	%tick
loop_361:
	nop

loop_362:
	nop

	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 5:
!
!	Type l   	: 11
!	Type a   	: 12
!	Type x   	: 5
!	Type cti   	: 54
!	Type f   	: 60
!	Type i   	: 58
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
	set	0xD,	%g2
	set	0xB,	%g3
	set	0x6,	%g4
	set	0x9,	%g5
	set	0x3,	%g6
	set	0x2,	%g7
	!# Input registers
	set	-0x6,	%i0
	set	-0xE,	%i1
	set	-0xE,	%i2
	set	-0xD,	%i3
	set	-0xB,	%i4
	set	-0x9,	%i5
	set	-0x6,	%i6
	set	-0xB,	%i7
	!# Local registers
	set	0x14CD7FDB,	%l0
	set	0x6C53723E,	%l1
	set	0x2C74AED4,	%l2
	set	0x04717A83,	%l3
	set	0x0C05D4D2,	%l4
	set	0x4B74775B,	%l5
	set	0x2FB53671,	%l6
	!# Output registers
	set	0x06A9,	%o0
	set	0x120A,	%o1
	set	-0x08E3,	%o2
	set	0x06F0,	%o3
	set	0x0A4C,	%o4
	set	-0x1157,	%o5
	set	0x1BB0,	%o6
	set	0x1D22,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x2935C9E687811231)
	INIT_TH_FP_REG(%l7,%f2,0x7F66F0C3CCA58A3E)
	INIT_TH_FP_REG(%l7,%f4,0x3AEC2E41FEB9AA02)
	INIT_TH_FP_REG(%l7,%f6,0xD137B4286AC51173)
	INIT_TH_FP_REG(%l7,%f8,0xDF2A93DC6F76B7AC)
	INIT_TH_FP_REG(%l7,%f10,0x738EF5DEB9BBCDE7)
	INIT_TH_FP_REG(%l7,%f12,0xA069D47C4AE8A83A)
	INIT_TH_FP_REG(%l7,%f14,0xDEAD52076D4DD849)
	INIT_TH_FP_REG(%l7,%f16,0x290589D71269A573)
	INIT_TH_FP_REG(%l7,%f18,0x8A4D73884272FB8D)
	INIT_TH_FP_REG(%l7,%f20,0x66FF312585370073)
	INIT_TH_FP_REG(%l7,%f22,0x679745628EAF82E8)
	INIT_TH_FP_REG(%l7,%f24,0xD1C5000CAB9080BF)
	INIT_TH_FP_REG(%l7,%f26,0x6758B9BD274DD177)
	INIT_TH_FP_REG(%l7,%f28,0x81A11D697B2F9466)
	INIT_TH_FP_REG(%l7,%f30,0xB5D320B9EF520111)

	!# Execute Main Diag ..

	sir	0x0967
	sethi	0x18C3,	%o1
	wr	%i6,	%g4,	%set_softint
	movrlz	%o2,	%l1,	%g2
	call	loop_363
	nop
	fitod	%f2,	%f8
	fdtos	%f8,	%f11
	brgz,pn	%g3,	loop_364
	call	loop_365
loop_363:
	sllx	%i4,	0x1D,	%o4
	fbuge	%fcc2,	loop_366
loop_364:
	movvs	%icc,	0x086,	%l5
loop_365:
	fmovslg	%fcc2,	%f8,	%f1
	call	loop_367
loop_366:
	smulcc	%o0,	%i1,	%l3
	rdhpr	%hsys_tick_cmpr,	%o3
	srlx	%g1,	0x06,	%l2
loop_367:
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	fmovsuge	%fcc3,	%f19,	%f9
	fmovdlg	%fcc2,	%f20,	%f22
	fmovdneg	%xcc,	%f24,	%f18
	fzero	%f26
	addccc	%o5,	%g5,	%l4
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	fbe,a,pn	%fcc1,	loop_368
	movlg	%fcc0,	%i0,	%l6
	fmuld8sux16	%f15,	%f7,	%f16
	fmovdg	%xcc,	%f16,	%f14
loop_368:
	sth	%l0,	[%l7 + 0x20]
	fmovsa	%fcc3,	%f21,	%f1
	fcmpeq16	%f14,	%f28,	%i7
	te	%icc,	0x5
	tcs	%xcc,	0x3
	edge32n	%i5,	%o7,	%g6
	fcmpeq32	%f4,	%f0,	%i3
	fcmpgt16	%f24,	%f10,	%i2
	nop
	set	0x7C, %o5
	prefetch	[%l7 + %o5],	 4
	stw	%o6,	[%l7 + 0x74]
	movl	%fcc3,	0x780,	%g7
	fmovslg	%fcc2,	%f29,	%f8
	fbule,pn	%fcc0,	loop_369
	call	loop_370
	edge16	%o1,	%i6,	%o2
	fnand	%f8,	%f10,	%f16
loop_369:
	bneg,pt	%icc,	loop_371
loop_370:
	call	loop_372
	fcmple16	%f22,	%f30,	%l1
	stw	%g4,	[%l7 + 0x78]
loop_371:
	fbo,pn	%fcc1,	loop_373
loop_372:
	fexpand	%f10,	%f30
	call	loop_374
	orcc	%g2,	0x0832,	%g3
loop_373:
	nop
	setx	loop_375,	%l0,	%l1
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
	be,a	%xcc,	loop_376
loop_374:
	mulscc	%o4,	0x11C9,	%i4
	call	loop_377
loop_375:
	alignaddrl	%o0,	%l5,	%i1
loop_376:
	call	loop_378
	tvs	%xcc,	0x4
loop_377:
	array8	%o3,	%l3,	%l2
	sllx	%g1,	%g5,	%l4
loop_378:
	fmul8sux16	%f0,	%f22,	%f14
	fxor	%f14,	%f2,	%f0
	fsrc2s	%f7,	%f25
	set	0x40, %o6
	stda	%f16,	[%l7 + %o6] 0xcb
	movcc	%icc,	%o5,	%l6
	call	loop_379
	fmovrdgz	%l0,	%f0,	%f4
	rdhpr	%htba,	%i7
	call	loop_380
loop_379:
	ta	%icc,	0x6
	fsrc1	%f12,	%f6
	nop
	setx	0x1379,	%l0,	%i0
	sdivcc	%i5,	%i0,	%g6
loop_380:
	call	loop_381
	fmovrdne	%i3,	%f24,	%f10
	fmovsg	%xcc,	%f14,	%f21
	call	loop_382
loop_381:
	call	loop_383
	rdhpr	%hsys_tick_cmpr,	%i2
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
loop_382:
	call	loop_384
loop_383:
	fmovse	%fcc3,	%f11,	%f30
	fcmple32	%f18,	%f20,	%o6
	call	loop_385
loop_384:
	rdhpr	%htba,	%g7
	tl	%xcc,	0x1
	call	loop_386
loop_385:
	fcmped	%fcc2,	%f24,	%f16
	fmovscc	%xcc,	%f6,	%f28
	nop
	fitos	%f7,	%f19
	fstox	%f19,	%f28
loop_386:
	call	loop_387
	fornot2s	%f11,	%f11,	%f13
	siam	0x4
	fmuld8ulx16	%f20,	%f29,	%f10
loop_387:
	fandnot1s	%f18,	%f22,	%f18
	nop
	fitos	%f4,	%f17
	fstox	%f17,	%f14
	fmovdcc	%xcc,	%f2,	%f18
	fmovsuge	%fcc1,	%f4,	%f20
	andcc	%o7,	%i6,	%o1
	call	loop_388
	call	loop_389
	fmovdu	%fcc2,	%f10,	%f8
	call	loop_390
loop_388:
	rdhpr	%hintp,	%l1
loop_389:
	fpmerge	%f19,	%f8,	%f16
	fbge,a	%fcc2,	loop_391
loop_390:
	fors	%f11,	%f20,	%f29
	movcc	%icc,	0x1EC,	%o2
	edge8ln	%g2,	%g4,	%g3
loop_391:
	call	loop_392
	movleu	%icc,	%o4,	%o0
	call	loop_393
	fcmpes	%fcc1,	%f5,	%f12
loop_392:
	nop
	wr	%g0,	0x04,	%asi
	swapa	[%l7 + 0x50] %asi,	%i4
loop_393:
	nop
	fitod	%f20,	%f4
	call	loop_394
	orn	%i1,	%o3,	%l3
	rdpr	%gl,	%l5
	fmovdug	%fcc3,	%f0,	%f24
loop_394:
	fpadd16s	%f26,	%f12,	%f19
	fmovsne	%fcc2,	%f8,	%f5
	fbg	%fcc2,	loop_395
	call	loop_396
	rdpr	%canrestore,	%l2
	nop
	setx loop_397, %l0, %l1
	jmpl %l1, %g1
loop_395:
	fcmpes	%fcc3,	%f5,	%f6
loop_396:
	call	loop_398
	udivx	%g5,	0x0C1E,	%l4
loop_397:
	fandnot1s	%f0,	%f1,	%f30
	fors	%f24,	%f26,	%f8
loop_398:
	move	%icc,	0x31E,	%l6
	movleu	%xcc,	0x4D0,	%l0
	fsrc2s	%f8,	%f5
	fnot1	%f28,	%f14
	tpos	%icc,	0x0
	fmovso	%fcc0,	%f13,	%f21
	movvc	%xcc,	0x42C,	%i7
	movrgez	%o5,	0x2E5,	%i0
	call	loop_399
	fmovrsgez	%g6,	%f13,	%f16
	andn	%i5,	0x129C,	%i2
	call	loop_400
loop_399:
	edge16l	%o6,	%i3,	%g7
	umul	%i6,	0x197A,	%o1
	call	loop_401
loop_400:
	edge32ln	%o7,	%l1,	%g2
	sllx	%o2,	%g3,	%g4
	fsrc2	%f12,	%f16
loop_401:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	call	loop_402
	fcmple16	%f16,	%f0,	%i1
	rd	%sys_tick_cmpr,	%o3
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
loop_402:
	movge	%icc,	%l3,	%i4
	fmovsneg	%xcc,	%f6,	%f28
	call	loop_403
	rdhpr	%hsys_tick_cmpr,	%l2
	nop
	setx	0x6433FFB7,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f5
	setx	0xC7B162A1,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f30
	fsubs	%f30,	%f5,	%f20
	membar	0x4B
loop_403:
	tvc	%icc,	0x1
	ldsh	[%l7 + 0x3C],	%g1
	call	loop_404
	nop
	setx	0x9A570F39D34F366D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0xA9F206DC5A0B6202,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	fsubd	%f28,	%f24,	%f24
	fmovrdlez	%l5,	%f24,	%f10
	wrpr	%g5,	%l4,	%tick
loop_404:
	fbge	%fcc0,	loop_405
	fmovrslez	%l6,	%f27,	%f8
	fbe,a	%fcc0,	loop_406
	fone	%f12
loop_405:
	movl	%icc,	0x120,	%i7
	call	loop_407
loop_406:
	call	loop_408
	fblg,a,pt	%fcc1,	loop_409
	movrgz	%o5,	%i0,	%l0
loop_407:
	edge8ln	%g6,	%i5,	%i2
loop_408:
	call	loop_410
loop_409:
	rdpr	%pil,	%o6
	call	loop_411
	fmovsvs	%icc,	%f28,	%f9
loop_410:
	sra	%g7,	0x03,	%i3
	edge16ln	%i6,	%o7,	%o1
loop_411:
	tl	%xcc,	0x5
	call	loop_412
	wr	%l1,	%g2,	%sys_tick
	tgu	%xcc,	0x1
	fbul,pt	%fcc2,	loop_413
loop_412:
	call	loop_414
	alignaddrl	%g3,	%o2,	%g4
	movrgez	%o0,	%i1,	%o3
loop_413:
	sll	%l3,	%i4,	%l2
loop_414:
	call	loop_415
	call	loop_416
	rd	%asi,	%g1
	movue	%fcc3,	0x19C,	%o4
loop_415:
	fmovdug	%fcc3,	%f12,	%f18
loop_416:
	movuge	%fcc2,	0x7B6,	%g5
	srl	%l4,	0x1F,	%l5
	fexpand	%f12,	%f0
	bvc,a	%icc,	loop_417
loop_417:
	nop

	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 6:
!
!	Type l   	: 7
!	Type a   	: 15
!	Type x   	: 2
!	Type cti   	: 55
!	Type f   	: 61
!	Type i   	: 60
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
	set	0x8,	%g1
	set	0xF,	%g2
	set	0x0,	%g3
	set	0xB,	%g4
	set	0x2,	%g5
	set	0xE,	%g6
	set	0x9,	%g7
	!# Input registers
	set	-0xE,	%i0
	set	-0x5,	%i1
	set	-0x1,	%i2
	set	-0x7,	%i3
	set	-0x0,	%i4
	set	-0x2,	%i5
	set	-0x3,	%i6
	set	-0x9,	%i7
	!# Local registers
	set	0x484E7509,	%l0
	set	0x2B303B27,	%l1
	set	0x671BAF98,	%l2
	set	0x12F90FF6,	%l3
	set	0x7AF957F2,	%l4
	set	0x6D9E8146,	%l5
	set	0x17641D30,	%l6
	!# Output registers
	set	-0x0527,	%o0
	set	-0x169D,	%o1
	set	0x1924,	%o2
	set	-0x133D,	%o3
	set	-0x1AF1,	%o4
	set	-0x1A64,	%o5
	set	0x058A,	%o6
	set	0x0887,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x2935C9E687811231)
	INIT_TH_FP_REG(%l7,%f2,0x7F66F0C3CCA58A3E)
	INIT_TH_FP_REG(%l7,%f4,0x3AEC2E41FEB9AA02)
	INIT_TH_FP_REG(%l7,%f6,0xD137B4286AC51173)
	INIT_TH_FP_REG(%l7,%f8,0xDF2A93DC6F76B7AC)
	INIT_TH_FP_REG(%l7,%f10,0x738EF5DEB9BBCDE7)
	INIT_TH_FP_REG(%l7,%f12,0xA069D47C4AE8A83A)
	INIT_TH_FP_REG(%l7,%f14,0xDEAD52076D4DD849)
	INIT_TH_FP_REG(%l7,%f16,0x290589D71269A573)
	INIT_TH_FP_REG(%l7,%f18,0x8A4D73884272FB8D)
	INIT_TH_FP_REG(%l7,%f20,0x66FF312585370073)
	INIT_TH_FP_REG(%l7,%f22,0x679745628EAF82E8)
	INIT_TH_FP_REG(%l7,%f24,0xD1C5000CAB9080BF)
	INIT_TH_FP_REG(%l7,%f26,0x6758B9BD274DD177)
	INIT_TH_FP_REG(%l7,%f28,0x81A11D697B2F9466)
	INIT_TH_FP_REG(%l7,%f30,0xB5D320B9EF520111)

	!# Execute Main Diag ..

	call	loop_418
	call	loop_419
	movug	%fcc3,	%l6,	%i7
	andcc	%i0,	%l0,	%g6
loop_418:
	fbul,a,pt	%fcc3,	loop_420
loop_419:
	umul	%i5,	0x01E2,	%o5
	brgez,pt	%o6,	loop_421
	fmovrdlez	%i2,	%f8,	%f8
loop_420:
	fmovsle	%fcc1,	%f26,	%f11
	nop
	setx	0x87AFE217,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f28
	setx	0xAAFCC9A1,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f4
	fmuls	%f4,	%f28,	%f27
loop_421:
	fpsub16s	%f30,	%f4,	%f4
	nop
	setx	0x6FB385384BC770BE,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0xB4DD21C36165C13D,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	fmuld	%f28,	%f10,	%f22
	brz,a	%i3,	loop_422
	fmovspos	%icc,	%f12,	%f27
	call	loop_423
	call	loop_424
loop_422:
	fxnors	%f0,	%f2,	%f31
	fmovsvs	%xcc,	%f28,	%f8
loop_423:
	fpsub32s	%f29,	%f11,	%f25
loop_424:
	fpack32	%f22,	%f22,	%f6
	edge16n	%i6,	%o7,	%g7
	fxnors	%f25,	%f31,	%f31
	call	loop_425
	call	loop_426
	brlz	%o1,	loop_427
	call	loop_428
loop_425:
	fmul8x16au	%f6,	%f16,	%f28
loop_426:
	movu	%fcc0,	%g2,	%l1
loop_427:
	call	loop_429
loop_428:
	fmovdle	%icc,	%f16,	%f30
	wr	%g0,	0xea,	%asi
	stha	%o2,	[%l7 + 0x34] %asi
	membar	#Sync
loop_429:
	rdhpr	%htba,	%g3
	rdpr	%otherwin,	%g4
	call	loop_430
	lduw	[%l7 + 0x64],	%i1
	set	0x62, %i5
	stha	%o3,	[%l7 + %i5] 0xe3
	membar	#Sync
loop_430:
	umul	%l3,	%i4,	%l2
	call	loop_431
	fbe,pt	%fcc0,	loop_432
	bneg,pn	%xcc,	loop_433
	tn	%xcc,	0x1
loop_431:
	fmovdul	%fcc3,	%f12,	%f22
loop_432:
	fsrc1	%f4,	%f6
loop_433:
	fmovdn	%xcc,	%f26,	%f4
	wr	%g0,	0x89,	%asi
	lduwa	[%l7 + 0x48] %asi,	%o0
	srlx	%o4,	%g1,	%l4
	fmovrdgz	%l5,	%f6,	%f12
	call	loop_434
	fcmple32	%f2,	%f8,	%l6
	call	loop_435
	call	loop_436
loop_434:
	call	loop_437
	nop
	setx	0x6FA7346E9C3C22D4,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	fsqrtd	%f6,	%f28
loop_435:
	fandnot2	%f28,	%f24,	%f6
loop_436:
	move	%fcc1,	0x25A,	%i7
loop_437:
	movcs	%xcc,	%g5,	%l0
	fzero	%f6
	fpackfix	%f12,	%f26
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	fxor	%f24,	%f26,	%f26
	bneg	%icc,	loop_438
	orcc	%g6,	%i0,	%o5
	movue	%fcc3,	0x757,	%o6
	call	loop_439
loop_438:
	rd	%softint,	%i5
	edge8l	%i3,	%i2,	%i6
	fzero	%f2
loop_439:
	fnot1s	%f21,	%f9
	fbule,a	%fcc3,	loop_440
	fexpand	%f23,	%f0
	fmovdleu	%xcc,	%f10,	%f16
	fmovde	%fcc0,	%f16,	%f28
loop_440:
	call	loop_441
	fmul8x16al	%f1,	%f4,	%f14
	call	loop_442
	nop
	setx	0xFA7BA1DC,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f5
	setx	0x8C65237F,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f23
	fsubs	%f23,	%f5,	%f27
loop_441:
	call	loop_443
	fmovrdlez	%g7,	%f20,	%f6
loop_442:
	fcmpgt16	%f6,	%f20,	%o7
	wr	%g0,	0x10,	%asi
	stwa	%o1,	[%l7 + 0x78] %asi
loop_443:
	call	loop_444
	for	%f2,	%f28,	%f26
	fmovrsgz	%g2,	%f8,	%f25
	fbn,a	%fcc0,	loop_445
loop_444:
	bcs,a	%icc,	loop_446
	call	loop_447
	fcmpgt16	%f26,	%f6,	%l1
loop_445:
	movrlz	%o2,	0x338,	%g3
loop_446:
	tle	%xcc,	0x5
loop_447:
	call	loop_448
	fmovsug	%fcc2,	%f11,	%f29
	edge32l	%g4,	%i1,	%l3
	srlx	%o3,	%l2,	%o0
loop_448:
	wrpr	%o4,	%i4,	%pil
	fmovsuge	%fcc3,	%f6,	%f19
	nop
	setx	0xED2D1D52,	%l0,	%l6
	st	%l6,	[%l7 + 0x3C]
	ld	[%l7 + 0x3C],	%fsr
	call	loop_449
	addcc	%g1,	0x0E0C,	%l4
	call	loop_450
	call	loop_451
loop_449:
	bne	%icc,	loop_452
	fcmple16	%f4,	%f14,	%l5
loop_450:
	call	loop_453
loop_451:
	edge16n	%l6,	%i7,	%g5
loop_452:
	call	loop_454
	brz	%l0,	loop_455
loop_453:
	tsubcctv	%i0,	0x097A,	%o5
	array32	%o6,	%i5,	%g6
loop_454:
	bgu,a	%icc,	loop_456
loop_455:
	call	loop_457
	call	loop_458
	nop
	setx	0xAAF71F264EE6DE05,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0x26CDE8AEF682FB2F,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	faddd	%f22,	%f10,	%f22
loop_456:
	fnot1	%f10,	%f18
loop_457:
	movn	%fcc3,	%i3,	%i6
loop_458:
	udiv	%i2,	0x0979,	%o7
	fpack16	%f8,	%f28
	nop
	setx	0x4FF54B5E,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f11
	setx	0x34810E81,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f31
	fadds	%f31,	%f11,	%f27
	call	loop_459
	call	loop_460
	mova	%xcc,	0x6BA,	%g7
	nop
	setx	0x1251C336C139ED31,	%l0,	%l6
	stx	%l6,	[%l7 + 0x68]
	ldx	[%l7 + 0x68],	%fsr
loop_459:
	te	%icc,	0x7
loop_460:
	rd	%ccr,	%o1
	movue	%fcc1,	%g2,	%o2
	nop
	fitod	%f2,	%f0
	fdtos	%f0,	%f9
	array16	%l1,	%g3,	%g4
	fmovrse	%l3,	%f9,	%f2
	sllx	%i1,	%l2,	%o0
	movu	%fcc1,	%o4,	%o3
	call	loop_461
	fornot1	%f24,	%f22,	%f22
	call	loop_462
	sub	%i4,	%l4,	%l5
loop_461:
	fmovrsgez	%g1,	%f12,	%f24
	fbue,a,pn	%fcc2,	loop_463
loop_462:
	fpsub16s	%f22,	%f7,	%f13
	fbue,pn	%fcc1,	loop_464
	tl	%icc,	0x3
loop_463:
	call	loop_465
	alignaddrl	%l6,	%g5,	%l0
loop_464:
	stx	%i7,	[%l7 + 0x10]
	movrlz	%i0,	%o6,	%o5
loop_465:
	nop
	wr	%g0,	0x80,	%asi
	prefetcha	[%l7 + 0x40] %asi,	 4
	call	loop_466
	srax	%i5,	0x1E,	%i6
	call	loop_467
	tcc	%icc,	0x5
loop_466:
	array16	%i2,	%o7,	%g7
	fbug,a,pn	%fcc1,	loop_468
loop_467:
	call	loop_469
	fmovrdgez	%o1,	%f12,	%f22
	fandnot1	%f12,	%f6,	%f30
loop_468:
	call	loop_470
loop_469:
	fbule	%fcc2,	loop_471
	call	loop_472
	for	%f26,	%f16,	%f12
loop_470:
	call	loop_473
loop_471:
	call	loop_474
loop_472:
	fmovrdgz	%g2,	%f0,	%f20
	call	loop_475
loop_473:
	nop
	setx	0xCC15E451DB1E99EA,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0xCF4C6998A578F48C,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	faddd	%f18,	%f0,	%f2
loop_474:
	fmovsgu	%xcc,	%f13,	%f7
	call	loop_476
loop_475:
	fmovdcs	%icc,	%f26,	%f18
	fbne,a,pn	%fcc2,	loop_477
	fmovrdgez	%i3,	%f6,	%f16
loop_476:
	fbo,a,pt	%fcc1,	loop_478
	mova	%xcc,	0x32D,	%o2
loop_477:
	call	loop_479
	wr	%l1,	%g3,	%clear_softint
loop_478:
	call	loop_480
	tsubcc	%l3,	%i1,	%l2
loop_479:
	fornot1s	%f19,	%f21,	%f4
	wr	%g0,	0x88,	%asi
	lduwa	[%l7 + 0x14] %asi,	%g4
loop_480:
	call	loop_481
	andn	%o4,	%o0,	%o3
	alignaddrl	%i4,	%l4,	%l5
	call	loop_482
loop_481:
	fmovdn	%fcc3,	%f4,	%f24
	fmovrdgz	%l6,	%f22,	%f24
	wrpr	%g1,	%g5,	%pil
loop_482:
	umul	%i7,	%l0,	%i0
	call	loop_483
	nop
	setx	0x9141C2AF9F353E49,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0xC61F63A8C483AA78,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	faddd	%f26,	%f10,	%f4
	call	loop_484
	movrgez	%o5,	0x0B6,	%g6
loop_483:
	orncc	%o6,	%i5,	%i2
	call	loop_485
loop_484:
	call	loop_486
	call	loop_487
	fabsd	%f2,	%f16
loop_485:
	fmovsne	%fcc0,	%f15,	%f22
loop_486:
	fcmpeq32	%f20,	%f14,	%i6
loop_487:
	fmovdcs	%icc,	%f22,	%f18
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 7:
!
!	Type l   	: 10
!	Type a   	: 7
!	Type x   	: 6
!	Type cti   	: 70
!	Type f   	: 63
!	Type i   	: 44
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


	EXIT_GOOD	/* test finish  */

/************************************************************************
   Test case data start
 ************************************************************************/
.data
user_data_start:
scratch_area:
.word 0x9762BAAC
.word 0xE3FC61E1
.word 0x7DB4501A
.word 0x4CFB82E0
.word 0x0DEA4141
.word 0x1DA0E06A
.word 0x01B5360F
.word 0xE0447220
.word 0xE4D6ACD2
.word 0x8E6213A0
.word 0xE5EE6B03
.word 0x6A3709EC
.word 0xB1A321B9
.word 0xB2FB3483
.word 0x473711A7
.word 0xFAB02CA7
.word 0xB9C3A3A3
.word 0xCD2C2C7E
.word 0x539CDE0C
.word 0x0856D92F
.word 0xAC03FF80
.word 0x721CA08B
.word 0x6A6A6B65
.word 0xB3E3CCC7
.word 0x17FEBAAD
.word 0x2B19C315
.word 0x8F4CB9E0
.word 0x33DBA0AB
.word 0x87AF7E89
.word 0x2AAE6C1B
.word 0x244AD368
.word 0xB49784D1
.word 0x429F2751
.word 0x91C44A6F
.word 0xDF5AB300
.word 0x6634A28F
.word 0xE3F29608
.word 0x72053681
.word 0xE0375AED
.word 0xB8A7B0B9
.word 0x67B43901
.word 0xDD8E85E2
.word 0x2386A318
.word 0x55631695
.word 0xD25F311B
.word 0xDD11900A
.word 0xB843C7C7
.word 0x88573414
.word 0x49E18C20
.word 0x0612D18C
.word 0xA4EDA902
.word 0xE73EF4EF
.word 0x63687292
.word 0xD0A3CA40
.word 0x52B88181
.word 0xE185FABF
.word 0x97BED18B
.word 0x5F89F5DF
.word 0x4720993B
.word 0xDB4B86A4
.word 0x9A6F1D84
.word 0x94D84F3A
.word 0x867F0FC1
.word 0xC72F4FF5
.end
