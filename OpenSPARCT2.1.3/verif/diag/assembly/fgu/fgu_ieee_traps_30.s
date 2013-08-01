/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: fgu_ieee_traps_30.s
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
.ident "FOCUSCASE: focus.pm,v 1.1 2003/04/23 17:53:39 somePerson Exp somePerson $ spc_basic_isa3.pl FOCUS_SEED=525133241"
.ident "Mon Dec  8 19:59:08 CST 2003"
.ident "Using Instruction Hash for Focus :$Id: fgu_ieee_traps_30.s,v 1.4 2007/07/27 21:45:32 drp Exp $"
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
	set	0x6,	%g1
	set	0x2,	%g2
	set	0x4,	%g3
	set	0xC,	%g4
	set	0x9,	%g5
	set	0x0,	%g6
	set	0x6,	%g7
	!# Input registers
	set	-0xD,	%i0
	set	-0x8,	%i1
	set	-0xB,	%i2
	set	-0x9,	%i3
	set	-0x4,	%i4
	set	-0xC,	%i5
	set	-0x1,	%i6
	set	-0xB,	%i7
	!# Local registers
	set	0x29D308EE,	%l0
	set	0x785D9C8F,	%l1
	set	0x32DB2D96,	%l2
	set	0x583C730F,	%l3
	set	0x3272D1A2,	%l4
	set	0x68D277F5,	%l5
	set	0x779B13A4,	%l6
	!# Output registers
	set	-0x10E1,	%o0
	set	0x1372,	%o1
	set	-0x188C,	%o2
	set	-0x1A29,	%o3
	set	-0x1FDF,	%o4
	set	0x00CB,	%o5
	set	0x14C0,	%o6
	set	0x063E,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0xCA69A1BAA097B7E4)
	INIT_TH_FP_REG(%l7,%f2,0xA5930CCD12ECD1A8)
	INIT_TH_FP_REG(%l7,%f4,0x5C5D16CB6A7525A5)
	INIT_TH_FP_REG(%l7,%f6,0xCB01F7A448011172)
	INIT_TH_FP_REG(%l7,%f8,0x715D781124CD36A4)
	INIT_TH_FP_REG(%l7,%f10,0xA668DF89B14C9E1A)
	INIT_TH_FP_REG(%l7,%f12,0xEA53BB1C867A6474)
	INIT_TH_FP_REG(%l7,%f14,0xCC22F91C5A384F51)
	INIT_TH_FP_REG(%l7,%f16,0x7B089FEA34E40332)
	INIT_TH_FP_REG(%l7,%f18,0x51E4631645A339E9)
	INIT_TH_FP_REG(%l7,%f20,0x762301810F8A696E)
	INIT_TH_FP_REG(%l7,%f22,0x3FFBCBF7985D7B74)
	INIT_TH_FP_REG(%l7,%f24,0x64762B99AC9EE44B)
	INIT_TH_FP_REG(%l7,%f26,0x6419ABE504DC3F27)
	INIT_TH_FP_REG(%l7,%f28,0xBB5E2B6F06B5CAF7)
	INIT_TH_FP_REG(%l7,%f30,0x4A9512DC19287841)

	!# Execute Main Diag ..

	call	loop_1
	fbue	%fcc2,	loop_2
	call	loop_3
	fmovspos	%icc,	%f14,	%f11
loop_1:
	movvs	%xcc,	0x79A,	%o5
loop_2:
	call	loop_4
loop_3:
	nop
	setx	0x8DC29F0B3DF740C6,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0x999320F9994087D1,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	fdivd	%f16,	%f24,	%f20
	edge8	%l2,	%g3,	%i6
	fble,pt	%fcc0,	loop_5
loop_4:
	movvc	%xcc,	%l6,	%l1
	movul	%fcc2,	0x19E,	%i0
	xorcc	%l5,	0x0A01,	%l3
loop_5:
	ld	[%l7 + 0x4C],	%f18
	movule	%fcc1,	%i7,	%g2
	srax	%o0,	0x18,	%i4
	call	loop_6
	call	loop_7
	call	loop_8
	stbar
loop_6:
	wrpr	%g6,	0x0FA3,	%pil
loop_7:
	call	loop_9
loop_8:
	edge32	%i3,	%o1,	%o2
	call	loop_10
	tpos	%xcc,	0x0
loop_9:
	fcmpeq32	%f2,	%f20,	%g1
	fmovrsne	%i2,	%f13,	%f7
loop_10:
	array8	%i1,	%o7,	%g7
	movug	%fcc0,	0x75E,	%o6
	fabsd	%f2,	%f10
	fcmple32	%f24,	%f0,	%g5
	xorcc	%l4,	%l0,	%g4
	std	%f6,	[%l7 + 0x20]
	te	%xcc,	0x2
	nop
	setx	0x0E0C,	%l0,	%o3
	sdiv	%o4,	%o3,	%o5
	call	loop_11
	fzero	%f10
	call	loop_12
	call	loop_13
loop_11:
	call	loop_14
	nop
	fitos	%f6,	%f9
	fstod	%f9,	%f30
loop_12:
	rdpr	%gl,	%i5
loop_13:
	wr	%g3,	0x17D6,	%ccr
loop_14:
	call	loop_15
	movu	%fcc2,	0x320,	%i6
	srl	%l6,	%l1,	%l2
	flushw
loop_15:
	call	loop_16
	fble,a,pn	%fcc3,	loop_17
	call	loop_18
	call	loop_19
loop_16:
	call	loop_20
loop_17:
	array8	%i0,	%l5,	%i7
loop_18:
	fmovsule	%fcc3,	%f26,	%f16
loop_19:
	tl	%xcc,	0x5
loop_20:
	call	loop_21
	call	loop_22
	faligndata	%f2,	%f14,	%f6
	edge32n	%g2,	%l3,	%i4
loop_21:
	addcc	%g6,	0x1F63,	%o0
loop_22:
	nop
	set	0x08, %l2
	ldsh	[%l7 + %l2],	%i3
	fcmpeq32	%f30,	%f10,	%o1
	call	loop_23
	call	loop_24
	fmovsle	%fcc1,	%f13,	%f23
	brnz,pn	%g1,	loop_25
loop_23:
	fpsub16	%f18,	%f14,	%f14
loop_24:
	fmovsa	%xcc,	%f25,	%f28
	nop
	setx	0x1F6D,	%l0,	%o2
	sdivcc	%i2,	%o2,	%i1
loop_25:
	tneg	%icc,	0x6
	call	loop_26
	call	loop_27
	tneg	%icc,	0x7
	call	loop_28
loop_26:
	rdpr	%tba,	%g7
loop_27:
	rdpr	%wstate,	%o6
	bmask	%o7,	%l4,	%g5
loop_28:
	call	loop_29
	nop
	fitod	%f12,	%f22
	fdtoi	%f22,	%f7
	smul	%l0,	%o4,	%o3
	call	loop_30
loop_29:
	call	loop_31
	nop
	setx	0x6C26DB6FFC6A178A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	fsqrtd	%f12,	%f24
	srax	%o5,	%g4,	%g3
loop_30:
	rdhpr	%htba,	%i6
loop_31:
	nop
	fitos	%f5,	%f23
	fstox	%f23,	%f24
	fxtos	%f24,	%f18
	fpadd16	%f0,	%f8,	%f8
	call	loop_32
	st	%fsr,	[%l7 + 0x40]
	fmovdge	%fcc3,	%f24,	%f16
	rd	%tick_cmpr,	%i5
loop_32:
	fmovdg	%fcc2,	%f10,	%f18
	wr 	%g0, 	0x5, 	%fprs
	fmovrslez	%i0,	%f0,	%f3
	nop
	fitos	%f3,	%f2
	fstoi	%f2,	%f10
	call	loop_33
	fmovsug	%fcc2,	%f4,	%f10
	call	loop_34
	call	loop_35
loop_33:
	fmovsneg	%xcc,	%f26,	%f8
	call	loop_36
loop_34:
	flushw
loop_35:
	nop
	setx	0xF22DF8BB7FA2419B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	setx	0x34451C813132F048,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	fsubd	%f6,	%f18,	%f6
	movcc	%icc,	%l5,	%i7
loop_36:
	fmovsle	%icc,	%f13,	%f14
	fmovsa	%xcc,	%f9,	%f28
	fornot1s	%f5,	%f8,	%f20
	fmovdue	%fcc1,	%f8,	%f28
	movpos	%icc,	0x504,	%l2
	call	loop_37
	fmovsleu	%xcc,	%f25,	%f18
	fpack16	%f6,	%f6
	nop
	setx	0xF0707C7B30176808,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0x0CD33FAAD2684B6E,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	fsubd	%f10,	%f14,	%f0
loop_37:
	call	loop_38
	call	loop_39
	fbge,a	%fcc1,	loop_40
	or	%g2,	%i4,	%g6
loop_38:
	tsubcc	%l3,	%i3,	%o1
loop_39:
	movrlz	%o0,	%i2,	%g1
loop_40:
	fmovdne	%xcc,	%f20,	%f22
	call	loop_41
	orcc	%o2,	0x1CDB,	%i1
	call	loop_42
	rdhpr	%htba,	%o6
loop_41:
	nop
	setx	0x1D41,	%l0,	%g7
	udivcc	%o7,	%g7,	%g5
	fbge,a,pt	%fcc3,	loop_43
loop_42:
	call	loop_44
	call	loop_45
	nop
	setx	0x1703,	%l0,	%l4
	udivx	%l0,	%l4,	%o3
loop_43:
	call	loop_46
loop_44:
	call	loop_47
loop_45:
	call	loop_48
	fands	%f31,	%f17,	%f20
loop_46:
	srax	%o4,	0x08,	%g4
loop_47:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_48:
	fble,pn	%fcc1,	loop_49
	call	loop_50
	fpadd32s	%f25,	%f10,	%f20
	edge8l	%g3,	%l1,	%l6
loop_49:
	addcc	%i5,	%l5,	%i7
loop_50:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%y,	%i4
	call	loop_51
	edge8n	%g2,	%l3,	%i3
	fandnot2	%f0,	%f8,	%f30
	taddcc	%o1,	%g6,	%o0
loop_51:
	fands	%f6,	%f13,	%f5
	smul	%g1,	0x1EC8,	%i2
	movn	%icc,	%o2,	%i1
	nop
	setx	0x31FF559D,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f25
	setx	0xEC8032D2,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f24
	fmuls	%f24,	%f25,	%f14
	call	loop_52
	fzero	%f14
	edge8ln	%o7,	%g7,	%o6
	nop
	setx	0xFA79DEE102341FC2,	%l0,	%l6
	stx	%l6,	[%l7 + 0x60]
	ldx	[%l7 + 0x60],	%fsr
loop_52:
	nop
	setx	0xC56BF518,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f17
	setx	0x799EF48E,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f9
	fadds	%f9,	%f17,	%f23
	nop
	setx loop_53, %l0, %l1
	jmpl %l1, %g5
	rd	%fprs,	%l4
	call	loop_54
	smulcc	%o3,	%o4,	%l0
loop_53:
	movrne	%g4,	0x020,	%i6
	move	%fcc0,	0x462,	%g3
loop_54:
	tl	%xcc,	0x2
	movre	%o5,	%l6,	%i5
	call	loop_55
	sir	0x0213
	movue	%fcc1,	%l5,	%l1
	fmovdvc	%icc,	%f22,	%f6
loop_55:
	add	%i7,	0x0DD9,	%i0
	movvc	%xcc,	%l2,	%g2
	set	0x40, %l3
	ldda	[%l7 + %l3] 0xd0,	%f16
	call	loop_56
	bvs,a,pn	%icc,	loop_57
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	fmovsleu	%xcc,	%f18,	%f12
loop_56:
	andn	%l3,	%i4,	%i3
loop_57:
	flushw
	movneg	%xcc,	0x531,	%g6
	fmovda	%fcc1,	%f10,	%f6
	te	%icc,	0x7
	call	loop_58
	nop
	setx	0xC92F657F6910134F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0xB90626EED6467CB7,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	faddd	%f16,	%f4,	%f10
	set	0x4C, %o7
	swapa	[%l7 + %o7] 0x89,	%o0
loop_58:
	wrpr	%g1,	0x02CE,	%tick
	tsubcc	%o1,	0x02F0,	%i2
	fone	%f28
	fmul8sux16	%f6,	%f24,	%f6
	sll	%o2,	%i1,	%o7
	set	0x40, %g2
	stda	%f16,	[%l7 + %g2] 0xc0
	pdist	%f10,	%f24,	%f20
	udiv	%o6,	0x113C,	%g7
	nop
	fitod	%f12,	%f14
	fdtox	%f14,	%f12
	fxtod	%f12,	%f24
	fmovdg	%xcc,	%f20,	%f8
	fpack16	%f0,	%f12
	fmovse	%fcc1,	%f6,	%f5
	call	loop_59
	call	loop_60
	call	loop_61
	fnot2	%f14,	%f6
loop_59:
	nop

loop_60:
	nop

loop_61:
	nop

	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 0:
!
!	Type l   	: 9
!	Type a   	: 14
!	Type x   	: 3
!	Type cti   	: 61
!	Type f   	: 52
!	Type i   	: 61
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
	set	0xD,	%g1
	set	0xC,	%g2
	set	0x0,	%g3
	set	0xF,	%g4
	set	0x0,	%g5
	set	0xF,	%g6
	set	0x2,	%g7
	!# Input registers
	set	-0x2,	%i0
	set	-0x6,	%i1
	set	-0x8,	%i2
	set	-0x5,	%i3
	set	-0x5,	%i4
	set	-0xC,	%i5
	set	-0x2,	%i6
	set	-0x0,	%i7
	!# Local registers
	set	0x570EF128,	%l0
	set	0x74AEBD7F,	%l1
	set	0x0BB26573,	%l2
	set	0x05CD3A1B,	%l3
	set	0x104B163E,	%l4
	set	0x4CC8C4E7,	%l5
	set	0x64A96252,	%l6
	!# Output registers
	set	-0x119E,	%o0
	set	0x0E32,	%o1
	set	0x17FC,	%o2
	set	0x01B2,	%o3
	set	-0x1312,	%o4
	set	0x0B1F,	%o5
	set	0x1B8E,	%o6
	set	0x14B6,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0xCA69A1BAA097B7E4)
	INIT_TH_FP_REG(%l7,%f2,0xA5930CCD12ECD1A8)
	INIT_TH_FP_REG(%l7,%f4,0x5C5D16CB6A7525A5)
	INIT_TH_FP_REG(%l7,%f6,0xCB01F7A448011172)
	INIT_TH_FP_REG(%l7,%f8,0x715D781124CD36A4)
	INIT_TH_FP_REG(%l7,%f10,0xA668DF89B14C9E1A)
	INIT_TH_FP_REG(%l7,%f12,0xEA53BB1C867A6474)
	INIT_TH_FP_REG(%l7,%f14,0xCC22F91C5A384F51)
	INIT_TH_FP_REG(%l7,%f16,0x7B089FEA34E40332)
	INIT_TH_FP_REG(%l7,%f18,0x51E4631645A339E9)
	INIT_TH_FP_REG(%l7,%f20,0x762301810F8A696E)
	INIT_TH_FP_REG(%l7,%f22,0x3FFBCBF7985D7B74)
	INIT_TH_FP_REG(%l7,%f24,0x64762B99AC9EE44B)
	INIT_TH_FP_REG(%l7,%f26,0x6419ABE504DC3F27)
	INIT_TH_FP_REG(%l7,%f28,0xBB5E2B6F06B5CAF7)
	INIT_TH_FP_REG(%l7,%f30,0x4A9512DC19287841)

	!# Execute Main Diag ..

	call	loop_62
	fsrc2s	%f21,	%f9
	fandnot1s	%f2,	%f27,	%f9
	st	%f14,	[%l7 + 0x54]
loop_62:
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	umul	%g5,	%l4,	%o3
	tvs	%icc,	0x0
	fandnot1	%f18,	%f2,	%f14
	call	loop_63
	brz	%l0,	loop_64
	fmovdcc	%icc,	%f12,	%f10
	call	loop_65
loop_63:
	wrpr 	%g0, 	0x0, 	%gl
loop_64:
	sethi	0x0CFF,	%i6
	fmovdge	%xcc,	%f8,	%f18
loop_65:
	call	loop_66
	edge32l	%g3,	%o5,	%g4
	nop
	setx	0x76F06022E89CFA28,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldx	[%l7 + 0x28],	%fsr
	smul	%l6,	%l5,	%i5
loop_66:
	nop
	set	0x20, %g3
	ldda	[%l7 + %g3] 0x0c,	%i6
	fxors	%f15,	%f8,	%f20
	call	loop_67
	fpack16	%f16,	%f1
	bcs	%xcc,	loop_68
	and	%i0,	0x0842,	%l2
loop_67:
	sub	%g2,	0x0484,	%l1
	fxnors	%f27,	%f12,	%f27
loop_68:
	movu	%fcc1,	0x2F9,	%i4
	call	loop_69
	call	loop_70
	fcmple16	%f20,	%f30,	%l3
	call	loop_71
loop_69:
	mova	%icc,	0x4E8,	%g6
loop_70:
	bg,a	%icc,	loop_72
	andn	%i3,	0x00B0,	%g1
loop_71:
	fmovsul	%fcc1,	%f29,	%f26
	call	loop_73
loop_72:
	tl	%icc,	0x2
	sdivcc	%o0,	0x01,	%i2
	fmovdul	%fcc1,	%f12,	%f30
loop_73:
	fmovsge	%xcc,	%f11,	%f26
	wrpr	%o1,	0x0DAC,	%tick
	fpackfix	%f18,	%f20
	movgu	%icc,	0x211,	%i1
	fcmped	%fcc3,	%f16,	%f20
	fzero	%f28
	edge32n	%o7,	%o2,	%g7
	faligndata	%f18,	%f26,	%f26
	fmovdle	%xcc,	%f30,	%f2
	tne	%icc,	0x3
	bneg,pt	%xcc,	loop_74
	tsubcctv	%o6,	0x0B99,	%l4
	set	0x50, %g1
	sta	%f18,	[%l7 + %g1] 0x11
loop_74:
	for	%f20,	%f12,	%f18
	call	loop_75
	fmovsvs	%xcc,	%f28,	%f25
	sdivcc	%g5,	0x1C32,	%o3
	stx	%fsr,	[%l7 + 0x08]
loop_75:
	fornot1	%f26,	%f2,	%f14
	edge16	%l0,	%o4,	%i6
	tl	%icc,	0x2
	andcc	%g3,	0x19C8,	%o5
	set	0x38, %l1
	stwa	%g4,	[%l7 + %l1] 0x11
	call	loop_76
	call	loop_77
	te	%icc,	0x0
	srl	%l6,	0x03,	%i5
loop_76:
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
loop_77:
	call	loop_78
	nop
	fitod	%f8,	%f12
	fdtox	%f12,	%f8
	fxtod	%f8,	%f2
	call	loop_79
	fmovsle	%icc,	%f28,	%f16
loop_78:
	nop
	set	0x20, %g4
	prefetcha	[%l7 + %g4] 0x80,	 2
loop_79:
	movo	%fcc0,	0x5DD,	%i7
	bn	%icc,	loop_80
	call	loop_81
	call	loop_82
	fcmpne16	%f6,	%f24,	%l2
loop_80:
	nop
	setx	0x716ED282,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f8
	fsqrts	%f8,	%f29
loop_81:
	fmovsvs	%icc,	%f4,	%f26
loop_82:
	fcmple16	%f14,	%f26,	%i0
	call	loop_83
	fsrc1s	%f19,	%f1
	fnors	%f2,	%f29,	%f17
	call	loop_84
loop_83:
	edge16ln	%l1,	%i4,	%g2
	wrpr	%g6,	0x13D7,	%pil
	call	loop_85
loop_84:
	nop
	setx	0x7A08ED09,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f7
	setx	0x136E8178,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f4
	fadds	%f4,	%f7,	%f9
	edge16l	%l3,	%i3,	%o0
	fmovdle	%fcc3,	%f18,	%f12
loop_85:
	fabss	%f16,	%f27
	fexpand	%f22,	%f30
	sllx	%i2,	%g1,	%i1
	call	loop_86
	tvs	%icc,	0x1
	set	0x58, %g7
	stba	%o1,	[%l7 + %g7] 0x0c
loop_86:
	fmovdul	%fcc0,	%f6,	%f18
	array16	%o7,	%o2,	%o6
	nop
	set	0x70, %o3
	ldd	[%l7 + %o3],	%l4
	fpadd32s	%f6,	%f13,	%f24
	rdpr	%gl,	%g5
	brlz	%o3,	loop_87
	nop
	setx	0xD83184F2DECE4998,	%l0,	%l6
	stx	%l6,	[%l7 + 0x50]
	ldx	[%l7 + 0x50],	%fsr
	fmul8x16al	%f25,	%f8,	%f28
	edge16l	%g7,	%l0,	%o4
loop_87:
	andn	%g3,	0x02CD,	%i6
	bvc	%xcc,	loop_88
	movre	%o5,	0x21A,	%g4
	nop
	setx	0xD6E13666,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f27
	setx	0x238FA02A,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f26
	fmuls	%f26,	%f27,	%f8
	tge	%icc,	0x2
loop_88:
	call	loop_89
	call	loop_90
	movvc	%icc,	0x172,	%l6
	rdpr	%otherwin,	%l5
loop_89:
	flush	%l7 + 0x30
loop_90:
	call	loop_91
	edge8	%i5,	%l2,	%i0
	rdhpr	%hpstate,	%i7
	nop
	setx	loop_92,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x022100001404,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_91:
	fmovdug	%fcc3,	%f30,	%f16
	brlz,pt	%i4,	loop_93
	movneg	%xcc,	%g2,	%g6
loop_92:
	call	loop_94
	call	loop_95
loop_93:
	fmovdg	%fcc1,	%f30,	%f2
	fmovdcs	%icc,	%f4,	%f6
loop_94:
	nop
	setx loop_96, %l0, %l1
	jmpl %l1, %l3
loop_95:
	fpadd16	%f8,	%f14,	%f10
	call	loop_97
	tn	%icc,	0x6
loop_96:
	xorcc	%l1,	%o0,	%i3
	fmul8ulx16	%f30,	%f10,	%f22
loop_97:
	call	loop_98
	fmovrde	%g1,	%f4,	%f28
	fand	%f14,	%f10,	%f0
	call	loop_99
loop_98:
	sir	0x1E00
	call	loop_100
	lduh	[%l7 + 0x5E],	%i2
loop_99:
	orn	%o1,	%i1,	%o2
	call	loop_101
loop_100:
	fcmpne16	%f28,	%f22,	%o6
	call	loop_102
	fmovrse	%o7,	%f23,	%f0
loop_101:
	call	loop_103
	fcmpne16	%f18,	%f30,	%g5
loop_102:
	sll	%l4,	%g7,	%l0
	bshuffle	%f10,	%f4,	%f8
loop_103:
	call	loop_104
	fmovdue	%fcc2,	%f2,	%f10
	fxors	%f24,	%f0,	%f2
	tpos	%icc,	0x3
loop_104:
	call	loop_105
	fxors	%f26,	%f29,	%f31
	call	loop_106
	call	loop_107
loop_105:
	fmuld8ulx16	%f29,	%f18,	%f2
	siam	0x6
loop_106:
	nop
	fitod	%f4,	%f6
	fdtox	%f6,	%f0
loop_107:
	bge,a,pn	%xcc,	loop_108
	fpackfix	%f28,	%f4
	nop
	setx	0x04CF,	%l0,	%o4
	udivcc	%o3,	%o4,	%g3
	xnor	%o5,	0x024B,	%i6
loop_108:
	call	loop_109
	fnors	%f5,	%f21,	%f13
	call	loop_110
	movn	%icc,	%g4,	%l5
loop_109:
	call	loop_111
	call	loop_112
loop_110:
	fpmerge	%f10,	%f0,	%f0
	array8	%i5,	%l6,	%l2
loop_111:
	movl	%xcc,	%i7,	%i0
loop_112:
	fmovdo	%fcc2,	%f26,	%f10
	movneg	%xcc,	0x4D6,	%i4
	and	%g6,	%g2,	%l1
	wr	%o0,	0x002E,	%sys_tick
	tvc	%xcc,	0x1
	fmovsa	%icc,	%f15,	%f4
	rd	%sys_tick_cmpr,	%i3
	fcmpd	%fcc1,	%f4,	%f26
	ta	%icc,	0x6
	ta	%icc,	0x0
	popc	0x081D,	%l3
	bvs,pt	%xcc,	loop_113
	call	loop_114
	call	loop_115
	sethi	0x1F13,	%g1
loop_113:
	fmuld8ulx16	%f30,	%f28,	%f22
loop_114:
	call	loop_116
loop_115:
	mulx	%o1,	%i1,	%i2
	call	loop_117
	xnor	%o6,	%o7,	%o2
loop_116:
	movuge	%fcc2,	0x726,	%l4
	add	%g7,	%l0,	%o3
loop_117:
	nop

	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 1:
!
!	Type l   	: 12
!	Type a   	: 8
!	Type x   	: 5
!	Type cti   	: 56
!	Type f   	: 60
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
	set	0xD,	%g1
	set	0xB,	%g2
	set	0x3,	%g3
	set	0x4,	%g4
	set	0x5,	%g5
	set	0x4,	%g6
	set	0xB,	%g7
	!# Input registers
	set	-0x4,	%i0
	set	-0x4,	%i1
	set	-0xB,	%i2
	set	-0x5,	%i3
	set	-0xE,	%i4
	set	-0xF,	%i5
	set	-0xD,	%i6
	set	-0x6,	%i7
	!# Local registers
	set	0x3A04E884,	%l0
	set	0x0D7FA8B7,	%l1
	set	0x6C5407F6,	%l2
	set	0x10FEEC30,	%l3
	set	0x6EBB98E8,	%l4
	set	0x697F1E45,	%l5
	set	0x090654D2,	%l6
	!# Output registers
	set	-0x0B9F,	%o0
	set	-0x1647,	%o1
	set	-0x0A90,	%o2
	set	-0x1F85,	%o3
	set	0x0851,	%o4
	set	-0x0641,	%o5
	set	-0x0765,	%o6
	set	-0x1A37,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0xCA69A1BAA097B7E4)
	INIT_TH_FP_REG(%l7,%f2,0xA5930CCD12ECD1A8)
	INIT_TH_FP_REG(%l7,%f4,0x5C5D16CB6A7525A5)
	INIT_TH_FP_REG(%l7,%f6,0xCB01F7A448011172)
	INIT_TH_FP_REG(%l7,%f8,0x715D781124CD36A4)
	INIT_TH_FP_REG(%l7,%f10,0xA668DF89B14C9E1A)
	INIT_TH_FP_REG(%l7,%f12,0xEA53BB1C867A6474)
	INIT_TH_FP_REG(%l7,%f14,0xCC22F91C5A384F51)
	INIT_TH_FP_REG(%l7,%f16,0x7B089FEA34E40332)
	INIT_TH_FP_REG(%l7,%f18,0x51E4631645A339E9)
	INIT_TH_FP_REG(%l7,%f20,0x762301810F8A696E)
	INIT_TH_FP_REG(%l7,%f22,0x3FFBCBF7985D7B74)
	INIT_TH_FP_REG(%l7,%f24,0x64762B99AC9EE44B)
	INIT_TH_FP_REG(%l7,%f26,0x6419ABE504DC3F27)
	INIT_TH_FP_REG(%l7,%f28,0xBB5E2B6F06B5CAF7)
	INIT_TH_FP_REG(%l7,%f30,0x4A9512DC19287841)

	!# Execute Main Diag ..

	tgu	%icc,	0x5
	andcc	%o4,	%g5,	%g3
	call	loop_118
	fnot2s	%f22,	%f10
	fxnors	%f22,	%f17,	%f20
	fbe,a,pn	%fcc3,	loop_119
loop_118:
	fmovd	%f22,	%f20
	call	loop_120
	mova	%fcc1,	%i6,	%g4
loop_119:
	bmask	%l5,	%i5,	%l6
	fmovdlg	%fcc1,	%f14,	%f24
loop_120:
	fble	%fcc2,	loop_121
	fmul8x16au	%f27,	%f17,	%f6
	fmovdug	%fcc2,	%f22,	%f8
	call	loop_122
loop_121:
	tsubcc	%l2,	0x1AC7,	%o5
	call	loop_123
	mulx	%i0,	0x199C,	%i4
loop_122:
	call	loop_124
	rdpr	%canrestore,	%i7
loop_123:
	fbug,a	%fcc1,	loop_125
	call	loop_126
loop_124:
	call	loop_127
	fsrc1s	%f20,	%f31
loop_125:
	array8	%g6,	%l1,	%g2
loop_126:
	tpos	%xcc,	0x6
loop_127:
	fandnot2	%f0,	%f30,	%f30
	call	loop_128
	nop
	fitos	%f6,	%f26
	fstod	%f26,	%f16
	bne,a,pt	%xcc,	loop_129
	call	loop_130
loop_128:
	umul	%o0,	%l3,	%i3
	wr	%g0,	0xeb,	%asi
	stxa	%o1,	[%l7 + 0x10] %asi
	membar	#Sync
loop_129:
	fexpand	%f19,	%f16
loop_130:
	call	loop_131
	call	loop_132
	fornot2	%f26,	%f6,	%f26
	movue	%fcc1,	%i1,	%i2
loop_131:
	call	loop_133
loop_132:
	movcc	%icc,	0x6D2,	%g1
	fcmpd	%fcc0,	%f4,	%f14
	movg	%fcc3,	%o6,	%o2
loop_133:
	nop
	set	0x14, %i1
	flush	%l7 + %i1
	fbul,a,pn	%fcc2,	loop_134
	call	loop_135
	fnot1	%f26,	%f2
	te	%icc,	0x5
loop_134:
	movrne	%l4,	%o7,	%g7
loop_135:
	call	loop_136
	fmovscs	%xcc,	%f8,	%f30
	fmovrdne	%l0,	%f6,	%f10
	brgz,a,pt	%o4,	loop_137
loop_136:
	movrne	%g5,	%o3,	%g3
	fandnot1s	%f22,	%f29,	%f10
	umul	%i6,	%l5,	%g4
loop_137:
	fmovrslez	%l6,	%f28,	%f14
	array16	%i5,	%o5,	%i0
	call	loop_138
	stbar
	fmovdul	%fcc0,	%f20,	%f0
	call	loop_139
loop_138:
	andncc	%l2,	%i7,	%g6
	brgz,a,pt	%i4,	loop_140
	nop
	setx	0x03C2E71B,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f11
	setx	0x4E3C069D,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f18
	fadds	%f18,	%f11,	%f6
loop_139:
	nop
	add	%l7,	0x30,	%l6
	wr	%g0,	0x19,	%asi
	casa	[%l6] %asi,	%g2,	%o0
loop_140:
	array32	%l3,	%l1,	%i3
	call	loop_141
	fmovdug	%fcc2,	%f8,	%f0
	st	%f17,	[%l7 + 0x2C]
	brz,a,pn	%o1,	loop_142
loop_141:
	fnegd	%f8,	%f16
	movl	%icc,	%i1,	%g1
	call	loop_143
loop_142:
	fnot1s	%f10,	%f23
	wrpr	%i2,	0x03EA,	%pil
	fmovsvs	%xcc,	%f16,	%f15
loop_143:
	movcs	%xcc,	0x24E,	%o2
	rd	%y,	%o6
	call	loop_144
	fornot1	%f4,	%f4,	%f16
	call	loop_145
	fexpand	%f7,	%f24
loop_144:
	nop
	set	0x20, %o6
	prefetcha	[%l7 + %o6] 0x04,	 1
loop_145:
	fmovsg	%icc,	%f30,	%f11
	call	loop_146
	nop
	set	0x68, %o2
	ldstub	[%l7 + %o2],	%l4
	bmask	%g7,	%l0,	%o4
	fcmpgt32	%f14,	%f20,	%o3
loop_146:
	fornot2	%f12,	%f14,	%f20
	fmovrdgez	%g3,	%f12,	%f26
	fornot2	%f18,	%f0,	%f30
	call	loop_147
	call	loop_148
	call	loop_149
	addcc	%g5,	%l5,	%g4
loop_147:
	bg,pt	%icc,	loop_150
loop_148:
	call	loop_151
loop_149:
	fabsd	%f26,	%f16
	call	loop_152
loop_150:
	fnands	%f0,	%f18,	%f27
loop_151:
	fmovs	%f24,	%f30
	ld	[%l7 + 0x30],	%f11
loop_152:
	call	loop_153
	fpack16	%f6,	%f30
	call	loop_154
	bl,a,pn	%icc,	loop_155
loop_153:
	tgu	%icc,	0x7
	fmovdle	%fcc1,	%f0,	%f28
loop_154:
	fmovsl	%xcc,	%f31,	%f26
loop_155:
	call	loop_156
	fbl,a	%fcc3,	loop_157
	fxnor	%f30,	%f6,	%f6
	fcmpes	%fcc3,	%f7,	%f13
loop_156:
	smul	%l6,	%i6,	%o5
loop_157:
	call	loop_158
	rdhpr	%hintp,	%i5
	call	loop_159
	nop
	set	0x78, %i7
	stx	%i0,	[%l7 + %i7]
loop_158:
	bne,a,pn	%icc,	loop_160
	fcmpne16	%f0,	%f12,	%l2
loop_159:
	rdhpr	%hintp,	%i7
	udivx	%i4,	0x0698,	%g2
loop_160:
	fbul,pt	%fcc2,	loop_161
	siam	0x6
	nop
	setx	0x9E0D9253039B1AEA,	%l0,	%l6
	stx	%l6,	[%l7 + 0x78]
	ldx	[%l7 + 0x78],	%fsr
	bshuffle	%f28,	%f6,	%f28
loop_161:
	call	loop_162
	wrpr 	%g0, 	0x3, 	%gl
	movule	%fcc2,	0x476,	%g6
	fornot2	%f0,	%f10,	%f4
loop_162:
	call	loop_163
	call	loop_164
	fandnot1s	%f21,	%f28,	%f29
	fmovdl	%fcc2,	%f12,	%f26
loop_163:
	popc	%l3,	%l1
loop_164:
	fcmps	%fcc1,	%f30,	%f27
	fxnors	%f26,	%f11,	%f25
	tleu	%xcc,	0x6
	call	loop_165
	call	loop_166
	fmovsneg	%xcc,	%f25,	%f10
	wrpr	%i3,	0x05E2,	%cwp
loop_165:
	udiv	%o1,	0x0DBC,	%i1
loop_166:
	fxors	%f19,	%f26,	%f25
	call	loop_167
	umul	%i2,	%g1,	%o6
	fpackfix	%f14,	%f30
	array32	%o7,	%l4,	%g7
loop_167:
	call	loop_168
	prefetch	[%l7 + 0x5C],	 3
	nop
	setx	0xAD2E4CC31B82590E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	fsqrtd	%f2,	%f4
	call	loop_169
loop_168:
	call	loop_170
	subccc	%o2,	0x0E41,	%l0
	rdhpr	%htba,	%o3
loop_169:
	call	loop_171
loop_170:
	and	%o4,	%g5,	%g3
	call	loop_172
	tneg	%icc,	0x0
loop_171:
	fmovdug	%fcc3,	%f2,	%f2
	call	loop_173
loop_172:
	fcmpgt32	%f10,	%f4,	%l5
	nop
	setx	0xD63C9431,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f29
	setx	0xC739EE63,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f11
	fadds	%f11,	%f29,	%f24
	bl,a,pn	%icc,	loop_174
loop_173:
	fandnot2s	%f29,	%f2,	%f6
	call	loop_175
	call	loop_176
loop_174:
	move	%fcc2,	%g4,	%i6
	nop
	setx	0x8B35EC81C5863506,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	fsqrtd	%f4,	%f28
loop_175:
	call	loop_177
loop_176:
	call	loop_178
	smul	%o5,	%l6,	%i0
	fnegs	%f24,	%f14
loop_177:
	call	loop_179
loop_178:
	fexpand	%f20,	%f26
	call	loop_180
	srax	%i5,	%l2,	%i4
loop_179:
	call	loop_181
	call	loop_182
loop_180:
	rd	%ccr,	%i7
	fmovdneg	%icc,	%f14,	%f8
loop_181:
	call	loop_183
loop_182:
	call	loop_184
	call	loop_185
	bmask	%o0,	%g2,	%g6
loop_183:
	mova	%fcc2,	0x639,	%l1
loop_184:
	nop
	setx	0x39951159,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f6
	setx	0xC44F4B42,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f17
	fsubs	%f17,	%f6,	%f9
loop_185:
	call	loop_186
	fabss	%f14,	%f30
	tleu	%icc,	0x7
	fmovrdlez	%i3,	%f20,	%f16
loop_186:
	call	loop_187
	call	loop_188
	fmovrdgz	%o1,	%f22,	%f0
	subc	%i1,	0x02D5,	%i2
loop_187:
	tn	%icc,	0x0
loop_188:
	fbue,a,pt	%fcc1,	loop_189
loop_189:
	nop

	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 2:
!
!	Type l   	: 11
!	Type a   	: 9
!	Type x   	: 3
!	Type cti   	: 72
!	Type f   	: 62
!	Type i   	: 43
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
	set	0x8,	%g1
	set	0xD,	%g2
	set	0x1,	%g3
	set	0xA,	%g4
	set	0xC,	%g5
	set	0x4,	%g6
	set	0xA,	%g7
	!# Input registers
	set	-0xA,	%i0
	set	-0x2,	%i1
	set	-0xD,	%i2
	set	-0xF,	%i3
	set	-0x7,	%i4
	set	-0x7,	%i5
	set	-0x2,	%i6
	set	-0xC,	%i7
	!# Local registers
	set	0x59E2A1E6,	%l0
	set	0x4DE5D126,	%l1
	set	0x302040B2,	%l2
	set	0x55DD89FF,	%l3
	set	0x382E3AB7,	%l4
	set	0x73AFEB5A,	%l5
	set	0x70ADE1C6,	%l6
	!# Output registers
	set	0x1BE5,	%o0
	set	0x18FD,	%o1
	set	0x13BF,	%o2
	set	-0x006F,	%o3
	set	0x062F,	%o4
	set	-0x19C9,	%o5
	set	0x0689,	%o6
	set	0x0976,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0xCA69A1BAA097B7E4)
	INIT_TH_FP_REG(%l7,%f2,0xA5930CCD12ECD1A8)
	INIT_TH_FP_REG(%l7,%f4,0x5C5D16CB6A7525A5)
	INIT_TH_FP_REG(%l7,%f6,0xCB01F7A448011172)
	INIT_TH_FP_REG(%l7,%f8,0x715D781124CD36A4)
	INIT_TH_FP_REG(%l7,%f10,0xA668DF89B14C9E1A)
	INIT_TH_FP_REG(%l7,%f12,0xEA53BB1C867A6474)
	INIT_TH_FP_REG(%l7,%f14,0xCC22F91C5A384F51)
	INIT_TH_FP_REG(%l7,%f16,0x7B089FEA34E40332)
	INIT_TH_FP_REG(%l7,%f18,0x51E4631645A339E9)
	INIT_TH_FP_REG(%l7,%f20,0x762301810F8A696E)
	INIT_TH_FP_REG(%l7,%f22,0x3FFBCBF7985D7B74)
	INIT_TH_FP_REG(%l7,%f24,0x64762B99AC9EE44B)
	INIT_TH_FP_REG(%l7,%f26,0x6419ABE504DC3F27)
	INIT_TH_FP_REG(%l7,%f28,0xBB5E2B6F06B5CAF7)
	INIT_TH_FP_REG(%l7,%f30,0x4A9512DC19287841)

	!# Execute Main Diag ..

	nop
	setx	0xF8754DC5D24BAC3E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0xD179DDD2,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fsmuld	%f0,	%f20,	%f14
	fmul8x16al	%f3,	%f0,	%f20
	edge16l	%l3,	%g1,	%o7
	rd	%softint,	%o6
	nop
	setx	0xF9687535,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f1
	setx	0x09596DB6,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f27
	fsubs	%f27,	%f1,	%f26
	call	loop_190
	tvs	%xcc,	0x3
	wr	%g7,	0x07F5,	%sys_tick
	fmovde	%xcc,	%f22,	%f8
loop_190:
	call	loop_191
	bn,pt	%xcc,	loop_192
	fpadd32s	%f28,	%f25,	%f2
	rd	%sys_tick_cmpr,	%l4
loop_191:
	alignaddrl	%l0,	%o3,	%o2
loop_192:
	fmul8x16au	%f3,	%f18,	%f26
	fmovsa	%fcc2,	%f18,	%f7
	movpos	%xcc,	%o4,	%g3
	movlg	%fcc3,	%l5,	%g4
	fpsub32s	%f14,	%f2,	%f2
	ta	%icc,	0x3
	fnot1	%f8,	%f12
	wr	%i6,	0x1D72,	%y
	bleu,pt	%icc,	loop_193
	nop
	setx	0x6FCACE8F40DBCC60,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0xA495F95E,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	fsmuld	%f16,	%f14,	%f6
	bn,a	%xcc,	loop_194
	movge	%fcc3,	0x27B,	%o5
loop_193:
	subc	%l6,	0x09F9,	%g5
	call	loop_195
loop_194:
	call	loop_196
	call	loop_197
	fpsub16	%f8,	%f24,	%f10
loop_195:
	fmovrsne	%i5,	%f22,	%f25
loop_196:
	ldstub	[%l7 + 0x53],	%i0
loop_197:
	edge8l	%l2,	%i4,	%o0
	sll	%i7,	%g2,	%l1
	fmovso	%fcc3,	%f28,	%f14
	fmovdvs	%icc,	%f2,	%f4
	fornot1	%f0,	%f20,	%f12
	alignaddr	%i3,	%g6,	%o1
	alignaddrl	%i2,	%i1,	%l3
	call	loop_198
	call	loop_199
	wrpr	%g1,	0x0445,	%tick
	nop
	set	0x28, %o5
	stx	%fsr,	[%l7 + %o5]
loop_198:
	fandnot1s	%f10,	%f15,	%f16
loop_199:
	call	loop_200
	and	%o7,	0x1BD7,	%g7
	popc	%l4,	%o6
	fmovdug	%fcc0,	%f2,	%f4
loop_200:
	movcc	%icc,	%o3,	%l0
	nop
	setx	0x0D8556A871BACE95,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0xF9A25E5617EC744C,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fmuld	%f0,	%f20,	%f10
	edge16l	%o4,	%g3,	%l5
	array16	%g4,	%i6,	%o2
	call	loop_201
	fpack32	%f14,	%f16,	%f14
	fabsd	%f0,	%f24
	flushw
loop_201:
	fmovdule	%fcc0,	%f10,	%f26
	call	loop_202
	call	loop_203
	and	%l6,	0x0937,	%g5
	wr	%g0,	0x11,	%asi
	ldsha	[%l7 + 0x1C] %asi,	%o5
loop_202:
	wrpr	%i0,	0x1C72,	%tick
loop_203:
	nop
	wr	%g0,	0x19,	%asi
	ldswa	[%l7 + 0x5C] %asi,	%l2
	array32	%i5,	%o0,	%i7
	nop
	setx	0x03D6,	%l0,	%i4
	udiv	%g2,	%i4,	%i3
	fmovrdgez	%g6,	%f28,	%f22
	call	loop_204
	call	loop_205
	nop
	setx	0xCA2D1DEF720951F2,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0x2136DCF7,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	fsmuld	%f30,	%f12,	%f14
	fmovrdlez	%o1,	%f28,	%f20
loop_204:
	edge8ln	%i2,	%i1,	%l3
loop_205:
	movl	%icc,	0x0EC,	%g1
	fcmped	%fcc1,	%f16,	%f24
	call	loop_206
	call	loop_207
	fandnot1s	%f2,	%f0,	%f4
	bmask	%o7,	%g7,	%l1
loop_206:
	nop
	fitod	%f20,	%f16
loop_207:
	edge8n	%l4,	%o3,	%o6
	fmovrdne	%l0,	%f2,	%f14
	xnorcc	%o4,	%g3,	%g4
	fxors	%f30,	%f13,	%f3
	call	loop_208
	fmovdcc	%icc,	%f22,	%f4
	fba	%fcc3,	loop_209
	movneg	%icc,	0x6AC,	%l5
loop_208:
	nop
	set	0x50, %l5
	flush	%l7 + %l5
	fmovrsne	%o2,	%f10,	%f15
loop_209:
	call	loop_210
	movne	%xcc,	%l6,	%g5
	call	loop_211
	edge8	%o5,	%i6,	%i0
loop_210:
	tvc	%icc,	0x2
	call	loop_212
loop_211:
	fmovsug	%fcc0,	%f5,	%f20
	subcc	%l2,	0x10E5,	%i5
	fnands	%f29,	%f8,	%f10
loop_212:
	taddcc	%o0,	0x0D13,	%i7
	rdpr	%pil,	%i4
	movvc	%icc,	%g2,	%g6
	fnot2s	%f14,	%f11
	fcmpne16	%f20,	%f10,	%i3
	call	loop_213
	nop
	setx	0xBDE28B7E,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f29
	setx	0x7F630EC4,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f10
	fadds	%f10,	%f29,	%f8
	edge16	%i2,	%o1,	%i1
	fcmpne32	%f8,	%f16,	%g1
loop_213:
	call	loop_214
	movleu	%xcc,	0x254,	%l3
	bl	%icc,	loop_215
	tsubcc	%o7,	%l1,	%g7
loop_214:
	sra	%o3,	%l4,	%o6
	fcmped	%fcc3,	%f14,	%f12
loop_215:
	fbn,pt	%fcc3,	loop_216
	nop
	setx	0x226B117A,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f0
	setx	0x5194917E,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f5
	fmuls	%f5,	%f0,	%f22
	fnegd	%f20,	%f28
	fcmple32	%f0,	%f28,	%o4
loop_216:
	call	loop_217
	movre	%g3,	0x1F9,	%g4
	movvc	%icc,	0x5C8,	%l5
	fbge	%fcc3,	loop_218
loop_217:
	edge32l	%o2,	%l6,	%l0
	call	loop_219
	movleu	%icc,	%o5,	%g5
loop_218:
	fmovdvc	%icc,	%f24,	%f6
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
loop_219:
	prefetch	[%l7 + 0x70],	 0
	movuge	%fcc2,	%i0,	%l2
	fmovdu	%fcc3,	%f30,	%f16
	nop
	setx	0x5AB58F6EEBA757FA,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0xDB7734A2,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	fsmuld	%f18,	%f14,	%f18
	fcmple32	%f18,	%f4,	%i6
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	fmovrsne	%o0,	%f2,	%f9
	fmul8x16au	%f12,	%f21,	%f18
	tcc	%icc,	0x4
	xnorcc	%i7,	0x0638,	%i4
	edge32ln	%i5,	%g6,	%g2
	call	loop_220
	ldd	[%l7 + 0x60],	%f16
	wrpr 	%g0, 	0x0, 	%gl
	call	loop_221
loop_220:
	fmovso	%fcc1,	%f0,	%f12

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x311, 	%hsys_tick_cmpr
	movge	%icc,	0x342,	%g1
loop_221:
	movrlz	%o7,	%l3,	%g7
	fnands	%f30,	%f4,	%f8
	fmovrsgz	%l1,	%f22,	%f31
	subc	%o3,	%o6,	%l4
	wr	%g0,	0x89,	%asi
	lduwa	[%l7 + 0x20] %asi,	%o4
	edge32n	%g4,	%g3,	%l5
	call	loop_222
	rd	%tick_cmpr,	%o2
	flush	%l7 + 0x40
	call	loop_223
loop_222:
	fmul8ulx16	%f12,	%f2,	%f22
	set	0x2C, %i0
	lda	[%l7 + %i0] 0x81,	%f3
loop_223:
	call	loop_224
	mova	%icc,	%l0,	%o5
	movu	%fcc3,	0x026,	%g5
	call	loop_225
loop_224:
	call	loop_226
	xor	%i0,	%l6,	%i6
	fpadd16s	%f19,	%f27,	%f8
loop_225:
	mulscc	%o0,	0x1D8E,	%l2
loop_226:
	sub	%i7,	0x0A6E,	%i5
	call	loop_227
	brgz,a,pt	%i4,	loop_228
	brgz,a,pn	%g6,	loop_229
	fmovrslz	%i3,	%f6,	%f24
loop_227:
	fmovsgu	%icc,	%f5,	%f30
loop_228:
	nop
	setx	loop_230,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x004400001401,	%l0,	%l1
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
loop_229:
	fmovdu	%fcc3,	%f8,	%f18
	taddcctv	%g2,	0x0C4B,	%i2
	fcmpeq32	%f6,	%f22,	%o1
loop_230:
	rdpr	%pil,	%g1
	fmovsge	%xcc,	%f24,	%f9
	wr	%g0,	0x18,	%asi
	prefetcha	[%l7 + 0x68] %asi,	 2
	ld	[%l7 + 0x3C],	%f8
	fmovs	%f5,	%f12
	call	loop_231
	xor	%l3,	0x03C7,	%i1
	alignaddr	%g7,	%l1,	%o6
	call	loop_232
loop_231:
	fmovdne	%xcc,	%f6,	%f26
	edge16l	%l4,	%o4,	%o3
	fmovrdgez	%g4,	%f26,	%f12
loop_232:
	call	loop_233
	tvc	%xcc,	0x4
	fmovrdne	%l5,	%f2,	%f20
	fpackfix	%f2,	%f3
loop_233:
	call	loop_234
	orn	%g3,	%o2,	%o5
	andn	%g5,	0x12AD,	%l0
	call	loop_235
loop_234:
	nop
	fitos	%f5,	%f7
	fstox	%f7,	%f20
	fxtos	%f20,	%f1
loop_235:
	nop

	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 3:
!
!	Type l   	: 12
!	Type a   	: 11
!	Type x   	: 5
!	Type cti   	: 46
!	Type f   	: 63
!	Type i   	: 63
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
	set	0x9,	%g3
	set	0x7,	%g4
	set	0x1,	%g5
	set	0x9,	%g6
	set	0x5,	%g7
	!# Input registers
	set	-0x2,	%i0
	set	-0x0,	%i1
	set	-0x2,	%i2
	set	-0x7,	%i3
	set	-0xF,	%i4
	set	-0x0,	%i5
	set	-0x2,	%i6
	set	-0x6,	%i7
	!# Local registers
	set	0x3853425F,	%l0
	set	0x7763437C,	%l1
	set	0x60FF6154,	%l2
	set	0x439BEB8F,	%l3
	set	0x2C1B1801,	%l4
	set	0x6FDED986,	%l5
	set	0x0B095473,	%l6
	!# Output registers
	set	-0x177E,	%o0
	set	-0x1926,	%o1
	set	0x1E40,	%o2
	set	0x1B95,	%o3
	set	-0x083F,	%o4
	set	0x1855,	%o5
	set	0x0436,	%o6
	set	-0x0481,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0xCA69A1BAA097B7E4)
	INIT_TH_FP_REG(%l7,%f2,0xA5930CCD12ECD1A8)
	INIT_TH_FP_REG(%l7,%f4,0x5C5D16CB6A7525A5)
	INIT_TH_FP_REG(%l7,%f6,0xCB01F7A448011172)
	INIT_TH_FP_REG(%l7,%f8,0x715D781124CD36A4)
	INIT_TH_FP_REG(%l7,%f10,0xA668DF89B14C9E1A)
	INIT_TH_FP_REG(%l7,%f12,0xEA53BB1C867A6474)
	INIT_TH_FP_REG(%l7,%f14,0xCC22F91C5A384F51)
	INIT_TH_FP_REG(%l7,%f16,0x7B089FEA34E40332)
	INIT_TH_FP_REG(%l7,%f18,0x51E4631645A339E9)
	INIT_TH_FP_REG(%l7,%f20,0x762301810F8A696E)
	INIT_TH_FP_REG(%l7,%f22,0x3FFBCBF7985D7B74)
	INIT_TH_FP_REG(%l7,%f24,0x64762B99AC9EE44B)
	INIT_TH_FP_REG(%l7,%f26,0x6419ABE504DC3F27)
	INIT_TH_FP_REG(%l7,%f28,0xBB5E2B6F06B5CAF7)
	INIT_TH_FP_REG(%l7,%f30,0x4A9512DC19287841)

	!# Execute Main Diag ..

	movre	%l6,	%i0,	%o0
	udivcc	%l2,	0x06BE,	%i7
	call	loop_236
	tleu	%xcc,	0x5
	call	loop_237
	call	loop_238
loop_236:
	movne	%fcc3,	%i5,	%i6
	alignaddr	%g6,	%i3,	%g2
loop_237:
	fcmple32	%f14,	%f22,	%i2
loop_238:
	fmovdo	%fcc2,	%f30,	%f2
	call	loop_239
	fmovdne	%fcc2,	%f4,	%f22
	nop
	set	0x68, %l4
	ldstub	[%l7 + %l4],	%o1
	tcc	%xcc,	0x0
loop_239:
	fmovdle	%icc,	%f20,	%f6
	edge8l	%g1,	%o7,	%l3
	xnorcc	%i4,	%g7,	%i1
	sdivcc	%o6,	0x08AF,	%l4
	movgu	%icc,	%o4,	%l1
	wr	%g0,	0x88,	%asi
	lduwa	[%l7 + 0x18] %asi,	%g4
	fmul8sux16	%f12,	%f4,	%f18
	te	%icc,	0x2
	fmovde	%fcc0,	%f14,	%f16
	call	loop_240
	ble	%xcc,	loop_241
	wr 	%g0, 	0x7, 	%fprs
	udiv	%g3,	0x0A7A,	%l5
loop_240:
	call	loop_242
loop_241:
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	call	loop_243
	edge16	%o2,	%o5,	%l0
loop_242:
	mulscc	%g5,	%l6,	%i0
	edge32ln	%o0,	%l2,	%i7
loop_243:
	or	%i5,	%i6,	%i3
	fnands	%f26,	%f24,	%f20
	siam	0x7
	call	loop_244
	call	loop_245
	fcmpeq16	%f0,	%f16,	%g6
	fmovsneg	%xcc,	%f18,	%f14
loop_244:
	fmovrdlz	%g2,	%f16,	%f30
loop_245:
	call	loop_246
	call	loop_247
	nop
	setx	0x15A7,	%l0,	%o1
	udivcc	%i2,	%o1,	%o7
	orcc	%g1,	%l3,	%i4
loop_246:
	fmul8sux16	%f20,	%f18,	%f16
loop_247:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xCA3, 	%hsys_tick_cmpr
	or	%o6,	0x14A4,	%o4
	wr	%g0,	0x80,	%asi
	lduba	[%l7 + 0x36] %asi,	%l1
	call	loop_248
	call	loop_249
	call	loop_250
	fmovse	%fcc2,	%f22,	%f15
loop_248:
	fble,a,pt	%fcc1,	loop_251
loop_249:
	fmovrdlz	%l4,	%f12,	%f0
loop_250:
	fcmpd	%fcc3,	%f8,	%f6
	call	loop_252
loop_251:
	movrlz	%g4,	%g3,	%o3
	nop
	setx	0x0A33,	%l0,	%o5
	sdivx	%o2,	%o5,	%l0
	fmul8x16al	%f12,	%f9,	%f24
loop_252:
	fmovdul	%fcc1,	%f30,	%f16
	wr	%g0,	0x10,	%asi
	lduha	[%l7 + 0x34] %asi,	%g5
	edge32n	%l5,	%l6,	%i0
	fnot2	%f18,	%f20
	fmovsa	%fcc1,	%f15,	%f20
	fcmped	%fcc1,	%f24,	%f4
	subccc	%o0,	0x1837,	%l2
	fmovdu	%fcc2,	%f12,	%f8
	call	loop_253
	fpack32	%f8,	%f28,	%f30

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	or	%i6,	%g6,	%i3
loop_253:
	fmovdleu	%icc,	%f10,	%f22
	call	loop_254
	fandnot1	%f10,	%f20,	%f24
	call	loop_255
	call	loop_256
loop_254:
	call	loop_257
	orn	%i2,	%o1,	%o7
loop_255:
	fmovrdlz	%g2,	%f2,	%f18
loop_256:
	bshuffle	%f4,	%f14,	%f12
loop_257:
	tge	%icc,	0x6
	fmovsneg	%xcc,	%f23,	%f5
	call	loop_258
	nop
	setx	loop_259,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x024100001406,	%l0,	%l1
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
	srax	%l3,	%i4,	%i1
	bg,a	%icc,	loop_260
loop_258:
	call	loop_261
loop_259:
	stw	%g1,	[%l7 + 0x3C]
	or	%g7,	%o4,	%o6
loop_260:
	fnot1s	%f10,	%f3
loop_261:
	sdiv	%l1,	0x186B,	%g4
	wr	%g3,	%l4,	%clear_softint
	nop
	setx	0x1A0F9EBA74197281,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	fsqrtd	%f24,	%f30
	call	loop_262
	te	%xcc,	0x2
	sll	%o2,	%o5,	%o3
	fmovdcc	%icc,	%f30,	%f8
loop_262:
	fbu,pn	%fcc3,	loop_263
	xor	%g5,	%l0,	%l6
	taddcctv	%l5,	%i0,	%l2
	flushw
loop_263:
	call	loop_264
	call	loop_265
	fmovsa	%fcc0,	%f23,	%f31
	srax	%i7,	0x10,	%o0
loop_264:
	fornot1	%f2,	%f4,	%f0
loop_265:
	rdpr	%gl,	%i6
	call	loop_266
	subcc	%g6,	%i5,	%i2
	subc	%o1,	0x1709,	%o7
	movule	%fcc2,	%g2,	%l3
loop_266:
	rd	%pc,	%i3
	call	loop_267
	fxors	%f5,	%f9,	%f2
	fexpand	%f24,	%f26
	rdhpr	%hpstate,	%i4
loop_267:
	call	loop_268
	call	loop_269
	array32	%i1,	%g1,	%o4
	call	loop_270
loop_268:
	nop
	fitos	%f9,	%f1
	fstox	%f1,	%f8
	fxtos	%f8,	%f24
loop_269:
	call	loop_271
	call	loop_272
loop_270:
	alignaddrl	%g7,	%o6,	%g4
	rd	%tick_cmpr,	%g3
loop_271:
	fxors	%f5,	%f7,	%f13
loop_272:
	fandnot2s	%f24,	%f19,	%f17
	membar	0x22
	call	loop_273
	nop
	setx	0x442C1EA0,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f13
	setx	0x8AFA417D,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f11
	fsubs	%f11,	%f13,	%f8
	rd	%y,	%l1
	fpadd16	%f20,	%f30,	%f2
loop_273:
	stbar
	call	loop_274
	call	loop_275
	tneg	%icc,	0x3
	movneg	%xcc,	0x07D,	%l4
loop_274:
	call	loop_276
loop_275:
	call	loop_277
	fornot1s	%f12,	%f13,	%f19
	call	loop_278
loop_276:
	movu	%fcc1,	%o5,	%o2
loop_277:
	call	loop_279
	fmovrslz	%g5,	%f27,	%f12
loop_278:
	call	loop_280
	tg	%icc,	0x0
loop_279:
	call	loop_281
	fmovrdne	%l0,	%f2,	%f12
loop_280:
	flushw
	andncc	%o3,	0x0B37,	%l5
loop_281:
	movrgz	%i0,	%l6,	%i7
	call	loop_282
	call	loop_283
	fmovrdne	%o0,	%f28,	%f8
	fmovsne	%icc,	%f10,	%f29
loop_282:
	srl	%i6,	0x03,	%g6
loop_283:
	nop
	fitod	%f12,	%f24
	fxnors	%f22,	%f25,	%f17
	tle	%icc,	0x3
	movg	%fcc2,	%i5,	%i2
	rd	%asi,	%l2
	call	loop_284
	movcc	%xcc,	%o1,	%g2
	call	loop_285
	alignaddrl	%o7,	%l3,	%i4
loop_284:
	fbn,a,pn	%fcc2,	loop_286
	call	loop_287
loop_285:
	call	loop_288
	smul	%i3,	%g1,	%o4
loop_286:
	call	loop_289
loop_287:
	call	loop_290
loop_288:
	fmovrsgez	%g7,	%f21,	%f6
	movug	%fcc3,	0x094,	%i1
loop_289:
	nop
	fitod	%f2,	%f30
loop_290:
	fmovdge	%icc,	%f30,	%f18
	tne	%icc,	0x1
	wr	%g4,	0x1D77,	%set_softint
	call	loop_291
	call	loop_292
	movuge	%fcc3,	%o6,	%g3
	call	loop_293
loop_291:
	nop
	setx	0x3B4CE0C17A95E9DE,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0xEC323017EFC2EB0F,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	fdivd	%f12,	%f26,	%f10
loop_292:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x7FE, 	%hsys_tick_cmpr
	call	loop_294
loop_293:
	fmovsuge	%fcc2,	%f0,	%f1
	fandnot1	%f10,	%f6,	%f14
	nop
	fitos	%f11,	%f12
	fstod	%f12,	%f22
loop_294:
	fmovdneg	%xcc,	%f22,	%f2
	fmovdul	%fcc2,	%f12,	%f0
	sllx	%l4,	0x13,	%o5
	fblg,a	%fcc2,	loop_295
	movvs	%icc,	0x5EE,	%g5
	rdhpr	%htba,	%o2
	flush	%l7 + 0x18
loop_295:
	call	loop_296
	popc	0x06AB,	%o3
loop_296:
	nop

	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 4:
!
!	Type l   	: 7
!	Type a   	: 13
!	Type x   	: 3
!	Type cti   	: 61
!	Type f   	: 55
!	Type i   	: 61
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
	set	0xF,	%g1
	set	0xA,	%g2
	set	0x0,	%g3
	set	0x5,	%g4
	set	0xC,	%g5
	set	0x3,	%g6
	set	0x9,	%g7
	!# Input registers
	set	-0xF,	%i0
	set	-0x2,	%i1
	set	-0xD,	%i2
	set	-0x1,	%i3
	set	-0x5,	%i4
	set	-0xA,	%i5
	set	-0x5,	%i6
	set	-0x4,	%i7
	!# Local registers
	set	0x6F7A40CD,	%l0
	set	0x24A02233,	%l1
	set	0x5F1F2D30,	%l2
	set	0x1A803F27,	%l3
	set	0x411D3EA6,	%l4
	set	0x3BDCB6C8,	%l5
	set	0x42F8B3EC,	%l6
	!# Output registers
	set	0x01B3,	%o0
	set	0x0103,	%o1
	set	0x1AC3,	%o2
	set	-0x0D98,	%o3
	set	-0x1C38,	%o4
	set	0x04E5,	%o5
	set	-0x141E,	%o6
	set	0x1194,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0xCA69A1BAA097B7E4)
	INIT_TH_FP_REG(%l7,%f2,0xA5930CCD12ECD1A8)
	INIT_TH_FP_REG(%l7,%f4,0x5C5D16CB6A7525A5)
	INIT_TH_FP_REG(%l7,%f6,0xCB01F7A448011172)
	INIT_TH_FP_REG(%l7,%f8,0x715D781124CD36A4)
	INIT_TH_FP_REG(%l7,%f10,0xA668DF89B14C9E1A)
	INIT_TH_FP_REG(%l7,%f12,0xEA53BB1C867A6474)
	INIT_TH_FP_REG(%l7,%f14,0xCC22F91C5A384F51)
	INIT_TH_FP_REG(%l7,%f16,0x7B089FEA34E40332)
	INIT_TH_FP_REG(%l7,%f18,0x51E4631645A339E9)
	INIT_TH_FP_REG(%l7,%f20,0x762301810F8A696E)
	INIT_TH_FP_REG(%l7,%f22,0x3FFBCBF7985D7B74)
	INIT_TH_FP_REG(%l7,%f24,0x64762B99AC9EE44B)
	INIT_TH_FP_REG(%l7,%f26,0x6419ABE504DC3F27)
	INIT_TH_FP_REG(%l7,%f28,0xBB5E2B6F06B5CAF7)
	INIT_TH_FP_REG(%l7,%f30,0x4A9512DC19287841)

	!# Execute Main Diag ..

	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	andncc	%l5,	0x0CC0,	%l0
	array16	%i0,	%l6,	%i7
	call	loop_297
	call	loop_298
	call	loop_299
	srl	%o0,	%i6,	%i5
loop_297:
	fmovrsgz	%i2,	%f23,	%f9
loop_298:
	call	loop_300
loop_299:
	smulcc	%g6,	0x0EDF,	%l2
	call	loop_301
	te	%xcc,	0x4
loop_300:
	bvs	%xcc,	loop_302
	edge8l	%o1,	%g2,	%l3
loop_301:
	and	%i4,	%o7,	%i3
	fmovsn	%icc,	%f15,	%f12
loop_302:
	rd	%y,	%g1
	fpadd16s	%f24,	%f11,	%f19
	call	loop_303
	sra	%g7,	0x0C,	%i1
	movl	%fcc3,	%g4,	%o6
	call	loop_304
loop_303:
	mulscc	%o4,	%l1,	%g3
	srl	%o5,	0x09,	%g5
	wrpr 	%g0, 	0x2, 	%gl
loop_304:
	fmovrdgz	%o3,	%f24,	%f4
	edge16	%o2,	%l5,	%l0
	call	loop_305
	taddcctv	%i0,	%i7,	%o0
	xnorcc	%i6,	0x173A,	%i5
	call	loop_306
loop_305:
	movneg	%icc,	0x10E,	%l6
	call	loop_307
	call	loop_308
loop_306:
	fmovrdlez	%i2,	%f8,	%f8
	fmovsg	%xcc,	%f8,	%f29
loop_307:
	nop
	setx	0x1019,	%l0,	%o1
	sdiv	%g6,	%o1,	%l2
loop_308:
	rdpr	%pil,	%g2
	fmovspos	%icc,	%f27,	%f18
	fmovrsne	%l3,	%f14,	%f29
	call	loop_309
	call	loop_310
	edge16	%i4,	%i3,	%g1
	orcc	%g7,	%i1,	%o7
loop_309:
	nop
	set	0x30, %i6
	stx	%g4,	[%l7 + %i6]
loop_310:
	call	loop_311
	wr 	%g0, 	0x6, 	%fprs
	rdpr	%tba,	%g3
	edge32l	%o5,	%l1,	%g5
loop_311:
	fands	%f30,	%f3,	%f29
	fmovrsne	%l4,	%f9,	%f5
	set	0x6A, %l6
	stba	%o3,	[%l7 + %l6] 0x0c
	wr	%o2,	0x1375,	%sys_tick
	call	loop_312
	movre	%l5,	%i0,	%i7
	call	loop_313
	movlg	%fcc3,	0x1CB,	%o0
loop_312:
	call	loop_314
	call	loop_315
loop_313:
	fsrc1	%f6,	%f10
	fmovsule	%fcc0,	%f15,	%f2
loop_314:
	nop
	wr	%g0,	0x18,	%asi
	stba	%l0,	[%l7 + 0x43] %asi
loop_315:
	call	loop_316
	xnorcc	%i5,	%l6,	%i6
	edge32l	%i2,	%o1,	%g6
	call	loop_317
loop_316:
	ba	%icc,	loop_318
	sra	%g2,	0x0B,	%l2
	mova	%fcc1,	%i4,	%l3
loop_317:
	popc	0x0C29,	%i3
loop_318:
	call	loop_319
	smulcc	%g1,	0x0EBD,	%g7
	rdpr	%pil,	%o7
	call	loop_320
loop_319:
	fnot1s	%f23,	%f19
	siam	0x6
	orcc	%i1,	0x0845,	%g4
loop_320:
	rd	%pc,	%o6
	fmovdneg	%xcc,	%f20,	%f14
	fxors	%f6,	%f15,	%f30
	sir	0x13C7
	movug	%fcc1,	%g3,	%o5
	move	%icc,	0x19A,	%o4
	wr	%l1,	%l4,	%ccr
	fmul8x16al	%f4,	%f21,	%f14
	fnegs	%f3,	%f17
	call	loop_321
	call	loop_322
	flush	%l7 + 0x1C
	fcmpne16	%f24,	%f0,	%g5
loop_321:
	fcmpne32	%f10,	%f30,	%o2
loop_322:
	umulcc	%o3,	0x1C67,	%l5
	nop
	fitod	%f8,	%f26
	fdtox	%f26,	%f24
	bl,pt	%icc,	loop_323
	fornot1	%f14,	%f6,	%f12
	nop
	setx	0xF74D2E3D,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f7
	setx	0x345505B5,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f19
	fdivs	%f19,	%f7,	%f14
	call	loop_324
loop_323:
	fand	%f30,	%f30,	%f10
	call	loop_325
	bne	%xcc,	loop_326
loop_324:
	nop
	fitos	%f8,	%f13
	fstox	%f13,	%f4
	call	loop_327
loop_325:
	fandnot1s	%f24,	%f21,	%f2
loop_326:
	fpsub16	%f2,	%f2,	%f20
	call	loop_328
loop_327:
	call	loop_329
	srax	%i0,	%i7,	%l0
	call	loop_330
loop_328:
	fmovdue	%fcc1,	%f8,	%f18
loop_329:
	fmovsle	%fcc1,	%f16,	%f18
	rdhpr	%hpstate,	%i5
loop_330:
	rdpr	%cleanwin,	%l6
	movpos	%icc,	0x6D8,	%i6
	edge32n	%i2,	%o1,	%o0
	orncc	%g6,	0x0912,	%g2
	wrpr	%l2,	0x16BA,	%pil
	edge16ln	%l3,	%i4,	%i3
	call	loop_331
	tsubcctv	%g7,	%g1,	%o7
	call	loop_332
	ldd	[%l7 + 0x68],	%f20
loop_331:
	movrlez	%g4,	%i1,	%g3
	call	loop_333
loop_332:
	te	%xcc,	0x2
	call	loop_334
	fcmple32	%f28,	%f0,	%o6
loop_333:
	fnegd	%f2,	%f4
	call	loop_335
loop_334:
	call	loop_336
	rdpr	%pil,	%o4
	nop
	set	0x75, %i5
	ldstub	[%l7 + %i5],	%o5
loop_335:
	sethi	0x1B12,	%l1
loop_336:
	nop
	setx	0x5DF54848,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f6
	fsqrts	%f6,	%f20
	rdhpr	%hsys_tick_cmpr,	%g5
	brlez	%l4,	loop_337
	fmovdgu	%xcc,	%f10,	%f24
	subcc	%o2,	%o3,	%i0
	movrlez	%i7,	%l5,	%l0
loop_337:
	fands	%f16,	%f3,	%f20
	fmovdu	%fcc0,	%f20,	%f26
	call	loop_338
	fmovsgu	%xcc,	%f16,	%f3
	movge	%xcc,	0x758,	%i5
	fmovdue	%fcc2,	%f14,	%f6
loop_338:
	movvc	%icc,	%l6,	%i2
	subcc	%i6,	%o1,	%o0
	bvc	%xcc,	loop_339
	fcmpgt32	%f8,	%f6,	%g6
	nop
	setx	0xAA7F1AB219E9EEAB,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0x5D327B9497A1D9CE,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	fsubd	%f6,	%f12,	%f20
	fpmerge	%f18,	%f24,	%f2
loop_339:
	fpack16	%f16,	%f18
	bmask	%l2,	%l3,	%i4
	wr	%i3,	0x1733,	%clear_softint
	call	loop_340
	fmovdleu	%xcc,	%f12,	%f12
	call	loop_341
	call	loop_342
loop_340:
	nop
	setx	0xF3CC55D,	%l0,	%l6
	st	%l6,	[%l7 + 0x1C]
	ld	[%l7 + 0x1C],	%fsr
	fpsub16	%f10,	%f4,	%f24
loop_341:
	fabss	%f10,	%f6
loop_342:
	call	loop_343
	nop
	fitod	%f0,	%f20
	fdtoi	%f20,	%f2
	call	loop_344
	edge16ln	%g7,	%g1,	%o7
loop_343:
	call	loop_345
	tvc	%icc,	0x6
loop_344:
	call	loop_346
	bn,a,pt	%xcc,	loop_347
loop_345:
	fmovrdgez	%g4,	%f10,	%f22
	tvc	%icc,	0x0
loop_346:
	edge32n	%g2,	%g3,	%o6
loop_347:
	call	loop_348
	call	loop_349
	movg	%icc,	%i1,	%o5
	subcc	%l1,	%o4,	%l4
loop_348:
	fcmpeq32	%f26,	%f26,	%o2
loop_349:
	call	loop_350
	tn	%icc,	0x2
	flushw
	wrpr	%o3,	0x05D7,	%tick
loop_350:
	fmovsu	%fcc0,	%f2,	%f0
	call	loop_351
	call	loop_352
	fmovdvs	%icc,	%f4,	%f0
	swap	[%l7 + 0x30],	%i0
loop_351:
	fpadd32	%f8,	%f26,	%f2
loop_352:
	rdpr	%cwp,	%i7
	call	loop_353
	call	loop_354
	call	loop_355
	add	%l5,	0x0CBD,	%g5
loop_353:
	nop
	set	0x40, %o4
	stwa	%l0,	[%l7 + %o4] 0x22
	membar	#Sync
loop_354:
	xor	%l6,	%i2,	%i6
loop_355:
	call	loop_356
	fmovdue	%fcc3,	%f0,	%f12
	xnorcc	%i5,	%o1,	%o0
	nop
	set	0x6B, %o1
	stb	%l2,	[%l7 + %o1]
loop_356:
	nop

	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 5:
!
!	Type l   	: 10
!	Type a   	: 17
!	Type x   	: 3
!	Type cti   	: 60
!	Type f   	: 51
!	Type i   	: 59
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
	set	0xB,	%g1
	set	0xE,	%g2
	set	0x3,	%g3
	set	0x7,	%g4
	set	0xC,	%g5
	set	0xF,	%g6
	set	0x8,	%g7
	!# Input registers
	set	-0x3,	%i0
	set	-0xB,	%i1
	set	-0x1,	%i2
	set	-0x0,	%i3
	set	-0x6,	%i4
	set	-0xF,	%i5
	set	-0x6,	%i6
	set	-0xA,	%i7
	!# Local registers
	set	0x28443EB2,	%l0
	set	0x7C827C65,	%l1
	set	0x19BF3C78,	%l2
	set	0x099E4B9A,	%l3
	set	0x79D655B2,	%l4
	set	0x4C9C0DBB,	%l5
	set	0x6ED8A5CC,	%l6
	!# Output registers
	set	-0x0CF5,	%o0
	set	-0x095E,	%o1
	set	-0x111D,	%o2
	set	0x1EF2,	%o3
	set	-0x1273,	%o4
	set	-0x09CA,	%o5
	set	-0x008F,	%o6
	set	-0x1722,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0xCA69A1BAA097B7E4)
	INIT_TH_FP_REG(%l7,%f2,0xA5930CCD12ECD1A8)
	INIT_TH_FP_REG(%l7,%f4,0x5C5D16CB6A7525A5)
	INIT_TH_FP_REG(%l7,%f6,0xCB01F7A448011172)
	INIT_TH_FP_REG(%l7,%f8,0x715D781124CD36A4)
	INIT_TH_FP_REG(%l7,%f10,0xA668DF89B14C9E1A)
	INIT_TH_FP_REG(%l7,%f12,0xEA53BB1C867A6474)
	INIT_TH_FP_REG(%l7,%f14,0xCC22F91C5A384F51)
	INIT_TH_FP_REG(%l7,%f16,0x7B089FEA34E40332)
	INIT_TH_FP_REG(%l7,%f18,0x51E4631645A339E9)
	INIT_TH_FP_REG(%l7,%f20,0x762301810F8A696E)
	INIT_TH_FP_REG(%l7,%f22,0x3FFBCBF7985D7B74)
	INIT_TH_FP_REG(%l7,%f24,0x64762B99AC9EE44B)
	INIT_TH_FP_REG(%l7,%f26,0x6419ABE504DC3F27)
	INIT_TH_FP_REG(%l7,%f28,0xBB5E2B6F06B5CAF7)
	INIT_TH_FP_REG(%l7,%f30,0x4A9512DC19287841)

	!# Execute Main Diag ..

	nop
	fitos	%f5,	%f3
	fstox	%f3,	%f0
	fxtos	%f0,	%f18
	edge8ln	%l3,	%g6,	%i3
	fzero	%f26
	tleu	%icc,	0x0
	movge	%xcc,	0x065,	%i4
	array8	%g7,	%o7,	%g1
	bvs,a	%icc,	loop_357
	fmovrslez	%g2,	%f25,	%f26
	addccc	%g3,	%o6,	%g4
	tsubcc	%i1,	0x193D,	%l1
loop_357:
	movule	%fcc1,	0x1E2,	%o5
	rdhpr	%hintp,	%l4
	call	loop_358
	fmovrdlez	%o2,	%f0,	%f8
	fmovrdgz	%o3,	%f24,	%f30
	fmovrdlez	%i0,	%f24,	%f26
loop_358:
	call	loop_359
	fmovsneg	%xcc,	%f21,	%f17
	fmovsne	%xcc,	%f0,	%f11
	fcmpgt32	%f18,	%f6,	%i7
loop_359:
	fnot1	%f30,	%f8
	wr	%l5,	0x11A6,	%sys_tick
	call	loop_360
	fmuld8sux16	%f28,	%f11,	%f30
	call	loop_361
	std	%f10,	[%l7 + 0x48]
loop_360:
	fpsub32s	%f3,	%f28,	%f5
	fornot1s	%f22,	%f11,	%f26
loop_361:
	fpadd16s	%f8,	%f31,	%f16
	nop
	set	0x30, %g5
	prefetch	[%l7 + %g5],	 3
	fmovrdgz	%g5,	%f28,	%f22
	fcmpgt16	%f12,	%f18,	%o4
	fsrc1	%f16,	%f14
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	siam	0x0
	rdpr	%tba,	%l6
	tvs	%icc,	0x0
	brz,a	%l0,	loop_362
	array8	%i2,	%i6,	%i5
	call	loop_363
	call	loop_364
loop_362:
	call	loop_365
	fble	%fcc1,	loop_366
loop_363:
	fnot1	%f6,	%f14
loop_364:
	call	loop_367
loop_365:
	rdhpr	%hpstate,	%o1
loop_366:
	fornot2s	%f13,	%f12,	%f5
	orncc	%o0,	%l2,	%l3
loop_367:
	fmovda	%xcc,	%f12,	%f28
	wr	%g0,	0x81,	%asi
	ldsba	[%l7 + 0x61] %asi,	%i3
	call	loop_368
	call	loop_369
	fmovde	%fcc0,	%f30,	%f28
	call	loop_370
loop_368:
	subcc	%g6,	%i4,	%g7
loop_369:
	bg,a,pt	%xcc,	loop_371
	call	loop_372
loop_370:
	fmul8x16au	%f11,	%f16,	%f26
	call	loop_373
loop_371:
	call	loop_374
loop_372:
	nop
	set	0x40, %o0
	ldsh	[%l7 + %o0],	%o7
	udiv	%g1,	0x15C6,	%g3
loop_373:
	fmovslg	%fcc0,	%f9,	%f19
loop_374:
	rd	%pc,	%g2
	addcc	%g4,	%o6,	%i1
	call	loop_375
	nop
	set	0x20, %l0
	stx	%fsr,	[%l7 + %l0]
	fsrc2s	%f2,	%f25
	call	loop_376
loop_375:
	for	%f26,	%f24,	%f0
	nop
	fitos	%f27,	%f23
	addccc	%l1,	0x121B,	%o5
loop_376:
	edge32l	%l4,	%o3,	%i0
	wr	%g0,	0x81,	%asi
	stwa	%o2,	[%l7 + 0x78] %asi
	tneg	%icc,	0x1
	edge16ln	%l5,	%i7,	%g5
	call	loop_377
	call	loop_378
	fmovsug	%fcc1,	%f18,	%f19
	fpadd32s	%f10,	%f28,	%f21
loop_377:
	nop
	wr	%g0,	0x11,	%asi
	lda	[%l7 + 0x4C] %asi,	%f0
loop_378:
	call	loop_379
	fcmple16	%f2,	%f16,	%l6
	nop
	setx	0x2987F4D4AB45B9C6,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	fsqrtd	%f26,	%f24
	call	loop_380
loop_379:
	call	loop_381
	fcmpes	%fcc0,	%f26,	%f24
	call	loop_382
loop_380:
	fands	%f0,	%f4,	%f30
loop_381:
	call	loop_383
	fcmpgt32	%f30,	%f6,	%l0
loop_382:
	edge16n	%o4,	%i6,	%i5
	fmovdul	%fcc2,	%f22,	%f16
loop_383:
	edge8	%i2,	%o0,	%o1
	srlx	%l2,	0x01,	%l3
	xorcc	%g6,	%i3,	%g7
	call	loop_384
	xor	%i4,	0x0178,	%o7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fmovsge	%xcc,	%f17,	%f11
loop_384:
	rd	%y,	%g4
	xnorcc	%o6,	%i1,	%g2
	nop
	setx	loop_385,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x011100001401,	%l0,	%l1
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
	subcc	%l1,	%o5,	%o3
	movg	%fcc3,	%i0,	%o2
	movule	%fcc2,	0x549,	%l4
loop_385:
	fcmpgt32	%f30,	%f12,	%i7
	call	loop_386
	taddcc	%l5,	0x07BC,	%g5
	movrlz	%l0,	%l6,	%o4
	call	loop_387
loop_386:
	nop
	fitod	%f10,	%f22
	fdtox	%f22,	%f4
	tcs	%xcc,	0x3
	nop
	setx	0x3FAC914D3FD9A05C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0xCCE077A0594A9564,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fsubd	%f0,	%f22,	%f24
loop_387:
	nop
	fitos	%f31,	%f17
	sir	0x13A5
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	fbul,a	%fcc0,	loop_388
	fpack16	%f2,	%f24
	call	loop_389
	call	loop_390
loop_388:
	fpsub32s	%f2,	%f8,	%f30
	call	loop_391
loop_389:
	movcc	%xcc,	%i6,	%i5
loop_390:
	fmovrdgz	%o0,	%f22,	%f20
	wr	%g0,	0x80,	%asi
	lda	[%l7 + 0x40] %asi,	%f13
loop_391:
	call	loop_392
	xor	%i2,	0x019B,	%o1
	tgu	%xcc,	0x2
	fmovslg	%fcc3,	%f19,	%f16
loop_392:
	sllx	%l2,	%g6,	%l3
	fmovsul	%fcc2,	%f23,	%f3
	taddcctv	%i3,	%i4,	%o7
	brz,pn	%g3,	loop_393
	call	loop_394
	call	loop_395
	edge32n	%g1,	%g4,	%g7
loop_393:
	te	%icc,	0x5
loop_394:
	call	loop_396
loop_395:
	wrpr	%i1,	0x0EE7,	%tick
	fmovsug	%fcc2,	%f15,	%f1
	call	loop_397
loop_396:
	array16	%g2,	%l1,	%o5
	fmovduge	%fcc2,	%f8,	%f0
	tn	%xcc,	0x0
loop_397:
	fmovdlg	%fcc1,	%f6,	%f24
	set	0x48, %g6
	lduha	[%l7 + %g6] 0x89,	%o3
	movneg	%icc,	%i0,	%o2
	edge16ln	%o6,	%l4,	%i7
	call	loop_398
	membar	0x46
	mulx	%l5,	0x0C0B,	%l0
	wrpr	%g5,	0x17B1,	%cwp
loop_398:
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	fmovslg	%fcc1,	%f30,	%f5
	nop
	set	0x08, %i2
	ldsh	[%l7 + %i2],	%l6
	fmovsue	%fcc1,	%f0,	%f30
	call	loop_399
	fmul8x16	%f26,	%f18,	%f30
	fxor	%f10,	%f6,	%f6
	tneg	%xcc,	0x6
loop_399:
	call	loop_400
	nop
	setx	0x0026,	%l0,	%o4
	udivcc	%i6,	%o4,	%o0
	fcmpgt16	%f4,	%f22,	%i5
	fmovdu	%fcc1,	%f22,	%f2
loop_400:
	movrlez	%o1,	%l2,	%g6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xB5E, 	%hsys_tick_cmpr
	fmovrde	%i4,	%f20,	%f6
	edge8ln	%i3,	%o7,	%g3
	and	%g4,	0x1C4C,	%g1
	nop
	fitos	%f11,	%f23
	fstox	%f23,	%f30
	fxtos	%f30,	%f5
	call	loop_401
	movule	%fcc2,	0x4F1,	%g7
	nop
	setx	0xB6AC3EAE,	%l0,	%l6
	st	%l6,	[%l7 + 0x24]
	ld	[%l7 + 0x24],	%fsr
	orcc	%g2,	%l1,	%o5
loop_401:
	subc	%i1,	0x17C6,	%o3
	nop
	set	0x68, %i3
	ldsw	[%l7 + %i3],	%o2
	mulscc	%o6,	%i0,	%i7
	move	%icc,	0x644,	%l5
	call	loop_402
	call	loop_403
	movrgz	%l0,	0x336,	%g5
	call	loop_404
loop_402:
	call	loop_405
loop_403:
	std	%f10,	[%l7 + 0x18]
	call	loop_406
loop_404:
	call	loop_407
loop_405:
	movne	%xcc,	%l4,	%i6
	call	loop_408
loop_406:
	call	loop_409
loop_407:
	call	loop_410
	subc	%o4,	0x01F4,	%l6
loop_408:
	call	loop_411
loop_409:
	brlez,a,pt	%i5,	loop_412
loop_410:
	fnand	%f30,	%f30,	%f26
loop_411:
	nop

loop_412:
	nop

	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 6:
!
!	Type l   	: 13
!	Type a   	: 10
!	Type x   	: 5
!	Type cti   	: 56
!	Type f   	: 57
!	Type i   	: 59
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
	set	0xF,	%g1
	set	0x5,	%g2
	set	0x4,	%g3
	set	0x9,	%g4
	set	0xB,	%g5
	set	0xD,	%g6
	set	0xB,	%g7
	!# Input registers
	set	-0x5,	%i0
	set	-0xE,	%i1
	set	-0xA,	%i2
	set	-0xA,	%i3
	set	-0x6,	%i4
	set	-0xB,	%i5
	set	-0x6,	%i6
	set	-0x4,	%i7
	!# Local registers
	set	0x479865AC,	%l0
	set	0x7541CBEA,	%l1
	set	0x1746A005,	%l2
	set	0x6A87DA42,	%l3
	set	0x19776645,	%l4
	set	0x2A0283D7,	%l5
	set	0x16C5249A,	%l6
	!# Output registers
	set	-0x1432,	%o0
	set	-0x1967,	%o1
	set	-0x0091,	%o2
	set	0x0B03,	%o3
	set	-0x14CC,	%o4
	set	0x1327,	%o5
	set	-0x0D2A,	%o6
	set	0x1778,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0xCA69A1BAA097B7E4)
	INIT_TH_FP_REG(%l7,%f2,0xA5930CCD12ECD1A8)
	INIT_TH_FP_REG(%l7,%f4,0x5C5D16CB6A7525A5)
	INIT_TH_FP_REG(%l7,%f6,0xCB01F7A448011172)
	INIT_TH_FP_REG(%l7,%f8,0x715D781124CD36A4)
	INIT_TH_FP_REG(%l7,%f10,0xA668DF89B14C9E1A)
	INIT_TH_FP_REG(%l7,%f12,0xEA53BB1C867A6474)
	INIT_TH_FP_REG(%l7,%f14,0xCC22F91C5A384F51)
	INIT_TH_FP_REG(%l7,%f16,0x7B089FEA34E40332)
	INIT_TH_FP_REG(%l7,%f18,0x51E4631645A339E9)
	INIT_TH_FP_REG(%l7,%f20,0x762301810F8A696E)
	INIT_TH_FP_REG(%l7,%f22,0x3FFBCBF7985D7B74)
	INIT_TH_FP_REG(%l7,%f24,0x64762B99AC9EE44B)
	INIT_TH_FP_REG(%l7,%f26,0x6419ABE504DC3F27)
	INIT_TH_FP_REG(%l7,%f28,0xBB5E2B6F06B5CAF7)
	INIT_TH_FP_REG(%l7,%f30,0x4A9512DC19287841)

	!# Execute Main Diag ..

	fpackfix	%f22,	%f7
	nop
	setx	0x71F258EE,	%l0,	%l6
	st	%l6,	[%l7 + 0x78]
	ld	[%l7 + 0x78],	%fsr
	subc	%o0,	%l2,	%o1
	movrne	%g6,	%l3,	%i4
	fmovsue	%fcc1,	%f2,	%f8

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fmovsu	%fcc2,	%f20,	%f1
	nop
	fitos	%f1,	%f23
	fstod	%f23,	%f24
	fcmpeq16	%f24,	%f14,	%g3
	brnz,a	%g4,	loop_413
	fsrc1s	%f9,	%f3
	call	loop_414
	call	loop_415
loop_413:
	call	loop_416
	bl,a	%icc,	loop_417
loop_414:
	nop
	fitos	%f7,	%f21
	fstoi	%f21,	%f10
loop_415:
	nop
	setx	0xA642D760,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f23
	setx	0x359CB13A,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f8
	fdivs	%f8,	%f23,	%f6
loop_416:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_417:
	movre	%g1,	%g7,	%g2
	te	%icc,	0x6
	xnorcc	%l1,	0x1050,	%i1
	rdhpr	%hsys_tick_cmpr,	%o3
	movul	%fcc2,	%o2,	%o6
	wr	%i0,	%o5,	%pic
	call	loop_418
	wrpr	%i7,	0x0F05,	%cwp
	call	loop_419
	tleu	%icc,	0x2
loop_418:
	addccc	%l5,	0x00FC,	%g5
	sub	%l4,	%l0,	%i6
loop_419:
	fpadd32s	%f28,	%f30,	%f8
	fmovsvs	%icc,	%f13,	%f2
	fmovsne	%fcc2,	%f21,	%f17
	call	loop_420
	movgu	%xcc,	0x2C8,	%l6
	call	loop_421
	rdhpr	%hintp,	%i5
loop_420:
	fcmpgt32	%f20,	%f16,	%o0
	fmovsge	%icc,	%f25,	%f3
loop_421:
	fcmpeq16	%f28,	%f14,	%o4
	fmovsuge	%fcc1,	%f29,	%f14
	addccc	%o1,	%l2,	%g6
	movlg	%fcc1,	%i4,	%i2
	array16	%i3,	%l3,	%g4
	call	loop_422
	call	loop_423
	call	loop_424
	call	loop_425
loop_422:
	stw	%g3,	[%l7 + 0x38]
loop_423:
	fpackfix	%f4,	%f11
loop_424:
	nop
	setx	0x1024,	%l0,	%o7
	udiv	%g1,	%o7,	%g2
loop_425:
	movrlez	%g7,	0x342,	%i1
	call	loop_426
	fmovsgu	%xcc,	%f10,	%f2
	fmovsa	%fcc1,	%f7,	%f4
	xnorcc	%l1,	0x1074,	%o3
loop_426:
	fmuld8ulx16	%f5,	%f4,	%f2
	subcc	%o6,	%o2,	%i0
	rdpr	%cansave,	%o5
	call	loop_427
	fmul8x16	%f25,	%f14,	%f18
	fpack32	%f18,	%f16,	%f18
	call	loop_428
loop_427:
	call	loop_429
	st	%f9,	[%l7 + 0x24]
	fpack32	%f28,	%f26,	%f10
loop_428:
	fpadd16	%f16,	%f12,	%f28
loop_429:
	rd	%sys_tick_cmpr,	%i7
	call	loop_430
	fmovsa	%xcc,	%f18,	%f27
	set	0x18, %i4
	stwa	%g5,	[%l7 + %i4] 0xe3
	membar	#Sync
loop_430:
	call	loop_431
	call	loop_432
	fmovsgu	%icc,	%f3,	%f20
	call	loop_433
loop_431:
	fone	%f22
loop_432:
	call	loop_434
	call	loop_435
loop_433:
	rdpr	%gl,	%l5
	addccc	%l4,	%i6,	%l6
loop_434:
	fmul8x16	%f27,	%f2,	%f30
loop_435:
	fbg,pn	%fcc0,	loop_436
	nop
	setx	0xACFC7B6E626B5296,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0x2E188D8F,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	fsmuld	%f22,	%f4,	%f14
	call	loop_437
	call	loop_438
loop_436:
	fmovrdlez	%i5,	%f0,	%f4
	pdist	%f6,	%f0,	%f20
loop_437:
	call	loop_439
loop_438:
	call	loop_440
	fnot1s	%f7,	%f0
	xnor	%o0,	%o4,	%l0
loop_439:
	nop
	set	0x36, %l3
	ldub	[%l7 + %l3],	%o1
loop_440:
	fabss	%f5,	%f29
	sir	0x0399
	mulscc	%g6,	0x1D38,	%l2
	ble,a	%xcc,	loop_441
	fpadd32	%f4,	%f8,	%f14
	movn	%fcc2,	0x0AF,	%i2
	wr	%g0,	0x50,	%asi
	ldxa	[%g0 + 0x30] %asi,	%i3
loop_441:
	fbe,pt	%fcc1,	loop_442
	fnands	%f25,	%f12,	%f3
	nop
	set	0x20, %l2
	ldsb	[%l7 + %l2],	%i4
	ba	%icc,	loop_443
loop_442:
	fpadd32	%f30,	%f0,	%f26
	fcmpeq16	%f20,	%f6,	%l3
	fmovdl	%fcc0,	%f20,	%f28
loop_443:
	call	loop_444
	fmovsvs	%icc,	%f24,	%f13
	fnegs	%f6,	%f25
	fnot1	%f30,	%f8
loop_444:
	call	loop_445
	ble,a	%icc,	loop_446
	faligndata	%f28,	%f28,	%f2
	call	loop_447
loop_445:
	fmovdule	%fcc3,	%f30,	%f22
loop_446:
	fmovdul	%fcc2,	%f22,	%f30
	call	loop_448
loop_447:
	fmovsule	%fcc2,	%f31,	%f17
	orncc	%g3,	0x123F,	%g1
	bmask	%o7,	%g2,	%g4
loop_448:
	fcmple32	%f18,	%f0,	%i1
	fmovsge	%xcc,	%f19,	%f31
	movle	%xcc,	0x26C,	%l1
	fnegd	%f30,	%f22
	call	loop_449
	call	loop_450
	call	loop_451
	fcmple32	%f8,	%f14,	%o3
loop_449:
	bvs	%xcc,	loop_452
loop_450:
	srl	%g7,	%o2,	%o6
loop_451:
	movpos	%xcc,	0x128,	%o5
	fmovsug	%fcc1,	%f0,	%f17
loop_452:
	fnands	%f6,	%f2,	%f5
	call	loop_453
	call	loop_454
	fmovsn	%fcc0,	%f8,	%f4
	call	loop_455
loop_453:
	call	loop_456
loop_454:
	tvs	%icc,	0x2
	call	loop_457
loop_455:
	udivx	%i7,	0x0058,	%i0
loop_456:
	fcmpgt32	%f14,	%f20,	%l5
	fxnor	%f20,	%f22,	%f14
loop_457:
	nop
	setx loop_458, %l0, %l1
	jmpl %l1, %g5
	call	loop_459
	sethi	0x154D,	%i6
	mulscc	%l4,	0x18CD,	%l6
loop_458:
	smulcc	%i5,	0x1AC8,	%o0
loop_459:
	bpos	%xcc,	loop_460
	brlz,a	%o4,	loop_461
	call	loop_462
	fmovso	%fcc2,	%f22,	%f12
loop_460:
	srax	%o1,	%g6,	%l0
loop_461:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xA73, 	%hsys_tick_cmpr
loop_462:
	call	loop_463
	call	loop_464
	rdhpr	%hsys_tick_cmpr,	%l2
	flushw
loop_463:
	nop
	fitos	%f8,	%f25
	fstox	%f25,	%f24
loop_464:
	fmovrslz	%i4,	%f13,	%f16
	xnorcc	%g3,	0x14CE,	%l3
	call	loop_465
	call	loop_466
	call	loop_467
	tge	%xcc,	0x6
loop_465:
	nop
	set	0x7C, %o7
	swapa	[%l7 + %o7] 0x81,	%o7
loop_466:
	edge16ln	%g2,	%g1,	%g4
loop_467:
	edge32l	%l1,	%i1,	%g7
	call	loop_468
	fmovda	%xcc,	%f4,	%f22
	edge16ln	%o3,	%o6,	%o2
	nop
	setx	0xE5E8FBBB,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f17
	setx	0x24B6AB7D,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f4
	fmuls	%f4,	%f17,	%f25
loop_468:
	call	loop_469
	fsrc2	%f28,	%f26
	call	loop_470
	fnot1s	%f18,	%f29
loop_469:
	movue	%fcc0,	0x26D,	%i7
	fmovdne	%xcc,	%f22,	%f4
loop_470:
	mulscc	%i0,	%o5,	%l5
	call	loop_471
	fbl,a	%fcc3,	loop_472
	call	loop_473
	call	loop_474
loop_471:
	add	%i6,	0x0587,	%l4
loop_472:
	call	loop_475
loop_473:
	fcmpgt16	%f24,	%f2,	%g5
loop_474:
	call	loop_476
	wr	%l6,	%i5,	%pic
loop_475:
	fpackfix	%f26,	%f7
	fmovdlg	%fcc0,	%f0,	%f8
loop_476:
	fbne,a	%fcc1,	loop_477
	nop
	setx	0xE67F7545,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f19
	fsqrts	%f19,	%f7
	tpos	%icc,	0x0
	tsubcctv	%o4,	0x07F8,	%o1
loop_477:
	movrne	%o0,	0x3B3,	%l0
	fcmple16	%f24,	%f4,	%i2
	addccc	%g6,	%i3,	%i4
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 7:
!
!	Type l   	: 8
!	Type a   	: 12
!	Type x   	: 3
!	Type cti   	: 65
!	Type f   	: 66
!	Type i   	: 46
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


	EXIT_GOOD	/* test finish  */

/************************************************************************
   Test case data start
 ************************************************************************/
.data
user_data_start:
scratch_area:
.word 0x9E5E6F43
.word 0x9AC2A995
.word 0x25345D49
.word 0x714D5CB0
.word 0x1139B466
.word 0x5FFACA42
.word 0x5F28E456
.word 0xD038A618
.word 0xA5104FB1
.word 0xDE21D5D2
.word 0x50B2FC6F
.word 0xFF07D616
.word 0x5607B6CC
.word 0x3B0300B3
.word 0x6792B2FF
.word 0x92062FF8
.word 0x47B129FA
.word 0x49D4DC84
.word 0xB78F6199
.word 0x1ADD883D
.word 0x734EE3C9
.word 0x142D5BD3
.word 0x1F23A031
.word 0x6D4A88A4
.word 0x94132ED2
.word 0x1156D176
.word 0x643181E9
.word 0x0843AA73
.word 0xF38C8355
.word 0x935368CA
.word 0x66053775
.word 0xAFC06248
.word 0x72EBABB3
.word 0xD24B7246
.word 0xBAE0FDF3
.word 0x142EC172
.word 0x5FAA912D
.word 0x78772FA9
.word 0x62A56155
.word 0xEC9F4EA8
.word 0x7F9C5F92
.word 0xDE18D5FD
.word 0x3DCDD153
.word 0x84A4E95A
.word 0x1787A322
.word 0xCF164BE4
.word 0x06E6EBB5
.word 0xB303FF13
.word 0x2C3DB3CB
.word 0xCE4FFD0C
.word 0xF441E41A
.word 0xEE457E5C
.word 0xA81CD8FD
.word 0x3634E6EC
.word 0x76D85BAC
.word 0x9D97070F
.word 0x87DF163E
.word 0x3F45F580
.word 0xCA60AED1
.word 0x6159984D
.word 0x7AF05DD1
.word 0x127AC7F7
.word 0xFEA93285
.word 0x56161BA3
.end
